/*
 * n311_uda1380.c  --  ALSA Soc Audio Layer
 *
 * Copyright (c) 2007 Roman Moravcik <roman.moravcik@gmail.com>
 *
 * Based on smdk2440.c and magician.c
 *
 * Authors: Graeme Gregory graeme.gregory@wolfsonmicro.com
 *          Philipp Zabel <philipp.zabel@gmail.com>
 *          Denis Grigoriev <dgreenday@gmail.com>
 *          Vasily Khoruzhick <anarsoul@gmail.com>
 *          Alexander Polakov <polachok@gmail.com>
 *
 *  This program is free software; you can redistribute  it and/or modify it
 *  under  the terms of  the GNU General  Public License as published by the
 *  Free Software Foundation;  either version 2 of the  License, or (at your
 *  option) any later version.
 *
 */

#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/timer.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/platform_device.h>
#include <linux/spinlock.h>
#include <sound/core.h>
#include <sound/pcm.h>
#include <sound/soc.h>
#include <sound/soc-dapm.h>

#include <asm/mach-types.h>
#include <asm/hardware/scoop.h>
#include <asm/plat-s3c24xx/regs-iis.h>
#include <mach/regs-clock.h>
#include <mach/regs-gpio.h>
#include <mach/regs-gpioj.h>
#include <mach/audio.h>
#include <linux/gpio.h>
#include <asm/io.h>
#include <mach/hardware.h>
#include "../codecs/uda1380.h"
#include "s3c24xx-pcm.h"
#include "s3c24xx-i2s.h"

#undef N311_DEBUG
//#define N311_DEBUG
#ifdef N311_DEBUG
#define DBG(x...) printk(KERN_INFO x)
#else
#define DBG(x...)
#endif

enum { HP_OFF, HP_ON, HP_DUNNO };

static int sound_started;
static int jack;

static DECLARE_MUTEX(n311_power_mutex);
static DECLARE_MUTEX(n311_dapm_mutex);
static struct work_struct jack_work;


/* Can't do better on n311 :( */
static unsigned int rates[] = {
	16000, 48000,
};

static struct snd_pcm_hw_constraint_list hw_rates = {
	.count = ARRAY_SIZE(rates),
	.list = rates,
	.mask = 0,
};

/* Set n311-specific rate constraints, enable amplifier, etc */
static int n311_set_rate_constr(struct snd_pcm_substream *substream)
{
	struct snd_pcm_runtime *runtime = substream->runtime;

	runtime->hw.rate_min = hw_rates.list[0];
	runtime->hw.rate_max = hw_rates.list[hw_rates.count - 1];
	runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
	return snd_pcm_hw_constraint_list(runtime, 0,
					SNDRV_PCM_HW_PARAM_RATE,
					&hw_rates);
}

static int n311_spk_power(struct snd_soc_dapm_widget *w,
	       	struct snd_kcontrol *kcontrol, int event)
{
	if (SND_SOC_DAPM_EVENT_ON(event))
		gpio_set_value(S3C2410_GPD1, 1);
	else
		gpio_set_value(S3C2410_GPD1, 0);

	return 0;
}

static void n311_ext_control(struct snd_soc_codec *codec)
{
	DBG("%s entered: jack = %d sound_started = %d\n", __func__, jack, sound_started);

	down(&n311_dapm_mutex);
	if (!sound_started) {
                DBG("disabling everything");
		snd_soc_dapm_disable_pin(codec, "Speaker");
		snd_soc_dapm_disable_pin(codec, "Headphone Jack");
		snd_soc_dapm_disable_pin(codec, "Mic Jack");
		snd_soc_dapm_sync(codec);
	}
        else {
            switch (jack) {
                case HP_ON: 
                        DBG("disabling speaker\n");
			snd_soc_dapm_disable_pin(codec, "Speaker");
			snd_soc_dapm_enable_pin(codec, "Headphone Jack");
			snd_soc_dapm_disable_pin(codec, "Mic Jack");
                        break;
                case HP_OFF:
                        DBG("enabling speaker\n");
			snd_soc_dapm_enable_pin(codec, "Speaker");
			snd_soc_dapm_disable_pin(codec, "Headphone Jack");
			snd_soc_dapm_disable_pin(codec, "Mic Jack");
                        break;
                case HP_DUNNO:
                        DBG("lol i dunno\n");
		}
            snd_soc_dapm_sync(codec);
        }
	up(&n311_dapm_mutex);
}

static int n311_startup(struct snd_pcm_substream *substream)
{
	struct snd_soc_pcm_runtime *rtd = substream->private_data;
	struct snd_soc_codec *codec = rtd->socdev->codec;

	DBG("%s entered\n", __func__);

	n311_set_rate_constr(substream);
	jack = !(!gpio_get_value(S3C2410_GPG8));
	sound_started = 1;
	n311_ext_control(codec);

	return 0;
}

