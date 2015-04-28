/*
 * (C) Copyright 2003
 * David M�ller ELSOFT AG Switzerland. d.mueller@elsoft.ch
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
 hi
 */

/************************************************
 * NAME	    : s3c2440.h
 * Version  : 31.3.2003
 *
 * Based on S3C2440X User's manual Rev 1.1
 ************************************************/

#ifndef __S3C2440_H__
#define __S3C2440_H__

#define S3C24X0_UART_CHANNELS	3
#define S3C24X0_SPI_CHANNELS	2

/* S3C2440 only supports 512 Byte HW ECC */
#define S3C2440_ECCSIZE		512
#define S3C2440_ECCBYTES	3

/* S3C2440 device base addresses */
#define S3C24X0_MEMCTL_BASE			0x48000000
#define S3C24X0_MEMCTL_BWSCON		0x48000000
#define S3C24X0_MEMCTL_BANKCON1		0x48000004
#define S3C24X0_MEMCTL_BANKCON2		0x48000008
#define S3C24X0_MEMCTL_BANKCON3		0x48000010
#define S3C24X0_MEMCTL_BANKCON4		0x48000014
//	  set BANKCON5		0x48000018
//	  set BANKCON6		0x4800001C
//	  set BANKCON7		0x48000020
#define S3C24X0_MEMCTL_REFRESH		0x48000024
#define S3C24X0_MEMCTL_BANKSIZE		0x48000028
#define S3C24X0_MEMCTL_MRSRB6		0x4800002C
#define S3C24X0_MEMCTL_MRSRB7		0x48000030

#define S3C24X0_USB_HOST_BASE		0x49000000

#define S3C24X0_INTERRUPT_BASE		0x4A000000
#define S3C24X0_INTERRUPT_SRCPND	0x4A000000
#define S3C24X0_INTERRUPT_MODE		0x4A000004
#define S3C24X0_INTERRUPT_MASK		0x4A000008
#define S3C24X0_INTERRUPT_PRIORITY	0x4A00000C
#define S3C24X0_INTERRUPT_PENDING	0x4A000010
#define S3C24X0_INTERRUPT_SUBSRCPND	0x4A000018
#define S3C24X0_INTERRUPT_SUBMASK	0x4A00001C
#define S3C24X0_INTERRUPT_EINTPEND	0x560000A8

#define S3C24X0_DMA_BASE			0x4B000000
#define S3C24X0_CLOCK_POWER_BASE	0x4C000000
#define S3C24X0_CLOCK_LOCKTIME		0x4C000000
//#define S3C24X0_CLKLCKTIM_VAL		0xff000000
#define S3C24X0_CLKLCKTIM_VAL		0xff00ff00

#define S3C24X0_MPLLCON				0x4C000004
#define S3C24X0_MPLLCON_WINZ		0x00074051
#define S3C24X0_MPLLCON_266MHz		0x00076022
#define S3C24X0_MPLLCON_300MHz		0x00061012
#define S3C24X0_MPLLCON_400MHz		0x0006e031
#define S3C24X0_MPLLCON_530MHz		0x00056011


#define S3C24X0_UPLLCON				0x4C000008
/* we have 16.9344 Mhz input frequency */
#define S3C24X0_UPLLCON_MDIV 	0x3c
#define S3C24X0_UPLLCON_PDIV	0x04
#define S3C24X0_UPLLCON_SDIV	0x02
#define UPLLCON_VALUE       ((S3C24X0_UPLLCON_MDIV << 12) | (S3C24X0_UPLLCON_PDIV << 4) | (S3C24X0_UPLLCON_SDIV))

#define S3C24X0_CLKCON				0x4C00000C

#define S3C24X0_CLKDIVN				0x4C000014
#define S3C24X0_CLKDIVN_WINZ		0x00000007
#define S3C24X0_CLKDIVN_HCLK50MHZ	0x00000004 		// @HCLK= FCLK/8 when CAMDIVN[9] = 1
#define S3C24X0_CLKDIVN_HCLK100MHZ	0x00000004 		// @HCLK= FCLK/4 when CAMDIVN[9] = 0
#define S3C24X0_CLKDIVN_HCLK100M_P50	0x00000005 		// @HCLK= FCLK/4 when CAMDIVN[9] = 0

#define S3C24X0_CAMDIVN				0x4C000018
//#define S3C24X0_CAMDIVN_ (*(volatile unsigned long *)0x4C000018)
#define S3C24X0_CAMDIVN_WINZ		0x00000000
#define S3C24X0_CAMDIVN_HCLK50MHZ	0x00000200
#define S3C24X0_CAMDIVN_HCLK100MHZ	0x00000000
 
#define S3C24X0_LCD_BASE			0x4D000000
#define S3C2440_NAND_BASE			0x4E000000
#define S3C2440_NAND_NFCONF			S3C2440_NAND_BASE
#define S3C2440_NAND_NFCONT			0x4E000004
#define S3C2440_NAND_NFCMD			0x4E000008
#define S3C2440_NAND_NFADDR			0x4E00000C
#define S3C2440_NAND_NFDATA			0x4E000010
#define S3C2440_NAND_NFSTAT			0x4E000020

#define S3C24X0_UART_BASE			0x50000000
#define S3C24X0_UART_ULCON0			0x50000000
#define S3C24X0_UART_UCON0			0x50000004
#define S3C24X0_UART_UFCON0			0x50000008
#define S3C24X0_UART_UMCON0			0x5000000C
#define S3C24X0_UART_UBRDIV0		0x50000028

#define S3C24X0_TIMER_BASE			0x51000000
#define S3C24X0_USB_DEVICE_BASE		0x52000140
#define S3C24X0_WATCHDOG_BASE		0x53000000
#define S3C24X0_WATCHDOG_DAT		0x53000004

#define S3C24X0_I2C_BASE			0x54000000
#define S3C24X0_I2S_BASE			0x55000000

#define S3C24X0_GPIO_BASE			0x56000000
#define S3C24X0_GPACON				0x56000000
#define S3C24X0_GPADAT				0x56000004

#define S3C24X0_GPBCON				0x56000010
#define S3C24X0_GPBDAT				0x56000014
#define S3C24X0_GPBUP				0x56000018

#define S3C24X0_GPCCON				0x56000020
#define S3C24X0_GPCDAT				0x56000024
#define S3C24X0_GPCUP				0x56000028

#define S3C24X0_GPDCON				0x56000030
#define S3C24X0_GPDDAT				0x56000034
#define S3C24X0_GPDUP				0x56000038

#define S3C24X0_GPECON				0x56000040
#define S3C24X0_GPEDAT				0x56000044
#define S3C24X0_GPEUP				0x56000048

