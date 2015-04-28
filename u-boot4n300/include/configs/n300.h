/*
 * (C) Copyright 2014 CXLabs
 * Configuration settings for the N310 PDA (based on SAMSUNG SMDK2440 board)
 *
 -------------------------------------- LOAD u-boot into dram (from jtag)
 load_image /opt/N310/u-boot4n300/u-boot.bin 0x33F80000
 resume 0x33F80000

 -------------------------------------- LOAD u-boot into nand (from u-boot)
 loady 				(be quick !)
 nand erase 0 0x40000
 nand write 0x30008000 0 0x00040000
 -- ufo command ... mww 0x56000000 0x005EA71F  .. in case of error ;-)
 
 -------------------------------------- LOAD u-boot into nand (from jtag and u-boot)
 load_image /opt/N310/u-boot4n300/u-boot.nand-64M 0x30008000
 load_image /opt/N310/u-boot4n300/u-boot.bin 0x30008000
 (load_image /opt/N310/u-boot4n300/eboot.nb0 0x30008000)	do not load @ 0x33f80000 !! it relocates itself
 resume
 --> from serialconsole 
 nand erase 0 0x40000
 nand write 0x30008000 0 0x00040000
 -- OR (128M nand flash)---
 nand erase 0 0x40000
 nand write 0x30008000 0 0x40000
 
 --------------------------(128M nand flash) TEST LOAD u-boot into far-nand-address (from jtag and u-boot)
 load_image /opt/N310/u-boot4n300/u-boot.bin 0x30008000
 --> from serialconsole 
 nand erase 0x100000 0x40000
 nand write 0x30008000 0x100000 0x40000
 --> from jtag console
 nand dump 0 /opt/N310/u-boot4n300/dump 0x100000 0x20000
 
 -------------------------------------- LOAD linux (uzImage) into nand 128MB (from jtag and u-boot)
 load_image /opt/N310/linux-2.6.29.n311/uzImage 0x31000000
 nand erase 0x60000 0x300000
 nand write 0x31000000 0x60000 0x300000
 (nand read 0x31000000 0x60000 0x300000)
 --> from serialconsole --> bootm 0x31000000
  
 -------------------------------------- LOAD uImage from u-boot from SD CArd
 fatload mmc 0:1 30008000 uimage

 -------------------------------------- LOAD linux (uzImage) from nand - 64M)
 (nand erase 0x24000 0x300000)
 nand read 0x31000000 0x44000 0x300000
 bootm 0x31000000
 
 -------------------------------------- LOAD u-boot into nand (from original bootloader of N300)
 1. create a 256k file with dd
	dd if=/dev/zero ibs=1k count=256 | tr "\000" "\377" >superipl.bin (NOT .nb0!!)
	(memo: try eboot.nb0 name filename)
	
 2. copy u-boot (NAND VERSION! nand erase 0 0x40000
 nand write 0x30008000 0 0x00040000not RAM one) to superipl.bin
	dd if=u-boot.nand of=superipl.nb0 conv=notrunc
	
 3. put file on SD card (dir ACERN300) and use update FW procedure for N300

 
 -------------------------------------- strip away superipl prim toc
 dd if=superipl.bin of=test.bin ibs=1 skip=532 conv=notrunc
 arm-angstrom-linux-gnueabi-objdump -b binary --adjust-vma=0x00000000 -m arm920t -D test.bin | less
 
 -------------------------------------- LOAD TESTING superipl into dram (from jtag)
 load_image /opt/N310/u-boot4n300/superipl.bin 0x33F80000
 resume 0x33F80000

 -------------------------------------- dump assembler 
 arm-angstrom-linux-gnueabi-objdump -b binary --adjust-vma=0x00000000 -m arm920t -D nand.dump | less
 
 -------------------------------------- kernel entry point ?
 CONFIG_PAGE_OFFSET in .config -> change on kernel memory vs user memory (3G/1G == 0xc0000000)
 then is compiled in arch/arm/boot/compressed/vmlinux.lds
 and becomes PAGE_OFFSET in 0xa8000000
 
 -------------------------------------- LOAD 2.6.29-Image from JTAG
 load_image /opt/N310/linux-2.6.29.n311/arch/arm/boot/Image 0x30008000
 resume 0x30008000
 
 -------------------------------------- LOAD 2.6.29-uzImage from JTAG
 load_image /opt/N310/linux-2.6.29.n311/uzImage 0x31000000
 resume
 --> from serialconsole --> bootm 0x31000000
 
 -------------------------------------- LOAD 2.6.27-uzImage from JTAG
 load_image /opt/N310/csun_android2.1-armv4t_kernel/uzImage 0x31000000
 resume
 --> from serialconsole --> bootm 0x31000000

 -------------------------------------- LOAD u-boot from JTAG
 nand erase 0 0 0x40000 (2 times better)
 nand write 0 /opt/N310/u-boot4n300/u-boot.nand 0
 nand dump 0 /opt/N310/u-boot4n300/dump 0x40000 0x1000
 
 -------------------------------------- ext2 commands -> Not working on 3rd partition (test on first one)
 ext2ls mmc 0 /
 ext2ls mmc 0:2 /
 ext2load mmc 0:3 0x31000000 /boot/uzImage
 */

