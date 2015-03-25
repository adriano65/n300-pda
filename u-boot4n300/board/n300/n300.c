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
#include <asm/arch/regs-gpio.h>
#include "n300.h"

DECLARE_GLOBAL_DATA_PTR;

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

int board_late_init(void) {
	keypad_init();
	
}

#if 0
/* called when looping */
void show_activity(int arg) {
	do_poll();
}
#endif

int print_cpuinfo (void) {
	S3C2440_GPIO * const gpio = S3C2440_GetBase_GPIO();
	
	printf("cpuinfo: FCLK %3.3d Mhz (arm920t core)\n", get_FCLK()/1000/1000);
	printf("         HCLK %3.3d Mhz (AHB Bus -> USB Host, NAND, ...)\n", get_HCLK()/1000/1000);
	printf("         PCLK %3.3d Mhz (AHB Bus -> WDT, MMC, ...)\n", get_PCLK()/1000/1000);
	printf("         UCLK %3.3d Mhz (USB Host and Device)\n\n", get_UCLK()/1000/1000);
	printf("Boot reason: %s \n", (gpio->GSTATUS2 & S3C2410_GSTATUS2_WTRESET) ? "Watchdog" : 
								 ((gpio->GSTATUS2 & S3C2410_GSTATUS2_OFFRESET) ? "Sleep" :
								 ((gpio->GSTATUS2 & S3C2410_GSTATUS2_PONRESET) ? "Power ON" : "") ));
	return (0);
}

void get_board_serial(struct tag_serialnr *serialnr) {
  serialnr->high=1;
  serialnr->low=14;
}


#if defined(CONFIG_SHOW_BOOT_PROGRESS)
void show_boot_progress(int progress) {
	printf("Boot stage %d\n", progress);
}
#else
void show_boot_progress(int progress) {
}

#endif

