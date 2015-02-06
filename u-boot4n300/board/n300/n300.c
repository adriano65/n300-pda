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

#include <common.h>
#include <s3c2440.h>

DECLARE_GLOBAL_DATA_PTR;

#define FCLK_SPEED 1

#if FCLK_SPEED==1		/* Fout = 399.65 MHz */
	#define M_MDIV	0x6e
	#define M_PDIV	0x3
	#define M_SDIV	0x1
#endif

#define USB_CLOCK 1

#if USB_CLOCK==0
	#define U_M_MDIV	0xA1
	#define U_M_PDIV	0x3
	#define U_M_SDIV	0x1
#elif USB_CLOCK==1
	#define U_M_MDIV	0x3C
	#define U_M_PDIV	0x4
	#define U_M_SDIV	0x2
#endif

int sharp_lcd_init (void);
void n300_set_brightness(int tcmpb0);

static inline void delay (unsigned long loops)
{
	__asm__ volatile ("1:\n"
	  "subs %0, %1, #1\n"
	  "bne 1b":"=r" (loops):"0" (loops));
}

/* If HDIVN is not 0, the CPU bus mode has to be changed from 
the fast bus mode to the asynchronousbus mode using following 
instructions(S3C2440 does not support synchronous bus mode).
If HDIVN is not 0 and the CPU bus mode is the fast bus mode, 
the CPU will operate by the HCLK.This feature can be used to 
change the CPU frequency as a half or more without affecting the 
HCLKand PCLK. 
Clock modes              iA      nF
    ------------------------------------------
    FastBus mode          0       0
    Synchronous           0       1
    Reserved              1       0
    Asynchronous          1       1 
*/
static inline void MMU_SetAsyncBusMode() {
        __asm__ ("mrc p15,0,r0,c1,c0,0\n"
				 "orr r0,r0,#0xc0000000 /*R1_nF:OR:R1_iA*/\n"
				 "mcr p15,0,r0,c1,c0,0");
}

static inline void MMU_SetFastBusMode() {
        __asm__ ("mrc p15,0,r0,c1,c0,0\n"
				 "bic r0,r0,#0xc0000000 /*R1_nF:OR:R1_iA*/\n"
				 "mcr p15,0,r0,c1,c0,0");
}

/*
 * Miscellaneous platform dependent initialisations
 */
void raise() {}

void abort() {}

int board_init (void) {

#if 0
	S3C24X0_CLOCK_POWER * const clk_power = S3C24X0_GetBase_CLOCK_POWER();

	/* to reduce PLL lock time, adjust the LOCKTIME register */
	clk_power->LOCKTIME = 0xFFFFFFFF;

	/* configure UPLL */
	clk_power->UPLLCON = ((U_M_MDIV << 12) + (U_M_PDIV << 4) + U_M_SDIV);

	/* some delay between MPLL and UPLL */
	delay (8000);

	/* configure MPLL */
	clk_power->MPLLCON = ((M_MDIV << 12) + (M_PDIV << 4) + M_SDIV);

	/* set up the I/O ports */
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	
	/* enable NAND writings */
	//"GPADAT |= (1 << 11)"
	gpio->GPADAT = 0xfe000800;
	gpio->GPACON = 0x005EA71F;

	gpio->GPBUP = 0x00001FFF;
	gpio->GPBDAT = 0x00000146;
	gpio->GPBCON = 0x00155455;
	
	gpio->GPCUP = 0x0000FFFF;
	gpio->GPCDAT = 0x12;
	gpio->GPCCON = 0x55551515;

	gpio->GPDUP = 0x0000EFFF;
	gpio->GPDDAT = 0x05514514;
	gpio->GPDCON = 0x00001000;
	
	gpio->GPEUP = 0x0000FFFF;
	//S3C2440_GPIO_PULLUP (GPEUP_, 6, GPIO_PULLUP_ENABLE);

	gpio->GPEDAT = 0x0;
	gpio->GPECON = 0x05555555;
	
	gpio->GPFUP = 0xff;
	gpio->GPFDAT = 0x00; 
	gpio->GPFCON = 0x02;
	
	gpio->GPGUP = 0x0000FFFF;
	gpio->GPGDAT= 0x00;
	gpio->GPGCON =0x01150010;
	
	gpio->GPHUP = 0x000007FF;
	gpio->GPHDAT= 0x200;
	gpio->GPHCON =0x0016faaa;			/* from SMDK24440 u-boot mod */

	gpio->GPJUP = 0x00001FFF;
	gpio->GPJDAT= 0x00001FFF;
	gpio->GPJCON =0x55555555;
	
/*
	s3c2410_gpio_cfgpin(S3C2410_GPH2, S3C2410_GPH2_TXD0);
	s3c2410_gpio_pullup(S3C2410_GPH2, 1);
	s3c2410_gpio_cfgpin(S3C2410_GPH3, S3C2410_GPH3_RXD0);
	s3c2410_gpio_pullup(S3C2410_GPH3, 1);	
 */	
#endif
	
	sharp_lcd_init();

	n300_set_brightness(50);

	/* arch number of N300-Board for linux */
	gd->bd->bi_arch_number = MACH_TYPE_N300;		// 0x4E0

	/* address of boot parameters */
	gd->bd->bi_boot_params = PHYS_SDRAM_1 + 0x100;
	
	//gd->flags |= GD_FLG_RELOC;      /* tell others: relocation done */

	return 0;
}

