/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 *
 * Copyright (c) 2004 Arnaud Patard <arnaud.patard@rtp-net.org>
 * iPAQ H1940 touchscreen support
 *
 * ChangeLog
 *
 * 2004-09-05: Herbert Pötzl <herbert@13thfloor.at>
 *      - added clock (de-)allocation code
 *
 * 2005-03-06: Arnaud Patard <arnaud.patard@rtp-net.org>
 *      - h1940_ -> s3c2410 (this driver is now also used on the n30
 *        machines :P)
 *      - Debug messages are now enabled with the config option
 *        TOUCHSCREEN_S3C2410_DEBUG
 *      - Changed the way the value are read
 *      - Input subsystem should now work
 *      - Use ioremap and readl/writel
 *
 * 2005-03-23: Arnaud Patard <arnaud.patard@rtp-net.org>
 *      - Make use of some undocumented features of the touchscreen
 *        controller
 *
 * 2007-05-23: Harald Welte <laforge@openmoko.org>
 *      - Add proper support for S32440
 *
 * 2008-06-23: Andy Green <andy@openmoko.com>
 *      - removed averaging system
 *      - added generic Touchscreen filter stuff
 *
 * 2008-11-27: Nelson Castillo <arhuaco@freaks-unidos.net>
 *      - improve interrupt handling
 */

#include <linux/errno.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/input.h>
#include <linux/init.h>
#include <linux/serio.h>
#include <linux/timer.h>
#include <linux/kfifo.h>
#include <linux/delay.h>
#include <linux/platform_device.h>
#include <linux/clk.h>
#include <asm/io.h>
#include <asm/irq.h>

#include <asm/arch-s3c2410/regs-gpio.h>
#include <asm/arch-s3c2410/ts.h>
#include <asm/plat-s3c/regs-adc.h>

#include "ts_filter.h"

#undef CONFIG_TOUCHSCREEN_S3C2410_DEBUG
/* For ts.dev.id.version */
#define S3C2410TSVERSION	0x0101

#define TSC_SLEEP  (S3C2410_ADCTSC_PULL_UP_DISABLE | S3C2410_ADCTSC_XY_PST(0))

#define WAIT4INT(x)  (((x)<<8) | \
		     S3C2410_ADCTSC_YM_SEN | \
		     S3C2410_ADCTSC_YP_SEN | \
		     S3C2410_ADCTSC_XP_SEN | \
		     S3C2410_ADCTSC_XY_PST(3))

#define AUTOPST	     (S3C2410_ADCTSC_YM_SEN | \
		      S3C2410_ADCTSC_YP_SEN | \
		      S3C2410_ADCTSC_XP_SEN | \
		      S3C2410_ADCTSC_AUTO_PST | \
		      S3C2410_ADCTSC_XY_PST(0))

#define DEBUG_LVL    KERN_DEBUG

MODULE_AUTHOR("Arnaud Patard <arnaud.patard@rtp-net.org>");
MODULE_DESCRIPTION("s3c2410 touchscreen driver");
MODULE_LICENSE("GPL");

/*
 * Definitions & global arrays.
 */

static char *s3c2410ts_name = "s3c2410 TouchScreen";

#define TS_RELEASE_TIMEOUT (HZ >> 7 ? HZ >> 7 : 1) /* 8ms (5ms if HZ is 200) */
#define TS_EVENT_FIFO_SIZE (2 << 6) /* must be a power of 2 */

#define TS_STATE_STANDBY 0 /* initial state */
#define TS_STATE_PRESSED 1
#define TS_STATE_RELEASE_PENDING 2
#define TS_STATE_RELEASE 3

/*
 * Per-touchscreen data.
 */

struct s3c2410ts {
	struct input_dev *dev;
	struct ts_filter *tsf[MAX_TS_FILTER_CHAIN];
	int coords[2]; /* just X and Y for us */
	int is_down;
	int state;
	struct kfifo *event_fifo;
};

static struct s3c2410ts ts;

static void __iomem *base_addr;

/*
 * A few low level functions.
 */