#ifndef __CONFIG_H
#define __CONFIG_H

//#define _BOOT_FROM_DRAM		// could be used by command line (make ...)

#ifdef _BOOT_FROM_DRAM
  /* If we want to start u-boot downloaded from JTAG in DRAM 
  * JTAG has already initialized DRAM access, refresh ecc ecc.
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

/* the PWM TImer 4 uses a counter of 15625 for 10 ms, so we need */
/* it to wrap 100 times (total 1562500) to get 1 sec. */
#define	CFG_HZ			1562500

//#undef USE_920T_MMU
#define USE_920T_MMU
//#define CONFIG_USE_IRQ
#undef CONFIG_USE_IRQ

/*
 * Size of malloc() pool
 */
#define CFG_MALLOC_LEN		(CFG_ENV_SIZE + 128*1024)
//#define CFG_GBL_DATA_SIZE	128	/* size in bytes reserved for initial data */
#define CFG_GBL_DATA_SIZE	128	/* size in bytes reserved for initial data */

/* ****************************************************
 * Hardware drivers
 ****************************************************** */
#define CONFIG_DISPLAY_CPUINFO
#define BOARD_LATE_INIT		// int board_late_init(void); in n300.c
/************************************************************
 * serial console configuration
 ************************************************************/
#define CONFIG_SERIAL1          1	/* we use SERIAL 1 on N300 */
//#define CONFIG_SERIAL2          1	/* we use SERIAL 2 on N300 */
//#define CONFIG_SERIAL3          1	/* we use SERIAL 2 on N300 */
#define CONFIG_BAUDRATE		115200
//#define CONFIG_BAUDRATE		9600
#undef CONFIG_HWFLOW


/************************************************************
 * display configuration
 ************************************************************/
#define CONFIG_LCD
#define CONFIG_LCD_LOGO
#define CONFIG_LCD_INFO_BELOW_LOGO
/************************************************************
 * i2c
 ************************************************************/
#define	CONFIG_I2C
#define	CONFIG_DRIVER_S3C24X0_I2C
#define	CONFIG_HARD_I2C
//#define	CFG_I2C_SPEED	390000	/* 390kHz */
#define	CFG_I2C_SPEED	10000	/* 10kHz */
#define	CFG_I2C_SLAVE	0x00

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
			CFG_CMD_CONSOLE	| \
			CFG_CMD_ECHO 	| \
			CFG_CMD_USB	 	| \
			CFG_CMD_LOADB   | \
            CFG_CMD_MEMORY	| \
            CFG_CMD_MISC	| \
			CFG_CMD_ENV     | \
			CFG_CMD_NAND	| \
			CFG_CMD_MMC	 	| \
			CFG_CMD_FAT	 	| \
			CFG_CMD_EXT2	| \
			CFG_CMD_RUN		| \
			CFG_CMD_DATE	| \
			CFG_CMD_IRQ		| \
			CFG_CMD_REGINFO)

/*			
            CFG_CMD_LOADS   | \
       		G_CMD_FLASH  | \
			CFG_CMD_EEPROM | \
			CFG_CMD_ELF		| \
*/

/* this must be included AFTER the definition of CONFIG_COMMANDS (if any) */
#include <cmd_confdefs.h>


/************************************************************
 * USB
 ************************************************************/
#define CONFIG_USB_OHCI
#define CONFIG_USB_STORAGE

#define CONFIG_PREBOOT	"setenv stdout serial;setenv stderr serial"

#define CONFIG_BOOTDELAY	10

