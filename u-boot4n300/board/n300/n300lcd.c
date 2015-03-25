/*
 * (C) Copyright 2002
 * Sysgo Real-Time Solutions, GmbH <www.elinos.com>
 * Marius Groeger <mgroeger@sysgo.de>
 *
 * (C) Copyright 2002
 * David Mueller, ELSOFT AG, <d.mueller@elsoft.ch>
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 */
#define DEBUG

#include <common.h>
#include <s3c2440.h>
#include <asm/arch/regs-gpio.h>
#include "n300.h"

/* 640x480x16 @ 61 Hz */
vidinfo_t panel_info = {
	vl_col:		640,
	vl_row:		480,
	vl_width:	48,		/* Width of display area in millimeters */
	vl_height:	64,		/* Height of display area in millimeters */
	vl_clkp:	CFG_HIGH,
	vl_oep:		CFG_HIGH,
	vl_hsp:		CFG_HIGH,
	vl_vsp:		CFG_HIGH,
	vl_dp:		CFG_HIGH,
	vl_bpix:	LCD_BPP,
	screen:		VIDEOMEMSTART,
};


/*
 * LCD Initialization
 * 
 */
int lcd_line_length;
int lcd_color_fg;
int lcd_color_bg;
void *lcd_base;					/* Start of framebuffer memory	*/
void *lcd_console_address;		/* Start of console buffer	*/

short console_col;
short console_row;

void lcd_ctrl_init (void *lcdbase) {
	sharp_lcd_init();
	//puts("lcd_ctrl_init ok\n");
	//setenv stdout serial;setenv stdin serial

}

void lcd_enable (char *lcd_is_enabled) {
	n300_set_brightness(40);
	//*lcd_is_enabled=1; /* but we miss serial output.. */
	*lcd_is_enabled=0;
}

void lcd_setcolreg (ushort regno, ushort red, ushort green, ushort blue) { 
	//puts("lcd_setcolreg\n");
}

static void lcd_disable (void) {
	n300_set_brightness(0);
}

/*
static void n300_lcd_off(cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]) {
	n300_set_brightness(0);
}
*/

/*
 * Calculate fb size for VIDEOLFB_ATAG. Size returned contains fb,
 * descriptors and palette areas.
 */
ulong calc_fbsize (void) {
	ulong size;
	
	//puts("calc_fbsize\n");
	size=panel_info.vl_col*panel_info.vl_row*LCD_BPP;
	//size+=PAGE_SIZE;
	return size;
}


/* -------------------------------------------------------------------------------
Sharp Panel - LS037V7DD05
*/

static inline void delay (unsigned long loops) {
	__asm__ volatile ("1:\n"
	  "subs %0, %1, #1\n"
	  "bne 1b":"=r" (loops):"0" (loops));
}

