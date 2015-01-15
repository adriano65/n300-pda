
u-boot:     file format elf32-littlearm

Disassembly of section .text:

33f80000 <_start>:
33f80000:	ea000012 	b	33f80050 <reset>
33f80004:	e59ff014 	ldr	pc, [pc, #20]	; 33f80020 <_undefined_instruction>
33f80008:	e59ff014 	ldr	pc, [pc, #20]	; 33f80024 <_software_interrupt>
33f8000c:	e59ff014 	ldr	pc, [pc, #20]	; 33f80028 <_prefetch_abort>
33f80010:	e59ff014 	ldr	pc, [pc, #20]	; 33f8002c <_data_abort>
33f80014:	e59ff014 	ldr	pc, [pc, #20]	; 33f80030 <_not_used>
33f80018:	e59ff014 	ldr	pc, [pc, #20]	; 33f80034 <_irq>
33f8001c:	e59ff014 	ldr	pc, [pc, #20]	; 33f80038 <_fiq>

33f80020 <_undefined_instruction>:
33f80020:	33f80240 	mvnccs	r0, #4	; 0x4

33f80024 <_software_interrupt>:
33f80024:	33f802a0 	mvnccs	r0, #10	; 0xa

33f80028 <_prefetch_abort>:
33f80028:	33f80300 	mvnccs	r0, #0	; 0x0

33f8002c <_data_abort>:
33f8002c:	33f80360 	mvnccs	r0, #-2147483647	; 0x80000001

33f80030 <_not_used>:
33f80030:	33f803c0 	mvnccs	r0, #3	; 0x3

33f80034 <_irq>:
33f80034:	33f80420 	mvnccs	r0, #536870912	; 0x20000000

33f80038 <_fiq>:
33f80038:	33f80480 	mvnccs	r0, #-2147483648	; 0x80000000
33f8003c:	deadbeef 	cdple	14, 10, cr11, cr13, cr15, {7}

33f80040 <_TEXT_BASE>:
33f80040:	33f80000 	mvnccs	r0, #0	; 0x0

33f80044 <_armboot_start>:
33f80044:	33f80000 	mvnccs	r0, #0	; 0x0

33f80048 <_bss_start>:
33f80048:	33f96228 	mvnccs	r6, #-2147483646	; 0x80000002

33f8004c <_bss_end>:
33f8004c:	33fc7ebc 	mvnccs	r7, #3008	; 0xbc0

33f80050 <reset>:
33f80050:	e10f0000 	mrs	r0, CPSR
33f80054:	e3c0001f 	bic	r0, r0, #31	; 0x1f
33f80058:	e38000d3 	orr	r0, r0, #211	; 0xd3
33f8005c:	e129f000 	msr	CPSR_fc, r0
33f80060:	e59f0470 	ldr	r0, [pc, #1136]	; 33f804d8 <.text+0x4d8>
33f80064:	e59f1470 	ldr	r1, [pc, #1136]	; 33f804dc <.text+0x4dc>
33f80068:	e5801000 	str	r1, [r0]
33f8006c:	e3a00456 	mov	r0, #1442840576	; 0x56000000
33f80070:	e59f1468 	ldr	r1, [pc, #1128]	; 33f804e0 <.text+0x4e0>
33f80074:	e5801000 	str	r1, [r0]
33f80078:	e59f0464 	ldr	r0, [pc, #1124]	; 33f804e4 <.text+0x4e4>
33f8007c:	e59f1464 	ldr	r1, [pc, #1124]	; 33f804e8 <.text+0x4e8>
33f80080:	e5801000 	str	r1, [r0]
33f80084:	e59f0460 	ldr	r0, [pc, #1120]	; 33f804ec <.text+0x4ec>
33f80088:	e59f1460 	ldr	r1, [pc, #1120]	; 33f804f0 <.text+0x4f0>
33f8008c:	e5801000 	str	r1, [r0]
33f80090:	e59f045c 	ldr	r0, [pc, #1116]	; 33f804f4 <.text+0x4f4>
33f80094:	e59f145c 	ldr	r1, [pc, #1116]	; 33f804f8 <.text+0x4f8>
33f80098:	e5801000 	str	r1, [r0]
33f8009c:	e59f0458 	ldr	r0, [pc, #1112]	; 33f804fc <.text+0x4fc>
33f800a0:	e59f1458 	ldr	r1, [pc, #1112]	; 33f80500 <.text+0x500>
33f800a4:	e5801000 	str	r1, [r0]
33f800a8:	e59f0454 	ldr	r0, [pc, #1108]	; 33f80504 <.text+0x504>
33f800ac:	e3a01012 	mov	r1, #18	; 0x12
33f800b0:	e5801000 	str	r1, [r0]
33f800b4:	e59f044c 	ldr	r0, [pc, #1100]	; 33f80508 <.text+0x508>
33f800b8:	e59f144c 	ldr	r1, [pc, #1100]	; 33f8050c <.text+0x50c>
33f800bc:	e5801000 	str	r1, [r0]
33f800c0:	e59f0448 	ldr	r0, [pc, #1096]	; 33f80510 <.text+0x510>
33f800c4:	e59f1448 	ldr	r1, [pc, #1096]	; 33f80514 <.text+0x514>
33f800c8:	e5801000 	str	r1, [r0]
33f800cc:	e59f0444 	ldr	r0, [pc, #1092]	; 33f80518 <.text+0x518>
33f800d0:	e3a01a01 	mov	r1, #4096	; 0x1000
33f800d4:	e5801000 	str	r1, [r0]
33f800d8:	e59f043c 	ldr	r0, [pc, #1084]	; 33f8051c <.text+0x51c>
33f800dc:	e59f143c 	ldr	r1, [pc, #1084]	; 33f80520 <.text+0x520>
33f800e0:	e5801000 	str	r1, [r0]
33f800e4:	e59f0438 	ldr	r0, [pc, #1080]	; 33f80524 <.text+0x524>
33f800e8:	e59f1410 	ldr	r1, [pc, #1040]	; 33f80500 <.text+0x500>
33f800ec:	e5801000 	str	r1, [r0]
33f800f0:	e59f0430 	ldr	r0, [pc, #1072]	; 33f80528 <.text+0x528>
33f800f4:	e3a01000 	mov	r1, #0	; 0x0
33f800f8:	e5801000 	str	r1, [r0]
33f800fc:	e59f0428 	ldr	r0, [pc, #1064]	; 33f8052c <.text+0x52c>
33f80100:	e59f1428 	ldr	r1, [pc, #1064]	; 33f80530 <.text+0x530>
33f80104:	e5801000 	str	r1, [r0]
33f80108:	e59f0424 	ldr	r0, [pc, #1060]	; 33f80534 <.text+0x534>
33f8010c:	e3a010ff 	mov	r1, #255	; 0xff
33f80110:	e5801000 	str	r1, [r0]
33f80114:	e59f041c 	ldr	r0, [pc, #1052]	; 33f80538 <.text+0x538>
33f80118:	e3a01000 	mov	r1, #0	; 0x0
33f8011c:	e5801000 	str	r1, [r0]
33f80120:	e59f0414 	ldr	r0, [pc, #1044]	; 33f8053c <.text+0x53c>
33f80124:	e3a01002 	mov	r1, #2	; 0x2
33f80128:	e5801000 	str	r1, [r0]
33f8012c:	e59f040c 	ldr	r0, [pc, #1036]	; 33f80540 <.text+0x540>
33f80130:	e59f13c8 	ldr	r1, [pc, #968]	; 33f80500 <.text+0x500>
33f80134:	e5801000 	str	r1, [r0]
33f80138:	e59f0404 	ldr	r0, [pc, #1028]	; 33f80544 <.text+0x544>
33f8013c:	e3a01000 	mov	r1, #0	; 0x0
33f80140:	e5801000 	str	r1, [r0]
33f80144:	e59f03fc 	ldr	r0, [pc, #1020]	; 33f80548 <.text+0x548>
33f80148:	e59f13fc 	ldr	r1, [pc, #1020]	; 33f8054c <.text+0x54c>
33f8014c:	e5801000 	str	r1, [r0]
33f80150:	e59f03f8 	ldr	r0, [pc, #1016]	; 33f80550 <.text+0x550>
33f80154:	e59f13f8 	ldr	r1, [pc, #1016]	; 33f80554 <.text+0x554>
33f80158:	e5801000 	str	r1, [r0]
33f8015c:	e59f03f4 	ldr	r0, [pc, #1012]	; 33f80558 <.text+0x558>
33f80160:	e3a01c02 	mov	r1, #512	; 0x200
33f80164:	e5801000 	str	r1, [r0]
33f80168:	e59f03ec 	ldr	r0, [pc, #1004]	; 33f8055c <.text+0x55c>
33f8016c:	e59f13ec 	ldr	r1, [pc, #1004]	; 33f80560 <.text+0x560>
33f80170:	e5801000 	str	r1, [r0]
33f80174:	e59f03e8 	ldr	r0, [pc, #1000]	; 33f80564 <.text+0x564>
33f80178:	e59f1368 	ldr	r1, [pc, #872]	; 33f804e8 <.text+0x4e8>
33f8017c:	e5801000 	str	r1, [r0]
33f80180:	e59f03e0 	ldr	r0, [pc, #992]	; 33f80568 <.text+0x568>
33f80184:	e59f135c 	ldr	r1, [pc, #860]	; 33f804e8 <.text+0x4e8>
33f80188:	e5801000 	str	r1, [r0]
33f8018c:	e59f03d8 	ldr	r0, [pc, #984]	; 33f8056c <.text+0x56c>
33f80190:	e59f13d8 	ldr	r1, [pc, #984]	; 33f80570 <.text+0x570>
33f80194:	e5801000 	str	r1, [r0]
33f80198:	e3a00453 	mov	r0, #1392508928	; 0x53000000
33f8019c:	e3a01000 	mov	r1, #0	; 0x0
33f801a0:	e5801000 	str	r1, [r0]
33f801a4:	e59f03c8 	ldr	r0, [pc, #968]	; 33f80574 <.text+0x574>
33f801a8:	e3e01000 	mvn	r1, #0	; 0x0
33f801ac:	e5801000 	str	r1, [r0]
33f801b0:	e59f03c0 	ldr	r0, [pc, #960]	; 33f80578 <.text+0x578>
33f801b4:	e3e01000 	mvn	r1, #0	; 0x0
33f801b8:	e5801000 	str	r1, [r0]
33f801bc:	e59f0358 	ldr	r0, [pc, #856]	; 33f8051c <.text+0x51c>
33f801c0:	e590a000 	ldr	sl, [r0]
33f801c4:	e31a0040 	tst	sl, #64	; 0x40
33f801c8:	0a000001 	beq	33f801d4 <GPDDAT_notok>
33f801cc:	e3a01007 	mov	r1, #7	; 0x7
33f801d0:	ea000000 	b	33f801d8 <GPDDAT_ok>

33f801d4 <GPDDAT_notok>:
33f801d4:	e3a01007 	mov	r1, #7	; 0x7

33f801d8 <GPDDAT_ok>:
33f801d8:	e59f039c 	ldr	r0, [pc, #924]	; 33f8057c <.text+0x57c>
33f801dc:	e5801000 	str	r1, [r0]
33f801e0:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
33f801e4:	e3800103 	orr	r0, r0, #-1073741824	; 0xc0000000
33f801e8:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
33f801ec:	e3a00313 	mov	r0, #1275068416	; 0x4c000000
33f801f0:	e3e014ff 	mvn	r1, #-16777216	; 0xff000000
33f801f4:	e5801000 	str	r1, [r0]

33f801f8 <stack_setup>:
33f801f8:	e51f01c0 	ldr	r0, [pc, #-448]	; 33f80040 <_TEXT_BASE>
33f801fc:	e2400909 	sub	r0, r0, #147456	; 0x24000
33f80200:	e2400080 	sub	r0, r0, #128	; 0x80
33f80204:	e240d00c 	sub	sp, r0, #12	; 0xc

33f80208 <clear_bss>:
33f80208:	e51f01c8 	ldr	r0, [pc, #-456]	; 33f80048 <_bss_start>
33f8020c:	e51f11c8 	ldr	r1, [pc, #-456]	; 33f8004c <_bss_end>
33f80210:	e3a02000 	mov	r2, #0	; 0x0

33f80214 <clbss_l>:
33f80214:	e5802000 	str	r2, [r0]
33f80218:	e2800004 	add	r0, r0, #4	; 0x4
33f8021c:	e1500001 	cmp	r0, r1
33f80220:	dafffffb 	ble	33f80214 <clbss_l>
33f80224:	e51ff004 	ldr	pc, [pc, #-4]	; 33f80228 <_start_armboot>

33f80228 <_start_armboot>:
33f80228:	33f80d6c 	mvnccs	r0, #6912	; 0x1b00
	...

33f80240 <undefined_instruction>:
33f80240:	e51fd204 	ldr	sp, [pc, #-516]	; 33f80044 <_armboot_start>
33f80244:	e24dd911 	sub	sp, sp, #278528	; 0x44000
33f80248:	e24dd088 	sub	sp, sp, #136	; 0x88
33f8024c:	e58de000 	str	lr, [sp]
33f80250:	e14fe000 	mrs	lr, SPSR
33f80254:	e58de004 	str	lr, [sp, #4]
33f80258:	e3a0d013 	mov	sp, #19	; 0x13
33f8025c:	e169f00d 	msr	SPSR_fc, sp
33f80260:	e1a0e00f 	mov	lr, pc
33f80264:	e1b0f00e 	movs	pc, lr
33f80268:	e24dd048 	sub	sp, sp, #72	; 0x48
33f8026c:	e88d1fff 	stmia	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
33f80270:	e51f2234 	ldr	r2, [pc, #-564]	; 33f80044 <_armboot_start>
33f80274:	e2422911 	sub	r2, r2, #278528	; 0x44000
33f80278:	e2422088 	sub	r2, r2, #136	; 0x88
33f8027c:	e892000c 	ldmia	r2, {r2, r3}
33f80280:	e28d0048 	add	r0, sp, #72	; 0x48
33f80284:	e28d5034 	add	r5, sp, #52	; 0x34
33f80288:	e1a0100e 	mov	r1, lr
33f8028c:	e885000f 	stmia	r5, {r0, r1, r2, r3}
33f80290:	e1a0000d 	mov	r0, sp
33f80294:	eb000148 	bl	33f807bc <do_undefined_instruction>
	...

33f802a0 <software_interrupt>:
33f802a0:	e51fd264 	ldr	sp, [pc, #-612]	; 33f80044 <_armboot_start>
33f802a4:	e24dd911 	sub	sp, sp, #278528	; 0x44000
33f802a8:	e24dd088 	sub	sp, sp, #136	; 0x88
33f802ac:	e58de000 	str	lr, [sp]
33f802b0:	e14fe000 	mrs	lr, SPSR
33f802b4:	e58de004 	str	lr, [sp, #4]
33f802b8:	e3a0d013 	mov	sp, #19	; 0x13
33f802bc:	e169f00d 	msr	SPSR_fc, sp
33f802c0:	e1a0e00f 	mov	lr, pc
33f802c4:	e1b0f00e 	movs	pc, lr
33f802c8:	e24dd048 	sub	sp, sp, #72	; 0x48
33f802cc:	e88d1fff 	stmia	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
33f802d0:	e51f2294 	ldr	r2, [pc, #-660]	; 33f80044 <_armboot_start>
33f802d4:	e2422911 	sub	r2, r2, #278528	; 0x44000
33f802d8:	e2422088 	sub	r2, r2, #136	; 0x88
33f802dc:	e892000c 	ldmia	r2, {r2, r3}
33f802e0:	e28d0048 	add	r0, sp, #72	; 0x48
33f802e4:	e28d5034 	add	r5, sp, #52	; 0x34
33f802e8:	e1a0100e 	mov	r1, lr
33f802ec:	e885000f 	stmia	r5, {r0, r1, r2, r3}
33f802f0:	e1a0000d 	mov	r0, sp
33f802f4:	eb000127 	bl	33f80798 <do_software_interrupt>
	...

33f80300 <prefetch_abort>:
33f80300:	e51fd2c4 	ldr	sp, [pc, #-708]	; 33f80044 <_armboot_start>
33f80304:	e24dd911 	sub	sp, sp, #278528	; 0x44000
33f80308:	e24dd088 	sub	sp, sp, #136	; 0x88
33f8030c:	e58de000 	str	lr, [sp]
33f80310:	e14fe000 	mrs	lr, SPSR
33f80314:	e58de004 	str	lr, [sp, #4]
33f80318:	e3a0d013 	mov	sp, #19	; 0x13
33f8031c:	e169f00d 	msr	SPSR_fc, sp
33f80320:	e1a0e00f 	mov	lr, pc
33f80324:	e1b0f00e 	movs	pc, lr
33f80328:	e24dd048 	sub	sp, sp, #72	; 0x48
33f8032c:	e88d1fff 	stmia	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
33f80330:	e51f22f4 	ldr	r2, [pc, #-756]	; 33f80044 <_armboot_start>
33f80334:	e2422911 	sub	r2, r2, #278528	; 0x44000
33f80338:	e2422088 	sub	r2, r2, #136	; 0x88
33f8033c:	e892000c 	ldmia	r2, {r2, r3}
33f80340:	e28d0048 	add	r0, sp, #72	; 0x48
33f80344:	e28d5034 	add	r5, sp, #52	; 0x34
33f80348:	e1a0100e 	mov	r1, lr
33f8034c:	e885000f 	stmia	r5, {r0, r1, r2, r3}
33f80350:	e1a0000d 	mov	r0, sp
33f80354:	eb000106 	bl	33f80774 <do_prefetch_abort>
	...

33f80360 <data_abort>:
33f80360:	e51fd324 	ldr	sp, [pc, #-804]	; 33f80044 <_armboot_start>
33f80364:	e24dd911 	sub	sp, sp, #278528	; 0x44000
33f80368:	e24dd088 	sub	sp, sp, #136	; 0x88
33f8036c:	e58de000 	str	lr, [sp]
33f80370:	e14fe000 	mrs	lr, SPSR
33f80374:	e58de004 	str	lr, [sp, #4]
33f80378:	e3a0d013 	mov	sp, #19	; 0x13
33f8037c:	e169f00d 	msr	SPSR_fc, sp
33f80380:	e1a0e00f 	mov	lr, pc
33f80384:	e1b0f00e 	movs	pc, lr
33f80388:	e24dd048 	sub	sp, sp, #72	; 0x48
33f8038c:	e88d1fff 	stmia	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
33f80390:	e51f2354 	ldr	r2, [pc, #-852]	; 33f80044 <_armboot_start>
33f80394:	e2422911 	sub	r2, r2, #278528	; 0x44000
33f80398:	e2422088 	sub	r2, r2, #136	; 0x88
33f8039c:	e892000c 	ldmia	r2, {r2, r3}
33f803a0:	e28d0048 	add	r0, sp, #72	; 0x48
33f803a4:	e28d5034 	add	r5, sp, #52	; 0x34
33f803a8:	e1a0100e 	mov	r1, lr
33f803ac:	e885000f 	stmia	r5, {r0, r1, r2, r3}
33f803b0:	e1a0000d 	mov	r0, sp
33f803b4:	eb0000e5 	bl	33f80750 <do_data_abort>
	...

33f803c0 <not_used>:
33f803c0:	e51fd384 	ldr	sp, [pc, #-900]	; 33f80044 <_armboot_start>
33f803c4:	e24dd911 	sub	sp, sp, #278528	; 0x44000
33f803c8:	e24dd088 	sub	sp, sp, #136	; 0x88
33f803cc:	e58de000 	str	lr, [sp]
33f803d0:	e14fe000 	mrs	lr, SPSR
33f803d4:	e58de004 	str	lr, [sp, #4]
33f803d8:	e3a0d013 	mov	sp, #19	; 0x13
33f803dc:	e169f00d 	msr	SPSR_fc, sp
33f803e0:	e1a0e00f 	mov	lr, pc
33f803e4:	e1b0f00e 	movs	pc, lr
33f803e8:	e24dd048 	sub	sp, sp, #72	; 0x48
33f803ec:	e88d1fff 	stmia	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
33f803f0:	e51f23b4 	ldr	r2, [pc, #-948]	; 33f80044 <_armboot_start>
33f803f4:	e2422911 	sub	r2, r2, #278528	; 0x44000
33f803f8:	e2422088 	sub	r2, r2, #136	; 0x88
33f803fc:	e892000c 	ldmia	r2, {r2, r3}
33f80400:	e28d0048 	add	r0, sp, #72	; 0x48
33f80404:	e28d5034 	add	r5, sp, #52	; 0x34
33f80408:	e1a0100e 	mov	r1, lr
33f8040c:	e885000f 	stmia	r5, {r0, r1, r2, r3}
33f80410:	e1a0000d 	mov	r0, sp
33f80414:	eb0000c4 	bl	33f8072c <do_not_used>
	...

33f80420 <irq>:
33f80420:	e51fd3e4 	ldr	sp, [pc, #-996]	; 33f80044 <_armboot_start>
33f80424:	e24dd911 	sub	sp, sp, #278528	; 0x44000
33f80428:	e24dd088 	sub	sp, sp, #136	; 0x88
33f8042c:	e58de000 	str	lr, [sp]
33f80430:	e14fe000 	mrs	lr, SPSR
33f80434:	e58de004 	str	lr, [sp, #4]
33f80438:	e3a0d013 	mov	sp, #19	; 0x13
33f8043c:	e169f00d 	msr	SPSR_fc, sp
33f80440:	e1a0e00f 	mov	lr, pc
33f80444:	e1b0f00e 	movs	pc, lr
33f80448:	e24dd048 	sub	sp, sp, #72	; 0x48
33f8044c:	e88d1fff 	stmia	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
33f80450:	e51f2414 	ldr	r2, [pc, #-1044]	; 33f80044 <_armboot_start>
33f80454:	e2422911 	sub	r2, r2, #278528	; 0x44000
33f80458:	e2422088 	sub	r2, r2, #136	; 0x88
33f8045c:	e892000c 	ldmia	r2, {r2, r3}
33f80460:	e28d0048 	add	r0, sp, #72	; 0x48
33f80464:	e28d5034 	add	r5, sp, #52	; 0x34
33f80468:	e1a0100e 	mov	r1, lr
33f8046c:	e885000f 	stmia	r5, {r0, r1, r2, r3}
33f80470:	e1a0000d 	mov	r0, sp
33f80474:	eb00009a 	bl	33f806e4 <do_irq>
	...

33f80480 <fiq>:
33f80480:	e51fd444 	ldr	sp, [pc, #-1092]	; 33f80044 <_armboot_start>
33f80484:	e24dd911 	sub	sp, sp, #278528	; 0x44000
33f80488:	e24dd088 	sub	sp, sp, #136	; 0x88
33f8048c:	e58de000 	str	lr, [sp]
33f80490:	e14fe000 	mrs	lr, SPSR
33f80494:	e58de004 	str	lr, [sp, #4]
33f80498:	e3a0d013 	mov	sp, #19	; 0x13
33f8049c:	e169f00d 	msr	SPSR_fc, sp
33f804a0:	e1a0e00f 	mov	lr, pc
33f804a4:	e1b0f00e 	movs	pc, lr
33f804a8:	e24dd048 	sub	sp, sp, #72	; 0x48
33f804ac:	e88d1fff 	stmia	sp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
33f804b0:	e51f2474 	ldr	r2, [pc, #-1140]	; 33f80044 <_armboot_start>
33f804b4:	e2422911 	sub	r2, r2, #278528	; 0x44000
33f804b8:	e2422088 	sub	r2, r2, #136	; 0x88
33f804bc:	e892000c 	ldmia	r2, {r2, r3}
33f804c0:	e28d0048 	add	r0, sp, #72	; 0x48
33f804c4:	e28d5034 	add	r5, sp, #52	; 0x34
33f804c8:	e1a0100e 	mov	r1, lr
33f804cc:	e885000f 	stmia	r5, {r0, r1, r2, r3}
33f804d0:	e1a0000d 	mov	r0, sp
33f804d4:	eb00008b 	bl	33f80708 <do_fiq>
33f804d8:	56000004 	strpl	r0, [r0], -r4
33f804dc:	fe000800 	cdp2	8, 0, cr0, cr0, cr0, {0}
33f804e0:	005ea71f 	subeqs	sl, lr, pc, lsl r7
33f804e4:	56000018 	undefined
33f804e8:	00001fff 	streqd	r1, [r0], -pc
33f804ec:	56000014 	undefined
33f804f0:	00000146 	andeq	r0, r0, r6, asr #2
33f804f4:	56000010 	undefined
33f804f8:	00155455 	andeqs	r5, r5, r5, asr r4
33f804fc:	56000028 	strpl	r0, [r0], -r8, lsr #32
33f80500:	0000ffff 	streqd	pc, [r0], -pc
33f80504:	56000024 	strpl	r0, [r0], -r4, lsr #32
33f80508:	56000020 	strpl	r0, [r0], -r0, lsr #32
33f8050c:	55551515 	ldrplb	r1, [r5, #-1301]
33f80510:	56000038 	undefined
33f80514:	0000efff 	streqd	lr, [r0], -pc
33f80518:	56000030 	undefined
33f8051c:	56000034 	undefined
33f80520:	05514514 	ldreqb	r4, [r1, #-1300]
33f80524:	56000048 	strpl	r0, [r0], -r8, asr #32
33f80528:	56000044 	strpl	r0, [r0], -r4, asr #32
33f8052c:	56000040 	strpl	r0, [r0], -r0, asr #32
33f80530:	05555555 	ldreqb	r5, [r5, #-1365]
33f80534:	56000058 	undefined
33f80538:	56000054 	undefined
33f8053c:	56000050 	undefined
33f80540:	56000068 	strpl	r0, [r0], -r8, rrx
33f80544:	56000064 	strpl	r0, [r0], -r4, rrx
33f80548:	56000060 	strpl	r0, [r0], -r0, rrx
33f8054c:	01150010 	tsteq	r5, r0, lsl r0
33f80550:	56000078 	undefined
33f80554:	000007ff 	streqd	r0, [r0], -pc
33f80558:	56000074 	undefined
33f8055c:	56000070 	undefined
33f80560:	0016faaa 	andeqs	pc, r6, sl, lsr #21
33f80564:	560000d8 	undefined
33f80568:	560000d4 	undefined
33f8056c:	560000d0 	undefined
33f80570:	55555555 	ldrplb	r5, [r5, #-1365]
33f80574:	4a000008 	bmi	33f8059c <show_regs+0x10>
33f80578:	4a00001c 	bmi	33f805f0 <show_regs+0x64>
33f8057c:	4c000014 	stcmi	0, cr0, [r0], {20}

33f80580 <enable_interrupts>:
33f80580:	e1a0f00e 	mov	pc, lr

33f80584 <disable_interrupts>:
33f80584:	e3a00000 	mov	r0, #0	; 0x0
33f80588:	e1a0f00e 	mov	pc, lr

33f8058c <show_regs>:
33f8058c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f80590:	e24dd088 	sub	sp, sp, #136	; 0x88
33f80594:	e1a04000 	mov	r4, r0
33f80598:	e59f1100 	ldr	r1, [pc, #256]	; 33f806a0 <.text+0x6a0>
33f8059c:	e3a02080 	mov	r2, #128	; 0x80
33f805a0:	e28d0008 	add	r0, sp, #8	; 0x8
33f805a4:	eb002943 	bl	33f8aab8 <memcpy>
33f805a8:	e594e02c 	ldr	lr, [r4, #44]
33f805ac:	e594c030 	ldr	ip, [r4, #48]
33f805b0:	e594103c 	ldr	r1, [r4, #60]
33f805b4:	e5942038 	ldr	r2, [r4, #56]
33f805b8:	e5943034 	ldr	r3, [r4, #52]
33f805bc:	e88d5000 	stmia	sp, {ip, lr}
33f805c0:	e59f00dc 	ldr	r0, [pc, #220]	; 33f806a4 <.text+0x6a4>
33f805c4:	e5945040 	ldr	r5, [r4, #64]
33f805c8:	eb001da4 	bl	33f87c60 <printf>
33f805cc:	e5941028 	ldr	r1, [r4, #40]
33f805d0:	e5942024 	ldr	r2, [r4, #36]
33f805d4:	e5943020 	ldr	r3, [r4, #32]
33f805d8:	e59f00c8 	ldr	r0, [pc, #200]	; 33f806a8 <.text+0x6a8>
33f805dc:	eb001d9f 	bl	33f87c60 <printf>
33f805e0:	e594c010 	ldr	ip, [r4, #16]
33f805e4:	e594101c 	ldr	r1, [r4, #28]
33f805e8:	e5942018 	ldr	r2, [r4, #24]
33f805ec:	e5943014 	ldr	r3, [r4, #20]
33f805f0:	e59f00b4 	ldr	r0, [pc, #180]	; 33f806ac <.text+0x6ac>
33f805f4:	e58dc000 	str	ip, [sp]
33f805f8:	eb001d98 	bl	33f87c60 <printf>
33f805fc:	e594c000 	ldr	ip, [r4]
33f80600:	e594100c 	ldr	r1, [r4, #12]
33f80604:	e5942008 	ldr	r2, [r4, #8]
33f80608:	e5943004 	ldr	r3, [r4, #4]
33f8060c:	e59f009c 	ldr	r0, [pc, #156]	; 33f806b0 <.text+0x6b0>
33f80610:	e58dc000 	str	ip, [sp]
33f80614:	eb001d91 	bl	33f87c60 <printf>
33f80618:	e3150101 	tst	r5, #1073741824	; 0x40000000
33f8061c:	03a0207a 	moveq	r2, #122	; 0x7a
33f80620:	13a0205a 	movne	r2, #90	; 0x5a
33f80624:	e3150202 	tst	r5, #536870912	; 0x20000000
33f80628:	03a03063 	moveq	r3, #99	; 0x63
33f8062c:	13a03043 	movne	r3, #67	; 0x43
33f80630:	e3150201 	tst	r5, #268435456	; 0x10000000
33f80634:	e205520f 	and	r5, r5, #-268435456	; 0xf0000000
33f80638:	03a0c076 	moveq	ip, #118	; 0x76
33f8063c:	13a0c056 	movne	ip, #86	; 0x56
33f80640:	e3550000 	cmp	r5, #0	; 0x0
33f80644:	a3a0106e 	movge	r1, #110	; 0x6e
33f80648:	b3a0104e 	movlt	r1, #78	; 0x4e
33f8064c:	e59f0060 	ldr	r0, [pc, #96]	; 33f806b4 <.text+0x6b4>
33f80650:	e58dc000 	str	ip, [sp]
33f80654:	eb001d81 	bl	33f87c60 <printf>
33f80658:	e5943040 	ldr	r3, [r4, #64]
33f8065c:	e59fc054 	ldr	ip, [pc, #84]	; 33f806b8 <.text+0x6b8>
33f80660:	e59f2054 	ldr	r2, [pc, #84]	; 33f806bc <.text+0x6bc>
33f80664:	e3130080 	tst	r3, #128	; 0x80
33f80668:	11a0100c 	movne	r1, ip
33f8066c:	01a01002 	moveq	r1, r2
33f80670:	e203001f 	and	r0, r3, #31	; 0x1f
33f80674:	e3130040 	tst	r3, #64	; 0x40
33f80678:	e28de088 	add	lr, sp, #136	; 0x88
33f8067c:	e08e0100 	add	r0, lr, r0, lsl #2
33f80680:	11a0200c 	movne	r2, ip
33f80684:	e59fc034 	ldr	ip, [pc, #52]	; 33f806c0 <.text+0x6c0>
33f80688:	e5103080 	ldr	r3, [r0, #-128]
33f8068c:	e59f0030 	ldr	r0, [pc, #48]	; 33f806c4 <.text+0x6c4>
33f80690:	e58dc000 	str	ip, [sp]
33f80694:	eb001d71 	bl	33f87c60 <printf>
33f80698:	e28dd088 	add	sp, sp, #136	; 0x88
33f8069c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f806a0:	33f91258 	mvnccs	r1, #-2147483643	; 0x80000005
33f806a4:	33f91d60 	mvnccs	r1, #6144	; 0x1800
33f806a8:	33f91da8 	mvnccs	r1, #10752	; 0x2a00
33f806ac:	33f91dcc 	mvnccs	r1, #13056	; 0x3300
33f806b0:	33f91dfc 	mvnccs	r1, #16128	; 0x3f00
33f806b4:	33f91e2c 	mvnccs	r1, #704	; 0x2c0
33f806b8:	33f91e3c 	mvnccs	r1, #960	; 0x3c0
33f806bc:	33f92d4c 	mvnccs	r2, #4864	; 0x1300
33f806c0:	33f938b4 	mvnccs	r3, #11796480	; 0xb40000
33f806c4:	33f91e40 	mvnccs	r1, #1024	; 0x400

33f806c8 <bad_mode>:
33f806c8:	e52de004 	str	lr, [sp, #-4]!
33f806cc:	e59f000c 	ldr	r0, [pc, #12]	; 33f806e0 <.text+0x6e0>
33f806d0:	eb002a38 	bl	33f8afb8 <panic>
33f806d4:	e3a00000 	mov	r0, #0	; 0x0
33f806d8:	e49de004 	ldr	lr, [sp], #4
33f806dc:	ea0000aa 	b	33f8098c <reset_cpu>
33f806e0:	33f91e60 	mvnccs	r1, #1536	; 0x600

33f806e4 <do_irq>:
33f806e4:	e92d4010 	stmdb	sp!, {r4, lr}
33f806e8:	e1a04000 	mov	r4, r0
33f806ec:	e59f0010 	ldr	r0, [pc, #16]	; 33f80704 <.text+0x704>
33f806f0:	eb001d5a 	bl	33f87c60 <printf>
33f806f4:	e1a00004 	mov	r0, r4
33f806f8:	ebffffa3 	bl	33f8058c <show_regs>
33f806fc:	e8bd4010 	ldmia	sp!, {r4, lr}
33f80700:	eafffff0 	b	33f806c8 <bad_mode>
33f80704:	33f91e74 	mvnccs	r1, #1856	; 0x740

33f80708 <do_fiq>:
33f80708:	e92d4010 	stmdb	sp!, {r4, lr}
33f8070c:	e1a04000 	mov	r4, r0
33f80710:	e59f0010 	ldr	r0, [pc, #16]	; 33f80728 <.text+0x728>
33f80714:	eb001d51 	bl	33f87c60 <printf>
33f80718:	e1a00004 	mov	r0, r4
33f8071c:	ebffff9a 	bl	33f8058c <show_regs>
33f80720:	e8bd4010 	ldmia	sp!, {r4, lr}
33f80724:	eaffffe7 	b	33f806c8 <bad_mode>
33f80728:	33f91e88 	mvnccs	r1, #2176	; 0x880

33f8072c <do_not_used>:
33f8072c:	e92d4010 	stmdb	sp!, {r4, lr}
33f80730:	e1a04000 	mov	r4, r0
33f80734:	e59f0010 	ldr	r0, [pc, #16]	; 33f8074c <.text+0x74c>
33f80738:	eb001d48 	bl	33f87c60 <printf>
33f8073c:	e1a00004 	mov	r0, r4
33f80740:	ebffff91 	bl	33f8058c <show_regs>
33f80744:	e8bd4010 	ldmia	sp!, {r4, lr}
33f80748:	eaffffde 	b	33f806c8 <bad_mode>
33f8074c:	33f91ea0 	mvnccs	r1, #2560	; 0xa00

33f80750 <do_data_abort>:
33f80750:	e92d4010 	stmdb	sp!, {r4, lr}
33f80754:	e1a04000 	mov	r4, r0
33f80758:	e59f0010 	ldr	r0, [pc, #16]	; 33f80770 <.text+0x770>
33f8075c:	eb001d3f 	bl	33f87c60 <printf>
33f80760:	e1a00004 	mov	r0, r4
33f80764:	ebffff88 	bl	33f8058c <show_regs>
33f80768:	e8bd4010 	ldmia	sp!, {r4, lr}
33f8076c:	eaffffd5 	b	33f806c8 <bad_mode>
33f80770:	33f91eac 	mvnccs	r1, #2752	; 0xac0

33f80774 <do_prefetch_abort>:
33f80774:	e92d4010 	stmdb	sp!, {r4, lr}
33f80778:	e1a04000 	mov	r4, r0
33f8077c:	e59f0010 	ldr	r0, [pc, #16]	; 33f80794 <.text+0x794>
33f80780:	eb001d36 	bl	33f87c60 <printf>
33f80784:	e1a00004 	mov	r0, r4
33f80788:	ebffff7f 	bl	33f8058c <show_regs>
33f8078c:	e8bd4010 	ldmia	sp!, {r4, lr}
33f80790:	eaffffcc 	b	33f806c8 <bad_mode>
33f80794:	33f91eb8 	mvnccs	r1, #2944	; 0xb80

33f80798 <do_software_interrupt>:
33f80798:	e92d4010 	stmdb	sp!, {r4, lr}
33f8079c:	e1a04000 	mov	r4, r0
33f807a0:	e59f0010 	ldr	r0, [pc, #16]	; 33f807b8 <.text+0x7b8>
33f807a4:	eb001d2d 	bl	33f87c60 <printf>
33f807a8:	e1a00004 	mov	r0, r4
33f807ac:	ebffff76 	bl	33f8058c <show_regs>
33f807b0:	e8bd4010 	ldmia	sp!, {r4, lr}
33f807b4:	eaffffc3 	b	33f806c8 <bad_mode>
33f807b8:	33f91ec8 	mvnccs	r1, #3200	; 0xc80

33f807bc <do_undefined_instruction>:
33f807bc:	e92d4010 	stmdb	sp!, {r4, lr}
33f807c0:	e1a04000 	mov	r4, r0
33f807c4:	e59f0010 	ldr	r0, [pc, #16]	; 33f807dc <.text+0x7dc>
33f807c8:	eb001d24 	bl	33f87c60 <printf>
33f807cc:	e1a00004 	mov	r0, r4
33f807d0:	ebffff6d 	bl	33f8058c <show_regs>
33f807d4:	e8bd4010 	ldmia	sp!, {r4, lr}
33f807d8:	eaffffba 	b	33f806c8 <bad_mode>
33f807dc:	33f91edc 	mvnccs	r1, #3520	; 0xdc0

33f807e0 <set_timer>:
33f807e0:	e59f3004 	ldr	r3, [pc, #4]	; 33f807ec <.text+0x7ec>
33f807e4:	e5830000 	str	r0, [r3]
33f807e8:	e1a0f00e 	mov	pc, lr
33f807ec:	33f9622c 	mvnccs	r6, #-1073741822	; 0xc0000002

33f807f0 <reset_timer_masked>:
33f807f0:	e3a03451 	mov	r3, #1358954496	; 0x51000000
33f807f4:	e5933040 	ldr	r3, [r3, #64]
33f807f8:	e59f2018 	ldr	r2, [pc, #24]	; 33f80818 <.text+0x818>
33f807fc:	e1a03803 	mov	r3, r3, lsl #16
33f80800:	e1a03823 	mov	r3, r3, lsr #16
33f80804:	e5823000 	str	r3, [r2]
33f80808:	e59f300c 	ldr	r3, [pc, #12]	; 33f8081c <.text+0x81c>
33f8080c:	e3a02000 	mov	r2, #0	; 0x0
33f80810:	e5832000 	str	r2, [r3]
33f80814:	e1a0f00e 	mov	pc, lr
33f80818:	33f96230 	mvnccs	r6, #3	; 0x3
33f8081c:	33f9622c 	mvnccs	r6, #-1073741822	; 0xc0000002

33f80820 <get_timer_masked>:
33f80820:	e3a03451 	mov	r3, #1358954496	; 0x51000000
33f80824:	e5933040 	ldr	r3, [r3, #64]
33f80828:	e1a01803 	mov	r1, r3, lsl #16
33f8082c:	e59f304c 	ldr	r3, [pc, #76]	; 33f80880 <.text+0x880>
33f80830:	e5932000 	ldr	r2, [r3]
33f80834:	e1a01821 	mov	r1, r1, lsr #16
33f80838:	e1520001 	cmp	r2, r1
33f8083c:	359f3040 	ldrcc	r3, [pc, #64]	; 33f80884 <.text+0x884>
33f80840:	e59f0040 	ldr	r0, [pc, #64]	; 33f80888 <.text+0x888>
33f80844:	35933000 	ldrcc	r3, [r3]
33f80848:	25903000 	ldrcs	r3, [r0]
33f8084c:	30823003 	addcc	r3, r2, r3
33f80850:	e061c002 	rsb	ip, r1, r2
33f80854:	35902000 	ldrcc	r2, [r0]
33f80858:	2083300c 	addcs	r3, r3, ip
33f8085c:	30613003 	rsbcc	r3, r1, r3
33f80860:	25803000 	strcs	r3, [r0]
33f80864:	30822003 	addcc	r2, r2, r3
33f80868:	e59f3010 	ldr	r3, [pc, #16]	; 33f80880 <.text+0x880>
33f8086c:	35802000 	strcc	r2, [r0]
33f80870:	e5831000 	str	r1, [r3]
33f80874:	e59f300c 	ldr	r3, [pc, #12]	; 33f80888 <.text+0x888>
33f80878:	e5930000 	ldr	r0, [r3]
33f8087c:	e1a0f00e 	mov	pc, lr
33f80880:	33f96230 	mvnccs	r6, #3	; 0x3
33f80884:	33f96228 	mvnccs	r6, #-2147483646	; 0x80000002
33f80888:	33f9622c 	mvnccs	r6, #-1073741822	; 0xc0000002

33f8088c <get_timer>:
33f8088c:	e92d4010 	stmdb	sp!, {r4, lr}
33f80890:	e1a04000 	mov	r4, r0
33f80894:	ebffffe1 	bl	33f80820 <get_timer_masked>
33f80898:	e0640000 	rsb	r0, r4, r0
33f8089c:	e8bd8010 	ldmia	sp!, {r4, pc}

33f808a0 <udelay>:
33f808a0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f808a4:	e1a04000 	mov	r4, r0
33f808a8:	e3a00000 	mov	r0, #0	; 0x0
33f808ac:	ebfffff6 	bl	33f8088c <get_timer>
33f808b0:	e3a01ffa 	mov	r1, #1000	; 0x3e8
33f808b4:	e1a05000 	mov	r5, r0
33f808b8:	e1a00004 	mov	r0, r4
33f808bc:	eb0000b5 	bl	33f80b98 <__udivsi3>
33f808c0:	e59f302c 	ldr	r3, [pc, #44]	; 33f808f4 <.text+0x8f4>
33f808c4:	e5932000 	ldr	r2, [r3]
33f808c8:	e3a03064 	mov	r3, #100	; 0x64
33f808cc:	e0030392 	mul	r3, r2, r3
33f808d0:	e3a01ffa 	mov	r1, #1000	; 0x3e8
33f808d4:	e0000093 	mul	r0, r3, r0
33f808d8:	eb0000ae 	bl	33f80b98 <__udivsi3>
33f808dc:	e1a04000 	mov	r4, r0
33f808e0:	ebffffce 	bl	33f80820 <get_timer_masked>
33f808e4:	e0650000 	rsb	r0, r5, r0
33f808e8:	e1500004 	cmp	r0, r4
33f808ec:	3afffffb 	bcc	33f808e0 <udelay+0x40>
33f808f0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f808f4:	33f96228 	mvnccs	r6, #-2147483646	; 0x80000002

33f808f8 <udelay_masked>:
33f808f8:	e3500ffa 	cmp	r0, #1000	; 0x3e8
33f808fc:	e92d4010 	stmdb	sp!, {r4, lr}
33f80900:	e1a01000 	mov	r1, r0
33f80904:	e59f4058 	ldr	r4, [pc, #88]	; 33f80964 <.text+0x964>
33f80908:	3a000007 	bcc	33f8092c <udelay_masked+0x34>
33f8090c:	e3a01ffa 	mov	r1, #1000	; 0x3e8
33f80910:	eb0000a0 	bl	33f80b98 <__udivsi3>
33f80914:	e5943000 	ldr	r3, [r4]
33f80918:	e3a02064 	mov	r2, #100	; 0x64
33f8091c:	e0030392 	mul	r3, r2, r3
33f80920:	e0000093 	mul	r0, r3, r0
33f80924:	e3a01ffa 	mov	r1, #1000	; 0x3e8
33f80928:	ea000004 	b	33f80940 <udelay_masked+0x48>
33f8092c:	e5943000 	ldr	r3, [r4]
33f80930:	e3a02064 	mov	r2, #100	; 0x64
33f80934:	e0030392 	mul	r3, r2, r3
33f80938:	e0000193 	mul	r0, r3, r1
33f8093c:	e59f1024 	ldr	r1, [pc, #36]	; 33f80968 <.text+0x968>
33f80940:	eb000094 	bl	33f80b98 <__udivsi3>
33f80944:	e1a04000 	mov	r4, r0
33f80948:	ebffffb4 	bl	33f80820 <get_timer_masked>
33f8094c:	e0804004 	add	r4, r0, r4
33f80950:	ebffffb2 	bl	33f80820 <get_timer_masked>
33f80954:	e0600004 	rsb	r0, r0, r4
33f80958:	e3500000 	cmp	r0, #0	; 0x0
33f8095c:	aafffffb 	bge	33f80950 <udelay_masked+0x58>
33f80960:	e8bd8010 	ldmia	sp!, {r4, pc}
33f80964:	33f96228 	mvnccs	r6, #-2147483646	; 0x80000002
33f80968:	000f4240 	andeq	r4, pc, r0, asr #4

33f8096c <get_ticks>:
33f8096c:	e52de004 	str	lr, [sp, #-4]!
33f80970:	e3a00000 	mov	r0, #0	; 0x0
33f80974:	ebffffc4 	bl	33f8088c <get_timer>
33f80978:	e3a01000 	mov	r1, #0	; 0x0
33f8097c:	e49df004 	ldr	pc, [sp], #4

33f80980 <get_tbclk>:
33f80980:	e59f0000 	ldr	r0, [pc, #0]	; 33f80988 <.text+0x988>
33f80984:	e1a0f00e 	mov	pc, lr
33f80988:	0017d784 	andeqs	sp, r7, r4, lsl #15

33f8098c <reset_cpu>:
33f8098c:	e3a02453 	mov	r2, #1392508928	; 0x53000000
33f80990:	e3a03000 	mov	r3, #0	; 0x0
33f80994:	e5823000 	str	r3, [r2]
33f80998:	e2833001 	add	r3, r3, #1	; 0x1
33f8099c:	e5823008 	str	r3, [r2, #8]
33f809a0:	e2833020 	add	r3, r3, #32	; 0x20
33f809a4:	e5823000 	str	r3, [r2]
33f809a8:	eafffffe 	b	33f809a8 <reset_cpu+0x1c>

33f809ac <interrupt_init>:
33f809ac:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f809b0:	e59f5068 	ldr	r5, [pc, #104]	; 33f80a20 <.text+0xa20>
33f809b4:	e5953000 	ldr	r3, [r5]
33f809b8:	e3a04451 	mov	r4, #1358954496	; 0x51000000
33f809bc:	e3530000 	cmp	r3, #0	; 0x0
33f809c0:	e3a03c0f 	mov	r3, #3840	; 0xf00
33f809c4:	e5843000 	str	r3, [r4]
33f809c8:	1a000003 	bne	33f809dc <interrupt_init+0x30>
33f809cc:	eb000067 	bl	33f80b70 <get_PCLK>
33f809d0:	e3a01d32 	mov	r1, #3200	; 0xc80
33f809d4:	eb00006f 	bl	33f80b98 <__udivsi3>
33f809d8:	e5850000 	str	r0, [r5]
33f809dc:	e5953000 	ldr	r3, [r5]
33f809e0:	e584303c 	str	r3, [r4, #60]
33f809e4:	e594103c 	ldr	r1, [r4, #60]
33f809e8:	e5943008 	ldr	r3, [r4, #8]
33f809ec:	e3c33607 	bic	r3, r3, #7340032	; 0x700000
33f809f0:	e3833606 	orr	r3, r3, #6291456	; 0x600000
33f809f4:	e5843008 	str	r3, [r4, #8]
33f809f8:	e5943008 	ldr	r3, [r4, #8]
33f809fc:	e59f2020 	ldr	r2, [pc, #32]	; 33f80a24 <.text+0xa24>
33f80a00:	e3c33607 	bic	r3, r3, #7340032	; 0x700000
33f80a04:	e3833605 	orr	r3, r3, #5242880	; 0x500000
33f80a08:	e5821000 	str	r1, [r2]
33f80a0c:	e5843008 	str	r3, [r4, #8]
33f80a10:	e59f3010 	ldr	r3, [pc, #16]	; 33f80a28 <.text+0xa28>
33f80a14:	e3a00000 	mov	r0, #0	; 0x0
33f80a18:	e5830000 	str	r0, [r3]
33f80a1c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f80a20:	33f96228 	mvnccs	r6, #-2147483646	; 0x80000002
33f80a24:	33f96230 	mvnccs	r6, #3	; 0x3
33f80a28:	33f9622c 	mvnccs	r6, #-1073741822	; 0xc0000002

33f80a2c <reset_timer>:
33f80a2c:	e3a03451 	mov	r3, #1358954496	; 0x51000000
33f80a30:	e5933040 	ldr	r3, [r3, #64]
33f80a34:	e59f2018 	ldr	r2, [pc, #24]	; 33f80a54 <.text+0xa54>
33f80a38:	e1a03803 	mov	r3, r3, lsl #16
33f80a3c:	e1a03823 	mov	r3, r3, lsr #16
33f80a40:	e5823000 	str	r3, [r2]
33f80a44:	e59f300c 	ldr	r3, [pc, #12]	; 33f80a58 <.text+0xa58>
33f80a48:	e3a02000 	mov	r2, #0	; 0x0
33f80a4c:	e5832000 	str	r2, [r3]
33f80a50:	e1a0f00e 	mov	pc, lr
33f80a54:	33f96230 	mvnccs	r6, #3	; 0x3
33f80a58:	33f9622c 	mvnccs	r6, #-1073741822	; 0xc0000002

33f80a5c <get_PLLCLK>:
33f80a5c:	e3500000 	cmp	r0, #0	; 0x0
33f80a60:	e92d4010 	stmdb	sp!, {r4, lr}
33f80a64:	1a00000d 	bne	33f80aa0 <get_PLLCLK+0x44>
33f80a68:	e3a03313 	mov	r3, #1275068416	; 0x4c000000
33f80a6c:	e5934004 	ldr	r4, [r3, #4]
33f80a70:	e2041e3f 	and	r1, r4, #1008	; 0x3f0
33f80a74:	e1a01221 	mov	r1, r1, lsr #4
33f80a78:	e2043003 	and	r3, r4, #3	; 0x3
33f80a7c:	e2811002 	add	r1, r1, #2	; 0x2
33f80a80:	e1a01311 	mov	r1, r1, lsl r3
33f80a84:	e59f005c 	ldr	r0, [pc, #92]	; 33f80ae8 <.text+0xae8>
33f80a88:	eb000042 	bl	33f80b98 <__udivsi3>
33f80a8c:	e2044aff 	and	r4, r4, #1044480	; 0xff000
33f80a90:	e1a045a4 	mov	r4, r4, lsr #11
33f80a94:	e2844010 	add	r4, r4, #16	; 0x10
33f80a98:	e0000094 	mul	r0, r4, r0
33f80a9c:	e8bd8010 	ldmia	sp!, {r4, pc}
33f80aa0:	e3500001 	cmp	r0, #1	; 0x1
33f80aa4:	1a00000d 	bne	33f80ae0 <get_PLLCLK+0x84>
33f80aa8:	e3a03313 	mov	r3, #1275068416	; 0x4c000000
33f80aac:	e593c008 	ldr	ip, [r3, #8]
33f80ab0:	e20c2aff 	and	r2, ip, #1044480	; 0xff000
33f80ab4:	e20c1e3f 	and	r1, ip, #1008	; 0x3f0
33f80ab8:	e59f3028 	ldr	r3, [pc, #40]	; 33f80ae8 <.text+0xae8>
33f80abc:	e1a02622 	mov	r2, r2, lsr #12
33f80ac0:	e1a01221 	mov	r1, r1, lsr #4
33f80ac4:	e2822008 	add	r2, r2, #8	; 0x8
33f80ac8:	e20cc003 	and	ip, ip, #3	; 0x3
33f80acc:	e2811002 	add	r1, r1, #2	; 0x2
33f80ad0:	e0000392 	mul	r0, r2, r3
33f80ad4:	e1a01c11 	mov	r1, r1, lsl ip
33f80ad8:	eb00002e 	bl	33f80b98 <__udivsi3>
33f80adc:	e8bd8010 	ldmia	sp!, {r4, pc}
33f80ae0:	e59f0004 	ldr	r0, [pc, #4]	; 33f80aec <.text+0xaec>
33f80ae4:	eb00006f 	bl	33f80ca8 <hang>
33f80ae8:	01026600 	tsteq	r2, r0, lsl #12
33f80aec:	000003e7 	andeq	r0, r0, r7, ror #7

33f80af0 <get_UCLK>:
33f80af0:	e3a00001 	mov	r0, #1	; 0x1
33f80af4:	eaffffd8 	b	33f80a5c <get_PLLCLK>

33f80af8 <get_FCLK>:
33f80af8:	e3a00000 	mov	r0, #0	; 0x0
33f80afc:	eaffffd6 	b	33f80a5c <get_PLLCLK>

33f80b00 <get_HCLK>:
33f80b00:	e52de004 	str	lr, [sp, #-4]!
33f80b04:	e3a03313 	mov	r3, #1275068416	; 0x4c000000
33f80b08:	e5933014 	ldr	r3, [r3, #20]
33f80b0c:	e2033006 	and	r3, r3, #6	; 0x6
33f80b10:	e3530006 	cmp	r3, #6	; 0x6
33f80b14:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f80b18:	ea000006 	b	33f80b38 <.text+0xb38>
33f80b1c:	33f80b40 	mvnccs	r0, #65536	; 0x10000
33f80b20:	33f80b38 	mvnccs	r0, #57344	; 0xe000
33f80b24:	33f80b48 	mvnccs	r0, #73728	; 0x12000
33f80b28:	33f80b38 	mvnccs	r0, #57344	; 0xe000
33f80b2c:	33f80b54 	mvnccs	r0, #86016	; 0x15000
33f80b30:	33f80b38 	mvnccs	r0, #57344	; 0xe000
33f80b34:	33f80b60 	mvnccs	r0, #98304	; 0x18000
33f80b38:	e3a00000 	mov	r0, #0	; 0x0
33f80b3c:	e49df004 	ldr	pc, [sp], #4
33f80b40:	e49de004 	ldr	lr, [sp], #4
33f80b44:	eaffffeb 	b	33f80af8 <get_FCLK>
33f80b48:	ebffffea 	bl	33f80af8 <get_FCLK>
33f80b4c:	e1a000a0 	mov	r0, r0, lsr #1
33f80b50:	e49df004 	ldr	pc, [sp], #4
33f80b54:	ebffffe7 	bl	33f80af8 <get_FCLK>
33f80b58:	e1a00120 	mov	r0, r0, lsr #2
33f80b5c:	e49df004 	ldr	pc, [sp], #4
33f80b60:	ebffffe4 	bl	33f80af8 <get_FCLK>
33f80b64:	e3a01003 	mov	r1, #3	; 0x3
33f80b68:	eb00000a 	bl	33f80b98 <__udivsi3>
33f80b6c:	e49df004 	ldr	pc, [sp], #4

33f80b70 <get_PCLK>:
33f80b70:	e52de004 	str	lr, [sp, #-4]!
33f80b74:	e3a03313 	mov	r3, #1275068416	; 0x4c000000
33f80b78:	e5933014 	ldr	r3, [r3, #20]
33f80b7c:	e3130001 	tst	r3, #1	; 0x1
33f80b80:	1a000001 	bne	33f80b8c <get_PCLK+0x1c>
33f80b84:	e49de004 	ldr	lr, [sp], #4
33f80b88:	eaffffdc 	b	33f80b00 <get_HCLK>
33f80b8c:	ebffffdb 	bl	33f80b00 <get_HCLK>
33f80b90:	e1a000a0 	mov	r0, r0, lsr #1
33f80b94:	e49df004 	ldr	pc, [sp], #4

33f80b98 <__udivsi3>:
33f80b98:	e3510000 	cmp	r1, #0	; 0x0
33f80b9c:	0a00001f 	beq	33f80c20 <Ldiv0>
33f80ba0:	e3a03001 	mov	r3, #1	; 0x1
33f80ba4:	e3a02000 	mov	r2, #0	; 0x0
33f80ba8:	e1500001 	cmp	r0, r1
33f80bac:	3a000019 	bcc	33f80c18 <Lgot_result>

33f80bb0 <Loop1>:
33f80bb0:	e3510201 	cmp	r1, #268435456	; 0x10000000
33f80bb4:	31510000 	cmpcc	r1, r0
33f80bb8:	31a01201 	movcc	r1, r1, lsl #4
33f80bbc:	31a03203 	movcc	r3, r3, lsl #4
33f80bc0:	3afffffa 	bcc	33f80bb0 <Loop1>

33f80bc4 <Lbignum>:
33f80bc4:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
33f80bc8:	31510000 	cmpcc	r1, r0
33f80bcc:	31a01081 	movcc	r1, r1, lsl #1
33f80bd0:	31a03083 	movcc	r3, r3, lsl #1
33f80bd4:	3afffffa 	bcc	33f80bc4 <Lbignum>

33f80bd8 <Loop3>:
33f80bd8:	e1500001 	cmp	r0, r1
33f80bdc:	20400001 	subcs	r0, r0, r1
33f80be0:	21822003 	orrcs	r2, r2, r3
33f80be4:	e15000a1 	cmp	r0, r1, lsr #1
33f80be8:	204000a1 	subcs	r0, r0, r1, lsr #1
33f80bec:	218220a3 	orrcs	r2, r2, r3, lsr #1
33f80bf0:	e1500121 	cmp	r0, r1, lsr #2
33f80bf4:	20400121 	subcs	r0, r0, r1, lsr #2
33f80bf8:	21822123 	orrcs	r2, r2, r3, lsr #2
33f80bfc:	e15001a1 	cmp	r0, r1, lsr #3
33f80c00:	204001a1 	subcs	r0, r0, r1, lsr #3
33f80c04:	218221a3 	orrcs	r2, r2, r3, lsr #3
33f80c08:	e3500000 	cmp	r0, #0	; 0x0
33f80c0c:	11b03223 	movnes	r3, r3, lsr #4
33f80c10:	11a01221 	movne	r1, r1, lsr #4
33f80c14:	1affffef 	bne	33f80bd8 <Loop3>

33f80c18 <Lgot_result>:
33f80c18:	e1a00002 	mov	r0, r2
33f80c1c:	e1a0f00e 	mov	pc, lr

33f80c20 <Ldiv0>:
33f80c20:	e52de004 	str	lr, [sp, #-4]!
33f80c24:	eb0000be 	bl	33f80f24 <__div0>
33f80c28:	e3a00000 	mov	r0, #0	; 0x0
33f80c2c:	e8bd8000 	ldmia	sp!, {pc}

33f80c30 <sbrk>:
33f80c30:	e59fc034 	ldr	ip, [pc, #52]	; 33f80c6c <.text+0xc6c>
33f80c34:	e59f3034 	ldr	r3, [pc, #52]	; 33f80c70 <.text+0xc70>
33f80c38:	e59c1000 	ldr	r1, [ip]
33f80c3c:	e5933000 	ldr	r3, [r3]
33f80c40:	e0812000 	add	r2, r1, r0
33f80c44:	e1520003 	cmp	r2, r3
33f80c48:	3a000005 	bcc	33f80c64 <sbrk+0x34>
33f80c4c:	e59f3020 	ldr	r3, [pc, #32]	; 33f80c74 <.text+0xc74>
33f80c50:	e5933000 	ldr	r3, [r3]
33f80c54:	e1520003 	cmp	r2, r3
33f80c58:	e1a00001 	mov	r0, r1
33f80c5c:	958c2000 	strls	r2, [ip]
33f80c60:	91a0f00e 	movls	pc, lr
33f80c64:	e3a00000 	mov	r0, #0	; 0x0
33f80c68:	e1a0f00e 	mov	pc, lr
33f80c6c:	33f96240 	mvnccs	r6, #4	; 0x4
33f80c70:	33f96238 	mvnccs	r6, #-2147483645	; 0x80000003
33f80c74:	33f9623c 	mvnccs	r6, #-1073741821	; 0xc0000003

33f80c78 <display_dram_config>:
33f80c78:	e92d4010 	stmdb	sp!, {r4, lr}
33f80c7c:	e5983000 	ldr	r3, [r8]
33f80c80:	e5934020 	ldr	r4, [r3, #32]
33f80c84:	e59f0014 	ldr	r0, [pc, #20]	; 33f80ca0 <.text+0xca0>
33f80c88:	eb001be1 	bl	33f87c14 <puts>
33f80c8c:	e1a00004 	mov	r0, r4
33f80c90:	e59f100c 	ldr	r1, [pc, #12]	; 33f80ca4 <.text+0xca4>
33f80c94:	eb002672 	bl	33f8a664 <print_size>
33f80c98:	e3a00000 	mov	r0, #0	; 0x0
33f80c9c:	e8bd8010 	ldmia	sp!, {r4, pc}
33f80ca0:	33f91ff4 	mvnccs	r1, #976	; 0x3d0
33f80ca4:	33f9544c 	mvnccs	r5, #1275068416	; 0x4c000000

33f80ca8 <hang>:
33f80ca8:	e1a01000 	mov	r1, r0
33f80cac:	e59f0004 	ldr	r0, [pc, #4]	; 33f80cb8 <.text+0xcb8>
33f80cb0:	eb001bea 	bl	33f87c60 <printf>
33f80cb4:	eafffffe 	b	33f80cb4 <hang+0xc>
33f80cb8:	33f91ffc 	mvnccs	r1, #1008	; 0x3f0

33f80cbc <display_banner>:
33f80cbc:	e52de004 	str	lr, [sp, #-4]!
33f80cc0:	e59f002c 	ldr	r0, [pc, #44]	; 33f80cf4 <.text+0xcf4>
33f80cc4:	e59f102c 	ldr	r1, [pc, #44]	; 33f80cf8 <.text+0xcf8>
33f80cc8:	eb001be4 	bl	33f87c60 <printf>
33f80ccc:	e59f3028 	ldr	r3, [pc, #40]	; 33f80cfc <.text+0xcfc>
33f80cd0:	e5931000 	ldr	r1, [r3]
33f80cd4:	e59f3024 	ldr	r3, [pc, #36]	; 33f80d00 <.text+0xd00>
33f80cd8:	e5932000 	ldr	r2, [r3]
33f80cdc:	e59f3020 	ldr	r3, [pc, #32]	; 33f80d04 <.text+0xd04>
33f80ce0:	e59f0020 	ldr	r0, [pc, #32]	; 33f80d08 <.text+0xd08>
33f80ce4:	e5933000 	ldr	r3, [r3]
33f80ce8:	eb001bdc 	bl	33f87c60 <printf>
33f80cec:	e3a00000 	mov	r0, #0	; 0x0
33f80cf0:	e49df004 	ldr	pc, [sp], #4
33f80cf4:	33f9202c 	mvnccs	r2, #44	; 0x2c
33f80cf8:	33f912d8 	mvnccs	r1, #-2147483635	; 0x8000000d
33f80cfc:	33f80044 	mvnccs	r0, #68	; 0x44
33f80d00:	33f80048 	mvnccs	r0, #72	; 0x48
33f80d04:	33f8004c 	mvnccs	r0, #76	; 0x4c
33f80d08:	33f92034 	mvnccs	r2, #52	; 0x34

33f80d0c <init_baudrate>:
33f80d0c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f80d10:	e24dd040 	sub	sp, sp, #64	; 0x40
33f80d14:	e1a0100d 	mov	r1, sp
33f80d18:	e3a02040 	mov	r2, #64	; 0x40
33f80d1c:	e59f0040 	ldr	r0, [pc, #64]	; 33f80d64 <.text+0xd64>
33f80d20:	eb00185f 	bl	33f86ea4 <getenv_r>
33f80d24:	e3500000 	cmp	r0, #0	; 0x0
33f80d28:	e1a05008 	mov	r5, r8
33f80d2c:	e59f3034 	ldr	r3, [pc, #52]	; 33f80d68 <.text+0xd68>
33f80d30:	e1a0000d 	mov	r0, sp
33f80d34:	e3a01000 	mov	r1, #0	; 0x0
33f80d38:	e3a0200a 	mov	r2, #10	; 0xa
33f80d3c:	e5984000 	ldr	r4, [r8]
33f80d40:	da000001 	ble	33f80d4c <init_baudrate+0x40>
33f80d44:	eb0027bf 	bl	33f8ac48 <simple_strtoul>
33f80d48:	e1a03000 	mov	r3, r0
33f80d4c:	e5853008 	str	r3, [r5, #8]
33f80d50:	e5953008 	ldr	r3, [r5, #8]
33f80d54:	e3a00000 	mov	r0, #0	; 0x0
33f80d58:	e5843000 	str	r3, [r4]
33f80d5c:	e28dd040 	add	sp, sp, #64	; 0x40
33f80d60:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f80d64:	33f92060 	mvnccs	r2, #96	; 0x60
33f80d68:	0001c200 	andeq	ip, r1, r0, lsl #4

33f80d6c <start_armboot>:
33f80d6c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f80d70:	e59f4178 	ldr	r4, [pc, #376]	; 33f80ef0 <.text+0xef0>
33f80d74:	e5943000 	ldr	r3, [r4]
33f80d78:	e2438909 	sub	r8, r3, #147456	; 0x24000
33f80d7c:	e24dd044 	sub	sp, sp, #68	; 0x44
33f80d80:	e2488024 	sub	r8, r8, #36	; 0x24
33f80d84:	e3a01000 	mov	r1, #0	; 0x0
33f80d88:	e3a02024 	mov	r2, #36	; 0x24
33f80d8c:	e1a00008 	mov	r0, r8
33f80d90:	eb002736 	bl	33f8aa70 <memset>
33f80d94:	e2482024 	sub	r2, r8, #36	; 0x24
33f80d98:	e5882000 	str	r2, [r8]
33f80d9c:	e3a01000 	mov	r1, #0	; 0x0
33f80da0:	e3a02024 	mov	r2, #36	; 0x24
33f80da4:	e5980000 	ldr	r0, [r8]
33f80da8:	eb002730 	bl	33f8aa70 <memset>
33f80dac:	e59f3140 	ldr	r3, [pc, #320]	; 33f80ef4 <.text+0xef4>
33f80db0:	e5941000 	ldr	r1, [r4]
33f80db4:	e5932000 	ldr	r2, [r3]
33f80db8:	e59f5138 	ldr	r5, [pc, #312]	; 33f80ef8 <.text+0xef8>
33f80dbc:	e59f3138 	ldr	r3, [pc, #312]	; 33f80efc <.text+0xefc>
33f80dc0:	e0612002 	rsb	r2, r1, r2
33f80dc4:	e3a04000 	mov	r4, #0	; 0x0
33f80dc8:	e5832000 	str	r2, [r3]
33f80dcc:	ea000006 	b	33f80dec <start_armboot+0x80>
33f80dd0:	e1a0e00f 	mov	lr, pc
33f80dd4:	e1a0f006 	mov	pc, r6
33f80dd8:	e3500000 	cmp	r0, #0	; 0x0
33f80ddc:	e2855004 	add	r5, r5, #4	; 0x4
33f80de0:	11a00004 	movne	r0, r4
33f80de4:	1bffffaf 	blne	33f80ca8 <hang>
33f80de8:	e2844001 	add	r4, r4, #1	; 0x1
33f80dec:	e5156004 	ldr	r6, [r5, #-4]
33f80df0:	e3560000 	cmp	r6, #0	; 0x0
33f80df4:	1afffff5 	bne	33f80dd0 <start_armboot+0x64>
33f80df8:	e59f30f0 	ldr	r3, [pc, #240]	; 33f80ef0 <.text+0xef0>
33f80dfc:	e593c000 	ldr	ip, [r3]
33f80e00:	e59f30f8 	ldr	r3, [pc, #248]	; 33f80f00 <.text+0xf00>
33f80e04:	e24ce909 	sub	lr, ip, #147456	; 0x24000
33f80e08:	e583e000 	str	lr, [r3]
33f80e0c:	e59f30f0 	ldr	r3, [pc, #240]	; 33f80f04 <.text+0xf04>
33f80e10:	e583c000 	str	ip, [r3]
33f80e14:	e59f30ec 	ldr	r3, [pc, #236]	; 33f80f08 <.text+0xf08>
33f80e18:	e06e200c 	rsb	r2, lr, ip
33f80e1c:	e1a0000e 	mov	r0, lr
33f80e20:	e1a01006 	mov	r1, r6
33f80e24:	e583e000 	str	lr, [r3]
33f80e28:	eb002710 	bl	33f8aa70 <memset>
33f80e2c:	e59f00d8 	ldr	r0, [pc, #216]	; 33f80f0c <.text+0xf0c>
33f80e30:	eb001b77 	bl	33f87c14 <puts>
33f80e34:	eb000420 	bl	33f81ebc <nand_init>
33f80e38:	eb0020c7 	bl	33f8915c <env_relocate>
33f80e3c:	e59f00cc 	ldr	r0, [pc, #204]	; 33f80f10 <.text+0xf10>
33f80e40:	eb001b73 	bl	33f87c14 <puts>
33f80e44:	e59f00c8 	ldr	r0, [pc, #200]	; 33f80f14 <.text+0xf14>
33f80e48:	e5984000 	ldr	r4, [r8]
33f80e4c:	eb000079 	bl	33f81038 <getenv_IPaddr>
33f80e50:	e1a0100d 	mov	r1, sp
33f80e54:	e5840004 	str	r0, [r4, #4]
33f80e58:	e3a02040 	mov	r2, #64	; 0x40
33f80e5c:	e59f00b4 	ldr	r0, [pc, #180]	; 33f80f18 <.text+0xf18>
33f80e60:	eb00180f 	bl	33f86ea4 <getenv_r>
33f80e64:	e3500000 	cmp	r0, #0	; 0x0
33f80e68:	c1a0000d 	movgt	r0, sp
33f80e6c:	d3a00000 	movle	r0, #0	; 0x0
33f80e70:	e1a05006 	mov	r5, r6
33f80e74:	e5983000 	ldr	r3, [r8]
33f80e78:	e3500000 	cmp	r0, #0	; 0x0
33f80e7c:	e0854003 	add	r4, r5, r3
33f80e80:	05c40008 	streqb	r0, [r4, #8]
33f80e84:	0a000007 	beq	33f80ea8 <start_armboot+0x13c>
33f80e88:	e28d1040 	add	r1, sp, #64	; 0x40
33f80e8c:	e3a02010 	mov	r2, #16	; 0x10
33f80e90:	eb00276c 	bl	33f8ac48 <simple_strtoul>
33f80e94:	e5c40008 	strb	r0, [r4, #8]
33f80e98:	e59d0040 	ldr	r0, [sp, #64]
33f80e9c:	e5d03000 	ldrb	r3, [r0]
33f80ea0:	e3530000 	cmp	r3, #0	; 0x0
33f80ea4:	12800001 	addne	r0, r0, #1	; 0x1
33f80ea8:	e2855001 	add	r5, r5, #1	; 0x1
33f80eac:	e3550006 	cmp	r5, #6	; 0x6
33f80eb0:	1affffef 	bne	33f80e74 <start_armboot+0x108>
33f80eb4:	eb001c2b 	bl	33f87f68 <devices_init>
33f80eb8:	eb002145 	bl	33f893d4 <jumptable_init>
33f80ebc:	eb001b78 	bl	33f87ca4 <console_init_r>
33f80ec0:	ebfffdae 	bl	33f80580 <enable_interrupts>
33f80ec4:	e59f0050 	ldr	r0, [pc, #80]	; 33f80f1c <.text+0xf1c>
33f80ec8:	eb001831 	bl	33f86f94 <getenv>
33f80ecc:	e3500000 	cmp	r0, #0	; 0x0
33f80ed0:	0a000004 	beq	33f80ee8 <start_armboot+0x17c>
33f80ed4:	e3a01000 	mov	r1, #0	; 0x0
33f80ed8:	e3a02010 	mov	r2, #16	; 0x10
33f80edc:	eb002759 	bl	33f8ac48 <simple_strtoul>
33f80ee0:	e59f3038 	ldr	r3, [pc, #56]	; 33f80f20 <.text+0xf20>
33f80ee4:	e5830000 	str	r0, [r3]
33f80ee8:	eb000923 	bl	33f8337c <main_loop>
33f80eec:	eafffffd 	b	33f80ee8 <start_armboot+0x17c>
33f80ef0:	33f80044 	mvnccs	r0, #68	; 0x44
33f80ef4:	33f80048 	mvnccs	r0, #72	; 0x48
33f80ef8:	33f95688 	mvnccs	r5, #142606336	; 0x8800000
33f80efc:	33f96234 	mvnccs	r6, #1073741827	; 0x40000003
33f80f00:	33f96238 	mvnccs	r6, #-2147483645	; 0x80000003
33f80f04:	33f9623c 	mvnccs	r6, #-1073741821	; 0xc0000003
33f80f08:	33f96240 	mvnccs	r6, #4	; 0x4
33f80f0c:	33f9206c 	mvnccs	r2, #108	; 0x6c
33f80f10:	33f9544c 	mvnccs	r5, #1275068416	; 0x4c000000
33f80f14:	33f92074 	mvnccs	r2, #116	; 0x74
33f80f18:	33f9207c 	mvnccs	r2, #124	; 0x7c
33f80f1c:	33f92084 	mvnccs	r2, #132	; 0x84
33f80f20:	33f956d4 	mvnccs	r5, #222298112	; 0xd400000

33f80f24 <__div0>:
33f80f24:	eaffff5f 	b	33f80ca8 <hang>

33f80f28 <__fswab16>:
33f80f28:	e1a00800 	mov	r0, r0, lsl #16
33f80f2c:	e1a00820 	mov	r0, r0, lsr #16
33f80f30:	e1a03420 	mov	r3, r0, lsr #8
33f80f34:	e20000ff 	and	r0, r0, #255	; 0xff
33f80f38:	e1830400 	orr	r0, r3, r0, lsl #8
33f80f3c:	e1a0f00e 	mov	pc, lr

33f80f40 <__fswab32>:
33f80f40:	e1a02000 	mov	r2, r0
33f80f44:	e2003cff 	and	r3, r0, #65280	; 0xff00
33f80f48:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
33f80f4c:	e1a03403 	mov	r3, r3, lsl #8
33f80f50:	e1a00420 	mov	r0, r0, lsr #8
33f80f54:	e1800c22 	orr	r0, r0, r2, lsr #24
33f80f58:	e1833c02 	orr	r3, r3, r2, lsl #24
33f80f5c:	e1830000 	orr	r0, r3, r0
33f80f60:	e1a0f00e 	mov	pc, lr

33f80f64 <string_to_VLAN>:
33f80f64:	e2503000 	subs	r3, r0, #0	; 0x0
33f80f68:	e52de004 	str	lr, [sp, #-4]!
33f80f6c:	e59f203c 	ldr	r2, [pc, #60]	; 33f80fb0 <.text+0xfb0>
33f80f70:	0a00000c 	beq	33f80fa8 <string_to_VLAN+0x44>
33f80f74:	e5d33000 	ldrb	r3, [r3]
33f80f78:	e2433030 	sub	r3, r3, #48	; 0x30
33f80f7c:	e3530009 	cmp	r3, #9	; 0x9
33f80f80:	e3a01000 	mov	r1, #0	; 0x0
33f80f84:	e3a0200a 	mov	r2, #10	; 0xa
33f80f88:	e59fc024 	ldr	ip, [pc, #36]	; 33f80fb4 <.text+0xfb4>
33f80f8c:	8a000002 	bhi	33f80f9c <string_to_VLAN+0x38>
33f80f90:	eb00272c 	bl	33f8ac48 <simple_strtoul>
33f80f94:	e1a00800 	mov	r0, r0, lsl #16
33f80f98:	e1a0c820 	mov	ip, r0, lsr #16
33f80f9c:	e1a0000c 	mov	r0, ip
33f80fa0:	ebffffe0 	bl	33f80f28 <__fswab16>
33f80fa4:	e1a02000 	mov	r2, r0
33f80fa8:	e1a00002 	mov	r0, r2
33f80fac:	e49df004 	ldr	pc, [sp], #4
33f80fb0:	0000ff0f 	andeq	pc, r0, pc, lsl #30
33f80fb4:	00000fff 	streqd	r0, [r0], -pc

33f80fb8 <getenv_VLAN>:
33f80fb8:	e52de004 	str	lr, [sp, #-4]!
33f80fbc:	eb0017f4 	bl	33f86f94 <getenv>
33f80fc0:	ebffffe7 	bl	33f80f64 <string_to_VLAN>
33f80fc4:	e49df004 	ldr	pc, [sp], #4

33f80fc8 <string_to_ip>:
33f80fc8:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f80fcc:	e250c000 	subs	ip, r0, #0	; 0x0
33f80fd0:	e24dd004 	sub	sp, sp, #4	; 0x4
33f80fd4:	01a0000c 	moveq	r0, ip
33f80fd8:	0a000014 	beq	33f81030 <string_to_ip+0x68>
33f80fdc:	e3a03000 	mov	r3, #0	; 0x0
33f80fe0:	e1a05003 	mov	r5, r3
33f80fe4:	e1a04403 	mov	r4, r3, lsl #8
33f80fe8:	e35c0000 	cmp	ip, #0	; 0x0
33f80fec:	e1a0000c 	mov	r0, ip
33f80ff0:	e1a0100d 	mov	r1, sp
33f80ff4:	e3a0200a 	mov	r2, #10	; 0xa
33f80ff8:	e1a03004 	mov	r3, r4
33f80ffc:	0a000006 	beq	33f8101c <string_to_ip+0x54>
33f81000:	eb002710 	bl	33f8ac48 <simple_strtoul>
33f81004:	e59dc000 	ldr	ip, [sp]
33f81008:	e5dc3000 	ldrb	r3, [ip]
33f8100c:	e20000ff 	and	r0, r0, #255	; 0xff
33f81010:	e3530000 	cmp	r3, #0	; 0x0
33f81014:	128cc001 	addne	ip, ip, #1	; 0x1
33f81018:	e1843000 	orr	r3, r4, r0
33f8101c:	e2855001 	add	r5, r5, #1	; 0x1
33f81020:	e3550004 	cmp	r5, #4	; 0x4
33f81024:	1affffee 	bne	33f80fe4 <string_to_ip+0x1c>
33f81028:	e1a00003 	mov	r0, r3
33f8102c:	ebffffc3 	bl	33f80f40 <__fswab32>
33f81030:	e28dd004 	add	sp, sp, #4	; 0x4
33f81034:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

33f81038 <getenv_IPaddr>:
33f81038:	e52de004 	str	lr, [sp, #-4]!
33f8103c:	eb0017d4 	bl	33f86f94 <getenv>
33f81040:	e49de004 	ldr	lr, [sp], #4
33f81044:	eaffffdf 	b	33f80fc8 <string_to_ip>

33f81048 <VLAN_to_string>:
33f81048:	e1a00800 	mov	r0, r0, lsl #16
33f8104c:	e92d4010 	stmdb	sp!, {r4, lr}
33f81050:	e1a00820 	mov	r0, r0, lsr #16
33f81054:	e1a04001 	mov	r4, r1
33f81058:	ebffffb2 	bl	33f80f28 <__fswab16>
33f8105c:	e59f303c 	ldr	r3, [pc, #60]	; 33f810a0 <.text+0x10a0>
33f81060:	e1a0c000 	mov	ip, r0
33f81064:	e15c0003 	cmp	ip, r3
33f81068:	e1a00004 	mov	r0, r4
33f8106c:	e59f1030 	ldr	r1, [pc, #48]	; 33f810a4 <.text+0x10a4>
33f81070:	0a000004 	beq	33f81088 <VLAN_to_string+0x40>
33f81074:	e2433a0f 	sub	r3, r3, #61440	; 0xf000
33f81078:	e1a02a0c 	mov	r2, ip, lsl #20
33f8107c:	e15c0003 	cmp	ip, r3
33f81080:	e1a02a22 	mov	r2, r2, lsr #20
33f81084:	1a000001 	bne	33f81090 <VLAN_to_string+0x48>
33f81088:	e8bd4010 	ldmia	sp!, {r4, lr}
33f8108c:	ea0025a1 	b	33f8a718 <strcpy>
33f81090:	e59f1010 	ldr	r1, [pc, #16]	; 33f810a8 <.text+0x10a8>
33f81094:	e1a00004 	mov	r0, r4
33f81098:	e8bd4010 	ldmia	sp!, {r4, lr}
33f8109c:	ea0028d3 	b	33f8b3f0 <sprintf>
33f810a0:	0000ffff 	streqd	pc, [r0], -pc
33f810a4:	33f92090 	mvnccs	r2, #144	; 0x90
33f810a8:	33f92098 	mvnccs	r2, #152	; 0x98

33f810ac <ip_to_string>:
33f810ac:	e92d4010 	stmdb	sp!, {r4, lr}
33f810b0:	e24dd008 	sub	sp, sp, #8	; 0x8
33f810b4:	e1a04001 	mov	r4, r1
33f810b8:	ebffffa0 	bl	33f80f40 <__fswab32>
33f810bc:	e1a0c000 	mov	ip, r0
33f810c0:	e1a03820 	mov	r3, r0, lsr #16
33f810c4:	e1a0e420 	mov	lr, r0, lsr #8
33f810c8:	e20ee0ff 	and	lr, lr, #255	; 0xff
33f810cc:	e1a02c2c 	mov	r2, ip, lsr #24
33f810d0:	e1a00004 	mov	r0, r4
33f810d4:	e20cc0ff 	and	ip, ip, #255	; 0xff
33f810d8:	e20330ff 	and	r3, r3, #255	; 0xff
33f810dc:	e59f1010 	ldr	r1, [pc, #16]	; 33f810f4 <.text+0x10f4>
33f810e0:	e58de000 	str	lr, [sp]
33f810e4:	e58dc004 	str	ip, [sp, #4]
33f810e8:	eb0028c0 	bl	33f8b3f0 <sprintf>
33f810ec:	e28dd008 	add	sp, sp, #8	; 0x8
33f810f0:	e8bd8010 	ldmia	sp!, {r4, pc}
33f810f4:	33f9209c 	mvnccs	r2, #156	; 0x9c

33f810f8 <print_IPaddr>:
33f810f8:	e92d4010 	stmdb	sp!, {r4, lr}
33f810fc:	e24dd010 	sub	sp, sp, #16	; 0x10
33f81100:	e1a0100d 	mov	r1, sp
33f81104:	ebffffe8 	bl	33f810ac <ip_to_string>
33f81108:	e1a0000d 	mov	r0, sp
33f8110c:	e1a0400d 	mov	r4, sp
33f81110:	eb001abf 	bl	33f87c14 <puts>
33f81114:	e28dd010 	add	sp, sp, #16	; 0x10
33f81118:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8111c <NF_SetCE>:
33f8111c:	e3500000 	cmp	r0, #0	; 0x0
33f81120:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f81124:	05923004 	ldreq	r3, [r2, #4]
33f81128:	03c33002 	biceq	r3, r3, #2	; 0x2
33f8112c:	0a000004 	beq	33f81144 <NF_SetCE+0x28>
33f81130:	e3500001 	cmp	r0, #1	; 0x1
33f81134:	11a0f00e 	movne	pc, lr
33f81138:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f8113c:	e5923004 	ldr	r3, [r2, #4]
33f81140:	e3833002 	orr	r3, r3, #2	; 0x2
33f81144:	e5823004 	str	r3, [r2, #4]
33f81148:	e1a0f00e 	mov	pc, lr

33f8114c <NanD_Address>:
33f8114c:	e3510003 	cmp	r1, #3	; 0x3
33f81150:	13510001 	cmpne	r1, #1	; 0x1
33f81154:	e1a0c002 	mov	ip, r2
33f81158:	03a0344e 	moveq	r3, #1308622848	; 0x4e000000
33f8115c:	020220ff 	andeq	r2, r2, #255	; 0xff
33f81160:	0583200c 	streq	r2, [r3, #12]
33f81164:	e2413002 	sub	r3, r1, #2	; 0x2
33f81168:	e5902000 	ldr	r2, [r0]
33f8116c:	e3530001 	cmp	r3, #1	; 0x1
33f81170:	91a0223c 	movls	r2, ip, lsr r2
33f81174:	95d0003d 	ldrlsb	r0, [r0, #61]
33f81178:	93a01000 	movls	r1, #0	; 0x0
33f8117c:	9a000002 	bls	33f8118c <NanD_Address+0x40>
33f81180:	ea000006 	b	33f811a0 <NanD_Address+0x54>
33f81184:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81188:	e583c00c 	str	ip, [r3, #12]
33f8118c:	e1510000 	cmp	r1, r0
33f81190:	e202c0ff 	and	ip, r2, #255	; 0xff
33f81194:	e2811001 	add	r1, r1, #1	; 0x1
33f81198:	e1a02422 	mov	r2, r2, lsr #8
33f8119c:	bafffff8 	blt	33f81184 <NanD_Address+0x38>
33f811a0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f811a4:	e5933020 	ldr	r3, [r3, #32]
33f811a8:	e3130001 	tst	r3, #1	; 0x1
33f811ac:	0afffffb 	beq	33f811a0 <NanD_Address+0x54>
33f811b0:	e3a00000 	mov	r0, #0	; 0x0
33f811b4:	e1a0f00e 	mov	pc, lr

33f811b8 <NanD_ReadBuf>:
33f811b8:	e3a0c000 	mov	ip, #0	; 0x0
33f811bc:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f811c0:	e583c008 	str	ip, [r3, #8]
33f811c4:	e1a0c002 	mov	ip, r2
33f811c8:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f811cc:	e5933020 	ldr	r3, [r3, #32]
33f811d0:	e3130001 	tst	r3, #1	; 0x1
33f811d4:	0afffffb 	beq	33f811c8 <NanD_ReadBuf+0x10>
33f811d8:	e5903054 	ldr	r3, [r0, #84]
33f811dc:	e3530000 	cmp	r3, #0	; 0x0
33f811e0:	1a00002a 	bne	33f81290 <NanD_ReadBuf+0xd8>
33f811e4:	ea00005a 	b	33f81354 <NanD_ReadBuf+0x19c>
33f811e8:	e5d02010 	ldrb	r2, [r0, #16]
33f811ec:	e3a03000 	mov	r3, #0	; 0x0
33f811f0:	e20220ff 	and	r2, r2, #255	; 0xff
33f811f4:	e5c13001 	strb	r3, [r1, #1]
33f811f8:	e5c12000 	strb	r2, [r1]
33f811fc:	e5d03010 	ldrb	r3, [r0, #16]
33f81200:	e20330ff 	and	r3, r3, #255	; 0xff
33f81204:	e5c13002 	strb	r3, [r1, #2]
33f81208:	e3a03000 	mov	r3, #0	; 0x0
33f8120c:	e5c13003 	strb	r3, [r1, #3]
33f81210:	e5d03010 	ldrb	r3, [r0, #16]
33f81214:	e20330ff 	and	r3, r3, #255	; 0xff
33f81218:	e5c13004 	strb	r3, [r1, #4]
33f8121c:	e3a03000 	mov	r3, #0	; 0x0
33f81220:	e5c13005 	strb	r3, [r1, #5]
33f81224:	e5d03010 	ldrb	r3, [r0, #16]
33f81228:	e20330ff 	and	r3, r3, #255	; 0xff
33f8122c:	e5c13006 	strb	r3, [r1, #6]
33f81230:	e3a03000 	mov	r3, #0	; 0x0
33f81234:	e5c13007 	strb	r3, [r1, #7]
33f81238:	e5d03010 	ldrb	r3, [r0, #16]
33f8123c:	e20330ff 	and	r3, r3, #255	; 0xff
33f81240:	e5c13008 	strb	r3, [r1, #8]
33f81244:	e3a03000 	mov	r3, #0	; 0x0
33f81248:	e5c13009 	strb	r3, [r1, #9]
33f8124c:	e5d03010 	ldrb	r3, [r0, #16]
33f81250:	e20330ff 	and	r3, r3, #255	; 0xff
33f81254:	e5c1300a 	strb	r3, [r1, #10]
33f81258:	e3a03000 	mov	r3, #0	; 0x0
33f8125c:	e5c1300b 	strb	r3, [r1, #11]
33f81260:	e5d03010 	ldrb	r3, [r0, #16]
33f81264:	e20330ff 	and	r3, r3, #255	; 0xff
33f81268:	e5c1300c 	strb	r3, [r1, #12]
33f8126c:	e3a03000 	mov	r3, #0	; 0x0
33f81270:	e5c1300d 	strb	r3, [r1, #13]
33f81274:	e5d03010 	ldrb	r3, [r0, #16]
33f81278:	e20330ff 	and	r3, r3, #255	; 0xff
33f8127c:	e5c1300e 	strb	r3, [r1, #14]
33f81280:	e3a03000 	mov	r3, #0	; 0x0
33f81284:	e5c1300f 	strb	r3, [r1, #15]
33f81288:	e24cc010 	sub	ip, ip, #16	; 0x10
33f8128c:	e2811010 	add	r1, r1, #16	; 0x10
33f81290:	e35c000f 	cmp	ip, #15	; 0xf
33f81294:	e3a0044e 	mov	r0, #1308622848	; 0x4e000000
33f81298:	caffffd2 	bgt	33f811e8 <NanD_ReadBuf+0x30>
33f8129c:	ea000006 	b	33f812bc <NanD_ReadBuf+0x104>
33f812a0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f812a4:	e5d33010 	ldrb	r3, [r3, #16]
33f812a8:	e3a02000 	mov	r2, #0	; 0x0
33f812ac:	e20330ff 	and	r3, r3, #255	; 0xff
33f812b0:	e5c12001 	strb	r2, [r1, #1]
33f812b4:	e5c13000 	strb	r3, [r1]
33f812b8:	e2811002 	add	r1, r1, #2	; 0x2
33f812bc:	e35c0000 	cmp	ip, #0	; 0x0
33f812c0:	e24cc002 	sub	ip, ip, #2	; 0x2
33f812c4:	cafffff5 	bgt	33f812a0 <NanD_ReadBuf+0xe8>
33f812c8:	e1a0f00e 	mov	pc, lr
33f812cc:	e5d23010 	ldrb	r3, [r2, #16]
33f812d0:	e5c13000 	strb	r3, [r1]
33f812d4:	e5d23010 	ldrb	r3, [r2, #16]
33f812d8:	e5c13001 	strb	r3, [r1, #1]
33f812dc:	e5d23010 	ldrb	r3, [r2, #16]
33f812e0:	e5c13002 	strb	r3, [r1, #2]
33f812e4:	e5d23010 	ldrb	r3, [r2, #16]
33f812e8:	e5c13003 	strb	r3, [r1, #3]
33f812ec:	e5d23010 	ldrb	r3, [r2, #16]
33f812f0:	e5c13004 	strb	r3, [r1, #4]
33f812f4:	e5d23010 	ldrb	r3, [r2, #16]
33f812f8:	e5c13005 	strb	r3, [r1, #5]
33f812fc:	e5d23010 	ldrb	r3, [r2, #16]
33f81300:	e5c13006 	strb	r3, [r1, #6]
33f81304:	e5d23010 	ldrb	r3, [r2, #16]
33f81308:	e5c13007 	strb	r3, [r1, #7]
33f8130c:	e5d23010 	ldrb	r3, [r2, #16]
33f81310:	e5c13008 	strb	r3, [r1, #8]
33f81314:	e5d23010 	ldrb	r3, [r2, #16]
33f81318:	e5c13009 	strb	r3, [r1, #9]
33f8131c:	e5d23010 	ldrb	r3, [r2, #16]
33f81320:	e5c1300a 	strb	r3, [r1, #10]
33f81324:	e5d23010 	ldrb	r3, [r2, #16]
33f81328:	e5c1300b 	strb	r3, [r1, #11]
33f8132c:	e5d23010 	ldrb	r3, [r2, #16]
33f81330:	e5c1300c 	strb	r3, [r1, #12]
33f81334:	e5d23010 	ldrb	r3, [r2, #16]
33f81338:	e5c1300d 	strb	r3, [r1, #13]
33f8133c:	e5d23010 	ldrb	r3, [r2, #16]
33f81340:	e5c1300e 	strb	r3, [r1, #14]
33f81344:	e5d23010 	ldrb	r3, [r2, #16]
33f81348:	e24cc010 	sub	ip, ip, #16	; 0x10
33f8134c:	e5c1300f 	strb	r3, [r1, #15]
33f81350:	e2811010 	add	r1, r1, #16	; 0x10
33f81354:	e35c000f 	cmp	ip, #15	; 0xf
33f81358:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f8135c:	caffffda 	bgt	33f812cc <NanD_ReadBuf+0x114>
33f81360:	ea000002 	b	33f81370 <NanD_ReadBuf+0x1b8>
33f81364:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81368:	e5d33010 	ldrb	r3, [r3, #16]
33f8136c:	e4c13001 	strb	r3, [r1], #1
33f81370:	e35c0000 	cmp	ip, #0	; 0x0
33f81374:	e24cc001 	sub	ip, ip, #1	; 0x1
33f81378:	cafffff9 	bgt	33f81364 <NanD_ReadBuf+0x1ac>
33f8137c:	e1a0f00e 	mov	pc, lr

33f81380 <nand_read_oob>:
33f81380:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f81384:	e1a05000 	mov	r5, r0
33f81388:	e5d0003c 	ldrb	r0, [r0, #60]
33f8138c:	e3500000 	cmp	r0, #0	; 0x0
33f81390:	e1a04001 	mov	r4, r1
33f81394:	e1a07002 	mov	r7, r2
33f81398:	e1a0a003 	mov	sl, r3
33f8139c:	e59d901c 	ldr	r9, [sp, #28]
33f813a0:	0a000002 	beq	33f813b0 <nand_read_oob+0x30>
33f813a4:	e3110008 	tst	r1, #8	; 0x8
33f813a8:	02814c01 	addeq	r4, r1, #256	; 0x100
33f813ac:	12444008 	subne	r4, r4, #8	; 0x8
33f813b0:	e3a00000 	mov	r0, #0	; 0x0
33f813b4:	ebffff58 	bl	33f8111c <NF_SetCE>
33f813b8:	e3a02050 	mov	r2, #80	; 0x50
33f813bc:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f813c0:	e5832008 	str	r2, [r3, #8]
33f813c4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f813c8:	e5933020 	ldr	r3, [r3, #32]
33f813cc:	e3130001 	tst	r3, #1	; 0x1
33f813d0:	0afffffb 	beq	33f813c4 <nand_read_oob+0x44>
33f813d4:	e5953054 	ldr	r3, [r5, #84]
33f813d8:	e3530000 	cmp	r3, #0	; 0x0
33f813dc:	01a00005 	moveq	r0, r5
33f813e0:	03a01003 	moveq	r1, #3	; 0x3
33f813e4:	01a02004 	moveq	r2, r4
33f813e8:	0a000008 	beq	33f81410 <nand_read_oob+0x90>
33f813ec:	e5952000 	ldr	r2, [r5]
33f813f0:	e1a01234 	mov	r1, r4, lsr r2
33f813f4:	e5953048 	ldr	r3, [r5, #72]
33f813f8:	e2433001 	sub	r3, r3, #1	; 0x1
33f813fc:	e0043003 	and	r3, r4, r3
33f81400:	e1a030a3 	mov	r3, r3, lsr #1
33f81404:	e0832211 	add	r2, r3, r1, lsl r2
33f81408:	e1a00005 	mov	r0, r5
33f8140c:	e3a01003 	mov	r1, #3	; 0x3
33f81410:	ebffff4d 	bl	33f8114c <NanD_Address>
33f81414:	e5d5303c 	ldrb	r3, [r5, #60]
33f81418:	e3530000 	cmp	r3, #0	; 0x0
33f8141c:	0a000017 	beq	33f81480 <nand_read_oob+0x100>
33f81420:	e3841007 	orr	r1, r4, #7	; 0x7
33f81424:	e0842007 	add	r2, r4, r7
33f81428:	e2813001 	add	r3, r1, #1	; 0x1
33f8142c:	e1520003 	cmp	r2, r3
33f81430:	9a000012 	bls	33f81480 <nand_read_oob+0x100>
33f81434:	e0643001 	rsb	r3, r4, r1
33f81438:	e2836001 	add	r6, r3, #1	; 0x1
33f8143c:	e1a02006 	mov	r2, r6
33f81440:	e1a00005 	mov	r0, r5
33f81444:	e1a01009 	mov	r1, r9
33f81448:	ebffff5a 	bl	33f811b8 <NanD_ReadBuf>
33f8144c:	e3a02050 	mov	r2, #80	; 0x50
33f81450:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81454:	e5832008 	str	r2, [r3, #8]
33f81458:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f8145c:	e5933020 	ldr	r3, [r3, #32]
33f81460:	e3130001 	tst	r3, #1	; 0x1
33f81464:	0afffffb 	beq	33f81458 <nand_read_oob+0xd8>
33f81468:	e3c42f7f 	bic	r2, r4, #508	; 0x1fc
33f8146c:	e3c22003 	bic	r2, r2, #3	; 0x3
33f81470:	e1a00005 	mov	r0, r5
33f81474:	e3a01003 	mov	r1, #3	; 0x3
33f81478:	ebffff33 	bl	33f8114c <NanD_Address>
33f8147c:	ea000000 	b	33f81484 <nand_read_oob+0x104>
33f81480:	e3a06000 	mov	r6, #0	; 0x0
33f81484:	e1a00005 	mov	r0, r5
33f81488:	e0891006 	add	r1, r9, r6
33f8148c:	e0662007 	rsb	r2, r6, r7
33f81490:	ebffff48 	bl	33f811b8 <NanD_ReadBuf>
33f81494:	e58a7000 	str	r7, [sl]
33f81498:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f8149c:	e5933020 	ldr	r3, [r3, #32]
33f814a0:	e3130001 	tst	r3, #1	; 0x1
33f814a4:	0afffffb 	beq	33f81498 <nand_read_oob+0x118>
33f814a8:	e3a00001 	mov	r0, #1	; 0x1
33f814ac:	ebffff1a 	bl	33f8111c <NF_SetCE>
33f814b0:	e3a00000 	mov	r0, #0	; 0x0
33f814b4:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}

33f814b8 <check_block>:
33f814b8:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f814bc:	e5903044 	ldr	r3, [r0, #68]
33f814c0:	e1510003 	cmp	r1, r3
33f814c4:	e59f3104 	ldr	r3, [pc, #260]	; 33f815d0 <.text+0x15d0>
33f814c8:	e24dd018 	sub	sp, sp, #24	; 0x18
33f814cc:	e5934018 	ldr	r4, [r3, #24]
33f814d0:	e1a05000 	mov	r5, r0
33f814d4:	e5903028 	ldr	r3, [r0, #40]
33f814d8:	e590c048 	ldr	ip, [r0, #72]
33f814dc:	2a000038 	bcs	33f815c4 <check_block+0x10c>
33f814e0:	e3540000 	cmp	r4, #0	; 0x0
33f814e4:	b3a00000 	movlt	r0, #0	; 0x0
33f814e8:	ba000036 	blt	33f815c8 <check_block+0x110>
33f814ec:	e5952054 	ldr	r2, [r5, #84]
33f814f0:	e2633000 	rsb	r3, r3, #0	; 0x0
33f814f4:	e0011003 	and	r1, r1, r3
33f814f8:	e3520000 	cmp	r2, #0	; 0x0
33f814fc:	e081700c 	add	r7, r1, ip
33f81500:	e28d6010 	add	r6, sp, #16	; 0x10
33f81504:	0a000017 	beq	33f81568 <check_block+0xb0>
33f81508:	e28d4004 	add	r4, sp, #4	; 0x4
33f8150c:	e3a0200c 	mov	r2, #12	; 0xc
33f81510:	e1a03006 	mov	r3, r6
33f81514:	e58d4000 	str	r4, [sp]
33f81518:	ebffff98 	bl	33f81380 <nand_read_oob>
33f8151c:	e3500000 	cmp	r0, #0	; 0x0
33f81520:	1a000027 	bne	33f815c4 <check_block+0x10c>
33f81524:	e1dd30b8 	ldrh	r3, [sp, #8]
33f81528:	e2033cff 	and	r3, r3, #65280	; 0xff00
33f8152c:	e3530cff 	cmp	r3, #65280	; 0xff00
33f81530:	1a000023 	bne	33f815c4 <check_block+0x10c>
33f81534:	e1a00005 	mov	r0, r5
33f81538:	e1a01007 	mov	r1, r7
33f8153c:	e1a03006 	mov	r3, r6
33f81540:	e3a0200c 	mov	r2, #12	; 0xc
33f81544:	e58d4000 	str	r4, [sp]
33f81548:	ebffff8c 	bl	33f81380 <nand_read_oob>
33f8154c:	e3500000 	cmp	r0, #0	; 0x0
33f81550:	1a00001b 	bne	33f815c4 <check_block+0x10c>
33f81554:	e1dd30b8 	ldrh	r3, [sp, #8]
33f81558:	e2033cff 	and	r3, r3, #65280	; 0xff00
33f8155c:	e2530cff 	subs	r0, r3, #65280	; 0xff00
33f81560:	13a00001 	movne	r0, #1	; 0x1
33f81564:	ea000017 	b	33f815c8 <check_block+0x110>
33f81568:	e0811004 	add	r1, r1, r4
33f8156c:	e28da017 	add	sl, sp, #23	; 0x17
33f81570:	e3a02001 	mov	r2, #1	; 0x1
33f81574:	e1a03006 	mov	r3, r6
33f81578:	e58da000 	str	sl, [sp]
33f8157c:	ebffff7f 	bl	33f81380 <nand_read_oob>
33f81580:	e3500000 	cmp	r0, #0	; 0x0
33f81584:	1a00000e 	bne	33f815c4 <check_block+0x10c>
33f81588:	e5dd3017 	ldrb	r3, [sp, #23]
33f8158c:	e35300ff 	cmp	r3, #255	; 0xff
33f81590:	1a00000b 	bne	33f815c4 <check_block+0x10c>
33f81594:	e0871004 	add	r1, r7, r4
33f81598:	e1a00005 	mov	r0, r5
33f8159c:	e1a03006 	mov	r3, r6
33f815a0:	e3a02001 	mov	r2, #1	; 0x1
33f815a4:	e58da000 	str	sl, [sp]
33f815a8:	ebffff74 	bl	33f81380 <nand_read_oob>
33f815ac:	e3500000 	cmp	r0, #0	; 0x0
33f815b0:	1a000003 	bne	33f815c4 <check_block+0x10c>
33f815b4:	e5dd3017 	ldrb	r3, [sp, #23]
33f815b8:	e25300ff 	subs	r0, r3, #255	; 0xff
33f815bc:	13a00001 	movne	r0, #1	; 0x1
33f815c0:	ea000000 	b	33f815c8 <check_block+0x110>
33f815c4:	e3a00001 	mov	r0, #1	; 0x1
33f815c8:	e28dd018 	add	sp, sp, #24	; 0x18
33f815cc:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f815d0:	33f96244 	mvnccs	r6, #1073741828	; 0x40000004

33f815d4 <nand_calculate_ecc>:
33f815d4:	e3a03000 	mov	r3, #0	; 0x0
33f815d8:	e5c13002 	strb	r3, [r1, #2]
33f815dc:	e5c13001 	strb	r3, [r1, #1]
33f815e0:	e5c13000 	strb	r3, [r1]
33f815e4:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f815e8:	e1a0c003 	mov	ip, r3
33f815ec:	e1a0a003 	mov	sl, r3
33f815f0:	e2815001 	add	r5, r1, #1	; 0x1
33f815f4:	e2819002 	add	r9, r1, #2	; 0x2
33f815f8:	e1a0e003 	mov	lr, r3
33f815fc:	e7dc3000 	ldrb	r3, [ip, r0]
33f81600:	e59f20e0 	ldr	r2, [pc, #224]	; 33f816e8 <.text+0x16e8>
33f81604:	e7d23003 	ldrb	r3, [r2, r3]
33f81608:	e02e200c 	eor	r2, lr, ip
33f8160c:	e3130040 	tst	r3, #64	; 0x40
33f81610:	e28cc001 	add	ip, ip, #1	; 0x1
33f81614:	e02a3003 	eor	r3, sl, r3
33f81618:	1202e0ff 	andne	lr, r2, #255	; 0xff
33f8161c:	e35c0c01 	cmp	ip, #256	; 0x100
33f81620:	e203a0ff 	and	sl, r3, #255	; 0xff
33f81624:	1afffff4 	bne	33f815fc <nand_calculate_ecc+0x28>
33f81628:	e3130040 	tst	r3, #64	; 0x40
33f8162c:	11e0300e 	mvnne	r3, lr
33f81630:	120330ff 	andne	r3, r3, #255	; 0xff
33f81634:	01a0300e 	moveq	r3, lr
33f81638:	e3a00080 	mov	r0, #128	; 0x80
33f8163c:	e3a04000 	mov	r4, #0	; 0x0
33f81640:	e20370ff 	and	r7, r3, #255	; 0xff
33f81644:	e20e60ff 	and	r6, lr, #255	; 0xff
33f81648:	e1a0c000 	mov	ip, r0
33f8164c:	e1a03004 	mov	r3, r4
33f81650:	e1160000 	tst	r6, r0
33f81654:	e2833001 	add	r3, r3, #1	; 0x1
33f81658:	1184400c 	orrne	r4, r4, ip
33f8165c:	e1a020ac 	mov	r2, ip, lsr #1
33f81660:	e1170000 	tst	r7, r0
33f81664:	e20330ff 	and	r3, r3, #255	; 0xff
33f81668:	11844002 	orrne	r4, r4, r2
33f8166c:	e3530004 	cmp	r3, #4	; 0x4
33f81670:	e1a0c0a2 	mov	ip, r2, lsr #1
33f81674:	e1a000a0 	mov	r0, r0, lsr #1
33f81678:	1afffff4 	bne	33f81650 <nand_calculate_ecc+0x7c>
33f8167c:	e3a0c000 	mov	ip, #0	; 0x0
33f81680:	e3a0e080 	mov	lr, #128	; 0x80
33f81684:	e1a0300c 	mov	r3, ip
33f81688:	e1160000 	tst	r6, r0
33f8168c:	e2833001 	add	r3, r3, #1	; 0x1
33f81690:	118cc00e 	orrne	ip, ip, lr
33f81694:	e1a020ae 	mov	r2, lr, lsr #1
33f81698:	e1170000 	tst	r7, r0
33f8169c:	e20330ff 	and	r3, r3, #255	; 0xff
33f816a0:	118cc002 	orrne	ip, ip, r2
33f816a4:	e3530004 	cmp	r3, #4	; 0x4
33f816a8:	e1a000a0 	mov	r0, r0, lsr #1
33f816ac:	e1a0e0a2 	mov	lr, r2, lsr #1
33f816b0:	1afffff4 	bne	33f81688 <nand_calculate_ecc+0xb4>
33f816b4:	e5c14000 	strb	r4, [r1]
33f816b8:	e5c5c000 	strb	ip, [r5]
33f816bc:	e5d13000 	ldrb	r3, [r1]
33f816c0:	e1e03003 	mvn	r3, r3
33f816c4:	e5c13000 	strb	r3, [r1]
33f816c8:	e1e0300a 	mvn	r3, sl
33f816cc:	e5d52000 	ldrb	r2, [r5]
33f816d0:	e1a03103 	mov	r3, r3, lsl #2
33f816d4:	e1e02002 	mvn	r2, r2
33f816d8:	e3833003 	orr	r3, r3, #3	; 0x3
33f816dc:	e5c52000 	strb	r2, [r5]
33f816e0:	e5c93000 	strb	r3, [r9]
33f816e4:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f816e8:	33f9159a 	mvnccs	r1, #645922816	; 0x26800000

33f816ec <nand_correct_data>:
33f816ec:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f816f0:	e1a06001 	mov	r6, r1
33f816f4:	e1a07002 	mov	r7, r2
33f816f8:	e5d13001 	ldrb	r3, [r1, #1]
33f816fc:	e4d7a001 	ldrb	sl, [r7], #1
33f81700:	e4d64001 	ldrb	r4, [r6], #1
33f81704:	e5d2c001 	ldrb	ip, [r2, #1]
33f81708:	e1a05001 	mov	r5, r1
33f8170c:	e5d2e002 	ldrb	lr, [r2, #2]
33f81710:	e5d11002 	ldrb	r1, [r1, #2]
33f81714:	e02cc003 	eor	ip, ip, r3
33f81718:	e02a4004 	eor	r4, sl, r4
33f8171c:	e02ee001 	eor	lr, lr, r1
33f81720:	e184300c 	orr	r3, r4, ip
33f81724:	e19e3003 	orrs	r3, lr, r3
33f81728:	e1a09000 	mov	r9, r0
33f8172c:	e2851002 	add	r1, r5, #2	; 0x2
33f81730:	e2820002 	add	r0, r2, #2	; 0x2
33f81734:	01a00003 	moveq	r0, r3
33f81738:	08bd86f0 	ldmeqia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f8173c:	e02420a4 	eor	r2, r4, r4, lsr #1
33f81740:	e02c30ac 	eor	r3, ip, ip, lsr #1
33f81744:	e2022055 	and	r2, r2, #85	; 0x55
33f81748:	e2033055 	and	r3, r3, #85	; 0x55
33f8174c:	e3520055 	cmp	r2, #85	; 0x55
33f81750:	03530055 	cmpeq	r3, #85	; 0x55
33f81754:	1a00002f 	bne	33f81818 <nand_correct_data+0x12c>
33f81758:	e02e30ae 	eor	r3, lr, lr, lsr #1
33f8175c:	e2033054 	and	r3, r3, #84	; 0x54
33f81760:	e3530054 	cmp	r3, #84	; 0x54
33f81764:	1a00002b 	bne	33f81818 <nand_correct_data+0x12c>
33f81768:	e3a02080 	mov	r2, #128	; 0x80
33f8176c:	e3a05000 	mov	r5, #0	; 0x0
33f81770:	e1a01002 	mov	r1, r2
33f81774:	e1a03005 	mov	r3, r5
33f81778:	e2833001 	add	r3, r3, #1	; 0x1
33f8177c:	e1140001 	tst	r4, r1
33f81780:	e20330ff 	and	r3, r3, #255	; 0xff
33f81784:	11855002 	orrne	r5, r5, r2
33f81788:	e3530004 	cmp	r3, #4	; 0x4
33f8178c:	e1a01121 	mov	r1, r1, lsr #2
33f81790:	e1a020a2 	mov	r2, r2, lsr #1
33f81794:	1afffff7 	bne	33f81778 <nand_correct_data+0x8c>
33f81798:	e3a01080 	mov	r1, #128	; 0x80
33f8179c:	e3a03000 	mov	r3, #0	; 0x0
33f817a0:	e2833001 	add	r3, r3, #1	; 0x1
33f817a4:	e11c0001 	tst	ip, r1
33f817a8:	e20330ff 	and	r3, r3, #255	; 0xff
33f817ac:	11855002 	orrne	r5, r5, r2
33f817b0:	e3530004 	cmp	r3, #4	; 0x4
33f817b4:	e1a01121 	mov	r1, r1, lsr #2
33f817b8:	e1a020a2 	mov	r2, r2, lsr #1
33f817bc:	1afffff7 	bne	33f817a0 <nand_correct_data+0xb4>
33f817c0:	e3a0c000 	mov	ip, #0	; 0x0
33f817c4:	e3a01004 	mov	r1, #4	; 0x4
33f817c8:	e3a02080 	mov	r2, #128	; 0x80
33f817cc:	e1a0300c 	mov	r3, ip
33f817d0:	e2833001 	add	r3, r3, #1	; 0x1
33f817d4:	e11e0002 	tst	lr, r2
33f817d8:	e20330ff 	and	r3, r3, #255	; 0xff
33f817dc:	118cc001 	orrne	ip, ip, r1
33f817e0:	e3530003 	cmp	r3, #3	; 0x3
33f817e4:	e1a02122 	mov	r2, r2, lsr #2
33f817e8:	e1a010a1 	mov	r1, r1, lsr #1
33f817ec:	1afffff7 	bne	33f817d0 <nand_correct_data+0xe4>
33f817f0:	e7d93005 	ldrb	r3, [r9, r5]
33f817f4:	e3a02001 	mov	r2, #1	; 0x1
33f817f8:	e0233c12 	eor	r3, r3, r2, lsl ip
33f817fc:	e1a00002 	mov	r0, r2
33f81800:	e7c93005 	strb	r3, [r9, r5]
33f81804:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f81808:	e3140001 	tst	r4, #1	; 0x1
33f8180c:	120230ff 	andne	r3, r2, #255	; 0xff
33f81810:	e1a040a4 	mov	r4, r4, lsr #1
33f81814:	ea000000 	b	33f8181c <nand_correct_data+0x130>
33f81818:	e3a03000 	mov	r3, #0	; 0x0
33f8181c:	e3540000 	cmp	r4, #0	; 0x0
33f81820:	e2832001 	add	r2, r3, #1	; 0x1
33f81824:	1afffff7 	bne	33f81808 <nand_correct_data+0x11c>
33f81828:	ea000002 	b	33f81838 <nand_correct_data+0x14c>
33f8182c:	e31c0001 	tst	ip, #1	; 0x1
33f81830:	120230ff 	andne	r3, r2, #255	; 0xff
33f81834:	e1a0c0ac 	mov	ip, ip, lsr #1
33f81838:	e35c0000 	cmp	ip, #0	; 0x0
33f8183c:	e2832001 	add	r2, r3, #1	; 0x1
33f81840:	1afffff9 	bne	33f8182c <nand_correct_data+0x140>
33f81844:	ea000002 	b	33f81854 <nand_correct_data+0x168>
33f81848:	e31e0001 	tst	lr, #1	; 0x1
33f8184c:	120230ff 	andne	r3, r2, #255	; 0xff
33f81850:	e1a0e0ae 	mov	lr, lr, lsr #1
33f81854:	e35e0000 	cmp	lr, #0	; 0x0
33f81858:	e2832001 	add	r2, r3, #1	; 0x1
33f8185c:	1afffff9 	bne	33f81848 <nand_correct_data+0x15c>
33f81860:	e3530001 	cmp	r3, #1	; 0x1
33f81864:	05c5a000 	streqb	sl, [r5]
33f81868:	05d73000 	ldreqb	r3, [r7]
33f8186c:	05c63000 	streqb	r3, [r6]
33f81870:	05d03000 	ldreqb	r3, [r0]
33f81874:	13e00000 	mvnne	r0, #0	; 0x0
33f81878:	03a00002 	moveq	r0, #2	; 0x2
33f8187c:	05c13000 	streqb	r3, [r1]
33f81880:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}

33f81884 <nand_write_oob>:
33f81884:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f81888:	e1a05000 	mov	r5, r0
33f8188c:	e3a00000 	mov	r0, #0	; 0x0
33f81890:	e1a07002 	mov	r7, r2
33f81894:	e1a0a003 	mov	sl, r3
33f81898:	e1a04001 	mov	r4, r1
33f8189c:	e59d901c 	ldr	r9, [sp, #28]
33f818a0:	ebfffe1d 	bl	33f8111c <NF_SetCE>
33f818a4:	e3a020ff 	mov	r2, #255	; 0xff
33f818a8:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f818ac:	e5832008 	str	r2, [r3, #8]
33f818b0:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f818b4:	e5923020 	ldr	r3, [r2, #32]
33f818b8:	e3130001 	tst	r3, #1	; 0x1
33f818bc:	0afffffb 	beq	33f818b0 <nand_write_oob+0x2c>
33f818c0:	e3a03050 	mov	r3, #80	; 0x50
33f818c4:	e5823008 	str	r3, [r2, #8]
33f818c8:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f818cc:	e5933020 	ldr	r3, [r3, #32]
33f818d0:	e3130001 	tst	r3, #1	; 0x1
33f818d4:	0afffffb 	beq	33f818c8 <nand_write_oob+0x44>
33f818d8:	e5953054 	ldr	r3, [r5, #84]
33f818dc:	e3530000 	cmp	r3, #0	; 0x0
33f818e0:	01a00005 	moveq	r0, r5
33f818e4:	03a01003 	moveq	r1, #3	; 0x3
33f818e8:	01a02004 	moveq	r2, r4
33f818ec:	0a000008 	beq	33f81914 <nand_write_oob+0x90>
33f818f0:	e5952000 	ldr	r2, [r5]
33f818f4:	e1a01234 	mov	r1, r4, lsr r2
33f818f8:	e5953048 	ldr	r3, [r5, #72]
33f818fc:	e2433001 	sub	r3, r3, #1	; 0x1
33f81900:	e0043003 	and	r3, r4, r3
33f81904:	e1a030a3 	mov	r3, r3, lsr #1
33f81908:	e0832211 	add	r2, r3, r1, lsl r2
33f8190c:	e1a00005 	mov	r0, r5
33f81910:	e3a01003 	mov	r1, #3	; 0x3
33f81914:	ebfffe0c 	bl	33f8114c <NanD_Address>
33f81918:	e5d5303c 	ldrb	r3, [r5, #60]
33f8191c:	e3530000 	cmp	r3, #0	; 0x0
33f81920:	0a000002 	beq	33f81930 <nand_write_oob+0xac>
33f81924:	e3140008 	tst	r4, #8	; 0x8
33f81928:	02844c01 	addeq	r4, r4, #256	; 0x100
33f8192c:	12444008 	subne	r4, r4, #8	; 0x8
33f81930:	e3a02080 	mov	r2, #128	; 0x80
33f81934:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81938:	e5832008 	str	r2, [r3, #8]
33f8193c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81940:	e5933020 	ldr	r3, [r3, #32]
33f81944:	e3130001 	tst	r3, #1	; 0x1
33f81948:	0afffffb 	beq	33f8193c <nand_write_oob+0xb8>
33f8194c:	e5953054 	ldr	r3, [r5, #84]
33f81950:	e3530000 	cmp	r3, #0	; 0x0
33f81954:	01a00005 	moveq	r0, r5
33f81958:	03a01003 	moveq	r1, #3	; 0x3
33f8195c:	01a02004 	moveq	r2, r4
33f81960:	0a000008 	beq	33f81988 <nand_write_oob+0x104>
33f81964:	e5952000 	ldr	r2, [r5]
33f81968:	e1a01234 	mov	r1, r4, lsr r2
33f8196c:	e5953048 	ldr	r3, [r5, #72]
33f81970:	e2433001 	sub	r3, r3, #1	; 0x1
33f81974:	e0043003 	and	r3, r4, r3
33f81978:	e1a030a3 	mov	r3, r3, lsr #1
33f8197c:	e0832211 	add	r2, r3, r1, lsl r2
33f81980:	e1a00005 	mov	r0, r5
33f81984:	e3a01003 	mov	r1, #3	; 0x3
33f81988:	ebfffdef 	bl	33f8114c <NanD_Address>
33f8198c:	e5d5303c 	ldrb	r3, [r5, #60]
33f81990:	e3530000 	cmp	r3, #0	; 0x0
33f81994:	0a00002a 	beq	33f81a44 <nand_write_oob+0x1c0>
33f81998:	e3841007 	orr	r1, r4, #7	; 0x7
33f8199c:	e2813001 	add	r3, r1, #1	; 0x1
33f819a0:	e0842007 	add	r2, r4, r7
33f819a4:	e1520003 	cmp	r2, r3
33f819a8:	80643001 	rsbhi	r3, r4, r1
33f819ac:	82836001 	addhi	r6, r3, #1	; 0x1
33f819b0:	83a01000 	movhi	r1, #0	; 0x0
33f819b4:	8a000004 	bhi	33f819cc <nand_write_oob+0x148>
33f819b8:	ea000021 	b	33f81a44 <nand_write_oob+0x1c0>
33f819bc:	e7d92001 	ldrb	r2, [r9, r1]
33f819c0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f819c4:	e5c32010 	strb	r2, [r3, #16]
33f819c8:	e2811001 	add	r1, r1, #1	; 0x1
33f819cc:	e1510006 	cmp	r1, r6
33f819d0:	bafffff9 	blt	33f819bc <nand_write_oob+0x138>
33f819d4:	e3a02010 	mov	r2, #16	; 0x10
33f819d8:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f819dc:	e5832008 	str	r2, [r3, #8]
33f819e0:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f819e4:	e5923020 	ldr	r3, [r2, #32]
33f819e8:	e3130001 	tst	r3, #1	; 0x1
33f819ec:	0afffffb 	beq	33f819e0 <nand_write_oob+0x15c>
33f819f0:	e3a03070 	mov	r3, #112	; 0x70
33f819f4:	e5823008 	str	r3, [r2, #8]
33f819f8:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f819fc:	e5923020 	ldr	r3, [r2, #32]
33f81a00:	e3130001 	tst	r3, #1	; 0x1
33f81a04:	0afffffb 	beq	33f819f8 <nand_write_oob+0x174>
33f81a08:	e5d23010 	ldrb	r3, [r2, #16]
33f81a0c:	e3130001 	tst	r3, #1	; 0x1
33f81a10:	1a000032 	bne	33f81ae0 <nand_write_oob+0x25c>
33f81a14:	e3a03080 	mov	r3, #128	; 0x80
33f81a18:	e5823008 	str	r3, [r2, #8]
33f81a1c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81a20:	e5933020 	ldr	r3, [r3, #32]
33f81a24:	e3130001 	tst	r3, #1	; 0x1
33f81a28:	0afffffb 	beq	33f81a1c <nand_write_oob+0x198>
33f81a2c:	e3c42f7f 	bic	r2, r4, #508	; 0x1fc
33f81a30:	e3c22003 	bic	r2, r2, #3	; 0x3
33f81a34:	e1a00005 	mov	r0, r5
33f81a38:	e3a01003 	mov	r1, #3	; 0x3
33f81a3c:	ebfffdc2 	bl	33f8114c <NanD_Address>
33f81a40:	ea000000 	b	33f81a48 <nand_write_oob+0x1c4>
33f81a44:	e3a06000 	mov	r6, #0	; 0x0
33f81a48:	e5953054 	ldr	r3, [r5, #84]
33f81a4c:	e3530000 	cmp	r3, #0	; 0x0
33f81a50:	e0893006 	add	r3, r9, r6
33f81a54:	01a00003 	moveq	r0, r3
33f81a58:	01a01006 	moveq	r1, r6
33f81a5c:	11a00003 	movne	r0, r3
33f81a60:	11a01006 	movne	r1, r6
33f81a64:	1a000003 	bne	33f81a78 <nand_write_oob+0x1f4>
33f81a68:	ea000009 	b	33f81a94 <nand_write_oob+0x210>
33f81a6c:	e4d02002 	ldrb	r2, [r0], #2
33f81a70:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81a74:	e5c32010 	strb	r2, [r3, #16]
33f81a78:	e1510007 	cmp	r1, r7
33f81a7c:	e2811002 	add	r1, r1, #2	; 0x2
33f81a80:	3afffff9 	bcc	33f81a6c <nand_write_oob+0x1e8>
33f81a84:	ea000005 	b	33f81aa0 <nand_write_oob+0x21c>
33f81a88:	e4d02001 	ldrb	r2, [r0], #1
33f81a8c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81a90:	e5c32010 	strb	r2, [r3, #16]
33f81a94:	e1510007 	cmp	r1, r7
33f81a98:	e2811001 	add	r1, r1, #1	; 0x1
33f81a9c:	3afffff9 	bcc	33f81a88 <nand_write_oob+0x204>
33f81aa0:	e3a02010 	mov	r2, #16	; 0x10
33f81aa4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81aa8:	e5832008 	str	r2, [r3, #8]
33f81aac:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f81ab0:	e5923020 	ldr	r3, [r2, #32]
33f81ab4:	e3130001 	tst	r3, #1	; 0x1
33f81ab8:	0afffffb 	beq	33f81aac <nand_write_oob+0x228>
33f81abc:	e3a03070 	mov	r3, #112	; 0x70
33f81ac0:	e5823008 	str	r3, [r2, #8]
33f81ac4:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f81ac8:	e5923020 	ldr	r3, [r2, #32]
33f81acc:	e3130001 	tst	r3, #1	; 0x1
33f81ad0:	0afffffb 	beq	33f81ac4 <nand_write_oob+0x240>
33f81ad4:	e5d23010 	ldrb	r3, [r2, #16]
33f81ad8:	e2134001 	ands	r4, r3, #1	; 0x1
33f81adc:	0a000007 	beq	33f81b00 <nand_write_oob+0x27c>
33f81ae0:	e59f002c 	ldr	r0, [pc, #44]	; 33f81b14 <.text+0x1b14>
33f81ae4:	eb00184a 	bl	33f87c14 <puts>
33f81ae8:	e3a00001 	mov	r0, #1	; 0x1
33f81aec:	ebfffd8a 	bl	33f8111c <NF_SetCE>
33f81af0:	e3a03000 	mov	r3, #0	; 0x0
33f81af4:	e3e00000 	mvn	r0, #0	; 0x0
33f81af8:	e58a3000 	str	r3, [sl]
33f81afc:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f81b00:	e3a00001 	mov	r0, #1	; 0x1
33f81b04:	ebfffd84 	bl	33f8111c <NF_SetCE>
33f81b08:	e1a00004 	mov	r0, r4
33f81b0c:	e58a7000 	str	r7, [sl]
33f81b10:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f81b14:	33f920a8 	mvnccs	r2, #168	; 0xa8

33f81b18 <nand_probe>:
33f81b18:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f81b1c:	e59f2328 	ldr	r2, [pc, #808]	; 33f81e4c <.text+0x1e4c>
33f81b20:	e59f5328 	ldr	r5, [pc, #808]	; 33f81e50 <.text+0x1e50>
33f81b24:	e3a03005 	mov	r3, #5	; 0x5
33f81b28:	e5d54018 	ldrb	r4, [r5, #24]
33f81b2c:	e5823018 	str	r3, [r2, #24]
33f81b30:	e3a03001 	mov	r3, #1	; 0x1
33f81b34:	e5823004 	str	r3, [r2, #4]
33f81b38:	e0833003 	add	r3, r3, r3
33f81b3c:	e5823008 	str	r3, [r2, #8]
33f81b40:	e2833001 	add	r3, r3, #1	; 0x1
33f81b44:	e582300c 	str	r3, [r2, #12]
33f81b48:	e2833003 	add	r3, r3, #3	; 0x3
33f81b4c:	e5823010 	str	r3, [r2, #16]
33f81b50:	e2833001 	add	r3, r3, #1	; 0x1
33f81b54:	e3a01000 	mov	r1, #0	; 0x0
33f81b58:	e3540000 	cmp	r4, #0	; 0x0
33f81b5c:	e5823014 	str	r3, [r2, #20]
33f81b60:	e3a03004 	mov	r3, #4	; 0x4
33f81b64:	e1a06000 	mov	r6, r0
33f81b68:	e582301c 	str	r3, [r2, #28]
33f81b6c:	e5821000 	str	r1, [r2]
33f81b70:	11a00001 	movne	r0, r1
33f81b74:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
33f81b78:	e1a00005 	mov	r0, r5
33f81b7c:	e1a01004 	mov	r1, r4
33f81b80:	e3a02058 	mov	r2, #88	; 0x58
33f81b84:	eb0023b9 	bl	33f8aa70 <memset>
33f81b88:	e3e03000 	mvn	r3, #0	; 0x0
33f81b8c:	e5856040 	str	r6, [r5, #64]
33f81b90:	e585300c 	str	r3, [r5, #12]
33f81b94:	e5854030 	str	r4, [r5, #48]
33f81b98:	e5854038 	str	r4, [r5, #56]
33f81b9c:	e585402c 	str	r4, [r5, #44]
33f81ba0:	e1a07004 	mov	r7, r4
33f81ba4:	e3a00000 	mov	r0, #0	; 0x0
33f81ba8:	ebfffd5b 	bl	33f8111c <NF_SetCE>
33f81bac:	e3a020ff 	mov	r2, #255	; 0xff
33f81bb0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f81bb4:	e5832008 	str	r2, [r3, #8]
33f81bb8:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f81bbc:	e5923020 	ldr	r3, [r2, #32]
33f81bc0:	e3130001 	tst	r3, #1	; 0x1
33f81bc4:	0afffffb 	beq	33f81bb8 <nand_probe+0xa0>
33f81bc8:	e3a03090 	mov	r3, #144	; 0x90
33f81bcc:	e5823008 	str	r3, [r2, #8]
33f81bd0:	e3a0444e 	mov	r4, #1308622848	; 0x4e000000
33f81bd4:	e5943020 	ldr	r3, [r4, #32]
33f81bd8:	e3130001 	tst	r3, #1	; 0x1
33f81bdc:	0afffffb 	beq	33f81bd0 <nand_probe+0xb8>
33f81be0:	e59f5268 	ldr	r5, [pc, #616]	; 33f81e50 <.text+0x1e50>
33f81be4:	e3a01001 	mov	r1, #1	; 0x1
33f81be8:	e3a02000 	mov	r2, #0	; 0x0
33f81bec:	e1a00005 	mov	r0, r5
33f81bf0:	ebfffd55 	bl	33f8114c <NanD_Address>
33f81bf4:	e5d43010 	ldrb	r3, [r4, #16]
33f81bf8:	e5d42010 	ldrb	r2, [r4, #16]
33f81bfc:	e3a00001 	mov	r0, #1	; 0x1
33f81c00:	e20340ff 	and	r4, r3, #255	; 0xff
33f81c04:	e20260ff 	and	r6, r2, #255	; 0xff
33f81c08:	ebfffd43 	bl	33f8111c <NF_SetCE>
33f81c0c:	e3540000 	cmp	r4, #0	; 0x0
33f81c10:	135400ff 	cmpne	r4, #255	; 0xff
33f81c14:	13a01000 	movne	r1, #0	; 0x0
33f81c18:	03a01001 	moveq	r1, #1	; 0x1
33f81c1c:	0a000074 	beq	33f81df4 <nand_probe+0x2dc>
33f81c20:	e595302c 	ldr	r3, [r5, #44]
33f81c24:	e3530000 	cmp	r3, #0	; 0x0
33f81c28:	0a000007 	beq	33f81c4c <nand_probe+0x134>
33f81c2c:	e1530004 	cmp	r3, r4
33f81c30:	1a000002 	bne	33f81c40 <nand_probe+0x128>
33f81c34:	e5953030 	ldr	r3, [r5, #48]
33f81c38:	e1530006 	cmp	r3, r6
33f81c3c:	0a000065 	beq	33f81dd8 <nand_probe+0x2c0>
33f81c40:	e59f020c 	ldr	r0, [pc, #524]	; 33f81e54 <.text+0x1e54>
33f81c44:	e1a02007 	mov	r2, r7
33f81c48:	eb001804 	bl	33f87c60 <printf>
33f81c4c:	e59f2204 	ldr	r2, [pc, #516]	; 33f81e58 <.text+0x1e58>
33f81c50:	e1a0c002 	mov	ip, r2
33f81c54:	ea000027 	b	33f81cf8 <nand_probe+0x1e0>
33f81c58:	e5923004 	ldr	r3, [r2, #4]
33f81c5c:	e1540003 	cmp	r4, r3
33f81c60:	1a000022 	bne	33f81cf0 <nand_probe+0x1d8>
33f81c64:	e5923008 	ldr	r3, [r2, #8]
33f81c68:	e1560003 	cmp	r6, r3
33f81c6c:	1a00001f 	bne	33f81cf0 <nand_probe+0x1d8>
33f81c70:	e59f11d8 	ldr	r1, [pc, #472]	; 33f81e50 <.text+0x1e50>
33f81c74:	e591302c 	ldr	r3, [r1, #44]
33f81c78:	e3530000 	cmp	r3, #0	; 0x0
33f81c7c:	1a00005c 	bne	33f81df4 <nand_probe+0x2dc>
33f81c80:	e5dc3010 	ldrb	r3, [ip, #16]
33f81c84:	e5c1303c 	strb	r3, [r1, #60]
33f81c88:	e5d1303c 	ldrb	r3, [r1, #60]
33f81c8c:	e3530000 	cmp	r3, #0	; 0x0
33f81c90:	03a03009 	moveq	r3, #9	; 0x9
33f81c94:	05813000 	streq	r3, [r1]
33f81c98:	e59c200c 	ldr	r2, [ip, #12]
33f81c9c:	03a03c02 	moveq	r3, #512	; 0x200
33f81ca0:	e3a00c01 	mov	r0, #256	; 0x100
33f81ca4:	13a03008 	movne	r3, #8	; 0x8
33f81ca8:	05813048 	streq	r3, [r1, #72]
33f81cac:	02433e1f 	subeq	r3, r3, #496	; 0x1f0
33f81cb0:	e5812020 	str	r2, [r1, #32]
33f81cb4:	e5810050 	str	r0, [r1, #80]
33f81cb8:	15813000 	strne	r3, [r1]
33f81cbc:	15810048 	strne	r0, [r1, #72]
33f81cc0:	e581304c 	str	r3, [r1, #76]
33f81cc4:	e581402c 	str	r4, [r1, #44]
33f81cc8:	e59f3180 	ldr	r3, [pc, #384]	; 33f81e50 <.text+0x1e50>
33f81ccc:	e5816030 	str	r6, [r1, #48]
33f81cd0:	e59c0018 	ldr	r0, [ip, #24]
33f81cd4:	e5dc2011 	ldrb	r2, [ip, #17]
33f81cd8:	e59c1014 	ldr	r1, [ip, #20]
33f81cdc:	e5830054 	str	r0, [r3, #84]
33f81ce0:	e5c3203d 	strb	r2, [r3, #61]
33f81ce4:	e5831028 	str	r1, [r3, #40]
33f81ce8:	e583e024 	str	lr, [r3, #36]
33f81cec:	ea000039 	b	33f81dd8 <nand_probe+0x2c0>
33f81cf0:	e28cc01c 	add	ip, ip, #28	; 0x1c
33f81cf4:	e282201c 	add	r2, r2, #28	; 0x1c
33f81cf8:	e592e000 	ldr	lr, [r2]
33f81cfc:	e35e0000 	cmp	lr, #0	; 0x0
33f81d00:	1affffd4 	bne	33f81c58 <nand_probe+0x140>
33f81d04:	ea00003a 	b	33f81df4 <nand_probe+0x2dc>
33f81d08:	e3a0300c 	mov	r3, #12	; 0xc
33f81d0c:	e0000093 	mul	r0, r3, r0
33f81d10:	eb0019c4 	bl	33f88428 <malloc>
33f81d14:	e59f3134 	ldr	r3, [pc, #308]	; 33f81e50 <.text+0x1e50>
33f81d18:	e3500000 	cmp	r0, #0	; 0x0
33f81d1c:	e583001c 	str	r0, [r3, #28]
33f81d20:	13a00000 	movne	r0, #0	; 0x0
33f81d24:	11a01000 	movne	r1, r0
33f81d28:	1a000010 	bne	33f81d70 <nand_probe+0x258>
33f81d2c:	e59f0128 	ldr	r0, [pc, #296]	; 33f81e5c <.text+0x1e5c>
33f81d30:	eb0017b7 	bl	33f87c14 <puts>
33f81d34:	ea000012 	b	33f81d84 <nand_probe+0x26c>
33f81d38:	e592301c 	ldr	r3, [r2, #28]
33f81d3c:	e7c1c003 	strb	ip, [r1, r3]
33f81d40:	e592301c 	ldr	r3, [r2, #28]
33f81d44:	e0813003 	add	r3, r1, r3
33f81d48:	e5c30001 	strb	r0, [r3, #1]
33f81d4c:	e592301c 	ldr	r3, [r2, #28]
33f81d50:	e0813003 	add	r3, r1, r3
33f81d54:	e583c004 	str	ip, [r3, #4]
33f81d58:	e592301c 	ldr	r3, [r2, #28]
33f81d5c:	e3a02050 	mov	r2, #80	; 0x50
33f81d60:	e0813003 	add	r3, r1, r3
33f81d64:	e5c32008 	strb	r2, [r3, #8]
33f81d68:	e2800001 	add	r0, r0, #1	; 0x1
33f81d6c:	e281100c 	add	r1, r1, #12	; 0xc
33f81d70:	e1500007 	cmp	r0, r7
33f81d74:	e59f20d4 	ldr	r2, [pc, #212]	; 33f81e50 <.text+0x1e50>
33f81d78:	e3a0c000 	mov	ip, #0	; 0x0
33f81d7c:	baffffed 	blt	33f81d38 <nand_probe+0x220>
33f81d80:	ea000020 	b	33f81e08 <nand_probe+0x2f0>
33f81d84:	e59f50c4 	ldr	r5, [pc, #196]	; 33f81e50 <.text+0x1e50>
33f81d88:	e5954044 	ldr	r4, [r5, #68]
33f81d8c:	e3540000 	cmp	r4, #0	; 0x0
33f81d90:	0a000026 	beq	33f81e30 <nand_probe+0x318>
33f81d94:	e59f20c4 	ldr	r2, [pc, #196]	; 33f81e60 <.text+0x1e60>
33f81d98:	e5923000 	ldr	r3, [r2]
33f81d9c:	e3730001 	cmn	r3, #1	; 0x1
33f81da0:	e3a03001 	mov	r3, #1	; 0x1
33f81da4:	e5c53018 	strb	r3, [r5, #24]
33f81da8:	03a03000 	moveq	r3, #0	; 0x0
33f81dac:	05823000 	streq	r3, [r2]
33f81db0:	e2853048 	add	r3, r5, #72	; 0x48
33f81db4:	e8930009 	ldmia	r3, {r0, r3}
33f81db8:	e0800003 	add	r0, r0, r3
33f81dbc:	eb001999 	bl	33f88428 <malloc>
33f81dc0:	e3500000 	cmp	r0, #0	; 0x0
33f81dc4:	e1a04000 	mov	r4, r0
33f81dc8:	e5850004 	str	r0, [r5, #4]
33f81dcc:	15950044 	ldrne	r0, [r5, #68]
33f81dd0:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
33f81dd4:	ea000011 	b	33f81e20 <nand_probe+0x308>
33f81dd8:	e59f2070 	ldr	r2, [pc, #112]	; 33f81e50 <.text+0x1e50>
33f81ddc:	e5923038 	ldr	r3, [r2, #56]
33f81de0:	e2877001 	add	r7, r7, #1	; 0x1
33f81de4:	e2833001 	add	r3, r3, #1	; 0x1
33f81de8:	e3570000 	cmp	r7, #0	; 0x0
33f81dec:	e5823038 	str	r3, [r2, #56]
33f81df0:	daffff6b 	ble	33f81ba4 <nand_probe+0x8c>
33f81df4:	e59f3054 	ldr	r3, [pc, #84]	; 33f81e50 <.text+0x1e50>
33f81df8:	e5930038 	ldr	r0, [r3, #56]
33f81dfc:	e3500000 	cmp	r0, #0	; 0x0
33f81e00:	0affffdf 	beq	33f81d84 <nand_probe+0x26c>
33f81e04:	eaffffbf 	b	33f81d08 <nand_probe+0x1f0>
33f81e08:	e59f3040 	ldr	r3, [pc, #64]	; 33f81e50 <.text+0x1e50>
33f81e0c:	e5932038 	ldr	r2, [r3, #56]
33f81e10:	e5931020 	ldr	r1, [r3, #32]
33f81e14:	e1a02112 	mov	r2, r2, lsl r1
33f81e18:	e5832044 	str	r2, [r3, #68]
33f81e1c:	eaffffd8 	b	33f81d84 <nand_probe+0x26c>
33f81e20:	e59f003c 	ldr	r0, [pc, #60]	; 33f81e64 <.text+0x1e64>
33f81e24:	eb00177a 	bl	33f87c14 <puts>
33f81e28:	e1a00004 	mov	r0, r4
33f81e2c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f81e30:	e1a00005 	mov	r0, r5
33f81e34:	e1a01004 	mov	r1, r4
33f81e38:	e3a02058 	mov	r2, #88	; 0x58
33f81e3c:	eb00230b 	bl	33f8aa70 <memset>
33f81e40:	e1a00004 	mov	r0, r4
33f81e44:	e5c54018 	strb	r4, [r5, #24]
33f81e48:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f81e4c:	33f96244 	mvnccs	r6, #1073741828	; 0x40000004
33f81e50:	33f96264 	mvnccs	r6, #1073741830	; 0x40000006
33f81e54:	33f920c4 	mvnccs	r2, #196	; 0xc4
33f81e58:	33f91310 	mvnccs	r1, #1073741824	; 0x40000000
33f81e5c:	33f920f4 	mvnccs	r2, #244	; 0xf4
33f81e60:	33f956b4 	mvnccs	r5, #188743680	; 0xb400000
33f81e64:	33f92124 	mvnccs	r2, #9	; 0x9

33f81e68 <nand_print_bad>:
33f81e68:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f81e6c:	e1a04000 	mov	r4, r0
33f81e70:	e3a05000 	mov	r5, #0	; 0x0
33f81e74:	ea000006 	b	33f81e94 <nand_print_bad+0x2c>
33f81e78:	ebfffd8e 	bl	33f814b8 <check_block>
33f81e7c:	e3500000 	cmp	r0, #0	; 0x0
33f81e80:	e1a01005 	mov	r1, r5
33f81e84:	e59f0028 	ldr	r0, [pc, #40]	; 33f81eb4 <.text+0x1eb4>
33f81e88:	1b001774 	blne	33f87c60 <printf>
33f81e8c:	e5943028 	ldr	r3, [r4, #40]
33f81e90:	e0855003 	add	r5, r5, r3
33f81e94:	e5943044 	ldr	r3, [r4, #68]
33f81e98:	e1550003 	cmp	r5, r3
33f81e9c:	e1a01005 	mov	r1, r5
33f81ea0:	e1a00004 	mov	r0, r4
33f81ea4:	3afffff3 	bcc	33f81e78 <nand_print_bad+0x10>
33f81ea8:	e59f0008 	ldr	r0, [pc, #8]	; 33f81eb8 <.text+0x1eb8>
33f81eac:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
33f81eb0:	ea001757 	b	33f87c14 <puts>
33f81eb4:	33f92154 	mvnccs	r2, #21	; 0x15
33f81eb8:	33f9544c 	mvnccs	r5, #1275068416	; 0x4c000000

33f81ebc <nand_init>:
33f81ebc:	e59f3050 	ldr	r3, [pc, #80]	; 33f81f14 <.text+0x1f14>
33f81ec0:	e92d4010 	stmdb	sp!, {r4, lr}
33f81ec4:	e3a0444e 	mov	r4, #1308622848	; 0x4e000000
33f81ec8:	e5843000 	str	r3, [r4]
33f81ecc:	e3a03073 	mov	r3, #115	; 0x73
33f81ed0:	e5843004 	str	r3, [r4, #4]
33f81ed4:	e3a00000 	mov	r0, #0	; 0x0
33f81ed8:	ebfffc8f 	bl	33f8111c <NF_SetCE>
33f81edc:	e3a030ff 	mov	r3, #255	; 0xff
33f81ee0:	e5843008 	str	r3, [r4, #8]
33f81ee4:	e3a0444e 	mov	r4, #1308622848	; 0x4e000000
33f81ee8:	e5943020 	ldr	r3, [r4, #32]
33f81eec:	e3130001 	tst	r3, #1	; 0x1
33f81ef0:	0afffffb 	beq	33f81ee4 <nand_init+0x28>
33f81ef4:	e3a00001 	mov	r0, #1	; 0x1
33f81ef8:	ebfffc87 	bl	33f8111c <NF_SetCE>
33f81efc:	e1a00004 	mov	r0, r4
33f81f00:	ebffff04 	bl	33f81b18 <nand_probe>
33f81f04:	e1a01a20 	mov	r1, r0, lsr #20
33f81f08:	e59f0008 	ldr	r0, [pc, #8]	; 33f81f18 <.text+0x1f18>
33f81f0c:	e8bd4010 	ldmia	sp!, {r4, lr}
33f81f10:	ea001752 	b	33f87c60 <printf>
33f81f14:	00001410 	andeq	r1, r0, r0, lsl r4
33f81f18:	33f92160 	mvnccs	r2, #24	; 0x18

33f81f1c <nand_print>:
33f81f1c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f81f20:	e1a06000 	mov	r6, r0
33f81f24:	e5962038 	ldr	r2, [r6, #56]
33f81f28:	e3520001 	cmp	r2, #1	; 0x1
33f81f2c:	e24dd010 	sub	sp, sp, #16	; 0x10
33f81f30:	e59f0074 	ldr	r0, [pc, #116]	; 33f81fac <.text+0x1fac>
33f81f34:	e1a03002 	mov	r3, r2
33f81f38:	da000010 	ble	33f81f80 <nand_print+0x64>
33f81f3c:	e5962020 	ldr	r2, [r6, #32]
33f81f40:	e3a04001 	mov	r4, #1	; 0x1
33f81f44:	e2422014 	sub	r2, r2, #20	; 0x14
33f81f48:	e1a04214 	mov	r4, r4, lsl r2
33f81f4c:	e596c044 	ldr	ip, [r6, #68]
33f81f50:	e2865024 	add	r5, r6, #36	; 0x24
33f81f54:	e8954020 	ldmia	r5, {r5, lr}
33f81f58:	e5962040 	ldr	r2, [r6, #64]
33f81f5c:	e5961034 	ldr	r1, [r6, #52]
33f81f60:	e1a0ca2c 	mov	ip, ip, lsr #20
33f81f64:	e1a0e52e 	mov	lr, lr, lsr #10
33f81f68:	e59f0040 	ldr	r0, [pc, #64]	; 33f81fb0 <.text+0x1fb0>
33f81f6c:	e58d5000 	str	r5, [sp]
33f81f70:	e98d5010 	stmib	sp, {r4, ip, lr}
33f81f74:	eb001739 	bl	33f87c60 <printf>
33f81f78:	e28dd010 	add	sp, sp, #16	; 0x10
33f81f7c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f81f80:	e5961024 	ldr	r1, [r6, #36]
33f81f84:	e5962040 	ldr	r2, [r6, #64]
33f81f88:	eb001734 	bl	33f87c60 <printf>
33f81f8c:	e5960044 	ldr	r0, [r6, #68]
33f81f90:	e59f101c 	ldr	r1, [pc, #28]	; 33f81fb4 <.text+0x1fb4>
33f81f94:	eb0021b2 	bl	33f8a664 <print_size>
33f81f98:	e5960028 	ldr	r0, [r6, #40]
33f81f9c:	e59f1014 	ldr	r1, [pc, #20]	; 33f81fb8 <.text+0x1fb8>
33f81fa0:	e28dd010 	add	sp, sp, #16	; 0x10
33f81fa4:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
33f81fa8:	ea0021ad 	b	33f8a664 <print_size>
33f81fac:	33f921c0 	mvnccs	r2, #48	; 0x30
33f81fb0:	33f9216c 	mvnccs	r2, #27	; 0x1b
33f81fb4:	33f921d0 	mvnccs	r2, #52	; 0x34
33f81fb8:	33f921d4 	mvnccs	r2, #53	; 0x35

33f81fbc <nand_legacy_rw>:
33f81fbc:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f81fc0:	e1a05000 	mov	r5, r0
33f81fc4:	e5900028 	ldr	r0, [r0, #40]
33f81fc8:	e24dd030 	sub	sp, sp, #48	; 0x30
33f81fcc:	e3a04000 	mov	r4, #0	; 0x0
33f81fd0:	e1a09002 	mov	r9, r2
33f81fd4:	e3e02000 	mvn	r2, #0	; 0x0
33f81fd8:	e58d0014 	str	r0, [sp, #20]
33f81fdc:	e58d1008 	str	r1, [sp, #8]
33f81fe0:	e58d3004 	str	r3, [sp, #4]
33f81fe4:	e58d400c 	str	r4, [sp, #12]
33f81fe8:	ea0002a0 	b	33f82a70 <nand_legacy_rw+0xab4>
33f81fec:	e59d1014 	ldr	r1, [sp, #20]
33f81ff0:	e2613000 	rsb	r3, r1, #0	; 0x0
33f81ff4:	e0093003 	and	r3, r9, r3
33f81ff8:	e1530002 	cmp	r3, r2
33f81ffc:	e58d3010 	str	r3, [sp, #16]
33f82000:	0a000027 	beq	33f820a4 <nand_legacy_rw+0xe8>
33f82004:	e1a00005 	mov	r0, r5
33f82008:	e1a01003 	mov	r1, r3
33f8200c:	ebfffd29 	bl	33f814b8 <check_block>
33f82010:	e3500000 	cmp	r0, #0	; 0x0
33f82014:	0a000022 	beq	33f820a4 <nand_legacy_rw+0xe8>
33f82018:	e59d2008 	ldr	r2, [sp, #8]
33f8201c:	e3520003 	cmp	r2, #3	; 0x3
33f82020:	059d3010 	ldreq	r3, [sp, #16]
33f82024:	00632009 	rsbeq	r2, r3, r9
33f82028:	0a00000c 	beq	33f82060 <nand_legacy_rw+0xa4>
33f8202c:	ea000010 	b	33f82074 <nand_legacy_rw+0xb8>
33f82030:	e59dc004 	ldr	ip, [sp, #4]
33f82034:	e59de054 	ldr	lr, [sp, #84]
33f82038:	e25cc001 	subs	ip, ip, #1	; 0x1
33f8203c:	e3e03000 	mvn	r3, #0	; 0x0
33f82040:	e58dc004 	str	ip, [sp, #4]
33f82044:	e4ce3001 	strb	r3, [lr], #1
33f82048:	e59d000c 	ldr	r0, [sp, #12]
33f8204c:	e2800001 	add	r0, r0, #1	; 0x1
33f82050:	e58de054 	str	lr, [sp, #84]
33f82054:	e2899001 	add	r9, r9, #1	; 0x1
33f82058:	e58d000c 	str	r0, [sp, #12]
33f8205c:	0a000282 	beq	33f82a6c <nand_legacy_rw+0xab0>
33f82060:	e59d1014 	ldr	r1, [sp, #20]
33f82064:	e1520001 	cmp	r2, r1
33f82068:	e2822001 	add	r2, r2, #1	; 0x1
33f8206c:	3affffef 	bcc	33f82030 <nand_legacy_rw+0x74>
33f82070:	ea00027d 	b	33f82a6c <nand_legacy_rw+0xab0>
33f82074:	e59d2008 	ldr	r2, [sp, #8]
33f82078:	e3520007 	cmp	r2, #7	; 0x7
33f8207c:	059d3014 	ldreq	r3, [sp, #20]
33f82080:	00899003 	addeq	r9, r9, r3
33f82084:	0a000278 	beq	33f82a6c <nand_legacy_rw+0xab0>
33f82088:	e59dc008 	ldr	ip, [sp, #8]
33f8208c:	e35c0002 	cmp	ip, #2	; 0x2
33f82090:	13a04001 	movne	r4, #1	; 0x1
33f82094:	1a000278 	bne	33f82a7c <nand_legacy_rw+0xac0>
33f82098:	e59de014 	ldr	lr, [sp, #20]
33f8209c:	e089900e 	add	r9, r9, lr
33f820a0:	ea000271 	b	33f82a6c <nand_legacy_rw+0xab0>
33f820a4:	e3c93f7f 	bic	r3, r9, #508	; 0x1fc
33f820a8:	e59d0004 	ldr	r0, [sp, #4]
33f820ac:	e3c33003 	bic	r3, r3, #3	; 0x3
33f820b0:	e3500c02 	cmp	r0, #512	; 0x200
33f820b4:	21590003 	cmpcs	r9, r3
33f820b8:	159f0a34 	ldrne	r0, [pc, #2612]	; 33f82af4 <.text+0x2af4>
33f820bc:	1b0016e7 	blne	33f87c60 <printf>
33f820c0:	e59d2008 	ldr	r2, [sp, #8]
33f820c4:	e28d3010 	add	r3, sp, #16	; 0x10
33f820c8:	e8931008 	ldmia	r3, {r3, ip}
33f820cc:	e2121001 	ands	r1, r2, #1	; 0x1
33f820d0:	e083200c 	add	r2, r3, ip
33f820d4:	e595c044 	ldr	ip, [r5, #68]
33f820d8:	0a0000bc 	beq	33f823d0 <nand_legacy_rw+0x414>
33f820dc:	e59de004 	ldr	lr, [sp, #4]
33f820e0:	e069a002 	rsb	sl, r9, r2
33f820e4:	e15a000e 	cmp	sl, lr
33f820e8:	21a0a00e 	movcs	sl, lr
33f820ec:	e089300a 	add	r3, r9, sl
33f820f0:	e153000c 	cmp	r3, ip
33f820f4:	8a000275 	bhi	33f82ad0 <nand_legacy_rw+0xb14>
33f820f8:	e5953048 	ldr	r3, [r5, #72]
33f820fc:	e3a04000 	mov	r4, #0	; 0x0
33f82100:	e5952000 	ldr	r2, [r5]
33f82104:	e2433001 	sub	r3, r3, #1	; 0x1
33f82108:	e1a00004 	mov	r0, r4
33f8210c:	e1a07239 	mov	r7, r9, lsr r2
33f82110:	e009b003 	and	fp, r9, r3
33f82114:	e58d402c 	str	r4, [sp, #44]
33f82118:	ebfffbff 	bl	33f8111c <NF_SetCE>
33f8211c:	e58d4018 	str	r4, [sp, #24]
33f82120:	ea0000a1 	b	33f823ac <nand_legacy_rw+0x3f0>
33f82124:	e595300c 	ldr	r3, [r5, #12]
33f82128:	e1530007 	cmp	r3, r7
33f8212c:	0a000078 	beq	33f82314 <nand_legacy_rw+0x358>
33f82130:	e3a02000 	mov	r2, #0	; 0x0
33f82134:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82138:	e5832008 	str	r2, [r3, #8]
33f8213c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82140:	e5933020 	ldr	r3, [r3, #32]
33f82144:	e3130001 	tst	r3, #1	; 0x1
33f82148:	0afffffb 	beq	33f8213c <nand_legacy_rw+0x180>
33f8214c:	e5953054 	ldr	r3, [r5, #84]
33f82150:	e5951000 	ldr	r1, [r5]
33f82154:	e3530000 	cmp	r3, #0	; 0x0
33f82158:	11a020cb 	movne	r2, fp, asr #1
33f8215c:	10822117 	addne	r2, r2, r7, lsl r1
33f82160:	008b2117 	addeq	r2, fp, r7, lsl r1
33f82164:	e1a00005 	mov	r0, r5
33f82168:	e3a01003 	mov	r1, #3	; 0x3
33f8216c:	ebfffbf6 	bl	33f8114c <NanD_Address>
33f82170:	e2850048 	add	r0, r5, #72	; 0x48
33f82174:	e8900005 	ldmia	r0, {r0, r2}
33f82178:	e0802002 	add	r2, r0, r2
33f8217c:	e5951004 	ldr	r1, [r5, #4]
33f82180:	e1a00005 	mov	r0, r5
33f82184:	ebfffc0b 	bl	33f811b8 <NanD_ReadBuf>
33f82188:	e5950008 	ldr	r0, [r5, #8]
33f8218c:	e3500000 	cmp	r0, #0	; 0x0
33f82190:	12851048 	addne	r1, r5, #72	; 0x48
33f82194:	18910006 	ldmneia	r1, {r1, r2}
33f82198:	10812002 	addne	r2, r1, r2
33f8219c:	15951004 	ldrne	r1, [r5, #4]
33f821a0:	1b002244 	blne	33f8aab8 <memcpy>
33f821a4:	e59fc94c 	ldr	ip, [pc, #2380]	; 33f82af8 <.text+0x2af8>
33f821a8:	e5950004 	ldr	r0, [r5, #4]
33f821ac:	e5951048 	ldr	r1, [r5, #72]
33f821b0:	e3a02000 	mov	r2, #0	; 0x0
33f821b4:	e49c3004 	ldr	r3, [ip], #4
33f821b8:	e0813003 	add	r3, r1, r3
33f821bc:	e282e026 	add	lr, r2, #38	; 0x26
33f821c0:	e7d03003 	ldrb	r3, [r0, r3]
33f821c4:	e2822001 	add	r2, r2, #1	; 0x1
33f821c8:	e3520006 	cmp	r2, #6	; 0x6
33f821cc:	e7ce300d 	strb	r3, [lr, sp]
33f821d0:	1afffff7 	bne	33f821b4 <nand_legacy_rw+0x1f8>
33f821d4:	e59f391c 	ldr	r3, [pc, #2332]	; 33f82af8 <.text+0x2af8>
33f821d8:	e593201c 	ldr	r2, [r3, #28]
33f821dc:	e3720001 	cmn	r2, #1	; 0x1
33f821e0:	0a00004b 	beq	33f82314 <nand_legacy_rw+0x358>
33f821e4:	e0813002 	add	r3, r1, r2
33f821e8:	e7d03003 	ldrb	r3, [r0, r3]
33f821ec:	e203300f 	and	r3, r3, #15	; 0xf
33f821f0:	e353000f 	cmp	r3, #15	; 0xf
33f821f4:	0a000227 	beq	33f82a98 <nand_legacy_rw+0xadc>
33f821f8:	e28d4020 	add	r4, sp, #32	; 0x20
33f821fc:	e1a01004 	mov	r1, r4
33f82200:	ebfffcf3 	bl	33f815d4 <nand_calculate_ecc>
33f82204:	e1a02004 	mov	r2, r4
33f82208:	e5950004 	ldr	r0, [r5, #4]
33f8220c:	e28d1026 	add	r1, sp, #38	; 0x26
33f82210:	ebfffd35 	bl	33f816ec <nand_correct_data>
33f82214:	e3700001 	cmn	r0, #1	; 0x1
33f82218:	0a000004 	beq	33f82230 <nand_legacy_rw+0x274>
33f8221c:	ba00000e 	blt	33f8225c <nand_legacy_rw+0x2a0>
33f82220:	e2403001 	sub	r3, r0, #1	; 0x1
33f82224:	e3530001 	cmp	r3, #1	; 0x1
33f82228:	8a00000b 	bhi	33f8225c <nand_legacy_rw+0x2a0>
33f8222c:	ea000005 	b	33f82248 <nand_legacy_rw+0x28c>
33f82230:	e59f08c4 	ldr	r0, [pc, #2244]	; 33f82afc <.text+0x2afc>
33f82234:	e59f18c4 	ldr	r1, [pc, #2244]	; 33f82b00 <.text+0x2b00>
33f82238:	e1a02007 	mov	r2, r7
33f8223c:	eb001687 	bl	33f87c60 <printf>
33f82240:	e3a06001 	mov	r6, #1	; 0x1
33f82244:	ea000005 	b	33f82260 <nand_legacy_rw+0x2a4>
33f82248:	e5950008 	ldr	r0, [r5, #8]
33f8224c:	e3500000 	cmp	r0, #0	; 0x0
33f82250:	15951004 	ldrne	r1, [r5, #4]
33f82254:	13a02c01 	movne	r2, #256	; 0x100
33f82258:	1b002216 	blne	33f8aab8 <memcpy>
33f8225c:	e3a06000 	mov	r6, #0	; 0x0
33f82260:	e59f3890 	ldr	r3, [pc, #2192]	; 33f82af8 <.text+0x2af8>
33f82264:	e593201c 	ldr	r2, [r3, #28]
33f82268:	e3720001 	cmn	r2, #1	; 0x1
33f8226c:	0a000029 	beq	33f82318 <nand_legacy_rw+0x35c>
33f82270:	e5953048 	ldr	r3, [r5, #72]
33f82274:	e3530c02 	cmp	r3, #512	; 0x200
33f82278:	1a000026 	bne	33f82318 <nand_legacy_rw+0x35c>
33f8227c:	e5950004 	ldr	r0, [r5, #4]
33f82280:	e2823c02 	add	r3, r2, #512	; 0x200
33f82284:	e7d03003 	ldrb	r3, [r0, r3]
33f82288:	e20330f0 	and	r3, r3, #240	; 0xf0
33f8228c:	e35300f0 	cmp	r3, #240	; 0xf0
33f82290:	0a000020 	beq	33f82318 <nand_legacy_rw+0x35c>
33f82294:	e28d4023 	add	r4, sp, #35	; 0x23
33f82298:	e2800c01 	add	r0, r0, #256	; 0x100
33f8229c:	e1a01004 	mov	r1, r4
33f822a0:	ebfffccb 	bl	33f815d4 <nand_calculate_ecc>
33f822a4:	e5950004 	ldr	r0, [r5, #4]
33f822a8:	e28d3026 	add	r3, sp, #38	; 0x26
33f822ac:	e1a02004 	mov	r2, r4
33f822b0:	e2800c01 	add	r0, r0, #256	; 0x100
33f822b4:	e2831003 	add	r1, r3, #3	; 0x3
33f822b8:	ebfffd0b 	bl	33f816ec <nand_correct_data>
33f822bc:	e3700001 	cmn	r0, #1	; 0x1
33f822c0:	0a000004 	beq	33f822d8 <nand_legacy_rw+0x31c>
33f822c4:	ba000013 	blt	33f82318 <nand_legacy_rw+0x35c>
33f822c8:	e2403001 	sub	r3, r0, #1	; 0x1
33f822cc:	e3530001 	cmp	r3, #1	; 0x1
33f822d0:	8a000010 	bhi	33f82318 <nand_legacy_rw+0x35c>
33f822d4:	ea000005 	b	33f822f0 <nand_legacy_rw+0x334>
33f822d8:	e59f081c 	ldr	r0, [pc, #2076]	; 33f82afc <.text+0x2afc>
33f822dc:	e59f181c 	ldr	r1, [pc, #2076]	; 33f82b00 <.text+0x2b00>
33f822e0:	e1a02007 	mov	r2, r7
33f822e4:	eb00165d 	bl	33f87c60 <printf>
33f822e8:	e2866001 	add	r6, r6, #1	; 0x1
33f822ec:	ea000009 	b	33f82318 <nand_legacy_rw+0x35c>
33f822f0:	e5950008 	ldr	r0, [r5, #8]
33f822f4:	e3500000 	cmp	r0, #0	; 0x0
33f822f8:	0a000006 	beq	33f82318 <nand_legacy_rw+0x35c>
33f822fc:	e5951004 	ldr	r1, [r5, #4]
33f82300:	e3a02c01 	mov	r2, #256	; 0x100
33f82304:	e2811c01 	add	r1, r1, #256	; 0x100
33f82308:	e2800c01 	add	r0, r0, #256	; 0x100
33f8230c:	eb0021e9 	bl	33f8aab8 <memcpy>
33f82310:	ea000000 	b	33f82318 <nand_legacy_rw+0x35c>
33f82314:	e3a06000 	mov	r6, #0	; 0x0
33f82318:	e5953008 	ldr	r3, [r5, #8]
33f8231c:	e3530000 	cmp	r3, #0	; 0x0
33f82320:	11a01003 	movne	r1, r3
33f82324:	e5953048 	ldr	r3, [r5, #72]
33f82328:	e59dc02c 	ldr	ip, [sp, #44]
33f8232c:	e06b2003 	rsb	r2, fp, r3
33f82330:	05951004 	ldreq	r1, [r5, #4]
33f82334:	e08c3002 	add	r3, ip, r2
33f82338:	e59de054 	ldr	lr, [sp, #84]
33f8233c:	e153000a 	cmp	r3, sl
33f82340:	e081100b 	add	r1, r1, fp
33f82344:	e08e000c 	add	r0, lr, ip
33f82348:	3a000003 	bcc	33f8235c <nand_legacy_rw+0x3a0>
33f8234c:	e06c200a 	rsb	r2, ip, sl
33f82350:	eb0021d8 	bl	33f8aab8 <memcpy>
33f82354:	e58da02c 	str	sl, [sp, #44]
33f82358:	ea000005 	b	33f82374 <nand_legacy_rw+0x3b8>
33f8235c:	eb0021d5 	bl	33f8aab8 <memcpy>
33f82360:	e5953048 	ldr	r3, [r5, #72]
33f82364:	e59d202c 	ldr	r2, [sp, #44]
33f82368:	e06b3003 	rsb	r3, fp, r3
33f8236c:	e0822003 	add	r2, r2, r3
33f82370:	e58d202c 	str	r2, [sp, #44]
33f82374:	e5953008 	ldr	r3, [r5, #8]
33f82378:	e2533000 	subs	r3, r3, #0	; 0x0
33f8237c:	13a03001 	movne	r3, #1	; 0x1
33f82380:	e3560000 	cmp	r6, #0	; 0x0
33f82384:	13a03000 	movne	r3, #0	; 0x0
33f82388:	e3530000 	cmp	r3, #0	; 0x0
33f8238c:	11a03007 	movne	r3, r7
33f82390:	03e03000 	mvneq	r3, #0	; 0x0
33f82394:	e585300c 	str	r3, [r5, #12]
33f82398:	e59d0018 	ldr	r0, [sp, #24]
33f8239c:	e0800006 	add	r0, r0, r6
33f823a0:	e58d0018 	str	r0, [sp, #24]
33f823a4:	e2877001 	add	r7, r7, #1	; 0x1
33f823a8:	e3a0b000 	mov	fp, #0	; 0x0
33f823ac:	e59d302c 	ldr	r3, [sp, #44]
33f823b0:	e153000a 	cmp	r3, sl
33f823b4:	3affff5a 	bcc	33f82124 <nand_legacy_rw+0x168>
33f823b8:	e3a00001 	mov	r0, #1	; 0x1
33f823bc:	ebfffb56 	bl	33f8111c <NF_SetCE>
33f823c0:	e59d1018 	ldr	r1, [sp, #24]
33f823c4:	e3510000 	cmp	r1, #0	; 0x0
33f823c8:	0a00019b 	beq	33f82a3c <nand_legacy_rw+0xa80>
33f823cc:	ea0001b9 	b	33f82ab8 <nand_legacy_rw+0xafc>
33f823d0:	e069a002 	rsb	sl, r9, r2
33f823d4:	e59d2004 	ldr	r2, [sp, #4]
33f823d8:	e15a0002 	cmp	sl, r2
33f823dc:	21a0a002 	movcs	sl, r2
33f823e0:	e089300a 	add	r3, r9, sl
33f823e4:	e153000c 	cmp	r3, ip
33f823e8:	8a0001b4 	bhi	33f82ac0 <nand_legacy_rw+0xb04>
33f823ec:	e58d102c 	str	r1, [sp, #44]
33f823f0:	e1a00001 	mov	r0, r1
33f823f4:	e5954000 	ldr	r4, [r5]
33f823f8:	e5957048 	ldr	r7, [r5, #72]
33f823fc:	ebfffb46 	bl	33f8111c <NF_SetCE>
33f82400:	e3a02070 	mov	r2, #112	; 0x70
33f82404:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82408:	e5832008 	str	r2, [r3, #8]
33f8240c:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f82410:	e5923020 	ldr	r3, [r2, #32]
33f82414:	e3130001 	tst	r3, #1	; 0x1
33f82418:	0afffffb 	beq	33f8240c <nand_legacy_rw+0x450>
33f8241c:	e5d23010 	ldrb	r3, [r2, #16]
33f82420:	e3130080 	tst	r3, #128	; 0x80
33f82424:	1a00016d 	bne	33f829e0 <nand_legacy_rw+0xa24>
33f82428:	e59f06d4 	ldr	r0, [pc, #1748]	; 33f82b04 <.text+0x2b04>
33f8242c:	e59f16d4 	ldr	r1, [pc, #1748]	; 33f82b08 <.text+0x2b08>
33f82430:	eb00160a 	bl	33f87c60 <printf>
33f82434:	ea00017d 	b	33f82a30 <nand_legacy_rw+0xa74>
33f82438:	e595300c 	ldr	r3, [r5, #12]
33f8243c:	e1530006 	cmp	r3, r6
33f82440:	03e03000 	mvneq	r3, #0	; 0x0
33f82444:	e5952048 	ldr	r2, [r5, #72]
33f82448:	0585300c 	streq	r3, [r5, #12]
33f8244c:	e084300a 	add	r3, r4, sl
33f82450:	e1530002 	cmp	r3, r2
33f82454:	31a07004 	movcc	r7, r4
33f82458:	33a0b000 	movcc	fp, #0	; 0x0
33f8245c:	21a07004 	movcs	r7, r4
33f82460:	23a0b000 	movcs	fp, #0	; 0x0
33f82464:	2a000008 	bcs	33f8248c <nand_legacy_rw+0x4d0>
33f82468:	ea000011 	b	33f824b4 <nand_legacy_rw+0x4f8>
33f8246c:	e59d302c 	ldr	r3, [sp, #44]
33f82470:	e59dc054 	ldr	ip, [sp, #84]
33f82474:	e08b3003 	add	r3, fp, r3
33f82478:	e7dc2003 	ldrb	r2, [ip, r3]
33f8247c:	e5953004 	ldr	r3, [r5, #4]
33f82480:	e28bb001 	add	fp, fp, #1	; 0x1
33f82484:	e7c32007 	strb	r2, [r3, r7]
33f82488:	e2877001 	add	r7, r7, #1	; 0x1
33f8248c:	e5953048 	ldr	r3, [r5, #72]
33f82490:	e1570003 	cmp	r7, r3
33f82494:	3afffff4 	bcc	33f8246c <nand_legacy_rw+0x4b0>
33f82498:	ea00000a 	b	33f824c8 <nand_legacy_rw+0x50c>
33f8249c:	e59de054 	ldr	lr, [sp, #84]
33f824a0:	e5953004 	ldr	r3, [r5, #4]
33f824a4:	e7de2002 	ldrb	r2, [lr, r2]
33f824a8:	e28bb001 	add	fp, fp, #1	; 0x1
33f824ac:	e7c32007 	strb	r2, [r3, r7]
33f824b0:	e2877001 	add	r7, r7, #1	; 0x1
33f824b4:	e59d302c 	ldr	r3, [sp, #44]
33f824b8:	e083200b 	add	r2, r3, fp
33f824bc:	e063300a 	rsb	r3, r3, sl
33f824c0:	e15b0003 	cmp	fp, r3
33f824c4:	3afffff4 	bcc	33f8249c <nand_legacy_rw+0x4e0>
33f824c8:	e5953048 	ldr	r3, [r5, #72]
33f824cc:	e3530c02 	cmp	r3, #512	; 0x200
33f824d0:	13a00003 	movne	r0, #3	; 0x3
33f824d4:	03a00006 	moveq	r0, #6	; 0x6
33f824d8:	e1a01003 	mov	r1, r3
33f824dc:	e58d001c 	str	r0, [sp, #28]
33f824e0:	ea000003 	b	33f824f4 <nand_legacy_rw+0x538>
33f824e4:	e5952004 	ldr	r2, [r5, #4]
33f824e8:	e3e03000 	mvn	r3, #0	; 0x0
33f824ec:	e7c23001 	strb	r3, [r2, r1]
33f824f0:	e2811001 	add	r1, r1, #1	; 0x1
33f824f4:	e2852048 	add	r2, r5, #72	; 0x48
33f824f8:	e892000c 	ldmia	r2, {r2, r3}
33f824fc:	e0823003 	add	r3, r2, r3
33f82500:	e1510003 	cmp	r1, r3
33f82504:	3afffff6 	bcc	33f824e4 <nand_legacy_rw+0x528>
33f82508:	e3a03000 	mov	r3, #0	; 0x0
33f8250c:	e283c026 	add	ip, r3, #38	; 0x26
33f82510:	e2833001 	add	r3, r3, #1	; 0x1
33f82514:	e3a02000 	mov	r2, #0	; 0x0
33f82518:	e3530006 	cmp	r3, #6	; 0x6
33f8251c:	e7cc200d 	strb	r2, [ip, sp]
33f82520:	1afffff9 	bne	33f8250c <nand_legacy_rw+0x550>
33f82524:	e1540002 	cmp	r4, r2
33f82528:	0a000028 	beq	33f825d0 <nand_legacy_rw+0x614>
33f8252c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82530:	e5832008 	str	r2, [r3, #8]
33f82534:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82538:	e5933020 	ldr	r3, [r3, #32]
33f8253c:	e3130001 	tst	r3, #1	; 0x1
33f82540:	0afffffb 	beq	33f82534 <nand_legacy_rw+0x578>
33f82544:	e5953054 	ldr	r3, [r5, #84]
33f82548:	e5951000 	ldr	r1, [r5]
33f8254c:	e3530000 	cmp	r3, #0	; 0x0
33f82550:	11a020c4 	movne	r2, r4, asr #1
33f82554:	10822116 	addne	r2, r2, r6, lsl r1
33f82558:	00842116 	addeq	r2, r4, r6, lsl r1
33f8255c:	e1a00005 	mov	r0, r5
33f82560:	e3a01003 	mov	r1, #3	; 0x3
33f82564:	ebfffaf8 	bl	33f8114c <NanD_Address>
33f82568:	e5953054 	ldr	r3, [r5, #84]
33f8256c:	e3530000 	cmp	r3, #0	; 0x0
33f82570:	01a01003 	moveq	r1, r3
33f82574:	13a01000 	movne	r1, #0	; 0x0
33f82578:	1a00000a 	bne	33f825a8 <nand_legacy_rw+0x5ec>
33f8257c:	ea000011 	b	33f825c8 <nand_legacy_rw+0x60c>
33f82580:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82584:	e5d33010 	ldrb	r3, [r3, #16]
33f82588:	e5952004 	ldr	r2, [r5, #4]
33f8258c:	e20330ff 	and	r3, r3, #255	; 0xff
33f82590:	e7c23001 	strb	r3, [r2, r1]
33f82594:	e5953004 	ldr	r3, [r5, #4]
33f82598:	e3a02000 	mov	r2, #0	; 0x0
33f8259c:	e0833001 	add	r3, r3, r1
33f825a0:	e5c32001 	strb	r2, [r3, #1]
33f825a4:	e2811002 	add	r1, r1, #2	; 0x2
33f825a8:	e1510004 	cmp	r1, r4
33f825ac:	bafffff3 	blt	33f82580 <nand_legacy_rw+0x5c4>
33f825b0:	ea000006 	b	33f825d0 <nand_legacy_rw+0x614>
33f825b4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f825b8:	e5d32010 	ldrb	r2, [r3, #16]
33f825bc:	e5953004 	ldr	r3, [r5, #4]
33f825c0:	e7c32001 	strb	r2, [r3, r1]
33f825c4:	e2811001 	add	r1, r1, #1	; 0x1
33f825c8:	e1510004 	cmp	r1, r4
33f825cc:	bafffff8 	blt	33f825b4 <nand_legacy_rw+0x5f8>
33f825d0:	e5953050 	ldr	r3, [r5, #80]
33f825d4:	e1540003 	cmp	r4, r3
33f825d8:	2a000018 	bcs	33f82640 <nand_legacy_rw+0x684>
33f825dc:	e1570003 	cmp	r7, r3
33f825e0:	3a000016 	bcc	33f82640 <nand_legacy_rw+0x684>
33f825e4:	e5950004 	ldr	r0, [r5, #4]
33f825e8:	e28d1026 	add	r1, sp, #38	; 0x26
33f825ec:	ebfffbf8 	bl	33f815d4 <nand_calculate_ecc>
33f825f0:	e59fe500 	ldr	lr, [pc, #1280]	; 33f82af8 <.text+0x2af8>
33f825f4:	e3a0c000 	mov	ip, #0	; 0x0
33f825f8:	e28c2026 	add	r2, ip, #38	; 0x26
33f825fc:	e5953048 	ldr	r3, [r5, #72]
33f82600:	e49e1004 	ldr	r1, [lr], #4
33f82604:	e7d2000d 	ldrb	r0, [r2, sp]
33f82608:	e28cc001 	add	ip, ip, #1	; 0x1
33f8260c:	e5952004 	ldr	r2, [r5, #4]
33f82610:	e0833001 	add	r3, r3, r1
33f82614:	e35c0003 	cmp	ip, #3	; 0x3
33f82618:	e7c20003 	strb	r0, [r2, r3]
33f8261c:	1afffff5 	bne	33f825f8 <nand_legacy_rw+0x63c>
33f82620:	e59f34d0 	ldr	r3, [pc, #1232]	; 33f82af8 <.text+0x2af8>
33f82624:	e593201c 	ldr	r2, [r3, #28]
33f82628:	e3720001 	cmn	r2, #1	; 0x1
33f8262c:	15953048 	ldrne	r3, [r5, #72]
33f82630:	15951004 	ldrne	r1, [r5, #4]
33f82634:	10833002 	addne	r3, r3, r2
33f82638:	13e0200f 	mvnne	r2, #15	; 0xf
33f8263c:	17c12003 	strneb	r2, [r1, r3]
33f82640:	e5953048 	ldr	r3, [r5, #72]
33f82644:	e3530c02 	cmp	r3, #512	; 0x200
33f82648:	1a00001d 	bne	33f826c4 <nand_legacy_rw+0x708>
33f8264c:	e3570c02 	cmp	r7, #512	; 0x200
33f82650:	1a00001b 	bne	33f826c4 <nand_legacy_rw+0x708>
33f82654:	e5950004 	ldr	r0, [r5, #4]
33f82658:	e28d3026 	add	r3, sp, #38	; 0x26
33f8265c:	e2800c01 	add	r0, r0, #256	; 0x100
33f82660:	e2831003 	add	r1, r3, #3	; 0x3
33f82664:	ebfffbda 	bl	33f815d4 <nand_calculate_ecc>
33f82668:	e59fe488 	ldr	lr, [pc, #1160]	; 33f82af8 <.text+0x2af8>
33f8266c:	e3a0c003 	mov	ip, #3	; 0x3
33f82670:	e59e100c 	ldr	r1, [lr, #12]
33f82674:	e28c2026 	add	r2, ip, #38	; 0x26
33f82678:	e5953048 	ldr	r3, [r5, #72]
33f8267c:	e7d2000d 	ldrb	r0, [r2, sp]
33f82680:	e28cc001 	add	ip, ip, #1	; 0x1
33f82684:	e5952004 	ldr	r2, [r5, #4]
33f82688:	e0833001 	add	r3, r3, r1
33f8268c:	e35c0006 	cmp	ip, #6	; 0x6
33f82690:	e7c20003 	strb	r0, [r2, r3]
33f82694:	e28ee004 	add	lr, lr, #4	; 0x4
33f82698:	1afffff4 	bne	33f82670 <nand_legacy_rw+0x6b4>
33f8269c:	e59f3454 	ldr	r3, [pc, #1108]	; 33f82af8 <.text+0x2af8>
33f826a0:	e593201c 	ldr	r2, [r3, #28]
33f826a4:	e3720001 	cmn	r2, #1	; 0x1
33f826a8:	0a000005 	beq	33f826c4 <nand_legacy_rw+0x708>
33f826ac:	e5953048 	ldr	r3, [r5, #72]
33f826b0:	e5951004 	ldr	r1, [r5, #4]
33f826b4:	e0833002 	add	r3, r3, r2
33f826b8:	e7d12003 	ldrb	r2, [r1, r3]
33f826bc:	e202200f 	and	r2, r2, #15	; 0xf
33f826c0:	e7c12003 	strb	r2, [r1, r3]
33f826c4:	e3a01000 	mov	r1, #0	; 0x0
33f826c8:	ea000003 	b	33f826dc <nand_legacy_rw+0x720>
33f826cc:	e5952004 	ldr	r2, [r5, #4]
33f826d0:	e3e03000 	mvn	r3, #0	; 0x0
33f826d4:	e7c23001 	strb	r3, [r2, r1]
33f826d8:	e2811001 	add	r1, r1, #1	; 0x1
33f826dc:	e1510004 	cmp	r1, r4
33f826e0:	bafffff9 	blt	33f826cc <nand_legacy_rw+0x710>
33f826e4:	e1a01007 	mov	r1, r7
33f826e8:	ea000003 	b	33f826fc <nand_legacy_rw+0x740>
33f826ec:	e5952004 	ldr	r2, [r5, #4]
33f826f0:	e3e03000 	mvn	r3, #0	; 0x0
33f826f4:	e7c23001 	strb	r3, [r2, r1]
33f826f8:	e2811001 	add	r1, r1, #1	; 0x1
33f826fc:	e5953048 	ldr	r3, [r5, #72]
33f82700:	e1510003 	cmp	r1, r3
33f82704:	3afffff8 	bcc	33f826ec <nand_legacy_rw+0x730>
33f82708:	e3a02000 	mov	r2, #0	; 0x0
33f8270c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82710:	e5832008 	str	r2, [r3, #8]
33f82714:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f82718:	e5923020 	ldr	r3, [r2, #32]
33f8271c:	e3130001 	tst	r3, #1	; 0x1
33f82720:	0afffffb 	beq	33f82714 <nand_legacy_rw+0x758>
33f82724:	e3a03080 	mov	r3, #128	; 0x80
33f82728:	e5823008 	str	r3, [r2, #8]
33f8272c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82730:	e5933020 	ldr	r3, [r3, #32]
33f82734:	e3130001 	tst	r3, #1	; 0x1
33f82738:	0afffffb 	beq	33f8272c <nand_legacy_rw+0x770>
33f8273c:	e5953054 	ldr	r3, [r5, #84]
33f82740:	e5951000 	ldr	r1, [r5]
33f82744:	e3530000 	cmp	r3, #0	; 0x0
33f82748:	11a020c4 	movne	r2, r4, asr #1
33f8274c:	10822116 	addne	r2, r2, r6, lsl r1
33f82750:	00842116 	addeq	r2, r4, r6, lsl r1
33f82754:	e1a00005 	mov	r0, r5
33f82758:	e3a01003 	mov	r1, #3	; 0x3
33f8275c:	ebfffa7a 	bl	33f8114c <NanD_Address>
33f82760:	e5953054 	ldr	r3, [r5, #84]
33f82764:	e3530000 	cmp	r3, #0	; 0x0
33f82768:	01a01003 	moveq	r1, r3
33f8276c:	13a01000 	movne	r1, #0	; 0x0
33f82770:	1a000005 	bne	33f8278c <nand_legacy_rw+0x7d0>
33f82774:	ea00000f 	b	33f827b8 <nand_legacy_rw+0x7fc>
33f82778:	e5953004 	ldr	r3, [r5, #4]
33f8277c:	e7d32001 	ldrb	r2, [r3, r1]
33f82780:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82784:	e5c32010 	strb	r2, [r3, #16]
33f82788:	e2811002 	add	r1, r1, #2	; 0x2
33f8278c:	e285c048 	add	ip, r5, #72	; 0x48
33f82790:	e89c1008 	ldmia	ip, {r3, ip}
33f82794:	e083300c 	add	r3, r3, ip
33f82798:	e1510003 	cmp	r1, r3
33f8279c:	3afffff5 	bcc	33f82778 <nand_legacy_rw+0x7bc>
33f827a0:	ea000009 	b	33f827cc <nand_legacy_rw+0x810>
33f827a4:	e5953004 	ldr	r3, [r5, #4]
33f827a8:	e7d32001 	ldrb	r2, [r3, r1]
33f827ac:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f827b0:	e5c32010 	strb	r2, [r3, #16]
33f827b4:	e2811001 	add	r1, r1, #1	; 0x1
33f827b8:	e285e048 	add	lr, r5, #72	; 0x48
33f827bc:	e89e4008 	ldmia	lr, {r3, lr}
33f827c0:	e083300e 	add	r3, r3, lr
33f827c4:	e1510003 	cmp	r1, r3
33f827c8:	3afffff5 	bcc	33f827a4 <nand_legacy_rw+0x7e8>
33f827cc:	e3a02010 	mov	r2, #16	; 0x10
33f827d0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f827d4:	e5832008 	str	r2, [r3, #8]
33f827d8:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f827dc:	e5923020 	ldr	r3, [r2, #32]
33f827e0:	e3130001 	tst	r3, #1	; 0x1
33f827e4:	0afffffb 	beq	33f827d8 <nand_legacy_rw+0x81c>
33f827e8:	e3a03070 	mov	r3, #112	; 0x70
33f827ec:	e5823008 	str	r3, [r2, #8]
33f827f0:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f827f4:	e5923020 	ldr	r3, [r2, #32]
33f827f8:	e3130001 	tst	r3, #1	; 0x1
33f827fc:	0afffffb 	beq	33f827f0 <nand_legacy_rw+0x834>
33f82800:	e5d23010 	ldrb	r3, [r2, #16]
33f82804:	e2131001 	ands	r1, r3, #1	; 0x1
33f82808:	159f02fc 	ldrne	r0, [pc, #764]	; 33f82b0c <.text+0x2b0c>
33f8280c:	11a02006 	movne	r2, r6
33f82810:	1a000084 	bne	33f82a28 <nand_legacy_rw+0xa6c>
33f82814:	e5953050 	ldr	r3, [r5, #80]
33f82818:	e1540003 	cmp	r4, r3
33f8281c:	23a03001 	movcs	r3, #1	; 0x1
33f82820:	25823008 	strcs	r3, [r2, #8]
33f82824:	2a000005 	bcs	33f82840 <nand_legacy_rw+0x884>
33f82828:	e5821008 	str	r1, [r2, #8]
33f8282c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82830:	e5933020 	ldr	r3, [r3, #32]
33f82834:	e3130001 	tst	r3, #1	; 0x1
33f82838:	1a000004 	bne	33f82850 <nand_legacy_rw+0x894>
33f8283c:	eafffffa 	b	33f8282c <nand_legacy_rw+0x870>
33f82840:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82844:	e5933020 	ldr	r3, [r3, #32]
33f82848:	e3130001 	tst	r3, #1	; 0x1
33f8284c:	0afffffb 	beq	33f82840 <nand_legacy_rw+0x884>
33f82850:	e5953054 	ldr	r3, [r5, #84]
33f82854:	e5951000 	ldr	r1, [r5]
33f82858:	e3530000 	cmp	r3, #0	; 0x0
33f8285c:	11a020c4 	movne	r2, r4, asr #1
33f82860:	10822116 	addne	r2, r2, r6, lsl r1
33f82864:	00842116 	addeq	r2, r4, r6, lsl r1
33f82868:	e1a00005 	mov	r0, r5
33f8286c:	e3a01003 	mov	r1, #3	; 0x3
33f82870:	ebfffa35 	bl	33f8114c <NanD_Address>
33f82874:	e5953054 	ldr	r3, [r5, #84]
33f82878:	e3530000 	cmp	r3, #0	; 0x0
33f8287c:	01a00004 	moveq	r0, r4
33f82880:	0a000016 	beq	33f828e0 <nand_legacy_rw+0x924>
33f82884:	ea00000a 	b	33f828b4 <nand_legacy_rw+0x8f8>
33f82888:	e5951004 	ldr	r1, [r5, #4]
33f8288c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82890:	e081200c 	add	r2, r1, ip
33f82894:	e5d30010 	ldrb	r0, [r3, #16]
33f82898:	e5d22001 	ldrb	r2, [r2, #1]
33f8289c:	e7d1300c 	ldrb	r3, [r1, ip]
33f828a0:	e0833402 	add	r3, r3, r2, lsl #8
33f828a4:	e1530000 	cmp	r3, r0
33f828a8:	e3a0c002 	mov	ip, #2	; 0x2
33f828ac:	0a000001 	beq	33f828b8 <nand_legacy_rw+0x8fc>
33f828b0:	ea00005a 	b	33f82a20 <nand_legacy_rw+0xa64>
33f828b4:	e1a0c004 	mov	ip, r4
33f828b8:	e15c0007 	cmp	ip, r7
33f828bc:	bafffff1 	blt	33f82888 <nand_legacy_rw+0x8cc>
33f828c0:	ea000008 	b	33f828e8 <nand_legacy_rw+0x92c>
33f828c4:	e5951004 	ldr	r1, [r5, #4]
33f828c8:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f828cc:	e5d32010 	ldrb	r2, [r3, #16]
33f828d0:	e7d13000 	ldrb	r3, [r1, r0]
33f828d4:	e1530002 	cmp	r3, r2
33f828d8:	1a000050 	bne	33f82a20 <nand_legacy_rw+0xa64>
33f828dc:	e2800001 	add	r0, r0, #1	; 0x1
33f828e0:	e1500007 	cmp	r0, r7
33f828e4:	bafffff6 	blt	33f828c4 <nand_legacy_rw+0x908>
33f828e8:	e3a02050 	mov	r2, #80	; 0x50
33f828ec:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f828f0:	e5832008 	str	r2, [r3, #8]
33f828f4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f828f8:	e5933020 	ldr	r3, [r3, #32]
33f828fc:	e3130001 	tst	r3, #1	; 0x1
33f82900:	0afffffb 	beq	33f828f4 <nand_legacy_rw+0x938>
33f82904:	e5953054 	ldr	r3, [r5, #84]
33f82908:	e5951000 	ldr	r1, [r5]
33f8290c:	e3530000 	cmp	r3, #0	; 0x0
33f82910:	11a020c4 	movne	r2, r4, asr #1
33f82914:	10822116 	addne	r2, r2, r6, lsl r1
33f82918:	00842116 	addeq	r2, r4, r6, lsl r1
33f8291c:	e1a00005 	mov	r0, r5
33f82920:	e3a01003 	mov	r1, #3	; 0x3
33f82924:	ebfffa08 	bl	33f8114c <NanD_Address>
33f82928:	e5953054 	ldr	r3, [r5, #84]
33f8292c:	e3530000 	cmp	r3, #0	; 0x0
33f82930:	01a01003 	moveq	r1, r3
33f82934:	13a01000 	movne	r1, #0	; 0x0
33f82938:	1a00000a 	bne	33f82968 <nand_legacy_rw+0x9ac>
33f8293c:	ea000012 	b	33f8298c <nand_legacy_rw+0x9d0>
33f82940:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82944:	e5d33010 	ldrb	r3, [r3, #16]
33f82948:	e5952004 	ldr	r2, [r5, #4]
33f8294c:	e20330ff 	and	r3, r3, #255	; 0xff
33f82950:	e7c23001 	strb	r3, [r2, r1]
33f82954:	e5953004 	ldr	r3, [r5, #4]
33f82958:	e3a02000 	mov	r2, #0	; 0x0
33f8295c:	e0833001 	add	r3, r3, r1
33f82960:	e5c32001 	strb	r2, [r3, #1]
33f82964:	e2811002 	add	r1, r1, #2	; 0x2
33f82968:	e595304c 	ldr	r3, [r5, #76]
33f8296c:	e1510003 	cmp	r1, r3
33f82970:	3afffff2 	bcc	33f82940 <nand_legacy_rw+0x984>
33f82974:	ea000007 	b	33f82998 <nand_legacy_rw+0x9dc>
33f82978:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f8297c:	e5d32010 	ldrb	r2, [r3, #16]
33f82980:	e5953004 	ldr	r3, [r5, #4]
33f82984:	e7c32001 	strb	r2, [r3, r1]
33f82988:	e2811001 	add	r1, r1, #1	; 0x1
33f8298c:	e595304c 	ldr	r3, [r5, #76]
33f82990:	e1510003 	cmp	r1, r3
33f82994:	3afffff7 	bcc	33f82978 <nand_legacy_rw+0x9bc>
33f82998:	e59f0158 	ldr	r0, [pc, #344]	; 33f82af8 <.text+0x2af8>
33f8299c:	e3a01000 	mov	r1, #0	; 0x0
33f829a0:	ea00000a 	b	33f829d0 <nand_legacy_rw+0xa14>
33f829a4:	e5903000 	ldr	r3, [r0]
33f829a8:	e5952004 	ldr	r2, [r5, #4]
33f829ac:	e281c026 	add	ip, r1, #38	; 0x26
33f829b0:	e7d23003 	ldrb	r3, [r2, r3]
33f829b4:	e7dc200d 	ldrb	r2, [ip, sp]
33f829b8:	e1530002 	cmp	r3, r2
33f829bc:	e2800004 	add	r0, r0, #4	; 0x4
33f829c0:	0a000001 	beq	33f829cc <nand_legacy_rw+0xa10>
33f829c4:	e3520000 	cmp	r2, #0	; 0x0
33f829c8:	1a00000e 	bne	33f82a08 <nand_legacy_rw+0xa4c>
33f829cc:	e2811001 	add	r1, r1, #1	; 0x1
33f829d0:	e59de01c 	ldr	lr, [sp, #28]
33f829d4:	e151000e 	cmp	r1, lr
33f829d8:	bafffff1 	blt	33f829a4 <nand_legacy_rw+0x9e8>
33f829dc:	ea00002f 	b	33f82aa0 <nand_legacy_rw+0xae4>
33f829e0:	e2473001 	sub	r3, r7, #1	; 0x1
33f829e4:	e1a06459 	mov	r6, r9, asr r4
33f829e8:	e0094003 	and	r4, r9, r3
33f829ec:	e59d302c 	ldr	r3, [sp, #44]
33f829f0:	e153000a 	cmp	r3, sl
33f829f4:	3afffe8f 	bcc	33f82438 <nand_legacy_rw+0x47c>
33f829f8:	e3a00001 	mov	r0, #1	; 0x1
33f829fc:	e58da02c 	str	sl, [sp, #44]
33f82a00:	ebfff9c5 	bl	33f8111c <NF_SetCE>
33f82a04:	ea00000c 	b	33f82a3c <nand_legacy_rw+0xa80>
33f82a08:	e1a03001 	mov	r3, r1
33f82a0c:	e1a02006 	mov	r2, r6
33f82a10:	e59f00f8 	ldr	r0, [pc, #248]	; 33f82b10 <.text+0x2b10>
33f82a14:	e59f10f8 	ldr	r1, [pc, #248]	; 33f82b14 <.text+0x2b14>
33f82a18:	eb001490 	bl	33f87c60 <printf>
33f82a1c:	ea000003 	b	33f82a30 <nand_legacy_rw+0xa74>
33f82a20:	e59f00f0 	ldr	r0, [pc, #240]	; 33f82b18 <.text+0x2b18>
33f82a24:	e1a02006 	mov	r2, r6
33f82a28:	e59f10e4 	ldr	r1, [pc, #228]	; 33f82b14 <.text+0x2b14>
33f82a2c:	eb00148b 	bl	33f87c60 <printf>
33f82a30:	e3a00001 	mov	r0, #1	; 0x1
33f82a34:	ebfff9b8 	bl	33f8111c <NF_SetCE>
33f82a38:	ea00001e 	b	33f82ab8 <nand_legacy_rw+0xafc>
33f82a3c:	e59d302c 	ldr	r3, [sp, #44]
33f82a40:	e59d0004 	ldr	r0, [sp, #4]
33f82a44:	e59d1054 	ldr	r1, [sp, #84]
33f82a48:	e59d200c 	ldr	r2, [sp, #12]
33f82a4c:	e0630000 	rsb	r0, r3, r0
33f82a50:	e0811003 	add	r1, r1, r3
33f82a54:	e0822003 	add	r2, r2, r3
33f82a58:	e58d0004 	str	r0, [sp, #4]
33f82a5c:	e58d1054 	str	r1, [sp, #84]
33f82a60:	e58d200c 	str	r2, [sp, #12]
33f82a64:	e0899003 	add	r9, r9, r3
33f82a68:	e3a04000 	mov	r4, #0	; 0x0
33f82a6c:	e59d2010 	ldr	r2, [sp, #16]
33f82a70:	e59d3004 	ldr	r3, [sp, #4]
33f82a74:	e3530000 	cmp	r3, #0	; 0x0
33f82a78:	1afffd5b 	bne	33f81fec <nand_legacy_rw+0x30>
33f82a7c:	e59dc050 	ldr	ip, [sp, #80]
33f82a80:	e35c0000 	cmp	ip, #0	; 0x0
33f82a84:	159de00c 	ldrne	lr, [sp, #12]
33f82a88:	e1a00004 	mov	r0, r4
33f82a8c:	158ce000 	strne	lr, [ip]
33f82a90:	e28dd030 	add	sp, sp, #48	; 0x30
33f82a94:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f82a98:	e3a06000 	mov	r6, #0	; 0x0
33f82a9c:	eafffdf3 	b	33f82270 <nand_legacy_rw+0x2b4>
33f82aa0:	e59d302c 	ldr	r3, [sp, #44]
33f82aa4:	e2866001 	add	r6, r6, #1	; 0x1
33f82aa8:	e083300b 	add	r3, r3, fp
33f82aac:	e3a04000 	mov	r4, #0	; 0x0
33f82ab0:	e58d302c 	str	r3, [sp, #44]
33f82ab4:	eaffffcc 	b	33f829ec <nand_legacy_rw+0xa30>
33f82ab8:	e3e04000 	mvn	r4, #0	; 0x0
33f82abc:	eaffffee 	b	33f82a7c <nand_legacy_rw+0xac0>
33f82ac0:	e59f0054 	ldr	r0, [pc, #84]	; 33f82b1c <.text+0x2b1c>
33f82ac4:	e59f103c 	ldr	r1, [pc, #60]	; 33f82b08 <.text+0x2b08>
33f82ac8:	eb001464 	bl	33f87c60 <printf>
33f82acc:	eafffff9 	b	33f82ab8 <nand_legacy_rw+0xafc>
33f82ad0:	e1a0300a 	mov	r3, sl
33f82ad4:	e1a02009 	mov	r2, r9
33f82ad8:	e59f0040 	ldr	r0, [pc, #64]	; 33f82b20 <.text+0x2b20>
33f82adc:	e59f101c 	ldr	r1, [pc, #28]	; 33f82b00 <.text+0x2b00>
33f82ae0:	e58dc000 	str	ip, [sp]
33f82ae4:	eb00145d 	bl	33f87c60 <printf>
33f82ae8:	e3a03000 	mov	r3, #0	; 0x0
33f82aec:	e58d302c 	str	r3, [sp, #44]
33f82af0:	eafffff0 	b	33f82ab8 <nand_legacy_rw+0xafc>
33f82af4:	33f921e0 	mvnccs	r2, #56	; 0x38
33f82af8:	33f96244 	mvnccs	r6, #1073741828	; 0x40000004
33f82afc:	33f92264 	mvnccs	r2, #1073741830	; 0x40000006
33f82b00:	33f9158c 	mvnccs	r1, #587202560	; 0x23000000
33f82b04:	33f922b0 	mvnccs	r2, #11	; 0xb
33f82b08:	33f9169c 	mvnccs	r1, #163577856	; 0x9c00000
33f82b0c:	33f922d4 	mvnccs	r2, #1073741837	; 0x4000000d
33f82b10:	33f9231c 	mvnccs	r2, #1879048192	; 0x70000000
33f82b14:	33f916ac 	mvnccs	r1, #180355072	; 0xac00000
33f82b18:	33f922f4 	mvnccs	r2, #1073741839	; 0x4000000f
33f82b1c:	33f92288 	mvnccs	r2, #-2147483640	; 0x80000008
33f82b20:	33f92234 	mvnccs	r2, #1073741827	; 0x40000003

33f82b24 <nand_legacy_erase>:
33f82b24:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f82b28:	e590c028 	ldr	ip, [r0, #40]
33f82b2c:	e1a04001 	mov	r4, r1
33f82b30:	e24c1001 	sub	r1, ip, #1	; 0x1
33f82b34:	e1140001 	tst	r4, r1
33f82b38:	e24dd008 	sub	sp, sp, #8	; 0x8
33f82b3c:	e1a06000 	mov	r6, r0
33f82b40:	e1a05002 	mov	r5, r2
33f82b44:	e1a0a003 	mov	sl, r3
33f82b48:	1a000001 	bne	33f82b54 <nand_legacy_erase+0x30>
33f82b4c:	e0120001 	ands	r0, r2, r1
33f82b50:	0a000004 	beq	33f82b68 <nand_legacy_erase+0x44>
33f82b54:	e1a0100c 	mov	r1, ip
33f82b58:	e59f0178 	ldr	r0, [pc, #376]	; 33f82cd8 <.text+0x2cd8>
33f82b5c:	eb00143f 	bl	33f87c60 <printf>
33f82b60:	e3e07000 	mvn	r7, #0	; 0x0
33f82b64:	ea000058 	b	33f82ccc <nand_legacy_erase+0x1a8>
33f82b68:	ebfff96b 	bl	33f8111c <NF_SetCE>
33f82b6c:	e3a02070 	mov	r2, #112	; 0x70
33f82b70:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82b74:	e5832008 	str	r2, [r3, #8]
33f82b78:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f82b7c:	e5923020 	ldr	r3, [r2, #32]
33f82b80:	e3130001 	tst	r3, #1	; 0x1
33f82b84:	0afffffb 	beq	33f82b78 <nand_legacy_erase+0x54>
33f82b88:	e5d23010 	ldrb	r3, [r2, #16]
33f82b8c:	e3130080 	tst	r3, #128	; 0x80
33f82b90:	1a000002 	bne	33f82ba0 <nand_legacy_erase+0x7c>
33f82b94:	e59f0140 	ldr	r0, [pc, #320]	; 33f82cdc <.text+0x2cdc>
33f82b98:	eb001430 	bl	33f87c60 <printf>
33f82b9c:	ea00000b 	b	33f82bd0 <nand_legacy_erase+0xac>
33f82ba0:	e3a03070 	mov	r3, #112	; 0x70
33f82ba4:	e5823008 	str	r3, [r2, #8]
33f82ba8:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f82bac:	e5923020 	ldr	r3, [r2, #32]
33f82bb0:	e3130001 	tst	r3, #1	; 0x1
33f82bb4:	0afffffb 	beq	33f82ba8 <nand_legacy_erase+0x84>
33f82bb8:	e5d23010 	ldrb	r3, [r2, #16]
33f82bbc:	e3130080 	tst	r3, #128	; 0x80
33f82bc0:	1a00003c 	bne	33f82cb8 <nand_legacy_erase+0x194>
33f82bc4:	e59f0114 	ldr	r0, [pc, #276]	; 33f82ce0 <.text+0x2ce0>
33f82bc8:	e59f1114 	ldr	r1, [pc, #276]	; 33f82ce4 <.text+0x2ce4>
33f82bcc:	eb001423 	bl	33f87c60 <printf>
33f82bd0:	e3e07000 	mvn	r7, #0	; 0x0
33f82bd4:	ea00003a 	b	33f82cc4 <nand_legacy_erase+0x1a0>
33f82bd8:	e1a02004 	mov	r2, r4
33f82bdc:	e59f0104 	ldr	r0, [pc, #260]	; 33f82ce8 <.text+0x2ce8>
33f82be0:	e59f10fc 	ldr	r1, [pc, #252]	; 33f82ce4 <.text+0x2ce4>
33f82be4:	eb00141d 	bl	33f87c60 <printf>
33f82be8:	eafffff8 	b	33f82bd0 <nand_legacy_erase+0xac>
33f82bec:	e1a00006 	mov	r0, r6
33f82bf0:	e1a01004 	mov	r1, r4
33f82bf4:	ebfffa2f 	bl	33f814b8 <check_block>
33f82bf8:	e3500000 	cmp	r0, #0	; 0x0
33f82bfc:	1a00002a 	bne	33f82cac <nand_legacy_erase+0x188>
33f82c00:	ebfff945 	bl	33f8111c <NF_SetCE>
33f82c04:	e3a02060 	mov	r2, #96	; 0x60
33f82c08:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
33f82c0c:	e5832008 	str	r2, [r3, #8]
33f82c10:	e3a0744e 	mov	r7, #1308622848	; 0x4e000000
33f82c14:	e5973020 	ldr	r3, [r7, #32]
33f82c18:	e3130001 	tst	r3, #1	; 0x1
33f82c1c:	0afffffb 	beq	33f82c10 <nand_legacy_erase+0xec>
33f82c20:	e1a00006 	mov	r0, r6
33f82c24:	e3a01002 	mov	r1, #2	; 0x2
33f82c28:	e1a02004 	mov	r2, r4
33f82c2c:	ebfff946 	bl	33f8114c <NanD_Address>
33f82c30:	e3a030d0 	mov	r3, #208	; 0xd0
33f82c34:	e5873008 	str	r3, [r7, #8]
33f82c38:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f82c3c:	e5923020 	ldr	r3, [r2, #32]
33f82c40:	e3130001 	tst	r3, #1	; 0x1
33f82c44:	0afffffb 	beq	33f82c38 <nand_legacy_erase+0x114>
33f82c48:	e3a03070 	mov	r3, #112	; 0x70
33f82c4c:	e5823008 	str	r3, [r2, #8]
33f82c50:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
33f82c54:	e5923020 	ldr	r3, [r2, #32]
33f82c58:	e3130001 	tst	r3, #1	; 0x1
33f82c5c:	0afffffb 	beq	33f82c50 <nand_legacy_erase+0x12c>
33f82c60:	e5d23010 	ldrb	r3, [r2, #16]
33f82c64:	e3130001 	tst	r3, #1	; 0x1
33f82c68:	1affffda 	bne	33f82bd8 <nand_legacy_erase+0xb4>
33f82c6c:	e35a0000 	cmp	sl, #0	; 0x0
33f82c70:	0a00000d 	beq	33f82cac <nand_legacy_erase+0x188>
33f82c74:	e5d6303c 	ldrb	r3, [r6, #60]
33f82c78:	e3530000 	cmp	r3, #0	; 0x0
33f82c7c:	03a02008 	moveq	r2, #8	; 0x8
33f82c80:	13a03006 	movne	r3, #6	; 0x6
33f82c84:	01a03002 	moveq	r3, r2
33f82c88:	e59fc05c 	ldr	ip, [pc, #92]	; 33f82cec <.text+0x2cec>
33f82c8c:	13a02002 	movne	r2, #2	; 0x2
33f82c90:	e0841003 	add	r1, r4, r3
33f82c94:	e1a00006 	mov	r0, r6
33f82c98:	e28d3004 	add	r3, sp, #4	; 0x4
33f82c9c:	e58dc000 	str	ip, [sp]
33f82ca0:	ebfffaf7 	bl	33f81884 <nand_write_oob>
33f82ca4:	e2507000 	subs	r7, r0, #0	; 0x0
33f82ca8:	1a000005 	bne	33f82cc4 <nand_legacy_erase+0x1a0>
33f82cac:	e5963028 	ldr	r3, [r6, #40]
33f82cb0:	e0635005 	rsb	r5, r3, r5
33f82cb4:	e0844003 	add	r4, r4, r3
33f82cb8:	e3550000 	cmp	r5, #0	; 0x0
33f82cbc:	1affffca 	bne	33f82bec <nand_legacy_erase+0xc8>
33f82cc0:	e1a07005 	mov	r7, r5
33f82cc4:	e3a00001 	mov	r0, #1	; 0x1
33f82cc8:	ebfff913 	bl	33f8111c <NF_SetCE>
33f82ccc:	e1a00007 	mov	r0, r7
33f82cd0:	e28dd008 	add	sp, sp, #8	; 0x8
33f82cd4:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f82cd8:	33f92360 	mvnccs	r2, #-2147483647	; 0x80000001
33f82cdc:	33f92398 	mvnccs	r2, #1610612738	; 0x60000002
33f82ce0:	33f922b0 	mvnccs	r2, #11	; 0xb
33f82ce4:	33f91578 	mvnccs	r1, #503316480	; 0x1e000000
33f82ce8:	33f923c8 	mvnccs	r2, #536870915	; 0x20000003
33f82cec:	33f956b8 	mvnccs	r5, #192937984	; 0xb800000

33f82cf0 <run_command>:
33f82cf0:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f82cf4:	e1a05000 	mov	r5, r0
33f82cf8:	e24dde35 	sub	sp, sp, #848	; 0x350
33f82cfc:	e58d1000 	str	r1, [sp]
33f82d00:	eb001380 	bl	33f87b08 <clear_ctrlc>
33f82d04:	e3550000 	cmp	r5, #0	; 0x0
33f82d08:	0a0000e6 	beq	33f830a8 <.text+0x30a8>
33f82d0c:	e5d53000 	ldrb	r3, [r5]
33f82d10:	e3530000 	cmp	r3, #0	; 0x0
33f82d14:	0a0000e3 	beq	33f830a8 <.text+0x30a8>
33f82d18:	e1a00005 	mov	r0, r5
33f82d1c:	eb001ed2 	bl	33f8a86c <strlen>
33f82d20:	e35000ff 	cmp	r0, #255	; 0xff
33f82d24:	9a000002 	bls	33f82d34 <run_command+0x44>
33f82d28:	e59f0388 	ldr	r0, [pc, #904]	; 33f830b8 <.text+0x30b8>
33f82d2c:	eb0013b8 	bl	33f87c14 <puts>
33f82d30:	ea0000dc 	b	33f830a8 <.text+0x30a8>
33f82d34:	e28d4f83 	add	r4, sp, #524	; 0x20c
33f82d38:	e1a01005 	mov	r1, r5
33f82d3c:	e1a00004 	mov	r0, r4
33f82d40:	eb001e74 	bl	33f8a718 <strcpy>
33f82d44:	e3a09000 	mov	r9, #0	; 0x0
33f82d48:	e3a03001 	mov	r3, #1	; 0x1
33f82d4c:	e1a00004 	mov	r0, r4
33f82d50:	e58d3008 	str	r3, [sp, #8]
33f82d54:	ea0000cb 	b	33f83088 <.text+0x3088>
33f82d58:	e1a02000 	mov	r2, r0
33f82d5c:	e3a0c000 	mov	ip, #0	; 0x0
33f82d60:	e3510027 	cmp	r1, #39	; 0x27
33f82d64:	1a000002 	bne	33f82d74 <run_command+0x84>
33f82d68:	e5523001 	ldrb	r3, [r2, #-1]
33f82d6c:	e353005c 	cmp	r3, #92	; 0x5c
33f82d70:	122cc001 	eorne	ip, ip, #1	; 0x1
33f82d74:	e35c0000 	cmp	ip, #0	; 0x0
33f82d78:	1a000009 	bne	33f82da4 <run_command+0xb4>
33f82d7c:	e351003b 	cmp	r1, #59	; 0x3b
33f82d80:	13a03000 	movne	r3, #0	; 0x0
33f82d84:	03a03001 	moveq	r3, #1	; 0x1
33f82d88:	e1520000 	cmp	r2, r0
33f82d8c:	03a03000 	moveq	r3, #0	; 0x0
33f82d90:	e3530000 	cmp	r3, #0	; 0x0
33f82d94:	0a000002 	beq	33f82da4 <run_command+0xb4>
33f82d98:	e5523001 	ldrb	r3, [r2, #-1]
33f82d9c:	e353005c 	cmp	r3, #92	; 0x5c
33f82da0:	1a000003 	bne	33f82db4 <run_command+0xc4>
33f82da4:	e5f21001 	ldrb	r1, [r2, #1]!
33f82da8:	e3510000 	cmp	r1, #0	; 0x0
33f82dac:	1affffeb 	bne	33f82d60 <run_command+0x70>
33f82db0:	ea000001 	b	33f82dbc <run_command+0xcc>
33f82db4:	e5c2c000 	strb	ip, [r2]
33f82db8:	e2822001 	add	r2, r2, #1	; 0x1
33f82dbc:	e58d2004 	str	r2, [sp, #4]
33f82dc0:	e1a05000 	mov	r5, r0
33f82dc4:	eb001ea8 	bl	33f8a86c <strlen>
33f82dc8:	e3a02000 	mov	r2, #0	; 0x0
33f82dcc:	e1a0a000 	mov	sl, r0
33f82dd0:	e28d7f43 	add	r7, sp, #268	; 0x10c
33f82dd4:	e1a0b002 	mov	fp, r2
33f82dd8:	e3a06c01 	mov	r6, #256	; 0x100
33f82ddc:	e1a01002 	mov	r1, r2
33f82de0:	ea00005d 	b	33f82f5c <.text+0x2f5c>
33f82de4:	e3510003 	cmp	r1, #3	; 0x3
33f82de8:	e24aa001 	sub	sl, sl, #1	; 0x1
33f82dec:	e4d54001 	ldrb	r4, [r5], #1
33f82df0:	0a00004c 	beq	33f82f28 <.text+0x2f28>
33f82df4:	e354005c 	cmp	r4, #92	; 0x5c
33f82df8:	13a03000 	movne	r3, #0	; 0x0
33f82dfc:	03a03001 	moveq	r3, #1	; 0x1
33f82e00:	e352005c 	cmp	r2, #92	; 0x5c
33f82e04:	03a03000 	moveq	r3, #0	; 0x0
33f82e08:	e3530000 	cmp	r3, #0	; 0x0
33f82e0c:	0a000003 	beq	33f82e20 <run_command+0x130>
33f82e10:	e25aa001 	subs	sl, sl, #1	; 0x1
33f82e14:	3a000055 	bcc	33f82f70 <.text+0x2f70>
33f82e18:	e1a02004 	mov	r2, r4
33f82e1c:	e4d54001 	ldrb	r4, [r5], #1
33f82e20:	e3510003 	cmp	r1, #3	; 0x3
33f82e24:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
33f82e28:	ea00004a 	b	33f82f58 <.text+0x2f58>
33f82e2c:	33f82e3c 	mvnccs	r2, #960	; 0x3c0
33f82e30:	33f82e78 	mvnccs	r2, #1920	; 0x780
33f82e34:	33f82eb4 	mvnccs	r2, #2880	; 0xb40
33f82e38:	33f82f28 	mvnccs	r2, #160	; 0xa0
33f82e3c:	e252205c 	subs	r2, r2, #92	; 0x5c
33f82e40:	13a02001 	movne	r2, #1	; 0x1
33f82e44:	e3540027 	cmp	r4, #39	; 0x27
33f82e48:	13a03000 	movne	r3, #0	; 0x0
33f82e4c:	02023001 	andeq	r3, r2, #1	; 0x1
33f82e50:	e3530000 	cmp	r3, #0	; 0x0
33f82e54:	1a00003c 	bne	33f82f4c <.text+0x2f4c>
33f82e58:	e3540024 	cmp	r4, #36	; 0x24
33f82e5c:	13a03000 	movne	r3, #0	; 0x0
33f82e60:	02023001 	andeq	r3, r2, #1	; 0x1
33f82e64:	e3530000 	cmp	r3, #0	; 0x0
33f82e68:	04c74001 	streqb	r4, [r7], #1
33f82e6c:	13a01001 	movne	r1, #1	; 0x1
33f82e70:	02466001 	subeq	r6, r6, #1	; 0x1
33f82e74:	ea000037 	b	33f82f58 <.text+0x2f58>
33f82e78:	e354007b 	cmp	r4, #123	; 0x7b
33f82e7c:	13540028 	cmpne	r4, #40	; 0x28
33f82e80:	13a02000 	movne	r2, #0	; 0x0
33f82e84:	03a02001 	moveq	r2, #1	; 0x1
33f82e88:	01a0b005 	moveq	fp, r5
33f82e8c:	03a01002 	moveq	r1, #2	; 0x2
33f82e90:	0a000030 	beq	33f82f58 <.text+0x2f58>
33f82e94:	e3a03024 	mov	r3, #36	; 0x24
33f82e98:	e2566001 	subs	r6, r6, #1	; 0x1
33f82e9c:	e4c73001 	strb	r3, [r7], #1
33f82ea0:	0a00002b 	beq	33f82f54 <.text+0x2f54>
33f82ea4:	e4c74001 	strb	r4, [r7], #1
33f82ea8:	e2466001 	sub	r6, r6, #1	; 0x1
33f82eac:	e1a01002 	mov	r1, r2
33f82eb0:	ea000028 	b	33f82f58 <.text+0x2f58>
33f82eb4:	e354007d 	cmp	r4, #125	; 0x7d
33f82eb8:	13540029 	cmpne	r4, #41	; 0x29
33f82ebc:	1a000025 	bne	33f82f58 <.text+0x2f58>
33f82ec0:	e06b3005 	rsb	r3, fp, r5
33f82ec4:	e2431001 	sub	r1, r3, #1	; 0x1
33f82ec8:	e3a02000 	mov	r2, #0	; 0x0
33f82ecc:	ea000002 	b	33f82edc <.text+0x2edc>
33f82ed0:	e7d2300b 	ldrb	r3, [r2, fp]
33f82ed4:	e7c23000 	strb	r3, [r2, r0]
33f82ed8:	e2822001 	add	r2, r2, #1	; 0x1
33f82edc:	e1520001 	cmp	r2, r1
33f82ee0:	e28d000c 	add	r0, sp, #12	; 0xc
33f82ee4:	bafffff9 	blt	33f82ed0 <.text+0x2ed0>
33f82ee8:	e28d3e35 	add	r3, sp, #848	; 0x350
33f82eec:	e0832002 	add	r2, r3, r2
33f82ef0:	e3a03000 	mov	r3, #0	; 0x0
33f82ef4:	e5423344 	strb	r3, [r2, #-836]
33f82ef8:	eb001025 	bl	33f86f94 <getenv>
33f82efc:	e3500000 	cmp	r0, #0	; 0x0
33f82f00:	1a000002 	bne	33f82f10 <.text+0x2f10>
33f82f04:	ea000012 	b	33f82f54 <.text+0x2f54>
33f82f08:	e4c73001 	strb	r3, [r7], #1
33f82f0c:	e2466001 	sub	r6, r6, #1	; 0x1
33f82f10:	e5d03000 	ldrb	r3, [r0]
33f82f14:	e3530000 	cmp	r3, #0	; 0x0
33f82f18:	13560000 	cmpne	r6, #0	; 0x0
33f82f1c:	e2800001 	add	r0, r0, #1	; 0x1
33f82f20:	1afffff8 	bne	33f82f08 <.text+0x2f08>
33f82f24:	ea00000a 	b	33f82f54 <.text+0x2f54>
33f82f28:	e3540027 	cmp	r4, #39	; 0x27
33f82f2c:	13a03000 	movne	r3, #0	; 0x0
33f82f30:	03a03001 	moveq	r3, #1	; 0x1
33f82f34:	e352005c 	cmp	r2, #92	; 0x5c
33f82f38:	03a03000 	moveq	r3, #0	; 0x0
33f82f3c:	e3530000 	cmp	r3, #0	; 0x0
33f82f40:	1a000003 	bne	33f82f54 <.text+0x2f54>
33f82f44:	e4c74001 	strb	r4, [r7], #1
33f82f48:	e2466001 	sub	r6, r6, #1	; 0x1
33f82f4c:	e3a01003 	mov	r1, #3	; 0x3
33f82f50:	ea000000 	b	33f82f58 <.text+0x2f58>
33f82f54:	e3a01000 	mov	r1, #0	; 0x0
33f82f58:	e1a02004 	mov	r2, r4
33f82f5c:	e2560000 	subs	r0, r6, #0	; 0x0
33f82f60:	13a00001 	movne	r0, #1	; 0x1
33f82f64:	e35a0000 	cmp	sl, #0	; 0x0
33f82f68:	13560000 	cmpne	r6, #0	; 0x0
33f82f6c:	1affff9c 	bne	33f82de4 <run_command+0xf4>
33f82f70:	e3500000 	cmp	r0, #0	; 0x0
33f82f74:	13a03000 	movne	r3, #0	; 0x0
33f82f78:	e28d1f43 	add	r1, sp, #268	; 0x10c
33f82f7c:	e3a05000 	mov	r5, #0	; 0x0
33f82f80:	15c73000 	strneb	r3, [r7]
33f82f84:	ea000000 	b	33f82f8c <.text+0x2f8c>
33f82f88:	e2811001 	add	r1, r1, #1	; 0x1
33f82f8c:	e5d13000 	ldrb	r3, [r1]
33f82f90:	e3530009 	cmp	r3, #9	; 0x9
33f82f94:	13530020 	cmpne	r3, #32	; 0x20
33f82f98:	0afffffa 	beq	33f82f88 <.text+0x2f88>
33f82f9c:	e3530000 	cmp	r3, #0	; 0x0
33f82fa0:	e28d2fc3 	add	r2, sp, #780	; 0x30c
33f82fa4:	0a000017 	beq	33f83008 <.text+0x3008>
33f82fa8:	e7821105 	str	r1, [r2, r5, lsl #2]
33f82fac:	e2855001 	add	r5, r5, #1	; 0x1
33f82fb0:	ea000000 	b	33f82fb8 <.text+0x2fb8>
33f82fb4:	e2811001 	add	r1, r1, #1	; 0x1
33f82fb8:	e5d12000 	ldrb	r2, [r1]
33f82fbc:	e3520000 	cmp	r2, #0	; 0x0
33f82fc0:	13520020 	cmpne	r2, #32	; 0x20
33f82fc4:	0a000002 	beq	33f82fd4 <.text+0x2fd4>
33f82fc8:	e3520009 	cmp	r2, #9	; 0x9
33f82fcc:	1afffff8 	bne	33f82fb4 <.text+0x2fb4>
33f82fd0:	ea000001 	b	33f82fdc <.text+0x2fdc>
33f82fd4:	e3520000 	cmp	r2, #0	; 0x0
33f82fd8:	0a000007 	beq	33f82ffc <.text+0x2ffc>
33f82fdc:	e3a03000 	mov	r3, #0	; 0x0
33f82fe0:	e355000f 	cmp	r5, #15	; 0xf
33f82fe4:	e5c13000 	strb	r3, [r1]
33f82fe8:	daffffe6 	ble	33f82f88 <.text+0x2f88>
33f82fec:	e59f00c8 	ldr	r0, [pc, #200]	; 33f830bc <.text+0x30bc>
33f82ff0:	e3a01010 	mov	r1, #16	; 0x10
33f82ff4:	eb001319 	bl	33f87c60 <printf>
33f82ff8:	ea000005 	b	33f83014 <.text+0x3014>
33f82ffc:	e28d3fc3 	add	r3, sp, #780	; 0x30c
33f83000:	e7832105 	str	r2, [r3, r5, lsl #2]
33f83004:	ea000000 	b	33f8300c <.text+0x300c>
33f83008:	e7823105 	str	r3, [r2, r5, lsl #2]
33f8300c:	e3550000 	cmp	r5, #0	; 0x0
33f83010:	0a000006 	beq	33f83030 <.text+0x3030>
33f83014:	e59d030c 	ldr	r0, [sp, #780]
33f83018:	eb0011a1 	bl	33f876a4 <find_cmd>
33f8301c:	e2504000 	subs	r4, r0, #0	; 0x0
33f83020:	1a000004 	bne	33f83038 <.text+0x3038>
33f83024:	e59f0094 	ldr	r0, [pc, #148]	; 33f830c0 <.text+0x30c0>
33f83028:	e59d130c 	ldr	r1, [sp, #780]
33f8302c:	eb00130b 	bl	33f87c60 <printf>
33f83030:	e3e09000 	mvn	r9, #0	; 0x0
33f83034:	ea000012 	b	33f83084 <.text+0x3084>
33f83038:	e5943004 	ldr	r3, [r4, #4]
33f8303c:	e1550003 	cmp	r5, r3
33f83040:	c5941010 	ldrgt	r1, [r4, #16]
33f83044:	c59f0078 	ldrgt	r0, [pc, #120]	; 33f830c4 <.text+0x30c4>
33f83048:	cafffff7 	bgt	33f8302c <.text+0x302c>
33f8304c:	e1a02005 	mov	r2, r5
33f83050:	e59d1000 	ldr	r1, [sp]
33f83054:	e28d3fc3 	add	r3, sp, #780	; 0x30c
33f83058:	e1a0e00f 	mov	lr, pc
33f8305c:	e594f00c 	ldr	pc, [r4, #12]
33f83060:	e3500000 	cmp	r0, #0	; 0x0
33f83064:	13e09000 	mvnne	r9, #0	; 0x0
33f83068:	e5944008 	ldr	r4, [r4, #8]
33f8306c:	eb0012a1 	bl	33f87af8 <had_ctrlc>
33f83070:	e3500000 	cmp	r0, #0	; 0x0
33f83074:	1a000009 	bne	33f830a0 <.text+0x30a0>
33f83078:	e59d3008 	ldr	r3, [sp, #8]
33f8307c:	e0033004 	and	r3, r3, r4
33f83080:	e58d3008 	str	r3, [sp, #8]
33f83084:	e59d0004 	ldr	r0, [sp, #4]
33f83088:	e5d01000 	ldrb	r1, [r0]
33f8308c:	e3510000 	cmp	r1, #0	; 0x0
33f83090:	1affff30 	bne	33f82d58 <run_command+0x68>
33f83094:	e3590000 	cmp	r9, #0	; 0x0
33f83098:	059d9008 	ldreq	r9, [sp, #8]
33f8309c:	ea000002 	b	33f830ac <.text+0x30ac>
33f830a0:	e3a09000 	mov	r9, #0	; 0x0
33f830a4:	ea000000 	b	33f830ac <.text+0x30ac>
33f830a8:	e3e09000 	mvn	r9, #0	; 0x0
33f830ac:	e1a00009 	mov	r0, r9
33f830b0:	e28dde35 	add	sp, sp, #848	; 0x350
33f830b4:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f830b8:	33f92580 	mvnccs	r2, #536870912	; 0x20000000
33f830bc:	33f92598 	mvnccs	r2, #637534208	; 0x26000000
33f830c0:	33f925b8 	mvnccs	r2, #771751936	; 0x2e000000
33f830c4:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000

33f830c8 <delete_char>:
33f830c8:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f830cc:	e1a07003 	mov	r7, r3
33f830d0:	e5933000 	ldr	r3, [r3]
33f830d4:	e3530000 	cmp	r3, #0	; 0x0
33f830d8:	e1a05000 	mov	r5, r0
33f830dc:	e1a06001 	mov	r6, r1
33f830e0:	e1a04002 	mov	r4, r2
33f830e4:	e59da018 	ldr	sl, [sp, #24]
33f830e8:	0a000029 	beq	33f83194 <delete_char+0xcc>
33f830ec:	e5763001 	ldrb	r3, [r6, #-1]!
33f830f0:	e3530009 	cmp	r3, #9	; 0x9
33f830f4:	1a00001e 	bne	33f83174 <delete_char+0xac>
33f830f8:	ea000003 	b	33f8310c <delete_char+0x44>
33f830fc:	eb0012c4 	bl	33f87c14 <puts>
33f83100:	e5943000 	ldr	r3, [r4]
33f83104:	e2433001 	sub	r3, r3, #1	; 0x1
33f83108:	e5843000 	str	r3, [r4]
33f8310c:	e5943000 	ldr	r3, [r4]
33f83110:	e153000a 	cmp	r3, sl
33f83114:	e59f0080 	ldr	r0, [pc, #128]	; 33f8319c <.text+0x319c>
33f83118:	cafffff7 	bgt	33f830fc <delete_char+0x34>
33f8311c:	ea000011 	b	33f83168 <delete_char+0xa0>
33f83120:	e5940000 	ldr	r0, [r4]
33f83124:	e5d53000 	ldrb	r3, [r5]
33f83128:	e59f2070 	ldr	r2, [pc, #112]	; 33f831a0 <.text+0x31a0>
33f8312c:	e2801001 	add	r1, r0, #1	; 0x1
33f83130:	e3530009 	cmp	r3, #9	; 0x9
33f83134:	e2000007 	and	r0, r0, #7	; 0x7
33f83138:	e0800002 	add	r0, r0, r2
33f8313c:	1a000005 	bne	33f83158 <delete_char+0x90>
33f83140:	eb0012b3 	bl	33f87c14 <puts>
33f83144:	e5943000 	ldr	r3, [r4]
33f83148:	e3c33007 	bic	r3, r3, #7	; 0x7
33f8314c:	e2833008 	add	r3, r3, #8	; 0x8
33f83150:	e5843000 	str	r3, [r4]
33f83154:	ea000002 	b	33f83164 <delete_char+0x9c>
33f83158:	e5841000 	str	r1, [r4]
33f8315c:	e5d50000 	ldrb	r0, [r5]
33f83160:	eb001344 	bl	33f87e78 <putc>
33f83164:	e2855001 	add	r5, r5, #1	; 0x1
33f83168:	e1550006 	cmp	r5, r6
33f8316c:	3affffeb 	bcc	33f83120 <delete_char+0x58>
33f83170:	ea000004 	b	33f83188 <delete_char+0xc0>
33f83174:	e59f0020 	ldr	r0, [pc, #32]	; 33f8319c <.text+0x319c>
33f83178:	eb0012a5 	bl	33f87c14 <puts>
33f8317c:	e5943000 	ldr	r3, [r4]
33f83180:	e2433001 	sub	r3, r3, #1	; 0x1
33f83184:	e5843000 	str	r3, [r4]
33f83188:	e5973000 	ldr	r3, [r7]
33f8318c:	e2433001 	sub	r3, r3, #1	; 0x1
33f83190:	e5873000 	str	r3, [r7]
33f83194:	e1a00006 	mov	r0, r6
33f83198:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f8319c:	33f956c4 	mvnccs	r5, #205520896	; 0xc400000
33f831a0:	33f956c8 	mvnccs	r5, #209715200	; 0xc800000

33f831a4 <readline>:
33f831a4:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f831a8:	e3a03000 	mov	r3, #0	; 0x0
33f831ac:	e24dd00c 	sub	sp, sp, #12	; 0xc
33f831b0:	e2504000 	subs	r4, r0, #0	; 0x0
33f831b4:	e58d3008 	str	r3, [sp, #8]
33f831b8:	01a06004 	moveq	r6, r4
33f831bc:	0a000003 	beq	33f831d0 <readline+0x2c>
33f831c0:	eb001da9 	bl	33f8a86c <strlen>
33f831c4:	e1a06000 	mov	r6, r0
33f831c8:	e1a00004 	mov	r0, r4
33f831cc:	eb001290 	bl	33f87c14 <puts>
33f831d0:	e58d6004 	str	r6, [sp, #4]
33f831d4:	e59f5190 	ldr	r5, [pc, #400]	; 33f8336c <.text+0x336c>
33f831d8:	eb001336 	bl	33f87eb8 <getc>
33f831dc:	e20040ff 	and	r4, r0, #255	; 0xff
33f831e0:	e354000a 	cmp	r4, #10	; 0xa
33f831e4:	0a000012 	beq	33f83234 <readline+0x90>
33f831e8:	8a000006 	bhi	33f83208 <readline+0x64>
33f831ec:	e3540003 	cmp	r4, #3	; 0x3
33f831f0:	0a000016 	beq	33f83250 <readline+0xac>
33f831f4:	e3540008 	cmp	r4, #8	; 0x8
33f831f8:	0a000036 	beq	33f832d8 <readline+0x134>
33f831fc:	e3540000 	cmp	r4, #0	; 0x0
33f83200:	0afffff4 	beq	33f831d8 <readline+0x34>
33f83204:	ea00003b 	b	33f832f8 <readline+0x154>
33f83208:	e3540015 	cmp	r4, #21	; 0x15
33f8320c:	0a000018 	beq	33f83274 <readline+0xd0>
33f83210:	8a000002 	bhi	33f83220 <readline+0x7c>
33f83214:	e354000d 	cmp	r4, #13	; 0xd
33f83218:	1a000036 	bne	33f832f8 <readline+0x154>
33f8321c:	ea000004 	b	33f83234 <readline+0x90>
33f83220:	e3540017 	cmp	r4, #23	; 0x17
33f83224:	0a000019 	beq	33f83290 <readline+0xec>
33f83228:	e354007f 	cmp	r4, #127	; 0x7f
33f8322c:	1a000031 	bne	33f832f8 <readline+0x154>
33f83230:	ea000028 	b	33f832d8 <readline+0x134>
33f83234:	e3a03000 	mov	r3, #0	; 0x0
33f83238:	e5c53000 	strb	r3, [r5]
33f8323c:	e59f012c 	ldr	r0, [pc, #300]	; 33f83370 <.text+0x3370>
33f83240:	eb001273 	bl	33f87c14 <puts>
33f83244:	e59f3120 	ldr	r3, [pc, #288]	; 33f8336c <.text+0x336c>
33f83248:	e0630005 	rsb	r0, r3, r5
33f8324c:	ea000044 	b	33f83364 <readline+0x1c0>
33f83250:	e59f3114 	ldr	r3, [pc, #276]	; 33f8336c <.text+0x336c>
33f83254:	e3a02000 	mov	r2, #0	; 0x0
33f83258:	e3e00000 	mvn	r0, #0	; 0x0
33f8325c:	e5c32000 	strb	r2, [r3]
33f83260:	ea00003f 	b	33f83364 <readline+0x1c0>
33f83264:	eb00126a 	bl	33f87c14 <puts>
33f83268:	e59d3004 	ldr	r3, [sp, #4]
33f8326c:	e2433001 	sub	r3, r3, #1	; 0x1
33f83270:	e58d3004 	str	r3, [sp, #4]
33f83274:	e59d3004 	ldr	r3, [sp, #4]
33f83278:	e1530006 	cmp	r3, r6
33f8327c:	e59f00f0 	ldr	r0, [pc, #240]	; 33f83374 <.text+0x3374>
33f83280:	cafffff7 	bgt	33f83264 <readline+0xc0>
33f83284:	e59f50e0 	ldr	r5, [pc, #224]	; 33f8336c <.text+0x336c>
33f83288:	e3a03000 	mov	r3, #0	; 0x0
33f8328c:	ea00002f 	b	33f83350 <readline+0x1ac>
33f83290:	e59f00d4 	ldr	r0, [pc, #212]	; 33f8336c <.text+0x336c>
33f83294:	e1a01005 	mov	r1, r5
33f83298:	e28d2004 	add	r2, sp, #4	; 0x4
33f8329c:	e28d3008 	add	r3, sp, #8	; 0x8
33f832a0:	e58d6000 	str	r6, [sp]
33f832a4:	ebffff87 	bl	33f830c8 <delete_char>
33f832a8:	e59dc008 	ldr	ip, [sp, #8]
33f832ac:	e35c0000 	cmp	ip, #0	; 0x0
33f832b0:	e1a05000 	mov	r5, r0
33f832b4:	e1a01000 	mov	r1, r0
33f832b8:	e28d2004 	add	r2, sp, #4	; 0x4
33f832bc:	e59f00a8 	ldr	r0, [pc, #168]	; 33f8336c <.text+0x336c>
33f832c0:	e28d3008 	add	r3, sp, #8	; 0x8
33f832c4:	daffffc3 	ble	33f831d8 <readline+0x34>
33f832c8:	e5d5c000 	ldrb	ip, [r5]
33f832cc:	e35c0020 	cmp	ip, #32	; 0x20
33f832d0:	1afffff2 	bne	33f832a0 <readline+0xfc>
33f832d4:	eaffffbf 	b	33f831d8 <readline+0x34>
33f832d8:	e1a01005 	mov	r1, r5
33f832dc:	e59f0088 	ldr	r0, [pc, #136]	; 33f8336c <.text+0x336c>
33f832e0:	e28d2004 	add	r2, sp, #4	; 0x4
33f832e4:	e28d3008 	add	r3, sp, #8	; 0x8
33f832e8:	e58d6000 	str	r6, [sp]
33f832ec:	ebffff75 	bl	33f830c8 <delete_char>
33f832f0:	e1a05000 	mov	r5, r0
33f832f4:	eaffffb7 	b	33f831d8 <readline+0x34>
33f832f8:	e59d3008 	ldr	r3, [sp, #8]
33f832fc:	e35300fd 	cmp	r3, #253	; 0xfd
33f83300:	ca000014 	bgt	33f83358 <readline+0x1b4>
33f83304:	e3540009 	cmp	r4, #9	; 0x9
33f83308:	e59d3004 	ldr	r3, [sp, #4]
33f8330c:	1a000008 	bne	33f83334 <readline+0x190>
33f83310:	e59f0060 	ldr	r0, [pc, #96]	; 33f83378 <.text+0x3378>
33f83314:	e2033007 	and	r3, r3, #7	; 0x7
33f83318:	e0830000 	add	r0, r3, r0
33f8331c:	eb00123c 	bl	33f87c14 <puts>
33f83320:	e59d3004 	ldr	r3, [sp, #4]
33f83324:	e3c33007 	bic	r3, r3, #7	; 0x7
33f83328:	e2833008 	add	r3, r3, #8	; 0x8
33f8332c:	e58d3004 	str	r3, [sp, #4]
33f83330:	ea000003 	b	33f83344 <readline+0x1a0>
33f83334:	e2833001 	add	r3, r3, #1	; 0x1
33f83338:	e1a00004 	mov	r0, r4
33f8333c:	e58d3004 	str	r3, [sp, #4]
33f83340:	eb0012cc 	bl	33f87e78 <putc>
33f83344:	e4c54001 	strb	r4, [r5], #1
33f83348:	e59d3008 	ldr	r3, [sp, #8]
33f8334c:	e2833001 	add	r3, r3, #1	; 0x1
33f83350:	e58d3008 	str	r3, [sp, #8]
33f83354:	eaffff9f 	b	33f831d8 <readline+0x34>
33f83358:	e3a00007 	mov	r0, #7	; 0x7
33f8335c:	eb0012c5 	bl	33f87e78 <putc>
33f83360:	eaffff9c 	b	33f831d8 <readline+0x34>
33f83364:	e28dd00c 	add	sp, sp, #12	; 0xc
33f83368:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8336c:	33f962bc 	mvnccs	r6, #-1073741813	; 0xc000000b
33f83370:	33f925e8 	mvnccs	r2, #973078528	; 0x3a000000
33f83374:	33f956c4 	mvnccs	r5, #205520896	; 0xc400000
33f83378:	33f956c8 	mvnccs	r5, #209715200	; 0xc800000

33f8337c <main_loop>:
33f8337c:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f83380:	e59f0138 	ldr	r0, [pc, #312]	; 33f834c0 <.text+0x34c0>
33f83384:	eb000f02 	bl	33f86f94 <getenv>
33f83388:	e3500000 	cmp	r0, #0	; 0x0
33f8338c:	03a06019 	moveq	r6, #25	; 0x19
33f83390:	0a000003 	beq	33f833a4 <main_loop+0x28>
33f83394:	e3a01000 	mov	r1, #0	; 0x0
33f83398:	e3a0200a 	mov	r2, #10	; 0xa
33f8339c:	eb001e5d 	bl	33f8ad18 <simple_strtol>
33f833a0:	e1a06000 	mov	r6, r0
33f833a4:	e59f0118 	ldr	r0, [pc, #280]	; 33f834c4 <.text+0x34c4>
33f833a8:	eb000ef9 	bl	33f86f94 <getenv>
33f833ac:	e1e03006 	mvn	r3, r6
33f833b0:	e1a03fa3 	mov	r3, r3, lsr #31
33f833b4:	e3500000 	cmp	r0, #0	; 0x0
33f833b8:	03a03000 	moveq	r3, #0	; 0x0
33f833bc:	e3530000 	cmp	r3, #0	; 0x0
33f833c0:	e1a07000 	mov	r7, r0
33f833c4:	0a000024 	beq	33f8345c <main_loop+0xe0>
33f833c8:	e59f00f8 	ldr	r0, [pc, #248]	; 33f834c8 <.text+0x34c8>
33f833cc:	e1a01006 	mov	r1, r6
33f833d0:	eb001222 	bl	33f87c60 <printf>
33f833d4:	e3a0a000 	mov	sl, #0	; 0x0
33f833d8:	ea000012 	b	33f83428 <main_loop+0xac>
33f833dc:	eb0012b5 	bl	33f87eb8 <getc>
33f833e0:	e3a06000 	mov	r6, #0	; 0x0
33f833e4:	e3a0a001 	mov	sl, #1	; 0x1
33f833e8:	ea00000b 	b	33f8341c <main_loop+0xa0>
33f833ec:	eb0012ab 	bl	33f87ea0 <tstc>
33f833f0:	e3500000 	cmp	r0, #0	; 0x0
33f833f4:	e59f00d0 	ldr	r0, [pc, #208]	; 33f834cc <.text+0x34cc>
33f833f8:	1afffff7 	bne	33f833dc <main_loop+0x60>
33f833fc:	ebfff527 	bl	33f808a0 <udelay>
33f83400:	e3540063 	cmp	r4, #99	; 0x63
33f83404:	c3a03000 	movgt	r3, #0	; 0x0
33f83408:	d2053001 	andle	r3, r5, #1	; 0x1
33f8340c:	e3530000 	cmp	r3, #0	; 0x0
33f83410:	e2844001 	add	r4, r4, #1	; 0x1
33f83414:	1afffff4 	bne	33f833ec <main_loop+0x70>
33f83418:	e2466001 	sub	r6, r6, #1	; 0x1
33f8341c:	e59f00ac 	ldr	r0, [pc, #172]	; 33f834d0 <.text+0x34d0>
33f83420:	e1a01006 	mov	r1, r6
33f83424:	eb00120d 	bl	33f87c60 <printf>
33f83428:	e22a5001 	eor	r5, sl, #1	; 0x1
33f8342c:	e3560000 	cmp	r6, #0	; 0x0
33f83430:	d3a04000 	movle	r4, #0	; 0x0
33f83434:	c2054001 	andgt	r4, r5, #1	; 0x1
33f83438:	e3540000 	cmp	r4, #0	; 0x0
33f8343c:	13a04000 	movne	r4, #0	; 0x0
33f83440:	1affffee 	bne	33f83400 <main_loop+0x84>
33f83444:	e3a0000a 	mov	r0, #10	; 0xa
33f83448:	eb00128a 	bl	33f87e78 <putc>
33f8344c:	e3550000 	cmp	r5, #0	; 0x0
33f83450:	11a00007 	movne	r0, r7
33f83454:	11a01004 	movne	r1, r4
33f83458:	1bfffe24 	blne	33f82cf0 <run_command>
33f8345c:	e3a04001 	mov	r4, #1	; 0x1
33f83460:	e59f006c 	ldr	r0, [pc, #108]	; 33f834d4 <.text+0x34d4>
33f83464:	ebffff4e 	bl	33f831a4 <readline>
33f83468:	e2503000 	subs	r3, r0, #0	; 0x0
33f8346c:	e59f1064 	ldr	r1, [pc, #100]	; 33f834d8 <.text+0x34d8>
33f83470:	e59f0064 	ldr	r0, [pc, #100]	; 33f834dc <.text+0x34dc>
33f83474:	da000001 	ble	33f83480 <main_loop+0x104>
33f83478:	eb001ca6 	bl	33f8a718 <strcpy>
33f8347c:	ea000006 	b	33f8349c <main_loop+0x120>
33f83480:	e3a01001 	mov	r1, #1	; 0x1
33f83484:	0a000005 	beq	33f834a0 <main_loop+0x124>
33f83488:	e3730001 	cmn	r3, #1	; 0x1
33f8348c:	e59f004c 	ldr	r0, [pc, #76]	; 33f834e0 <.text+0x34e0>
33f83490:	1a000001 	bne	33f8349c <main_loop+0x120>
33f83494:	eb0011de 	bl	33f87c14 <puts>
33f83498:	ea000003 	b	33f834ac <main_loop+0x130>
33f8349c:	e3a01000 	mov	r1, #0	; 0x0
33f834a0:	e59f0034 	ldr	r0, [pc, #52]	; 33f834dc <.text+0x34dc>
33f834a4:	ebfffe11 	bl	33f82cf0 <run_command>
33f834a8:	e1a04000 	mov	r4, r0
33f834ac:	e3540000 	cmp	r4, #0	; 0x0
33f834b0:	d59f3024 	ldrle	r3, [pc, #36]	; 33f834dc <.text+0x34dc>
33f834b4:	d3a02000 	movle	r2, #0	; 0x0
33f834b8:	d5c32000 	strleb	r2, [r3]
33f834bc:	eaffffe7 	b	33f83460 <main_loop+0xe4>
33f834c0:	33f925ec 	mvnccs	r2, #989855744	; 0x3b000000
33f834c4:	33f925f8 	mvnccs	r2, #1040187392	; 0x3e000000
33f834c8:	33f92600 	mvnccs	r2, #0	; 0x0
33f834cc:	00002710 	andeq	r2, r0, r0, lsl r7
33f834d0:	33f92624 	mvnccs	r2, #37748736	; 0x2400000
33f834d4:	33f9262c 	mvnccs	r2, #46137344	; 0x2c00000
33f834d8:	33f962bc 	mvnccs	r6, #-1073741813	; 0xc000000b
33f834dc:	33f963bc 	mvnccs	r6, #-268435454	; 0xf0000002
33f834e0:	33f92638 	mvnccs	r2, #58720256	; 0x3800000

33f834e4 <__fswab32>:
33f834e4:	e1a02000 	mov	r2, r0
33f834e8:	e2003cff 	and	r3, r0, #65280	; 0xff00
33f834ec:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
33f834f0:	e1a03403 	mov	r3, r3, lsl #8
33f834f4:	e1a00420 	mov	r0, r0, lsr #8
33f834f8:	e1800c22 	orr	r0, r0, r2, lsr #24
33f834fc:	e1833c02 	orr	r3, r3, r2, lsl #24
33f83500:	e1830000 	orr	r0, r3, r0
33f83504:	e1a0f00e 	mov	pc, lr

33f83508 <autoscript>:
33f83508:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f8350c:	e1a0a000 	mov	sl, r0
33f83510:	e59f018c 	ldr	r0, [pc, #396]	; 33f836a4 <.text+0x36a4>
33f83514:	eb000e9e 	bl	33f86f94 <getenv>
33f83518:	e3500000 	cmp	r0, #0	; 0x0
33f8351c:	03a07001 	moveq	r7, #1	; 0x1
33f83520:	0a000002 	beq	33f83530 <autoscript+0x28>
33f83524:	e5d03000 	ldrb	r3, [r0]
33f83528:	e253706e 	subs	r7, r3, #110	; 0x6e
33f8352c:	13a07001 	movne	r7, #1	; 0x1
33f83530:	e59f5170 	ldr	r5, [pc, #368]	; 33f836a8 <.text+0x36a8>
33f83534:	e1a0100a 	mov	r1, sl
33f83538:	e3a02040 	mov	r2, #64	; 0x40
33f8353c:	e1a00005 	mov	r0, r5
33f83540:	eb001d64 	bl	33f8aad8 <memmove>
33f83544:	e5950000 	ldr	r0, [r5]
33f83548:	ebffffe5 	bl	33f834e4 <__fswab32>
33f8354c:	e59f3158 	ldr	r3, [pc, #344]	; 33f836ac <.text+0x36ac>
33f83550:	e1500003 	cmp	r0, r3
33f83554:	159f0154 	ldrne	r0, [pc, #340]	; 33f836b0 <.text+0x36b0>
33f83558:	1a00000b 	bne	33f8358c <autoscript+0x84>
33f8355c:	e5950004 	ldr	r0, [r5, #4]
33f83560:	ebffffdf 	bl	33f834e4 <__fswab32>
33f83564:	e3a06000 	mov	r6, #0	; 0x0
33f83568:	e1a04000 	mov	r4, r0
33f8356c:	e1a01005 	mov	r1, r5
33f83570:	e1a00006 	mov	r0, r6
33f83574:	e3a02040 	mov	r2, #64	; 0x40
33f83578:	e5856004 	str	r6, [r5, #4]
33f8357c:	eb001bf9 	bl	33f8a568 <crc32>
33f83580:	e1500004 	cmp	r0, r4
33f83584:	0a000003 	beq	33f83598 <autoscript+0x90>
33f83588:	e59f0124 	ldr	r0, [pc, #292]	; 33f836b4 <.text+0x36b4>
33f8358c:	eb0011a0 	bl	33f87c14 <puts>
33f83590:	e3a04001 	mov	r4, #1	; 0x1
33f83594:	ea000040 	b	33f8369c <autoscript+0x194>
33f83598:	e595000c 	ldr	r0, [r5, #12]
33f8359c:	ebffffd0 	bl	33f834e4 <__fswab32>
33f835a0:	e3570000 	cmp	r7, #0	; 0x0
33f835a4:	e28a7040 	add	r7, sl, #64	; 0x40
33f835a8:	0a000009 	beq	33f835d4 <autoscript+0xcc>
33f835ac:	e1a02000 	mov	r2, r0
33f835b0:	e1a01007 	mov	r1, r7
33f835b4:	e1a00006 	mov	r0, r6
33f835b8:	eb001bea 	bl	33f8a568 <crc32>
33f835bc:	e1a04000 	mov	r4, r0
33f835c0:	e5950018 	ldr	r0, [r5, #24]
33f835c4:	ebffffc6 	bl	33f834e4 <__fswab32>
33f835c8:	e1540000 	cmp	r4, r0
33f835cc:	159f00e4 	ldrne	r0, [pc, #228]	; 33f836b8 <.text+0x36b8>
33f835d0:	1affffed 	bne	33f8358c <autoscript+0x84>
33f835d4:	e59f30cc 	ldr	r3, [pc, #204]	; 33f836a8 <.text+0x36a8>
33f835d8:	e5d3301e 	ldrb	r3, [r3, #30]
33f835dc:	e3530006 	cmp	r3, #6	; 0x6
33f835e0:	159f00d4 	ldrne	r0, [pc, #212]	; 33f836bc <.text+0x36bc>
33f835e4:	1affffe8 	bne	33f8358c <autoscript+0x84>
33f835e8:	e5970000 	ldr	r0, [r7]
33f835ec:	ebffffbc 	bl	33f834e4 <__fswab32>
33f835f0:	e2505000 	subs	r5, r0, #0	; 0x0
33f835f4:	059f00c4 	ldreq	r0, [pc, #196]	; 33f836c0 <.text+0x36c0>
33f835f8:	0affffe3 	beq	33f8358c <autoscript+0x84>
33f835fc:	e2850001 	add	r0, r5, #1	; 0x1
33f83600:	eb001388 	bl	33f88428 <malloc>
33f83604:	e2506000 	subs	r6, r0, #0	; 0x0
33f83608:	11a0000a 	movne	r0, sl
33f8360c:	1a000002 	bne	33f8361c <autoscript+0x114>
33f83610:	eaffffde 	b	33f83590 <autoscript+0x88>
33f83614:	e3a04001 	mov	r4, #1	; 0x1
33f83618:	ea00001d 	b	33f83694 <autoscript+0x18c>
33f8361c:	e5907040 	ldr	r7, [r0, #64]
33f83620:	e3570000 	cmp	r7, #0	; 0x0
33f83624:	e2800004 	add	r0, r0, #4	; 0x4
33f83628:	1afffffb 	bne	33f8361c <autoscript+0x114>
33f8362c:	e2801040 	add	r1, r0, #64	; 0x40
33f83630:	e1a02005 	mov	r2, r5
33f83634:	e1a00006 	mov	r0, r6
33f83638:	eb001d26 	bl	33f8aad8 <memmove>
33f8363c:	e1a04006 	mov	r4, r6
33f83640:	e1a03006 	mov	r3, r6
33f83644:	e7c67005 	strb	r7, [r6, r5]
33f83648:	ea00000b 	b	33f8367c <autoscript+0x174>
33f8364c:	e350000a 	cmp	r0, #10	; 0xa
33f83650:	1a000008 	bne	33f83678 <autoscript+0x170>
33f83654:	e3520001 	cmp	r2, #1	; 0x1
33f83658:	e1a00003 	mov	r0, r3
33f8365c:	e1a0100c 	mov	r1, ip
33f83660:	e5c4c000 	strb	ip, [r4]
33f83664:	da000002 	ble	33f83674 <autoscript+0x16c>
33f83668:	ebfffda0 	bl	33f82cf0 <run_command>
33f8366c:	e3500000 	cmp	r0, #0	; 0x0
33f83670:	baffffe7 	blt	33f83614 <autoscript+0x10c>
33f83674:	e2843001 	add	r3, r4, #1	; 0x1
33f83678:	e2844001 	add	r4, r4, #1	; 0x1
33f8367c:	e5d40000 	ldrb	r0, [r4]
33f83680:	e3500000 	cmp	r0, #0	; 0x0
33f83684:	e0632004 	rsb	r2, r3, r4
33f83688:	e3a0c000 	mov	ip, #0	; 0x0
33f8368c:	1affffee 	bne	33f8364c <autoscript+0x144>
33f83690:	e1a04000 	mov	r4, r0
33f83694:	e1a00006 	mov	r0, r6
33f83698:	eb0012cf 	bl	33f881dc <free>
33f8369c:	e1a00004 	mov	r0, r4
33f836a0:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f836a4:	33f92648 	mvnccs	r2, #75497472	; 0x4800000
33f836a8:	33f964bc 	mvnccs	r6, #-1140850688	; 0xbc000000
33f836ac:	27051956 	smlsdcs	r5, r6, r9, r1
33f836b0:	33f92650 	mvnccs	r2, #83886080	; 0x5000000
33f836b4:	33f92664 	mvnccs	r2, #104857600	; 0x6400000
33f836b8:	33f92674 	mvnccs	r2, #121634816	; 0x7400000
33f836bc:	33f92684 	mvnccs	r2, #138412032	; 0x8400000
33f836c0:	33f92694 	mvnccs	r2, #155189248	; 0x9400000

33f836c4 <do_autoscript>:
33f836c4:	e3520001 	cmp	r2, #1	; 0x1
33f836c8:	e92d4010 	stmdb	sp!, {r4, lr}
33f836cc:	e3a01000 	mov	r1, #0	; 0x0
33f836d0:	e59f4028 	ldr	r4, [pc, #40]	; 33f83700 <.text+0x3700>
33f836d4:	e3a02010 	mov	r2, #16	; 0x10
33f836d8:	da000002 	ble	33f836e8 <do_autoscript+0x24>
33f836dc:	e5930004 	ldr	r0, [r3, #4]
33f836e0:	eb001d58 	bl	33f8ac48 <simple_strtoul>
33f836e4:	e1a04000 	mov	r4, r0
33f836e8:	e59f0014 	ldr	r0, [pc, #20]	; 33f83704 <.text+0x3704>
33f836ec:	e1a01004 	mov	r1, r4
33f836f0:	eb00115a 	bl	33f87c60 <printf>
33f836f4:	e1a00004 	mov	r0, r4
33f836f8:	e8bd4010 	ldmia	sp!, {r4, lr}
33f836fc:	eaffff81 	b	33f83508 <autoscript>
33f83700:	30008000 	andcc	r8, r0, r0
33f83704:	33f926a4 	mvnccs	r2, #171966464	; 0xa400000

33f83708 <print_num>:
33f83708:	e1a02001 	mov	r2, r1
33f8370c:	e1a01000 	mov	r1, r0
33f83710:	e59f0000 	ldr	r0, [pc, #0]	; 33f83718 <.text+0x3718>
33f83714:	ea001151 	b	33f87c60 <printf>
33f83718:	33f92740 	mvnccs	r2, #16777216	; 0x1000000

33f8371c <do_bdinfo>:
33f8371c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f83720:	e5985000 	ldr	r5, [r8]
33f83724:	e59f00c0 	ldr	r0, [pc, #192]	; 33f837ec <.text+0x37ec>
33f83728:	e5951014 	ldr	r1, [r5, #20]
33f8372c:	ebfffff5 	bl	33f83708 <print_num>
33f83730:	e59f00b8 	ldr	r0, [pc, #184]	; 33f837f0 <.text+0x37f0>
33f83734:	e5951010 	ldr	r1, [r5, #16]
33f83738:	ebfffff2 	bl	33f83708 <print_num>
33f8373c:	e59f00b0 	ldr	r0, [pc, #176]	; 33f837f4 <.text+0x37f4>
33f83740:	e5951018 	ldr	r1, [r5, #24]
33f83744:	ebffffef 	bl	33f83708 <print_num>
33f83748:	e59f00a8 	ldr	r0, [pc, #168]	; 33f837f8 <.text+0x37f8>
33f8374c:	e3a01000 	mov	r1, #0	; 0x0
33f83750:	ebffffec 	bl	33f83708 <print_num>
33f83754:	e59f00a0 	ldr	r0, [pc, #160]	; 33f837fc <.text+0x37fc>
33f83758:	e595101c 	ldr	r1, [r5, #28]
33f8375c:	ebffffe9 	bl	33f83708 <print_num>
33f83760:	e59f0098 	ldr	r0, [pc, #152]	; 33f83800 <.text+0x3800>
33f83764:	e5951020 	ldr	r1, [r5, #32]
33f83768:	ebffffe6 	bl	33f83708 <print_num>
33f8376c:	e59f0090 	ldr	r0, [pc, #144]	; 33f83804 <.text+0x3804>
33f83770:	eb001127 	bl	33f87c14 <puts>
33f83774:	e3a06000 	mov	r6, #0	; 0x0
33f83778:	ea00000b 	b	33f837ac <do_bdinfo+0x90>
33f8377c:	e3540000 	cmp	r4, #0	; 0x0
33f83780:	e0843005 	add	r3, r4, r5
33f83784:	e59f007c 	ldr	r0, [pc, #124]	; 33f83808 <.text+0x3808>
33f83788:	e3a0103a 	mov	r1, #58	; 0x3a
33f8378c:	0a000005 	beq	33f837a8 <do_bdinfo+0x8c>
33f83790:	e5d32008 	ldrb	r2, [r3, #8]
33f83794:	e2844001 	add	r4, r4, #1	; 0x1
33f83798:	eb001130 	bl	33f87c60 <printf>
33f8379c:	e3540005 	cmp	r4, #5	; 0x5
33f837a0:	ca000008 	bgt	33f837c8 <do_bdinfo+0xac>
33f837a4:	eafffff4 	b	33f8377c <do_bdinfo+0x60>
33f837a8:	e1a06004 	mov	r6, r4
33f837ac:	e0863005 	add	r3, r6, r5
33f837b0:	e5d32008 	ldrb	r2, [r3, #8]
33f837b4:	e59f004c 	ldr	r0, [pc, #76]	; 33f83808 <.text+0x3808>
33f837b8:	e3a01020 	mov	r1, #32	; 0x20
33f837bc:	eb001127 	bl	33f87c60 <printf>
33f837c0:	e2864001 	add	r4, r6, #1	; 0x1
33f837c4:	eaffffec 	b	33f8377c <do_bdinfo+0x60>
33f837c8:	e59f003c 	ldr	r0, [pc, #60]	; 33f8380c <.text+0x380c>
33f837cc:	eb001110 	bl	33f87c14 <puts>
33f837d0:	e5950004 	ldr	r0, [r5, #4]
33f837d4:	ebfff647 	bl	33f810f8 <print_IPaddr>
33f837d8:	e5951000 	ldr	r1, [r5]
33f837dc:	e59f002c 	ldr	r0, [pc, #44]	; 33f83810 <.text+0x3810>
33f837e0:	eb00111e 	bl	33f87c60 <printf>
33f837e4:	e3a00000 	mov	r0, #0	; 0x0
33f837e8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f837ec:	33f92750 	mvnccs	r2, #20971520	; 0x1400000
33f837f0:	33f9275c 	mvnccs	r2, #24117248	; 0x1700000
33f837f4:	33f92764 	mvnccs	r2, #26214400	; 0x1900000
33f837f8:	33f92770 	mvnccs	r2, #29360128	; 0x1c00000
33f837fc:	33f9277c 	mvnccs	r2, #32505856	; 0x1f00000
33f83800:	33f92788 	mvnccs	r2, #35651584	; 0x2200000
33f83804:	33f92790 	mvnccs	r2, #37748736	; 0x2400000
33f83808:	33f927a0 	mvnccs	r2, #41943040	; 0x2800000
33f8380c:	33f927a8 	mvnccs	r2, #44040192	; 0x2a00000
33f83810:	33f927b8 	mvnccs	r2, #48234496	; 0x2e00000

33f83814 <call_linux>:
33f83814:	e3a01000 	mov	r1, #0	; 0x0
33f83818:	e3a010e0 	mov	r1, #224	; 0xe0
33f8381c:	e381333f 	orr	r3, r1, #-67108864	; 0xfc000000
33f83820:	ee073f5e 	mcr	15, 0, r3, cr7, cr14, {2}
33f83824:	e2533301 	subs	r3, r3, #67108864	; 0x4000000
33f83828:	2afffffc 	bcs	33f83820 <call_linux+0xc>
33f8382c:	e2511020 	subs	r1, r1, #32	; 0x20
33f83830:	2afffff9 	bcs	33f8381c <call_linux+0x8>
33f83834:	ee071f15 	mcr	15, 0, r1, cr7, cr5, {0}
33f83838:	ee071f9a 	mcr	15, 0, r1, cr7, cr10, {4}
33f8383c:	e3a00000 	mov	r0, #0	; 0x0
33f83840:	ee070f9a 	mcr	15, 0, r0, cr7, cr10, {4}
33f83844:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
33f83848:	e1a00000 	nop			(mov r0,r0)
33f8384c:	e59f1190 	ldr	r1, [pc, #400]	; 33f839e4 <.text+0x39e4>
33f83850:	e1a02002 	mov	r2, r2
33f83854:	e3a0c000 	mov	ip, #0	; 0x0
33f83858:	ee0dcf10 	mcr	15, 0, ip, cr13, cr0, {0}
33f8385c:	ee07cf17 	mcr	15, 0, ip, cr7, cr7, {0}
33f83860:	ee07cf9a 	mcr	15, 0, ip, cr7, cr10, {4}
33f83864:	ee08cf17 	mcr	15, 0, ip, cr8, cr7, {0}
33f83868:	ee11cf10 	mrc	15, 0, ip, cr1, cr0, {0}
33f8386c:	e3ccc001 	bic	ip, ip, #1	; 0x1
33f83870:	ee01cf10 	mcr	15, 0, ip, cr1, cr0, {0}
33f83874:	e1a0f002 	mov	pc, r2
33f83878:	e1a00000 	nop			(mov r0,r0)
33f8387c:	e1a00000 	nop			(mov r0,r0)
33f83880:	e1a0f00e 	mov	pc, lr

33f83884 <do_go>:
33f83884:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f83888:	e1a07002 	mov	r7, r2
33f8388c:	e1a0c000 	mov	ip, r0
33f83890:	e3570001 	cmp	r7, #1	; 0x1
33f83894:	e3a01000 	mov	r1, #0	; 0x0
33f83898:	e59f6120 	ldr	r6, [pc, #288]	; 33f839c0 <.text+0x39c0>
33f8389c:	e3a02010 	mov	r2, #16	; 0x10
33f838a0:	e3a04001 	mov	r4, #1	; 0x1
33f838a4:	e283a004 	add	sl, r3, #4	; 0x4
33f838a8:	e59f0114 	ldr	r0, [pc, #276]	; 33f839c4 <.text+0x39c4>
33f838ac:	d59c1010 	ldrle	r1, [ip, #16]
33f838b0:	da00003f 	ble	33f839b4 <do_go+0x130>
33f838b4:	e5930004 	ldr	r0, [r3, #4]
33f838b8:	eb001ce2 	bl	33f8ac48 <simple_strtoul>
33f838bc:	e1a01000 	mov	r1, r0
33f838c0:	e1a05000 	mov	r5, r0
33f838c4:	e59f00fc 	ldr	r0, [pc, #252]	; 33f839c8 <.text+0x39c8>
33f838c8:	eb0010e4 	bl	33f87c60 <printf>
33f838cc:	e59f00f8 	ldr	r0, [pc, #248]	; 33f839cc <.text+0x39cc>
33f838d0:	eb000daf 	bl	33f86f94 <getenv>
33f838d4:	e3a01000 	mov	r1, #0	; 0x0
33f838d8:	e1a04000 	mov	r4, r0
33f838dc:	e3a02c09 	mov	r2, #2304	; 0x900
33f838e0:	e1a00006 	mov	r0, r6
33f838e4:	eb001c61 	bl	33f8aa70 <memset>
33f838e8:	e3a03901 	mov	r3, #16384	; 0x4000
33f838ec:	e5863004 	str	r3, [r6, #4]
33f838f0:	e2433a03 	sub	r3, r3, #12288	; 0x3000
33f838f4:	e5863000 	str	r3, [r6]
33f838f8:	e1a00004 	mov	r0, r4
33f838fc:	eb001bda 	bl	33f8a86c <strlen>
33f83900:	e1a01004 	mov	r1, r4
33f83904:	e2802001 	add	r2, r0, #1	; 0x1
33f83908:	e59f00c0 	ldr	r0, [pc, #192]	; 33f839d0 <.text+0x39d0>
33f8390c:	eb001c69 	bl	33f8aab8 <memcpy>
33f83910:	e3a01000 	mov	r1, #0	; 0x0
33f83914:	e3a010e0 	mov	r1, #224	; 0xe0
33f83918:	e381333f 	orr	r3, r1, #-67108864	; 0xfc000000
33f8391c:	ee073f5e 	mcr	15, 0, r3, cr7, cr14, {2}
33f83920:	e2533301 	subs	r3, r3, #67108864	; 0x4000000
33f83924:	2afffffc 	bcs	33f8391c <do_go+0x98>
33f83928:	e2511020 	subs	r1, r1, #32	; 0x20
33f8392c:	2afffff9 	bcs	33f83918 <do_go+0x94>
33f83930:	ee071f15 	mcr	15, 0, r1, cr7, cr5, {0}
33f83934:	ee071f9a 	mcr	15, 0, r1, cr7, cr10, {4}
33f83938:	e3a00000 	mov	r0, #0	; 0x0
33f8393c:	ee070f9a 	mcr	15, 0, r0, cr7, cr10, {4}
33f83940:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
33f83944:	e3a01000 	mov	r1, #0	; 0x0
33f83948:	e59f2084 	ldr	r2, [pc, #132]	; 33f839d4 <.text+0x39d4>
33f8394c:	e59f3084 	ldr	r3, [pc, #132]	; 33f839d8 <.text+0x39d8>
33f83950:	e1a00001 	mov	r0, r1
33f83954:	e59f1088 	ldr	r1, [pc, #136]	; 33f839e4 <.text+0x39e4>
33f83958:	e1a02003 	mov	r2, r3
33f8395c:	e3a0c000 	mov	ip, #0	; 0x0
33f83960:	ee0dcf10 	mcr	15, 0, ip, cr13, cr0, {0}
33f83964:	ee07cf17 	mcr	15, 0, ip, cr7, cr7, {0}
33f83968:	ee07cf9a 	mcr	15, 0, ip, cr7, cr10, {4}
33f8396c:	ee08cf17 	mcr	15, 0, ip, cr8, cr7, {0}
33f83970:	ee11cf10 	mrc	15, 0, ip, cr1, cr0, {0}
33f83974:	e3ccc001 	bic	ip, ip, #1	; 0x1
33f83978:	ee01cf10 	mcr	15, 0, ip, cr1, cr0, {0}
33f8397c:	e1a0f002 	mov	pc, r2
33f83980:	e1a00000 	nop			(mov r0,r0)
33f83984:	e1a00000 	nop			(mov r0,r0)
33f83988:	e59f004c 	ldr	r0, [pc, #76]	; 33f839dc <.text+0x39dc>
33f8398c:	eb0010b3 	bl	33f87c60 <printf>
33f83990:	e1a0100a 	mov	r1, sl
33f83994:	e2470001 	sub	r0, r7, #1	; 0x1
33f83998:	e1a0e00f 	mov	lr, pc
33f8399c:	e1a0f005 	mov	pc, r5
33f839a0:	e1a03000 	mov	r3, r0
33f839a4:	e1a01000 	mov	r1, r0
33f839a8:	e59f0030 	ldr	r0, [pc, #48]	; 33f839e0 <.text+0x39e0>
33f839ac:	e2534000 	subs	r4, r3, #0	; 0x0
33f839b0:	13a04001 	movne	r4, #1	; 0x1
33f839b4:	eb0010a9 	bl	33f87c60 <printf>
33f839b8:	e1a00004 	mov	r0, r4
33f839bc:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f839c0:	30000100 	andcc	r0, r0, r0, lsl #2
33f839c4:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f839c8:	33f92800 	mvnccs	r2, #0	; 0x0
33f839cc:	33f92828 	mvnccs	r2, #2621440	; 0x280000
33f839d0:	30000600 	andcc	r0, r0, r0, lsl #12
33f839d4:	0000016a 	andeq	r0, r0, sl, ror #2
33f839d8:	30008000 	andcc	r8, r0, r0
33f839dc:	33f92834 	mvnccs	r2, #3407872	; 0x340000
33f839e0:	33f92838 	mvnccs	r2, #3670016	; 0x380000
33f839e4:	0000016a 	andeq	r0, r0, sl, ror #2

33f839e8 <__fswab32>:
33f839e8:	e1a02000 	mov	r2, r0
33f839ec:	e2003cff 	and	r3, r0, #65280	; 0xff00
33f839f0:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
33f839f4:	e1a03403 	mov	r3, r3, lsl #8
33f839f8:	e1a00420 	mov	r0, r0, lsr #8
33f839fc:	e1800c22 	orr	r0, r0, r2, lsr #24
33f83a00:	e1833c02 	orr	r3, r3, r2, lsl #24
33f83a04:	e1830000 	orr	r0, r3, r0
33f83a08:	e1a0f00e 	mov	pc, lr

33f83a0c <gunzip>:
33f83a0c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f83a10:	e1a05002 	mov	r5, r2
33f83a14:	e5d22002 	ldrb	r2, [r2, #2]
33f83a18:	e3520008 	cmp	r2, #8	; 0x8
33f83a1c:	e1a0b001 	mov	fp, r1
33f83a20:	e24dd034 	sub	sp, sp, #52	; 0x34
33f83a24:	e1a09000 	mov	r9, r0
33f83a28:	e1a0a003 	mov	sl, r3
33f83a2c:	e5d51003 	ldrb	r1, [r5, #3]
33f83a30:	1a000001 	bne	33f83a3c <gunzip+0x30>
33f83a34:	e31100e0 	tst	r1, #224	; 0xe0
33f83a38:	0a000001 	beq	33f83a44 <gunzip+0x38>
33f83a3c:	e59f0108 	ldr	r0, [pc, #264]	; 33f83b4c <.text+0x3b4c>
33f83a40:	ea000019 	b	33f83aac <gunzip+0xa0>
33f83a44:	e3110004 	tst	r1, #4	; 0x4
33f83a48:	15d5300a 	ldrneb	r3, [r5, #10]
33f83a4c:	15d5200b 	ldrneb	r2, [r5, #11]
33f83a50:	1283300c 	addne	r3, r3, #12	; 0xc
33f83a54:	03a0400a 	moveq	r4, #10	; 0xa
33f83a58:	10834402 	addne	r4, r3, r2, lsl #8
33f83a5c:	e3110008 	tst	r1, #8	; 0x8
33f83a60:	0a000004 	beq	33f83a78 <gunzip+0x6c>
33f83a64:	e0852004 	add	r2, r5, r4
33f83a68:	e4d23001 	ldrb	r3, [r2], #1
33f83a6c:	e3530000 	cmp	r3, #0	; 0x0
33f83a70:	e2844001 	add	r4, r4, #1	; 0x1
33f83a74:	1afffffb 	bne	33f83a68 <gunzip+0x5c>
33f83a78:	e3110010 	tst	r1, #16	; 0x10
33f83a7c:	0a000004 	beq	33f83a94 <gunzip+0x88>
33f83a80:	e0852004 	add	r2, r5, r4
33f83a84:	e4d23001 	ldrb	r3, [r2], #1
33f83a88:	e3530000 	cmp	r3, #0	; 0x0
33f83a8c:	e2844001 	add	r4, r4, #1	; 0x1
33f83a90:	1afffffb 	bne	33f83a84 <gunzip+0x78>
33f83a94:	e3110002 	tst	r1, #2	; 0x2
33f83a98:	e59a3000 	ldr	r3, [sl]
33f83a9c:	12844002 	addne	r4, r4, #2	; 0x2
33f83aa0:	e1540003 	cmp	r4, r3
33f83aa4:	3a000003 	bcc	33f83ab8 <gunzip+0xac>
33f83aa8:	e59f00a0 	ldr	r0, [pc, #160]	; 33f83b50 <.text+0x3b50>
33f83aac:	eb001058 	bl	33f87c14 <puts>
33f83ab0:	e3e00000 	mvn	r0, #0	; 0x0
33f83ab4:	ea000022 	b	33f83b44 <gunzip+0x138>
33f83ab8:	e59f3094 	ldr	r3, [pc, #148]	; 33f83b54 <.text+0x3b54>
33f83abc:	e58d3020 	str	r3, [sp, #32]
33f83ac0:	e59f3090 	ldr	r3, [pc, #144]	; 33f83b58 <.text+0x3b58>
33f83ac4:	e3e0100e 	mvn	r1, #14	; 0xe
33f83ac8:	e58d3024 	str	r3, [sp, #36]
33f83acc:	e1a0000d 	mov	r0, sp
33f83ad0:	e3a03000 	mov	r3, #0	; 0x0
33f83ad4:	e58d3030 	str	r3, [sp, #48]
33f83ad8:	eb0020bb 	bl	33f8bdcc <inflateInit2>
33f83adc:	e2507000 	subs	r7, r0, #0	; 0x0
33f83ae0:	e1a0600d 	mov	r6, sp
33f83ae4:	11a01007 	movne	r1, r7
33f83ae8:	159f006c 	ldrne	r0, [pc, #108]	; 33f83b5c <.text+0x3b5c>
33f83aec:	1a00000c 	bne	33f83b24 <gunzip+0x118>
33f83af0:	e59a3000 	ldr	r3, [sl]
33f83af4:	e0852004 	add	r2, r5, r4
33f83af8:	e0643003 	rsb	r3, r4, r3
33f83afc:	e1a0000d 	mov	r0, sp
33f83b00:	e3a01004 	mov	r1, #4	; 0x4
33f83b04:	e88d000c 	stmia	sp, {r2, r3}
33f83b08:	e58db010 	str	fp, [sp, #16]
33f83b0c:	e58d900c 	str	r9, [sp, #12]
33f83b10:	eb002205 	bl	33f8c32c <inflate>
33f83b14:	e3500001 	cmp	r0, #1	; 0x1
33f83b18:	9a000003 	bls	33f83b2c <gunzip+0x120>
33f83b1c:	e1a01000 	mov	r1, r0
33f83b20:	e59f0038 	ldr	r0, [pc, #56]	; 33f83b60 <.text+0x3b60>
33f83b24:	eb00104d 	bl	33f87c60 <printf>
33f83b28:	eaffffe0 	b	33f83ab0 <gunzip+0xa4>
33f83b2c:	e59d300c 	ldr	r3, [sp, #12]
33f83b30:	e0693003 	rsb	r3, r9, r3
33f83b34:	e58a3000 	str	r3, [sl]
33f83b38:	e1a0000d 	mov	r0, sp
33f83b3c:	eb002022 	bl	33f8bbcc <inflateEnd>
33f83b40:	e1a00007 	mov	r0, r7
33f83b44:	e28dd034 	add	sp, sp, #52	; 0x34
33f83b48:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f83b4c:	33f929a4 	mvnccs	r2, #2686976	; 0x290000
33f83b50:	33f929c0 	mvnccs	r2, #3145728	; 0x300000
33f83b54:	33f83b6c 	mvnccs	r3, #110592	; 0x1b000
33f83b58:	33f83b64 	mvnccs	r3, #102400	; 0x19000
33f83b5c:	33f929e8 	mvnccs	r2, #3801088	; 0x3a0000
33f83b60:	33f92a0c 	mvnccs	r2, #49152	; 0xc000

33f83b64 <zfree>:
33f83b64:	e1a00001 	mov	r0, r1
33f83b68:	ea00119b 	b	33f881dc <free>

33f83b6c <zalloc>:
33f83b6c:	e0000291 	mul	r0, r1, r2
33f83b70:	e280000f 	add	r0, r0, #15	; 0xf
33f83b74:	e3c0000f 	bic	r0, r0, #15	; 0xf
33f83b78:	ea00122a 	b	33f88428 <malloc>

33f83b7c <print_image_hdr>:
33f83b7c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f83b80:	e3a01020 	mov	r1, #32	; 0x20
33f83b84:	e1a05000 	mov	r5, r0
33f83b88:	e24dd004 	sub	sp, sp, #4	; 0x4
33f83b8c:	e59f02c8 	ldr	r0, [pc, #712]	; 33f83e5c <.text+0x3e5c>
33f83b90:	e0852001 	add	r2, r5, r1
33f83b94:	eb001031 	bl	33f87c60 <printf>
33f83b98:	e59f02c0 	ldr	r0, [pc, #704]	; 33f83e60 <.text+0x3e60>
33f83b9c:	eb00101c 	bl	33f87c14 <puts>
33f83ba0:	e5d5301c 	ldrb	r3, [r5, #28]
33f83ba4:	e3530012 	cmp	r3, #18	; 0x12
33f83ba8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f83bac:	ea000014 	b	33f83c04 <.text+0x3c04>
33f83bb0:	33f83c0c 	mvnccs	r3, #3072	; 0xc00
33f83bb4:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bb8:	33f83c14 	mvnccs	r3, #5120	; 0x1400
33f83bbc:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bc0:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bc4:	33f83c1c 	mvnccs	r3, #7168	; 0x1c00
33f83bc8:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bcc:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bd0:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bd4:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bd8:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bdc:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83be0:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83be4:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83be8:	33f83c24 	mvnccs	r3, #9216	; 0x2400
33f83bec:	33f83c04 	mvnccs	r3, #1024	; 0x400
33f83bf0:	33f83c2c 	mvnccs	r3, #11264	; 0x2c00
33f83bf4:	33f83c34 	mvnccs	r3, #13312	; 0x3400
33f83bf8:	33f83bfc 	mvnccs	r3, #258048	; 0x3f000
33f83bfc:	e59f2260 	ldr	r2, [pc, #608]	; 33f83e64 <.text+0x3e64>
33f83c00:	ea00000c 	b	33f83c38 <.text+0x3c38>
33f83c04:	e59f225c 	ldr	r2, [pc, #604]	; 33f83e68 <.text+0x3e68>
33f83c08:	ea00000a 	b	33f83c38 <.text+0x3c38>
33f83c0c:	e59f2258 	ldr	r2, [pc, #600]	; 33f83e6c <.text+0x3e6c>
33f83c10:	ea000008 	b	33f83c38 <.text+0x3c38>
33f83c14:	e59f2254 	ldr	r2, [pc, #596]	; 33f83e70 <.text+0x3e70>
33f83c18:	ea000006 	b	33f83c38 <.text+0x3c38>
33f83c1c:	e59f2250 	ldr	r2, [pc, #592]	; 33f83e74 <.text+0x3e74>
33f83c20:	ea000004 	b	33f83c38 <.text+0x3c38>
33f83c24:	e59f224c 	ldr	r2, [pc, #588]	; 33f83e78 <.text+0x3e78>
33f83c28:	ea000002 	b	33f83c38 <.text+0x3c38>
33f83c2c:	e59f2248 	ldr	r2, [pc, #584]	; 33f83e7c <.text+0x3e7c>
33f83c30:	ea000000 	b	33f83c38 <.text+0x3c38>
33f83c34:	e59f2244 	ldr	r2, [pc, #580]	; 33f83e80 <.text+0x3e80>
33f83c38:	e5d5301d 	ldrb	r3, [r5, #29]
33f83c3c:	e353000f 	cmp	r3, #15	; 0xf
33f83c40:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f83c44:	ea000011 	b	33f83c90 <.text+0x3c90>
33f83c48:	33f83c98 	mvnccs	r3, #38912	; 0x9800
33f83c4c:	33f83ca0 	mvnccs	r3, #40960	; 0xa000
33f83c50:	33f83ca8 	mvnccs	r3, #43008	; 0xa800
33f83c54:	33f83cb0 	mvnccs	r3, #45056	; 0xb000
33f83c58:	33f83cb8 	mvnccs	r3, #47104	; 0xb800
33f83c5c:	33f83cc0 	mvnccs	r3, #49152	; 0xc000
33f83c60:	33f83cc8 	mvnccs	r3, #51200	; 0xc800
33f83c64:	33f83cd0 	mvnccs	r3, #53248	; 0xd000
33f83c68:	33f83cd8 	mvnccs	r3, #55296	; 0xd800
33f83c6c:	33f83ce0 	mvnccs	r3, #57344	; 0xe000
33f83c70:	33f83ce8 	mvnccs	r3, #59392	; 0xe800
33f83c74:	33f83cf0 	mvnccs	r3, #61440	; 0xf000
33f83c78:	33f83cf8 	mvnccs	r3, #63488	; 0xf800
33f83c7c:	33f83d08 	mvnccs	r3, #512	; 0x200
33f83c80:	33f83d00 	mvnccs	r3, #0	; 0x0
33f83c84:	33f83c88 	mvnccs	r3, #34816	; 0x8800
33f83c88:	e59f11f4 	ldr	r1, [pc, #500]	; 33f83e84 <.text+0x3e84>
33f83c8c:	ea00001e 	b	33f83d0c <.text+0x3d0c>
33f83c90:	e59f11f0 	ldr	r1, [pc, #496]	; 33f83e88 <.text+0x3e88>
33f83c94:	ea00001c 	b	33f83d0c <.text+0x3d0c>
33f83c98:	e59f11ec 	ldr	r1, [pc, #492]	; 33f83e8c <.text+0x3e8c>
33f83c9c:	ea00001a 	b	33f83d0c <.text+0x3d0c>
33f83ca0:	e59f11e8 	ldr	r1, [pc, #488]	; 33f83e90 <.text+0x3e90>
33f83ca4:	ea000018 	b	33f83d0c <.text+0x3d0c>
33f83ca8:	e59f11e4 	ldr	r1, [pc, #484]	; 33f83e94 <.text+0x3e94>
33f83cac:	ea000016 	b	33f83d0c <.text+0x3d0c>
33f83cb0:	e59f11e0 	ldr	r1, [pc, #480]	; 33f83e98 <.text+0x3e98>
33f83cb4:	ea000014 	b	33f83d0c <.text+0x3d0c>
33f83cb8:	e59f11dc 	ldr	r1, [pc, #476]	; 33f83e9c <.text+0x3e9c>
33f83cbc:	ea000012 	b	33f83d0c <.text+0x3d0c>
33f83cc0:	e59f11d8 	ldr	r1, [pc, #472]	; 33f83ea0 <.text+0x3ea0>
33f83cc4:	ea000010 	b	33f83d0c <.text+0x3d0c>
33f83cc8:	e59f11d4 	ldr	r1, [pc, #468]	; 33f83ea4 <.text+0x3ea4>
33f83ccc:	ea00000e 	b	33f83d0c <.text+0x3d0c>
33f83cd0:	e59f11d0 	ldr	r1, [pc, #464]	; 33f83ea8 <.text+0x3ea8>
33f83cd4:	ea00000c 	b	33f83d0c <.text+0x3d0c>
33f83cd8:	e59f11cc 	ldr	r1, [pc, #460]	; 33f83eac <.text+0x3eac>
33f83cdc:	ea00000a 	b	33f83d0c <.text+0x3d0c>
33f83ce0:	e59f11c8 	ldr	r1, [pc, #456]	; 33f83eb0 <.text+0x3eb0>
33f83ce4:	ea000008 	b	33f83d0c <.text+0x3d0c>
33f83ce8:	e59f11c4 	ldr	r1, [pc, #452]	; 33f83eb4 <.text+0x3eb4>
33f83cec:	ea000006 	b	33f83d0c <.text+0x3d0c>
33f83cf0:	e59f11c0 	ldr	r1, [pc, #448]	; 33f83eb8 <.text+0x3eb8>
33f83cf4:	ea000004 	b	33f83d0c <.text+0x3d0c>
33f83cf8:	e59f11bc 	ldr	r1, [pc, #444]	; 33f83ebc <.text+0x3ebc>
33f83cfc:	ea000002 	b	33f83d0c <.text+0x3d0c>
33f83d00:	e59f11b8 	ldr	r1, [pc, #440]	; 33f83ec0 <.text+0x3ec0>
33f83d04:	ea000000 	b	33f83d0c <.text+0x3d0c>
33f83d08:	e59f11b4 	ldr	r1, [pc, #436]	; 33f83ec4 <.text+0x3ec4>
33f83d0c:	e5d5301e 	ldrb	r3, [r5, #30]
33f83d10:	e3530006 	cmp	r3, #6	; 0x6
33f83d14:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f83d18:	ea000008 	b	33f83d40 <.text+0x3d40>
33f83d1c:	33f83d48 	mvnccs	r3, #4608	; 0x1200
33f83d20:	33f83d50 	mvnccs	r3, #5120	; 0x1400
33f83d24:	33f83d58 	mvnccs	r3, #5632	; 0x1600
33f83d28:	33f83d60 	mvnccs	r3, #6144	; 0x1800
33f83d2c:	33f83d68 	mvnccs	r3, #6656	; 0x1a00
33f83d30:	33f83d70 	mvnccs	r3, #7168	; 0x1c00
33f83d34:	33f83d38 	mvnccs	r3, #3584	; 0xe00
33f83d38:	e59f3188 	ldr	r3, [pc, #392]	; 33f83ec8 <.text+0x3ec8>
33f83d3c:	ea00000c 	b	33f83d74 <.text+0x3d74>
33f83d40:	e59f3184 	ldr	r3, [pc, #388]	; 33f83ecc <.text+0x3ecc>
33f83d44:	ea00000a 	b	33f83d74 <.text+0x3d74>
33f83d48:	e59f3180 	ldr	r3, [pc, #384]	; 33f83ed0 <.text+0x3ed0>
33f83d4c:	ea000008 	b	33f83d74 <.text+0x3d74>
33f83d50:	e59f317c 	ldr	r3, [pc, #380]	; 33f83ed4 <.text+0x3ed4>
33f83d54:	ea000006 	b	33f83d74 <.text+0x3d74>
33f83d58:	e59f3178 	ldr	r3, [pc, #376]	; 33f83ed8 <.text+0x3ed8>
33f83d5c:	ea000004 	b	33f83d74 <.text+0x3d74>
33f83d60:	e59f3174 	ldr	r3, [pc, #372]	; 33f83edc <.text+0x3edc>
33f83d64:	ea000002 	b	33f83d74 <.text+0x3d74>
33f83d68:	e59f3170 	ldr	r3, [pc, #368]	; 33f83ee0 <.text+0x3ee0>
33f83d6c:	ea000000 	b	33f83d74 <.text+0x3d74>
33f83d70:	e59f316c 	ldr	r3, [pc, #364]	; 33f83ee4 <.text+0x3ee4>
33f83d74:	e5d5001f 	ldrb	r0, [r5, #31]
33f83d78:	e3500001 	cmp	r0, #1	; 0x1
33f83d7c:	0a000005 	beq	33f83d98 <.text+0x3d98>
33f83d80:	359fc160 	ldrcc	ip, [pc, #352]	; 33f83ee8 <.text+0x3ee8>
33f83d84:	3a000004 	bcc	33f83d9c <.text+0x3d9c>
33f83d88:	e3500002 	cmp	r0, #2	; 0x2
33f83d8c:	059fc158 	ldreq	ip, [pc, #344]	; 33f83eec <.text+0x3eec>
33f83d90:	0a000001 	beq	33f83d9c <.text+0x3d9c>
33f83d94:	ea00002b 	b	33f83e48 <.text+0x3e48>
33f83d98:	e59fc150 	ldr	ip, [pc, #336]	; 33f83ef0 <.text+0x3ef0>
33f83d9c:	e59f0150 	ldr	r0, [pc, #336]	; 33f83ef4 <.text+0x3ef4>
33f83da0:	e58dc000 	str	ip, [sp]
33f83da4:	eb000fad 	bl	33f87c60 <printf>
33f83da8:	e595000c 	ldr	r0, [r5, #12]
33f83dac:	ebffff0d 	bl	33f839e8 <__fswab32>
33f83db0:	e1a01000 	mov	r1, r0
33f83db4:	e59f013c 	ldr	r0, [pc, #316]	; 33f83ef8 <.text+0x3ef8>
33f83db8:	eb000fa8 	bl	33f87c60 <printf>
33f83dbc:	e595000c 	ldr	r0, [r5, #12]
33f83dc0:	ebffff08 	bl	33f839e8 <__fswab32>
33f83dc4:	e59f1130 	ldr	r1, [pc, #304]	; 33f83efc <.text+0x3efc>
33f83dc8:	eb001a25 	bl	33f8a664 <print_size>
33f83dcc:	e5950010 	ldr	r0, [r5, #16]
33f83dd0:	ebffff04 	bl	33f839e8 <__fswab32>
33f83dd4:	e1a04000 	mov	r4, r0
33f83dd8:	e5950014 	ldr	r0, [r5, #20]
33f83ddc:	ebffff01 	bl	33f839e8 <__fswab32>
33f83de0:	e1a01004 	mov	r1, r4
33f83de4:	e1a02000 	mov	r2, r0
33f83de8:	e59f0110 	ldr	r0, [pc, #272]	; 33f83f00 <.text+0x3f00>
33f83dec:	eb000f9b 	bl	33f87c60 <printf>
33f83df0:	e5d5301e 	ldrb	r3, [r5, #30]
33f83df4:	e3530004 	cmp	r3, #4	; 0x4
33f83df8:	1a000015 	bne	33f83e54 <.text+0x3e54>
33f83dfc:	e59f0100 	ldr	r0, [pc, #256]	; 33f83f04 <.text+0x3f04>
33f83e00:	eb000f83 	bl	33f87c14 <puts>
33f83e04:	e1a04005 	mov	r4, r5
33f83e08:	e3a06000 	mov	r6, #0	; 0x0
33f83e0c:	ea000003 	b	33f83e20 <.text+0x3e20>
33f83e10:	eb000f92 	bl	33f87c60 <printf>
33f83e14:	e1a00005 	mov	r0, r5
33f83e18:	e59f10dc 	ldr	r1, [pc, #220]	; 33f83efc <.text+0x3efc>
33f83e1c:	eb001a10 	bl	33f8a664 <print_size>
33f83e20:	e5940040 	ldr	r0, [r4, #64]
33f83e24:	ebfffeef 	bl	33f839e8 <__fswab32>
33f83e28:	e2505000 	subs	r5, r0, #0	; 0x0
33f83e2c:	e1a01006 	mov	r1, r6
33f83e30:	e1a02005 	mov	r2, r5
33f83e34:	e59f00cc 	ldr	r0, [pc, #204]	; 33f83f08 <.text+0x3f08>
33f83e38:	e2866001 	add	r6, r6, #1	; 0x1
33f83e3c:	e2844004 	add	r4, r4, #4	; 0x4
33f83e40:	1afffff2 	bne	33f83e10 <.text+0x3e10>
33f83e44:	ea000002 	b	33f83e54 <.text+0x3e54>
33f83e48:	e59f00a4 	ldr	r0, [pc, #164]	; 33f83ef4 <.text+0x3ef4>
33f83e4c:	e59fc0b8 	ldr	ip, [pc, #184]	; 33f83f0c <.text+0x3f0c>
33f83e50:	eaffffd2 	b	33f83da0 <.text+0x3da0>
33f83e54:	e28dd004 	add	sp, sp, #4	; 0x4
33f83e58:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f83e5c:	33f92a2c 	mvnccs	r2, #180224	; 0x2c000
33f83e60:	33f92a44 	mvnccs	r2, #278528	; 0x44000
33f83e64:	33f92a58 	mvnccs	r2, #360448	; 0x58000
33f83e68:	33f92a60 	mvnccs	r2, #393216	; 0x60000
33f83e6c:	33f92a6c 	mvnccs	r2, #442368	; 0x6c000
33f83e70:	33f92a78 	mvnccs	r2, #491520	; 0x78000
33f83e74:	33f92a80 	mvnccs	r2, #524288	; 0x80000
33f83e78:	33f92a88 	mvnccs	r2, #557056	; 0x88000
33f83e7c:	33f92a90 	mvnccs	r2, #589824	; 0x90000
33f83e80:	33f92a94 	mvnccs	r2, #606208	; 0x94000
33f83e84:	33f92a9c 	mvnccs	r2, #638976	; 0x9c000
33f83e88:	33f92aa4 	mvnccs	r2, #671744	; 0xa4000
33f83e8c:	33f92abc 	mvnccs	r2, #770048	; 0xbc000
33f83e90:	33f92ac8 	mvnccs	r2, #819200	; 0xc8000
33f83e94:	33f92ad0 	mvnccs	r2, #851968	; 0xd0000
33f83e98:	33f92ad4 	mvnccs	r2, #868352	; 0xd4000
33f83e9c:	33f92ae0 	mvnccs	r2, #917504	; 0xe0000
33f83ea0:	33f92ae8 	mvnccs	r2, #950272	; 0xe8000
33f83ea4:	33f92af0 	mvnccs	r2, #983040	; 0xf0000
33f83ea8:	33f92afc 	mvnccs	r2, #1032192	; 0xfc000
33f83eac:	33f92b04 	mvnccs	r2, #4096	; 0x1000
33f83eb0:	33f92b10 	mvnccs	r2, #16384	; 0x4000
33f83eb4:	33f92b18 	mvnccs	r2, #24576	; 0x6000
33f83eb8:	33f92b20 	mvnccs	r2, #32768	; 0x8000
33f83ebc:	33f92b30 	mvnccs	r2, #49152	; 0xc000
33f83ec0:	33f92b38 	mvnccs	r2, #57344	; 0xe000
33f83ec4:	33f92b44 	mvnccs	r2, #69632	; 0x11000
33f83ec8:	33f92b4c 	mvnccs	r2, #77824	; 0x13000
33f83ecc:	33f92b54 	mvnccs	r2, #86016	; 0x15000
33f83ed0:	33f92b64 	mvnccs	r2, #102400	; 0x19000
33f83ed4:	33f92b74 	mvnccs	r2, #118784	; 0x1d000
33f83ed8:	33f92b88 	mvnccs	r2, #139264	; 0x22000
33f83edc:	33f92b98 	mvnccs	r2, #155648	; 0x26000
33f83ee0:	33f92ba8 	mvnccs	r2, #172032	; 0x2a000
33f83ee4:	33f92bbc 	mvnccs	r2, #192512	; 0x2f000
33f83ee8:	33f92bdc 	mvnccs	r2, #225280	; 0x37000
33f83eec:	33f92bc8 	mvnccs	r2, #204800	; 0x32000
33f83ef0:	33f92bec 	mvnccs	r2, #241664	; 0x3b000
33f83ef4:	33f92bfc 	mvnccs	r2, #258048	; 0x3f000
33f83ef8:	33f92c0c 	mvnccs	r2, #3072	; 0xc00
33f83efc:	33f9544c 	mvnccs	r5, #1275068416	; 0x4c000000
33f83f00:	33f92c2c 	mvnccs	r2, #11264	; 0x2c00
33f83f04:	33f92c5c 	mvnccs	r2, #23552	; 0x5c00
33f83f08:	33f92c6c 	mvnccs	r2, #27648	; 0x6c00
33f83f0c:	33f92c88 	mvnccs	r2, #34816	; 0x8800

33f83f10 <do_bootm>:
33f83f10:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f83f14:	e24dd044 	sub	sp, sp, #68	; 0x44
33f83f18:	e58d0010 	str	r0, [sp, #16]
33f83f1c:	e59f0550 	ldr	r0, [pc, #1360]	; 33f84474 <.text+0x4474>
33f83f20:	e1a09002 	mov	r9, r2
33f83f24:	e58d100c 	str	r1, [sp, #12]
33f83f28:	e1a0b003 	mov	fp, r3
33f83f2c:	eb000c18 	bl	33f86f94 <getenv>
33f83f30:	e3500000 	cmp	r0, #0	; 0x0
33f83f34:	03a02001 	moveq	r2, #1	; 0x1
33f83f38:	058d2018 	streq	r2, [sp, #24]
33f83f3c:	0a000003 	beq	33f83f50 <do_bootm+0x40>
33f83f40:	e5d03000 	ldrb	r3, [r0]
33f83f44:	e253306e 	subs	r3, r3, #110	; 0x6e
33f83f48:	13a03001 	movne	r3, #1	; 0x1
33f83f4c:	e58d3018 	str	r3, [sp, #24]
33f83f50:	e3590001 	cmp	r9, #1	; 0x1
33f83f54:	d59f351c 	ldrle	r3, [pc, #1308]	; 33f84478 <.text+0x4478>
33f83f58:	d593a000 	ldrle	sl, [r3]
33f83f5c:	da000004 	ble	33f83f74 <do_bootm+0x64>
33f83f60:	e59b0004 	ldr	r0, [fp, #4]
33f83f64:	e3a01000 	mov	r1, #0	; 0x0
33f83f68:	e3a02010 	mov	r2, #16	; 0x10
33f83f6c:	eb001b35 	bl	33f8ac48 <simple_strtoul>
33f83f70:	e1a0a000 	mov	sl, r0
33f83f74:	e3a00001 	mov	r0, #1	; 0x1
33f83f78:	e59f54fc 	ldr	r5, [pc, #1276]	; 33f8447c <.text+0x447c>
33f83f7c:	eb0028bf 	bl	33f8e280 <show_boot_progress>
33f83f80:	e59f04f8 	ldr	r0, [pc, #1272]	; 33f84480 <.text+0x4480>
33f83f84:	e1a0100a 	mov	r1, sl
33f83f88:	eb000f34 	bl	33f87c60 <printf>
33f83f8c:	e1a0100a 	mov	r1, sl
33f83f90:	e3a02040 	mov	r2, #64	; 0x40
33f83f94:	e1a00005 	mov	r0, r5
33f83f98:	eb001ace 	bl	33f8aad8 <memmove>
33f83f9c:	e5950000 	ldr	r0, [r5]
33f83fa0:	ebfffe90 	bl	33f839e8 <__fswab32>
33f83fa4:	e59f34d8 	ldr	r3, [pc, #1240]	; 33f84484 <.text+0x4484>
33f83fa8:	e1500003 	cmp	r0, r3
33f83fac:	0a000003 	beq	33f83fc0 <do_bootm+0xb0>
33f83fb0:	e59f04d0 	ldr	r0, [pc, #1232]	; 33f84488 <.text+0x4488>
33f83fb4:	eb000f16 	bl	33f87c14 <puts>
33f83fb8:	e3e00000 	mvn	r0, #0	; 0x0
33f83fbc:	ea000128 	b	33f84464 <do_bootm+0x554>
33f83fc0:	e3a00002 	mov	r0, #2	; 0x2
33f83fc4:	eb0028ad 	bl	33f8e280 <show_boot_progress>
33f83fc8:	e5950004 	ldr	r0, [r5, #4]
33f83fcc:	ebfffe85 	bl	33f839e8 <__fswab32>
33f83fd0:	e3a07000 	mov	r7, #0	; 0x0
33f83fd4:	e3a03040 	mov	r3, #64	; 0x40
33f83fd8:	e1a04000 	mov	r4, r0
33f83fdc:	e1a02003 	mov	r2, r3
33f83fe0:	e1a00007 	mov	r0, r7
33f83fe4:	e1a01005 	mov	r1, r5
33f83fe8:	e5857004 	str	r7, [r5, #4]
33f83fec:	e58d3040 	str	r3, [sp, #64]
33f83ff0:	eb00195c 	bl	33f8a568 <crc32>
33f83ff4:	e1500004 	cmp	r0, r4
33f83ff8:	0a000003 	beq	33f8400c <do_bootm+0xfc>
33f83ffc:	e59f0488 	ldr	r0, [pc, #1160]	; 33f8448c <.text+0x448c>
33f84000:	eb000f03 	bl	33f87c14 <puts>
33f84004:	e3e00001 	mvn	r0, #1	; 0x1
33f84008:	ea000115 	b	33f84464 <do_bootm+0x554>
33f8400c:	e3a00003 	mov	r0, #3	; 0x3
33f84010:	e58da01c 	str	sl, [sp, #28]
33f84014:	eb002899 	bl	33f8e280 <show_boot_progress>
33f84018:	e59d001c 	ldr	r0, [sp, #28]
33f8401c:	ebfffed6 	bl	33f83b7c <print_image_hdr>
33f84020:	e595000c 	ldr	r0, [r5, #12]
33f84024:	ebfffe6f 	bl	33f839e8 <__fswab32>
33f84028:	e28d3018 	add	r3, sp, #24	; 0x18
33f8402c:	e8931008 	ldmia	r3, {r3, ip}
33f84030:	e3530000 	cmp	r3, #0	; 0x0
33f84034:	e58d0040 	str	r0, [sp, #64]
33f84038:	e28c6040 	add	r6, ip, #64	; 0x40
33f8403c:	0a000010 	beq	33f84084 <do_bootm+0x174>
33f84040:	e59f0448 	ldr	r0, [pc, #1096]	; 33f84490 <.text+0x4490>
33f84044:	eb000ef2 	bl	33f87c14 <puts>
33f84048:	e1a01006 	mov	r1, r6
33f8404c:	e59d2040 	ldr	r2, [sp, #64]
33f84050:	e1a00007 	mov	r0, r7
33f84054:	eb001943 	bl	33f8a568 <crc32>
33f84058:	e1a04000 	mov	r4, r0
33f8405c:	e5950018 	ldr	r0, [r5, #24]
33f84060:	ebfffe60 	bl	33f839e8 <__fswab32>
33f84064:	e1540000 	cmp	r4, r0
33f84068:	0a000003 	beq	33f8407c <do_bootm+0x16c>
33f8406c:	e59f0420 	ldr	r0, [pc, #1056]	; 33f84494 <.text+0x4494>
33f84070:	eb000efa 	bl	33f87c60 <printf>
33f84074:	e3e00002 	mvn	r0, #2	; 0x2
33f84078:	ea0000f9 	b	33f84464 <do_bootm+0x554>
33f8407c:	e59f0414 	ldr	r0, [pc, #1044]	; 33f84498 <.text+0x4498>
33f84080:	eb000ee3 	bl	33f87c14 <puts>
33f84084:	e59f43f0 	ldr	r4, [pc, #1008]	; 33f8447c <.text+0x447c>
33f84088:	e3a00004 	mov	r0, #4	; 0x4
33f8408c:	eb00287b 	bl	33f8e280 <show_boot_progress>
33f84090:	e5d4101d 	ldrb	r1, [r4, #29]
33f84094:	e3510002 	cmp	r1, #2	; 0x2
33f84098:	0a000003 	beq	33f840ac <do_bootm+0x19c>
33f8409c:	e59f03f8 	ldr	r0, [pc, #1016]	; 33f8449c <.text+0x449c>
33f840a0:	eb000eee 	bl	33f87c60 <printf>
33f840a4:	e3e00003 	mvn	r0, #3	; 0x3
33f840a8:	ea0000ed 	b	33f84464 <do_bootm+0x554>
33f840ac:	e3a00005 	mov	r0, #5	; 0x5
33f840b0:	eb002872 	bl	33f8e280 <show_boot_progress>
33f840b4:	e5d4301e 	ldrb	r3, [r4, #30]
33f840b8:	e3530002 	cmp	r3, #2	; 0x2
33f840bc:	e58d6014 	str	r6, [sp, #20]
33f840c0:	0a00001f 	beq	33f84144 <do_bootm+0x234>
33f840c4:	e3530004 	cmp	r3, #4	; 0x4
33f840c8:	0a00000c 	beq	33f84100 <do_bootm+0x1f0>
33f840cc:	e3530001 	cmp	r3, #1	; 0x1
33f840d0:	1a000015 	bne	33f8412c <do_bootm+0x21c>
33f840d4:	e3590002 	cmp	r9, #2	; 0x2
33f840d8:	d59f73c0 	ldrle	r7, [pc, #960]	; 33f844a0 <.text+0x44a0>
33f840dc:	da000019 	ble	33f84148 <do_bootm+0x238>
33f840e0:	e3a01000 	mov	r1, #0	; 0x0
33f840e4:	e3a02010 	mov	r2, #16	; 0x10
33f840e8:	e59b0008 	ldr	r0, [fp, #8]
33f840ec:	eb001ad5 	bl	33f8ac48 <simple_strtoul>
33f840f0:	ebfffe3c 	bl	33f839e8 <__fswab32>
33f840f4:	e59f73a4 	ldr	r7, [pc, #932]	; 33f844a0 <.text+0x44a0>
33f840f8:	e5840010 	str	r0, [r4, #16]
33f840fc:	ea000011 	b	33f84148 <do_bootm+0x238>
33f84100:	e59d2014 	ldr	r2, [sp, #20]
33f84104:	e5920000 	ldr	r0, [r2]
33f84108:	ebfffe36 	bl	33f839e8 <__fswab32>
33f8410c:	e58d0040 	str	r0, [sp, #64]
33f84110:	e28a1044 	add	r1, sl, #68	; 0x44
33f84114:	e4913004 	ldr	r3, [r1], #4
33f84118:	e3530000 	cmp	r3, #0	; 0x0
33f8411c:	1afffffc 	bne	33f84114 <do_bootm+0x204>
33f84120:	e59f737c 	ldr	r7, [pc, #892]	; 33f844a4 <.text+0x44a4>
33f84124:	e1a06001 	mov	r6, r1
33f84128:	ea000006 	b	33f84148 <do_bootm+0x238>
33f8412c:	e59d3010 	ldr	r3, [sp, #16]
33f84130:	e59f0370 	ldr	r0, [pc, #880]	; 33f844a8 <.text+0x44a8>
33f84134:	e5931000 	ldr	r1, [r3]
33f84138:	eb000ec8 	bl	33f87c60 <printf>
33f8413c:	e3e00004 	mvn	r0, #4	; 0x4
33f84140:	ea0000c7 	b	33f84464 <do_bootm+0x554>
33f84144:	e59f7360 	ldr	r7, [pc, #864]	; 33f844ac <.text+0x44ac>
33f84148:	e3a00006 	mov	r0, #6	; 0x6
33f8414c:	eb00284b 	bl	33f8e280 <show_boot_progress>
33f84150:	ebfff10b 	bl	33f80584 <disable_interrupts>
33f84154:	e59f4320 	ldr	r4, [pc, #800]	; 33f8447c <.text+0x447c>
33f84158:	e5d4301f 	ldrb	r3, [r4, #31]
33f8415c:	e3530000 	cmp	r3, #0	; 0x0
33f84160:	e1a05000 	mov	r5, r0
33f84164:	0a000002 	beq	33f84174 <do_bootm+0x264>
33f84168:	e3530001 	cmp	r3, #1	; 0x1
33f8416c:	1a000021 	bne	33f841f8 <do_bootm+0x2e8>
33f84170:	ea00000b 	b	33f841a4 <do_bootm+0x294>
33f84174:	e5940010 	ldr	r0, [r4, #16]
33f84178:	ebfffe1a 	bl	33f839e8 <__fswab32>
33f8417c:	e150000a 	cmp	r0, sl
33f84180:	1a000003 	bne	33f84194 <do_bootm+0x284>
33f84184:	e1a01007 	mov	r1, r7
33f84188:	e59f0320 	ldr	r0, [pc, #800]	; 33f844b0 <.text+0x44b0>
33f8418c:	eb000eb3 	bl	33f87c60 <printf>
33f84190:	ea00001f 	b	33f84214 <do_bootm+0x304>
33f84194:	e1a01006 	mov	r1, r6
33f84198:	e59d2040 	ldr	r2, [sp, #64]
33f8419c:	eb001a4d 	bl	33f8aad8 <memmove>
33f841a0:	ea00001b 	b	33f84214 <do_bootm+0x304>
33f841a4:	e1a01007 	mov	r1, r7
33f841a8:	e59f0304 	ldr	r0, [pc, #772]	; 33f844b4 <.text+0x44b4>
33f841ac:	eb000eab 	bl	33f87c60 <printf>
33f841b0:	e5940010 	ldr	r0, [r4, #16]
33f841b4:	ebfffe0b 	bl	33f839e8 <__fswab32>
33f841b8:	e1a02006 	mov	r2, r6
33f841bc:	e3a01502 	mov	r1, #8388608	; 0x800000
33f841c0:	e28d3040 	add	r3, sp, #64	; 0x40
33f841c4:	ebfffe10 	bl	33f83a0c <gunzip>
33f841c8:	e3500000 	cmp	r0, #0	; 0x0
33f841cc:	0a000010 	beq	33f84214 <do_bootm+0x304>
33f841d0:	e59f02e0 	ldr	r0, [pc, #736]	; 33f844b8 <.text+0x44b8>
33f841d4:	eb000e8e 	bl	33f87c14 <puts>
33f841d8:	e3e00005 	mvn	r0, #5	; 0x5
33f841dc:	eb002827 	bl	33f8e280 <show_boot_progress>
33f841e0:	e59d0010 	ldr	r0, [sp, #16]
33f841e4:	e59d100c 	ldr	r1, [sp, #12]
33f841e8:	e1a02009 	mov	r2, r9
33f841ec:	e1a0300b 	mov	r3, fp
33f841f0:	eb002856 	bl	33f8e350 <do_reset>
33f841f4:	ea000006 	b	33f84214 <do_bootm+0x304>
33f841f8:	e3500000 	cmp	r0, #0	; 0x0
33f841fc:	1bfff0df 	blne	33f80580 <enable_interrupts>
33f84200:	e59f02b4 	ldr	r0, [pc, #692]	; 33f844bc <.text+0x44bc>
33f84204:	e5d4101f 	ldrb	r1, [r4, #31]
33f84208:	eb000e94 	bl	33f87c60 <printf>
33f8420c:	e3e00006 	mvn	r0, #6	; 0x6
33f84210:	ea000093 	b	33f84464 <do_bootm+0x554>
33f84214:	e59f027c 	ldr	r0, [pc, #636]	; 33f84498 <.text+0x4498>
33f84218:	e59f425c 	ldr	r4, [pc, #604]	; 33f8447c <.text+0x447c>
33f8421c:	eb000e7c 	bl	33f87c14 <puts>
33f84220:	e3a00007 	mov	r0, #7	; 0x7
33f84224:	eb002815 	bl	33f8e280 <show_boot_progress>
33f84228:	e5d4301e 	ldrb	r3, [r4, #30]
33f8422c:	e3530002 	cmp	r3, #2	; 0x2
33f84230:	0a000028 	beq	33f842d8 <do_bootm+0x3c8>
33f84234:	e3530004 	cmp	r3, #4	; 0x4
33f84238:	0a000026 	beq	33f842d8 <do_bootm+0x3c8>
33f8423c:	e3530001 	cmp	r3, #1	; 0x1
33f84240:	1a00001d 	bne	33f842bc <do_bootm+0x3ac>
33f84244:	e3550000 	cmp	r5, #0	; 0x0
33f84248:	1bfff0cc 	blne	33f80580 <enable_interrupts>
33f8424c:	e59f026c 	ldr	r0, [pc, #620]	; 33f844c0 <.text+0x44c0>
33f84250:	eb000b4f 	bl	33f86f94 <getenv>
33f84254:	e3500000 	cmp	r0, #0	; 0x0
33f84258:	0a00000d 	beq	33f84294 <do_bootm+0x384>
33f8425c:	e59f1260 	ldr	r1, [pc, #608]	; 33f844c4 <.text+0x44c4>
33f84260:	eb00195a 	bl	33f8a7d0 <strcmp>
33f84264:	e2505000 	subs	r5, r0, #0	; 0x0
33f84268:	1a000009 	bne	33f84294 <do_bootm+0x384>
33f8426c:	e28d4020 	add	r4, sp, #32	; 0x20
33f84270:	e59f1250 	ldr	r1, [pc, #592]	; 33f844c8 <.text+0x44c8>
33f84274:	e59d2040 	ldr	r2, [sp, #64]
33f84278:	e1a00004 	mov	r0, r4
33f8427c:	eb001c5b 	bl	33f8b3f0 <sprintf>
33f84280:	e59f0244 	ldr	r0, [pc, #580]	; 33f844cc <.text+0x44cc>
33f84284:	e1a01004 	mov	r1, r4
33f84288:	eb000c8b 	bl	33f874bc <setenv>
33f8428c:	e1a00005 	mov	r0, r5
33f84290:	ea000075 	b	33f8446c <do_bootm+0x55c>
33f84294:	e59f31e0 	ldr	r3, [pc, #480]	; 33f8447c <.text+0x447c>
33f84298:	e5930014 	ldr	r0, [r3, #20]
33f8429c:	ebfffdd1 	bl	33f839e8 <__fswab32>
33f842a0:	e28b1004 	add	r1, fp, #4	; 0x4
33f842a4:	e1a03000 	mov	r3, r0
33f842a8:	e2490001 	sub	r0, r9, #1	; 0x1
33f842ac:	e1a0e00f 	mov	lr, pc
33f842b0:	e1a0f003 	mov	pc, r3
33f842b4:	e3a00000 	mov	r0, #0	; 0x0
33f842b8:	ea00006b 	b	33f8446c <do_bootm+0x55c>
33f842bc:	e3550000 	cmp	r5, #0	; 0x0
33f842c0:	1bfff0ae 	blne	33f80580 <enable_interrupts>
33f842c4:	e59f0204 	ldr	r0, [pc, #516]	; 33f844d0 <.text+0x44d0>
33f842c8:	e5d4101e 	ldrb	r1, [r4, #30]
33f842cc:	eb000e63 	bl	33f87c60 <printf>
33f842d0:	e3e00007 	mvn	r0, #7	; 0x7
33f842d4:	ea000062 	b	33f84464 <do_bootm+0x554>
33f842d8:	e3a00008 	mov	r0, #8	; 0x8
33f842dc:	eb0027e7 	bl	33f8e280 <show_boot_progress>
33f842e0:	e59f2194 	ldr	r2, [pc, #404]	; 33f8447c <.text+0x447c>
33f842e4:	e5d2301c 	ldrb	r3, [r2, #28]
33f842e8:	e3530002 	cmp	r3, #2	; 0x2
33f842ec:	0a00000e 	beq	33f8432c <do_bootm+0x41c>
33f842f0:	e3530012 	cmp	r3, #18	; 0x12
33f842f4:	0a00004e 	beq	33f84434 <do_bootm+0x524>
33f842f8:	e59f01d4 	ldr	r0, [pc, #468]	; 33f844d4 <.text+0x44d4>
33f842fc:	eb000e57 	bl	33f87c60 <printf>
33f84300:	e59dc014 	ldr	ip, [sp, #20]
33f84304:	e58dc004 	str	ip, [sp, #4]
33f84308:	e59dc018 	ldr	ip, [sp, #24]
33f8430c:	e59d0010 	ldr	r0, [sp, #16]
33f84310:	e59d100c 	ldr	r1, [sp, #12]
33f84314:	e1a02009 	mov	r2, r9
33f84318:	e1a0300b 	mov	r3, fp
33f8431c:	e58da000 	str	sl, [sp]
33f84320:	e58dc008 	str	ip, [sp, #8]
33f84324:	eb002bbd 	bl	33f8f220 <do_bootm_linux>
33f84328:	ea00004c 	b	33f84460 <do_bootm+0x550>
33f8432c:	e5d2301e 	ldrb	r3, [r2, #30]
33f84330:	e3530004 	cmp	r3, #4	; 0x4
33f84334:	1a000003 	bne	33f84348 <do_bootm+0x438>
33f84338:	e59d2014 	ldr	r2, [sp, #20]
33f8433c:	e5923004 	ldr	r3, [r2, #4]
33f84340:	e3530000 	cmp	r3, #0	; 0x0
33f84344:	1a000001 	bne	33f84350 <do_bootm+0x440>
33f84348:	e3a03000 	mov	r3, #0	; 0x0
33f8434c:	e58d301c 	str	r3, [sp, #28]
33f84350:	e3590002 	cmp	r9, #2	; 0x2
33f84354:	da00001f 	ble	33f843d8 <do_bootm+0x4c8>
33f84358:	e28b6008 	add	r6, fp, #8	; 0x8
33f8435c:	e3a05000 	mov	r5, #0	; 0x0
33f84360:	e3a04002 	mov	r4, #2	; 0x2
33f84364:	e4960004 	ldr	r0, [r6], #4
33f84368:	eb00193f 	bl	33f8a86c <strlen>
33f8436c:	e2844001 	add	r4, r4, #1	; 0x1
33f84370:	e2800001 	add	r0, r0, #1	; 0x1
33f84374:	e1540009 	cmp	r4, r9
33f84378:	e0855000 	add	r5, r5, r0
33f8437c:	1afffff8 	bne	33f84364 <do_bootm+0x454>
33f84380:	e1a00005 	mov	r0, r5
33f84384:	eb001027 	bl	33f88428 <malloc>
33f84388:	e28b4008 	add	r4, fp, #8	; 0x8
33f8438c:	e1a07000 	mov	r7, r0
33f84390:	e3a05000 	mov	r5, #0	; 0x0
33f84394:	e3a06002 	mov	r6, #2	; 0x2
33f84398:	e3560002 	cmp	r6, #2	; 0x2
33f8439c:	c3a03020 	movgt	r3, #32	; 0x20
33f843a0:	c7c73005 	strgtb	r3, [r7, r5]
33f843a4:	c2855001 	addgt	r5, r5, #1	; 0x1
33f843a8:	e5941000 	ldr	r1, [r4]
33f843ac:	e0870005 	add	r0, r7, r5
33f843b0:	eb0018d8 	bl	33f8a718 <strcpy>
33f843b4:	e4940004 	ldr	r0, [r4], #4
33f843b8:	eb00192b 	bl	33f8a86c <strlen>
33f843bc:	e2866001 	add	r6, r6, #1	; 0x1
33f843c0:	e1560009 	cmp	r6, r9
33f843c4:	e0855000 	add	r5, r5, r0
33f843c8:	1afffff2 	bne	33f84398 <do_bootm+0x488>
33f843cc:	e59f30a8 	ldr	r3, [pc, #168]	; 33f8447c <.text+0x447c>
33f843d0:	e5932014 	ldr	r2, [r3, #20]
33f843d4:	ea000007 	b	33f843f8 <do_bootm+0x4e8>
33f843d8:	e59f00f8 	ldr	r0, [pc, #248]	; 33f844d8 <.text+0x44d8>
33f843dc:	eb000aec 	bl	33f86f94 <getenv>
33f843e0:	e59f3094 	ldr	r3, [pc, #148]	; 33f8447c <.text+0x447c>
33f843e4:	e5932014 	ldr	r2, [r3, #20]
33f843e8:	e59f30ec 	ldr	r3, [pc, #236]	; 33f844dc <.text+0x44dc>
33f843ec:	e3500000 	cmp	r0, #0	; 0x0
33f843f0:	11a07000 	movne	r7, r0
33f843f4:	01a07003 	moveq	r7, r3
33f843f8:	e1a00002 	mov	r0, r2
33f843fc:	ebfffd79 	bl	33f839e8 <__fswab32>
33f84400:	e1a01000 	mov	r1, r0
33f84404:	e1a04000 	mov	r4, r0
33f84408:	e59f00d0 	ldr	r0, [pc, #208]	; 33f844e0 <.text+0x44e0>
33f8440c:	eb000e13 	bl	33f87c60 <printf>
33f84410:	e3a0000f 	mov	r0, #15	; 0xf
33f84414:	eb002799 	bl	33f8e280 <show_boot_progress>
33f84418:	e59d101c 	ldr	r1, [sp, #28]
33f8441c:	e5980000 	ldr	r0, [r8]
33f84420:	e1a03007 	mov	r3, r7
33f84424:	e59f20b0 	ldr	r2, [pc, #176]	; 33f844dc <.text+0x44dc>
33f84428:	e1a0e00f 	mov	lr, pc
33f8442c:	e1a0f004 	mov	pc, r4
33f84430:	ea00000a 	b	33f84460 <do_bootm+0x550>
33f84434:	e5920014 	ldr	r0, [r2, #20]
33f84438:	ebfffd6a 	bl	33f839e8 <__fswab32>
33f8443c:	e1a01000 	mov	r1, r0
33f84440:	e1a04000 	mov	r4, r0
33f84444:	e59f0098 	ldr	r0, [pc, #152]	; 33f844e4 <.text+0x44e4>
33f84448:	eb000e04 	bl	33f87c60 <printf>
33f8444c:	e3a0000f 	mov	r0, #15	; 0xf
33f84450:	eb00278a 	bl	33f8e280 <show_boot_progress>
33f84454:	e5980000 	ldr	r0, [r8]
33f84458:	e1a0e00f 	mov	lr, pc
33f8445c:	e1a0f004 	mov	pc, r4
33f84460:	e3e00008 	mvn	r0, #8	; 0x8
33f84464:	eb002785 	bl	33f8e280 <show_boot_progress>
33f84468:	e3a00001 	mov	r0, #1	; 0x1
33f8446c:	e28dd044 	add	sp, sp, #68	; 0x44
33f84470:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f84474:	33f92648 	mvnccs	r2, #75497472	; 0x4800000
33f84478:	33f956d4 	mvnccs	r5, #222298112	; 0xd400000
33f8447c:	33f964bc 	mvnccs	r6, #-1140850688	; 0xbc000000
33f84480:	33f92c9c 	mvnccs	r2, #39936	; 0x9c00
33f84484:	27051956 	smlsdcs	r5, r6, r9, r1
33f84488:	33f92cbc 	mvnccs	r2, #48128	; 0xbc00
33f8448c:	33f92cd0 	mvnccs	r2, #53248	; 0xd000
33f84490:	33f92ce8 	mvnccs	r2, #59392	; 0xe800
33f84494:	33f92d04 	mvnccs	r2, #256	; 0x100
33f84498:	33f92d14 	mvnccs	r2, #1280	; 0x500
33f8449c:	33f92d18 	mvnccs	r2, #1536	; 0x600
33f844a0:	33f92d38 	mvnccs	r2, #3584	; 0xe00
33f844a4:	33f92ba8 	mvnccs	r2, #172032	; 0x2a000
33f844a8:	33f92d50 	mvnccs	r2, #5120	; 0x1400
33f844ac:	33f92b88 	mvnccs	r2, #139264	; 0x22000
33f844b0:	33f92d74 	mvnccs	r2, #7424	; 0x1d00
33f844b4:	33f92d84 	mvnccs	r2, #8448	; 0x2100
33f844b8:	33f92da0 	mvnccs	r2, #10240	; 0x2800
33f844bc:	33f92dcc 	mvnccs	r2, #13056	; 0x3300
33f844c0:	33f92df0 	mvnccs	r2, #15360	; 0x3c00
33f844c4:	33f92dfc 	mvnccs	r2, #16128	; 0x3f00
33f844c8:	33f92e00 	mvnccs	r2, #0	; 0x0
33f844cc:	33f92e04 	mvnccs	r2, #64	; 0x40
33f844d0:	33f92e10 	mvnccs	r2, #256	; 0x100
33f844d4:	33f92e2c 	mvnccs	r2, #704	; 0x2c0
33f844d8:	33f92828 	mvnccs	r2, #2621440	; 0x280000
33f844dc:	33f938b4 	mvnccs	r3, #11796480	; 0xb40000
33f844e0:	33f9291c 	mvnccs	r2, #458752	; 0x70000
33f844e4:	33f92968 	mvnccs	r2, #1703936	; 0x1a0000

33f844e8 <on_off>:
33f844e8:	e92d4010 	stmdb	sp!, {r4, lr}
33f844ec:	e59f1030 	ldr	r1, [pc, #48]	; 33f84524 <.text+0x4524>
33f844f0:	e1a04000 	mov	r4, r0
33f844f4:	eb0018b5 	bl	33f8a7d0 <strcmp>
33f844f8:	e3500000 	cmp	r0, #0	; 0x0
33f844fc:	e59f1024 	ldr	r1, [pc, #36]	; 33f84528 <.text+0x4528>
33f84500:	e1a00004 	mov	r0, r4
33f84504:	e3a03001 	mov	r3, #1	; 0x1
33f84508:	0a000003 	beq	33f8451c <on_off+0x34>
33f8450c:	eb0018af 	bl	33f8a7d0 <strcmp>
33f84510:	e3500000 	cmp	r0, #0	; 0x0
33f84514:	01a03000 	moveq	r3, r0
33f84518:	13e03000 	mvnne	r3, #0	; 0x0
33f8451c:	e1a00003 	mov	r0, r3
33f84520:	e8bd8010 	ldmia	sp!, {r4, pc}
33f84524:	33f92d4c 	mvnccs	r2, #4864	; 0x1300
33f84528:	33f91e3c 	mvnccs	r1, #960	; 0x3c0

33f8452c <do_dcache>:
33f8452c:	e3520001 	cmp	r2, #1	; 0x1
33f84530:	e52de004 	str	lr, [sp, #-4]!
33f84534:	e1a01000 	mov	r1, r0
33f84538:	0a00000c 	beq	33f84570 <do_dcache+0x44>
33f8453c:	e3520002 	cmp	r2, #2	; 0x2
33f84540:	e59f005c 	ldr	r0, [pc, #92]	; 33f845a4 <.text+0x45a4>
33f84544:	1a000012 	bne	33f84594 <do_dcache+0x68>
33f84548:	e5930004 	ldr	r0, [r3, #4]
33f8454c:	ebffffe5 	bl	33f844e8 <on_off>
33f84550:	e3500000 	cmp	r0, #0	; 0x0
33f84554:	0a000002 	beq	33f84564 <do_dcache+0x38>
33f84558:	e3500001 	cmp	r0, #1	; 0x1
33f8455c:	1a000003 	bne	33f84570 <do_dcache+0x44>
33f84560:	ea000001 	b	33f8456c <do_dcache+0x40>
33f84564:	eb002787 	bl	33f8e388 <dcache_disable>
33f84568:	ea000000 	b	33f84570 <do_dcache+0x44>
33f8456c:	eb002793 	bl	33f8e3c0 <dcache_enable>
33f84570:	eb00277c 	bl	33f8e368 <dcache_status>
33f84574:	e59f302c 	ldr	r3, [pc, #44]	; 33f845a8 <.text+0x45a8>
33f84578:	e3500000 	cmp	r0, #0	; 0x0
33f8457c:	e59f1028 	ldr	r1, [pc, #40]	; 33f845ac <.text+0x45ac>
33f84580:	e59f0028 	ldr	r0, [pc, #40]	; 33f845b0 <.text+0x45b0>
33f84584:	11a01003 	movne	r1, r3
33f84588:	eb000db4 	bl	33f87c60 <printf>
33f8458c:	e3a00000 	mov	r0, #0	; 0x0
33f84590:	e49df004 	ldr	pc, [sp], #4
33f84594:	e5911010 	ldr	r1, [r1, #16]
33f84598:	eb000db0 	bl	33f87c60 <printf>
33f8459c:	e3a00001 	mov	r0, #1	; 0x1
33f845a0:	e49df004 	ldr	pc, [sp], #4
33f845a4:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f845a8:	33f92f18 	mvnccs	r2, #96	; 0x60
33f845ac:	33f92f1c 	mvnccs	r2, #112	; 0x70
33f845b0:	33f92f20 	mvnccs	r2, #128	; 0x80

33f845b4 <do_icache>:
33f845b4:	e3520001 	cmp	r2, #1	; 0x1
33f845b8:	e52de004 	str	lr, [sp, #-4]!
33f845bc:	e1a01000 	mov	r1, r0
33f845c0:	0a00000c 	beq	33f845f8 <do_icache+0x44>
33f845c4:	e3520002 	cmp	r2, #2	; 0x2
33f845c8:	e59f005c 	ldr	r0, [pc, #92]	; 33f8462c <.text+0x462c>
33f845cc:	1a000012 	bne	33f8461c <do_icache+0x68>
33f845d0:	e5930004 	ldr	r0, [r3, #4]
33f845d4:	ebffffc3 	bl	33f844e8 <on_off>
33f845d8:	e3500000 	cmp	r0, #0	; 0x0
33f845dc:	0a000002 	beq	33f845ec <do_icache+0x38>
33f845e0:	e3500001 	cmp	r0, #1	; 0x1
33f845e4:	1a000003 	bne	33f845f8 <do_icache+0x44>
33f845e8:	ea000001 	b	33f845f4 <do_icache+0x40>
33f845ec:	eb002746 	bl	33f8e30c <icache_disable>
33f845f0:	ea000000 	b	33f845f8 <do_icache+0x44>
33f845f4:	eb00276a 	bl	33f8e3a4 <icache_enable>
33f845f8:	eb00275e 	bl	33f8e378 <icache_status>
33f845fc:	e59f302c 	ldr	r3, [pc, #44]	; 33f84630 <.text+0x4630>
33f84600:	e3500000 	cmp	r0, #0	; 0x0
33f84604:	e59f1028 	ldr	r1, [pc, #40]	; 33f84634 <.text+0x4634>
33f84608:	e59f0028 	ldr	r0, [pc, #40]	; 33f84638 <.text+0x4638>
33f8460c:	11a01003 	movne	r1, r3
33f84610:	eb000d92 	bl	33f87c60 <printf>
33f84614:	e3a00000 	mov	r0, #0	; 0x0
33f84618:	e49df004 	ldr	pc, [sp], #4
33f8461c:	e5911010 	ldr	r1, [r1, #16]
33f84620:	eb000d8e 	bl	33f87c60 <printf>
33f84624:	e3a00001 	mov	r0, #1	; 0x1
33f84628:	e49df004 	ldr	pc, [sp], #4
33f8462c:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f84630:	33f92f18 	mvnccs	r2, #96	; 0x60
33f84634:	33f92f1c 	mvnccs	r2, #112	; 0x70
33f84638:	33f92f44 	mvnccs	r2, #272	; 0x110

33f8463c <do_coninfo>:
33f8463c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f84640:	e59f00b8 	ldr	r0, [pc, #184]	; 33f84700 <.text+0x4700>
33f84644:	e24dd008 	sub	sp, sp, #8	; 0x8
33f84648:	eb000d71 	bl	33f87c14 <puts>
33f8464c:	e3a07001 	mov	r7, #1	; 0x1
33f84650:	ea000022 	b	33f846e0 <do_coninfo+0xa4>
33f84654:	e5940000 	ldr	r0, [r4]
33f84658:	e1a01007 	mov	r1, r7
33f8465c:	eb001385 	bl	33f89478 <ListGetPtrToItem>
33f84660:	e5903000 	ldr	r3, [r0]
33f84664:	e3130001 	tst	r3, #1	; 0x1
33f84668:	03a0e02e 	moveq	lr, #46	; 0x2e
33f8466c:	13a0e049 	movne	lr, #73	; 0x49
33f84670:	e3130002 	tst	r3, #2	; 0x2
33f84674:	03a0c02e 	moveq	ip, #46	; 0x2e
33f84678:	13a0c04f 	movne	ip, #79	; 0x4f
33f8467c:	e1a06000 	mov	r6, r0
33f84680:	e3530000 	cmp	r3, #0	; 0x0
33f84684:	e1a02003 	mov	r2, r3
33f84688:	e59f0074 	ldr	r0, [pc, #116]	; 33f84704 <.text+0x4704>
33f8468c:	b3a03053 	movlt	r3, #83	; 0x53
33f84690:	a3a0302e 	movge	r3, #46	; 0x2e
33f84694:	e2861008 	add	r1, r6, #8	; 0x8
33f84698:	e58de000 	str	lr, [sp]
33f8469c:	e58dc004 	str	ip, [sp, #4]
33f846a0:	eb000d6e 	bl	33f87c60 <printf>
33f846a4:	e59f405c 	ldr	r4, [pc, #92]	; 33f84708 <.text+0x4708>
33f846a8:	e59f505c 	ldr	r5, [pc, #92]	; 33f8470c <.text+0x470c>
33f846ac:	e5943000 	ldr	r3, [r4]
33f846b0:	e1530006 	cmp	r3, r6
33f846b4:	e2844004 	add	r4, r4, #4	; 0x4
33f846b8:	e59f0050 	ldr	r0, [pc, #80]	; 33f84710 <.text+0x4710>
33f846bc:	05951000 	ldreq	r1, [r5]
33f846c0:	0b000d66 	bleq	33f87c60 <printf>
33f846c4:	e59f3048 	ldr	r3, [pc, #72]	; 33f84714 <.text+0x4714>
33f846c8:	e1540003 	cmp	r4, r3
33f846cc:	e2855004 	add	r5, r5, #4	; 0x4
33f846d0:	1afffff5 	bne	33f846ac <do_coninfo+0x70>
33f846d4:	e3a0000a 	mov	r0, #10	; 0xa
33f846d8:	eb000de6 	bl	33f87e78 <putc>
33f846dc:	e2877001 	add	r7, r7, #1	; 0x1
33f846e0:	e59f4030 	ldr	r4, [pc, #48]	; 33f84718 <.text+0x4718>
33f846e4:	e5940000 	ldr	r0, [r4]
33f846e8:	eb001374 	bl	33f894c0 <ListNumItems>
33f846ec:	e1570000 	cmp	r7, r0
33f846f0:	daffffd7 	ble	33f84654 <do_coninfo+0x18>
33f846f4:	e3a00000 	mov	r0, #0	; 0x0
33f846f8:	e28dd008 	add	sp, sp, #8	; 0x8
33f846fc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f84700:	33f93040 	mvnccs	r3, #64	; 0x40
33f84704:	33f9305c 	mvnccs	r3, #92	; 0x5c
33f84708:	33f965a4 	mvnccs	r6, #687865856	; 0x29000000
33f8470c:	33f956e0 	mvnccs	r5, #234881024	; 0xe000000
33f84710:	33f93070 	mvnccs	r3, #112	; 0x70
33f84714:	33f965b0 	mvnccs	r6, #738197504	; 0x2c000000
33f84718:	33f965a0 	mvnccs	r6, #671088640	; 0x28000000

33f8471c <get_dev>:
33f8471c:	e92d4010 	stmdb	sp!, {r4, lr}
33f84720:	e3a02003 	mov	r2, #3	; 0x3
33f84724:	e1a04001 	mov	r4, r1
33f84728:	e59f101c 	ldr	r1, [pc, #28]	; 33f8474c <.text+0x474c>
33f8472c:	eb001832 	bl	33f8a7fc <strncmp>
33f84730:	e3500000 	cmp	r0, #0	; 0x0
33f84734:	e1a00004 	mov	r0, r4
33f84738:	1a000001 	bne	33f84744 <get_dev+0x28>
33f8473c:	e8bd4010 	ldmia	sp!, {r4, lr}
33f84740:	ea002759 	b	33f8e4ac <mmc_get_dev>
33f84744:	e3a00000 	mov	r0, #0	; 0x0
33f84748:	e8bd8010 	ldmia	sp!, {r4, pc}
33f8474c:	33f930b0 	mvnccs	r3, #176	; 0xb0

33f84750 <do_fat_fsinfo>:
33f84750:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f84754:	e3520001 	cmp	r2, #1	; 0x1
33f84758:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8475c:	e1a04003 	mov	r4, r3
33f84760:	ca000003 	bgt	33f84774 <do_fat_fsinfo+0x24>
33f84764:	e59f00b8 	ldr	r0, [pc, #184]	; 33f84824 <.text+0x4824>
33f84768:	eb000d3c 	bl	33f87c60 <printf>
33f8476c:	e3a00000 	mov	r0, #0	; 0x0
33f84770:	ea000029 	b	33f8481c <do_fat_fsinfo+0xcc>
33f84774:	e1a0100d 	mov	r1, sp
33f84778:	e3a02010 	mov	r2, #16	; 0x10
33f8477c:	e5930008 	ldr	r0, [r3, #8]
33f84780:	eb001930 	bl	33f8ac48 <simple_strtoul>
33f84784:	e1a06000 	mov	r6, r0
33f84788:	e1a01006 	mov	r1, r6
33f8478c:	e5940004 	ldr	r0, [r4, #4]
33f84790:	ebffffe1 	bl	33f8471c <get_dev>
33f84794:	e2505000 	subs	r5, r0, #0	; 0x0
33f84798:	e2847004 	add	r7, r4, #4	; 0x4
33f8479c:	059f0084 	ldreq	r0, [pc, #132]	; 33f84828 <.text+0x4828>
33f847a0:	0a000007 	beq	33f847c4 <do_fat_fsinfo+0x74>
33f847a4:	e59d3000 	ldr	r3, [sp]
33f847a8:	e5d32000 	ldrb	r2, [r3]
33f847ac:	e3520000 	cmp	r2, #0	; 0x0
33f847b0:	03a04001 	moveq	r4, #1	; 0x1
33f847b4:	0a00000c 	beq	33f847ec <do_fat_fsinfo+0x9c>
33f847b8:	e352003a 	cmp	r2, #58	; 0x3a
33f847bc:	0a000003 	beq	33f847d0 <do_fat_fsinfo+0x80>
33f847c0:	e59f0064 	ldr	r0, [pc, #100]	; 33f8482c <.text+0x482c>
33f847c4:	eb000d12 	bl	33f87c14 <puts>
33f847c8:	e3a00001 	mov	r0, #1	; 0x1
33f847cc:	ea000012 	b	33f8481c <do_fat_fsinfo+0xcc>
33f847d0:	e2833001 	add	r3, r3, #1	; 0x1
33f847d4:	e1a00003 	mov	r0, r3
33f847d8:	e3a01000 	mov	r1, #0	; 0x0
33f847dc:	e3a02010 	mov	r2, #16	; 0x10
33f847e0:	e58d3000 	str	r3, [sp]
33f847e4:	eb001917 	bl	33f8ac48 <simple_strtoul>
33f847e8:	e1a04000 	mov	r4, r0
33f847ec:	e1a00005 	mov	r0, r5
33f847f0:	e1a01004 	mov	r1, r4
33f847f4:	eb002fe7 	bl	33f90798 <fat_register_device>
33f847f8:	e3500000 	cmp	r0, #0	; 0x0
33f847fc:	0a000005 	beq	33f84818 <do_fat_fsinfo+0xc8>
33f84800:	e5971000 	ldr	r1, [r7]
33f84804:	e1a02006 	mov	r2, r6
33f84808:	e1a03004 	mov	r3, r4
33f8480c:	e59f001c 	ldr	r0, [pc, #28]	; 33f84830 <.text+0x4830>
33f84810:	eb000d12 	bl	33f87c60 <printf>
33f84814:	eaffffeb 	b	33f847c8 <do_fat_fsinfo+0x78>
33f84818:	eb002c7f 	bl	33f8fa1c <file_fat_detectfs>
33f8481c:	e28dd004 	add	sp, sp, #4	; 0x4
33f84820:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f84824:	33f930b4 	mvnccs	r3, #180	; 0xb4
33f84828:	33f930e0 	mvnccs	r3, #224	; 0xe0
33f8482c:	33f930fc 	mvnccs	r3, #252	; 0xfc
33f84830:	33f9312c 	mvnccs	r3, #11	; 0xb

33f84834 <do_fat_ls>:
33f84834:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f84838:	e3520002 	cmp	r2, #2	; 0x2
33f8483c:	e24dd004 	sub	sp, sp, #4	; 0x4
33f84840:	e1a09002 	mov	r9, r2
33f84844:	e1a05003 	mov	r5, r3
33f84848:	ca000003 	bgt	33f8485c <do_fat_ls+0x28>
33f8484c:	e59f00d8 	ldr	r0, [pc, #216]	; 33f8492c <.text+0x492c>
33f84850:	eb000d02 	bl	33f87c60 <printf>
33f84854:	e3a04000 	mov	r4, #0	; 0x0
33f84858:	ea000030 	b	33f84920 <do_fat_ls+0xec>
33f8485c:	e1a0100d 	mov	r1, sp
33f84860:	e3a02010 	mov	r2, #16	; 0x10
33f84864:	e5930008 	ldr	r0, [r3, #8]
33f84868:	eb0018f6 	bl	33f8ac48 <simple_strtoul>
33f8486c:	e1a01000 	mov	r1, r0
33f84870:	e1a07000 	mov	r7, r0
33f84874:	e5950004 	ldr	r0, [r5, #4]
33f84878:	ebffffa7 	bl	33f8471c <get_dev>
33f8487c:	e2506000 	subs	r6, r0, #0	; 0x0
33f84880:	e285a004 	add	sl, r5, #4	; 0x4
33f84884:	059f00a4 	ldreq	r0, [pc, #164]	; 33f84930 <.text+0x4930>
33f84888:	0a000007 	beq	33f848ac <do_fat_ls+0x78>
33f8488c:	e59d3000 	ldr	r3, [sp]
33f84890:	e5d32000 	ldrb	r2, [r3]
33f84894:	e3520000 	cmp	r2, #0	; 0x0
33f84898:	03a04001 	moveq	r4, #1	; 0x1
33f8489c:	0a00000c 	beq	33f848d4 <do_fat_ls+0xa0>
33f848a0:	e352003a 	cmp	r2, #58	; 0x3a
33f848a4:	0a000003 	beq	33f848b8 <do_fat_ls+0x84>
33f848a8:	e59f0084 	ldr	r0, [pc, #132]	; 33f84934 <.text+0x4934>
33f848ac:	eb000cd8 	bl	33f87c14 <puts>
33f848b0:	e3a04001 	mov	r4, #1	; 0x1
33f848b4:	ea000019 	b	33f84920 <do_fat_ls+0xec>
33f848b8:	e2833001 	add	r3, r3, #1	; 0x1
33f848bc:	e1a00003 	mov	r0, r3
33f848c0:	e3a01000 	mov	r1, #0	; 0x0
33f848c4:	e3a02010 	mov	r2, #16	; 0x10
33f848c8:	e58d3000 	str	r3, [sp]
33f848cc:	eb0018dd 	bl	33f8ac48 <simple_strtoul>
33f848d0:	e1a04000 	mov	r4, r0
33f848d4:	e1a00006 	mov	r0, r6
33f848d8:	e1a01004 	mov	r1, r4
33f848dc:	eb002fad 	bl	33f90798 <fat_register_device>
33f848e0:	e3500000 	cmp	r0, #0	; 0x0
33f848e4:	0a000005 	beq	33f84900 <do_fat_ls+0xcc>
33f848e8:	e59a1000 	ldr	r1, [sl]
33f848ec:	e1a02007 	mov	r2, r7
33f848f0:	e1a03004 	mov	r3, r4
33f848f4:	e59f003c 	ldr	r0, [pc, #60]	; 33f84938 <.text+0x4938>
33f848f8:	eb000cd8 	bl	33f87c60 <printf>
33f848fc:	eaffffeb 	b	33f848b0 <do_fat_ls+0x7c>
33f84900:	e3590004 	cmp	r9, #4	; 0x4
33f84904:	0595000c 	ldreq	r0, [r5, #12]
33f84908:	159f002c 	ldrne	r0, [pc, #44]	; 33f8493c <.text+0x493c>
33f8490c:	eb002f9d 	bl	33f90788 <file_fat_ls>
33f84910:	e3500000 	cmp	r0, #0	; 0x0
33f84914:	e1a04000 	mov	r4, r0
33f84918:	159f0020 	ldrne	r0, [pc, #32]	; 33f84940 <.text+0x4940>
33f8491c:	1b000ccf 	blne	33f87c60 <printf>
33f84920:	e1a00004 	mov	r0, r4
33f84924:	e28dd004 	add	sp, sp, #4	; 0x4
33f84928:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f8492c:	33f93158 	mvnccs	r3, #22	; 0x16
33f84930:	33f930e0 	mvnccs	r3, #224	; 0xe0
33f84934:	33f930fc 	mvnccs	r3, #252	; 0xfc
33f84938:	33f9318c 	mvnccs	r3, #35	; 0x23
33f8493c:	33f931b8 	mvnccs	r3, #46	; 0x2e
33f84940:	33f931bc 	mvnccs	r3, #47	; 0x2f

33f84944 <do_fat_fsload>:
33f84944:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f84948:	e3520004 	cmp	r2, #4	; 0x4
33f8494c:	e24dd014 	sub	sp, sp, #20	; 0x14
33f84950:	e1a09002 	mov	r9, r2
33f84954:	e1a06003 	mov	r6, r3
33f84958:	ca000002 	bgt	33f84968 <do_fat_fsload+0x24>
33f8495c:	e59f0144 	ldr	r0, [pc, #324]	; 33f84aa8 <.text+0x4aa8>
33f84960:	eb000cbe 	bl	33f87c60 <printf>
33f84964:	ea00000c 	b	33f8499c <do_fat_fsload+0x58>
33f84968:	e28d1010 	add	r1, sp, #16	; 0x10
33f8496c:	e3a02010 	mov	r2, #16	; 0x10
33f84970:	e5930008 	ldr	r0, [r3, #8]
33f84974:	eb0018b3 	bl	33f8ac48 <simple_strtoul>
33f84978:	e1a01000 	mov	r1, r0
33f8497c:	e1a07000 	mov	r7, r0
33f84980:	e5960004 	ldr	r0, [r6, #4]
33f84984:	ebffff64 	bl	33f8471c <get_dev>
33f84988:	e2504000 	subs	r4, r0, #0	; 0x0
33f8498c:	e286b004 	add	fp, r6, #4	; 0x4
33f84990:	1a000003 	bne	33f849a4 <do_fat_fsload+0x60>
33f84994:	e59f0110 	ldr	r0, [pc, #272]	; 33f84aac <.text+0x4aac>
33f84998:	eb000c9d 	bl	33f87c14 <puts>
33f8499c:	e3a00001 	mov	r0, #1	; 0x1
33f849a0:	ea00003e 	b	33f84aa0 <do_fat_fsload+0x15c>
33f849a4:	e59d3010 	ldr	r3, [sp, #16]
33f849a8:	e5d32000 	ldrb	r2, [r3]
33f849ac:	e3520000 	cmp	r2, #0	; 0x0
33f849b0:	03a0a001 	moveq	sl, #1	; 0x1
33f849b4:	0a000009 	beq	33f849e0 <do_fat_fsload+0x9c>
33f849b8:	e352003a 	cmp	r2, #58	; 0x3a
33f849bc:	159f00ec 	ldrne	r0, [pc, #236]	; 33f84ab0 <.text+0x4ab0>
33f849c0:	1afffff4 	bne	33f84998 <do_fat_fsload+0x54>
33f849c4:	e2833001 	add	r3, r3, #1	; 0x1
33f849c8:	e1a00003 	mov	r0, r3
33f849cc:	e3a01000 	mov	r1, #0	; 0x0
33f849d0:	e3a02010 	mov	r2, #16	; 0x10
33f849d4:	e58d3010 	str	r3, [sp, #16]
33f849d8:	eb00189a 	bl	33f8ac48 <simple_strtoul>
33f849dc:	e1a0a000 	mov	sl, r0
33f849e0:	e1a00004 	mov	r0, r4
33f849e4:	e1a0100a 	mov	r1, sl
33f849e8:	eb002f6a 	bl	33f90798 <fat_register_device>
33f849ec:	e2504000 	subs	r4, r0, #0	; 0x0
33f849f0:	0a000005 	beq	33f84a0c <do_fat_fsload+0xc8>
33f849f4:	e59b1000 	ldr	r1, [fp]
33f849f8:	e1a02007 	mov	r2, r7
33f849fc:	e1a0300a 	mov	r3, sl
33f84a00:	e59f00ac 	ldr	r0, [pc, #172]	; 33f84ab4 <.text+0x4ab4>
33f84a04:	eb000c95 	bl	33f87c60 <printf>
33f84a08:	eaffffe3 	b	33f8499c <do_fat_fsload+0x58>
33f84a0c:	e596000c 	ldr	r0, [r6, #12]
33f84a10:	e1a01004 	mov	r1, r4
33f84a14:	e3a02010 	mov	r2, #16	; 0x10
33f84a18:	eb00188a 	bl	33f8ac48 <simple_strtoul>
33f84a1c:	e3590006 	cmp	r9, #6	; 0x6
33f84a20:	e1a05000 	mov	r5, r0
33f84a24:	11a00004 	movne	r0, r4
33f84a28:	01a01004 	moveq	r1, r4
33f84a2c:	05960014 	ldreq	r0, [r6, #20]
33f84a30:	03a02010 	moveq	r2, #16	; 0x10
33f84a34:	0b001883 	bleq	33f8ac48 <simple_strtoul>
33f84a38:	e1a01005 	mov	r1, r5
33f84a3c:	e1a02000 	mov	r2, r0
33f84a40:	e5960010 	ldr	r0, [r6, #16]
33f84a44:	eb002f41 	bl	33f90750 <file_fat_read>
33f84a48:	e3700001 	cmn	r0, #1	; 0x1
33f84a4c:	e1a05000 	mov	r5, r0
33f84a50:	1a000006 	bne	33f84a70 <do_fat_fsload+0x12c>
33f84a54:	e5961010 	ldr	r1, [r6, #16]
33f84a58:	e59b2000 	ldr	r2, [fp]
33f84a5c:	e1a03007 	mov	r3, r7
33f84a60:	e59f0050 	ldr	r0, [pc, #80]	; 33f84ab8 <.text+0x4ab8>
33f84a64:	e58da000 	str	sl, [sp]
33f84a68:	eb000c7c 	bl	33f87c60 <printf>
33f84a6c:	eaffffca 	b	33f8499c <do_fat_fsload+0x58>
33f84a70:	e59f0044 	ldr	r0, [pc, #68]	; 33f84abc <.text+0x4abc>
33f84a74:	e1a01005 	mov	r1, r5
33f84a78:	e28d4004 	add	r4, sp, #4	; 0x4
33f84a7c:	eb000c77 	bl	33f87c60 <printf>
33f84a80:	e1a02005 	mov	r2, r5
33f84a84:	e59f1034 	ldr	r1, [pc, #52]	; 33f84ac0 <.text+0x4ac0>
33f84a88:	e1a00004 	mov	r0, r4
33f84a8c:	eb001a57 	bl	33f8b3f0 <sprintf>
33f84a90:	e59f002c 	ldr	r0, [pc, #44]	; 33f84ac4 <.text+0x4ac4>
33f84a94:	e1a01004 	mov	r1, r4
33f84a98:	eb000a87 	bl	33f874bc <setenv>
33f84a9c:	e3a00000 	mov	r0, #0	; 0x0
33f84aa0:	e28dd014 	add	sp, sp, #20	; 0x14
33f84aa4:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f84aa8:	33f931d0 	mvnccs	r3, #52	; 0x34
33f84aac:	33f930e0 	mvnccs	r3, #224	; 0xe0
33f84ab0:	33f930fc 	mvnccs	r3, #252	; 0xfc
33f84ab4:	33f93214 	mvnccs	r3, #1073741825	; 0x40000001
33f84ab8:	33f93240 	mvnccs	r3, #4	; 0x4
33f84abc:	33f9326c 	mvnccs	r3, #-1073741818	; 0xc0000006
33f84ac0:	33f92e00 	mvnccs	r2, #0	; 0x0
33f84ac4:	33f92e04 	mvnccs	r2, #64	; 0x40

33f84ac8 <ktrans>:
33f84ac8:	e2003060 	and	r3, r0, #96	; 0x60
33f84acc:	e3530040 	cmp	r3, #64	; 0x40
33f84ad0:	e20030ff 	and	r3, r0, #255	; 0xff
33f84ad4:	e200207f 	and	r2, r0, #127	; 0x7f
33f84ad8:	020030bf 	andeq	r3, r0, #191	; 0xbf
33f84adc:	0a000001 	beq	33f84ae8 <ktrans+0x20>
33f84ae0:	e352003f 	cmp	r2, #63	; 0x3f
33f84ae4:	03833040 	orreq	r3, r3, #64	; 0x40
33f84ae8:	e1a00003 	mov	r0, r3
33f84aec:	e1a0f00e 	mov	pc, lr

33f84af0 <chk1>:
33f84af0:	e3a02000 	mov	r2, #0	; 0x0
33f84af4:	ea000001 	b	33f84b00 <chk1+0x10>
33f84af8:	e0822003 	add	r2, r2, r3
33f84afc:	e2800001 	add	r0, r0, #1	; 0x1
33f84b00:	e5d03000 	ldrb	r3, [r0]
33f84b04:	e3530000 	cmp	r3, #0	; 0x0
33f84b08:	1afffffa 	bne	33f84af8 <chk1+0x8>
33f84b0c:	e1a00c02 	mov	r0, r2, lsl #24
33f84b10:	e0820f20 	add	r0, r2, r0, lsr #30
33f84b14:	e200003f 	and	r0, r0, #63	; 0x3f
33f84b18:	e1a0f00e 	mov	pc, lr

33f84b1c <bin_data_init>:
33f84b1c:	e59f3020 	ldr	r3, [pc, #32]	; 33f84b44 <.text+0x4b44>
33f84b20:	e5931000 	ldr	r1, [r3]
33f84b24:	e59f301c 	ldr	r3, [pc, #28]	; 33f84b48 <.text+0x4b48>
33f84b28:	e3a02000 	mov	r2, #0	; 0x0
33f84b2c:	e5832000 	str	r2, [r3]
33f84b30:	e59f3014 	ldr	r3, [pc, #20]	; 33f84b4c <.text+0x4b4c>
33f84b34:	e5831000 	str	r1, [r3]
33f84b38:	e59f3010 	ldr	r3, [pc, #16]	; 33f84b50 <.text+0x4b50>
33f84b3c:	e5832000 	str	r2, [r3]
33f84b40:	e1a0f00e 	mov	pc, lr
33f84b44:	33f96578 	mvnccs	r6, #503316480	; 0x1e000000
33f84b48:	33f964fc 	mvnccs	r6, #-67108864	; 0xfc000000
33f84b4c:	33f96570 	mvnccs	r6, #469762048	; 0x1c000000
33f84b50:	33f96564 	mvnccs	r6, #419430400	; 0x19000000

33f84b54 <bin_data_char>:
33f84b54:	e59f3030 	ldr	r3, [pc, #48]	; 33f84b8c <.text+0x4b8c>
33f84b58:	e5933000 	ldr	r3, [r3]
33f84b5c:	e3530000 	cmp	r3, #0	; 0x0
33f84b60:	e59f1028 	ldr	r1, [pc, #40]	; 33f84b90 <.text+0x4b90>
33f84b64:	e59fc028 	ldr	ip, [pc, #40]	; 33f84b94 <.text+0x4b94>
33f84b68:	e20000ff 	and	r0, r0, #255	; 0xff
33f84b6c:	11a0f00e 	movne	pc, lr
33f84b70:	e5912000 	ldr	r2, [r1]
33f84b74:	e4c20001 	strb	r0, [r2], #1
33f84b78:	e59c3000 	ldr	r3, [ip]
33f84b7c:	e2433001 	sub	r3, r3, #1	; 0x1
33f84b80:	e5812000 	str	r2, [r1]
33f84b84:	e58c3000 	str	r3, [ip]
33f84b88:	e1a0f00e 	mov	pc, lr
33f84b8c:	33f96564 	mvnccs	r6, #419430400	; 0x19000000
33f84b90:	33f96570 	mvnccs	r6, #469762048	; 0x1c000000
33f84b94:	33f964fc 	mvnccs	r6, #-67108864	; 0xfc000000

33f84b98 <k_data_init>:
33f84b98:	e59f2018 	ldr	r2, [pc, #24]	; 33f84bb8 <.text+0x4bb8>
33f84b9c:	e3a03000 	mov	r3, #0	; 0x0
33f84ba0:	e52de004 	str	lr, [sp, #-4]!
33f84ba4:	e5823000 	str	r3, [r2]
33f84ba8:	e59f300c 	ldr	r3, [pc, #12]	; 33f84bbc <.text+0x4bbc>
33f84bac:	e1a0e00f 	mov	lr, pc
33f84bb0:	e593f000 	ldr	pc, [r3]
33f84bb4:	e49df004 	ldr	pc, [sp], #4
33f84bb8:	33f9657c 	mvnccs	r6, #520093696	; 0x1f000000
33f84bbc:	33f9652c 	mvnccs	r6, #184549376	; 0xb000000

33f84bc0 <k_data_save>:
33f84bc0:	e59f303c 	ldr	r3, [pc, #60]	; 33f84c04 <.text+0x4c04>
33f84bc4:	e5932000 	ldr	r2, [r3]
33f84bc8:	e59f3038 	ldr	r3, [pc, #56]	; 33f84c08 <.text+0x4c08>
33f84bcc:	e5931000 	ldr	r1, [r3]
33f84bd0:	e59f3034 	ldr	r3, [pc, #52]	; 33f84c0c <.text+0x4c0c>
33f84bd4:	e5930000 	ldr	r0, [r3]
33f84bd8:	e59f3030 	ldr	r3, [pc, #48]	; 33f84c10 <.text+0x4c10>
33f84bdc:	e593c000 	ldr	ip, [r3]
33f84be0:	e59f302c 	ldr	r3, [pc, #44]	; 33f84c14 <.text+0x4c14>
33f84be4:	e5832000 	str	r2, [r3]
33f84be8:	e59f3028 	ldr	r3, [pc, #40]	; 33f84c18 <.text+0x4c18>
33f84bec:	e5831000 	str	r1, [r3]
33f84bf0:	e59f3024 	ldr	r3, [pc, #36]	; 33f84c1c <.text+0x4c1c>
33f84bf4:	e5830000 	str	r0, [r3]
33f84bf8:	e59f3020 	ldr	r3, [pc, #32]	; 33f84c20 <.text+0x4c20>
33f84bfc:	e583c000 	str	ip, [r3]
33f84c00:	e1a0f00e 	mov	pc, lr
33f84c04:	33f9657c 	mvnccs	r6, #520093696	; 0x1f000000
33f84c08:	33f96564 	mvnccs	r6, #419430400	; 0x19000000
33f84c0c:	33f964fc 	mvnccs	r6, #-67108864	; 0xfc000000
33f84c10:	33f96570 	mvnccs	r6, #469762048	; 0x1c000000
33f84c14:	33f96580 	mvnccs	r6, #536870912	; 0x20000000
33f84c18:	33f96568 	mvnccs	r6, #436207616	; 0x1a000000
33f84c1c:	33f9656c 	mvnccs	r6, #452984832	; 0x1b000000
33f84c20:	33f96574 	mvnccs	r6, #486539264	; 0x1d000000

33f84c24 <k_data_restore>:
33f84c24:	e59f303c 	ldr	r3, [pc, #60]	; 33f84c68 <.text+0x4c68>
33f84c28:	e5932000 	ldr	r2, [r3]
33f84c2c:	e59f3038 	ldr	r3, [pc, #56]	; 33f84c6c <.text+0x4c6c>
33f84c30:	e5931000 	ldr	r1, [r3]
33f84c34:	e59f3034 	ldr	r3, [pc, #52]	; 33f84c70 <.text+0x4c70>
33f84c38:	e5930000 	ldr	r0, [r3]
33f84c3c:	e59f3030 	ldr	r3, [pc, #48]	; 33f84c74 <.text+0x4c74>
33f84c40:	e593c000 	ldr	ip, [r3]
33f84c44:	e59f302c 	ldr	r3, [pc, #44]	; 33f84c78 <.text+0x4c78>
33f84c48:	e5832000 	str	r2, [r3]
33f84c4c:	e59f3028 	ldr	r3, [pc, #40]	; 33f84c7c <.text+0x4c7c>
33f84c50:	e5831000 	str	r1, [r3]
33f84c54:	e59f3024 	ldr	r3, [pc, #36]	; 33f84c80 <.text+0x4c80>
33f84c58:	e5830000 	str	r0, [r3]
33f84c5c:	e59f3020 	ldr	r3, [pc, #32]	; 33f84c84 <.text+0x4c84>
33f84c60:	e583c000 	str	ip, [r3]
33f84c64:	e1a0f00e 	mov	pc, lr
33f84c68:	33f96580 	mvnccs	r6, #536870912	; 0x20000000
33f84c6c:	33f96568 	mvnccs	r6, #436207616	; 0x1a000000
33f84c70:	33f9656c 	mvnccs	r6, #452984832	; 0x1b000000
33f84c74:	33f96574 	mvnccs	r6, #486539264	; 0x1d000000
33f84c78:	33f9657c 	mvnccs	r6, #520093696	; 0x1f000000
33f84c7c:	33f96564 	mvnccs	r6, #419430400	; 0x19000000
33f84c80:	33f964fc 	mvnccs	r6, #-67108864	; 0xfc000000
33f84c84:	33f96570 	mvnccs	r6, #469762048	; 0x1c000000

33f84c88 <k_data_char>:
33f84c88:	e92d4010 	stmdb	sp!, {r4, lr}
33f84c8c:	e59f4058 	ldr	r4, [pc, #88]	; 33f84cec <.text+0x4cec>
33f84c90:	e5943000 	ldr	r3, [r4]
33f84c94:	e20020ff 	and	r2, r0, #255	; 0xff
33f84c98:	e3530000 	cmp	r3, #0	; 0x0
33f84c9c:	e1a00002 	mov	r0, r2
33f84ca0:	0a000005 	beq	33f84cbc <k_data_char+0x34>
33f84ca4:	ebffff87 	bl	33f84ac8 <ktrans>
33f84ca8:	e59f3040 	ldr	r3, [pc, #64]	; 33f84cf0 <.text+0x4cf0>
33f84cac:	e1a0e00f 	mov	lr, pc
33f84cb0:	e593f000 	ldr	pc, [r3]
33f84cb4:	e3a03000 	mov	r3, #0	; 0x0
33f84cb8:	ea000005 	b	33f84cd4 <k_data_char+0x4c>
33f84cbc:	e59f3030 	ldr	r3, [pc, #48]	; 33f84cf4 <.text+0x4cf4>
33f84cc0:	e5d33000 	ldrb	r3, [r3]
33f84cc4:	e1530002 	cmp	r3, r2
33f84cc8:	e1a00002 	mov	r0, r2
33f84ccc:	1a000002 	bne	33f84cdc <k_data_char+0x54>
33f84cd0:	e3a03001 	mov	r3, #1	; 0x1
33f84cd4:	e5843000 	str	r3, [r4]
33f84cd8:	e8bd8010 	ldmia	sp!, {r4, pc}
33f84cdc:	e59f300c 	ldr	r3, [pc, #12]	; 33f84cf0 <.text+0x4cf0>
33f84ce0:	e1a0e00f 	mov	lr, pc
33f84ce4:	e593f000 	ldr	pc, [r3]
33f84ce8:	e8bd8010 	ldmia	sp!, {r4, pc}
33f84cec:	33f9657c 	mvnccs	r6, #520093696	; 0x1f000000
33f84cf0:	33f96530 	mvnccs	r6, #201326592	; 0xc000000
33f84cf4:	33f96529 	mvnccs	r6, #171966464	; 0xa400000

33f84cf8 <send_pad>:
33f84cf8:	e92d4010 	stmdb	sp!, {r4, lr}
33f84cfc:	e59f3020 	ldr	r3, [pc, #32]	; 33f84d24 <.text+0x4d24>
33f84d00:	e5934000 	ldr	r4, [r3]
33f84d04:	ea000002 	b	33f84d14 <send_pad+0x1c>
33f84d08:	e59f3018 	ldr	r3, [pc, #24]	; 33f84d28 <.text+0x4d28>
33f84d0c:	e5d30000 	ldrb	r0, [r3]
33f84d10:	eb000c58 	bl	33f87e78 <putc>
33f84d14:	e3540000 	cmp	r4, #0	; 0x0
33f84d18:	e2444001 	sub	r4, r4, #1	; 0x1
33f84d1c:	cafffff9 	bgt	33f84d08 <send_pad+0x10>
33f84d20:	e8bd8010 	ldmia	sp!, {r4, pc}
33f84d24:	33f96524 	mvnccs	r6, #150994944	; 0x9000000
33f84d28:	33f96528 	mvnccs	r6, #167772160	; 0xa000000

33f84d2c <s1_sendpacket>:
33f84d2c:	e92d4010 	stmdb	sp!, {r4, lr}
33f84d30:	e1a04000 	mov	r4, r0
33f84d34:	ebffffef 	bl	33f84cf8 <send_pad>
33f84d38:	ea000000 	b	33f84d40 <s1_sendpacket+0x14>
33f84d3c:	eb000c4d 	bl	33f87e78 <putc>
33f84d40:	e5d43000 	ldrb	r3, [r4]
33f84d44:	e3530000 	cmp	r3, #0	; 0x0
33f84d48:	e1a00003 	mov	r0, r3
33f84d4c:	e2844001 	add	r4, r4, #1	; 0x1
33f84d50:	1afffff9 	bne	33f84d3c <s1_sendpacket+0x10>
33f84d54:	e8bd8010 	ldmia	sp!, {r4, pc}

33f84d58 <handle_send_packet>:
33f84d58:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f84d5c:	e59f11e8 	ldr	r1, [pc, #488]	; 33f84f4c <.text+0x4f4c>
33f84d60:	e59f31e8 	ldr	r3, [pc, #488]	; 33f84f50 <.text+0x4f50>
33f84d64:	e5912000 	ldr	r2, [r1]
33f84d68:	e59fc1e4 	ldr	ip, [pc, #484]	; 33f84f54 <.text+0x4f54>
33f84d6c:	e59f91e4 	ldr	r9, [pc, #484]	; 33f84f58 <.text+0x4f58>
33f84d70:	e1520003 	cmp	r2, r3
33f84d74:	e59fb1e0 	ldr	fp, [pc, #480]	; 33f84f5c <.text+0x4f5c>
33f84d78:	e3a02000 	mov	r2, #0	; 0x0
33f84d7c:	e3a0300d 	mov	r3, #13	; 0xd
33f84d80:	e5c92000 	strb	r2, [r9]
33f84d84:	e58c2000 	str	r2, [ip]
33f84d88:	e59f21d0 	ldr	r2, [pc, #464]	; 33f84f60 <.text+0x4f60>
33f84d8c:	e5cb3000 	strb	r3, [fp]
33f84d90:	e3a03023 	mov	r3, #35	; 0x23
33f84d94:	e5c23000 	strb	r3, [r2]
33f84d98:	059f31c4 	ldreq	r3, [pc, #452]	; 33f84f64 <.text+0x4f64>
33f84d9c:	05813000 	streq	r3, [r1]
33f84da0:	e59f61c0 	ldr	r6, [pc, #448]	; 33f84f68 <.text+0x4f68>
33f84da4:	e5913000 	ldr	r3, [r1]
33f84da8:	e0662003 	rsb	r2, r6, r3
33f84dac:	e24dd004 	sub	sp, sp, #4	; 0x4
33f84db0:	e3520000 	cmp	r2, #0	; 0x0
33f84db4:	e58d0000 	str	r0, [sp]
33f84db8:	d3a02003 	movle	r2, #3	; 0x3
33f84dbc:	da000047 	ble	33f84ee0 <handle_send_packet+0x188>
33f84dc0:	e2422001 	sub	r2, r2, #1	; 0x1
33f84dc4:	e59f41a0 	ldr	r4, [pc, #416]	; 33f84f6c <.text+0x4f6c>
33f84dc8:	e3520000 	cmp	r2, #0	; 0x0
33f84dcc:	e3a0707e 	mov	r7, #126	; 0x7e
33f84dd0:	e5c47004 	strb	r7, [r4, #4]
33f84dd4:	d3a02004 	movle	r2, #4	; 0x4
33f84dd8:	da000040 	ble	33f84ee0 <handle_send_packet+0x188>
33f84ddc:	e2422001 	sub	r2, r2, #1	; 0x1
33f84de0:	e3520000 	cmp	r2, #0	; 0x0
33f84de4:	e3a03021 	mov	r3, #33	; 0x21
33f84de8:	e5c43005 	strb	r3, [r4, #5]
33f84dec:	d3a02005 	movle	r2, #5	; 0x5
33f84df0:	da00003a 	ble	33f84ee0 <handle_send_packet+0x188>
33f84df4:	e5d63002 	ldrb	r3, [r6, #2]
33f84df8:	e2422001 	sub	r2, r2, #1	; 0x1
33f84dfc:	e2433020 	sub	r3, r3, #32	; 0x20
33f84e00:	e20330ff 	and	r3, r3, #255	; 0xff
33f84e04:	e3520000 	cmp	r2, #0	; 0x0
33f84e08:	e3a0a020 	mov	sl, #32	; 0x20
33f84e0c:	e58c3000 	str	r3, [ip]
33f84e10:	e5c4a006 	strb	sl, [r4, #6]
33f84e14:	d3a02006 	movle	r2, #6	; 0x6
33f84e18:	da000030 	ble	33f84ee0 <handle_send_packet+0x188>
33f84e1c:	e5d60003 	ldrb	r0, [r6, #3]
33f84e20:	e2425001 	sub	r5, r2, #1	; 0x1
33f84e24:	ebffff27 	bl	33f84ac8 <ktrans>
33f84e28:	e3550000 	cmp	r5, #0	; 0x0
33f84e2c:	e3a03040 	mov	r3, #64	; 0x40
33f84e30:	e5c90000 	strb	r0, [r9]
33f84e34:	e5c43007 	strb	r3, [r4, #7]
33f84e38:	d3a02007 	movle	r2, #7	; 0x7
33f84e3c:	da000027 	ble	33f84ee0 <handle_send_packet+0x188>
33f84e40:	e5d63004 	ldrb	r3, [r6, #4]
33f84e44:	e2452001 	sub	r2, r5, #1	; 0x1
33f84e48:	e2433020 	sub	r3, r3, #32	; 0x20
33f84e4c:	e3520000 	cmp	r2, #0	; 0x0
33f84e50:	e5cb3000 	strb	r3, [fp]
33f84e54:	e3a0302d 	mov	r3, #45	; 0x2d
33f84e58:	e5c43008 	strb	r3, [r4, #8]
33f84e5c:	d3a02008 	movle	r2, #8	; 0x8
33f84e60:	da00001e 	ble	33f84ee0 <handle_send_packet+0x188>
33f84e64:	e5d63005 	ldrb	r3, [r6, #5]
33f84e68:	e59f10f0 	ldr	r1, [pc, #240]	; 33f84f60 <.text+0x4f60>
33f84e6c:	e2422001 	sub	r2, r2, #1	; 0x1
33f84e70:	e3520000 	cmp	r2, #0	; 0x0
33f84e74:	e5c13000 	strb	r3, [r1]
33f84e78:	e3a03023 	mov	r3, #35	; 0x23
33f84e7c:	e5c43009 	strb	r3, [r4, #9]
33f84e80:	d3a02009 	movle	r2, #9	; 0x9
33f84e84:	da000015 	ble	33f84ee0 <handle_send_packet+0x188>
33f84e88:	e2422001 	sub	r2, r2, #1	; 0x1
33f84e8c:	e3520000 	cmp	r2, #0	; 0x0
33f84e90:	e3a0104e 	mov	r1, #78	; 0x4e
33f84e94:	e5c4100a 	strb	r1, [r4, #10]
33f84e98:	d3a0200a 	movle	r2, #10	; 0xa
33f84e9c:	da00000f 	ble	33f84ee0 <handle_send_packet+0x188>
33f84ea0:	e2422001 	sub	r2, r2, #1	; 0x1
33f84ea4:	e3520000 	cmp	r2, #0	; 0x0
33f84ea8:	e3a03031 	mov	r3, #49	; 0x31
33f84eac:	e5c4300b 	strb	r3, [r4, #11]
33f84eb0:	d3a0200b 	movle	r2, #11	; 0xb
33f84eb4:	da000009 	ble	33f84ee0 <handle_send_packet+0x188>
33f84eb8:	e2423001 	sub	r3, r2, #1	; 0x1
33f84ebc:	e3530000 	cmp	r3, #0	; 0x0
33f84ec0:	c3a03022 	movgt	r3, #34	; 0x22
33f84ec4:	e5c4100c 	strb	r1, [r4, #12]
33f84ec8:	c5c47010 	strgtb	r7, [r4, #16]
33f84ecc:	c5c4300d 	strgtb	r3, [r4, #13]
33f84ed0:	c5c4a00e 	strgtb	sl, [r4, #14]
33f84ed4:	c5c4700f 	strgtb	r7, [r4, #15]
33f84ed8:	d3a0200c 	movle	r2, #12	; 0xc
33f84edc:	c3a02010 	movgt	r2, #16	; 0x10
33f84ee0:	e59d3000 	ldr	r3, [sp]
33f84ee4:	e59f4080 	ldr	r4, [pc, #128]	; 33f84f6c <.text+0x4f6c>
33f84ee8:	e2831020 	add	r1, r3, #32	; 0x20
33f84eec:	e3a03001 	mov	r3, #1	; 0x1
33f84ef0:	e2825001 	add	r5, r2, #1	; 0x1
33f84ef4:	e5c43000 	strb	r3, [r4]
33f84ef8:	e2822020 	add	r2, r2, #32	; 0x20
33f84efc:	e3a06000 	mov	r6, #0	; 0x0
33f84f00:	e2833058 	add	r3, r3, #88	; 0x58
33f84f04:	e2840001 	add	r0, r4, #1	; 0x1
33f84f08:	e5c42001 	strb	r2, [r4, #1]
33f84f0c:	e5c41002 	strb	r1, [r4, #2]
33f84f10:	e5c43003 	strb	r3, [r4, #3]
33f84f14:	e7c46005 	strb	r6, [r4, r5]
33f84f18:	ebfffef4 	bl	33f84af0 <chk1>
33f84f1c:	e59f3038 	ldr	r3, [pc, #56]	; 33f84f5c <.text+0x4f5c>
33f84f20:	e2851001 	add	r1, r5, #1	; 0x1
33f84f24:	e5d3c000 	ldrb	ip, [r3]
33f84f28:	e0812004 	add	r2, r1, r4
33f84f2c:	e2803020 	add	r3, r0, #32	; 0x20
33f84f30:	e1a00004 	mov	r0, r4
33f84f34:	e7c43005 	strb	r3, [r4, r5]
33f84f38:	e7c4c001 	strb	ip, [r4, r1]
33f84f3c:	e5c26001 	strb	r6, [r2, #1]
33f84f40:	e28dd004 	add	sp, sp, #4	; 0x4
33f84f44:	e8bd4ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f84f48:	eaffff77 	b	33f84d2c <s1_sendpacket>
33f84f4c:	33f96548 	mvnccs	r6, #301989888	; 0x12000000
33f84f50:	33f96547 	mvnccs	r6, #297795584	; 0x11c00000
33f84f54:	33f96524 	mvnccs	r6, #150994944	; 0x9000000
33f84f58:	33f96528 	mvnccs	r6, #167772160	; 0xa000000
33f84f5c:	33f96520 	mvnccs	r6, #134217728	; 0x8000000
33f84f60:	33f96529 	mvnccs	r6, #171966464	; 0xa400000
33f84f64:	33f96546 	mvnccs	r6, #293601280	; 0x11800000
33f84f68:	33f96534 	mvnccs	r6, #218103808	; 0xd000000
33f84f6c:	33f9654c 	mvnccs	r6, #318767104	; 0x13000000

33f84f70 <send_nack>:
33f84f70:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f84f74:	e59f4050 	ldr	r4, [pc, #80]	; 33f84fcc <.text+0x4fcc>
33f84f78:	e3a03001 	mov	r3, #1	; 0x1
33f84f7c:	e5c43000 	strb	r3, [r4]
33f84f80:	e2833022 	add	r3, r3, #34	; 0x22
33f84f84:	e2802020 	add	r2, r0, #32	; 0x20
33f84f88:	e3a05000 	mov	r5, #0	; 0x0
33f84f8c:	e5c43001 	strb	r3, [r4, #1]
33f84f90:	e2840001 	add	r0, r4, #1	; 0x1
33f84f94:	e283302b 	add	r3, r3, #43	; 0x2b
33f84f98:	e5c42002 	strb	r2, [r4, #2]
33f84f9c:	e5c43003 	strb	r3, [r4, #3]
33f84fa0:	e5c45004 	strb	r5, [r4, #4]
33f84fa4:	ebfffed1 	bl	33f84af0 <chk1>
33f84fa8:	e59f3020 	ldr	r3, [pc, #32]	; 33f84fd0 <.text+0x4fd0>
33f84fac:	e5d32000 	ldrb	r2, [r3]
33f84fb0:	e2803020 	add	r3, r0, #32	; 0x20
33f84fb4:	e1a00004 	mov	r0, r4
33f84fb8:	e5c43004 	strb	r3, [r4, #4]
33f84fbc:	e5c42005 	strb	r2, [r4, #5]
33f84fc0:	e5c45006 	strb	r5, [r4, #6]
33f84fc4:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
33f84fc8:	eaffff57 	b	33f84d2c <s1_sendpacket>
33f84fcc:	33f9654c 	mvnccs	r6, #318767104	; 0x13000000
33f84fd0:	33f96520 	mvnccs	r6, #134217728	; 0x8000000

33f84fd4 <send_ack>:
33f84fd4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f84fd8:	e59f4050 	ldr	r4, [pc, #80]	; 33f85030 <.text+0x5030>
33f84fdc:	e3a03001 	mov	r3, #1	; 0x1
33f84fe0:	e5c43000 	strb	r3, [r4]
33f84fe4:	e2833022 	add	r3, r3, #34	; 0x22
33f84fe8:	e2802020 	add	r2, r0, #32	; 0x20
33f84fec:	e3a05000 	mov	r5, #0	; 0x0
33f84ff0:	e5c43001 	strb	r3, [r4, #1]
33f84ff4:	e2840001 	add	r0, r4, #1	; 0x1
33f84ff8:	e2833036 	add	r3, r3, #54	; 0x36
33f84ffc:	e5c42002 	strb	r2, [r4, #2]
33f85000:	e5c43003 	strb	r3, [r4, #3]
33f85004:	e5c45004 	strb	r5, [r4, #4]
33f85008:	ebfffeb8 	bl	33f84af0 <chk1>
33f8500c:	e59f3020 	ldr	r3, [pc, #32]	; 33f85034 <.text+0x5034>
33f85010:	e5d32000 	ldrb	r2, [r3]
33f85014:	e2803020 	add	r3, r0, #32	; 0x20
33f85018:	e1a00004 	mov	r0, r4
33f8501c:	e5c43004 	strb	r3, [r4, #4]
33f85020:	e5c42005 	strb	r2, [r4, #5]
33f85024:	e5c45006 	strb	r5, [r4, #6]
33f85028:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
33f8502c:	eaffff3e 	b	33f84d2c <s1_sendpacket>
33f85030:	33f9654c 	mvnccs	r6, #318767104	; 0x13000000
33f85034:	33f96520 	mvnccs	r6, #134217728	; 0x8000000

33f85038 <getcxmodem>:
33f85038:	e52de004 	str	lr, [sp, #-4]!
33f8503c:	eb000b97 	bl	33f87ea0 <tstc>
33f85040:	e3500000 	cmp	r0, #0	; 0x0
33f85044:	0a000001 	beq	33f85050 <getcxmodem+0x18>
33f85048:	e49de004 	ldr	lr, [sp], #4
33f8504c:	ea000b99 	b	33f87eb8 <getc>
33f85050:	e3e00000 	mvn	r0, #0	; 0x0
33f85054:	e49df004 	ldr	pc, [sp], #4

33f85058 <do_load_serial_bin>:
33f85058:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8505c:	e24ddd11 	sub	sp, sp, #1088	; 0x440
33f85060:	e24dd004 	sub	sp, sp, #4	; 0x4
33f85064:	e59f05f0 	ldr	r0, [pc, #1520]	; 33f8565c <.text+0x565c>
33f85068:	e1a05002 	mov	r5, r2
33f8506c:	e1a04003 	mov	r4, r3
33f85070:	eb0007c7 	bl	33f86f94 <getenv>
33f85074:	e3500000 	cmp	r0, #0	; 0x0
33f85078:	059f25e0 	ldreq	r2, [pc, #1504]	; 33f85660 <.text+0x5660>
33f8507c:	058d2000 	streq	r2, [sp]
33f85080:	0a000003 	beq	33f85094 <do_load_serial_bin+0x3c>
33f85084:	e3a01000 	mov	r1, #0	; 0x0
33f85088:	e3a02010 	mov	r2, #16	; 0x10
33f8508c:	eb0016ed 	bl	33f8ac48 <simple_strtoul>
33f85090:	e58d0000 	str	r0, [sp]
33f85094:	e5983008 	ldr	r3, [r8, #8]
33f85098:	e3550001 	cmp	r5, #1	; 0x1
33f8509c:	e58d3008 	str	r3, [sp, #8]
33f850a0:	da000004 	ble	33f850b8 <do_load_serial_bin+0x60>
33f850a4:	e5940004 	ldr	r0, [r4, #4]
33f850a8:	e3a01000 	mov	r1, #0	; 0x0
33f850ac:	e3a02010 	mov	r2, #16	; 0x10
33f850b0:	eb0016e4 	bl	33f8ac48 <simple_strtoul>
33f850b4:	e58d0000 	str	r0, [sp]
33f850b8:	e3550003 	cmp	r5, #3	; 0x3
33f850bc:	1a000159 	bne	33f85628 <do_load_serial_bin+0x5d0>
33f850c0:	e5940008 	ldr	r0, [r4, #8]
33f850c4:	e3a01000 	mov	r1, #0	; 0x0
33f850c8:	e3a0200a 	mov	r2, #10	; 0xa
33f850cc:	eb0016dd 	bl	33f8ac48 <simple_strtoul>
33f850d0:	e3500000 	cmp	r0, #0	; 0x0
33f850d4:	0a000153 	beq	33f85628 <do_load_serial_bin+0x5d0>
33f850d8:	e59d3008 	ldr	r3, [sp, #8]
33f850dc:	e1500003 	cmp	r0, r3
33f850e0:	e58d0004 	str	r0, [sp, #4]
33f850e4:	0a00000c 	beq	33f8511c <do_load_serial_bin+0xc4>
33f850e8:	e1a01000 	mov	r1, r0
33f850ec:	e59f0570 	ldr	r0, [pc, #1392]	; 33f85664 <.text+0x5664>
33f850f0:	eb000ada 	bl	33f87c60 <printf>
33f850f4:	e59f056c 	ldr	r0, [pc, #1388]	; 33f85668 <.text+0x5668>
33f850f8:	ebffede8 	bl	33f808a0 <udelay>
33f850fc:	e59d2004 	ldr	r2, [sp, #4]
33f85100:	e5882008 	str	r2, [r8, #8]
33f85104:	eb0024cc 	bl	33f8e43c <serial_setbrg>
33f85108:	e59f0558 	ldr	r0, [pc, #1368]	; 33f85668 <.text+0x5668>
33f8510c:	ebffede3 	bl	33f808a0 <udelay>
33f85110:	eb000b68 	bl	33f87eb8 <getc>
33f85114:	e350000d 	cmp	r0, #13	; 0xd
33f85118:	1afffffc 	bne	33f85110 <do_load_serial_bin+0xb8>
33f8511c:	e5940000 	ldr	r0, [r4]
33f85120:	e59f1544 	ldr	r1, [pc, #1348]	; 33f8566c <.text+0x566c>
33f85124:	eb0015a9 	bl	33f8a7d0 <strcmp>
33f85128:	e3500000 	cmp	r0, #0	; 0x0
33f8512c:	1a000039 	bne	33f85218 <do_load_serial_bin+0x1c0>
33f85130:	e59f0538 	ldr	r0, [pc, #1336]	; 33f85670 <.text+0x5670>
33f85134:	e89d0006 	ldmia	sp, {r1, r2}
33f85138:	eb000ac8 	bl	33f87c60 <printf>
33f8513c:	e28d0e43 	add	r0, sp, #1072	; 0x430
33f85140:	e3a03002 	mov	r3, #2	; 0x2
33f85144:	e2800004 	add	r0, r0, #4	; 0x4
33f85148:	e28d1d11 	add	r1, sp, #1088	; 0x440
33f8514c:	e58d3438 	str	r3, [sp, #1080]
33f85150:	eb00149a 	bl	33f8a3c0 <xyzModem_stream_open>
33f85154:	e3500000 	cmp	r0, #0	; 0x0
33f85158:	01a05000 	moveq	r5, r0
33f8515c:	01a06005 	moveq	r6, r5
33f85160:	0a000002 	beq	33f85170 <do_load_serial_bin+0x118>
33f85164:	ea00000f 	b	33f851a8 <do_load_serial_bin+0x150>
33f85168:	e085500c 	add	r5, r5, ip
33f8516c:	eb001651 	bl	33f8aab8 <memcpy>
33f85170:	e28d4014 	add	r4, sp, #20	; 0x14
33f85174:	e3a01b01 	mov	r1, #1024	; 0x400
33f85178:	e28d2d11 	add	r2, sp, #1088	; 0x440
33f8517c:	e1a00004 	mov	r0, r4
33f85180:	eb0013eb 	bl	33f8a134 <xyzModem_stream_read>
33f85184:	e59d2000 	ldr	r2, [sp]
33f85188:	e250c000 	subs	ip, r0, #0	; 0x0
33f8518c:	e0863002 	add	r3, r6, r2
33f85190:	e1a01004 	mov	r1, r4
33f85194:	e1a0200c 	mov	r2, ip
33f85198:	e1a00003 	mov	r0, r3
33f8519c:	e086600c 	add	r6, r6, ip
33f851a0:	cafffff0 	bgt	33f85168 <do_load_serial_bin+0x110>
33f851a4:	ea000005 	b	33f851c0 <do_load_serial_bin+0x168>
33f851a8:	e59d0440 	ldr	r0, [sp, #1088]
33f851ac:	eb0012a5 	bl	33f89c48 <xyzModem_error>
33f851b0:	e1a01000 	mov	r1, r0
33f851b4:	e59f04b8 	ldr	r0, [pc, #1208]	; 33f85674 <.text+0x5674>
33f851b8:	eb000aa8 	bl	33f87c60 <printf>
33f851bc:	e3a05000 	mov	r5, #0	; 0x0
33f851c0:	e28d0d11 	add	r0, sp, #1088	; 0x440
33f851c4:	eb0012c6 	bl	33f89ce4 <xyzModem_stream_close>
33f851c8:	e3a00000 	mov	r0, #0	; 0x0
33f851cc:	e59f14a4 	ldr	r1, [pc, #1188]	; 33f85678 <.text+0x5678>
33f851d0:	eb0012fc 	bl	33f89dc8 <xyzModem_stream_terminate>
33f851d4:	e28d4e41 	add	r4, sp, #1040	; 0x410
33f851d8:	e59d0000 	ldr	r0, [sp]
33f851dc:	e1a01005 	mov	r1, r5
33f851e0:	eb0028f9 	bl	33f8f5cc <flush_cache>
33f851e4:	e2844004 	add	r4, r4, #4	; 0x4
33f851e8:	e1a01005 	mov	r1, r5
33f851ec:	e1a02005 	mov	r2, r5
33f851f0:	e59f0484 	ldr	r0, [pc, #1156]	; 33f8567c <.text+0x567c>
33f851f4:	eb000a99 	bl	33f87c60 <printf>
33f851f8:	e1a02005 	mov	r2, r5
33f851fc:	e59f147c 	ldr	r1, [pc, #1148]	; 33f85680 <.text+0x5680>
33f85200:	e1a00004 	mov	r0, r4
33f85204:	eb001879 	bl	33f8b3f0 <sprintf>
33f85208:	e1a01004 	mov	r1, r4
33f8520c:	e59f0470 	ldr	r0, [pc, #1136]	; 33f85684 <.text+0x5684>
33f85210:	eb0008a9 	bl	33f874bc <setenv>
33f85214:	ea0000f0 	b	33f855dc <do_load_serial_bin+0x584>
33f85218:	e59f0468 	ldr	r0, [pc, #1128]	; 33f85688 <.text+0x5688>
33f8521c:	e89d0006 	ldmia	sp, {r1, r2}
33f85220:	eb000a8e 	bl	33f87c60 <printf>
33f85224:	e59f2460 	ldr	r2, [pc, #1120]	; 33f8568c <.text+0x568c>
33f85228:	e59f3460 	ldr	r3, [pc, #1120]	; 33f85690 <.text+0x5690>
33f8522c:	e5832000 	str	r2, [r3]
33f85230:	e59f245c 	ldr	r2, [pc, #1116]	; 33f85694 <.text+0x5694>
33f85234:	e59f345c 	ldr	r3, [pc, #1116]	; 33f85698 <.text+0x5698>
33f85238:	e5832000 	str	r2, [r3]
33f8523c:	e59f3458 	ldr	r3, [pc, #1112]	; 33f8569c <.text+0x569c>
33f85240:	e3a0200d 	mov	r2, #13	; 0xd
33f85244:	e5c32000 	strb	r2, [r3]
33f85248:	e59f3450 	ldr	r3, [pc, #1104]	; 33f856a0 <.text+0x56a0>
33f8524c:	e2822016 	add	r2, r2, #22	; 0x16
33f85250:	e5c32000 	strb	r2, [r3]
33f85254:	e59d2000 	ldr	r2, [sp]
33f85258:	e59f3444 	ldr	r3, [pc, #1092]	; 33f856a4 <.text+0x56a4>
33f8525c:	e5832000 	str	r2, [r3]
33f85260:	e59f3440 	ldr	r3, [pc, #1088]	; 33f856a8 <.text+0x56a8>
33f85264:	e3a04000 	mov	r4, #0	; 0x0
33f85268:	e5834000 	str	r4, [r3]
33f8526c:	e59f3438 	ldr	r3, [pc, #1080]	; 33f856ac <.text+0x56ac>
33f85270:	e5c34000 	strb	r4, [r3]
33f85274:	ebfffe47 	bl	33f84b98 <k_data_init>
33f85278:	e59f3430 	ldr	r3, [pc, #1072]	; 33f856b0 <.text+0x56b0>
33f8527c:	e5932000 	ldr	r2, [r3]
33f85280:	e59f342c 	ldr	r3, [pc, #1068]	; 33f856b4 <.text+0x56b4>
33f85284:	e5931000 	ldr	r1, [r3]
33f85288:	e59f3428 	ldr	r3, [pc, #1064]	; 33f856b8 <.text+0x56b8>
33f8528c:	e5930000 	ldr	r0, [r3]
33f85290:	e59f3424 	ldr	r3, [pc, #1060]	; 33f856bc <.text+0x56bc>
33f85294:	e593c000 	ldr	ip, [r3]
33f85298:	e59f3420 	ldr	r3, [pc, #1056]	; 33f856c0 <.text+0x56c0>
33f8529c:	e5832000 	str	r2, [r3]
33f852a0:	e59f341c 	ldr	r3, [pc, #1052]	; 33f856c4 <.text+0x56c4>
33f852a4:	e5831000 	str	r1, [r3]
33f852a8:	e59f3418 	ldr	r3, [pc, #1048]	; 33f856c8 <.text+0x56c8>
33f852ac:	e5830000 	str	r0, [r3]
33f852b0:	e59f3414 	ldr	r3, [pc, #1044]	; 33f856cc <.text+0x56cc>
33f852b4:	e583c000 	str	ip, [r3]
33f852b8:	e1a0b004 	mov	fp, r4
33f852bc:	e3e05000 	mvn	r5, #0	; 0x0
33f852c0:	e59f2408 	ldr	r2, [pc, #1032]	; 33f856d0 <.text+0x56d0>
33f852c4:	e59f3408 	ldr	r3, [pc, #1032]	; 33f856d4 <.text+0x56d4>
33f852c8:	e5832000 	str	r2, [r3]
33f852cc:	eb000af9 	bl	33f87eb8 <getc>
33f852d0:	e3500001 	cmp	r0, #1	; 0x1
33f852d4:	0a000002 	beq	33f852e4 <do_load_serial_bin+0x28c>
33f852d8:	e3500003 	cmp	r0, #3	; 0x3
33f852dc:	0a000095 	beq	33f85538 <do_load_serial_bin+0x4e0>
33f852e0:	eafffff9 	b	33f852cc <do_load_serial_bin+0x274>
33f852e4:	eb000af3 	bl	33f87eb8 <getc>
33f852e8:	e31000e0 	tst	r0, #224	; 0xe0
33f852ec:	e20000ff 	and	r0, r0, #255	; 0xff
33f852f0:	e58d000c 	str	r0, [sp, #12]
33f852f4:	0a000071 	beq	33f854c0 <do_load_serial_bin+0x468>
33f852f8:	eb000aee 	bl	33f87eb8 <getc>
33f852fc:	e31000e0 	tst	r0, #224	; 0xe0
33f85300:	e20000ff 	and	r0, r0, #255	; 0xff
33f85304:	e58d0010 	str	r0, [sp, #16]
33f85308:	0a00006c 	beq	33f854c0 <do_load_serial_bin+0x468>
33f8530c:	e2403020 	sub	r3, r0, #32	; 0x20
33f85310:	e203b0ff 	and	fp, r3, #255	; 0xff
33f85314:	e15b0005 	cmp	fp, r5
33f85318:	e59f73a0 	ldr	r7, [pc, #928]	; 33f856c0 <.text+0x56c0>
33f8531c:	e59fc38c 	ldr	ip, [pc, #908]	; 33f856b0 <.text+0x56b0>
33f85320:	e59f439c 	ldr	r4, [pc, #924]	; 33f856c4 <.text+0x56c4>
33f85324:	e59fe388 	ldr	lr, [pc, #904]	; 33f856b4 <.text+0x56b4>
33f85328:	e59fa398 	ldr	sl, [pc, #920]	; 33f856c8 <.text+0x56c8>
33f8532c:	e59f5384 	ldr	r5, [pc, #900]	; 33f856b8 <.text+0x56b8>
33f85330:	e59f9394 	ldr	r9, [pc, #916]	; 33f856cc <.text+0x56cc>
33f85334:	e59f6380 	ldr	r6, [pc, #896]	; 33f856bc <.text+0x56bc>
33f85338:	1a000008 	bne	33f85360 <do_load_serial_bin+0x308>
33f8533c:	e5973000 	ldr	r3, [r7]
33f85340:	e5942000 	ldr	r2, [r4]
33f85344:	e59a1000 	ldr	r1, [sl]
33f85348:	e5990000 	ldr	r0, [r9]
33f8534c:	e58c3000 	str	r3, [ip]
33f85350:	e58e2000 	str	r2, [lr]
33f85354:	e5851000 	str	r1, [r5]
33f85358:	e5860000 	str	r0, [r6]
33f8535c:	ea000007 	b	33f85380 <do_load_serial_bin+0x328>
33f85360:	e59c3000 	ldr	r3, [ip]
33f85364:	e59e2000 	ldr	r2, [lr]
33f85368:	e5951000 	ldr	r1, [r5]
33f8536c:	e5960000 	ldr	r0, [r6]
33f85370:	e5873000 	str	r3, [r7]
33f85374:	e5842000 	str	r2, [r4]
33f85378:	e58a1000 	str	r1, [sl]
33f8537c:	e5890000 	str	r0, [r9]
33f85380:	eb000acc 	bl	33f87eb8 <getc>
33f85384:	e31000e0 	tst	r0, #224	; 0xe0
33f85388:	e20070ff 	and	r7, r0, #255	; 0xff
33f8538c:	0a00004a 	beq	33f854bc <do_load_serial_bin+0x464>
33f85390:	e59d200c 	ldr	r2, [sp, #12]
33f85394:	e2423020 	sub	r3, r2, #32	; 0x20
33f85398:	e59d2010 	ldr	r2, [sp, #16]
33f8539c:	e20330ff 	and	r3, r3, #255	; 0xff
33f853a0:	e2435002 	sub	r5, r3, #2	; 0x2
33f853a4:	e0873002 	add	r3, r7, r2
33f853a8:	e59d200c 	ldr	r2, [sp, #12]
33f853ac:	e3750002 	cmn	r5, #2	; 0x2
33f853b0:	e0826003 	add	r6, r2, r3
33f853b4:	1a000030 	bne	33f8547c <do_load_serial_bin+0x424>
33f853b8:	eb000abe 	bl	33f87eb8 <getc>
33f853bc:	e31000e0 	tst	r0, #224	; 0xe0
33f853c0:	e20040ff 	and	r4, r0, #255	; 0xff
33f853c4:	0a00003c 	beq	33f854bc <do_load_serial_bin+0x464>
33f853c8:	eb000aba 	bl	33f87eb8 <getc>
33f853cc:	e31000e0 	tst	r0, #224	; 0xe0
33f853d0:	e20050ff 	and	r5, r0, #255	; 0xff
33f853d4:	0a000038 	beq	33f854bc <do_load_serial_bin+0x464>
33f853d8:	eb000ab6 	bl	33f87eb8 <getc>
33f853dc:	e31000e0 	tst	r0, #224	; 0xe0
33f853e0:	e200c0ff 	and	ip, r0, #255	; 0xff
33f853e4:	0a000034 	beq	33f854bc <do_load_serial_bin+0x464>
33f853e8:	e0863005 	add	r3, r6, r5
33f853ec:	e0840003 	add	r0, r4, r3
33f853f0:	e1a03c00 	mov	r3, r0, lsl #24
33f853f4:	e0803f23 	add	r3, r0, r3, lsr #30
33f853f8:	e203303f 	and	r3, r3, #63	; 0x3f
33f853fc:	e2833020 	add	r3, r3, #32	; 0x20
33f85400:	e15c0003 	cmp	ip, r3
33f85404:	1a00002c 	bne	33f854bc <do_load_serial_bin+0x464>
33f85408:	e2452020 	sub	r2, r5, #32	; 0x20
33f8540c:	e2443020 	sub	r3, r4, #32	; 0x20
33f85410:	e20330ff 	and	r3, r3, #255	; 0xff
33f85414:	e20220ff 	and	r2, r2, #255	; 0xff
33f85418:	e3a0105f 	mov	r1, #95	; 0x5f
33f8541c:	e0252193 	mla	r5, r3, r1, r2
33f85420:	e080600c 	add	r6, r0, ip
33f85424:	ea000014 	b	33f8547c <do_load_serial_bin+0x424>
33f85428:	eb000aa2 	bl	33f87eb8 <getc>
33f8542c:	e31000e0 	tst	r0, #224	; 0xe0
33f85430:	e20040ff 	and	r4, r0, #255	; 0xff
33f85434:	e1a00004 	mov	r0, r4
33f85438:	0a00001f 	beq	33f854bc <do_load_serial_bin+0x464>
33f8543c:	e3570044 	cmp	r7, #68	; 0x44
33f85440:	1a000001 	bne	33f8544c <do_load_serial_bin+0x3f4>
33f85444:	ebfffe0f 	bl	33f84c88 <k_data_char>
33f85448:	ea000009 	b	33f85474 <do_load_serial_bin+0x41c>
33f8544c:	e3570053 	cmp	r7, #83	; 0x53
33f85450:	e59f027c 	ldr	r0, [pc, #636]	; 33f856d4 <.text+0x56d4>
33f85454:	1a000006 	bne	33f85474 <do_load_serial_bin+0x41c>
33f85458:	e5901000 	ldr	r1, [r0]
33f8545c:	e1a03001 	mov	r3, r1
33f85460:	e4c34001 	strb	r4, [r3], #1
33f85464:	e59f226c 	ldr	r2, [pc, #620]	; 33f856d8 <.text+0x56d8>
33f85468:	e1530002 	cmp	r3, r2
33f8546c:	e5803000 	str	r3, [r0]
33f85470:	25801000 	strcs	r1, [r0]
33f85474:	e0866004 	add	r6, r6, r4
33f85478:	e2455001 	sub	r5, r5, #1	; 0x1
33f8547c:	e3550001 	cmp	r5, #1	; 0x1
33f85480:	caffffe8 	bgt	33f85428 <do_load_serial_bin+0x3d0>
33f85484:	eb000a8b 	bl	33f87eb8 <getc>
33f85488:	e31000e0 	tst	r0, #224	; 0xe0
33f8548c:	e20000ff 	and	r0, r0, #255	; 0xff
33f85490:	0a000009 	beq	33f854bc <do_load_serial_bin+0x464>
33f85494:	e1a03c06 	mov	r3, r6, lsl #24
33f85498:	e0863f23 	add	r3, r6, r3, lsr #30
33f8549c:	e203303f 	and	r3, r3, #63	; 0x3f
33f854a0:	e2833020 	add	r3, r3, #32	; 0x20
33f854a4:	e1500003 	cmp	r0, r3
33f854a8:	1a000003 	bne	33f854bc <do_load_serial_bin+0x464>
33f854ac:	eb000a81 	bl	33f87eb8 <getc>
33f854b0:	e20000ff 	and	r0, r0, #255	; 0xff
33f854b4:	e350000d 	cmp	r0, #13	; 0xd
33f854b8:	0a000013 	beq	33f8550c <do_load_serial_bin+0x4b4>
33f854bc:	e1a0500b 	mov	r5, fp
33f854c0:	e59f31f8 	ldr	r3, [pc, #504]	; 33f856c0 <.text+0x56c0>
33f854c4:	e5932000 	ldr	r2, [r3]
33f854c8:	e59f31f4 	ldr	r3, [pc, #500]	; 33f856c4 <.text+0x56c4>
33f854cc:	e5931000 	ldr	r1, [r3]
33f854d0:	e59f31f0 	ldr	r3, [pc, #496]	; 33f856c8 <.text+0x56c8>
33f854d4:	e593c000 	ldr	ip, [r3]
33f854d8:	e59f31ec 	ldr	r3, [pc, #492]	; 33f856cc <.text+0x56cc>
33f854dc:	e593e000 	ldr	lr, [r3]
33f854e0:	e59f31c8 	ldr	r3, [pc, #456]	; 33f856b0 <.text+0x56b0>
33f854e4:	e5832000 	str	r2, [r3]
33f854e8:	e59f31c4 	ldr	r3, [pc, #452]	; 33f856b4 <.text+0x56b4>
33f854ec:	e5831000 	str	r1, [r3]
33f854f0:	e59f31c0 	ldr	r3, [pc, #448]	; 33f856b8 <.text+0x56b8>
33f854f4:	e583c000 	str	ip, [r3]
33f854f8:	e59f31bc 	ldr	r3, [pc, #444]	; 33f856bc <.text+0x56bc>
33f854fc:	e1a0000b 	mov	r0, fp
33f85500:	e583e000 	str	lr, [r3]
33f85504:	ebfffe99 	bl	33f84f70 <send_nack>
33f85508:	eaffff6c 	b	33f852c0 <do_load_serial_bin+0x268>
33f8550c:	e3570053 	cmp	r7, #83	; 0x53
33f85510:	1a000002 	bne	33f85520 <do_load_serial_bin+0x4c8>
33f85514:	e1a0000b 	mov	r0, fp
33f85518:	ebfffe0e 	bl	33f84d58 <handle_send_packet>
33f8551c:	ea000003 	b	33f85530 <do_load_serial_bin+0x4d8>
33f85520:	e1a0000b 	mov	r0, fp
33f85524:	ebfffeaa 	bl	33f84fd4 <send_ack>
33f85528:	e3570042 	cmp	r7, #66	; 0x42
33f8552c:	0a000040 	beq	33f85634 <do_load_serial_bin+0x5dc>
33f85530:	e1a0500b 	mov	r5, fp
33f85534:	eaffff61 	b	33f852c0 <do_load_serial_bin+0x268>
33f85538:	e3a05000 	mov	r5, #0	; 0x0
33f8553c:	e3a04000 	mov	r4, #0	; 0x0
33f85540:	eb000a56 	bl	33f87ea0 <tstc>
33f85544:	e3500000 	cmp	r0, #0	; 0x0
33f85548:	e2844001 	add	r4, r4, #1	; 0x1
33f8554c:	1b000a59 	blne	33f87eb8 <getc>
33f85550:	e3a00ffa 	mov	r0, #1000	; 0x3e8
33f85554:	ebffecd1 	bl	33f808a0 <udelay>
33f85558:	e3540064 	cmp	r4, #100	; 0x64
33f8555c:	1afffff7 	bne	33f85540 <do_load_serial_bin+0x4e8>
33f85560:	e59d0000 	ldr	r0, [sp]
33f85564:	e1a01005 	mov	r1, r5
33f85568:	e28d4e41 	add	r4, sp, #1040	; 0x410
33f8556c:	eb002816 	bl	33f8f5cc <flush_cache>
33f85570:	e2844004 	add	r4, r4, #4	; 0x4
33f85574:	e59f0100 	ldr	r0, [pc, #256]	; 33f8567c <.text+0x567c>
33f85578:	e1a01005 	mov	r1, r5
33f8557c:	e1a02005 	mov	r2, r5
33f85580:	eb0009b6 	bl	33f87c60 <printf>
33f85584:	e1a02005 	mov	r2, r5
33f85588:	e59f10f0 	ldr	r1, [pc, #240]	; 33f85680 <.text+0x5680>
33f8558c:	e1a00004 	mov	r0, r4
33f85590:	eb001796 	bl	33f8b3f0 <sprintf>
33f85594:	e1a01004 	mov	r1, r4
33f85598:	e59f00e4 	ldr	r0, [pc, #228]	; 33f85684 <.text+0x5684>
33f8559c:	eb0007c6 	bl	33f874bc <setenv>
33f855a0:	e59d3000 	ldr	r3, [sp]
33f855a4:	e3730001 	cmn	r3, #1	; 0x1
33f855a8:	e59f412c 	ldr	r4, [pc, #300]	; 33f856dc <.text+0x56dc>
33f855ac:	1a000005 	bne	33f855c8 <do_load_serial_bin+0x570>
33f855b0:	e2833001 	add	r3, r3, #1	; 0x1
33f855b4:	e5843000 	str	r3, [r4]
33f855b8:	e59f0120 	ldr	r0, [pc, #288]	; 33f856e0 <.text+0x56e0>
33f855bc:	eb0009a7 	bl	33f87c60 <printf>
33f855c0:	e3a04001 	mov	r4, #1	; 0x1
33f855c4:	ea000005 	b	33f855e0 <do_load_serial_bin+0x588>
33f855c8:	e59f0114 	ldr	r0, [pc, #276]	; 33f856e4 <.text+0x56e4>
33f855cc:	e59d1000 	ldr	r1, [sp]
33f855d0:	eb0009a2 	bl	33f87c60 <printf>
33f855d4:	e59d2000 	ldr	r2, [sp]
33f855d8:	e5842000 	str	r2, [r4]
33f855dc:	e3a04000 	mov	r4, #0	; 0x0
33f855e0:	e59d3004 	ldr	r3, [sp, #4]
33f855e4:	e59d2008 	ldr	r2, [sp, #8]
33f855e8:	e1530002 	cmp	r3, r2
33f855ec:	0a000016 	beq	33f8564c <do_load_serial_bin+0x5f4>
33f855f0:	e1a01002 	mov	r1, r2
33f855f4:	e59f00ec 	ldr	r0, [pc, #236]	; 33f856e8 <.text+0x56e8>
33f855f8:	eb000998 	bl	33f87c60 <printf>
33f855fc:	e59f0064 	ldr	r0, [pc, #100]	; 33f85668 <.text+0x5668>
33f85600:	ebffeca6 	bl	33f808a0 <udelay>
33f85604:	e59d2008 	ldr	r2, [sp, #8]
33f85608:	e5882008 	str	r2, [r8, #8]
33f8560c:	eb00238a 	bl	33f8e43c <serial_setbrg>
33f85610:	e59f0050 	ldr	r0, [pc, #80]	; 33f85668 <.text+0x5668>
33f85614:	ebffeca1 	bl	33f808a0 <udelay>
33f85618:	eb000a26 	bl	33f87eb8 <getc>
33f8561c:	e350001b 	cmp	r0, #27	; 0x1b
33f85620:	0a000009 	beq	33f8564c <do_load_serial_bin+0x5f4>
33f85624:	eafffffb 	b	33f85618 <do_load_serial_bin+0x5c0>
33f85628:	e59d3008 	ldr	r3, [sp, #8]
33f8562c:	e58d3004 	str	r3, [sp, #4]
33f85630:	eafffeb9 	b	33f8511c <do_load_serial_bin+0xc4>
33f85634:	e59f3080 	ldr	r3, [pc, #128]	; 33f856bc <.text+0x56bc>
33f85638:	e5932000 	ldr	r2, [r3]
33f8563c:	e59f3060 	ldr	r3, [pc, #96]	; 33f856a4 <.text+0x56a4>
33f85640:	e5933000 	ldr	r3, [r3]
33f85644:	e0635002 	rsb	r5, r3, r2
33f85648:	eaffffbb 	b	33f8553c <do_load_serial_bin+0x4e4>
33f8564c:	e1a00004 	mov	r0, r4
33f85650:	e28dd044 	add	sp, sp, #68	; 0x44
33f85654:	e28ddb01 	add	sp, sp, #1024	; 0x400
33f85658:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8565c:	33f92084 	mvnccs	r2, #132	; 0x84
33f85660:	30008000 	andcc	r8, r0, r0
33f85664:	33f93494 	mvnccs	r3, #-1811939328	; 0x94000000
33f85668:	0000c350 	andeq	ip, r0, r0, asr r3
33f8566c:	33f934c8 	mvnccs	r3, #-939524096	; 0xc8000000
33f85670:	33f934d0 	mvnccs	r3, #-805306368	; 0xd0000000
33f85674:	33f953b4 	mvnccs	r5, #-805306366	; 0xd0000002
33f85678:	33f85038 	mvnccs	r5, #56	; 0x38
33f8567c:	33f93510 	mvnccs	r3, #67108864	; 0x4000000
33f85680:	33f93538 	mvnccs	r3, #234881024	; 0xe000000
33f85684:	33f92e04 	mvnccs	r2, #64	; 0x40
33f85688:	33f9353c 	mvnccs	r3, #251658240	; 0xf000000
33f8568c:	33f84b1c 	mvnccs	r4, #28672	; 0x7000
33f85690:	33f9652c 	mvnccs	r6, #184549376	; 0xb000000
33f85694:	33f84b54 	mvnccs	r4, #86016	; 0x15000
33f85698:	33f96530 	mvnccs	r6, #201326592	; 0xc000000
33f8569c:	33f96520 	mvnccs	r6, #134217728	; 0x8000000
33f856a0:	33f96529 	mvnccs	r6, #171966464	; 0xa400000
33f856a4:	33f96578 	mvnccs	r6, #503316480	; 0x1e000000
33f856a8:	33f96524 	mvnccs	r6, #150994944	; 0x9000000
33f856ac:	33f96528 	mvnccs	r6, #167772160	; 0xa000000
33f856b0:	33f9657c 	mvnccs	r6, #520093696	; 0x1f000000
33f856b4:	33f96564 	mvnccs	r6, #419430400	; 0x19000000
33f856b8:	33f964fc 	mvnccs	r6, #-67108864	; 0xfc000000
33f856bc:	33f96570 	mvnccs	r6, #469762048	; 0x1c000000
33f856c0:	33f96580 	mvnccs	r6, #536870912	; 0x20000000
33f856c4:	33f96568 	mvnccs	r6, #436207616	; 0x1a000000
33f856c8:	33f9656c 	mvnccs	r6, #452984832	; 0x1b000000
33f856cc:	33f96574 	mvnccs	r6, #486539264	; 0x1d000000
33f856d0:	33f96534 	mvnccs	r6, #218103808	; 0xd000000
33f856d4:	33f96548 	mvnccs	r6, #301989888	; 0x12000000
33f856d8:	33f96548 	mvnccs	r6, #301989888	; 0x12000000
33f856dc:	33f956d4 	mvnccs	r5, #222298112	; 0xd400000
33f856e0:	33f9357c 	mvnccs	r3, #520093696	; 0x1f000000
33f856e4:	33f935a4 	mvnccs	r3, #687865856	; 0x29000000
33f856e8:	33f935c4 	mvnccs	r3, #822083584	; 0x31000000

33f856ec <do_load_serial>:
33f856ec:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f856f0:	e59f028c 	ldr	r0, [pc, #652]	; 33f85984 <.text+0x5984>
33f856f4:	e24dde33 	sub	sp, sp, #816	; 0x330
33f856f8:	e1a04002 	mov	r4, r2
33f856fc:	e1a05003 	mov	r5, r3
33f85700:	eb000623 	bl	33f86f94 <getenv>
33f85704:	e3500000 	cmp	r0, #0	; 0x0
33f85708:	0a000003 	beq	33f8571c <do_load_serial+0x30>
33f8570c:	e5d03000 	ldrb	r3, [r0]
33f85710:	e3530031 	cmp	r3, #49	; 0x31
33f85714:	03a02001 	moveq	r2, #1	; 0x1
33f85718:	0a000000 	beq	33f85720 <do_load_serial+0x34>
33f8571c:	e3a02000 	mov	r2, #0	; 0x0
33f85720:	e59f3260 	ldr	r3, [pc, #608]	; 33f85988 <.text+0x5988>
33f85724:	e3540002 	cmp	r4, #2	; 0x2
33f85728:	e5832000 	str	r2, [r3]
33f8572c:	13a09000 	movne	r9, #0	; 0x0
33f85730:	1a000004 	bne	33f85748 <do_load_serial+0x5c>
33f85734:	e5950004 	ldr	r0, [r5, #4]
33f85738:	e3a01000 	mov	r1, #0	; 0x0
33f8573c:	e3a02010 	mov	r2, #16	; 0x10
33f85740:	eb001540 	bl	33f8ac48 <simple_strtoul>
33f85744:	e1a09000 	mov	r9, r0
33f85748:	e59f023c 	ldr	r0, [pc, #572]	; 33f8598c <.text+0x598c>
33f8574c:	eb000943 	bl	33f87c60 <printf>
33f85750:	e3a07000 	mov	r7, #0	; 0x0
33f85754:	e3e06000 	mvn	r6, #0	; 0x0
33f85758:	e1a0a007 	mov	sl, r7
33f8575c:	ea000045 	b	33f85878 <.text+0x5878>
33f85760:	e28d3f83 	add	r3, sp, #524	; 0x20c
33f85764:	e2433003 	sub	r3, r3, #3	; 0x3
33f85768:	e28d0004 	add	r0, sp, #4	; 0x4
33f8576c:	e28d1fcb 	add	r1, sp, #812	; 0x32c
33f85770:	e28d2fca 	add	r2, sp, #808	; 0x328
33f85774:	eb001050 	bl	33f898bc <srec_decode>
33f85778:	e3500000 	cmp	r0, #0	; 0x0
33f8577c:	ba000068 	blt	33f85924 <.text+0x5924>
33f85780:	e2403001 	sub	r3, r0, #1	; 0x1
33f85784:	e3530008 	cmp	r3, #8	; 0x8
33f85788:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f8578c:	ea00002e 	b	33f8584c <.text+0x584c>
33f85790:	33f857b4 	mvnccs	r5, #47185920	; 0x2d00000
33f85794:	33f857b4 	mvnccs	r5, #47185920	; 0x2d00000
33f85798:	33f857b4 	mvnccs	r5, #47185920	; 0x2d00000
33f8579c:	33f8584c 	mvnccs	r5, #4980736	; 0x4c0000
33f857a0:	33f8584c 	mvnccs	r5, #4980736	; 0x4c0000
33f857a4:	33f8584c 	mvnccs	r5, #4980736	; 0x4c0000
33f857a8:	33f857f0 	mvnccs	r5, #62914560	; 0x3c00000
33f857ac:	33f857f0 	mvnccs	r5, #62914560	; 0x3c00000
33f857b0:	33f857f0 	mvnccs	r5, #62914560	; 0x3c00000
33f857b4:	e59d4328 	ldr	r4, [sp, #808]
33f857b8:	e28d1f83 	add	r1, sp, #524	; 0x20c
33f857bc:	e0894004 	add	r4, r9, r4
33f857c0:	e2411003 	sub	r1, r1, #3	; 0x3
33f857c4:	e1a00004 	mov	r0, r4
33f857c8:	e59d232c 	ldr	r2, [sp, #812]
33f857cc:	eb0014b9 	bl	33f8aab8 <memcpy>
33f857d0:	e59d332c 	ldr	r3, [sp, #812]
33f857d4:	e0843003 	add	r3, r4, r3
33f857d8:	e2433001 	sub	r3, r3, #1	; 0x1
33f857dc:	e1560004 	cmp	r6, r4
33f857e0:	21a06004 	movcs	r6, r4
33f857e4:	e153000a 	cmp	r3, sl
33f857e8:	81a0a003 	movhi	sl, r3
33f857ec:	ea000016 	b	33f8584c <.text+0x584c>
33f857f0:	e066400a 	rsb	r4, r6, sl
33f857f4:	e2844001 	add	r4, r4, #1	; 0x1
33f857f8:	e59f0190 	ldr	r0, [pc, #400]	; 33f85990 <.text+0x5990>
33f857fc:	ebffec27 	bl	33f808a0 <udelay>
33f85800:	e1a03004 	mov	r3, r4
33f85804:	e1a0200a 	mov	r2, sl
33f85808:	e59f0184 	ldr	r0, [pc, #388]	; 33f85994 <.text+0x5994>
33f8580c:	e1a01006 	mov	r1, r6
33f85810:	e58d4000 	str	r4, [sp]
33f85814:	e28d5fc2 	add	r5, sp, #776	; 0x308
33f85818:	eb000910 	bl	33f87c60 <printf>
33f8581c:	e1a01004 	mov	r1, r4
33f85820:	e1a00006 	mov	r0, r6
33f85824:	eb002768 	bl	33f8f5cc <flush_cache>
33f85828:	e1a02004 	mov	r2, r4
33f8582c:	e59f1164 	ldr	r1, [pc, #356]	; 33f85998 <.text+0x5998>
33f85830:	e1a00005 	mov	r0, r5
33f85834:	eb0016ed 	bl	33f8b3f0 <sprintf>
33f85838:	e1a01005 	mov	r1, r5
33f8583c:	e59f0158 	ldr	r0, [pc, #344]	; 33f8599c <.text+0x599c>
33f85840:	eb00071d 	bl	33f874bc <setenv>
33f85844:	e59d4328 	ldr	r4, [sp, #808]
33f85848:	ea000036 	b	33f85928 <.text+0x5928>
33f8584c:	e59f3134 	ldr	r3, [pc, #308]	; 33f85988 <.text+0x5988>
33f85850:	e5933000 	ldr	r3, [r3]
33f85854:	e3530000 	cmp	r3, #0	; 0x0
33f85858:	1a000006 	bne	33f85878 <.text+0x5878>
33f8585c:	e2877001 	add	r7, r7, #1	; 0x1
33f85860:	e1a00007 	mov	r0, r7
33f85864:	e3a01064 	mov	r1, #100	; 0x64
33f85868:	eb002e41 	bl	33f91174 <__modsi3>
33f8586c:	e3500000 	cmp	r0, #0	; 0x0
33f85870:	0280002e 	addeq	r0, r0, #46	; 0x2e
33f85874:	0b00097f 	bleq	33f87e78 <putc>
33f85878:	e28d5004 	add	r5, sp, #4	; 0x4
33f8587c:	ea00001f 	b	33f85900 <.text+0x5900>
33f85880:	eb00098c 	bl	33f87eb8 <getc>
33f85884:	e59f30fc 	ldr	r3, [pc, #252]	; 33f85988 <.text+0x5988>
33f85888:	e5933000 	ldr	r3, [r3]
33f8588c:	e3530000 	cmp	r3, #0	; 0x0
33f85890:	e20040ff 	and	r4, r0, #255	; 0xff
33f85894:	11a00004 	movne	r0, r4
33f85898:	1b000976 	blne	33f87e78 <putc>
33f8589c:	e3540003 	cmp	r4, #3	; 0x3
33f858a0:	0a00001f 	beq	33f85924 <.text+0x5924>
33f858a4:	8a000002 	bhi	33f858b4 <.text+0x58b4>
33f858a8:	e3540000 	cmp	r4, #0	; 0x0
33f858ac:	0a00001c 	beq	33f85924 <.text+0x5924>
33f858b0:	ea000008 	b	33f858d8 <.text+0x58d8>
33f858b4:	e354000a 	cmp	r4, #10	; 0xa
33f858b8:	0a000001 	beq	33f858c4 <.text+0x58c4>
33f858bc:	e354000d 	cmp	r4, #13	; 0xd
33f858c0:	1a000004 	bne	33f858d8 <.text+0x58d8>
33f858c4:	e28d3004 	add	r3, sp, #4	; 0x4
33f858c8:	e0632005 	rsb	r2, r3, r5
33f858cc:	e3a03000 	mov	r3, #0	; 0x0
33f858d0:	e5c53000 	strb	r3, [r5]
33f858d4:	ea000010 	b	33f8591c <.text+0x591c>
33f858d8:	e5c54000 	strb	r4, [r5]
33f858dc:	e5983020 	ldr	r3, [r8, #32]
33f858e0:	e5932004 	ldr	r2, [r3, #4]
33f858e4:	e59f30b4 	ldr	r3, [pc, #180]	; 33f859a0 <.text+0x59a0>
33f858e8:	e1520003 	cmp	r2, r3
33f858ec:	0a000002 	beq	33f858fc <.text+0x58fc>
33f858f0:	eb000976 	bl	33f87ed0 <ctrlc>
33f858f4:	e3500000 	cmp	r0, #0	; 0x0
33f858f8:	1a000009 	bne	33f85924 <.text+0x5924>
33f858fc:	e2855001 	add	r5, r5, #1	; 0x1
33f85900:	e28d3f82 	add	r3, sp, #520	; 0x208
33f85904:	e1550003 	cmp	r5, r3
33f85908:	3affffdc 	bcc	33f85880 <.text+0x5880>
33f8590c:	e3a03000 	mov	r3, #0	; 0x0
33f85910:	e5c53000 	strb	r3, [r5]
33f85914:	e28d3004 	add	r3, sp, #4	; 0x4
33f85918:	e0632005 	rsb	r2, r3, r5
33f8591c:	e3520000 	cmp	r2, #0	; 0x0
33f85920:	aaffff8e 	bge	33f85760 <do_load_serial+0x74>
33f85924:	e3e04000 	mvn	r4, #0	; 0x0
33f85928:	e3a05000 	mov	r5, #0	; 0x0
33f8592c:	eb00095b 	bl	33f87ea0 <tstc>
33f85930:	e3500000 	cmp	r0, #0	; 0x0
33f85934:	e2855001 	add	r5, r5, #1	; 0x1
33f85938:	1b00095e 	blne	33f87eb8 <getc>
33f8593c:	e3a00ffa 	mov	r0, #1000	; 0x3e8
33f85940:	ebffebd6 	bl	33f808a0 <udelay>
33f85944:	e3550064 	cmp	r5, #100	; 0x64
33f85948:	1afffff7 	bne	33f8592c <.text+0x592c>
33f8594c:	e3740001 	cmn	r4, #1	; 0x1
33f85950:	1a000003 	bne	33f85964 <.text+0x5964>
33f85954:	e59f0048 	ldr	r0, [pc, #72]	; 33f859a4 <.text+0x59a4>
33f85958:	eb0008c0 	bl	33f87c60 <printf>
33f8595c:	e3a00001 	mov	r0, #1	; 0x1
33f85960:	ea000005 	b	33f8597c <.text+0x597c>
33f85964:	e59f003c 	ldr	r0, [pc, #60]	; 33f859a8 <.text+0x59a8>
33f85968:	e1a01004 	mov	r1, r4
33f8596c:	eb0008bb 	bl	33f87c60 <printf>
33f85970:	e59f3034 	ldr	r3, [pc, #52]	; 33f859ac <.text+0x59ac>
33f85974:	e5834000 	str	r4, [r3]
33f85978:	e3a00000 	mov	r0, #0	; 0x0
33f8597c:	e28dde33 	add	sp, sp, #816	; 0x330
33f85980:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f85984:	33f935f4 	mvnccs	r3, #1023410176	; 0x3d000000
33f85988:	33f956d8 	mvnccs	r5, #226492416	; 0xd800000
33f8598c:	33f93600 	mvnccs	r3, #0	; 0x0
33f85990:	00002710 	andeq	r2, r0, r0, lsl r7
33f85994:	33f93624 	mvnccs	r3, #37748736	; 0x2400000
33f85998:	33f92e00 	mvnccs	r2, #0	; 0x0
33f8599c:	33f92e04 	mvnccs	r2, #64	; 0x40
33f859a0:	33f87eb8 	mvnccs	r7, #2944	; 0xb80
33f859a4:	33f9368c 	mvnccs	r3, #146800640	; 0x8c00000
33f859a8:	33f935a4 	mvnccs	r3, #687865856	; 0x29000000
33f859ac:	33f956d4 	mvnccs	r5, #222298112	; 0xd400000

33f859b0 <do_mem_base>:
33f859b0:	e3520001 	cmp	r2, #1	; 0x1
33f859b4:	e52de004 	str	lr, [sp, #-4]!
33f859b8:	e3a01000 	mov	r1, #0	; 0x0
33f859bc:	e3a02010 	mov	r2, #16	; 0x10
33f859c0:	da000003 	ble	33f859d4 <do_mem_base+0x24>
33f859c4:	e5930004 	ldr	r0, [r3, #4]
33f859c8:	eb00149e 	bl	33f8ac48 <simple_strtoul>
33f859cc:	e59f3018 	ldr	r3, [pc, #24]	; 33f859ec <.text+0x59ec>
33f859d0:	e5830000 	str	r0, [r3]
33f859d4:	e59f3010 	ldr	r3, [pc, #16]	; 33f859ec <.text+0x59ec>
33f859d8:	e59f0010 	ldr	r0, [pc, #16]	; 33f859f0 <.text+0x59f0>
33f859dc:	e5931000 	ldr	r1, [r3]
33f859e0:	eb00089e 	bl	33f87c60 <printf>
33f859e4:	e3a00000 	mov	r0, #0	; 0x0
33f859e8:	e49df004 	ldr	pc, [sp], #4
33f859ec:	33f96594 	mvnccs	r6, #620756992	; 0x25000000
33f859f0:	33f9384c 	mvnccs	r3, #4980736	; 0x4c0000

33f859f4 <do_mem_crc>:
33f859f4:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f859f8:	e1a0a002 	mov	sl, r2
33f859fc:	e35a0002 	cmp	sl, #2	; 0x2
33f85a00:	e1a06003 	mov	r6, r3
33f85a04:	e3a01000 	mov	r1, #0	; 0x0
33f85a08:	e1a03000 	mov	r3, r0
33f85a0c:	e3a02010 	mov	r2, #16	; 0x10
33f85a10:	e59f008c 	ldr	r0, [pc, #140]	; 33f85aa4 <.text+0x5aa4>
33f85a14:	ca000003 	bgt	33f85a28 <do_mem_crc+0x34>
33f85a18:	e5931010 	ldr	r1, [r3, #16]
33f85a1c:	eb00088f 	bl	33f87c60 <printf>
33f85a20:	e3a00001 	mov	r0, #1	; 0x1
33f85a24:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f85a28:	e5960004 	ldr	r0, [r6, #4]
33f85a2c:	eb001485 	bl	33f8ac48 <simple_strtoul>
33f85a30:	e59f3070 	ldr	r3, [pc, #112]	; 33f85aa8 <.text+0x5aa8>
33f85a34:	e5933000 	ldr	r3, [r3]
33f85a38:	e3a01000 	mov	r1, #0	; 0x0
33f85a3c:	e0805003 	add	r5, r0, r3
33f85a40:	e3a02010 	mov	r2, #16	; 0x10
33f85a44:	e5960008 	ldr	r0, [r6, #8]
33f85a48:	eb00147e 	bl	33f8ac48 <simple_strtoul>
33f85a4c:	e1a01005 	mov	r1, r5
33f85a50:	e1a02000 	mov	r2, r0
33f85a54:	e1a04000 	mov	r4, r0
33f85a58:	e3a00000 	mov	r0, #0	; 0x0
33f85a5c:	eb0012c1 	bl	33f8a568 <crc32>
33f85a60:	e0854004 	add	r4, r5, r4
33f85a64:	e1a07000 	mov	r7, r0
33f85a68:	e1a01005 	mov	r1, r5
33f85a6c:	e2442001 	sub	r2, r4, #1	; 0x1
33f85a70:	e59f0034 	ldr	r0, [pc, #52]	; 33f85aac <.text+0x5aac>
33f85a74:	e1a03007 	mov	r3, r7
33f85a78:	eb000878 	bl	33f87c60 <printf>
33f85a7c:	e3a01000 	mov	r1, #0	; 0x0
33f85a80:	e35a0003 	cmp	sl, #3	; 0x3
33f85a84:	e3a02010 	mov	r2, #16	; 0x10
33f85a88:	e1a00001 	mov	r0, r1
33f85a8c:	08bd84f0 	ldmeqia	sp!, {r4, r5, r6, r7, sl, pc}
33f85a90:	e596000c 	ldr	r0, [r6, #12]
33f85a94:	eb00146b 	bl	33f8ac48 <simple_strtoul>
33f85a98:	e5807000 	str	r7, [r0]
33f85a9c:	e3a00000 	mov	r0, #0	; 0x0
33f85aa0:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f85aa4:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f85aa8:	33f96594 	mvnccs	r6, #620756992	; 0x25000000
33f85aac:	33f93864 	mvnccs	r3, #6553600	; 0x640000

33f85ab0 <do_mem_mtest>:
33f85ab0:	e3520001 	cmp	r2, #1	; 0x1
33f85ab4:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f85ab8:	e1a04002 	mov	r4, r2
33f85abc:	e1a05003 	mov	r5, r3
33f85ac0:	d3a09203 	movle	r9, #805306368	; 0x30000000
33f85ac4:	da000004 	ble	33f85adc <do_mem_mtest+0x2c>
33f85ac8:	e5930004 	ldr	r0, [r3, #4]
33f85acc:	e3a01000 	mov	r1, #0	; 0x0
33f85ad0:	e3a02010 	mov	r2, #16	; 0x10
33f85ad4:	eb00145b 	bl	33f8ac48 <simple_strtoul>
33f85ad8:	e1a09000 	mov	r9, r0
33f85adc:	e3540002 	cmp	r4, #2	; 0x2
33f85ae0:	d59fa0d4 	ldrle	sl, [pc, #212]	; 33f85bbc <.text+0x5bbc>
33f85ae4:	da000004 	ble	33f85afc <do_mem_mtest+0x4c>
33f85ae8:	e5950008 	ldr	r0, [r5, #8]
33f85aec:	e3a01000 	mov	r1, #0	; 0x0
33f85af0:	e3a02010 	mov	r2, #16	; 0x10
33f85af4:	eb001453 	bl	33f8ac48 <simple_strtoul>
33f85af8:	e1a0a000 	mov	sl, r0
33f85afc:	e3540003 	cmp	r4, #3	; 0x3
33f85b00:	d3a06000 	movle	r6, #0	; 0x0
33f85b04:	da000004 	ble	33f85b1c <do_mem_mtest+0x6c>
33f85b08:	e595000c 	ldr	r0, [r5, #12]
33f85b0c:	e3a01000 	mov	r1, #0	; 0x0
33f85b10:	e3a02010 	mov	r2, #16	; 0x10
33f85b14:	eb00144b 	bl	33f8ac48 <simple_strtoul>
33f85b18:	e1a06000 	mov	r6, r0
33f85b1c:	e3a07001 	mov	r7, #1	; 0x1
33f85b20:	eb0008ea 	bl	33f87ed0 <ctrlc>
33f85b24:	e3500000 	cmp	r0, #0	; 0x0
33f85b28:	1a00001f 	bne	33f85bac <do_mem_mtest+0xfc>
33f85b2c:	e59f208c 	ldr	r2, [pc, #140]	; 33f85bc0 <.text+0x5bc0>
33f85b30:	e59f008c 	ldr	r0, [pc, #140]	; 33f85bc4 <.text+0x5bc4>
33f85b34:	e1a01006 	mov	r1, r6
33f85b38:	eb000848 	bl	33f87c60 <printf>
33f85b3c:	e1a02009 	mov	r2, r9
33f85b40:	e1a03006 	mov	r3, r6
33f85b44:	ea000001 	b	33f85b50 <do_mem_mtest+0xa0>
33f85b48:	e4823004 	str	r3, [r2], #4
33f85b4c:	e0833007 	add	r3, r3, r7
33f85b50:	e152000a 	cmp	r2, sl
33f85b54:	3afffffb 	bcc	33f85b48 <do_mem_mtest+0x98>
33f85b58:	e59f0068 	ldr	r0, [pc, #104]	; 33f85bc8 <.text+0x5bc8>
33f85b5c:	eb00082c 	bl	33f87c14 <puts>
33f85b60:	e1a04009 	mov	r4, r9
33f85b64:	e1a05006 	mov	r5, r6
33f85b68:	ea000005 	b	33f85b84 <do_mem_mtest+0xd4>
33f85b6c:	e594c000 	ldr	ip, [r4]
33f85b70:	e15c0005 	cmp	ip, r5
33f85b74:	e2844004 	add	r4, r4, #4	; 0x4
33f85b78:	e1a0200c 	mov	r2, ip
33f85b7c:	e0855007 	add	r5, r5, r7
33f85b80:	1b000836 	blne	33f87c60 <printf>
33f85b84:	e154000a 	cmp	r4, sl
33f85b88:	e1a01004 	mov	r1, r4
33f85b8c:	e1a03005 	mov	r3, r5
33f85b90:	e59f0034 	ldr	r0, [pc, #52]	; 33f85bcc <.text+0x5bcc>
33f85b94:	3afffff4 	bcc	33f85b6c <do_mem_mtest+0xbc>
33f85b98:	e3560000 	cmp	r6, #0	; 0x0
33f85b9c:	b2666000 	rsblt	r6, r6, #0	; 0x0
33f85ba0:	a1e06006 	mvnge	r6, r6
33f85ba4:	e2677000 	rsb	r7, r7, #0	; 0x0
33f85ba8:	eaffffdc 	b	33f85b20 <do_mem_mtest+0x70>
33f85bac:	e3a0000a 	mov	r0, #10	; 0xa
33f85bb0:	eb0008b0 	bl	33f87e78 <putc>
33f85bb4:	e3a00001 	mov	r0, #1	; 0x1
33f85bb8:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f85bbc:	33f00000 	mvnccs	r0, #0	; 0x0
33f85bc0:	33f938b4 	mvnccs	r3, #11796480	; 0xb40000
33f85bc4:	33f9388c 	mvnccs	r3, #9175040	; 0x8c0000
33f85bc8:	33f9380c 	mvnccs	r3, #786432	; 0xc0000
33f85bcc:	33f93818 	mvnccs	r3, #1572864	; 0x180000

33f85bd0 <cmd_get_data_size>:
33f85bd0:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f85bd4:	e1a04001 	mov	r4, r1
33f85bd8:	e1a05000 	mov	r5, r0
33f85bdc:	eb001322 	bl	33f8a86c <strlen>
33f85be0:	e3500002 	cmp	r0, #2	; 0x2
33f85be4:	da000015 	ble	33f85c40 <cmd_get_data_size+0x70>
33f85be8:	e0850000 	add	r0, r5, r0
33f85bec:	e5503002 	ldrb	r3, [r0, #-2]
33f85bf0:	e353002e 	cmp	r3, #46	; 0x2e
33f85bf4:	1a000011 	bne	33f85c40 <cmd_get_data_size+0x70>
33f85bf8:	e5500001 	ldrb	r0, [r0, #-1]
33f85bfc:	e350006c 	cmp	r0, #108	; 0x6c
33f85c00:	03a04004 	moveq	r4, #4	; 0x4
33f85c04:	0a00000d 	beq	33f85c40 <cmd_get_data_size+0x70>
33f85c08:	8a000002 	bhi	33f85c18 <cmd_get_data_size+0x48>
33f85c0c:	e3500062 	cmp	r0, #98	; 0x62
33f85c10:	1a000005 	bne	33f85c2c <cmd_get_data_size+0x5c>
33f85c14:	ea000006 	b	33f85c34 <cmd_get_data_size+0x64>
33f85c18:	e3500073 	cmp	r0, #115	; 0x73
33f85c1c:	03e04001 	mvneq	r4, #1	; 0x1
33f85c20:	0a000006 	beq	33f85c40 <cmd_get_data_size+0x70>
33f85c24:	e3500077 	cmp	r0, #119	; 0x77
33f85c28:	0a000003 	beq	33f85c3c <cmd_get_data_size+0x6c>
33f85c2c:	e3e04000 	mvn	r4, #0	; 0x0
33f85c30:	ea000002 	b	33f85c40 <cmd_get_data_size+0x70>
33f85c34:	e3a04001 	mov	r4, #1	; 0x1
33f85c38:	ea000000 	b	33f85c40 <cmd_get_data_size+0x70>
33f85c3c:	e3a04002 	mov	r4, #2	; 0x2
33f85c40:	e1a00004 	mov	r0, r4
33f85c44:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

33f85c48 <mod_mem>:
33f85c48:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f85c4c:	e3530002 	cmp	r3, #2	; 0x2
33f85c50:	e24dd004 	sub	sp, sp, #4	; 0x4
33f85c54:	e1a0a001 	mov	sl, r1
33f85c58:	e59d701c 	ldr	r7, [sp, #28]
33f85c5c:	0a000003 	beq	33f85c70 <mod_mem+0x28>
33f85c60:	e5901010 	ldr	r1, [r0, #16]
33f85c64:	e59f0130 	ldr	r0, [pc, #304]	; 33f85d9c <.text+0x5d9c>
33f85c68:	eb0007fc 	bl	33f87c60 <printf>
33f85c6c:	ea000041 	b	33f85d78 <mod_mem+0x130>
33f85c70:	e59f3128 	ldr	r3, [pc, #296]	; 33f85da0 <.text+0x5da0>
33f85c74:	e5935000 	ldr	r5, [r3]
33f85c78:	e59f3124 	ldr	r3, [pc, #292]	; 33f85da4 <.text+0x5da4>
33f85c7c:	e5930000 	ldr	r0, [r3]
33f85c80:	e2124001 	ands	r4, r2, #1	; 0x1
33f85c84:	11a06000 	movne	r6, r0
33f85c88:	1a00000b 	bne	33f85cbc <mod_mem+0x74>
33f85c8c:	e5970000 	ldr	r0, [r7]
33f85c90:	e3a01004 	mov	r1, #4	; 0x4
33f85c94:	ebffffcd 	bl	33f85bd0 <cmd_get_data_size>
33f85c98:	e2506000 	subs	r6, r0, #0	; 0x0
33f85c9c:	ba000035 	blt	33f85d78 <mod_mem+0x130>
33f85ca0:	e5970004 	ldr	r0, [r7, #4]
33f85ca4:	e1a01004 	mov	r1, r4
33f85ca8:	e3a02010 	mov	r2, #16	; 0x10
33f85cac:	eb0013e5 	bl	33f8ac48 <simple_strtoul>
33f85cb0:	e59f30f0 	ldr	r3, [pc, #240]	; 33f85da8 <.text+0x5da8>
33f85cb4:	e5933000 	ldr	r3, [r3]
33f85cb8:	e0805003 	add	r5, r0, r3
33f85cbc:	e59f00e8 	ldr	r0, [pc, #232]	; 33f85dac <.text+0x5dac>
33f85cc0:	e1a01005 	mov	r1, r5
33f85cc4:	eb0007e5 	bl	33f87c60 <printf>
33f85cc8:	e3560004 	cmp	r6, #4	; 0x4
33f85ccc:	059f00dc 	ldreq	r0, [pc, #220]	; 33f85db0 <.text+0x5db0>
33f85cd0:	05951000 	ldreq	r1, [r5]
33f85cd4:	0a000004 	beq	33f85cec <mod_mem+0xa4>
33f85cd8:	e3560002 	cmp	r6, #2	; 0x2
33f85cdc:	059f00d0 	ldreq	r0, [pc, #208]	; 33f85db4 <.text+0x5db4>
33f85ce0:	01d510b0 	ldreqh	r1, [r5]
33f85ce4:	159f00cc 	ldrne	r0, [pc, #204]	; 33f85db8 <.text+0x5db8>
33f85ce8:	15d51000 	ldrneb	r1, [r5]
33f85cec:	eb0007db 	bl	33f87c60 <printf>
33f85cf0:	e59f00c4 	ldr	r0, [pc, #196]	; 33f85dbc <.text+0x5dbc>
33f85cf4:	ebfff52a 	bl	33f831a4 <readline>
33f85cf8:	e3500000 	cmp	r0, #0	; 0x0
33f85cfc:	0a000005 	beq	33f85d18 <mod_mem+0xd0>
33f85d00:	e3500001 	cmp	r0, #1	; 0x1
33f85d04:	1a00000a 	bne	33f85d34 <mod_mem+0xec>
33f85d08:	e59f30b0 	ldr	r3, [pc, #176]	; 33f85dc0 <.text+0x5dc0>
33f85d0c:	e5d33000 	ldrb	r3, [r3]
33f85d10:	e353002d 	cmp	r3, #45	; 0x2d
33f85d14:	1a000006 	bne	33f85d34 <mod_mem+0xec>
33f85d18:	e35a0000 	cmp	sl, #0	; 0x0
33f85d1c:	0affffe6 	beq	33f85cbc <mod_mem+0x74>
33f85d20:	e3500000 	cmp	r0, #0	; 0x0
33f85d24:	12663000 	rsbne	r3, r6, #0	; 0x0
33f85d28:	01a03006 	moveq	r3, r6
33f85d2c:	e0855003 	add	r5, r5, r3
33f85d30:	eaffffe1 	b	33f85cbc <mod_mem+0x74>
33f85d34:	e59f4084 	ldr	r4, [pc, #132]	; 33f85dc0 <.text+0x5dc0>
33f85d38:	e1a0100d 	mov	r1, sp
33f85d3c:	e1a00004 	mov	r0, r4
33f85d40:	e3a02010 	mov	r2, #16	; 0x10
33f85d44:	eb0013bf 	bl	33f8ac48 <simple_strtoul>
33f85d48:	e59d3000 	ldr	r3, [sp]
33f85d4c:	e1530004 	cmp	r3, r4
33f85d50:	0a00000a 	beq	33f85d80 <mod_mem+0x138>
33f85d54:	e3560004 	cmp	r6, #4	; 0x4
33f85d58:	05850000 	streq	r0, [r5]
33f85d5c:	0a000002 	beq	33f85d6c <mod_mem+0x124>
33f85d60:	e3560002 	cmp	r6, #2	; 0x2
33f85d64:	01c500b0 	streqh	r0, [r5]
33f85d68:	15c50000 	strneb	r0, [r5]
33f85d6c:	e35a0000 	cmp	sl, #0	; 0x0
33f85d70:	10855006 	addne	r5, r5, r6
33f85d74:	eaffffd0 	b	33f85cbc <mod_mem+0x74>
33f85d78:	e3a00001 	mov	r0, #1	; 0x1
33f85d7c:	ea000004 	b	33f85d94 <mod_mem+0x14c>
33f85d80:	e59f3018 	ldr	r3, [pc, #24]	; 33f85da0 <.text+0x5da0>
33f85d84:	e5835000 	str	r5, [r3]
33f85d88:	e59f3014 	ldr	r3, [pc, #20]	; 33f85da4 <.text+0x5da4>
33f85d8c:	e5836000 	str	r6, [r3]
33f85d90:	e3a00000 	mov	r0, #0	; 0x0
33f85d94:	e28dd004 	add	sp, sp, #4	; 0x4
33f85d98:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f85d9c:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f85da0:	33f9658c 	mvnccs	r6, #587202560	; 0x23000000
33f85da4:	33f96590 	mvnccs	r6, #603979776	; 0x24000000
33f85da8:	33f96594 	mvnccs	r6, #620756992	; 0x25000000
33f85dac:	33f938b8 	mvnccs	r3, #12058624	; 0xb80000
33f85db0:	33f938c0 	mvnccs	r3, #12582912	; 0xc00000
33f85db4:	33f938c8 	mvnccs	r3, #13107200	; 0xc80000
33f85db8:	33f938d0 	mvnccs	r3, #13631488	; 0xd00000
33f85dbc:	33f938d8 	mvnccs	r3, #14155776	; 0xd80000
33f85dc0:	33f962bc 	mvnccs	r6, #-1073741813	; 0xc000000b

33f85dc4 <do_mem_nm>:
33f85dc4:	e52de004 	str	lr, [sp, #-4]!
33f85dc8:	e1a0c002 	mov	ip, r2
33f85dcc:	e24dd004 	sub	sp, sp, #4	; 0x4
33f85dd0:	e58d3000 	str	r3, [sp]
33f85dd4:	e1a02001 	mov	r2, r1
33f85dd8:	e1a0300c 	mov	r3, ip
33f85ddc:	e3a01000 	mov	r1, #0	; 0x0
33f85de0:	ebffff98 	bl	33f85c48 <mod_mem>
33f85de4:	e28dd004 	add	sp, sp, #4	; 0x4
33f85de8:	e8bd8000 	ldmia	sp!, {pc}

33f85dec <do_mem_mm>:
33f85dec:	e52de004 	str	lr, [sp, #-4]!
33f85df0:	e1a0c002 	mov	ip, r2
33f85df4:	e24dd004 	sub	sp, sp, #4	; 0x4
33f85df8:	e58d3000 	str	r3, [sp]
33f85dfc:	e1a02001 	mov	r2, r1
33f85e00:	e1a0300c 	mov	r3, ip
33f85e04:	e3a01001 	mov	r1, #1	; 0x1
33f85e08:	ebffff8e 	bl	33f85c48 <mod_mem>
33f85e0c:	e28dd004 	add	sp, sp, #4	; 0x4
33f85e10:	e8bd8000 	ldmia	sp!, {pc}

33f85e14 <do_mem_loop>:
33f85e14:	e3520002 	cmp	r2, #2	; 0x2
33f85e18:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f85e1c:	e1a04003 	mov	r4, r3
33f85e20:	ca000003 	bgt	33f85e34 <do_mem_loop+0x20>
33f85e24:	e5901010 	ldr	r1, [r0, #16]
33f85e28:	e59f00d8 	ldr	r0, [pc, #216]	; 33f85f08 <.text+0x5f08>
33f85e2c:	eb00078b 	bl	33f87c60 <printf>
33f85e30:	ea000032 	b	33f85f00 <do_mem_loop+0xec>
33f85e34:	e5930000 	ldr	r0, [r3]
33f85e38:	e3a01004 	mov	r1, #4	; 0x4
33f85e3c:	ebffff63 	bl	33f85bd0 <cmd_get_data_size>
33f85e40:	e2505000 	subs	r5, r0, #0	; 0x0
33f85e44:	ba00002d 	blt	33f85f00 <do_mem_loop+0xec>
33f85e48:	e3a01000 	mov	r1, #0	; 0x0
33f85e4c:	e3a02010 	mov	r2, #16	; 0x10
33f85e50:	e5940004 	ldr	r0, [r4, #4]
33f85e54:	eb00137b 	bl	33f8ac48 <simple_strtoul>
33f85e58:	e3a01000 	mov	r1, #0	; 0x0
33f85e5c:	e1a06000 	mov	r6, r0
33f85e60:	e3a02010 	mov	r2, #16	; 0x10
33f85e64:	e5940008 	ldr	r0, [r4, #8]
33f85e68:	eb001376 	bl	33f8ac48 <simple_strtoul>
33f85e6c:	e3500001 	cmp	r0, #1	; 0x1
33f85e70:	1a000009 	bne	33f85e9c <do_mem_loop+0x88>
33f85e74:	e3550004 	cmp	r5, #4	; 0x4
33f85e78:	1a000001 	bne	33f85e84 <do_mem_loop+0x70>
33f85e7c:	e5963000 	ldr	r3, [r6]
33f85e80:	eafffffd 	b	33f85e7c <do_mem_loop+0x68>
33f85e84:	e3550002 	cmp	r5, #2	; 0x2
33f85e88:	1a000001 	bne	33f85e94 <do_mem_loop+0x80>
33f85e8c:	e1d630b0 	ldrh	r3, [r6]
33f85e90:	eafffffd 	b	33f85e8c <do_mem_loop+0x78>
33f85e94:	e5d63000 	ldrb	r3, [r6]
33f85e98:	eafffffd 	b	33f85e94 <do_mem_loop+0x80>
33f85e9c:	e3550004 	cmp	r5, #4	; 0x4
33f85ea0:	1a000006 	bne	33f85ec0 <do_mem_loop+0xac>
33f85ea4:	e1a01006 	mov	r1, r6
33f85ea8:	e1a02000 	mov	r2, r0
33f85eac:	ea000000 	b	33f85eb4 <do_mem_loop+0xa0>
33f85eb0:	e4913004 	ldr	r3, [r1], #4
33f85eb4:	e2522001 	subs	r2, r2, #1	; 0x1
33f85eb8:	2afffffc 	bcs	33f85eb0 <do_mem_loop+0x9c>
33f85ebc:	eafffff8 	b	33f85ea4 <do_mem_loop+0x90>
33f85ec0:	e3550002 	cmp	r5, #2	; 0x2
33f85ec4:	1a000006 	bne	33f85ee4 <do_mem_loop+0xd0>
33f85ec8:	e1a01006 	mov	r1, r6
33f85ecc:	e1a02000 	mov	r2, r0
33f85ed0:	ea000000 	b	33f85ed8 <do_mem_loop+0xc4>
33f85ed4:	e0d130b2 	ldrh	r3, [r1], #2
33f85ed8:	e2522001 	subs	r2, r2, #1	; 0x1
33f85edc:	2afffffc 	bcs	33f85ed4 <do_mem_loop+0xc0>
33f85ee0:	eafffff8 	b	33f85ec8 <do_mem_loop+0xb4>
33f85ee4:	e1a01006 	mov	r1, r6
33f85ee8:	e1a02000 	mov	r2, r0
33f85eec:	ea000000 	b	33f85ef4 <do_mem_loop+0xe0>
33f85ef0:	e4d13001 	ldrb	r3, [r1], #1
33f85ef4:	e2522001 	subs	r2, r2, #1	; 0x1
33f85ef8:	2afffffc 	bcs	33f85ef0 <do_mem_loop+0xdc>
33f85efc:	eafffff8 	b	33f85ee4 <do_mem_loop+0xd0>
33f85f00:	e3a00001 	mov	r0, #1	; 0x1
33f85f04:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f85f08:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000

33f85f0c <do_mem_cp>:
33f85f0c:	e3520004 	cmp	r2, #4	; 0x4
33f85f10:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f85f14:	e1a01002 	mov	r1, r2
33f85f18:	e1a05003 	mov	r5, r3
33f85f1c:	0a000003 	beq	33f85f30 <do_mem_cp+0x24>
33f85f20:	e5901010 	ldr	r1, [r0, #16]
33f85f24:	e59f0164 	ldr	r0, [pc, #356]	; 33f86090 <.text+0x6090>
33f85f28:	eb00074c 	bl	33f87c60 <printf>
33f85f2c:	ea000046 	b	33f8604c <do_mem_cp+0x140>
33f85f30:	e5930000 	ldr	r0, [r3]
33f85f34:	ebffff25 	bl	33f85bd0 <cmd_get_data_size>
33f85f38:	e2507000 	subs	r7, r0, #0	; 0x0
33f85f3c:	ba000042 	blt	33f8604c <do_mem_cp+0x140>
33f85f40:	e3a01000 	mov	r1, #0	; 0x0
33f85f44:	e3a02010 	mov	r2, #16	; 0x10
33f85f48:	e5950004 	ldr	r0, [r5, #4]
33f85f4c:	eb00133d 	bl	33f8ac48 <simple_strtoul>
33f85f50:	e59f413c 	ldr	r4, [pc, #316]	; 33f86094 <.text+0x6094>
33f85f54:	e3a01000 	mov	r1, #0	; 0x0
33f85f58:	e3a02010 	mov	r2, #16	; 0x10
33f85f5c:	e1a0b000 	mov	fp, r0
33f85f60:	e5950008 	ldr	r0, [r5, #8]
33f85f64:	e5949000 	ldr	r9, [r4]
33f85f68:	eb001336 	bl	33f8ac48 <simple_strtoul>
33f85f6c:	e3a01000 	mov	r1, #0	; 0x0
33f85f70:	e1a0a000 	mov	sl, r0
33f85f74:	e3a02010 	mov	r2, #16	; 0x10
33f85f78:	e595000c 	ldr	r0, [r5, #12]
33f85f7c:	e5944000 	ldr	r4, [r4]
33f85f80:	eb001330 	bl	33f8ac48 <simple_strtoul>
33f85f84:	e2506000 	subs	r6, r0, #0	; 0x0
33f85f88:	059f0108 	ldreq	r0, [pc, #264]	; 33f86098 <.text+0x6098>
33f85f8c:	0a000011 	beq	33f85fd8 <do_mem_cp+0xcc>
33f85f90:	e08a5004 	add	r5, sl, r4
33f85f94:	e1a00005 	mov	r0, r5
33f85f98:	eb002157 	bl	33f8e4fc <mmc2info>
33f85f9c:	e3500000 	cmp	r0, #0	; 0x0
33f85fa0:	e08b4009 	add	r4, fp, r9
33f85fa4:	0a000012 	beq	33f85ff4 <do_mem_cp+0xe8>
33f85fa8:	e59f00ec 	ldr	r0, [pc, #236]	; 33f8609c <.text+0x609c>
33f85fac:	eb000718 	bl	33f87c14 <puts>
33f85fb0:	e1a00004 	mov	r0, r4
33f85fb4:	e1a01005 	mov	r1, r5
33f85fb8:	e0020697 	mul	r2, r7, r6
33f85fbc:	eb002265 	bl	33f8e958 <mmc_write>
33f85fc0:	e3700001 	cmn	r0, #1	; 0x1
33f85fc4:	0a000002 	beq	33f85fd4 <do_mem_cp+0xc8>
33f85fc8:	e3500000 	cmp	r0, #0	; 0x0
33f85fcc:	1a000003 	bne	33f85fe0 <do_mem_cp+0xd4>
33f85fd0:	ea000015 	b	33f8602c <do_mem_cp+0x120>
33f85fd4:	e59f00c4 	ldr	r0, [pc, #196]	; 33f860a0 <.text+0x60a0>
33f85fd8:	eb00070d 	bl	33f87c14 <puts>
33f85fdc:	ea00001a 	b	33f8604c <do_mem_cp+0x140>
33f85fe0:	e1a03000 	mov	r3, r0
33f85fe4:	e59f10b8 	ldr	r1, [pc, #184]	; 33f860a4 <.text+0x60a4>
33f85fe8:	e59f00b8 	ldr	r0, [pc, #184]	; 33f860a8 <.text+0x60a8>
33f85fec:	e3a02f72 	mov	r2, #456	; 0x1c8
33f85ff0:	ea000014 	b	33f86048 <do_mem_cp+0x13c>
33f85ff4:	e1a00004 	mov	r0, r4
33f85ff8:	eb00213f 	bl	33f8e4fc <mmc2info>
33f85ffc:	e3500000 	cmp	r0, #0	; 0x0
33f86000:	0a00001e 	beq	33f86080 <do_mem_cp+0x174>
33f86004:	e59f00a0 	ldr	r0, [pc, #160]	; 33f860ac <.text+0x60ac>
33f86008:	eb000701 	bl	33f87c14 <puts>
33f8600c:	e1a00004 	mov	r0, r4
33f86010:	e1a01005 	mov	r1, r5
33f86014:	e0020697 	mul	r2, r7, r6
33f86018:	eb0022a1 	bl	33f8eaa4 <mmc_read>
33f8601c:	e3700001 	cmn	r0, #1	; 0x1
33f86020:	0affffeb 	beq	33f85fd4 <do_mem_cp+0xc8>
33f86024:	e3500000 	cmp	r0, #0	; 0x0
33f86028:	1a000002 	bne	33f86038 <do_mem_cp+0x12c>
33f8602c:	e280000a 	add	r0, r0, #10	; 0xa
33f86030:	eb000790 	bl	33f87e78 <putc>
33f86034:	ea000004 	b	33f8604c <do_mem_cp+0x140>
33f86038:	e1a03000 	mov	r3, r0
33f8603c:	e59f1060 	ldr	r1, [pc, #96]	; 33f860a4 <.text+0x60a4>
33f86040:	e59f0060 	ldr	r0, [pc, #96]	; 33f860a8 <.text+0x60a8>
33f86044:	e59f2064 	ldr	r2, [pc, #100]	; 33f860b0 <.text+0x60b0>
33f86048:	eb000704 	bl	33f87c60 <printf>
33f8604c:	e3a00001 	mov	r0, #1	; 0x1
33f86050:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f86054:	e3570004 	cmp	r7, #4	; 0x4
33f86058:	05943000 	ldreq	r3, [r4]
33f8605c:	05853000 	streq	r3, [r5]
33f86060:	0a000004 	beq	33f86078 <do_mem_cp+0x16c>
33f86064:	e3570002 	cmp	r7, #2	; 0x2
33f86068:	01d430b0 	ldreqh	r3, [r4]
33f8606c:	15d43000 	ldrneb	r3, [r4]
33f86070:	01c530b0 	streqh	r3, [r5]
33f86074:	15c53000 	strneb	r3, [r5]
33f86078:	e0844007 	add	r4, r4, r7
33f8607c:	e0855007 	add	r5, r5, r7
33f86080:	e2566001 	subs	r6, r6, #1	; 0x1
33f86084:	2afffff2 	bcs	33f86054 <do_mem_cp+0x148>
33f86088:	e3a00000 	mov	r0, #0	; 0x0
33f8608c:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f86090:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f86094:	33f96594 	mvnccs	r6, #620756992	; 0x25000000
33f86098:	33f938dc 	mvnccs	r3, #14417920	; 0xdc0000
33f8609c:	33f938f0 	mvnccs	r3, #15728640	; 0xf00000
33f860a0:	33f93900 	mvnccs	r3, #0	; 0x0
33f860a4:	33f93920 	mvnccs	r3, #524288	; 0x80000
33f860a8:	33f93908 	mvnccs	r3, #131072	; 0x20000
33f860ac:	33f9392c 	mvnccs	r3, #720896	; 0xb0000
33f860b0:	000001db 	ldreqd	r0, [r0], -fp

33f860b4 <do_mem_cmp>:
33f860b4:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f860b8:	e3520004 	cmp	r2, #4	; 0x4
33f860bc:	e24dd004 	sub	sp, sp, #4	; 0x4
33f860c0:	e1a01002 	mov	r1, r2
33f860c4:	e1a06003 	mov	r6, r3
33f860c8:	0a000003 	beq	33f860dc <do_mem_cmp+0x28>
33f860cc:	e5901010 	ldr	r1, [r0, #16]
33f860d0:	e59f0160 	ldr	r0, [pc, #352]	; 33f86238 <.text+0x6238>
33f860d4:	eb0006e1 	bl	33f87c60 <printf>
33f860d8:	ea000003 	b	33f860ec <do_mem_cmp+0x38>
33f860dc:	e5930000 	ldr	r0, [r3]
33f860e0:	ebfffeba 	bl	33f85bd0 <cmd_get_data_size>
33f860e4:	e2507000 	subs	r7, r0, #0	; 0x0
33f860e8:	aa000001 	bge	33f860f4 <do_mem_cmp+0x40>
33f860ec:	e3a04001 	mov	r4, #1	; 0x1
33f860f0:	ea00004d 	b	33f8622c <do_mem_cmp+0x178>
33f860f4:	e3a01000 	mov	r1, #0	; 0x0
33f860f8:	e3a02010 	mov	r2, #16	; 0x10
33f860fc:	e5960004 	ldr	r0, [r6, #4]
33f86100:	eb0012d0 	bl	33f8ac48 <simple_strtoul>
33f86104:	e59f4130 	ldr	r4, [pc, #304]	; 33f8623c <.text+0x623c>
33f86108:	e5943000 	ldr	r3, [r4]
33f8610c:	e3a01000 	mov	r1, #0	; 0x0
33f86110:	e0805003 	add	r5, r0, r3
33f86114:	e3a02010 	mov	r2, #16	; 0x10
33f86118:	e5960008 	ldr	r0, [r6, #8]
33f8611c:	eb0012c9 	bl	33f8ac48 <simple_strtoul>
33f86120:	e5943000 	ldr	r3, [r4]
33f86124:	e3a01000 	mov	r1, #0	; 0x0
33f86128:	e0804003 	add	r4, r0, r3
33f8612c:	e3a02010 	mov	r2, #16	; 0x10
33f86130:	e596000c 	ldr	r0, [r6, #12]
33f86134:	eb0012c3 	bl	33f8ac48 <simple_strtoul>
33f86138:	e3a06000 	mov	r6, #0	; 0x0
33f8613c:	ea00001e 	b	33f861bc <do_mem_cmp+0x108>
33f86140:	e3570004 	cmp	r7, #4	; 0x4
33f86144:	1a00000b 	bne	33f86178 <do_mem_cmp+0xc4>
33f86148:	e5952000 	ldr	r2, [r5]
33f8614c:	e594c000 	ldr	ip, [r4]
33f86150:	e152000c 	cmp	r2, ip
33f86154:	0a000015 	beq	33f861b0 <do_mem_cmp+0xfc>
33f86158:	e1a03004 	mov	r3, r4
33f8615c:	e59f00dc 	ldr	r0, [pc, #220]	; 33f86240 <.text+0x6240>
33f86160:	e1a01005 	mov	r1, r5
33f86164:	e58dc000 	str	ip, [sp]
33f86168:	eb0006bc 	bl	33f87c60 <printf>
33f8616c:	e59f00d0 	ldr	r0, [pc, #208]	; 33f86244 <.text+0x6244>
33f86170:	e3a04001 	mov	r4, #1	; 0x1
33f86174:	ea00001c 	b	33f861ec <do_mem_cmp+0x138>
33f86178:	e3570002 	cmp	r7, #2	; 0x2
33f8617c:	1a000007 	bne	33f861a0 <do_mem_cmp+0xec>
33f86180:	e1d520b0 	ldrh	r2, [r5]
33f86184:	e1d4c0b0 	ldrh	ip, [r4]
33f86188:	e152000c 	cmp	r2, ip
33f8618c:	0a000007 	beq	33f861b0 <do_mem_cmp+0xfc>
33f86190:	e59f00b0 	ldr	r0, [pc, #176]	; 33f86248 <.text+0x6248>
33f86194:	e1a01005 	mov	r1, r5
33f86198:	e1a03004 	mov	r3, r4
33f8619c:	ea00001e 	b	33f8621c <do_mem_cmp+0x168>
33f861a0:	e5d52000 	ldrb	r2, [r5]
33f861a4:	e5d4c000 	ldrb	ip, [r4]
33f861a8:	e152000c 	cmp	r2, ip
33f861ac:	1a000017 	bne	33f86210 <do_mem_cmp+0x15c>
33f861b0:	e2866001 	add	r6, r6, #1	; 0x1
33f861b4:	e0855007 	add	r5, r5, r7
33f861b8:	e0844007 	add	r4, r4, r7
33f861bc:	e1560000 	cmp	r6, r0
33f861c0:	1affffde 	bne	33f86140 <do_mem_cmp+0x8c>
33f861c4:	e3570004 	cmp	r7, #4	; 0x4
33f861c8:	059f0074 	ldreq	r0, [pc, #116]	; 33f86244 <.text+0x6244>
33f861cc:	03a04000 	moveq	r4, #0	; 0x0
33f861d0:	0a000005 	beq	33f861ec <do_mem_cmp+0x138>
33f861d4:	e3a04000 	mov	r4, #0	; 0x0
33f861d8:	e59f206c 	ldr	r2, [pc, #108]	; 33f8624c <.text+0x624c>
33f861dc:	e59f306c 	ldr	r3, [pc, #108]	; 33f86250 <.text+0x6250>
33f861e0:	e3570002 	cmp	r7, #2	; 0x2
33f861e4:	11a00002 	movne	r0, r2
33f861e8:	01a00003 	moveq	r0, r3
33f861ec:	e59f2060 	ldr	r2, [pc, #96]	; 33f86254 <.text+0x6254>
33f861f0:	e3560001 	cmp	r6, #1	; 0x1
33f861f4:	e59f305c 	ldr	r3, [pc, #92]	; 33f86258 <.text+0x6258>
33f861f8:	e1a01006 	mov	r1, r6
33f861fc:	01a03002 	moveq	r3, r2
33f86200:	e1a02000 	mov	r2, r0
33f86204:	e59f0050 	ldr	r0, [pc, #80]	; 33f8625c <.text+0x625c>
33f86208:	eb000694 	bl	33f87c60 <printf>
33f8620c:	ea000006 	b	33f8622c <do_mem_cmp+0x178>
33f86210:	e59f0048 	ldr	r0, [pc, #72]	; 33f86260 <.text+0x6260>
33f86214:	e1a01005 	mov	r1, r5
33f86218:	e1a03004 	mov	r3, r4
33f8621c:	e58dc000 	str	ip, [sp]
33f86220:	eb00068e 	bl	33f87c60 <printf>
33f86224:	e3a04001 	mov	r4, #1	; 0x1
33f86228:	eaffffea 	b	33f861d8 <do_mem_cmp+0x124>
33f8622c:	e1a00004 	mov	r0, r4
33f86230:	e28dd004 	add	sp, sp, #4	; 0x4
33f86234:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f86238:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f8623c:	33f96594 	mvnccs	r6, #620756992	; 0x25000000
33f86240:	33f93940 	mvnccs	r3, #1048576	; 0x100000
33f86244:	33f939f4 	mvnccs	r3, #3997696	; 0x3d0000
33f86248:	33f93978 	mvnccs	r3, #1966080	; 0x1e0000
33f8624c:	33f939fc 	mvnccs	r3, #4128768	; 0x3f0000
33f86250:	33f939f0 	mvnccs	r3, #3932160	; 0x3c0000
33f86254:	33f938b4 	mvnccs	r3, #11796480	; 0xb40000
33f86258:	33f936b0 	mvnccs	r3, #184549376	; 0xb000000
33f8625c:	33f93a04 	mvnccs	r3, #16384	; 0x4000
33f86260:	33f939b8 	mvnccs	r3, #3014656	; 0x2e0000

33f86264 <do_mem_mw>:
33f86264:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f86268:	e1a0a002 	mov	sl, r2
33f8626c:	e2422003 	sub	r2, r2, #3	; 0x3
33f86270:	e3520001 	cmp	r2, #1	; 0x1
33f86274:	e1a04003 	mov	r4, r3
33f86278:	9a000003 	bls	33f8628c <do_mem_mw+0x28>
33f8627c:	e5901010 	ldr	r1, [r0, #16]
33f86280:	e59f00a4 	ldr	r0, [pc, #164]	; 33f8632c <.text+0x632c>
33f86284:	eb000675 	bl	33f87c60 <printf>
33f86288:	ea000004 	b	33f862a0 <do_mem_mw+0x3c>
33f8628c:	e5930000 	ldr	r0, [r3]
33f86290:	e3a01004 	mov	r1, #4	; 0x4
33f86294:	ebfffe4d 	bl	33f85bd0 <cmd_get_data_size>
33f86298:	e2506000 	subs	r6, r0, #0	; 0x0
33f8629c:	ca000001 	bgt	33f862a8 <do_mem_mw+0x44>
33f862a0:	e3a00001 	mov	r0, #1	; 0x1
33f862a4:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f862a8:	e3a01000 	mov	r1, #0	; 0x0
33f862ac:	e3a02010 	mov	r2, #16	; 0x10
33f862b0:	e5940004 	ldr	r0, [r4, #4]
33f862b4:	eb001263 	bl	33f8ac48 <simple_strtoul>
33f862b8:	e59f3070 	ldr	r3, [pc, #112]	; 33f86330 <.text+0x6330>
33f862bc:	e1a09000 	mov	r9, r0
33f862c0:	e3a01000 	mov	r1, #0	; 0x0
33f862c4:	e5940008 	ldr	r0, [r4, #8]
33f862c8:	e3a02010 	mov	r2, #16	; 0x10
33f862cc:	e5937000 	ldr	r7, [r3]
33f862d0:	eb00125c 	bl	33f8ac48 <simple_strtoul>
33f862d4:	e35a0004 	cmp	sl, #4	; 0x4
33f862d8:	e1a05000 	mov	r5, r0
33f862dc:	13a03001 	movne	r3, #1	; 0x1
33f862e0:	1a000004 	bne	33f862f8 <do_mem_mw+0x94>
33f862e4:	e594000c 	ldr	r0, [r4, #12]
33f862e8:	e3a01000 	mov	r1, #0	; 0x0
33f862ec:	e3a02010 	mov	r2, #16	; 0x10
33f862f0:	eb001254 	bl	33f8ac48 <simple_strtoul>
33f862f4:	e1a03000 	mov	r3, r0
33f862f8:	e0890007 	add	r0, r9, r7
33f862fc:	ea000006 	b	33f8631c <do_mem_mw+0xb8>
33f86300:	e3560004 	cmp	r6, #4	; 0x4
33f86304:	05805000 	streq	r5, [r0]
33f86308:	0a000002 	beq	33f86318 <do_mem_mw+0xb4>
33f8630c:	e3560002 	cmp	r6, #2	; 0x2
33f86310:	01c050b0 	streqh	r5, [r0]
33f86314:	15c05000 	strneb	r5, [r0]
33f86318:	e0800006 	add	r0, r0, r6
33f8631c:	e2533001 	subs	r3, r3, #1	; 0x1
33f86320:	2afffff6 	bcs	33f86300 <do_mem_mw+0x9c>
33f86324:	e3a00000 	mov	r0, #0	; 0x0
33f86328:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f8632c:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f86330:	33f96594 	mvnccs	r6, #620756992	; 0x25000000

33f86334 <do_mem_md>:
33f86334:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f86338:	e1a04003 	mov	r4, r3
33f8633c:	e59f31b8 	ldr	r3, [pc, #440]	; 33f864fc <.text+0x64fc>
33f86340:	e5935000 	ldr	r5, [r3]
33f86344:	e59f31b4 	ldr	r3, [pc, #436]	; 33f86500 <.text+0x6500>
33f86348:	e1a07002 	mov	r7, r2
33f8634c:	e3520001 	cmp	r2, #1	; 0x1
33f86350:	e1a02000 	mov	r2, r0
33f86354:	e5930000 	ldr	r0, [r3]
33f86358:	e59f31a4 	ldr	r3, [pc, #420]	; 33f86504 <.text+0x6504>
33f8635c:	e24dd018 	sub	sp, sp, #24	; 0x18
33f86360:	e593b000 	ldr	fp, [r3]
33f86364:	ca000003 	bgt	33f86378 <do_mem_md+0x44>
33f86368:	e5921010 	ldr	r1, [r2, #16]
33f8636c:	e59f0194 	ldr	r0, [pc, #404]	; 33f86508 <.text+0x6508>
33f86370:	eb00063a 	bl	33f87c60 <printf>
33f86374:	ea000007 	b	33f86398 <do_mem_md+0x64>
33f86378:	e2116001 	ands	r6, r1, #1	; 0x1
33f8637c:	11a0a000 	movne	sl, r0
33f86380:	1a000016 	bne	33f863e0 <do_mem_md+0xac>
33f86384:	e5940000 	ldr	r0, [r4]
33f86388:	e3a01004 	mov	r1, #4	; 0x4
33f8638c:	ebfffe0f 	bl	33f85bd0 <cmd_get_data_size>
33f86390:	e250a000 	subs	sl, r0, #0	; 0x0
33f86394:	aa000003 	bge	33f863a8 <do_mem_md+0x74>
33f86398:	e3a00001 	mov	r0, #1	; 0x1
33f8639c:	ea000054 	b	33f864f4 <do_mem_md+0x1c0>
33f863a0:	e3a00001 	mov	r0, #1	; 0x1
33f863a4:	ea00004c 	b	33f864dc <do_mem_md+0x1a8>
33f863a8:	e5940004 	ldr	r0, [r4, #4]
33f863ac:	e1a01006 	mov	r1, r6
33f863b0:	e3a02010 	mov	r2, #16	; 0x10
33f863b4:	eb001223 	bl	33f8ac48 <simple_strtoul>
33f863b8:	e59f314c 	ldr	r3, [pc, #332]	; 33f8650c <.text+0x650c>
33f863bc:	e5933000 	ldr	r3, [r3]
33f863c0:	e3570002 	cmp	r7, #2	; 0x2
33f863c4:	e0805003 	add	r5, r0, r3
33f863c8:	0a000004 	beq	33f863e0 <do_mem_md+0xac>
33f863cc:	e5940008 	ldr	r0, [r4, #8]
33f863d0:	e1a01006 	mov	r1, r6
33f863d4:	e3a02010 	mov	r2, #16	; 0x10
33f863d8:	eb00121a 	bl	33f8ac48 <simple_strtoul>
33f863dc:	e1a0b000 	mov	fp, r0
33f863e0:	e0060b9a 	mul	r6, sl, fp
33f863e4:	e59f0124 	ldr	r0, [pc, #292]	; 33f86510 <.text+0x6510>
33f863e8:	e1a01005 	mov	r1, r5
33f863ec:	eb00061b 	bl	33f87c60 <printf>
33f863f0:	e28d9008 	add	r9, sp, #8	; 0x8
33f863f4:	e3560010 	cmp	r6, #16	; 0x10
33f863f8:	31a07006 	movcc	r7, r6
33f863fc:	23a07010 	movcs	r7, #16	; 0x10
33f86400:	e3a04000 	mov	r4, #0	; 0x0
33f86404:	e58d9000 	str	r9, [sp]
33f86408:	e58d9004 	str	r9, [sp, #4]
33f8640c:	ea000014 	b	33f86464 <do_mem_md+0x130>
33f86410:	e35a0004 	cmp	sl, #4	; 0x4
33f86414:	1a000005 	bne	33f86430 <do_mem_md+0xfc>
33f86418:	e7943005 	ldr	r3, [r4, r5]
33f8641c:	e59d2000 	ldr	r2, [sp]
33f86420:	e4823004 	str	r3, [r2], #4
33f86424:	e1a01003 	mov	r1, r3
33f86428:	e58d2000 	str	r2, [sp]
33f8642c:	ea00000a 	b	33f8645c <do_mem_md+0x128>
33f86430:	e35a0002 	cmp	sl, #2	; 0x2
33f86434:	17d43005 	ldrneb	r3, [r4, r5]
33f86438:	159d2004 	ldrne	r2, [sp, #4]
33f8643c:	019430b5 	ldreqh	r3, [r4, r5]
33f86440:	14c23001 	strneb	r3, [r2], #1
33f86444:	e59f00c8 	ldr	r0, [pc, #200]	; 33f86514 <.text+0x6514>
33f86448:	00c930b2 	streqh	r3, [r9], #2
33f8644c:	159f00c4 	ldrne	r0, [pc, #196]	; 33f86518 <.text+0x6518>
33f86450:	158d2004 	strne	r2, [sp, #4]
33f86454:	01a01003 	moveq	r1, r3
33f86458:	11a01003 	movne	r1, r3
33f8645c:	eb0005ff 	bl	33f87c60 <printf>
33f86460:	e084400a 	add	r4, r4, sl
33f86464:	e1540007 	cmp	r4, r7
33f86468:	e59f00ac 	ldr	r0, [pc, #172]	; 33f8651c <.text+0x651c>
33f8646c:	3affffe7 	bcc	33f86410 <do_mem_md+0xdc>
33f86470:	e59f00a8 	ldr	r0, [pc, #168]	; 33f86520 <.text+0x6520>
33f86474:	eb0005e6 	bl	33f87c14 <puts>
33f86478:	e0855004 	add	r5, r5, r4
33f8647c:	e3a04000 	mov	r4, #0	; 0x0
33f86480:	ea00000a 	b	33f864b0 <do_mem_md+0x17c>
33f86484:	e2842008 	add	r2, r4, #8	; 0x8
33f86488:	e7d2300d 	ldrb	r3, [r2, sp]
33f8648c:	e1a01003 	mov	r1, r3
33f86490:	e2433020 	sub	r3, r3, #32	; 0x20
33f86494:	e353005e 	cmp	r3, #94	; 0x5e
33f86498:	9a000001 	bls	33f864a4 <do_mem_md+0x170>
33f8649c:	eb000675 	bl	33f87e78 <putc>
33f864a0:	ea000001 	b	33f864ac <do_mem_md+0x178>
33f864a4:	e59f0078 	ldr	r0, [pc, #120]	; 33f86524 <.text+0x6524>
33f864a8:	eb0005ec 	bl	33f87c60 <printf>
33f864ac:	e2844001 	add	r4, r4, #1	; 0x1
33f864b0:	e1540007 	cmp	r4, r7
33f864b4:	e3a0002e 	mov	r0, #46	; 0x2e
33f864b8:	1afffff1 	bne	33f86484 <do_mem_md+0x150>
33f864bc:	e3a0000a 	mov	r0, #10	; 0xa
33f864c0:	eb00066c 	bl	33f87e78 <putc>
33f864c4:	eb000681 	bl	33f87ed0 <ctrlc>
33f864c8:	e3500000 	cmp	r0, #0	; 0x0
33f864cc:	1affffb3 	bne	33f863a0 <do_mem_md+0x6c>
33f864d0:	e0566007 	subs	r6, r6, r7
33f864d4:	1affffc2 	bne	33f863e4 <do_mem_md+0xb0>
33f864d8:	e1a00006 	mov	r0, r6
33f864dc:	e59f3018 	ldr	r3, [pc, #24]	; 33f864fc <.text+0x64fc>
33f864e0:	e5835000 	str	r5, [r3]
33f864e4:	e59f3018 	ldr	r3, [pc, #24]	; 33f86504 <.text+0x6504>
33f864e8:	e583b000 	str	fp, [r3]
33f864ec:	e59f300c 	ldr	r3, [pc, #12]	; 33f86500 <.text+0x6500>
33f864f0:	e583a000 	str	sl, [r3]
33f864f4:	e28dd018 	add	sp, sp, #24	; 0x18
33f864f8:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f864fc:	33f96584 	mvnccs	r6, #553648128	; 0x21000000
33f86500:	33f96588 	mvnccs	r6, #570425344	; 0x22000000
33f86504:	33f956dc 	mvnccs	r5, #230686720	; 0xdc00000
33f86508:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f8650c:	33f96594 	mvnccs	r6, #620756992	; 0x25000000
33f86510:	33f938b8 	mvnccs	r3, #12058624	; 0xb80000
33f86514:	33f938c8 	mvnccs	r3, #13107200	; 0xc80000
33f86518:	33f938d0 	mvnccs	r3, #13631488	; 0xd00000
33f8651c:	33f938c0 	mvnccs	r3, #12582912	; 0xc00000
33f86520:	33f93a28 	mvnccs	r3, #163840	; 0x28000
33f86524:	33f93a30 	mvnccs	r3, #196608	; 0x30000

33f86528 <do_sleep>:
33f86528:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f8652c:	e1a06000 	mov	r6, r0
33f86530:	e3a00000 	mov	r0, #0	; 0x0
33f86534:	e1a04002 	mov	r4, r2
33f86538:	e1a05003 	mov	r5, r3
33f8653c:	ebffe8d2 	bl	33f8088c <get_timer>
33f86540:	e3540002 	cmp	r4, #2	; 0x2
33f86544:	e1a07000 	mov	r7, r0
33f86548:	0a000006 	beq	33f86568 <do_sleep+0x40>
33f8654c:	e59f005c 	ldr	r0, [pc, #92]	; 33f865b0 <.text+0x65b0>
33f86550:	e5961010 	ldr	r1, [r6, #16]
33f86554:	eb0005c1 	bl	33f87c60 <printf>
33f86558:	e3a00001 	mov	r0, #1	; 0x1
33f8655c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f86560:	e3e00000 	mvn	r0, #0	; 0x0
33f86564:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f86568:	e5950004 	ldr	r0, [r5, #4]
33f8656c:	e3a01000 	mov	r1, #0	; 0x0
33f86570:	e3a0200a 	mov	r2, #10	; 0xa
33f86574:	eb0011b3 	bl	33f8ac48 <simple_strtoul>
33f86578:	e59f3034 	ldr	r3, [pc, #52]	; 33f865b4 <.text+0x65b4>
33f8657c:	e0040390 	mul	r4, r0, r3
33f86580:	ea000004 	b	33f86598 <do_sleep+0x70>
33f86584:	eb000651 	bl	33f87ed0 <ctrlc>
33f86588:	e3500000 	cmp	r0, #0	; 0x0
33f8658c:	e3a00064 	mov	r0, #100	; 0x64
33f86590:	1afffff2 	bne	33f86560 <do_sleep+0x38>
33f86594:	ebffe8c1 	bl	33f808a0 <udelay>
33f86598:	e1a00007 	mov	r0, r7
33f8659c:	ebffe8ba 	bl	33f8088c <get_timer>
33f865a0:	e1500004 	cmp	r0, r4
33f865a4:	3afffff6 	bcc	33f86584 <do_sleep+0x5c>
33f865a8:	e3a00000 	mov	r0, #0	; 0x0
33f865ac:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f865b0:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f865b4:	0017d784 	andeqs	sp, r7, r4, lsl #15

33f865b8 <do_mmc>:
33f865b8:	e52de004 	str	lr, [sp, #-4]!
33f865bc:	e3a00001 	mov	r0, #1	; 0x1
33f865c0:	eb002183 	bl	33f8ebd4 <mmc_init>
33f865c4:	e3500000 	cmp	r0, #0	; 0x0
33f865c8:	e1a03000 	mov	r3, r0
33f865cc:	e59f0010 	ldr	r0, [pc, #16]	; 33f865e4 <.text+0x65e4>
33f865d0:	0a000001 	beq	33f865dc <do_mmc+0x24>
33f865d4:	eb0005a1 	bl	33f87c60 <printf>
33f865d8:	e3a03001 	mov	r3, #1	; 0x1
33f865dc:	e1a00003 	mov	r0, r3
33f865e0:	e49df004 	ldr	pc, [sp], #4
33f865e4:	33f93edc 	mvnccs	r3, #3520	; 0xdc0

33f865e8 <__fswab32>:
33f865e8:	e1a02000 	mov	r2, r0
33f865ec:	e2003cff 	and	r3, r0, #65280	; 0xff00
33f865f0:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
33f865f4:	e1a03403 	mov	r3, r3, lsl #8
33f865f8:	e1a00420 	mov	r0, r0, lsr #8
33f865fc:	e1800c22 	orr	r0, r0, r2, lsr #24
33f86600:	e1833c02 	orr	r3, r3, r2, lsl #24
33f86604:	e1830000 	orr	r0, r3, r0
33f86608:	e1a0f00e 	mov	pc, lr

33f8660c <do_nandboot>:
33f8660c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f86610:	e2422001 	sub	r2, r2, #1	; 0x1
33f86614:	e24dd014 	sub	sp, sp, #20	; 0x14
33f86618:	e1a0b000 	mov	fp, r0
33f8661c:	e1a06003 	mov	r6, r3
33f86620:	e3520003 	cmp	r2, #3	; 0x3
33f86624:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
33f86628:	ea000025 	b	33f866c4 <.text+0x66c4>
33f8662c:	33f8663c 	mvnccs	r6, #62914560	; 0x3c00000
33f86630:	33f86650 	mvnccs	r6, #83886080	; 0x5000000
33f86634:	33f86674 	mvnccs	r6, #121634816	; 0x7400000
33f86638:	33f86694 	mvnccs	r6, #155189248	; 0x9400000
33f8663c:	e59f01f0 	ldr	r0, [pc, #496]	; 33f86834 <.text+0x6834>
33f86640:	eb000253 	bl	33f86f94 <getenv>
33f86644:	e59f71ec 	ldr	r7, [pc, #492]	; 33f86838 <.text+0x6838>
33f86648:	e1a04000 	mov	r4, r0
33f8664c:	ea00000e 	b	33f8668c <.text+0x668c>
33f86650:	e3a01000 	mov	r1, #0	; 0x0
33f86654:	e3a02010 	mov	r2, #16	; 0x10
33f86658:	e5930004 	ldr	r0, [r3, #4]
33f8665c:	eb001179 	bl	33f8ac48 <simple_strtoul>
33f86660:	e1a07000 	mov	r7, r0
33f86664:	e59f01c8 	ldr	r0, [pc, #456]	; 33f86834 <.text+0x6834>
33f86668:	eb000249 	bl	33f86f94 <getenv>
33f8666c:	e1a04000 	mov	r4, r0
33f86670:	ea000005 	b	33f8668c <.text+0x668c>
33f86674:	e5930004 	ldr	r0, [r3, #4]
33f86678:	e3a01000 	mov	r1, #0	; 0x0
33f8667c:	e3a02010 	mov	r2, #16	; 0x10
33f86680:	eb001170 	bl	33f8ac48 <simple_strtoul>
33f86684:	e5964008 	ldr	r4, [r6, #8]
33f86688:	e1a07000 	mov	r7, r0
33f8668c:	e3a09000 	mov	r9, #0	; 0x0
33f86690:	ea00000e 	b	33f866d0 <.text+0x66d0>
33f86694:	e3a01000 	mov	r1, #0	; 0x0
33f86698:	e3a02010 	mov	r2, #16	; 0x10
33f8669c:	e5930004 	ldr	r0, [r3, #4]
33f866a0:	eb001168 	bl	33f8ac48 <simple_strtoul>
33f866a4:	e3a01000 	mov	r1, #0	; 0x0
33f866a8:	e1a07000 	mov	r7, r0
33f866ac:	e3a02010 	mov	r2, #16	; 0x10
33f866b0:	e596000c 	ldr	r0, [r6, #12]
33f866b4:	e5964008 	ldr	r4, [r6, #8]
33f866b8:	eb001162 	bl	33f8ac48 <simple_strtoul>
33f866bc:	e1a09000 	mov	r9, r0
33f866c0:	ea000002 	b	33f866d0 <.text+0x66d0>
33f866c4:	e5901010 	ldr	r1, [r0, #16]
33f866c8:	e59f016c 	ldr	r0, [pc, #364]	; 33f8683c <.text+0x683c>
33f866cc:	ea00003c 	b	33f867c4 <.text+0x67c4>
33f866d0:	e3540000 	cmp	r4, #0	; 0x0
33f866d4:	1a000005 	bne	33f866f0 <.text+0x66f0>
33f866d8:	e59f0160 	ldr	r0, [pc, #352]	; 33f86840 <.text+0x6840>
33f866dc:	eb00054c 	bl	33f87c14 <puts>
33f866e0:	e3e00000 	mvn	r0, #0	; 0x0
33f866e4:	eb001ee5 	bl	33f8e280 <show_boot_progress>
33f866e8:	e3a00001 	mov	r0, #1	; 0x1
33f866ec:	ea00004e 	b	33f8682c <.text+0x682c>
33f866f0:	e1a00004 	mov	r0, r4
33f866f4:	e28d1010 	add	r1, sp, #16	; 0x10
33f866f8:	e3a02010 	mov	r2, #16	; 0x10
33f866fc:	eb001151 	bl	33f8ac48 <simple_strtoul>
33f86700:	e2505000 	subs	r5, r0, #0	; 0x0
33f86704:	ca000005 	bgt	33f86720 <.text+0x6720>
33f86708:	e59f2134 	ldr	r2, [pc, #308]	; 33f86844 <.text+0x6844>
33f8670c:	e3a03058 	mov	r3, #88	; 0x58
33f86710:	e0242395 	mla	r4, r5, r3, r2
33f86714:	e5d43018 	ldrb	r3, [r4, #24]
33f86718:	e3530000 	cmp	r3, #0	; 0x0
33f8671c:	1a000002 	bne	33f8672c <.text+0x672c>
33f86720:	e59f0120 	ldr	r0, [pc, #288]	; 33f86848 <.text+0x6848>
33f86724:	e1a01005 	mov	r1, r5
33f86728:	ea000025 	b	33f867c4 <.text+0x67c4>
33f8672c:	e5942034 	ldr	r2, [r4, #52]
33f86730:	e5943040 	ldr	r3, [r4, #64]
33f86734:	e59f0110 	ldr	r0, [pc, #272]	; 33f8684c <.text+0x684c>
33f86738:	e1a01005 	mov	r1, r5
33f8673c:	e58d9000 	str	r9, [sp]
33f86740:	eb000546 	bl	33f87c60 <printf>
33f86744:	e3a0c000 	mov	ip, #0	; 0x0
33f86748:	e1a00004 	mov	r0, r4
33f8674c:	e3a01001 	mov	r1, #1	; 0x1
33f86750:	e1a02009 	mov	r2, r9
33f86754:	e3a03c02 	mov	r3, #512	; 0x200
33f86758:	e58dc000 	str	ip, [sp]
33f8675c:	e58d7004 	str	r7, [sp, #4]
33f86760:	ebffee15 	bl	33f81fbc <nand_legacy_rw>
33f86764:	e250a000 	subs	sl, r0, #0	; 0x0
33f86768:	1a000013 	bne	33f867bc <.text+0x67bc>
33f8676c:	e5970000 	ldr	r0, [r7]
33f86770:	ebffff9c 	bl	33f865e8 <__fswab32>
33f86774:	e59f30d4 	ldr	r3, [pc, #212]	; 33f86850 <.text+0x6850>
33f86778:	e1500003 	cmp	r0, r3
33f8677c:	11a01000 	movne	r1, r0
33f86780:	159f00cc 	ldrne	r0, [pc, #204]	; 33f86854 <.text+0x6854>
33f86784:	1a00000e 	bne	33f867c4 <.text+0x67c4>
33f86788:	e1a00007 	mov	r0, r7
33f8678c:	ebfff4fa 	bl	33f83b7c <print_image_hdr>
33f86790:	e597000c 	ldr	r0, [r7, #12]
33f86794:	ebffff93 	bl	33f865e8 <__fswab32>
33f86798:	e287cc02 	add	ip, r7, #512	; 0x200
33f8679c:	e2403d07 	sub	r3, r0, #448	; 0x1c0
33f867a0:	e2892c02 	add	r2, r9, #512	; 0x200
33f867a4:	e1a00004 	mov	r0, r4
33f867a8:	e3a01001 	mov	r1, #1	; 0x1
33f867ac:	e88d1400 	stmia	sp, {sl, ip}
33f867b0:	ebffee01 	bl	33f81fbc <nand_legacy_rw>
33f867b4:	e3500000 	cmp	r0, #0	; 0x0
33f867b8:	0a000003 	beq	33f867cc <.text+0x67cc>
33f867bc:	e59f0094 	ldr	r0, [pc, #148]	; 33f86858 <.text+0x6858>
33f867c0:	e1a01005 	mov	r1, r5
33f867c4:	eb000525 	bl	33f87c60 <printf>
33f867c8:	eaffffc4 	b	33f866e0 <.text+0x66e0>
33f867cc:	e59f3088 	ldr	r3, [pc, #136]	; 33f8685c <.text+0x685c>
33f867d0:	e59f0088 	ldr	r0, [pc, #136]	; 33f86860 <.text+0x6860>
33f867d4:	e5837000 	str	r7, [r3]
33f867d8:	eb0001ed 	bl	33f86f94 <getenv>
33f867dc:	e2503000 	subs	r3, r0, #0	; 0x0
33f867e0:	0a000010 	beq	33f86828 <.text+0x6828>
33f867e4:	e59f1078 	ldr	r1, [pc, #120]	; 33f86864 <.text+0x6864>
33f867e8:	e58d3010 	str	r3, [sp, #16]
33f867ec:	eb000ff7 	bl	33f8a7d0 <strcmp>
33f867f0:	e2504000 	subs	r4, r0, #0	; 0x0
33f867f4:	1a00000b 	bne	33f86828 <.text+0x6828>
33f867f8:	e5963000 	ldr	r3, [r6]
33f867fc:	e1a01007 	mov	r1, r7
33f86800:	e59f0060 	ldr	r0, [pc, #96]	; 33f86868 <.text+0x6868>
33f86804:	e58d3008 	str	r3, [sp, #8]
33f86808:	e58d400c 	str	r4, [sp, #12]
33f8680c:	eb000513 	bl	33f87c60 <printf>
33f86810:	e1a0000b 	mov	r0, fp
33f86814:	e1a01004 	mov	r1, r4
33f86818:	e3a02001 	mov	r2, #1	; 0x1
33f8681c:	e28d3008 	add	r3, sp, #8	; 0x8
33f86820:	ebfff5ba 	bl	33f83f10 <do_bootm>
33f86824:	eaffffaf 	b	33f866e8 <.text+0x66e8>
33f86828:	e3a00000 	mov	r0, #0	; 0x0
33f8682c:	e28dd014 	add	sp, sp, #20	; 0x14
33f86830:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f86834:	33f93f14 	mvnccs	r3, #80	; 0x50
33f86838:	30008000 	andcc	r8, r0, r0
33f8683c:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f86840:	33f93f20 	mvnccs	r3, #128	; 0x80
33f86844:	33f96264 	mvnccs	r6, #1073741830	; 0x40000006
33f86848:	33f93f38 	mvnccs	r3, #224	; 0xe0
33f8684c:	33f93f58 	mvnccs	r3, #352	; 0x160
33f86850:	27051956 	smlsdcs	r5, r6, r9, r1
33f86854:	33f93fa8 	mvnccs	r3, #672	; 0x2a0
33f86858:	33f93f90 	mvnccs	r3, #576	; 0x240
33f8685c:	33f956d4 	mvnccs	r5, #222298112	; 0xd400000
33f86860:	33f92df0 	mvnccs	r2, #15360	; 0x3c00
33f86864:	33f93fc8 	mvnccs	r3, #800	; 0x320
33f86868:	33f93fcc 	mvnccs	r3, #816	; 0x330

33f8686c <do_nand>:
33f8686c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f86870:	e1a07002 	mov	r7, r2
33f86874:	e24dd00c 	sub	sp, sp, #12	; 0xc
33f86878:	e1a0b000 	mov	fp, r0
33f8687c:	e1a05003 	mov	r5, r3
33f86880:	e3520003 	cmp	r2, #3	; 0x3
33f86884:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
33f86888:	ea000085 	b	33f86aa4 <.text+0x6aa4>
33f8688c:	33f8689c 	mvnccs	r6, #10223616	; 0x9c0000
33f86890:	33f8689c 	mvnccs	r6, #10223616	; 0x9c0000
33f86894:	33f868e8 	mvnccs	r6, #15204352	; 0xe80000
33f86898:	33f869c0 	mvnccs	r6, #3145728	; 0x300000
33f8689c:	e59f0504 	ldr	r0, [pc, #1284]	; 33f86da8 <.text+0x6da8>
33f868a0:	eb0004ee 	bl	33f87c60 <printf>
33f868a4:	e59f0500 	ldr	r0, [pc, #1280]	; 33f86dac <.text+0x6dac>
33f868a8:	eb0004ec 	bl	33f87c60 <printf>
33f868ac:	e59f04fc 	ldr	r0, [pc, #1276]	; 33f86db0 <.text+0x6db0>
33f868b0:	eb0004ea 	bl	33f87c60 <printf>
33f868b4:	e59f04f8 	ldr	r0, [pc, #1272]	; 33f86db4 <.text+0x6db4>
33f868b8:	eb0004e8 	bl	33f87c60 <printf>
33f868bc:	e59f04f4 	ldr	r0, [pc, #1268]	; 33f86db8 <.text+0x6db8>
33f868c0:	eb0004e6 	bl	33f87c60 <printf>
33f868c4:	e59f04f0 	ldr	r0, [pc, #1264]	; 33f86dbc <.text+0x6dbc>
33f868c8:	eb0004e4 	bl	33f87c60 <printf>
33f868cc:	e59f04ec 	ldr	r0, [pc, #1260]	; 33f86dc0 <.text+0x6dc0>
33f868d0:	eb0004e2 	bl	33f87c60 <printf>
33f868d4:	e59f04e8 	ldr	r0, [pc, #1256]	; 33f86dc4 <.text+0x6dc4>
33f868d8:	eb0004e0 	bl	33f87c60 <printf>
33f868dc:	e59f04e4 	ldr	r0, [pc, #1252]	; 33f86dc8 <.text+0x6dc8>
33f868e0:	eb0004de 	bl	33f87c60 <printf>
33f868e4:	ea000114 	b	33f86d3c <.text+0x6d3c>
33f868e8:	e5930004 	ldr	r0, [r3, #4]
33f868ec:	e59f14d8 	ldr	r1, [pc, #1240]	; 33f86dcc <.text+0x6dcc>
33f868f0:	eb000fb6 	bl	33f8a7d0 <strcmp>
33f868f4:	e2504000 	subs	r4, r0, #0	; 0x0
33f868f8:	1a00000a 	bne	33f86928 <.text+0x6928>
33f868fc:	e59f54cc 	ldr	r5, [pc, #1228]	; 33f86dd0 <.text+0x6dd0>
33f86900:	e280000a 	add	r0, r0, #10	; 0xa
33f86904:	eb00055b 	bl	33f87e78 <putc>
33f86908:	e5d50018 	ldrb	r0, [r5, #24]
33f8690c:	e3500000 	cmp	r0, #0	; 0x0
33f86910:	0a00009b 	beq	33f86b84 <.text+0x6b84>
33f86914:	e59f04b8 	ldr	r0, [pc, #1208]	; 33f86dd4 <.text+0x6dd4>
33f86918:	e1a01004 	mov	r1, r4
33f8691c:	eb0004cf 	bl	33f87c60 <printf>
33f86920:	e1a00005 	mov	r0, r5
33f86924:	ea00000f 	b	33f86968 <.text+0x6968>
33f86928:	e5950004 	ldr	r0, [r5, #4]
33f8692c:	e59f14a4 	ldr	r1, [pc, #1188]	; 33f86dd8 <.text+0x6dd8>
33f86930:	eb000fa6 	bl	33f8a7d0 <strcmp>
33f86934:	e3500000 	cmp	r0, #0	; 0x0
33f86938:	1a00000c 	bne	33f86970 <.text+0x6970>
33f8693c:	e59f5498 	ldr	r5, [pc, #1176]	; 33f86ddc <.text+0x6ddc>
33f86940:	e5954000 	ldr	r4, [r5]
33f86944:	e3540000 	cmp	r4, #0	; 0x0
33f86948:	1a000011 	bne	33f86994 <.text+0x6994>
33f8694c:	e59f048c 	ldr	r0, [pc, #1164]	; 33f86de0 <.text+0x6de0>
33f86950:	e1a01004 	mov	r1, r4
33f86954:	eb0004c1 	bl	33f87c60 <printf>
33f86958:	e5951000 	ldr	r1, [r5]
33f8695c:	e59f346c 	ldr	r3, [pc, #1132]	; 33f86dd0 <.text+0x6dd0>
33f86960:	e3a02058 	mov	r2, #88	; 0x58
33f86964:	e0203291 	mla	r0, r1, r2, r3
33f86968:	ebffed6b 	bl	33f81f1c <nand_print>
33f8696c:	ea00010a 	b	33f86d9c <.text+0x6d9c>
33f86970:	e5950004 	ldr	r0, [r5, #4]
33f86974:	e59f1468 	ldr	r1, [pc, #1128]	; 33f86de4 <.text+0x6de4>
33f86978:	eb000f94 	bl	33f8a7d0 <strcmp>
33f8697c:	e3500000 	cmp	r0, #0	; 0x0
33f86980:	1a0000ea 	bne	33f86d30 <.text+0x6d30>
33f86984:	e59f5450 	ldr	r5, [pc, #1104]	; 33f86ddc <.text+0x6ddc>
33f86988:	e5954000 	ldr	r4, [r5]
33f8698c:	e3540000 	cmp	r4, #0	; 0x0
33f86990:	0a000001 	beq	33f8699c <.text+0x699c>
33f86994:	e59f044c 	ldr	r0, [pc, #1100]	; 33f86de8 <.text+0x6de8>
33f86998:	ea000018 	b	33f86a00 <.text+0x6a00>
33f8699c:	e1a01004 	mov	r1, r4
33f869a0:	e59f0444 	ldr	r0, [pc, #1092]	; 33f86dec <.text+0x6dec>
33f869a4:	eb0004ad 	bl	33f87c60 <printf>
33f869a8:	e5951000 	ldr	r1, [r5]
33f869ac:	e59f341c 	ldr	r3, [pc, #1052]	; 33f86dd0 <.text+0x6dd0>
33f869b0:	e3a02058 	mov	r2, #88	; 0x58
33f869b4:	e0203291 	mla	r0, r1, r2, r3
33f869b8:	ebffed2a 	bl	33f81e68 <nand_print_bad>
33f869bc:	ea0000f6 	b	33f86d9c <.text+0x6d9c>
33f869c0:	e5930004 	ldr	r0, [r3, #4]
33f869c4:	e59f140c 	ldr	r1, [pc, #1036]	; 33f86dd8 <.text+0x6dd8>
33f869c8:	eb000f80 	bl	33f8a7d0 <strcmp>
33f869cc:	e2506000 	subs	r6, r0, #0	; 0x0
33f869d0:	1a00001a 	bne	33f86a40 <.text+0x6a40>
33f869d4:	e5950008 	ldr	r0, [r5, #8]
33f869d8:	e1a01006 	mov	r1, r6
33f869dc:	e3a0200a 	mov	r2, #10	; 0xa
33f869e0:	eb001098 	bl	33f8ac48 <simple_strtoul>
33f869e4:	e1a05000 	mov	r5, r0
33f869e8:	e1a01000 	mov	r1, r0
33f869ec:	e59f03ec 	ldr	r0, [pc, #1004]	; 33f86de0 <.text+0x6de0>
33f869f0:	eb00049a 	bl	33f87c60 <printf>
33f869f4:	e3550000 	cmp	r5, #0	; 0x0
33f869f8:	da000002 	ble	33f86a08 <.text+0x6a08>
33f869fc:	e59f03ec 	ldr	r0, [pc, #1004]	; 33f86df0 <.text+0x6df0>
33f86a00:	eb000483 	bl	33f87c14 <puts>
33f86a04:	ea0000cc 	b	33f86d3c <.text+0x6d3c>
33f86a08:	e59f33c0 	ldr	r3, [pc, #960]	; 33f86dd0 <.text+0x6dd0>
33f86a0c:	e3a02058 	mov	r2, #88	; 0x58
33f86a10:	e0243295 	mla	r4, r5, r2, r3
33f86a14:	e1a00004 	mov	r0, r4
33f86a18:	ebffed3f 	bl	33f81f1c <nand_print>
33f86a1c:	e5d43018 	ldrb	r3, [r4, #24]
33f86a20:	e3530000 	cmp	r3, #0	; 0x0
33f86a24:	0a0000c4 	beq	33f86d3c <.text+0x6d3c>
33f86a28:	e59f33ac 	ldr	r3, [pc, #940]	; 33f86ddc <.text+0x6ddc>
33f86a2c:	e59f03c0 	ldr	r0, [pc, #960]	; 33f86df4 <.text+0x6df4>
33f86a30:	e5835000 	str	r5, [r3]
33f86a34:	eb000476 	bl	33f87c14 <puts>
33f86a38:	e1a04006 	mov	r4, r6
33f86a3c:	ea0000d6 	b	33f86d9c <.text+0x6d9c>
33f86a40:	e5950004 	ldr	r0, [r5, #4]
33f86a44:	e59f13ac 	ldr	r1, [pc, #940]	; 33f86df8 <.text+0x6df8>
33f86a48:	eb000f60 	bl	33f8a7d0 <strcmp>
33f86a4c:	e3500000 	cmp	r0, #0	; 0x0
33f86a50:	1a0000b6 	bne	33f86d30 <.text+0x6d30>
33f86a54:	e5950008 	ldr	r0, [r5, #8]
33f86a58:	e59f139c 	ldr	r1, [pc, #924]	; 33f86dfc <.text+0x6dfc>
33f86a5c:	eb000f5b 	bl	33f8a7d0 <strcmp>
33f86a60:	e2506000 	subs	r6, r0, #0	; 0x0
33f86a64:	1a0000b1 	bne	33f86d30 <.text+0x6d30>
33f86a68:	e59f336c 	ldr	r3, [pc, #876]	; 33f86ddc <.text+0x6ddc>
33f86a6c:	e5931000 	ldr	r1, [r3]
33f86a70:	e59f3358 	ldr	r3, [pc, #856]	; 33f86dd0 <.text+0x6dd0>
33f86a74:	e3a02058 	mov	r2, #88	; 0x58
33f86a78:	e0243291 	mla	r4, r1, r2, r3
33f86a7c:	e5945044 	ldr	r5, [r4, #68]
33f86a80:	e1a02006 	mov	r2, r6
33f86a84:	e1a03005 	mov	r3, r5
33f86a88:	e59f0370 	ldr	r0, [pc, #880]	; 33f86e00 <.text+0x6e00>
33f86a8c:	eb000473 	bl	33f87c60 <printf>
33f86a90:	e1a00004 	mov	r0, r4
33f86a94:	e1a01006 	mov	r1, r6
33f86a98:	e1a02005 	mov	r2, r5
33f86a9c:	e3a03001 	mov	r3, #1	; 0x1
33f86aa0:	ea00008c 	b	33f86cd8 <.text+0x6cd8>
33f86aa4:	e5930004 	ldr	r0, [r3, #4]
33f86aa8:	e59f1354 	ldr	r1, [pc, #852]	; 33f86e04 <.text+0x6e04>
33f86aac:	e3a02004 	mov	r2, #4	; 0x4
33f86ab0:	eb000f51 	bl	33f8a7fc <strncmp>
33f86ab4:	e3500000 	cmp	r0, #0	; 0x0
33f86ab8:	0a000005 	beq	33f86ad4 <.text+0x6ad4>
33f86abc:	e5950004 	ldr	r0, [r5, #4]
33f86ac0:	e59f1340 	ldr	r1, [pc, #832]	; 33f86e08 <.text+0x6e08>
33f86ac4:	e3a02005 	mov	r2, #5	; 0x5
33f86ac8:	eb000f4b 	bl	33f8a7fc <strncmp>
33f86acc:	e3500000 	cmp	r0, #0	; 0x0
33f86ad0:	1a000059 	bne	33f86c3c <.text+0x6c3c>
33f86ad4:	e3a01000 	mov	r1, #0	; 0x0
33f86ad8:	e3a02010 	mov	r2, #16	; 0x10
33f86adc:	e5950008 	ldr	r0, [r5, #8]
33f86ae0:	eb001058 	bl	33f8ac48 <simple_strtoul>
33f86ae4:	e3a01000 	mov	r1, #0	; 0x0
33f86ae8:	e3a02010 	mov	r2, #16	; 0x10
33f86aec:	e1a09000 	mov	r9, r0
33f86af0:	e595000c 	ldr	r0, [r5, #12]
33f86af4:	eb001053 	bl	33f8ac48 <simple_strtoul>
33f86af8:	e3a01000 	mov	r1, #0	; 0x0
33f86afc:	e3a02010 	mov	r2, #16	; 0x10
33f86b00:	e1a0a000 	mov	sl, r0
33f86b04:	e5950010 	ldr	r0, [r5, #16]
33f86b08:	eb00104e 	bl	33f8ac48 <simple_strtoul>
33f86b0c:	e59f12f0 	ldr	r1, [pc, #752]	; 33f86e04 <.text+0x6e04>
33f86b10:	e3a02004 	mov	r2, #4	; 0x4
33f86b14:	e1a07000 	mov	r7, r0
33f86b18:	e5950004 	ldr	r0, [r5, #4]
33f86b1c:	eb000f36 	bl	33f8a7fc <strncmp>
33f86b20:	e3a0102e 	mov	r1, #46	; 0x2e
33f86b24:	e2706001 	rsbs	r6, r0, #1	; 0x1
33f86b28:	33a06000 	movcc	r6, #0	; 0x0
33f86b2c:	e5950004 	ldr	r0, [r5, #4]
33f86b30:	eb000f42 	bl	33f8a840 <strchr>
33f86b34:	e2504000 	subs	r4, r0, #0	; 0x0
33f86b38:	0a000020 	beq	33f86bc0 <.text+0x6bc0>
33f86b3c:	e59f12c8 	ldr	r1, [pc, #712]	; 33f86e0c <.text+0x6e0c>
33f86b40:	e3a02002 	mov	r2, #2	; 0x2
33f86b44:	eb000f2c 	bl	33f8a7fc <strncmp>
33f86b48:	e3500000 	cmp	r0, #0	; 0x0
33f86b4c:	1a00006a 	bne	33f86cfc <.text+0x6cfc>
33f86b50:	e3560000 	cmp	r6, #0	; 0x0
33f86b54:	e59f1274 	ldr	r1, [pc, #628]	; 33f86dd0 <.text+0x6dd0>
33f86b58:	e59f227c 	ldr	r2, [pc, #636]	; 33f86ddc <.text+0x6ddc>
33f86b5c:	e28dc008 	add	ip, sp, #8	; 0x8
33f86b60:	0a000009 	beq	33f86b8c <.text+0x6b8c>
33f86b64:	e5922000 	ldr	r2, [r2]
33f86b68:	e3a03058 	mov	r3, #88	; 0x58
33f86b6c:	e0201392 	mla	r0, r2, r3, r1
33f86b70:	e1a0100a 	mov	r1, sl
33f86b74:	e1a02007 	mov	r2, r7
33f86b78:	e1a0300c 	mov	r3, ip
33f86b7c:	e58d9000 	str	r9, [sp]
33f86b80:	ebffe9fe 	bl	33f81380 <nand_read_oob>
33f86b84:	e1a04000 	mov	r4, r0
33f86b88:	ea000083 	b	33f86d9c <.text+0x6d9c>
33f86b8c:	e5922000 	ldr	r2, [r2]
33f86b90:	e3a03058 	mov	r3, #88	; 0x58
33f86b94:	e0201392 	mla	r0, r2, r3, r1
33f86b98:	e1a0100a 	mov	r1, sl
33f86b9c:	e1a02007 	mov	r2, r7
33f86ba0:	e1a0300c 	mov	r3, ip
33f86ba4:	e58d9000 	str	r9, [sp]
33f86ba8:	ebffeb35 	bl	33f81884 <nand_write_oob>
33f86bac:	eafffff4 	b	33f86b84 <.text+0x6b84>
33f86bb0:	e3866002 	orr	r6, r6, #2	; 0x2
33f86bb4:	e3160001 	tst	r6, #1	; 0x1
33f86bb8:	0a000061 	beq	33f86d44 <.text+0x6d44>
33f86bbc:	e3866004 	orr	r6, r6, #4	; 0x4
33f86bc0:	e3160001 	tst	r6, #1	; 0x1
33f86bc4:	0a00005e 	beq	33f86d44 <.text+0x6d44>
33f86bc8:	e59f420c 	ldr	r4, [pc, #524]	; 33f86ddc <.text+0x6ddc>
33f86bcc:	e59f023c 	ldr	r0, [pc, #572]	; 33f86e10 <.text+0x6e10>
33f86bd0:	e5942000 	ldr	r2, [r4]
33f86bd4:	e59f1228 	ldr	r1, [pc, #552]	; 33f86e04 <.text+0x6e04>
33f86bd8:	e1a0300a 	mov	r3, sl
33f86bdc:	e58d7000 	str	r7, [sp]
33f86be0:	eb00041e 	bl	33f87c60 <printf>
33f86be4:	e5941000 	ldr	r1, [r4]
33f86be8:	e59f31e0 	ldr	r3, [pc, #480]	; 33f86dd0 <.text+0x6dd0>
33f86bec:	e3a02058 	mov	r2, #88	; 0x58
33f86bf0:	e0203291 	mla	r0, r1, r2, r3
33f86bf4:	e28dc008 	add	ip, sp, #8	; 0x8
33f86bf8:	e1a01006 	mov	r1, r6
33f86bfc:	e1a0200a 	mov	r2, sl
33f86c00:	e1a03007 	mov	r3, r7
33f86c04:	e58dc000 	str	ip, [sp]
33f86c08:	e58d9004 	str	r9, [sp, #4]
33f86c0c:	ebffecea 	bl	33f81fbc <nand_legacy_rw>
33f86c10:	e59d1008 	ldr	r1, [sp, #8]
33f86c14:	e1a04000 	mov	r4, r0
33f86c18:	e59f01e4 	ldr	r0, [pc, #484]	; 33f86e04 <.text+0x6e04>
33f86c1c:	e59f21f0 	ldr	r2, [pc, #496]	; 33f86e14 <.text+0x6e14>
33f86c20:	e3540000 	cmp	r4, #0	; 0x0
33f86c24:	e59f31ec 	ldr	r3, [pc, #492]	; 33f86e18 <.text+0x6e18>
33f86c28:	11a03002 	movne	r3, r2
33f86c2c:	e1a02000 	mov	r2, r0
33f86c30:	e59f01e4 	ldr	r0, [pc, #484]	; 33f86e1c <.text+0x6e1c>
33f86c34:	eb000409 	bl	33f87c60 <printf>
33f86c38:	ea000057 	b	33f86d9c <.text+0x6d9c>
33f86c3c:	e5950004 	ldr	r0, [r5, #4]
33f86c40:	e59f11b0 	ldr	r1, [pc, #432]	; 33f86df8 <.text+0x6df8>
33f86c44:	eb000ee1 	bl	33f8a7d0 <strcmp>
33f86c48:	e250a000 	subs	sl, r0, #0	; 0x0
33f86c4c:	1a000037 	bne	33f86d30 <.text+0x6d30>
33f86c50:	e3570004 	cmp	r7, #4	; 0x4
33f86c54:	0a000004 	beq	33f86c6c <.text+0x6c6c>
33f86c58:	e59f019c 	ldr	r0, [pc, #412]	; 33f86dfc <.text+0x6dfc>
33f86c5c:	e5951008 	ldr	r1, [r5, #8]
33f86c60:	eb000eda 	bl	33f8a7d0 <strcmp>
33f86c64:	e3500000 	cmp	r0, #0	; 0x0
33f86c68:	1a000030 	bne	33f86d30 <.text+0x6d30>
33f86c6c:	e3570005 	cmp	r7, #5	; 0x5
33f86c70:	13a07000 	movne	r7, #0	; 0x0
33f86c74:	03a07001 	moveq	r7, #1	; 0x1
33f86c78:	e0854107 	add	r4, r5, r7, lsl #2
33f86c7c:	e1a0100a 	mov	r1, sl
33f86c80:	e3a02010 	mov	r2, #16	; 0x10
33f86c84:	e5940008 	ldr	r0, [r4, #8]
33f86c88:	eb000fee 	bl	33f8ac48 <simple_strtoul>
33f86c8c:	e1a0100a 	mov	r1, sl
33f86c90:	e1a06000 	mov	r6, r0
33f86c94:	e3a02010 	mov	r2, #16	; 0x10
33f86c98:	e594000c 	ldr	r0, [r4, #12]
33f86c9c:	eb000fe9 	bl	33f8ac48 <simple_strtoul>
33f86ca0:	e59f4134 	ldr	r4, [pc, #308]	; 33f86ddc <.text+0x6ddc>
33f86ca4:	e1a05000 	mov	r5, r0
33f86ca8:	e5941000 	ldr	r1, [r4]
33f86cac:	e59f014c 	ldr	r0, [pc, #332]	; 33f86e00 <.text+0x6e00>
33f86cb0:	e1a02006 	mov	r2, r6
33f86cb4:	e1a03005 	mov	r3, r5
33f86cb8:	eb0003e8 	bl	33f87c60 <printf>
33f86cbc:	e5941000 	ldr	r1, [r4]
33f86cc0:	e59f3108 	ldr	r3, [pc, #264]	; 33f86dd0 <.text+0x6dd0>
33f86cc4:	e3a02058 	mov	r2, #88	; 0x58
33f86cc8:	e0203291 	mla	r0, r1, r2, r3
33f86ccc:	e1a01006 	mov	r1, r6
33f86cd0:	e1a02005 	mov	r2, r5
33f86cd4:	e1a03007 	mov	r3, r7
33f86cd8:	ebffef91 	bl	33f82b24 <nand_legacy_erase>
33f86cdc:	e59f3134 	ldr	r3, [pc, #308]	; 33f86e18 <.text+0x6e18>
33f86ce0:	e3500000 	cmp	r0, #0	; 0x0
33f86ce4:	e1a04000 	mov	r4, r0
33f86ce8:	e59f1124 	ldr	r1, [pc, #292]	; 33f86e14 <.text+0x6e14>
33f86cec:	e59f012c 	ldr	r0, [pc, #300]	; 33f86e20 <.text+0x6e20>
33f86cf0:	01a01003 	moveq	r1, r3
33f86cf4:	eb0003d9 	bl	33f87c60 <printf>
33f86cf8:	ea000027 	b	33f86d9c <.text+0x6d9c>
33f86cfc:	e1a00004 	mov	r0, r4
33f86d00:	e59f111c 	ldr	r1, [pc, #284]	; 33f86e24 <.text+0x6e24>
33f86d04:	e3a02002 	mov	r2, #2	; 0x2
33f86d08:	eb000ebb 	bl	33f8a7fc <strncmp>
33f86d0c:	e3500000 	cmp	r0, #0	; 0x0
33f86d10:	03866002 	orreq	r6, r6, #2	; 0x2
33f86d14:	0affffa9 	beq	33f86bc0 <.text+0x6bc0>
33f86d18:	e1a00004 	mov	r0, r4
33f86d1c:	e59f1104 	ldr	r1, [pc, #260]	; 33f86e28 <.text+0x6e28>
33f86d20:	e3a02002 	mov	r2, #2	; 0x2
33f86d24:	eb000eb4 	bl	33f8a7fc <strncmp>
33f86d28:	e3500000 	cmp	r0, #0	; 0x0
33f86d2c:	0affff9f 	beq	33f86bb0 <.text+0x6bb0>
33f86d30:	e59b1010 	ldr	r1, [fp, #16]
33f86d34:	e59f00f0 	ldr	r0, [pc, #240]	; 33f86e2c <.text+0x6e2c>
33f86d38:	eb0003c8 	bl	33f87c60 <printf>
33f86d3c:	e3a04001 	mov	r4, #1	; 0x1
33f86d40:	ea000015 	b	33f86d9c <.text+0x6d9c>
33f86d44:	e59f4090 	ldr	r4, [pc, #144]	; 33f86ddc <.text+0x6ddc>
33f86d48:	e59f00c0 	ldr	r0, [pc, #192]	; 33f86e10 <.text+0x6e10>
33f86d4c:	e5942000 	ldr	r2, [r4]
33f86d50:	e59f10b0 	ldr	r1, [pc, #176]	; 33f86e08 <.text+0x6e08>
33f86d54:	e1a0300a 	mov	r3, sl
33f86d58:	e58d7000 	str	r7, [sp]
33f86d5c:	eb0003bf 	bl	33f87c60 <printf>
33f86d60:	e5941000 	ldr	r1, [r4]
33f86d64:	e59f3064 	ldr	r3, [pc, #100]	; 33f86dd0 <.text+0x6dd0>
33f86d68:	e3a02058 	mov	r2, #88	; 0x58
33f86d6c:	e0203291 	mla	r0, r1, r2, r3
33f86d70:	e28dc008 	add	ip, sp, #8	; 0x8
33f86d74:	e1a01006 	mov	r1, r6
33f86d78:	e1a0200a 	mov	r2, sl
33f86d7c:	e1a03007 	mov	r3, r7
33f86d80:	e58dc000 	str	ip, [sp]
33f86d84:	e58d9004 	str	r9, [sp, #4]
33f86d88:	ebffec8b 	bl	33f81fbc <nand_legacy_rw>
33f86d8c:	e59d1008 	ldr	r1, [sp, #8]
33f86d90:	e1a04000 	mov	r4, r0
33f86d94:	e59f0094 	ldr	r0, [pc, #148]	; 33f86e30 <.text+0x6e30>
33f86d98:	eaffff9f 	b	33f86c1c <.text+0x6c1c>
33f86d9c:	e1a00004 	mov	r0, r4
33f86da0:	e28dd00c 	add	sp, sp, #12	; 0xc
33f86da4:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f86da8:	33f93ffc 	mvnccs	r3, #1008	; 0x3f0
33f86dac:	33f94018 	mvnccs	r4, #24	; 0x18
33f86db0:	33f94044 	mvnccs	r4, #68	; 0x44
33f86db4:	33f94074 	mvnccs	r4, #116	; 0x74
33f86db8:	33f9409c 	mvnccs	r4, #156	; 0x9c
33f86dbc:	33f94110 	mvnccs	r4, #4	; 0x4
33f86dc0:	33f94178 	mvnccs	r4, #30	; 0x1e
33f86dc4:	33f94194 	mvnccs	r4, #37	; 0x25
33f86dc8:	33f941cc 	mvnccs	r4, #51	; 0x33
33f86dcc:	33f94204 	mvnccs	r4, #1073741824	; 0x40000000
33f86dd0:	33f96264 	mvnccs	r6, #1073741830	; 0x40000006
33f86dd4:	33f9420c 	mvnccs	r4, #-1073741824	; 0xc0000000
33f86dd8:	33f93f18 	mvnccs	r3, #96	; 0x60
33f86ddc:	33f956b4 	mvnccs	r5, #188743680	; 0xb400000
33f86de0:	33f94230 	mvnccs	r4, #3	; 0x3
33f86de4:	33f94240 	mvnccs	r4, #4	; 0x4
33f86de8:	33f94218 	mvnccs	r4, #-2147483647	; 0x80000001
33f86dec:	33f94244 	mvnccs	r4, #1073741828	; 0x40000004
33f86df0:	33f9425c 	mvnccs	r4, #-1073741819	; 0xc0000005
33f86df4:	33f9426c 	mvnccs	r4, #-1073741818	; 0xc0000006
33f86df8:	33f94288 	mvnccs	r4, #-2147483640	; 0x80000008
33f86dfc:	33f94290 	mvnccs	r4, #9	; 0x9
33f86e00:	33f94298 	mvnccs	r4, #-2147483639	; 0x80000009
33f86e04:	33f942d8 	mvnccs	r4, #-2147483635	; 0x8000000d
33f86e08:	33f942e0 	mvnccs	r4, #14	; 0xe
33f86e0c:	33f942e8 	mvnccs	r4, #-2147483634	; 0x8000000e
33f86e10:	33f942f0 	mvnccs	r4, #15	; 0xf
33f86e14:	33f942d0 	mvnccs	r4, #13	; 0xd
33f86e18:	33f942cc 	mvnccs	r4, #-1073741812	; 0xc000000c
33f86e1c:	33f94320 	mvnccs	r4, #-2147483648	; 0x80000000
33f86e20:	33f953b4 	mvnccs	r5, #-805306366	; 0xd0000002
33f86e24:	33f94334 	mvnccs	r4, #-805306368	; 0xd0000000
33f86e28:	33f9433c 	mvnccs	r4, #-268435456	; 0xf0000000
33f86e2c:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000
33f86e30:	33f94344 	mvnccs	r4, #268435457	; 0x10000001

33f86e34 <envmatch>:
33f86e34:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f86e38:	e1a06000 	mov	r6, r0
33f86e3c:	e1a05001 	mov	r5, r1
33f86e40:	ea000002 	b	33f86e50 <envmatch+0x1c>
33f86e44:	e353003d 	cmp	r3, #61	; 0x3d
33f86e48:	0a000012 	beq	33f86e98 <envmatch+0x64>
33f86e4c:	e1a05004 	mov	r5, r4
33f86e50:	e1a00005 	mov	r0, r5
33f86e54:	e59f7044 	ldr	r7, [pc, #68]	; 33f86ea0 <.text+0x6ea0>
33f86e58:	e5d64000 	ldrb	r4, [r6]
33f86e5c:	e1a0e00f 	mov	lr, pc
33f86e60:	e597f000 	ldr	pc, [r7]
33f86e64:	e1540000 	cmp	r4, r0
33f86e68:	e5d63000 	ldrb	r3, [r6]
33f86e6c:	e2854001 	add	r4, r5, #1	; 0x1
33f86e70:	e2866001 	add	r6, r6, #1	; 0x1
33f86e74:	0afffff2 	beq	33f86e44 <envmatch+0x10>
33f86e78:	e3530000 	cmp	r3, #0	; 0x0
33f86e7c:	1a000004 	bne	33f86e94 <envmatch+0x60>
33f86e80:	e1a00005 	mov	r0, r5
33f86e84:	e1a0e00f 	mov	lr, pc
33f86e88:	e597f000 	ldr	pc, [r7]
33f86e8c:	e350003d 	cmp	r0, #61	; 0x3d
33f86e90:	0a000000 	beq	33f86e98 <envmatch+0x64>
33f86e94:	e3e04000 	mvn	r4, #0	; 0x0
33f86e98:	e1a00004 	mov	r0, r4
33f86e9c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f86ea0:	33f95b00 	mvnccs	r5, #0	; 0x0

33f86ea4 <getenv_r>:
33f86ea4:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f86ea8:	e1a0a000 	mov	sl, r0
33f86eac:	e1a07001 	mov	r7, r1
33f86eb0:	e1a09002 	mov	r9, r2
33f86eb4:	e3a05000 	mov	r5, #0	; 0x0
33f86eb8:	ea00001f 	b	33f86f3c <getenv_r+0x98>
33f86ebc:	e3540901 	cmp	r4, #16384	; 0x4000
33f86ec0:	aa000024 	bge	33f86f58 <getenv_r+0xb4>
33f86ec4:	e2844001 	add	r4, r4, #1	; 0x1
33f86ec8:	e1a00004 	mov	r0, r4
33f86ecc:	e59f3090 	ldr	r3, [pc, #144]	; 33f86f64 <.text+0x6f64>
33f86ed0:	e1a0e00f 	mov	lr, pc
33f86ed4:	e593f000 	ldr	pc, [r3]
33f86ed8:	e2506000 	subs	r6, r0, #0	; 0x0
33f86edc:	1afffff6 	bne	33f86ebc <getenv_r+0x18>
33f86ee0:	e1a01005 	mov	r1, r5
33f86ee4:	e1a0000a 	mov	r0, sl
33f86ee8:	ebffffd1 	bl	33f86e34 <envmatch>
33f86eec:	e2505000 	subs	r5, r0, #0	; 0x0
33f86ef0:	ba000010 	blt	33f86f38 <getenv_r+0x94>
33f86ef4:	e1a04006 	mov	r4, r6
33f86ef8:	e2844001 	add	r4, r4, #1	; 0x1
33f86efc:	e2893001 	add	r3, r9, #1	; 0x1
33f86f00:	e1540003 	cmp	r4, r3
33f86f04:	e1a00005 	mov	r0, r5
33f86f08:	e2855001 	add	r5, r5, #1	; 0x1
33f86f0c:	0a000005 	beq	33f86f28 <getenv_r+0x84>
33f86f10:	e59f304c 	ldr	r3, [pc, #76]	; 33f86f64 <.text+0x6f64>
33f86f14:	e1a0e00f 	mov	lr, pc
33f86f18:	e593f000 	ldr	pc, [r3]
33f86f1c:	e3500000 	cmp	r0, #0	; 0x0
33f86f20:	e4c70001 	strb	r0, [r7], #1
33f86f24:	1afffff3 	bne	33f86ef8 <getenv_r+0x54>
33f86f28:	e1590004 	cmp	r9, r4
33f86f2c:	03a03000 	moveq	r3, #0	; 0x0
33f86f30:	05c73000 	streqb	r3, [r7]
33f86f34:	ea000008 	b	33f86f5c <getenv_r+0xb8>
33f86f38:	e2845001 	add	r5, r4, #1	; 0x1
33f86f3c:	e1a00005 	mov	r0, r5
33f86f40:	e59f301c 	ldr	r3, [pc, #28]	; 33f86f64 <.text+0x6f64>
33f86f44:	e1a0e00f 	mov	lr, pc
33f86f48:	e593f000 	ldr	pc, [r3]
33f86f4c:	e3500000 	cmp	r0, #0	; 0x0
33f86f50:	11a04005 	movne	r4, r5
33f86f54:	1affffdb 	bne	33f86ec8 <getenv_r+0x24>
33f86f58:	e3e04000 	mvn	r4, #0	; 0x0
33f86f5c:	e1a00004 	mov	r0, r4
33f86f60:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f86f64:	33f95b00 	mvnccs	r5, #0	; 0x0

33f86f68 <do_saveenv>:
33f86f68:	e52de004 	str	lr, [sp, #-4]!
33f86f6c:	e59f3018 	ldr	r3, [pc, #24]	; 33f86f8c <.text+0x6f8c>
33f86f70:	e59f0018 	ldr	r0, [pc, #24]	; 33f86f90 <.text+0x6f90>
33f86f74:	e5931000 	ldr	r1, [r3]
33f86f78:	eb000338 	bl	33f87c60 <printf>
33f86f7c:	eb0008e9 	bl	33f89328 <saveenv>
33f86f80:	e2500000 	subs	r0, r0, #0	; 0x0
33f86f84:	13a00001 	movne	r0, #1	; 0x1
33f86f88:	e49df004 	ldr	pc, [sp], #4
33f86f8c:	33f95bc4 	mvnccs	r5, #200704	; 0x31000
33f86f90:	33f9456c 	mvnccs	r4, #452984832	; 0x1b000000

33f86f94 <getenv>:
33f86f94:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f86f98:	e1a06000 	mov	r6, r0
33f86f9c:	e3a05000 	mov	r5, #0	; 0x0
33f86fa0:	ea000010 	b	33f86fe8 <getenv+0x54>
33f86fa4:	e3540901 	cmp	r4, #16384	; 0x4000
33f86fa8:	aa000015 	bge	33f87004 <getenv+0x70>
33f86fac:	e2844001 	add	r4, r4, #1	; 0x1
33f86fb0:	e1a00004 	mov	r0, r4
33f86fb4:	e59f3050 	ldr	r3, [pc, #80]	; 33f8700c <.text+0x700c>
33f86fb8:	e1a0e00f 	mov	lr, pc
33f86fbc:	e593f000 	ldr	pc, [r3]
33f86fc0:	e3500000 	cmp	r0, #0	; 0x0
33f86fc4:	1afffff6 	bne	33f86fa4 <getenv+0x10>
33f86fc8:	e1a01005 	mov	r1, r5
33f86fcc:	e1a00006 	mov	r0, r6
33f86fd0:	ebffff97 	bl	33f86e34 <envmatch>
33f86fd4:	e3500000 	cmp	r0, #0	; 0x0
33f86fd8:	ba000001 	blt	33f86fe4 <getenv+0x50>
33f86fdc:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
33f86fe0:	ea000840 	b	33f890e8 <env_get_addr>
33f86fe4:	e2845001 	add	r5, r4, #1	; 0x1
33f86fe8:	e1a00005 	mov	r0, r5
33f86fec:	e59f3018 	ldr	r3, [pc, #24]	; 33f8700c <.text+0x700c>
33f86ff0:	e1a0e00f 	mov	lr, pc
33f86ff4:	e593f000 	ldr	pc, [r3]
33f86ff8:	e3500000 	cmp	r0, #0	; 0x0
33f86ffc:	11a04005 	movne	r4, r5
33f87000:	1affffea 	bne	33f86fb0 <getenv+0x1c>
33f87004:	e3a00000 	mov	r0, #0	; 0x0
33f87008:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8700c:	33f95b00 	mvnccs	r5, #0	; 0x0

33f87010 <_do_setenv>:
33f87010:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f87014:	e24dd010 	sub	sp, sp, #16	; 0x10
33f87018:	e58d1000 	str	r1, [sp]
33f8701c:	e5983000 	ldr	r3, [r8]
33f87020:	e3a00000 	mov	r0, #0	; 0x0
33f87024:	e1a09002 	mov	r9, r2
33f87028:	e58d3008 	str	r3, [sp, #8]
33f8702c:	eb00082d 	bl	33f890e8 <env_get_addr>
33f87030:	e250b000 	subs	fp, r0, #0	; 0x0
33f87034:	0a0000fc 	beq	33f8742c <_do_setenv+0x41c>
33f87038:	e599a004 	ldr	sl, [r9, #4]
33f8703c:	e2891004 	add	r1, r9, #4	; 0x4
33f87040:	e1a0500b 	mov	r5, fp
33f87044:	e3e00000 	mvn	r0, #0	; 0x0
33f87048:	e3a07000 	mov	r7, #0	; 0x0
33f8704c:	e58d1004 	str	r1, [sp, #4]
33f87050:	ea000009 	b	33f8707c <_do_setenv+0x6c>
33f87054:	e2877001 	add	r7, r7, #1	; 0x1
33f87058:	e5d73000 	ldrb	r3, [r7]
33f8705c:	e3530000 	cmp	r3, #0	; 0x0
33f87060:	1afffffb 	bne	33f87054 <_do_setenv+0x44>
33f87064:	e1a0000a 	mov	r0, sl
33f87068:	e06b1005 	rsb	r1, fp, r5
33f8706c:	ebffff70 	bl	33f86e34 <envmatch>
33f87070:	e3500000 	cmp	r0, #0	; 0x0
33f87074:	aa000006 	bge	33f87094 <_do_setenv+0x84>
33f87078:	e2875001 	add	r5, r7, #1	; 0x1
33f8707c:	e5d53000 	ldrb	r3, [r5]
33f87080:	e3530000 	cmp	r3, #0	; 0x0
33f87084:	11a07005 	movne	r7, r5
33f87088:	1afffff2 	bne	33f87058 <_do_setenv+0x48>
33f8708c:	e3500000 	cmp	r0, #0	; 0x0
33f87090:	ba000054 	blt	33f871e8 <_do_setenv+0x1d8>
33f87094:	e1a0000a 	mov	r0, sl
33f87098:	e59f13a4 	ldr	r1, [pc, #932]	; 33f87444 <.text+0x7444>
33f8709c:	eb000dcb 	bl	33f8a7d0 <strcmp>
33f870a0:	e3500000 	cmp	r0, #0	; 0x0
33f870a4:	0a00000b 	beq	33f870d8 <_do_setenv+0xc8>
33f870a8:	e1a0000a 	mov	r0, sl
33f870ac:	e59f1394 	ldr	r1, [pc, #916]	; 33f87448 <.text+0x7448>
33f870b0:	eb000dc6 	bl	33f8a7d0 <strcmp>
33f870b4:	e3500000 	cmp	r0, #0	; 0x0
33f870b8:	02800001 	addeq	r0, r0, #1	; 0x1
33f870bc:	0a000005 	beq	33f870d8 <_do_setenv+0xc8>
33f870c0:	e1a0000a 	mov	r0, sl
33f870c4:	e59f1380 	ldr	r1, [pc, #896]	; 33f8744c <.text+0x744c>
33f870c8:	eb000dc0 	bl	33f8a7d0 <strcmp>
33f870cc:	e3500000 	cmp	r0, #0	; 0x0
33f870d0:	1a000009 	bne	33f870fc <_do_setenv+0xec>
33f870d4:	e2800002 	add	r0, r0, #2	; 0x2
33f870d8:	e59d2000 	ldr	r2, [sp]
33f870dc:	e3520002 	cmp	r2, #2	; 0x2
33f870e0:	d1a0100a 	movle	r1, sl
33f870e4:	d59f0364 	ldrle	r0, [pc, #868]	; 33f87450 <.text+0x7450>
33f870e8:	da00001c 	ble	33f87160 <_do_setenv+0x150>
33f870ec:	e5991008 	ldr	r1, [r9, #8]
33f870f0:	eb000290 	bl	33f87b38 <console_assign>
33f870f4:	e3500000 	cmp	r0, #0	; 0x0
33f870f8:	ba0000cb 	blt	33f8742c <_do_setenv+0x41c>
33f870fc:	e59d3004 	ldr	r3, [sp, #4]
33f87100:	e59f134c 	ldr	r1, [pc, #844]	; 33f87454 <.text+0x7454>
33f87104:	e5930000 	ldr	r0, [r3]
33f87108:	eb000db0 	bl	33f8a7d0 <strcmp>
33f8710c:	e2506000 	subs	r6, r0, #0	; 0x0
33f87110:	1a000020 	bne	33f87198 <_do_setenv+0x188>
33f87114:	e3a0200a 	mov	r2, #10	; 0xa
33f87118:	e5990008 	ldr	r0, [r9, #8]
33f8711c:	e1a01006 	mov	r1, r6
33f87120:	eb000ec8 	bl	33f8ac48 <simple_strtoul>
33f87124:	e59f232c 	ldr	r2, [pc, #812]	; 33f87458 <.text+0x7458>
33f87128:	e1a04000 	mov	r4, r0
33f8712c:	e1a00006 	mov	r0, r6
33f87130:	e5923000 	ldr	r3, [r2]
33f87134:	e1540003 	cmp	r4, r3
33f87138:	e2822004 	add	r2, r2, #4	; 0x4
33f8713c:	1a000002 	bne	33f8714c <_do_setenv+0x13c>
33f87140:	e3500005 	cmp	r0, #5	; 0x5
33f87144:	1a000007 	bne	33f87168 <_do_setenv+0x158>
33f87148:	ea000002 	b	33f87158 <_do_setenv+0x148>
33f8714c:	e2800001 	add	r0, r0, #1	; 0x1
33f87150:	e3500005 	cmp	r0, #5	; 0x5
33f87154:	1afffff5 	bne	33f87130 <_do_setenv+0x120>
33f87158:	e59f02fc 	ldr	r0, [pc, #764]	; 33f8745c <.text+0x745c>
33f8715c:	e1a01004 	mov	r1, r4
33f87160:	eb0002be 	bl	33f87c60 <printf>
33f87164:	ea0000b0 	b	33f8742c <_do_setenv+0x41c>
33f87168:	e1a01004 	mov	r1, r4
33f8716c:	e59f02ec 	ldr	r0, [pc, #748]	; 33f87460 <.text+0x7460>
33f87170:	eb0002ba 	bl	33f87c60 <printf>
33f87174:	e59f02e8 	ldr	r0, [pc, #744]	; 33f87464 <.text+0x7464>
33f87178:	ebffe5c8 	bl	33f808a0 <udelay>
33f8717c:	e5884008 	str	r4, [r8, #8]
33f87180:	eb001cad 	bl	33f8e43c <serial_setbrg>
33f87184:	e59f02d8 	ldr	r0, [pc, #728]	; 33f87464 <.text+0x7464>
33f87188:	ebffe5c4 	bl	33f808a0 <udelay>
33f8718c:	eb000349 	bl	33f87eb8 <getc>
33f87190:	e350000d 	cmp	r0, #13	; 0xd
33f87194:	1afffffc 	bne	33f8718c <_do_setenv+0x17c>
33f87198:	e5d73001 	ldrb	r3, [r7, #1]
33f8719c:	e3530000 	cmp	r3, #0	; 0x0
33f871a0:	e2872001 	add	r2, r7, #1	; 0x1
33f871a4:	1a000003 	bne	33f871b8 <_do_setenv+0x1a8>
33f871a8:	e155000b 	cmp	r5, fp
33f871ac:	82455001 	subhi	r5, r5, #1	; 0x1
33f871b0:	95c53000 	strlsb	r3, [r5]
33f871b4:	ea000009 	b	33f871e0 <_do_setenv+0x1d0>
33f871b8:	e4d23001 	ldrb	r3, [r2], #1
33f871bc:	e5c53000 	strb	r3, [r5]
33f871c0:	e5d53000 	ldrb	r3, [r5]
33f871c4:	e3530000 	cmp	r3, #0	; 0x0
33f871c8:	1a000002 	bne	33f871d8 <_do_setenv+0x1c8>
33f871cc:	e5d23000 	ldrb	r3, [r2]
33f871d0:	e3530000 	cmp	r3, #0	; 0x0
33f871d4:	0a000001 	beq	33f871e0 <_do_setenv+0x1d0>
33f871d8:	e2855001 	add	r5, r5, #1	; 0x1
33f871dc:	eafffff5 	b	33f871b8 <_do_setenv+0x1a8>
33f871e0:	e3a03000 	mov	r3, #0	; 0x0
33f871e4:	e5c53001 	strb	r3, [r5, #1]
33f871e8:	e59d1000 	ldr	r1, [sp]
33f871ec:	e3510002 	cmp	r1, #2	; 0x2
33f871f0:	da000004 	ble	33f87208 <_do_setenv+0x1f8>
33f871f4:	e5993008 	ldr	r3, [r9, #8]
33f871f8:	e3530000 	cmp	r3, #0	; 0x0
33f871fc:	e2899008 	add	r9, r9, #8	; 0x8
33f87200:	11a0200b 	movne	r2, fp
33f87204:	1a000002 	bne	33f87214 <_do_setenv+0x204>
33f87208:	eb0007c8 	bl	33f89130 <env_crc_update>
33f8720c:	ea000088 	b	33f87434 <_do_setenv+0x424>
33f87210:	e2822001 	add	r2, r2, #1	; 0x1
33f87214:	e5d23000 	ldrb	r3, [r2]
33f87218:	e3530000 	cmp	r3, #0	; 0x0
33f8721c:	e2824001 	add	r4, r2, #1	; 0x1
33f87220:	1afffffa 	bne	33f87210 <_do_setenv+0x200>
33f87224:	e5d23001 	ldrb	r3, [r2, #1]
33f87228:	e3530000 	cmp	r3, #0	; 0x0
33f8722c:	1afffff7 	bne	33f87210 <_do_setenv+0x200>
33f87230:	e152000b 	cmp	r2, fp
33f87234:	e1a0000a 	mov	r0, sl
33f87238:	91a04002 	movls	r4, r2
33f8723c:	eb000d8a 	bl	33f8a86c <strlen>
33f87240:	e1a07009 	mov	r7, r9
33f87244:	e2805002 	add	r5, r0, #2	; 0x2
33f87248:	e3a06002 	mov	r6, #2	; 0x2
33f8724c:	e4970004 	ldr	r0, [r7], #4
33f87250:	eb000d85 	bl	33f8a86c <strlen>
33f87254:	e59d2000 	ldr	r2, [sp]
33f87258:	e2866001 	add	r6, r6, #1	; 0x1
33f8725c:	e2800001 	add	r0, r0, #1	; 0x1
33f87260:	e1560002 	cmp	r6, r2
33f87264:	e0855000 	add	r5, r5, r0
33f87268:	1afffff7 	bne	33f8724c <_do_setenv+0x23c>
33f8726c:	e064300b 	rsb	r3, r4, fp
33f87270:	e2833dff 	add	r3, r3, #16320	; 0x3fc0
33f87274:	e283303c 	add	r3, r3, #60	; 0x3c
33f87278:	e1550003 	cmp	r5, r3
33f8727c:	c1a0100a 	movgt	r1, sl
33f87280:	c59f01e0 	ldrgt	r0, [pc, #480]	; 33f87468 <.text+0x7468>
33f87284:	caffffb5 	bgt	33f87160 <_do_setenv+0x150>
33f87288:	ea000000 	b	33f87290 <_do_setenv+0x280>
33f8728c:	e2844001 	add	r4, r4, #1	; 0x1
33f87290:	e4da3001 	ldrb	r3, [sl], #1
33f87294:	e5c43000 	strb	r3, [r4]
33f87298:	e5d43000 	ldrb	r3, [r4]
33f8729c:	e3530000 	cmp	r3, #0	; 0x0
33f872a0:	1afffff9 	bne	33f8728c <_do_setenv+0x27c>
33f872a4:	e1a02009 	mov	r2, r9
33f872a8:	e3a00002 	mov	r0, #2	; 0x2
33f872ac:	e3500002 	cmp	r0, #2	; 0x2
33f872b0:	03a0303d 	moveq	r3, #61	; 0x3d
33f872b4:	13a03020 	movne	r3, #32	; 0x20
33f872b8:	e5921000 	ldr	r1, [r2]
33f872bc:	e5c43000 	strb	r3, [r4]
33f872c0:	e4d13001 	ldrb	r3, [r1], #1
33f872c4:	e5e43001 	strb	r3, [r4, #1]!
33f872c8:	e5d43000 	ldrb	r3, [r4]
33f872cc:	e3530000 	cmp	r3, #0	; 0x0
33f872d0:	1afffffa 	bne	33f872c0 <_do_setenv+0x2b0>
33f872d4:	e59d1000 	ldr	r1, [sp]
33f872d8:	e2800001 	add	r0, r0, #1	; 0x1
33f872dc:	e1500001 	cmp	r0, r1
33f872e0:	e2822004 	add	r2, r2, #4	; 0x4
33f872e4:	1afffff0 	bne	33f872ac <_do_setenv+0x29c>
33f872e8:	e5c43001 	strb	r3, [r4, #1]
33f872ec:	eb00078f 	bl	33f89130 <env_crc_update>
33f872f0:	e59d2004 	ldr	r2, [sp, #4]
33f872f4:	e59f1170 	ldr	r1, [pc, #368]	; 33f8746c <.text+0x746c>
33f872f8:	e5920000 	ldr	r0, [r2]
33f872fc:	eb000d33 	bl	33f8a7d0 <strcmp>
33f87300:	e3500000 	cmp	r0, #0	; 0x0
33f87304:	1a000013 	bne	33f87358 <_do_setenv+0x348>
33f87308:	e599c000 	ldr	ip, [r9]
33f8730c:	e1a05000 	mov	r5, r0
33f87310:	e59d3008 	ldr	r3, [sp, #8]
33f87314:	e35c0000 	cmp	ip, #0	; 0x0
33f87318:	e0854003 	add	r4, r5, r3
33f8731c:	e1a0000c 	mov	r0, ip
33f87320:	e28d100c 	add	r1, sp, #12	; 0xc
33f87324:	e3a02010 	mov	r2, #16	; 0x10
33f87328:	05c4c008 	streqb	ip, [r4, #8]
33f8732c:	0a000005 	beq	33f87348 <_do_setenv+0x338>
33f87330:	eb000e44 	bl	33f8ac48 <simple_strtoul>
33f87334:	e5c40008 	strb	r0, [r4, #8]
33f87338:	e59dc00c 	ldr	ip, [sp, #12]
33f8733c:	e5dc3000 	ldrb	r3, [ip]
33f87340:	e3530000 	cmp	r3, #0	; 0x0
33f87344:	128cc001 	addne	ip, ip, #1	; 0x1
33f87348:	e2855001 	add	r5, r5, #1	; 0x1
33f8734c:	e3550006 	cmp	r5, #6	; 0x6
33f87350:	0a000037 	beq	33f87434 <_do_setenv+0x424>
33f87354:	eaffffed 	b	33f87310 <_do_setenv+0x300>
33f87358:	e59d1004 	ldr	r1, [sp, #4]
33f8735c:	e5910000 	ldr	r0, [r1]
33f87360:	e59f1108 	ldr	r1, [pc, #264]	; 33f87470 <.text+0x7470>
33f87364:	eb000d19 	bl	33f8a7d0 <strcmp>
33f87368:	e3500000 	cmp	r0, #0	; 0x0
33f8736c:	1a000020 	bne	33f873f4 <_do_setenv+0x3e4>
33f87370:	e59d2008 	ldr	r2, [sp, #8]
33f87374:	e599c000 	ldr	ip, [r9]
33f87378:	e5820004 	str	r0, [r2, #4]
33f8737c:	e1a0e000 	mov	lr, r0
33f87380:	e1a05000 	mov	r5, r0
33f87384:	e1a0440e 	mov	r4, lr, lsl #8
33f87388:	e35c0000 	cmp	ip, #0	; 0x0
33f8738c:	e1a0000c 	mov	r0, ip
33f87390:	e28d100c 	add	r1, sp, #12	; 0xc
33f87394:	e3a0200a 	mov	r2, #10	; 0xa
33f87398:	e1a0e004 	mov	lr, r4
33f8739c:	0a000006 	beq	33f873bc <_do_setenv+0x3ac>
33f873a0:	eb000e28 	bl	33f8ac48 <simple_strtoul>
33f873a4:	e59dc00c 	ldr	ip, [sp, #12]
33f873a8:	e5dc3000 	ldrb	r3, [ip]
33f873ac:	e20000ff 	and	r0, r0, #255	; 0xff
33f873b0:	e3530000 	cmp	r3, #0	; 0x0
33f873b4:	e184e000 	orr	lr, r4, r0
33f873b8:	128cc001 	addne	ip, ip, #1	; 0x1
33f873bc:	e2855001 	add	r5, r5, #1	; 0x1
33f873c0:	e3550004 	cmp	r5, #4	; 0x4
33f873c4:	1affffee 	bne	33f87384 <_do_setenv+0x374>
33f873c8:	e20e3cff 	and	r3, lr, #65280	; 0xff00
33f873cc:	e20e28ff 	and	r2, lr, #16711680	; 0xff0000
33f873d0:	e1a03403 	mov	r3, r3, lsl #8
33f873d4:	e1a02422 	mov	r2, r2, lsr #8
33f873d8:	e1822c2e 	orr	r2, r2, lr, lsr #24
33f873dc:	e1833c0e 	orr	r3, r3, lr, lsl #24
33f873e0:	e1833002 	orr	r3, r3, r2
33f873e4:	e59d2008 	ldr	r2, [sp, #8]
33f873e8:	e3a01000 	mov	r1, #0	; 0x0
33f873ec:	e5823004 	str	r3, [r2, #4]
33f873f0:	ea000010 	b	33f87438 <_do_setenv+0x428>
33f873f4:	e59d3004 	ldr	r3, [sp, #4]
33f873f8:	e59f1074 	ldr	r1, [pc, #116]	; 33f87474 <.text+0x7474>
33f873fc:	e5930000 	ldr	r0, [r3]
33f87400:	eb000cf2 	bl	33f8a7d0 <strcmp>
33f87404:	e2504000 	subs	r4, r0, #0	; 0x0
33f87408:	1a000009 	bne	33f87434 <_do_setenv+0x424>
33f8740c:	e1a01004 	mov	r1, r4
33f87410:	e5990000 	ldr	r0, [r9]
33f87414:	e3a02010 	mov	r2, #16	; 0x10
33f87418:	eb000e0a 	bl	33f8ac48 <simple_strtoul>
33f8741c:	e59f3054 	ldr	r3, [pc, #84]	; 33f87478 <.text+0x7478>
33f87420:	e1a01004 	mov	r1, r4
33f87424:	e5830000 	str	r0, [r3]
33f87428:	ea000002 	b	33f87438 <_do_setenv+0x428>
33f8742c:	e3a01001 	mov	r1, #1	; 0x1
33f87430:	ea000000 	b	33f87438 <_do_setenv+0x428>
33f87434:	e3a01000 	mov	r1, #0	; 0x0
33f87438:	e1a00001 	mov	r0, r1
33f8743c:	e28dd010 	add	sp, sp, #16	; 0x10
33f87440:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f87444:	33f9458c 	mvnccs	r4, #587202560	; 0x23000000
33f87448:	33f94594 	mvnccs	r4, #620756992	; 0x25000000
33f8744c:	33f9459c 	mvnccs	r4, #654311424	; 0x27000000
33f87450:	33f945a4 	mvnccs	r4, #687865856	; 0x29000000
33f87454:	33f92060 	mvnccs	r2, #96	; 0x60
33f87458:	33f916bc 	mvnccs	r1, #197132288	; 0xbc00000
33f8745c:	33f945b8 	mvnccs	r4, #771751936	; 0x2e000000
33f87460:	33f93494 	mvnccs	r3, #-1811939328	; 0x94000000
33f87464:	0000c350 	andeq	ip, r0, r0, asr r3
33f87468:	33f945dc 	mvnccs	r4, #922746880	; 0x37000000
33f8746c:	33f9207c 	mvnccs	r2, #124	; 0x7c
33f87470:	33f92074 	mvnccs	r2, #116	; 0x74
33f87474:	33f92084 	mvnccs	r2, #132	; 0x84
33f87478:	33f956d4 	mvnccs	r5, #222298112	; 0xd400000

33f8747c <do_setenv>:
33f8747c:	e3520001 	cmp	r2, #1	; 0x1
33f87480:	e52de004 	str	lr, [sp, #-4]!
33f87484:	e1a0c001 	mov	ip, r1
33f87488:	e1a0e000 	mov	lr, r0
33f8748c:	e1a01002 	mov	r1, r2
33f87490:	e59f0020 	ldr	r0, [pc, #32]	; 33f874b8 <.text+0x74b8>
33f87494:	e1a02003 	mov	r2, r3
33f87498:	da000002 	ble	33f874a8 <do_setenv+0x2c>
33f8749c:	e1a0000c 	mov	r0, ip
33f874a0:	e49de004 	ldr	lr, [sp], #4
33f874a4:	eafffed9 	b	33f87010 <_do_setenv>
33f874a8:	e59e1010 	ldr	r1, [lr, #16]
33f874ac:	eb0001eb 	bl	33f87c60 <printf>
33f874b0:	e3a00001 	mov	r0, #1	; 0x1
33f874b4:	e49df004 	ldr	pc, [sp], #4
33f874b8:	33f925dc 	mvnccs	r2, #922746880	; 0x37000000

33f874bc <setenv>:
33f874bc:	e52de004 	str	lr, [sp, #-4]!
33f874c0:	e3a0c000 	mov	ip, #0	; 0x0
33f874c4:	e24dd010 	sub	sp, sp, #16	; 0x10
33f874c8:	e59f3020 	ldr	r3, [pc, #32]	; 33f874f0 <.text+0x74f0>
33f874cc:	e98d0003 	stmib	sp, {r0, r1}
33f874d0:	e1a0000c 	mov	r0, ip
33f874d4:	e3a01003 	mov	r1, #3	; 0x3
33f874d8:	e1a0200d 	mov	r2, sp
33f874dc:	e58d3000 	str	r3, [sp]
33f874e0:	e58dc00c 	str	ip, [sp, #12]
33f874e4:	ebfffec9 	bl	33f87010 <_do_setenv>
33f874e8:	e28dd010 	add	sp, sp, #16	; 0x10
33f874ec:	e8bd8000 	ldmia	sp!, {pc}
33f874f0:	33f9460c 	mvnccs	r4, #12582912	; 0xc00000

33f874f4 <do_printenv>:
33f874f4:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f874f8:	e3520001 	cmp	r2, #1	; 0x1
33f874fc:	e24dd004 	sub	sp, sp, #4	; 0x4
33f87500:	e1a0b002 	mov	fp, r2
33f87504:	e58d3000 	str	r3, [sp]
33f87508:	13a09001 	movne	r9, #1	; 0x1
33f8750c:	13a0a000 	movne	sl, #0	; 0x0
33f87510:	03a04000 	moveq	r4, #0	; 0x0
33f87514:	0a00001a 	beq	33f87584 <do_printenv+0x90>
33f87518:	ea000057 	b	33f8767c <do_printenv+0x188>
33f8751c:	e2855001 	add	r5, r5, #1	; 0x1
33f87520:	e1a00005 	mov	r0, r5
33f87524:	e59f3164 	ldr	r3, [pc, #356]	; 33f87690 <.text+0x7690>
33f87528:	e1a0e00f 	mov	lr, pc
33f8752c:	e593f000 	ldr	pc, [r3]
33f87530:	e3500000 	cmp	r0, #0	; 0x0
33f87534:	1afffff8 	bne	33f8751c <do_printenv+0x28>
33f87538:	ea000003 	b	33f8754c <do_printenv+0x58>
33f8753c:	e59f314c 	ldr	r3, [pc, #332]	; 33f87690 <.text+0x7690>
33f87540:	e1a0e00f 	mov	lr, pc
33f87544:	e593f000 	ldr	pc, [r3]
33f87548:	eb00024a 	bl	33f87e78 <putc>
33f8754c:	e1540005 	cmp	r4, r5
33f87550:	e1a00004 	mov	r0, r4
33f87554:	e2844001 	add	r4, r4, #1	; 0x1
33f87558:	bafffff7 	blt	33f8753c <do_printenv+0x48>
33f8755c:	e3a0000a 	mov	r0, #10	; 0xa
33f87560:	eb000244 	bl	33f87e78 <putc>
33f87564:	eb000259 	bl	33f87ed0 <ctrlc>
33f87568:	e3500000 	cmp	r0, #0	; 0x0
33f8756c:	0a000003 	beq	33f87580 <do_printenv+0x8c>
33f87570:	e59f011c 	ldr	r0, [pc, #284]	; 33f87694 <.text+0x7694>
33f87574:	eb0001a6 	bl	33f87c14 <puts>
33f87578:	e3a0a001 	mov	sl, #1	; 0x1
33f8757c:	ea000040 	b	33f87684 <do_printenv+0x190>
33f87580:	e2854001 	add	r4, r5, #1	; 0x1
33f87584:	e1a00004 	mov	r0, r4
33f87588:	e59f3100 	ldr	r3, [pc, #256]	; 33f87690 <.text+0x7690>
33f8758c:	e1a0e00f 	mov	lr, pc
33f87590:	e593f000 	ldr	pc, [r3]
33f87594:	e2505000 	subs	r5, r0, #0	; 0x0
33f87598:	11a05004 	movne	r5, r4
33f8759c:	1affffdf 	bne	33f87520 <do_printenv+0x2c>
33f875a0:	e1a01004 	mov	r1, r4
33f875a4:	e59f00ec 	ldr	r0, [pc, #236]	; 33f87698 <.text+0x7698>
33f875a8:	e59f20ec 	ldr	r2, [pc, #236]	; 33f8769c <.text+0x769c>
33f875ac:	eb0001ab 	bl	33f87c60 <printf>
33f875b0:	e1a0a005 	mov	sl, r5
33f875b4:	ea000032 	b	33f87684 <do_printenv+0x190>
33f875b8:	e59d3000 	ldr	r3, [sp]
33f875bc:	e7937109 	ldr	r7, [r3, r9, lsl #2]
33f875c0:	e3a05000 	mov	r5, #0	; 0x0
33f875c4:	e3e06000 	mvn	r6, #0	; 0x0
33f875c8:	ea00001d 	b	33f87644 <do_printenv+0x150>
33f875cc:	e2844001 	add	r4, r4, #1	; 0x1
33f875d0:	e1a00004 	mov	r0, r4
33f875d4:	e59f30b4 	ldr	r3, [pc, #180]	; 33f87690 <.text+0x7690>
33f875d8:	e1a0e00f 	mov	lr, pc
33f875dc:	e593f000 	ldr	pc, [r3]
33f875e0:	e3500000 	cmp	r0, #0	; 0x0
33f875e4:	1afffff8 	bne	33f875cc <do_printenv+0xd8>
33f875e8:	e1a01005 	mov	r1, r5
33f875ec:	e1a00007 	mov	r0, r7
33f875f0:	ebfffe0f 	bl	33f86e34 <envmatch>
33f875f4:	e2506000 	subs	r6, r0, #0	; 0x0
33f875f8:	ba000010 	blt	33f87640 <do_printenv+0x14c>
33f875fc:	e1a00007 	mov	r0, r7
33f87600:	eb000183 	bl	33f87c14 <puts>
33f87604:	e3a0003d 	mov	r0, #61	; 0x3d
33f87608:	eb00021a 	bl	33f87e78 <putc>
33f8760c:	ea000004 	b	33f87624 <do_printenv+0x130>
33f87610:	e59f3078 	ldr	r3, [pc, #120]	; 33f87690 <.text+0x7690>
33f87614:	e1a0e00f 	mov	lr, pc
33f87618:	e593f000 	ldr	pc, [r3]
33f8761c:	eb000215 	bl	33f87e78 <putc>
33f87620:	e1a06005 	mov	r6, r5
33f87624:	e1560004 	cmp	r6, r4
33f87628:	e1a00006 	mov	r0, r6
33f8762c:	e2865001 	add	r5, r6, #1	; 0x1
33f87630:	bafffff6 	blt	33f87610 <do_printenv+0x11c>
33f87634:	e3a0000a 	mov	r0, #10	; 0xa
33f87638:	eb00020e 	bl	33f87e78 <putc>
33f8763c:	ea000007 	b	33f87660 <do_printenv+0x16c>
33f87640:	e2845001 	add	r5, r4, #1	; 0x1
33f87644:	e1a00005 	mov	r0, r5
33f87648:	e59f3040 	ldr	r3, [pc, #64]	; 33f87690 <.text+0x7690>
33f8764c:	e1a0e00f 	mov	lr, pc
33f87650:	e593f000 	ldr	pc, [r3]
33f87654:	e3500000 	cmp	r0, #0	; 0x0
33f87658:	11a04005 	movne	r4, r5
33f8765c:	1affffdb 	bne	33f875d0 <do_printenv+0xdc>
33f87660:	e3560000 	cmp	r6, #0	; 0x0
33f87664:	aa000003 	bge	33f87678 <do_printenv+0x184>
33f87668:	e1a01007 	mov	r1, r7
33f8766c:	e59f002c 	ldr	r0, [pc, #44]	; 33f876a0 <.text+0x76a0>
33f87670:	eb00017a 	bl	33f87c60 <printf>
33f87674:	e28aa001 	add	sl, sl, #1	; 0x1
33f87678:	e2899001 	add	r9, r9, #1	; 0x1
33f8767c:	e159000b 	cmp	r9, fp
33f87680:	baffffcc 	blt	33f875b8 <do_printenv+0xc4>
33f87684:	e1a0000a 	mov	r0, sl
33f87688:	e28dd004 	add	sp, sp, #4	; 0x4
33f8768c:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f87690:	33f95b00 	mvnccs	r5, #0	; 0x0
33f87694:	33f94614 	mvnccs	r4, #20971520	; 0x1400000
33f87698:	33f94620 	mvnccs	r4, #33554432	; 0x2000000
33f8769c:	00003ffc 	streqd	r3, [r0], -ip
33f876a0:	33f94640 	mvnccs	r4, #67108864	; 0x4000000

33f876a4 <find_cmd>:
33f876a4:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f876a8:	e3a0102e 	mov	r1, #46	; 0x2e
33f876ac:	e1a06000 	mov	r6, r0
33f876b0:	eb000c62 	bl	33f8a840 <strchr>
33f876b4:	e3500000 	cmp	r0, #0	; 0x0
33f876b8:	10665000 	rsbne	r5, r6, r0
33f876bc:	1a000002 	bne	33f876cc <find_cmd+0x28>
33f876c0:	e1a00006 	mov	r0, r6
33f876c4:	eb000c68 	bl	33f8a86c <strlen>
33f876c8:	e1a05000 	mov	r5, r0
33f876cc:	e59f405c 	ldr	r4, [pc, #92]	; 33f87730 <.text+0x7730>
33f876d0:	e3a07000 	mov	r7, #0	; 0x0
33f876d4:	e1a0a004 	mov	sl, r4
33f876d8:	ea00000a 	b	33f87708 <find_cmd+0x64>
33f876dc:	e5941000 	ldr	r1, [r4]
33f876e0:	eb000c45 	bl	33f8a7fc <strncmp>
33f876e4:	e3500000 	cmp	r0, #0	; 0x0
33f876e8:	1a000005 	bne	33f87704 <find_cmd+0x60>
33f876ec:	e5940000 	ldr	r0, [r4]
33f876f0:	eb000c5d 	bl	33f8a86c <strlen>
33f876f4:	e1550000 	cmp	r5, r0
33f876f8:	0a00000a 	beq	33f87728 <find_cmd+0x84>
33f876fc:	e2877001 	add	r7, r7, #1	; 0x1
33f87700:	e1a0a004 	mov	sl, r4
33f87704:	e2844018 	add	r4, r4, #24	; 0x18
33f87708:	e59f3024 	ldr	r3, [pc, #36]	; 33f87734 <.text+0x7734>
33f8770c:	e1540003 	cmp	r4, r3
33f87710:	e1a02005 	mov	r2, r5
33f87714:	e1a00006 	mov	r0, r6
33f87718:	1affffef 	bne	33f876dc <find_cmd+0x38>
33f8771c:	e3570001 	cmp	r7, #1	; 0x1
33f87720:	01a0400a 	moveq	r4, sl
33f87724:	13a04000 	movne	r4, #0	; 0x0
33f87728:	e1a00004 	mov	r0, r4
33f8772c:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f87730:	33f95ee0 	mvnccs	r5, #3584	; 0xe00
33f87734:	33f96228 	mvnccs	r6, #-2147483646	; 0x80000002

33f87738 <do_echo>:
33f87738:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f8773c:	e3a06001 	mov	r6, #1	; 0x1
33f87740:	e1a0a002 	mov	sl, r2
33f87744:	e1a07003 	mov	r7, r3
33f87748:	e1a05006 	mov	r5, r6
33f8774c:	ea000011 	b	33f87798 <do_echo+0x60>
33f87750:	e3550001 	cmp	r5, #1	; 0x1
33f87754:	e7974105 	ldr	r4, [r7, r5, lsl #2]
33f87758:	c3a00020 	movgt	r0, #32	; 0x20
33f8775c:	ca000008 	bgt	33f87784 <do_echo+0x4c>
33f87760:	ea000008 	b	33f87788 <do_echo+0x50>
33f87764:	e353005c 	cmp	r3, #92	; 0x5c
33f87768:	e2844001 	add	r4, r4, #1	; 0x1
33f8776c:	1a000004 	bne	33f87784 <do_echo+0x4c>
33f87770:	e5d43000 	ldrb	r3, [r4]
33f87774:	e3530063 	cmp	r3, #99	; 0x63
33f87778:	02844001 	addeq	r4, r4, #1	; 0x1
33f8777c:	03a06000 	moveq	r6, #0	; 0x0
33f87780:	0a000000 	beq	33f87788 <do_echo+0x50>
33f87784:	eb0001bb 	bl	33f87e78 <putc>
33f87788:	e5d43000 	ldrb	r3, [r4]
33f8778c:	e2530000 	subs	r0, r3, #0	; 0x0
33f87790:	1afffff3 	bne	33f87764 <do_echo+0x2c>
33f87794:	e2855001 	add	r5, r5, #1	; 0x1
33f87798:	e155000a 	cmp	r5, sl
33f8779c:	baffffeb 	blt	33f87750 <do_echo+0x18>
33f877a0:	e3560000 	cmp	r6, #0	; 0x0
33f877a4:	13a0000a 	movne	r0, #10	; 0xa
33f877a8:	1b0001b2 	blne	33f87e78 <putc>
33f877ac:	e3a00000 	mov	r0, #0	; 0x0
33f877b0:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}

33f877b4 <do_help>:
33f877b4:	e1a0c00d 	mov	ip, sp
33f877b8:	e92ddef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, ip, lr, pc}
33f877bc:	e3520001 	cmp	r2, #1	; 0x1
33f877c0:	e24cb004 	sub	fp, ip, #4	; 0x4
33f877c4:	e24dd004 	sub	sp, sp, #4	; 0x4
33f877c8:	e1a0a002 	mov	sl, r2
33f877cc:	11a05003 	movne	r5, r3
33f877d0:	13a07001 	movne	r7, #1	; 0x1
33f877d4:	13a06000 	movne	r6, #0	; 0x0
33f877d8:	1a000056 	bne	33f87938 <do_help+0x184>
33f877dc:	e59f1168 	ldr	r1, [pc, #360]	; 33f8794c <.text+0x794c>
33f877e0:	e59f3168 	ldr	r3, [pc, #360]	; 33f87950 <.text+0x7950>
33f877e4:	e59f2168 	ldr	r2, [pc, #360]	; 33f87954 <.text+0x7954>
33f877e8:	e0613003 	rsb	r3, r1, r3
33f877ec:	e1a031c3 	mov	r3, r3, asr #3
33f877f0:	e00a0293 	mul	sl, r3, r2
33f877f4:	e1a0310a 	mov	r3, sl, lsl #2
33f877f8:	e2833004 	add	r3, r3, #4	; 0x4
33f877fc:	e50bd028 	str	sp, [fp, #-40]
33f87800:	e063d00d 	rsb	sp, r3, sp
33f87804:	e1a0900d 	mov	r9, sp
33f87808:	e3a03000 	mov	r3, #0	; 0x0
33f8780c:	ea000002 	b	33f8781c <do_help+0x68>
33f87810:	e7891103 	str	r1, [r9, r3, lsl #2]
33f87814:	e2811018 	add	r1, r1, #24	; 0x18
33f87818:	e2833001 	add	r3, r3, #1	; 0x1
33f8781c:	e153000a 	cmp	r3, sl
33f87820:	bafffffa 	blt	33f87810 <do_help+0x5c>
33f87824:	e24a7001 	sub	r7, sl, #1	; 0x1
33f87828:	ea000011 	b	33f87874 <do_help+0xc0>
33f8782c:	e5943000 	ldr	r3, [r4]
33f87830:	e5942004 	ldr	r2, [r4, #4]
33f87834:	e5930000 	ldr	r0, [r3]
33f87838:	e5921000 	ldr	r1, [r2]
33f8783c:	eb000be3 	bl	33f8a7d0 <strcmp>
33f87840:	e3500000 	cmp	r0, #0	; 0x0
33f87844:	c5942000 	ldrgt	r2, [r4]
33f87848:	c5943004 	ldrgt	r3, [r4, #4]
33f8784c:	e2866001 	add	r6, r6, #1	; 0x1
33f87850:	c5843000 	strgt	r3, [r4]
33f87854:	c5842004 	strgt	r2, [r4, #4]
33f87858:	c2855001 	addgt	r5, r5, #1	; 0x1
33f8785c:	e1560007 	cmp	r6, r7
33f87860:	e2844004 	add	r4, r4, #4	; 0x4
33f87864:	1afffff0 	bne	33f8782c <do_help+0x78>
33f87868:	e3550000 	cmp	r5, #0	; 0x0
33f8786c:	0a000008 	beq	33f87894 <do_help+0xe0>
33f87870:	e2467001 	sub	r7, r6, #1	; 0x1
33f87874:	e3570000 	cmp	r7, #0	; 0x0
33f87878:	da000005 	ble	33f87894 <do_help+0xe0>
33f8787c:	e3a05000 	mov	r5, #0	; 0x0
33f87880:	e1a04009 	mov	r4, r9
33f87884:	e1a06005 	mov	r6, r5
33f87888:	eaffffe7 	b	33f8782c <do_help+0x78>
33f8788c:	e3a06001 	mov	r6, #1	; 0x1
33f87890:	ea00000d 	b	33f878cc <do_help+0x118>
33f87894:	e3a05000 	mov	r5, #0	; 0x0
33f87898:	ea000008 	b	33f878c0 <do_help+0x10c>
33f8789c:	e7993105 	ldr	r3, [r9, r5, lsl #2]
33f878a0:	e5934010 	ldr	r4, [r3, #16]
33f878a4:	eb000189 	bl	33f87ed0 <ctrlc>
33f878a8:	e3500000 	cmp	r0, #0	; 0x0
33f878ac:	e2855001 	add	r5, r5, #1	; 0x1
33f878b0:	e1a00004 	mov	r0, r4
33f878b4:	1afffff4 	bne	33f8788c <do_help+0xd8>
33f878b8:	e3540000 	cmp	r4, #0	; 0x0
33f878bc:	1b0000d4 	blne	33f87c14 <puts>
33f878c0:	e155000a 	cmp	r5, sl
33f878c4:	bafffff4 	blt	33f8789c <do_help+0xe8>
33f878c8:	e3a06000 	mov	r6, #0	; 0x0
33f878cc:	e51bd028 	ldr	sp, [fp, #-40]
33f878d0:	ea00001a 	b	33f87940 <do_help+0x18c>
33f878d4:	e5950004 	ldr	r0, [r5, #4]
33f878d8:	ebffff71 	bl	33f876a4 <find_cmd>
33f878dc:	e2504000 	subs	r4, r0, #0	; 0x0
33f878e0:	e59f0070 	ldr	r0, [pc, #112]	; 33f87958 <.text+0x7958>
33f878e4:	0a00000e 	beq	33f87924 <do_help+0x170>
33f878e8:	e5940000 	ldr	r0, [r4]
33f878ec:	eb0000c8 	bl	33f87c14 <puts>
33f878f0:	e3a00020 	mov	r0, #32	; 0x20
33f878f4:	eb00015f 	bl	33f87e78 <putc>
33f878f8:	e5943014 	ldr	r3, [r4, #20]
33f878fc:	e2530000 	subs	r0, r3, #0	; 0x0
33f87900:	0a000001 	beq	33f8790c <do_help+0x158>
33f87904:	eb0000c2 	bl	33f87c14 <puts>
33f87908:	ea000002 	b	33f87918 <do_help+0x164>
33f8790c:	e59f0048 	ldr	r0, [pc, #72]	; 33f8795c <.text+0x795c>
33f87910:	eb0000bf 	bl	33f87c14 <puts>
33f87914:	e3a06001 	mov	r6, #1	; 0x1
33f87918:	e3a0000a 	mov	r0, #10	; 0xa
33f8791c:	eb000155 	bl	33f87e78 <putc>
33f87920:	ea000002 	b	33f87930 <do_help+0x17c>
33f87924:	e5951004 	ldr	r1, [r5, #4]
33f87928:	eb0000cc 	bl	33f87c60 <printf>
33f8792c:	e3a06001 	mov	r6, #1	; 0x1
33f87930:	e2877001 	add	r7, r7, #1	; 0x1
33f87934:	e2855004 	add	r5, r5, #4	; 0x4
33f87938:	e157000a 	cmp	r7, sl
33f8793c:	baffffe4 	blt	33f878d4 <do_help+0x120>
33f87940:	e1a00006 	mov	r0, r6
33f87944:	e24bd024 	sub	sp, fp, #36	; 0x24
33f87948:	e89daef0 	ldmia	sp, {r4, r5, r6, r7, r9, sl, fp, sp, pc}
33f8794c:	33f95ee0 	mvnccs	r5, #3584	; 0xe00
33f87950:	33f96228 	mvnccs	r6, #-2147483646	; 0x80000002
33f87954:	aaaaaaab 	bge	32a32408 <_start-0x154dbf8>
33f87958:	33f94808 	mvnccs	r4, #524288	; 0x80000
33f8795c:	33f947f0 	mvnccs	r4, #62914560	; 0x3c00000

33f87960 <do_version>:
33f87960:	e52de004 	str	lr, [sp, #-4]!
33f87964:	e59f000c 	ldr	r0, [pc, #12]	; 33f87978 <.text+0x7978>
33f87968:	e59f100c 	ldr	r1, [pc, #12]	; 33f8797c <.text+0x797c>
33f8796c:	eb0000bb 	bl	33f87c60 <printf>
33f87970:	e3a00000 	mov	r0, #0	; 0x0
33f87974:	e49df004 	ldr	pc, [sp], #4
33f87978:	33f94860 	mvnccs	r4, #6291456	; 0x600000
33f8797c:	33f912d8 	mvnccs	r1, #-2147483635	; 0x8000000d

33f87980 <console_setfile>:
33f87980:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f87984:	e2515000 	subs	r5, r1, #0	; 0x0
33f87988:	e1a04000 	mov	r4, r0
33f8798c:	0a000020 	beq	33f87a14 <console_setfile+0x94>
33f87990:	e3500002 	cmp	r0, #2	; 0x2
33f87994:	8a00001e 	bhi	33f87a14 <console_setfile+0x94>
33f87998:	e5950018 	ldr	r0, [r5, #24]
33f8799c:	e3500000 	cmp	r0, #0	; 0x0
33f879a0:	0a000003 	beq	33f879b4 <console_setfile+0x34>
33f879a4:	e1a0e00f 	mov	lr, pc
33f879a8:	e1a0f000 	mov	pc, r0
33f879ac:	e3500000 	cmp	r0, #0	; 0x0
33f879b0:	b8bd8030 	ldmltia	sp!, {r4, r5, pc}
33f879b4:	e59f3060 	ldr	r3, [pc, #96]	; 33f87a1c <.text+0x7a1c>
33f879b8:	e3540000 	cmp	r4, #0	; 0x0
33f879bc:	e7835104 	str	r5, [r3, r4, lsl #2]
33f879c0:	0a000002 	beq	33f879d0 <console_setfile+0x50>
33f879c4:	e3540001 	cmp	r4, #1	; 0x1
33f879c8:	18bd8030 	ldmneia	sp!, {r4, r5, pc}
33f879cc:	ea000006 	b	33f879ec <console_setfile+0x6c>
33f879d0:	e5982020 	ldr	r2, [r8, #32]
33f879d4:	e595302c 	ldr	r3, [r5, #44]
33f879d8:	e5823004 	str	r3, [r2, #4]
33f879dc:	e5982020 	ldr	r2, [r8, #32]
33f879e0:	e5953028 	ldr	r3, [r5, #40]
33f879e4:	e5823008 	str	r3, [r2, #8]
33f879e8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f879ec:	e5981020 	ldr	r1, [r8, #32]
33f879f0:	e5953020 	ldr	r3, [r5, #32]
33f879f4:	e581300c 	str	r3, [r1, #12]
33f879f8:	e5983020 	ldr	r3, [r8, #32]
33f879fc:	e5951024 	ldr	r1, [r5, #36]
33f87a00:	e5831010 	str	r1, [r3, #16]
33f87a04:	e59f3014 	ldr	r3, [pc, #20]	; 33f87a20 <.text+0x7a20>
33f87a08:	e5982020 	ldr	r2, [r8, #32]
33f87a0c:	e5823014 	str	r3, [r2, #20]
33f87a10:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f87a14:	e3e00000 	mvn	r0, #0	; 0x0
33f87a18:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f87a1c:	33f965a4 	mvnccs	r6, #687865856	; 0x29000000
33f87a20:	33f87c60 	mvnccs	r7, #24576	; 0x6000

33f87a24 <fgetc>:
33f87a24:	e3500002 	cmp	r0, #2	; 0x2
33f87a28:	e52de004 	str	lr, [sp, #-4]!
33f87a2c:	e3e03000 	mvn	r3, #0	; 0x0
33f87a30:	ca000004 	bgt	33f87a48 <fgetc+0x24>
33f87a34:	e59f3014 	ldr	r3, [pc, #20]	; 33f87a50 <.text+0x7a50>
33f87a38:	e7933100 	ldr	r3, [r3, r0, lsl #2]
33f87a3c:	e1a0e00f 	mov	lr, pc
33f87a40:	e593f02c 	ldr	pc, [r3, #44]
33f87a44:	e1a03000 	mov	r3, r0
33f87a48:	e1a00003 	mov	r0, r3
33f87a4c:	e49df004 	ldr	pc, [sp], #4
33f87a50:	33f965a4 	mvnccs	r6, #687865856	; 0x29000000

33f87a54 <ftstc>:
33f87a54:	e3500002 	cmp	r0, #2	; 0x2
33f87a58:	e52de004 	str	lr, [sp, #-4]!
33f87a5c:	e3e03000 	mvn	r3, #0	; 0x0
33f87a60:	ca000004 	bgt	33f87a78 <ftstc+0x24>
33f87a64:	e59f3014 	ldr	r3, [pc, #20]	; 33f87a80 <.text+0x7a80>
33f87a68:	e7933100 	ldr	r3, [r3, r0, lsl #2]
33f87a6c:	e1a0e00f 	mov	lr, pc
33f87a70:	e593f028 	ldr	pc, [r3, #40]
33f87a74:	e1a03000 	mov	r3, r0
33f87a78:	e1a00003 	mov	r0, r3
33f87a7c:	e49df004 	ldr	pc, [sp], #4
33f87a80:	33f965a4 	mvnccs	r6, #687865856	; 0x29000000

33f87a84 <fputc>:
33f87a84:	e3500002 	cmp	r0, #2	; 0x2
33f87a88:	e20110ff 	and	r1, r1, #255	; 0xff
33f87a8c:	e1a02000 	mov	r2, r0
33f87a90:	e52de004 	str	lr, [sp, #-4]!
33f87a94:	e1a00001 	mov	r0, r1
33f87a98:	c49df004 	ldrgt	pc, [sp], #4
33f87a9c:	e59f300c 	ldr	r3, [pc, #12]	; 33f87ab0 <.text+0x7ab0>
33f87aa0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
33f87aa4:	e1a0e00f 	mov	lr, pc
33f87aa8:	e593f020 	ldr	pc, [r3, #32]
33f87aac:	e49df004 	ldr	pc, [sp], #4
33f87ab0:	33f965a4 	mvnccs	r6, #687865856	; 0x29000000

33f87ab4 <fputs>:
33f87ab4:	e3500002 	cmp	r0, #2	; 0x2
33f87ab8:	e1a02000 	mov	r2, r0
33f87abc:	e52de004 	str	lr, [sp, #-4]!
33f87ac0:	e1a00001 	mov	r0, r1
33f87ac4:	c49df004 	ldrgt	pc, [sp], #4
33f87ac8:	e59f300c 	ldr	r3, [pc, #12]	; 33f87adc <.text+0x7adc>
33f87acc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
33f87ad0:	e1a0e00f 	mov	lr, pc
33f87ad4:	e593f024 	ldr	pc, [r3, #36]
33f87ad8:	e49df004 	ldr	pc, [sp], #4
33f87adc:	33f965a4 	mvnccs	r6, #687865856	; 0x29000000

33f87ae0 <disable_ctrlc>:
33f87ae0:	e59f300c 	ldr	r3, [pc, #12]	; 33f87af4 <.text+0x7af4>
33f87ae4:	e5932000 	ldr	r2, [r3]
33f87ae8:	e5830000 	str	r0, [r3]
33f87aec:	e1a00002 	mov	r0, r2
33f87af0:	e1a0f00e 	mov	pc, lr
33f87af4:	33f9659c 	mvnccs	r6, #654311424	; 0x27000000

33f87af8 <had_ctrlc>:
33f87af8:	e59f3004 	ldr	r3, [pc, #4]	; 33f87b04 <.text+0x7b04>
33f87afc:	e5930000 	ldr	r0, [r3]
33f87b00:	e1a0f00e 	mov	pc, lr
33f87b04:	33f96598 	mvnccs	r6, #637534208	; 0x26000000

33f87b08 <clear_ctrlc>:
33f87b08:	e59f3008 	ldr	r3, [pc, #8]	; 33f87b18 <.text+0x7b18>
33f87b0c:	e3a02000 	mov	r2, #0	; 0x0
33f87b10:	e5832000 	str	r2, [r3]
33f87b14:	e1a0f00e 	mov	pc, lr
33f87b18:	33f96598 	mvnccs	r6, #637534208	; 0x26000000

33f87b1c <dbg>:
33f87b1c:	e92d000f 	stmdb	sp!, {r0, r1, r2, r3}
33f87b20:	e28dd010 	add	sp, sp, #16	; 0x10
33f87b24:	e1a0f00e 	mov	pc, lr

33f87b28 <console_init_f>:
33f87b28:	e3a03001 	mov	r3, #1	; 0x1
33f87b2c:	e3a00000 	mov	r0, #0	; 0x0
33f87b30:	e588300c 	str	r3, [r8, #12]
33f87b34:	e1a0f00e 	mov	pc, lr

33f87b38 <console_assign>:
33f87b38:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f87b3c:	e2506000 	subs	r6, r0, #0	; 0x0
33f87b40:	e1a07001 	mov	r7, r1
33f87b44:	03a0a001 	moveq	sl, #1	; 0x1
33f87b48:	0a000003 	beq	33f87b5c <console_assign+0x24>
33f87b4c:	ba00001a 	blt	33f87bbc <console_assign+0x84>
33f87b50:	e3560002 	cmp	r6, #2	; 0x2
33f87b54:	ca000018 	bgt	33f87bbc <console_assign+0x84>
33f87b58:	e3a0a002 	mov	sl, #2	; 0x2
33f87b5c:	e3a05001 	mov	r5, #1	; 0x1
33f87b60:	ea00000e 	b	33f87ba0 <console_assign+0x68>
33f87b64:	e5940000 	ldr	r0, [r4]
33f87b68:	eb000642 	bl	33f89478 <ListGetPtrToItem>
33f87b6c:	e1a04000 	mov	r4, r0
33f87b70:	e2841008 	add	r1, r4, #8	; 0x8
33f87b74:	e1a00007 	mov	r0, r7
33f87b78:	eb000b14 	bl	33f8a7d0 <strcmp>
33f87b7c:	e3500000 	cmp	r0, #0	; 0x0
33f87b80:	1a000006 	bne	33f87ba0 <console_assign+0x68>
33f87b84:	e5943000 	ldr	r3, [r4]
33f87b88:	e11a0003 	tst	sl, r3
33f87b8c:	0a00000a 	beq	33f87bbc <console_assign+0x84>
33f87b90:	e1a00006 	mov	r0, r6
33f87b94:	e1a01004 	mov	r1, r4
33f87b98:	e8bd44f0 	ldmia	sp!, {r4, r5, r6, r7, sl, lr}
33f87b9c:	eaffff77 	b	33f87980 <console_setfile>
33f87ba0:	e59f401c 	ldr	r4, [pc, #28]	; 33f87bc4 <.text+0x7bc4>
33f87ba4:	e5940000 	ldr	r0, [r4]
33f87ba8:	eb000644 	bl	33f894c0 <ListNumItems>
33f87bac:	e1550000 	cmp	r5, r0
33f87bb0:	e1a01005 	mov	r1, r5
33f87bb4:	e2855001 	add	r5, r5, #1	; 0x1
33f87bb8:	daffffe9 	ble	33f87b64 <console_assign+0x2c>
33f87bbc:	e3e00000 	mvn	r0, #0	; 0x0
33f87bc0:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f87bc4:	33f965a0 	mvnccs	r6, #671088640	; 0x28000000

33f87bc8 <fprintf>:
33f87bc8:	e92d000e 	stmdb	sp!, {r1, r2, r3}
33f87bcc:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f87bd0:	e24dde12 	sub	sp, sp, #288	; 0x120
33f87bd4:	e28d4004 	add	r4, sp, #4	; 0x4
33f87bd8:	e28d3e13 	add	r3, sp, #304	; 0x130
33f87bdc:	e2444002 	sub	r4, r4, #2	; 0x2
33f87be0:	e1a05000 	mov	r5, r0
33f87be4:	e59d112c 	ldr	r1, [sp, #300]
33f87be8:	e1a02003 	mov	r2, r3
33f87bec:	e1a00004 	mov	r0, r4
33f87bf0:	e58d311c 	str	r3, [sp, #284]
33f87bf4:	eb000d05 	bl	33f8b010 <vsprintf>
33f87bf8:	e1a00005 	mov	r0, r5
33f87bfc:	e1a01004 	mov	r1, r4
33f87c00:	ebffffab 	bl	33f87ab4 <fputs>
33f87c04:	e28dde12 	add	sp, sp, #288	; 0x120
33f87c08:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
33f87c0c:	e28dd00c 	add	sp, sp, #12	; 0xc
33f87c10:	e1a0f00e 	mov	pc, lr

33f87c14 <puts>:
33f87c14:	e5983004 	ldr	r3, [r8, #4]
33f87c18:	e3130002 	tst	r3, #2	; 0x2
33f87c1c:	e1a01000 	mov	r1, r0
33f87c20:	0a000001 	beq	33f87c2c <puts+0x18>
33f87c24:	e3a00001 	mov	r0, #1	; 0x1
33f87c28:	eaffffa1 	b	33f87ab4 <fputs>
33f87c2c:	ea0019f8 	b	33f8e414 <serial_puts>

33f87c30 <vprintf>:
33f87c30:	e92d4010 	stmdb	sp!, {r4, lr}
33f87c34:	e24ddf47 	sub	sp, sp, #284	; 0x11c
33f87c38:	e28d4004 	add	r4, sp, #4	; 0x4
33f87c3c:	e2444002 	sub	r4, r4, #2	; 0x2
33f87c40:	e1a02001 	mov	r2, r1
33f87c44:	e1a01000 	mov	r1, r0
33f87c48:	e1a00004 	mov	r0, r4
33f87c4c:	eb000cef 	bl	33f8b010 <vsprintf>
33f87c50:	e1a00004 	mov	r0, r4
33f87c54:	ebffffee 	bl	33f87c14 <puts>
33f87c58:	e28ddf47 	add	sp, sp, #284	; 0x11c
33f87c5c:	e8bd8010 	ldmia	sp!, {r4, pc}

33f87c60 <printf>:
33f87c60:	e92d000f 	stmdb	sp!, {r0, r1, r2, r3}
33f87c64:	e92d4010 	stmdb	sp!, {r4, lr}
33f87c68:	e24dde12 	sub	sp, sp, #288	; 0x120
33f87c6c:	e28d4004 	add	r4, sp, #4	; 0x4
33f87c70:	e28d3f4b 	add	r3, sp, #300	; 0x12c
33f87c74:	e2444002 	sub	r4, r4, #2	; 0x2
33f87c78:	e1a02003 	mov	r2, r3
33f87c7c:	e1a00004 	mov	r0, r4
33f87c80:	e59d1128 	ldr	r1, [sp, #296]
33f87c84:	e58d311c 	str	r3, [sp, #284]
33f87c88:	eb000ce0 	bl	33f8b010 <vsprintf>
33f87c8c:	e1a00004 	mov	r0, r4
33f87c90:	ebffffdf 	bl	33f87c14 <puts>
33f87c94:	e28dde12 	add	sp, sp, #288	; 0x120
33f87c98:	e8bd4010 	ldmia	sp!, {r4, lr}
33f87c9c:	e28dd010 	add	sp, sp, #16	; 0x10
33f87ca0:	e1a0f00e 	mov	pc, lr

33f87ca4 <console_init_r>:
33f87ca4:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f87ca8:	e59f3158 	ldr	r3, [pc, #344]	; 33f87e08 <.text+0x7e08>
33f87cac:	e5930000 	ldr	r0, [r3]
33f87cb0:	eb000602 	bl	33f894c0 <ListNumItems>
33f87cb4:	e3a0a000 	mov	sl, #0	; 0x0
33f87cb8:	e1a09000 	mov	r9, r0
33f87cbc:	e1a0600a 	mov	r6, sl
33f87cc0:	e3a07001 	mov	r7, #1	; 0x1
33f87cc4:	ea000007 	b	33f87ce8 <console_init_r+0x44>
33f87cc8:	e59f3138 	ldr	r3, [pc, #312]	; 33f87e08 <.text+0x7e08>
33f87ccc:	e5930000 	ldr	r0, [r3]
33f87cd0:	eb0005e8 	bl	33f89478 <ListGetPtrToItem>
33f87cd4:	e5903000 	ldr	r3, [r0]
33f87cd8:	e1130004 	tst	r3, r4
33f87cdc:	11a0a000 	movne	sl, r0
33f87ce0:	e01530a3 	ands	r3, r5, r3, lsr #1
33f87ce4:	11a06000 	movne	r6, r0
33f87ce8:	e1570009 	cmp	r7, r9
33f87cec:	e1a01007 	mov	r1, r7
33f87cf0:	e2877001 	add	r7, r7, #1	; 0x1
33f87cf4:	ca000005 	bgt	33f87d10 <console_init_r+0x6c>
33f87cf8:	e27a4001 	rsbs	r4, sl, #1	; 0x1
33f87cfc:	33a04000 	movcc	r4, #0	; 0x0
33f87d00:	e2765001 	rsbs	r5, r6, #1	; 0x1
33f87d04:	33a05000 	movcc	r5, #0	; 0x0
33f87d08:	e1943005 	orrs	r3, r4, r5
33f87d0c:	1affffed 	bne	33f87cc8 <console_init_r+0x24>
33f87d10:	e3560000 	cmp	r6, #0	; 0x0
33f87d14:	0a000005 	beq	33f87d30 <console_init_r+0x8c>
33f87d18:	e1a01006 	mov	r1, r6
33f87d1c:	e3a00001 	mov	r0, #1	; 0x1
33f87d20:	ebffff16 	bl	33f87980 <console_setfile>
33f87d24:	e1a01006 	mov	r1, r6
33f87d28:	e3a00002 	mov	r0, #2	; 0x2
33f87d2c:	ebffff13 	bl	33f87980 <console_setfile>
33f87d30:	e35a0000 	cmp	sl, #0	; 0x0
33f87d34:	11a0100a 	movne	r1, sl
33f87d38:	13a00000 	movne	r0, #0	; 0x0
33f87d3c:	1bffff0f 	blne	33f87980 <console_setfile>
33f87d40:	e5982004 	ldr	r2, [r8, #4]
33f87d44:	e3822002 	orr	r2, r2, #2	; 0x2
33f87d48:	e5882004 	str	r2, [r8, #4]
33f87d4c:	e59f00b8 	ldr	r0, [pc, #184]	; 33f87e0c <.text+0x7e0c>
33f87d50:	ebffffaf 	bl	33f87c14 <puts>
33f87d54:	e59f30b4 	ldr	r3, [pc, #180]	; 33f87e10 <.text+0x7e10>
33f87d58:	e5931000 	ldr	r1, [r3]
33f87d5c:	e3510000 	cmp	r1, #0	; 0x0
33f87d60:	1a000002 	bne	33f87d70 <console_init_r+0xcc>
33f87d64:	e59f00a8 	ldr	r0, [pc, #168]	; 33f87e14 <.text+0x7e14>
33f87d68:	ebffffa9 	bl	33f87c14 <puts>
33f87d6c:	ea000002 	b	33f87d7c <console_init_r+0xd8>
33f87d70:	e2811008 	add	r1, r1, #8	; 0x8
33f87d74:	e59f009c 	ldr	r0, [pc, #156]	; 33f87e18 <.text+0x7e18>
33f87d78:	ebffffb8 	bl	33f87c60 <printf>
33f87d7c:	e59f0098 	ldr	r0, [pc, #152]	; 33f87e1c <.text+0x7e1c>
33f87d80:	ebffffa3 	bl	33f87c14 <puts>
33f87d84:	e59f3084 	ldr	r3, [pc, #132]	; 33f87e10 <.text+0x7e10>
33f87d88:	e5931004 	ldr	r1, [r3, #4]
33f87d8c:	e3510000 	cmp	r1, #0	; 0x0
33f87d90:	1a000002 	bne	33f87da0 <console_init_r+0xfc>
33f87d94:	e59f0084 	ldr	r0, [pc, #132]	; 33f87e20 <.text+0x7e20>
33f87d98:	ebffff9d 	bl	33f87c14 <puts>
33f87d9c:	ea000002 	b	33f87dac <console_init_r+0x108>
33f87da0:	e2811008 	add	r1, r1, #8	; 0x8
33f87da4:	e59f006c 	ldr	r0, [pc, #108]	; 33f87e18 <.text+0x7e18>
33f87da8:	ebffffac 	bl	33f87c60 <printf>
33f87dac:	e59f0070 	ldr	r0, [pc, #112]	; 33f87e24 <.text+0x7e24>
33f87db0:	ebffff97 	bl	33f87c14 <puts>
33f87db4:	e59f3054 	ldr	r3, [pc, #84]	; 33f87e10 <.text+0x7e10>
33f87db8:	e5931008 	ldr	r1, [r3, #8]
33f87dbc:	e3510000 	cmp	r1, #0	; 0x0
33f87dc0:	1a000002 	bne	33f87dd0 <console_init_r+0x12c>
33f87dc4:	e59f005c 	ldr	r0, [pc, #92]	; 33f87e28 <.text+0x7e28>
33f87dc8:	ebffff91 	bl	33f87c14 <puts>
33f87dcc:	ea000002 	b	33f87ddc <console_init_r+0x138>
33f87dd0:	e2811008 	add	r1, r1, #8	; 0x8
33f87dd4:	e59f003c 	ldr	r0, [pc, #60]	; 33f87e18 <.text+0x7e18>
33f87dd8:	ebffffa0 	bl	33f87c60 <printf>
33f87ddc:	e59f4048 	ldr	r4, [pc, #72]	; 33f87e2c <.text+0x7e2c>
33f87de0:	e59f5028 	ldr	r5, [pc, #40]	; 33f87e10 <.text+0x7e10>
33f87de4:	e4951004 	ldr	r1, [r5], #4
33f87de8:	e4940004 	ldr	r0, [r4], #4
33f87dec:	e2811008 	add	r1, r1, #8	; 0x8
33f87df0:	ebfffdb1 	bl	33f874bc <setenv>
33f87df4:	e59f3034 	ldr	r3, [pc, #52]	; 33f87e30 <.text+0x7e30>
33f87df8:	e1540003 	cmp	r4, r3
33f87dfc:	1afffff8 	bne	33f87de4 <console_init_r+0x140>
33f87e00:	e3a00000 	mov	r0, #0	; 0x0
33f87e04:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f87e08:	33f965a0 	mvnccs	r6, #671088640	; 0x28000000
33f87e0c:	33f94a70 	mvnccs	r4, #458752	; 0x70000
33f87e10:	33f965a4 	mvnccs	r6, #687865856	; 0x29000000
33f87e14:	33f94a78 	mvnccs	r4, #491520	; 0x78000
33f87e18:	33f953b4 	mvnccs	r5, #-805306366	; 0xd0000002
33f87e1c:	33f94a98 	mvnccs	r4, #622592	; 0x98000
33f87e20:	33f94aa0 	mvnccs	r4, #655360	; 0xa0000
33f87e24:	33f94ac0 	mvnccs	r4, #786432	; 0xc0000
33f87e28:	33f94ac8 	mvnccs	r4, #819200	; 0xc8000
33f87e2c:	33f956e0 	mvnccs	r5, #234881024	; 0xe000000
33f87e30:	33f956ec 	mvnccs	r5, #247463936	; 0xec00000

33f87e34 <serial_printf>:
33f87e34:	e92d000f 	stmdb	sp!, {r0, r1, r2, r3}
33f87e38:	e92d4010 	stmdb	sp!, {r4, lr}
33f87e3c:	e24dde12 	sub	sp, sp, #288	; 0x120
33f87e40:	e28d4004 	add	r4, sp, #4	; 0x4
33f87e44:	e28d3f4b 	add	r3, sp, #300	; 0x12c
33f87e48:	e2444002 	sub	r4, r4, #2	; 0x2
33f87e4c:	e1a02003 	mov	r2, r3
33f87e50:	e1a00004 	mov	r0, r4
33f87e54:	e59d1128 	ldr	r1, [sp, #296]
33f87e58:	e58d311c 	str	r3, [sp, #284]
33f87e5c:	eb000c6b 	bl	33f8b010 <vsprintf>
33f87e60:	e1a00004 	mov	r0, r4
33f87e64:	eb00196a 	bl	33f8e414 <serial_puts>
33f87e68:	e28dde12 	add	sp, sp, #288	; 0x120
33f87e6c:	e8bd4010 	ldmia	sp!, {r4, lr}
33f87e70:	e28dd010 	add	sp, sp, #16	; 0x10
33f87e74:	e1a0f00e 	mov	pc, lr

33f87e78 <putc>:
33f87e78:	e5983004 	ldr	r3, [r8, #4]
33f87e7c:	e3130002 	tst	r3, #2	; 0x2
33f87e80:	e1a03000 	mov	r3, r0
33f87e84:	e20330ff 	and	r3, r3, #255	; 0xff
33f87e88:	e3a00001 	mov	r0, #1	; 0x1
33f87e8c:	e1a01003 	mov	r1, r3
33f87e90:	0a000000 	beq	33f87e98 <putc+0x20>
33f87e94:	eafffefa 	b	33f87a84 <fputc>
33f87e98:	e1a00003 	mov	r0, r3
33f87e9c:	ea00194e 	b	33f8e3dc <serial_putc>

33f87ea0 <tstc>:
33f87ea0:	e5983004 	ldr	r3, [r8, #4]
33f87ea4:	e3130002 	tst	r3, #2	; 0x2
33f87ea8:	e3a00000 	mov	r0, #0	; 0x0
33f87eac:	0a000000 	beq	33f87eb4 <tstc+0x14>
33f87eb0:	eafffee7 	b	33f87a54 <ftstc>
33f87eb4:	ea001952 	b	33f8e404 <serial_tstc>

33f87eb8 <getc>:
33f87eb8:	e5983004 	ldr	r3, [r8, #4]
33f87ebc:	e3130002 	tst	r3, #2	; 0x2
33f87ec0:	e3a00000 	mov	r0, #0	; 0x0
33f87ec4:	0a000000 	beq	33f87ecc <getc+0x14>
33f87ec8:	eafffed5 	b	33f87a24 <fgetc>
33f87ecc:	ea001970 	b	33f8e494 <serial_getc>

33f87ed0 <ctrlc>:
33f87ed0:	e52de004 	str	lr, [sp, #-4]!
33f87ed4:	e59f3044 	ldr	r3, [pc, #68]	; 33f87f20 <.text+0x7f20>
33f87ed8:	e5933000 	ldr	r3, [r3]
33f87edc:	e3530000 	cmp	r3, #0	; 0x0
33f87ee0:	1a00000c 	bne	33f87f18 <ctrlc+0x48>
33f87ee4:	e598300c 	ldr	r3, [r8, #12]
33f87ee8:	e3530000 	cmp	r3, #0	; 0x0
33f87eec:	0a000009 	beq	33f87f18 <ctrlc+0x48>
33f87ef0:	ebffffea 	bl	33f87ea0 <tstc>
33f87ef4:	e3500000 	cmp	r0, #0	; 0x0
33f87ef8:	0a000006 	beq	33f87f18 <ctrlc+0x48>
33f87efc:	ebffffed 	bl	33f87eb8 <getc>
33f87f00:	e3500003 	cmp	r0, #3	; 0x3
33f87f04:	059f3018 	ldreq	r3, [pc, #24]	; 33f87f24 <.text+0x7f24>
33f87f08:	e3a02001 	mov	r2, #1	; 0x1
33f87f0c:	e1a00002 	mov	r0, r2
33f87f10:	05832000 	streq	r2, [r3]
33f87f14:	049df004 	ldreq	pc, [sp], #4
33f87f18:	e3a00000 	mov	r0, #0	; 0x0
33f87f1c:	e49df004 	ldr	pc, [sp], #4
33f87f20:	33f9659c 	mvnccs	r6, #654311424	; 0x27000000
33f87f24:	33f96598 	mvnccs	r6, #637534208	; 0x26000000

33f87f28 <devices_done>:
33f87f28:	e52de004 	str	lr, [sp, #-4]!
33f87f2c:	e59f300c 	ldr	r3, [pc, #12]	; 33f87f40 <.text+0x7f40>
33f87f30:	e5930000 	ldr	r0, [r3]
33f87f34:	eb000613 	bl	33f89788 <ListDispose>
33f87f38:	e3a00000 	mov	r0, #0	; 0x0
33f87f3c:	e49df004 	ldr	pc, [sp], #4
33f87f40:	33f965a0 	mvnccs	r6, #671088640	; 0x28000000

33f87f44 <device_register>:
33f87f44:	e52de004 	str	lr, [sp, #-4]!
33f87f48:	e59f3014 	ldr	r3, [pc, #20]	; 33f87f64 <.text+0x7f64>
33f87f4c:	e1a01000 	mov	r1, r0
33f87f50:	e3a02000 	mov	r2, #0	; 0x0
33f87f54:	e5930000 	ldr	r0, [r3]
33f87f58:	eb000600 	bl	33f89760 <ListInsertItem>
33f87f5c:	e3a00000 	mov	r0, #0	; 0x0
33f87f60:	e49df004 	ldr	pc, [sp], #4
33f87f64:	33f965a0 	mvnccs	r6, #671088640	; 0x28000000

33f87f68 <devices_init>:
33f87f68:	e92d4010 	stmdb	sp!, {r4, lr}
33f87f6c:	e3a00034 	mov	r0, #52	; 0x34
33f87f70:	e24dd034 	sub	sp, sp, #52	; 0x34
33f87f74:	eb00061c 	bl	33f897ec <ListCreate>
33f87f78:	e59f307c 	ldr	r3, [pc, #124]	; 33f87ffc <.text+0x7ffc>
33f87f7c:	e1a0c000 	mov	ip, r0
33f87f80:	e35c0000 	cmp	ip, #0	; 0x0
33f87f84:	e1a0400d 	mov	r4, sp
33f87f88:	e59f1070 	ldr	r1, [pc, #112]	; 33f88000 <.text+0x8000>
33f87f8c:	e3a00002 	mov	r0, #2	; 0x2
33f87f90:	e3a02034 	mov	r2, #52	; 0x34
33f87f94:	e583c000 	str	ip, [r3]
33f87f98:	1a000002 	bne	33f87fa8 <devices_init+0x40>
33f87f9c:	ebfffec4 	bl	33f87ab4 <fputs>
33f87fa0:	e3e00000 	mvn	r0, #0	; 0x0
33f87fa4:	ea000012 	b	33f87ff4 <devices_init+0x8c>
33f87fa8:	e3a01000 	mov	r1, #0	; 0x0
33f87fac:	e1a0000d 	mov	r0, sp
33f87fb0:	eb000aae 	bl	33f8aa70 <memset>
33f87fb4:	e59f1048 	ldr	r1, [pc, #72]	; 33f88004 <.text+0x8004>
33f87fb8:	e28d0008 	add	r0, sp, #8	; 0x8
33f87fbc:	eb0009d5 	bl	33f8a718 <strcpy>
33f87fc0:	e3a0310e 	mov	r3, #-2147483645	; 0x80000003
33f87fc4:	e58d3000 	str	r3, [sp]
33f87fc8:	e59f3038 	ldr	r3, [pc, #56]	; 33f88008 <.text+0x8008>
33f87fcc:	e58d3020 	str	r3, [sp, #32]
33f87fd0:	e59f3034 	ldr	r3, [pc, #52]	; 33f8800c <.text+0x800c>
33f87fd4:	e58d3024 	str	r3, [sp, #36]
33f87fd8:	e59f3030 	ldr	r3, [pc, #48]	; 33f88010 <.text+0x8010>
33f87fdc:	e58d302c 	str	r3, [sp, #44]
33f87fe0:	e59f302c 	ldr	r3, [pc, #44]	; 33f88014 <.text+0x8014>
33f87fe4:	e1a0000d 	mov	r0, sp
33f87fe8:	e58d3028 	str	r3, [sp, #40]
33f87fec:	ebffffd4 	bl	33f87f44 <device_register>
33f87ff0:	e3a00000 	mov	r0, #0	; 0x0
33f87ff4:	e28dd034 	add	sp, sp, #52	; 0x34
33f87ff8:	e8bd8010 	ldmia	sp!, {r4, pc}
33f87ffc:	33f965a0 	mvnccs	r6, #671088640	; 0x28000000
33f88000:	33f94ae8 	mvnccs	r4, #950272	; 0xe8000
33f88004:	33f94b10 	mvnccs	r4, #16384	; 0x4000
33f88008:	33f8e3dc 	mvnccs	lr, #1879048195	; 0x70000003
33f8800c:	33f8e414 	mvnccs	lr, #335544320	; 0x14000000
33f88010:	33f8e494 	mvnccs	lr, #-1811939328	; 0x94000000
33f88014:	33f8e404 	mvnccs	lr, #67108864	; 0x4000000

33f88018 <malloc_bin_reloc>:
33f88018:	e59f1024 	ldr	r1, [pc, #36]	; 33f88044 <.text+0x8044>
33f8801c:	e1a00008 	mov	r0, r8
33f88020:	e5113004 	ldr	r3, [r1, #-4]
33f88024:	e5902010 	ldr	r2, [r0, #16]
33f88028:	e0833002 	add	r3, r3, r2
33f8802c:	e5013004 	str	r3, [r1, #-4]
33f88030:	e59f3010 	ldr	r3, [pc, #16]	; 33f88048 <.text+0x8048>
33f88034:	e2811004 	add	r1, r1, #4	; 0x4
33f88038:	e1510003 	cmp	r1, r3
33f8803c:	1afffff7 	bne	33f88020 <malloc_bin_reloc+0x8>
33f88040:	e1a0f00e 	mov	pc, lr
33f88044:	33f95700 	mvnccs	r5, #0	; 0x0
33f88048:	33f95b00 	mvnccs	r5, #0	; 0x0

33f8804c <malloc_usable_size>:
33f8804c:	e250c000 	subs	ip, r0, #0	; 0x0
33f88050:	0a00000c 	beq	33f88088 <malloc_usable_size+0x3c>
33f88054:	e51c1004 	ldr	r1, [ip, #-4]
33f88058:	e3c13003 	bic	r3, r1, #3	; 0x3
33f8805c:	e3c12001 	bic	r2, r1, #1	; 0x1
33f88060:	e2430008 	sub	r0, r3, #8	; 0x8
33f88064:	e3110002 	tst	r1, #2	; 0x2
33f88068:	e24c3008 	sub	r3, ip, #8	; 0x8
33f8806c:	e0833002 	add	r3, r3, r2
33f88070:	11a0f00e 	movne	pc, lr
33f88074:	e5933004 	ldr	r3, [r3, #4]
33f88078:	e3c12003 	bic	r2, r1, #3	; 0x3
33f8807c:	e3130001 	tst	r3, #1	; 0x1
33f88080:	e2420004 	sub	r0, r2, #4	; 0x4
33f88084:	11a0f00e 	movne	pc, lr
33f88088:	e3a00000 	mov	r0, #0	; 0x0
33f8808c:	e1a0f00e 	mov	pc, lr

33f88090 <mallopt>:
33f88090:	e2800004 	add	r0, r0, #4	; 0x4
33f88094:	e3500003 	cmp	r0, #3	; 0x3
33f88098:	979ff100 	ldrls	pc, [pc, r0, lsl #2]
33f8809c:	ea000012 	b	33f880ec <.text+0x80ec>
33f880a0:	33f880d4 	mvnccs	r8, #212	; 0xd4
33f880a4:	33f880c8 	mvnccs	r8, #200	; 0xc8
33f880a8:	33f880bc 	mvnccs	r8, #188	; 0xbc
33f880ac:	33f880b0 	mvnccs	r8, #176	; 0xb0
33f880b0:	e59f303c 	ldr	r3, [pc, #60]	; 33f880f4 <.text+0x80f4>
33f880b4:	e3a00001 	mov	r0, #1	; 0x1
33f880b8:	ea000009 	b	33f880e4 <.text+0x80e4>
33f880bc:	e59f3034 	ldr	r3, [pc, #52]	; 33f880f8 <.text+0x80f8>
33f880c0:	e3a00001 	mov	r0, #1	; 0x1
33f880c4:	ea000006 	b	33f880e4 <.text+0x80e4>
33f880c8:	e59f302c 	ldr	r3, [pc, #44]	; 33f880fc <.text+0x80fc>
33f880cc:	e3a00001 	mov	r0, #1	; 0x1
33f880d0:	ea000003 	b	33f880e4 <.text+0x80e4>
33f880d4:	e3510000 	cmp	r1, #0	; 0x0
33f880d8:	e3a00001 	mov	r0, #1	; 0x1
33f880dc:	1a000002 	bne	33f880ec <.text+0x80ec>
33f880e0:	e59f3018 	ldr	r3, [pc, #24]	; 33f88100 <.text+0x8100>
33f880e4:	e5831000 	str	r1, [r3]
33f880e8:	e1a0f00e 	mov	pc, lr
33f880ec:	e3a00000 	mov	r0, #0	; 0x0
33f880f0:	e1a0f00e 	mov	pc, lr
33f880f4:	33f956ec 	mvnccs	r5, #247463936	; 0xec00000
33f880f8:	33f965b0 	mvnccs	r6, #738197504	; 0x2c000000
33f880fc:	33f956f0 	mvnccs	r5, #251658240	; 0xf000000
33f88100:	33f965b4 	mvnccs	r6, #754974720	; 0x2d000000

33f88104 <malloc_trim>:
33f88104:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f88108:	e59f60c0 	ldr	r6, [pc, #192]	; 33f881d0 <.text+0x81d0>
33f8810c:	e5963008 	ldr	r3, [r6, #8]
33f88110:	e5933004 	ldr	r3, [r3, #4]
33f88114:	e3c35003 	bic	r5, r3, #3	; 0x3
33f88118:	e0603005 	rsb	r3, r0, r5
33f8811c:	e2833efe 	add	r3, r3, #4064	; 0xfe0
33f88120:	e283300f 	add	r3, r3, #15	; 0xf
33f88124:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
33f88128:	e3c3300f 	bic	r3, r3, #15	; 0xf
33f8812c:	e2434a01 	sub	r4, r3, #4096	; 0x1000
33f88130:	e3540a01 	cmp	r4, #4096	; 0x1000
33f88134:	e3a00000 	mov	r0, #0	; 0x0
33f88138:	ba000021 	blt	33f881c4 <malloc_trim+0xc0>
33f8813c:	ebffe2bb 	bl	33f80c30 <sbrk>
33f88140:	e5963008 	ldr	r3, [r6, #8]
33f88144:	e0853003 	add	r3, r5, r3
33f88148:	e1500003 	cmp	r0, r3
33f8814c:	e2640000 	rsb	r0, r4, #0	; 0x0
33f88150:	1a00001b 	bne	33f881c4 <malloc_trim+0xc0>
33f88154:	ebffe2b5 	bl	33f80c30 <sbrk>
33f88158:	e0643005 	rsb	r3, r4, r5
33f8815c:	e3700001 	cmn	r0, #1	; 0x1
33f88160:	e3832001 	orr	r2, r3, #1	; 0x1
33f88164:	e59f1068 	ldr	r1, [pc, #104]	; 33f881d4 <.text+0x81d4>
33f88168:	e3a00000 	mov	r0, #0	; 0x0
33f8816c:	e3a0e001 	mov	lr, #1	; 0x1
33f88170:	1a00000d 	bne	33f881ac <malloc_trim+0xa8>
33f88174:	ebffe2ad 	bl	33f80c30 <sbrk>
33f88178:	e596c008 	ldr	ip, [r6, #8]
33f8817c:	e06c3000 	rsb	r3, ip, r0
33f88180:	e353000f 	cmp	r3, #15	; 0xf
33f88184:	e3831001 	orr	r1, r3, #1	; 0x1
33f88188:	e3a0e000 	mov	lr, #0	; 0x0
33f8818c:	da00000c 	ble	33f881c4 <malloc_trim+0xc0>
33f88190:	e59f3040 	ldr	r3, [pc, #64]	; 33f881d8 <.text+0x81d8>
33f88194:	e5933000 	ldr	r3, [r3]
33f88198:	e59f2034 	ldr	r2, [pc, #52]	; 33f881d4 <.text+0x81d4>
33f8819c:	e0633000 	rsb	r3, r3, r0
33f881a0:	e5823000 	str	r3, [r2]
33f881a4:	e58c1004 	str	r1, [ip, #4]
33f881a8:	ea000006 	b	33f881c8 <malloc_trim+0xc4>
33f881ac:	e5963008 	ldr	r3, [r6, #8]
33f881b0:	e5832004 	str	r2, [r3, #4]
33f881b4:	e5913000 	ldr	r3, [r1]
33f881b8:	e0643003 	rsb	r3, r4, r3
33f881bc:	e5813000 	str	r3, [r1]
33f881c0:	ea000000 	b	33f881c8 <malloc_trim+0xc4>
33f881c4:	e3a0e000 	mov	lr, #0	; 0x0
33f881c8:	e1a0000e 	mov	r0, lr
33f881cc:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f881d0:	33f956f4 	mvnccs	r5, #255852544	; 0xf400000
33f881d4:	33f965b8 	mvnccs	r6, #771751936	; 0x2e000000
33f881d8:	33f95afc 	mvnccs	r5, #1032192	; 0xfc000

33f881dc <free>:
33f881dc:	e250c000 	subs	ip, r0, #0	; 0x0
33f881e0:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f881e4:	08bd8070 	ldmeqia	sp!, {r4, r5, r6, pc}
33f881e8:	e51c3004 	ldr	r3, [ip, #-4]
33f881ec:	e59f621c 	ldr	r6, [pc, #540]	; 33f88410 <.text+0x8410>
33f881f0:	e24ce008 	sub	lr, ip, #8	; 0x8
33f881f4:	e3c30001 	bic	r0, r3, #1	; 0x1
33f881f8:	e08e4000 	add	r4, lr, r0
33f881fc:	e5962008 	ldr	r2, [r6, #8]
33f88200:	e5941004 	ldr	r1, [r4, #4]
33f88204:	e1540002 	cmp	r4, r2
33f88208:	e3c15003 	bic	r5, r1, #3	; 0x3
33f8820c:	e2031001 	and	r1, r3, #1	; 0x1
33f88210:	1a000014 	bne	33f88268 <free+0x8c>
33f88214:	e3510000 	cmp	r1, #0	; 0x0
33f88218:	e0800005 	add	r0, r0, r5
33f8821c:	1a000006 	bne	33f8823c <free+0x60>
33f88220:	e51c1008 	ldr	r1, [ip, #-8]
33f88224:	e061e00e 	rsb	lr, r1, lr
33f88228:	e59e200c 	ldr	r2, [lr, #12]
33f8822c:	e59e3008 	ldr	r3, [lr, #8]
33f88230:	e5823008 	str	r3, [r2, #8]
33f88234:	e583200c 	str	r2, [r3, #12]
33f88238:	e0800001 	add	r0, r0, r1
33f8823c:	e3803001 	orr	r3, r0, #1	; 0x1
33f88240:	e58e3004 	str	r3, [lr, #4]
33f88244:	e59f31c8 	ldr	r3, [pc, #456]	; 33f88414 <.text+0x8414>
33f88248:	e5933000 	ldr	r3, [r3]
33f8824c:	e1500003 	cmp	r0, r3
33f88250:	e586e008 	str	lr, [r6, #8]
33f88254:	38bd8070 	ldmccia	sp!, {r4, r5, r6, pc}
33f88258:	e59f31b8 	ldr	r3, [pc, #440]	; 33f88418 <.text+0x8418>
33f8825c:	e5930000 	ldr	r0, [r3]
33f88260:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
33f88264:	eaffffa6 	b	33f88104 <malloc_trim>
33f88268:	e3510000 	cmp	r1, #0	; 0x0
33f8826c:	e5845004 	str	r5, [r4, #4]
33f88270:	13a01000 	movne	r1, #0	; 0x0
33f88274:	1a000009 	bne	33f882a0 <free+0xc4>
33f88278:	e51c2008 	ldr	r2, [ip, #-8]
33f8827c:	e062e00e 	rsb	lr, r2, lr
33f88280:	e59ec008 	ldr	ip, [lr, #8]
33f88284:	e2863008 	add	r3, r6, #8	; 0x8
33f88288:	e15c0003 	cmp	ip, r3
33f8828c:	159e300c 	ldrne	r3, [lr, #12]
33f88290:	1583c008 	strne	ip, [r3, #8]
33f88294:	158c300c 	strne	r3, [ip, #12]
33f88298:	e0800002 	add	r0, r0, r2
33f8829c:	03a01001 	moveq	r1, #1	; 0x1
33f882a0:	e0843005 	add	r3, r4, r5
33f882a4:	e5933004 	ldr	r3, [r3, #4]
33f882a8:	e3130001 	tst	r3, #1	; 0x1
33f882ac:	1a000012 	bne	33f882fc <free+0x120>
33f882b0:	e3510000 	cmp	r1, #0	; 0x0
33f882b4:	e0800005 	add	r0, r0, r5
33f882b8:	1a00000b 	bne	33f882ec <free+0x110>
33f882bc:	e5942008 	ldr	r2, [r4, #8]
33f882c0:	e59f3154 	ldr	r3, [pc, #340]	; 33f8841c <.text+0x841c>
33f882c4:	e1520003 	cmp	r2, r3
33f882c8:	1a000007 	bne	33f882ec <free+0x110>
33f882cc:	e3803001 	orr	r3, r0, #1	; 0x1
33f882d0:	e582e00c 	str	lr, [r2, #12]
33f882d4:	e582e008 	str	lr, [r2, #8]
33f882d8:	e78e0000 	str	r0, [lr, r0]
33f882dc:	e58e3004 	str	r3, [lr, #4]
33f882e0:	e58e2008 	str	r2, [lr, #8]
33f882e4:	e58e200c 	str	r2, [lr, #12]
33f882e8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f882ec:	e2842008 	add	r2, r4, #8	; 0x8
33f882f0:	e892000c 	ldmia	r2, {r2, r3}
33f882f4:	e5832008 	str	r2, [r3, #8]
33f882f8:	e582300c 	str	r3, [r2, #12]
33f882fc:	e3803001 	orr	r3, r0, #1	; 0x1
33f88300:	e3510000 	cmp	r1, #0	; 0x0
33f88304:	e58e3004 	str	r3, [lr, #4]
33f88308:	e78e0000 	str	r0, [lr, r0]
33f8830c:	18bd8070 	ldmneia	sp!, {r4, r5, r6, pc}
33f88310:	e3500c02 	cmp	r0, #512	; 0x200
33f88314:	2a00000d 	bcs	33f88350 <free+0x174>
33f88318:	e1a001a0 	mov	r0, r0, lsr #3
33f8831c:	e5962004 	ldr	r2, [r6, #4]
33f88320:	e1a01120 	mov	r1, r0, lsr #2
33f88324:	e3a03001 	mov	r3, #1	; 0x1
33f88328:	e1822113 	orr	r2, r2, r3, lsl r1
33f8832c:	e59f30dc 	ldr	r3, [pc, #220]	; 33f88410 <.text+0x8410>
33f88330:	e0833180 	add	r3, r3, r0, lsl #3
33f88334:	e5931008 	ldr	r1, [r3, #8]
33f88338:	e58e300c 	str	r3, [lr, #12]
33f8833c:	e58e1008 	str	r1, [lr, #8]
33f88340:	e5862004 	str	r2, [r6, #4]
33f88344:	e581e00c 	str	lr, [r1, #12]
33f88348:	e583e008 	str	lr, [r3, #8]
33f8834c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f88350:	e1b014a0 	movs	r1, r0, lsr #9
33f88354:	01a011a0 	moveq	r1, r0, lsr #3
33f88358:	0a000013 	beq	33f883ac <free+0x1d0>
33f8835c:	e3510004 	cmp	r1, #4	; 0x4
33f88360:	91a03320 	movls	r3, r0, lsr #6
33f88364:	92831038 	addls	r1, r3, #56	; 0x38
33f88368:	9a00000f 	bls	33f883ac <free+0x1d0>
33f8836c:	e3510014 	cmp	r1, #20	; 0x14
33f88370:	9281105b 	addls	r1, r1, #91	; 0x5b
33f88374:	9a00000c 	bls	33f883ac <free+0x1d0>
33f88378:	e3510054 	cmp	r1, #84	; 0x54
33f8837c:	91a03620 	movls	r3, r0, lsr #12
33f88380:	9283106e 	addls	r1, r3, #110	; 0x6e
33f88384:	9a000008 	bls	33f883ac <free+0x1d0>
33f88388:	e3510f55 	cmp	r1, #340	; 0x154
33f8838c:	91a037a0 	movls	r3, r0, lsr #15
33f88390:	92831077 	addls	r1, r3, #119	; 0x77
33f88394:	9a000004 	bls	33f883ac <free+0x1d0>
33f88398:	e59f3080 	ldr	r3, [pc, #128]	; 33f88420 <.text+0x8420>
33f8839c:	e1510003 	cmp	r1, r3
33f883a0:	91a03920 	movls	r3, r0, lsr #18
33f883a4:	83a0107e 	movhi	r1, #126	; 0x7e
33f883a8:	9283107c 	addls	r1, r3, #124	; 0x7c
33f883ac:	e59f305c 	ldr	r3, [pc, #92]	; 33f88410 <.text+0x8410>
33f883b0:	e0832181 	add	r2, r3, r1, lsl #3
33f883b4:	e592c008 	ldr	ip, [r2, #8]
33f883b8:	e15c0002 	cmp	ip, r2
33f883bc:	1a000009 	bne	33f883e8 <free+0x20c>
33f883c0:	e5963004 	ldr	r3, [r6, #4]
33f883c4:	e3a02001 	mov	r2, #1	; 0x1
33f883c8:	e1a01121 	mov	r1, r1, lsr #2
33f883cc:	e1833112 	orr	r3, r3, r2, lsl r1
33f883d0:	e1a0200c 	mov	r2, ip
33f883d4:	e5863004 	str	r3, [r6, #4]
33f883d8:	ea000007 	b	33f883fc <free+0x220>
33f883dc:	e59cc008 	ldr	ip, [ip, #8]
33f883e0:	e15c0002 	cmp	ip, r2
33f883e4:	0a000003 	beq	33f883f8 <free+0x21c>
33f883e8:	e59c3004 	ldr	r3, [ip, #4]
33f883ec:	e3c33003 	bic	r3, r3, #3	; 0x3
33f883f0:	e1500003 	cmp	r0, r3
33f883f4:	3afffff8 	bcc	33f883dc <free+0x200>
33f883f8:	e59c200c 	ldr	r2, [ip, #12]
33f883fc:	e58e200c 	str	r2, [lr, #12]
33f88400:	e58ec008 	str	ip, [lr, #8]
33f88404:	e58ce00c 	str	lr, [ip, #12]
33f88408:	e582e008 	str	lr, [r2, #8]
33f8840c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f88410:	33f956f4 	mvnccs	r5, #255852544	; 0xf400000
33f88414:	33f956ec 	mvnccs	r5, #247463936	; 0xec00000
33f88418:	33f965b0 	mvnccs	r6, #738197504	; 0x2c000000
33f8841c:	33f956fc 	mvnccs	r5, #264241152	; 0xfc00000
33f88420:	00000554 	andeq	r0, r0, r4, asr r5

33f88424 <cfree>:
33f88424:	eaffff6c 	b	33f881dc <free>

33f88428 <malloc>:
33f88428:	e3500000 	cmp	r0, #0	; 0x0
33f8842c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f88430:	ba000177 	blt	33f88a14 <malloc+0x5ec>
33f88434:	e280000b 	add	r0, r0, #11	; 0xb
33f88438:	e3500016 	cmp	r0, #22	; 0x16
33f8843c:	d3a0a010 	movle	sl, #16	; 0x10
33f88440:	da000002 	ble	33f88450 <malloc+0x28>
33f88444:	e3c0a007 	bic	sl, r0, #7	; 0x7
33f88448:	e35a0f7e 	cmp	sl, #504	; 0x1f8
33f8844c:	2a000016 	bcs	33f884ac <malloc+0x84>
33f88450:	e59f35c8 	ldr	r3, [pc, #1480]	; 33f88a20 <.text+0x8a20>
33f88454:	e1a021aa 	mov	r2, sl, lsr #3
33f88458:	e0833182 	add	r3, r3, r2, lsl #3
33f8845c:	e593c00c 	ldr	ip, [r3, #12]
33f88460:	e15c0003 	cmp	ip, r3
33f88464:	1a000003 	bne	33f88478 <malloc+0x50>
33f88468:	e28c3008 	add	r3, ip, #8	; 0x8
33f8846c:	e593c00c 	ldr	ip, [r3, #12]
33f88470:	e15c0003 	cmp	ip, r3
33f88474:	0a00000a 	beq	33f884a4 <malloc+0x7c>
33f88478:	e59c3004 	ldr	r3, [ip, #4]
33f8847c:	e3c33003 	bic	r3, r3, #3	; 0x3
33f88480:	e08c3003 	add	r3, ip, r3
33f88484:	e5932004 	ldr	r2, [r3, #4]
33f88488:	e59c000c 	ldr	r0, [ip, #12]
33f8848c:	e59c1008 	ldr	r1, [ip, #8]
33f88490:	e3822001 	orr	r2, r2, #1	; 0x1
33f88494:	e28c5008 	add	r5, ip, #8	; 0x8
33f88498:	e5801008 	str	r1, [r0, #8]
33f8849c:	e5832004 	str	r2, [r3, #4]
33f884a0:	ea000159 	b	33f88a0c <malloc+0x5e4>
33f884a4:	e2825002 	add	r5, r2, #2	; 0x2
33f884a8:	ea00002a 	b	33f88558 <malloc+0x130>
33f884ac:	e1b024aa 	movs	r2, sl, lsr #9
33f884b0:	01a021aa 	moveq	r2, sl, lsr #3
33f884b4:	0a000017 	beq	33f88518 <malloc+0xf0>
33f884b8:	e3520004 	cmp	r2, #4	; 0x4
33f884bc:	91a0332a 	movls	r3, sl, lsr #6
33f884c0:	92832038 	addls	r2, r3, #56	; 0x38
33f884c4:	9a000013 	bls	33f88518 <malloc+0xf0>
33f884c8:	e3520014 	cmp	r2, #20	; 0x14
33f884cc:	9282205b 	addls	r2, r2, #91	; 0x5b
33f884d0:	9a000010 	bls	33f88518 <malloc+0xf0>
33f884d4:	e3520054 	cmp	r2, #84	; 0x54
33f884d8:	91a0362a 	movls	r3, sl, lsr #12
33f884dc:	9283206e 	addls	r2, r3, #110	; 0x6e
33f884e0:	9a00000c 	bls	33f88518 <malloc+0xf0>
33f884e4:	e3520f55 	cmp	r2, #340	; 0x154
33f884e8:	91a037aa 	movls	r3, sl, lsr #15
33f884ec:	92832077 	addls	r2, r3, #119	; 0x77
33f884f0:	9a000008 	bls	33f88518 <malloc+0xf0>
33f884f4:	e59f3528 	ldr	r3, [pc, #1320]	; 33f88a24 <.text+0x8a24>
33f884f8:	e1520003 	cmp	r2, r3
33f884fc:	83a0207e 	movhi	r2, #126	; 0x7e
33f88500:	8a000004 	bhi	33f88518 <malloc+0xf0>
33f88504:	ea000001 	b	33f88510 <malloc+0xe8>
33f88508:	e2422001 	sub	r2, r2, #1	; 0x1
33f8850c:	ea000010 	b	33f88554 <malloc+0x12c>
33f88510:	e1a0392a 	mov	r3, sl, lsr #18
33f88514:	e283207c 	add	r2, r3, #124	; 0x7c
33f88518:	e59f3500 	ldr	r3, [pc, #1280]	; 33f88a20 <.text+0x8a20>
33f8851c:	e083e182 	add	lr, r3, r2, lsl #3
33f88520:	e59e000c 	ldr	r0, [lr, #12]
33f88524:	ea000008 	b	33f8854c <malloc+0x124>
33f88528:	e5903004 	ldr	r3, [r0, #4]
33f8852c:	e3c33003 	bic	r3, r3, #3	; 0x3
33f88530:	e06a1003 	rsb	r1, sl, r3
33f88534:	e351000f 	cmp	r1, #15	; 0xf
33f88538:	cafffff2 	bgt	33f88508 <malloc+0xe0>
33f8853c:	e3510000 	cmp	r1, #0	; 0x0
33f88540:	e590c00c 	ldr	ip, [r0, #12]
33f88544:	aa000111 	bge	33f88990 <malloc+0x568>
33f88548:	e1a0000c 	mov	r0, ip
33f8854c:	e150000e 	cmp	r0, lr
33f88550:	1afffff4 	bne	33f88528 <malloc+0x100>
33f88554:	e2825001 	add	r5, r2, #1	; 0x1
33f88558:	e59f94c0 	ldr	r9, [pc, #1216]	; 33f88a20 <.text+0x8a20>
33f8855c:	e2897008 	add	r7, r9, #8	; 0x8
33f88560:	e5974008 	ldr	r4, [r7, #8]
33f88564:	e1540007 	cmp	r4, r7
33f88568:	0a000057 	beq	33f886cc <malloc+0x2a4>
33f8856c:	e5943004 	ldr	r3, [r4, #4]
33f88570:	e3c32003 	bic	r2, r3, #3	; 0x3
33f88574:	e06a0002 	rsb	r0, sl, r2
33f88578:	e350000f 	cmp	r0, #15	; 0xf
33f8857c:	da00000a 	ble	33f885ac <malloc+0x184>
33f88580:	e084200a 	add	r2, r4, sl
33f88584:	e38a3001 	orr	r3, sl, #1	; 0x1
33f88588:	e3801001 	orr	r1, r0, #1	; 0x1
33f8858c:	e2845008 	add	r5, r4, #8	; 0x8
33f88590:	e5843004 	str	r3, [r4, #4]
33f88594:	e587200c 	str	r2, [r7, #12]
33f88598:	e5872008 	str	r2, [r7, #8]
33f8859c:	e7820000 	str	r0, [r2, r0]
33f885a0:	e9820082 	stmib	r2, {r1, r7}
33f885a4:	e582700c 	str	r7, [r2, #12]
33f885a8:	ea00011a 	b	33f88a18 <malloc+0x5f0>
33f885ac:	e3500000 	cmp	r0, #0	; 0x0
33f885b0:	e587700c 	str	r7, [r7, #12]
33f885b4:	e5877008 	str	r7, [r7, #8]
33f885b8:	ba000005 	blt	33f885d4 <malloc+0x1ac>
33f885bc:	e0842002 	add	r2, r4, r2
33f885c0:	e5923004 	ldr	r3, [r2, #4]
33f885c4:	e2845008 	add	r5, r4, #8	; 0x8
33f885c8:	e3833001 	orr	r3, r3, #1	; 0x1
33f885cc:	e5823004 	str	r3, [r2, #4]
33f885d0:	ea000110 	b	33f88a18 <malloc+0x5f0>
33f885d4:	e3520c02 	cmp	r2, #512	; 0x200
33f885d8:	2a00000c 	bcs	33f88610 <malloc+0x1e8>
33f885dc:	e1a011a2 	mov	r1, r2, lsr #3
33f885e0:	e5992004 	ldr	r2, [r9, #4]
33f885e4:	e1a00121 	mov	r0, r1, lsr #2
33f885e8:	e3a03001 	mov	r3, #1	; 0x1
33f885ec:	e1822013 	orr	r2, r2, r3, lsl r0
33f885f0:	e0891181 	add	r1, r9, r1, lsl #3
33f885f4:	e5913008 	ldr	r3, [r1, #8]
33f885f8:	e584100c 	str	r1, [r4, #12]
33f885fc:	e5843008 	str	r3, [r4, #8]
33f88600:	e5892004 	str	r2, [r9, #4]
33f88604:	e583400c 	str	r4, [r3, #12]
33f88608:	e5814008 	str	r4, [r1, #8]
33f8860c:	ea00002e 	b	33f886cc <malloc+0x2a4>
33f88610:	e1b014a2 	movs	r1, r2, lsr #9
33f88614:	01a011a2 	moveq	r1, r2, lsr #3
33f88618:	0a000013 	beq	33f8866c <malloc+0x244>
33f8861c:	e3510004 	cmp	r1, #4	; 0x4
33f88620:	91a03322 	movls	r3, r2, lsr #6
33f88624:	92831038 	addls	r1, r3, #56	; 0x38
33f88628:	9a00000f 	bls	33f8866c <malloc+0x244>
33f8862c:	e3510014 	cmp	r1, #20	; 0x14
33f88630:	9281105b 	addls	r1, r1, #91	; 0x5b
33f88634:	9a00000c 	bls	33f8866c <malloc+0x244>
33f88638:	e3510054 	cmp	r1, #84	; 0x54
33f8863c:	91a03622 	movls	r3, r2, lsr #12
33f88640:	9283106e 	addls	r1, r3, #110	; 0x6e
33f88644:	9a000008 	bls	33f8866c <malloc+0x244>
33f88648:	e3510f55 	cmp	r1, #340	; 0x154
33f8864c:	91a037a2 	movls	r3, r2, lsr #15
33f88650:	92831077 	addls	r1, r3, #119	; 0x77
33f88654:	9a000004 	bls	33f8866c <malloc+0x244>
33f88658:	e59f33c4 	ldr	r3, [pc, #964]	; 33f88a24 <.text+0x8a24>
33f8865c:	e1510003 	cmp	r1, r3
33f88660:	91a03922 	movls	r3, r2, lsr #18
33f88664:	83a0107e 	movhi	r1, #126	; 0x7e
33f88668:	9283107c 	addls	r1, r3, #124	; 0x7c
33f8866c:	e0890181 	add	r0, r9, r1, lsl #3
33f88670:	e590c008 	ldr	ip, [r0, #8]
33f88674:	e15c0000 	cmp	ip, r0
33f88678:	1a00000a 	bne	33f886a8 <malloc+0x280>
33f8867c:	e59f039c 	ldr	r0, [pc, #924]	; 33f88a20 <.text+0x8a20>
33f88680:	e5902004 	ldr	r2, [r0, #4]
33f88684:	e1a01121 	mov	r1, r1, lsr #2
33f88688:	e3a03001 	mov	r3, #1	; 0x1
33f8868c:	e1822113 	orr	r2, r2, r3, lsl r1
33f88690:	e1a0e00c 	mov	lr, ip
33f88694:	e5802004 	str	r2, [r0, #4]
33f88698:	ea000007 	b	33f886bc <malloc+0x294>
33f8869c:	e59cc008 	ldr	ip, [ip, #8]
33f886a0:	e15c0000 	cmp	ip, r0
33f886a4:	0a000003 	beq	33f886b8 <malloc+0x290>
33f886a8:	e59c3004 	ldr	r3, [ip, #4]
33f886ac:	e3c33003 	bic	r3, r3, #3	; 0x3
33f886b0:	e1520003 	cmp	r2, r3
33f886b4:	3afffff8 	bcc	33f8869c <malloc+0x274>
33f886b8:	e59ce00c 	ldr	lr, [ip, #12]
33f886bc:	e584e00c 	str	lr, [r4, #12]
33f886c0:	e584c008 	str	ip, [r4, #8]
33f886c4:	e58c400c 	str	r4, [ip, #12]
33f886c8:	e58e4008 	str	r4, [lr, #8]
33f886cc:	e3550000 	cmp	r5, #0	; 0x0
33f886d0:	e2853003 	add	r3, r5, #3	; 0x3
33f886d4:	a1a03005 	movge	r3, r5
33f886d8:	e1a03143 	mov	r3, r3, asr #2
33f886dc:	e3a02001 	mov	r2, #1	; 0x1
33f886e0:	e1a02312 	mov	r2, r2, lsl r3
33f886e4:	e59fb334 	ldr	fp, [pc, #820]	; 33f88a20 <.text+0x8a20>
33f886e8:	e59b1004 	ldr	r1, [fp, #4]
33f886ec:	e1520001 	cmp	r2, r1
33f886f0:	8a000037 	bhi	33f887d4 <malloc+0x3ac>
33f886f4:	e1120001 	tst	r2, r1
33f886f8:	01a02082 	moveq	r2, r2, lsl #1
33f886fc:	03c53003 	biceq	r3, r5, #3	; 0x3
33f88700:	0a000001 	beq	33f8870c <malloc+0x2e4>
33f88704:	ea000004 	b	33f8871c <malloc+0x2f4>
33f88708:	e1a02082 	mov	r2, r2, lsl #1
33f8870c:	e1120001 	tst	r2, r1
33f88710:	e2833004 	add	r3, r3, #4	; 0x4
33f88714:	0afffffb 	beq	33f88708 <malloc+0x2e0>
33f88718:	e1a05003 	mov	r5, r3
33f8871c:	e0896185 	add	r6, r9, r5, lsl #3
33f88720:	e1a04005 	mov	r4, r5
33f88724:	e1a01006 	mov	r1, r6
33f88728:	e591c00c 	ldr	ip, [r1, #12]
33f8872c:	ea000008 	b	33f88754 <malloc+0x32c>
33f88730:	e59c3004 	ldr	r3, [ip, #4]
33f88734:	e3c33003 	bic	r3, r3, #3	; 0x3
33f88738:	e06ae003 	rsb	lr, sl, r3
33f8873c:	e35e000f 	cmp	lr, #15	; 0xf
33f88740:	ca00009b 	bgt	33f889b4 <malloc+0x58c>
33f88744:	e35e0000 	cmp	lr, #0	; 0x0
33f88748:	e59c000c 	ldr	r0, [ip, #12]
33f8874c:	aa0000a7 	bge	33f889f0 <malloc+0x5c8>
33f88750:	e1a0c000 	mov	ip, r0
33f88754:	e15c0001 	cmp	ip, r1
33f88758:	1afffff4 	bne	33f88730 <malloc+0x308>
33f8875c:	e2844001 	add	r4, r4, #1	; 0x1
33f88760:	e3140003 	tst	r4, #3	; 0x3
33f88764:	128c1008 	addne	r1, ip, #8	; 0x8
33f88768:	1affffee 	bne	33f88728 <malloc+0x300>
33f8876c:	e1a00005 	mov	r0, r5
33f88770:	e1a01006 	mov	r1, r6
33f88774:	e3100003 	tst	r0, #3	; 0x3
33f88778:	e2411008 	sub	r1, r1, #8	; 0x8
33f8877c:	e2400001 	sub	r0, r0, #1	; 0x1
33f88780:	0a00000f 	beq	33f887c4 <malloc+0x39c>
33f88784:	e5913008 	ldr	r3, [r1, #8]
33f88788:	e1530001 	cmp	r3, r1
33f8878c:	0afffff8 	beq	33f88774 <malloc+0x34c>
33f88790:	e59b3004 	ldr	r3, [fp, #4]
33f88794:	e1a02082 	mov	r2, r2, lsl #1
33f88798:	e1520003 	cmp	r2, r3
33f8879c:	8a00000c 	bhi	33f887d4 <malloc+0x3ac>
33f887a0:	e3520000 	cmp	r2, #0	; 0x0
33f887a4:	1a000002 	bne	33f887b4 <malloc+0x38c>
33f887a8:	ea000009 	b	33f887d4 <malloc+0x3ac>
33f887ac:	e2844004 	add	r4, r4, #4	; 0x4
33f887b0:	e1a02082 	mov	r2, r2, lsl #1
33f887b4:	e1120003 	tst	r2, r3
33f887b8:	0afffffb 	beq	33f887ac <malloc+0x384>
33f887bc:	e1a05004 	mov	r5, r4
33f887c0:	eaffffd5 	b	33f8871c <malloc+0x2f4>
33f887c4:	e59b3004 	ldr	r3, [fp, #4]
33f887c8:	e1c33002 	bic	r3, r3, r2
33f887cc:	e58b3004 	str	r3, [fp, #4]
33f887d0:	eaffffee 	b	33f88790 <malloc+0x368>
33f887d4:	e59b6008 	ldr	r6, [fp, #8]
33f887d8:	e5963004 	ldr	r3, [r6, #4]
33f887dc:	e3c37003 	bic	r7, r3, #3	; 0x3
33f887e0:	e06a0007 	rsb	r0, sl, r7
33f887e4:	e350000f 	cmp	r0, #15	; 0xf
33f887e8:	ca00005f 	bgt	33f8896c <malloc+0x544>
33f887ec:	e59f3234 	ldr	r3, [pc, #564]	; 33f88a28 <.text+0x8a28>
33f887f0:	e59f9234 	ldr	r9, [pc, #564]	; 33f88a2c <.text+0x8a2c>
33f887f4:	e5933000 	ldr	r3, [r3]
33f887f8:	e5992000 	ldr	r2, [r9]
33f887fc:	e2833010 	add	r3, r3, #16	; 0x10
33f88800:	e3720001 	cmn	r2, #1	; 0x1
33f88804:	e08a4003 	add	r4, sl, r3
33f88808:	12843eff 	addne	r3, r4, #4080	; 0xff0
33f8880c:	1283300f 	addne	r3, r3, #15	; 0xf
33f88810:	13c34eff 	bicne	r4, r3, #4080	; 0xff0
33f88814:	13c4400f 	bicne	r4, r4, #15	; 0xf
33f88818:	e1a00004 	mov	r0, r4
33f8881c:	ebffe103 	bl	33f80c30 <sbrk>
33f88820:	e3700001 	cmn	r0, #1	; 0x1
33f88824:	0a00004a 	beq	33f88954 <malloc+0x52c>
33f88828:	e0862007 	add	r2, r6, r7
33f8882c:	e1500002 	cmp	r0, r2
33f88830:	e1a05000 	mov	r5, r0
33f88834:	2a000001 	bcs	33f88840 <malloc+0x418>
33f88838:	e156000b 	cmp	r6, fp
33f8883c:	1a000044 	bne	33f88954 <malloc+0x52c>
33f88840:	e59fc1e8 	ldr	ip, [pc, #488]	; 33f88a30 <.text+0x8a30>
33f88844:	e59c3000 	ldr	r3, [ip]
33f88848:	e1550002 	cmp	r5, r2
33f8884c:	e0841003 	add	r1, r4, r3
33f88850:	e58c1000 	str	r1, [ip]
33f88854:	00843007 	addeq	r3, r4, r7
33f88858:	059b2008 	ldreq	r2, [fp, #8]
33f8885c:	03833001 	orreq	r3, r3, #1	; 0x1
33f88860:	05823004 	streq	r3, [r2, #4]
33f88864:	0a000030 	beq	33f8892c <malloc+0x504>
33f88868:	e5993000 	ldr	r3, [r9]
33f8886c:	e3730001 	cmn	r3, #1	; 0x1
33f88870:	10623005 	rsbne	r3, r2, r5
33f88874:	10813003 	addne	r3, r1, r3
33f88878:	05895000 	streq	r5, [r9]
33f8887c:	158c3000 	strne	r3, [ip]
33f88880:	e2103007 	ands	r3, r0, #7	; 0x7
33f88884:	12631008 	rsbne	r1, r3, #8	; 0x8
33f88888:	10805001 	addne	r5, r0, r1
33f8888c:	e0852004 	add	r2, r5, r4
33f88890:	01a01003 	moveq	r1, r3
33f88894:	e2823eff 	add	r3, r2, #4080	; 0xff0
33f88898:	e283300f 	add	r3, r3, #15	; 0xf
33f8889c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
33f888a0:	e3c3300f 	bic	r3, r3, #15	; 0xf
33f888a4:	e0623003 	rsb	r3, r2, r3
33f888a8:	e0814003 	add	r4, r1, r3
33f888ac:	e1a00004 	mov	r0, r4
33f888b0:	ebffe0de 	bl	33f80c30 <sbrk>
33f888b4:	e3700001 	cmn	r0, #1	; 0x1
33f888b8:	0a000025 	beq	33f88954 <malloc+0x52c>
33f888bc:	e59f316c 	ldr	r3, [pc, #364]	; 33f88a30 <.text+0x8a30>
33f888c0:	e0652000 	rsb	r2, r5, r0
33f888c4:	e5931000 	ldr	r1, [r3]
33f888c8:	e0822004 	add	r2, r2, r4
33f888cc:	e0811004 	add	r1, r1, r4
33f888d0:	e3822001 	orr	r2, r2, #1	; 0x1
33f888d4:	e156000b 	cmp	r6, fp
33f888d8:	e5831000 	str	r1, [r3]
33f888dc:	e5852004 	str	r2, [r5, #4]
33f888e0:	e58b5008 	str	r5, [fp, #8]
33f888e4:	0a000010 	beq	33f8892c <malloc+0x504>
33f888e8:	e357000f 	cmp	r7, #15	; 0xf
33f888ec:	93a03001 	movls	r3, #1	; 0x1
33f888f0:	95853004 	strls	r3, [r5, #4]
33f888f4:	9a000016 	bls	33f88954 <malloc+0x52c>
33f888f8:	e5963004 	ldr	r3, [r6, #4]
33f888fc:	e247200c 	sub	r2, r7, #12	; 0xc
33f88900:	e3c22007 	bic	r2, r2, #7	; 0x7
33f88904:	e2033001 	and	r3, r3, #1	; 0x1
33f88908:	e1833002 	orr	r3, r3, r2
33f8890c:	e3a01005 	mov	r1, #5	; 0x5
33f88910:	e352000f 	cmp	r2, #15	; 0xf
33f88914:	e0862002 	add	r2, r6, r2
33f88918:	e5863004 	str	r3, [r6, #4]
33f8891c:	e5821008 	str	r1, [r2, #8]
33f88920:	e5821004 	str	r1, [r2, #4]
33f88924:	82860008 	addhi	r0, r6, #8	; 0x8
33f88928:	8bfffe2b 	blhi	33f881dc <free>
33f8892c:	e59f1100 	ldr	r1, [pc, #256]	; 33f88a34 <.text+0x8a34>
33f88930:	e59f30f8 	ldr	r3, [pc, #248]	; 33f88a30 <.text+0x8a30>
33f88934:	e5932000 	ldr	r2, [r3]
33f88938:	e5913000 	ldr	r3, [r1]
33f8893c:	e1520003 	cmp	r2, r3
33f88940:	85812000 	strhi	r2, [r1]
33f88944:	e59f10ec 	ldr	r1, [pc, #236]	; 33f88a38 <.text+0x8a38>
33f88948:	e5913000 	ldr	r3, [r1]
33f8894c:	e1520003 	cmp	r2, r3
33f88950:	85812000 	strhi	r2, [r1]
33f88954:	e59b3008 	ldr	r3, [fp, #8]
33f88958:	e5933004 	ldr	r3, [r3, #4]
33f8895c:	e3c33003 	bic	r3, r3, #3	; 0x3
33f88960:	e06a0003 	rsb	r0, sl, r3
33f88964:	e350000f 	cmp	r0, #15	; 0xf
33f88968:	da000029 	ble	33f88a14 <malloc+0x5ec>
33f8896c:	e59b2008 	ldr	r2, [fp, #8]
33f88970:	e3800001 	orr	r0, r0, #1	; 0x1
33f88974:	e082100a 	add	r1, r2, sl
33f88978:	e38a3001 	orr	r3, sl, #1	; 0x1
33f8897c:	e2825008 	add	r5, r2, #8	; 0x8
33f88980:	e5823004 	str	r3, [r2, #4]
33f88984:	e58b1008 	str	r1, [fp, #8]
33f88988:	e5810004 	str	r0, [r1, #4]
33f8898c:	ea000021 	b	33f88a18 <malloc+0x5f0>
33f88990:	e0803003 	add	r3, r0, r3
33f88994:	e5932004 	ldr	r2, [r3, #4]
33f88998:	e5901008 	ldr	r1, [r0, #8]
33f8899c:	e3822001 	orr	r2, r2, #1	; 0x1
33f889a0:	e2805008 	add	r5, r0, #8	; 0x8
33f889a4:	e58c1008 	str	r1, [ip, #8]
33f889a8:	e5832004 	str	r2, [r3, #4]
33f889ac:	e581c00c 	str	ip, [r1, #12]
33f889b0:	ea000018 	b	33f88a18 <malloc+0x5f0>
33f889b4:	e38a3001 	orr	r3, sl, #1	; 0x1
33f889b8:	e59c000c 	ldr	r0, [ip, #12]
33f889bc:	e58c3004 	str	r3, [ip, #4]
33f889c0:	e08c300a 	add	r3, ip, sl
33f889c4:	e5bc1008 	ldr	r1, [ip, #8]!
33f889c8:	e38e2001 	orr	r2, lr, #1	; 0x1
33f889cc:	e1a0500c 	mov	r5, ip
33f889d0:	e5801008 	str	r1, [r0, #8]
33f889d4:	e581000c 	str	r0, [r1, #12]
33f889d8:	e5873008 	str	r3, [r7, #8]
33f889dc:	e587300c 	str	r3, [r7, #12]
33f889e0:	e783e00e 	str	lr, [r3, lr]
33f889e4:	e9830084 	stmib	r3, {r2, r7}
33f889e8:	e583700c 	str	r7, [r3, #12]
33f889ec:	ea000009 	b	33f88a18 <malloc+0x5f0>
33f889f0:	e08c3003 	add	r3, ip, r3
33f889f4:	e5932004 	ldr	r2, [r3, #4]
33f889f8:	e5bc1008 	ldr	r1, [ip, #8]!
33f889fc:	e3822001 	orr	r2, r2, #1	; 0x1
33f88a00:	e5832004 	str	r2, [r3, #4]
33f88a04:	e5801008 	str	r1, [r0, #8]
33f88a08:	e1a0500c 	mov	r5, ip
33f88a0c:	e581000c 	str	r0, [r1, #12]
33f88a10:	ea000000 	b	33f88a18 <malloc+0x5f0>
33f88a14:	e3a05000 	mov	r5, #0	; 0x0
33f88a18:	e1a00005 	mov	r0, r5
33f88a1c:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f88a20:	33f956f4 	mvnccs	r5, #255852544	; 0xf400000
33f88a24:	00000554 	andeq	r0, r0, r4, asr r5
33f88a28:	33f965b0 	mvnccs	r6, #738197504	; 0x2c000000
33f88a2c:	33f95afc 	mvnccs	r5, #1032192	; 0xfc000
33f88a30:	33f965b8 	mvnccs	r6, #771751936	; 0x2e000000
33f88a34:	33f965e0 	mvnccs	r6, #939524096	; 0x38000000
33f88a38:	33f965e4 	mvnccs	r6, #956301312	; 0x39000000

33f88a3c <memalign>:
33f88a3c:	e3510000 	cmp	r1, #0	; 0x0
33f88a40:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f88a44:	e1a05000 	mov	r5, r0
33f88a48:	ba00003d 	blt	33f88b44 <memalign+0x108>
33f88a4c:	e3500008 	cmp	r0, #8	; 0x8
33f88a50:	8a000002 	bhi	33f88a60 <memalign+0x24>
33f88a54:	e1a00001 	mov	r0, r1
33f88a58:	e8bd44f0 	ldmia	sp!, {r4, r5, r6, r7, sl, lr}
33f88a5c:	eafffe71 	b	33f88428 <malloc>
33f88a60:	e281000b 	add	r0, r1, #11	; 0xb
33f88a64:	e355000f 	cmp	r5, #15	; 0xf
33f88a68:	93a05010 	movls	r5, #16	; 0x10
33f88a6c:	e3500016 	cmp	r0, #22	; 0x16
33f88a70:	d3a0a010 	movle	sl, #16	; 0x10
33f88a74:	c3c0a007 	bicgt	sl, r0, #7	; 0x7
33f88a78:	e28a0010 	add	r0, sl, #16	; 0x10
33f88a7c:	e0850000 	add	r0, r5, r0
33f88a80:	ebfffe68 	bl	33f88428 <malloc>
33f88a84:	e2507000 	subs	r7, r0, #0	; 0x0
33f88a88:	0a00002d 	beq	33f88b44 <memalign+0x108>
33f88a8c:	e1a01005 	mov	r1, r5
33f88a90:	eb001999 	bl	33f8f0fc <__umodsi3>
33f88a94:	e3500000 	cmp	r0, #0	; 0x0
33f88a98:	e2476008 	sub	r6, r7, #8	; 0x8
33f88a9c:	0a000018 	beq	33f88b04 <memalign+0xc8>
33f88aa0:	e0873005 	add	r3, r7, r5
33f88aa4:	e2652000 	rsb	r2, r5, #0	; 0x0
33f88aa8:	e2433001 	sub	r3, r3, #1	; 0x1
33f88aac:	e0033002 	and	r3, r3, r2
33f88ab0:	e2434008 	sub	r4, r3, #8	; 0x8
33f88ab4:	e0663004 	rsb	r3, r6, r4
33f88ab8:	e5172004 	ldr	r2, [r7, #-4]
33f88abc:	e353000f 	cmp	r3, #15	; 0xf
33f88ac0:	90844005 	addls	r4, r4, r5
33f88ac4:	e0661004 	rsb	r1, r6, r4
33f88ac8:	e3c22003 	bic	r2, r2, #3	; 0x3
33f88acc:	e0612002 	rsb	r2, r1, r2
33f88ad0:	e3823001 	orr	r3, r2, #1	; 0x1
33f88ad4:	e5843004 	str	r3, [r4, #4]
33f88ad8:	e0842002 	add	r2, r4, r2
33f88adc:	e5923004 	ldr	r3, [r2, #4]
33f88ae0:	e3833001 	orr	r3, r3, #1	; 0x1
33f88ae4:	e5823004 	str	r3, [r2, #4]
33f88ae8:	e5173004 	ldr	r3, [r7, #-4]
33f88aec:	e2033001 	and	r3, r3, #1	; 0x1
33f88af0:	e1833001 	orr	r3, r3, r1
33f88af4:	e5073004 	str	r3, [r7, #-4]
33f88af8:	e1a00007 	mov	r0, r7
33f88afc:	ebfffdb6 	bl	33f881dc <free>
33f88b00:	e1a06004 	mov	r6, r4
33f88b04:	e5963004 	ldr	r3, [r6, #4]
33f88b08:	e3c33003 	bic	r3, r3, #3	; 0x3
33f88b0c:	e06a3003 	rsb	r3, sl, r3
33f88b10:	e353000f 	cmp	r3, #15	; 0xf
33f88b14:	da000008 	ble	33f88b3c <memalign+0x100>
33f88b18:	e3833001 	orr	r3, r3, #1	; 0x1
33f88b1c:	e086000a 	add	r0, r6, sl
33f88b20:	e5803004 	str	r3, [r0, #4]
33f88b24:	e5963004 	ldr	r3, [r6, #4]
33f88b28:	e2033001 	and	r3, r3, #1	; 0x1
33f88b2c:	e183300a 	orr	r3, r3, sl
33f88b30:	e5863004 	str	r3, [r6, #4]
33f88b34:	e2800008 	add	r0, r0, #8	; 0x8
33f88b38:	ebfffda7 	bl	33f881dc <free>
33f88b3c:	e2860008 	add	r0, r6, #8	; 0x8
33f88b40:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f88b44:	e3a00000 	mov	r0, #0	; 0x0
33f88b48:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}

33f88b4c <pvalloc>:
33f88b4c:	e2801eff 	add	r1, r0, #4080	; 0xff0
33f88b50:	e281100f 	add	r1, r1, #15	; 0xf
33f88b54:	e3c11eff 	bic	r1, r1, #4080	; 0xff0
33f88b58:	e3c1100f 	bic	r1, r1, #15	; 0xf
33f88b5c:	e3a00a01 	mov	r0, #4096	; 0x1000
33f88b60:	eaffffb5 	b	33f88a3c <memalign>

33f88b64 <valloc>:
33f88b64:	e1a01000 	mov	r1, r0
33f88b68:	e3a00a01 	mov	r0, #4096	; 0x1000
33f88b6c:	eaffffb2 	b	33f88a3c <memalign>

33f88b70 <calloc>:
33f88b70:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f88b74:	e59f30d0 	ldr	r3, [pc, #208]	; 33f88c4c <.text+0x8c4c>
33f88b78:	e1a04000 	mov	r4, r0
33f88b7c:	e5937008 	ldr	r7, [r3, #8]
33f88b80:	e0000491 	mul	r0, r1, r4
33f88b84:	e5976004 	ldr	r6, [r7, #4]
33f88b88:	ebfffe26 	bl	33f88428 <malloc>
33f88b8c:	e3540000 	cmp	r4, #0	; 0x0
33f88b90:	e1a05000 	mov	r5, r0
33f88b94:	b3a05000 	movlt	r5, #0	; 0x0
33f88b98:	ba000029 	blt	33f88c44 <calloc+0xd4>
33f88b9c:	e3550000 	cmp	r5, #0	; 0x0
33f88ba0:	0a000027 	beq	33f88c44 <calloc+0xd4>
33f88ba4:	e5153004 	ldr	r3, [r5, #-4]
33f88ba8:	e3c61003 	bic	r1, r6, #3	; 0x3
33f88bac:	e3c33003 	bic	r3, r3, #3	; 0x3
33f88bb0:	e2452008 	sub	r2, r5, #8	; 0x8
33f88bb4:	e1520007 	cmp	r2, r7
33f88bb8:	13a02000 	movne	r2, #0	; 0x0
33f88bbc:	03a02001 	moveq	r2, #1	; 0x1
33f88bc0:	e1530001 	cmp	r3, r1
33f88bc4:	93a02000 	movls	r2, #0	; 0x0
33f88bc8:	e3520000 	cmp	r2, #0	; 0x0
33f88bcc:	11a03001 	movne	r3, r1
33f88bd0:	e2432004 	sub	r2, r3, #4	; 0x4
33f88bd4:	e3520024 	cmp	r2, #36	; 0x24
33f88bd8:	8a000017 	bhi	33f88c3c <calloc+0xcc>
33f88bdc:	e3520013 	cmp	r2, #19	; 0x13
33f88be0:	e1a01005 	mov	r1, r5
33f88be4:	9a00000e 	bls	33f88c24 <calloc+0xb4>
33f88be8:	e3a0c000 	mov	ip, #0	; 0x0
33f88bec:	e1a00005 	mov	r0, r5
33f88bf0:	e480c004 	str	ip, [r0], #4
33f88bf4:	e352001b 	cmp	r2, #27	; 0x1b
33f88bf8:	e585c004 	str	ip, [r5, #4]
33f88bfc:	e2801004 	add	r1, r0, #4	; 0x4
33f88c00:	9a000007 	bls	33f88c24 <calloc+0xb4>
33f88c04:	e2813004 	add	r3, r1, #4	; 0x4
33f88c08:	e3520024 	cmp	r2, #36	; 0x24
33f88c0c:	e580c004 	str	ip, [r0, #4]
33f88c10:	e581c004 	str	ip, [r1, #4]
33f88c14:	e2831004 	add	r1, r3, #4	; 0x4
33f88c18:	0583c004 	streq	ip, [r3, #4]
33f88c1c:	0581c004 	streq	ip, [r1, #4]
33f88c20:	02811008 	addeq	r1, r1, #8	; 0x8
33f88c24:	e3a02000 	mov	r2, #0	; 0x0
33f88c28:	e1a03001 	mov	r3, r1
33f88c2c:	e4832004 	str	r2, [r3], #4
33f88c30:	e5812004 	str	r2, [r1, #4]
33f88c34:	e5832004 	str	r2, [r3, #4]
33f88c38:	ea000001 	b	33f88c44 <calloc+0xd4>
33f88c3c:	e3a01000 	mov	r1, #0	; 0x0
33f88c40:	eb00078a 	bl	33f8aa70 <memset>
33f88c44:	e1a00005 	mov	r0, r5
33f88c48:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f88c4c:	33f956f4 	mvnccs	r5, #255852544	; 0xf400000

33f88c50 <realloc>:
33f88c50:	e3510000 	cmp	r1, #0	; 0x0
33f88c54:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f88c58:	e1a06000 	mov	r6, r0
33f88c5c:	b3a0a000 	movlt	sl, #0	; 0x0
33f88c60:	ba000115 	blt	33f890bc <realloc+0x46c>
33f88c64:	e3500000 	cmp	r0, #0	; 0x0
33f88c68:	1a000002 	bne	33f88c78 <realloc+0x28>
33f88c6c:	e1a00001 	mov	r0, r1
33f88c70:	e8bd4ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f88c74:	eafffdeb 	b	33f88428 <malloc>
33f88c78:	e5104004 	ldr	r4, [r0, #-4]
33f88c7c:	e281300b 	add	r3, r1, #11	; 0xb
33f88c80:	e3530016 	cmp	r3, #22	; 0x16
33f88c84:	e3c45003 	bic	r5, r4, #3	; 0x3
33f88c88:	d3a09010 	movle	r9, #16	; 0x10
33f88c8c:	c3c39007 	bicgt	r9, r3, #7	; 0x7
33f88c90:	e1550009 	cmp	r5, r9
33f88c94:	e2407008 	sub	r7, r0, #8	; 0x8
33f88c98:	a1a04007 	movge	r4, r7
33f88c9c:	a1a0a005 	movge	sl, r5
33f88ca0:	aa0000e6 	bge	33f89040 <realloc+0x3f0>
33f88ca4:	e59f3418 	ldr	r3, [pc, #1048]	; 33f890c4 <.text+0x90c4>
33f88ca8:	e593e008 	ldr	lr, [r3, #8]
33f88cac:	e087c005 	add	ip, r7, r5
33f88cb0:	e15c000e 	cmp	ip, lr
33f88cb4:	e59c2004 	ldr	r2, [ip, #4]
33f88cb8:	0a000005 	beq	33f88cd4 <realloc+0x84>
33f88cbc:	e3c23001 	bic	r3, r2, #1	; 0x1
33f88cc0:	e08c3003 	add	r3, ip, r3
33f88cc4:	e5933004 	ldr	r3, [r3, #4]
33f88cc8:	e3130001 	tst	r3, #1	; 0x1
33f88ccc:	0a0000f5 	beq	33f890a8 <realloc+0x458>
33f88cd0:	ea000016 	b	33f88d30 <realloc+0xe0>
33f88cd4:	e3c20003 	bic	r0, r2, #3	; 0x3
33f88cd8:	e0802005 	add	r2, r0, r5
33f88cdc:	e2893010 	add	r3, r9, #16	; 0x10
33f88ce0:	e1520003 	cmp	r2, r3
33f88ce4:	ba000013 	blt	33f88d38 <realloc+0xe8>
33f88ce8:	e0693002 	rsb	r3, r9, r2
33f88cec:	e3833001 	orr	r3, r3, #1	; 0x1
33f88cf0:	e0872009 	add	r2, r7, r9
33f88cf4:	e5823004 	str	r3, [r2, #4]
33f88cf8:	e5973004 	ldr	r3, [r7, #4]
33f88cfc:	e59f13c0 	ldr	r1, [pc, #960]	; 33f890c4 <.text+0x90c4>
33f88d00:	e2033001 	and	r3, r3, #1	; 0x1
33f88d04:	e1833009 	orr	r3, r3, r9
33f88d08:	e287a008 	add	sl, r7, #8	; 0x8
33f88d0c:	e5812008 	str	r2, [r1, #8]
33f88d10:	e5873004 	str	r3, [r7, #4]
33f88d14:	ea0000e8 	b	33f890bc <realloc+0x46c>
33f88d18:	e28c2008 	add	r2, ip, #8	; 0x8
33f88d1c:	e892000c 	ldmia	r2, {r2, r3}
33f88d20:	e1a04007 	mov	r4, r7
33f88d24:	e5832008 	str	r2, [r3, #8]
33f88d28:	e582300c 	str	r3, [r2, #12]
33f88d2c:	ea0000c3 	b	33f89040 <realloc+0x3f0>
33f88d30:	e3a00000 	mov	r0, #0	; 0x0
33f88d34:	e1a0c000 	mov	ip, r0
33f88d38:	e3140001 	tst	r4, #1	; 0x1
33f88d3c:	1a000082 	bne	33f88f4c <realloc+0x2fc>
33f88d40:	e5973000 	ldr	r3, [r7]
33f88d44:	e0634007 	rsb	r4, r3, r7
33f88d48:	e5943004 	ldr	r3, [r4, #4]
33f88d4c:	e35c0000 	cmp	ip, #0	; 0x0
33f88d50:	e3c32003 	bic	r2, r3, #3	; 0x3
33f88d54:	0a000049 	beq	33f88e80 <realloc+0x230>
33f88d58:	e15c000e 	cmp	ip, lr
33f88d5c:	e0853002 	add	r3, r5, r2
33f88d60:	1a00003f 	bne	33f88e64 <realloc+0x214>
33f88d64:	e080b003 	add	fp, r0, r3
33f88d68:	e2893010 	add	r3, r9, #16	; 0x10
33f88d6c:	e15b0003 	cmp	fp, r3
33f88d70:	ba000042 	blt	33f88e80 <realloc+0x230>
33f88d74:	e594200c 	ldr	r2, [r4, #12]
33f88d78:	e5943008 	ldr	r3, [r4, #8]
33f88d7c:	e245e004 	sub	lr, r5, #4	; 0x4
33f88d80:	e35e0024 	cmp	lr, #36	; 0x24
33f88d84:	e5823008 	str	r3, [r2, #8]
33f88d88:	e583200c 	str	r2, [r3, #12]
33f88d8c:	e284a008 	add	sl, r4, #8	; 0x8
33f88d90:	8a000024 	bhi	33f88e28 <realloc+0x1d8>
33f88d94:	e35e0013 	cmp	lr, #19	; 0x13
33f88d98:	e1a00006 	mov	r0, r6
33f88d9c:	e1a0c00a 	mov	ip, sl
33f88da0:	9a000017 	bls	33f88e04 <realloc+0x1b4>
33f88da4:	e1a02006 	mov	r2, r6
33f88da8:	e4923004 	ldr	r3, [r2], #4
33f88dac:	e5843008 	str	r3, [r4, #8]
33f88db0:	e5963004 	ldr	r3, [r6, #4]
33f88db4:	e35e001b 	cmp	lr, #27	; 0x1b
33f88db8:	e584300c 	str	r3, [r4, #12]
33f88dbc:	e284c010 	add	ip, r4, #16	; 0x10
33f88dc0:	e2820004 	add	r0, r2, #4	; 0x4
33f88dc4:	9a00000e 	bls	33f88e04 <realloc+0x1b4>
33f88dc8:	e5923004 	ldr	r3, [r2, #4]
33f88dcc:	e5843010 	str	r3, [r4, #16]
33f88dd0:	e5903004 	ldr	r3, [r0, #4]
33f88dd4:	e2802004 	add	r2, r0, #4	; 0x4
33f88dd8:	e35e0024 	cmp	lr, #36	; 0x24
33f88ddc:	e5843014 	str	r3, [r4, #20]
33f88de0:	e284c018 	add	ip, r4, #24	; 0x18
33f88de4:	e2820004 	add	r0, r2, #4	; 0x4
33f88de8:	1a000005 	bne	33f88e04 <realloc+0x1b4>
33f88dec:	e5923004 	ldr	r3, [r2, #4]
33f88df0:	e5843018 	str	r3, [r4, #24]
33f88df4:	e5903004 	ldr	r3, [r0, #4]
33f88df8:	e584301c 	str	r3, [r4, #28]
33f88dfc:	e2800008 	add	r0, r0, #8	; 0x8
33f88e00:	e284c020 	add	ip, r4, #32	; 0x20
33f88e04:	e1a01000 	mov	r1, r0
33f88e08:	e4913004 	ldr	r3, [r1], #4
33f88e0c:	e1a0200c 	mov	r2, ip
33f88e10:	e4823004 	str	r3, [r2], #4
33f88e14:	e5903004 	ldr	r3, [r0, #4]
33f88e18:	e58c3004 	str	r3, [ip, #4]
33f88e1c:	e5913004 	ldr	r3, [r1, #4]
33f88e20:	e5823004 	str	r3, [r2, #4]
33f88e24:	ea000003 	b	33f88e38 <realloc+0x1e8>
33f88e28:	e1a01006 	mov	r1, r6
33f88e2c:	e1a0200e 	mov	r2, lr
33f88e30:	e1a0000a 	mov	r0, sl
33f88e34:	eb00071f 	bl	33f8aab8 <memcpy>
33f88e38:	e069300b 	rsb	r3, r9, fp
33f88e3c:	e3833001 	orr	r3, r3, #1	; 0x1
33f88e40:	e0842009 	add	r2, r4, r9
33f88e44:	e5823004 	str	r3, [r2, #4]
33f88e48:	e5943004 	ldr	r3, [r4, #4]
33f88e4c:	e2033001 	and	r3, r3, #1	; 0x1
33f88e50:	e1833009 	orr	r3, r3, r9
33f88e54:	e5843004 	str	r3, [r4, #4]
33f88e58:	e59f3264 	ldr	r3, [pc, #612]	; 33f890c4 <.text+0x90c4>
33f88e5c:	e5832008 	str	r2, [r3, #8]
33f88e60:	ea000095 	b	33f890bc <realloc+0x46c>
33f88e64:	e080a003 	add	sl, r0, r3
33f88e68:	e15a0009 	cmp	sl, r9
33f88e6c:	a28c2008 	addge	r2, ip, #8	; 0x8
33f88e70:	a892000c 	ldmgeia	r2, {r2, r3}
33f88e74:	a5832008 	strge	r2, [r3, #8]
33f88e78:	a582300c 	strge	r3, [r2, #12]
33f88e7c:	aa000002 	bge	33f88e8c <realloc+0x23c>
33f88e80:	e082a005 	add	sl, r2, r5
33f88e84:	e15a0009 	cmp	sl, r9
33f88e88:	ba00002f 	blt	33f88f4c <realloc+0x2fc>
33f88e8c:	e594200c 	ldr	r2, [r4, #12]
33f88e90:	e5943008 	ldr	r3, [r4, #8]
33f88e94:	e245e004 	sub	lr, r5, #4	; 0x4
33f88e98:	e35e0024 	cmp	lr, #36	; 0x24
33f88e9c:	e5823008 	str	r3, [r2, #8]
33f88ea0:	e583200c 	str	r2, [r3, #12]
33f88ea4:	e2840008 	add	r0, r4, #8	; 0x8
33f88ea8:	8a000023 	bhi	33f88f3c <realloc+0x2ec>
33f88eac:	e35e0013 	cmp	lr, #19	; 0x13
33f88eb0:	e1a0c006 	mov	ip, r6
33f88eb4:	9a000017 	bls	33f88f18 <realloc+0x2c8>
33f88eb8:	e1a02006 	mov	r2, r6
33f88ebc:	e4923004 	ldr	r3, [r2], #4
33f88ec0:	e5843008 	str	r3, [r4, #8]
33f88ec4:	e5963004 	ldr	r3, [r6, #4]
33f88ec8:	e35e001b 	cmp	lr, #27	; 0x1b
33f88ecc:	e584300c 	str	r3, [r4, #12]
33f88ed0:	e2840010 	add	r0, r4, #16	; 0x10
33f88ed4:	e282c004 	add	ip, r2, #4	; 0x4
33f88ed8:	9a00000e 	bls	33f88f18 <realloc+0x2c8>
33f88edc:	e5923004 	ldr	r3, [r2, #4]
33f88ee0:	e5843010 	str	r3, [r4, #16]
33f88ee4:	e59c3004 	ldr	r3, [ip, #4]
33f88ee8:	e28c2004 	add	r2, ip, #4	; 0x4
33f88eec:	e35e0024 	cmp	lr, #36	; 0x24
33f88ef0:	e5843014 	str	r3, [r4, #20]
33f88ef4:	e2840018 	add	r0, r4, #24	; 0x18
33f88ef8:	e282c004 	add	ip, r2, #4	; 0x4
33f88efc:	1a000005 	bne	33f88f18 <realloc+0x2c8>
33f88f00:	e5923004 	ldr	r3, [r2, #4]
33f88f04:	e5843018 	str	r3, [r4, #24]
33f88f08:	e59c3004 	ldr	r3, [ip, #4]
33f88f0c:	e584301c 	str	r3, [r4, #28]
33f88f10:	e28cc008 	add	ip, ip, #8	; 0x8
33f88f14:	e2840020 	add	r0, r4, #32	; 0x20
33f88f18:	e1a0200c 	mov	r2, ip
33f88f1c:	e4923004 	ldr	r3, [r2], #4
33f88f20:	e1a01000 	mov	r1, r0
33f88f24:	e4813004 	str	r3, [r1], #4
33f88f28:	e59c3004 	ldr	r3, [ip, #4]
33f88f2c:	e5803004 	str	r3, [r0, #4]
33f88f30:	e5923004 	ldr	r3, [r2, #4]
33f88f34:	e5813004 	str	r3, [r1, #4]
33f88f38:	ea000040 	b	33f89040 <realloc+0x3f0>
33f88f3c:	e1a01006 	mov	r1, r6
33f88f40:	e1a0200e 	mov	r2, lr
33f88f44:	eb0006db 	bl	33f8aab8 <memcpy>
33f88f48:	ea00003c 	b	33f89040 <realloc+0x3f0>
33f88f4c:	e1a00001 	mov	r0, r1
33f88f50:	ebfffd34 	bl	33f88428 <malloc>
33f88f54:	e250a000 	subs	sl, r0, #0	; 0x0
33f88f58:	0a000057 	beq	33f890bc <realloc+0x46c>
33f88f5c:	e5973004 	ldr	r3, [r7, #4]
33f88f60:	e3c33001 	bic	r3, r3, #1	; 0x1
33f88f64:	e0873003 	add	r3, r7, r3
33f88f68:	e24a2008 	sub	r2, sl, #8	; 0x8
33f88f6c:	e1520003 	cmp	r2, r3
33f88f70:	051a3004 	ldreq	r3, [sl, #-4]
33f88f74:	03c33003 	biceq	r3, r3, #3	; 0x3
33f88f78:	0085a003 	addeq	sl, r5, r3
33f88f7c:	01a04007 	moveq	r4, r7
33f88f80:	0a00002e 	beq	33f89040 <realloc+0x3f0>
33f88f84:	e2452004 	sub	r2, r5, #4	; 0x4
33f88f88:	e3520024 	cmp	r2, #36	; 0x24
33f88f8c:	8a000026 	bhi	33f8902c <realloc+0x3dc>
33f88f90:	e3520013 	cmp	r2, #19	; 0x13
33f88f94:	e1a00006 	mov	r0, r6
33f88f98:	e1a0c00a 	mov	ip, sl
33f88f9c:	9a000019 	bls	33f89008 <realloc+0x3b8>
33f88fa0:	e1a0e006 	mov	lr, r6
33f88fa4:	e49e3004 	ldr	r3, [lr], #4
33f88fa8:	e1a0100a 	mov	r1, sl
33f88fac:	e4813004 	str	r3, [r1], #4
33f88fb0:	e5963004 	ldr	r3, [r6, #4]
33f88fb4:	e352001b 	cmp	r2, #27	; 0x1b
33f88fb8:	e58a3004 	str	r3, [sl, #4]
33f88fbc:	e281c004 	add	ip, r1, #4	; 0x4
33f88fc0:	e28e0004 	add	r0, lr, #4	; 0x4
33f88fc4:	9a00000f 	bls	33f89008 <realloc+0x3b8>
33f88fc8:	e59e3004 	ldr	r3, [lr, #4]
33f88fcc:	e5813004 	str	r3, [r1, #4]
33f88fd0:	e5903004 	ldr	r3, [r0, #4]
33f88fd4:	e3520024 	cmp	r2, #36	; 0x24
33f88fd8:	e28c1004 	add	r1, ip, #4	; 0x4
33f88fdc:	e2802004 	add	r2, r0, #4	; 0x4
33f88fe0:	e58c3004 	str	r3, [ip, #4]
33f88fe4:	e2820004 	add	r0, r2, #4	; 0x4
33f88fe8:	e281c004 	add	ip, r1, #4	; 0x4
33f88fec:	1a000005 	bne	33f89008 <realloc+0x3b8>
33f88ff0:	e5923004 	ldr	r3, [r2, #4]
33f88ff4:	e5813004 	str	r3, [r1, #4]
33f88ff8:	e5903004 	ldr	r3, [r0, #4]
33f88ffc:	e2800008 	add	r0, r0, #8	; 0x8
33f89000:	e58c3004 	str	r3, [ip, #4]
33f89004:	e28cc008 	add	ip, ip, #8	; 0x8
33f89008:	e1a01000 	mov	r1, r0
33f8900c:	e4913004 	ldr	r3, [r1], #4
33f89010:	e1a0200c 	mov	r2, ip
33f89014:	e4823004 	str	r3, [r2], #4
33f89018:	e5903004 	ldr	r3, [r0, #4]
33f8901c:	e58c3004 	str	r3, [ip, #4]
33f89020:	e5913004 	ldr	r3, [r1, #4]
33f89024:	e5823004 	str	r3, [r2, #4]
33f89028:	ea000001 	b	33f89034 <realloc+0x3e4>
33f8902c:	e1a01006 	mov	r1, r6
33f89030:	eb0006a0 	bl	33f8aab8 <memcpy>
33f89034:	e1a00006 	mov	r0, r6
33f89038:	ebfffc67 	bl	33f881dc <free>
33f8903c:	ea00001e 	b	33f890bc <realloc+0x46c>
33f89040:	e069100a 	rsb	r1, r9, sl
33f89044:	e351000f 	cmp	r1, #15	; 0xf
33f89048:	e5943004 	ldr	r3, [r4, #4]
33f8904c:	9a00000c 	bls	33f89084 <realloc+0x434>
33f89050:	e2033001 	and	r3, r3, #1	; 0x1
33f89054:	e0840009 	add	r0, r4, r9
33f89058:	e1833009 	orr	r3, r3, r9
33f8905c:	e3812001 	orr	r2, r1, #1	; 0x1
33f89060:	e5843004 	str	r3, [r4, #4]
33f89064:	e5802004 	str	r2, [r0, #4]
33f89068:	e0802001 	add	r2, r0, r1
33f8906c:	e5923004 	ldr	r3, [r2, #4]
33f89070:	e3833001 	orr	r3, r3, #1	; 0x1
33f89074:	e5823004 	str	r3, [r2, #4]
33f89078:	e2800008 	add	r0, r0, #8	; 0x8
33f8907c:	ebfffc56 	bl	33f881dc <free>
33f89080:	ea000006 	b	33f890a0 <realloc+0x450>
33f89084:	e2033001 	and	r3, r3, #1	; 0x1
33f89088:	e183300a 	orr	r3, r3, sl
33f8908c:	e5843004 	str	r3, [r4, #4]
33f89090:	e084200a 	add	r2, r4, sl
33f89094:	e5923004 	ldr	r3, [r2, #4]
33f89098:	e3833001 	orr	r3, r3, #1	; 0x1
33f8909c:	e5823004 	str	r3, [r2, #4]
33f890a0:	e284a008 	add	sl, r4, #8	; 0x8
33f890a4:	ea000004 	b	33f890bc <realloc+0x46c>
33f890a8:	e3c20003 	bic	r0, r2, #3	; 0x3
33f890ac:	e080a005 	add	sl, r0, r5
33f890b0:	e15a0009 	cmp	sl, r9
33f890b4:	aaffff17 	bge	33f88d18 <realloc+0xc8>
33f890b8:	eaffff1e 	b	33f88d38 <realloc+0xe8>
33f890bc:	e1a0000a 	mov	r0, sl
33f890c0:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f890c4:	33f956f4 	mvnccs	r5, #255852544	; 0xf400000

33f890c8 <env_get_char_memory>:
33f890c8:	e5983018 	ldr	r3, [r8, #24]
33f890cc:	e3530000 	cmp	r3, #0	; 0x0
33f890d0:	15983014 	ldrne	r3, [r8, #20]
33f890d4:	059f3008 	ldreq	r3, [pc, #8]	; 33f890e4 <.text+0x90e4>
33f890d8:	17d30000 	ldrneb	r0, [r3, r0]
33f890dc:	07d30000 	ldreqb	r0, [r3, r0]
33f890e0:	e1a0f00e 	mov	pc, lr
33f890e4:	33f95b04 	mvnccs	r5, #4096	; 0x1000

33f890e8 <env_get_addr>:
33f890e8:	e5983018 	ldr	r3, [r8, #24]
33f890ec:	e3530000 	cmp	r3, #0	; 0x0
33f890f0:	15983014 	ldrne	r3, [r8, #20]
33f890f4:	059f3008 	ldreq	r3, [pc, #8]	; 33f89104 <.text+0x9104>
33f890f8:	10830000 	addne	r0, r3, r0
33f890fc:	00800003 	addeq	r0, r0, r3
33f89100:	e1a0f00e 	mov	pc, lr
33f89104:	33f95b04 	mvnccs	r5, #4096	; 0x1000

33f89108 <env_get_char_init>:
33f89108:	e52de004 	str	lr, [sp, #-4]!
33f8910c:	e5983018 	ldr	r3, [r8, #24]
33f89110:	e3530000 	cmp	r3, #0	; 0x0
33f89114:	0a000001 	beq	33f89120 <env_get_char_init+0x18>
33f89118:	eb000036 	bl	33f891f8 <env_get_char_spec>
33f8911c:	e49df004 	ldr	pc, [sp], #4
33f89120:	e59f3004 	ldr	r3, [pc, #4]	; 33f8912c <.text+0x912c>
33f89124:	e7d30000 	ldrb	r0, [r3, r0]
33f89128:	e49df004 	ldr	pc, [sp], #4
33f8912c:	33f95b04 	mvnccs	r5, #4096	; 0x1000

33f89130 <env_crc_update>:
33f89130:	e92d4010 	stmdb	sp!, {r4, lr}
33f89134:	e59f3018 	ldr	r3, [pc, #24]	; 33f89154 <.text+0x9154>
33f89138:	e5934000 	ldr	r4, [r3]
33f8913c:	e3a00000 	mov	r0, #0	; 0x0
33f89140:	e2841004 	add	r1, r4, #4	; 0x4
33f89144:	e59f200c 	ldr	r2, [pc, #12]	; 33f89158 <.text+0x9158>
33f89148:	eb000506 	bl	33f8a568 <crc32>
33f8914c:	e5840000 	str	r0, [r4]
33f89150:	e8bd8010 	ldmia	sp!, {r4, pc}
33f89154:	33f965e8 	mvnccs	r6, #973078528	; 0x3a000000
33f89158:	00003ffc 	streqd	r3, [r0], -ip

33f8915c <env_relocate>:
33f8915c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f89160:	e3a00901 	mov	r0, #16384	; 0x4000
33f89164:	ebfffcaf 	bl	33f88428 <malloc>
33f89168:	e59f5074 	ldr	r5, [pc, #116]	; 33f891e4 <.text+0x91e4>
33f8916c:	e59f3074 	ldr	r3, [pc, #116]	; 33f891e8 <.text+0x91e8>
33f89170:	e59f2074 	ldr	r2, [pc, #116]	; 33f891ec <.text+0x91ec>
33f89174:	e5850000 	str	r0, [r5]
33f89178:	e5823000 	str	r3, [r2]
33f8917c:	e5984018 	ldr	r4, [r8, #24]
33f89180:	e3540000 	cmp	r4, #0	; 0x0
33f89184:	e59f0064 	ldr	r0, [pc, #100]	; 33f891f0 <.text+0x91f0>
33f89188:	1a00000f 	bne	33f891cc <env_relocate+0x70>
33f8918c:	ebfffaa0 	bl	33f87c14 <puts>
33f89190:	e3e00000 	mvn	r0, #0	; 0x0
33f89194:	eb001439 	bl	33f8e280 <show_boot_progress>
33f89198:	e1a01004 	mov	r1, r4
33f8919c:	e3a02901 	mov	r2, #16384	; 0x4000
33f891a0:	e5950000 	ldr	r0, [r5]
33f891a4:	eb000631 	bl	33f8aa70 <memset>
33f891a8:	e5950000 	ldr	r0, [r5]
33f891ac:	e59f1040 	ldr	r1, [pc, #64]	; 33f891f4 <.text+0x91f4>
33f891b0:	e3a020b9 	mov	r2, #185	; 0xb9
33f891b4:	e2800004 	add	r0, r0, #4	; 0x4
33f891b8:	eb00063e 	bl	33f8aab8 <memcpy>
33f891bc:	ebffffdb 	bl	33f89130 <env_crc_update>
33f891c0:	e3a03001 	mov	r3, #1	; 0x1
33f891c4:	e5883018 	str	r3, [r8, #24]
33f891c8:	ea000000 	b	33f891d0 <env_relocate+0x74>
33f891cc:	eb000036 	bl	33f892ac <env_relocate_spec>
33f891d0:	e59f300c 	ldr	r3, [pc, #12]	; 33f891e4 <.text+0x91e4>
33f891d4:	e5933000 	ldr	r3, [r3]
33f891d8:	e2833004 	add	r3, r3, #4	; 0x4
33f891dc:	e5883014 	str	r3, [r8, #20]
33f891e0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f891e4:	33f965e8 	mvnccs	r6, #973078528	; 0x3a000000
33f891e8:	33f890c8 	mvnccs	r9, #200	; 0xc8
33f891ec:	33f95b00 	mvnccs	r5, #0	; 0x0
33f891f0:	33f94b18 	mvnccs	r4, #24576	; 0x6000
33f891f4:	33f95b04 	mvnccs	r5, #4096	; 0x1000

33f891f8 <env_get_char_spec>:
33f891f8:	e5983014 	ldr	r3, [r8, #20]
33f891fc:	e7d30000 	ldrb	r0, [r3, r0]
33f89200:	e1a0f00e 	mov	pc, lr

33f89204 <env_init>:
33f89204:	e59f3010 	ldr	r3, [pc, #16]	; 33f8921c <.text+0x921c>
33f89208:	e3a00000 	mov	r0, #0	; 0x0
33f8920c:	e5883014 	str	r3, [r8, #20]
33f89210:	e3a03001 	mov	r3, #1	; 0x1
33f89214:	e5883018 	str	r3, [r8, #24]
33f89218:	e1a0f00e 	mov	pc, lr
33f8921c:	33f95b04 	mvnccs	r5, #4096	; 0x1000

33f89220 <use_default>:
33f89220:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f89224:	e59f5068 	ldr	r5, [pc, #104]	; 33f89294 <.text+0x9294>
33f89228:	e59f0068 	ldr	r0, [pc, #104]	; 33f89298 <.text+0x9298>
33f8922c:	ebfffa78 	bl	33f87c14 <puts>
33f89230:	e5953000 	ldr	r3, [r5]
33f89234:	e3a02901 	mov	r2, #16384	; 0x4000
33f89238:	e1530002 	cmp	r3, r2
33f8923c:	e59f4058 	ldr	r4, [pc, #88]	; 33f8929c <.text+0x929c>
33f89240:	e3a01000 	mov	r1, #0	; 0x0
33f89244:	e59f0054 	ldr	r0, [pc, #84]	; 33f892a0 <.text+0x92a0>
33f89248:	da000001 	ble	33f89254 <use_default+0x34>
33f8924c:	e8bd4030 	ldmia	sp!, {r4, r5, lr}
33f89250:	eafffa6f 	b	33f87c14 <puts>
33f89254:	e5940000 	ldr	r0, [r4]
33f89258:	eb000604 	bl	33f8aa70 <memset>
33f8925c:	e5940000 	ldr	r0, [r4]
33f89260:	e5952000 	ldr	r2, [r5]
33f89264:	e59f1038 	ldr	r1, [pc, #56]	; 33f892a4 <.text+0x92a4>
33f89268:	e2800004 	add	r0, r0, #4	; 0x4
33f8926c:	eb000611 	bl	33f8aab8 <memcpy>
33f89270:	e5944000 	ldr	r4, [r4]
33f89274:	e3a00000 	mov	r0, #0	; 0x0
33f89278:	e2841004 	add	r1, r4, #4	; 0x4
33f8927c:	e59f2024 	ldr	r2, [pc, #36]	; 33f892a8 <.text+0x92a8>
33f89280:	eb0004b8 	bl	33f8a568 <crc32>
33f89284:	e3a03001 	mov	r3, #1	; 0x1
33f89288:	e5840000 	str	r0, [r4]
33f8928c:	e5883018 	str	r3, [r8, #24]
33f89290:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f89294:	33f95bc0 	mvnccs	r5, #196608	; 0x30000
33f89298:	33f94b4c 	mvnccs	r4, #77824	; 0x13000
33f8929c:	33f965e8 	mvnccs	r6, #973078528	; 0x3a000000
33f892a0:	33f94b88 	mvnccs	r4, #139264	; 0x22000
33f892a4:	33f95b04 	mvnccs	r5, #4096	; 0x1000
33f892a8:	00003ffc 	streqd	r3, [r0], -ip

33f892ac <env_relocate_spec>:
33f892ac:	e92d4010 	stmdb	sp!, {r4, lr}
33f892b0:	e59f4064 	ldr	r4, [pc, #100]	; 33f8931c <.text+0x931c>
33f892b4:	e24dd00c 	sub	sp, sp, #12	; 0xc
33f892b8:	e28dc00c 	add	ip, sp, #12	; 0xc
33f892bc:	e3a03901 	mov	r3, #16384	; 0x4000
33f892c0:	e52c3004 	str	r3, [ip, #-4]!
33f892c4:	e594e000 	ldr	lr, [r4]
33f892c8:	e3a01003 	mov	r1, #3	; 0x3
33f892cc:	e3a02906 	mov	r2, #98304	; 0x18000
33f892d0:	e59f0048 	ldr	r0, [pc, #72]	; 33f89320 <.text+0x9320>
33f892d4:	e88d5000 	stmia	sp, {ip, lr}
33f892d8:	ebffe337 	bl	33f81fbc <nand_legacy_rw>
33f892dc:	e3500000 	cmp	r0, #0	; 0x0
33f892e0:	1a00000a 	bne	33f89310 <env_relocate_spec+0x64>
33f892e4:	e59d3008 	ldr	r3, [sp, #8]
33f892e8:	e3530901 	cmp	r3, #16384	; 0x4000
33f892ec:	e59f2030 	ldr	r2, [pc, #48]	; 33f89324 <.text+0x9324>
33f892f0:	1a000006 	bne	33f89310 <env_relocate_spec+0x64>
33f892f4:	e5941000 	ldr	r1, [r4]
33f892f8:	e2811004 	add	r1, r1, #4	; 0x4
33f892fc:	eb000499 	bl	33f8a568 <crc32>
33f89300:	e5943000 	ldr	r3, [r4]
33f89304:	e5933000 	ldr	r3, [r3]
33f89308:	e1500003 	cmp	r0, r3
33f8930c:	0a000000 	beq	33f89314 <env_relocate_spec+0x68>
33f89310:	ebffffc2 	bl	33f89220 <use_default>
33f89314:	e28dd00c 	add	sp, sp, #12	; 0xc
33f89318:	e8bd8010 	ldmia	sp!, {r4, pc}
33f8931c:	33f965e8 	mvnccs	r6, #973078528	; 0x3a000000
33f89320:	33f96264 	mvnccs	r6, #1073741830	; 0x40000006
33f89324:	00003ffc 	streqd	r3, [r0], -ip

33f89328 <saveenv>:
33f89328:	e92d4010 	stmdb	sp!, {r4, lr}
33f8932c:	e59f0080 	ldr	r0, [pc, #128]	; 33f893b4 <.text+0x93b4>
33f89330:	e24dd00c 	sub	sp, sp, #12	; 0xc
33f89334:	ebfffa36 	bl	33f87c14 <puts>
33f89338:	e3a01906 	mov	r1, #98304	; 0x18000
33f8933c:	e3a02901 	mov	r2, #16384	; 0x4000
33f89340:	e3a03000 	mov	r3, #0	; 0x0
33f89344:	e59f006c 	ldr	r0, [pc, #108]	; 33f893b8 <.text+0x93b8>
33f89348:	ebffe5f5 	bl	33f82b24 <nand_legacy_erase>
33f8934c:	e3500000 	cmp	r0, #0	; 0x0
33f89350:	e59f0064 	ldr	r0, [pc, #100]	; 33f893bc <.text+0x93bc>
33f89354:	1a000012 	bne	33f893a4 <saveenv+0x7c>
33f89358:	ebfffa2d 	bl	33f87c14 <puts>
33f8935c:	e59f205c 	ldr	r2, [pc, #92]	; 33f893c0 <.text+0x93c0>
33f89360:	e28dc00c 	add	ip, sp, #12	; 0xc
33f89364:	e3a03901 	mov	r3, #16384	; 0x4000
33f89368:	e592e000 	ldr	lr, [r2]
33f8936c:	e52c3004 	str	r3, [ip, #-4]!
33f89370:	e3a01002 	mov	r1, #2	; 0x2
33f89374:	e3a02906 	mov	r2, #98304	; 0x18000
33f89378:	e59f0038 	ldr	r0, [pc, #56]	; 33f893b8 <.text+0x93b8>
33f8937c:	e88d5000 	stmia	sp, {ip, lr}
33f89380:	ebffe30d 	bl	33f81fbc <nand_legacy_rw>
33f89384:	e2504000 	subs	r4, r0, #0	; 0x0
33f89388:	1a000005 	bne	33f893a4 <saveenv+0x7c>
33f8938c:	e59d3008 	ldr	r3, [sp, #8]
33f89390:	e3530901 	cmp	r3, #16384	; 0x4000
33f89394:	e59f0028 	ldr	r0, [pc, #40]	; 33f893c4 <.text+0x93c4>
33f89398:	1a000001 	bne	33f893a4 <saveenv+0x7c>
33f8939c:	ebfffa1c 	bl	33f87c14 <puts>
33f893a0:	ea000000 	b	33f893a8 <saveenv+0x80>
33f893a4:	e3a04001 	mov	r4, #1	; 0x1
33f893a8:	e1a00004 	mov	r0, r4
33f893ac:	e28dd00c 	add	sp, sp, #12	; 0xc
33f893b0:	e8bd8010 	ldmia	sp!, {r4, pc}
33f893b4:	33f94bb8 	mvnccs	r4, #188416	; 0x2e000
33f893b8:	33f96264 	mvnccs	r6, #1073741830	; 0x40000006
33f893bc:	33f94bc8 	mvnccs	r4, #204800	; 0x32000
33f893c0:	33f965e8 	mvnccs	r6, #973078528	; 0x3a000000
33f893c4:	33f94bdc 	mvnccs	r4, #225280	; 0x37000

33f893c8 <dummy>:
33f893c8:	e1a0f00e 	mov	pc, lr

33f893cc <get_version>:
33f893cc:	e3a00002 	mov	r0, #2	; 0x2
33f893d0:	e1a0f00e 	mov	pc, lr

33f893d4 <jumptable_init>:
33f893d4:	e92d4010 	stmdb	sp!, {r4, lr}
33f893d8:	e3a00038 	mov	r0, #56	; 0x38
33f893dc:	e1a04008 	mov	r4, r8
33f893e0:	ebfffc10 	bl	33f88428 <malloc>
33f893e4:	e5840020 	str	r0, [r4, #32]
33f893e8:	e3a01000 	mov	r1, #0	; 0x0
33f893ec:	e5982020 	ldr	r2, [r8, #32]
33f893f0:	e59f304c 	ldr	r3, [pc, #76]	; 33f89444 <.text+0x9444>
33f893f4:	e7823001 	str	r3, [r2, r1]
33f893f8:	e2811004 	add	r1, r1, #4	; 0x4
33f893fc:	e3510038 	cmp	r1, #56	; 0x38
33f89400:	1afffff9 	bne	33f893ec <jumptable_init+0x18>
33f89404:	e5982020 	ldr	r2, [r8, #32]
33f89408:	e59f3038 	ldr	r3, [pc, #56]	; 33f89448 <.text+0x9448>
33f8940c:	e5823000 	str	r3, [r2]
33f89410:	e59f3034 	ldr	r3, [pc, #52]	; 33f8944c <.text+0x944c>
33f89414:	e5982020 	ldr	r2, [r8, #32]
33f89418:	e5823020 	str	r3, [r2, #32]
33f8941c:	e59f302c 	ldr	r3, [pc, #44]	; 33f89450 <.text+0x9450>
33f89420:	e5982020 	ldr	r2, [r8, #32]
33f89424:	e5823024 	str	r3, [r2, #36]
33f89428:	e59f3024 	ldr	r3, [pc, #36]	; 33f89454 <.text+0x9454>
33f8942c:	e5982020 	ldr	r2, [r8, #32]
33f89430:	e582302c 	str	r3, [r2, #44]
33f89434:	e59f301c 	ldr	r3, [pc, #28]	; 33f89458 <.text+0x9458>
33f89438:	e5982020 	ldr	r2, [r8, #32]
33f8943c:	e5823028 	str	r3, [r2, #40]
33f89440:	e8bd8010 	ldmia	sp!, {r4, pc}
33f89444:	33f893c8 	mvnccs	r9, #536870915	; 0x20000003
33f89448:	33f893cc 	mvnccs	r9, #805306371	; 0x30000003
33f8944c:	33f88428 	mvnccs	r8, #671088640	; 0x28000000
33f89450:	33f881dc 	mvnccs	r8, #55	; 0x37
33f89454:	33f8088c 	mvnccs	r0, #9175040	; 0x8c0000
33f89458:	33f808a0 	mvnccs	r0, #10485760	; 0xa00000

33f8945c <GetHandleSize>:
33f8945c:	e5900004 	ldr	r0, [r0, #4]
33f89460:	e1a0f00e 	mov	pc, lr

33f89464 <ListSetAllocationPolicy>:
33f89464:	e5903000 	ldr	r3, [r0]
33f89468:	e5832004 	str	r2, [r3, #4]
33f8946c:	e5903000 	ldr	r3, [r0]
33f89470:	e5831008 	str	r1, [r3, #8]
33f89474:	e1a0f00e 	mov	pc, lr

33f89478 <ListGetPtrToItem>:
33f89478:	e3710001 	cmn	r1, #1	; 0x1
33f8947c:	02811002 	addeq	r1, r1, #2	; 0x2
33f89480:	0a000002 	beq	33f89490 <ListGetPtrToItem+0x18>
33f89484:	e3510000 	cmp	r1, #0	; 0x0
33f89488:	05903000 	ldreq	r3, [r0]
33f8948c:	05931014 	ldreq	r1, [r3, #20]
33f89490:	e5903000 	ldr	r3, [r0]
33f89494:	e5932010 	ldr	r2, [r3, #16]
33f89498:	e2411001 	sub	r1, r1, #1	; 0x1
33f8949c:	e2833018 	add	r3, r3, #24	; 0x18
33f894a0:	e0203192 	mla	r0, r2, r1, r3
33f894a4:	e1a0f00e 	mov	pc, lr

33f894a8 <ListGetDataPtr>:
33f894a8:	e5900000 	ldr	r0, [r0]
33f894ac:	e2800018 	add	r0, r0, #24	; 0x18
33f894b0:	e1a0f00e 	mov	pc, lr

33f894b4 <ListGetItemSize>:
33f894b4:	e5903000 	ldr	r3, [r0]
33f894b8:	e5930010 	ldr	r0, [r3, #16]
33f894bc:	e1a0f00e 	mov	pc, lr

33f894c0 <ListNumItems>:
33f894c0:	e5903000 	ldr	r3, [r0]
33f894c4:	e5930014 	ldr	r0, [r3, #20]
33f894c8:	e1a0f00e 	mov	pc, lr

33f894cc <ListGetItems>:
33f894cc:	e3720001 	cmn	r2, #1	; 0x1
33f894d0:	e52de004 	str	lr, [sp, #-4]!
33f894d4:	e1a0c001 	mov	ip, r1
33f894d8:	e1a0e003 	mov	lr, r3
33f894dc:	02822002 	addeq	r2, r2, #2	; 0x2
33f894e0:	0a000002 	beq	33f894f0 <ListGetItems+0x24>
33f894e4:	e3520000 	cmp	r2, #0	; 0x0
33f894e8:	05903000 	ldreq	r3, [r0]
33f894ec:	05932014 	ldreq	r2, [r3, #20]
33f894f0:	e5903000 	ldr	r3, [r0]
33f894f4:	e2421001 	sub	r1, r2, #1	; 0x1
33f894f8:	e5932010 	ldr	r2, [r3, #16]
33f894fc:	e2833018 	add	r3, r3, #24	; 0x18
33f89500:	e0213192 	mla	r1, r2, r1, r3
33f89504:	e002029e 	mul	r2, lr, r2
33f89508:	e1a0000c 	mov	r0, ip
33f8950c:	e49de004 	ldr	lr, [sp], #4
33f89510:	ea000568 	b	33f8aab8 <memcpy>

33f89514 <SetHandleSize>:
33f89514:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f89518:	e5905004 	ldr	r5, [r0, #4]
33f8951c:	e1550001 	cmp	r5, r1
33f89520:	e1a06000 	mov	r6, r0
33f89524:	e1a04001 	mov	r4, r1
33f89528:	e5903000 	ldr	r3, [r0]
33f8952c:	0a000018 	beq	33f89594 <SetHandleSize+0x80>
33f89530:	e3530000 	cmp	r3, #0	; 0x0
33f89534:	e1a00001 	mov	r0, r1
33f89538:	1a000001 	bne	33f89544 <SetHandleSize+0x30>
33f8953c:	ebfffbb9 	bl	33f88428 <malloc>
33f89540:	ea000001 	b	33f8954c <SetHandleSize+0x38>
33f89544:	e1a00003 	mov	r0, r3
33f89548:	ebfffdc0 	bl	33f88c50 <realloc>
33f8954c:	e2743001 	rsbs	r3, r4, #1	; 0x1
33f89550:	33a03000 	movcc	r3, #0	; 0x0
33f89554:	e3500000 	cmp	r0, #0	; 0x0
33f89558:	13833001 	orrne	r3, r3, #1	; 0x1
33f8955c:	e3530000 	cmp	r3, #0	; 0x0
33f89560:	e1a0c000 	mov	ip, r0
33f89564:	e1a00003 	mov	r0, r3
33f89568:	08bd8070 	ldmeqia	sp!, {r4, r5, r6, pc}
33f8956c:	e1540005 	cmp	r4, r5
33f89570:	e0652004 	rsb	r2, r5, r4
33f89574:	e08c0005 	add	r0, ip, r5
33f89578:	e3a01000 	mov	r1, #0	; 0x0
33f8957c:	e5864004 	str	r4, [r6, #4]
33f89580:	e586c000 	str	ip, [r6]
33f89584:	9a000002 	bls	33f89594 <SetHandleSize+0x80>
33f89588:	eb000538 	bl	33f8aa70 <memset>
33f8958c:	e3a00001 	mov	r0, #1	; 0x1
33f89590:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f89594:	e3a00001 	mov	r0, #1	; 0x1
33f89598:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

33f8959c <ListInsertItems>:
33f8959c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f895a0:	e5904000 	ldr	r4, [r0]
33f895a4:	e594a014 	ldr	sl, [r4, #20]
33f895a8:	e1a06002 	mov	r6, r2
33f895ac:	e28a2001 	add	r2, sl, #1	; 0x1
33f895b0:	e24dd004 	sub	sp, sp, #4	; 0x4
33f895b4:	e1560002 	cmp	r6, r2
33f895b8:	e1a0b000 	mov	fp, r0
33f895bc:	e58d1000 	str	r1, [sp]
33f895c0:	e1a09003 	mov	r9, r3
33f895c4:	03a06000 	moveq	r6, #0	; 0x0
33f895c8:	0a000001 	beq	33f895d4 <ListInsertItems+0x38>
33f895cc:	e156000a 	cmp	r6, sl
33f895d0:	ca00005f 	bgt	33f89754 <ListInsertItems+0x1b8>
33f895d4:	e594700c 	ldr	r7, [r4, #12]
33f895d8:	e15a0007 	cmp	sl, r7
33f895dc:	ba000022 	blt	33f8966c <ListInsertItems+0xd0>
33f895e0:	e2695000 	rsb	r5, r9, #0	; 0x0
33f895e4:	e3550000 	cmp	r5, #0	; 0x0
33f895e8:	1a000009 	bne	33f89614 <ListInsertItems+0x78>
33f895ec:	e5943004 	ldr	r3, [r4, #4]
33f895f0:	e2833064 	add	r3, r3, #100	; 0x64
33f895f4:	e0000793 	mul	r0, r3, r7
33f895f8:	e3a01064 	mov	r1, #100	; 0x64
33f895fc:	eb001e8c 	bl	33f91034 <__aeabi_idiv>
33f89600:	e5943008 	ldr	r3, [r4, #8]
33f89604:	e1500003 	cmp	r0, r3
33f89608:	a1a05000 	movge	r5, r0
33f8960c:	b1a05003 	movlt	r5, r3
33f89610:	ea000009 	b	33f8963c <ListInsertItems+0xa0>
33f89614:	aa000008 	bge	33f8963c <ListInsertItems+0xa0>
33f89618:	e5943004 	ldr	r3, [r4, #4]
33f8961c:	e2833064 	add	r3, r3, #100	; 0x64
33f89620:	e0000793 	mul	r0, r3, r7
33f89624:	e3a01064 	mov	r1, #100	; 0x64
33f89628:	eb001e81 	bl	33f91034 <__aeabi_idiv>
33f8962c:	e5943008 	ldr	r3, [r4, #8]
33f89630:	e1500003 	cmp	r0, r3
33f89634:	a0655000 	rsbge	r5, r5, r0
33f89638:	b0655003 	rsblt	r5, r5, r3
33f8963c:	e5943010 	ldr	r3, [r4, #16]
33f89640:	e0872005 	add	r2, r7, r5
33f89644:	e0010293 	mul	r1, r3, r2
33f89648:	e1a0000b 	mov	r0, fp
33f8964c:	e281101c 	add	r1, r1, #28	; 0x1c
33f89650:	ebffffaf 	bl	33f89514 <SetHandleSize>
33f89654:	e3500000 	cmp	r0, #0	; 0x0
33f89658:	0a00003d 	beq	33f89754 <ListInsertItems+0x1b8>
33f8965c:	e59b2000 	ldr	r2, [fp]
33f89660:	e592300c 	ldr	r3, [r2, #12]
33f89664:	e0833005 	add	r3, r3, r5
33f89668:	e582300c 	str	r3, [r2, #12]
33f8966c:	e3760001 	cmn	r6, #1	; 0x1
33f89670:	1a000002 	bne	33f89680 <ListInsertItems+0xe4>
33f89674:	e35a0000 	cmp	sl, #0	; 0x0
33f89678:	0a000002 	beq	33f89688 <ListInsertItems+0xec>
33f8967c:	ea000010 	b	33f896c4 <ListInsertItems+0x128>
33f89680:	e3560000 	cmp	r6, #0	; 0x0
33f89684:	1a00000f 	bne	33f896c8 <ListInsertItems+0x12c>
33f89688:	e59d3000 	ldr	r3, [sp]
33f8968c:	e3530000 	cmp	r3, #0	; 0x0
33f89690:	e59b3000 	ldr	r3, [fp]
33f89694:	0a000006 	beq	33f896b4 <ListInsertItems+0x118>
33f89698:	e5932010 	ldr	r2, [r3, #16]
33f8969c:	e2833018 	add	r3, r3, #24	; 0x18
33f896a0:	e020329a 	mla	r0, sl, r2, r3
33f896a4:	e59d1000 	ldr	r1, [sp]
33f896a8:	e0020299 	mul	r2, r9, r2
33f896ac:	eb000501 	bl	33f8aab8 <memcpy>
33f896b0:	ea000021 	b	33f8973c <ListInsertItems+0x1a0>
33f896b4:	e5932010 	ldr	r2, [r3, #16]
33f896b8:	e2833018 	add	r3, r3, #24	; 0x18
33f896bc:	e020329a 	mla	r0, sl, r2, r3
33f896c0:	ea00001a 	b	33f89730 <ListInsertItems+0x194>
33f896c4:	e3a06001 	mov	r6, #1	; 0x1
33f896c8:	e59b1000 	ldr	r1, [fp]
33f896cc:	e066200a 	rsb	r2, r6, sl
33f896d0:	e591c010 	ldr	ip, [r1, #16]
33f896d4:	e0863009 	add	r3, r6, r9
33f896d8:	e2433001 	sub	r3, r3, #1	; 0x1
33f896dc:	e2811018 	add	r1, r1, #24	; 0x18
33f896e0:	e2822001 	add	r2, r2, #1	; 0x1
33f896e4:	e2464001 	sub	r4, r6, #1	; 0x1
33f896e8:	e0201c93 	mla	r0, r3, ip, r1
33f896ec:	e002029c 	mul	r2, ip, r2
33f896f0:	e0211c94 	mla	r1, r4, ip, r1
33f896f4:	eb0004f7 	bl	33f8aad8 <memmove>
33f896f8:	e59d3000 	ldr	r3, [sp]
33f896fc:	e3530000 	cmp	r3, #0	; 0x0
33f89700:	e59b3000 	ldr	r3, [fp]
33f89704:	0a000006 	beq	33f89724 <ListInsertItems+0x188>
33f89708:	e5932010 	ldr	r2, [r3, #16]
33f8970c:	e2833018 	add	r3, r3, #24	; 0x18
33f89710:	e0203294 	mla	r0, r4, r2, r3
33f89714:	e59d1000 	ldr	r1, [sp]
33f89718:	e0020299 	mul	r2, r9, r2
33f8971c:	eb0004ed 	bl	33f8aad8 <memmove>
33f89720:	ea000005 	b	33f8973c <ListInsertItems+0x1a0>
33f89724:	e5932010 	ldr	r2, [r3, #16]
33f89728:	e2833018 	add	r3, r3, #24	; 0x18
33f8972c:	e0203294 	mla	r0, r4, r2, r3
33f89730:	e59d1000 	ldr	r1, [sp]
33f89734:	e0020299 	mul	r2, r9, r2
33f89738:	eb0004cc 	bl	33f8aa70 <memset>
33f8973c:	e59b2000 	ldr	r2, [fp]
33f89740:	e5923014 	ldr	r3, [r2, #20]
33f89744:	e3a00001 	mov	r0, #1	; 0x1
33f89748:	e0833009 	add	r3, r3, r9
33f8974c:	e5823014 	str	r3, [r2, #20]
33f89750:	ea000000 	b	33f89758 <ListInsertItems+0x1bc>
33f89754:	e3a00000 	mov	r0, #0	; 0x0
33f89758:	e28dd004 	add	sp, sp, #4	; 0x4
33f8975c:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}

33f89760 <ListInsertItem>:
33f89760:	e3a03001 	mov	r3, #1	; 0x1
33f89764:	eaffff8c 	b	33f8959c <ListInsertItems>

33f89768 <DisposeHandle>:
33f89768:	e92d4010 	stmdb	sp!, {r4, lr}
33f8976c:	e2504000 	subs	r4, r0, #0	; 0x0
33f89770:	08bd8010 	ldmeqia	sp!, {r4, pc}
33f89774:	e5940000 	ldr	r0, [r4]
33f89778:	ebfffa97 	bl	33f881dc <free>
33f8977c:	e1a00004 	mov	r0, r4
33f89780:	e8bd4010 	ldmia	sp!, {r4, lr}
33f89784:	eafffa94 	b	33f881dc <free>

33f89788 <ListDispose>:
33f89788:	eafffff6 	b	33f89768 <DisposeHandle>

33f8978c <NewHandle>:
33f8978c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f89790:	e1a06000 	mov	r6, r0
33f89794:	ebfffb23 	bl	33f88428 <malloc>
33f89798:	e1a05000 	mov	r5, r0
33f8979c:	e3a00008 	mov	r0, #8	; 0x8
33f897a0:	ebfffb20 	bl	33f88428 <malloc>
33f897a4:	e2504000 	subs	r4, r0, #0	; 0x0
33f897a8:	e1a00005 	mov	r0, r5
33f897ac:	0a000008 	beq	33f897d4 <NewHandle+0x48>
33f897b0:	e2763001 	rsbs	r3, r6, #1	; 0x1
33f897b4:	33a03000 	movcc	r3, #0	; 0x0
33f897b8:	e3550000 	cmp	r5, #0	; 0x0
33f897bc:	13833001 	orrne	r3, r3, #1	; 0x1
33f897c0:	e3530000 	cmp	r3, #0	; 0x0
33f897c4:	15845000 	strne	r5, [r4]
33f897c8:	e1a03004 	mov	r3, r4
33f897cc:	15846004 	strne	r6, [r4, #4]
33f897d0:	1a000003 	bne	33f897e4 <NewHandle+0x58>
33f897d4:	ebfffa80 	bl	33f881dc <free>
33f897d8:	e1a00004 	mov	r0, r4
33f897dc:	ebfffa7e 	bl	33f881dc <free>
33f897e0:	e3a03000 	mov	r3, #0	; 0x0
33f897e4:	e1a00003 	mov	r0, r3
33f897e8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

33f897ec <ListCreate>:
33f897ec:	e92d4010 	stmdb	sp!, {r4, lr}
33f897f0:	e1a04000 	mov	r4, r0
33f897f4:	e3a0001c 	mov	r0, #28	; 0x1c
33f897f8:	ebffffe3 	bl	33f8978c <NewHandle>
33f897fc:	e2501000 	subs	r1, r0, #0	; 0x0
33f89800:	e3a0c000 	mov	ip, #0	; 0x0
33f89804:	08bd8010 	ldmeqia	sp!, {r4, pc}
33f89808:	e5912000 	ldr	r2, [r1]
33f8980c:	e59f3034 	ldr	r3, [pc, #52]	; 33f89848 <.text+0x9848>
33f89810:	e5823000 	str	r3, [r2]
33f89814:	e5913000 	ldr	r3, [r1]
33f89818:	e583c014 	str	ip, [r3, #20]
33f8981c:	e5913000 	ldr	r3, [r1]
33f89820:	e583c00c 	str	ip, [r3, #12]
33f89824:	e5913000 	ldr	r3, [r1]
33f89828:	e5834010 	str	r4, [r3, #16]
33f8982c:	e5912000 	ldr	r2, [r1]
33f89830:	e3a0300a 	mov	r3, #10	; 0xa
33f89834:	e5823004 	str	r3, [r2, #4]
33f89838:	e5912000 	ldr	r2, [r1]
33f8983c:	e3a03004 	mov	r3, #4	; 0x4
33f89840:	e5823008 	str	r3, [r2, #8]
33f89844:	e8bd8010 	ldmia	sp!, {r4, pc}
33f89848:	4c495354 	mcrrmi	3, 5, r5, r9, cr4

33f8984c <hex1_bin>:
33f8984c:	e20010ff 	and	r1, r0, #255	; 0xff
33f89850:	e2412030 	sub	r2, r1, #48	; 0x30
33f89854:	e20230ff 	and	r3, r2, #255	; 0xff
33f89858:	e3530009 	cmp	r3, #9	; 0x9
33f8985c:	e241c061 	sub	ip, r1, #97	; 0x61
33f89860:	e1a00002 	mov	r0, r2
33f89864:	91a0f00e 	movls	pc, lr
33f89868:	e35c0005 	cmp	ip, #5	; 0x5
33f8986c:	e2413041 	sub	r3, r1, #65	; 0x41
33f89870:	e2410057 	sub	r0, r1, #87	; 0x57
33f89874:	91a0f00e 	movls	pc, lr
33f89878:	e3530005 	cmp	r3, #5	; 0x5
33f8987c:	e3e00000 	mvn	r0, #0	; 0x0
33f89880:	92410037 	subls	r0, r1, #55	; 0x37
33f89884:	e1a0f00e 	mov	pc, lr

33f89888 <hex2_bin>:
33f89888:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f8988c:	e1a04000 	mov	r4, r0
33f89890:	e5d00000 	ldrb	r0, [r0]
33f89894:	ebffffec 	bl	33f8984c <hex1_bin>
33f89898:	e2505000 	subs	r5, r0, #0	; 0x0
33f8989c:	ba000004 	blt	33f898b4 <hex2_bin+0x2c>
33f898a0:	e5d40001 	ldrb	r0, [r4, #1]
33f898a4:	ebffffe8 	bl	33f8984c <hex1_bin>
33f898a8:	e3500000 	cmp	r0, #0	; 0x0
33f898ac:	e0800205 	add	r0, r0, r5, lsl #4
33f898b0:	a8bd8030 	ldmgeia	sp!, {r4, r5, pc}
33f898b4:	e3e00000 	mvn	r0, #0	; 0x0
33f898b8:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

33f898bc <srec_decode>:
33f898bc:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f898c0:	e1a0a001 	mov	sl, r1
33f898c4:	e24dd004 	sub	sp, sp, #4	; 0x4
33f898c8:	e1a07002 	mov	r7, r2
33f898cc:	e58d3000 	str	r3, [sp]
33f898d0:	ea000006 	b	33f898f0 <srec_decode+0x34>
33f898d4:	e3530053 	cmp	r3, #83	; 0x53
33f898d8:	1a000003 	bne	33f898ec <srec_decode+0x30>
33f898dc:	e5d05001 	ldrb	r5, [r0, #1]
33f898e0:	e3550000 	cmp	r5, #0	; 0x0
33f898e4:	0a000074 	beq	33f89abc <.text+0x9abc>
33f898e8:	ea000005 	b	33f89904 <srec_decode+0x48>
33f898ec:	e1a00004 	mov	r0, r4
33f898f0:	e5d03000 	ldrb	r3, [r0]
33f898f4:	e3530000 	cmp	r3, #0	; 0x0
33f898f8:	e2804001 	add	r4, r0, #1	; 0x1
33f898fc:	1afffff4 	bne	33f898d4 <srec_decode+0x18>
33f89900:	ea00006d 	b	33f89abc <.text+0x9abc>
33f89904:	e2840001 	add	r0, r4, #1	; 0x1
33f89908:	ebffffde 	bl	33f89888 <hex2_bin>
33f8990c:	e3500000 	cmp	r0, #0	; 0x0
33f89910:	e58a0000 	str	r0, [sl]
33f89914:	ba00006a 	blt	33f89ac4 <.text+0x9ac4>
33f89918:	e2453030 	sub	r3, r5, #48	; 0x30
33f8991c:	e2844003 	add	r4, r4, #3	; 0x3
33f89920:	e200b0ff 	and	fp, r0, #255	; 0xff
33f89924:	e3530009 	cmp	r3, #9	; 0x9
33f89928:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f8992c:	ea000009 	b	33f89958 <.text+0x9958>
33f89930:	33f89960 	mvnccs	r9, #1572864	; 0x180000
33f89934:	33f8996c 	mvnccs	r9, #1769472	; 0x1b0000
33f89938:	33f8997c 	mvnccs	r9, #2031616	; 0x1f0000
33f8993c:	33f89988 	mvnccs	r9, #2228224	; 0x220000
33f89940:	33f89958 	mvnccs	r9, #1441792	; 0x160000
33f89944:	33f89994 	mvnccs	r9, #2424832	; 0x250000
33f89948:	33f89958 	mvnccs	r9, #1441792	; 0x160000
33f8994c:	33f899a0 	mvnccs	r9, #2621440	; 0x280000
33f89950:	33f899ac 	mvnccs	r9, #2818048	; 0x2b0000
33f89954:	33f899c4 	mvnccs	r9, #3211264	; 0x310000
33f89958:	e3e09000 	mvn	r9, #0	; 0x0
33f8995c:	ea000062 	b	33f89aec <.text+0x9aec>
33f89960:	e2403003 	sub	r3, r0, #3	; 0x3
33f89964:	e3a09000 	mov	r9, #0	; 0x0
33f89968:	ea000001 	b	33f89974 <.text+0x9974>
33f8996c:	e2403003 	sub	r3, r0, #3	; 0x3
33f89970:	e3a09001 	mov	r9, #1	; 0x1
33f89974:	e58a3000 	str	r3, [sl]
33f89978:	ea000014 	b	33f899d0 <.text+0x99d0>
33f8997c:	e2403004 	sub	r3, r0, #4	; 0x4
33f89980:	e3a09002 	mov	r9, #2	; 0x2
33f89984:	ea00000a 	b	33f899b4 <.text+0x99b4>
33f89988:	e2403005 	sub	r3, r0, #5	; 0x5
33f8998c:	e3a09003 	mov	r9, #3	; 0x3
33f89990:	ea00004d 	b	33f89acc <.text+0x9acc>
33f89994:	e3a09005 	mov	r9, #5	; 0x5
33f89998:	e3a03000 	mov	r3, #0	; 0x0
33f8999c:	eafffff4 	b	33f89974 <.text+0x9974>
33f899a0:	e2403005 	sub	r3, r0, #5	; 0x5
33f899a4:	e3a09007 	mov	r9, #7	; 0x7
33f899a8:	ea000047 	b	33f89acc <.text+0x9acc>
33f899ac:	e2403004 	sub	r3, r0, #4	; 0x4
33f899b0:	e3a09008 	mov	r9, #8	; 0x8
33f899b4:	e58a3000 	str	r3, [sl]
33f899b8:	e3a03000 	mov	r3, #0	; 0x0
33f899bc:	e5873000 	str	r3, [r7]
33f899c0:	ea000009 	b	33f899ec <.text+0x99ec>
33f899c4:	e2403003 	sub	r3, r0, #3	; 0x3
33f899c8:	e58a3000 	str	r3, [sl]
33f899cc:	e3a09009 	mov	r9, #9	; 0x9
33f899d0:	e3a03000 	mov	r3, #0	; 0x0
33f899d4:	e5873000 	str	r3, [r7]
33f899d8:	ea00000d 	b	33f89a14 <.text+0x9a14>
33f899dc:	e08b3000 	add	r3, fp, r0
33f899e0:	e5870000 	str	r0, [r7]
33f899e4:	e203b0ff 	and	fp, r3, #255	; 0xff
33f899e8:	e2844002 	add	r4, r4, #2	; 0x2
33f899ec:	e1a00004 	mov	r0, r4
33f899f0:	ebffffa4 	bl	33f89888 <hex2_bin>
33f899f4:	e3500000 	cmp	r0, #0	; 0x0
33f899f8:	ba000031 	blt	33f89ac4 <.text+0x9ac4>
33f899fc:	e5973000 	ldr	r3, [r7]
33f89a00:	e0803403 	add	r3, r0, r3, lsl #8
33f89a04:	e08b2000 	add	r2, fp, r0
33f89a08:	e5873000 	str	r3, [r7]
33f89a0c:	e202b0ff 	and	fp, r2, #255	; 0xff
33f89a10:	e2844002 	add	r4, r4, #2	; 0x2
33f89a14:	e1a00004 	mov	r0, r4
33f89a18:	ebffff9a 	bl	33f89888 <hex2_bin>
33f89a1c:	e2505000 	subs	r5, r0, #0	; 0x0
33f89a20:	ba000027 	blt	33f89ac4 <.text+0x9ac4>
33f89a24:	e5973000 	ldr	r3, [r7]
33f89a28:	e2846002 	add	r6, r4, #2	; 0x2
33f89a2c:	e0854403 	add	r4, r5, r3, lsl #8
33f89a30:	e5874000 	str	r4, [r7]
33f89a34:	e1a00006 	mov	r0, r6
33f89a38:	ebffff92 	bl	33f89888 <hex2_bin>
33f89a3c:	e3500000 	cmp	r0, #0	; 0x0
33f89a40:	ba00001f 	blt	33f89ac4 <.text+0x9ac4>
33f89a44:	e0803005 	add	r3, r0, r5
33f89a48:	e083300b 	add	r3, r3, fp
33f89a4c:	e0802404 	add	r2, r0, r4, lsl #8
33f89a50:	e20350ff 	and	r5, r3, #255	; 0xff
33f89a54:	e2864002 	add	r4, r6, #2	; 0x2
33f89a58:	e3a06000 	mov	r6, #0	; 0x0
33f89a5c:	e5872000 	str	r2, [r7]
33f89a60:	ea000008 	b	33f89a88 <.text+0x9a88>
33f89a64:	ebffff87 	bl	33f89888 <hex2_bin>
33f89a68:	e3500000 	cmp	r0, #0	; 0x0
33f89a6c:	e0853000 	add	r3, r5, r0
33f89a70:	e20350ff 	and	r5, r3, #255	; 0xff
33f89a74:	e2844002 	add	r4, r4, #2	; 0x2
33f89a78:	ba000011 	blt	33f89ac4 <.text+0x9ac4>
33f89a7c:	e59d3000 	ldr	r3, [sp]
33f89a80:	e7c60003 	strb	r0, [r6, r3]
33f89a84:	e2866001 	add	r6, r6, #1	; 0x1
33f89a88:	e59a3000 	ldr	r3, [sl]
33f89a8c:	e1560003 	cmp	r6, r3
33f89a90:	e1a00004 	mov	r0, r4
33f89a94:	bafffff2 	blt	33f89a64 <.text+0x9a64>
33f89a98:	ebffff7a 	bl	33f89888 <hex2_bin>
33f89a9c:	e3500000 	cmp	r0, #0	; 0x0
33f89aa0:	ba000007 	blt	33f89ac4 <.text+0x9ac4>
33f89aa4:	e1e03005 	mvn	r3, r5
33f89aa8:	e20020ff 	and	r2, r0, #255	; 0xff
33f89aac:	e20330ff 	and	r3, r3, #255	; 0xff
33f89ab0:	e1520003 	cmp	r2, r3
33f89ab4:	13e09002 	mvnne	r9, #2	; 0x2
33f89ab8:	ea00000b 	b	33f89aec <.text+0x9aec>
33f89abc:	e3a0900a 	mov	r9, #10	; 0xa
33f89ac0:	ea000009 	b	33f89aec <.text+0x9aec>
33f89ac4:	e3e09001 	mvn	r9, #1	; 0x1
33f89ac8:	ea000007 	b	33f89aec <.text+0x9aec>
33f89acc:	e58a3000 	str	r3, [sl]
33f89ad0:	e3a03000 	mov	r3, #0	; 0x0
33f89ad4:	e5873000 	str	r3, [r7]
33f89ad8:	e1a00004 	mov	r0, r4
33f89adc:	ebffff69 	bl	33f89888 <hex2_bin>
33f89ae0:	e3500000 	cmp	r0, #0	; 0x0
33f89ae4:	aaffffbc 	bge	33f899dc <.text+0x99dc>
33f89ae8:	eafffff5 	b	33f89ac4 <.text+0x9ac4>
33f89aec:	e1a00009 	mov	r0, r9
33f89af0:	e28dd004 	add	sp, sp, #4	; 0x4
33f89af4:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}

33f89af8 <parse_num>:
33f89af8:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f89afc:	e1a09001 	mov	r9, r1
33f89b00:	e1a0a002 	mov	sl, r2
33f89b04:	e1a07003 	mov	r7, r3
33f89b08:	ea000000 	b	33f89b10 <parse_num+0x18>
33f89b0c:	e2800001 	add	r0, r0, #1	; 0x1
33f89b10:	e5d03000 	ldrb	r3, [r0]
33f89b14:	e3530020 	cmp	r3, #32	; 0x20
33f89b18:	0afffffb 	beq	33f89b0c <parse_num+0x14>
33f89b1c:	ea00003a 	b	33f89c0c <parse_num+0x114>
33f89b20:	e3530000 	cmp	r3, #0	; 0x0
33f89b24:	0a00000d 	beq	33f89b60 <parse_num+0x68>
33f89b28:	e35c0030 	cmp	ip, #48	; 0x30
33f89b2c:	1a00000b 	bne	33f89b60 <parse_num+0x68>
33f89b30:	e5d02001 	ldrb	r2, [r0, #1]
33f89b34:	e2423041 	sub	r3, r2, #65	; 0x41
33f89b38:	e3530019 	cmp	r3, #25	; 0x19
33f89b3c:	92823020 	addls	r3, r2, #32	; 0x20
33f89b40:	920320ff 	andls	r2, r3, #255	; 0xff
33f89b44:	e3520078 	cmp	r2, #120	; 0x78
33f89b48:	11a0400c 	movne	r4, ip
33f89b4c:	e2801001 	add	r1, r0, #1	; 0x1
33f89b50:	11a0c004 	movne	ip, r4
33f89b54:	1a000013 	bne	33f89ba8 <parse_num+0xb0>
33f89b58:	e2800002 	add	r0, r0, #2	; 0x2
33f89b5c:	e3a06010 	mov	r6, #16	; 0x10
33f89b60:	e4d04001 	ldrb	r4, [r0], #1
33f89b64:	e204c0ff 	and	ip, r4, #255	; 0xff
33f89b68:	e24c3030 	sub	r3, ip, #48	; 0x30
33f89b6c:	e24c2041 	sub	r2, ip, #65	; 0x41
33f89b70:	e3530009 	cmp	r3, #9	; 0x9
33f89b74:	83a0e000 	movhi	lr, #0	; 0x0
33f89b78:	93a0e001 	movls	lr, #1	; 0x1
33f89b7c:	e3520005 	cmp	r2, #5	; 0x5
33f89b80:	83a02000 	movhi	r2, #0	; 0x0
33f89b84:	93a02001 	movls	r2, #1	; 0x1
33f89b88:	e19e3002 	orrs	r3, lr, r2
33f89b8c:	e1a01000 	mov	r1, r0
33f89b90:	1a000002 	bne	33f89ba0 <parse_num+0xa8>
33f89b94:	e24c3061 	sub	r3, ip, #97	; 0x61
33f89b98:	e3530005 	cmp	r3, #5	; 0x5
33f89b9c:	8a00000f 	bhi	33f89be0 <parse_num+0xe8>
33f89ba0:	e35e0000 	cmp	lr, #0	; 0x0
33f89ba4:	0a000001 	beq	33f89bb0 <parse_num+0xb8>
33f89ba8:	e24c2030 	sub	r2, ip, #48	; 0x30
33f89bac:	ea000006 	b	33f89bcc <parse_num+0xd4>
33f89bb0:	e24c3061 	sub	r3, ip, #97	; 0x61
33f89bb4:	e20330ff 	and	r3, r3, #255	; 0xff
33f89bb8:	e3530005 	cmp	r3, #5	; 0x5
33f89bbc:	924c2057 	subls	r2, ip, #87	; 0x57
33f89bc0:	9a000001 	bls	33f89bcc <parse_num+0xd4>
33f89bc4:	e3520000 	cmp	r2, #0	; 0x0
33f89bc8:	124c2037 	subne	r2, ip, #55	; 0x37
33f89bcc:	e1520006 	cmp	r2, r6
33f89bd0:	b0252596 	mlalt	r5, r6, r5, r2
33f89bd4:	b1a00001 	movlt	r0, r1
33f89bd8:	b3a03000 	movlt	r3, #0	; 0x0
33f89bdc:	ba00000d 	blt	33f89c18 <parse_num+0x120>
33f89be0:	e3570000 	cmp	r7, #0	; 0x0
33f89be4:	0a000014 	beq	33f89c3c <parse_num+0x144>
33f89be8:	e1a03007 	mov	r3, r7
33f89bec:	e5d32000 	ldrb	r2, [r3]
33f89bf0:	e3520000 	cmp	r2, #0	; 0x0
33f89bf4:	e2833001 	add	r3, r3, #1	; 0x1
33f89bf8:	0a00000f 	beq	33f89c3c <parse_num+0x144>
33f89bfc:	e1540002 	cmp	r4, r2
33f89c00:	1afffff9 	bne	33f89bec <parse_num+0xf4>
33f89c04:	e1a00001 	mov	r0, r1
33f89c08:	ea000005 	b	33f89c24 <parse_num+0x12c>
33f89c0c:	e3a03001 	mov	r3, #1	; 0x1
33f89c10:	e3a0600a 	mov	r6, #10	; 0xa
33f89c14:	e3a05000 	mov	r5, #0	; 0x0
33f89c18:	e5d0c000 	ldrb	ip, [r0]
33f89c1c:	e35c0000 	cmp	ip, #0	; 0x0
33f89c20:	1affffbe 	bne	33f89b20 <parse_num+0x28>
33f89c24:	e35a0000 	cmp	sl, #0	; 0x0
33f89c28:	03a03001 	moveq	r3, #1	; 0x1
33f89c2c:	13a03001 	movne	r3, #1	; 0x1
33f89c30:	e5895000 	str	r5, [r9]
33f89c34:	158a0000 	strne	r0, [sl]
33f89c38:	ea000000 	b	33f89c40 <parse_num+0x148>
33f89c3c:	e3a03000 	mov	r3, #0	; 0x0
33f89c40:	e1a00003 	mov	r0, r3
33f89c44:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}

33f89c48 <xyzModem_error>:
33f89c48:	e2800008 	add	r0, r0, #8	; 0x8
33f89c4c:	e3500007 	cmp	r0, #7	; 0x7
33f89c50:	979ff100 	ldrls	pc, [pc, r0, lsl #2]
33f89c54:	ea000009 	b	33f89c80 <.text+0x9c80>
33f89c58:	33f89c78 	mvnccs	r9, #30720	; 0x7800
33f89c5c:	33f89cb8 	mvnccs	r9, #47104	; 0xb800
33f89c60:	33f89cb0 	mvnccs	r9, #45056	; 0xb000
33f89c64:	33f89ca8 	mvnccs	r9, #43008	; 0xa800
33f89c68:	33f89ca0 	mvnccs	r9, #40960	; 0xa000
33f89c6c:	33f89c98 	mvnccs	r9, #38912	; 0x9800
33f89c70:	33f89c90 	mvnccs	r9, #36864	; 0x9000
33f89c74:	33f89c88 	mvnccs	r9, #34816	; 0x8800
33f89c78:	e59f0040 	ldr	r0, [pc, #64]	; 33f89cc0 <.text+0x9cc0>
33f89c7c:	e1a0f00e 	mov	pc, lr
33f89c80:	e59f003c 	ldr	r0, [pc, #60]	; 33f89cc4 <.text+0x9cc4>
33f89c84:	e1a0f00e 	mov	pc, lr
33f89c88:	e59f0038 	ldr	r0, [pc, #56]	; 33f89cc8 <.text+0x9cc8>
33f89c8c:	e1a0f00e 	mov	pc, lr
33f89c90:	e59f0034 	ldr	r0, [pc, #52]	; 33f89ccc <.text+0x9ccc>
33f89c94:	e1a0f00e 	mov	pc, lr
33f89c98:	e59f0030 	ldr	r0, [pc, #48]	; 33f89cd0 <.text+0x9cd0>
33f89c9c:	e1a0f00e 	mov	pc, lr
33f89ca0:	e59f002c 	ldr	r0, [pc, #44]	; 33f89cd4 <.text+0x9cd4>
33f89ca4:	e1a0f00e 	mov	pc, lr
33f89ca8:	e59f0028 	ldr	r0, [pc, #40]	; 33f89cd8 <.text+0x9cd8>
33f89cac:	e1a0f00e 	mov	pc, lr
33f89cb0:	e59f0024 	ldr	r0, [pc, #36]	; 33f89cdc <.text+0x9cdc>
33f89cb4:	e1a0f00e 	mov	pc, lr
33f89cb8:	e59f0020 	ldr	r0, [pc, #32]	; 33f89ce0 <.text+0x9ce0>
33f89cbc:	e1a0f00e 	mov	pc, lr
33f89cc0:	33f94bec 	mvnccs	r4, #241664	; 0x3b000
33f89cc4:	33f94c04 	mvnccs	r4, #1024	; 0x400
33f89cc8:	33f94c14 	mvnccs	r4, #5120	; 0x1400
33f89ccc:	33f94c28 	mvnccs	r4, #10240	; 0x2800
33f89cd0:	33f94c48 	mvnccs	r4, #18432	; 0x4800
33f89cd4:	33f94c54 	mvnccs	r4, #21504	; 0x5400
33f89cd8:	33f94c60 	mvnccs	r4, #24576	; 0x6000
33f89cdc:	33f94c6c 	mvnccs	r4, #27648	; 0x6c00
33f89ce0:	33f94c7c 	mvnccs	r4, #31744	; 0x7c00

33f89ce4 <xyzModem_stream_close>:
33f89ce4:	e52de004 	str	lr, [sp, #-4]!
33f89ce8:	e59f2038 	ldr	r2, [pc, #56]	; 33f89d28 <.text+0x9d28>
33f89cec:	e5920428 	ldr	r0, [r2, #1064]
33f89cf0:	e59f3034 	ldr	r3, [pc, #52]	; 33f89d2c <.text+0x9d2c>
33f89cf4:	e592c424 	ldr	ip, [r2, #1060]
33f89cf8:	e592e418 	ldr	lr, [r2, #1048]
33f89cfc:	e3500000 	cmp	r0, #0	; 0x0
33f89d00:	e24dd008 	sub	sp, sp, #8	; 0x8
33f89d04:	e59f1024 	ldr	r1, [pc, #36]	; 33f89d30 <.text+0x9d30>
33f89d08:	e59f0024 	ldr	r0, [pc, #36]	; 33f89d34 <.text+0x9d34>
33f89d0c:	01a01003 	moveq	r1, r3
33f89d10:	e5923420 	ldr	r3, [r2, #1056]
33f89d14:	e592241c 	ldr	r2, [r2, #1052]
33f89d18:	e88d5000 	stmia	sp, {ip, lr}
33f89d1c:	ebfff7cf 	bl	33f87c60 <printf>
33f89d20:	e28dd008 	add	sp, sp, #8	; 0x8
33f89d24:	e8bd8000 	ldmia	sp!, {pc}
33f89d28:	33f96734 	mvnccs	r6, #13631488	; 0xd00000
33f89d2c:	33f94c94 	mvnccs	r4, #37888	; 0x9400
33f89d30:	33f94c90 	mvnccs	r4, #36864	; 0x9000
33f89d34:	33f94c9c 	mvnccs	r4, #39936	; 0x9c00

33f89d38 <CYGACC_COMM_IF_PUTC>:
33f89d38:	e20110ff 	and	r1, r1, #255	; 0xff
33f89d3c:	e1a00001 	mov	r0, r1
33f89d40:	eafff84c 	b	33f87e78 <putc>

33f89d44 <CYGACC_COMM_IF_GETC_TIMEOUT>:
33f89d44:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f89d48:	e1a05001 	mov	r5, r1
33f89d4c:	e3a04000 	mov	r4, #0	; 0x0
33f89d50:	ea000000 	b	33f89d58 <CYGACC_COMM_IF_GETC_TIMEOUT+0x14>
33f89d54:	ebffdad1 	bl	33f808a0 <udelay>
33f89d58:	ebfff850 	bl	33f87ea0 <tstc>
33f89d5c:	e3500000 	cmp	r0, #0	; 0x0
33f89d60:	e3a00014 	mov	r0, #20	; 0x14
33f89d64:	1a000003 	bne	33f89d78 <CYGACC_COMM_IF_GETC_TIMEOUT+0x34>
33f89d68:	e59f3024 	ldr	r3, [pc, #36]	; 33f89d94 <.text+0x9d94>
33f89d6c:	e1540003 	cmp	r4, r3
33f89d70:	e2844001 	add	r4, r4, #1	; 0x1
33f89d74:	1afffff6 	bne	33f89d54 <CYGACC_COMM_IF_GETC_TIMEOUT+0x10>
33f89d78:	ebfff848 	bl	33f87ea0 <tstc>
33f89d7c:	e3500000 	cmp	r0, #0	; 0x0
33f89d80:	08bd8030 	ldmeqia	sp!, {r4, r5, pc}
33f89d84:	ebfff84b 	bl	33f87eb8 <getc>
33f89d88:	e5c50000 	strb	r0, [r5]
33f89d8c:	e3a00001 	mov	r0, #1	; 0x1
33f89d90:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f89d94:	000186a0 	andeq	r8, r1, r0, lsr #13

33f89d98 <xyzModem_flush>:
33f89d98:	e52de004 	str	lr, [sp, #-4]!
33f89d9c:	e24dd004 	sub	sp, sp, #4	; 0x4
33f89da0:	e59f301c 	ldr	r3, [pc, #28]	; 33f89dc4 <.text+0x9dc4>
33f89da4:	e5933000 	ldr	r3, [r3]
33f89da8:	e28d1003 	add	r1, sp, #3	; 0x3
33f89dac:	e5d30000 	ldrb	r0, [r3]
33f89db0:	ebffffe3 	bl	33f89d44 <CYGACC_COMM_IF_GETC_TIMEOUT>
33f89db4:	e3500000 	cmp	r0, #0	; 0x0
33f89db8:	1afffff8 	bne	33f89da0 <xyzModem_flush+0x8>
33f89dbc:	e28dd004 	add	sp, sp, #4	; 0x4
33f89dc0:	e8bd8000 	ldmia	sp!, {pc}
33f89dc4:	33f96734 	mvnccs	r6, #13631488	; 0xd00000

33f89dc8 <xyzModem_stream_terminate>:
33f89dc8:	e3500000 	cmp	r0, #0	; 0x0
33f89dcc:	e92d4010 	stmdb	sp!, {r4, lr}
33f89dd0:	e1a04001 	mov	r4, r1
33f89dd4:	0a000028 	beq	33f89e7c <xyzModem_stream_terminate+0xb4>
33f89dd8:	e59f40b8 	ldr	r4, [pc, #184]	; 33f89e98 <.text+0x9e98>
33f89ddc:	e5943414 	ldr	r3, [r4, #1044]
33f89de0:	e2433001 	sub	r3, r3, #1	; 0x1
33f89de4:	e3530001 	cmp	r3, #1	; 0x1
33f89de8:	88bd8010 	ldmhiia	sp!, {r4, pc}
33f89dec:	e5943000 	ldr	r3, [r4]
33f89df0:	e3a01018 	mov	r1, #24	; 0x18
33f89df4:	e5d30000 	ldrb	r0, [r3]
33f89df8:	ebffffce 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89dfc:	e5943000 	ldr	r3, [r4]
33f89e00:	e3a01018 	mov	r1, #24	; 0x18
33f89e04:	e5d30000 	ldrb	r0, [r3]
33f89e08:	ebffffca 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89e0c:	e5943000 	ldr	r3, [r4]
33f89e10:	e3a01018 	mov	r1, #24	; 0x18
33f89e14:	e5d30000 	ldrb	r0, [r3]
33f89e18:	ebffffc6 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89e1c:	e5943000 	ldr	r3, [r4]
33f89e20:	e3a01018 	mov	r1, #24	; 0x18
33f89e24:	e5d30000 	ldrb	r0, [r3]
33f89e28:	ebffffc2 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89e2c:	e5943000 	ldr	r3, [r4]
33f89e30:	e3a01008 	mov	r1, #8	; 0x8
33f89e34:	e5d30000 	ldrb	r0, [r3]
33f89e38:	ebffffbe 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89e3c:	e5943000 	ldr	r3, [r4]
33f89e40:	e3a01008 	mov	r1, #8	; 0x8
33f89e44:	e5d30000 	ldrb	r0, [r3]
33f89e48:	ebffffba 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89e4c:	e5943000 	ldr	r3, [r4]
33f89e50:	e3a01008 	mov	r1, #8	; 0x8
33f89e54:	e5d30000 	ldrb	r0, [r3]
33f89e58:	ebffffb6 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89e5c:	e5943000 	ldr	r3, [r4]
33f89e60:	e3a01008 	mov	r1, #8	; 0x8
33f89e64:	e5d30000 	ldrb	r0, [r3]
33f89e68:	ebffffb2 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89e6c:	ebffffc9 	bl	33f89d98 <xyzModem_flush>
33f89e70:	e3a03001 	mov	r3, #1	; 0x1
33f89e74:	e584342c 	str	r3, [r4, #1068]
33f89e78:	e8bd8010 	ldmia	sp!, {r4, pc}
33f89e7c:	e1a0e00f 	mov	lr, pc
33f89e80:	e1a0f004 	mov	pc, r4
33f89e84:	e3500000 	cmp	r0, #0	; 0x0
33f89e88:	aafffffb 	bge	33f89e7c <xyzModem_stream_terminate+0xb4>
33f89e8c:	e59f0008 	ldr	r0, [pc, #8]	; 33f89e9c <.text+0x9e9c>
33f89e90:	e8bd4010 	ldmia	sp!, {r4, lr}
33f89e94:	eaffda81 	b	33f808a0 <udelay>
33f89e98:	33f96734 	mvnccs	r6, #13631488	; 0xd00000
33f89e9c:	0003d090 	muleq	r3, r0, r0

33f89ea0 <xyzModem_get_hdr>:
33f89ea0:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f89ea4:	e59f4270 	ldr	r4, [pc, #624]	; 33f8a11c <.text+0xa11c>
33f89ea8:	e5943430 	ldr	r3, [r4, #1072]
33f89eac:	e3530000 	cmp	r3, #0	; 0x0
33f89eb0:	e24dd004 	sub	sp, sp, #4	; 0x4
33f89eb4:	0a000005 	beq	33f89ed0 <xyzModem_get_hdr+0x30>
33f89eb8:	e5943000 	ldr	r3, [r4]
33f89ebc:	e3a01006 	mov	r1, #6	; 0x6
33f89ec0:	e5d30000 	ldrb	r0, [r3]
33f89ec4:	ebffff9b 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89ec8:	e3a03000 	mov	r3, #0	; 0x0
33f89ecc:	e5843430 	str	r3, [r4, #1072]
33f89ed0:	e3a05000 	mov	r5, #0	; 0x0
33f89ed4:	e1a06005 	mov	r6, r5
33f89ed8:	e59f423c 	ldr	r4, [pc, #572]	; 33f8a11c <.text+0xa11c>
33f89edc:	e5943000 	ldr	r3, [r4]
33f89ee0:	e28d1003 	add	r1, sp, #3	; 0x3
33f89ee4:	e5d30000 	ldrb	r0, [r3]
33f89ee8:	ebffff95 	bl	33f89d44 <CYGACC_COMM_IF_GETC_TIMEOUT>
33f89eec:	e3500000 	cmp	r0, #0	; 0x0
33f89ef0:	0a000024 	beq	33f89f88 <xyzModem_get_hdr+0xe8>
33f89ef4:	e5dd3003 	ldrb	r3, [sp, #3]
33f89ef8:	e3530002 	cmp	r3, #2	; 0x2
33f89efc:	e2855001 	add	r5, r5, #1	; 0x1
33f89f00:	0a00000c 	beq	33f89f38 <xyzModem_get_hdr+0x98>
33f89f04:	8a000002 	bhi	33f89f14 <xyzModem_get_hdr+0x74>
33f89f08:	e3530001 	cmp	r3, #1	; 0x1
33f89f0c:	1afffff1 	bne	33f89ed8 <xyzModem_get_hdr+0x38>
33f89f10:	ea000004 	b	33f89f28 <xyzModem_get_hdr+0x88>
33f89f14:	e3530004 	cmp	r3, #4	; 0x4
33f89f18:	0a000012 	beq	33f89f68 <xyzModem_get_hdr+0xc8>
33f89f1c:	e3530018 	cmp	r3, #24	; 0x18
33f89f20:	1affffec 	bne	33f89ed8 <xyzModem_get_hdr+0x38>
33f89f24:	ea000007 	b	33f89f48 <xyzModem_get_hdr+0xa8>
33f89f28:	e594341c 	ldr	r3, [r4, #1052]
33f89f2c:	e2833001 	add	r3, r3, #1	; 0x1
33f89f30:	e584341c 	str	r3, [r4, #1052]
33f89f34:	ea00006e 	b	33f8a0f4 <xyzModem_get_hdr+0x254>
33f89f38:	e5943420 	ldr	r3, [r4, #1056]
33f89f3c:	e2833001 	add	r3, r3, #1	; 0x1
33f89f40:	e5843420 	str	r3, [r4, #1056]
33f89f44:	ea00006a 	b	33f8a0f4 <xyzModem_get_hdr+0x254>
33f89f48:	e5943424 	ldr	r3, [r4, #1060]
33f89f4c:	e2866001 	add	r6, r6, #1	; 0x1
33f89f50:	e2833001 	add	r3, r3, #1	; 0x1
33f89f54:	e3560003 	cmp	r6, #3	; 0x3
33f89f58:	e5843424 	str	r3, [r4, #1060]
33f89f5c:	1affffdd 	bne	33f89ed8 <xyzModem_get_hdr+0x38>
33f89f60:	e3e00004 	mvn	r0, #4	; 0x4
33f89f64:	ea00006a 	b	33f8a114 <xyzModem_get_hdr+0x274>
33f89f68:	e3550001 	cmp	r5, #1	; 0x1
33f89f6c:	1affffd9 	bne	33f89ed8 <xyzModem_get_hdr+0x38>
33f89f70:	e5943000 	ldr	r3, [r4]
33f89f74:	e3a01006 	mov	r1, #6	; 0x6
33f89f78:	e5d30000 	ldrb	r0, [r3]
33f89f7c:	ebffff6d 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f89f80:	e3e00003 	mvn	r0, #3	; 0x3
33f89f84:	ea000062 	b	33f8a114 <xyzModem_get_hdr+0x274>
33f89f88:	ebffff82 	bl	33f89d98 <xyzModem_flush>
33f89f8c:	e59f018c 	ldr	r0, [pc, #396]	; 33f8a120 <.text+0xa120>
33f89f90:	ebffda42 	bl	33f808a0 <udelay>
33f89f94:	ea000052 	b	33f8a0e4 <xyzModem_get_hdr+0x244>
33f89f98:	e59f417c 	ldr	r4, [pc, #380]	; 33f8a11c <.text+0xa11c>
33f89f9c:	e5943000 	ldr	r3, [r4]
33f89fa0:	e59f117c 	ldr	r1, [pc, #380]	; 33f8a124 <.text+0xa124>
33f89fa4:	e5d30000 	ldrb	r0, [r3]
33f89fa8:	ebffff65 	bl	33f89d44 <CYGACC_COMM_IF_GETC_TIMEOUT>
33f89fac:	e3500000 	cmp	r0, #0	; 0x0
33f89fb0:	0a00004b 	beq	33f8a0e4 <xyzModem_get_hdr+0x244>
33f89fb4:	e5dd3003 	ldrb	r3, [sp, #3]
33f89fb8:	e2842004 	add	r2, r4, #4	; 0x4
33f89fbc:	e3530001 	cmp	r3, #1	; 0x1
33f89fc0:	13a03b01 	movne	r3, #1024	; 0x400
33f89fc4:	03a03080 	moveq	r3, #128	; 0x80
33f89fc8:	e1a06002 	mov	r6, r2
33f89fcc:	e3a05000 	mov	r5, #0	; 0x0
33f89fd0:	e5843410 	str	r3, [r4, #1040]
33f89fd4:	e5842404 	str	r2, [r4, #1028]
33f89fd8:	ea000005 	b	33f89ff4 <xyzModem_get_hdr+0x154>
33f89fdc:	e5d30000 	ldrb	r0, [r3]
33f89fe0:	ebffff57 	bl	33f89d44 <CYGACC_COMM_IF_GETC_TIMEOUT>
33f89fe4:	e3500000 	cmp	r0, #0	; 0x0
33f89fe8:	0a00003d 	beq	33f8a0e4 <xyzModem_get_hdr+0x244>
33f89fec:	e5dd3003 	ldrb	r3, [sp, #3]
33f89ff0:	e5463001 	strb	r3, [r6, #-1]
33f89ff4:	e59f4120 	ldr	r4, [pc, #288]	; 33f8a11c <.text+0xa11c>
33f89ff8:	e5943410 	ldr	r3, [r4, #1040]
33f89ffc:	e1550003 	cmp	r5, r3
33f8a000:	e28d1003 	add	r1, sp, #3	; 0x3
33f8a004:	e2855001 	add	r5, r5, #1	; 0x1
33f8a008:	e2866001 	add	r6, r6, #1	; 0x1
33f8a00c:	e5943000 	ldr	r3, [r4]
33f8a010:	bafffff1 	blt	33f89fdc <xyzModem_get_hdr+0x13c>
33f8a014:	e5d30000 	ldrb	r0, [r3]
33f8a018:	e59f1108 	ldr	r1, [pc, #264]	; 33f8a128 <.text+0xa128>
33f8a01c:	ebffff48 	bl	33f89d44 <CYGACC_COMM_IF_GETC_TIMEOUT>
33f8a020:	e3500000 	cmp	r0, #0	; 0x0
33f8a024:	0a00002e 	beq	33f8a0e4 <xyzModem_get_hdr+0x244>
33f8a028:	e5943428 	ldr	r3, [r4, #1064]
33f8a02c:	e3530000 	cmp	r3, #0	; 0x0
33f8a030:	0a000005 	beq	33f8a04c <xyzModem_get_hdr+0x1ac>
33f8a034:	e5943000 	ldr	r3, [r4]
33f8a038:	e59f10ec 	ldr	r1, [pc, #236]	; 33f8a12c <.text+0xa12c>
33f8a03c:	e5d30000 	ldrb	r0, [r3]
33f8a040:	ebffff3f 	bl	33f89d44 <CYGACC_COMM_IF_GETC_TIMEOUT>
33f8a044:	e3500000 	cmp	r0, #0	; 0x0
33f8a048:	0a000025 	beq	33f8a0e4 <xyzModem_get_hdr+0x244>
33f8a04c:	e5d43408 	ldrb	r3, [r4, #1032]
33f8a050:	e5d42409 	ldrb	r2, [r4, #1033]
33f8a054:	e0233002 	eor	r3, r3, r2
33f8a058:	e35300ff 	cmp	r3, #255	; 0xff
33f8a05c:	0a000002 	beq	33f8a06c <xyzModem_get_hdr+0x1cc>
33f8a060:	ebffff4c 	bl	33f89d98 <xyzModem_flush>
33f8a064:	e3e00005 	mvn	r0, #5	; 0x5
33f8a068:	ea000029 	b	33f8a114 <xyzModem_get_hdr+0x274>
33f8a06c:	e5943428 	ldr	r3, [r4, #1064]
33f8a070:	e3530000 	cmp	r3, #0	; 0x0
33f8a074:	0594c410 	ldreq	ip, [r4, #1040]
33f8a078:	01a01003 	moveq	r1, r3
33f8a07c:	02840004 	addeq	r0, r4, #4	; 0x4
33f8a080:	01a02003 	moveq	r2, r3
33f8a084:	0a00000b 	beq	33f8a0b8 <xyzModem_get_hdr+0x218>
33f8a088:	e2840004 	add	r0, r4, #4	; 0x4
33f8a08c:	e5941410 	ldr	r1, [r4, #1040]
33f8a090:	eb000122 	bl	33f8a520 <cyg_crc16>
33f8a094:	e5d4340b 	ldrb	r3, [r4, #1035]
33f8a098:	e5d4240a 	ldrb	r2, [r4, #1034]
33f8a09c:	e1833402 	orr	r3, r3, r2, lsl #8
33f8a0a0:	e1500003 	cmp	r0, r3
33f8a0a4:	ea00000b 	b	33f8a0d8 <xyzModem_get_hdr+0x238>
33f8a0a8:	e5503001 	ldrb	r3, [r0, #-1]
33f8a0ac:	e0813003 	add	r3, r1, r3
33f8a0b0:	e1a03803 	mov	r3, r3, lsl #16
33f8a0b4:	e1a01823 	mov	r1, r3, lsr #16
33f8a0b8:	e152000c 	cmp	r2, ip
33f8a0bc:	e2800001 	add	r0, r0, #1	; 0x1
33f8a0c0:	e2822001 	add	r2, r2, #1	; 0x1
33f8a0c4:	bafffff7 	blt	33f8a0a8 <xyzModem_get_hdr+0x208>
33f8a0c8:	e59f304c 	ldr	r3, [pc, #76]	; 33f8a11c <.text+0xa11c>
33f8a0cc:	e5d3240a 	ldrb	r2, [r3, #1034]
33f8a0d0:	e20130ff 	and	r3, r1, #255	; 0xff
33f8a0d4:	e1520003 	cmp	r2, r3
33f8a0d8:	03a00000 	moveq	r0, #0	; 0x0
33f8a0dc:	0a00000c 	beq	33f8a114 <xyzModem_get_hdr+0x274>
33f8a0e0:	ea000001 	b	33f8a0ec <xyzModem_get_hdr+0x24c>
33f8a0e4:	e3e00002 	mvn	r0, #2	; 0x2
33f8a0e8:	ea000009 	b	33f8a114 <xyzModem_get_hdr+0x274>
33f8a0ec:	e3e00006 	mvn	r0, #6	; 0x6
33f8a0f0:	ea000007 	b	33f8a114 <xyzModem_get_hdr+0x274>
33f8a0f4:	e59f3020 	ldr	r3, [pc, #32]	; 33f8a11c <.text+0xa11c>
33f8a0f8:	e5933000 	ldr	r3, [r3]
33f8a0fc:	e59f102c 	ldr	r1, [pc, #44]	; 33f8a130 <.text+0xa130>
33f8a100:	e5d30000 	ldrb	r0, [r3]
33f8a104:	ebffff0e 	bl	33f89d44 <CYGACC_COMM_IF_GETC_TIMEOUT>
33f8a108:	e3500000 	cmp	r0, #0	; 0x0
33f8a10c:	0afffff4 	beq	33f8a0e4 <xyzModem_get_hdr+0x244>
33f8a110:	eaffffa0 	b	33f89f98 <xyzModem_get_hdr+0xf8>
33f8a114:	e28dd004 	add	sp, sp, #4	; 0x4
33f8a118:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8a11c:	33f96734 	mvnccs	r6, #13631488	; 0xd00000
33f8a120:	0003d090 	muleq	r3, r0, r0
33f8a124:	33f96b3d 	mvnccs	r6, #62464	; 0xf400
33f8a128:	33f96b3e 	mvnccs	r6, #63488	; 0xf800
33f8a12c:	33f96b3f 	mvnccs	r6, #64512	; 0xfc00
33f8a130:	33f96b3c 	mvnccs	r6, #61440	; 0xf000

33f8a134 <xyzModem_stream_read>:
33f8a134:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8a138:	e1a0a000 	mov	sl, r0
33f8a13c:	e1a07001 	mov	r7, r1
33f8a140:	e1a0b002 	mov	fp, r2
33f8a144:	e3a09000 	mov	r9, #0	; 0x0
33f8a148:	ea000091 	b	33f8a394 <xyzModem_stream_read+0x260>
33f8a14c:	e5923410 	ldr	r3, [r2, #1040]
33f8a150:	e3530000 	cmp	r3, #0	; 0x0
33f8a154:	1a00007a 	bne	33f8a344 <xyzModem_stream_read+0x210>
33f8a158:	e3a06013 	mov	r6, #19	; 0x13
33f8a15c:	ebffff4f 	bl	33f89ea0 <xyzModem_get_hdr>
33f8a160:	e59f4254 	ldr	r4, [pc, #596]	; 33f8a3bc <.text+0xa3bc>
33f8a164:	e2505000 	subs	r5, r0, #0	; 0x0
33f8a168:	e1a0c004 	mov	ip, r4
33f8a16c:	1a000041 	bne	33f8a278 <xyzModem_stream_read+0x144>
33f8a170:	e5d4240c 	ldrb	r2, [r4, #1036]
33f8a174:	e5d40408 	ldrb	r0, [r4, #1032]
33f8a178:	e2423001 	sub	r3, r2, #1	; 0x1
33f8a17c:	e1500002 	cmp	r0, r2
33f8a180:	e3a01006 	mov	r1, #6	; 0x6
33f8a184:	e20330ff 	and	r3, r3, #255	; 0xff
33f8a188:	1a000033 	bne	33f8a25c <xyzModem_stream_read+0x128>
33f8a18c:	e5943414 	ldr	r3, [r4, #1044]
33f8a190:	e2802001 	add	r2, r0, #1	; 0x1
33f8a194:	e3530001 	cmp	r3, #1	; 0x1
33f8a198:	e3a03001 	mov	r3, #1	; 0x1
33f8a19c:	e5843430 	str	r3, [r4, #1072]
33f8a1a0:	e5c4240c 	strb	r2, [r4, #1036]
33f8a1a4:	0a000002 	beq	33f8a1b4 <xyzModem_stream_read+0x80>
33f8a1a8:	e5943434 	ldr	r3, [r4, #1076]
33f8a1ac:	e3530000 	cmp	r3, #0	; 0x0
33f8a1b0:	1a00001e 	bne	33f8a230 <xyzModem_stream_read+0xfc>
33f8a1b4:	e59c3410 	ldr	r3, [ip, #1040]
33f8a1b8:	e59c2404 	ldr	r2, [ip, #1028]
33f8a1bc:	e0822003 	add	r2, r2, r3
33f8a1c0:	e5523001 	ldrb	r3, [r2, #-1]
33f8a1c4:	e353001a 	cmp	r3, #26	; 0x1a
33f8a1c8:	1a000011 	bne	33f8a214 <xyzModem_stream_read+0xe0>
33f8a1cc:	e5523002 	ldrb	r3, [r2, #-2]
33f8a1d0:	e353001a 	cmp	r3, #26	; 0x1a
33f8a1d4:	1a00000e 	bne	33f8a214 <xyzModem_stream_read+0xe0>
33f8a1d8:	e5523003 	ldrb	r3, [r2, #-3]
33f8a1dc:	e353001a 	cmp	r3, #26	; 0x1a
33f8a1e0:	1a00000b 	bne	33f8a214 <xyzModem_stream_read+0xe0>
33f8a1e4:	ea000000 	b	33f8a1ec <xyzModem_stream_read+0xb8>
33f8a1e8:	e5810410 	str	r0, [r1, #1040]
33f8a1ec:	e59f11c8 	ldr	r1, [pc, #456]	; 33f8a3bc <.text+0xa3bc>
33f8a1f0:	e5912410 	ldr	r2, [r1, #1040]
33f8a1f4:	e3520000 	cmp	r2, #0	; 0x0
33f8a1f8:	e2420001 	sub	r0, r2, #1	; 0x1
33f8a1fc:	0a000004 	beq	33f8a214 <xyzModem_stream_read+0xe0>
33f8a200:	e5913404 	ldr	r3, [r1, #1028]
33f8a204:	e0833002 	add	r3, r3, r2
33f8a208:	e5533001 	ldrb	r3, [r3, #-1]
33f8a20c:	e353001a 	cmp	r3, #26	; 0x1a
33f8a210:	0afffff4 	beq	33f8a1e8 <xyzModem_stream_read+0xb4>
33f8a214:	e59f21a0 	ldr	r2, [pc, #416]	; 33f8a3bc <.text+0xa3bc>
33f8a218:	e5923414 	ldr	r3, [r2, #1044]
33f8a21c:	e3530001 	cmp	r3, #1	; 0x1
33f8a220:	0a000047 	beq	33f8a344 <xyzModem_stream_read+0x210>
33f8a224:	e5923434 	ldr	r3, [r2, #1076]
33f8a228:	e3530000 	cmp	r3, #0	; 0x0
33f8a22c:	0a000044 	beq	33f8a344 <xyzModem_stream_read+0x210>
33f8a230:	e59f2184 	ldr	r2, [pc, #388]	; 33f8a3bc <.text+0xa3bc>
33f8a234:	e5920410 	ldr	r0, [r2, #1040]
33f8a238:	e5923438 	ldr	r3, [r2, #1080]
33f8a23c:	e5921434 	ldr	r1, [r2, #1076]
33f8a240:	e0833000 	add	r3, r3, r0
33f8a244:	e1530001 	cmp	r3, r1
33f8a248:	e5823438 	str	r3, [r2, #1080]
33f8a24c:	80613003 	rsbhi	r3, r1, r3
33f8a250:	80633000 	rsbhi	r3, r3, r0
33f8a254:	85823410 	strhi	r3, [r2, #1040]
33f8a258:	ea000039 	b	33f8a344 <xyzModem_stream_read+0x210>
33f8a25c:	e1500003 	cmp	r0, r3
33f8a260:	13e05007 	mvnne	r5, #7	; 0x7
33f8a264:	1a000022 	bne	33f8a2f4 <xyzModem_stream_read+0x1c0>
33f8a268:	e5943000 	ldr	r3, [r4]
33f8a26c:	e5d30000 	ldrb	r0, [r3]
33f8a270:	ebfffeb0 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f8a274:	ea000028 	b	33f8a31c <xyzModem_stream_read+0x1e8>
33f8a278:	e3750005 	cmn	r5, #5	; 0x5
33f8a27c:	0a00002b 	beq	33f8a330 <xyzModem_stream_read+0x1fc>
33f8a280:	e3750004 	cmn	r5, #4	; 0x4
33f8a284:	1a00001a 	bne	33f8a2f4 <xyzModem_stream_read+0x1c0>
33f8a288:	e59f412c 	ldr	r4, [pc, #300]	; 33f8a3bc <.text+0xa3bc>
33f8a28c:	e5943000 	ldr	r3, [r4]
33f8a290:	e3a01006 	mov	r1, #6	; 0x6
33f8a294:	e5d30000 	ldrb	r0, [r3]
33f8a298:	ebfffea6 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f8a29c:	e5943414 	ldr	r3, [r4, #1044]
33f8a2a0:	e3530002 	cmp	r3, #2	; 0x2
33f8a2a4:	1a00000f 	bne	33f8a2e8 <xyzModem_stream_read+0x1b4>
33f8a2a8:	e5941428 	ldr	r1, [r4, #1064]
33f8a2ac:	e5943000 	ldr	r3, [r4]
33f8a2b0:	e3510000 	cmp	r1, #0	; 0x0
33f8a2b4:	03a01015 	moveq	r1, #21	; 0x15
33f8a2b8:	13a01043 	movne	r1, #67	; 0x43
33f8a2bc:	e5d30000 	ldrb	r0, [r3]
33f8a2c0:	ebfffe9c 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f8a2c4:	e5943418 	ldr	r3, [r4, #1048]
33f8a2c8:	e2833001 	add	r3, r3, #1	; 0x1
33f8a2cc:	e5843418 	str	r3, [r4, #1048]
33f8a2d0:	ebfffef2 	bl	33f89ea0 <xyzModem_get_hdr>
33f8a2d4:	e5943000 	ldr	r3, [r4]
33f8a2d8:	e1a05000 	mov	r5, r0
33f8a2dc:	e3a01006 	mov	r1, #6	; 0x6
33f8a2e0:	e5d30000 	ldrb	r0, [r3]
33f8a2e4:	ebfffe93 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f8a2e8:	e3a03001 	mov	r3, #1	; 0x1
33f8a2ec:	e584342c 	str	r3, [r4, #1068]
33f8a2f0:	ea00000c 	b	33f8a328 <xyzModem_stream_read+0x1f4>
33f8a2f4:	e5941428 	ldr	r1, [r4, #1064]
33f8a2f8:	e5943000 	ldr	r3, [r4]
33f8a2fc:	e3510000 	cmp	r1, #0	; 0x0
33f8a300:	e5d30000 	ldrb	r0, [r3]
33f8a304:	03a01015 	moveq	r1, #21	; 0x15
33f8a308:	13a01043 	movne	r1, #67	; 0x43
33f8a30c:	ebfffe89 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f8a310:	e5943418 	ldr	r3, [r4, #1048]
33f8a314:	e2833001 	add	r3, r3, #1	; 0x1
33f8a318:	e5843418 	str	r3, [r4, #1048]
33f8a31c:	e3560000 	cmp	r6, #0	; 0x0
33f8a320:	12466001 	subne	r6, r6, #1	; 0x1
33f8a324:	1affff8c 	bne	33f8a15c <xyzModem_stream_read+0x28>
33f8a328:	e3550000 	cmp	r5, #0	; 0x0
33f8a32c:	aa000004 	bge	33f8a344 <xyzModem_stream_read+0x210>
33f8a330:	e59f3084 	ldr	r3, [pc, #132]	; 33f8a3bc <.text+0xa3bc>
33f8a334:	e3e02000 	mvn	r2, #0	; 0x0
33f8a338:	e58b5000 	str	r5, [fp]
33f8a33c:	e5832410 	str	r2, [r3, #1040]
33f8a340:	ea00001b 	b	33f8a3b4 <xyzModem_stream_read+0x280>
33f8a344:	e59f5070 	ldr	r5, [pc, #112]	; 33f8a3bc <.text+0xa3bc>
33f8a348:	e595342c 	ldr	r3, [r5, #1068]
33f8a34c:	e3530000 	cmp	r3, #0	; 0x0
33f8a350:	1a00000f 	bne	33f8a394 <xyzModem_stream_read+0x260>
33f8a354:	e5954410 	ldr	r4, [r5, #1040]
33f8a358:	e1570004 	cmp	r7, r4
33f8a35c:	b1a04007 	movlt	r4, r7
33f8a360:	e1a0000a 	mov	r0, sl
33f8a364:	e1a02004 	mov	r2, r4
33f8a368:	e5951404 	ldr	r1, [r5, #1028]
33f8a36c:	eb0001d1 	bl	33f8aab8 <memcpy>
33f8a370:	e5952410 	ldr	r2, [r5, #1040]
33f8a374:	e5953404 	ldr	r3, [r5, #1028]
33f8a378:	e0642002 	rsb	r2, r4, r2
33f8a37c:	e0833004 	add	r3, r3, r4
33f8a380:	e5853404 	str	r3, [r5, #1028]
33f8a384:	e5852410 	str	r2, [r5, #1040]
33f8a388:	e0647007 	rsb	r7, r4, r7
33f8a38c:	e08aa004 	add	sl, sl, r4
33f8a390:	e0899004 	add	r9, r9, r4
33f8a394:	e59f2020 	ldr	r2, [pc, #32]	; 33f8a3bc <.text+0xa3bc>
33f8a398:	e592342c 	ldr	r3, [r2, #1068]
33f8a39c:	e2733001 	rsbs	r3, r3, #1	; 0x1
33f8a3a0:	33a03000 	movcc	r3, #0	; 0x0
33f8a3a4:	e3570000 	cmp	r7, #0	; 0x0
33f8a3a8:	d3a03000 	movle	r3, #0	; 0x0
33f8a3ac:	e3530000 	cmp	r3, #0	; 0x0
33f8a3b0:	1affff65 	bne	33f8a14c <xyzModem_stream_read+0x18>
33f8a3b4:	e1a00009 	mov	r0, r9
33f8a3b8:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8a3bc:	33f96734 	mvnccs	r6, #13631488	; 0xd00000

33f8a3c0 <xyzModem_stream_open>:
33f8a3c0:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f8a3c4:	e59f4144 	ldr	r4, [pc, #324]	; 33f8a510 <.text+0xa510>
33f8a3c8:	e3a05000 	mov	r5, #0	; 0x0
33f8a3cc:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8a3d0:	e3a03001 	mov	r3, #1	; 0x1
33f8a3d4:	e584d000 	str	sp, [r4]
33f8a3d8:	e5843428 	str	r3, [r4, #1064]
33f8a3dc:	e5845410 	str	r5, [r4, #1040]
33f8a3e0:	e584542c 	str	r5, [r4, #1068]
33f8a3e4:	e5845430 	str	r5, [r4, #1072]
33f8a3e8:	e5903004 	ldr	r3, [r0, #4]
33f8a3ec:	e1a0a001 	mov	sl, r1
33f8a3f0:	e5dd0000 	ldrb	r0, [sp]
33f8a3f4:	e3a01043 	mov	r1, #67	; 0x43
33f8a3f8:	e5843414 	str	r3, [r4, #1044]
33f8a3fc:	e5845418 	str	r5, [r4, #1048]
33f8a400:	e584541c 	str	r5, [r4, #1052]
33f8a404:	e5845420 	str	r5, [r4, #1056]
33f8a408:	e5845424 	str	r5, [r4, #1060]
33f8a40c:	e5845438 	str	r5, [r4, #1080]
33f8a410:	e5845434 	str	r5, [r4, #1076]
33f8a414:	ebfffe47 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f8a418:	e5943414 	ldr	r3, [r4, #1044]
33f8a41c:	e3530001 	cmp	r3, #1	; 0x1
33f8a420:	13a0700a 	movne	r7, #10	; 0xa
33f8a424:	13a06013 	movne	r6, #19	; 0x13
33f8a428:	01a00005 	moveq	r0, r5
33f8a42c:	05c4340c 	streqb	r3, [r4, #1036]
33f8a430:	0a000034 	beq	33f8a508 <xyzModem_stream_open+0x148>
33f8a434:	ebfffe99 	bl	33f89ea0 <xyzModem_get_hdr>
33f8a438:	e2504000 	subs	r4, r0, #0	; 0x0
33f8a43c:	e59f50cc 	ldr	r5, [pc, #204]	; 33f8a510 <.text+0xa510>
33f8a440:	e59f00cc 	ldr	r0, [pc, #204]	; 33f8a514 <.text+0xa514>
33f8a444:	1a000015 	bne	33f8a4a0 <xyzModem_stream_open+0xe0>
33f8a448:	e5d53408 	ldrb	r3, [r5, #1032]
33f8a44c:	e3530000 	cmp	r3, #0	; 0x0
33f8a450:	1a00000b 	bne	33f8a484 <xyzModem_stream_open+0xc4>
33f8a454:	e59f40b4 	ldr	r4, [pc, #180]	; 33f8a510 <.text+0xa510>
33f8a458:	e5943404 	ldr	r3, [r4, #1028]
33f8a45c:	e4d32001 	ldrb	r2, [r3], #1
33f8a460:	e3520000 	cmp	r2, #0	; 0x0
33f8a464:	e1a00003 	mov	r0, r3
33f8a468:	e5843404 	str	r3, [r4, #1028]
33f8a46c:	1afffff8 	bne	33f8a454 <xyzModem_stream_open+0x94>
33f8a470:	e59f30a0 	ldr	r3, [pc, #160]	; 33f8a518 <.text+0xa518>
33f8a474:	e59f10a0 	ldr	r1, [pc, #160]	; 33f8a51c <.text+0xa51c>
33f8a478:	ebfffd9e 	bl	33f89af8 <parse_num>
33f8a47c:	e3a03001 	mov	r3, #1	; 0x1
33f8a480:	e5843430 	str	r3, [r4, #1072]
33f8a484:	e59f1084 	ldr	r1, [pc, #132]	; 33f8a510 <.text+0xa510>
33f8a488:	e3a02000 	mov	r2, #0	; 0x0
33f8a48c:	e3a03001 	mov	r3, #1	; 0x1
33f8a490:	e1a00002 	mov	r0, r2
33f8a494:	e5c1340c 	strb	r3, [r1, #1036]
33f8a498:	e5812410 	str	r2, [r1, #1040]
33f8a49c:	ea000019 	b	33f8a508 <xyzModem_stream_open+0x148>
33f8a4a0:	e3740003 	cmn	r4, #3	; 0x3
33f8a4a4:	1a000010 	bne	33f8a4ec <xyzModem_stream_open+0x12c>
33f8a4a8:	e2477001 	sub	r7, r7, #1	; 0x1
33f8a4ac:	e3570000 	cmp	r7, #0	; 0x0
33f8a4b0:	d59f3058 	ldrle	r3, [pc, #88]	; 33f8a510 <.text+0xa510>
33f8a4b4:	d3a02000 	movle	r2, #0	; 0x0
33f8a4b8:	d5832428 	strle	r2, [r3, #1064]
33f8a4bc:	ebffd8f7 	bl	33f808a0 <udelay>
33f8a4c0:	e5951428 	ldr	r1, [r5, #1064]
33f8a4c4:	e5953000 	ldr	r3, [r5]
33f8a4c8:	e3510000 	cmp	r1, #0	; 0x0
33f8a4cc:	e5d30000 	ldrb	r0, [r3]
33f8a4d0:	03a01015 	moveq	r1, #21	; 0x15
33f8a4d4:	13a01043 	movne	r1, #67	; 0x43
33f8a4d8:	ebfffe16 	bl	33f89d38 <CYGACC_COMM_IF_PUTC>
33f8a4dc:	e5953418 	ldr	r3, [r5, #1048]
33f8a4e0:	e2833001 	add	r3, r3, #1	; 0x1
33f8a4e4:	e5853418 	str	r3, [r5, #1048]
33f8a4e8:	ea000001 	b	33f8a4f4 <xyzModem_stream_open+0x134>
33f8a4ec:	e3740005 	cmn	r4, #5	; 0x5
33f8a4f0:	0a000002 	beq	33f8a500 <xyzModem_stream_open+0x140>
33f8a4f4:	e3560000 	cmp	r6, #0	; 0x0
33f8a4f8:	e2466001 	sub	r6, r6, #1	; 0x1
33f8a4fc:	1affffcc 	bne	33f8a434 <xyzModem_stream_open+0x74>
33f8a500:	e58a4000 	str	r4, [sl]
33f8a504:	e3e00000 	mvn	r0, #0	; 0x0
33f8a508:	e28dd004 	add	sp, sp, #4	; 0x4
33f8a50c:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f8a510:	33f96734 	mvnccs	r6, #13631488	; 0xd00000
33f8a514:	0007a120 	andeq	sl, r7, r0, lsr #2
33f8a518:	33f92a54 	mvnccs	r2, #344064	; 0x54000
33f8a51c:	33f96b68 	mvnccs	r6, #106496	; 0x1a000

33f8a520 <cyg_crc16>:
33f8a520:	e52de004 	str	lr, [sp, #-4]!
33f8a524:	e3a0c000 	mov	ip, #0	; 0x0
33f8a528:	e1a0e00c 	mov	lr, ip
33f8a52c:	ea000008 	b	33f8a554 <cyg_crc16+0x34>
33f8a530:	e7de3000 	ldrb	r3, [lr, r0]
33f8a534:	e59f2028 	ldr	r2, [pc, #40]	; 33f8a564 <.text+0xa564>
33f8a538:	e023342c 	eor	r3, r3, ip, lsr #8
33f8a53c:	e1a03083 	mov	r3, r3, lsl #1
33f8a540:	e19330b2 	ldrh	r3, [r3, r2]
33f8a544:	e023340c 	eor	r3, r3, ip, lsl #8
33f8a548:	e1a03803 	mov	r3, r3, lsl #16
33f8a54c:	e28ee001 	add	lr, lr, #1	; 0x1
33f8a550:	e1a0c823 	mov	ip, r3, lsr #16
33f8a554:	e15e0001 	cmp	lr, r1
33f8a558:	bafffff4 	blt	33f8a530 <cyg_crc16+0x10>
33f8a55c:	e1a0000c 	mov	r0, ip
33f8a560:	e49df004 	ldr	pc, [sp], #4
33f8a564:	33f916d0 	mvnccs	r1, #218103808	; 0xd000000

33f8a568 <crc32>:
33f8a568:	e92d4010 	stmdb	sp!, {r4, lr}
33f8a56c:	e1a0c001 	mov	ip, r1
33f8a570:	e1a0e002 	mov	lr, r2
33f8a574:	e1e00000 	mvn	r0, r0
33f8a578:	ea000029 	b	33f8a624 <crc32+0xbc>
33f8a57c:	e5dc3000 	ldrb	r3, [ip]
33f8a580:	e0203003 	eor	r3, r0, r3
33f8a584:	e20330ff 	and	r3, r3, #255	; 0xff
33f8a588:	e7943103 	ldr	r3, [r4, r3, lsl #2]
33f8a58c:	e5dc2001 	ldrb	r2, [ip, #1]
33f8a590:	e0233420 	eor	r3, r3, r0, lsr #8
33f8a594:	e0232002 	eor	r2, r3, r2
33f8a598:	e20220ff 	and	r2, r2, #255	; 0xff
33f8a59c:	e7942102 	ldr	r2, [r4, r2, lsl #2]
33f8a5a0:	e5dc1002 	ldrb	r1, [ip, #2]
33f8a5a4:	e0222423 	eor	r2, r2, r3, lsr #8
33f8a5a8:	e0221001 	eor	r1, r2, r1
33f8a5ac:	e20110ff 	and	r1, r1, #255	; 0xff
33f8a5b0:	e7941101 	ldr	r1, [r4, r1, lsl #2]
33f8a5b4:	e5dc3003 	ldrb	r3, [ip, #3]
33f8a5b8:	e0211422 	eor	r1, r1, r2, lsr #8
33f8a5bc:	e0213003 	eor	r3, r1, r3
33f8a5c0:	e20330ff 	and	r3, r3, #255	; 0xff
33f8a5c4:	e7942103 	ldr	r2, [r4, r3, lsl #2]
33f8a5c8:	e5dc3004 	ldrb	r3, [ip, #4]
33f8a5cc:	e0222421 	eor	r2, r2, r1, lsr #8
33f8a5d0:	e0223003 	eor	r3, r2, r3
33f8a5d4:	e20330ff 	and	r3, r3, #255	; 0xff
33f8a5d8:	e7941103 	ldr	r1, [r4, r3, lsl #2]
33f8a5dc:	e5dc3005 	ldrb	r3, [ip, #5]
33f8a5e0:	e0211422 	eor	r1, r1, r2, lsr #8
33f8a5e4:	e0213003 	eor	r3, r1, r3
33f8a5e8:	e20330ff 	and	r3, r3, #255	; 0xff
33f8a5ec:	e7940103 	ldr	r0, [r4, r3, lsl #2]
33f8a5f0:	e5dc3006 	ldrb	r3, [ip, #6]
33f8a5f4:	e0200421 	eor	r0, r0, r1, lsr #8
33f8a5f8:	e0203003 	eor	r3, r0, r3
33f8a5fc:	e20330ff 	and	r3, r3, #255	; 0xff
33f8a600:	e7942103 	ldr	r2, [r4, r3, lsl #2]
33f8a604:	e5dc3007 	ldrb	r3, [ip, #7]
33f8a608:	e0222420 	eor	r2, r2, r0, lsr #8
33f8a60c:	e0223003 	eor	r3, r2, r3
33f8a610:	e20330ff 	and	r3, r3, #255	; 0xff
33f8a614:	e7943103 	ldr	r3, [r4, r3, lsl #2]
33f8a618:	e28cc008 	add	ip, ip, #8	; 0x8
33f8a61c:	e0230422 	eor	r0, r3, r2, lsr #8
33f8a620:	e24ee008 	sub	lr, lr, #8	; 0x8
33f8a624:	e35e0007 	cmp	lr, #7	; 0x7
33f8a628:	e59f4030 	ldr	r4, [pc, #48]	; 33f8a660 <.text+0xa660>
33f8a62c:	8affffd2 	bhi	33f8a57c <crc32+0x14>
33f8a630:	e35e0000 	cmp	lr, #0	; 0x0
33f8a634:	0a000007 	beq	33f8a658 <crc32+0xf0>
33f8a638:	e4dc3001 	ldrb	r3, [ip], #1
33f8a63c:	e59f201c 	ldr	r2, [pc, #28]	; 33f8a660 <.text+0xa660>
33f8a640:	e0203003 	eor	r3, r0, r3
33f8a644:	e20330ff 	and	r3, r3, #255	; 0xff
33f8a648:	e7923103 	ldr	r3, [r2, r3, lsl #2]
33f8a64c:	e25ee001 	subs	lr, lr, #1	; 0x1
33f8a650:	e0230420 	eor	r0, r3, r0, lsr #8
33f8a654:	1afffff7 	bne	33f8a638 <crc32+0xd0>
33f8a658:	e1e00000 	mvn	r0, r0
33f8a65c:	e8bd8010 	ldmia	sp!, {r4, pc}
33f8a660:	33f918d0 	mvnccs	r1, #13631488	; 0xd00000

33f8a664 <print_size>:
33f8a664:	e3500601 	cmp	r0, #1048576	; 0x100000
33f8a668:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f8a66c:	e3a06601 	mov	r6, #1048576	; 0x100000
33f8a670:	33a06b01 	movcc	r6, #1024	; 0x400
33f8a674:	e1a07001 	mov	r7, r1
33f8a678:	e1a01006 	mov	r1, r6
33f8a67c:	e1a04000 	mov	r4, r0
33f8a680:	e3a0a04d 	mov	sl, #77	; 0x4d
33f8a684:	33a0a06b 	movcc	sl, #107	; 0x6b
33f8a688:	ebffd942 	bl	33f80b98 <__udivsi3>
33f8a68c:	e0030096 	mul	r3, r6, r0
33f8a690:	e3a0200a 	mov	r2, #10	; 0xa
33f8a694:	e0633004 	rsb	r3, r3, r4
33f8a698:	e1a010a6 	mov	r1, r6, lsr #1
33f8a69c:	e1a05000 	mov	r5, r0
33f8a6a0:	e0201293 	mla	r0, r3, r2, r1
33f8a6a4:	e1a01006 	mov	r1, r6
33f8a6a8:	ebffd93a 	bl	33f80b98 <__udivsi3>
33f8a6ac:	e1a04000 	mov	r4, r0
33f8a6b0:	e3540009 	cmp	r4, #9	; 0x9
33f8a6b4:	82855001 	addhi	r5, r5, #1	; 0x1
33f8a6b8:	8244400a 	subhi	r4, r4, #10	; 0xa
33f8a6bc:	e59f0028 	ldr	r0, [pc, #40]	; 33f8a6ec <.text+0xa6ec>
33f8a6c0:	e1a01005 	mov	r1, r5
33f8a6c4:	ebfff565 	bl	33f87c60 <printf>
33f8a6c8:	e3540000 	cmp	r4, #0	; 0x0
33f8a6cc:	e1a01004 	mov	r1, r4
33f8a6d0:	e59f0018 	ldr	r0, [pc, #24]	; 33f8a6f0 <.text+0xa6f0>
33f8a6d4:	1bfff561 	blne	33f87c60 <printf>
33f8a6d8:	e59f0014 	ldr	r0, [pc, #20]	; 33f8a6f4 <.text+0xa6f4>
33f8a6dc:	e1a0100a 	mov	r1, sl
33f8a6e0:	e1a02007 	mov	r2, r7
33f8a6e4:	e8bd44f0 	ldmia	sp!, {r4, r5, r6, r7, sl, lr}
33f8a6e8:	eafff55c 	b	33f87c60 <printf>
33f8a6ec:	33f94ce0 	mvnccs	r4, #57344	; 0xe000
33f8a6f0:	33f94ce8 	mvnccs	r4, #59392	; 0xe800
33f8a6f4:	33f94cf0 	mvnccs	r4, #61440	; 0xf000

33f8a6f8 <display_options>:
33f8a6f8:	e52de004 	str	lr, [sp, #-4]!
33f8a6fc:	e59f000c 	ldr	r0, [pc, #12]	; 33f8a710 <.text+0xa710>
33f8a700:	e59f100c 	ldr	r1, [pc, #12]	; 33f8a714 <.text+0xa714>
33f8a704:	ebfff555 	bl	33f87c60 <printf>
33f8a708:	e3a00000 	mov	r0, #0	; 0x0
33f8a70c:	e49df004 	ldr	pc, [sp], #4
33f8a710:	33f9202c 	mvnccs	r2, #44	; 0x2c
33f8a714:	33f912d8 	mvnccs	r1, #-2147483635	; 0x8000000d

33f8a718 <strcpy>:
33f8a718:	e1a02000 	mov	r2, r0
33f8a71c:	e4d13001 	ldrb	r3, [r1], #1
33f8a720:	e3530000 	cmp	r3, #0	; 0x0
33f8a724:	e4c23001 	strb	r3, [r2], #1
33f8a728:	1afffffb 	bne	33f8a71c <strcpy+0x4>
33f8a72c:	e1a0f00e 	mov	pc, lr

33f8a730 <strncpy>:
33f8a730:	e1a0c000 	mov	ip, r0
33f8a734:	e2522001 	subs	r2, r2, #1	; 0x1
33f8a738:	31a0f00e 	movcc	pc, lr
33f8a73c:	e5d13000 	ldrb	r3, [r1]
33f8a740:	e3530000 	cmp	r3, #0	; 0x0
33f8a744:	e5cc3000 	strb	r3, [ip]
33f8a748:	e2811001 	add	r1, r1, #1	; 0x1
33f8a74c:	e28cc001 	add	ip, ip, #1	; 0x1
33f8a750:	1afffff7 	bne	33f8a734 <strncpy+0x4>
33f8a754:	e1a0f00e 	mov	pc, lr

33f8a758 <strcat>:
33f8a758:	e1a02000 	mov	r2, r0
33f8a75c:	ea000000 	b	33f8a764 <strcat+0xc>
33f8a760:	e2822001 	add	r2, r2, #1	; 0x1
33f8a764:	e5d23000 	ldrb	r3, [r2]
33f8a768:	e3530000 	cmp	r3, #0	; 0x0
33f8a76c:	1afffffb 	bne	33f8a760 <strcat+0x8>
33f8a770:	e4d13001 	ldrb	r3, [r1], #1
33f8a774:	e3530000 	cmp	r3, #0	; 0x0
33f8a778:	e4c23001 	strb	r3, [r2], #1
33f8a77c:	1afffffb 	bne	33f8a770 <strcat+0x18>
33f8a780:	e1a0f00e 	mov	pc, lr

33f8a784 <strncat>:
33f8a784:	e3520000 	cmp	r2, #0	; 0x0
33f8a788:	11a0c000 	movne	ip, r0
33f8a78c:	01a0f00e 	moveq	pc, lr
33f8a790:	ea000000 	b	33f8a798 <strncat+0x14>
33f8a794:	e28cc001 	add	ip, ip, #1	; 0x1
33f8a798:	e5dc3000 	ldrb	r3, [ip]
33f8a79c:	e3530000 	cmp	r3, #0	; 0x0
33f8a7a0:	1afffffb 	bne	33f8a794 <strncat+0x10>
33f8a7a4:	ea000003 	b	33f8a7b8 <strncat+0x34>
33f8a7a8:	e2522001 	subs	r2, r2, #1	; 0x1
33f8a7ac:	1a000001 	bne	33f8a7b8 <strncat+0x34>
33f8a7b0:	e5cc2000 	strb	r2, [ip]
33f8a7b4:	e1a0f00e 	mov	pc, lr
33f8a7b8:	e4d13001 	ldrb	r3, [r1], #1
33f8a7bc:	e3530000 	cmp	r3, #0	; 0x0
33f8a7c0:	e5cc3000 	strb	r3, [ip]
33f8a7c4:	e28cc001 	add	ip, ip, #1	; 0x1
33f8a7c8:	1afffff6 	bne	33f8a7a8 <strncat+0x24>
33f8a7cc:	e1a0f00e 	mov	pc, lr

33f8a7d0 <strcmp>:
33f8a7d0:	e5d02000 	ldrb	r2, [r0]
33f8a7d4:	e4d13001 	ldrb	r3, [r1], #1
33f8a7d8:	e0633002 	rsb	r3, r3, r2
33f8a7dc:	e21330ff 	ands	r3, r3, #255	; 0xff
33f8a7e0:	e2800001 	add	r0, r0, #1	; 0x1
33f8a7e4:	1a000001 	bne	33f8a7f0 <strcmp+0x20>
33f8a7e8:	e3520000 	cmp	r2, #0	; 0x0
33f8a7ec:	1afffff7 	bne	33f8a7d0 <strcmp>
33f8a7f0:	e1a00c03 	mov	r0, r3, lsl #24
33f8a7f4:	e1a00c40 	mov	r0, r0, asr #24
33f8a7f8:	e1a0f00e 	mov	pc, lr

33f8a7fc <strncmp>:
33f8a7fc:	e3a03000 	mov	r3, #0	; 0x0
33f8a800:	ea000008 	b	33f8a828 <strncmp+0x2c>
33f8a804:	e5d0c000 	ldrb	ip, [r0]
33f8a808:	e5d13000 	ldrb	r3, [r1]
33f8a80c:	e063300c 	rsb	r3, r3, ip
33f8a810:	e21330ff 	ands	r3, r3, #255	; 0xff
33f8a814:	e2811001 	add	r1, r1, #1	; 0x1
33f8a818:	e2800001 	add	r0, r0, #1	; 0x1
33f8a81c:	1a000004 	bne	33f8a834 <strncmp+0x38>
33f8a820:	e35c0000 	cmp	ip, #0	; 0x0
33f8a824:	0a000002 	beq	33f8a834 <strncmp+0x38>
33f8a828:	e3520000 	cmp	r2, #0	; 0x0
33f8a82c:	e2422001 	sub	r2, r2, #1	; 0x1
33f8a830:	1afffff3 	bne	33f8a804 <strncmp+0x8>
33f8a834:	e1a00c03 	mov	r0, r3, lsl #24
33f8a838:	e1a00c40 	mov	r0, r0, asr #24
33f8a83c:	e1a0f00e 	mov	pc, lr

33f8a840 <strchr>:
33f8a840:	e1a02000 	mov	r2, r0
33f8a844:	ea000002 	b	33f8a854 <strchr+0x14>
33f8a848:	e3500000 	cmp	r0, #0	; 0x0
33f8a84c:	e2822001 	add	r2, r2, #1	; 0x1
33f8a850:	01a0f00e 	moveq	pc, lr
33f8a854:	e5d20000 	ldrb	r0, [r2]
33f8a858:	e20130ff 	and	r3, r1, #255	; 0xff
33f8a85c:	e1500003 	cmp	r0, r3
33f8a860:	1afffff8 	bne	33f8a848 <strchr+0x8>
33f8a864:	e1a00002 	mov	r0, r2
33f8a868:	e1a0f00e 	mov	pc, lr

33f8a86c <strlen>:
33f8a86c:	e1a02000 	mov	r2, r0
33f8a870:	ea000000 	b	33f8a878 <strlen+0xc>
33f8a874:	e2800001 	add	r0, r0, #1	; 0x1
33f8a878:	e5d03000 	ldrb	r3, [r0]
33f8a87c:	e3530000 	cmp	r3, #0	; 0x0
33f8a880:	1afffffb 	bne	33f8a874 <strlen+0x8>
33f8a884:	e0620000 	rsb	r0, r2, r0
33f8a888:	e1a0f00e 	mov	pc, lr

33f8a88c <strrchr>:
33f8a88c:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f8a890:	e1a04000 	mov	r4, r0
33f8a894:	e1a05001 	mov	r5, r1
33f8a898:	ebfffff3 	bl	33f8a86c <strlen>
33f8a89c:	e0840000 	add	r0, r4, r0
33f8a8a0:	e5d02000 	ldrb	r2, [r0]
33f8a8a4:	e20530ff 	and	r3, r5, #255	; 0xff
33f8a8a8:	e1520003 	cmp	r2, r3
33f8a8ac:	08bd8030 	ldmeqia	sp!, {r4, r5, pc}
33f8a8b0:	e2400001 	sub	r0, r0, #1	; 0x1
33f8a8b4:	e1500004 	cmp	r0, r4
33f8a8b8:	2afffff8 	bcs	33f8a8a0 <strrchr+0x14>
33f8a8bc:	e3a00000 	mov	r0, #0	; 0x0
33f8a8c0:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

33f8a8c4 <strnlen>:
33f8a8c4:	e1a02000 	mov	r2, r0
33f8a8c8:	ea000000 	b	33f8a8d0 <strnlen+0xc>
33f8a8cc:	e2800001 	add	r0, r0, #1	; 0x1
33f8a8d0:	e2511001 	subs	r1, r1, #1	; 0x1
33f8a8d4:	3a000002 	bcc	33f8a8e4 <strnlen+0x20>
33f8a8d8:	e5d03000 	ldrb	r3, [r0]
33f8a8dc:	e3530000 	cmp	r3, #0	; 0x0
33f8a8e0:	1afffff9 	bne	33f8a8cc <strnlen+0x8>
33f8a8e4:	e0620000 	rsb	r0, r2, r0
33f8a8e8:	e1a0f00e 	mov	pc, lr

33f8a8ec <strspn>:
33f8a8ec:	e52de004 	str	lr, [sp, #-4]!
33f8a8f0:	e1a0e000 	mov	lr, r0
33f8a8f4:	e3a00000 	mov	r0, #0	; 0x0
33f8a8f8:	ea000007 	b	33f8a91c <strspn+0x30>
33f8a8fc:	e15c0002 	cmp	ip, r2
33f8a900:	0a000004 	beq	33f8a918 <strspn+0x2c>
33f8a904:	e5d32000 	ldrb	r2, [r3]
33f8a908:	e3520000 	cmp	r2, #0	; 0x0
33f8a90c:	e2833001 	add	r3, r3, #1	; 0x1
33f8a910:	1afffff9 	bne	33f8a8fc <strspn+0x10>
33f8a914:	e49df004 	ldr	pc, [sp], #4
33f8a918:	e2800001 	add	r0, r0, #1	; 0x1
33f8a91c:	e7d0c00e 	ldrb	ip, [r0, lr]
33f8a920:	e35c0000 	cmp	ip, #0	; 0x0
33f8a924:	049df004 	ldreq	pc, [sp], #4
33f8a928:	e1a03001 	mov	r3, r1
33f8a92c:	eafffff4 	b	33f8a904 <strspn+0x18>

33f8a930 <strpbrk>:
33f8a930:	e1a02000 	mov	r2, r0
33f8a934:	ea000006 	b	33f8a954 <strpbrk+0x24>
33f8a938:	e150000c 	cmp	r0, ip
33f8a93c:	0a000009 	beq	33f8a968 <strpbrk+0x38>
33f8a940:	e5d3c000 	ldrb	ip, [r3]
33f8a944:	e35c0000 	cmp	ip, #0	; 0x0
33f8a948:	e2833001 	add	r3, r3, #1	; 0x1
33f8a94c:	1afffff9 	bne	33f8a938 <strpbrk+0x8>
33f8a950:	e2822001 	add	r2, r2, #1	; 0x1
33f8a954:	e5d20000 	ldrb	r0, [r2]
33f8a958:	e3500000 	cmp	r0, #0	; 0x0
33f8a95c:	01a0f00e 	moveq	pc, lr
33f8a960:	e1a03001 	mov	r3, r1
33f8a964:	eafffff5 	b	33f8a940 <strpbrk+0x10>
33f8a968:	e1a00002 	mov	r0, r2
33f8a96c:	e1a0f00e 	mov	pc, lr

33f8a970 <strtok>:
33f8a970:	e3500000 	cmp	r0, #0	; 0x0
33f8a974:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f8a978:	e1a04000 	mov	r4, r0
33f8a97c:	e1a05001 	mov	r5, r1
33f8a980:	1a000003 	bne	33f8a994 <strtok+0x24>
33f8a984:	e59f3064 	ldr	r3, [pc, #100]	; 33f8a9f0 <.text+0xa9f0>
33f8a988:	e5934000 	ldr	r4, [r3]
33f8a98c:	e3540000 	cmp	r4, #0	; 0x0
33f8a990:	0a000014 	beq	33f8a9e8 <strtok+0x78>
33f8a994:	e1a01005 	mov	r1, r5
33f8a998:	e1a00004 	mov	r0, r4
33f8a99c:	ebffffd2 	bl	33f8a8ec <strspn>
33f8a9a0:	e0844000 	add	r4, r4, r0
33f8a9a4:	e5d42000 	ldrb	r2, [r4]
33f8a9a8:	e3520000 	cmp	r2, #0	; 0x0
33f8a9ac:	e1a01005 	mov	r1, r5
33f8a9b0:	e1a00004 	mov	r0, r4
33f8a9b4:	059f3034 	ldreq	r3, [pc, #52]	; 33f8a9f0 <.text+0xa9f0>
33f8a9b8:	01a04002 	moveq	r4, r2
33f8a9bc:	05832000 	streq	r2, [r3]
33f8a9c0:	0a000008 	beq	33f8a9e8 <strtok+0x78>
33f8a9c4:	ebffffd9 	bl	33f8a930 <strpbrk>
33f8a9c8:	e3500000 	cmp	r0, #0	; 0x0
33f8a9cc:	0a000003 	beq	33f8a9e0 <strtok+0x70>
33f8a9d0:	e5d03000 	ldrb	r3, [r0]
33f8a9d4:	e3530000 	cmp	r3, #0	; 0x0
33f8a9d8:	13a03000 	movne	r3, #0	; 0x0
33f8a9dc:	14c03001 	strneb	r3, [r0], #1
33f8a9e0:	e59f3008 	ldr	r3, [pc, #8]	; 33f8a9f0 <.text+0xa9f0>
33f8a9e4:	e5830000 	str	r0, [r3]
33f8a9e8:	e1a00004 	mov	r0, r4
33f8a9ec:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f8a9f0:	33f96b70 	mvnccs	r6, #114688	; 0x1c000

33f8a9f4 <strsep>:
33f8a9f4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f8a9f8:	e5904000 	ldr	r4, [r0]
33f8a9fc:	e1a05000 	mov	r5, r0
33f8aa00:	e2540000 	subs	r0, r4, #0	; 0x0
33f8aa04:	0a000004 	beq	33f8aa1c <strsep+0x28>
33f8aa08:	ebffffc8 	bl	33f8a930 <strpbrk>
33f8aa0c:	e3500000 	cmp	r0, #0	; 0x0
33f8aa10:	13a03000 	movne	r3, #0	; 0x0
33f8aa14:	14c03001 	strneb	r3, [r0], #1
33f8aa18:	e5850000 	str	r0, [r5]
33f8aa1c:	e1a00004 	mov	r0, r4
33f8aa20:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

33f8aa24 <strswab>:
33f8aa24:	e3500000 	cmp	r0, #0	; 0x0
33f8aa28:	0a00000e 	beq	33f8aa68 <strswab+0x44>
33f8aa2c:	e5d03000 	ldrb	r3, [r0]
33f8aa30:	e3530000 	cmp	r3, #0	; 0x0
33f8aa34:	11a01003 	movne	r1, r3
33f8aa38:	11a03000 	movne	r3, r0
33f8aa3c:	1a000005 	bne	33f8aa58 <strswab+0x34>
33f8aa40:	ea000008 	b	33f8aa68 <strswab+0x44>
33f8aa44:	e5c32000 	strb	r2, [r3]
33f8aa48:	e5c31001 	strb	r1, [r3, #1]
33f8aa4c:	e5f31002 	ldrb	r1, [r3, #2]!
33f8aa50:	e3510000 	cmp	r1, #0	; 0x0
33f8aa54:	01a0f00e 	moveq	pc, lr
33f8aa58:	e5d32001 	ldrb	r2, [r3, #1]
33f8aa5c:	e3520000 	cmp	r2, #0	; 0x0
33f8aa60:	1afffff7 	bne	33f8aa44 <strswab+0x20>
33f8aa64:	e1a0f00e 	mov	pc, lr
33f8aa68:	e3a00000 	mov	r0, #0	; 0x0
33f8aa6c:	e1a0f00e 	mov	pc, lr

33f8aa70 <memset>:
33f8aa70:	e3a03000 	mov	r3, #0	; 0x0
33f8aa74:	ea000001 	b	33f8aa80 <memset+0x10>
33f8aa78:	e7c31000 	strb	r1, [r3, r0]
33f8aa7c:	e2833001 	add	r3, r3, #1	; 0x1
33f8aa80:	e2522001 	subs	r2, r2, #1	; 0x1
33f8aa84:	2afffffb 	bcs	33f8aa78 <memset+0x8>
33f8aa88:	e1a0f00e 	mov	pc, lr

33f8aa8c <bcopy>:
33f8aa8c:	e1a0c001 	mov	ip, r1
33f8aa90:	ea000001 	b	33f8aa9c <bcopy+0x10>
33f8aa94:	e5503001 	ldrb	r3, [r0, #-1]
33f8aa98:	e54c3001 	strb	r3, [ip, #-1]
33f8aa9c:	e2422001 	sub	r2, r2, #1	; 0x1
33f8aaa0:	e3720001 	cmn	r2, #1	; 0x1
33f8aaa4:	e2800001 	add	r0, r0, #1	; 0x1
33f8aaa8:	e28cc001 	add	ip, ip, #1	; 0x1
33f8aaac:	1afffff8 	bne	33f8aa94 <bcopy+0x8>
33f8aab0:	e1a00001 	mov	r0, r1
33f8aab4:	e1a0f00e 	mov	pc, lr

33f8aab8 <memcpy>:
33f8aab8:	e3a0c000 	mov	ip, #0	; 0x0
33f8aabc:	ea000002 	b	33f8aacc <memcpy+0x14>
33f8aac0:	e7dc3001 	ldrb	r3, [ip, r1]
33f8aac4:	e7cc3000 	strb	r3, [ip, r0]
33f8aac8:	e28cc001 	add	ip, ip, #1	; 0x1
33f8aacc:	e2522001 	subs	r2, r2, #1	; 0x1
33f8aad0:	2afffffa 	bcs	33f8aac0 <memcpy+0x8>
33f8aad4:	e1a0f00e 	mov	pc, lr

33f8aad8 <memmove>:
33f8aad8:	e1500001 	cmp	r0, r1
33f8aadc:	93a0c000 	movls	ip, #0	; 0x0
33f8aae0:	9a000003 	bls	33f8aaf4 <memmove+0x1c>
33f8aae4:	ea000005 	b	33f8ab00 <memmove+0x28>
33f8aae8:	e7dc3001 	ldrb	r3, [ip, r1]
33f8aaec:	e7cc3000 	strb	r3, [ip, r0]
33f8aaf0:	e28cc001 	add	ip, ip, #1	; 0x1
33f8aaf4:	e2522001 	subs	r2, r2, #1	; 0x1
33f8aaf8:	2afffffa 	bcs	33f8aae8 <memmove+0x10>
33f8aafc:	e1a0f00e 	mov	pc, lr
33f8ab00:	e0811002 	add	r1, r1, r2
33f8ab04:	e080c002 	add	ip, r0, r2
33f8ab08:	ea000001 	b	33f8ab14 <memmove+0x3c>
33f8ab0c:	e5713001 	ldrb	r3, [r1, #-1]!
33f8ab10:	e56c3001 	strb	r3, [ip, #-1]!
33f8ab14:	e2522001 	subs	r2, r2, #1	; 0x1
33f8ab18:	2afffffb 	bcs	33f8ab0c <memmove+0x34>
33f8ab1c:	e1a0f00e 	mov	pc, lr

33f8ab20 <memcmp>:
33f8ab20:	e92d4010 	stmdb	sp!, {r4, lr}
33f8ab24:	e1a0c002 	mov	ip, r2
33f8ab28:	e1a04000 	mov	r4, r0
33f8ab2c:	e3a0e000 	mov	lr, #0	; 0x0
33f8ab30:	ea000005 	b	33f8ab4c <memcmp+0x2c>
33f8ab34:	e7de2004 	ldrb	r2, [lr, r4]
33f8ab38:	e7de3001 	ldrb	r3, [lr, r1]
33f8ab3c:	e0520003 	subs	r0, r2, r3
33f8ab40:	e28ee001 	add	lr, lr, #1	; 0x1
33f8ab44:	18bd8010 	ldmneia	sp!, {r4, pc}
33f8ab48:	e24cc001 	sub	ip, ip, #1	; 0x1
33f8ab4c:	e35c0000 	cmp	ip, #0	; 0x0
33f8ab50:	1afffff7 	bne	33f8ab34 <memcmp+0x14>
33f8ab54:	e1a0000c 	mov	r0, ip
33f8ab58:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8ab5c <memscan>:
33f8ab5c:	ea000003 	b	33f8ab70 <memscan+0x14>
33f8ab60:	e5d03000 	ldrb	r3, [r0]
33f8ab64:	e1530001 	cmp	r3, r1
33f8ab68:	01a0f00e 	moveq	pc, lr
33f8ab6c:	e2800001 	add	r0, r0, #1	; 0x1
33f8ab70:	e3520000 	cmp	r2, #0	; 0x0
33f8ab74:	e2422001 	sub	r2, r2, #1	; 0x1
33f8ab78:	1afffff8 	bne	33f8ab60 <memscan+0x4>
33f8ab7c:	e1a0f00e 	mov	pc, lr

33f8ab80 <strstr>:
33f8ab80:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f8ab84:	e1a04000 	mov	r4, r0
33f8ab88:	e1a00001 	mov	r0, r1
33f8ab8c:	e1a07001 	mov	r7, r1
33f8ab90:	ebffff35 	bl	33f8a86c <strlen>
33f8ab94:	e2506000 	subs	r6, r0, #0	; 0x0
33f8ab98:	1a000001 	bne	33f8aba4 <strstr+0x24>
33f8ab9c:	e1a00004 	mov	r0, r4
33f8aba0:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f8aba4:	e1a00004 	mov	r0, r4
33f8aba8:	ebffff2f 	bl	33f8a86c <strlen>
33f8abac:	e1a05000 	mov	r5, r0
33f8abb0:	ea000003 	b	33f8abc4 <strstr+0x44>
33f8abb4:	ebffffd9 	bl	33f8ab20 <memcmp>
33f8abb8:	e3500000 	cmp	r0, #0	; 0x0
33f8abbc:	0afffff6 	beq	33f8ab9c <strstr+0x1c>
33f8abc0:	e2844001 	add	r4, r4, #1	; 0x1
33f8abc4:	e1550006 	cmp	r5, r6
33f8abc8:	e1a00004 	mov	r0, r4
33f8abcc:	e1a01007 	mov	r1, r7
33f8abd0:	e1a02006 	mov	r2, r6
33f8abd4:	e2455001 	sub	r5, r5, #1	; 0x1
33f8abd8:	aafffff5 	bge	33f8abb4 <strstr+0x34>
33f8abdc:	e3a00000 	mov	r0, #0	; 0x0
33f8abe0:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

33f8abe4 <memchr>:
33f8abe4:	e2400001 	sub	r0, r0, #1	; 0x1
33f8abe8:	ea000002 	b	33f8abf8 <memchr+0x14>
33f8abec:	e5f03001 	ldrb	r3, [r0, #1]!
33f8abf0:	e15c0003 	cmp	ip, r3
33f8abf4:	01a0f00e 	moveq	pc, lr
33f8abf8:	e2522001 	subs	r2, r2, #1	; 0x1
33f8abfc:	e201c0ff 	and	ip, r1, #255	; 0xff
33f8ac00:	2afffff9 	bcs	33f8abec <memchr+0x8>
33f8ac04:	e3a00000 	mov	r0, #0	; 0x0
33f8ac08:	e1a0f00e 	mov	pc, lr

33f8ac0c <strdup>:
33f8ac0c:	e92d4010 	stmdb	sp!, {r4, lr}
33f8ac10:	e2504000 	subs	r4, r0, #0	; 0x0
33f8ac14:	0a000008 	beq	33f8ac3c <strdup+0x30>
33f8ac18:	ebffff13 	bl	33f8a86c <strlen>
33f8ac1c:	e2800001 	add	r0, r0, #1	; 0x1
33f8ac20:	ebfff600 	bl	33f88428 <malloc>
33f8ac24:	e2503000 	subs	r3, r0, #0	; 0x0
33f8ac28:	e1a01004 	mov	r1, r4
33f8ac2c:	e1a04003 	mov	r4, r3
33f8ac30:	0a000001 	beq	33f8ac3c <strdup+0x30>
33f8ac34:	ebfffeb7 	bl	33f8a718 <strcpy>
33f8ac38:	ea000000 	b	33f8ac40 <strdup+0x34>
33f8ac3c:	e3a04000 	mov	r4, #0	; 0x0
33f8ac40:	e1a00004 	mov	r0, r4
33f8ac44:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8ac48 <simple_strtoul>:
33f8ac48:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f8ac4c:	e5d03000 	ldrb	r3, [r0]
33f8ac50:	e3530030 	cmp	r3, #48	; 0x30
33f8ac54:	e1a06001 	mov	r6, r1
33f8ac58:	e1a01002 	mov	r1, r2
33f8ac5c:	1a00000f 	bne	33f8aca0 <simple_strtoul+0x58>
33f8ac60:	e5f03001 	ldrb	r3, [r0, #1]!
33f8ac64:	e3530078 	cmp	r3, #120	; 0x78
33f8ac68:	1a000006 	bne	33f8ac88 <simple_strtoul+0x40>
33f8ac6c:	e5d03001 	ldrb	r3, [r0, #1]
33f8ac70:	e59f209c 	ldr	r2, [pc, #156]	; 33f8ad14 <.text+0xad14>
33f8ac74:	e7d23003 	ldrb	r3, [r2, r3]
33f8ac78:	e3130044 	tst	r3, #68	; 0x44
33f8ac7c:	13a01010 	movne	r1, #16	; 0x10
33f8ac80:	e2803001 	add	r3, r0, #1	; 0x1
33f8ac84:	1a000003 	bne	33f8ac98 <simple_strtoul+0x50>
33f8ac88:	e3510000 	cmp	r1, #0	; 0x0
33f8ac8c:	03a01008 	moveq	r1, #8	; 0x8
33f8ac90:	0a000004 	beq	33f8aca8 <simple_strtoul+0x60>
33f8ac94:	e1a03000 	mov	r3, r0
33f8ac98:	e1a00003 	mov	r0, r3
33f8ac9c:	ea000001 	b	33f8aca8 <simple_strtoul+0x60>
33f8aca0:	e3520000 	cmp	r2, #0	; 0x0
33f8aca4:	03a0100a 	moveq	r1, #10	; 0xa
33f8aca8:	e3a04000 	mov	r4, #0	; 0x0
33f8acac:	ea000001 	b	33f8acb8 <simple_strtoul+0x70>
33f8acb0:	e024e491 	mla	r4, r1, r4, lr
33f8acb4:	e2800001 	add	r0, r0, #1	; 0x1
33f8acb8:	e5d0c000 	ldrb	ip, [r0]
33f8acbc:	e59f5050 	ldr	r5, [pc, #80]	; 33f8ad14 <.text+0xad14>
33f8acc0:	e7d5300c 	ldrb	r3, [r5, ip]
33f8acc4:	e3130044 	tst	r3, #68	; 0x44
33f8acc8:	e24ce030 	sub	lr, ip, #48	; 0x30
33f8accc:	0a00000c 	beq	33f8ad04 <simple_strtoul+0xbc>
33f8acd0:	e3130004 	tst	r3, #4	; 0x4
33f8acd4:	1a000008 	bne	33f8acfc <simple_strtoul+0xb4>
33f8acd8:	e3130002 	tst	r3, #2	; 0x2
33f8acdc:	e20c20ff 	and	r2, ip, #255	; 0xff
33f8ace0:	e24ce037 	sub	lr, ip, #55	; 0x37
33f8ace4:	0a000004 	beq	33f8acfc <simple_strtoul+0xb4>
33f8ace8:	e7d53002 	ldrb	r3, [r5, r2]
33f8acec:	e3130002 	tst	r3, #2	; 0x2
33f8acf0:	e2423020 	sub	r3, r2, #32	; 0x20
33f8acf4:	120320ff 	andne	r2, r3, #255	; 0xff
33f8acf8:	e242e037 	sub	lr, r2, #55	; 0x37
33f8acfc:	e15e0001 	cmp	lr, r1
33f8ad00:	3affffea 	bcc	33f8acb0 <simple_strtoul+0x68>
33f8ad04:	e3560000 	cmp	r6, #0	; 0x0
33f8ad08:	15860000 	strne	r0, [r6]
33f8ad0c:	e1a00004 	mov	r0, r4
33f8ad10:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8ad14:	33f95dd8 	mvnccs	r5, #13824	; 0x3600

33f8ad18 <simple_strtol>:
33f8ad18:	e52de004 	str	lr, [sp, #-4]!
33f8ad1c:	e5d03000 	ldrb	r3, [r0]
33f8ad20:	e353002d 	cmp	r3, #45	; 0x2d
33f8ad24:	0a000001 	beq	33f8ad30 <simple_strtol+0x18>
33f8ad28:	e49de004 	ldr	lr, [sp], #4
33f8ad2c:	eaffffc5 	b	33f8ac48 <simple_strtoul>
33f8ad30:	e2800001 	add	r0, r0, #1	; 0x1
33f8ad34:	ebffffc3 	bl	33f8ac48 <simple_strtoul>
33f8ad38:	e2600000 	rsb	r0, r0, #0	; 0x0
33f8ad3c:	e49df004 	ldr	pc, [sp], #4

33f8ad40 <skip_atoi>:
33f8ad40:	e1a0c000 	mov	ip, r0
33f8ad44:	e3a02000 	mov	r2, #0	; 0x0
33f8ad48:	ea000003 	b	33f8ad5c <skip_atoi+0x1c>
33f8ad4c:	e3a0300a 	mov	r3, #10	; 0xa
33f8ad50:	e0230392 	mla	r3, r2, r3, r0
33f8ad54:	e58c1000 	str	r1, [ip]
33f8ad58:	e2432030 	sub	r2, r3, #48	; 0x30
33f8ad5c:	e59c3000 	ldr	r3, [ip]
33f8ad60:	e5d30000 	ldrb	r0, [r3]
33f8ad64:	e2831001 	add	r1, r3, #1	; 0x1
33f8ad68:	e2403030 	sub	r3, r0, #48	; 0x30
33f8ad6c:	e3530009 	cmp	r3, #9	; 0x9
33f8ad70:	9afffff5 	bls	33f8ad4c <skip_atoi+0xc>
33f8ad74:	e1a00002 	mov	r0, r2
33f8ad78:	e1a0f00e 	mov	pc, lr

33f8ad7c <number>:
33f8ad7c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8ad80:	e24dd054 	sub	sp, sp, #84	; 0x54
33f8ad84:	e59da078 	ldr	sl, [sp, #120]
33f8ad88:	e59fe220 	ldr	lr, [pc, #544]	; 33f8afb0 <.text+0xafb0>
33f8ad8c:	e59fc220 	ldr	ip, [pc, #544]	; 33f8afb4 <.text+0xafb4>
33f8ad90:	e31a0040 	tst	sl, #64	; 0x40
33f8ad94:	11a0e00c 	movne	lr, ip
33f8ad98:	e1a06003 	mov	r6, r3
33f8ad9c:	e31a0010 	tst	sl, #16	; 0x10
33f8ada0:	e2423002 	sub	r3, r2, #2	; 0x2
33f8ada4:	13caa001 	bicne	sl, sl, #1	; 0x1
33f8ada8:	e3530022 	cmp	r3, #34	; 0x22
33f8adac:	e1a05000 	mov	r5, r0
33f8adb0:	e58de00c 	str	lr, [sp, #12]
33f8adb4:	e1a07001 	mov	r7, r1
33f8adb8:	e1a09002 	mov	r9, r2
33f8adbc:	83a05000 	movhi	r5, #0	; 0x0
33f8adc0:	8a000077 	bhi	33f8afa4 <number+0x228>
33f8adc4:	e31a0001 	tst	sl, #1	; 0x1
33f8adc8:	03a02020 	moveq	r2, #32	; 0x20
33f8adcc:	13a02030 	movne	r2, #48	; 0x30
33f8add0:	e31a0002 	tst	sl, #2	; 0x2
33f8add4:	e58d2004 	str	r2, [sp, #4]
33f8add8:	0a00000e 	beq	33f8ae18 <number+0x9c>
33f8addc:	e3510000 	cmp	r1, #0	; 0x0
33f8ade0:	b2617000 	rsblt	r7, r1, #0	; 0x0
33f8ade4:	b2466001 	sublt	r6, r6, #1	; 0x1
33f8ade8:	b3a0302d 	movlt	r3, #45	; 0x2d
33f8adec:	ba00000a 	blt	33f8ae1c <number+0xa0>
33f8adf0:	e31a0004 	tst	sl, #4	; 0x4
33f8adf4:	13a0c02b 	movne	ip, #43	; 0x2b
33f8adf8:	12466001 	subne	r6, r6, #1	; 0x1
33f8adfc:	158dc008 	strne	ip, [sp, #8]
33f8ae00:	1a000006 	bne	33f8ae20 <number+0xa4>
33f8ae04:	e31a0008 	tst	sl, #8	; 0x8
33f8ae08:	13a02020 	movne	r2, #32	; 0x20
33f8ae0c:	12466001 	subne	r6, r6, #1	; 0x1
33f8ae10:	158d2008 	strne	r2, [sp, #8]
33f8ae14:	1a000001 	bne	33f8ae20 <number+0xa4>
33f8ae18:	e3a03000 	mov	r3, #0	; 0x0
33f8ae1c:	e58d3008 	str	r3, [sp, #8]
33f8ae20:	e21ac020 	ands	ip, sl, #32	; 0x20
33f8ae24:	e58dc000 	str	ip, [sp]
33f8ae28:	0a000004 	beq	33f8ae40 <number+0xc4>
33f8ae2c:	e3590010 	cmp	r9, #16	; 0x10
33f8ae30:	02466002 	subeq	r6, r6, #2	; 0x2
33f8ae34:	0a000001 	beq	33f8ae40 <number+0xc4>
33f8ae38:	e3590008 	cmp	r9, #8	; 0x8
33f8ae3c:	02466001 	subeq	r6, r6, #1	; 0x1
33f8ae40:	e3570000 	cmp	r7, #0	; 0x0
33f8ae44:	03a03030 	moveq	r3, #48	; 0x30
33f8ae48:	03a0b001 	moveq	fp, #1	; 0x1
33f8ae4c:	05cd3012 	streqb	r3, [sp, #18]
33f8ae50:	0a00000f 	beq	33f8ae94 <number+0x118>
33f8ae54:	e3a0b000 	mov	fp, #0	; 0x0
33f8ae58:	e1a01009 	mov	r1, r9
33f8ae5c:	e1a00007 	mov	r0, r7
33f8ae60:	ebffd74c 	bl	33f80b98 <__udivsi3>
33f8ae64:	e1a04007 	mov	r4, r7
33f8ae68:	e1a01009 	mov	r1, r9
33f8ae6c:	e1a07000 	mov	r7, r0
33f8ae70:	e1a00004 	mov	r0, r4
33f8ae74:	eb0010a0 	bl	33f8f0fc <__umodsi3>
33f8ae78:	e59d300c 	ldr	r3, [sp, #12]
33f8ae7c:	e7d32000 	ldrb	r2, [r3, r0]
33f8ae80:	e3570000 	cmp	r7, #0	; 0x0
33f8ae84:	e28d3012 	add	r3, sp, #18	; 0x12
33f8ae88:	e7cb2003 	strb	r2, [fp, r3]
33f8ae8c:	e28bb001 	add	fp, fp, #1	; 0x1
33f8ae90:	1afffff0 	bne	33f8ae58 <number+0xdc>
33f8ae94:	e59d3074 	ldr	r3, [sp, #116]
33f8ae98:	e15b0003 	cmp	fp, r3
33f8ae9c:	a1a0000b 	movge	r0, fp
33f8aea0:	b1a00003 	movlt	r0, r3
33f8aea4:	e0601006 	rsb	r1, r0, r6
33f8aea8:	e31a0011 	tst	sl, #17	; 0x11
33f8aeac:	01a02001 	moveq	r2, r1
33f8aeb0:	0a000002 	beq	33f8aec0 <number+0x144>
33f8aeb4:	ea000006 	b	33f8aed4 <number+0x158>
33f8aeb8:	e3a03020 	mov	r3, #32	; 0x20
33f8aebc:	e4c53001 	strb	r3, [r5], #1
33f8aec0:	e3520000 	cmp	r2, #0	; 0x0
33f8aec4:	e2423001 	sub	r3, r2, #1	; 0x1
33f8aec8:	e1a02003 	mov	r2, r3
33f8aecc:	cafffff9 	bgt	33f8aeb8 <number+0x13c>
33f8aed0:	e1a01003 	mov	r1, r3
33f8aed4:	e59dc008 	ldr	ip, [sp, #8]
33f8aed8:	e35c0000 	cmp	ip, #0	; 0x0
33f8aedc:	14c5c001 	strneb	ip, [r5], #1
33f8aee0:	e59d2000 	ldr	r2, [sp]
33f8aee4:	e3520000 	cmp	r2, #0	; 0x0
33f8aee8:	0a00000c 	beq	33f8af20 <number+0x1a4>
33f8aeec:	e3590008 	cmp	r9, #8	; 0x8
33f8aef0:	03a03030 	moveq	r3, #48	; 0x30
33f8aef4:	04c53001 	streqb	r3, [r5], #1
33f8aef8:	0a000008 	beq	33f8af20 <number+0x1a4>
33f8aefc:	e3590010 	cmp	r9, #16	; 0x10
33f8af00:	1a000006 	bne	33f8af20 <number+0x1a4>
33f8af04:	e1a03005 	mov	r3, r5
33f8af08:	e3a02030 	mov	r2, #48	; 0x30
33f8af0c:	e4c32001 	strb	r2, [r3], #1
33f8af10:	e59dc00c 	ldr	ip, [sp, #12]
33f8af14:	e5dc2021 	ldrb	r2, [ip, #33]
33f8af18:	e5c52001 	strb	r2, [r5, #1]
33f8af1c:	e2835001 	add	r5, r3, #1	; 0x1
33f8af20:	e31a0010 	tst	sl, #16	; 0x10
33f8af24:	01a03001 	moveq	r3, r1
33f8af28:	0a000002 	beq	33f8af38 <number+0x1bc>
33f8af2c:	ea000006 	b	33f8af4c <number+0x1d0>
33f8af30:	e59d2004 	ldr	r2, [sp, #4]
33f8af34:	e4c52001 	strb	r2, [r5], #1
33f8af38:	e3530000 	cmp	r3, #0	; 0x0
33f8af3c:	e2432001 	sub	r2, r3, #1	; 0x1
33f8af40:	e1a03002 	mov	r3, r2
33f8af44:	cafffff9 	bgt	33f8af30 <number+0x1b4>
33f8af48:	e1a01002 	mov	r1, r2
33f8af4c:	e1a02000 	mov	r2, r0
33f8af50:	ea000001 	b	33f8af5c <number+0x1e0>
33f8af54:	e3a03030 	mov	r3, #48	; 0x30
33f8af58:	e4c53001 	strb	r3, [r5], #1
33f8af5c:	e15b0002 	cmp	fp, r2
33f8af60:	e2422001 	sub	r2, r2, #1	; 0x1
33f8af64:	bafffffa 	blt	33f8af54 <number+0x1d8>
33f8af68:	ea000001 	b	33f8af74 <number+0x1f8>
33f8af6c:	e5533042 	ldrb	r3, [r3, #-66]
33f8af70:	e4c53001 	strb	r3, [r5], #1
33f8af74:	e35b0000 	cmp	fp, #0	; 0x0
33f8af78:	e28dc054 	add	ip, sp, #84	; 0x54
33f8af7c:	e24bb001 	sub	fp, fp, #1	; 0x1
33f8af80:	e08c300b 	add	r3, ip, fp
33f8af84:	cafffff8 	bgt	33f8af6c <number+0x1f0>
33f8af88:	e1a02001 	mov	r2, r1
33f8af8c:	ea000001 	b	33f8af98 <number+0x21c>
33f8af90:	e3a03020 	mov	r3, #32	; 0x20
33f8af94:	e4c53001 	strb	r3, [r5], #1
33f8af98:	e3520000 	cmp	r2, #0	; 0x0
33f8af9c:	e2422001 	sub	r2, r2, #1	; 0x1
33f8afa0:	cafffffa 	bgt	33f8af90 <number+0x214>
33f8afa4:	e1a00005 	mov	r0, r5
33f8afa8:	e28dd054 	add	sp, sp, #84	; 0x54
33f8afac:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8afb0:	33f94d20 	mvnccs	r4, #2048	; 0x800
33f8afb4:	33f94cf8 	mvnccs	r4, #63488	; 0xf800

33f8afb8 <panic>:
33f8afb8:	e92d000f 	stmdb	sp!, {r0, r1, r2, r3}
33f8afbc:	e52de004 	str	lr, [sp, #-4]!
33f8afc0:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8afc4:	e28d300c 	add	r3, sp, #12	; 0xc
33f8afc8:	e1a01003 	mov	r1, r3
33f8afcc:	e59d0008 	ldr	r0, [sp, #8]
33f8afd0:	e58d3000 	str	r3, [sp]
33f8afd4:	ebfff315 	bl	33f87c30 <vprintf>
33f8afd8:	e3a0000a 	mov	r0, #10	; 0xa
33f8afdc:	ebfff3a5 	bl	33f87e78 <putc>
33f8afe0:	e59f0024 	ldr	r0, [pc, #36]	; 33f8b00c <.text+0xb00c>
33f8afe4:	ebffd62d 	bl	33f808a0 <udelay>
33f8afe8:	e3a00000 	mov	r0, #0	; 0x0
33f8afec:	e1a01000 	mov	r1, r0
33f8aff0:	e1a02000 	mov	r2, r0
33f8aff4:	e1a03000 	mov	r3, r0
33f8aff8:	eb000cd4 	bl	33f8e350 <do_reset>
33f8affc:	e28dd004 	add	sp, sp, #4	; 0x4
33f8b000:	e49de004 	ldr	lr, [sp], #4
33f8b004:	e28dd010 	add	sp, sp, #16	; 0x10
33f8b008:	e1a0f00e 	mov	pc, lr
33f8b00c:	000186a0 	andeq	r8, r1, r0, lsr #13

33f8b010 <vsprintf>:
33f8b010:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f8b014:	e1a09000 	mov	r9, r0
33f8b018:	e24dd00c 	sub	sp, sp, #12	; 0xc
33f8b01c:	e1a04002 	mov	r4, r2
33f8b020:	e1a07000 	mov	r7, r0
33f8b024:	e58d1008 	str	r1, [sp, #8]
33f8b028:	ea0000e7 	b	33f8b3cc <vsprintf+0x3bc>
33f8b02c:	e3530025 	cmp	r3, #37	; 0x25
33f8b030:	03a0a000 	moveq	sl, #0	; 0x0
33f8b034:	1a0000b8 	bne	33f8b31c <vsprintf+0x30c>
33f8b038:	e59d3008 	ldr	r3, [sp, #8]
33f8b03c:	e2831001 	add	r1, r3, #1	; 0x1
33f8b040:	e58d1008 	str	r1, [sp, #8]
33f8b044:	e5d32001 	ldrb	r2, [r3, #1]
33f8b048:	e352002b 	cmp	r2, #43	; 0x2b
33f8b04c:	0a00000c 	beq	33f8b084 <vsprintf+0x74>
33f8b050:	8a000004 	bhi	33f8b068 <vsprintf+0x58>
33f8b054:	e3520020 	cmp	r2, #32	; 0x20
33f8b058:	0a00000b 	beq	33f8b08c <vsprintf+0x7c>
33f8b05c:	e3520023 	cmp	r2, #35	; 0x23
33f8b060:	1a00000f 	bne	33f8b0a4 <vsprintf+0x94>
33f8b064:	ea00000a 	b	33f8b094 <vsprintf+0x84>
33f8b068:	e352002d 	cmp	r2, #45	; 0x2d
33f8b06c:	0a000002 	beq	33f8b07c <vsprintf+0x6c>
33f8b070:	e3520030 	cmp	r2, #48	; 0x30
33f8b074:	1a00000a 	bne	33f8b0a4 <vsprintf+0x94>
33f8b078:	ea000007 	b	33f8b09c <vsprintf+0x8c>
33f8b07c:	e38aa010 	orr	sl, sl, #16	; 0x10
33f8b080:	eaffffec 	b	33f8b038 <vsprintf+0x28>
33f8b084:	e38aa004 	orr	sl, sl, #4	; 0x4
33f8b088:	eaffffea 	b	33f8b038 <vsprintf+0x28>
33f8b08c:	e38aa008 	orr	sl, sl, #8	; 0x8
33f8b090:	eaffffe8 	b	33f8b038 <vsprintf+0x28>
33f8b094:	e38aa020 	orr	sl, sl, #32	; 0x20
33f8b098:	eaffffe6 	b	33f8b038 <vsprintf+0x28>
33f8b09c:	e38aa001 	orr	sl, sl, #1	; 0x1
33f8b0a0:	eaffffe4 	b	33f8b038 <vsprintf+0x28>
33f8b0a4:	e2423030 	sub	r3, r2, #48	; 0x30
33f8b0a8:	e3530009 	cmp	r3, #9	; 0x9
33f8b0ac:	8a000003 	bhi	33f8b0c0 <vsprintf+0xb0>
33f8b0b0:	e28d0008 	add	r0, sp, #8	; 0x8
33f8b0b4:	ebffff21 	bl	33f8ad40 <skip_atoi>
33f8b0b8:	e1a06000 	mov	r6, r0
33f8b0bc:	ea000009 	b	33f8b0e8 <vsprintf+0xd8>
33f8b0c0:	e352002a 	cmp	r2, #42	; 0x2a
33f8b0c4:	13e06000 	mvnne	r6, #0	; 0x0
33f8b0c8:	1a000006 	bne	33f8b0e8 <vsprintf+0xd8>
33f8b0cc:	e2813001 	add	r3, r1, #1	; 0x1
33f8b0d0:	e58d3008 	str	r3, [sp, #8]
33f8b0d4:	e5946000 	ldr	r6, [r4]
33f8b0d8:	e3560000 	cmp	r6, #0	; 0x0
33f8b0dc:	e2844004 	add	r4, r4, #4	; 0x4
33f8b0e0:	b2666000 	rsblt	r6, r6, #0	; 0x0
33f8b0e4:	b38aa010 	orrlt	sl, sl, #16	; 0x10
33f8b0e8:	e59d2008 	ldr	r2, [sp, #8]
33f8b0ec:	e5d23000 	ldrb	r3, [r2]
33f8b0f0:	e353002e 	cmp	r3, #46	; 0x2e
33f8b0f4:	13e0e000 	mvnne	lr, #0	; 0x0
33f8b0f8:	1a000012 	bne	33f8b148 <vsprintf+0x138>
33f8b0fc:	e2821001 	add	r1, r2, #1	; 0x1
33f8b100:	e58d1008 	str	r1, [sp, #8]
33f8b104:	e5d22001 	ldrb	r2, [r2, #1]
33f8b108:	e2423030 	sub	r3, r2, #48	; 0x30
33f8b10c:	e3530009 	cmp	r3, #9	; 0x9
33f8b110:	8a000003 	bhi	33f8b124 <vsprintf+0x114>
33f8b114:	e28d0008 	add	r0, sp, #8	; 0x8
33f8b118:	ebffff08 	bl	33f8ad40 <skip_atoi>
33f8b11c:	e1a0e000 	mov	lr, r0
33f8b120:	ea000005 	b	33f8b13c <vsprintf+0x12c>
33f8b124:	e352002a 	cmp	r2, #42	; 0x2a
33f8b128:	1a000005 	bne	33f8b144 <vsprintf+0x134>
33f8b12c:	e2813001 	add	r3, r1, #1	; 0x1
33f8b130:	e58d3008 	str	r3, [sp, #8]
33f8b134:	e594e000 	ldr	lr, [r4]
33f8b138:	e2844004 	add	r4, r4, #4	; 0x4
33f8b13c:	e35e0000 	cmp	lr, #0	; 0x0
33f8b140:	aa000000 	bge	33f8b148 <vsprintf+0x138>
33f8b144:	e3a0e000 	mov	lr, #0	; 0x0
33f8b148:	e59d3008 	ldr	r3, [sp, #8]
33f8b14c:	e5d32000 	ldrb	r2, [r3]
33f8b150:	e352006c 	cmp	r2, #108	; 0x6c
33f8b154:	13520068 	cmpne	r2, #104	; 0x68
33f8b158:	0a000002 	beq	33f8b168 <vsprintf+0x158>
33f8b15c:	e3520071 	cmp	r2, #113	; 0x71
33f8b160:	13e02000 	mvnne	r2, #0	; 0x0
33f8b164:	1a000001 	bne	33f8b170 <vsprintf+0x160>
33f8b168:	e2833001 	add	r3, r3, #1	; 0x1
33f8b16c:	e58d3008 	str	r3, [sp, #8]
33f8b170:	e59d3008 	ldr	r3, [sp, #8]
33f8b174:	e5d33000 	ldrb	r3, [r3]
33f8b178:	e353006e 	cmp	r3, #110	; 0x6e
33f8b17c:	0a000060 	beq	33f8b304 <vsprintf+0x2f4>
33f8b180:	8a00000c 	bhi	33f8b1b8 <vsprintf+0x1a8>
33f8b184:	e3530063 	cmp	r3, #99	; 0x63
33f8b188:	0a000017 	beq	33f8b1ec <vsprintf+0x1dc>
33f8b18c:	8a000004 	bhi	33f8b1a4 <vsprintf+0x194>
33f8b190:	e3530025 	cmp	r3, #37	; 0x25
33f8b194:	0a000060 	beq	33f8b31c <vsprintf+0x30c>
33f8b198:	e3530058 	cmp	r3, #88	; 0x58
33f8b19c:	1a000067 	bne	33f8b340 <vsprintf+0x330>
33f8b1a0:	ea000061 	b	33f8b32c <vsprintf+0x31c>
33f8b1a4:	e3530064 	cmp	r3, #100	; 0x64
33f8b1a8:	0a000062 	beq	33f8b338 <vsprintf+0x328>
33f8b1ac:	e3530069 	cmp	r3, #105	; 0x69
33f8b1b0:	1a000062 	bne	33f8b340 <vsprintf+0x330>
33f8b1b4:	ea00005f 	b	33f8b338 <vsprintf+0x328>
33f8b1b8:	e3530073 	cmp	r3, #115	; 0x73
33f8b1bc:	0a00001e 	beq	33f8b23c <vsprintf+0x22c>
33f8b1c0:	8a000004 	bhi	33f8b1d8 <vsprintf+0x1c8>
33f8b1c4:	e353006f 	cmp	r3, #111	; 0x6f
33f8b1c8:	0a000055 	beq	33f8b324 <vsprintf+0x314>
33f8b1cc:	e3530070 	cmp	r3, #112	; 0x70
33f8b1d0:	1a00005a 	bne	33f8b340 <vsprintf+0x330>
33f8b1d4:	ea00003c 	b	33f8b2cc <vsprintf+0x2bc>
33f8b1d8:	e3530075 	cmp	r3, #117	; 0x75
33f8b1dc:	0a000060 	beq	33f8b364 <vsprintf+0x354>
33f8b1e0:	e3530078 	cmp	r3, #120	; 0x78
33f8b1e4:	1a000055 	bne	33f8b340 <vsprintf+0x330>
33f8b1e8:	ea000050 	b	33f8b330 <vsprintf+0x320>
33f8b1ec:	e31a0010 	tst	sl, #16	; 0x10
33f8b1f0:	0a000002 	beq	33f8b200 <vsprintf+0x1f0>
33f8b1f4:	ea000004 	b	33f8b20c <vsprintf+0x1fc>
33f8b1f8:	e3a03020 	mov	r3, #32	; 0x20
33f8b1fc:	e4c73001 	strb	r3, [r7], #1
33f8b200:	e2466001 	sub	r6, r6, #1	; 0x1
33f8b204:	e3560000 	cmp	r6, #0	; 0x0
33f8b208:	cafffffa 	bgt	33f8b1f8 <vsprintf+0x1e8>
33f8b20c:	e5943000 	ldr	r3, [r4]
33f8b210:	e1a02007 	mov	r2, r7
33f8b214:	e5c73000 	strb	r3, [r7]
33f8b218:	ea000001 	b	33f8b224 <vsprintf+0x214>
33f8b21c:	e3a03020 	mov	r3, #32	; 0x20
33f8b220:	e5c23000 	strb	r3, [r2]
33f8b224:	e2466001 	sub	r6, r6, #1	; 0x1
33f8b228:	e3560000 	cmp	r6, #0	; 0x0
33f8b22c:	e2822001 	add	r2, r2, #1	; 0x1
33f8b230:	cafffff9 	bgt	33f8b21c <vsprintf+0x20c>
33f8b234:	e1a07002 	mov	r7, r2
33f8b238:	ea000021 	b	33f8b2c4 <vsprintf+0x2b4>
33f8b23c:	e5945000 	ldr	r5, [r4]
33f8b240:	e59f31a4 	ldr	r3, [pc, #420]	; 33f8b3ec <.text+0xb3ec>
33f8b244:	e3550000 	cmp	r5, #0	; 0x0
33f8b248:	01a05003 	moveq	r5, r3
33f8b24c:	e1a0100e 	mov	r1, lr
33f8b250:	e1a00005 	mov	r0, r5
33f8b254:	ebfffd9a 	bl	33f8a8c4 <strnlen>
33f8b258:	e31a0010 	tst	sl, #16	; 0x10
33f8b25c:	e1a01000 	mov	r1, r0
33f8b260:	01a00006 	moveq	r0, r6
33f8b264:	0a000002 	beq	33f8b274 <vsprintf+0x264>
33f8b268:	ea000006 	b	33f8b288 <vsprintf+0x278>
33f8b26c:	e3a03020 	mov	r3, #32	; 0x20
33f8b270:	e4c73001 	strb	r3, [r7], #1
33f8b274:	e1510000 	cmp	r1, r0
33f8b278:	e2403001 	sub	r3, r0, #1	; 0x1
33f8b27c:	e1a00003 	mov	r0, r3
33f8b280:	bafffff9 	blt	33f8b26c <vsprintf+0x25c>
33f8b284:	e1a06003 	mov	r6, r3
33f8b288:	e3a02000 	mov	r2, #0	; 0x0
33f8b28c:	ea000002 	b	33f8b29c <vsprintf+0x28c>
33f8b290:	e7d23005 	ldrb	r3, [r2, r5]
33f8b294:	e7c23007 	strb	r3, [r2, r7]
33f8b298:	e2822001 	add	r2, r2, #1	; 0x1
33f8b29c:	e1520001 	cmp	r2, r1
33f8b2a0:	bafffffa 	blt	33f8b290 <vsprintf+0x280>
33f8b2a4:	e0877002 	add	r7, r7, r2
33f8b2a8:	e1a00006 	mov	r0, r6
33f8b2ac:	ea000001 	b	33f8b2b8 <vsprintf+0x2a8>
33f8b2b0:	e3a03020 	mov	r3, #32	; 0x20
33f8b2b4:	e4c73001 	strb	r3, [r7], #1
33f8b2b8:	e1510000 	cmp	r1, r0
33f8b2bc:	e2400001 	sub	r0, r0, #1	; 0x1
33f8b2c0:	bafffffa 	blt	33f8b2b0 <vsprintf+0x2a0>
33f8b2c4:	e2844004 	add	r4, r4, #4	; 0x4
33f8b2c8:	ea00003c 	b	33f8b3c0 <vsprintf+0x3b0>
33f8b2cc:	e3760001 	cmn	r6, #1	; 0x1
33f8b2d0:	038aa001 	orreq	sl, sl, #1	; 0x1
33f8b2d4:	e58de000 	str	lr, [sp]
33f8b2d8:	e58da004 	str	sl, [sp, #4]
33f8b2dc:	02866009 	addeq	r6, r6, #9	; 0x9
33f8b2e0:	e1a00007 	mov	r0, r7
33f8b2e4:	e5941000 	ldr	r1, [r4]
33f8b2e8:	e1a03006 	mov	r3, r6
33f8b2ec:	e3a02010 	mov	r2, #16	; 0x10
33f8b2f0:	ebfffea1 	bl	33f8ad7c <number>
33f8b2f4:	e2843004 	add	r3, r4, #4	; 0x4
33f8b2f8:	e1a07000 	mov	r7, r0
33f8b2fc:	e1a04003 	mov	r4, r3
33f8b300:	ea00002e 	b	33f8b3c0 <vsprintf+0x3b0>
33f8b304:	e5941000 	ldr	r1, [r4]
33f8b308:	e2842004 	add	r2, r4, #4	; 0x4
33f8b30c:	e0693007 	rsb	r3, r9, r7
33f8b310:	e1a04002 	mov	r4, r2
33f8b314:	e5813000 	str	r3, [r1]
33f8b318:	ea000028 	b	33f8b3c0 <vsprintf+0x3b0>
33f8b31c:	e4c73001 	strb	r3, [r7], #1
33f8b320:	ea000026 	b	33f8b3c0 <vsprintf+0x3b0>
33f8b324:	e3a0c008 	mov	ip, #8	; 0x8
33f8b328:	ea00000e 	b	33f8b368 <vsprintf+0x358>
33f8b32c:	e38aa040 	orr	sl, sl, #64	; 0x40
33f8b330:	e3a0c010 	mov	ip, #16	; 0x10
33f8b334:	ea00000b 	b	33f8b368 <vsprintf+0x358>
33f8b338:	e38aa002 	orr	sl, sl, #2	; 0x2
33f8b33c:	ea000008 	b	33f8b364 <vsprintf+0x354>
33f8b340:	e3a03025 	mov	r3, #37	; 0x25
33f8b344:	e4c73001 	strb	r3, [r7], #1
33f8b348:	e59d3008 	ldr	r3, [sp, #8]
33f8b34c:	e5d32000 	ldrb	r2, [r3]
33f8b350:	e3520000 	cmp	r2, #0	; 0x0
33f8b354:	14c72001 	strneb	r2, [r7], #1
33f8b358:	02433001 	subeq	r3, r3, #1	; 0x1
33f8b35c:	058d3008 	streq	r3, [sp, #8]
33f8b360:	ea000016 	b	33f8b3c0 <vsprintf+0x3b0>
33f8b364:	e3a0c00a 	mov	ip, #10	; 0xa
33f8b368:	e352006c 	cmp	r2, #108	; 0x6c
33f8b36c:	05941000 	ldreq	r1, [r4]
33f8b370:	02844004 	addeq	r4, r4, #4	; 0x4
33f8b374:	0a00000a 	beq	33f8b3a4 <vsprintf+0x394>
33f8b378:	e3520068 	cmp	r2, #104	; 0x68
33f8b37c:	12842004 	addne	r2, r4, #4	; 0x4
33f8b380:	15941000 	ldrne	r1, [r4]
33f8b384:	e20a3002 	and	r3, sl, #2	; 0x2
33f8b388:	11a04002 	movne	r4, r2
33f8b38c:	1a000004 	bne	33f8b3a4 <vsprintf+0x394>
33f8b390:	e1d410b0 	ldrh	r1, [r4]
33f8b394:	e3530000 	cmp	r3, #0	; 0x0
33f8b398:	11a03801 	movne	r3, r1, lsl #16
33f8b39c:	e2844004 	add	r4, r4, #4	; 0x4
33f8b3a0:	11a01843 	movne	r1, r3, asr #16
33f8b3a4:	e1a00007 	mov	r0, r7
33f8b3a8:	e1a0200c 	mov	r2, ip
33f8b3ac:	e1a03006 	mov	r3, r6
33f8b3b0:	e58de000 	str	lr, [sp]
33f8b3b4:	e58da004 	str	sl, [sp, #4]
33f8b3b8:	ebfffe6f 	bl	33f8ad7c <number>
33f8b3bc:	e1a07000 	mov	r7, r0
33f8b3c0:	e59d3008 	ldr	r3, [sp, #8]
33f8b3c4:	e2833001 	add	r3, r3, #1	; 0x1
33f8b3c8:	e58d3008 	str	r3, [sp, #8]
33f8b3cc:	e59d3008 	ldr	r3, [sp, #8]
33f8b3d0:	e5d33000 	ldrb	r3, [r3]
33f8b3d4:	e3530000 	cmp	r3, #0	; 0x0
33f8b3d8:	1affff13 	bne	33f8b02c <vsprintf+0x1c>
33f8b3dc:	e0690007 	rsb	r0, r9, r7
33f8b3e0:	e5c73000 	strb	r3, [r7]
33f8b3e4:	e28dd00c 	add	sp, sp, #12	; 0xc
33f8b3e8:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f8b3ec:	33f94d48 	mvnccs	r4, #4608	; 0x1200

33f8b3f0 <sprintf>:
33f8b3f0:	e92d000e 	stmdb	sp!, {r1, r2, r3}
33f8b3f4:	e52de004 	str	lr, [sp, #-4]!
33f8b3f8:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8b3fc:	e28d300c 	add	r3, sp, #12	; 0xc
33f8b400:	e1a02003 	mov	r2, r3
33f8b404:	e59d1008 	ldr	r1, [sp, #8]
33f8b408:	e58d3000 	str	r3, [sp]
33f8b40c:	ebfffeff 	bl	33f8b010 <vsprintf>
33f8b410:	e28dd004 	add	sp, sp, #4	; 0x4
33f8b414:	e49de004 	ldr	lr, [sp], #4
33f8b418:	e28dd00c 	add	sp, sp, #12	; 0xc
33f8b41c:	e1a0f00e 	mov	pc, lr

33f8b420 <falloc>:
33f8b420:	e59f3014 	ldr	r3, [pc, #20]	; 33f8b43c <.text+0xb43c>
33f8b424:	e5930000 	ldr	r0, [r3]
33f8b428:	e0610000 	rsb	r0, r1, r0
33f8b42c:	e5830000 	str	r0, [r3]
33f8b430:	e59f3008 	ldr	r3, [pc, #8]	; 33f8b440 <.text+0xb440>
33f8b434:	e0830180 	add	r0, r3, r0, lsl #3
33f8b438:	e1a0f00e 	mov	pc, lr
33f8b43c:	33f95dd4 	mvnccs	r5, #13568	; 0x3500
33f8b440:	33f96b7c 	mvnccs	r6, #126976	; 0x1f000

33f8b444 <ffree>:
33f8b444:	e1a0f00e 	mov	pc, lr

33f8b448 <inflate_trees_free>:
33f8b448:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f8b44c:	e1a05001 	mov	r5, r1
33f8b450:	ea000005 	b	33f8b46c <inflate_trees_free+0x24>
33f8b454:	e9100014 	ldmdb	r0, {r2, r4}
33f8b458:	e1a02182 	mov	r2, r2, lsl #3
33f8b45c:	e5950028 	ldr	r0, [r5, #40]
33f8b460:	e1a0e00f 	mov	lr, pc
33f8b464:	e595f024 	ldr	pc, [r5, #36]
33f8b468:	e1a00004 	mov	r0, r4
33f8b46c:	e3500000 	cmp	r0, #0	; 0x0
33f8b470:	e2401008 	sub	r1, r0, #8	; 0x8
33f8b474:	1afffff6 	bne	33f8b454 <inflate_trees_free+0xc>
33f8b478:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

33f8b47c <huft_build>:
33f8b47c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8b480:	e24ddd16 	sub	sp, sp, #1408	; 0x580
33f8b484:	e24dd008 	sub	sp, sp, #8	; 0x8
33f8b488:	e3a0c000 	mov	ip, #0	; 0x0
33f8b48c:	e59de5b0 	ldr	lr, [sp, #1456]
33f8b490:	e58d2008 	str	r2, [sp, #8]
33f8b494:	e58d3004 	str	r3, [sp, #4]
33f8b498:	e58dc548 	str	ip, [sp, #1352]
33f8b49c:	e58dc50c 	str	ip, [sp, #1292]
33f8b4a0:	e58dc510 	str	ip, [sp, #1296]
33f8b4a4:	e58dc514 	str	ip, [sp, #1300]
33f8b4a8:	e58dc518 	str	ip, [sp, #1304]
33f8b4ac:	e58dc51c 	str	ip, [sp, #1308]
33f8b4b0:	e58dc520 	str	ip, [sp, #1312]
33f8b4b4:	e58dc524 	str	ip, [sp, #1316]
33f8b4b8:	e58dc528 	str	ip, [sp, #1320]
33f8b4bc:	e58dc52c 	str	ip, [sp, #1324]
33f8b4c0:	e58dc530 	str	ip, [sp, #1328]
33f8b4c4:	e58dc534 	str	ip, [sp, #1332]
33f8b4c8:	e58dc538 	str	ip, [sp, #1336]
33f8b4cc:	e58dc53c 	str	ip, [sp, #1340]
33f8b4d0:	e58dc540 	str	ip, [sp, #1344]
33f8b4d4:	e58dc544 	str	ip, [sp, #1348]
33f8b4d8:	e1a0a001 	mov	sl, r1
33f8b4dc:	e3a04000 	mov	r4, #0	; 0x0
33f8b4e0:	e3a05000 	mov	r5, #0	; 0x0
33f8b4e4:	e1a0c000 	mov	ip, r0
33f8b4e8:	e49c3004 	ldr	r3, [ip], #4
33f8b4ec:	e28d6d16 	add	r6, sp, #1408	; 0x580
33f8b4f0:	e2866008 	add	r6, r6, #8	; 0x8
33f8b4f4:	e0862103 	add	r2, r6, r3, lsl #2
33f8b4f8:	e512307c 	ldr	r3, [r2, #-124]
33f8b4fc:	e2511001 	subs	r1, r1, #1	; 0x1
33f8b500:	e2833001 	add	r3, r3, #1	; 0x1
33f8b504:	e502307c 	str	r3, [r2, #-124]
33f8b508:	1afffff6 	bne	33f8b4e8 <huft_build+0x6c>
33f8b50c:	e59d350c 	ldr	r3, [sp, #1292]
33f8b510:	e153000a 	cmp	r3, sl
33f8b514:	159e1000 	ldrne	r1, [lr]
33f8b518:	13a07001 	movne	r7, #1	; 0x1
33f8b51c:	158d1020 	strne	r1, [sp, #32]
33f8b520:	059dc5ac 	ldreq	ip, [sp, #1452]
33f8b524:	01a00001 	moveq	r0, r1
33f8b528:	058c1000 	streq	r1, [ip]
33f8b52c:	058e1000 	streq	r1, [lr]
33f8b530:	0a000152 	beq	33f8ba80 <huft_build+0x604>
33f8b534:	e28d3c05 	add	r3, sp, #1280	; 0x500
33f8b538:	e283300c 	add	r3, r3, #12	; 0xc
33f8b53c:	e7933107 	ldr	r3, [r3, r7, lsl #2]
33f8b540:	e3530000 	cmp	r3, #0	; 0x0
33f8b544:	1a000002 	bne	33f8b554 <huft_build+0xd8>
33f8b548:	e2877001 	add	r7, r7, #1	; 0x1
33f8b54c:	e3570010 	cmp	r7, #16	; 0x10
33f8b550:	1afffff7 	bne	33f8b534 <huft_build+0xb8>
33f8b554:	e59d2020 	ldr	r2, [sp, #32]
33f8b558:	e1520007 	cmp	r2, r7
33f8b55c:	31a02007 	movcc	r2, r7
33f8b560:	e58d701c 	str	r7, [sp, #28]
33f8b564:	e58d2020 	str	r2, [sp, #32]
33f8b568:	e3a0b00f 	mov	fp, #15	; 0xf
33f8b56c:	e28d6d16 	add	r6, sp, #1408	; 0x580
33f8b570:	e2866008 	add	r6, r6, #8	; 0x8
33f8b574:	e086310b 	add	r3, r6, fp, lsl #2
33f8b578:	e513307c 	ldr	r3, [r3, #-124]
33f8b57c:	e3530000 	cmp	r3, #0	; 0x0
33f8b580:	1a000001 	bne	33f8b58c <huft_build+0x110>
33f8b584:	e25bb001 	subs	fp, fp, #1	; 0x1
33f8b588:	1afffff7 	bne	33f8b56c <huft_build+0xf0>
33f8b58c:	e3a03001 	mov	r3, #1	; 0x1
33f8b590:	e1a01713 	mov	r1, r3, lsl r7
33f8b594:	e59dc020 	ldr	ip, [sp, #32]
33f8b598:	e28d3c05 	add	r3, sp, #1280	; 0x500
33f8b59c:	e15c000b 	cmp	ip, fp
33f8b5a0:	21a0c00b 	movcs	ip, fp
33f8b5a4:	e58dc020 	str	ip, [sp, #32]
33f8b5a8:	e283300c 	add	r3, r3, #12	; 0xc
33f8b5ac:	e083c107 	add	ip, r3, r7, lsl #2
33f8b5b0:	e59d3020 	ldr	r3, [sp, #32]
33f8b5b4:	e1a02007 	mov	r2, r7
33f8b5b8:	e58db014 	str	fp, [sp, #20]
33f8b5bc:	e58e3000 	str	r3, [lr]
33f8b5c0:	ea000003 	b	33f8b5d4 <huft_build+0x158>
33f8b5c4:	e49c3004 	ldr	r3, [ip], #4
33f8b5c8:	e0513003 	subs	r3, r1, r3
33f8b5cc:	4a00012a 	bmi	33f8ba7c <huft_build+0x600>
33f8b5d0:	e1a01083 	mov	r1, r3, lsl #1
33f8b5d4:	e152000b 	cmp	r2, fp
33f8b5d8:	e2822001 	add	r2, r2, #1	; 0x1
33f8b5dc:	3afffff8 	bcc	33f8b5c4 <huft_build+0x148>
33f8b5e0:	e28d6d16 	add	r6, sp, #1408	; 0x580
33f8b5e4:	e2866008 	add	r6, r6, #8	; 0x8
33f8b5e8:	e086e10b 	add	lr, r6, fp, lsl #2
33f8b5ec:	e51e207c 	ldr	r2, [lr, #-124]
33f8b5f0:	e0511002 	subs	r1, r1, r2
33f8b5f4:	e58d1044 	str	r1, [sp, #68]
33f8b5f8:	4a00011f 	bmi	33f8ba7c <huft_build+0x600>
33f8b5fc:	e3a03000 	mov	r3, #0	; 0x0
33f8b600:	e0822001 	add	r2, r2, r1
33f8b604:	e28d1e4d 	add	r1, sp, #1232	; 0x4d0
33f8b608:	e1a06003 	mov	r6, r3
33f8b60c:	e28dce51 	add	ip, sp, #1296	; 0x510
33f8b610:	e2811004 	add	r1, r1, #4	; 0x4
33f8b614:	e50e207c 	str	r2, [lr, #-124]
33f8b618:	e58d34d0 	str	r3, [sp, #1232]
33f8b61c:	ea000002 	b	33f8b62c <huft_build+0x1b0>
33f8b620:	e51c3004 	ldr	r3, [ip, #-4]
33f8b624:	e0866003 	add	r6, r6, r3
33f8b628:	e5016004 	str	r6, [r1, #-4]
33f8b62c:	e25bb001 	subs	fp, fp, #1	; 0x1
33f8b630:	e28cc004 	add	ip, ip, #4	; 0x4
33f8b634:	e2811004 	add	r1, r1, #4	; 0x4
33f8b638:	1afffff8 	bne	33f8b620 <huft_build+0x1a4>
33f8b63c:	e1a0c00b 	mov	ip, fp
33f8b640:	e4903004 	ldr	r3, [r0], #4
33f8b644:	e28ded16 	add	lr, sp, #1408	; 0x580
33f8b648:	e28ee008 	add	lr, lr, #8	; 0x8
33f8b64c:	e3530000 	cmp	r3, #0	; 0x0
33f8b650:	e08e1103 	add	r1, lr, r3, lsl #2
33f8b654:	151130bc 	ldrne	r3, [r1, #-188]
33f8b658:	12832001 	addne	r2, r3, #1	; 0x1
33f8b65c:	108e3103 	addne	r3, lr, r3, lsl #2
33f8b660:	1503c53c 	strne	ip, [r3, #-1340]
33f8b664:	e28cc001 	add	ip, ip, #1	; 0x1
33f8b668:	150120bc 	strne	r2, [r1, #-188]
33f8b66c:	e15c000a 	cmp	ip, sl
33f8b670:	3afffff2 	bcc	33f8b640 <huft_build+0x1c4>
33f8b674:	e28d2058 	add	r2, sp, #88	; 0x58
33f8b678:	e59d0020 	ldr	r0, [sp, #32]
33f8b67c:	e242200c 	sub	r2, r2, #12	; 0xc
33f8b680:	e28d3c05 	add	r3, sp, #1280	; 0x500
33f8b684:	e3a01000 	mov	r1, #0	; 0x0
33f8b688:	e082a10a 	add	sl, r2, sl, lsl #2
33f8b68c:	e2600000 	rsb	r0, r0, #0	; 0x0
33f8b690:	e283300c 	add	r3, r3, #12	; 0xc
33f8b694:	e0837107 	add	r7, r3, r7, lsl #2
33f8b698:	e58da00c 	str	sl, [sp, #12]
33f8b69c:	e58d2048 	str	r2, [sp, #72]
33f8b6a0:	e1a0a000 	mov	sl, r0
33f8b6a4:	e3e02000 	mvn	r2, #0	; 0x0
33f8b6a8:	e1a0e001 	mov	lr, r1
33f8b6ac:	e58d7034 	str	r7, [sp, #52]
33f8b6b0:	e58d1040 	str	r1, [sp, #64]
33f8b6b4:	e58d0038 	str	r0, [sp, #56]
33f8b6b8:	e58d7030 	str	r7, [sp, #48]
33f8b6bc:	e58d2018 	str	r2, [sp, #24]
33f8b6c0:	e58d14cc 	str	r1, [sp, #1228]
33f8b6c4:	e58d154c 	str	r1, [sp, #1356]
33f8b6c8:	ea0000dd 	b	33f8ba44 <huft_build+0x5c8>
33f8b6cc:	e59d3030 	ldr	r3, [sp, #48]
33f8b6d0:	e5933000 	ldr	r3, [r3]
33f8b6d4:	e58d3010 	str	r3, [sp, #16]
33f8b6d8:	ea0000b7 	b	33f8b9bc <huft_build+0x540>
33f8b6dc:	e3a03001 	mov	r3, #1	; 0x1
33f8b6e0:	e1a02913 	mov	r2, r3, lsl r9
33f8b6e4:	e59d6010 	ldr	r6, [sp, #16]
33f8b6e8:	e59de018 	ldr	lr, [sp, #24]
33f8b6ec:	e0863003 	add	r3, r6, r3
33f8b6f0:	e28ee001 	add	lr, lr, #1	; 0x1
33f8b6f4:	e1520003 	cmp	r2, r3
33f8b6f8:	e58de018 	str	lr, [sp, #24]
33f8b6fc:	9a000013 	bls	33f8b750 <huft_build+0x2d4>
33f8b700:	e59d0020 	ldr	r0, [sp, #32]
33f8b704:	e59d102c 	ldr	r1, [sp, #44]
33f8b708:	e1500001 	cmp	r0, r1
33f8b70c:	21a00001 	movcs	r0, r1
33f8b710:	e1590000 	cmp	r9, r0
33f8b714:	2a00000d 	bcs	33f8b750 <huft_build+0x2d4>
33f8b718:	e0663002 	rsb	r3, r6, r2
33f8b71c:	e59d1034 	ldr	r1, [sp, #52]
33f8b720:	e2433001 	sub	r3, r3, #1	; 0x1
33f8b724:	e1a06009 	mov	r6, r9
33f8b728:	ea000003 	b	33f8b73c <huft_build+0x2c0>
33f8b72c:	e5b13004 	ldr	r3, [r1, #4]!
33f8b730:	e1520003 	cmp	r2, r3
33f8b734:	9a000006 	bls	33f8b754 <huft_build+0x2d8>
33f8b738:	e0633002 	rsb	r3, r3, r2
33f8b73c:	e2866001 	add	r6, r6, #1	; 0x1
33f8b740:	e1560000 	cmp	r6, r0
33f8b744:	e1a02083 	mov	r2, r3, lsl #1
33f8b748:	1afffff7 	bne	33f8b72c <huft_build+0x2b0>
33f8b74c:	ea000000 	b	33f8b754 <huft_build+0x2d8>
33f8b750:	e1a06009 	mov	r6, r9
33f8b754:	e3a03001 	mov	r3, #1	; 0x1
33f8b758:	e1a03613 	mov	r3, r3, lsl r6
33f8b75c:	e59d25b4 	ldr	r2, [sp, #1460]
33f8b760:	e58d3040 	str	r3, [sp, #64]
33f8b764:	e2837001 	add	r7, r3, #1	; 0x1
33f8b768:	e5920028 	ldr	r0, [r2, #40]
33f8b76c:	e1a01007 	mov	r1, r7
33f8b770:	e58dc000 	str	ip, [sp]
33f8b774:	e3a02008 	mov	r2, #8	; 0x8
33f8b778:	e59d35b4 	ldr	r3, [sp, #1460]
33f8b77c:	e1a0e00f 	mov	lr, pc
33f8b780:	e593f020 	ldr	pc, [r3, #32]
33f8b784:	e3500000 	cmp	r0, #0	; 0x0
33f8b788:	e59dc000 	ldr	ip, [sp]
33f8b78c:	1a000006 	bne	33f8b7ac <huft_build+0x330>
33f8b790:	e59d6018 	ldr	r6, [sp, #24]
33f8b794:	e3560000 	cmp	r6, #0	; 0x0
33f8b798:	0a0000b5 	beq	33f8ba74 <huft_build+0x5f8>
33f8b79c:	e59d15b4 	ldr	r1, [sp, #1460]
33f8b7a0:	e59d054c 	ldr	r0, [sp, #1356]
33f8b7a4:	ebffff27 	bl	33f8b448 <inflate_trees_free>
33f8b7a8:	ea0000b1 	b	33f8ba74 <huft_build+0x5f8>
33f8b7ac:	e59de018 	ldr	lr, [sp, #24]
33f8b7b0:	e5807000 	str	r7, [r0]
33f8b7b4:	e59d15ac 	ldr	r1, [sp, #1452]
33f8b7b8:	e35e0000 	cmp	lr, #0	; 0x0
33f8b7bc:	e3a03000 	mov	r3, #0	; 0x0
33f8b7c0:	e280e008 	add	lr, r0, #8	; 0x8
33f8b7c4:	e581e000 	str	lr, [r1]
33f8b7c8:	e5803004 	str	r3, [r0, #4]
33f8b7cc:	e59d2024 	ldr	r2, [sp, #36]
33f8b7d0:	e2800004 	add	r0, r0, #4	; 0x4
33f8b7d4:	e582e000 	str	lr, [r2]
33f8b7d8:	e58d05ac 	str	r0, [sp, #1452]
33f8b7dc:	0a00000f 	beq	33f8b820 <huft_build+0x3a4>
33f8b7e0:	e59d303c 	ldr	r3, [sp, #60]
33f8b7e4:	e1a0033b 	mov	r0, fp, lsr r3
33f8b7e8:	e59d1020 	ldr	r1, [sp, #32]
33f8b7ec:	e3c43cff 	bic	r3, r4, #65280	; 0xff00
33f8b7f0:	e20120ff 	and	r2, r1, #255	; 0xff
33f8b7f4:	e1834402 	orr	r4, r3, r2, lsl #8
33f8b7f8:	e59d3024 	ldr	r3, [sp, #36]
33f8b7fc:	e5132004 	ldr	r2, [r3, #-4]
33f8b800:	e20610ff 	and	r1, r6, #255	; 0xff
33f8b804:	e3c430ff 	bic	r3, r4, #255	; 0xff
33f8b808:	e59d6028 	ldr	r6, [sp, #40]
33f8b80c:	e1814003 	orr	r4, r1, r3
33f8b810:	e0822180 	add	r2, r2, r0, lsl #3
33f8b814:	e1a0500e 	mov	r5, lr
33f8b818:	e586b004 	str	fp, [r6, #4]
33f8b81c:	e8820030 	stmia	r2, {r4, r5}
33f8b820:	e28d1024 	add	r1, sp, #36	; 0x24
33f8b824:	e8910006 	ldmia	r1, {r1, r2}
33f8b828:	e59d3038 	ldr	r3, [sp, #56]
33f8b82c:	e59d602c 	ldr	r6, [sp, #44]
33f8b830:	e59d0020 	ldr	r0, [sp, #32]
33f8b834:	e2811004 	add	r1, r1, #4	; 0x4
33f8b838:	e2822004 	add	r2, r2, #4	; 0x4
33f8b83c:	e0866003 	add	r6, r6, r3
33f8b840:	e58d1024 	str	r1, [sp, #36]
33f8b844:	e58d2028 	str	r2, [sp, #40]
33f8b848:	e58d602c 	str	r6, [sp, #44]
33f8b84c:	e08cc000 	add	ip, ip, r0
33f8b850:	e0899003 	add	r9, r9, r3
33f8b854:	e59d0020 	ldr	r0, [sp, #32]
33f8b858:	e59d101c 	ldr	r1, [sp, #28]
33f8b85c:	e08a3000 	add	r3, sl, r0
33f8b860:	e083300c 	add	r3, r3, ip
33f8b864:	e08a200c 	add	r2, sl, ip
33f8b868:	e1510003 	cmp	r1, r3
33f8b86c:	e58d203c 	str	r2, [sp, #60]
33f8b870:	caffff99 	bgt	33f8b6dc <huft_build+0x260>
33f8b874:	e0623001 	rsb	r3, r2, r1
33f8b878:	e59d6048 	ldr	r6, [sp, #72]
33f8b87c:	e59dc00c 	ldr	ip, [sp, #12]
33f8b880:	e20330ff 	and	r3, r3, #255	; 0xff
33f8b884:	e3c42cff 	bic	r2, r4, #65280	; 0xff00
33f8b888:	e156000c 	cmp	r6, ip
33f8b88c:	e1824403 	orr	r4, r2, r3, lsl #8
33f8b890:	23c4303f 	biccs	r3, r4, #63	; 0x3f
33f8b894:	238340c0 	orrcs	r4, r3, #192	; 0xc0
33f8b898:	2a00001b 	bcs	33f8b90c <huft_build+0x490>
33f8b89c:	e59d0048 	ldr	r0, [sp, #72]
33f8b8a0:	e59d2008 	ldr	r2, [sp, #8]
33f8b8a4:	e5901000 	ldr	r1, [r0]
33f8b8a8:	e1510002 	cmp	r1, r2
33f8b8ac:	2a000008 	bcs	33f8b8d4 <huft_build+0x458>
33f8b8b0:	e35100ff 	cmp	r1, #255	; 0xff
33f8b8b4:	83a02060 	movhi	r2, #96	; 0x60
33f8b8b8:	93a02000 	movls	r2, #0	; 0x0
33f8b8bc:	e3c430ff 	bic	r3, r4, #255	; 0xff
33f8b8c0:	e2800004 	add	r0, r0, #4	; 0x4
33f8b8c4:	e1824003 	orr	r4, r2, r3
33f8b8c8:	e1a05001 	mov	r5, r1
33f8b8cc:	e58d0048 	str	r0, [sp, #72]
33f8b8d0:	ea00000d 	b	33f8b90c <huft_build+0x490>
33f8b8d4:	e59d6008 	ldr	r6, [sp, #8]
33f8b8d8:	e59dc5a8 	ldr	ip, [sp, #1448]
33f8b8dc:	e0663001 	rsb	r3, r6, r1
33f8b8e0:	e1a03103 	mov	r3, r3, lsl #2
33f8b8e4:	e79c2003 	ldr	r2, [ip, r3]
33f8b8e8:	e2822050 	add	r2, r2, #80	; 0x50
33f8b8ec:	e3c410ff 	bic	r1, r4, #255	; 0xff
33f8b8f0:	e20220ff 	and	r2, r2, #255	; 0xff
33f8b8f4:	e1824001 	orr	r4, r2, r1
33f8b8f8:	e59d1048 	ldr	r1, [sp, #72]
33f8b8fc:	e59d0004 	ldr	r0, [sp, #4]
33f8b900:	e2811004 	add	r1, r1, #4	; 0x4
33f8b904:	e7905003 	ldr	r5, [r0, r3]
33f8b908:	e58d1048 	str	r1, [sp, #72]
33f8b90c:	e59d301c 	ldr	r3, [sp, #28]
33f8b910:	e59d603c 	ldr	r6, [sp, #60]
33f8b914:	e0662003 	rsb	r2, r6, r3
33f8b918:	e3a03001 	mov	r3, #1	; 0x1
33f8b91c:	e1a00213 	mov	r0, r3, lsl r2
33f8b920:	e1a0263b 	mov	r2, fp, lsr r6
33f8b924:	e1a0c180 	mov	ip, r0, lsl #3
33f8b928:	e08e1182 	add	r1, lr, r2, lsl #3
33f8b92c:	ea000002 	b	33f8b93c <huft_build+0x4c0>
33f8b930:	e3e03007 	mvn	r3, #7	; 0x7
33f8b934:	e0231390 	mla	r3, r0, r3, r1
33f8b938:	e8830030 	stmia	r3, {r4, r5}
33f8b93c:	e59d3040 	ldr	r3, [sp, #64]
33f8b940:	e1520003 	cmp	r2, r3
33f8b944:	e081100c 	add	r1, r1, ip
33f8b948:	e0822000 	add	r2, r2, r0
33f8b94c:	3afffff7 	bcc	33f8b930 <huft_build+0x4b4>
33f8b950:	e59d601c 	ldr	r6, [sp, #28]
33f8b954:	e3a03001 	mov	r3, #1	; 0x1
33f8b958:	e2462001 	sub	r2, r6, #1	; 0x1
33f8b95c:	e1a03213 	mov	r3, r3, lsl r2
33f8b960:	ea000001 	b	33f8b96c <huft_build+0x4f0>
33f8b964:	e1a0b001 	mov	fp, r1
33f8b968:	e1a030a3 	mov	r3, r3, lsr #1
33f8b96c:	e11b0003 	tst	fp, r3
33f8b970:	e02b1003 	eor	r1, fp, r3
33f8b974:	1afffffa 	bne	33f8b964 <huft_build+0x4e8>
33f8b978:	e59da03c 	ldr	sl, [sp, #60]
33f8b97c:	e1a0b001 	mov	fp, r1
33f8b980:	ea000004 	b	33f8b998 <huft_build+0x51c>
33f8b984:	e59dc018 	ldr	ip, [sp, #24]
33f8b988:	e59d0038 	ldr	r0, [sp, #56]
33f8b98c:	e24cc001 	sub	ip, ip, #1	; 0x1
33f8b990:	e58dc018 	str	ip, [sp, #24]
33f8b994:	e08aa000 	add	sl, sl, r0
33f8b998:	e3e03000 	mvn	r3, #0	; 0x0
33f8b99c:	e1c13a13 	bic	r3, r1, r3, lsl sl
33f8b9a0:	e28d6d16 	add	r6, sp, #1408	; 0x580
33f8b9a4:	e59dc018 	ldr	ip, [sp, #24]
33f8b9a8:	e2866008 	add	r6, r6, #8	; 0x8
33f8b9ac:	e086210c 	add	r2, r6, ip, lsl #2
33f8b9b0:	e51220bc 	ldr	r2, [r2, #-188]
33f8b9b4:	e1530002 	cmp	r3, r2
33f8b9b8:	1afffff1 	bne	33f8b984 <huft_build+0x508>
33f8b9bc:	e59d0010 	ldr	r0, [sp, #16]
33f8b9c0:	e2400001 	sub	r0, r0, #1	; 0x1
33f8b9c4:	e3700001 	cmn	r0, #1	; 0x1
33f8b9c8:	e58d0010 	str	r0, [sp, #16]
33f8b9cc:	0a000013 	beq	33f8ba20 <huft_build+0x5a4>
33f8b9d0:	e59d1018 	ldr	r1, [sp, #24]
33f8b9d4:	e28d6d16 	add	r6, sp, #1408	; 0x580
33f8b9d8:	e1a02101 	mov	r2, r1, lsl #2
33f8b9dc:	e2866008 	add	r6, r6, #8	; 0x8
33f8b9e0:	e59d3020 	ldr	r3, [sp, #32]
33f8b9e4:	e0821006 	add	r1, r2, r6
33f8b9e8:	e2411038 	sub	r1, r1, #56	; 0x38
33f8b9ec:	e59dc014 	ldr	ip, [sp, #20]
33f8b9f0:	e08a0003 	add	r0, sl, r3
33f8b9f4:	e58d1024 	str	r1, [sp, #36]
33f8b9f8:	e28d3d13 	add	r3, sp, #1216	; 0x4c0
33f8b9fc:	e59d101c 	ldr	r1, [sp, #28]
33f8ba00:	e060c00c 	rsb	ip, r0, ip
33f8ba04:	e283300c 	add	r3, r3, #12	; 0xc
33f8ba08:	e0833002 	add	r3, r3, r2
33f8ba0c:	e58dc02c 	str	ip, [sp, #44]
33f8ba10:	e0609001 	rsb	r9, r0, r1
33f8ba14:	e3a0c000 	mov	ip, #0	; 0x0
33f8ba18:	e58d3028 	str	r3, [sp, #40]
33f8ba1c:	eaffff8c 	b	33f8b854 <huft_build+0x3d8>
33f8ba20:	e59d201c 	ldr	r2, [sp, #28]
33f8ba24:	e28d3030 	add	r3, sp, #48	; 0x30
33f8ba28:	e8930048 	ldmia	r3, {r3, r6}
33f8ba2c:	e2822001 	add	r2, r2, #1	; 0x1
33f8ba30:	e2833004 	add	r3, r3, #4	; 0x4
33f8ba34:	e2866004 	add	r6, r6, #4	; 0x4
33f8ba38:	e58d201c 	str	r2, [sp, #28]
33f8ba3c:	e58d3030 	str	r3, [sp, #48]
33f8ba40:	e58d6034 	str	r6, [sp, #52]
33f8ba44:	e59dc01c 	ldr	ip, [sp, #28]
33f8ba48:	e59d0014 	ldr	r0, [sp, #20]
33f8ba4c:	e15c0000 	cmp	ip, r0
33f8ba50:	daffff1d 	ble	33f8b6cc <huft_build+0x250>
33f8ba54:	e59d1044 	ldr	r1, [sp, #68]
33f8ba58:	e3510000 	cmp	r1, #0	; 0x0
33f8ba5c:	13500001 	cmpne	r0, #1	; 0x1
33f8ba60:	03a03000 	moveq	r3, #0	; 0x0
33f8ba64:	13a03001 	movne	r3, #1	; 0x1
33f8ba68:	01a00003 	moveq	r0, r3
33f8ba6c:	13e00004 	mvnne	r0, #4	; 0x4
33f8ba70:	ea000002 	b	33f8ba80 <huft_build+0x604>
33f8ba74:	e3e00003 	mvn	r0, #3	; 0x3
33f8ba78:	ea000000 	b	33f8ba80 <huft_build+0x604>
33f8ba7c:	e3e00002 	mvn	r0, #2	; 0x2
33f8ba80:	e28ddf62 	add	sp, sp, #392	; 0x188
33f8ba84:	e28ddb01 	add	sp, sp, #1024	; 0x400
33f8ba88:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}

33f8ba8c <inflate_codes_new>:
33f8ba8c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f8ba90:	e59dc014 	ldr	ip, [sp, #20]
33f8ba94:	e1a05000 	mov	r5, r0
33f8ba98:	e1a06001 	mov	r6, r1
33f8ba9c:	e1a07002 	mov	r7, r2
33f8baa0:	e59c0028 	ldr	r0, [ip, #40]
33f8baa4:	e3a0201c 	mov	r2, #28	; 0x1c
33f8baa8:	e3a01001 	mov	r1, #1	; 0x1
33f8baac:	e1a04003 	mov	r4, r3
33f8bab0:	e1a0e00f 	mov	lr, pc
33f8bab4:	e59cf020 	ldr	pc, [ip, #32]
33f8bab8:	e2502000 	subs	r2, r0, #0	; 0x0
33f8babc:	08bd80f0 	ldmeqia	sp!, {r4, r5, r6, r7, pc}
33f8bac0:	e3a03000 	mov	r3, #0	; 0x0
33f8bac4:	e5824018 	str	r4, [r2, #24]
33f8bac8:	e5823000 	str	r3, [r2]
33f8bacc:	e5c25010 	strb	r5, [r2, #16]
33f8bad0:	e5c26011 	strb	r6, [r2, #17]
33f8bad4:	e5827014 	str	r7, [r2, #20]
33f8bad8:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

33f8badc <inflate_codes_free>:
33f8badc:	e52de004 	str	lr, [sp, #-4]!
33f8bae0:	e1a03001 	mov	r3, r1
33f8bae4:	e3a0201c 	mov	r2, #28	; 0x1c
33f8bae8:	e1a01000 	mov	r1, r0
33f8baec:	e5930028 	ldr	r0, [r3, #40]
33f8baf0:	e1a0e00f 	mov	lr, pc
33f8baf4:	e593f024 	ldr	pc, [r3, #36]
33f8baf8:	e49df004 	ldr	pc, [sp], #4

33f8bafc <inflate_blocks_reset>:
33f8bafc:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f8bb00:	e5903038 	ldr	r3, [r0, #56]
33f8bb04:	e3530000 	cmp	r3, #0	; 0x0
33f8bb08:	1590303c 	ldrne	r3, [r0, #60]
33f8bb0c:	15823000 	strne	r3, [r2]
33f8bb10:	e5903000 	ldr	r3, [r0]
33f8bb14:	e2433004 	sub	r3, r3, #4	; 0x4
33f8bb18:	e3530001 	cmp	r3, #1	; 0x1
33f8bb1c:	e1a04000 	mov	r4, r0
33f8bb20:	e1a06001 	mov	r6, r1
33f8bb24:	95902018 	ldrls	r2, [r0, #24]
33f8bb28:	95910028 	ldrls	r0, [r1, #40]
33f8bb2c:	91a02102 	movls	r2, r2, lsl #2
33f8bb30:	9594100c 	ldrls	r1, [r4, #12]
33f8bb34:	91a0e00f 	movls	lr, pc
33f8bb38:	9596f024 	ldrls	pc, [r6, #36]
33f8bb3c:	e5943000 	ldr	r3, [r4]
33f8bb40:	e3530006 	cmp	r3, #6	; 0x6
33f8bb44:	1a000008 	bne	33f8bb6c <inflate_blocks_reset+0x70>
33f8bb48:	e594000c 	ldr	r0, [r4, #12]
33f8bb4c:	e1a01006 	mov	r1, r6
33f8bb50:	ebffffe1 	bl	33f8badc <inflate_codes_free>
33f8bb54:	e1a01006 	mov	r1, r6
33f8bb58:	e5940008 	ldr	r0, [r4, #8]
33f8bb5c:	ebfffe39 	bl	33f8b448 <inflate_trees_free>
33f8bb60:	e5940004 	ldr	r0, [r4, #4]
33f8bb64:	e1a01006 	mov	r1, r6
33f8bb68:	ebfffe36 	bl	33f8b448 <inflate_trees_free>
33f8bb6c:	e594c038 	ldr	ip, [r4, #56]
33f8bb70:	e5943028 	ldr	r3, [r4, #40]
33f8bb74:	e3a05000 	mov	r5, #0	; 0x0
33f8bb78:	e35c0000 	cmp	ip, #0	; 0x0
33f8bb7c:	e5843030 	str	r3, [r4, #48]
33f8bb80:	e5845000 	str	r5, [r4]
33f8bb84:	e5845020 	str	r5, [r4, #32]
33f8bb88:	e5845024 	str	r5, [r4, #36]
33f8bb8c:	e5843034 	str	r3, [r4, #52]
33f8bb90:	0a000005 	beq	33f8bbac <inflate_blocks_reset+0xb0>
33f8bb94:	e1a00005 	mov	r0, r5
33f8bb98:	e1a01005 	mov	r1, r5
33f8bb9c:	e1a02005 	mov	r2, r5
33f8bba0:	e1a0e00f 	mov	lr, pc
33f8bba4:	e1a0f00c 	mov	pc, ip
33f8bba8:	e584003c 	str	r0, [r4, #60]
33f8bbac:	e5963030 	ldr	r3, [r6, #48]
33f8bbb0:	e3530000 	cmp	r3, #0	; 0x0
33f8bbb4:	08bd8070 	ldmeqia	sp!, {r4, r5, r6, pc}
33f8bbb8:	e1a00005 	mov	r0, r5
33f8bbbc:	e1a01005 	mov	r1, r5
33f8bbc0:	e1a0e00f 	mov	lr, pc
33f8bbc4:	e1a0f003 	mov	pc, r3
33f8bbc8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}

33f8bbcc <inflateEnd>:
33f8bbcc:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f8bbd0:	e2504000 	subs	r4, r0, #0	; 0x0
33f8bbd4:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8bbd8:	0a00001f 	beq	33f8bc5c <inflateEnd+0x90>
33f8bbdc:	e594001c 	ldr	r0, [r4, #28]
33f8bbe0:	e3500000 	cmp	r0, #0	; 0x0
33f8bbe4:	0a00001c 	beq	33f8bc5c <inflateEnd+0x90>
33f8bbe8:	e5943024 	ldr	r3, [r4, #36]
33f8bbec:	e3530000 	cmp	r3, #0	; 0x0
33f8bbf0:	0a000019 	beq	33f8bc5c <inflateEnd+0x90>
33f8bbf4:	e5905014 	ldr	r5, [r0, #20]
33f8bbf8:	e2550000 	subs	r0, r5, #0	; 0x0
33f8bbfc:	e1a01004 	mov	r1, r4
33f8bc00:	e1a0200d 	mov	r2, sp
33f8bc04:	0a00000b 	beq	33f8bc38 <inflateEnd+0x6c>
33f8bc08:	ebffffbb 	bl	33f8bafc <inflate_blocks_reset>
33f8bc0c:	e2851028 	add	r1, r5, #40	; 0x28
33f8bc10:	e8910006 	ldmia	r1, {r1, r2}
33f8bc14:	e5940028 	ldr	r0, [r4, #40]
33f8bc18:	e0612002 	rsb	r2, r1, r2
33f8bc1c:	e1a0e00f 	mov	lr, pc
33f8bc20:	e594f024 	ldr	pc, [r4, #36]
33f8bc24:	e1a01005 	mov	r1, r5
33f8bc28:	e5940028 	ldr	r0, [r4, #40]
33f8bc2c:	e3a02040 	mov	r2, #64	; 0x40
33f8bc30:	e1a0e00f 	mov	lr, pc
33f8bc34:	e594f024 	ldr	pc, [r4, #36]
33f8bc38:	e5940028 	ldr	r0, [r4, #40]
33f8bc3c:	e594101c 	ldr	r1, [r4, #28]
33f8bc40:	e3a02018 	mov	r2, #24	; 0x18
33f8bc44:	e1a0e00f 	mov	lr, pc
33f8bc48:	e594f024 	ldr	pc, [r4, #36]
33f8bc4c:	e3a03000 	mov	r3, #0	; 0x0
33f8bc50:	e1a00003 	mov	r0, r3
33f8bc54:	e584301c 	str	r3, [r4, #28]
33f8bc58:	ea000000 	b	33f8bc60 <inflateEnd+0x94>
33f8bc5c:	e3e00001 	mvn	r0, #1	; 0x1
33f8bc60:	e28dd004 	add	sp, sp, #4	; 0x4
33f8bc64:	e8bd8030 	ldmia	sp!, {r4, r5, pc}

33f8bc68 <inflateReset>:
33f8bc68:	e92d4010 	stmdb	sp!, {r4, lr}
33f8bc6c:	e3500000 	cmp	r0, #0	; 0x0
33f8bc70:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8bc74:	0a000012 	beq	33f8bcc4 <inflateReset+0x5c>
33f8bc78:	e590c01c 	ldr	ip, [r0, #28]
33f8bc7c:	e3a04000 	mov	r4, #0	; 0x0
33f8bc80:	e15c0004 	cmp	ip, r4
33f8bc84:	e1a01000 	mov	r1, r0
33f8bc88:	e1a0200d 	mov	r2, sp
33f8bc8c:	0a00000c 	beq	33f8bcc4 <inflateReset+0x5c>
33f8bc90:	e5804014 	str	r4, [r0, #20]
33f8bc94:	e5804008 	str	r4, [r0, #8]
33f8bc98:	e5804018 	str	r4, [r0, #24]
33f8bc9c:	e59c300c 	ldr	r3, [ip, #12]
33f8bca0:	e1530004 	cmp	r3, r4
33f8bca4:	13a03002 	movne	r3, #2	; 0x2
33f8bca8:	01a03004 	moveq	r3, r4
33f8bcac:	e58c3000 	str	r3, [ip]
33f8bcb0:	e590301c 	ldr	r3, [r0, #28]
33f8bcb4:	e5930014 	ldr	r0, [r3, #20]
33f8bcb8:	ebffff8f 	bl	33f8bafc <inflate_blocks_reset>
33f8bcbc:	e1a00004 	mov	r0, r4
33f8bcc0:	ea000000 	b	33f8bcc8 <inflateReset+0x60>
33f8bcc4:	e3e00001 	mvn	r0, #1	; 0x1
33f8bcc8:	e28dd004 	add	sp, sp, #4	; 0x4
33f8bccc:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8bcd0 <inflateSync>:
33f8bcd0:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f8bcd4:	e2506000 	subs	r6, r0, #0	; 0x0
33f8bcd8:	0a000039 	beq	33f8bdc4 <inflateSync+0xf4>
33f8bcdc:	e596201c 	ldr	r2, [r6, #28]
33f8bce0:	e3520000 	cmp	r2, #0	; 0x0
33f8bce4:	0a000036 	beq	33f8bdc4 <inflateSync+0xf4>
33f8bce8:	e5923000 	ldr	r3, [r2]
33f8bcec:	e3530008 	cmp	r3, #8	; 0x8
33f8bcf0:	13a03008 	movne	r3, #8	; 0x8
33f8bcf4:	15823000 	strne	r3, [r2]
33f8bcf8:	1596201c 	ldrne	r2, [r6, #28]
33f8bcfc:	13a03000 	movne	r3, #0	; 0x0
33f8bd00:	15823004 	strne	r3, [r2, #4]
33f8bd04:	e596e004 	ldr	lr, [r6, #4]
33f8bd08:	e35e0000 	cmp	lr, #0	; 0x0
33f8bd0c:	03e00004 	mvneq	r0, #4	; 0x4
33f8bd10:	08bd80f0 	ldmeqia	sp!, {r4, r5, r6, r7, pc}
33f8bd14:	e596301c 	ldr	r3, [r6, #28]
33f8bd18:	e5961000 	ldr	r1, [r6]
33f8bd1c:	e5930004 	ldr	r0, [r3, #4]
33f8bd20:	e1a0c001 	mov	ip, r1
33f8bd24:	ea00000b 	b	33f8bd58 <inflateSync+0x88>
33f8bd28:	e3500001 	cmp	r0, #1	; 0x1
33f8bd2c:	e5dc2000 	ldrb	r2, [ip]
33f8bd30:	83a030ff 	movhi	r3, #255	; 0xff
33f8bd34:	93a03000 	movls	r3, #0	; 0x0
33f8bd38:	e1520003 	cmp	r2, r3
33f8bd3c:	02800001 	addeq	r0, r0, #1	; 0x1
33f8bd40:	0a000002 	beq	33f8bd50 <inflateSync+0x80>
33f8bd44:	e3520000 	cmp	r2, #0	; 0x0
33f8bd48:	e2600004 	rsb	r0, r0, #4	; 0x4
33f8bd4c:	13a00000 	movne	r0, #0	; 0x0
33f8bd50:	e28cc001 	add	ip, ip, #1	; 0x1
33f8bd54:	e24ee001 	sub	lr, lr, #1	; 0x1
33f8bd58:	e25e7000 	subs	r7, lr, #0	; 0x0
33f8bd5c:	13a07001 	movne	r7, #1	; 0x1
33f8bd60:	e3500003 	cmp	r0, #3	; 0x3
33f8bd64:	83a07000 	movhi	r7, #0	; 0x0
33f8bd68:	e3570000 	cmp	r7, #0	; 0x0
33f8bd6c:	1affffed 	bne	33f8bd28 <inflateSync+0x58>
33f8bd70:	e5963008 	ldr	r3, [r6, #8]
33f8bd74:	e061200c 	rsb	r2, r1, ip
33f8bd78:	e596101c 	ldr	r1, [r6, #28]
33f8bd7c:	e0833002 	add	r3, r3, r2
33f8bd80:	e3500004 	cmp	r0, #4	; 0x4
33f8bd84:	e5863008 	str	r3, [r6, #8]
33f8bd88:	e8865000 	stmia	r6, {ip, lr}
33f8bd8c:	e5810004 	str	r0, [r1, #4]
33f8bd90:	13e00002 	mvnne	r0, #2	; 0x2
33f8bd94:	18bd80f0 	ldmneia	sp!, {r4, r5, r6, r7, pc}
33f8bd98:	e1a00006 	mov	r0, r6
33f8bd9c:	e5964008 	ldr	r4, [r6, #8]
33f8bda0:	e5965014 	ldr	r5, [r6, #20]
33f8bda4:	ebffffaf 	bl	33f8bc68 <inflateReset>
33f8bda8:	e596201c 	ldr	r2, [r6, #28]
33f8bdac:	e3a03002 	mov	r3, #2	; 0x2
33f8bdb0:	e1a00007 	mov	r0, r7
33f8bdb4:	e5864008 	str	r4, [r6, #8]
33f8bdb8:	e5865014 	str	r5, [r6, #20]
33f8bdbc:	e5823000 	str	r3, [r2]
33f8bdc0:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f8bdc4:	e3e00001 	mvn	r0, #1	; 0x1
33f8bdc8:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}

33f8bdcc <inflateInit2>:
33f8bdcc:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f8bdd0:	e2505000 	subs	r5, r0, #0	; 0x0
33f8bdd4:	e1a06001 	mov	r6, r1
33f8bdd8:	0a000016 	beq	33f8be38 <inflateInit2+0x6c>
33f8bddc:	e5950028 	ldr	r0, [r5, #40]
33f8bde0:	e3a01001 	mov	r1, #1	; 0x1
33f8bde4:	e3a02018 	mov	r2, #24	; 0x18
33f8bde8:	e1a0e00f 	mov	lr, pc
33f8bdec:	e595f020 	ldr	pc, [r5, #32]
33f8bdf0:	e3500000 	cmp	r0, #0	; 0x0
33f8bdf4:	e585001c 	str	r0, [r5, #28]
33f8bdf8:	03e00003 	mvneq	r0, #3	; 0x3
33f8bdfc:	08bd86f0 	ldmeqia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f8be00:	e3a09000 	mov	r9, #0	; 0x0
33f8be04:	e5809014 	str	r9, [r0, #20]
33f8be08:	e595301c 	ldr	r3, [r5, #28]
33f8be0c:	e583900c 	str	r9, [r3, #12]
33f8be10:	e1560009 	cmp	r6, r9
33f8be14:	b595201c 	ldrlt	r2, [r5, #28]
33f8be18:	b3a03001 	movlt	r3, #1	; 0x1
33f8be1c:	b2666000 	rsblt	r6, r6, #0	; 0x0
33f8be20:	b582300c 	strlt	r3, [r2, #12]
33f8be24:	e2463008 	sub	r3, r6, #8	; 0x8
33f8be28:	e3530007 	cmp	r3, #7	; 0x7
33f8be2c:	9a000003 	bls	33f8be40 <inflateInit2+0x74>
33f8be30:	e1a00005 	mov	r0, r5
33f8be34:	ebffff64 	bl	33f8bbcc <inflateEnd>
33f8be38:	e3e00001 	mvn	r0, #1	; 0x1
33f8be3c:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f8be40:	e595301c 	ldr	r3, [r5, #28]
33f8be44:	e5836010 	str	r6, [r3, #16]
33f8be48:	e595701c 	ldr	r7, [r5, #28]
33f8be4c:	e597c00c 	ldr	ip, [r7, #12]
33f8be50:	e59f30ac 	ldr	r3, [pc, #172]	; 33f8bf04 <.text+0xbf04>
33f8be54:	e35c0000 	cmp	ip, #0	; 0x0
33f8be58:	e5950028 	ldr	r0, [r5, #40]
33f8be5c:	e3a01001 	mov	r1, #1	; 0x1
33f8be60:	e3a02040 	mov	r2, #64	; 0x40
33f8be64:	01a0a003 	moveq	sl, r3
33f8be68:	13a0a000 	movne	sl, #0	; 0x0
33f8be6c:	e1a0e00f 	mov	lr, pc
33f8be70:	e595f020 	ldr	pc, [r5, #32]
33f8be74:	e2504000 	subs	r4, r0, #0	; 0x0
33f8be78:	0a00001b 	beq	33f8beec <inflateInit2+0x120>
33f8be7c:	e3a01001 	mov	r1, #1	; 0x1
33f8be80:	e1a06611 	mov	r6, r1, lsl r6
33f8be84:	e5950028 	ldr	r0, [r5, #40]
33f8be88:	e1a02006 	mov	r2, r6
33f8be8c:	e1a0e00f 	mov	lr, pc
33f8be90:	e595f020 	ldr	pc, [r5, #32]
33f8be94:	e3500000 	cmp	r0, #0	; 0x0
33f8be98:	e5840028 	str	r0, [r4, #40]
33f8be9c:	1a000005 	bne	33f8beb8 <inflateInit2+0xec>
33f8bea0:	e1a01004 	mov	r1, r4
33f8bea4:	e5950028 	ldr	r0, [r5, #40]
33f8bea8:	e3a02040 	mov	r2, #64	; 0x40
33f8beac:	e1a0e00f 	mov	lr, pc
33f8beb0:	e595f024 	ldr	pc, [r5, #36]
33f8beb4:	ea00000c 	b	33f8beec <inflateInit2+0x120>
33f8beb8:	e0803006 	add	r3, r0, r6
33f8bebc:	e584302c 	str	r3, [r4, #44]
33f8bec0:	e1a00004 	mov	r0, r4
33f8bec4:	e1a01005 	mov	r1, r5
33f8bec8:	e284203c 	add	r2, r4, #60	; 0x3c
33f8becc:	e584a038 	str	sl, [r4, #56]
33f8bed0:	e5849000 	str	r9, [r4]
33f8bed4:	ebffff08 	bl	33f8bafc <inflate_blocks_reset>
33f8bed8:	e5874014 	str	r4, [r7, #20]
33f8bedc:	e1a00005 	mov	r0, r5
33f8bee0:	ebffff60 	bl	33f8bc68 <inflateReset>
33f8bee4:	e1a00009 	mov	r0, r9
33f8bee8:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f8beec:	e3a03000 	mov	r3, #0	; 0x0
33f8bef0:	e5873014 	str	r3, [r7, #20]
33f8bef4:	e1a00005 	mov	r0, r5
33f8bef8:	ebffff33 	bl	33f8bbcc <inflateEnd>
33f8befc:	e3e00003 	mvn	r0, #3	; 0x3
33f8bf00:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f8bf04:	33f8bf10 	mvnccs	fp, #64	; 0x40

33f8bf08 <inflateInit>:
33f8bf08:	e3a0100f 	mov	r1, #15	; 0xf
33f8bf0c:	eaffffae 	b	33f8bdcc <inflateInit2>

33f8bf10 <adler32>:
33f8bf10:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f8bf14:	e2514000 	subs	r4, r1, #0	; 0x0
33f8bf18:	11a05800 	movne	r5, r0, lsl #16
33f8bf1c:	e1a07002 	mov	r7, r2
33f8bf20:	03a00001 	moveq	r0, #1	; 0x1
33f8bf24:	11a05825 	movne	r5, r5, lsr #16
33f8bf28:	11a06820 	movne	r6, r0, lsr #16
33f8bf2c:	08bd84f0 	ldmeqia	sp!, {r4, r5, r6, r7, sl, pc}
33f8bf30:	ea00004b 	b	33f8c064 <adler32+0x154>
33f8bf34:	e59f3138 	ldr	r3, [pc, #312]	; 33f8c074 <.text+0xc074>
33f8bf38:	e1570003 	cmp	r7, r3
33f8bf3c:	31a0e007 	movcc	lr, r7
33f8bf40:	21a0e003 	movcs	lr, r3
33f8bf44:	e1a0a00e 	mov	sl, lr
33f8bf48:	ea000031 	b	33f8c014 <adler32+0x104>
33f8bf4c:	e5d43000 	ldrb	r3, [r4]
33f8bf50:	e5d42001 	ldrb	r2, [r4, #1]
33f8bf54:	e0853003 	add	r3, r5, r3
33f8bf58:	e5d41002 	ldrb	r1, [r4, #2]
33f8bf5c:	e0832002 	add	r2, r3, r2
33f8bf60:	e5d40003 	ldrb	r0, [r4, #3]
33f8bf64:	e0863003 	add	r3, r6, r3
33f8bf68:	e0821001 	add	r1, r2, r1
33f8bf6c:	e0833002 	add	r3, r3, r2
33f8bf70:	e5d42004 	ldrb	r2, [r4, #4]
33f8bf74:	e0810000 	add	r0, r1, r0
33f8bf78:	e0833001 	add	r3, r3, r1
33f8bf7c:	e5d41005 	ldrb	r1, [r4, #5]
33f8bf80:	e0802002 	add	r2, r0, r2
33f8bf84:	e0833000 	add	r3, r3, r0
33f8bf88:	e5d40006 	ldrb	r0, [r4, #6]
33f8bf8c:	e0821001 	add	r1, r2, r1
33f8bf90:	e0833002 	add	r3, r3, r2
33f8bf94:	e5d42007 	ldrb	r2, [r4, #7]
33f8bf98:	e0810000 	add	r0, r1, r0
33f8bf9c:	e0833001 	add	r3, r3, r1
33f8bfa0:	e5d41008 	ldrb	r1, [r4, #8]
33f8bfa4:	e0802002 	add	r2, r0, r2
33f8bfa8:	e0833000 	add	r3, r3, r0
33f8bfac:	e5d40009 	ldrb	r0, [r4, #9]
33f8bfb0:	e0821001 	add	r1, r2, r1
33f8bfb4:	e0833002 	add	r3, r3, r2
33f8bfb8:	e5d4200a 	ldrb	r2, [r4, #10]
33f8bfbc:	e0810000 	add	r0, r1, r0
33f8bfc0:	e0833001 	add	r3, r3, r1
33f8bfc4:	e5d4100b 	ldrb	r1, [r4, #11]
33f8bfc8:	e0802002 	add	r2, r0, r2
33f8bfcc:	e0833000 	add	r3, r3, r0
33f8bfd0:	e5d4000c 	ldrb	r0, [r4, #12]
33f8bfd4:	e0821001 	add	r1, r2, r1
33f8bfd8:	e0833002 	add	r3, r3, r2
33f8bfdc:	e5d4c00d 	ldrb	ip, [r4, #13]
33f8bfe0:	e0810000 	add	r0, r1, r0
33f8bfe4:	e0833001 	add	r3, r3, r1
33f8bfe8:	e5d4200e 	ldrb	r2, [r4, #14]
33f8bfec:	e080c00c 	add	ip, r0, ip
33f8bff0:	e5d4100f 	ldrb	r1, [r4, #15]
33f8bff4:	e0833000 	add	r3, r3, r0
33f8bff8:	e08c2002 	add	r2, ip, r2
33f8bffc:	e083300c 	add	r3, r3, ip
33f8c000:	e0825001 	add	r5, r2, r1
33f8c004:	e0833002 	add	r3, r3, r2
33f8c008:	e2844010 	add	r4, r4, #16	; 0x10
33f8c00c:	e0836005 	add	r6, r3, r5
33f8c010:	e24ee010 	sub	lr, lr, #16	; 0x10
33f8c014:	e35e000f 	cmp	lr, #15	; 0xf
33f8c018:	caffffcb 	bgt	33f8bf4c <adler32+0x3c>
33f8c01c:	e25e1000 	subs	r1, lr, #0	; 0x0
33f8c020:	e1a02004 	mov	r2, r4
33f8c024:	0a000005 	beq	33f8c040 <adler32+0x130>
33f8c028:	e4d43001 	ldrb	r3, [r4], #1
33f8c02c:	e25ee001 	subs	lr, lr, #1	; 0x1
33f8c030:	e0855003 	add	r5, r5, r3
33f8c034:	e0866005 	add	r6, r6, r5
33f8c038:	1afffffa 	bne	33f8c028 <adler32+0x118>
33f8c03c:	e0824001 	add	r4, r2, r1
33f8c040:	e1a00005 	mov	r0, r5
33f8c044:	e59f102c 	ldr	r1, [pc, #44]	; 33f8c078 <.text+0xc078>
33f8c048:	eb000c2b 	bl	33f8f0fc <__umodsi3>
33f8c04c:	e59f1024 	ldr	r1, [pc, #36]	; 33f8c078 <.text+0xc078>
33f8c050:	e1a05000 	mov	r5, r0
33f8c054:	e1a00006 	mov	r0, r6
33f8c058:	eb000c27 	bl	33f8f0fc <__umodsi3>
33f8c05c:	e06a7007 	rsb	r7, sl, r7
33f8c060:	e1a06000 	mov	r6, r0
33f8c064:	e3570000 	cmp	r7, #0	; 0x0
33f8c068:	1affffb1 	bne	33f8bf34 <adler32+0x24>
33f8c06c:	e1850806 	orr	r0, r5, r6, lsl #16
33f8c070:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f8c074:	000015b0 	streqh	r1, [r0], -r0
33f8c078:	0000fff1 	streqd	pc, [r0], -r1

33f8c07c <inflate_flush>:
33f8c07c:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f8c080:	e1a05000 	mov	r5, r0
33f8c084:	e5907030 	ldr	r7, [r0, #48]
33f8c088:	e5900034 	ldr	r0, [r0, #52]
33f8c08c:	e1570000 	cmp	r7, r0
33f8c090:	8595002c 	ldrhi	r0, [r5, #44]
33f8c094:	e1a06001 	mov	r6, r1
33f8c098:	e5913010 	ldr	r3, [r1, #16]
33f8c09c:	e1a0a002 	mov	sl, r2
33f8c0a0:	e591900c 	ldr	r9, [r1, #12]
33f8c0a4:	e5962014 	ldr	r2, [r6, #20]
33f8c0a8:	e0671000 	rsb	r1, r7, r0
33f8c0ac:	e1530001 	cmp	r3, r1
33f8c0b0:	31a04003 	movcc	r4, r3
33f8c0b4:	21a04001 	movcs	r4, r1
33f8c0b8:	e0643003 	rsb	r3, r4, r3
33f8c0bc:	e0822004 	add	r2, r2, r4
33f8c0c0:	e5863010 	str	r3, [r6, #16]
33f8c0c4:	e5862014 	str	r2, [r6, #20]
33f8c0c8:	e2543000 	subs	r3, r4, #0	; 0x0
33f8c0cc:	13a03001 	movne	r3, #1	; 0x1
33f8c0d0:	e37a0005 	cmn	sl, #5	; 0x5
33f8c0d4:	e595c038 	ldr	ip, [r5, #56]
33f8c0d8:	13a03000 	movne	r3, #0	; 0x0
33f8c0dc:	e3530000 	cmp	r3, #0	; 0x0
33f8c0e0:	13a0a000 	movne	sl, #0	; 0x0
33f8c0e4:	e35c0000 	cmp	ip, #0	; 0x0
33f8c0e8:	0a000005 	beq	33f8c104 <inflate_flush+0x88>
33f8c0ec:	e595003c 	ldr	r0, [r5, #60]
33f8c0f0:	e1a01007 	mov	r1, r7
33f8c0f4:	e1a02004 	mov	r2, r4
33f8c0f8:	e1a0e00f 	mov	lr, pc
33f8c0fc:	e1a0f00c 	mov	pc, ip
33f8c100:	e585003c 	str	r0, [r5, #60]
33f8c104:	e5963030 	ldr	r3, [r6, #48]
33f8c108:	e3530000 	cmp	r3, #0	; 0x0
33f8c10c:	11a00007 	movne	r0, r7
33f8c110:	11a01004 	movne	r1, r4
33f8c114:	11a0e00f 	movne	lr, pc
33f8c118:	11a0f003 	movne	pc, r3
33f8c11c:	e1a00009 	mov	r0, r9
33f8c120:	e1a01007 	mov	r1, r7
33f8c124:	e1a02004 	mov	r2, r4
33f8c128:	ebfffa62 	bl	33f8aab8 <memcpy>
33f8c12c:	e595302c 	ldr	r3, [r5, #44]
33f8c130:	e0870004 	add	r0, r7, r4
33f8c134:	e1500003 	cmp	r0, r3
33f8c138:	e0899004 	add	r9, r9, r4
33f8c13c:	1a000029 	bne	33f8c1e8 <inflate_flush+0x16c>
33f8c140:	e5953034 	ldr	r3, [r5, #52]
33f8c144:	e5957028 	ldr	r7, [r5, #40]
33f8c148:	e1530000 	cmp	r3, r0
33f8c14c:	05857034 	streq	r7, [r5, #52]
33f8c150:	e5953034 	ldr	r3, [r5, #52]
33f8c154:	e5962010 	ldr	r2, [r6, #16]
33f8c158:	e0673003 	rsb	r3, r7, r3
33f8c15c:	e5961014 	ldr	r1, [r6, #20]
33f8c160:	e1520003 	cmp	r2, r3
33f8c164:	31a04002 	movcc	r4, r2
33f8c168:	21a04003 	movcs	r4, r3
33f8c16c:	e0642002 	rsb	r2, r4, r2
33f8c170:	e0811004 	add	r1, r1, r4
33f8c174:	e5862010 	str	r2, [r6, #16]
33f8c178:	e5861014 	str	r1, [r6, #20]
33f8c17c:	e2543000 	subs	r3, r4, #0	; 0x0
33f8c180:	13a03001 	movne	r3, #1	; 0x1
33f8c184:	e37a0005 	cmn	sl, #5	; 0x5
33f8c188:	e595c038 	ldr	ip, [r5, #56]
33f8c18c:	13a03000 	movne	r3, #0	; 0x0
33f8c190:	e3530000 	cmp	r3, #0	; 0x0
33f8c194:	13a0a000 	movne	sl, #0	; 0x0
33f8c198:	e35c0000 	cmp	ip, #0	; 0x0
33f8c19c:	0a000005 	beq	33f8c1b8 <inflate_flush+0x13c>
33f8c1a0:	e595003c 	ldr	r0, [r5, #60]
33f8c1a4:	e1a01007 	mov	r1, r7
33f8c1a8:	e1a02004 	mov	r2, r4
33f8c1ac:	e1a0e00f 	mov	lr, pc
33f8c1b0:	e1a0f00c 	mov	pc, ip
33f8c1b4:	e585003c 	str	r0, [r5, #60]
33f8c1b8:	e5963030 	ldr	r3, [r6, #48]
33f8c1bc:	e3530000 	cmp	r3, #0	; 0x0
33f8c1c0:	11a00007 	movne	r0, r7
33f8c1c4:	11a01004 	movne	r1, r4
33f8c1c8:	11a0e00f 	movne	lr, pc
33f8c1cc:	11a0f003 	movne	pc, r3
33f8c1d0:	e1a00009 	mov	r0, r9
33f8c1d4:	e1a01007 	mov	r1, r7
33f8c1d8:	e1a02004 	mov	r2, r4
33f8c1dc:	ebfffa35 	bl	33f8aab8 <memcpy>
33f8c1e0:	e0899004 	add	r9, r9, r4
33f8c1e4:	e0870004 	add	r0, r7, r4
33f8c1e8:	e586900c 	str	r9, [r6, #12]
33f8c1ec:	e5850030 	str	r0, [r5, #48]
33f8c1f0:	e1a0000a 	mov	r0, sl
33f8c1f4:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}

33f8c1f8 <inflateIncomp>:
33f8c1f8:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8c1fc:	e590201c 	ldr	r2, [r0, #28]
33f8c200:	e5923000 	ldr	r3, [r2]
33f8c204:	e3530002 	cmp	r3, #2	; 0x2
33f8c208:	e24dd008 	sub	sp, sp, #8	; 0x8
33f8c20c:	e1a07000 	mov	r7, r0
33f8c210:	1a000042 	bne	33f8c320 <inflateIncomp+0x128>
33f8c214:	e5924014 	ldr	r4, [r2, #20]
33f8c218:	e5946030 	ldr	r6, [r4, #48]
33f8c21c:	e5943034 	ldr	r3, [r4, #52]
33f8c220:	e1560003 	cmp	r6, r3
33f8c224:	13e00001 	mvnne	r0, #1	; 0x1
33f8c228:	1a00003d 	bne	33f8c324 <inflateIncomp+0x12c>
33f8c22c:	e5943000 	ldr	r3, [r4]
33f8c230:	e3530000 	cmp	r3, #0	; 0x0
33f8c234:	1a000039 	bne	33f8c320 <inflateIncomp+0x128>
33f8c238:	e5942024 	ldr	r2, [r4, #36]
33f8c23c:	e594302c 	ldr	r3, [r4, #44]
33f8c240:	e8970600 	ldmia	r7, {r9, sl}
33f8c244:	e58d2004 	str	r2, [sp, #4]
33f8c248:	e5942020 	ldr	r2, [r4, #32]
33f8c24c:	e58d2000 	str	r2, [sp]
33f8c250:	ea000020 	b	33f8c2d8 <inflateIncomp+0xe0>
33f8c254:	e5943038 	ldr	r3, [r4, #56]
33f8c258:	e15b000a 	cmp	fp, sl
33f8c25c:	31a0500b 	movcc	r5, fp
33f8c260:	21a0500a 	movcs	r5, sl
33f8c264:	e3530000 	cmp	r3, #0	; 0x0
33f8c268:	e1a02005 	mov	r2, r5
33f8c26c:	e065a00a 	rsb	sl, r5, sl
33f8c270:	0a000003 	beq	33f8c284 <inflateIncomp+0x8c>
33f8c274:	e594003c 	ldr	r0, [r4, #60]
33f8c278:	e1a0e00f 	mov	lr, pc
33f8c27c:	e1a0f003 	mov	pc, r3
33f8c280:	e584003c 	str	r0, [r4, #60]
33f8c284:	e5973030 	ldr	r3, [r7, #48]
33f8c288:	e3530000 	cmp	r3, #0	; 0x0
33f8c28c:	e1a00006 	mov	r0, r6
33f8c290:	e1a01005 	mov	r1, r5
33f8c294:	11a0e00f 	movne	lr, pc
33f8c298:	11a0f003 	movne	pc, r3
33f8c29c:	e1a00006 	mov	r0, r6
33f8c2a0:	e1a01009 	mov	r1, r9
33f8c2a4:	e1a02005 	mov	r2, r5
33f8c2a8:	ebfffa02 	bl	33f8aab8 <memcpy>
33f8c2ac:	e5973014 	ldr	r3, [r7, #20]
33f8c2b0:	e0833005 	add	r3, r3, r5
33f8c2b4:	e5873014 	str	r3, [r7, #20]
33f8c2b8:	e594302c 	ldr	r3, [r4, #44]
33f8c2bc:	e0866005 	add	r6, r6, r5
33f8c2c0:	e1560003 	cmp	r6, r3
33f8c2c4:	e0899005 	add	r9, r9, r5
33f8c2c8:	e5846030 	str	r6, [r4, #48]
33f8c2cc:	1a000002 	bne	33f8c2dc <inflateIncomp+0xe4>
33f8c2d0:	e5946028 	ldr	r6, [r4, #40]
33f8c2d4:	e5846030 	str	r6, [r4, #48]
33f8c2d8:	e066b003 	rsb	fp, r6, r3
33f8c2dc:	e35a0000 	cmp	sl, #0	; 0x0
33f8c2e0:	e1a01006 	mov	r1, r6
33f8c2e4:	1affffda 	bne	33f8c254 <inflateIncomp+0x5c>
33f8c2e8:	e59d3004 	ldr	r3, [sp, #4]
33f8c2ec:	e5843024 	str	r3, [r4, #36]
33f8c2f0:	e59d2000 	ldr	r2, [sp]
33f8c2f4:	e5842020 	str	r2, [r4, #32]
33f8c2f8:	e5973000 	ldr	r3, [r7]
33f8c2fc:	e5972008 	ldr	r2, [r7, #8]
33f8c300:	e0633009 	rsb	r3, r3, r9
33f8c304:	e0822003 	add	r2, r2, r3
33f8c308:	e1a0000a 	mov	r0, sl
33f8c30c:	e5879000 	str	r9, [r7]
33f8c310:	e5872008 	str	r2, [r7, #8]
33f8c314:	e587a004 	str	sl, [r7, #4]
33f8c318:	e5846034 	str	r6, [r4, #52]
33f8c31c:	ea000000 	b	33f8c324 <inflateIncomp+0x12c>
33f8c320:	e3e00002 	mvn	r0, #2	; 0x2
33f8c324:	e28dd008 	add	sp, sp, #8	; 0x8
33f8c328:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}

33f8c32c <inflate>:
33f8c32c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8c330:	e2505000 	subs	r5, r0, #0	; 0x0
33f8c334:	e24dde51 	sub	sp, sp, #1296	; 0x510
33f8c338:	e58d1014 	str	r1, [sp, #20]
33f8c33c:	0a0007b5 	beq	33f8e218 <.text+0xe218>
33f8c340:	e5953000 	ldr	r3, [r5]
33f8c344:	e3530000 	cmp	r3, #0	; 0x0
33f8c348:	13e00004 	mvnne	r0, #4	; 0x4
33f8c34c:	158d0018 	strne	r0, [sp, #24]
33f8c350:	0a0007b0 	beq	33f8e218 <.text+0xe218>
33f8c354:	e595301c 	ldr	r3, [r5, #28]
33f8c358:	e5933000 	ldr	r3, [r3]
33f8c35c:	e3530008 	cmp	r3, #8	; 0x8
33f8c360:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f8c364:	ea0007ab 	b	33f8e218 <.text+0xe218>
33f8c368:	33f8c3d0 	mvnccs	ip, #1073741827	; 0x40000003
33f8c36c:	33f8c478 	mvnccs	ip, #2013265920	; 0x78000000
33f8c370:	33f8c50c 	mvnccs	ip, #50331648	; 0x3000000
33f8c374:	33f8e0ac 	mvnccs	lr, #172	; 0xac
33f8c378:	33f8e0f4 	mvnccs	lr, #244	; 0xf4
33f8c37c:	33f8e140 	mvnccs	lr, #16	; 0x10
33f8c380:	33f8e18c 	mvnccs	lr, #35	; 0x23
33f8c384:	33f8c3c8 	mvnccs	ip, #536870915	; 0x20000003
33f8c388:	33f8c3bc 	mvnccs	ip, #-268435454	; 0xf0000002
33f8c38c:	e3a03008 	mov	r3, #8	; 0x8
33f8c390:	e5813000 	str	r3, [r1]
33f8c394:	e59f3fb0 	ldr	r3, [pc, #4016]	; 33f8d34c <.text+0xd34c>
33f8c398:	e595201c 	ldr	r2, [r5, #28]
33f8c39c:	e3a01000 	mov	r1, #0	; 0x0
33f8c3a0:	e58d1018 	str	r1, [sp, #24]
33f8c3a4:	ea000055 	b	33f8c500 <.text+0xc500>
33f8c3a8:	e3a02000 	mov	r2, #0	; 0x0
33f8c3ac:	e3a03007 	mov	r3, #7	; 0x7
33f8c3b0:	e58d2018 	str	r2, [sp, #24]
33f8c3b4:	e5813000 	str	r3, [r1]
33f8c3b8:	eaffffe5 	b	33f8c354 <inflate+0x28>
33f8c3bc:	e3e03002 	mvn	r3, #2	; 0x2
33f8c3c0:	e58d3018 	str	r3, [sp, #24]
33f8c3c4:	ea0007a1 	b	33f8e250 <.text+0xe250>
33f8c3c8:	e3a0c001 	mov	ip, #1	; 0x1
33f8c3cc:	ea000792 	b	33f8e21c <.text+0xe21c>
33f8c3d0:	e5952004 	ldr	r2, [r5, #4]
33f8c3d4:	e3520000 	cmp	r2, #0	; 0x0
33f8c3d8:	0a000782 	beq	33f8e1e8 <.text+0xe1e8>
33f8c3dc:	e5953008 	ldr	r3, [r5, #8]
33f8c3e0:	e2422001 	sub	r2, r2, #1	; 0x1
33f8c3e4:	e2833001 	add	r3, r3, #1	; 0x1
33f8c3e8:	e985000c 	stmib	r5, {r2, r3}
33f8c3ec:	e5952000 	ldr	r2, [r5]
33f8c3f0:	e595101c 	ldr	r1, [r5, #28]
33f8c3f4:	e4d23001 	ldrb	r3, [r2], #1
33f8c3f8:	e5813004 	str	r3, [r1, #4]
33f8c3fc:	e203100f 	and	r1, r3, #15	; 0xf
33f8c400:	e3510008 	cmp	r1, #8	; 0x8
33f8c404:	e5852000 	str	r2, [r5]
33f8c408:	e595401c 	ldr	r4, [r5, #28]
33f8c40c:	0a000006 	beq	33f8c42c <.text+0xc42c>
33f8c410:	e3a03008 	mov	r3, #8	; 0x8
33f8c414:	e5843000 	str	r3, [r4]
33f8c418:	e59f3f30 	ldr	r3, [pc, #3888]	; 33f8d350 <.text+0xd350>
33f8c41c:	e595201c 	ldr	r2, [r5, #28]
33f8c420:	e3a0e000 	mov	lr, #0	; 0x0
33f8c424:	e58de018 	str	lr, [sp, #24]
33f8c428:	ea000034 	b	33f8c500 <.text+0xc500>
33f8c42c:	e5943004 	ldr	r3, [r4, #4]
33f8c430:	e5942010 	ldr	r2, [r4, #16]
33f8c434:	e1a03223 	mov	r3, r3, lsr #4
33f8c438:	e2833008 	add	r3, r3, #8	; 0x8
33f8c43c:	e1530002 	cmp	r3, r2
33f8c440:	9a000008 	bls	33f8c468 <.text+0xc468>
33f8c444:	e5841000 	str	r1, [r4]
33f8c448:	e59f2f04 	ldr	r2, [pc, #3844]	; 33f8d354 <.text+0xd354>
33f8c44c:	e595301c 	ldr	r3, [r5, #28]
33f8c450:	e3a00000 	mov	r0, #0	; 0x0
33f8c454:	e58d0018 	str	r0, [sp, #24]
33f8c458:	e5852018 	str	r2, [r5, #24]
33f8c45c:	e3a02005 	mov	r2, #5	; 0x5
33f8c460:	e5832004 	str	r2, [r3, #4]
33f8c464:	eaffffba 	b	33f8c354 <inflate+0x28>
33f8c468:	e3a03001 	mov	r3, #1	; 0x1
33f8c46c:	e3a01000 	mov	r1, #0	; 0x0
33f8c470:	e5843000 	str	r3, [r4]
33f8c474:	e58d1018 	str	r1, [sp, #24]
33f8c478:	e5952004 	ldr	r2, [r5, #4]
33f8c47c:	e3520000 	cmp	r2, #0	; 0x0
33f8c480:	0a000758 	beq	33f8e1e8 <.text+0xe1e8>
33f8c484:	e5953008 	ldr	r3, [r5, #8]
33f8c488:	e2422001 	sub	r2, r2, #1	; 0x1
33f8c48c:	e2833001 	add	r3, r3, #1	; 0x1
33f8c490:	e985000c 	stmib	r5, {r2, r3}
33f8c494:	e5953000 	ldr	r3, [r5]
33f8c498:	e4d32001 	ldrb	r2, [r3], #1
33f8c49c:	e2126020 	ands	r6, r2, #32	; 0x20
33f8c4a0:	e5853000 	str	r3, [r5]
33f8c4a4:	e595401c 	ldr	r4, [r5, #28]
33f8c4a8:	0a000006 	beq	33f8c4c8 <.text+0xc4c8>
33f8c4ac:	e3a03008 	mov	r3, #8	; 0x8
33f8c4b0:	e5843000 	str	r3, [r4]
33f8c4b4:	e3a03000 	mov	r3, #0	; 0x0
33f8c4b8:	e595201c 	ldr	r2, [r5, #28]
33f8c4bc:	e58d3018 	str	r3, [sp, #24]
33f8c4c0:	e59f3e90 	ldr	r3, [pc, #3728]	; 33f8d358 <.text+0xd358>
33f8c4c4:	ea00000d 	b	33f8c500 <.text+0xc500>
33f8c4c8:	e5940004 	ldr	r0, [r4, #4]
33f8c4cc:	e3a0101f 	mov	r1, #31	; 0x1f
33f8c4d0:	e0820400 	add	r0, r2, r0, lsl #8
33f8c4d4:	eb000b08 	bl	33f8f0fc <__umodsi3>
33f8c4d8:	e3500000 	cmp	r0, #0	; 0x0
33f8c4dc:	03a03002 	moveq	r3, #2	; 0x2
33f8c4e0:	05843000 	streq	r3, [r4]
33f8c4e4:	058d0018 	streq	r0, [sp, #24]
33f8c4e8:	0a000007 	beq	33f8c50c <.text+0xc50c>
33f8c4ec:	e3a03008 	mov	r3, #8	; 0x8
33f8c4f0:	e5843000 	str	r3, [r4]
33f8c4f4:	e59f3e60 	ldr	r3, [pc, #3680]	; 33f8d35c <.text+0xd35c>
33f8c4f8:	e595201c 	ldr	r2, [r5, #28]
33f8c4fc:	e58d6018 	str	r6, [sp, #24]
33f8c500:	e5853018 	str	r3, [r5, #24]
33f8c504:	e3a03005 	mov	r3, #5	; 0x5
33f8c508:	ea0006d6 	b	33f8e068 <.text+0xe068>
33f8c50c:	e595301c 	ldr	r3, [r5, #28]
33f8c510:	e5936014 	ldr	r6, [r3, #20]
33f8c514:	e596c034 	ldr	ip, [r6, #52]
33f8c518:	e58dc028 	str	ip, [sp, #40]
33f8c51c:	e5963030 	ldr	r3, [r6, #48]
33f8c520:	e595e004 	ldr	lr, [r5, #4]
33f8c524:	e15c0003 	cmp	ip, r3
33f8c528:	e5959000 	ldr	r9, [r5]
33f8c52c:	e58de01c 	str	lr, [sp, #28]
33f8c530:	306c3003 	rsbcc	r3, ip, r3
33f8c534:	e286a020 	add	sl, r6, #32	; 0x20
33f8c538:	e89a0c00 	ldmia	sl, {sl, fp}
33f8c53c:	32433001 	subcc	r3, r3, #1	; 0x1
33f8c540:	3a000005 	bcc	33f8c55c <.text+0xc55c>
33f8c544:	ea000001 	b	33f8c550 <.text+0xc550>
33f8c548:	e59f3e10 	ldr	r3, [pc, #3600]	; 33f8d360 <.text+0xd360>
33f8c54c:	ea0002cd 	b	33f8d088 <.text+0xd088>
33f8c550:	e596302c 	ldr	r3, [r6, #44]
33f8c554:	e59d0028 	ldr	r0, [sp, #40]
33f8c558:	e0603003 	rsb	r3, r0, r3
33f8c55c:	e58d3044 	str	r3, [sp, #68]
33f8c560:	e5963000 	ldr	r3, [r6]
33f8c564:	e3530009 	cmp	r3, #9	; 0x9
33f8c568:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f8c56c:	ea000691 	b	33f8dfb8 <.text+0xdfb8>
33f8c570:	33f8c5c8 	mvnccs	ip, #838860800	; 0x32000000
33f8c574:	33f8c8dc 	mvnccs	ip, #14417920	; 0xdc0000
33f8c578:	33f8c968 	mvnccs	ip, #1703936	; 0x1a0000
33f8c57c:	33f8cb8c 	mvnccs	ip, #143360	; 0x23000
33f8c580:	33f8cd1c 	mvnccs	ip, #1792	; 0x700
33f8c584:	33f8cfc4 	mvnccs	ip, #784	; 0x310
33f8c588:	33f8d1e4 	mvnccs	sp, #57	; 0x39
33f8c58c:	33f8decc 	mvnccs	sp, #3264	; 0xcc0
33f8c590:	33f8df40 	mvnccs	sp, #256	; 0x100
33f8c594:	33f8df7c 	mvnccs	sp, #496	; 0x1f0
33f8c598:	e59d201c 	ldr	r2, [sp, #28]
33f8c59c:	e3520000 	cmp	r2, #0	; 0x0
33f8c5a0:	e2894001 	add	r4, r9, #1	; 0x1
33f8c5a4:	0a000253 	beq	33f8cef8 <.text+0xcef8>
33f8c5a8:	e5543001 	ldrb	r3, [r4, #-1]
33f8c5ac:	e18bba13 	orr	fp, fp, r3, lsl sl
33f8c5b0:	e2422001 	sub	r2, r2, #1	; 0x1
33f8c5b4:	e3a03000 	mov	r3, #0	; 0x0
33f8c5b8:	e28aa008 	add	sl, sl, #8	; 0x8
33f8c5bc:	e58d201c 	str	r2, [sp, #28]
33f8c5c0:	e58d3018 	str	r3, [sp, #24]
33f8c5c4:	ea000000 	b	33f8c5cc <.text+0xc5cc>
33f8c5c8:	e1a04009 	mov	r4, r9
33f8c5cc:	e35a0002 	cmp	sl, #2	; 0x2
33f8c5d0:	e1a09004 	mov	r9, r4
33f8c5d4:	9affffef 	bls	33f8c598 <.text+0xc598>
33f8c5d8:	e20b3007 	and	r3, fp, #7	; 0x7
33f8c5dc:	e20b2001 	and	r2, fp, #1	; 0x1
33f8c5e0:	e1a030a3 	mov	r3, r3, lsr #1
33f8c5e4:	e586201c 	str	r2, [r6, #28]
33f8c5e8:	e3530003 	cmp	r3, #3	; 0x3
33f8c5ec:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f8c5f0:	eaffffda 	b	33f8c560 <.text+0xc560>
33f8c5f4:	33f8c610 	mvnccs	ip, #16777216	; 0x1000000
33f8c5f8:	33f8c604 	mvnccs	ip, #4194304	; 0x400000
33f8c5fc:	33f8c820 	mvnccs	ip, #2097152	; 0x200000
33f8c600:	33f8c830 	mvnccs	ip, #3145728	; 0x300000
33f8c604:	e59f3d58 	ldr	r3, [pc, #3416]	; 33f8d364 <.text+0xd364>
33f8c608:	e5933000 	ldr	r3, [r3]
33f8c60c:	ea000006 	b	33f8c62c <.text+0xc62c>
33f8c610:	e24a1003 	sub	r1, sl, #3	; 0x3
33f8c614:	e2013007 	and	r3, r1, #7	; 0x7
33f8c618:	e1a021ab 	mov	r2, fp, lsr #3
33f8c61c:	e1a0b332 	mov	fp, r2, lsr r3
33f8c620:	e063a001 	rsb	sl, r3, r1
33f8c624:	e3a03001 	mov	r3, #1	; 0x1
33f8c628:	ea00061b 	b	33f8de9c <.text+0xde9c>
33f8c62c:	e2831001 	add	r1, r3, #1	; 0x1
33f8c630:	e3510001 	cmp	r1, #1	; 0x1
33f8c634:	cafffffc 	bgt	33f8c62c <.text+0xc62c>
33f8c638:	e59f3d28 	ldr	r3, [pc, #3368]	; 33f8d368 <.text+0xd368>
33f8c63c:	e5932000 	ldr	r2, [r3]
33f8c640:	e59f3d1c 	ldr	r3, [pc, #3356]	; 33f8d364 <.text+0xd364>
33f8c644:	e3520000 	cmp	r2, #0	; 0x0
33f8c648:	e5831000 	str	r1, [r3]
33f8c64c:	1a000052 	bne	33f8c79c <.text+0xc79c>
33f8c650:	e59f3d14 	ldr	r3, [pc, #3348]	; 33f8d36c <.text+0xd36c>
33f8c654:	e58d34ec 	str	r3, [sp, #1260]
33f8c658:	e59f3d10 	ldr	r3, [pc, #3344]	; 33f8d370 <.text+0xd370>
33f8c65c:	e58d24f4 	str	r2, [sp, #1268]
33f8c660:	e58d34f0 	str	r3, [sp, #1264]
33f8c664:	e1a01002 	mov	r1, r2
33f8c668:	e28d3050 	add	r3, sp, #80	; 0x50
33f8c66c:	e2433004 	sub	r3, r3, #4	; 0x4
33f8c670:	e3a02008 	mov	r2, #8	; 0x8
33f8c674:	e7812003 	str	r2, [r1, r3]
33f8c678:	e2811004 	add	r1, r1, #4	; 0x4
33f8c67c:	e3510d09 	cmp	r1, #576	; 0x240
33f8c680:	1afffff8 	bne	33f8c668 <.text+0xc668>
33f8c684:	e28d2fa3 	add	r2, sp, #652	; 0x28c
33f8c688:	ea000001 	b	33f8c694 <.text+0xc694>
33f8c68c:	e3a03009 	mov	r3, #9	; 0x9
33f8c690:	e5023004 	str	r3, [r2, #-4]
33f8c694:	e28d3e45 	add	r3, sp, #1104	; 0x450
33f8c698:	e2822004 	add	r2, r2, #4	; 0x4
33f8c69c:	e1520003 	cmp	r2, r3
33f8c6a0:	e28d3050 	add	r3, sp, #80	; 0x50
33f8c6a4:	e2433004 	sub	r3, r3, #4	; 0x4
33f8c6a8:	1afffff7 	bne	33f8c68c <.text+0xc68c>
33f8c6ac:	e2832b01 	add	r2, r3, #1024	; 0x400
33f8c6b0:	ea000001 	b	33f8c6bc <.text+0xc6bc>
33f8c6b4:	e3a03007 	mov	r3, #7	; 0x7
33f8c6b8:	e5023004 	str	r3, [r2, #-4]
33f8c6bc:	e28d3e4b 	add	r3, sp, #1200	; 0x4b0
33f8c6c0:	e2822004 	add	r2, r2, #4	; 0x4
33f8c6c4:	e1520003 	cmp	r2, r3
33f8c6c8:	e28d3050 	add	r3, sp, #80	; 0x50
33f8c6cc:	e2433004 	sub	r3, r3, #4	; 0x4
33f8c6d0:	1afffff7 	bne	33f8c6b4 <.text+0xc6b4>
33f8c6d4:	e2832e46 	add	r2, r3, #1120	; 0x460
33f8c6d8:	ea000001 	b	33f8c6e4 <.text+0xc6e4>
33f8c6dc:	e3a03008 	mov	r3, #8	; 0x8
33f8c6e0:	e5023004 	str	r3, [r2, #-4]
33f8c6e4:	e2822004 	add	r2, r2, #4	; 0x4
33f8c6e8:	e28d3e4d 	add	r3, sp, #1232	; 0x4d0
33f8c6ec:	e28d0050 	add	r0, sp, #80	; 0x50
33f8c6f0:	e1520003 	cmp	r2, r3
33f8c6f4:	e2400004 	sub	r0, r0, #4	; 0x4
33f8c6f8:	1afffff7 	bne	33f8c6dc <.text+0xc6dc>
33f8c6fc:	e59fec70 	ldr	lr, [pc, #3184]	; 33f8d374 <.text+0xd374>
33f8c700:	e3a0c007 	mov	ip, #7	; 0x7
33f8c704:	e58ec000 	str	ip, [lr]
33f8c708:	e59fcc68 	ldr	ip, [pc, #3176]	; 33f8d378 <.text+0xd378>
33f8c70c:	e58dc000 	str	ip, [sp]
33f8c710:	e59fcc64 	ldr	ip, [pc, #3172]	; 33f8d37c <.text+0xd37c>
33f8c714:	e58dc004 	str	ip, [sp, #4]
33f8c718:	e28dcd13 	add	ip, sp, #1216	; 0x4c0
33f8c71c:	e59f3c5c 	ldr	r3, [pc, #3164]	; 33f8d380 <.text+0xd380>
33f8c720:	e28cc00c 	add	ip, ip, #12	; 0xc
33f8c724:	e3a01e12 	mov	r1, #288	; 0x120
33f8c728:	e59f2c84 	ldr	r2, [pc, #3204]	; 33f8d3b4 <.text+0xd3b4>
33f8c72c:	e58de008 	str	lr, [sp, #8]
33f8c730:	e58dc00c 	str	ip, [sp, #12]
33f8c734:	ebfffb50 	bl	33f8b47c <huft_build>
33f8c738:	e3a03000 	mov	r3, #0	; 0x0
33f8c73c:	e28d0050 	add	r0, sp, #80	; 0x50
33f8c740:	e2400004 	sub	r0, r0, #4	; 0x4
33f8c744:	e3a0c005 	mov	ip, #5	; 0x5
33f8c748:	e783c000 	str	ip, [r3, r0]
33f8c74c:	e2833004 	add	r3, r3, #4	; 0x4
33f8c750:	e3530078 	cmp	r3, #120	; 0x78
33f8c754:	1afffff8 	bne	33f8c73c <.text+0xc73c>
33f8c758:	e59fec24 	ldr	lr, [pc, #3108]	; 33f8d384 <.text+0xd384>
33f8c75c:	e58ec000 	str	ip, [lr]
33f8c760:	e59fcc20 	ldr	ip, [pc, #3104]	; 33f8d388 <.text+0xd388>
33f8c764:	e58dc000 	str	ip, [sp]
33f8c768:	e59fcc1c 	ldr	ip, [pc, #3100]	; 33f8d38c <.text+0xd38c>
33f8c76c:	e58dc004 	str	ip, [sp, #4]
33f8c770:	e28dcd13 	add	ip, sp, #1216	; 0x4c0
33f8c774:	e3a02000 	mov	r2, #0	; 0x0
33f8c778:	e59f3c10 	ldr	r3, [pc, #3088]	; 33f8d390 <.text+0xd390>
33f8c77c:	e28cc00c 	add	ip, ip, #12	; 0xc
33f8c780:	e3a0101e 	mov	r1, #30	; 0x1e
33f8c784:	e58de008 	str	lr, [sp, #8]
33f8c788:	e58dc00c 	str	ip, [sp, #12]
33f8c78c:	ebfffb3a 	bl	33f8b47c <huft_build>
33f8c790:	e59f3bd0 	ldr	r3, [pc, #3024]	; 33f8d368 <.text+0xd368>
33f8c794:	e3a02001 	mov	r2, #1	; 0x1
33f8c798:	e5832000 	str	r2, [r3]
33f8c79c:	e59f3bd0 	ldr	r3, [pc, #3024]	; 33f8d374 <.text+0xd374>
33f8c7a0:	e5930000 	ldr	r0, [r3]
33f8c7a4:	e59f3bd8 	ldr	r3, [pc, #3032]	; 33f8d384 <.text+0xd384>
33f8c7a8:	e59febb4 	ldr	lr, [pc, #2996]	; 33f8d364 <.text+0xd364>
33f8c7ac:	e5931000 	ldr	r1, [r3]
33f8c7b0:	e59f3bc4 	ldr	r3, [pc, #3012]	; 33f8d37c <.text+0xd37c>
33f8c7b4:	e59ec000 	ldr	ip, [lr]
33f8c7b8:	e5932000 	ldr	r2, [r3]
33f8c7bc:	e59f3bc8 	ldr	r3, [pc, #3016]	; 33f8d38c <.text+0xd38c>
33f8c7c0:	e24cc001 	sub	ip, ip, #1	; 0x1
33f8c7c4:	e5933000 	ldr	r3, [r3]
33f8c7c8:	e58ec000 	str	ip, [lr]
33f8c7cc:	e58d5000 	str	r5, [sp]
33f8c7d0:	ebfffcad 	bl	33f8ba8c <inflate_codes_new>
33f8c7d4:	e3500000 	cmp	r0, #0	; 0x0
33f8c7d8:	e586000c 	str	r0, [r6, #12]
33f8c7dc:	1a000009 	bne	33f8c808 <.text+0xc808>
33f8c7e0:	e586b024 	str	fp, [r6, #36]
33f8c7e4:	e586a020 	str	sl, [r6, #32]
33f8c7e8:	e5953000 	ldr	r3, [r5]
33f8c7ec:	e5952008 	ldr	r2, [r5, #8]
33f8c7f0:	e59d001c 	ldr	r0, [sp, #28]
33f8c7f4:	e0633004 	rsb	r3, r3, r4
33f8c7f8:	e0822003 	add	r2, r2, r3
33f8c7fc:	e9850005 	stmib	r5, {r0, r2}
33f8c800:	e5854000 	str	r4, [r5]
33f8c804:	ea000263 	b	33f8d198 <.text+0xd198>
33f8c808:	e3a02000 	mov	r2, #0	; 0x0
33f8c80c:	e1a0b1ab 	mov	fp, fp, lsr #3
33f8c810:	e24aa003 	sub	sl, sl, #3	; 0x3
33f8c814:	e3a03006 	mov	r3, #6	; 0x6
33f8c818:	e5862008 	str	r2, [r6, #8]
33f8c81c:	ea00004e 	b	33f8c95c <.text+0xc95c>
33f8c820:	e1a0b1ab 	mov	fp, fp, lsr #3
33f8c824:	e24aa003 	sub	sl, sl, #3	; 0x3
33f8c828:	e3a03003 	mov	r3, #3	; 0x3
33f8c82c:	ea00059a 	b	33f8de9c <.text+0xde9c>
33f8c830:	e3a03009 	mov	r3, #9	; 0x9
33f8c834:	e5863000 	str	r3, [r6]
33f8c838:	e59f3b54 	ldr	r3, [pc, #2900]	; 33f8d394 <.text+0xd394>
33f8c83c:	e1a021ab 	mov	r2, fp, lsr #3
33f8c840:	e24a1003 	sub	r1, sl, #3	; 0x3
33f8c844:	e5853018 	str	r3, [r5, #24]
33f8c848:	e5862024 	str	r2, [r6, #36]
33f8c84c:	e5861020 	str	r1, [r6, #32]
33f8c850:	e5953000 	ldr	r3, [r5]
33f8c854:	e5952008 	ldr	r2, [r5, #8]
33f8c858:	e0633004 	rsb	r3, r3, r4
33f8c85c:	e0822003 	add	r2, r2, r3
33f8c860:	e59d301c 	ldr	r3, [sp, #28]
33f8c864:	e5852008 	str	r2, [r5, #8]
33f8c868:	e5853004 	str	r3, [r5, #4]
33f8c86c:	e5854000 	str	r4, [r5]
33f8c870:	ea000031 	b	33f8c93c <.text+0xc93c>
33f8c874:	e59de01c 	ldr	lr, [sp, #28]
33f8c878:	e35e0000 	cmp	lr, #0	; 0x0
33f8c87c:	e2892001 	add	r2, r9, #1	; 0x1
33f8c880:	0a000007 	beq	33f8c8a4 <.text+0xc8a4>
33f8c884:	e5523001 	ldrb	r3, [r2, #-1]
33f8c888:	e18bba13 	orr	fp, fp, r3, lsl sl
33f8c88c:	e24ee001 	sub	lr, lr, #1	; 0x1
33f8c890:	e3a00000 	mov	r0, #0	; 0x0
33f8c894:	e28aa008 	add	sl, sl, #8	; 0x8
33f8c898:	e58de01c 	str	lr, [sp, #28]
33f8c89c:	e58d0018 	str	r0, [sp, #24]
33f8c8a0:	ea00000e 	b	33f8c8e0 <.text+0xc8e0>
33f8c8a4:	e586b024 	str	fp, [r6, #36]
33f8c8a8:	e586a020 	str	sl, [r6, #32]
33f8c8ac:	e5953000 	ldr	r3, [r5]
33f8c8b0:	e5952008 	ldr	r2, [r5, #8]
33f8c8b4:	e59d101c 	ldr	r1, [sp, #28]
33f8c8b8:	e0633009 	rsb	r3, r3, r9
33f8c8bc:	e0822003 	add	r2, r2, r3
33f8c8c0:	e9850006 	stmib	r5, {r1, r2}
33f8c8c4:	e5859000 	str	r9, [r5]
33f8c8c8:	e59d2028 	ldr	r2, [sp, #40]
33f8c8cc:	e5862034 	str	r2, [r6, #52]
33f8c8d0:	e59d2018 	ldr	r2, [sp, #24]
33f8c8d4:	e1a00006 	mov	r0, r6
33f8c8d8:	ea000594 	b	33f8df30 <.text+0xdf30>
33f8c8dc:	e1a02009 	mov	r2, r9
33f8c8e0:	e35a001f 	cmp	sl, #31	; 0x1f
33f8c8e4:	e1a09002 	mov	r9, r2
33f8c8e8:	9affffe1 	bls	33f8c874 <.text+0xc874>
33f8c8ec:	e1e0200b 	mvn	r2, fp
33f8c8f0:	e1a0380b 	mov	r3, fp, lsl #16
33f8c8f4:	e1a02822 	mov	r2, r2, lsr #16
33f8c8f8:	e1a03823 	mov	r3, r3, lsr #16
33f8c8fc:	e1520003 	cmp	r2, r3
33f8c900:	0a000010 	beq	33f8c948 <.text+0xc948>
33f8c904:	e3a03009 	mov	r3, #9	; 0x9
33f8c908:	e5863000 	str	r3, [r6]
33f8c90c:	e59f3a84 	ldr	r3, [pc, #2692]	; 33f8d398 <.text+0xd398>
33f8c910:	e5853018 	str	r3, [r5, #24]
33f8c914:	e586b024 	str	fp, [r6, #36]
33f8c918:	e586a020 	str	sl, [r6, #32]
33f8c91c:	e5953000 	ldr	r3, [r5]
33f8c920:	e5952008 	ldr	r2, [r5, #8]
33f8c924:	e0633009 	rsb	r3, r3, r9
33f8c928:	e0822003 	add	r2, r2, r3
33f8c92c:	e59d301c 	ldr	r3, [sp, #28]
33f8c930:	e5852008 	str	r2, [r5, #8]
33f8c934:	e5853004 	str	r3, [r5, #4]
33f8c938:	e5859000 	str	r9, [r5]
33f8c93c:	e59dc028 	ldr	ip, [sp, #40]
33f8c940:	e586c034 	str	ip, [r6, #52]
33f8c944:	ea000597 	b	33f8dfa8 <.text+0xdfa8>
33f8c948:	e3a0a000 	mov	sl, #0	; 0x0
33f8c94c:	e152000a 	cmp	r2, sl
33f8c950:	13a03002 	movne	r3, #2	; 0x2
33f8c954:	01a0300a 	moveq	r3, sl
33f8c958:	e1a0b00a 	mov	fp, sl
33f8c95c:	e5863000 	str	r3, [r6]
33f8c960:	e5862004 	str	r2, [r6, #4]
33f8c964:	eafffefd 	b	33f8c560 <.text+0xc560>
33f8c968:	e59de01c 	ldr	lr, [sp, #28]
33f8c96c:	e35e0000 	cmp	lr, #0	; 0x0
33f8c970:	1a00000b 	bne	33f8c9a4 <.text+0xc9a4>
33f8c974:	e586b024 	str	fp, [r6, #36]
33f8c978:	e586a020 	str	sl, [r6, #32]
33f8c97c:	e5953000 	ldr	r3, [r5]
33f8c980:	e5952008 	ldr	r2, [r5, #8]
33f8c984:	e0633009 	rsb	r3, r3, r9
33f8c988:	e0822003 	add	r2, r2, r3
33f8c98c:	e585e004 	str	lr, [r5, #4]
33f8c990:	e5852008 	str	r2, [r5, #8]
33f8c994:	e5859000 	str	r9, [r5]
33f8c998:	e59d0028 	ldr	r0, [sp, #40]
33f8c99c:	e5860034 	str	r0, [r6, #52]
33f8c9a0:	eaffffca 	b	33f8c8d0 <.text+0xc8d0>
33f8c9a4:	e59d1044 	ldr	r1, [sp, #68]
33f8c9a8:	e3510000 	cmp	r1, #0	; 0x0
33f8c9ac:	1a00003b 	bne	33f8caa0 <.text+0xcaa0>
33f8c9b0:	e596302c 	ldr	r3, [r6, #44]
33f8c9b4:	e59d2028 	ldr	r2, [sp, #40]
33f8c9b8:	e1520003 	cmp	r2, r3
33f8c9bc:	1a00000d 	bne	33f8c9f8 <.text+0xc9f8>
33f8c9c0:	e5963030 	ldr	r3, [r6, #48]
33f8c9c4:	e5967028 	ldr	r7, [r6, #40]
33f8c9c8:	e1530007 	cmp	r3, r7
33f8c9cc:	0a000009 	beq	33f8c9f8 <.text+0xc9f8>
33f8c9d0:	e1570003 	cmp	r7, r3
33f8c9d4:	259d3028 	ldrcs	r3, [sp, #40]
33f8c9d8:	30673003 	rsbcc	r3, r7, r3
33f8c9dc:	32433001 	subcc	r3, r3, #1	; 0x1
33f8c9e0:	20673003 	rsbcs	r3, r7, r3
33f8c9e4:	e58d3044 	str	r3, [sp, #68]
33f8c9e8:	e59dc044 	ldr	ip, [sp, #68]
33f8c9ec:	e35c0000 	cmp	ip, #0	; 0x0
33f8c9f0:	1a00002b 	bne	33f8caa4 <.text+0xcaa4>
33f8c9f4:	e58d7028 	str	r7, [sp, #40]
33f8c9f8:	e59de028 	ldr	lr, [sp, #40]
33f8c9fc:	e586e034 	str	lr, [r6, #52]
33f8ca00:	e1a01005 	mov	r1, r5
33f8ca04:	e59d2018 	ldr	r2, [sp, #24]
33f8ca08:	e1a00006 	mov	r0, r6
33f8ca0c:	ebfffd9a 	bl	33f8c07c <inflate_flush>
33f8ca10:	e2861030 	add	r1, r6, #48	; 0x30
33f8ca14:	e8910082 	ldmia	r1, {r1, r7}
33f8ca18:	e1570001 	cmp	r7, r1
33f8ca1c:	2596302c 	ldrcs	r3, [r6, #44]
33f8ca20:	30673001 	rsbcc	r3, r7, r1
33f8ca24:	32433001 	subcc	r3, r3, #1	; 0x1
33f8ca28:	20673003 	rsbcs	r3, r7, r3
33f8ca2c:	e58d3044 	str	r3, [sp, #68]
33f8ca30:	e596302c 	ldr	r3, [r6, #44]
33f8ca34:	e1570003 	cmp	r7, r3
33f8ca38:	e1a0c000 	mov	ip, r0
33f8ca3c:	1a000009 	bne	33f8ca68 <.text+0xca68>
33f8ca40:	e5962028 	ldr	r2, [r6, #40]
33f8ca44:	e1510002 	cmp	r1, r2
33f8ca48:	0a000006 	beq	33f8ca68 <.text+0xca68>
33f8ca4c:	e1520001 	cmp	r2, r1
33f8ca50:	30623001 	rsbcc	r3, r2, r1
33f8ca54:	32433001 	subcc	r3, r3, #1	; 0x1
33f8ca58:	20627007 	rsbcs	r7, r2, r7
33f8ca5c:	358d3044 	strcc	r3, [sp, #68]
33f8ca60:	258d7044 	strcs	r7, [sp, #68]
33f8ca64:	e1a07002 	mov	r7, r2
33f8ca68:	e59d0044 	ldr	r0, [sp, #68]
33f8ca6c:	e3500000 	cmp	r0, #0	; 0x0
33f8ca70:	1a00000b 	bne	33f8caa4 <.text+0xcaa4>
33f8ca74:	e586b024 	str	fp, [r6, #36]
33f8ca78:	e586a020 	str	sl, [r6, #32]
33f8ca7c:	e5953000 	ldr	r3, [r5]
33f8ca80:	e5952008 	ldr	r2, [r5, #8]
33f8ca84:	e59d101c 	ldr	r1, [sp, #28]
33f8ca88:	e0633009 	rsb	r3, r3, r9
33f8ca8c:	e0822003 	add	r2, r2, r3
33f8ca90:	e9850006 	stmib	r5, {r1, r2}
33f8ca94:	e5859000 	str	r9, [r5]
33f8ca98:	e5867034 	str	r7, [r6, #52]
33f8ca9c:	ea000521 	b	33f8df28 <.text+0xdf28>
33f8caa0:	e59d7028 	ldr	r7, [sp, #40]
33f8caa4:	e59d2044 	ldr	r2, [sp, #68]
33f8caa8:	e5964004 	ldr	r4, [r6, #4]
33f8caac:	e59d301c 	ldr	r3, [sp, #28]
33f8cab0:	e1520004 	cmp	r2, r4
33f8cab4:	31a04002 	movcc	r4, r2
33f8cab8:	e1530004 	cmp	r3, r4
33f8cabc:	31a04003 	movcc	r4, r3
33f8cac0:	e1a01009 	mov	r1, r9
33f8cac4:	e1a00007 	mov	r0, r7
33f8cac8:	e1a02004 	mov	r2, r4
33f8cacc:	ebfff7f9 	bl	33f8aab8 <memcpy>
33f8cad0:	e5963004 	ldr	r3, [r6, #4]
33f8cad4:	e59dc01c 	ldr	ip, [sp, #28]
33f8cad8:	e59de044 	ldr	lr, [sp, #68]
33f8cadc:	e0640003 	rsb	r0, r4, r3
33f8cae0:	e3500000 	cmp	r0, #0	; 0x0
33f8cae4:	e064c00c 	rsb	ip, r4, ip
33f8cae8:	e0877004 	add	r7, r7, r4
33f8caec:	e064e00e 	rsb	lr, r4, lr
33f8caf0:	13a01000 	movne	r1, #0	; 0x0
33f8caf4:	e58dc01c 	str	ip, [sp, #28]
33f8caf8:	e58d7028 	str	r7, [sp, #40]
33f8cafc:	e58de044 	str	lr, [sp, #68]
33f8cb00:	e0899004 	add	r9, r9, r4
33f8cb04:	e5860004 	str	r0, [r6, #4]
33f8cb08:	158d1018 	strne	r1, [sp, #24]
33f8cb0c:	1afffe93 	bne	33f8c560 <.text+0xc560>
33f8cb10:	e596301c 	ldr	r3, [r6, #28]
33f8cb14:	e3530000 	cmp	r3, #0	; 0x0
33f8cb18:	13a03007 	movne	r3, #7	; 0x7
33f8cb1c:	03a03000 	moveq	r3, #0	; 0x0
33f8cb20:	e58d0018 	str	r0, [sp, #24]
33f8cb24:	ea0004dc 	b	33f8de9c <.text+0xde9c>
33f8cb28:	e59d001c 	ldr	r0, [sp, #28]
33f8cb2c:	e3500000 	cmp	r0, #0	; 0x0
33f8cb30:	e2892001 	add	r2, r9, #1	; 0x1
33f8cb34:	0a000007 	beq	33f8cb58 <.text+0xcb58>
33f8cb38:	e5523001 	ldrb	r3, [r2, #-1]
33f8cb3c:	e18bba13 	orr	fp, fp, r3, lsl sl
33f8cb40:	e2400001 	sub	r0, r0, #1	; 0x1
33f8cb44:	e3a01000 	mov	r1, #0	; 0x0
33f8cb48:	e28aa008 	add	sl, sl, #8	; 0x8
33f8cb4c:	e58d001c 	str	r0, [sp, #28]
33f8cb50:	e58d1018 	str	r1, [sp, #24]
33f8cb54:	ea00000d 	b	33f8cb90 <.text+0xcb90>
33f8cb58:	e586b024 	str	fp, [r6, #36]
33f8cb5c:	e586a020 	str	sl, [r6, #32]
33f8cb60:	e5953000 	ldr	r3, [r5]
33f8cb64:	e5952008 	ldr	r2, [r5, #8]
33f8cb68:	e0633009 	rsb	r3, r3, r9
33f8cb6c:	e0822003 	add	r2, r2, r3
33f8cb70:	e59d301c 	ldr	r3, [sp, #28]
33f8cb74:	e5852008 	str	r2, [r5, #8]
33f8cb78:	e5853004 	str	r3, [r5, #4]
33f8cb7c:	e5859000 	str	r9, [r5]
33f8cb80:	e59dc028 	ldr	ip, [sp, #40]
33f8cb84:	e586c034 	str	ip, [r6, #52]
33f8cb88:	eaffff50 	b	33f8c8d0 <.text+0xc8d0>
33f8cb8c:	e1a02009 	mov	r2, r9
33f8cb90:	e35a000d 	cmp	sl, #13	; 0xd
33f8cb94:	e1a09002 	mov	r9, r2
33f8cb98:	9affffe2 	bls	33f8cb28 <.text+0xcb28>
33f8cb9c:	e1a0390b 	mov	r3, fp, lsl #18
33f8cba0:	e20b201f 	and	r2, fp, #31	; 0x1f
33f8cba4:	e1a03923 	mov	r3, r3, lsr #18
33f8cba8:	e352001d 	cmp	r2, #29	; 0x1d
33f8cbac:	e5863004 	str	r3, [r6, #4]
33f8cbb0:	8a000003 	bhi	33f8cbc4 <.text+0xcbc4>
33f8cbb4:	e1a032a3 	mov	r3, r3, lsr #5
33f8cbb8:	e203101f 	and	r1, r3, #31	; 0x1f
33f8cbbc:	e351001d 	cmp	r1, #29	; 0x1d
33f8cbc0:	9a000010 	bls	33f8cc08 <.text+0xcc08>
33f8cbc4:	e3a03009 	mov	r3, #9	; 0x9
33f8cbc8:	e5863000 	str	r3, [r6]
33f8cbcc:	e59f37c8 	ldr	r3, [pc, #1992]	; 33f8d39c <.text+0xd39c>
33f8cbd0:	e5853018 	str	r3, [r5, #24]
33f8cbd4:	e586b024 	str	fp, [r6, #36]
33f8cbd8:	e586a020 	str	sl, [r6, #32]
33f8cbdc:	e5953000 	ldr	r3, [r5]
33f8cbe0:	e5952008 	ldr	r2, [r5, #8]
33f8cbe4:	e59de01c 	ldr	lr, [sp, #28]
33f8cbe8:	e0633009 	rsb	r3, r3, r9
33f8cbec:	e0822003 	add	r2, r2, r3
33f8cbf0:	e585e004 	str	lr, [r5, #4]
33f8cbf4:	e5852008 	str	r2, [r5, #8]
33f8cbf8:	e5859000 	str	r9, [r5]
33f8cbfc:	e59d0028 	ldr	r0, [sp, #40]
33f8cc00:	e5860034 	str	r0, [r6, #52]
33f8cc04:	ea0004e7 	b	33f8dfa8 <.text+0xdfa8>
33f8cc08:	e2823c01 	add	r3, r2, #256	; 0x100
33f8cc0c:	e2833002 	add	r3, r3, #2	; 0x2
33f8cc10:	e0814003 	add	r4, r1, r3
33f8cc14:	e5950028 	ldr	r0, [r5, #40]
33f8cc18:	e1a01004 	mov	r1, r4
33f8cc1c:	e3a02004 	mov	r2, #4	; 0x4
33f8cc20:	e1a0e00f 	mov	lr, pc
33f8cc24:	e595f020 	ldr	pc, [r5, #32]
33f8cc28:	e3500000 	cmp	r0, #0	; 0x0
33f8cc2c:	e586000c 	str	r0, [r6, #12]
33f8cc30:	1a00000b 	bne	33f8cc64 <.text+0xcc64>
33f8cc34:	e586b024 	str	fp, [r6, #36]
33f8cc38:	e586a020 	str	sl, [r6, #32]
33f8cc3c:	e5953000 	ldr	r3, [r5]
33f8cc40:	e5952008 	ldr	r2, [r5, #8]
33f8cc44:	e59d101c 	ldr	r1, [sp, #28]
33f8cc48:	e0633009 	rsb	r3, r3, r9
33f8cc4c:	e0822003 	add	r2, r2, r3
33f8cc50:	e9850006 	stmib	r5, {r1, r2}
33f8cc54:	e5859000 	str	r9, [r5]
33f8cc58:	e59d2028 	ldr	r2, [sp, #40]
33f8cc5c:	e5862034 	str	r2, [r6, #52]
33f8cc60:	ea00014e 	b	33f8d1a0 <.text+0xd1a0>
33f8cc64:	e3a03000 	mov	r3, #0	; 0x0
33f8cc68:	e5863008 	str	r3, [r6, #8]
33f8cc6c:	e1a0b72b 	mov	fp, fp, lsr #14
33f8cc70:	e2833004 	add	r3, r3, #4	; 0x4
33f8cc74:	e24aa00e 	sub	sl, sl, #14	; 0xe
33f8cc78:	e5864018 	str	r4, [r6, #24]
33f8cc7c:	e5863000 	str	r3, [r6]
33f8cc80:	ea000025 	b	33f8cd1c <.text+0xcd1c>
33f8cc84:	e59d301c 	ldr	r3, [sp, #28]
33f8cc88:	e3530000 	cmp	r3, #0	; 0x0
33f8cc8c:	e2892001 	add	r2, r9, #1	; 0x1
33f8cc90:	0a000008 	beq	33f8ccb8 <.text+0xccb8>
33f8cc94:	e5523001 	ldrb	r3, [r2, #-1]
33f8cc98:	e18bba13 	orr	fp, fp, r3, lsl sl
33f8cc9c:	e59dc01c 	ldr	ip, [sp, #28]
33f8cca0:	e3a0e000 	mov	lr, #0	; 0x0
33f8cca4:	e24cc001 	sub	ip, ip, #1	; 0x1
33f8cca8:	e28aa008 	add	sl, sl, #8	; 0x8
33f8ccac:	e58dc01c 	str	ip, [sp, #28]
33f8ccb0:	e58de018 	str	lr, [sp, #24]
33f8ccb4:	ea00000c 	b	33f8ccec <.text+0xccec>
33f8ccb8:	e586b024 	str	fp, [r6, #36]
33f8ccbc:	e586a020 	str	sl, [r6, #32]
33f8ccc0:	e5953000 	ldr	r3, [r5]
33f8ccc4:	e5952008 	ldr	r2, [r5, #8]
33f8ccc8:	e59d001c 	ldr	r0, [sp, #28]
33f8cccc:	e0633009 	rsb	r3, r3, r9
33f8ccd0:	e0822003 	add	r2, r2, r3
33f8ccd4:	e9850005 	stmib	r5, {r0, r2}
33f8ccd8:	e5859000 	str	r9, [r5]
33f8ccdc:	e59d1028 	ldr	r1, [sp, #40]
33f8cce0:	e5861034 	str	r1, [r6, #52]
33f8cce4:	eafffef9 	b	33f8c8d0 <.text+0xc8d0>
33f8cce8:	e1a02009 	mov	r2, r9
33f8ccec:	e35a0002 	cmp	sl, #2	; 0x2
33f8ccf0:	e1a09002 	mov	r9, r2
33f8ccf4:	9affffe2 	bls	33f8cc84 <.text+0xcc84>
33f8ccf8:	e59f36a0 	ldr	r3, [pc, #1696]	; 33f8d3a0 <.text+0xd3a0>
33f8ccfc:	e596200c 	ldr	r2, [r6, #12]
33f8cd00:	e7930101 	ldr	r0, [r3, r1, lsl #2]
33f8cd04:	e20b3007 	and	r3, fp, #7	; 0x7
33f8cd08:	e2811001 	add	r1, r1, #1	; 0x1
33f8cd0c:	e7823100 	str	r3, [r2, r0, lsl #2]
33f8cd10:	e5861008 	str	r1, [r6, #8]
33f8cd14:	e1a0b1ab 	mov	fp, fp, lsr #3
33f8cd18:	e24aa003 	sub	sl, sl, #3	; 0x3
33f8cd1c:	e5963004 	ldr	r3, [r6, #4]
33f8cd20:	e5961008 	ldr	r1, [r6, #8]
33f8cd24:	e1a03523 	mov	r3, r3, lsr #10
33f8cd28:	e2833004 	add	r3, r3, #4	; 0x4
33f8cd2c:	e1510003 	cmp	r1, r3
33f8cd30:	3affffec 	bcc	33f8cce8 <.text+0xcce8>
33f8cd34:	ea000005 	b	33f8cd50 <.text+0xcd50>
33f8cd38:	e59f3660 	ldr	r3, [pc, #1632]	; 33f8d3a0 <.text+0xd3a0>
33f8cd3c:	e7931102 	ldr	r1, [r3, r2, lsl #2]
33f8cd40:	e596200c 	ldr	r2, [r6, #12]
33f8cd44:	e3a03000 	mov	r3, #0	; 0x0
33f8cd48:	e7823101 	str	r3, [r2, r1, lsl #2]
33f8cd4c:	e5860008 	str	r0, [r6, #8]
33f8cd50:	e5962008 	ldr	r2, [r6, #8]
33f8cd54:	e3520012 	cmp	r2, #18	; 0x12
33f8cd58:	e2820001 	add	r0, r2, #1	; 0x1
33f8cd5c:	9afffff5 	bls	33f8cd38 <.text+0xcd38>
33f8cd60:	e3a03000 	mov	r3, #0	; 0x0
33f8cd64:	e2861014 	add	r1, r6, #20	; 0x14
33f8cd68:	e2860010 	add	r0, r6, #16	; 0x10
33f8cd6c:	e3a02007 	mov	r2, #7	; 0x7
33f8cd70:	e5862010 	str	r2, [r6, #16]
33f8cd74:	e58d1004 	str	r1, [sp, #4]
33f8cd78:	e58d0008 	str	r0, [sp, #8]
33f8cd7c:	e58d3000 	str	r3, [sp]
33f8cd80:	e58d500c 	str	r5, [sp, #12]
33f8cd84:	e3a01013 	mov	r1, #19	; 0x13
33f8cd88:	e596000c 	ldr	r0, [r6, #12]
33f8cd8c:	e1a02001 	mov	r2, r1
33f8cd90:	ebfff9b9 	bl	33f8b47c <huft_build>
33f8cd94:	e3700003 	cmn	r0, #3	; 0x3
33f8cd98:	059f3604 	ldreq	r3, [pc, #1540]	; 33f8d3a4 <.text+0xd3a4>
33f8cd9c:	0a000005 	beq	33f8cdb8 <.text+0xcdb8>
33f8cda0:	e3700005 	cmn	r0, #5	; 0x5
33f8cda4:	1a000006 	bne	33f8cdc4 <.text+0xcdc4>
33f8cda8:	e5960014 	ldr	r0, [r6, #20]
33f8cdac:	e1a01005 	mov	r1, r5
33f8cdb0:	ebfff9a4 	bl	33f8b448 <inflate_trees_free>
33f8cdb4:	e59f35ec 	ldr	r3, [pc, #1516]	; 33f8d3a8 <.text+0xd3a8>
33f8cdb8:	e3e01002 	mvn	r1, #2	; 0x2
33f8cdbc:	e5853018 	str	r3, [r5, #24]
33f8cdc0:	ea000004 	b	33f8cdd8 <.text+0xcdd8>
33f8cdc4:	e3500000 	cmp	r0, #0	; 0x0
33f8cdc8:	0a000011 	beq	33f8ce14 <.text+0xce14>
33f8cdcc:	e3700003 	cmn	r0, #3	; 0x3
33f8cdd0:	e1a01000 	mov	r1, r0
33f8cdd4:	1a000001 	bne	33f8cde0 <.text+0xcde0>
33f8cdd8:	e3a03009 	mov	r3, #9	; 0x9
33f8cddc:	e5863000 	str	r3, [r6]
33f8cde0:	e586b024 	str	fp, [r6, #36]
33f8cde4:	e586a020 	str	sl, [r6, #32]
33f8cde8:	e5953000 	ldr	r3, [r5]
33f8cdec:	e5952008 	ldr	r2, [r5, #8]
33f8cdf0:	e0633009 	rsb	r3, r3, r9
33f8cdf4:	e0822003 	add	r2, r2, r3
33f8cdf8:	e59d301c 	ldr	r3, [sp, #28]
33f8cdfc:	e5852008 	str	r2, [r5, #8]
33f8ce00:	e5853004 	str	r3, [r5, #4]
33f8ce04:	e5859000 	str	r9, [r5]
33f8ce08:	e59dc028 	ldr	ip, [sp, #40]
33f8ce0c:	e586c034 	str	ip, [r6, #52]
33f8ce10:	ea0000ce 	b	33f8d150 <.text+0xd150>
33f8ce14:	e3a03005 	mov	r3, #5	; 0x5
33f8ce18:	e5860008 	str	r0, [r6, #8]
33f8ce1c:	e5863000 	str	r3, [r6]
33f8ce20:	ea000067 	b	33f8cfc4 <.text+0xcfc4>
33f8ce24:	e5962010 	ldr	r2, [r6, #16]
33f8ce28:	e1a00009 	mov	r0, r9
33f8ce2c:	ea00000b 	b	33f8ce60 <.text+0xce60>
33f8ce30:	e59d001c 	ldr	r0, [sp, #28]
33f8ce34:	e3500000 	cmp	r0, #0	; 0x0
33f8ce38:	e2890001 	add	r0, r9, #1	; 0x1
33f8ce3c:	0a00002d 	beq	33f8cef8 <.text+0xcef8>
33f8ce40:	e5503001 	ldrb	r3, [r0, #-1]
33f8ce44:	e59d101c 	ldr	r1, [sp, #28]
33f8ce48:	e18bba13 	orr	fp, fp, r3, lsl sl
33f8ce4c:	e2411001 	sub	r1, r1, #1	; 0x1
33f8ce50:	e3a03000 	mov	r3, #0	; 0x0
33f8ce54:	e58d101c 	str	r1, [sp, #28]
33f8ce58:	e58d3018 	str	r3, [sp, #24]
33f8ce5c:	e28aa008 	add	sl, sl, #8	; 0x8
33f8ce60:	e15a0002 	cmp	sl, r2
33f8ce64:	e1a09000 	mov	r9, r0
33f8ce68:	3afffff0 	bcc	33f8ce30 <.text+0xce30>
33f8ce6c:	e59f354c 	ldr	r3, [pc, #1356]	; 33f8d3c0 <.text+0xd3c0>
33f8ce70:	e7933102 	ldr	r3, [r3, r2, lsl #2]
33f8ce74:	e5962014 	ldr	r2, [r6, #20]
33f8ce78:	e00b3003 	and	r3, fp, r3
33f8ce7c:	e0822183 	add	r2, r2, r3, lsl #3
33f8ce80:	e592c004 	ldr	ip, [r2, #4]
33f8ce84:	e35c000f 	cmp	ip, #15	; 0xf
33f8ce88:	e5d21001 	ldrb	r1, [r2, #1]
33f8ce8c:	8a000006 	bhi	33f8ceac <.text+0xceac>
33f8ce90:	e1a0b13b 	mov	fp, fp, lsr r1
33f8ce94:	e596200c 	ldr	r2, [r6, #12]
33f8ce98:	e28e3001 	add	r3, lr, #1	; 0x1
33f8ce9c:	e061a00a 	rsb	sl, r1, sl
33f8cea0:	e782c10e 	str	ip, [r2, lr, lsl #2]
33f8cea4:	e5863008 	str	r3, [r6, #8]
33f8cea8:	ea000045 	b	33f8cfc4 <.text+0xcfc4>
33f8ceac:	e35c0012 	cmp	ip, #18	; 0x12
33f8ceb0:	03a0700b 	moveq	r7, #11	; 0xb
33f8ceb4:	03a04007 	moveq	r4, #7	; 0x7
33f8ceb8:	124c400e 	subne	r4, ip, #14	; 0xe
33f8cebc:	13a07003 	movne	r7, #3	; 0x3
33f8cec0:	e1a02000 	mov	r2, r0
33f8cec4:	ea000018 	b	33f8cf2c <.text+0xcf2c>
33f8cec8:	e59d001c 	ldr	r0, [sp, #28]
33f8cecc:	e3500000 	cmp	r0, #0	; 0x0
33f8ced0:	e2892001 	add	r2, r9, #1	; 0x1
33f8ced4:	0a000007 	beq	33f8cef8 <.text+0xcef8>
33f8ced8:	e5523001 	ldrb	r3, [r2, #-1]
33f8cedc:	e18bba13 	orr	fp, fp, r3, lsl sl
33f8cee0:	e2400001 	sub	r0, r0, #1	; 0x1
33f8cee4:	e3a03000 	mov	r3, #0	; 0x0
33f8cee8:	e28aa008 	add	sl, sl, #8	; 0x8
33f8ceec:	e58d001c 	str	r0, [sp, #28]
33f8cef0:	e58d3018 	str	r3, [sp, #24]
33f8cef4:	ea00000c 	b	33f8cf2c <.text+0xcf2c>
33f8cef8:	e586b024 	str	fp, [r6, #36]
33f8cefc:	e586a020 	str	sl, [r6, #32]
33f8cf00:	e5953000 	ldr	r3, [r5]
33f8cf04:	e5952008 	ldr	r2, [r5, #8]
33f8cf08:	e59dc01c 	ldr	ip, [sp, #28]
33f8cf0c:	e0633009 	rsb	r3, r3, r9
33f8cf10:	e0822003 	add	r2, r2, r3
33f8cf14:	e585c004 	str	ip, [r5, #4]
33f8cf18:	e5852008 	str	r2, [r5, #8]
33f8cf1c:	e5859000 	str	r9, [r5]
33f8cf20:	e59de028 	ldr	lr, [sp, #40]
33f8cf24:	e586e034 	str	lr, [r6, #52]
33f8cf28:	eafffe68 	b	33f8c8d0 <.text+0xc8d0>
33f8cf2c:	e0813004 	add	r3, r1, r4
33f8cf30:	e15a0003 	cmp	sl, r3
33f8cf34:	e1a09002 	mov	r9, r2
33f8cf38:	3affffe2 	bcc	33f8cec8 <.text+0xcec8>
33f8cf3c:	e1a0213b 	mov	r2, fp, lsr r1
33f8cf40:	e59f3478 	ldr	r3, [pc, #1144]	; 33f8d3c0 <.text+0xd3c0>
33f8cf44:	e7933104 	ldr	r3, [r3, r4, lsl #2]
33f8cf48:	e0023003 	and	r3, r2, r3
33f8cf4c:	e0870003 	add	r0, r7, r3
33f8cf50:	e061300a 	rsb	r3, r1, sl
33f8cf54:	e59d1020 	ldr	r1, [sp, #32]
33f8cf58:	e08e7000 	add	r7, lr, r0
33f8cf5c:	e1570001 	cmp	r7, r1
33f8cf60:	e064a003 	rsb	sl, r4, r3
33f8cf64:	e1a0b432 	mov	fp, r2, lsr r4
33f8cf68:	8a000005 	bhi	33f8cf84 <.text+0xcf84>
33f8cf6c:	e35c0010 	cmp	ip, #16	; 0x10
33f8cf70:	13a03000 	movne	r3, #0	; 0x0
33f8cf74:	03a03001 	moveq	r3, #1	; 0x1
33f8cf78:	e35e0000 	cmp	lr, #0	; 0x0
33f8cf7c:	035c0010 	cmpeq	ip, #16	; 0x10
33f8cf80:	1a000003 	bne	33f8cf94 <.text+0xcf94>
33f8cf84:	e3a03009 	mov	r3, #9	; 0x9
33f8cf88:	e5863000 	str	r3, [r6]
33f8cf8c:	e59f3418 	ldr	r3, [pc, #1048]	; 33f8d3ac <.text+0xd3ac>
33f8cf90:	eafffe5e 	b	33f8c910 <.text+0xc910>
33f8cf94:	e3530000 	cmp	r3, #0	; 0x0
33f8cf98:	1596300c 	ldrne	r3, [r6, #12]
33f8cf9c:	1083310e 	addne	r3, r3, lr, lsl #2
33f8cfa0:	15131004 	ldrne	r1, [r3, #-4]
33f8cfa4:	01a01003 	moveq	r1, r3
33f8cfa8:	e1a0210e 	mov	r2, lr, lsl #2
33f8cfac:	e596300c 	ldr	r3, [r6, #12]
33f8cfb0:	e2500001 	subs	r0, r0, #1	; 0x1
33f8cfb4:	e7831002 	str	r1, [r3, r2]
33f8cfb8:	e2822004 	add	r2, r2, #4	; 0x4
33f8cfbc:	1afffffa 	bne	33f8cfac <.text+0xcfac>
33f8cfc0:	e5867008 	str	r7, [r6, #8]
33f8cfc4:	e5962004 	ldr	r2, [r6, #4]
33f8cfc8:	e202301f 	and	r3, r2, #31	; 0x1f
33f8cfcc:	e2833c01 	add	r3, r3, #256	; 0x100
33f8cfd0:	e596e008 	ldr	lr, [r6, #8]
33f8cfd4:	e2833002 	add	r3, r3, #2	; 0x2
33f8cfd8:	e1a02b02 	mov	r2, r2, lsl #22
33f8cfdc:	e0832da2 	add	r2, r3, r2, lsr #27
33f8cfe0:	e15e0002 	cmp	lr, r2
33f8cfe4:	e58d2020 	str	r2, [sp, #32]
33f8cfe8:	3affff8d 	bcc	33f8ce24 <.text+0xce24>
33f8cfec:	e1a01005 	mov	r1, r5
33f8cff0:	e5960014 	ldr	r0, [r6, #20]
33f8cff4:	ebfff913 	bl	33f8b448 <inflate_trees_free>
33f8cff8:	e3a03000 	mov	r3, #0	; 0x0
33f8cffc:	e5863014 	str	r3, [r6, #20]
33f8d000:	e3a0e006 	mov	lr, #6	; 0x6
33f8d004:	e2833009 	add	r3, r3, #9	; 0x9
33f8d008:	e58d350c 	str	r3, [sp, #1292]
33f8d00c:	e58de508 	str	lr, [sp, #1288]
33f8d010:	e59fc360 	ldr	ip, [pc, #864]	; 33f8d378 <.text+0xd378>
33f8d014:	e5967004 	ldr	r7, [r6, #4]
33f8d018:	e596000c 	ldr	r0, [r6, #12]
33f8d01c:	e207301f 	and	r3, r7, #31	; 0x1f
33f8d020:	e58dc000 	str	ip, [sp]
33f8d024:	e28dcc05 	add	ip, sp, #1280	; 0x500
33f8d028:	e2834c01 	add	r4, r3, #256	; 0x100
33f8d02c:	e28cc004 	add	ip, ip, #4	; 0x4
33f8d030:	e58dc004 	str	ip, [sp, #4]
33f8d034:	e2844001 	add	r4, r4, #1	; 0x1
33f8d038:	e28dcc05 	add	ip, sp, #1280	; 0x500
33f8d03c:	e59f2370 	ldr	r2, [pc, #880]	; 33f8d3b4 <.text+0xd3b4>
33f8d040:	e28cc00c 	add	ip, ip, #12	; 0xc
33f8d044:	e1a01004 	mov	r1, r4
33f8d048:	e59f3330 	ldr	r3, [pc, #816]	; 33f8d380 <.text+0xd380>
33f8d04c:	e58d0024 	str	r0, [sp, #36]
33f8d050:	e58dc008 	str	ip, [sp, #8]
33f8d054:	e58d500c 	str	r5, [sp, #12]
33f8d058:	ebfff907 	bl	33f8b47c <huft_build>
33f8d05c:	e2502000 	subs	r2, r0, #0	; 0x0
33f8d060:	0a00000a 	beq	33f8d090 <.text+0xd090>
33f8d064:	e3720003 	cmn	r2, #3	; 0x3
33f8d068:	0afffd36 	beq	33f8c548 <.text+0xc548>
33f8d06c:	e3720005 	cmn	r2, #5	; 0x5
33f8d070:	1a000474 	bne	33f8e248 <.text+0xe248>
33f8d074:	e59d0504 	ldr	r0, [sp, #1284]
33f8d078:	e1a01005 	mov	r1, r5
33f8d07c:	ebfff8f1 	bl	33f8b448 <inflate_trees_free>
33f8d080:	e59f3328 	ldr	r3, [pc, #808]	; 33f8d3b0 <.text+0xd3b0>
33f8d084:	e3e02002 	mvn	r2, #2	; 0x2
33f8d088:	e5853018 	str	r3, [r5, #24]
33f8d08c:	ea00046d 	b	33f8e248 <.text+0xe248>
33f8d090:	e59fc2f0 	ldr	ip, [pc, #752]	; 33f8d388 <.text+0xd388>
33f8d094:	e59d3024 	ldr	r3, [sp, #36]
33f8d098:	e58dc000 	str	ip, [sp]
33f8d09c:	e1a012a7 	mov	r1, r7, lsr #5
33f8d0a0:	e28dcc05 	add	ip, sp, #1280	; 0x500
33f8d0a4:	e58dc004 	str	ip, [sp, #4]
33f8d0a8:	e201101f 	and	r1, r1, #31	; 0x1f
33f8d0ac:	e28dcc05 	add	ip, sp, #1280	; 0x500
33f8d0b0:	e0830104 	add	r0, r3, r4, lsl #2
33f8d0b4:	e28cc008 	add	ip, ip, #8	; 0x8
33f8d0b8:	e2811001 	add	r1, r1, #1	; 0x1
33f8d0bc:	e59f32cc 	ldr	r3, [pc, #716]	; 33f8d390 <.text+0xd390>
33f8d0c0:	e58dc008 	str	ip, [sp, #8]
33f8d0c4:	e58d500c 	str	r5, [sp, #12]
33f8d0c8:	ebfff8eb 	bl	33f8b47c <huft_build>
33f8d0cc:	e2504000 	subs	r4, r0, #0	; 0x0
33f8d0d0:	0a000453 	beq	33f8e224 <.text+0xe224>
33f8d0d4:	e3740003 	cmn	r4, #3	; 0x3
33f8d0d8:	059f3280 	ldreq	r3, [pc, #640]	; 33f8d360 <.text+0xd360>
33f8d0dc:	05853018 	streq	r3, [r5, #24]
33f8d0e0:	0a000007 	beq	33f8d104 <.text+0xd104>
33f8d0e4:	e3740005 	cmn	r4, #5	; 0x5
33f8d0e8:	1a000005 	bne	33f8d104 <.text+0xd104>
33f8d0ec:	e59d0500 	ldr	r0, [sp, #1280]
33f8d0f0:	e1a01005 	mov	r1, r5
33f8d0f4:	ebfff8d3 	bl	33f8b448 <inflate_trees_free>
33f8d0f8:	e59f32b0 	ldr	r3, [pc, #688]	; 33f8d3b0 <.text+0xd3b0>
33f8d0fc:	e5853018 	str	r3, [r5, #24]
33f8d100:	e2844002 	add	r4, r4, #2	; 0x2
33f8d104:	e1a01005 	mov	r1, r5
33f8d108:	e59d0504 	ldr	r0, [sp, #1284]
33f8d10c:	ebfff8cd 	bl	33f8b448 <inflate_trees_free>
33f8d110:	e1a01004 	mov	r1, r4
33f8d114:	e3710003 	cmn	r1, #3	; 0x3
33f8d118:	03a03009 	moveq	r3, #9	; 0x9
33f8d11c:	05863000 	streq	r3, [r6]
33f8d120:	e586b024 	str	fp, [r6, #36]
33f8d124:	e586a020 	str	sl, [r6, #32]
33f8d128:	e5953000 	ldr	r3, [r5]
33f8d12c:	e5952008 	ldr	r2, [r5, #8]
33f8d130:	e59dc01c 	ldr	ip, [sp, #28]
33f8d134:	e0633009 	rsb	r3, r3, r9
33f8d138:	e0822003 	add	r2, r2, r3
33f8d13c:	e585c004 	str	ip, [r5, #4]
33f8d140:	e5852008 	str	r2, [r5, #8]
33f8d144:	e5859000 	str	r9, [r5]
33f8d148:	e59de028 	ldr	lr, [sp, #40]
33f8d14c:	e586e034 	str	lr, [r6, #52]
33f8d150:	e1a00006 	mov	r0, r6
33f8d154:	e1a02001 	mov	r2, r1
33f8d158:	ea000374 	b	33f8df30 <.text+0xdf30>
33f8d15c:	e1a01005 	mov	r1, r5
33f8d160:	e59d0500 	ldr	r0, [sp, #1280]
33f8d164:	ebfff8b7 	bl	33f8b448 <inflate_trees_free>
33f8d168:	e1a01005 	mov	r1, r5
33f8d16c:	e59d0504 	ldr	r0, [sp, #1284]
33f8d170:	ebfff8b4 	bl	33f8b448 <inflate_trees_free>
33f8d174:	e586b024 	str	fp, [r6, #36]
33f8d178:	e586a020 	str	sl, [r6, #32]
33f8d17c:	e5953000 	ldr	r3, [r5]
33f8d180:	e5952008 	ldr	r2, [r5, #8]
33f8d184:	e59d001c 	ldr	r0, [sp, #28]
33f8d188:	e0633009 	rsb	r3, r3, r9
33f8d18c:	e0822003 	add	r2, r2, r3
33f8d190:	e9850005 	stmib	r5, {r0, r2}
33f8d194:	e5859000 	str	r9, [r5]
33f8d198:	e59d1028 	ldr	r1, [sp, #40]
33f8d19c:	e5861034 	str	r1, [r6, #52]
33f8d1a0:	e1a00006 	mov	r0, r6
33f8d1a4:	e1a01005 	mov	r1, r5
33f8d1a8:	e3e02003 	mvn	r2, #3	; 0x3
33f8d1ac:	ea000390 	b	33f8dff4 <.text+0xdff4>
33f8d1b0:	e5962018 	ldr	r2, [r6, #24]
33f8d1b4:	e5950028 	ldr	r0, [r5, #40]
33f8d1b8:	e1a02102 	mov	r2, r2, lsl #2
33f8d1bc:	e596100c 	ldr	r1, [r6, #12]
33f8d1c0:	e1a0e00f 	mov	lr, pc
33f8d1c4:	e595f024 	ldr	pc, [r5, #36]
33f8d1c8:	e586400c 	str	r4, [r6, #12]
33f8d1cc:	e59d3504 	ldr	r3, [sp, #1284]
33f8d1d0:	e5863004 	str	r3, [r6, #4]
33f8d1d4:	e59d3500 	ldr	r3, [sp, #1280]
33f8d1d8:	e3a02006 	mov	r2, #6	; 0x6
33f8d1dc:	e5862000 	str	r2, [r6]
33f8d1e0:	e5863008 	str	r3, [r6, #8]
33f8d1e4:	e586b024 	str	fp, [r6, #36]
33f8d1e8:	e586a020 	str	sl, [r6, #32]
33f8d1ec:	e5953000 	ldr	r3, [r5]
33f8d1f0:	e5952008 	ldr	r2, [r5, #8]
33f8d1f4:	e0633009 	rsb	r3, r3, r9
33f8d1f8:	e0822003 	add	r2, r2, r3
33f8d1fc:	e59d301c 	ldr	r3, [sp, #28]
33f8d200:	e5859000 	str	r9, [r5]
33f8d204:	e5853004 	str	r3, [r5, #4]
33f8d208:	e5852008 	str	r2, [r5, #8]
33f8d20c:	e59dc028 	ldr	ip, [sp, #40]
33f8d210:	e5963030 	ldr	r3, [r6, #48]
33f8d214:	e586c034 	str	ip, [r6, #52]
33f8d218:	e15c0003 	cmp	ip, r3
33f8d21c:	2596302c 	ldrcs	r3, [r6, #44]
33f8d220:	259d0028 	ldrcs	r0, [sp, #40]
33f8d224:	306c3003 	rsbcc	r3, ip, r3
33f8d228:	e596900c 	ldr	r9, [r6, #12]
33f8d22c:	e8950c00 	ldmia	r5, {sl, fp}
33f8d230:	e2864020 	add	r4, r6, #32	; 0x20
33f8d234:	e8940090 	ldmia	r4, {r4, r7}
33f8d238:	3243e001 	subcc	lr, r3, #1	; 0x1
33f8d23c:	2060e003 	rsbcs	lr, r0, r3
33f8d240:	e5993000 	ldr	r3, [r9]
33f8d244:	e3530009 	cmp	r3, #9	; 0x9
33f8d248:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f8d24c:	ea0002e4 	b	33f8dde4 <.text+0xdde4>
33f8d250:	33f8d278 	mvnccs	sp, #-2147483641	; 0x80000007
33f8d254:	33f8d774 	mvnccs	sp, #30408704	; 0x1d00000
33f8d258:	33f8d894 	mvnccs	sp, #9699328	; 0x940000
33f8d25c:	33f8d940 	mvnccs	sp, #1048576	; 0x100000
33f8d260:	33f8da24 	mvnccs	sp, #147456	; 0x24000
33f8d264:	33f8dabc 	mvnccs	sp, #770048	; 0xbc000
33f8d268:	33f8dc30 	mvnccs	sp, #12288	; 0x3000
33f8d26c:	33f8dd04 	mvnccs	sp, #256	; 0x100
33f8d270:	33f8dd70 	mvnccs	sp, #7168	; 0x1c00
33f8d274:	33f8dda8 	mvnccs	sp, #10752	; 0x2a00
33f8d278:	e59f3134 	ldr	r3, [pc, #308]	; 33f8d3b4 <.text+0xd3b4>
33f8d27c:	e15e0003 	cmp	lr, r3
33f8d280:	835b0009 	cmphi	fp, #9	; 0x9
33f8d284:	9a000134 	bls	33f8d75c <.text+0xd75c>
33f8d288:	e5867024 	str	r7, [r6, #36]
33f8d28c:	e5864020 	str	r4, [r6, #32]
33f8d290:	e5953000 	ldr	r3, [r5]
33f8d294:	e5952008 	ldr	r2, [r5, #8]
33f8d298:	e063300a 	rsb	r3, r3, sl
33f8d29c:	e0822003 	add	r2, r2, r3
33f8d2a0:	e8850c00 	stmia	r5, {sl, fp}
33f8d2a4:	e5852008 	str	r2, [r5, #8]
33f8d2a8:	e59d1028 	ldr	r1, [sp, #40]
33f8d2ac:	e5861034 	str	r1, [r6, #52]
33f8d2b0:	e5963030 	ldr	r3, [r6, #48]
33f8d2b4:	e599c014 	ldr	ip, [r9, #20]
33f8d2b8:	e1510003 	cmp	r1, r3
33f8d2bc:	e5d92011 	ldrb	r2, [r9, #17]
33f8d2c0:	e5d91010 	ldrb	r1, [r9, #16]
33f8d2c4:	e58dc040 	str	ip, [sp, #64]
33f8d2c8:	e599e018 	ldr	lr, [r9, #24]
33f8d2cc:	e58de03c 	str	lr, [sp, #60]
33f8d2d0:	e5950000 	ldr	r0, [r5]
33f8d2d4:	e58d0038 	str	r0, [sp, #56]
33f8d2d8:	e595c004 	ldr	ip, [r5, #4]
33f8d2dc:	e58dc034 	str	ip, [sp, #52]
33f8d2e0:	259dc028 	ldrcs	ip, [sp, #40]
33f8d2e4:	2596302c 	ldrcs	r3, [r6, #44]
33f8d2e8:	e2860020 	add	r0, r6, #32	; 0x20
33f8d2ec:	e8904001 	ldmia	r0, {r0, lr}
33f8d2f0:	206cb003 	rsbcs	fp, ip, r3
33f8d2f4:	359dc028 	ldrcc	ip, [sp, #40]
33f8d2f8:	306c3003 	rsbcc	r3, ip, r3
33f8d2fc:	3243b001 	subcc	fp, r3, #1	; 0x1
33f8d300:	ea00000b 	b	33f8d334 <.text+0xd334>
33f8d304:	e586e024 	str	lr, [r6, #36]
33f8d308:	e5862020 	str	r2, [r6, #32]
33f8d30c:	e59de038 	ldr	lr, [sp, #56]
33f8d310:	e5953000 	ldr	r3, [r5]
33f8d314:	e061000e 	rsb	r0, r1, lr
33f8d318:	e5952008 	ldr	r2, [r5, #8]
33f8d31c:	e59dc034 	ldr	ip, [sp, #52]
33f8d320:	e0633000 	rsb	r3, r3, r0
33f8d324:	e08c1001 	add	r1, ip, r1
33f8d328:	e0822003 	add	r2, r2, r3
33f8d32c:	e3a0e001 	mov	lr, #1	; 0x1
33f8d330:	ea0000b6 	b	33f8d610 <.text+0xd610>
33f8d334:	e59f3084 	ldr	r3, [pc, #132]	; 33f8d3c0 <.text+0xd3c0>
33f8d338:	e7932102 	ldr	r2, [r3, r2, lsl #2]
33f8d33c:	e7931101 	ldr	r1, [r3, r1, lsl #2]
33f8d340:	e58d202c 	str	r2, [sp, #44]
33f8d344:	e58d1030 	str	r1, [sp, #48]
33f8d348:	ea000025 	b	33f8d3e4 <.text+0xd3e4>
33f8d34c:	33f94f34 	mvnccs	r4, #208	; 0xd0
33f8d350:	33f94d9c 	mvnccs	r4, #9984	; 0x2700
33f8d354:	33f94db8 	mvnccs	r4, #11776	; 0x2e00
33f8d358:	33f94dcc 	mvnccs	r4, #13056	; 0x3300
33f8d35c:	33f94de4 	mvnccs	r4, #14592	; 0x3900
33f8d360:	33f94ebc 	mvnccs	r4, #3008	; 0xbc0
33f8d364:	33f96b74 	mvnccs	r6, #118784	; 0x1d000
33f8d368:	33f96b78 	mvnccs	r6, #122880	; 0x1e000
33f8d36c:	33f8b420 	mvnccs	fp, #536870912	; 0x20000000
33f8d370:	33f8b444 	mvnccs	fp, #1140850688	; 0x44000000
33f8d374:	33f97c0c 	mvnccs	r7, #3072	; 0xc00
33f8d378:	33f95c68 	mvnccs	r5, #26624	; 0x6800
33f8d37c:	33f97c14 	mvnccs	r7, #5120	; 0x1400
33f8d380:	33f95bec 	mvnccs	r5, #241664	; 0x3b000
33f8d384:	33f97c10 	mvnccs	r7, #4096	; 0x1000
33f8d388:	33f95d5c 	mvnccs	r5, #5888	; 0x1700
33f8d38c:	33f97c18 	mvnccs	r7, #6144	; 0x1800
33f8d390:	33f95ce4 	mvnccs	r5, #58368	; 0xe400
33f8d394:	33f94dfc 	mvnccs	r4, #16128	; 0x3f00
33f8d398:	33f94e10 	mvnccs	r4, #256	; 0x100
33f8d39c:	33f94e30 	mvnccs	r4, #768	; 0x300
33f8d3a0:	33f91cd0 	mvnccs	r1, #53248	; 0xd000
33f8d3a4:	33f94e54 	mvnccs	r4, #1344	; 0x540
33f8d3a8:	33f94e7c 	mvnccs	r4, #1984	; 0x7c0
33f8d3ac:	33f94ea0 	mvnccs	r4, #2560	; 0xa00
33f8d3b0:	33f94ee0 	mvnccs	r4, #3584	; 0xe00
33f8d3b4:	00000101 	andeq	r0, r0, r1, lsl #2
33f8d3b8:	33f94f18 	mvnccs	r4, #96	; 0x60
33f8d3bc:	33f94f00 	mvnccs	r4, #0	; 0x0
33f8d3c0:	33f91d1c 	mvnccs	r1, #1792	; 0x700
33f8d3c4:	e59d1038 	ldr	r1, [sp, #56]
33f8d3c8:	e59d2034 	ldr	r2, [sp, #52]
33f8d3cc:	e4d13001 	ldrb	r3, [r1], #1
33f8d3d0:	e2422001 	sub	r2, r2, #1	; 0x1
33f8d3d4:	e58d1038 	str	r1, [sp, #56]
33f8d3d8:	e58d2034 	str	r2, [sp, #52]
33f8d3dc:	e18ee013 	orr	lr, lr, r3, lsl r0
33f8d3e0:	e2800008 	add	r0, r0, #8	; 0x8
33f8d3e4:	e3500013 	cmp	r0, #19	; 0x13
33f8d3e8:	9afffff5 	bls	33f8d3c4 <.text+0xd3c4>
33f8d3ec:	e59dc030 	ldr	ip, [sp, #48]
33f8d3f0:	e59d1040 	ldr	r1, [sp, #64]
33f8d3f4:	e00e300c 	and	r3, lr, ip
33f8d3f8:	e1a03183 	mov	r3, r3, lsl #3
33f8d3fc:	e7d12003 	ldrb	r2, [r1, r3]
33f8d400:	e3520000 	cmp	r2, #0	; 0x0
33f8d404:	e0811003 	add	r1, r1, r3
33f8d408:	11a0c002 	movne	ip, r2
33f8d40c:	1a000006 	bne	33f8d42c <.text+0xd42c>
33f8d410:	e5d12001 	ldrb	r2, [r1, #1]
33f8d414:	e1a0e23e 	mov	lr, lr, lsr r2
33f8d418:	e5913004 	ldr	r3, [r1, #4]
33f8d41c:	e59dc028 	ldr	ip, [sp, #40]
33f8d420:	e4cc3001 	strb	r3, [ip], #1
33f8d424:	e58dc028 	str	ip, [sp, #40]
33f8d428:	ea00008e 	b	33f8d668 <.text+0xd668>
33f8d42c:	e5d13001 	ldrb	r3, [r1, #1]
33f8d430:	e31c0010 	tst	ip, #16	; 0x10
33f8d434:	e0630000 	rsb	r0, r3, r0
33f8d438:	e1a0e33e 	mov	lr, lr, lsr r3
33f8d43c:	0a000078 	beq	33f8d624 <.text+0xd624>
33f8d440:	e20c200f 	and	r2, ip, #15	; 0xf
33f8d444:	e1a0723e 	mov	r7, lr, lsr r2
33f8d448:	e51f3090 	ldr	r3, [pc, #-144]	; 33f8d3c0 <.text+0xd3c0>
33f8d44c:	e591a004 	ldr	sl, [r1, #4]
33f8d450:	e793c102 	ldr	ip, [r3, r2, lsl #2]
33f8d454:	e0624000 	rsb	r4, r2, r0
33f8d458:	ea000007 	b	33f8d47c <.text+0xd47c>
33f8d45c:	e59d0038 	ldr	r0, [sp, #56]
33f8d460:	e59d1034 	ldr	r1, [sp, #52]
33f8d464:	e4d03001 	ldrb	r3, [r0], #1
33f8d468:	e2411001 	sub	r1, r1, #1	; 0x1
33f8d46c:	e58d0038 	str	r0, [sp, #56]
33f8d470:	e58d1034 	str	r1, [sp, #52]
33f8d474:	e1877413 	orr	r7, r7, r3, lsl r4
33f8d478:	e2844008 	add	r4, r4, #8	; 0x8
33f8d47c:	e354000e 	cmp	r4, #14	; 0xe
33f8d480:	9afffff5 	bls	33f8d45c <.text+0xd45c>
33f8d484:	e59d202c 	ldr	r2, [sp, #44]
33f8d488:	e59d003c 	ldr	r0, [sp, #60]
33f8d48c:	e0073002 	and	r3, r7, r2
33f8d490:	e1a03183 	mov	r3, r3, lsl #3
33f8d494:	e7d01003 	ldrb	r1, [r0, r3]
33f8d498:	e0802003 	add	r2, r0, r3
33f8d49c:	e5d23001 	ldrb	r3, [r2, #1]
33f8d4a0:	e3110010 	tst	r1, #16	; 0x10
33f8d4a4:	e0634004 	rsb	r4, r3, r4
33f8d4a8:	e1a07337 	mov	r7, r7, lsr r3
33f8d4ac:	0a00003e 	beq	33f8d5ac <.text+0xd5ac>
33f8d4b0:	e201100f 	and	r1, r1, #15	; 0xf
33f8d4b4:	e58d1048 	str	r1, [sp, #72]
33f8d4b8:	ea000007 	b	33f8d4dc <.text+0xd4dc>
33f8d4bc:	e28d0034 	add	r0, sp, #52	; 0x34
33f8d4c0:	e8900003 	ldmia	r0, {r0, r1}
33f8d4c4:	e4d13001 	ldrb	r3, [r1], #1
33f8d4c8:	e2400001 	sub	r0, r0, #1	; 0x1
33f8d4cc:	e58d1038 	str	r1, [sp, #56]
33f8d4d0:	e58d0034 	str	r0, [sp, #52]
33f8d4d4:	e1877413 	orr	r7, r7, r3, lsl r4
33f8d4d8:	e2844008 	add	r4, r4, #8	; 0x8
33f8d4dc:	e59d1048 	ldr	r1, [sp, #72]
33f8d4e0:	e1540001 	cmp	r4, r1
33f8d4e4:	3afffff4 	bcc	33f8d4bc <.text+0xd4bc>
33f8d4e8:	e51f3130 	ldr	r3, [pc, #-304]	; 33f8d3c0 <.text+0xd3c0>
33f8d4ec:	e7933101 	ldr	r3, [r3, r1, lsl #2]
33f8d4f0:	e5922004 	ldr	r2, [r2, #4]
33f8d4f4:	e0073003 	and	r3, r7, r3
33f8d4f8:	e0832002 	add	r2, r3, r2
33f8d4fc:	e5961028 	ldr	r1, [r6, #40]
33f8d500:	e59d3028 	ldr	r3, [sp, #40]
33f8d504:	e0611003 	rsb	r1, r1, r3
33f8d508:	e1510002 	cmp	r1, r2
33f8d50c:	e00e300c 	and	r3, lr, ip
33f8d510:	e08aa003 	add	sl, sl, r3
33f8d514:	3a00000c 	bcc	33f8d54c <.text+0xd54c>
33f8d518:	e59dc028 	ldr	ip, [sp, #40]
33f8d51c:	e062000c 	rsb	r0, r2, ip
33f8d520:	e1a01000 	mov	r1, r0
33f8d524:	e4d13001 	ldrb	r3, [r1], #1
33f8d528:	e1a0200c 	mov	r2, ip
33f8d52c:	e4c23001 	strb	r3, [r2], #1
33f8d530:	e5d03001 	ldrb	r3, [r0, #1]
33f8d534:	e2822001 	add	r2, r2, #1	; 0x1
33f8d538:	e2811001 	add	r1, r1, #1	; 0x1
33f8d53c:	e24a0002 	sub	r0, sl, #2	; 0x2
33f8d540:	e5cc3001 	strb	r3, [ip, #1]
33f8d544:	e58d2028 	str	r2, [sp, #40]
33f8d548:	ea000010 	b	33f8d590 <.text+0xd590>
33f8d54c:	e0610002 	rsb	r0, r1, r2
33f8d550:	e596302c 	ldr	r3, [r6, #44]
33f8d554:	e15a0000 	cmp	sl, r0
33f8d558:	e0601003 	rsb	r1, r0, r3
33f8d55c:	91a0000a 	movls	r0, sl
33f8d560:	9a00000a 	bls	33f8d590 <.text+0xd590>
33f8d564:	e59dc028 	ldr	ip, [sp, #40]
33f8d568:	e1a02000 	mov	r2, r0
33f8d56c:	e4d13001 	ldrb	r3, [r1], #1
33f8d570:	e2522001 	subs	r2, r2, #1	; 0x1
33f8d574:	e4cc3001 	strb	r3, [ip], #1
33f8d578:	1afffffb 	bne	33f8d56c <.text+0xd56c>
33f8d57c:	e59de028 	ldr	lr, [sp, #40]
33f8d580:	e08ee000 	add	lr, lr, r0
33f8d584:	e5961028 	ldr	r1, [r6, #40]
33f8d588:	e58de028 	str	lr, [sp, #40]
33f8d58c:	e060000a 	rsb	r0, r0, sl
33f8d590:	e59dc028 	ldr	ip, [sp, #40]
33f8d594:	e1a02000 	mov	r2, r0
33f8d598:	e4d13001 	ldrb	r3, [r1], #1
33f8d59c:	e2522001 	subs	r2, r2, #1	; 0x1
33f8d5a0:	e4cc3001 	strb	r3, [ip], #1
33f8d5a4:	0a00003b 	beq	33f8d698 <.text+0xd698>
33f8d5a8:	eafffffa 	b	33f8d598 <.text+0xd598>
33f8d5ac:	e3110040 	tst	r1, #64	; 0x40
33f8d5b0:	1a000007 	bne	33f8d5d4 <.text+0xd5d4>
33f8d5b4:	e51f31fc 	ldr	r3, [pc, #-508]	; 33f8d3c0 <.text+0xd3c0>
33f8d5b8:	e7933101 	ldr	r3, [r3, r1, lsl #2]
33f8d5bc:	e5922004 	ldr	r2, [r2, #4]
33f8d5c0:	e0073003 	and	r3, r7, r3
33f8d5c4:	e1a03183 	mov	r3, r3, lsl #3
33f8d5c8:	e7d31002 	ldrb	r1, [r3, r2]
33f8d5cc:	e0832002 	add	r2, r3, r2
33f8d5d0:	eaffffb1 	b	33f8d49c <.text+0xd49c>
33f8d5d4:	e51f3220 	ldr	r3, [pc, #-544]	; 33f8d3bc <.text+0xd3bc>
33f8d5d8:	e2042007 	and	r2, r4, #7	; 0x7
33f8d5dc:	e5853018 	str	r3, [r5, #24]
33f8d5e0:	e5867024 	str	r7, [r6, #36]
33f8d5e4:	e5862020 	str	r2, [r6, #32]
33f8d5e8:	e1a011a4 	mov	r1, r4, lsr #3
33f8d5ec:	e59d2038 	ldr	r2, [sp, #56]
33f8d5f0:	e5953000 	ldr	r3, [r5]
33f8d5f4:	e0610002 	rsb	r0, r1, r2
33f8d5f8:	e59dc034 	ldr	ip, [sp, #52]
33f8d5fc:	e5952008 	ldr	r2, [r5, #8]
33f8d600:	e0633000 	rsb	r3, r3, r0
33f8d604:	e08c1001 	add	r1, ip, r1
33f8d608:	e0822003 	add	r2, r2, r3
33f8d60c:	e3e0e002 	mvn	lr, #2	; 0x2
33f8d610:	e58de018 	str	lr, [sp, #24]
33f8d614:	e8850007 	stmia	r5, {r0, r1, r2}
33f8d618:	e59d0028 	ldr	r0, [sp, #40]
33f8d61c:	e5860034 	str	r0, [r6, #52]
33f8d620:	ea00003a 	b	33f8d710 <.text+0xd710>
33f8d624:	e31c0040 	tst	ip, #64	; 0x40
33f8d628:	1a000011 	bne	33f8d674 <.text+0xd674>
33f8d62c:	e51f3274 	ldr	r3, [pc, #-628]	; 33f8d3c0 <.text+0xd3c0>
33f8d630:	e793310c 	ldr	r3, [r3, ip, lsl #2]
33f8d634:	e5911004 	ldr	r1, [r1, #4]
33f8d638:	e00e3003 	and	r3, lr, r3
33f8d63c:	e1a03183 	mov	r3, r3, lsl #3
33f8d640:	e7d32001 	ldrb	r2, [r3, r1]
33f8d644:	e252c000 	subs	ip, r2, #0	; 0x0
33f8d648:	e0831001 	add	r1, r3, r1
33f8d64c:	1affff76 	bne	33f8d42c <.text+0xd42c>
33f8d650:	e5d12001 	ldrb	r2, [r1, #1]
33f8d654:	e1a0e23e 	mov	lr, lr, lsr r2
33f8d658:	e5913004 	ldr	r3, [r1, #4]
33f8d65c:	e59d1028 	ldr	r1, [sp, #40]
33f8d660:	e4c13001 	strb	r3, [r1], #1
33f8d664:	e58d1028 	str	r1, [sp, #40]
33f8d668:	e0620000 	rsb	r0, r2, r0
33f8d66c:	e24bb001 	sub	fp, fp, #1	; 0x1
33f8d670:	ea00000f 	b	33f8d6b4 <.text+0xd6b4>
33f8d674:	e31c0020 	tst	ip, #32	; 0x20
33f8d678:	e2002007 	and	r2, r0, #7	; 0x7
33f8d67c:	e1a011a0 	mov	r1, r0, lsr #3
33f8d680:	1affff1f 	bne	33f8d304 <.text+0xd304>
33f8d684:	e51f32d4 	ldr	r3, [pc, #-724]	; 33f8d3b8 <.text+0xd3b8>
33f8d688:	e5853018 	str	r3, [r5, #24]
33f8d68c:	e586e024 	str	lr, [r6, #36]
33f8d690:	e5862020 	str	r2, [r6, #32]
33f8d694:	eaffffd4 	b	33f8d5ec <.text+0xd5ec>
33f8d698:	e59d1048 	ldr	r1, [sp, #72]
33f8d69c:	e1a0e137 	mov	lr, r7, lsr r1
33f8d6a0:	e59d2028 	ldr	r2, [sp, #40]
33f8d6a4:	e0822000 	add	r2, r2, r0
33f8d6a8:	e58d2028 	str	r2, [sp, #40]
33f8d6ac:	e0610004 	rsb	r0, r1, r4
33f8d6b0:	e06ab00b 	rsb	fp, sl, fp
33f8d6b4:	e51f3308 	ldr	r3, [pc, #-776]	; 33f8d3b4 <.text+0xd3b4>
33f8d6b8:	e59d1034 	ldr	r1, [sp, #52]
33f8d6bc:	e15b0003 	cmp	fp, r3
33f8d6c0:	83510009 	cmphi	r1, #9	; 0x9
33f8d6c4:	93a0c000 	movls	ip, #0	; 0x0
33f8d6c8:	83a0c001 	movhi	ip, #1	; 0x1
33f8d6cc:	8affff44 	bhi	33f8d3e4 <.text+0xd3e4>
33f8d6d0:	e2003007 	and	r3, r0, #7	; 0x7
33f8d6d4:	e586e024 	str	lr, [r6, #36]
33f8d6d8:	e5863020 	str	r3, [r6, #32]
33f8d6dc:	e59d2038 	ldr	r2, [sp, #56]
33f8d6e0:	e5953000 	ldr	r3, [r5]
33f8d6e4:	e1a011a0 	mov	r1, r0, lsr #3
33f8d6e8:	e0610002 	rsb	r0, r1, r2
33f8d6ec:	e59de034 	ldr	lr, [sp, #52]
33f8d6f0:	e5952008 	ldr	r2, [r5, #8]
33f8d6f4:	e0633000 	rsb	r3, r3, r0
33f8d6f8:	e08e1001 	add	r1, lr, r1
33f8d6fc:	e0822003 	add	r2, r2, r3
33f8d700:	e8850007 	stmia	r5, {r0, r1, r2}
33f8d704:	e59d0028 	ldr	r0, [sp, #40]
33f8d708:	e5860034 	str	r0, [r6, #52]
33f8d70c:	e58dc018 	str	ip, [sp, #24]
33f8d710:	e5961034 	ldr	r1, [r6, #52]
33f8d714:	e58d1028 	str	r1, [sp, #40]
33f8d718:	e5963030 	ldr	r3, [r6, #48]
33f8d71c:	e1510003 	cmp	r1, r3
33f8d720:	2596302c 	ldrcs	r3, [r6, #44]
33f8d724:	259d2028 	ldrcs	r2, [sp, #40]
33f8d728:	30613003 	rsbcc	r3, r1, r3
33f8d72c:	3243e001 	subcc	lr, r3, #1	; 0x1
33f8d730:	2062e003 	rsbcs	lr, r2, r3
33f8d734:	e59d3018 	ldr	r3, [sp, #24]
33f8d738:	e3530000 	cmp	r3, #0	; 0x0
33f8d73c:	e8950c00 	ldmia	r5, {sl, fp}
33f8d740:	e2864020 	add	r4, r6, #32	; 0x20
33f8d744:	e8940090 	ldmia	r4, {r4, r7}
33f8d748:	0a000003 	beq	33f8d75c <.text+0xd75c>
33f8d74c:	e3530001 	cmp	r3, #1	; 0x1
33f8d750:	13a03009 	movne	r3, #9	; 0x9
33f8d754:	03a03007 	moveq	r3, #7	; 0x7
33f8d758:	ea000167 	b	33f8dcfc <.text+0xdcfc>
33f8d75c:	e5d93010 	ldrb	r3, [r9, #16]
33f8d760:	e5992014 	ldr	r2, [r9, #20]
33f8d764:	e589300c 	str	r3, [r9, #12]
33f8d768:	e3a03001 	mov	r3, #1	; 0x1
33f8d76c:	e5892008 	str	r2, [r9, #8]
33f8d770:	e5893000 	str	r3, [r9]
33f8d774:	e599100c 	ldr	r1, [r9, #12]
33f8d778:	e1a0200a 	mov	r2, sl
33f8d77c:	ea000015 	b	33f8d7d8 <.text+0xd7d8>
33f8d780:	e35b0000 	cmp	fp, #0	; 0x0
33f8d784:	e28a2001 	add	r2, sl, #1	; 0x1
33f8d788:	0a000006 	beq	33f8d7a8 <.text+0xd7a8>
33f8d78c:	e5523001 	ldrb	r3, [r2, #-1]
33f8d790:	e1877413 	orr	r7, r7, r3, lsl r4
33f8d794:	e3a0c000 	mov	ip, #0	; 0x0
33f8d798:	e24bb001 	sub	fp, fp, #1	; 0x1
33f8d79c:	e2844008 	add	r4, r4, #8	; 0x8
33f8d7a0:	e58dc018 	str	ip, [sp, #24]
33f8d7a4:	ea00000b 	b	33f8d7d8 <.text+0xd7d8>
33f8d7a8:	e5867024 	str	r7, [r6, #36]
33f8d7ac:	e5864020 	str	r4, [r6, #32]
33f8d7b0:	e5953000 	ldr	r3, [r5]
33f8d7b4:	e5952008 	ldr	r2, [r5, #8]
33f8d7b8:	e063300a 	rsb	r3, r3, sl
33f8d7bc:	e0822003 	add	r2, r2, r3
33f8d7c0:	e585b004 	str	fp, [r5, #4]
33f8d7c4:	e5852008 	str	r2, [r5, #8]
33f8d7c8:	e585a000 	str	sl, [r5]
33f8d7cc:	e59de028 	ldr	lr, [sp, #40]
33f8d7d0:	e586e034 	str	lr, [r6, #52]
33f8d7d4:	ea000046 	b	33f8d8f4 <.text+0xd8f4>
33f8d7d8:	e1540001 	cmp	r4, r1
33f8d7dc:	e1a0a002 	mov	sl, r2
33f8d7e0:	3affffe6 	bcc	33f8d780 <.text+0xd780>
33f8d7e4:	e51f342c 	ldr	r3, [pc, #-1068]	; 33f8d3c0 <.text+0xd3c0>
33f8d7e8:	e7933101 	ldr	r3, [r3, r1, lsl #2]
33f8d7ec:	e5992008 	ldr	r2, [r9, #8]
33f8d7f0:	e0073003 	and	r3, r7, r3
33f8d7f4:	e1a03183 	mov	r3, r3, lsl #3
33f8d7f8:	e7d31002 	ldrb	r1, [r3, r2]
33f8d7fc:	e0832002 	add	r2, r3, r2
33f8d800:	e5d23001 	ldrb	r3, [r2, #1]
33f8d804:	e3510000 	cmp	r1, #0	; 0x0
33f8d808:	e0634004 	rsb	r4, r3, r4
33f8d80c:	e1a07337 	mov	r7, r7, lsr r3
33f8d810:	05923004 	ldreq	r3, [r2, #4]
33f8d814:	05893008 	streq	r3, [r9, #8]
33f8d818:	03a03006 	moveq	r3, #6	; 0x6
33f8d81c:	0a000136 	beq	33f8dcfc <.text+0xdcfc>
33f8d820:	e3110010 	tst	r1, #16	; 0x10
33f8d824:	0a000005 	beq	33f8d840 <.text+0xd840>
33f8d828:	e201300f 	and	r3, r1, #15	; 0xf
33f8d82c:	e5893008 	str	r3, [r9, #8]
33f8d830:	e5923004 	ldr	r3, [r2, #4]
33f8d834:	e5893004 	str	r3, [r9, #4]
33f8d838:	e3a03002 	mov	r3, #2	; 0x2
33f8d83c:	ea00012e 	b	33f8dcfc <.text+0xdcfc>
33f8d840:	e3110040 	tst	r1, #64	; 0x40
33f8d844:	0a00006d 	beq	33f8da00 <.text+0xda00>
33f8d848:	e3110020 	tst	r1, #32	; 0x20
33f8d84c:	13a03007 	movne	r3, #7	; 0x7
33f8d850:	1a000129 	bne	33f8dcfc <.text+0xdcfc>
33f8d854:	e3a03009 	mov	r3, #9	; 0x9
33f8d858:	e5893000 	str	r3, [r9]
33f8d85c:	e51f34ac 	ldr	r3, [pc, #-1196]	; 33f8d3b8 <.text+0xd3b8>
33f8d860:	e5853018 	str	r3, [r5, #24]
33f8d864:	e5867024 	str	r7, [r6, #36]
33f8d868:	e5864020 	str	r4, [r6, #32]
33f8d86c:	e5953000 	ldr	r3, [r5]
33f8d870:	e5952008 	ldr	r2, [r5, #8]
33f8d874:	e063300a 	rsb	r3, r3, sl
33f8d878:	e0822003 	add	r2, r2, r3
33f8d87c:	e585b004 	str	fp, [r5, #4]
33f8d880:	e5852008 	str	r2, [r5, #8]
33f8d884:	e585a000 	str	sl, [r5]
33f8d888:	e59d0028 	ldr	r0, [sp, #40]
33f8d88c:	e5860034 	str	r0, [r6, #52]
33f8d890:	ea00014f 	b	33f8ddd4 <.text+0xddd4>
33f8d894:	e599c008 	ldr	ip, [r9, #8]
33f8d898:	e1a0200a 	mov	r2, sl
33f8d89c:	ea000016 	b	33f8d8fc <.text+0xd8fc>
33f8d8a0:	e35b0000 	cmp	fp, #0	; 0x0
33f8d8a4:	e28a2001 	add	r2, sl, #1	; 0x1
33f8d8a8:	0a000006 	beq	33f8d8c8 <.text+0xd8c8>
33f8d8ac:	e5523001 	ldrb	r3, [r2, #-1]
33f8d8b0:	e1877413 	orr	r7, r7, r3, lsl r4
33f8d8b4:	e3a01000 	mov	r1, #0	; 0x0
33f8d8b8:	e24bb001 	sub	fp, fp, #1	; 0x1
33f8d8bc:	e2844008 	add	r4, r4, #8	; 0x8
33f8d8c0:	e58d1018 	str	r1, [sp, #24]
33f8d8c4:	ea00000c 	b	33f8d8fc <.text+0xd8fc>
33f8d8c8:	e5867024 	str	r7, [r6, #36]
33f8d8cc:	e5864020 	str	r4, [r6, #32]
33f8d8d0:	e5953000 	ldr	r3, [r5]
33f8d8d4:	e5952008 	ldr	r2, [r5, #8]
33f8d8d8:	e063300a 	rsb	r3, r3, sl
33f8d8dc:	e0822003 	add	r2, r2, r3
33f8d8e0:	e585b004 	str	fp, [r5, #4]
33f8d8e4:	e5852008 	str	r2, [r5, #8]
33f8d8e8:	e585a000 	str	sl, [r5]
33f8d8ec:	e59d2028 	ldr	r2, [sp, #40]
33f8d8f0:	e5862034 	str	r2, [r6, #52]
33f8d8f4:	e59d2018 	ldr	r2, [sp, #24]
33f8d8f8:	ea000117 	b	33f8dd5c <.text+0xdd5c>
33f8d8fc:	e154000c 	cmp	r4, ip
33f8d900:	e1a0a002 	mov	sl, r2
33f8d904:	3affffe5 	bcc	33f8d8a0 <.text+0xd8a0>
33f8d908:	e51f3550 	ldr	r3, [pc, #-1360]	; 33f8d3c0 <.text+0xd3c0>
33f8d90c:	e793210c 	ldr	r2, [r3, ip, lsl #2]
33f8d910:	e0072002 	and	r2, r7, r2
33f8d914:	e1a07c37 	mov	r7, r7, lsr ip
33f8d918:	e5993004 	ldr	r3, [r9, #4]
33f8d91c:	e5d91011 	ldrb	r1, [r9, #17]
33f8d920:	e0833002 	add	r3, r3, r2
33f8d924:	e5990018 	ldr	r0, [r9, #24]
33f8d928:	e5893004 	str	r3, [r9, #4]
33f8d92c:	e3a03003 	mov	r3, #3	; 0x3
33f8d930:	e589100c 	str	r1, [r9, #12]
33f8d934:	e5890008 	str	r0, [r9, #8]
33f8d938:	e5893000 	str	r3, [r9]
33f8d93c:	e06c4004 	rsb	r4, ip, r4
33f8d940:	e599100c 	ldr	r1, [r9, #12]
33f8d944:	e1a0200a 	mov	r2, sl
33f8d948:	ea000015 	b	33f8d9a4 <.text+0xd9a4>
33f8d94c:	e35b0000 	cmp	fp, #0	; 0x0
33f8d950:	e28a2001 	add	r2, sl, #1	; 0x1
33f8d954:	0a000006 	beq	33f8d974 <.text+0xd974>
33f8d958:	e5523001 	ldrb	r3, [r2, #-1]
33f8d95c:	e1877413 	orr	r7, r7, r3, lsl r4
33f8d960:	e24bb001 	sub	fp, fp, #1	; 0x1
33f8d964:	e3a03000 	mov	r3, #0	; 0x0
33f8d968:	e2844008 	add	r4, r4, #8	; 0x8
33f8d96c:	e58d3018 	str	r3, [sp, #24]
33f8d970:	ea00000b 	b	33f8d9a4 <.text+0xd9a4>
33f8d974:	e5867024 	str	r7, [r6, #36]
33f8d978:	e5864020 	str	r4, [r6, #32]
33f8d97c:	e5953000 	ldr	r3, [r5]
33f8d980:	e5952008 	ldr	r2, [r5, #8]
33f8d984:	e063300a 	rsb	r3, r3, sl
33f8d988:	e0822003 	add	r2, r2, r3
33f8d98c:	e585b004 	str	fp, [r5, #4]
33f8d990:	e5852008 	str	r2, [r5, #8]
33f8d994:	e585a000 	str	sl, [r5]
33f8d998:	e59dc028 	ldr	ip, [sp, #40]
33f8d99c:	e586c034 	str	ip, [r6, #52]
33f8d9a0:	eaffffd3 	b	33f8d8f4 <.text+0xd8f4>
33f8d9a4:	e1540001 	cmp	r4, r1
33f8d9a8:	e1a0a002 	mov	sl, r2
33f8d9ac:	3affffe6 	bcc	33f8d94c <.text+0xd94c>
33f8d9b0:	e51f35f8 	ldr	r3, [pc, #-1528]	; 33f8d3c0 <.text+0xd3c0>
33f8d9b4:	e7933101 	ldr	r3, [r3, r1, lsl #2]
33f8d9b8:	e5992008 	ldr	r2, [r9, #8]
33f8d9bc:	e0073003 	and	r3, r7, r3
33f8d9c0:	e1a03183 	mov	r3, r3, lsl #3
33f8d9c4:	e7d31002 	ldrb	r1, [r3, r2]
33f8d9c8:	e0832002 	add	r2, r3, r2
33f8d9cc:	e5d23001 	ldrb	r3, [r2, #1]
33f8d9d0:	e3110010 	tst	r1, #16	; 0x10
33f8d9d4:	e0634004 	rsb	r4, r3, r4
33f8d9d8:	e1a07337 	mov	r7, r7, lsr r3
33f8d9dc:	0a000005 	beq	33f8d9f8 <.text+0xd9f8>
33f8d9e0:	e201300f 	and	r3, r1, #15	; 0xf
33f8d9e4:	e5893008 	str	r3, [r9, #8]
33f8d9e8:	e5923004 	ldr	r3, [r2, #4]
33f8d9ec:	e589300c 	str	r3, [r9, #12]
33f8d9f0:	e3a03004 	mov	r3, #4	; 0x4
33f8d9f4:	ea0000c0 	b	33f8dcfc <.text+0xdcfc>
33f8d9f8:	e3110040 	tst	r1, #64	; 0x40
33f8d9fc:	1a000003 	bne	33f8da10 <.text+0xda10>
33f8da00:	e589100c 	str	r1, [r9, #12]
33f8da04:	e5923004 	ldr	r3, [r2, #4]
33f8da08:	e5893008 	str	r3, [r9, #8]
33f8da0c:	eafffe0b 	b	33f8d240 <.text+0xd240>
33f8da10:	e3a03009 	mov	r3, #9	; 0x9
33f8da14:	e5893000 	str	r3, [r9]
33f8da18:	e51f3664 	ldr	r3, [pc, #-1636]	; 33f8d3bc <.text+0xd3bc>
33f8da1c:	e5853018 	str	r3, [r5, #24]
33f8da20:	ea0000e0 	b	33f8dda8 <.text+0xdda8>
33f8da24:	e5991008 	ldr	r1, [r9, #8]
33f8da28:	e1a0200a 	mov	r2, sl
33f8da2c:	ea000015 	b	33f8da88 <.text+0xda88>
33f8da30:	e35b0000 	cmp	fp, #0	; 0x0
33f8da34:	e28a2001 	add	r2, sl, #1	; 0x1
33f8da38:	0a000006 	beq	33f8da58 <.text+0xda58>
33f8da3c:	e5523001 	ldrb	r3, [r2, #-1]
33f8da40:	e1877413 	orr	r7, r7, r3, lsl r4
33f8da44:	e3a00000 	mov	r0, #0	; 0x0
33f8da48:	e24bb001 	sub	fp, fp, #1	; 0x1
33f8da4c:	e2844008 	add	r4, r4, #8	; 0x8
33f8da50:	e58d0018 	str	r0, [sp, #24]
33f8da54:	ea00000b 	b	33f8da88 <.text+0xda88>
33f8da58:	e5867024 	str	r7, [r6, #36]
33f8da5c:	e5864020 	str	r4, [r6, #32]
33f8da60:	e5953000 	ldr	r3, [r5]
33f8da64:	e5952008 	ldr	r2, [r5, #8]
33f8da68:	e063300a 	rsb	r3, r3, sl
33f8da6c:	e0822003 	add	r2, r2, r3
33f8da70:	e585b004 	str	fp, [r5, #4]
33f8da74:	e5852008 	str	r2, [r5, #8]
33f8da78:	e585a000 	str	sl, [r5]
33f8da7c:	e59d1028 	ldr	r1, [sp, #40]
33f8da80:	e5861034 	str	r1, [r6, #52]
33f8da84:	eaffff9a 	b	33f8d8f4 <.text+0xd8f4>
33f8da88:	e1540001 	cmp	r4, r1
33f8da8c:	e1a0a002 	mov	sl, r2
33f8da90:	3affffe6 	bcc	33f8da30 <.text+0xda30>
33f8da94:	e51f36dc 	ldr	r3, [pc, #-1756]	; 33f8d3c0 <.text+0xd3c0>
33f8da98:	e7932101 	ldr	r2, [r3, r1, lsl #2]
33f8da9c:	e0072002 	and	r2, r7, r2
33f8daa0:	e1a07137 	mov	r7, r7, lsr r1
33f8daa4:	e599300c 	ldr	r3, [r9, #12]
33f8daa8:	e0833002 	add	r3, r3, r2
33f8daac:	e589300c 	str	r3, [r9, #12]
33f8dab0:	e3a03005 	mov	r3, #5	; 0x5
33f8dab4:	e5893000 	str	r3, [r9]
33f8dab8:	e0614004 	rsb	r4, r1, r4
33f8dabc:	e59d2028 	ldr	r2, [sp, #40]
33f8dac0:	e5963028 	ldr	r3, [r6, #40]
33f8dac4:	e599100c 	ldr	r1, [r9, #12]
33f8dac8:	e0633002 	rsb	r3, r3, r2
33f8dacc:	e1530001 	cmp	r3, r1
33f8dad0:	3596202c 	ldrcc	r2, [r6, #44]
33f8dad4:	259d3028 	ldrcs	r3, [sp, #40]
33f8dad8:	30633001 	rsbcc	r3, r3, r1
33f8dadc:	3063c002 	rsbcc	ip, r3, r2
33f8dae0:	2061c003 	rsbcs	ip, r1, r3
33f8dae4:	ea00004d 	b	33f8dc20 <.text+0xdc20>
33f8dae8:	e35e0000 	cmp	lr, #0	; 0x0
33f8daec:	1a00003c 	bne	33f8dbe4 <.text+0xdbe4>
33f8daf0:	e596302c 	ldr	r3, [r6, #44]
33f8daf4:	e59de028 	ldr	lr, [sp, #40]
33f8daf8:	e15e0003 	cmp	lr, r3
33f8dafc:	1a00000c 	bne	33f8db34 <.text+0xdb34>
33f8db00:	e5963030 	ldr	r3, [r6, #48]
33f8db04:	e5962028 	ldr	r2, [r6, #40]
33f8db08:	e1530002 	cmp	r3, r2
33f8db0c:	0a000008 	beq	33f8db34 <.text+0xdb34>
33f8db10:	e1520003 	cmp	r2, r3
33f8db14:	259d0028 	ldrcs	r0, [sp, #40]
33f8db18:	30623003 	rsbcc	r3, r2, r3
33f8db1c:	3243e001 	subcc	lr, r3, #1	; 0x1
33f8db20:	2062e000 	rsbcs	lr, r2, r0
33f8db24:	e35e0000 	cmp	lr, #0	; 0x0
33f8db28:	158d2028 	strne	r2, [sp, #40]
33f8db2c:	1a00002c 	bne	33f8dbe4 <.text+0xdbe4>
33f8db30:	e58d2028 	str	r2, [sp, #40]
33f8db34:	e59d1028 	ldr	r1, [sp, #40]
33f8db38:	e5861034 	str	r1, [r6, #52]
33f8db3c:	e59d2018 	ldr	r2, [sp, #24]
33f8db40:	e1a01005 	mov	r1, r5
33f8db44:	e1a00006 	mov	r0, r6
33f8db48:	e58dc010 	str	ip, [sp, #16]
33f8db4c:	ebfff94a 	bl	33f8c07c <inflate_flush>
33f8db50:	e5962034 	ldr	r2, [r6, #52]
33f8db54:	e58d2028 	str	r2, [sp, #40]
33f8db58:	e5961030 	ldr	r1, [r6, #48]
33f8db5c:	e1520001 	cmp	r2, r1
33f8db60:	2596302c 	ldrcs	r3, [r6, #44]
33f8db64:	259d2028 	ldrcs	r2, [sp, #40]
33f8db68:	30623001 	rsbcc	r3, r2, r1
33f8db6c:	2062e003 	rsbcs	lr, r2, r3
33f8db70:	3243e001 	subcc	lr, r3, #1	; 0x1
33f8db74:	e59d2028 	ldr	r2, [sp, #40]
33f8db78:	e596302c 	ldr	r3, [r6, #44]
33f8db7c:	e1520003 	cmp	r2, r3
33f8db80:	e59dc010 	ldr	ip, [sp, #16]
33f8db84:	1a000008 	bne	33f8dbac <.text+0xdbac>
33f8db88:	e5962028 	ldr	r2, [r6, #40]
33f8db8c:	e1510002 	cmp	r1, r2
33f8db90:	0a000005 	beq	33f8dbac <.text+0xdbac>
33f8db94:	e1520001 	cmp	r2, r1
33f8db98:	259d3028 	ldrcs	r3, [sp, #40]
33f8db9c:	30623001 	rsbcc	r3, r2, r1
33f8dba0:	e58d2028 	str	r2, [sp, #40]
33f8dba4:	3243e001 	subcc	lr, r3, #1	; 0x1
33f8dba8:	2062e003 	rsbcs	lr, r2, r3
33f8dbac:	e35e0000 	cmp	lr, #0	; 0x0
33f8dbb0:	1a00000b 	bne	33f8dbe4 <.text+0xdbe4>
33f8dbb4:	e5867024 	str	r7, [r6, #36]
33f8dbb8:	e5864020 	str	r4, [r6, #32]
33f8dbbc:	e5953000 	ldr	r3, [r5]
33f8dbc0:	e5952008 	ldr	r2, [r5, #8]
33f8dbc4:	e063300a 	rsb	r3, r3, sl
33f8dbc8:	e0822003 	add	r2, r2, r3
33f8dbcc:	e585b004 	str	fp, [r5, #4]
33f8dbd0:	e5852008 	str	r2, [r5, #8]
33f8dbd4:	e585a000 	str	sl, [r5]
33f8dbd8:	e59dc028 	ldr	ip, [sp, #40]
33f8dbdc:	e586c034 	str	ip, [r6, #52]
33f8dbe0:	ea00005c 	b	33f8dd58 <.text+0xdd58>
33f8dbe4:	e4dc3001 	ldrb	r3, [ip], #1
33f8dbe8:	e59d0028 	ldr	r0, [sp, #40]
33f8dbec:	e5c03000 	strb	r3, [r0]
33f8dbf0:	e596302c 	ldr	r3, [r6, #44]
33f8dbf4:	e15c0003 	cmp	ip, r3
33f8dbf8:	e5993004 	ldr	r3, [r9, #4]
33f8dbfc:	e2433001 	sub	r3, r3, #1	; 0x1
33f8dc00:	0596c028 	ldreq	ip, [r6, #40]
33f8dc04:	e5893004 	str	r3, [r9, #4]
33f8dc08:	e59d1028 	ldr	r1, [sp, #40]
33f8dc0c:	e3a02000 	mov	r2, #0	; 0x0
33f8dc10:	e2811001 	add	r1, r1, #1	; 0x1
33f8dc14:	e58d1028 	str	r1, [sp, #40]
33f8dc18:	e58d2018 	str	r2, [sp, #24]
33f8dc1c:	e24ee001 	sub	lr, lr, #1	; 0x1
33f8dc20:	e5993004 	ldr	r3, [r9, #4]
33f8dc24:	e3530000 	cmp	r3, #0	; 0x0
33f8dc28:	1affffae 	bne	33f8dae8 <.text+0xdae8>
33f8dc2c:	ea000032 	b	33f8dcfc <.text+0xdcfc>
33f8dc30:	e35e0000 	cmp	lr, #0	; 0x0
33f8dc34:	159d1028 	ldrne	r1, [sp, #40]
33f8dc38:	1a000029 	bne	33f8dce4 <.text+0xdce4>
33f8dc3c:	e596302c 	ldr	r3, [r6, #44]
33f8dc40:	e59dc028 	ldr	ip, [sp, #40]
33f8dc44:	e15c0003 	cmp	ip, r3
33f8dc48:	1a00000b 	bne	33f8dc7c <.text+0xdc7c>
33f8dc4c:	e5963030 	ldr	r3, [r6, #48]
33f8dc50:	e5961028 	ldr	r1, [r6, #40]
33f8dc54:	e1530001 	cmp	r3, r1
33f8dc58:	0a000007 	beq	33f8dc7c <.text+0xdc7c>
33f8dc5c:	e1510003 	cmp	r1, r3
33f8dc60:	259d0028 	ldrcs	r0, [sp, #40]
33f8dc64:	30613003 	rsbcc	r3, r1, r3
33f8dc68:	3243e001 	subcc	lr, r3, #1	; 0x1
33f8dc6c:	2061e000 	rsbcs	lr, r1, r0
33f8dc70:	e35e0000 	cmp	lr, #0	; 0x0
33f8dc74:	1a00001a 	bne	33f8dce4 <.text+0xdce4>
33f8dc78:	e58d1028 	str	r1, [sp, #40]
33f8dc7c:	e59d1028 	ldr	r1, [sp, #40]
33f8dc80:	e5861034 	str	r1, [r6, #52]
33f8dc84:	e59d2018 	ldr	r2, [sp, #24]
33f8dc88:	e1a01005 	mov	r1, r5
33f8dc8c:	e1a00006 	mov	r0, r6
33f8dc90:	ebfff8f9 	bl	33f8c07c <inflate_flush>
33f8dc94:	e5961034 	ldr	r1, [r6, #52]
33f8dc98:	e596c030 	ldr	ip, [r6, #48]
33f8dc9c:	e151000c 	cmp	r1, ip
33f8dca0:	2596302c 	ldrcs	r3, [r6, #44]
33f8dca4:	3061300c 	rsbcc	r3, r1, ip
33f8dca8:	3243e001 	subcc	lr, r3, #1	; 0x1
33f8dcac:	2061e003 	rsbcs	lr, r1, r3
33f8dcb0:	e596302c 	ldr	r3, [r6, #44]
33f8dcb4:	e1510003 	cmp	r1, r3
33f8dcb8:	1a000007 	bne	33f8dcdc <.text+0xdcdc>
33f8dcbc:	e5962028 	ldr	r2, [r6, #40]
33f8dcc0:	e15c0002 	cmp	ip, r2
33f8dcc4:	0a000004 	beq	33f8dcdc <.text+0xdcdc>
33f8dcc8:	e152000c 	cmp	r2, ip
33f8dccc:	3062300c 	rsbcc	r3, r2, ip
33f8dcd0:	2062e001 	rsbcs	lr, r2, r1
33f8dcd4:	3243e001 	subcc	lr, r3, #1	; 0x1
33f8dcd8:	e1a01002 	mov	r1, r2
33f8dcdc:	e35e0000 	cmp	lr, #0	; 0x0
33f8dce0:	0a000012 	beq	33f8dd30 <.text+0xdd30>
33f8dce4:	e5993008 	ldr	r3, [r9, #8]
33f8dce8:	e4c13001 	strb	r3, [r1], #1
33f8dcec:	e3a03000 	mov	r3, #0	; 0x0
33f8dcf0:	e58d1028 	str	r1, [sp, #40]
33f8dcf4:	e58d3018 	str	r3, [sp, #24]
33f8dcf8:	e24ee001 	sub	lr, lr, #1	; 0x1
33f8dcfc:	e5893000 	str	r3, [r9]
33f8dd00:	eafffd4e 	b	33f8d240 <.text+0xd240>
33f8dd04:	e59d2028 	ldr	r2, [sp, #40]
33f8dd08:	e5862034 	str	r2, [r6, #52]
33f8dd0c:	e1a01005 	mov	r1, r5
33f8dd10:	e59d2018 	ldr	r2, [sp, #24]
33f8dd14:	e1a00006 	mov	r0, r6
33f8dd18:	ebfff8d7 	bl	33f8c07c <inflate_flush>
33f8dd1c:	e5961034 	ldr	r1, [r6, #52]
33f8dd20:	e5963030 	ldr	r3, [r6, #48]
33f8dd24:	e1530001 	cmp	r3, r1
33f8dd28:	e58d3028 	str	r3, [sp, #40]
33f8dd2c:	0a00000d 	beq	33f8dd68 <.text+0xdd68>
33f8dd30:	e5867024 	str	r7, [r6, #36]
33f8dd34:	e5864020 	str	r4, [r6, #32]
33f8dd38:	e5953000 	ldr	r3, [r5]
33f8dd3c:	e5952008 	ldr	r2, [r5, #8]
33f8dd40:	e063300a 	rsb	r3, r3, sl
33f8dd44:	e0822003 	add	r2, r2, r3
33f8dd48:	e585b004 	str	fp, [r5, #4]
33f8dd4c:	e5852008 	str	r2, [r5, #8]
33f8dd50:	e585a000 	str	sl, [r5]
33f8dd54:	e5861034 	str	r1, [r6, #52]
33f8dd58:	e1a02000 	mov	r2, r0
33f8dd5c:	e1a00006 	mov	r0, r6
33f8dd60:	e1a01005 	mov	r1, r5
33f8dd64:	ea00002b 	b	33f8de18 <.text+0xde18>
33f8dd68:	e3a03008 	mov	r3, #8	; 0x8
33f8dd6c:	e5893000 	str	r3, [r9]
33f8dd70:	e5867024 	str	r7, [r6, #36]
33f8dd74:	e5864020 	str	r4, [r6, #32]
33f8dd78:	e5953000 	ldr	r3, [r5]
33f8dd7c:	e5952008 	ldr	r2, [r5, #8]
33f8dd80:	e063300a 	rsb	r3, r3, sl
33f8dd84:	e0822003 	add	r2, r2, r3
33f8dd88:	e5852008 	str	r2, [r5, #8]
33f8dd8c:	e8850c00 	stmia	r5, {sl, fp}
33f8dd90:	e59dc028 	ldr	ip, [sp, #40]
33f8dd94:	e1a00006 	mov	r0, r6
33f8dd98:	e1a01005 	mov	r1, r5
33f8dd9c:	e3a02001 	mov	r2, #1	; 0x1
33f8dda0:	e586c034 	str	ip, [r6, #52]
33f8dda4:	ea00001b 	b	33f8de18 <.text+0xde18>
33f8dda8:	e5867024 	str	r7, [r6, #36]
33f8ddac:	e5864020 	str	r4, [r6, #32]
33f8ddb0:	e5953000 	ldr	r3, [r5]
33f8ddb4:	e5952008 	ldr	r2, [r5, #8]
33f8ddb8:	e063300a 	rsb	r3, r3, sl
33f8ddbc:	e0822003 	add	r2, r2, r3
33f8ddc0:	e585b004 	str	fp, [r5, #4]
33f8ddc4:	e5852008 	str	r2, [r5, #8]
33f8ddc8:	e585a000 	str	sl, [r5]
33f8ddcc:	e59de028 	ldr	lr, [sp, #40]
33f8ddd0:	e586e034 	str	lr, [r6, #52]
33f8ddd4:	e1a00006 	mov	r0, r6
33f8ddd8:	e1a01005 	mov	r1, r5
33f8dddc:	e3e02002 	mvn	r2, #2	; 0x2
33f8dde0:	ea00000c 	b	33f8de18 <.text+0xde18>
33f8dde4:	e5867024 	str	r7, [r6, #36]
33f8dde8:	e5864020 	str	r4, [r6, #32]
33f8ddec:	e5953000 	ldr	r3, [r5]
33f8ddf0:	e5952008 	ldr	r2, [r5, #8]
33f8ddf4:	e063300a 	rsb	r3, r3, sl
33f8ddf8:	e0822003 	add	r2, r2, r3
33f8ddfc:	e5852008 	str	r2, [r5, #8]
33f8de00:	e8850c00 	stmia	r5, {sl, fp}
33f8de04:	e59d0028 	ldr	r0, [sp, #40]
33f8de08:	e1a01005 	mov	r1, r5
33f8de0c:	e5860034 	str	r0, [r6, #52]
33f8de10:	e3e02001 	mvn	r2, #1	; 0x1
33f8de14:	e1a00006 	mov	r0, r6
33f8de18:	ebfff897 	bl	33f8c07c <inflate_flush>
33f8de1c:	e3500001 	cmp	r0, #1	; 0x1
33f8de20:	e1a02000 	mov	r2, r0
33f8de24:	11a00006 	movne	r0, r6
33f8de28:	1a000040 	bne	33f8df30 <.text+0xdf30>
33f8de2c:	e596000c 	ldr	r0, [r6, #12]
33f8de30:	e1a01005 	mov	r1, r5
33f8de34:	ebfff728 	bl	33f8badc <inflate_codes_free>
33f8de38:	e1a01005 	mov	r1, r5
33f8de3c:	e5960008 	ldr	r0, [r6, #8]
33f8de40:	ebfff580 	bl	33f8b448 <inflate_trees_free>
33f8de44:	e1a01005 	mov	r1, r5
33f8de48:	e5960004 	ldr	r0, [r6, #4]
33f8de4c:	ebfff57d 	bl	33f8b448 <inflate_trees_free>
33f8de50:	e5961034 	ldr	r1, [r6, #52]
33f8de54:	e58d1028 	str	r1, [sp, #40]
33f8de58:	e5952004 	ldr	r2, [r5, #4]
33f8de5c:	e5963030 	ldr	r3, [r6, #48]
33f8de60:	e5959000 	ldr	r9, [r5]
33f8de64:	e58d201c 	str	r2, [sp, #28]
33f8de68:	e1510003 	cmp	r1, r3
33f8de6c:	2596302c 	ldrcs	r3, [r6, #44]
33f8de70:	259dc028 	ldrcs	ip, [sp, #40]
33f8de74:	30613003 	rsbcc	r3, r1, r3
33f8de78:	32433001 	subcc	r3, r3, #1	; 0x1
33f8de7c:	206c3003 	rsbcs	r3, ip, r3
33f8de80:	e286a020 	add	sl, r6, #32	; 0x20
33f8de84:	e89a0c00 	ldmia	sl, {sl, fp}
33f8de88:	e58d3044 	str	r3, [sp, #68]
33f8de8c:	e596301c 	ldr	r3, [r6, #28]
33f8de90:	e3530000 	cmp	r3, #0	; 0x0
33f8de94:	1a000002 	bne	33f8dea4 <.text+0xdea4>
33f8de98:	e58d3018 	str	r3, [sp, #24]
33f8de9c:	e5863000 	str	r3, [r6]
33f8dea0:	eafff9ae 	b	33f8c560 <.text+0xc560>
33f8dea4:	e35a0007 	cmp	sl, #7	; 0x7
33f8dea8:	859de01c 	ldrhi	lr, [sp, #28]
33f8deac:	e3a03007 	mov	r3, #7	; 0x7
33f8deb0:	828ee001 	addhi	lr, lr, #1	; 0x1
33f8deb4:	e3a00000 	mov	r0, #0	; 0x0
33f8deb8:	858de01c 	strhi	lr, [sp, #28]
33f8debc:	e5863000 	str	r3, [r6]
33f8dec0:	e58d0018 	str	r0, [sp, #24]
33f8dec4:	824aa008 	subhi	sl, sl, #8	; 0x8
33f8dec8:	82499001 	subhi	r9, r9, #1	; 0x1
33f8decc:	e59d1028 	ldr	r1, [sp, #40]
33f8ded0:	e5861034 	str	r1, [r6, #52]
33f8ded4:	e59d2018 	ldr	r2, [sp, #24]
33f8ded8:	e1a01005 	mov	r1, r5
33f8dedc:	e1a00006 	mov	r0, r6
33f8dee0:	ebfff865 	bl	33f8c07c <inflate_flush>
33f8dee4:	e5961034 	ldr	r1, [r6, #52]
33f8dee8:	e5962030 	ldr	r2, [r6, #48]
33f8deec:	e1520001 	cmp	r2, r1
33f8def0:	e1a0c000 	mov	ip, r0
33f8def4:	e58d2028 	str	r2, [sp, #40]
33f8def8:	0a00000e 	beq	33f8df38 <.text+0xdf38>
33f8defc:	e586b024 	str	fp, [r6, #36]
33f8df00:	e586a020 	str	sl, [r6, #32]
33f8df04:	e5953000 	ldr	r3, [r5]
33f8df08:	e5952008 	ldr	r2, [r5, #8]
33f8df0c:	e0633009 	rsb	r3, r3, r9
33f8df10:	e0822003 	add	r2, r2, r3
33f8df14:	e59d301c 	ldr	r3, [sp, #28]
33f8df18:	e5852008 	str	r2, [r5, #8]
33f8df1c:	e5853004 	str	r3, [r5, #4]
33f8df20:	e5859000 	str	r9, [r5]
33f8df24:	e5861034 	str	r1, [r6, #52]
33f8df28:	e1a00006 	mov	r0, r6
33f8df2c:	e1a0200c 	mov	r2, ip
33f8df30:	e1a01005 	mov	r1, r5
33f8df34:	ea00002e 	b	33f8dff4 <.text+0xdff4>
33f8df38:	e3a03008 	mov	r3, #8	; 0x8
33f8df3c:	e5863000 	str	r3, [r6]
33f8df40:	e586b024 	str	fp, [r6, #36]
33f8df44:	e586a020 	str	sl, [r6, #32]
33f8df48:	e5953000 	ldr	r3, [r5]
33f8df4c:	e5952008 	ldr	r2, [r5, #8]
33f8df50:	e59dc01c 	ldr	ip, [sp, #28]
33f8df54:	e0633009 	rsb	r3, r3, r9
33f8df58:	e0822003 	add	r2, r2, r3
33f8df5c:	e5852008 	str	r2, [r5, #8]
33f8df60:	e8851200 	stmia	r5, {r9, ip}
33f8df64:	e59de028 	ldr	lr, [sp, #40]
33f8df68:	e1a00006 	mov	r0, r6
33f8df6c:	e1a01005 	mov	r1, r5
33f8df70:	e3a02001 	mov	r2, #1	; 0x1
33f8df74:	e586e034 	str	lr, [r6, #52]
33f8df78:	ea00001d 	b	33f8dff4 <.text+0xdff4>
33f8df7c:	e586b024 	str	fp, [r6, #36]
33f8df80:	e586a020 	str	sl, [r6, #32]
33f8df84:	e5953000 	ldr	r3, [r5]
33f8df88:	e5952008 	ldr	r2, [r5, #8]
33f8df8c:	e59d001c 	ldr	r0, [sp, #28]
33f8df90:	e0633009 	rsb	r3, r3, r9
33f8df94:	e0822003 	add	r2, r2, r3
33f8df98:	e9850005 	stmib	r5, {r0, r2}
33f8df9c:	e5859000 	str	r9, [r5]
33f8dfa0:	e59d1028 	ldr	r1, [sp, #40]
33f8dfa4:	e5861034 	str	r1, [r6, #52]
33f8dfa8:	e1a00006 	mov	r0, r6
33f8dfac:	e1a01005 	mov	r1, r5
33f8dfb0:	e3e02002 	mvn	r2, #2	; 0x2
33f8dfb4:	ea00000e 	b	33f8dff4 <.text+0xdff4>
33f8dfb8:	e586b024 	str	fp, [r6, #36]
33f8dfbc:	e586a020 	str	sl, [r6, #32]
33f8dfc0:	e5953000 	ldr	r3, [r5]
33f8dfc4:	e5952008 	ldr	r2, [r5, #8]
33f8dfc8:	e0633009 	rsb	r3, r3, r9
33f8dfcc:	e0822003 	add	r2, r2, r3
33f8dfd0:	e59d301c 	ldr	r3, [sp, #28]
33f8dfd4:	e5852008 	str	r2, [r5, #8]
33f8dfd8:	e5853004 	str	r3, [r5, #4]
33f8dfdc:	e5859000 	str	r9, [r5]
33f8dfe0:	e59dc028 	ldr	ip, [sp, #40]
33f8dfe4:	e586c034 	str	ip, [r6, #52]
33f8dfe8:	e1a00006 	mov	r0, r6
33f8dfec:	e1a01005 	mov	r1, r5
33f8dff0:	e3e02001 	mvn	r2, #1	; 0x1
33f8dff4:	ebfff820 	bl	33f8c07c <inflate_flush>
33f8dff8:	e59de014 	ldr	lr, [sp, #20]
33f8dffc:	e35e0005 	cmp	lr, #5	; 0x5
33f8e000:	e58d0018 	str	r0, [sp, #24]
33f8e004:	1a00000d 	bne	33f8e040 <.text+0xe040>
33f8e008:	e5952004 	ldr	r2, [r5, #4]
33f8e00c:	e3520000 	cmp	r2, #0	; 0x0
33f8e010:	1a00000a 	bne	33f8e040 <.text+0xe040>
33f8e014:	e5953010 	ldr	r3, [r5, #16]
33f8e018:	e3530000 	cmp	r3, #0	; 0x0
33f8e01c:	0a000007 	beq	33f8e040 <.text+0xe040>
33f8e020:	e595301c 	ldr	r3, [r5, #28]
33f8e024:	e5931014 	ldr	r1, [r3, #20]
33f8e028:	e5913000 	ldr	r3, [r1]
33f8e02c:	e3530001 	cmp	r3, #1	; 0x1
33f8e030:	1a000005 	bne	33f8e04c <.text+0xe04c>
33f8e034:	e58d2018 	str	r2, [sp, #24]
33f8e038:	e5812000 	str	r2, [r1]
33f8e03c:	ea000083 	b	33f8e250 <.text+0xe250>
33f8e040:	e59d0018 	ldr	r0, [sp, #24]
33f8e044:	e3700003 	cmn	r0, #3	; 0x3
33f8e048:	1a000008 	bne	33f8e070 <.text+0xe070>
33f8e04c:	e595201c 	ldr	r2, [r5, #28]
33f8e050:	e3a03008 	mov	r3, #8	; 0x8
33f8e054:	e5823000 	str	r3, [r2]
33f8e058:	e3e01002 	mvn	r1, #2	; 0x2
33f8e05c:	e595201c 	ldr	r2, [r5, #28]
33f8e060:	e58d1018 	str	r1, [sp, #24]
33f8e064:	e3a03000 	mov	r3, #0	; 0x0
33f8e068:	e5823004 	str	r3, [r2, #4]
33f8e06c:	eafff8b8 	b	33f8c354 <inflate+0x28>
33f8e070:	e59d2018 	ldr	r2, [sp, #24]
33f8e074:	e3520001 	cmp	r2, #1	; 0x1
33f8e078:	1a000074 	bne	33f8e250 <.text+0xe250>
33f8e07c:	e595301c 	ldr	r3, [r5, #28]
33f8e080:	e1a01005 	mov	r1, r5
33f8e084:	e5930014 	ldr	r0, [r3, #20]
33f8e088:	e2832004 	add	r2, r3, #4	; 0x4
33f8e08c:	ebfff69a 	bl	33f8bafc <inflate_blocks_reset>
33f8e090:	e595101c 	ldr	r1, [r5, #28]
33f8e094:	e591000c 	ldr	r0, [r1, #12]
33f8e098:	e3500000 	cmp	r0, #0	; 0x0
33f8e09c:	1afff8c1 	bne	33f8c3a8 <.text+0xc3a8>
33f8e0a0:	e3a03003 	mov	r3, #3	; 0x3
33f8e0a4:	e5813000 	str	r3, [r1]
33f8e0a8:	e58d0018 	str	r0, [sp, #24]
33f8e0ac:	e5952004 	ldr	r2, [r5, #4]
33f8e0b0:	e3520000 	cmp	r2, #0	; 0x0
33f8e0b4:	0a00004b 	beq	33f8e1e8 <.text+0xe1e8>
33f8e0b8:	e5953008 	ldr	r3, [r5, #8]
33f8e0bc:	e2422001 	sub	r2, r2, #1	; 0x1
33f8e0c0:	e2833001 	add	r3, r3, #1	; 0x1
33f8e0c4:	e985000c 	stmib	r5, {r2, r3}
33f8e0c8:	e5952000 	ldr	r2, [r5]
33f8e0cc:	e4d23001 	ldrb	r3, [r2], #1
33f8e0d0:	e595101c 	ldr	r1, [r5, #28]
33f8e0d4:	e1a03c03 	mov	r3, r3, lsl #24
33f8e0d8:	e5813008 	str	r3, [r1, #8]
33f8e0dc:	e595101c 	ldr	r1, [r5, #28]
33f8e0e0:	e3a03004 	mov	r3, #4	; 0x4
33f8e0e4:	e5852000 	str	r2, [r5]
33f8e0e8:	e5813000 	str	r3, [r1]
33f8e0ec:	e3a03000 	mov	r3, #0	; 0x0
33f8e0f0:	e58d3018 	str	r3, [sp, #24]
33f8e0f4:	e5952004 	ldr	r2, [r5, #4]
33f8e0f8:	e3520000 	cmp	r2, #0	; 0x0
33f8e0fc:	0a000039 	beq	33f8e1e8 <.text+0xe1e8>
33f8e100:	e5953008 	ldr	r3, [r5, #8]
33f8e104:	e2422001 	sub	r2, r2, #1	; 0x1
33f8e108:	e2833001 	add	r3, r3, #1	; 0x1
33f8e10c:	e985000c 	stmib	r5, {r2, r3}
33f8e110:	e5952000 	ldr	r2, [r5]
33f8e114:	e595001c 	ldr	r0, [r5, #28]
33f8e118:	e4d21001 	ldrb	r1, [r2], #1
33f8e11c:	e5903008 	ldr	r3, [r0, #8]
33f8e120:	e0833801 	add	r3, r3, r1, lsl #16
33f8e124:	e5803008 	str	r3, [r0, #8]
33f8e128:	e595101c 	ldr	r1, [r5, #28]
33f8e12c:	e3a03005 	mov	r3, #5	; 0x5
33f8e130:	e3a0c000 	mov	ip, #0	; 0x0
33f8e134:	e5852000 	str	r2, [r5]
33f8e138:	e5813000 	str	r3, [r1]
33f8e13c:	e58dc018 	str	ip, [sp, #24]
33f8e140:	e5952004 	ldr	r2, [r5, #4]
33f8e144:	e3520000 	cmp	r2, #0	; 0x0
33f8e148:	0a000026 	beq	33f8e1e8 <.text+0xe1e8>
33f8e14c:	e5953008 	ldr	r3, [r5, #8]
33f8e150:	e2422001 	sub	r2, r2, #1	; 0x1
33f8e154:	e2833001 	add	r3, r3, #1	; 0x1
33f8e158:	e985000c 	stmib	r5, {r2, r3}
33f8e15c:	e5952000 	ldr	r2, [r5]
33f8e160:	e595001c 	ldr	r0, [r5, #28]
33f8e164:	e4d21001 	ldrb	r1, [r2], #1
33f8e168:	e5903008 	ldr	r3, [r0, #8]
33f8e16c:	e0833401 	add	r3, r3, r1, lsl #8
33f8e170:	e5803008 	str	r3, [r0, #8]
33f8e174:	e595101c 	ldr	r1, [r5, #28]
33f8e178:	e3a03006 	mov	r3, #6	; 0x6
33f8e17c:	e3a0e000 	mov	lr, #0	; 0x0
33f8e180:	e5852000 	str	r2, [r5]
33f8e184:	e5813000 	str	r3, [r1]
33f8e188:	e58de018 	str	lr, [sp, #24]
33f8e18c:	e5952004 	ldr	r2, [r5, #4]
33f8e190:	e3520000 	cmp	r2, #0	; 0x0
33f8e194:	0a000013 	beq	33f8e1e8 <.text+0xe1e8>
33f8e198:	e5953008 	ldr	r3, [r5, #8]
33f8e19c:	e2422001 	sub	r2, r2, #1	; 0x1
33f8e1a0:	e2833001 	add	r3, r3, #1	; 0x1
33f8e1a4:	e985000c 	stmib	r5, {r2, r3}
33f8e1a8:	e5952000 	ldr	r2, [r5]
33f8e1ac:	e595001c 	ldr	r0, [r5, #28]
33f8e1b0:	e4d21001 	ldrb	r1, [r2], #1
33f8e1b4:	e5903008 	ldr	r3, [r0, #8]
33f8e1b8:	e0833001 	add	r3, r3, r1
33f8e1bc:	e5803008 	str	r3, [r0, #8]
33f8e1c0:	e5852000 	str	r2, [r5]
33f8e1c4:	e595101c 	ldr	r1, [r5, #28]
33f8e1c8:	e991000c 	ldmib	r1, {r2, r3}
33f8e1cc:	e1520003 	cmp	r2, r3
33f8e1d0:	1afff86d 	bne	33f8c38c <.text+0xc38c>
33f8e1d4:	e3a00001 	mov	r0, #1	; 0x1
33f8e1d8:	e3a03007 	mov	r3, #7	; 0x7
33f8e1dc:	e58d0018 	str	r0, [sp, #24]
33f8e1e0:	e5813000 	str	r3, [r1]
33f8e1e4:	ea000019 	b	33f8e250 <.text+0xe250>
33f8e1e8:	e59d1014 	ldr	r1, [sp, #20]
33f8e1ec:	e3510005 	cmp	r1, #5	; 0x5
33f8e1f0:	1a000016 	bne	33f8e250 <.text+0xe250>
33f8e1f4:	e595201c 	ldr	r2, [r5, #28]
33f8e1f8:	e3a03008 	mov	r3, #8	; 0x8
33f8e1fc:	e5823000 	str	r3, [r2]
33f8e200:	e3e03002 	mvn	r3, #2	; 0x2
33f8e204:	e595201c 	ldr	r2, [r5, #28]
33f8e208:	e58d3018 	str	r3, [sp, #24]
33f8e20c:	e2833003 	add	r3, r3, #3	; 0x3
33f8e210:	e5823004 	str	r3, [r2, #4]
33f8e214:	ea00000d 	b	33f8e250 <.text+0xe250>
33f8e218:	e3e0c001 	mvn	ip, #1	; 0x1
33f8e21c:	e58dc018 	str	ip, [sp, #24]
33f8e220:	ea00000a 	b	33f8e250 <.text+0xe250>
33f8e224:	e59d050c 	ldr	r0, [sp, #1292]
33f8e228:	e59d1508 	ldr	r1, [sp, #1288]
33f8e22c:	e59d2504 	ldr	r2, [sp, #1284]
33f8e230:	e59d3500 	ldr	r3, [sp, #1280]
33f8e234:	e58d5000 	str	r5, [sp]
33f8e238:	ebfff613 	bl	33f8ba8c <inflate_codes_new>
33f8e23c:	e2504000 	subs	r4, r0, #0	; 0x0
33f8e240:	1afffbda 	bne	33f8d1b0 <.text+0xd1b0>
33f8e244:	eafffbc4 	b	33f8d15c <.text+0xd15c>
33f8e248:	e1a01002 	mov	r1, r2
33f8e24c:	eafffbb0 	b	33f8d114 <.text+0xd114>
33f8e250:	e59d0018 	ldr	r0, [sp, #24]
33f8e254:	e28dde51 	add	sp, sp, #1296	; 0x510
33f8e258:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}

33f8e25c <dram_init>:
33f8e25c:	e5982000 	ldr	r2, [r8]
33f8e260:	e3a03203 	mov	r3, #805306368	; 0x30000000
33f8e264:	e582301c 	str	r3, [r2, #28]
33f8e268:	e5982000 	ldr	r2, [r8]
33f8e26c:	e3a03301 	mov	r3, #67108864	; 0x4000000
33f8e270:	e3a00000 	mov	r0, #0	; 0x0
33f8e274:	e5823020 	str	r3, [r2, #32]
33f8e278:	e1a0f00e 	mov	pc, lr

33f8e27c <get_board_serial>:
33f8e27c:	e1a0f00e 	mov	pc, lr

33f8e280 <show_boot_progress>:
33f8e280:	e1a0f00e 	mov	pc, lr

33f8e284 <print_cpuinfo>:
33f8e284:	e52de004 	str	lr, [sp, #-4]!
33f8e288:	e59f0008 	ldr	r0, [pc, #8]	; 33f8e298 <.text+0xe298>
33f8e28c:	ebffe660 	bl	33f87c14 <puts>
33f8e290:	e3a00000 	mov	r0, #0	; 0x0
33f8e294:	e49df004 	ldr	pc, [sp], #4
33f8e298:	33f94f60 	mvnccs	r4, #384	; 0x180

33f8e29c <board_init>:
33f8e29c:	e52de004 	str	lr, [sp, #-4]!
33f8e2a0:	e3e02000 	mvn	r2, #0	; 0x0
33f8e2a4:	e3a03313 	mov	r3, #1275068416	; 0x4c000000
33f8e2a8:	e5832000 	str	r2, [r3]
33f8e2ac:	e5982000 	ldr	r2, [r8]
33f8e2b0:	e3a03e4e 	mov	r3, #1248	; 0x4e0
33f8e2b4:	e5823014 	str	r3, [r2, #20]
33f8e2b8:	e59f3014 	ldr	r3, [pc, #20]	; 33f8e2d4 <.text+0xe2d4>
33f8e2bc:	e5982000 	ldr	r2, [r8]
33f8e2c0:	e5823018 	str	r3, [r2, #24]
33f8e2c4:	eb000036 	bl	33f8e3a4 <icache_enable>
33f8e2c8:	eb00003c 	bl	33f8e3c0 <dcache_enable>
33f8e2cc:	e3a00000 	mov	r0, #0	; 0x0
33f8e2d0:	e49df004 	ldr	pc, [sp], #4
33f8e2d4:	3f000100 	svccc	0x00000100

33f8e2d8 <cp_delay>:
33f8e2d8:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8e2dc:	e3a03000 	mov	r3, #0	; 0x0
33f8e2e0:	ea000001 	b	33f8e2ec <cp_delay+0x14>
33f8e2e4:	e59d3000 	ldr	r3, [sp]
33f8e2e8:	e2833001 	add	r3, r3, #1	; 0x1
33f8e2ec:	e58d3000 	str	r3, [sp]
33f8e2f0:	e59d3000 	ldr	r3, [sp]
33f8e2f4:	e3530063 	cmp	r3, #99	; 0x63
33f8e2f8:	dafffff9 	ble	33f8e2e4 <cp_delay+0xc>
33f8e2fc:	e28dd004 	add	sp, sp, #4	; 0x4
33f8e300:	e1a0f00e 	mov	pc, lr

33f8e304 <cpu_init>:
33f8e304:	e3a00000 	mov	r0, #0	; 0x0
33f8e308:	e1a0f00e 	mov	pc, lr

33f8e30c <icache_disable>:
33f8e30c:	e92d4010 	stmdb	sp!, {r4, lr}
33f8e310:	ee114f10 	mrc	15, 0, r4, cr1, cr0, {0}
33f8e314:	ebffffef 	bl	33f8e2d8 <cp_delay>
33f8e318:	e3c44a01 	bic	r4, r4, #4096	; 0x1000
33f8e31c:	ee014f10 	mcr	15, 0, r4, cr1, cr0, {0}
33f8e320:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
33f8e324:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8e328 <cleanup_before_linux>:
33f8e328:	e52de004 	str	lr, [sp, #-4]!
33f8e32c:	ebffc894 	bl	33f80584 <disable_interrupts>
33f8e330:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
33f8e334:	e3c33a01 	bic	r3, r3, #4096	; 0x1000
33f8e338:	e3c33004 	bic	r3, r3, #4	; 0x4
33f8e33c:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
33f8e340:	e3a03000 	mov	r3, #0	; 0x0
33f8e344:	ee073f17 	mcr	15, 0, r3, cr7, cr7, {0}
33f8e348:	e3a00000 	mov	r0, #0	; 0x0
33f8e34c:	e49df004 	ldr	pc, [sp], #4

33f8e350 <do_reset>:
33f8e350:	e52de004 	str	lr, [sp, #-4]!
33f8e354:	ebffc88a 	bl	33f80584 <disable_interrupts>
33f8e358:	e3a00000 	mov	r0, #0	; 0x0
33f8e35c:	ebffc98a 	bl	33f8098c <reset_cpu>
33f8e360:	e3a00000 	mov	r0, #0	; 0x0
33f8e364:	e49df004 	ldr	pc, [sp], #4

33f8e368 <dcache_status>:
33f8e368:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
33f8e36c:	e1a00120 	mov	r0, r0, lsr #2
33f8e370:	e2000001 	and	r0, r0, #1	; 0x1
33f8e374:	e1a0f00e 	mov	pc, lr

33f8e378 <icache_status>:
33f8e378:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
33f8e37c:	e1a00620 	mov	r0, r0, lsr #12
33f8e380:	e2000001 	and	r0, r0, #1	; 0x1
33f8e384:	e1a0f00e 	mov	pc, lr

33f8e388 <dcache_disable>:
33f8e388:	e92d4010 	stmdb	sp!, {r4, lr}
33f8e38c:	ee114f10 	mrc	15, 0, r4, cr1, cr0, {0}
33f8e390:	ebffffd0 	bl	33f8e2d8 <cp_delay>
33f8e394:	e3c44004 	bic	r4, r4, #4	; 0x4
33f8e398:	ee014f10 	mcr	15, 0, r4, cr1, cr0, {0}
33f8e39c:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
33f8e3a0:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8e3a4 <icache_enable>:
33f8e3a4:	e92d4010 	stmdb	sp!, {r4, lr}
33f8e3a8:	ee114f10 	mrc	15, 0, r4, cr1, cr0, {0}
33f8e3ac:	ebffffc9 	bl	33f8e2d8 <cp_delay>
33f8e3b0:	e3844a01 	orr	r4, r4, #4096	; 0x1000
33f8e3b4:	ee014f10 	mcr	15, 0, r4, cr1, cr0, {0}
33f8e3b8:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
33f8e3bc:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8e3c0 <dcache_enable>:
33f8e3c0:	e92d4010 	stmdb	sp!, {r4, lr}
33f8e3c4:	ee114f10 	mrc	15, 0, r4, cr1, cr0, {0}
33f8e3c8:	ebffffc2 	bl	33f8e2d8 <cp_delay>
33f8e3cc:	e3844004 	orr	r4, r4, #4	; 0x4
33f8e3d0:	ee014f10 	mcr	15, 0, r4, cr1, cr0, {0}
33f8e3d4:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
33f8e3d8:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8e3dc <serial_putc>:
33f8e3dc:	e20000ff 	and	r0, r0, #255	; 0xff
33f8e3e0:	e3a02205 	mov	r2, #1342177280	; 0x50000000
33f8e3e4:	e5923010 	ldr	r3, [r2, #16]
33f8e3e8:	e3130002 	tst	r3, #2	; 0x2
33f8e3ec:	0afffffb 	beq	33f8e3e0 <serial_putc+0x4>
33f8e3f0:	e350000a 	cmp	r0, #10	; 0xa
33f8e3f4:	e5c20020 	strb	r0, [r2, #32]
33f8e3f8:	11a0f00e 	movne	pc, lr
33f8e3fc:	e2800003 	add	r0, r0, #3	; 0x3
33f8e400:	eafffff5 	b	33f8e3dc <serial_putc>

33f8e404 <serial_tstc>:
33f8e404:	e3a03205 	mov	r3, #1342177280	; 0x50000000
33f8e408:	e5930010 	ldr	r0, [r3, #16]
33f8e40c:	e2000001 	and	r0, r0, #1	; 0x1
33f8e410:	e1a0f00e 	mov	pc, lr

33f8e414 <serial_puts>:
33f8e414:	e92d4010 	stmdb	sp!, {r4, lr}
33f8e418:	e1a04000 	mov	r4, r0
33f8e41c:	ea000000 	b	33f8e424 <serial_puts+0x10>
33f8e420:	ebffffed 	bl	33f8e3dc <serial_putc>
33f8e424:	e5d43000 	ldrb	r3, [r4]
33f8e428:	e3530000 	cmp	r3, #0	; 0x0
33f8e42c:	e1a00003 	mov	r0, r3
33f8e430:	e2844001 	add	r4, r4, #1	; 0x1
33f8e434:	1afffff9 	bne	33f8e420 <serial_puts+0xc>
33f8e438:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8e43c <serial_setbrg>:
33f8e43c:	e52de004 	str	lr, [sp, #-4]!
33f8e440:	ebffc9ca 	bl	33f80b70 <get_PCLK>
33f8e444:	e5981008 	ldr	r1, [r8, #8]
33f8e448:	e1a01201 	mov	r1, r1, lsl #4
33f8e44c:	ebffc9d1 	bl	33f80b98 <__udivsi3>
33f8e450:	e3a02205 	mov	r2, #1342177280	; 0x50000000
33f8e454:	e3a03007 	mov	r3, #7	; 0x7
33f8e458:	e5823008 	str	r3, [r2, #8]
33f8e45c:	e3a03000 	mov	r3, #0	; 0x0
33f8e460:	e582300c 	str	r3, [r2, #12]
33f8e464:	e2833003 	add	r3, r3, #3	; 0x3
33f8e468:	e5823000 	str	r3, [r2]
33f8e46c:	e59f300c 	ldr	r3, [pc, #12]	; 33f8e480 <.text+0xe480>
33f8e470:	e2400001 	sub	r0, r0, #1	; 0x1
33f8e474:	e5823004 	str	r3, [r2, #4]
33f8e478:	e5820028 	str	r0, [r2, #40]
33f8e47c:	e49df004 	ldr	pc, [sp], #4
33f8e480:	00000245 	andeq	r0, r0, r5, asr #4

33f8e484 <serial_init>:
33f8e484:	e52de004 	str	lr, [sp, #-4]!
33f8e488:	ebffffeb 	bl	33f8e43c <serial_setbrg>
33f8e48c:	e3a00000 	mov	r0, #0	; 0x0
33f8e490:	e49df004 	ldr	pc, [sp], #4

33f8e494 <serial_getc>:
33f8e494:	e3a02205 	mov	r2, #1342177280	; 0x50000000
33f8e498:	e5923010 	ldr	r3, [r2, #16]
33f8e49c:	e3130001 	tst	r3, #1	; 0x1
33f8e4a0:	0afffffb 	beq	33f8e494 <serial_getc>
33f8e4a4:	e5d20024 	ldrb	r0, [r2, #36]
33f8e4a8:	e1a0f00e 	mov	pc, lr

33f8e4ac <mmc_get_dev>:
33f8e4ac:	e59f0000 	ldr	r0, [pc, #0]	; 33f8e4b4 <.text+0xe4b4>
33f8e4b0:	e1a0f00e 	mov	pc, lr
33f8e4b4:	33f97c3c 	mvnccs	r7, #15360	; 0x3c00

33f8e4b8 <mmc_size>:
33f8e4b8:	e5d03008 	ldrb	r3, [r0, #8]
33f8e4bc:	e1d010b6 	ldrh	r1, [r0, #6]
33f8e4c0:	e1d020b4 	ldrh	r2, [r0, #4]
33f8e4c4:	e2033003 	and	r3, r3, #3	; 0x3
33f8e4c8:	e1a03503 	mov	r3, r3, lsl #10
33f8e4cc:	e1833321 	orr	r3, r3, r1, lsr #6
33f8e4d0:	e1a02082 	mov	r2, r2, lsl #1
33f8e4d4:	e2833001 	add	r3, r3, #1	; 0x1
33f8e4d8:	e2022c07 	and	r2, r2, #1792	; 0x700
33f8e4dc:	e0020293 	mul	r2, r3, r2
33f8e4e0:	e5d03009 	ldrb	r3, [r0, #9]
33f8e4e4:	e203300f 	and	r3, r3, #15	; 0xf
33f8e4e8:	e1a03603 	mov	r3, r3, lsl #12
33f8e4ec:	e0000293 	mul	r0, r3, r2
33f8e4f0:	e1a0f00e 	mov	pc, lr

33f8e4f4 <mmc_ident>:
33f8e4f4:	e3a00000 	mov	r0, #0	; 0x0
33f8e4f8:	e1a0f00e 	mov	pc, lr

33f8e4fc <mmc2info>:
33f8e4fc:	e2800201 	add	r0, r0, #268435456	; 0x10000000
33f8e500:	e3500402 	cmp	r0, #33554432	; 0x2000000
33f8e504:	23a00000 	movcs	r0, #0	; 0x0
33f8e508:	33a00001 	movcc	r0, #1	; 0x1
33f8e50c:	e1a0f00e 	mov	pc, lr

33f8e510 <print_sd_cid>:
33f8e510:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f8e514:	e1a04000 	mov	r4, r0
33f8e518:	e24dd010 	sub	sp, sp, #16	; 0x10
33f8e51c:	e5d01003 	ldrb	r1, [r0, #3]
33f8e520:	e5d42002 	ldrb	r2, [r4, #2]
33f8e524:	e5d43001 	ldrb	r3, [r4, #1]
33f8e528:	e59f0094 	ldr	r0, [pc, #148]	; 33f8e5c4 <.text+0xe5c4>
33f8e52c:	ebffe5cb 	bl	33f87c60 <printf>
33f8e530:	e5d4c00b 	ldrb	ip, [r4, #11]
33f8e534:	e5d45005 	ldrb	r5, [r4, #5]
33f8e538:	e5d46004 	ldrb	r6, [r4, #4]
33f8e53c:	e5d41000 	ldrb	r1, [r4]
33f8e540:	e5d42007 	ldrb	r2, [r4, #7]
33f8e544:	e5d43006 	ldrb	r3, [r4, #6]
33f8e548:	e20ce00f 	and	lr, ip, #15	; 0xf
33f8e54c:	e59f0074 	ldr	r0, [pc, #116]	; 33f8e5c8 <.text+0xe5c8>
33f8e550:	e1a0c22c 	mov	ip, ip, lsr #4
33f8e554:	e88d5060 	stmia	sp, {r5, r6, ip, lr}
33f8e558:	ebffe5c0 	bl	33f87c60 <printf>
33f8e55c:	e5d41009 	ldrb	r1, [r4, #9]
33f8e560:	e5d4300a 	ldrb	r3, [r4, #10]
33f8e564:	e5d4200f 	ldrb	r2, [r4, #15]
33f8e568:	e1a01801 	mov	r1, r1, lsl #16
33f8e56c:	e1811c03 	orr	r1, r1, r3, lsl #24
33f8e570:	e5d43008 	ldrb	r3, [r4, #8]
33f8e574:	e1811002 	orr	r1, r1, r2
33f8e578:	e1811403 	orr	r1, r1, r3, lsl #8
33f8e57c:	e59f0048 	ldr	r0, [pc, #72]	; 33f8e5cc <.text+0xe5cc>
33f8e580:	ebffe5b6 	bl	33f87c60 <printf>
33f8e584:	e5d4200e 	ldrb	r2, [r4, #14]
33f8e588:	e202200f 	and	r2, r2, #15	; 0xf
33f8e58c:	e5d4100d 	ldrb	r1, [r4, #13]
33f8e590:	e1a02202 	mov	r2, r2, lsl #4
33f8e594:	e2822e7d 	add	r2, r2, #2000	; 0x7d0
33f8e598:	e0822221 	add	r2, r2, r1, lsr #4
33f8e59c:	e59f002c 	ldr	r0, [pc, #44]	; 33f8e5d0 <.text+0xe5d0>
33f8e5a0:	e201100f 	and	r1, r1, #15	; 0xf
33f8e5a4:	ebffe5ad 	bl	33f87c60 <printf>
33f8e5a8:	e5d4100c 	ldrb	r1, [r4, #12]
33f8e5ac:	e59f0020 	ldr	r0, [pc, #32]	; 33f8e5d4 <.text+0xe5d4>
33f8e5b0:	e2012001 	and	r2, r1, #1	; 0x1
33f8e5b4:	e1a010a1 	mov	r1, r1, lsr #1
33f8e5b8:	e28dd010 	add	sp, sp, #16	; 0x10
33f8e5bc:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
33f8e5c0:	eaffe5a6 	b	33f87c60 <printf>
33f8e5c4:	33f94f70 	mvnccs	r4, #448	; 0x1c0
33f8e5c8:	33f94f98 	mvnccs	r4, #608	; 0x260
33f8e5cc:	33f94fcc 	mvnccs	r4, #816	; 0x330
33f8e5d0:	33f94fe4 	mvnccs	r4, #912	; 0x390
33f8e5d4:	33f95000 	mvnccs	r5, #0	; 0x0

33f8e5d8 <print_mmc_cid>:
33f8e5d8:	e92d4010 	stmdb	sp!, {r4, lr}
33f8e5dc:	e1a04000 	mov	r4, r0
33f8e5e0:	e59f008c 	ldr	r0, [pc, #140]	; 33f8e674 <.text+0xe674>
33f8e5e4:	ebffe59d 	bl	33f87c60 <printf>
33f8e5e8:	e5d4300d 	ldrb	r3, [r4, #13]
33f8e5ec:	e5d4100b 	ldrb	r1, [r4, #11]
33f8e5f0:	e5d4200c 	ldrb	r2, [r4, #12]
33f8e5f4:	e59f007c 	ldr	r0, [pc, #124]	; 33f8e678 <.text+0xe678>
33f8e5f8:	ebffe598 	bl	33f87c60 <printf>
33f8e5fc:	e5d41004 	ldrb	r1, [r4, #4]
33f8e600:	e59f0074 	ldr	r0, [pc, #116]	; 33f8e67c <.text+0xe67c>
33f8e604:	e201200f 	and	r2, r1, #15	; 0xf
33f8e608:	e1a01221 	mov	r1, r1, lsr #4
33f8e60c:	ebffe593 	bl	33f87c60 <printf>
33f8e610:	e5d43004 	ldrb	r3, [r4, #4]
33f8e614:	e3c3300f 	bic	r3, r3, #15	; 0xf
33f8e618:	e5c43004 	strb	r3, [r4, #4]
33f8e61c:	e5d43004 	ldrb	r3, [r4, #4]
33f8e620:	e3c330f0 	bic	r3, r3, #240	; 0xf0
33f8e624:	e5c43004 	strb	r3, [r4, #4]
33f8e628:	e2841005 	add	r1, r4, #5	; 0x5
33f8e62c:	e59f004c 	ldr	r0, [pc, #76]	; 33f8e680 <.text+0xe680>
33f8e630:	ebffe58a 	bl	33f87c60 <printf>
33f8e634:	e5d41001 	ldrb	r1, [r4, #1]
33f8e638:	e5d42002 	ldrb	r2, [r4, #2]
33f8e63c:	e5d43003 	ldrb	r3, [r4, #3]
33f8e640:	e59f003c 	ldr	r0, [pc, #60]	; 33f8e684 <.text+0xe684>
33f8e644:	ebffe585 	bl	33f87c60 <printf>
33f8e648:	e5d41000 	ldrb	r1, [r4]
33f8e64c:	e59f0034 	ldr	r0, [pc, #52]	; 33f8e688 <.text+0xe688>
33f8e650:	e1a01221 	mov	r1, r1, lsr #4
33f8e654:	ebffe581 	bl	33f87c60 <printf>
33f8e658:	e5d41000 	ldrb	r1, [r4]
33f8e65c:	e201100f 	and	r1, r1, #15	; 0xf
33f8e660:	e2811d1f 	add	r1, r1, #1984	; 0x7c0
33f8e664:	e59f0020 	ldr	r0, [pc, #32]	; 33f8e68c <.text+0xe68c>
33f8e668:	e281100d 	add	r1, r1, #13	; 0xd
33f8e66c:	e8bd4010 	ldmia	sp!, {r4, lr}
33f8e670:	eaffe57a 	b	33f87c60 <printf>
33f8e674:	33f95028 	mvnccs	r5, #40	; 0x28
33f8e678:	33f9504c 	mvnccs	r5, #76	; 0x4c
33f8e67c:	33f9506c 	mvnccs	r5, #108	; 0x6c
33f8e680:	33f95084 	mvnccs	r5, #132	; 0x84
33f8e684:	33f95098 	mvnccs	r5, #152	; 0x98
33f8e688:	33f950b8 	mvnccs	r5, #184	; 0xb8
33f8e68c:	33f950c4 	mvnccs	r5, #196	; 0xc4

33f8e690 <mmc_cmd>:
33f8e690:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f8e694:	e1a03802 	mov	r3, r2, lsl #16
33f8e698:	e1a05001 	mov	r5, r1
33f8e69c:	e1a04800 	mov	r4, r0, lsl #16
33f8e6a0:	e3a02014 	mov	r2, #20	; 0x14
33f8e6a4:	e59f00c4 	ldr	r0, [pc, #196]	; 33f8e770 <.text+0xe770>
33f8e6a8:	e3a01000 	mov	r1, #0	; 0x0
33f8e6ac:	e1a06823 	mov	r6, r3, lsr #16
33f8e6b0:	ebfff0ee 	bl	33f8aa70 <memset>
33f8e6b4:	e59f30b8 	ldr	r3, [pc, #184]	; 33f8e774 <.text+0xe774>
33f8e6b8:	e1a04824 	mov	r4, r4, lsr #16
33f8e6bc:	e5932000 	ldr	r2, [r3]
33f8e6c0:	e204403f 	and	r4, r4, #63	; 0x3f
33f8e6c4:	e3e03000 	mvn	r3, #0	; 0x0
33f8e6c8:	e2167001 	ands	r7, r6, #1	; 0x1
33f8e6cc:	e5823010 	str	r3, [r2, #16]
33f8e6d0:	e5823034 	str	r3, [r2, #52]
33f8e6d4:	e5823038 	str	r3, [r2, #56]
33f8e6d8:	e3843d05 	orr	r3, r4, #320	; 0x140
33f8e6dc:	13843d0d 	orrne	r3, r4, #832	; 0x340
33f8e6e0:	03a04b02 	moveq	r4, #2048	; 0x800
33f8e6e4:	13a04c02 	movne	r4, #512	; 0x200
33f8e6e8:	e3160002 	tst	r6, #2	; 0x2
33f8e6ec:	13833b01 	orrne	r3, r3, #1024	; 0x400
33f8e6f0:	e5825008 	str	r5, [r2, #8]
33f8e6f4:	e582300c 	str	r3, [r2, #12]
33f8e6f8:	e5921010 	ldr	r1, [r2, #16]
33f8e6fc:	e1110004 	tst	r1, r4
33f8e700:	1a000008 	bne	33f8e728 <mmc_cmd+0x98>
33f8e704:	e3110b01 	tst	r1, #1024	; 0x400
33f8e708:	0afffffa 	beq	33f8e6f8 <mmc_cmd+0x68>
33f8e70c:	e59f0064 	ldr	r0, [pc, #100]	; 33f8e778 <.text+0xe778>
33f8e710:	ebffe552 	bl	33f87c60 <printf>
33f8e714:	e59f3058 	ldr	r3, [pc, #88]	; 33f8e774 <.text+0xe774>
33f8e718:	e5932000 	ldr	r2, [r3]
33f8e71c:	e5923010 	ldr	r3, [r2, #16]
33f8e720:	e3833b01 	orr	r3, r3, #1024	; 0x400
33f8e724:	e5823010 	str	r3, [r2, #16]
33f8e728:	e59f3044 	ldr	r3, [pc, #68]	; 33f8e774 <.text+0xe774>
33f8e72c:	e5931000 	ldr	r1, [r3]
33f8e730:	e5913010 	ldr	r3, [r1, #16]
33f8e734:	e3570000 	cmp	r7, #0	; 0x0
33f8e738:	e1833004 	orr	r3, r3, r4
33f8e73c:	e5813010 	str	r3, [r1, #16]
33f8e740:	0a000008 	beq	33f8e768 <mmc_cmd+0xd8>
33f8e744:	e5913014 	ldr	r3, [r1, #20]
33f8e748:	e59f2020 	ldr	r2, [pc, #32]	; 33f8e770 <.text+0xe770>
33f8e74c:	e5823000 	str	r3, [r2]
33f8e750:	e5913018 	ldr	r3, [r1, #24]
33f8e754:	e5823004 	str	r3, [r2, #4]
33f8e758:	e591301c 	ldr	r3, [r1, #28]
33f8e75c:	e5823008 	str	r3, [r2, #8]
33f8e760:	e5913020 	ldr	r3, [r1, #32]
33f8e764:	e582300c 	str	r3, [r2, #12]
33f8e768:	e59f0000 	ldr	r0, [pc, #0]	; 33f8e770 <.text+0xe770>
33f8e76c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f8e770:	33f97c24 	mvnccs	r7, #9216	; 0x2400
33f8e774:	33f97c38 	mvnccs	r7, #14336	; 0x3800
33f8e778:	33f950d0 	mvnccs	r5, #208	; 0xd0

33f8e77c <mmc_block_write>:
33f8e77c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f8e780:	e2524000 	subs	r4, r2, #0	; 0x0
33f8e784:	e1a06000 	mov	r6, r0
33f8e788:	e1a05001 	mov	r5, r1
33f8e78c:	01a00004 	moveq	r0, r4
33f8e790:	08bd80f0 	ldmeqia	sp!, {r4, r5, r6, r7, pc}
33f8e794:	e59f70b0 	ldr	r7, [pc, #176]	; 33f8e84c <.text+0xe84c>
33f8e798:	e1a01004 	mov	r1, r4
33f8e79c:	e3a02001 	mov	r2, #1	; 0x1
33f8e7a0:	e3a00010 	mov	r0, #16	; 0x10
33f8e7a4:	ebffffb9 	bl	33f8e690 <mmc_cmd>
33f8e7a8:	e5971000 	ldr	r1, [r7]
33f8e7ac:	e1a034c4 	mov	r3, r4, asr #9
33f8e7b0:	e5814028 	str	r4, [r1, #40]
33f8e7b4:	e59f2094 	ldr	r2, [pc, #148]	; 33f8e850 <.text+0xe850>
33f8e7b8:	e1a03a83 	mov	r3, r3, lsl #21
33f8e7bc:	e5922000 	ldr	r2, [r2]
33f8e7c0:	e1a03aa3 	mov	r3, r3, lsr #21
33f8e7c4:	e3833812 	orr	r3, r3, #1179648	; 0x120000
33f8e7c8:	e3520000 	cmp	r2, #0	; 0x0
33f8e7cc:	e3833a03 	orr	r3, r3, #12288	; 0x3000
33f8e7d0:	13833801 	orrne	r3, r3, #65536	; 0x10000
33f8e7d4:	e581302c 	str	r3, [r1, #44]
33f8e7d8:	e3a02001 	mov	r2, #1	; 0x1
33f8e7dc:	e1a01006 	mov	r1, r6
33f8e7e0:	e3a00018 	mov	r0, #24	; 0x18
33f8e7e4:	ebffffa9 	bl	33f8e690 <mmc_cmd>
33f8e7e8:	e5972000 	ldr	r2, [r7]
33f8e7ec:	ea00000b 	b	33f8e820 <mmc_block_write+0xa4>
33f8e7f0:	e3e00000 	mvn	r0, #0	; 0x0
33f8e7f4:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f8e7f8:	e5921034 	ldr	r1, [r2, #52]
33f8e7fc:	e5923038 	ldr	r3, [r2, #56]
33f8e800:	e3130a02 	tst	r3, #8192	; 0x2000
33f8e804:	0a000005 	beq	33f8e820 <mmc_block_write+0xa4>
33f8e808:	e5d53000 	ldrb	r3, [r5]
33f8e80c:	e3110e1a 	tst	r1, #416	; 0x1a0
33f8e810:	e2444001 	sub	r4, r4, #1	; 0x1
33f8e814:	e2855001 	add	r5, r5, #1	; 0x1
33f8e818:	e5823040 	str	r3, [r2, #64]
33f8e81c:	1afffff3 	bne	33f8e7f0 <mmc_block_write+0x74>
33f8e820:	e3540000 	cmp	r4, #0	; 0x0
33f8e824:	cafffff3 	bgt	33f8e7f8 <mmc_block_write+0x7c>
33f8e828:	e5923034 	ldr	r3, [r2, #52]
33f8e82c:	e3130010 	tst	r3, #16	; 0x10
33f8e830:	0afffffc 	beq	33f8e828 <mmc_block_write+0xac>
33f8e834:	e5923034 	ldr	r3, [r2, #52]
33f8e838:	e5923034 	ldr	r3, [r2, #52]
33f8e83c:	e3a00000 	mov	r0, #0	; 0x0
33f8e840:	e3833010 	orr	r3, r3, #16	; 0x10
33f8e844:	e5823034 	str	r3, [r2, #52]
33f8e848:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f8e84c:	33f97c38 	mvnccs	r7, #14336	; 0x3800
33f8e850:	33f97c20 	mvnccs	r7, #8192	; 0x2000

33f8e854 <mmc_block_read>:
33f8e854:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f8e858:	e2524000 	subs	r4, r2, #0	; 0x0
33f8e85c:	e1a06000 	mov	r6, r0
33f8e860:	e1a05001 	mov	r5, r1
33f8e864:	0a000035 	beq	33f8e940 <mmc_block_read+0xec>
33f8e868:	e59f70d8 	ldr	r7, [pc, #216]	; 33f8e948 <.text+0xe948>
33f8e86c:	e1a01004 	mov	r1, r4
33f8e870:	e3a02001 	mov	r2, #1	; 0x1
33f8e874:	e3a00010 	mov	r0, #16	; 0x10
33f8e878:	ebffff84 	bl	33f8e690 <mmc_cmd>
33f8e87c:	e5971000 	ldr	r1, [r7]
33f8e880:	e59f30c4 	ldr	r3, [pc, #196]	; 33f8e94c <.text+0xe94c>
33f8e884:	e5814028 	str	r4, [r1, #40]
33f8e888:	e5932000 	ldr	r2, [r3]
33f8e88c:	e1a034a4 	mov	r3, r4, lsr #9
33f8e890:	e1a03a83 	mov	r3, r3, lsl #21
33f8e894:	e3520000 	cmp	r2, #0	; 0x0
33f8e898:	e1a03aa3 	mov	r3, r3, lsr #21
33f8e89c:	e3832aa2 	orr	r2, r3, #663552	; 0xa2000
33f8e8a0:	13832ab2 	orrne	r2, r3, #729088	; 0xb2000
33f8e8a4:	e3823502 	orr	r3, r2, #8388608	; 0x800000
33f8e8a8:	e3833901 	orr	r3, r3, #16384	; 0x4000
33f8e8ac:	e581302c 	str	r3, [r1, #44]
33f8e8b0:	e59f3098 	ldr	r3, [pc, #152]	; 33f8e950 <.text+0xe950>
33f8e8b4:	e5933000 	ldr	r3, [r3]
33f8e8b8:	e3530009 	cmp	r3, #9	; 0x9
33f8e8bc:	01a054a5 	moveq	r5, r5, lsr #9
33f8e8c0:	e1a01005 	mov	r1, r5
33f8e8c4:	e3a00011 	mov	r0, #17	; 0x11
33f8e8c8:	e3a02001 	mov	r2, #1	; 0x1
33f8e8cc:	ebffff6f 	bl	33f8e690 <mmc_cmd>
33f8e8d0:	e597c000 	ldr	ip, [r7]
33f8e8d4:	e1a00006 	mov	r0, r6
33f8e8d8:	e59c1034 	ldr	r1, [ip, #52]
33f8e8dc:	e3110e1e 	tst	r1, #480	; 0x1e0
33f8e8e0:	e59c3038 	ldr	r3, [ip, #56]
33f8e8e4:	0203307f 	andeq	r3, r3, #127	; 0x7f
33f8e8e8:	01a02123 	moveq	r2, r3, lsr #2
33f8e8ec:	0a000009 	beq	33f8e918 <mmc_block_read+0xc4>
33f8e8f0:	e59f005c 	ldr	r0, [pc, #92]	; 33f8e954 <.text+0xe954>
33f8e8f4:	ebffe4d9 	bl	33f87c60 <printf>
33f8e8f8:	e3e00004 	mvn	r0, #4	; 0x4
33f8e8fc:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f8e900:	e59c3040 	ldr	r3, [ip, #64]
33f8e904:	e3540003 	cmp	r4, #3	; 0x3
33f8e908:	e5803000 	str	r3, [r0]
33f8e90c:	e2444004 	sub	r4, r4, #4	; 0x4
33f8e910:	9a000004 	bls	33f8e928 <mmc_block_read+0xd4>
33f8e914:	e2800004 	add	r0, r0, #4	; 0x4
33f8e918:	e2522001 	subs	r2, r2, #1	; 0x1
33f8e91c:	2afffff7 	bcs	33f8e900 <mmc_block_read+0xac>
33f8e920:	e3540000 	cmp	r4, #0	; 0x0
33f8e924:	1affffeb 	bne	33f8e8d8 <mmc_block_read+0x84>
33f8e928:	e59c3034 	ldr	r3, [ip, #52]
33f8e92c:	e2130010 	ands	r0, r3, #16	; 0x10
33f8e930:	059c3034 	ldreq	r3, [ip, #52]
33f8e934:	03833010 	orreq	r3, r3, #16	; 0x10
33f8e938:	058c3034 	streq	r3, [ip, #52]
33f8e93c:	08bd80f0 	ldmeqia	sp!, {r4, r5, r6, r7, pc}
33f8e940:	e3a00000 	mov	r0, #0	; 0x0
33f8e944:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f8e948:	33f97c38 	mvnccs	r7, #14336	; 0x3800
33f8e94c:	33f97c20 	mvnccs	r7, #8192	; 0x2000
33f8e950:	33f97c3c 	mvnccs	r7, #15360	; 0x3c00
33f8e954:	33f950f4 	mvnccs	r5, #244	; 0xf4

33f8e958 <mmc_write>:
33f8e958:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8e95c:	e3520000 	cmp	r2, #0	; 0x0
33f8e960:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8e964:	e1a0a000 	mov	sl, r0
33f8e968:	0a000045 	beq	33f8ea84 <mmc_write+0x12c>
33f8e96c:	e59f3124 	ldr	r3, [pc, #292]	; 33f8ea98 <.text+0xea98>
33f8e970:	e5933000 	ldr	r3, [r3]
33f8e974:	e3530000 	cmp	r3, #0	; 0x0
33f8e978:	1a000002 	bne	33f8e988 <mmc_write+0x30>
33f8e97c:	e59f0118 	ldr	r0, [pc, #280]	; 33f8ea9c <.text+0xea9c>
33f8e980:	ebffe4b6 	bl	33f87c60 <printf>
33f8e984:	ea000040 	b	33f8ea8c <mmc_write+0x134>
33f8e988:	e2815201 	add	r5, r1, #268435456	; 0x10000000
33f8e98c:	e1a04b85 	mov	r4, r5, lsl #23
33f8e990:	e0852002 	add	r2, r5, r2
33f8e994:	e1a04ba4 	mov	r4, r4, lsr #23
33f8e998:	e3c2bf7f 	bic	fp, r2, #508	; 0x1fc
33f8e99c:	e3540000 	cmp	r4, #0	; 0x0
33f8e9a0:	e58d2000 	str	r2, [sp]
33f8e9a4:	e3cbb003 	bic	fp, fp, #3	; 0x3
33f8e9a8:	0a00001b 	beq	33f8ea1c <mmc_write+0xc4>
33f8e9ac:	e3c56f7f 	bic	r6, r5, #508	; 0x1fc
33f8e9b0:	e59f90e8 	ldr	r9, [pc, #232]	; 33f8eaa0 <.text+0xeaa0>
33f8e9b4:	e3c66003 	bic	r6, r6, #3	; 0x3
33f8e9b8:	e1a00009 	mov	r0, r9
33f8e9bc:	e1a01006 	mov	r1, r6
33f8e9c0:	e3a02c02 	mov	r2, #512	; 0x200
33f8e9c4:	ebffffa2 	bl	33f8e854 <mmc_block_read>
33f8e9c8:	e3500000 	cmp	r0, #0	; 0x0
33f8e9cc:	ba00002e 	blt	33f8ea8c <mmc_write+0x134>
33f8e9d0:	e2647c02 	rsb	r7, r4, #512	; 0x200
33f8e9d4:	e1a0100a 	mov	r1, sl
33f8e9d8:	e1a02007 	mov	r2, r7
33f8e9dc:	e0840009 	add	r0, r4, r9
33f8e9e0:	ebfff034 	bl	33f8aab8 <memcpy>
33f8e9e4:	e1a00006 	mov	r0, r6
33f8e9e8:	e1a01009 	mov	r1, r9
33f8e9ec:	e3a02c02 	mov	r2, #512	; 0x200
33f8e9f0:	ebffff61 	bl	33f8e77c <mmc_block_write>
33f8e9f4:	e3500000 	cmp	r0, #0	; 0x0
33f8e9f8:	a08aa007 	addge	sl, sl, r7
33f8e9fc:	a0855007 	addge	r5, r5, r7
33f8ea00:	aa000005 	bge	33f8ea1c <mmc_write+0xc4>
33f8ea04:	ea000020 	b	33f8ea8c <mmc_write+0x134>
33f8ea08:	ebffff5b 	bl	33f8e77c <mmc_block_write>
33f8ea0c:	e3500000 	cmp	r0, #0	; 0x0
33f8ea10:	ba00001d 	blt	33f8ea8c <mmc_write+0x134>
33f8ea14:	e28aac02 	add	sl, sl, #512	; 0x200
33f8ea18:	e2855c02 	add	r5, r5, #512	; 0x200
33f8ea1c:	e155000b 	cmp	r5, fp
33f8ea20:	e1a00005 	mov	r0, r5
33f8ea24:	e1a0100a 	mov	r1, sl
33f8ea28:	e3a02c02 	mov	r2, #512	; 0x200
33f8ea2c:	3afffff5 	bcc	33f8ea08 <mmc_write+0xb0>
33f8ea30:	e59d3000 	ldr	r3, [sp]
33f8ea34:	e1a04b83 	mov	r4, r3, lsl #23
33f8ea38:	e1a04ba4 	mov	r4, r4, lsr #23
33f8ea3c:	e3540000 	cmp	r4, #0	; 0x0
33f8ea40:	11550003 	cmpne	r5, r3
33f8ea44:	2a00000e 	bcs	33f8ea84 <mmc_write+0x12c>
33f8ea48:	e59f0050 	ldr	r0, [pc, #80]	; 33f8eaa0 <.text+0xeaa0>
33f8ea4c:	e1a0100b 	mov	r1, fp
33f8ea50:	ebffff7f 	bl	33f8e854 <mmc_block_read>
33f8ea54:	e3500000 	cmp	r0, #0	; 0x0
33f8ea58:	ba00000b 	blt	33f8ea8c <mmc_write+0x134>
33f8ea5c:	e1a0100a 	mov	r1, sl
33f8ea60:	e1a02004 	mov	r2, r4
33f8ea64:	e59f0034 	ldr	r0, [pc, #52]	; 33f8eaa0 <.text+0xeaa0>
33f8ea68:	ebfff012 	bl	33f8aab8 <memcpy>
33f8ea6c:	e1a0000b 	mov	r0, fp
33f8ea70:	e59f1028 	ldr	r1, [pc, #40]	; 33f8eaa0 <.text+0xeaa0>
33f8ea74:	e3a02c02 	mov	r2, #512	; 0x200
33f8ea78:	ebffff3f 	bl	33f8e77c <mmc_block_write>
33f8ea7c:	e3500000 	cmp	r0, #0	; 0x0
33f8ea80:	ba000001 	blt	33f8ea8c <mmc_write+0x134>
33f8ea84:	e3a00000 	mov	r0, #0	; 0x0
33f8ea88:	ea000000 	b	33f8ea90 <mmc_write+0x138>
33f8ea8c:	e3e00000 	mvn	r0, #0	; 0x0
33f8ea90:	e28dd004 	add	sp, sp, #4	; 0x4
33f8ea94:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8ea98:	33f97c1c 	mvnccs	r7, #7168	; 0x1c00
33f8ea9c:	33f95118 	mvnccs	r5, #6	; 0x6
33f8eaa0:	33f97ca0 	mvnccs	r7, #40960	; 0xa000

33f8eaa4 <mmc_read>:
33f8eaa4:	e3520000 	cmp	r2, #0	; 0x0
33f8eaa8:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8eaac:	e1a07001 	mov	r7, r1
33f8eab0:	0a000037 	beq	33f8eb94 <mmc_read+0xf0>
33f8eab4:	e59f30e8 	ldr	r3, [pc, #232]	; 33f8eba4 <.text+0xeba4>
33f8eab8:	e5933000 	ldr	r3, [r3]
33f8eabc:	e3530000 	cmp	r3, #0	; 0x0
33f8eac0:	1a000003 	bne	33f8ead4 <mmc_read+0x30>
33f8eac4:	e59f00dc 	ldr	r0, [pc, #220]	; 33f8eba8 <.text+0xeba8>
33f8eac8:	ebffe464 	bl	33f87c60 <printf>
33f8eacc:	e3e00000 	mvn	r0, #0	; 0x0
33f8ead0:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8ead4:	e2805201 	add	r5, r0, #268435456	; 0x10000000
33f8ead8:	e1a06b85 	mov	r6, r5, lsl #23
33f8eadc:	e0859002 	add	r9, r5, r2
33f8eae0:	e1a06ba6 	mov	r6, r6, lsr #23
33f8eae4:	e3c9af7f 	bic	sl, r9, #508	; 0x1fc
33f8eae8:	e3560000 	cmp	r6, #0	; 0x0
33f8eaec:	e3caa003 	bic	sl, sl, #3	; 0x3
33f8eaf0:	0a000014 	beq	33f8eb48 <mmc_read+0xa4>
33f8eaf4:	e59fb0b0 	ldr	fp, [pc, #176]	; 33f8ebac <.text+0xebac>
33f8eaf8:	e3c51f7f 	bic	r1, r5, #508	; 0x1fc
33f8eafc:	e3c11003 	bic	r1, r1, #3	; 0x3
33f8eb00:	e1a0000b 	mov	r0, fp
33f8eb04:	e3a02c02 	mov	r2, #512	; 0x200
33f8eb08:	ebffff51 	bl	33f8e854 <mmc_block_read>
33f8eb0c:	e3500000 	cmp	r0, #0	; 0x0
33f8eb10:	ba000021 	blt	33f8eb9c <mmc_read+0xf8>
33f8eb14:	e2664c02 	rsb	r4, r6, #512	; 0x200
33f8eb18:	e1a00007 	mov	r0, r7
33f8eb1c:	e086100b 	add	r1, r6, fp
33f8eb20:	e1a02004 	mov	r2, r4
33f8eb24:	ebffefe3 	bl	33f8aab8 <memcpy>
33f8eb28:	e0855004 	add	r5, r5, r4
33f8eb2c:	e0877004 	add	r7, r7, r4
33f8eb30:	ea000004 	b	33f8eb48 <mmc_read+0xa4>
33f8eb34:	ebffff46 	bl	33f8e854 <mmc_block_read>
33f8eb38:	e3500000 	cmp	r0, #0	; 0x0
33f8eb3c:	ba000016 	blt	33f8eb9c <mmc_read+0xf8>
33f8eb40:	e2855c02 	add	r5, r5, #512	; 0x200
33f8eb44:	e2877c02 	add	r7, r7, #512	; 0x200
33f8eb48:	e155000a 	cmp	r5, sl
33f8eb4c:	e1a00007 	mov	r0, r7
33f8eb50:	e1a01005 	mov	r1, r5
33f8eb54:	e3a02c02 	mov	r2, #512	; 0x200
33f8eb58:	3afffff5 	bcc	33f8eb34 <mmc_read+0x90>
33f8eb5c:	e1a04b89 	mov	r4, r9, lsl #23
33f8eb60:	e1a04ba4 	mov	r4, r4, lsr #23
33f8eb64:	e3540000 	cmp	r4, #0	; 0x0
33f8eb68:	11550009 	cmpne	r5, r9
33f8eb6c:	2a000008 	bcs	33f8eb94 <mmc_read+0xf0>
33f8eb70:	e1a0100a 	mov	r1, sl
33f8eb74:	e59f0030 	ldr	r0, [pc, #48]	; 33f8ebac <.text+0xebac>
33f8eb78:	ebffff35 	bl	33f8e854 <mmc_block_read>
33f8eb7c:	e3500000 	cmp	r0, #0	; 0x0
33f8eb80:	ba000005 	blt	33f8eb9c <mmc_read+0xf8>
33f8eb84:	e1a00007 	mov	r0, r7
33f8eb88:	e1a02004 	mov	r2, r4
33f8eb8c:	e59f1018 	ldr	r1, [pc, #24]	; 33f8ebac <.text+0xebac>
33f8eb90:	ebffefc8 	bl	33f8aab8 <memcpy>
33f8eb94:	e3a00000 	mov	r0, #0	; 0x0
33f8eb98:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8eb9c:	e3e00000 	mvn	r0, #0	; 0x0
33f8eba0:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8eba4:	33f97c1c 	mvnccs	r7, #7168	; 0x1c00
33f8eba8:	33f95118 	mvnccs	r5, #6	; 0x6
33f8ebac:	33f97ca0 	mvnccs	r7, #40960	; 0xa000

33f8ebb0 <mmc_bread>:
33f8ebb0:	e1a01481 	mov	r1, r1, lsl #9
33f8ebb4:	e92d4010 	stmdb	sp!, {r4, lr}
33f8ebb8:	e281020f 	add	r0, r1, #-268435456	; 0xf0000000
33f8ebbc:	e1a04002 	mov	r4, r2
33f8ebc0:	e1a01003 	mov	r1, r3
33f8ebc4:	e1a02482 	mov	r2, r2, lsl #9
33f8ebc8:	ebffffb5 	bl	33f8eaa4 <mmc_read>
33f8ebcc:	e1a00004 	mov	r0, r4
33f8ebd0:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8ebd4 <mmc_init>:
33f8ebd4:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8ebd8:	e59f44a8 	ldr	r4, [pc, #1192]	; 33f8f088 <.text+0xf088>
33f8ebdc:	e3a0345a 	mov	r3, #1509949440	; 0x5a000000
33f8ebe0:	e24dd018 	sub	sp, sp, #24	; 0x18
33f8ebe4:	e5843000 	str	r3, [r4]
33f8ebe8:	e1a0b000 	mov	fp, r0
33f8ebec:	ebffc7df 	bl	33f80b70 <get_PCLK>
33f8ebf0:	e3a02456 	mov	r2, #1442840576	; 0x56000000
33f8ebf4:	e5923048 	ldr	r3, [r2, #72]
33f8ebf8:	e3c33040 	bic	r3, r3, #64	; 0x40
33f8ebfc:	e5823048 	str	r3, [r2, #72]
33f8ec00:	e5923048 	ldr	r3, [r2, #72]
33f8ec04:	e3c33080 	bic	r3, r3, #128	; 0x80
33f8ec08:	e5823048 	str	r3, [r2, #72]
33f8ec0c:	e5923048 	ldr	r3, [r2, #72]
33f8ec10:	e3c33c01 	bic	r3, r3, #256	; 0x100
33f8ec14:	e5823048 	str	r3, [r2, #72]
33f8ec18:	e5923048 	ldr	r3, [r2, #72]
33f8ec1c:	e3c33c02 	bic	r3, r3, #512	; 0x200
33f8ec20:	e5823048 	str	r3, [r2, #72]
33f8ec24:	e5923048 	ldr	r3, [r2, #72]
33f8ec28:	e3c33b01 	bic	r3, r3, #1024	; 0x400
33f8ec2c:	e5823048 	str	r3, [r2, #72]
33f8ec30:	e5923040 	ldr	r3, [r2, #64]
33f8ec34:	e3c33b03 	bic	r3, r3, #3072	; 0xc00
33f8ec38:	e3833b02 	orr	r3, r3, #2048	; 0x800
33f8ec3c:	e5823040 	str	r3, [r2, #64]
33f8ec40:	e5923040 	ldr	r3, [r2, #64]
33f8ec44:	e3c33a03 	bic	r3, r3, #12288	; 0x3000
33f8ec48:	e3833a02 	orr	r3, r3, #8192	; 0x2000
33f8ec4c:	e5823040 	str	r3, [r2, #64]
33f8ec50:	e5923040 	ldr	r3, [r2, #64]
33f8ec54:	e3c33903 	bic	r3, r3, #49152	; 0xc000
33f8ec58:	e3833902 	orr	r3, r3, #32768	; 0x8000
33f8ec5c:	e5823040 	str	r3, [r2, #64]
33f8ec60:	e5923040 	ldr	r3, [r2, #64]
33f8ec64:	e3c33803 	bic	r3, r3, #196608	; 0x30000
33f8ec68:	e3833802 	orr	r3, r3, #131072	; 0x20000
33f8ec6c:	e5823040 	str	r3, [r2, #64]
33f8ec70:	e5923040 	ldr	r3, [r2, #64]
33f8ec74:	e3c33703 	bic	r3, r3, #786432	; 0xc0000
33f8ec78:	e3833702 	orr	r3, r3, #524288	; 0x80000
33f8ec7c:	e5823040 	str	r3, [r2, #64]
33f8ec80:	e5923040 	ldr	r3, [r2, #64]
33f8ec84:	e3c33603 	bic	r3, r3, #3145728	; 0x300000
33f8ec88:	e3833602 	orr	r3, r3, #2097152	; 0x200000
33f8ec8c:	e5823040 	str	r3, [r2, #64]
33f8ec90:	e5923004 	ldr	r3, [r2, #4]
33f8ec94:	e3c33802 	bic	r3, r3, #131072	; 0x20000
33f8ec98:	e5823004 	str	r3, [r2, #4]
33f8ec9c:	e5923000 	ldr	r3, [r2]
33f8eca0:	e5944000 	ldr	r4, [r4]
33f8eca4:	e3c33802 	bic	r3, r3, #131072	; 0x20000
33f8eca8:	e5823000 	str	r3, [r2]
33f8ecac:	e3a03c01 	mov	r3, #256	; 0x100
33f8ecb0:	e5843000 	str	r3, [r4]
33f8ecb4:	e28224f6 	add	r2, r2, #-167772160	; 0xf6000000
33f8ecb8:	e592300c 	ldr	r3, [r2, #12]
33f8ecbc:	e3833c02 	orr	r3, r3, #512	; 0x200
33f8ecc0:	e582300c 	str	r3, [r2, #12]
33f8ecc4:	e3a03c02 	mov	r3, #512	; 0x200
33f8ecc8:	e5843028 	str	r3, [r4, #40]
33f8eccc:	e59f13b8 	ldr	r1, [pc, #952]	; 33f8f08c <.text+0xf08c>
33f8ecd0:	ebffc7b0 	bl	33f80b98 <__udivsi3>
33f8ecd4:	e59f33b4 	ldr	r3, [pc, #948]	; 33f8f090 <.text+0xf090>
33f8ecd8:	e2400001 	sub	r0, r0, #1	; 0x1
33f8ecdc:	e3a05000 	mov	r5, #0	; 0x0
33f8ece0:	e5840004 	str	r0, [r4, #4]
33f8ece4:	e5843024 	str	r3, [r4, #36]
33f8ece8:	e3a03003 	mov	r3, #3	; 0x3
33f8ecec:	e584503c 	str	r5, [r4, #60]
33f8ecf0:	e59f039c 	ldr	r0, [pc, #924]	; 33f8f094 <.text+0xf094>
33f8ecf4:	e5843000 	str	r3, [r4]
33f8ecf8:	ebffc6e8 	bl	33f808a0 <udelay>
33f8ecfc:	e59fc394 	ldr	ip, [pc, #916]	; 33f8f098 <.text+0xf098>
33f8ed00:	e1dce0b6 	ldrh	lr, [ip, #6]
33f8ed04:	e5dc3008 	ldrb	r3, [ip, #8]
33f8ed08:	e20ee03f 	and	lr, lr, #63	; 0x3f
33f8ed0c:	e3c33003 	bic	r3, r3, #3	; 0x3
33f8ed10:	e59f4384 	ldr	r4, [pc, #900]	; 33f8f09c <.text+0xf09c>
33f8ed14:	e59f6384 	ldr	r6, [pc, #900]	; 33f8f0a0 <.text+0xf0a0>
33f8ed18:	e5cc3008 	strb	r3, [ip, #8]
33f8ed1c:	e1a01005 	mov	r1, r5
33f8ed20:	e1a02005 	mov	r2, r5
33f8ed24:	e1cce0b6 	strh	lr, [ip, #6]
33f8ed28:	e1a00005 	mov	r0, r5
33f8ed2c:	ebfffe57 	bl	33f8e690 <mmc_cmd>
33f8ed30:	e3a00008 	mov	r0, #8	; 0x8
33f8ed34:	e1a01006 	mov	r1, r6
33f8ed38:	e3a02001 	mov	r2, #1	; 0x1
33f8ed3c:	e5845000 	str	r5, [r4]
33f8ed40:	ebfffe52 	bl	33f8e690 <mmc_cmd>
33f8ed44:	e5903000 	ldr	r3, [r0]
33f8ed48:	e1530005 	cmp	r3, r5
33f8ed4c:	03a03007 	moveq	r3, #7	; 0x7
33f8ed50:	05843000 	streq	r3, [r4]
33f8ed54:	0a000005 	beq	33f8ed70 <mmc_init+0x19c>
33f8ed58:	e3a03009 	mov	r3, #9	; 0x9
33f8ed5c:	e5843000 	str	r3, [r4]
33f8ed60:	e5903000 	ldr	r3, [r0]
33f8ed64:	e1530006 	cmp	r3, r6
33f8ed68:	13e05012 	mvnne	r5, #18	; 0x12
33f8ed6c:	1a0000c2 	bne	33f8f07c <mmc_init+0x4a8>
33f8ed70:	e59f032c 	ldr	r0, [pc, #812]	; 33f8f0a4 <.text+0xf0a4>
33f8ed74:	ebffe3b9 	bl	33f87c60 <printf>
33f8ed78:	e3a04009 	mov	r4, #9	; 0x9
33f8ed7c:	e59f0324 	ldr	r0, [pc, #804]	; 33f8f0a8 <.text+0xf0a8>
33f8ed80:	e59f5314 	ldr	r5, [pc, #788]	; 33f8f09c <.text+0xf09c>
33f8ed84:	ebffc6c5 	bl	33f808a0 <udelay>
33f8ed88:	e3a01000 	mov	r1, #0	; 0x0
33f8ed8c:	e3a02001 	mov	r2, #1	; 0x1
33f8ed90:	e3a00037 	mov	r0, #55	; 0x37
33f8ed94:	ebfffe3d 	bl	33f8e690 <mmc_cmd>
33f8ed98:	e5953000 	ldr	r3, [r5]
33f8ed9c:	e3530009 	cmp	r3, #9	; 0x9
33f8eda0:	e59f1304 	ldr	r1, [pc, #772]	; 33f8f0ac <.text+0xf0ac>
33f8eda4:	e3a00029 	mov	r0, #41	; 0x29
33f8eda8:	13a01603 	movne	r1, #3145728	; 0x300000
33f8edac:	e3a02001 	mov	r2, #1	; 0x1
33f8edb0:	ebfffe36 	bl	33f8e690 <mmc_cmd>
33f8edb4:	e5900000 	ldr	r0, [r0]
33f8edb8:	e3500000 	cmp	r0, #0	; 0x0
33f8edbc:	e2444001 	sub	r4, r4, #1	; 0x1
33f8edc0:	ba000003 	blt	33f8edd4 <mmc_init+0x200>
33f8edc4:	e3740001 	cmn	r4, #1	; 0x1
33f8edc8:	1affffeb 	bne	33f8ed7c <mmc_init+0x1a8>
33f8edcc:	e3a09000 	mov	r9, #0	; 0x0
33f8edd0:	ea000004 	b	33f8ede8 <mmc_init+0x214>
33f8edd4:	e2003103 	and	r3, r0, #-1073741824	; 0xc0000000
33f8edd8:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
33f8eddc:	0283311e 	addeq	r3, r3, #-2147483641	; 0x80000007
33f8ede0:	05853000 	streq	r3, [r5]
33f8ede4:	e3a09001 	mov	r9, #1	; 0x1
33f8ede8:	e3a00002 	mov	r0, #2	; 0x2
33f8edec:	e3a01000 	mov	r1, #0	; 0x0
33f8edf0:	e3a02003 	mov	r2, #3	; 0x3
33f8edf4:	ebfffe25 	bl	33f8e690 <mmc_cmd>
33f8edf8:	e250a000 	subs	sl, r0, #0	; 0x0
33f8edfc:	0a000077 	beq	33f8efe0 <mmc_init+0x40c>
33f8ee00:	e3590000 	cmp	r9, #0	; 0x0
33f8ee04:	1a000017 	bne	33f8ee68 <mmc_init+0x294>
33f8ee08:	e35b0000 	cmp	fp, #0	; 0x0
33f8ee0c:	1bfffdf1 	blne	33f8e5d8 <print_mmc_cid>
33f8ee10:	e5dac00d 	ldrb	ip, [sl, #13]
33f8ee14:	e5dae001 	ldrb	lr, [sl, #1]
33f8ee18:	e5da4002 	ldrb	r4, [sl, #2]
33f8ee1c:	e5da5003 	ldrb	r5, [sl, #3]
33f8ee20:	e5da300c 	ldrb	r3, [sl, #12]
33f8ee24:	e5da200b 	ldrb	r2, [sl, #11]
33f8ee28:	e59f1280 	ldr	r1, [pc, #640]	; 33f8f0b0 <.text+0xf0b0>
33f8ee2c:	e59f0280 	ldr	r0, [pc, #640]	; 33f8f0b4 <.text+0xf0b4>
33f8ee30:	e88d5000 	stmia	sp, {ip, lr}
33f8ee34:	e58d4008 	str	r4, [sp, #8]
33f8ee38:	e58d500c 	str	r5, [sp, #12]
33f8ee3c:	ebfff16b 	bl	33f8b3f0 <sprintf>
33f8ee40:	e28a2005 	add	r2, sl, #5	; 0x5
33f8ee44:	e59f126c 	ldr	r1, [pc, #620]	; 33f8f0b8 <.text+0xf0b8>
33f8ee48:	e59f026c 	ldr	r0, [pc, #620]	; 33f8f0bc <.text+0xf0bc>
33f8ee4c:	ebfff167 	bl	33f8b3f0 <sprintf>
33f8ee50:	e5da2004 	ldrb	r2, [sl, #4]
33f8ee54:	e59f1264 	ldr	r1, [pc, #612]	; 33f8f0c0 <.text+0xf0c0>
33f8ee58:	e59f0264 	ldr	r0, [pc, #612]	; 33f8f0c4 <.text+0xf0c4>
33f8ee5c:	e202300f 	and	r3, r2, #15	; 0xf
33f8ee60:	e1a02222 	mov	r2, r2, lsr #4
33f8ee64:	ea000021 	b	33f8eef0 <mmc_init+0x31c>
33f8ee68:	e35b0000 	cmp	fp, #0	; 0x0
33f8ee6c:	1bfffda7 	blne	33f8e510 <print_sd_cid>
33f8ee70:	e5dac001 	ldrb	ip, [sl, #1]
33f8ee74:	e5dae000 	ldrb	lr, [sl]
33f8ee78:	e5da4007 	ldrb	r4, [sl, #7]
33f8ee7c:	e5da5006 	ldrb	r5, [sl, #6]
33f8ee80:	e5da6005 	ldrb	r6, [sl, #5]
33f8ee84:	e5da7004 	ldrb	r7, [sl, #4]
33f8ee88:	e5da2003 	ldrb	r2, [sl, #3]
33f8ee8c:	e5da3002 	ldrb	r3, [sl, #2]
33f8ee90:	e59f1230 	ldr	r1, [pc, #560]	; 33f8f0c8 <.text+0xf0c8>
33f8ee94:	e59f0218 	ldr	r0, [pc, #536]	; 33f8f0b4 <.text+0xf0b4>
33f8ee98:	e88d5000 	stmia	sp, {ip, lr}
33f8ee9c:	e58d4008 	str	r4, [sp, #8]
33f8eea0:	e58d500c 	str	r5, [sp, #12]
33f8eea4:	e58d6010 	str	r6, [sp, #16]
33f8eea8:	e58d7014 	str	r7, [sp, #20]
33f8eeac:	ebfff14f 	bl	33f8b3f0 <sprintf>
33f8eeb0:	e5da2009 	ldrb	r2, [sl, #9]
33f8eeb4:	e5da300a 	ldrb	r3, [sl, #10]
33f8eeb8:	e5da100f 	ldrb	r1, [sl, #15]
33f8eebc:	e1a02802 	mov	r2, r2, lsl #16
33f8eec0:	e1822c03 	orr	r2, r2, r3, lsl #24
33f8eec4:	e5da3008 	ldrb	r3, [sl, #8]
33f8eec8:	e1822001 	orr	r2, r2, r1
33f8eecc:	e1822403 	orr	r2, r2, r3, lsl #8
33f8eed0:	e59f11f4 	ldr	r1, [pc, #500]	; 33f8f0cc <.text+0xf0cc>
33f8eed4:	e59f01e0 	ldr	r0, [pc, #480]	; 33f8f0bc <.text+0xf0bc>
33f8eed8:	ebfff144 	bl	33f8b3f0 <sprintf>
33f8eedc:	e5da200b 	ldrb	r2, [sl, #11]
33f8eee0:	e59f01dc 	ldr	r0, [pc, #476]	; 33f8f0c4 <.text+0xf0c4>
33f8eee4:	e59f11e4 	ldr	r1, [pc, #484]	; 33f8f0d0 <.text+0xf0d0>
33f8eee8:	e202300f 	and	r3, r2, #15	; 0xf
33f8eeec:	e1a02222 	mov	r2, r2, lsr #4
33f8eef0:	ebfff13e 	bl	33f8b3f0 <sprintf>
33f8eef4:	e59fc1a0 	ldr	ip, [pc, #416]	; 33f8f09c <.text+0xf09c>
33f8eef8:	e59c3000 	ldr	r3, [ip]
33f8eefc:	e3530000 	cmp	r3, #0	; 0x0
33f8ef00:	02833006 	addeq	r3, r3, #6	; 0x6
33f8ef04:	058c3000 	streq	r3, [ip]
33f8ef08:	e59f31c4 	ldr	r3, [pc, #452]	; 33f8f0d4 <.text+0xf0d4>
33f8ef0c:	e58c3060 	str	r3, [ip, #96]
33f8ef10:	e3a03002 	mov	r3, #2	; 0x2
33f8ef14:	e5cc3008 	strb	r3, [ip, #8]
33f8ef18:	e3a03c02 	mov	r3, #512	; 0x200
33f8ef1c:	e3a05000 	mov	r5, #0	; 0x0
33f8ef20:	e58c3014 	str	r3, [ip, #20]
33f8ef24:	e3a03501 	mov	r3, #4194304	; 0x400000
33f8ef28:	e58c3010 	str	r3, [ip, #16]
33f8ef2c:	e3a01801 	mov	r1, #65536	; 0x10000
33f8ef30:	e3a02001 	mov	r2, #1	; 0x1
33f8ef34:	e58c5004 	str	r5, [ip, #4]
33f8ef38:	e5cc500a 	strb	r5, [ip, #10]
33f8ef3c:	e5cc500b 	strb	r5, [ip, #11]
33f8ef40:	e5cc500c 	strb	r5, [ip, #12]
33f8ef44:	e3a00003 	mov	r0, #3	; 0x3
33f8ef48:	ebfffdd0 	bl	33f8e690 <mmc_cmd>
33f8ef4c:	e1590005 	cmp	r9, r5
33f8ef50:	159f3180 	ldrne	r3, [pc, #384]	; 33f8f0d8 <.text+0xf0d8>
33f8ef54:	11d000b2 	ldrneh	r0, [r0, #2]
33f8ef58:	11c300b0 	strneh	r0, [r3]
33f8ef5c:	e59f3174 	ldr	r3, [pc, #372]	; 33f8f0d8 <.text+0xf0d8>
33f8ef60:	e1d310b0 	ldrh	r1, [r3]
33f8ef64:	e3a00009 	mov	r0, #9	; 0x9
33f8ef68:	e1a01801 	mov	r1, r1, lsl #16
33f8ef6c:	e3a02003 	mov	r2, #3	; 0x3
33f8ef70:	ebfffdc6 	bl	33f8e690 <mmc_cmd>
33f8ef74:	e2504000 	subs	r4, r0, #0	; 0x0
33f8ef78:	0a000018 	beq	33f8efe0 <mmc_init+0x40c>
33f8ef7c:	e1a01004 	mov	r1, r4
33f8ef80:	e3a02004 	mov	r2, #4	; 0x4
33f8ef84:	e59f010c 	ldr	r0, [pc, #268]	; 33f8f098 <.text+0xf098>
33f8ef88:	ebffeeca 	bl	33f8aab8 <memcpy>
33f8ef8c:	e59f3148 	ldr	r3, [pc, #328]	; 33f8f0dc <.text+0xf0dc>
33f8ef90:	e3a02001 	mov	r2, #1	; 0x1
33f8ef94:	e5832000 	str	r2, [r3]
33f8ef98:	e5d43008 	ldrb	r3, [r4, #8]
33f8ef9c:	e1d420b4 	ldrh	r2, [r4, #4]
33f8efa0:	e1d400b6 	ldrh	r0, [r4, #6]
33f8efa4:	e5d41009 	ldrb	r1, [r4, #9]
33f8efa8:	e2033003 	and	r3, r3, #3	; 0x3
33f8efac:	e1a023a2 	mov	r2, r2, lsr #7
33f8efb0:	e1a03503 	mov	r3, r3, lsl #10
33f8efb4:	e1833320 	orr	r3, r3, r0, lsr #6
33f8efb8:	e201100f 	and	r1, r1, #15	; 0xf
33f8efbc:	e2022007 	and	r2, r2, #7	; 0x7
33f8efc0:	e59f0118 	ldr	r0, [pc, #280]	; 33f8f0e0 <.text+0xf0e0>
33f8efc4:	ebffe325 	bl	33f87c60 <printf>
33f8efc8:	e1a00004 	mov	r0, r4
33f8efcc:	ebfffd39 	bl	33f8e4b8 <mmc_size>
33f8efd0:	e1a01a20 	mov	r1, r0, lsr #20
33f8efd4:	e59f0108 	ldr	r0, [pc, #264]	; 33f8f0e4 <.text+0xf0e4>
33f8efd8:	ebffe320 	bl	33f87c60 <printf>
33f8efdc:	ea000000 	b	33f8efe4 <mmc_init+0x410>
33f8efe0:	e3e05012 	mvn	r5, #18	; 0x12
33f8efe4:	e59f40ec 	ldr	r4, [pc, #236]	; 33f8f0d8 <.text+0xf0d8>
33f8efe8:	e1d410b0 	ldrh	r1, [r4]
33f8efec:	e3a00007 	mov	r0, #7	; 0x7
33f8eff0:	e1a01801 	mov	r1, r1, lsl #16
33f8eff4:	e3a02001 	mov	r2, #1	; 0x1
33f8eff8:	ebfffda4 	bl	33f8e690 <mmc_cmd>
33f8effc:	e35b0000 	cmp	fp, #0	; 0x0
33f8f000:	0a00000b 	beq	33f8f034 <mmc_init+0x460>
33f8f004:	e59f3090 	ldr	r3, [pc, #144]	; 33f8f09c <.text+0xf09c>
33f8f008:	e5930000 	ldr	r0, [r3]
33f8f00c:	e3500009 	cmp	r0, #9	; 0x9
33f8f010:	e1d410b0 	ldrh	r1, [r4]
33f8f014:	059f20cc 	ldreq	r2, [pc, #204]	; 33f8f0e8 <.text+0xf0e8>
33f8f018:	0a000003 	beq	33f8f02c <mmc_init+0x458>
33f8f01c:	e59f30c8 	ldr	r3, [pc, #200]	; 33f8f0ec <.text+0xf0ec>
33f8f020:	e3500007 	cmp	r0, #7	; 0x7
33f8f024:	e59f20c4 	ldr	r2, [pc, #196]	; 33f8f0f0 <.text+0xf0f0>
33f8f028:	01a02003 	moveq	r2, r3
33f8f02c:	e59f00c0 	ldr	r0, [pc, #192]	; 33f8f0f4 <.text+0xf0f4>
33f8f030:	ebffe30a 	bl	33f87c60 <printf>
33f8f034:	e3590000 	cmp	r9, #0	; 0x0
33f8f038:	0a00000c 	beq	33f8f070 <mmc_init+0x49c>
33f8f03c:	e59f3094 	ldr	r3, [pc, #148]	; 33f8f0d8 <.text+0xf0d8>
33f8f040:	e1d310b0 	ldrh	r1, [r3]
33f8f044:	e3a02001 	mov	r2, #1	; 0x1
33f8f048:	e1a01801 	mov	r1, r1, lsl #16
33f8f04c:	e3a00037 	mov	r0, #55	; 0x37
33f8f050:	ebfffd8e 	bl	33f8e690 <mmc_cmd>
33f8f054:	e3a02001 	mov	r2, #1	; 0x1
33f8f058:	e3a00006 	mov	r0, #6	; 0x6
33f8f05c:	e3a01002 	mov	r1, #2	; 0x2
33f8f060:	ebfffd8a 	bl	33f8e690 <mmc_cmd>
33f8f064:	e59f308c 	ldr	r3, [pc, #140]	; 33f8f0f8 <.text+0xf0f8>
33f8f068:	e3a02001 	mov	r2, #1	; 0x1
33f8f06c:	e5832000 	str	r2, [r3]
33f8f070:	e59f0024 	ldr	r0, [pc, #36]	; 33f8f09c <.text+0xf09c>
33f8f074:	e3a01001 	mov	r1, #1	; 0x1
33f8f078:	eb0005c6 	bl	33f90798 <fat_register_device>
33f8f07c:	e1a00005 	mov	r0, r5
33f8f080:	e28dd018 	add	sp, sp, #24	; 0x18
33f8f084:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8f088:	33f97c38 	mvnccs	r7, #14336	; 0x3800
33f8f08c:	00e4e1c0 	rsceq	lr, r4, r0, asr #3
33f8f090:	007fffff 	ldreqsht	pc, [pc, #-255]	; 33f8ef99 <mmc_init+0x3c5>
33f8f094:	0001e848 	andeq	lr, r1, r8, asr #16
33f8f098:	33f97ea0 	mvnccs	r7, #2560	; 0xa00
33f8f09c:	33f97c3c 	mvnccs	r7, #15360	; 0x3c00
33f8f0a0:	000001aa 	andeq	r0, r0, sl, lsr #3
33f8f0a4:	33f9513c 	mvnccs	r5, #15	; 0xf
33f8f0a8:	000186a0 	andeq	r8, r1, r0, lsr #13
33f8f0ac:	40300000 	eormis	r0, r0, r0
33f8f0b0:	33f9515c 	mvnccs	r5, #23	; 0x17
33f8f0b4:	33f97c54 	mvnccs	r7, #21504	; 0x5400
33f8f0b8:	33f94cf4 	mvnccs	r4, #62464	; 0xf400
33f8f0bc:	33f97c7d 	mvnccs	r7, #32000	; 0x7d00
33f8f0c0:	33f95180 	mvnccs	r5, #32	; 0x20
33f8f0c4:	33f97c92 	mvnccs	r7, #37376	; 0x9200
33f8f0c8:	33f95188 	mvnccs	r5, #34	; 0x22
33f8f0cc:	33f92098 	mvnccs	r2, #152	; 0x98
33f8f0d0:	33f951a8 	mvnccs	r5, #42	; 0x2a
33f8f0d4:	33f8ebb0 	mvnccs	lr, #180224	; 0x2c000
33f8f0d8:	33f95ed8 	mvnccs	r5, #3456	; 0xd80
33f8f0dc:	33f97c1c 	mvnccs	r7, #7168	; 0x1c00
33f8f0e0:	33f951b0 	mvnccs	r5, #44	; 0x2c
33f8f0e4:	33f951dc 	mvnccs	r5, #55	; 0x37
33f8f0e8:	33f951ec 	mvnccs	r5, #59	; 0x3b
33f8f0ec:	33f92a7c 	mvnccs	r2, #507904	; 0x7c000
33f8f0f0:	33f951f4 	mvnccs	r5, #61	; 0x3d
33f8f0f4:	33f951f8 	mvnccs	r5, #62	; 0x3e
33f8f0f8:	33f97c20 	mvnccs	r7, #8192	; 0x2000

33f8f0fc <__umodsi3>:
33f8f0fc:	e3510000 	cmp	r1, #0	; 0x0
33f8f100:	0a000026 	beq	33f8f1a0 <Ldiv0>
33f8f104:	e3a03001 	mov	r3, #1	; 0x1
33f8f108:	e1500001 	cmp	r0, r1
33f8f10c:	31a0f00e 	movcc	pc, lr

33f8f110 <Loop1>:
33f8f110:	e3510201 	cmp	r1, #268435456	; 0x10000000
33f8f114:	31510000 	cmpcc	r1, r0
33f8f118:	31a01201 	movcc	r1, r1, lsl #4
33f8f11c:	31a03203 	movcc	r3, r3, lsl #4
33f8f120:	3afffffa 	bcc	33f8f110 <Loop1>

33f8f124 <Lbignum>:
33f8f124:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
33f8f128:	31510000 	cmpcc	r1, r0
33f8f12c:	31a01081 	movcc	r1, r1, lsl #1
33f8f130:	31a03083 	movcc	r3, r3, lsl #1
33f8f134:	3afffffa 	bcc	33f8f124 <Lbignum>

33f8f138 <Loop3>:
33f8f138:	e3a02000 	mov	r2, #0	; 0x0
33f8f13c:	e1500001 	cmp	r0, r1
33f8f140:	20400001 	subcs	r0, r0, r1
33f8f144:	e15000a1 	cmp	r0, r1, lsr #1
33f8f148:	204000a1 	subcs	r0, r0, r1, lsr #1
33f8f14c:	218220e3 	orrcs	r2, r2, r3, ror #1
33f8f150:	e1500121 	cmp	r0, r1, lsr #2
33f8f154:	20400121 	subcs	r0, r0, r1, lsr #2
33f8f158:	21822163 	orrcs	r2, r2, r3, ror #2
33f8f15c:	e15001a1 	cmp	r0, r1, lsr #3
33f8f160:	204001a1 	subcs	r0, r0, r1, lsr #3
33f8f164:	218221e3 	orrcs	r2, r2, r3, ror #3
33f8f168:	e1a0c003 	mov	ip, r3
33f8f16c:	e3500000 	cmp	r0, #0	; 0x0
33f8f170:	11b03223 	movnes	r3, r3, lsr #4
33f8f174:	11a01221 	movne	r1, r1, lsr #4
33f8f178:	1affffee 	bne	33f8f138 <Loop3>
33f8f17c:	e212220e 	ands	r2, r2, #-536870912	; 0xe0000000
33f8f180:	01a0f00e 	moveq	pc, lr
33f8f184:	e11201ec 	tst	r2, ip, ror #3
33f8f188:	108001a1 	addne	r0, r0, r1, lsr #3
33f8f18c:	e112016c 	tst	r2, ip, ror #2
33f8f190:	10800121 	addne	r0, r0, r1, lsr #2
33f8f194:	e11200ec 	tst	r2, ip, ror #1
33f8f198:	108000a1 	addne	r0, r0, r1, lsr #1
33f8f19c:	e1a0f00e 	mov	pc, lr

33f8f1a0 <Ldiv0>:
33f8f1a0:	e52de004 	str	lr, [sp, #-4]!
33f8f1a4:	ebffc75e 	bl	33f80f24 <__div0>
33f8f1a8:	e3a00000 	mov	r0, #0	; 0x0
33f8f1ac:	e8bd8000 	ldmia	sp!, {pc}

33f8f1b0 <__fswab32>:
33f8f1b0:	e1a02000 	mov	r2, r0
33f8f1b4:	e2003cff 	and	r3, r0, #65280	; 0xff00
33f8f1b8:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
33f8f1bc:	e1a03403 	mov	r3, r3, lsl #8
33f8f1c0:	e1a00420 	mov	r0, r0, lsr #8
33f8f1c4:	e1800c22 	orr	r0, r0, r2, lsr #24
33f8f1c8:	e1833c02 	orr	r3, r3, r2, lsl #24
33f8f1cc:	e1830000 	orr	r0, r3, r0
33f8f1d0:	e1a0f00e 	mov	pc, lr

33f8f1d4 <setup_serial_tag>:
33f8f1d4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
33f8f1d8:	e24dd008 	sub	sp, sp, #8	; 0x8
33f8f1dc:	e1a05000 	mov	r5, r0
33f8f1e0:	e1a0000d 	mov	r0, sp
33f8f1e4:	e5954000 	ldr	r4, [r5]
33f8f1e8:	ebfffc23 	bl	33f8e27c <get_board_serial>
33f8f1ec:	e59f3028 	ldr	r3, [pc, #40]	; 33f8f21c <.text+0xf21c>
33f8f1f0:	e5843004 	str	r3, [r4, #4]
33f8f1f4:	e3a03004 	mov	r3, #4	; 0x4
33f8f1f8:	e5843000 	str	r3, [r4]
33f8f1fc:	e59d3000 	ldr	r3, [sp]
33f8f200:	e5843008 	str	r3, [r4, #8]
33f8f204:	e59d3004 	ldr	r3, [sp, #4]
33f8f208:	e2842010 	add	r2, r4, #16	; 0x10
33f8f20c:	e584300c 	str	r3, [r4, #12]
33f8f210:	e5852000 	str	r2, [r5]
33f8f214:	e28dd008 	add	sp, sp, #8	; 0x8
33f8f218:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
33f8f21c:	54410006 	strplb	r0, [r1], #-6

33f8f220 <do_bootm_linux>:
33f8f220:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8f224:	e24dd010 	sub	sp, sp, #16	; 0x10
33f8f228:	e58d0000 	str	r0, [sp]
33f8f22c:	e598c000 	ldr	ip, [r8]
33f8f230:	e59f0354 	ldr	r0, [pc, #852]	; 33f8f58c <.text+0xf58c>
33f8f234:	e1a09002 	mov	r9, r2
33f8f238:	e1a0b001 	mov	fp, r1
33f8f23c:	e1a0a003 	mov	sl, r3
33f8f240:	e58dc008 	str	ip, [sp, #8]
33f8f244:	e59d5034 	ldr	r5, [sp, #52]
33f8f248:	ebffdf51 	bl	33f86f94 <getenv>
33f8f24c:	e59f633c 	ldr	r6, [pc, #828]	; 33f8f590 <.text+0xf590>
33f8f250:	e58d000c 	str	r0, [sp, #12]
33f8f254:	e5960014 	ldr	r0, [r6, #20]
33f8f258:	ebffffd4 	bl	33f8f1b0 <__fswab32>
33f8f25c:	e3590002 	cmp	r9, #2	; 0x2
33f8f260:	e58d0004 	str	r0, [sp, #4]
33f8f264:	da000062 	ble	33f8f3f4 <do_bootm_linux+0x1d4>
33f8f268:	e3a00009 	mov	r0, #9	; 0x9
33f8f26c:	ebfffc03 	bl	33f8e280 <show_boot_progress>
33f8f270:	e3a02010 	mov	r2, #16	; 0x10
33f8f274:	e3a01000 	mov	r1, #0	; 0x0
33f8f278:	e59a0008 	ldr	r0, [sl, #8]
33f8f27c:	ebffee71 	bl	33f8ac48 <simple_strtoul>
33f8f280:	e1a01000 	mov	r1, r0
33f8f284:	e1a05000 	mov	r5, r0
33f8f288:	e59f0304 	ldr	r0, [pc, #772]	; 33f8f594 <.text+0xf594>
33f8f28c:	ebffe273 	bl	33f87c60 <printf>
33f8f290:	e1a01005 	mov	r1, r5
33f8f294:	e3a02040 	mov	r2, #64	; 0x40
33f8f298:	e1a00006 	mov	r0, r6
33f8f29c:	ebffee05 	bl	33f8aab8 <memcpy>
33f8f2a0:	e5960000 	ldr	r0, [r6]
33f8f2a4:	ebffffc1 	bl	33f8f1b0 <__fswab32>
33f8f2a8:	e59f32e8 	ldr	r3, [pc, #744]	; 33f8f598 <.text+0xf598>
33f8f2ac:	e1500003 	cmp	r0, r3
33f8f2b0:	0a000008 	beq	33f8f2d8 <do_bootm_linux+0xb8>
33f8f2b4:	e59f02e0 	ldr	r0, [pc, #736]	; 33f8f59c <.text+0xf59c>
33f8f2b8:	ebffe268 	bl	33f87c60 <printf>
33f8f2bc:	e3e00009 	mvn	r0, #9	; 0x9
33f8f2c0:	ebfffbee 	bl	33f8e280 <show_boot_progress>
33f8f2c4:	e59d0000 	ldr	r0, [sp]
33f8f2c8:	e1a0100b 	mov	r1, fp
33f8f2cc:	e1a02009 	mov	r2, r9
33f8f2d0:	e1a0300a 	mov	r3, sl
33f8f2d4:	ebfffc1d 	bl	33f8e350 <do_reset>
33f8f2d8:	e5960004 	ldr	r0, [r6, #4]
33f8f2dc:	ebffffb3 	bl	33f8f1b0 <__fswab32>
33f8f2e0:	e3a07000 	mov	r7, #0	; 0x0
33f8f2e4:	e1a04000 	mov	r4, r0
33f8f2e8:	e1a01006 	mov	r1, r6
33f8f2ec:	e1a00007 	mov	r0, r7
33f8f2f0:	e3a02040 	mov	r2, #64	; 0x40
33f8f2f4:	e5867004 	str	r7, [r6, #4]
33f8f2f8:	ebffec9a 	bl	33f8a568 <crc32>
33f8f2fc:	e1500004 	cmp	r0, r4
33f8f300:	0a000008 	beq	33f8f328 <do_bootm_linux+0x108>
33f8f304:	e59f0294 	ldr	r0, [pc, #660]	; 33f8f5a0 <.text+0xf5a0>
33f8f308:	ebffe254 	bl	33f87c60 <printf>
33f8f30c:	e3e0000a 	mvn	r0, #10	; 0xa
33f8f310:	ebfffbda 	bl	33f8e280 <show_boot_progress>
33f8f314:	e59d0000 	ldr	r0, [sp]
33f8f318:	e1a0100b 	mov	r1, fp
33f8f31c:	e1a02009 	mov	r2, r9
33f8f320:	e1a0300a 	mov	r3, sl
33f8f324:	ebfffc09 	bl	33f8e350 <do_reset>
33f8f328:	e3a0000a 	mov	r0, #10	; 0xa
33f8f32c:	ebfffbd3 	bl	33f8e280 <show_boot_progress>
33f8f330:	e1a00006 	mov	r0, r6
33f8f334:	ebffd210 	bl	33f83b7c <print_image_hdr>
33f8f338:	e596000c 	ldr	r0, [r6, #12]
33f8f33c:	ebffff9b 	bl	33f8f1b0 <__fswab32>
33f8f340:	e59d3038 	ldr	r3, [sp, #56]
33f8f344:	e3530000 	cmp	r3, #0	; 0x0
33f8f348:	e1a04000 	mov	r4, r0
33f8f34c:	e2855040 	add	r5, r5, #64	; 0x40
33f8f350:	0a000015 	beq	33f8f3ac <do_bootm_linux+0x18c>
33f8f354:	e59f0248 	ldr	r0, [pc, #584]	; 33f8f5a4 <.text+0xf5a4>
33f8f358:	ebffe240 	bl	33f87c60 <printf>
33f8f35c:	e1a02004 	mov	r2, r4
33f8f360:	e1a01005 	mov	r1, r5
33f8f364:	e1a00007 	mov	r0, r7
33f8f368:	ebffec7e 	bl	33f8a568 <crc32>
33f8f36c:	e1a04000 	mov	r4, r0
33f8f370:	e5960018 	ldr	r0, [r6, #24]
33f8f374:	ebffff8d 	bl	33f8f1b0 <__fswab32>
33f8f378:	e1540000 	cmp	r4, r0
33f8f37c:	0a000008 	beq	33f8f3a4 <do_bootm_linux+0x184>
33f8f380:	e59f0220 	ldr	r0, [pc, #544]	; 33f8f5a8 <.text+0xf5a8>
33f8f384:	ebffe235 	bl	33f87c60 <printf>
33f8f388:	e3e0000b 	mvn	r0, #11	; 0xb
33f8f38c:	ebfffbbb 	bl	33f8e280 <show_boot_progress>
33f8f390:	e59d0000 	ldr	r0, [sp]
33f8f394:	e1a0100b 	mov	r1, fp
33f8f398:	e1a02009 	mov	r2, r9
33f8f39c:	e1a0300a 	mov	r3, sl
33f8f3a0:	ebfffbea 	bl	33f8e350 <do_reset>
33f8f3a4:	e59f0200 	ldr	r0, [pc, #512]	; 33f8f5ac <.text+0xf5ac>
33f8f3a8:	ebffe22c 	bl	33f87c60 <printf>
33f8f3ac:	e3a0000b 	mov	r0, #11	; 0xb
33f8f3b0:	ebfffbb2 	bl	33f8e280 <show_boot_progress>
33f8f3b4:	e59f31d4 	ldr	r3, [pc, #468]	; 33f8f590 <.text+0xf590>
33f8f3b8:	e593301c 	ldr	r3, [r3, #28]
33f8f3bc:	e59f21ec 	ldr	r2, [pc, #492]	; 33f8f5b0 <.text+0xf5b0>
33f8f3c0:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
33f8f3c4:	e1530002 	cmp	r3, r2
33f8f3c8:	0a000022 	beq	33f8f458 <do_bootm_linux+0x238>
33f8f3cc:	e59f01e0 	ldr	r0, [pc, #480]	; 33f8f5b4 <.text+0xf5b4>
33f8f3d0:	ebffe222 	bl	33f87c60 <printf>
33f8f3d4:	e3e0000c 	mvn	r0, #12	; 0xc
33f8f3d8:	ebfffba8 	bl	33f8e280 <show_boot_progress>
33f8f3dc:	e59d0000 	ldr	r0, [sp]
33f8f3e0:	e1a0100b 	mov	r1, fp
33f8f3e4:	e1a02009 	mov	r2, r9
33f8f3e8:	e1a0300a 	mov	r3, sl
33f8f3ec:	ebfffbd7 	bl	33f8e350 <do_reset>
33f8f3f0:	ea000018 	b	33f8f458 <do_bootm_linux+0x238>
33f8f3f4:	e5d6301e 	ldrb	r3, [r6, #30]
33f8f3f8:	e3530004 	cmp	r3, #4	; 0x4
33f8f3fc:	1a000012 	bne	33f8f44c <do_bootm_linux+0x22c>
33f8f400:	e5953004 	ldr	r3, [r5, #4]
33f8f404:	e3530000 	cmp	r3, #0	; 0x0
33f8f408:	e2854004 	add	r4, r5, #4	; 0x4
33f8f40c:	0a00000e 	beq	33f8f44c <do_bootm_linux+0x22c>
33f8f410:	e5950000 	ldr	r0, [r5]
33f8f414:	ebffff65 	bl	33f8f1b0 <__fswab32>
33f8f418:	e2006003 	and	r6, r0, #3	; 0x3
33f8f41c:	e3a0000d 	mov	r0, #13	; 0xd
33f8f420:	ebfffb96 	bl	33f8e280 <show_boot_progress>
33f8f424:	e4943004 	ldr	r3, [r4], #4
33f8f428:	e3530000 	cmp	r3, #0	; 0x0
33f8f42c:	1afffffc 	bne	33f8f424 <do_bootm_linux+0x204>
33f8f430:	e5950000 	ldr	r0, [r5]
33f8f434:	ebffff5d 	bl	33f8f1b0 <__fswab32>
33f8f438:	e3560000 	cmp	r6, #0	; 0x0
33f8f43c:	e0845000 	add	r5, r4, r0
33f8f440:	10663005 	rsbne	r3, r6, r5
33f8f444:	12835004 	addne	r5, r3, #4	; 0x4
33f8f448:	ea000002 	b	33f8f458 <do_bootm_linux+0x238>
33f8f44c:	e3a0000e 	mov	r0, #14	; 0xe
33f8f450:	ebfffb8a 	bl	33f8e280 <show_boot_progress>
33f8f454:	ea000001 	b	33f8f460 <do_bootm_linux+0x240>
33f8f458:	e3550000 	cmp	r5, #0	; 0x0
33f8f45c:	1a000001 	bne	33f8f468 <do_bootm_linux+0x248>
33f8f460:	e59f0150 	ldr	r0, [pc, #336]	; 33f8f5b8 <.text+0xf5b8>
33f8f464:	ebffe1fd 	bl	33f87c60 <printf>
33f8f468:	e3a0000f 	mov	r0, #15	; 0xf
33f8f46c:	ebfffb83 	bl	33f8e280 <show_boot_progress>
33f8f470:	e59d3008 	ldr	r3, [sp, #8]
33f8f474:	e59f1140 	ldr	r1, [pc, #320]	; 33f8f5bc <.text+0xf5bc>
33f8f478:	e5932018 	ldr	r2, [r3, #24]
33f8f47c:	e59f313c 	ldr	r3, [pc, #316]	; 33f8f5c0 <.text+0xf5c0>
33f8f480:	e5812000 	str	r2, [r1]
33f8f484:	e5823004 	str	r3, [r2, #4]
33f8f488:	e5912000 	ldr	r2, [r1]
33f8f48c:	e3a03005 	mov	r3, #5	; 0x5
33f8f490:	e5823000 	str	r3, [r2]
33f8f494:	e5913000 	ldr	r3, [r1]
33f8f498:	e3a02000 	mov	r2, #0	; 0x0
33f8f49c:	e5832008 	str	r2, [r3, #8]
33f8f4a0:	e5913000 	ldr	r3, [r1]
33f8f4a4:	e583200c 	str	r2, [r3, #12]
33f8f4a8:	e5913000 	ldr	r3, [r1]
33f8f4ac:	e5832010 	str	r2, [r3, #16]
33f8f4b0:	e5913000 	ldr	r3, [r1]
33f8f4b4:	e5932000 	ldr	r2, [r3]
33f8f4b8:	e0833102 	add	r3, r3, r2, lsl #2
33f8f4bc:	e1a00001 	mov	r0, r1
33f8f4c0:	e5813000 	str	r3, [r1]
33f8f4c4:	ebffff42 	bl	33f8f1d4 <setup_serial_tag>
33f8f4c8:	e59d200c 	ldr	r2, [sp, #12]
33f8f4cc:	e3520000 	cmp	r2, #0	; 0x0
33f8f4d0:	1a000003 	bne	33f8f4e4 <do_bootm_linux+0x2c4>
33f8f4d4:	ea00001a 	b	33f8f544 <do_bootm_linux+0x324>
33f8f4d8:	e59d300c 	ldr	r3, [sp, #12]
33f8f4dc:	e2833001 	add	r3, r3, #1	; 0x1
33f8f4e0:	e58d300c 	str	r3, [sp, #12]
33f8f4e4:	e59d200c 	ldr	r2, [sp, #12]
33f8f4e8:	e5d23000 	ldrb	r3, [r2]
33f8f4ec:	e3530020 	cmp	r3, #32	; 0x20
33f8f4f0:	0afffff8 	beq	33f8f4d8 <do_bootm_linux+0x2b8>
33f8f4f4:	e3530000 	cmp	r3, #0	; 0x0
33f8f4f8:	0a000011 	beq	33f8f544 <do_bootm_linux+0x324>
33f8f4fc:	e59f40b8 	ldr	r4, [pc, #184]	; 33f8f5bc <.text+0xf5bc>
33f8f500:	e59f30bc 	ldr	r3, [pc, #188]	; 33f8f5c4 <.text+0xf5c4>
33f8f504:	e5942000 	ldr	r2, [r4]
33f8f508:	e5823004 	str	r3, [r2, #4]
33f8f50c:	e59d000c 	ldr	r0, [sp, #12]
33f8f510:	e5945000 	ldr	r5, [r4]
33f8f514:	ebffecd4 	bl	33f8a86c <strlen>
33f8f518:	e280000d 	add	r0, r0, #13	; 0xd
33f8f51c:	e1a00120 	mov	r0, r0, lsr #2
33f8f520:	e5850000 	str	r0, [r5]
33f8f524:	e5940000 	ldr	r0, [r4]
33f8f528:	e59d100c 	ldr	r1, [sp, #12]
33f8f52c:	e2800008 	add	r0, r0, #8	; 0x8
33f8f530:	ebffec78 	bl	33f8a718 <strcpy>
33f8f534:	e5943000 	ldr	r3, [r4]
33f8f538:	e5932000 	ldr	r2, [r3]
33f8f53c:	e0833102 	add	r3, r3, r2, lsl #2
33f8f540:	e5843000 	str	r3, [r4]
33f8f544:	e59f2070 	ldr	r2, [pc, #112]	; 33f8f5bc <.text+0xf5bc>
33f8f548:	e5923000 	ldr	r3, [r2]
33f8f54c:	e3a04000 	mov	r4, #0	; 0x0
33f8f550:	e5834004 	str	r4, [r3, #4]
33f8f554:	e5923000 	ldr	r3, [r2]
33f8f558:	e59f0068 	ldr	r0, [pc, #104]	; 33f8f5c8 <.text+0xf5c8>
33f8f55c:	e5834000 	str	r4, [r3]
33f8f560:	ebffe1be 	bl	33f87c60 <printf>
33f8f564:	ebfffb6f 	bl	33f8e328 <cleanup_before_linux>
33f8f568:	e59d3008 	ldr	r3, [sp, #8]
33f8f56c:	e1a00004 	mov	r0, r4
33f8f570:	e2831014 	add	r1, r3, #20	; 0x14
33f8f574:	e8910006 	ldmia	r1, {r1, r2}
33f8f578:	e59d3004 	ldr	r3, [sp, #4]
33f8f57c:	e1a0e00f 	mov	lr, pc
33f8f580:	e1a0f003 	mov	pc, r3
33f8f584:	e28dd010 	add	sp, sp, #16	; 0x10
33f8f588:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f8f58c:	33f92828 	mvnccs	r2, #2621440	; 0x280000
33f8f590:	33f964bc 	mvnccs	r6, #-1140850688	; 0xbc000000
33f8f594:	33f95220 	mvnccs	r5, #2	; 0x2
33f8f598:	27051956 	smlsdcs	r5, r6, r9, r1
33f8f59c:	33f92cbc 	mvnccs	r2, #48128	; 0xbc00
33f8f5a0:	33f92cd0 	mvnccs	r2, #53248	; 0xd000
33f8f5a4:	33f92ce8 	mvnccs	r2, #59392	; 0xe800
33f8f5a8:	33f92d04 	mvnccs	r2, #256	; 0x100
33f8f5ac:	33f92d14 	mvnccs	r2, #1280	; 0x500
33f8f5b0:	00030205 	andeq	r0, r3, r5, lsl #4
33f8f5b4:	33f95248 	mvnccs	r5, #-2147483644	; 0x80000004
33f8f5b8:	33f95264 	mvnccs	r5, #1073741830	; 0x40000006
33f8f5bc:	33f97eb0 	mvnccs	r7, #2816	; 0xb00
33f8f5c0:	54410001 	strplb	r0, [r1], #-1
33f8f5c4:	54410009 	strplb	r0, [r1], #-9
33f8f5c8:	33f95270 	mvnccs	r5, #7	; 0x7

33f8f5cc <flush_cache>:
33f8f5cc:	e1a0f00e 	mov	pc, lr

33f8f5d0 <downcase>:
33f8f5d0:	ea000003 	b	33f8f5e4 <downcase+0x14>
33f8f5d4:	e3520019 	cmp	r2, #25	; 0x19
33f8f5d8:	e2833020 	add	r3, r3, #32	; 0x20
33f8f5dc:	95c03000 	strlsb	r3, [r0]
33f8f5e0:	e2800001 	add	r0, r0, #1	; 0x1
33f8f5e4:	e5d03000 	ldrb	r3, [r0]
33f8f5e8:	e3530000 	cmp	r3, #0	; 0x0
33f8f5ec:	e2432041 	sub	r2, r3, #65	; 0x41
33f8f5f0:	1afffff7 	bne	33f8f5d4 <downcase+0x4>
33f8f5f4:	e1a0f00e 	mov	pc, lr

33f8f5f8 <disk_read>:
33f8f5f8:	e92d4010 	stmdb	sp!, {r4, lr}
33f8f5fc:	e59f3048 	ldr	r3, [pc, #72]	; 33f8f64c <.text+0xf64c>
33f8f600:	e593e000 	ldr	lr, [r3]
33f8f604:	e59f3044 	ldr	r3, [pc, #68]	; 33f8f650 <.text+0xf650>
33f8f608:	e35e0000 	cmp	lr, #0	; 0x0
33f8f60c:	e1a0c001 	mov	ip, r1
33f8f610:	e1a04002 	mov	r4, r2
33f8f614:	e5933000 	ldr	r3, [r3]
33f8f618:	0a000009 	beq	33f8f644 <disk_read+0x4c>
33f8f61c:	e1a0200c 	mov	r2, ip
33f8f620:	e59ec060 	ldr	ip, [lr, #96]
33f8f624:	e35c0000 	cmp	ip, #0	; 0x0
33f8f628:	e0801003 	add	r1, r0, r3
33f8f62c:	e1a03004 	mov	r3, r4
33f8f630:	0a000003 	beq	33f8f644 <disk_read+0x4c>
33f8f634:	e59e0004 	ldr	r0, [lr, #4]
33f8f638:	e1a0e00f 	mov	lr, pc
33f8f63c:	e1a0f00c 	mov	pc, ip
33f8f640:	e8bd8010 	ldmia	sp!, {r4, pc}
33f8f644:	e3e00000 	mvn	r0, #0	; 0x0
33f8f648:	e8bd8010 	ldmia	sp!, {r4, pc}
33f8f64c:	33fc7eb4 	mvnccs	r7, #2880	; 0xb40
33f8f650:	33fc7eb8 	mvnccs	r7, #2944	; 0xb80

33f8f654 <dirdelim>:
33f8f654:	e1a02000 	mov	r2, r0
33f8f658:	ea000005 	b	33f8f674 <dirdelim+0x20>
33f8f65c:	e353005c 	cmp	r3, #92	; 0x5c
33f8f660:	1353002f 	cmpne	r3, #47	; 0x2f
33f8f664:	1a000001 	bne	33f8f670 <dirdelim+0x1c>
33f8f668:	e0620000 	rsb	r0, r2, r0
33f8f66c:	e1a0f00e 	mov	pc, lr
33f8f670:	e2800001 	add	r0, r0, #1	; 0x1
33f8f674:	e5d03000 	ldrb	r3, [r0]
33f8f678:	e3530000 	cmp	r3, #0	; 0x0
33f8f67c:	1afffff6 	bne	33f8f65c <dirdelim+0x8>
33f8f680:	e3e00000 	mvn	r0, #0	; 0x0
33f8f684:	e1a0f00e 	mov	pc, lr

33f8f688 <compare_sign>:
33f8f688:	e3a0c000 	mov	ip, #0	; 0x0
33f8f68c:	e7dc2001 	ldrb	r2, [ip, r1]
33f8f690:	e7dc3000 	ldrb	r3, [ip, r0]
33f8f694:	e1530002 	cmp	r3, r2
33f8f698:	e28cc001 	add	ip, ip, #1	; 0x1
33f8f69c:	0a000001 	beq	33f8f6a8 <compare_sign+0x20>
33f8f6a0:	e3e00000 	mvn	r0, #0	; 0x0
33f8f6a4:	e1a0f00e 	mov	pc, lr
33f8f6a8:	e35c0008 	cmp	ip, #8	; 0x8
33f8f6ac:	1afffff6 	bne	33f8f68c <compare_sign+0x4>
33f8f6b0:	e3a00000 	mov	r0, #0	; 0x0
33f8f6b4:	e1a0f00e 	mov	pc, lr

33f8f6b8 <get_fatent>:
33f8f6b8:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f8f6bc:	e5903c00 	ldr	r3, [r0, #3072]
33f8f6c0:	e3530010 	cmp	r3, #16	; 0x10
33f8f6c4:	e1a05000 	mov	r5, r0
33f8f6c8:	e1a06001 	mov	r6, r1
33f8f6cc:	0a00000a 	beq	33f8f6fc <get_fatent+0x44>
33f8f6d0:	e3530020 	cmp	r3, #32	; 0x20
33f8f6d4:	0a000002 	beq	33f8f6e4 <get_fatent+0x2c>
33f8f6d8:	e353000c 	cmp	r3, #12	; 0xc
33f8f6dc:	1a00004e 	bne	33f8f81c <.text+0xf81c>
33f8f6e0:	ea00000d 	b	33f8f71c <get_fatent+0x64>
33f8f6e4:	e1a00001 	mov	r0, r1
33f8f6e8:	e3a01c03 	mov	r1, #768	; 0x300
33f8f6ec:	ebffc529 	bl	33f80b98 <__udivsi3>
33f8f6f0:	e3a03c03 	mov	r3, #768	; 0x300
33f8f6f4:	e1a04000 	mov	r4, r0
33f8f6f8:	ea000004 	b	33f8f710 <get_fatent+0x58>
33f8f6fc:	e1a00001 	mov	r0, r1
33f8f700:	e3a01c06 	mov	r1, #1536	; 0x600
33f8f704:	ebffc523 	bl	33f80b98 <__udivsi3>
33f8f708:	e3a03c06 	mov	r3, #1536	; 0x600
33f8f70c:	e1a04000 	mov	r4, r0
33f8f710:	e0030394 	mul	r3, r4, r3
33f8f714:	e0636006 	rsb	r6, r3, r6
33f8f718:	ea000001 	b	33f8f724 <get_fatent+0x6c>
33f8f71c:	e1a045a1 	mov	r4, r1, lsr #11
33f8f720:	e0416584 	sub	r6, r1, r4, lsl #11
33f8f724:	e5953c10 	ldr	r3, [r5, #3088]
33f8f728:	e1540003 	cmp	r4, r3
33f8f72c:	0a00000d 	beq	33f8f768 <get_fatent+0xb0>
33f8f730:	e59f30ec 	ldr	r3, [pc, #236]	; 33f8f824 <.text+0xf824>
33f8f734:	e19510b3 	ldrh	r1, [r5, r3]
33f8f738:	e2833002 	add	r3, r3, #2	; 0x2
33f8f73c:	e19520b3 	ldrh	r2, [r5, r3]
33f8f740:	e1a01481 	mov	r1, r1, lsl #9
33f8f744:	e2433b03 	sub	r3, r3, #3072	; 0xc00
33f8f748:	e3510006 	cmp	r1, #6	; 0x6
33f8f74c:	23a01006 	movcs	r1, #6	; 0x6
33f8f750:	e0202394 	mla	r0, r4, r3, r2
33f8f754:	e1a02005 	mov	r2, r5
33f8f758:	ebffffa6 	bl	33f8f5f8 <disk_read>
33f8f75c:	e3500000 	cmp	r0, #0	; 0x0
33f8f760:	ba00002d 	blt	33f8f81c <.text+0xf81c>
33f8f764:	e5854c10 	str	r4, [r5, #3088]
33f8f768:	e5953c00 	ldr	r3, [r5, #3072]
33f8f76c:	e3530010 	cmp	r3, #16	; 0x10
33f8f770:	01a03086 	moveq	r3, r6, lsl #1
33f8f774:	019300b5 	ldreqh	r0, [r3, r5]
33f8f778:	08bd8070 	ldmeqia	sp!, {r4, r5, r6, pc}
33f8f77c:	e3530020 	cmp	r3, #32	; 0x20
33f8f780:	07950106 	ldreq	r0, [r5, r6, lsl #2]
33f8f784:	08bd8070 	ldmeqia	sp!, {r4, r5, r6, pc}
33f8f788:	e353000c 	cmp	r3, #12	; 0xc
33f8f78c:	1a000022 	bne	33f8f81c <.text+0xf81c>
33f8f790:	e3a03003 	mov	r3, #3	; 0x3
33f8f794:	e0020396 	mul	r2, r6, r3
33f8f798:	e0063003 	and	r3, r6, r3
33f8f79c:	e1a01122 	mov	r1, r2, lsr #2
33f8f7a0:	e3530003 	cmp	r3, #3	; 0x3
33f8f7a4:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f8f7a8:	ea00001b 	b	33f8f81c <.text+0xf81c>
33f8f7ac:	33f8f7bc 	mvnccs	pc, #49283072	; 0x2f00000
33f8f7b0:	33f8f7d0 	mvnccs	pc, #54525952	; 0x3400000
33f8f7b4:	33f8f7ec 	mvnccs	pc, #61865984	; 0x3b00000
33f8f7b8:	33f8f80c 	mvnccs	pc, #786432	; 0xc0000
33f8f7bc:	e1a03081 	mov	r3, r1, lsl #1
33f8f7c0:	e19330b5 	ldrh	r3, [r3, r5]
33f8f7c4:	e1a00a03 	mov	r0, r3, lsl #20
33f8f7c8:	e1a00a20 	mov	r0, r0, lsr #20
33f8f7cc:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8f7d0:	e1a03081 	mov	r3, r1, lsl #1
33f8f7d4:	e0852003 	add	r2, r5, r3
33f8f7d8:	e19530b3 	ldrh	r3, [r5, r3]
33f8f7dc:	e5d22002 	ldrb	r2, [r2, #2]
33f8f7e0:	e1a03623 	mov	r3, r3, lsr #12
33f8f7e4:	e1830202 	orr	r0, r3, r2, lsl #4
33f8f7e8:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8f7ec:	e1a01081 	mov	r1, r1, lsl #1
33f8f7f0:	e0853001 	add	r3, r5, r1
33f8f7f4:	e1d320b2 	ldrh	r2, [r3, #2]
33f8f7f8:	e19530b1 	ldrh	r3, [r5, r1]
33f8f7fc:	e202200f 	and	r2, r2, #15	; 0xf
33f8f800:	e1a03423 	mov	r3, r3, lsr #8
33f8f804:	e1830402 	orr	r0, r3, r2, lsl #8
33f8f808:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8f80c:	e1a03081 	mov	r3, r1, lsl #1
33f8f810:	e19330b5 	ldrh	r3, [r3, r5]
33f8f814:	e1a00223 	mov	r0, r3, lsr #4
33f8f818:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8f81c:	e3a00000 	mov	r0, #0	; 0x0
33f8f820:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8f824:	00000c04 	andeq	r0, r0, r4, lsl #24

33f8f828 <slot2str>:
33f8f828:	e92d4010 	stmdb	sp!, {r4, lr}
33f8f82c:	e1a0c002 	mov	ip, r2
33f8f830:	e1a04000 	mov	r4, r0
33f8f834:	e3a0e000 	mov	lr, #0	; 0x0
33f8f838:	e084300e 	add	r3, r4, lr
33f8f83c:	e5d32001 	ldrb	r2, [r3, #1]
33f8f840:	e59c3000 	ldr	r3, [ip]
33f8f844:	e7c12003 	strb	r2, [r1, r3]
33f8f848:	e59c3000 	ldr	r3, [ip]
33f8f84c:	e2832001 	add	r2, r3, #1	; 0x1
33f8f850:	e7d13003 	ldrb	r3, [r1, r3]
33f8f854:	e3530000 	cmp	r3, #0	; 0x0
33f8f858:	e28ee002 	add	lr, lr, #2	; 0x2
33f8f85c:	0a000023 	beq	33f8f8f0 <slot2str+0xc8>
33f8f860:	e35e000a 	cmp	lr, #10	; 0xa
33f8f864:	e58c2000 	str	r2, [ip]
33f8f868:	1afffff2 	bne	33f8f838 <slot2str+0x10>
33f8f86c:	e1a0e004 	mov	lr, r4
33f8f870:	e3a00000 	mov	r0, #0	; 0x0
33f8f874:	e5de200e 	ldrb	r2, [lr, #14]
33f8f878:	e59c3000 	ldr	r3, [ip]
33f8f87c:	e7c12003 	strb	r2, [r1, r3]
33f8f880:	e59c3000 	ldr	r3, [ip]
33f8f884:	e2832001 	add	r2, r3, #1	; 0x1
33f8f888:	e7d13003 	ldrb	r3, [r1, r3]
33f8f88c:	e3530000 	cmp	r3, #0	; 0x0
33f8f890:	e2800002 	add	r0, r0, #2	; 0x2
33f8f894:	e28ee002 	add	lr, lr, #2	; 0x2
33f8f898:	0a000014 	beq	33f8f8f0 <slot2str+0xc8>
33f8f89c:	e350000c 	cmp	r0, #12	; 0xc
33f8f8a0:	e58c2000 	str	r2, [ip]
33f8f8a4:	1afffff2 	bne	33f8f874 <slot2str+0x4c>
33f8f8a8:	e1a03002 	mov	r3, r2
33f8f8ac:	e5d4201c 	ldrb	r2, [r4, #28]
33f8f8b0:	e7c12003 	strb	r2, [r1, r3]
33f8f8b4:	e59c2000 	ldr	r2, [ip]
33f8f8b8:	e7d13002 	ldrb	r3, [r1, r2]
33f8f8bc:	e3530000 	cmp	r3, #0	; 0x0
33f8f8c0:	0a00000a 	beq	33f8f8f0 <slot2str+0xc8>
33f8f8c4:	e2823001 	add	r3, r2, #1	; 0x1
33f8f8c8:	e58c3000 	str	r3, [ip]
33f8f8cc:	e5d4201e 	ldrb	r2, [r4, #30]
33f8f8d0:	e7c12003 	strb	r2, [r1, r3]
33f8f8d4:	e59c2000 	ldr	r2, [ip]
33f8f8d8:	e7d13002 	ldrb	r3, [r1, r2]
33f8f8dc:	e3530000 	cmp	r3, #0	; 0x0
33f8f8e0:	12823001 	addne	r3, r2, #1	; 0x1
33f8f8e4:	13a00000 	movne	r0, #0	; 0x0
33f8f8e8:	158c3000 	strne	r3, [ip]
33f8f8ec:	18bd8010 	ldmneia	sp!, {r4, pc}
33f8f8f0:	e3a00001 	mov	r0, #1	; 0x1
33f8f8f4:	e8bd8010 	ldmia	sp!, {r4, pc}

33f8f8f8 <mkcksum>:
33f8f8f8:	e3a02000 	mov	r2, #0	; 0x0
33f8f8fc:	e1a0c002 	mov	ip, r2
33f8f900:	e1a030a2 	mov	r3, r2, lsr #1
33f8f904:	e7dc1000 	ldrb	r1, [ip, r0]
33f8f908:	e2022001 	and	r2, r2, #1	; 0x1
33f8f90c:	e1833382 	orr	r3, r3, r2, lsl #7
33f8f910:	e28cc001 	add	ip, ip, #1	; 0x1
33f8f914:	e0833001 	add	r3, r3, r1
33f8f918:	e35c000b 	cmp	ip, #11	; 0xb
33f8f91c:	e20320ff 	and	r2, r3, #255	; 0xff
33f8f920:	1afffff6 	bne	33f8f900 <mkcksum+0x8>
33f8f924:	e1a00002 	mov	r0, r2
33f8f928:	e1a0f00e 	mov	pc, lr

33f8f92c <read_bootsectandvi>:
33f8f92c:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f8f930:	e24ddc02 	sub	sp, sp, #512	; 0x200
33f8f934:	e1a04000 	mov	r4, r0
33f8f938:	e1a07001 	mov	r7, r1
33f8f93c:	e1a05002 	mov	r5, r2
33f8f940:	e3a00000 	mov	r0, #0	; 0x0
33f8f944:	e3a01001 	mov	r1, #1	; 0x1
33f8f948:	e1a0200d 	mov	r2, sp
33f8f94c:	ebffff29 	bl	33f8f5f8 <disk_read>
33f8f950:	e3500000 	cmp	r0, #0	; 0x0
33f8f954:	e1a0600d 	mov	r6, sp
33f8f958:	ba000029 	blt	33f8fa04 <read_bootsectandvi+0xd8>
33f8f95c:	e1a00004 	mov	r0, r4
33f8f960:	e1a0100d 	mov	r1, sp
33f8f964:	e3a02040 	mov	r2, #64	; 0x40
33f8f968:	ebffec52 	bl	33f8aab8 <memcpy>
33f8f96c:	e1d431b6 	ldrh	r3, [r4, #22]
33f8f970:	e3530000 	cmp	r3, #0	; 0x0
33f8f974:	028d4040 	addeq	r4, sp, #64	; 0x40
33f8f978:	12844024 	addne	r4, r4, #36	; 0x24
33f8f97c:	02833020 	addeq	r3, r3, #32	; 0x20
33f8f980:	13a03000 	movne	r3, #0	; 0x0
33f8f984:	05853000 	streq	r3, [r5]
33f8f988:	15853000 	strne	r3, [r5]
33f8f98c:	e1a01004 	mov	r1, r4
33f8f990:	e1a00007 	mov	r0, r7
33f8f994:	e3a0201c 	mov	r2, #28	; 0x1c
33f8f998:	ebffec46 	bl	33f8aab8 <memcpy>
33f8f99c:	e3a03000 	mov	r3, #0	; 0x0
33f8f9a0:	e5c4301a 	strb	r3, [r4, #26]
33f8f9a4:	e5953000 	ldr	r3, [r5]
33f8f9a8:	e3530020 	cmp	r3, #32	; 0x20
33f8f9ac:	e2844012 	add	r4, r4, #18	; 0x12
33f8f9b0:	1a000005 	bne	33f8f9cc <read_bootsectandvi+0xa0>
33f8f9b4:	e1a01004 	mov	r1, r4
33f8f9b8:	e59f0050 	ldr	r0, [pc, #80]	; 33f8fa10 <.text+0xfa10>
33f8f9bc:	ebffff31 	bl	33f8f688 <compare_sign>
33f8f9c0:	e3500000 	cmp	r0, #0	; 0x0
33f8f9c4:	1a00000e 	bne	33f8fa04 <read_bootsectandvi+0xd8>
33f8f9c8:	ea00000e 	b	33f8fa08 <read_bootsectandvi+0xdc>
33f8f9cc:	e59f0040 	ldr	r0, [pc, #64]	; 33f8fa14 <.text+0xfa14>
33f8f9d0:	e1a01004 	mov	r1, r4
33f8f9d4:	ebffff2b 	bl	33f8f688 <compare_sign>
33f8f9d8:	e3500000 	cmp	r0, #0	; 0x0
33f8f9dc:	03a0300c 	moveq	r3, #12	; 0xc
33f8f9e0:	0a000005 	beq	33f8f9fc <read_bootsectandvi+0xd0>
33f8f9e4:	e1a01004 	mov	r1, r4
33f8f9e8:	e59f0028 	ldr	r0, [pc, #40]	; 33f8fa18 <.text+0xfa18>
33f8f9ec:	ebffff25 	bl	33f8f688 <compare_sign>
33f8f9f0:	e3500000 	cmp	r0, #0	; 0x0
33f8f9f4:	1a000002 	bne	33f8fa04 <read_bootsectandvi+0xd8>
33f8f9f8:	e3a03010 	mov	r3, #16	; 0x10
33f8f9fc:	e5853000 	str	r3, [r5]
33f8fa00:	ea000000 	b	33f8fa08 <read_bootsectandvi+0xdc>
33f8fa04:	e3e00000 	mvn	r0, #0	; 0x0
33f8fa08:	e28ddc02 	add	sp, sp, #512	; 0x200
33f8fa0c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f8fa10:	33f952e0 	mvnccs	r5, #14	; 0xe
33f8fa14:	33f952ec 	mvnccs	r5, #-1073741810	; 0xc000000e
33f8fa18:	33f952f8 	mvnccs	r5, #-2147483633	; 0x8000000f

33f8fa1c <file_fat_detectfs>:
33f8fa1c:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f8fa20:	e59f4108 	ldr	r4, [pc, #264]	; 33f8fb30 <.text+0xfb30>
33f8fa24:	e5943000 	ldr	r3, [r4]
33f8fa28:	e3530000 	cmp	r3, #0	; 0x0
33f8fa2c:	e24dd06c 	sub	sp, sp, #108	; 0x6c
33f8fa30:	059f00fc 	ldreq	r0, [pc, #252]	; 33f8fb34 <.text+0xfb34>
33f8fa34:	0a00002a 	beq	33f8fae4 <.text+0xfae4>
33f8fa38:	e59f00f8 	ldr	r0, [pc, #248]	; 33f8fb38 <.text+0xfb38>
33f8fa3c:	ebffe087 	bl	33f87c60 <printf>
33f8fa40:	e5943000 	ldr	r3, [r4]
33f8fa44:	e5933000 	ldr	r3, [r3]
33f8fa48:	e2433001 	sub	r3, r3, #1	; 0x1
33f8fa4c:	e3530005 	cmp	r3, #5	; 0x5
33f8fa50:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f8fa54:	ea000011 	b	33f8faa0 <.text+0xfaa0>
33f8fa58:	33f8fa70 	mvnccs	pc, #458752	; 0x70000
33f8fa5c:	33f8fa78 	mvnccs	pc, #491520	; 0x78000
33f8fa60:	33f8fa80 	mvnccs	pc, #524288	; 0x80000
33f8fa64:	33f8fa88 	mvnccs	pc, #557056	; 0x88000
33f8fa68:	33f8fa90 	mvnccs	pc, #589824	; 0x90000
33f8fa6c:	33f8fa98 	mvnccs	pc, #622592	; 0x98000
33f8fa70:	e59f00c4 	ldr	r0, [pc, #196]	; 33f8fb3c <.text+0xfb3c>
33f8fa74:	ea00000a 	b	33f8faa4 <.text+0xfaa4>
33f8fa78:	e59f00c0 	ldr	r0, [pc, #192]	; 33f8fb40 <.text+0xfb40>
33f8fa7c:	ea000008 	b	33f8faa4 <.text+0xfaa4>
33f8fa80:	e59f00bc 	ldr	r0, [pc, #188]	; 33f8fb44 <.text+0xfb44>
33f8fa84:	ea000006 	b	33f8faa4 <.text+0xfaa4>
33f8fa88:	e59f00b8 	ldr	r0, [pc, #184]	; 33f8fb48 <.text+0xfb48>
33f8fa8c:	ea000004 	b	33f8faa4 <.text+0xfaa4>
33f8fa90:	e59f00b4 	ldr	r0, [pc, #180]	; 33f8fb4c <.text+0xfb4c>
33f8fa94:	ea000002 	b	33f8faa4 <.text+0xfaa4>
33f8fa98:	e59f00b0 	ldr	r0, [pc, #176]	; 33f8fb50 <.text+0xfb50>
33f8fa9c:	ea000000 	b	33f8faa4 <.text+0xfaa4>
33f8faa0:	e59f00ac 	ldr	r0, [pc, #172]	; 33f8fb54 <.text+0xfb54>
33f8faa4:	e59f4084 	ldr	r4, [pc, #132]	; 33f8fb30 <.text+0xfb30>
33f8faa8:	ebffe06c 	bl	33f87c60 <printf>
33f8faac:	e5943000 	ldr	r3, [r4]
33f8fab0:	e59f00a0 	ldr	r0, [pc, #160]	; 33f8fb58 <.text+0xfb58>
33f8fab4:	e5931004 	ldr	r1, [r3, #4]
33f8fab8:	ebffe068 	bl	33f87c60 <printf>
33f8fabc:	e28d6040 	add	r6, sp, #64	; 0x40
33f8fac0:	e5940000 	ldr	r0, [r4]
33f8fac4:	eb0003a8 	bl	33f9096c <dev_print>
33f8fac8:	e1a0000d 	mov	r0, sp
33f8facc:	e1a01006 	mov	r1, r6
33f8fad0:	e28d2068 	add	r2, sp, #104	; 0x68
33f8fad4:	ebffff94 	bl	33f8f92c <read_bootsectandvi>
33f8fad8:	e2505000 	subs	r5, r0, #0	; 0x0
33f8fadc:	0a000003 	beq	33f8faf0 <.text+0xfaf0>
33f8fae0:	e59f0074 	ldr	r0, [pc, #116]	; 33f8fb5c <.text+0xfb5c>
33f8fae4:	ebffe05d 	bl	33f87c60 <printf>
33f8fae8:	e3a00001 	mov	r0, #1	; 0x1
33f8faec:	ea00000d 	b	33f8fb28 <.text+0xfb28>
33f8faf0:	e28d405c 	add	r4, sp, #92	; 0x5c
33f8faf4:	e2861007 	add	r1, r6, #7	; 0x7
33f8faf8:	e3a0200b 	mov	r2, #11	; 0xb
33f8fafc:	e1a00004 	mov	r0, r4
33f8fb00:	ebffebec 	bl	33f8aab8 <memcpy>
33f8fb04:	e59f3054 	ldr	r3, [pc, #84]	; 33f8fb60 <.text+0xfb60>
33f8fb08:	e59f0054 	ldr	r0, [pc, #84]	; 33f8fb64 <.text+0xfb64>
33f8fb0c:	e5931000 	ldr	r1, [r3]
33f8fb10:	e2862012 	add	r2, r6, #18	; 0x12
33f8fb14:	e1a03004 	mov	r3, r4
33f8fb18:	e5cd5067 	strb	r5, [sp, #103]
33f8fb1c:	e5cd5057 	strb	r5, [sp, #87]
33f8fb20:	ebffe04e 	bl	33f87c60 <printf>
33f8fb24:	e1a00005 	mov	r0, r5
33f8fb28:	e28dd06c 	add	sp, sp, #108	; 0x6c
33f8fb2c:	e8bd8070 	ldmia	sp!, {r4, r5, r6, pc}
33f8fb30:	33fc7eb4 	mvnccs	r7, #2880	; 0xb40
33f8fb34:	33f95304 	mvnccs	r5, #268435456	; 0x10000000
33f8fb38:	33f95318 	mvnccs	r5, #1610612736	; 0x60000000
33f8fb3c:	33f95328 	mvnccs	r5, #-1610612736	; 0xa0000000
33f8fb40:	33f9532c 	mvnccs	r5, #-1342177280	; 0xb0000000
33f8fb44:	33f95334 	mvnccs	r5, #-805306368	; 0xd0000000
33f8fb48:	33f9533c 	mvnccs	r5, #-268435456	; 0xf0000000
33f8fb4c:	33f95340 	mvnccs	r5, #1	; 0x1
33f8fb50:	33f951f4 	mvnccs	r5, #61	; 0x3d
33f8fb54:	33f95344 	mvnccs	r5, #268435457	; 0x10000001
33f8fb58:	33f9534c 	mvnccs	r5, #805306369	; 0x30000001
33f8fb5c:	33f9535c 	mvnccs	r5, #1879048193	; 0x70000001
33f8fb60:	33f95edc 	mvnccs	r5, #3520	; 0xdc0
33f8fb64:	33f95374 	mvnccs	r5, #-805306367	; 0xd0000001

33f8fb68 <get_cluster>:
33f8fb68:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f8fb6c:	e3510000 	cmp	r1, #0	; 0x0
33f8fb70:	e1a0c003 	mov	ip, r3
33f8fb74:	159f3090 	ldrne	r3, [pc, #144]	; 33f8fc0c <.text+0xfc0c>
33f8fb78:	e1a0a002 	mov	sl, r2
33f8fb7c:	119020b3 	ldrneh	r2, [r0, r3]
33f8fb80:	12833002 	addne	r3, r3, #2	; 0x2
33f8fb84:	119030f3 	ldrnesh	r3, [r0, r3]
33f8fb88:	10253192 	mlane	r5, r2, r1, r3
33f8fb8c:	059f307c 	ldreq	r3, [pc, #124]	; 33f8fc10 <.text+0xfc10>
33f8fb90:	019050b3 	ldreqh	r5, [r0, r3]
33f8fb94:	e1a064ac 	mov	r6, ip, lsr #9
33f8fb98:	e24ddc02 	sub	sp, sp, #512	; 0x200
33f8fb9c:	e1a0200a 	mov	r2, sl
33f8fba0:	e1a00005 	mov	r0, r5
33f8fba4:	e1a01006 	mov	r1, r6
33f8fba8:	e1a04b8c 	mov	r4, ip, lsl #23
33f8fbac:	ebfffe91 	bl	33f8f5f8 <disk_read>
33f8fbb0:	e3500000 	cmp	r0, #0	; 0x0
33f8fbb4:	e1a04ba4 	mov	r4, r4, lsr #23
33f8fbb8:	ba00000f 	blt	33f8fbfc <get_cluster+0x94>
33f8fbbc:	e3540000 	cmp	r4, #0	; 0x0
33f8fbc0:	e1a0700d 	mov	r7, sp
33f8fbc4:	e0850006 	add	r0, r5, r6
33f8fbc8:	e3a01001 	mov	r1, #1	; 0x1
33f8fbcc:	e1a03004 	mov	r3, r4
33f8fbd0:	0a00000a 	beq	33f8fc00 <get_cluster+0x98>
33f8fbd4:	e1a0200d 	mov	r2, sp
33f8fbd8:	ebfffe86 	bl	33f8f5f8 <disk_read>
33f8fbdc:	e3500000 	cmp	r0, #0	; 0x0
33f8fbe0:	e1a0100d 	mov	r1, sp
33f8fbe4:	e1a02004 	mov	r2, r4
33f8fbe8:	e08a0486 	add	r0, sl, r6, lsl #9
33f8fbec:	ba000002 	blt	33f8fbfc <get_cluster+0x94>
33f8fbf0:	ebffebb0 	bl	33f8aab8 <memcpy>
33f8fbf4:	e3a03000 	mov	r3, #0	; 0x0
33f8fbf8:	ea000000 	b	33f8fc00 <get_cluster+0x98>
33f8fbfc:	e3e03000 	mvn	r3, #0	; 0x0
33f8fc00:	e1a00003 	mov	r0, r3
33f8fc04:	e28ddc02 	add	sp, sp, #512	; 0x200
33f8fc08:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f8fc0c:	00000c0a 	andeq	r0, r0, sl, lsl #24
33f8fc10:	00000c08 	andeq	r0, r0, r8, lsl #24

33f8fc14 <get_vfatname>:
33f8fc14:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f8fc18:	e1a0a003 	mov	sl, r3
33f8fc1c:	e59f3178 	ldr	r3, [pc, #376]	; 33f8fd9c <.text+0xfd9c>
33f8fc20:	e24dd004 	sub	sp, sp, #4	; 0x4
33f8fc24:	e19030b3 	ldrh	r3, [r0, r3]
33f8fc28:	e1a04000 	mov	r4, r0
33f8fc2c:	e5da0000 	ldrb	r0, [sl]
33f8fc30:	e59d701c 	ldr	r7, [sp, #28]
33f8fc34:	e082c483 	add	ip, r2, r3, lsl #9
33f8fc38:	e20000bf 	and	r0, r0, #191	; 0xbf
33f8fc3c:	e3a03000 	mov	r3, #0	; 0x0
33f8fc40:	e1a0500a 	mov	r5, sl
33f8fc44:	e58d3000 	str	r3, [sp]
33f8fc48:	ea000007 	b	33f8fc6c <get_vfatname+0x58>
33f8fc4c:	e3500000 	cmp	r0, #0	; 0x0
33f8fc50:	0a000031 	beq	33f8fd1c <get_vfatname+0x108>
33f8fc54:	e5d53000 	ldrb	r3, [r5]
33f8fc58:	e20330bf 	and	r3, r3, #191	; 0xbf
33f8fc5c:	e1530000 	cmp	r3, r0
33f8fc60:	e2855020 	add	r5, r5, #32	; 0x20
33f8fc64:	1a000049 	bne	33f8fd90 <get_vfatname+0x17c>
33f8fc68:	e20200ff 	and	r0, r2, #255	; 0xff
33f8fc6c:	e155000c 	cmp	r5, ip
33f8fc70:	e2402001 	sub	r2, r0, #1	; 0x1
33f8fc74:	3afffff4 	bcc	33f8fc4c <get_vfatname+0x38>
33f8fc78:	e1a00004 	mov	r0, r4
33f8fc7c:	ebfffe8d 	bl	33f8f6b8 <get_fatent>
33f8fc80:	e3500001 	cmp	r0, #1	; 0x1
33f8fc84:	e1a01000 	mov	r1, r0
33f8fc88:	da000005 	ble	33f8fca4 <get_vfatname+0x90>
33f8fc8c:	e5943c00 	ldr	r3, [r4, #3072]
33f8fc90:	e3530020 	cmp	r3, #32	; 0x20
33f8fc94:	e59f3104 	ldr	r3, [pc, #260]	; 33f8fda0 <.text+0xfda0>
33f8fc98:	03e032ff 	mvneq	r3, #-268435441	; 0xf000000f
33f8fc9c:	e1500003 	cmp	r0, r3
33f8fca0:	ba000002 	blt	33f8fcb0 <get_vfatname+0x9c>
33f8fca4:	e59f00f8 	ldr	r0, [pc, #248]	; 33f8fda4 <.text+0xfda4>
33f8fca8:	ebffdfec 	bl	33f87c60 <printf>
33f8fcac:	ea000037 	b	33f8fd90 <get_vfatname+0x17c>
33f8fcb0:	e59f30e4 	ldr	r3, [pc, #228]	; 33f8fd9c <.text+0xfd9c>
33f8fcb4:	e19430b3 	ldrh	r3, [r4, r3]
33f8fcb8:	e1a00004 	mov	r0, r4
33f8fcbc:	e1a03483 	mov	r3, r3, lsl #9
33f8fcc0:	e59f20e0 	ldr	r2, [pc, #224]	; 33f8fda8 <.text+0xfda8>
33f8fcc4:	ebffffa7 	bl	33f8fb68 <get_cluster>
33f8fcc8:	e3500000 	cmp	r0, #0	; 0x0
33f8fccc:	059f40d4 	ldreq	r4, [pc, #212]	; 33f8fda8 <.text+0xfda8>
33f8fcd0:	0a000001 	beq	33f8fcdc <get_vfatname+0xc8>
33f8fcd4:	ea00002d 	b	33f8fd90 <get_vfatname+0x17c>
33f8fcd8:	e2844020 	add	r4, r4, #32	; 0x20
33f8fcdc:	e5d43000 	ldrb	r3, [r4]
33f8fce0:	e3530001 	cmp	r3, #1	; 0x1
33f8fce4:	8afffffb 	bhi	33f8fcd8 <get_vfatname+0xc4>
33f8fce8:	e1a06004 	mov	r6, r4
33f8fcec:	ea000000 	b	33f8fcf4 <get_vfatname+0xe0>
33f8fcf0:	ebfffecc 	bl	33f8f828 <slot2str>
33f8fcf4:	e59f30ac 	ldr	r3, [pc, #172]	; 33f8fda8 <.text+0xfda8>
33f8fcf8:	e1540003 	cmp	r4, r3
33f8fcfc:	e1a00004 	mov	r0, r4
33f8fd00:	e1a01007 	mov	r1, r7
33f8fd04:	e1a0200d 	mov	r2, sp
33f8fd08:	e2444020 	sub	r4, r4, #32	; 0x20
33f8fd0c:	2afffff7 	bcs	33f8fcf0 <get_vfatname+0xdc>
33f8fd10:	e2455020 	sub	r5, r5, #32	; 0x20
33f8fd14:	e2864020 	add	r4, r6, #32	; 0x20
33f8fd18:	ea000000 	b	33f8fd20 <get_vfatname+0x10c>
33f8fd1c:	e1a04005 	mov	r4, r5
33f8fd20:	e2455020 	sub	r5, r5, #32	; 0x20
33f8fd24:	e1a00005 	mov	r0, r5
33f8fd28:	e1a01007 	mov	r1, r7
33f8fd2c:	e1a0200d 	mov	r2, sp
33f8fd30:	ebfffebc 	bl	33f8f828 <slot2str>
33f8fd34:	e3500000 	cmp	r0, #0	; 0x0
33f8fd38:	1a000002 	bne	33f8fd48 <get_vfatname+0x134>
33f8fd3c:	e5d53000 	ldrb	r3, [r5]
33f8fd40:	e3130040 	tst	r3, #64	; 0x40
33f8fd44:	0afffff5 	beq	33f8fd20 <get_vfatname+0x10c>
33f8fd48:	e59d3000 	ldr	r3, [sp]
33f8fd4c:	e3a02000 	mov	r2, #0	; 0x0
33f8fd50:	e7c72003 	strb	r2, [r7, r3]
33f8fd54:	e5d73000 	ldrb	r3, [r7]
33f8fd58:	e35300e5 	cmp	r3, #229	; 0xe5
33f8fd5c:	05c72000 	streqb	r2, [r7]
33f8fd60:	0a000002 	beq	33f8fd70 <get_vfatname+0x15c>
33f8fd64:	e3530005 	cmp	r3, #5	; 0x5
33f8fd68:	03e0301a 	mvneq	r3, #26	; 0x1a
33f8fd6c:	05c73000 	streqb	r3, [r7]
33f8fd70:	e1a00007 	mov	r0, r7
33f8fd74:	ebfffe15 	bl	33f8f5d0 <downcase>
33f8fd78:	e1a0000a 	mov	r0, sl
33f8fd7c:	e1a01004 	mov	r1, r4
33f8fd80:	e3a02020 	mov	r2, #32	; 0x20
33f8fd84:	ebffeb4b 	bl	33f8aab8 <memcpy>
33f8fd88:	e3a00000 	mov	r0, #0	; 0x0
33f8fd8c:	ea000000 	b	33f8fd94 <get_vfatname+0x180>
33f8fd90:	e3e00000 	mvn	r0, #0	; 0x0
33f8fd94:	e28dd004 	add	sp, sp, #4	; 0x4
33f8fd98:	e8bd84f0 	ldmia	sp!, {r4, r5, r6, r7, sl, pc}
33f8fd9c:	00000c0a 	andeq	r0, r0, sl, lsl #24
33f8fda0:	0000fff0 	streqd	pc, [r0], -r0
33f8fda4:	33f95398 	mvnccs	r5, #1610612738	; 0x60000002
33f8fda8:	33f97eb4 	mvnccs	r7, #2880	; 0xb40

33f8fdac <get_name>:
33f8fdac:	e92d44f0 	stmdb	sp!, {r4, r5, r6, r7, sl, lr}
33f8fdb0:	e1a06001 	mov	r6, r1
33f8fdb4:	e1a07000 	mov	r7, r0
33f8fdb8:	e1a01000 	mov	r1, r0
33f8fdbc:	e3a02008 	mov	r2, #8	; 0x8
33f8fdc0:	e1a00006 	mov	r0, r6
33f8fdc4:	ebffeb3b 	bl	33f8aab8 <memcpy>
33f8fdc8:	e1a05006 	mov	r5, r6
33f8fdcc:	e3a03000 	mov	r3, #0	; 0x0
33f8fdd0:	e5c63008 	strb	r3, [r6, #8]
33f8fdd4:	ea000000 	b	33f8fddc <get_name+0x30>
33f8fdd8:	e2855001 	add	r5, r5, #1	; 0x1
33f8fddc:	e5d53000 	ldrb	r3, [r5]
33f8fde0:	e3530000 	cmp	r3, #0	; 0x0
33f8fde4:	13530020 	cmpne	r3, #32	; 0x20
33f8fde8:	03a0a000 	moveq	sl, #0	; 0x0
33f8fdec:	13a0a001 	movne	sl, #1	; 0x1
33f8fdf0:	1afffff8 	bne	33f8fdd8 <get_name+0x2c>
33f8fdf4:	e5d73008 	ldrb	r3, [r7, #8]
33f8fdf8:	e3530000 	cmp	r3, #0	; 0x0
33f8fdfc:	13530020 	cmpne	r3, #32	; 0x20
33f8fe00:	0a00000d 	beq	33f8fe3c <get_name+0x90>
33f8fe04:	e1a04005 	mov	r4, r5
33f8fe08:	e3a0302e 	mov	r3, #46	; 0x2e
33f8fe0c:	e4c43001 	strb	r3, [r4], #1
33f8fe10:	e2871008 	add	r1, r7, #8	; 0x8
33f8fe14:	e1a00004 	mov	r0, r4
33f8fe18:	e3a02003 	mov	r2, #3	; 0x3
33f8fe1c:	ebffeb25 	bl	33f8aab8 <memcpy>
33f8fe20:	e5c4a003 	strb	sl, [r4, #3]
33f8fe24:	e1a04005 	mov	r4, r5
33f8fe28:	e5f43001 	ldrb	r3, [r4, #1]!
33f8fe2c:	e3530000 	cmp	r3, #0	; 0x0
33f8fe30:	13530020 	cmpne	r3, #32	; 0x20
33f8fe34:	1afffffb 	bne	33f8fe28 <get_name+0x7c>
33f8fe38:	e1a05004 	mov	r5, r4
33f8fe3c:	e3a02000 	mov	r2, #0	; 0x0
33f8fe40:	e5c52000 	strb	r2, [r5]
33f8fe44:	e5d63000 	ldrb	r3, [r6]
33f8fe48:	e35300e5 	cmp	r3, #229	; 0xe5
33f8fe4c:	05c62000 	streqb	r2, [r6]
33f8fe50:	0a000002 	beq	33f8fe60 <get_name+0xb4>
33f8fe54:	e3530005 	cmp	r3, #5	; 0x5
33f8fe58:	03e0301a 	mvneq	r3, #26	; 0x1a
33f8fe5c:	05c63000 	streqb	r3, [r6]
33f8fe60:	e1a00006 	mov	r0, r6
33f8fe64:	e8bd44f0 	ldmia	sp!, {r4, r5, r6, r7, sl, lr}
33f8fe68:	eafffdd8 	b	33f8f5d0 <downcase>

33f8fe6c <do_fat_read>:
33f8fe6c:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f8fe70:	e24ddd57 	sub	sp, sp, #5568	; 0x15c0
33f8fe74:	e24dd010 	sub	sp, sp, #16	; 0x10
33f8fe78:	e58d1008 	str	r1, [sp, #8]
33f8fe7c:	e1a05000 	mov	r5, r0
33f8fe80:	e28d1d56 	add	r1, sp, #5504	; 0x1580
33f8fe84:	e28d0d55 	add	r0, sp, #5440	; 0x1540
33f8fe88:	e58d2004 	str	r2, [sp, #4]
33f8fe8c:	e2800004 	add	r0, r0, #4	; 0x4
33f8fe90:	e28d2ec3 	add	r2, sp, #3120	; 0xc30
33f8fe94:	e2811024 	add	r1, r1, #36	; 0x24
33f8fe98:	e1a07003 	mov	r7, r3
33f8fe9c:	ebfffea2 	bl	33f8f92c <read_bootsectandvi>
33f8fea0:	e28d2050 	add	r2, sp, #80	; 0x50
33f8fea4:	e3500000 	cmp	r0, #0	; 0x0
33f8fea8:	e2422020 	sub	r2, r2, #32	; 0x20
33f8feac:	1a000214 	bne	33f90704 <do_fat_read+0x898>
33f8feb0:	e59d3c30 	ldr	r3, [sp, #3120]
33f8feb4:	e3530020 	cmp	r3, #32	; 0x20
33f8feb8:	028d0c15 	addeq	r0, sp, #5376	; 0x1500
33f8febc:	128d1c15 	addne	r1, sp, #5376	; 0x1500
33f8fec0:	059f384c 	ldreq	r3, [pc, #2124]	; 33f90714 <.text+0x10714>
33f8fec4:	01d006b8 	ldreqh	r0, [r0, #104]
33f8fec8:	159f3844 	ldrne	r3, [pc, #2116]	; 33f90714 <.text+0x10714>
33f8fecc:	11d115ba 	ldrneh	r1, [r1, #90]
33f8fed0:	018200b3 	streqh	r0, [r2, r3]
33f8fed4:	118210b3 	strneh	r1, [r2, r3]
33f8fed8:	e28dc050 	add	ip, sp, #80	; 0x50
33f8fedc:	e59f3830 	ldr	r3, [pc, #2096]	; 33f90714 <.text+0x10714>
33f8fee0:	e24cc020 	sub	ip, ip, #32	; 0x20
33f8fee4:	e19c20b3 	ldrh	r2, [ip, r3]
33f8fee8:	e28d3c15 	add	r3, sp, #5376	; 0x1500
33f8feec:	e1d315b2 	ldrh	r1, [r3, #82]
33f8fef0:	e5d33054 	ldrb	r3, [r3, #84]
33f8fef4:	e0231392 	mla	r3, r2, r3, r1
33f8fef8:	e1a03803 	mov	r3, r3, lsl #16
33f8fefc:	e1a0a823 	mov	sl, r3, lsr #16
33f8ff00:	e28d3c15 	add	r3, sp, #5376	; 0x1500
33f8ff04:	e5d32051 	ldrb	r2, [r3, #81]
33f8ff08:	e59f0808 	ldr	r0, [pc, #2056]	; 33f90718 <.text+0x10718>
33f8ff0c:	e59d3c30 	ldr	r3, [sp, #3120]
33f8ff10:	e18ca0b0 	strh	sl, [ip, r0]
33f8ff14:	e3530020 	cmp	r3, #32	; 0x20
33f8ff18:	e59f37fc 	ldr	r3, [pc, #2044]	; 33f9071c <.text+0x1071c>
33f8ff1c:	e18c10b3 	strh	r1, [ip, r3]
33f8ff20:	e2833004 	add	r3, r3, #4	; 0x4
33f8ff24:	e19c10b0 	ldrh	r1, [ip, r0]
33f8ff28:	128d0c15 	addne	r0, sp, #5376	; 0x1500
33f8ff2c:	e18c20b3 	strh	r2, [ip, r3]
33f8ff30:	e1a0e082 	mov	lr, r2, lsl #1
33f8ff34:	15d03056 	ldrneb	r3, [r0, #86]
33f8ff38:	15d02055 	ldrneb	r2, [r0, #85]
33f8ff3c:	10822403 	addne	r2, r2, r3, lsl #8
33f8ff40:	10812222 	addne	r2, r1, r2, lsr #4
33f8ff44:	159f37d4 	ldrne	r3, [pc, #2004]	; 33f90720 <.text+0x10720>
33f8ff48:	02833002 	addeq	r3, r3, #2	; 0x2
33f8ff4c:	006e2001 	rsbeq	r2, lr, r1
33f8ff50:	106e2002 	rsbne	r2, lr, r2
33f8ff54:	e18c20b3 	strh	r2, [ip, r3]
33f8ff58:	e3e03000 	mvn	r3, #0	; 0x0
33f8ff5c:	e58d3c40 	str	r3, [sp, #3136]
33f8ff60:	ea000000 	b	33f8ff68 <do_fat_read+0xfc>
33f8ff64:	e2855001 	add	r5, r5, #1	; 0x1
33f8ff68:	e5d53000 	ldrb	r3, [r5]
33f8ff6c:	e353005c 	cmp	r3, #92	; 0x5c
33f8ff70:	1353002f 	cmpne	r3, #47	; 0x2f
33f8ff74:	13a06000 	movne	r6, #0	; 0x0
33f8ff78:	03a06001 	moveq	r6, #1	; 0x1
33f8ff7c:	0afffff8 	beq	33f8ff64 <do_fat_read+0xf8>
33f8ff80:	e28d4ec5 	add	r4, sp, #3152	; 0xc50
33f8ff84:	e244400c 	sub	r4, r4, #12	; 0xc
33f8ff88:	e1a01005 	mov	r1, r5
33f8ff8c:	e1a00004 	mov	r0, r4
33f8ff90:	ebffe9e0 	bl	33f8a718 <strcpy>
33f8ff94:	e1a00004 	mov	r0, r4
33f8ff98:	ebfffd8c 	bl	33f8f5d0 <downcase>
33f8ff9c:	e5dd3c44 	ldrb	r3, [sp, #3140]
33f8ffa0:	e3530000 	cmp	r3, #0	; 0x0
33f8ffa4:	1a000006 	bne	33f8ffc4 <do_fat_read+0x158>
33f8ffa8:	e3570000 	cmp	r7, #0	; 0x0
33f8ffac:	0a0001d4 	beq	33f90704 <do_fat_read+0x898>
33f8ffb0:	e59f176c 	ldr	r1, [pc, #1900]	; 33f90724 <.text+0x10724>
33f8ffb4:	e3a07002 	mov	r7, #2	; 0x2
33f8ffb8:	e58d1010 	str	r1, [sp, #16]
33f8ffbc:	e58d6018 	str	r6, [sp, #24]
33f8ffc0:	ea000018 	b	33f90028 <do_fat_read+0x1bc>
33f8ffc4:	e1a00004 	mov	r0, r4
33f8ffc8:	ebfffda1 	bl	33f8f654 <dirdelim>
33f8ffcc:	e3500000 	cmp	r0, #0	; 0x0
33f8ffd0:	ba00000c 	blt	33f90008 <do_fat_read+0x19c>
33f8ffd4:	e28d2d57 	add	r2, sp, #5568	; 0x15c0
33f8ffd8:	e2822010 	add	r2, r2, #16	; 0x10
33f8ffdc:	e0823000 	add	r3, r2, r0
33f8ffe0:	e543698c 	strb	r6, [r3, #-2444]
33f8ffe4:	e0840000 	add	r0, r4, r0
33f8ffe8:	e5f03001 	ldrb	r3, [r0, #1]!
33f8ffec:	e353005c 	cmp	r3, #92	; 0x5c
33f8fff0:	1353002f 	cmpne	r3, #47	; 0x2f
33f8fff4:	0afffffb 	beq	33f8ffe8 <do_fat_read+0x17c>
33f8fff8:	e3a03001 	mov	r3, #1	; 0x1
33f8fffc:	e58d0010 	str	r0, [sp, #16]
33f90000:	e58d3018 	str	r3, [sp, #24]
33f90004:	ea000007 	b	33f90028 <do_fat_read+0x1bc>
33f90008:	e3570000 	cmp	r7, #0	; 0x0
33f9000c:	159fc710 	ldrne	ip, [pc, #1808]	; 33f90724 <.text+0x10724>
33f90010:	059f170c 	ldreq	r1, [pc, #1804]	; 33f90724 <.text+0x10724>
33f90014:	13a00001 	movne	r0, #1	; 0x1
33f90018:	158dc010 	strne	ip, [sp, #16]
33f9001c:	158d0018 	strne	r0, [sp, #24]
33f90020:	058d1010 	streq	r1, [sp, #16]
33f90024:	058d7018 	streq	r7, [sp, #24]
33f90028:	e59f26f8 	ldr	r2, [pc, #1784]	; 33f90728 <.text+0x10728>
33f9002c:	e3a09000 	mov	r9, #0	; 0x0
33f90030:	e58d200c 	str	r2, [sp, #12]
33f90034:	e1a0b009 	mov	fp, r9
33f90038:	e28d3d31 	add	r3, sp, #3136	; 0xc40
33f9003c:	e15310b6 	ldrh	r1, [r3, #-6]
33f90040:	e1a0000a 	mov	r0, sl
33f90044:	e59f26e0 	ldr	r2, [pc, #1760]	; 33f9072c <.text+0x1072c>
33f90048:	ebfffd6a 	bl	33f8f5f8 <disk_read>
33f9004c:	e3500000 	cmp	r0, #0	; 0x0
33f90050:	ba0001ab 	blt	33f90704 <do_fat_read+0x898>
33f90054:	e3a03000 	mov	r3, #0	; 0x0
33f90058:	e59f56cc 	ldr	r5, [pc, #1740]	; 33f9072c <.text+0x1072c>
33f9005c:	e58d3020 	str	r3, [sp, #32]
33f90060:	e3a01000 	mov	r1, #0	; 0x0
33f90064:	e28dcb05 	add	ip, sp, #5120	; 0x1400
33f90068:	e5cc1044 	strb	r1, [ip, #68]
33f9006c:	e5d5300b 	ldrb	r3, [r5, #11]
33f90070:	e3130008 	tst	r3, #8	; 0x8
33f90074:	0a00001b 	beq	33f900e8 <do_fat_read+0x27c>
33f90078:	e313000f 	tst	r3, #15	; 0xf
33f9007c:	0a00005c 	beq	33f901f4 <do_fat_read+0x388>
33f90080:	e5d53000 	ldrb	r3, [r5]
33f90084:	e3130040 	tst	r3, #64	; 0x40
33f90088:	0a000059 	beq	33f901f4 <do_fat_read+0x388>
33f9008c:	e5d5c00d 	ldrb	ip, [r5, #13]
33f90090:	e28d0050 	add	r0, sp, #80	; 0x50
33f90094:	e28d4d51 	add	r4, sp, #5184	; 0x1440
33f90098:	e2400020 	sub	r0, r0, #32	; 0x20
33f9009c:	e2844004 	add	r4, r4, #4	; 0x4
33f900a0:	e59f2684 	ldr	r2, [pc, #1668]	; 33f9072c <.text+0x1072c>
33f900a4:	e1a03005 	mov	r3, r5
33f900a8:	e58dc00c 	str	ip, [sp, #12]
33f900ac:	e58d4000 	str	r4, [sp]
33f900b0:	ebfffed7 	bl	33f8fc14 <get_vfatname>
33f900b4:	e3570002 	cmp	r7, #2	; 0x2
33f900b8:	1a00001d 	bne	33f90134 <do_fat_read+0x2c8>
33f900bc:	e5d5300b 	ldrb	r3, [r5, #11]
33f900c0:	e3130010 	tst	r3, #16	; 0x10
33f900c4:	1a00002b 	bne	33f90178 <do_fat_read+0x30c>
33f900c8:	e28d0b05 	add	r0, sp, #5120	; 0x1400
33f900cc:	e5d03044 	ldrb	r3, [r0, #68]
33f900d0:	e3530000 	cmp	r3, #0	; 0x0
33f900d4:	0a000046 	beq	33f901f4 <do_fat_read+0x388>
33f900d8:	e59f0650 	ldr	r0, [pc, #1616]	; 33f90730 <.text+0x10730>
33f900dc:	e595101c 	ldr	r1, [r5, #28]
33f900e0:	e1a02004 	mov	r2, r4
33f900e4:	ea000031 	b	33f901b0 <do_fat_read+0x344>
33f900e8:	e5d54000 	ldrb	r4, [r5]
33f900ec:	e3540000 	cmp	r4, #0	; 0x0
33f900f0:	1a000007 	bne	33f90114 <do_fat_read+0x2a8>
33f900f4:	e3570002 	cmp	r7, #2	; 0x2
33f900f8:	1a000181 	bne	33f90704 <do_fat_read+0x898>
33f900fc:	e59f0630 	ldr	r0, [pc, #1584]	; 33f90734 <.text+0x10734>
33f90100:	e1a01009 	mov	r1, r9
33f90104:	e1a0200b 	mov	r2, fp
33f90108:	ebffded4 	bl	33f87c60 <printf>
33f9010c:	e1a00004 	mov	r0, r4
33f90110:	ea00017c 	b	33f90708 <do_fat_read+0x89c>
33f90114:	e3570002 	cmp	r7, #2	; 0x2
33f90118:	1a000005 	bne	33f90134 <do_fat_read+0x2c8>
33f9011c:	e1a00005 	mov	r0, r5
33f90120:	ebfffdf4 	bl	33f8f8f8 <mkcksum>
33f90124:	e59d100c 	ldr	r1, [sp, #12]
33f90128:	e1500001 	cmp	r0, r1
33f9012c:	1a00015e 	bne	33f906ac <do_fat_read+0x840>
33f90130:	ea00002f 	b	33f901f4 <do_fat_read+0x388>
33f90134:	e28d4d57 	add	r4, sp, #5568	; 0x15c0
33f90138:	e2844002 	add	r4, r4, #2	; 0x2
33f9013c:	e28d6ec5 	add	r6, sp, #3152	; 0xc50
33f90140:	e1a00005 	mov	r0, r5
33f90144:	e1a01004 	mov	r1, r4
33f90148:	e246600c 	sub	r6, r6, #12	; 0xc
33f9014c:	ebffff16 	bl	33f8fdac <get_name>
33f90150:	e1a01004 	mov	r1, r4
33f90154:	e1a00006 	mov	r0, r6
33f90158:	ebffe99c 	bl	33f8a7d0 <strcmp>
33f9015c:	e3500000 	cmp	r0, #0	; 0x0
33f90160:	1a000016 	bne	33f901c0 <do_fat_read+0x354>
33f90164:	ea00001b 	b	33f901d8 <do_fat_read+0x36c>
33f90168:	e28d2c15 	add	r2, sp, #5376	; 0x1500
33f9016c:	e5d230c2 	ldrb	r3, [r2, #194]
33f90170:	e3530000 	cmp	r3, #0	; 0x0
33f90174:	0a00001e 	beq	33f901f4 <do_fat_read+0x388>
33f90178:	e1a01004 	mov	r1, r4
33f9017c:	e59f05b4 	ldr	r0, [pc, #1460]	; 33f90738 <.text+0x10738>
33f90180:	e3a0202f 	mov	r2, #47	; 0x2f
33f90184:	e28bb001 	add	fp, fp, #1	; 0x1
33f90188:	ebffdeb4 	bl	33f87c60 <printf>
33f9018c:	ea000018 	b	33f901f4 <do_fat_read+0x388>
33f90190:	e28dcc15 	add	ip, sp, #5376	; 0x1500
33f90194:	e5dc30c2 	ldrb	r3, [ip, #194]
33f90198:	e3530000 	cmp	r3, #0	; 0x0
33f9019c:	0a000014 	beq	33f901f4 <do_fat_read+0x388>
33f901a0:	e28d2d57 	add	r2, sp, #5568	; 0x15c0
33f901a4:	e59f0584 	ldr	r0, [pc, #1412]	; 33f90730 <.text+0x10730>
33f901a8:	e595101c 	ldr	r1, [r5, #28]
33f901ac:	e2822002 	add	r2, r2, #2	; 0x2
33f901b0:	e3a03020 	mov	r3, #32	; 0x20
33f901b4:	e2899001 	add	r9, r9, #1	; 0x1
33f901b8:	ebffdea8 	bl	33f87c60 <printf>
33f901bc:	ea00000c 	b	33f901f4 <do_fat_read+0x388>
33f901c0:	e28d1d51 	add	r1, sp, #5184	; 0x1440
33f901c4:	e1a00006 	mov	r0, r6
33f901c8:	e2811004 	add	r1, r1, #4	; 0x4
33f901cc:	ebffe97f 	bl	33f8a7d0 <strcmp>
33f901d0:	e3500000 	cmp	r0, #0	; 0x0
33f901d4:	1a000006 	bne	33f901f4 <do_fat_read+0x388>
33f901d8:	e59d0018 	ldr	r0, [sp, #24]
33f901dc:	e3500000 	cmp	r0, #0	; 0x0
33f901e0:	0a0000d0 	beq	33f90528 <do_fat_read+0x6bc>
33f901e4:	e5d5300b 	ldrb	r3, [r5, #11]
33f901e8:	e3130010 	tst	r3, #16	; 0x10
33f901ec:	1a0000cd 	bne	33f90528 <do_fat_read+0x6bc>
33f901f0:	ea000143 	b	33f90704 <do_fat_read+0x898>
33f901f4:	e59d1020 	ldr	r1, [sp, #32]
33f901f8:	e2811001 	add	r1, r1, #1	; 0x1
33f901fc:	e3510010 	cmp	r1, #16	; 0x10
33f90200:	e2855020 	add	r5, r5, #32	; 0x20
33f90204:	e58d1020 	str	r1, [sp, #32]
33f90208:	1affff94 	bne	33f90060 <do_fat_read+0x1f4>
33f9020c:	e28aa001 	add	sl, sl, #1	; 0x1
33f90210:	eaffff88 	b	33f90038 <do_fat_read+0x1cc>
33f90214:	e1a0e005 	mov	lr, r5
33f90218:	e8be000f 	ldmia	lr!, {r0, r1, r2, r3}
33f9021c:	e28dcd56 	add	ip, sp, #5504	; 0x1580
33f90220:	e28cc004 	add	ip, ip, #4	; 0x4
33f90224:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
33f90228:	e89e000f 	ldmia	lr, {r0, r1, r2, r3}
33f9022c:	e88c000f 	stmia	ip, {r0, r1, r2, r3}
33f90230:	e59d0010 	ldr	r0, [sp, #16]
33f90234:	ebfffd06 	bl	33f8f654 <dirdelim>
33f90238:	e3500000 	cmp	r0, #0	; 0x0
33f9023c:	e58d0014 	str	r0, [sp, #20]
33f90240:	ba00000d 	blt	33f9027c <do_fat_read+0x410>
33f90244:	e59d2010 	ldr	r2, [sp, #16]
33f90248:	e3a03000 	mov	r3, #0	; 0x0
33f9024c:	e7c23000 	strb	r3, [r2, r0]
33f90250:	e0823000 	add	r3, r2, r0
33f90254:	e5f32001 	ldrb	r2, [r3, #1]!
33f90258:	e352005c 	cmp	r2, #92	; 0x5c
33f9025c:	1352002f 	cmpne	r2, #47	; 0x2f
33f90260:	0afffffb 	beq	33f90254 <do_fat_read+0x3e8>
33f90264:	e3570000 	cmp	r7, #0	; 0x0
33f90268:	e1a0b003 	mov	fp, r3
33f9026c:	0a00000e 	beq	33f902ac <do_fat_read+0x440>
33f90270:	e3520000 	cmp	r2, #0	; 0x0
33f90274:	058d201c 	streq	r2, [sp, #28]
33f90278:	ea00000b 	b	33f902ac <do_fat_read+0x440>
33f9027c:	e59dc01c 	ldr	ip, [sp, #28]
33f90280:	e3570000 	cmp	r7, #0	; 0x0
33f90284:	135c0000 	cmpne	ip, #0	; 0x0
33f90288:	03a03000 	moveq	r3, #0	; 0x0
33f9028c:	13a03001 	movne	r3, #1	; 0x1
33f90290:	058d3018 	streq	r3, [sp, #24]
33f90294:	01a0a007 	moveq	sl, r7
33f90298:	01a0b003 	moveq	fp, r3
33f9029c:	0a000003 	beq	33f902b0 <do_fat_read+0x444>
33f902a0:	e3a00000 	mov	r0, #0	; 0x0
33f902a4:	e58d001c 	str	r0, [sp, #28]
33f902a8:	e1a0b000 	mov	fp, r0
33f902ac:	e3a0a000 	mov	sl, #0	; 0x0
33f902b0:	e59d3c30 	ldr	r3, [sp, #3120]
33f902b4:	e3530020 	cmp	r3, #32	; 0x20
33f902b8:	e28d2c15 	add	r2, sp, #5376	; 0x1500
33f902bc:	028dcc15 	addeq	ip, sp, #5376	; 0x1500
33f902c0:	e1d219be 	ldrh	r1, [r2, #158]
33f902c4:	01dc39b8 	ldreqh	r3, [ip, #152]
33f902c8:	e59f2458 	ldr	r2, [pc, #1112]	; 33f90728 <.text+0x10728>
33f902cc:	e3a09000 	mov	r9, #0	; 0x0
33f902d0:	13a00000 	movne	r0, #0	; 0x0
33f902d4:	01a00803 	moveq	r0, r3, lsl #16
33f902d8:	e58d202c 	str	r2, [sp, #44]
33f902dc:	e58d9028 	str	r9, [sp, #40]
33f902e0:	e0816000 	add	r6, r1, r0
33f902e4:	e28d0050 	add	r0, sp, #80	; 0x50
33f902e8:	e59f344c 	ldr	r3, [pc, #1100]	; 33f9073c <.text+0x1073c>
33f902ec:	e2400020 	sub	r0, r0, #32	; 0x20
33f902f0:	e19030b3 	ldrh	r3, [r0, r3]
33f902f4:	e1a01006 	mov	r1, r6
33f902f8:	e1a03483 	mov	r3, r3, lsl #9
33f902fc:	e59f243c 	ldr	r2, [pc, #1084]	; 33f90740 <.text+0x10740>
33f90300:	ebfffe18 	bl	33f8fb68 <get_cluster>
33f90304:	e3500000 	cmp	r0, #0	; 0x0
33f90308:	1a000075 	bne	33f904e4 <do_fat_read+0x678>
33f9030c:	e59f542c 	ldr	r5, [pc, #1068]	; 33f90740 <.text+0x10740>
33f90310:	e58d0024 	str	r0, [sp, #36]
33f90314:	ea00005e 	b	33f90494 <do_fat_read+0x628>
33f90318:	e5d52000 	ldrb	r2, [r5]
33f9031c:	e3a03000 	mov	r3, #0	; 0x0
33f90320:	e28dcb05 	add	ip, sp, #5120	; 0x1400
33f90324:	e35200e5 	cmp	r2, #229	; 0xe5
33f90328:	e5cc3044 	strb	r3, [ip, #68]
33f9032c:	0a000054 	beq	33f90484 <do_fat_read+0x618>
33f90330:	e5d5300b 	ldrb	r3, [r5, #11]
33f90334:	e3130008 	tst	r3, #8	; 0x8
33f90338:	0a000014 	beq	33f90390 <do_fat_read+0x524>
33f9033c:	e313000f 	tst	r3, #15	; 0xf
33f90340:	0a00004f 	beq	33f90484 <do_fat_read+0x618>
33f90344:	e3120040 	tst	r2, #64	; 0x40
33f90348:	0a00004d 	beq	33f90484 <do_fat_read+0x618>
33f9034c:	e28d4d51 	add	r4, sp, #5184	; 0x1440
33f90350:	e2844004 	add	r4, r4, #4	; 0x4
33f90354:	e58d4000 	str	r4, [sp]
33f90358:	e5d5c00d 	ldrb	ip, [r5, #13]
33f9035c:	e1a01006 	mov	r1, r6
33f90360:	e59f23d8 	ldr	r2, [pc, #984]	; 33f90740 <.text+0x10740>
33f90364:	e1a03005 	mov	r3, r5
33f90368:	e58dc02c 	str	ip, [sp, #44]
33f9036c:	ebfffe28 	bl	33f8fc14 <get_vfatname>
33f90370:	e35a0000 	cmp	sl, #0	; 0x0
33f90374:	0a000005 	beq	33f90390 <do_fat_read+0x524>
33f90378:	e5d5300b 	ldrb	r3, [r5, #11]
33f9037c:	e3130010 	tst	r3, #16	; 0x10
33f90380:	028dcb05 	addeq	ip, sp, #5120	; 0x1400
33f90384:	05dc3044 	ldreqb	r3, [ip, #68]
33f90388:	0a000025 	beq	33f90424 <do_fat_read+0x5b8>
33f9038c:	ea00001c 	b	33f90404 <do_fat_read+0x598>
33f90390:	e5d53000 	ldrb	r3, [r5]
33f90394:	e3530000 	cmp	r3, #0	; 0x0
33f90398:	1a000006 	bne	33f903b8 <do_fat_read+0x54c>
33f9039c:	e35a0000 	cmp	sl, #0	; 0x0
33f903a0:	0a00004f 	beq	33f904e4 <do_fat_read+0x678>
33f903a4:	e1a01009 	mov	r1, r9
33f903a8:	e59d2028 	ldr	r2, [sp, #40]
33f903ac:	e59f0380 	ldr	r0, [pc, #896]	; 33f90734 <.text+0x10734>
33f903b0:	ebffde2a 	bl	33f87c60 <printf>
33f903b4:	ea00004a 	b	33f904e4 <do_fat_read+0x678>
33f903b8:	e35a0000 	cmp	sl, #0	; 0x0
33f903bc:	0a000005 	beq	33f903d8 <do_fat_read+0x56c>
33f903c0:	e1a00005 	mov	r0, r5
33f903c4:	ebfffd4b 	bl	33f8f8f8 <mkcksum>
33f903c8:	e59d102c 	ldr	r1, [sp, #44]
33f903cc:	e1500001 	cmp	r0, r1
33f903d0:	1a0000be 	bne	33f906d0 <do_fat_read+0x864>
33f903d4:	ea00002a 	b	33f90484 <do_fat_read+0x618>
33f903d8:	e28d4d57 	add	r4, sp, #5568	; 0x15c0
33f903dc:	e2844002 	add	r4, r4, #2	; 0x2
33f903e0:	e1a00005 	mov	r0, r5
33f903e4:	e1a01004 	mov	r1, r4
33f903e8:	ebfffe6f 	bl	33f8fdac <get_name>
33f903ec:	e59d0010 	ldr	r0, [sp, #16]
33f903f0:	e1a01004 	mov	r1, r4
33f903f4:	ebffe8f5 	bl	33f8a7d0 <strcmp>
33f903f8:	e3500000 	cmp	r0, #0	; 0x0
33f903fc:	1a000011 	bne	33f90448 <do_fat_read+0x5dc>
33f90400:	ea000016 	b	33f90460 <do_fat_read+0x5f4>
33f90404:	e59d3028 	ldr	r3, [sp, #40]
33f90408:	e1a01004 	mov	r1, r4
33f9040c:	e2833001 	add	r3, r3, #1	; 0x1
33f90410:	e59f0320 	ldr	r0, [pc, #800]	; 33f90738 <.text+0x10738>
33f90414:	e3a0202f 	mov	r2, #47	; 0x2f
33f90418:	e58d3028 	str	r3, [sp, #40]
33f9041c:	ebffde0f 	bl	33f87c60 <printf>
33f90420:	ea000017 	b	33f90484 <do_fat_read+0x618>
33f90424:	e3530000 	cmp	r3, #0	; 0x0
33f90428:	0a000015 	beq	33f90484 <do_fat_read+0x618>
33f9042c:	e1a02004 	mov	r2, r4
33f90430:	e59f02f8 	ldr	r0, [pc, #760]	; 33f90730 <.text+0x10730>
33f90434:	e595101c 	ldr	r1, [r5, #28]
33f90438:	e3a03020 	mov	r3, #32	; 0x20
33f9043c:	e2899001 	add	r9, r9, #1	; 0x1
33f90440:	ebffde06 	bl	33f87c60 <printf>
33f90444:	ea00000e 	b	33f90484 <do_fat_read+0x618>
33f90448:	e28d1d51 	add	r1, sp, #5184	; 0x1440
33f9044c:	e59d0010 	ldr	r0, [sp, #16]
33f90450:	e2811004 	add	r1, r1, #4	; 0x4
33f90454:	ebffe8dd 	bl	33f8a7d0 <strcmp>
33f90458:	e3500000 	cmp	r0, #0	; 0x0
33f9045c:	1a000008 	bne	33f90484 <do_fat_read+0x618>
33f90460:	e28d0d56 	add	r0, sp, #5504	; 0x1580
33f90464:	e1a01005 	mov	r1, r5
33f90468:	e2800004 	add	r0, r0, #4	; 0x4
33f9046c:	e3a02020 	mov	r2, #32	; 0x20
33f90470:	ebffe990 	bl	33f8aab8 <memcpy>
33f90474:	e59d0014 	ldr	r0, [sp, #20]
33f90478:	e3500000 	cmp	r0, #0	; 0x0
33f9047c:	ba000026 	blt	33f9051c <do_fat_read+0x6b0>
33f90480:	ea000020 	b	33f90508 <do_fat_read+0x69c>
33f90484:	e59d1024 	ldr	r1, [sp, #36]
33f90488:	e2811001 	add	r1, r1, #1	; 0x1
33f9048c:	e58d1024 	str	r1, [sp, #36]
33f90490:	e2855020 	add	r5, r5, #32	; 0x20
33f90494:	e28d0050 	add	r0, sp, #80	; 0x50
33f90498:	e59f329c 	ldr	r3, [pc, #668]	; 33f9073c <.text+0x1073c>
33f9049c:	e2400020 	sub	r0, r0, #32	; 0x20
33f904a0:	e19030b3 	ldrh	r3, [r0, r3]
33f904a4:	e59d2024 	ldr	r2, [sp, #36]
33f904a8:	e1520203 	cmp	r2, r3, lsl #4
33f904ac:	3affff99 	bcc	33f90318 <do_fat_read+0x4ac>
33f904b0:	e1a01006 	mov	r1, r6
33f904b4:	ebfffc7f 	bl	33f8f6b8 <get_fatent>
33f904b8:	e3500001 	cmp	r0, #1	; 0x1
33f904bc:	e1a06000 	mov	r6, r0
33f904c0:	9a000005 	bls	33f904dc <do_fat_read+0x670>
33f904c4:	e59d3c30 	ldr	r3, [sp, #3120]
33f904c8:	e3530020 	cmp	r3, #32	; 0x20
33f904cc:	e59f3270 	ldr	r3, [pc, #624]	; 33f90744 <.text+0x10744>
33f904d0:	03e032ff 	mvneq	r3, #-268435441	; 0xf000000f
33f904d4:	e1500003 	cmp	r0, r3
33f904d8:	3affff81 	bcc	33f902e4 <do_fat_read+0x478>
33f904dc:	e59f0264 	ldr	r0, [pc, #612]	; 33f90748 <.text+0x10748>
33f904e0:	ebffddde 	bl	33f87c60 <printf>
33f904e4:	e59dc018 	ldr	ip, [sp, #24]
33f904e8:	e2573000 	subs	r3, r7, #0	; 0x0
33f904ec:	13a03001 	movne	r3, #1	; 0x1
33f904f0:	e35c0000 	cmp	ip, #0	; 0x0
33f904f4:	13a03000 	movne	r3, #0	; 0x0
33f904f8:	e3530000 	cmp	r3, #0	; 0x0
33f904fc:	13a00000 	movne	r0, #0	; 0x0
33f90500:	1a000080 	bne	33f90708 <do_fat_read+0x89c>
33f90504:	ea00007e 	b	33f90704 <do_fat_read+0x898>
33f90508:	e28d0c15 	add	r0, sp, #5376	; 0x1500
33f9050c:	e5d0308f 	ldrb	r3, [r0, #143]
33f90510:	e3130010 	tst	r3, #16	; 0x10
33f90514:	0a00007a 	beq	33f90704 <do_fat_read+0x898>
33f90518:	e58db010 	str	fp, [sp, #16]
33f9051c:	e28d5d56 	add	r5, sp, #5504	; 0x1580
33f90520:	e2855004 	add	r5, r5, #4	; 0x4
33f90524:	ea000001 	b	33f90530 <do_fat_read+0x6c4>
33f90528:	e3a01001 	mov	r1, #1	; 0x1
33f9052c:	e58d101c 	str	r1, [sp, #28]
33f90530:	e59d2018 	ldr	r2, [sp, #24]
33f90534:	e3520000 	cmp	r2, #0	; 0x0
33f90538:	1affff35 	bne	33f90214 <do_fat_read+0x3a8>
33f9053c:	e28d3d31 	add	r3, sp, #3136	; 0xc40
33f90540:	e15320b6 	ldrh	r2, [r3, #-6]
33f90544:	e59d3c30 	ldr	r3, [sp, #3120]
33f90548:	e3530020 	cmp	r3, #32	; 0x20
33f9054c:	01d531b4 	ldreqh	r3, [r5, #20]
33f90550:	e1a09482 	mov	r9, r2, lsl #9
33f90554:	01a00803 	moveq	r0, r3, lsl #16
33f90558:	e595201c 	ldr	r2, [r5, #28]
33f9055c:	e59d3004 	ldr	r3, [sp, #4]
33f90560:	e1d511ba 	ldrh	r1, [r5, #26]
33f90564:	159d0018 	ldrne	r0, [sp, #24]
33f90568:	e59da008 	ldr	sl, [sp, #8]
33f9056c:	e0816000 	add	r6, r1, r0
33f90570:	e3530000 	cmp	r3, #0	; 0x0
33f90574:	11520003 	cmpne	r2, r3
33f90578:	91a03002 	movls	r3, r2
33f9057c:	e1a07006 	mov	r7, r6
33f90580:	e1a04009 	mov	r4, r9
33f90584:	e3a0b000 	mov	fp, #0	; 0x0
33f90588:	e58d3004 	str	r3, [sp, #4]
33f9058c:	ea000012 	b	33f905dc <do_fat_read+0x770>
33f90590:	ebfffc48 	bl	33f8f6b8 <get_fatent>
33f90594:	e1a0e000 	mov	lr, r0
33f90598:	e24ec001 	sub	ip, lr, #1	; 0x1
33f9059c:	e15c0006 	cmp	ip, r6
33f905a0:	e1a01007 	mov	r1, r7
33f905a4:	e1a0200a 	mov	r2, sl
33f905a8:	e1a03004 	mov	r3, r4
33f905ac:	e1a00005 	mov	r0, r5
33f905b0:	1a000023 	bne	33f90644 <do_fat_read+0x7d8>
33f905b4:	e35e0001 	cmp	lr, #1	; 0x1
33f905b8:	e0844009 	add	r4, r4, r9
33f905bc:	9a000038 	bls	33f906a4 <do_fat_read+0x838>
33f905c0:	e59d3c30 	ldr	r3, [sp, #3120]
33f905c4:	e3530020 	cmp	r3, #32	; 0x20
33f905c8:	e59f3174 	ldr	r3, [pc, #372]	; 33f90744 <.text+0x10744>
33f905cc:	03e032ff 	mvneq	r3, #-268435441	; 0xf000000f
33f905d0:	e15e0003 	cmp	lr, r3
33f905d4:	2a000032 	bcs	33f906a4 <do_fat_read+0x838>
33f905d8:	e1a0600e 	mov	r6, lr
33f905dc:	e59dc004 	ldr	ip, [sp, #4]
33f905e0:	e28d5050 	add	r5, sp, #80	; 0x50
33f905e4:	e2455020 	sub	r5, r5, #32	; 0x20
33f905e8:	e154000c 	cmp	r4, ip
33f905ec:	e1a01006 	mov	r1, r6
33f905f0:	e1a00005 	mov	r0, r5
33f905f4:	3affffe5 	bcc	33f90590 <do_fat_read+0x724>
33f905f8:	e0694004 	rsb	r4, r9, r4
33f905fc:	e1a01007 	mov	r1, r7
33f90600:	e1a0200a 	mov	r2, sl
33f90604:	e1a03004 	mov	r3, r4
33f90608:	ebfffd56 	bl	33f8fb68 <get_cluster>
33f9060c:	e3500000 	cmp	r0, #0	; 0x0
33f90610:	1a000039 	bne	33f906fc <do_fat_read+0x890>
33f90614:	e59d0004 	ldr	r0, [sp, #4]
33f90618:	e0647000 	rsb	r7, r4, r0
33f9061c:	e1a03007 	mov	r3, r7
33f90620:	e1a00005 	mov	r0, r5
33f90624:	e1a01006 	mov	r1, r6
33f90628:	e08a2004 	add	r2, sl, r4
33f9062c:	ebfffd4d 	bl	33f8fb68 <get_cluster>
33f90630:	e3500000 	cmp	r0, #0	; 0x0
33f90634:	008b3004 	addeq	r3, fp, r4
33f90638:	00830007 	addeq	r0, r3, r7
33f9063c:	0a000031 	beq	33f90708 <do_fat_read+0x89c>
33f90640:	ea00002d 	b	33f906fc <do_fat_read+0x890>
33f90644:	ebfffd47 	bl	33f8fb68 <get_cluster>
33f90648:	e59d2004 	ldr	r2, [sp, #4]
33f9064c:	e3500000 	cmp	r0, #0	; 0x0
33f90650:	e0642002 	rsb	r2, r4, r2
33f90654:	e1a01006 	mov	r1, r6
33f90658:	e1a00005 	mov	r0, r5
33f9065c:	e08aa004 	add	sl, sl, r4
33f90660:	e58d2004 	str	r2, [sp, #4]
33f90664:	1a000024 	bne	33f906fc <do_fat_read+0x890>
33f90668:	ebfffc12 	bl	33f8f6b8 <get_fatent>
33f9066c:	e3500001 	cmp	r0, #1	; 0x1
33f90670:	e08bb004 	add	fp, fp, r4
33f90674:	e1a07000 	mov	r7, r0
33f90678:	e1a0e000 	mov	lr, r0
33f9067c:	e1a04009 	mov	r4, r9
33f90680:	9a000005 	bls	33f9069c <do_fat_read+0x830>
33f90684:	e59d3c30 	ldr	r3, [sp, #3120]
33f90688:	e3530020 	cmp	r3, #32	; 0x20
33f9068c:	e59f30b0 	ldr	r3, [pc, #176]	; 33f90744 <.text+0x10744>
33f90690:	03e032ff 	mvneq	r3, #-268435441	; 0xf000000f
33f90694:	e1500003 	cmp	r0, r3
33f90698:	3affffce 	bcc	33f905d8 <do_fat_read+0x76c>
33f9069c:	e59f00a4 	ldr	r0, [pc, #164]	; 33f90748 <.text+0x10748>
33f906a0:	ebffdd6e 	bl	33f87c60 <printf>
33f906a4:	e1a0000b 	mov	r0, fp
33f906a8:	ea000016 	b	33f90708 <do_fat_read+0x89c>
33f906ac:	e28d4d57 	add	r4, sp, #5568	; 0x15c0
33f906b0:	e2844002 	add	r4, r4, #2	; 0x2
33f906b4:	e1a00005 	mov	r0, r5
33f906b8:	e1a01004 	mov	r1, r4
33f906bc:	ebfffdba 	bl	33f8fdac <get_name>
33f906c0:	e5d5300b 	ldrb	r3, [r5, #11]
33f906c4:	e3130010 	tst	r3, #16	; 0x10
33f906c8:	1afffea6 	bne	33f90168 <do_fat_read+0x2fc>
33f906cc:	eafffeaf 	b	33f90190 <do_fat_read+0x324>
33f906d0:	e28d4d57 	add	r4, sp, #5568	; 0x15c0
33f906d4:	e2844002 	add	r4, r4, #2	; 0x2
33f906d8:	e1a00005 	mov	r0, r5
33f906dc:	e1a01004 	mov	r1, r4
33f906e0:	ebfffdb1 	bl	33f8fdac <get_name>
33f906e4:	e5d5300b 	ldrb	r3, [r5, #11]
33f906e8:	e3130010 	tst	r3, #16	; 0x10
33f906ec:	028dcc15 	addeq	ip, sp, #5376	; 0x1500
33f906f0:	05dc30c2 	ldreqb	r3, [ip, #194]
33f906f4:	0affff4a 	beq	33f90424 <do_fat_read+0x5b8>
33f906f8:	eaffff41 	b	33f90404 <do_fat_read+0x598>
33f906fc:	e59f0048 	ldr	r0, [pc, #72]	; 33f9074c <.text+0x1074c>
33f90700:	ebffdd56 	bl	33f87c60 <printf>
33f90704:	e3e00000 	mvn	r0, #0	; 0x0
33f90708:	e28dde5d 	add	sp, sp, #1488	; 0x5d0
33f9070c:	e28dda01 	add	sp, sp, #4096	; 0x1000
33f90710:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f90714:	00000c04 	andeq	r0, r0, r4, lsl #24
33f90718:	00000c08 	andeq	r0, r0, r8, lsl #24
33f9071c:	00000c06 	andeq	r0, r0, r6, lsl #24
33f90720:	00000c0c 	andeq	r0, r0, ip, lsl #24
33f90724:	33f938b4 	mvnccs	r3, #11796480	; 0xb40000
33f90728:	0000ffff 	streqd	pc, [r0], -pc
33f9072c:	33fb7eb4 	mvnccs	r7, #2880	; 0xb40
33f90730:	33f9529c 	mvnccs	r5, #-1073741815	; 0xc0000009
33f90734:	33f952ac 	mvnccs	r5, #-1073741814	; 0xc000000a
33f90738:	33f95288 	mvnccs	r5, #-2147483640	; 0x80000008
33f9073c:	00000c0a 	andeq	r0, r0, sl, lsl #24
33f90740:	33fa7eb4 	mvnccs	r7, #2880	; 0xb40
33f90744:	0000fff0 	streqd	pc, [r0], -r0
33f90748:	33f95398 	mvnccs	r5, #1610612738	; 0x60000002
33f9074c:	33f952c8 	mvnccs	r5, #-2147483636	; 0x8000000c

33f90750 <file_fat_read>:
33f90750:	e92d4070 	stmdb	sp!, {r4, r5, r6, lr}
33f90754:	e1a04000 	mov	r4, r0
33f90758:	e1a05001 	mov	r5, r1
33f9075c:	e59f0020 	ldr	r0, [pc, #32]	; 33f90784 <.text+0x10784>
33f90760:	e1a01004 	mov	r1, r4
33f90764:	e1a06002 	mov	r6, r2
33f90768:	ebffdd3c 	bl	33f87c60 <printf>
33f9076c:	e1a00004 	mov	r0, r4
33f90770:	e1a01005 	mov	r1, r5
33f90774:	e1a02006 	mov	r2, r6
33f90778:	e3a03000 	mov	r3, #0	; 0x0
33f9077c:	e8bd4070 	ldmia	sp!, {r4, r5, r6, lr}
33f90780:	eafffdb9 	b	33f8fe6c <do_fat_read>
33f90784:	33f953ac 	mvnccs	r5, #-1342177278	; 0xb0000002

33f90788 <file_fat_ls>:
33f90788:	e3a01000 	mov	r1, #0	; 0x0
33f9078c:	e1a02001 	mov	r2, r1
33f90790:	e3a03001 	mov	r3, #1	; 0x1
33f90794:	eafffdb4 	b	33f8fe6c <do_fat_read>

33f90798 <fat_register_device>:
33f90798:	e92d40f0 	stmdb	sp!, {r4, r5, r6, r7, lr}
33f9079c:	e590c060 	ldr	ip, [r0, #96]
33f907a0:	e35c0000 	cmp	ip, #0	; 0x0
33f907a4:	e24ddf93 	sub	sp, sp, #588	; 0x24c
33f907a8:	e1a04000 	mov	r4, r0
33f907ac:	e1a05001 	mov	r5, r1
33f907b0:	0a000032 	beq	33f90880 <fat_register_device+0xe8>
33f907b4:	e59f30d4 	ldr	r3, [pc, #212]	; 33f90890 <.text+0x10890>
33f907b8:	e5830000 	str	r0, [r3]
33f907bc:	e3a01000 	mov	r1, #0	; 0x0
33f907c0:	e5900004 	ldr	r0, [r0, #4]
33f907c4:	e3a02001 	mov	r2, #1	; 0x1
33f907c8:	e1a0300d 	mov	r3, sp
33f907cc:	e1a0e00f 	mov	lr, pc
33f907d0:	e1a0f00c 	mov	pc, ip
33f907d4:	e3500001 	cmp	r0, #1	; 0x1
33f907d8:	e1a0700d 	mov	r7, sp
33f907dc:	e1a06000 	mov	r6, r0
33f907e0:	0a000003 	beq	33f907f4 <fat_register_device+0x5c>
33f907e4:	e5941004 	ldr	r1, [r4, #4]
33f907e8:	e59f00a4 	ldr	r0, [pc, #164]	; 33f90894 <.text+0x10894>
33f907ec:	ebffdd1b 	bl	33f87c60 <printf>
33f907f0:	ea000022 	b	33f90880 <fat_register_device+0xe8>
33f907f4:	e5dd31fe 	ldrb	r3, [sp, #510]
33f907f8:	e3530055 	cmp	r3, #85	; 0x55
33f907fc:	1a00001f 	bne	33f90880 <fat_register_device+0xe8>
33f90800:	e5dd31ff 	ldrb	r3, [sp, #511]
33f90804:	e35300aa 	cmp	r3, #170	; 0xaa
33f90808:	1a00001c 	bne	33f90880 <fat_register_device+0xe8>
33f9080c:	e1a00004 	mov	r0, r4
33f90810:	e1a01005 	mov	r1, r5
33f90814:	e28d2c02 	add	r2, sp, #512	; 0x200
33f90818:	eb0000ba 	bl	33f90b08 <get_partition_info>
33f9081c:	e3500000 	cmp	r0, #0	; 0x0
33f90820:	1a000006 	bne	33f90840 <fat_register_device+0xa8>
33f90824:	e59d3200 	ldr	r3, [sp, #512]
33f90828:	e59f2068 	ldr	r2, [pc, #104]	; 33f90898 <.text+0x10898>
33f9082c:	e5823000 	str	r3, [r2]
33f90830:	e59f3064 	ldr	r3, [pc, #100]	; 33f9089c <.text+0x1089c>
33f90834:	e1a01000 	mov	r1, r0
33f90838:	e5835000 	str	r5, [r3]
33f9083c:	ea000010 	b	33f90884 <fat_register_device+0xec>
33f90840:	e28d0036 	add	r0, sp, #54	; 0x36
33f90844:	e59f1054 	ldr	r1, [pc, #84]	; 33f908a0 <.text+0x108a0>
33f90848:	e3a02003 	mov	r2, #3	; 0x3
33f9084c:	ebffe7ea 	bl	33f8a7fc <strncmp>
33f90850:	e3500000 	cmp	r0, #0	; 0x0
33f90854:	1a000005 	bne	33f90870 <fat_register_device+0xd8>
33f90858:	e59f303c 	ldr	r3, [pc, #60]	; 33f9089c <.text+0x1089c>
33f9085c:	e5836000 	str	r6, [r3]
33f90860:	e59f3030 	ldr	r3, [pc, #48]	; 33f90898 <.text+0x10898>
33f90864:	e1a01000 	mov	r1, r0
33f90868:	e5830000 	str	r0, [r3]
33f9086c:	ea000004 	b	33f90884 <fat_register_device+0xec>
33f90870:	e1a01005 	mov	r1, r5
33f90874:	e5942004 	ldr	r2, [r4, #4]
33f90878:	e59f0024 	ldr	r0, [pc, #36]	; 33f908a4 <.text+0x108a4>
33f9087c:	ebffdcf7 	bl	33f87c60 <printf>
33f90880:	e3e01000 	mvn	r1, #0	; 0x0
33f90884:	e1a00001 	mov	r0, r1
33f90888:	e28ddf93 	add	sp, sp, #588	; 0x24c
33f9088c:	e8bd80f0 	ldmia	sp!, {r4, r5, r6, r7, pc}
33f90890:	33fc7eb4 	mvnccs	r7, #2880	; 0xb40
33f90894:	33f953b8 	mvnccs	r5, #-536870910	; 0xe0000002
33f90898:	33fc7eb8 	mvnccs	r7, #2944	; 0xb80
33f9089c:	33f95edc 	mvnccs	r5, #3520	; 0xdc0
33f908a0:	33f953dc 	mvnccs	r5, #1879048195	; 0x70000003
33f908a4:	33f953e0 	mvnccs	r5, #-2147483645	; 0x80000003

33f908a8 <print_part>:
33f908a8:	e92d4010 	stmdb	sp!, {r4, lr}
33f908ac:	e1a04000 	mov	r4, r0
33f908b0:	e5d43008 	ldrb	r3, [r4, #8]
33f908b4:	e3530002 	cmp	r3, #2	; 0x2
33f908b8:	e59f0084 	ldr	r0, [pc, #132]	; 33f90944 <.text+0x10944>
33f908bc:	1a00001e 	bne	33f9093c <.text+0x1093c>
33f908c0:	e59f0080 	ldr	r0, [pc, #128]	; 33f90948 <.text+0x10948>
33f908c4:	ebffdcd2 	bl	33f87c14 <puts>
33f908c8:	e5943000 	ldr	r3, [r4]
33f908cc:	e2433001 	sub	r3, r3, #1	; 0x1
33f908d0:	e3530004 	cmp	r3, #4	; 0x4
33f908d4:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f908d8:	ea00000e 	b	33f90918 <.text+0x10918>
33f908dc:	33f908f0 	mvnccs	r0, #15728640	; 0xf00000
33f908e0:	33f908f8 	mvnccs	r0, #16252928	; 0xf80000
33f908e4:	33f90900 	mvnccs	r0, #0	; 0x0
33f908e8:	33f90908 	mvnccs	r0, #131072	; 0x20000
33f908ec:	33f90910 	mvnccs	r0, #262144	; 0x40000
33f908f0:	e59f0054 	ldr	r0, [pc, #84]	; 33f9094c <.text+0x1094c>
33f908f4:	ea000008 	b	33f9091c <.text+0x1091c>
33f908f8:	e59f0050 	ldr	r0, [pc, #80]	; 33f90950 <.text+0x10950>
33f908fc:	ea000006 	b	33f9091c <.text+0x1091c>
33f90900:	e59f004c 	ldr	r0, [pc, #76]	; 33f90954 <.text+0x10954>
33f90904:	ea000004 	b	33f9091c <.text+0x1091c>
33f90908:	e59f0048 	ldr	r0, [pc, #72]	; 33f90958 <.text+0x10958>
33f9090c:	ea000002 	b	33f9091c <.text+0x1091c>
33f90910:	e59f0044 	ldr	r0, [pc, #68]	; 33f9095c <.text+0x1095c>
33f90914:	ea000000 	b	33f9091c <.text+0x1091c>
33f90918:	e59f0040 	ldr	r0, [pc, #64]	; 33f90960 <.text+0x10960>
33f9091c:	ebffdcbc 	bl	33f87c14 <puts>
33f90920:	e59f003c 	ldr	r0, [pc, #60]	; 33f90964 <.text+0x10964>
33f90924:	e5941004 	ldr	r1, [r4, #4]
33f90928:	e59f2038 	ldr	r2, [pc, #56]	; 33f90968 <.text+0x10968>
33f9092c:	ebffdccb 	bl	33f87c60 <printf>
33f90930:	e1a00004 	mov	r0, r4
33f90934:	e8bd4010 	ldmia	sp!, {r4, lr}
33f90938:	ea0001b2 	b	33f91008 <print_part_dos>
33f9093c:	e8bd4010 	ldmia	sp!, {r4, lr}
33f90940:	eaffdcb3 	b	33f87c14 <puts>
33f90944:	33f95454 	mvnccs	r5, #1409286144	; 0x54000000
33f90948:	33f9540c 	mvnccs	r5, #201326592	; 0xc000000
33f9094c:	33f95328 	mvnccs	r5, #-1610612736	; 0xa0000000
33f90950:	33f9532c 	mvnccs	r5, #-1342177280	; 0xb0000000
33f90954:	33f95334 	mvnccs	r5, #-805306368	; 0xd0000000
33f90958:	33f9533c 	mvnccs	r5, #-268435456	; 0xf0000000
33f9095c:	33f95340 	mvnccs	r5, #1	; 0x1
33f90960:	33f95420 	mvnccs	r5, #536870912	; 0x20000000
33f90964:	33f95428 	mvnccs	r5, #671088640	; 0x28000000
33f90968:	33f95450 	mvnccs	r5, #1342177280	; 0x50000000

33f9096c <dev_print>:
33f9096c:	e92d46f0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f90970:	e5d0300b 	ldrb	r3, [r0, #11]
33f90974:	e35300ff 	cmp	r3, #255	; 0xff
33f90978:	e1a04000 	mov	r4, r0
33f9097c:	e24dd00c 	sub	sp, sp, #12	; 0xc
33f90980:	059f0148 	ldreq	r0, [pc, #328]	; 33f90ad0 <.text+0x10ad0>
33f90984:	0a00004e 	beq	33f90ac4 <.text+0x10ac4>
33f90988:	e5943000 	ldr	r3, [r4]
33f9098c:	e3530002 	cmp	r3, #2	; 0x2
33f90990:	059f013c 	ldreq	r0, [pc, #316]	; 33f90ad4 <.text+0x10ad4>
33f90994:	05d41009 	ldreqb	r1, [r4, #9]
33f90998:	05d4200a 	ldreqb	r2, [r4, #10]
33f9099c:	0bffdcaf 	bleq	33f87c60 <printf>
33f909a0:	e5943000 	ldr	r3, [r4]
33f909a4:	e2840056 	add	r0, r4, #86	; 0x56
33f909a8:	e3530001 	cmp	r3, #1	; 0x1
33f909ac:	e2843041 	add	r3, r4, #65	; 0x41
33f909b0:	01a02000 	moveq	r2, r0
33f909b4:	11a02003 	movne	r2, r3
33f909b8:	059f0118 	ldreq	r0, [pc, #280]	; 33f90ad8 <.text+0x10ad8>
33f909bc:	11a03000 	movne	r3, r0
33f909c0:	e2841018 	add	r1, r4, #24	; 0x18
33f909c4:	159f0110 	ldrne	r0, [pc, #272]	; 33f90adc <.text+0x10adc>
33f909c8:	ebffdca4 	bl	33f87c60 <printf>
33f909cc:	e59f010c 	ldr	r0, [pc, #268]	; 33f90ae0 <.text+0x10ae0>
33f909d0:	ebffdc8f 	bl	33f87c14 <puts>
33f909d4:	e5d4300c 	ldrb	r3, [r4, #12]
33f909d8:	e3530000 	cmp	r3, #0	; 0x0
33f909dc:	159f0100 	ldrne	r0, [pc, #256]	; 33f90ae4 <.text+0x10ae4>
33f909e0:	1bffdc8b 	blne	33f87c14 <puts>
33f909e4:	e5d4300b 	ldrb	r3, [r4, #11]
33f909e8:	e203101f 	and	r1, r3, #31	; 0x1f
33f909ec:	e3510007 	cmp	r1, #7	; 0x7
33f909f0:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
33f909f4:	ea000010 	b	33f90a3c <.text+0x10a3c>
33f909f8:	33f90a18 	mvnccs	r0, #98304	; 0x18000
33f909fc:	33f90a34 	mvnccs	r0, #212992	; 0x34000
33f90a00:	33f90a3c 	mvnccs	r0, #245760	; 0x3c000
33f90a04:	33f90a3c 	mvnccs	r0, #245760	; 0x3c000
33f90a08:	33f90a3c 	mvnccs	r0, #245760	; 0x3c000
33f90a0c:	33f90a20 	mvnccs	r0, #131072	; 0x20000
33f90a10:	33f90a3c 	mvnccs	r0, #245760	; 0x3c000
33f90a14:	33f90a2c 	mvnccs	r0, #180224	; 0x2c000
33f90a18:	e59f00c8 	ldr	r0, [pc, #200]	; 33f90ae8 <.text+0x10ae8>
33f90a1c:	ea000000 	b	33f90a24 <.text+0x10a24>
33f90a20:	e59f00c4 	ldr	r0, [pc, #196]	; 33f90aec <.text+0x10aec>
33f90a24:	ebffdc7a 	bl	33f87c14 <puts>
33f90a28:	ea000005 	b	33f90a44 <.text+0x10a44>
33f90a2c:	e59f00bc 	ldr	r0, [pc, #188]	; 33f90af0 <.text+0x10af0>
33f90a30:	eafffffb 	b	33f90a24 <.text+0x10a24>
33f90a34:	e59f00b8 	ldr	r0, [pc, #184]	; 33f90af4 <.text+0x10af4>
33f90a38:	eafffff9 	b	33f90a24 <.text+0x10a24>
33f90a3c:	e59f00b4 	ldr	r0, [pc, #180]	; 33f90af8 <.text+0x10af8>
33f90a40:	ebffdc86 	bl	33f87c60 <printf>
33f90a44:	e59f00b0 	ldr	r0, [pc, #176]	; 33f90afc <.text+0x10afc>
33f90a48:	ebffdc71 	bl	33f87c14 <puts>
33f90a4c:	e5949014 	ldr	r9, [r4, #20]
33f90a50:	e594a010 	ldr	sl, [r4, #16]
33f90a54:	e0130a99 	muls	r3, r9, sl
33f90a58:	059f00a0 	ldreq	r0, [pc, #160]	; 33f90b00 <.text+0x10b00>
33f90a5c:	0a000018 	beq	33f90ac4 <.text+0x10ac4>
33f90a60:	e3a0500a 	mov	r5, #10	; 0xa
33f90a64:	e002059a 	mul	r2, sl, r5
33f90a68:	e1a034a9 	mov	r3, r9, lsr #9
33f90a6c:	e0040392 	mul	r4, r2, r3
33f90a70:	e1a075a4 	mov	r7, r4, lsr #11
33f90a74:	e1a01005 	mov	r1, r5
33f90a78:	e1a00007 	mov	r0, r7
33f90a7c:	ebffc045 	bl	33f80b98 <__udivsi3>
33f90a80:	e1a04aa4 	mov	r4, r4, lsr #21
33f90a84:	e1a06000 	mov	r6, r0
33f90a88:	e1a01005 	mov	r1, r5
33f90a8c:	e1a00004 	mov	r0, r4
33f90a90:	ebffc040 	bl	33f80b98 <__udivsi3>
33f90a94:	e0020596 	mul	r2, r6, r5
33f90a98:	e0010590 	mul	r1, r0, r5
33f90a9c:	e1a03000 	mov	r3, r0
33f90aa0:	e0614004 	rsb	r4, r1, r4
33f90aa4:	e0622007 	rsb	r2, r2, r7
33f90aa8:	e1a01006 	mov	r1, r6
33f90aac:	e59f0050 	ldr	r0, [pc, #80]	; 33f90b04 <.text+0x10b04>
33f90ab0:	e88d0410 	stmia	sp, {r4, sl}
33f90ab4:	e58d9008 	str	r9, [sp, #8]
33f90ab8:	ebffdc68 	bl	33f87c60 <printf>
33f90abc:	e28dd00c 	add	sp, sp, #12	; 0xc
33f90ac0:	e8bd86f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, pc}
33f90ac4:	e28dd00c 	add	sp, sp, #12	; 0xc
33f90ac8:	e8bd46f0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, lr}
33f90acc:	eaffdc50 	b	33f87c14 <puts>
33f90ad0:	33f95470 	mvnccs	r5, #1879048192	; 0x70000000
33f90ad4:	33f95480 	mvnccs	r5, #-2147483648	; 0x80000000
33f90ad8:	33f9548c 	mvnccs	r5, #-1946157056	; 0x8c000000
33f90adc:	33f954ac 	mvnccs	r5, #-1409286144	; 0xac000000
33f90ae0:	33f954cc 	mvnccs	r5, #-872415232	; 0xcc000000
33f90ae4:	33f954e0 	mvnccs	r5, #-536870912	; 0xe0000000
33f90ae8:	33f954ec 	mvnccs	r5, #-335544320	; 0xec000000
33f90aec:	33f954f8 	mvnccs	r5, #-134217728	; 0xf8000000
33f90af0:	33f95500 	mvnccs	r5, #0	; 0x0
33f90af4:	33f95510 	mvnccs	r5, #67108864	; 0x4000000
33f90af8:	33f95518 	mvnccs	r5, #100663296	; 0x6000000
33f90afc:	33f9544c 	mvnccs	r5, #1275068416	; 0x4c000000
33f90b00:	33f95560 	mvnccs	r5, #402653184	; 0x18000000
33f90b04:	33f95524 	mvnccs	r5, #150994944	; 0x9000000

33f90b08 <get_partition_info>:
33f90b08:	e52de004 	str	lr, [sp, #-4]!
33f90b0c:	e5d03008 	ldrb	r3, [r0, #8]
33f90b10:	e3530002 	cmp	r3, #2	; 0x2
33f90b14:	1a000002 	bne	33f90b24 <get_partition_info+0x1c>
33f90b18:	eb0000b7 	bl	33f90dfc <get_partition_info_dos>
33f90b1c:	e3500000 	cmp	r0, #0	; 0x0
33f90b20:	049df004 	ldreq	pc, [sp], #4
33f90b24:	e3e00000 	mvn	r0, #0	; 0x0
33f90b28:	e49df004 	ldr	pc, [sp], #4

33f90b2c <init_part>:
33f90b2c:	e92d4010 	stmdb	sp!, {r4, lr}
33f90b30:	e1a04000 	mov	r4, r0
33f90b34:	eb000016 	bl	33f90b94 <test_part_dos>
33f90b38:	e3500000 	cmp	r0, #0	; 0x0
33f90b3c:	03a03002 	moveq	r3, #2	; 0x2
33f90b40:	05c43008 	streqb	r3, [r4, #8]
33f90b44:	e8bd8010 	ldmia	sp!, {r4, pc}

33f90b48 <le32_to_int>:
33f90b48:	e1a03000 	mov	r3, r0
33f90b4c:	e5d00002 	ldrb	r0, [r0, #2]
33f90b50:	e5d32003 	ldrb	r2, [r3, #3]
33f90b54:	e5d31000 	ldrb	r1, [r3]
33f90b58:	e1a00800 	mov	r0, r0, lsl #16
33f90b5c:	e0800c02 	add	r0, r0, r2, lsl #24
33f90b60:	e5d33001 	ldrb	r3, [r3, #1]
33f90b64:	e0800001 	add	r0, r0, r1
33f90b68:	e0800403 	add	r0, r0, r3, lsl #8
33f90b6c:	e1a0f00e 	mov	pc, lr

33f90b70 <is_extended>:
33f90b70:	e350000f 	cmp	r0, #15	; 0xf
33f90b74:	13500005 	cmpne	r0, #5	; 0x5
33f90b78:	e3a03001 	mov	r3, #1	; 0x1
33f90b7c:	0a000002 	beq	33f90b8c <is_extended+0x1c>
33f90b80:	e3500085 	cmp	r0, #133	; 0x85
33f90b84:	13a03000 	movne	r3, #0	; 0x0
33f90b88:	03a03001 	moveq	r3, #1	; 0x1
33f90b8c:	e1a00003 	mov	r0, r3
33f90b90:	e1a0f00e 	mov	pc, lr

33f90b94 <test_part_dos>:
33f90b94:	e52de004 	str	lr, [sp, #-4]!
33f90b98:	e24ddc02 	sub	sp, sp, #512	; 0x200
33f90b9c:	e1a0c000 	mov	ip, r0
33f90ba0:	e3a01000 	mov	r1, #0	; 0x0
33f90ba4:	e5900004 	ldr	r0, [r0, #4]
33f90ba8:	e3a02001 	mov	r2, #1	; 0x1
33f90bac:	e1a0300d 	mov	r3, sp
33f90bb0:	e1a0e00f 	mov	lr, pc
33f90bb4:	e59cf060 	ldr	pc, [ip, #96]
33f90bb8:	e3500001 	cmp	r0, #1	; 0x1
33f90bbc:	1a000006 	bne	33f90bdc <test_part_dos+0x48>
33f90bc0:	e5dd31fe 	ldrb	r3, [sp, #510]
33f90bc4:	e3530055 	cmp	r3, #85	; 0x55
33f90bc8:	1a000003 	bne	33f90bdc <test_part_dos+0x48>
33f90bcc:	e5dd31ff 	ldrb	r3, [sp, #511]
33f90bd0:	e35300aa 	cmp	r3, #170	; 0xaa
33f90bd4:	e3a00000 	mov	r0, #0	; 0x0
33f90bd8:	0a000000 	beq	33f90be0 <test_part_dos+0x4c>
33f90bdc:	e3e00000 	mvn	r0, #0	; 0x0
33f90be0:	e28ddc02 	add	sp, sp, #512	; 0x200
33f90be4:	e8bd8000 	ldmia	sp!, {pc}

33f90be8 <get_partition_info_extended>:
33f90be8:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f90bec:	e24ddf83 	sub	sp, sp, #524	; 0x20c
33f90bf0:	e58d2008 	str	r2, [sp, #8]
33f90bf4:	e1a0a000 	mov	sl, r0
33f90bf8:	e1a05003 	mov	r5, r3
33f90bfc:	e5900004 	ldr	r0, [r0, #4]
33f90c00:	e3a02001 	mov	r2, #1	; 0x1
33f90c04:	e28d300c 	add	r3, sp, #12	; 0xc
33f90c08:	e1a09001 	mov	r9, r1
33f90c0c:	e59db230 	ldr	fp, [sp, #560]
33f90c10:	e1a0e00f 	mov	lr, pc
33f90c14:	e59af060 	ldr	pc, [sl, #96]
33f90c18:	e3500001 	cmp	r0, #1	; 0x1
33f90c1c:	159a1004 	ldrne	r1, [sl, #4]
33f90c20:	159f01b4 	ldrne	r0, [pc, #436]	; 33f90ddc <.text+0x10ddc>
33f90c24:	11a02009 	movne	r2, r9
33f90c28:	1a000007 	bne	33f90c4c <get_partition_info_extended+0x64>
33f90c2c:	e5dd120a 	ldrb	r1, [sp, #522]
33f90c30:	e3510055 	cmp	r1, #85	; 0x55
33f90c34:	1a000002 	bne	33f90c44 <get_partition_info_extended+0x5c>
33f90c38:	e5dd320b 	ldrb	r3, [sp, #523]
33f90c3c:	e35300aa 	cmp	r3, #170	; 0xaa
33f90c40:	0a000003 	beq	33f90c54 <get_partition_info_extended+0x6c>
33f90c44:	e59f0194 	ldr	r0, [pc, #404]	; 33f90de0 <.text+0x10de0>
33f90c48:	e5dd220b 	ldrb	r2, [sp, #523]
33f90c4c:	ebffdc03 	bl	33f87c60 <printf>
33f90c50:	ea00005e 	b	33f90dd0 <.text+0x10dd0>
33f90c54:	e28d7f72 	add	r7, sp, #456	; 0x1c8
33f90c58:	e2877002 	add	r7, r7, #2	; 0x2
33f90c5c:	e1a06007 	mov	r6, r7
33f90c60:	e5d64004 	ldrb	r4, [r6, #4]
33f90c64:	e59d222c 	ldr	r2, [sp, #556]
33f90c68:	e2543000 	subs	r3, r4, #0	; 0x0
33f90c6c:	13a03001 	movne	r3, #1	; 0x1
33f90c70:	e1550002 	cmp	r5, r2
33f90c74:	13a03000 	movne	r3, #0	; 0x0
33f90c78:	e3530000 	cmp	r3, #0	; 0x0
33f90c7c:	e1a00004 	mov	r0, r4
33f90c80:	0a000030 	beq	33f90d48 <.text+0x10d48>
33f90c84:	ebffffb9 	bl	33f90b70 <is_extended>
33f90c88:	e3500000 	cmp	r0, #0	; 0x0
33f90c8c:	1a00002d 	bne	33f90d48 <.text+0x10d48>
33f90c90:	e3a03c02 	mov	r3, #512	; 0x200
33f90c94:	e58b3008 	str	r3, [fp, #8]
33f90c98:	e2860008 	add	r0, r6, #8	; 0x8
33f90c9c:	ebffffa9 	bl	33f90b48 <le32_to_int>
33f90ca0:	e0890000 	add	r0, r9, r0
33f90ca4:	e58b0000 	str	r0, [fp]
33f90ca8:	e286000c 	add	r0, r6, #12	; 0xc
33f90cac:	ebffffa5 	bl	33f90b48 <le32_to_int>
33f90cb0:	e58b0004 	str	r0, [fp, #4]
33f90cb4:	e59a3000 	ldr	r3, [sl]
33f90cb8:	e2433001 	sub	r3, r3, #1	; 0x1
33f90cbc:	e59a2004 	ldr	r2, [sl, #4]
33f90cc0:	e28b000c 	add	r0, fp, #12	; 0xc
33f90cc4:	e3530004 	cmp	r3, #4	; 0x4
33f90cc8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
33f90ccc:	ea000014 	b	33f90d24 <.text+0x10d24>
33f90cd0:	33f90ce4 	mvnccs	r0, #58368	; 0xe400
33f90cd4:	33f90cf4 	mvnccs	r0, #62464	; 0xf400
33f90cd8:	33f90ce4 	mvnccs	r0, #58368	; 0xe400
33f90cdc:	33f90d04 	mvnccs	r0, #256	; 0x100
33f90ce0:	33f90d14 	mvnccs	r0, #1280	; 0x500
33f90ce4:	e59f10f8 	ldr	r1, [pc, #248]	; 33f90de4 <.text+0x10de4>
33f90ce8:	e2822061 	add	r2, r2, #97	; 0x61
33f90cec:	e1a03005 	mov	r3, r5
33f90cf0:	ea00000e 	b	33f90d30 <.text+0x10d30>
33f90cf4:	e59f10ec 	ldr	r1, [pc, #236]	; 33f90de8 <.text+0x10de8>
33f90cf8:	e2822061 	add	r2, r2, #97	; 0x61
33f90cfc:	e1a03005 	mov	r3, r5
33f90d00:	ea00000a 	b	33f90d30 <.text+0x10d30>
33f90d04:	e59f10e0 	ldr	r1, [pc, #224]	; 33f90dec <.text+0x10dec>
33f90d08:	e2822061 	add	r2, r2, #97	; 0x61
33f90d0c:	e1a03005 	mov	r3, r5
33f90d10:	ea000006 	b	33f90d30 <.text+0x10d30>
33f90d14:	e59f10d4 	ldr	r1, [pc, #212]	; 33f90df0 <.text+0x10df0>
33f90d18:	e2822061 	add	r2, r2, #97	; 0x61
33f90d1c:	e1a03005 	mov	r3, r5
33f90d20:	ea000002 	b	33f90d30 <.text+0x10d30>
33f90d24:	e59f10c8 	ldr	r1, [pc, #200]	; 33f90df4 <.text+0x10df4>
33f90d28:	e2822061 	add	r2, r2, #97	; 0x61
33f90d2c:	e1a03005 	mov	r3, r5
33f90d30:	ebffe9ae 	bl	33f8b3f0 <sprintf>
33f90d34:	e28b002c 	add	r0, fp, #44	; 0x2c
33f90d38:	e59f10b8 	ldr	r1, [pc, #184]	; 33f90df8 <.text+0x10df8>
33f90d3c:	ebffe9ab 	bl	33f8b3f0 <sprintf>
33f90d40:	e3a00000 	mov	r0, #0	; 0x0
33f90d44:	ea000022 	b	33f90dd4 <.text+0x10dd4>
33f90d48:	e3590000 	cmp	r9, #0	; 0x0
33f90d4c:	0a000004 	beq	33f90d64 <.text+0x10d64>
33f90d50:	e2540000 	subs	r0, r4, #0	; 0x0
33f90d54:	0a000003 	beq	33f90d68 <.text+0x10d68>
33f90d58:	ebffff84 	bl	33f90b70 <is_extended>
33f90d5c:	e3500000 	cmp	r0, #0	; 0x0
33f90d60:	1a000000 	bne	33f90d68 <.text+0x10d68>
33f90d64:	e2855001 	add	r5, r5, #1	; 0x1
33f90d68:	e28d3f7e 	add	r3, sp, #504	; 0x1f8
33f90d6c:	e2833002 	add	r3, r3, #2	; 0x2
33f90d70:	e1560003 	cmp	r6, r3
33f90d74:	12866010 	addne	r6, r6, #16	; 0x10
33f90d78:	1affffb8 	bne	33f90c60 <get_partition_info_extended+0x78>
33f90d7c:	e5d70004 	ldrb	r0, [r7, #4]
33f90d80:	ebffff7a 	bl	33f90b70 <is_extended>
33f90d84:	e3500000 	cmp	r0, #0	; 0x0
33f90d88:	0a00000d 	beq	33f90dc4 <.text+0x10dc4>
33f90d8c:	e2870008 	add	r0, r7, #8	; 0x8
33f90d90:	ebffff6c 	bl	33f90b48 <le32_to_int>
33f90d94:	e59d3008 	ldr	r3, [sp, #8]
33f90d98:	e3590000 	cmp	r9, #0	; 0x0
33f90d9c:	e0801003 	add	r1, r0, r3
33f90da0:	e59dc22c 	ldr	ip, [sp, #556]
33f90da4:	e1a02003 	mov	r2, r3
33f90da8:	e1a0000a 	mov	r0, sl
33f90dac:	01a02001 	moveq	r2, r1
33f90db0:	e1a03005 	mov	r3, r5
33f90db4:	e58dc000 	str	ip, [sp]
33f90db8:	e58db004 	str	fp, [sp, #4]
33f90dbc:	ebffff89 	bl	33f90be8 <get_partition_info_extended>
33f90dc0:	ea000003 	b	33f90dd4 <.text+0x10dd4>
33f90dc4:	e1570006 	cmp	r7, r6
33f90dc8:	e2877010 	add	r7, r7, #16	; 0x10
33f90dcc:	1affffea 	bne	33f90d7c <.text+0x10d7c>
33f90dd0:	e3e00000 	mvn	r0, #0	; 0x0
33f90dd4:	e28ddf83 	add	sp, sp, #524	; 0x20c
33f90dd8:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f90ddc:	33f955c0 	mvnccs	r5, #805306368	; 0x30000000
33f90de0:	33f955ec 	mvnccs	r5, #989855744	; 0x3b000000
33f90de4:	33f95614 	mvnccs	r5, #20971520	; 0x1400000
33f90de8:	33f9561c 	mvnccs	r5, #29360128	; 0x1c00000
33f90dec:	33f95624 	mvnccs	r5, #37748736	; 0x2400000
33f90df0:	33f95630 	mvnccs	r5, #50331648	; 0x3000000
33f90df4:	33f9563c 	mvnccs	r5, #62914560	; 0x3c00000
33f90df8:	33f92a94 	mvnccs	r2, #606208	; 0x94000

33f90dfc <get_partition_info_dos>:
33f90dfc:	e52de004 	str	lr, [sp, #-4]!
33f90e00:	e24dd008 	sub	sp, sp, #8	; 0x8
33f90e04:	e58d1000 	str	r1, [sp]
33f90e08:	e3a01000 	mov	r1, #0	; 0x0
33f90e0c:	e58d2004 	str	r2, [sp, #4]
33f90e10:	e3a03001 	mov	r3, #1	; 0x1
33f90e14:	e1a02001 	mov	r2, r1
33f90e18:	ebffff72 	bl	33f90be8 <get_partition_info_extended>
33f90e1c:	e28dd008 	add	sp, sp, #8	; 0x8
33f90e20:	e8bd8000 	ldmia	sp!, {pc}

33f90e24 <print_partition_extended>:
33f90e24:	e92d4ef0 	stmdb	sp!, {r4, r5, r6, r7, r9, sl, fp, lr}
33f90e28:	e24dde21 	sub	sp, sp, #528	; 0x210
33f90e2c:	e58d200c 	str	r2, [sp, #12]
33f90e30:	e58d3008 	str	r3, [sp, #8]
33f90e34:	e28d4010 	add	r4, sp, #16	; 0x10
33f90e38:	e1a0b000 	mov	fp, r0
33f90e3c:	e3a02001 	mov	r2, #1	; 0x1
33f90e40:	e5900004 	ldr	r0, [r0, #4]
33f90e44:	e1a03004 	mov	r3, r4
33f90e48:	e1a09001 	mov	r9, r1
33f90e4c:	e1a0e00f 	mov	lr, pc
33f90e50:	e59bf060 	ldr	pc, [fp, #96]
33f90e54:	e3500001 	cmp	r0, #1	; 0x1
33f90e58:	159b1004 	ldrne	r1, [fp, #4]
33f90e5c:	159f0188 	ldrne	r0, [pc, #392]	; 33f90fec <.text+0x10fec>
33f90e60:	11a02009 	movne	r2, r9
33f90e64:	1a00005d 	bne	33f90fe0 <print_partition_extended+0x1bc>
33f90e68:	e5dd320e 	ldrb	r3, [sp, #526]
33f90e6c:	e3530055 	cmp	r3, #85	; 0x55
33f90e70:	1a00000c 	bne	33f90ea8 <print_partition_extended+0x84>
33f90e74:	e5dd320f 	ldrb	r3, [sp, #527]
33f90e78:	e35300aa 	cmp	r3, #170	; 0xaa
33f90e7c:	1a000009 	bne	33f90ea8 <print_partition_extended+0x84>
33f90e80:	e2840036 	add	r0, r4, #54	; 0x36
33f90e84:	e59f1164 	ldr	r1, [pc, #356]	; 33f90ff0 <.text+0x10ff0>
33f90e88:	e3a02003 	mov	r2, #3	; 0x3
33f90e8c:	ebffe65a 	bl	33f8a7fc <strncmp>
33f90e90:	e3500000 	cmp	r0, #0	; 0x0
33f90e94:	128d4f73 	addne	r4, sp, #460	; 0x1cc
33f90e98:	12844002 	addne	r4, r4, #2	; 0x2
33f90e9c:	11a0a004 	movne	sl, r4
33f90ea0:	1a000005 	bne	33f90ebc <print_partition_extended+0x98>
33f90ea4:	ea00004a 	b	33f90fd4 <print_partition_extended+0x1b0>
33f90ea8:	e59f0144 	ldr	r0, [pc, #324]	; 33f90ff4 <.text+0x10ff4>
33f90eac:	e5dd120e 	ldrb	r1, [sp, #526]
33f90eb0:	e5dd220f 	ldrb	r2, [sp, #527]
33f90eb4:	ea000049 	b	33f90fe0 <print_partition_extended+0x1bc>
33f90eb8:	e2844010 	add	r4, r4, #16	; 0x10
33f90ebc:	e5d45004 	ldrb	r5, [r4, #4]
33f90ec0:	e3550000 	cmp	r5, #0	; 0x0
33f90ec4:	0a000019 	beq	33f90f30 <print_partition_extended+0x10c>
33f90ec8:	e3590000 	cmp	r9, #0	; 0x0
33f90ecc:	0a000004 	beq	33f90ee4 <print_partition_extended+0xc0>
33f90ed0:	e1a00005 	mov	r0, r5
33f90ed4:	ebffff25 	bl	33f90b70 <is_extended>
33f90ed8:	e3500000 	cmp	r0, #0	; 0x0
33f90edc:	0a000034 	beq	33f90fb4 <print_partition_extended+0x190>
33f90ee0:	ea00001d 	b	33f90f5c <print_partition_extended+0x138>
33f90ee4:	e2840008 	add	r0, r4, #8	; 0x8
33f90ee8:	ebffff16 	bl	33f90b48 <le32_to_int>
33f90eec:	e1a07000 	mov	r7, r0
33f90ef0:	e284000c 	add	r0, r4, #12	; 0xc
33f90ef4:	ebffff13 	bl	33f90b48 <le32_to_int>
33f90ef8:	e1a06000 	mov	r6, r0
33f90efc:	e1a00005 	mov	r0, r5
33f90f00:	ebffff1a 	bl	33f90b70 <is_extended>
33f90f04:	e59f20ec 	ldr	r2, [pc, #236]	; 33f90ff8 <.text+0x10ff8>
33f90f08:	e59f30ec 	ldr	r3, [pc, #236]	; 33f90ffc <.text+0x10ffc>
33f90f0c:	e3500000 	cmp	r0, #0	; 0x0
33f90f10:	01a0c002 	moveq	ip, r2
33f90f14:	11a0c003 	movne	ip, r3
33f90f18:	e1a02007 	mov	r2, r7
33f90f1c:	e1a03006 	mov	r3, r6
33f90f20:	e59f00d8 	ldr	r0, [pc, #216]	; 33f91000 <.text+0x11000>
33f90f24:	e59d1008 	ldr	r1, [sp, #8]
33f90f28:	e88d1020 	stmia	sp, {r5, ip}
33f90f2c:	ebffdb4b 	bl	33f87c60 <printf>
33f90f30:	e3590000 	cmp	r9, #0	; 0x0
33f90f34:	0a000005 	beq	33f90f50 <print_partition_extended+0x12c>
33f90f38:	e5d40004 	ldrb	r0, [r4, #4]
33f90f3c:	e3500000 	cmp	r0, #0	; 0x0
33f90f40:	0a000005 	beq	33f90f5c <print_partition_extended+0x138>
33f90f44:	ebffff09 	bl	33f90b70 <is_extended>
33f90f48:	e3500000 	cmp	r0, #0	; 0x0
33f90f4c:	1a000002 	bne	33f90f5c <print_partition_extended+0x138>
33f90f50:	e59d3008 	ldr	r3, [sp, #8]
33f90f54:	e2833001 	add	r3, r3, #1	; 0x1
33f90f58:	e58d3008 	str	r3, [sp, #8]
33f90f5c:	e28d3f7f 	add	r3, sp, #508	; 0x1fc
33f90f60:	e2833002 	add	r3, r3, #2	; 0x2
33f90f64:	e1540003 	cmp	r4, r3
33f90f68:	1affffd2 	bne	33f90eb8 <print_partition_extended+0x94>
33f90f6c:	e5da0004 	ldrb	r0, [sl, #4]
33f90f70:	ebfffefe 	bl	33f90b70 <is_extended>
33f90f74:	e3500000 	cmp	r0, #0	; 0x0
33f90f78:	e28a0008 	add	r0, sl, #8	; 0x8
33f90f7c:	0a000008 	beq	33f90fa4 <print_partition_extended+0x180>
33f90f80:	ebfffef0 	bl	33f90b48 <le32_to_int>
33f90f84:	e59d300c 	ldr	r3, [sp, #12]
33f90f88:	e3590000 	cmp	r9, #0	; 0x0
33f90f8c:	e0801003 	add	r1, r0, r3
33f90f90:	e1a02003 	mov	r2, r3
33f90f94:	e1a0000b 	mov	r0, fp
33f90f98:	01a02001 	moveq	r2, r1
33f90f9c:	e59d3008 	ldr	r3, [sp, #8]
33f90fa0:	ebffff9f 	bl	33f90e24 <print_partition_extended>
33f90fa4:	e15a0004 	cmp	sl, r4
33f90fa8:	e28aa010 	add	sl, sl, #16	; 0x10
33f90fac:	0a00000c 	beq	33f90fe4 <print_partition_extended+0x1c0>
33f90fb0:	eaffffed 	b	33f90f6c <print_partition_extended+0x148>
33f90fb4:	e2840008 	add	r0, r4, #8	; 0x8
33f90fb8:	ebfffee2 	bl	33f90b48 <le32_to_int>
33f90fbc:	e0897000 	add	r7, r9, r0
33f90fc0:	e284000c 	add	r0, r4, #12	; 0xc
33f90fc4:	ebfffedf 	bl	33f90b48 <le32_to_int>
33f90fc8:	e59fc028 	ldr	ip, [pc, #40]	; 33f90ff8 <.text+0x10ff8>
33f90fcc:	e1a06000 	mov	r6, r0
33f90fd0:	eaffffd0 	b	33f90f18 <print_partition_extended+0xf4>
33f90fd4:	e59b1010 	ldr	r1, [fp, #16]
33f90fd8:	e59f0024 	ldr	r0, [pc, #36]	; 33f91004 <.text+0x11004>
33f90fdc:	e5dd2025 	ldrb	r2, [sp, #37]
33f90fe0:	ebffdb1e 	bl	33f87c60 <printf>
33f90fe4:	e28dde21 	add	sp, sp, #528	; 0x210
33f90fe8:	e8bd8ef0 	ldmia	sp!, {r4, r5, r6, r7, r9, sl, fp, pc}
33f90fec:	33f955c0 	mvnccs	r5, #805306368	; 0x30000000
33f90ff0:	33f953dc 	mvnccs	r5, #1879048195	; 0x70000003
33f90ff4:	33f955ec 	mvnccs	r5, #989855744	; 0x3b000000
33f90ff8:	33f938b4 	mvnccs	r3, #11796480	; 0xb40000
33f90ffc:	33f95644 	mvnccs	r5, #71303168	; 0x4400000
33f91000:	33f95588 	mvnccs	r5, #570425344	; 0x22000000
33f91004:	33f955a0 	mvnccs	r5, #671088640	; 0x28000000

33f91008 <print_part_dos>:
33f91008:	e92d4010 	stmdb	sp!, {r4, lr}
33f9100c:	e1a04000 	mov	r4, r0
33f91010:	e59f0018 	ldr	r0, [pc, #24]	; 33f91030 <.text+0x11030>
33f91014:	ebffdb11 	bl	33f87c60 <printf>
33f91018:	e3a01000 	mov	r1, #0	; 0x0
33f9101c:	e1a00004 	mov	r0, r4
33f91020:	e1a02001 	mov	r2, r1
33f91024:	e3a03001 	mov	r3, #1	; 0x1
33f91028:	e8bd4010 	ldmia	sp!, {r4, lr}
33f9102c:	eaffff7c 	b	33f90e24 <print_partition_extended>
33f91030:	33f9564c 	mvnccs	r5, #79691776	; 0x4c00000

33f91034 <__aeabi_idiv>:
33f91034:	e3510000 	cmp	r1, #0	; 0x0
33f91038:	e020c001 	eor	ip, r0, r1
33f9103c:	0a000042 	beq	33f9114c <__aeabi_idiv+0x118>
33f91040:	42611000 	rsbmi	r1, r1, #0	; 0x0
33f91044:	e2512001 	subs	r2, r1, #1	; 0x1
33f91048:	0a000027 	beq	33f910ec <__aeabi_idiv+0xb8>
33f9104c:	e1b03000 	movs	r3, r0
33f91050:	42603000 	rsbmi	r3, r0, #0	; 0x0
33f91054:	e1530001 	cmp	r3, r1
33f91058:	9a000026 	bls	33f910f8 <__aeabi_idiv+0xc4>
33f9105c:	e1110002 	tst	r1, r2
33f91060:	0a000028 	beq	33f91108 <__aeabi_idiv+0xd4>
33f91064:	e311020e 	tst	r1, #-536870912	; 0xe0000000
33f91068:	01a01181 	moveq	r1, r1, lsl #3
33f9106c:	03a02008 	moveq	r2, #8	; 0x8
33f91070:	13a02001 	movne	r2, #1	; 0x1
33f91074:	e3510201 	cmp	r1, #268435456	; 0x10000000
33f91078:	31510003 	cmpcc	r1, r3
33f9107c:	31a01201 	movcc	r1, r1, lsl #4
33f91080:	31a02202 	movcc	r2, r2, lsl #4
33f91084:	3afffffa 	bcc	33f91074 <__aeabi_idiv+0x40>
33f91088:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
33f9108c:	31510003 	cmpcc	r1, r3
33f91090:	31a01081 	movcc	r1, r1, lsl #1
33f91094:	31a02082 	movcc	r2, r2, lsl #1
33f91098:	3afffffa 	bcc	33f91088 <__aeabi_idiv+0x54>
33f9109c:	e3a00000 	mov	r0, #0	; 0x0
33f910a0:	e1530001 	cmp	r3, r1
33f910a4:	20433001 	subcs	r3, r3, r1
33f910a8:	21800002 	orrcs	r0, r0, r2
33f910ac:	e15300a1 	cmp	r3, r1, lsr #1
33f910b0:	204330a1 	subcs	r3, r3, r1, lsr #1
33f910b4:	218000a2 	orrcs	r0, r0, r2, lsr #1
33f910b8:	e1530121 	cmp	r3, r1, lsr #2
33f910bc:	20433121 	subcs	r3, r3, r1, lsr #2
33f910c0:	21800122 	orrcs	r0, r0, r2, lsr #2
33f910c4:	e15301a1 	cmp	r3, r1, lsr #3
33f910c8:	204331a1 	subcs	r3, r3, r1, lsr #3
33f910cc:	218001a2 	orrcs	r0, r0, r2, lsr #3
33f910d0:	e3530000 	cmp	r3, #0	; 0x0
33f910d4:	11b02222 	movnes	r2, r2, lsr #4
33f910d8:	11a01221 	movne	r1, r1, lsr #4
33f910dc:	1affffef 	bne	33f910a0 <__aeabi_idiv+0x6c>
33f910e0:	e35c0000 	cmp	ip, #0	; 0x0
33f910e4:	42600000 	rsbmi	r0, r0, #0	; 0x0
33f910e8:	e1a0f00e 	mov	pc, lr
33f910ec:	e13c0000 	teq	ip, r0
33f910f0:	42600000 	rsbmi	r0, r0, #0	; 0x0
33f910f4:	e1a0f00e 	mov	pc, lr
33f910f8:	33a00000 	movcc	r0, #0	; 0x0
33f910fc:	01a00fcc 	moveq	r0, ip, asr #31
33f91100:	03800001 	orreq	r0, r0, #1	; 0x1
33f91104:	e1a0f00e 	mov	pc, lr
33f91108:	e3510801 	cmp	r1, #65536	; 0x10000
33f9110c:	21a01821 	movcs	r1, r1, lsr #16
33f91110:	23a02010 	movcs	r2, #16	; 0x10
33f91114:	33a02000 	movcc	r2, #0	; 0x0
33f91118:	e3510c01 	cmp	r1, #256	; 0x100
33f9111c:	21a01421 	movcs	r1, r1, lsr #8
33f91120:	22822008 	addcs	r2, r2, #8	; 0x8
33f91124:	e3510010 	cmp	r1, #16	; 0x10
33f91128:	21a01221 	movcs	r1, r1, lsr #4
33f9112c:	22822004 	addcs	r2, r2, #4	; 0x4
33f91130:	e3510004 	cmp	r1, #4	; 0x4
33f91134:	82822003 	addhi	r2, r2, #3	; 0x3
33f91138:	908220a1 	addls	r2, r2, r1, lsr #1
33f9113c:	e35c0000 	cmp	ip, #0	; 0x0
33f91140:	e1a00233 	mov	r0, r3, lsr r2
33f91144:	42600000 	rsbmi	r0, r0, #0	; 0x0
33f91148:	e1a0f00e 	mov	pc, lr
33f9114c:	e52de008 	str	lr, [sp, #-8]!
33f91150:	ebffbf73 	bl	33f80f24 <__div0>
33f91154:	e3a00000 	mov	r0, #0	; 0x0
33f91158:	e49df008 	ldr	pc, [sp], #8

33f9115c <__aeabi_idivmod>:
33f9115c:	e92d4003 	stmdb	sp!, {r0, r1, lr}
33f91160:	ebffffb3 	bl	33f91034 <__aeabi_idiv>
33f91164:	e8bd4006 	ldmia	sp!, {r1, r2, lr}
33f91168:	e0030092 	mul	r3, r2, r0
33f9116c:	e0411003 	sub	r1, r1, r3
33f91170:	e1a0f00e 	mov	pc, lr

33f91174 <__modsi3>:
33f91174:	e3510000 	cmp	r1, #0	; 0x0
33f91178:	0a000032 	beq	33f91248 <__modsi3+0xd4>
33f9117c:	42611000 	rsbmi	r1, r1, #0	; 0x0
33f91180:	e1b0c000 	movs	ip, r0
33f91184:	42600000 	rsbmi	r0, r0, #0	; 0x0
33f91188:	e2512001 	subs	r2, r1, #1	; 0x1
33f9118c:	11500001 	cmpne	r0, r1
33f91190:	03a00000 	moveq	r0, #0	; 0x0
33f91194:	81110002 	tsthi	r1, r2
33f91198:	00000002 	andeq	r0, r0, r2
33f9119c:	9a000026 	bls	33f9123c <__modsi3+0xc8>
33f911a0:	e3a02000 	mov	r2, #0	; 0x0
33f911a4:	e3510201 	cmp	r1, #268435456	; 0x10000000
33f911a8:	31510000 	cmpcc	r1, r0
33f911ac:	31a01201 	movcc	r1, r1, lsl #4
33f911b0:	32822004 	addcc	r2, r2, #4	; 0x4
33f911b4:	3afffffa 	bcc	33f911a4 <__modsi3+0x30>
33f911b8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
33f911bc:	31510000 	cmpcc	r1, r0
33f911c0:	31a01081 	movcc	r1, r1, lsl #1
33f911c4:	32822001 	addcc	r2, r2, #1	; 0x1
33f911c8:	3afffffa 	bcc	33f911b8 <__modsi3+0x44>
33f911cc:	e2522003 	subs	r2, r2, #3	; 0x3
33f911d0:	ba00000e 	blt	33f91210 <__modsi3+0x9c>
33f911d4:	e1500001 	cmp	r0, r1
33f911d8:	20400001 	subcs	r0, r0, r1
33f911dc:	e15000a1 	cmp	r0, r1, lsr #1
33f911e0:	204000a1 	subcs	r0, r0, r1, lsr #1
33f911e4:	e1500121 	cmp	r0, r1, lsr #2
33f911e8:	20400121 	subcs	r0, r0, r1, lsr #2
33f911ec:	e15001a1 	cmp	r0, r1, lsr #3
33f911f0:	204001a1 	subcs	r0, r0, r1, lsr #3
33f911f4:	e3500001 	cmp	r0, #1	; 0x1
33f911f8:	e1a01221 	mov	r1, r1, lsr #4
33f911fc:	a2522004 	subges	r2, r2, #4	; 0x4
33f91200:	aafffff3 	bge	33f911d4 <__modsi3+0x60>
33f91204:	e3120003 	tst	r2, #3	; 0x3
33f91208:	13300000 	teqne	r0, #0	; 0x0
33f9120c:	0a00000a 	beq	33f9123c <__modsi3+0xc8>
33f91210:	e3720002 	cmn	r2, #2	; 0x2
33f91214:	ba000006 	blt	33f91234 <__modsi3+0xc0>
33f91218:	0a000002 	beq	33f91228 <__modsi3+0xb4>
33f9121c:	e1500001 	cmp	r0, r1
33f91220:	20400001 	subcs	r0, r0, r1
33f91224:	e1a010a1 	mov	r1, r1, lsr #1
33f91228:	e1500001 	cmp	r0, r1
33f9122c:	20400001 	subcs	r0, r0, r1
33f91230:	e1a010a1 	mov	r1, r1, lsr #1
33f91234:	e1500001 	cmp	r0, r1
33f91238:	20400001 	subcs	r0, r0, r1
33f9123c:	e35c0000 	cmp	ip, #0	; 0x0
33f91240:	42600000 	rsbmi	r0, r0, #0	; 0x0
33f91244:	e1a0f00e 	mov	pc, lr
33f91248:	e52de008 	str	lr, [sp, #-8]!
33f9124c:	ebffbf34 	bl	33f80f24 <__div0>
33f91250:	e3a00000 	mov	r0, #0	; 0x0
33f91254:	e49df008 	ldr	pc, [sp], #8
