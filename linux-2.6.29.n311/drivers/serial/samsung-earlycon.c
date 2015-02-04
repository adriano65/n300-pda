/*
 * Earlycon driver for Samsung UARTs
 *
 * Copyright (C) 2012 Domenico Andreoli <domenico.andreoli@xxxxxxxxx>
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <linux/errno.h>
#include <linux/earlycon.h>

typedef unsigned int upf_t;	/* cannot include linux/serial_core.h */

#include <mach/map.h>
#include <mach/regs-gpio.h>
#include <plat/regs-serial.h>

struct uart_drvdata {
	unsigned int fifo_mask;
	unsigned int fifo_max;
};

#define uart_wr(_base, _reg, _val)   *((volatile unsigned int *)((_base) + (_reg))) = (_val)
#define uart_rd(_base, _reg)         *((volatile unsigned int *)((_base) + (_reg)))

#if defined(CONFIG_ARCH_S3C24XX)

static int __earlyconinit is_arm926(void)
{
	unsigned int cpuid;

	asm volatile ("mrc p15, 0, %0, c1, c0, 0" : "=r" (cpuid));

	return ((cpuid & 0xff0) == 0x260);
}

static int __earlyconinit samsung_earlycon_config(struct uart_drvdata *drvdata)
{
	unsigned int cpuid;

	cpuid = *((volatile unsigned int *)S3C2410_GSTATUS1);
	cpuid &= S3C2410_GSTATUS1_IDMASK;

	if (RELOC_FUN(is_arm926)() || cpuid == S3C2410_GSTATUS1_2440 ||
	    cpuid == S3C2410_GSTATUS1_2442 ||
	    cpuid == S3C2410_GSTATUS1_2416 ||
	    cpuid == S3C2410_GSTATUS1_2450) {
		drvdata->fifo_mask = S3C2440_UFSTAT_TXMASK;
		drvdata->fifo_max = 63 << S3C2440_UFSTAT_TXSHIFT;
	} else {
		drvdata->fifo_mask = S3C2410_UFSTAT_TXMASK;
		drvdata->fifo_max = 15 << S3C2410_UFSTAT_TXSHIFT;
	}

	return 0;
}

#elif defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_ARCH_S5PC100)

static int __earlyconinit samsung_earlycon_config(struct uart_drvdata *drvdata)
{
	drvdata->fifo_mask = S3C2440_UFSTAT_TXMASK;
	drvdata->fifo_max = 63 << S3C2440_UFSTAT_TXSHIFT;
	return 0;
}

#elif defined(CONFIG_ARCH_ARCH_S5PV210) || defined(CONFIG_ARCH_ARCH_EXYNOS)

static int __earlyconinit samsung_earlycon_config(struct uart_drvdata *drvdata)
{
	drvdata->fifo_mask = S5PV210_UFSTAT_TXMASK;
	drvdata->fifo_max = 15 << S5PV210_UFSTAT_TXSHIFT;
	return 0;
}

#else

static int __earlyconinit samsung_earlycon_config(struct uart_drvdata *drvdata)
{
	return -1;
}

#endif

static int __earlyconinit samsung_earlycon_probe(struct earlycon_drv *drv)
{
	struct uart_drvdata *drvdata = (struct uart_drvdata *) drv->data;
	unsigned long fifocon;
	int retries = 1000;

	/* this driver doesn't support probing of the base address */
	if (!drv->base)
		return -EINVAL;

	if (RELOC_FUN(samsung_earlycon_config)(drvdata))
		return -EINVAL;

	/* Enable the UART FIFOs if they are not enabled and our
	 * configuration says we should turn them on.
	 */
	if (IS_ENABLED(CONFIG_S3C_BOOT_UART_FORCE_FIFO)) {
		fifocon = uart_rd(drv->base, S3C2410_UFCON);

		if (!(fifocon & S3C2410_UFCON_FIFOMODE)) {
			fifocon |= S3C2410_UFCON_RESETBOTH;
			uart_wr(drv->base, S3C2410_UFCON, fifocon);

			/* wait for fifo reset to complete */
			while (retries--) {
				fifocon = uart_rd(drv->base, S3C2410_UFCON);
				if (!(fifocon & S3C2410_UFCON_RESETBOTH))
					break;
				barrier();
			}
		}
	}


	return retries ? 0 : -EBUSY;
}

/* we can deal with the case the UARTs are being run
 * in FIFO mode, so that we don't hold up our execution
 * waiting for tx to happen...
*/
static void __earlyconinit samsung_earlycon_putc(struct earlycon_drv *drv, int ch)
{
	struct uart_drvdata *drvdata = (struct uart_drvdata *) drv->data;

	if (drvdata && uart_rd(drv->base, S3C2410_UFCON) & S3C2410_UFCON_FIFOMODE) {
		int level;

		while (1) {
			level = uart_rd(drv->base, S3C2410_UFSTAT);
			level &= drvdata->fifo_mask;

			if (level < drvdata->fifo_max)
				break;
		}

	} else {
		/* not using fifos */
		while ((uart_rd(drv->base, S3C2410_UTRSTAT) & S3C2410_UTRSTAT_TXE) != S3C2410_UTRSTAT_TXE)
			barrier();
	}

	/* write byte to transmission register */
	uart_wr(drv->base, S3C2410_UTXH, ch);
}

static void __earlyconinit samsung_earlycon_flush(struct earlycon_drv *drv)
{
	/* TODO */
}

EARLYCON_START("samsung-uart")
	.probe = samsung_earlycon_probe,
	.putc = samsung_earlycon_putc,
	.flush = samsung_earlycon_flush,
EARLYCON_END