#define GPECON_ (*(volatile unsigned long *)0x56000040) /* Port E control */
#define GPEDAT_ (*(volatile unsigned long *)0x56000044) /* Port E data */
#define GPEUP_ (*(volatile unsigned long *)0x56000048) /* Pull-up control E */


#define S3C24X0_GPFCON			0x56000050
#define S3C24X0_GPFDAT			0x56000054
#define S3C24X0_GPFUP			0x56000058

#define S3C24X0_GPGCON			0x56000060
#define S3C24X0_GPGDAT			0x56000064
#define S3C24X0_GPGUP			0x56000068

#define S3C24X0_GPHCON			0x56000070
#define S3C24X0_GPHDAT			0x56000074
#define S3C24X0_GPHUP			0x56000078

#define S3C2440_MISCCR			0x56000080
#define S3C24X0_GSTATUS2		0x560000b4
#define S3C24X0_GSTATUS3		0x560000b8

#define S3C24X0_GPJCON			0x560000d0
#define S3C24X0_GPJDAT			0x560000d4
#define S3C24X0_GPJUP			0x560000d8


#define S3C24X0_RTC_BASE		0x57000000
#define S3C24X0_RTCCON			0x57000040
#define S3C2440_ADC_BASE		0x58000000
#define S3C24X0_SPI_BASE		0x59000000
#define S3C2440_SDI_BASE		0x5A000000

/* REALTIME CLOCK */
#define RTC_BIT_ALMEN		(0x1<<6)
#define RTC_BIT_SECEN		(0x1<<0)

/* REFRESH parameter */
#define REFEN		 	(0x1<<23)	/* Refresh enable */
#define TREFMD		 	(0x1<<22)	/* CBR(CAS before RAS)/Auto refresh */
#define Trp		 		(0x1<<20)	/* 2clk */
#define Tsrc		 	(0x1<<18)	/* 7clk */
#define Tchr		 	0x2	/* 3clk */
#define REFCNT		 	1346	

#if 0
/* Memory control */
#define rBWSCON			(*(volatile unsigned *)0x48000000)
#define rBANKCON0		(*(volatile unsigned *)0x48000004)
#define rBANKCON1		(*(volatile unsigned *)0x48000008)
#define rBANKCON2		(*(volatile unsigned *)0x4800000C)
#define rBANKCON3		(*(volatile unsigned *)0x48000010)
#define rBANKCON4		(*(volatile unsigned *)0x48000014)
#define rBANKCON5		(*(volatile unsigned *)0x48000018)
#define rBANKCON6		(*(volatile unsigned *)0x4800001C)
#define rBANKCON7		(*(volatile unsigned *)0x48000020)
#define rREFRESH		(*(volatile unsigned *)0x48000024)
#define rBANKSIZE		(*(volatile unsigned *)0x48000028)
#define rMRSRB6			(*(volatile unsigned *)0x4800002C)
#define rMRSRB7			(*(volatile unsigned *)0x48000030)


/* USB HOST */
#define rHcRevision		(*(volatile unsigned *)0x49000000)
#define rHcControl		(*(volatile unsigned *)0x49000004)
#define rHcCommonStatus		(*(volatile unsigned *)0x49000008)
#define rHcInterruptStatus	(*(volatile unsigned *)0x4900000C)
#define rHcInterruptEnable	(*(volatile unsigned *)0x49000010)
#define rHcInterruptDisable	(*(volatile unsigned *)0x49000014)
#define rHcHCCA			(*(volatile unsigned *)0x49000018)
#define rHcPeriodCuttendED	(*(volatile unsigned *)0x4900001C)
#define rHcControlHeadED	(*(volatile unsigned *)0x49000020)
#define rHcControlCurrentED	(*(volatile unsigned *)0x49000024)
#define rHcBulkHeadED		(*(volatile unsigned *)0x49000028)
#define rHcBuldCurrentED	(*(volatile unsigned *)0x4900002C)
#define rHcDoneHead		(*(volatile unsigned *)0x49000030)
#define rHcRmInterval		(*(volatile unsigned *)0x49000034)
#define rHcFmRemaining		(*(volatile unsigned *)0x49000038)
#define rHcFmNumber		(*(volatile unsigned *)0x4900003C)
#define rHcPeriodicStart	(*(volatile unsigned *)0x49000040)
#define rHcLSThreshold		(*(volatile unsigned *)0x49000044)
#define rHcRhDescriptorA	(*(volatile unsigned *)0x49000048)
#define rHcRhDescriptorB	(*(volatile unsigned *)0x4900004C)
#define rHcRhStatus		(*(volatile unsigned *)0x49000050)
#define rHcRhPortStatus1	(*(volatile unsigned *)0x49000054)
#define rHcRhPortStatus2	(*(volatile unsigned *)0x49000058)


/* INTERRUPT */
#define rSRCPND			(*(volatile unsigned *)0x4A000000)
#define rINTMOD			(*(volatile unsigned *)0x4A000004)
#define rINTMSK			(*(volatile unsigned *)0x4A000008)
#define rPRIORITY		(*(volatile unsigned *)0x4A00000C)
#define rINTPND			(*(volatile unsigned *)0x4A000010)
#define rINTOFFSET		(*(volatile unsigned *)0x4A000014)
#define rSUBSRCPND		(*(volatile unsigned *)0x4A000018)
#define rINTSUBMSK		(*(volatile unsigned *)0x4A00001C)


