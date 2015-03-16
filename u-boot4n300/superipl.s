
superipl.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_start>:
       0:	ea00092e 	b	24c0 <try_gof_1>

00000004 <nevendloo1>:
       4:	eafffffe 	b	4 <nevendloo1>

00000008 <nevendloo2>:
       8:	eafffffe 	b	8 <nevendloo2>

0000000c <nevendloo3>:
       c:	eafffffe 	b	c <nevendloo3>

00000010 <x00000010>:
      10:	eafffffe 	b	10 <x00000010>

00000014 <nevendloo5>:
      14:	eafffffe 	b	14 <nevendloo5>

00000018 <nevendloo6>:
      18:	eafffffe 	b	18 <nevendloo6>

0000001c <nevendloo7>:
      1c:	eafffffe 	b	1c <nevendloo7>

00000020 <x30000020>:
      20:	e5801000 	str	r1, [r0]

00000024 <x30000024>:
      24:	e5823000 	str	r3, [r2]
      28:	e5845000 	str	r5, [r4]

0000002c <never_end>:
      2c:	eafffffe 	b	2c <never_end>

00000030 <gpio_init>:
      30:	e59f0478 	ldr	r0, [pc, #1144]	; 4b0 <.gpadat>
      34:	e3e014fe 	mvn	r1, #-33554432	; 0xfe000000
      38:	e5801000 	str	r1, [r0]
      3c:	e3a00456 	mov	r0, #1442840576	; 0x56000000
      40:	e59f14b4 	ldr	r1, [pc, #1204]	; 4fc <.gpddat+0x10>
      44:	e5801000 	str	r1, [r0]
      48:	e59f0468 	ldr	r0, [pc, #1128]	; 4b8 <.gpadat+0x8>
      4c:	e59f1468 	ldr	r1, [pc, #1128]	; 4bc <.gpadat+0xc>
      50:	e5801000 	str	r1, [r0]
      54:	e59f0464 	ldr	r0, [pc, #1124]	; 4c0 <.gpadat+0x10>
      58:	e59f1464 	ldr	r1, [pc, #1124]	; 4c4 <.gpadat+0x14>
      5c:	e5801000 	str	r1, [r0]
      60:	e59f0460 	ldr	r0, [pc, #1120]	; 4c8 <.gpadat+0x18>
      64:	e59f1460 	ldr	r1, [pc, #1120]	; 4cc <.gpadat+0x1c>
      68:	e5801000 	str	r1, [r0]
      6c:	e59f045c 	ldr	r0, [pc, #1116]	; 4d0 <.gpadat+0x20>
      70:	e59f145c 	ldr	r1, [pc, #1116]	; 4d4 <.gpadat+0x24>
      74:	e5801000 	str	r1, [r0]
      78:	e59f0458 	ldr	r0, [pc, #1112]	; 4d8 <.gpcdat>
      7c:	e3a01012 	mov	r1, #18	; 0x12
      80:	e5801000 	str	r1, [r0]
      84:	e59f0450 	ldr	r0, [pc, #1104]	; 4dc <.gpcdat+0x4>
      88:	e59f1450 	ldr	r1, [pc, #1104]	; 4e0 <.gpcdat+0x8>
      8c:	e5801000 	str	r1, [r0]
      90:	e59f044c 	ldr	r0, [pc, #1100]	; 4e4 <.gpcdat+0xc>
      94:	e59f144c 	ldr	r1, [pc, #1100]	; 4e8 <.gpcdat+0x10>
      98:	e5801000 	str	r1, [r0]
      9c:	e59f0448 	ldr	r0, [pc, #1096]	; 4ec <.gpddat>
      a0:	e3a01a01 	mov	r1, #4096	; 0x1000
      a4:	e5801000 	str	r1, [r0]
      a8:	e59f0440 	ldr	r0, [pc, #1088]	; 4f0 <.gpddat+0x4>
      ac:	e59f1440 	ldr	r1, [pc, #1088]	; 4f4 <.gpddat+0x8>
      b0:	e5801000 	str	r1, [r0]
      b4:	e59f043c 	ldr	r0, [pc, #1084]	; 4f8 <.gpddat+0xc>
      b8:	e59f1414 	ldr	r1, [pc, #1044]	; 4d4 <.gpadat+0x24>
      bc:	e5801000 	str	r1, [r0]
      c0:	e59f0434 	ldr	r0, [pc, #1076]	; 4fc <.gpddat+0x10>
      c4:	e3a01000 	mov	r1, #0	; 0x0
      c8:	e5801000 	str	r1, [r0]
      cc:	e59f042c 	ldr	r0, [pc, #1068]	; 500 <.gpddat+0x14>
      d0:	e59f142c 	ldr	r1, [pc, #1068]	; 504 <.gpddat+0x18>
      d4:	e5801000 	str	r1, [r0]
      d8:	e59f0428 	ldr	r0, [pc, #1064]	; 508 <.gpddat+0x1c>
      dc:	e3a010ff 	mov	r1, #255	; 0xff
      e0:	e5801000 	str	r1, [r0]
      e4:	e59f0420 	ldr	r0, [pc, #1056]	; 50c <.gpddat+0x20>
      e8:	e3a01000 	mov	r1, #0	; 0x0
      ec:	e5801000 	str	r1, [r0]
      f0:	e59f0418 	ldr	r0, [pc, #1048]	; 510 <.gpddat+0x24>
      f4:	e3a01002 	mov	r1, #2	; 0x2
      f8:	e5801000 	str	r1, [r0]
      fc:	e59f0410 	ldr	r0, [pc, #1040]	; 514 <.gpddat+0x28>
     100:	e59f13cc 	ldr	r1, [pc, #972]	; 4d4 <.gpadat+0x24>
     104:	e5801000 	str	r1, [r0]
     108:	e59f0408 	ldr	r0, [pc, #1032]	; 518 <.gpgdat_add>
     10c:	e3a01000 	mov	r1, #0	; 0x0
     110:	e5801000 	str	r1, [r0]
     114:	e59f0400 	ldr	r0, [pc, #1024]	; 51c <.gpgdat_add+0x4>
     118:	e59f1400 	ldr	r1, [pc, #1024]	; 520 <.gpgdat_add+0x8>
     11c:	e5801000 	str	r1, [r0]
     120:	e59f03fc 	ldr	r0, [pc, #1020]	; 524 <.gpgdat_add+0xc>
     124:	e59f13fc 	ldr	r1, [pc, #1020]	; 528 <.gpgdat_add+0x10>
     128:	e5801000 	str	r1, [r0]
     12c:	e59f03f8 	ldr	r0, [pc, #1016]	; 52c <.gpgdat_add+0x14>
     130:	e3a01c02 	mov	r1, #512	; 0x200
     134:	e5801000 	str	r1, [r0]
     138:	e59f03f0 	ldr	r0, [pc, #1008]	; 530 <.gpgdat_add+0x18>
     13c:	e59f13f0 	ldr	r1, [pc, #1008]	; 534 <.gpgdat_add+0x1c>
     140:	e5801000 	str	r1, [r0]
     144:	e59f03ec 	ldr	r0, [pc, #1004]	; 538 <.gpgdat_add+0x20>
     148:	e59f136c 	ldr	r1, [pc, #876]	; 4bc <.gpadat+0xc>
     14c:	e5801000 	str	r1, [r0]
     150:	e59f03e4 	ldr	r0, [pc, #996]	; 53c <.gpgdat_add+0x24>
     154:	e59f1360 	ldr	r1, [pc, #864]	; 4bc <.gpadat+0xc>
     158:	e5801000 	str	r1, [r0]
     15c:	e59f03dc 	ldr	r0, [pc, #988]	; 540 <.gpgdat_add+0x28>
     160:	e59f13dc 	ldr	r1, [pc, #988]	; 544 <.gpgdat_add+0x2c>
     164:	e5801000 	str	r1, [r0]
     168:	e3a00453 	mov	r0, #1392508928	; 0x53000000
     16c:	e3a01000 	mov	r1, #0	; 0x0
     170:	e5801000 	str	r1, [r0]
     174:	e59f03cc 	ldr	r0, [pc, #972]	; 548 <.int_mask>
     178:	e3e01000 	mvn	r1, #0	; 0x0
     17c:	e5801000 	str	r1, [r0]
     180:	e59f03c4 	ldr	r0, [pc, #964]	; 54c <.int_mask+0x4>
     184:	e59f139c 	ldr	r1, [pc, #924]	; 528 <.gpgdat_add+0x10>
     188:	e5801000 	str	r1, [r0]
     18c:	e59f0358 	ldr	r0, [pc, #856]	; 4ec <.gpddat>
     190:	e590a000 	ldr	sl, [r0]
     194:	e31a0040 	tst	sl, #64	; 0x40
     198:	0a000001 	beq	1a4 <b_1a4>
     19c:	e3a01007 	mov	r1, #7	; 0x7
     1a0:	ea000000 	b	1a8 <b_1a8>

000001a4 <b_1a4>:
     1a4:	e3a01007 	mov	r1, #7	; 0x7

000001a8 <b_1a8>:
     1a8:	e59f03a0 	ldr	r0, [pc, #928]	; 550 <.clkdivn_add>
     1ac:	e5801000 	str	r1, [r0]
     1b0:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
     1b4:	e3800103 	orr	r0, r0, #-1073741824	; 0xc0000000
     1b8:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
     1bc:	e3a00313 	mov	r0, #1275068416	; 0x4c000000
     1c0:	e3e014ff 	mvn	r1, #-16777216	; 0xff000000
     1c4:	e5801000 	str	r1, [r0]
     1c8:	e59f0384 	ldr	r0, [pc, #900]	; 554 <.upllcon_add>
     1cc:	e59f1384 	ldr	r1, [pc, #900]	; 558 <.upllcon_val>
     1d0:	e5801000 	str	r1, [r0]
     1d4:	e1a00000 	nop			(mov r0,r0)
     1d8:	e1a00000 	nop			(mov r0,r0)
     1dc:	e1a00000 	nop			(mov r0,r0)
     1e0:	e1a00000 	nop			(mov r0,r0)
     1e4:	e1a00000 	nop			(mov r0,r0)
     1e8:	e1a00000 	nop			(mov r0,r0)
     1ec:	e1a00000 	nop			(mov r0,r0)
     1f0:	e59f0364 	ldr	r0, [pc, #868]	; 55c <.camdivn>
     1f4:	e3a01000 	mov	r1, #0	; 0x0
     1f8:	e5801000 	str	r1, [r0]
     1fc:	e59f02e8 	ldr	r0, [pc, #744]	; 4ec <.gpddat>
     200:	e590a000 	ldr	sl, [r0]
     204:	e31a0040 	tst	sl, #64	; 0x40
     208:	0a000001 	beq	214 <b_214>
     20c:	e59f134c 	ldr	r1, [pc, #844]	; 560 <.clock_val2>
     210:	ea000000 	b	218 <b_218>

00000214 <b_214>:
     214:	e59f1348 	ldr	r1, [pc, #840]	; 564 <.mpllcon_400Mhz>

00000218 <b_218>:
     218:	e59f0348 	ldr	r0, [pc, #840]	; 568 <.mpllcon>
     21c:	e5801000 	str	r1, [r0]
     220:	e3a00c02 	mov	r0, #512	; 0x200

00000224 <wait01>:
     224:	e2500001 	subs	r0, r0, #1	; 0x1
     228:	1afffffd 	bne	224 <wait01>

0000022c <chk_pwrsupply>:
     22c:	e59f02a4 	ldr	r0, [pc, #676]	; 4d8 <.gpcdat>
     230:	e5901000 	ldr	r1, [r0]
     234:	e3110080 	tst	r1, #128	; 0x80
     238:	0a000000 	beq	240 <supply_present>
     23c:	ea000029 	b	2e8 <no_ACsupply>

00000240 <supply_present>:
     240:	e59f02d0 	ldr	r0, [pc, #720]	; 518 <.gpgdat_add>

00000244 <.0x244>:
     244:	e5901000 	ldr	r1, [r0]
     248:	e3110b02 	tst	r1, #2048	; 0x800
     24c:	0a000025 	beq	2e8 <no_ACsupply>
     250:	e59f0314 	ldr	r0, [pc, #788]	; 56c <.gstatus3>
     254:	e3a01d16 	mov	r1, #1408	; 0x580
     258:	e5801000 	str	r1, [r0]
     25c:	e59f030c 	ldr	r0, [pc, #780]	; 570 <.rtc_con>
     260:	e3a01000 	mov	r1, #0	; 0x0
     264:	e5801000 	str	r1, [r0]
     268:	e3a00316 	mov	r0, #1476395008	; 0x58000000
     26c:	e59f1300 	ldr	r1, [pc, #768]	; 574 <.adcbase_val>
     270:	e5801000 	str	r1, [r0]
     274:	e59f02fc 	ldr	r0, [pc, #764]	; 578 <.misccr>
     278:	e5901000 	ldr	r1, [r0]
     27c:	e59f22f8 	ldr	r2, [pc, #760]	; 57c <.misccr_mask>
     280:	e0011002 	and	r1, r1, r2
     284:	e3811003 	orr	r1, r1, #3	; 0x3
     288:	e3811a03 	orr	r1, r1, #12288	; 0x3000
     28c:	e3811606 	orr	r1, r1, #6291456	; 0x600000
     290:	e5801000 	str	r1, [r0]
     294:	e59f02e4 	ldr	r0, [pc, #740]	; 580 <.misccr_mask+0x4>
     298:	e3a010ff 	mov	r1, #255	; 0xff
     29c:	e5801000 	str	r1, [r0]
     2a0:	e59f02d0 	ldr	r0, [pc, #720]	; 578 <.misccr>
     2a4:	e5900000 	ldr	r0, [r0]
     2a8:	e59f02d4 	ldr	r0, [pc, #724]	; 584 <.misccr_mask+0x8>
     2ac:	e5900000 	ldr	r0, [r0]
     2b0:	e59f02d0 	ldr	r0, [pc, #720]	; 588 <.misccr_mask+0xc>
     2b4:	e5901000 	ldr	r1, [r0]
     2b8:	e3811501 	orr	r1, r1, #4194304	; 0x400000
     2bc:	e59f22b4 	ldr	r2, [pc, #692]	; 578 <.misccr>
     2c0:	e5923000 	ldr	r3, [r2]
     2c4:	e3833806 	orr	r3, r3, #393216	; 0x60000
     2c8:	e3c33607 	bic	r3, r3, #7340032	; 0x700000
     2cc:	e3833606 	orr	r3, r3, #6291456	; 0x600000
     2d0:	e59f42ac 	ldr	r4, [pc, #684]	; 584 <.misccr_mask+0x8>
     2d4:	e59f52b0 	ldr	r5, [pc, #688]	; 58c <.misccr_mask+0x10>
     2d8:	e5801000 	str	r1, [r0]
     2dc:	e5823000 	str	r3, [r2]
     2e0:	e5845000 	str	r5, [r4]

000002e4 <stop_here>:
     2e4:	eafffffe 	b	2e4 <stop_here>

000002e8 <no_ACsupply>:
     2e8:	e59f12a0 	ldr	r1, [pc, #672]	; 590 <.gstatus2>
     2ec:	e591a000 	ldr	sl, [r1]
     2f0:	e31a0002 	tst	sl, #2	; 0x2
     2f4:	0a000030 	beq	3bc <b3bc>
     2f8:	e59f026c 	ldr	r0, [pc, #620]	; 56c <.gstatus3>
     2fc:	e5901000 	ldr	r1, [r0]
     300:	e3110d16 	tst	r1, #1408	; 0x580
     304:	0a000015 	beq	360 <b360>
     308:	e59f025c 	ldr	r0, [pc, #604]	; 56c <.gstatus3>
     30c:	e3a01000 	mov	r1, #0	; 0x0
     310:	e5801000 	str	r1, [r0]
     314:	e59f1274 	ldr	r1, [pc, #628]	; 590 <.gstatus2>
     318:	e591a000 	ldr	sl, [r1]
     31c:	e581a000 	str	sl, [r1]
     320:	e3a0a000 	mov	sl, #0	; 0x0
     324:	e3a01453 	mov	r1, #1392508928	; 0x53000000
     328:	e59f0264 	ldr	r0, [pc, #612]	; 594 <.gstatus2+0x4>
     32c:	e5810000 	str	r0, [r1]
     330:	e59f1260 	ldr	r1, [pc, #608]	; 598 <.gstatus2+0x8>
     334:	e3a00001 	mov	r0, #1	; 0x1
     338:	e5810000 	str	r0, [r1]
     33c:	e59f1258 	ldr	r1, [pc, #600]	; 59c <.gstatus2+0xc>
     340:	e3a00001 	mov	r0, #1	; 0x1
     344:	e5810000 	str	r0, [r1]
     348:	e3a01453 	mov	r1, #1392508928	; 0x53000000
     34c:	e5910000 	ldr	r0, [r1]
     350:	e3800020 	orr	r0, r0, #32	; 0x20
     354:	e5810000 	str	r0, [r1]

00000358 <stophere2>:
     358:	eafffffe 	b	358 <stophere2>
     35c:	ea000016 	b	3bc <b3bc>

00000360 <b360>:
     360:	e59f1210 	ldr	r1, [pc, #528]	; 578 <.misccr>
     364:	e5910000 	ldr	r0, [r1]
     368:	e3c00806 	bic	r0, r0, #393216	; 0x60000
     36c:	e5810000 	str	r0, [r1]
     370:	e28f0f91 	add	r0, pc, #580	; 0x244
     374:	e3a01312 	mov	r1, #1207959552	; 0x48000000
     378:	e2802034 	add	r2, r0, #52	; 0x34

0000037c <b37c>:
     37c:	e4903004 	ldr	r3, [r0], #4
     380:	e4813004 	str	r3, [r1], #4
     384:	e1520000 	cmp	r2, r0
     388:	1afffffb 	bne	37c <b37c>
     38c:	ebfffffe 	bl	0 <b600>
     390:	e3a01c01 	mov	r1, #256	; 0x100

00000394 <b394>:
     394:	e2511001 	subs	r1, r1, #1	; 0x1
     398:	1afffffd 	bne	394 <b394>
     39c:	e59f21fc 	ldr	r2, [pc, #508]	; 5a0 <.x5a0>
     3a0:	e2822203 	add	r2, r2, #805306368	; 0x30000000
     3a4:	e1a0f002 	mov	pc, r2
     3a8:	e1a00000 	nop			(mov r0,r0)
     3ac:	e1a00000 	nop			(mov r0,r0)
     3b0:	e1a00000 	nop			(mov r0,r0)

000003b4 <stophere3>:
     3b4:	eafffffe 	b	3b4 <stophere3>
     3b8:	ea000019 	b	424 <b424>

000003bc <b3bc>:
     3bc:	e31a0004 	tst	sl, #4	; 0x4
     3c0:	0a00001b 	beq	434 <b434>

000003c4 <b3c4>:
     3c4:	e59f01ec 	ldr	r0, [pc, #492]	; 5b8 <.stack_pointer+0x4>
     3c8:	e3a01312 	mov	r1, #1207959552	; 0x48000000
     3cc:	e2802034 	add	r2, r0, #52	; 0x34

000003d0 <b3d0>:
     3d0:	e4903004 	ldr	r3, [r0], #4
     3d4:	e4813004 	str	r3, [r1], #4
     3d8:	e1520000 	cmp	r2, r0
     3dc:	1afffffb 	bne	3d0 <b3d0>
     3e0:	ebfffffe 	bl	0 <b600>
     3e4:	e3a01c01 	mov	r1, #256	; 0x100

000003e8 <b3e8>:
     3e8:	e2511001 	subs	r1, r1, #1	; 0x1
     3ec:	1afffffd 	bne	3e8 <b3e8>
     3f0:	e59f0174 	ldr	r0, [pc, #372]	; 56c <.gstatus3>
     3f4:	e59f11a8 	ldr	r1, [pc, #424]	; 5a4 <.gstatus3_val>
     3f8:	e5801000 	str	r1, [r0]
     3fc:	e59f21a4 	ldr	r2, [pc, #420]	; 5a8 <.gstatus3_val+0x4>
     400:	e5929000 	ldr	r9, [r2]
     404:	e3590001 	cmp	r9, #1	; 0x1
     408:	1a000000 	bne	410 <b410>
     40c:	ea000008 	b	434 <b434>

00000410 <b410>:
     410:	e59f2194 	ldr	r2, [pc, #404]	; 5ac <.x30020044>
     414:	e5929000 	ldr	r9, [r2]
     418:	e3590001 	cmp	r9, #1	; 0x1
     41c:	1a000000 	bne	424 <b424>
     420:	ea00001c 	b	498 <b498>

00000424 <b424>:
     424:	e59f114c 	ldr	r1, [pc, #332]	; 578 <.misccr>
     428:	e5910000 	ldr	r0, [r1]
     42c:	e3c00806 	bic	r0, r0, #393216	; 0x60000
     430:	e5810000 	str	r0, [r1]

00000434 <b434>:
     434:	e28f0d06 	add	r0, pc, #384	; 0x180
     438:	e3a01312 	mov	r1, #1207959552	; 0x48000000
     43c:	e2802034 	add	r2, r0, #52	; 0x34

00000440 <b440>:
     440:	e4903004 	ldr	r3, [r0], #4
     444:	e4813004 	str	r3, [r1], #4
     448:	e1520000 	cmp	r2, r0
     44c:	1afffffb 	bne	440 <b440>
     450:	eb00006a 	bl	600 <mem_rfrh>
     454:	eb0000df 	bl	7d8 <check_homeBtn>
     458:	e1a09000 	mov	r9, r0

0000045c <clear_dram>:
     45c:	e3a00203 	mov	r0, #805306368	; 0x30000000
     460:	e3a0a301 	mov	sl, #67108864	; 0x4000000

00000464 <clrdram_loop>:
     464:	e3a01000 	mov	r1, #0	; 0x0
     468:	e3a02000 	mov	r2, #0	; 0x0
     46c:	e3a03000 	mov	r3, #0	; 0x0
     470:	e3a04000 	mov	r4, #0	; 0x0
     474:	e3a05000 	mov	r5, #0	; 0x0
     478:	e3a06000 	mov	r6, #0	; 0x0
     47c:	e3a07000 	mov	r7, #0	; 0x0
     480:	e3a08000 	mov	r8, #0	; 0x0
     484:	e8a001fe 	stmia	r0!, {r1, r2, r3, r4, r5, r6, r7, r8}
     488:	e25aa020 	subs	sl, sl, #32	; 0x20
     48c:	1afffff4 	bne	464 <clrdram_loop>

00000490 <no_lowlevel_init>:
     490:	e59f0118 	ldr	r0, [pc, #280]	; 5b0 <.home_btn_stat>
     494:	e5809000 	str	r9, [r0]

00000498 <b498>:
     498:	e10f0000 	mrs	r0, CPSR
     49c:	e3c000df 	bic	r0, r0, #223	; 0xdf
     4a0:	e3801013 	orr	r1, r0, #19	; 0x13
     4a4:	e12ff001 	msr	CPSR_fsxc, r1

000004a8 <load_stack>:
     4a8:	e59fd104 	ldr	sp, [pc, #260]	; 5b4 <.stack_pointer>
     4ac:	eb0000b8 	bl	794 <b_794>

000004b0 <.gpadat>:
     4b0:	56000004 	.word	0x56000004
     4b4:	005eaf1f 	.word	0x005eaf1f
     4b8:	56000018 	.word	0x56000018
     4bc:	00001fff 	.word	0x00001fff
     4c0:	56000014 	.word	0x56000014
     4c4:	00000146 	.word	0x00000146
     4c8:	56000010 	.word	0x56000010
     4cc:	00155455 	.word	0x00155455
     4d0:	56000028 	.word	0x56000028
     4d4:	0000ffff 	.word	0x0000ffff

000004d8 <.gpcdat>:
     4d8:	56000024 	.word	0x56000024
     4dc:	56000020 	.word	0x56000020
     4e0:	55551515 	.word	0x55551515
     4e4:	56000038 	.word	0x56000038
     4e8:	0000efff 	.word	0x0000efff

000004ec <.gpddat>:
     4ec:	56000034 	.word	0x56000034
     4f0:	56000030 	.word	0x56000030
     4f4:	05514514 	.word	0x05514514
     4f8:	56000048 	.word	0x56000048
     4fc:	56000044 	.word	0x56000044
     500:	56000040 	.word	0x56000040
     504:	05555555 	.word	0x05555555
     508:	56000058 	.word	0x56000058
     50c:	56000054 	.word	0x56000054
     510:	56000050 	.word	0x56000050
     514:	56000068 	.word	0x56000068

00000518 <.gpgdat_add>:
     518:	56000064 	.word	0x56000064
     51c:	56000060 	.word	0x56000060
     520:	01150010 	.word	0x01150010
     524:	56000078 	.word	0x56000078
     528:	000007ff 	.word	0x000007ff
     52c:	56000074 	.word	0x56000074
     530:	56000070 	.word	0x56000070
     534:	00155514 	.word	0x00155514
     538:	560000d8 	.word	0x560000d8
     53c:	560000d4 	.word	0x560000d4
     540:	560000d0 	.word	0x560000d0
     544:	55555555 	.word	0x55555555

00000548 <.int_mask>:
     548:	4a000008 	.word	0x4a000008
     54c:	4a00001c 	.word	0x4a00001c

00000550 <.clkdivn_add>:
     550:	4c000014 	.word	0x4c000014

00000554 <.upllcon_add>:
     554:	4c000008 	.word	0x4c000008

00000558 <.upllcon_val>:
     558:	0003c042 	.word	0x0003c042

0000055c <.camdivn>:
     55c:	4c000018 	.word	0x4c000018

00000560 <.clock_val2>:
     560:	00074051 	.word	0x00074051

00000564 <.mpllcon_400Mhz>:
     564:	0006e031 	.word	0x0006e031

00000568 <.mpllcon>:
     568:	4c000004 	.word	0x4c000004

0000056c <.gstatus3>:
     56c:	560000b8 	.word	0x560000b8

00000570 <.rtc_con>:
     570:	57000040 	.word	0x57000040

00000574 <.adcbase_val>:
     574:	00003fc4 	.word	0x00003fc4

00000578 <.misccr>:
     578:	56000080 	.word	0x56000080

0000057c <.misccr_mask>:
     57c:	008ffffb 	.word	0x008ffffb
     580:	560000cc 	.word	0x560000cc
     584:	4c00000c 	.word	0x4c00000c
     588:	48000024 	.word	0x48000024
     58c:	0007fff8 	.word	0x0007fff8

00000590 <.gstatus2>:
     590:	560000b4 	.word	0x560000b4
     594:	00000101 	.word	0x00000101
     598:	53000004 	.word	0x53000004
     59c:	53000008 	.word	0x53000008

000005a0 <.x5a0>:
     5a0:	00201000 	.word	0x00201000

000005a4 <.gstatus3_val>:
     5a4:	12345678 	.word	0x12345678
     5a8:	30020048 	.word	0x30020048

000005ac <.x30020044>:
     5ac:	30020044 	.word	0x30020044

000005b0 <.home_btn_stat>:
     5b0:	30020110 	.word	0x30020110

000005b4 <.stack_pointer>:
     5b4:	33ff5800 	.word	0x33ff5800
     5b8:	000005bc 	.word	0x000005bc
     5bc:	22121120 	.word	0x22121120
     5c0:	00000700 	.word	0x00000700
     5c4:	00000700 	.word	0x00000700
     5c8:	00000700 	.word	0x00000700
     5cc:	00000700 	.word	0x00000700
     5d0:	00000700 	.word	0x00000700
     5d4:	00000700 	.word	0x00000700
     5d8:	00018009 	.word	0x00018009
     5dc:	00018009 	.word	0x00018009
     5e0:	00ae04f5 	.word	0x00ae04f5
     5e4:	000000b2 	.word	0x000000b2
     5e8:	00000030 	.word	0x00000030
     5ec:	00000030 	.word	0x00000030

000005f0 <IcacheEnable>:
     5f0:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
     5f4:	e3800a01 	orr	r0, r0, #4096	; 0x1000
     5f8:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
     5fc:	e12fff1e 	bx	lr

00000600 <mem_rfrh>:
     600:	e59f012c 	ldr	r0, [pc, #300]	; 734 <.memctl_rfrsh_add>
     604:	e59f112c 	ldr	r1, [pc, #300]	; 738 <.gpddat_add>
     608:	e5912000 	ldr	r2, [r1]
     60c:	e3120040 	tst	r2, #64	; 0x40
     610:	0a000000 	beq	618 <b618>
     614:	ea000001 	b	620 <b620>

00000618 <b618>:
     618:	e59f111c 	ldr	r1, [pc, #284]	; 73c <.memctl_rfrsh_val>
     61c:	e5801000 	str	r1, [r0]

00000620 <b620>:
     620:	e12fff1e 	bx	lr
     624:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
     628:	e3800103 	orr	r0, r0, #-1073741824	; 0xc0000000
     62c:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
     630:	e12fff1e 	bx	lr

00000634 <nand_load_block>:
     634:	e92d0ffe 	push	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
     638:	e59f1100 	ldr	r1, [pc, #256]	; 740 <.nand_nfdata>
     63c:	e3a02c02 	mov	r2, #512	; 0x200

00000640 <b640>:
     640:	e5d14000 	ldrb	r4, [r1]
     644:	e5d13000 	ldrb	r3, [r1]
     648:	e1844403 	orr	r4, r4, r3, lsl #8
     64c:	e5d13000 	ldrb	r3, [r1]
     650:	e1844803 	orr	r4, r4, r3, lsl #16
     654:	e5d13000 	ldrb	r3, [r1]
     658:	e1844c03 	orr	r4, r4, r3, lsl #24
     65c:	e5d15000 	ldrb	r5, [r1]
     660:	e5d13000 	ldrb	r3, [r1]
     664:	e1855403 	orr	r5, r5, r3, lsl #8
     668:	e5d13000 	ldrb	r3, [r1]
     66c:	e1855803 	orr	r5, r5, r3, lsl #16
     670:	e5d13000 	ldrb	r3, [r1]
     674:	e1855c03 	orr	r5, r5, r3, lsl #24
     678:	e5d16000 	ldrb	r6, [r1]
     67c:	e5d13000 	ldrb	r3, [r1]
     680:	e1866403 	orr	r6, r6, r3, lsl #8
     684:	e5d13000 	ldrb	r3, [r1]
     688:	e1866803 	orr	r6, r6, r3, lsl #16
     68c:	e5d13000 	ldrb	r3, [r1]
     690:	e1866c03 	orr	r6, r6, r3, lsl #24
     694:	e5d17000 	ldrb	r7, [r1]
     698:	e5d13000 	ldrb	r3, [r1]
     69c:	e1877403 	orr	r7, r7, r3, lsl #8
     6a0:	e5d13000 	ldrb	r3, [r1]
     6a4:	e1877803 	orr	r7, r7, r3, lsl #16
     6a8:	e5d13000 	ldrb	r3, [r1]
     6ac:	e1877c03 	orr	r7, r7, r3, lsl #24
     6b0:	e5d18000 	ldrb	r8, [r1]
     6b4:	e5d13000 	ldrb	r3, [r1]
     6b8:	e1888403 	orr	r8, r8, r3, lsl #8
     6bc:	e5d13000 	ldrb	r3, [r1]
     6c0:	e1888803 	orr	r8, r8, r3, lsl #16
     6c4:	e5d13000 	ldrb	r3, [r1]
     6c8:	e1888c03 	orr	r8, r8, r3, lsl #24
     6cc:	e5d19000 	ldrb	r9, [r1]
     6d0:	e5d13000 	ldrb	r3, [r1]
     6d4:	e1899403 	orr	r9, r9, r3, lsl #8
     6d8:	e5d13000 	ldrb	r3, [r1]
     6dc:	e1899803 	orr	r9, r9, r3, lsl #16
     6e0:	e5d13000 	ldrb	r3, [r1]
     6e4:	e1899c03 	orr	r9, r9, r3, lsl #24
     6e8:	e5d1a000 	ldrb	sl, [r1]
     6ec:	e5d13000 	ldrb	r3, [r1]
     6f0:	e18aa403 	orr	sl, sl, r3, lsl #8
     6f4:	e5d13000 	ldrb	r3, [r1]
     6f8:	e18aa803 	orr	sl, sl, r3, lsl #16
     6fc:	e5d13000 	ldrb	r3, [r1]
     700:	e18aac03 	orr	sl, sl, r3, lsl #24
     704:	e5d1b000 	ldrb	fp, [r1]
     708:	e5d13000 	ldrb	r3, [r1]
     70c:	e18bb403 	orr	fp, fp, r3, lsl #8
     710:	e5d13000 	ldrb	r3, [r1]
     714:	e18bb803 	orr	fp, fp, r3, lsl #16
     718:	e5d13000 	ldrb	r3, [r1]
     71c:	e18bbc03 	orr	fp, fp, r3, lsl #24
     720:	e8a00ff0 	stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
     724:	e2522020 	subs	r2, r2, #32	; 0x20
     728:	1affffc4 	bne	640 <b640>
     72c:	e8bd0ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
     730:	e12fff1e 	bx	lr

00000734 <.memctl_rfrsh_add>:
     734:	48000024 	.word	0x48000024

00000738 <.gpddat_add>:
     738:	56000034 	.word	0x56000034

0000073c <.memctl_rfrsh_val>:
     73c:	00ae03f3 	.word	0x00ae03f3

00000740 <.nand_nfdata>:
     740:	4e000010 	.word	0x4e000010

00000744 <x744>:
     744:	00000000 	.word	0x00000000

00000748 <x748>:
     748:	00000000 	.word	0x00000000

0000074c <x74c>:
     74c:	00000000 	.word	0x00000000

00000750 <x750>:
     750:	00000000 	.word	0x00000000

00000754 <x754>:
     754:	78f2ce7f 	.word	0x78f2ce7f

00000758 <x758>:
     758:	00000000 	.word	0x00000000

0000075c <x75c>:
     75c:	00000002 	.word	0x00000002

00000760 <x760>:
     760:	00000024 	.word	0x00000024

00000764 <x764>:
     764:	00001770 	.word	0x00001770

00000768 <x768>:
     768:	00000b70 	.word	0x00000b70

0000076c <x76c>:
     76c:	00001eb8 	.word	0x00001eb8

00000770 <x770>:
     770:	53445352 	.word	0x53445352

00000774 <x774>:
     774:	78f2ce7f 	.word	0x78f2ce7f

00000778 <x778>:
     778:	ac26a597 	.word	0xac26a597

0000077c <x77c>:
     77c:	89867df2 	.word	0x89867df2

00000780 <x780>:
     780:	38d1beb4 	.word	0x38d1beb4

00000784 <x784>:
     784:	00000001 	.word	0x00000001

00000788 <x788>:
     788:	70657473 	.word	0x70657473

0000078c <x78c>:
     78c:	2e72646c 	.word	0x2e72646c

00000790 <x790>:
     790:	00626470 	.word	0x00626470

00000794 <b_794>:
     794:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     798:	e24dd014 	sub	sp, sp, #20	; 0x14
     79c:	e3a03000 	mov	r3, #0	; 0x0
     7a0:	e58d3000 	str	r3, [sp]
     7a4:	e3a07000 	mov	r7, #0	; 0x0
     7a8:	ebffff90 	bl	5f0 <IcacheEnable>
     7ac:	e59f201c 	ldr	r2, [pc, #28]	; 7d0 <.x10at94c>

000007b0 <b92c>:
     7b0:	e5923000 	ldr	r3, [r2]
     7b4:	e1a0e00f 	mov	lr, pc
     7b8:	e12fff13 	bx	r3
     7bc:	e3a00000 	mov	r0, #0	; 0x0
     7c0:	e28dd014 	add	sp, sp, #20	; 0x14
     7c4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     7c8:	e12fff1e 	bx	lr

000007cc <stop2>:
     7cc:	eafffffe 	b	7cc <stop2>

000007d0 <.x10at94c>:
     7d0:	00000010 	.word	0x00000010

000007d4 <.x0at950>:
     7d4:	00000000 	.word	0x00000000

000007d8 <check_homeBtn>:
     7d8:	e3a02456 	mov	r2, #1442840576	; 0x56000000
     7dc:	e3822054 	orr	r2, r2, #84	; 0x54
     7e0:	e5923000 	ldr	r3, [r2]
     7e4:	e3130010 	tst	r3, #16	; 0x10
     7e8:	05923000 	ldreq	r3, [r2]
     7ec:	03130080 	tsteq	r3, #128	; 0x80
     7f0:	03a00001 	moveq	r0, #1	; 0x1
     7f4:	13a00000 	movne	r0, #0	; 0x0
     7f8:	e12fff1e 	bx	lr

000007fc <nand_001>:
     7fc:	e92d4010 	push	{r4, lr}
     800:	e3a0444e 	mov	r4, #1308622848	; 0x4e000000
     804:	e3844004 	orr	r4, r4, #4	; 0x4
     808:	e5943000 	ldr	r3, [r4]
     80c:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
     810:	e3822008 	orr	r2, r2, #8	; 0x8
     814:	e3c33002 	bic	r3, r3, #2	; 0x2
     818:	e5843000 	str	r3, [r4]
     81c:	e3e0306f 	mvn	r3, #111	; 0x6f
     820:	e5c23000 	strb	r3, [r2]
     824:	e3a0e44e 	mov	lr, #1308622848	; 0x4e000000
     828:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
     82c:	e38ee00c 	orr	lr, lr, #12	; 0xc
     830:	e3a03000 	mov	r3, #0	; 0x0
     834:	e3822010 	orr	r2, r2, #16	; 0x10
     838:	e5ce3000 	strb	r3, [lr]
     83c:	e1d230d0 	ldrsb	r3, [r2]
     840:	e5803000 	str	r3, [r0]
     844:	e1d230d0 	ldrsb	r3, [r2]
     848:	e5813000 	str	r3, [r1]
     84c:	e5943000 	ldr	r3, [r4]
     850:	e3833002 	orr	r3, r3, #2	; 0x2
     854:	e5843000 	str	r3, [r4]
     858:	e8bd4010 	pop	{r4, lr}
     85c:	e12fff1e 	bx	lr

00000860 <nand_002>:
     860:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
     864:	e24dd004 	sub	sp, sp, #4	; 0x4
     868:	e1a04002 	mov	r4, r2
     86c:	e3a0844e 	mov	r8, #1308622848	; 0x4e000000
     870:	e3888004 	orr	r8, r8, #4	; 0x4
     874:	e5983000 	ldr	r3, [r8]
     878:	e3a0e44e 	mov	lr, #1308622848	; 0x4e000000
     87c:	e0810280 	add	r0, r1, r0, lsl #5
     880:	e3833010 	orr	r3, r3, #16	; 0x10
     884:	e5883000 	str	r3, [r8]
     888:	e5983000 	ldr	r3, [r8]
     88c:	e3a0144e 	mov	r1, #1308622848	; 0x4e000000
     890:	e38ee008 	orr	lr, lr, #8	; 0x8
     894:	e3c33020 	bic	r3, r3, #32	; 0x20
     898:	e5883000 	str	r3, [r8]
     89c:	e5983000 	ldr	r3, [r8]
     8a0:	e3a02000 	mov	r2, #0	; 0x0
     8a4:	e381100c 	orr	r1, r1, #12	; 0xc
     8a8:	e3c33002 	bic	r3, r3, #2	; 0x2
     8ac:	e5883000 	str	r3, [r8]
     8b0:	e5ce2000 	strb	r2, [lr]
     8b4:	e5c12000 	strb	r2, [r1]
     8b8:	e1a03420 	lsr	r3, r0, #8
     8bc:	e5c10000 	strb	r0, [r1]
     8c0:	e5c13000 	strb	r3, [r1]
     8c4:	e1a03820 	lsr	r3, r0, #16
     8c8:	e5c13000 	strb	r3, [r1]
     8cc:	e58d2000 	str	r2, [sp]
     8d0:	ea000002 	b	8e0 <ja5c>

000008d4 <ba50>:
     8d4:	e59d3000 	ldr	r3, [sp]
     8d8:	e2833001 	add	r3, r3, #1	; 0x1
     8dc:	e58d3000 	str	r3, [sp]

000008e0 <ja5c>:
     8e0:	e59d3000 	ldr	r3, [sp]
     8e4:	e3530032 	cmp	r3, #50	; 0x32
     8e8:	bafffff9 	blt	8d4 <ba50>
     8ec:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
     8f0:	e3822020 	orr	r2, r2, #32	; 0x20

000008f4 <ba70>:
     8f4:	e5923000 	ldr	r3, [r2]
     8f8:	e3130004 	tst	r3, #4	; 0x4
     8fc:	0afffffc 	beq	8f4 <ba70>
     900:	e1a00004 	mov	r0, r4
     904:	ebffff4a 	bl	634 <nand_load_block>
     908:	e5983000 	ldr	r3, [r8]
     90c:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
     910:	e3822010 	orr	r2, r2, #16	; 0x10
     914:	e3833020 	orr	r3, r3, #32	; 0x20
     918:	e5883000 	str	r3, [r8]
     91c:	e5926000 	ldr	r6, [r2]
     920:	e5927000 	ldr	r7, [r2]
     924:	e592e000 	ldr	lr, [r2]
     928:	e3a014ff 	mov	r1, #-16777216	; 0xff000000
     92c:	e38110ff 	orr	r1, r1, #255	; 0xff
     930:	e1a0342e 	lsr	r3, lr, #8
     934:	e2030cff 	and	r0, r3, #65280	; 0xff00
     938:	e00e2001 	and	r2, lr, r1
     93c:	e20e30ff 	and	r3, lr, #255	; 0xff
     940:	e3a0444e 	mov	r4, #1308622848	; 0x4e000000
     944:	e20e1cff 	and	r1, lr, #65280	; 0xff00
     948:	e1802002 	orr	r2, r0, r2
     94c:	e3a0544e 	mov	r5, #1308622848	; 0x4e000000
     950:	e1833401 	orr	r3, r3, r1, lsl #8
     954:	e3844014 	orr	r4, r4, #20	; 0x14
     958:	e1a02422 	lsr	r2, r2, #8
     95c:	e3855018 	orr	r5, r5, #24	; 0x18
     960:	e5843000 	str	r3, [r4]
     964:	e5852000 	str	r2, [r5]
     968:	e5983000 	ldr	r3, [r8]
     96c:	e3a00001 	mov	r0, #1	; 0x1
     970:	e3833002 	orr	r3, r3, #2	; 0x2
     974:	e5883000 	str	r3, [r8]
     978:	e28dd004 	add	sp, sp, #4	; 0x4
     97c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
     980:	e12fff1e 	bx	lr

00000984 <nand_read>:
     984:	e92d4070 	push	{r4, r5, r6, lr}
     988:	e24dd004 	sub	sp, sp, #4	; 0x4
     98c:	e1a05002 	mov	r5, r2
     990:	e3a0444e 	mov	r4, #1308622848	; 0x4e000000
     994:	e3844004 	orr	r4, r4, #4	; 0x4
     998:	e5943000 	ldr	r3, [r4]
     99c:	e3a0e44e 	mov	lr, #1308622848	; 0x4e000000
     9a0:	e0811300 	add	r1, r1, r0, lsl #6
     9a4:	e3833010 	orr	r3, r3, #16	; 0x10
     9a8:	e5843000 	str	r3, [r4]
     9ac:	e5943000 	ldr	r3, [r4]
     9b0:	e3a0044e 	mov	r0, #1308622848	; 0x4e000000
     9b4:	e38ee008 	orr	lr, lr, #8	; 0x8
     9b8:	e3c33020 	bic	r3, r3, #32	; 0x20
     9bc:	e5843000 	str	r3, [r4]
     9c0:	e5943000 	ldr	r3, [r4]
     9c4:	e3a06000 	mov	r6, #0	; 0x0
     9c8:	e380000c 	orr	r0, r0, #12	; 0xc
     9cc:	e3c33002 	bic	r3, r3, #2	; 0x2
     9d0:	e5843000 	str	r3, [r4]
     9d4:	e5ce6000 	strb	r6, [lr]
     9d8:	e5c06000 	strb	r6, [r0]
     9dc:	e5c06000 	strb	r6, [r0]
     9e0:	e1a03421 	lsr	r3, r1, #8
     9e4:	e5c01000 	strb	r1, [r0]
     9e8:	e5c03000 	strb	r3, [r0]
     9ec:	e3a03030 	mov	r3, #48	; 0x30
     9f0:	e5ce3000 	strb	r3, [lr]
     9f4:	e58d6000 	str	r6, [sp]
     9f8:	ea000002 	b	a08 <bb84>

000009fc <bb78>:
     9fc:	e59d3000 	ldr	r3, [sp]
     a00:	e2833001 	add	r3, r3, #1	; 0x1
     a04:	e58d3000 	str	r3, [sp]

00000a08 <bb84>:
     a08:	e59d3000 	ldr	r3, [sp]
     a0c:	e35300fa 	cmp	r3, #250	; 0xfa
     a10:	bafffff9 	blt	9fc <bb78>
     a14:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
     a18:	e3822020 	orr	r2, r2, #32	; 0x20

00000a1c <bb98>:
     a1c:	e5923000 	ldr	r3, [r2]
     a20:	e3130004 	tst	r3, #4	; 0x4
     a24:	0afffffc 	beq	a1c <bb98>
     a28:	e1a00005 	mov	r0, r5
     a2c:	ebffff00 	bl	634 <nand_load_block>
     a30:	e2850c02 	add	r0, r5, #512	; 0x200
     a34:	ebfffefe 	bl	634 <nand_load_block>
     a38:	e2850b01 	add	r0, r5, #1024	; 0x400
     a3c:	ebfffefc 	bl	634 <nand_load_block>
     a40:	e2850c06 	add	r0, r5, #1536	; 0x600
     a44:	ebfffefa 	bl	634 <nand_load_block>
     a48:	e5943000 	ldr	r3, [r4]
     a4c:	e3833020 	orr	r3, r3, #32	; 0x20
     a50:	e5843000 	str	r3, [r4]
     a54:	e58d6000 	str	r6, [sp]
     a58:	e59d3000 	ldr	r3, [sp]
     a5c:	e3530040 	cmp	r3, #64	; 0x40
     a60:	aa000008 	bge	a88 <bc04>
     a64:	e3a0144e 	mov	r1, #1308622848	; 0x4e000000
     a68:	e3811010 	orr	r1, r1, #16	; 0x10

00000a6c <bbe8>:
     a6c:	e5913000 	ldr	r3, [r1]
     a70:	e59d2000 	ldr	r2, [sp]
     a74:	e2823001 	add	r3, r2, #1	; 0x1
     a78:	e58d3000 	str	r3, [sp]
     a7c:	e59d3000 	ldr	r3, [sp]
     a80:	e3530040 	cmp	r3, #64	; 0x40
     a84:	bafffff8 	blt	a6c <bbe8>

00000a88 <bc04>:
     a88:	e5943000 	ldr	r3, [r4]
     a8c:	e3a00001 	mov	r0, #1	; 0x1
     a90:	e3833002 	orr	r3, r3, #2	; 0x2
     a94:	e5843000 	str	r3, [r4]
     a98:	e28dd004 	add	sp, sp, #4	; 0x4
     a9c:	e8bd4070 	pop	{r4, r5, r6, lr}
     aa0:	e12fff1e 	bx	lr

00000aa4 <bc20>:
     aa4:	e24dd004 	sub	sp, sp, #4	; 0x4
     aa8:	e3a0144e 	mov	r1, #1308622848	; 0x4e000000
     aac:	e3811004 	orr	r1, r1, #4	; 0x4
     ab0:	e5913000 	ldr	r3, [r1]
     ab4:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
     ab8:	e3822008 	orr	r2, r2, #8	; 0x8
     abc:	e3c33002 	bic	r3, r3, #2	; 0x2
     ac0:	e5813000 	str	r3, [r1]
     ac4:	e3e03000 	mvn	r3, #0	; 0x0
     ac8:	e5c23000 	strb	r3, [r2]
     acc:	e3a03000 	mov	r3, #0	; 0x0
     ad0:	ea000001 	b	adc <bc58>

00000ad4 <bc50>:
     ad4:	e59d3000 	ldr	r3, [sp]
     ad8:	e2833001 	add	r3, r3, #1	; 0x1

00000adc <bc58>:
     adc:	e58d3000 	str	r3, [sp]
     ae0:	e59d3000 	ldr	r3, [sp]
     ae4:	e353000a 	cmp	r3, #10	; 0xa
     ae8:	bafffff9 	blt	ad4 <bc50>
     aec:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
     af0:	e3822020 	orr	r2, r2, #32	; 0x20

00000af4 <bc70>:
     af4:	e5923000 	ldr	r3, [r2]
     af8:	e3130004 	tst	r3, #4	; 0x4
     afc:	0afffffc 	beq	af4 <bc70>
     b00:	e5913000 	ldr	r3, [r1]
     b04:	e3833002 	orr	r3, r3, #2	; 0x2
     b08:	e5813000 	str	r3, [r1]
     b0c:	e28dd004 	add	sp, sp, #4	; 0x4
     b10:	e12fff1e 	bx	lr

00000b14 <nand_init>:
     b14:	e92d4000 	push	{lr}
     b18:	e3a03c77 	mov	r3, #30464	; 0x7700
     b1c:	e3833070 	orr	r3, r3, #112	; 0x70
     b20:	e3a0044e 	mov	r0, #1308622848	; 0x4e000000
     b24:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
     b28:	e5803000 	str	r3, [r0]
     b2c:	e3a03013 	mov	r3, #19	; 0x13
     b30:	e3822004 	orr	r2, r2, #4	; 0x4
     b34:	e3a0144e 	mov	r1, #1308622848	; 0x4e000000
     b38:	e5823000 	str	r3, [r2]
     b3c:	e3a03004 	mov	r3, #4	; 0x4
     b40:	e3811020 	orr	r1, r1, #32	; 0x20
     b44:	e5813000 	str	r3, [r1]
     b48:	ebffffd5 	bl	aa4 <bc20>
     b4c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
     b50:	e3833008 	orr	r3, r3, #8	; 0x8
     b54:	e3a02000 	mov	r2, #0	; 0x0
     b58:	e5c32000 	strb	r2, [r3]
     b5c:	e8bd4000 	pop	{lr}
     b60:	e12fff1e 	bx	lr

00000b64 <bce0>:
     b64:	e3a03000 	mov	r3, #0	; 0x0
     b68:	e1b02000 	movs	r2, r0
     b6c:	0a00002d 	beq	c28 <bda4>

00000b70 <bcec>:
     b70:	e1520421 	cmp	r2, r1, lsr #8
     b74:	91a02402 	lslls	r2, r2, #8
     b78:	3afffffc 	bcc	b70 <bcec>
     b7c:	e15200a1 	cmp	r2, r1, lsr #1
     b80:	8a000021 	bhi	c0c <bd88>
     b84:	e1520121 	cmp	r2, r1, lsr #2
     b88:	8a00001d 	bhi	c04 <bd80>
     b8c:	e15201a1 	cmp	r2, r1, lsr #3
     b90:	8a000018 	bhi	bf8 <bd74>
     b94:	e1520221 	cmp	r2, r1, lsr #4
     b98:	8a000013 	bhi	bec <bd68>
     b9c:	e15202a1 	cmp	r2, r1, lsr #5
     ba0:	8a00000e 	bhi	be0 <bd5c>
     ba4:	e1520321 	cmp	r2, r1, lsr #6
     ba8:	8a000009 	bhi	bd4 <bd50>
     bac:	e15203a1 	cmp	r2, r1, lsr #7
     bb0:	8a000004 	bhi	bc8 <bd44>

00000bb4 <bd30>:
     bb4:	81a02422 	lsrhi	r2, r2, #8
     bb8:	e1510382 	cmp	r1, r2, lsl #7
     bbc:	e0a33003 	adc	r3, r3, r3
     bc0:	20411382 	subcs	r1, r1, r2, lsl #7
     bc4:	e1510302 	cmp	r1, r2, lsl #6

00000bc8 <bd44>:
     bc8:	e0a33003 	adc	r3, r3, r3
     bcc:	20411302 	subcs	r1, r1, r2, lsl #6
     bd0:	e1510282 	cmp	r1, r2, lsl #5

00000bd4 <bd50>:
     bd4:	e0a33003 	adc	r3, r3, r3
     bd8:	20411282 	subcs	r1, r1, r2, lsl #5
     bdc:	e1510202 	cmp	r1, r2, lsl #4

00000be0 <bd5c>:
     be0:	e0a33003 	adc	r3, r3, r3
     be4:	20411202 	subcs	r1, r1, r2, lsl #4
     be8:	e1510182 	cmp	r1, r2, lsl #3

00000bec <bd68>:
     bec:	e0a33003 	adc	r3, r3, r3
     bf0:	20411182 	subcs	r1, r1, r2, lsl #3
     bf4:	e1510102 	cmp	r1, r2, lsl #2

00000bf8 <bd74>:
     bf8:	e0a33003 	adc	r3, r3, r3
     bfc:	20411102 	subcs	r1, r1, r2, lsl #2
     c00:	e1510082 	cmp	r1, r2, lsl #1

00000c04 <bd80>:
     c04:	e0a33003 	adc	r3, r3, r3
     c08:	20411082 	subcs	r1, r1, r2, lsl #1

00000c0c <bd88>:
     c0c:	e1510002 	cmp	r1, r2
     c10:	e0a33003 	adc	r3, r3, r3
     c14:	20411002 	subcs	r1, r1, r2
     c18:	e1520000 	cmp	r2, r0
     c1c:	1affffe4 	bne	bb4 <bd30>
     c20:	e1a00003 	mov	r0, r3
     c24:	e12fff1e 	bx	lr

00000c28 <bda4>:
     c28:	e59fc010 	ldr	ip, [pc, #16]	; c40 <.xdbc>

00000c2c <bda8>:
     c2c:	e59f0010 	ldr	r0, [pc, #16]	; c44 <.xdc0>
     c30:	e3a01000 	mov	r1, #0	; 0x0
     c34:	e3a02000 	mov	r2, #0	; 0x0
     c38:	e3a03000 	mov	r3, #0	; 0x0
     c3c:	e1a0f00c 	mov	pc, ip

00000c40 <.xdbc>:
     c40:	00000c48 	.word	0x00000c48

00000c44 <.xdc0>:
     c44:	c0000094 	.word	0xc0000094

00000c48 <xdc4>:
     c48:	e92d4010 	push	{r4, lr}
     c4c:	e3a00103 	mov	r0, #-1073741824	; 0xc0000000
     c50:	e59f4020 	ldr	r4, [pc, #32]	; c78 <.xdf4>
     c54:	e3800094 	orr	r0, r0, #148	; 0x94
     c58:	e3a03000 	mov	r3, #0	; 0x0
     c5c:	e3a02000 	mov	r2, #0	; 0x0
     c60:	e3a01000 	mov	r1, #0	; 0x0
     c64:	e1a0e00f 	mov	lr, pc
     c68:	e12fff14 	bx	r4
     c6c:	e3e00000 	mvn	r0, #0	; 0x0
     c70:	e8bd4010 	pop	{r4, lr}
     c74:	e12fff1e 	bx	lr

00000c78 <.xdf4>:
     c78:	f000fe38 	.word	0xf000fe38

00000c7c <xdf8>:
     c7c:	012e0003 	.word	0x012e0003

00000c80 <xdfc>:
     c80:	00001000 	.word	0x00001000

00000c84 <xe00>:
     c84:	fffff000 	.word	0xfffff000

00000c88 <xe04>:
     c88:	00010005 	.word	0x00010005

00000c8c <xe08>:
     c8c:	00010000 	.word	0x00010000

00000c90 <xe0c>:
     c90:	00005000 	.word	0x00005000

00000c94 <xe18>:
     c94:	78f2ce7f 	.word	0x78f2ce7f

00000c98 <xe34>:
     c98:	00002000 	.word	0x00002000

00000c9c <xe38>:
     c9c:	00000040 	.word	0x00000040

00000ca0 <xe3c>:
     ca0:	00001600 	.word	0x00001600

00000ca4 <xe40>:
     ca4:	000004f8 	.word	0x000004f8

00000ca8 <xe44>:
     ca8:	00004000 	.word	0x00004000

00000cac <xe48>:
     cac:	00000028 	.word	0x00000028

00000cb0 <xe4c>:
     cb0:	00001750 	.word	0x00001750

00000cb4 <xe50>:
     cb4:	0000001c 	.word	0x0000001c

00000cb8 <xe64>:
     cb8:	00000009 	.word	0x00000009

00000cbc <xe68>:
     cbc:	00000df8 	.word	0x00000df8

00000cc0 <xe6c>:
     cc0:	00001000 	.word	0x00001000

00000cc4 <xe70>:
     cc4:	00000e00 	.word	0x00000e00

00000cc8 <xe74>:
     cc8:	00001000 	.word	0x00001000

00000ccc <xe78>:
     ccc:	00000000 	.word	0x00000000

00000cd0 <xe7c>:
     cd0:	60000020 	.word	0x60000020

00000cd4 <xe80>:
     cd4:	00000014 	.word	0x00000014

00000cd8 <xe84>:
     cd8:	00002000 	.word	0x00002000

00000cdc <xe88>:
     cdc:	00000000 	.word	0x00000000

00000ce0 <xe8c>:
     ce0:	00001df8 	.word	0x00001df8

00000ce4 <xe90>:
     ce4:	33ff0000 	.word	0x33ff0000

00000ce8 <xe94>:
     ce8:	c0000040 	.word	0xc0000040

00000cec <xe98>:
     cec:	00000040 	.word	0x00000040

00000cf0 <xe9c>:
     cf0:	00002000 	.word	0x00002000

00000cf4 <xea0>:
     cf4:	00000200 	.word	0x00000200

00000cf8 <xea4>:
     cf8:	00002000 	.word	0x00002000

00000cfc <xea8>:
     cfc:	00000000 	.word	0x00000000

00000d00 <xeac>:
     d00:	40000040 	.word	0x40000040

00000d04 <xeb0>:
     d04:	652e6b6e 	.word	0x652e6b6e

00000d08 <xeb4>:
     d08:	00006578 	.word	0x00006578

00000d0c <xeb8>:
     d0c:	02000000 	.word	0x02000000

00000d10 <xebc>:
     d10:	02000000 	.word	0x02000000

00000d14 <xec0>:
     d14:	00000000 	.word	0x00000000

00000d18 <xec4>:
     d18:	00002040 	.word	0x00002040

00000d1c <xec8>:
     d1c:	00000001 	.word	0x00000001

00000d20 <xecc>:
     d20:	33ff0000 	.word	0x33ff0000

00000d24 <xed0>:
     d24:	33ff1000 	.word	0x33ff1000

00000d28 <xed4>:
     d28:	33ff1000 	.word	0x33ff1000

00000d2c <xed8>:
     d2c:	00000001 	.word	0x00000001

00000d30 <xedc>:
     d30:	00001f2c 	.word	0x00001f2c

00000d34 <x1000>:
     d34:	ea00004d 	b	e70 <b22b4>

00000d38 <nand_read1>:
     d38:	e92d0ffe 	push	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
     d3c:	e59f10f4 	ldr	r1, [pc, #244]	; e38 <.nand_nfdata_add>
     d40:	e3a02c02 	mov	r2, #512	; 0x200

00000d44 <b2188>:
     d44:	e5d14000 	ldrb	r4, [r1]
     d48:	e5d13000 	ldrb	r3, [r1]
     d4c:	e1844403 	orr	r4, r4, r3, lsl #8
     d50:	e5d13000 	ldrb	r3, [r1]
     d54:	e1844803 	orr	r4, r4, r3, lsl #16
     d58:	e5d13000 	ldrb	r3, [r1]
     d5c:	e1844c03 	orr	r4, r4, r3, lsl #24
     d60:	e5d15000 	ldrb	r5, [r1]
     d64:	e5d13000 	ldrb	r3, [r1]
     d68:	e1855403 	orr	r5, r5, r3, lsl #8
     d6c:	e5d13000 	ldrb	r3, [r1]
     d70:	e1855803 	orr	r5, r5, r3, lsl #16
     d74:	e5d13000 	ldrb	r3, [r1]
     d78:	e1855c03 	orr	r5, r5, r3, lsl #24
     d7c:	e5d16000 	ldrb	r6, [r1]
     d80:	e5d13000 	ldrb	r3, [r1]
     d84:	e1866403 	orr	r6, r6, r3, lsl #8
     d88:	e5d13000 	ldrb	r3, [r1]
     d8c:	e1866803 	orr	r6, r6, r3, lsl #16
     d90:	e5d13000 	ldrb	r3, [r1]
     d94:	e1866c03 	orr	r6, r6, r3, lsl #24
     d98:	e5d17000 	ldrb	r7, [r1]
     d9c:	e5d13000 	ldrb	r3, [r1]
     da0:	e1877403 	orr	r7, r7, r3, lsl #8
     da4:	e5d13000 	ldrb	r3, [r1]
     da8:	e1877803 	orr	r7, r7, r3, lsl #16
     dac:	e5d13000 	ldrb	r3, [r1]
     db0:	e1877c03 	orr	r7, r7, r3, lsl #24
     db4:	e5d18000 	ldrb	r8, [r1]
     db8:	e5d13000 	ldrb	r3, [r1]
     dbc:	e1888403 	orr	r8, r8, r3, lsl #8
     dc0:	e5d13000 	ldrb	r3, [r1]
     dc4:	e1888803 	orr	r8, r8, r3, lsl #16
     dc8:	e5d13000 	ldrb	r3, [r1]
     dcc:	e1888c03 	orr	r8, r8, r3, lsl #24
     dd0:	e5d19000 	ldrb	r9, [r1]
     dd4:	e5d13000 	ldrb	r3, [r1]
     dd8:	e1899403 	orr	r9, r9, r3, lsl #8
     ddc:	e5d13000 	ldrb	r3, [r1]
     de0:	e1899803 	orr	r9, r9, r3, lsl #16
     de4:	e5d13000 	ldrb	r3, [r1]
     de8:	e1899c03 	orr	r9, r9, r3, lsl #24
     dec:	e5d1a000 	ldrb	sl, [r1]
     df0:	e5d13000 	ldrb	r3, [r1]
     df4:	e18aa403 	orr	sl, sl, r3, lsl #8
     df8:	e5d13000 	ldrb	r3, [r1]
     dfc:	e18aa803 	orr	sl, sl, r3, lsl #16
     e00:	e5d13000 	ldrb	r3, [r1]
     e04:	e18aac03 	orr	sl, sl, r3, lsl #24
     e08:	e5d1b000 	ldrb	fp, [r1]
     e0c:	e5d13000 	ldrb	r3, [r1]
     e10:	e18bb403 	orr	fp, fp, r3, lsl #8
     e14:	e5d13000 	ldrb	r3, [r1]
     e18:	e18bb803 	orr	fp, fp, r3, lsl #16
     e1c:	e5d13000 	ldrb	r3, [r1]
     e20:	e18bbc03 	orr	fp, fp, r3, lsl #24
     e24:	e8a00ff0 	stmia	r0!, {r4, r5, r6, r7, r8, r9, sl, fp}
     e28:	e2522020 	subs	r2, r2, #32	; 0x20
     e2c:	1affffc4 	bne	d44 <b2188>
     e30:	e8bd0ffe 	pop	{r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
     e34:	e12fff1e 	bx	lr

00000e38 <.nand_nfdata_add>:
     e38:	4e000010 	.word	0x4e000010

00000e3c <test_02>:
     e3c:	e59f2028 	ldr	r2, [pc, #40]	; e6c <.x22b0>
     e40:	e3a03205 	mov	r3, #1342177280	; 0x50000000
     e44:	e0422003 	sub	r2, r2, r3
     e48:	e3a01070 	mov	r1, #112	; 0x70
     e4c:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
     e50:	e1a00000 	nop			(mov r0,r0)
     e54:	e1a0f002 	mov	pc, r2
     e58:	e1a00000 	nop			(mov r0,r0)
     e5c:	e3a02000 	mov	r2, #0	; 0x0
     e60:	ee082f17 	mcr	15, 0, r2, cr8, cr7, {0}
     e64:	e1a0f000 	mov	pc, r0
     e68:	e12fff1e 	bx	lr

00000e6c <.x22b0>:
     e6c:	3007c2a0 	.word	0x3007c2a0

00000e70 <b22b4>:
     e70:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     e74:	e24dd00c 	sub	sp, sp, #12	; 0xc
     e78:	e3a09000 	mov	r9, #0	; 0x0
     e7c:	e3a0a000 	mov	sl, #0	; 0x0
     e80:	eb000083 	bl	1094 <b262c>
     e84:	ebfffffe 	bl	0 <b29b0>
     e88:	e28d1008 	add	r1, sp, #8	; 0x8
     e8c:	e28d0004 	add	r0, sp, #4	; 0x4
     e90:	ebfffffe 	bl	0 <b2694>
     e94:	e59d3004 	ldr	r3, [sp, #4]
     e98:	e59f41f0 	ldr	r4, [pc, #496]	; 1090 <.x2628>
     e9c:	e59d2008 	ldr	r2, [sp, #8]
     ea0:	e20310ff 	and	r1, r3, #255	; 0xff
     ea4:	e3a0bb3b 	mov	fp, #60416	; 0xec00
     ea8:	e3a00b3b 	mov	r0, #60416	; 0xec00
     eac:	e35100ec 	cmp	r1, #236	; 0xec
     eb0:	e38bb076 	orr	fp, fp, #118	; 0x76
     eb4:	e38000f1 	orr	r0, r0, #241	; 0xf1
     eb8:	1a00000f 	bne	efc <checkPowerBtn>
     ebc:	e20230ff 	and	r3, r2, #255	; 0xff
     ec0:	e3530076 	cmp	r3, #118	; 0x76
     ec4:	03a03901 	moveq	r3, #16384	; 0x4000
     ec8:	03a02c02 	moveq	r2, #512	; 0x200
     ecc:	01a0900b 	moveq	r9, fp
     ed0:	0a000007 	beq	ef4 <b2338>
     ed4:	e35100ec 	cmp	r1, #236	; 0xec
     ed8:	1a000007 	bne	efc <checkPowerBtn>
     edc:	e20230ff 	and	r3, r2, #255	; 0xff
     ee0:	e35300f1 	cmp	r3, #241	; 0xf1
     ee4:	1a000004 	bne	efc <checkPowerBtn>
     ee8:	e3a03802 	mov	r3, #131072	; 0x20000
     eec:	e3a02b02 	mov	r2, #2048	; 0x800
     ef0:	e1a09000 	mov	r9, r0

00000ef4 <b2338>:
     ef4:	e5842008 	str	r2, [r4, #8]
     ef8:	e584300c 	str	r3, [r4, #12]

00000efc <checkPowerBtn>:
     efc:	e3a01456 	mov	r1, #1442840576	; 0x56000000
     f00:	e3811050 	orr	r1, r1, #80	; 0x50
     f04:	e5912000 	ldr	r2, [r1]
     f08:	e3a03cff 	mov	r3, #65280	; 0xff00
     f0c:	e38330fc 	orr	r3, r3, #252	; 0xfc
     f10:	e3a00456 	mov	r0, #1442840576	; 0x56000000
     f14:	e0023003 	and	r3, r2, r3
     f18:	e3800054 	orr	r0, r0, #84	; 0x54
     f1c:	e5813000 	str	r3, [r1]
     f20:	e5903000 	ldr	r3, [r0]
     f24:	e2033001 	and	r3, r3, #1	; 0x1
     f28:	e3530001 	cmp	r3, #1	; 0x1
     f2c:	0a000005 	beq	f48 <power_btnPressed>
     f30:	e5903000 	ldr	r3, [r0]
     f34:	e3130010 	tst	r3, #16	; 0x10
     f38:	03a05001 	moveq	r5, #1	; 0x1
     f3c:	0a000002 	beq	f4c <home_btnPressed>
     f40:	e3a05000 	mov	r5, #0	; 0x0
     f44:	ea000000 	b	f4c <home_btnPressed>

00000f48 <power_btnPressed>:
     f48:	e3a05002 	mov	r5, #2	; 0x2

00000f4c <home_btnPressed>:
     f4c:	e594800c 	ldr	r8, [r4, #12]
     f50:	e5940008 	ldr	r0, [r4, #8]
     f54:	e1a01008 	mov	r1, r8
     f58:	eb000097 	bl	11bc <b2a00>
     f5c:	e1a06000 	mov	r6, r0
     f60:	e5846004 	str	r6, [r4, #4]
     f64:	e3550000 	cmp	r5, #0	; 0x0
     f68:	1a00000f 	bne	fac <b23f0>
     f6c:	e3a01701 	mov	r1, #262144	; 0x40000
     f70:	e1a00008 	mov	r0, r8
     f74:	eb000090 	bl	11bc <b2a00>
     f78:	e0030690 	mul	r3, r0, r6
     f7c:	e5940008 	ldr	r0, [r4, #8]
     f80:	e3a01701 	mov	r1, #262144	; 0x40000
     f84:	e5843000 	str	r3, [r4]
     f88:	eb00008b 	bl	11bc <b2a00>
     f8c:	e3510000 	cmp	r1, #0	; 0x0
     f90:	13a03001 	movne	r3, #1	; 0x1
     f94:	03a03000 	moveq	r3, #0	; 0x0
     f98:	e0802003 	add	r2, r0, r3
     f9c:	e3a07203 	mov	r7, #805306368	; 0x30000000
     fa0:	e58d2000 	str	r2, [sp]
     fa4:	e3877a31 	orr	r7, r7, #200704	; 0x31000
     fa8:	ea000019 	b	1014 <b2458>

00000fac <b23f0>:
     fac:	e5940008 	ldr	r0, [r4, #8]
     fb0:	e3550001 	cmp	r5, #1	; 0x1
     fb4:	1a00000b 	bne	fe8 <home_btnNotPressed>
     fb8:	e3a01905 	mov	r1, #81920	; 0x14000
     fbc:	eb00007e 	bl	11bc <b2a00>
     fc0:	e1a03000 	mov	r3, r0
     fc4:	e5940008 	ldr	r0, [r4, #8]
     fc8:	e3a01902 	mov	r1, #32768	; 0x8000
     fcc:	e5843000 	str	r3, [r4]
     fd0:	eb000079 	bl	11bc <b2a00>
     fd4:	e1a02000 	mov	r2, r0
     fd8:	e3a07203 	mov	r7, #805306368	; 0x30000000
     fdc:	e58d2000 	str	r2, [sp]
     fe0:	e3877a22 	orr	r7, r7, #139264	; 0x22000
     fe4:	ea00000a 	b	1014 <b2458>

00000fe8 <home_btnNotPressed>:
     fe8:	e3a01901 	mov	r1, #16384	; 0x4000
     fec:	eb000072 	bl	11bc <b2a00>
     ff0:	e1a03000 	mov	r3, r0
     ff4:	e5940008 	ldr	r0, [r4, #8]
     ff8:	e3a01801 	mov	r1, #65536	; 0x10000
     ffc:	e5843000 	str	r3, [r4]
    1000:	eb00006d 	bl	11bc <b2a00>
    1004:	e1a03000 	mov	r3, r0
    1008:	e3a07203 	mov	r7, #805306368	; 0x30000000
    100c:	e58d3000 	str	r3, [sp]
    1010:	e3877a21 	orr	r7, r7, #135168	; 0x21000

00001014 <b2458>:
    1014:	e59f3070 	ldr	r3, [pc, #112]	; 108c <.x2624>
    1018:	e3550000 	cmp	r5, #0	; 0x0
    101c:	e5837000 	str	r7, [r3]
    1020:	1afffffe 	bne	0 <b24ec>
    1024:	e3a06000 	mov	r6, #0	; 0x0
    1028:	e3a05000 	mov	r5, #0	; 0x0
    102c:	e159000b 	cmp	r9, fp
    1030:	1a000005 	bne	104c <b2490>
    1034:	e1a02007 	mov	r2, r7
    1038:	e3a01000 	mov	r1, #0	; 0x0
    103c:	e1a00005 	mov	r0, r5
    1040:	eb00001a 	bl	10b0 <nand_003>
    1044:	e2855008 	add	r5, r5, #8	; 0x8
    1048:	ea000008 	b	1070 <b24b4>

0000104c <b2490>:
    104c:	e3a03b3b 	mov	r3, #60416	; 0xec00
    1050:	e38330f1 	orr	r3, r3, #241	; 0xf1
    1054:	e1590003 	cmp	r9, r3
    1058:	1afffffe 	bne	0 <b24bc>
    105c:	e1a02007 	mov	r2, r7
    1060:	e3a01000 	mov	r1, #0	; 0x0
    1064:	e1a00005 	mov	r0, r5
    1068:	eb000050 	bl	11b0 <b27f8>
    106c:	e2855001 	add	r5, r5, #1	; 0x1

00001070 <b24b4>:
    1070:	e594800c 	ldr	r8, [r4, #12]
    1074:	e1a0e00f 	mov	lr, pc
    1078:	e12fff13 	bx	r3
    107c:	e3a00000 	mov	r0, #0	; 0x0
    1080:	e28dd00c 	add	sp, sp, #12	; 0xc

00001084 <b261c>:
    1084:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1088:	e12fff1e 	bx	lr

0000108c <.x2624>:
    108c:	33ff0068 	.word	0x33ff0068

00001090 <.x2628>:
    1090:	33ff0058 	.word	0x33ff0058

00001094 <b262c>:
    1094:	e12fff1e 	bx	lr

00001098 <b2630>:
    1098:	e5d03000 	ldrb	r3, [r0]
    109c:	ea000000 	b	10a4 <b263c>

000010a0 <b2638>:
    10a0:	e5f03001 	ldrb	r3, [r0, #1]!

000010a4 <b263c>:
    10a4:	e3530000 	cmp	r3, #0	; 0x0
    10a8:	1afffffc 	bne	10a0 <b2638>
    10ac:	e12fff1e 	bx	lr

000010b0 <nand_003>:
    10b0:	e92d4030 	push	{r4, r5, lr}
    10b4:	e24dd004 	sub	sp, sp, #4	; 0x4
    10b8:	e1a05002 	mov	r5, r2
    10bc:	e3a0444e 	mov	r4, #1308622848	; 0x4e000000
    10c0:	e3844004 	orr	r4, r4, #4	; 0x4
    10c4:	e5943000 	ldr	r3, [r4]
    10c8:	e3a0e44e 	mov	lr, #1308622848	; 0x4e000000
    10cc:	e0810280 	add	r0, r1, r0, lsl #5
    10d0:	e3833010 	orr	r3, r3, #16	; 0x10
    10d4:	e5843000 	str	r3, [r4]
    10d8:	e5943000 	ldr	r3, [r4]
    10dc:	e3a0144e 	mov	r1, #1308622848	; 0x4e000000
    10e0:	e38ee008 	orr	lr, lr, #8	; 0x8
    10e4:	e3c33020 	bic	r3, r3, #32	; 0x20
    10e8:	e5843000 	str	r3, [r4]
    10ec:	e5943000 	ldr	r3, [r4]
    10f0:	e3a02000 	mov	r2, #0	; 0x0
    10f4:	e381100c 	orr	r1, r1, #12	; 0xc
    10f8:	e3c33002 	bic	r3, r3, #2	; 0x2
    10fc:	e5843000 	str	r3, [r4]
    1100:	e5ce2000 	strb	r2, [lr]
    1104:	e5c12000 	strb	r2, [r1]
    1108:	e1a03420 	lsr	r3, r0, #8
    110c:	e5c10000 	strb	r0, [r1]
    1110:	e5c13000 	strb	r3, [r1]
    1114:	e1a03820 	lsr	r3, r0, #16
    1118:	e5c13000 	strb	r3, [r1]
    111c:	e58d2000 	str	r2, [sp]
    1120:	eafffffe 	b	0 <b2778>
    1124:	e59d3000 	ldr	r3, [sp]
    1128:	e2833001 	add	r3, r3, #1	; 0x1
    112c:	e58d3000 	str	r3, [sp]
    1130:	e59d3000 	ldr	r3, [sp]
    1134:	e3530032 	cmp	r3, #50	; 0x32
    1138:	bafffffe 	blt	0 <b276c>
    113c:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
    1140:	e3822020 	orr	r2, r2, #32	; 0x20
    1144:	e5923000 	ldr	r3, [r2]
    1148:	e3130004 	tst	r3, #4	; 0x4
    114c:	0afffffe 	beq	0 <b278c>
    1150:	e1a00005 	mov	r0, r5
    1154:	ebfffef7 	bl	d38 <nand_read1>
    1158:	e5943000 	ldr	r3, [r4]
    115c:	e3a0244e 	mov	r2, #1308622848	; 0x4e000000
    1160:	e3822010 	orr	r2, r2, #16	; 0x10
    1164:	e3833020 	orr	r3, r3, #32	; 0x20
    1168:	e5843000 	str	r3, [r4]
    116c:	e5923000 	ldr	r3, [r2]
    1170:	e5922000 	ldr	r2, [r2]
    1174:	e5941000 	ldr	r1, [r4]
    1178:	e1a03422 	lsr	r3, r2, #8
    117c:	e3812002 	orr	r2, r1, #2	; 0x2
    1180:	e5842000 	str	r2, [r4]
    1184:	e21330ff 	ands	r3, r3, #255	; 0xff
    1188:	1a000003 	bne	119c <b27e4>
    118c:	e59f0018 	ldr	r0, [pc, #24]	; 11ac <.x27f4>
    1190:	ebffffc0 	bl	1098 <b2630>
    1194:	e3a00000 	mov	r0, #0	; 0x0
    1198:	ea000000 	b	11a0 <b27e8>

0000119c <b27e4>:
    119c:	e3a00001 	mov	r0, #1	; 0x1

000011a0 <b27e8>:
    11a0:	e28dd004 	add	sp, sp, #4	; 0x4
    11a4:	e8bd4030 	pop	{r4, r5, lr}
    11a8:	e12fff1e 	bx	lr

000011ac <.x27f4>:
    11ac:	3007c148 	.word	0x3007c148

000011b0 <b27f8>:
    11b0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    11b4:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    11b8:	e12fff1e 	bx	lr

000011bc <b2a00>:
    11bc:	e3a03000 	mov	r3, #0	; 0x0
    11c0:	e1b02000 	movs	r2, r0
    11c4:	0a00002d 	beq	1280 <b2ac4>

000011c8 <b2a0c>:
    11c8:	e1520421 	cmp	r2, r1, lsr #8
    11cc:	91a02402 	lslls	r2, r2, #8
    11d0:	3afffffc 	bcc	11c8 <b2a0c>
    11d4:	e15200a1 	cmp	r2, r1, lsr #1
    11d8:	8a000021 	bhi	1264 <b2aa8>
    11dc:	e1520121 	cmp	r2, r1, lsr #2
    11e0:	8a00001d 	bhi	125c <b2aa0>
    11e4:	e15201a1 	cmp	r2, r1, lsr #3
    11e8:	8a000018 	bhi	1250 <b2a94>
    11ec:	e1520221 	cmp	r2, r1, lsr #4
    11f0:	8a000013 	bhi	1244 <b2a88>
    11f4:	e15202a1 	cmp	r2, r1, lsr #5
    11f8:	8a00000e 	bhi	1238 <b2a7c>
    11fc:	e1520321 	cmp	r2, r1, lsr #6
    1200:	8a000009 	bhi	122c <b2a70>
    1204:	e15203a1 	cmp	r2, r1, lsr #7
    1208:	8a000004 	bhi	1220 <b2a64>

0000120c <b2a50>:
    120c:	81a02422 	lsrhi	r2, r2, #8
    1210:	e1510382 	cmp	r1, r2, lsl #7
    1214:	e0a33003 	adc	r3, r3, r3
    1218:	20411382 	subcs	r1, r1, r2, lsl #7
    121c:	e1510302 	cmp	r1, r2, lsl #6

00001220 <b2a64>:
    1220:	e0a33003 	adc	r3, r3, r3
    1224:	20411302 	subcs	r1, r1, r2, lsl #6
    1228:	e1510282 	cmp	r1, r2, lsl #5

0000122c <b2a70>:
    122c:	e0a33003 	adc	r3, r3, r3
    1230:	20411282 	subcs	r1, r1, r2, lsl #5
    1234:	e1510202 	cmp	r1, r2, lsl #4

00001238 <b2a7c>:
    1238:	e0a33003 	adc	r3, r3, r3
    123c:	20411202 	subcs	r1, r1, r2, lsl #4
    1240:	e1510182 	cmp	r1, r2, lsl #3

00001244 <b2a88>:
    1244:	e0a33003 	adc	r3, r3, r3
    1248:	20411182 	subcs	r1, r1, r2, lsl #3
    124c:	e1510102 	cmp	r1, r2, lsl #2

00001250 <b2a94>:
    1250:	e0a33003 	adc	r3, r3, r3
    1254:	20411102 	subcs	r1, r1, r2, lsl #2
    1258:	e1510082 	cmp	r1, r2, lsl #1

0000125c <b2aa0>:
    125c:	e0a33003 	adc	r3, r3, r3
    1260:	20411082 	subcs	r1, r1, r2, lsl #1

00001264 <b2aa8>:
    1264:	e1510002 	cmp	r1, r2
    1268:	e0a33003 	adc	r3, r3, r3
    126c:	20411002 	subcs	r1, r1, r2
    1270:	e1520000 	cmp	r2, r0
    1274:	1affffe4 	bne	120c <b2a50>
    1278:	e1a00003 	mov	r0, r3
    127c:	e12fff1e 	bx	lr

00001280 <b2ac4>:
    1280:	e59fc010 	ldr	ip, [pc, #16]	; 1298 <.x2adc>
    1284:	e59f0010 	ldr	r0, [pc, #16]	; 129c <.x2ae0>
    1288:	e3a01000 	mov	r1, #0	; 0x0
    128c:	e3a02000 	mov	r2, #0	; 0x0
    1290:	e3a03000 	mov	r3, #0	; 0x0
    1294:	e1a0f00c 	mov	pc, ip

00001298 <.x2adc>:
    1298:	3007cae4 	.word	0x3007cae4

0000129c <.x2ae0>:
    129c:	c0000094 	.word	0xc0000094

000012a0 <.x2b14>:
    12a0:	f000fe38 	.word	0xf000fe38

000012a4 <b2b18>:
    12a4:	00000020 	.word	0x00000020
    12a8:	00000021 	.word	0x00000021
    12ac:	00000022 	.word	0x00000022
    12b0:	00000023 	.word	0x00000023
    12b4:	00000025 	.word	0x00000025
    12b8:	00000027 	.word	0x00000027
    12bc:	00000028 	.word	0x00000028
    12c0:	00000029 	.word	0x00000029
    12c4:	0000002a 	.word	0x0000002a
    12c8:	0000002b 	.word	0x0000002b
    12cc:	0000002f 	.word	0x0000002f
    12d0:	00000020 	.word	0x00000020
    12d4:	00000021 	.word	0x00000021
    12d8:	00000022 	.word	0x00000022
    12dc:	00000023 	.word	0x00000023
    12e0:	00000025 	.word	0x00000025
    12e4:	00000027 	.word	0x00000027
    12e8:	00000028 	.word	0x00000028
    12ec:	00000029 	.word	0x00000029
    12f0:	0000002a 	.word	0x0000002a
    12f4:	0000002b 	.word	0x0000002b
    12f8:	0000002f 	.word	0x0000002f
    12fc:	012e0003 	.word	0x012e0003
    1300:	000012b4 	.word	0x000012b4
    1304:	3007b000 	.word	0x3007b000
    1308:	00010005 	.word	0x00010005
    130c:	00010000 	.word	0x00010000
    1310:	00005000 	.word	0x00005000

00001314 <b4000>:
    1314:	eaffffff 	b	1318 <b5000>

00001318 <b5000>:
    1318:	eaffffff 	b	131c <b5148>

0000131c <b5148>:
    131c:	e24fbf53 	sub	fp, pc, #332	; 0x14c

00001320 <b514c>:
    1320:	e59fa0fc 	ldr	sl, [pc, #252]	; 1424 <.x5250>
    1324:	e28aaa02 	add	sl, sl, #8192	; 0x2000
    1328:	e3a0000e 	mov	r0, #14	; 0xe
    132c:	e3800b01 	orr	r0, r0, #1024	; 0x400

00001330 <b515c>:
    1330:	e1a0100b 	mov	r1, fp

00001334 <b5160>:
    1334:	e4912004 	ldr	r2, [r1], #4
    1338:	e4913004 	ldr	r3, [r1], #4
    133c:	e4914004 	ldr	r4, [r1], #4
    1340:	e3540000 	cmp	r4, #0	; 0x0
    1344:	0a00000d 	beq	1380 <b51ac>
    1348:	e59f50d8 	ldr	r5, [pc, #216]	; 1428 <.x5254>
    134c:	e0022005 	and	r2, r2, r5
    1350:	e59f50d4 	ldr	r5, [pc, #212]	; 142c <.x5258>
    1354:	e0033005 	and	r3, r3, r5
    1358:	e08a2922 	add	r2, sl, r2, lsr #18
    135c:	e0800003 	add	r0, r0, r3

00001360 <b518c>:
    1360:	e4820004 	str	r0, [r2], #4
    1364:	e2800601 	add	r0, r0, #1048576	; 0x100000
    1368:	e2444001 	sub	r4, r4, #1	; 0x1
    136c:	e3540000 	cmp	r4, #0	; 0x0
    1370:	1afffffa 	bne	1360 <b518c>
    1374:	e3c0020f 	bic	r0, r0, #-268435456	; 0xf0000000
    1378:	e3c006ff 	bic	r0, r0, #267386880	; 0xff00000
    137c:	eaffffec 	b	1334 <b5160>

00001380 <b51ac>:
    1380:	e3100008 	tst	r0, #8	; 0x8
    1384:	e3c0000c 	bic	r0, r0, #12	; 0xc
    1388:	e28aab02 	add	sl, sl, #2048	; 0x800
    138c:	1affffe7 	bne	1330 <b515c>
    1390:	e24aaa03 	sub	sl, sl, #12288	; 0x3000
    1394:	e59f0088 	ldr	r0, [pc, #136]	; 1424 <.x5250>
    1398:	e59f1090 	ldr	r1, [pc, #144]	; 1430 <.x525c>
    139c:	e5801000 	str	r1, [r0]
    13a0:	e2800b02 	add	r0, r0, #2048	; 0x800
    13a4:	e59f1088 	ldr	r1, [pc, #136]	; 1434 <.x5260>
    13a8:	e5801000 	str	r1, [r0]
    13ac:	e59fa070 	ldr	sl, [pc, #112]	; 1424 <.x5250>
    13b0:	e3a00203 	mov	r0, #805306368	; 0x30000000
    13b4:	e28aab03 	add	sl, sl, #3072	; 0xc00
    13b8:	e280001e 	add	r0, r0, #30	; 0x1e
    13bc:	e3800b01 	orr	r0, r0, #1024	; 0x400
    13c0:	e3a01000 	mov	r1, #0	; 0x0
    13c4:	e3a03040 	mov	r3, #64	; 0x40

000013c8 <b51f4>:
    13c8:	e1a02001 	mov	r2, r1
    13cc:	e3520c02 	cmp	r2, #512	; 0x200
    13d0:	e08a2102 	add	r2, sl, r2, lsl #2
    13d4:	35820000 	strcc	r0, [r2]
    13d8:	e2800601 	add	r0, r0, #1048576	; 0x100000
    13dc:	e2533001 	subs	r3, r3, #1	; 0x1
    13e0:	e2811001 	add	r1, r1, #1	; 0x1
    13e4:	cafffff7 	bgt	13c8 <b51f4>
    13e8:	e59fa034 	ldr	sl, [pc, #52]	; 1424 <.x5250>
    13ec:	e3a01001 	mov	r1, #1	; 0x1
    13f0:	ee031f10 	mcr	15, 0, r1, cr3, cr0, {0}
    13f4:	ee02af10 	mcr	15, 0, sl, cr2, cr0, {0}
    13f8:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
    13fc:	e3a01071 	mov	r1, #113	; 0x71
    1400:	e3811004 	orr	r1, r1, #4	; 0x4
    1404:	e59f002c 	ldr	r0, [pc, #44]	; 1438 <.x5264>
    1408:	e3500000 	cmp	r0, #0	; 0x0
    140c:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
    1410:	e1a0f000 	mov	pc, r0
    1414:	e1a00000 	nop			(mov r0,r0)
    1418:	e3a0d102 	mov	sp, #-2147483648	; 0x80000000
    141c:	e28dda65 	add	sp, sp, #413696	; 0x65000
    1420:	ea00060b 	b	2c54 <sysinit_mmu>

00001424 <.x5250>:
    1424:	30010000 	.word	0x30010000

00001428 <.x5254>:
    1428:	1ff00000 	.word	0x1ff00000

0000142c <.x5258>:
    142c:	fff00000 	.word	0xfff00000

00001430 <.x525c>:
    1430:	3000040e 	.word	0x3000040e

00001434 <.x5260>:
    1434:	30000402 	.word	0x30000402

00001438 <.x5264>:
    1438:	80022244 	.word	0x80022244

0000143c <.x5274>:
    143c:	f8545d88 	.word	0xf8545d88

00001440 <.x5278>:
    1440:	00000000 	.word	0x00000000

00001444 <.x527c>:
    1444:	00000002 	.word	0x00000002

00001448 <.x5280>:
    1448:	00000020 	.word	0x00000020

0000144c <.x5284>:
    144c:	0000214c 	.word	0x0000214c

00001450 <.x5288>:
    1450:	0000154c 	.word	0x0000154c

00001454 <.x528c>:
    1454:	00000000 	.word	0x00000000

00001458 <.x5290>:
    1458:	8006c680 	.word	0x8006c680

0000145c <.x5294>:
    145c:	80022330 	.word	0x80022330

00001460 <.x5298>:
    1460:	80022368 	.word	0x80022368

00001464 <.x52a4>:
    1464:	00004033 	.word	0x00004033

00001468 <.x52a8>:
    1468:	00444101 	.word	0x00444101

0000146c <.x52ac>:
    146c:	09401050 	.word	0x09401050

00001470 <.x52b0>:
    1470:	00004005 	.word	0x00004005

00001474 <.x52b4>:
    1474:	00534c01 	.word	0x00534c01

00001478 <.x52b8>:
    1478:	09401050 	.word	0x09401050

0000147c <.x52bc>:
    147c:	00002078 	.word	0x00002078

00001480 <.x52c0>:
    1480:	00534c01 	.word	0x00534c01

00001484 <.x52c4>:
    1484:	802910ec 	.word	0x802910ec

00001488 <.x52c8>:
    1488:	0000c0f0 	.word	0x0000c0f0

0000148c <.x52cc>:
    148c:	00534b01 	.word	0x00534b01

00001490 <.x52d0>:
    1490:	812910ec 	.word	0x812910ec

00001494 <.x52d4>:
    1494:	00000000 	.word	0x00000000

00001498 <.x52d8>:
    1498:	00545204 	.word	0x00545204

0000149c <.x52dc>:
    149c:	813910ec 	.word	0x813910ec

000014a0 <.x52e0>:
    14a0:	0000900b 	.word	0x0000900b

000014a4 <.x52e4>:
    14a4:	00545204 	.word	0x00545204

000014a8 <.x52e8>:
    14a8:	813910ec 	.word	0x813910ec

000014ac <.x52ec>:
    14ac:	0000d0c9 	.word	0x0000d0c9

000014b0 <.x52f0>:
    14b0:	00545204 	.word	0x00545204

000014b4 <.x52f4>:
    14b4:	813910ec 	.word	0x813910ec

000014b8 <.x52f8>:
    14b8:	0000e04c 	.word	0x0000e04c

000014bc <.x52fc>:
    14bc:	00545204 	.word	0x00545204

000014c0 <.x5300>:
    14c0:	13001186 	.word	0x13001186

000014c4 <.x5304>:
    14c4:	000050ba 	.word	0x000050ba

000014c8 <.x5308>:
    14c8:	004c4404 	.word	0x004c4404

000014cc <.x530c>:
    14cc:	0020100b 	.word	0x0020100b

000014d0 <.x5310>:
    14d0:	0000a0cc 	.word	0x0000a0cc

000014d4 <.x5314>:
    14d4:	00474e05 	.word	0x00474e05

000014d8 <.x5318>:
    14d8:	905010b7 	.word	0x905010b7

000014dc <.x531c>:
    14dc:	00006008 	.word	0x00006008

000014e0 <.x5320>:
    14e0:	00433306 	.word	0x00433306

000014e4 <.x5324>:
    14e4:	920010b7 	.word	0x920010b7

000014e8 <.x5328>:
    14e8:	00000476 	.word	0x00000476

000014ec <.x532c>:
    14ec:	00433306 	.word	0x00433306

000014f0 <.x5330>:
    14f0:	00560045 	.word	0x00560045

000014f4 <.x5334>:
    14f4:	004e0045 	.word	0x004e0045

000014f8 <.x5338>:
    14f8:	005f0054 	.word	0x005f0054

000014fc <.x533c>:
    14fc:	0041004e 	.word	0x0041004e

00001500 <.x5340>:
    1500:	0045004d 	.word	0x0045004d

00001504 <.x5344>:
    1504:	0052005f 	.word	0x0052005f

00001508 <.x5348>:
    1508:	0054004f 	.word	0x0054004f

0000150c <.x534c>:
    150c:	00540041 	.word	0x00540041

00001510 <.x5350>:
    1510:	004f0049 	.word	0x004f0049

00001514 <.x5354>:
    1514:	005f004e 	.word	0x005f004e

00001518 <.x5358>:
    1518:	004f004e 	.word	0x004f004e

0000151c <.x535c>:
    151c:	00490054 	.word	0x00490054

00001520 <.x5360>:
    1520:	00590046 	.word	0x00590046

00001524 <.x5364>:
    1524:	00000000 	.word	0x00000000

00001528 <.x5368>:
    1528:	004b0042 	.word	0x004b0042

0000152c <.x536c>:
    152c:	0031004c 	.word	0x0031004c

00001530 <.x5370>:
    1530:	0000003a 	.word	0x0000003a

00001534 <.x5374>:
    1534:	5f434f54 	.word	0x5f434f54

00001538 <.x548c>:
    1538:	72616853 	.word	0x72616853
    153c:	61502070 	.word	0x61502070
    1540:	6c656e6e 	.word	0x6c656e6e
    1544:	000a2121 	.word	0x000a2121
    1548:	e1a00000 	.word	0xe1a00000
    154c:	e1a00000 	.word	0xe1a00000

00001550 <.x54a0>:
    1550:	736d6153 	.word	0x736d6153
    1554:	20676e75 	.word	0x20676e75
    1558:	6e6e6150 	.word	0x6e6e6150
    155c:	21216c65 	.word	0x21216c65
    1560:	0000000a 	.word	0x0000000a
    1564:	e1a00000 	.word	0xe1a00000
    1568:	e1a00000 	.word	0xe1a00000
    156c:	e1a00000 	.word	0xe1a00000

00001570 <coprocessor_01>:
    1570:	e59f2028 	ldr	r2, [pc, #40]	; 15a0 <.x619c>
    1574:	e3a03205 	mov	r3, #1342177280	; 0x50000000
    1578:	e0422003 	sub	r2, r2, r3
    157c:	e3a01070 	mov	r1, #112	; 0x70
    1580:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
    1584:	e1a00000 	nop			(mov r0,r0)
    1588:	e1a0f002 	mov	pc, r2
    158c:	e1a00000 	nop			(mov r0,r0)
    1590:	e3a02000 	mov	r2, #0	; 0x0
    1594:	ee082f17 	mcr	15, 0, r2, cr8, cr7, {0}
    1598:	e1a0f000 	mov	pc, r0
    159c:	e12fff1e 	bx	lr

000015a0 <.x619c>:
    15a0:	8002318c 	.word	0x8002318c

000015a4 <b61a0>:
    15a4:	e92d4000 	push	{lr}
    15a8:	e1a00001 	mov	r0, r1
    15ac:	eb00051e 	bl	2a2c <b79c0>
    15b0:	e8bd4000 	pop	{lr}
    15b4:	e12fff1e 	bx	lr

000015b8 <b61b4>:
    15b8:	e92d4010 	push	{r4, lr}
    15bc:	e59f307c 	ldr	r3, [pc, #124]	; 1640 <.x623c>
    15c0:	e59f1074 	ldr	r1, [pc, #116]	; 163c <.x6238>
    15c4:	e3a0220a 	mov	r2, #-1610612736	; 0xa0000000
    15c8:	e59f0068 	ldr	r0, [pc, #104]	; 1638 <.x6234>
    15cc:	e3822802 	orr	r2, r2, #131072	; 0x20000
    15d0:	e59fe05c 	ldr	lr, [pc, #92]	; 1634 <.x6230>
    15d4:	e3a04001 	mov	r4, #1	; 0x1
    15d8:	e5823000 	str	r3, [r2]
    15dc:	e59f304c 	ldr	r3, [pc, #76]	; 1630 <.x622c>
    15e0:	e1c140b0 	strh	r4, [r1]
    15e4:	e1c040b0 	strh	r4, [r0]
    15e8:	e3a00000 	mov	r0, #0	; 0x0
    15ec:	e59f2038 	ldr	r2, [pc, #56]	; 162c <.x6228>
    15f0:	e59f1030 	ldr	r1, [pc, #48]	; 1628 <.x6224>
    15f4:	e58e0000 	str	r0, [lr]
    15f8:	e5830000 	str	r0, [r3]
    15fc:	e59f3020 	ldr	r3, [pc, #32]	; 1624 <.x6220>
    1600:	e5820000 	str	r0, [r2]
    1604:	e59f2014 	ldr	r2, [pc, #20]	; 1620 <.x621c>
    1608:	e5810000 	str	r0, [r1]
    160c:	e1c340b0 	strh	r4, [r3]
    1610:	e3a03018 	mov	r3, #24	; 0x18
    1614:	e1c230b0 	strh	r3, [r2]
    1618:	e8bd4010 	pop	{r4, lr}
    161c:	e12fff1e 	bx	lr

00001620 <.x621c>:
    1620:	a002011a 	.word	0xa002011a

00001624 <.x6220>:
    1624:	a0020118 	.word	0xa0020118

00001628 <.x6224>:
    1628:	a0020050 	.word	0xa0020050

0000162c <.x6228>:
    162c:	a002004c 	.word	0xa002004c

00001630 <.x622c>:
    1630:	a0020048 	.word	0xa0020048

00001634 <.x6230>:
    1634:	a0020044 	.word	0xa0020044

00001638 <.x6234>:
    1638:	a0020006 	.word	0xa0020006

0000163c <.x6238>:
    163c:	a0020004 	.word	0xa0020004

00001640 <.x623c>:
    1640:	53475241 	.word	0x53475241

00001644 <b6240>:
    1644:	e92d4000 	push	{lr}
    1648:	e3a0e20a 	mov	lr, #-1610612736	; 0xa0000000
    164c:	e59f0024 	ldr	r0, [pc, #36]	; 1678 <.x629c>
    1650:	e38ee802 	orr	lr, lr, #131072	; 0x20000
    1654:	e3a01000 	mov	r1, #0	; 0x0
    1658:	e0803001 	add	r3, r0, r1
    165c:	e5d32020 	ldrb	r2, [r3, #32]
    1660:	e081300e 	add	r3, r1, lr
    1664:	e2811001 	add	r1, r1, #1	; 0x1
    1668:	e5c32058 	strb	r2, [r3, #88]
    166c:	e3510006 	cmp	r1, #6	; 0x6
    1670:	e8bd4000 	pop	{lr}
    1674:	e12fff1e 	bx	lr

00001678 <.x629c>:
    1678:	8006c680 	.word	0x8006c680

0000167c <b6398>:
    167c:	e92d4010 	push	{r4, lr}

00001680 <.x6404>:
    1680:	a0020054 	.word	0xa0020054

00001684 <.x6408>:
    1684:	80022374 	.word	0x80022374

00001688 <.x640c>:
    1688:	8006c680 	.word	0x8006c680

0000168c <.x6410>:
    168c:	8002239c 	.word	0x8002239c

00001690 <b6414>:
    1690:	e92d4000 	push	{lr}
    1694:	e24dd004 	sub	sp, sp, #4	; 0x4
    1698:	e59f30c0 	ldr	r3, [pc, #192]	; 1760 <.x64e4>
    169c:	e3a02000 	mov	r2, #0	; 0x0
    16a0:	e58d2000 	str	r2, [sp]
    16a4:	e5933000 	ldr	r3, [r3]
    16a8:	e5933064 	ldr	r3, [r3, #100]
    16ac:	e3130008 	tst	r3, #8	; 0x8
    16b0:	1a000014 	bne	1708 <b648c>
    16b4:	e3a03001 	mov	r3, #1	; 0x1
    16b8:	e58d3000 	str	r3, [sp]
    16bc:	e59f3098 	ldr	r3, [pc, #152]	; 175c <.x64e0>
    16c0:	e3a0220a 	mov	r2, #-1610612736	; 0xa0000000
    16c4:	e59f108c 	ldr	r1, [pc, #140]	; 1758 <.x64dc>
    16c8:	e3822802 	orr	r2, r2, #131072	; 0x20000
    16cc:	e59f0080 	ldr	r0, [pc, #128]	; 1754 <.x64d8>
    16d0:	e5823000 	str	r3, [r2]
    16d4:	e3a03001 	mov	r3, #1	; 0x1
    16d8:	e1c130b0 	strh	r3, [r1]
    16dc:	e1c030b0 	strh	r3, [r0]

000016e0 <b6464>:
    16e0:	e59d3000 	ldr	r3, [sp]

000016e4 <b6468>:
    16e4:	e3530000 	cmp	r3, #0	; 0x0
    16e8:	0a000011 	beq	1734 <b64b8>
    16ec:	e59f005c 	ldr	r0, [pc, #92]	; 1750 <.x64d4>
    16f0:	eb0004cd 	bl	2a2c <b79c0>

000016f4 <b6478>:
    16f4:	e59d3000 	ldr	r3, [sp]

000016f8 <b647c>:
    16f8:	e20300ff 	and	r0, r3, #255	; 0xff
    16fc:	e28dd004 	add	sp, sp, #4	; 0x4
    1700:	e8bd4000 	pop	{lr}
    1704:	e12fff1e 	bx	lr

00001708 <b648c>:
    1708:	e3a00005 	mov	r0, #5	; 0x5
    170c:	eb0004df 	bl	2a90 <b7a24>
    1710:	e3500000 	cmp	r0, #0	; 0x0
    1714:	1a000003 	bne	1728 <b64ac>
    1718:	e59f002c 	ldr	r0, [pc, #44]	; 174c <.x64d0>
    171c:	eb0004c2 	bl	2a2c <b79c0>
    1720:	ebffffa4 	bl	15b8 <b61b4>
    1724:	eaffffed 	b	16e0 <b6464>

00001728 <b64ac>:
    1728:	e5903000 	ldr	r3, [r0]
    172c:	e58d3000 	str	r3, [sp]
    1730:	eaffffeb 	b	16e4 <b6468>

00001734 <b64b8>:
    1734:	e28d0000 	add	r0, sp, #0	; 0x0
    1738:	eb000716 	bl	3398 <b983c>
    173c:	e3500000 	cmp	r0, #0	; 0x0
    1740:	1affffeb 	bne	16f4 <b6478>
    1744:	e3a03000 	mov	r3, #0	; 0x0
    1748:	eaffffea 	b	16f8 <b647c>

0000174c <.x64d0>:
    174c:	800223e8 	.word	0x800223e8

00001750 <.x64d4>:
    1750:	800223a8 	.word	0x800223a8

00001754 <.x64d8>:
    1754:	a0020006 	.word	0xa0020006

00001758 <.x64dc>:
    1758:	a0020004 	.word	0xa0020004

0000175c <.x64e0>:
    175c:	53475241 	.word	0x53475241

00001760 <.x64e4>:
    1760:	80069000 	.word	0x80069000

00001764 <b64e8>:
    1764:	e3c11202 	bic	r1, r1, #536870912	; 0x20000000
    1768:	e2813102 	add	r3, r1, #-2147483648	; 0x80000000
    176c:	e373037f 	cmn	r3, #-67108863	; 0xfc000001
    1770:	e3a03000 	mov	r3, #0	; 0x0
    1774:	92413205 	subls	r3, r1, #1342177280	; 0x50000000
    1778:	95823000 	strls	r3, [r2]
    177c:	93a03001 	movls	r3, #1	; 0x1
    1780:	e20300ff 	and	r0, r3, #255	; 0xff
    1784:	e12fff1e 	bx	lr

00001788 <samsung_lcd_init>:
    1788:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    178c:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1790:	e3a03010 	mov	r3, #16	; 0x10
    1794:	e3a00032 	mov	r0, #50	; 0x32
    1798:	e5823000 	str	r3, [r2]
    179c:	eb0004a8 	bl	2a44 <highdelay>
    17a0:	e3a03202 	mov	r3, #536870912	; 0x20000000
    17a4:	e3833004 	orr	r3, r3, #4	; 0x4
    17a8:	e3a0b020 	mov	fp, #32	; 0x20
    17ac:	e3a00032 	mov	r0, #50	; 0x32
    17b0:	e583b000 	str	fp, [r3]
    17b4:	eb0004a2 	bl	2a44 <highdelay>
    17b8:	e3a04202 	mov	r4, #536870912	; 0x20000000
    17bc:	e384401c 	orr	r4, r4, #28	; 0x1c
    17c0:	e3a0a000 	mov	sl, #0	; 0x0
    17c4:	e3a00014 	mov	r0, #20	; 0x14
    17c8:	e584a000 	str	sl, [r4]
    17cc:	eb00049c 	bl	2a44 <highdelay>
    17d0:	e3a03202 	mov	r3, #536870912	; 0x20000000
    17d4:	e3a05202 	mov	r5, #536870912	; 0x20000000
    17d8:	e3833028 	orr	r3, r3, #40	; 0x28
    17dc:	e3a02202 	mov	r2, #536870912	; 0x20000000
    17e0:	e385502c 	orr	r5, r5, #44	; 0x2c
    17e4:	e583a000 	str	sl, [r3]
    17e8:	e59f354c 	ldr	r3, [pc, #1356]	; 1d3c <.x6ac0>
    17ec:	e3822038 	orr	r2, r2, #56	; 0x38
    17f0:	e3a01202 	mov	r1, #536870912	; 0x20000000
    17f4:	e585a000 	str	sl, [r5]
    17f8:	e3a06202 	mov	r6, #536870912	; 0x20000000
    17fc:	e582a000 	str	sl, [r2]
    1800:	e3811040 	orr	r1, r1, #64	; 0x40
    1804:	e3a07202 	mov	r7, #536870912	; 0x20000000
    1808:	e3a02202 	mov	r2, #536870912	; 0x20000000
    180c:	e3866048 	orr	r6, r6, #72	; 0x48
    1810:	e581a000 	str	sl, [r1]
    1814:	e3877050 	orr	r7, r7, #80	; 0x50
    1818:	e382205c 	orr	r2, r2, #92	; 0x5c
    181c:	e5863000 	str	r3, [r6]
    1820:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1824:	e587a000 	str	sl, [r7]
    1828:	e582a000 	str	sl, [r2]
    182c:	e3833060 	orr	r3, r3, #96	; 0x60
    1830:	e3a0201f 	mov	r2, #31	; 0x1f
    1834:	e3a00032 	mov	r0, #50	; 0x32
    1838:	e5832000 	str	r2, [r3]
    183c:	eb000480 	bl	2a44 <highdelay>
    1840:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1844:	e383300c 	orr	r3, r3, #12	; 0xc
    1848:	e3a0202b 	mov	r2, #43	; 0x2b
    184c:	e3a00004 	mov	r0, #4	; 0x4
    1850:	e5832000 	str	r2, [r3]
    1854:	eb00047a 	bl	2a44 <highdelay>
    1858:	e3a02202 	mov	r2, #536870912	; 0x20000000
    185c:	e3a03b09 	mov	r3, #9216	; 0x2400
    1860:	e3822008 	orr	r2, r2, #8	; 0x8
    1864:	e383303f 	orr	r3, r3, #63	; 0x3f
    1868:	e3a00005 	mov	r0, #5	; 0x5
    186c:	e5823000 	str	r3, [r2]
    1870:	eb000473 	bl	2a44 <highdelay>
    1874:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1878:	e3a03d3b 	mov	r3, #3776	; 0xec0
    187c:	e3822010 	orr	r2, r2, #16	; 0x10
    1880:	e3833009 	orr	r3, r3, #9	; 0x9
    1884:	e3a00005 	mov	r0, #5	; 0x5
    1888:	e5823000 	str	r3, [r2]
    188c:	eb00046c 	bl	2a44 <highdelay>
    1890:	e3a01202 	mov	r1, #536870912	; 0x20000000
    1894:	e3a03c21 	mov	r3, #8448	; 0x2100
    1898:	e3a00202 	mov	r0, #536870912	; 0x20000000
    189c:	e3811c01 	orr	r1, r1, #256	; 0x100
    18a0:	e3833005 	orr	r3, r3, #5	; 0x5
    18a4:	e3a0e202 	mov	lr, #536870912	; 0x20000000
    18a8:	e3a02b11 	mov	r2, #17408	; 0x4400
    18ac:	e3800f41 	orr	r0, r0, #260	; 0x104
    18b0:	e3a08001 	mov	r8, #1	; 0x1
    18b4:	e5813000 	str	r3, [r1]
    18b8:	e38ee014 	orr	lr, lr, #20	; 0x14
    18bc:	e3822002 	orr	r2, r2, #2	; 0x2
    18c0:	e5808000 	str	r8, [r0]
    18c4:	e58e2000 	str	r2, [lr]
    18c8:	e3a00005 	mov	r0, #5	; 0x5
    18cc:	eb00045c 	bl	2a44 <highdelay>
    18d0:	e3a03202 	mov	r3, #536870912	; 0x20000000
    18d4:	e3833018 	orr	r3, r3, #24	; 0x18
    18d8:	e3a00005 	mov	r0, #5	; 0x5
    18dc:	e583a000 	str	sl, [r3]
    18e0:	eb000457 	bl	2a44 <highdelay>
    18e4:	e3a03e32 	mov	r3, #800	; 0x320
    18e8:	e5843000 	str	r3, [r4]
    18ec:	e3a04202 	mov	r4, #536870912	; 0x20000000
    18f0:	e3844020 	orr	r4, r4, #32	; 0x20
    18f4:	e3a02202 	mov	r2, #536870912	; 0x20000000
    18f8:	e3a03e11 	mov	r3, #272	; 0x110
    18fc:	e584a000 	str	sl, [r4]
    1900:	e3822030 	orr	r2, r2, #48	; 0x30
    1904:	e3833001 	orr	r3, r3, #1	; 0x1
    1908:	e5858000 	str	r8, [r5]
    190c:	e3a00005 	mov	r0, #5	; 0x5
    1910:	e5823000 	str	r3, [r2]
    1914:	eb00044a 	bl	2a44 <highdelay>
    1918:	e3a03202 	mov	r3, #536870912	; 0x20000000
    191c:	e3833034 	orr	r3, r3, #52	; 0x34
    1920:	e3a00005 	mov	r0, #5	; 0x5
    1924:	e583a000 	str	sl, [r3]
    1928:	eb000445 	bl	2a44 <highdelay>
    192c:	e3a00005 	mov	r0, #5	; 0x5
    1930:	e586a000 	str	sl, [r6]
    1934:	eb000442 	bl	2a44 <highdelay>
    1938:	e3a00005 	mov	r0, #5	; 0x5
    193c:	e587a000 	str	sl, [r7]
    1940:	eb00043f 	bl	2a44 <highdelay>
    1944:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1948:	e3833064 	orr	r3, r3, #100	; 0x64
    194c:	e3a02004 	mov	r2, #4	; 0x4
    1950:	e3a00005 	mov	r0, #5	; 0x5
    1954:	e5832000 	str	r2, [r3]
    1958:	eb000439 	bl	2a44 <highdelay>
    195c:	e59f33d4 	ldr	r3, [pc, #980]	; 1d38 <.x6abc>
    1960:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1964:	e3822f42 	orr	r2, r2, #264	; 0x108
    1968:	e3a01202 	mov	r1, #536870912	; 0x20000000
    196c:	e5823000 	str	r3, [r2]
    1970:	e3a03024 	mov	r3, #36	; 0x24
    1974:	e3811f43 	orr	r1, r1, #268	; 0x10c
    1978:	e3a00202 	mov	r0, #536870912	; 0x20000000
    197c:	e5813000 	str	r3, [r1]
    1980:	e3a01000 	mov	r1, #0	; 0x0
    1984:	e3800802 	orr	r0, r0, #131072	; 0x20000
    1988:	e3a02a96 	mov	r2, #614400	; 0x96000
    198c:	eb0006ec 	bl	3544 <bcf44>
    1990:	e5848000 	str	r8, [r4]

00001994 <jump_over>:
    1994:	e59f8398 	ldr	r8, [pc, #920]	; 1d34 <.x6ab8>
    1998:	e59f3390 	ldr	r3, [pc, #912]	; 1d30 <.x6ab4>
    199c:	e59f0388 	ldr	r0, [pc, #904]	; 1d2c <.x6ab0>
    19a0:	e3a07202 	mov	r7, #536870912	; 0x20000000
    19a4:	e3a04202 	mov	r4, #536870912	; 0x20000000
    19a8:	e3877d29 	orr	r7, r7, #2624	; 0xa40
    19ac:	e588a000 	str	sl, [r8]
    19b0:	e3a01d0f 	mov	r1, #960	; 0x3c0
    19b4:	e59fe36c 	ldr	lr, [pc, #876]	; 1d28 <.x6aac>
    19b8:	e59f2364 	ldr	r2, [pc, #868]	; 1d24 <.x6aa8>
    19bc:	e587a000 	str	sl, [r7]
    19c0:	e3844ea3 	orr	r4, r4, #2608	; 0xa30
    19c4:	e5831000 	str	r1, [r3]
    19c8:	e59f1350 	ldr	r1, [pc, #848]	; 1d20 <.x6aa4>
    19cc:	e3a03623 	mov	r3, #36700160	; 0x2300000
    19d0:	e5840000 	str	r0, [r4]
    19d4:	e59f0340 	ldr	r0, [pc, #832]	; 1d1c <.x6aa0>
    19d8:	e3a04202 	mov	r4, #536870912	; 0x20000000
    19dc:	e3833050 	orr	r3, r3, #80	; 0x50
    19e0:	e3844ea1 	orr	r4, r4, #2576	; 0xa10
    19e4:	e58e2000 	str	r2, [lr]
    19e8:	e5813000 	str	r3, [r1]
    19ec:	e5840000 	str	r0, [r4]
    19f0:	e3a00901 	mov	r0, #16384	; 0x4000
    19f4:	e59fe31c 	ldr	lr, [pc, #796]	; 1d18 <.x6a9c>
    19f8:	e3a0284f 	mov	r2, #5177344	; 0x4f0000
    19fc:	e59f1310 	ldr	r1, [pc, #784]	; 1d14 <.gof_a18_add>
    1a00:	e3a03802 	mov	r3, #131072	; 0x20000
    1a04:	e3800044 	orr	r0, r0, #68	; 0x44
    1a08:	e3822fb1 	orr	r2, r2, #708	; 0x2c4
    1a0c:	e3833fa1 	orr	r3, r3, #644	; 0x284
    1a10:	e58e2000 	str	r2, [lr]
    1a14:	e59f22f4 	ldr	r2, [pc, #756]	; 1d10 <.gof_a04_add>
    1a18:	e3a09202 	mov	r9, #536870912	; 0x20000000
    1a1c:	e5813000 	str	r3, [r1]
    1a20:	e3899c0a 	orr	r9, r9, #2560	; 0xa00
    1a24:	e59f52e0 	ldr	r5, [pc, #736]	; 1d0c <.gof_a1c_add>
    1a28:	e3a03003 	mov	r3, #3	; 0x3
    1a2c:	e5890000 	str	r0, [r9]
    1a30:	e5823000 	str	r3, [r2]
    1a34:	e3a0281e 	mov	r2, #1966080	; 0x1e0000
    1a38:	e59f12c8 	ldr	r1, [pc, #712]	; 1d08 <.gof_a24_add>
    1a3c:	e59f32c0 	ldr	r3, [pc, #704]	; 1d04 <.x6a88>
    1a40:	e3a04202 	mov	r4, #536870912	; 0x20000000
    1a44:	e3a0e98a 	mov	lr, #2260992	; 0x228000
    1a48:	e5852000 	str	r2, [r5]
    1a4c:	e59f22ac 	ldr	r2, [pc, #684]	; 1d00 <.x6a84>
    1a50:	e3844ea2 	orr	r4, r4, #2592	; 0xa20
    1a54:	e38ee01f 	orr	lr, lr, #31	; 0x1f
    1a58:	e3a00202 	mov	r0, #536870912	; 0x20000000
    1a5c:	e3800ea7 	orr	r0, r0, #2672	; 0xa70
    1a60:	e584e000 	str	lr, [r4]
    1a64:	e59f4290 	ldr	r4, [pc, #656]	; 1cfc <.x6a80>
    1a68:	e59f6288 	ldr	r6, [pc, #648]	; 1cf8 <.x6a7c>
    1a6c:	e5813000 	str	r3, [r1]
    1a70:	e59f327c 	ldr	r3, [pc, #636]	; 1cf4 <.x6a78>
    1a74:	e5802000 	str	r2, [r0]
    1a78:	e3a02902 	mov	r2, #32768	; 0x8000
    1a7c:	e59f526c 	ldr	r5, [pc, #620]	; 1cf0 <.x6a74>
    1a80:	e59fe264 	ldr	lr, [pc, #612]	; 1cec <.x6a70>
    1a84:	e59f025c 	ldr	r0, [pc, #604]	; 1ce8 <.x6a6c>
    1a88:	e59f1254 	ldr	r1, [pc, #596]	; 1ce4 <.x6a68>
    1a8c:	e5842000 	str	r2, [r4]
    1a90:	e59f2248 	ldr	r2, [pc, #584]	; 1ce0 <.x6a64>
    1a94:	e5863000 	str	r3, [r6]
    1a98:	e3a0390e 	mov	r3, #229376	; 0x38000
    1a9c:	e3833002 	orr	r3, r3, #2	; 0x2
    1aa0:	e585e000 	str	lr, [r5]
    1aa4:	e5801000 	str	r1, [r0]
    1aa8:	e5823000 	str	r3, [r2]
    1aac:	e3a00202 	mov	r0, #536870912	; 0x20000000
    1ab0:	e3a03e3d 	mov	r3, #976	; 0x3d0
    1ab4:	e3a0e202 	mov	lr, #536870912	; 0x20000000
    1ab8:	e587a000 	str	sl, [r7]
    1abc:	e3800eaa 	orr	r0, r0, #2720	; 0xaa0
    1ac0:	e3a06f82 	mov	r6, #520	; 0x208
    1ac4:	e59f4210 	ldr	r4, [pc, #528]	; 1cdc <.x6a60>
    1ac8:	e3833002 	orr	r3, r3, #2	; 0x2
    1acc:	e588a000 	str	sl, [r8]
    1ad0:	e38eeea6 	orr	lr, lr, #2656	; 0xa60
    1ad4:	e59f51fc 	ldr	r5, [pc, #508]	; 1cd8 <.x6a5c>
    1ad8:	e3a02402 	mov	r2, #33554432	; 0x2000000
    1adc:	e5806000 	str	r6, [r0]
    1ae0:	e59f01ec 	ldr	r0, [pc, #492]	; 1cd4 <.x6a58>
    1ae4:	e58e3000 	str	r3, [lr]
    1ae8:	e3a0160e 	mov	r1, #14680064	; 0xe00000
    1aec:	e3a03712 	mov	r3, #4718592	; 0x480000
    1af0:	e3822d07 	orr	r2, r2, #448	; 0x1c0
    1af4:	e3811d62 	orr	r1, r1, #6272	; 0x1880
    1af8:	e3833e41 	orr	r3, r3, #1040	; 0x410
    1afc:	e5842000 	str	r2, [r4]
    1b00:	e59f21c8 	ldr	r2, [pc, #456]	; 1cd0 <.gof_b04_val>
    1b04:	e3a0e202 	mov	lr, #536870912	; 0x20000000
    1b08:	e5851000 	str	r1, [r5]
    1b0c:	e59f11b8 	ldr	r1, [pc, #440]	; 1ccc <.gof_b04_add>
    1b10:	e5803000 	str	r3, [r0]
    1b14:	e3a0080a 	mov	r0, #655360	; 0xa0000
    1b18:	e38eec0b 	orr	lr, lr, #2816	; 0xb00
    1b1c:	e59f31a4 	ldr	r3, [pc, #420]	; 1cc8 <.gof_b08_add>
    1b20:	e58e0000 	str	r0, [lr]
    1b24:	e5812000 	str	r2, [r1]
    1b28:	e3a0103f 	mov	r1, #63	; 0x3f
    1b2c:	e3a00202 	mov	r0, #536870912	; 0x20000000
    1b30:	e5831000 	str	r1, [r3]
    1b34:	e3a0350d 	mov	r3, #54525952	; 0x3400000
    1b38:	e3800eb1 	orr	r0, r0, #2832	; 0xb10
    1b3c:	e59f2180 	ldr	r2, [pc, #384]	; 1cc4 <.gof_b14_add>
    1b40:	e59f4178 	ldr	r4, [pc, #376]	; 1cc0 <.gof_b18_add>
    1b44:	e59f1170 	ldr	r1, [pc, #368]	; 1cbc <.gof_b18_val>
    1b48:	e59fe168 	ldr	lr, [pc, #360]	; 1cb8 <.gof_b1c_add>
    1b4c:	e5803000 	str	r3, [r0]
    1b50:	e59f015c 	ldr	r0, [pc, #348]	; 1cb4 <.gof_b1c_val>
    1b54:	e59f5154 	ldr	r5, [pc, #340]	; 1cb0 <.x6a34>
    1b58:	e59f314c 	ldr	r3, [pc, #332]	; 1cac <.x6a30>
    1b5c:	e5825000 	str	r5, [r2]
    1b60:	e59f2140 	ldr	r2, [pc, #320]	; 1ca8 <.x6a2c>
    1b64:	e5841000 	str	r1, [r4]
    1b68:	e3a01202 	mov	r1, #536870912	; 0x20000000
    1b6c:	e58e0000 	str	r0, [lr]
    1b70:	e5823000 	str	r3, [r2]
    1b74:	e3a03701 	mov	r3, #262144	; 0x40000
    1b78:	e3811eb2 	orr	r1, r1, #2848	; 0xb20
    1b7c:	e3a0e202 	mov	lr, #536870912	; 0x20000000
    1b80:	e3a00c01 	mov	r0, #256	; 0x100
    1b84:	e59f2118 	ldr	r2, [pc, #280]	; 1ca4 <.x6a28>
    1b88:	e5813000 	str	r3, [r1]
    1b8c:	e59f110c 	ldr	r1, [pc, #268]	; 1ca0 <.x6a24>
    1b90:	e38eeeb3 	orr	lr, lr, #2864	; 0xb30
    1b94:	e3800001 	orr	r0, r0, #1	; 0x1
    1b98:	e3a03cff 	mov	r3, #65280	; 0xff00
    1b9c:	e58e0000 	str	r0, [lr]
    1ba0:	e59fe0f4 	ldr	lr, [pc, #244]	; 1c9c <.x6a20>
    1ba4:	e38330f3 	orr	r3, r3, #243	; 0xf3
    1ba8:	e3a00202 	mov	r0, #536870912	; 0x20000000
    1bac:	e59f40e4 	ldr	r4, [pc, #228]	; 1c98 <.x6a1c>
    1bb0:	e582a000 	str	sl, [r2]
    1bb4:	e5813000 	str	r3, [r1]
    1bb8:	e59f10d4 	ldr	r1, [pc, #212]	; 1c94 <.x6a18>
    1bbc:	e59f30cc 	ldr	r3, [pc, #204]	; 1c90 <.x6a14>
    1bc0:	e3800d2d 	orr	r0, r0, #2880	; 0xb40
    1bc4:	e3a02ebb 	mov	r2, #2992	; 0xbb0
    1bc8:	e382200a 	orr	r2, r2, #10	; 0xa
    1bcc:	e580a000 	str	sl, [r0]
    1bd0:	e59f00b4 	ldr	r0, [pc, #180]	; 1c8c <.x6a10>
    1bd4:	e58ea000 	str	sl, [lr]
    1bd8:	e5842000 	str	r2, [r4]
    1bdc:	e59fe0a4 	ldr	lr, [pc, #164]	; 1c88 <.x6a0c>
    1be0:	e5813000 	str	r3, [r1]
    1be4:	e3a03a02 	mov	r3, #8192	; 0x2000
    1be8:	e59f2094 	ldr	r2, [pc, #148]	; 1c84 <.x6a08>
    1bec:	e3a01202 	mov	r1, #536870912	; 0x20000000
    1bf0:	e5803000 	str	r3, [r0]
    1bf4:	e59f3084 	ldr	r3, [pc, #132]	; 1c80 <.x6a04>
    1bf8:	e3811eba 	orr	r1, r1, #2976	; 0xba0
    1bfc:	e58e5000 	str	r5, [lr]
    1c00:	e581a000 	str	sl, [r1]
    1c04:	e582a000 	str	sl, [r2]
    1c08:	e3a00014 	mov	r0, #20	; 0x14
    1c0c:	e583b000 	str	fp, [r3]
    1c10:	eb00038b 	bl	2a44 <highdelay>
    1c14:	e59f4060 	ldr	r4, [pc, #96]	; 1c7c <.x6a00>
    1c18:	e59f0058 	ldr	r0, [pc, #88]	; 1c78 <.x69fc>
    1c1c:	e59fe050 	ldr	lr, [pc, #80]	; 1c74 <.VIDEO_BASE_0xbcc>
    1c20:	e59f2048 	ldr	r2, [pc, #72]	; 1c70 <.x69f4>
    1c24:	e59f3040 	ldr	r3, [pc, #64]	; 1c6c <.x69f0>
    1c28:	e3a01202 	mov	r1, #536870912	; 0x20000000
    1c2c:	e5840000 	str	r0, [r4]
    1c30:	e3811ebd 	orr	r1, r1, #3024	; 0xbd0
    1c34:	e58e2000 	str	r2, [lr]
    1c38:	e59f2028 	ldr	r2, [pc, #40]	; 1c68 <.x69ec>
    1c3c:	e5813000 	str	r3, [r1]
    1c40:	e59f301c 	ldr	r3, [pc, #28]	; 1c64 <video_addresses>
    1c44:	e3a00028 	mov	r0, #40	; 0x28
    1c48:	e5823000 	str	r3, [r2]
    1c4c:	e5993000 	ldr	r3, [r9]
    1c50:	e3833003 	orr	r3, r3, #3	; 0x3
    1c54:	e5893000 	str	r3, [r9]
    1c58:	eb000379 	bl	2a44 <highdelay>
    1c5c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1c60:	e12fff1e 	bx	lr

00001c64 <video_addresses>:
    1c64:	59809020 	.word	0x59809020

00001c68 <.x69ec>:
    1c68:	20000bec 	.word	0x20000bec

00001c6c <.x69f0>:
    1c6c:	44289104 	.word	0x44289104

00001c70 <.x69f4>:
    1c70:	30257804 	.word	0x30257804

00001c74 <.VIDEO_BASE_0xbcc>:
    1c74:	20000bcc 	.word	0x20000bcc

00001c78 <.x69fc>:
    1c78:	45260010 	.word	0x45260010

00001c7c <.x6a00>:
    1c7c:	20000bc4 	.word	0x20000bc4

00001c80 <.x6a04>:
    1c80:	20000b5c 	.word	0x20000b5c

00001c84 <.x6a08>:
    1c84:	20000bac 	.word	0x20000bac

00001c88 <.x6a0c>:
    1c88:	20000b58 	.word	0x20000b58

00001c8c <.x6a10>:
    1c8c:	20000b54 	.word	0x20000b54

00001c90 <.x6a14>:
    1c90:	04001541 	.word	0x04001541

00001c94 <.x6a18>:
    1c94:	20000b48 	.word	0x20000b48

00001c98 <.x6a1c>:
    1c98:	20000b4c 	.word	0x20000b4c

00001c9c <.x6a20>:
    1c9c:	20000b44 	.word	0x20000b44

00001ca0 <.x6a24>:
    1ca0:	20000b3c 	.word	0x20000b3c

00001ca4 <.x6a28>:
    1ca4:	20000b34 	.word	0x20000b34

00001ca8 <.x6a2c>:
    1ca8:	20000b2c 	.word	0x20000b2c

00001cac <.x6a30>:
    1cac:	537d2fca 	.word	0x537d2fca

00001cb0 <.x6a34>:
    1cb0:	55555555 	.word	0x55555555

00001cb4 <.gof_b1c_val>:
    1cb4:	50512a00 	.word	0x50512a00

00001cb8 <.gof_b1c_add>:
    1cb8:	20000b1c 	.word	0x20000b1c

00001cbc <.gof_b18_val>:
    1cbc:	28051005 	.word	0x28051005

00001cc0 <.gof_b18_add>:
    1cc0:	20000b18 	.word	0x20000b18

00001cc4 <.gof_b14_add>:
    1cc4:	20000b14 	.word	0x20000b14

00001cc8 <.gof_b08_add>:
    1cc8:	20000b08 	.word	0x20000b08

00001ccc <.gof_b04_add>:
    1ccc:	20000b04 	.word	0x20000b04

00001cd0 <.gof_b04_val>:
    1cd0:	04700202 	.word	0x04700202

00001cd4 <.x6a58>:
    1cd4:	20000abc 	.word	0x20000abc

00001cd8 <.x6a5c>:
    1cd8:	20000ab8 	.word	0x20000ab8

00001cdc <.x6a60>:
    1cdc:	20000a64 	.word	0x20000a64

00001ce0 <.x6a64>:
    1ce0:	20000a28 	.word	0x20000a28

00001ce4 <.x6a68>:
    1ce4:	029801f3 	.word	0x029801f3

00001ce8 <.x6a6c>:
    1ce8:	20000a7c 	.word	0x20000a7c

00001cec <.x6a70>:
    1cec:	01cc0127 	.word	0x01cc0127

00001cf0 <.x6a74>:
    1cf0:	20000a78 	.word	0x20000a78

00001cf4 <.x6a78>:
    1cf4:	c100c05b 	.word	0xc100c05b

00001cf8 <.x6a7c>:
    1cf8:	20000a2c 	.word	0x20000a2c

00001cfc <.x6a80>:
    1cfc:	20000a74 	.word	0x20000a74

00001d00 <.x6a84>:
    1d00:	02bf01f3 	.word	0x02bf01f3

00001d04 <.x6a88>:
    1d04:	a127c05b 	.word	0xa127c05b

00001d08 <.gof_a24_add>:
    1d08:	20000a24 	.word	0x20000a24

00001d0c <.gof_a1c_add>:
    1d0c:	20000a1c 	.word	0x20000a1c

00001d10 <.gof_a04_add>:
    1d10:	20000a04 	.word	0x20000a04

00001d14 <.gof_a18_add>:
    1d14:	20000a18 	.word	0x20000a18

00001d18 <.x6a9c>:
    1d18:	20000a14 	.word	0x20000a14

00001d1c <.x6aa0>:
    1d1c:	02810002 	.word	0x02810002

00001d20 <.x6aa4>:
    1d20:	20000a0c 	.word	0x20000a0c

00001d24 <.x6aa8>:
    1d24:	027f0002 	.word	0x027f0002

00001d28 <.x6aac>:
    1d28:	20000a34 	.word	0x20000a34

00001d2c <.x6ab0>:
    1d2c:	01df0050 	.word	0x01df0050

00001d30 <.x6ab4>:
    1d30:	20000a4c 	.word	0x20000a4c

00001d34 <.x6ab8>:
    1d34:	20000a48 	.word	0x20000a48

00001d38 <.x6abc>:
    1d38:	aa432793 	.word	0xaa432793

00001d3c <.x6ac0>:
    1d3c:	09244920 	.word	0x09244920

00001d40 <goforce_init1>:
    1d40:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    1d44:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1d48:	e3a03010 	mov	r3, #16	; 0x10
    1d4c:	e3a00032 	mov	r0, #50	; 0x32
    1d50:	e5823000 	str	r3, [r2]
    1d54:	eb00033a 	bl	2a44 <highdelay>
    1d58:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1d5c:	e3833004 	orr	r3, r3, #4	; 0x4
    1d60:	e3a0a020 	mov	sl, #32	; 0x20
    1d64:	e3a00032 	mov	r0, #50	; 0x32
    1d68:	e583a000 	str	sl, [r3]
    1d6c:	eb000334 	bl	2a44 <highdelay>
    1d70:	e3a04202 	mov	r4, #536870912	; 0x20000000
    1d74:	e384401c 	orr	r4, r4, #28	; 0x1c
    1d78:	e3a09000 	mov	r9, #0	; 0x0
    1d7c:	e3a00014 	mov	r0, #20	; 0x14
    1d80:	e5849000 	str	r9, [r4]
    1d84:	eb00032e 	bl	2a44 <highdelay>
    1d88:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1d8c:	e3a05202 	mov	r5, #536870912	; 0x20000000
    1d90:	e3833028 	orr	r3, r3, #40	; 0x28
    1d94:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1d98:	e385502c 	orr	r5, r5, #44	; 0x2c
    1d9c:	e5839000 	str	r9, [r3]
    1da0:	e59f3468 	ldr	r3, [pc, #1128]	; 2210 <.x6f3c>
    1da4:	e3822038 	orr	r2, r2, #56	; 0x38
    1da8:	e3a01202 	mov	r1, #536870912	; 0x20000000
    1dac:	e5859000 	str	r9, [r5]
    1db0:	e3a06202 	mov	r6, #536870912	; 0x20000000
    1db4:	e5829000 	str	r9, [r2]
    1db8:	e3811040 	orr	r1, r1, #64	; 0x40
    1dbc:	e3a07202 	mov	r7, #536870912	; 0x20000000
    1dc0:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1dc4:	e3866048 	orr	r6, r6, #72	; 0x48
    1dc8:	e5819000 	str	r9, [r1]
    1dcc:	e3877050 	orr	r7, r7, #80	; 0x50
    1dd0:	e382205c 	orr	r2, r2, #92	; 0x5c
    1dd4:	e5863000 	str	r3, [r6]
    1dd8:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1ddc:	e5879000 	str	r9, [r7]
    1de0:	e5829000 	str	r9, [r2]
    1de4:	e3833060 	orr	r3, r3, #96	; 0x60
    1de8:	e3a0201f 	mov	r2, #31	; 0x1f
    1dec:	e5832000 	str	r2, [r3]
    1df0:	e3a00032 	mov	r0, #50	; 0x32
    1df4:	eb000312 	bl	2a44 <highdelay>
    1df8:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1dfc:	e383300c 	orr	r3, r3, #12	; 0xc
    1e00:	e3a0202b 	mov	r2, #43	; 0x2b
    1e04:	e5832000 	str	r2, [r3]
    1e08:	e3a00004 	mov	r0, #4	; 0x4
    1e0c:	eb00030c 	bl	2a44 <highdelay>
    1e10:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1e14:	e3a03b09 	mov	r3, #9216	; 0x2400
    1e18:	e3822008 	orr	r2, r2, #8	; 0x8
    1e1c:	e383303f 	orr	r3, r3, #63	; 0x3f
    1e20:	e5823000 	str	r3, [r2]
    1e24:	e3a00005 	mov	r0, #5	; 0x5
    1e28:	eb000305 	bl	2a44 <highdelay>
    1e2c:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1e30:	e3a03d3b 	mov	r3, #3776	; 0xec0
    1e34:	e3822010 	orr	r2, r2, #16	; 0x10
    1e38:	e3833009 	orr	r3, r3, #9	; 0x9
    1e3c:	e5823000 	str	r3, [r2]
    1e40:	e3a00005 	mov	r0, #5	; 0x5
    1e44:	eb0002fe 	bl	2a44 <highdelay>
    1e48:	e3a01202 	mov	r1, #536870912	; 0x20000000
    1e4c:	e3a03c21 	mov	r3, #8448	; 0x2100
    1e50:	e3a00202 	mov	r0, #536870912	; 0x20000000
    1e54:	e3811c01 	orr	r1, r1, #256	; 0x100
    1e58:	e3833005 	orr	r3, r3, #5	; 0x5
    1e5c:	e3a0e202 	mov	lr, #536870912	; 0x20000000
    1e60:	e3a02b11 	mov	r2, #17408	; 0x4400
    1e64:	e3800f41 	orr	r0, r0, #260	; 0x104
    1e68:	e3a08001 	mov	r8, #1	; 0x1
    1e6c:	e5813000 	str	r3, [r1]
    1e70:	e38ee014 	orr	lr, lr, #20	; 0x14
    1e74:	e3822002 	orr	r2, r2, #2	; 0x2
    1e78:	e5808000 	str	r8, [r0]
    1e7c:	e58e2000 	str	r2, [lr]
    1e80:	e3a00005 	mov	r0, #5	; 0x5
    1e84:	eb0002ee 	bl	2a44 <highdelay>
    1e88:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1e8c:	e3833018 	orr	r3, r3, #24	; 0x18
    1e90:	e3a00005 	mov	r0, #5	; 0x5
    1e94:	e5839000 	str	r9, [r3]
    1e98:	eb0002e9 	bl	2a44 <highdelay>
    1e9c:	e3a03e32 	mov	r3, #800	; 0x320
    1ea0:	e5843000 	str	r3, [r4]
    1ea4:	e3a04202 	mov	r4, #536870912	; 0x20000000
    1ea8:	e3844020 	orr	r4, r4, #32	; 0x20
    1eac:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1eb0:	e3a03e11 	mov	r3, #272	; 0x110
    1eb4:	e5849000 	str	r9, [r4]
    1eb8:	e3822030 	orr	r2, r2, #48	; 0x30
    1ebc:	e3833001 	orr	r3, r3, #1	; 0x1
    1ec0:	e5858000 	str	r8, [r5]
    1ec4:	e3a00005 	mov	r0, #5	; 0x5
    1ec8:	e5823000 	str	r3, [r2]
    1ecc:	eb0002dc 	bl	2a44 <highdelay>
    1ed0:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1ed4:	e3833034 	orr	r3, r3, #52	; 0x34
    1ed8:	e5839000 	str	r9, [r3]
    1edc:	e3a00005 	mov	r0, #5	; 0x5
    1ee0:	eb0002d7 	bl	2a44 <highdelay>
    1ee4:	e5869000 	str	r9, [r6]
    1ee8:	e3a00005 	mov	r0, #5	; 0x5
    1eec:	eb0002d4 	bl	2a44 <highdelay>
    1ef0:	e5879000 	str	r9, [r7]
    1ef4:	e3a00005 	mov	r0, #5	; 0x5
    1ef8:	eb0002d1 	bl	2a44 <highdelay>
    1efc:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1f00:	e3833064 	orr	r3, r3, #100	; 0x64
    1f04:	e3a02004 	mov	r2, #4	; 0x4
    1f08:	e5832000 	str	r2, [r3]
    1f0c:	e3a00005 	mov	r0, #5	; 0x5
    1f10:	eb0002cb 	bl	2a44 <highdelay>
    1f14:	e59f32f0 	ldr	r3, [pc, #752]	; 220c <.x6f38>
    1f18:	e3a01202 	mov	r1, #536870912	; 0x20000000
    1f1c:	e3a02202 	mov	r2, #536870912	; 0x20000000
    1f20:	e59f72e0 	ldr	r7, [pc, #736]	; 2208 <.x6f34>
    1f24:	e3811f42 	orr	r1, r1, #264	; 0x108
    1f28:	e3822f43 	orr	r2, r2, #268	; 0x10c
    1f2c:	e3a00024 	mov	r0, #36	; 0x24
    1f30:	e5813000 	str	r3, [r1]
    1f34:	e59f12c8 	ldr	r1, [pc, #712]	; 2204 <.gof_a4c_add>
    1f38:	e3a06202 	mov	r6, #536870912	; 0x20000000
    1f3c:	e5820000 	str	r0, [r2]
    1f40:	e5848000 	str	r8, [r4]
    1f44:	e59f02b4 	ldr	r0, [pc, #692]	; 2200 <.x6f2c>
    1f48:	e3866d29 	orr	r6, r6, #2624	; 0xa40
    1f4c:	e5879000 	str	r9, [r7]
    1f50:	e3a04d0f 	mov	r4, #960	; 0x3c0
    1f54:	e59f22a0 	ldr	r2, [pc, #672]	; 21fc <.gof_a34_add>
    1f58:	e59f3298 	ldr	r3, [pc, #664]	; 21f8 <.x6f24>
    1f5c:	e5869000 	str	r9, [r6]
    1f60:	e3a0e202 	mov	lr, #536870912	; 0x20000000
    1f64:	e5814000 	str	r4, [r1]
    1f68:	e59f4284 	ldr	r4, [pc, #644]	; 21f4 <.x6f20>
    1f6c:	e3a0177a 	mov	r1, #31981568	; 0x1e80000
    1f70:	e38eeea3 	orr	lr, lr, #2608	; 0xa30
    1f74:	e3811008 	orr	r1, r1, #8	; 0x8
    1f78:	e58e0000 	str	r0, [lr]
    1f7c:	e59f026c 	ldr	r0, [pc, #620]	; 21f0 <.x6f1c>
    1f80:	e59fe264 	ldr	lr, [pc, #612]	; 21ec <.gof_a14_add>
    1f84:	e3a05202 	mov	r5, #536870912	; 0x20000000
    1f88:	e5823000 	str	r3, [r2]
    1f8c:	e59f3254 	ldr	r3, [pc, #596]	; 21e8 <.x6f14>
    1f90:	e5841000 	str	r1, [r4]
    1f94:	e59f1248 	ldr	r1, [pc, #584]	; 21e4 <.x6f10>
    1f98:	e3a02701 	mov	r2, #262144	; 0x40000
    1f9c:	e3855ea1 	orr	r5, r5, #2576	; 0xa10
    1fa0:	e3822e1f 	orr	r2, r2, #496	; 0x1f0
    1fa4:	e5850000 	str	r0, [r5]
    1fa8:	e3a00901 	mov	r0, #16384	; 0x4000
    1fac:	e58e2000 	str	r2, [lr]
    1fb0:	e59f4228 	ldr	r4, [pc, #552]	; 21e0 <.x6f0c>
    1fb4:	e59fe220 	ldr	lr, [pc, #544]	; 21dc <.x6f08>
    1fb8:	e5813000 	str	r3, [r1]
    1fbc:	e59f1214 	ldr	r1, [pc, #532]	; 21d8 <.x6f04>
    1fc0:	e3800044 	orr	r0, r0, #68	; 0x44
    1fc4:	e3a08202 	mov	r8, #536870912	; 0x20000000
    1fc8:	e3888c0a 	orr	r8, r8, #2560	; 0xa00
    1fcc:	e59f2200 	ldr	r2, [pc, #512]	; 21d4 <.x6f00>
    1fd0:	e5880000 	str	r0, [r8]
    1fd4:	e3a00003 	mov	r0, #3	; 0x3
    1fd8:	e3a03916 	mov	r3, #360448	; 0x58000
    1fdc:	e5840000 	str	r0, [r4]
    1fe0:	e3833004 	orr	r3, r3, #4	; 0x4
    1fe4:	e58e1000 	str	r1, [lr]
    1fe8:	e5823000 	str	r3, [r2]
    1fec:	e3a03202 	mov	r3, #536870912	; 0x20000000
    1ff0:	e3833eaa 	orr	r3, r3, #2720	; 0xaa0
    1ff4:	e5869000 	str	r9, [r6]
    1ff8:	e3a00c02 	mov	r0, #512	; 0x200
    1ffc:	e3a02202 	mov	r2, #536870912	; 0x20000000
    2000:	e5879000 	str	r9, [r7]
    2004:	e5830000 	str	r0, [r3]
    2008:	e59f11c0 	ldr	r1, [pc, #448]	; 21d0 <.x6efc>
    200c:	e3a0080a 	mov	r0, #655360	; 0xa0000
    2010:	e3822c0b 	orr	r2, r2, #2816	; 0xb00
    2014:	e5820000 	str	r0, [r2]
    2018:	e59f31ac 	ldr	r3, [pc, #428]	; 21cc <.x6ef8>
    201c:	e3a00873 	mov	r0, #7536640	; 0x730000
    2020:	e5810000 	str	r0, [r1]
    2024:	e3a0103f 	mov	r1, #63	; 0x3f
    2028:	e3a02202 	mov	r2, #536870912	; 0x20000000
    202c:	e5831000 	str	r1, [r3]
    2030:	e59fe190 	ldr	lr, [pc, #400]	; 21c8 <.x6ef4>
    2034:	e59f5188 	ldr	r5, [pc, #392]	; 21c4 <.x6ef0>
    2038:	e3a03403 	mov	r3, #50331648	; 0x3000000
    203c:	e3822eb1 	orr	r2, r2, #2832	; 0xb10
    2040:	e59f0178 	ldr	r0, [pc, #376]	; 21c0 <.x6eec>
    2044:	e59f1170 	ldr	r1, [pc, #368]	; 21bc <.x6ee8>
    2048:	e5823000 	str	r3, [r2]
    204c:	e59f2164 	ldr	r2, [pc, #356]	; 21b8 <.x6ee4>
    2050:	e59f315c 	ldr	r3, [pc, #348]	; 21b4 <.x6ee0>
    2054:	e58e5000 	str	r5, [lr]
    2058:	e5801000 	str	r1, [r0]
    205c:	e59f114c 	ldr	r1, [pc, #332]	; 21b0 <.x6edc>
    2060:	e5823000 	str	r3, [r2]
    2064:	e59f3140 	ldr	r3, [pc, #320]	; 21ac <.x6ed8>
    2068:	e3a02202 	mov	r2, #536870912	; 0x20000000
    206c:	e3822eb2 	orr	r2, r2, #2848	; 0xb20
    2070:	e3a06701 	mov	r6, #262144	; 0x40000
    2074:	e59fe12c 	ldr	lr, [pc, #300]	; 21a8 <.x6ed4>
    2078:	e5813000 	str	r3, [r1]
    207c:	e3a04202 	mov	r4, #536870912	; 0x20000000
    2080:	e3a00c01 	mov	r0, #256	; 0x100
    2084:	e5826000 	str	r6, [r2]
    2088:	e59f2114 	ldr	r2, [pc, #276]	; 21a4 <.x6ed0>
    208c:	e3844eb3 	orr	r4, r4, #2864	; 0xb30
    2090:	e3800001 	orr	r0, r0, #1	; 0x1
    2094:	e3a03cff 	mov	r3, #65280	; 0xff00
    2098:	e3a01202 	mov	r1, #536870912	; 0x20000000
    209c:	e38330f3 	orr	r3, r3, #243	; 0xf3
    20a0:	e5840000 	str	r0, [r4]
    20a4:	e59f00f4 	ldr	r0, [pc, #244]	; 21a0 <.x6ecc>
    20a8:	e3811d2d 	orr	r1, r1, #2880	; 0xb40
    20ac:	e58e9000 	str	r9, [lr]
    20b0:	e59fe0e4 	ldr	lr, [pc, #228]	; 219c <.x6ec8>
    20b4:	e5823000 	str	r3, [r2]
    20b8:	e59f30d8 	ldr	r3, [pc, #216]	; 2198 <.x6ec4>
    20bc:	e3a02ebb 	mov	r2, #2992	; 0xbb0
    20c0:	e5819000 	str	r9, [r1]
    20c4:	e59f10c8 	ldr	r1, [pc, #200]	; 2194 <.x6ec0>
    20c8:	e382200a 	orr	r2, r2, #10	; 0xa
    20cc:	e5809000 	str	r9, [r0]
    20d0:	e59f00b8 	ldr	r0, [pc, #184]	; 2190 <.x6ebc>
    20d4:	e58e2000 	str	r2, [lr]
    20d8:	e59fe0ac 	ldr	lr, [pc, #172]	; 218c <.x6eb8>
    20dc:	e5813000 	str	r3, [r1]
    20e0:	e3a03a02 	mov	r3, #8192	; 0x2000
    20e4:	e59f209c 	ldr	r2, [pc, #156]	; 2188 <.x6eb4>
    20e8:	e3a01202 	mov	r1, #536870912	; 0x20000000
    20ec:	e5803000 	str	r3, [r0]
    20f0:	e59f308c 	ldr	r3, [pc, #140]	; 2184 <.x6eb0>
    20f4:	e3811eba 	orr	r1, r1, #2976	; 0xba0
    20f8:	e58e5000 	str	r5, [lr]
    20fc:	e5819000 	str	r9, [r1]
    2100:	e5829000 	str	r9, [r2]
    2104:	e583a000 	str	sl, [r3]
    2108:	e3a00014 	mov	r0, #20	; 0x14
    210c:	eb00024c 	bl	2a44 <highdelay>
    2110:	e5983000 	ldr	r3, [r8]
    2114:	e3a00028 	mov	r0, #40	; 0x28
    2118:	e3833003 	orr	r3, r3, #3	; 0x3
    211c:	e5883000 	str	r3, [r8]
    2120:	eb000247 	bl	2a44 <highdelay>

00002124 <goforce_init2>:
    2124:	e3a03202 	mov	r3, #536870912	; 0x20000000
    2128:	e59f2050 	ldr	r2, [pc, #80]	; 2180 <.x745c>
    212c:	e3833e47 	orr	r3, r3, #1136	; 0x470
    2130:	e3a00901 	mov	r0, #16384	; 0x4000
    2134:	e5830000 	str	r0, [r3]
    2138:	e3a03801 	mov	r3, #65536	; 0x10000
    213c:	e3a01202 	mov	r1, #536870912	; 0x20000000
    2140:	e5823000 	str	r3, [r2]
    2144:	e3a03025 	mov	r3, #37	; 0x25
    2148:	e3811028 	orr	r1, r1, #40	; 0x28
    214c:	e3a00202 	mov	r0, #536870912	; 0x20000000
    2150:	e5813000 	str	r3, [r1]
    2154:	e3a01000 	mov	r1, #0	; 0x0
    2158:	e3a02a96 	mov	r2, #614400	; 0x96000
    215c:	e3800802 	orr	r0, r0, #131072	; 0x20000
    2160:	eb0004f7 	bl	3544 <bcf44>

00002164 <test2>:
    2164:	e3a00202 	mov	r0, #536870912	; 0x20000000
    2168:	e3800802 	orr	r0, r0, #131072	; 0x20000
    216c:	e3a02a96 	mov	r2, #614400	; 0x96000
    2170:	e3a01000 	mov	r1, #0	; 0x0
    2174:	eb0004f2 	bl	3544 <bcf44>
    2178:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    217c:	e12fff1e 	bx	lr

00002180 <.x745c>:
    2180:	20000474 	.word	0x20000474

00002184 <.x6eb0>:
    2184:	20000b5c 	.word	0x20000b5c

00002188 <.x6eb4>:
    2188:	20000bac 	.word	0x20000bac

0000218c <.x6eb8>:
    218c:	20000b58 	.word	0x20000b58

00002190 <.x6ebc>:
    2190:	20000b54 	.word	0x20000b54

00002194 <.x6ec0>:
    2194:	20000b48 	.word	0x20000b48

00002198 <.x6ec4>:
    2198:	04001541 	.word	0x04001541

0000219c <.x6ec8>:
    219c:	20000b4c 	.word	0x20000b4c

000021a0 <.x6ecc>:
    21a0:	20000b44 	.word	0x20000b44

000021a4 <.x6ed0>:
    21a4:	20000b3c 	.word	0x20000b3c

000021a8 <.x6ed4>:
    21a8:	20000b34 	.word	0x20000b34

000021ac <.x6ed8>:
    21ac:	537d2fca 	.word	0x537d2fca

000021b0 <.x6edc>:
    21b0:	20000b2c 	.word	0x20000b2c

000021b4 <.x6ee0>:
    21b4:	50512a00 	.word	0x50512a00

000021b8 <.x6ee4>:
    21b8:	20000b1c 	.word	0x20000b1c

000021bc <.x6ee8>:
    21bc:	28051005 	.word	0x28051005

000021c0 <.x6eec>:
    21c0:	20000b18 	.word	0x20000b18

000021c4 <.x6ef0>:
    21c4:	55555555 	.word	0x55555555

000021c8 <.x6ef4>:
    21c8:	20000b14 	.word	0x20000b14

000021cc <.x6ef8>:
    21cc:	20000b08 	.word	0x20000b08

000021d0 <.x6efc>:
    21d0:	20000b04 	.word	0x20000b04

000021d4 <.x6f00>:
    21d4:	20000a28 	.word	0x20000a28

000021d8 <.x6f04>:
    21d8:	02be02bc 	.word	0x02be02bc

000021dc <.x6f08>:
    21dc:	20000a1c 	.word	0x20000a1c

000021e0 <.x6f0c>:
    21e0:	20000a04 	.word	0x20000a04

000021e4 <.x6f10>:
    21e4:	20000a18 	.word	0x20000a18

000021e8 <.x6f14>:
    21e8:	00010287 	.word	0x00010287

000021ec <.gof_a14_add>:
    21ec:	20000a14 	.word	0x20000a14

000021f0 <.x6f1c>:
    21f0:	02830004 	.word	0x02830004

000021f4 <.x6f20>:
    21f4:	20000a0c 	.word	0x20000a0c

000021f8 <.x6f24>:
    21f8:	027f0004 	.word	0x027f0004

000021fc <.gof_a34_add>:
    21fc:	20000a34 	.word	0x20000a34

00002200 <.x6f2c>:
    2200:	01df0008 	.word	0x01df0008

00002204 <.gof_a4c_add>:
    2204:	20000a4c 	.word	0x20000a4c

00002208 <.x6f34>:
    2208:	20000a48 	.word	0x20000a48

0000220c <.x6f38>:
    220c:	aa432793 	.word	0xaa432793

00002210 <.x6f3c>:
    2210:	09244920 	.word	0x09244920

00002214 <write_video1>:
    2214:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2218:	e24dd004 	sub	sp, sp, #4	; 0x4
    221c:	e59f90b4 	ldr	r9, [pc, #180]	; 22d8 <.x7004>
    2220:	e3a0e000 	mov	lr, #0	; 0x0
    2224:	e3a04000 	mov	r4, #0	; 0x0
    2228:	e5d92000 	ldrb	r2, [r9]
    222c:	e5d93001 	ldrb	r3, [r9, #1]
    2230:	e3a00002 	mov	r0, #2	; 0x2
    2234:	e2828c01 	add	r8, r2, #256	; 0x100
    2238:	e0020893 	mul	r2, r3, r8
    223c:	e2681e1e 	rsb	r1, r8, #480	; 0x1e0
    2240:	e1a03142 	asr	r3, r2, #2
    2244:	e0823ea3 	add	r3, r2, r3, lsr #29
    2248:	e1a031c3 	asr	r3, r3, #3
    224c:	e2837002 	add	r7, r3, #2	; 0x2
    2250:	e0813fa1 	add	r3, r1, r1, lsr #31
    2254:	e1a0a0c3 	asr	sl, r3, #1
    2258:	e58d7000 	str	r7, [sp]
    225c:	e3570002 	cmp	r7, #2	; 0x2
    2260:	da000019 	ble	22cc <b6ff8>
    2264:	e3a06202 	mov	r6, #536870912	; 0x20000000
    2268:	e3866802 	orr	r6, r6, #131072	; 0x20000
    226c:	e3a0b001 	mov	fp, #1	; 0x1
    2270:	e28430fa 	add	r3, r4, #250	; 0xfa
    2274:	e0633203 	rsb	r3, r3, r3, lsl #4
    2278:	e7d05009 	ldrb	r5, [r0, r9]
    227c:	e08a1283 	add	r1, sl, r3, lsl #5
    2280:	e3a02000 	mov	r2, #0	; 0x0
    2284:	e3a0701f 	mov	r7, #31	; 0x1f

00002288 <b6fb4>:
    2288:	e115021b 	tst	r5, fp, lsl r2
    228c:	e2822001 	add	r2, r2, #1	; 0x1
    2290:	1081300e 	addne	r3, r1, lr
    2294:	10863083 	addne	r3, r6, r3, lsl #1
    2298:	e28ee001 	add	lr, lr, #1	; 0x1
    229c:	11c370b0 	strhne	r7, [r3]
    22a0:	e15e0008 	cmp	lr, r8
    22a4:	03a0e000 	moveq	lr, #0	; 0x0
    22a8:	02844001 	addeq	r4, r4, #1	; 0x1
    22ac:	02811e1e 	addeq	r1, r1, #480	; 0x1e0
    22b0:	e3520008 	cmp	r2, #8	; 0x8
    22b4:	bafffff3 	blt	2288 <b6fb4>
    22b8:	e59d7000 	ldr	r7, [sp]
    22bc:	e2800001 	add	r0, r0, #1	; 0x1
    22c0:	e59f9010 	ldr	r9, [pc, #16]	; 22d8 <.x7004>
    22c4:	e1500007 	cmp	r0, r7
    22c8:	bafffffe 	blt	0 <b6f9c>

000022cc <b6ff8>:
    22cc:	e28dd004 	add	sp, sp, #4	; 0x4
    22d0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    22d4:	e12fff1e 	bx	lr

000022d8 <.x7004>:
    22d8:	80022600 	.word	0x80022600

000022dc <b7008>:
    22dc:	e92d4070 	push	{r4, r5, r6, lr}
    22e0:	e3a054b1 	mov	r5, #-1325400064	; 0xb1000000
    22e4:	e3855501 	orr	r5, r5, #4194304	; 0x400000
    22e8:	e3a04000 	mov	r4, #0	; 0x0
    22ec:	e1b06000 	movs	r6, r0
    22f0:	0a00000b 	beq	2324 <b7050>

000022f4 <b7020>:
    22f4:	e5953000 	ldr	r3, [r5]
    22f8:	e3130010 	tst	r3, #16	; 0x10
    22fc:	1a000007 	bne	2320 <b704c>
    2300:	e3a0000a 	mov	r0, #10	; 0xa
    2304:	eb0001d9 	bl	2a70 <lowdelay>
    2308:	e2843001 	add	r3, r4, #1	; 0x1
    230c:	e1a04803 	lsl	r4, r3, #16
    2310:	e1a04824 	lsr	r4, r4, #16
    2314:	e1540006 	cmp	r4, r6
    2318:	3afffff5 	bcc	22f4 <b7020>
    231c:	ea000000 	b	2324 <b7050>

00002320 <b704c>:
    2320:	e3a04000 	mov	r4, #0	; 0x0

00002324 <b7050>:
    2324:	e3540000 	cmp	r4, #0	; 0x0
    2328:	13a00001 	movne	r0, #1	; 0x1
    232c:	18bd4070 	popne	{r4, r5, r6, lr}
    2330:	03a00000 	moveq	r0, #0	; 0x0
    2334:	08bd4070 	popeq	{r4, r5, r6, lr}
    2338:	e12fff1e 	bx	lr

0000233c <b7068>:
    233c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2340:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2344:	e12fff1e 	bx	lr

00002348 <.x7270>:
    2348:	8002244c 	.word	0x8002244c

0000234c <.x7274>:
    234c:	80022458 	.word	0x80022458

00002350 <.x7278>:
    2350:	80022468 	.word	0x80022468

00002354 <.x727c>:
    2354:	8002247c 	.word	0x8002247c

00002358 <.x7280>:
    2358:	b1600040 	.word	0xb1600040

0000235c <.x7284>:
    235c:	b1600044 	.word	0xb1600044

00002360 <goforce_init>:
    2360:	e92d4070 	push	{r4, r5, r6, lr}
    2364:	e3a03153 	mov	r3, #-1073741804	; 0xc0000014
    2368:	e3a0120b 	mov	r1, #-1342177280	; 0xb0000000
    236c:	e243353e 	sub	r3, r3, #260046848	; 0xf800000
    2370:	e5932000 	ldr	r2, [r3]
    2374:	e3811502 	orr	r1, r1, #8388608	; 0x800000
    2378:	e5911000 	ldr	r1, [r1]
    237c:	e59f0158 	ldr	r0, [pc, #344]	; 24dc <.x7468>
    2380:	eb000315 	bl	2fdc <b847c>
    2384:	e3a02143 	mov	r2, #-1073741808	; 0xc0000010
    2388:	e24226ea 	sub	r2, r2, #245366784	; 0xea00000
    238c:	e5923000 	ldr	r3, [r2]
    2390:	e3a01163 	mov	r1, #-1073741800	; 0xc0000018
    2394:	e24116ea 	sub	r1, r1, #245366784	; 0xea00000
    2398:	e3c33803 	bic	r3, r3, #196608	; 0x30000
    239c:	e5823000 	str	r3, [r2]
    23a0:	e5923000 	ldr	r3, [r2]
    23a4:	e3a00153 	mov	r0, #-1073741804	; 0xc0000014
    23a8:	e24006ea 	sub	r0, r0, #245366784	; 0xea00000
    23ac:	e3833801 	orr	r3, r3, #65536	; 0x10000
    23b0:	e5823000 	str	r3, [r2]
    23b4:	e5913000 	ldr	r3, [r1]
    23b8:	e3a04183 	mov	r4, #-1073741792	; 0xc0000020
    23bc:	e24446ea 	sub	r4, r4, #245366784	; 0xea00000
    23c0:	e3833c01 	orr	r3, r3, #256	; 0x100
    23c4:	e5813000 	str	r3, [r1]
    23c8:	e5903000 	ldr	r3, [r0]
    23cc:	e3a0e1a3 	mov	lr, #-1073741784	; 0xc0000028
    23d0:	e24ee6ea 	sub	lr, lr, #245366784	; 0xea00000
    23d4:	e3833c01 	orr	r3, r3, #256	; 0x100
    23d8:	e5803000 	str	r3, [r0]
    23dc:	e5943000 	ldr	r3, [r4]
    23e0:	e3a02193 	mov	r2, #-1073741788	; 0xc0000024
    23e4:	e24226ea 	sub	r2, r2, #245366784	; 0xea00000
    23e8:	e3c3300c 	bic	r3, r3, #12	; 0xc
    23ec:	e5843000 	str	r3, [r4]
    23f0:	e5943000 	ldr	r3, [r4]
    23f4:	e3a061d3 	mov	r6, #-1073741772	; 0xc0000034
    23f8:	e24666ea 	sub	r6, r6, #245366784	; 0xea00000
    23fc:	e3833004 	orr	r3, r3, #4	; 0x4
    2400:	e5843000 	str	r3, [r4]
    2404:	e59e3000 	ldr	r3, [lr]
    2408:	e3a00064 	mov	r0, #100	; 0x64
    240c:	e3833002 	orr	r3, r3, #2	; 0x2
    2410:	e58e3000 	str	r3, [lr]
    2414:	e5923000 	ldr	r3, [r2]
    2418:	e3c33002 	bic	r3, r3, #2	; 0x2
    241c:	e5823000 	str	r3, [r2]
    2420:	e5963000 	ldr	r3, [r6]
    2424:	e3c33004 	bic	r3, r3, #4	; 0x4
    2428:	e5863000 	str	r3, [r6]
    242c:	eb00018f 	bl	2a70 <lowdelay>
    2430:	e5963000 	ldr	r3, [r6]
    2434:	e3a051c3 	mov	r5, #-1073741776	; 0xc0000030
    2438:	e24556ea 	sub	r5, r5, #245366784	; 0xea00000
    243c:	e3833004 	orr	r3, r3, #4	; 0x4
    2440:	e5863000 	str	r3, [r6]
    2444:	e5953000 	ldr	r3, [r5]
    2448:	e3a041e3 	mov	r4, #-1073741768	; 0xc0000038
    244c:	e24446ea 	sub	r4, r4, #245366784	; 0xea00000
    2450:	e3c33303 	bic	r3, r3, #201326592	; 0xc000000
    2454:	e5853000 	str	r3, [r5]
    2458:	e5953000 	ldr	r3, [r5]
    245c:	e3a00064 	mov	r0, #100	; 0x64
    2460:	e3833301 	orr	r3, r3, #67108864	; 0x4000000
    2464:	e5853000 	str	r3, [r5]
    2468:	e5943000 	ldr	r3, [r4]
    246c:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    2470:	e5843000 	str	r3, [r4]
    2474:	e5963000 	ldr	r3, [r6]
    2478:	e3c33a02 	bic	r3, r3, #8192	; 0x2000
    247c:	e5863000 	str	r3, [r6]
    2480:	e5963000 	ldr	r3, [r6]
    2484:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    2488:	e5863000 	str	r3, [r6]
    248c:	eb000177 	bl	2a70 <lowdelay>
    2490:	e5953000 	ldr	r3, [r5]
    2494:	e3c33103 	bic	r3, r3, #-1073741824	; 0xc0000000
    2498:	e5853000 	str	r3, [r5]
    249c:	e5953000 	ldr	r3, [r5]
    24a0:	e5853000 	str	r3, [r5]
    24a4:	e5943000 	ldr	r3, [r4]
    24a8:	e3833902 	orr	r3, r3, #32768	; 0x8000
    24ac:	e5843000 	str	r3, [r4]
    24b0:	e5963000 	ldr	r3, [r6]
    24b4:	e3130902 	tst	r3, #32768	; 0x8000
    24b8:	e59f0018 	ldr	r0, [pc, #24]	; 24d8 <.x7464>
    24bc:	eb0002c6 	bl	2fdc <b847c>

000024c0 <try_gof_1>:
    24c0:	ebfffe1e 	bl	1d40 <goforce_init1>

000024c4 <gfi3>:
    24c4:	eafffcaf 	b	1788 <samsung_lcd_init>

000024c8 <stophere11>:
    24c8:	eafffffe 	b	24c8 <stophere11>

000024cc <.sl_val>:
    24cc:	30010000 	.word	0x30010000

000024d0 <.bwcon>:
    24d0:	22121120 	.word	0x22121120

000024d4 <.x7460>:
    24d4:	8002248c 	.word	0x8002248c

000024d8 <.x7464>:
    24d8:	800224a0 	.word	0x800224a0

000024dc <.x7468>:
    24dc:	800224b4 	.word	0x800224b4

000024e0 <goforce_preinit>:
    24e0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    24e4:	e24ddf99 	sub	sp, sp, #612	; 0x264
    24e8:	e59f349c 	ldr	r3, [pc, #1180]	; 298c <.x7918>
    24ec:	e5933000 	ldr	r3, [r3]
    24f0:	e58d3260 	str	r3, [sp, #608]
    24f4:	e3a00205 	mov	r0, #1342177280	; 0x50000000
    24f8:	e3800901 	orr	r0, r0, #16384	; 0x4000
    24fc:	e3a01000 	mov	r1, #0	; 0x0
    2500:	eb0001aa 	bl	2bb0 <b7b44>
    2504:	e59f347c 	ldr	r3, [pc, #1148]	; 2988 <.x7914>
    2508:	e5830000 	str	r0, [r3]

0000250c <test_03>:
    250c:	e3a004b1 	mov	r0, #-1325400064	; 0xb1000000
    2510:	e3a03cff 	mov	r3, #65280	; 0xff00
    2514:	e3800603 	orr	r0, r0, #3145728	; 0x300000
    2518:	e3833019 	orr	r3, r3, #25	; 0x19
    251c:	e5803000 	str	r3, [r0]
    2520:	e3a03b1f 	mov	r3, #31744	; 0x7c00
    2524:	e3a02113 	mov	r2, #-1073741820	; 0xc0000004
    2528:	e3a01123 	mov	r1, #-1073741816	; 0xc0000008
    252c:	e38330fb 	orr	r3, r3, #251	; 0xfb
    2530:	e24226ed 	sub	r2, r2, #248512512	; 0xed00000
    2534:	e24116ed 	sub	r1, r1, #248512512	; 0xed00000
    2538:	e5823000 	str	r3, [r2]
    253c:	e5813000 	str	r3, [r1]
    2540:	e5903000 	ldr	r3, [r0]
    2544:	e3833020 	orr	r3, r3, #32	; 0x20
    2548:	e5803000 	str	r3, [r0]
    254c:	ebffff83 	bl	2360 <goforce_init>
    2550:	e3a01143 	mov	r1, #-1073741808	; 0xc0000010
    2554:	e24116ea 	sub	r1, r1, #245366784	; 0xea00000
    2558:	e5913000 	ldr	r3, [r1]
    255c:	e3a02163 	mov	r2, #-1073741800	; 0xc0000018
    2560:	e24226ea 	sub	r2, r2, #245366784	; 0xea00000
    2564:	e3c33003 	bic	r3, r3, #3	; 0x3
    2568:	e5813000 	str	r3, [r1]
    256c:	e5913000 	ldr	r3, [r1]
    2570:	e3833002 	orr	r3, r3, #2	; 0x2
    2574:	e5813000 	str	r3, [r1]
    2578:	e5923000 	ldr	r3, [r2]
    257c:	e3833001 	orr	r3, r3, #1	; 0x1
    2580:	e5823000 	str	r3, [r2]

00002584 <test_03_loop>:
    2584:	eafffffe 	b	2584 <test_03_loop>
    2588:	ebffff21 	bl	2214 <write_video1>
    258c:	ebffff6a 	bl	233c <b7068>
    2590:	e59f03ec 	ldr	r0, [pc, #1004]	; 2984 <.x7910>
    2594:	e59f33e4 	ldr	r3, [pc, #996]	; 2980 <.x790c>
    2598:	e59f13dc 	ldr	r1, [pc, #988]	; 297c <.x7908>
    259c:	e5902000 	ldr	r2, [r0]
    25a0:	e1520003 	cmp	r2, r3
    25a4:	03a03000 	moveq	r3, #0	; 0x0
    25a8:	05803000 	streq	r3, [r0]
    25ac:	03a03001 	moveq	r3, #1	; 0x1
    25b0:	05813000 	streq	r3, [r1]
    25b4:	e5913000 	ldr	r3, [r1]
    25b8:	e3530001 	cmp	r3, #1	; 0x1
    25bc:	1a0000d4 	bne	2914 <b78a0>
    25c0:	e3a02000 	mov	r2, #0	; 0x0
    25c4:	e3a01000 	mov	r1, #0	; 0x0
    25c8:	e3a00000 	mov	r0, #0	; 0x0
    25cc:	e3a04000 	mov	r4, #0	; 0x0
    25d0:	e3a08000 	mov	r8, #0	; 0x0
    25d4:	eb00039f 	bl	3458 <bbadc>
    25d8:	e28d0000 	add	r0, sp, #0	; 0x0
    25dc:	eb000380 	bl	33e4 <ba044>
    25e0:	e3500000 	cmp	r0, #0	; 0x0
    25e4:	0a00000b 	beq	2618 <b75a4>
    25e8:	e59d3004 	ldr	r3, [sp, #4]
    25ec:	e3a04000 	mov	r4, #0	; 0x0
    25f0:	e3530000 	cmp	r3, #0	; 0x0
    25f4:	0a000007 	beq	2618 <b75a4>

000025f8 <b7584>:
    25f8:	e1a00004 	mov	r0, r4
    25fc:	eb0003ac 	bl	34b4 <bbd74>
    2600:	e310000a 	tst	r0, #10	; 0xa
    2604:	0a000003 	beq	2618 <b75a4>
    2608:	e59d3004 	ldr	r3, [sp, #4]
    260c:	e2844001 	add	r4, r4, #1	; 0x1
    2610:	e1540003 	cmp	r4, r3
    2614:	3afffff7 	bcc	25f8 <b7584>

00002618 <b75a4>:
    2618:	e1dde0bc 	ldrh	lr, [sp, #12]
    261c:	e3a03001 	mov	r3, #1	; 0x1
    2620:	e3a02000 	mov	r2, #0	; 0x0
    2624:	e000049e 	mul	r0, lr, r4
    2628:	e28d1060 	add	r1, sp, #96	; 0x60
    262c:	eb00038d 	bl	3468 <bbd28>
    2630:	e59d3258 	ldr	r3, [sp, #600]
    2634:	e59d1254 	ldr	r1, [sp, #596]
    2638:	e3a00cff 	mov	r0, #65280	; 0xff00
    263c:	e1a03803 	lsl	r3, r3, #16
    2640:	e1a02823 	lsr	r2, r3, #16
    2644:	e1a03821 	lsr	r3, r1, #16
    2648:	e1dd50bc 	ldrh	r5, [sp, #12]
    264c:	e1833802 	orr	r3, r3, r2, lsl #16
    2650:	e28d2c02 	add	r2, sp, #512	; 0x200
    2654:	e1d225b8 	ldrh	r2, [r2, #88]
    2658:	e38000ff 	orr	r0, r0, #255	; 0xff
    265c:	e0033000 	and	r3, r3, r0
    2660:	e1831802 	orr	r1, r3, r2, lsl #16
    2664:	e1a00005 	mov	r0, r5
    2668:	ebfffffe 	bl	0 <bcfcc>
    266c:	e59d2004 	ldr	r2, [sp, #4]
    2670:	e1a06000 	mov	r6, r0
    2674:	e3a07000 	mov	r7, #0	; 0x0
    2678:	e3520000 	cmp	r2, #0	; 0x0
    267c:	0a00000e 	beq	26bc <b7648>

00002680 <b760c>:
    2680:	e3580004 	cmp	r8, #4	; 0x4
    2684:	aa00000c 	bge	26bc <b7648>
    2688:	e1a00007 	mov	r0, r7
    268c:	eb000388 	bl	34b4 <bbd74>
    2690:	e310000a 	tst	r0, #10	; 0xa
    2694:	0a000003 	beq	26a8 <b7634>
    2698:	e1a00007 	mov	r0, r7
    269c:	eb000384 	bl	34b4 <bbd74>
    26a0:	e3100002 	tst	r0, #2	; 0x2
    26a4:	02888001 	addeq	r8, r8, #1	; 0x1

000026a8 <b7634>:
    26a8:	e59d2004 	ldr	r2, [sp, #4]
    26ac:	e2877001 	add	r7, r7, #1	; 0x1
    26b0:	e1dd50bc 	ldrh	r5, [sp, #12]
    26b4:	e1570002 	cmp	r7, r2
    26b8:	3afffff0 	bcc	2680 <b760c>

000026bc <b7648>:
    26bc:	e3a07000 	mov	r7, #0	; 0x0
    26c0:	e3560000 	cmp	r6, #0	; 0x0
    26c4:	da000008 	ble	26ec <b7678>

000026c8 <b7654>:
    26c8:	e0870004 	add	r0, r7, r4
    26cc:	eb000378 	bl	34b4 <bbd74>
    26d0:	e310000a 	tst	r0, #10	; 0xa
    26d4:	12866001 	addne	r6, r6, #1	; 0x1
    26d8:	e2877001 	add	r7, r7, #1	; 0x1
    26dc:	e1570006 	cmp	r7, r6
    26e0:	bafffff8 	blt	26c8 <b7654>
    26e4:	e1dd50bc 	ldrh	r5, [sp, #12]
    26e8:	e59d2004 	ldr	r2, [sp, #4]

000026ec <b7678>:
    26ec:	e0863004 	add	r3, r6, r4
    26f0:	e2836002 	add	r6, r3, #2	; 0x2
    26f4:	e1a04006 	mov	r4, r6
    26f8:	e1560002 	cmp	r6, r2
    26fc:	2a000006 	bcs	271c <b76a8>

00002700 <b768c>:
    2700:	e1a00004 	mov	r0, r4
    2704:	eb000385 	bl	3520 <bbde0>
    2708:	e59d2004 	ldr	r2, [sp, #4]
    270c:	e2844001 	add	r4, r4, #1	; 0x1
    2710:	e1540002 	cmp	r4, r2
    2714:	3afffff9 	bcc	2700 <b768c>
    2718:	e1dd50bc 	ldrh	r5, [sp, #12]

0000271c <b76a8>:
    271c:	e2866002 	add	r6, r6, #2	; 0x2
    2720:	e3520b01 	cmp	r2, #1024	; 0x400
    2724:	1a000064 	bne	28bc <b7848>
    2728:	e0000895 	mul	r0, r5, r8
    272c:	e3a03001 	mov	r3, #1	; 0x1
    2730:	e28d2010 	add	r2, sp, #16	; 0x10
    2734:	e28d1060 	add	r1, sp, #96	; 0x60
    2738:	e0070695 	mul	r7, r5, r6
    273c:	eb000349 	bl	3468 <bbd28>
    2740:	e3a03001 	mov	r3, #1	; 0x1
    2744:	e5dd2013 	ldrb	r2, [sp, #19]
    2748:	e5dde012 	ldrb	lr, [sp, #18]
    274c:	e5dd1011 	ldrb	r1, [sp, #17]
    2750:	e5dd0010 	ldrb	r0, [sp, #16]
    2754:	e08e2402 	add	r2, lr, r2, lsl #8
    2758:	e0812402 	add	r2, r1, r2, lsl #8
    275c:	e0806402 	add	r6, r0, r2, lsl #8
    2760:	e28d2010 	add	r2, sp, #16	; 0x10
    2764:	e1a00007 	mov	r0, r7
    2768:	e28d1060 	add	r1, sp, #96	; 0x60
    276c:	eb00036c 	bl	3524 <bbea8>
    2770:	e1dd10bc 	ldrh	r1, [sp, #12]
    2774:	e3a03001 	mov	r3, #1	; 0x1
    2778:	e28d2010 	add	r2, sp, #16	; 0x10
    277c:	e0000891 	mul	r0, r1, r8
    2780:	e28d1060 	add	r1, sp, #96	; 0x60
    2784:	e2800001 	add	r0, r0, #1	; 0x1
    2788:	eb000336 	bl	3468 <bbd28>
    278c:	e3a03001 	mov	r3, #1	; 0x1
    2790:	e28d2010 	add	r2, sp, #16	; 0x10
    2794:	e28d1060 	add	r1, sp, #96	; 0x60
    2798:	e2870001 	add	r0, r7, #1	; 0x1
    279c:	eb000360 	bl	3524 <bbea8>
    27a0:	e1dd10bc 	ldrh	r1, [sp, #12]
    27a4:	e3a03001 	mov	r3, #1	; 0x1
    27a8:	e28d2010 	add	r2, sp, #16	; 0x10
    27ac:	e0000891 	mul	r0, r1, r8
    27b0:	e28d1060 	add	r1, sp, #96	; 0x60
    27b4:	e2800003 	add	r0, r0, #3	; 0x3
    27b8:	eb00032a 	bl	3468 <bbd28>
    27bc:	e5dd0013 	ldrb	r0, [sp, #19]
    27c0:	e5dd3012 	ldrb	r3, [sp, #18]
    27c4:	e5dd2011 	ldrb	r2, [sp, #17]
    27c8:	e5dd1010 	ldrb	r1, [sp, #16]
    27cc:	e0833400 	add	r3, r3, r0, lsl #8
    27d0:	e0823403 	add	r3, r2, r3, lsl #8
    27d4:	e0813403 	add	r3, r1, r3, lsl #8
    27d8:	e0435006 	sub	r5, r3, r6
    27dc:	e0854007 	add	r4, r5, r7
    27e0:	e1a00004 	mov	r0, r4
    27e4:	e3a03001 	mov	r3, #1	; 0x1
    27e8:	e28d2010 	add	r2, sp, #16	; 0x10
    27ec:	e28d1060 	add	r1, sp, #96	; 0x60
    27f0:	eb00034b 	bl	3524 <bbea8>
    27f4:	e1dd10bc 	ldrh	r1, [sp, #12]
    27f8:	e3a03001 	mov	r3, #1	; 0x1
    27fc:	e28d2010 	add	r2, sp, #16	; 0x10
    2800:	e0000891 	mul	r0, r1, r8
    2804:	e28d1060 	add	r1, sp, #96	; 0x60
    2808:	e2800002 	add	r0, r0, #2	; 0x2
    280c:	eb000315 	bl	3468 <bbd28>
    2810:	e3a03001 	mov	r3, #1	; 0x1
    2814:	e28d2010 	add	r2, sp, #16	; 0x10
    2818:	e28d1060 	add	r1, sp, #96	; 0x60
    281c:	e2440001 	sub	r0, r4, #1	; 0x1
    2820:	eb00033f 	bl	3524 <bbea8>
    2824:	e3a02c02 	mov	r2, #512	; 0x200
    2828:	e3a01000 	mov	r1, #0	; 0x0
    282c:	e28d0060 	add	r0, sp, #96	; 0x60
    2830:	eb000343 	bl	3544 <bcf44>
    2834:	e3a02010 	mov	r2, #16	; 0x10
    2838:	e3a01000 	mov	r1, #0	; 0x0
    283c:	e28d0010 	add	r0, sp, #16	; 0x10
    2840:	eb00033f 	bl	3544 <bcf44>
    2844:	e3a030ff 	mov	r3, #255	; 0xff
    2848:	e3a020ff 	mov	r2, #255	; 0xff
    284c:	e5cd3014 	strb	r3, [sp, #20]
    2850:	e5cd2015 	strb	r2, [sp, #21]
    2854:	e3a020ff 	mov	r2, #255	; 0xff
    2858:	e2453001 	sub	r3, r5, #1	; 0x1
    285c:	e3a010fb 	mov	r1, #251	; 0xfb
    2860:	e3530002 	cmp	r3, #2	; 0x2
    2864:	e5cd2017 	strb	r2, [sp, #23]
    2868:	e5cd1016 	strb	r1, [sp, #22]
    286c:	9a000028 	bls	2914 <b78a0>
    2870:	e2864002 	add	r4, r6, #2	; 0x2
    2874:	e0476006 	sub	r6, r7, r6
    2878:	e2435002 	sub	r5, r3, #2	; 0x2
    287c:	e1a03424 	lsr	r3, r4, #8
    2880:	e1a02824 	lsr	r2, r4, #16
    2884:	e1a01c24 	lsr	r1, r4, #24
    2888:	e5cd3011 	strb	r3, [sp, #17]
    288c:	e5cd2012 	strb	r2, [sp, #18]
    2890:	e5cd1013 	strb	r1, [sp, #19]
    2894:	e3a03001 	mov	r3, #1	; 0x1
    2898:	e28d2010 	add	r2, sp, #16	; 0x10
    289c:	e28d1060 	add	r1, sp, #96	; 0x60
    28a0:	e0860004 	add	r0, r6, r4
    28a4:	e5cd4010 	strb	r4, [sp, #16]
    28a8:	eb00031d 	bl	3524 <bbea8>
    28ac:	e2844001 	add	r4, r4, #1	; 0x1
    28b0:	e2555001 	subs	r5, r5, #1	; 0x1
    28b4:	1afffffe 	bne	0 <b7808>
    28b8:	ea000015 	b	2914 <b78a0>

000028bc <b7848>:
    28bc:	e1a00006 	mov	r0, r6
    28c0:	eb000316 	bl	3520 <bbde0>
    28c4:	e3500001 	cmp	r0, #1	; 0x1
    28c8:	1a000011 	bne	2914 <b78a0>
    28cc:	e1dd20bc 	ldrh	r2, [sp, #12]
    28d0:	e3a04000 	mov	r4, #0	; 0x0
    28d4:	e3520000 	cmp	r2, #0	; 0x0
    28d8:	da00000d 	ble	2914 <b78a0>

000028dc <b7868>:
    28dc:	e0204892 	mla	r0, r2, r8, r4
    28e0:	e3a03001 	mov	r3, #1	; 0x1
    28e4:	e28d2050 	add	r2, sp, #80	; 0x50
    28e8:	e28d1060 	add	r1, sp, #96	; 0x60
    28ec:	eb0002dd 	bl	3468 <bbd28>
    28f0:	e0204695 	mla	r0, r5, r6, r4
    28f4:	e3a03001 	mov	r3, #1	; 0x1
    28f8:	e28d2050 	add	r2, sp, #80	; 0x50
    28fc:	e28d1060 	add	r1, sp, #96	; 0x60
    2900:	eb000307 	bl	3524 <bbea8>
    2904:	e2844001 	add	r4, r4, #1	; 0x1
    2908:	e1dd20bc 	ldrh	r2, [sp, #12]
    290c:	e1540002 	cmp	r4, r2
    2910:	bafffff1 	blt	28dc <b7868>

00002914 <b78a0>:
    2914:	e59f105c 	ldr	r1, [pc, #92]	; 2978 <.x7904>
    2918:	e59f3054 	ldr	r3, [pc, #84]	; 2974 <.x7900>
    291c:	e3a0220a 	mov	r2, #-1610612736	; 0xa0000000
    2920:	e3822a31 	orr	r2, r2, #200704	; 0x31000
    2924:	e3a00a21 	mov	r0, #135168	; 0x21000
    2928:	e5830000 	str	r0, [r3]
    292c:	e5812000 	str	r2, [r1]
    2930:	e3a01000 	mov	r1, #0	; 0x0
    2934:	e3a0044e 	mov	r0, #1308622848	; 0x4e000000
    2938:	eb00009c 	bl	2bb0 <b7b44>
    293c:	e59f202c 	ldr	r2, [pc, #44]	; 2970 <.x78fc>
    2940:	e59f1024 	ldr	r1, [pc, #36]	; 296c <.x78f8>
    2944:	e59f301c 	ldr	r3, [pc, #28]	; 2968 <.x78f4>
    2948:	e5820000 	str	r0, [r2]
    294c:	e5813000 	str	r3, [r1]
    2950:	e59d0260 	ldr	r0, [sp, #608]
    2954:	eb0002f9 	bl	3540 <bcf40>
    2958:	e3a00001 	mov	r0, #1	; 0x1
    295c:	e28ddf99 	add	sp, sp, #612	; 0x264
    2960:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    2964:	e12fff1e 	bx	lr

00002968 <.x78f4>:
    2968:	800231a0 	.word	0x800231a0

0000296c <.x78f8>:
    296c:	8006916c 	.word	0x8006916c

00002970 <.x78fc>:
    2970:	8006c660 	.word	0x8006c660

00002974 <.x7900>:
    2974:	8006ce80 	.word	0x8006ce80

00002978 <.x7904>:
    2978:	8006c668 	.word	0x8006c668

0000297c <.x7908>:
    297c:	a0020110 	.word	0xa0020110

00002980 <.x790c>:
    2980:	55aa55aa 	.word	0x55aa55aa

00002984 <.x7910>:
    2984:	a0020170 	.word	0xa0020170

00002988 <.x7914>:
    2988:	80069140 	.word	0x80069140

0000298c <.x7918>:
    298c:	8006c65c 	.word	0x8006c65c

00002990 <b791c>:
    2990:	e92d4010 	push	{r4, lr}
    2994:	e1a04000 	mov	r4, r0
    2998:	ebfffb37 	bl	167c <b6398>
    299c:	ebfffb28 	bl	1644 <b6240>
    29a0:	ebfffffe 	bl	0 <b62a0>
    29a4:	e59fe07c 	ldr	lr, [pc, #124]	; 2a28 <.x79b4>
    29a8:	e59f2074 	ldr	r2, [pc, #116]	; 2a24 <.x79b0>
    29ac:	e3a0020a 	mov	r0, #-1610612736	; 0xa0000000
    29b0:	e59e3008 	ldr	r3, [lr, #8]
    29b4:	e3a01000 	mov	r1, #0	; 0x0
    29b8:	e3800802 	orr	r0, r0, #131072	; 0x20000
    29bc:	e3130a02 	tst	r3, #8192	; 0x2000
    29c0:	e5923000 	ldr	r3, [r2]
    29c4:	13833001 	orrne	r3, r3, #1	; 0x1
    29c8:	03c33001 	biceq	r3, r3, #1	; 0x1
    29cc:	e5823000 	str	r3, [r2]
    29d0:	e3c33002 	bic	r3, r3, #2	; 0x2
    29d4:	e5823000 	str	r3, [r2]

000029d8 <b7964>:
    29d8:	e081300e 	add	r3, r1, lr
    29dc:	e5d320d0 	ldrb	r2, [r3, #208]
    29e0:	e0813000 	add	r3, r1, r0
    29e4:	e2811001 	add	r1, r1, #1	; 0x1
    29e8:	e5c32150 	strb	r2, [r3, #336]
    29ec:	e3510009 	cmp	r1, #9	; 0x9
    29f0:	bafffff8 	blt	29d8 <b7964>
    29f4:	e3a01000 	mov	r1, #0	; 0x0

000029f8 <b7984>:
    29f8:	e081300e 	add	r3, r1, lr
    29fc:	e5d320d9 	ldrb	r2, [r3, #217]
    2a00:	e0813000 	add	r3, r1, r0
    2a04:	e2811001 	add	r1, r1, #1	; 0x1
    2a08:	e5c32159 	strb	r2, [r3, #345]
    2a0c:	e351000d 	cmp	r1, #13	; 0xd
    2a10:	bafffff8 	blt	29f8 <b7984>
    2a14:	e1a00004 	mov	r0, r4
    2a18:	ebfffad4 	bl	1570 <coprocessor_01>
    2a1c:	e8bd4010 	pop	{r4, lr}
    2a20:	e12fff1e 	bx	lr

00002a24 <.x79b0>:
    2a24:	a0020018 	.word	0xa0020018

00002a28 <.x79b4>:
    2a28:	8006c680 	.word	0x8006c680

00002a2c <b79c0>:
    2a2c:	e1d030b0 	ldrh	r3, [r0]
    2a30:	ea000000 	b	2a38 <b79cc>

00002a34 <b79c8>:
    2a34:	e1f030b2 	ldrh	r3, [r0, #2]!

00002a38 <b79cc>:
    2a38:	e3530000 	cmp	r3, #0	; 0x0
    2a3c:	1afffffc 	bne	2a34 <b79c8>
    2a40:	e12fff1e 	bx	lr

00002a44 <highdelay>:
    2a44:	e92d0006 	push	{r1, r2}

00002a48 <b79dc>:
    2a48:	e3a01021 	mov	r1, #33	; 0x21

00002a4c <b79e0>:
    2a4c:	e3a02064 	mov	r2, #100	; 0x64

00002a50 <b79e4>:
    2a50:	e2522001 	subs	r2, r2, #1	; 0x1
    2a54:	1afffffd 	bne	2a50 <b79e4>
    2a58:	e2511001 	subs	r1, r1, #1	; 0x1
    2a5c:	1afffffa 	bne	2a4c <b79e0>
    2a60:	e2500001 	subs	r0, r0, #1	; 0x1
    2a64:	1afffff7 	bne	2a48 <b79dc>
    2a68:	e8bd0006 	pop	{r1, r2}
    2a6c:	e1a0f00e 	mov	pc, lr

00002a70 <lowdelay>:
    2a70:	e92d0006 	push	{r1, r2}

00002a74 <b7a08>:
    2a74:	e3a02003 	mov	r2, #3	; 0x3

00002a78 <b7a0c>:
    2a78:	e2522001 	subs	r2, r2, #1	; 0x1
    2a7c:	1afffffd 	bne	2a78 <b7a0c>
    2a80:	e2500001 	subs	r0, r0, #1	; 0x1
    2a84:	1afffffa 	bne	2a74 <b7a08>
    2a88:	e8bd0006 	pop	{r1, r2}
    2a8c:	e12fff1e 	bx	lr

00002a90 <b7a24>:
    2a90:	e92d4030 	push	{r4, r5, lr}
    2a94:	e3a0120a 	mov	r1, #-1610612736	; 0xa0000000
    2a98:	e3811802 	orr	r1, r1, #131072	; 0x20000
    2a9c:	e5913000 	ldr	r3, [r1]
    2aa0:	e59f2104 	ldr	r2, [pc, #260]	; 2bac <.x7b40>
    2aa4:	e3a04000 	mov	r4, #0	; 0x0
    2aa8:	e1530002 	cmp	r3, r2
    2aac:	1a000036 	bne	2b8c <b7b20>
    2ab0:	e1d130b4 	ldrh	r3, [r1, #4]
    2ab4:	e3530001 	cmp	r3, #1	; 0x1
    2ab8:	1a000033 	bne	2b8c <b7b20>
    2abc:	e1d130b6 	ldrh	r3, [r1, #6]
    2ac0:	e3530001 	cmp	r3, #1	; 0x1
    2ac4:	1a000030 	bne	2b8c <b7b20>
    2ac8:	e3500001 	cmp	r0, #1	; 0x1
    2acc:	0a00000b 	beq	2b00 <b7a94>
    2ad0:	e3500002 	cmp	r0, #2	; 0x2
    2ad4:	0a000007 	beq	2af8 <b7a8c>
    2ad8:	e3500003 	cmp	r0, #3	; 0x3
    2adc:	0a000003 	beq	2af0 <b7a84>
    2ae0:	e3500005 	cmp	r0, #5	; 0x5
    2ae4:	1a000028 	bne	2b8c <b7b20>
    2ae8:	e59f40b8 	ldr	r4, [pc, #184]	; 2ba8 <.x7b3c>
    2aec:	ea000026 	b	2b8c <b7b20>

00002af0 <b7a84>:
    2af0:	e59f40ac 	ldr	r4, [pc, #172]	; 2ba4 <.x7b38>
    2af4:	ea000024 	b	2b8c <b7b20>

00002af8 <b7a8c>:
    2af8:	e59f40a0 	ldr	r4, [pc, #160]	; 2ba0 <.x7b34>
    2afc:	ea000022 	b	2b8c <b7b20>

00002b00 <b7a94>:
    2b00:	e59f4094 	ldr	r4, [pc, #148]	; 2b9c <.x7b30>
    2b04:	e5d43000 	ldrb	r3, [r4]
    2b08:	e3530000 	cmp	r3, #0	; 0x0
    2b0c:	1a00001e 	bne	2b8c <b7b20>
    2b10:	e59f1080 	ldr	r1, [pc, #128]	; 2b98 <.x7b2c>
    2b14:	e3a02008 	mov	r2, #8	; 0x8
    2b18:	e1a00004 	mov	r0, r4
    2b1c:	e3a05008 	mov	r5, #8	; 0x8
    2b20:	eb0002a9 	bl	35cc <bd1ac>
    2b24:	e3a01000 	mov	r1, #0	; 0x0
    2b28:	e3a00456 	mov	r0, #1442840576	; 0x56000000
    2b2c:	eb00001f 	bl	2bb0 <b7b44>
    2b30:	e59010b0 	ldr	r1, [r0, #176]
    2b34:	e3a0201c 	mov	r2, #28	; 0x1c

00002b38 <b7acc>:
    2b38:	e355000f 	cmp	r5, #15	; 0xf
    2b3c:	2a000008 	bcs	2b64 <b7af8>
    2b40:	e1a03231 	lsr	r3, r1, r2
    2b44:	e2422004 	sub	r2, r2, #4	; 0x4
    2b48:	e203300f 	and	r3, r3, #15	; 0xf
    2b4c:	e353000a 	cmp	r3, #10	; 0xa
    2b50:	32833030 	addcc	r3, r3, #48	; 0x30
    2b54:	22833037 	addcs	r3, r3, #55	; 0x37
    2b58:	e7c53004 	strb	r3, [r5, r4]
    2b5c:	e2855001 	add	r5, r5, #1	; 0x1
    2b60:	eafffff4 	b	2b38 <b7acc>

00002b64 <b7af8>:
    2b64:	e3550010 	cmp	r5, #16	; 0x10
    2b68:	2a000007 	bcs	2b8c <b7b20>
    2b6c:	e0853004 	add	r3, r5, r4
    2b70:	e2752010 	rsbs	r2, r5, #16	; 0x10
    2b74:	e3a01000 	mov	r1, #0	; 0x0
    2b78:	0a000003 	beq	2b8c <b7b20>
    2b7c:	e0832002 	add	r2, r3, r2

00002b80 <b7b14>:
    2b80:	e4c31001 	strb	r1, [r3], #1
    2b84:	e1530002 	cmp	r3, r2
    2b88:	1afffffc 	bne	2b80 <b7b14>

00002b8c <b7b20>:
    2b8c:	e1a00004 	mov	r0, r4
    2b90:	e8bd4030 	pop	{r4, r5, lr}
    2b94:	e12fff1e 	bx	lr

00002b98 <.x7b2c>:
    2b98:	800225f0 	.word	0x800225f0

00002b9c <.x7b30>:
    2b9c:	80069148 	.word	0x80069148

00002ba0 <.x7b34>:
    2ba0:	a0020018 	.word	0xa0020018

00002ba4 <.x7b38>:
    2ba4:	8006905c 	.word	0x8006905c

00002ba8 <.x7b3c>:
    2ba8:	a0020044 	.word	0xa0020044

00002bac <.x7b40>:
    2bac:	53475241 	.word	0x53475241

00002bb0 <b7b44>:
    2bb0:	e92d4010 	push	{r4, lr}
    2bb4:	e1a04000 	mov	r4, r0
    2bb8:	e59fe068 	ldr	lr, [pc, #104]	; 2c28 <.x7bbc>
    2bbc:	e3a00000 	mov	r0, #0	; 0x0
    2bc0:	e59e3008 	ldr	r3, [lr, #8]
    2bc4:	e3530000 	cmp	r3, #0	; 0x0
    2bc8:	0a000014 	beq	2c20 <b7bb4>

00002bcc <b7b60>:
    2bcc:	e59e2004 	ldr	r2, [lr, #4]
    2bd0:	e1540002 	cmp	r4, r2
    2bd4:	3a000004 	bcc	2bec <b7b80>
    2bd8:	e59e3008 	ldr	r3, [lr, #8]
    2bdc:	e0823a03 	add	r3, r2, r3, lsl #20
    2be0:	e2433001 	sub	r3, r3, #1	; 0x1
    2be4:	e1540003 	cmp	r4, r3
    2be8:	9a000003 	bls	2bfc <b7b90>

00002bec <b7b80>:
    2bec:	e28ee00c 	add	lr, lr, #12	; 0xc
    2bf0:	e59e3008 	ldr	r3, [lr, #8]
    2bf4:	e3530000 	cmp	r3, #0	; 0x0
    2bf8:	1afffff3 	bne	2bcc <b7b60>

00002bfc <b7b90>:
    2bfc:	e59e3008 	ldr	r3, [lr, #8]
    2c00:	e3530000 	cmp	r3, #0	; 0x0
    2c04:	0a000005 	beq	2c20 <b7bb4>
    2c08:	e59e2000 	ldr	r2, [lr]
    2c0c:	e59e3004 	ldr	r3, [lr, #4]
    2c10:	e3510000 	cmp	r1, #0	; 0x0
    2c14:	e0423003 	sub	r3, r2, r3
    2c18:	e0830004 	add	r0, r3, r4
    2c1c:	03800202 	orreq	r0, r0, #536870912	; 0x20000000

00002c20 <b7bb4>:
    2c20:	e8bd4010 	pop	{r4, lr}
    2c24:	e12fff1e 	bx	lr

00002c28 <.x7bbc>:
    2c28:	80022004 	.word	0x80022004

00002c2c <.x7e80>:
    2c2c:	80024c9c 	.word	0x80024c9c

00002c30 <.x7e84>:
    2c30:	80069160 	.word	0x80069160

00002c34 <b7e88>:
    2c34:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    2c38:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    2c3c:	e12fff1e 	bx	lr

00002c40 <.x7fe8>:
    2c40:	43454345 	.word	0x43454345

00002c44 <.x7fec>:
    2c44:	8006cea0 	.word	0x8006cea0

00002c48 <.x7ff0>:
    2c48:	80069160 	.word	0x80069160

00002c4c <.x7ff4>:
    2c4c:	58505253 	.word	0x58505253

00002c50 <.x7ff8>:
    2c50:	8006c65c 	.word	0x8006c65c

00002c54 <sysinit_mmu>:
    2c54:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    2c58:	e24ddfe7 	sub	sp, sp, #924	; 0x39c
    2c5c:	e59f32c4 	ldr	r3, [pc, #708]	; 2f28 <.x83c4>
    2c60:	e3a02000 	mov	r2, #0	; 0x0
    2c64:	e58d2004 	str	r2, [sp, #4]
    2c68:	e5935000 	ldr	r5, [r3]
    2c6c:	e3750001 	cmn	r5, #1	; 0x1
    2c70:	03a03000 	moveq	r3, #0	; 0x0
    2c74:	0a00001b 	beq	2ce8 <b8090>
    2c78:	e5953020 	ldr	r3, [r5, #32]
    2c7c:	e3a06000 	mov	r6, #0	; 0x0
    2c80:	e3530000 	cmp	r3, #0	; 0x0
    2c84:	9a000016 	bls	2ce4 <b808c>
    2c88:	e3a07000 	mov	r7, #0	; 0x0

00002c8c <b8034>:
    2c8c:	e5953024 	ldr	r3, [r5, #36]
    2c90:	e0874003 	add	r4, r7, r3
    2c94:	e5943008 	ldr	r3, [r4, #8]
    2c98:	e3530000 	cmp	r3, #0	; 0x0
    2c9c:	15941000 	ldrne	r1, [r4]
    2ca0:	15940004 	ldrne	r0, [r4, #4]
    2ca4:	11a02003 	movne	r2, r3
    2ca8:	1b000247 	blne	35cc <bd1ac>
    2cac:	e594200c 	ldr	r2, [r4, #12]
    2cb0:	e5943008 	ldr	r3, [r4, #8]
    2cb4:	e1530002 	cmp	r3, r2
    2cb8:	11a00003 	movne	r0, r3
    2cbc:	15943004 	ldrne	r3, [r4, #4]
    2cc0:	10422000 	subne	r2, r2, r0
    2cc4:	13a01000 	movne	r1, #0	; 0x0
    2cc8:	10800003 	addne	r0, r0, r3
    2ccc:	1b00021c 	blne	3544 <bcf44>
    2cd0:	e5953020 	ldr	r3, [r5, #32]
    2cd4:	e2866001 	add	r6, r6, #1	; 0x1
    2cd8:	e2877010 	add	r7, r7, #16	; 0x10
    2cdc:	e1560003 	cmp	r6, r3
    2ce0:	3affffe9 	bcc	2c8c <b8034>

00002ce4 <b808c>:
    2ce4:	e3a03001 	mov	r3, #1	; 0x1

00002ce8 <b8090>:
    2ce8:	e3530000 	cmp	r3, #0	; 0x0

00002cec <x8094>:
    2cec:	1a000000 	bne	2cf4 <b809c>

00002cf0 <stophere7>:
    2cf0:	eafffffe 	b	2cf0 <stophere7>

00002cf4 <b809c>:
    2cf4:	ebfffdf9 	bl	24e0 <goforce_preinit>
    2cf8:	e3500000 	cmp	r0, #0	; 0x0
    2cfc:	1a000000 	bne	2d04 <b80ac>

00002d00 <stophere4>:
    2d00:	eafffffe 	b	2d00 <stophere4>

00002d04 <b80ac>:
    2d04:	e3a02d0e 	mov	r2, #896	; 0x380
    2d08:	e3a01000 	mov	r1, #0	; 0x0
    2d0c:	e28d001c 	add	r0, sp, #28	; 0x1c
    2d10:	eb00020b 	bl	3544 <bcf44>
    2d14:	e59f7208 	ldr	r7, [pc, #520]	; 2f24 <.x83c0>
    2d18:	e59f8200 	ldr	r8, [pc, #512]	; 2f20 <.x83bc>
    2d1c:	e59f31f8 	ldr	r3, [pc, #504]	; 2f1c <.x83b8>
    2d20:	e59f21f0 	ldr	r2, [pc, #496]	; 2f18 <.x83b4>
    2d24:	e597e000 	ldr	lr, [r7]
    2d28:	e5984000 	ldr	r4, [r8]
    2d2c:	e5931000 	ldr	r1, [r3]
    2d30:	e5920000 	ldr	r0, [r2]
    2d34:	e3a05001 	mov	r5, #1	; 0x1
    2d38:	e3a06001 	mov	r6, #1	; 0x1
    2d3c:	e3a09000 	mov	r9, #0	; 0x0
    2d40:	e28d301c 	add	r3, sp, #28	; 0x1c
    2d44:	e3a02000 	mov	r2, #0	; 0x0
    2d48:	e58de32c 	str	lr, [sp, #812]
    2d4c:	e58d4348 	str	r4, [sp, #840]
    2d50:	e58d5328 	str	r5, [sp, #808]
    2d54:	e58d6344 	str	r6, [sp, #836]
    2d58:	e58d9000 	str	r9, [sp]
    2d5c:	ebfffffe 	bl	0 <b8e50>
    2d60:	e3500000 	cmp	r0, #0	; 0x0
    2d64:	1a000009 	bne	2d90 <b8138>
    2d68:	e59f21a4 	ldr	r2, [pc, #420]	; 2f14 <.x83b0>
    2d6c:	e5923014 	ldr	r3, [r2, #20]
    2d70:	e3530000 	cmp	r3, #0	; 0x0
    2d74:	159f3194 	ldrne	r3, [pc, #404]	; 2f10 <.x83ac>
    2d78:	15922014 	ldrne	r2, [r2, #20]
    2d7c:	13a00001 	movne	r0, #1	; 0x1
    2d80:	15931004 	ldrne	r1, [r3, #4]
    2d84:	11a0e00f 	movne	lr, pc
    2d88:	112fff12 	bxne	r2

00002d8c <stophere5>:
    2d8c:	eafffffe 	b	2d8c <stophere5>

00002d90 <b8138>:
    2d90:	ebfffa3e 	bl	1690 <b6414>
    2d94:	e3500001 	cmp	r0, #1	; 0x1
    2d98:	03a05020 	moveq	r5, #32	; 0x20
    2d9c:	13a05022 	movne	r5, #34	; 0x22
    2da0:	e3a04001 	mov	r4, #1	; 0x1
    2da4:	e1a02005 	mov	r2, r5
    2da8:	e3a03000 	mov	r3, #0	; 0x0
    2dac:	e3e01000 	mvn	r1, #0	; 0x0
    2db0:	e3e00000 	mvn	r0, #0	; 0x0
    2db4:	e58d4000 	str	r4, [sp]
    2db8:	eb0000f1 	bl	3184 <fat_01>
    2dbc:	e1a06000 	mov	r6, r0
    2dc0:	e3760001 	cmn	r6, #1	; 0x1
    2dc4:	1a00001f 	bne	2e48 <b81f0>
    2dc8:	e3550022 	cmp	r5, #34	; 0x22
    2dcc:	1a000013 	bne	2e20 <b81c8>
    2dd0:	e3a03000 	mov	r3, #0	; 0x0
    2dd4:	e3a02023 	mov	r2, #35	; 0x23
    2dd8:	e3e01000 	mvn	r1, #0	; 0x0
    2ddc:	e3e00000 	mvn	r0, #0	; 0x0
    2de0:	e3a05023 	mov	r5, #35	; 0x23
    2de4:	e58d4000 	str	r4, [sp]
    2de8:	eb0000e5 	bl	3184 <fat_01>
    2dec:	e1a06000 	mov	r6, r0
    2df0:	e3760001 	cmn	r6, #1	; 0x1
    2df4:	1a000013 	bne	2e48 <b81f0>
    2df8:	e3a03000 	mov	r3, #0	; 0x0
    2dfc:	e3a02020 	mov	r2, #32	; 0x20
    2e00:	e3e01000 	mvn	r1, #0	; 0x0
    2e04:	e3e00000 	mvn	r0, #0	; 0x0
    2e08:	e3a05020 	mov	r5, #32	; 0x20
    2e0c:	e58d4000 	str	r4, [sp]
    2e10:	eb0000db 	bl	3184 <fat_01>
    2e14:	e1a06000 	mov	r6, r0
    2e18:	e3760001 	cmn	r6, #1	; 0x1
    2e1c:	1a000009 	bne	2e48 <b81f0>

00002e20 <b81c8>:
    2e20:	e59f20ec 	ldr	r2, [pc, #236]	; 2f14 <.x83b0>
    2e24:	e5923014 	ldr	r3, [r2, #20]
    2e28:	e3530000 	cmp	r3, #0	; 0x0
    2e2c:	159f30dc 	ldrne	r3, [pc, #220]	; 2f10 <.x83ac>
    2e30:	15922014 	ldrne	r2, [r2, #20]
    2e34:	13a00002 	movne	r0, #2	; 0x2
    2e38:	15931008 	ldrne	r1, [r3, #8]
    2e3c:	11a0e00f 	movne	lr, pc
    2e40:	112fff12 	bxne	r2

00002e44 <stophere8>:
    2e44:	eafffffe 	b	2e44 <stophere8>

00002e48 <b81f0>:
    2e48:	e28d000c 	add	r0, sp, #12	; 0xc
    2e4c:	eb000164 	bl	33e4 <ba044>
    2e50:	e3500000 	cmp	r0, #0	; 0x0
    2e54:	1a000009 	bne	2e80 <b8228>
    2e58:	e59f20b4 	ldr	r2, [pc, #180]	; 2f14 <.x83b0>
    2e5c:	e5923014 	ldr	r3, [r2, #20]
    2e60:	e3530000 	cmp	r3, #0	; 0x0
    2e64:	159f30a4 	ldrne	r3, [pc, #164]	; 2f10 <.x83ac>
    2e68:	15922014 	ldrne	r2, [r2, #20]
    2e6c:	13a00003 	movne	r0, #3	; 0x3
    2e70:	1593100c 	ldrne	r1, [r3, #12]
    2e74:	11a0e00f 	movne	lr, pc
    2e78:	112fff12 	bxne	r2

00002e7c <stophere9>:
    2e7c:	eafffffe 	b	2e7c <stophere9>

00002e80 <b8228>:
    2e80:	e59f408c 	ldr	r4, [pc, #140]	; 2f14 <.x83b0>
    2e84:	e1dd31ba 	ldrh	r3, [sp, #26]
    2e88:	e3550022 	cmp	r5, #34	; 0x22
    2e8c:	e1c430b0 	strh	r3, [r4]
    2e90:	0a000008 	beq	2eb8 <b8260>
    2e94:	e3550023 	cmp	r5, #35	; 0x23
    2e98:	0a000006 	beq	2eb8 <b8260>
    2e9c:	e3550020 	cmp	r5, #32	; 0x20
    2ea0:	1afffffe 	bne	0 <b8270>
    2ea4:	e3a00000 	mov	r0, #0	; 0x0
    2ea8:	eb000141 	bl	33b4 <ba014>
    2eac:	e3a00001 	mov	r0, #1	; 0x1
    2eb0:	eb00013f 	bl	33b4 <ba014>
    2eb4:	eafffffe 	b	0 <b8270>

00002eb8 <b8260>:
    2eb8:	e3a00000 	mov	r0, #0	; 0x0
    2ebc:	ebfffffe 	bl	0 <b9ff8>
    2ec0:	e3a00001 	mov	r0, #1	; 0x1
    2ec4:	ebfffffe 	bl	0 <b9ff8>
    2ec8:	e28d1004 	add	r1, sp, #4	; 0x4
    2ecc:	e1a00006 	mov	r0, r6
    2ed0:	ebffff57 	bl	2c34 <b7e88>
    2ed4:	e3500000 	cmp	r0, #0	; 0x0
    2ed8:	1a000008 	bne	2f00 <b82a8>
    2edc:	e5943014 	ldr	r3, [r4, #20]
    2ee0:	e3530000 	cmp	r3, #0	; 0x0
    2ee4:	159f3024 	ldrne	r3, [pc, #36]	; 2f10 <.x83ac>
    2ee8:	15942014 	ldrne	r2, [r4, #20]
    2eec:	13a00004 	movne	r0, #4	; 0x4
    2ef0:	15931010 	ldrne	r1, [r3, #16]
    2ef4:	11a0e00f 	movne	lr, pc
    2ef8:	112fff12 	bxne	r2

00002efc <stophere10>:
    2efc:	eafffffe 	b	2efc <stophere10>

00002f00 <b82a8>:
    2f00:	e59d1004 	ldr	r1, [sp, #4]
    2f04:	e28d2004 	add	r2, sp, #4	; 0x4
    2f08:	e1a00005 	mov	r0, r5
    2f0c:	ebfffa14 	bl	1764 <b64e8>

00002f10 <.x83ac>:
    2f10:	80069098 	.word	0x80069098

00002f14 <.x83b0>:
    2f14:	80069158 	.word	0x80069158

00002f18 <.x83b4>:
    2f18:	8006c668 	.word	0x8006c668

00002f1c <.x83b8>:
    2f1c:	8006ce80 	.word	0x8006ce80

00002f20 <.x83bc>:
    2f20:	8006c664 	.word	0x8006c664

00002f24 <.x83c0>:
    2f24:	8006c660 	.word	0x8006c660

00002f28 <.x83c4>:
    2f28:	800230ac 	.word	0x800230ac

00002f2c <b83c8>:
    2f2c:	e92d4000 	push	{lr}
    2f30:	e59f201c 	ldr	r2, [pc, #28]	; 2f54 <.x83f4>
    2f34:	e5923000 	ldr	r3, [r2]
    2f38:	e3530000 	cmp	r3, #0	; 0x0
    2f3c:	14c30001 	strbne	r0, [r3], #1
    2f40:	15823000 	strne	r3, [r2]
    2f44:	18bd4000 	popne	{lr}
    2f48:	112fff1e 	bxne	lr
    2f4c:	e8bd4000 	pop	{lr}
    2f50:	e12fff1e 	bx	lr

00002f54 <.x83f4>:
    2f54:	8006ce84 	.word	0x8006ce84

00002f58 <b83f8>:
    2f58:	e92d4010 	push	{r4, lr}
    2f5c:	e3510000 	cmp	r1, #0	; 0x0
    2f60:	e1a04000 	mov	r4, r0
    2f64:	12411001 	subne	r1, r1, #1	; 0x1
    2f68:	e3d4c00f 	bics	ip, r4, #15	; 0xf
    2f6c:	1a000001 	bne	2f78 <b8418>
    2f70:	e3510000 	cmp	r1, #0	; 0x0
    2f74:	0a000002 	beq	2f84 <b8424>

00002f78 <b8418>:
    2f78:	e1a00224 	lsr	r0, r4, #4
    2f7c:	ebfffff5 	bl	2f58 <b83f8>
    2f80:	e204400f 	and	r4, r4, #15	; 0xf

00002f84 <b8424>:
    2f84:	e354000a 	cmp	r4, #10	; 0xa
    2f88:	32843030 	addcc	r3, r4, #48	; 0x30
    2f8c:	22843037 	addcs	r3, r4, #55	; 0x37
    2f90:	e20300ff 	and	r0, r3, #255	; 0xff
    2f94:	ebffffe4 	bl	2f2c <b83c8>
    2f98:	e8bd4010 	pop	{r4, lr}
    2f9c:	e12fff1e 	bx	lr

00002fa0 <b8440>:
    2fa0:	e92d4010 	push	{r4, lr}
    2fa4:	e1a04000 	mov	r4, r0
    2fa8:	e354000a 	cmp	r4, #10	; 0xa
    2fac:	259f3024 	ldrcs	r3, [pc, #36]	; 2fd8 <.x8478>
    2fb0:	20832394 	umullcs	r2, r3, r4, r3
    2fb4:	21a001a3 	lsrcs	r0, r3, #3
    2fb8:	20803100 	addcs	r3, r0, r0, lsl #2
    2fbc:	20444083 	subcs	r4, r4, r3, lsl #1
    2fc0:	2bfffff6 	blcs	2fa0 <b8440>
    2fc4:	e2843030 	add	r3, r4, #48	; 0x30
    2fc8:	e20300ff 	and	r0, r3, #255	; 0xff
    2fcc:	ebffffd6 	bl	2f2c <b83c8>
    2fd0:	e8bd4010 	pop	{r4, lr}
    2fd4:	e12fff1e 	bx	lr

00002fd8 <.x8478>:
    2fd8:	cccccccd 	.word	0xcccccccd

00002fdc <b847c>:
    2fdc:	e1a0c00d 	mov	ip, sp
    2fe0:	e92d000f 	push	{r0, r1, r2, r3}
    2fe4:	e92d5070 	push	{r4, r5, r6, ip, lr}
    2fe8:	e1a06000 	mov	r6, r0
    2fec:	e28d4018 	add	r4, sp, #24	; 0x18
    2ff0:	ea00004d 	b	312c <b85d4>

00002ff4 <cr_lf>:
    2ff4:	e2866001 	add	r6, r6, #1	; 0x1
    2ff8:	e355000a 	cmp	r5, #10	; 0xa
    2ffc:	0a000046 	beq	311c <b85c4>
    3000:	e355000d 	cmp	r5, #13	; 0xd
    3004:	0a000040 	beq	310c <b85b4>
    3008:	e3550025 	cmp	r5, #37	; 0x25
    300c:	1a000044 	bne	3124 <b85cc>
    3010:	e4d63001 	ldrb	r3, [r6], #1
    3014:	e58d6014 	str	r6, [sp, #20]
    3018:	e3530063 	cmp	r3, #99	; 0x63
    301c:	ca000013 	bgt	3070 <b8510>
    3020:	0a00000f 	beq	3064 <b8504>
    3024:	e3530025 	cmp	r3, #37	; 0x25
    3028:	0a00000b 	beq	305c <b84fc>
    302c:	e3530042 	cmp	r3, #66	; 0x42
    3030:	0a000007 	beq	3054 <b84f4>
    3034:	e3530048 	cmp	r3, #72	; 0x48
    3038:	0a000003 	beq	304c <b84ec>
    303c:	e3530058 	cmp	r3, #88	; 0x58
    3040:	1a000012 	bne	3090 <b8530>
    3044:	e3a01008 	mov	r1, #8	; 0x8
    3048:	ea000013 	b	309c <b853c>

0000304c <b84ec>:
    304c:	e3a01004 	mov	r1, #4	; 0x4
    3050:	ea000011 	b	309c <b853c>

00003054 <b84f4>:
    3054:	e3a01002 	mov	r1, #2	; 0x2
    3058:	ea00000f 	b	309c <b853c>

0000305c <b84fc>:
    305c:	e3a00025 	mov	r0, #37	; 0x25
    3060:	ea000030 	b	3128 <b85d0>

00003064 <b8504>:
    3064:	e2844004 	add	r4, r4, #4	; 0x4
    3068:	e5540004 	ldrb	r0, [r4, #-4]
    306c:	ea00002d 	b	3128 <b85d0>

00003070 <b8510>:
    3070:	e3530064 	cmp	r3, #100	; 0x64
    3074:	0a00001a 	beq	30e4 <b858c>
    3078:	e3530073 	cmp	r3, #115	; 0x73
    307c:	0a00000e 	beq	30bc <b855c>
    3080:	e3530075 	cmp	r3, #117	; 0x75
    3084:	0a000008 	beq	30ac <b854c>
    3088:	e3530078 	cmp	r3, #120	; 0x78
    308c:	0a000001 	beq	3098 <b8538>

00003090 <b8530>:
    3090:	e3a00020 	mov	r0, #32	; 0x20
    3094:	ea000023 	b	3128 <b85d0>

00003098 <b8538>:
    3098:	e3a01000 	mov	r1, #0	; 0x0

0000309c <b853c>:
    309c:	e2844004 	add	r4, r4, #4	; 0x4
    30a0:	e5140004 	ldr	r0, [r4, #-4]
    30a4:	ebffffab 	bl	2f58 <b83f8>
    30a8:	ea00001f 	b	312c <b85d4>

000030ac <b854c>:
    30ac:	e2844004 	add	r4, r4, #4	; 0x4
    30b0:	e5140004 	ldr	r0, [r4, #-4]
    30b4:	ebffffb9 	bl	2fa0 <b8440>
    30b8:	ea00001b 	b	312c <b85d4>

000030bc <b855c>:
    30bc:	e2844004 	add	r4, r4, #4	; 0x4
    30c0:	e5145004 	ldr	r5, [r4, #-4]
    30c4:	ea000002 	b	30d4 <b857c>

000030c8 <b8568>:
    30c8:	e353000a 	cmp	r3, #10	; 0xa
    30cc:	03a0000d 	moveq	r0, #13	; 0xd
    30d0:	e4d50001 	ldrb	r0, [r5], #1

000030d4 <b857c>:
    30d4:	e5d53000 	ldrb	r3, [r5]
    30d8:	e3530000 	cmp	r3, #0	; 0x0
    30dc:	1afffff9 	bne	30c8 <b8568>
    30e0:	ea000011 	b	312c <b85d4>

000030e4 <b858c>:
    30e4:	e2844004 	add	r4, r4, #4	; 0x4
    30e8:	e5143004 	ldr	r3, [r4, #-4]
    30ec:	e1b05003 	movs	r5, r3
    30f0:	5a000002 	bpl	3100 <b85a8>
    30f4:	e3a0002d 	mov	r0, #45	; 0x2d
    30f8:	ebffff8b 	bl	2f2c <b83c8>
    30fc:	e2655000 	rsb	r5, r5, #0	; 0x0

00003100 <b85a8>:
    3100:	e1a00005 	mov	r0, r5
    3104:	ebffffa5 	bl	2fa0 <b8440>
    3108:	ea000007 	b	312c <b85d4>

0000310c <b85b4>:
    310c:	e5d63000 	ldrb	r3, [r6]
    3110:	e3a0500a 	mov	r5, #10	; 0xa
    3114:	e353000a 	cmp	r3, #10	; 0xa
    3118:	02866001 	addeq	r6, r6, #1	; 0x1

0000311c <b85c4>:
    311c:	e3a0000d 	mov	r0, #13	; 0xd
    3120:	ebffff81 	bl	2f2c <b83c8>

00003124 <b85cc>:
    3124:	e1a00005 	mov	r0, r5

00003128 <b85d0>:
    3128:	ebffff7f 	bl	2f2c <b83c8>

0000312c <b85d4>:
    312c:	e5d65000 	ldrb	r5, [r6]
    3130:	e3550000 	cmp	r5, #0	; 0x0
    3134:	1affffae 	bne	2ff4 <cr_lf>
    3138:	e89d6070 	ldm	sp, {r4, r5, r6, sp, lr}
    313c:	e12fff1e 	bx	lr

00003140 <b8de8>:
    3140:	e92d4030 	push	{r4, r5, lr}
    3144:	e8bd4070 	pop	{r4, r5, r6, lr}
    3148:	e12fff1e 	bx	lr

0000314c <.x8f14>:
    314c:	80069784 	.word	0x80069784

00003150 <b8f18>:
    3150:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    3154:	e12fff1e 	bx	lr

00003158 <.x9138>:
    3158:	80069784 	.word	0x80069784

0000315c <b913c>:
    315c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    3160:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    3164:	e12fff1e 	bx	lr

00003168 <.x92ec>:
    3168:	51eb851f 	.word	0x51eb851f

0000316c <.x92f0>:
    316c:	80069794 	.word	0x80069794

00003170 <b92f4>:
    3170:	e92d4030 	push	{r4, r5, lr}
    3174:	e8bd4030 	pop	{r4, r5, lr}
    3178:	e12fff1e 	bx	lr

0000317c <.x93e0>:
    317c:	800690c0 	.word	0x800690c0

00003180 <.x93e4>:
    3180:	80069794 	.word	0x80069794

00003184 <fat_01>:
    3184:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3188:	e24dd008 	sub	sp, sp, #8	; 0x8
    318c:	e1a0a003 	mov	sl, r3
    3190:	e1a03000 	mov	r3, r0
    3194:	e58d3004 	str	r3, [sp, #4]
    3198:	e1a09002 	mov	r9, r2
    319c:	e1a0b001 	mov	fp, r1
    31a0:	e59f51e8 	ldr	r5, [pc, #488]	; 3390 <.x95f4>
    31a4:	e59f71e0 	ldr	r7, [pc, #480]	; 338c <.x95f0>
    31a8:	e59d802c 	ldr	r8, [sp, #44]
    31ac:	e5951004 	ldr	r1, [r5, #4]
    31b0:	e3a06000 	mov	r6, #0	; 0x0
    31b4:	e3510000 	cmp	r1, #0	; 0x0
    31b8:	0a000021 	beq	3244 <b94a8>

000031bc <b9420>:
    31bc:	e1a00006 	mov	r0, r6
    31c0:	eb0000bb 	bl	34b4 <bbd74>
    31c4:	e310000a 	tst	r0, #10	; 0xa
    31c8:	1a000019 	bne	3234 <b9498>
    31cc:	e1d540bc 	ldrh	r4, [r5, #12]
    31d0:	e5951034 	ldr	r1, [r5, #52]
    31d4:	e3a03001 	mov	r3, #1	; 0x1
    31d8:	e00e0694 	mul	lr, r4, r6
    31dc:	e3a02000 	mov	r2, #0	; 0x0
    31e0:	e1a0000e 	mov	r0, lr
    31e4:	e587e000 	str	lr, [r7]
    31e8:	eb00009e 	bl	3468 <bbd28>
    31ec:	e3500000 	cmp	r0, #0	; 0x0
    31f0:	0a000025 	beq	328c <b94f0>
    31f4:	e5952034 	ldr	r2, [r5, #52]
    31f8:	e5d23000 	ldrb	r3, [r2]
    31fc:	e35300e9 	cmp	r3, #233	; 0xe9
    3200:	1a00000b 	bne	3234 <b9498>
    3204:	e5d23001 	ldrb	r3, [r2, #1]
    3208:	e35300fd 	cmp	r3, #253	; 0xfd
    320c:	1a000008 	bne	3234 <b9498>
    3210:	e5d23002 	ldrb	r3, [r2, #2]
    3214:	e35300ff 	cmp	r3, #255	; 0xff
    3218:	1a000005 	bne	3234 <b9498>
    321c:	e5d231fe 	ldrb	r3, [r2, #510]
    3220:	e3530055 	cmp	r3, #85	; 0x55
    3224:	1a000002 	bne	3234 <b9498>
    3228:	e5d231ff 	ldrb	r3, [r2, #511]
    322c:	e35300aa 	cmp	r3, #170	; 0xaa
    3230:	0a000020 	beq	32b8 <b951c>

00003234 <b9498>:
    3234:	e5951004 	ldr	r1, [r5, #4]
    3238:	e2866001 	add	r6, r6, #1	; 0x1
    323c:	e1560001 	cmp	r6, r1
    3240:	3affffdd 	bcc	31bc <b9420>

00003244 <b94a8>:
    3244:	e3a04000 	mov	r4, #0	; 0x0
    3248:	e3510000 	cmp	r1, #0	; 0x0
    324c:	0a000007 	beq	3270 <b94d4>

00003250 <b94b4>:
    3250:	e1a00004 	mov	r0, r4
    3254:	eb000096 	bl	34b4 <bbd74>
    3258:	e5951004 	ldr	r1, [r5, #4]
    325c:	e310000a 	tst	r0, #10	; 0xa
    3260:	0a000005 	beq	327c <b94e0>
    3264:	e2844001 	add	r4, r4, #1	; 0x1
    3268:	e1540001 	cmp	r4, r1
    326c:	3afffff7 	bcc	3250 <b94b4>

00003270 <b94d4>:
    3270:	e3e02000 	mvn	r2, #0	; 0x0
    3274:	e5872000 	str	r2, [r7]
    3278:	ea000004 	b	3290 <b94f4>

0000327c <b94e0>:
    327c:	e1d530bc 	ldrh	r3, [r5, #12]
    3280:	e0020493 	mul	r2, r3, r4
    3284:	e5872000 	str	r2, [r7]
    3288:	ea000000 	b	3290 <b94f4>

0000328c <b94f0>:
    328c:	e5951004 	ldr	r1, [r5, #4]

00003290 <b94f4>:
    3290:	e3a02000 	mov	r2, #0	; 0x0
    3294:	e3580001 	cmp	r8, #1	; 0x1
    3298:	0a000037 	beq	337c <b95e0>
    329c:	e5953000 	ldr	r3, [r5]
    32a0:	e3a00000 	mov	r0, #0	; 0x0
    32a4:	e3530001 	cmp	r3, #1	; 0x1
    32a8:	03a02001 	moveq	r2, #1	; 0x1
    32ac:	ebffffaf 	bl	3170 <b92f4>
    32b0:	e3a0e000 	mov	lr, #0	; 0x0
    32b4:	ea000016 	b	3314 <b9578>

000032b8 <b951c>:
    32b8:	e2823c01 	add	r3, r2, #256	; 0x100
    32bc:	e28310be 	add	r1, r3, #190	; 0xbe
    32c0:	e3a0e000 	mov	lr, #0	; 0x0

000032c4 <b9528>:
    32c4:	e5d10004 	ldrb	r0, [r1, #4]
    32c8:	e1500009 	cmp	r0, r9
    32cc:	1a000005 	bne	32e8 <b954c>
    32d0:	e5d13000 	ldrb	r3, [r1]
    32d4:	e3130001 	tst	r3, #1	; 0x1
    32d8:	13a03001 	movne	r3, #1	; 0x1
    32dc:	03a03000 	moveq	r3, #0	; 0x0
    32e0:	e153000a 	cmp	r3, sl
    32e4:	0a000013 	beq	3338 <b959c>

000032e8 <b954c>:
    32e8:	e35000ff 	cmp	r0, #255	; 0xff
    32ec:	0a000006 	beq	330c <b9570>
    32f0:	e3500000 	cmp	r0, #0	; 0x0
    32f4:	0a000004 	beq	330c <b9570>
    32f8:	e28ee001 	add	lr, lr, #1	; 0x1
    32fc:	e35e0004 	cmp	lr, #4	; 0x4
    3300:	e2811010 	add	r1, r1, #16	; 0x10
    3304:	3affffee 	bcc	32c4 <b9528>
    3308:	e59de004 	ldr	lr, [sp, #4]

0000330c <b9570>:
    330c:	e35e0004 	cmp	lr, #4	; 0x4
    3310:	0a000019 	beq	337c <b95e0>

00003314 <b9578>:
    3314:	e3580001 	cmp	r8, #1	; 0x1
    3318:	0a000017 	beq	337c <b95e0>
    331c:	e59d0004 	ldr	r0, [sp, #4]
    3320:	e1a0300a 	mov	r3, sl
    3324:	e1a02009 	mov	r2, r9
    3328:	e1a0100b 	mov	r1, fp
    332c:	e58de000 	str	lr, [sp]
    3330:	ebffff89 	bl	315c <b913c>
    3334:	ea000011 	b	3380 <b95e4>

00003338 <b959c>:
    3338:	e59d302c 	ldr	r3, [sp, #44]
    333c:	e3530000 	cmp	r3, #0	; 0x0
    3340:	0a00000d 	beq	337c <b95e0>
    3344:	e1a0018e 	lsl	r0, lr, #3
    3348:	e2853010 	add	r3, r5, #16	; 0x10
    334c:	e7b03003 	ldr	r3, [r0, r3]!
    3350:	e3530000 	cmp	r3, #0	; 0x0
    3354:	1a000009 	bne	3380 <b95e4>
    3358:	e082320e 	add	r3, r2, lr, lsl #4
    335c:	e2833c01 	add	r3, r3, #256	; 0x100
    3360:	e2852010 	add	r2, r5, #16	; 0x10
    3364:	e28330be 	add	r3, r3, #190	; 0xbe
    3368:	e082218e 	add	r2, r2, lr, lsl #3
    336c:	e3a01000 	mov	r1, #0	; 0x0
    3370:	e5803000 	str	r3, [r0]
    3374:	e5821004 	str	r1, [r2, #4]
    3378:	ea000000 	b	3380 <b95e4>

0000337c <b95e0>:
    337c:	e3e00000 	mvn	r0, #0	; 0x0

00003380 <b95e4>:
    3380:	e28dd008 	add	sp, sp, #8	; 0x8
    3384:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3388:	e12fff1e 	bx	lr

0000338c <.x95f0>:
    338c:	800690c0 	.word	0x800690c0

00003390 <.x95f4>:
    3390:	80069794 	.word	0x80069794

00003394 <b95f8>:
    3394:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}

00003398 <b983c>:
    3398:	e92d4030 	push	{r4, r5, lr}
    339c:	e8bd4030 	pop	{r4, r5, lr}
    33a0:	e12fff1e 	bx	lr

000033a4 <.x9ef4>:
    33a4:	8006a7d8 	.word	0x8006a7d8

000033a8 <b9ef8>:
    33a8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    33ac:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    33b0:	e12fff1e 	bx	lr

000033b4 <ba014>:
    33b4:	e92d4000 	push	{lr}
    33b8:	e1a01000 	mov	r1, r0
    33bc:	e3a00a72 	mov	r0, #466944	; 0x72000
    33c0:	e2400078 	sub	r0, r0, #120	; 0x78
    33c4:	ebfffff7 	bl	33a8 <b9ef8>
    33c8:	e8bd4000 	pop	{lr}
    33cc:	e12fff1e 	bx	lr

000033d0 <ba030>:
    33d0:	e92d4000 	push	{lr}
    33d4:	eb000056 	bl	3534 <bc330>
    33d8:	e3a00001 	mov	r0, #1	; 0x1
    33dc:	e8bd4000 	pop	{lr}
    33e0:	e12fff1e 	bx	lr

000033e4 <ba044>:
    33e4:	e92d4000 	push	{lr}

000033e8 <ba2e4>:
    33e8:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}

000033ec <.xa574>:
    33ec:	8006a9f4 	.word	0x8006a9f4

000033f0 <.xa578>:
    33f0:	8006c65c 	.word	0x8006c65c

000033f4 <ba57c>:
    33f4:	e92d4010 	push	{r4, lr}

000033f8 <bae5c>:
    33f8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}

000033fc <bb190>:
    33fc:	e92d4010 	push	{r4, lr}
    3400:	e24dd008 	sub	sp, sp, #8	; 0x8
    3404:	e3a03001 	mov	r3, #1	; 0x1
    3408:	e28d2000 	add	r2, sp, #0	; 0x0
    340c:	e3a01000 	mov	r1, #0	; 0x0
    3410:	e1a00400 	lsl	r0, r0, #8
    3414:	e3a04000 	mov	r4, #0	; 0x0
    3418:	ebfffff6 	bl	33f8 <bae5c>
    341c:	e3500000 	cmp	r0, #0	; 0x0
    3420:	03a04001 	moveq	r4, #1	; 0x1
    3424:	0a000007 	beq	3448 <bb1dc>
    3428:	e5dd3004 	ldrb	r3, [sp, #4]
    342c:	e3130002 	tst	r3, #2	; 0x2
    3430:	03a04004 	moveq	r4, #4	; 0x4
    3434:	e3130001 	tst	r3, #1	; 0x1
    3438:	e5dd3005 	ldrb	r3, [sp, #5]
    343c:	03844008 	orreq	r4, r4, #8	; 0x8
    3440:	e35300ff 	cmp	r3, #255	; 0xff
    3444:	13844002 	orrne	r4, r4, #2	; 0x2

00003448 <bb1dc>:
    3448:	e1a00004 	mov	r0, r4
    344c:	e28dd008 	add	sp, sp, #8	; 0x8
    3450:	e8bd4010 	pop	{r4, lr}
    3454:	e12fff1e 	bx	lr

00003458 <bbadc>:
    3458:	e92d40f0 	push	{r4, r5, r6, r7, lr}

0000345c <bbae0>:
    345c:	eb000031 	bl	3528 <bc324>

00003460 <.xbd20>:
    3460:	800690f4 	.word	0x800690f4

00003464 <.xbd24>:
    3464:	8006a9f0 	.word	0x8006a9f0

00003468 <bbd28>:
    3468:	e92d4000 	push	{lr}
    346c:	e59fe03c 	ldr	lr, [pc, #60]	; 34b0 <.xbd70>
    3470:	e59ee000 	ldr	lr, [lr]
    3474:	e35e0000 	cmp	lr, #0	; 0x0
    3478:	1a000004 	bne	3490 <bbd50>
    347c:	e3500701 	cmp	r0, #262144	; 0x40000
    3480:	2a000007 	bcs	34a4 <bbd64>
    3484:	ebffffdb 	bl	33f8 <bae5c>
    3488:	e8bd4000 	pop	{lr}
    348c:	e12fff1e 	bx	lr

00003490 <bbd50>:
    3490:	e3500802 	cmp	r0, #131072	; 0x20000
    3494:	2a000002 	bcs	34a4 <bbd64>
    3498:	ebffffd2 	bl	33e8 <ba2e4>
    349c:	e8bd4000 	pop	{lr}
    34a0:	e12fff1e 	bx	lr

000034a4 <bbd64>:
    34a4:	e3a00000 	mov	r0, #0	; 0x0
    34a8:	e8bd4000 	pop	{lr}
    34ac:	e12fff1e 	bx	lr

000034b0 <.xbd70>:
    34b0:	8006aa08 	.word	0x8006aa08

000034b4 <bbd74>:
    34b4:	e92d4070 	push	{r4, r5, r6, lr}
    34b8:	e1a05000 	mov	r5, r0
    34bc:	e59f3058 	ldr	r3, [pc, #88]	; 351c <.xbddc>
    34c0:	e3a04000 	mov	r4, #0	; 0x0
    34c4:	e5933000 	ldr	r3, [r3]
    34c8:	e3530000 	cmp	r3, #0	; 0x0
    34cc:	1a000004 	bne	34e4 <bbda4>
    34d0:	e3550b01 	cmp	r5, #1024	; 0x400
    34d4:	2a00000c 	bcs	350c <bbdcc>
    34d8:	ebffffc7 	bl	33fc <bb190>
    34dc:	e1a04000 	mov	r4, r0
    34e0:	ea00000a 	b	3510 <bbdd0>

000034e4 <bbda4>:
    34e4:	e3550c02 	cmp	r5, #512	; 0x200
    34e8:	2a000007 	bcs	350c <bbdcc>
    34ec:	e3a06000 	mov	r6, #0	; 0x0

000034f0 <bbdb0>:
    34f0:	e0860185 	add	r0, r6, r5, lsl #3
    34f4:	ebffffbe 	bl	33f4 <ba57c>
    34f8:	e2866001 	add	r6, r6, #1	; 0x1
    34fc:	e3560008 	cmp	r6, #8	; 0x8
    3500:	e1804004 	orr	r4, r0, r4
    3504:	bafffff9 	blt	34f0 <bbdb0>
    3508:	ea000000 	b	3510 <bbdd0>

0000350c <bbdcc>:
    350c:	e3a04000 	mov	r4, #0	; 0x0

00003510 <bbdd0>:
    3510:	e1a00004 	mov	r0, r4
    3514:	e8bd4070 	pop	{r4, r5, r6, lr}
    3518:	e12fff1e 	bx	lr

0000351c <.xbddc>:
    351c:	8006aa08 	.word	0x8006aa08

00003520 <bbde0>:
    3520:	e92d4070 	push	{r4, r5, r6, lr}

00003524 <bbea8>:
    3524:	e92d40f0 	push	{r4, r5, r6, r7, lr}

00003528 <bc324>:
    3528:	e3a004b1 	mov	r0, #-1325400064	; 0xb1000000
    352c:	e3800606 	orr	r0, r0, #6291456	; 0x600000
    3530:	e12fff1e 	bx	lr

00003534 <bc330>:
    3534:	e3a00001 	mov	r0, #1	; 0x1
    3538:	e12fff1e 	bx	lr

0000353c <xc620>:
    353c:	8006ba40 	.word	0x8006ba40

00003540 <bcf40>:
    3540:	e12fff1e 	bx	lr

00003544 <bcf44>:
    3544:	e2522004 	subs	r2, r2, #4	; 0x4
    3548:	e1a03000 	mov	r3, r0
    354c:	ba000010 	blt	3594 <bcf94>
    3550:	e20110ff 	and	r1, r1, #255	; 0xff
    3554:	e1811401 	orr	r1, r1, r1, lsl #8
    3558:	e213c003 	ands	ip, r3, #3	; 0x3
    355c:	1a000013 	bne	35b0 <bcfb0>

00003560 <bcf60>:
    3560:	e1811801 	orr	r1, r1, r1, lsl #16
    3564:	e252200c 	subs	r2, r2, #12	; 0xc
    3568:	e1a0c001 	mov	ip, r1
    356c:	ba000003 	blt	3580 <bcf80>

00003570 <bcf70>:
    3570:	e8a31002 	stmia	r3!, {r1, ip}
    3574:	e2522010 	subs	r2, r2, #16	; 0x10
    3578:	e8a31002 	stmia	r3!, {r1, ip}
    357c:	aafffffb 	bge	3570 <bcf70>

00003580 <bcf80>:
    3580:	e2922008 	adds	r2, r2, #8	; 0x8
    3584:	a8a31002 	stmiage	r3!, {r1, ip}
    3588:	a2422008 	subge	r2, r2, #8	; 0x8
    358c:	e2922004 	adds	r2, r2, #4	; 0x4
    3590:	a4831004 	strge	r1, [r3], #4

00003594 <bcf94>:
    3594:	b2922004 	addslt	r2, r2, #4	; 0x4
    3598:	0a000003 	beq	35ac <bcfac>
    359c:	e4c31001 	strb	r1, [r3], #1
    35a0:	e3520002 	cmp	r2, #2	; 0x2
    35a4:	a4c31001 	strbge	r1, [r3], #1
    35a8:	c4c31001 	strbgt	r1, [r3], #1

000035ac <bcfac>:
    35ac:	e12fff1e 	bx	lr

000035b0 <bcfb0>:
    35b0:	e3130001 	tst	r3, #1	; 0x1
    35b4:	12422001 	subne	r2, r2, #1	; 0x1
    35b8:	14c31001 	strbne	r1, [r3], #1
    35bc:	e3130002 	tst	r3, #2	; 0x2
    35c0:	12422002 	subne	r2, r2, #2	; 0x2
    35c4:	10c310b2 	strhne	r1, [r3], #2
    35c8:	eaffffe4 	b	3560 <bcf60>

000035cc <bd1ac>:
    35cc:	e92d4031 	push	{r0, r4, r5, lr}

000035d0 <.xe008>:
    35d0:	f000fe38 	.word	0xf000fe38

000035d4 <.xf9c8>:
    35d4:	652e6b6e 	.word	0x652e6b6e
    35d8:	00006578 	.word	0x00006578
    35dc:	e1a00000 	.word	0xe1a00000
