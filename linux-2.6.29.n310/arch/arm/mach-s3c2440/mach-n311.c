/* linux/arch/arm/mach-s3c2440/mach-n311.c
 *
 * Copyright (c) 2008 blondquirk <blondquirk@gmail.com>
 * Copyright (c) 2009 polachok <polachok@gmail.com>
 * Heavily based on mach-g500.c and mach-rx1950.c
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#include <linux/kernel.h>
#include <linux/types.h>
#include <linux/interrupt.h>
#include <linux/list.h>
#include <linux/timer.h>
#include <linux/init.h>
#include <linux/serial_core.h>
#include <linux/platform_device.h>
#include <linux/ata_platform.h>
#include <linux/i2c.h>
#include <linux/io.h>
#include <linux/pwm_backlight.h>

#include <linux/fb.h>
#include <linux/lcd.h>
#include <linux/backlight.h>

#include <asm/mach/arch.h>
#include <asm/mach/map.h>
#include <asm/mach/irq.h>

#include <mach/hardware.h>
#include <mach/fb.h>
#include <mach/ts.h>
#include <asm/irq.h>
#include <asm/mach-types.h>
#include <asm/arch-s3c2410/n311.h>

#include <plat/regs-serial.h>
#include <plat/regs-timer.h>
#include <mach/regs-gpio.h>
#include <mach/regs-mem.h>
#include <mach/regs-lcd.h>
#include <mach/regs-irq.h>
#include <mach/regs-clock.h>
#include <mach/usb-control.h>
#include <mach/regs-dsc.h>

#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/nand_ecc.h>
#include <linux/mtd/partitions.h>

//#include <net/ax88796.h>

#include <plat/clock.h>
#include <plat/devs.h>
#include <plat/cpu.h>
#include <plat/irq.h>
#include <plat/pm.h>
#include <plat/mci.h>
#include <plat/nand.h>
#include <plat/regs-nand.h>
#include <plat/iic.h>

#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <linux/mtd/mtd.h>
#include <linux/mmc/mmc.h>
#include <linux/mmc/host.h>
#include <linux/gpio_keys.h>
#include <linux/input.h>

#include <linux/leds.h>
#include "n311-lcd.c"

#define UCON S3C2410_UCON_DEFAULT | S3C2410_UCON_UCLK
#define ULCON S3C2410_LCON_CS8 | S3C2410_LCON_PNONE | S3C2410_LCON_STOPB
#define UFCON S3C2410_UFCON_RXTRIG8 | S3C2410_UFCON_FIFOMODE

#define DEBUG_MACH_N311
#ifdef DEBUG_MACH_N311
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

static struct map_desc n310_iodesc[] __initdata = {
  
};
/*
static struct map_desc n310_iodesc[] __initdata = {
	// ISA IO Space map (memory space selected by A24)

	{
		.virtual	= (u32)S3C24XX_VA_ISA_WORD,
		.pfn		= __phys_to_pfn(S3C2410_CS2),
		.length		= 0x10000,
		.type		= MT_DEVICE,
	}, {
		.virtual	= (u32)S3C24XX_VA_ISA_WORD + 0x10000,
		.pfn		= __phys_to_pfn(S3C2410_CS2 + (1<<24)),
		.length		= SZ_4M,
		.type		= MT_DEVICE,
	}, {
		.virtual	= (u32)S3C24XX_VA_ISA_BYTE,
		.pfn		= __phys_to_pfn(S3C2410_CS2),
		.length		= 0x10000,
		.type		= MT_DEVICE,
	}, {
		.virtual	= (u32)S3C24XX_VA_ISA_BYTE + 0x10000,
		.pfn		= __phys_to_pfn(S3C2410_CS2 + (1<<24)),
		.length		= SZ_4M,
		.type		= MT_DEVICE,
	}
};
*/

/*
static struct s3c24xx_uart_clksrc n311_serial_clocks[] = {
	[0] = {
		.name   = "fclk",
		.divisor  = 9,
		.min_baud = 0,
		.max_baud = 0,
	},
};
*/