/* DMA */
#define rDISRC0			(*(volatile unsigned *)0x4B000000)
#define rDISRCC0		(*(volatile unsigned *)0x4B000004)
#define rDIDST0			(*(volatile unsigned *)0x4B000008)
#define rDIDSTC0		(*(volatile unsigned *)0x4B00000C)
#define rDCON0			(*(volatile unsigned *)0x4B000010)
#define rDSTAT0			(*(volatile unsigned *)0x4B000014)
#define rDCSRC0			(*(volatile unsigned *)0x4B000018)
#define rDCDST0			(*(volatile unsigned *)0x4B00001C)
#define rDMASKTRIG0		(*(volatile unsigned *)0x4B000020)
#define rDISRC1			(*(volatile unsigned *)0x4B000040)
#define rDISRCC1		(*(volatile unsigned *)0x4B000044)
#define rDIDST1			(*(volatile unsigned *)0x4B000048)
#define rDIDSTC1		(*(volatile unsigned *)0x4B00004C)
#define rDCON1			(*(volatile unsigned *)0x4B000050)
#define rDSTAT1			(*(volatile unsigned *)0x4B000054)
#define rDCSRC1			(*(volatile unsigned *)0x4B000058)
#define rDCDST1			(*(volatile unsigned *)0x4B00005C)
#define rDMASKTRIG1		(*(volatile unsigned *)0x4B000060)
#define rDISRC2			(*(volatile unsigned *)0x4B000080)
#define rDISRCC2		(*(volatile unsigned *)0x4B000084)
#define rDIDST2			(*(volatile unsigned *)0x4B000088)
#define rDIDSTC2		(*(volatile unsigned *)0x4B00008C)
#define rDCON2			(*(volatile unsigned *)0x4B000090)
#define rDSTAT2			(*(volatile unsigned *)0x4B000094)
#define rDCSRC2			(*(volatile unsigned *)0x4B000098)
#define rDCDST2			(*(volatile unsigned *)0x4B00009C)
#define rDMASKTRIG2		(*(volatile unsigned *)0x4B0000A0)
#define rDISRC3			(*(volatile unsigned *)0x4B0000C0)
#define rDISRCC3		(*(volatile unsigned *)0x4B0000C4)
#define rDIDST3			(*(volatile unsigned *)0x4B0000C8)
#define rDIDSTC3		(*(volatile unsigned *)0x4B0000CC)
#define rDCON3			(*(volatile unsigned *)0x4B0000D0)
#define rDSTAT3			(*(volatile unsigned *)0x4B0000D4)
#define rDCSRC3			(*(volatile unsigned *)0x4B0000D8)
#define rDCDST3			(*(volatile unsigned *)0x4B0000DC)
#define rDMASKTRIG3		(*(volatile unsigned *)0x4B0000E0)


/* CLOCK & POWER MANAGEMENT */
#define rLOCKTIME		(*(volatile unsigned *)0x4C000000)
#define rMPLLCON		(*(volatile unsigned *)0x4C000004)
#define rUPLLCON		(*(volatile unsigned *)0x4C000008)
#define rCLKCON			(*(volatile unsigned *)0x4C00000C)
#define rCLKSLOW		(*(volatile unsigned *)0x4C000010)
#define rCLKDIVN		(*(volatile unsigned *)0x4C000014)


/* LCD CONTROLLER */
#define rLCDCON1		(*(volatile unsigned *)0x4D000000)
#define rLCDCON2		(*(volatile unsigned *)0x4D000004)
#define rLCDCON3		(*(volatile unsigned *)0x4D000008)
#define rLCDCON4		(*(volatile unsigned *)0x4D00000C)
#define rLCDCON5		(*(volatile unsigned *)0x4D000010)
#define rLCDSADDR1		(*(volatile unsigned *)0x4D000014)
#define rLCDSADDR2		(*(volatile unsigned *)0x4D000018)
#define rLCDSADDR3		(*(volatile unsigned *)0x4D00001C)
#define rREDLUT			(*(volatile unsigned *)0x4D000020)
#define rGREENLUT		(*(volatile unsigned *)0x4D000024)
#define rBLUELUT		(*(volatile unsigned *)0x4D000028)
#define rDITHMODE		(*(volatile unsigned *)0x4D00004C)
#define rTPAL			(*(volatile unsigned *)0x4D000050)
#define rLCDINTPND		(*(volatile unsigned *)0x4D000054)
#define rLCDSRCPND		(*(volatile unsigned *)0x4D000058)
#define rLCDINTMSK		(*(volatile unsigned *)0x4D00005C)


/* NAND FLASH */
#define rNFCONF			(*(volatile unsigned *)0x4E000000)
#define rNFCMD			(*(volatile unsigned *)0x4E000004)
#define rNFADDR			(*(volatile unsigned *)0x4E000008)
#define rNFDATA			(*(volatile unsigned *)0x4E00000C)
#define rNFSTAT			(*(volatile unsigned *)0x4E000010)
#define rNFECC			(*(volatile unsigned *)0x4E000014)


/* UART */
#define rULCON0			(*(volatile unsigned *)0x50000000)
#define rUCON0			(*(volatile unsigned *)0x50000004)
#define rUFCON0			(*(volatile unsigned *)0x50000008)
#define rUMCON0			(*(volatile unsigned *)0x5000000C)
#define rUTRSTAT0		(*(volatile unsigned *)0x50000010)
#define rUERSTAT0		(*(volatile unsigned *)0x50000014)
#define rUFSTAT0		(*(volatile unsigned *)0x50000018)
#define rUMSTAT0		(*(volatile unsigned *)0x5000001C)
#define rUBRDIV0		(*(volatile unsigned *)0x50000028)

#define rULCON1			(*(volatile unsigned *)0x50004000)
#define rUCON1			(*(volatile unsigned *)0x50004004)
#define rUFCON1			(*(volatile unsigned *)0x50004008)
#define rUMCON1			(*(volatile unsigned *)0x5000400C)
#define rUTRSTAT1		(*(volatile unsigned *)0x50004010)
#define rUERSTAT1		(*(volatile unsigned *)0x50004014)
#define rUFSTAT1		(*(volatile unsigned *)0x50004018)
#define rUMSTAT1		(*(volatile unsigned *)0x5000401C)
#define rUBRDIV1		(*(volatile unsigned *)0x50004028)

#define rULCON2			(*(volatile unsigned *)0x50008000)
#define rUCON2			(*(volatile unsigned *)0x50008004)
#define rUFCON2			(*(volatile unsigned *)0x50008008)
#define rUTRSTAT2		(*(volatile unsigned *)0x50008010)
#define rUERSTAT2		(*(volatile unsigned *)0x50008014)
#define rUFSTAT2		(*(volatile unsigned *)0x50008018)
#define rUBRDIV2		(*(volatile unsigned *)0x50008028)

#ifdef __BIG_ENDIAN
#define rUTXH0			(*(volatile unsigned char *)0x50000023)
#define rURXH0			(*(volatile unsigned char *)0x50000027)
#define rUTXH1			(*(volatile unsigned char *)0x50004023)
#define rURXH1			(*(volatile unsigned char *)0x50004027)
#define rUTXH2			(*(volatile unsigned char *)0x50008023)
#define rURXH2			(*(volatile unsigned char *)0x50008027)

#define WrUTXH0(ch)		(*(volatile unsigned char *)0x50000023)=(unsigned char)(ch)
#define RdURXH0()		(*(volatile unsigned char *)0x50000027)
#define WrUTXH1(ch)		(*(volatile unsigned char *)0x50004023)=(unsigned char)(ch)
#define RdURXH1()		(*(volatile unsigned char *)0x50004027)
#define WrUTXH2(ch)		(*(volatile unsigned char *)0x50008023)=(unsigned char)(ch)
#define RdURXH2()		(*(volatile unsigned char *)0x50008027)

