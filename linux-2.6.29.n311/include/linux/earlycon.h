/*
 * Definitions for earlycon driver implementers
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

#ifndef LINUX_EARLYCON_H
#define LINUX_EARLYCON_H

#include <linux/init.h>

struct earlycon_desc;

struct earlycon_drv {
	const struct earlycon_desc *desc;
	unsigned int machid;
	unsigned long base;
	void *data;
	int (*probe)(struct earlycon_drv *drv);
	void (*putc)(struct earlycon_drv *drv, int ch);
	void (*flush)(struct earlycon_drv *drv);
	void *(*reloc_text)(void *);
};

struct earlycon_desc {
	const char name[16];
	int (*probe)(struct earlycon_drv *drv);
	void (*putc)(struct earlycon_drv *drv, int ch);
	void (*flush)(struct earlycon_drv *drv);
};

#ifndef EARLYCON_IN_DECOMPRESSOR
# define __machine_arch_type  (drv->machid)
#endif

#define RELOC_FUN(_f)   ((typeof(&_f))(drv->reloc_text(_f)))

/*
 * Set of macros to define earlycon features.  This is built into
 * a table by the linker.
 */
#define EARLYCON_START(_name)                              \
static const struct earlycon_desc __earlycon_desc          \
  __used                                                   \
  __attribute__((__section__(".earlycon.info.desc"))) = {  \
	.name = _name,

#define EARLYCON_END                                       \
};

#define __earlyconinit      __section(.earlycon.info.text)

#endif /* LINUX_EARLYCON_H */