int goforce_init (void) {
//#define __REGi(x) (*(volatile unsigned int *)(x))

// GOFORCE_INIT -------
	VIDEO_BASE_REG32(0x00)=0x10;
	delay(0x32);
	VIDEO_BASE_REG32(0x04)=0x20;
	delay(0x32);
	VIDEO_BASE_REG32(0x1C)=0x00;
	delay(0x14);
	VIDEO_BASE_REG32(0x28)=0x00;
	delay(0x14);
	VIDEO_BASE_REG32(0x2C)=0x00;
	VIDEO_BASE_REG32(0x38)=0x00;
	VIDEO_BASE_REG32(0x40)=0x00;
	VIDEO_BASE_REG32(0x48)=0x09244920;
	VIDEO_BASE_REG32(0x50)=0x00;
	VIDEO_BASE_REG32(0x5C)=0x00;
	VIDEO_BASE_REG32(0x60)=0x1f;
	delay(0x32);
	VIDEO_BASE_REG32(0x0c)=0x2b;
	delay(0x04);
	VIDEO_BASE_REG32(0x08)=0x243f;
	delay(0x05);
	VIDEO_BASE_REG32(0x10)=0xec9;
	delay(0x05);
	VIDEO_BASE_REG32(0x100)=0x2105;
	VIDEO_BASE_REG32(0x104)=0x1;
	VIDEO_BASE_REG32(0x14)=0x4402;
	delay(0x05);
	VIDEO_BASE_REG32(0x18)=0x00;
	delay(0x05);
	VIDEO_BASE_REG32(0x1C)=0x320;
	VIDEO_BASE_REG32(0x20)=0x0;				// r4==VIDEO_BASE+0x20, r9==0
	VIDEO_BASE_REG32(0x2c)=0x1;				// r5=VIDEO_BASE+2c, r8=1
	VIDEO_BASE_REG32(0x30)=0x111;
	delay(0x05);
	VIDEO_BASE_REG32(0x34)=0x00;
	delay(0x05);
	VIDEO_BASE_REG32(0x48)=0x00;			// r6=VIDEO_BASE+0x48
	delay(0x05);
	VIDEO_BASE_REG32(0x50)=0x00;			// r7=VIDEO_BASE+0x50
	delay(0x05);
	VIDEO_BASE_REG32(0x64)=0x04;
	delay(0x05);
	VIDEO_BASE_REG32(0x108)=0xaa432793;
	VIDEO_BASE_REG32(0x10c)=0x24;
	// in samsung_lcd_init -> write to video mem 0x20020000
	VIDEO_BASE_REG32(0x20)=0x01;			// r4==VIDEO_BASE+0x20, r8==1
	// --- execute command for LCD ??
	VIDEO_BASE_REG32(0xa48)=0x00;
	VIDEO_BASE_REG32(0xa40)=0x00;
	// ------------------------------
	VIDEO_BASE_REG32(0xa4c)=0x3c0;
	// start of differences against lcd_init (goforceinit)
	VIDEO_BASE_REG32(0xa30)=0x01df0008;		// supipl-ref00
	VIDEO_BASE_REG32(0xa34)=0x027f0004;
	VIDEO_BASE_REG32(0xa0c)=0x1e80008;		// supipl-ref01
	VIDEO_BASE_REG32(0xa10)=0x02830004;
	VIDEO_BASE_REG32(0xa14)=0x401f0;
	VIDEO_BASE_REG32(0xa18)=0x00010287;		// supipl-ref02
	VIDEO_BASE_REG32(0xa00)=0x4044;
	VIDEO_BASE_REG32(0xa04)=0x03;
	VIDEO_BASE_REG32(0xa1c)=0x02be02bc;		// supipl-ref03
	VIDEO_BASE_REG32(0xa28)=0x58004;
	// --- execute command for LCD ??
	VIDEO_BASE_REG32(0xa40)=0x00;		// r9==0
	VIDEO_BASE_REG32(0xa48)=0x00;		// r9==0
	
	VIDEO_BASE_REG32(0xaa0)=0x200;			// supipl-ref04	
	VIDEO_BASE_REG32(0xb00)=0xa0000;		
	VIDEO_BASE_REG32(0xb04)=0x730000;		
	VIDEO_BASE_REG32(0xb08)=0x3f;		
	VIDEO_BASE_REG32(0xb10)=0x3000000;		
	VIDEO_BASE_REG32(0xb14)=0x55555555;		
	VIDEO_BASE_REG32(0xb18)=0x28051005;		
	VIDEO_BASE_REG32(0xb1c)=0x50512a00;		
	VIDEO_BASE_REG32(0xb2c)=0x537d2fca;		
	VIDEO_BASE_REG32(0xb20)=0x40000;		
	VIDEO_BASE_REG32(0xb30)=0x101;		
	VIDEO_BASE_REG32(0xb34)=0x00;		
	VIDEO_BASE_REG32(0xb3c)=0xfff3;		
	VIDEO_BASE_REG32(0xb40)=0x00;		
	VIDEO_BASE_REG32(0xb44)=0x00;		
	VIDEO_BASE_REG32(0xb4c)=0xbba;		
	VIDEO_BASE_REG32(0xb48)=0x04001541;		
	VIDEO_BASE_REG32(0xb54)=0x200;		
	VIDEO_BASE_REG32(0xb58)=0x55555555;		// r5 == 0x55555555
	VIDEO_BASE_REG32(0xba0)=0x00;
	VIDEO_BASE_REG32(0xbac)=0x00;
	VIDEO_BASE_REG32(0xb5c)=0x20;			// sl == 0x20
	delay(0x14);
	VIDEO_BASE_REG32(0xa00)=VIDEO_BASE_REG32(0xa00) | 0x03;
	delay(0x28);
	VIDEO_BASE_REG32(0x470)=0x4000;
	VIDEO_BASE_REG32(0x474)=0x10000;
	VIDEO_BASE_REG32(0x28)=0x25;
	 
	/*	Fills Video ? ------------------------------------
				  mov	r0, #VIDEO_BASE
				  mov	r1, #0
				  mov	r2, #0x96000
				  orr	r0, r0, #0x20000
				  bl	bcf44
test2:			  mov	r0, #VIDEO_BASE
				  orr	r0, r0, #0x20000
				  mov	r2, #0x96000
				  mov	r1, #0
				  bl	bcf44
	*/
	return 0;
}
	
