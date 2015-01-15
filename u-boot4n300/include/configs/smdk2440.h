/*
 * (C) Copyright 2002
 * Sysgo Real-Time Solutions, GmbH <www.elinos.com>
 * Marius Groeger <mgroeger@sysgo.de>
 * Gary Jennejohn <gj@denx.de>
 * David Mueller <d.mueller@elsoft.ch>
 *
 * Configuation settings for the SAMSUNG SMDK2440 board.
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

#ifndef __CONFIG_H
#define __CONFIG_H

/*
 * High Level Configuration Options
 * (easy to change)
 */
#define CONFIG_ARM920T		1	/* This is an ARM920T Core	*/
#define	CONFIG_S3C2440		1	/* in a SAMSUNG S3C2440 SoC     */
#define CONFIG_SMDK2440		1	/* on a SAMSUNG SMDK2440 Board  */

/* input clock of PLL */
//#define CONFIG_SYS_CLK_FREQ	16934400/* 16.9344MHz input clock */
#define CONFIG_SYS_CLK_FREQ	12000000/* 12MHz input clock */

#define USE_920T_MMU		1
#undef CONFIG_USE_IRQ			/* we don't need IRQ/FIQ stuff */

/*
 * Size of malloc() pool
 */
#define CFG_MALLOC_LEN		(CFG_ENV_SIZE + 128*1024)
#define CFG_GBL_DATA_SIZE	128	/* size in bytes reserved for initial data */

/*
 * Hardware drivers
 */
#if 0
#define CONFIG_DRIVER_DM9000            1
#define CONFIG_DM9000_BASE              0x20000300      /* nGCS4 */
#define DM9000_IO                       CONFIG_DM9000_BASE
#define DM9000_DATA                     (CONFIG_DM9000_BASE+4)
#define CONFIG_DM9000_USE_16BIT         1
#else
#define CONFIG_DRIVER_CS8900 1
#define CS8900_BUS32 1
#define CS8900_BASE 0x18000000      /* nGCS3 */
#endif
#define CONFIG_DRIVER_TS1620		1

/*
 * select serial console configuration
 */
#define CONFIG_SERIAL1          1	/* we use SERIAL 1 on SMDK2440 */

/************************************************************
 * RTC
 ************************************************************/
#define	CONFIG_RTC_S3C24X0	1

/* allow to overwrite serial and ethaddr */
#define CONFIG_ENV_OVERWRITE

#define CONFIG_BAUDRATE		115200

/***********************************************************
 * Command definition
 ***********************************************************/
#define CONFIG_COMMANDS \
			(CONFIG_CMD_DFL	 | \
			CFG_CMD_CACHE	 | \
                        CFG_CMD_NET      | \
                        CFG_CMD_ENV      | \
                        CFG_CMD_FLASH    | \
                        CFG_CMD_PING     | \
			CFG_CMD_NAND	 | \
			/*CFG_CMD_EEPROM |*/ \
			/*CFG_CMD_I2C	 |*/ \
			/*CFG_CMD_USB	 |*/ \
			CFG_CMD_REGINFO  | \
			CFG_CMD_DATE	 | \
			CFG_CMD_ELF)

/* this must be included AFTER the definition of CONFIG_COMMANDS (if any) */
#include <cmd_confdefs.h>

#define CONFIG_BOOTDELAY	6
//#define CONFIG_BOOTARGS    	"noinitrd root=31:03 init=/linuxrc console=ttySAC0"
//#define CONFIG_BOOTARGS		"noinitrd init=/linuxrc root=/dev/nfs ip=192.168.91.107:192.168.91.104:::::off console=ttySAC0"
#define CONFIG_BOOTARGS		"root=/dev/mtdblock4 rootfstype=jffs2 console=ttySAC2,115200 loglevel=8"
#define CONFIG_ETHADDR		08:00:3e:26:0a:5b
#define CONFIG_NETMASK      255.255.255.0
#define CONFIG_IPADDR		192.168.91.107
#define CONFIG_SERVERIP		192.168.91.104
#define CONFIG_GATEWAYIP	192.168.91.254
#define CONFIG_BOOTFILE     "zImage"
#define CONFIG_CMDLINE_TAG
#define CONFIG_BOOTCOMMAND	"nand read 30008000 30000 200000;go 30008000"

