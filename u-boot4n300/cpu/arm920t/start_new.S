/*
 *  armboot - Startup Code for ARM920 CPU-core
 *
 *  Copyright (c) 2001	Marius Gröger <mag@sysgo.de>
 *  Copyright (c) 2002	Alex Züpke <azu@sysgo.de>
 *  Copyright (c) 2002	Gary Jennejohn <gj@denx.de>
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

#define __STARTS 

#include <config.h>
#include <version.h>
#include <s3c2440.h>

/*
 *************************************************************************
 *
 * Jump vector table as in table 3.1 in [1]
 *
 *************************************************************************
 */


.globl _start
_start:	b       reset
	ldr	pc, _undefined_instruction
	ldr	pc, _software_interrupt
	ldr	pc, _prefetch_abort
	ldr	pc, _data_abort
	ldr	pc, _not_used
	ldr	pc, _irq
	ldr	pc, _fiq

_undefined_instruction:	.word undefined_instruction
_software_interrupt:	.word software_interrupt
_prefetch_abort:		.word prefetch_abort
_data_abort:			.word data_abort
_not_used:				.word not_used
_irq:					.word irq
_fiq:					.word fiq

	.balignl 16,0xdeadbeef


/*
 *************************************************************************
 *
 * Startup Code (reset vector)
 *
 * do important init only if we don't start from memory!
 * relocate armboot to ram
 * setup stack
 * jump to second stage
 *
 *************************************************************************
 */

_TEXT_BASE:
	.word	TEXT_BASE

.globl _armboot_start
_armboot_start:
	.word _start

/*
 * These are defined in the board-specific linker script.
 */
.globl _bss_start
_bss_start:
	.word __bss_start

.globl _bss_end
_bss_end:
	.word _end

#ifdef CONFIG_USE_IRQ
/* IRQ stack memory (calculated at run-time) */
.globl IRQ_STACK_START
IRQ_STACK_START:
	.word	0x0badc0de

/* IRQ stack memory (calculated at run-time) */
.globl FIQ_STACK_START
FIQ_STACK_START:
	.word 0x0badc0de
#endif


/*
 * the actual reset code
 */