int sharp_lcd_init (void) {

	VIDEO_BASE_REG32(0x00)=0x10;
	delay(0x32);
	VIDEO_BASE_REG32(0x04)=0x20;
	delay(0x32);
	VIDEO_BASE_REG32(0x1C)=0x00;
	delay(0x14);
	delay(0x14);
	VIDEO_BASE_REG32(0x28)=0x00;
	delay(0x14);
	VIDEO_BASE_REG32(0x2C)=0x00;
	VIDEO_BASE_REG32(0x38)=0x00;
	VIDEO_BASE_REG32(0x40)=0x00;
 	VIDEO_BASE_REG32(0x48)=0x09244920;
	VIDEO_BASE_REG32(0x50)=0x00;
	VIDEO_BASE_REG32(0x5C)=0x00;
	VIDEO_BASE_REG32(0x60)=0x1f;
	delay(0x32);
 	VIDEO_BASE_REG32(0x0c)=0x2b;
	delay(0x04);
	VIDEO_BASE_REG32(0x08)=0x243f;
	delay(0x05);
	VIDEO_BASE_REG32(0x10)=0xec9;
	delay(0x05);
	VIDEO_BASE_REG32(0x100)=0x2105;
	VIDEO_BASE_REG32(0x104)=0x1;
	VIDEO_BASE_REG32(0x14)=0x4402;
	delay(0x05);
	VIDEO_BASE_REG32(0x18)=0x00;
	delay(0x05);
	VIDEO_BASE_REG32(0x1C)=0x320;
	VIDEO_BASE_REG32(0x20)=0x0;				// r4==VIDEO_BASE+0x20, r9==0
	VIDEO_BASE_REG32(0x2c)=0x1;				// r5=VIDEO_BASE+2c, r8=1
	VIDEO_BASE_REG32(0x30)=0x111;
	delay(0x05);
	VIDEO_BASE_REG32(0x34)=0x00;
	delay(0x05);
	VIDEO_BASE_REG32(0x48)=0x00;			// r6=VIDEO_BASE+0x48
	delay(0x05);
	VIDEO_BASE_REG32(0x50)=0x00;			// r7=VIDEO_BASE+0x50
	delay(0x05);
	VIDEO_BASE_REG32(0x64)=0x04;
	delay(0x05);
	VIDEO_BASE_REG32(0x108)=0xaa432793;
	VIDEO_BASE_REG32(0x10c)=0x24;
	// in samsung_lcd_init -> write to video mem 0x20020000
	VIDEO_BASE_REG32(0x20)=0x01;			// r4==VIDEO_BASE+0x20, r8==1
	// --- execute command for LCD ??
	VIDEO_BASE_REG32(0xa48)=0x00;
	VIDEO_BASE_REG32(0xa40)=0x00;
	// ------------------------------
	VIDEO_BASE_REG32(0xa4c)=0x3c0;
	// start of differences against lcd_init (goforceinit)
	VIDEO_BASE_REG32(0xa30)=0x01df0050;
	VIDEO_BASE_REG32(0xa34)=0x027f0002;
	VIDEO_BASE_REG32(0xa0c)=0x2300050;
	VIDEO_BASE_REG32(0xa10)=0x02810002;
	VIDEO_BASE_REG32(0xa14)=0x402c4;
	VIDEO_BASE_REG32(0xa18)=0x20284;
	VIDEO_BASE_REG32(0xa00)=0x4000;
	VIDEO_BASE_REG32(0xa04)=0x03;
	VIDEO_BASE_REG32(0xa1c)=0x1e0000;		// supipl-ref03
	VIDEO_BASE_REG32(0xa20)=0x22801f;
	VIDEO_BASE_REG32(0xa24)=0xa127c05b;
	VIDEO_BASE_REG32(0xa70)=0x02bf01f3;
	VIDEO_BASE_REG32(0xa74)=0x8000;
	VIDEO_BASE_REG32(0xa2c)=0xc100c05b;
	VIDEO_BASE_REG32(0xa78)=0x01cc0127;
	VIDEO_BASE_REG32(0xa7c)=0x029801f3;
	VIDEO_BASE_REG32(0xa28)=0x38002;
	VIDEO_BASE_REG32(0xa40)=0x0;
	VIDEO_BASE_REG32(0xa48)=0x0;
	VIDEO_BASE_REG32(0xaa0)=0x208;
	VIDEO_BASE_REG32(0xa60)=0x3d2;
	VIDEO_BASE_REG32(0xa64)=0x20001c0;
	VIDEO_BASE_REG32(0xab8)=0xe01880;
	VIDEO_BASE_REG32(0xabc)=0x480410;
	VIDEO_BASE_REG32(0xb00)=0xa0000;
	VIDEO_BASE_REG32(0xb04)=0x04700202;
	VIDEO_BASE_REG32(0xb08)=0x3f;
	VIDEO_BASE_REG32(0xb10)=0x3400000;
	VIDEO_BASE_REG32(0xb14)=0x55555555;
	VIDEO_BASE_REG32(0xb18)=0x28051005;
	VIDEO_BASE_REG32(0xb1c)=0x50512a00;
	VIDEO_BASE_REG32(0xb2c)=0x537d2fca;
	VIDEO_BASE_REG32(0xb20)=0x40000;
	VIDEO_BASE_REG32(0xb30)=0x101;
	VIDEO_BASE_REG32(0xb34)=0x00;
	VIDEO_BASE_REG32(0xb3c)=0xfff3;
	VIDEO_BASE_REG32(0xb40)=0x00;
	VIDEO_BASE_REG32(0xb44)=0x00;
	VIDEO_BASE_REG32(0xb4c)=0xbba;
	VIDEO_BASE_REG32(0xb48)=0x04001541;
	VIDEO_BASE_REG32(0xb54)=0x2000;
	VIDEO_BASE_REG32(0xb58)=0x55555555;
	VIDEO_BASE_REG32(0xba0)=0x00;
	VIDEO_BASE_REG32(0xbac)=0x00;
	VIDEO_BASE_REG32(0xb5c)=0x20;
	delay(0x14);
	VIDEO_BASE_REG32(0xbc4)=0x45260010;
	VIDEO_BASE_REG32(0xbcc)=0x30257804;
	VIDEO_BASE_REG32(0xbd0)=0x44289104;
	VIDEO_BASE_REG32(0xbec)=0x59809020;
	
	VIDEO_BASE_REG32(0xa00)=0x4047;
	delay(0x28);
	return 0;
}