static inline void s3c2410_ts_connect(void)
{
	s3c2410_gpio_cfgpin(S3C2410_GPG12, S3C2410_GPG12_XMON);
	s3c2410_gpio_cfgpin(S3C2410_GPG13, S3C2410_GPG13_nXPON);
	s3c2410_gpio_cfgpin(S3C2410_GPG14, S3C2410_GPG14_YMON);
	s3c2410_gpio_cfgpin(S3C2410_GPG15, S3C2410_GPG15_nYPON);
}

static void s3c2410_ts_start_adc_conversion(void)
{
	writel(S3C2410_ADCTSC_PULL_UP_DISABLE | AUTOPST,
	       base_addr + S3C2410_ADCTSC);
	writel(readl(base_addr + S3C2410_ADCCON) | S3C2410_ADCCON_ENABLE_START,
	       base_addr + S3C2410_ADCCON);
}

/*
 * Just send the input events.
 */

enum ts_input_event {IE_DOWN = 0, IE_UP};

static void ts_input_report(int event, int coords[])
{
#ifdef CONFIG_TOUCHSCREEN_S3C2410_DEBUG
	static char *s[] = {"down", "up"};
	struct timeval tv;

	do_gettimeofday(&tv);
#endif

	if (event == IE_DOWN) {
		input_report_abs(ts.dev, ABS_X, coords[0]);
		input_report_abs(ts.dev, ABS_Y, coords[1]);
		input_report_key(ts.dev, BTN_TOUCH, 1);
		input_report_abs(ts.dev, ABS_PRESSURE, 1);

#ifdef CONFIG_TOUCHSCREEN_S3C2410_DEBUG
		printk(DEBUG_LVL "T:%06d %6s (X:%03d, Y:%03d)\n",
		       (int)tv.tv_usec, s[event], coords[0], coords[1]);
#endif
	} else {
		input_report_key(ts.dev, BTN_TOUCH, 0);
		input_report_abs(ts.dev, ABS_PRESSURE, 0);

#ifdef CONFIG_TOUCHSCREEN_S3C2410_DEBUG
		printk(DEBUG_LVL "T:%06d %6s\n",
		       (int)tv.tv_usec, s[event]);
#endif
	}

	input_sync(ts.dev);
}

/*
 * Manage the state of the touchscreen.
 */

static void event_send_timer_f(unsigned long data);

static struct timer_list event_send_timer =
		TIMER_INITIALIZER(event_send_timer_f, 0, 0);

static void event_send_timer_f(unsigned long data)
{
	static int noop_counter;
	int event_type;

	while (__kfifo_get(ts.event_fifo, (unsigned char *)&event_type,
			   sizeof(int))) {
		int buf[2];

		switch (event_type) {
		case 'D':
			if (ts.state == TS_STATE_RELEASE_PENDING)
				/* Ignore short UP event */
				ts.state = TS_STATE_PRESSED;
			break;

		case 'U':
			ts.state = TS_STATE_RELEASE_PENDING;
			break;

		case 'P':
			if (ts.is_down) /* stylus_action needs a conversion */
				s3c2410_ts_start_adc_conversion();

			if (unlikely(__kfifo_get(ts.event_fifo,
						 (unsigned char *)buf,
						 sizeof(int) * 2)
				     != sizeof(int) * 2))
				goto ts_exit_error;

			ts_input_report(IE_DOWN, buf);
			ts.state = TS_STATE_PRESSED;
			break;

		default:
			goto ts_exit_error;
		}

		noop_counter = 0;
	}

	if (noop_counter++ >= 1) {
		noop_counter = 0;
		if (ts.state == TS_STATE_RELEASE_PENDING) {
			/* We delay the UP event for a
			 * while to avoid jitter. If we get a DOWN
			 * event we do not send it. */

			ts_input_report(IE_UP, NULL);
			ts.state = TS_STATE_STANDBY;

			if (ts.tsf[0])
				(ts.tsf[0]->api->clear)(ts.tsf[0]);
		}
	} else {
		mod_timer(&event_send_timer, jiffies + TS_RELEASE_TIMEOUT);
	}

	return;

ts_exit_error: /* should not happen unless we have a bug */
	printk(KERN_ERR __FILE__ ": event_send_timer_f failed\n");
}