static struct s3c2410_uartcfg n300_uartcfgs[] = {
	[0] = {
		.hwport	     = 0,
		.flags	     = 0,
		.ucon	     = 0x3c5,
		.ulcon	     = 0x03,
		.ufcon	     = 0x51,
	},
	[1] = {
		.hwport	     = 1,
		.flags	     = 0,
		.ucon	     = 0x1c5,
		.ulcon	     = 0x03,
		.ufcon	     = 0x31,
	},
	/* bluetooth controller bcm2035 connected here */
	[2] = {
		.hwport	     = 2,
		.flags	     = 0,
		.ucon	     = 0x80c5,
		//.ucon	     = 0x8785,
		.ulcon	     = 0x03,
		//.ufcon	     = 0x61,
		.ufcon	     = 0x31,
		//.umcon	     = 0x01,
	}
};
/* tried to move to cmdline mtdparts, but wasn't able to do it 
 
   use -> make RECOVER_WM=1
 */
//#define RECOVER_WM

#ifdef RECOVER_WM
//#error fangana
static struct mtd_partition n300_nand_part[] = {
	[0] = {
		.name		= "WindowsMob",
		.offset		= 0,
		.size		= SZ_64M,			// 128 kB
		.mask_flags	= 0, 	//then is write protected 
		},
};
#else
static struct mtd_partition n300_nand_part[] = {
	[0] = {
		.name		= "u-boot",
		.offset		= 0,
		.size		= 0x20000,			// 128 kB
		.mask_flags	= 0, //if MTD_WRITEABLE then is write protected 
		},
	[1] = {
		.name		= "environ",
        .offset 	= 0x20000,
		.size		= 0x4000,
		.mask_flags	= 0,				// write allowed
		},
	[2] = {
		.name		= "uImage",
        .offset 	= 0x20000+0x4000,
		.size		= 0x300000,
		.mask_flags	= 0,
		},
	[3] = {
		.name		= "filesystem",
        .offset 	=0x20000+0x4000+0x300000,
		.size		= SZ_64M-(0x20000+0x4000+0x300000),
		.mask_flags	= 0,
		},
};
#endif

static struct s3c2410_nand_set n300_nand_sets[] = {
	[0] = {
		.name		= "n300_nand",
		.nr_chips	= 1,
		//.nr_map		= chip0_map,
		.nr_partitions	= ARRAY_SIZE(n300_nand_part),
		.partitions	= n300_nand_part,
		//.flags = S3C2410_NAND_BBT,
	},
};

/* original */
static struct s3c2410_platform_nand n300_nand_info = {
	/* Considering quicker clock */
	//.tacls		= 40,
	//.twrph0		= 120,
	//.twrph1		= 40,
	
	//.tacls		= 30,
	//.twrph0		= 60,
	//.twrph1		= 30,

	/* from u-boot
	#define TACLS 0
	#define TWRPH0 4
	#define TWRPH1 2	
	*/
 	//.tacls		= 1,
 	//.twrph0		= 30,
 	//.twrph1		= 10,
	// values from running linux-haret (remember the lower clock)
	//.tacls		= 20,
	//.twrph0		= 60,
	//.twrph1		= 20,
	// values from mini2440
	//.tacls		= 3,
	//.twrph0		= 7,
	//.twrph1		= 3,
	.tacls		= 30,
	.twrph0		= 60,
	.twrph1		= 30,
	.nr_sets	= ARRAY_SIZE(n300_nand_sets),
	.sets		= n300_nand_sets,
};

static struct s3c2410_ts_mach_info n311_ts_cfg = {
	.delay = 40000,
	.presc = 32,
};

static void s3c2410_mmc_def_setpower(unsigned char to, unsigned short vdd)
{
	//s3c2410_gpio_cfgpin(S3C2410_GPA17, S3C2410_GPIO_OUTPUT);
	//s3c2410_gpio_setpin(S3C2410_GPA17, (int)to);
}

static struct s3c24xx_mci_pdata n311_mmc_cfg = {
	.gpio_detect  = S3C2410_GPF1,
	.ocr_avail  = MMC_VDD_32_33,
	.set_power  = s3c2410_mmc_def_setpower,
};