#define UTXH0			(0x50000020+3)  /* byte_access address by DMA */
#define URXH0			(0x50000024+3)
#define UTXH1			(0x50004020+3)
#define URXH1			(0x50004024+3)
#define UTXH2			(0x50008020+3)
#define URXH2			(0x50008024+3)

#else /* Little Endian */
#define rUTXH0			(*(volatile unsigned char *)0x50000020)
#define rURXH0			(*(volatile unsigned char *)0x50000024)
#define rUTXH1			(*(volatile unsigned char *)0x50004020)
#define rURXH1			(*(volatile unsigned char *)0x50004024)
#define rUTXH2			(*(volatile unsigned char *)0x50008020)
#define rURXH2			(*(volatile unsigned char *)0x50008024)

#define WrUTXH0(ch)		(*(volatile unsigned char *)0x50000020)=(unsigned char)(ch)
#define RdURXH0()		(*(volatile unsigned char *)0x50000024)
#define WrUTXH1(ch)		(*(volatile unsigned char *)0x50004020)=(unsigned char)(ch)
#define RdURXH1()		(*(volatile unsigned char *)0x50004024)
#define WrUTXH2(ch)		(*(volatile unsigned char *)0x50008020)=(unsigned char)(ch)
#define RdURXH2()		(*(volatile unsigned char *)0x50008024)

#define UTXH0			(0x50000020)    /* byte_access address by DMA */
#define URXH0			(0x50000024)
#define UTXH1			(0x50004020)
#define URXH1			(0x50004024)
#define UTXH2			(0x50008020)
#define URXH2			(0x50008024)
#endif


/* PWM TIMER */
#define rTCFG0			(*(volatile unsigned *)0x51000000)
#define rTCFG1			(*(volatile unsigned *)0x51000004)
#define rTCON			(*(volatile unsigned *)0x51000008)
#define rTCNTB0			(*(volatile unsigned *)0x5100000C)
#define rTCMPB0			(*(volatile unsigned *)0x51000010)
#define rTCNTO0			(*(volatile unsigned *)0x51000014)
#define rTCNTB1			(*(volatile unsigned *)0x51000018)
#define rTCMPB1			(*(volatile unsigned *)0x5100001C)
#define rTCNTO1			(*(volatile unsigned *)0x51000020)
#define rTCNTB2			(*(volatile unsigned *)0x51000024)
#define rTCMPB2			(*(volatile unsigned *)0x51000028)
#define rTCNTO2			(*(volatile unsigned *)0x5100002C)
#define rTCNTB3			(*(volatile unsigned *)0x51000030)
#define rTCMPB3			(*(volatile unsigned *)0x51000034)
#define rTCNTO3			(*(volatile unsigned *)0x51000038)
#define rTCNTB4			(*(volatile unsigned *)0x5100003C)
#define rTCNTO4			(*(volatile unsigned *)0x51000040)