/*
 * Manage interrupts.
 */

static irqreturn_t stylus_updown(int irq, void *dev_id)
{
	unsigned long data0;
	unsigned long data1;
	int event_type;

	data0 = readl(base_addr+S3C2410_ADCDAT0);
	data1 = readl(base_addr+S3C2410_ADCDAT1);

	ts.is_down = (!(data0 & S3C2410_ADCDAT0_UPDOWN)) &&
					    (!(data1 & S3C2410_ADCDAT0_UPDOWN));

	event_type = ts.is_down ? 'D' : 'U';

	if (unlikely(__kfifo_put(ts.event_fifo, (unsigned char *)&event_type,
		     sizeof(int)) != sizeof(int))) /* should not happen */
		printk(KERN_ERR __FILE__": stylus_updown lost event!\n");

	if (ts.is_down)
		s3c2410_ts_start_adc_conversion();
	else
		writel(WAIT4INT(0), base_addr+S3C2410_ADCTSC);

	mod_timer(&event_send_timer, jiffies + 1);

	return IRQ_HANDLED;
}

static irqreturn_t stylus_action(int irq, void *dev_id)
{
	int buf[3];

	/* grab the ADC results */
	ts.coords[0] = readl(base_addr + S3C2410_ADCDAT0) &
						    S3C2410_ADCDAT0_XPDATA_MASK;
	ts.coords[1] = readl(base_addr + S3C2410_ADCDAT1) &
						    S3C2410_ADCDAT1_YPDATA_MASK;

	if (ts.tsf[0]) { /* filtering is enabled, don't use raw directly */
		switch ((ts.tsf[0]->api->process)(ts.tsf[0], &ts.coords[0])) {
		case 0:	/*
			 * no real sample came out of processing yet,
			 * get another raw result to feed it
			 */
			s3c2410_ts_start_adc_conversion();
			return IRQ_HANDLED;

		case 1:	/* filters are ready to deliver a sample */
			(ts.tsf[0]->api->scale)(ts.tsf[0], &ts.coords[0]);
			break;
		case -1:
			/* error in filters, ignore the event */
			(ts.tsf[0]->api->clear)(ts.tsf[0]);
			writel(WAIT4INT(1), base_addr + S3C2410_ADCTSC);
			return IRQ_HANDLED;
		default:
			printk(KERN_ERR":stylus_action error\n");
		}
	}

	/* We use a buffer because want an atomic operation */
	buf[0] = 'P';
	buf[1] = ts.coords[0];
	buf[2] = ts.coords[1];

	if (unlikely(__kfifo_put(ts.event_fifo, (unsigned char *)buf,
		     sizeof(int) * 3) != sizeof(int) * 3))
		/* should not happen */
			printk(KERN_ERR":stylus_action error\n");

	writel(WAIT4INT(1), base_addr + S3C2410_ADCTSC);
	mod_timer(&event_send_timer, jiffies + 1);

	return IRQ_HANDLED;
}

static struct clk	*adc_clock;

/*
 * The functions for inserting/removing us as a module.
 */