reset:
	/* ------------------------------------------------ steppingstone code */
	/*
	 * set the cpu to SVC32 mode
	 */
	mrs	r0, cpsr
	bic	r0, r0, #0x1f
	orr	r0, r0, #0xd3
	msr	cpsr, r0

	ldr r0, =S3C24X0_GPADAT
	/* original from acer NAND */
	@mov r1, #0xfe000000
	/* enable NAND writings */
	@"GPADAT |= (1 << 11)"
	@$_TARGETNAME mww phys $GPADAT 0x00000040
	ldr r1, =0xfe000800
	STR r1, [r0]

	ldr r0, =S3C24X0_GPACON
	/* original from acer NAND */
	@ldr r1, =0x005EAF1F
	/* enable NAND writings ? 0b00GPA15 00GPA14 - 00GPA13 00GPA12 00GPA11 00GPA10*/
	ldr r1, =0x005EA71F
	STR r1, [r0]

	ldr r0, =S3C24X0_GPBUP
	ldr r1, =0x00001FFF
	STR r1, [r0]

	ldr r0, =S3C24X0_GPBDAT
	ldr r1, =0x00000146
	STR r1, [r0]

	ldr r0, =S3C24X0_GPBCON
	ldr r1, =0x00155455
	STR r1, [r0]

	ldr r0, =S3C24X0_GPCUP
	ldr r1, =0x0000FFFF
	STR r1, [r0]

	ldr r0, =S3C24X0_GPCDAT
	ldr r1, =0x12
	STR r1, [r0]

	ldr r0, =S3C24X0_GPCCON
	ldr r1, =0x55551515
	STR r1, [r0]

	ldr r0, =S3C24X0_GPDUP
	ldr r1, =0x0000EFFF
	STR r1, [r0]

	ldr r0, =S3C24X0_GPDCON
	ldr r1, =0x00001000
	STR r1, [r0]

	ldr r0, =S3C24X0_GPDDAT
	ldr r1, =0x05514514
	STR r1, [r0]

	ldr r0, =S3C24X0_GPEUP
	ldr r1, =0x0000FFFF
	STR r1, [r0]

	ldr r0, =S3C24X0_GPEDAT
	ldr r1, =0x0
	STR r1, [r0]

	ldr r0, =S3C24X0_GPECON
	ldr r1, =0x05555555
	STR r1, [r0]

	ldr r0, =S3C24X0_GPFUP
	MOV r1, #0xff
	STR r1, [r0]

	ldr r0, =S3C24X0_GPFDAT
	MOV r1, #0x00
	STR r1, [r0]

	ldr r0, =S3C24X0_GPFCON		/*   0x56000050 */
	MOV r1, #0x02
	STR r1, [r0]

	ldr r0, =S3C24X0_GPGUP
	ldr r1, =0x0000FFFF
	STR r1, [r0]

	ldr r0, =S3C24X0_GPGDAT
	MOV r1, #0x00
	STR r1, [r0]

	ldr r0, =S3C24X0_GPGCON
	ldr r1, =0x01150010
	STR r1, [r0]

	ldr r0, =S3C24X0_GPHUP
	ldr r1, =0x000007FF
	STR r1, [r0]

	ldr r0, =S3C24X0_GPHDAT
	MOV r1, #0x200
	STR r1, [r0]

	ldr r0, =S3C24X0_GPHCON
	@ldr r1, =0x00155514				/* N300 NAND original value  */
	@ldr r1, =0x0000a0aa			/* N310 linux runtime val  */
	ldr r1, =0x0016faaa			/* SMDK2440 UARTinit val  */
	STR r1, [r0]

	ldr r0, =S3C24X0_GPJUP
	ldr r1, =0x00001FFF
	STR r1, [r0]

	ldr r0, =S3C24X0_GPJDAT
	ldr r1, =0x00001FFF
	STR r1, [r0]

	ldr r0, =S3C24X0_GPJCON
	ldr r1, =0x55555555
	STR r1, [r0]

	/* turn off the watchdog */
	ldr     r0, =S3C24X0_WATCHDOG_BASE
	mov     r1, #0x0
	str     r1, [r0]
	ldr     r0, =S3C24X0_INTERRUPT_MASK
	mov     r1, #0xffffffff
	str     r1, [r0]
	ldr     r0, =S3C24X0_INTERRUPT_SUBMASK
	mov     r1, #0xffffffff
	str     r1, [r0]

	/* CHECK for hard vs soft reboot ??? */
	ldr r0, =S3C24X0_GPDDAT
	LDR r10, [r0]
	TST r10, #0x40
	BEQ GPDDAT_notok
	MOV r1, #0x7
	B GPDDAT_ok
GPDDAT_notok:
	MOV r1, #0x7
GPDDAT_ok:
	ldr     r0, =S3C24X0_CLKDIVN
	#mov     r1, #7
	str     r1, [r0]

	MRC p15, 0x00, r0, c1, c0, 0x00
	ORR r0, r0, #0xc0000000
	MCR p15, 0x00, r0, c1, c0, 0x00

	MOV r0, #S3C24X0_CLOCK_POWER_BASE
	MVN r1, #0xff000000
	str     r1, [r0]

#ifndef CONFIG_SKIP_LOWLEVEL_INIT

	ldr     r0, =S3C24X0_UPLLCON
	ldr     r1, =0x0003C042
	str     r1, [r0]
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ldr     r0, =S3C24X0_CAMDIVN
	mov     r1, #0x0
	ldr     r0, =S3C24X0_GPDDAT
	LDR r10, [r0]
	TST r10, #0x40
	BEQ tmp
	ldr     r1, =0x00074051
	B tmp2
tmp:
	ldr     r1, =0x00074051
tmp2:
	ldr     r0, =S3C24X0_MPLLCON
	str     r1, [r0]
	MOV r0, #0x200
lo:	SUBS r0, r0, #0x1
	bne lo
	ldr     r0, =S3C24X0_GPCDAT

	bl	cpu_init_crit

#endif


	/* Set up the stack						    */
stack_setup:
	ldr	r0, _TEXT_BASE					/* upper 128 KiB: relocated uboot   */
	sub	r0, r0, #CFG_MALLOC_LEN			/* malloc area                      */
	sub	r0, r0, #CFG_GBL_DATA_SIZE 		/* bdinfo                        */
#ifdef CONFIG_USE_IRQ
	sub	r0, r0, #(CONFIG_STACKSIZE_IRQ+CONFIG_STACKSIZE_FIQ)
#endif
	sub	sp, r0, #12		/* leave 3 words for abort-stack    */

clear_bss:
	ldr	r0, _bss_start		/* find start of bss segment        */
	ldr	r1, _bss_end		/* stop here                        */
	mov 	r2, #0x00000000		/* clear                            */