/* USB DEVICE */
#ifdef __BIG_ENDIAN
#define rFUNC_ADDR_REG		(*(volatile unsigned char *)0x52000143)
#define rPWR_REG		(*(volatile unsigned char *)0x52000147)
#define rEP_INT_REG		(*(volatile unsigned char *)0x5200014B)
#define rUSB_INT_REG		(*(volatile unsigned char *)0x5200015B)
#define rEP_INT_EN_REG		(*(volatile unsigned char *)0x5200015F)
#define rUSB_INT_EN_REG		(*(volatile unsigned char *)0x5200016F)
#define rFRAME_NUM1_REG		(*(volatile unsigned char *)0x52000173)
#define rFRAME_NUM2_REG		(*(volatile unsigned char *)0x52000177)
#define rINDEX_REG		(*(volatile unsigned char *)0x5200017B)
#define rMAXP_REG		(*(volatile unsigned char *)0x52000183)
#define rEP0_CSR		(*(volatile unsigned char *)0x52000187)
#define rIN_CSR1_REG		(*(volatile unsigned char *)0x52000187)
#define rIN_CSR2_REG		(*(volatile unsigned char *)0x5200018B)
#define rOUT_CSR1_REG		(*(volatile unsigned char *)0x52000193)
#define rOUT_CSR2_REG		(*(volatile unsigned char *)0x52000197)
#define rOUT_FIFO_CNT1_REG	(*(volatile unsigned char *)0x5200019B)
#define rOUT_FIFO_CNT2_REG	(*(volatile unsigned char *)0x5200019F)
#define rEP0_FIFO		(*(volatile unsigned char *)0x520001C3)
#define rEP1_FIFO		(*(volatile unsigned char *)0x520001C7)
#define rEP2_FIFO		(*(volatile unsigned char *)0x520001CB)
#define rEP3_FIFO		(*(volatile unsigned char *)0x520001CF)
#define rEP4_FIFO		(*(volatile unsigned char *)0x520001D3)
#define rEP1_DMA_CON		(*(volatile unsigned char *)0x52000203)
#define rEP1_DMA_UNIT		(*(volatile unsigned char *)0x52000207)
#define rEP1_DMA_FIFO		(*(volatile unsigned char *)0x5200020B)
#define rEP1_DMA_TX_LO		(*(volatile unsigned char *)0x5200020F)
#define rEP1_DMA_TX_MD		(*(volatile unsigned char *)0x52000213)
#define rEP1_DMA_TX_HI		(*(volatile unsigned char *)0x52000217)
#define rEP2_DMA_CON		(*(volatile unsigned char *)0x5200021B)
#define rEP2_DMA_UNIT		(*(volatile unsigned char *)0x5200021F)
#define rEP2_DMA_FIFO		(*(volatile unsigned char *)0x52000223)
#define rEP2_DMA_TX_LO		(*(volatile unsigned char *)0x52000227)
#define rEP2_DMA_TX_MD		(*(volatile unsigned char *)0x5200022B)
#define rEP2_DMA_TX_HI		(*(volatile unsigned char *)0x5200022F)
#define rEP3_DMA_CON		(*(volatile unsigned char *)0x52000243)
#define rEP3_DMA_UNIT		(*(volatile unsigned char *)0x52000247)
#define rEP3_DMA_FIFO		(*(volatile unsigned char *)0x5200024B)
#define rEP3_DMA_TX_LO		(*(volatile unsigned char *)0x5200024F)
#define rEP3_DMA_TX_MD		(*(volatile unsigned char *)0x52000253)
#define rEP3_DMA_TX_HI		(*(volatile unsigned char *)0x52000257)
#define rEP4_DMA_CON		(*(volatile unsigned char *)0x5200025B)
#define rEP4_DMA_UNIT		(*(volatile unsigned char *)0x5200025F)
#define rEP4_DMA_FIFO		(*(volatile unsigned char *)0x52000263)
#define rEP4_DMA_TX_LO		(*(volatile unsigned char *)0x52000267)
#define rEP4_DMA_TX_MD		(*(volatile unsigned char *)0x5200026B)
#define rEP4_DMA_TX_HI		(*(volatile unsigned char *)0x5200026F)
#else /*  little endian */
#define rFUNC_ADDR_REG		(*(volatile unsigned char *)0x52000140)
#define rPWR_REG		(*(volatile unsigned char *)0x52000144)
#define rEP_INT_REG		(*(volatile unsigned char *)0x52000148)
#define rUSB_INT_REG		(*(volatile unsigned char *)0x52000158)
#define rEP_INT_EN_REG		(*(volatile unsigned char *)0x5200015C)
#define rUSB_INT_EN_REG		(*(volatile unsigned char *)0x5200016C)
#define rFRAME_NUM1_REG		(*(volatile unsigned char *)0x52000170)
#define rFRAME_NUM2_REG		(*(volatile unsigned char *)0x52000174)
#define rINDEX_REG		(*(volatile unsigned char *)0x52000178)
#define rMAXP_REG		(*(volatile unsigned char *)0x52000180)
#define rEP0_CSR		(*(volatile unsigned char *)0x52000184)
#define rIN_CSR1_REG		(*(volatile unsigned char *)0x52000184)
#define rIN_CSR2_REG		(*(volatile unsigned char *)0x52000188)
#define rOUT_CSR1_REG		(*(volatile unsigned char *)0x52000190)
#define rOUT_CSR2_REG		(*(volatile unsigned char *)0x52000194)
#define rOUT_FIFO_CNT1_REG	(*(volatile unsigned char *)0x52000198)
#define rOUT_FIFO_CNT2_REG	(*(volatile unsigned char *)0x5200019C)
#define rEP0_FIFO		(*(volatile unsigned char *)0x520001C0)
#define rEP1_FIFO		(*(volatile unsigned char *)0x520001C4)
#define rEP2_FIFO		(*(volatile unsigned char *)0x520001C8)
#define rEP3_FIFO		(*(volatile unsigned char *)0x520001CC)
#define rEP4_FIFO		(*(volatile unsigned char *)0x520001D0)
#define rEP1_DMA_CON		(*(volatile unsigned char *)0x52000200)
#define rEP1_DMA_UNIT		(*(volatile unsigned char *)0x52000204)
#define rEP1_DMA_FIFO		(*(volatile unsigned char *)0x52000208)
#define rEP1_DMA_TX_LO		(*(volatile unsigned char *)0x5200020C)
#define rEP1_DMA_TX_MD		(*(volatile unsigned char *)0x52000210)
#define rEP1_DMA_TX_HI		(*(volatile unsigned char *)0x52000214)
#define rEP2_DMA_CON		(*(volatile unsigned char *)0x52000218)
#define rEP2_DMA_UNIT		(*(volatile unsigned char *)0x5200021C)
#define rEP2_DMA_FIFO		(*(volatile unsigned char *)0x52000220)
#define rEP2_DMA_TX_LO		(*(volatile unsigned char *)0x52000224)
#define rEP2_DMA_TX_MD		(*(volatile unsigned char *)0x52000228)
#define rEP2_DMA_TX_HI		(*(volatile unsigned char *)0x5200022C)
#define rEP3_DMA_CON		(*(volatile unsigned char *)0x52000240)
#define rEP3_DMA_UNIT		(*(volatile unsigned char *)0x52000244)
#define rEP3_DMA_FIFO		(*(volatile unsigned char *)0x52000248)
#define rEP3_DMA_TX_LO		(*(volatile unsigned char *)0x5200024C)
#define rEP3_DMA_TX_MD		(*(volatile unsigned char *)0x52000250)
#define rEP3_DMA_TX_HI		(*(volatile unsigned char *)0x52000254)
#define rEP4_DMA_CON		(*(volatile unsigned char *)0x52000258)
#define rEP4_DMA_UNIT		(*(volatile unsigned char *)0x5200025C)
#define rEP4_DMA_FIFO		(*(volatile unsigned char *)0x52000260)
#define rEP4_DMA_TX_LO		(*(volatile unsigned char *)0x52000264)
#define rEP4_DMA_TX_MD		(*(volatile unsigned char *)0x52000268)
#define rEP4_DMA_TX_HI		(*(volatile unsigned char *)0x5200026C)
#endif /*  __BIG_ENDIAN */


/* WATCH DOG TIMER */
#define rWTCON			(*(volatile unsigned *)0x53000000)
#define rWTDAT			(*(volatile unsigned *)0x53000004)
#define rWTCNT			(*(volatile unsigned *)0x53000008)


/* IIC */
#define rIICCON			(*(volatile unsigned *)0x54000000)
#define rIICSTAT		(*(volatile unsigned *)0x54000004)
#define rIICADD			(*(volatile unsigned *)0x54000008)
#define rIICDS			(*(volatile unsigned *)0x5400000C)


/* IIS */
#define rIISCON			(*(volatile unsigned *)0x55000000)
#define rIISMOD			(*(volatile unsigned *)0x55000004)
#define rIISPSR			(*(volatile unsigned *)0x55000008)
#define rIISFCON		(*(volatile unsigned *)0x5500000C)

#ifdef __BIG_ENDIAN
#define IISFIF			((volatile unsigned short *)0x55000012)
#else /*  little endian */
#define IISFIF			((volatile unsigned short *)0x55000010)
#endif


/* I/O PORT */
#define rGPACON			(*(volatile unsigned *)0x56000000)
#define rGPADAT			(*(volatile unsigned *)0x56000004)

#define rGPBCON			(*(volatile unsigned *)0x56000010)
#define rGPBDAT			(*(volatile unsigned *)0x56000014)
#define rGPBUP			(*(volatile unsigned *)0x56000018)

#define rGPCCON			(*(volatile unsigned *)0x56000020)
#define rGPCDAT			(*(volatile unsigned *)0x56000024)
#define rGPCUP			(*(volatile unsigned *)0x56000028)

#define rGPDCON			(*(volatile unsigned *)0x56000030)
#define rGPDDAT			(*(volatile unsigned *)0x56000034)
#define rGPDUP			(*(volatile unsigned *)0x56000038)

#define rGPECON			(*(volatile unsigned *)0x56000040)
#define rGPEDAT			(*(volatile unsigned *)0x56000044)
#define rGPEUP			(*(volatile unsigned *)0x56000048)