static int __init s3c2410ts_probe(struct platform_device *pdev)
{
	int rc;
	struct s3c2410_ts_mach_info *info;
	struct input_dev *input_dev;
	int ret = 0;

	dev_info(&pdev->dev, "Starting\n");

	info = (struct s3c2410_ts_mach_info *)pdev->dev.platform_data;

	if (!info)
	{
		dev_err(&pdev->dev, "Hm... too bad: no platform data for ts\n");
		return -EINVAL;
	}

#ifdef CONFIG_TOUCHSCREEN_S3C2410_DEBUG
	printk(DEBUG_LVL "Entering s3c2410ts_init\n");
#endif

	adc_clock = clk_get(NULL, "adc");
	if (!adc_clock) {
		dev_err(&pdev->dev, "failed to get adc clock source\n");
		return -ENOENT;
	}
	clk_enable(adc_clock);

#ifdef CONFIG_TOUCHSCREEN_S3C2410_DEBUG
	printk(DEBUG_LVL "got and enabled clock\n");
#endif

	base_addr = ioremap(S3C2410_PA_ADC,0x20);
	if (base_addr == NULL) {
		dev_err(&pdev->dev, "Failed to remap register block\n");
		ret = -ENOMEM;
		goto bail0;
	}


	/* If we acutally are a S3C2410: Configure GPIOs */
	if (!strcmp(pdev->name, "s3c2410-ts"))
		s3c2410_ts_connect();

	if ((info->presc & 0xff) > 0)
		writel(S3C2410_ADCCON_PRSCEN |
		       S3C2410_ADCCON_PRSCVL(info->presc&0xFF),
						    base_addr + S3C2410_ADCCON);
	else
		writel(0, base_addr+S3C2410_ADCCON);

	/* Initialise registers */
	if ((info->delay & 0xffff) > 0)
		writel(info->delay & 0xffff,  base_addr + S3C2410_ADCDLY);

	writel(WAIT4INT(0), base_addr + S3C2410_ADCTSC);

	/* Initialise input stuff */
	memset(&ts, 0, sizeof(struct s3c2410ts));
	input_dev = input_allocate_device();

	if (!input_dev) {
		dev_err(&pdev->dev, "Unable to allocate the input device\n");
		ret = -ENOMEM;
		goto bail1;
	}

	ts.dev = input_dev;
	ts.dev->evbit[0] = BIT_MASK(EV_SYN) | BIT_MASK(EV_KEY) |
			   BIT_MASK(EV_ABS);
	ts.dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
	input_set_abs_params(ts.dev, ABS_X, 0, 0x3FF, 0, 0);
	input_set_abs_params(ts.dev, ABS_Y, 0, 0x3FF, 0, 0);
	input_set_abs_params(ts.dev, ABS_PRESSURE, 0, 1, 0, 0);

	ts.dev->name = s3c2410ts_name;
	ts.dev->id.bustype = BUS_RS232;
	ts.dev->id.vendor = 0xDEAD;
	ts.dev->id.product = 0xBEEF;
	ts.dev->id.version = S3C2410TSVERSION;
	ts.state = TS_STATE_STANDBY;
	ts.event_fifo = kfifo_alloc(TS_EVENT_FIFO_SIZE, GFP_KERNEL, NULL);
	if (IS_ERR(ts.event_fifo)) {
		ret = -EIO;
		goto bail2;
	}

	/* create the filter chain set up for the 2 coordinates we produce */
	ret = ts_filter_create_chain(
		pdev, (struct ts_filter_api **)&info->filter_sequence,
		(void *)&info->filter_config, ts.tsf, ARRAY_SIZE(ts.coords));
	if (ret)
		dev_info(&pdev->dev, "%d filter(s) initialized\n", ret);
	else /* this is OK, just means there won't be any filtering */
		dev_info(&pdev->dev, "Unfiltered output selected\n");

	if (ts.tsf[0])
		(ts.tsf[0]->api->clear)(ts.tsf[0]);
	else
		dev_info(&pdev->dev, "No filtering\n");

	/* Get irqs */
	if (request_irq(IRQ_ADC, stylus_action, IRQF_SAMPLE_RANDOM,
						    "s3c2410_action", ts.dev)) {
		dev_err(&pdev->dev, "Could not allocate ts IRQ_ADC !\n");
		iounmap(base_addr);
		ret = -EIO;
		goto bail3;
	}
	if (request_irq(IRQ_TC, stylus_updown, IRQF_SAMPLE_RANDOM,
			"s3c2410_action", ts.dev)) {
		dev_err(&pdev->dev, "Could not allocate ts IRQ_TC !\n");
		free_irq(IRQ_ADC, ts.dev);
		iounmap(base_addr);
		ret = -EIO;
		goto bail4;
	}

	dev_info(&pdev->dev, "successfully loaded\n");

	/* All went ok, so register to the input system */
	rc = input_register_device(ts.dev);
	if (rc) {
		ret = -EIO;
		goto bail5;
	}

	return 0;

bail5:
	free_irq(IRQ_TC, ts.dev);
	free_irq(IRQ_ADC, ts.dev);
	clk_disable(adc_clock);
	iounmap(base_addr);
	disable_irq(IRQ_TC);
bail4:
	disable_irq(IRQ_ADC);
bail3:
	ts_filter_destroy_chain(pdev, ts.tsf);
	kfifo_free(ts.event_fifo);
bail2:
	input_unregister_device(ts.dev);
bail1:
	iounmap(base_addr);
bail0:

	return ret;
}

