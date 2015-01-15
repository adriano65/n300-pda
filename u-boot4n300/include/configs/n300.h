/*
 * (C) Copyright 2014
 * CXLabs
 * Configuation settings for the N310 PDA (based on SAMSUNG SMDK2440 board)
 *
 -------------------------------------- LOAD u-boot into nand (from u-boot)
 loady - be quick !
 nand erase 0 0x18000
 nand write 0x30008000 0 0x00018000
 // linux (zImage)
 nand erase 0x1c000 0x300000
 nand write 0x30008000 0x1c000 0x300000
 
 
 -------------------------------------- LOAD uImage from SD CArd
 fatload mmc 0:1 30008000 uimage
 
 
 -------------------------------------- LOAD u-boot into nand (from vivi-N310)
 1. create a 256k file with dd
	dd if=/dev/zero ibs=1k count=256 | tr "\000" "\377" >superipl.nb0
	
 2. copy u-boot (NAND VERSION! not RAM one) to superipl.nbo
	dd if=u-boot.nand-boot of=superipl.nb0 conv=notrunc
	
 3. put file on SD card and use update FW procedure for N300
 
 
 */

#ifndef __CONFIG_H
#define __CONFIG_H

//#define CONFIG_DOS_PARTITION
//#undef CFG_CMD_DHCP

#define _BOOT_FROM_DRAM

#ifdef _BOOT_FROM_DRAM
  /* If we want to start u-boot downloaded from JTAG in DRAM 
  * JTAG has already initializaed DRAM access, refresh ecc ecc.
  * Same configuration when u-boot downloaded from usb bootloader 
  * (like lowlevel_foo.bin) in DRAM 
  */
  #define CONFIG_SKIP_RELOCATE_UBOOT
  #define CONFIG_SKIP_LOWLEVEL_INIT
  #undef CONFIG_S3C2440_NAND_BOOT
#else
  /* If we want to start u-boot directly from within NAND flash */
  #define CONFIG_S3C2440_NAND_BOOT
  #define CONFIG_S3C2410_NAND_SKIP_BAD
  #define UBOOT_RAM_BASE	0x33F80000
  #define NAND_CTL_BASE		0x4E000000
  #define STACK_BASE        0x33f00000
  #define STACK_SIZE        0x8000
#endif

/*
 * High Level Configuration Options
 * (easy to change)
 */
#define CONFIG_ARM920T		1	/* This is an ARM920T Core	*/
#define	CONFIG_S3C2440		1	/* in a SAMSUNG S3C2440 SoC     */
#define CONFIG_N300			1	/* on a Acer N310 PDA  */
#define CONFIG_ARCH_N300

/* input clock of PLL */
#define CONFIG_SYS_CLK_FREQ	16934400/* 16.9344MHz input clock */
//NOTE: Touch screen uses X-tal clock(3.68MHz)

//#define USE_920T_MMU		1
#define USE_920T_MMU
#undef CONFIG_USE_IRQ			/* we don't need IRQ/FIQ stuff */
//#define CONFIG_USE_IRQ

/*
 * Size of malloc() pool
 */
#define CFG_MALLOC_LEN		(CFG_ENV_SIZE + 128*1024)
#define CFG_GBL_DATA_SIZE	128	/* size in bytes reserved for initial data */

/* ****************************************************
 * Hardware drivers
 ****************************************************** */
#define CONFIG_DISPLAY_CPUINFO

/* select serial console configuration */
#define CONFIG_SERIAL1          1	/* we use SERIAL 1 on N300 */
//#define CONFIG_SERIAL2          1	/* we use SERIAL 2 on N300 */
//#define CONFIG_SERIAL3          1	/* we use SERIAL 2 on N300 */
#define CONFIG_BAUDRATE		115200
//#define CONFIG_BAUDRATE		9600
#undef CONFIG_HWFLOW
#define CONFIG_SERIAL_TAG

/************************************************************
 * RTC
 ************************************************************/
#define	CONFIG_RTC_S3C24X0	1

/* allow to overwrite serial and ethaddr */
#define CONFIG_ENV_OVERWRITE

/***********************************************************
 * Command definition
 ***********************************************************/
#define CONFIG_COMMANDS \
			(CFG_CMD_AUTOSCRIPT	 | \
			CFG_CMD_CACHE	 | \
			CFG_CMD_BDI	 | \
			CFG_CMD_CONSOLE	 | \
			CFG_CMD_ECHO 	 | \
			CFG_CMD_LOADB    | \
            CFG_CMD_LOADS   | \
            CFG_CMD_MEMORY    | \
            CFG_CMD_MISC | \
            CFG_CMD_ECHO 	 | \
			CFG_CMD_ENV      | \
			CFG_CMD_NAND	 | \
			CFG_CMD_MMC	 	 | \
			CFG_CMD_FAT	 	 | \
			CFG_CMD_REGINFO)

			/*CFG_CMD_USB	 |*/ \
       		/*CFG_CMD_FLASH  |*/ \
			/*CFG_CMD_ELF	 |*/ \
			/*CFG_CMD_EEPROM |*/ \
			/*CFG_CMD_I2C	 |*/ \
			/*CFG_CMD_ELF	 |*/ \
/* this must be included AFTER the definition of CONFIG_COMMANDS (if any) */
#include <cmd_confdefs.h>