#define rGPFCON			(*(volatile unsigned *)0x56000050)
#define rGPFDAT			(*(volatile unsigned *)0x56000054)
#define rGPFUP			(*(volatile unsigned *)0x56000058)

#define rGPGCON			(*(volatile unsigned *)0x56000060)
#define rGPGDAT			(*(volatile unsigned *)0x56000064)
#define rGPGUP			(*(volatile unsigned *)0x56000068)

#define rGPHCON			(*(volatile unsigned *)0x56000070)
#define rGPHDAT			(*(volatile unsigned *)0x56000074)
#define rGPHUP			(*(volatile unsigned *)0x56000078)

#define rMISCCR			(*(volatile unsigned *)0x56000080)
#define rDCLKCON		(*(volatile unsigned *)0x56000084)
#define rEXTINT0		(*(volatile unsigned *)0x56000088)
#define rEXTINT1		(*(volatile unsigned *)0x5600008C)
#define rEXTINT2		(*(volatile unsigned *)0x56000090)
#define rEINTFLT0		(*(volatile unsigned *)0x56000094)
#define rEINTFLT1		(*(volatile unsigned *)0x56000098)
#define rEINTFLT2		(*(volatile unsigned *)0x5600009C)
#define rEINTFLT3		(*(volatile unsigned *)0x560000A0)
#define rEINTMASK		(*(volatile unsigned *)0x560000A4)
#define rEINTPEND		(*(volatile unsigned *)0x560000A8)
#define rGSTATUS0		(*(volatile unsigned *)0x560000AC)
#define rGSTATUS1		(*(volatile unsigned *)0x560000B0)


/* RTC */
#ifdef __BIG_ENDIAN
#define rRTCCON			(*(volatile unsigned char *)0x57000043)
#define rTICNT			(*(volatile unsigned char *)0x57000047)
#define rRTCALM			(*(volatile unsigned char *)0x57000053)
#define rALMSEC			(*(volatile unsigned char *)0x57000057)
#define rALMMIN			(*(volatile unsigned char *)0x5700005B)
#define rALMHOUR		(*(volatile unsigned char *)0x5700005F)
#define rALMDATE		(*(volatile unsigned char *)0x57000063)
#define rALMMON			(*(volatile unsigned char *)0x57000067)
#define rALMYEAR		(*(volatile unsigned char *)0x5700006B)
#define rRTCRST			(*(volatile unsigned char *)0x5700006F)
#define rBCDSEC			(*(volatile unsigned char *)0x57000073)
#define rBCDMIN			(*(volatile unsigned char *)0x57000077)
#define rBCDHOUR		(*(volatile unsigned char *)0x5700007B)
#define rBCDDATE		(*(volatile unsigned char *)0x5700007F)
#define rBCDDAY			(*(volatile unsigned char *)0x57000083)
#define rBCDMON			(*(volatile unsigned char *)0x57000087)
#define rBCDYEAR		(*(volatile unsigned char *)0x5700008B)
#else /*  little endian */
#define rRTCCON			(*(volatile unsigned char *)0x57000040)
#define rTICNT			(*(volatile unsigned char *)0x57000044)
#define rRTCALM			(*(volatile unsigned char *)0x57000050)
#define rALMSEC			(*(volatile unsigned char *)0x57000054)
#define rALMMIN			(*(volatile unsigned char *)0x57000058)
#define rALMHOUR		(*(volatile unsigned char *)0x5700005C)
#define rALMDATE		(*(volatile unsigned char *)0x57000060)
#define rALMMON			(*(volatile unsigned char *)0x57000064)
#define rALMYEAR		(*(volatile unsigned char *)0x57000068)
#define rRTCRST			(*(volatile unsigned char *)0x5700006C)
#define rBCDSEC			(*(volatile unsigned char *)0x57000070)
#define rBCDMIN			(*(volatile unsigned char *)0x57000074)
#define rBCDHOUR		(*(volatile unsigned char *)0x57000078)
#define rBCDDATE		(*(volatile unsigned char *)0x5700007C)
#define rBCDDAY			(*(volatile unsigned char *)0x57000080)
#define rBCDMON			(*(volatile unsigned char *)0x57000084)
#define rBCDYEAR		(*(volatile unsigned char *)0x57000088)
#endif


/* ADC */
#define rADCCON			(*(volatile unsigned *)0x58000000)
#define rADCTSC			(*(volatile unsigned *)0x58000004)
#define rADCDLY			(*(volatile unsigned *)0x58000008)
#define rADCDAT0		(*(volatile unsigned *)0x5800000C)
#define rADCDAT1		(*(volatile unsigned *)0x58000010)


/* SPI */
#define rSPCON0			(*(volatile unsigned *)0x59000000)
#define rSPSTA0			(*(volatile unsigned *)0x59000004)
#define rSPPIN0			(*(volatile unsigned *)0x59000008)
#define rSPPRE0			(*(volatile unsigned *)0x5900000C)
#define rSPTDAT0		(*(volatile unsigned *)0x59000010)
#define rSPRDAT0		(*(volatile unsigned *)0x59000014)
#define rSPCON1			(*(volatile unsigned *)0x59000020)
#define rSPSTA1			(*(volatile unsigned *)0x59000024)
#define rSPPIN1			(*(volatile unsigned *)0x59000028)
#define rSPPRE1			(*(volatile unsigned *)0x5900002C)
#define rSPTDAT1		(*(volatile unsigned *)0x59000030)
#define rSPRDAT1		(*(volatile unsigned *)0x59000034)


/* SD INTERFACE */
#define rSDICON			(*(volatile unsigned *)0x5A000000)
#define rSDIPRE			(*(volatile unsigned *)0x5A000004)
#define rSDICmdArg		(*(volatile unsigned *)0x5A000008)
#define rSDICmdCon		(*(volatile unsigned *)0x5A00000C)
#define rSDICmdSta		(*(volatile unsigned *)0x5A000010)
#define rSDIRSP0		(*(volatile unsigned *)0x5A000014)
#define rSDIRSP1		(*(volatile unsigned *)0x5A000018)
#define rSDIRSP2		(*(volatile unsigned *)0x5A00001C)
#define rSDIRSP3		(*(volatile unsigned *)0x5A000020)
#define rSDIDTimer		(*(volatile unsigned *)0x5A000024)
#define rSDIBSize		(*(volatile unsigned *)0x5A000028)
#define rSDIDatCon		(*(volatile unsigned *)0x5A00002C)
#define rSDIDatCnt		(*(volatile unsigned *)0x5A000030)
#define rSDIDatSta		(*(volatile unsigned *)0x5A000034)
#define rSDIFSTA		(*(volatile unsigned *)0x5A000038)
#ifdef __BIG_ENDIAN
#define rSDIDAT			(*(volatile unsigned char *)0x5A00003F)
#else
#define rSDIDAT			(*(volatile unsigned char *)0x5A00003C)
#endif
#define rSDIIntMsk		(*(volatile unsigned *)0x5A000040)