#define CONFIG_BOOTARGS		"root=/dev/mmcblk0p3 rootfstype=ext3 rootwait ro console=tty0 console=ttySAC0,115200n8 panic=3"
// setenv bootargs 'root=/dev/mmcblk0p3 rootfstype=ext3 earlyprintk=serial,uart0,115200 console=ttySAC0,115200n8'
// setenv bootargs 'root=/dev/mmcblk0p3 rootfstype=ext3 rootdelay=2 console=tty0 console=ttySAC0,115200n8 panic=3'
// setenv bootargs 'root=/dev/mmcblk0p3 ro rootfstype=ext3 rootwait console=tty0 console=ttySAC0,115200n8 panic=3'
// ------ android -----------------------------
// setenv bootargs 'root=/dev/mmcblk0p3 rootfstype=ext3 init=/init rootdelay=2 console=ttySAC0,115200n8'
#define CONFIG_CMDLINE_TAG
#define CONFIG_SETUP_MEMORY_TAGS
#define CONFIG_SERIAL_TAG
//#define CONFIG_SHOW_BOOT_PROGRESS
// --- AAGH load address MUST be different from kernel jump address (0x30008000)
#define CONFIG_BOOTCOMMAND	"mmcinit; fatload mmc 0:1 31000000 uzImage; bootm 31000000"
// setenv bootcmd1 'fatload mmc 0:1 31000000 uzImage; bootm 31000000'
// setenv bootcmd2 'nand read 31000000 44000 300000;bootm 31000000'

//setenv bootcmd 'if mmcinit; then $bootcmd1; else $bootcmd2; fi;'
//setenv bootcmd 'if mmcinit; then fatload mmc 0:1 31000000 uzImage; else nand read 31000000 44000 300000; setenv bootargs $bootargs2; fi; bootm 31000000'
#define CONFIG_EXTRA_ENV_SETTINGS \
			"bootargs2=console=ttySAC0,115200n8 root=ubi0:rootfs rw ubi.mtd=3,512 rootfstype=ubifs ro rootwait panic=3\0" \
			"bootargs=root=/dev/mmcblk0p3 rootfstype=ext3 rootwait ro console=tty0 console=ttySAC0,115200n8 panic=3\0"

#define CONFIG_MMC_CLK	15000000
// mmc_clk=nPCLK/15000000L - 1;  
//	sdi->SDIPRE = nPCLK/(s ? simple_strtol(s, NULL, 11000000L) : 15000000L)-1;

/*
 * Miscellaneous configurable options
 */
#define	CONFIG_LONGHELP				/* undef to save memory		*/
#define	CFG_PROMPT		"u-boot # "	/* Monitor Command Prompt*/
#define	CFG_CBSIZE		256			/* Console I/O Buffer Size	*/
#define	CFG_PBSIZE (CFG_CBSIZE+sizeof(CFG_PROMPT)+16) /* Print Buffer Size */
#define	CFG_MAXARGS		16			/* max number of command args	*/
#define CFG_BARGSIZE		CFG_CBSIZE	/* Boot Argument Buffer Size	*/
#define CFG_HUSH_PARSER
#define CFG_PROMPT_HUSH_PS2	"> "
#define CONFIG_AUTO_COMPLETE	1
#define CONFIG_COMMAND_HISTORY	1

#define CFG_MEMTEST_START	0x30000000	/* memtest works on	*/
#define CFG_MEMTEST_END		0x33F00000	/* 63 MB in DRAM	*/

#undef  CFG_CLKS_IN_HZ		/* everything, incl board info, in Hz */

#define	CFG_LOAD_ADDR		0x30008000	/* default load address	for loady, loadb ecc*/

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
 ------------------------------------------------------------------------*/
#define CONFIG_NR_DRAM_BANKS	1	   /* we have 1 bank of DRAM */
#define PHYS_SDRAM_1		0x30000000 /* SDRAM Bank #1 */
#define PHYS_SDRAM_1_SIZE	0x04000000 /* 64 MB */

#define CONFIG_MMC
#define CONFIG_DOS_PARTITION
#define CONFIG_MMC_S3C
//#define CFG_MMC_BASE		0xff000000
#define CFG_MMC_BASE		0xF0000000
//#define CFG_MMC_BASE		(1<<9)

//#define CMD_SAVEENV
#define CFG_MONITOR_BASE        PHYS_SDRAM_1

#define CFG_NO_FLASH