#if 0
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
#endif

static void n300_lcd_power(int on) {
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	
	S3C2440_GPIO_CONFIG (gpio->GPCCON, 0, GPIO_OUTPUT);
	if (on)
	  gpio->GPCDAT |= (1<<0);						//switch on
	else
	  gpio->GPCDAT &= ~(1<<0);						//switch off
}

int n300_backlight_power(int on) {
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	
	if (on) {
	  S3C2440_GPIO_CONFIG (gpio->GPBCON, 0, S3C2410_GPB0_TOUT0);
	  S3C2440_GPIO_PULLUP(gpio->GPBUP, 0, 0);
	  }
	else {
	  S3C2440_GPIO_CONFIG (gpio->GPBCON, 0, GPIO_OUTPUT);
	  S3C2440_GPIO_PULLUP(gpio->GPBUP, 0, 0);
	  }
	return 0;
}

#define S3C2410_TCFG_PRESCALER0_MASK (255<<0)
#define S3C2410_TCFG1_MUX0_MASK     (15<<0)
#define S3C2410_TCFG1_MUX0_DIV2     (0<<0)
#define S3C2410_TCON_T0RELOAD       (1<<3)
#define S3C2410_TCON_T0MANUALUPD  (1<<1)
#define S3C2410_TCON_T0START        (1<<0)
void n300_set_brightness(int tcmpb0) {
	S3C24X0_TIMERS * const timers = S3C24X0_GetBase_TIMERS();

	/* power on/off */
	n300_backlight_power(tcmpb0 ? 1 : 0);
	n300_lcd_power(tcmpb0 ? 1 : 0);
	
	//tcfg0=readl(S3C2410_TCFG0);
	//tcfg0 &= ~S3C2410_TCFG_PRESCALER0_MASK;
	//tcfg0 |= 0x18;	
	timers->TCFG0 &= ~S3C2410_TCFG_PRESCALER0_MASK;
	timers->TCFG0 |= 0x18;
	
	timers->TCFG1 &= ~S3C2410_TCFG1_MUX0_MASK;
	timers->TCFG1 |= S3C2410_TCFG1_MUX0_DIV2;
	//writel(0x31, S3C2410_TCNTB(0));
	timers->ch[0].TCNTB = 0x31;
	
	timers->TCON &= ~0x0F;
	timers->TCON |= (S3C2410_TCON_T0RELOAD | S3C2410_TCON_T0MANUALUPD);
	timers->ch[0].TCNTB = 0x31;
	timers->ch[0].TCMPB = tcmpb0;
	
	timers->TCON |= S3C2410_TCON_T0START;
	timers->TCON &= ~S3C2410_TCON_T0MANUALUPD;
}
/*
U_BOOT_CMD(
	lcd_off,	1,	0,	n300_lcd_off,
	"lcd_off - guess..\n",
	NULL
);
*/