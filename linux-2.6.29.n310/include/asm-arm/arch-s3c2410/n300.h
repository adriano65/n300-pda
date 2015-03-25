/* linux/include/asm-arm/arch-s3c2410/n311.h
 *
 * Copyright 2006 Ben Dooks <ben-linux@fluff.org>
 *
 * H1940 definitions
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#ifndef __ASM_ARCH_N311_H
#define __ASM_ARCH_N311_H

#include <plat/udc.h>

#define H1940_SUSPEND_CHECKSUM		(0x30003ff8)
#define H1940_SUSPEND_RESUMEAT		(0x30081000)
#define H1940_SUSPEND_CHECK		(0x30080000)

extern int n300_backlight_power(int enable);
extern int n300_lcdpower_lcd_enable(int enable);
extern void n300_udc_pullup(enum s3c2410_udc_cmd_e cmd);
extern void n300_set_brightness(int val);

#define GOFORCEMEMSTART 	0x20000000
#define MEMSZ 				0xb20
#define GOFORCE_CH0 		GOFORCEMEMSTART+0x0000
#define GOFORCE_CH0_CMDFIFO GOFORCE_CH0+0x800
#define GOFORCE_ASYNCREG 	GOFORCE_CH0+0x2000
#define GOFORCE_SYNCREG 	GOFORCE_CH0+0x3000

#define GOFORCE_CH1 GOFORCEMEMSTART+0x4000
#define VIDEO_BASE_REG32(x) (*(volatile unsigned long *)(GOFORCEMEMSTART+x))
#define VIDEO_BASE          VIDEO_BASE_REG32(0x0)


#endif /* __ASM_ARCH_N311_H */