static struct gpio_keys_button n311_buttons[] = {
	// see drivers/input/apm_power.c !
	//{KEY_SUSPEND,   S3C2410_GPF0, 1, "Power button", EV_PWR},
	{KEY_RESTART,   S3C2410_GPF0, 1, "Power button", EV_PWR},
	{KEY_RESTART, S3C2410_GPF2, 0, "Reset button", EV_PWR},
	//{KEY_SYSRQ, S3C2410_GPF2, 0, "Reset button"},
	//S3C2410_GPF3 is USB device supply present

	/* switch-type key: switch on/off display (IRQ9)
 	{KEY_COFFEE, S3C2410_GPG1, 1, "Key lock"}, 
	*/
	{KEY_A, S3C2410_GPF4, 1, "Home button",EV_KEY},
	{KEY_TAB, S3C2410_GPF5, 1, "Calendar button",EV_KEY},
	{KEY_C, S3C2410_GPF6, 1, "Contacts button",EV_KEY},
	{KEY_D, S3C2410_GPF7, 1, "Mail button",EV_KEY},
	{KEY_ENTER, S3C2410_GPG3, 1, "Ok button",EV_KEY},
	{KEY_LEFT, S3C2410_GPG4, 1, "Left button",EV_KEY},
	{KEY_DOWN, S3C2410_GPG5, 1, "Down button",EV_KEY},
	{KEY_UP, S3C2410_GPG6, 1, "Up button",EV_KEY},
	{KEY_RIGHT, S3C2410_GPG7, 1, "Right button",EV_KEY},
	//{KEY_E, S3C2410_GPG11, 1, "Case open button?", EV_KEY},
	//{KEY_PAUSE, S3C2410_GPD1, 0, "Case open pin", EV_PWR}, // irq 92 not allowed ??
};


static struct gpio_keys_platform_data n311_button_data = {
	.buttons	= n311_buttons,
	.nbuttons	= ARRAY_SIZE(n311_buttons),
};

static struct platform_device n311_button_device = {
	.name		= "gpio-keys",
	.id		= -1,
	.num_resources	= 0,
	.dev		= {.platform_data = &n311_button_data,}
};

static struct gpio_led n311_leds[] = {
	{
		.name = "blue-led",
		.gpio = S3C2410_GPD10,
		.active_low = 0,
		.default_trigger = "",
	},
	{
		.name = "green-battery",
		.gpio = S3C2410_GPD9,
		.active_low = 0,
		.default_trigger = NULL,
	},
};

static struct gpio_led_platform_data n311_led_data = {
	.num_leds =     ARRAY_SIZE(n311_leds),
	.leds =         n311_leds,
};

static struct platform_device n311_gpio_leds = {
	.name =         "leds-gpio",
	.id =           -1,
	.dev = {
		.platform_data = &n311_led_data,
	}
};

int n311_backlight_power(int on) {
	if (on) {
	  s3c2410_gpio_cfgpin(S3C2410_GPB0, S3C2410_GPB0_TOUT0);
	  s3c2410_gpio_pullup(S3C2410_GPB0, 0);
	  }
	else {
	  s3c2410_gpio_cfgpin(S3C2410_GPB0, S3C2410_GPB0_OUTP);
	  s3c2410_gpio_pullup(S3C2410_GPB0, 0);
	  s3c2410_gpio_setpin(S3C2410_GPB0, 0);
	  }
	return 0;
}
EXPORT_SYMBOL_GPL(n311_backlight_power);

