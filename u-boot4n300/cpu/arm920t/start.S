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

	.balignl 16,0xbeefceed


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
	/* runtime value linux-haret-WM6 */
	@ldr r1, =0x00040800
	/* original from acer NAND */
	@mov r1, #0xfe000000
	/* enable NAND writings */
	@"GPADAT |= (1 << 11)"
	@ldr r1, =0xfe000800
	ldr r1, =0x00000800
	STR r1, [r0]

	ldr r0, =S3C24X0_GPACON
	/* runtime value linux-haret-WM6 */
	@ldr r1, =0x01fdf7ff		
	/* runtime value linux-u-boot */
	@ldr r1, =0x005ca71f		
	/* original from acer NAND */
	@ldr r1, =0x005EAF1F
	/* enable pin output for NAND writings */
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
	ldr r1, =0x05555555		@ superipl (N300 NAND) original val
	@ldr r1, =0xa02aaaaa	@ N310 linux runtime val
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
	@ldr r1, =0x00155514			/* superipl (N300 NAND) original value  */
	@ldr r1, =0x0000a0aa			/* N310 linux runtime val  */
	ldr r1, =0x0016faaa				/* SMDK2440 and eboot.nb0 UARTinit val  */
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

	/*
	root@n310ingresso:~# getCLKDIVN 
	data register 4c000014:  00000005
	0000(07,06,05,04) 0101(03,02,01,00)
	bit 3 -> UCLK select register(UCLK must be 48MHz for USB)
			0: UCLK = UPLL clock
			1: UCLK = UPLL clock / 2 
	bit 2.1 ->      00 : HCLK = FCLK/1.
					01 : HCLK = FCLK/2.
					10 : HCLK = FCLK/4 when CAMDIVN[9] = 0.
						HCLK= FCLK/8 when CAMDIVN[9] = 1.
					11 : HCLK = FCLK/3 when CAMDIVN[8] = 0.
						HCLK = FCLK/6 when CAMDIVN[8] = 1.
	bit 0 -> 0: PCLK has the clock same as the HCLK/1.
			1: PCLK has the clock same as the HCLK/2.
	*/
	ldr r0, =S3C24X0_CLKDIVN
	@mov r1, #0x7
	@ldr r1, =S3C24X0_CLKDIVN_HCLK50MHZ			@HCLK= FCLK/8 when CAMDIVN[9] = 1
	@ldr r1, =S3C24X0_CLKDIVN_WINZ
	ldr r1, =S3C24X0_CLKDIVN_HCLK100M_P50		@HCLK= FCLK/4 when CAMDIVN[9] = 0
	str     r1, [r0]

	ldr	r0, =S3C24X0_CLKCON		/* clkcon */
	ldr	r1, =0xf2ffd0			/* no camera, no lcdc */
	str	r1, [r0]

	/* NOTE init uart --> done in cpu/arm920t/s3c24x0/serial.c (serial_setbrg)  */

	/* Set Async BusMode */
	MRC p15, 0x00, r0, c1, c0, 0x00
	ORR r0, r0, #0xc0000000
	MCR p15, 0x00, r0, c1, c0, 0x00