#endif


#ifndef __DONOTINCLUDE_ASSEMBLER

typedef enum {
	S3C24X0_UART0,
	S3C24X0_UART1,
	S3C24X0_UART2
} S3C24X0_UARTS_NR;

/* include common stuff */
#include <s3c24x0.h>

#if defined(CONFIG_S3C2440)
typedef struct {
	S3C24X0_REG32	GPACON;
	S3C24X0_REG32	GPADAT;
	S3C24X0_REG32	res1[2];
	S3C24X0_REG32	GPBCON;
	S3C24X0_REG32	GPBDAT;
	S3C24X0_REG32	GPBUP;
	S3C24X0_REG32	res2;
	S3C24X0_REG32	GPCCON;
	S3C24X0_REG32	GPCDAT;
	S3C24X0_REG32	GPCUP;
	S3C24X0_REG32	res3;
	S3C24X0_REG32	GPDCON;
	S3C24X0_REG32	GPDDAT;
	S3C24X0_REG32	GPDUP;
	S3C24X0_REG32	res4;
	S3C24X0_REG32	GPECON;
	S3C24X0_REG32	GPEDAT;
	S3C24X0_REG32	GPEUP;
	S3C24X0_REG32	res5;
	S3C24X0_REG32	GPFCON;
	S3C24X0_REG32	GPFDAT;
	S3C24X0_REG32	GPFUP;
	S3C24X0_REG32	res6;
	S3C24X0_REG32	GPGCON;
	S3C24X0_REG32	GPGDAT;
	S3C24X0_REG32	GPGUP;
	S3C24X0_REG32	res7;
	S3C24X0_REG32	GPHCON;
	S3C24X0_REG32	GPHDAT;
	S3C24X0_REG32	GPHUP;		// 0x56000078
	S3C24X0_REG32	res8;		// 0x5600007C

	S3C24X0_REG32	MISCCR;		// 0x56000080
	S3C24X0_REG32	DCLKCON;
	S3C24X0_REG32	EXTINT0;
	S3C24X0_REG32	EXTINT1;
	S3C24X0_REG32	EXTINT2;
	S3C24X0_REG32	EINTFLT0;
	S3C24X0_REG32	EINTFLT1;
	S3C24X0_REG32	EINTFLT2;
	S3C24X0_REG32	EINTFLT3;
	S3C24X0_REG32	EINTMASK;
	S3C24X0_REG32	EINTPEND;
	S3C24X0_REG32	GSTATUS0;
	S3C24X0_REG32	GSTATUS1;
	S3C24X0_REG32	GSTATUS2;
	S3C24X0_REG32	GSTATUS3;
	S3C24X0_REG32	GSTATUS4;
	S3C24X0_REG32	MSLCON;
	
	S3C24X0_REG32	GPJCON;
	S3C24X0_REG32	GPJDAT;
	S3C24X0_REG32	GPJUP;		// 0x560000D8
} /*__attribute__((__packed__))*/ S3C2440_GPIO;
#endif


static inline S3C24X0_MEMCTL * S3C24X0_GetBase_MEMCTL(void)
{
	return (S3C24X0_MEMCTL * )S3C24X0_MEMCTL_BASE;
}
static inline S3C24X0_USB_HOST *  S3C24X0_GetBase_USB_HOST(void)
{
	return (S3C24X0_USB_HOST * )S3C24X0_USB_HOST_BASE;
}
static inline S3C24X0_INTERRUPT *  S3C24X0_GetBase_INTERRUPT(void)
{
	return (S3C24X0_INTERRUPT * )S3C24X0_INTERRUPT_BASE;
}
static inline S3C24X0_DMAS *  S3C24X0_GetBase_DMAS(void)
{
	return (S3C24X0_DMAS * )S3C24X0_DMA_BASE;
}
static inline S3C24X0_CLOCK_POWER *  S3C24X0_GetBase_CLOCK_POWER(void)
{
	return (S3C24X0_CLOCK_POWER * )S3C24X0_CLOCK_POWER_BASE;
}
static inline S3C24X0_LCD *  S3C24X0_GetBase_LCD(void)
{
	return (S3C24X0_LCD * )S3C24X0_LCD_BASE;
}

static inline S3C2440_NAND *  S3C2440_GetBase_NAND(void)
{
	return (S3C2440_NAND * )S3C2440_NAND_BASE;
}

static inline S3C24X0_UART *  S3C24X0_GetBase_UART(S3C24X0_UARTS_NR nr)
{
	return (S3C24X0_UART * )(S3C24X0_UART_BASE + (nr * 0x4000));
}
static inline S3C24X0_TIMERS *  S3C24X0_GetBase_TIMERS(void)
{
	return (S3C24X0_TIMERS * )S3C24X0_TIMER_BASE;
}
static inline S3C24X0_USB_DEVICE *  S3C24X0_GetBase_USB_DEVICE(void)
{
	return (S3C24X0_USB_DEVICE * )S3C24X0_USB_DEVICE_BASE;
}
static inline S3C24X0_WATCHDOG *  S3C24X0_GetBase_WATCHDOG(void)
{
	return (S3C24X0_WATCHDOG * )S3C24X0_WATCHDOG_BASE;
}
static inline S3C24X0_I2C *  S3C24X0_GetBase_I2C(void)
{
	return (S3C24X0_I2C * )S3C24X0_I2C_BASE;
}
static inline S3C24X0_I2S *  S3C24X0_GetBase_I2S(void)
{
	return (S3C24X0_I2S * )S3C24X0_I2S_BASE;
}

static inline S3C2440_GPIO *  S3C2440_GetBase_GPIO(void)
{
	return (S3C2440_GPIO * )S3C24X0_GPIO_BASE;
}

static inline S3C24X0_RTC *  S3C24X0_GetBase_RTC(void)
{
	return (S3C24X0_RTC * )S3C24X0_RTC_BASE;
}

static inline S3C2440_ADC *  S3C2440_GetBase_ADC(void)
{
	return (S3C2440_ADC * )S3C2440_ADC_BASE;
}

static inline S3C24X0_SPI *  S3C24X0_GetBase_SPI(void)
{
	return (S3C24X0_SPI * )S3C24X0_SPI_BASE;
}