static void n311_shutdown(struct snd_pcm_substream *substream)
{
	/* Disable speaker amplifier here */
	struct snd_soc_pcm_runtime *rtd = substream->private_data;
	struct snd_soc_codec *codec = rtd->socdev->codec;

	DBG("%s entered\n", __func__);

	jack = 0;
	sound_started = 0;
	n311_ext_control(codec);
}

static int n311_hw_params(struct snd_pcm_substream *substream,
				struct snd_pcm_hw_params *params)
{
	struct snd_soc_pcm_runtime *rtd = substream->private_data;
	struct snd_soc_dai *cpu_dai = rtd->dai->cpu_dai;
	struct snd_soc_dai *codec_dai = rtd->dai->codec_dai;
	unsigned long iis_clkrate;
	int div, div256, div384, diff256, diff384, bclk;
	int ret;
	unsigned int rate=params_rate(params);

	//DBG("Entered %s\n",__FUNCTION__);

	iis_clkrate = s3c24xx_i2s_get_clockrate();
	DBG("iis_clkrate = %li\n", iis_clkrate);

	/* Using PCLK doesnt seem to suit audio particularly well on these cpu's
	 */

	div256 = iis_clkrate / (rate * 256);
	div384 = iis_clkrate / (rate * 384);

	if (((iis_clkrate / div256) - (rate * 256)) <
		((rate * 256) - (iis_clkrate / (div256 + 1)))) {
		diff256 = (iis_clkrate / div256) - (rate * 256);
	} else {
		div256++;
		diff256 = - (iis_clkrate / div256) + (rate * 256);
	}

	if (((iis_clkrate / div384) - (rate * 384)) <
		((rate * 384) - (iis_clkrate / (div384 + 1)))) {
		diff384 = (iis_clkrate / div384) - (rate * 384);
	} else {
		div384++;
		diff384 = - (iis_clkrate / div384) + (rate * 384);
	}

	DBG("diff256 %d, diff384 %d\n", diff256, diff384);

	if (diff256<=diff384) {
		DBG("Selected 256FS\n");
		div = div256;
		bclk = S3C2410_IISMOD_256FS;
	} else {
		DBG("Selected 384FS\n");
		div = div384;
		bclk = S3C2410_IISMOD_384FS;
	}

	/* set codec DAI configuration */
	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S |
		SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS);
	if (ret < 0)
		return ret;

	/* set cpu DAI configuration */
	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_I2S |
		SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS);
	if (ret < 0)
		return ret;

	/* set the audio system clock for DAC and ADC */
	ret = snd_soc_dai_set_sysclk(cpu_dai, S3C24XX_CLKSRC_PCLK,
		rate, SND_SOC_CLOCK_OUT);
	if (ret < 0)
		return ret;

	/* set MCLK division for sample rate */
	ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C24XX_DIV_MCLK, S3C2410_IISMOD_32FS );
	if (ret < 0)
		return ret;

	/* set BCLK division for sample rate */
	ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C24XX_DIV_BCLK, bclk);
	if (ret < 0)
		return ret;

	/* set prescaler division for sample rate */
	ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C24XX_DIV_PRESCALER,
		S3C24XX_PRESCALE(div,div));
	if (ret < 0)
		return ret;

	return 0;
}

static struct snd_soc_ops n311_ops = {
	.startup 	= n311_startup,
	.shutdown 	= n311_shutdown,
	.hw_params 	= n311_hw_params,
};

/* n311 machine dapm widgets */
static const struct snd_soc_dapm_widget uda1380_dapm_widgets[] = {
	SND_SOC_DAPM_HP("Headphone Jack", NULL),
	SND_SOC_DAPM_MIC("Mic Jack", NULL),
	SND_SOC_DAPM_SPK("Speaker", n311_spk_power),
};

/* n311 machine audio_map */
static const struct snd_soc_dapm_route audio_map[] = {
	/* headphone connected to VOUTLHP, VOUTRHP */
	{"Headphone Jack", NULL, "VOUTLHP"},
	{"Headphone Jack", NULL, "VOUTRHP"},

	/* ext speaker connected to VOUTL, VOUTR  */
	{"Speaker", NULL, "VOUTL"},
	{"Speaker", NULL, "VOUTR"},

	/* mic is connected to VINM */
	{"VINM", NULL, "Mic Jack"},
};

/*
 * Logic for a UDA1380 as attached to N311
 */
static int n311_uda1380_init(struct snd_soc_codec *codec)
{
	int err;

	DBG("Starting n311 init\n");

	/* NC codec pins */
	snd_soc_dapm_nc_pin(codec, "VOUTLHP");
	snd_soc_dapm_nc_pin(codec, "VOUTRHP");
	
	/* Add n311 specific widgets */
	snd_soc_dapm_new_controls(codec, uda1380_dapm_widgets,
				  ARRAY_SIZE(uda1380_dapm_widgets));

	/* Set up n311 specific audio path audio_mapnects */
	err = snd_soc_dapm_add_routes(codec, audio_map,
				      ARRAY_SIZE(audio_map));
        jack = HP_DUNNO;
        sound_started = 0;
	n311_ext_control(codec);

	DBG("Ending n311 init\n");

	return 0;
}