#define CFG_UBOOT_SIZE		0x18000 /* size of u-boot, for NAND loading */
#define CFG_ENV_IS_IN_NAND	1
#define CFG_ENV_OFFSET		CFG_UBOOT_SIZE
#define CFG_ENV_SIZE		0x04000	/* Total Size of Environment Sector */

#define CONFIG_BOOTDELAY	25
//#define CONFIG_BOOTARGS    	"noinitrd root=31:03 init=/linuxrc console=ttySAC0"
//#define CONFIG_BOOTARGS		"noinitrd init=/linuxrc root=/dev/nfs ip=192.168.91.107:192.168.91.104:::::off console=ttySAC0"
#define CONFIG_BOOTARGS		"root=/dev/mmcblk0p3 rootfstype=ext3 console=ttySAC0,115200n81"
// setenv bootargs 'root=/dev/mmcblk0p3 rootfstype=ext3 console=ttySAC0,115200n81'
#define CONFIG_BOOTFILE     "zImage"
#define CONFIG_CMDLINE_TAG
//#define CONFIG_AUTO_COMPLETE
#define CONFIG_SHOW_BOOT_PROGRESS
//#define CONFIG_BOOTCOMMAND	"nand read 30008000 30000 200000;go 30008000"
//#define CONFIG_BOOTCOMMAND	"mmcinit; fatload mmc 0:1 30008000 zImage; go 30008000"
// --- AAGH load address MUST be different from kernel jump address (0x30008000)
#define CONFIG_BOOTCOMMAND	"mmcinit; fatload mmc 0:1 31008000 uImage; bootm 31008000"
// setenv bootcmd 'mmcinit; fatload mmc 0:1 31008000 uImage; bootm 31008000'

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

#define	CFG_LOAD_ADDR		0x30008000	/* default load address	for loady, loadb ecc*/

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

#define CFG_NO_FLASH

/*-----------------------------------------------------------------------
 * Physical Memory Map
 ------------------------------------------------------------------------*/
#define CONFIG_NR_DRAM_BANKS	1	   /* we have 1 bank of DRAM */
#define PHYS_SDRAM_1		0x30000000 /* SDRAM Bank #1 */
#define PHYS_SDRAM_1_SIZE	0x04000000 /* 64 MB */

#define CONFIG_MMC
#define CONFIG_DOS_PARTITION
#define CONFIG_MMC_S3C
//#define CFG_MMC_BASE		0xff000000
#define CFG_MMC_BASE		0xF0000000
//#define CONFIG_GLAMO_BASE	0x08000000
//#define CFG_MMC_BASE		(1<<9)

#define MTDIDS_DEFAULT		"nand0=n300-nand"
#define MTPARTS_DEFAULT		"n300-nand:0x00100000(u-boot),0x00200000(kernel),0x00200000(update),0x00100000(splash),0x01400000(jffs2),-(temp)"
#define CFG_NAND_DYNPART_MTD_KERNEL_NAME "n300-nand"
#define CONFIG_NAND_DYNPART

#define CMD_SAVEENV
#define CFG_NAND_LEGACY
#define CFG_MONITOR_BASE        PHYS_SDRAM_1

/*-----------------------------------------------------------------------
 * NAND and environment organization
 */
// SAMSUNG - K9F1G08U0D

#define CFG_MAX_NAND_DEVICE     1    /* Max number of NAND devices*/
#define SECTORSIZE 				512
//NAND_NO_RB
//CFG_NAND_WP
#define ADDR_COLUMN 			1
#define ADDR_PAGE 				2
#define ADDR_COLUMN_PAGE 		3
#define NAND_ChipID_UNKNOWN     0x00
#define NAND_MAX_FLOORS 		1
#define NAND_MAX_CHIPS 			1

#define NAND_WAIT_READY(nand)		NF_WaitRB()
#define NAND_DISABLE_CE(nand)		NF_SetCE(NFCE_HIGH)
#define NAND_ENABLE_CE(nand)		NF_SetCE(NFCE_LOW)
#define WRITE_NAND_COMMAND(d, adr)	NF_Cmd(d)
#define WRITE_NAND_COMMANDW(d, adr)     NF_CmdW(d)
#define WRITE_NAND_ADDRESS(d, adr)      NF_Addr(d)
#define WRITE_NAND(d, adr)              NF_Write(d)
#define READ_NAND(adr)                  NF_Read()

/* the following functions are NOP's because S3C24X0 handles this in hardware */
// defined in include/linux/nand.h
#define NAND_CTL_CLRALE(nandptr)
#define NAND_CTL_SETALE(nandptr)
#define NAND_CTL_CLRCLE(nandptr)
#define NAND_CTL_SETCLE(nandptr)

#define CONFIG_MTD_NAND_VERIFY_WRITE
//#define CONFIG_MTD_NAND_ECC_JFFS2	1
#define CONFIG_MTD_NAND_ECC

#define bINT_CTL(Nb)        __REG(INT_CTL_BASE + (Nb))

#if (CONFIG_COMMANDS & CFG_CMD_KGDB)
#error "do not use this"
#define CONFIG_KGDB_BAUDRATE	115200		/* speed to run kgdb serial port */
/* what's this ? it's not used anywhere */
#define CONFIG_KGDB_SER_INDEX	1		/* which serial port to use */
#endif


#endif	/* __CONFIG_H */