void n311_set_brightness(int tcmpb0) {
	unsigned long tcfg0;
	unsigned long tcfg1;
	unsigned long tcon;

	{DPRINTK("Brightness val -> %d\n", tcmpb0);}

	/* configure power on/off */
	n311_backlight_power(tcmpb0 ? 1 : 0);

	tcfg0=readl(S3C2410_TCFG0);
	tcfg1=readl(S3C2410_TCFG1);

	tcfg0 &= ~S3C2410_TCFG_PRESCALER0_MASK;
	tcfg0 |= 0x18;

	tcfg1 &= ~S3C2410_TCFG1_MUX0_MASK;
	tcfg1 |= S3C2410_TCFG1_MUX0_DIV2;

	writel(tcfg0, S3C2410_TCFG0);
	writel(tcfg1, S3C2410_TCFG1);
	writel(0x31, S3C2410_TCNTB(0));

	tcon = readl(S3C2410_TCON);
	tcon &= ~0x0F;
	tcon |= S3C2410_TCON_T0RELOAD;
	tcon |= S3C2410_TCON_T0MANUALUPD;

	writel(tcon, S3C2410_TCON);
	writel(0x31, S3C2410_TCNTB(0));
	writel(tcmpb0, S3C2410_TCMPB(0));

	/* start the timer running */
	tcon |= S3C2410_TCON_T0START;
	tcon &= ~S3C2410_TCON_T0MANUALUPD;
	writel(tcon, S3C2410_TCON);
}


// enable (make menuconfig -> graphics ...) BACKLIGHT_GENERIC !!
static struct generic_bl_info n311_bl_machinfo = {
	.name =         "n311_bl_machinfo",
	.max_intensity = 0x2c,					//NOTE: will become backlight_device->props.max_brightness
	.default_intensity = 0x16,
	.set_bl_intensity = n311_set_brightness,
};

static struct platform_device n311_device_bl = {
	.name =         "generic-bl",
	.id =           -1,
	.dev = {
		.platform_data = &n311_bl_machinfo,
	}
};



void n311_udc_pullup(enum s3c2410_udc_cmd_e cmd) {
	switch (cmd) {
        case S3C2410_UDC_P_ENABLE :
		  //printk("S3C2410_UDC_P_ENABLE %d\n", cmd);
		  s3c2410_gpio_setpin(S3C2410_GPB3, 1);
		  break;
        case S3C2410_UDC_P_DISABLE :
		  //printk("S3C2410_UDC_P_DISABLE %d\n", cmd);
		  s3c2410_gpio_setpin(S3C2410_GPB3, 0);
		  break;
        case S3C2410_UDC_P_RESET :
		  {DPRINTK("S3C2410_UDC_P_RESET\n");}
		  break;
        default:
		  {DPRINTK("n311_udc_pullup unknown cmd -> %d\n", cmd);}
		  break;
	}
}
EXPORT_SYMBOL(n311_udc_pullup);

static struct s3c2410_udc_mach_info n311_udc_cfg __initdata = {
        .udc_command            = n311_udc_pullup,
        //.vbus_pin               = S3C2410_GPG?,
        //.vbus_pin_inverted      = 0,

/*	WINDOWS XP NOTE

Modules: usbnet cdc_ether rndis_host
Kernel Options:
 Device Drivers  --->
  [*] Network device support  --->
   USB Network Adapters  --->
    <M> Multi-purpose USB Networking Framework
    <M>   CDC Ethernet support (smart devices such as cable modems)
    <M>   Host for RNDIS and ActiveSync devices (EXPERIMENTAL

*/
};

static unsigned int power_state[2];

static void n300_usb_powercontrol(int port, int to) {
	power_state[port] = to;

	//0x56000014 0x 00 0-1 1 0100 0111
	if (power_state[port]) {
		printk("switch on (%d,%d)\n", port, to);		
		s3c2410_gpio_setpin(S3C2410_GPB9, 1);
		}
	else {
		printk("switch off (%d,%d)\n", port, to);
		s3c2410_gpio_setpin(S3C2410_GPB9, 0);
		}
}

static void n300_usb_enableoc(struct s3c2410_hcd_info *info, int on) {
  //return;
	if (on) {
	  s3c2410_gpio_cfgpin(S3C2410_GPB9, S3C2410_GPIO_OUTPUT);
	  printk("setting output %d\n", on);
	  }
	else {
	  s3c2410_gpio_cfgpin(S3C2410_GPB9, S3C2410_GPIO_INPUT);
	  printk("setting input %d\n", on);
	}
	  
//	s3c2410_gpio_setpin(S3C2410_GPB9, on);
}