static int s3c2410ts_remove(struct platform_device *pdev)
{
	disable_irq(IRQ_ADC);
	disable_irq(IRQ_TC);
	free_irq(IRQ_TC,ts.dev);
	free_irq(IRQ_ADC,ts.dev);

	if (adc_clock) {
		clk_disable(adc_clock);
		clk_put(adc_clock);
		adc_clock = NULL;
	}

	input_unregister_device(ts.dev);
	iounmap(base_addr);

	ts_filter_destroy_chain(pdev, ts.tsf);

	kfifo_free(ts.event_fifo);

	return 0;
}

#ifdef CONFIG_PM
static int s3c2410ts_suspend(struct platform_device *pdev, pm_message_t state)
{
	writel(TSC_SLEEP, base_addr+S3C2410_ADCTSC);
	writel(readl(base_addr+S3C2410_ADCCON) | S3C2410_ADCCON_STDBM,
	       base_addr+S3C2410_ADCCON);

	disable_irq(IRQ_ADC);
	disable_irq(IRQ_TC);

	clk_disable(adc_clock);

	return 0;
}

static int s3c2410ts_resume(struct platform_device *pdev)
{
	struct s3c2410_ts_mach_info *info =
		( struct s3c2410_ts_mach_info *)pdev->dev.platform_data;

	clk_enable(adc_clock);
	mdelay(1);

	if (ts.tsf[0])
		(ts.tsf[0]->api->clear)(ts.tsf[0]);

	enable_irq(IRQ_ADC);
	enable_irq(IRQ_TC);

	if ((info->presc&0xff) > 0)
		writel(S3C2410_ADCCON_PRSCEN |
		       S3C2410_ADCCON_PRSCVL(info->presc&0xFF),
						      base_addr+S3C2410_ADCCON);
	else
		writel(0,base_addr+S3C2410_ADCCON);

	/* Initialise registers */
	if ((info->delay & 0xffff) > 0)
		writel(info->delay & 0xffff,  base_addr+S3C2410_ADCDLY);

	writel(WAIT4INT(0), base_addr+S3C2410_ADCTSC);

	return 0;
}

#else
#define s3c2410ts_suspend NULL
#define s3c2410ts_resume  NULL
#endif

static struct platform_driver s3c2410ts_driver = {
       .driver         = {
	       .name   = "s3c2410-ts",
	       .owner  = THIS_MODULE,
       },
       .probe          = s3c2410ts_probe,
       .remove         = s3c2410ts_remove,
       .suspend        = s3c2410ts_suspend,
       .resume         = s3c2410ts_resume,

};

static struct platform_driver s3c2440ts_driver = {
       .driver         = {
	       .name   = "s3c2440-ts",
	       .owner  = THIS_MODULE,
       },
       .probe          = s3c2410ts_probe,
       .remove         = s3c2410ts_remove,
       .suspend        = s3c2410ts_suspend,
       .resume         = s3c2410ts_resume,

};

static int __init s3c2410ts_init(void)
{
	int rc;

	rc = platform_driver_register(&s3c2410ts_driver);
	if (rc < 0)
		return rc;

	rc = platform_driver_register(&s3c2440ts_driver);
	if (rc < 0)
		platform_driver_unregister(&s3c2410ts_driver);

	return rc;
}

static void __exit s3c2410ts_exit(void)
{
	platform_driver_unregister(&s3c2440ts_driver);
	platform_driver_unregister(&s3c2410ts_driver);
}

module_init(s3c2410ts_init);
module_exit(s3c2410ts_exit);

