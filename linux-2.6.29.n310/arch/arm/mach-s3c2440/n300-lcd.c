/* 
 * Copyright 2009 Vasily Khoruzhick <anarsoul at gmail dot com>
 *
 * LCD and BL power control driver for HP iPAQ RX1950
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/platform_device.h>
#include <linux/err.h>
#include <linux/delay.h>
#include <linux/gpio.h>
#include <linux/fb.h>
#include <linux/backlight.h>

#include <mach/hardware.h>
#include <mach/regs-gpio.h>
#include <mach/regs-gpioj.h>
#include <asm/arch-s3c2410/n300.h>
#define MEMSTART 0x20000000
#define MEMOFFS 0x00
#define MEMSZ 0xb20


#define LCD_DEBUG
#ifdef LCD_DEBUG
        #define DPRINTK(ARGS...)  printk(KERN_INFO "<%s>: ",__FUNCTION__);printk(ARGS)
        #define FN_IN printk(KERN_INFO "[%s]: start\n", __FUNCTION__)
        #define FN_OUT(n) printk(KERN_INFO "[%s]: end(%u)\n",__FUNCTION__, n)
        #define info(format, arg...)    PRINT_MSG(KMSG_MSG_LEVEL_INFORMATION, "", format...)
        #define dbg(format, arg...)     PRINT_MSG(KMSG_MSG_LEVEL_DEBUG, "", format...)
#else
        #define DPRINTK( x... )
        #define FN_IN
        #define FN_OUT(x)
        #define info(format, arg...)
        #define dbg(format, arg...)
#endif


static struct work_struct lock_work;

static struct platform_device n300_lcdpower = {
	.name = "n300-lcdpower",
	.id =  -1,
};

struct n300_lcdpower_data {
	struct platform_device	*pdev;
	struct platform_device	*owner;
	unsigned int		lcd_enabled;
	unsigned int		bl_enabled;
};

static void n300_lcd_power(int on) {
	s3c2410_gpio_setpin(S3C2410_GPC0, on);
}

static void n300_lock_work(struct work_struct *work) {
	int lock;
	DPRINTK("Entered\n");
	// check lock switch 
	lock = !(!gpio_get_value(S3C2410_GPG1));
	DPRINTK("LOCK = %d\n", lock);
	n300_backlight_power(lock);
}

static irqreturn_t screen_lock_isr(int irq, void *dev_id) {
	// when headphones jack is inserted GPG8 == 1 otherwise GPG8 == 0
	//n300_ext_control(s3c24xx_snd_devdata.codec);	

    schedule_work(&lock_work);
	return IRQ_HANDLED;
}

static int n300_lcdpower_probe(struct platform_device *pdev) {
	struct n300_lcdpower_data *lcd_power;
	int ret;

	lcd_power = kzalloc(sizeof(*lcd_power), GFP_KERNEL);
	if (!lcd_power) {
		dev_err(&pdev->dev, "no memory for state\n");
		ret = -ENOMEM;
		return ret;
	}

	printk("n300 lcd power platform driver\n");
	platform_set_drvdata(pdev, lcd_power);
	
	DPRINTK("n300_lcd_power(1)\n");
	n300_lcd_power(1);

	DPRINTK("n300_set_brightness(40)\n");
	n300_set_brightness(40);

	if (request_irq(IRQ_EINT9, screen_lock_isr, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
					"n300-lcdpower", pdev)) {
		printk("%s: can't get irq(%d).\n", __FUNCTION__, IRQ_EINT9);
		// FIXME: fix memory leak here! 
		return -ENOENT;
		}

	DPRINTK("INIT_WORK\n");
    INIT_WORK(&lock_work, n300_lock_work);

	return 0;
}

static int n300_lcdpower_remove(struct platform_device *pdev) {
	struct n300_lcdpower_data *lcd_power = platform_get_drvdata(pdev);

	n300_lcd_power(0);
	n300_backlight_power(0);
	kfree(lcd_power);
	return 0;
}

static int n300_lcdpower_suspend(struct platform_device * pdev, pm_message_t state) {
	n300_lcd_power(0);
	n300_backlight_power(0);
	return 0;
}

static int n300_lcdpower_resume(struct platform_device * pdev) {
	n300_lcd_power(1);
	n300_backlight_power(1);
	return 0;
}

static struct platform_driver n300_lcdpower_driver = {
	.driver		= {
		.name	= "n300-lcdpower",
		.owner	= THIS_MODULE,
	},
	.probe		= n300_lcdpower_probe,
	.remove		= __devexit_p(n300_lcdpower_remove),
	.suspend	= n300_lcdpower_suspend,
	.resume		= n300_lcdpower_resume,
};

static int __init n300_lcdpower_init(void) {

	platform_driver_register(&n300_lcdpower_driver);

	return 0;
}
module_init(n300_lcdpower_init);

static void __exit n300_lcdpower_exit(void) {
	platform_driver_unregister(&n300_lcdpower_driver);
}
module_exit(n300_lcdpower_exit);

MODULE_DESCRIPTION("LCD power control driver for n300");
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Vasily Khoruzhick <anarsoul at gmail dot com>");