static struct s3c2410_hcd_info n311_hcd_info = {
	.power_control	= n300_usb_powercontrol,
	.enable_oc	= n300_usb_enableoc,
};

/**
 * s3c_ohci_set_platdata - initialise OHCI device platform data
 * @info: The platform data.
 *
 * This call copies the @info passed in and sets the device .platform_data
 * field to that copy. The @info is copied so that the original can be marked
 * __initdata.
 */
void __init s3c_ohci_set_platdata(struct s3c2410_hcd_info *info)
{
	struct s3c2410_hcd_info *npd;

	npd = kmemdup(info, sizeof(struct s3c2410_hcd_info), GFP_KERNEL);
	if (!npd)
		printk(KERN_ERR "%s: no memory for platform data\n", __func__);

	s3c_device_usb.dev.platform_data = npd;
	//s3c_device_usb.dev.platform_data = &n311_hcd_info;
}


/* cxlabs */
static void n311_hw_init(void) {

	/* usb device */
	s3c2410_gpio_cfgpin(S3C2410_GPB3, S3C2410_GPIO_OUTPUT);
	//s3c2410_gpio_setpin(S3C2410_GPB3, 1);	//enable pull-up

	/* enable blue led */
	//s3c2410_gpio_setpin(S3C2410_GPD10, 1);	//switch on
 	s3c2410_gpio_cfgpin(S3C2410_GPD10, S3C2410_GPD10_OUTP);

	/* enable green led */
	//s3c2410_gpio_setpin(S3C2410_GPD9, 1);	//switch on
 	s3c2410_gpio_cfgpin(S3C2410_GPD9, S3C2410_GPD9_OUTP);

	/* Audio Speaker */
	s3c2410_gpio_cfgpin(S3C2410_GPD1, S3C2410_GPD1_OUTP);		//speaker enable
	/* input 4 headphones 1==inserted 0==not inserted*/
	s3c2410_gpio_cfgpin(S3C2410_GPG8, S3C2410_GPG8_EINT16); 	//headphones inserted test pin
	//s3c2410_gpio_cfgpin(S3C2410_GPA11, S3C2410_GPA11_OUT);	//audio enable
	
	/* switch-type key: switch on/off display (IRQ9) */
	/*
	if (gpio_get_value(S3C2410_GPG1)==0) {
	  DPRINTK("n311_backlight_power(0);\n");
	  n311_backlight_power(0);
	  }
	else {
	  DPRINTK("n311_backlight_power(1);\n");
	  n311_backlight_power(1);
	  }
	*/
	/* GOFORCE4000 Power ??*/
	s3c2410_gpio_pullup(S3C2410_GPC0, 0);
	s3c2410_gpio_setpin(S3C2410_GPC0, 0);
	s3c2410_gpio_cfgpin(S3C2410_GPC0, S3C2410_GPC0_OUTP);
	
	/* http://lists.denx.de/pipermail/u-boot/2011-May/092412.html */
	/* enable NAND flash writing */
	s3c2410_gpio_setpin(S3C2410_GPA11, 1);		// switch on (note GPA pins haven't pullups mode)
 	s3c2410_gpio_cfgpin(S3C2410_GPA11, S3C2410_GPIO_OUTPUT);
	//GPADAT |= (1 << 11);
	
	/* set NAND controller pin as input*/
	s3c2410_gpio_setpin(S3C2410_GPG13, 0);
	s3c2410_gpio_pullup(S3C2410_GPG13, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPG13, S3C2410_GPIO_INPUT);
	s3c2410_gpio_setpin(S3C2410_GPG14, 0);
	s3c2410_gpio_pullup(S3C2410_GPG14, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPG14, S3C2410_GPIO_INPUT);
	s3c2410_gpio_setpin(S3C2410_GPG15, 0);
	s3c2410_gpio_pullup(S3C2410_GPG15, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPG15, S3C2410_GPIO_INPUT);
	
	/* give GPA pins to NAND controller*/
	s3c2410_gpio_cfgpin(S3C2410_GPA17, S3C2410_GPA17_CLE);
	s3c2410_gpio_cfgpin(S3C2410_GPA18, S3C2410_GPA18_ALE);
	

	/* N30 output 0=BlueTooth chip disabled, 1=enabled */
	/* GPH6/7  N30 BlueTooth serial port */
	/* N300 is key down button */
 	//s3c2410_gpio_cfgpin(S3C2410_GPG5, S3C2410_GPG5_OUTP);
	//s3c2410_gpio_setpin(S3C2410_GPG5, 1);	//switch on

	/* N300 serial port0 ? */
	/* Linux values-> control register 56000070:  0000a0aa */
	/* Linux values-> data register 56000074:  000002ff */
	s3c2410_gpio_cfgpin(S3C2410_GPH2, S3C2410_GPH2_TXD0);
	s3c2410_gpio_pullup(S3C2410_GPH2, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPH3, S3C2410_GPH3_RXD0);
	s3c2410_gpio_pullup(S3C2410_GPH3, 1);	
	
	s3c2410_gpio_cfgpin(S3C2410_GPH4, S3C2410_GPH4_TXD1);
	s3c2410_gpio_pullup(S3C2410_GPH4, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPH5, S3C2410_GPH5_RXD1);
	s3c2410_gpio_pullup(S3C2410_GPH5, 1);	

	s3c2410_gpio_cfgpin(S3C2410_GPH6, S3C2410_GPH6_TXD2);
	s3c2410_gpio_pullup(S3C2410_GPH6, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPH7, S3C2410_GPH7_RXD2);
	s3c2410_gpio_pullup(S3C2410_GPH7, 1);	
	
	/*
	Power Button
	GPIOS GPFDAT: GPF0(160)=0 001.515 GPIOS GPFDAT: GPF0 (160) = 0
	GPIOS GPFDAT: GPF0(160)=1 001.658 GPIOS GPFDAT: GPF0 (160) = 1
	GPIOS GPCDAT: GPC14(78)=1 ????? ??????? ?????????? 001.667 GPIOS GPCDAT: GPC14 (78) = 1 then the unit is off
	*/

	/* USB Host power */
	s3c2410_gpio_setpin(S3C2410_GPB9, 0);		/* keep it OFF on boot */
	s3c2410_gpio_cfgpin(S3C2410_GPB9, S3C2410_GPIO_OUTPUT);
	
	/*
	s3c2410_modify_misccr(S3C2410_MISCCR_USBHOST |
				  S3C2410_MISCCR_USBSUSPND0 |
				  S3C2410_MISCCR_USBSUSPND1, 0x0);
	*/
	s3c2440_set_dsc(S3C2440_DSC1_NFC, S3C2440_DSC1_NFC_8mA);
	
	/* Case opened switch */
	/*
	s3c2410_gpio_setpin(S3C2410_GPG11, 0);
	s3c2410_gpio_pullup(S3C2410_GPG11, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPG11, S3C2410_GPIO_INPUT);
	*/

	/* Disable Unused Clocks to peripherals*/
	//__raw_writel(0xf7ffd0, 0x4C00000C);		// !! BAD !!
}

