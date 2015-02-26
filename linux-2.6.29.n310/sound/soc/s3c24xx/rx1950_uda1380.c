/*
 * rx1950.c  --  ALSA Soc Audio Layer
 *
 * Copyright (c) 2007 Roman Moravcik <roman.moravcik@gmail.com>
 *
 * Based on smdk2440.c and magician.c
 *
 * Authors: Graeme Gregory graeme.gregory@wolfsonmicro.com
 *          Philipp Zabel <philipp.zabel@gmail.com>
 *          Denis Grigoriev <dgreenday@gmail.com>
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

#include <asm/io.h>
#include <mach/hardware.h>
#include "../codecs/uda1380.h"
#include "s3c24xx-pcm.h"
#include "s3c24xx-i2s.h"

extern struct platform_device s3c_device_asic3;

#define RX1950_DEBUG
#ifdef RX1950_DEBUG
#define DBG(x...) printk(KERN_CRIT x)
#else
#define DBG(x...)
#endif

#define RX1950_HP_OFF    0
#define RX1950_HP_ON     1
#define RX1950_MIC       2

#define RX1950_SPK_ON    0
#define RX1950_SPK_OFF   1

static int rx1950_jack_func = RX1950_HP_OFF;
static int rx1950_spk_func = RX1950_SPK_ON;

static void rx1950_ext_control(struct snd_soc_codec *codec)
{
	if (rx1950_spk_func == RX1950_SPK_ON)
		snd_soc_dapm_enable_pin(codec, "Speaker");
	else
		snd_soc_dapm_disable_pin(codec, "Speaker");
	    
	/* set up jack connection */
	switch (rx1950_jack_func) {
		case RX1950_HP_OFF:
	    		snd_soc_dapm_disable_pin(codec, "Headphone Jack");
			snd_soc_dapm_disable_pin(codec, "Mic Jack");
			break;
		case RX1950_HP_ON:
			snd_soc_dapm_enable_pin(codec, "Headphone Jack");
			snd_soc_dapm_disable_pin(codec, "Mic Jack");
			break;
		case RX1950_MIC:
			snd_soc_dapm_disable_pin(codec, "Headphone Jack");
			snd_soc_dapm_enable_pin(codec, "Mic Jack");
			break;
	}
	snd_soc_dapm_sync(codec);
}

static int rx1950_startup(struct snd_pcm_substream *substream)
{
	struct snd_soc_pcm_runtime *rtd = substream->private_data;
	struct snd_soc_codec *codec = rtd->socdev->codec;

	DBG("Entered rx1950_startup\n");

	/* check the jack status at stream startup */
	rx1950_ext_control(codec);

	return 0;
}

static void rx1950_shutdown(struct snd_pcm_substream *substream)
{
//	struct snd_soc_pcm_runtime *rtd = substream->private_data;
//	struct snd_soc_codec *codec = rtd->socdev->codec;

	DBG("Entered rx1950_shutdown\n");
}

static int rx1950_hw_params(struct snd_pcm_substream *substream,
				struct snd_pcm_hw_params *params)
{
	struct snd_soc_pcm_runtime *rtd = substream->private_data;
	struct snd_soc_dai *cpu_dai = rtd->dai->cpu_dai;
	struct snd_soc_dai *codec_dai = rtd->dai->codec_dai;
	unsigned long iis_clkrate;
	int div, div256, div384, diff256, diff384, bclk;
	int ret;
	unsigned int rate=params_rate(params);

	DBG("Entered %s\n",__FUNCTION__);

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
		diff256 = (iis_clkrate / div256) - (rate * 256);
	}

	if (((iis_clkrate / div384) - (rate * 384)) <
		((rate * 384) - (iis_clkrate / (div384 + 1)))) {
		diff384 = (iis_clkrate / div384) - (rate * 384);
	} else {
		div384++;
		diff384 = (iis_clkrate / div384) - (rate * 384);
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

static struct snd_soc_ops rx1950_ops = {
	.startup 	= rx1950_startup,
	.shutdown 	= rx1950_shutdown,
	.hw_params 	= rx1950_hw_params,
};

static int rx1950_get_jack(struct snd_kcontrol *kcontrol,
			   struct snd_ctl_elem_value *ucontrol)
{
	ucontrol->value.integer.value[0] = rx1950_jack_func;
	return 0;
}

static int rx1950_set_jack(struct snd_kcontrol *kcontrol,
			   struct snd_ctl_elem_value *ucontrol)
{
	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);

	if (rx1950_jack_func == ucontrol->value.integer.value[0])
		return 0;

	rx1950_jack_func = ucontrol->value.integer.value[0];
	rx1950_ext_control(codec);
	return 1;
}