/*-----------------------------------------------------------------------
 * NAND and environment organization
 * 
 * SAMSUNG - K9F1208U0G		- 64M
 * SAMSUNG - K9F1G08U0M		- 128M
 * s3c2440-nand s3c2440-nand: NF_CONF is 0xb510
 */
#define CFG_ENV_IS_IN_NAND			1
#define MTDIDS_DEFAULT		"nand0=n300-nand"
#define MTPARTS_DEFAULT		"n300-nand:0x00020000(u-boot),0x00200000(kernel),0x00200000(update),0x00100000(splash),0x01400000(jffs2),-(temp)"
#define CFG_NAND_DYNPART_MTD_KERNEL_NAME "n300-nand"
#define CONFIG_NAND_DYNPART

#define CFG_NAND_BASE				0x4E000000
#define CFG_CURRENT_NAND_DEVICE		0    /* FIXME to load dynamically current NAND device */
#define CFG_MAX_NAND_DEVICE     	1    /* Max number of NAND devices*/

#define K9F1208U0G
//#define K9F1G08U0M
#ifdef K9F1208U0G					// 64M NAND
	#define CFG_NAND_LEGACY
	//#define NAND_LEGACY_DEBUG
	//#define NAND_ENV_DEBUG	
	#define CONFIG_MTD_NAND_VERIFY_WRITE
	#define CFG_NAND_SMALLPAGE
	#define SECTORSIZE				512		/* used by nand_legacy_rw , BE CAREFUL: See board/n300/nand_read.c*/
	/* ---------------------------------- NAND loader ------ */
	#define CFG_UBOOT_SIZE		0x40000 	/* size of u-boot, for NAND loading */
	#define CFG_ENV_SIZE		0x4000		/* Total Size of Environment Sector */
	//#define DYNAMIC_CRC_TABLE	
#else								// 128M NAND
	//#define CFG_NAND_LEGACY
	//#define CONFIG_MTD_DEBUG
	//#define CONFIG_MTD_DEBUG_VERBOSE
	#define NAND_DEBUG
	//#define NAND_LL_DEBUG
	#define NAND_LLREAD_DEBUG	
	#define NAND_ENV_DEBUG
	//#define NAND_C_DEBUG	
	//#define NAND_BASE_DEBUG
	//#define NAND_UTIL_DEBUG
	#define DEBUG_ENV_COMMON
	#define DEBUG_CMD_NAND	
	
	#define CFG_NAND_LARGEPAGE
	/* ---------------------------------- NAND loader ------ */
	#define SECTORSIZE    2048	 /* BE CAREFUL: See board/n300/nand_read.c */
	#define CFG_UBOOT_SIZE		0x40000 /* size of u-boot, for NAND loading */
	#define CFG_ENV_SIZE		0x20000	/* Total Size of Environment Sector */
#endif

#define CFG_ENV_OFFSET			CFG_UBOOT_SIZE


//#define NAND_NO_RB
//CFG_NAND_WP
/*			-- example
#define NAND_NO_RB

#define CFG_NAND_WP
#define NAND_WP_OFF()  do {*(volatile u32 *)(0x6800A050) |= 0x00000010;} while(0)
#define NAND_WP_ON()  do {*(volatile u32 *)(0x6800A050) &= ~0x00000010;} while(0)
*/
#define ADDR_COLUMN 			1
#define ADDR_PAGE 				2
#define ADDR_COLUMN_PAGE 		3
#define NAND_ChipID_UNKNOWN     0x00
#define NAND_MAX_FLOORS 		1
#define NAND_MAX_CHIPS 			1

#define NAND_WAIT_READY(nand)			NF_WaitRB()
#define MACRO_NAND_ENABLE_CE			NF_SetCE(NFCE_LOW)
#define MACRO_NAND_DISABLE_CE			NF_SetCE(NFCE_HIGH)
#define WRITE_NAND_COMMAND(d, adr)		NF_Cmd(d)

#define WRITE_NAND_ADDRESS(d, adr)      NF_Addr(d)
#define WRITE_NAND(d, adr)              NF_Write(d)
#define READ_NAND(adr)                  NF_Read()


/* the following functions are NOP's because S3C24X0 handles this in hardware */
// defined in include/linux/nand.h
#define MACRO_NAND_CTL_CLRALE
#define MACRO_NAND_CTL_SETALE
#define MACRO_NAND_CTL_CLRCLE
#define MACRO_NAND_CTL_SETCLE	// Assert the CLE (Command Latch Enable) line to the flash chip


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
