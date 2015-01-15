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
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
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
    FastBus mode             0       0
    Synchronous               0       1
    Reserved                    1       0
    Asynchronous             1       1 
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

int board_init (void) {

	S3C24X0_CLOCK_POWER * const clk_power = S3C24X0_GetBase_CLOCK_POWER();

	/* to reduce PLL lock time, adjust the LOCKTIME register */
	clk_power->LOCKTIME = 0xFFFFFFFF;
#if 0

	/* configure UPLL */
	clk_power->UPLLCON = ((U_M_MDIV << 12) + (U_M_PDIV << 4) + U_M_SDIV);

	/* some delay between MPLL and UPLL */
	delay (8000);

	/* configure MPLL */
	clk_power->MPLLCON = ((M_MDIV << 12) + (M_PDIV << 4) + M_SDIV);

	/* some delay between MPLL and UPLL */
	delay (4000);

	/* set up the I/O ports */
	S3C24X0_GPIO * const gpio = S3C24X0_GetBase_GPIO();
	gpio->GPACON = 0x005EAF1F;
	
	gpio->GPBCON = 0x00005555;	/* 0x00044555 */
	gpio->GPBUP = 0x000007FF;
	gpio->GPBDAT = 0x0f;
	
	gpio->GPCCON = 0xAAAAAAAA;
	gpio->GPCUP = 0x0000FFFF;
	
	gpio->GPDCON = 0xAAAAAAAA;
	gpio->GPDUP = 0x0000FFFF;
	
	gpio->GPECON = 0xAAAAAAAA;
	gpio->GPEUP = 0x0000FFFF;
	
	gpio->GPFCON = 0x00004000;	/* 0x000055AA */
	gpio->GPFUP = 0x0000007F;
	gpio->GPFDAT = 0x7F; 
	
	gpio->GPGCON =0x10060009;	/* 0xFF95FFBA */
	gpio->GPGUP = 0x0000FFFF;
	gpio->GPGDAT= 0xbfff;
	
	gpio->GPHCON =0x0002AAAA;	/* 0x002AFAAA */
	gpio->GPHUP = 0x000007FF;

	udelay(200);
	gpio->GPFDAT = 0xFF;

#endif
	/* arch number of N300-Board */
	gd->bd->bi_arch_number = MACH_TYPE_N300;

	/* address of boot parameters */
	gd->bd->bi_boot_params = 0x3F000100;

	icache_enable();		// disable to boot linux
	dcache_enable();
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
}

#if defined(CONFIG_SHOW_BOOT_PROGRESS)
void show_boot_progress(int progress)
{
	//printf("Boot reached stage %d\n", progress);
}
#endif