static int rx1950_get_spk(struct snd_kcontrol *kcontrol,
			  struct snd_ctl_elem_value *ucontrol)
{
	ucontrol->value.integer.value[0] = rx1950_spk_func;
	return 0;
}

static int rx1950_set_spk(struct snd_kcontrol *kcontrol,
			  struct snd_ctl_elem_value *ucontrol)
{
	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);

	if (rx1950_spk_func == ucontrol->value.integer.value[0])
		return 0;

	rx1950_spk_func = ucontrol->value.integer.value[0];
	if (rx1950_spk_func) {
		s3c2410_gpio_setpin(S3C2410_GPA1, 0);
	} else {
		s3c2410_gpio_setpin(S3C2410_GPA1, 1);
	}
	rx1950_ext_control(codec);
	return 1;
}

static int rx1950_spk_power(struct snd_soc_dapm_widget *w,
	       	struct snd_kcontrol *kcontrol, int event)
{
	s3c2410_gpio_cfgpin(S3C2410_GPA1, S3C2410_GPIO_OUTPUT);
	if (SND_SOC_DAPM_EVENT_ON(event) && (rx1950_spk_func == 0))
		s3c2410_gpio_setpin(S3C2410_GPA1, 1);
	else
		s3c2410_gpio_setpin(S3C2410_GPA1, 0);

	return 0;
}

/* rx1950 machine dapm widgets */
static const struct snd_soc_dapm_widget uda1380_dapm_widgets[] = {
	SND_SOC_DAPM_HP("Headphone Jack", NULL),
	SND_SOC_DAPM_MIC("Mic Jack", NULL),
	SND_SOC_DAPM_SPK("Speaker", rx1950_spk_power),
};

/* rx1950 machine audio_map */
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

static const char *jack_function[] = {"Off", "Headphone", "Mic"};
static const char *spk_function[] = {"On", "Off"};

static const struct soc_enum rx1950_enum[] = {
	SOC_ENUM_SINGLE_EXT(3, jack_function),
	SOC_ENUM_SINGLE_EXT(2, spk_function),
};

static const struct snd_kcontrol_new uda1380_rx1950_controls[] = {
	SOC_ENUM_EXT("Jack Function", rx1950_enum[0], rx1950_get_jack,
			rx1950_set_jack),
	SOC_ENUM_EXT("Speaker Function", rx1950_enum[1], rx1950_get_spk,
			rx1950_set_spk),
};

/*
 * Logic for a UDA1380 as attached to RX1950
 */
static int rx1950_uda1380_init(struct snd_soc_codec *codec)
{
	int i, err;

	DBG("Staring rx1950 init\n");

	/* NC codec pins */
	snd_soc_dapm_disable_pin(codec, "VOUTLHP");
	snd_soc_dapm_disable_pin(codec, "VOUTRHP");

	/* Add rx1950 specific controls */
	for (i = 0; i < ARRAY_SIZE(uda1380_rx1950_controls); i++) {
		if ((err = snd_ctl_add(codec->card,
				snd_soc_cnew(&uda1380_rx1950_controls[i],
				codec, NULL))) < 0)
			return err;
	}

	/* Add rx1950 specific widgets */
	for(i = 0; i < ARRAY_SIZE(uda1380_dapm_widgets); i++) {
		snd_soc_dapm_new_control(codec, &uda1380_dapm_widgets[i]);
	}

	/* Set up rx1950 specific audio path audio_mapnects */
	err = snd_soc_dapm_add_routes(codec, audio_map,
				      ARRAY_SIZE(audio_map));
	snd_soc_dapm_sync(codec);

	DBG("Ending rx1950 init\n");

	return 0;
}

/* s3c24xx digital audio interface glue - connects codec <--> CPU */
static struct snd_soc_dai_link s3c24xx_dai = {
	.name 		= "uda1380",
	.stream_name 	= "UDA1380",
	.cpu_dai 	= &s3c24xx_i2s_dai,
	.codec_dai 	= &uda1380_dai[UDA1380_DAI_DUPLEX],
	.init 		= rx1950_uda1380_init,
	.ops 		= &rx1950_ops,
};

/* rx1950 audio machine driver */
static struct snd_soc_card snd_soc_machine_rx1950 = {
	.name 		= "RX1950",
	.platform       = &s3c24xx_soc_platform,
	.dai_link 	= &s3c24xx_dai,
	.num_links 	= 1,
};
static struct uda1380_setup_data rx1950_uda1380_setup = {
	.i2c_address 	= 0x1a,
	.dac_clk 	= UDA1380_DAC_CLK_SYSCLK,
};
/* s3c24xx audio subsystem */
static struct snd_soc_device s3c24xx_snd_devdata = {
	.card 	        = &snd_soc_machine_rx1950,
	.codec_dev 	= &soc_codec_dev_uda1380,
	.codec_data 	= &rx1950_uda1380_setup,
};