static struct platform_device *n311_devices[] __initdata = {
	&s3c_device_nand,
	&s3c_device_rtc,
	&s3c_device_lcd,
	&s3c_device_wdt,
	&s3c_device_i2c0,
	&s3c_device_iis,
	&s3c_device_usb,
	&s3c_device_usbgadget,
	&s3c_device_ts,
	&s3c_device_sdi,
	&n311_lcdpower,
	&n311_button_device,
	&n311_gpio_leds,
	&n311_device_bl,
};

static void __init n300_map_io(void)
{
	s3c24xx_init_io(n310_iodesc, ARRAY_SIZE(n310_iodesc));
  	n311_hw_init();
	s3c24xx_init_clocks(16934000);
	s3c24xx_init_uarts(n300_uartcfgs, ARRAY_SIZE(n300_uartcfgs));
	s3c_device_nand.dev.platform_data = &n300_nand_info;
}

static void __init n311_init_irq(void) {
	s3c24xx_init_irq();
}
static void __init n311_init_machine(void)
{
	s3c_device_sdi.dev.platform_data = &n311_mmc_cfg;
	set_s3c2410ts_info(&n311_ts_cfg);
	s3c24xx_udc_set_platdata(&n311_udc_cfg);
	s3c_i2c0_set_platdata(NULL);
	s3c_ohci_set_platdata(&n311_hcd_info);
	//set_s3c2410bl_info(&n311_bl_cfg);
	platform_add_devices(n311_devices, ARRAY_SIZE(n311_devices));
	s3c2410_pm_init();
}