#if (CONFIG_COMMANDS & CFG_CMD_KGDB)
#define CONFIG_KGDB_BAUDRATE	115200		/* speed to run kgdb serial port */
/* what's this ? it's not used anywhere */
#define CONFIG_KGDB_SER_INDEX	1		/* which serial port to use */
#endif

/*
 * Miscellaneous configurable options
 */
#define	CFG_LONGHELP				/* undef to save memory		*/
#define	CFG_PROMPT		"u-boot # "	/* Monitor Command Prompt*/
#define	CFG_CBSIZE		256		/* Console I/O Buffer Size	*/
#define	CFG_PBSIZE (CFG_CBSIZE+sizeof(CFG_PROMPT)+16) /* Print Buffer Size */
#define	CFG_MAXARGS		16		/* max number of command args	*/
#define CFG_BARGSIZE		CFG_CBSIZE	/* Boot Argument Buffer Size	*/

#define CFG_MEMTEST_START	0x30000000	/* memtest works on	*/
#define CFG_MEMTEST_END		0x33F00000	/* 63 MB in DRAM	*/

#undef  CFG_CLKS_IN_HZ		/* everything, incl board info, in Hz */

#define	CFG_LOAD_ADDR		0x30008000	/* default load address	*/

/* the PWM TImer 4 uses a counter of 15625 for 10 ms, so we need */
/* it to wrap 100 times (total 1562500) to get 1 sec. */
#define	CFG_HZ			1562500

/* valid baudrates */
#define CFG_BAUDRATE_TABLE	{ 9600, 19200, 38400, 57600, 115200 }

/*-----------------------------------------------------------------------
 * Stack sizes
 *
 * The stack sizes are set up in start.S using the settings below
 */
#define CONFIG_STACKSIZE	(128*1024)	/* regular stack */
#ifdef CONFIG_USE_IRQ
#define CONFIG_STACKSIZE_IRQ	(4*1024)	/* IRQ stack */
#define CONFIG_STACKSIZE_FIQ	(4*1024)	/* FIQ stack */
#endif

/*-----------------------------------------------------------------------
 * Physical Memory Map
 */
#define CONFIG_NR_DRAM_BANKS	1	   /* we have 1 bank of DRAM */
#define PHYS_SDRAM_1		0x30000000 /* SDRAM Bank #1 */
#define PHYS_SDRAM_1_SIZE	0x04000000 /* 64 MB */

#define PHYS_FLASH_1		0x00000000 /* Flash Bank #1 */

#define CFG_FLASH_BASE		PHYS_FLASH_1

/*-----------------------------------------------------------------------
 * FLASH and environment organization
 */
// SAMSUNG - K9F1G08U0D

#define CONFIG_AMD_LV400	1	/* uncomment this if you have a LV400 flash */
#if 0
#define CONFIG_AMD_LV800	1	/* uncomment this if you have a LV800 flash */
#endif

#define CFG_MAX_FLASH_BANKS	1	/* max number of memory banks */
#ifdef CONFIG_AMD_LV800
#define PHYS_FLASH_SIZE		0x00100000 /* 1MB */
#define CFG_MAX_FLASH_SECT	(19)	/* max number of sectors on one chip */
#define CFG_ENV_ADDR		(CFG_FLASH_BASE + 0x0F0000) /* addr of environment */
#endif
#ifdef CONFIG_AMD_LV400
#define PHYS_FLASH_SIZE		0x00080000 /* 512KB */
#define CFG_MAX_FLASH_SECT	(11)	/* max number of sectors on one chip */
#define CFG_ENV_ADDR		(CFG_FLASH_BASE + 0x070000) /* addr of environment */
#endif