/* s3c24xx digital audio interface glue - connects codec <--> CPU */
static struct snd_soc_dai_link s3c24xx_dai = {
	.name 		= "uda1380",
	.stream_name 	= "UDA1380",
	.cpu_dai 	= &s3c24xx_i2s_dai,
	.codec_dai 	= &uda1380_dai,
	.init 		= n311_uda1380_init,
	.ops 		= &n311_ops,
};

/* n311 audio machine driver */
static struct snd_soc_card snd_soc_n311_uda1380 = {
	.name 		= "N311",
	.platform       = &s3c24xx_soc_platform,
	.dai_link 	= &s3c24xx_dai,
	.num_links 	= 1,
};

static void n311_codec_enable(int enable);

static struct uda1380_setup_data n311_uda1380_setup = {
	.i2c_address 	= 0x1a,
	.dac_clk 	= UDA1380_DAC_CLK_SYSCLK,
};

/* s3c24xx audio subsystem */
static struct snd_soc_device s3c24xx_snd_devdata = {
	.card           = &snd_soc_n311_uda1380,
	.codec_dev 		= &soc_codec_dev_uda1380,
	.codec_data 	= &n311_uda1380_setup,
};

static struct platform_device *s3c24xx_snd_device;

static void n311_jack_work(struct work_struct *work)
{
	DBG("Entered %s\n", __func__);
	n311_ext_control(s3c24xx_snd_devdata.codec);	
}

static irqreturn_t codec_enabled(int irq, void *dev_id)
{
	/* Check if jack is inserted, and report
	 * GPG8 == 1 if jack if inserted, otherwise GPG8 == 0
	 */
	jack = !(!gpio_get_value(S3C2410_GPG8));
	//n311_ext_control(s3c24xx_snd_devdata.codec);	

	/* Does not care about result */
	schedule_work(&jack_work);
	return IRQ_HANDLED;
}

static void n311_codec_enable(int enable)
{
	unsigned long flags;
	down(&n311_power_mutex);
	if (enable) {
		//if (gpio_get_value(S3C2410_GPA11))
		//	goto done;

		local_irq_save(flags);
        DBG("Pin ON\n");

        gpio_set_value(S3C2410_GPD1, 1);

        //gpio_set_value(S3C2410_GPA11, 1);

		local_irq_restore(flags);
	}
	else {
		//if (!gpio_get_value(S3C2410_GPA11))
		//	goto done;

		local_irq_save(flags);

		/* We'd like to issue codec reset before powerdown */
		mdelay(10);
		gpio_set_value(S3C2410_GPD1, 1);
		mdelay(10);
		gpio_set_value(S3C2410_GPD1, 0);
		mdelay(10);

		//gpio_set_value(S3C2410_GPA11, 1);
		//gpio_set_value(S3C2410_GPA11, 0);

		local_irq_restore(flags);
	}
done:
	up(&n311_power_mutex);
}

static int __init n311_init(void)
{
	int ret;

	s3c24xx_snd_device = platform_device_alloc("soc-audio", -1);
	if (!s3c24xx_snd_device) {
		DBG(KERN_ERR "platform_dev_alloc failed\n");
		return -ENOMEM;
	}
	if (request_irq(IRQ_EINT16, codec_enabled,
			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
			"snd_soc_n311_uda1380", s3c24xx_snd_device)) {
		DBG(KERN_ERR "n311_uda1380: can't get irq.\n");
		/* FIXME: fix memory leak here! */
		return -ENOENT;
	}
	/* enable codec's power */
	n311_codec_enable(1);

	platform_set_drvdata(s3c24xx_snd_device, &s3c24xx_snd_devdata);
	s3c24xx_snd_devdata.dev = &s3c24xx_snd_device->dev;
	ret = platform_device_add(s3c24xx_snd_device);

	if (ret) {
		DBG("ret = %i\n",ret);
		platform_device_put(s3c24xx_snd_device);
	}

        INIT_WORK(&jack_work, n311_jack_work);
	DBG("%s done\n", __func__);

	return ret;
}

static void __exit n311_exit(void)
{
	disable_irq(IRQ_EINT16);
	free_irq(IRQ_EINT16, s3c24xx_snd_device);
	platform_device_unregister(s3c24xx_snd_device);
	n311_codec_enable(0);
}

module_init(n311_init);
module_exit(n311_exit);

/* Module information */
MODULE_AUTHOR("Denis Grigoriev, Vasily Khoruzhick, Alexander Polakov");
MODULE_DESCRIPTION("ALSA SoC N311");
MODULE_LICENSE("GPL");