static struct platform_device *s3c24xx_snd_device;

static int __init rx1950_init(void)
{
	int ret;

	/* enable codec's power */

	DBG("Pin ON\n");
	s3c2410_gpio_cfgpin(S3C2410_GPD1, S3C2410_GPD1_OUTP);
	s3c2410_gpio_setpin(S3C2410_GPD1, 0);
	
//	s3c2410_gpio_cfgpin(S3C2410_GPE15, S3C2410_GPE15_OUTP);
//	s3c2410_gpio_setpin(S3C2410_GPE15, 1);

//	s3c2410_gpio_cfgpin(S3C2410_GPE0, S3C2410_GPE0_I2SLRCK);
//	s3c2410_gpio_setpin(S3C2410_GPE3, 1);
	
//	s3c2410_gpio_cfgpin(S3C2410_GPE3, S3C2410_GPE3_I2SSDI);
//	s3c2410_gpio_setpin(S3C2410_GPE3, 1);

	//s3c2410_gpio_cfgpin(S3C2410_GPE3, S3C2410_GPIO_OUTPUT);
	//s3c2410_gpio_setpin(S3C2410_GPE3, 1);
	
//	s3c2410_gpio_cfgpin(S3C2410_GPC13, S3C2410_GPIO_OUTPUT);
//	s3c2410_gpio_setpin(S3C2410_GPC13, 1);
	
	s3c2410_gpio_cfgpin(S3C2410_GPA11, S3C2410_GPIO_OUTPUT);
	s3c2410_gpio_setpin(S3C2410_GPA11, 1);

//	s3c2410_gpio_cfgpin(S3C2410_GPD0, S3C2410_GPIO_OUTPUT);
//	s3c2410_gpio_setpin(S3C2410_GPD0, 0);

//	s3c2410_gpio_cfgpin(S3C2410_GPG12, S3C2410_GPIO_OUTPUT);
//	s3c2410_gpio_setpin(S3C2410_GPG12, 1);

//	s3c2410_gpio_cfgpin(S3C2440_GPJ0, S3C2410_GPIO_OUTPUT);
//	s3c2410_gpio_setpin(S3C2440_GPJ0, 0);
//	msleep(50);
//	s3c2410_gpio_setpin(S3C2440_GPJ0, 1);
//	msleep(50);
		       
	s3c24xx_snd_device = platform_device_alloc("soc-audio", -1);
	if (!s3c24xx_snd_device) {
		DBG("platform_dev_alloc failed\n");
		free_irq(IRQ_EINT19, NULL);
		return -ENOMEM;
	}

	platform_set_drvdata(s3c24xx_snd_device, &s3c24xx_snd_devdata);
	s3c24xx_snd_devdata.dev = &s3c24xx_snd_device->dev;
	ret = platform_device_add(s3c24xx_snd_device);

	if (ret) {
		DBG("ret = %i\n",ret);
		platform_device_put(s3c24xx_snd_device);
	}

	return ret;
}

static void __exit rx1950_exit(void)
{
	DBG("Pin OFF\n");

//	s3c2410_gpio_cfgpin(S3C2410_GPD1, S3C2410_GPD1_OUTP);
//	s3c2410_gpio_setpin(S3C2410_GPD1, 0);
//	s3c2410_gpio_cfgpin(S3C2410_GPE3, S3C2410_GPE3_I2SSDI);
//	s3c2410_gpio_setpin(S3C2410_GPE3, 0);
	//s3c2410_gpio_cfgpin(S3C2410_GPD1, S3C2410_GPIO_OUTPUT);
	//s3c2410_gpio_setpin(S3C2410_GPD1, 0);
	
	//s3c2410_gpio_cfgpin(S3C2410_GPE3, S3C2410_GPIO_OUTPUT);
	//s3c2410_gpio_setpin(S3C2410_GPE3, 0);
	
	//s3c2410_gpio_cfgpin(S3C2410_GPC13, S3C2410_GPIO_OUTPUT);
	//s3c2410_gpio_setpin(S3C2410_GPC13, 0);
	
	//s3c2410_gpio_cfgpin(S3C2410_GPA11, S3C2410_GPIO_OUTPUT);
	//s3c2410_gpio_setpin(S3C2410_GPA11, 0);
	platform_device_unregister(s3c24xx_snd_device);
}

module_init(rx1950_init);
module_exit(rx1950_exit);

/* Module information */
MODULE_AUTHOR("Roman Moravcik, <roman.moravcik@gmail.com>");
MODULE_DESCRIPTION("ALSA SoC RX1950");
MODULE_LICENSE("GPL");