/* timeout values are in ticks */
#define CFG_FLASH_ERASE_TOUT	(5*CFG_HZ) /* Timeout for Flash Erase */
#define CFG_FLASH_WRITE_TOUT	(5*CFG_HZ) /* Timeout for Flash Write */

//#define CFG_ENV_IS_IN_FLASH	1
#define CFG_ENV_IS_IN_NAND	1

#define CFG_ENV_SIZE		0x10000	/* Total Size of Environment Sector */

#define CONFIG_MMC		1
#define CFG_MMC_BASE		0xff000000
#define MTDIDS_DEFAULT		"nand0=smdk2440-nand"
#define MTPARTS_DEFAULT		"smdk2440-nand:0x00100000(u-boot),0x00200000(kernel),0x00200000(update),0x00100000(splash),0x01400000(jffs2),-(temp)"
#define CFG_NAND_DYNPART_MTD_KERNEL_NAME "smdk2440-nand"
#define CONFIG_NAND_DYNPART
/*-----------------------------------------------------------------------
 * NAND flash settings
 */
#if (CONFIG_COMMANDS & CFG_CMD_NAND)
#define CFG_NAND_BASE   0x4E000000
#define CMD_SAVEENV
#define CFG_ENV_OFFSET  0x020000
#define CFG_NAND_LEGACY
#define CFG_MONITOR_BASE        PHYS_SDRAM_1

#define CFG_MAX_NAND_DEVICE     1    /* Max number of NAND devices*/
#define SECTORSIZE 512

#define ADDR_COLUMN 1
#define ADDR_PAGE 2
#define ADDR_COLUMN_PAGE 3
#define NAND_ChipID_UNKNOWN     0x00
#define NAND_MAX_FLOORS 1
#define NAND_MAX_CHIPS 1

#define NAND_WAIT_READY(nand)   NF_WaitRB()
#define NAND_DISABLE_CE(nand)   NF_SetCE(NFCE_HIGH)
#define NAND_ENABLE_CE(nand)    NF_SetCE(NFCE_LOW)
#define WRITE_NAND_COMMAND(d, adr)      NF_Cmd(d)
#define WRITE_NAND_COMMANDW(d, adr)     NF_CmdW(d)
#define WRITE_NAND_ADDRESS(d, adr)      NF_Addr(d)
#define WRITE_NAND(d, adr)              NF_Write(d)
#define READ_NAND(adr)                  NF_Read()

/* the following functions are NOP's because S3C24X0 handles this in hardware */
#define NAND_CTL_CLRALE(nandptr)
#define NAND_CTL_SETALE(nandptr)
#define NAND_CTL_CLRCLE(nandptr)
#define NAND_CTL_SETCLE(nandptr)

#define CONFIG_MTD_NAND_VERIFY_WRITE	1
#define CONFIG_MTD_NAND_ECC_JFFS2	1

#endif  /* CONFIG_COMMANDS & CFG_CMD_NAND */

/*
 * Nandflash Boot
 */

#if (CONFIG_COMMANDS & CFG_CMD_NAND)
//#define CONFIG_S3C2440_NAND_BOOT 1
#define CONFIG_S3C2440_NAND_BOOT 0
#define STACK_BASE            0x33f00000
#define STACK_SIZE            0x8000
#define UBOOT_RAM_BASE        0x33f80000
// NAND Flash Controller
#define NAND_CTL_BASE         0x4E000000
#define bINT_CTL(Nb)        __REG(INT_CTL_BASE + (Nb))
// Offset
#define oNFCONF                 0x00
#define oNFCONT                 0x04
#define oNFCMD                  0x08
#define oNFADDR                 0x0c
#define oNFDATA                 0x10
#define oNFSTAT                 0x20
#define oNFECC                  0x2c
#endif

#endif	/* __CONFIG_H */
