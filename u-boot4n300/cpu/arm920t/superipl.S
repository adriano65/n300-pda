/* 

superipl.bin:     file format binary

useful info: http://magiclantern.wikia.com/wiki/ASM_introduction

*/

#define __STARTS 

#include <config.h>
#include <version.h>
#include <s3c2440.h>

@ --- original value - uses MMU
@#define			VIDEO_BASE		0xa8000000
#define			VIDEO_BASE2		0xb1000000
#define			VIDEO_CONTR		0xc0000000
@ --- my tests --------------------------------
##define			VIDEO_BASE		0x58000000
@#define			VIDEO_BASE		0x20080000		@ bad fixup
@#define			VIDEO_BASE		0x28000000
#define			VIDEO_BASE		0x20000000
@#define			VIDEO_BASE2		0x21000000
@#define			VIDEO_CONTR		0xf0000000
@ 0xc0000000-0xa8000000=0x18000000 + 0x20000000 =0x38000000
@#define			VIDEO_CONTR		0x38000000 ???

@ --- defined in configs/n300.h
@ #define 		PHYS_SDRAM_1	0x30000000 			/* SDRAM Bank #1 */
@ #define PHYS_SDRAM_1_SIZE		0x4000000 			/* 64 MB */

@#define			ENABLE_NAND_INIT


.syntax unified

@ for insight allocation
@.section code_start, "x"
@.org 0x33f80000
@.text 0x33f80000
@ ?? .code 0x33f80000
.globl _start
@_start: 		b	gpio_init
@_start: 		b	clear_dram (and myself :-)) DO NOT JUMP HERE
@_start: 		b	no_lowlevel_init
@_start: 		b	goforce_preinit
@_start: 		b	goforce_init
@_start: 		b	samsung_lcd_init
@_start: 		b	goforce_init1
@_start: 		b	sysinit_mmu
@_start: 		b	b5148
_start: 		b	try_gof_1
@_start: 		b	test_02
@_start: 		b	test_01
@_start: 		b	test_03
@_start: 		b	test_code_start
 




nevendloo1:		b	nevendloo1
nevendloo2:		b	nevendloo2
nevendloo3:		b	nevendloo3
x00000010:		b	x00000010
nevendloo5:		b	nevendloo5
nevendloo6:		b	nevendloo6
nevendloo7:		b	nevendloo7
@.balignl 16,0xdeadbeef
x30000020:		str     r1, [r0]
x30000024:		str     r3, [r2]
				str     r5, [r4]
never_end: 		b	never_end

gpio_init: 	
				ldr	r0, .gpadat
				mvn	r1, #0xfe000000
				str	r1, [r0]
				mov	r0, #S3C24X0_GPIO_BASE
				ldr	r1, [pc, #0x4b4]
				str	r1, [r0]
				ldr	r0, [pc, #1128]	@ 0x4b8
				ldr	r1, [pc, #1128]	@ 0x4bc
				str	r1, [r0]
				ldr	r0, [pc, #1124]	@ 0x4c0
				ldr	r1, [pc, #1124]	@ 0x4c4
				str	r1, [r0]
				ldr	r0, [pc, #1120]	@ 0x4c8
				ldr	r1, [pc, #1120]	@ 0x4cc
				str	r1, [r0]
				ldr	r0, [pc, #1116]	@ 0x4d0
				ldr	r1, [pc, #1116]	@ 0x4d4
				str	r1, [r0]
				ldr	r0, .gpcdat
				mov	r1, #18			@ 0x12
				str	r1, [r0]
				ldr	r0, [pc, #1104]	@ 0x4dc
				ldr	r1, [pc, #1104]	@ 0x4e0
				str	r1, [r0]
				ldr	r0, [pc, #1100]	@ 0x4e4
				ldr	r1, [pc, #1100]	@ 0x4e8
				str	r1, [r0]
				ldr	r0, .gpddat
				mov	r1, #0x1000
				str	r1, [r0]
				ldr	r0, [pc, #1088]	@ 0x4f0
				ldr	r1, [pc, #1088]	@ 0x4f4
				str	r1, [r0]
				ldr	r0, [pc, #1084]	@ 0x4f8
				ldr	r1, [pc, #1044]	@ 0x4d4
				str	r1, [r0]
				ldr	r0, [pc, #1076]	@ 0x4fc
				mov	r1, #0
				str	r1, [r0]
				ldr	r0, [pc, #1068]	@ 0x500
				ldr	r1, [pc, #1068]	@ 0x504
				str	r1, [r0]
				ldr	r0, [pc, #1064]	@ 0x508
				mov	r1, #255	
				str	r1, [r0]
				ldr	r0, [pc, #1056]	@ 0x50c
				mov	r1, #0	
				str	r1, [r0]
				ldr	r0, [pc, #1048]	@ 0x510
				mov	r1, #2	
				str	r1, [r0]
				ldr	r0, [pc, #1040]	@ 0x514
				ldr	r1, [pc, #972]	@ 0x4d4
				str	r1, [r0]
				ldr	r0, [pc, #1032]	@ 0x518
				mov	r1, #0
				str	r1, [r0]
				ldr	r0, [pc, #1024]	@ 0x51c
				ldr	r1, [pc, #1024]	@ 0x520
				str	r1, [r0]
				ldr	r0, [pc, #1020]	@ 0x524
				ldr	r1, [pc, #1020]	@ 0x528
				str	r1, [r0]
				ldr	r0, [pc, #1016]	@ 0x52c
				mov	r1, #512	@ 0x200
				str	r1, [r0]
				ldr	r0, [pc, #1008]	@ 0x530
				ldr	r1, [pc, #1008]	@ 0x534
				str	r1, [r0]
				ldr	r0, [pc, #1004]	@ 0x538
				ldr	r1, [pc, #876]	@ 0x4bc
				str	r1, [r0]
				ldr	r0, [pc, #996]	@ 0x53c
				ldr	r1, [pc, #864]
				str	r1, [r0]
				ldr	r0, [pc, #988]
				ldr	r1, [pc, #988]
				str	r1, [r0]
				mov	r0, #S3C24X0_WATCHDOG_BASE
				mov	r1, #0
				str	r1, [r0]
				ldr	r0, .int_mask
				mvn	r1, #0
				str	r1, [r0]
				ldr	r0, [pc, #964]
				ldr	r1, [pc, #924]
				str	r1, [r0]
				ldr	r0, [pc, #856]
				ldr	sl, [r0]
				tst	sl, #64	@ 0x40
				beq	b_1a4
				mov	r1, #7
				b	b_1a8
b_1a4:			mov	r1, #7
b_1a8:			ldr	r0, .clkdivn_add
				str	r1, [r0]
				mrc	15, 0, r0, cr1, cr0, 0
				orr	r0, r0, #0xc0000000			@ set asynchronous clocking mode
				mcr	15, 0, r0, cr1, cr0, 0
				mov	r0, #0x4c000000
				mvn	r1, #0xff000000
				str	r1, [r0]
				ldr	r0, .upllcon_add
				ldr	r1, .upllcon_val
				str	r1, [r0]
				nop			
				nop			
				nop			
				nop			
				nop			
				nop			
				nop			
				ldr	r0, [pc, #868]	@ 0x55c
				mov	r1, #0
				str	r1, [r0]
				ldr	r0, .gpddat
				ldr	sl, [r0]
				tst	sl, #0x40    @ check GPD6 switch
				beq	b_214
				ldr	r1, .clock_val2
				b	b_218

b_214:			ldr	r1, .mpllcon_400Mhz
b_218:	 		ldr r0, .mpllcon
				str	r1, [r0]
				mov	r0, #0x200
wait01:	 		subs	r0, r0, #1
				bne	wait01

chk_pwrsupply:	ldr	r0, .gpcdat
				ldr	r1, [r0]
				tst	r1, #0x80		@ check GPC7 - AC supply present
				beq	supply_present
				b	no_ACsupply

supply_present:	ldr	r0, .gpgdat_add		@ 0x518
.0x244:			ldr	r1, [r0]
				tst	r1, #0x800			@ check GPG11 - what function has ??			
				beq	no_ACsupply
				ldr	r0, .gstatus3
				mov	r1, #0x580
				str	r1, [r0]
				ldr	r0, .rtc_con
				mov	r1, #0
				str	r1, [r0]
				mov	r0, #S3C2440_ADC_BASE
				ldr	r1, .adcbase_val
				str	r1, [r0]
				ldr	r0, .misccr
				ldr	r1, [r0]
				ldr	r2, .misccr_mask
				and	r1, r1, r2
				orr	r1, r1, #3
				orr	r1, r1, #0x3000
				orr	r1, r1, #0x600000
				str	r1, [r0]
				ldr	r0, [pc, #740]		@ 0x580
				mov	r1, #255
				str	r1, [r0]
				ldr	r0, .misccr
				ldr	r0, [r0]
				ldr	r0, [pc, #724]	@ 0x584
				ldr	r0, [r0]
				ldr	r0, [pc, #720]	@ 0x588
				ldr	r1, [r0]
				orr	r1, r1, #0x400000
				ldr	r2, .misccr
				ldr	r3, [r2]
				orr	r3, r3, #0x60000
				bic	r3, r3, #0x700000
				orr	r3, r3, #0x600000
				ldr	r4, [pc, #684]	@ 0x584
				ldr	r5, [pc, #688]	@ 0x58c
				str	r1, [r0]
				str	r3, [r2]
				str	r5, [r4]
stop_here:		b	stop_here

no_ACsupply:	ldr	r1, .gstatus2
				ldr	sl, [r1]
				tst	sl, #2
				beq	b3bc
				ldr	r0, .gstatus3
				ldr	r1, [r0]
				tst	r1, #0x580
				beq	b360
				ldr	r0, .gstatus3
				mov	r1, #0
				str	r1, [r0]
				ldr	r1, .gstatus2
				ldr	sl, [r1]
				str	sl, [r1]
				mov	sl, #0	
				mov	r1, #S3C24X0_WATCHDOG_BASE
				ldr	r0, [pc, #612]	@ 0x594
				str	r0, [r1]
				ldr	r1, [pc, #608]	@ 0x598
				mov	r0, #1	
				str	r0, [r1]
				ldr	r1, [pc, #600]	@ 0x59c
				mov	r0, #1
				str	r0, [r1]
				mov	r1, #S3C24X0_WATCHDOG_BASE
				ldr	r0, [r1]
				orr	r0, r0, #32	
				str	r0, [r1]
stophere2: 		b	stophere2
				b	b3bc

b360:				ldr	r1, .misccr
					ldr	r0, [r1]
					bic	r0, r0, #0x60000
					str	r0, [r1]
					add	r0, pc, #0x244
					mov	r1, #S3C24X0_MEMCTL_BASE
					add	r2, r0, #52
b37c:	 			ldr	r3, [r0], #4
					str	r3, [r1], #4
					cmp	r2, r0
					bne	b37c
					bl	b600
					mov	r1, #0x100
b394:				subs	r1, r1, #1
					bne	b394
					ldr	r2, .x5a0				@ 0x00201000
					add	r2, r2, #PHYS_SDRAM_1
					mov	pc, r2					@ 0x30201000
					nop			
					nop			
					nop			
stophere3:		 	b	stophere3
					b	b424

b3bc:				tst	sl, #4
					beq	b434

b3c4:				ldr	r0, [pc, #492]	@ 0x5b8
					mov	r1, #S3C24X0_MEMCTL_BASE
					add	r2, r0, #0x34
b3d0:				ldr	r3, [r0], #4
					str	r3, [r1], #4
					cmp	r2, r0
					bne	b3d0
					bl	b600
					mov	r1, #0x100
b3e8:				subs	r1, r1, #1
					bne	b3e8
					ldr	r0, .gstatus3
					ldr	r1, .gstatus3_val
					str	r1, [r0]
					ldr	r2, [pc, #420]	@ 0x5a8
					ldr	r9, [r2]
					cmp	r9, #1	
					bne	b410
					b	b434

b410:				ldr	r2, .x30020044
					ldr	r9, [r2]
					cmp	r9, #1	
					bne	b424
					b	b498

b424:				ldr	r1, .misccr
					ldr	r0, [r1]
					bic	r0, r0, #0x60000
					str	r0, [r1]
b434:				add	r0, pc, #0x180
					mov	r1, #S3C24X0_MEMCTL_BASE
					add	r2, r0, #0x34
b440:	 			ldr	r3, [r0], #4
					str	r3, [r1], #4
					cmp	r2, r0
					bne	b440
					bl	mem_rfrh
					bl	check_homeBtn
					mov	r9, r0    			@ save home button status

clear_dram:			mov	r0, #PHYS_SDRAM_1
					mov	sl, #PHYS_SDRAM_1_SIZE
clrdram_loop: 		mov	r1, #0			@ 0x464
					mov	r2, #0	
					mov	r3, #0	
					mov	r4, #0	
					mov	r5, #0	
					mov	r6, #0	
					mov	r7, #0	
					mov	r8, #0	
					stmia	r0!, {r1, r2, r3, r4, r5, r6, r7, r8}
					subs	sl, sl, #0x20
					bne	clrdram_loop

no_lowlevel_init:	ldr	r0, .home_btn_stat
					str	r9, [r0]
b498:				mrs	r0, CPSR
					bic	r0, r0, #0xdf
					orr	r1, r0, #0x13
					msr	CPSR_fsxc, r1			@ set supervisor mode
load_stack:			ldr	sp, .stack_pointer		@ sp_svc=0x33FF5800
					bl	b_794
@ Note
@ mov	r0, #0xd3
@ msr	CPSR_fsxc, r0     @ enter Supervisor mode
@ ---------------------------------
@ ORR     R0, R0, #1		@ MMU or Protection Unit enable
@ MCR     p15, 0, R0,c1,c0 	

@.align 8
.gpadat:			.word S3C24X0_GPADAT		@ 0x4b0
					.word 0x005eaf1f 			@ 0x4b4
					.word S3C24X0_GPBUP			@ 0x4b8
					.word 0x00001fff 	
					.word S3C24X0_GPBDAT 	
					.word 0x00000146 	
					.word S3C24X0_GPBCON 	
					.word 0x00155455 	
					.word S3C24X0_GPCUP 	
					.word 0x0000ffff 	
.gpcdat:			.word S3C24X0_GPCDAT 	
					.word S3C24X0_GPCCON 	
					.word 0x55551515 	
					.word 0x56000038 	
					.word 0x0000efff 	
.gpddat:			.word S3C24X0_GPDDAT 	
					.word 0x56000030 	
					.word 0x05514514 	
					.word 0x56000048 	
					.word 0x56000044 	
					.word 0x56000040 	
					.word 0x05555555 	
					.word 0x56000058 	
					.word 0x56000054 	
					.word 0x56000050 	
					.word 0x56000068 	
.gpgdat_add:		.word S3C24X0_GPGDAT 	@  0x518
					.word S3C24X0_GPGCON 	
					.word 0x01150010 	
					.word 0x56000078 	
					.word 0x000007ff 	
					.word 0x56000074 	
					.word 0x56000070 	
					.word 0x00155514 	
					.word 0x560000d8 	
					.word 0x560000d4 	
					.word S3C24X0_GPJCON 	
					.word 0x55555555 				@  0x544
.int_mask:			.word S3C24X0_INTERRUPT_MASK 	@  0x548
					.word S3C24X0_INTERRUPT_SUBMASK @  0x54C
.clkdivn_add:		.word S3C24X0_CLKDIVN	
.upllcon_add:		.word S3C24X0_UPLLCON		@ 0x554
.upllcon_val:		.word 0x0003c042
.camdivn:			.word S3C24X0_CAMDIVN
.clock_val2:		.word 0x00074051			@ 0x560
.mpllcon_400Mhz:	.word 0x0006e031 	
.mpllcon:			.word S3C24X0_MPLLCON 		
.gstatus3:			.word S3C24X0_GSTATUS3 		
.rtc_con:			.word S3C24X0_RTCCON 	   	
.adcbase_val:		.word 0x00003fc4 	   		@ 0x574
.misccr:			.word S3C2440_MISCCR 		
.misccr_mask:		.word 0x008ffffb 			
					.word 0x560000cc 	
					.word 0x4c00000c 	
					.word 0x48000024 	
					.word 0x0007fff8 			@ 0x590	
.gstatus2:			.word S3C24X0_GSTATUS2		@ 0x594	
					.word 0x00000101 	
					.word 0x53000004 	
					.word 0x53000008 	
.x5a0:				.word 0x00201000 	
.gstatus3_val:		.word 0x12345678 	
					.word 0x30020048 	
.x30020044:			.word 0x30020044 	
.home_btn_stat:		.word 0x30020110 		@ 0x5b0
.stack_pointer:		.word 0x33ff5800 	
					.word 0x000005bc 	
					.word 0x22121120 		@ 0x5bc
					.word 0x00000700 		@ 0x5c0
					.word 0x00000700 	
					.word 0x00000700 	
					.word 0x00000700 	
					.word 0x00000700 	
					.word 0x00000700 	
					.word 0x00018009 	
					.word 0x00018009 	
					.word 0x00ae04f5 	
					.word 0x000000b2 	
					.word 0x00000030 	
					.word 0x00000030 	

IcacheEnable:		mrc	15, 0, r0, cr1, cr0, 0		@ 0x5f0
					orr	r0, r0, #0x1000				@ I-cache enable
					mcr	15, 0, r0, cr1, cr0, 0      
					bx	lr

mem_rfrh:			ldr	r0, .memctl_rfrsh_add
					ldr	r1, .gpddat_add
					ldr	r2, [r1]
					tst	r2, #0x40		@ check GPD6 switch
					beq	b618
					b	b620

b618:			 	ldr	r1, .memctl_rfrsh_val
					str	r1, [r0]
b620:		 		bx	lr

					mrc 15, 0, r0, cr1, cr0, 0
					orr	r0, r0, #0xc0000000  	@ set asynchronous bus clocking mode
					mcr 15, 0, r0, cr1, cr0, 0
					bx	lr

nand_load_block:	push	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
					ldr	r1, .nand_nfdata
					mov	r2, #0x200
b640:	 			ldrb	r4, [r1]
					ldrb	r3, [r1]
					orr	r4, r4, r3, lsl #8
					ldrb	r3, [r1]
					orr	r4, r4, r3, lsl #16
					ldrb	r3, [r1]
					orr	r4, r4, r3, lsl #24
					ldrb	r5, [r1]
					ldrb	r3, [r1]
					orr	r5, r5, r3, lsl #8
					ldrb	r3, [r1]
					orr	r5, r5, r3, lsl #16
					ldrb	r3, [r1]
					orr	r5, r5, r3, lsl #24
					ldrb	r6, [r1]
					ldrb	r3, [r1]
					orr	r6, r6, r3, lsl #8
					ldrb	r3, [r1]
					orr	r6, r6, r3, lsl #16
					ldrb	r3, [r1]
					orr	r6, r6, r3, lsl #24
					ldrb	r7, [r1]
					ldrb	r3, [r1]
					orr	r7, r7, r3, lsl #8
					ldrb	r3, [r1]
					orr	r7, r7, r3, lsl #16
					ldrb	r3, [r1]
					orr	r7, r7, r3, lsl #24
					ldrb	r8, [r1]
					ldrb	r3, [r1]
					orr	r8, r8, r3, lsl #8
					ldrb	r3, [r1]
					orr	r8, r8, r3, lsl #16
					ldrb	r3, [r1]
					orr	r8, r8, r3, lsl #24
					ldrb	r9, [r1]
					ldrb	r3, [r1]
					orr	r9, r9, r3, lsl #8
					ldrb	r3, [r1]
					orr	r9, r9, r3, lsl #16
					ldrb	r3, [r1]
					orr	r9, r9, r3, lsl #24
					ldrb	sl, [r1]
					ldrb	r3, [r1]
					orr	sl, sl, r3, lsl #8
					ldrb	r3, [r1]
					orr	sl, sl, r3, lsl #16
					ldrb	r3, [r1]
					orr	sl, sl, r3, lsl #24
					ldrb	fp, [r1]
					ldrb	r3, [r1]
					orr	fp, fp, r3, lsl #8
					ldrb	r3, [r1]
					orr	fp, fp, r3, lsl #16
					ldrb	r3, [r1]
					orr	fp, fp, r3, lsl #24
					stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
					subs	r2, r2, #0x20
					bne	b640
					pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
					bx	lr @ lr is r14

.memctl_rfrsh_add:	.word	S3C24X0_MEMCTL_REFRESH 		@ 0x734	
.gpddat_add:		.word	S3C24X0_GPDDAT 	
.memctl_rfrsh_val:	.word	0x00ae03f3 	
.nand_nfdata:		.word	S3C2440_NAND_NFDATA 	     
x744:				.word	0x00000000 	     
x748:				.word	0x00000000 	     
x74c:				.word	0x00000000 	     
x750:				.word	0x00000000 	     
x754:				.word	0x78f2ce7f 	
x758:				.word	0x00000000 	
x75c:				.word	0x00000002 	
x760:				.word	0x00000024 	
x764:				.word	0x00001770 	
x768:				.word	0x00000b70 	
x76c:				.word	0x00001eb8 	
x770:				.word	0x53445352 	
x774:				.word	0x78f2ce7f 	
x778:				.word	0xac26a597 	
x77c:				.word	0x89867df2 	
x780:				.word	0x38d1beb4 	
x784:				.word	0x00000001 	
x788:				.word	0x70657473 	
x78c:				.word	0x2e72646c 	
x790:				.word	0x00626470 	
@							 04  08  0c  10  14  18  1c  20  24
b_794:			 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
					sub	sp, sp, #0x14			@ sp == 0x33FF5800 -0x14 to reposition on r9 when pop 
					mov	r3, #0
					str	r3, [sp]
					mov	r7, #0			@ 0x7a8
					bl	IcacheEnable
#ifdef ENABLE_NAND_INIT
					bl	nand_init
					add	r1, sp, #0xc
					add	r0, sp, #8
					bl	nand_001
					ldr	r3, [sp, #8]
					ldr	r4, .x0at950
					ldr	r2, [sp, #12]
					and	r1, r3, #0xff
					mov	r0, #0xec00
					mov	fp, #0xec00
					cmp	r1, #0xec
					orr	r0, r0, #0x76
					orr	fp, fp, #0xf1
					bne	loop794_1
					and	r3, r2, #0xff
					cmp	r3, #0x76
					moveq	r1, #0x4000
					moveq	r5, #0x200
					streq	r1, [r4, #12]
					streq	r5, [r4, #8]
					moveq	r7, r0
					beq	loop794_2
					cmp	r1, #0xec
					andeq	r3, r2, #0xff
					cmpeq	r3, #0xf1
					moveq	r1, #0x20000
					moveq	r5, #0x800
					streq	r1, [r4, #12]
					streq	r5, [r4, #8]
					moveq	r7, fp
					beq	loop794_2
loop794_1:			ldr	r1, [r4, #12]
					ldr	r5, [r4, #8]
loop794_2:			mov	r0, r5
					bl	bce0
					mov	sl, r0
					mov	r0, r5
					mov	r1, #0x1000
					bl	bce0
					mov	r6, r0
					mov	r0, r5
					mov	r1, #0x3000
					str	r6, [sp, #4]
					stm	r4, {r6, sl}
					bl	bce0
					ldr	r2, .x10at94c
					mov	r3, r0
					mov	r8, #PHYS_SDRAM_1
					str	r3, [sp, #16]
					orr	r8, r8, #0x7b000		@ r8 == 0x3007b000
					mov	r9, #0
					add	r3, r6, r3
					cmp	r6, r3
					str	r8, [r2]
					bge	b92c
b888:			 	mov	r0, sl
					mov	r1, r6
					bl	bce0
					mov	r3, #0xec00
					orr	r3, r3, #0x76
					cmp	r7, r3
					add	r0, r9, r0
					bne	b8b4
					mov	r2, r8
					bl	nand_002
					b	b8c4

b8b4:				cmp	r7, fp
					bne	b8e0
					mov	r2, r8
					bl	nand_read
b8c4:	 			ldr	r2, [r4]
					mov	r3, r0
					ldr	r5, [r4, #8]
					ldr	sl, [r4, #4]
					str	r2, [sp, #4]
					str	r3, [sp]
					b	b8e4
b8e0:				ldr	r3, [sp]
b8e4:				cmp	r3, #0
					bne	b90c
					mov	r0, sl
					mov	r1, r6
					bl	bce0
					cmp	r1, #0
					bne	stop2
					add	r9, r9, #1
					sub	r6, r6, #1
					b	b910
b90c:			 	add	r8, r8, r5
b910:			 	ldr	r3, [sp, #4]
					ldr	r2, [sp, #16]
					add	r6, r6, #1
					add	r3, r3, r2
					cmp	r6, r3
					blt	b888
#endif

					ldr	r2, .x10at94c
b92c:				ldr	r3, [r2]
					mov	lr, pc
					bx	r3
					mov	r0, #0
					add	sp, sp, #0x14
					pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
					bx	lr	
stop2:				b	stop2

.x10at94c:			.word 		x00000010
.x0at950:			.word 		_start


check_homeBtn:		mov	r2, #S3C24X0_GPIO_BASE
					orr	r2, r2, #0x54			@ S3C24X0_GPFDAT
					ldr	r3, [r2]
					tst	r3, #0x10    			@ check GPF4 - Home button
					ldreq	r3, [r2]
					tsteq	r3, #0x80
					moveq	r0, #1
					movne	r0, #0
					bx	lr

nand_001:			push	{r4, lr}
					mov	r4, #S3C2440_NAND_BASE
					orr	r4, r4, #4
					ldr	r3, [r4]
					mov	r2, #S3C2440_NAND_BASE
					orr	r2, r2, #8
					bic	r3, r3, #2
					str	r3, [r4]
					mvn	r3, #0x6f
					strb	r3, [r2]
					mov	lr, #S3C2440_NAND_BASE
					mov	r2, #S3C2440_NAND_BASE
					orr	lr, lr, #0xc
					mov	r3, #0
					orr	r2, r2, #0x10
					strb	r3, [lr]
					ldrsb	r3, [r2]
					str	r3, [r0]
					ldrsb	r3, [r2]
					str	r3, [r1]
					ldr	r3, [r4]
					orr	r3, r3, #2
					str	r3, [r4]
					pop	{r4, lr}
					bx	lr

nand_002:			push	{r4, r5, r6, r7, r8, lr}
					sub	sp, sp, #4
					mov	r4, r2
					mov	r8, #S3C2440_NAND_BASE
					orr	r8, r8, #4
					ldr	r3, [r8]
					mov	lr, #S3C2440_NAND_BASE
					add	r0, r1, r0, lsl #5
					orr	r3, r3, #0x10
					str	r3, [r8]
					ldr	r3, [r8]
					mov	r1, #S3C2440_NAND_BASE
					orr	lr, lr, #8
					bic	r3, r3, #0x20
					str	r3, [r8]
					ldr	r3, [r8]
					mov	r2, #0
					orr	r1, r1, #0xc
					bic	r3, r3, #2
					str	r3, [r8]
					strb	r2, [lr]
					strb	r2, [r1]
					lsr	r3, r0, #8
					strb	r0, [r1]
					strb	r3, [r1]
					lsr	r3, r0, #16
					strb	r3, [r1]
					str	r2, [sp]
					b	ja5c

ba50:				ldr	r3, [sp]
					add	r3, r3, #1
					str	r3, [sp]
ja5c:				ldr	r3, [sp]
					cmp	r3, #0x32
					blt	ba50
					mov	r2, #S3C2440_NAND_BASE
					orr	r2, r2, #0x20
ba70:				ldr	r3, [r2]
					tst	r3, #4
					beq	ba70
					mov	r0, r4
					bl	nand_load_block
					ldr	r3, [r8]
					mov	r2, #S3C2440_NAND_BASE
					orr	r2, r2, #0x10
					orr	r3, r3, #0x20
					str	r3, [r8]
					ldr	r6, [r2]
					ldr	r7, [r2]
					ldr	lr, [r2]
					mov	r1, #0xff000000
					orr	r1, r1, #0xff
					lsr	r3, lr, #8
					and	r0, r3, #0xff00
					and	r2, lr, r1
					and	r3, lr, #0xff
					mov	r4, #S3C2440_NAND_BASE
					and	r1, lr, #0xff00
					orr	r2, r0, r2
					mov	r5, #S3C2440_NAND_BASE
					orr	r3, r3, r1, lsl #8
					orr	r4, r4, #20
					lsr	r2, r2, #8
					orr	r5, r5, #24
					str	r3, [r4]
					str	r2, [r5]
					ldr	r3, [r8]
					mov	r0, #1
					orr	r3, r3, #2
					str	r3, [r8]
					add	sp, sp, #4
					pop	{r4, r5, r6, r7, r8, lr}
					bx	lr

nand_read:			push	{r4, r5, r6, lr}
					sub	sp, sp, #4
					mov	r5, r2
					mov	r4, #S3C2440_NAND_BASE
					orr	r4, r4, #4
					ldr	r3, [r4]
					mov	lr, #S3C2440_NAND_BASE
					add	r1, r1, r0, lsl #6
					orr	r3, r3, #0x10
					str	r3, [r4]
					ldr	r3, [r4]
					mov	r0, #S3C2440_NAND_BASE
					orr	lr, lr, #8
					bic	r3, r3, #0x20
					str	r3, [r4]
					ldr	r3, [r4]
					mov	r6, #0
					orr	r0, r0, #0xc
					bic	r3, r3, #2
					str	r3, [r4]
					strb	r6, [lr]
					strb	r6, [r0]
					strb	r6, [r0]
					lsr	r3, r1, #8
					strb	r1, [r0]
					strb	r3, [r0]
					mov	r3, #0x30
					strb	r3, [lr]
					str	r6, [sp]
					b	bb84
bb78:			 	ldr	r3, [sp]
					add	r3, r3, #1
					str	r3, [sp]
bb84:				ldr	r3, [sp]
					cmp	r3, #0xfa
					blt	bb78
					mov	r2, #S3C2440_NAND_BASE
					orr	r2, r2, #0x20
bb98:	 			ldr	r3, [r2]
					tst	r3, #4
					beq	bb98
					mov	r0, r5
					bl	nand_load_block
					add	r0, r5, #0x200
					bl	nand_load_block
					add	r0, r5, #0x400
					bl	nand_load_block
					add	r0, r5, #0x600
					bl	nand_load_block
					ldr	r3, [r4]
					orr	r3, r3, #0x20
					str	r3, [r4]
					str	r6, [sp]
					ldr	r3, [sp]
					cmp	r3, #0x40
					bge	bc04
					mov	r1, #S3C2440_NAND_BASE
					orr	r1, r1, #0x10
bbe8:				ldr	r3, [r1]
					ldr	r2, [sp]
					add	r3, r2, #1
					str	r3, [sp]
					ldr	r3, [sp]
					cmp	r3, #0x40
					blt	bbe8
bc04:				ldr	r3, [r4]
					mov	r0, #1
					orr	r3, r3, #2
					str	r3, [r4]
					add	sp, sp, #4
					pop	{r4, r5, r6, lr}
					bx	lr

bc20:				sub	sp, sp, #4
					mov	r1, #S3C2440_NAND_BASE
					orr	r1, r1, #4
					ldr	r3, [r1]
					mov	r2, #S3C2440_NAND_BASE
					orr	r2, r2, #8
					bic	r3, r3, #2
					str	r3, [r1]
					mvn	r3, #0
					strb	r3, [r2]
					mov	r3, #0
					b	bc58
bc50:			 	ldr	r3, [sp]
					add	r3, r3, #1
bc58:			 	str	r3, [sp]
					ldr	r3, [sp]
					cmp	r3, #0xa
					blt	bc50
					mov	r2, #S3C2440_NAND_BASE
					orr	r2, r2, #0x20
bc70:				ldr	r3, [r2]
					tst	r3, #4
					beq	bc70
					ldr	r3, [r1]
					orr	r3, r3, #2
					str	r3, [r1]
					add	sp, sp, #4
					bx	lr

nand_init:		 	push	{lr}		@ 0xc90 - (str lr, [sp, #-4]!)
					mov	r3, #0x7700
					orr	r3, r3, #0x70
					mov	r0, #S3C2440_NAND_BASE
					mov	r2, #S3C2440_NAND_BASE
					str	r3, [r0]
					mov	r3, #0x13
					orr	r2, r2, #4
					mov	r1, #S3C2440_NAND_BASE
					str	r3, [r2]
					mov	r3, #4
					orr	r1, r1, #0x20
					str	r3, [r1]
					bl	bc20
					mov	r3, #S3C2440_NAND_BASE
					orr	r3, r3, #8
					mov	r2, #0
					strb	r2, [r3]
					pop	{lr}		@ (ldr lr, [sp], #4)
					bx	lr

bce0:			 	mov	r3, #0
					movs	r2, r0
					beq	bda4
bcec:			 	cmp	r2, r1, lsr #8
					lslls	r2, r2, #8
					bcc	bcec
					cmp	r2, r1, lsr #1
					bhi	bd88
					cmp	r2, r1, lsr #2
					bhi	bd80
					cmp	r2, r1, lsr #3
					bhi	bd74
					cmp	r2, r1, lsr #4
					bhi	bd68
					cmp	r2, r1, lsr #5
					bhi	bd5c
					cmp	r2, r1, lsr #6
					bhi	bd50
					cmp	r2, r1, lsr #7
					bhi	bd44
bd30:	 			lsrhi	r2, r2, #8
					cmp	r1, r2, lsl #7
					adc	r3, r3, r3
					subcs	r1, r1, r2, lsl #7
					cmp	r1, r2, lsl #6
bd44:	 			adc	r3, r3, r3
					subcs	r1, r1, r2, lsl #6
					cmp	r1, r2, lsl #5
bd50:		 		adc	r3, r3, r3
					subcs	r1, r1, r2, lsl #5
					cmp	r1, r2, lsl #4
bd5c:			 	adc	r3, r3, r3
					subcs	r1, r1, r2, lsl #4
					cmp	r1, r2, lsl #3
bd68:	 			adc	r3, r3, r3
					subcs	r1, r1, r2, lsl #3
					cmp	r1, r2, lsl #2
bd74:	 			adc	r3, r3, r3
					subcs	r1, r1, r2, lsl #2
					cmp	r1, r2, lsl #1
bd80:	 			adc	r3, r3, r3
					subcs	r1, r1, r2, lsl #1
bd88:	 			cmp	r1, r2
					adc	r3, r3, r3
					subcs	r1, r1, r2
					cmp	r2, r0
					bne	bd30
					mov	r0, r3
					bx	lr

bda4:	 			ldr	ip, .xdbc
bda8:		 		ldr	r0, .xdc0
					mov	r1, #0	
					mov	r2, #0	
					mov	r3, #0	
					mov	pc, ip

.xdbc:	.word 			xdc4
.xdc0:	.word 			0xc0000094

xdc4:				push	{r4, lr}
					mov	r0, #0xc0000000
					ldr	r4, .xdf4
					orr	r0, r0, #0x94
					mov	r3, #0	
					mov	r2, #0	
					mov	r1, #0	
					mov	lr, pc
					bx	r4
					mvn	r0, #0	
					pop	{r4, lr}
					bx	lr

.xdf4:		.word 	0xf000fe38 	
xdf8:		.word 	0x012e0003 	
xdfc:		.word 	0x00001000 	
xe00:		.word 	0xfffff000 	
xe04:		.word 	0x00010005 	
xe08:		.word 	0x00010000 	
xe0c:		.word 	0x00005000 	
xe18:		.word 	0x78f2ce7f
@	...  	
xe34:			.word 	0x00002000
xe38:			.word 	0x00000040
xe3c:			.word 	0x00001600
xe40:			.word 	0x000004f8
xe44:			.word 	0x00004000
xe48:			.word 	0x00000028
xe4c:			.word 	0x00001750
xe50:			.word 	0x0000001c
@	...
xe64:			.word 	0x00000009
xe68:			.word 	0x00000df8
xe6c:			.word 	0x00001000
xe70:			.word 	0x00000e00
xe74:			.word 	0x00001000
xe78:			.word 	0x00000000
xe7c:			.word 	0x60000020
xe80:			.word 	0x00000014
xe84:			.word 	0x00002000
xe88:			.word 	0x00000000
xe8c:			.word 	0x00001df8
xe90:			.word 	0x33ff0000
xe94:			.word 	0xc0000040
xe98:			.word 	0x00000040
xe9c:			.word 	0x00002000
xea0:			.word 	0x00000200
xea4:			.word 	0x00002000
xea8:			.word 	0x00000000
xeac:			.word 	0x40000040
xeb0:			.word 	0x652e6b6e
xeb4:			.word 	0x00006578
xeb8:			.word 	0x02000000
xebc:			.word 	0x02000000
xec0:			.word 	0x00000000
xec4:			.word 	0x00002040
xec8:			.word 	0x00000001
xecc:			.word 	0x33ff0000
xed0:			.word 	0x33ff1000
xed4:			.word 	0x33ff1000
xed8:			.word 	0x00000001
xedc:			.word 	0x00001f2c
/*	         
     ef0:	80808080 	addhi	r8, r0, r0, lsl #1
	...
     efc:	000201c2 	andeq	r0, r2, r2, asr #3
	...
     f0c:	00000001 	andeq	r0, r0, r1
     f10:	e4fd7c4b 	ldrbt	r7, [sp], #3147
     f14:	01c78ca3 	biceq	r8, r7, r3, lsr #25
     f18:	00001af8 	strdeq	r1, [r0], -r8
     f1c:	00001eb0 	strheq	r1, [r0], -r0
     f20:	00001df8 	strdeq	r1, [r0], -r8
     f24:	00001e68 	andeq	r1, r0, r8, ror #28
     f28:	00000000 	andeq	r0, r0, r0
     f2c:	00001df8 	strdeq	r1, [r0], -r8
     f30:	33ff0000 	mvnscc	r0, #0	; 0x0
     f34:	00000000 	andeq	r0, r0, r0
     f38:	00000014 	andeq	r0, r0, r4, lsl r0
	*/
x1000:				 	b	b22b4
/*
    1040:	43454345 	movtmi	r4, #21317	; 0x5345
    1044:	3007cc30 	andcc	ip, r7, r0, lsr ip
    1048:	00001c30 	andeq	r1, r0, r0, lsr ip
	...
    2004:	9de8af5f 	stclls	15, cr10, [r8, #380]!
    2008:	00000000 	andeq	r0, r0, r0
    200c:	00000002 	andeq	r0, r0, r2
    2010:	00000025 	andeq	r0, r0, r5, lsr #32
    2014:	00001154 	andeq	r1, r0, r4, asr r1
    2018:	00000554 	andeq	r0, r0, r4, asr r5
    201c:	00000000 	andeq	r0, r0, r0
    2020:	3007cc30 	andcc	ip, r7, r0, lsr ip
	...
    202c:	00004033 	andeq	r4, r0, r3, lsr r0
    2030:	00444101 	subeq	r4, r4, r1, lsl #2
    2034:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    2038:	00004005 	andeq	r4, r0, r5
    203c:	00534c01 	subseq	r4, r3, r1, lsl #24
    2040:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    2044:	00002078 	andeq	r2, r0, r8, ror r0
    2048:	00534c01 	subseq	r4, r3, r1, lsl #24
    204c:	802910ec 	eorhi	r1, r9, ip, ror #1
    2050:	0000c0f0 	strdeq	ip, [r0], -r0
    2054:	00534b01 	subseq	r4, r3, r1, lsl #22
    2058:	812910ec 	teqhi	r9, ip, ror #1
    205c:	00000000 	andeq	r0, r0, r0
    2060:	00545204 	subseq	r5, r4, r4, lsl #4
    2064:	813910ec 	teqhi	r9, ip, ror #1
    2068:	0000900b 	andeq	r9, r0, fp
    206c:	00545204 	subseq	r5, r4, r4, lsl #4
    2070:	813910ec 	teqhi	r9, ip, ror #1
    2074:	0000d0c9 	andeq	sp, r0, r9, asr #1
    2078:	00545204 	subseq	r5, r4, r4, lsl #4
    207c:	813910ec 	teqhi	r9, ip, ror #1
    2080:	0000e04c 	andeq	lr, r0, ip, asr #32
    2084:	00545204 	subseq	r5, r4, r4, lsl #4
    2088:	13001186 	movwne	r1, #390	; 0x186
    208c:	000050ba 	strheq	r5, [r0], -sl
    2090:	004c4404 	subeq	r4, ip, r4, lsl #8
    2094:	0020100b 	eoreq	r1, r0, fp
    2098:	0000a0cc 	andeq	sl, r0, ip, asr #1
    209c:	00474e05 	subeq	r4, r7, r5, lsl #28
    20a0:	905010b7 	ldrhls	r1, [r0], #-7
    20a4:	00006008 	andeq	r6, r0, r8
    20a8:	00433306 	subeq	r3, r3, r6, lsl #6
    20ac:	920010b7 	andls	r1, r0, #183	; 0xb7
    20b0:	00000476 	andeq	r0, r0, r6, ror r4
    20b4:	00433306 	subeq	r3, r3, r6, lsl #6
    20b8:	00000000 	andeq	r0, r0, r0
    20bc:	00004033 	andeq	r4, r0, r3, lsr r0
    20c0:	00444101 	subeq	r4, r4, r1, lsl #2
    20c4:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    20c8:	00004005 	andeq	r4, r0, r5
    20cc:	00534c01 	subseq	r4, r3, r1, lsl #24
    20d0:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    20d4:	00002078 	andeq	r2, r0, r8, ror r0
    20d8:	00534c01 	subseq	r4, r3, r1, lsl #24
    20dc:	802910ec 	eorhi	r1, r9, ip, ror #1
    20e0:	0000c0f0 	strdeq	ip, [r0], -r0
    20e4:	00534b01 	subseq	r4, r3, r1, lsl #22
    20e8:	812910ec 	teqhi	r9, ip, ror #1
    20ec:	00000000 	andeq	r0, r0, r0
    20f0:	00545204 	subseq	r5, r4, r4, lsl #4
    20f4:	813910ec 	teqhi	r9, ip, ror #1
    20f8:	0000900b 	andeq	r9, r0, fp
    20fc:	00545204 	subseq	r5, r4, r4, lsl #4
    2100:	813910ec 	teqhi	r9, ip, ror #1
    2104:	0000d0c9 	andeq	sp, r0, r9, asr #1
    2108:	00545204 	subseq	r5, r4, r4, lsl #4
    210c:	813910ec 	teqhi	r9, ip, ror #1
    2110:	0000e04c 	andeq	lr, r0, ip, asr #32
    2114:	00545204 	subseq	r5, r4, r4, lsl #4
    2118:	13001186 	movwne	r1, #390	; 0x186
    211c:	000050ba 	strheq	r5, [r0], -sl
    2120:	004c4404 	subeq	r4, ip, r4, lsl #8
    2124:	0020100b 	eoreq	r1, r0, fp
    2128:	0000a0cc 	andeq	sl, r0, ip, asr #1
    212c:	00474e05 	subeq	r4, r7, r5, lsl #28
    2130:	905010b7 	ldrhls	r1, [r0], #-7
    2134:	00006008 	andeq	r6, r0, r8
    2138:	00433306 	subeq	r3, r3, r6, lsl #6
    213c:	920010b7 	andls	r1, r0, #183	; 0xb7
    2140:	00000476 	andeq	r0, r0, r6, ror r4
    2144:	00433306 	subeq	r3, r3, r6, lsl #6
    2148:	75746572 	ldrbvc	r6, [r4, #-1394]!
    214c:	30206e72 	eorcc	r6, r0, r2, ror lr
    2150:	00000020 	andeq	r0, r0, r0, lsr #32
    2154:	53445352 	movtpl	r5, #17234	; 0x4352
    2158:	9de8af5f 	stclls	15, cr10, [r8, #380]!
    215c:	47a6310a 	strmi	r3, [r6, sl, lsl #2]!
    2160:	8db0f63d 	ldchi	6, cr15, [r0, #244]!
    2164:	5773b93b 	undefined
    2168:	00000001 	andeq	r0, r0, r1
    216c:	50455453 	subpl	r5, r5, r3, asr r4
    2170:	3252444c 	subscc	r4, r2, #1275068416	; 0x4c000000
    2174:	6264702e 	rsbvs	r7, r4, #46	; 0x2e
    2178:	00000000 	andeq	r0, r0, r0
*/
nand_read1:	 			push	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}   @ 0x217c
						ldr	r1, .nand_nfdata_add
						mov	r2, #0x200
b2188:	 				ldrb	r4, [r1]
						ldrb	r3, [r1]
						orr	r4, r4, r3, lsl #8
						ldrb	r3, [r1]
						orr	r4, r4, r3, lsl #16
						ldrb	r3, [r1]
						orr	r4, r4, r3, lsl #24
						ldrb	r5, [r1]
						ldrb	r3, [r1]
						orr	r5, r5, r3, lsl #8
						ldrb	r3, [r1]
						orr	r5, r5, r3, lsl #16
						ldrb	r3, [r1]
						orr	r5, r5, r3, lsl #24
						ldrb	r6, [r1]
						ldrb	r3, [r1]
						orr	r6, r6, r3, lsl #8
						ldrb	r3, [r1]
						orr	r6, r6, r3, lsl #16
						ldrb	r3, [r1]
						orr	r6, r6, r3, lsl #24
						ldrb	r7, [r1]
						ldrb	r3, [r1]
						orr	r7, r7, r3, lsl #8
						ldrb	r3, [r1]
						orr	r7, r7, r3, lsl #16
						ldrb	r3, [r1]
						orr	r7, r7, r3, lsl #24
						ldrb	r8, [r1]
						ldrb	r3, [r1]
						orr	r8, r8, r3, lsl #8
						ldrb	r3, [r1]
						orr	r8, r8, r3, lsl #16
						ldrb	r3, [r1]
						orr	r8, r8, r3, lsl #24
						ldrb	r9, [r1]
						ldrb	r3, [r1]
						orr	r9, r9, r3, lsl #8
						ldrb	r3, [r1]
						orr	r9, r9, r3, lsl #16
						ldrb	r3, [r1]
						orr	r9, r9, r3, lsl #24
						ldrb	sl, [r1]
						ldrb	r3, [r1]
						orr	sl, sl, r3, lsl #8
						ldrb	r3, [r1]
						orr	sl, sl, r3, lsl #16
						ldrb	r3, [r1]
						orr	sl, sl, r3, lsl #24
						ldrb	fp, [r1]
						ldrb	r3, [r1]
						orr	fp, fp, r3, lsl #8
						ldrb	r3, [r1]
						orr	fp, fp, r3, lsl #16
						ldrb	r3, [r1]
						orr	fp, fp, r3, lsl #24
						stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
						subs	r2, r2, #0x20
						bne	b2188
						pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
						bx	lr


.nand_nfdata_add:		.word 	S3C2440_NAND_NFDATA           @ 0x227c

test_02:				ldr	r2, .x22b0       	@ 0x2280 - no, not enables mmu :-(
						mov	r3, #0x50000000
						sub	r2, r2, r3			@ r2==0xE007C2A0
						mov	r1, #0x70
						mcr 15, 0, r1, cr1, cr0, 0
						nop		
						mov	pc, r2
						nop		
						mov	r2, #0
						mcr 15, 0, r2, cr8, cr7, 0
						mov	pc, r0
						bx	lr

.x22b0:			.word 	0x3007c2a0

b22b4:				 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						sub	sp, sp, #0xc
						mov	r9, #0	
						mov	sl, #0	
						bl	b262c
						bl	b29b0
						add	r1, sp, #8	
						add	r0, sp, #4	
						bl	b2694
						ldr	r3, [sp, #4]
						ldr	r4, .x2628
						ldr	r2, [sp, #8]
						and	r1, r3, #0xff
						mov	fp, #0xec00
						mov	r0, #0xec00
						cmp	r1, #0xec
						orr	fp, fp, #0x76
						orr	r0, r0, #0xf1
						bne	checkPowerBtn
						and	r3, r2, #0xff
						cmp	r3, #0x76
						moveq	r3, #0x4000
						moveq	r2, #0x200
						moveq	r9, fp
						beq	b2338
						cmp	r1, #0xec
						bne	checkPowerBtn
						and	r3, r2, #0xff
						cmp	r3, #0xf1
						bne	checkPowerBtn
						mov	r3, #0x20000
						mov	r2, #0x800
						mov	r9, r0
b2338:	 				str	r2, [r4, #8]
						str	r3, [r4, #12]

checkPowerBtn:	 		mov	r1, #S3C24X0_GPIO_BASE
						orr	r1, r1, #0x50    		@ GPFCON
						ldr	r2, [r1]
						mov	r3, #0xff00
						orr	r3, r3, #0xfc
						mov	r0, #S3C24X0_GPIO_BASE
						and	r3, r2, r3
						orr	r0, r0, #0x54			@ S3C24X0_GPFDAT
						str	r3, [r1]
						ldr	r3, [r0]
						and	r3, r3, #1
						cmp	r3, #1					@ check GPF0 - power button
						beq	power_btnPressed
						ldr	r3, [r0]
						tst	r3, #0x10				@ check GPF4 - Home button
						moveq	r5, #1
						beq	home_btnPressed
						mov	r5, #0
						b	home_btnPressed
power_btnPressed:		mov	r5, #2
home_btnPressed:	 	ldr	r8, [r4, #12]			@ r5==1
						ldr	r0, [r4, #8]
						mov	r1, r8
						bl	b2a00
						mov	r6, r0
						str	r6, [r4, #4]
						cmp	r5, #0	
						bne	b23f0
						mov	r1, #0x40000
						mov	r0, r8
						bl	b2a00
						mul	r3, r0, r6
						ldr	r0, [r4, #8]
						mov	r1, #0x40000
						str	r3, [r4]
						bl	b2a00
						cmp	r1, #0	
						movne	r3, #1	
						moveq	r3, #0	
						add	r2, r0, r3
						mov	r7, #PHYS_SDRAM_1
						str	r2, [sp]
						orr	r7, r7, #0x31000
						b	b2458
b23f0:					ldr	r0, [r4, #8]
						cmp	r5, #1	
						bne	home_btnNotPressed
						mov	r1, #0x14000
						bl	b2a00
						mov	r3, r0
						ldr	r0, [r4, #8]
						mov	r1, #0x8000
						str	r3, [r4]
						bl	b2a00
						mov	r2, r0
						mov	r7, #PHYS_SDRAM_1
						str	r2, [sp]
						orr	r7, r7, #0x22000
						b	b2458
home_btnNotPressed:		mov	r1, #0x4000
						bl	b2a00
						mov	r3, r0
						ldr	r0, [r4, #8]
						mov	r1, #0x10000
						str	r3, [r4]
						bl	b2a00
						mov	r3, r0
						mov	r7, #PHYS_SDRAM_1
						str	r3, [sp]
						orr	r7, r7, #0x21000
b2458:	 				ldr	r3, .x2624
						cmp	r5, #0	
						str	r7, [r3]
						bne	b24ec
						mov	r6, #0	
						mov	r5, #0	
						cmp	r9, fp
						bne	b2490
						mov	r2, r7
						mov	r1, #0	
						mov	r0, r5
						bl	nand_003
						add	r5, r5, #8
						b	b24b4
b2490:				 	mov	r3, #0xec00
						orr	r3, r3, #0xf1
						cmp	r9, r3
						bne	b24bc
						mov	r2, r7
						mov	r1, #0
						mov	r0, r5
						bl	b27f8
						add	r5, r5, #1
b24b4:	 				ldr	r8, [r4, #12]
/*

    24b8:	e1a0a000 	mov	sl, r0
    b24bc:	e35a0000 	cmp	sl, #0	; 0x0
    24c0:	12866001 	addne	r6, r6, #1	; 0x1
    24c4:	e3560002 	cmp	r6, #2	; 0x2
    24c8:	daffffe8 	ble	0x2470
    24cc:	e5940008 	ldr	r0, [r4, #8]
    24d0:	e159000b 	cmp	r9, fp
    24d4:	02455008 	subeq	r5, r5, #8	; 0x8
    24d8:	e1a01008 	mov	r1, r8
    24dc:	12455001 	subne	r5, r5, #1	; 0x1
    24e0:	eb000146 	bl	b2a00
    24e4:	e0030590 	mul	r3, r0, r5
    24e8:	ea000011 	b	0x2534
    b24ec:	e159000b 	cmp	r9, fp
    24f0:	1a000010 	bne	0x2538
    24f4:	e3a00000 	mov	r0, #0	; 0x0
    24f8:	e3a06000 	mov	r6, #0	; 0x0
    24fc:	ea000001 	b	0x2508
    2500:	e2866008 	add	r6, r6, #8
    2504:	e1a00006 	mov	r0, r6
    2508:	e1a02007 	mov	r2, r7
    250c:	e3a01000 	mov	r1, #0	; 0x0
    2510:	eb000078 	bl	nand_003
    2514:	e3500000 	cmp	r0, #0	; 0x0
    2518:	0afffff8 	beq	0x2500
    251c:	e3550002 	cmp	r5, #2	; 0x2
    2520:	02863020 	addeq	r3, r6, #0x20
    2524:	0a000002 	beq	0x2534
    2528:	e3550001 	cmp	r5, #1	
    252c:	1a000001 	bne	0x2538
    2530:	e28630a0 	add	r3, r6, #0xa0
    2534:	e5843000 	str	r3, [r4]
    2538:	e5945000 	ldr	r5, [r4]
    253c:	e59da000 	ldr	sl, [sp]
    2540:	e3a06000 	mov	r6, #0	; 0x0
    2544:	ea00002a 	b	0x25f4
    b2548:	e5940004 	ldr	r0, [r4, #4]
    254c:	e1a01005 	mov	r1, r5
    2550:	eb00012a 	bl	b2a00
    2554:	e0868000 	add	r8, r6, r0
    2558:	e159000b 	cmp	r9, fp
    255c:	1a000011 	bne	0x25a8
    2560:	e1a02007 	mov	r2, r7
    2564:	e1a00008 	mov	r0, r8
    2568:	eb000062 	bl	nand_003
    256c:	e3500000 	cmp	r0, #0	; 0x0
    2570:	1a00001c 	bne	0x25e8
    2574:	e1a03148 	asr	r3, r8, #2
    2578:	e0883ea3 	add	r3, r8, r3, lsr #29
    257c:	e1a031c3 	asr	r3, r3, #3
    2580:	e0583183 	subs	r3, r8, r3, lsl #3
    2584:	1a000017 	bne	0x25e8
    2588:	e5940004 	ldr	r0, [r4, #4]
    258c:	e1a01005 	mov	r1, r5
    2590:	eb00011a 	bl	b2a00
    2594:	e3510000 	cmp	r1, #0	; 0x0
    2598:	1a000012 	bne	0x25e8
    259c:	e2866008 	add	r6, r6, #8	; 0x8
    25a0:	e2455001 	sub	r5, r5, #1	; 0x1
    25a4:	ea000011 	b	b25f0

    25a8:	e3a03b3b 	mov	r3, #0xec00
    25ac:	e38330f1 	orr	r3, r3,0xf1
    25b0:	e1590003 	cmp	r9, r3
    25b4:	1a00000b 	bne	0x25e8
    25b8:	e1a02007 	mov	r2, r7
    25bc:	e1a00008 	mov	r0, r8
    25c0:	eb00008c 	bl	0x27f8
    25c4:	e3500000 	cmp	r0, #0	; 0x0
    25c8:	1a000006 	bne	0x25e8
    25cc:	e5940004 	ldr	r0, [r4, #4]
    25d0:	e1a01005 	mov	r1, r5
    25d4:	eb000109 	bl	b2a00
    25d8:	e3510000 	cmp	r1, #0	; 0x0
    25dc:	02866001 	addeq	r6, r6, #1	; 0x1
    25e0:	02455001 	subeq	r5, r5, #1	; 0x1
    25e4:	0a000001 	beq	b25f0
    25e8:	e5943008 	ldr	r3, [r4, #8]
    25ec:	e0877003 	add	r7, r7, r3
    b25f0:	e2855001 	add	r5, r5, #1	; 0x1
    25f4:	e5943000 	ldr	r3, [r4]
    25f8:	e083300a 	add	r3, r3, sl
    25fc:	e1550003 	cmp	r5, r3
    2600:	baffffd0 	blt	0x2548
    2604:	e59f3018 	ldr	r3, .x2624
    2608:	e5933000 	ldr	r3, [r3]
*/ 

						mov	lr, pc
						bx	r3
						mov	r0, #0
						add	sp, sp, #0xc
b261c:	 				pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						bx	lr

.x2624:		.word 		0x33ff0068 	
.x2628:		.word 		0x33ff0058 	

b262c:					bx	lr
b2630:					ldrb	r3, [r0]
						b	b263c
b2638:				 	ldrb	r3, [r0, #1]!
b263c:	 				cmp	r3, #0
						bne	b2638
						bx	lr

/*
    2648:	e92d0006 	push	{r1, r2}
    264c:	e3a01021 	mov	r1, #33	; 0x21
    2650:	e3a02064 	mov	r2, #100	; 0x64
    2654:	e2522001 	subs	r2, r2, #1	; 0x1
    2658:	1afffffd 	bne	0x2654
    265c:	e2511001 	subs	r1, r1, #1	; 0x1
    2660:	1afffffa 	bne	0x2650
    2664:	e2500001 	subs	r0, r0, #1	; 0x1
    2668:	1afffff7 	bne	0x264c
    266c:	e8bd0006 	pop	{r1, r2}
    2670:	e1a0f00e 	bx	lr
    2674:	e92d0006 	push	{r1, r2}
    2678:	e3a02003 	mov	r2, #3	; 0x3
    267c:	e2522001 	subs	r2, r2, #1	; 0x1
    2680:	1afffffd 	bne	0x267c
    2684:	e2500001 	subs	r0, r0, #1	; 0x1
    2688:	1afffffa 	bne	0x2678
    268c:	e8bd0006 	pop	{r1, r2}
    2690:	e1a0f00e 	bx	lr

    b2694:	e92d4010 	push	{r4, lr}
    2698:	e3a0444e 	mov	r4, #S3C2440_NAND_BASE
    269c:	e3844004 	orr	r4, r4, #4	; 0x4
    26a0:	e5943000 	ldr	r3, [r4]
    26a4:	e3a0244e 	mov	r2, #S3C2440_NAND_BASE
    26a8:	e3822008 	orr	r2, r2, #8	; 0x8
    26ac:	e3c33002 	bic	r3, r3, #2	; 0x2
    26b0:	e5843000 	str	r3, [r4]
    26b4:	e3e0306f 	mvn	r3, #111	; 0x6f
    26b8:	e5c23000 	strb	r3, [r2]
    26bc:	e3a0e44e 	mov	lr, #S3C2440_NAND_BASE
    26c0:	e3a0244e 	mov	r2, #S3C2440_NAND_BASE
    26c4:	e38ee00c 	orr	lr, lr, #12	; 0xc
    26c8:	e3a03000 	mov	r3, #0	; 0x0
    26cc:	e3822010 	orr	r2, r2, #16	; 0x10
    26d0:	e5ce3000 	strb	r3, [lr]
    26d4:	e1d230d0 	ldrsb	r3, [r2]
    26d8:	e5803000 	str	r3, [r0]
    26dc:	e1d230d0 	ldrsb	r3, [r2]
    26e0:	e5813000 	str	r3, [r1]
    26e4:	e5943000 	ldr	r3, [r4]
    26e8:	e3833002 	orr	r3, r3, #2	; 0x2
    26ec:	e5843000 	str	r3, [r4]
    26f0:	e8bd4010 	pop	{r4, lr}
    26f4:	e12fff1e 	bx	lr
*/
nand_003:			 	push	{r4, r5, lr}
						sub	sp, sp, #0x4
						mov	r5, r2
						mov	r4, #S3C2440_NAND_BASE
						orr	r4, r4, #4
						ldr	r3, [r4]
						mov	lr, #S3C2440_NAND_BASE
						add	r0, r1, r0, lsl #5
						orr	r3, r3, #0x10
						str	r3, [r4]
						ldr	r3, [r4]
						mov	r1, #S3C2440_NAND_BASE
						orr	lr, lr, #8
						bic	r3, r3, #0x20
						str	r3, [r4]
						ldr	r3, [r4]
						mov	r2, #0
						orr	r1, r1, #0xc
						bic	r3, r3, #2
						str	r3, [r4]
						strb	r2, [lr]
						strb	r2, [r1]
						lsr	r3, r0, #8
						strb	r0, [r1]
						strb	r3, [r1]
						lsr	r3, r0, #16
						strb	r3, [r1]
						str	r2, [sp]
						b	b2778
						ldr	r3, [sp]
						add	r3, r3, #1
						str	r3, [sp]
						ldr	r3, [sp]
						cmp	r3, #0x32
						blt	b276c
						mov	r2, #S3C2440_NAND_BASE
						orr	r2, r2, #0x20
						ldr	r3, [r2]
						tst	r3, #4
						beq	b278c
						mov	r0, r5
						bl	nand_read1
						ldr	r3, [r4]
						mov	r2, #S3C2440_NAND_BASE
						orr	r2, r2, #0x10
						orr	r3, r3, #0x20
						str	r3, [r4]
						ldr	r3, [r2]
						ldr	r2, [r2]
						ldr	r1, [r4]
						lsr	r3, r2, #8
						orr	r2, r1, #2
						str	r2, [r4]
						ands	r3, r3, #0xff
						bne	b27e4
						ldr	r0, .x27f4
						bl	b2630
						mov	r0, #0	
						b	b27e8
b27e4:	 				mov	r0, #1	
b27e8:	 				add	sp, sp, #4
						pop	{r4, r5, lr}
						bx	lr
.x27f4:		.word 	0x3007c148 	

b27f8:				 	push	{r4, r5, r6, r7, r8, lr}
/*
    27fc:	e24dd004 	sub	sp, sp, #4	; 0x4
    2800:	e1a06002 	mov	r6, r2
    2804:	e1a08001 	mov	r8, r1
    2808:	e3a0444e 	mov	r4, #S3C2440_NAND_BASE
    280c:	e3844004 	orr	r4, r4, #4	; 0x4
    2810:	e5943000 	ldr	r3, [r4]
    2814:	e3a0744e 	mov	r7, #S3C2440_NAND_BASE
    2818:	e3a0544e 	mov	r5, #S3C2440_NAND_BASE
    281c:	e3833010 	orr	r3, r3, #16	; 0x10
    2820:	e5843000 	str	r3, [r4]
    2824:	e5943000 	ldr	r3, [r4]
    2828:	e3877008 	orr	r7, r7, #8	; 0x8
    282c:	e3a02000 	mov	r2, #0	; 0x0
    2830:	e3c33020 	bic	r3, r3, #32	; 0x20
    2834:	e5843000 	str	r3, [r4]
    2838:	e5943000 	ldr	r3, [r4]
    283c:	e385500c 	orr	r5, r5, #12	; 0xc
    2840:	e0880300 	add	r0, r8, r0, lsl #6
    2844:	e3c33002 	bic	r3, r3, #2	; 0x2
    2848:	e5843000 	str	r3, [r4]
    284c:	e5c72000 	strb	r2, [r7]
    2850:	e5c52000 	strb	r2, [r5]
    2854:	e5c52000 	strb	r2, [r5]
    2858:	e1a03420 	lsr	r3, r0, #8
    285c:	e5c50000 	strb	r0, [r5]
    2860:	e5c53000 	strb	r3, [r5]
    2864:	e3a03030 	mov	r3, #48	; 0x30
    2868:	e5c73000 	strb	r3, [r7]
    286c:	e58d2000 	str	r2, [sp]
    2870:	ea000002 	b	0x2880
    2874:	e59d3000 	ldr	r3, [sp]
    2878:	e2833001 	add	r3, r3, #1	; 0x1
    287c:	e58d3000 	str	r3, [sp]
    2880:	e59d3000 	ldr	r3, [sp]
    2884:	e35300fa 	cmp	r3, #250	; 0xfa
    2888:	bafffff9 	blt	0x2874
    288c:	e3a0244e 	mov	r2, #S3C2440_NAND_BASE
    2890:	e3822020 	orr	r2, r2, #32	; 0x20
    2894:	e5923000 	ldr	r3, [r2]
    2898:	e3130004 	tst	r3, #4	; 0x4
    289c:	0afffffc 	beq	0x2894
    28a0:	e1a00006 	mov	r0, r6
    28a4:	ebfffe34 	bl	nand_read1
    28a8:	e2860c02 	add	r0, r6, #512	; 0x200
    28ac:	ebfffe32 	bl	nand_read1
    28b0:	e2860b01 	add	r0, r6, #1024	; 0x400
    28b4:	ebfffe30 	bl	nand_read1
    28b8:	e2860c06 	add	r0, r6, #1536	; 0x600
    28bc:	ebfffe2e 	bl	nand_read1
    28c0:	e5942000 	ldr	r2, [r4]
    28c4:	e2083003 	and	r3, r8, #3	; 0x3
    28c8:	e2831080 	add	r1, r3, #128	; 0x80
    28cc:	e3823020 	orr	r3, r2, #32	; 0x20
    28d0:	e5843000 	str	r3, [r4]
    28d4:	e3a02005 	mov	r2, #5	; 0x5
    28d8:	e1a03201 	lsl	r3, r1, #4
    28dc:	e5c72000 	strb	r2, [r7]
    28e0:	e5c53000 	strb	r3, [r5]
    28e4:	e1a03443 	asr	r3, r3, #8
    28e8:	e5c53000 	strb	r3, [r5]
    28ec:	e3e0301f 	mvn	r3, #31	; 0x1f
    28f0:	e5c73000 	strb	r3, [r7]
    28f4:	e3a0344e 	mov	r3, #S3C2440_NAND_BASE
    28f8:	e3833010 	orr	r3, r3, #16	; 0x10
    28fc:	e5932000 	ldr	r2, [r3]
    2900:	e5933000 	ldr	r3, [r3]
    2904:	e5941000 	ldr	r1, [r4]
    2908:	e1a03423 	lsr	r3, r3, #8
    290c:	e3812002 	orr	r2, r1, #2	; 0x2
    2910:	e5842000 	str	r2, [r4]
    2914:	e21330ff 	ands	r3, r3, #255	; 0xff
    2918:	1a000003 	bne	0x292c
    291c:	e59f0018 	ldr	r0, [pc, #24]	; 0x293c
    2920:	ebffff42 	bl	0x2630
    2924:	e3a00000 	mov	r0, #0	; 0x0
    2928:	ea000000 	b	0x2930
    292c:	e3a00001 	mov	r0, #1	; 0x1
    2930:	e28dd004 	add	sp, sp, #4	; 0x4
*/
						pop	{r4, r5, r6, r7, r8, lr}
						bx	lr
/*
    293c:	3007c148 	andcc	ip, r7, r8, asr #2
    2940:	e24dd004 	sub	sp, sp, #4	; 0x4
    2944:	e3a0144e 	mov	r1, #S3C2440_NAND_BASE
    2948:	e3811004 	orr	r1, r1, #4	; 0x4
    294c:	e5913000 	ldr	r3, [r1]
    2950:	e3a0244e 	mov	r2, #S3C2440_NAND_BASE
    2954:	e3822008 	orr	r2, r2, #8	; 0x8
    2958:	e3c33002 	bic	r3, r3, #2	; 0x2
    295c:	e5813000 	str	r3, [r1]
    2960:	e3e03000 	mvn	r3, #0	; 0x0
    2964:	e5c23000 	strb	r3, [r2]
    2968:	e3a03000 	mov	r3, #0	; 0x0
    296c:	ea000001 	b	0x2978
    2970:	e59d3000 	ldr	r3, [sp]
    2974:	e2833001 	add	r3, r3, #1	; 0x1
    2978:	e58d3000 	str	r3, [sp]
    297c:	e59d3000 	ldr	r3, [sp]
    2980:	e353000a 	cmp	r3, #10	; 0xa
    2984:	bafffff9 	blt	0x2970
    2988:	e3a0244e 	mov	r2, #S3C2440_NAND_BASE
    298c:	e3822020 	orr	r2, r2, #32	; 0x20
    2990:	e5923000 	ldr	r3, [r2]
    2994:	e3130004 	tst	r3, #4	; 0x4
    2998:	0afffffc 	beq	0x2990
    299c:	e5913000 	ldr	r3, [r1]
    29a0:	e3833002 	orr	r3, r3, #2	; 0x2
    29a4:	e5813000 	str	r3, [r1]
    29a8:	e28dd004 	add	sp, sp, #4	; 0x4
    29ac:	e12fff1e 	bx	lr

    b29b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    29b4:	e3a03c77 	mov	r3, #30464	; 0x7700
    29b8:	e3833070 	orr	r3, r3, #112	; 0x70
    29bc:	e3a0044e 	mov	r0, #S3C2440_NAND_BASE
    29c0:	e3a0244e 	mov	r2, #S3C2440_NAND_BASE
    29c4:	e5803000 	str	r3, [r0]
    29c8:	e3a03013 	mov	r3, #19	; 0x13
    29cc:	e3822004 	orr	r2, r2, #4	; 0x4
    29d0:	e3a0144e 	mov	r1, #S3C2440_NAND_BASE
    29d4:	e5823000 	str	r3, [r2]
    29d8:	e3a03004 	mov	r3, #4	; 0x4
    29dc:	e3811020 	orr	r1, r1, #32	; 0x20
    29e0:	e5813000 	str	r3, [r1]
    29e4:	ebffffd5 	bl	0x2940
    29e8:	e3a0344e 	mov	r3, #S3C2440_NAND_BASE
    29ec:	e3833008 	orr	r3, r3, #8	; 0x8
    29f0:	e3a02000 	mov	r2, #0	; 0x0
    29f4:	e5c32000 	strb	r2, [r3]
    29f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    29fc:	e12fff1e 	bx	lr
*/
    b2a00:	 	mov	r3, #0	
     	movs	r2, r0
     	beq	b2ac4
    b2a0c:	 	cmp	r2, r1, lsr #8
     	lslls	r2, r2, #8
     	bcc	b2a0c
     	cmp	r2, r1, lsr #1
     	bhi	b2aa8
     	cmp	r2, r1, lsr #2
     	bhi	b2aa0
     	cmp	r2, r1, lsr #3
     	bhi	b2a94
     	cmp	r2, r1, lsr #4
     	bhi	b2a88
     	cmp	r2, r1, lsr #5
     	bhi	b2a7c
     	cmp	r2, r1, lsr #6
     	bhi	b2a70
     	cmp	r2, r1, lsr #7
     	bhi	b2a64
b2a50:	 	lsrhi	r2, r2, #8
     	cmp	r1, r2, lsl #7
     	adc	r3, r3, r3
     	subcs	r1, r1, r2, lsl #7
     	cmp	r1, r2, lsl #6
b2a64:	 	adc	r3, r3, r3
     	subcs	r1, r1, r2, lsl #6
     	cmp	r1, r2, lsl #5
b2a70:	 	adc	r3, r3, r3
     	subcs	r1, r1, r2, lsl #5
     	cmp	r1, r2, lsl #4
b2a7c:	 	adc	r3, r3, r3
     	subcs	r1, r1, r2, lsl #4
     	cmp	r1, r2, lsl #3
b2a88:	 	adc	r3, r3, r3
     	subcs	r1, r1, r2, lsl #3
     	cmp	r1, r2, lsl #2
b2a94:	 	adc	r3, r3, r3
     	subcs	r1, r1, r2, lsl #2
     	cmp	r1, r2, lsl #1
b2aa0:	 				adc	r3, r3, r3
						subcs	r1, r1, r2, lsl #1
b2aa8:	 				cmp	r1, r2
						adc	r3, r3, r3
						subcs	r1, r1, r2
						cmp	r2, r0
						bne	b2a50
						mov	r0, r3
						bx	lr
b2ac4:	 				ldr	ip, .x2adc
						ldr	r0, .x2ae0
						mov	r1, #0	
						mov	r2, #0	
						mov	r3, #0	
						mov	pc, ip
.x2adc:		.word 	0x3007cae4 	
.x2ae0:		.word 	0xc0000094 	
/*
    2ae4:	e92d4010 	push	{r4, lr}
    2ae8:	e3a00103 	mov	r0, #0xc0000000
    2aec:	e59f4020 	ldr	r4, [pc, #32]	; 0x2b14
    2af0:	e3800094 	orr	r0, r0, #148	; 0x94
    2af4:	e3a03000 	mov	r3, #0	; 0x0
    2af8:	e3a02000 	mov	r2, #0	; 0x0
    2afc:	e3a01000 	mov	r1, #0	; 0x0
    2b00:	e1a0e00f 	mov	lr, pc
    2b04:	e12fff14 	bx	r4
    2b08:	e3e00000 	mvn	r0, #0	; 0x0
    2b0c:	e8bd4010 	pop	{r4, lr}
    2b10:	e12fff1e 	bx	lr
*/

.x2b14:	.word 0xf000fe38
b2b18:	.word 0x00000020 	
		.word 0x00000021 	
		.word 0x00000022 	
		.word 0x00000023 	
		.word 0x00000025 	
    	.word 0x00000027 	
    	.word 0x00000028 	
    	.word 0x00000029 	
    	.word 0x0000002a 	
    	.word 0x0000002b 	
    	.word 0x0000002f 	
    	.word 0x00000020 	
    	.word 0x00000021 	
    	.word 0x00000022 	
    	.word 0x00000023 	
    	.word 0x00000025 	
    	.word 0x00000027 	
    	.word 0x00000028 	
    	.word 0x00000029 	
    	.word 0x0000002a 	
    	.word 0x0000002b 	
    	.word 0x0000002f 	
    	.word 0x012e0003 	
    	.word 0x000012b4 	
    	.word 0x3007b000 	
    	.word 0x00010005 	
    	.word 0x00010000 	
    	.word 0x00005000 
/*	 	
	...	
    2b90:	9de8af5f 	stclls	15, cr10, [r8, #380]!
	...
    2bac:	00002000 	
    2bb0:	00000048 	
    2bb4:	00001600 	
    2bb8:	000004f8 	
    2bbc:	00004000 	
    2bc0:	00000030 	
    2bc4:	00001000 	
    2bc8:	0000001c 	
	...
    2bdc:	00000009 	
    2be0:	00000b18 	
    2be4:	00001000 	
    2be8:	00000c00 	
    2bec:	3007c000 	
    2bf0:	3007c000 	
    2bf4:	60000020 	
    2bf8:	0000006c 	
    2bfc:	00002000 	
    2c00:	00000055 	
    2c04:	3007cb18 	
    2c08:	33ff0000 	
    2c0c:	c0000040 	
    2c10:	00000048 	
    2c14:	00002000 	
    2c18:	00000200 	
    2c1c:	3007d000 	
    2c20:	3007e000 	
    2c24:	40000040 	
    2c28:	652e6b6e 	
    2c2c:	00006578 	
    2c30:	02000000 	
    2c34:	02000000 	
    2c38:	3007b000 	
    2c3c:	3007d048 	
    2c40:	00000001 	
    2c44:	33ff0000 	
    2c48:	33ff1000 	
    2c4c:	33ff1000 	
    2c50:	00000001 	
    2c54:	3007cca4 	
	...
    2c68:	80808080 	
	...
    2c74:	000201c2 	
	...
    2c84:	00000001 	
    2c88:	e582f383 	
    2c8c:	01c78ca3 	
    2c90:	00001af8 	
    2c94:	3007cc28 	
    2c98:	3007cb70 	
    2c9c:	3007cbe0 	
    2ca0:	3007b000 	
    2ca4:	3007cb18 	
    2ca8:	33ff0000 	
    2cac:	00000055 	
    2cb0:	0000006c 	
	...
    3000:	3007c2b4 	
    3004:	4000de02 	
    3008:	3007c62c 	
    300c:	40000100 	
    3010:	3007c630 	
    3014:	40000600 	
    3018:	3007c694 	
    301c:	40001901 	
    3020:	3007c6f8 	
    3024:	40004002 	
    3028:	3007c7f8 	
    302c:	40005202 	
    3030:	3007c940 	
    3034:	40001c01 	
    3038:	3007c9b0 	
    303c:	40001401 	
    3040:	3007cae4 	
    3044:	40000d01 	
	...
*/
b4000:			 	b	b5000
/*
	...
    4040:	43454345 	movtmi	r4, #21317	; 0x5345
    4044:	8002c9d0 	ldrdhi	ip, [r2], -r0
    4048:	0000b9d0 	ldrdeq	fp, [r0], -r0
	...
*/
b5000:			 	b	b5148
/*
    5004:	80000000 	andhi	r0, r0, r0
    5008:	30000000 	andcc	r0, r0, r0
    500c:	00000040 	andeq	r0, r0, r0, asr #32
    5010:	84000000 	strhi	r0, [r0]
    5014:	10000000 	andne	r0, r0, r0
    5018:	00000020 	andeq	r0, r0, r0, lsr #32
    501c:	86000000 	strhi	r0, [r0], -r0
    5020:	18000000 	stmdane	r0, {}
    5024:	00000020 	andeq	r0, r0, r0, lsr #32
    5028:	88000000 	stmdahi	r0, {}
    502c:	20000000 	andcs	r0, r0, r0
    5030:	00000020 	andeq	r0, r0, r0, lsr #32
    5034:	8a000000 	bhi	0x503c
    5038:	28000000 	stmdacs	r0, {}
    503c:	00000020 	andeq	r0, r0, r0, lsr #32
    5040:	8c000000 	stchi	0, cr0, [r0], {0}
    5044:	08000000 	stmdaeq	r0, {}
    5048:	00000020 	andeq	r0, r0, r0, lsr #32
    504c:	90800000 	addls	r0, r0, r0
    5050:	48000000 	stmdami	r0, {}
    5054:	00000001 	andeq	r0, r0, r1
    5058:	90900000 	addsls	r0, r0, r0
    505c:	49000000 	stmdbmi	r0, {}
    5060:	00000001 	andeq	r0, r0, r1
    5064:	90a00000 	adcls	r0, r0, r0
    5068:	4a000000 	bmi	0x5070
    506c:	00000001 	andeq	r0, r0, r1
    5070:	90b00000 	adcsls	r0, r0, r0
    5074:	4b000000 	blmi	0x507c
    5078:	00000001 	andeq	r0, r0, r1
    507c:	90c00000 	sbcls	r0, r0, r0
    5080:	4c000000 	stcmi	0, cr0, [r0], {0}
    5084:	00000001 	andeq	r0, r0, r1
    5088:	90d00000 	sbcsls	r0, r0, r0
    508c:	4d000000 	stcmi	0, cr0, [r0]
    5090:	00000001 	andeq	r0, r0, r1
    5094:	90e00000 	rscls	r0, r0, r0
    5098:	4e000000 	cdpmi	0, 0, cr0, cr0, cr0, {0}
    509c:	00000001 	andeq	r0, r0, r1
    50a0:	90f00000 	rscsls	r0, r0, r0
    50a4:	4f000000 	svcmi	0x00000000
    50a8:	00000001 	andeq	r0, r0, r1
    50ac:	91000000 	tstls	r0, r0
    50b0:	50000000 	andpl	r0, r0, r0
    50b4:	00000001 	andeq	r0, r0, r1
    50b8:	91100000 	tstls	r0, r0
    50bc:	51000000 	tstpl	r0, r0
    50c0:	00000001 	andeq	r0, r0, r1
    50c4:	91200000 	teqls	r0, r0
    50c8:	52000000 	andpl	r0, r0, #0	; 0x0
    50cc:	00000001 	andeq	r0, r0, r1
    50d0:	91300000 	teqls	r0, r0
    50d4:	53000000 	movwpl	r0, #0	; 0x0
    50d8:	00000001 	andeq	r0, r0, r1
    50dc:	91400000 	cmpls	r0, r0
    50e0:	54000000 	strpl	r0, [r0]
    50e4:	00000001 	andeq	r0, r0, r1
    50e8:	91500000 	cmpls	r0, r0
    50ec:	55000000 	strpl	r0, [r0]
    50f0:	00000001 	andeq	r0, r0, r1
    50f4:	91600000 	cmnls	r0, r0
    50f8:	56000000 	strpl	r0, [r0], -r0
    50fc:	00000001 	andeq	r0, r0, r1
    5100:	91700000 	cmnls	r0, r0
    5104:	57000000 	strpl	r0, [r0, -r0]
    5108:	00000001 	andeq	r0, r0, r1
    510c:	91800000 	orrls	r0, r0, r0
    5110:	58000000 	stmdapl	r0, {}
    5114:	00000001 	andeq	r0, r0, r1
    5118:	91900000 	orrsls	r0, r0, r0
    511c:	59000000 	stmdbpl	r0, {}
    5120:	00000001 	andeq	r0, r0, r1
    5124:	91a00000 	movls	r0, r0
    5128:	5a000000 	bpl	0x5130
    512c:	00000001 	andeq	r0, r0, r1
    5130:	92000000 	andls	r0, r0, #0	; 0x0
    5134:	00000000 	andeq	r0, r0, r0
    5138:	00000020 	andeq	r0, r0, r0, lsr #32
	...
*/
b5148:				 	sub	fp, pc, #332	@ 0x14c
b514c:					ldr	sl, .x5250
						add	sl, sl, #0x2000
						mov	r0, #0xe
						orr	r0, r0, #0x400
b515c:				 	mov	r1, fp
b5160:		 			ldr	r2, [r1], #4
						ldr	r3, [r1], #4
						ldr	r4, [r1], #4
						cmp	r4, #0
						beq	b51ac
						ldr	r5, .x5254
						and	r2, r2, r5
						ldr	r5, .x5258
						and	r3, r3, r5
						add	r2, sl, r2, lsr #18
						add	r0, r0, r3
b518c:	 				str	r0, [r2], #4
						add	r0, r0, #0x100000
						sub	r4, r4, #1
						cmp	r4, #0
						bne	b518c
						bic	r0, r0, #0xf0000000
						bic	r0, r0, #0xff00000
						b	b5160
b51ac:	 				tst	r0, #8	
						bic	r0, r0, #0xc
						add	sl, sl, #0x800
						bne	b515c
						sub	sl, sl, #0x3000
						ldr	r0, .x5250
						ldr	r1, .x525c
						str	r1, [r0]
						add	r0, r0, #0x800
						ldr	r1, .x5260
						str	r1, [r0]
						ldr	sl, .x5250
						mov	r0, #PHYS_SDRAM_1
						add	sl, sl, #0xc00
						add	r0, r0, #0x1e
						orr	r0, r0, #0x400
						mov	r1, #0	
						mov	r3, #0x40
b51f4:	 				mov	r2, r1
						cmp	r2, #0x200
						add	r2, sl, r2, lsl #2
						strcc	r0, [r2]
						add	r0, r0, #0x100000
						subs	r3, r3, #1	
						add	r1, r1, #1	
						bgt	b51f4
						ldr	sl, .x5250				@ sl == 0x30010000
						mov r1, #1
						mcr 15, 0, r1, cr3, cr0, 0  @ defines mmu regions 
						mcr 15, 0, sl, cr2, cr0, 0
						mcr 15, 0, r0, cr8, cr7, 0	@ Flush I&D TLB
						mov r1, #0x71
						orr r1, r1, #4		@ r1 == 0x75
						ldr r0, .x5264		@ 0x00000000 is equal to 0x80000000 in first 0x1000 bytes
						cmp r0, #0			@ then is zeroed
						mcr 15, 0, r1, cr1, cr0, 0			@ jtag killer !! enables_mmu
						mov pc, r0
						nop
						mov	sp, #0x80000000
						add	sp, sp, #0x65000		@ sp is at 0x80065000
						b	sysinit_mmu

.x5250:	.word 0x30010000 	
.x5254:	.word 0x1ff00000 	
.x5258:	.word 0xfff00000 		
.x525c:	.word 0x3000040e 	
.x5260:	.word 0x30000402 	

.x5264:	.word 0x80022244 			 @ ? 00201000	

.x5274:	.word 0xf8545d88 	
.x5278:	.word 0x00000000 	
.x527c:	.word 0x00000002 	
.x5280:	.word 0x00000020 	
.x5284:	.word 0x0000214c 	
.x5288:	.word 0x0000154c 	
.x528c:	.word 0x00000000 	
.x5290:	.word 0x8006c680 	
.x5294:	.word 0x80022330 	
.x5298:	.word 0x80022368 	
        
.x52a4:	.word 0x00004033 	
.x52a8:	.word 0x00444101 	
.x52ac:	.word 0x09401050 	
.x52b0:	.word 0x00004005 	
.x52b4:	.word 0x00534c01 	
.x52b8:	.word 0x09401050 	
.x52bc:	.word 0x00002078 	
.x52c0:	.word 0x00534c01 	
.x52c4:	.word 0x802910ec 	
.x52c8:	.word 0x0000c0f0 	
.x52cc:	.word 0x00534b01 	
.x52d0:	.word 0x812910ec 	
.x52d4:	.word 0x00000000 	
.x52d8:	.word 0x00545204 	
.x52dc:	.word 0x813910ec 	
.x52e0:	.word 0x0000900b 	
.x52e4:	.word 0x00545204 	
.x52e8:	.word 0x813910ec 	
.x52ec:	.word 0x0000d0c9 	
.x52f0:	.word 0x00545204 	
.x52f4:	.word 0x813910ec 	
.x52f8:	.word 0x0000e04c 	
.x52fc:	.word 0x00545204 	
.x5300:	.word 0x13001186 	
.x5304:	.word 0x000050ba 	
.x5308:	.word 0x004c4404 	
.x530c:	.word 0x0020100b 	
.x5310:	.word 0x0000a0cc 	
.x5314:	.word 0x00474e05 	
.x5318:	.word 0x905010b7 	
.x531c:	.word 0x00006008 	
.x5320:	.word 0x00433306 	
.x5324:	.word 0x920010b7 	
.x5328:	.word 0x00000476 	
.x532c:	.word 0x00433306 	
.x5330:	.word 0x00560045 	
.x5334:	.word 0x004e0045 	
.x5338:	.word 0x005f0054 	
.x533c:	.word 0x0041004e 	
.x5340:	.word 0x0045004d 	
.x5344:	.word 0x0052005f 	
.x5348:	.word 0x0054004f 	
.x534c:	.word 0x00540041 	
.x5350:	.word 0x004f0049 	
.x5354:	.word 0x005f004e 	
.x5358:	.word 0x004f004e 	
.x535c:	.word 0x00490054 	
.x5360:	.word 0x00590046 	
.x5364:	.word 0x00000000 	
.x5368:	.word 0x004b0042 	
.x536c:	.word 0x0031004c 	
.x5370:	.word 0x0000003a 	
.x5374:	.word 0x5f434f54 	       @ string

/*
    5378:	64616552 	strbtvs	r6, [r1], #-1362
    537c:	52524520 	subspl	r4, r2, #134217728	; 0x8000000
    5380:	203a524f 	eorscs	r5, sl, pc, asr #4
    5384:	62616e55 	rsbvs	r6, r1, #1360	; 0x550
    5388:	7420656c 	strtvc	r6, [r0], #-1388
    538c:	6572206f 	ldrbvs	r2, [r2, #-111]!
    5390:	54206461 	strtpl	r6, [r0], #-1121
    5394:	0a0d434f 	beq	0x3560d8
    5398:	00000000 	andeq	r0, r0, r0
    539c:	5f434f54 	svcpl	0x00434f54
    53a0:	64616552 	strbtvs	r6, [r1], #-1362
    53a4:	00000a0d 	andeq	r0, r0, sp, lsl #20
    53a8:	00700055 	rsbseq	r0, r0, r5, asr r0
    53ac:	00610064 	rsbeq	r0, r1, r4, rrx
    53b0:	00650074 	rsbeq	r0, r5, r4, ror r0
    53b4:	004d0020 	subeq	r0, sp, r0, lsr #32
    53b8:	0064006f 	rsbeq	r0, r4, pc, rrx
    53bc:	00200065 	eoreq	r0, r0, r5, rrx
    53c0:	00410052 	subeq	r0, r1, r2, asr r0
    53c4:	0020004d 	eoreq	r0, r0, sp, asr #32
    53c8:	006c0066 	rsbeq	r0, ip, r6, rrx
    53cc:	00670061 	rsbeq	r0, r7, r1, rrx
    53d0:	00690020 	rsbeq	r0, r9, r0, lsr #32
    53d4:	00200073 	eoreq	r0, r0, r3, ror r0
    53d8:	00650073 	rsbeq	r0, r5, r3, ror r0
    53dc:	000d0074 	andeq	r0, sp, r4, ror r0
    53e0:	0000000a 	andeq	r0, r0, sl
    53e4:	00000000 	andeq	r0, r0, r0
    53e8:	006e0049 	rsbeq	r0, lr, r9, asr #32
    53ec:	00610076 	rsbeq	r0, r1, r6, ror r0
    53f0:	0069006c 	rsbeq	r0, r9, ip, rrx
    53f4:	00200064 	eoreq	r0, r0, r4, rrx
    53f8:	00530042 	subseq	r0, r3, r2, asr #32
    53fc:	00200050 	eoreq	r0, r0, r0, asr r0
    5400:	00720041 	rsbseq	r0, r2, r1, asr #32
    5404:	00730067 	rsbseq	r0, r3, r7, rrx
    5408:	002d0020 	eoreq	r0, sp, r0, lsr #32
    540c:	00690020 	rsbeq	r0, r9, r0, lsr #32
    5410:	0069006e 	rsbeq	r0, r9, lr, rrx
    5414:	00690074 	rsbeq	r0, r9, r4, ror r0
    5418:	006c0061 	rsbeq	r0, ip, r1, rrx
    541c:	007a0069 	rsbseq	r0, sl, r9, rrx
    5420:	006e0069 	rsbeq	r0, lr, r9, rrx
    5424:	00200067 	eoreq	r0, r0, r7, rrx
    5428:	006f0074 	rsbeq	r0, pc, r4, ror r0
    542c:	00670020 	rsbeq	r0, r7, r0, lsr #32
    5430:	006f006f 	rsbeq	r0, pc, pc, rrx
    5434:	00200064 	eoreq	r0, r0, r4, rrx
    5438:	00610076 	rsbeq	r0, r1, r6, ror r0
    543c:	0075006c 	rsbseq	r0, r5, ip, rrx
    5440:	00730065 	rsbseq	r0, r3, r5, rrx
    5444:	000a000d 	andeq	r0, sl, sp
    5448:	00000000 	andeq	r0, r0, r0
    544c:	6e756f63 	cdpvs	15, 7, cr6, cr5, cr3, {3}
    5450:	0d726574 	cfldr64eq	mvdx6, [r2, #-464]!
    5454:	0000000a 	andeq	r0, r0, sl
    5458:	45480a0d 	strbmi	r0, [r8, #-2573]
    545c:	455f4441 	ldrbmi	r4, [pc, #-1089]	; 0x5023
    5460:	524f5252 	subpl	r5, pc, #536870917	; 0x20000005
    5464:	00000a0d 	andeq	r0, r0, sp, lsl #20
    5468:	52570a0d 	subspl	r0, r7, #53248	; 0xd000
    546c:	544e495f 	strbpl	r4, [lr], #-2399
    5470:	5252455f 	subspl	r4, r2, #398458880	; 0x17c00000
    5474:	0a0d524f 	beq	0x359db8
    5478:	00000000 	andeq	r0, r0, r0
    547c:	43410a0d 	movtmi	r0, #6669	; 0x1a0d
    5480:	52455f4b 	subpl	r5, r5, #300	; 0x12c
    5484:	0d524f52 	ldcleq	15, cr4, [r2, #-328]
    5488:	0000000a 	andeq	r0, r0, sl
*/
.x548c:	.ascii "Sharp Pannel!!\n"
.align 4
.x54a0:	.ascii "Samsung Pannel!!\n"
.align 4
/*
    54b4:	43535742 	cmpmi	r3, #17301504	; 0x1080000
    54b8:	253d4e4f 	ldrcs	r4, [sp, #-3663]!
    54bc:	202c2078 	eorcs	r2, ip, r8, ror r0
    54c0:	4b4e4142 	blmi	0x13959d0
    54c4:	344e4f43 	strbcc	r4, [lr], #-3907
    54c8:	0d78253d 	cfldr64eq	mvdx2, [r8, #-244]!
    54cc:	0000000a 	andeq	r0, r0, sl
    54d0:	00000000 	andeq	r0, r0, r0
    54d4:	00004033 	andeq	r4, r0, r3, lsr r0
    54d8:	00444101 	subeq	r4, r4, r1, lsl #2
    54dc:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    54e0:	00004005 	andeq	r4, r0, r5
    54e4:	00534c01 	subseq	r4, r3, r1, lsl #24
    54e8:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    54ec:	00002078 	andeq	r2, r0, r8, ror r0
    54f0:	00534c01 	subseq	r4, r3, r1, lsl #24
    54f4:	802910ec 	eorhi	r1, r9, ip, ror #1
    54f8:	0000c0f0 	strdeq	ip, [r0], -r0
    54fc:	00534b01 	subseq	r4, r3, r1, lsl #22
    5500:	812910ec 	teqhi	r9, ip, ror #1
    5504:	00000000 	andeq	r0, r0, r0
    5508:	00545204 	subseq	r5, r4, r4, lsl #4
    550c:	813910ec 	teqhi	r9, ip, ror #1
    5510:	0000900b 	andeq	r9, r0, fp
    5514:	00545204 	subseq	r5, r4, r4, lsl #4
    5518:	813910ec 	teqhi	r9, ip, ror #1
    551c:	0000d0c9 	andeq	sp, r0, r9, asr #1
    5520:	00545204 	subseq	r5, r4, r4, lsl #4
    5524:	813910ec 	teqhi	r9, ip, ror #1
    5528:	0000e04c 	andeq	lr, r0, ip, asr #32
    552c:	00545204 	subseq	r5, r4, r4, lsl #4
    5530:	13001186 	movwne	r1, #390	; 0x186
    5534:	000050ba 	strheq	r5, [r0], -sl
    5538:	004c4404 	subeq	r4, ip, r4, lsl #8
    553c:	0020100b 	eoreq	r1, r0, fp
    5540:	0000a0cc 	andeq	sl, r0, ip, asr #1
    5544:	00474e05 	subeq	r4, r7, r5, lsl #28
    5548:	905010b7 	ldrhls	r1, [r0], #-7
    554c:	00006008 	andeq	r6, r0, r8
    5550:	00433306 	subeq	r3, r3, r6, lsl #6
    5554:	920010b7 	andls	r1, r0, #183	; 0xb7
    5558:	00000476 	andeq	r0, r0, r6, ror r4
    555c:	00433306 	subeq	r3, r3, r6, lsl #6
    5560:	00000000 	andeq	r0, r0, r0
    5564:	00004033 	andeq	r4, r0, r3, lsr r0
    5568:	00444101 	subeq	r4, r4, r1, lsl #2
    556c:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    5570:	00004005 	andeq	r4, r0, r5
    5574:	00534c01 	subseq	r4, r3, r1, lsl #24
    5578:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    557c:	00002078 	andeq	r2, r0, r8, ror r0
    5580:	00534c01 	subseq	r4, r3, r1, lsl #24
    5584:	802910ec 	eorhi	r1, r9, ip, ror #1
    5588:	0000c0f0 	strdeq	ip, [r0], -r0
    558c:	00534b01 	subseq	r4, r3, r1, lsl #22
    5590:	812910ec 	teqhi	r9, ip, ror #1
    5594:	00000000 	andeq	r0, r0, r0
    5598:	00545204 	subseq	r5, r4, r4, lsl #4
    559c:	813910ec 	teqhi	r9, ip, ror #1
    55a0:	0000900b 	andeq	r9, r0, fp
    55a4:	00545204 	subseq	r5, r4, r4, lsl #4
    55a8:	813910ec 	teqhi	r9, ip, ror #1
    55ac:	0000d0c9 	andeq	sp, r0, r9, asr #1
    55b0:	00545204 	subseq	r5, r4, r4, lsl #4
    55b4:	813910ec 	teqhi	r9, ip, ror #1
    55b8:	0000e04c 	andeq	lr, r0, ip, asr #32
    55bc:	00545204 	subseq	r5, r4, r4, lsl #4
    55c0:	13001186 	movwne	r1, #390	; 0x186
    55c4:	000050ba 	strheq	r5, [r0], -sl
    55c8:	004c4404 	subeq	r4, ip, r4, lsl #8
    55cc:	0020100b 	eoreq	r1, r0, fp
    55d0:	0000a0cc 	andeq	sl, r0, ip, asr #1
    55d4:	00474e05 	subeq	r4, r7, r5, lsl #28
    55d8:	905010b7 	ldrhls	r1, [r0], #-7
    55dc:	00006008 	andeq	r6, r0, r8
    55e0:	00433306 	subeq	r3, r3, r6, lsl #6
    55e4:	920010b7 	andls	r1, r0, #183	; 0xb7
    55e8:	00000476 	andeq	r0, r0, r6, ror r4
    55ec:	00433306 	subeq	r3, r3, r6, lsl #6
    55f0:	4b444d53 	blmi	0x1118b44
    55f4:	30343432 	eorscc	r3, r4, r2, lsr r4
	...
    5600:	000022b0 	strheq	r2, [r0], -r0
	...
    5628:	c0000000 	andgt	r0, r0, r0
    562c:	00000600 	andeq	r0, r0, r0, lsl #12
    5630:	c0000000 	andgt	r0, r0, r0
    5634:	0c000000 	stceq	0, cr0, [r0], {0}
	...
    5660:	07e0fc00 	strbeq	pc, [r0, r0, lsl #24]!
    5664:	00000000 	andeq	r0, r0, r0
    5668:	0000fc00 	andeq	pc, r0, r0, lsl #24
    566c:	e0000fc0 	and	r0, r0, r0, asr #31
	...
    5680:	c00003fc 	
    5684:	7f00001f 	
    5688:	7e000000 	
    568c:	0001f800 	
    5690:	00000000 	
    5694:	fc000000 	
    5698:	000007e0 	
    569c:	fc000000 	
    56a0:	0fc00000 	
    56a4:	0001f000 	
	...
    56b4:	0fff0000 	
    56b8:	00fff000 	
    56bc:	0003ffc0 	
    56c0:	f8007e00 	
    56c4:	00000001 	
    56c8:	00000000 	
    56cc:	07e0fc00 	
    56d0:	00000000 	
    56d4:	0000fc00 	
    56d8:	f0000fc0 	
    56dc:	00000001 	
	...
    56e8:	80000000 	
    56ec:	f8003fff 	
    56f0:	ffe001ff 	
    56f4:	7e000007 	
    56f8:	0001f800 	
    56fc:	00000000 	
    5700:	fc000000 	
    5704:	000007e0 	
    5708:	fc000000 	
    570c:	0fc00000 	
    5710:	0001f000 	
	...
    5720:	7fffc000 	
    5724:	03fffc00 	
    5728:	000ffff0 	
    572c:	f8007e00 	
    5730:	00000001 	
    5734:	00000000 	
    5738:	07e0fc00 	
    573c:	00000000 	
    5740:	0000fc00 	
    5744:	f8000fc0 	
    5748:	00000003 	
	...
    5754:	80000000 	
    5758:	fe007fff 	
    575c:	fff807ff 	
    5760:	7e00001f 	
    5764:	0001f800 	
    5768:	00000000 	
    576c:	fc000000 	
    5770:	000007e0 	
    5774:	fc000000 	
    5778:	0fc00000 	
    577c:	0003f800 	
	...
    578c:	ff070000 	
    5790:	07f07f00 	
    5794:	001fc1fc 	
    5798:	f8007e00 	
    579c:	00000001 	
    57a0:	00000000 	
    57a4:	07e0fc00 	
    57a8:	00000000 	
    57ac:	0000fc00 	
    57b0:	fc000fc0 	
    57b4:	00000007 	
	...
    57c4:	3f00fe02 	svccc	0x0000fe02
    57c8:	80fc0fe0 	rscshi	r0, ip, r0, ror #31
    57cc:	7e00003f 	mcrvc	0, 0, r0, cr0, cr15, {1}
    57d0:	0001f800 	andeq	pc, r1, r0, lsl #16
    57d4:	00000000 	andeq	r0, r0, r0
    57d8:	fc000000 	stc2	0, cr0, [r0], {0}
    57dc:	000007e0 	andeq	r0, r0, r0, ror #15
    57e0:	fc000000 	stc2	0, cr0, [r0], {0}
    57e4:	0fc00000 	svceq	0x00c00000
    57e8:	0007fc00 	andeq	pc, r7, r0, lsl #24
	...
    57f8:	fc000000 	stc2	0, cr0, [r0], {0}
    57fc:	0fc01f80 	svceq	0x00c01f80
    5800:	003f007e 	eorseq	r0, pc, lr, ror r0
    5804:	f8007e00 	undefined instruction 0xf8007e00
    5808:	00000001 	andeq	r0, r0, r1
    580c:	00000000 	andeq	r0, r0, r0
    5810:	07e0fc00 	strbeq	pc, [r0, r0, lsl #24]!
    5814:	00000000 	andeq	r0, r0, r0
    5818:	0000fc00 	andeq	pc, r0, r0, lsl #24
    581c:	fc000fc0 	stc2	15, cr0, [r0], {192}
    5820:	7f800007 	svcvc	0x00800007
    5824:	000fe000 	andeq	lr, pc, r0
    5828:	0000fc7e 	andeq	pc, r0, lr, ror ip
    582c:	0001fc3c 	andeq	pc, r1, ip, lsr ip
    5830:	1f80fc00 	svcne	0x0080fc00
    5834:	007e0fc0 	rsbseq	r0, lr, r0, asr #31
    5838:	7e00003f 	mcrvc	0, 0, r0, cr0, cr15, {1}
    583c:	fc01f800 	stc2	8, cr15, [r1], {0}
    5840:	7f0f000f 	svcvc	0x000f000f
    5844:	fdfc0000 	ldc2l	0, cr0, [ip]
    5848:	000fe7e0 	andeq	lr, pc, r0, ror #15
    584c:	fc001fc0 	stc2	15, cr1, [r0], {192}
    5850:	0fdfc000 	svceq	0x00dfc000
    5854:	000ffe00 	
    5858:	f801fff0 	
    585c:	ff7e007f 	
    5860:	ff7c0001 	
    5864:	fc000007 	
    5868:	0f801f80 	
    586c:	003e007e 	
    5870:	f8007e00 	
    5874:	003fff01 	
    5878:	0001ffdf 	
    587c:	f7e0ffff 	
    5880:	fff0003f 	
    5884:	f000fc00 	
    5888:	be000fff 	
    588c:	fffc000f 	
    5890:	00fffe03 	
    5894:	0000fffe 	
    5898:	001ffffc 	
    589c:	0fc0fe00 	
    58a0:	003f1f80 	
    58a4:	7e00007e 	
    58a8:	ff01f800 	
    58ac:	ffff00ff
    58b0:	ffffc007
    58b4:	00ffffe0
    58b8:	fc01fffc
    58bc:	0ffffc00
    58c0:	001fbf00
    58c4:	ff01fffe
    58c8:	fffe01ff
    58cc:	fffc0000
    58d0:	7f00001f
    58d4:	1f800fc0
    58d8:	007e003f
    58dc:	f8007e00
    58e0:	00fffe01
    58e4:	e007ffff
    58e8:	ffe0ffff 	
    58ec:	fffe00ff 	
    58f0:	fe00fc03 	
    58f4:	bf000fff 	
    58f8:	ffff001f 	
    58fc:	03ffff81 	
    5900:	00007ffe 	
    5904:	003ffffc 	
    5908:	0fc03ff0 	
    590c:	003f1f80 	
    5910:	7e00007e 	
    5914:	fe01f800 	
    5918:	ffff01ff 	
    591c:	fffff00f 	
    5920:	01ffffe0 	
    5924:	fc07ffff 	
    5928:	0fffff00 	
    592c:	001f1f00 	
    5930:	3f80e0ff 	
    5934:	43fe07f8 	
    5938:	83fc0000 	
    593c:	1ff0003f 	
    5940:	1f800fc0 	
    5944:	007e003f 	
    5948:	fffffe00 	
    594c:	01fc0601 	
    5950:	f00fe0ff 	
    5954:	1fe0fe0f 
    5958:	f07f01fc 
    595c:	ff00fc0f 
    5960:	1f800fe0 
    5964:	803f803f 
    5968:	07e01fc0 
    596c:	000001fe 
    5970:	007f01fc c
    5974:	0fc00ff0 
    5978:	003f1f80 
    597c:	fe00007e 
    5980:	0001ffff 
    5984:	c07f03f0 c
    5988:	fc03f81f 
    598c:	83f80fe0 
    5990:	fc0fc03f 
    5994:	0fc03f80 
    5998:	803e0f80 
    599c:	0fc0001f 
    59a0:	00fe0fe0 
    59a4:	00fc0000 
    59a8:	3ff0007e 
    59ac:	1f800fc0 
    59b0:	007e003f 
    59b4:	fffffe00 	undefined instruction 0xfffffe00
    59b8:	03f00001 	mvnseq	r0, #1	; 0x1
    59bc:	f81f803f 	undefined instruction 0xf81f803f
    59c0:	07e0fc01 	strbeq	pc, [r0, r1, lsl #24]!
    59c4:	c01f83f0 	ldrshgt	r8, [pc], -r0
    59c8:	1f80fc1f 	svcne	0x0080fc1f
    59cc:	0fc00fc0 	svceq	0x00c00fc0
    59d0:	001fc07e 	andseq	ip, pc, lr, ror r0
    59d4:	0fc007e0 	svceq	0x00c007e0
    59d8:	0000007e 	andeq	r0, r0, lr, ror r0
    59dc:	007e00fc 	ldrshteq	r0, [lr], #-12
    59e0:	0fc07ff0 	svceq	0x00c07ff0
    59e4:	003f1f80 	eorseq	r1, pc, r0, lsl #31
    59e8:	fe00007e 	mcr2	0, 0, r0, cr0, cr14, {3}
    59ec:	e001ffff 	strd	pc, [r1], -pc
    59f0:	803f03ff 	ldrshthi	r0, [pc], -pc
    59f4:	fc01fc1f 	stc2	12, cr15, [r1], {31}
    59f8:	c3f007e0 	mvnsgt	r0, #58720256	; 0x3800000
    59fc:	fc1f800f 	ldc2	0, cr8, [pc], {15}
    5a00:	0fc01fc0 	svceq	0x00c01fc0
    5a04:	c07e0fc0 	rsbsgt	r0, lr, r0, asr #31
    5a08:	07e0000f 	strbeq	r0, [r0, pc]!
    5a0c:	007e0fc0 	rsbseq	r0, lr, r0, asr #31
    5a10:	00fc0000 	rscseq	r0, ip, r0
    5a14:	ff00007e 	undefined instruction 0xff00007e
    5a18:	1f800fc0 	svcne	0x00800fc0
    5a1c:	007e003f 	rsbseq	r0, lr, pc, lsr r0
    5a20:	fffffe00 	undefined instruction 0xfffffe00
    5a24:	03fffc01 	mvnseq	pc, #256	; 0x100
    5a28:	fc1f803f 	ldc2	0, cr8, [pc], {63}
    5a2c:	07e0fc00 	strbeq	pc, [r0, r0, lsl #24]!
    5a30:	800fc3f0 	strdhi	ip, [pc], -r0
    5a34:	0fc0fc1f 	svceq	0x00c0fc1f
    5a38:	07e00fc0 	strbeq	r0, [r0, r0, asr #31]!
    5a3c:	000fc0fc 	strdeq	ip, [pc], -ip
    5a40:	0fffffe0 	svceq	0x00ffffe0
    5a44:	0000007e 	andeq	r0, r0, lr, ror r0
    5a48:	007e00fc 	ldrshteq	r0, [lr], #-12
    5a4c:	0fc0fe00 	svceq	0x00c0fe00
    5a50:	003f1f80 	eorseq	r1, pc, r0, lsl #31
    5a54:	7e00007e 	mcrvc	0, 0, r0, cr0, cr14, {3}
    5a58:	fe01f800 	cdp2	8, 0, cr15, cr1, cr0, {0}
    5a5c:	803f03ff 	ldrshthi	r0, [pc], -pc
    5a60:	fc00fc1f 	stc2	12, cr15, [r0], {31}
    5a64:	c3f007e0 	mvnsgt	r0, #58720256	; 0x3800000
    5a68:	fc1fffff 	ldc2	15, cr15, [pc], {255}
    5a6c:	0fc00fc0 	svceq	0x00c00fc0
    5a70:	c0fc07e0 	rscsgt	r0, ip, r0, ror #15
    5a74:	ffe0000f 	undefined instruction 0xffe0000f
    5a78:	007e0fff 	ldrshteq	r0, [lr], #-255
    5a7c:	00fc0000 	rscseq	r0, ip, r0
    5a80:	fc00007e 	stc2	0, cr0, [r0], {126}
    5a84:	1f800fc1 	svcne	0x00800fc1
    5a88:	007e003f 	rsbseq	r0, lr, pc, lsr r0
    5a8c:	f8007e00 	undefined instruction 0xf8007e00
    5a90:	03ffff01 	mvnseq	pc, #4	; 0x4
    5a94:	fc1f803f 	ldc2	0, cr8, [pc], {63}
    5a98:	07e0fc00 	strbeq	pc, [r0, r0, lsl #24]!
    5a9c:	ffffc3f0 	undefined instruction 0xffffc3f0
    5aa0:	0fc0fc1f 	svceq	0x00c0fc1f
    5aa4:	03e00fc0 	mvneq	r0, #768	; 0x300
    5aa8:	000fc0fc 	strdeq	ip, [pc], -ip
    5aac:	0fffffe0 	svceq	0x00ffffe0
    5ab0:	0000007e 	andeq	r0, r0, lr, ror r0
    5ab4:	007e00fc 	ldrshteq	r0, [lr], #-12
    5ab8:	0fc1f800 	svceq	0x00c1f800
    5abc:	003f1f80 	eorseq	r1, pc, r0, lsl #31
    5ac0:	7e00007e 	mcrvc	0, 0, r0, cr0, cr14, {3}
    5ac4:	ff81f800 	undefined instruction 0xff81f800
    5ac8:	803f03ff 	ldrshthi	r0, [pc], -pc
    5acc:	fc00fc1f 	stc2	12, cr15, [r0], {31}
    5ad0:	c3f007e0 	mvnsgt	r0, #58720256	; 0x3800000
    5ad4:	fc1fffff 	ldc2	15, cr15, [pc], {255}
    5ad8:	0fc00fc0 	svceq	0x00c00fc0
    5adc:	c1fffff0 	ldrshgt	pc, [pc, #240]	; 0x5bd4
    5ae0:	ffe0000f 	undefined instruction 0xffe0000f
    5ae4:	007e0fff 	ldrshteq	r0, [lr], #-255
    5ae8:	00fc0000 	rscseq	r0, ip, r0
    5aec:	f800007e 	undefined instruction 0xf800007e
    5af0:	0f800fc1 	svceq	0x00800fc1
    5af4:	003e003f 	eorseq	r0, lr, pc, lsr r0
    5af8:	f8007e00 	undefined instruction 0xf8007e00
    5afc:	03f03f81 	mvnseq	r3, #516	; 0x204
    5b00:	fc1f803f 	ldc2	0, cr8, [pc], {63}
    5b04:	07e0fc00 	strbeq	pc, [r0, r0, lsl #24]!
    5b08:	ffffc3f0 	undefined instruction 0xffffc3f0
    5b0c:	0fc0fc1f 	svceq	0x00c0fc1f
    5b10:	fff00fc0 	undefined instruction 0xfff00fc0
    5b14:	000fc1ff 	strdeq	ip, [pc], -pc
    5b18:	000007e0 	andeq	r0, r0, r0, ror #15
    5b1c:	0000007e 	andeq	r0, r0, lr, ror r0
    5b20:	007e00fc 	ldrshteq	r0, [lr], #-12
    5b24:	1f81f800 	svcne	0x0081f800
    5b28:	007e0fc0 	rsbseq	r0, lr, r0, asr #31
    5b2c:	7e00003f 	mcrvc	0, 0, r0, cr0, cr15, {1}
    5b30:	1fc1f800 	svcne	0x00c1f800
    5b34:	803f03f0 	ldrshthi	r0, [pc], -r0
    5b38:	fc00fc1f 	stc2	12, cr15, [r0], {31}
    5b3c:	c3f007e0 	mvnsgt	r0, #58720256	; 0x3800000
    5b40:	fc00000f 	stc2	0, cr0, [r0], {15}
    5b44:	0fc00fc0 	svceq	0x00c00fc0
    5b48:	c3fffff8 	mvnsgt	pc, #992	; 0x3e0
    5b4c:	07e0001f 	undefined
    5b50:	007e0000 	rsbseq	r0, lr, r0
    5b54:	00fc0000 	rscseq	r0, ip, r0
    5b58:	f800007e 	undefined instruction 0xf800007e
    5b5c:	0fc01f81 	svceq	0x00c01f81
    5b60:	003f007e 	eorseq	r0, pc, lr, ror r0
    5b64:	f8007e00 	undefined instruction 0xf8007e00
    5b68:	03f00fc1 	mvnseq	r0, #772	; 0x304
    5b6c:	fc1f803f 	ldc2	0, cr8, [pc], {63}
    5b70:	07e0fc01 	strbeq	pc, [r0, r1, lsl #24]!
    5b74:	000fc3f0 	strdeq	ip, [pc], -r0
    5b78:	1fc0fc00 	svcne	0x00c0fc00
    5b7c:	fff80fc0 	undefined instruction 0xfff80fc0
    5b80:	001f83ff 	ldrsheq	r8, [pc], -pc
    5b84:	00000fc0 	andeq	r0, r0, r0, asr #31
    5b88:	0000007e 	andeq	r0, r0, lr, ror r0
    5b8c:	007e00fc 	ldrshteq	r0, [lr], #-12
    5b90:	1f81f800 	svcne	0x0081f800
    5b94:	007e0fc0 	rsbseq	r0, lr, r0, asr #31
    5b98:	7e00003f 	mcrvc	0, 0, r0, cr0, cr15, {1}
    5b9c:	0fc1f800 	svceq	0x00c1f800
    5ba0:	803f03f0 	ldrshthi	r0, [pc], -r0
    5ba4:	fc01fc1f 	stc2	12, cr15, [r1], {31}
    5ba8:	83f007e0 	mvnshi	r0, #58720256	; 0x3800000
    5bac:	fc00001f 	stc2	0, cr0, [r0], {31}
    5bb0:	0fc01fc0 	svceq	0x00c01fc0
    5bb4:	83fffff8 	mvnshi	pc, #992	; 0x3e0
    5bb8:	1fc0803f 	svcne	0x00c0803f
    5bbc:	007e0040 	rsbseq	r0, lr, r0, asr #32
    5bc0:	00fc0000 	rscseq	r0, ip, r0
    5bc4:	fc01007e 	stc2	0, cr0, [r1], {126}
    5bc8:	07e03f01 	strbeq	r3, [r0, r1, lsl #30]!
    5bcc:	001f80fc 	ldrsheq	r8, [pc], -ip
    5bd0:	f8007e00 	undefined instruction 0xf8007e00
    5bd4:	03f80fc1 	mvnseq	r0, #772	; 0x304
    5bd8:	f81f803f 	undefined instruction 0xf81f803f
    5bdc:	07e0fc03 	strbeq	pc, [r0, r3, lsl #24]!
    5be0:	803f83f0 	ldrshthi	r8, [pc], -r0
    5be4:	3f80fc00 	svccc	0x0080fc00
    5be8:	00fc0fc0 	rscseq	r0, ip, r0, asr #31
    5bec:	c0ff87e0 	rscsgt	r8, pc, r0, ror #15
    5bf0:	00e03fc1 	rsceq	r3, r0, r1, asr #31
    5bf4:	0000007e 	andeq	r0, r0, lr, ror r0
    5bf8:	807e00fc 	ldrshthi	r0, [lr], #-12
    5bfc:	7f00ff07 	svcvc	0x0000ff07
    5c00:	c1fc07f0 	ldrshgt	r0, [ip, #112]!
    5c04:	7e00001f 	mcrvc	0, 0, r0, cr0, cr15, {0}
    5c08:	1fc1f800 	svcne	0x00c1f800
    5c0c:	803f03fc 	ldrshthi	r0, [pc], -ip
    5c10:	fe0ff81f 	mcr2	8, 0, pc, cr15, cr15, {0}
    5c14:	83f007e0 	mvnshi	r0, #58720256	; 0x3800000
    5c18:	fc01c07f 	stc2	0, cr12, [r1], {127}
    5c1c:	0fe0ff80 	svceq	0x00e0ff80
    5c20:	07e000fc 	
    5c24:	ff81ffff 	
    5c28:	007e00ff 	
    5c2c:	00fc0000 	
    5c30:	ffffc07e 	
    5c34:	03fffe00 	
    5c38:	000ffff8 	
    5c3c:	f8007e00 	
    5c40:	03ffffc1 	
    5c44:	f01f803f 	
    5c48:	07e0ffff 	
    5c4c:	ffff03f0 	
    5c50:	ff00fc01 	
    5c54:	007e0fff 	
    5c58:	fffe0fe0 	
    5c5c:	00ffff01 	
    5c60:	0000007e 	
    5c64:	e07e00fc 	
    5c68:	fe007fff 	
    5c6c:	fff801ff 	
    5c70:	7e000007 	
    5c74:	ff81f800 	
    5c78:	803f07ff 	
    5c7c:	fffff01f 	
    5c80:	03f007e0 	
    5c84:	fc01fffe 	
    5c88:	0fffff00 	
    5c8c:	0fc0007e 	
    5c90:	fe03fffc 	
    5c94:	007e01ff 	
    5c98:	00fc0000 	
    5c9c:	3fffc07e 	
    5ca0:	00fffc00 	
    5ca4:	0003fff0 	
    5ca8:	f8007e00 	
    5cac:	07ffff01 	
    5cb0:	e01f803f 	
    5cb4:	07e0ffff 	
    5cb8:	fffc03f0 	
    5cbc:	fe01fc03 	
    5cc0:	007e0fff 	
    5cc4:	fff80fc0 	
    5cc8:	00fffc01 	
    5ccc:	0000007e 	
    5cd0:	807e00fc 	
    5cd4:	f8000fff 	
    5cd8:	ffe0007f 	
    5cdc:	7e000001 	
    5ce0:	fe01f800 	
    5ce4:	803f0fcf 	
    5ce8:	ffff801f 	
    5cec:	03f007e0 	
    5cf0:	f801fff8 	
    5cf4:	0ffff803 	
    5cf8:	1f80003f 	
    5cfc:	e0007fc0 	
    5d00:	007e001f 	
    5d04:	00fc0000 	
    5d08:	03fc007e 	
    5d0c:	001fc000 	
    5d10:	00007f00 	
    5d14:	f8007e00 	
    5d18:	0783f801 	
    5d1c:	001f803f 	
    5d20:	07e0fcfe 	
    5d24:	3fc003f0 	
    5d28:	e001f000 	
    5d2c:	00000fcf 	
    5d30:	004e0049 	
    5d34:	004f0046 	
    5d38:	0020003a 	
    5d3c:	0075004a 	
    5d40:	0070006d 	
    5d44:	006e0069 	
    5d48:	00200067 	
    5d4c:	006f0074 	
    5d50:	00690020 	
    5d54:	0061006d 	
    5d58:	00650067 	
    5d5c:	002e002e 	
    5d60:	000d002e 	
    5d64:	0000000a 	
    5d68:	00000000 	
    5d6c:	004e0049 	
    5d70:	004f0046 	
    5d74:	0020003a 	
    5d78:	006f004c 	
    5d7c:	00640061 	
    5d80:	006e0069 	
    5d84:	00200067 	
    5d88:	006d0069 	
    5d8c:	00670061 	
    5d90:	00200065 	
    5d94:	002e002e 	
    5d98:	000d002e 	
    5d9c:	0000000a 	
	...
    5da8:	00520045 	
    5dac:	004f0052 	
    5db0:	003a0052 	
    5db4:	00460020 	
    5db8:	00690061 	
    5dbc:	0065006c 	
    5dc0:	00200064 	
    5dc4:	006f0074 	
    5dc8:	006a0020 	
    5dcc:	006d0075 	
    5dd0:	00200070 	
    5dd4:	006f0074 	
    5dd8:	006c0020 	
    5ddc:	0061006f 	
    5de0:	00650064 	
    5de4:	00200064 	
    5de8:	006d0069 	
    5dec:	00670061 	
    5df0:	002e0065 	
    5df4:	00000000 	
    5df8:	00520045 	
    5dfc:	004f0052 	
    5e00:	003a0052 	
    5e04:	00460020 	
    5e08:	00690061 	
    5e0c:	0065006c 	
    5e10:	00200064 	
    5e14:	006f0074 	
    5e18:	00720020 	
    5e1c:	00610065 	
    5e20:	00200064 	
    5e24:	006d0069 	
    5e28:	00670061 	
    5e2c:	00200065 	
    5e30:	00610064 	
    5e34:	00610074 	
    5e38:	00660020 	
    5e3c:	006f0072 	
    5e40:	0020006d 	
    5e44:	00740073 	
    5e48:	0072006f 	
    5e4c:	00670061 	
    5e50:	00200065 	
    5e54:	00610070 	
    5e58:	00740072 	
    5e5c:	00740069 	
    5e60:	006f0069 	
    5e64:	002e006e 	
	...
    5e70:	00520045 	
    5e74:	004f0052 	
    5e78:	003a0052 	
    5e7c:	00460020 	
    5e80:	00690061 	
    5e84:	0065006c 	
    5e88:	00200064 	
    5e8c:	006f0074 	
    5e90:	00740020 	
    5e94:	00610072 	
    5e98:	0073006e 	
    5e9c:	0061006c 	
    5ea0:	00650074 	
    5ea4:	00690020 	
    5ea8:	0061006d 	
    5eac:	00650067 	
    5eb0:	00610020 	
    5eb4:	00640064 	
    5eb8:	00650072 	
    5ebc:	00730073 	
    5ec0:	0000002e 	
    5ec4:	00000000 	
    5ec8:	00520045 	
    5ecc:	004f0052 	
    5ed0:	003a0052 	
    5ed4:	00460020 	
    5ed8:	00690061 	
    5edc:	0065006c 	
    5ee0:	00200064 	
    5ee4:	006f0074 	
    5ee8:	00720020 	
    5eec:	00740065 	
    5ef0:	00690072 	
    5ef4:	00760065 	
    5ef8:	00200065 	
    5efc:	00740073 	
    5f00:	0072006f 	
    5f04:	00640065 	
    5f08:	00690020 	
    5f0c:	0061006d 	
    5f10:	00650067 	
    5f14:	00690020 	
    5f18:	0066006e 	
    5f1c:	0072006f 	
    5f20:	0061006d 	
    5f24:	00690074 	
    5f28:	006e006f 	
    5f2c:	0000002e 	
	...
    5f38:	00520045 	
    5f3c:	004f0052 	
    5f40:	003a0052 	
    5f44:	00460020 	
    5f48:	00690061 	
    5f4c:	0065006c 	
    5f50:	00200064 	
    5f54:	006f0074 	
    5f58:	00670020 	
    5f5c:	00740065 	
    5f60:	00730020 	
    5f64:	006f0074 	
    5f68:	00610072 	
    5f6c:	00650067 	
    5f70:	00740020 	
    5f74:	00700079 	
    5f78:	00200065 	
    5f7c:	006e0069 	
    5f80:	006f0066 	
    5f84:	006d0072 	
    5f88:	00740061 	
    5f8c:	006f0069 	
    5f90:	002e006e 	
    5f94:	00000000 	
    5f98:	00520045 	
    5f9c:	004f0052 	
    5fa0:	003a0052 	
    5fa4:	00460020 	
    5fa8:	00690061 	
    5fac:	0065006c 	
    5fb0:	00200064 	
    5fb4:	006f0074 	
    5fb8:	006f0020 	
    5fbc:	00650070 	
    5fc0:	0020006e 	
    5fc4:	00740073 	
    5fc8:	0072006f 	
    5fcc:	00670061 	
    5fd0:	00200065 	
    5fd4:	00610070 	
    5fd8:	00740072 	
    5fdc:	00740069 	
    5fe0:	006f0069 	
    5fe4:	002e006e 	
	...
    5ff0:	00520045 	
    5ff4:	004f0052 	
    5ff8:	003a0052 	
    5ffc:	00460020 	
    6000:	00690061 	
    6004:	0065006c 	rsbeq	r0, r5, ip, rrx
    6008:	00200064 	eoreq	r0, r0, r4, rrx
    600c:	006f0074 	rsbeq	r0, pc, r4, ror r0
    6010:	00690020 	rsbeq	r0, r9, r0, lsr #32
    6014:	0069006e 	rsbeq	r0, r9, lr, rrx
    6018:	00690074 	rsbeq	r0, r9, r4, ror r0
    601c:	006c0061 	rsbeq	r0, ip, r1, rrx
    6020:	007a0069 	rsbseq	r0, sl, r9, rrx
    6024:	00200065 	eoreq	r0, r0, r5, rrx
    6028:	006f0062 	rsbeq	r0, pc, r2, rrx
    602c:	0074006f 	rsbseq	r0, r4, pc, rrx
    6030:	00610070 	rsbeq	r0, r1, r0, ror r0
    6034:	00740072 	rsbseq	r0, r4, r2, ror r0
    6038:	006c0020 	rsbeq	r0, ip, r0, lsr #32
    603c:	00620069 	rsbeq	r0, r2, r9, rrx
    6040:	00610072 	rsbeq	r0, r1, r2, ror r0
    6044:	00790072 	rsbseq	r0, r9, r2, ror r0
    6048:	0000002e 	andeq	r0, r0, lr, lsr #32
    604c:	00000000 	andeq	r0, r0, r0
    6050:	00520045 	subseq	r0, r2, r5, asr #32
    6054:	004f0052 	subeq	r0, pc, r2, asr r0
    6058:	003a0052 	eorseq	r0, sl, r2, asr r0
    605c:	00550020 	subseq	r0, r5, r0, lsr #32
    6060:	0061006e 	rsbeq	r0, r1, lr, rrx
    6064:	006c0062 	rsbeq	r0, ip, r2, rrx
    6068:	00200065 	eoreq	r0, r0, r5, rrx
    606c:	006f0074 	rsbeq	r0, pc, r4, ror r0
    6070:	00660020 	rsbeq	r0, r6, r0, lsr #32
    6074:	006e0069 	rsbeq	r0, lr, r9, rrx
    6078:	00200064 	eoreq	r0, r0, r4, rrx
    607c:	00500049 	subseq	r0, r0, r9, asr #32
    6080:	0020004c 	eoreq	r0, r0, ip, asr #32
    6084:	00610074 	rsbeq	r0, r1, r4, ror r0
    6088:	006c0062 	rsbeq	r0, ip, r2, rrx
    608c:	00200065 	eoreq	r0, r0, r5, rrx
    6090:	0066006f 	rsbeq	r0, r6, pc, rrx
    6094:	00630020 	rsbeq	r0, r3, r0, lsr #32
    6098:	006e006f 	rsbeq	r0, lr, pc, rrx
    609c:	00650074 	rsbeq	r0, r5, r4, ror r0
    60a0:	0074006e 	rsbseq	r0, r4, lr, rrx
    60a4:	002e0073 	eoreq	r0, lr, r3, ror r0
    60a8:	00000000 	andeq	r0, r0, r0
    60ac:	8002c9d0 	ldrdhi	ip, [r2], -r0
    60b0:	00000000 	andeq	r0, r0, r0
    60b4:	00004033 	andeq	r4, r0, r3, lsr r0
    60b8:	00444101 	subeq	r4, r4, r1, lsl #2
    60bc:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    60c0:	00004005 	andeq	r4, r0, r5
    60c4:	00534c01 	subseq	r4, r3, r1, lsl #24
    60c8:	09401050 	stmdbeq	r0, {r4, r6, ip}^
    60cc:	00002078 	andeq	r2, r0, r8, ror r0
    60d0:	00534c01 	subseq	r4, r3, r1, lsl #24
    60d4:	802910ec 	eorhi	r1, r9, ip, ror #1
    60d8:	0000c0f0 	strdeq	ip, [r0], -r0
    60dc:	00534b01 	subseq	r4, r3, r1, lsl #22
    60e0:	812910ec 	teqhi	r9, ip, ror #1
    60e4:	00000000 	andeq	r0, r0, r0
    60e8:	00545204 	subseq	r5, r4, r4, lsl #4
    60ec:	813910ec 	teqhi	r9, ip, ror #1
    60f0:	0000900b 	andeq	r9, r0, fp
    60f4:	00545204 	subseq	r5, r4, r4, lsl #4
    60f8:	813910ec 	teqhi	r9, ip, ror #1
    60fc:	0000d0c9 	andeq	sp, r0, r9, asr #1
    6100:	00545204 	subseq	r5, r4, r4, lsl #4
    6104:	813910ec 	teqhi	r9, ip, ror #1
    6108:	0000e04c 	andeq	lr, r0, ip, asr #32
    610c:	00545204 	subseq	r5, r4, r4, lsl #4
    6110:	13001186 	movwne	r1, #390	; 0x186
    6114:	000050ba 	strheq	r5, [r0], -sl
    6118:	004c4404 	subeq	r4, ip, r4, lsl #8
    611c:	0020100b 	eoreq	r1, r0, fp
    6120:	0000a0cc 	andeq	sl, r0, ip, asr #1
    6124:	00474e05 	subeq	r4, r7, r5, lsl #28
    6128:	905010b7 	ldrhls	r1, [r0], #-7
    612c:	00006008 	andeq	r6, r0, r8
    6130:	00433306 	subeq	r3, r3, r6, lsl #6
    6134:	920010b7 	andls	r1, r0, #183	; 0xb7
    6138:	00000476 	andeq	r0, r0, r6, ror r4
    613c:	00433306 	subeq	r3, r3, r6, lsl #6
    6140:	4c46534d 	mcrrmi	3, 4, r5, r6, cr13
    6144:	30354853 	eorscc	r4, r5, r3, asr r8
    6148:	00000000 	andeq	r0, r0, r0
    614c:	53445352 	movtpl	r5, #17234	; 0x4352
    6150:	f8545d88 	undefined instruction 0xf8545d88
    6154:	6a99c6ad 	bvs	0xfe677c10
    6158:	0d5eff51 	ldcleq	15, cr15, [lr, #-324]
    615c:	f883d160 	undefined instruction 0xf883d160
    6160:	00000001 	andeq	r0, r0, r1
    6164:	2e4c5049 	cdpcs	0, 4, cr5, cr12, cr9, {2}
    6168:	00626470 	rsbeq	r6, r2, r0, ror r4
*/

coprocessor_01:			ldr	r2, .x619c
						mov	r3, #0x50000000
						sub	r2, r2, r3
						mov	r1, #0x70
						mcr	15, 0, r1, cr1, cr0, 0
						nop			
						mov	pc, r2
						nop			
						mov	r2, #0	
						mcr	15, 0, r2, cr8, cr7, 0
						mov	pc, r0
						bx	lr

.x619c:			.word 	0x8002318c 	

b61a0:				 	push	{lr}		@ (str lr, [sp, #-4]!)
						mov	r0, r1
						bl	b79c0
						pop	{lr}		@ (ldr lr, [sp], #4)
						bx	lr

b61b4:	 				push	{r4, lr}
						ldr	r3, .x623c
						ldr	r1, .x6238
						mov	r2, #0xa0000000
						ldr	r0, .x6234
						orr	r2, r2, #0x20000
						ldr	lr, .x6230
						mov	r4, #1
						str	r3, [r2]
						ldr	r3, .x622c
						strh	r4, [r1]
						strh	r4, [r0]
						mov	r0, #0
						ldr	r2, .x6228
						ldr	r1, .x6224
						str	r0, [lr]
						str	r0, [r3]
						ldr	r3, .x6220
						str	r0, [r2]
						ldr	r2, .x621c
						str	r0, [r1]
						strh	r4, [r3]
						mov	r3, #24			@ 0x18
						strh	r3, [r2]
						pop	{r4, lr}
						bx	lr
.x621c:	.word 	0xa002011a 	
.x6220:	.word 	0xa0020118 	
.x6224:	.word 	0xa0020050 	
.x6228:	.word 	0xa002004c 	
.x622c:	.word 	0xa0020048 	
.x6230:	.word 	0xa0020044 	
.x6234:	.word 	0xa0020006 	
.x6238:	.word 	0xa0020004 	
.x623c:	.word 	0x53475241 	
     

b6240:	 				push	{lr}		@ (str lr, [sp, #-4]!)
						mov	lr, #0xa0000000
						ldr	r0, .x629c
						orr	lr, lr, #0x20000
						mov	r1, #0
						add	r3, r0, r1
						ldrb	r2, [r3, #32]
						add	r3, r1, lr
						add	r1, r1, #1
						strb	r2, [r3, #88]
						cmp	r1, #6
 /*
    626c:	bafffff8 	blt	0x6254
    6270:	e3a01000 	mov	r1, #0	; 0x0
    6274:	e0803001 	add	r3, r0, r1
    6278:	e5d32026 	ldrb	r2, [r3, #38]
    627c:	e081300e 	add	r3, r1, lr
    6280:	e2811001 	add	r1, r1, #1	; 0x1
    6284:	e5c3205e 	strb	r2, [r3, #94]
    6288:	e3510010 	cmp	r1, #16	; 0x10
    628c:	bafffff8 	blt	0x6274
    6290:	e3a00001 	mov	r0, #1	; 0x1
*/
						pop	{lr}		@ (ldr lr, [sp], #4)
						bx	lr
.x629c:	.word 0x8006c680 	
/*    
	b62a0:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    62a4:	e3a0420a 	mov	r4, #0xa0000000
    62a8:	e59f70e4 	ldr	r7, .x6394
    62ac:	e3844802 	orr	r4, r4, #131072	; 0x20000
    62b0:	e3a0e000 	mov	lr, #0	; 0x0
    62b4:	e08e0007 	add	r0, lr, r7
    62b8:	e5902040 	ldr	r2, [r0, #64]
    62bc:	e08e3004 	add	r3, lr, r4
    62c0:	e08e1004 	add	r1, lr, r4
    62c4:	e5832074 	str	r2, [r3, #116]
    62c8:	e5903064 	ldr	r3, [r0, #100]
    62cc:	e08e2004 	add	r2, lr, r4
    62d0:	e28ee004 	add	lr, lr, #4	; 0x4
    62d4:	e5813098 	str	r3, [r1, #152]
    62d8:	e5903088 	ldr	r3, [r0, #136]
    62dc:	e35e0024 	cmp	lr, #36	; 0x24
    62e0:	e58230bc 	str	r3, [r2, #188]
    62e4:	bafffff2 	blt	0x62b4
    62e8:	e59720ac 	ldr	r2, [r7, #172]
    62ec:	e59f309c 	ldr	r3, [pc, #156]	; 0x6390
    62f0:	e59f1094 	ldr	r1, [pc, #148]	; 0x638c
    62f4:	e59f008c 	ldr	r0, [pc, #140]	; 0x6388
    62f8:	e5832000 	str	r2, [r3]
    62fc:	e59730b0 	ldr	r3, [r7, #176]
    6300:	e59f207c 	ldr	r2, [pc, #124]	; 0x6384
    6304:	e59fe074 	ldr	lr, [pc, #116]	; 0x6380
    6308:	e5813000 	str	r3, [r1]
    630c:	e59730b4 	ldr	r3, [r7, #180]
    6310:	e59f1064 	ldr	r1, [pc, #100]	; 0x637c
    6314:	e59f505c 	ldr	r5, [pc, #92]	; 0x6378
    6318:	e5803000 	str	r3, [r0]
    631c:	e59730b8 	ldr	r3, [r7, #184]
    6320:	e59f404c 	ldr	r4, [pc, #76]	; 0x6374
    6324:	e59f6044 	ldr	r6, [pc, #68]	; 0x6370
    6328:	e5823000 	str	r3, [r2]
    632c:	e59730bc 	ldr	r3, [r7, #188]
    6330:	e59f2034 	ldr	r2, [pc, #52]	; 0x636c
    6334:	e3a00001 	mov	r0, #1	; 0x1
    6338:	e58e3000 	str	r3, [lr]
    633c:	e59730c0 	ldr	r3, [r7, #192]
    6340:	e5813000 	str	r3, [r1]
    6344:	e59730c4 	ldr	r3, [r7, #196]
    6348:	e5853000 	str	r3, [r5]
    634c:	e59730c8 	ldr	r3, [r7, #200]
    6350:	e5843000 	str	r3, [r4]
    6354:	e59730cc 	ldr	r3, [r7, #204]
    6358:	e5863000 	str	r3, [r6]
    635c:	e597303c 	ldr	r3, [r7, #60]
    6360:	e5823000 	str	r3, [r2]
    6364:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    6368:	e12fff1e 	bx	lr
    636c:	a0020070 	andge	r0, r2, r0, ror r0
    6370:	a0020100 	andge	r0, r2, r0, lsl #2
    6374:	a00200fc 	strdge	r0, [r2], -ip
    6378:	a00200f8 	strdge	r0, [r2], -r8
    637c:	a00200f4 	strdge	r0, [r2], -r4
    6380:	a00200f0 	strdge	r0, [r2], -r0
    6384:	a00200ec 	andge	r0, r2, ip, ror #1
    6388:	a00200e8 	andge	r0, r2, r8, ror #1
    638c:	a00200e4 	andge	r0, r2, r4, ror #1
    6390:	a00200e0 	andge	r0, r2, r0, ror #1
    6394:	8006c680 	andhi	ip, r6, r0, lsl #13
*/
b6398:				 	push	{r4, lr}
/*
    639c:	e24dd018 	sub	sp, sp, #24	; 0x18
    63a0:	e28d0008 	add	r0, sp, #8	; 0x8
    63a4:	eb000f26 	bl	0xa044
    63a8:	e3500000 	cmp	r0, #0	; 0x0
    63ac:	0a00000b 	beq	0x63e0
    63b0:	e59f0058 	ldr	r0, [pc, #88]	; 0x6410
    63b4:	eb000830 	bl	b847c
    63b8:	e59f404c 	ldr	r4, [pc, #76]	; 0x640c
    63bc:	e1dd01b4 	ldrh	r0, [sp, #20]
    63c0:	e3a03001 	mov	r3, #1	; 0x1
    63c4:	e1a01004 	mov	r1, r4
    63c8:	e28d2000 	add	r2, sp, #0	; 0x0
    63cc:	eb001655 	bl	bbd28
    63d0:	e3500000 	cmp	r0, #0	; 0x0
    63d4:	1a000003 	bne	0x63e8
    63d8:	e59f0028 	ldr	r0, [pc, #40]	; 0x6408
    63dc:	eb000826 	bl	b847c
    63e0:	e3a00000 	mov	r0, #0	; 0x0
    63e4:	ea000003 	b	0x63f8
    63e8:	e5942038 	ldr	r2, [r4, #56]
    63ec:	e59f3010 	ldr	r3, [pc, #16]	; 0x6404
    63f0:	e3a00001 	mov	r0, #1	; 0x1
    63f4:	e5832000 	str	r2, [r3]
    63f8:	e28dd018 	add	sp, sp, #24	; 0x18
    63fc:	e8bd4010 	pop	{r4, lr}
    6400:	e12fff1e 	bx	lr
*/
.x6404:			.word 0xa0020054 
.x6408:			.word 0x80022374 
.x640c:			.word 0x8006c680 
.x6410:			.word 0x8002239c 

b6414:	 				push	{lr}		@ (str lr, [sp, #-4]!)
						sub	sp, sp, #4	
						ldr	r3, .x64e4
						mov	r2, #0	
						str	r2, [sp]
						ldr	r3, [r3]
						ldr	r3, [r3, #100]
						tst	r3, #8
						bne	b648c
						mov	r3, #1
						str	r3, [sp]
						ldr	r3, .x64e0

						mov	r2, #0xa0000000
						ldr	r1, .x64dc
						orr	r2, r2, #0x20000
						ldr	r0, .x64d8
						str	r3, [r2]
						mov	r3, #1	
						strh	r3, [r1]
						strh	r3, [r0]
b6464:	 				ldr	r3, [sp]
b6468:	 				cmp	r3, #0
						beq	b64b8
						ldr	r0, .x64d4
						bl	b79c0
b6478:	 				ldr	r3, [sp]
b647c:	 				and	r0, r3, #0xff
						add	sp, sp, #4
						pop	{lr}		@ (ldr lr, [sp], #4)
						bx	lr

b648c:	 				mov	r0, #5
						bl	b7a24
						cmp	r0, #0
						bne	b64ac
						ldr	r0, .x64d0
						bl	b79c0
						bl	b61b4
						b	b6464

b64ac:	 				ldr	r3, [r0]
						str	r3, [sp]
						b	b6468
b64b8:	 				add	r0, sp, #0	
						bl	b983c
						cmp	r0, #0	
						bne	b6478
						mov	r3, #0	
						b	b647c

.x64d0:			.word 	0x800223e8 	
.x64d4:			.word 	0x800223a8 	
.x64d8:			.word 	0xa0020006 	
.x64dc:			.word 	0xa0020004 	
.x64e0:			.word 	0x53475241 	
.x64e4:			.word 	0x80069000 	


b64e8:				 	bic	r1, r1, #0x20000000
						add	r3, r1, #0x80000000
						cmn	r3, #0xfc000001
						mov	r3, #0	
						subls	r3, r1, #0x50000000
						strls	r3, [r2]
						movls	r3, #1
						and	r0, r3, #0xff
						bx	lr

samsung_lcd_init:		push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						mov	r2, #VIDEO_BASE
						mov	r3, #0x10
						mov	r0, #0x32
						str	r3, [r2]
						bl	highdelay
						mov	r3, #VIDEO_BASE
						orr	r3, r3, #4
						mov	fp, #0x20
						mov	r0, #0x32
						str	fp, [r3]
						bl	highdelay
						mov	r4, #VIDEO_BASE
						orr	r4, r4, #0x1c
						mov	sl, #0
						mov	r0, #0x14
						str	sl, [r4]
						bl	highdelay
						mov	r3, #VIDEO_BASE
						mov	r5, #VIDEO_BASE
						orr	r3, r3, #0x28
						mov	r2, #VIDEO_BASE
						orr	r5, r5, #0x2c
						str	sl, [r3]
						ldr	r3, .x6ac0
						orr	r2, r2, #0x38
						mov	r1, #VIDEO_BASE
						str	sl, [r5]
						mov	r6, #VIDEO_BASE
						str	sl, [r2]
						orr	r1, r1, #64	@ 0x40
						mov	r7, #VIDEO_BASE
						mov	r2, #VIDEO_BASE
						orr	r6, r6, #0x48
						str	sl, [r1]
						orr	r7, r7, #0x50
						orr	r2, r2, #92	@ 0x5c
						str	r3, [r6]
						mov	r3, #VIDEO_BASE
						str	sl, [r7]
						str	sl, [r2]
						orr	r3, r3, #96	@ 0x60
						mov	r2, #31	@ 0x1f
						mov	r0, #50	@ 0x32
						str	r2, [r3]
						bl	highdelay
						mov	r3, #VIDEO_BASE
						orr	r3, r3, #12	@ 0xc
						mov	r2, #43	@ 0x2b
						mov	r0, #4	@ 0x4
						str	r2, [r3]
						bl	highdelay
						mov	r2, #VIDEO_BASE
						mov	r3, #0x2400
						orr	r2, r2, #8	@ 0x8
						orr	r3, r3, #63	@ 0x3f
						mov	r0, #5	@ 0x5
						str	r3, [r2]
						bl	highdelay
						mov	r2, #VIDEO_BASE
						mov	r3, #0xec0
						orr	r2, r2, #0x10
						orr	r3, r3, #9
						mov	r0, #5
						str	r3, [r2]
						bl	highdelay
						mov	r1, #VIDEO_BASE
						mov	r3, #0x2100
						mov	r0, #VIDEO_BASE
						orr	r1, r1, #0x100
						orr	r3, r3, #5
						mov	lr, #VIDEO_BASE
						mov	r2, #0x4400
						orr	r0, r0, #0x104
						mov	r8, #1
						str	r3, [r1]
						orr	lr, lr, #0x14
						orr	r2, r2, #2
						str	r8, [r0]
						str	r2, [lr]
						mov	r0, #5
						bl	highdelay
						mov	r3, #VIDEO_BASE
						orr	r3, r3, #0x18
						mov	r0, #5
						str	sl, [r3]
						bl	highdelay
						mov	r3, #0x320
						str	r3, [r4]
						mov	r4, #VIDEO_BASE
						orr	r4, r4, #0x20
						mov	r2, #VIDEO_BASE
						mov	r3, #0x110
						str	sl, [r4]
						orr	r2, r2, #0x30
						orr	r3, r3, #1
						str	r8, [r5]
						mov	r0, #5
						str	r3, [r2]
						bl	highdelay
						mov	r3, #VIDEO_BASE
						orr	r3, r3, #0x34
						mov	r0, #5
						str	sl, [r3]
						bl	highdelay
						mov	r0, #5
						str	sl, [r6]
						bl	highdelay
						mov	r0, #5
						str	sl, [r7]
						bl	highdelay
						mov	r3, #VIDEO_BASE
						orr	r3, r3, #0x64
						mov	r2, #4
						mov	r0, #5
						str	r2, [r3]
						bl	highdelay
						ldr	r3, .x6abc
						mov	r2, #VIDEO_BASE
						orr	r2, r2, #0x108
						mov	r1, #VIDEO_BASE
						str	r3, [r2]
						mov	r3, #36	@ 0x24
						orr	r1, r1, #0x10c
						mov	r0, #VIDEO_BASE
						str	r3, [r1]

@						b jump_over

						mov	r1, #0	@ 0x0
						orr	r0, r0, #0x20000
						mov	r2, #0x96000
						bl	bcf44
						str	r8, [r4]

jump_over:
						ldr	r8, .x6ab8
						ldr	r3, .x6ab4
						ldr	r0, .x6ab0
						mov	r7, #VIDEO_BASE
						mov	r4, #VIDEO_BASE
						orr	r7, r7, #0xa40
						str	sl, [r8]
						mov	r1, #0x3c0
						ldr	lr, .x6aac
						ldr	r2, .x6aa8
						str	sl, [r7]
						orr	r4, r4, #0xa30
						str	r1, [r3]
						ldr	r1, .x6aa4
						mov	r3, #0x2300000
						str	r0, [r4]
						ldr	r0, .x6aa0
						mov	r4, #VIDEO_BASE
						orr	r3, r3, #0x50
						orr	r4, r4, #0xa10
						str	r2, [lr]
						str	r3, [r1]
						str	r0, [r4]
						mov	r0, #0x4000
						ldr	lr, .x6a9c
						mov	r2, #0x4f0000
						ldr	r1, .gof_a18_add
						mov	r3, #0x20000
						orr	r0, r0, #0x44
						orr	r2, r2, #0x2c4
						orr	r3, r3, #0x284
						str	r2, [lr]
						ldr	r2, .gof_a04_add
						mov	r9, #VIDEO_BASE
						str	r3, [r1]
						orr	r9, r9, #0xa00
						ldr	r5, .gof_a1c_add
						mov	r3, #3
						str	r0, [r9]
						str	r3, [r2]
						mov	r2, #0x1e0000
						ldr	r1, .gof_a24_add
						ldr	r3, .x6a88
						mov	r4, #VIDEO_BASE
						mov	lr, #0x228000
						str	r2, [r5]
						ldr	r2, .x6a84
						orr	r4, r4, #0xa20
						orr	lr, lr, #0x1f
						mov	r0, #VIDEO_BASE
						orr	r0, r0, #0xa70
						str	lr, [r4]
						ldr	r4, .x6a80
						ldr	r6, .x6a7c
						str	r3, [r1]
						ldr	r3, .x6a78
						str	r2, [r0]
						mov	r2, #0x8000
						ldr	r5, .x6a74
						ldr	lr, .x6a70
						ldr	r0, .x6a6c
						ldr	r1, .x6a68
						str	r2, [r4]
						ldr	r2, .x6a64
						str	r3, [r6]
						mov	r3, #0x38000
						orr	r3, r3, #2
						str	lr, [r5]
						str	r1, [r0]
						str	r3, [r2]
						mov	r0, #VIDEO_BASE
						mov	r3, #0x3d0
						mov	lr, #VIDEO_BASE
						str	sl, [r7]
						orr	r0, r0, #0xaa0
						mov	r6, #0x208
						ldr	r4, .x6a60
						orr	r3, r3, #2
						str	sl, [r8]
						orr	lr, lr, #0xa60
						ldr	r5, .x6a5c
						mov	r2, #0x2000000
						str	r6, [r0]
						ldr	r0, .x6a58
						str	r3, [lr]
						mov	r1, #0xe00000
						mov	r3, #0x480000
						orr	r2, r2, #0x1c0
						orr	r1, r1, #0x1880
						orr	r3, r3, #0x410
						str	r2, [r4]
						ldr	r2, .gof_b04_val
						mov	lr, #VIDEO_BASE
						str	r1, [r5]
						ldr	r1, .gof_b04_add
						str	r3, [r0]
						mov	r0, #0xa0000
						orr	lr, lr, #0xb00
						ldr	r3, .gof_b08_add
						str	r0, [lr]
						str	r2, [r1]
						mov	r1, #0x3f
						mov	r0, #VIDEO_BASE
						str	r1, [r3]
						mov	r3, #0x3400000
						orr	r0, r0, #0xb10
						ldr	r2, .gof_b14_add
						ldr	r4, .gof_b18_add
						ldr	r1, .gof_b18_val
						ldr	lr, .gof_b1c_add
						str	r3, [r0]
						ldr	r0, .gof_b1c_val
						ldr	r5, .x6a34
						ldr	r3, .x6a30
						str	r5, [r2]
						ldr	r2, .x6a2c
						str	r1, [r4]
						mov	r1, #VIDEO_BASE
						str	r0, [lr]
						str	r3, [r2]
						mov	r3, #0x40000
						orr	r1, r1, #0xb20
						mov	lr, #VIDEO_BASE
						mov	r0, #0x100
						ldr	r2, .x6a28
						str	r3, [r1]
						ldr	r1, .x6a24
						orr	lr, lr, #0xb30
						orr	r0, r0, #1	
						mov	r3, #0xff00
						str	r0, [lr]
						ldr	lr, .x6a20
						orr	r3, r3, #0xf3
						mov	r0, #VIDEO_BASE
						ldr	r4, .x6a1c
						str	sl, [r2]
						str	r3, [r1]
						ldr	r1, .x6a18
						ldr	r3, .x6a14
						orr	r0, r0, #0xb40
						mov	r2, #0xbb0
						orr	r2, r2, #0xa
						str	sl, [r0]
						ldr	r0, .x6a10
						str	sl, [lr]
						str	r2, [r4]
						ldr	lr, .x6a0c
						str	r3, [r1]
						mov	r3, #0x2000
						ldr	r2, .x6a08
						mov	r1, #VIDEO_BASE
						str	r3, [r0]
						ldr	r3, .x6a04
						orr	r1, r1, #0xba0
						str	r5, [lr]
						str	sl, [r1]
						str	sl, [r2]
						mov	r0, #0x14
						str	fp, [r3]
						bl	highdelay
						ldr	r4, .x6a00
						ldr	r0, .x69fc
						ldr	lr, .VIDEO_BASE_0xbcc
						ldr	r2, .x69f4
						ldr	r3, .x69f0
						mov	r1, #VIDEO_BASE
						str	r0, [r4]
						orr	r1, r1, #0xbd0
						str	r2, [lr]
						ldr	r2, .x69ec
						str	r3, [r1]
						ldr	r3, .x69e8
						mov	r0, #0x28
						str	r3, [r2]
						ldr	r3, [r9]
						orr	r3, r3, #3
						str	r3, [r9]
						bl	highdelay
						pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						bx	lr		@ original address == 0x69e4

video_addresses:
.x69e8:				.word 	0x59809020
.x69ec:				.word 	VIDEO_BASE+0xbec
.x69f0:				.word  	0x44289104
.x69f4:				.word  	0x30257804

.VIDEO_BASE_0xbcc:	.word  	VIDEO_BASE+0xbcc    	@ orig 0x69f8
.x69fc:				.word  	0x45260010

.x6a00:				.word  	VIDEO_BASE+0xbc4
.x6a04:				.word  	VIDEO_BASE+0xb5c
.x6a08:				.word  	VIDEO_BASE+0xbac
.x6a0c:				.word  	VIDEO_BASE+0xb58

.x6a10:				.word  	VIDEO_BASE+0xb54
.x6a14:				.word  	0x04001541

.x6a18:				.word  	VIDEO_BASE+0xb48
.x6a1c:				.word  	VIDEO_BASE+0xb4c
.x6a20:				.word  	VIDEO_BASE+0xb44
.x6a24:				.word  	VIDEO_BASE+0xb3c
.x6a28:				.word  	VIDEO_BASE+0xb34
                 	
.x6a2c:				.word  	VIDEO_BASE+0xb2c
.x6a30:				.word  	0x537d2fca
.x6a34:				.word  	0x55555555
.gof_b1c_val:		.word  	0x50512a00
.gof_b1c_add:		.word  	VIDEO_BASE+0xb1c

.gof_b18_val:		.word  	0x28051005
.gof_b18_add:		.word  	VIDEO_BASE+0xb18

.gof_b14_add:		.word  	VIDEO_BASE+0xb14 	
.gof_b08_add:		.word  	VIDEO_BASE+0xb08 	

.gof_b04_add:		.word  	VIDEO_BASE+0xb04 	
.gof_b04_val:		.word  	0x04700202
       	
.x6a58:				.word  	VIDEO_BASE+0xabc
.x6a5c:				.word  	VIDEO_BASE+0xab8 	
.x6a60:				.word  	VIDEO_BASE+0xa64 	
.x6a64:				.word  	VIDEO_BASE+0xa28 	
.x6a68:				.word  	0x029801f3 	
.x6a6c:				.word  	VIDEO_BASE+0xa7c 	
.x6a70:				.word  	0x01cc0127 	
.x6a74:				.word  	VIDEO_BASE+0xa78 	
.x6a78:				.word  	0xc100c05b 	
.x6a7c:				.word  	VIDEO_BASE+0xa2c 	
.x6a80:				.word  	VIDEO_BASE+0xa74 	
.x6a84:				.word  	0x02bf01f3 	
.x6a88:				.word  	0xa127c05b 	
.gof_a24_add:		.word  	VIDEO_BASE+0xa24 	
.gof_a1c_add:		.word  	VIDEO_BASE+0xa1c 	
.gof_a04_add:		.word  	VIDEO_BASE+0xa04 	
.gof_a18_add:		.word  	VIDEO_BASE+0xa18 	
.x6a9c:				.word  	VIDEO_BASE+0xa14 	
.x6aa0:				.word  	0x02810002 	
.x6aa4:				.word  	VIDEO_BASE+0xa0c 	
.x6aa8:				.word  	0x027f0002 	
.x6aac:				.word  	VIDEO_BASE+0xa34 	
.x6ab0:				.word  	0x01df0050 	
.x6ab4:				.word  	VIDEO_BASE+0xa4c 	
.x6ab8:				.word  	VIDEO_BASE+0xa48 	
.x6abc:				.word  	0xaa432793 	
.x6ac0:				.word  	0x09244920 	
       	
       

goforce_init1:
				 push	{r4, r5, r6, r7, r8, r9, sl, lr}
				 mov	r2, #VIDEO_BASE
				 mov	r3, #0x10
				 mov	r0, #0x32
				 str	r3, [r2]
				 bl	highdelay
				 mov	r3, #VIDEO_BASE
				 orr	r3, r3, #4
				 mov	sl, #0x20
				 mov	r0, #0x32
				 str	sl, [r3]
				 bl	highdelay
				 mov	r4, #VIDEO_BASE
				 orr	r4, r4, #0x1c
				 mov	r9, #0
				 mov	r0, #0x14
				 str	r9, [r4]
				 bl	highdelay
				 mov	r3, #VIDEO_BASE
				 mov	r5, #VIDEO_BASE
				 orr	r3, r3, #0x28
				 mov	r2, #VIDEO_BASE
				 orr	r5, r5, #0x2c
				 str	r9, [r3]
				 ldr	r3, .x6f3c
				 orr	r2, r2, #0x38
				 mov	r1, #VIDEO_BASE
				 str	r9, [r5]
				 mov	r6, #VIDEO_BASE
				 str	r9, [r2]
				 orr	r1, r1, #0x40
				 mov	r7, #VIDEO_BASE
				 mov	r2, #VIDEO_BASE
				 orr	r6, r6, #0x48
				 str	r9, [r1]
				 orr	r7, r7, #0x50
				 orr	r2, r2, #0x5c
				 str	r3, [r6]
				 mov	r3, #VIDEO_BASE
				 str	r9, [r7]
				 str	r9, [r2]
				 orr	r3, r3, #0x60
				 mov	r2, #0x1f
				 str	r2, [r3]
				 mov	r0, #0x32
				 bl	highdelay
				 mov	r3, #VIDEO_BASE
				 orr	r3, r3, #0xc
				 mov	r2, #0x2b
				 str	r2, [r3]
				 mov	r0, #4
				 bl	highdelay
				 mov	r2, #VIDEO_BASE
				 mov	r3, #0x2400
				 orr	r2, r2, #8
				 orr	r3, r3, #0x3f
				 str	r3, [r2]
				 mov	r0, #5
				 bl	highdelay
				 mov	r2, #VIDEO_BASE
				 mov	r3, #0xec0
				 orr	r2, r2, #0x10
				 orr	r3, r3, #9
				 str	r3, [r2]
				 mov	r0, #5
				 bl	highdelay
				 mov	r1, #VIDEO_BASE
				 mov	r3, #0x2100
				 mov	r0, #VIDEO_BASE
				 orr	r1, r1, #0x100
				 orr	r3, r3, #5
				 mov	lr, #VIDEO_BASE
				 mov	r2, #0x4400
				 orr	r0, r0, #0x104
				 mov	r8, #1
				 str	r3, [r1]
				 orr	lr, lr, #0x14
				 orr	r2, r2, #2
				 str	r8, [r0]
				 str	r2, [lr]
				 mov	r0, #5
				 bl	highdelay
				 mov	r3, #VIDEO_BASE
				 orr	r3, r3, #0x18
				 mov	r0, #5	
				 str	r9, [r3]
				 bl	highdelay
				 mov	r3, #0x320
				 str	r3, [r4]
				 mov	r4, #VIDEO_BASE
				 orr	r4, r4, #0x20
				 mov	r2, #VIDEO_BASE
				 mov	r3, #0x110
				 str	r9, [r4]
				 orr	r2, r2, #0x30
				 orr	r3, r3, #1
				 str	r8, [r5]
				 mov	r0, #5
				 str	r3, [r2]
				 bl	highdelay
				 mov	r3, #VIDEO_BASE
				 orr	r3, r3, #0x34
				 str	r9, [r3]
				 mov	r0, #5
				 bl	highdelay
				 str	r9, [r6]
				 mov	r0, #5
				 bl	highdelay
				 str	r9, [r7]
				 mov	r0, #5
				 bl	highdelay
				 mov	r3, #VIDEO_BASE
				 orr	r3, r3, #0x64
				 mov	r2, #4
				 str	r2, [r3]
				 mov	r0, #5
				 bl	highdelay
				 ldr	r3, .x6f38
				 mov	r1, #VIDEO_BASE
				 mov	r2, #VIDEO_BASE
				 ldr	r7, .x6f34
				 orr	r1, r1, #0x108
				 orr	r2, r2, #0x10c
				 mov	r0, #0x24
				 str	r3, [r1]
				 
				 ldr	r1, .gof_a4c_add
				 mov	r6, #VIDEO_BASE
				 str	r0, [r2]
				 str	r8, [r4]
				 ldr	r0, .x6f2c
				 orr	r6, r6, #0xa40
				 str	r9, [r7]
				 mov	r4, #0x3c0
				 ldr	r2, .gof_a34_add
				 ldr	r3, .x6f24
				 str	r9, [r6]
				 
				 mov	lr, #VIDEO_BASE
				 str	r4, [r1]
				 
				 ldr	r4, .x6f20
				 mov	r1, #0x1e80000
				 orr	lr, lr, #0xa30
				 orr	r1, r1, #8
				 str	r0, [lr]
				 @ ---------------------
				 ldr	r0, .x6f1c
				 ldr	lr, .gof_a14_add
				 mov	r5, #VIDEO_BASE
				 str	r3, [r2]
				 
				 ldr	r3, .x6f14
				 str	r1, [r4]		@ supipl-ref01
				 
				 ldr	r1, .x6f10
				 mov	r2, #0x40000
				 orr	r5, r5, #0xa10
				 orr	r2, r2, #0x1f0
				 str	r0, [r5]
				 
				 mov	r0, #0x4000
				 str	r2, [lr]
				 
				 ldr	r4, .x6f0c
				 ldr	lr, .x6f08
				 str	r3, [r1]		@ supipl-ref02
				 
				 ldr	r1, .x6f04
				 orr	r0, r0, #0x44
				 mov	r8, #VIDEO_BASE
				 orr	r8, r8, #0xa00
				 ldr	r2, .x6f00
				 str	r0, [r8]
				 
				 mov	r0, #3
				 mov	r3, #0x58000
				 str	r0, [r4]
				 
				 orr	r3, r3, #4
				 str	r1, [lr]		@ supipl-ref03
				 
				 str	r3, [r2]
				 
				 mov	r3, #VIDEO_BASE
				 orr	r3, r3, #0xaa0
				 str	r9, [r6]
				 
				 mov	r0, #0x200
				 mov	r2, #VIDEO_BASE
				 str	r9, [r7]
				 
				 str	r0, [r3]		@ supipl-ref04
				 ldr	r1, .x6efc
				 mov	r0, #0xa0000
				 orr	r2, r2, #0xb00
				 str	r0, [r2]
				 
				 ldr	r3, .x6ef8
				 mov	r0, #0x730000
				 str	r0, [r1]
				 mov	r1, #0x3f
				 mov	r2, #VIDEO_BASE
				 str	r1, [r3]
				 ldr	lr, .x6ef4
				 ldr	r5, .x6ef0
				 mov	r3, #0x3000000
				 orr	r2, r2, #0xb10
				 ldr	r0, .x6eec
				 ldr	r1, .x6ee8
				 str	r3, [r2]
				 ldr	r2, .x6ee4
				 ldr	r3, .x6ee0
				 str	r5, [lr]
				 str	r1, [r0]
				 ldr	r1, .x6edc
				 str	r3, [r2]
				 ldr	r3, .x6ed8
				 mov	r2, #VIDEO_BASE
				 orr	r2, r2, #0xb20
				 mov	r6, #0x40000
				 ldr	lr, .x6ed4
				 str	r3, [r1]
				 mov	r4, #VIDEO_BASE
				 mov	r0, #0x100
				 str	r6, [r2]
				 ldr	r2, .x6ed0
				 orr	r4, r4, #0xb30
				 orr	r0, r0, #1
				 mov	r3, #0xff00
				 mov	r1, #VIDEO_BASE
				 orr	r3, r3, #0xf3
				 str	r0, [r4]
				 ldr	r0, .x6ecc
				 orr	r1, r1, #0xb40
				 str	r9, [lr]
				 ldr	lr, .x6ec8
				 str	r3, [r2]
				 ldr	r3, .x6ec4
				 mov	r2, #0xbb0
				 str	r9, [r1]
				 ldr	r1, .x6ec0
				 orr	r2, r2, #0xa
				 str	r9, [r0]
				 ldr	r0, .x6ebc
				 str	r2, [lr]
				 ldr	lr, .x6eb8
				 str	r3, [r1]
				 mov	r3, #0x2000
				 ldr	r2, .x6eb4
				 mov	r1, #VIDEO_BASE
				 str	r3, [r0]
				 ldr	r3, .x6eb0
				 orr	r1, r1, #0xba0
				 str	r5, [lr]
				 str	r9, [r1]
				 str	r9, [r2]
				 str	sl, [r3]
				 mov	r0, #0x14
				 bl	highdelay
				 ldr	r3, [r8]
				 mov	r0, #0x28
				 orr	r3, r3, #3
				 str	r3, [r8]
				 bl	highdelay
			
goforce_init2:	
				  mov	r3, #VIDEO_BASE          @original address 0x7400
				  ldr	r2, .x745c
				  orr	r3, r3, #0x470
				  mov	r0, #0x4000
				  str	r0, [r3]
				  mov	r3, #0x10000
				  mov	r1, #VIDEO_BASE
				  str	r3, [r2]
				  mov	r3, #0x25
				  orr	r1, r1, #0x28
				  mov	r0, #VIDEO_BASE
				  str	r3, [r1]

@cxlabs:		b test2

				  mov	r1, #0
				  mov	r2, #0x96000
				  orr	r0, r0, #0x20000
				  bl	bcf44
test2:			  mov	r0, #VIDEO_BASE
				  orr	r0, r0, #0x20000
				  mov	r2, #0x96000
				  mov	r1, #0
				  bl	bcf44


@ ------------------------------
@ WARNING my test
@endlessloop: b endlessloop
@ ------------------------------
				  pop	{r4, r5, r6, r7, r8, r9, sl, lr}
				  bx	lr
	  
.x745c:			.word VIDEO_BASE+0x474 	
.x6eb0:			.word VIDEO_BASE+0xb5c
.x6eb4:			.word VIDEO_BASE+0xbac 	
.x6eb8:			.word VIDEO_BASE+0xb58 	
.x6ebc:			.word VIDEO_BASE+0xb54 	
.x6ec0:			.word VIDEO_BASE+0xb48
 	
.x6ec4:			.word 0x04001541 
	
.x6ec8:			.word VIDEO_BASE+0xb4c 	
.x6ecc:			.word VIDEO_BASE+0xb44 	
.x6ed0:			.word VIDEO_BASE+0xb3c 	
.x6ed4:			.word VIDEO_BASE+0xb34 

.x6ed8:			.word 0x537d2fca 	

.x6edc:			.word VIDEO_BASE+0xb2c 	
.x6ee0:			.word 0x50512a00 	

.x6ee4:			.word VIDEO_BASE+0xb1c 	
.x6ee8:			.word 0x28051005 	

.x6eec:			.word VIDEO_BASE+0xb18 	
.x6ef0:			.word 0x55555555 	

.x6ef4:			.word VIDEO_BASE+0xb14 	
.x6ef8:			.word VIDEO_BASE+0xb08 	
.x6efc:			.word VIDEO_BASE+0xb04 	
.x6f00:			.word VIDEO_BASE+0xa28 	
.x6f04:			.word 0x02be02bc
	
.x6f08:			.word VIDEO_BASE+0xa1c 	
.x6f0c:			.word VIDEO_BASE+0xa04 	
.x6f10:			.word VIDEO_BASE+0xa18 	
.x6f14:			.word 0x00010287

.gof_a14_add:	.word VIDEO_BASE+0xa14 	
.x6f1c:			.word 0x02830004

.x6f20:			.word VIDEO_BASE+0xa0c 	
.x6f24:			.word 0x027f0004
 	
.gof_a34_add:	.word VIDEO_BASE+0xa34 	
.x6f2c:			.word 0x01df0008

.gof_a4c_add:	.word VIDEO_BASE+0xa4c 	
.x6f34:			.word VIDEO_BASE+0xa48 	
.x6f38:			.word 0xaa432793
.x6f3c:			.word 0x09244920

write_video1:			push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}		@ orig add 0x6f40
						sub	sp, sp, #4
						ldr	r9, .x7004
						mov	lr, #0
						mov	r4, #0
						ldrb	r2, [r9]
						ldrb	r3, [r9, #1]
						mov	r0, #2
						add	r8, r2, #0x100
						mul	r2, r3, r8
						rsb	r1, r8, #0x1e0
						asr	r3, r2, #2
						add	r3, r2, r3, lsr #29
						asr	r3, r3, #3
						add	r7, r3, #2	@ 0x2
						add	r3, r1, r1, lsr #31
						asr	sl, r3, #1
						str	r7, [sp]
						cmp	r7, #2	@ 0x2
						ble	b6ff8
						mov	r6, #VIDEO_BASE
						orr	r6, r6, #0x20000
						mov	fp, #1	
						add	r3, r4, #0xfa
						rsb	r3, r3, r3, lsl #4
						ldrb	r5, [r0, r9]
						add	r1, sl, r3, lsl #5
						mov	r2, #0
						mov	r7, #31
b6fb4:		 			tst	r5, fp, lsl r2
						add	r2, r2, #1
						addne	r3, r1, lr
						addne	r3, r6, r3, lsl #1
						add	lr, lr, #1
						strhne	r7, [r3]  	@ WARNING !! Original code
						@strneh	r7, [r3]    @ alternative when NOT .syntax unified
						cmp	lr, r8
						moveq	lr, #0
						addeq	r4, r4, #1
						addeq	r1, r1, #0x1e0
						cmp	r2, #8
						blt	b6fb4
						ldr	r7, [sp]
						add	r0, r0, #1
						ldr	r9, .x7004
						cmp	r0, r7
						blt	b6f9c
b6ff8:					add	sp, sp, #4
						pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						bx	lr

.x7004:			.word 	0x80022600
b7008:				 	push	{r4, r5, r6, lr}
						mov	r5, #VIDEO_BASE2
						orr	r5, r5, #0x400000
						mov	r4, #0
						movs	r6, r0
						beq	b7050
b7020:	 				ldr	r3, [r5]
						tst	r3, #0x10
						bne	b704c
						mov	r0, #0xa
						bl	lowdelay
						add	r3, r4, #1
						lsl	r4, r3, #16
						lsr	r4, r4, #16
						cmp	r4, r6
						bcc	b7020
						b	b7050
b704c:					mov	r4, #0
b7050:					cmp	r4, #0
						movne	r0, #1
						popne	{r4, r5, r6, lr}
						moveq	r0, #0	
						popeq	{r4, r5, r6, lr}
						bx	lr

b7068:			 		push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
/*
    706c:	e3a094b1 	mov	r9, #VIDEO_BASE2
    7070:	e3a08113 	mov	r8, #0xc0000004
    7074:	e3a0b133 	mov	fp, #0xc000000c
    7078:	e3a02cbf 	mov	r2, #48896	; 0xbf00
    707c:	e59f6200 	ldr	r6, [pc, #512]	; 0x7284
    7080:	e59fa1f8 	ldr	sl, [pc, #504]	; 0x7280
    7084:	e3899501 	orr	r9, r9, #4194304	; 0x400000
    7088:	e248853b 	sub	r8, r8, #247463936	; 0xec00000
    708c:	e24bb53b 	sub	fp, fp, #247463936	; 0xec00000
    7090:	e38220ff 	orr	r2, r2, #255	; 0xff
    7094:	e3a04000 	mov	r4, #0	; 0x0
    7098:	e3a07000 	mov	r7, #0	; 0x0
    709c:	e5963000 	ldr	r3, [r6]
    70a0:	e3a05000 	mov	r5, #0	; 0x0
    70a4:	e3833901 	orr	r3, r3, #16384	; 0x4000
    70a8:	e5863000 	str	r3, [r6]
    70ac:	e59a3000 	ldr	r3, [sl]
    70b0:	e3c3320f 	bic	r3, r3, #-268435456	; 0xf0000000
    70b4:	e3833201 	orr	r3, r3, #268435456	; 0x10000000
    70b8:	e58a3000 	str	r3, [sl]
    70bc:	e5963000 	ldr	r3, [r6]
    70c0:	e0033002 	and	r3, r3, r2
    70c4:	e5863000 	str	r3, [r6]
    70c8:	e5963000 	ldr	r3, [r6]
    70cc:	e3130902 	tst	r3, #32768	; 0x8000
    70d0:	0a000004 	beq	0x70e8
    70d4:	e3a00001 	mov	r0, #1	; 0x1
    70d8:	eb000249 	bl	lowdelay
    70dc:	e2855001 	add	r5, r5, #1	; 0x1
    70e0:	e3550014 	cmp	r5, #20	; 0x14
    70e4:	3afffff7 	bcc	0x70c8
    70e8:	e5963000 	ldr	r3, [r6]
    70ec:	e3130902 	tst	r3, #32768	; 0x8000
    70f0:	1a00002c 	bne	0x71a8
    70f4:	e5963000 	ldr	r3, [r6]
    70f8:	e3a00014 	mov	r0, #20	; 0x14
    70fc:	e3833901 	orr	r3, r3, #16384	; 0x4000
    7100:	e5863000 	str	r3, [r6]
    7104:	eb00023e 	bl	lowdelay
    7108:	e59a3000 	ldr	r3, [sl]
    710c:	e3a05062 	mov	r5, #98	; 0x62
    7110:	e3a00096 	mov	r0, #150	; 0x96
    7114:	e3c3320f 	bic	r3, r3, #0xf0000000
    7118:	e383320a 	orr	r3, r3, #0xa0000000
    711c:	e58a3000 	str	r3, [sl]
    7120:	e3a030d0 	mov	r3, #208	; 0xd0
    7124:	e5883000 	str	r3, [r8]
    7128:	e3a03058 	mov	r3, #88	; 0x58
    712c:	e58b3000 	str	r3, [fp]
    7130:	e3a030f0 	mov	r3, #240	; 0xf0
    7134:	e5895000 	str	r5, [r9]
    7138:	e5883000 	str	r3, [r8]
    713c:	ebffffb1 	bl	b7008
    7140:	e3500000 	cmp	r0, #0	; 0x0
    7144:	1a000013 	bne	0x7198
    7148:	e5983000 	ldr	r3, [r8]
    714c:	e2133001 	ands	r3, r3, #1	; 0x1
    7150:	1a000012 	bne	0x71a0
    7154:	e3a00014 	mov	r0, #20	; 0x14
    7158:	eb000229 	bl	lowdelay
    715c:	e3a03008 	mov	r3, #8	; 0x8
    7160:	e3a02000 	mov	r2, #0	; 0x0
    7164:	e58b2000 	str	r2, [fp]
    7168:	e2533001 	subs	r3, r3, #1	; 0x1
    716c:	1afffffc 	bne	0x7164
    7170:	e3a00096 	mov	r0, #150	; 0x96
    7174:	e5895000 	str	r5, [r9]
    7178:	ebffffa2 	bl	b7008
    717c:	e3500000 	cmp	r0, #0	; 0x0
    7180:	1a000004 	bne	0x7198
    7184:	e5983000 	ldr	r3, [r8]
    7188:	e2133001 	ands	r3, r3, #1	; 0x1
    718c:	1a000003 	bne	0x71a0
    7190:	e3a04000 	mov	r4, #0	; 0x0
    7194:	ea000005 	b	0x71b0
    7198:	e3844004 	orr	r4, r4, #4	; 0x4
    719c:	ea000003 	b	0x71b0
    71a0:	e3844002 	orr	r4, r4, #2	; 0x2
    71a4:	ea000001 	b	0x71b0
    71a8:	e3844001 	orr	r4, r4, #1	; 0x1
    71ac:	e3a05062 	mov	r5, #98	; 0x62
    71b0:	e3a030d0 	mov	r3, #208	; 0xd0
    71b4:	e5895000 	str	r5, [r9]
    71b8:	e5883000 	str	r3, [r8]
    71bc:	e5993000 	ldr	r3, [r9]
    71c0:	e3a00014 	mov	r0, #20	; 0x14
    71c4:	e20330f7 	and	r3, r3, #247	; 0xf7
    71c8:	e5893000 	str	r3, [r9]
    71cc:	eb00020c 	bl	lowdelay
    71d0:	e3a03000 	mov	r3, #0	; 0x0
    71d4:	e5883000 	str	r3, [r8]
    71d8:	e59a3000 	ldr	r3, [sl]
    71dc:	e3540001 	cmp	r4, #1	; 0x1
    71e0:	e3c3320f 	bic	r3, r3, #-268435456	; 0xf0000000
    71e4:	e3833201 	orr	r3, r3, #268435456	; 0x10000000
    71e8:	e58a3000 	str	r3, [sl]
    71ec:	e5963000 	ldr	r3, [r6]
    71f0:	e3833901 	orr	r3, r3, #16384	; 0x4000
    71f4:	e5863000 	str	r3, [r6]
    71f8:	0a000007 	beq	0x721c
    71fc:	e3540002 	cmp	r4, #2	; 0x2
    7200:	0a000003 	beq	0x7214
    7204:	e3540004 	cmp	r4, #4	; 0x4
    7208:	1a000005 	bne	0x7224
    720c:	e59f0068 	ldr	r0, [pc, #104]	; 0x727c
    7210:	ea000002 	b	0x7220
    7214:	e59f005c 	ldr	r0, [pc, #92]	; 0x7278
    7218:	ea000000 	b	0x7220
    721c:	e59f0050 	ldr	r0, [pc, #80]	; 0x7274
    7220:	eb000495 	bl	b847c
    7224:	e3540000 	cmp	r4, #0	; 0x0
    7228:	0a00000e 	beq	0x7268
    722c:	e3570001 	cmp	r7, #1	; 0x1
    7230:	059f0038 	ldreq	r0, [pc, #56]	; 0x7270
    7234:	0b000490 	bleq	b847c
    7238:	e3570002 	cmp	r7, #2	; 0x2
    723c:	059f002c 	ldreq	r0, [pc, #44]	; 0x7270
    7240:	0b00048d 	bleq	b847c
    7244:	e3a00dbb 	mov	r0, #11968	; 0x2ec0
    7248:	e3800020 	orr	r0, r0, #32	; 0x20
    724c:	eb0001ec 	bl	lowdelay
    7250:	e2873001 	add	r3, r7, #1	; 0x1
    7254:	e20370ff 	and	r7, r3, #255	; 0xff
    7258:	e3a02cbf 	mov	r2, #48896	; 0xbf00
    725c:	e3570003 	cmp	r7, #3	; 0x3
    7260:	e38220ff 	orr	r2, r2, #255	; 0xff
    7264:	3affff8c 	bcc	0x709c
*/
						pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						bx	lr

.x7270:		.word 	0x8002244c 	
.x7274:		.word 	0x80022458 	
.x7278:		.word 	0x80022468 	
.x727c:		.word 	0x8002247c 	
.x7280:		.word 	0xb1600040 	
.x7284:		.word 	0xb1600044 	


goforce_init:		push	{r4, r5, r6, lr}		@ 0x7288
					mov	r3, #VIDEO_CONTR+0x14				
					mov	r1, #0xb0000000
					sub	r3, r3, #0xf800000			@ r3 = 0xb0800014
					ldr	r2, [r3]
					orr	r1, r1, #0x800000			@ r1 = 0xb0800000
					ldr	r1, [r1]					
					ldr	r0, .x7468
					bl	b847c
					mov	r2, #(VIDEO_CONTR+0x10)
					sub	r2, r2, #0xea00000
					ldr	r3, [r2]
					mov	r1, #(VIDEO_CONTR+0x18)
					sub	r1, r1, #0xea00000
					bic	r3, r3, #0x30000
					str	r3, [r2]
					ldr	r3, [r2]
					mov	r0, #(VIDEO_CONTR+0x14)
					sub	r0, r0, #0xea00000
					orr	r3, r3, #0x10000
					str	r3, [r2]
					ldr	r3, [r1]
					mov	r4, #(VIDEO_CONTR+0x20)
					sub	r4, r4, #0xea00000
					orr	r3, r3, #0x100
					str	r3, [r1]
					ldr	r3, [r0]
					mov	lr, #(VIDEO_CONTR+0x28)
					sub	lr, lr, #0xea00000
					orr	r3, r3, #0x100
					str	r3, [r0]
					ldr	r3, [r4]
					mov	r2, #(VIDEO_CONTR+0x24)
					sub	r2, r2, #0xea00000
					bic	r3, r3, #0xc
					str	r3, [r4]
					ldr	r3, [r4]
					mov	r6, #(VIDEO_CONTR+0x34)
					sub	r6, r6, #0xea00000		@ r6 ==
					orr	r3, r3, #0x4
					str	r3, [r4]
					ldr	r3, [lr]
					mov	r0, #0x64
					orr	r3, r3, #2
					str	r3, [lr]
					ldr	r3, [r2]
					bic	r3, r3, #2
					str	r3, [r2]
					ldr	r3, [r6]
					bic	r3, r3, #4
					str	r3, [r6]
					bl	lowdelay
					ldr	r3, [r6]
					mov	r5, #(VIDEO_CONTR+0x30)
					sub	r5, r5, #0xea00000
					orr	r3, r3, #0x4
					str	r3, [r6]
					ldr	r3, [r5]
					mov	r4, #(VIDEO_CONTR+0x38)
					sub	r4, r4, #0xea00000
					bic	r3, r3, #0xc000000
					str	r3, [r5]
					ldr	r3, [r5]
					mov	r0, #100
					orr	r3, r3, #PHYS_SDRAM_1_SIZE
					str	r3, [r5]
					ldr	r3, [r4]
					orr	r3, r3, #0x2000
					str	r3, [r4]
					ldr	r3, [r6]
					bic	r3, r3, #0x2000
					str	r3, [r6]
					ldr	r3, [r6]
					orr	r3, r3, #0x2000
					str	r3, [r6]
					bl	lowdelay
					ldr	r3, [r5]
					bic	r3, r3, #0xc0000000
					str	r3, [r5]
					ldr	r3, [r5]
					str	r3, [r5]
					ldr	r3, [r4]
					orr	r3, r3, #0x8000
					str	r3, [r4]
					ldr	r3, [r6]
					tst	r3, #0x8000
					@beq	no_goforce_init
					ldr	r0, .x7464
					bl	b847c
#undefine USE_TEST_CODE
#ifdef USE_TEST_CODE
/*
mov r0, #0 
mcr 15, 0, r0, cr7, cr7, 0    @ invalidate I,D caches on v4 
mcr 15, 0, r0, cr8, cr7, 0    @ invalidate I,D TLBs on v4 
mrc 15, 0, r0, cr1, cr0, 0    @ get control register v4, read control register P539 
bic r0, r0, #0x2300           @ V[bit[13]](Base location of exception registers)=0 = Low addresses = 0x0000 0000 
                              @ R(ROM protection bit[9])	=0 
                              @ S(System protection bit[8])	=0 
                              @ 由于TTB中AP=0b11(line141)，所以RS位不使用 
bic r0, r0, #0x87 
                              @ M(bit[0])=0 = MMU disabled 
                              @ A(bit[1])=0 = Data address alignment fault checking disable 
                              @ C(bit[2])=0 = Data cache disabled 
                              @ B(bit[7])=0 = Little-endian operation 
orr r0, r0, #0x2              @  .... .... .... ..1. A(bit[1]) =1  Data address alignment fault checking enable 
orr r0, r0, #0x1000           @  ...1 .... .... .... I(bit[12])=1  Instruction cache enabled 
mcr 15, 0, r0, cr1, cr0, 0    @  write control register write control register P545
*/
test_code_start:	
					mov	r1, #S3C24X0_MEMCTL_BWSCON
					ldr r3, .bwcon
					str r3, [r1]
					
					mrc 15, 0, r0, cr1, cr0, 0
					orr r0, r0, #0xc0000000			@ set asynchronous clocking mode
					mcr 15, 0, r0, cr1, cr0, 0
					
					mov	r1, #0x70
					mcr	15, 0, r1, cr1, cr0, 0
					
					ldr	sl, .sl_val				@ sl == 0x30010000
					mov r1, #1
					mcr 15, 0, r1, cr3, cr0, 0  @ defines mmu regions 
					mcr 15, 0, sl, cr2, cr0, 0
					mcr 15, 0, r0, cr8, cr7, 0

					@mov r1, #0x71
					@orr r1, r1, #4		@ r1 == 0x75
					@mcr 15, 0, r1, cr1, cr0, 0		
#endif
			
					
try_gof_1:			bl	goforce_init1			@original address 0x73ec 
@no_goforce_init:	ldr	r0, .x7460
@					bl	b847c
gfi3:				b	samsung_lcd_init
stophere11:			b stophere11

.sl_val:			.word 0x30010000
.bwcon:				.word 0x22121120 	

  .x7460:			.word 	0x8002248c 	
  .x7464:			.word 	0x800224a0 	
  .x7468:			.word 	0x800224b4

goforce_preinit:	 	push	{r4, r5, r6, r7, r8, lr}
						sub	sp, sp, #0x264
						ldr	r3, .x7918
						ldr	r3, [r3]
						str	r3, [sp, #608]
						mov	r0, #0x50000000
						orr	r0, r0, #0x4000
						mov	r1, #0
						bl	b7b44
						ldr	r3,.x7914
						str	r0, [r3]
test_03:				mov	r0, #VIDEO_BASE2
						mov	r3, #0xff00
						orr	r0, r0, #0x300000		@ r0==0xb1300000
						orr	r3, r3, #0x19			@ r3==0xff19
						str	r3, [r0]
						mov	r3, #0x7c00
						mov	r2, #0xc0000004
						mov	r1, #0xc0000008
						orr	r3, r3, #0xfb			@ 0x7cfb
						sub	r2, r2, #0xed00000
						sub	r1, r1, #0xed00000
						str	r3, [r2]
						str	r3, [r1]
						ldr	r3, [r0]
						orr	r3, r3, #0x20
						str	r3, [r0]
						bl	goforce_init

						mov	r1, #0xc0000010
						sub	r1, r1, #0xea00000   @ r1 == 0xB1600010
						ldr	r3, [r1]
						mov	r2, #0xc0000018
						sub	r2, r2, #0xea00000
						bic	r3, r3, #3
						str	r3, [r1]
						ldr	r3, [r1]
						orr	r3, r3, #2
						str	r3, [r1]
						ldr	r3, [r2]
						orr	r3, r3, #1
						str	r3, [r2]

test_03_loop:			b test_03_loop

						bl	write_video1
						bl	b7068
						ldr	r0, .x7910
						ldr	r3, .x790c
						ldr	r1, .x7908
						ldr	r2, [r0]
						cmp	r2, r3
						moveq	r3, #0
						streq	r3, [r0]
						moveq	r3, #1
						streq	r3, [r1]
						ldr	r3, [r1]
						cmp	r3, #1
						bne	b78a0
						mov	r2, #0
						mov	r1, #0
						mov	r0, #0
						mov	r4, #0
						mov	r8, #0
						bl	bbadc
						add	r0, sp, #0
						bl	ba044
						cmp	r0, #0
						beq	b75a4
						ldr	r3, [sp, #4]
						mov	r4, #0
						cmp	r3, #0
						beq	b75a4
b7584:				 	mov	r0, r4
						bl	bbd74
						tst	r0, #0xa
						beq	b75a4
						ldr	r3, [sp, #4]
						add	r4, r4, #1
						cmp	r4, r3
						bcc	b7584
b75a4:					ldrh	lr, [sp, #12]
						mov	r3, #1
						mov	r2, #0
						mul	r0, lr, r4
						add	r1, sp, #96
						bl	bbd28
						ldr	r3, [sp, #600]
						ldr	r1, [sp, #596]
						mov	r0, #0xff00
						lsl	r3, r3, #16
						lsr	r2, r3, #16
						lsr	r3, r1, #16
						ldrh	r5, [sp, #12]
						orr	r3, r3, r2, lsl #16
						add	r2, sp, #0x200
						ldrh	r2, [r2, #88]
						orr	r0, r0, #0xff
						and	r3, r3, r0
						orr	r1, r3, r2, lsl #16
						mov	r0, r5
						bl	bcfcc
						ldr	r2, [sp, #4]
						mov	r6, r0
						mov	r7, #0
						cmp	r2, #0
						beq	b7648
b760c:	 				cmp	r8, #4
						bge	b7648
						mov	r0, r7
						bl	bbd74
						tst	r0, #0xa
						beq	b7634
						mov	r0, r7
						bl	bbd74
						tst	r0, #2
						addeq	r8, r8, #1
b7634:	 				ldr	r2, [sp, #4]
						add	r7, r7, #1
						ldrh	r5, [sp, #12]
						cmp	r7, r2
						bcc	b760c
b7648:	 				mov	r7, #0
						cmp	r6, #0
						ble	b7678
b7654:				 	add	r0, r7, r4
						bl	bbd74
						tst	r0, #0xa
						addne	r6, r6, #1
						add	r7, r7, #1
						cmp	r7, r6
						blt	b7654
						ldrh	r5, [sp, #12]
						ldr	r2, [sp, #4]
b7678:				 	add	r3, r6, r4
						add	r6, r3, #2
						mov	r4, r6
						cmp	r6, r2
						bcs	b76a8
b768c:				 	mov	r0, r4
						bl	bbde0
						ldr	r2, [sp, #4]
						add	r4, r4, #1
						cmp	r4, r2
						bcc	b768c
						ldrh	r5, [sp, #12]
b76a8:				 	add	r6, r6, #2
						cmp	r2, #0x400
						bne	b7848
						mul	r0, r5, r8
						mov	r3, #1
						add	r2, sp, #0x10
						add	r1, sp, #0x60
						mul	r7, r5, r6
						bl	bbd28
						mov	r3, #1
						ldrb	r2, [sp, #19]
						ldrb	lr, [sp, #18]
						ldrb	r1, [sp, #17]
						ldrb	r0, [sp, #16]
						add	r2, lr, r2, lsl #8
						add	r2, r1, r2, lsl #8
						add	r6, r0, r2, lsl #8
						add	r2, sp, #0x10
						mov	r0, r7
						add	r1, sp, #0x60
						bl	bbea8
						ldrh	r1, [sp, #12]
						mov	r3, #1
						add	r2, sp, #0x10
						mul	r0, r1, r8
						add	r1, sp, #0x60
						add	r0, r0, #1
						bl	bbd28
						mov	r3, #1
						add	r2, sp, #0x10
						add	r1, sp, #0x60
						add	r0, r7, #1
						bl	bbea8
						ldrh	r1, [sp, #12]
						mov	r3, #1
						add	r2, sp, #0x10
						mul	r0, r1, r8
						add	r1, sp, #0x60
						add	r0, r0, #3
						bl	bbd28
						ldrb	r0, [sp, #19]
						ldrb	r3, [sp, #18]
						ldrb	r2, [sp, #17]
						ldrb	r1, [sp, #16]
						add	r3, r3, r0, lsl #8
						add	r3, r2, r3, lsl #8
						add	r3, r1, r3, lsl #8
						sub	r5, r3, r6
						add	r4, r5, r7
						mov	r0, r4
						mov	r3, #1
						add	r2, sp, #0x10
						add	r1, sp, #0x60
						bl	bbea8
						ldrh	r1, [sp, #12]
						mov	r3, #1
						add	r2, sp, #0x10
						mul	r0, r1, r8
						add	r1, sp, #0x60
						add	r0, r0, #2
						bl	bbd28
						mov	r3, #1
						add	r2, sp, #0x10
						add	r1, sp, #0x60
						sub	r0, r4, #1
						bl	bbea8
						mov	r2, #0x200
						mov	r1, #0
						add	r0, sp, #0x60
						bl	bcf44
						mov	r2, #0x10
						mov	r1, #0
						add	r0, sp, #0x10
						bl	bcf44
						mov	r3, #0xff
						mov	r2, #0xff
						strb	r3, [sp, #20]
						strb	r2, [sp, #21]
						mov	r2, #0xff
						sub	r3, r5, #1
						mov	r1, #0xfb
						cmp	r3, #2
						strb	r2, [sp, #23]
						strb	r1, [sp, #22]
						bls	b78a0
						add	r4, r6, #2
						sub	r6, r7, r6
						sub	r5, r3, #2
						lsr	r3, r4, #8
						lsr	r2, r4, #16
						lsr	r1, r4, #24
						strb	r3, [sp, #17]
						strb	r2, [sp, #18]
						strb	r1, [sp, #19]
						mov	r3, #1
						add	r2, sp, #0x10
						add	r1, sp, #0x60
						add	r0, r6, r4
						strb	r4, [sp, #16]
						bl	bbea8
						add	r4, r4, #1
						subs	r5, r5, #1
						bne	b7808
						b	b78a0

b7848:					mov	r0, r6
						bl	bbde0
						cmp	r0, #1
						bne	b78a0
						ldrh	r2, [sp, #12]
						mov	r4, #0
						cmp	r2, #0
						ble	b78a0
b7868:		 			mla	r0, r2, r8, r4
						mov	r3, #1
						add	r2, sp, #0x50
						add	r1, sp, #0x60
						bl	bbd28
						mla	r0, r5, r6, r4
						mov	r3, #1
						add	r2, sp, #0x50
						add	r1, sp, #0x60
						bl	bbea8
						add	r4, r4, #1
						ldrh	r2, [sp, #12]
						cmp	r4, r2
						blt	b7868
b78a0:		 			ldr	r1, .x7904
						ldr	r3, .x7900
						mov	r2, #0xa0000000
						orr	r2, r2, #0x31000
						mov	r0, #0x21000
						str	r0, [r3]
						str	r2, [r1]
						mov	r1, #0
						mov	r0, #S3C2440_NAND_BASE
						bl	b7b44
						ldr	r2, .x78fc
						ldr	r1, .x78f8
						ldr	r3, .x78f4
						str	r0, [r2]
						str	r3, [r1]
						ldr	r0, [sp, #608]
						bl	bcf40
						mov	r0, #1
						add	sp, sp, #0x264
						pop	{r4, r5, r6, r7, r8, lr}
						bx	lr

.x78f4:		.word 	0x800231a0 	
.x78f8:		.word 	0x8006916c 	
.x78fc:		.word 	0x8006c660 	
.x7900:		.word 	0x8006ce80 	
.x7904:		.word 	0x8006c668 	
.x7908:		.word 	0xa0020110 	
.x790c:		.word 	0x55aa55aa 	
.x7910:		.word 	0xa0020170 	
.x7914:		.word 	0x80069140 	
.x7918:		.word 	0x8006c65c 	
  
b791c:				 	push	{r4, lr}
						mov	r4, r0
						bl	b6398
						bl	b6240
						bl	b62a0

						ldr	lr, .x79b4
						ldr	r2, .x79b0
						mov	r0, #0xa0000000
						ldr	r3, [lr, #8]
						mov	r1, #0	
						orr	r0, r0, #0x20000
						tst	r3, #0x2000
						ldr	r3, [r2]
						orrne	r3, r3, #1	
						biceq	r3, r3, #1	
						str	r3, [r2]
						bic	r3, r3, #2	
						str	r3, [r2]
b7964:	 				add	r3, r1, lr
						ldrb	r2, [r3, #208]
						add	r3, r1, r0
						add	r1, r1, #1	
						strb	r2, [r3, #336]
						cmp	r1, #9	
						blt	b7964
						mov	r1, #0	
b7984:	 				add	r3, r1, lr
						ldrb	r2, [r3, #217]
						add	r3, r1, r0
						add	r1, r1, #1	
						strb	r2, [r3, #345]
						cmp	r1, #0xd
						blt	b7984
						mov	r0, r4
						bl	coprocessor_01
						pop	{r4, lr}
						bx	lr

.x79b0:		.word 0xa0020018 	
.x79b4:		.word 0x8006c680 	

b79c0:				 	ldrh	r3, [r0]
						b	b79cc
b79c8:				 	ldrh	r3, [r0, #2]!
b79cc:				 	cmp	r3, #0
						bne	b79c8
						bx	lr
/* -------------------------------------------------------------------------
	DELAY : in r0  -> amount of delay
---------------------------------------------------------------------------- */
highdelay:				push	{r1, r2}
b79dc:	 				mov	r1, #33		@ 0x21
@b79dc:	 				mov	r1, #133
b79e0:	 				mov	r2, #100	@ 0x64
b79e4:	 				subs	r2, r2, #1
						bne	b79e4
						subs	r1, r1, #1
						bne	b79e0
						subs	r0, r0, #1
						bne	b79dc
						pop	{r1, r2}
						mov	pc, lr

lowdelay:				push	{r1, r2}
b7a08:	 				mov	r2, #3
b7a0c:					subs	r2, r2, #1
						bne	b7a0c
						subs	r0, r0, #1
						bne	b7a08
						pop	{r1, r2}
						bx	lr


b7a24:	 				push	{r4, r5, lr}
						mov	r1, #0xa0000000
						orr	r1, r1, #0x20000
						ldr	r3, [r1]
						ldr	r2, .x7b40
						mov	r4, #0
						cmp	r3, r2
						bne	b7b20
						ldrh	r3, [r1, #4]
						cmp	r3, #1	
						bne	b7b20
						ldrh	r3, [r1, #6]
						cmp	r3, #1	
						bne	b7b20
						cmp	r0, #1	
						beq	b7a94
						cmp	r0, #2	
						beq	b7a8c
						cmp	r0, #3	
						beq	b7a84
						cmp	r0, #5	
						bne	b7b20
						ldr	r4, .x7b3c
						b	b7b20
b7a84:				 	ldr	r4, .x7b38
						b	b7b20
b7a8c:	 				ldr	r4, .x7b34
						b	b7b20
b7a94:	 				ldr	r4, .x7b30
						ldrb	r3, [r4]
						cmp	r3, #0	
						bne	b7b20
						ldr	r1, .x7b2c
						mov	r2, #8	
						mov	r0, r4
						mov	r5, #8	
						bl	bd1ac
						mov	r1, #0	
						mov	r0, #S3C24X0_GPIO_BASE
						bl	b7b44
						ldr	r1, [r0, #0xb0]  		@ Gstatus1
						mov	r2, #0x1c
b7acc:	 				cmp	r5, #0xf
						bcs	b7af8
						lsr	r3, r1, r2
						sub	r2, r2, #4
						and	r3, r3, #15
						cmp	r3, #10
						addcc	r3, r3, #0x30
						addcs	r3, r3, #0x37
						strb	r3, [r5, r4]
						add	r5, r5, #1
						b	b7acc
b7af8:	 				cmp	r5, #0x10
						bcs	b7b20
						add	r3, r5, r4
						rsbs	r2, r5, #0x10
						mov	r1, #0
						beq	b7b20
						add	r2, r3, r2
b7b14:				 	strb	r1, [r3], #1
						cmp	r3, r2
						bne	b7b14
b7b20:				 	mov	r0, r4
						pop	{r4, r5, lr}
						bx	lr

.x7b2c:		.word 0x800225f0 	
.x7b30:		.word 0x80069148 	
.x7b34:		.word 0xa0020018 	
.x7b38:		.word 0x8006905c 	
.x7b3c:		.word 0xa0020044 	
.x7b40:		.word 0x53475241 	

b7b44:			 		push	{r4, lr}
						mov	r4, r0
						ldr	lr, .x7bbc
						mov	r0, #0	
						ldr	r3, [lr, #8]
						cmp	r3, #0	
						beq	b7bb4
b7b60:	 				ldr	r2, [lr, #4]
						cmp	r4, r2
						bcc	b7b80
						ldr	r3, [lr, #8]
						add	r3, r2, r3, lsl #20
						sub	r3, r3, #1	
						cmp	r4, r3
						bls	b7b90
b7b80:				 	add	lr, lr, #0xc
						ldr	r3, [lr, #8]
						cmp	r3, #0	
						bne	b7b60
b7b90:				 	ldr	r3, [lr, #8]
						cmp	r3, #0	
						beq	b7bb4
						ldr	r2, [lr]
						ldr	r3, [lr, #4]
						cmp	r1, #0	
						sub	r3, r2, r3
						add	r0, r3, r4
						orreq	r0, r0, #0x20000000      	
b7bb4:				 	pop	{r4, lr}
						bx	lr
.x7bbc:			.word 0x80022004 	
/*
    7bc0:	e92d4030 	push	{r4, r5, lr}
    7bc4:	e24dd050 	sub	sp, sp, #80	; 0x50
    7bc8:	e1a05001 	mov	r5, r1
    7bcc:	e1a04000 	mov	r4, r0
    7bd0:	e59f30b8 	ldr	r3, [pc, #184]	; 0x7c90
    7bd4:	e5933000 	ldr	r3, [r3]
    7bd8:	e58d304c 	str	r3, [sp, #76]
    7bdc:	e3740001 	cmn	r4, #1	; 0x1
    7be0:	0a000023 	beq	0x7c74
    7be4:	e3550000 	cmp	r5, #0	; 0x0
    7be8:	0a000021 	beq	0x7c74
    7bec:	e3a01000 	mov	r1, #0	; 0x0
    7bf0:	eb00047c 	bl	0x8de8
    7bf4:	e3500000 	cmp	r0, #0	; 0x0
    7bf8:	0a00001d 	beq	0x7c74
    7bfc:	e3a0204c 	mov	r2, #76	; 0x4c
    7c00:	e28d1000 	add	r1, sp, #0	; 0x0
    7c04:	e1a00004 	mov	r0, r4
    7c08:	eb0003e1 	bl	0x8b94
    7c0c:	e3500000 	cmp	r0, #0	; 0x0
    7c10:	0a000017 	beq	0x7c74
    7c14:	e59d2040 	ldr	r2, [sp, #64]
    7c18:	e59f306c 	ldr	r3, [pc, #108]	; 0x7c8c
    7c1c:	e1520003 	cmp	r2, r3
    7c20:	1a000013 	bne	0x7c74
    7c24:	e59d1048 	ldr	r1, [sp, #72]
    7c28:	e1a00004 	mov	r0, r4
    7c2c:	eb00046d 	bl	0x8de8
    7c30:	e3500000 	cmp	r0, #0	; 0x0
    7c34:	0a00000e 	beq	0x7c74
    7c38:	e3a02054 	mov	r2, #84	; 0x54
    7c3c:	e1a01005 	mov	r1, r5
    7c40:	e1a00004 	mov	r0, r4
    7c44:	eb0003d2 	bl	0x8b94
    7c48:	e3500000 	cmp	r0, #0	; 0x0
    7c4c:	0a000008 	beq	0x7c74
    7c50:	e3a01000 	mov	r1, #0	; 0x0
    7c54:	e1a00004 	mov	r0, r4
    7c58:	eb000462 	bl	0x8de8
    7c5c:	e3500000 	cmp	r0, #0	; 0x0
    7c60:	e59d004c 	ldr	r0, [sp, #76]
    7c64:	0a000003 	beq	0x7c78
    7c68:	eb0014b4 	bl	bcf40
    7c6c:	e3a00001 	mov	r0, #1	; 0x1
    7c70:	ea000002 	b	0x7c80
    7c74:	e59d004c 	ldr	r0, [sp, #76]
    7c78:	eb0014b0 	bl	bcf40
    7c7c:	e3a00000 	mov	r0, #0	; 0x0
    7c80:	e28dd050 	add	sp, sp, #80	; 0x50
    7c84:	e8bd4030 	pop	{r4, r5, lr}
    7c88:	e12fff1e 	bx	lr
    7c8c:	43454345 	movtmi	r4, #21317	; 0x5345
    7c90:	8006c65c 	andhi	ip, r6, ip, asr r6
    7c94:	e3a00001 	mov	r0, #1	; 0x1
    7c98:	e12fff1e 	bx	lr
    7c9c:	e92d4010 	push	{r4, lr}
    7ca0:	e59fe040 	ldr	lr, [pc, #64]	; 0x7ce8
    7ca4:	e59f4038 	ldr	r4, [pc, #56]	; 0x7ce4
    7ca8:	e3a00000 	mov	r0, #0	; 0x0
    7cac:	e59e2000 	ldr	r2, [lr]
    7cb0:	e3520000 	cmp	r2, #0	; 0x0
    7cb4:	05943000 	ldreq	r3, [r4]
    7cb8:	05932018 	ldreq	r2, [r3, #24]
    7cbc:	e5943000 	ldr	r3, [r4]
    7cc0:	058e2000 	streq	r2, [lr]
    7cc4:	e593301c 	ldr	r3, [r3, #28]
    7cc8:	e0433002 	sub	r3, r3, r2
    7ccc:	e1530001 	cmp	r3, r1
    7cd0:	80823001 	addhi	r3, r2, r1
    7cd4:	858e3000 	strhi	r3, [lr]
    7cd8:	81a00002 	movhi	r0, r2
    7cdc:	e8bd4010 	pop	{r4, lr}
    7ce0:	e12fff1e 	bx	lr

    7ce4:	800230ac 	andhi	r3, r2, ip, lsr #1
    7ce8:	8006915c 	andhi	r9, r6, ip, asr r1
    7cec:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    7cf0:	e24dd05c 	sub	sp, sp, #92	; 0x5c
    7cf4:	e1a05001 	mov	r5, r1
    7cf8:	e1a06000 	mov	r6, r0
    7cfc:	e59f40f8 	ldr	r4, [pc, #248]	; 0x7dfc
    7d00:	e5943008 	ldr	r3, [r4, #8]
    7d04:	e3530000 	cmp	r3, #0	; 0x0
    7d08:	0a00002c 	beq	0x7dc0
    7d0c:	e5943000 	ldr	r3, [r4]
    7d10:	e5931034 	ldr	r1, [r3, #52]
    7d14:	eb000433 	bl	0x8de8
    7d18:	e3500000 	cmp	r0, #0	; 0x0
    7d1c:	0a000033 	beq	0x7df0
    7d20:	e5942000 	ldr	r2, [r4]
    7d24:	e3a09000 	mov	r9, #0	; 0x0
    7d28:	e5923038 	ldr	r3, [r2, #56]
    7d2c:	e2827044 	add	r7, r2, #68	; 0x44
    7d30:	e3530000 	cmp	r3, #0	; 0x0
    7d34:	9a00001d 	bls	0x7db0
    7d38:	e59f80b8 	ldr	r8, [pc, #184]	; 0x7df8
    7d3c:	e1d720b0 	ldrh	r2, [r7]
    7d40:	e1a01008 	mov	r1, r8
    7d44:	e1a00006 	mov	r0, r6
    7d48:	eb000391 	bl	0x8b94
    7d4c:	e3500000 	cmp	r0, #0	; 0x0
    7d50:	0a000026 	beq	0x7df0
    7d54:	e1d7e0b0 	ldrh	lr, [r7]
    7d58:	e3a02a01 	mov	r2, #4096	; 0x1000
    7d5c:	e35e0a01 	cmp	lr, #4096	; 0x1000
    7d60:	1a000003 	bne	0x7d74
    7d64:	e1a01008 	mov	r1, r8
    7d68:	e1a00005 	mov	r0, r5
    7d6c:	eb00150e 	bl	bd1ac
    7d70:	ea000007 	b	0x7d94
    7d74:	e5940004 	ldr	r0, [r4, #4]
    7d78:	e3a03a01 	mov	r3, #4096	; 0x1000
    7d7c:	e1a01005 	mov	r1, r5
    7d80:	e58de004 	str	lr, [sp, #4]
    7d84:	e58d8000 	str	r8, [sp]
    7d88:	eb00021a 	bl	0x85f8
    7d8c:	e3500a01 	cmp	r0, #4096	; 0x1000
    7d90:	1a000016 	bne	0x7df0
    7d94:	e5943000 	ldr	r3, [r4]
    7d98:	e2899001 	add	r9, r9, #1	; 0x1
    7d9c:	e2877002 	add	r7, r7, #2	; 0x2
    7da0:	e5933038 	ldr	r3, [r3, #56]
    7da4:	e2855a01 	add	r5, r5, #4096	; 0x1000
    7da8:	e1590003 	cmp	r9, r3
    7dac:	3affffe2 	bcc	0x7d3c
    7db0:	e3a00001 	mov	r0, #1	; 0x1
    7db4:	e28dd05c 	add	sp, sp, #92	; 0x5c
    7db8:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    7dbc:	e12fff1e 	bx	lr

    7dc0:	e28d1008 	add	r1, sp, #8	; 0x8
    7dc4:	ebffff7d 	bl	0x7bc0
    7dc8:	e3500000 	cmp	r0, #0	; 0x0
    7dcc:	0a000007 	beq	0x7df0
    7dd0:	e59d2014 	ldr	r2, [sp, #20]
    7dd4:	e59d3010 	ldr	r3, [sp, #16]
    7dd8:	e1a01005 	mov	r1, r5
    7ddc:	e1a00006 	mov	r0, r6
    7de0:	e0422003 	sub	r2, r2, r3
    7de4:	eb00036a 	bl	0x8b94
    7de8:	e3500000 	cmp	r0, #0	; 0x0
    7dec:	1affffef 	bne	0x7db0
    7df0:	e3a00000 	mov	r0, #0	; 0x0
    7df4:	eaffffee 	b	0x7db4
    7df8:	8006cea0 	andhi	ip, r6, r0, lsr #29
    7dfc:	80069160 	andhi	r9, r6, r0, ror #2
    7e00:	e92d4070 	push	{r4, r5, r6, lr}
    7e04:	e1a06001 	mov	r6, r1
    7e08:	e1a05000 	mov	r5, r0
    7e0c:	e3a00000 	mov	r0, #0	; 0x0
    7e10:	ebffffa1 	bl	0x7c9c
    7e14:	e59f4068 	ldr	r4, [pc, #104]	; 0x7e84
    7e18:	e3500000 	cmp	r0, #0	; 0x0
    7e1c:	e5840000 	str	r0, [r4]
    7e20:	0a000010 	beq	0x7e68
    7e24:	e3a01000 	mov	r1, #0	; 0x0
    7e28:	e1a00005 	mov	r0, r5
    7e2c:	eb0003ed 	bl	0x8de8
    7e30:	e3500000 	cmp	r0, #0	; 0x0
    7e34:	0a00000b 	beq	0x7e68
    7e38:	e5941000 	ldr	r1, [r4]
    7e3c:	e1a02006 	mov	r2, r6
    7e40:	e1a00005 	mov	r0, r5
    7e44:	eb000352 	bl	0x8b94
    7e48:	e3500000 	cmp	r0, #0	; 0x0
    7e4c:	e3a00000 	mov	r0, #0	; 0x0
    7e50:	0a000008 	beq	0x7e78
    7e54:	e59f1024 	ldr	r1, [pc, #36]	; 0x7e80
    7e58:	eb0001e2 	bl	0x85e8
    7e5c:	e3500000 	cmp	r0, #0	; 0x0
    7e60:	e5840004 	str	r0, [r4, #4]
    7e64:	1a000002 	bne	0x7e74
    7e68:	e3a00000 	mov	r0, #0	; 0x0
    7e6c:	e8bd4070 	pop	{r4, r5, r6, lr}
    7e70:	e12fff1e 	bx	lr

    7e74:	e3a00001 	mov	r0, #1	; 0x1
    7e78:	e8bd4070 	pop	{r4, r5, r6, lr}
    7e7c:	e12fff1e 	bx	lr
*/
.x7e80:	.word 0x80024c9c 	
.x7e84:	.word 0x80069160 	

b7e88:				 	push	{r4, r5, r6, r7, lr}

/*    7e8c:	e24dd058 	sub	sp, sp, #88	; 0x58
    7e90:	e1a05001 	mov	r5, r1
    7e94:	e1a04000 	mov	r4, r0
    7e98:	e59f3158 	ldr	r3, .x7ff8
    7e9c:	e5933000 	ldr	r3, [r3]
    7ea0:	e58d3054 	str	r3, [sp, #84]
    7ea4:	e3740001 	cmn	r4, #1	
    7ea8:	0a000048 	beq	b7fd0
    7eac:	e3550000 	cmp	r5, #0	
    7eb0:	0a000046 	beq	b7fd0
    7eb4:	e3a01000 	mov	r1, #0	
    7eb8:	eb0003ca 	bl	0x8de8
    7ebc:	e3500000 	cmp	r0, #0	
    7ec0:	0a000042 	beq	0x7fd0
    7ec4:	e3a0204c 	mov	r2, #76	; 0x4c
    7ec8:	e28d1008 	add	r1, sp, #8	; 0x8
    7ecc:	e1a00004 	mov	r0, r4
    7ed0:	eb00032f 	bl	0x8b94
    7ed4:	e3500000 	cmp	r0, #0	; 0x0
    7ed8:	0a00003c 	beq	0x7fd0
    7edc:	e59f3110 	ldr	r3, [pc, #272]	; 0x7ff4
    7ee0:	e59d2048 	ldr	r2, [sp, #72]
    7ee4:	e1520003 	cmp	r2, r3
    7ee8:	1a00002d 	bne	0x7fa4
    7eec:	e59d3038 	ldr	r3, [sp, #56]
    7ef0:	e3530005 	cmp	r3, #5	; 0x5
    7ef4:	1a000035 	bne	0x7fd0
    7ef8:	e59d3044 	ldr	r3, [sp, #68]
    7efc:	e3530a01 	cmp	r3, #4096	; 0x1000
    7f00:	1a000032 	bne	0x7fd0
    7f04:	e59d103c 	ldr	r1, [sp, #60]
    7f08:	e1a00004 	mov	r0, r4
    7f0c:	ebffffbb 	bl	0x7e00
    7f10:	e3500000 	cmp	r0, #0	; 0x0
    7f14:	0a00002d 	beq	0x7fd0
    7f18:	e59f60d0 	ldr	r6, [pc, #208]	; 0x7ff0
    7f1c:	e3a02001 	mov	r2, #1	; 0x1
    7f20:	e1a00004 	mov	r0, r4
    7f24:	e5963000 	ldr	r3, [r6]
    7f28:	e5862008 	str	r2, [r6, #8]
    7f2c:	e5931034 	ldr	r1, [r3, #52]
    7f30:	eb0003ac 	bl	0x8de8
    7f34:	e3500000 	cmp	r0, #0	; 0x0
    7f38:	0a000024 	beq	0x7fd0
    7f3c:	e5963000 	ldr	r3, [r6]
    7f40:	e59f70a4 	ldr	r7, [pc, #164]	; 0x7fec
    7f44:	e1a00004 	mov	r0, r4
    7f48:	e1d344b4 	ldrh	r4, [r3, #68]
    7f4c:	e1a01007 	mov	r1, r7
    7f50:	e1a02004 	mov	r2, r4
    7f54:	eb00030e 	bl	0x8b94
    7f58:	e3500000 	cmp	r0, #0	; 0x0
    7f5c:	0a00001b 	beq	0x7fd0
    7f60:	e3540a01 	cmp	r4, #4096	; 0x1000
    7f64:	1a000004 	bne	0x7f7c
    7f68:	e28d0008 	add	r0, sp, #8	; 0x8
    7f6c:	e3a0204c 	mov	r2, #76	; 0x4c
    7f70:	e1a01007 	mov	r1, r7
    7f74:	eb00148c 	bl	bd1ac
    7f78:	ea000008 	b	0x7fa0
    7f7c:	e5960004 	ldr	r0, [r6, #4]
    7f80:	e3a0304c 	mov	r3, #76	; 0x4c
    7f84:	e3a02a01 	mov	r2, #4096	; 0x1000
    7f88:	e28d1008 	add	r1, sp, #8	; 0x8
    7f8c:	e58d4004 	str	r4, [sp, #4]
    7f90:	e58d7000 	str	r7, [sp]
    7f94:	eb000197 	bl	0x85f8
    7f98:	e350004c 	cmp	r0, #76	; 0x4c
    7f9c:	1a00000b 	bne	0x7fd0
    7fa0:	e59d2048 	ldr	r2, [sp, #72]
    7fa4:	e59f303c 	ldr	r3, .x7fe8
    7fa8:	e1520003 	cmp	r2, r3
    7fac:	1a000007 	bne	0x7fd0
    7fb0:	e59d2050 	ldr	r2, [sp, #80]
    7fb4:	e59d304c 	ldr	r3, [sp, #76]
    7fb8:	e0433002 	sub	r3, r3, r2
    7fbc:	e5853000 	str	r3, [r5]
    7fc0:	e59d0054 	ldr	r0, [sp, #84]
    7fc4:	eb0013dd 	bl	bcf40
    7fc8:	e3a00001 	mov	r0, #1	; 0x1
    7fcc:	ea000002 	b	0x7fdc
    b7fd0:	e59d0054 	ldr	r0, [sp, #84]
    7fd4:	eb0013d9 	bl	bcf40
    7fd8:	e3a00000 	mov	r0, #0	; 0x0
    7fdc:	e28dd058 	add	sp, sp, #88	; 0x58
*/
						pop	{r4, r5, r6, r7, lr}
						bx	lr

.x7fe8:	.word 	0x43454345 	
.x7fec:	.word 	0x8006cea0 	
.x7ff0:	.word 	0x80069160 	
.x7ff4:	.word 	0x58505253 	
.x7ff8:	.word 	0x8006c65c 	

sysinit_mmu:		 	push	{r4, r5, r6, r7, r8, r9, lr}
						sub	sp, sp, #924	@ 0x39c
						ldr	r3, .x83c4
						mov	r2, #0	
						str	r2, [sp, #4]
						ldr	r5, [r3]
						cmn	r5, #1	
						moveq	r3, #0	
						beq	b8090
						ldr	r3, [r5, #32]
						mov	r6, #0	
						cmp	r3, #0	
						bls	b808c
						mov	r7, #0
b8034:	 				ldr	r3, [r5, #36]
						add	r4, r7, r3
						ldr	r3, [r4, #8]
						cmp	r3, #0	
						ldrne	r1, [r4]
						ldrne	r0, [r4, #4]
						movne	r2, r3
						blne	bd1ac
						ldr	r2, [r4, #12]
						ldr	r3, [r4, #8]
						cmp	r3, r2
						movne	r0, r3
						ldrne	r3, [r4, #4]
						subne	r2, r2, r0
						movne	r1, #0	
						addne	r0, r0, r3
						blne	bcf44
						ldr	r3, [r5, #32]
						add	r6, r6, #1	
						add	r7, r7, #0x10
						cmp	r6, r3
						bcc	b8034

b808c:	 				mov	r3, #1	
b8090:	 				cmp	r3, #0	
x8094:	 				bne	b809c
stophere7:			 	b	stophere7

b809c:				 	bl	goforce_preinit
						cmp	r0, #0
						bne	b80ac
stophere4:			 	b	stophere4

b80ac:				 	mov	r2, #0x380
						mov	r1, #0
						add	r0, sp, #0x1c
						bl	bcf44
						ldr	r7, .x83c0
						ldr	r8, .x83bc
						ldr	r3, .x83b8
						ldr	r2, .x83b4
						ldr	lr, [r7]
						ldr	r4, [r8]
						ldr	r1, [r3]
						ldr	r0, [r2]
						mov	r5, #1	
						mov	r6, #1	
						mov	r9, #0	
						add	r3, sp, #0x1c
						mov	r2, #0
						str	lr, [sp, #812]
						str	r4, [sp, #840]
						str	r5, [sp, #808]
						str	r6, [sp, #836]
						str	r9, [sp]
						bl	b8e50
						cmp	r0, #0	
						bne	b8138
						ldr	r2, .x83b0
						ldr	r3, [r2, #20]
						cmp	r3, #0
						ldrne	r3, .x83ac
						ldrne	r2, [r2, #20]   
						movne	r0, #1
						ldrne	r1, [r3, #4]
						movne	lr, pc
						bxne	r2
stophere5:			 	b	stophere5
b8138:			 		bl	b6414

						cmp	r0, #1
						moveq	r5, #0x20
						movne	r5, #0x22
						mov	r4, #1	
						mov	r2, r5
						mov	r3, #0	
						mvn	r1, #0	
						mvn	r0, #0	
						str	r4, [sp]
						bl	fat_01
						mov	r6, r0
						cmn	r6, #1	
						bne	b81f0
						cmp	r5, #0x22
						bne	b81c8
						mov	r3, #0	
						mov	r2, #0x23
						mvn	r1, #0	
						mvn	r0, #0	
						mov	r5, #0x23
						str	r4, [sp]
						bl	fat_01
						mov	r6, r0
						cmn	r6, #1	
						bne	b81f0
						mov	r3, #0	
						mov	r2, #0x20
						mvn	r1, #0	
						mvn	r0, #0	
						mov	r5, #0x20
						str	r4, [sp]
						bl	fat_01
						mov	r6, r0
						cmn	r6, #1
						bne	b81f0
b81c8:	 				ldr	r2, .x83b0
						ldr	r3, [r2, #20]
						cmp	r3, #0	
						ldrne	r3, .x83ac
						ldrne	r2, [r2, #20]
						movne	r0, #2	
						ldrne	r1, [r3, #8]
						movne	lr, pc
						bxne	r2
stophere8:	 			b	stophere8

b81f0:					add	r0, sp, #0xc
						bl	ba044
						cmp	r0, #0
						bne	b8228
						ldr	r2, .x83b0
						ldr	r3, [r2, #20]
						cmp	r3, #0
						ldrne	r3, .x83ac
						ldrne	r2, [r2, #20]
						movne	r0, #3
						ldrne	r1, [r3, #12]
						movne	lr, pc
						bxne	r2
stophere9:	 			b	stophere9

b8228:				 	ldr	r4, .x83b0
						ldrh	r3, [sp, #26]
						cmp	r5, #0x22
						strh	r3, [r4]
						beq	b8260
						cmp	r5, #0x23
						beq	b8260
						cmp	r5, #0x20
						bne	b8270
						mov	r0, #0	
						bl	ba014
						mov	r0, #1	
						bl	ba014
						b	b8270
b8260:	 				mov	r0, #0	
						bl	b9ff8
						mov	r0, #1	
						bl	b9ff8
						add	r1, sp, #4	
						mov	r0, r6
						bl	b7e88
						cmp	r0, #0
						bne	b82a8
						ldr	r3, [r4, #20]
						cmp	r3, #0
						ldrne	r3, .x83ac
						ldrne	r2, [r4, #20]
						movne	r0, #4	
						ldrne	r1, [r3, #16]
						movne	lr, pc
						bxne	r2
stophere10:	 			b	stophere10

b82a8:				 	ldr	r1, [sp, #4]
						add	r2, sp, #4
						mov	r0, r5
						bl	b64e8
/*
    82b8:	e3500000 	cmp	r0, #0	; 0x0
    82bc:	1a000008 	bne	0x82e4
    82c0:	e5943014 	ldr	r3, [r4, #20]
    82c4:	e3530000 	cmp	r3, #0	; 0x0
    82c8:	159f30dc 	ldrne	r3, .x83ac
    82cc:	15942014 	ldrne	r2, [r4, #20]
    82d0:	13a00005 	movne	r0, #5	; 0x5
    82d4:	15931014 	ldrne	r1, [r3, #20]
    82d8:	11a0e00f 	movne	lr, pc
    82dc:	112fff12 	bxne	r2
    82e0:	eafffffe 	b	0x82e0
    82e4:	e5972000 	ldr	r2, [r7]
    82e8:	e59d0004 	ldr	r0, [sp, #4]
    82ec:	e1500002 	cmp	r0, r2
    82f0:	3a000004 	bcc	0x8308
    82f4:	e5983000 	ldr	r3, [r8]
    82f8:	e0833002 	add	r3, r3, r2
    82fc:	e1500003 	cmp	r0, r3
    8300:	33a03001 	movcc	r3, #1	; 0x1
    8304:	3a000000 	bcc	0x830c
    8308:	e3a03000 	mov	r3, #0	; 0x0
    830c:	e59f5098 	ldr	r5, .x83ac
    8310:	e21330ff 	ands	r3, r3, #255	; 0xff
    8314:	1a000014 	bne	0x836c
    8318:	e5943014 	ldr	r3, [r4, #20]
    831c:	e3530000 	cmp	r3, #0	; 0x0
    8320:	0a000004 	beq	0x8338
    8324:	e5951020 	ldr	r1, [r5, #32]
    8328:	e3a00008 	mov	r0, #8	; 0x8
    832c:	e1a0e00f 	mov	lr, pc
    8330:	e12fff13 	bx	r3
    8334:	e59d0004 	ldr	r0, [sp, #4]
    8338:	e1a01000 	mov	r1, r0
    833c:	e1a00006 	mov	r0, r6
    8340:	ebfffe69 	bl	0x7cec
    8344:	e3500000 	cmp	r0, #0	; 0x0
    8348:	1a000006 	bne	0x8368
    834c:	e5943014 	ldr	r3, [r4, #20]
    8350:	e3530000 	cmp	r3, #0	; 0x0
    8354:	15951018 	ldrne	r1, [r5, #24]
    8358:	13a00006 	movne	r0, #6	; 0x6
    835c:	11a0e00f 	movne	lr, pc
    8360:	112fff13 	bxne	r3
    8364:	eafffffe 	b	0x8364
    8368:	e59d0004 	ldr	r0, [sp, #4]
    836c:	e5943014 	ldr	r3, [r4, #20]
    8370:	e3530000 	cmp	r3, #0	; 0x0
    8374:	0a000004 	beq	0x838c
    8378:	e5951024 	ldr	r1, [r5, #36]
    837c:	e3a00009 	mov	r0, #9	; 0x9
    8380:	e1a0e00f 	mov	lr, pc
    8384:	e12fff13 	bx	r3
    8388:	e59d0004 	ldr	r0, [sp, #4]
    838c:	ebfffd62 	bl	b791c
    8390:	e5943014 	ldr	r3, [r4, #20]
    8394:	e3530000 	cmp	r3, #0	; 0x0
    8398:	1595101c 	ldrne	r1, [r5, #28]
    839c:	13a00007 	movne	r0, #7	; 0x7
    83a0:	11a0e00f 	movne	lr, pc
    83a4:	112fff13 	bxne	r3
    83a8:	eafffffe 	b	0x83a8
*/
.x83ac:	.word 0x80069098 	
.x83b0:	.word 0x80069158 	
.x83b4:	.word 0x8006c668 	
.x83b8:	.word 0x8006ce80 	
.x83bc:	.word 0x8006c664 	
.x83c0:	.word 0x8006c660 	
.x83c4:	.word 0x800230ac 	
        
b83c8:			push	{lr}		@ (str lr, [sp, #-4]!)
				ldr	r2, .x83f4
				ldr	r3, [r2]
				cmp	r3, #0
				strbne	r0, [r3], #1
				strne	r3, [r2]
				popne	{lr}		@ (ldrne lr, [sp], #4)
				bxne	lr
				pop	{lr}			@ (ldr lr, [sp], #4)
				bx	lr

.x83f4:	.word 	0x8006ce84 	
 
b83f8:	 				push	{r4, lr}
						cmp	r1, #0
						mov	r4, r0
						subne	r1, r1, #0x1
						bics	ip, r4, #0xf
						bne	b8418
						cmp	r1, #0
						beq	b8424
b8418:	 				lsr	r0, r4, #4
						bl	b83f8
						and	r4, r4, #0xf
b8424:				 	cmp	r4, #0xa
						addcc	r3, r4, #0x30
						addcs	r3, r4, #0x37
						and	r0, r3, #0xff
						bl	b83c8
						pop	{r4, lr}
						bx	lr

b8440:				 	push	{r4, lr}
						mov	r4, r0
						cmp	r4, #0xa
						ldrcs	r3, [pc, #36]	@ 0x8478
						umullcs	r2, r3, r4, r3
						lsrcs	r0, r3, #3
						addcs	r3, r0, r0, lsl #2
						subcs	r4, r4, r3, lsl #1
						blcs	b8440
						add	r3, r4, #0x30
						and	r0, r3, #0xff
						bl	b83c8
						pop	{r4, lr}
						bx	lr
    
.x8478:			.word			0xcccccccd

b847c:	 				mov	ip, sp
						push	{r0, r1, r2, r3}
						push	{r4, r5, r6, ip, lr}
						mov	r6, r0
						add	r4, sp, #0x18
						b	b85d4

cr_lf:			 		add	r6, r6, #1		@ 0x8494
						cmp	r5, #0xa
						beq	b85c4
						cmp	r5, #0xd
						beq	b85b4
						cmp	r5, #0x25
						bne	b85cc
						ldrb	r3, [r6], #1
						str	r6, [sp, #20]
						cmp	r3, #0x63
						bgt	b8510
						beq	b8504
						cmp	r3, #0x25
						beq	b84fc
						cmp	r3, #0x42
						beq	b84f4
						cmp	r3, #0x48
						beq	b84ec
						cmp	r3, #0x58
						bne	b8530
						mov	r1, #8
						b	b853c
b84ec:				 	mov	r1, #4
						b	b853c
b84f4:				 	mov	r1, #0x2
						b	b853c
b84fc:				 	mov	r0, #0x25
						b	b85d0
b8504:				 	add	r4, r4, #4
						ldrb	r0, [r4, #-4]
						b	b85d0
b8510:					cmp	r3, #0x64
						beq	b858c
						cmp	r3, #0x73
						beq	b855c
						cmp	r3, #0x75
						beq	b854c
						cmp	r3, #0x78
						beq	b8538
b8530:				 	mov	r0, #0x20
						b	b85d0
b8538:	 				mov	r1, #0x0
b853c:				 	add	r4, r4, #0x4
						ldr	r0, [r4, #-4]
						bl	b83f8
						b	b85d4
b854c:				 	add	r4, r4, #0x4
						ldr	r0, [r4, #-4]
						bl	b8440
						b	b85d4
b855c:			 		add	r4, r4, #0x4
						ldr	r5, [r4, #-4]
						b	b857c
b8568:			 		cmp	r3, #0xa
						moveq	r0, #0xd
						ldrb	r0, [r5], #1
b857c:				 	ldrb	r3, [r5]
						cmp	r3, #0
						bne	b8568
						b	b85d4
b858c:	 				add	r4, r4, #4
						ldr	r3, [r4, #-4]
						movs	r5, r3
						bpl	b85a8
						mov	r0, #0x2d
						bl	b83c8
						rsb	r5, r5, #0
b85a8:				 	mov	r0, r5
						bl	b8440
						b	b85d4

b85b4:					ldrb	r3, [r6]
						mov	r5, #0xa
						cmp	r3, #0xa
						addeq	r6, r6, #1
b85c4:					mov	r0, #0xd
						bl	b83c8
b85cc:					mov	r0, r5
b85d0:					bl	b83c8

b85d4:					ldrb	r5, [r6]
						cmp	r5, #0
						bne	cr_lf
						ldm	sp, {r4, r5, r6, sp, lr}
						bx	lr
/*
    85e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    85ec:	eb001c74 	bl	0xf7c4
    85f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    85f4:	e12fff1e 	bx	lr
    85f8:	e92d4010 	push	{r4, lr}
    85fc:	e24dd008 	sub	sp, sp, #8	; 0x8
    8600:	e59de014 	ldr	lr, [sp, #20]
    8604:	e59d4010 	ldr	r4, [sp, #16]
    8608:	e58de004 	str	lr, [sp, #4]
    860c:	e58d4000 	str	r4, [sp]
    8610:	eb001c11 	bl	0xf65c
    8614:	e28dd008 	add	sp, sp, #8	; 0x8
    8618:	e8bd4010 	pop	{r4, lr}
    861c:	e12fff1e 	bx	lr
    8620:	e1a0c00d 	mov	ip, sp
    8624:	e92d000f 	push	{r0, r1, r2, r3}
    8628:	e92d5070 	push	{r4, r5, r6, ip, lr}
    862c:	e24dd00c 	sub	sp, sp, #12	; 0xc
    8630:	e1a0e003 	mov	lr, r3
    8634:	e3520000 	cmp	r2, #0	; 0x0
    8638:	e1a05000 	mov	r5, r0
    863c:	059d1030 	ldreq	r1, [sp, #48]
    8640:	05852000 	streq	r2, [r5]
    8644:	0585e004 	streq	lr, [r5, #4]
    8648:	05851008 	streq	r1, [r5, #8]
    864c:	0a000011 	beq	0x8698
    8650:	e1d140bc 	ldrh	r4, [r1, #12]
    8654:	e5913004 	ldr	r3, [r1, #4]
    8658:	e1a0100e 	mov	r1, lr
    865c:	e3a06000 	mov	r6, #0	; 0x0
    8660:	e0000493 	mul	r0, r3, r4
    8664:	eb001297 	bl	0xd0c8
    8668:	e1a03000 	mov	r3, r0
    866c:	e1a00004 	mov	r0, r4
    8670:	e1cd30b4 	strh	r3, [sp, #4]
    8674:	eb001293 	bl	0xd0c8
    8678:	e2813001 	add	r3, r1, #1	; 0x1
    867c:	e1cd30b8 	strh	r3, [sp, #8]
    8680:	e59d3008 	ldr	r3, [sp, #8]
    8684:	e1cd00b6 	strh	r0, [sp, #6]
    8688:	e59d2004 	ldr	r2, [sp, #4]
    868c:	e5853008 	str	r3, [r5, #8]
    8690:	e5856000 	str	r6, [r5]
    8694:	e5852004 	str	r2, [r5, #4]
    8698:	e1a00005 	mov	r0, r5
    869c:	e28dd00c 	add	sp, sp, #12	; 0xc
    86a0:	e89d6070 	ldm	sp, {r4, r5, r6, sp, lr}
    86a4:	e12fff1e 	bx	lr
    86a8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    86ac:	e24dd044 	sub	sp, sp, #68	; 0x44
    86b0:	e1a06003 	mov	r6, r3
    86b4:	e1a07002 	mov	r7, r2
    86b8:	e1a05001 	mov	r5, r1
    86bc:	e1a0a000 	mov	sl, r0
    86c0:	e3a0200f 	mov	r2, #15	; 0xf
    86c4:	e3a01000 	mov	r1, #0	; 0x0
    86c8:	e28d0035 	add	r0, sp, #53	; 0x35
    86cc:	eb00121c 	bl	bcf44
    86d0:	e59f90ec 	ldr	r9, [pc, #236]	; 0x87c4
    86d4:	e5dde064 	ldrb	lr, [sp, #100]
    86d8:	e59d400c 	ldr	r4, [sp, #12]
    86dc:	e1a01009 	mov	r1, r9
    86e0:	e3a02001 	mov	r2, #1	; 0x1
    86e4:	e1a03005 	mov	r3, r5
    86e8:	e28d0014 	add	r0, sp, #20	; 0x14
    86ec:	e5cde034 	strb	lr, [sp, #52]
    86f0:	e0858007 	add	r8, r5, r7
    86f4:	e5cd6038 	strb	r6, [sp, #56]
    86f8:	e58d503c 	str	r5, [sp, #60]
    86fc:	e58d7040 	str	r7, [sp, #64]
    8700:	e58d4000 	str	r4, [sp]
    8704:	ebffffc5 	bl	0x8620
    8708:	e5903000 	ldr	r3, [r0]
    870c:	e5901004 	ldr	r1, [r0, #4]
    8710:	e5900008 	ldr	r0, [r0, #8]
    8714:	e59de01c 	ldr	lr, [sp, #28]
    8718:	e58d3004 	str	r3, [sp, #4]
    871c:	e58d000c 	str	r0, [sp, #12]
    8720:	e58d1008 	str	r1, [sp, #8]
    8724:	e28d0024 	add	r0, sp, #36	; 0x24
    8728:	e3a02001 	mov	r2, #1	; 0x1
    872c:	e2483001 	sub	r3, r8, #1	; 0x1
    8730:	e1a01009 	mov	r1, r9
    8734:	e58de000 	str	lr, [sp]
    8738:	ebffffb8 	bl	0x8620
    873c:	e5903008 	ldr	r3, [r0, #8]
    8740:	e5902004 	ldr	r2, [r0, #4]
    8744:	e1dde0bc 	ldrh	lr, [sp, #12]
    8748:	e1dd70b8 	ldrh	r7, [sp, #8]
    874c:	e5991034 	ldr	r1, [r9, #52]
    8750:	e58d301c 	str	r3, [sp, #28]
    8754:	e1dd31bc 	ldrh	r3, [sp, #28]
    8758:	e58d2018 	str	r2, [sp, #24]
    875c:	e1dd81b8 	ldrh	r8, [sp, #24]
    8760:	e02e2127 	eor	r2, lr, r7, lsr #2
    8764:	e081e20a 	add	lr, r1, sl, lsl #4
    8768:	e0233128 	eor	r3, r3, r8, lsr #2
    876c:	e5904000 	ldr	r4, [r0]
    8770:	e1dd50ba 	ldrh	r5, [sp, #10]
    8774:	e1dd61ba 	ldrh	r6, [sp, #26]
    8778:	e202103f 	and	r1, r2, #63	; 0x3f
    877c:	e203303f 	and	r3, r3, #63	; 0x3f
    8780:	e28e2c01 	add	r2, lr, #256	; 0x100
    8784:	e0233128 	eor	r3, r3, r8, lsr #2
    8788:	e021e127 	eor	lr, r1, r7, lsr #2
    878c:	e28200be 	add	r0, r2, #190	; 0xbe
    8790:	e28d1034 	add	r1, sp, #52	; 0x34
    8794:	e3a02010 	mov	r2, #16	; 0x10
    8798:	e5cd303a 	strb	r3, [sp, #58]
    879c:	e58d4014 	str	r4, [sp, #20]
    87a0:	e5cd7037 	strb	r7, [sp, #55]
    87a4:	e5cd5035 	strb	r5, [sp, #53]
    87a8:	e5cde036 	strb	lr, [sp, #54]
    87ac:	e5cd803b 	strb	r8, [sp, #59]
    87b0:	e5cd6039 	strb	r6, [sp, #57]
    87b4:	eb00127c 	bl	bd1ac
    87b8:	e28dd044 	add	sp, sp, #68	; 0x44
    87bc:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    87c0:	e12fff1e 	bx	lr
    87c4:	80069794 	mulhi	r6, r4, r7
    87c8:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    87cc:	e59f4070 	ldr	r4, [pc, #112]	; 0x8844
    87d0:	e5940000 	ldr	r0, [r4]
    87d4:	e3500000 	cmp	r0, #0	; 0x0
    87d8:	1a000016 	bne	0x8838
    87dc:	e59f305c 	ldr	r3, [pc, #92]	; 0x8840
    87e0:	e1d471b8 	ldrh	r7, [r4, #24]
    87e4:	e5931000 	ldr	r1, [r3]
    87e8:	e1a00007 	mov	r0, r7
    87ec:	eb001235 	bl	0xd0c8
    87f0:	e5943010 	ldr	r3, [r4, #16]
    87f4:	e1a06000 	mov	r6, r0
    87f8:	e1a05006 	mov	r5, r6
    87fc:	e1560003 	cmp	r6, r3
    8800:	2a000008 	bcs	0x8828
    8804:	e1a00005 	mov	r0, r5
    8808:	eb000d59 	bl	bbd74
    880c:	e5943010 	ldr	r3, [r4, #16]
    8810:	e310000a 	tst	r0, #10	; 0xa
    8814:	e2855001 	add	r5, r5, #1	; 0x1
    8818:	12866001 	addne	r6, r6, #1	; 0x1
    881c:	e1550003 	cmp	r5, r3
    8820:	3afffff7 	bcc	0x8804
    8824:	e1d471b8 	ldrh	r7, [r4, #24]
    8828:	e0433006 	sub	r3, r3, r6
    882c:	e0020793 	mul	r2, r3, r7
    8830:	e2420001 	sub	r0, r2, #1	; 0x1
    8834:	e5840000 	str	r0, [r4]
    8838:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    883c:	e12fff1e 	bx	lr
    8840:	800690c0 	andhi	r9, r6, r0, asr #1
    8844:	80069788 	andhi	r9, r6, r8, lsl #15
    8848:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    884c:	e1a08000 	mov	r8, r0
    8850:	e59f60a4 	ldr	r6, [pc, #164]	; 0x88fc
    8854:	e1a01008 	mov	r1, r8
    8858:	e1d670bc 	ldrh	r7, [r6, #12]
    885c:	e1a00007 	mov	r0, r7
    8860:	eb001218 	bl	0xd0c8
    8864:	e59f308c 	ldr	r3, [pc, #140]	; 0x88f8
    8868:	e1a05000 	mov	r5, r0
    886c:	e5931000 	ldr	r1, [r3]
    8870:	e3710001 	cmn	r1, #1	; 0x1
    8874:	0a00001c 	beq	0x88ec
    8878:	e1a00007 	mov	r0, r7
    887c:	eb001211 	bl	0xd0c8
    8880:	e5963004 	ldr	r3, [r6, #4]
    8884:	e1a04000 	mov	r4, r0
    8888:	e1550003 	cmp	r5, r3
    888c:	2a000016 	bcs	0x88ec
    8890:	e3550000 	cmp	r5, #0	; 0x0
    8894:	0a00000e 	beq	0x88d4
    8898:	e2455001 	sub	r5, r5, #1	; 0x1
    889c:	ea000001 	b	0x88a8
    88a0:	e1540003 	cmp	r4, r3
    88a4:	2a000010 	bcs	0x88ec
    88a8:	e2844001 	add	r4, r4, #1	; 0x1
    88ac:	e1a00004 	mov	r0, r4
    88b0:	eb000d2f 	bl	bbd74
    88b4:	e5963004 	ldr	r3, [r6, #4]
    88b8:	e310000a 	tst	r0, #10	; 0xa
    88bc:	1afffff7 	bne	0x88a0
    88c0:	e1540003 	cmp	r4, r3
    88c4:	2a000008 	bcs	0x88ec
    88c8:	e3550000 	cmp	r5, #0	; 0x0
    88cc:	1afffff1 	bne	0x8898
    88d0:	e1d670bc 	ldrh	r7, [r6, #12]
    88d4:	e1a00007 	mov	r0, r7
    88d8:	e1a01008 	mov	r1, r8
    88dc:	eb0011f9 	bl	0xd0c8
    88e0:	e0201497 	mla	r0, r7, r4, r1
    88e4:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    88e8:	e12fff1e 	bx	lr
    88ec:	e3e00000 	mvn	r0, #0	; 0x0
    88f0:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    88f4:	e12fff1e 	bx	lr
    88f8:	800690c0 	andhi	r9, r6, r0, asr #1
    88fc:	80069794 	mulhi	r6, r4, r7
    8900:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8904:	e59f309c 	ldr	r3, [pc, #156]	; 0x89a8
    8908:	e3a06001 	mov	r6, #1	; 0x1
    890c:	e3a08000 	mov	r8, #0	; 0x0
    8910:	e5933000 	ldr	r3, [r3]
    8914:	e2833c01 	add	r3, r3, #256	; 0x100
    8918:	e28370be 	add	r7, r3, #190	; 0xbe
    891c:	e5d73004 	ldrb	r3, [r7, #4]
    8920:	e35300ff 	cmp	r3, #255	; 0xff
    8924:	0a000016 	beq	0x8984
    8928:	e3530000 	cmp	r3, #0	; 0x0
    892c:	0a000014 	beq	0x8984
    8930:	e5d7000c 	ldrb	r0, [r7, #12]
    8934:	e5d7200d 	ldrb	r2, [r7, #13]
    8938:	e5d71008 	ldrb	r1, [r7, #8]
    893c:	e5d73009 	ldrb	r3, [r7, #9]
    8940:	e5d7400e 	ldrb	r4, [r7, #14]
    8944:	e5d7500a 	ldrb	r5, [r7, #10]
    8948:	e1802402 	orr	r2, r0, r2, lsl #8
    894c:	e5d7000f 	ldrb	r0, [r7, #15]
    8950:	e5d7e00b 	ldrb	lr, [r7, #11]
    8954:	e1811403 	orr	r1, r1, r3, lsl #8
    8958:	e1823804 	orr	r3, r2, r4, lsl #16
    895c:	e1812805 	orr	r2, r1, r5, lsl #16
    8960:	e1831c00 	orr	r1, r3, r0, lsl #24
    8964:	e1823c0e 	orr	r3, r2, lr, lsl #24
    8968:	e0813003 	add	r3, r1, r3
    896c:	e1530006 	cmp	r3, r6
    8970:	e2888001 	add	r8, r8, #1	; 0x1
    8974:	81a06003 	movhi	r6, r3
    8978:	e3580004 	cmp	r8, #4	; 0x4
    897c:	e2877010 	add	r7, r7, #16	; 0x10
    8980:	baffffe5 	blt	0x891c
    8984:	ebffff8f 	bl	0x87c8
    8988:	e3700001 	cmn	r0, #1	; 0x1
    898c:	0a000001 	beq	0x8998
    8990:	e1560000 	cmp	r6, r0
    8994:	3a000000 	bcc	0x899c
    8998:	e3e06000 	mvn	r6, #0	; 0x0
    899c:	e1a00006 	mov	r0, r6
    89a0:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    89a4:	e12fff1e 	bx	lr
    89a8:	800697c8 	andhi	r9, r6, r8, asr #15
    89ac:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    89b0:	e1a04001 	mov	r4, r1
    89b4:	e1a09000 	mov	r9, r0
    89b8:	e59f20d0 	ldr	r2, [pc, #208]	; 0x8a90
    89bc:	e0893004 	add	r3, r9, r4
    89c0:	e2438001 	sub	r8, r3, #1	; 0x1
    89c4:	e5923000 	ldr	r3, [r2]
    89c8:	e2833c01 	add	r3, r3, #256	; 0x100
    89cc:	e28370be 	add	r7, r3, #190	; 0xbe
    89d0:	ebffff7c 	bl	0x87c8
    89d4:	e3700001 	cmn	r0, #1	; 0x1
    89d8:	0a000029 	beq	0x8a84
    89dc:	e2803001 	add	r3, r0, #1	; 0x1
    89e0:	e1540003 	cmp	r4, r3
    89e4:	8a000026 	bhi	0x8a84
    89e8:	e1580000 	cmp	r8, r0
    89ec:	8a000024 	bhi	0x8a84
    89f0:	e3540000 	cmp	r4, #0	; 0x0
    89f4:	0a000022 	beq	0x8a84
    89f8:	e1590008 	cmp	r9, r8
    89fc:	8a000020 	bhi	0x8a84
    8a00:	e3a06000 	mov	r6, #0	; 0x0
    8a04:	e5d73004 	ldrb	r3, [r7, #4]
    8a08:	e35300ff 	cmp	r3, #255	; 0xff
    8a0c:	0a000019 	beq	0x8a78
    8a10:	e3530000 	cmp	r3, #0	; 0x0
    8a14:	0a000017 	beq	0x8a78
    8a18:	e5d70008 	ldrb	r0, [r7, #8]
    8a1c:	e5d72009 	ldrb	r2, [r7, #9]
    8a20:	e5d7100c 	ldrb	r1, [r7, #12]
    8a24:	e5d7300d 	ldrb	r3, [r7, #13]
    8a28:	e5d7400a 	ldrb	r4, [r7, #10]
    8a2c:	e5d7500e 	ldrb	r5, [r7, #14]
    8a30:	e1802402 	orr	r2, r0, r2, lsl #8
    8a34:	e5d7000b 	ldrb	r0, [r7, #11]
    8a38:	e5d7e00f 	ldrb	lr, [r7, #15]
    8a3c:	e1811403 	orr	r1, r1, r3, lsl #8
    8a40:	e1823804 	orr	r3, r2, r4, lsl #16
    8a44:	e1812805 	orr	r2, r1, r5, lsl #16
    8a48:	e1831c00 	orr	r1, r3, r0, lsl #24
    8a4c:	e1823c0e 	orr	r3, r2, lr, lsl #24
    8a50:	e0833001 	add	r3, r3, r1
    8a54:	e2433001 	sub	r3, r3, #1	; 0x1
    8a58:	e1590003 	cmp	r9, r3
    8a5c:	8a000001 	bhi	0x8a68
    8a60:	e1580001 	cmp	r8, r1
    8a64:	2a000006 	bcs	0x8a84
    8a68:	e2866001 	add	r6, r6, #1	; 0x1
    8a6c:	e3560004 	cmp	r6, #4	; 0x4
    8a70:	e2877010 	add	r7, r7, #16	; 0x10
    8a74:	baffffe2 	blt	0x8a04
    8a78:	e3a00001 	mov	r0, #1	; 0x1
    8a7c:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    8a80:	e12fff1e 	bx	lr
    8a84:	e3a00000 	mov	r0, #0	; 0x0
    8a88:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    8a8c:	e12fff1e 	bx	lr
    8a90:	800697c8 	andhi	r9, r6, r8, asr #15
    8a94:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8a98:	e1a04002 	mov	r4, r2
    8a9c:	e1a05001 	mov	r5, r1
    8aa0:	e1a08000 	mov	r8, r0
    8aa4:	e59f7064 	ldr	r7, [pc, #100]	; 0x8b10
    8aa8:	e3a06000 	mov	r6, #0	; 0x0
    8aac:	e1d720bc 	ldrh	r2, [r7, #12]
    8ab0:	e3520000 	cmp	r2, #0	; 0x0
    8ab4:	da00000f 	ble	0x8af8
    8ab8:	e0206892 	mla	r0, r2, r8, r6
    8abc:	e3a03001 	mov	r3, #1	; 0x1
    8ac0:	e1a02004 	mov	r2, r4
    8ac4:	e1a01005 	mov	r1, r5
    8ac8:	eb000c96 	bl	bbd28
    8acc:	e3500000 	cmp	r0, #0	; 0x0
    8ad0:	0a00000b 	beq	0x8b04
    8ad4:	e3550000 	cmp	r5, #0	; 0x0
    8ad8:	11d730be 	ldrhne	r3, [r7, #14]
    8adc:	e1d720bc 	ldrh	r2, [r7, #12]
    8ae0:	e2866001 	add	r6, r6, #1	; 0x1
    8ae4:	10855003 	addne	r5, r5, r3
    8ae8:	e3540000 	cmp	r4, #0	; 0x0
    8aec:	12844008 	addne	r4, r4, #8	; 0x8
    8af0:	e1560002 	cmp	r6, r2
    8af4:	baffffef 	blt	0x8ab8
    8af8:	e3a00001 	mov	r0, #1	; 0x1
    8afc:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8b00:	e12fff1e 	bx	lr
    8b04:	e3a00000 	mov	r0, #0	; 0x0
    8b08:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8b0c:	e12fff1e 	bx	lr
    8b10:	80069794 	mulhi	r6, r4, r7
    8b14:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8b18:	e1a04002 	mov	r4, r2
    8b1c:	e1a05001 	mov	r5, r1
    8b20:	e1a08000 	mov	r8, r0
    8b24:	e59f7064 	ldr	r7, [pc, #100]	; 0x8b90
    8b28:	e3a06000 	mov	r6, #0	; 0x0
    8b2c:	e1d720bc 	ldrh	r2, [r7, #12]
    8b30:	e3520000 	cmp	r2, #0	; 0x0
    8b34:	da00000f 	ble	0x8b78
    8b38:	e0206892 	mla	r0, r2, r8, r6
    8b3c:	e3a03001 	mov	r3, #1	; 0x1
    8b40:	e1a02004 	mov	r2, r4
    8b44:	e1a01005 	mov	r1, r5
    8b48:	eb000cd6 	bl	bbea8
    8b4c:	e3500000 	cmp	r0, #0	; 0x0
    8b50:	0a00000b 	beq	0x8b84
    8b54:	e3550000 	cmp	r5, #0	; 0x0
    8b58:	11d730be 	ldrhne	r3, [r7, #14]
    8b5c:	e1d720bc 	ldrh	r2, [r7, #12]
    8b60:	e2866001 	add	r6, r6, #1	; 0x1
    8b64:	10855003 	addne	r5, r5, r3
    8b68:	e3540000 	cmp	r4, #0	; 0x0
    8b6c:	12844008 	addne	r4, r4, #8	; 0x8
    8b70:	e1560002 	cmp	r6, r2
    8b74:	baffffef 	blt	0x8b38
    8b78:	e3a00001 	mov	r0, #1	; 0x1
    8b7c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8b80:	e12fff1e 	bx	lr
    8b84:	e3a00000 	mov	r0, #0	; 0x0
    8b88:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8b8c:	e12fff1e 	bx	lr
    8b90:	80069794 	mulhi	r6, r4, r7
    8b94:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8b98:	e24dd008 	sub	sp, sp, #8	; 0x8
    8b9c:	e1a06002 	mov	r6, r2
    8ba0:	e1a07001 	mov	r7, r1
    8ba4:	e1a0b000 	mov	fp, r0
    8ba8:	e37b0001 	cmn	fp, #1	; 0x1
    8bac:	0a000086 	beq	0x8dcc
    8bb0:	e59f122c 	ldr	r1, [pc, #556]	; 0x8de4
    8bb4:	e59f5224 	ldr	r5, [pc, #548]	; 0x8de0
    8bb8:	e59fa21c 	ldr	sl, [pc, #540]	; 0x8ddc
    8bbc:	e5913000 	ldr	r3, [r1]
    8bc0:	e59b8004 	ldr	r8, [fp, #4]
    8bc4:	e3130001 	tst	r3, #1	; 0x1
    8bc8:	05952030 	ldreq	r2, [r5, #48]
    8bcc:	03833001 	orreq	r3, r3, #1	; 0x1
    8bd0:	05813000 	streq	r3, [r1]
    8bd4:	058a2000 	streq	r2, [sl]
    8bd8:	159a2000 	ldrne	r2, [sl]
    8bdc:	e0883006 	add	r3, r8, r6
    8be0:	e3570000 	cmp	r7, #0	; 0x0
    8be4:	e58d3004 	str	r3, [sp, #4]
    8be8:	0a000077 	beq	0x8dcc
    8bec:	e3520000 	cmp	r2, #0	; 0x0
    8bf0:	0a000075 	beq	0x8dcc
    8bf4:	e3560000 	cmp	r6, #0	; 0x0
    8bf8:	0a000073 	beq	0x8dcc
    8bfc:	e1d500be 	ldrh	r0, [r5, #14]
    8c00:	e59b4000 	ldr	r4, [fp]
    8c04:	e2431001 	sub	r1, r3, #1	; 0x1
    8c08:	eb00112e 	bl	0xd0c8
    8c0c:	e5d4e00c 	ldrb	lr, [r4, #12]
    8c10:	e5d4300d 	ldrb	r3, [r4, #13]
    8c14:	e5d4200e 	ldrb	r2, [r4, #14]
    8c18:	e5d4100f 	ldrb	r1, [r4, #15]
    8c1c:	e18e3403 	orr	r3, lr, r3, lsl #8
    8c20:	e1833802 	orr	r3, r3, r2, lsl #16
    8c24:	e1833c01 	orr	r3, r3, r1, lsl #24
    8c28:	e1530000 	cmp	r3, r0
    8c2c:	9a000066 	bls	0x8dcc
    8c30:	e1d500be 	ldrh	r0, [r5, #14]
    8c34:	e1a01008 	mov	r1, r8
    8c38:	eb001122 	bl	0xd0c8
    8c3c:	e5d4e008 	ldrb	lr, [r4, #8]
    8c40:	e5d43009 	ldrb	r3, [r4, #9]
    8c44:	e5d4200a 	ldrb	r2, [r4, #10]
    8c48:	e5d4100b 	ldrb	r1, [r4, #11]
    8c4c:	e18e3403 	orr	r3, lr, r3, lsl #8
    8c50:	e1833802 	orr	r3, r3, r2, lsl #16
    8c54:	e1833c01 	orr	r3, r3, r1, lsl #24
    8c58:	e0830000 	add	r0, r3, r0
    8c5c:	ebfffef9 	bl	0x8848
    8c60:	e1d580be 	ldrh	r8, [r5, #14]
    8c64:	e59b1004 	ldr	r1, [fp, #4]
    8c68:	e1a04000 	mov	r4, r0
    8c6c:	e1a00008 	mov	r0, r8
    8c70:	eb001114 	bl	0xd0c8
    8c74:	e1b09001 	movs	r9, r1
    8c78:	e58d9000 	str	r9, [sp]
    8c7c:	0a000014 	beq	0x8cd4
    8c80:	e59a1000 	ldr	r1, [sl]
    8c84:	e3a03001 	mov	r3, #1	; 0x1
    8c88:	e3a02000 	mov	r2, #0	; 0x0
    8c8c:	e1a00004 	mov	r0, r4
    8c90:	eb000c24 	bl	bbd28
    8c94:	e3500000 	cmp	r0, #0	; 0x0
    8c98:	0a00004b 	beq	0x8dcc
    8c9c:	e1d530be 	ldrh	r3, [r5, #14]
    8ca0:	e59d1000 	ldr	r1, [sp]
    8ca4:	e1a00007 	mov	r0, r7
    8ca8:	e0439009 	sub	r9, r3, r9
    8cac:	e59a3000 	ldr	r3, [sl]
    8cb0:	e1590006 	cmp	r9, r6
    8cb4:	81a09006 	movhi	r9, r6
    8cb8:	e1a02009 	mov	r2, r9
    8cbc:	e0831001 	add	r1, r3, r1
    8cc0:	eb001139 	bl	bd1ac
    8cc4:	e1d580be 	ldrh	r8, [r5, #14]
    8cc8:	e0466009 	sub	r6, r6, r9
    8ccc:	e0877009 	add	r7, r7, r9
    8cd0:	e2844001 	add	r4, r4, #1	; 0x1
    8cd4:	e1a00008 	mov	r0, r8
    8cd8:	e1a01006 	mov	r1, r6
    8cdc:	eb0010f9 	bl	0xd0c8
    8ce0:	e1b09000 	movs	r9, r0
    8ce4:	0a000016 	beq	0x8d44
    8ce8:	e1d500bc 	ldrh	r0, [r5, #12]
    8cec:	e1a01004 	mov	r1, r4
    8cf0:	e2499001 	sub	r9, r9, #1	; 0x1
    8cf4:	eb0010f3 	bl	0xd0c8
    8cf8:	eb000c1d 	bl	bbd74
    8cfc:	e310000a 	tst	r0, #10	; 0xa
    8d00:	11d530bc 	ldrhne	r3, [r5, #12]
    8d04:	11d580be 	ldrhne	r8, [r5, #14]
    8d08:	12899001 	addne	r9, r9, #1	; 0x1
    8d0c:	10844003 	addne	r4, r4, r3
    8d10:	1a000009 	bne	0x8d3c
    8d14:	e3a03001 	mov	r3, #1	; 0x1
    8d18:	e3a02000 	mov	r2, #0	; 0x0
    8d1c:	e1a01007 	mov	r1, r7
    8d20:	e1a00004 	mov	r0, r4
    8d24:	eb000bff 	bl	bbd28
    8d28:	e3500000 	cmp	r0, #0	; 0x0
    8d2c:	0a000026 	beq	0x8dcc
    8d30:	e1d580be 	ldrh	r8, [r5, #14]
    8d34:	e2844001 	add	r4, r4, #1	; 0x1
    8d38:	e0877008 	add	r7, r7, r8
    8d3c:	e3590000 	cmp	r9, #0	; 0x0
    8d40:	1affffe8 	bne	0x8ce8
    8d44:	e1a00008 	mov	r0, r8
    8d48:	e1a01006 	mov	r1, r6
    8d4c:	eb0010dd 	bl	0xd0c8
    8d50:	e1b06001 	movs	r6, r1
    8d54:	0a000018 	beq	0x8dbc
    8d58:	e1d500bc 	ldrh	r0, [r5, #12]
    8d5c:	e1a01004 	mov	r1, r4
    8d60:	eb0010d8 	bl	0xd0c8
    8d64:	ea000006 	b	0x8d84
    8d68:	e1d500bc 	ldrh	r0, [r5, #12]
    8d6c:	e0844000 	add	r4, r4, r0
    8d70:	e1a01004 	mov	r1, r4
    8d74:	eb0010d3 	bl	0xd0c8
    8d78:	e5953004 	ldr	r3, [r5, #4]
    8d7c:	e1500003 	cmp	r0, r3
    8d80:	2a000011 	bcs	0x8dcc
    8d84:	eb000bfa 	bl	bbd74
    8d88:	e310000a 	tst	r0, #10	; 0xa
    8d8c:	1afffff5 	bne	0x8d68
    8d90:	e59a1000 	ldr	r1, [sl]
    8d94:	e3a03001 	mov	r3, #1	; 0x1
    8d98:	e3a02000 	mov	r2, #0	; 0x0
    8d9c:	e1a00004 	mov	r0, r4
    8da0:	eb000be0 	bl	bbd28
    8da4:	e3500000 	cmp	r0, #0	; 0x0
    8da8:	0a000007 	beq	0x8dcc
    8dac:	e59a1000 	ldr	r1, [sl]
    8db0:	e1a02006 	mov	r2, r6
    8db4:	e1a00007 	mov	r0, r7
    8db8:	eb0010fb 	bl	bd1ac
    8dbc:	e59d3004 	ldr	r3, [sp, #4]
    8dc0:	e3a00001 	mov	r0, #1	; 0x1
    8dc4:	e58b3004 	str	r3, [fp, #4]
    8dc8:	ea000000 	b	0x8dd0
    8dcc:	e3a00000 	mov	r0, #0	; 0x0
    8dd0:	e28dd008 	add	sp, sp, #8	; 0x8
    8dd4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8dd8:	e12fff1e 	bx	lr
    8ddc:	800697cc 	andhi	r9, r6, ip, asr #15
    8de0:	80069794 	mulhi	r6, r4, r7
    8de4:	800697d0 	ldrdhi	r9, [r6], -r0
*/
b8de8:				 	push	{r4, r5, lr}
/*
    8dec:	e1a05001 	mov	r5, r1
    8df0:	e1a04000 	mov	r4, r0
    8df4:	e3740001 	cmn	r4, #1	; 0x1
    8df8:	0a00000c 	beq	0x8e30
    8dfc:	e5940000 	ldr	r0, [r4]
    8e00:	e59fe044 	ldr	lr, [pc, #68]	; 0x8e4c
    8e04:	e5d0100c 	ldrb	r1, [r0, #12]
    8e08:	e5d0300d 	ldrb	r3, [r0, #13]
    8e0c:	e5d0200e 	ldrb	r2, [r0, #14]
    8e10:	e5d0000f 	ldrb	r0, [r0, #15]
    8e14:	e1813403 	orr	r3, r1, r3, lsl #8
    8e18:	e1833802 	orr	r3, r3, r2, lsl #16
    8e1c:	e1de20be 	ldrh	r2, [lr, #14]
    8e20:	e1833c00 	orr	r3, r3, r0, lsl #24
    8e24:	e0020293 	mul	r2, r3, r2
    8e28:	e1550002 	cmp	r5, r2
    8e2c:	3a000002 	bcc	0x8e3c
    8e30:	e3a00000 	mov	r0, #0	; 0x0
    8e34:	e8bd4030 	pop	{r4, r5, lr}
    8e38:	e12fff1e 	bx	lr
    8e3c:	e5845004 	str	r5, [r4, #4]
    8e40:	e3a00001 	mov	r0, #1	; 0x1
    8e44:	e8bd4030 	pop	{r4, r5, lr}
    8e48:	e12fff1e 	bx	lr

.x8e4c:	80069794 	mulhi	r6, r4, r7

b8e50:	 				push	{r4, r5, r6, lr}
/*
    8e54:	e1a0e002 	mov	lr, r2
    8e58:	e1a05001 	mov	r5, r1
    8e5c:	e1b06000 	movs	r6, r0
    8e60:	0a000016 	beq	0x8ec0
    8e64:	e59d2010 	ldr	r2, [sp, #16]
    8e68:	e1a01003 	mov	r1, r3
    8e6c:	e1a0000e 	mov	r0, lr
    8e70:	eb000b19 	bl	bbadc
    8e74:	e3500000 	cmp	r0, #0	; 0x0
    8e78:	0a000010 	beq	0x8ec0
    8e7c:	e59f4090 	ldr	r4, [pc, #144]	; 0x8f14
    8e80:	e2840010 	add	r0, r4, #16	; 0x10
    8e84:	eb00046e 	bl	ba044
    8e88:	e3500000 	cmp	r0, #0	; 0x0
    8e8c:	0a00000b 	beq	0x8ec0
    8e90:	e1d421bc 	ldrh	r2, [r4, #28]
    8e94:	e1d401be 	ldrh	r0, [r4, #30]
    8e98:	e0010290 	mul	r1, r0, r2
    8e9c:	e0803001 	add	r3, r0, r1
    8ea0:	e1530001 	cmp	r3, r1
    8ea4:	e584100c 	str	r1, [r4, #12]
    8ea8:	3a000004 	bcc	0x8ec0
    8eac:	e0833182 	add	r3, r3, r2, lsl #3
    8eb0:	e1530182 	cmp	r3, r2, lsl #3
    8eb4:	3a000001 	bcc	0x8ec0
    8eb8:	e1550003 	cmp	r5, r3
    8ebc:	2a000002 	bcs	0x8ecc
    8ec0:	e3a00000 	mov	r0, #0	; 0x0
    8ec4:	e8bd4070 	pop	{r4, r5, r6, lr}
    8ec8:	e12fff1e 	bx	lr
    8ecc:	e2843020 	add	r3, r4, #32	; 0x20
    8ed0:	e3a02004 	mov	r2, #4	; 0x4
    8ed4:	e3a0e000 	mov	lr, #0	; 0x0
    8ed8:	e583e000 	str	lr, [r3]
    8edc:	e583e004 	str	lr, [r3, #4]
    8ee0:	e2833008 	add	r3, r3, #8	; 0x8
    8ee4:	e2522001 	subs	r2, r2, #1	; 0x1
    8ee8:	1afffffa 	bne	0x8ed8
    8eec:	e0802006 	add	r2, r0, r6
    8ef0:	e0823001 	add	r3, r2, r1
    8ef4:	e3a01000 	mov	r1, #0	; 0x0
    8ef8:	e5841004 	str	r1, [r4, #4]
    8efc:	e5843000 	str	r3, [r4]
    8f00:	e5846044 	str	r6, [r4, #68]
    8f04:	e5842040 	str	r2, [r4, #64]
    8f08:	e3a00001 	mov	r0, #1	; 0x1
*/
						pop	{r4, r5, r6, lr}
						bx	lr

.x8f14:	.word 0x80069784

b8f18:				 	push	{r4, r5, r6, r7, lr}
/*
    8f1c:	e59f60e8 	ldr	r6, [pc, #232]	; 0x900c
    8f20:	e59f40e0 	ldr	r4, [pc, #224]	; 0x9008
    8f24:	e1d601bc 	ldrh	r0, [r6, #28]
    8f28:	e5941000 	ldr	r1, [r4]
    8f2c:	eb001065 	bl	0xd0c8
    8f30:	e596200c 	ldr	r2, [r6, #12]
    8f34:	e1a07000 	mov	r7, r0
    8f38:	e5960040 	ldr	r0, [r6, #64]
    8f3c:	e3a010ff 	mov	r1, #255	; 0xff
    8f40:	eb000fff 	bl	bcf44
    8f44:	e1d621bc 	ldrh	r2, [r6, #28]
    8f48:	e5960000 	ldr	r0, [r6]
    8f4c:	e3a010ff 	mov	r1, #255	; 0xff
    8f50:	e1a02182 	lsl	r2, r2, #3
    8f54:	eb000ffa 	bl	bcf44
    8f58:	e5962000 	ldr	r2, [r6]
    8f5c:	e5961040 	ldr	r1, [r6, #64]
    8f60:	e1a00007 	mov	r0, r7
    8f64:	ebfffeca 	bl	0x8a94
    8f68:	e1a00007 	mov	r0, r7
    8f6c:	eb000b9b 	bl	bbde0
    8f70:	e3500000 	cmp	r0, #0	; 0x0
    8f74:	0a00001d 	beq	0x8ff0
    8f78:	e1d601bc 	ldrh	r0, [r6, #28]
    8f7c:	e5941000 	ldr	r1, [r4]
    8f80:	e1d651be 	ldrh	r5, [r6, #30]
    8f84:	eb00104f 	bl	0xd0c8
    8f88:	e5964040 	ldr	r4, [r6, #64]
    8f8c:	e1a0e001 	mov	lr, r1
    8f90:	e5961044 	ldr	r1, [r6, #68]
    8f94:	e1a03000 	mov	r3, r0
    8f98:	e020459e 	mla	r0, lr, r5, r4
    8f9c:	e1a02005 	mov	r2, r5
    8fa0:	eb001081 	bl	bd1ac
    8fa4:	e5962000 	ldr	r2, [r6]
    8fa8:	e3a01cff 	mov	r1, #65280	; 0xff00
    8fac:	e38110fb 	orr	r1, r1, #251	; 0xfb
    8fb0:	e5d23004 	ldrb	r3, [r2, #4]
    8fb4:	e3a0e000 	mov	lr, #0	; 0x0
    8fb8:	e1a00007 	mov	r0, r7
    8fbc:	e20330fd 	and	r3, r3, #253	; 0xfd
    8fc0:	e5c23004 	strb	r3, [r2, #4]
    8fc4:	e5962000 	ldr	r2, [r6]
    8fc8:	e1d230b6 	ldrh	r3, [r2, #6]
    8fcc:	e0033001 	and	r3, r3, r1
    8fd0:	e1c230b6 	strh	r3, [r2, #6]
    8fd4:	e5963000 	ldr	r3, [r6]
    8fd8:	e583e000 	str	lr, [r3]
    8fdc:	e5962000 	ldr	r2, [r6]
    8fe0:	e5961040 	ldr	r1, [r6, #64]
    8fe4:	ebfffeca 	bl	0x8b14
    8fe8:	e3500000 	cmp	r0, #0	; 0x0
    8fec:	1a000002 	bne	0x8ffc
    8ff0:	e3a00000 	mov	r0, #0	; 0x0
    8ff4:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    8ff8:	e12fff1e 	bx	lr
    8ffc:	e3a00001 	mov	r0, #1	; 0x1
    9000:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    9004:	e12fff1e 	bx	lr
    9008:	800690c0 	andhi	r9, r6, r0, asr #1
    900c:	80069784 	andhi	r9, r6, r4, lsl #15
    9010:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9014:	e1a0b002 	mov	fp, r2
    9018:	e1a07001 	mov	r7, r1
    901c:	e1a09000 	mov	r9, r0
    9020:	e3a05000 	mov	r5, #0	; 0x0
    9024:	ebfffe07 	bl	0x8848
    9028:	e59f6108 	ldr	r6, [pc, #264]	; 0x9138
    902c:	e1a01000 	mov	r1, r0
    9030:	e1d601bc 	ldrh	r0, [r6, #28]
    9034:	eb001023 	bl	0xd0c8
    9038:	e1a08001 	mov	r8, r1
    903c:	e1a04000 	mov	r4, r0
    9040:	e3570000 	cmp	r7, #0	; 0x0
    9044:	0a000035 	beq	0x9120
    9048:	e3a0acff 	mov	sl, #65280	; 0xff00
    904c:	e38aa0fb 	orr	sl, sl, #251	; 0xfb
    9050:	e1a00004 	mov	r0, r4
    9054:	eb000b46 	bl	bbd74
    9058:	e310000a 	tst	r0, #10	; 0xa
    905c:	1a00002c 	bne	0x9114
    9060:	e596200c 	ldr	r2, [r6, #12]
    9064:	e5960040 	ldr	r0, [r6, #64]
    9068:	e3a010ff 	mov	r1, #255	; 0xff
    906c:	eb000fb4 	bl	bcf44
    9070:	e1d621bc 	ldrh	r2, [r6, #28]
    9074:	e5960000 	ldr	r0, [r6]
    9078:	e3a010ff 	mov	r1, #255	; 0xff
    907c:	e1a02182 	lsl	r2, r2, #3
    9080:	eb000faf 	bl	bcf44
    9084:	e5962000 	ldr	r2, [r6]
    9088:	e5961040 	ldr	r1, [r6, #64]
    908c:	e1a00004 	mov	r0, r4
    9090:	ebfffe7f 	bl	0x8a94
    9094:	e1a00004 	mov	r0, r4
    9098:	eb000b50 	bl	bbde0
    909c:	e3500000 	cmp	r0, #0	; 0x0
    90a0:	0a000021 	beq	0x912c
    90a4:	e1d631bc 	ldrh	r3, [r6, #28]
    90a8:	e5962000 	ldr	r2, [r6]
    90ac:	e0430008 	sub	r0, r3, r8
    90b0:	e0803005 	add	r3, r0, r5
    90b4:	e1530007 	cmp	r3, r7
    90b8:	80470005 	subhi	r0, r7, r5
    90bc:	e3500000 	cmp	r0, #0	; 0x0
    90c0:	e0821188 	add	r1, r2, r8, lsl #3
    90c4:	0a00000c 	beq	0x90fc
    90c8:	e35b0000 	cmp	fp, #0	; 0x0
    90cc:	15d13004 	ldrbne	r3, [r1, #4]
    90d0:	e0852009 	add	r2, r5, r9
    90d4:	e2855001 	add	r5, r5, #1	; 0x1
    90d8:	120330fd 	andne	r3, r3, #253	; 0xfd
    90dc:	15c13004 	strbne	r3, [r1, #4]
    90e0:	e1d130b6 	ldrh	r3, [r1, #6]
    90e4:	e2500001 	subs	r0, r0, #1	; 0x1
    90e8:	e003300a 	and	r3, r3, sl
    90ec:	e1c130b6 	strh	r3, [r1, #6]
    90f0:	e4812008 	str	r2, [r1], #8
    90f4:	1afffff3 	bne	0x90c8
    90f8:	e5962000 	ldr	r2, [r6]
    90fc:	e5961040 	ldr	r1, [r6, #64]
    9100:	e1a00004 	mov	r0, r4
    9104:	ebfffe82 	bl	0x8b14
    9108:	e3500000 	cmp	r0, #0	; 0x0
    910c:	0a000006 	beq	0x912c
    9110:	e3a08000 	mov	r8, #0	; 0x0
    9114:	e2844001 	add	r4, r4, #1	; 0x1
    9118:	e1550007 	cmp	r5, r7
    911c:	3affffcb 	bcc	0x9050
    9120:	e3a00001 	mov	r0, #1	; 0x1
    9124:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9128:	e12fff1e 	bx	lr
    912c:	e3a00000 	mov	r0, #0	; 0x0
    9130:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
*/
						bx	lr
.x9138:	.word 0x80069784
 	
b913c:				 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
/*
    9140:	e24dd004 	sub	sp, sp, #4	; 0x4
    9144:	e3530000 	cmp	r3, #0	; 0x0
    9148:	e1a08002 	mov	r8, r2
    914c:	e1a06001 	mov	r6, r1
    9150:	e1a04000 	mov	r4, r0
    9154:	e3a05000 	mov	r5, #0	; 0x0
    9158:	13a05001 	movne	r5, #1	; 0x1
    915c:	e3580020 	cmp	r8, #32	; 0x20
    9160:	0a000003 	beq	0x9174
    9164:	e3580021 	cmp	r8, #33	; 0x21
    9168:	0a000001 	beq	0x9174
    916c:	e3580022 	cmp	r8, #34	; 0x22
    9170:	1a000000 	bne	0x9178
    9174:	e3855002 	orr	r5, r5, #2	; 0x2
    9178:	e59f9170 	ldr	r9, [pc, #368]	; 0x92f0
    917c:	e3740001 	cmn	r4, #1	; 0x1
    9180:	1a000015 	bne	0x91dc
    9184:	ebfffddd 	bl	0x8900
    9188:	e1a04000 	mov	r4, r0
    918c:	e3740001 	cmn	r4, #1	; 0x1
    9190:	0a000046 	beq	0x92b0
    9194:	e1d900bc 	ldrh	r0, [r9, #12]
    9198:	e1a01004 	mov	r1, r4
    919c:	eb000fc9 	bl	0xd0c8
    91a0:	e3510000 	cmp	r1, #0	; 0x0
    91a4:	e1a0a000 	mov	sl, r0
    91a8:	0a00000b 	beq	0x91dc
    91ac:	e3150002 	tst	r5, #2	; 0x2
    91b0:	13a07001 	movne	r7, #1	; 0x1
    91b4:	e1a0000a 	mov	r0, sl
    91b8:	03a07000 	moveq	r7, #0	; 0x0
    91bc:	eb000aec 	bl	bbd74
    91c0:	e3100004 	tst	r0, #4	; 0x4
    91c4:	13a03001 	movne	r3, #1	; 0x1
    91c8:	03a03000 	moveq	r3, #0	; 0x0
    91cc:	e1570003 	cmp	r7, r3
    91d0:	11d920bc 	ldrhne	r2, [r9, #12]
    91d4:	128a3001 	addne	r3, sl, #1	; 0x1
    91d8:	10040293 	mulne	r4, r3, r2
    91dc:	e215a002 	ands	sl, r5, #2	; 0x2
    91e0:	0a000007 	beq	0x9204
    91e4:	e3760001 	cmn	r6, #1	; 0x1
    91e8:	1a000018 	bne	0x9250
    91ec:	ebfffd75 	bl	0x87c8
    91f0:	e3700001 	cmn	r0, #1	; 0x1
    91f4:	0a00002d 	beq	0x92b0
    91f8:	e0403004 	sub	r3, r0, r4
    91fc:	e2836001 	add	r6, r3, #1	; 0x1
    9200:	ea000012 	b	0x9250
    9204:	ebfffd6f 	bl	0x87c8
    9208:	e3700001 	cmn	r0, #1	; 0x1
    920c:	0a000027 	beq	0x92b0
    9210:	e5991004 	ldr	r1, [r9, #4]
    9214:	e59f30d0 	ldr	r3, [pc, #208]	; 0x92ec
    9218:	e0832391 	umull	r2, r3, r1, r3
    921c:	e1d920bc 	ldrh	r2, [r9, #12]
    9220:	e1a033a3 	lsr	r3, r3, #7
    9224:	e3530002 	cmp	r3, #2	; 0x2
    9228:	33a03002 	movcc	r3, #2	; 0x2
    922c:	e0030392 	mul	r3, r2, r3
    9230:	e3760001 	cmn	r6, #1	; 0x1
    9234:	e0403003 	sub	r3, r0, r3
    9238:	e0433004 	sub	r3, r3, r4
    923c:	e2833001 	add	r3, r3, #1	; 0x1
    9240:	0a000001 	beq	0x924c
    9244:	e1530006 	cmp	r3, r6
    9248:	2a000000 	bcs	0x9250
    924c:	e1a06003 	mov	r6, r3
    9250:	e1a01006 	mov	r1, r6
    9254:	e1a00004 	mov	r0, r4
    9258:	ebfffdd3 	bl	0x89ac
    925c:	e3500000 	cmp	r0, #0	; 0x0
    9260:	0a000012 	beq	0x92b0
    9264:	e59d7024 	ldr	r7, [sp, #36]
    9268:	e205e0ff 	and	lr, r5, #255	; 0xff
    926c:	e20830ff 	and	r3, r8, #255	; 0xff
    9270:	e1a00007 	mov	r0, r7
    9274:	e1a02006 	mov	r2, r6
    9278:	e1a01004 	mov	r1, r4
    927c:	e58de000 	str	lr, [sp]
    9280:	ebfffd08 	bl	0x86a8
    9284:	e35a0000 	cmp	sl, #0	; 0x0
    9288:	0a000005 	beq	0x92a4
    928c:	e3a02001 	mov	r2, #1	; 0x1
    9290:	e1a01006 	mov	r1, r6
    9294:	e1a00004 	mov	r0, r4
    9298:	ebffff5c 	bl	0x9010
    929c:	e3500000 	cmp	r0, #0	; 0x0
    92a0:	0a000002 	beq	0x92b0
    92a4:	ebffff1b 	bl	b8f18
    92a8:	e3500000 	cmp	r0, #0	; 0x0
    92ac:	1a000001 	bne	0x92b8
    92b0:	e3e00000 	mvn	r0, #0	; 0x0
    92b4:	ea000009 	b	0x92e0
    92b8:	e5993034 	ldr	r3, [r9, #52]
    92bc:	e2890010 	add	r0, r9, #16	; 0x10
    92c0:	e2892010 	add	r2, r9, #16	; 0x10
    92c4:	e0833207 	add	r3, r3, r7, lsl #4
    92c8:	e2833c01 	add	r3, r3, #256	; 0x100
    92cc:	e28330be 	add	r3, r3, #190	; 0xbe
    92d0:	e7a03187 	str	r3, [r0, r7, lsl #3]!
    92d4:	e0823187 	add	r3, r2, r7, lsl #3
    92d8:	e3a02000 	mov	r2, #0	; 0x0
    92dc:	e5832004 	str	r2, [r3, #4]
    92e0:	e28dd004 	add	sp, sp, #4	; 0x4
*/
						pop	{r4, r5, r6, r7, r8, r9, sl, lr}
						bx	lr

.x92ec:		.word 	0x51eb851f 	
.x92f0:		.word 	0x80069794 	

    b92f4:			 	push	{r4, r5, lr}
/*
    92f8:	e1a04000 	mov	r4, r0
    92fc:	e59f50e0 	ldr	r5, .x93e4
    9300:	e1a00004 	mov	r0, r4
    9304:	e5953004 	ldr	r3, [r5, #4]
    9308:	e1510003 	cmp	r1, r3
    930c:	21a01003 	movcs	r1, r3
    9310:	eb0000b8 	bl	b95f8
    9314:	e3500000 	cmp	r0, #0	
    9318:	1a000005 	bne	b9334
    931c:	e3a00000 	mov	r0, #0	 
*/
						pop	{r4, r5, lr}
						bx	lr
/*
    b9328:	e1540003 	cmp	r4, r3
    932c:	2a000007 	bcs	b9350
    9330:	e2844001 	add	r4, r4, #1
    b9334:	e1a00004 	mov	r0, r4
    9338:	eb000a8d 	bl	bbd74
    933c:	e5953004 	ldr	r3, [r5, #4]
    9340:	e310000a 	tst	r0, #0xa
    9344:	1afffff7 	bne	b9328
    9348:	e1540003 	cmp	r4, r3
    934c:	3a000002 	bcc	b935c
    b9350:	e3a00000 	mov	r0, #0
    9354:	e8bd4030 	pop	{r4, r5, lr}
    9358:	e12fff1e 	bx	lr

b935c:				 	ldrh	r1, [r5, #12]
    9360:	e59fe078 	ldr	lr, .x93e0
    9364:	e1d520be 	ldrh	r2, [r5, #14]
    9368:	e5950034 	ldr	r0, [r5, #52]
    936c:	e0030491 	mul	r3, r1, r4
    9370:	e3a010ff 	mov	r1, #0xff
    9374:	e58e3000 	str	r3, [lr]
    9378:	eb000ef1 	bl	bcf44
    937c:	e5953034 	ldr	r3, [r5, #52]
    9380:	e3a020e9 	mov	r2, #0xe9
    9384:	e3a010fd 	mov	r1, #0xfd
    9388:	e5c32000 	strb	r2, [r3]
    938c:	e5953034 	ldr	r3, [r5, #52]
    9390:	e3a000ff 	mov	r0, #0xff
    9394:	e3a04055 	mov	r4, #0x55
    9398:	e5c31001 	strb	r1, [r3, #1]
    939c:	e5953034 	ldr	r3, [r5, #52]
    93a0:	e3a0e0aa 	mov	lr, #0xaa
    93a4:	e3a02040 	mov	r2, #0x40
    93a8:	e5c30002 	strb	r0, [r3, #2]
    93ac:	e5953034 	ldr	r3, [r5, #52]
    93b0:	e3a01000 	mov	r1, #0
    93b4:	e5c341fe 	strb	r4, [r3, #510]
    93b8:	e5953034 	ldr	r3, [r5, #52]
    93bc:	e5c3e1ff 	strb	lr, [r3, #511]
    93c0:	e5953034 	ldr	r3, [r5, #52]
    93c4:	e2833c01 	add	r3, r3, #0x100
    93c8:	e28300be 	add	r0, r3, #0xbe
    93cc:	eb000edc 	bl	bcf44
    93d0:	ebfffed0 	bl	b8f18
    93d4:	e3a00001 	mov	r0, #1
    93d8:	e8bd4030 	pop	{r4, r5, lr}
    93dc:	e12fff1e 	bx	lr
*/
.x93e0:	.word 0x800690c0 	
.x93e4:	.word 0x80069794 	

fat_01:					push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						sub	sp, sp, #8
						mov	sl, r3
						mov	r3, r0
						str	r3, [sp, #4]
						mov	r9, r2
						mov	fp, r1
						ldr	r5, .x95f4
						ldr	r7, .x95f0
						ldr	r8, [sp, #44]
						ldr	r1, [r5, #4]
						mov	r6, #0	
						cmp	r1, #0	
						beq	b94a8
b9420:	 				mov	r0, r6
						bl	bbd74
						tst	r0, #0xa
						bne	b9498
						ldrh	r4, [r5, #12]
						ldr	r1, [r5, #52]
						mov	r3, #1	
						mul	lr, r4, r6
						mov	r2, #0	
						mov	r0, lr
						str	lr, [r7]
						bl	bbd28
						cmp	r0, #0	
						beq	b94f0
						ldr	r2, [r5, #52]
						ldrb	r3, [r2]
						cmp	r3, #0xe9
						bne	b9498
						ldrb	r3, [r2, #1]
						cmp	r3, #0xfd
						bne	b9498
						ldrb	r3, [r2, #2]
						cmp	r3, #0xff
						bne	b9498
						ldrb	r3, [r2, #510]
						cmp	r3, #0x55
						bne	b9498
						ldrb	r3, [r2, #511]
						cmp	r3, #0xaa
						beq	b951c
b9498:	 				ldr	r1, [r5, #4]
						add	r6, r6, #1	
						cmp	r6, r1
						bcc	b9420
b94a8:				 	mov	r4, #0
						cmp	r1, #0	
						beq	b94d4
b94b4:	 				mov	r0, r4
						bl	bbd74
						ldr	r1, [r5, #4]
						tst	r0, #0xa
						beq	b94e0
						add	r4, r4, #1
						cmp	r4, r1
						bcc	b94b4
b94d4:	 				mvn	r2, #0
						str	r2, [r7]
						b	b94f4
b94e0:				 	ldrh	r3, [r5, #12]
						mul	r2, r3, r4
						str	r2, [r7]
						b	b94f4
b94f0:	 				ldr	r1, [r5, #4]
b94f4:	 				mov	r2, #0
						cmp	r8, #1
						beq	b95e0
						ldr	r3, [r5]
						mov	r0, #0
						cmp	r3, #1
						moveq	r2, #1
						bl	b92f4
						mov	lr, #0
						b	b9578
b951c:	 				add	r3, r2, #0x100
						add	r1, r3, #0xbe
						mov	lr, #0
b9528:	 				ldrb	r0, [r1, #4]
						cmp	r0, r9
						bne	b954c
						ldrb	r3, [r1]
						tst	r3, #1	
						movne	r3, #1	
						moveq	r3, #0	
						cmp	r3, sl
						beq	b959c
b954c:	 				cmp	r0, #0xff
						beq	b9570
						cmp	r0, #0
						beq	b9570
						add	lr, lr, #1
						cmp	lr, #4	
						add	r1, r1, #0x10
						bcc	b9528
						ldr	lr, [sp, #4]
b9570:	 				cmp	lr, #4
						beq	b95e0
b9578:	 				cmp	r8, #1
						beq	b95e0
						ldr	r0, [sp, #4]
						mov	r3, sl
						mov	r2, r9
						mov	r1, fp
						str	lr, [sp]
						bl	b913c
						b	b95e4
b959c:				 	ldr	r3, [sp, #44]
						cmp	r3, #0
						beq	b95e0
						lsl	r0, lr, #3
						add	r3, r5, #0x10
						ldr	r3, [r0, r3]!
						cmp	r3, #0	
						bne	b95e4
						add	r3, r2, lr, lsl #4
						add	r3, r3, #0x100
						add	r2, r5, #0x10
						add	r3, r3, #0xbe
						add	r2, r2, lr, lsl #3
						mov	r1, #0
						str	r3, [r0]
						str	r1, [r2, #4]
						b	b95e4
b95e0:	 				mvn	r0, #0	
b95e4:	 				add	sp, sp, #8
						pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						bx	lr

.x95f0:	.word 0x800690c0 	
.x95f4:	.word 0x80069794 	

b95f8:				 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}

/*
    95fc:	e24dd018 	sub	sp, sp, #24	; 0x18
    9600:	e1a05002 	mov	r5, r2
    9604:	e58d5000 	str	r5, [sp]
    9608:	e1a06001 	mov	r6, r1
    960c:	e1a04000 	mov	r4, r0
    9610:	e59f7198 	ldr	r7, [pc, #408]	; 0x97b0
    9614:	e59f3190 	ldr	r3, [pc, #400]	; 0x97ac
    9618:	e5971004 	ldr	r1, [r7, #4]
    961c:	e1d7a0be 	ldrh	sl, [r7, #14]
    9620:	e593b000 	ldr	fp, [r3]
    9624:	e1540001 	cmp	r4, r1
    9628:	2a000003 	bcs	0x963c
    962c:	e0843006 	add	r3, r4, r6
    9630:	e2433001 	sub	r3, r3, #1	; 0x1
    9634:	e1530001 	cmp	r3, r1
    9638:	3a000057 	bcc	0x979c
    963c:	e3a00000 	mov	r0, #0	; 0x0
    9640:	e28dd018 	add	sp, sp, #24	; 0x18
    9644:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9648:	e12fff1e 	bx	lr
    964c:	e1a00004 	mov	r0, r4
    9650:	e2466001 	sub	r6, r6, #1	; 0x1
    9654:	eb0009c6 	bl	bbd74
    9658:	e3100002 	tst	r0, #2	; 0x2
    965c:	1a00004c 	bne	0x9794
    9660:	e3100008 	tst	r0, #8	; 0x8
    9664:	0a000001 	beq	0x9670
    9668:	e3150002 	tst	r5, #2	; 0x2
    966c:	1a000048 	bne	0x9794
    9670:	e1a00004 	mov	r0, r4
    9674:	eb0009d9 	bl	bbde0
    9678:	e3500000 	cmp	r0, #0	; 0x0
    967c:	0a000041 	beq	0x9788
    9680:	e3150001 	tst	r5, #1	; 0x1
    9684:	1a000042 	bne	0x9794
    9688:	e1d730bc 	ldrh	r3, [r7, #12]
    968c:	e1b09003 	movs	r9, r3
    9690:	0a000038 	beq	0x9778
    9694:	e1d780be 	ldrh	r8, [r7, #14]
    9698:	e3a05000 	mov	r5, #0	; 0x0
    969c:	e1a02008 	mov	r2, r8
    96a0:	e3a010ff 	mov	r1, #255	; 0xff
    96a4:	e08a000b 	add	r0, sl, fp
    96a8:	eb000e25 	bl	bcf44
    96ac:	e0205499 	mla	r0, r9, r4, r5
    96b0:	e3e0e000 	mvn	lr, #0	; 0x0
    96b4:	e3a03001 	mov	r3, #1	; 0x1
    96b8:	e28d2010 	add	r2, sp, #16	; 0x10
    96bc:	e08b108a 	add	r1, fp, sl, lsl #1
    96c0:	e58de008 	str	lr, [sp, #8]
    96c4:	e58de00c 	str	lr, [sp, #12]
    96c8:	eb000996 	bl	bbd28
    96cc:	e1d720be 	ldrh	r2, [r7, #14]
    96d0:	e08a100b 	add	r1, sl, fp
    96d4:	e08b008a 	add	r0, fp, sl, lsl #1
    96d8:	eb00120b 	bl	0xdf0c
    96dc:	e3500000 	cmp	r0, #0	; 0x0
    96e0:	1a000028 	bne	0x9788
    96e4:	e3a02008 	mov	r2, #8	; 0x8
    96e8:	e28d1008 	add	r1, sp, #8	; 0x8
    96ec:	e28d0010 	add	r0, sp, #16	; 0x10
    96f0:	eb001205 	bl	0xdf0c
    96f4:	e3500000 	cmp	r0, #0	; 0x0
    96f8:	1a000022 	bne	0x9788
    96fc:	e1d720be 	ldrh	r2, [r7, #14]
    9700:	e3a01000 	mov	r1, #0	; 0x0
    9704:	e08a000b 	add	r0, sl, fp
    9708:	eb000e0d 	bl	bcf44
    970c:	e0205499 	mla	r0, r9, r4, r5
    9710:	e3a03001 	mov	r3, #1	; 0x1
    9714:	e3a02000 	mov	r2, #0	; 0x0
    9718:	e08a100b 	add	r1, sl, fp
    971c:	eb0009e1 	bl	bbea8
    9720:	e3500000 	cmp	r0, #0	; 0x0
    9724:	0a000017 	beq	0x9788
    9728:	e0205499 	mla	r0, r9, r4, r5
    972c:	e3a03001 	mov	r3, #1	; 0x1
    9730:	e3a02000 	mov	r2, #0	; 0x0
    9734:	e08b108a 	add	r1, fp, sl, lsl #1
    9738:	eb00097a 	bl	bbd28
    973c:	e3500000 	cmp	r0, #0	; 0x0
    9740:	0a000010 	beq	0x9788
    9744:	e1d780be 	ldrh	r8, [r7, #14]
    9748:	e08a100b 	add	r1, sl, fp
    974c:	e08b008a 	add	r0, fp, sl, lsl #1
    9750:	e1a02008 	mov	r2, r8
    9754:	eb0011ec 	bl	0xdf0c
    9758:	e3500000 	cmp	r0, #0	; 0x0
    975c:	1a000009 	bne	0x9788
    9760:	e2853001 	add	r3, r5, #1	; 0x1
    9764:	e1d720bc 	ldrh	r2, [r7, #12]
    9768:	e1a05803 	lsl	r5, r3, #16
    976c:	e1a05825 	lsr	r5, r5, #16
    9770:	e1550002 	cmp	r5, r2
    9774:	3affffc8 	bcc	0x969c
    9778:	e1a00004 	mov	r0, r4
    977c:	eb000997 	bl	bbde0
    9780:	e3500000 	cmp	r0, #0	; 0x0
    9784:	1a000002 	bne	0x9794
    9788:	e3a01002 	mov	r1, #2	; 0x2
    978c:	e1a00004 	mov	r0, r4
    9790:	eb0009ef 	bl	0xbf54
    9794:	e59d5000 	ldr	r5, [sp]
    9798:	e2844001 	add	r4, r4, #1	; 0x1
    979c:	e3560000 	cmp	r6, #0	; 0x0
    97a0:	1affffa9 	bne	0x964c
    97a4:	e3a00001 	mov	r0, #1	; 0x1
    97a8:	eaffffa4 	b	0x9640
    97ac:	800697c4 	andhi	r9, r6, r4, asr #15
    97b0:	80069794 	mulhi	r6, r4, r7
    97b4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    97b8:	e1a07002 	mov	r7, r2
    97bc:	e1a08001 	mov	r8, r1
    97c0:	e1a06000 	mov	r6, r0
    97c4:	e3760001 	cmn	r6, #1	; 0x1
    97c8:	0a000008 	beq	0x97f0
    97cc:	e59f4064 	ldr	r4, [pc, #100]	; 0x9838
    97d0:	e5945000 	ldr	r5, [r4]
    97d4:	e3550000 	cmp	r5, #0	; 0x0
    97d8:	1a000007 	bne	0x97fc
    97dc:	e3a00000 	mov	r0, #0	; 0x0
    97e0:	eb0000d8 	bl	0x9b48
    97e4:	e1b05000 	movs	r5, r0
    97e8:	e5845000 	str	r5, [r4]
    97ec:	1a000002 	bne	0x97fc
    97f0:	e3a00000 	mov	r0, #0	; 0x0
    97f4:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    97f8:	e12fff1e 	bx	lr
    97fc:	e596e000 	ldr	lr, [r6]
    9800:	e3a03001 	mov	r3, #1	; 0x1
    9804:	e1a02007 	mov	r2, r7
    9808:	e5de4008 	ldrb	r4, [lr, #8]
    980c:	e5de1009 	ldrb	r1, [lr, #9]
    9810:	e5de000a 	ldrb	r0, [lr, #10]
    9814:	e5dee00b 	ldrb	lr, [lr, #11]
    9818:	e1841401 	orr	r1, r4, r1, lsl #8
    981c:	e1811800 	orr	r1, r1, r0, lsl #16
    9820:	e1811c0e 	orr	r1, r1, lr, lsl #24
    9824:	e0811008 	add	r1, r1, r8
    9828:	e1a00005 	mov	r0, r5
    982c:	eb00012c 	bl	0x9ce4
    9830:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    9834:	e12fff1e 	bx	lr
    9838:	800697d4 	ldrdhi	r9, [r6], -r4
*/
b983c:	 				push	{r4, r5, lr}
/*
    9840:	e24dd004 	sub	sp, sp, #4	; 0x4
    9844:	e1b04000 	movs	r4, r0
    9848:	e3a00000 	mov	r0, #0	; 0x0
    984c:	0a00001a 	beq	0x98bc
    9850:	e3a05001 	mov	r5, #1	; 0x1
    9854:	e3a03000 	mov	r3, #0	; 0x0
    9858:	e3a02025 	mov	r2, #37	; 0x25
    985c:	e3a01000 	mov	r1, #0	; 0x0
    9860:	e58d5000 	str	r5, [sp]
    9864:	ebfffedf 	bl	fat_01
    9868:	e3700001 	cmn	r0, #1	; 0x1
    986c:	1a000007 	bne	0x9890
    9870:	e3a03001 	mov	r3, #1	; 0x1
    9874:	e3a02025 	mov	r2, #37	; 0x25
    9878:	e3a01000 	mov	r1, #0	; 0x0
    987c:	e3a00000 	mov	r0, #0	; 0x0
    9880:	e58d5000 	str	r5, [sp]
    9884:	ebfffed7 	bl	fat_01
    9888:	e3700001 	cmn	r0, #1	; 0x1
    988c:	0a000005 	beq	0x98a8
    9890:	e59f5030 	ldr	r5, [pc, #48]	; 0x98c8
    9894:	e3a01000 	mov	r1, #0	; 0x0
    9898:	e1a02005 	mov	r2, r5
    989c:	ebffffc4 	bl	0x97b4
    98a0:	e3500000 	cmp	r0, #0	; 0x0
    98a4:	1a000001 	bne	0x98b0
    98a8:	e3a00000 	mov	r0, #0	; 0x0
    98ac:	ea000002 	b	0x98bc
    98b0:	e5953038 	ldr	r3, [r5, #56]
    98b4:	e3a00001 	mov	r0, #1	; 0x1
    98b8:	e5843000 	str	r3, [r4]
    98bc:	e28dd004 	add	sp, sp, #4	; 0x4
*/
						pop	{r4, r5, lr}
						bx	lr
/*
    98c8:	800697d8 	ldrdhi	r9, [r6], -r8
    98cc:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    98d0:	e24dd008 	sub	sp, sp, #8	; 0x8
    98d4:	e1a09000 	mov	r9, r0
    98d8:	e59f3148 	ldr	r3, [pc, #328]	; 0x9a28
    98dc:	e3a00a72 	mov	r0, #466944	; 0x72000
    98e0:	e3a0e000 	mov	lr, #0	; 0x0
    98e4:	e589303c 	str	r3, [r9, #60]
    98e8:	e3a04038 	mov	r4, #56	; 0x38
    98ec:	e2893008 	add	r3, r9, #8	; 0x8
    98f0:	e2400074 	sub	r0, r0, #116	; 0x74
    98f4:	e3a02000 	mov	r2, #0	; 0x0
    98f8:	e3a01000 	mov	r1, #0	; 0x0
    98fc:	e5894008 	str	r4, [r9, #8]
    9900:	e58de004 	str	lr, [sp, #4]
    9904:	e58d4000 	str	r4, [sp]
    9908:	eb0009c0 	bl	0xc010
    990c:	e3500000 	cmp	r0, #0	; 0x0
    9910:	1a000012 	bne	0x9960
    9914:	e59f3108 	ldr	r3, [pc, #264]	; 0x9a24
    9918:	e59f2100 	ldr	r2, [pc, #256]	; 0x9a20
    991c:	e59f10f8 	ldr	r1, [pc, #248]	; 0x9a1c
    9920:	e59fe0f0 	ldr	lr, [pc, #240]	; 0x9a18
    9924:	e59f40e8 	ldr	r4, [pc, #232]	; 0x9a14
    9928:	e59f50e0 	ldr	r5, [pc, #224]	; 0x9a10
    992c:	e59f00d8 	ldr	r0, [pc, #216]	; 0x9a0c
    9930:	e59f60d0 	ldr	r6, [pc, #208]	; 0x9a08
    9934:	e59f70c8 	ldr	r7, [pc, #200]	; 0x9a04
    9938:	e59f80c0 	ldr	r8, [pc, #192]	; 0x9a00
    993c:	e589300c 	str	r3, [r9, #12]
    9940:	e5892010 	str	r2, [r9, #16]
    9944:	e289c014 	add	ip, r9, #20	; 0x14
    9948:	e88c4002 	stm	ip, {r1, lr}
    994c:	e289c01c 	add	ip, r9, #28	; 0x1c
    9950:	e88c0030 	stm	ip, {r4, r5}
    9954:	e289c024 	add	ip, r9, #36	; 0x24
    9958:	e88c01c1 	stm	ip, {r0, r6, r7, r8}
    995c:	ea00001d 	b	0x99d8
    9960:	e599300c 	ldr	r3, [r9, #12]
    9964:	e3530000 	cmp	r3, #0	; 0x0
    9968:	0a000020 	beq	0x99f0
    996c:	e5993010 	ldr	r3, [r9, #16]
    9970:	e3530000 	cmp	r3, #0	; 0x0
    9974:	0a00001d 	beq	0x99f0
    9978:	e5993014 	ldr	r3, [r9, #20]
    997c:	e3530000 	cmp	r3, #0	; 0x0
    9980:	1a000002 	bne	0x9990
    9984:	e5993038 	ldr	r3, [r9, #56]
    9988:	e3530000 	cmp	r3, #0	; 0x0
    998c:	0a000017 	beq	0x99f0
    9990:	e5993018 	ldr	r3, [r9, #24]
    9994:	e3530000 	cmp	r3, #0	; 0x0
    9998:	0a000014 	beq	0x99f0
    999c:	e599301c 	ldr	r3, [r9, #28]
    99a0:	e3530000 	cmp	r3, #0	; 0x0
    99a4:	0a000011 	beq	0x99f0
    99a8:	e5993020 	ldr	r3, [r9, #32]
    99ac:	e3530000 	cmp	r3, #0	; 0x0
    99b0:	0a00000e 	beq	0x99f0
    99b4:	e5993024 	ldr	r3, [r9, #36]
    99b8:	e3530000 	cmp	r3, #0	; 0x0
    99bc:	0a00000b 	beq	0x99f0
    99c0:	e5993028 	ldr	r3, [r9, #40]
    99c4:	e3530000 	cmp	r3, #0	; 0x0
    99c8:	0a000008 	beq	0x99f0
    99cc:	e599303c 	ldr	r3, [r9, #60]
    99d0:	e3530000 	cmp	r3, #0	; 0x0
    99d4:	0a000005 	beq	0x99f0
    99d8:	e2890008 	add	r0, r9, #8	; 0x8
    99dc:	eb000d3c 	bl	0xced4
    99e0:	e3500000 	cmp	r0, #0	; 0x0
    99e4:	e5890004 	str	r0, [r9, #4]
    99e8:	13a00001 	movne	r0, #1	; 0x1
    99ec:	1a000000 	bne	0x99f4
    99f0:	e3a00000 	mov	r0, #0	; 0x0
    99f4:	e28dd008 	add	sp, sp, #8	; 0x8
    99f8:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    99fc:	e12fff1e 	bx	lr
    9a00:	80027098 	mulhi	r2, r8, r0
    9a04:	80027094 	mulhi	r2, r4, r0
    9a08:	80028de0 	andhi	r8, r2, r0, ror #27
    9a0c:	80028ea8 	andhi	r8, r2, r8, lsr #29
    9a10:	80028d28 	andhi	r8, r2, r8, lsr #26
    9a14:	80028f54 	andhi	r8, r2, r4, asr pc
    9a18:	80028d74 	andhi	r8, r2, r4, ror sp
    9a1c:	80027044 	andhi	r7, r2, r4, asr #32
    9a20:	80027030 	andhi	r7, r2, r0, lsr r0
    9a24:	80028adc 	ldrdhi	r8, [r2], -ip
    9a28:	80029010 	andhi	r9, r2, r0, lsl r0
    9a2c:	e92d4030 	push	{r4, r5, lr}
    9a30:	e24dd020 	sub	sp, sp, #32	; 0x20
    9a34:	e1a04000 	mov	r4, r0
    9a38:	e5943038 	ldr	r3, [r4, #56]
    9a3c:	e3530000 	cmp	r3, #0	; 0x0
    9a40:	0a000008 	beq	0x9a68
    9a44:	e3a02030 	mov	r2, #48	; 0x30
    9a48:	e5a42040 	str	r2, [r4, #64]!
    9a4c:	e3a02010 	mov	r2, #16	; 0x10
    9a50:	e28d1008 	add	r1, sp, #8	; 0x8
    9a54:	e1a00004 	mov	r0, r4
    9a58:	e58d2008 	str	r2, [sp, #8]
    9a5c:	e1a0e00f 	mov	lr, pc
    9a60:	e12fff13 	bx	r3
    9a64:	ea000028 	b	0x9b0c
    9a68:	e5943014 	ldr	r3, [r4, #20]
    9a6c:	e28d0010 	add	r0, sp, #16	; 0x10
    9a70:	e1a0e00f 	mov	lr, pc
    9a74:	e12fff13 	bx	r3
    9a78:	e3500000 	cmp	r0, #0	; 0x0
    9a7c:	0a000021 	beq	0x9b08
    9a80:	e59d3010 	ldr	r3, [sp, #16]
    9a84:	e59d2014 	ldr	r2, [sp, #20]
    9a88:	e1dd11be 	ldrh	r1, [sp, #30]
    9a8c:	e3a00a71 	mov	r0, #462848	; 0x71000
    9a90:	e5843044 	str	r3, [r4, #68]
    9a94:	e5842048 	str	r2, [r4, #72]
    9a98:	e584104c 	str	r1, [r4, #76]
    9a9c:	e3a0e001 	mov	lr, #1	; 0x1
    9aa0:	e3a05000 	mov	r5, #0	; 0x0
    9aa4:	e3a03000 	mov	r3, #0	; 0x0
    9aa8:	e3a02004 	mov	r2, #4	; 0x4
    9aac:	e28d1008 	add	r1, sp, #8	; 0x8
    9ab0:	e3800ef9 	orr	r0, r0, #3984	; 0xf90
    9ab4:	e584e050 	str	lr, [r4, #80]
    9ab8:	e58d5004 	str	r5, [sp, #4]
    9abc:	e58d5000 	str	r5, [sp]
    9ac0:	eb000952 	bl	0xc010
    9ac4:	e3500000 	cmp	r0, #0	; 0x0
    9ac8:	159d3008 	ldrne	r3, [sp, #8]
    9acc:	e1dd21bc 	ldrh	r2, [sp, #28]
    9ad0:	e59d1018 	ldr	r1, [sp, #24]
    9ad4:	13530000 	cmpne	r3, #0	; 0x0
    9ad8:	e59d3014 	ldr	r3, [sp, #20]
    9adc:	e3a00002 	mov	r0, #2	; 0x2
    9ae0:	15845054 	strne	r5, [r4, #84]
    9ae4:	05840054 	streq	r0, [r4, #84]
    9ae8:	e584006c 	str	r0, [r4, #108]
    9aec:	e584305c 	str	r3, [r4, #92]
    9af0:	e5842064 	str	r2, [r4, #100]
    9af4:	e5841068 	str	r1, [r4, #104]
    9af8:	e5845058 	str	r5, [r4, #88]
    9afc:	e5845060 	str	r5, [r4, #96]
    9b00:	e3a00001 	mov	r0, #1	; 0x1
    9b04:	ea000000 	b	0x9b0c
    9b08:	e3a00000 	mov	r0, #0	; 0x0
    9b0c:	e28dd020 	add	sp, sp, #32	; 0x20
    9b10:	e8bd4030 	pop	{r4, r5, lr}
    9b14:	e12fff1e 	bx	lr
    9b18:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    9b1c:	e59f3020 	ldr	r3, [pc, #32]	; 0x9b44
    9b20:	e1530000 	cmp	r3, r0
    9b24:	1a000004 	bne	0x9b3c
    9b28:	e5903004 	ldr	r3, [r0, #4]
    9b2c:	e3530000 	cmp	r3, #0	; 0x0
    9b30:	12801008 	addne	r1, r0, #8	; 0x8
    9b34:	11a00003 	movne	r0, r3
    9b38:	1b0009fe 	blne	0xc338
    9b3c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    9b40:	e12fff1e 	bx	lr
    9b44:	8006a7d8 	ldrdhi	sl, [r6], -r8
    9b48:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    9b4c:	e1a03000 	mov	r3, r0
    9b50:	e59f4188 	ldr	r4, [pc, #392]	; 0x9ce0
    9b54:	e1a00004 	mov	r0, r4
    9b58:	e5843000 	str	r3, [r4]
    9b5c:	ebffff5a 	bl	0x98cc
    9b60:	e3500000 	cmp	r0, #0	; 0x0
    9b64:	e1a00004 	mov	r0, r4
    9b68:	1a000002 	bne	0x9b78
    9b6c:	ebffffe9 	bl	0x9b18
    9b70:	e3a04000 	mov	r4, #0	; 0x0
    9b74:	ea000056 	b	0x9cd4
    9b78:	ebffffab 	bl	0x9a2c
    9b7c:	e3500000 	cmp	r0, #0	; 0x0
    9b80:	01a00004 	moveq	r0, r4
    9b84:	0afffff8 	beq	0x9b6c
    9b88:	e5943050 	ldr	r3, [r4, #80]
    9b8c:	e3a06000 	mov	r6, #0	; 0x0
    9b90:	e3530000 	cmp	r3, #0	; 0x0
    9b94:	0a00004e 	beq	0x9cd4
    9b98:	e2849054 	add	r9, r4, #84	; 0x54
    9b9c:	e3a0a000 	mov	sl, #0	; 0x0
    9ba0:	e0663186 	rsb	r3, r6, r6, lsl #3
    9ba4:	e0895103 	add	r5, r9, r3, lsl #2
    9ba8:	e595300c 	ldr	r3, [r5, #12]
    9bac:	e1b01003 	movs	r1, r3
    9bb0:	1a000014 	bne	0x9c08
    9bb4:	e5958004 	ldr	r8, [r5, #4]
    9bb8:	e5953008 	ldr	r3, [r5, #8]
    9bbc:	e3a07000 	mov	r7, #0	; 0x0
    9bc0:	e0833008 	add	r3, r3, r8
    9bc4:	ea000009 	b	0x9bf0
    9bc8:	e5943018 	ldr	r3, [r4, #24]
    9bcc:	e1a00008 	mov	r0, r8
    9bd0:	e1a0e00f 	mov	lr, pc
    9bd4:	e12fff13 	bx	r3
    9bd8:	e5952008 	ldr	r2, [r5, #8]
    9bdc:	e5953004 	ldr	r3, [r5, #4]
    9be0:	e310000a 	tst	r0, #10	; 0xa
    9be4:	02877001 	addeq	r7, r7, #1	; 0x1
    9be8:	e0823003 	add	r3, r2, r3
    9bec:	e2888001 	add	r8, r8, #1	; 0x1
    9bf0:	e1580003 	cmp	r8, r3
    9bf4:	3afffff3 	bcc	0x9bc8
    9bf8:	e5953018 	ldr	r3, [r5, #24]
    9bfc:	e0473003 	sub	r3, r7, r3
    9c00:	e585300c 	str	r3, [r5, #12]
    9c04:	ea00002e 	b	0x9cc4
    9c08:	e3560000 	cmp	r6, #0	; 0x0
    9c0c:	10663186 	rsbne	r3, r6, r6, lsl #3
    9c10:	10843103 	addne	r3, r4, r3, lsl #2
    9c14:	0585a004 	streq	sl, [r5, #4]
    9c18:	15932040 	ldrne	r2, [r3, #64]
    9c1c:	1593303c 	ldrne	r3, [r3, #60]
    9c20:	e3a07000 	mov	r7, #0	; 0x0
    9c24:	10823003 	addne	r3, r2, r3
    9c28:	15853004 	strne	r3, [r5, #4]
    9c2c:	e5958004 	ldr	r8, [r5, #4]
    9c30:	e3710001 	cmn	r1, #1	; 0x1
    9c34:	1a000011 	bne	0x9c80
    9c38:	e5943048 	ldr	r3, [r4, #72]
    9c3c:	e0432008 	sub	r2, r3, r8
    9c40:	e0823008 	add	r3, r2, r8
    9c44:	e5852008 	str	r2, [r5, #8]
    9c48:	ea000009 	b	0x9c74
    9c4c:	e5943018 	ldr	r3, [r4, #24]
    9c50:	e1a00008 	mov	r0, r8
    9c54:	e1a0e00f 	mov	lr, pc
    9c58:	e12fff13 	bx	r3
    9c5c:	e5952008 	ldr	r2, [r5, #8]
    9c60:	e5953004 	ldr	r3, [r5, #4]
    9c64:	e310000a 	tst	r0, #10	; 0xa
    9c68:	02877001 	addeq	r7, r7, #1	; 0x1
    9c6c:	e0823003 	add	r3, r2, r3
    9c70:	e2888001 	add	r8, r8, #1	; 0x1
    9c74:	e1580003 	cmp	r8, r3
    9c78:	3afffff3 	bcc	0x9c4c
    9c7c:	eaffffdd 	b	0x9bf8
    9c80:	e3510000 	cmp	r1, #0	; 0x0
    9c84:	0a000009 	beq	0x9cb0
    9c88:	e5943018 	ldr	r3, [r4, #24]
    9c8c:	e1a00008 	mov	r0, r8
    9c90:	e1a0e00f 	mov	lr, pc
    9c94:	e12fff13 	bx	r3
    9c98:	e595300c 	ldr	r3, [r5, #12]
    9c9c:	e310000a 	tst	r0, #10	; 0xa
    9ca0:	02877001 	addeq	r7, r7, #1	; 0x1
    9ca4:	e1570003 	cmp	r7, r3
    9ca8:	e2888001 	add	r8, r8, #1	; 0x1
    9cac:	3afffff5 	bcc	0x9c88
    9cb0:	e5952018 	ldr	r2, [r5, #24]
    9cb4:	e5953004 	ldr	r3, [r5, #4]
    9cb8:	e0423003 	sub	r3, r2, r3
    9cbc:	e0833008 	add	r3, r3, r8
    9cc0:	e5853008 	str	r3, [r5, #8]
    9cc4:	e5943050 	ldr	r3, [r4, #80]
    9cc8:	e2866001 	add	r6, r6, #1	; 0x1
    9ccc:	e1560003 	cmp	r6, r3
    9cd0:	3affffb2 	bcc	0x9ba0
    9cd4:	e1a00004 	mov	r0, r4
    9cd8:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    9cdc:	e12fff1e 	bx	lr
    9ce0:	8006a7d8 	ldrdhi	sl, [r6], -r8
    9ce4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9ce8:	e24dd008 	sub	sp, sp, #8	; 0x8
    9cec:	e1a0b002 	mov	fp, r2
    9cf0:	e1a09001 	mov	r9, r1
    9cf4:	e1a06000 	mov	r6, r0
    9cf8:	e59f11f4 	ldr	r1, [pc, #500]	; 0x9ef4
    9cfc:	e1510006 	cmp	r1, r6
    9d00:	1a00006f 	bne	0x9ec4
    9d04:	e3530001 	cmp	r3, #1	; 0x1
    9d08:	e3a00000 	mov	r0, #0	; 0x0
    9d0c:	1a00006d 	bne	0x9ec8
    9d10:	e5963050 	ldr	r3, [r6, #80]
    9d14:	e3a0e000 	mov	lr, #0	; 0x0
    9d18:	e3a08000 	mov	r8, #0	; 0x0
    9d1c:	e1b05003 	movs	r5, r3
    9d20:	e3a01000 	mov	r1, #0	; 0x0
    9d24:	0a00000e 	beq	0x9d64
    9d28:	e1a02006 	mov	r2, r6
    9d2c:	e5924064 	ldr	r4, [r2, #100]
    9d30:	e5923060 	ldr	r3, [r2, #96]
    9d34:	e159000e 	cmp	r9, lr
    9d38:	e0211394 	mla	r1, r4, r3, r1
    9d3c:	3a000001 	bcc	0x9d48
    9d40:	e1590001 	cmp	r9, r1
    9d44:	3a000014 	bcc	0x9d9c
    9d48:	e592305c 	ldr	r3, [r2, #92]
    9d4c:	e2800001 	add	r0, r0, #1	; 0x1
    9d50:	e1a0e001 	mov	lr, r1
    9d54:	e0288394 	mla	r8, r4, r3, r8
    9d58:	e282201c 	add	r2, r2, #28	; 0x1c
    9d5c:	e1500005 	cmp	r0, r5
    9d60:	3afffff1 	bcc	0x9d2c
    9d64:	e59d8000 	ldr	r8, [sp]
    9d68:	e3a05000 	mov	r5, #0	; 0x0
    9d6c:	e3550000 	cmp	r5, #0	; 0x0
    9d70:	0a000053 	beq	0x9ec4
    9d74:	e5953000 	ldr	r3, [r5]
    9d78:	e3530000 	cmp	r3, #0	; 0x0
    9d7c:	1a000022 	bne	0x9e0c
    9d80:	e5950010 	ldr	r0, [r5, #16]
    9d84:	e0497008 	sub	r7, r9, r8
    9d88:	e5954004 	ldr	r4, [r5, #4]
    9d8c:	e1a01007 	mov	r1, r7
    9d90:	eb000ccc 	bl	0xd0c8
    9d94:	e0843000 	add	r3, r4, r0
    9d98:	ea000011 	b	0x9de4
    9d9c:	e2803003 	add	r3, r0, #3	; 0x3
    9da0:	e0633183 	rsb	r3, r3, r3, lsl #3
    9da4:	e0865103 	add	r5, r6, r3, lsl #2
    9da8:	eaffffef 	b	0x9d6c
    9dac:	e5963018 	ldr	r3, [r6, #24]
    9db0:	e1a00004 	mov	r0, r4
    9db4:	e1a0e00f 	mov	lr, pc
    9db8:	e12fff13 	bx	r3
    9dbc:	e310000a 	tst	r0, #10	; 0xa
    9dc0:	15953010 	ldrne	r3, [r5, #16]
    9dc4:	e2844001 	add	r4, r4, #1	; 0x1
    9dc8:	10899003 	addne	r9, r9, r3
    9dcc:	1afffff6 	bne	0x9dac
    9dd0:	e5950010 	ldr	r0, [r5, #16]
    9dd4:	e1a01007 	mov	r1, r7
    9dd8:	eb000cba 	bl	0xd0c8
    9ddc:	e5953004 	ldr	r3, [r5, #4]
    9de0:	e0833000 	add	r3, r3, r0
    9de4:	e1540003 	cmp	r4, r3
    9de8:	9affffef 	bls	0x9dac
    9dec:	e5964020 	ldr	r4, [r6, #32]
    9df0:	e3a03001 	mov	r3, #1	; 0x1
    9df4:	e3a02000 	mov	r2, #0	; 0x0
    9df8:	e1a0100b 	mov	r1, fp
    9dfc:	e1a00009 	mov	r0, r9
    9e00:	e1a0e00f 	mov	lr, pc
    9e04:	e12fff14 	bx	r4
    9e08:	ea00002e 	b	0x9ec8
    9e0c:	e5957004 	ldr	r7, [r5, #4]
    9e10:	e5953008 	ldr	r3, [r5, #8]
    9e14:	e0873003 	add	r3, r7, r3
    9e18:	ea000027 	b	0x9ebc
    9e1c:	e5963018 	ldr	r3, [r6, #24]
    9e20:	e1a00007 	mov	r0, r7
    9e24:	e1a0e00f 	mov	lr, pc
    9e28:	e12fff13 	bx	r3
    9e2c:	e310000a 	tst	r0, #10	; 0xa
    9e30:	1a00001b 	bne	0x9ea4
    9e34:	e5953010 	ldr	r3, [r5, #16]
    9e38:	e3a0a000 	mov	sl, #0	; 0x0
    9e3c:	e3530000 	cmp	r3, #0	; 0x0
    9e40:	9a000017 	bls	0x9ea4
    9e44:	e5964020 	ldr	r4, [r6, #32]
    9e48:	e3a03001 	mov	r3, #1	; 0x1
    9e4c:	e28d2000 	add	r2, sp, #0	; 0x0
    9e50:	e3a01000 	mov	r1, #0	; 0x0
    9e54:	e08a0008 	add	r0, sl, r8
    9e58:	e1a0e00f 	mov	lr, pc
    9e5c:	e12fff14 	bx	r4
    9e60:	e3500000 	cmp	r0, #0	; 0x0
    9e64:	0a00000a 	beq	0x9e94
    9e68:	e59d3000 	ldr	r3, [sp]
    9e6c:	e1530009 	cmp	r3, r9
    9e70:	1a000007 	bne	0x9e94
    9e74:	e1dd30b6 	ldrh	r3, [sp, #6]
    9e78:	e1e03003 	mvn	r3, r3
    9e7c:	e1a03803 	lsl	r3, r3, #16
    9e80:	e1a03823 	lsr	r3, r3, #16
    9e84:	e3130004 	tst	r3, #4	; 0x4
    9e88:	0a000001 	beq	0x9e94
    9e8c:	e3130001 	tst	r3, #1	; 0x1
    9e90:	0a00000f 	beq	0x9ed4
    9e94:	e5953010 	ldr	r3, [r5, #16]
    9e98:	e28aa001 	add	sl, sl, #1	; 0x1
    9e9c:	e15a0003 	cmp	sl, r3
    9ea0:	3affffe7 	bcc	0x9e44
    9ea4:	e5952008 	ldr	r2, [r5, #8]
    9ea8:	e5953004 	ldr	r3, [r5, #4]
    9eac:	e5951010 	ldr	r1, [r5, #16]
    9eb0:	e2877001 	add	r7, r7, #1	; 0x1
    9eb4:	e0823003 	add	r3, r2, r3
    9eb8:	e0888001 	add	r8, r8, r1
    9ebc:	e1570003 	cmp	r7, r3
    9ec0:	3affffd5 	bcc	0x9e1c
    9ec4:	e3a00000 	mov	r0, #0	; 0x0
    9ec8:	e28dd008 	add	sp, sp, #8	; 0x8
    9ecc:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9ed0:	e12fff1e 	bx	lr
    9ed4:	e5964020 	ldr	r4, [r6, #32]
    9ed8:	e3a03001 	mov	r3, #1	; 0x1
    9edc:	e3a02000 	mov	r2, #0	; 0x0
    9ee0:	e1a0100b 	mov	r1, fp
    9ee4:	e08a0008 	add	r0, sl, r8
    9ee8:	e1a0e00f 	mov	lr, pc
    9eec:	e12fff14 	bx	r4
    9ef0:	eafffff4 	b	0x9ec8
*/
.x9ef4:	.word 0x8006a7d8 	

b9ef8:				 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
/*
    9efc:	e24dd010 	sub	sp, sp, #16	; 0x10
    9f00:	e1a09001 	mov	r9, r1
    9f04:	e1a0a000 	mov	sl, r0
    9f08:	e59f50e4 	ldr	r5, [pc, #228]	; 0x9ff4
    9f0c:	e3a04000 	mov	r4, #0	; 0x0
    9f10:	e5952050 	ldr	r2, [r5, #80]
    9f14:	e3520000 	cmp	r2, #0	; 0x0
    9f18:	1a000002 	bne	0x9f28
    9f1c:	e3a00000 	mov	r0, #0	; 0x0
    9f20:	ebffff08 	bl	0x9b48
    9f24:	e5952050 	ldr	r2, [r5, #80]
    9f28:	e3a08000 	mov	r8, #0	; 0x0
    9f2c:	e3520000 	cmp	r2, #0	; 0x0
    9f30:	0a00002b 	beq	0x9fe4
    9f34:	e2856054 	add	r6, r5, #84	; 0x54
    9f38:	e3a0b000 	mov	fp, #0	; 0x0
    9f3c:	e5963000 	ldr	r3, [r6]
    9f40:	e1530009 	cmp	r3, r9
    9f44:	1a000020 	bne	0x9fcc
    9f48:	e5967004 	ldr	r7, [r6, #4]
    9f4c:	e5963008 	ldr	r3, [r6, #8]
    9f50:	e0833007 	add	r3, r3, r7
    9f54:	e1570003 	cmp	r7, r3
    9f58:	2a00001b 	bcs	0x9fcc
    9f5c:	e5953018 	ldr	r3, [r5, #24]
    9f60:	e1a00007 	mov	r0, r7
    9f64:	e1a0e00f 	mov	lr, pc
    9f68:	e12fff13 	bx	r3
    9f6c:	e310000a 	tst	r0, #10	; 0xa
    9f70:	1a00000e 	bne	0x9fb0
    9f74:	e3a0b001 	mov	fp, #1	; 0x1
    9f78:	e58db00c 	str	fp, [sp, #12]
    9f7c:	e3a0b000 	mov	fp, #0	; 0x0
    9f80:	e595403c 	ldr	r4, [r5, #60]
    9f84:	e58db004 	str	fp, [sp, #4]
    9f88:	e58db000 	str	fp, [sp]
    9f8c:	e3a03000 	mov	r3, #0	; 0x0
    9f90:	e3a02008 	mov	r2, #8	; 0x8
    9f94:	e28d1008 	add	r1, sp, #8	; 0x8
    9f98:	e1a0000a 	mov	r0, sl
    9f9c:	e58d7008 	str	r7, [sp, #8]
    9fa0:	e1a0e00f 	mov	lr, pc
    9fa4:	e12fff14 	bx	r4
    9fa8:	e1b04000 	movs	r4, r0
    9fac:	0a00000b 	beq	0x9fe0
    9fb0:	e5962008 	ldr	r2, [r6, #8]
    9fb4:	e5963004 	ldr	r3, [r6, #4]
    9fb8:	e2877001 	add	r7, r7, #1	; 0x1
    9fbc:	e0823003 	add	r3, r2, r3
    9fc0:	e1570003 	cmp	r7, r3
    9fc4:	3affffe4 	bcc	0x9f5c
    9fc8:	e5952050 	ldr	r2, [r5, #80]
    9fcc:	e2888001 	add	r8, r8, #1	; 0x1
    9fd0:	e1580002 	cmp	r8, r2
    9fd4:	e286601c 	add	r6, r6, #28	; 0x1c
    9fd8:	3affffd7 	bcc	0x9f3c
    9fdc:	ea000000 	b	0x9fe4
    9fe0:	e3a04000 	mov	r4, #0	; 0x0
    9fe4:	e1a00004 	mov	r0, r4
    9fe8:	e28dd010 	add	sp, sp, #16	; 0x10
*/
						pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
						bx	lr
/*
    9ff4:	8006a7d8 	ldrdhi	sl, [r6], -r8
    9ff8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    9ffc:	e1a01000 	mov	r1, r0
    a000:	e3a00a72 	mov	r0, #466944	; 0x72000
    a004:	e240007c 	sub	r0, r0, #124	; 0x7c
    a008:	ebffffba 	bl	b9ef8
    a00c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    a010:	e12fff1e 	bx	lr
*/
ba014:				 	push	{lr}		@ (str lr, [sp, #-4]!)
						mov	r1, r0
						mov	r0, #0x72000
						sub	r0, r0, #0x78
						bl	b9ef8
						pop	{lr}		@ (ldr lr, [sp], #4)
						bx	lr

ba030:	 				push	{lr}		@ (str lr, [sp, #-4]!)
						bl	bc330
						mov	r0, #1	
						pop	{lr}		@ (ldr lr, [sp], #4)
						bx	lr

ba044:	 				push	{lr}		@ (str lr, [sp, #-4]!)
/*
    a048:	e3500000 	cmp	r0, #0	; 0x0
    a04c:	03a00000 	moveq	r0, #0	; 0x0
    a050:	049de004 	popeq	{lr}		; (ldreq lr, [sp], #4)
    a054:	012fff1e 	bxeq	lr
    a058:	e59f3030 	ldr	r3, [pc, #48]	; 0xa090
    a05c:	e3a02000 	mov	r2, #0	; 0x0
    a060:	e5802000 	str	r2, [r0]
    a064:	e5933000 	ldr	r3, [r3]
    a068:	e3a02c01 	mov	r2, #256	; 0x100
    a06c:	e3a01c02 	mov	r1, #512	; 0x200
    a070:	e3a0e802 	mov	lr, #131072	; 0x20000
    a074:	e5803004 	str	r3, [r0, #4]
    a078:	e1c020bc 	strh	r2, [r0, #12]
    a07c:	e1c010be 	strh	r1, [r0, #14]
    a080:	e580e008 	str	lr, [r0, #8]
    a084:	e3a00001 	mov	r0, #1	; 0x1
    a088:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    a08c:	e12fff1e 	bx	lr
    a090:	8006aa00 	andhi	sl, r6, r0, lsl #20
    a094:	e12fff1e 	bx	lr
    a098:	e12fff1e 	bx	lr
    a09c:	e92d4070 	push	{r4, r5, r6, lr}
    a0a0:	e1a06001 	mov	r6, r1
    a0a4:	e1a05000 	mov	r5, r0
    a0a8:	e3a00001 	mov	r0, #1	; 0x1
    a0ac:	ebfff6f8 	bl	0x7c94
    a0b0:	e59f40e8 	ldr	r4, [pc, #232]	; 0xa1a0
    a0b4:	e3a0ecff 	mov	lr, #65280	; 0xff00
    a0b8:	e38ee0fd 	orr	lr, lr, #253	; 0xfd
    a0bc:	e5943024 	ldr	r3, [r4, #36]
    a0c0:	e5942024 	ldr	r2, [r4, #36]
    a0c4:	e3a010ff 	mov	r1, #255	; 0xff
    a0c8:	e1d330b0 	ldrh	r3, [r3]
    a0cc:	e003300e 	and	r3, r3, lr
    a0d0:	e1c230b0 	strh	r3, [r2]
    a0d4:	e5943038 	ldr	r3, [r4, #56]
    a0d8:	e1c310b0 	strh	r1, [r3]
    a0dc:	e5943028 	ldr	r3, [r4, #40]
    a0e0:	e1d330b0 	ldrh	r3, [r3]
    a0e4:	e3130001 	tst	r3, #1	; 0x1
    a0e8:	0afffffb 	beq	0xa0dc
    a0ec:	e5943038 	ldr	r3, [r4, #56]
    a0f0:	e3a02050 	mov	r2, #80	; 0x50
    a0f4:	e1c320b0 	strh	r2, [r3]
    a0f8:	e5943010 	ldr	r3, [r4, #16]
    a0fc:	e3a02000 	mov	r2, #0	; 0x0
    a100:	e1c320b0 	strh	r2, [r3]
    a104:	e5942010 	ldr	r2, [r4, #16]
    a108:	e20530ff 	and	r3, r5, #255	; 0xff
    a10c:	e1c230b0 	strh	r3, [r2]
    a110:	e5942010 	ldr	r2, [r4, #16]
    a114:	e1a03805 	lsl	r3, r5, #16
    a118:	e1a03c23 	lsr	r3, r3, #24
    a11c:	e1c230b0 	strh	r3, [r2]
    a120:	e5942010 	ldr	r2, [r4, #16]
    a124:	e1a03405 	lsl	r3, r5, #8
    a128:	e1a03c23 	lsr	r3, r3, #24
    a12c:	e1c230b0 	strh	r3, [r2]
    a130:	e5943028 	ldr	r3, [r4, #40]
    a134:	e1d330b0 	ldrh	r3, [r3]
    a138:	e3130001 	tst	r3, #1	; 0x1
    a13c:	0afffffb 	beq	0xa130
    a140:	e5943030 	ldr	r3, [r4, #48]
    a144:	e5933000 	ldr	r3, [r3]
    a148:	e5863000 	str	r3, [r6]
    a14c:	e5943030 	ldr	r3, [r4, #48]
    a150:	e5d33000 	ldrb	r3, [r3]
    a154:	e5c63004 	strb	r3, [r6, #4]
    a158:	e5943030 	ldr	r3, [r4, #48]
    a15c:	e5d33000 	ldrb	r3, [r3]
    a160:	e5c63005 	strb	r3, [r6, #5]
    a164:	e5943030 	ldr	r3, [r4, #48]
    a168:	e5d32000 	ldrb	r2, [r3]
    a16c:	e1c620b6 	strh	r2, [r6, #6]
    a170:	e5943030 	ldr	r3, [r4, #48]
    a174:	e5d33000 	ldrb	r3, [r3]
    a178:	e1823403 	orr	r3, r2, r3, lsl #8
    a17c:	e1c630b6 	strh	r3, [r6, #6]
    a180:	e5943024 	ldr	r3, [r4, #36]
    a184:	e5942024 	ldr	r2, [r4, #36]
    a188:	e1d330b0 	ldrh	r3, [r3]
    a18c:	e3833002 	orr	r3, r3, #2	; 0x2
    a190:	e1c230b0 	strh	r3, [r2]
    a194:	ebfff6be 	bl	0x7c94
    a198:	e8bd4070 	pop	{r4, r5, r6, lr}
    a19c:	e12fff1e 	bx	lr
    a1a0:	8006a9fc 	strdhi	sl, [r6], -ip
    a1a4:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    a1a8:	e1a06001 	mov	r6, r1
    a1ac:	e1a07000 	mov	r7, r0
    a1b0:	e3a00001 	mov	r0, #1	; 0x1
    a1b4:	e3a05001 	mov	r5, #1	; 0x1
    a1b8:	ebfff6b5 	bl	0x7c94
    a1bc:	e59f411c 	ldr	r4, [pc, #284]	; 0xa2e0
    a1c0:	e3a0ecff 	mov	lr, #65280	; 0xff00
    a1c4:	e38ee0fd 	orr	lr, lr, #253	; 0xfd
    a1c8:	e5943024 	ldr	r3, [r4, #36]
    a1cc:	e5942024 	ldr	r2, [r4, #36]
    a1d0:	e3a010ff 	mov	r1, #255	; 0xff
    a1d4:	e1d330b0 	ldrh	r3, [r3]
    a1d8:	e003300e 	and	r3, r3, lr
    a1dc:	e1c230b0 	strh	r3, [r2]
    a1e0:	e5943038 	ldr	r3, [r4, #56]
    a1e4:	e1c310b0 	strh	r1, [r3]
    a1e8:	e5943028 	ldr	r3, [r4, #40]
    a1ec:	e1d330b0 	ldrh	r3, [r3]
    a1f0:	e3130001 	tst	r3, #1	; 0x1
    a1f4:	0afffffb 	beq	0xa1e8
    a1f8:	e5943038 	ldr	r3, [r4, #56]
    a1fc:	e3a02050 	mov	r2, #80	; 0x50
    a200:	e3a01010 	mov	r1, #16	; 0x10
    a204:	e1c320b0 	strh	r2, [r3]
    a208:	e5943038 	ldr	r3, [r4, #56]
    a20c:	e3a02080 	mov	r2, #128	; 0x80
    a210:	e1c320b0 	strh	r2, [r3]
    a214:	e5943010 	ldr	r3, [r4, #16]
    a218:	e3a02000 	mov	r2, #0	; 0x0
    a21c:	e1c320b0 	strh	r2, [r3]
    a220:	e5942010 	ldr	r2, [r4, #16]
    a224:	e20730ff 	and	r3, r7, #255	; 0xff
    a228:	e1c230b0 	strh	r3, [r2]
    a22c:	e5942010 	ldr	r2, [r4, #16]
    a230:	e1a03807 	lsl	r3, r7, #16
    a234:	e1a03c23 	lsr	r3, r3, #24
    a238:	e1c230b0 	strh	r3, [r2]
    a23c:	e5942010 	ldr	r2, [r4, #16]
    a240:	e1a03407 	lsl	r3, r7, #8
    a244:	e1a03c23 	lsr	r3, r3, #24
    a248:	e1c230b0 	strh	r3, [r2]
    a24c:	e5962000 	ldr	r2, [r6]
    a250:	e5943030 	ldr	r3, [r4, #48]
    a254:	e5832000 	str	r2, [r3]
    a258:	e5d62004 	ldrb	r2, [r6, #4]
    a25c:	e5943030 	ldr	r3, [r4, #48]
    a260:	e5c32000 	strb	r2, [r3]
    a264:	e5d62005 	ldrb	r2, [r6, #5]
    a268:	e5943030 	ldr	r3, [r4, #48]
    a26c:	e5c32000 	strb	r2, [r3]
    a270:	e1d620b6 	ldrh	r2, [r6, #6]
    a274:	e5943030 	ldr	r3, [r4, #48]
    a278:	e5c32000 	strb	r2, [r3]
    a27c:	e5d62007 	ldrb	r2, [r6, #7]
    a280:	e5943030 	ldr	r3, [r4, #48]
    a284:	e5c32000 	strb	r2, [r3]
    a288:	e5943038 	ldr	r3, [r4, #56]
    a28c:	e1c310b0 	strh	r1, [r3]
    a290:	e5943028 	ldr	r3, [r4, #40]
    a294:	e1d330b0 	ldrh	r3, [r3]
    a298:	e3130001 	tst	r3, #1	; 0x1
    a29c:	0afffffb 	beq	0xa290
    a2a0:	e5943038 	ldr	r3, [r4, #56]
    a2a4:	e3a02070 	mov	r2, #112	; 0x70
    a2a8:	e1c320b0 	strh	r2, [r3]
    a2ac:	e5943030 	ldr	r3, [r4, #48]
    a2b0:	e5d33000 	ldrb	r3, [r3]
    a2b4:	e3130001 	tst	r3, #1	; 0x1
    a2b8:	e5943024 	ldr	r3, [r4, #36]
    a2bc:	e5942024 	ldr	r2, [r4, #36]
    a2c0:	13a05000 	movne	r5, #0	; 0x0
    a2c4:	e1d330b0 	ldrh	r3, [r3]
    a2c8:	e3833002 	orr	r3, r3, #2	; 0x2
    a2cc:	e1c230b0 	strh	r3, [r2]
    a2d0:	ebfff66f 	bl	0x7c94
    a2d4:	e1a00005 	mov	r0, r5
    a2d8:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    a2dc:	e12fff1e 	bx	lr
    a2e0:	8006a9fc 	strdhi	sl, [r6], -ip
*/
ba2e4:				 	push	{r4, r5, r6, r7, r8, r9, lr}
/*
    a2e8:	e24dd014 	sub	sp, sp, #20	; 0x14
    a2ec:	e1a05002 	mov	r5, r2
    a2f0:	e1b07001 	movs	r7, r1
    a2f4:	e1a08000 	mov	r8, r0
    a2f8:	e59fe278 	ldr	lr, [pc, #632]	; 0xa578
    a2fc:	e59ee000 	ldr	lr, [lr]
    a300:	e58de010 	str	lr, [sp, #16]
    a304:	1a000001 	bne	0xa310
    a308:	e3550000 	cmp	r5, #0	; 0x0
    a30c:	0a000001 	beq	0xa318
    a310:	e3530001 	cmp	r3, #1	; 0x1
    a314:	9a000003 	bls	0xa328
    a318:	e59d0010 	ldr	r0, [sp, #16]
    a31c:	eb000b07 	bl	bcf40
    a320:	e3a06000 	mov	r6, #0	; 0x0
    a324:	ea00008e 	b	0xa564
    a328:	e3570000 	cmp	r7, #0	; 0x0
    a32c:	1a000006 	bne	0xa34c
    a330:	e1a01005 	mov	r1, r5
    a334:	e1a00008 	mov	r0, r8
    a338:	ebffff57 	bl	0xa09c
    a33c:	e59d0010 	ldr	r0, [sp, #16]
    a340:	eb000afe 	bl	bcf40
    a344:	e3a06001 	mov	r6, #1	; 0x1
    a348:	ea000085 	b	0xa564
    a34c:	e3a00001 	mov	r0, #1	; 0x1
    a350:	ebfff64f 	bl	0x7c94
    a354:	e59f4218 	ldr	r4, [pc, #536]	; 0xa574
    a358:	e3a01cff 	mov	r1, #65280	; 0xff00
    a35c:	e38110df 	orr	r1, r1, #223	; 0xdf
    a360:	e594302c 	ldr	r3, [r4, #44]
    a364:	e594202c 	ldr	r2, [r4, #44]
    a368:	e3a0ecff 	mov	lr, #65280	; 0xff00
    a36c:	e1d330b0 	ldrh	r3, [r3]
    a370:	e38ee0fd 	orr	lr, lr, #253	; 0xfd
    a374:	e1a09000 	mov	r9, r0
    a378:	e3833010 	orr	r3, r3, #16	; 0x10
    a37c:	e1c230b0 	strh	r3, [r2]
    a380:	e594302c 	ldr	r3, [r4, #44]
    a384:	e594202c 	ldr	r2, [r4, #44]
    a388:	e1d330b0 	ldrh	r3, [r3]
    a38c:	e0033001 	and	r3, r3, r1
    a390:	e1c230b0 	strh	r3, [r2]
    a394:	e594302c 	ldr	r3, [r4, #44]
    a398:	e594202c 	ldr	r2, [r4, #44]
    a39c:	e3a010ff 	mov	r1, #255	; 0xff
    a3a0:	e1d330b0 	ldrh	r3, [r3]
    a3a4:	e003300e 	and	r3, r3, lr
    a3a8:	e1c230b0 	strh	r3, [r2]
    a3ac:	e5943040 	ldr	r3, [r4, #64]
    a3b0:	e1c310b0 	strh	r1, [r3]
    a3b4:	e5943030 	ldr	r3, [r4, #48]
    a3b8:	e1d330b0 	ldrh	r3, [r3]
    a3bc:	e3130001 	tst	r3, #1	; 0x1
    a3c0:	0afffffb 	beq	0xa3b4
    a3c4:	e5943040 	ldr	r3, [r4, #64]
    a3c8:	e3a06000 	mov	r6, #0	; 0x0
    a3cc:	e20810ff 	and	r1, r8, #255	; 0xff
    a3d0:	e1c360b0 	strh	r6, [r3]
    a3d4:	e5943018 	ldr	r3, [r4, #24]
    a3d8:	e1a02808 	lsl	r2, r8, #16
    a3dc:	e1c360b0 	strh	r6, [r3]
    a3e0:	e5943018 	ldr	r3, [r4, #24]
    a3e4:	e1c310b0 	strh	r1, [r3]
    a3e8:	e5941018 	ldr	r1, [r4, #24]
    a3ec:	e1a03c22 	lsr	r3, r2, #24
    a3f0:	e1c130b0 	strh	r3, [r1]
    a3f4:	e5942018 	ldr	r2, [r4, #24]
    a3f8:	e1a03408 	lsl	r3, r8, #8
    a3fc:	e1a03c23 	lsr	r3, r3, #24
    a400:	e1c230b0 	strh	r3, [r2]
    a404:	e5943030 	ldr	r3, [r4, #48]
    a408:	e1d330b0 	ldrh	r3, [r3]
    a40c:	e3130001 	tst	r3, #1	; 0x1
    a410:	0afffffb 	beq	0xa404
    a414:	e3170003 	tst	r7, #3	; 0x3
    a418:	0a000007 	beq	0xa43c
    a41c:	e3a02000 	mov	r2, #0	; 0x0
    a420:	e5943038 	ldr	r3, [r4, #56]
    a424:	e5d33000 	ldrb	r3, [r3]
    a428:	e7c23007 	strb	r3, [r2, r7]
    a42c:	e2822001 	add	r2, r2, #1	; 0x1
    a430:	e3520c02 	cmp	r2, #512	; 0x200
    a434:	3afffff9 	bcc	0xa420
    a438:	ea000002 	b	0xa448
    a43c:	e5941038 	ldr	r1, [r4, #56]
    a440:	e1a00007 	mov	r0, r7
    a444:	eb000797 	bl	0xc2a8
    a448:	e594302c 	ldr	r3, [r4, #44]
    a44c:	e594202c 	ldr	r2, [r4, #44]
    a450:	e3550000 	cmp	r5, #0	; 0x0
    a454:	e1d330b0 	ldrh	r3, [r3]
    a458:	e3833020 	orr	r3, r3, #32	; 0x20
    a45c:	e1c230b0 	strh	r3, [r2]
    a460:	e5943000 	ldr	r3, [r4]
    a464:	e5933000 	ldr	r3, [r3]
    a468:	e58d3000 	str	r3, [sp]
    a46c:	0a000010 	beq	0xa4b4
    a470:	e5943038 	ldr	r3, [r4, #56]
    a474:	e5933000 	ldr	r3, [r3]
    a478:	e5853000 	str	r3, [r5]
    a47c:	e5943038 	ldr	r3, [r4, #56]
    a480:	e5d33000 	ldrb	r3, [r3]
    a484:	e5c53004 	strb	r3, [r5, #4]
    a488:	e5943038 	ldr	r3, [r4, #56]
    a48c:	e5d33000 	ldrb	r3, [r3]
    a490:	e5c53005 	strb	r3, [r5, #5]
    a494:	e5943038 	ldr	r3, [r4, #56]
    a498:	e5d32000 	ldrb	r2, [r3]
    a49c:	e1c520b6 	strh	r2, [r5, #6]
    a4a0:	e5943038 	ldr	r3, [r4, #56]
    a4a4:	e5d33000 	ldrb	r3, [r3]
    a4a8:	e1823403 	orr	r3, r2, r3, lsl #8
    a4ac:	e1c530b6 	strh	r3, [r5, #6]
    a4b0:	ea000007 	b	0xa4d4
    a4b4:	e3a02000 	mov	r2, #0	; 0x0
    a4b8:	e28d1008 	add	r1, sp, #8	; 0x8
    a4bc:	e5943038 	ldr	r3, [r4, #56]
    a4c0:	e5d33000 	ldrb	r3, [r3]
    a4c4:	e7c23001 	strb	r3, [r2, r1]
    a4c8:	e2822001 	add	r2, r2, #1	; 0x1
    a4cc:	e3520008 	cmp	r2, #8	; 0x8
    a4d0:	3afffff9 	bcc	0xa4bc
    a4d4:	e3a02000 	mov	r2, #0	; 0x0
    a4d8:	e28d1008 	add	r1, sp, #8	; 0x8
    a4dc:	e5943038 	ldr	r3, [r4, #56]
    a4e0:	e5d33000 	ldrb	r3, [r3]
    a4e4:	e7c23001 	strb	r3, [r2, r1]
    a4e8:	e2822001 	add	r2, r2, #1	; 0x1
    a4ec:	e3520003 	cmp	r2, #3	; 0x3
    a4f0:	3afffff9 	bcc	0xa4dc
    a4f4:	e594302c 	ldr	r3, [r4, #44]
    a4f8:	e594202c 	ldr	r2, [r4, #44]
    a4fc:	e1d330b0 	ldrh	r3, [r3]
    a500:	e3833002 	orr	r3, r3, #2	; 0x2
    a504:	e1c230b0 	strh	r3, [r2]
    a508:	e5dd2000 	ldrb	r2, [sp]
    a50c:	e5dd3008 	ldrb	r3, [sp, #8]
    a510:	e1530002 	cmp	r3, r2
    a514:	1a000007 	bne	0xa538
    a518:	e5dd2001 	ldrb	r2, [sp, #1]
    a51c:	e5dd3009 	ldrb	r3, [sp, #9]
    a520:	e1530002 	cmp	r3, r2
    a524:	1a000003 	bne	0xa538
    a528:	e5dd2002 	ldrb	r2, [sp, #2]
    a52c:	e5dd300a 	ldrb	r3, [sp, #10]
    a530:	e1530002 	cmp	r3, r2
    a534:	0a000005 	beq	0xa550
    a538:	e28d2000 	add	r2, sp, #0	; 0x0
    a53c:	e28d1008 	add	r1, sp, #8	; 0x8
    a540:	e1a00007 	mov	r0, r7
    a544:	eb000703 	bl	0xc158
    a548:	e3500000 	cmp	r0, #0	; 0x0
    a54c:	0a000000 	beq	0xa554
    a550:	e3a06001 	mov	r6, #1	; 0x1
    a554:	e1a00009 	mov	r0, r9
    a558:	ebfff5cd 	bl	0x7c94
    a55c:	e59d0010 	ldr	r0, [sp, #16]
    a560:	eb000a76 	bl	bcf40
    a564:	e1a00006 	mov	r0, r6
    a568:	e28dd014 	add	sp, sp, #20	; 0x14
    a56c:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    a570:	e12fff1e 	bx	lr
*/
.xa574:	.word 0x8006a9f4 	
.xa578:	.word 0x8006c65c 	

ba57c:	 	push	{r4, lr}
 /*
    a580:	e24dd00c 	sub	sp, sp, #12	; 0xc
    a584:	e59f304c 	ldr	r3, [pc, #76]	; 0xa5d8
    a588:	e5933000 	ldr	r3, [r3]
    a58c:	e58d3008 	str	r3, [sp, #8]
    a590:	e1a00280 	lsl	r0, r0, #5
    a594:	e28d1000 	add	r1, sp, #0	; 0x0
    a598:	e3a04000 	mov	r4, #0	; 0x0
    a59c:	ebfffebe 	bl	0xa09c
    a5a0:	e5dd3004 	ldrb	r3, [sp, #4]
    a5a4:	e3130002 	tst	r3, #2	; 0x2
    a5a8:	03a04004 	moveq	r4, #4	; 0x4
    a5ac:	e3130001 	tst	r3, #1	; 0x1
    a5b0:	e5dd3005 	ldrb	r3, [sp, #5]
    a5b4:	03844008 	orreq	r4, r4, #8	; 0x8
    a5b8:	e35300ff 	cmp	r3, #255	; 0xff
    a5bc:	13844002 	orrne	r4, r4, #2	; 0x2
    a5c0:	e59d0008 	ldr	r0, [sp, #8]
    a5c4:	eb000a5d 	bl	bcf40
    a5c8:	e1a00004 	mov	r0, r4
    a5cc:	e28dd00c 	add	sp, sp, #12	; 0xc
    a5d0:	e8bd4010 	pop	{r4, lr}
    a5d4:	e12fff1e 	bx	lr
    a5d8:	8006c65c 	andhi	ip, r6, ip, asr r6
    a5dc:	e92d4070 	push	{r4, r5, r6, lr}
    a5e0:	e1a03000 	mov	r3, r0
    a5e4:	e3a00001 	mov	r0, #1	; 0x1
    a5e8:	e3a04001 	mov	r4, #1	; 0x1
    a5ec:	e1a05283 	lsl	r5, r3, #5
    a5f0:	ebfff5a7 	bl	0x7c94
    a5f4:	e59fe0c8 	ldr	lr, [pc, #200]	; 0xa6c4
    a5f8:	e3a01cff 	mov	r1, #65280	; 0xff00
    a5fc:	e38110fd 	orr	r1, r1, #253	; 0xfd
    a600:	e59e3024 	ldr	r3, [lr, #36]
    a604:	e59e2024 	ldr	r2, [lr, #36]
    a608:	e3a060ff 	mov	r6, #255	; 0xff
    a60c:	e1d330b0 	ldrh	r3, [r3]
    a610:	e0033001 	and	r3, r3, r1
    a614:	e1c230b0 	strh	r3, [r2]
    a618:	e59e3038 	ldr	r3, [lr, #56]
    a61c:	e1c360b0 	strh	r6, [r3]
    a620:	e59e3028 	ldr	r3, [lr, #40]
    a624:	e1d330b0 	ldrh	r3, [r3]
    a628:	e3130001 	tst	r3, #1	; 0x1
    a62c:	0afffffb 	beq	0xa620
    a630:	e59e3038 	ldr	r3, [lr, #56]
    a634:	e3a02060 	mov	r2, #96	; 0x60
    a638:	e1c320b0 	strh	r2, [r3]
    a63c:	e59e2010 	ldr	r2, [lr, #16]
    a640:	e20530ff 	and	r3, r5, #255	; 0xff
    a644:	e1c230b0 	strh	r3, [r2]
    a648:	e59e2010 	ldr	r2, [lr, #16]
    a64c:	e1a03805 	lsl	r3, r5, #16
    a650:	e1a03c23 	lsr	r3, r3, #24
    a654:	e1c230b0 	strh	r3, [r2]
    a658:	e59e2010 	ldr	r2, [lr, #16]
    a65c:	e1a03405 	lsl	r3, r5, #8
    a660:	e1a03c23 	lsr	r3, r3, #24
    a664:	e1c230b0 	strh	r3, [r2]
    a668:	e59e3038 	ldr	r3, [lr, #56]
    a66c:	e3a020d0 	mov	r2, #208	; 0xd0
    a670:	e1c320b0 	strh	r2, [r3]
    a674:	e59e3028 	ldr	r3, [lr, #40]
    a678:	e1d330b0 	ldrh	r3, [r3]
    a67c:	e3130001 	tst	r3, #1	; 0x1
    a680:	0afffffb 	beq	0xa674
    a684:	e59e3038 	ldr	r3, [lr, #56]
    a688:	e3a02070 	mov	r2, #112	; 0x70
    a68c:	e1c320b0 	strh	r2, [r3]
    a690:	e59e3030 	ldr	r3, [lr, #48]
    a694:	e5d33000 	ldrb	r3, [r3]
    a698:	e3130001 	tst	r3, #1	; 0x1
    a69c:	e59e3024 	ldr	r3, [lr, #36]
    a6a0:	e59e2024 	ldr	r2, [lr, #36]
    a6a4:	13a04000 	movne	r4, #0	; 0x0
    a6a8:	e1d330b0 	ldrh	r3, [r3]
    a6ac:	e3833002 	orr	r3, r3, #2	; 0x2
    a6b0:	e1c230b0 	strh	r3, [r2]
    a6b4:	ebfff576 	bl	0x7c94
    a6b8:	e1a00004 	mov	r0, r4
    a6bc:	e8bd4070 	pop	{r4, r5, r6, lr}
    a6c0:	e12fff1e 	bx	lr
    a6c4:	8006a9fc 	strdhi	sl, [r6], -ip
    a6c8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    a6cc:	e24dd004 	sub	sp, sp, #4	; 0x4
    a6d0:	e1a05002 	mov	r5, r2
    a6d4:	e1b07001 	movs	r7, r1
    a6d8:	e1a08000 	mov	r8, r0
    a6dc:	e3a06001 	mov	r6, #1	; 0x1
    a6e0:	1a000001 	bne	0xa6ec
    a6e4:	e3550000 	cmp	r5, #0	; 0x0
    a6e8:	0a000001 	beq	0xa6f4
    a6ec:	e3530001 	cmp	r3, #1	; 0x1
    a6f0:	0a000001 	beq	0xa6fc
    a6f4:	e3a06000 	mov	r6, #0	; 0x0
    a6f8:	ea00008d 	b	0xa934
    a6fc:	e3570000 	cmp	r7, #0	; 0x0
    a700:	1a000004 	bne	0xa718
    a704:	e1a01005 	mov	r1, r5
    a708:	e1a00008 	mov	r0, r8
    a70c:	ebfffea4 	bl	0xa1a4
    a710:	e1a06000 	mov	r6, r0
    a714:	ea000086 	b	0xa934
    a718:	e3a00001 	mov	r0, #1	; 0x1
    a71c:	ebfff55c 	bl	0x7c94
    a720:	e59f421c 	ldr	r4, [pc, #540]	; 0xa944
    a724:	e3a01cff 	mov	r1, #65280	; 0xff00
    a728:	e38110df 	orr	r1, r1, #223	; 0xdf
    a72c:	e594302c 	ldr	r3, [r4, #44]
    a730:	e594202c 	ldr	r2, [r4, #44]
    a734:	e3a0ecff 	mov	lr, #65280	; 0xff00
    a738:	e1d330b0 	ldrh	r3, [r3]
    a73c:	e38ee0fd 	orr	lr, lr, #253	; 0xfd
    a740:	e3a0a0ff 	mov	sl, #255	; 0xff
    a744:	e3833010 	orr	r3, r3, #16	; 0x10
    a748:	e1c230b0 	strh	r3, [r2]
    a74c:	e594302c 	ldr	r3, [r4, #44]
    a750:	e594202c 	ldr	r2, [r4, #44]
    a754:	e1a09000 	mov	r9, r0
    a758:	e1d330b0 	ldrh	r3, [r3]
    a75c:	e0033001 	and	r3, r3, r1
    a760:	e1c230b0 	strh	r3, [r2]
    a764:	e594302c 	ldr	r3, [r4, #44]
    a768:	e594202c 	ldr	r2, [r4, #44]
    a76c:	e1d330b0 	ldrh	r3, [r3]
    a770:	e003300e 	and	r3, r3, lr
    a774:	e1c230b0 	strh	r3, [r2]
    a778:	e5943040 	ldr	r3, [r4, #64]
    a77c:	e1c3a0b0 	strh	sl, [r3]
    a780:	e5943030 	ldr	r3, [r4, #48]
    a784:	e1d330b0 	ldrh	r3, [r3]
    a788:	e3130001 	tst	r3, #1	; 0x1
    a78c:	0afffffb 	beq	0xa780
    a790:	e5943040 	ldr	r3, [r4, #64]
    a794:	e3a00000 	mov	r0, #0	; 0x0
    a798:	e3a02080 	mov	r2, #128	; 0x80
    a79c:	e1c300b0 	strh	r0, [r3]
    a7a0:	e5943040 	ldr	r3, [r4, #64]
    a7a4:	e20810ff 	and	r1, r8, #255	; 0xff
    a7a8:	e3170003 	tst	r7, #3	; 0x3
    a7ac:	e1c320b0 	strh	r2, [r3]
    a7b0:	e5943018 	ldr	r3, [r4, #24]
    a7b4:	e1a02808 	lsl	r2, r8, #16
    a7b8:	e1c300b0 	strh	r0, [r3]
    a7bc:	e5943018 	ldr	r3, [r4, #24]
    a7c0:	e1c310b0 	strh	r1, [r3]
    a7c4:	e5941018 	ldr	r1, [r4, #24]
    a7c8:	e1a03c22 	lsr	r3, r2, #24
    a7cc:	e1c130b0 	strh	r3, [r1]
    a7d0:	e5942018 	ldr	r2, [r4, #24]
    a7d4:	e1a03408 	lsl	r3, r8, #8
    a7d8:	e1a03c23 	lsr	r3, r3, #24
    a7dc:	e1c230b0 	strh	r3, [r2]
    a7e0:	0a000007 	beq	0xa804
    a7e4:	e3a01000 	mov	r1, #0	; 0x0
    a7e8:	e7d12007 	ldrb	r2, [r1, r7]
    a7ec:	e5943038 	ldr	r3, [r4, #56]
    a7f0:	e2811001 	add	r1, r1, #1	; 0x1
    a7f4:	e3510c02 	cmp	r1, #512	; 0x200
    a7f8:	e5c32000 	strb	r2, [r3]
    a7fc:	3afffff9 	bcc	0xa7e8
    a800:	ea000002 	b	0xa810
    a804:	e5941038 	ldr	r1, [r4, #56]
    a808:	e1a00007 	mov	r0, r7
    a80c:	eb0006b4 	bl	0xc2e4
    a810:	e594302c 	ldr	r3, [r4, #44]
    a814:	e594202c 	ldr	r2, [r4, #44]
    a818:	e3550000 	cmp	r5, #0	; 0x0
    a81c:	e1d330b0 	ldrh	r3, [r3]
    a820:	e3833020 	orr	r3, r3, #32	; 0x20
    a824:	e1c230b0 	strh	r3, [r2]
    a828:	e5943000 	ldr	r3, [r4]
    a82c:	e5931000 	ldr	r1, [r3]
    a830:	0a00000f 	beq	0xa874
    a834:	e5942038 	ldr	r2, [r4, #56]
    a838:	e5953000 	ldr	r3, [r5]
    a83c:	e5823000 	str	r3, [r2]
    a840:	e5d52004 	ldrb	r2, [r5, #4]
    a844:	e5943038 	ldr	r3, [r4, #56]
    a848:	e5c32000 	strb	r2, [r3]
    a84c:	e5d52005 	ldrb	r2, [r5, #5]
    a850:	e5943038 	ldr	r3, [r4, #56]
    a854:	e5c32000 	strb	r2, [r3]
    a858:	e1d520b6 	ldrh	r2, [r5, #6]
    a85c:	e5943038 	ldr	r3, [r4, #56]
    a860:	e5c32000 	strb	r2, [r3]
    a864:	e5d52007 	ldrb	r2, [r5, #7]
    a868:	e5943038 	ldr	r3, [r4, #56]
    a86c:	e5c32000 	strb	r2, [r3]
    a870:	ea000004 	b	0xa888
    a874:	e3a02008 	mov	r2, #8	; 0x8
    a878:	e5943038 	ldr	r3, [r4, #56]
    a87c:	e2522001 	subs	r2, r2, #1	; 0x1
    a880:	e5c3a000 	strb	sl, [r3]
    a884:	1afffffb 	bne	0xa878
    a888:	e1a03421 	lsr	r3, r1, #8
    a88c:	e1a02821 	lsr	r2, r1, #16
    a890:	e5cd1000 	strb	r1, [sp]
    a894:	e5cd3001 	strb	r3, [sp, #1]
    a898:	e5cd2002 	strb	r2, [sp, #2]
    a89c:	e3a01000 	mov	r1, #0	; 0x0
    a8a0:	e28d0000 	add	r0, sp, #0	; 0x0
    a8a4:	e7d12000 	ldrb	r2, [r1, r0]
    a8a8:	e5943038 	ldr	r3, [r4, #56]
    a8ac:	e2811001 	add	r1, r1, #1	; 0x1
    a8b0:	e3510003 	cmp	r1, #3	; 0x3
    a8b4:	e5c32000 	strb	r2, [r3]
    a8b8:	3afffff9 	bcc	0xa8a4
    a8bc:	e3a02005 	mov	r2, #5	; 0x5
    a8c0:	e5943038 	ldr	r3, [r4, #56]
    a8c4:	e2522001 	subs	r2, r2, #1	; 0x1
    a8c8:	e5c3a000 	strb	sl, [r3]
    a8cc:	1afffffb 	bne	0xa8c0
    a8d0:	e5943030 	ldr	r3, [r4, #48]
    a8d4:	e1d330b0 	ldrh	r3, [r3]
    a8d8:	e3130001 	tst	r3, #1	; 0x1
    a8dc:	0afffffb 	beq	0xa8d0
    a8e0:	e5943040 	ldr	r3, [r4, #64]
    a8e4:	e3a02010 	mov	r2, #16	; 0x10
    a8e8:	e1c320b0 	strh	r2, [r3]
    a8ec:	e5943030 	ldr	r3, [r4, #48]
    a8f0:	e1d330b0 	ldrh	r3, [r3]
    a8f4:	e3130001 	tst	r3, #1	; 0x1
    a8f8:	0afffffb 	beq	0xa8ec
    a8fc:	e5943040 	ldr	r3, [r4, #64]
    a900:	e3a02070 	mov	r2, #112	; 0x70
    a904:	e1a00009 	mov	r0, r9
    a908:	e1c320b0 	strh	r2, [r3]
    a90c:	e5943038 	ldr	r3, [r4, #56]
    a910:	e5d33000 	ldrb	r3, [r3]
    a914:	e3130001 	tst	r3, #1	; 0x1
    a918:	e594302c 	ldr	r3, [r4, #44]
    a91c:	e594202c 	ldr	r2, [r4, #44]
    a920:	13a06000 	movne	r6, #0	; 0x0
    a924:	e1d330b0 	ldrh	r3, [r3]
    a928:	e3833002 	orr	r3, r3, #2	; 0x2
    a92c:	e1c230b0 	strh	r3, [r2]
    a930:	ebfff4d7 	bl	0x7c94
    a934:	e1a00006 	mov	r0, r6
    a938:	e28dd004 	add	sp, sp, #4	; 0x4
    a93c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    a940:	e12fff1e 	bx	lr
    a944:	8006a9f4 	strdhi	sl, [r6], -r4
    a948:	e92d4070 	push	{r4, r5, r6, lr}
    a94c:	e1a03000 	mov	r3, r0
    a950:	e3a00001 	mov	r0, #1	; 0x1
    a954:	e1a05283 	lsl	r5, r3, #5
    a958:	e3a04001 	mov	r4, #1	; 0x1
    a95c:	ebfff4cc 	bl	0x7c94
    a960:	e59fe100 	ldr	lr, [pc, #256]	; 0xaa68
    a964:	e3a01cff 	mov	r1, #65280	; 0xff00
    a968:	e38110fd 	orr	r1, r1, #253	; 0xfd
    a96c:	e59e3024 	ldr	r3, [lr, #36]
    a970:	e59e2024 	ldr	r2, [lr, #36]
    a974:	e3a060ff 	mov	r6, #255	; 0xff
    a978:	e1d330b0 	ldrh	r3, [r3]
    a97c:	e0033001 	and	r3, r3, r1
    a980:	e1c230b0 	strh	r3, [r2]
    a984:	e59e3028 	ldr	r3, [lr, #40]
    a988:	e59e2028 	ldr	r2, [lr, #40]
    a98c:	e1d330b0 	ldrh	r3, [r3]
    a990:	e3833004 	orr	r3, r3, #4	; 0x4
    a994:	e1c230b0 	strh	r3, [r2]
    a998:	e59e3038 	ldr	r3, [lr, #56]
    a99c:	e1c360b0 	strh	r6, [r3]
    a9a0:	e59e3028 	ldr	r3, [lr, #40]
    a9a4:	e1d330b0 	ldrh	r3, [r3]
    a9a8:	e3130001 	tst	r3, #1	; 0x1
    a9ac:	0afffffb 	beq	0xa9a0
    a9b0:	e59e3038 	ldr	r3, [lr, #56]
    a9b4:	e3a02050 	mov	r2, #80	; 0x50
    a9b8:	e1c320b0 	strh	r2, [r3]
    a9bc:	e59e3038 	ldr	r3, [lr, #56]
    a9c0:	e3a02080 	mov	r2, #128	; 0x80
    a9c4:	e1c320b0 	strh	r2, [r3]
    a9c8:	e59e3010 	ldr	r3, [lr, #16]
    a9cc:	e3a02005 	mov	r2, #5	; 0x5
    a9d0:	e1c320b0 	strh	r2, [r3]
    a9d4:	e59e2010 	ldr	r2, [lr, #16]
    a9d8:	e20530ff 	and	r3, r5, #255	; 0xff
    a9dc:	e1c230b0 	strh	r3, [r2]
    a9e0:	e59e2010 	ldr	r2, [lr, #16]
    a9e4:	e1a03805 	lsl	r3, r5, #16
    a9e8:	e1a03c23 	lsr	r3, r3, #24
    a9ec:	e1c230b0 	strh	r3, [r2]
    a9f0:	e59e2010 	ldr	r2, [lr, #16]
    a9f4:	e1a03405 	lsl	r3, r5, #8
    a9f8:	e1a03c23 	lsr	r3, r3, #24
    a9fc:	e1c230b0 	strh	r3, [r2]
    aa00:	e59e3030 	ldr	r3, [lr, #48]
    aa04:	e3a02000 	mov	r2, #0	; 0x0
    aa08:	e5c32000 	strb	r2, [r3]
    aa0c:	e59e3038 	ldr	r3, [lr, #56]
    aa10:	e3a02010 	mov	r2, #16	; 0x10
    aa14:	e1c320b0 	strh	r2, [r3]
    aa18:	e59e3028 	ldr	r3, [lr, #40]
    aa1c:	e1d330b0 	ldrh	r3, [r3]
    aa20:	e3130001 	tst	r3, #1	; 0x1
    aa24:	0afffffb 	beq	0xaa18
    aa28:	e59e3038 	ldr	r3, [lr, #56]
    aa2c:	e3a02070 	mov	r2, #112	; 0x70
    aa30:	e1c320b0 	strh	r2, [r3]
    aa34:	e59e3030 	ldr	r3, [lr, #48]
    aa38:	e5d33000 	ldrb	r3, [r3]
    aa3c:	e3130001 	tst	r3, #1	; 0x1
    aa40:	e59e3024 	ldr	r3, [lr, #36]
    aa44:	e59e2024 	ldr	r2, [lr, #36]
    aa48:	13a04000 	movne	r4, #0	; 0x0
    aa4c:	e1d330b0 	ldrh	r3, [r3]
    aa50:	e3833002 	orr	r3, r3, #2	; 0x2
    aa54:	e1c230b0 	strh	r3, [r2]
    aa58:	ebfff48d 	bl	0x7c94
    aa5c:	e1a00004 	mov	r0, r4
    aa60:	e8bd4070 	pop	{r4, r5, r6, lr}
    aa64:	e12fff1e 	bx	lr
    aa68:	8006a9fc 	strdhi	sl, [r6], -ip
    aa6c:	e92d4070 	push	{r4, r5, r6, lr}
    aa70:	e1a03000 	mov	r3, r0
    aa74:	e3a00001 	mov	r0, #1	; 0x1
    aa78:	e1a05283 	lsl	r5, r3, #5
    aa7c:	e3a04001 	mov	r4, #1	; 0x1
    aa80:	ebfff483 	bl	0x7c94
    aa84:	e59fe100 	ldr	lr, [pc, #256]	; 0xab8c
    aa88:	e3a01cff 	mov	r1, #65280	; 0xff00
    aa8c:	e38110fd 	orr	r1, r1, #253	; 0xfd
    aa90:	e59e3024 	ldr	r3, [lr, #36]
    aa94:	e59e2024 	ldr	r2, [lr, #36]
    aa98:	e3a060ff 	mov	r6, #255	; 0xff
    aa9c:	e1d330b0 	ldrh	r3, [r3]
    aaa0:	e0033001 	and	r3, r3, r1
    aaa4:	e1c230b0 	strh	r3, [r2]
    aaa8:	e59e3028 	ldr	r3, [lr, #40]
    aaac:	e59e2028 	ldr	r2, [lr, #40]
    aab0:	e1d330b0 	ldrh	r3, [r3]
    aab4:	e3833004 	orr	r3, r3, #4	; 0x4
    aab8:	e1c230b0 	strh	r3, [r2]
    aabc:	e59e3038 	ldr	r3, [lr, #56]
    aac0:	e1c360b0 	strh	r6, [r3]
    aac4:	e59e3028 	ldr	r3, [lr, #40]
    aac8:	e1d330b0 	ldrh	r3, [r3]
    aacc:	e3130001 	tst	r3, #1	; 0x1
    aad0:	0afffffb 	beq	0xaac4
    aad4:	e59e3038 	ldr	r3, [lr, #56]
    aad8:	e3a02050 	mov	r2, #80	; 0x50
    aadc:	e1c320b0 	strh	r2, [r3]
    aae0:	e59e3038 	ldr	r3, [lr, #56]
    aae4:	e3a02080 	mov	r2, #128	; 0x80
    aae8:	e1c320b0 	strh	r2, [r3]
    aaec:	e59e3010 	ldr	r3, [lr, #16]
    aaf0:	e3a02004 	mov	r2, #4	; 0x4
    aaf4:	e1c320b0 	strh	r2, [r3]
    aaf8:	e59e2010 	ldr	r2, [lr, #16]
    aafc:	e20530ff 	and	r3, r5, #255	; 0xff
    ab00:	e1c230b0 	strh	r3, [r2]
    ab04:	e59e2010 	ldr	r2, [lr, #16]
    ab08:	e1a03805 	lsl	r3, r5, #16
    ab0c:	e1a03c23 	lsr	r3, r3, #24
    ab10:	e1c230b0 	strh	r3, [r2]
    ab14:	e59e2010 	ldr	r2, [lr, #16]
    ab18:	e1a03405 	lsl	r3, r5, #8
    ab1c:	e1a03c23 	lsr	r3, r3, #24
    ab20:	e1c230b0 	strh	r3, [r2]
    ab24:	e59e3030 	ldr	r3, [lr, #48]
    ab28:	e3a020fe 	mov	r2, #254	; 0xfe
    ab2c:	e5c32000 	strb	r2, [r3]
    ab30:	e59e3038 	ldr	r3, [lr, #56]
    ab34:	e3a02010 	mov	r2, #16	; 0x10
    ab38:	e1c320b0 	strh	r2, [r3]
    ab3c:	e59e3028 	ldr	r3, [lr, #40]
    ab40:	e1d330b0 	ldrh	r3, [r3]
    ab44:	e3130001 	tst	r3, #1	; 0x1
    ab48:	0afffffb 	beq	0xab3c
    ab4c:	e59e3038 	ldr	r3, [lr, #56]
    ab50:	e3a02070 	mov	r2, #112	; 0x70
    ab54:	e1c320b0 	strh	r2, [r3]
    ab58:	e59e3030 	ldr	r3, [lr, #48]
    ab5c:	e5d33000 	ldrb	r3, [r3]
    ab60:	e3130001 	tst	r3, #1	; 0x1
    ab64:	e59e3024 	ldr	r3, [lr, #36]
    ab68:	e59e2024 	ldr	r2, [lr, #36]
    ab6c:	13a04000 	movne	r4, #0	; 0x0
    ab70:	e1d330b0 	ldrh	r3, [r3]
    ab74:	e3833002 	orr	r3, r3, #2	; 0x2
    ab78:	e1c230b0 	strh	r3, [r2]
    ab7c:	ebfff444 	bl	0x7c94
    ab80:	e1a00004 	mov	r0, r4
    ab84:	e8bd4070 	pop	{r4, r5, r6, lr}
    ab88:	e12fff1e 	bx	lr
    ab8c:	8006a9fc 	strdhi	sl, [r6], -ip
    ab90:	e92d4030 	push	{r4, r5, lr}
    ab94:	e1a04001 	mov	r4, r1
    ab98:	e1a05000 	mov	r5, r0
    ab9c:	e3140002 	tst	r4, #2	; 0x2
    aba0:	0a000002 	beq	0xabb0
    aba4:	ebffff67 	bl	0xa948
    aba8:	e3500000 	cmp	r0, #0	; 0x0
    abac:	0a00000b 	beq	0xabe0
    abb0:	e3140008 	tst	r4, #8	; 0x8
    abb4:	0a000003 	beq	0xabc8
    abb8:	e1a00005 	mov	r0, r5
    abbc:	ebffffaa 	bl	0xaa6c
    abc0:	e3500000 	cmp	r0, #0	; 0x0
    abc4:	0a000005 	beq	0xabe0
    abc8:	e3140004 	tst	r4, #4	; 0x4
    abcc:	0a000006 	beq	0xabec
    abd0:	e1a00005 	mov	r0, r5
    abd4:	ebfffe68 	bl	ba57c
    abd8:	e3100004 	tst	r0, #4	; 0x4
    abdc:	1a000002 	bne	0xabec
    abe0:	e3a00000 	mov	r0, #0	; 0x0
    abe4:	e8bd4030 	pop	{r4, r5, lr}
    abe8:	e12fff1e 	bx	lr
    abec:	e3a00001 	mov	r0, #1	; 0x1
    abf0:	e8bd4030 	pop	{r4, r5, lr}
    abf4:	e12fff1e 	bx	lr
    abf8:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    abfc:	e24dd004 	sub	sp, sp, #4	; 0x4
    ac00:	e1a05001 	mov	r5, r1
    ac04:	e1a02000 	mov	r2, r0
    ac08:	e2023003 	and	r3, r2, #3	; 0x3
    ac0c:	e2833080 	add	r3, r3, #128	; 0x80
    ac10:	e3a00001 	mov	r0, #1	; 0x1
    ac14:	e1a06203 	lsl	r6, r3, #4
    ac18:	e1a07122 	lsr	r7, r2, #2
    ac1c:	ebfff41c 	bl	0x7c94
    ac20:	e59f40f0 	ldr	r4, [pc, #240]	; 0xad18
    ac24:	e3a0ecff 	mov	lr, #65280	; 0xff00
    ac28:	e38ee0fd 	orr	lr, lr, #253	; 0xfd
    ac2c:	e5943024 	ldr	r3, [r4, #36]
    ac30:	e5942024 	ldr	r2, [r4, #36]
    ac34:	e3a010ff 	mov	r1, #255	; 0xff
    ac38:	e1d330b0 	ldrh	r3, [r3]
    ac3c:	e003300e 	and	r3, r3, lr
    ac40:	e1c230b0 	strh	r3, [r2]
    ac44:	e5943038 	ldr	r3, [r4, #56]
    ac48:	e1c310b0 	strh	r1, [r3]
    ac4c:	e5943028 	ldr	r3, [r4, #40]
    ac50:	e1d330b0 	ldrh	r3, [r3]
    ac54:	e3130001 	tst	r3, #1	; 0x1
    ac58:	0afffffb 	beq	0xac4c
    ac5c:	e5943038 	ldr	r3, [r4, #56]
    ac60:	e3a02000 	mov	r2, #0	; 0x0
    ac64:	e1c320b0 	strh	r2, [r3]
    ac68:	e5942010 	ldr	r2, [r4, #16]
    ac6c:	e20630ff 	and	r3, r6, #255	; 0xff
    ac70:	e1c230b0 	strh	r3, [r2]
    ac74:	e5942010 	ldr	r2, [r4, #16]
    ac78:	e1a03446 	asr	r3, r6, #8
    ac7c:	e20330ff 	and	r3, r3, #255	; 0xff
    ac80:	e1c230b0 	strh	r3, [r2]
    ac84:	e5942010 	ldr	r2, [r4, #16]
    ac88:	e20730ff 	and	r3, r7, #255	; 0xff
    ac8c:	e1c230b0 	strh	r3, [r2]
    ac90:	e5942010 	ldr	r2, [r4, #16]
    ac94:	e1a03447 	asr	r3, r7, #8
    ac98:	e20330ff 	and	r3, r3, #255	; 0xff
    ac9c:	e1c230b0 	strh	r3, [r2]
    aca0:	e5943038 	ldr	r3, [r4, #56]
    aca4:	e3a02030 	mov	r2, #48	; 0x30
    aca8:	e1c320b0 	strh	r2, [r3]
    acac:	e5943028 	ldr	r3, [r4, #40]
    acb0:	e1d330b0 	ldrh	r3, [r3]
    acb4:	e3130001 	tst	r3, #1	; 0x1
    acb8:	0afffffb 	beq	0xacac
    acbc:	e5943030 	ldr	r3, [r4, #48]
    acc0:	e5933000 	ldr	r3, [r3]
    acc4:	e5853000 	str	r3, [r5]
    acc8:	e5943030 	ldr	r3, [r4, #48]
    accc:	e5933000 	ldr	r3, [r3]
    acd0:	e58d3000 	str	r3, [sp]
    acd4:	e59d3000 	ldr	r3, [sp]
    acd8:	e59d2000 	ldr	r2, [sp]
    acdc:	e59d1000 	ldr	r1, [sp]
    ace0:	e5c53004 	strb	r3, [r5, #4]
    ace4:	e1a02422 	lsr	r2, r2, #8
    ace8:	e1a03821 	lsr	r3, r1, #16
    acec:	e1c530b6 	strh	r3, [r5, #6]
    acf0:	e5c52005 	strb	r2, [r5, #5]
    acf4:	e5943024 	ldr	r3, [r4, #36]
    acf8:	e5942024 	ldr	r2, [r4, #36]
    acfc:	e1d330b0 	ldrh	r3, [r3]
    ad00:	e3833002 	orr	r3, r3, #2	; 0x2
    ad04:	e1c230b0 	strh	r3, [r2]
    ad08:	ebfff3e1 	bl	0x7c94
    ad0c:	e28dd004 	add	sp, sp, #4	; 0x4
    ad10:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    ad14:	e12fff1e 	bx	lr
    ad18:	8006a9fc 	strdhi	sl, [r6], -ip
    ad1c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    ad20:	e24dd004 	sub	sp, sp, #4	; 0x4
    ad24:	e1a06001 	mov	r6, r1
    ad28:	e1a02000 	mov	r2, r0
    ad2c:	e2023003 	and	r3, r2, #3	; 0x3
    ad30:	e2833080 	add	r3, r3, #128	; 0x80
    ad34:	e3a00001 	mov	r0, #1	; 0x1
    ad38:	e1a07203 	lsl	r7, r3, #4
    ad3c:	e3a05001 	mov	r5, #1	; 0x1
    ad40:	e1a08122 	lsr	r8, r2, #2
    ad44:	ebfff3d2 	bl	0x7c94
    ad48:	e59f4108 	ldr	r4, [pc, #264]	; 0xae58
    ad4c:	e3a0ecff 	mov	lr, #65280	; 0xff00
    ad50:	e38ee0fd 	orr	lr, lr, #253	; 0xfd
    ad54:	e5943024 	ldr	r3, [r4, #36]
    ad58:	e5942024 	ldr	r2, [r4, #36]
    ad5c:	e3a010ff 	mov	r1, #255	; 0xff
    ad60:	e1d330b0 	ldrh	r3, [r3]
    ad64:	e003300e 	and	r3, r3, lr
    ad68:	e1c230b0 	strh	r3, [r2]
    ad6c:	e5943038 	ldr	r3, [r4, #56]
    ad70:	e1c310b0 	strh	r1, [r3]
    ad74:	e5943028 	ldr	r3, [r4, #40]
    ad78:	e1d330b0 	ldrh	r3, [r3]
    ad7c:	e3130001 	tst	r3, #1	; 0x1
    ad80:	0afffffb 	beq	0xad74
    ad84:	e5943038 	ldr	r3, [r4, #56]
    ad88:	e3a02080 	mov	r2, #128	; 0x80
    ad8c:	e3a0e010 	mov	lr, #16	; 0x10
    ad90:	e1c320b0 	strh	r2, [r3]
    ad94:	e5942010 	ldr	r2, [r4, #16]
    ad98:	e20730ff 	and	r3, r7, #255	; 0xff
    ad9c:	e1c230b0 	strh	r3, [r2]
    ada0:	e5942010 	ldr	r2, [r4, #16]
    ada4:	e1a03447 	asr	r3, r7, #8
    ada8:	e20330ff 	and	r3, r3, #255	; 0xff
    adac:	e1c230b0 	strh	r3, [r2]
    adb0:	e5942010 	ldr	r2, [r4, #16]
    adb4:	e20830ff 	and	r3, r8, #255	; 0xff
    adb8:	e1c230b0 	strh	r3, [r2]
    adbc:	e5942010 	ldr	r2, [r4, #16]
    adc0:	e1a03448 	asr	r3, r8, #8
    adc4:	e20330ff 	and	r3, r3, #255	; 0xff
    adc8:	e1c230b0 	strh	r3, [r2]
    adcc:	e5962000 	ldr	r2, [r6]
    add0:	e5943030 	ldr	r3, [r4, #48]
    add4:	e5832000 	str	r2, [r3]
    add8:	e1d610b6 	ldrh	r1, [r6, #6]
    addc:	e5d63005 	ldrb	r3, [r6, #5]
    ade0:	e5d62004 	ldrb	r2, [r6, #4]
    ade4:	e1833401 	orr	r3, r3, r1, lsl #8
    ade8:	e1823403 	orr	r3, r2, r3, lsl #8
    adec:	e58d3000 	str	r3, [sp]
    adf0:	e59d2000 	ldr	r2, [sp]
    adf4:	e5943030 	ldr	r3, [r4, #48]
    adf8:	e5832000 	str	r2, [r3]
    adfc:	e5943038 	ldr	r3, [r4, #56]
    ae00:	e1c3e0b0 	strh	lr, [r3]
    ae04:	e5943028 	ldr	r3, [r4, #40]
    ae08:	e1d330b0 	ldrh	r3, [r3]
    ae0c:	e3130001 	tst	r3, #1	; 0x1
    ae10:	0afffffb 	beq	0xae04
    ae14:	e5943038 	ldr	r3, [r4, #56]
    ae18:	e3a02070 	mov	r2, #112	; 0x70
    ae1c:	e1c320b0 	strh	r2, [r3]
    ae20:	e5943030 	ldr	r3, [r4, #48]
    ae24:	e5d33000 	ldrb	r3, [r3]
    ae28:	e3130001 	tst	r3, #1	; 0x1
    ae2c:	e5943024 	ldr	r3, [r4, #36]
    ae30:	e5942024 	ldr	r2, [r4, #36]
    ae34:	13a05000 	movne	r5, #0	; 0x0
    ae38:	e1d330b0 	ldrh	r3, [r3]
    ae3c:	e3833002 	orr	r3, r3, #2	; 0x2
    ae40:	e1c230b0 	strh	r3, [r2]
    ae44:	ebfff392 	bl	0x7c94
    ae48:	e1a00005 	mov	r0, r5
    ae4c:	e28dd004 	add	sp, sp, #4	; 0x4
    ae50:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    ae54:	e12fff1e 	bx	lr
    ae58:	8006a9fc 	strdhi	sl, [r6], -ip
  */
bae5c:	 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
/*
    ae60:	e24dd014 	sub	sp, sp, #20	; 0x14
    ae64:	e1a05002 	mov	r5, r2
    ae68:	e1b07001 	movs	r7, r1
    ae6c:	e59fe318 	ldr	lr, [pc, #792]	; 0xb18c
    ae70:	e59ee000 	ldr	lr, [lr]
    ae74:	e58de010 	str	lr, [sp, #16]
    ae78:	e2004003 	and	r4, r0, #3	; 0x3
    ae7c:	e284e080 	add	lr, r4, #128	; 0x80
    ae80:	e1a0a20e 	lsl	sl, lr, #4
    ae84:	e1a06484 	lsl	r6, r4, #9
    ae88:	e1a09120 	lsr	r9, r0, #2
    ae8c:	1a000001 	bne	0xae98
    ae90:	e3550000 	cmp	r5, #0	; 0x0
    ae94:	0a000001 	beq	0xaea0
    ae98:	e3530001 	cmp	r3, #1	; 0x1
    ae9c:	9a000003 	bls	0xaeb0
    aea0:	e59d0010 	ldr	r0, [sp, #16]
    aea4:	eb000825 	bl	bcf40
    aea8:	e3a08000 	mov	r8, #0	; 0x0
    aeac:	ea0000b1 	b	0xb178
    aeb0:	e3570000 	cmp	r7, #0	; 0x0
    aeb4:	1a000005 	bne	0xaed0
    aeb8:	e1a01005 	mov	r1, r5
    aebc:	ebffff4d 	bl	0xabf8
    aec0:	e59d0010 	ldr	r0, [sp, #16]
    aec4:	eb00081d 	bl	bcf40
    aec8:	e3a08001 	mov	r8, #1	; 0x1
    aecc:	ea0000a9 	b	0xb178
    aed0:	e3a00001 	mov	r0, #1	; 0x1
    aed4:	ebfff36e 	bl	0x7c94
    aed8:	e59f42a8 	ldr	r4, [pc, #680]	; 0xb188
    aedc:	e3a01cff 	mov	r1, #65280	; 0xff00
    aee0:	e38110df 	orr	r1, r1, #223	; 0xdf
    aee4:	e594302c 	ldr	r3, [r4, #44]
    aee8:	e594202c 	ldr	r2, [r4, #44]
    aeec:	e3a0ecff 	mov	lr, #65280	; 0xff00
    aef0:	e1d330b0 	ldrh	r3, [r3]
    aef4:	e38ee0fd 	orr	lr, lr, #253	; 0xfd
    aef8:	e1a0b000 	mov	fp, r0
    aefc:	e3833010 	orr	r3, r3, #16	; 0x10
    af00:	e1c230b0 	strh	r3, [r2]
    af04:	e594302c 	ldr	r3, [r4, #44]
    af08:	e594202c 	ldr	r2, [r4, #44]
    af0c:	e1d330b0 	ldrh	r3, [r3]
    af10:	e0033001 	and	r3, r3, r1
    af14:	e1c230b0 	strh	r3, [r2]
    af18:	e594302c 	ldr	r3, [r4, #44]
    af1c:	e594202c 	ldr	r2, [r4, #44]
    af20:	e3a010ff 	mov	r1, #255	; 0xff
    af24:	e1d330b0 	ldrh	r3, [r3]
    af28:	e003300e 	and	r3, r3, lr
    af2c:	e1c230b0 	strh	r3, [r2]
    af30:	e5943040 	ldr	r3, [r4, #64]
    af34:	e1c310b0 	strh	r1, [r3]
    af38:	e5943030 	ldr	r3, [r4, #48]
    af3c:	e1d330b0 	ldrh	r3, [r3]
    af40:	e3130001 	tst	r3, #1	; 0x1
    af44:	0afffffb 	beq	0xaf38
    af48:	e5943040 	ldr	r3, [r4, #64]
    af4c:	e3a08000 	mov	r8, #0	; 0x0
    af50:	e1c380b0 	strh	r8, [r3]
    af54:	e5942018 	ldr	r2, [r4, #24]
    af58:	e20630ff 	and	r3, r6, #255	; 0xff
    af5c:	e1c230b0 	strh	r3, [r2]
    af60:	e5942018 	ldr	r2, [r4, #24]
    af64:	e1a03446 	asr	r3, r6, #8
    af68:	e20330ff 	and	r3, r3, #255	; 0xff
    af6c:	e1c230b0 	strh	r3, [r2]
    af70:	e5942018 	ldr	r2, [r4, #24]
    af74:	e20930ff 	and	r3, r9, #255	; 0xff
    af78:	e1c230b0 	strh	r3, [r2]
    af7c:	e5942018 	ldr	r2, [r4, #24]
    af80:	e1a03449 	asr	r3, r9, #8
    af84:	e20330ff 	and	r3, r3, #255	; 0xff
    af88:	e1c230b0 	strh	r3, [r2]
    af8c:	e5943040 	ldr	r3, [r4, #64]
    af90:	e3a02030 	mov	r2, #48	; 0x30
    af94:	e1c320b0 	strh	r2, [r3]
    af98:	e5943030 	ldr	r3, [r4, #48]
    af9c:	e1d330b0 	ldrh	r3, [r3]
    afa0:	e3130001 	tst	r3, #1	; 0x1
    afa4:	0afffffb 	beq	0xaf98
    afa8:	e3170003 	tst	r7, #3	; 0x3
    afac:	0a000013 	beq	0xb000
    afb0:	e1a06007 	mov	r6, r7
    afb4:	e3a09080 	mov	r9, #128	; 0x80
    afb8:	e5943038 	ldr	r3, [r4, #56]
    afbc:	e2599001 	subs	r9, r9, #1	; 0x1
    afc0:	e5933000 	ldr	r3, [r3]
    afc4:	e58d3000 	str	r3, [sp]
    afc8:	e59de000 	ldr	lr, [sp]
    afcc:	e59d3000 	ldr	r3, [sp]
    afd0:	e59d2000 	ldr	r2, [sp]
    afd4:	e59d1000 	ldr	r1, [sp]
    afd8:	e1a00423 	lsr	r0, r3, #8
    afdc:	e1a02822 	lsr	r2, r2, #16
    afe0:	e1a03c21 	lsr	r3, r1, #24
    afe4:	e5c63003 	strb	r3, [r6, #3]
    afe8:	e5c6e000 	strb	lr, [r6]
    afec:	e5c60001 	strb	r0, [r6, #1]
    aff0:	e5c62002 	strb	r2, [r6, #2]
    aff4:	e2866004 	add	r6, r6, #4	; 0x4
    aff8:	1affffee 	bne	0xafb8
    affc:	ea000002 	b	0xb00c
    b000:	e5941038 	ldr	r1, [r4, #56]
    b004:	e1a00007 	mov	r0, r7
    b008:	eb0004a6 	bl	0xc2a8
    b00c:	e594302c 	ldr	r3, [r4, #44]
    b010:	e594202c 	ldr	r2, [r4, #44]
    b014:	e3a00005 	mov	r0, #5	; 0x5
    b018:	e1d330b0 	ldrh	r3, [r3]
    b01c:	e20a10ff 	and	r1, sl, #255	; 0xff
    b020:	e3550000 	cmp	r5, #0	; 0x0
    b024:	e3833020 	orr	r3, r3, #32	; 0x20
    b028:	e1c230b0 	strh	r3, [r2]
    b02c:	e5943040 	ldr	r3, [r4, #64]
    b030:	e1a0244a 	asr	r2, sl, #8
    b034:	e1c300b0 	strh	r0, [r3]
    b038:	e5943018 	ldr	r3, [r4, #24]
    b03c:	e1c310b0 	strh	r1, [r3]
    b040:	e5941018 	ldr	r1, [r4, #24]
    b044:	e20230ff 	and	r3, r2, #255	; 0xff
    b048:	e3a020e0 	mov	r2, #224	; 0xe0
    b04c:	e1c130b0 	strh	r3, [r1]
    b050:	e5943040 	ldr	r3, [r4, #64]
    b054:	e1c320b0 	strh	r2, [r3]
    b058:	0a00000e 	beq	0xb098
    b05c:	e5943038 	ldr	r3, [r4, #56]
    b060:	e5933000 	ldr	r3, [r3]
    b064:	e5853000 	str	r3, [r5]
    b068:	e5943038 	ldr	r3, [r4, #56]
    b06c:	e5933000 	ldr	r3, [r3]
    b070:	e58d3000 	str	r3, [sp]
    b074:	e59d3000 	ldr	r3, [sp]
    b078:	e59d2000 	ldr	r2, [sp]
    b07c:	e59d1000 	ldr	r1, [sp]
    b080:	e5c53004 	strb	r3, [r5, #4]
    b084:	e1a02422 	lsr	r2, r2, #8
    b088:	e1a03821 	lsr	r3, r1, #16
    b08c:	e1c530b6 	strh	r3, [r5, #6]
    b090:	e5c52005 	strb	r2, [r5, #5]
    b094:	ea000005 	b	0xb0b0
    b098:	e3a02002 	mov	r2, #2	; 0x2
    b09c:	e5943038 	ldr	r3, [r4, #56]
    b0a0:	e2522001 	subs	r2, r2, #1	; 0x1
    b0a4:	e5933000 	ldr	r3, [r3]
    b0a8:	e58d3000 	str	r3, [sp]
    b0ac:	1afffffa 	bne	0xb09c
    b0b0:	e28d5008 	add	r5, sp, #8	; 0x8
    b0b4:	e3a06002 	mov	r6, #2	; 0x2
    b0b8:	e5943038 	ldr	r3, [r4, #56]
    b0bc:	e2566001 	subs	r6, r6, #1	; 0x1
    b0c0:	e5933000 	ldr	r3, [r3]
    b0c4:	e58d3000 	str	r3, [sp]
    b0c8:	e59de000 	ldr	lr, [sp]
    b0cc:	e59d3000 	ldr	r3, [sp]
    b0d0:	e59d2000 	ldr	r2, [sp]
    b0d4:	e59d1000 	ldr	r1, [sp]
    b0d8:	e1a00423 	lsr	r0, r3, #8
    b0dc:	e1a02822 	lsr	r2, r2, #16
    b0e0:	e1a03c21 	lsr	r3, r1, #24
    b0e4:	e5c53003 	strb	r3, [r5, #3]
    b0e8:	e5c5e000 	strb	lr, [r5]
    b0ec:	e5c50001 	strb	r0, [r5, #1]
    b0f0:	e5c52002 	strb	r2, [r5, #2]
    b0f4:	e2855004 	add	r5, r5, #4	; 0x4
    b0f8:	1affffee 	bne	0xb0b8
    b0fc:	e5943000 	ldr	r3, [r4]
    b100:	e5dd2008 	ldrb	r2, [sp, #8]
    b104:	e5933000 	ldr	r3, [r3]
    b108:	e58d3004 	str	r3, [sp, #4]
    b10c:	e5dd3004 	ldrb	r3, [sp, #4]
    b110:	e1520003 	cmp	r2, r3
    b114:	1a000007 	bne	0xb138
    b118:	e5dd2009 	ldrb	r2, [sp, #9]
    b11c:	e5dd3005 	ldrb	r3, [sp, #5]
    b120:	e1520003 	cmp	r2, r3
    b124:	1a000003 	bne	0xb138
    b128:	e5dd200a 	ldrb	r2, [sp, #10]
    b12c:	e5dd3006 	ldrb	r3, [sp, #6]
    b130:	e1520003 	cmp	r2, r3
    b134:	0a000005 	beq	0xb150
    b138:	e28d2004 	add	r2, sp, #4	; 0x4
    b13c:	e28d1008 	add	r1, sp, #8	; 0x8
    b140:	e1a00007 	mov	r0, r7
    b144:	eb000403 	bl	0xc158
    b148:	e3500000 	cmp	r0, #0	; 0x0
    b14c:	0a000005 	beq	0xb168
    b150:	e594302c 	ldr	r3, [r4, #44]
    b154:	e594202c 	ldr	r2, [r4, #44]
    b158:	e3a08001 	mov	r8, #1	; 0x1
    b15c:	e1d330b0 	ldrh	r3, [r3]
    b160:	e3833002 	orr	r3, r3, #2	; 0x2
    b164:	e1c230b0 	strh	r3, [r2]
    b168:	e1a0000b 	mov	r0, fp
    b16c:	ebfff2c8 	bl	0x7c94
    b170:	e59d0010 	ldr	r0, [sp, #16]
    b174:	eb000771 	bl	bcf40
    b178:	e1a00008 	mov	r0, r8
    b17c:	e28dd014 	add	sp, sp, #20	; 0x14
    b180:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b184:	e12fff1e 	bx	lr
    b188:	8006a9f4 	strdhi	sl, [r6], -r4
    b18c:	8006c65c 	andhi	ip, r6, ip, asr r6
*/
bb190:	 				push	{r4, lr}
						sub	sp, sp, #8	
						mov	r3, #1	
						add	r2, sp, #0	
						mov	r1, #0	
						lsl	r0, r0, #8
						mov	r4, #0
						bl	bae5c
						cmp	r0, #0	
						moveq	r4, #1	
						beq	bb1dc
						ldrb	r3, [sp, #4]
						tst	r3, #2	
						moveq	r4, #4	
						tst	r3, #1
						ldrb	r3, [sp, #5]
						orreq	r4, r4, #8	
						cmp	r3, #0xff
						orrne	r4, r4, #2	
bb1dc:				 	mov	r0, r4
						add	sp, sp, #8	
						pop	{r4, lr}
						bx	lr
/*
    b1ec:	e92d4070 	push	{r4, r5, r6, lr}
    b1f0:	e1a03000 	mov	r3, r0
    b1f4:	e3a00001 	mov	r0, #1	; 0x1
    b1f8:	e3a04001 	mov	r4, #1	; 0x1
    b1fc:	e1a05303 	lsl	r5, r3, #6
    b200:	ebfff2a3 	bl	0x7c94
    b204:	e59fe0b8 	ldr	lr, [pc, #184]	; 0xb2c4
    b208:	e3a01cff 	mov	r1, #65280	; 0xff00
    b20c:	e38110fd 	orr	r1, r1, #253	; 0xfd
    b210:	e59e3024 	ldr	r3, [lr, #36]
    b214:	e59e2024 	ldr	r2, [lr, #36]
    b218:	e3a060ff 	mov	r6, #255	; 0xff
    b21c:	e1d330b0 	ldrh	r3, [r3]
    b220:	e0033001 	and	r3, r3, r1
    b224:	e1c230b0 	strh	r3, [r2]
    b228:	e59e3038 	ldr	r3, [lr, #56]
    b22c:	e1c360b0 	strh	r6, [r3]
    b230:	e59e3028 	ldr	r3, [lr, #40]
    b234:	e1d330b0 	ldrh	r3, [r3]
    b238:	e3130001 	tst	r3, #1	; 0x1
    b23c:	0afffffb 	beq	0xb230
    b240:	e59e3038 	ldr	r3, [lr, #56]
    b244:	e3a02060 	mov	r2, #96	; 0x60
    b248:	e1c320b0 	strh	r2, [r3]
    b24c:	e59e2010 	ldr	r2, [lr, #16]
    b250:	e20530ff 	and	r3, r5, #255	; 0xff
    b254:	e1c230b0 	strh	r3, [r2]
    b258:	e59e2010 	ldr	r2, [lr, #16]
    b25c:	e1a03805 	lsl	r3, r5, #16
    b260:	e1a03c23 	lsr	r3, r3, #24
    b264:	e1c230b0 	strh	r3, [r2]
    b268:	e59e3038 	ldr	r3, [lr, #56]
    b26c:	e3a020d0 	mov	r2, #208	; 0xd0
    b270:	e1c320b0 	strh	r2, [r3]
    b274:	e59e3028 	ldr	r3, [lr, #40]
    b278:	e1d330b0 	ldrh	r3, [r3]
    b27c:	e3130001 	tst	r3, #1	; 0x1
    b280:	0afffffb 	beq	0xb274
    b284:	e59e3038 	ldr	r3, [lr, #56]
    b288:	e3a02070 	mov	r2, #112	; 0x70
    b28c:	e1c320b0 	strh	r2, [r3]
    b290:	e59e3030 	ldr	r3, [lr, #48]
    b294:	e5d33000 	ldrb	r3, [r3]
    b298:	e3130001 	tst	r3, #1	; 0x1
    b29c:	e59e3024 	ldr	r3, [lr, #36]
    b2a0:	e59e2024 	ldr	r2, [lr, #36]
    b2a4:	13a04000 	movne	r4, #0	; 0x0
    b2a8:	e1d330b0 	ldrh	r3, [r3]
    b2ac:	e3833002 	orr	r3, r3, #2	; 0x2
    b2b0:	e1c230b0 	strh	r3, [r2]
    b2b4:	ebfff276 	bl	0x7c94
    b2b8:	e1a00004 	mov	r0, r4
    b2bc:	e8bd4070 	pop	{r4, r5, r6, lr}
    b2c0:	e12fff1e 	bx	lr
    b2c4:	8006a9fc 	strdhi	sl, [r6], -ip
    b2c8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b2cc:	e24dd004 	sub	sp, sp, #4	; 0x4
    b2d0:	e1a06002 	mov	r6, r2
    b2d4:	e1b05001 	movs	r5, r1
    b2d8:	e2004003 	and	r4, r0, #3	; 0x3
    b2dc:	e284e080 	add	lr, r4, #128	; 0x80
    b2e0:	e1a0a20e 	lsl	sl, lr, #4
    b2e4:	e3a07001 	mov	r7, #1	; 0x1
    b2e8:	e1a08484 	lsl	r8, r4, #9
    b2ec:	e1a09120 	lsr	r9, r0, #2
    b2f0:	1a000001 	bne	0xb2fc
    b2f4:	e3560000 	cmp	r6, #0	; 0x0
    b2f8:	0a000001 	beq	0xb304
    b2fc:	e3530001 	cmp	r3, #1	; 0x1
    b300:	0a000001 	beq	0xb30c
    b304:	e3a07000 	mov	r7, #0	; 0x0
    b308:	ea00008c 	b	0xb540
    b30c:	e3550000 	cmp	r5, #0	; 0x0
    b310:	1a000003 	bne	0xb324
    b314:	e1a01006 	mov	r1, r6
    b318:	ebfffe7f 	bl	0xad1c
    b31c:	e1a07000 	mov	r7, r0
    b320:	ea000086 	b	0xb540
    b324:	e3a00001 	mov	r0, #1	; 0x1
    b328:	ebfff259 	bl	0x7c94
    b32c:	e59f421c 	ldr	r4, [pc, #540]	; 0xb550
    b330:	e3a01cff 	mov	r1, #65280	; 0xff00
    b334:	e38110df 	orr	r1, r1, #223	; 0xdf
    b338:	e5943030 	ldr	r3, [r4, #48]
    b33c:	e5942030 	ldr	r2, [r4, #48]
    b340:	e3a0ecff 	mov	lr, #65280	; 0xff00
    b344:	e1d330b0 	ldrh	r3, [r3]
    b348:	e38ee0fd 	orr	lr, lr, #253	; 0xfd
    b34c:	e1a0b000 	mov	fp, r0
    b350:	e3833010 	orr	r3, r3, #16	; 0x10
    b354:	e1c230b0 	strh	r3, [r2]
    b358:	e5943030 	ldr	r3, [r4, #48]
    b35c:	e5942030 	ldr	r2, [r4, #48]
    b360:	e1d330b0 	ldrh	r3, [r3]
    b364:	e0033001 	and	r3, r3, r1
    b368:	e1c230b0 	strh	r3, [r2]
    b36c:	e5943030 	ldr	r3, [r4, #48]
    b370:	e5942030 	ldr	r2, [r4, #48]
    b374:	e3a010ff 	mov	r1, #255	; 0xff
    b378:	e1d330b0 	ldrh	r3, [r3]
    b37c:	e003300e 	and	r3, r3, lr
    b380:	e1c230b0 	strh	r3, [r2]
    b384:	e5943044 	ldr	r3, [r4, #68]
    b388:	e1c310b0 	strh	r1, [r3]
    b38c:	e5943034 	ldr	r3, [r4, #52]
    b390:	e1d330b0 	ldrh	r3, [r3]
    b394:	e3130001 	tst	r3, #1	; 0x1
    b398:	0afffffb 	beq	0xb38c
    b39c:	e5943044 	ldr	r3, [r4, #68]
    b3a0:	e3a02080 	mov	r2, #128	; 0x80
    b3a4:	e3150003 	tst	r5, #3	; 0x3
    b3a8:	e1c320b0 	strh	r2, [r3]
    b3ac:	e594201c 	ldr	r2, [r4, #28]
    b3b0:	e20830ff 	and	r3, r8, #255	; 0xff
    b3b4:	e1c230b0 	strh	r3, [r2]
    b3b8:	e594201c 	ldr	r2, [r4, #28]
    b3bc:	e1a03448 	asr	r3, r8, #8
    b3c0:	e20330ff 	and	r3, r3, #255	; 0xff
    b3c4:	e1c230b0 	strh	r3, [r2]
    b3c8:	e594201c 	ldr	r2, [r4, #28]
    b3cc:	e20930ff 	and	r3, r9, #255	; 0xff
    b3d0:	e1c230b0 	strh	r3, [r2]
    b3d4:	e594201c 	ldr	r2, [r4, #28]
    b3d8:	e1a03449 	asr	r3, r9, #8
    b3dc:	e20330ff 	and	r3, r3, #255	; 0xff
    b3e0:	e1c230b0 	strh	r3, [r2]
    b3e4:	0a000015 	beq	0xb440
    b3e8:	e3a0e080 	mov	lr, #128	; 0x80
    b3ec:	e5d53000 	ldrb	r3, [r5]
    b3f0:	e5d52001 	ldrb	r2, [r5, #1]
    b3f4:	e5d51002 	ldrb	r1, [r5, #2]
    b3f8:	e58d3000 	str	r3, [sp]
    b3fc:	e5d50003 	ldrb	r0, [r5, #3]
    b400:	e59d3000 	ldr	r3, [sp]
    b404:	e2855004 	add	r5, r5, #4	; 0x4
    b408:	e25ee001 	subs	lr, lr, #1	; 0x1
    b40c:	e1833402 	orr	r3, r3, r2, lsl #8
    b410:	e58d3000 	str	r3, [sp]
    b414:	e59d3000 	ldr	r3, [sp]
    b418:	e1833801 	orr	r3, r3, r1, lsl #16
    b41c:	e58d3000 	str	r3, [sp]
    b420:	e59d3000 	ldr	r3, [sp]
    b424:	e1833c00 	orr	r3, r3, r0, lsl #24
    b428:	e58d3000 	str	r3, [sp]
    b42c:	e59d2000 	ldr	r2, [sp]
    b430:	e594303c 	ldr	r3, [r4, #60]
    b434:	e5832000 	str	r2, [r3]
    b438:	1affffeb 	bne	0xb3ec
    b43c:	ea000002 	b	0xb44c
    b440:	e594103c 	ldr	r1, [r4, #60]
    b444:	e1a00005 	mov	r0, r5
    b448:	eb0003a5 	bl	0xc2e4
    b44c:	e5943030 	ldr	r3, [r4, #48]
    b450:	e5942030 	ldr	r2, [r4, #48]
    b454:	e3a01085 	mov	r1, #133	; 0x85
    b458:	e1d330b0 	ldrh	r3, [r3]
    b45c:	e3560000 	cmp	r6, #0	; 0x0
    b460:	e3833020 	orr	r3, r3, #32	; 0x20
    b464:	e1c230b0 	strh	r3, [r2]
    b468:	e5943000 	ldr	r3, [r4]
    b46c:	e5942044 	ldr	r2, [r4, #68]
    b470:	e5930000 	ldr	r0, [r3]
    b474:	e1c210b0 	strh	r1, [r2]
    b478:	e594201c 	ldr	r2, [r4, #28]
    b47c:	e20a30ff 	and	r3, sl, #255	; 0xff
    b480:	e1c230b0 	strh	r3, [r2]
    b484:	e594201c 	ldr	r2, [r4, #28]
    b488:	e1a0344a 	asr	r3, sl, #8
    b48c:	e20330ff 	and	r3, r3, #255	; 0xff
    b490:	e1c230b0 	strh	r3, [r2]
    b494:	0a00000c 	beq	0xb4cc
    b498:	e594203c 	ldr	r2, [r4, #60]
    b49c:	e5963000 	ldr	r3, [r6]
    b4a0:	e5823000 	str	r3, [r2]
    b4a4:	e1d610b6 	ldrh	r1, [r6, #6]
    b4a8:	e5d63005 	ldrb	r3, [r6, #5]
    b4ac:	e5d62004 	ldrb	r2, [r6, #4]
    b4b0:	e1833401 	orr	r3, r3, r1, lsl #8
    b4b4:	e1823403 	orr	r3, r2, r3, lsl #8
    b4b8:	e58d3000 	str	r3, [sp]
    b4bc:	e59d2000 	ldr	r2, [sp]
    b4c0:	e594303c 	ldr	r3, [r4, #60]
    b4c4:	e5832000 	str	r2, [r3]
    b4c8:	ea000005 	b	0xb4e4
    b4cc:	e3a02002 	mov	r2, #2	; 0x2
    b4d0:	e3e01000 	mvn	r1, #0	; 0x0
    b4d4:	e594303c 	ldr	r3, [r4, #60]
    b4d8:	e2522001 	subs	r2, r2, #1	; 0x1
    b4dc:	e5831000 	str	r1, [r3]
    b4e0:	1afffffb 	bne	0xb4d4
    b4e4:	e594303c 	ldr	r3, [r4, #60]
    b4e8:	e3a02010 	mov	r2, #16	; 0x10
    b4ec:	e5830000 	str	r0, [r3]
    b4f0:	e5943044 	ldr	r3, [r4, #68]
    b4f4:	e1c320b0 	strh	r2, [r3]
    b4f8:	e5943034 	ldr	r3, [r4, #52]
    b4fc:	e1d330b0 	ldrh	r3, [r3]
    b500:	e3130001 	tst	r3, #1	; 0x1
    b504:	0afffffb 	beq	0xb4f8
    b508:	e5943044 	ldr	r3, [r4, #68]
    b50c:	e3a02070 	mov	r2, #112	; 0x70
    b510:	e1a0000b 	mov	r0, fp
    b514:	e1c320b0 	strh	r2, [r3]
    b518:	e594303c 	ldr	r3, [r4, #60]
    b51c:	e5d33000 	ldrb	r3, [r3]
    b520:	e3130001 	tst	r3, #1	; 0x1
    b524:	e5943030 	ldr	r3, [r4, #48]
    b528:	e5942030 	ldr	r2, [r4, #48]
    b52c:	13a07000 	movne	r7, #0	; 0x0
    b530:	e1d330b0 	ldrh	r3, [r3]
    b534:	e3833002 	orr	r3, r3, #2	; 0x2
    b538:	e1c230b0 	strh	r3, [r2]
    b53c:	ebfff1d4 	bl	0x7c94
    b540:	e1a00007 	mov	r0, r7
    b544:	e28dd004 	add	sp, sp, #4	; 0x4
    b548:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b54c:	e12fff1e 	bx	lr
    b550:	8006a9f0 	strdhi	sl, [r6], -r0
    b554:	e92d4070 	push	{r4, r5, r6, lr}
    b558:	e1a03000 	mov	r3, r0
    b55c:	e3a00001 	mov	r0, #1	; 0x1
    b560:	e1a05303 	lsl	r5, r3, #6
    b564:	e3a04001 	mov	r4, #1	; 0x1
    b568:	ebfff1c9 	bl	0x7c94
    b56c:	e59fe0dc 	ldr	lr, [pc, #220]	; 0xb650
    b570:	e3a01cff 	mov	r1, #65280	; 0xff00
    b574:	e38110fd 	orr	r1, r1, #253	; 0xfd
    b578:	e59e3024 	ldr	r3, [lr, #36]
    b57c:	e59e2024 	ldr	r2, [lr, #36]
    b580:	e3a060ff 	mov	r6, #255	; 0xff
    b584:	e1d330b0 	ldrh	r3, [r3]
    b588:	e0033001 	and	r3, r3, r1
    b58c:	e1c230b0 	strh	r3, [r2]
    b590:	e59e3038 	ldr	r3, [lr, #56]
    b594:	e1c360b0 	strh	r6, [r3]
    b598:	e59e3028 	ldr	r3, [lr, #40]
    b59c:	e1d330b0 	ldrh	r3, [r3]
    b5a0:	e3130001 	tst	r3, #1	; 0x1
    b5a4:	0afffffb 	beq	0xb598
    b5a8:	e59e3038 	ldr	r3, [lr, #56]
    b5ac:	e3a02080 	mov	r2, #128	; 0x80
    b5b0:	e1c320b0 	strh	r2, [r3]
    b5b4:	e59e3010 	ldr	r3, [lr, #16]
    b5b8:	e3a02005 	mov	r2, #5	; 0x5
    b5bc:	e1c320b0 	strh	r2, [r3]
    b5c0:	e59e3010 	ldr	r3, [lr, #16]
    b5c4:	e3a02008 	mov	r2, #8	; 0x8
    b5c8:	e1c320b0 	strh	r2, [r3]
    b5cc:	e59e2010 	ldr	r2, [lr, #16]
    b5d0:	e20530ff 	and	r3, r5, #255	; 0xff
    b5d4:	e1c230b0 	strh	r3, [r2]
    b5d8:	e59e2010 	ldr	r2, [lr, #16]
    b5dc:	e1a03805 	lsl	r3, r5, #16
    b5e0:	e1a03c23 	lsr	r3, r3, #24
    b5e4:	e1c230b0 	strh	r3, [r2]
    b5e8:	e59e3030 	ldr	r3, [lr, #48]
    b5ec:	e3a02000 	mov	r2, #0	; 0x0
    b5f0:	e5c32000 	strb	r2, [r3]
    b5f4:	e59e3038 	ldr	r3, [lr, #56]
    b5f8:	e3a02010 	mov	r2, #16	; 0x10
    b5fc:	e1c320b0 	strh	r2, [r3]
    b600:	e59e3028 	ldr	r3, [lr, #40]
    b604:	e1d330b0 	ldrh	r3, [r3]
    b608:	e3130001 	tst	r3, #1	; 0x1
    b60c:	0afffffb 	beq	0xb600
    b610:	e59e3038 	ldr	r3, [lr, #56]
    b614:	e3a02070 	mov	r2, #112	; 0x70
    b618:	e1c320b0 	strh	r2, [r3]
    b61c:	e59e3030 	ldr	r3, [lr, #48]
    b620:	e5d33000 	ldrb	r3, [r3]
    b624:	e3130001 	tst	r3, #1	; 0x1
    b628:	e59e3024 	ldr	r3, [lr, #36]
    b62c:	e59e2024 	ldr	r2, [lr, #36]
    b630:	13a04000 	movne	r4, #0	; 0x0
    b634:	e1d330b0 	ldrh	r3, [r3]
    b638:	e3833002 	orr	r3, r3, #2	; 0x2
    b63c:	e1c230b0 	strh	r3, [r2]
    b640:	ebfff193 	bl	0x7c94
    b644:	e1a00004 	mov	r0, r4
    b648:	e8bd4070 	pop	{r4, r5, r6, lr}
    b64c:	e12fff1e 	bx	lr
    b650:	8006a9fc 	strdhi	sl, [r6], -ip
    b654:	e92d4070 	push	{r4, r5, r6, lr}
    b658:	e1a03000 	mov	r3, r0
    b65c:	e3a00001 	mov	r0, #1	; 0x1
    b660:	e1a05303 	lsl	r5, r3, #6
    b664:	e3a04001 	mov	r4, #1	; 0x1
    b668:	ebfff189 	bl	0x7c94
    b66c:	e59fe0dc 	ldr	lr, [pc, #220]	; 0xb750
    b670:	e3a01cff 	mov	r1, #65280	; 0xff00
    b674:	e38110fd 	orr	r1, r1, #253	; 0xfd
    b678:	e59e3024 	ldr	r3, [lr, #36]
    b67c:	e59e2024 	ldr	r2, [lr, #36]
    b680:	e3a060ff 	mov	r6, #255	; 0xff
    b684:	e1d330b0 	ldrh	r3, [r3]
    b688:	e0033001 	and	r3, r3, r1
    b68c:	e1c230b0 	strh	r3, [r2]
    b690:	e59e3038 	ldr	r3, [lr, #56]
    b694:	e1c360b0 	strh	r6, [r3]
    b698:	e59e3028 	ldr	r3, [lr, #40]
    b69c:	e1d330b0 	ldrh	r3, [r3]
    b6a0:	e3130001 	tst	r3, #1	; 0x1
    b6a4:	0afffffb 	beq	0xb698
    b6a8:	e59e3038 	ldr	r3, [lr, #56]
    b6ac:	e3a02080 	mov	r2, #128	; 0x80
    b6b0:	e1c320b0 	strh	r2, [r3]
    b6b4:	e59e3010 	ldr	r3, [lr, #16]
    b6b8:	e3a02004 	mov	r2, #4	; 0x4
    b6bc:	e1c320b0 	strh	r2, [r3]
    b6c0:	e59e3010 	ldr	r3, [lr, #16]
    b6c4:	e3a02008 	mov	r2, #8	; 0x8
    b6c8:	e1c320b0 	strh	r2, [r3]
    b6cc:	e59e2010 	ldr	r2, [lr, #16]
    b6d0:	e20530ff 	and	r3, r5, #255	; 0xff
    b6d4:	e1c230b0 	strh	r3, [r2]
    b6d8:	e59e2010 	ldr	r2, [lr, #16]
    b6dc:	e1a03805 	lsl	r3, r5, #16
    b6e0:	e1a03c23 	lsr	r3, r3, #24
    b6e4:	e1c230b0 	strh	r3, [r2]
    b6e8:	e59e3030 	ldr	r3, [lr, #48]
    b6ec:	e3a020fe 	mov	r2, #254	; 0xfe
    b6f0:	e5c32000 	strb	r2, [r3]
    b6f4:	e59e3038 	ldr	r3, [lr, #56]
    b6f8:	e3a02010 	mov	r2, #16	; 0x10
    b6fc:	e1c320b0 	strh	r2, [r3]
    b700:	e59e3028 	ldr	r3, [lr, #40]
    b704:	e1d330b0 	ldrh	r3, [r3]
    b708:	e3130001 	tst	r3, #1	; 0x1
    b70c:	0afffffb 	beq	0xb700
    b710:	e59e3038 	ldr	r3, [lr, #56]
    b714:	e3a02070 	mov	r2, #112	; 0x70
    b718:	e1c320b0 	strh	r2, [r3]
    b71c:	e59e3030 	ldr	r3, [lr, #48]
    b720:	e5d33000 	ldrb	r3, [r3]
    b724:	e3130001 	tst	r3, #1	; 0x1
    b728:	e59e3024 	ldr	r3, [lr, #36]
    b72c:	e59e2024 	ldr	r2, [lr, #36]
    b730:	13a04000 	movne	r4, #0	; 0x0
    b734:	e1d330b0 	ldrh	r3, [r3]
    b738:	e3833002 	orr	r3, r3, #2	; 0x2
    b73c:	e1c230b0 	strh	r3, [r2]
    b740:	ebfff153 	bl	0x7c94
    b744:	e1a00004 	mov	r0, r4
    b748:	e8bd4070 	pop	{r4, r5, r6, lr}
    b74c:	e12fff1e 	bx	lr
    b750:	8006a9fc 	strdhi	sl, [r6], -ip

    b754:	e92d4030 	push	{r4, r5, lr}
    b758:	e1a04001 	mov	r4, r1
    b75c:	e1a05000 	mov	r5, r0
    b760:	e3140002 	tst	r4, #2	; 0x2
    b764:	0a000002 	beq	0xb774
    b768:	ebffff79 	bl	0xb554
    b76c:	e3500000 	cmp	r0, #0	; 0x0
    b770:	0a00000b 	beq	0xb7a4
    b774:	e3140008 	tst	r4, #8	; 0x8
    b778:	0a000003 	beq	0xb78c
    b77c:	e1a00005 	mov	r0, r5
    b780:	ebffffb3 	bl	0xb654
    b784:	e3500000 	cmp	r0, #0	; 0x0
    b788:	0a000005 	beq	0xb7a4
    b78c:	e3140004 	tst	r4, #4	; 0x4
    b790:	0a000006 	beq	0xb7b0
    b794:	e1a00005 	mov	r0, r5
    b798:	ebfffe7c 	bl	bb190
    b79c:	e3100004 	tst	r0, #4	; 0x4
    b7a0:	1a000002 	bne	0xb7b0
    b7a4:	e3a00000 	mov	r0, #0	; 0x0
    b7a8:	e8bd4030 	pop	{r4, r5, lr}
    b7ac:	e12fff1e 	bx	lr
    b7b0:	e3a00001 	mov	r0, #1	; 0x1
    b7b4:	e8bd4030 	pop	{r4, r5, lr}
    b7b8:	e12fff1e 	bx	lr

    b7bc:	e92d4070 	push	{r4, r5, r6, lr}
    b7c0:	e24dd014 	sub	sp, sp, #20	; 0x14
    b7c4:	e59f316c 	ldr	r3, [pc, #364]	; 0xb938
    b7c8:	e5933000 	ldr	r3, [r3]
    b7cc:	e58d3010 	str	r3, [sp, #16]
    b7d0:	e3a00001 	mov	r0, #1	; 0x1
    b7d4:	ebfff12e 	bl	0x7c94
    b7d8:	e59f1154 	ldr	r1, [pc, #340]	; 0xb934
    b7dc:	e3a06cff 	mov	r6, #65280	; 0xff00
    b7e0:	e38660fd 	orr	r6, r6, #253	; 0xfd
    b7e4:	e5913024 	ldr	r3, [r1, #36]
    b7e8:	e5912024 	ldr	r2, [r1, #36]
    b7ec:	e3a0e030 	mov	lr, #48	; 0x30
    b7f0:	e1d330b0 	ldrh	r3, [r3]
    b7f4:	e1a05000 	mov	r5, r0
    b7f8:	e0033006 	and	r3, r3, r6
    b7fc:	e1c230b0 	strh	r3, [r2]
    b800:	e5913038 	ldr	r3, [r1, #56]
    b804:	e3a02065 	mov	r2, #101	; 0x65
    b808:	e1c3e0b0 	strh	lr, [r3]
    b80c:	e5913038 	ldr	r3, [r1, #56]
    b810:	e3a0e000 	mov	lr, #0	; 0x0
    b814:	e1c320b0 	strh	r2, [r3]
    b818:	e5913038 	ldr	r3, [r1, #56]
    b81c:	e1c3e0b0 	strh	lr, [r3]
    b820:	e5913010 	ldr	r3, [r1, #16]
    b824:	e1c3e0b0 	strh	lr, [r3]
    b828:	e5913010 	ldr	r3, [r1, #16]
    b82c:	e1c3e0b0 	strh	lr, [r3]
    b830:	e5913010 	ldr	r3, [r1, #16]
    b834:	e1c3e0b0 	strh	lr, [r3]
    b838:	e5913010 	ldr	r3, [r1, #16]
    b83c:	e1c3e0b0 	strh	lr, [r3]
    b840:	e5913028 	ldr	r3, [r1, #40]
    b844:	e1d330b0 	ldrh	r3, [r3]
    b848:	e3130001 	tst	r3, #1	; 0x1
    b84c:	0afffffb 	beq	0xb840
    b850:	e3a02000 	mov	r2, #0	; 0x0
    b854:	e28de000 	add	lr, sp, #0	; 0x0
    b858:	e5913030 	ldr	r3, [r1, #48]
    b85c:	e5d33000 	ldrb	r3, [r3]
    b860:	e7c2300e 	strb	r3, [r2, lr]
    b864:	e2822001 	add	r2, r2, #1	; 0x1
    b868:	e3520010 	cmp	r2, #16	; 0x10
    b86c:	bafffff9 	blt	0xb858
    b870:	e59f30b8 	ldr	r3, [pc, #184]	; 0xb930
    b874:	e5933000 	ldr	r3, [r3]
    b878:	e3530001 	cmp	r3, #1	; 0x1
    b87c:	1a00000d 	bne	0xb8b8
    b880:	e59f40a4 	ldr	r4, [pc, #164]	; 0xb92c
    b884:	e594e000 	ldr	lr, [r4]
    b888:	e35e0000 	cmp	lr, #0	; 0x0
    b88c:	0a000009 	beq	0xb8b8
    b890:	e3a00000 	mov	r0, #0	; 0x0
    b894:	ea000000 	b	0xb89c
    b898:	e594e000 	ldr	lr, [r4]
    b89c:	e28d3000 	add	r3, sp, #0	; 0x0
    b8a0:	e7d02003 	ldrb	r2, [r0, r3]
    b8a4:	e08e3000 	add	r3, lr, r0
    b8a8:	e2800001 	add	r0, r0, #1	; 0x1
    b8ac:	e5c3212c 	strb	r2, [r3, #300]
    b8b0:	e3500010 	cmp	r0, #16	; 0x10
    b8b4:	bafffff7 	blt	0xb898
    b8b8:	e5913024 	ldr	r3, [r1, #36]
    b8bc:	e5912024 	ldr	r2, [r1, #36]
    b8c0:	e3a000ff 	mov	r0, #255	; 0xff
    b8c4:	e1d330b0 	ldrh	r3, [r3]
    b8c8:	e3833002 	orr	r3, r3, #2	; 0x2
    b8cc:	e1c230b0 	strh	r3, [r2]
    b8d0:	e5913024 	ldr	r3, [r1, #36]
    b8d4:	e5912024 	ldr	r2, [r1, #36]
    b8d8:	e1d330b0 	ldrh	r3, [r3]
    b8dc:	e0033006 	and	r3, r3, r6
    b8e0:	e1c230b0 	strh	r3, [r2]
    b8e4:	e5913038 	ldr	r3, [r1, #56]
    b8e8:	e1c300b0 	strh	r0, [r3]
    b8ec:	e5913028 	ldr	r3, [r1, #40]
    b8f0:	e1d330b0 	ldrh	r3, [r3]
    b8f4:	e3130001 	tst	r3, #1	; 0x1
    b8f8:	0afffffb 	beq	0xb8ec
    b8fc:	e5913024 	ldr	r3, [r1, #36]
    b900:	e5912024 	ldr	r2, [r1, #36]
    b904:	e1a00005 	mov	r0, r5
    b908:	e1d330b0 	ldrh	r3, [r3]
    b90c:	e3833002 	orr	r3, r3, #2	; 0x2
    b910:	e1c230b0 	strh	r3, [r2]
    b914:	ebfff0de 	bl	0x7c94
    b918:	e59d0010 	ldr	r0, [sp, #16]
    b91c:	eb000587 	bl	bcf40
    b920:	e28dd014 	add	sp, sp, #20	; 0x14
    b924:	e8bd4070 	pop	{r4, r5, r6, lr}
    b928:	e12fff1e 	bx	lr

    b92c:	800690f0 	
    b930:	800690f4 	
    b934:	8006a9fc 	
    b938:	8006c65c 	

    b93c:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    b940:	e24dd014 	sub	sp, sp, #20	; 0x14
    b944:	e59f318c 	ldr	r3, [pc, #396]	; 0xbad8
    b948:	e5933000 	ldr	r3, [r3]
    b94c:	e58d3010 	str	r3, [sp, #16]
    b950:	e3a00001 	mov	r0, #1	; 0x1
    b954:	ebfff0ce 	bl	0x7c94
    b958:	e59fe174 	ldr	lr, [pc, #372]	; 0xbad4
    b95c:	e3a07cff 	mov	r7, #65280	; 0xff00
    b960:	e38770fd 	orr	r7, r7, #253	; 0xfd
    b964:	e59e3024 	ldr	r3, [lr, #36]
    b968:	e59e2024 	ldr	r2, [lr, #36]
    b96c:	e3a04030 	mov	r4, #48	; 0x30
    b970:	e1d330b0 	ldrh	r3, [r3]
    b974:	e3a01000 	mov	r1, #0	; 0x0
    b978:	e1a06000 	mov	r6, r0
    b97c:	e0033007 	and	r3, r3, r7
    b980:	e1c230b0 	strh	r3, [r2]
    b984:	e59e3038 	ldr	r3, [lr, #56]
    b988:	e3a02065 	mov	r2, #101	; 0x65
    b98c:	e1c340b0 	strh	r4, [r3]
    b990:	e59e3038 	ldr	r3, [lr, #56]
    b994:	e1c320b0 	strh	r2, [r3]
    b998:	e59e3038 	ldr	r3, [lr, #56]
    b99c:	e1c310b0 	strh	r1, [r3]
    b9a0:	e59e3010 	ldr	r3, [lr, #16]
    b9a4:	e1c310b0 	strh	r1, [r3]
    b9a8:	e59e3010 	ldr	r3, [lr, #16]
    b9ac:	e1c310b0 	strh	r1, [r3]
    b9b0:	e59e3010 	ldr	r3, [lr, #16]
    b9b4:	e1c310b0 	strh	r1, [r3]
    b9b8:	e59e3010 	ldr	r3, [lr, #16]
    b9bc:	e1c310b0 	strh	r1, [r3]
    b9c0:	e59e3038 	ldr	r3, [lr, #56]
    b9c4:	e1c340b0 	strh	r4, [r3]
    b9c8:	e59e3028 	ldr	r3, [lr, #40]
    b9cc:	e1d330b0 	ldrh	r3, [r3]
    b9d0:	e3130001 	tst	r3, #1	; 0x1
    b9d4:	0afffffb 	beq	0xb9c8
    b9d8:	e28d4000 	add	r4, sp, #0	; 0x0
    b9dc:	e3a05004 	mov	r5, #4	; 0x4
    b9e0:	e59e3030 	ldr	r3, [lr, #48]
    b9e4:	e2555001 	subs	r5, r5, #1	; 0x1
    b9e8:	e5930000 	ldr	r0, [r3]
    b9ec:	e1a03420 	lsr	r3, r0, #8
    b9f0:	e1a02820 	lsr	r2, r0, #16
    b9f4:	e1a01c20 	lsr	r1, r0, #24
    b9f8:	e5c43001 	strb	r3, [r4, #1]
    b9fc:	e5c42002 	strb	r2, [r4, #2]
    ba00:	e5c41003 	strb	r1, [r4, #3]
    ba04:	e5c40000 	strb	r0, [r4]
    ba08:	e2844004 	add	r4, r4, #4	; 0x4
    ba0c:	1afffff3 	bne	0xb9e0
    ba10:	e59f30b8 	ldr	r3, [pc, #184]	; 0xbad0
    ba14:	e5933000 	ldr	r3, [r3]
    ba18:	e3530001 	cmp	r3, #1	; 0x1
    ba1c:	1a00000d 	bne	0xba58
    ba20:	e59f40a4 	ldr	r4, [pc, #164]	; 0xbacc
    ba24:	e5940000 	ldr	r0, [r4]
    ba28:	e3500000 	cmp	r0, #0	; 0x0
    ba2c:	0a000009 	beq	0xba58
    ba30:	e3a01000 	mov	r1, #0	; 0x0
    ba34:	ea000000 	b	0xba3c
    ba38:	e5940000 	ldr	r0, [r4]
    ba3c:	e28d3000 	add	r3, sp, #0	; 0x0
    ba40:	e7d12003 	ldrb	r2, [r1, r3]
    ba44:	e0803001 	add	r3, r0, r1
    ba48:	e2811001 	add	r1, r1, #1	; 0x1
    ba4c:	e5c3212c 	strb	r2, [r3, #300]
    ba50:	e3510010 	cmp	r1, #16	; 0x10
    ba54:	bafffff7 	blt	0xba38
    ba58:	e59e3024 	ldr	r3, [lr, #36]
    ba5c:	e59e2024 	ldr	r2, [lr, #36]
    ba60:	e3a010ff 	mov	r1, #255	; 0xff
    ba64:	e1d330b0 	ldrh	r3, [r3]
    ba68:	e3833002 	orr	r3, r3, #2	; 0x2
    ba6c:	e1c230b0 	strh	r3, [r2]
    ba70:	e59e3024 	ldr	r3, [lr, #36]
    ba74:	e59e2024 	ldr	r2, [lr, #36]
    ba78:	e1d330b0 	ldrh	r3, [r3]
    ba7c:	e0033007 	and	r3, r3, r7
    ba80:	e1c230b0 	strh	r3, [r2]
    ba84:	e59e3038 	ldr	r3, [lr, #56]
    ba88:	e1c310b0 	strh	r1, [r3]
    ba8c:	e59e3028 	ldr	r3, [lr, #40]
    ba90:	e1d330b0 	ldrh	r3, [r3]
    ba94:	e3130001 	tst	r3, #1	; 0x1
    ba98:	0afffffb 	beq	0xba8c
    ba9c:	e59e3024 	ldr	r3, [lr, #36]
    baa0:	e59e2024 	ldr	r2, [lr, #36]
    baa4:	e1a00006 	mov	r0, r6
    baa8:	e1d330b0 	ldrh	r3, [r3]
    baac:	e3833002 	orr	r3, r3, #2	; 0x2
    bab0:	e1c230b0 	strh	r3, [r2]
    bab4:	ebfff076 	bl	0x7c94
    bab8:	e59d0010 	ldr	r0, [sp, #16]
    babc:	eb00051f 	bl	bcf40
    bac0:	e28dd014 	add	sp, sp, #20	; 0x14
    bac4:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    bac8:	e12fff1e 	bx	lr

    bacc:	800690f0 	
    bad0:	800690f4 	
    bad4:	8006a9fc 	
    bad8:	8006c65c 	
*/
bbadc:	 				push	{r4, r5, r6, r7, lr}

bbae0:	 				bl	bc324
/*
    bae4:	e59f4238 	ldr	r4, [pc, #568]	; 0xbd24
    bae8:	e3a0320b 	mov	r3, #0xb0000000
    baec:	e383360e 	orr	r3, r3, #10xe00000
    baf0:	e584302c 	str	r3, [r4, #44]
    baf4:	e594302c 	ldr	r3, [r4, #44]
    baf8:	e1a02000 	mov	r2, r0
    bafc:	e3a00001 	mov	r0, #1	; 0x1
    bb00:	e5843048 	str	r3, [r4, #72]
    bb04:	e594302c 	ldr	r3, [r4, #44]
    bb08:	e584200c 	str	r2, [r4, #12]
    bb0c:	e2833004 	add	r3, r3, #4	; 0x4
    bb10:	e5843030 	str	r3, [r4, #48]
    bb14:	e594302c 	ldr	r3, [r4, #44]
    bb18:	e2833008 	add	r3, r3, #8	; 0x8
    bb1c:	e5843044 	str	r3, [r4, #68]
    bb20:	e594302c 	ldr	r3, [r4, #44]
    bb24:	e283300c 	add	r3, r3, #12	; 0xc
    bb28:	e584301c 	str	r3, [r4, #28]
    bb2c:	e594302c 	ldr	r3, [r4, #44]
    bb30:	e2833010 	add	r3, r3, #16	; 0x10
    bb34:	e584303c 	str	r3, [r4, #60]
    bb38:	e594302c 	ldr	r3, [r4, #44]
    bb3c:	e2833014 	add	r3, r3, #20	; 0x14
    bb40:	e5843008 	str	r3, [r4, #8]
    bb44:	e594302c 	ldr	r3, [r4, #44]
    bb48:	e2833018 	add	r3, r3, #24	; 0x18
    bb4c:	e5843040 	str	r3, [r4, #64]
    bb50:	e594302c 	ldr	r3, [r4, #44]
    bb54:	e2833020 	add	r3, r3, #32	; 0x20
    bb58:	e5843034 	str	r3, [r4, #52]
    bb5c:	e594302c 	ldr	r3, [r4, #44]
    bb60:	e2833024 	add	r3, r3, #36	; 0x24
    bb64:	e5843024 	str	r3, [r4, #36]
    bb68:	e594302c 	ldr	r3, [r4, #44]
    bb6c:	e2833028 	add	r3, r3, #40	; 0x28
    bb70:	e5843028 	str	r3, [r4, #40]
    bb74:	e594302c 	ldr	r3, [r4, #44]
    bb78:	e283302c 	add	r3, r3, #44	; 0x2c
    bb7c:	e5843000 	str	r3, [r4]
    bb80:	e594302c 	ldr	r3, [r4, #44]
    bb84:	e2833030 	add	r3, r3, #48	; 0x30
    bb88:	e5843014 	str	r3, [r4, #20]
    bb8c:	e594302c 	ldr	r3, [r4, #44]
    bb90:	e283302c 	add	r3, r3, #44	; 0x2c
    bb94:	e5843004 	str	r3, [r4, #4]
    bb98:	ebfff03d 	bl	0x7c94
    bb9c:	e5942048 	ldr	r2, [r4, #72]
    bba0:	e3a03c77 	mov	r3, #30464	; 0x7700
    bba4:	e3833070 	orr	r3, r3, #112	; 0x70
    bba8:	e1c230b0 	strh	r3, [r2]
    bbac:	e5943030 	ldr	r3, [r4, #48]
    bbb0:	e3a01073 	mov	r1, #115	; 0x73
    bbb4:	e3a02004 	mov	r2, #4	; 0x4
    bbb8:	e1c310b0 	strh	r1, [r3]
    bbbc:	e5943034 	ldr	r3, [r4, #52]
    bbc0:	e3a01cff 	mov	r1, #65280	; 0xff00
    bbc4:	e38110fd 	orr	r1, r1, #253	; 0xfd
    bbc8:	e1c320b0 	strh	r2, [r3]
    bbcc:	e594200c 	ldr	r2, [r4, #12]
    bbd0:	e3520000 	cmp	r2, #0	; 0x0
    bbd4:	15923000 	ldrne	r3, [r2]
    bbd8:	13c33b02 	bicne	r3, r3, #2048	; 0x800
    bbdc:	15823000 	strne	r3, [r2]
    bbe0:	15923000 	ldrne	r3, [r2]
    bbe4:	15823000 	strne	r3, [r2]
    bbe8:	15b23004 	ldrne	r3, [r2, #4]!
    bbec:	13833b02 	orrne	r3, r3, #2048	; 0x800
    bbf0:	15823000 	strne	r3, [r2]
    bbf4:	e5943030 	ldr	r3, [r4, #48]
    bbf8:	e5942030 	ldr	r2, [r4, #48]
    bbfc:	e1d330b0 	ldrh	r3, [r3]
    bc00:	e0033001 	and	r3, r3, r1
    bc04:	e1c230b0 	strh	r3, [r2]
    bc08:	e5943044 	ldr	r3, [r4, #68]
    bc0c:	e3a020ff 	mov	r2, #255	; 0xff
    bc10:	e1c320b0 	strh	r2, [r3]
    bc14:	e5943034 	ldr	r3, [r4, #52]
    bc18:	e1d330b0 	ldrh	r3, [r3]
    bc1c:	e3130001 	tst	r3, #1	; 0x1
    bc20:	0afffffb 	beq	0xbc14
    bc24:	e5943044 	ldr	r3, [r4, #68]
    bc28:	e3a02090 	mov	r2, #144	; 0x90
    bc2c:	e1c320b0 	strh	r2, [r3]
    bc30:	e594301c 	ldr	r3, [r4, #28]
    bc34:	e3a02000 	mov	r2, #0	; 0x0
    bc38:	e1c320b0 	strh	r2, [r3]
    bc3c:	e5943034 	ldr	r3, [r4, #52]
    bc40:	e1d330b0 	ldrh	r3, [r3]
    bc44:	e3130001 	tst	r3, #1	; 0x1
    bc48:	0afffffb 	beq	0xbc3c
    bc4c:	e594303c 	ldr	r3, [r4, #60]
    bc50:	e3a07b3b 	mov	r7, #60416	; 0xec00
    bc54:	e3877076 	orr	r7, r7, #118	; 0x76
    bc58:	e5931000 	ldr	r1, [r3]
    bc5c:	e3a06b3b 	mov	r6, #60416	; 0xec00
    bc60:	e38660f1 	orr	r6, r6, #241	; 0xf1
    bc64:	e1a03421 	lsr	r3, r1, #8
    bc68:	e20320ff 	and	r2, r3, #255	; 0xff
    bc6c:	e20130ff 	and	r3, r1, #255	; 0xff
    bc70:	e0825403 	add	r5, r2, r3, lsl #8
    bc74:	e1550007 	cmp	r5, r7
    bc78:	03a03001 	moveq	r3, #1	; 0x1
    bc7c:	03a02c02 	moveq	r2, #512	; 0x200
    bc80:	03a0ec02 	moveq	lr, #512	; 0x200
    bc84:	0a000004 	beq	0xbc9c
    bc88:	e1550006 	cmp	r5, r6
    bc8c:	1a00001e 	bne	0xbd0c
    bc90:	e3a03000 	mov	r3, #0	; 0x0
    bc94:	e3a02b01 	mov	r2, #1024	; 0x400
    bc98:	e3a0eb01 	mov	lr, #1024	; 0x400
    bc9c:	e5843018 	str	r3, [r4, #24]
    bca0:	e5943030 	ldr	r3, [r4, #48]
    bca4:	e3a01000 	mov	r1, #0	; 0x0
    bca8:	e584e010 	str	lr, [r4, #16]
    bcac:	e5841020 	str	r1, [r4, #32]
    bcb0:	e5842038 	str	r2, [r4, #56]
    bcb4:	e1d330b0 	ldrh	r3, [r3]
    bcb8:	e5942030 	ldr	r2, [r4, #48]
    bcbc:	e3833002 	orr	r3, r3, #2	; 0x2
    bcc0:	e1c230b0 	strh	r3, [r2]
    bcc4:	ebffeff2 	bl	0x7c94
    bcc8:	e2843050 	add	r3, r4, #80	; 0x50
    bccc:	e2832a01 	add	r2, r3, #4096	; 0x1000
    bcd0:	e3a01000 	mov	r1, #0	; 0x0
    bcd4:	e4831004 	str	r1, [r3], #4
    bcd8:	e1530002 	cmp	r3, r2
    bcdc:	1afffffc 	bne	0xbcd4
    bce0:	e59f3038 	ldr	r3, [pc, #56]	; 0xbd20
    bce4:	e5933000 	ldr	r3, [r3]
    bce8:	e3530001 	cmp	r3, #1	; 0x1
    bcec:	1a000003 	bne	0xbd00
    bcf0:	e1550007 	cmp	r5, r7
    bcf4:	0bfffeb0 	bleq	0xb7bc
    bcf8:	e1550006 	cmp	r5, r6
    bcfc:	0bffff0e 	bleq	0xb93c
    bd00:	e5940048 	ldr	r0, [r4, #72]
    bd04:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    bd08:	e12fff1e 	bx	lr
    bd0c:	e5943048 	ldr	r3, [r4, #72]
    bd10:	eb000186 	bl	bc330
    bd14:	e3a00000 	mov	r0, #0	; 0x0
    bd18:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    bd1c:	e12fff1e 	bx	lr
*/

.xbd20:			.word 	0x800690f4
.xbd24:			.word 	0x8006a9f0

bbd28:	 				push	{lr}		@ (str lr, [sp, #-4]!)
						ldr	lr, .xbd70
						ldr	lr, [lr]
						cmp	lr, #0
						bne	bbd50
						cmp	r0, #0x40000
						bcs	bbd64
						bl	bae5c
						pop	{lr}		@ (ldr lr, [sp], #4)
						bx	lr

bbd50:				 	cmp	r0, #0x20000
						bcs	bbd64
						bl	ba2e4
						pop	{lr}		@ (ldr lr, [sp], #4)
						bx	lr

bbd64:	 				mov	r0, #0
						pop	{lr}		@ (ldr lr, [sp], #4)
						bx	lr

.xbd70:			.word 	0x8006aa08

bbd74:	 				push	{r4, r5, r6, lr}
						mov	r5, r0
						ldr	r3, .xbddc
						mov	r4, #0
						ldr	r3, [r3]
						cmp	r3, #0	
						bne	bbda4
						cmp	r5, #0x400
						bcs	bbdcc
						bl	bb190
						mov	r4, r0
						b	bbdd0

bbda4:				 	cmp	r5, #0x200
						bcs	bbdcc
						mov	r6, #0
bbdb0:					add	r0, r6, r5, lsl #3
						bl	ba57c
						add	r6, r6, #1	
						cmp	r6, #8
						orr	r4, r0, r4
						blt	bbdb0
						b	bbdd0
bbdcc:	 				mov	r4, #0
bbdd0:	 				mov	r0, r4
						pop	{r4, r5, r6, lr}
						bx	lr
.xbddc:		.word 		0x8006aa08

bbde0:	 				push	{r4, r5, r6, lr}
/*
    bde4:	e1a06000 	mov	r6, r0
    bde8:	e59f50b4 	ldr	r5, [pc, #180]	; 0xbea4
    bdec:	e2853044 	add	r3, r5, #68	; 0x44
    bdf0:	e7933106 	ldr	r3, [r3, r6, lsl #2]
    bdf4:	e3530000 	cmp	r3, #0	; 0x0
    bdf8:	13a00000 	movne	r0, #0	; 0x0
    bdfc:	18bd4070 	popne	{r4, r5, r6, lr}
    be00:	112fff1e 	bxne	lr
    be04:	e5953000 	ldr	r3, [r5]
    be08:	e3530000 	cmp	r3, #0	; 0x0
    be0c:	11a02003 	movne	r2, r3
    be10:	15923004 	ldrne	r3, [r2, #4]
    be14:	13833b02 	orrne	r3, r3, #2048	; 0x800
    be18:	15823004 	strne	r3, [r2, #4]
    be1c:	e595300c 	ldr	r3, [r5, #12]
    be20:	e3530000 	cmp	r3, #0	; 0x0
    be24:	1a00000a 	bne	0xbe54
    be28:	e3560b01 	cmp	r6, #1024	; 0x400
    be2c:	2a000013 	bcs	0xbe80
    be30:	e3a04000 	mov	r4, #0	; 0x0
    be34:	e0840006 	add	r0, r4, r6
    be38:	ebfffceb 	bl	0xb1ec
    be3c:	e3500000 	cmp	r0, #0	; 0x0
    be40:	0a00000f 	beq	0xbe84
    be44:	e2844001 	add	r4, r4, #1	; 0x1
    be48:	e3540001 	cmp	r4, #1	; 0x1
    be4c:	bafffff8 	blt	0xbe34
    be50:	ea00000b 	b	0xbe84
    be54:	e3560c02 	cmp	r6, #512	; 0x200
    be58:	2a000008 	bcs	0xbe80
    be5c:	e3a04000 	mov	r4, #0	; 0x0
    be60:	e0840186 	add	r0, r4, r6, lsl #3
    be64:	ebfff9dc 	bl	0xa5dc
    be68:	e3500000 	cmp	r0, #0	; 0x0
    be6c:	0a000004 	beq	0xbe84
    be70:	e2844001 	add	r4, r4, #1	; 0x1
    be74:	e3540008 	cmp	r4, #8	; 0x8
    be78:	bafffff8 	blt	0xbe60
    be7c:	ea000000 	b	0xbe84
    be80:	e3a00000 	mov	r0, #0	; 0x0
    be84:	e5953000 	ldr	r3, [r5]
    be88:	e3530000 	cmp	r3, #0	; 0x0
    be8c:	11a02003 	movne	r2, r3
    be90:	15923004 	ldrne	r3, [r2, #4]
    be94:	13c33b02 	bicne	r3, r3, #2048	; 0x800
    be98:	15823004 	strne	r3, [r2, #4]
    be9c:	e8bd4070 	pop	{r4, r5, r6, lr}
    bea0:	e12fff1e 	bx	lr
    bea4:	8006a9fc 	strdhi	sl, [r6], -ip
*/
bbea8:				 	push	{r4, r5, r6, r7, lr}
/*
    beac:	e1a06003 	mov	r6, r3
    beb0:	e1a07002 	mov	r7, r2
    beb4:	e59f5094 	ldr	r5, [pc, #148]	; 0xbf50
    beb8:	e280e0ff 	add	lr, r0, #255	; 0xff
    bebc:	e1a0442e 	lsr	r4, lr, #8
    bec0:	e285e044 	add	lr, r5, #68	; 0x44
    bec4:	e79ee104 	ldr	lr, [lr, r4, lsl #2]
    bec8:	e35e0000 	cmp	lr, #0	; 0x0
    becc:	13a00000 	movne	r0, #0	; 0x0
    bed0:	18bd40f0 	popne	{r4, r5, r6, r7, lr}
    bed4:	112fff1e 	bxne	lr
    bed8:	e5952000 	ldr	r2, [r5]
    bedc:	e3520000 	cmp	r2, #0	; 0x0
    bee0:	15923004 	ldrne	r3, [r2, #4]
    bee4:	13833b02 	orrne	r3, r3, #2048	; 0x800
    bee8:	15823004 	strne	r3, [r2, #4]
    beec:	15952000 	ldrne	r2, [r5]
    bef0:	e595300c 	ldr	r3, [r5, #12]
    bef4:	e3530000 	cmp	r3, #0	; 0x0
    bef8:	1a000006 	bne	0xbf18
    befc:	e3500701 	cmp	r0, #262144	; 0x40000

    bf00:	2a00000b 	bcs	0xbf34

    bf04:	e1a03006 	mov	r3, r6
    bf08:	e1a02007 	mov	r2, r7
    bf0c:	ebfffced 	bl	0xb2c8
    bf10:	e5952000 	ldr	r2, [r5]
    bf14:	ea000007 	b	0xbf38
    bf18:	e3500802 	cmp	r0, #131072	; 0x20000
    bf1c:	2a000004 	bcs	0xbf34
    bf20:	e1a03006 	mov	r3, r6
    bf24:	e1a02007 	mov	r2, r7
    bf28:	ebfff9e6 	bl	0xa6c8
    bf2c:	e5952000 	ldr	r2, [r5]
    bf30:	ea000000 	b	0xbf38

    bf34:	e3a00000 	mov	r0, #0	; 0x0
    bf38:	e3520000 	cmp	r2, #0	; 0x0
    bf3c:	15923004 	ldrne	r3, [r2, #4]
    bf40:	13c33b02 	bicne	r3, r3, #2048	; 0x800
    bf44:	15823004 	strne	r3, [r2, #4]
    bf48:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    bf4c:	e12fff1e 	bx	lr
    bf50:	8006a9fc 	strdhi	sl, [r6], -ip
    bf54:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    bf58:	e1a07001 	mov	r7, r1
    bf5c:	e1a06000 	mov	r6, r0
    bf60:	e59f50a4 	ldr	r5, [pc, #164]	; 0xc00c
    bf64:	e5953000 	ldr	r3, [r5]
    bf68:	e3530000 	cmp	r3, #0	; 0x0
    bf6c:	11a02003 	movne	r2, r3
    bf70:	15923004 	ldrne	r3, [r2, #4]
    bf74:	13833b02 	orrne	r3, r3, #2048	; 0x800
    bf78:	15823004 	strne	r3, [r2, #4]
    bf7c:	e595300c 	ldr	r3, [r5, #12]
    bf80:	e3530000 	cmp	r3, #0	; 0x0
    bf84:	1a00000b 	bne	0xbfb8
    bf88:	e3560b01 	cmp	r6, #1024	; 0x400
    bf8c:	2a000015 	bcs	0xbfe8
    bf90:	e3a04000 	mov	r4, #0	; 0x0
    bf94:	e1a01007 	mov	r1, r7
    bf98:	e0840006 	add	r0, r4, r6
    bf9c:	ebfffdec 	bl	0xb754
    bfa0:	e3500000 	cmp	r0, #0	; 0x0
    bfa4:	0a000010 	beq	0xbfec
    bfa8:	e2844001 	add	r4, r4, #1	; 0x1
    bfac:	e3540001 	cmp	r4, #1	; 0x1
    bfb0:	bafffff7 	blt	0xbf94
    bfb4:	ea00000c 	b	0xbfec
    bfb8:	e3560c02 	cmp	r6, #512	; 0x200
    bfbc:	2a000009 	bcs	0xbfe8
    bfc0:	e3a04000 	mov	r4, #0	; 0x0
    bfc4:	e1a01007 	mov	r1, r7
    bfc8:	e0840186 	add	r0, r4, r6, lsl #3
    bfcc:	ebfffaef 	bl	0xab90
    bfd0:	e3500000 	cmp	r0, #0	; 0x0
    bfd4:	0a000004 	beq	0xbfec
    bfd8:	e2844001 	add	r4, r4, #1	; 0x1
    bfdc:	e3540008 	cmp	r4, #8	; 0x8
    bfe0:	bafffff7 	blt	0xbfc4
    bfe4:	ea000000 	b	0xbfec
    bfe8:	e3a00000 	mov	r0, #0	; 0x0
    bfec:	e5953000 	ldr	r3, [r5]
    bff0:	e3530000 	cmp	r3, #0	; 0x0
    bff4:	11a02003 	movne	r2, r3
    bff8:	15923004 	ldrne	r3, [r2, #4]
    bffc:	13c33b02 	bicne	r3, r3, #2048	; 0x800
    c000:	15823004 	strne	r3, [r2, #4]
    c004:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    c008:	e12fff1e 	bx	lr
    c00c:	8006a9fc 	strdhi	sl, [r6], -ip
    c010:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c014:	e1a09003 	mov	r9, r3
    c018:	e3a02a72 	mov	r2, #466944	; 0x72000
    c01c:	e242207c 	sub	r2, r2, #124	; 0x7c
    c020:	e1500002 	cmp	r0, r2
    c024:	0a000031 	beq	0xc0f0
    c028:	e3a02a72 	mov	r2, #466944	; 0x72000
    c02c:	e2422078 	sub	r2, r2, #120	; 0x78
    c030:	e1500002 	cmp	r0, r2
    c034:	0a000020 	beq	0xc0bc
    c038:	e3a02a72 	mov	r2, #466944	; 0x72000
    c03c:	e2422074 	sub	r2, r2, #116	; 0x74
    c040:	e1500002 	cmp	r0, r2
    c044:	0a000002 	beq	0xc054
    c048:	e3a00000 	mov	r0, #0	; 0x0
    c04c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c050:	e12fff1e 	bx	lr
    c054:	e3590000 	cmp	r9, #0	; 0x0
    c058:	0afffffa 	beq	0xc048
    c05c:	e59d3024 	ldr	r3, [sp, #36]
    c060:	e3530038 	cmp	r3, #56	; 0x38
    c064:	3afffff7 	bcc	0xc048
    c068:	e59f30e4 	ldr	r3, [pc, #228]	; 0xc154
    c06c:	e59f20dc 	ldr	r2, [pc, #220]	; 0xc150
    c070:	e59f10d4 	ldr	r1, [pc, #212]	; 0xc14c
    c074:	e59f00cc 	ldr	r0, [pc, #204]	; 0xc148
    c078:	e59fe0c4 	ldr	lr, [pc, #196]	; 0xc144
    c07c:	e59f40bc 	ldr	r4, [pc, #188]	; 0xc140
    c080:	e59f50b4 	ldr	r5, [pc, #180]	; 0xc13c
    c084:	e59f60ac 	ldr	r6, [pc, #172]	; 0xc138
    c088:	e59f70a4 	ldr	r7, [pc, #164]	; 0xc134
    c08c:	e59f809c 	ldr	r8, [pc, #156]	; 0xc130
    c090:	e3a0a038 	mov	sl, #56	; 0x38
    c094:	e3a0b000 	mov	fp, #0	; 0x0
    c098:	e5893004 	str	r3, [r9, #4]
    c09c:	e5892008 	str	r2, [r9, #8]
    c0a0:	e589100c 	str	r1, [r9, #12]
    c0a4:	e289c010 	add	ip, r9, #16	; 0x10
    c0a8:	e88c4001 	stm	ip, {r0, lr}
    c0ac:	e289c018 	add	ip, r9, #24	; 0x18
    c0b0:	e88c09f0 	stm	ip, {r4, r5, r6, r7, r8, fp}
    c0b4:	e589a000 	str	sl, [r9]
    c0b8:	ea000018 	b	0xc120
    c0bc:	e5912000 	ldr	r2, [r1]
    c0c0:	e5913004 	ldr	r3, [r1, #4]
    c0c4:	e1520003 	cmp	r2, r3
    c0c8:	2a000014 	bcs	0xc120
    c0cc:	e59f3058 	ldr	r3, [pc, #88]	; 0xc12c
    c0d0:	e3a0e000 	mov	lr, #0	; 0x0
    c0d4:	e0830102 	add	r0, r3, r2, lsl #2
    c0d8:	e480e004 	str	lr, [r0], #4
    c0dc:	e5913004 	ldr	r3, [r1, #4]
    c0e0:	e2822001 	add	r2, r2, #1	; 0x1
    c0e4:	e1520003 	cmp	r2, r3
    c0e8:	3afffffa 	bcc	0xc0d8
    c0ec:	ea00000b 	b	0xc120
    c0f0:	e5912000 	ldr	r2, [r1]
    c0f4:	e5913004 	ldr	r3, [r1, #4]
    c0f8:	e1520003 	cmp	r2, r3
    c0fc:	2a000007 	bcs	0xc120
    c100:	e59f3024 	ldr	r3, [pc, #36]	; 0xc12c
    c104:	e3a0e001 	mov	lr, #1	; 0x1
    c108:	e0830102 	add	r0, r3, r2, lsl #2
    c10c:	e480e004 	str	lr, [r0], #4
    c110:	e5913004 	ldr	r3, [r1, #4]
    c114:	e2822001 	add	r2, r2, #1	; 0x1
    c118:	e1520003 	cmp	r2, r3
    c11c:	3afffffa 	bcc	0xc10c
    c120:	e3a00001 	mov	r0, #1	; 0x1
    c124:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c128:	e12fff1e 	bx	lr
    c12c:	8006aa40 	andhi	sl, r6, r0, asr #20


    c130:	80027098 	mulhi	r2, r8, r0
    c134:	80027094 	mulhi	r2, r4, r0
    c138:	80028de0 	andhi	r8, r2, r0, ror #27
    c13c:	80028ea8 	andhi	r8, r2, r8, lsr #29
    c140:	80028d28 	andhi	r8, r2, r8, lsr #26
    c144:	80028f54 	andhi	r8, r2, r4, asr pc
    c148:	80028d74 	andhi	r8, r2, r4, ror sp
    c14c:	80027044 	andhi	r7, r2, r4, asr #32
    c150:	80027030 	andhi	r7, r2, r0, lsr r0
    c154:	80028adc 	ldrdhi	r8, [r2], -ip
    c158:	e92d4070 	push	{r4, r5, r6, lr}
    c15c:	e24dd004 	sub	sp, sp, #4	; 0x4
    c160:	e1b06000 	movs	r6, r0
    c164:	0a00004b 	beq	0xc298
    c168:	e3510000 	cmp	r1, #0	; 0x0
    c16c:	0a000049 	beq	0xc298
    c170:	e3520000 	cmp	r2, #0	; 0x0
    c174:	0a000047 	beq	0xc298
    c178:	e28d3000 	add	r3, sp, #0	; 0x0
    c17c:	e0434002 	sub	r4, r3, r2
    c180:	e0415002 	sub	r5, r1, r2
    c184:	e3a0e003 	mov	lr, #3	; 0x3
    c188:	e7d51002 	ldrb	r1, [r5, r2]
    c18c:	e5d23000 	ldrb	r3, [r2]
    c190:	e25ee001 	subs	lr, lr, #1	; 0x1
    c194:	e0213003 	eor	r3, r1, r3
    c198:	e7c43002 	strb	r3, [r4, r2]
    c19c:	e2822001 	add	r2, r2, #1	; 0x1
    c1a0:	1afffff8 	bne	0xc188
    c1a4:	e3a01000 	mov	r1, #0	; 0x0
    c1a8:	e3a00000 	mov	r0, #0	; 0x0
    c1ac:	e28d4000 	add	r4, sp, #0	; 0x0
    c1b0:	e7d03004 	ldrb	r3, [r0, r4]
    c1b4:	e3a0e000 	mov	lr, #0	; 0x0
    c1b8:	e1b02003 	movs	r2, r3
    c1bc:	0a000005 	beq	0xc1d8
    c1c0:	e28230ff 	add	r3, r2, #255	; 0xff
    c1c4:	e0032002 	and	r2, r3, r2
    c1c8:	e28e3001 	add	r3, lr, #1	; 0x1
    c1cc:	e203e0ff 	and	lr, r3, #255	; 0xff
    c1d0:	e21220ff 	ands	r2, r2, #255	; 0xff
    c1d4:	1afffff9 	bne	0xc1c0
    c1d8:	e2800001 	add	r0, r0, #1	; 0x1
    c1dc:	e3500003 	cmp	r0, #3	; 0x3
    c1e0:	e081100e 	add	r1, r1, lr
    c1e4:	3afffff1 	bcc	0xc1b0
    c1e8:	e3510000 	cmp	r1, #0	; 0x0
    c1ec:	0a000027 	beq	0xc290
    c1f0:	e3510001 	cmp	r1, #1	; 0x1
    c1f4:	0a000027 	beq	0xc298
    c1f8:	e351000c 	cmp	r1, #12	; 0xc
    c1fc:	1a000025 	bne	0xc298
    c200:	e5dd5002 	ldrb	r5, [sp, #2]
    c204:	e5dd4001 	ldrb	r4, [sp, #1]
    c208:	e5dde000 	ldrb	lr, [sp]
    c20c:	e2052002 	and	r2, r5, #2	; 0x2
    c210:	e2043002 	and	r3, r4, #2	; 0x2
    c214:	e1a010ae 	lsr	r1, lr, #1
    c218:	e1830202 	orr	r0, r3, r2, lsl #4
    c21c:	e2043008 	and	r3, r4, #8	; 0x8
    c220:	e20e2020 	and	r2, lr, #32	; 0x20
    c224:	e2011040 	and	r1, r1, #64	; 0x40
    c228:	e1830080 	orr	r0, r3, r0, lsl #1
    c22c:	e1811002 	orr	r1, r1, r2
    c230:	e2043020 	and	r3, r4, #32	; 0x20
    c234:	e20e2008 	and	r2, lr, #8	; 0x8
    c238:	e1830080 	orr	r0, r3, r0, lsl #1
    c23c:	e18210a1 	orr	r1, r2, r1, lsr #1
    c240:	e20e3002 	and	r3, lr, #2	; 0x2
    c244:	e1a020a5 	lsr	r2, r5, #1
    c248:	e18330a1 	orr	r3, r3, r1, lsr #1
    c24c:	e202e040 	and	lr, r2, #64	; 0x40
    c250:	e1a00080 	lsl	r0, r0, #1
    c254:	e2052020 	and	r2, r5, #32	; 0x20
    c258:	e18000a3 	orr	r0, r0, r3, lsr #1
    c25c:	e18e2002 	orr	r2, lr, r2
    c260:	e2053008 	and	r3, r5, #8	; 0x8
    c264:	e2041080 	and	r1, r4, #128	; 0x80
    c268:	e18330a2 	orr	r3, r3, r2, lsr #1
    c26c:	e1801001 	orr	r1, r0, r1
    c270:	e7f12006 	ldrb	r2, [r1, r6]!
    c274:	e1a031a3 	lsr	r3, r3, #3
    c278:	e3a00001 	mov	r0, #1	; 0x1
    c27c:	e1a03310 	lsl	r3, r0, r3
    c280:	e1130002 	tst	r3, r2
    c284:	11c23003 	bicne	r3, r2, r3
    c288:	01833002 	orreq	r3, r3, r2
    c28c:	e5c13000 	strb	r3, [r1]
    c290:	e3a00001 	mov	r0, #1	; 0x1
    c294:	ea000000 	b	0xc29c
    c298:	e3a00000 	mov	r0, #0	; 0x0
    c29c:	e28dd004 	add	sp, sp, #4	; 0x4
    c2a0:	e8bd4070 	pop	{r4, r5, r6, lr}
    c2a4:	e12fff1e 	bx	lr

    c2a8:	e92d0ffc 	push	{r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
    c2ac:	e3a02c02 	mov	r2, #512	; 0x200
    c2b0:	e5914000 	ldr	r4, [r1]
    c2b4:	e5915000 	ldr	r5, [r1]
    c2b8:	e5916000 	ldr	r6, [r1]
    c2bc:	e5917000 	ldr	r7, [r1]
    c2c0:	e5918000 	ldr	r8, [r1]
    c2c4:	e5919000 	ldr	r9, [r1]
    c2c8:	e591a000 	ldr	sl, [r1]
    c2cc:	e591b000 	ldr	fp, [r1]
    c2d0:	e8a00ff0 	stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
    c2d4:	e2522020 	subs	r2, r2, #32	; 0x20
    c2d8:	1afffff4 	bne	0xc2b0
    c2dc:	e8bd0ffc 	pop	{r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
    c2e0:	e1a0f00e 	mov	pc, lr

    c2e4:	e92d1ffc 	push	{r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    c2e8:	e3a0c0ff 	mov	ip, #255	; 0xff
    c2ec:	e3a02c02 	mov	r2, #512	; 0x200
    c2f0:	e8b00ff0 	ldm	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
    c2f4:	e5814000 	str	r4, [r1]
    c2f8:	e5815000 	str	r5, [r1]
    c2fc:	e5816000 	str	r6, [r1]
    c300:	e5817000 	str	r7, [r1]
    c304:	e5818000 	str	r8, [r1]
    c308:	e5819000 	str	r9, [r1]
    c30c:	e581a000 	str	sl, [r1]
    c310:	e581b000 	str	fp, [r1]
    c314:	e2522020 	subs	r2, r2, #32	; 0x20
    c318:	1afffff4 	bne	0xc2f0
    c31c:	e8bd1ffc 	pop	{r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    c320:	e1a0f00e 	mov	pc, lr
*/
bc324:					mov	r0, #VIDEO_BASE2
						orr	r0, r0, #0x600000
						bx	lr

bc330:	 				mov	r0, #1
						bx	lr
/*
    c338:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    c33c:	e1a00001 	mov	r0, r1
    c340:	e59f100c 	ldr	r1, [pc, #12]	; 0xc354
    c344:	e3a02038 	mov	r2, #56	; 0x38
    c348:	eb000397 	bl	bd1ac
    c34c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    c350:	e12fff1e 	bx	lr

    c354:	8006ba5c 	andhi	fp, r6, ip, asr sl
    c358:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    c35c:	e59f51d4 	ldr	r5, [pc, #468]	; 0xc538
    c360:	e3a08000 	mov	r8, #0	; 0x0
    c364:	e1d531ba 	ldrh	r3, [r5, #26]
    c368:	e3530b02 	cmp	r3, #2048	; 0x800
    c36c:	8a00002d 	bhi	0xc428
    c370:	e5953010 	ldr	r3, [r5, #16]
    c374:	e3a02000 	mov	r2, #0	; 0x0
    c378:	e5852008 	str	r2, [r5, #8]
    c37c:	e3530000 	cmp	r3, #0	; 0x0
    c380:	e3a07000 	mov	r7, #0	; 0x0
    c384:	0a000023 	beq	0xc418
    c388:	e3a09caa 	mov	r9, #43520	; 0xaa00
    c38c:	e59f61a0 	ldr	r6, [pc, #416]	; 0xc534
    c390:	e3899055 	orr	r9, r9, #85	; 0x55
    c394:	e595302c 	ldr	r3, [r5, #44]
    c398:	e1a00007 	mov	r0, r7
    c39c:	e1a0e00f 	mov	lr, pc
    c3a0:	e12fff13 	bx	r3
    c3a4:	e310000a 	tst	r0, #10	; 0xa
    c3a8:	1a000013 	bne	0xc3fc
    c3ac:	e1d521b8 	ldrh	r2, [r5, #24]
    c3b0:	e5954034 	ldr	r4, [r5, #52]
    c3b4:	e3a03001 	mov	r3, #1	; 0x1
    c3b8:	e00a0792 	mul	sl, r2, r7
    c3bc:	e3a02000 	mov	r2, #0	; 0x0
    c3c0:	e1a0000a 	mov	r0, sl
    c3c4:	e1a01006 	mov	r1, r6
    c3c8:	e1a0e00f 	mov	lr, pc
    c3cc:	e12fff14 	bx	r4
    c3d0:	e3500000 	cmp	r0, #0	; 0x0
    c3d4:	0a000013 	beq	0xc428
    c3d8:	e2863c01 	add	r3, r6, #256	; 0x100
    c3dc:	e1d33fbe 	ldrh	r3, [r3, #254]
    c3e0:	e1530009 	cmp	r3, r9
    c3e4:	1a000004 	bne	0xc3fc
    c3e8:	e5d63000 	ldrb	r3, [r6]
    c3ec:	e35300eb 	cmp	r3, #235	; 0xeb
    c3f0:	0a00000f 	beq	0xc434
    c3f4:	e35300e9 	cmp	r3, #233	; 0xe9
    c3f8:	0a00000d 	beq	0xc434
    c3fc:	e5953010 	ldr	r3, [r5, #16]
    c400:	e2877001 	add	r7, r7, #1	; 0x1
    c404:	e1570003 	cmp	r7, r3
    c408:	3affffe1 	bcc	0xc394
    c40c:	e5954008 	ldr	r4, [r5, #8]
    c410:	e3540000 	cmp	r4, #0	; 0x0
    c414:	1a000001 	bne	0xc420
    c418:	e3a04001 	mov	r4, #1	; 0x1
    c41c:	e5854008 	str	r4, [r5, #8]
    c420:	e3540010 	cmp	r4, #16	; 0x10
    c424:	9a000027 	bls	0xc4c8
    c428:	e3a00000 	mov	r0, #0	; 0x0
    c42c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    c430:	e12fff1e 	bx	lr
    c434:	e5954034 	ldr	r4, [r5, #52]
    c438:	e3a03001 	mov	r3, #1	; 0x1
    c43c:	e3a02000 	mov	r2, #0	; 0x0
    c440:	e1a01006 	mov	r1, r6
    c444:	e28a0001 	add	r0, sl, #1	; 0x1
    c448:	e1a0e00f 	mov	lr, pc
    c44c:	e12fff14 	bx	r4
    c450:	e3500000 	cmp	r0, #0	; 0x0
    c454:	0afffff3 	beq	0xc428
    c458:	e59f10d0 	ldr	r1, [pc, #208]	; 0xc530
    c45c:	e3a02008 	mov	r2, #8	; 0x8
    c460:	e1a00006 	mov	r0, r6
    c464:	eb0006a8 	bl	0xdf0c
    c468:	e3500000 	cmp	r0, #0	; 0x0
    c46c:	1affffe6 	bne	0xc40c
    c470:	e596000c 	ldr	r0, [r6, #12]
    c474:	e59f30b0 	ldr	r3, [pc, #176]	; 0xc52c
    c478:	e5967008 	ldr	r7, [r6, #8]
    c47c:	e0821390 	umull	r1, r2, r0, r3
    c480:	e1b0e227 	lsrs	lr, r7, #4
    c484:	e0403002 	sub	r3, r0, r2
    c488:	e08230a3 	add	r3, r2, r3, lsr #1
    c48c:	e1a04223 	lsr	r4, r3, #4
    c490:	e585e000 	str	lr, [r5]
    c494:	e5854008 	str	r4, [r5, #8]
    c498:	0a000005 	beq	0xc4b4
    c49c:	e35e0010 	cmp	lr, #16	; 0x10
    c4a0:	8affffe0 	bhi	0xc428
    c4a4:	e1a0220e 	lsl	r2, lr, #4
    c4a8:	e2861010 	add	r1, r6, #16	; 0x10
    c4ac:	e2850f56 	add	r0, r5, #344	; 0x158
    c4b0:	eb00033d 	bl	bd1ac
    c4b4:	e3540000 	cmp	r4, #0	; 0x0
    c4b8:	0affffd6 	beq	0xc418
    c4bc:	e2863010 	add	r3, r6, #16	; 0x10
    c4c0:	e0878003 	add	r8, r7, r3
    c4c4:	eaffffd1 	b	0xc410
    c4c8:	e3580000 	cmp	r8, #0	; 0x0
    c4cc:	0a000005 	beq	0xc4e8
    c4d0:	e0642184 	rsb	r2, r4, r4, lsl #3
    c4d4:	e1a02102 	lsl	r2, r2, #2
    c4d8:	e1a01008 	mov	r1, r8
    c4dc:	e2850f96 	add	r0, r5, #600	; 0x258
    c4e0:	eb000331 	bl	bd1ac
    c4e4:	ea00000d 	b	0xc520
    c4e8:	e5953010 	ldr	r3, [r5, #16]
    c4ec:	e3a01000 	mov	r1, #0	; 0x0
    c4f0:	e5952014 	ldr	r2, [r5, #20]
    c4f4:	e585125c 	str	r1, [r5, #604]
    c4f8:	e3a01000 	mov	r1, #0	; 0x0
    c4fc:	e5853260 	str	r3, [r5, #608]
    c500:	e1d531b8 	ldrh	r3, [r5, #24]
    c504:	e5851264 	str	r1, [r5, #612]
    c508:	e585226c 	str	r2, [r5, #620]
    c50c:	e3a02002 	mov	r2, #2	; 0x2
    c510:	e5852258 	str	r2, [r5, #600]
    c514:	e5853268 	str	r3, [r5, #616]
    c518:	e3a03004 	mov	r3, #4	; 0x4
    c51c:	e5853270 	str	r3, [r5, #624]
    c520:	e3a00001 	mov	r0, #1	; 0x1
    c524:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    c528:	e12fff1e 	bx	lr

    c52c:	24924925 	ldrcs	r4, [r2], #2341
    c530:	80023140 	andhi	r3, r2, r0, asr #2
    c534:	8006be58 	andhi	fp, r6, r8, asr lr
    c538:	8006ba40 	andhi	fp, r6, r0, asr #20
    c53c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c540:	e59f40d8 	ldr	r4, [pc, #216]	; 0xc620
    c544:	e3a05000 	mov	r5, #0	; 0x0
    c548:	e5943010 	ldr	r3, [r4, #16]
    c54c:	e3530000 	cmp	r3, #0	; 0x0
    c550:	0a000009 	beq	0xc57c
    c554:	e594302c 	ldr	r3, [r4, #44]
    c558:	e1a00005 	mov	r0, r5
    c55c:	e1a0e00f 	mov	lr, pc
    c560:	e12fff13 	bx	r3
    c564:	e310000a 	tst	r0, #10	; 0xa
    c568:	0a000003 	beq	0xc57c
    c56c:	e5943010 	ldr	r3, [r4, #16]
    c570:	e2855001 	add	r5, r5, #1	; 0x1
    c574:	e1550003 	cmp	r5, r3
    c578:	3afffff5 	bcc	0xc554
    c57c:	e5943000 	ldr	r3, [r4]
    c580:	e1a06005 	mov	r6, r5
    c584:	e3a09000 	mov	r9, #0	; 0x0
    c588:	e3530000 	cmp	r3, #0	; 0x0
    c58c:	0a00001f 	beq	0xc610
    c590:	e3a08000 	mov	r8, #0	; 0x0
    c594:	e284af56 	add	sl, r4, #344	; 0x158
    c598:	e284b058 	add	fp, r4, #88	; 0x58
    c59c:	e088300a 	add	r3, r8, sl
    c5a0:	e593300c 	ldr	r3, [r3, #12]
    c5a4:	e1b07003 	movs	r7, r3
    c5a8:	0a00000e 	beq	0xc5e8
    c5ac:	e2477001 	sub	r7, r7, #1	; 0x1
    c5b0:	ea000006 	b	0xc5d0
    c5b4:	e594302c 	ldr	r3, [r4, #44]
    c5b8:	e1a00006 	mov	r0, r6
    c5bc:	e1a0e00f 	mov	lr, pc
    c5c0:	e12fff13 	bx	r3
    c5c4:	e3100002 	tst	r0, #2	; 0x2
    c5c8:	0a000003 	beq	0xc5dc
    c5cc:	e2866001 	add	r6, r6, #1	; 0x1
    c5d0:	e5943010 	ldr	r3, [r4, #16]
    c5d4:	e1560003 	cmp	r6, r3
    c5d8:	3afffff5 	bcc	0xc5b4
    c5dc:	e2866001 	add	r6, r6, #1	; 0x1
    c5e0:	e3570000 	cmp	r7, #0	; 0x0
    c5e4:	1afffff0 	bne	0xc5ac
    c5e8:	e5942000 	ldr	r2, [r4]
    c5ec:	e088100b 	add	r1, r8, fp
    c5f0:	e0463005 	sub	r3, r6, r5
    c5f4:	e2899001 	add	r9, r9, #1	; 0x1
    c5f8:	e5815008 	str	r5, [r1, #8]
    c5fc:	e1590002 	cmp	r9, r2
    c600:	e581300c 	str	r3, [r1, #12]
    c604:	e1a05006 	mov	r5, r6
    c608:	e2888010 	add	r8, r8, #16	; 0x10
    c60c:	3affffe2 	bcc	0xc59c
    c610:	e5846004 	str	r6, [r4, #4]
    c614:	e3a00001 	mov	r0, #1	; 0x1
    c618:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c61c:	e12fff1e 	bx	lr
*/
xc620:	.word 0x8006ba40
/*
bc624:			push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c628:	e59fc2ac 	ldr	ip, [pc, #684]	; 0xc8dc
    c62c:	e08dd00c 	add	sp, sp, ip
    c630:	e58d1008 	str	r1, [sp, #8]
    c634:	e1a0a000 	mov	sl, r0
    c638:	e59f3298 	ldr	r3, [pc, #664]	; 0xc8d8
    c63c:	e5933000 	ldr	r3, [r3]
    c640:	e58d3818 	str	r3, [sp, #2072]
    c644:	e3a00001 	mov	r0, #1	; 0x1
    c648:	ebffed91 	bl	0x7c94
    c64c:	e59a100c 	ldr	r1, [sl, #12]
    c650:	e58d000c 	str	r0, [sp, #12]
    c654:	e59a0010 	ldr	r0, [sl, #16]
    c658:	eb00066b 	bl	0xe00c
    c65c:	e1b09000 	movs	r9, r0
    c660:	e58d9004 	str	r9, [sp, #4]
    c664:	0a000010 	beq	0xc6ac
    c668:	e59f5264 	ldr	r5, [pc, #612]	; 0xc8d4
    c66c:	e3a04000 	mov	r4, #0	; 0x0
    c670:	e5953000 	ldr	r3, [r5]
    c674:	e3530000 	cmp	r3, #0	; 0x0
    c678:	0a00000b 	beq	0xc6ac
    c67c:	e2856f56 	add	r6, r5, #344	; 0x158
    c680:	e3a02008 	mov	r2, #8	; 0x8
    c684:	e1a01006 	mov	r1, r6
    c688:	e1a0000a 	mov	r0, sl
    c68c:	eb00065f 	bl	0xe010
    c690:	e3500000 	cmp	r0, #0	; 0x0
    c694:	0a00000f 	beq	0xc6d8
    c698:	e5953000 	ldr	r3, [r5]
    c69c:	e2844001 	add	r4, r4, #1	; 0x1
    c6a0:	e2866010 	add	r6, r6, #16	; 0x10
    c6a4:	e1540003 	cmp	r4, r3
    c6a8:	3afffff4 	bcc	0xc680
    c6ac:	e3a04000 	mov	r4, #0	; 0x0
    c6b0:	e59d000c 	ldr	r0, [sp, #12]
    c6b4:	ebffed76 	bl	0x7c94
    c6b8:	e59d0818 	ldr	r0, [sp, #2072]
    c6bc:	eb00021f 	bl	bcf40
    c6c0:	e1a00004 	mov	r0, r4
    c6c4:	e3a0ce81 	mov	ip, #2064	; 0x810
    c6c8:	e38cc00c 	orr	ip, ip, #12	; 0xc
    c6cc:	e08dd00c 	add	sp, sp, ip
    c6d0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c6d4:	e12fff1e 	bx	lr

    c6d8:	e2853f56 	add	r3, r5, #344	; 0x158
    c6dc:	e0833204 	add	r3, r3, r4, lsl #4
    c6e0:	e593300c 	ldr	r3, [r3, #12]
    c6e4:	e5958014 	ldr	r8, [r5, #20]
    c6e8:	e59a6008 	ldr	r6, [sl, #8]
    c6ec:	e0020893 	mul	r2, r3, r8
    c6f0:	e1560002 	cmp	r6, r2
    c6f4:	2affffec 	bcs	0xc6ac
    c6f8:	e59a700c 	ldr	r7, [sl, #12]
    c6fc:	e0863007 	add	r3, r6, r7
    c700:	e1530002 	cmp	r3, r2
    c704:	8affffe8 	bhi	0xc6ac
    c708:	e1d501ba 	ldrh	r0, [r5, #26]
    c70c:	e1a01006 	mov	r1, r6
    c710:	eb00026c 	bl	0xd0c8
    c714:	e3510000 	cmp	r1, #0	; 0x0
    c718:	1affffe3 	bne	0xc6ac
    c71c:	e3190003 	tst	r9, #3	; 0x3
    c720:	1affffe1 	bne	0xc6ac
    c724:	e1a00008 	mov	r0, r8
    c728:	e1a01006 	mov	r1, r6
    c72c:	eb000265 	bl	0xd0c8
    c730:	e2853058 	add	r3, r5, #88	; 0x58
    c734:	e0833204 	add	r3, r3, r4, lsl #4
    c738:	e5936008 	ldr	r6, [r3, #8]
    c73c:	e1a0b000 	mov	fp, r0
    c740:	e58db010 	str	fp, [sp, #16]
    c744:	e1b08007 	movs	r8, r7
    c748:	e3a09000 	mov	r9, #0	; 0x0
    c74c:	0a00005e 	beq	0xc8cc
    c750:	e5953010 	ldr	r3, [r5, #16]
    c754:	e1560003 	cmp	r6, r3
    c758:	2a00005b 	bcs	0xc8cc
    c75c:	e3a02000 	mov	r2, #0	; 0x0
    c760:	e595302c 	ldr	r3, [r5, #44]
    c764:	e58d2000 	str	r2, [sp]
    c768:	e1a00006 	mov	r0, r6
    c76c:	e1a0e00f 	mov	lr, pc
    c770:	e12fff13 	bx	r3
    c774:	e3100002 	tst	r0, #2	; 0x2
    c778:	1a000050 	bne	0xc8c0
    c77c:	e159000b 	cmp	r9, fp
    c780:	3a00004d 	bcc	0xc8bc
    c784:	e59d4008 	ldr	r4, [sp, #8]
    c788:	e3540000 	cmp	r4, #0	; 0x0
    c78c:	1a000005 	bne	0xc7a8
    c790:	e595303c 	ldr	r3, [r5, #60]
    c794:	e1a00006 	mov	r0, r6
    c798:	e1a0e00f 	mov	lr, pc
    c79c:	e12fff13 	bx	r3
    c7a0:	e3500000 	cmp	r0, #0	; 0x0
    c7a4:	0affffc0 	beq	0xc6ac
    c7a8:	e159000b 	cmp	r9, fp
    c7ac:	1a000007 	bne	0xc7d0
    c7b0:	e59a1008 	ldr	r1, [sl, #8]
    c7b4:	e5950014 	ldr	r0, [r5, #20]
    c7b8:	eb000242 	bl	0xd0c8
    c7bc:	e1a03000 	mov	r3, r0
    c7c0:	e1d501ba 	ldrh	r0, [r5, #26]
    c7c4:	eb00023f 	bl	0xd0c8
    c7c8:	e58d0000 	str	r0, [sp]
    c7cc:	ea000000 	b	0xc7d4
    c7d0:	e59d0000 	ldr	r0, [sp]
    c7d4:	e1d5b1b8 	ldrh	fp, [r5, #24]
    c7d8:	e150000b 	cmp	r0, fp
    c7dc:	2a000035 	bcs	0xc8b8
    c7e0:	e59d3004 	ldr	r3, [sp, #4]
    c7e4:	e3580000 	cmp	r8, #0	; 0x0
    c7e8:	0a000032 	beq	0xc8b8
    c7ec:	e1d571ba 	ldrh	r7, [r5, #26]
    c7f0:	e1a01003 	mov	r1, r3
    c7f4:	e1580007 	cmp	r8, r7
    c7f8:	2a00000c 	bcs	0xc830
    c7fc:	e3540000 	cmp	r4, #0	; 0x0
    c800:	1a000008 	bne	0xc828
    c804:	e1a02007 	mov	r2, r7
    c808:	e3a010ff 	mov	r1, #255	; 0xff
    c80c:	e28d0018 	add	r0, sp, #24	; 0x18
    c810:	eb0001cb 	bl	bcf44
    c814:	e59d1004 	ldr	r1, [sp, #4]
    c818:	e1a02008 	mov	r2, r8
    c81c:	e28d0018 	add	r0, sp, #24	; 0x18
    c820:	eb000261 	bl	bd1ac
    c824:	e59d0000 	ldr	r0, [sp]
    c828:	e28d1018 	add	r1, sp, #24	; 0x18
    c82c:	e1a07008 	mov	r7, r8
    c830:	e3540000 	cmp	r4, #0	; 0x0
    c834:	e3a03001 	mov	r3, #1	; 0x1
    c838:	e3a02000 	mov	r2, #0	; 0x0
    c83c:	e020069b 	mla	r0, fp, r6, r0
    c840:	0a00000c 	beq	0xc878
    c844:	e5954034 	ldr	r4, [r5, #52]
    c848:	e1a0e00f 	mov	lr, pc
    c84c:	e12fff14 	bx	r4
    c850:	e3500000 	cmp	r0, #0	; 0x0
    c854:	0affff94 	beq	0xc6ac
    c858:	e1d531ba 	ldrh	r3, [r5, #26]
    c85c:	e1580003 	cmp	r8, r3
    c860:	2a000009 	bcs	0xc88c
    c864:	e59d0004 	ldr	r0, [sp, #4]
    c868:	e1a02007 	mov	r2, r7
    c86c:	e28d1018 	add	r1, sp, #24	; 0x18
    c870:	eb00024d 	bl	bd1ac
    c874:	ea000004 	b	0xc88c

    c878:	e5954038 	ldr	r4, [r5, #56]
    c87c:	e1a0e00f 	mov	lr, pc
    c880:	e12fff14 	bx	r4
    c884:	e3500000 	cmp	r0, #0	; 0x0
    c888:	0affff87 	beq	0xc6ac
    c88c:	e59d0000 	ldr	r0, [sp]
    c890:	e59d3004 	ldr	r3, [sp, #4]
    c894:	e1d5b1b8 	ldrh	fp, [r5, #24]
    c898:	e2800001 	add	r0, r0, #1	; 0x1
    c89c:	e0833007 	add	r3, r3, r7
    c8a0:	e59d4008 	ldr	r4, [sp, #8]
    c8a4:	e58d0000 	str	r0, [sp]
    c8a8:	e150000b 	cmp	r0, fp
    c8ac:	e58d3004 	str	r3, [sp, #4]
    c8b0:	e0488007 	sub	r8, r8, r7
    c8b4:	3affffca 	bcc	0xc7e4
    c8b8:	e59db010 	ldr	fp, [sp, #16]
    c8bc:	e2899001 	add	r9, r9, #1	; 0x1
    c8c0:	e2866001 	add	r6, r6, #1	; 0x1
    c8c4:	e3580000 	cmp	r8, #0	; 0x0
    c8c8:	1affffa0 	bne	0xc750
    c8cc:	e3a04001 	mov	r4, #1	; 0x1
    c8d0:	eaffff76 	b	0xc6b0

    c8d4:	8006ba40 	andhi	fp, r6, r0, asr #20
    c8d8:	8006c65c 	andhi	ip, r6, ip, asr r6
    c8dc:	fffff7e4 	undefined instruction 0xfffff7e4
    c8e0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    c8e4:	e1a07001 	mov	r7, r1
    c8e8:	e1a04000 	mov	r4, r0
    c8ec:	e59f50b0 	ldr	r5, [pc, #176]	; 0xc9a4
    c8f0:	e595301c 	ldr	r3, [r5, #28]
    c8f4:	e1a00005 	mov	r0, r5
    c8f8:	e1a0e00f 	mov	lr, pc
    c8fc:	e12fff13 	bx	r3
    c900:	e3500000 	cmp	r0, #0	; 0x0
    c904:	0a000023 	beq	0xc998
    c908:	e1d520bc 	ldrh	r2, [r5, #12]
    c90c:	e5953030 	ldr	r3, [r5, #48]
    c910:	e1a00004 	mov	r0, r4
    c914:	e0060492 	mul	r6, r2, r4
    c918:	e1a0e00f 	mov	lr, pc
    c91c:	e12fff13 	bx	r3
    c920:	e3500000 	cmp	r0, #0	; 0x0
    c924:	0a00001b 	beq	0xc998
    c928:	e3570000 	cmp	r7, #0	; 0x0
    c92c:	0a000016 	beq	0xc98c
    c930:	e1d530bc 	ldrh	r3, [r5, #12]
    c934:	e1a08006 	mov	r8, r6
    c938:	e0833006 	add	r3, r3, r6
    c93c:	e1560003 	cmp	r6, r3
    c940:	2a000011 	bcs	0xc98c
    c944:	e1d510be 	ldrh	r1, [r5, #14]
    c948:	e595402c 	ldr	r4, [r5, #44]
    c94c:	e0812007 	add	r2, r1, r7
    c950:	e1a01007 	mov	r1, r7
    c954:	e3a03001 	mov	r3, #1	; 0x1
    c958:	e1a00008 	mov	r0, r8
    c95c:	e1a0e00f 	mov	lr, pc
    c960:	e12fff14 	bx	r4
    c964:	e3500000 	cmp	r0, #0	; 0x0
    c968:	0a00000a 	beq	0xc998
    c96c:	e1d510be 	ldrh	r1, [r5, #14]
    c970:	e1d520bc 	ldrh	r2, [r5, #12]
    c974:	e2888001 	add	r8, r8, #1	; 0x1
    c978:	e0813007 	add	r3, r1, r7
    c97c:	e0822006 	add	r2, r2, r6
    c980:	e2837008 	add	r7, r3, #8	; 0x8
    c984:	e1580002 	cmp	r8, r2
    c988:	3affffee 	bcc	0xc948
    c98c:	e3a00001 	mov	r0, #1	; 0x1
    c990:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    c994:	e12fff1e 	bx	lr
    c998:	e3a00000 	mov	r0, #0	; 0x0
    c99c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    c9a0:	e12fff1e 	bx	lr

    c9a4:	8006ba4c 	andhi	fp, r6, ip, asr #20
    c9a8:	e92d4010 	push	{r4, lr}
    c9ac:	e59f4050 	ldr	r4, [pc, #80]	; 0xca04
    c9b0:	e5940000 	ldr	r0, [r4]
    c9b4:	e3500000 	cmp	r0, #0	; 0x0
    c9b8:	1a00000e 	bne	0xc9f8
    c9bc:	e59f003c 	ldr	r0, [pc, #60]	; 0xca00
    c9c0:	e590301c 	ldr	r3, [r0, #28]
    c9c4:	e1a0e00f 	mov	lr, pc
    c9c8:	e12fff13 	bx	r3
    c9cc:	e3500000 	cmp	r0, #0	; 0x0
    c9d0:	0a000006 	beq	0xc9f0
    c9d4:	ebfffe5f 	bl	0xc358
    c9d8:	e3500000 	cmp	r0, #0	; 0x0
    c9dc:	0a000003 	beq	0xc9f0
    c9e0:	ebfffed5 	bl	0xc53c
    c9e4:	e3500000 	cmp	r0, #0	; 0x0
    c9e8:	13a00001 	movne	r0, #1	; 0x1
    c9ec:	1a000000 	bne	0xc9f4
    c9f0:	e3a00000 	mov	r0, #0	; 0x0
    c9f4:	e5840000 	str	r0, [r4]
    c9f8:	e8bd4010 	pop	{r4, lr}
    c9fc:	e12fff1e 	bx	lr
    ca00:	8006ba4c 	andhi	fp, r6, ip, asr #20
    ca04:	8006c658 	andhi	ip, r6, r8, asr r6
    ca08:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ca0c:	e1a06000 	mov	r6, r0
    ca10:	e59f7148 	ldr	r7, [pc, #328]	; 0xcb60
    ca14:	e5960004 	ldr	r0, [r6, #4]
    ca18:	e5964000 	ldr	r4, [r6]
    ca1c:	e597e004 	ldr	lr, [r7, #4]
    ca20:	e596b008 	ldr	fp, [r6, #8]
    ca24:	e0843000 	add	r3, r4, r0
    ca28:	e154000e 	cmp	r4, lr
    ca2c:	e2433001 	sub	r3, r3, #1	; 0x1
    ca30:	2a000045 	bcs	0xcb4c
    ca34:	e153000e 	cmp	r3, lr
    ca38:	2a000043 	bcs	0xcb4c
    ca3c:	e1530004 	cmp	r3, r4
    ca40:	3a000041 	bcc	0xcb4c
    ca44:	e1d730be 	ldrh	r3, [r7, #14]
    ca48:	e1d720bc 	ldrh	r2, [r7, #12]
    ca4c:	e596100c 	ldr	r1, [r6, #12]
    ca50:	e2833008 	add	r3, r3, #8	; 0x8
    ca54:	e0020293 	mul	r2, r3, r2
    ca58:	e0030092 	mul	r3, r2, r0
    ca5c:	e1510003 	cmp	r1, r3
    ca60:	3a000039 	bcc	0xcb4c
    ca64:	e59fa0f0 	ldr	sl, [pc, #240]	; 0xcb5c
    ca68:	e59f90e8 	ldr	r9, [pc, #232]	; 0xcb58
    ca6c:	e3a05000 	mov	r5, #0	; 0x0
    ca70:	e59a3000 	ldr	r3, [sl]
    ca74:	e3a08000 	mov	r8, #0	; 0x0
    ca78:	e1530004 	cmp	r3, r4
    ca7c:	05995000 	ldreq	r5, [r9]
    ca80:	0a00000e 	beq	0xcac0
    ca84:	e3540000 	cmp	r4, #0	; 0x0
    ca88:	0a00000c 	beq	0xcac0
    ca8c:	e155000e 	cmp	r5, lr
    ca90:	2a00002d 	bcs	0xcb4c
    ca94:	e5973020 	ldr	r3, [r7, #32]
    ca98:	e1a00005 	mov	r0, r5
    ca9c:	e1a0e00f 	mov	lr, pc
    caa0:	e12fff13 	bx	r3
    caa4:	e5963000 	ldr	r3, [r6]
    caa8:	e3100002 	tst	r0, #2	; 0x2
    caac:	02888001 	addeq	r8, r8, #1	; 0x1
    cab0:	e597e004 	ldr	lr, [r7, #4]
    cab4:	e1580003 	cmp	r8, r3
    cab8:	e2855001 	add	r5, r5, #1	; 0x1
    cabc:	3afffff2 	bcc	0xca8c
    cac0:	e5963004 	ldr	r3, [r6, #4]
    cac4:	e1a04005 	mov	r4, r5
    cac8:	e1b08003 	movs	r8, r3
    cacc:	0a000016 	beq	0xcb2c
    cad0:	ea000000 	b	0xcad8
    cad4:	e597e004 	ldr	lr, [r7, #4]
    cad8:	e155000e 	cmp	r5, lr
    cadc:	2a00001a 	bcs	0xcb4c
    cae0:	e5973020 	ldr	r3, [r7, #32]
    cae4:	e1a00004 	mov	r0, r4
    cae8:	e1a0e00f 	mov	lr, pc
    caec:	e12fff13 	bx	r3
    caf0:	e3100002 	tst	r0, #2	; 0x2
    caf4:	1a000009 	bne	0xcb20
    caf8:	e1a0100b 	mov	r1, fp
    cafc:	e1a00004 	mov	r0, r4
    cb00:	ebffff76 	bl	0xc8e0
    cb04:	e3500000 	cmp	r0, #0	; 0x0
    cb08:	0a00000f 	beq	0xcb4c
    cb0c:	e5972008 	ldr	r2, [r7, #8]
    cb10:	e1d730bc 	ldrh	r3, [r7, #12]
    cb14:	e2488001 	sub	r8, r8, #1	; 0x1
    cb18:	e0823183 	add	r3, r2, r3, lsl #3
    cb1c:	e08bb003 	add	fp, fp, r3
    cb20:	e2844001 	add	r4, r4, #1	; 0x1
    cb24:	e3580000 	cmp	r8, #0	; 0x0
    cb28:	1affffe9 	bne	0xcad4
    cb2c:	e5962004 	ldr	r2, [r6, #4]
    cb30:	e5963000 	ldr	r3, [r6]
    cb34:	e5894000 	str	r4, [r9]
    cb38:	e3a00001 	mov	r0, #1	; 0x1
    cb3c:	e0823003 	add	r3, r2, r3
    cb40:	e58a3000 	str	r3, [sl]
    cb44:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    cb48:	e12fff1e 	bx	lr
    cb4c:	e3a00000 	mov	r0, #0	; 0x0
    cb50:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    cb54:	e12fff1e 	bx	lr
    cb58:	80069124 	andhi	r9, r6, r4, lsr #2
    cb5c:	80069128 	andhi	r9, r6, r8, lsr #2
    cb60:	8006ba4c 	andhi	fp, r6, ip, asr #20
    cb64:	e92d4030 	push	{r4, r5, lr}
    cb68:	e59f503c 	ldr	r5, [pc, #60]	; 0xcbac
    cb6c:	e5953004 	ldr	r3, [r5, #4]
    cb70:	e1a0e00f 	mov	lr, pc
    cb74:	e12fff13 	bx	r3
    cb78:	e1b04000 	movs	r4, r0
    cb7c:	0a000007 	beq	0xcba0
    cb80:	ebffff88 	bl	0xc9a8
    cb84:	e3500000 	cmp	r0, #0	; 0x0
    cb88:	1a000004 	bne	0xcba0
    cb8c:	e5953008 	ldr	r3, [r5, #8]
    cb90:	e1a00004 	mov	r0, r4
    cb94:	e1a0e00f 	mov	lr, pc
    cb98:	e12fff13 	bx	r3
    cb9c:	e3a04000 	mov	r4, #0	; 0x0
    cba0:	e1a00004 	mov	r0, r4
    cba4:	e8bd4030 	pop	{r4, r5, lr}
    cba8:	e12fff1e 	bx	lr
    cbac:	8006ba5c 	andhi	fp, r6, ip, asr sl
    cbb0:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    cbb4:	e1a04001 	mov	r4, r1
    cbb8:	e1a06000 	mov	r6, r0
    cbbc:	ebffff79 	bl	0xc9a8
    cbc0:	e3500000 	cmp	r0, #0	; 0x0
    cbc4:	0a000001 	beq	0xcbd0
    cbc8:	e3540000 	cmp	r4, #0	; 0x0
    cbcc:	1a000002 	bne	0xcbdc
    cbd0:	e3a00000 	mov	r0, #0	; 0x0
    cbd4:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    cbd8:	e12fff1e 	bx	lr
    cbdc:	e59f7074 	ldr	r7, [pc, #116]	; 0xcc58
    cbe0:	e3560000 	cmp	r6, #0	; 0x0
    cbe4:	03a00001 	moveq	r0, #1	; 0x1
    cbe8:	e5975008 	ldr	r5, [r7, #8]
    cbec:	05845000 	streq	r5, [r4]
    cbf0:	08bd40f0 	popeq	{r4, r5, r6, r7, lr}
    cbf4:	012fff1e 	bxeq	lr
    cbf8:	e5943000 	ldr	r3, [r4]
    cbfc:	e1530005 	cmp	r3, r5
    cc00:	33a00000 	movcc	r0, #0	; 0x0
    cc04:	35845000 	strcc	r5, [r4]
    cc08:	38bd40f0 	popcc	{r4, r5, r6, r7, lr}
    cc0c:	312fff1e 	bxcc	lr
    cc10:	e0652185 	rsb	r2, r5, r5, lsl #3
    cc14:	e1a02102 	lsl	r2, r2, #2
    cc18:	e2871f96 	add	r1, r7, #600	; 0x258
    cc1c:	e2860014 	add	r0, r6, #20	; 0x14
    cc20:	eb000161 	bl	bd1ac
    cc24:	e3a03030 	mov	r3, #48	; 0x30
    cc28:	e3a02000 	mov	r2, #0	; 0x0
    cc2c:	e5845000 	str	r5, [r4]
    cc30:	e5863000 	str	r3, [r6]
    cc34:	e5862004 	str	r2, [r6, #4]
    cc38:	e5973010 	ldr	r3, [r7, #16]
    cc3c:	e3a00001 	mov	r0, #1	; 0x1
    cc40:	e5863008 	str	r3, [r6, #8]
    cc44:	e1d731ba 	ldrh	r3, [r7, #26]
    cc48:	e5865010 	str	r5, [r6, #16]
    cc4c:	e586300c 	str	r3, [r6, #12]
    cc50:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    cc54:	e12fff1e 	bx	lr
    cc58:	8006ba40 	andhi	fp, r6, r0, asr #20
    cc5c:	e92d4010 	push	{r4, lr}
    cc60:	e1a04000 	mov	r4, r0
    cc64:	ebffff4f 	bl	0xc9a8
    cc68:	e3500000 	cmp	r0, #0	; 0x0
    cc6c:	03a00001 	moveq	r0, #1	; 0x1
    cc70:	08bd4010 	popeq	{r4, lr}
    cc74:	012fff1e 	bxeq	lr
    cc78:	e59f2028 	ldr	r2, [pc, #40]	; 0xcca8
    cc7c:	e5923000 	ldr	r3, [r2]
    cc80:	e1540003 	cmp	r4, r3
    cc84:	33a00008 	movcc	r0, #8	; 0x8
    cc88:	38bd4010 	popcc	{r4, lr}
    cc8c:	312fff1e 	bxcc	lr
    cc90:	e5923028 	ldr	r3, [r2, #40]
    cc94:	e1a00004 	mov	r0, r4
    cc98:	e1a0e00f 	mov	lr, pc
    cc9c:	e12fff13 	bx	r3
    cca0:	e8bd4010 	pop	{r4, lr}
    cca4:	e12fff1e 	bx	lr
    cca8:	8006ba44 	andhi	fp, r6, r4, asr #20
    ccac:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    ccb0:	e24dd008 	sub	sp, sp, #8	; 0x8
    ccb4:	e1a07003 	mov	r7, r3
    ccb8:	e1a0a002 	mov	sl, r2
    ccbc:	e1a08001 	mov	r8, r1
    ccc0:	e1a09000 	mov	r9, r0
    ccc4:	ebffff37 	bl	0xc9a8
    ccc8:	e3500000 	cmp	r0, #0	; 0x0
    cccc:	0a000064 	beq	0xce64
    ccd0:	e3a03a72 	mov	r3, #466944	; 0x72000
    ccd4:	e243306c 	sub	r3, r3, #108	; 0x6c
    ccd8:	e1590003 	cmp	r9, r3
    ccdc:	0a000073 	beq	0xceb0
    cce0:	e3a03a72 	mov	r3, #466944	; 0x72000
    cce4:	e2433068 	sub	r3, r3, #104	; 0x68
    cce8:	e1590003 	cmp	r9, r3
    ccec:	0a000069 	beq	0xce98
    ccf0:	e3a03a72 	mov	r3, #466944	; 0x72000
    ccf4:	e2433064 	sub	r3, r3, #100	; 0x64
    ccf8:	e1590003 	cmp	r9, r3
    ccfc:	0a000043 	beq	0xce10
    cd00:	e3a03a72 	mov	r3, #466944	; 0x72000
    cd04:	e2433058 	sub	r3, r3, #88	; 0x58
    cd08:	e1590003 	cmp	r9, r3
    cd0c:	0a000038 	beq	0xcdf4
    cd10:	e3a03a72 	mov	r3, #466944	; 0x72000
    cd14:	e2433054 	sub	r3, r3, #84	; 0x54
    cd18:	e1590003 	cmp	r9, r3
    cd1c:	0a000022 	beq	0xcdac
    cd20:	e3a03a71 	mov	r3, #462848	; 0x71000
    cd24:	e3833efb 	orr	r3, r3, #4016	; 0xfb0
    cd28:	e1590003 	cmp	r9, r3
    cd2c:	0a00000c 	beq	0xcd64
    cd30:	e59f3198 	ldr	r3, [pc, #408]	; 0xced0
    cd34:	e59d502c 	ldr	r5, [sp, #44]
    cd38:	e59d6028 	ldr	r6, [sp, #40]
    cd3c:	e5934050 	ldr	r4, [r3, #80]
    cd40:	e1a03007 	mov	r3, r7
    cd44:	e1a0200a 	mov	r2, sl
    cd48:	e1a01008 	mov	r1, r8
    cd4c:	e1a00009 	mov	r0, r9
    cd50:	e58d5004 	str	r5, [sp, #4]
    cd54:	e58d6000 	str	r6, [sp]
    cd58:	e1a0e00f 	mov	lr, pc
    cd5c:	e12fff14 	bx	r4
    cd60:	ea000040 	b	0xce68
    cd64:	e3570000 	cmp	r7, #0	; 0x0
    cd68:	0a00003d 	beq	0xce64
    cd6c:	e59d3028 	ldr	r3, [sp, #40]
    cd70:	e3530014 	cmp	r3, #20	; 0x14
    cd74:	3a00003a 	bcc	0xce64
    cd78:	e59f3150 	ldr	r3, [pc, #336]	; 0xced0
    cd7c:	e59d102c 	ldr	r1, [sp, #44]
    cd80:	e3a00000 	mov	r0, #0	; 0x0
    cd84:	e5932008 	ldr	r2, [r3, #8]
    cd88:	e5933000 	ldr	r3, [r3]
    cd8c:	e3510000 	cmp	r1, #0	; 0x0
    cd90:	e5870004 	str	r0, [r7, #4]
    cd94:	e287c008 	add	ip, r7, #8	; 0x8
    cd98:	e88c000d 	stm	ip, {r0, r2, r3}
    cd9c:	13a03014 	movne	r3, #20	; 0x14
    cda0:	15813000 	strne	r3, [r1]
    cda4:	e3a00001 	mov	r0, #1	; 0x1
    cda8:	ea00002e 	b	0xce68
    cdac:	e3570000 	cmp	r7, #0	; 0x0
    cdb0:	0a00002b 	beq	0xce64
    cdb4:	e59d3028 	ldr	r3, [sp, #40]
    cdb8:	e3530004 	cmp	r3, #4	; 0x4
    cdbc:	3a000028 	bcc	0xce64
    cdc0:	e59f3108 	ldr	r3, [pc, #264]	; 0xced0
    cdc4:	e59d002c 	ldr	r0, [sp, #44]
    cdc8:	e1d311ba 	ldrh	r1, [r3, #26]
    cdcc:	e1d321b8 	ldrh	r2, [r3, #24]
    cdd0:	e3500000 	cmp	r0, #0	; 0x0
    cdd4:	e2813008 	add	r3, r1, #8	; 0x8
    cdd8:	e0020293 	mul	r2, r3, r2
    cddc:	e5872000 	str	r2, [r7]
    cde0:	0affffef 	beq	0xcda4
    cde4:	e3a03004 	mov	r3, #4	; 0x4
    cde8:	e5803000 	str	r3, [r0]
    cdec:	e3a00001 	mov	r0, #1	; 0x1
    cdf0:	ea00001c 	b	0xce68
    cdf4:	e3580000 	cmp	r8, #0	; 0x0
    cdf8:	0a000019 	beq	0xce64
    cdfc:	e35a0010 	cmp	sl, #16	; 0x10
    ce00:	3a000017 	bcc	0xce64
    ce04:	e1a00008 	mov	r0, r8
    ce08:	ebfffefe 	bl	0xca08
    ce0c:	ea000015 	b	0xce68
    ce10:	e3570000 	cmp	r7, #0	; 0x0
    ce14:	1a000008 	bne	0xce3c
    ce18:	e59d202c 	ldr	r2, [sp, #44]
    ce1c:	e3520000 	cmp	r2, #0	; 0x0
    ce20:	0affffdf 	beq	0xcda4
    ce24:	e59f30a4 	ldr	r3, [pc, #164]	; 0xced0
    ce28:	e3a00001 	mov	r0, #1	; 0x1
    ce2c:	e5933000 	ldr	r3, [r3]
    ce30:	e1a03203 	lsl	r3, r3, #4
    ce34:	e5823000 	str	r3, [r2]
    ce38:	ea00000a 	b	0xce68
    ce3c:	e59f108c 	ldr	r1, [pc, #140]	; 0xced0
    ce40:	e59d2028 	ldr	r2, [sp, #40]
    ce44:	e5913000 	ldr	r3, [r1]
    ce48:	e1a03203 	lsl	r3, r3, #4
    ce4c:	e1520003 	cmp	r2, r3
    ce50:	2a000007 	bcs	0xce74
    ce54:	e59d302c 	ldr	r3, [sp, #44]
    ce58:	e3530000 	cmp	r3, #0	; 0x0
    ce5c:	13a02000 	movne	r2, #0	; 0x0
    ce60:	15832000 	strne	r2, [r3]
    ce64:	e3a00000 	mov	r0, #0	; 0x0
    ce68:	e28dd008 	add	sp, sp, #8	; 0x8
    ce6c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    ce70:	e12fff1e 	bx	lr
    ce74:	e59d202c 	ldr	r2, [sp, #44]
    ce78:	e2811f56 	add	r1, r1, #344	; 0x158
    ce7c:	e1a00007 	mov	r0, r7
    ce80:	e3520000 	cmp	r2, #0	; 0x0
    ce84:	15823000 	strne	r3, [r2]
    ce88:	e1a02003 	mov	r2, r3
    ce8c:	eb0000c6 	bl	bd1ac
    ce90:	e3a00001 	mov	r0, #1	; 0x1
    ce94:	eafffff3 	b	0xce68
    ce98:	e3580000 	cmp	r8, #0	; 0x0
    ce9c:	0afffff0 	beq	0xce64
    cea0:	e35a0014 	cmp	sl, #20	; 0x14
    cea4:	3affffee 	bcc	0xce64
    cea8:	e3a01000 	mov	r1, #0	; 0x0
    ceac:	ea000004 	b	0xcec4
    ceb0:	e3580000 	cmp	r8, #0	; 0x0
    ceb4:	0affffea 	beq	0xce64
    ceb8:	e35a0014 	cmp	sl, #20	; 0x14
    cebc:	3affffe8 	bcc	0xce64
    cec0:	e3a01001 	mov	r1, #1	; 0x1
    cec4:	e1a00008 	mov	r0, r8
    cec8:	ebfffdd5 	bl	0xc624
    cecc:	eaffffe5 	b	0xce68
    ced0:	8006ba40 	andhi	fp, r6, r0, asr #20
    ced4:	e92d4030 	push	{r4, r5, lr}
    ced8:	e1a05000 	mov	r5, r0
    cedc:	e5953000 	ldr	r3, [r5]
    cee0:	e3530038 	cmp	r3, #56	; 0x38
    cee4:	13a04000 	movne	r4, #0	; 0x0
    cee8:	1a00000c 	bne	0xcf20
    ceec:	e59f4048 	ldr	r4, [pc, #72]	; 0xcf3c
    cef0:	e3a02038 	mov	r2, #56	; 0x38
    cef4:	e1a01005 	mov	r1, r5
    cef8:	e1a00004 	mov	r0, r4
    cefc:	eb0000aa 	bl	bd1ac
    cf00:	e59fe030 	ldr	lr, [pc, #48]	; 0xcf38
    cf04:	e59f3028 	ldr	r3, [pc, #40]	; 0xcf34
    cf08:	e59f2020 	ldr	r2, [pc, #32]	; 0xcf30
    cf0c:	e59f1018 	ldr	r1, [pc, #24]	; 0xcf2c
    cf10:	e585e034 	str	lr, [r5, #52]
    cf14:	e5853004 	str	r3, [r5, #4]
    cf18:	e5852030 	str	r2, [r5, #48]
    cf1c:	e5851010 	str	r1, [r5, #16]
    cf20:	e1a00004 	mov	r0, r4
    cf24:	e8bd4030 	pop	{r4, r5, lr}
    cf28:	e12fff1e 	bx	lr

    cf2c:	80029c5c 	andhi	r9, r2, ip, asr ip
    cf30:	80029bb0 	strhhi	r9, [r2], -r0
    cf34:	80029b64 	andhi	r9, r2, r4, ror #22
    cf38:	80029cac 	andhi	r9, r2, ip, lsr #25
    cf3c:	8006ba5c 	andhi	fp, r6, ip, asr sl
*/
bcf40:			 	bx	lr

/* Calling arguments ---
						mov	r1, #0	
						orr	r0, r0, #0x20000
						mov	r2, #0x96000
*/
bcf44:					subs	r2, r2, #4
						mov	r3, r0
						blt	bcf94
						and	r1, r1, #0xff
						orr	r1, r1, r1, lsl #8
						ands	ip, r3, #3
						bne	bcfb0
bcf60:					orr	r1, r1, r1, lsl #16
						subs	r2, r2, #12
						mov	ip, r1
						blt	bcf80
bcf70:			 		stmia	r3!, {r1, ip}
						subs	r2, r2, #16
						stmia	r3!, {r1, ip}
						bge	bcf70
bcf80: 					adds	r2, r2, #8
						stmiage	r3!, {r1, ip}	@ WARNING !!!!
						subge	r2, r2, #8
						adds	r2, r2, #4
						strge	r1, [r3], #4
bcf94:					addslt	r2, r2, #4		@ WARNING !!!!
						beq	bcfac
						strb	r1, [r3], #1
						cmp	r2, #2
						strbge	r1, [r3], #1	@ WARNING !!!!
						strbgt	r1, [r3], #1	@ WARNING !!!!
bcfac: 					bx	lr

bcfb0:					tst	r3, #1
						subne	r2, r2, #1
						strbne	r1, [r3], #1
						tst	r3, #2
						subne	r2, r2, #2
						strhne	r1, [r3], #2
						b	bcf60

/*
bcfcc:	 				ands	r3, r0, #0x80000000
						rsbmi	r0, r0, #0	
						eors	ip, r3, r1, asr #32
						rsbcs	r1, r1, #0	
						movs	r2, r0
						beq	bd0a8
bcfe4:	 				cmp	r2, r1, lsr #8
						lslls	r2, r2, #8
						bcc	bcfe4
						cmp	r2, r1, lsr #1
						bhi	bd080
						cmp	r2, r1, lsr #2
						bhi	bd078
						cmp	r2, r1, lsr #3
						bhi	bd06c
						cmp	r2, r1, lsr #4
						bhi	bd060
						cmp	r2, r1, lsr #5
						bhi	bd054
						cmp	r2, r1, lsr #6
						bhi	bd048
						cmp	r2, r1, lsr #7
						bhi	bd03c
bd028:		 			lsrhi	r2, r2, #8
						cmp	r1, r2, lsl #7
						adc	r3, r3, r3
						subcs	r1, r1, r2, lsl #7
						cmp	r1, r2, lsl #6
bd03c:			 		adc	r3, r3, r3
						subcs	r1, r1, r2, lsl #6
						cmp	r1, r2, lsl #5
bd048:				 	adc	r3, r3, r3
						subcs	r1, r1, r2, lsl #5
						cmp	r1, r2, lsl #4
bd054:				 	adc	r3, r3, r3
						subcs	r1, r1, r2, lsl #4
						cmp	r1, r2, lsl #3
bd060:	 				adc	r3, r3, r3
						subcs	r1, r1, r2, lsl #3
						cmp	r1, r2, lsl #2
bd06c:	 				adc	r3, r3, r3
						subcs	r1, r1, r2, lsl #2
						cmp	r1, r2, lsl #1
bd078:	 				adc	r3, r3, r3
						subcs	r1, r1, r2, lsl #1
bd080:				 	cmp	r1, r2
						adc	r3, r3, r3
						subcs	r1, r1, r2
						cmp	r2, r0
						bne	bd028
						mov	r0, r3
						lsls	ip, ip, #1
						rsbcs	r0, r0, #0	
						rsbmi	r1, r1, #0	
						bx	lr

bd0a8:	 				ldr	ip, .xd0c0
						ldr	r0, .xd0c4
						mov	r1, #0	
						mov	r2, #0	
						mov	r3, #0	
						mov	pc, ip

.xd0c0:	.word 0x8002afd8 	
.xd0c4:	.word 0xc0000094 	

*/

/*
    d0c8:	e3a03000 	mov	r3, #0	; 0x0
    d0cc:	e1b02000 	movs	r2, r0
    d0d0:	0a00002d 	beq	0xd18c
    d0d4:	e1520421 	cmp	r2, r1, lsr #8
    d0d8:	91a02402 	lslls	r2, r2, #8
    d0dc:	3afffffc 	bcc	0xd0d4
    d0e0:	e15200a1 	cmp	r2, r1, lsr #1
    d0e4:	8a000021 	bhi	0xd170
    d0e8:	e1520121 	cmp	r2, r1, lsr #2
    d0ec:	8a00001d 	bhi	0xd168
    d0f0:	e15201a1 	cmp	r2, r1, lsr #3
    d0f4:	8a000018 	bhi	0xd15c
    d0f8:	e1520221 	cmp	r2, r1, lsr #4
    d0fc:	8a000013 	bhi	0xd150
    d100:	e15202a1 	cmp	r2, r1, lsr #5
    d104:	8a00000e 	bhi	0xd144
    d108:	e1520321 	cmp	r2, r1, lsr #6
    d10c:	8a000009 	bhi	0xd138
    d110:	e15203a1 	cmp	r2, r1, lsr #7
    d114:	8a000004 	bhi	0xd12c
    d118:	81a02422 	lsrhi	r2, r2, #8
    d11c:	e1510382 	cmp	r1, r2, lsl #7
    d120:	e0a33003 	adc	r3, r3, r3
    d124:	20411382 	subcs	r1, r1, r2, lsl #7
    d128:	e1510302 	cmp	r1, r2, lsl #6
    d12c:	e0a33003 	adc	r3, r3, r3
    d130:	20411302 	subcs	r1, r1, r2, lsl #6
    d134:	e1510282 	cmp	r1, r2, lsl #5
    d138:	e0a33003 	adc	r3, r3, r3
    d13c:	20411282 	subcs	r1, r1, r2, lsl #5
    d140:	e1510202 	cmp	r1, r2, lsl #4
    d144:	e0a33003 	adc	r3, r3, r3
    d148:	20411202 	subcs	r1, r1, r2, lsl #4
    d14c:	e1510182 	cmp	r1, r2, lsl #3
    d150:	e0a33003 	adc	r3, r3, r3
    d154:	20411182 	subcs	r1, r1, r2, lsl #3
    d158:	e1510102 	cmp	r1, r2, lsl #2
    d15c:	e0a33003 	adc	r3, r3, r3
    d160:	20411102 	subcs	r1, r1, r2, lsl #2
    d164:	e1510082 	cmp	r1, r2, lsl #1
    d168:	e0a33003 	adc	r3, r3, r3
    d16c:	20411082 	subcs	r1, r1, r2, lsl #1
    d170:	e1510002 	cmp	r1, r2
    d174:	e0a33003 	adc	r3, r3, r3
    d178:	20411002 	subcs	r1, r1, r2
    d17c:	e1520000 	cmp	r2, r0
    d180:	1affffe4 	bne	0xd118
    d184:	e1a00003 	mov	r0, r3
    d188:	e12fff1e 	bx	lr
    d18c:	e59fc010 	ldr	ip, [pc, #16]	; 0xd1a4
    d190:	e59f0010 	ldr	r0, [pc, #16]	; 0xd1a8
    d194:	e3a01000 	mov	r1, #0	; 0x0
    d198:	e3a02000 	mov	r2, #0	; 0x0
    d19c:	e3a03000 	mov	r3, #0	; 0x0
    d1a0:	e1a0f00c 	mov	pc, ip
    d1a4:	8002afd8 	ldrdhi	sl, [r2], -r8
    d1a8:	c0000094 	mulgt	r0, r4, r0
*/
bd1ac:				 	push	{r0, r4, r5, lr}
/*
    d1b0:	e1803001 	orr	r3, r0, r1
    d1b4:	e3130003 	tst	r3, #3	; 0x3
    d1b8:	03a03c02 	moveq	r3, #512	; 0x200
    d1bc:	13a03080 	movne	r3, #128	; 0x80
    d1c0:	e1520003 	cmp	r2, r3
    d1c4:	8a0000e2 	bhi	0xd554
    d1c8:	e3520008 	cmp	r2, #8	; 0x8
    d1cc:	ba0000c8 	blt	0xd4f4
    d1d0:	e2103003 	ands	r3, r0, #3	; 0x3
    d1d4:	0a000008 	beq	0xd1fc
    d1d8:	e2633004 	rsb	r3, r3, #4	; 0x4
    d1dc:	e4d14001 	ldrb	r4, [r1], #1
    d1e0:	e3530002 	cmp	r3, #2	; 0x2
    d1e4:	e4c04001 	strb	r4, [r0], #1
    d1e8:	a4d15001 	ldrbge	r5, [r1], #1
    d1ec:	c4d14001 	ldrbgt	r4, [r1], #1
    d1f0:	e0422003 	sub	r2, r2, r3
    d1f4:	a4c05001 	strbge	r5, [r0], #1
    d1f8:	c4c04001 	strbgt	r4, [r0], #1
    d1fc:	e3110001 	tst	r1, #1	; 0x1
    d200:	1a000051 	bne	0xd34c
    d204:	e3110002 	tst	r1, #2	; 0x2
    d208:	1a00001d 	bne	0xd284
    d20c:	e2522020 	subs	r2, r2, #32	; 0x20
    d210:	ba000005 	blt	0xd22c
    d214:	e8b14038 	ldm	r1!, {r3, r4, r5, lr}
    d218:	e8a04038 	stmia	r0!, {r3, r4, r5, lr}
    d21c:	e8b14038 	ldm	r1!, {r3, r4, r5, lr}
    d220:	e2522020 	subs	r2, r2, #32	; 0x20
    d224:	e8a04038 	stmia	r0!, {r3, r4, r5, lr}
    d228:	aafffff9 	bge	0xd214
    d22c:	e2922010 	adds	r2, r2, #16	; 0x10
    d230:	a8b14038 	ldmge	r1!, {r3, r4, r5, lr}
    d234:	a8a04038 	stmiage	r0!, {r3, r4, r5, lr}
    d238:	0a00000f 	beq	0xd27c
    d23c:	c2522010 	subsgt	r2, r2, #16	; 0x10
    d240:	e2922008 	adds	r2, r2, #8	; 0x8
    d244:	a8b10018 	ldmge	r1!, {r3, r4}
    d248:	a2422008 	subge	r2, r2, #8	; 0x8
    d24c:	a8a00018 	stmiage	r0!, {r3, r4}
    d250:	e2922004 	adds	r2, r2, #4	; 0x4
    d254:	a4913004 	ldrge	r3, [r1], #4
    d258:	a4803004 	strge	r3, [r0], #4
    d25c:	b2922004 	addslt	r2, r2, #4	; 0x4
    d260:	0a000005 	beq	0xd27c
    d264:	e4913004 	ldr	r3, [r1], #4
    d268:	e3520002 	cmp	r2, #2	; 0x2
    d26c:	a0c030b2 	strhge	r3, [r0], #2
    d270:	b4c03001 	strblt	r3, [r0], #1
    d274:	c1a03823 	lsrgt	r3, r3, #16
    d278:	c4c03001 	strbgt	r3, [r0], #1
    d27c:	e8bd4031 	pop	{r0, r4, r5, lr}
    d280:	e12fff1e 	bx	lr
    d284:	e0d130b2 	ldrh	r3, [r1], #2
    d288:	e2522020 	subs	r2, r2, #32	; 0x20
    d28c:	ba000015 	blt	0xd2e8
    d290:	e8b15030 	ldm	r1!, {r4, r5, ip, lr}
    d294:	e1833804 	orr	r3, r3, r4, lsl #16
    d298:	e1a04824 	lsr	r4, r4, #16
    d29c:	e1844805 	orr	r4, r4, r5, lsl #16
    d2a0:	e1a05825 	lsr	r5, r5, #16
    d2a4:	e185580c 	orr	r5, r5, ip, lsl #16
    d2a8:	e1a0c82c 	lsr	ip, ip, #16
    d2ac:	e18cc80e 	orr	ip, ip, lr, lsl #16
    d2b0:	e8a01038 	stmia	r0!, {r3, r4, r5, ip}
    d2b4:	e1a0382e 	lsr	r3, lr, #16
    d2b8:	e8b15030 	ldm	r1!, {r4, r5, ip, lr}
    d2bc:	e1833804 	orr	r3, r3, r4, lsl #16
    d2c0:	e1a04824 	lsr	r4, r4, #16
    d2c4:	e1844805 	orr	r4, r4, r5, lsl #16
    d2c8:	e1a05825 	lsr	r5, r5, #16
    d2cc:	e185580c 	orr	r5, r5, ip, lsl #16
    d2d0:	e1a0c82c 	lsr	ip, ip, #16
    d2d4:	e18cc80e 	orr	ip, ip, lr, lsl #16
    d2d8:	e8a01038 	stmia	r0!, {r3, r4, r5, ip}
    d2dc:	e2522020 	subs	r2, r2, #32	; 0x20
    d2e0:	e1a0382e 	lsr	r3, lr, #16
    d2e4:	aaffffe9 	bge	0xd290
    d2e8:	e2922018 	adds	r2, r2, #24	; 0x18
    d2ec:	ba000007 	blt	0xd310
    d2f0:	e8b10030 	ldm	r1!, {r4, r5}
    d2f4:	e1833804 	orr	r3, r3, r4, lsl #16
    d2f8:	e1a04824 	lsr	r4, r4, #16
    d2fc:	e1844805 	orr	r4, r4, r5, lsl #16
    d300:	e8a00018 	stmia	r0!, {r3, r4}
    d304:	e2522008 	subs	r2, r2, #8	; 0x8
    d308:	e1a03825 	lsr	r3, r5, #16
    d30c:	aafffff7 	bge	0xd2f0
    d310:	e2922004 	adds	r2, r2, #4	; 0x4
    d314:	ba000003 	blt	0xd328
    d318:	e4914004 	ldr	r4, [r1], #4
    d31c:	e1833804 	orr	r3, r3, r4, lsl #16
    d320:	e4803004 	str	r3, [r0], #4
    d324:	e1a03824 	lsr	r3, r4, #16
    d328:	b2922004 	addslt	r2, r2, #4	; 0x4
    d32c:	0a000004 	beq	0xd344
    d330:	e3520002 	cmp	r2, #2	; 0x2
    d334:	b4c03001 	strblt	r3, [r0], #1
    d338:	c4d14001 	ldrbgt	r4, [r1], #1
    d33c:	a0c030b2 	strhge	r3, [r0], #2
    d340:	c4c04001 	strbgt	r4, [r0], #1
    d344:	e8bd4031 	pop	{r0, r4, r5, lr}
    d348:	e12fff1e 	bx	lr
    d34c:	e3110002 	tst	r1, #2	; 0x2
    d350:	0a000032 	beq	0xd420
    d354:	e4d13001 	ldrb	r3, [r1], #1
    d358:	e2522020 	subs	r2, r2, #32	; 0x20
    d35c:	ba000015 	blt	0xd3b8
    d360:	e8b15030 	ldm	r1!, {r4, r5, ip, lr}
    d364:	e1833404 	orr	r3, r3, r4, lsl #8
    d368:	e1a04c24 	lsr	r4, r4, #24
    d36c:	e1844405 	orr	r4, r4, r5, lsl #8
    d370:	e1a05c25 	lsr	r5, r5, #24
    d374:	e185540c 	orr	r5, r5, ip, lsl #8
    d378:	e1a0cc2c 	lsr	ip, ip, #24
    d37c:	e18cc40e 	orr	ip, ip, lr, lsl #8
    d380:	e8a01038 	stmia	r0!, {r3, r4, r5, ip}
    d384:	e1a03c2e 	lsr	r3, lr, #24
    d388:	e8b15030 	ldm	r1!, {r4, r5, ip, lr}
    d38c:	e1833404 	orr	r3, r3, r4, lsl #8
    d390:	e1a04c24 	lsr	r4, r4, #24
    d394:	e1844405 	orr	r4, r4, r5, lsl #8
    d398:	e1a05c25 	lsr	r5, r5, #24
    d39c:	e185540c 	orr	r5, r5, ip, lsl #8
    d3a0:	e1a0cc2c 	lsr	ip, ip, #24
    d3a4:	e18cc40e 	orr	ip, ip, lr, lsl #8
    d3a8:	e8a01038 	stmia	r0!, {r3, r4, r5, ip}
    d3ac:	e2522020 	subs	r2, r2, #32	; 0x20
    d3b0:	e1a03c2e 	lsr	r3, lr, #24
    d3b4:	aaffffe9 	bge	0xd360
    d3b8:	e2922018 	adds	r2, r2, #24	; 0x18
    d3bc:	ba000007 	blt	0xd3e0
    d3c0:	e8b10030 	ldm	r1!, {r4, r5}
    d3c4:	e1833404 	orr	r3, r3, r4, lsl #8
    d3c8:	e1a04c24 	lsr	r4, r4, #24
    d3cc:	e1844405 	orr	r4, r4, r5, lsl #8
    d3d0:	e8a00018 	stmia	r0!, {r3, r4}
    d3d4:	e2522008 	subs	r2, r2, #8	; 0x8
    d3d8:	e1a03c25 	lsr	r3, r5, #24
    d3dc:	aafffff7 	bge	0xd3c0
    d3e0:	e2922004 	adds	r2, r2, #4	; 0x4
    d3e4:	ba000003 	blt	0xd3f8
    d3e8:	e4914004 	ldr	r4, [r1], #4
    d3ec:	e1833404 	orr	r3, r3, r4, lsl #8
    d3f0:	e4803004 	str	r3, [r0], #4
    d3f4:	e1a03c24 	lsr	r3, r4, #24
    d3f8:	b2922004 	addslt	r2, r2, #4	; 0x4
    d3fc:	0a000005 	beq	0xd418
    d400:	e3520002 	cmp	r2, #2	; 0x2
    d404:	a0d140b2 	ldrhge	r4, [r1], #2
    d408:	e4c03001 	strb	r3, [r0], #1
    d40c:	a4c04001 	strbge	r4, [r0], #1
    d410:	c1a04424 	lsrgt	r4, r4, #8
    d414:	c4c04001 	strbgt	r4, [r0], #1
    d418:	e8bd4031 	pop	{r0, r4, r5, lr}
    d41c:	e12fff1e 	bx	lr
    d420:	e4d13001 	ldrb	r3, [r1], #1
    d424:	e0d140b2 	ldrh	r4, [r1], #2
    d428:	e2522020 	subs	r2, r2, #32	; 0x20
    d42c:	e1833404 	orr	r3, r3, r4, lsl #8
    d430:	ba000015 	blt	0xd48c
    d434:	e8b15030 	ldm	r1!, {r4, r5, ip, lr}
    d438:	e1833c04 	orr	r3, r3, r4, lsl #24
    d43c:	e1a04424 	lsr	r4, r4, #8
    d440:	e1844c05 	orr	r4, r4, r5, lsl #24
    d444:	e1a05425 	lsr	r5, r5, #8
    d448:	e1855c0c 	orr	r5, r5, ip, lsl #24
    d44c:	e1a0c42c 	lsr	ip, ip, #8
    d450:	e18ccc0e 	orr	ip, ip, lr, lsl #24
    d454:	e8a01038 	stmia	r0!, {r3, r4, r5, ip}
    d458:	e1a0342e 	lsr	r3, lr, #8
    d45c:	e8b15030 	ldm	r1!, {r4, r5, ip, lr}
    d460:	e1833c04 	orr	r3, r3, r4, lsl #24
    d464:	e1a04424 	lsr	r4, r4, #8
    d468:	e1844c05 	orr	r4, r4, r5, lsl #24
    d46c:	e1a05425 	lsr	r5, r5, #8
    d470:	e1855c0c 	orr	r5, r5, ip, lsl #24
    d474:	e1a0c42c 	lsr	ip, ip, #8
    d478:	e18ccc0e 	orr	ip, ip, lr, lsl #24
    d47c:	e8a01038 	stmia	r0!, {r3, r4, r5, ip}
    d480:	e2522020 	subs	r2, r2, #32	; 0x20
    d484:	e1a0342e 	lsr	r3, lr, #8
    d488:	aaffffe9 	bge	0xd434
    d48c:	e2922018 	adds	r2, r2, #24	; 0x18
    d490:	ba000007 	blt	0xd4b4
    d494:	e8b10030 	ldm	r1!, {r4, r5}
    d498:	e1833c04 	orr	r3, r3, r4, lsl #24
    d49c:	e1a04424 	lsr	r4, r4, #8
    d4a0:	e1844c05 	orr	r4, r4, r5, lsl #24
    d4a4:	e8a00018 	stmia	r0!, {r3, r4}
    d4a8:	e2522008 	subs	r2, r2, #8	; 0x8
    d4ac:	e1a03425 	lsr	r3, r5, #8
    d4b0:	aafffff7 	bge	0xd494
    d4b4:	e2922004 	adds	r2, r2, #4	; 0x4
    d4b8:	ba000004 	blt	0xd4d0
    d4bc:	e4914004 	ldr	r4, [r1], #4
    d4c0:	e1833c04 	orr	r3, r3, r4, lsl #24
    d4c4:	e4803004 	str	r3, [r0], #4
    d4c8:	0a000007 	beq	0xd4ec
    d4cc:	e1a03424 	lsr	r3, r4, #8
    d4d0:	b2922004 	addslt	r2, r2, #4	; 0x4
    d4d4:	0a000004 	beq	0xd4ec
    d4d8:	e3520002 	cmp	r2, #2	; 0x2
    d4dc:	b4c03001 	strblt	r3, [r0], #1
    d4e0:	a0c030b2 	strhge	r3, [r0], #2
    d4e4:	c1a03823 	lsrgt	r3, r3, #16
    d4e8:	c4c03001 	strbgt	r3, [r0], #1
    d4ec:	e8bd4031 	pop	{r0, r4, r5, lr}
    d4f0:	e12fff1e 	bx	lr
    d4f4:	e3520004 	cmp	r2, #4	; 0x4
    d4f8:	ba000008 	blt	0xd520
    d4fc:	e4d13001 	ldrb	r3, [r1], #1
    d500:	e2422004 	sub	r2, r2, #4	; 0x4
    d504:	e4d14001 	ldrb	r4, [r1], #1
    d508:	e4d15001 	ldrb	r5, [r1], #1
    d50c:	e4d1e001 	ldrb	lr, [r1], #1
    d510:	e4c03001 	strb	r3, [r0], #1
    d514:	e4c04001 	strb	r4, [r0], #1
    d518:	e4c05001 	strb	r5, [r0], #1
    d51c:	e4c0e001 	strb	lr, [r0], #1
    d520:	e3520000 	cmp	r2, #0	; 0x0
    d524:	08bd4031 	popeq	{r0, r4, r5, lr}
    d528:	012fff1e 	bxeq	lr
    d52c:	e4d13001 	ldrb	r3, [r1], #1
    d530:	e3520002 	cmp	r2, #2	; 0x2
    d534:	e4c03001 	strb	r3, [r0], #1
    d538:	ba000003 	blt	0xd54c
    d53c:	a4d14001 	ldrbge	r4, [r1], #1
    d540:	c4d15001 	ldrbgt	r5, [r1], #1
    d544:	a4c04001 	strbge	r4, [r0], #1
    d548:	c4c05001 	strbgt	r5, [r0], #1
    d54c:	e8bd4031 	pop	{r0, r4, r5, lr}
    d550:	e12fff1e 	bx	lr
    d554:	e28dd010 	add	sp, sp, #16	; 0x10
    d558:	e92d4ff1 	push	{r0, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d55c:	e1a05001 	mov	r5, r1
    d560:	e3c55003 	bic	r5, r5, #3	; 0x3
    d564:	f5d5f000 	pld	[r5]
    d568:	f5d5f020 	pld	[r5, #32]
    d56c:	f5d5f040 	pld	[r5, #64]
    d570:	e3520004 	cmp	r2, #4	; 0x4
    d574:	9a000255 	bls	0xded0
    d578:	e2604000 	rsb	r4, r0, #0	; 0x0
    d57c:	e2144002 	ands	r4, r4, #2	; 0x2
    d580:	14d15001 	ldrbne	r5, [r1], #1
    d584:	14d16001 	ldrbne	r6, [r1], #1
    d588:	12422002 	subne	r2, r2, #2	; 0x2
    d58c:	14c05001 	strbne	r5, [r0], #1
    d590:	14c06001 	strbne	r6, [r0], #1
    d594:	e2104001 	ands	r4, r0, #1	; 0x1
    d598:	14d15001 	ldrbne	r5, [r1], #1
    d59c:	12422001 	subne	r2, r2, #1	; 0x1
    d5a0:	14c05001 	strbne	r5, [r0], #1
    d5a4:	e2013003 	and	r3, r1, #3	; 0x3
    d5a8:	e3530003 	cmp	r3, #3	; 0x3
    d5ac:	0a0001ad 	beq	0xdc68
    d5b0:	e3530002 	cmp	r3, #2	; 0x2
    d5b4:	0a000102 	beq	0xd9c4
    d5b8:	e3530001 	cmp	r3, #1	; 0x1
    d5bc:	0a000057 	beq	0xd720
    d5c0:	e200401c 	and	r4, r0, #28	; 0x1c
    d5c4:	e2644020 	rsb	r4, r4, #32	; 0x20
    d5c8:	e202501c 	and	r5, r2, #28	; 0x1c
    d5cc:	e1540002 	cmp	r4, r2
    d5d0:	81a04005 	movhi	r4, r5
    d5d4:	e3540000 	cmp	r4, #0	; 0x0
    d5d8:	0a000016 	beq	0xd638
    d5dc:	e2643020 	rsb	r3, r4, #32	; 0x20
    d5e0:	e203301c 	and	r3, r3, #28	; 0x1c
    d5e4:	e0422004 	sub	r2, r2, r4
    d5e8:	e28fc000 	add	ip, pc, #0	; 0x0
    d5ec:	e08cf003 	add	pc, ip, r3
    d5f0:	e4914004 	ldr	r4, [r1], #4
    d5f4:	e4915004 	ldr	r5, [r1], #4
    d5f8:	e4916004 	ldr	r6, [r1], #4
    d5fc:	e4917004 	ldr	r7, [r1], #4
    d600:	e4918004 	ldr	r8, [r1], #4
    d604:	e4919004 	ldr	r9, [r1], #4
    d608:	e491a004 	ldr	sl, [r1], #4
    d60c:	e491b004 	ldr	fp, [r1], #4
    d610:	e28fc000 	add	ip, pc, #0	; 0x0
    d614:	e08cf003 	add	pc, ip, r3
    d618:	e4804004 	str	r4, [r0], #4
    d61c:	e4805004 	str	r5, [r0], #4
    d620:	e4806004 	str	r6, [r0], #4
    d624:	e4807004 	str	r7, [r0], #4
    d628:	e4808004 	str	r8, [r0], #4
    d62c:	e4809004 	str	r9, [r0], #4
    d630:	e480a004 	str	sl, [r0], #4
    d634:	e480b004 	str	fp, [r0], #4
    d638:	e3520080 	cmp	r2, #128	; 0x80
    d63c:	4a000007 	bmi	0xd660
    d640:	f5d1f060 	pld	[r1, #96]
    d644:	f5d1f080 	pld	[r1, #128]
    d648:	e8b10ff0 	ldm	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d64c:	e8a00ff0 	stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d650:	e8b10ff0 	ldm	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d654:	e8a00ff0 	stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d658:	e2422040 	sub	r2, r2, #64	; 0x40
    d65c:	eafffff5 	b	0xd638
    d660:	e3520080 	cmp	r2, #128	; 0x80
    d664:	9a000000 	bls	0xd66c
    d668:	f5d1f080 	pld	[r1, #128]
    d66c:	e3520020 	cmp	r2, #32	; 0x20
    d670:	4a000003 	bmi	0xd684
    d674:	e8b10ff0 	ldm	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d678:	e8a00ff0 	stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d67c:	e2422020 	sub	r2, r2, #32	; 0x20
    d680:	eafffff9 	b	0xd66c
    d684:	e212301c 	ands	r3, r2, #28	; 0x1c
    d688:	0a000210 	beq	0xded0
    d68c:	e0422003 	sub	r2, r2, r3
    d690:	e2633020 	rsb	r3, r3, #32	; 0x20
    d694:	e28fc000 	add	ip, pc, #0	; 0x0
    d698:	e08cf003 	add	pc, ip, r3
    d69c:	e4914004 	ldr	r4, [r1], #4
    d6a0:	e4915004 	ldr	r5, [r1], #4
    d6a4:	e4916004 	ldr	r6, [r1], #4
    d6a8:	e4917004 	ldr	r7, [r1], #4
    d6ac:	e4918004 	ldr	r8, [r1], #4
    d6b0:	e4919004 	ldr	r9, [r1], #4
    d6b4:	e491a004 	ldr	sl, [r1], #4
    d6b8:	e491b004 	ldr	fp, [r1], #4
    d6bc:	e28fc000 	add	ip, pc, #0	; 0x0
    d6c0:	e08cf003 	add	pc, ip, r3
    d6c4:	e4804004 	str	r4, [r0], #4
    d6c8:	e4805004 	str	r5, [r0], #4
    d6cc:	e4806004 	str	r6, [r0], #4
    d6d0:	e4807004 	str	r7, [r0], #4
    d6d4:	e4808004 	str	r8, [r0], #4
    d6d8:	e4809004 	str	r9, [r0], #4
    d6dc:	e480a004 	str	sl, [r0], #4
    d6e0:	e480b004 	str	fp, [r0], #4
    d6e4:	e2622004 	rsb	r2, r2, #4	; 0x4
    d6e8:	e28fc000 	add	ip, pc, #0	; 0x0
    d6ec:	e08cf102 	add	pc, ip, r2, lsl #2
    d6f0:	e4d13001 	ldrb	r3, [r1], #1
    d6f4:	e4d14001 	ldrb	r4, [r1], #1
    d6f8:	e4d15001 	ldrb	r5, [r1], #1
    d6fc:	e4d16001 	ldrb	r6, [r1], #1
    d700:	e28fc000 	add	ip, pc, #0	; 0x0
    d704:	e08cf102 	add	pc, ip, r2, lsl #2
    d708:	e4c03001 	strb	r3, [r0], #1
    d70c:	e4c04001 	strb	r4, [r0], #1
    d710:	e4c05001 	strb	r5, [r0], #1
    d714:	e4c06001 	strb	r6, [r0], #1
    d718:	e8bd4ff1 	pop	{r0, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d71c:	e12fff1e 	bx	lr
    d720:	e3c13003 	bic	r3, r1, #3	; 0x3
    d724:	e493e004 	ldr	lr, [r3], #4
    d728:	e1a0e42e 	lsr	lr, lr, #8
    d72c:	e200401c 	and	r4, r0, #28	; 0x1c
    d730:	e2644020 	rsb	r4, r4, #32	; 0x20
    d734:	e202501c 	and	r5, r2, #28	; 0x1c
    d738:	e1540002 	cmp	r4, r2
    d73c:	81a04005 	movhi	r4, r5
    d740:	e3540000 	cmp	r4, #0	; 0x0
    d744:	0a000024 	beq	0xd7dc
    d748:	e2646020 	rsb	r6, r4, #32	; 0x20
    d74c:	e206601c 	and	r6, r6, #28	; 0x1c
    d750:	e0422004 	sub	r2, r2, r4
    d754:	e28fc000 	add	ip, pc, #0	; 0x0
    d758:	e08cf106 	add	pc, ip, r6, lsl #2
    d75c:	e4934004 	ldr	r4, [r3], #4
    d760:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d764:	e480c004 	str	ip, [r0], #4
    d768:	e1a0e424 	lsr	lr, r4, #8
    d76c:	e4934004 	ldr	r4, [r3], #4
    d770:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d774:	e480c004 	str	ip, [r0], #4
    d778:	e1a0e424 	lsr	lr, r4, #8
    d77c:	e4934004 	ldr	r4, [r3], #4
    d780:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d784:	e480c004 	str	ip, [r0], #4
    d788:	e1a0e424 	lsr	lr, r4, #8
    d78c:	e4934004 	ldr	r4, [r3], #4
    d790:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d794:	e480c004 	str	ip, [r0], #4
    d798:	e1a0e424 	lsr	lr, r4, #8
    d79c:	e4934004 	ldr	r4, [r3], #4
    d7a0:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d7a4:	e480c004 	str	ip, [r0], #4
    d7a8:	e1a0e424 	lsr	lr, r4, #8
    d7ac:	e4934004 	ldr	r4, [r3], #4
    d7b0:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d7b4:	e480c004 	str	ip, [r0], #4
    d7b8:	e1a0e424 	lsr	lr, r4, #8
    d7bc:	e4934004 	ldr	r4, [r3], #4
    d7c0:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d7c4:	e480c004 	str	ip, [r0], #4
    d7c8:	e1a0e424 	lsr	lr, r4, #8
    d7cc:	e4934004 	ldr	r4, [r3], #4
    d7d0:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d7d4:	e480c004 	str	ip, [r0], #4
    d7d8:	e1a0e424 	lsr	lr, r4, #8
    d7dc:	e35200a0 	cmp	r2, #160	; 0xa0
    d7e0:	4a000027 	bmi	0xd884
    d7e4:	f5d3f060 	pld	[r3, #96]
    d7e8:	f5d3f080 	pld	[r3, #128]
    d7ec:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d7f0:	e18e1c04 	orr	r1, lr, r4, lsl #24
    d7f4:	e1a0e424 	lsr	lr, r4, #8
    d7f8:	e18e4c05 	orr	r4, lr, r5, lsl #24
    d7fc:	e1a0e425 	lsr	lr, r5, #8
    d800:	e18e5c06 	orr	r5, lr, r6, lsl #24
    d804:	e1a0e426 	lsr	lr, r6, #8
    d808:	e18e6c07 	orr	r6, lr, r7, lsl #24
    d80c:	e1a0e427 	lsr	lr, r7, #8
    d810:	e18e7c08 	orr	r7, lr, r8, lsl #24
    d814:	e1a0e428 	lsr	lr, r8, #8
    d818:	e18e8c09 	orr	r8, lr, r9, lsl #24
    d81c:	e1a0e429 	lsr	lr, r9, #8
    d820:	e18e9c0a 	orr	r9, lr, sl, lsl #24
    d824:	e1a0e42a 	lsr	lr, sl, #8
    d828:	e18eac0b 	orr	sl, lr, fp, lsl #24
    d82c:	e1a0e42b 	lsr	lr, fp, #8
    d830:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    d834:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d838:	e18e1c04 	orr	r1, lr, r4, lsl #24
    d83c:	e1a0e424 	lsr	lr, r4, #8
    d840:	e18e4c05 	orr	r4, lr, r5, lsl #24
    d844:	e1a0e425 	lsr	lr, r5, #8
    d848:	e18e5c06 	orr	r5, lr, r6, lsl #24
    d84c:	e1a0e426 	lsr	lr, r6, #8
    d850:	e18e6c07 	orr	r6, lr, r7, lsl #24
    d854:	e1a0e427 	lsr	lr, r7, #8
    d858:	e18e7c08 	orr	r7, lr, r8, lsl #24
    d85c:	e1a0e428 	lsr	lr, r8, #8
    d860:	e18e8c09 	orr	r8, lr, r9, lsl #24
    d864:	e1a0e429 	lsr	lr, r9, #8
    d868:	e18e9c0a 	orr	r9, lr, sl, lsl #24
    d86c:	e1a0e42a 	lsr	lr, sl, #8
    d870:	e18eac0b 	orr	sl, lr, fp, lsl #24
    d874:	e1a0e42b 	lsr	lr, fp, #8
    d878:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    d87c:	e2422040 	sub	r2, r2, #64	; 0x40
    d880:	eaffffd5 	b	0xd7dc
    d884:	e3520080 	cmp	r2, #128	; 0x80
    d888:	9a000000 	bls	0xd890
    d88c:	f5d3f080 	pld	[r3, #128]
    d890:	e3520020 	cmp	r2, #32	; 0x20
    d894:	4a000013 	bmi	0xd8e8
    d898:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    d89c:	e18e1c04 	orr	r1, lr, r4, lsl #24
    d8a0:	e1a0e424 	lsr	lr, r4, #8
    d8a4:	e18e4c05 	orr	r4, lr, r5, lsl #24
    d8a8:	e1a0e425 	lsr	lr, r5, #8
    d8ac:	e18e5c06 	orr	r5, lr, r6, lsl #24
    d8b0:	e1a0e426 	lsr	lr, r6, #8
    d8b4:	e18e6c07 	orr	r6, lr, r7, lsl #24
    d8b8:	e1a0e427 	lsr	lr, r7, #8
    d8bc:	e18e7c08 	orr	r7, lr, r8, lsl #24
    d8c0:	e1a0e428 	lsr	lr, r8, #8
    d8c4:	e18e8c09 	orr	r8, lr, r9, lsl #24
    d8c8:	e1a0e429 	lsr	lr, r9, #8
    d8cc:	e18e9c0a 	orr	r9, lr, sl, lsl #24
    d8d0:	e1a0e42a 	lsr	lr, sl, #8
    d8d4:	e18eac0b 	orr	sl, lr, fp, lsl #24
    d8d8:	e1a0e42b 	lsr	lr, fp, #8
    d8dc:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    d8e0:	e2422020 	sub	r2, r2, #32	; 0x20
    d8e4:	eaffffe9 	b	0xd890
    d8e8:	e212601c 	ands	r6, r2, #28	; 0x1c
    d8ec:	02431003 	subeq	r1, r3, #3	; 0x3
    d8f0:	0a000176 	beq	0xded0
    d8f4:	e0422006 	sub	r2, r2, r6
    d8f8:	e2666020 	rsb	r6, r6, #32	; 0x20
    d8fc:	e28fc000 	add	ip, pc, #0	; 0x0
    d900:	e08cf106 	add	pc, ip, r6, lsl #2
    d904:	e4934004 	ldr	r4, [r3], #4
    d908:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d90c:	e480c004 	str	ip, [r0], #4
    d910:	e1a0e424 	lsr	lr, r4, #8
    d914:	e4934004 	ldr	r4, [r3], #4
    d918:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d91c:	e480c004 	str	ip, [r0], #4
    d920:	e1a0e424 	lsr	lr, r4, #8
    d924:	e4934004 	ldr	r4, [r3], #4
    d928:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d92c:	e480c004 	str	ip, [r0], #4
    d930:	e1a0e424 	lsr	lr, r4, #8
    d934:	e4934004 	ldr	r4, [r3], #4
    d938:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d93c:	e480c004 	str	ip, [r0], #4
    d940:	e1a0e424 	lsr	lr, r4, #8
    d944:	e4934004 	ldr	r4, [r3], #4
    d948:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d94c:	e480c004 	str	ip, [r0], #4
    d950:	e1a0e424 	lsr	lr, r4, #8
    d954:	e4934004 	ldr	r4, [r3], #4
    d958:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d95c:	e480c004 	str	ip, [r0], #4
    d960:	e1a0e424 	lsr	lr, r4, #8
    d964:	e4934004 	ldr	r4, [r3], #4
    d968:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d96c:	e480c004 	str	ip, [r0], #4
    d970:	e1a0e424 	lsr	lr, r4, #8
    d974:	e4934004 	ldr	r4, [r3], #4
    d978:	e18ecc04 	orr	ip, lr, r4, lsl #24
    d97c:	e480c004 	str	ip, [r0], #4
    d980:	e1a0e424 	lsr	lr, r4, #8
    d984:	e2431003 	sub	r1, r3, #3	; 0x3
    d988:	e2622004 	rsb	r2, r2, #4	; 0x4
    d98c:	e28fc000 	add	ip, pc, #0	; 0x0
    d990:	e08cf102 	add	pc, ip, r2, lsl #2
    d994:	e4d13001 	ldrb	r3, [r1], #1
    d998:	e4d14001 	ldrb	r4, [r1], #1
    d99c:	e4d15001 	ldrb	r5, [r1], #1
    d9a0:	e4d16001 	ldrb	r6, [r1], #1
    d9a4:	e28fc000 	add	ip, pc, #0	; 0x0
    d9a8:	e08cf102 	add	pc, ip, r2, lsl #2
    d9ac:	e4c03001 	strb	r3, [r0], #1
    d9b0:	e4c04001 	strb	r4, [r0], #1
    d9b4:	e4c05001 	strb	r5, [r0], #1
    d9b8:	e4c06001 	strb	r6, [r0], #1
    d9bc:	e8bd4ff1 	pop	{r0, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d9c0:	e12fff1e 	bx	lr
    d9c4:	e3c13003 	bic	r3, r1, #3	; 0x3
    d9c8:	e493e004 	ldr	lr, [r3], #4
    d9cc:	e1a0e82e 	lsr	lr, lr, #16
    d9d0:	e200401c 	and	r4, r0, #28	; 0x1c
    d9d4:	e2644020 	rsb	r4, r4, #32	; 0x20
    d9d8:	e202501c 	and	r5, r2, #28	; 0x1c
    d9dc:	e1540002 	cmp	r4, r2
    d9e0:	81a04005 	movhi	r4, r5
    d9e4:	e3540000 	cmp	r4, #0	; 0x0
    d9e8:	0a000024 	beq	0xda80
    d9ec:	e2646020 	rsb	r6, r4, #32	; 0x20
    d9f0:	e206601c 	and	r6, r6, #28	; 0x1c
    d9f4:	e0422004 	sub	r2, r2, r4
    d9f8:	e28fc000 	add	ip, pc, #0	; 0x0
    d9fc:	e08cf106 	add	pc, ip, r6, lsl #2
    da00:	e4934004 	ldr	r4, [r3], #4
    da04:	e18ec804 	orr	ip, lr, r4, lsl #16
    da08:	e480c004 	str	ip, [r0], #4
    da0c:	e1a0e824 	lsr	lr, r4, #16
    da10:	e4934004 	ldr	r4, [r3], #4
    da14:	e18ec804 	orr	ip, lr, r4, lsl #16
    da18:	e480c004 	str	ip, [r0], #4
    da1c:	e1a0e824 	lsr	lr, r4, #16
    da20:	e4934004 	ldr	r4, [r3], #4
    da24:	e18ec804 	orr	ip, lr, r4, lsl #16
    da28:	e480c004 	str	ip, [r0], #4
    da2c:	e1a0e824 	lsr	lr, r4, #16
    da30:	e4934004 	ldr	r4, [r3], #4
    da34:	e18ec804 	orr	ip, lr, r4, lsl #16
    da38:	e480c004 	str	ip, [r0], #4
    da3c:	e1a0e824 	lsr	lr, r4, #16
    da40:	e4934004 	ldr	r4, [r3], #4
    da44:	e18ec804 	orr	ip, lr, r4, lsl #16
    da48:	e480c004 	str	ip, [r0], #4
    da4c:	e1a0e824 	lsr	lr, r4, #16
    da50:	e4934004 	ldr	r4, [r3], #4
    da54:	e18ec804 	orr	ip, lr, r4, lsl #16
    da58:	e480c004 	str	ip, [r0], #4
    da5c:	e1a0e824 	lsr	lr, r4, #16
    da60:	e4934004 	ldr	r4, [r3], #4
    da64:	e18ec804 	orr	ip, lr, r4, lsl #16
    da68:	e480c004 	str	ip, [r0], #4
    da6c:	e1a0e824 	lsr	lr, r4, #16
    da70:	e4934004 	ldr	r4, [r3], #4
    da74:	e18ec804 	orr	ip, lr, r4, lsl #16
    da78:	e480c004 	str	ip, [r0], #4
    da7c:	e1a0e824 	lsr	lr, r4, #16
    da80:	e35200a0 	cmp	r2, #160	; 0xa0
    da84:	4a000027 	bmi	0xdb28
    da88:	f5d3f060 	pld	[r3, #96]
    da8c:	f5d3f080 	pld	[r3, #128]
    da90:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    da94:	e18e1804 	orr	r1, lr, r4, lsl #16
    da98:	e1a0e824 	lsr	lr, r4, #16
    da9c:	e18e4805 	orr	r4, lr, r5, lsl #16
    daa0:	e1a0e825 	lsr	lr, r5, #16
    daa4:	e18e5806 	orr	r5, lr, r6, lsl #16
    daa8:	e1a0e826 	lsr	lr, r6, #16
    daac:	e18e6807 	orr	r6, lr, r7, lsl #16
    dab0:	e1a0e827 	lsr	lr, r7, #16
    dab4:	e18e7808 	orr	r7, lr, r8, lsl #16
    dab8:	e1a0e828 	lsr	lr, r8, #16
    dabc:	e18e8809 	orr	r8, lr, r9, lsl #16
    dac0:	e1a0e829 	lsr	lr, r9, #16
    dac4:	e18e980a 	orr	r9, lr, sl, lsl #16
    dac8:	e1a0e82a 	lsr	lr, sl, #16
    dacc:	e18ea80b 	orr	sl, lr, fp, lsl #16
    dad0:	e1a0e82b 	lsr	lr, fp, #16
    dad4:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    dad8:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    dadc:	e18e1804 	orr	r1, lr, r4, lsl #16
    dae0:	e1a0e824 	lsr	lr, r4, #16
    dae4:	e18e4805 	orr	r4, lr, r5, lsl #16
    dae8:	e1a0e825 	lsr	lr, r5, #16
    daec:	e18e5806 	orr	r5, lr, r6, lsl #16
    daf0:	e1a0e826 	lsr	lr, r6, #16
    daf4:	e18e6807 	orr	r6, lr, r7, lsl #16
    daf8:	e1a0e827 	lsr	lr, r7, #16
    dafc:	e18e7808 	orr	r7, lr, r8, lsl #16
    db00:	e1a0e828 	lsr	lr, r8, #16
    db04:	e18e8809 	orr	r8, lr, r9, lsl #16
    db08:	e1a0e829 	lsr	lr, r9, #16
    db0c:	e18e980a 	orr	r9, lr, sl, lsl #16
    db10:	e1a0e82a 	lsr	lr, sl, #16
    db14:	e18ea80b 	orr	sl, lr, fp, lsl #16
    db18:	e1a0e82b 	lsr	lr, fp, #16
    db1c:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    db20:	e2422040 	sub	r2, r2, #64	; 0x40
    db24:	eaffffd5 	b	0xda80
    db28:	e3520080 	cmp	r2, #128	; 0x80
    db2c:	9a000000 	bls	0xdb34
    db30:	f5d3f080 	pld	[r3, #128]
    db34:	e3520020 	cmp	r2, #32	; 0x20
    db38:	4a000013 	bmi	0xdb8c
    db3c:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    db40:	e18e1804 	orr	r1, lr, r4, lsl #16
    db44:	e1a0e824 	lsr	lr, r4, #16
    db48:	e18e4805 	orr	r4, lr, r5, lsl #16
    db4c:	e1a0e825 	lsr	lr, r5, #16
    db50:	e18e5806 	orr	r5, lr, r6, lsl #16
    db54:	e1a0e826 	lsr	lr, r6, #16
    db58:	e18e6807 	orr	r6, lr, r7, lsl #16
    db5c:	e1a0e827 	lsr	lr, r7, #16
    db60:	e18e7808 	orr	r7, lr, r8, lsl #16
    db64:	e1a0e828 	lsr	lr, r8, #16
    db68:	e18e8809 	orr	r8, lr, r9, lsl #16
    db6c:	e1a0e829 	lsr	lr, r9, #16
    db70:	e18e980a 	orr	r9, lr, sl, lsl #16
    db74:	e1a0e82a 	lsr	lr, sl, #16
    db78:	e18ea80b 	orr	sl, lr, fp, lsl #16
    db7c:	e1a0e82b 	lsr	lr, fp, #16
    db80:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    db84:	e2422020 	sub	r2, r2, #32	; 0x20
    db88:	eaffffe9 	b	0xdb34
    db8c:	e212601c 	ands	r6, r2, #28	; 0x1c
    db90:	02431002 	subeq	r1, r3, #2	; 0x2
    db94:	0a0000cd 	beq	0xded0
    db98:	e0422006 	sub	r2, r2, r6
    db9c:	e2666020 	rsb	r6, r6, #32	; 0x20
    dba0:	e28fc000 	add	ip, pc, #0	; 0x0
    dba4:	e08cf106 	add	pc, ip, r6, lsl #2
    dba8:	e4934004 	ldr	r4, [r3], #4
    dbac:	e18ec804 	orr	ip, lr, r4, lsl #16
    dbb0:	e480c004 	str	ip, [r0], #4
    dbb4:	e1a0e824 	lsr	lr, r4, #16
    dbb8:	e4934004 	ldr	r4, [r3], #4
    dbbc:	e18ec804 	orr	ip, lr, r4, lsl #16
    dbc0:	e480c004 	str	ip, [r0], #4
    dbc4:	e1a0e824 	lsr	lr, r4, #16
    dbc8:	e4934004 	ldr	r4, [r3], #4
    dbcc:	e18ec804 	orr	ip, lr, r4, lsl #16
    dbd0:	e480c004 	str	ip, [r0], #4
    dbd4:	e1a0e824 	lsr	lr, r4, #16
    dbd8:	e4934004 	ldr	r4, [r3], #4
    dbdc:	e18ec804 	orr	ip, lr, r4, lsl #16
    dbe0:	e480c004 	str	ip, [r0], #4
    dbe4:	e1a0e824 	lsr	lr, r4, #16
    dbe8:	e4934004 	ldr	r4, [r3], #4
    dbec:	e18ec804 	orr	ip, lr, r4, lsl #16
    dbf0:	e480c004 	str	ip, [r0], #4
    dbf4:	e1a0e824 	lsr	lr, r4, #16
    dbf8:	e4934004 	ldr	r4, [r3], #4
    dbfc:	e18ec804 	orr	ip, lr, r4, lsl #16
    dc00:	e480c004 	str	ip, [r0], #4
    dc04:	e1a0e824 	lsr	lr, r4, #16
    dc08:	e4934004 	ldr	r4, [r3], #4
    dc0c:	e18ec804 	orr	ip, lr, r4, lsl #16
    dc10:	e480c004 	str	ip, [r0], #4
    dc14:	e1a0e824 	lsr	lr, r4, #16
    dc18:	e4934004 	ldr	r4, [r3], #4
    dc1c:	e18ec804 	orr	ip, lr, r4, lsl #16
    dc20:	e480c004 	str	ip, [r0], #4
    dc24:	e1a0e824 	lsr	lr, r4, #16
    dc28:	e2431002 	sub	r1, r3, #2	; 0x2
    dc2c:	e2622004 	rsb	r2, r2, #4	; 0x4
    dc30:	e28fc000 	add	ip, pc, #0	; 0x0
    dc34:	e08cf102 	add	pc, ip, r2, lsl #2
    dc38:	e4d13001 	ldrb	r3, [r1], #1
    dc3c:	e4d14001 	ldrb	r4, [r1], #1
    dc40:	e4d15001 	ldrb	r5, [r1], #1
    dc44:	e4d16001 	ldrb	r6, [r1], #1
    dc48:	e28fc000 	add	ip, pc, #0	; 0x0
    dc4c:	e08cf102 	add	pc, ip, r2, lsl #2
    dc50:	e4c03001 	strb	r3, [r0], #1
    dc54:	e4c04001 	strb	r4, [r0], #1
    dc58:	e4c05001 	strb	r5, [r0], #1
    dc5c:	e4c06001 	strb	r6, [r0], #1
    dc60:	e8bd4ff1 	pop	{r0, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    dc64:	e12fff1e 	bx	lr
    dc68:	e3c13003 	bic	r3, r1, #3	; 0x3
    dc6c:	e493e004 	ldr	lr, [r3], #4
    dc70:	e1a0ec2e 	lsr	lr, lr, #24
    dc74:	e200401c 	and	r4, r0, #28	; 0x1c
    dc78:	e2644020 	rsb	r4, r4, #32	; 0x20
    dc7c:	e202501c 	and	r5, r2, #28	; 0x1c
    dc80:	e1540002 	cmp	r4, r2
    dc84:	81a04005 	movhi	r4, r5
    dc88:	e3540000 	cmp	r4, #0	; 0x0
    dc8c:	0a000024 	beq	0xdd24
    dc90:	e2646020 	rsb	r6, r4, #32	; 0x20
    dc94:	e206601c 	and	r6, r6, #28	; 0x1c
    dc98:	e0422004 	sub	r2, r2, r4
    dc9c:	e28fc000 	add	ip, pc, #0	; 0x0
    dca0:	e08cf106 	add	pc, ip, r6, lsl #2
    dca4:	e4934004 	ldr	r4, [r3], #4
    dca8:	e18ec404 	orr	ip, lr, r4, lsl #8
    dcac:	e480c004 	str	ip, [r0], #4
    dcb0:	e1a0ec24 	lsr	lr, r4, #24
    dcb4:	e4934004 	ldr	r4, [r3], #4
    dcb8:	e18ec404 	orr	ip, lr, r4, lsl #8
    dcbc:	e480c004 	str	ip, [r0], #4
    dcc0:	e1a0ec24 	lsr	lr, r4, #24
    dcc4:	e4934004 	ldr	r4, [r3], #4
    dcc8:	e18ec404 	orr	ip, lr, r4, lsl #8
    dccc:	e480c004 	str	ip, [r0], #4
    dcd0:	e1a0ec24 	lsr	lr, r4, #24
    dcd4:	e4934004 	ldr	r4, [r3], #4
    dcd8:	e18ec404 	orr	ip, lr, r4, lsl #8
    dcdc:	e480c004 	str	ip, [r0], #4
    dce0:	e1a0ec24 	lsr	lr, r4, #24
    dce4:	e4934004 	ldr	r4, [r3], #4
    dce8:	e18ec404 	orr	ip, lr, r4, lsl #8
    dcec:	e480c004 	str	ip, [r0], #4
    dcf0:	e1a0ec24 	lsr	lr, r4, #24
    dcf4:	e4934004 	ldr	r4, [r3], #4
    dcf8:	e18ec404 	orr	ip, lr, r4, lsl #8
    dcfc:	e480c004 	str	ip, [r0], #4
    dd00:	e1a0ec24 	lsr	lr, r4, #24
    dd04:	e4934004 	ldr	r4, [r3], #4
    dd08:	e18ec404 	orr	ip, lr, r4, lsl #8
    dd0c:	e480c004 	str	ip, [r0], #4
    dd10:	e1a0ec24 	lsr	lr, r4, #24
    dd14:	e4934004 	ldr	r4, [r3], #4
    dd18:	e18ec404 	orr	ip, lr, r4, lsl #8
    dd1c:	e480c004 	str	ip, [r0], #4
    dd20:	e1a0ec24 	lsr	lr, r4, #24
    dd24:	e35200a0 	cmp	r2, #160	; 0xa0
    dd28:	4a000027 	bmi	0xddcc
    dd2c:	f5d3f060 	pld	[r3, #96]
    dd30:	f5d3f080 	pld	[r3, #128]
    dd34:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    dd38:	e18e1404 	orr	r1, lr, r4, lsl #8
    dd3c:	e1a0ec24 	lsr	lr, r4, #24
    dd40:	e18e4405 	orr	r4, lr, r5, lsl #8
    dd44:	e1a0ec25 	lsr	lr, r5, #24
    dd48:	e18e5406 	orr	r5, lr, r6, lsl #8
    dd4c:	e1a0ec26 	lsr	lr, r6, #24
    dd50:	e18e6407 	orr	r6, lr, r7, lsl #8
    dd54:	e1a0ec27 	lsr	lr, r7, #24
    dd58:	e18e7408 	orr	r7, lr, r8, lsl #8
    dd5c:	e1a0ec28 	lsr	lr, r8, #24
    dd60:	e18e8409 	orr	r8, lr, r9, lsl #8
    dd64:	e1a0ec29 	lsr	lr, r9, #24
    dd68:	e18e940a 	orr	r9, lr, sl, lsl #8
    dd6c:	e1a0ec2a 	lsr	lr, sl, #24
    dd70:	e18ea40b 	orr	sl, lr, fp, lsl #8
    dd74:	e1a0ec2b 	lsr	lr, fp, #24
    dd78:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    dd7c:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    dd80:	e18e1404 	orr	r1, lr, r4, lsl #8
    dd84:	e1a0ec24 	lsr	lr, r4, #24
    dd88:	e18e4405 	orr	r4, lr, r5, lsl #8
    dd8c:	e1a0ec25 	lsr	lr, r5, #24
    dd90:	e18e5406 	orr	r5, lr, r6, lsl #8
    dd94:	e1a0ec26 	lsr	lr, r6, #24
    dd98:	e18e6407 	orr	r6, lr, r7, lsl #8
    dd9c:	e1a0ec27 	lsr	lr, r7, #24
    dda0:	e18e7408 	orr	r7, lr, r8, lsl #8
    dda4:	e1a0ec28 	lsr	lr, r8, #24
    dda8:	e18e8409 	orr	r8, lr, r9, lsl #8
    ddac:	e1a0ec29 	lsr	lr, r9, #24
    ddb0:	e18e940a 	orr	r9, lr, sl, lsl #8
    ddb4:	e1a0ec2a 	lsr	lr, sl, #24
    ddb8:	e18ea40b 	orr	sl, lr, fp, lsl #8
    ddbc:	e1a0ec2b 	lsr	lr, fp, #24
    ddc0:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    ddc4:	e2422040 	sub	r2, r2, #64	; 0x40
    ddc8:	eaffffd5 	b	0xdd24
    ddcc:	e3520080 	cmp	r2, #128	; 0x80
    ddd0:	9a000000 	bls	0xddd8
    ddd4:	f5d3f080 	pld	[r3, #128]
    ddd8:	e3520020 	cmp	r2, #32	; 0x20
    dddc:	4a000013 	bmi	0xde30
    dde0:	e8b30ff0 	ldm	r3!, {r4, r5, r6, r7, r8, r9, sl, fp}
    dde4:	e18e1404 	orr	r1, lr, r4, lsl #8
    dde8:	e1a0ec24 	lsr	lr, r4, #24
    ddec:	e18e4405 	orr	r4, lr, r5, lsl #8
    ddf0:	e1a0ec25 	lsr	lr, r5, #24
    ddf4:	e18e5406 	orr	r5, lr, r6, lsl #8
    ddf8:	e1a0ec26 	lsr	lr, r6, #24
    ddfc:	e18e6407 	orr	r6, lr, r7, lsl #8
    de00:	e1a0ec27 	lsr	lr, r7, #24
    de04:	e18e7408 	orr	r7, lr, r8, lsl #8
    de08:	e1a0ec28 	lsr	lr, r8, #24
    de0c:	e18e8409 	orr	r8, lr, r9, lsl #8
    de10:	e1a0ec29 	lsr	lr, r9, #24
    de14:	e18e940a 	orr	r9, lr, sl, lsl #8
    de18:	e1a0ec2a 	lsr	lr, sl, #24
    de1c:	e18ea40b 	orr	sl, lr, fp, lsl #8
    de20:	e1a0ec2b 	lsr	lr, fp, #24
    de24:	e8a007f2 	stmia	r0!, {r1, r4, r5, r6, r7, r8, r9, sl}
    de28:	e2422020 	sub	r2, r2, #32	; 0x20
    de2c:	eaffffe9 	b	0xddd8
    de30:	e212601c 	ands	r6, r2, #28	; 0x1c
    de34:	02431001 	subeq	r1, r3, #1	; 0x1
    de38:	0a000024 	beq	0xded0
    de3c:	e0422006 	sub	r2, r2, r6
    de40:	e2666020 	rsb	r6, r6, #32	; 0x20
    de44:	e28fc000 	add	ip, pc, #0	; 0x0
    de48:	e08cf106 	add	pc, ip, r6, lsl #2
    de4c:	e4934004 	ldr	r4, [r3], #4
    de50:	e18ec404 	orr	ip, lr, r4, lsl #8
    de54:	e480c004 	str	ip, [r0], #4
    de58:	e1a0ec24 	lsr	lr, r4, #24
    de5c:	e4934004 	ldr	r4, [r3], #4
    de60:	e18ec404 	orr	ip, lr, r4, lsl #8
    de64:	e480c004 	str	ip, [r0], #4
    de68:	e1a0ec24 	lsr	lr, r4, #24
    de6c:	e4934004 	ldr	r4, [r3], #4
    de70:	e18ec404 	orr	ip, lr, r4, lsl #8
    de74:	e480c004 	str	ip, [r0], #4
    de78:	e1a0ec24 	lsr	lr, r4, #24
    de7c:	e4934004 	ldr	r4, [r3], #4
    de80:	e18ec404 	orr	ip, lr, r4, lsl #8
    de84:	e480c004 	str	ip, [r0], #4
    de88:	e1a0ec24 	lsr	lr, r4, #24
    de8c:	e4934004 	ldr	r4, [r3], #4
    de90:	e18ec404 	orr	ip, lr, r4, lsl #8
    de94:	e480c004 	str	ip, [r0], #4
    de98:	e1a0ec24 	lsr	lr, r4, #24
    de9c:	e4934004 	ldr	r4, [r3], #4
    dea0:	e18ec404 	orr	ip, lr, r4, lsl #8
    dea4:	e480c004 	str	ip, [r0], #4
    dea8:	e1a0ec24 	lsr	lr, r4, #24
    deac:	e4934004 	ldr	r4, [r3], #4
    deb0:	e18ec404 	orr	ip, lr, r4, lsl #8
    deb4:	e480c004 	str	ip, [r0], #4
    deb8:	e1a0ec24 	lsr	lr, r4, #24
    debc:	e4934004 	ldr	r4, [r3], #4
    dec0:	e18ec404 	orr	ip, lr, r4, lsl #8
    dec4:	e480c004 	str	ip, [r0], #4
    dec8:	e1a0ec24 	lsr	lr, r4, #24
    decc:	e2431001 	sub	r1, r3, #1	; 0x1
    ded0:	e2622004 	rsb	r2, r2, #4	; 0x4
    ded4:	e28fc000 	add	ip, pc, #0	; 0x0
    ded8:	e08cf102 	add	pc, ip, r2, lsl #2
    dedc:	e4d13001 	ldrb	r3, [r1], #1
    dee0:	e4d14001 	ldrb	r4, [r1], #1
    dee4:	e4d15001 	ldrb	r5, [r1], #1
    dee8:	e4d16001 	ldrb	r6, [r1], #1
    deec:	e28fc000 	add	ip, pc, #0	; 0x0
    def0:	e08cf102 	add	pc, ip, r2, lsl #2
    def4:	e4c03001 	strb	r3, [r0], #1
    def8:	e4c04001 	strb	r4, [r0], #1
    defc:	e4c05001 	strb	r5, [r0], #1
    df00:	e4c06001 	strb	r6, [r0], #1
    df04:	e8bd4ff1 	pop	{r0, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    df08:	e12fff1e 	bx	lr
    df0c:	e3520004 	cmp	r2, #4	; 0x4
    df10:	ba000024 	blt	0xdfa8
    df14:	e1803001 	orr	r3, r0, r1
    df18:	e3130001 	tst	r3, #1	; 0x1
    df1c:	1a000023 	bne	0xdfb0
    df20:	e3130002 	tst	r3, #2	; 0x2
    df24:	1a000010 	bne	0xdf6c
    df28:	e2522004 	subs	r2, r2, #4	; 0x4
    df2c:	a4903004 	ldrge	r3, [r0], #4
    df30:	a491c004 	ldrge	ip, [r1], #4
    df34:	ba000019 	blt	0xdfa0
    df38:	e033300c 	eors	r3, r3, ip
    df3c:	0afffff9 	beq	0xdf28
    df40:	e3a0c004 	mov	ip, #4	; 0x4
    df44:	e31300ff 	tst	r3, #255	; 0xff
    df48:	024cc001 	subeq	ip, ip, #1	; 0x1
    df4c:	03130cff 	tsteq	r3, #65280	; 0xff00
    df50:	024cc001 	subeq	ip, ip, #1	; 0x1
    df54:	031308ff 	tsteq	r3, #16711680	; 0xff0000
    df58:	024cc001 	subeq	ip, ip, #1	; 0x1
    df5c:	e750300c 	ldrb	r3, [r0, -ip]
    df60:	e751c00c 	ldrb	ip, [r1, -ip]
    df64:	e043000c 	sub	r0, r3, ip
    df68:	e12fff1e 	bx	lr
    df6c:	e2522002 	subs	r2, r2, #2	; 0x2
    df70:	a0d030b2 	ldrhge	r3, [r0], #2
    df74:	a0d1c0b2 	ldrhge	ip, [r1], #2
    df78:	ba000009 	blt	0xdfa4
    df7c:	e053300c 	subs	r3, r3, ip
    df80:	0afffff9 	beq	0xdf6c
    df84:	e31300ff 	tst	r3, #255	; 0xff
    df88:	01a00443 	asreq	r0, r3, #8
    df8c:	012fff1e 	bxeq	lr
    df90:	e5503002 	ldrb	r3, [r0, #-2]
    df94:	e20cc0ff 	and	ip, ip, #255	; 0xff
    df98:	e043000c 	sub	r0, r3, ip
    df9c:	e12fff1e 	bx	lr
    dfa0:	e2822002 	add	r2, r2, #2	; 0x2
    dfa4:	e2822002 	add	r2, r2, #2	; 0x2
    dfa8:	e3520000 	cmp	r2, #0	; 0x0
    dfac:	0a000007 	beq	0xdfd0
    dfb0:	e4d03001 	ldrb	r3, [r0], #1
    dfb4:	e4d1c001 	ldrb	ip, [r1], #1
    dfb8:	e2522001 	subs	r2, r2, #1	; 0x1
    dfbc:	0a000001 	beq	0xdfc8
    dfc0:	e133000c 	teq	r3, ip
    dfc4:	0afffff9 	beq	0xdfb0
    dfc8:	e043000c 	sub	r0, r3, ip
    dfcc:	e12fff1e 	bx	lr
    dfd0:	e1a00002 	mov	r0, r2
    dfd4:	e12fff1e 	bx	lr
    dfd8:	e92d4010 	push	{r4, lr}
    dfdc:	e3a00103 	mov	r0, #VIDEO_CONTR
    dfe0:	e59f4020 	ldr	r4, [pc, #32]	; 0xe008
    dfe4:	e3800094 	orr	r0, r0, #148	; 0x94
    dfe8:	e3a03000 	mov	r3, #0	; 0x0
    dfec:	e3a02000 	mov	r2, #0	; 0x0
    dff0:	e3a01000 	mov	r1, #0	; 0x0
    dff4:	e1a0e00f 	mov	lr, pc
    dff8:	e12fff14 	bx	r4
    dffc:	e3e00000 	mvn	r0, #0	; 0x0
    e000:	e8bd4010 	pop	{r4, lr}
    e004:	e12fff1e 	bx	lr
*/
.xe008:	.word 0xf000fe38
/*
    e00c:	e12fff1e 	bx	lr
    e010:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    e014:	e1b05002 	movs	r5, r2
    e018:	e1a06001 	mov	r6, r1
    e01c:	e1a07000 	mov	r7, r0
    e020:	e3a04000 	mov	r4, #0	; 0x0
    e024:	e3a03000 	mov	r3, #0	; 0x0
    e028:	0a00000d 	beq	0xe064
    e02c:	e0d700d1 	ldrsb	r0, [r7], #1
    e030:	e2455001 	sub	r5, r5, #1	; 0x1
    e034:	eb00000d 	bl	0xe070
    e038:	e1a03000 	mov	r3, r0
    e03c:	e0d600d1 	ldrsb	r0, [r6], #1
    e040:	e20340ff 	and	r4, r3, #255	; 0xff
    e044:	eb000009 	bl	0xe070
    e048:	e20030ff 	and	r3, r0, #255	; 0xff
    e04c:	e1b02004 	movs	r2, r4
    e050:	0a000003 	beq	0xe064
    e054:	e1520003 	cmp	r2, r3
    e058:	1a000001 	bne	0xe064
    e05c:	e3550000 	cmp	r5, #0	; 0x0
    e060:	1afffff1 	bne	0xe02c
    e064:	e0440003 	sub	r0, r4, r3
    e068:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    e06c:	e12fff1e 	bx	lr
    e070:	e2403041 	sub	r3, r0, #65	; 0x41
    e074:	e3530019 	cmp	r3, #25	; 0x19
    e078:	92800020 	addls	r0, r0, #32	; 0x20
    e07c:	e12fff1e 	bx	lr
	...
    f000:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    f004:	e1a06000 	mov	r6, r0
    f008:	e3a0af45 	mov	sl, #276	; 0x114
    f00c:	e596e004 	ldr	lr, [r6, #4]
    f010:	e5964018 	ldr	r4, [r6, #24]
    f014:	e38aa001 	orr	sl, sl, #1	; 0x1
    f018:	e3a09000 	mov	r9, #0	; 0x0
    f01c:	e596301c 	ldr	r3, [r6, #28]
    f020:	e3a0b001 	mov	fp, #1	; 0x1
    f024:	e1540003 	cmp	r4, r3
    f028:	2a0000bc 	bcs	0xf320
    f02c:	e5963008 	ldr	r3, [r6, #8]
    f030:	e15e0003 	cmp	lr, r3
    f034:	2a0000b9 	bcs	0xf320
    f038:	e2843020 	add	r3, r4, #32	; 0x20
    f03c:	f5d3f000 	pld	[r3]
    f040:	e2843040 	add	r3, r4, #64	; 0x40
    f044:	f5d3f000 	pld	[r3]
    f048:	e2843060 	add	r3, r4, #96	; 0x60
    f04c:	f5d3f000 	pld	[r3]
    f050:	e2843080 	add	r3, r4, #128	; 0x80
    f054:	f5d3f000 	pld	[r3]
    f058:	e5d40000 	ldrb	r0, [r4]
    f05c:	e5d43001 	ldrb	r3, [r4, #1]
    f060:	e5d42002 	ldrb	r2, [r4, #2]
    f064:	e5d41003 	ldrb	r1, [r4, #3]
    f068:	e1803403 	orr	r3, r0, r3, lsl #8
    f06c:	e1833802 	orr	r3, r3, r2, lsl #16
    f070:	e1933c01 	orrs	r3, r3, r1, lsl #24
    f074:	e1a03083 	lsl	r3, r3, #1
    f078:	e2835001 	add	r5, r3, #1	; 0x1
    f07c:	e2844004 	add	r4, r4, #4	; 0x4
    f080:	4a000002 	bmi	0xf090
    f084:	e4d42001 	ldrb	r2, [r4], #1
    f088:	e4ce2001 	strb	r2, [lr], #1
    f08c:	ea00008e 	b	0xf2cc
    f090:	e5d42000 	ldrb	r2, [r4]
    f094:	e5d43001 	ldrb	r3, [r4, #1]
    f098:	e2844002 	add	r4, r4, #2	; 0x2
    f09c:	e1823403 	orr	r3, r2, r3, lsl #8
    f0a0:	e2038007 	and	r8, r3, #7	; 0x7
    f0a4:	e3580005 	cmp	r8, #5	; 0x5
    f0a8:	e1e011c3 	mvn	r1, r3, asr #3
    f0ac:	ca00003d 	bgt	0xf1a8
    f0b0:	e5963004 	ldr	r3, [r6, #4]
    f0b4:	e081700e 	add	r7, r1, lr
    f0b8:	e1570003 	cmp	r7, r3
    f0bc:	3a000162 	bcc	0xf64c
    f0c0:	e2873020 	add	r3, r7, #32	; 0x20
    f0c4:	f5d3f000 	pld	[r3]
    f0c8:	e3710003 	cmn	r1, #3	; 0x3
    f0cc:	e2873040 	add	r3, r7, #64	; 0x40
    f0d0:	f5d3f000 	pld	[r3]
    f0d4:	e2873060 	add	r3, r7, #96	; 0x60
    f0d8:	f5d3f000 	pld	[r3]
    f0dc:	e2873080 	add	r3, r7, #128	; 0x80
    f0e0:	f5d3f000 	pld	[r3]
    f0e4:	aa000014 	bge	0xf13c
    f0e8:	e5d72001 	ldrb	r2, [r7, #1]
    f0ec:	e5d71002 	ldrb	r1, [r7, #2]
    f0f0:	e5d70003 	ldrb	r0, [r7, #3]
    f0f4:	e5d73000 	ldrb	r3, [r7]
    f0f8:	e5ce2001 	strb	r2, [lr, #1]
    f0fc:	e5ce1002 	strb	r1, [lr, #2]
    f100:	e5ce3000 	strb	r3, [lr]
    f104:	e5ce0003 	strb	r0, [lr, #3]
    f108:	e3580001 	cmp	r8, #1	; 0x1
    f10c:	da000007 	ble	0xf130
    f110:	e5d72005 	ldrb	r2, [r7, #5]
    f114:	e5d71006 	ldrb	r1, [r7, #6]
    f118:	e5d70007 	ldrb	r0, [r7, #7]
    f11c:	e5d73004 	ldrb	r3, [r7, #4]
    f120:	e5ce2005 	strb	r2, [lr, #5]
    f124:	e5ce1006 	strb	r1, [lr, #6]
    f128:	e5ce3004 	strb	r3, [lr, #4]
    f12c:	e5ce0007 	strb	r0, [lr, #7]
    f130:	e088300e 	add	r3, r8, lr
    f134:	e283e003 	add	lr, r3, #3	; 0x3
    f138:	ea000063 	b	0xf2cc
    f13c:	e4d73001 	ldrb	r3, [r7], #1
    f140:	e2582001 	subs	r2, r8, #1	; 0x1
    f144:	e4ce3001 	strb	r3, [lr], #1
    f148:	e4d73001 	ldrb	r3, [r7], #1
    f14c:	e4ce3001 	strb	r3, [lr], #1
    f150:	e4d73001 	ldrb	r3, [r7], #1
    f154:	e4ce3001 	strb	r3, [lr], #1
    f158:	4a00005b 	bmi	0xf2cc
    f15c:	e4d73001 	ldrb	r3, [r7], #1
    f160:	e2522001 	subs	r2, r2, #1	; 0x1
    f164:	e4ce3001 	strb	r3, [lr], #1
    f168:	4a000057 	bmi	0xf2cc
    f16c:	e4d73001 	ldrb	r3, [r7], #1
    f170:	e2522001 	subs	r2, r2, #1	; 0x1
    f174:	e4ce3001 	strb	r3, [lr], #1
    f178:	4a000053 	bmi	0xf2cc
    f17c:	e4d73001 	ldrb	r3, [r7], #1
    f180:	e2521001 	subs	r1, r2, #1	; 0x1
    f184:	e4ce3001 	strb	r3, [lr], #1
    f188:	4a00004f 	bmi	0xf2cc
    f18c:	e5d72000 	ldrb	r2, [r7]
    f190:	e2513001 	subs	r3, r1, #1	; 0x1
    f194:	e4ce2001 	strb	r2, [lr], #1
    f198:	4a00004b 	bmi	0xf2cc
    f19c:	e5d73001 	ldrb	r3, [r7, #1]
    f1a0:	e4ce3001 	strb	r3, [lr], #1
    f1a4:	ea000048 	b	0xf2cc
    f1a8:	e3580007 	cmp	r8, #7	; 0x7
    f1ac:	1a000020 	bne	0xf234
    f1b0:	e3590000 	cmp	r9, #0	; 0x0
    f1b4:	1a00000b 	bne	0xf1e8
    f1b8:	e2843020 	add	r3, r4, #32	; 0x20
    f1bc:	f5d3f000 	pld	[r3]
    f1c0:	e2843040 	add	r3, r4, #64	; 0x40
    f1c4:	f5d3f000 	pld	[r3]
    f1c8:	e2843060 	add	r3, r4, #96	; 0x60
    f1cc:	f5d3f000 	pld	[r3]
    f1d0:	e2843080 	add	r3, r4, #128	; 0x80
    f1d4:	f5d3f000 	pld	[r3]
    f1d8:	e1a09004 	mov	r9, r4
    f1dc:	e4d43001 	ldrb	r3, [r4], #1
    f1e0:	e203300f 	and	r3, r3, #15	; 0xf
    f1e4:	ea000002 	b	0xf1f4
    f1e8:	e5d93000 	ldrb	r3, [r9]
    f1ec:	e3a09000 	mov	r9, #0	; 0x0
    f1f0:	e1a03223 	lsr	r3, r3, #4
    f1f4:	e353000f 	cmp	r3, #15	; 0xf
    f1f8:	1a00000b 	bne	0xf22c
    f1fc:	e4d43001 	ldrb	r3, [r4], #1
    f200:	e35300ff 	cmp	r3, #255	; 0xff
    f204:	1a000007 	bne	0xf228
    f208:	e5d42000 	ldrb	r2, [r4]
    f20c:	e5d43001 	ldrb	r3, [r4, #1]
    f210:	e2844002 	add	r4, r4, #2	; 0x2
    f214:	e1823403 	orr	r3, r2, r3, lsl #8
    f218:	e153000a 	cmp	r3, sl
    f21c:	ba00010a 	blt	0xf64c
    f220:	e2830003 	add	r0, r3, #3	; 0x3
    f224:	ea000003 	b	0xf238
    f228:	e283300f 	add	r3, r3, #15	; 0xf
    f22c:	e283000a 	add	r0, r3, #10	; 0xa
    f230:	ea000000 	b	0xf238
    f234:	e2880003 	add	r0, r8, #3	; 0x3
    f238:	e5962008 	ldr	r2, [r6, #8]
    f23c:	e080300e 	add	r3, r0, lr
    f240:	e586402c 	str	r4, [r6, #44]
    f244:	e1530002 	cmp	r3, r2
    f248:	e081100e 	add	r1, r1, lr
    f24c:	2a00007c 	bcs	0xf444
    f250:	e5963004 	ldr	r3, [r6, #4]
    f254:	e1510003 	cmp	r1, r3
    f258:	3a0000fb 	bcc	0xf64c
    f25c:	e3500008 	cmp	r0, #8	; 0x8
    f260:	da000014 	ble	0xf2b8
    f264:	e5d13000 	ldrb	r3, [r1]
    f268:	e2400008 	sub	r0, r0, #8	; 0x8
    f26c:	e3500008 	cmp	r0, #8	; 0x8
    f270:	e5ce3000 	strb	r3, [lr]
    f274:	e5d13001 	ldrb	r3, [r1, #1]
    f278:	e5ce3001 	strb	r3, [lr, #1]
    f27c:	e5d13002 	ldrb	r3, [r1, #2]
    f280:	e5ce3002 	strb	r3, [lr, #2]
    f284:	e5d13003 	ldrb	r3, [r1, #3]
    f288:	e5ce3003 	strb	r3, [lr, #3]
    f28c:	e5d13004 	ldrb	r3, [r1, #4]
    f290:	e5ce3004 	strb	r3, [lr, #4]
    f294:	e5d13005 	ldrb	r3, [r1, #5]
    f298:	e5ce3005 	strb	r3, [lr, #5]
    f29c:	e5d13006 	ldrb	r3, [r1, #6]
    f2a0:	e5ce3006 	strb	r3, [lr, #6]
    f2a4:	e5d13007 	ldrb	r3, [r1, #7]
    f2a8:	e2811008 	add	r1, r1, #8	; 0x8
    f2ac:	e5ce3007 	strb	r3, [lr, #7]
    f2b0:	e28ee008 	add	lr, lr, #8	; 0x8
    f2b4:	caffffea 	bgt	0xf264
    f2b8:	e4d13001 	ldrb	r3, [r1], #1
    f2bc:	e2500001 	subs	r0, r0, #1	; 0x1
    f2c0:	e4ce3001 	strb	r3, [lr], #1
    f2c4:	1afffffb 	bne	0xf2b8
    f2c8:	e596402c 	ldr	r4, [r6, #44]
    f2cc:	e3550000 	cmp	r5, #0	; 0x0
    f2d0:	4a00000f 	bmi	0xf314
    f2d4:	e4d43001 	ldrb	r3, [r4], #1
    f2d8:	e1b05085 	lsls	r5, r5, #1
    f2dc:	e4ce3001 	strb	r3, [lr], #1
    f2e0:	4a00000b 	bmi	0xf314
    f2e4:	e4d43001 	ldrb	r3, [r4], #1
    f2e8:	e1b05085 	lsls	r5, r5, #1
    f2ec:	e4ce3001 	strb	r3, [lr], #1
    f2f0:	4a000007 	bmi	0xf314
    f2f4:	e4d43001 	ldrb	r3, [r4], #1
    f2f8:	e1b05085 	lsls	r5, r5, #1
    f2fc:	e4ce3001 	strb	r3, [lr], #1
    f300:	4a000003 	bmi	0xf314
    f304:	e4d43001 	ldrb	r3, [r4], #1
    f308:	e1b05085 	lsls	r5, r5, #1
    f30c:	e4ce3001 	strb	r3, [lr], #1
    f310:	5affffef 	bpl	0xf2d4
    f314:	e1b05085 	lsls	r5, r5, #1
    f318:	1affff5c 	bne	0xf090
    f31c:	eaffff3e 	b	0xf01c
    f320:	e5963024 	ldr	r3, [r6, #36]
    f324:	e1540003 	cmp	r4, r3
    f328:	2a0000c7 	bcs	0xf64c
    f32c:	e5d40000 	ldrb	r0, [r4]
    f330:	e5d43001 	ldrb	r3, [r4, #1]
    f334:	e5d42002 	ldrb	r2, [r4, #2]
    f338:	e5d41003 	ldrb	r1, [r4, #3]
    f33c:	e1803403 	orr	r3, r0, r3, lsl #8
    f340:	e1833802 	orr	r3, r3, r2, lsl #16
    f344:	e1933c01 	orrs	r3, r3, r1, lsl #24
    f348:	e1a03083 	lsl	r3, r3, #1
    f34c:	e2835001 	add	r5, r3, #1	; 0x1
    f350:	e2844004 	add	r4, r4, #4	; 0x4
    f354:	4a000008 	bmi	0xf37c
    f358:	e596200c 	ldr	r2, [r6, #12]
    f35c:	e15e0002 	cmp	lr, r2
    f360:	2a0000b4 	bcs	0xf638
    f364:	e5963014 	ldr	r3, [r6, #20]
    f368:	e1540003 	cmp	r4, r3
    f36c:	2a0000b6 	bcs	0xf64c
    f370:	e4d43001 	ldrb	r3, [r4], #1
    f374:	e4ce3001 	strb	r3, [lr], #1
    f378:	ea000054 	b	0xf4d0
    f37c:	e596300c 	ldr	r3, [r6, #12]
    f380:	e15e0003 	cmp	lr, r3
    f384:	2a000082 	bcs	0xf594
    f388:	e5960020 	ldr	r0, [r6, #32]
    f38c:	e1540000 	cmp	r4, r0
    f390:	2a0000ad 	bcs	0xf64c
    f394:	e5d42000 	ldrb	r2, [r4]
    f398:	e5d43001 	ldrb	r3, [r4, #1]
    f39c:	e2841002 	add	r1, r4, #2	; 0x2
    f3a0:	e1823403 	orr	r3, r2, r3, lsl #8
    f3a4:	e2032007 	and	r2, r3, #7	; 0x7
    f3a8:	e3520007 	cmp	r2, #7	; 0x7
    f3ac:	e1e041c3 	mvn	r4, r3, asr #3
    f3b0:	1a000020 	bne	0xf438
    f3b4:	e3590000 	cmp	r9, #0	; 0x0
    f3b8:	1a000006 	bne	0xf3d8
    f3bc:	e5963014 	ldr	r3, [r6, #20]
    f3c0:	e1510003 	cmp	r1, r3
    f3c4:	2a0000a0 	bcs	0xf64c
    f3c8:	e1a09001 	mov	r9, r1
    f3cc:	e4d13001 	ldrb	r3, [r1], #1
    f3d0:	e203300f 	and	r3, r3, #15	; 0xf
    f3d4:	ea000002 	b	0xf3e4
    f3d8:	e5d93000 	ldrb	r3, [r9]
    f3dc:	e3a09000 	mov	r9, #0	; 0x0
    f3e0:	e1a03223 	lsr	r3, r3, #4
    f3e4:	e353000f 	cmp	r3, #15	; 0xf
    f3e8:	1a000010 	bne	0xf430
    f3ec:	e5963014 	ldr	r3, [r6, #20]
    f3f0:	e1510003 	cmp	r1, r3
    f3f4:	2a000094 	bcs	0xf64c
    f3f8:	e4d13001 	ldrb	r3, [r1], #1
    f3fc:	e35300ff 	cmp	r3, #255	; 0xff
    f400:	1a000009 	bne	0xf42c
    f404:	e1510000 	cmp	r1, r0
    f408:	2a00008f 	bcs	0xf64c
    f40c:	e5d12000 	ldrb	r2, [r1]
    f410:	e5d13001 	ldrb	r3, [r1, #1]
    f414:	e2811002 	add	r1, r1, #2	; 0x2
    f418:	e1823403 	orr	r3, r2, r3, lsl #8
    f41c:	e153000a 	cmp	r3, sl
    f420:	ba000089 	blt	0xf64c
    f424:	e2830003 	add	r0, r3, #3	; 0x3
    f428:	ea000003 	b	0xf43c
    f42c:	e283300f 	add	r3, r3, #15	; 0xf
    f430:	e283000a 	add	r0, r3, #10	; 0xa
    f434:	ea000000 	b	0xf43c
    f438:	e2820003 	add	r0, r2, #3	; 0x3
    f43c:	e586102c 	str	r1, [r6, #44]
    f440:	e084100e 	add	r1, r4, lr
    f444:	e596200c 	ldr	r2, [r6, #12]
    f448:	e080300e 	add	r3, r0, lr
    f44c:	e1530002 	cmp	r3, r2
    f450:	e5963004 	ldr	r3, [r6, #4]
    f454:	8a000057 	bhi	0xf5b8
    f458:	e1510003 	cmp	r1, r3
    f45c:	3a00007a 	bcc	0xf64c
    f460:	e3500008 	cmp	r0, #8	; 0x8
    f464:	da000014 	ble	0xf4bc
    f468:	e5d13000 	ldrb	r3, [r1]
    f46c:	e2400008 	sub	r0, r0, #8	; 0x8
    f470:	e3500008 	cmp	r0, #8	; 0x8
    f474:	e5ce3000 	strb	r3, [lr]
    f478:	e5d13001 	ldrb	r3, [r1, #1]
    f47c:	e5ce3001 	strb	r3, [lr, #1]
    f480:	e5d13002 	ldrb	r3, [r1, #2]
    f484:	e5ce3002 	strb	r3, [lr, #2]
    f488:	e5d13003 	ldrb	r3, [r1, #3]
    f48c:	e5ce3003 	strb	r3, [lr, #3]
    f490:	e5d13004 	ldrb	r3, [r1, #4]
    f494:	e5ce3004 	strb	r3, [lr, #4]
    f498:	e5d13005 	ldrb	r3, [r1, #5]
    f49c:	e5ce3005 	strb	r3, [lr, #5]
    f4a0:	e5d13006 	ldrb	r3, [r1, #6]
    f4a4:	e5ce3006 	strb	r3, [lr, #6]
    f4a8:	e5d13007 	ldrb	r3, [r1, #7]
    f4ac:	e2811008 	add	r1, r1, #8	; 0x8
    f4b0:	e5ce3007 	strb	r3, [lr, #7]
    f4b4:	e28ee008 	add	lr, lr, #8	; 0x8
    f4b8:	caffffea 	bgt	0xf468
    f4bc:	e4d13001 	ldrb	r3, [r1], #1
    f4c0:	e2500001 	subs	r0, r0, #1	; 0x1
    f4c4:	e4ce3001 	strb	r3, [lr], #1
    f4c8:	1afffffb 	bne	0xf4bc
    f4cc:	e596402c 	ldr	r4, [r6, #44]
    f4d0:	e3550000 	cmp	r5, #0	; 0x0
    f4d4:	4a00002b 	bmi	0xf588
    f4d8:	e596300c 	ldr	r3, [r6, #12]
    f4dc:	e1a05085 	lsl	r5, r5, #1
    f4e0:	e15e0003 	cmp	lr, r3
    f4e4:	2a000053 	bcs	0xf638
    f4e8:	e5963014 	ldr	r3, [r6, #20]
    f4ec:	e1540003 	cmp	r4, r3
    f4f0:	2a000055 	bcs	0xf64c
    f4f4:	e4d43001 	ldrb	r3, [r4], #1
    f4f8:	e3550000 	cmp	r5, #0	; 0x0
    f4fc:	e4ce3001 	strb	r3, [lr], #1
    f500:	4a000020 	bmi	0xf588
    f504:	e596300c 	ldr	r3, [r6, #12]
    f508:	e1a05085 	lsl	r5, r5, #1
    f50c:	e15e0003 	cmp	lr, r3
    f510:	2a000048 	bcs	0xf638
    f514:	e5963014 	ldr	r3, [r6, #20]
    f518:	e1540003 	cmp	r4, r3
    f51c:	2a00004a 	bcs	0xf64c
    f520:	e4d43001 	ldrb	r3, [r4], #1
    f524:	e3550000 	cmp	r5, #0	; 0x0
    f528:	e4ce3001 	strb	r3, [lr], #1
    f52c:	4a000015 	bmi	0xf588
    f530:	e596300c 	ldr	r3, [r6, #12]
    f534:	e1a05085 	lsl	r5, r5, #1
    f538:	e15e0003 	cmp	lr, r3
    f53c:	2a00003d 	bcs	0xf638
    f540:	e5963014 	ldr	r3, [r6, #20]
    f544:	e1540003 	cmp	r4, r3
    f548:	2a00003f 	bcs	0xf64c
    f54c:	e4d43001 	ldrb	r3, [r4], #1
    f550:	e3550000 	cmp	r5, #0	; 0x0
    f554:	e4ce3001 	strb	r3, [lr], #1
    f558:	4a00000a 	bmi	0xf588
    f55c:	e596300c 	ldr	r3, [r6, #12]
    f560:	e1a05085 	lsl	r5, r5, #1
    f564:	e15e0003 	cmp	lr, r3
    f568:	2a000032 	bcs	0xf638
    f56c:	e5963014 	ldr	r3, [r6, #20]
    f570:	e1540003 	cmp	r4, r3
    f574:	2a000034 	bcs	0xf64c
    f578:	e4d43001 	ldrb	r3, [r4], #1
    f57c:	e3550000 	cmp	r5, #0	; 0x0
    f580:	e4ce3001 	strb	r3, [lr], #1
    f584:	5affffd3 	bpl	0xf4d8
    f588:	e1b05085 	lsls	r5, r5, #1
    f58c:	1affff7a 	bne	0xf37c
    f590:	eaffff62 	b	0xf320
    f594:	e5963000 	ldr	r3, [r6]
    f598:	e15e0003 	cmp	lr, r3
    f59c:	1a000025 	bne	0xf638
    f5a0:	e586b034 	str	fp, [r6, #52]
    f5a4:	e586402c 	str	r4, [r6, #44]
    f5a8:	e586e010 	str	lr, [r6, #16]
    f5ac:	e586b030 	str	fp, [r6, #48]
    f5b0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    f5b4:	e12fff1e 	bx	lr
    f5b8:	e1510003 	cmp	r1, r3
    f5bc:	3a000022 	bcc	0xf64c
    f5c0:	e596300c 	ldr	r3, [r6, #12]
    f5c4:	e043200e 	sub	r2, r3, lr
    f5c8:	e3520008 	cmp	r2, #8	; 0x8
    f5cc:	da000014 	ble	0xf624
    f5d0:	e5d13000 	ldrb	r3, [r1]
    f5d4:	e2422008 	sub	r2, r2, #8	; 0x8
    f5d8:	e3520008 	cmp	r2, #8	; 0x8
    f5dc:	e5ce3000 	strb	r3, [lr]
    f5e0:	e5d13001 	ldrb	r3, [r1, #1]
    f5e4:	e5ce3001 	strb	r3, [lr, #1]
    f5e8:	e5d13002 	ldrb	r3, [r1, #2]
    f5ec:	e5ce3002 	strb	r3, [lr, #2]
    f5f0:	e5d13003 	ldrb	r3, [r1, #3]
    f5f4:	e5ce3003 	strb	r3, [lr, #3]
    f5f8:	e5d13004 	ldrb	r3, [r1, #4]
    f5fc:	e5ce3004 	strb	r3, [lr, #4]
    f600:	e5d13005 	ldrb	r3, [r1, #5]
    f604:	e5ce3005 	strb	r3, [lr, #5]
    f608:	e5d13006 	ldrb	r3, [r1, #6]
    f60c:	e5ce3006 	strb	r3, [lr, #6]
    f610:	e5d13007 	ldrb	r3, [r1, #7]
    f614:	e2811008 	add	r1, r1, #8	; 0x8
    f618:	e5ce3007 	strb	r3, [lr, #7]
    f61c:	e28ee008 	add	lr, lr, #8	; 0x8
    f620:	caffffea 	bgt	0xf5d0
    f624:	e4d13001 	ldrb	r3, [r1], #1
    f628:	e2522001 	subs	r2, r2, #1	; 0x1
    f62c:	e4ce3001 	strb	r3, [lr], #1
    f630:	1afffffb 	bne	0xf624
    f634:	e596402c 	ldr	r4, [r6, #44]
    f638:	e586402c 	str	r4, [r6, #44]
    f63c:	e586e010 	str	lr, [r6, #16]
    f640:	e586b030 	str	fp, [r6, #48]
    f644:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    f648:	e12fff1e 	bx	lr
    f64c:	e3a03000 	mov	r3, #0	; 0x0
    f650:	e5863030 	str	r3, [r6, #48]
    f654:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    f658:	e12fff1e 	bx	lr
    f65c:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    f660:	e24ddf51 	sub	sp, sp, #324	; 0x144
    f664:	e1a05003 	mov	r5, r3
    f668:	e1a09001 	mov	r9, r1
    f66c:	e1a07000 	mov	r7, r0
    f670:	e59fe148 	ldr	lr, [pc, #328]	; 0xf7c0
    f674:	e59ee000 	ldr	lr, [lr]
    f678:	e58de140 	str	lr, [sp, #320]
    f67c:	e28de000 	add	lr, sp, #0	; 0x0
    f680:	e20e40ff 	and	r4, lr, #255	; 0xff
    f684:	e28dec01 	add	lr, sp, #256	; 0x100
    f688:	e04e4004 	sub	r4, lr, r4
    f68c:	e5847018 	str	r7, [r4, #24]
    f690:	e59d3164 	ldr	r3, [sp, #356]
    f694:	e1550002 	cmp	r5, r2
    f698:	c1a05002 	movgt	r5, r2
    f69c:	e1530002 	cmp	r3, r2
    f6a0:	0a000040 	beq	0xf7a8
    f6a4:	e3550000 	cmp	r5, #0	; 0x0
    f6a8:	0a00003e 	beq	0xf7a8
    f6ac:	e1520003 	cmp	r2, r3
    f6b0:	ba000036 	blt	0xf790
    f6b4:	e3530000 	cmp	r3, #0	; 0x0
    f6b8:	4a000034 	bmi	0xf790
    f6bc:	e3520008 	cmp	r2, #8	; 0x8
    f6c0:	da000032 	ble	0xf790
    f6c4:	e3530008 	cmp	r3, #8	; 0x8
    f6c8:	ba000030 	blt	0xf790
    f6cc:	e3520801 	cmp	r2, #65536	; 0x10000
    f6d0:	ca00002e 	bgt	0xf790
    f6d4:	e3550000 	cmp	r5, #0	; 0x0
    f6d8:	4a00002c 	bmi	0xf790
    f6dc:	e59d8160 	ldr	r8, [sp, #352]
    f6e0:	e0896005 	add	r6, r9, r5
    f6e4:	e0891002 	add	r1, r9, r2
    f6e8:	e088e003 	add	lr, r8, r3
    f6ec:	e0460009 	sub	r0, r6, r9
    f6f0:	e24e2001 	sub	r2, lr, #1	; 0x1
    f6f4:	e24e3003 	sub	r3, lr, #3	; 0x3
    f6f8:	e3500f42 	cmp	r0, #264	; 0x108
    f6fc:	e284c020 	add	ip, r4, #32	; 0x20
    f700:	e88c000c 	stm	ip, {r2, r3}
    f704:	82463f42 	subhi	r3, r6, #264	; 0x108
    f708:	e5849008 	str	r9, [r4, #8]
    f70c:	85843008 	strhi	r3, [r4, #8]
    f710:	e584701c 	str	r7, [r4, #28]
    f714:	e1a00004 	mov	r0, r4
    f718:	e5842028 	str	r2, [r4, #40]
    f71c:	e8840202 	stm	r4, {r1, r9}
    f720:	e04e3007 	sub	r3, lr, r7
    f724:	e35300e8 	cmp	r3, #232	; 0xe8
    f728:	824e30e8 	subhi	r3, lr, #232	; 0xe8
    f72c:	8584301c 	strhi	r3, [r4, #28]
    f730:	e584600c 	str	r6, [r4, #12]
    f734:	e584e014 	str	lr, [r4, #20]
    f738:	e5848018 	str	r8, [r4, #24]
    f73c:	e3a03000 	mov	r3, #0	; 0x0
    f740:	e5843030 	str	r3, [r4, #48]
    f744:	e5843034 	str	r3, [r4, #52]
    f748:	ebfffe2c 	bl	0xf000
    f74c:	e5943030 	ldr	r3, [r4, #48]
    f750:	e3530000 	cmp	r3, #0	; 0x0
    f754:	0a00000d 	beq	0xf790
    f758:	e594100c 	ldr	r1, [r4, #12]
    f75c:	e5943010 	ldr	r3, [r4, #16]
    f760:	e1530001 	cmp	r3, r1
    f764:	8a000009 	bhi	0xf790
    f768:	e594202c 	ldr	r2, [r4, #44]
    f76c:	e5943014 	ldr	r3, [r4, #20]
    f770:	e1520003 	cmp	r2, r3
    f774:	8a000005 	bhi	0xf790
    f778:	e5943000 	ldr	r3, [r4]
    f77c:	e1510003 	cmp	r1, r3
    f780:	1a000008 	bne	0xf7a8
    f784:	e5943034 	ldr	r3, [r4, #52]
    f788:	e3530000 	cmp	r3, #0	; 0x0
    f78c:	1a000005 	bne	0xf7a8
    f790:	e59d0140 	ldr	r0, [sp, #320]
    f794:	ebfff5e9 	bl	bcf40
    f798:	e3e00000 	mvn	r0, #0	; 0x0
    f79c:	e28ddf51 	add	sp, sp, #324	; 0x144
    f7a0:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    f7a4:	e12fff1e 	bx	lr
    f7a8:	e59d0140 	ldr	r0, [sp, #320]
    f7ac:	ebfff5e3 	bl	bcf40
    f7b0:	e1a00005 	mov	r0, r5
    f7b4:	e28ddf51 	add	sp, sp, #324	; 0x144
    f7b8:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    f7bc:	e12fff1e 	bx	lr
    f7c0:	8006c65c 	andhi	ip, r6, ip, asr r6
    f7c4:	e3a00001 	mov	r0, #1	; 0x1
    f7c8:	e12fff1e 	bx	lr
    f7cc:	b1600000 	cmnlt	r0, r0
    f7d0:	00000020 	andeq	r0, r0, r0, lsr #32
    f7d4:	00000021 	andeq	r0, r0, r1, lsr #32
    f7d8:	00000022 	andeq	r0, r0, r2, lsr #32
    f7dc:	00000023 	andeq	r0, r0, r3, lsr #32
    f7e0:	00000025 	andeq	r0, r0, r5, lsr #32
    f7e4:	00000027 	andeq	r0, r0, r7, lsr #32
    f7e8:	00000028 	andeq	r0, r0, r8, lsr #32
    f7ec:	00000029 	andeq	r0, r0, r9, lsr #32
    f7f0:	0000002a 	andeq	r0, r0, sl, lsr #32
    f7f4:	0000002b 	andeq	r0, r0, fp, lsr #32
    f7f8:	0000002f 	andeq	r0, r0, pc, lsr #32
    f7fc:	00000020 	andeq	r0, r0, r0, lsr #32
    f800:	00000021 	andeq	r0, r0, r1, lsr #32
    f804:	00000022 	andeq	r0, r0, r2, lsr #32
    f808:	00000023 	andeq	r0, r0, r3, lsr #32
    f80c:	00000025 	andeq	r0, r0, r5, lsr #32
    f810:	00000027 	andeq	r0, r0, r7, lsr #32
    f814:	00000028 	andeq	r0, r0, r8, lsr #32
    f818:	00000029 	andeq	r0, r0, r9, lsr #32
    f81c:	0000002a 	andeq	r0, r0, sl, lsr #32
    f820:	0000002b 	andeq	r0, r0, fp, lsr #32
    f824:	0000002f 	andeq	r0, r0, pc, lsr #32
    f828:	34343233 	ldrtcc	r3, [r4], #-563
    f82c:	31303030 	teqcc	r0, r0, lsr r0
	...
    f838:	00000020 	andeq	r0, r0, r0, lsr #32
    f83c:	00000021 	andeq	r0, r0, r1, lsr #32
    f840:	00000022 	andeq	r0, r0, r2, lsr #32
    f844:	00000023 	andeq	r0, r0, r3, lsr #32
    f848:	00000025 	andeq	r0, r0, r5, lsr #32
    f84c:	00000027 	andeq	r0, r0, r7, lsr #32
    f850:	00000028 	andeq	r0, r0, r8, lsr #32
    f854:	00000029 	andeq	r0, r0, r9, lsr #32
    f858:	0000002a 	andeq	r0, r0, sl, lsr #32
    f85c:	0000002b 	andeq	r0, r0, fp, lsr #32
    f860:	0000002f 	andeq	r0, r0, pc, lsr #32
    f864:	80023050 	andhi	r3, r2, r0, asr r0
    f868:	80022ff0 	strdhi	r2, [r2], -r0
    f86c:	80022f98 	mulhi	r2, r8, pc
    f870:	80022f38 	andhi	r2, r2, r8, lsr pc
    f874:	80022ec8 	andhi	r2, r2, r8, asr #29
    f878:	80022e70 	andhi	r2, r2, r0, ror lr
    f87c:	80022df8 	strdhi	r2, [r2], -r8
    f880:	80022da8 	andhi	r2, r2, r8, lsr #27
    f884:	80022d6c 	andhi	r2, r2, ip, ror #26
    f888:	80022d30 	andhi	r2, r2, r0, lsr sp
    f88c:	ffffffff 	undefined instruction 0xffffffff
    f890:	00000020 	andeq	r0, r0, r0, lsr #32
    f894:	00000021 	andeq	r0, r0, r1, lsr #32
    f898:	00000022 	andeq	r0, r0, r2, lsr #32
    f89c:	00000023 	andeq	r0, r0, r3, lsr #32
    f8a0:	00000025 	andeq	r0, r0, r5, lsr #32
    f8a4:	00000027 	andeq	r0, r0, r7, lsr #32
    f8a8:	00000028 	andeq	r0, r0, r8, lsr #32
    f8ac:	00000029 	andeq	r0, r0, r9, lsr #32
    f8b0:	0000002a 	andeq	r0, r0, sl, lsr #32
    f8b4:	0000002b 	andeq	r0, r0, fp, lsr #32
    f8b8:	0000002f 	andeq	r0, r0, pc, lsr #32
    f8bc:	a0020000 	andge	r0, r2, r0
    f8c0:	00000001 	andeq	r0, r0, r1
    f8c4:	00000020 	
    f8c8:	00000021 	
    f8cc:	00000022 	
    f8d0:	00000023 	
    f8d4:	00000025 	
    f8d8:	00000027 	
    f8dc:	00000028 	
    f8e0:	00000029 	
    f8e4:	0000002a 	
    f8e8:	0000002b 	
    f8ec:	0000002f 	
    f8f0:	ffffffff 	
    f8f4:	ffffffff 	
    f8f8:	012e0004 	
    f8fc:	00001000 	
    f900:	80021000 	
    f904:	00010005 	
    f908:	00010000 	
    f90c:	00013000 	
	...
    f918:	f8545d88 	undefined instruction 0xf8545d88
	...
    f934:	0000c000 	andeq	ip, r0, r0
    f938:	000003b0 	strheq	r0, [r0], -r0
    f93c:	0000aa00 	andeq	sl, r0, r0, lsl #20
    f940:	000004f8 	strdeq	r0, [r0], -r8
    f944:	00012000 	andeq	r2, r1, r0
    f948:	000002a8 	andeq	r0, r0, r8, lsr #5
    f94c:	00001270 	andeq	r1, r0, r0, ror r2
    f950:	0000001c 	andeq	r0, r0, ip, lsl r0
	...
    f964:	00000009 	andeq	r0, r0, r9
    f968:	00009080 	andeq	r9, r0, r0, lsl #1
    f96c:	00001000 	andeq	r1, r0, r0
    f970:	00009200 	andeq	r9, r0, r0, lsl #4
    f974:	80022000 	andhi	r2, r2, r0
    f978:	80022000 	andhi	r2, r2, r0
    f97c:	60000020 	andvs	r0, r0, r0, lsr #32
    f980:	000007cc 	andeq	r0, r0, ip, asr #15
    f984:	0000b000 	andeq	fp, r0, r0
    f988:	00000800 	andeq	r0, r0, r0, lsl #16
    f98c:	8002c000 	andhi	ip, r2, r0
    f990:	8002c000 	andhi	ip, r2, r0
    f994:	60000020 	andvs	r0, r0, r0, lsr #32
    f998:	00004ea0 	andeq	r4, r0, r0, lsr #29
    f99c:	0000c000 	andeq	ip, r0, r0
    f9a0:	0000012c 	andeq	r0, r0, ip, lsr #2
    f9a4:	8002c7cc 	andhi	ip, r2, ip, asr #15
    f9a8:	80069000 	andhi	r9, r6, r0
    f9ac:	c0000040 	andgt	r0, r0, r0, asr #32
    f9b0:	000003b0 	strheq	r0, [r0], -r0
    f9b4:	0000c000 	andeq	ip, r0, r0
    f9b8:	00000400 	andeq	r0, r0, r0, lsl #8
    f9bc:	8002d000 	andhi	sp, r2, r0
    f9c0:	80032000 	andhi	r2, r3, r0
    f9c4:	40000040
*/
.xf9c8:	.string "nk.exe"
.align 4
/* 	
    f9cc:	00006578 	andeq	r6, r0, r8, ror r5
    f9d0:	02000000 	andeq	r0, r0, #0	; 0x0
    f9d4:	02000000 	andeq	r0, r0, #0	; 0x0
    f9d8:	80021000 	andhi	r1, r2, r0
    f9dc:	8002d3b0 	strhhi	sp, [r2], -r0
    f9e0:	00000001 	andeq	r0, r0, r1
    f9e4:	80069000 	andhi	r9, r6, r0
    f9e8:	8006e000 	andhi	lr, r6, r0
    f9ec:	8006f000 	andhi	pc, r6, r0
    f9f0:	00000001 	andeq	r0, r0, r1
    f9f4:	8002ca44 	andhi	ip, r2, r4, asr #20
	...
    fa08:	80808080 	addhi	r8, r0, r0, lsl #1
	...
    fa14:	000201c2 	andeq	r0, r2, r2, asr #3
	...
    fa24:	00000001 	andeq	r0, r0, r1
    fa28:	e66c8425 	strbt	r8, [ip], -r5, lsr #8
    fa2c:	01c78ca3 	biceq	r8, r7, r3, lsr #25
    fa30:	0000aef8 	strdeq	sl, [r0], -r8
    fa34:	8002c9c8 	andhi	ip, r2, r8, asr #19
    fa38:	8002c8f8 	strdhi	ip, [r2], -r8
    fa3c:	8002c968 	andhi	ip, r2, r8, ror #18
    fa40:	80021000 	andhi	r1, r2, r0
    fa44:	8002c7cc 	andhi	ip, r2, ip, asr #15
    fa48:	80069000 	andhi	r9, r6, r0
    fa4c:	0000012c 	andeq	r0, r0, ip, lsr #2
    fa50:	00004ea0 	andeq	r4, r0, r0, lsr #29
	...
   10000:	800231a0 	andhi	r3, r2, r0, lsr #3
   10004:	40000501 	andmi	r0, r0, r1, lsl #10
   10008:	800231b4 	strhhi	r3, [r2], -r4
   1000c:	40002301 	andmi	r2, r0, r1, lsl #6
   10010:	80023240 	andhi	r3, r2, r0, asr #4
   10014:	40001801 	andmi	r1, r0, r1, lsl #16
   10018:	800232a0 	andhi	r3, r2, r0, lsr #5
   1001c:	40003e01 	andmi	r3, r0, r1, lsl #28
   10020:	80023398 	mulhi	r2, r8, r3
   10024:	40001f02 	andmi	r1, r0, r2, lsl #30
   10028:	80023414 	andhi	r3, r2, r4, lsl r4
   1002c:	40003502 	andmi	r3, r0, r2, lsl #10
   10030:	800234e8 	andhi	r3, r2, r8, ror #9
   10034:	40000900 	andmi	r0, r0, r0, lsl #18
   10038:	8002350c 	andhi	r3, r2, ip, lsl #10
   1003c:	40016e01 	andmi	r6, r1, r1, lsl #28
   10040:	80023ac4 	andhi	r3, r2, r4, asr #21
   10044:	40011f01 	andmi	r1, r1, r1, lsl #30
   10048:	80023f40 	andhi	r3, r2, r0, asr #30
   1004c:	40003202 	andmi	r3, r0, r2, lsl #4
   10050:	80024008 	andhi	r4, r2, r8
   10054:	40001801 	andmi	r1, r0, r1, lsl #16
   10058:	80024068 	andhi	r4, r2, r8, rrx
   1005c:	40008801 	andmi	r8, r0, r1, lsl #16
   10060:	80024288 	andhi	r4, r2, r8, lsl #5
   10064:	40007901 	andmi	r7, r0, r1, lsl #18
   10068:	8002446c 	andhi	r4, r2, ip, ror #8
   1006c:	40012c02 	andmi	r2, r1, r2, lsl #24
   10070:	8002491c 	andhi	r4, r2, ip, lsl r9
   10074:	40002701 	andmi	r2, r0, r1, lsl #14
   10078:	800249b8 	strhhi	r4, [r2], -r8
   1007c:	40000100 	andmi	r0, r0, r0, lsl #2
   10080:	800249bc 	strhhi	r4, [r2], -ip
   10084:	40000100 	andmi	r0, r0, r0, lsl #2
   10088:	800249c0 	andhi	r4, r2, r0, asr #19
   1008c:	40000600 	andmi	r0, r0, r0, lsl #12
   10090:	80024a24 	andhi	r4, r2, r4, lsr #20
   10094:	40004801 	andmi	r4, r0, r1, lsl #16
   10098:	80024b44 	andhi	r4, r2, r4, asr #22
   1009c:	40001f01 	andmi	r1, r0, r1, lsl #30
   100a0:	80024bc0 	andhi	r4, r2, r0, asr #23
   100a4:	40003502 	andmi	r3, r0, r2, lsl #10
   100a8:	80024c94 	mulhi	r2, r4, ip
   100ac:	40000200 	andmi	r0, r0, r0, lsl #4
   100b0:	80024c9c 	mulhi	r2, ip, ip
   100b4:	40001401 	andmi	r1, r0, r1, lsl #8
   100b8:	80024cec 	andhi	r4, r2, ip, ror #25
   100bc:	40004502 	andmi	r4, r0, r2, lsl #10
   100c0:	80024e00 	andhi	r4, r2, r0, lsl #28
   100c4:	40002201 	andmi	r2, r0, r1, lsl #4
   100c8:	80024e88 	andhi	r4, r2, r8, lsl #29
   100cc:	40005d02 	andmi	r5, r0, r2, lsl #26
   100d0:	80024ffc 	strdhi	r4, [r2], -ip
   100d4:	4000f302 	andmi	pc, r0, r2, lsl #6
   100d8:	800253c8 	andhi	r5, r2, r8, asr #7
   100dc:	40000c01 	andmi	r0, r0, r1, lsl #24
   100e0:	800253f8 	strdhi	r5, [r2], -r8
   100e4:	40001201 	andmi	r1, r0, r1, lsl #4
   100e8:	80025440 	andhi	r5, r2, r0, asr #8
   100ec:	40000f01 	andmi	r0, r0, r1, lsl #30
   100f0:	8002547c 	andhi	r5, r2, ip, ror r4
   100f4:	40005b03 	andmi	r5, r0, r3, lsl #22
   100f8:	800255e8 	andhi	r5, r2, r8, ror #11
   100fc:	40000401 	andmi	r0, r0, r1, lsl #8
   10100:	800255f8 	strdhi	r5, [r2], -r8
   10104:	40000a02 	andmi	r0, r0, r2, lsl #20
   10108:	80025620 	andhi	r5, r2, r0, lsr #12
   1010c:	40002204 	andmi	r2, r0, r4, lsl #4
   10110:	800256a8 	andhi	r5, r2, r8, lsr #13
   10114:	40004802 	andmi	r4, r0, r2, lsl #16
   10118:	800257c8 	andhi	r5, r2, r8, asr #15
   1011c:	40002001 	andmi	r2, r0, r1
   10120:	80025848 	andhi	r5, r2, r8, asr #16
   10124:	40002e01 	andmi	r2, r0, r1, lsl #28
   10128:	80025900 	andhi	r5, r2, r0, lsl #18
   1012c:	40002b01 	andmi	r2, r0, r1, lsl #22
   10130:	800259ac 	andhi	r5, r2, ip, lsr #19
   10134:	40003a01 	andmi	r3, r0, r1, lsl #20
   10138:	80025a94 	mulhi	r2, r4, sl
   1013c:	40002001 	andmi	r2, r0, r1
   10140:	80025b14 	andhi	r5, r2, r4, lsl fp
   10144:	40002001 	andmi	r2, r0, r1
   10148:	80025b94 	mulhi	r2, r4, fp
   1014c:	40009502 	andmi	r9, r0, r2, lsl #10
   10150:	80025de8 	andhi	r5, r2, r8, ror #27
   10154:	40001a01 	andmi	r1, r0, r1, lsl #20
   10158:	80025e50 	andhi	r5, r2, r0, asr lr
   1015c:	40003201 	andmi	r3, r0, r1, lsl #4
   10160:	80025f18 	andhi	r5, r2, r8, lsl pc
   10164:	40003e01 	andmi	r3, r0, r1, lsl #28
   10168:	80026010 	andhi	r6, r2, r0, lsl r0
   1016c:	40004b01 	andmi	r4, r0, r1, lsl #22
   10170:	8002613c 	andhi	r6, r2, ip, lsr r1
   10174:	40006e02 	andmi	r6, r0, r2, lsl #28
   10178:	800262f4 	strdhi	r6, [r2], -r4
   1017c:	40003d01 	andmi	r3, r0, r1, lsl #26
   10180:	800263e8 	andhi	r6, r2, r8, ror #7
   10184:	40008402 	andmi	r8, r0, r2, lsl #8
   10188:	800265f8 	strdhi	r6, [r2], -r8
   1018c:	40006f02 	andmi	r6, r0, r2, lsl #30
   10190:	800267b4 	strhhi	r6, [r2], -r4
   10194:	40002201 	andmi	r2, r0, r1, lsl #4
   10198:	8002683c 	andhi	r6, r2, ip, lsr r8
   1019c:	40002402 	andmi	r2, r0, r2, lsl #8
   101a0:	800268cc 	andhi	r6, r2, ip, asr #17
   101a4:	40005802 	andmi	r5, r0, r2, lsl #16
   101a8:	80026a2c 	andhi	r6, r2, ip, lsr #20
   101ac:	40003b02 	andmi	r3, r0, r2, lsl #22
   101b0:	80026b18 	andhi	r6, r2, r8, lsl fp
   101b4:	40000c01 	andmi	r0, r0, r1, lsl #24
   101b8:	80026b48 	andhi	r6, r2, r8, asr #22
   101bc:	40006701 	andmi	r6, r0, r1, lsl #14
   101c0:	80026ce4 	andhi	r6, r2, r4, ror #25
   101c4:	40008502 	andmi	r8, r0, r2, lsl #10
   101c8:	80026ef8 	strdhi	r6, [r2], -r8
   101cc:	40004002 	andmi	r4, r0, r2
   101d0:	80026ff8 	strdhi	r6, [r2], -r8
   101d4:	40000701 	andmi	r0, r0, r1, lsl #14
   101d8:	80027014 	andhi	r7, r2, r4, lsl r0
   101dc:	40000701 	andmi	r0, r0, r1, lsl #14
   101e0:	80027030 	andhi	r7, r2, r0, lsr r0
   101e4:	40000501 	andmi	r0, r0, r1, lsl #10
   101e8:	80027044 	andhi	r7, r2, r4, asr #32
   101ec:	40001401 	andmi	r1, r0, r1, lsl #8
   101f0:	80027094 	mulhi	r2, r4, r0
   101f4:	40000100 	andmi	r0, r0, r0, lsl #2
   101f8:	80027098 	mulhi	r2, r8, r0
   101fc:	40000100 	andmi	r0, r0, r0, lsl #2
   10200:	8002709c 	mulhi	r2, ip, r0
   10204:	40004201 	andmi	r4, r0, r1, lsl #4
   10208:	800271a4 	andhi	r7, r2, r4, lsr #3
   1020c:	40005001 	andmi	r5, r0, r1
   10210:	800272e4 	andhi	r7, r2, r4, ror #5
   10214:	4000a602 	andmi	sl, r0, r2, lsl #12
   10218:	8002757c 	andhi	r7, r2, ip, ror r5
   1021c:	40001802 	andmi	r1, r0, r2, lsl #16
   10220:	800275dc 	ldrdhi	r7, [r2], -ip
   10224:	40003b01 	andmi	r3, r0, r1, lsl #22
   10228:	800276c8 	andhi	r7, r2, r8, asr #13
   1022c:	4000a002 	andmi	sl, r0, r2
   10230:	80027948 	andhi	r7, r2, r8, asr #18
   10234:	40004901 	andmi	r4, r0, r1, lsl #18
   10238:	80027a6c 	andhi	r7, r2, ip, ror #20
   1023c:	40004901 	andmi	r4, r0, r1, lsl #18
   10240:	80027b90 	mulhi	r2, r0, fp
   10244:	40001a01 	andmi	r1, r0, r1, lsl #20
   10248:	80027bf8 	strdhi	r7, [r2], -r8
   1024c:	40004902 	andmi	r4, r0, r2, lsl #18
   10250:	80027d1c 	andhi	r7, r2, ip, lsl sp
   10254:	40005002 	andmi	r5, r0, r2
   10258:	80027e5c 	andhi	r7, r2, ip, asr lr
   1025c:	4000cd02 	andmi	ip, r0, r2, lsl #26
   10260:	80028190 	mulhi	r2, r0, r1
   10264:	40001702 	andmi	r1, r0, r2, lsl #14
   10268:	800281ec 	andhi	r8, r2, ip, ror #3
   1026c:	40003701 	andmi	r3, r0, r1, lsl #14
   10270:	800282c8 	andhi	r8, r2, r8, asr #5
   10274:	4000a302 	andmi	sl, r0, r2, lsl #6
   10278:	80028554 	andhi	r8, r2, r4, asr r5
   1027c:	40004001 	andmi	r4, r0, r1
   10280:	80028654 	andhi	r8, r2, r4, asr r6
   10284:	40004001 	andmi	r4, r0, r1
   10288:	80028754 	andhi	r8, r2, r4, asr r7
   1028c:	40001a01 	andmi	r1, r0, r1, lsl #20
   10290:	800287bc 	strhhi	r8, [r2], -ip
   10294:	40006002 	andmi	r6, r0, r2
   10298:	8002893c 	andhi	r8, r2, ip, lsr r9
   1029c:	40006802 	andmi	r6, r0, r2, lsl #16
   102a0:	80028adc 	ldrdhi	r8, [r2], -ip
   102a4:	40009301 	andmi	r9, r0, r1, lsl #6
   102a8:	80028d28 	andhi	r8, r2, r8, lsr #26
   102ac:	40001301 	andmi	r1, r0, r1, lsl #6
   102b0:	80028d74 	andhi	r8, r2, r4, ror sp
   102b4:	40001b01 	andmi	r1, r0, r1, lsl #22
   102b8:	80028de0 	andhi	r8, r2, r0, ror #27
   102bc:	40003201 	andmi	r3, r0, r1, lsl #4
   102c0:	80028ea8 	andhi	r8, r2, r8, lsr #29
   102c4:	40002b01 	andmi	r2, r0, r1, lsl #22
   102c8:	80028f54 	andhi	r8, r2, r4, asr pc
   102cc:	40002f01 	andmi	r2, r0, r1, lsl #30
   102d0:	80029010 	andhi	r9, r2, r0, lsl r0
   102d4:	40005201 	andmi	r5, r0, r1, lsl #4
   102d8:	80029158 	andhi	r9, r2, r8, asr r1
   102dc:	40005402 	andmi	r5, r0, r2, lsl #8
   102e0:	80029324 	andhi	r9, r2, r4, lsr #6
   102e4:	40000300 	andmi	r0, r0, r0, lsl #6
   102e8:	80029330 	andhi	r9, r2, r0, lsr r3
   102ec:	40000200 	andmi	r0, r0, r0, lsl #4
   102f0:	80029338 	andhi	r9, r2, r8, lsr r3
   102f4:	40000801 	andmi	r0, r0, r1, lsl #16
   102f8:	80029358 	andhi	r9, r2, r8, asr r3
   102fc:	40007901 	andmi	r7, r0, r1, lsl #18
   10300:	8002953c 	andhi	r9, r2, ip, lsr r5
   10304:	40003a01 	andmi	r3, r0, r1, lsl #20
   10308:	80029624 	andhi	r9, r2, r4, lsr #12
   1030c:	4000af03 	andmi	sl, r0, r3, lsl #30
   10310:	800298e0 	andhi	r9, r2, r0, ror #17
   10314:	40003201 	andmi	r3, r0, r1, lsl #4
   10318:	800299a8 	andhi	r9, r2, r8, lsr #19
   1031c:	40001801 	andmi	r1, r0, r1, lsl #16
   10320:	80029a08 	andhi	r9, r2, r8, lsl #20
   10324:	40005701 	andmi	r5, r0, r1, lsl #14
   10328:	80029b64 	andhi	r9, r2, r4, ror #22
   1032c:	40001301 	andmi	r1, r0, r1, lsl #6
   10330:	80029bb0 	strhhi	r9, [r2], -r0
   10334:	40002b01 	andmi	r2, r0, r1, lsl #22
   10338:	80029c5c 	andhi	r9, r2, ip, asr ip
   1033c:	40001401 	andmi	r1, r0, r1, lsl #8
   10340:	80029cac 	andhi	r9, r2, ip, lsr #25
   10344:	40008a02 	andmi	r8, r0, r2, lsl #20
   10348:	80029ed4 	ldrdhi	r9, [r2], -r4
   1034c:	40001b01 	andmi	r1, r0, r1, lsl #22
   10350:	80029f40 	andhi	r9, r2, r0, asr #30
   10354:	40000100 	andmi	r0, r0, r0, lsl #2
   10358:	80029f44 	andhi	r9, r2, r4, asr #30
   1035c:	40002200 	andmi	r2, r0, r0, lsl #4
   10360:	8002a1ac 	andhi	sl, r2, ip, lsr #3
   10364:	4000eb01 	andmi	lr, r0, r1, lsl #22
   10368:	8002a558 	andhi	sl, r2, r8, asr r5
   1036c:	40026d01 	andmi	r6, r2, r1, lsl #26
   10370:	8002af0c 	andhi	sl, r2, ip, lsl #30
   10374:	40003300 	andmi	r3, r0, r0, lsl #6
   10378:	8002afd8 	ldrdhi	sl, [r2], -r8
   1037c:	40000d01 	andmi	r0, r0, r1, lsl #26
   10380:	8002b00c 	andhi	fp, r2, ip
   10384:	40000100 	andmi	r0, r0, r0, lsl #2
   10388:	8002b010 	andhi	fp, r2, r0, lsl r0
   1038c:	40001801 	andmi	r1, r0, r1, lsl #16
   10390:	8002b070 	andhi	fp, r2, r0, ror r0
   10394:	40000400 	andmi	r0, r0, r0, lsl #8
   10398:	8002c000 	andhi	ip, r2, r0
   1039c:	40019701 	andmi	r9, r1, r1, lsl #14
   103a0:	8002c65c 	andhi	ip, r2, ip, asr r6
   103a4:	40005a02 	andmi	r5, r0, r2, lsl #20
   103a8:	8002c7c4 	andhi	ip, r2, r4, asr #15
   103ac:	40000200 	andmi	r0, r0, r0, lsl #4
	.
*/