clbss_l:
	str	r2, [r0]		/* clear loop...                    */
	add	r0, r0, #4
	cmp	r0, r1
	ble	clbss_l

#ifndef CONFIG_SKIP_RELOCATE_UBOOT
        bl    copy_myself

        @ jump to ram
        ldr   r1, =on_the_ram
        add  pc, r1, #0
        nop
        nop
1:  b   1b          @ infinite loop

on_the_ram:

#endif


	ldr	pc, _start_armboot

_start_armboot:	.word start_armboot

#ifndef CONFIG_SKIP_RELOCATE_UBOOT
copy_myself:
        mov r10, lr		@save current instruction pointer
@ reset NAND
        mov   r1, #S3C2440_NAND_BASE
        ldr   r2,=((7<<12)|(7<<8)|(7<<4)|(0<<0))
        str   r2, [r1, #oNFCONF]
        ldr   r2, [r1, #oNFCONF]

        ldr     r2, =((1<<4)|(0<<1)|(1<<0)) /*Active low CE Control*/
        str     r2,[r1,#oNFCONT]
        ldr     r2,[r1,#oNFCONT]

        ldr     r2, =(0x6)                  /* RnB Clear*/
        str     r2, [r1, #oNFSTAT]
        ldr     r2, [r1, #oNFSTAT]

        mov     r2, #0xff               @ RESET command
        strb    r2, [r1, #oNFCMD]
        mov     r3, #0                  @ wait
1:      add     r3, r3, #0x1
        cmp     r3, #0xa
        blt     1b
2:      ldr     r2, [r1, #oNFSTAT]      @ wait ready
        tst     r2, #0x4
        beq     2b

        ldr     r2, [r1, #oNFCMD]
        orr     r2, r2, #0x2            @ Flash Memory Chip Disable
        str     r2, [r1, #oNFCMD]

//#ifdef _NOTUSEFUL
        @ prepare to call C functions (for nand_read())
        ldr   sp, =(STACK_BASE+STACK_SIZE-4)    @ setup stack pointer
        mov fp, #0                  @ no previous frame, so fp=0
//#endif
        @ copy u-boot to RAM
        ldr   r0, =_TEXT_BASE
        mov   r1, #0x0  @address
        @ldr   r2, =CFG_UBOOT_SIZE  @size
        mov   r2, #CFG_UBOOT_SIZE  @size
        bl    nand_read_ll

        mov pc, r10			@restore IP

@ clear memory
@ r0: start address
@ r1: length
mem_clear:
        mov r2, #0
        mov r3, r2
        mov r4, r2
        mov r5, r2
        mov r6, r2
        mov r7, r2
        mov r8, r2
        mov r9, r2
clear_loop:
        stmia      r0!, {r2-r9}
        subs r1, r1, #(8 * 4)
        bne  clear_loop
        mov pc, lr

#endif

#ifndef CONFIG_SKIP_LOWLEVEL_INIT
/*
 *************************************************************************
 *
 * CPU_init_critical registers
 *
 * setup important registers
 * setup memory timing
 *
 *************************************************************************
 */
cpu_init_crit:
	/* flush v4 I/D caches */
	mov	r0, #0
	mcr	p15, 0, r0, c7, c7, 0	/* flush v3/v4 cache */
	mcr	p15, 0, r0, c8, c7, 0	/* flush v4 TLB */

	/*
	 * disable MMU stuff and caches
	 */
	mrc	p15, 0, r0, c1, c0, 0
	bic	r0, r0, #0x00002300	@ clear bits 13, 9:8 (--V- --RS)
	bic	r0, r0, #0x00000087	@ clear bits 7, 2:0 (B--- -CAM)
	orr	r0, r0, #0x00000002	@ set bit 2 (A) Align
	orr	r0, r0, #0x00001000	@ set bit 12 (I) I-Cache
	mcr	p15, 0, r0, c1, c0, 0

	/* --------------------------------------------------
	 * before relocating, we have to setup RAM timing
	 * because memory timing is board-dependend, you will
	 * find a lowlevel_init.S in your board directory.
	 */
	mov	ip, lr

	/* -------------------------------------------------- */
	bl	lowlevel_init

	mov	lr, ip
	mov	pc, lr
#endif

/*
 *************************************************************************
 *
 * Interrupt handling
 *
 *************************************************************************
 */

@
@ IRQ stack frame.
@
#define S_FRAME_SIZE	72

#define S_OLD_R0	68
#define S_PSR		64
#define S_PC		60
#define S_LR		56
#define S_SP		52

#define S_IP		48
#define S_FP		44
#define S_R10		40
#define S_R9		36
#define S_R8		32
#define S_R7		28
#define S_R6		24
#define S_R5		20
#define S_R4		16
#define S_R3		12
#define S_R2		8
#define S_R1		4
#define S_R0		0

#define MODE_SVC 0x13
#define I_BIT	 0x80

/*
 * use bad_save_user_regs for abort/prefetch/undef/swi ...
 * use irq_save_user_regs / irq_restore_user_regs for IRQ/FIQ handling
 */

	.macro	bad_save_user_regs
	sub	sp, sp, #S_FRAME_SIZE
	stmia	sp, {r0 - r12}			@ Calling r0-r12
	ldr	r2, _armboot_start
	sub	r2, r2, #(CONFIG_STACKSIZE+CFG_MALLOC_LEN)
	sub	r2, r2, #(CFG_GBL_DATA_SIZE+8)  @ set base 2 words into abort stack
	ldmia	r2, {r2 - r3}			@ get pc, cpsr
	add	r0, sp, #S_FRAME_SIZE		@ restore sp_SVC

	add	r5, sp, #S_SP
	mov	r1, lr
	stmia	r5, {r0 - r3}			@ save sp_SVC, lr_SVC, pc, cpsr
	mov	r0, sp
	.endm

	.macro	irq_save_user_regs
	sub	sp, sp, #S_FRAME_SIZE
	stmia	sp, {r0 - r12}			@ Calling r0-r12
	add     r8, sp, #S_PC
	stmdb   r8, {sp, lr}^                   @ Calling SP, LR
	str     lr, [r8, #0]                    @ Save calling PC
	mrs     r6, spsr
	str     r6, [r8, #4]                    @ Save CPSR
	str     r0, [r8, #8]                    @ Save OLD_R0
	mov	r0, sp
	.endm

	.macro	irq_restore_user_regs
	ldmia	sp, {r0 - lr}^			@ Calling r0 - lr
	mov	r0, r0
	ldr	lr, [sp, #S_PC]			@ Get PC
	add	sp, sp, #S_FRAME_SIZE
	subs	pc, lr, #4			@ return & move spsr_svc into cpsr
	.endm

	.macro get_bad_stack
	ldr	r13, _armboot_start		@ setup our mode stack
	sub	r13, r13, #(CONFIG_STACKSIZE+CFG_MALLOC_LEN)
	sub	r13, r13, #(CFG_GBL_DATA_SIZE+8) @ reserved a couple spots in abort stack

	str	lr, [r13]			@ save caller lr / spsr
	mrs	lr, spsr
	str     lr, [r13, #4]

	mov	r13, #MODE_SVC			@ prepare SVC-Mode
	@ msr	spsr_c, r13
	msr	spsr, r13
	mov	lr, pc
	movs	pc, lr
	.endm

	.macro get_irq_stack			@ setup IRQ stack
	ldr	sp, IRQ_STACK_START
	.endm

	.macro get_fiq_stack			@ setup FIQ stack
	ldr	sp, FIQ_STACK_START
	.endm

/*
 * exception handlers
 */
	.align  5
undefined_instruction:
	get_bad_stack
	bad_save_user_regs
	bl 	do_undefined_instruction

	.align	5
software_interrupt:
	get_bad_stack
	bad_save_user_regs
	bl 	do_software_interrupt

	.align	5
prefetch_abort:
	get_bad_stack
	bad_save_user_regs
	bl 	do_prefetch_abort

	.align	5
data_abort:
	get_bad_stack
	bad_save_user_regs
	bl 	do_data_abort

	.align	5
not_used:
	get_bad_stack
	bad_save_user_regs
	bl 	do_not_used

#ifdef CONFIG_USE_IRQ

	.align	5
irq:
	get_irq_stack
	irq_save_user_regs
	bl 	do_irq
	irq_restore_user_regs

	.align	5
fiq:
	get_fiq_stack
	/* someone ought to write a more effiction fiq_save_user_regs */
	irq_save_user_regs
	bl 	do_fiq
	irq_restore_user_regs

#else

	.align	5
irq:
	get_bad_stack
	bad_save_user_regs
	bl 	do_irq

	.align	5
fiq:
	get_bad_stack
	bad_save_user_regs
	bl 	do_fiq

#endif

