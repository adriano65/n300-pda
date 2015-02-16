/*
 * (C) Copyright 2003
 * David Müller ELSOFT AG Switzerland. d.mueller@elsoft.ch
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
#define S3C24X0_INTERRUPT_MASK		0x4A000008
#define S3C24X0_INTERRUPT_SUBMASK	0x4A00001C

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

#ifndef __STARTS

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
#define pISR_RESERVED		(*(unsigned *)(_ISR_STARTADDRESS+0x14))
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

#undef __STARTS
#endif /*STARTS*/