int dram_init (void) {
	gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
	gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;

	return 0;
}

/*
int dram_init_new(void)
{
	int i;
	u32 addr;

	for (i = 0; i < CONFIG_NR_DRAM_BANKS; i++) {
		addr = CONFIG_SYS_SDRAM_BASE + (i * SDRAM_BANK_SIZE);
		gd->ram_size += get_ram_size((long *)addr, SDRAM_BANK_SIZE);
	}
	return 0;
}
*/
int print_cpuinfo (void) {
	puts ("cpuinfo: TBD\n");
	return (0);
  }

void get_board_serial(struct tag_serialnr *serialnr) {
  serialnr->high=1;
  serialnr->low=14;
}

/*
Sharp Panel - LS037V7DD05
*/

//get_board_rev
#define GOFORCEMEMSTART 	0x20000000
#define MEMSZ 				0xb20
#define GOFORCE_CH0 		GOFORCEMEMSTART+0x0000
#define GOFORCE_CH0_CMDFIFO GOFORCE_CH0+0x800
#define GOFORCE_ASYNCREG 	GOFORCE_CH0+0x2000
#define GOFORCE_SYNCREG 	GOFORCE_CH0+0x3000


#define VIDEO_BASE_REG32(x) (*(volatile unsigned long *)(0x20000000+x))
#define VIDEO_BASE          VIDEO_BASE_REG32(0x0)

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



int n300_backlight_power(int on) {
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	if (on) {
	  // -------------------------- switch ON LCD
	  //s3c2410_gpio_cfgpin(S3C2410_GPB0, S3C2410_GPB0_TOUT0);
	  S3C2440_GPIO_CONFIG (gpio->GPBCON, 0, GPIO_FUNCTION);
	  //gpio->GPBCON &= ~0x00000003;
	  //gpio->GPBCON |= 0x00000002;
	  
	  //s3c2410_gpio_setpin(S3C2410_GPC0, on)
	  S3C2440_GPIO_PULLUP(gpio->GPCUP, 0, 0);
	  gpio->GPCDAT |= 1;
	  S3C2440_GPIO_CONFIG (gpio->GPCCON, 0, GPIO_OUTPUT);
	  
	  }
	else {
	  S3C2440_GPIO_CONFIG (gpio->GPBCON, 0, GPIO_OUTPUT);
	  
	  gpio->GPCDAT &= ~1;
	  
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
	unsigned long tcfg0;
	unsigned long tcfg1;
	unsigned long tcon;
	
	S3C24X0_TIMERS * const timers = S3C24X0_GetBase_TIMERS();

	/* power on/off */
	n300_backlight_power(tcmpb0 ? 1 : 0);
	
	tcfg0 = timers->TCFG0;
	tcfg0 &= ~S3C2410_TCFG_PRESCALER0_MASK;
	tcfg0 |= 0x18;
	timers->TCFG0 = tcfg0;
	
	tcfg1 = timers->TCFG1;
	tcfg1 &= ~S3C2410_TCFG1_MUX0_MASK;
	tcfg1 |= S3C2410_TCFG1_MUX0_DIV2;
	timers->TCFG1 = tcfg1;
	timers->ch[0].TCNTB = 0x31;
	
	
	tcon = timers->TCON; 
	tcon &= ~0x0F;
	tcon |= S3C2410_TCON_T0RELOAD;
	tcon |= S3C2410_TCON_T0MANUALUPD;
	timers->TCON = tcon; 
	timers->ch[0].TCNTB = 0x31;
	timers->ch[0].TCMPB = tcmpb0;
	
	tcon |= S3C2410_TCON_T0START;
	tcon &= ~S3C2410_TCON_T0MANUALUPD;
	timers->TCON = tcon;
}
/*
void n300_set_brightness(int tcmpb0) {
	S3C24X0_TIMERS * const timers = S3C24X0_GetBase_TIMERS();

	// power on/off 
	n300_backlight_power(tcmpb0 ? 1 : 0);
	
	timers->TCFG0 &= ~S3C2410_TCFG_PRESCALER0_MASK;
	timers->TCFG0 |= 0x18;
	
	timers->TCFG1 &= ~S3C2410_TCFG1_MUX0_MASK;
	timers->TCFG1 |= S3C2410_TCFG1_MUX0_DIV2;
	//writel(0x31, S3C2410_TCNTB(0));
	timers->ch[0].TCNTB = 0x31;
	
	
	timers->TCON &= ~0x0F;
	timers->TCON |= S3C2410_TCON_T0RELOAD;
	timers->TCON |= S3C2410_TCON_T0MANUALUPD;
	//writel(0x31, S3C2410_TCNTB(0));
	timers->ch[0].TCNTB = 0x31;
	timers->ch[0].TCMPB = tcmpb0;
	
	timers->TCON |= S3C2410_TCON_T0START;
	timers->TCON &= ~S3C2410_TCON_T0MANUALUPD;
}
*/

#if defined(CONFIG_SHOW_BOOT_PROGRESS)
void show_boot_progress(int progress)
{
	printf("Boot stage %d\n", progress);
}
#else
void show_boot_progress(int progress) {
}

#endif

void display_dram_config(){
  
}