MACHINE_START(N311, "N311")
	/* Maintainer: blondquirk <blondquirk@gmail.com> */
	.phys_io	= S3C2410_PA_UART,
	.io_pg_offst	= (((u32)S3C24XX_VA_UART) >> 18) & 0xfffc,
	.boot_params	= S3C2410_SDRAM_PA + 0x100,
	.timer			= &s3c24xx_timer,
	.init_machine	= n311_init_machine,
	.init_irq		= n311_init_irq,
	.map_io			= n300_map_io,
MACHINE_END

/*
---------------------------------------------------------------------------
GPA0	GPA1	GPA2	GPA3	GPA4	GPA5	GPA6	GPA7	GPA8	GPA9	GPA10	GPA11	GPA12	GPA13	GPA14	GPA15	GPA16	GPA17	GPA18	GPA19
TBD
		TBD
				TBD
						TBD
																						n311_codec_enable
																								enable_NAND_write
																																		mmc_def_setpower

GPB0	GPB1	GPB2	GPB3	GPB4	GPB5	GPB6	GPB7	GPB8	GPB9	GPB10
backlight_brightness
		TBD
				TBD
						USB device - enable pull-up
								TBD
										TBD
												TBD
														TBD
																USB host - power supply
																		TBD

GPC0	GPC1	GPC2	GPC3	GPC4	GPC5	GPC6	GPC7	GPC8	GPC9	GPC10	GPC11	GPC12	GPC13	GPC14	GPC15
GoForce Enable ?
LCD enable ?
		TBD
				TBD
						TBD
														AC supply present


GPD0	GPD1	GPD2	GPD3	GPD4	GPD5	GPD6	GPD7	GPD8	GPD9	GPD10	GPD11	GPD12	GPD13	GPD14	GPD15
TBD
		Enable Speaker Output
				TBD
						TBD
												switch
																		enable green led
																				enable blue led

GPE0	GPE1	GPE2	GPE3	GPE4	GPE5	GPE6	GPE7	GPE8	GPE9	GPE10	GPE11	GPE12	GPE13	GPE14	GPE15
										GPE5_SDCLK
												GPE6_SDCMD
														GPE7_SDDAT0
																GPE8_SDDAT1
																		GPE9_SDDAT2
																				GPE10_SDDAT3
																						a
																								b
																										c
																												IIC_SCL
																														IIC_SDA
GPF0	GPF1	GPF2	GPF3	GPF4	GPF5	GPF6	GPF7	-- no more I/O for GPF
Power button
		detect MMC
				Reset button
						USB device supply present
								Home button
										Calendar button
												Contacts button
														Mail button

GPG0	GPG1	GPG2	GPG3	GPG4	GPG5	GPG6	GPG7	GPG8	GPG9	GPG10	GPG11	GPG12	GPG13	GPG14	GPG15	
TBD
		Key lock
				TBD
						Ok button
								Left button
										Down button
												Up button
														Right button
																input 4 headphones
																		TBD
																				TBD
																						TBD
																		
																								TS_XMON
																										TS_nXPON
																												TS_YMON
																														TS_nYPON

GPH0	GPH1	GPH2	GPH3	GPH4	GPH5	GPH6	GPH7	GPH8	GPH9	GPH10
				TXD0
						RXD0
								TXD1
										RXD1
												TXD2
														RXD2
GPJ0	GPJ1
---------------------------------------------------------------------------------------------------------------------------------*/
