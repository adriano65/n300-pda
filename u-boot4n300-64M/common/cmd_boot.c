/*
 * (C) Copyright 2000-2003
 * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
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

/*
 * Misc boot support
 */
#include <common.h>
#include <command.h>
#include <net.h>

#if defined(CONFIG_I386)
DECLARE_GLOBAL_DATA_PTR;
#endif

void  call_linux(long a0, long a1, long a2)
{   
#ifdef CONFIG_S3C2410
__asm__(
	    "   mov r1, #0\n"
	    "   mov r1, #7 << 5\n"        /* 8 segments */
	    "1: orr r3, r1, #63 << 26\n"      /* 64 entries */
	    "2: mcr p15, 0, r3, c7, c14, 2\n" /* clean & invalidate D index */
	    "   subs    r3, r3, #1 << 26\n"
	    "   bcs 2b\n"             /* entries 64 to 0 */
	    "   subs    r1, r1, #1 << 5\n"
	    "   bcs 1b\n"             /* segments 7 to 0 */
	    "   mcr p15, 0, r1, c7, c5, 0\n"  /* invalidate I cache */
	    "   mcr p15, 0, r1, c7, c10, 4\n" /* drain WB */
);


__asm__(
	    "mov    r0, #0\n"
	    "mcr    p15, 0, r0, c7, c10, 4\n"   /* drain WB */
	    "mcr    p15, 0, r0, c8, c7, 0\n"    /* invalidate I & D TLBs */
);


__asm__(
	    "mov    r0, %0\n"
	    "mov    r1, #0x0c1\n"
	    "mov    r2, %2\n"
	    "mov    ip, #0\n"
	    "mcr    p15, 0, ip, c13, c0, 0\n"   /* zero PID */
	    "mcr    p15, 0, ip, c7, c7, 0\n"    /* invalidate I,D caches */
	    "mcr    p15, 0, ip, c7, c10, 4\n"   /* drain write buffer */
	    "mcr    p15, 0, ip, c8, c7, 0\n"    /* invalidate I,D TLBs */
	    "mrc    p15, 0, ip, c1, c0, 0\n"    /* get control register */
	    "bic    ip, ip, #0x0001\n"      /* disable MMU */
	    "mcr    p15, 0, ip, c1, c0, 0\n"    /* write control register */
	    "mov    pc, r2\n"
	    "nop\n"
	    "nop\n"
	    : /* no outpus */
	    : "r" (a0), "r" (a1), "r" (a2)
);
#endif

#ifdef CONFIG_S3C2440
__asm__(
            "   mov r1, #0\n"
            "   mov r1, #7 << 5\n"        /* 8 segments */
            "1: orr r3, r1, #63 << 26\n"      /* 64 entries */
            "2: mcr p15, 0, r3, c7, c14, 2\n" /* clean & invalidate D index */
            "   subs    r3, r3, #1 << 26\n"
            "   bcs 2b\n"             /* entries 64 to 0 */
            "   subs    r1, r1, #1 << 5\n"
            "   bcs 1b\n"             /* segments 7 to 0 */
            "   mcr p15, 0, r1, c7, c5, 0\n"  /* invalidate I cache */
            "   mcr p15, 0, r1, c7, c10, 4\n" /* drain WB */
);


__asm__(
            "mov    r0, #0\n"
            "mcr    p15, 0, r0, c7, c10, 4\n"   /* drain WB */
            "mcr    p15, 0, r0, c8, c7, 0\n"    /* invalidate I & D TLBs */
);

__asm__(
            "mov    r0, %0\n"
	    "ldr    r1, =0x16a\n"
            "mov    r2, %2\n"
            "mov    ip, #0\n"
            "mcr    p15, 0, ip, c13, c0, 0\n"   /* zero PID */
            "mcr    p15, 0, ip, c7, c7, 0\n"    /* invalidate I,D caches */
            "mcr    p15, 0, ip, c7, c10, 4\n"   /* drain write buffer */
            "mcr    p15, 0, ip, c8, c7, 0\n"    /* invalidate I,D TLBs */
            "mrc    p15, 0, ip, c1, c0, 0\n"    /* get control register */
            "bic    ip, ip, #0x0001\n"      /* disable MMU */
            "mcr    p15, 0, ip, c1, c0, 0\n"    /* write control register */
            "mov    pc, r2\n"
            "nop\n"
            "nop\n"
            : /* no outpus */
            : "r" (a0), "r" (a1), "r" (a2)
);
#endif
}
static void setup_linux_param(ulong param_base)
{   
struct param_struct *params = (struct param_struct *)param_base; 
char *linux_cmd;

//linux_cmd = "noinitrd root=/dev/mtdblock/2 init=/linuxrc console=ttyS0";
linux_cmd = getenv("bootargs");
memset(params, 0, sizeof(struct param_struct));

params->u1.s.page_size = 0x00001000;
params->u1.s.nr_pages = (0x04000000 >> 12);
/* set linux command line */
memcpy(params->commandline, linux_cmd, strlen(linux_cmd) + 1);
}
int do_go (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
{
	ulong	addr, rc;
	int     rcode = 0;

	if (argc < 2) {
		printf ("Usage:\n%s\n", cmdtp->usage);
		return 1;
	}

	addr = simple_strtoul(argv[1], NULL, 16);

	printf ("## Starting application at 0x%08lX ...\n", addr);
	setup_linux_param(0x30000100);
#ifdef CONFIG_S3C2410
        call_linux(0,0x0c1,0x30008000);
#endif

#ifdef CONFIG_S3C2440
        call_linux(0,0x16a,0x30008000);
#endif
	printf("ok\n");
	/*
	 * pass address parameter as argv[0] (aka command name),
	 * and all remaining args
	 */
#if defined(CONFIG_I386)
	/*
	 * x86 does not use a dedicated register to pass the pointer
	 * to the global_data
	 */
	argv[0] = (char *)gd;
#endif
#if !defined(CONFIG_NIOS)
	rc = ((ulong (*)(int, char *[]))addr) (--argc, &argv[1]);
#else
	/*
	 * Nios function pointers are address >> 1
	 */
	rc = ((ulong (*)(int, char *[]))(addr>>1)) (--argc, &argv[1]);
#endif
	if (rc != 0) rcode = 1;

	printf ("## Application terminated, rc = 0x%lX\n", rc);
	return rcode;
}

/* -------------------------------------------------------------------- */

U_BOOT_CMD(
	go, CFG_MAXARGS, 1,	do_go,
	"go      - start application at address 'addr'\n",
	"addr [arg ...]\n    - start application at address 'addr'\n"
	"      passing 'arg' as arguments\n"
);

extern int do_reset (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]);

U_BOOT_CMD(
	reset, 1, 0,	do_reset,
	"reset   - Perform RESET of the CPU\n",
	NULL
);