#define USE_TEST_CODE
#ifdef USE_TEST_CODE
@ ---------------------------------------- T E S T  C O D E --------------
test_code_start:	ldr	r1, #S3C24X0_GPFCON
					mov	r2, #0x100						@ set GPF4 as output (Home button)
					str	r2, [r1]						@ r1==S3C24X0_GPFCON
					mov	r2, #0xff
					str	r2, [r1, #8]
					mov	r2, #0	
					str	r2, [r1, #4]					@ set GPF4 to zero

					mov	r1, #S3C24X0_GPFCON
					mov	r2, #0x400          		@ set GPF5 as output (Calendar button)
					str	r2, [r1]      				@ r1==S3C24X0_GPFCON
					mov	r2, #0xff
					str	r2, [r1, #8]
					mov	r2, #0
					str	r2, [r1, #4]  				@ set GPF5 to zero

					mov	r1, #S3C24X0_GPFCON
					mov	r2, #0x1000                 @ set GPF6 as output (Contacts button)
					str	r2, [r1]       				@
					mov	r2, #0xff
					str	r2, [r1, #8]
					mov	r2, #0	
					str	r2, [r1, #4]                @ @ set GPF6 to zero
@ ---------------------------------------- T E S T  C O D E --------------
#endif

#ifndef CONFIG_SKIP_LOWLEVEL_INIT
#define oNFCONF                 0x00

	ldr r0, =S3C24X0_CLOCK_LOCKTIME
	@MVN r1, #0xff000000
	ldr r1, =S3C24X0_CLKLCKTIM_VAL
	str     r1, [r0]

	ldr     r0, =S3C24X0_UPLLCON		@=0x0003C042	
	ldr     r1, =UPLLCON_VALUE
	str     r1, [r0]
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ldr     r0, =S3C24X0_CAMDIVN
	@mov     r1, #0x0
	@mov     r1, #0x100
	@mov     r1, #0x200
	@ldr     r1, =S3C24X0_CAMDIVN_WINZ
	ldr     r1, =S3C24X0_CAMDIVN_HCLK100MHZ
	str     r1, [r0]

	ldr     r0, =S3C24X0_MPLLCON
	@ldr     r1, =0x00096030	@ RESET Value
	@ldr     r1, =0x00074051	@ ? power down value
	@ldr     r1, =S3C24X0_MPLLCON_266MHz			@ see include/linux/s3c2440.h
	ldr     r1, =S3C24X0_MPLLCON_400MHz			@ see include/linux/s3c2440.h
	@ldr     r1, =S3C24X0_MPLLCON_WINZ			@ FCLK -> 300 MHz, HCLK -> 100 MHz
	str     r1, [r0]
	mov r0, #0x200
lo:	SUBS r0, r0, #0x1
	bne lo
	ldr     r0, =S3C24X0_GPCDAT

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

#endif


#ifndef CONFIG_SKIP_RELOCATE_UBOOT
#define oNFCONF                 0x00
#define oNFCONT                 0x04
#define oNFCMD                  0x08
#define oNFADDR                 0x0c
#define oNFDATA                 0x10
#define oNFSTAT                 0x20
#define oNFECC                  0x2c

 
@#define NEW_COPY
#ifdef  NEW_COPY
@#ifdef  CONFIG_NAND_BOOT
#define  CFG_NAND_REG_BASE     0x4E000000    //s3c2440 nandflash
#define  CFG_MONITOR_SIZE     0x00020000   //
#define  CFG_MONITOR_RAM_BASE     0x33F80000  //
#define  CFG_MONITOR_NAND_BASE     0x00000000
CopyToSdram:

    ldr r0, =CFG_NAND_REG_BASE

    ldr r1, =((1<<12)|(4<<8)|(1<<4)|(0<<0))           //TACLS=1,TWRPH0=4, TWRPH1=1
	@ldr   r1,=((7<<12)|(7<<8)|(7<<4)|(0<<0))
    str r1, [r0, #oNFCONF]

    @ldr r1, =((1<<6)|(1<<5)|(1<<4)|(0<<1)|(1<<0))         //ECC
	ldr r1, =((1<<4)|(0<<1)|(1<<0)) 					/*Active low CE Control*/
    str r1, [r0, #oNFCONT]
    
    mov r1, #0x6          //RnB
    strb r1, [r0, #oNFSTAT]

    mov r1, #0xff            //reset command
    strb r1, [r0, #oNFCMD]

rst_wait:     
    ldr r1, [r0, #oNFSTAT]   
    tst r1, #0x1
    beq rst_wait

    ldr r2, =CFG_MONITOR_RAM_BASE		@ destination address
    ldr r3, =CFG_MONITOR_NAND_BASE		@ source address

copy_monitor:
    mov r1, #0x00
    strb r1, [r0, #oNFCMD]

    and r4, r3, #0xff           
    strb r4, [r0, #oNFADDR]     

    mov r4, r3, lsr #8
    and r4, r4, #0x0f          
    strb r4, [r0, #oNFADDR] 

    mov r4, r3, lsr #12
    and r4, r4, #0xff           
    strb r4, [r0, #oNFADDR] 

    mov r4, r3, lsr #20
    and r4, r4, #0xff           
    strb r4, [r0, #oNFADDR] 

    mov r4, r3, lsr #28
    and r4, r4, #0x01          
    strb r4, [r0, #oNFADDR] 

    mov r1, #0x30              
    strb r1, [r0, #oNFCMD] 

    mov r1, #0x70              
    strb r1, [r0, #oNFCMD]
wait_ready:
    ldrb r1, [r0, #oNFDATA]   
    and r1, r1, #0x40
    teq r1, #0x40
    bne wait_ready
    
    mov r5, #0  
copy_page:                  
    ldr r1, [r0, #oNFDATA]
    str r1, [r2], #4
    add r5, r5, #4
    cmp r5, #2048
    blt copy_page

	/*64 - 128K*/
    add r3, r3, #0x1000     
    ldr r5, =CFG_MONITOR_SIZE 
    cmp r3, r5, lsl #1
    blt copy_monitor
   
    ldr r1, [r0, #oNFCONT]     
    orr r1, r1, #0x02
    str r1, [r0, #oNFCONT]

	/*steppingston 1k nandflash CFG_MONITOR_RAM_BASE*/
    mov r0, #0    
    ldr r1, =CFG_MONITOR_RAM_BASE
    mov r2, #0x400 

copy_complete:
    ldr r3, [r0], #4 
    ldr r4, [r1], #4
    teq r3, r4
    bne err
    subs r2, r2, #4
    beq stack_setup
    bne copy_complete

err:
    loop: b loop     

#endif


//#define NEW_COPY2
#ifdef NEW_COPY2
#define NAND_SECTOR_SIZE        512
#define NAND_BLOCK_MASK         (NAND_SECTOR_SIZE - 1)
CopyToSdram:
	@set NAND controls
	mov	r1, #S3C2440_NAND_BASE
	@ldr	r2, =0xf030			@nand flash control enable
	ldr   r2,=((7<<12)|(7<<8)|(7<<4)|(0<<0))
	str	r2, [r1, #oNFCONF]
	@reset 
	mov	r2, #0xff
	strb	r2, [r1, #oNFCMD]
2:	
	ldr	r2, [r1, #oNFSTAT]		@start inquiry
	tst	r2, #0x1
	beq	2b
	@}}reset end

	@{{read
	@ldr	r5, =_TEXT_BASE-0x40		@ destination address
	ldr	r5, =TEXT_BASE					@ destination address
	ldr	r3, =0x0					@page account
	ldr	r4, =0x80
	@ldr	r4, =0x00
	ldr	r6, =0x1
	@ldr	r6, =0x00
3:	
	mov 	r2, #0
	strb	r2, [r1, #oNFCMD]
	strb 	r2, [r1, #oNFADDR]		@row address (in field offset address)	(highest byte ?)
	strb	r3, [r1, #oNFADDR]		@page address & block address			(high byte ?)
	strb 	r4, [r1, #oNFADDR]		@block address 0						(low byte ?)
	strb 	r6, [r1, #oNFADDR]		@block address 0						(lowest byte ?)
4:	
	ldr	r2, [r1, #oNFSTAT]		@start inquiry
	tst	r2, #0x1
	beq	4b
	mov	r7, #NAND_SECTOR_SIZE			@a page bytes 
5:	
	ldr	r2, [r1, #oNFDATA]
	strb	r2, [r5],#1
	subs	r7, r7,	#1
	bne	5b
	add	r3, r3,	#1
	cmp	r3, #0x10				@copy 16 pages 8K
	blt	3b
@	mov	r3, #0x0
@	add	r4, r4, #1
@	cmp	r4, #ff
@	blt	3b
@	mov	r4, #0x0
@	add	r6, r6, #1
	

	@}}read end
	@NAND chip disable
	ldr	r2, [r1, #oNFCONF]
	orr	r2, r2, #0x800			@off
	str	r2, [r1, #oNFCONF]
#endif

//#define ADAPTED_COPY
#ifdef ADAPTED_COPY

DW_STACK_START:
        .word      STACK_BASE+STACK_SIZE-4
CopyToSdram:
        mov r10, lr		@save current instruction pointer
		@ reset NAND
        mov   r1, #S3C2440_NAND_BASE
        ldr   r2,=((7<<12)|(7<<8)|(7<<4)|(0<<0))		@ 11
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

#if 0
//#ifdef _NOTUSEFUL
        @ prepare to call C functions (for nand_read())
        @ldr   sp, =(STACK_BASE+STACK_SIZE-4)    @ setup stack pointer
        ldr   sp, DW_STACK_START    @ setup stack pointer
        mov fp, #0                  @ no previous frame, so fp=0
#endif
        @ copy u-boot to RAM @ _TEXT_BASE
        @ldr   r0, =_TEXT_BASE-0x40
        @ldr   r0, =_TEXT_BASE
        ldr   r0, =stack_setup			@ destination address

        mov   r1, #0x0					@ NAND source address
        ldr   r2, =CFG_UBOOT_SIZE 		@size
        @mov   r2, #CFG_UBOOT_SIZE  @size
        bl    nand_read_ll

#endif

#define SMDK2440_COPY
#ifdef SMDK2440_COPY

DW_STACK_START:
        .word      STACK_BASE+STACK_SIZE-4
CopyToSdram:
        mov r10, lr
@ reset NAND
        mov   r1, #NAND_CTL_BASE
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

        @ get read to call C functions (for nand_read())
        ldr   sp, DW_STACK_START    @ setup stack pointer
        mov fp, #0                  @ no previous frame, so fp=0

        @ copy u-boot to RAM
        ldr   r0, =UBOOT_RAM_BASE
        mov   r1, #0x0  			@address
        ldr   r2, =CFG_UBOOT_SIZE  	@size
        bl    nand_read_ll

        tst   r0, #0x0
        beq   ok_nand_read

#ifdef CONFIG_DEBUG_LL
bad_nand_read:
        ldr   r0, STR_FAIL
		mov	r1, #S3C24X0_UART_BASE
        bl    PrintWord
1:      b     1b          @ infinite loop
#endif

ok_nand_read:
#ifdef CONFIG_DEBUG_LL
        ldr   r0, STR_OK
		mov	r1, #S3C24X0_UART_BASE
        bl    PrintWord
#endif

@ verify
        mov r0, #0
        ldr   r1, =UBOOT_RAM_BASE
        mov r2, #0x400     @ 4 bytes * 1024 = 4K-bytes
go_next:
        ldr   r3, [r0], #4
        ldr   r4, [r1], #4
        teq   r3, r4
        bne  notmatch
        subs r2, r2, #4
        beq  done_nand_read
        bne  go_next

notmatch:
#ifdef CONFIG_DEBUG_LL
	sub  r0, r0, #4
	mov	r1, #S3C24X0_UART_BASE
	bl    PrintHexWord
	ldr   r0, STR_FAIL
	mov	r1, #S3C24X0_UART_BASE
	bl    PrintWord
#endif
1:      b     1b

done_nand_read:
#ifdef CONFIG_DEBUG_LL
	ldr   r0, STR_OK
	mov	r1, #S3C24X0_UART_BASE
	bl    PrintWord
#endif

	b stack_setup

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

        .align     2

#endif

#endif

/*
	Source address here when copied from NAND
*/
stack_setup:
	ldr	r0, _TEXT_BASE					/* upper 128 KiB: relocated uboot   */
	sub	r0, r0, #CFG_MALLOC_LEN			/* malloc area                      */
	sub	r0, r0, #CFG_GBL_DATA_SIZE 		/* bdinfo                       	*/
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