static inline S3C2440_SDI *  S3C2440_GetBase_SDI(void)
{
	return (S3C2440_SDI * )S3C2440_SDI_BASE;
}

ulong get_PCLK(void);


/* ISR */
#define pISR_RESET		(*(unsigned *)(_ISR_STARTADDRESS+0x0))
#define pISR_UNDEF		(*(unsigned *)(_ISR_STARTADDRESS+0x4))
#define pISR_SWI		(*(unsigned *)(_ISR_STARTADDRESS+0x8))
#define pISR_PABORT		(*(unsigned *)(_ISR_STARTADDRESS+0xC))
#define pISR_DABORT		(*(unsigned *)(_ISR_STARTADDRESS+0x10))
#define pISR_RESERVED	(*(unsigned *)(_ISR_STARTADDRESS+0x14))
#define pISR_IRQ		(*(unsigned *)(_ISR_STARTADDRESS+0x18))
#define pISR_FIQ		(*(unsigned *)(_ISR_STARTADDRESS+0x1C))

#define pISR_EINT0		(*(unsigned *)(_ISR_STARTADDRESS+0x20))
#define pISR_EINT1		(*(unsigned *)(_ISR_STARTADDRESS+0x24))
#define pISR_EINT2		(*(unsigned *)(_ISR_STARTADDRESS+0x28))
#define pISR_EINT3		(*(unsigned *)(_ISR_STARTADDRESS+0x2C))
#define pISR_EINT4_7		(*(unsigned *)(_ISR_STARTADDRESS+0x30))
#define pISR_EINT8_23		(*(unsigned *)(_ISR_STARTADDRESS+0x34))
#define pISR_BAT_FLT		(*(unsigned *)(_ISR_STARTADDRESS+0x3C))
#define pISR_TICK		(*(unsigned *)(_ISR_STARTADDRESS+0x40))
#define pISR_WDT		(*(unsigned *)(_ISR_STARTADDRESS+0x44))
#define pISR_TIMER0		(*(unsigned *)(_ISR_STARTADDRESS+0x48))
#define pISR_TIMER1		(*(unsigned *)(_ISR_STARTADDRESS+0x4C))
#define pISR_TIMER2		(*(unsigned *)(_ISR_STARTADDRESS+0x50))
#define pISR_TIMER3		(*(unsigned *)(_ISR_STARTADDRESS+0x54))
#define pISR_TIMER4		(*(unsigned *)(_ISR_STARTADDRESS+0x58))
#define pISR_UART2		(*(unsigned *)(_ISR_STARTADDRESS+0x5C))
#define pISR_NOTUSED		(*(unsigned *)(_ISR_STARTADDRESS+0x60))
#define pISR_DMA0		(*(unsigned *)(_ISR_STARTADDRESS+0x64))
#define pISR_DMA1		(*(unsigned *)(_ISR_STARTADDRESS+0x68))
#define pISR_DMA2		(*(unsigned *)(_ISR_STARTADDRESS+0x6C))
#define pISR_DMA3		(*(unsigned *)(_ISR_STARTADDRESS+0x70))
#define pISR_SDI		(*(unsigned *)(_ISR_STARTADDRESS+0x74))
#define pISR_SPI0		(*(unsigned *)(_ISR_STARTADDRESS+0x78))
#define pISR_UART1		(*(unsigned *)(_ISR_STARTADDRESS+0x7C))
#define pISR_USBD		(*(unsigned *)(_ISR_STARTADDRESS+0x84))
#define pISR_USBH		(*(unsigned *)(_ISR_STARTADDRESS+0x88))
#define pISR_IIC		(*(unsigned *)(_ISR_STARTADDRESS+0x8C))
#define pISR_UART0		(*(unsigned *)(_ISR_STARTADDRESS+0x90))
#define pISR_SPI1		(*(unsigned *)(_ISR_STARTADDRESS+0x94))
#define pISR_RTC		(*(unsigned *)(_ISR_STARTADDRESS+0x98))
#define pISR_ADC		(*(unsigned *)(_ISR_STARTADDRESS+0xA0))


/* PENDING BIT */
#define BIT_EINT0		(0x1)
#define BIT_EINT1		(0x1<<1)
#define BIT_EINT2		(0x1<<2)
#define BIT_EINT3		(0x1<<3)
#define BIT_EINT4_7		(0x1<<4)
#define BIT_EINT8_23		(0x1<<5)
#define BIT_BAT_FLT		(0x1<<7)
#define BIT_TICK		(0x1<<8)
#define BIT_WDT			(0x1<<9)
#define BIT_TIMER0		(0x1<<10)
#define BIT_TIMER1		(0x1<<11)
#define BIT_TIMER2		(0x1<<12)
#define BIT_TIMER3		(0x1<<13)
#define BIT_TIMER4		(0x1<<14)
#define BIT_UART2		(0x1<<15)
#define BIT_LCD			(0x1<<16)
#define BIT_DMA0		(0x1<<17)
#define BIT_DMA1		(0x1<<18)
#define BIT_DMA2		(0x1<<19)
#define BIT_DMA3		(0x1<<20)
#define BIT_SDI			(0x1<<21)
#define BIT_SPI0		(0x1<<22)
#define BIT_UART1		(0x1<<23)
#define BIT_USBD		(0x1<<25)
#define BIT_USBH		(0x1<<26)
#define BIT_IIC			(0x1<<27)
#define BIT_UART0		(0x1<<28)
#define BIT_SPI1		(0x1<<29)
#define BIT_RTC			(0x1<<30)
#define BIT_ADC			(0x1<<31)
#define BIT_ALLMSK		(0xFFFFFFFF)

#define ClearPending(bit) {\
		 rSRCPND = bit;\
		 rINTPND = bit;\
		 rINTPND;\
		 }
		 
/* I/O Port macros */

#define GPIO_INPUT 0
#define GPIO_OUTPUT 1
#define GPIO_FUNCTION 2
#define GPIO_ALT_FUNCTION 3

#define GPIO_PULLUP_DISABLE 1
#define GPIO_PULLUP_ENABLE 0

#define S3C2440_GPIO_CONFIG(port,pin,function) port = ( (port & ~(3<<(pin*2)) ) | (function<<(pin*2)) )
#define S3C2440_GPIO_PULLUP(port,pin,state) port = ( (port & ~(1<<pin ) ) | (state<<pin ) )


/* Wait until rINTPND is changed for the case that the ISR is very short. */
#endif /*__S3C2440_H__*/

#undef __DONOTINCLUDE_ASSEMBLER
#endif /*STARTS*/
