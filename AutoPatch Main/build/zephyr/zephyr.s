
zephyr.elf:     file format elf32-littlearm


Disassembly of section rom_start:

00000000 <_vector_table>:
   0:	80 3b 00 20 a5 57 00 00 a5 b2 00 00 79 57 00 00     .;. .W......yW..
  10:	79 57 00 00 79 57 00 00 79 57 00 00 00 00 00 00     yW..yW..yW......
	...
  2c:	65 54 00 00 79 57 00 00 00 00 00 00 0d 54 00 00     eT..yW.......T..
  3c:	79 57 00 00                                         yW..

00000040 <_irq_vector_table>:
  40:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  50:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  60:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  70:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  80:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  90:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  a0:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  b0:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  c0:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  d0:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  e0:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..
  f0:	19 55 00 00 19 55 00 00 19 55 00 00 19 55 00 00     .U...U...U...U..

Disassembly of section text:

00000100 <memchr>:
     100:	f001 01ff 	and.w	r1, r1, #255	; 0xff
     104:	2a10      	cmp	r2, #16
     106:	db2b      	blt.n	160 <CONFIG_IDLE_STACK_SIZE+0x20>
     108:	f010 0f07 	tst.w	r0, #7
     10c:	d008      	beq.n	120 <memchr+0x20>
     10e:	f810 3b01 	ldrb.w	r3, [r0], #1
     112:	3a01      	subs	r2, #1
     114:	428b      	cmp	r3, r1
     116:	d02d      	beq.n	174 <CONFIG_SYS_CLOCK_MAX_TIMEOUT_DAYS+0x7>
     118:	f010 0f07 	tst.w	r0, #7
     11c:	b342      	cbz	r2, 170 <CONFIG_SYS_CLOCK_MAX_TIMEOUT_DAYS+0x3>
     11e:	d1f6      	bne.n	10e <memchr+0xe>
     120:	b4f0      	push	{r4, r5, r6, r7}
     122:	ea41 2101 	orr.w	r1, r1, r1, lsl #8
     126:	ea41 4101 	orr.w	r1, r1, r1, lsl #16
     12a:	f022 0407 	bic.w	r4, r2, #7
     12e:	f07f 0700 	mvns.w	r7, #0
     132:	2300      	movs	r3, #0
     134:	e8f0 5602 	ldrd	r5, r6, [r0], #8
     138:	3c08      	subs	r4, #8
     13a:	ea85 0501 	eor.w	r5, r5, r1
     13e:	ea86 0601 	eor.w	r6, r6, r1
     142:	fa85 f547 	uadd8	r5, r5, r7
     146:	faa3 f587 	sel	r5, r3, r7
     14a:	fa86 f647 	uadd8	r6, r6, r7
     14e:	faa5 f687 	sel	r6, r5, r7
     152:	b98e      	cbnz	r6, 178 <CONFIG_SYS_CLOCK_MAX_TIMEOUT_DAYS+0xb>
     154:	d1ee      	bne.n	134 <CONFIG_SHELL_BACKEND_DUMMY_BUF_SIZE+0x8>
     156:	bcf0      	pop	{r4, r5, r6, r7}
     158:	f001 01ff 	and.w	r1, r1, #255	; 0xff
     15c:	f002 0207 	and.w	r2, r2, #7
     160:	b132      	cbz	r2, 170 <CONFIG_SYS_CLOCK_MAX_TIMEOUT_DAYS+0x3>
     162:	f810 3b01 	ldrb.w	r3, [r0], #1
     166:	3a01      	subs	r2, #1
     168:	ea83 0301 	eor.w	r3, r3, r1
     16c:	b113      	cbz	r3, 174 <CONFIG_SYS_CLOCK_MAX_TIMEOUT_DAYS+0x7>
     16e:	d1f8      	bne.n	162 <CONFIG_IDLE_STACK_SIZE+0x22>
     170:	2000      	movs	r0, #0
     172:	4770      	bx	lr
     174:	3801      	subs	r0, #1
     176:	4770      	bx	lr
     178:	2d00      	cmp	r5, #0
     17a:	bf06      	itte	eq
     17c:	4635      	moveq	r5, r6
     17e:	3803      	subeq	r0, #3
     180:	3807      	subne	r0, #7
     182:	f015 0f01 	tst.w	r5, #1
     186:	d107      	bne.n	198 <CONFIG_SYS_CLOCK_MAX_TIMEOUT_DAYS+0x2b>
     188:	3001      	adds	r0, #1
     18a:	f415 7f80 	tst.w	r5, #256	; 0x100
     18e:	bf02      	ittt	eq
     190:	3001      	addeq	r0, #1
     192:	f415 3fc0 	tsteq.w	r5, #98304	; 0x18000
     196:	3001      	addeq	r0, #1
     198:	bcf0      	pop	{r4, r5, r6, r7}
     19a:	3801      	subs	r0, #1
     19c:	4770      	bx	lr
     19e:	bf00      	nop

000001a0 <filter>:
     1a0:	b5d0      	push	{r4, r6, r7, lr}
     1a2:	af02      	add	r7, sp, #8
     1a4:	b084      	sub	sp, #16
     1a6:	2000      	movs	r0, #0
     1a8:	f847 0c0c 	str.w	r0, [r7, #-12]
     1ac:	f847 0c10 	str.w	r0, [r7, #-16]
     1b0:	e7ff      	b.n	1b2 <filter+0x12>
     1b2:	4668      	mov	r0, sp
     1b4:	3808      	subs	r0, #8
     1b6:	4685      	mov	sp, r0
     1b8:	f847 0c14 	str.w	r0, [r7, #-20]
     1bc:	4668      	mov	r0, sp
     1be:	f1a0 0108 	sub.w	r1, r0, #8
     1c2:	468d      	mov	sp, r1
     1c4:	f240 3280 	movw	r2, #896	; 0x380
     1c8:	f2c2 0200 	movt	r2, #8192	; 0x2000
     1cc:	7c51      	ldrb	r1, [r2, #17]
     1ce:	f892 c012 	ldrb.w	ip, [r2, #18]
     1d2:	7cd3      	ldrb	r3, [r2, #19]
     1d4:	7d12      	ldrb	r2, [r2, #20]
     1d6:	0609      	lsls	r1, r1, #24
     1d8:	ea41 410c 	orr.w	r1, r1, ip, lsl #16
     1dc:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
     1e0:	4411      	add	r1, r2
     1e2:	f840 1c08 	str.w	r1, [r0, #-8]
     1e6:	f850 1c08 	ldr.w	r1, [r0, #-8]
     1ea:	f240 30a0 	movw	r0, #928	; 0x3a0
     1ee:	f2c2 0000 	movt	r0, #8192	; 0x2000
     1f2:	6800      	ldr	r0, [r0, #0]
     1f4:	ebb0 2f41 	cmp.w	r0, r1, lsl #9
     1f8:	d806      	bhi.n	208 <CONFIG_SHELL_BACKEND_SERIAL_LOG_MESSAGE_QUEUE_SIZE+0x8>
     1fa:	e7ff      	b.n	1fc <filter+0x5c>
     1fc:	f857 1c14 	ldr.w	r1, [r7, #-20]
     200:	f06f 0015 	mvn.w	r0, #21
     204:	6008      	str	r0, [r1, #0]
     206:	e000      	b.n	20a <CONFIG_SHELL_BACKEND_SERIAL_LOG_MESSAGE_QUEUE_SIZE+0xa>
     208:	e7ff      	b.n	20a <CONFIG_SHELL_BACKEND_SERIAL_LOG_MESSAGE_QUEUE_SIZE+0xa>
     20a:	f857 1c0c 	ldr.w	r1, [r7, #-12]
     20e:	f857 0c10 	ldr.w	r0, [r7, #-16]
     212:	f1a7 0408 	sub.w	r4, r7, #8
     216:	46a5      	mov	sp, r4
     218:	bdd0      	pop	{r4, r6, r7, pc}
	...

0000021c <__aeabi_drsub>:
     21c:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000
     220:	e002      	b.n	228 <__adddf3>
     222:	bf00      	nop

00000224 <__aeabi_dsub>:
     224:	f083 4300 	eor.w	r3, r3, #2147483648	; 0x80000000

00000228 <__adddf3>:
     228:	b530      	push	{r4, r5, lr}
     22a:	ea4f 0441 	mov.w	r4, r1, lsl #1
     22e:	ea4f 0543 	mov.w	r5, r3, lsl #1
     232:	ea94 0f05 	teq	r4, r5
     236:	bf08      	it	eq
     238:	ea90 0f02 	teqeq	r0, r2
     23c:	bf1f      	itttt	ne
     23e:	ea54 0c00 	orrsne.w	ip, r4, r0
     242:	ea55 0c02 	orrsne.w	ip, r5, r2
     246:	ea7f 5c64 	mvnsne.w	ip, r4, asr #21
     24a:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
     24e:	f000 80e2 	beq.w	416 <CONFIG_FLASH_SIZE+0x16>
     252:	ea4f 5454 	mov.w	r4, r4, lsr #21
     256:	ebd4 5555 	rsbs	r5, r4, r5, lsr #21
     25a:	bfb8      	it	lt
     25c:	426d      	neglt	r5, r5
     25e:	dd0c      	ble.n	27a <__adddf3+0x52>
     260:	442c      	add	r4, r5
     262:	ea80 0202 	eor.w	r2, r0, r2
     266:	ea81 0303 	eor.w	r3, r1, r3
     26a:	ea82 0000 	eor.w	r0, r2, r0
     26e:	ea83 0101 	eor.w	r1, r3, r1
     272:	ea80 0202 	eor.w	r2, r0, r2
     276:	ea81 0303 	eor.w	r3, r1, r3
     27a:	2d36      	cmp	r5, #54	; 0x36
     27c:	bf88      	it	hi
     27e:	bd30      	pophi	{r4, r5, pc}
     280:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
     284:	ea4f 3101 	mov.w	r1, r1, lsl #12
     288:	f44f 1c80 	mov.w	ip, #1048576	; 0x100000
     28c:	ea4c 3111 	orr.w	r1, ip, r1, lsr #12
     290:	d002      	beq.n	298 <__adddf3+0x70>
     292:	4240      	negs	r0, r0
     294:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
     298:	f013 4f00 	tst.w	r3, #2147483648	; 0x80000000
     29c:	ea4f 3303 	mov.w	r3, r3, lsl #12
     2a0:	ea4c 3313 	orr.w	r3, ip, r3, lsr #12
     2a4:	d002      	beq.n	2ac <__adddf3+0x84>
     2a6:	4252      	negs	r2, r2
     2a8:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
     2ac:	ea94 0f05 	teq	r4, r5
     2b0:	f000 80a7 	beq.w	402 <CONFIG_FLASH_SIZE+0x2>
     2b4:	f1a4 0401 	sub.w	r4, r4, #1
     2b8:	f1d5 0e20 	rsbs	lr, r5, #32
     2bc:	db0d      	blt.n	2da <__data_size+0x6>
     2be:	fa02 fc0e 	lsl.w	ip, r2, lr
     2c2:	fa22 f205 	lsr.w	r2, r2, r5
     2c6:	1880      	adds	r0, r0, r2
     2c8:	f141 0100 	adc.w	r1, r1, #0
     2cc:	fa03 f20e 	lsl.w	r2, r3, lr
     2d0:	1880      	adds	r0, r0, r2
     2d2:	fa43 f305 	asr.w	r3, r3, r5
     2d6:	4159      	adcs	r1, r3
     2d8:	e00e      	b.n	2f8 <__data_size+0x24>
     2da:	f1a5 0520 	sub.w	r5, r5, #32
     2de:	f10e 0e20 	add.w	lr, lr, #32
     2e2:	2a01      	cmp	r2, #1
     2e4:	fa03 fc0e 	lsl.w	ip, r3, lr
     2e8:	bf28      	it	cs
     2ea:	f04c 0c02 	orrcs.w	ip, ip, #2
     2ee:	fa43 f305 	asr.w	r3, r3, r5
     2f2:	18c0      	adds	r0, r0, r3
     2f4:	eb51 71e3 	adcs.w	r1, r1, r3, asr #31
     2f8:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
     2fc:	d507      	bpl.n	30e <__data_size+0x3a>
     2fe:	f04f 0e00 	mov.w	lr, #0
     302:	f1dc 0c00 	rsbs	ip, ip, #0
     306:	eb7e 0000 	sbcs.w	r0, lr, r0
     30a:	eb6e 0101 	sbc.w	r1, lr, r1
     30e:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
     312:	d31b      	bcc.n	34c <__data_size+0x78>
     314:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
     318:	d30c      	bcc.n	334 <__data_size+0x60>
     31a:	0849      	lsrs	r1, r1, #1
     31c:	ea5f 0030 	movs.w	r0, r0, rrx
     320:	ea4f 0c3c 	mov.w	ip, ip, rrx
     324:	f104 0401 	add.w	r4, r4, #1
     328:	ea4f 5244 	mov.w	r2, r4, lsl #21
     32c:	f512 0f80 	cmn.w	r2, #4194304	; 0x400000
     330:	f080 809a 	bcs.w	468 <CONFIG_FLASH_SIZE+0x68>
     334:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
     338:	bf08      	it	eq
     33a:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
     33e:	f150 0000 	adcs.w	r0, r0, #0
     342:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
     346:	ea41 0105 	orr.w	r1, r1, r5
     34a:	bd30      	pop	{r4, r5, pc}
     34c:	ea5f 0c4c 	movs.w	ip, ip, lsl #1
     350:	4140      	adcs	r0, r0
     352:	eb41 0101 	adc.w	r1, r1, r1
     356:	3c01      	subs	r4, #1
     358:	bf28      	it	cs
     35a:	f5b1 1f80 	cmpcs.w	r1, #1048576	; 0x100000
     35e:	d2e9      	bcs.n	334 <__data_size+0x60>
     360:	f091 0f00 	teq	r1, #0
     364:	bf04      	itt	eq
     366:	4601      	moveq	r1, r0
     368:	2000      	moveq	r0, #0
     36a:	fab1 f381 	clz	r3, r1
     36e:	bf08      	it	eq
     370:	3320      	addeq	r3, #32
     372:	f1a3 030b 	sub.w	r3, r3, #11
     376:	f1b3 0220 	subs.w	r2, r3, #32
     37a:	da0c      	bge.n	396 <__data_size+0xc2>
     37c:	320c      	adds	r2, #12
     37e:	dd08      	ble.n	392 <__data_size+0xbe>
     380:	f102 0c14 	add.w	ip, r2, #20
     384:	f1c2 020c 	rsb	r2, r2, #12
     388:	fa01 f00c 	lsl.w	r0, r1, ip
     38c:	fa21 f102 	lsr.w	r1, r1, r2
     390:	e00c      	b.n	3ac <__data_size+0xd8>
     392:	f102 0214 	add.w	r2, r2, #20
     396:	bfd8      	it	le
     398:	f1c2 0c20 	rsble	ip, r2, #32
     39c:	fa01 f102 	lsl.w	r1, r1, r2
     3a0:	fa20 fc0c 	lsr.w	ip, r0, ip
     3a4:	bfdc      	itt	le
     3a6:	ea41 010c 	orrle.w	r1, r1, ip
     3aa:	4090      	lslle	r0, r2
     3ac:	1ae4      	subs	r4, r4, r3
     3ae:	bfa2      	ittt	ge
     3b0:	eb01 5104 	addge.w	r1, r1, r4, lsl #20
     3b4:	4329      	orrge	r1, r5
     3b6:	bd30      	popge	{r4, r5, pc}
     3b8:	ea6f 0404 	mvn.w	r4, r4
     3bc:	3c1f      	subs	r4, #31
     3be:	da1c      	bge.n	3fa <CONFIG_HEAP_MEM_POOL_SIZE+0x12>
     3c0:	340c      	adds	r4, #12
     3c2:	dc0e      	bgt.n	3e2 <__data_size+0x10e>
     3c4:	f104 0414 	add.w	r4, r4, #20
     3c8:	f1c4 0220 	rsb	r2, r4, #32
     3cc:	fa20 f004 	lsr.w	r0, r0, r4
     3d0:	fa01 f302 	lsl.w	r3, r1, r2
     3d4:	ea40 0003 	orr.w	r0, r0, r3
     3d8:	fa21 f304 	lsr.w	r3, r1, r4
     3dc:	ea45 0103 	orr.w	r1, r5, r3
     3e0:	bd30      	pop	{r4, r5, pc}
     3e2:	f1c4 040c 	rsb	r4, r4, #12
     3e6:	f1c4 0220 	rsb	r2, r4, #32
     3ea:	fa20 f002 	lsr.w	r0, r0, r2
     3ee:	fa01 f304 	lsl.w	r3, r1, r4
     3f2:	ea40 0003 	orr.w	r0, r0, r3
     3f6:	4629      	mov	r1, r5
     3f8:	bd30      	pop	{r4, r5, pc}
     3fa:	fa21 f004 	lsr.w	r0, r1, r4
     3fe:	4629      	mov	r1, r5
     400:	bd30      	pop	{r4, r5, pc}
     402:	f094 0f00 	teq	r4, #0
     406:	f483 1380 	eor.w	r3, r3, #1048576	; 0x100000
     40a:	bf06      	itte	eq
     40c:	f481 1180 	eoreq.w	r1, r1, #1048576	; 0x100000
     410:	3401      	addeq	r4, #1
     412:	3d01      	subne	r5, #1
     414:	e74e      	b.n	2b4 <__adddf3+0x8c>
     416:	ea7f 5c64 	mvns.w	ip, r4, asr #21
     41a:	bf18      	it	ne
     41c:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
     420:	d029      	beq.n	476 <CONFIG_FLASH_SIZE+0x76>
     422:	ea94 0f05 	teq	r4, r5
     426:	bf08      	it	eq
     428:	ea90 0f02 	teqeq	r0, r2
     42c:	d005      	beq.n	43a <CONFIG_FLASH_SIZE+0x3a>
     42e:	ea54 0c00 	orrs.w	ip, r4, r0
     432:	bf04      	itt	eq
     434:	4619      	moveq	r1, r3
     436:	4610      	moveq	r0, r2
     438:	bd30      	pop	{r4, r5, pc}
     43a:	ea91 0f03 	teq	r1, r3
     43e:	bf1e      	ittt	ne
     440:	2100      	movne	r1, #0
     442:	2000      	movne	r0, #0
     444:	bd30      	popne	{r4, r5, pc}
     446:	ea5f 5c54 	movs.w	ip, r4, lsr #21
     44a:	d105      	bne.n	458 <CONFIG_FLASH_SIZE+0x58>
     44c:	0040      	lsls	r0, r0, #1
     44e:	4149      	adcs	r1, r1
     450:	bf28      	it	cs
     452:	f041 4100 	orrcs.w	r1, r1, #2147483648	; 0x80000000
     456:	bd30      	pop	{r4, r5, pc}
     458:	f514 0480 	adds.w	r4, r4, #4194304	; 0x400000
     45c:	bf3c      	itt	cc
     45e:	f501 1180 	addcc.w	r1, r1, #1048576	; 0x100000
     462:	bd30      	popcc	{r4, r5, pc}
     464:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
     468:	f045 41fe 	orr.w	r1, r5, #2130706432	; 0x7f000000
     46c:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
     470:	f04f 0000 	mov.w	r0, #0
     474:	bd30      	pop	{r4, r5, pc}
     476:	ea7f 5c64 	mvns.w	ip, r4, asr #21
     47a:	bf1a      	itte	ne
     47c:	4619      	movne	r1, r3
     47e:	4610      	movne	r0, r2
     480:	ea7f 5c65 	mvnseq.w	ip, r5, asr #21
     484:	bf1c      	itt	ne
     486:	460b      	movne	r3, r1
     488:	4602      	movne	r2, r0
     48a:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
     48e:	bf06      	itte	eq
     490:	ea52 3503 	orrseq.w	r5, r2, r3, lsl #12
     494:	ea91 0f03 	teqeq	r1, r3
     498:	f441 2100 	orrne.w	r1, r1, #524288	; 0x80000
     49c:	bd30      	pop	{r4, r5, pc}
     49e:	bf00      	nop

000004a0 <__aeabi_ui2d>:
     4a0:	f090 0f00 	teq	r0, #0
     4a4:	bf04      	itt	eq
     4a6:	2100      	moveq	r1, #0
     4a8:	4770      	bxeq	lr
     4aa:	b530      	push	{r4, r5, lr}
     4ac:	f44f 6480 	mov.w	r4, #1024	; 0x400
     4b0:	f104 0432 	add.w	r4, r4, #50	; 0x32
     4b4:	f04f 0500 	mov.w	r5, #0
     4b8:	f04f 0100 	mov.w	r1, #0
     4bc:	e750      	b.n	360 <__data_size+0x8c>
     4be:	bf00      	nop

000004c0 <__aeabi_i2d>:
     4c0:	f090 0f00 	teq	r0, #0
     4c4:	bf04      	itt	eq
     4c6:	2100      	moveq	r1, #0
     4c8:	4770      	bxeq	lr
     4ca:	b530      	push	{r4, r5, lr}
     4cc:	f44f 6480 	mov.w	r4, #1024	; 0x400
     4d0:	f104 0432 	add.w	r4, r4, #50	; 0x32
     4d4:	f010 4500 	ands.w	r5, r0, #2147483648	; 0x80000000
     4d8:	bf48      	it	mi
     4da:	4240      	negmi	r0, r0
     4dc:	f04f 0100 	mov.w	r1, #0
     4e0:	e73e      	b.n	360 <__data_size+0x8c>
     4e2:	bf00      	nop

000004e4 <__aeabi_f2d>:
     4e4:	0042      	lsls	r2, r0, #1
     4e6:	ea4f 01e2 	mov.w	r1, r2, asr #3
     4ea:	ea4f 0131 	mov.w	r1, r1, rrx
     4ee:	ea4f 7002 	mov.w	r0, r2, lsl #28
     4f2:	bf1f      	itttt	ne
     4f4:	f012 437f 	andsne.w	r3, r2, #4278190080	; 0xff000000
     4f8:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
     4fc:	f081 5160 	eorne.w	r1, r1, #939524096	; 0x38000000
     500:	4770      	bxne	lr
     502:	f032 427f 	bics.w	r2, r2, #4278190080	; 0xff000000
     506:	bf08      	it	eq
     508:	4770      	bxeq	lr
     50a:	f093 4f7f 	teq	r3, #4278190080	; 0xff000000
     50e:	bf04      	itt	eq
     510:	f441 2100 	orreq.w	r1, r1, #524288	; 0x80000
     514:	4770      	bxeq	lr
     516:	b530      	push	{r4, r5, lr}
     518:	f44f 7460 	mov.w	r4, #896	; 0x380
     51c:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
     520:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
     524:	e71c      	b.n	360 <__data_size+0x8c>
     526:	bf00      	nop

00000528 <__aeabi_ul2d>:
     528:	ea50 0201 	orrs.w	r2, r0, r1
     52c:	bf08      	it	eq
     52e:	4770      	bxeq	lr
     530:	b530      	push	{r4, r5, lr}
     532:	f04f 0500 	mov.w	r5, #0
     536:	e00a      	b.n	54e <__aeabi_l2d+0x16>

00000538 <__aeabi_l2d>:
     538:	ea50 0201 	orrs.w	r2, r0, r1
     53c:	bf08      	it	eq
     53e:	4770      	bxeq	lr
     540:	b530      	push	{r4, r5, lr}
     542:	f011 4500 	ands.w	r5, r1, #2147483648	; 0x80000000
     546:	d502      	bpl.n	54e <__aeabi_l2d+0x16>
     548:	4240      	negs	r0, r0
     54a:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
     54e:	f44f 6480 	mov.w	r4, #1024	; 0x400
     552:	f104 0432 	add.w	r4, r4, #50	; 0x32
     556:	ea5f 5c91 	movs.w	ip, r1, lsr #22
     55a:	f43f aed8 	beq.w	30e <__data_size+0x3a>
     55e:	f04f 0203 	mov.w	r2, #3
     562:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
     566:	bf18      	it	ne
     568:	3203      	addne	r2, #3
     56a:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
     56e:	bf18      	it	ne
     570:	3203      	addne	r2, #3
     572:	eb02 02dc 	add.w	r2, r2, ip, lsr #3
     576:	f1c2 0320 	rsb	r3, r2, #32
     57a:	fa00 fc03 	lsl.w	ip, r0, r3
     57e:	fa20 f002 	lsr.w	r0, r0, r2
     582:	fa01 fe03 	lsl.w	lr, r1, r3
     586:	ea40 000e 	orr.w	r0, r0, lr
     58a:	fa21 f102 	lsr.w	r1, r1, r2
     58e:	4414      	add	r4, r2
     590:	e6bd      	b.n	30e <__data_size+0x3a>
     592:	bf00      	nop

00000594 <__aeabi_frsub>:
     594:	f080 4000 	eor.w	r0, r0, #2147483648	; 0x80000000
     598:	e002      	b.n	5a0 <__addsf3>
     59a:	bf00      	nop

0000059c <__aeabi_fsub>:
     59c:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000

000005a0 <__addsf3>:
     5a0:	0042      	lsls	r2, r0, #1
     5a2:	bf1f      	itttt	ne
     5a4:	ea5f 0341 	movsne.w	r3, r1, lsl #1
     5a8:	ea92 0f03 	teqne	r2, r3
     5ac:	ea7f 6c22 	mvnsne.w	ip, r2, asr #24
     5b0:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
     5b4:	d06a      	beq.n	68c <__addsf3+0xec>
     5b6:	ea4f 6212 	mov.w	r2, r2, lsr #24
     5ba:	ebd2 6313 	rsbs	r3, r2, r3, lsr #24
     5be:	bfc1      	itttt	gt
     5c0:	18d2      	addgt	r2, r2, r3
     5c2:	4041      	eorgt	r1, r0
     5c4:	4048      	eorgt	r0, r1
     5c6:	4041      	eorgt	r1, r0
     5c8:	bfb8      	it	lt
     5ca:	425b      	neglt	r3, r3
     5cc:	2b19      	cmp	r3, #25
     5ce:	bf88      	it	hi
     5d0:	4770      	bxhi	lr
     5d2:	f010 4f00 	tst.w	r0, #2147483648	; 0x80000000
     5d6:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
     5da:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
     5de:	bf18      	it	ne
     5e0:	4240      	negne	r0, r0
     5e2:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
     5e6:	f441 0100 	orr.w	r1, r1, #8388608	; 0x800000
     5ea:	f021 417f 	bic.w	r1, r1, #4278190080	; 0xff000000
     5ee:	bf18      	it	ne
     5f0:	4249      	negne	r1, r1
     5f2:	ea92 0f03 	teq	r2, r3
     5f6:	d03f      	beq.n	678 <__addsf3+0xd8>
     5f8:	f1a2 0201 	sub.w	r2, r2, #1
     5fc:	fa41 fc03 	asr.w	ip, r1, r3
     600:	eb10 000c 	adds.w	r0, r0, ip
     604:	f1c3 0320 	rsb	r3, r3, #32
     608:	fa01 f103 	lsl.w	r1, r1, r3
     60c:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
     610:	d502      	bpl.n	618 <__addsf3+0x78>
     612:	4249      	negs	r1, r1
     614:	eb60 0040 	sbc.w	r0, r0, r0, lsl #1
     618:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
     61c:	d313      	bcc.n	646 <__addsf3+0xa6>
     61e:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
     622:	d306      	bcc.n	632 <__addsf3+0x92>
     624:	0840      	lsrs	r0, r0, #1
     626:	ea4f 0131 	mov.w	r1, r1, rrx
     62a:	f102 0201 	add.w	r2, r2, #1
     62e:	2afe      	cmp	r2, #254	; 0xfe
     630:	d251      	bcs.n	6d6 <__addsf3+0x136>
     632:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
     636:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
     63a:	bf08      	it	eq
     63c:	f020 0001 	biceq.w	r0, r0, #1
     640:	ea40 0003 	orr.w	r0, r0, r3
     644:	4770      	bx	lr
     646:	0049      	lsls	r1, r1, #1
     648:	eb40 0000 	adc.w	r0, r0, r0
     64c:	3a01      	subs	r2, #1
     64e:	bf28      	it	cs
     650:	f5b0 0f00 	cmpcs.w	r0, #8388608	; 0x800000
     654:	d2ed      	bcs.n	632 <__addsf3+0x92>
     656:	fab0 fc80 	clz	ip, r0
     65a:	f1ac 0c08 	sub.w	ip, ip, #8
     65e:	ebb2 020c 	subs.w	r2, r2, ip
     662:	fa00 f00c 	lsl.w	r0, r0, ip
     666:	bfaa      	itet	ge
     668:	eb00 50c2 	addge.w	r0, r0, r2, lsl #23
     66c:	4252      	neglt	r2, r2
     66e:	4318      	orrge	r0, r3
     670:	bfbc      	itt	lt
     672:	40d0      	lsrlt	r0, r2
     674:	4318      	orrlt	r0, r3
     676:	4770      	bx	lr
     678:	f092 0f00 	teq	r2, #0
     67c:	f481 0100 	eor.w	r1, r1, #8388608	; 0x800000
     680:	bf06      	itte	eq
     682:	f480 0000 	eoreq.w	r0, r0, #8388608	; 0x800000
     686:	3201      	addeq	r2, #1
     688:	3b01      	subne	r3, #1
     68a:	e7b5      	b.n	5f8 <__addsf3+0x58>
     68c:	ea4f 0341 	mov.w	r3, r1, lsl #1
     690:	ea7f 6c22 	mvns.w	ip, r2, asr #24
     694:	bf18      	it	ne
     696:	ea7f 6c23 	mvnsne.w	ip, r3, asr #24
     69a:	d021      	beq.n	6e0 <__addsf3+0x140>
     69c:	ea92 0f03 	teq	r2, r3
     6a0:	d004      	beq.n	6ac <__addsf3+0x10c>
     6a2:	f092 0f00 	teq	r2, #0
     6a6:	bf08      	it	eq
     6a8:	4608      	moveq	r0, r1
     6aa:	4770      	bx	lr
     6ac:	ea90 0f01 	teq	r0, r1
     6b0:	bf1c      	itt	ne
     6b2:	2000      	movne	r0, #0
     6b4:	4770      	bxne	lr
     6b6:	f012 4f7f 	tst.w	r2, #4278190080	; 0xff000000
     6ba:	d104      	bne.n	6c6 <__addsf3+0x126>
     6bc:	0040      	lsls	r0, r0, #1
     6be:	bf28      	it	cs
     6c0:	f040 4000 	orrcs.w	r0, r0, #2147483648	; 0x80000000
     6c4:	4770      	bx	lr
     6c6:	f112 7200 	adds.w	r2, r2, #33554432	; 0x2000000
     6ca:	bf3c      	itt	cc
     6cc:	f500 0000 	addcc.w	r0, r0, #8388608	; 0x800000
     6d0:	4770      	bxcc	lr
     6d2:	f000 4300 	and.w	r3, r0, #2147483648	; 0x80000000
     6d6:	f043 40fe 	orr.w	r0, r3, #2130706432	; 0x7f000000
     6da:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
     6de:	4770      	bx	lr
     6e0:	ea7f 6222 	mvns.w	r2, r2, asr #24
     6e4:	bf16      	itet	ne
     6e6:	4608      	movne	r0, r1
     6e8:	ea7f 6323 	mvnseq.w	r3, r3, asr #24
     6ec:	4601      	movne	r1, r0
     6ee:	0242      	lsls	r2, r0, #9
     6f0:	bf06      	itte	eq
     6f2:	ea5f 2341 	movseq.w	r3, r1, lsl #9
     6f6:	ea90 0f01 	teqeq	r0, r1
     6fa:	f440 0080 	orrne.w	r0, r0, #4194304	; 0x400000
     6fe:	4770      	bx	lr

00000700 <__aeabi_ui2f>:
     700:	f04f 0300 	mov.w	r3, #0
     704:	e004      	b.n	710 <__aeabi_i2f+0x8>
     706:	bf00      	nop

00000708 <__aeabi_i2f>:
     708:	f010 4300 	ands.w	r3, r0, #2147483648	; 0x80000000
     70c:	bf48      	it	mi
     70e:	4240      	negmi	r0, r0
     710:	ea5f 0c00 	movs.w	ip, r0
     714:	bf08      	it	eq
     716:	4770      	bxeq	lr
     718:	f043 4396 	orr.w	r3, r3, #1258291200	; 0x4b000000
     71c:	4601      	mov	r1, r0
     71e:	f04f 0000 	mov.w	r0, #0
     722:	e01c      	b.n	75e <__aeabi_l2f+0x2a>

00000724 <__aeabi_ul2f>:
     724:	ea50 0201 	orrs.w	r2, r0, r1
     728:	bf08      	it	eq
     72a:	4770      	bxeq	lr
     72c:	f04f 0300 	mov.w	r3, #0
     730:	e00a      	b.n	748 <__aeabi_l2f+0x14>
     732:	bf00      	nop

00000734 <__aeabi_l2f>:
     734:	ea50 0201 	orrs.w	r2, r0, r1
     738:	bf08      	it	eq
     73a:	4770      	bxeq	lr
     73c:	f011 4300 	ands.w	r3, r1, #2147483648	; 0x80000000
     740:	d502      	bpl.n	748 <__aeabi_l2f+0x14>
     742:	4240      	negs	r0, r0
     744:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
     748:	ea5f 0c01 	movs.w	ip, r1
     74c:	bf02      	ittt	eq
     74e:	4684      	moveq	ip, r0
     750:	4601      	moveq	r1, r0
     752:	2000      	moveq	r0, #0
     754:	f043 43b6 	orr.w	r3, r3, #1526726656	; 0x5b000000
     758:	bf08      	it	eq
     75a:	f1a3 5380 	subeq.w	r3, r3, #268435456	; 0x10000000
     75e:	f5a3 0300 	sub.w	r3, r3, #8388608	; 0x800000
     762:	fabc f28c 	clz	r2, ip
     766:	3a08      	subs	r2, #8
     768:	eba3 53c2 	sub.w	r3, r3, r2, lsl #23
     76c:	db10      	blt.n	790 <__aeabi_l2f+0x5c>
     76e:	fa01 fc02 	lsl.w	ip, r1, r2
     772:	4463      	add	r3, ip
     774:	fa00 fc02 	lsl.w	ip, r0, r2
     778:	f1c2 0220 	rsb	r2, r2, #32
     77c:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
     780:	fa20 f202 	lsr.w	r2, r0, r2
     784:	eb43 0002 	adc.w	r0, r3, r2
     788:	bf08      	it	eq
     78a:	f020 0001 	biceq.w	r0, r0, #1
     78e:	4770      	bx	lr
     790:	f102 0220 	add.w	r2, r2, #32
     794:	fa01 fc02 	lsl.w	ip, r1, r2
     798:	f1c2 0220 	rsb	r2, r2, #32
     79c:	ea50 004c 	orrs.w	r0, r0, ip, lsl #1
     7a0:	fa21 f202 	lsr.w	r2, r1, r2
     7a4:	eb43 0002 	adc.w	r0, r3, r2
     7a8:	bf08      	it	eq
     7aa:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
     7ae:	4770      	bx	lr

000007b0 <__aeabi_fmul>:
     7b0:	f04f 0cff 	mov.w	ip, #255	; 0xff
     7b4:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
     7b8:	bf1e      	ittt	ne
     7ba:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
     7be:	ea92 0f0c 	teqne	r2, ip
     7c2:	ea93 0f0c 	teqne	r3, ip
     7c6:	d06f      	beq.n	8a8 <__z_interrupt_stack_SIZEOF+0x68>
     7c8:	441a      	add	r2, r3
     7ca:	ea80 0c01 	eor.w	ip, r0, r1
     7ce:	0240      	lsls	r0, r0, #9
     7d0:	bf18      	it	ne
     7d2:	ea5f 2141 	movsne.w	r1, r1, lsl #9
     7d6:	d01e      	beq.n	816 <CONFIG_ISR_STACK_SIZE+0x16>
     7d8:	f04f 6300 	mov.w	r3, #134217728	; 0x8000000
     7dc:	ea43 1050 	orr.w	r0, r3, r0, lsr #5
     7e0:	ea43 1151 	orr.w	r1, r3, r1, lsr #5
     7e4:	fba0 3101 	umull	r3, r1, r0, r1
     7e8:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
     7ec:	f5b1 0f00 	cmp.w	r1, #8388608	; 0x800000
     7f0:	bf3e      	ittt	cc
     7f2:	0049      	lslcc	r1, r1, #1
     7f4:	ea41 71d3 	orrcc.w	r1, r1, r3, lsr #31
     7f8:	005b      	lslcc	r3, r3, #1
     7fa:	ea40 0001 	orr.w	r0, r0, r1
     7fe:	f162 027f 	sbc.w	r2, r2, #127	; 0x7f
     802:	2afd      	cmp	r2, #253	; 0xfd
     804:	d81d      	bhi.n	842 <__z_interrupt_stack_SIZEOF+0x2>
     806:	f1b3 4f00 	cmp.w	r3, #2147483648	; 0x80000000
     80a:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
     80e:	bf08      	it	eq
     810:	f020 0001 	biceq.w	r0, r0, #1
     814:	4770      	bx	lr
     816:	f090 0f00 	teq	r0, #0
     81a:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
     81e:	bf08      	it	eq
     820:	0249      	lsleq	r1, r1, #9
     822:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
     826:	ea40 2051 	orr.w	r0, r0, r1, lsr #9
     82a:	3a7f      	subs	r2, #127	; 0x7f
     82c:	bfc2      	ittt	gt
     82e:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
     832:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
     836:	4770      	bxgt	lr
     838:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
     83c:	f04f 0300 	mov.w	r3, #0
     840:	3a01      	subs	r2, #1
     842:	dc5d      	bgt.n	900 <__z_interrupt_stack_SIZEOF+0xc0>
     844:	f112 0f19 	cmn.w	r2, #25
     848:	bfdc      	itt	le
     84a:	f000 4000 	andle.w	r0, r0, #2147483648	; 0x80000000
     84e:	4770      	bxle	lr
     850:	f1c2 0200 	rsb	r2, r2, #0
     854:	0041      	lsls	r1, r0, #1
     856:	fa21 f102 	lsr.w	r1, r1, r2
     85a:	f1c2 0220 	rsb	r2, r2, #32
     85e:	fa00 fc02 	lsl.w	ip, r0, r2
     862:	ea5f 0031 	movs.w	r0, r1, rrx
     866:	f140 0000 	adc.w	r0, r0, #0
     86a:	ea53 034c 	orrs.w	r3, r3, ip, lsl #1
     86e:	bf08      	it	eq
     870:	ea20 70dc 	biceq.w	r0, r0, ip, lsr #31
     874:	4770      	bx	lr
     876:	f092 0f00 	teq	r2, #0
     87a:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
     87e:	bf02      	ittt	eq
     880:	0040      	lsleq	r0, r0, #1
     882:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
     886:	3a01      	subeq	r2, #1
     888:	d0f9      	beq.n	87e <__z_interrupt_stack_SIZEOF+0x3e>
     88a:	ea40 000c 	orr.w	r0, r0, ip
     88e:	f093 0f00 	teq	r3, #0
     892:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
     896:	bf02      	ittt	eq
     898:	0049      	lsleq	r1, r1, #1
     89a:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
     89e:	3b01      	subeq	r3, #1
     8a0:	d0f9      	beq.n	896 <__z_interrupt_stack_SIZEOF+0x56>
     8a2:	ea41 010c 	orr.w	r1, r1, ip
     8a6:	e78f      	b.n	7c8 <__aeabi_fmul+0x18>
     8a8:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
     8ac:	ea92 0f0c 	teq	r2, ip
     8b0:	bf18      	it	ne
     8b2:	ea93 0f0c 	teqne	r3, ip
     8b6:	d00a      	beq.n	8ce <__z_interrupt_stack_SIZEOF+0x8e>
     8b8:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
     8bc:	bf18      	it	ne
     8be:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
     8c2:	d1d8      	bne.n	876 <__z_interrupt_stack_SIZEOF+0x36>
     8c4:	ea80 0001 	eor.w	r0, r0, r1
     8c8:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
     8cc:	4770      	bx	lr
     8ce:	f090 0f00 	teq	r0, #0
     8d2:	bf17      	itett	ne
     8d4:	f090 4f00 	teqne	r0, #2147483648	; 0x80000000
     8d8:	4608      	moveq	r0, r1
     8da:	f091 0f00 	teqne	r1, #0
     8de:	f091 4f00 	teqne	r1, #2147483648	; 0x80000000
     8e2:	d014      	beq.n	90e <__z_interrupt_stack_SIZEOF+0xce>
     8e4:	ea92 0f0c 	teq	r2, ip
     8e8:	d101      	bne.n	8ee <__z_interrupt_stack_SIZEOF+0xae>
     8ea:	0242      	lsls	r2, r0, #9
     8ec:	d10f      	bne.n	90e <__z_interrupt_stack_SIZEOF+0xce>
     8ee:	ea93 0f0c 	teq	r3, ip
     8f2:	d103      	bne.n	8fc <__z_interrupt_stack_SIZEOF+0xbc>
     8f4:	024b      	lsls	r3, r1, #9
     8f6:	bf18      	it	ne
     8f8:	4608      	movne	r0, r1
     8fa:	d108      	bne.n	90e <__z_interrupt_stack_SIZEOF+0xce>
     8fc:	ea80 0001 	eor.w	r0, r0, r1
     900:	f000 4000 	and.w	r0, r0, #2147483648	; 0x80000000
     904:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
     908:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
     90c:	4770      	bx	lr
     90e:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
     912:	f440 0040 	orr.w	r0, r0, #12582912	; 0xc00000
     916:	4770      	bx	lr

00000918 <__aeabi_fdiv>:
     918:	f04f 0cff 	mov.w	ip, #255	; 0xff
     91c:	ea1c 52d0 	ands.w	r2, ip, r0, lsr #23
     920:	bf1e      	ittt	ne
     922:	ea1c 53d1 	andsne.w	r3, ip, r1, lsr #23
     926:	ea92 0f0c 	teqne	r2, ip
     92a:	ea93 0f0c 	teqne	r3, ip
     92e:	d069      	beq.n	a04 <__aeabi_fdiv+0xec>
     930:	eba2 0203 	sub.w	r2, r2, r3
     934:	ea80 0c01 	eor.w	ip, r0, r1
     938:	0249      	lsls	r1, r1, #9
     93a:	ea4f 2040 	mov.w	r0, r0, lsl #9
     93e:	d037      	beq.n	9b0 <__aeabi_fdiv+0x98>
     940:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
     944:	ea43 1111 	orr.w	r1, r3, r1, lsr #4
     948:	ea43 1310 	orr.w	r3, r3, r0, lsr #4
     94c:	f00c 4000 	and.w	r0, ip, #2147483648	; 0x80000000
     950:	428b      	cmp	r3, r1
     952:	bf38      	it	cc
     954:	005b      	lslcc	r3, r3, #1
     956:	f142 027d 	adc.w	r2, r2, #125	; 0x7d
     95a:	f44f 0c00 	mov.w	ip, #8388608	; 0x800000
     95e:	428b      	cmp	r3, r1
     960:	bf24      	itt	cs
     962:	1a5b      	subcs	r3, r3, r1
     964:	ea40 000c 	orrcs.w	r0, r0, ip
     968:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
     96c:	bf24      	itt	cs
     96e:	eba3 0351 	subcs.w	r3, r3, r1, lsr #1
     972:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
     976:	ebb3 0f91 	cmp.w	r3, r1, lsr #2
     97a:	bf24      	itt	cs
     97c:	eba3 0391 	subcs.w	r3, r3, r1, lsr #2
     980:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
     984:	ebb3 0fd1 	cmp.w	r3, r1, lsr #3
     988:	bf24      	itt	cs
     98a:	eba3 03d1 	subcs.w	r3, r3, r1, lsr #3
     98e:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
     992:	011b      	lsls	r3, r3, #4
     994:	bf18      	it	ne
     996:	ea5f 1c1c 	movsne.w	ip, ip, lsr #4
     99a:	d1e0      	bne.n	95e <__aeabi_fdiv+0x46>
     99c:	2afd      	cmp	r2, #253	; 0xfd
     99e:	f63f af50 	bhi.w	842 <__z_interrupt_stack_SIZEOF+0x2>
     9a2:	428b      	cmp	r3, r1
     9a4:	eb40 50c2 	adc.w	r0, r0, r2, lsl #23
     9a8:	bf08      	it	eq
     9aa:	f020 0001 	biceq.w	r0, r0, #1
     9ae:	4770      	bx	lr
     9b0:	f00c 4c00 	and.w	ip, ip, #2147483648	; 0x80000000
     9b4:	ea4c 2050 	orr.w	r0, ip, r0, lsr #9
     9b8:	327f      	adds	r2, #127	; 0x7f
     9ba:	bfc2      	ittt	gt
     9bc:	f1d2 03ff 	rsbsgt	r3, r2, #255	; 0xff
     9c0:	ea40 50c2 	orrgt.w	r0, r0, r2, lsl #23
     9c4:	4770      	bxgt	lr
     9c6:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
     9ca:	f04f 0300 	mov.w	r3, #0
     9ce:	3a01      	subs	r2, #1
     9d0:	e737      	b.n	842 <__z_interrupt_stack_SIZEOF+0x2>
     9d2:	f092 0f00 	teq	r2, #0
     9d6:	f000 4c00 	and.w	ip, r0, #2147483648	; 0x80000000
     9da:	bf02      	ittt	eq
     9dc:	0040      	lsleq	r0, r0, #1
     9de:	f410 0f00 	tsteq.w	r0, #8388608	; 0x800000
     9e2:	3a01      	subeq	r2, #1
     9e4:	d0f9      	beq.n	9da <__aeabi_fdiv+0xc2>
     9e6:	ea40 000c 	orr.w	r0, r0, ip
     9ea:	f093 0f00 	teq	r3, #0
     9ee:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
     9f2:	bf02      	ittt	eq
     9f4:	0049      	lsleq	r1, r1, #1
     9f6:	f411 0f00 	tsteq.w	r1, #8388608	; 0x800000
     9fa:	3b01      	subeq	r3, #1
     9fc:	d0f9      	beq.n	9f2 <__aeabi_fdiv+0xda>
     9fe:	ea41 010c 	orr.w	r1, r1, ip
     a02:	e795      	b.n	930 <__aeabi_fdiv+0x18>
     a04:	ea0c 53d1 	and.w	r3, ip, r1, lsr #23
     a08:	ea92 0f0c 	teq	r2, ip
     a0c:	d108      	bne.n	a20 <__aeabi_fdiv+0x108>
     a0e:	0242      	lsls	r2, r0, #9
     a10:	f47f af7d 	bne.w	90e <__z_interrupt_stack_SIZEOF+0xce>
     a14:	ea93 0f0c 	teq	r3, ip
     a18:	f47f af70 	bne.w	8fc <__z_interrupt_stack_SIZEOF+0xbc>
     a1c:	4608      	mov	r0, r1
     a1e:	e776      	b.n	90e <__z_interrupt_stack_SIZEOF+0xce>
     a20:	ea93 0f0c 	teq	r3, ip
     a24:	d104      	bne.n	a30 <__aeabi_fdiv+0x118>
     a26:	024b      	lsls	r3, r1, #9
     a28:	f43f af4c 	beq.w	8c4 <__z_interrupt_stack_SIZEOF+0x84>
     a2c:	4608      	mov	r0, r1
     a2e:	e76e      	b.n	90e <__z_interrupt_stack_SIZEOF+0xce>
     a30:	f030 4c00 	bics.w	ip, r0, #2147483648	; 0x80000000
     a34:	bf18      	it	ne
     a36:	f031 4c00 	bicsne.w	ip, r1, #2147483648	; 0x80000000
     a3a:	d1ca      	bne.n	9d2 <__aeabi_fdiv+0xba>
     a3c:	f030 4200 	bics.w	r2, r0, #2147483648	; 0x80000000
     a40:	f47f af5c 	bne.w	8fc <__z_interrupt_stack_SIZEOF+0xbc>
     a44:	f031 4300 	bics.w	r3, r1, #2147483648	; 0x80000000
     a48:	f47f af3c 	bne.w	8c4 <__z_interrupt_stack_SIZEOF+0x84>
     a4c:	e75f      	b.n	90e <__z_interrupt_stack_SIZEOF+0xce>
     a4e:	bf00      	nop

00000a50 <__aeabi_uldivmod>:
     a50:	b953      	cbnz	r3, a68 <__aeabi_uldivmod+0x18>
     a52:	b94a      	cbnz	r2, a68 <__aeabi_uldivmod+0x18>
     a54:	2900      	cmp	r1, #0
     a56:	bf08      	it	eq
     a58:	2800      	cmpeq	r0, #0
     a5a:	bf1c      	itt	ne
     a5c:	f04f 31ff 	movne.w	r1, #4294967295	; 0xffffffff
     a60:	f04f 30ff 	movne.w	r0, #4294967295	; 0xffffffff
     a64:	f000 bd64 	b.w	1530 <__aeabi_idiv0>
     a68:	f1ad 0c08 	sub.w	ip, sp, #8
     a6c:	e96d ce04 	strd	ip, lr, [sp, #-16]!
     a70:	f000 fd60 	bl	1534 <__udivmoddi4>
     a74:	f8dd e004 	ldr.w	lr, [sp, #4]
     a78:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
     a7c:	b004      	add	sp, #16
     a7e:	4770      	bx	lr

00000a80 <selfrel_offset31>:
     a80:	6803      	ldr	r3, [r0, #0]
     a82:	005a      	lsls	r2, r3, #1
     a84:	bf4c      	ite	mi
     a86:	f043 4300 	orrmi.w	r3, r3, #2147483648	; 0x80000000
     a8a:	f023 4300 	bicpl.w	r3, r3, #2147483648	; 0x80000000
     a8e:	4418      	add	r0, r3
     a90:	4770      	bx	lr

00000a92 <search_EIT_table>:
     a92:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     a96:	4606      	mov	r6, r0
     a98:	4617      	mov	r7, r2
     a9a:	b341      	cbz	r1, aee <search_EIT_table+0x5c>
     a9c:	3901      	subs	r1, #1
     a9e:	4688      	mov	r8, r1
     aa0:	f04f 0900 	mov.w	r9, #0
     aa4:	eb09 0408 	add.w	r4, r9, r8
     aa8:	eb04 74d4 	add.w	r4, r4, r4, lsr #31
     aac:	1064      	asrs	r4, r4, #1
     aae:	eb06 05c4 	add.w	r5, r6, r4, lsl #3
     ab2:	4628      	mov	r0, r5
     ab4:	f7ff ffe4 	bl	a80 <selfrel_offset31>
     ab8:	42a1      	cmp	r1, r4
     aba:	ea4f 0ac4 	mov.w	sl, r4, lsl #3
     abe:	d104      	bne.n	aca <search_EIT_table+0x38>
     ac0:	42b8      	cmp	r0, r7
     ac2:	d804      	bhi.n	ace <search_EIT_table+0x3c>
     ac4:	4628      	mov	r0, r5
     ac6:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
     aca:	42b8      	cmp	r0, r7
     acc:	d904      	bls.n	ad8 <search_EIT_table+0x46>
     ace:	45a1      	cmp	r9, r4
     ad0:	d00d      	beq.n	aee <search_EIT_table+0x5c>
     ad2:	f104 38ff 	add.w	r8, r4, #4294967295	; 0xffffffff
     ad6:	e7e5      	b.n	aa4 <search_EIT_table+0x12>
     ad8:	f10a 0008 	add.w	r0, sl, #8
     adc:	4430      	add	r0, r6
     ade:	f7ff ffcf 	bl	a80 <selfrel_offset31>
     ae2:	3801      	subs	r0, #1
     ae4:	42b8      	cmp	r0, r7
     ae6:	d2ed      	bcs.n	ac4 <search_EIT_table+0x32>
     ae8:	f104 0901 	add.w	r9, r4, #1
     aec:	e7da      	b.n	aa4 <search_EIT_table+0x12>
     aee:	2500      	movs	r5, #0
     af0:	e7e8      	b.n	ac4 <search_EIT_table+0x32>

00000af2 <__gnu_unwind_get_pr_addr>:
     af2:	2801      	cmp	r0, #1
     af4:	d006      	beq.n	b04 <__gnu_unwind_get_pr_addr+0x12>
     af6:	2802      	cmp	r0, #2
     af8:	d006      	beq.n	b08 <__gnu_unwind_get_pr_addr+0x16>
     afa:	2800      	cmp	r0, #0
     afc:	4803      	ldr	r0, [pc, #12]	; (b0c <__gnu_unwind_get_pr_addr+0x1a>)
     afe:	bf18      	it	ne
     b00:	2000      	movne	r0, #0
     b02:	4770      	bx	lr
     b04:	4802      	ldr	r0, [pc, #8]	; (b10 <__gnu_unwind_get_pr_addr+0x1e>)
     b06:	4770      	bx	lr
     b08:	4802      	ldr	r0, [pc, #8]	; (b14 <__gnu_unwind_get_pr_addr+0x22>)
     b0a:	4770      	bx	lr
     b0c:	0000110d 	.word	0x0000110d
     b10:	00001111 	.word	0x00001111
     b14:	00001115 	.word	0x00001115

00000b18 <get_eit_entry>:
     b18:	4b1f      	ldr	r3, [pc, #124]	; (b98 <get_eit_entry+0x80>)
     b1a:	b537      	push	{r0, r1, r2, r4, r5, lr}
     b1c:	4604      	mov	r4, r0
     b1e:	1e8d      	subs	r5, r1, #2
     b20:	b14b      	cbz	r3, b36 <get_eit_entry+0x1e>
     b22:	a901      	add	r1, sp, #4
     b24:	4628      	mov	r0, r5
     b26:	f3af 8000 	nop.w
     b2a:	b948      	cbnz	r0, b40 <get_eit_entry+0x28>
     b2c:	2300      	movs	r3, #0
     b2e:	2009      	movs	r0, #9
     b30:	6123      	str	r3, [r4, #16]
     b32:	b003      	add	sp, #12
     b34:	bd30      	pop	{r4, r5, pc}
     b36:	4819      	ldr	r0, [pc, #100]	; (b9c <get_eit_entry+0x84>)
     b38:	4b19      	ldr	r3, [pc, #100]	; (ba0 <get_eit_entry+0x88>)
     b3a:	1a1b      	subs	r3, r3, r0
     b3c:	10db      	asrs	r3, r3, #3
     b3e:	9301      	str	r3, [sp, #4]
     b40:	9901      	ldr	r1, [sp, #4]
     b42:	462a      	mov	r2, r5
     b44:	f7ff ffa5 	bl	a92 <search_EIT_table>
     b48:	4601      	mov	r1, r0
     b4a:	2800      	cmp	r0, #0
     b4c:	d0ee      	beq.n	b2c <get_eit_entry+0x14>
     b4e:	f7ff ff97 	bl	a80 <selfrel_offset31>
     b52:	684b      	ldr	r3, [r1, #4]
     b54:	64a0      	str	r0, [r4, #72]	; 0x48
     b56:	2b01      	cmp	r3, #1
     b58:	d01a      	beq.n	b90 <get_eit_entry+0x78>
     b5a:	2b00      	cmp	r3, #0
     b5c:	f101 0004 	add.w	r0, r1, #4
     b60:	db10      	blt.n	b84 <get_eit_entry+0x6c>
     b62:	f7ff ff8d 	bl	a80 <selfrel_offset31>
     b66:	2300      	movs	r3, #0
     b68:	e9c4 0313 	strd	r0, r3, [r4, #76]	; 0x4c
     b6c:	6803      	ldr	r3, [r0, #0]
     b6e:	2b00      	cmp	r3, #0
     b70:	da0a      	bge.n	b88 <get_eit_entry+0x70>
     b72:	f3c3 6003 	ubfx	r0, r3, #24, #4
     b76:	f7ff ffbc 	bl	af2 <__gnu_unwind_get_pr_addr>
     b7a:	4603      	mov	r3, r0
     b7c:	2800      	cmp	r0, #0
     b7e:	d0d5      	beq.n	b2c <get_eit_entry+0x14>
     b80:	2000      	movs	r0, #0
     b82:	e7d5      	b.n	b30 <get_eit_entry+0x18>
     b84:	2301      	movs	r3, #1
     b86:	e7ef      	b.n	b68 <get_eit_entry+0x50>
     b88:	f7ff ff7a 	bl	a80 <selfrel_offset31>
     b8c:	4603      	mov	r3, r0
     b8e:	e7f7      	b.n	b80 <get_eit_entry+0x68>
     b90:	2300      	movs	r3, #0
     b92:	2005      	movs	r0, #5
     b94:	e7cc      	b.n	b30 <get_eit_entry+0x18>
     b96:	bf00      	nop
     b98:	00000000 	.word	0x00000000
     b9c:	0000c710 	.word	0x0000c710
     ba0:	0000c7d0 	.word	0x0000c7d0

00000ba4 <restore_non_core_regs>:
     ba4:	6803      	ldr	r3, [r0, #0]
     ba6:	07da      	lsls	r2, r3, #31
     ba8:	b510      	push	{r4, lr}
     baa:	4604      	mov	r4, r0
     bac:	d405      	bmi.n	bba <restore_non_core_regs+0x16>
     bae:	079b      	lsls	r3, r3, #30
     bb0:	f100 0048 	add.w	r0, r0, #72	; 0x48
     bb4:	d518      	bpl.n	be8 <restore_non_core_regs+0x44>
     bb6:	f000 fbf9 	bl	13ac <__gnu_Unwind_Restore_VFP_D>
     bba:	6823      	ldr	r3, [r4, #0]
     bbc:	0759      	lsls	r1, r3, #29
     bbe:	d403      	bmi.n	bc8 <restore_non_core_regs+0x24>
     bc0:	f104 00d0 	add.w	r0, r4, #208	; 0xd0
     bc4:	f000 fbfa 	bl	13bc <__gnu_Unwind_Restore_VFP_D_16_to_31>
     bc8:	6823      	ldr	r3, [r4, #0]
     bca:	071a      	lsls	r2, r3, #28
     bcc:	d403      	bmi.n	bd6 <restore_non_core_regs+0x32>
     bce:	f504 70a8 	add.w	r0, r4, #336	; 0x150
     bd2:	f000 fbfb 	bl	13cc <__gnu_Unwind_Restore_WMMXD>
     bd6:	6823      	ldr	r3, [r4, #0]
     bd8:	06db      	lsls	r3, r3, #27
     bda:	d408      	bmi.n	bee <restore_non_core_regs+0x4a>
     bdc:	f504 70e8 	add.w	r0, r4, #464	; 0x1d0
     be0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
     be4:	f000 bc36 	b.w	1454 <__gnu_Unwind_Restore_WMMXC>
     be8:	f000 fbd8 	bl	139c <__gnu_Unwind_Restore_VFP>
     bec:	e7e5      	b.n	bba <restore_non_core_regs+0x16>
     bee:	bd10      	pop	{r4, pc}

00000bf0 <__gnu_unwind_24bit.constprop.0>:
     bf0:	2009      	movs	r0, #9
     bf2:	4770      	bx	lr

00000bf4 <_Unwind_decode_typeinfo_ptr.constprop.0>:
     bf4:	4603      	mov	r3, r0
     bf6:	6800      	ldr	r0, [r0, #0]
     bf8:	b100      	cbz	r0, bfc <_Unwind_decode_typeinfo_ptr.constprop.0+0x8>
     bfa:	4418      	add	r0, r3
     bfc:	4770      	bx	lr

00000bfe <_Unwind_DebugHook>:
     bfe:	4770      	bx	lr

00000c00 <unwind_phase2>:
     c00:	b570      	push	{r4, r5, r6, lr}
     c02:	4605      	mov	r5, r0
     c04:	460c      	mov	r4, r1
     c06:	6c21      	ldr	r1, [r4, #64]	; 0x40
     c08:	4628      	mov	r0, r5
     c0a:	f7ff ff85 	bl	b18 <get_eit_entry>
     c0e:	4606      	mov	r6, r0
     c10:	b108      	cbz	r0, c16 <unwind_phase2+0x16>
     c12:	f00b fa6c 	bl	c0ee <abort>
     c16:	6c23      	ldr	r3, [r4, #64]	; 0x40
     c18:	616b      	str	r3, [r5, #20]
     c1a:	4622      	mov	r2, r4
     c1c:	692b      	ldr	r3, [r5, #16]
     c1e:	4629      	mov	r1, r5
     c20:	2001      	movs	r0, #1
     c22:	4798      	blx	r3
     c24:	2808      	cmp	r0, #8
     c26:	d0ee      	beq.n	c06 <unwind_phase2+0x6>
     c28:	2807      	cmp	r0, #7
     c2a:	d1f2      	bne.n	c12 <unwind_phase2+0x12>
     c2c:	4630      	mov	r0, r6
     c2e:	6c21      	ldr	r1, [r4, #64]	; 0x40
     c30:	f7ff ffe5 	bl	bfe <_Unwind_DebugHook>
     c34:	1d20      	adds	r0, r4, #4
     c36:	f000 fba5 	bl	1384 <__restore_core_regs>

00000c3a <unwind_phase2_forced>:
     c3a:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
     c3e:	1d0c      	adds	r4, r1, #4
     c40:	f8d0 900c 	ldr.w	r9, [r0, #12]
     c44:	f8d0 a018 	ldr.w	sl, [r0, #24]
     c48:	4607      	mov	r7, r0
     c4a:	4616      	mov	r6, r2
     c4c:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
     c4e:	f5ad 7d72 	sub.w	sp, sp, #968	; 0x3c8
     c52:	ad03      	add	r5, sp, #12
     c54:	c50f      	stmia	r5!, {r0, r1, r2, r3}
     c56:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
     c58:	c50f      	stmia	r5!, {r0, r1, r2, r3}
     c5a:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
     c5c:	c50f      	stmia	r5!, {r0, r1, r2, r3}
     c5e:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
     c62:	f10d 0808 	add.w	r8, sp, #8
     c66:	e885 000f 	stmia.w	r5, {r0, r1, r2, r3}
     c6a:	2500      	movs	r5, #0
     c6c:	f8c8 5000 	str.w	r5, [r8]
     c70:	f8d8 1040 	ldr.w	r1, [r8, #64]	; 0x40
     c74:	4638      	mov	r0, r7
     c76:	f7ff ff4f 	bl	b18 <get_eit_entry>
     c7a:	3609      	adds	r6, #9
     c7c:	b2f6      	uxtb	r6, r6
     c7e:	4604      	mov	r4, r0
     c80:	bb68      	cbnz	r0, cde <unwind_phase2_forced+0xa4>
     c82:	f8d8 3040 	ldr.w	r3, [r8, #64]	; 0x40
     c86:	617b      	str	r3, [r7, #20]
     c88:	f44f 72f0 	mov.w	r2, #480	; 0x1e0
     c8c:	4641      	mov	r1, r8
     c8e:	a87a      	add	r0, sp, #488	; 0x1e8
     c90:	f00b fa44 	bl	c11c <memcpy>
     c94:	693b      	ldr	r3, [r7, #16]
     c96:	aa7a      	add	r2, sp, #488	; 0x1e8
     c98:	4639      	mov	r1, r7
     c9a:	4630      	mov	r0, r6
     c9c:	4798      	blx	r3
     c9e:	9b88      	ldr	r3, [sp, #544]	; 0x220
     ca0:	4605      	mov	r5, r0
     ca2:	f8c8 3044 	str.w	r3, [r8, #68]	; 0x44
     ca6:	463a      	mov	r2, r7
     ca8:	e9cd 8a00 	strd	r8, sl, [sp]
     cac:	463b      	mov	r3, r7
     cae:	4631      	mov	r1, r6
     cb0:	2001      	movs	r0, #1
     cb2:	47c8      	blx	r9
     cb4:	b9c0      	cbnz	r0, ce8 <unwind_phase2_forced+0xae>
     cb6:	b9c4      	cbnz	r4, cea <unwind_phase2_forced+0xb0>
     cb8:	f44f 72f0 	mov.w	r2, #480	; 0x1e0
     cbc:	a97a      	add	r1, sp, #488	; 0x1e8
     cbe:	4640      	mov	r0, r8
     cc0:	f00b fa2c 	bl	c11c <memcpy>
     cc4:	2d08      	cmp	r5, #8
     cc6:	4626      	mov	r6, r4
     cc8:	d0d2      	beq.n	c70 <unwind_phase2_forced+0x36>
     cca:	2d07      	cmp	r5, #7
     ccc:	d10c      	bne.n	ce8 <unwind_phase2_forced+0xae>
     cce:	4620      	mov	r0, r4
     cd0:	f8d8 1040 	ldr.w	r1, [r8, #64]	; 0x40
     cd4:	f7ff ff93 	bl	bfe <_Unwind_DebugHook>
     cd8:	a803      	add	r0, sp, #12
     cda:	f000 fb53 	bl	1384 <__restore_core_regs>
     cde:	f8d8 3038 	ldr.w	r3, [r8, #56]	; 0x38
     ce2:	f046 0610 	orr.w	r6, r6, #16
     ce6:	e7dc      	b.n	ca2 <unwind_phase2_forced+0x68>
     ce8:	2409      	movs	r4, #9
     cea:	4620      	mov	r0, r4
     cec:	f50d 7d72 	add.w	sp, sp, #968	; 0x3c8
     cf0:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

00000cf4 <_Unwind_GetCFA>:
     cf4:	6c40      	ldr	r0, [r0, #68]	; 0x44
     cf6:	4770      	bx	lr

00000cf8 <__gnu_Unwind_RaiseException>:
     cf8:	b5f0      	push	{r4, r5, r6, r7, lr}
     cfa:	6bcb      	ldr	r3, [r1, #60]	; 0x3c
     cfc:	640b      	str	r3, [r1, #64]	; 0x40
     cfe:	1d0d      	adds	r5, r1, #4
     d00:	4606      	mov	r6, r0
     d02:	460f      	mov	r7, r1
     d04:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
     d06:	b0f9      	sub	sp, #484	; 0x1e4
     d08:	ac01      	add	r4, sp, #4
     d0a:	c40f      	stmia	r4!, {r0, r1, r2, r3}
     d0c:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
     d0e:	c40f      	stmia	r4!, {r0, r1, r2, r3}
     d10:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
     d12:	c40f      	stmia	r4!, {r0, r1, r2, r3}
     d14:	e895 000f 	ldmia.w	r5, {r0, r1, r2, r3}
     d18:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
     d1c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     d20:	9300      	str	r3, [sp, #0]
     d22:	9910      	ldr	r1, [sp, #64]	; 0x40
     d24:	4630      	mov	r0, r6
     d26:	f7ff fef7 	bl	b18 <get_eit_entry>
     d2a:	b978      	cbnz	r0, d4c <__gnu_Unwind_RaiseException+0x54>
     d2c:	6933      	ldr	r3, [r6, #16]
     d2e:	466a      	mov	r2, sp
     d30:	4631      	mov	r1, r6
     d32:	4798      	blx	r3
     d34:	2808      	cmp	r0, #8
     d36:	4604      	mov	r4, r0
     d38:	d0f3      	beq.n	d22 <__gnu_Unwind_RaiseException+0x2a>
     d3a:	4668      	mov	r0, sp
     d3c:	f7ff ff32 	bl	ba4 <restore_non_core_regs>
     d40:	2c06      	cmp	r4, #6
     d42:	d103      	bne.n	d4c <__gnu_Unwind_RaiseException+0x54>
     d44:	4639      	mov	r1, r7
     d46:	4630      	mov	r0, r6
     d48:	f7ff ff5a 	bl	c00 <unwind_phase2>
     d4c:	2009      	movs	r0, #9
     d4e:	b079      	add	sp, #484	; 0x1e4
     d50:	bdf0      	pop	{r4, r5, r6, r7, pc}

00000d52 <__gnu_Unwind_ForcedUnwind>:
     d52:	b410      	push	{r4}
     d54:	6182      	str	r2, [r0, #24]
     d56:	6bda      	ldr	r2, [r3, #60]	; 0x3c
     d58:	60c1      	str	r1, [r0, #12]
     d5a:	bc10      	pop	{r4}
     d5c:	641a      	str	r2, [r3, #64]	; 0x40
     d5e:	4619      	mov	r1, r3
     d60:	2200      	movs	r2, #0
     d62:	e76a      	b.n	c3a <unwind_phase2_forced>

00000d64 <__gnu_Unwind_Resume>:
     d64:	b570      	push	{r4, r5, r6, lr}
     d66:	68c6      	ldr	r6, [r0, #12]
     d68:	6943      	ldr	r3, [r0, #20]
     d6a:	640b      	str	r3, [r1, #64]	; 0x40
     d6c:	4604      	mov	r4, r0
     d6e:	460d      	mov	r5, r1
     d70:	b126      	cbz	r6, d7c <__gnu_Unwind_Resume+0x18>
     d72:	2201      	movs	r2, #1
     d74:	f7ff ff61 	bl	c3a <unwind_phase2_forced>
     d78:	f00b f9b9 	bl	c0ee <abort>
     d7c:	6903      	ldr	r3, [r0, #16]
     d7e:	460a      	mov	r2, r1
     d80:	4601      	mov	r1, r0
     d82:	2002      	movs	r0, #2
     d84:	4798      	blx	r3
     d86:	2807      	cmp	r0, #7
     d88:	d005      	beq.n	d96 <__gnu_Unwind_Resume+0x32>
     d8a:	2808      	cmp	r0, #8
     d8c:	d1f4      	bne.n	d78 <__gnu_Unwind_Resume+0x14>
     d8e:	4629      	mov	r1, r5
     d90:	4620      	mov	r0, r4
     d92:	f7ff ff35 	bl	c00 <unwind_phase2>
     d96:	4630      	mov	r0, r6
     d98:	6c29      	ldr	r1, [r5, #64]	; 0x40
     d9a:	f7ff ff30 	bl	bfe <_Unwind_DebugHook>
     d9e:	1d28      	adds	r0, r5, #4
     da0:	f000 faf0 	bl	1384 <__restore_core_regs>

00000da4 <__gnu_Unwind_Resume_or_Rethrow>:
     da4:	68c2      	ldr	r2, [r0, #12]
     da6:	b902      	cbnz	r2, daa <__gnu_Unwind_Resume_or_Rethrow+0x6>
     da8:	e7a6      	b.n	cf8 <__gnu_Unwind_RaiseException>
     daa:	6bca      	ldr	r2, [r1, #60]	; 0x3c
     dac:	640a      	str	r2, [r1, #64]	; 0x40
     dae:	2200      	movs	r2, #0
     db0:	e743      	b.n	c3a <unwind_phase2_forced>

00000db2 <_Unwind_Complete>:
     db2:	4770      	bx	lr

00000db4 <_Unwind_DeleteException>:
     db4:	6883      	ldr	r3, [r0, #8]
     db6:	4601      	mov	r1, r0
     db8:	b10b      	cbz	r3, dbe <_Unwind_DeleteException+0xa>
     dba:	2001      	movs	r0, #1
     dbc:	4718      	bx	r3
     dbe:	4770      	bx	lr

00000dc0 <_Unwind_VRS_Get>:
     dc0:	2901      	cmp	r1, #1
     dc2:	b510      	push	{r4, lr}
     dc4:	4604      	mov	r4, r0
     dc6:	4608      	mov	r0, r1
     dc8:	d005      	beq.n	dd6 <_Unwind_VRS_Get+0x16>
     dca:	d905      	bls.n	dd8 <_Unwind_VRS_Get+0x18>
     dcc:	1ec8      	subs	r0, r1, #3
     dce:	2801      	cmp	r0, #1
     dd0:	bf8c      	ite	hi
     dd2:	2002      	movhi	r0, #2
     dd4:	2001      	movls	r0, #1
     dd6:	bd10      	pop	{r4, pc}
     dd8:	b943      	cbnz	r3, dec <_Unwind_VRS_Get+0x2c>
     dda:	2a0f      	cmp	r2, #15
     ddc:	d806      	bhi.n	dec <_Unwind_VRS_Get+0x2c>
     dde:	eb04 0482 	add.w	r4, r4, r2, lsl #2
     de2:	9a02      	ldr	r2, [sp, #8]
     de4:	6861      	ldr	r1, [r4, #4]
     de6:	6011      	str	r1, [r2, #0]
     de8:	4618      	mov	r0, r3
     dea:	e7f4      	b.n	dd6 <_Unwind_VRS_Get+0x16>
     dec:	2002      	movs	r0, #2
     dee:	e7f2      	b.n	dd6 <_Unwind_VRS_Get+0x16>

00000df0 <_Unwind_GetGR>:
     df0:	b51f      	push	{r0, r1, r2, r3, r4, lr}
     df2:	ab03      	add	r3, sp, #12
     df4:	9300      	str	r3, [sp, #0]
     df6:	2300      	movs	r3, #0
     df8:	460a      	mov	r2, r1
     dfa:	4619      	mov	r1, r3
     dfc:	f7ff ffe0 	bl	dc0 <_Unwind_VRS_Get>
     e00:	9803      	ldr	r0, [sp, #12]
     e02:	b005      	add	sp, #20
     e04:	f85d fb04 	ldr.w	pc, [sp], #4

00000e08 <_Unwind_VRS_Set>:
     e08:	2901      	cmp	r1, #1
     e0a:	b510      	push	{r4, lr}
     e0c:	4604      	mov	r4, r0
     e0e:	4608      	mov	r0, r1
     e10:	d005      	beq.n	e1e <_Unwind_VRS_Set+0x16>
     e12:	d905      	bls.n	e20 <_Unwind_VRS_Set+0x18>
     e14:	1ec8      	subs	r0, r1, #3
     e16:	2801      	cmp	r0, #1
     e18:	bf8c      	ite	hi
     e1a:	2002      	movhi	r0, #2
     e1c:	2001      	movls	r0, #1
     e1e:	bd10      	pop	{r4, pc}
     e20:	b943      	cbnz	r3, e34 <_Unwind_VRS_Set+0x2c>
     e22:	2a0f      	cmp	r2, #15
     e24:	d806      	bhi.n	e34 <_Unwind_VRS_Set+0x2c>
     e26:	9902      	ldr	r1, [sp, #8]
     e28:	eb04 0482 	add.w	r4, r4, r2, lsl #2
     e2c:	6809      	ldr	r1, [r1, #0]
     e2e:	6061      	str	r1, [r4, #4]
     e30:	4618      	mov	r0, r3
     e32:	e7f4      	b.n	e1e <_Unwind_VRS_Set+0x16>
     e34:	2002      	movs	r0, #2
     e36:	e7f2      	b.n	e1e <_Unwind_VRS_Set+0x16>

00000e38 <_Unwind_SetGR>:
     e38:	b51f      	push	{r0, r1, r2, r3, r4, lr}
     e3a:	ab03      	add	r3, sp, #12
     e3c:	9300      	str	r3, [sp, #0]
     e3e:	2300      	movs	r3, #0
     e40:	9203      	str	r2, [sp, #12]
     e42:	460a      	mov	r2, r1
     e44:	4619      	mov	r1, r3
     e46:	f7ff ffdf 	bl	e08 <_Unwind_VRS_Set>
     e4a:	b005      	add	sp, #20
     e4c:	f85d fb04 	ldr.w	pc, [sp], #4

00000e50 <__gnu_Unwind_Backtrace>:
     e50:	b5f0      	push	{r4, r5, r6, r7, lr}
     e52:	6bd3      	ldr	r3, [r2, #60]	; 0x3c
     e54:	6413      	str	r3, [r2, #64]	; 0x40
     e56:	1d14      	adds	r4, r2, #4
     e58:	4606      	mov	r6, r0
     e5a:	460f      	mov	r7, r1
     e5c:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
     e5e:	f5ad 7d0f 	sub.w	sp, sp, #572	; 0x23c
     e62:	ad17      	add	r5, sp, #92	; 0x5c
     e64:	c50f      	stmia	r5!, {r0, r1, r2, r3}
     e66:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
     e68:	c50f      	stmia	r5!, {r0, r1, r2, r3}
     e6a:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
     e6c:	c50f      	stmia	r5!, {r0, r1, r2, r3}
     e6e:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
     e72:	e885 000f 	stmia.w	r5, {r0, r1, r2, r3}
     e76:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
     e7a:	9316      	str	r3, [sp, #88]	; 0x58
     e7c:	9926      	ldr	r1, [sp, #152]	; 0x98
     e7e:	4668      	mov	r0, sp
     e80:	f7ff fe4a 	bl	b18 <get_eit_entry>
     e84:	b990      	cbnz	r0, eac <__gnu_Unwind_Backtrace+0x5c>
     e86:	210c      	movs	r1, #12
     e88:	a816      	add	r0, sp, #88	; 0x58
     e8a:	466a      	mov	r2, sp
     e8c:	f7ff ffd4 	bl	e38 <_Unwind_SetGR>
     e90:	4639      	mov	r1, r7
     e92:	a816      	add	r0, sp, #88	; 0x58
     e94:	47b0      	blx	r6
     e96:	b948      	cbnz	r0, eac <__gnu_Unwind_Backtrace+0x5c>
     e98:	9b04      	ldr	r3, [sp, #16]
     e9a:	aa16      	add	r2, sp, #88	; 0x58
     e9c:	4669      	mov	r1, sp
     e9e:	2008      	movs	r0, #8
     ea0:	4798      	blx	r3
     ea2:	2805      	cmp	r0, #5
     ea4:	4604      	mov	r4, r0
     ea6:	d002      	beq.n	eae <__gnu_Unwind_Backtrace+0x5e>
     ea8:	2809      	cmp	r0, #9
     eaa:	d1e7      	bne.n	e7c <__gnu_Unwind_Backtrace+0x2c>
     eac:	2409      	movs	r4, #9
     eae:	a816      	add	r0, sp, #88	; 0x58
     eb0:	f7ff fe78 	bl	ba4 <restore_non_core_regs>
     eb4:	4620      	mov	r0, r4
     eb6:	f50d 7d0f 	add.w	sp, sp, #572	; 0x23c
     eba:	bdf0      	pop	{r4, r5, r6, r7, pc}

00000ebc <__gnu_unwind_pr_common>:
     ebc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
     ec0:	6ccd      	ldr	r5, [r1, #76]	; 0x4c
     ec2:	b087      	sub	sp, #28
     ec4:	4617      	mov	r7, r2
     ec6:	f855 2b04 	ldr.w	r2, [r5], #4
     eca:	9504      	str	r5, [sp, #16]
     ecc:	460c      	mov	r4, r1
     ece:	f000 0903 	and.w	r9, r0, #3
     ed2:	469a      	mov	sl, r3
     ed4:	bb3b      	cbnz	r3, f26 <__gnu_unwind_pr_common+0x6a>
     ed6:	0212      	lsls	r2, r2, #8
     ed8:	f88d 3015 	strb.w	r3, [sp, #21]
     edc:	9203      	str	r2, [sp, #12]
     ede:	2303      	movs	r3, #3
     ee0:	f88d 3014 	strb.w	r3, [sp, #20]
     ee4:	6d23      	ldr	r3, [r4, #80]	; 0x50
     ee6:	f1b9 0f02 	cmp.w	r9, #2
     eea:	bf08      	it	eq
     eec:	6ba5      	ldreq	r5, [r4, #56]	; 0x38
     eee:	f013 0301 	ands.w	r3, r3, #1
     ef2:	d122      	bne.n	f3a <__gnu_unwind_pr_common+0x7e>
     ef4:	f000 0808 	and.w	r8, r0, #8
     ef8:	9300      	str	r3, [sp, #0]
     efa:	682b      	ldr	r3, [r5, #0]
     efc:	bb43      	cbnz	r3, f50 <__gnu_unwind_pr_common+0x94>
     efe:	a903      	add	r1, sp, #12
     f00:	4638      	mov	r0, r7
     f02:	f000 fc8c 	bl	181e <__gnu_unwind_execute>
     f06:	2800      	cmp	r0, #0
     f08:	f040 80fb 	bne.w	1102 <CONFIG_FPROTECT_BLOCK_SIZE+0x102>
     f0c:	9b00      	ldr	r3, [sp, #0]
     f0e:	b1db      	cbz	r3, f48 <__gnu_unwind_pr_common+0x8c>
     f10:	210f      	movs	r1, #15
     f12:	4638      	mov	r0, r7
     f14:	f7ff ff6c 	bl	df0 <_Unwind_GetGR>
     f18:	210e      	movs	r1, #14
     f1a:	4602      	mov	r2, r0
     f1c:	4638      	mov	r0, r7
     f1e:	f7ff ff8b 	bl	e38 <_Unwind_SetGR>
     f22:	4a79      	ldr	r2, [pc, #484]	; (1108 <CONFIG_FPROTECT_BLOCK_SIZE+0x108>)
     f24:	e055      	b.n	fd2 <__gnu_unwind_pr_common+0x116>
     f26:	0c13      	lsrs	r3, r2, #16
     f28:	f88d 3015 	strb.w	r3, [sp, #21]
     f2c:	0412      	lsls	r2, r2, #16
     f2e:	b2db      	uxtb	r3, r3
     f30:	eb05 0583 	add.w	r5, r5, r3, lsl #2
     f34:	9203      	str	r2, [sp, #12]
     f36:	2302      	movs	r3, #2
     f38:	e7d2      	b.n	ee0 <__gnu_unwind_pr_common+0x24>
     f3a:	a903      	add	r1, sp, #12
     f3c:	4638      	mov	r0, r7
     f3e:	f000 fc6e 	bl	181e <__gnu_unwind_execute>
     f42:	2800      	cmp	r0, #0
     f44:	f040 80dd 	bne.w	1102 <CONFIG_FPROTECT_BLOCK_SIZE+0x102>
     f48:	2008      	movs	r0, #8
     f4a:	b007      	add	sp, #28
     f4c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
     f50:	f1ba 0f02 	cmp.w	sl, #2
     f54:	bf0c      	ite	eq
     f56:	f8d5 b004 	ldreq.w	fp, [r5, #4]
     f5a:	f8b5 b002 	ldrhne.w	fp, [r5, #2]
     f5e:	6ca2      	ldr	r2, [r4, #72]	; 0x48
     f60:	bf18      	it	ne
     f62:	882b      	ldrhne	r3, [r5, #0]
     f64:	9301      	str	r3, [sp, #4]
     f66:	bf0c      	ite	eq
     f68:	f105 0608 	addeq.w	r6, r5, #8
     f6c:	1d2e      	addne	r6, r5, #4
     f6e:	210f      	movs	r1, #15
     f70:	f02b 0501 	bic.w	r5, fp, #1
     f74:	4638      	mov	r0, r7
     f76:	4415      	add	r5, r2
     f78:	f7ff ff3a 	bl	df0 <_Unwind_GetGR>
     f7c:	4285      	cmp	r5, r0
     f7e:	9b01      	ldr	r3, [sp, #4]
     f80:	d829      	bhi.n	fd6 <__gnu_unwind_pr_common+0x11a>
     f82:	f023 0201 	bic.w	r2, r3, #1
     f86:	442a      	add	r2, r5
     f88:	4282      	cmp	r2, r0
     f8a:	bf94      	ite	ls
     f8c:	2200      	movls	r2, #0
     f8e:	2201      	movhi	r2, #1
     f90:	ea4f 004b 	mov.w	r0, fp, lsl #1
     f94:	f000 0002 	and.w	r0, r0, #2
     f98:	f003 0301 	and.w	r3, r3, #1
     f9c:	ea40 0503 	orr.w	r5, r0, r3
     fa0:	2d01      	cmp	r5, #1
     fa2:	d01a      	beq.n	fda <__gnu_unwind_pr_common+0x11e>
     fa4:	2d02      	cmp	r5, #2
     fa6:	d05e      	beq.n	1066 <CONFIG_FPROTECT_BLOCK_SIZE+0x66>
     fa8:	2d00      	cmp	r5, #0
     faa:	f040 80aa 	bne.w	1102 <CONFIG_FPROTECT_BLOCK_SIZE+0x102>
     fae:	1d35      	adds	r5, r6, #4
     fb0:	f1b9 0f00 	cmp.w	r9, #0
     fb4:	d0a1      	beq.n	efa <__gnu_unwind_pr_common+0x3e>
     fb6:	2a00      	cmp	r2, #0
     fb8:	d09f      	beq.n	efa <__gnu_unwind_pr_common+0x3e>
     fba:	4630      	mov	r0, r6
     fbc:	f7ff fd60 	bl	a80 <selfrel_offset31>
     fc0:	63a5      	str	r5, [r4, #56]	; 0x38
     fc2:	4606      	mov	r6, r0
     fc4:	4620      	mov	r0, r4
     fc6:	f3af 8000 	nop.w
     fca:	2800      	cmp	r0, #0
     fcc:	f000 8099 	beq.w	1102 <CONFIG_FPROTECT_BLOCK_SIZE+0x102>
     fd0:	4632      	mov	r2, r6
     fd2:	210f      	movs	r1, #15
     fd4:	e03f      	b.n	1056 <CONFIG_FPROTECT_BLOCK_SIZE+0x56>
     fd6:	2200      	movs	r2, #0
     fd8:	e7da      	b.n	f90 <__gnu_unwind_pr_common+0xd4>
     fda:	f1b9 0f00 	cmp.w	r9, #0
     fde:	d126      	bne.n	102e <CONFIG_FPROTECT_BLOCK_SIZE+0x2e>
     fe0:	2a00      	cmp	r2, #0
     fe2:	d03d      	beq.n	1060 <CONFIG_FPROTECT_BLOCK_SIZE+0x60>
     fe4:	6873      	ldr	r3, [r6, #4]
     fe6:	6832      	ldr	r2, [r6, #0]
     fe8:	1c99      	adds	r1, r3, #2
     fea:	ea4f 72d2 	mov.w	r2, r2, lsr #31
     fee:	f000 8088 	beq.w	1102 <CONFIG_FPROTECT_BLOCK_SIZE+0x102>
     ff2:	f104 0158 	add.w	r1, r4, #88	; 0x58
     ff6:	3301      	adds	r3, #1
     ff8:	9102      	str	r1, [sp, #8]
     ffa:	d009      	beq.n	1010 <CONFIG_FPROTECT_BLOCK_SIZE+0x10>
     ffc:	1d30      	adds	r0, r6, #4
     ffe:	f7ff fdf9 	bl	bf4 <_Unwind_decode_typeinfo_ptr.constprop.0>
    1002:	ab02      	add	r3, sp, #8
    1004:	4601      	mov	r1, r0
    1006:	4620      	mov	r0, r4
    1008:	f3af 8000 	nop.w
    100c:	4605      	mov	r5, r0
    100e:	b338      	cbz	r0, 1060 <CONFIG_FPROTECT_BLOCK_SIZE+0x60>
    1010:	210d      	movs	r1, #13
    1012:	4638      	mov	r0, r7
    1014:	f7ff feec 	bl	df0 <_Unwind_GetGR>
    1018:	2d02      	cmp	r5, #2
    101a:	9b02      	ldr	r3, [sp, #8]
    101c:	6220      	str	r0, [r4, #32]
    101e:	d102      	bne.n	1026 <CONFIG_FPROTECT_BLOCK_SIZE+0x26>
    1020:	62e3      	str	r3, [r4, #44]	; 0x2c
    1022:	f104 032c 	add.w	r3, r4, #44	; 0x2c
    1026:	e9c4 3609 	strd	r3, r6, [r4, #36]	; 0x24
    102a:	2006      	movs	r0, #6
    102c:	e78d      	b.n	f4a <__gnu_unwind_pr_common+0x8e>
    102e:	210d      	movs	r1, #13
    1030:	4638      	mov	r0, r7
    1032:	f7ff fedd 	bl	df0 <_Unwind_GetGR>
    1036:	6a25      	ldr	r5, [r4, #32]
    1038:	4285      	cmp	r5, r0
    103a:	d111      	bne.n	1060 <CONFIG_FPROTECT_BLOCK_SIZE+0x60>
    103c:	6aa3      	ldr	r3, [r4, #40]	; 0x28
    103e:	429e      	cmp	r6, r3
    1040:	d10e      	bne.n	1060 <CONFIG_FPROTECT_BLOCK_SIZE+0x60>
    1042:	4630      	mov	r0, r6
    1044:	f7ff fd1c 	bl	a80 <selfrel_offset31>
    1048:	210f      	movs	r1, #15
    104a:	4602      	mov	r2, r0
    104c:	4638      	mov	r0, r7
    104e:	f7ff fef3 	bl	e38 <_Unwind_SetGR>
    1052:	4622      	mov	r2, r4
    1054:	2100      	movs	r1, #0
    1056:	4638      	mov	r0, r7
    1058:	f7ff feee 	bl	e38 <_Unwind_SetGR>
    105c:	2007      	movs	r0, #7
    105e:	e774      	b.n	f4a <__gnu_unwind_pr_common+0x8e>
    1060:	f106 0508 	add.w	r5, r6, #8
    1064:	e749      	b.n	efa <__gnu_unwind_pr_common+0x3e>
    1066:	6835      	ldr	r5, [r6, #0]
    1068:	f025 4500 	bic.w	r5, r5, #2147483648	; 0x80000000
    106c:	f1b9 0f00 	cmp.w	r9, #0
    1070:	d12a      	bne.n	10c8 <CONFIG_FPROTECT_BLOCK_SIZE+0xc8>
    1072:	b1a2      	cbz	r2, 109e <CONFIG_FPROTECT_BLOCK_SIZE+0x9e>
    1074:	f1b8 0f00 	cmp.w	r8, #0
    1078:	d019      	beq.n	10ae <CONFIG_FPROTECT_BLOCK_SIZE+0xae>
    107a:	b985      	cbnz	r5, 109e <CONFIG_FPROTECT_BLOCK_SIZE+0x9e>
    107c:	46cb      	mov	fp, r9
    107e:	e017      	b.n	10b0 <CONFIG_FPROTECT_BLOCK_SIZE+0xb0>
    1080:	f10b 0b01 	add.w	fp, fp, #1
    1084:	9b01      	ldr	r3, [sp, #4]
    1086:	9302      	str	r3, [sp, #8]
    1088:	eb06 008b 	add.w	r0, r6, fp, lsl #2
    108c:	f7ff fdb2 	bl	bf4 <_Unwind_decode_typeinfo_ptr.constprop.0>
    1090:	2200      	movs	r2, #0
    1092:	4601      	mov	r1, r0
    1094:	ab02      	add	r3, sp, #8
    1096:	4620      	mov	r0, r4
    1098:	f3af 8000 	nop.w
    109c:	b158      	cbz	r0, 10b6 <CONFIG_FPROTECT_BLOCK_SIZE+0xb6>
    109e:	6833      	ldr	r3, [r6, #0]
    10a0:	2b00      	cmp	r3, #0
    10a2:	da00      	bge.n	10a6 <CONFIG_FPROTECT_BLOCK_SIZE+0xa6>
    10a4:	3604      	adds	r6, #4
    10a6:	3501      	adds	r5, #1
    10a8:	eb06 0585 	add.w	r5, r6, r5, lsl #2
    10ac:	e725      	b.n	efa <__gnu_unwind_pr_common+0x3e>
    10ae:	46c3      	mov	fp, r8
    10b0:	f104 0358 	add.w	r3, r4, #88	; 0x58
    10b4:	9301      	str	r3, [sp, #4]
    10b6:	45ab      	cmp	fp, r5
    10b8:	d1e2      	bne.n	1080 <CONFIG_FPROTECT_BLOCK_SIZE+0x80>
    10ba:	210d      	movs	r1, #13
    10bc:	4638      	mov	r0, r7
    10be:	f7ff fe97 	bl	df0 <_Unwind_GetGR>
    10c2:	9b02      	ldr	r3, [sp, #8]
    10c4:	6220      	str	r0, [r4, #32]
    10c6:	e7ae      	b.n	1026 <CONFIG_FPROTECT_BLOCK_SIZE+0x26>
    10c8:	210d      	movs	r1, #13
    10ca:	4638      	mov	r0, r7
    10cc:	f7ff fe90 	bl	df0 <_Unwind_GetGR>
    10d0:	f8d4 b020 	ldr.w	fp, [r4, #32]
    10d4:	4583      	cmp	fp, r0
    10d6:	d1e2      	bne.n	109e <CONFIG_FPROTECT_BLOCK_SIZE+0x9e>
    10d8:	6aa3      	ldr	r3, [r4, #40]	; 0x28
    10da:	429e      	cmp	r6, r3
    10dc:	d1df      	bne.n	109e <CONFIG_FPROTECT_BLOCK_SIZE+0x9e>
    10de:	f04f 0b00 	mov.w	fp, #0
    10e2:	2304      	movs	r3, #4
    10e4:	e9c4 b30b 	strd	fp, r3, [r4, #44]	; 0x2c
    10e8:	18f3      	adds	r3, r6, r3
    10ea:	62a5      	str	r5, [r4, #40]	; 0x28
    10ec:	6363      	str	r3, [r4, #52]	; 0x34
    10ee:	6833      	ldr	r3, [r6, #0]
    10f0:	455b      	cmp	r3, fp
    10f2:	da03      	bge.n	10fc <CONFIG_FPROTECT_BLOCK_SIZE+0xfc>
    10f4:	1c68      	adds	r0, r5, #1
    10f6:	eb06 0080 	add.w	r0, r6, r0, lsl #2
    10fa:	e7a3      	b.n	1044 <CONFIG_FPROTECT_BLOCK_SIZE+0x44>
    10fc:	2301      	movs	r3, #1
    10fe:	9300      	str	r3, [sp, #0]
    1100:	e7d1      	b.n	10a6 <CONFIG_FPROTECT_BLOCK_SIZE+0xa6>
    1102:	2009      	movs	r0, #9
    1104:	e721      	b.n	f4a <__gnu_unwind_pr_common+0x8e>
    1106:	bf00      	nop
    1108:	00000000 	.word	0x00000000

0000110c <__aeabi_unwind_cpp_pr0>:
    110c:	2300      	movs	r3, #0
    110e:	e6d5      	b.n	ebc <__gnu_unwind_pr_common>

00001110 <__aeabi_unwind_cpp_pr1>:
    1110:	2301      	movs	r3, #1
    1112:	e6d3      	b.n	ebc <__gnu_unwind_pr_common>

00001114 <__aeabi_unwind_cpp_pr2>:
    1114:	2302      	movs	r3, #2
    1116:	e6d1      	b.n	ebc <__gnu_unwind_pr_common>

00001118 <_Unwind_VRS_Pop>:
    1118:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    111c:	4605      	mov	r5, r0
    111e:	b0c2      	sub	sp, #264	; 0x108
    1120:	4614      	mov	r4, r2
    1122:	461e      	mov	r6, r3
    1124:	2904      	cmp	r1, #4
    1126:	d825      	bhi.n	1174 <_Unwind_VRS_Pop+0x5c>
    1128:	e8df f011 	tbh	[pc, r1, lsl #1]
    112c:	001c0005 	.word	0x001c0005
    1130:	00d60024 	.word	0x00d60024
    1134:	0104      	.short	0x0104
    1136:	b9ee      	cbnz	r6, 1174 <_Unwind_VRS_Pop+0x5c>
    1138:	6b83      	ldr	r3, [r0, #56]	; 0x38
    113a:	b292      	uxth	r2, r2
    113c:	2101      	movs	r1, #1
    113e:	3004      	adds	r0, #4
    1140:	fa01 f706 	lsl.w	r7, r1, r6
    1144:	4217      	tst	r7, r2
    1146:	bf1c      	itt	ne
    1148:	f853 7b04 	ldrne.w	r7, [r3], #4
    114c:	f840 7026 	strne.w	r7, [r0, r6, lsl #2]
    1150:	3601      	adds	r6, #1
    1152:	2e10      	cmp	r6, #16
    1154:	d1f4      	bne.n	1140 <_Unwind_VRS_Pop+0x28>
    1156:	04a6      	lsls	r6, r4, #18
    1158:	d400      	bmi.n	115c <_Unwind_VRS_Pop+0x44>
    115a:	63ab      	str	r3, [r5, #56]	; 0x38
    115c:	2000      	movs	r0, #0
    115e:	b042      	add	sp, #264	; 0x108
    1160:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1164:	2e01      	cmp	r6, #1
    1166:	ea4f 4712 	mov.w	r7, r2, lsr #16
    116a:	b294      	uxth	r4, r2
    116c:	d104      	bne.n	1178 <_Unwind_VRS_Pop+0x60>
    116e:	193b      	adds	r3, r7, r4
    1170:	2b10      	cmp	r3, #16
    1172:	d941      	bls.n	11f8 <_Unwind_VRS_Pop+0xe0>
    1174:	2002      	movs	r0, #2
    1176:	e7f2      	b.n	115e <_Unwind_VRS_Pop+0x46>
    1178:	2e05      	cmp	r6, #5
    117a:	d1fb      	bne.n	1174 <_Unwind_VRS_Pop+0x5c>
    117c:	eb07 0804 	add.w	r8, r7, r4
    1180:	f1b8 0f20 	cmp.w	r8, #32
    1184:	d8f6      	bhi.n	1174 <_Unwind_VRS_Pop+0x5c>
    1186:	2f0f      	cmp	r7, #15
    1188:	d94d      	bls.n	1226 <_Unwind_VRS_Pop+0x10e>
    118a:	2c00      	cmp	r4, #0
    118c:	d0e6      	beq.n	115c <_Unwind_VRS_Pop+0x44>
    118e:	6803      	ldr	r3, [r0, #0]
    1190:	0758      	lsls	r0, r3, #29
    1192:	46a0      	mov	r8, r4
    1194:	d508      	bpl.n	11a8 <_Unwind_VRS_Pop+0x90>
    1196:	4628      	mov	r0, r5
    1198:	f023 0304 	bic.w	r3, r3, #4
    119c:	f840 3bd0 	str.w	r3, [r0], #208
    11a0:	f000 f910 	bl	13c4 <__gnu_Unwind_Save_VFP_D_16_to_31>
    11a4:	2f0f      	cmp	r7, #15
    11a6:	d948      	bls.n	123a <_Unwind_VRS_Pop+0x122>
    11a8:	4668      	mov	r0, sp
    11aa:	f000 f90b 	bl	13c4 <__gnu_Unwind_Save_VFP_D_16_to_31>
    11ae:	6bab      	ldr	r3, [r5, #56]	; 0x38
    11b0:	2f10      	cmp	r7, #16
    11b2:	463a      	mov	r2, r7
    11b4:	a942      	add	r1, sp, #264	; 0x108
    11b6:	bf38      	it	cc
    11b8:	2210      	movcc	r2, #16
    11ba:	eb01 02c2 	add.w	r2, r1, r2, lsl #3
    11be:	ea4f 0848 	mov.w	r8, r8, lsl #1
    11c2:	f5a2 72c4 	sub.w	r2, r2, #392	; 0x188
    11c6:	f108 38ff 	add.w	r8, r8, #4294967295	; 0xffffffff
    11ca:	1f10      	subs	r0, r2, #4
    11cc:	ea4f 0188 	mov.w	r1, r8, lsl #2
    11d0:	eb02 0288 	add.w	r2, r2, r8, lsl #2
    11d4:	461c      	mov	r4, r3
    11d6:	f854 cb04 	ldr.w	ip, [r4], #4
    11da:	f840 cf04 	str.w	ip, [r0, #4]!
    11de:	4282      	cmp	r2, r0
    11e0:	d1f9      	bne.n	11d6 <_Unwind_VRS_Pop+0xbe>
    11e2:	1d0a      	adds	r2, r1, #4
    11e4:	2e01      	cmp	r6, #1
    11e6:	4413      	add	r3, r2
    11e8:	d017      	beq.n	121a <_Unwind_VRS_Pop+0x102>
    11ea:	2f0f      	cmp	r7, #15
    11ec:	63ab      	str	r3, [r5, #56]	; 0x38
    11ee:	d96f      	bls.n	12d0 <_Unwind_VRS_Pop+0x1b8>
    11f0:	4668      	mov	r0, sp
    11f2:	f000 f8e3 	bl	13bc <__gnu_Unwind_Restore_VFP_D_16_to_31>
    11f6:	e7b1      	b.n	115c <_Unwind_VRS_Pop+0x44>
    11f8:	2f10      	cmp	r7, #16
    11fa:	d0bb      	beq.n	1174 <_Unwind_VRS_Pop+0x5c>
    11fc:	6803      	ldr	r3, [r0, #0]
    11fe:	07da      	lsls	r2, r3, #31
    1200:	d505      	bpl.n	120e <_Unwind_VRS_Pop+0xf6>
    1202:	f023 0303 	bic.w	r3, r3, #3
    1206:	f840 3b48 	str.w	r3, [r0], #72
    120a:	f000 f8cb 	bl	13a4 <__gnu_Unwind_Save_VFP>
    120e:	a820      	add	r0, sp, #128	; 0x80
    1210:	f000 f8c8 	bl	13a4 <__gnu_Unwind_Save_VFP>
    1214:	6bab      	ldr	r3, [r5, #56]	; 0x38
    1216:	2c00      	cmp	r4, #0
    1218:	d13f      	bne.n	129a <_Unwind_VRS_Pop+0x182>
    121a:	3304      	adds	r3, #4
    121c:	63ab      	str	r3, [r5, #56]	; 0x38
    121e:	a820      	add	r0, sp, #128	; 0x80
    1220:	f000 f8bc 	bl	139c <__gnu_Unwind_Restore_VFP>
    1224:	e79a      	b.n	115c <_Unwind_VRS_Pop+0x44>
    1226:	f1b8 0f10 	cmp.w	r8, #16
    122a:	6803      	ldr	r3, [r0, #0]
    122c:	d92d      	bls.n	128a <_Unwind_VRS_Pop+0x172>
    122e:	07dc      	lsls	r4, r3, #31
    1230:	f1a8 0810 	sub.w	r8, r8, #16
    1234:	d442      	bmi.n	12bc <_Unwind_VRS_Pop+0x1a4>
    1236:	0758      	lsls	r0, r3, #29
    1238:	d4ad      	bmi.n	1196 <_Unwind_VRS_Pop+0x7e>
    123a:	a820      	add	r0, sp, #128	; 0x80
    123c:	f000 f8ba 	bl	13b4 <__gnu_Unwind_Save_VFP_D>
    1240:	f1c7 0410 	rsb	r4, r7, #16
    1244:	4668      	mov	r0, sp
    1246:	f000 f8bd 	bl	13c4 <__gnu_Unwind_Save_VFP_D_16_to_31>
    124a:	0064      	lsls	r4, r4, #1
    124c:	aa20      	add	r2, sp, #128	; 0x80
    124e:	6bab      	ldr	r3, [r5, #56]	; 0x38
    1250:	eb02 02c7 	add.w	r2, r2, r7, lsl #3
    1254:	3c01      	subs	r4, #1
    1256:	1f10      	subs	r0, r2, #4
    1258:	00a1      	lsls	r1, r4, #2
    125a:	eb02 0284 	add.w	r2, r2, r4, lsl #2
    125e:	461c      	mov	r4, r3
    1260:	f854 cb04 	ldr.w	ip, [r4], #4
    1264:	f840 cf04 	str.w	ip, [r0, #4]!
    1268:	4290      	cmp	r0, r2
    126a:	d1f9      	bne.n	1260 <_Unwind_VRS_Pop+0x148>
    126c:	1d0a      	adds	r2, r1, #4
    126e:	4413      	add	r3, r2
    1270:	f1b8 0f00 	cmp.w	r8, #0
    1274:	d19c      	bne.n	11b0 <_Unwind_VRS_Pop+0x98>
    1276:	2e01      	cmp	r6, #1
    1278:	d0cf      	beq.n	121a <_Unwind_VRS_Pop+0x102>
    127a:	2f0f      	cmp	r7, #15
    127c:	63ab      	str	r3, [r5, #56]	; 0x38
    127e:	f63f af6d 	bhi.w	115c <_Unwind_VRS_Pop+0x44>
    1282:	a820      	add	r0, sp, #128	; 0x80
    1284:	f000 f892 	bl	13ac <__gnu_Unwind_Restore_VFP_D>
    1288:	e768      	b.n	115c <_Unwind_VRS_Pop+0x44>
    128a:	07d9      	lsls	r1, r3, #31
    128c:	d40d      	bmi.n	12aa <_Unwind_VRS_Pop+0x192>
    128e:	a820      	add	r0, sp, #128	; 0x80
    1290:	f000 f890 	bl	13b4 <__gnu_Unwind_Save_VFP_D>
    1294:	6bab      	ldr	r3, [r5, #56]	; 0x38
    1296:	2c00      	cmp	r4, #0
    1298:	d0f3      	beq.n	1282 <_Unwind_VRS_Pop+0x16a>
    129a:	0064      	lsls	r4, r4, #1
    129c:	aa20      	add	r2, sp, #128	; 0x80
    129e:	eb02 02c7 	add.w	r2, r2, r7, lsl #3
    12a2:	3c01      	subs	r4, #1
    12a4:	f04f 0800 	mov.w	r8, #0
    12a8:	e7d5      	b.n	1256 <_Unwind_VRS_Pop+0x13e>
    12aa:	f023 0301 	bic.w	r3, r3, #1
    12ae:	f043 0302 	orr.w	r3, r3, #2
    12b2:	f840 3b48 	str.w	r3, [r0], #72
    12b6:	f000 f87d 	bl	13b4 <__gnu_Unwind_Save_VFP_D>
    12ba:	e7e8      	b.n	128e <_Unwind_VRS_Pop+0x176>
    12bc:	f023 0301 	bic.w	r3, r3, #1
    12c0:	f043 0302 	orr.w	r3, r3, #2
    12c4:	f840 3b48 	str.w	r3, [r0], #72
    12c8:	f000 f874 	bl	13b4 <__gnu_Unwind_Save_VFP_D>
    12cc:	682b      	ldr	r3, [r5, #0]
    12ce:	e7b2      	b.n	1236 <_Unwind_VRS_Pop+0x11e>
    12d0:	a820      	add	r0, sp, #128	; 0x80
    12d2:	f000 f86b 	bl	13ac <__gnu_Unwind_Restore_VFP_D>
    12d6:	e78b      	b.n	11f0 <_Unwind_VRS_Pop+0xd8>
    12d8:	2e03      	cmp	r6, #3
    12da:	f47f af4b 	bne.w	1174 <_Unwind_VRS_Pop+0x5c>
    12de:	b297      	uxth	r7, r2
    12e0:	eb07 4412 	add.w	r4, r7, r2, lsr #16
    12e4:	2c10      	cmp	r4, #16
    12e6:	ea4f 4612 	mov.w	r6, r2, lsr #16
    12ea:	f63f af43 	bhi.w	1174 <_Unwind_VRS_Pop+0x5c>
    12ee:	6803      	ldr	r3, [r0, #0]
    12f0:	0719      	lsls	r1, r3, #28
    12f2:	d506      	bpl.n	1302 <_Unwind_VRS_Pop+0x1ea>
    12f4:	f023 0308 	bic.w	r3, r3, #8
    12f8:	6003      	str	r3, [r0, #0]
    12fa:	f500 70a8 	add.w	r0, r0, #336	; 0x150
    12fe:	f000 f887 	bl	1410 <__gnu_Unwind_Save_WMMXD>
    1302:	a820      	add	r0, sp, #128	; 0x80
    1304:	f000 f884 	bl	1410 <__gnu_Unwind_Save_WMMXD>
    1308:	6baa      	ldr	r2, [r5, #56]	; 0x38
    130a:	ab20      	add	r3, sp, #128	; 0x80
    130c:	eb03 03c6 	add.w	r3, r3, r6, lsl #3
    1310:	00f9      	lsls	r1, r7, #3
    1312:	1ad4      	subs	r4, r2, r3
    1314:	eb03 07c7 	add.w	r7, r3, r7, lsl #3
    1318:	42bb      	cmp	r3, r7
    131a:	eb03 0004 	add.w	r0, r3, r4
    131e:	d105      	bne.n	132c <_Unwind_VRS_Pop+0x214>
    1320:	440a      	add	r2, r1
    1322:	63aa      	str	r2, [r5, #56]	; 0x38
    1324:	a820      	add	r0, sp, #128	; 0x80
    1326:	f000 f851 	bl	13cc <__gnu_Unwind_Restore_WMMXD>
    132a:	e717      	b.n	115c <_Unwind_VRS_Pop+0x44>
    132c:	6800      	ldr	r0, [r0, #0]
    132e:	f843 0b04 	str.w	r0, [r3], #4
    1332:	e7f1      	b.n	1318 <_Unwind_VRS_Pop+0x200>
    1334:	2e00      	cmp	r6, #0
    1336:	f47f af1d 	bne.w	1174 <_Unwind_VRS_Pop+0x5c>
    133a:	2a10      	cmp	r2, #16
    133c:	f63f af1a 	bhi.w	1174 <_Unwind_VRS_Pop+0x5c>
    1340:	6803      	ldr	r3, [r0, #0]
    1342:	06da      	lsls	r2, r3, #27
    1344:	d506      	bpl.n	1354 <_Unwind_VRS_Pop+0x23c>
    1346:	f023 0310 	bic.w	r3, r3, #16
    134a:	6003      	str	r3, [r0, #0]
    134c:	f500 70e8 	add.w	r0, r0, #464	; 0x1d0
    1350:	f000 f88a 	bl	1468 <__gnu_Unwind_Save_WMMXC>
    1354:	ae20      	add	r6, sp, #128	; 0x80
    1356:	4630      	mov	r0, r6
    1358:	f000 f886 	bl	1468 <__gnu_Unwind_Save_WMMXC>
    135c:	6bab      	ldr	r3, [r5, #56]	; 0x38
    135e:	2200      	movs	r2, #0
    1360:	2101      	movs	r1, #1
    1362:	fa01 f002 	lsl.w	r0, r1, r2
    1366:	4220      	tst	r0, r4
    1368:	bf1c      	itt	ne
    136a:	f853 0b04 	ldrne.w	r0, [r3], #4
    136e:	f846 0022 	strne.w	r0, [r6, r2, lsl #2]
    1372:	3201      	adds	r2, #1
    1374:	2a04      	cmp	r2, #4
    1376:	d1f4      	bne.n	1362 <_Unwind_VRS_Pop+0x24a>
    1378:	63ab      	str	r3, [r5, #56]	; 0x38
    137a:	4630      	mov	r0, r6
    137c:	f000 f86a 	bl	1454 <__gnu_Unwind_Restore_WMMXC>
    1380:	e6ec      	b.n	115c <_Unwind_VRS_Pop+0x44>
    1382:	bf00      	nop

00001384 <__restore_core_regs>:
    1384:	f100 0134 	add.w	r1, r0, #52	; 0x34
    1388:	e891 0038 	ldmia.w	r1, {r3, r4, r5}
    138c:	469c      	mov	ip, r3
    138e:	46a6      	mov	lr, r4
    1390:	f84c 5d04 	str.w	r5, [ip, #-4]!
    1394:	e890 0fff 	ldmia.w	r0, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp}
    1398:	46e5      	mov	sp, ip
    139a:	bd00      	pop	{pc}

0000139c <__gnu_Unwind_Restore_VFP>:
    139c:	ec90 0b21 	fldmiax	r0, {d0-d15}	;@ Deprecated
    13a0:	4770      	bx	lr
    13a2:	bf00      	nop

000013a4 <__gnu_Unwind_Save_VFP>:
    13a4:	ec80 0b21 	fstmiax	r0, {d0-d15}	;@ Deprecated
    13a8:	4770      	bx	lr
    13aa:	bf00      	nop

000013ac <__gnu_Unwind_Restore_VFP_D>:
    13ac:	ec90 0b20 	vldmia	r0, {d0-d15}
    13b0:	4770      	bx	lr
    13b2:	bf00      	nop

000013b4 <__gnu_Unwind_Save_VFP_D>:
    13b4:	ec80 0b20 	vstmia	r0, {d0-d15}
    13b8:	4770      	bx	lr
    13ba:	bf00      	nop

000013bc <__gnu_Unwind_Restore_VFP_D_16_to_31>:
    13bc:	ecd0 0b20 	vldmia	r0, {d16-d31}
    13c0:	4770      	bx	lr
    13c2:	bf00      	nop

000013c4 <__gnu_Unwind_Save_VFP_D_16_to_31>:
    13c4:	ecc0 0b20 	vstmia	r0, {d16-d31}
    13c8:	4770      	bx	lr
    13ca:	bf00      	nop

000013cc <__gnu_Unwind_Restore_WMMXD>:
    13cc:	ecf0 0102 	ldfe	f0, [r0], #8
    13d0:	ecf0 1102 	ldfe	f1, [r0], #8
    13d4:	ecf0 2102 	ldfe	f2, [r0], #8
    13d8:	ecf0 3102 	ldfe	f3, [r0], #8
    13dc:	ecf0 4102 	ldfe	f4, [r0], #8
    13e0:	ecf0 5102 	ldfe	f5, [r0], #8
    13e4:	ecf0 6102 	ldfe	f6, [r0], #8
    13e8:	ecf0 7102 	ldfe	f7, [r0], #8
    13ec:	ecf0 8102 	ldfp	f0, [r0], #8
    13f0:	ecf0 9102 	ldfp	f1, [r0], #8
    13f4:	ecf0 a102 	ldfp	f2, [r0], #8
    13f8:	ecf0 b102 	ldfp	f3, [r0], #8
    13fc:	ecf0 c102 	ldfp	f4, [r0], #8
    1400:	ecf0 d102 	ldfp	f5, [r0], #8
    1404:	ecf0 e102 	ldfp	f6, [r0], #8
    1408:	ecf0 f102 	ldfp	f7, [r0], #8
    140c:	4770      	bx	lr
    140e:	bf00      	nop

00001410 <__gnu_Unwind_Save_WMMXD>:
    1410:	ece0 0102 	stfe	f0, [r0], #8
    1414:	ece0 1102 	stfe	f1, [r0], #8
    1418:	ece0 2102 	stfe	f2, [r0], #8
    141c:	ece0 3102 	stfe	f3, [r0], #8
    1420:	ece0 4102 	stfe	f4, [r0], #8
    1424:	ece0 5102 	stfe	f5, [r0], #8
    1428:	ece0 6102 	stfe	f6, [r0], #8
    142c:	ece0 7102 	stfe	f7, [r0], #8
    1430:	ece0 8102 	stfp	f0, [r0], #8
    1434:	ece0 9102 	stfp	f1, [r0], #8
    1438:	ece0 a102 	stfp	f2, [r0], #8
    143c:	ece0 b102 	stfp	f3, [r0], #8
    1440:	ece0 c102 	stfp	f4, [r0], #8
    1444:	ece0 d102 	stfp	f5, [r0], #8
    1448:	ece0 e102 	stfp	f6, [r0], #8
    144c:	ece0 f102 	stfp	f7, [r0], #8
    1450:	4770      	bx	lr
    1452:	bf00      	nop

00001454 <__gnu_Unwind_Restore_WMMXC>:
    1454:	fcb0 8101 	ldc2	1, cr8, [r0], #4
    1458:	fcb0 9101 	ldc2	1, cr9, [r0], #4
    145c:	fcb0 a101 	ldc2	1, cr10, [r0], #4
    1460:	fcb0 b101 	ldc2	1, cr11, [r0], #4
    1464:	4770      	bx	lr
    1466:	bf00      	nop

00001468 <__gnu_Unwind_Save_WMMXC>:
    1468:	fca0 8101 	stc2	1, cr8, [r0], #4
    146c:	fca0 9101 	stc2	1, cr9, [r0], #4
    1470:	fca0 a101 	stc2	1, cr10, [r0], #4
    1474:	fca0 b101 	stc2	1, cr11, [r0], #4
    1478:	4770      	bx	lr
    147a:	bf00      	nop

0000147c <_Unwind_RaiseException>:
    147c:	46ec      	mov	ip, sp
    147e:	b500      	push	{lr}
    1480:	e92d 5000 	stmdb	sp!, {ip, lr}
    1484:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    1488:	f04f 0300 	mov.w	r3, #0
    148c:	e92d 000c 	stmdb	sp!, {r2, r3}
    1490:	a901      	add	r1, sp, #4
    1492:	f7ff fc31 	bl	cf8 <__gnu_Unwind_RaiseException>
    1496:	f8dd e040 	ldr.w	lr, [sp, #64]	; 0x40
    149a:	b012      	add	sp, #72	; 0x48
    149c:	4770      	bx	lr
    149e:	bf00      	nop

000014a0 <_Unwind_Resume>:
    14a0:	46ec      	mov	ip, sp
    14a2:	b500      	push	{lr}
    14a4:	e92d 5000 	stmdb	sp!, {ip, lr}
    14a8:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    14ac:	f04f 0300 	mov.w	r3, #0
    14b0:	e92d 000c 	stmdb	sp!, {r2, r3}
    14b4:	a901      	add	r1, sp, #4
    14b6:	f7ff fc55 	bl	d64 <__gnu_Unwind_Resume>
    14ba:	f8dd e040 	ldr.w	lr, [sp, #64]	; 0x40
    14be:	b012      	add	sp, #72	; 0x48
    14c0:	4770      	bx	lr
    14c2:	bf00      	nop

000014c4 <_Unwind_Resume_or_Rethrow>:
    14c4:	46ec      	mov	ip, sp
    14c6:	b500      	push	{lr}
    14c8:	e92d 5000 	stmdb	sp!, {ip, lr}
    14cc:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    14d0:	f04f 0300 	mov.w	r3, #0
    14d4:	e92d 000c 	stmdb	sp!, {r2, r3}
    14d8:	a901      	add	r1, sp, #4
    14da:	f7ff fc63 	bl	da4 <__gnu_Unwind_Resume_or_Rethrow>
    14de:	f8dd e040 	ldr.w	lr, [sp, #64]	; 0x40
    14e2:	b012      	add	sp, #72	; 0x48
    14e4:	4770      	bx	lr
    14e6:	bf00      	nop

000014e8 <_Unwind_ForcedUnwind>:
    14e8:	46ec      	mov	ip, sp
    14ea:	b500      	push	{lr}
    14ec:	e92d 5000 	stmdb	sp!, {ip, lr}
    14f0:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    14f4:	f04f 0300 	mov.w	r3, #0
    14f8:	e92d 000c 	stmdb	sp!, {r2, r3}
    14fc:	ab01      	add	r3, sp, #4
    14fe:	f7ff fc28 	bl	d52 <__gnu_Unwind_ForcedUnwind>
    1502:	f8dd e040 	ldr.w	lr, [sp, #64]	; 0x40
    1506:	b012      	add	sp, #72	; 0x48
    1508:	4770      	bx	lr
    150a:	bf00      	nop

0000150c <_Unwind_Backtrace>:
    150c:	46ec      	mov	ip, sp
    150e:	b500      	push	{lr}
    1510:	e92d 5000 	stmdb	sp!, {ip, lr}
    1514:	e92d 1fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    1518:	f04f 0300 	mov.w	r3, #0
    151c:	e92d 000c 	stmdb	sp!, {r2, r3}
    1520:	aa01      	add	r2, sp, #4
    1522:	f7ff fc95 	bl	e50 <__gnu_Unwind_Backtrace>
    1526:	f8dd e040 	ldr.w	lr, [sp, #64]	; 0x40
    152a:	b012      	add	sp, #72	; 0x48
    152c:	4770      	bx	lr
    152e:	bf00      	nop

00001530 <__aeabi_idiv0>:
    1530:	4770      	bx	lr
    1532:	bf00      	nop

00001534 <__udivmoddi4>:
    1534:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    1538:	4686      	mov	lr, r0
    153a:	468c      	mov	ip, r1
    153c:	4608      	mov	r0, r1
    153e:	9e08      	ldr	r6, [sp, #32]
    1540:	4615      	mov	r5, r2
    1542:	4674      	mov	r4, lr
    1544:	4619      	mov	r1, r3
    1546:	2b00      	cmp	r3, #0
    1548:	f040 80c2 	bne.w	16d0 <__udivmoddi4+0x19c>
    154c:	4285      	cmp	r5, r0
    154e:	fab2 f282 	clz	r2, r2
    1552:	d945      	bls.n	15e0 <__udivmoddi4+0xac>
    1554:	b14a      	cbz	r2, 156a <__udivmoddi4+0x36>
    1556:	f1c2 0320 	rsb	r3, r2, #32
    155a:	fa00 fc02 	lsl.w	ip, r0, r2
    155e:	fa2e f303 	lsr.w	r3, lr, r3
    1562:	4095      	lsls	r5, r2
    1564:	ea43 0c0c 	orr.w	ip, r3, ip
    1568:	4094      	lsls	r4, r2
    156a:	ea4f 4e15 	mov.w	lr, r5, lsr #16
    156e:	b2a8      	uxth	r0, r5
    1570:	fbbc f8fe 	udiv	r8, ip, lr
    1574:	0c23      	lsrs	r3, r4, #16
    1576:	fb0e cc18 	mls	ip, lr, r8, ip
    157a:	fb08 f900 	mul.w	r9, r8, r0
    157e:	ea43 430c 	orr.w	r3, r3, ip, lsl #16
    1582:	4599      	cmp	r9, r3
    1584:	d928      	bls.n	15d8 <__udivmoddi4+0xa4>
    1586:	18eb      	adds	r3, r5, r3
    1588:	f108 37ff 	add.w	r7, r8, #4294967295	; 0xffffffff
    158c:	d204      	bcs.n	1598 <__udivmoddi4+0x64>
    158e:	4599      	cmp	r9, r3
    1590:	d902      	bls.n	1598 <__udivmoddi4+0x64>
    1592:	f1a8 0702 	sub.w	r7, r8, #2
    1596:	442b      	add	r3, r5
    1598:	eba3 0309 	sub.w	r3, r3, r9
    159c:	b2a4      	uxth	r4, r4
    159e:	fbb3 fcfe 	udiv	ip, r3, lr
    15a2:	fb0e 331c 	mls	r3, lr, ip, r3
    15a6:	fb0c f000 	mul.w	r0, ip, r0
    15aa:	ea44 4403 	orr.w	r4, r4, r3, lsl #16
    15ae:	42a0      	cmp	r0, r4
    15b0:	d914      	bls.n	15dc <__udivmoddi4+0xa8>
    15b2:	192c      	adds	r4, r5, r4
    15b4:	f10c 33ff 	add.w	r3, ip, #4294967295	; 0xffffffff
    15b8:	d204      	bcs.n	15c4 <__udivmoddi4+0x90>
    15ba:	42a0      	cmp	r0, r4
    15bc:	d902      	bls.n	15c4 <__udivmoddi4+0x90>
    15be:	f1ac 0302 	sub.w	r3, ip, #2
    15c2:	442c      	add	r4, r5
    15c4:	1a24      	subs	r4, r4, r0
    15c6:	ea43 4007 	orr.w	r0, r3, r7, lsl #16
    15ca:	b11e      	cbz	r6, 15d4 <__udivmoddi4+0xa0>
    15cc:	40d4      	lsrs	r4, r2
    15ce:	2300      	movs	r3, #0
    15d0:	6034      	str	r4, [r6, #0]
    15d2:	6073      	str	r3, [r6, #4]
    15d4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    15d8:	4647      	mov	r7, r8
    15da:	e7dd      	b.n	1598 <__udivmoddi4+0x64>
    15dc:	4663      	mov	r3, ip
    15de:	e7f1      	b.n	15c4 <__udivmoddi4+0x90>
    15e0:	bb92      	cbnz	r2, 1648 <__udivmoddi4+0x114>
    15e2:	1b43      	subs	r3, r0, r5
    15e4:	2101      	movs	r1, #1
    15e6:	ea4f 4e15 	mov.w	lr, r5, lsr #16
    15ea:	b2af      	uxth	r7, r5
    15ec:	fbb3 fcfe 	udiv	ip, r3, lr
    15f0:	0c20      	lsrs	r0, r4, #16
    15f2:	fb0e 331c 	mls	r3, lr, ip, r3
    15f6:	fb0c f807 	mul.w	r8, ip, r7
    15fa:	ea40 4303 	orr.w	r3, r0, r3, lsl #16
    15fe:	4598      	cmp	r8, r3
    1600:	d962      	bls.n	16c8 <__udivmoddi4+0x194>
    1602:	18eb      	adds	r3, r5, r3
    1604:	f10c 30ff 	add.w	r0, ip, #4294967295	; 0xffffffff
    1608:	d204      	bcs.n	1614 <__udivmoddi4+0xe0>
    160a:	4598      	cmp	r8, r3
    160c:	d902      	bls.n	1614 <__udivmoddi4+0xe0>
    160e:	f1ac 0002 	sub.w	r0, ip, #2
    1612:	442b      	add	r3, r5
    1614:	eba3 0308 	sub.w	r3, r3, r8
    1618:	b2a4      	uxth	r4, r4
    161a:	fbb3 fcfe 	udiv	ip, r3, lr
    161e:	fb0e 331c 	mls	r3, lr, ip, r3
    1622:	fb0c f707 	mul.w	r7, ip, r7
    1626:	ea44 4403 	orr.w	r4, r4, r3, lsl #16
    162a:	42a7      	cmp	r7, r4
    162c:	d94e      	bls.n	16cc <__udivmoddi4+0x198>
    162e:	192c      	adds	r4, r5, r4
    1630:	f10c 33ff 	add.w	r3, ip, #4294967295	; 0xffffffff
    1634:	d204      	bcs.n	1640 <__udivmoddi4+0x10c>
    1636:	42a7      	cmp	r7, r4
    1638:	d902      	bls.n	1640 <__udivmoddi4+0x10c>
    163a:	f1ac 0302 	sub.w	r3, ip, #2
    163e:	442c      	add	r4, r5
    1640:	1be4      	subs	r4, r4, r7
    1642:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
    1646:	e7c0      	b.n	15ca <__udivmoddi4+0x96>
    1648:	f1c2 0320 	rsb	r3, r2, #32
    164c:	fa20 f103 	lsr.w	r1, r0, r3
    1650:	4095      	lsls	r5, r2
    1652:	4090      	lsls	r0, r2
    1654:	fa2e f303 	lsr.w	r3, lr, r3
    1658:	4303      	orrs	r3, r0
    165a:	ea4f 4e15 	mov.w	lr, r5, lsr #16
    165e:	b2af      	uxth	r7, r5
    1660:	fbb1 fcfe 	udiv	ip, r1, lr
    1664:	fb0e 101c 	mls	r0, lr, ip, r1
    1668:	0c19      	lsrs	r1, r3, #16
    166a:	fb0c f807 	mul.w	r8, ip, r7
    166e:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
    1672:	4588      	cmp	r8, r1
    1674:	fa04 f402 	lsl.w	r4, r4, r2
    1678:	d922      	bls.n	16c0 <__udivmoddi4+0x18c>
    167a:	1869      	adds	r1, r5, r1
    167c:	f10c 30ff 	add.w	r0, ip, #4294967295	; 0xffffffff
    1680:	d204      	bcs.n	168c <__udivmoddi4+0x158>
    1682:	4588      	cmp	r8, r1
    1684:	d902      	bls.n	168c <__udivmoddi4+0x158>
    1686:	f1ac 0002 	sub.w	r0, ip, #2
    168a:	4429      	add	r1, r5
    168c:	eba1 0108 	sub.w	r1, r1, r8
    1690:	b29b      	uxth	r3, r3
    1692:	fbb1 fcfe 	udiv	ip, r1, lr
    1696:	fb0e 111c 	mls	r1, lr, ip, r1
    169a:	fb0c f707 	mul.w	r7, ip, r7
    169e:	ea43 4301 	orr.w	r3, r3, r1, lsl #16
    16a2:	429f      	cmp	r7, r3
    16a4:	d90e      	bls.n	16c4 <__udivmoddi4+0x190>
    16a6:	18eb      	adds	r3, r5, r3
    16a8:	f10c 31ff 	add.w	r1, ip, #4294967295	; 0xffffffff
    16ac:	d204      	bcs.n	16b8 <__udivmoddi4+0x184>
    16ae:	429f      	cmp	r7, r3
    16b0:	d902      	bls.n	16b8 <__udivmoddi4+0x184>
    16b2:	f1ac 0102 	sub.w	r1, ip, #2
    16b6:	442b      	add	r3, r5
    16b8:	1bdb      	subs	r3, r3, r7
    16ba:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
    16be:	e792      	b.n	15e6 <__udivmoddi4+0xb2>
    16c0:	4660      	mov	r0, ip
    16c2:	e7e3      	b.n	168c <__udivmoddi4+0x158>
    16c4:	4661      	mov	r1, ip
    16c6:	e7f7      	b.n	16b8 <__udivmoddi4+0x184>
    16c8:	4660      	mov	r0, ip
    16ca:	e7a3      	b.n	1614 <__udivmoddi4+0xe0>
    16cc:	4663      	mov	r3, ip
    16ce:	e7b7      	b.n	1640 <__udivmoddi4+0x10c>
    16d0:	4283      	cmp	r3, r0
    16d2:	d906      	bls.n	16e2 <__udivmoddi4+0x1ae>
    16d4:	b916      	cbnz	r6, 16dc <__udivmoddi4+0x1a8>
    16d6:	2100      	movs	r1, #0
    16d8:	4608      	mov	r0, r1
    16da:	e77b      	b.n	15d4 <__udivmoddi4+0xa0>
    16dc:	e9c6 e000 	strd	lr, r0, [r6]
    16e0:	e7f9      	b.n	16d6 <__udivmoddi4+0x1a2>
    16e2:	fab3 f783 	clz	r7, r3
    16e6:	b98f      	cbnz	r7, 170c <__udivmoddi4+0x1d8>
    16e8:	4283      	cmp	r3, r0
    16ea:	d301      	bcc.n	16f0 <__udivmoddi4+0x1bc>
    16ec:	4572      	cmp	r2, lr
    16ee:	d808      	bhi.n	1702 <__udivmoddi4+0x1ce>
    16f0:	ebbe 0402 	subs.w	r4, lr, r2
    16f4:	eb60 0303 	sbc.w	r3, r0, r3
    16f8:	2001      	movs	r0, #1
    16fa:	469c      	mov	ip, r3
    16fc:	b91e      	cbnz	r6, 1706 <__udivmoddi4+0x1d2>
    16fe:	2100      	movs	r1, #0
    1700:	e768      	b.n	15d4 <__udivmoddi4+0xa0>
    1702:	4638      	mov	r0, r7
    1704:	e7fa      	b.n	16fc <__udivmoddi4+0x1c8>
    1706:	e9c6 4c00 	strd	r4, ip, [r6]
    170a:	e7f8      	b.n	16fe <__udivmoddi4+0x1ca>
    170c:	f1c7 0c20 	rsb	ip, r7, #32
    1710:	40bb      	lsls	r3, r7
    1712:	fa22 f40c 	lsr.w	r4, r2, ip
    1716:	431c      	orrs	r4, r3
    1718:	fa2e f10c 	lsr.w	r1, lr, ip
    171c:	fa20 f30c 	lsr.w	r3, r0, ip
    1720:	40b8      	lsls	r0, r7
    1722:	4301      	orrs	r1, r0
    1724:	ea4f 4914 	mov.w	r9, r4, lsr #16
    1728:	fa0e f507 	lsl.w	r5, lr, r7
    172c:	fbb3 f8f9 	udiv	r8, r3, r9
    1730:	fa1f fe84 	uxth.w	lr, r4
    1734:	fb09 3018 	mls	r0, r9, r8, r3
    1738:	0c0b      	lsrs	r3, r1, #16
    173a:	fb08 fa0e 	mul.w	sl, r8, lr
    173e:	ea43 4300 	orr.w	r3, r3, r0, lsl #16
    1742:	459a      	cmp	sl, r3
    1744:	fa02 f207 	lsl.w	r2, r2, r7
    1748:	d940      	bls.n	17cc <__udivmoddi4+0x298>
    174a:	18e3      	adds	r3, r4, r3
    174c:	f108 30ff 	add.w	r0, r8, #4294967295	; 0xffffffff
    1750:	d204      	bcs.n	175c <__udivmoddi4+0x228>
    1752:	459a      	cmp	sl, r3
    1754:	d902      	bls.n	175c <__udivmoddi4+0x228>
    1756:	f1a8 0002 	sub.w	r0, r8, #2
    175a:	4423      	add	r3, r4
    175c:	eba3 030a 	sub.w	r3, r3, sl
    1760:	b289      	uxth	r1, r1
    1762:	fbb3 f8f9 	udiv	r8, r3, r9
    1766:	fb09 3318 	mls	r3, r9, r8, r3
    176a:	fb08 fe0e 	mul.w	lr, r8, lr
    176e:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
    1772:	458e      	cmp	lr, r1
    1774:	d92c      	bls.n	17d0 <__udivmoddi4+0x29c>
    1776:	1861      	adds	r1, r4, r1
    1778:	f108 33ff 	add.w	r3, r8, #4294967295	; 0xffffffff
    177c:	d204      	bcs.n	1788 <__udivmoddi4+0x254>
    177e:	458e      	cmp	lr, r1
    1780:	d902      	bls.n	1788 <__udivmoddi4+0x254>
    1782:	f1a8 0302 	sub.w	r3, r8, #2
    1786:	4421      	add	r1, r4
    1788:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
    178c:	fba0 9802 	umull	r9, r8, r0, r2
    1790:	eba1 010e 	sub.w	r1, r1, lr
    1794:	4541      	cmp	r1, r8
    1796:	46ce      	mov	lr, r9
    1798:	4643      	mov	r3, r8
    179a:	d302      	bcc.n	17a2 <__udivmoddi4+0x26e>
    179c:	d106      	bne.n	17ac <__udivmoddi4+0x278>
    179e:	454d      	cmp	r5, r9
    17a0:	d204      	bcs.n	17ac <__udivmoddi4+0x278>
    17a2:	ebb9 0e02 	subs.w	lr, r9, r2
    17a6:	eb68 0304 	sbc.w	r3, r8, r4
    17aa:	3801      	subs	r0, #1
    17ac:	2e00      	cmp	r6, #0
    17ae:	d0a6      	beq.n	16fe <__udivmoddi4+0x1ca>
    17b0:	ebb5 020e 	subs.w	r2, r5, lr
    17b4:	eb61 0103 	sbc.w	r1, r1, r3
    17b8:	fa01 fc0c 	lsl.w	ip, r1, ip
    17bc:	fa22 f307 	lsr.w	r3, r2, r7
    17c0:	ea4c 0303 	orr.w	r3, ip, r3
    17c4:	40f9      	lsrs	r1, r7
    17c6:	e9c6 3100 	strd	r3, r1, [r6]
    17ca:	e798      	b.n	16fe <__udivmoddi4+0x1ca>
    17cc:	4640      	mov	r0, r8
    17ce:	e7c5      	b.n	175c <__udivmoddi4+0x228>
    17d0:	4643      	mov	r3, r8
    17d2:	e7d9      	b.n	1788 <__udivmoddi4+0x254>

000017d4 <next_unwind_byte>:
    17d4:	7a02      	ldrb	r2, [r0, #8]
    17d6:	4603      	mov	r3, r0
    17d8:	b97a      	cbnz	r2, 17fa <next_unwind_byte+0x26>
    17da:	7a42      	ldrb	r2, [r0, #9]
    17dc:	b182      	cbz	r2, 1800 <next_unwind_byte+0x2c>
    17de:	3a01      	subs	r2, #1
    17e0:	7242      	strb	r2, [r0, #9]
    17e2:	6842      	ldr	r2, [r0, #4]
    17e4:	1d11      	adds	r1, r2, #4
    17e6:	6812      	ldr	r2, [r2, #0]
    17e8:	6002      	str	r2, [r0, #0]
    17ea:	6041      	str	r1, [r0, #4]
    17ec:	2203      	movs	r2, #3
    17ee:	721a      	strb	r2, [r3, #8]
    17f0:	681a      	ldr	r2, [r3, #0]
    17f2:	0e10      	lsrs	r0, r2, #24
    17f4:	0212      	lsls	r2, r2, #8
    17f6:	601a      	str	r2, [r3, #0]
    17f8:	4770      	bx	lr
    17fa:	3a01      	subs	r2, #1
    17fc:	b2d2      	uxtb	r2, r2
    17fe:	e7f6      	b.n	17ee <next_unwind_byte+0x1a>
    1800:	20b0      	movs	r0, #176	; 0xb0
    1802:	4770      	bx	lr

00001804 <_Unwind_GetGR.constprop.0>:
    1804:	b51f      	push	{r0, r1, r2, r3, r4, lr}
    1806:	ab03      	add	r3, sp, #12
    1808:	9300      	str	r3, [sp, #0]
    180a:	2300      	movs	r3, #0
    180c:	220c      	movs	r2, #12
    180e:	4619      	mov	r1, r3
    1810:	f7ff fad6 	bl	dc0 <_Unwind_VRS_Get>
    1814:	9803      	ldr	r0, [sp, #12]
    1816:	b005      	add	sp, #20
    1818:	f85d fb04 	ldr.w	pc, [sp], #4

0000181c <unwind_UCB_from_context>:
    181c:	e7f2      	b.n	1804 <_Unwind_GetGR.constprop.0>

0000181e <__gnu_unwind_execute>:
    181e:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    1822:	4605      	mov	r5, r0
    1824:	b085      	sub	sp, #20
    1826:	460e      	mov	r6, r1
    1828:	f04f 0800 	mov.w	r8, #0
    182c:	4630      	mov	r0, r6
    182e:	f7ff ffd1 	bl	17d4 <next_unwind_byte>
    1832:	28b0      	cmp	r0, #176	; 0xb0
    1834:	4604      	mov	r4, r0
    1836:	d115      	bne.n	1864 <__gnu_unwind_execute+0x46>
    1838:	f1b8 0f00 	cmp.w	r8, #0
    183c:	d10e      	bne.n	185c <__gnu_unwind_execute+0x3e>
    183e:	ac03      	add	r4, sp, #12
    1840:	4643      	mov	r3, r8
    1842:	220e      	movs	r2, #14
    1844:	4641      	mov	r1, r8
    1846:	9400      	str	r4, [sp, #0]
    1848:	4628      	mov	r0, r5
    184a:	f7ff fab9 	bl	dc0 <_Unwind_VRS_Get>
    184e:	9400      	str	r4, [sp, #0]
    1850:	4643      	mov	r3, r8
    1852:	220f      	movs	r2, #15
    1854:	4641      	mov	r1, r8
    1856:	4628      	mov	r0, r5
    1858:	f7ff fad6 	bl	e08 <_Unwind_VRS_Set>
    185c:	2000      	movs	r0, #0
    185e:	b005      	add	sp, #20
    1860:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    1864:	0602      	lsls	r2, r0, #24
    1866:	d41d      	bmi.n	18a4 <__gnu_unwind_execute+0x86>
    1868:	2300      	movs	r3, #0
    186a:	af03      	add	r7, sp, #12
    186c:	ea4f 0980 	mov.w	r9, r0, lsl #2
    1870:	4619      	mov	r1, r3
    1872:	9700      	str	r7, [sp, #0]
    1874:	220d      	movs	r2, #13
    1876:	4628      	mov	r0, r5
    1878:	f7ff faa2 	bl	dc0 <_Unwind_VRS_Get>
    187c:	fa5f f989 	uxtb.w	r9, r9
    1880:	9b03      	ldr	r3, [sp, #12]
    1882:	f109 0904 	add.w	r9, r9, #4
    1886:	f014 0f40 	tst.w	r4, #64	; 0x40
    188a:	bf14      	ite	ne
    188c:	eba3 0309 	subne.w	r3, r3, r9
    1890:	444b      	addeq	r3, r9
    1892:	9303      	str	r3, [sp, #12]
    1894:	9700      	str	r7, [sp, #0]
    1896:	2300      	movs	r3, #0
    1898:	220d      	movs	r2, #13
    189a:	4619      	mov	r1, r3
    189c:	4628      	mov	r0, r5
    189e:	f7ff fab3 	bl	e08 <_Unwind_VRS_Set>
    18a2:	e7c3      	b.n	182c <__gnu_unwind_execute+0xe>
    18a4:	f000 03f0 	and.w	r3, r0, #240	; 0xf0
    18a8:	2b80      	cmp	r3, #128	; 0x80
    18aa:	d118      	bne.n	18de <__gnu_unwind_execute+0xc0>
    18ac:	0204      	lsls	r4, r0, #8
    18ae:	4630      	mov	r0, r6
    18b0:	f7ff ff90 	bl	17d4 <next_unwind_byte>
    18b4:	4304      	orrs	r4, r0
    18b6:	f5b4 4f00 	cmp.w	r4, #32768	; 0x8000
    18ba:	d101      	bne.n	18c0 <__gnu_unwind_execute+0xa2>
    18bc:	2009      	movs	r0, #9
    18be:	e7ce      	b.n	185e <__gnu_unwind_execute+0x40>
    18c0:	0124      	lsls	r4, r4, #4
    18c2:	2300      	movs	r3, #0
    18c4:	b2a2      	uxth	r2, r4
    18c6:	4619      	mov	r1, r3
    18c8:	4628      	mov	r0, r5
    18ca:	f7ff fc25 	bl	1118 <_Unwind_VRS_Pop>
    18ce:	2800      	cmp	r0, #0
    18d0:	d1f4      	bne.n	18bc <__gnu_unwind_execute+0x9e>
    18d2:	f414 4f00 	tst.w	r4, #32768	; 0x8000
    18d6:	bf18      	it	ne
    18d8:	f04f 0801 	movne.w	r8, #1
    18dc:	e7a6      	b.n	182c <__gnu_unwind_execute+0xe>
    18de:	2b90      	cmp	r3, #144	; 0x90
    18e0:	d10d      	bne.n	18fe <__gnu_unwind_execute+0xe0>
    18e2:	f000 030d 	and.w	r3, r0, #13
    18e6:	2b0d      	cmp	r3, #13
    18e8:	d0e8      	beq.n	18bc <__gnu_unwind_execute+0x9e>
    18ea:	af03      	add	r7, sp, #12
    18ec:	2300      	movs	r3, #0
    18ee:	f000 020f 	and.w	r2, r0, #15
    18f2:	9700      	str	r7, [sp, #0]
    18f4:	4619      	mov	r1, r3
    18f6:	4628      	mov	r0, r5
    18f8:	f7ff fa62 	bl	dc0 <_Unwind_VRS_Get>
    18fc:	e7ca      	b.n	1894 <__gnu_unwind_execute+0x76>
    18fe:	2ba0      	cmp	r3, #160	; 0xa0
    1900:	d113      	bne.n	192a <__gnu_unwind_execute+0x10c>
    1902:	43c3      	mvns	r3, r0
    1904:	f003 0307 	and.w	r3, r3, #7
    1908:	f44f 627f 	mov.w	r2, #4080	; 0xff0
    190c:	411a      	asrs	r2, r3
    190e:	0703      	lsls	r3, r0, #28
    1910:	f402 627f 	and.w	r2, r2, #4080	; 0xff0
    1914:	d501      	bpl.n	191a <__gnu_unwind_execute+0xfc>
    1916:	f442 4280 	orr.w	r2, r2, #16384	; 0x4000
    191a:	2300      	movs	r3, #0
    191c:	4619      	mov	r1, r3
    191e:	4628      	mov	r0, r5
    1920:	f7ff fbfa 	bl	1118 <_Unwind_VRS_Pop>
    1924:	2800      	cmp	r0, #0
    1926:	d081      	beq.n	182c <__gnu_unwind_execute+0xe>
    1928:	e7c8      	b.n	18bc <__gnu_unwind_execute+0x9e>
    192a:	2bb0      	cmp	r3, #176	; 0xb0
    192c:	d146      	bne.n	19bc <__gnu_unwind_execute+0x19e>
    192e:	28b1      	cmp	r0, #177	; 0xb1
    1930:	d108      	bne.n	1944 <__gnu_unwind_execute+0x126>
    1932:	4630      	mov	r0, r6
    1934:	f7ff ff4e 	bl	17d4 <next_unwind_byte>
    1938:	1e43      	subs	r3, r0, #1
    193a:	b2db      	uxtb	r3, r3
    193c:	2b0e      	cmp	r3, #14
    193e:	4602      	mov	r2, r0
    1940:	d9eb      	bls.n	191a <__gnu_unwind_execute+0xfc>
    1942:	e7bb      	b.n	18bc <__gnu_unwind_execute+0x9e>
    1944:	28b2      	cmp	r0, #178	; 0xb2
    1946:	d120      	bne.n	198a <__gnu_unwind_execute+0x16c>
    1948:	2300      	movs	r3, #0
    194a:	ac03      	add	r4, sp, #12
    194c:	220d      	movs	r2, #13
    194e:	4619      	mov	r1, r3
    1950:	9400      	str	r4, [sp, #0]
    1952:	4628      	mov	r0, r5
    1954:	f7ff fa34 	bl	dc0 <_Unwind_VRS_Get>
    1958:	4630      	mov	r0, r6
    195a:	f7ff ff3b 	bl	17d4 <next_unwind_byte>
    195e:	2702      	movs	r7, #2
    1960:	f000 017f 	and.w	r1, r0, #127	; 0x7f
    1964:	f010 0380 	ands.w	r3, r0, #128	; 0x80
    1968:	9a03      	ldr	r2, [sp, #12]
    196a:	fa01 f107 	lsl.w	r1, r1, r7
    196e:	d105      	bne.n	197c <__gnu_unwind_execute+0x15e>
    1970:	f502 7201 	add.w	r2, r2, #516	; 0x204
    1974:	440a      	add	r2, r1
    1976:	9203      	str	r2, [sp, #12]
    1978:	9400      	str	r4, [sp, #0]
    197a:	e78d      	b.n	1898 <__gnu_unwind_execute+0x7a>
    197c:	440a      	add	r2, r1
    197e:	4630      	mov	r0, r6
    1980:	9203      	str	r2, [sp, #12]
    1982:	3707      	adds	r7, #7
    1984:	f7ff ff26 	bl	17d4 <next_unwind_byte>
    1988:	e7ea      	b.n	1960 <__gnu_unwind_execute+0x142>
    198a:	28b3      	cmp	r0, #179	; 0xb3
    198c:	d10b      	bne.n	19a6 <__gnu_unwind_execute+0x188>
    198e:	4630      	mov	r0, r6
    1990:	f7ff ff20 	bl	17d4 <next_unwind_byte>
    1994:	0302      	lsls	r2, r0, #12
    1996:	f000 000f 	and.w	r0, r0, #15
    199a:	f402 2270 	and.w	r2, r2, #983040	; 0xf0000
    199e:	3001      	adds	r0, #1
    19a0:	2301      	movs	r3, #1
    19a2:	4302      	orrs	r2, r0
    19a4:	e7ba      	b.n	191c <__gnu_unwind_execute+0xfe>
    19a6:	f000 03fc 	and.w	r3, r0, #252	; 0xfc
    19aa:	2bb4      	cmp	r3, #180	; 0xb4
    19ac:	d086      	beq.n	18bc <__gnu_unwind_execute+0x9e>
    19ae:	f000 0207 	and.w	r2, r0, #7
    19b2:	3201      	adds	r2, #1
    19b4:	2301      	movs	r3, #1
    19b6:	f442 2200 	orr.w	r2, r2, #524288	; 0x80000
    19ba:	e7af      	b.n	191c <__gnu_unwind_execute+0xfe>
    19bc:	2bc0      	cmp	r3, #192	; 0xc0
    19be:	d144      	bne.n	1a4a <__gnu_unwind_execute+0x22c>
    19c0:	28c6      	cmp	r0, #198	; 0xc6
    19c2:	d10a      	bne.n	19da <__gnu_unwind_execute+0x1bc>
    19c4:	4630      	mov	r0, r6
    19c6:	f7ff ff05 	bl	17d4 <next_unwind_byte>
    19ca:	0302      	lsls	r2, r0, #12
    19cc:	f000 000f 	and.w	r0, r0, #15
    19d0:	f402 2270 	and.w	r2, r2, #983040	; 0xf0000
    19d4:	3001      	adds	r0, #1
    19d6:	2303      	movs	r3, #3
    19d8:	e7e3      	b.n	19a2 <__gnu_unwind_execute+0x184>
    19da:	28c7      	cmp	r0, #199	; 0xc7
    19dc:	d10b      	bne.n	19f6 <__gnu_unwind_execute+0x1d8>
    19de:	4630      	mov	r0, r6
    19e0:	f7ff fef8 	bl	17d4 <next_unwind_byte>
    19e4:	1e43      	subs	r3, r0, #1
    19e6:	b2db      	uxtb	r3, r3
    19e8:	2b0e      	cmp	r3, #14
    19ea:	4602      	mov	r2, r0
    19ec:	f63f af66 	bhi.w	18bc <__gnu_unwind_execute+0x9e>
    19f0:	2300      	movs	r3, #0
    19f2:	2104      	movs	r1, #4
    19f4:	e793      	b.n	191e <__gnu_unwind_execute+0x100>
    19f6:	f000 03f8 	and.w	r3, r0, #248	; 0xf8
    19fa:	2bc0      	cmp	r3, #192	; 0xc0
    19fc:	d106      	bne.n	1a0c <__gnu_unwind_execute+0x1ee>
    19fe:	f000 020f 	and.w	r2, r0, #15
    1a02:	3201      	adds	r2, #1
    1a04:	2303      	movs	r3, #3
    1a06:	f442 2220 	orr.w	r2, r2, #655360	; 0xa0000
    1a0a:	e787      	b.n	191c <__gnu_unwind_execute+0xfe>
    1a0c:	28c8      	cmp	r0, #200	; 0xc8
    1a0e:	d10d      	bne.n	1a2c <__gnu_unwind_execute+0x20e>
    1a10:	4630      	mov	r0, r6
    1a12:	f7ff fedf 	bl	17d4 <next_unwind_byte>
    1a16:	f000 02f0 	and.w	r2, r0, #240	; 0xf0
    1a1a:	f000 000f 	and.w	r0, r0, #15
    1a1e:	3210      	adds	r2, #16
    1a20:	3001      	adds	r0, #1
    1a22:	2305      	movs	r3, #5
    1a24:	ea40 3202 	orr.w	r2, r0, r2, lsl #12
    1a28:	2101      	movs	r1, #1
    1a2a:	e778      	b.n	191e <__gnu_unwind_execute+0x100>
    1a2c:	28c9      	cmp	r0, #201	; 0xc9
    1a2e:	f47f af45 	bne.w	18bc <__gnu_unwind_execute+0x9e>
    1a32:	4630      	mov	r0, r6
    1a34:	f7ff fece 	bl	17d4 <next_unwind_byte>
    1a38:	0302      	lsls	r2, r0, #12
    1a3a:	f000 000f 	and.w	r0, r0, #15
    1a3e:	f402 2270 	and.w	r2, r2, #983040	; 0xf0000
    1a42:	3001      	adds	r0, #1
    1a44:	2305      	movs	r3, #5
    1a46:	4302      	orrs	r2, r0
    1a48:	e7ee      	b.n	1a28 <__gnu_unwind_execute+0x20a>
    1a4a:	f000 03f8 	and.w	r3, r0, #248	; 0xf8
    1a4e:	2bd0      	cmp	r3, #208	; 0xd0
    1a50:	f47f af34 	bne.w	18bc <__gnu_unwind_execute+0x9e>
    1a54:	f000 0207 	and.w	r2, r0, #7
    1a58:	3201      	adds	r2, #1
    1a5a:	2305      	movs	r3, #5
    1a5c:	f442 2200 	orr.w	r2, r2, #524288	; 0x80000
    1a60:	e7e2      	b.n	1a28 <__gnu_unwind_execute+0x20a>

00001a62 <__gnu_unwind_frame>:
    1a62:	b51f      	push	{r0, r1, r2, r3, r4, lr}
    1a64:	4603      	mov	r3, r0
    1a66:	4608      	mov	r0, r1
    1a68:	6cda      	ldr	r2, [r3, #76]	; 0x4c
    1a6a:	6853      	ldr	r3, [r2, #4]
    1a6c:	3208      	adds	r2, #8
    1a6e:	0219      	lsls	r1, r3, #8
    1a70:	9101      	str	r1, [sp, #4]
    1a72:	9202      	str	r2, [sp, #8]
    1a74:	0e1b      	lsrs	r3, r3, #24
    1a76:	2203      	movs	r2, #3
    1a78:	a901      	add	r1, sp, #4
    1a7a:	f88d 200c 	strb.w	r2, [sp, #12]
    1a7e:	f88d 300d 	strb.w	r3, [sp, #13]
    1a82:	f7ff fecc 	bl	181e <__gnu_unwind_execute>
    1a86:	b005      	add	sp, #20
    1a88:	f85d fb04 	ldr.w	pc, [sp], #4

00001a8c <_Unwind_GetRegionStart>:
    1a8c:	b508      	push	{r3, lr}
    1a8e:	f7ff fec5 	bl	181c <unwind_UCB_from_context>
    1a92:	6c80      	ldr	r0, [r0, #72]	; 0x48
    1a94:	bd08      	pop	{r3, pc}

00001a96 <_Unwind_GetLanguageSpecificData>:
    1a96:	b508      	push	{r3, lr}
    1a98:	f7ff fec0 	bl	181c <unwind_UCB_from_context>
    1a9c:	6cc0      	ldr	r0, [r0, #76]	; 0x4c
    1a9e:	79c3      	ldrb	r3, [r0, #7]
    1aa0:	3302      	adds	r3, #2
    1aa2:	eb00 0083 	add.w	r0, r0, r3, lsl #2
    1aa6:	bd08      	pop	{r3, pc}

00001aa8 <strcmp>:
    1aa8:	f810 2b01 	ldrb.w	r2, [r0], #1
    1aac:	f811 3b01 	ldrb.w	r3, [r1], #1
    1ab0:	2a01      	cmp	r2, #1
    1ab2:	bf28      	it	cs
    1ab4:	429a      	cmpcs	r2, r3
    1ab6:	d0f7      	beq.n	1aa8 <strcmp>
    1ab8:	1ad0      	subs	r0, r2, r3
    1aba:	4770      	bx	lr

00001abc <strlen>:
    1abc:	4603      	mov	r3, r0
    1abe:	f813 2b01 	ldrb.w	r2, [r3], #1
    1ac2:	2a00      	cmp	r2, #0
    1ac4:	d1fb      	bne.n	1abe <strlen+0x2>
    1ac6:	1a18      	subs	r0, r3, r0
    1ac8:	3801      	subs	r0, #1
    1aca:	4770      	bx	lr

00001acc <cycles_to_us>:
    1acc:	b590      	push	{r4, r7, lr}
    1ace:	b083      	sub	sp, #12
    1ad0:	af00      	add	r7, sp, #0
    1ad2:	6078      	str	r0, [r7, #4]
    1ad4:	6878      	ldr	r0, [r7, #4]
    1ad6:	f7fe fe13 	bl	700 <__aeabi_ui2f>
    1ada:	4604      	mov	r4, r0
    1adc:	4b07      	ldr	r3, [pc, #28]	; (1afc <cycles_to_us+0x30>)
    1ade:	681b      	ldr	r3, [r3, #0]
    1ae0:	4618      	mov	r0, r3
    1ae2:	f7fe fe0d 	bl	700 <__aeabi_ui2f>
    1ae6:	4603      	mov	r3, r0
    1ae8:	4619      	mov	r1, r3
    1aea:	4620      	mov	r0, r4
    1aec:	f7fe ff14 	bl	918 <__aeabi_fdiv>
    1af0:	4603      	mov	r3, r0
    1af2:	4618      	mov	r0, r3
    1af4:	370c      	adds	r7, #12
    1af6:	46bd      	mov	sp, r7
    1af8:	bd90      	pop	{r4, r7, pc}
    1afa:	bf00      	nop
    1afc:	20000000 	.word	0x20000000

00001b00 <dwt_init>:
    1b00:	b480      	push	{r7}
    1b02:	af00      	add	r7, sp, #0
    1b04:	4b0a      	ldr	r3, [pc, #40]	; (1b30 <dwt_init+0x30>)
    1b06:	2240      	movs	r2, #64	; 0x40
    1b08:	601a      	str	r2, [r3, #0]
    1b0a:	4b0a      	ldr	r3, [pc, #40]	; (1b34 <dwt_init+0x34>)
    1b0c:	681b      	ldr	r3, [r3, #0]
    1b0e:	4a09      	ldr	r2, [pc, #36]	; (1b34 <dwt_init+0x34>)
    1b10:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
    1b14:	6013      	str	r3, [r2, #0]
    1b16:	4b08      	ldr	r3, [pc, #32]	; (1b38 <dwt_init+0x38>)
    1b18:	2200      	movs	r2, #0
    1b1a:	601a      	str	r2, [r3, #0]
    1b1c:	4b07      	ldr	r3, [pc, #28]	; (1b3c <dwt_init+0x3c>)
    1b1e:	681b      	ldr	r3, [r3, #0]
    1b20:	4a06      	ldr	r2, [pc, #24]	; (1b3c <dwt_init+0x3c>)
    1b22:	f043 0301 	orr.w	r3, r3, #1
    1b26:	6013      	str	r3, [r2, #0]
    1b28:	bf00      	nop
    1b2a:	46bd      	mov	sp, r7
    1b2c:	bc80      	pop	{r7}
    1b2e:	4770      	bx	lr
    1b30:	20000000 	.word	0x20000000
    1b34:	e000edfc 	.word	0xe000edfc
    1b38:	e0001004 	.word	0xe0001004
    1b3c:	e0001000 	.word	0xe0001000

00001b40 <dwt_get_counter>:
    1b40:	b480      	push	{r7}
    1b42:	af00      	add	r7, sp, #0
    1b44:	4b02      	ldr	r3, [pc, #8]	; (1b50 <dwt_get_counter+0x10>)
    1b46:	681b      	ldr	r3, [r3, #0]
    1b48:	4618      	mov	r0, r3
    1b4a:	46bd      	mov	sp, r7
    1b4c:	bc80      	pop	{r7}
    1b4e:	4770      	bx	lr
    1b50:	e0001004 	.word	0xe0001004

00001b54 <setup_profiler>:
    1b54:	b580      	push	{r7, lr}
    1b56:	af00      	add	r7, sp, #0
    1b58:	4b07      	ldr	r3, [pc, #28]	; (1b78 <setup_profiler+0x24>)
    1b5a:	2200      	movs	r2, #0
    1b5c:	f8c3 2090 	str.w	r2, [r3, #144]	; 0x90
    1b60:	f7ff ffce 	bl	1b00 <dwt_init>
    1b64:	4b05      	ldr	r3, [pc, #20]	; (1b7c <setup_profiler+0x28>)
    1b66:	681b      	ldr	r3, [r3, #0]
    1b68:	4a03      	ldr	r2, [pc, #12]	; (1b78 <setup_profiler+0x24>)
    1b6a:	6613      	str	r3, [r2, #96]	; 0x60
    1b6c:	4b04      	ldr	r3, [pc, #16]	; (1b80 <setup_profiler+0x2c>)
    1b6e:	681b      	ldr	r3, [r3, #0]
    1b70:	4a01      	ldr	r2, [pc, #4]	; (1b78 <setup_profiler+0x24>)
    1b72:	6653      	str	r3, [r2, #100]	; 0x64
    1b74:	bf00      	nop
    1b76:	bd80      	pop	{r7, pc}
    1b78:	2000079c 	.word	0x2000079c
    1b7c:	0000ce4c 	.word	0x0000ce4c
    1b80:	0000ce48 	.word	0x0000ce48

00001b84 <profile_add_event>:
    1b84:	b580      	push	{r7, lr}
    1b86:	b084      	sub	sp, #16
    1b88:	af00      	add	r7, sp, #0
    1b8a:	6078      	str	r0, [r7, #4]
    1b8c:	4b1b      	ldr	r3, [pc, #108]	; (1bfc <profile_add_event+0x78>)
    1b8e:	781b      	ldrb	r3, [r3, #0]
    1b90:	f083 0301 	eor.w	r3, r3, #1
    1b94:	b2db      	uxtb	r3, r3
    1b96:	2b00      	cmp	r3, #0
    1b98:	d001      	beq.n	1b9e <profile_add_event+0x1a>
    1b9a:	f7ff ffdb 	bl	1b54 <setup_profiler>
    1b9e:	4b18      	ldr	r3, [pc, #96]	; (1c00 <profile_add_event+0x7c>)
    1ba0:	f8d3 3090 	ldr.w	r3, [r3, #144]	; 0x90
    1ba4:	2b0b      	cmp	r3, #11
    1ba6:	dd03      	ble.n	1bb0 <profile_add_event+0x2c>
    1ba8:	4b15      	ldr	r3, [pc, #84]	; (1c00 <profile_add_event+0x7c>)
    1baa:	2200      	movs	r2, #0
    1bac:	f8c3 2090 	str.w	r2, [r3, #144]	; 0x90
    1bb0:	4b13      	ldr	r3, [pc, #76]	; (1c00 <profile_add_event+0x7c>)
    1bb2:	f8d3 3090 	ldr.w	r3, [r3, #144]	; 0x90
    1bb6:	60fb      	str	r3, [r7, #12]
    1bb8:	4911      	ldr	r1, [pc, #68]	; (1c00 <profile_add_event+0x7c>)
    1bba:	68fb      	ldr	r3, [r7, #12]
    1bbc:	3318      	adds	r3, #24
    1bbe:	687a      	ldr	r2, [r7, #4]
    1bc0:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
    1bc4:	4a0e      	ldr	r2, [pc, #56]	; (1c00 <profile_add_event+0x7c>)
    1bc6:	68fb      	ldr	r3, [r7, #12]
    1bc8:	330c      	adds	r3, #12
    1bca:	2100      	movs	r1, #0
    1bcc:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    1bd0:	4a0b      	ldr	r2, [pc, #44]	; (1c00 <profile_add_event+0x7c>)
    1bd2:	68fb      	ldr	r3, [r7, #12]
    1bd4:	330c      	adds	r3, #12
    1bd6:	f852 2023 	ldr.w	r2, [r2, r3, lsl #2]
    1bda:	4909      	ldr	r1, [pc, #36]	; (1c00 <profile_add_event+0x7c>)
    1bdc:	68fb      	ldr	r3, [r7, #12]
    1bde:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
    1be2:	4b07      	ldr	r3, [pc, #28]	; (1c00 <profile_add_event+0x7c>)
    1be4:	f8d3 3090 	ldr.w	r3, [r3, #144]	; 0x90
    1be8:	3301      	adds	r3, #1
    1bea:	4a05      	ldr	r2, [pc, #20]	; (1c00 <profile_add_event+0x7c>)
    1bec:	f8c2 3090 	str.w	r3, [r2, #144]	; 0x90
    1bf0:	68fb      	ldr	r3, [r7, #12]
    1bf2:	4618      	mov	r0, r3
    1bf4:	3710      	adds	r7, #16
    1bf6:	46bd      	mov	sp, r7
    1bf8:	bd80      	pop	{r7, pc}
    1bfa:	bf00      	nop
    1bfc:	20001870 	.word	0x20001870
    1c00:	2000079c 	.word	0x2000079c

00001c04 <profile_start>:
    1c04:	b580      	push	{r7, lr}
    1c06:	b082      	sub	sp, #8
    1c08:	af00      	add	r7, sp, #0
    1c0a:	6078      	str	r0, [r7, #4]
    1c0c:	4b0b      	ldr	r3, [pc, #44]	; (1c3c <profile_start+0x38>)
    1c0e:	781b      	ldrb	r3, [r3, #0]
    1c10:	f083 0301 	eor.w	r3, r3, #1
    1c14:	b2db      	uxtb	r3, r3
    1c16:	2b00      	cmp	r3, #0
    1c18:	d004      	beq.n	1c24 <profile_start+0x20>
    1c1a:	f7ff ff9b 	bl	1b54 <setup_profiler>
    1c1e:	4b07      	ldr	r3, [pc, #28]	; (1c3c <profile_start+0x38>)
    1c20:	2201      	movs	r2, #1
    1c22:	701a      	strb	r2, [r3, #0]
    1c24:	f7ff ff8c 	bl	1b40 <dwt_get_counter>
    1c28:	4602      	mov	r2, r0
    1c2a:	4905      	ldr	r1, [pc, #20]	; (1c40 <profile_start+0x3c>)
    1c2c:	687b      	ldr	r3, [r7, #4]
    1c2e:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
    1c32:	bf00      	nop
    1c34:	3708      	adds	r7, #8
    1c36:	46bd      	mov	sp, r7
    1c38:	bd80      	pop	{r7, pc}
    1c3a:	bf00      	nop
    1c3c:	20001870 	.word	0x20001870
    1c40:	2000079c 	.word	0x2000079c

00001c44 <profile_end>:
    1c44:	b580      	push	{r7, lr}
    1c46:	b082      	sub	sp, #8
    1c48:	af00      	add	r7, sp, #0
    1c4a:	6078      	str	r0, [r7, #4]
    1c4c:	f7ff ff78 	bl	1b40 <dwt_get_counter>
    1c50:	4602      	mov	r2, r0
    1c52:	4909      	ldr	r1, [pc, #36]	; (1c78 <profile_end+0x34>)
    1c54:	687b      	ldr	r3, [r7, #4]
    1c56:	330c      	adds	r3, #12
    1c58:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
    1c5c:	4a06      	ldr	r2, [pc, #24]	; (1c78 <profile_end+0x34>)
    1c5e:	687b      	ldr	r3, [r7, #4]
    1c60:	330c      	adds	r3, #12
    1c62:	f852 2023 	ldr.w	r2, [r2, r3, lsl #2]
    1c66:	4904      	ldr	r1, [pc, #16]	; (1c78 <profile_end+0x34>)
    1c68:	687b      	ldr	r3, [r7, #4]
    1c6a:	f851 3023 	ldr.w	r3, [r1, r3, lsl #2]
    1c6e:	1ad3      	subs	r3, r2, r3
    1c70:	4618      	mov	r0, r3
    1c72:	3708      	adds	r7, #8
    1c74:	46bd      	mov	sp, r7
    1c76:	bd80      	pop	{r7, pc}
    1c78:	2000079c 	.word	0x2000079c

00001c7c <profile_dump>:
    1c7c:	b580      	push	{r7, lr}
    1c7e:	b086      	sub	sp, #24
    1c80:	af02      	add	r7, sp, #8
    1c82:	6078      	str	r0, [r7, #4]
    1c84:	4a0f      	ldr	r2, [pc, #60]	; (1cc4 <profile_dump+0x48>)
    1c86:	687b      	ldr	r3, [r7, #4]
    1c88:	330c      	adds	r3, #12
    1c8a:	f852 2023 	ldr.w	r2, [r2, r3, lsl #2]
    1c8e:	490d      	ldr	r1, [pc, #52]	; (1cc4 <profile_dump+0x48>)
    1c90:	687b      	ldr	r3, [r7, #4]
    1c92:	f851 3023 	ldr.w	r3, [r1, r3, lsl #2]
    1c96:	1ad3      	subs	r3, r2, r3
    1c98:	60fb      	str	r3, [r7, #12]
    1c9a:	68f8      	ldr	r0, [r7, #12]
    1c9c:	f7ff ff16 	bl	1acc <cycles_to_us>
    1ca0:	60b8      	str	r0, [r7, #8]
    1ca2:	68b8      	ldr	r0, [r7, #8]
    1ca4:	f7fe fc1e 	bl	4e4 <__aeabi_f2d>
    1ca8:	4602      	mov	r2, r0
    1caa:	460b      	mov	r3, r1
    1cac:	e9cd 2300 	strd	r2, r3, [sp]
    1cb0:	68fa      	ldr	r2, [r7, #12]
    1cb2:	6879      	ldr	r1, [r7, #4]
    1cb4:	4804      	ldr	r0, [pc, #16]	; (1cc8 <profile_dump+0x4c>)
    1cb6:	f007 f82f 	bl	8d18 <iprintf>
    1cba:	bf00      	nop
    1cbc:	3710      	adds	r7, #16
    1cbe:	46bd      	mov	sp, r7
    1cc0:	bd80      	pop	{r7, pc}
    1cc2:	bf00      	nop
    1cc4:	2000079c 	.word	0x2000079c
    1cc8:	0000cb70 	.word	0x0000cb70

00001ccc <dummy_buggy_MQTT_packet_length_decode>:
    1ccc:	b580      	push	{r7, lr}
    1cce:	b084      	sub	sp, #16
    1cd0:	af00      	add	r7, sp, #0
    1cd2:	6078      	str	r0, [r7, #4]
    1cd4:	6039      	str	r1, [r7, #0]
    1cd6:	2300      	movs	r3, #0
    1cd8:	73fb      	strb	r3, [r7, #15]
    1cda:	2300      	movs	r3, #0
    1cdc:	73bb      	strb	r3, [r7, #14]
    1cde:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    1ce2:	60bb      	str	r3, [r7, #8]
    1ce4:	683b      	ldr	r3, [r7, #0]
    1ce6:	2200      	movs	r2, #0
    1ce8:	601a      	str	r2, [r3, #0]
    1cea:	7bbb      	ldrb	r3, [r7, #14]
    1cec:	2b04      	cmp	r3, #4
    1cee:	d901      	bls.n	1cf4 <dummy_buggy_MQTT_packet_length_decode+0x28>
    1cf0:	68bb      	ldr	r3, [r7, #8]
    1cf2:	e031      	b.n	1d58 <dummy_buggy_MQTT_packet_length_decode+0x8c>
    1cf4:	687b      	ldr	r3, [r7, #4]
    1cf6:	681a      	ldr	r2, [r3, #0]
    1cf8:	687b      	ldr	r3, [r7, #4]
    1cfa:	685b      	ldr	r3, [r3, #4]
    1cfc:	429a      	cmp	r2, r3
    1cfe:	d301      	bcc.n	1d04 <dummy_buggy_MQTT_packet_length_decode+0x38>
    1d00:	68bb      	ldr	r3, [r7, #8]
    1d02:	e029      	b.n	1d58 <dummy_buggy_MQTT_packet_length_decode+0x8c>
    1d04:	683b      	ldr	r3, [r7, #0]
    1d06:	681b      	ldr	r3, [r3, #0]
    1d08:	687a      	ldr	r2, [r7, #4]
    1d0a:	6812      	ldr	r2, [r2, #0]
    1d0c:	7812      	ldrb	r2, [r2, #0]
    1d0e:	f002 017f 	and.w	r1, r2, #127	; 0x7f
    1d12:	7bfa      	ldrb	r2, [r7, #15]
    1d14:	fa01 f202 	lsl.w	r2, r1, r2
    1d18:	441a      	add	r2, r3
    1d1a:	683b      	ldr	r3, [r7, #0]
    1d1c:	601a      	str	r2, [r3, #0]
    1d1e:	7bfb      	ldrb	r3, [r7, #15]
    1d20:	3307      	adds	r3, #7
    1d22:	73fb      	strb	r3, [r7, #15]
    1d24:	7bbb      	ldrb	r3, [r7, #14]
    1d26:	3301      	adds	r3, #1
    1d28:	73bb      	strb	r3, [r7, #14]
    1d2a:	687b      	ldr	r3, [r7, #4]
    1d2c:	681b      	ldr	r3, [r3, #0]
    1d2e:	1c59      	adds	r1, r3, #1
    1d30:	687a      	ldr	r2, [r7, #4]
    1d32:	6011      	str	r1, [r2, #0]
    1d34:	781b      	ldrb	r3, [r3, #0]
    1d36:	b25b      	sxtb	r3, r3
    1d38:	2b00      	cmp	r3, #0
    1d3a:	dbd6      	blt.n	1cea <dummy_buggy_MQTT_packet_length_decode+0x1e>
    1d3c:	f008 f916 	bl	9f6c <fixed_patch_point_hanlder>
    1d40:	4603      	mov	r3, r0
    1d42:	4a07      	ldr	r2, [pc, #28]	; (1d60 <dummy_buggy_MQTT_packet_length_decode+0x94>)
    1d44:	6013      	str	r3, [r2, #0]
    1d46:	4b06      	ldr	r3, [pc, #24]	; (1d60 <dummy_buggy_MQTT_packet_length_decode+0x94>)
    1d48:	681b      	ldr	r3, [r3, #0]
    1d4a:	f5b3 3f80 	cmp.w	r3, #65536	; 0x10000
    1d4e:	d002      	beq.n	1d56 <dummy_buggy_MQTT_packet_length_decode+0x8a>
    1d50:	4b03      	ldr	r3, [pc, #12]	; (1d60 <dummy_buggy_MQTT_packet_length_decode+0x94>)
    1d52:	681b      	ldr	r3, [r3, #0]
    1d54:	e000      	b.n	1d58 <dummy_buggy_MQTT_packet_length_decode+0x8c>
    1d56:	2300      	movs	r3, #0
    1d58:	4618      	mov	r0, r3
    1d5a:	3710      	adds	r7, #16
    1d5c:	46bd      	mov	sp, r7
    1d5e:	bd80      	pop	{r7, pc}
    1d60:	20000798 	.word	0x20000798

00001d64 <call_dummy_buggy_MQTT_function>:
    1d64:	b580      	push	{r7, lr}
    1d66:	b08a      	sub	sp, #40	; 0x28
    1d68:	af00      	add	r7, sp, #0
    1d6a:	2300      	movs	r3, #0
    1d6c:	627b      	str	r3, [r7, #36]	; 0x24
    1d6e:	e008      	b.n	1d82 <call_dummy_buggy_MQTT_function+0x1e>
    1d70:	f107 0210 	add.w	r2, r7, #16
    1d74:	6a7b      	ldr	r3, [r7, #36]	; 0x24
    1d76:	4413      	add	r3, r2
    1d78:	22ff      	movs	r2, #255	; 0xff
    1d7a:	701a      	strb	r2, [r3, #0]
    1d7c:	6a7b      	ldr	r3, [r7, #36]	; 0x24
    1d7e:	3301      	adds	r3, #1
    1d80:	627b      	str	r3, [r7, #36]	; 0x24
    1d82:	6a7b      	ldr	r3, [r7, #36]	; 0x24
    1d84:	2b03      	cmp	r3, #3
    1d86:	ddf3      	ble.n	1d70 <call_dummy_buggy_MQTT_function+0xc>
    1d88:	237f      	movs	r3, #127	; 0x7f
    1d8a:	753b      	strb	r3, [r7, #20]
    1d8c:	2305      	movs	r3, #5
    1d8e:	623b      	str	r3, [r7, #32]
    1d90:	e008      	b.n	1da4 <call_dummy_buggy_MQTT_function+0x40>
    1d92:	f107 0210 	add.w	r2, r7, #16
    1d96:	6a3b      	ldr	r3, [r7, #32]
    1d98:	4413      	add	r3, r2
    1d9a:	2200      	movs	r2, #0
    1d9c:	701a      	strb	r2, [r3, #0]
    1d9e:	6a3b      	ldr	r3, [r7, #32]
    1da0:	3301      	adds	r3, #1
    1da2:	623b      	str	r3, [r7, #32]
    1da4:	6a3b      	ldr	r3, [r7, #32]
    1da6:	2b09      	cmp	r3, #9
    1da8:	ddf3      	ble.n	1d92 <call_dummy_buggy_MQTT_function+0x2e>
    1daa:	f107 0310 	add.w	r3, r7, #16
    1dae:	60bb      	str	r3, [r7, #8]
    1db0:	f107 0310 	add.w	r3, r7, #16
    1db4:	3309      	adds	r3, #9
    1db6:	60fb      	str	r3, [r7, #12]
    1db8:	2300      	movs	r3, #0
    1dba:	607b      	str	r3, [r7, #4]
    1dbc:	4813      	ldr	r0, [pc, #76]	; (1e0c <call_dummy_buggy_MQTT_function+0xa8>)
    1dbe:	f7ff fee1 	bl	1b84 <profile_add_event>
    1dc2:	2000      	movs	r0, #0
    1dc4:	f7ff ff1e 	bl	1c04 <profile_start>
    1dc8:	1d3a      	adds	r2, r7, #4
    1dca:	f107 0308 	add.w	r3, r7, #8
    1dce:	4611      	mov	r1, r2
    1dd0:	4618      	mov	r0, r3
    1dd2:	f7ff ff7b 	bl	1ccc <dummy_buggy_MQTT_packet_length_decode>
    1dd6:	61f8      	str	r0, [r7, #28]
    1dd8:	2000      	movs	r0, #0
    1dda:	f7ff ff33 	bl	1c44 <profile_end>
    1dde:	2000      	movs	r0, #0
    1de0:	f7ff ff4c 	bl	1c7c <profile_dump>
    1de4:	687b      	ldr	r3, [r7, #4]
    1de6:	4619      	mov	r1, r3
    1de8:	4809      	ldr	r0, [pc, #36]	; (1e10 <call_dummy_buggy_MQTT_function+0xac>)
    1dea:	f006 ff95 	bl	8d18 <iprintf>
    1dee:	687b      	ldr	r3, [r7, #4]
    1df0:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    1df4:	d103      	bne.n	1dfe <call_dummy_buggy_MQTT_function+0x9a>
    1df6:	4807      	ldr	r0, [pc, #28]	; (1e14 <call_dummy_buggy_MQTT_function+0xb0>)
    1df8:	f006 ff8e 	bl	8d18 <iprintf>
    1dfc:	e002      	b.n	1e04 <call_dummy_buggy_MQTT_function+0xa0>
    1dfe:	4806      	ldr	r0, [pc, #24]	; (1e18 <call_dummy_buggy_MQTT_function+0xb4>)
    1e00:	f006 ff8a 	bl	8d18 <iprintf>
    1e04:	bf00      	nop
    1e06:	3728      	adds	r7, #40	; 0x28
    1e08:	46bd      	mov	sp, r7
    1e0a:	bd80      	pop	{r7, pc}
    1e0c:	0000cc60 	.word	0x0000cc60
    1e10:	0000cc64 	.word	0x0000cc64
    1e14:	0000cc88 	.word	0x0000cc88
    1e18:	0000cca0 	.word	0x0000cca0

00001e1c <main>:
    1e1c:	b580      	push	{r7, lr}
    1e1e:	b08a      	sub	sp, #40	; 0x28
    1e20:	af00      	add	r7, sp, #0
    1e22:	f7ff ff9f 	bl	1d64 <call_dummy_buggy_MQTT_function>
    1e26:	480d      	ldr	r0, [pc, #52]	; (1e5c <main+0x40>)
    1e28:	f006 ff76 	bl	8d18 <iprintf>
    1e2c:	480c      	ldr	r0, [pc, #48]	; (1e60 <main+0x44>)
    1e2e:	f7ff fea9 	bl	1b84 <profile_add_event>
    1e32:	2001      	movs	r0, #1
    1e34:	f7ff fee6 	bl	1c04 <profile_start>
    1e38:	2300      	movs	r3, #0
    1e3a:	603b      	str	r3, [r7, #0]
    1e3c:	463b      	mov	r3, r7
    1e3e:	4618      	mov	r0, r3
    1e40:	f7fe f9ae 	bl	1a0 <filter>
    1e44:	e9c7 0108 	strd	r0, r1, [r7, #32]
    1e48:	2001      	movs	r0, #1
    1e4a:	f7ff fefb 	bl	1c44 <profile_end>
    1e4e:	2001      	movs	r0, #1
    1e50:	f7ff ff14 	bl	1c7c <profile_dump>
    1e54:	bf00      	nop
    1e56:	3728      	adds	r7, #40	; 0x28
    1e58:	46bd      	mov	sp, r7
    1e5a:	bd80      	pop	{r7, pc}
    1e5c:	0000ccd4 	.word	0x0000ccd4
    1e60:	0000cc60 	.word	0x0000cc60

00001e64 <getopt>:
    1e64:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    1e68:	4607      	mov	r7, r0
    1e6a:	460e      	mov	r6, r1
    1e6c:	4615      	mov	r5, r2
    1e6e:	f000 f88f 	bl	1f90 <getopt_state_get>
    1e72:	68c3      	ldr	r3, [r0, #12]
    1e74:	4604      	mov	r4, r0
    1e76:	b91b      	cbnz	r3, 1e80 <getopt+0x1c>
    1e78:	6943      	ldr	r3, [r0, #20]
    1e7a:	781a      	ldrb	r2, [r3, #0]
    1e7c:	2a00      	cmp	r2, #0
    1e7e:	d140      	bne.n	1f02 <getopt+0x9e>
    1e80:	2300      	movs	r3, #0
    1e82:	60e3      	str	r3, [r4, #12]
    1e84:	6863      	ldr	r3, [r4, #4]
    1e86:	42bb      	cmp	r3, r7
    1e88:	f856 2023 	ldr.w	r2, [r6, r3, lsl #2]
    1e8c:	db08      	blt.n	1ea0 <getopt+0x3c>
    1e8e:	4b32      	ldr	r3, [pc, #200]	; (1f58 <getopt+0xf4>)
    1e90:	6163      	str	r3, [r4, #20]
    1e92:	4620      	mov	r0, r4
    1e94:	f000 f862 	bl	1f5c <z_getopt_global_state_update>
    1e98:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    1e9c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    1ea0:	1c51      	adds	r1, r2, #1
    1ea2:	6161      	str	r1, [r4, #20]
    1ea4:	f892 8000 	ldrb.w	r8, [r2]
    1ea8:	f1b8 0f2d 	cmp.w	r8, #45	; 0x2d
    1eac:	d1ef      	bne.n	1e8e <getopt+0x2a>
    1eae:	1c91      	adds	r1, r2, #2
    1eb0:	6161      	str	r1, [r4, #20]
    1eb2:	7851      	ldrb	r1, [r2, #1]
    1eb4:	60a1      	str	r1, [r4, #8]
    1eb6:	292d      	cmp	r1, #45	; 0x2d
    1eb8:	d104      	bne.n	1ec4 <getopt+0x60>
    1eba:	7892      	ldrb	r2, [r2, #2]
    1ebc:	b96a      	cbnz	r2, 1eda <getopt+0x76>
    1ebe:	3301      	adds	r3, #1
    1ec0:	6063      	str	r3, [r4, #4]
    1ec2:	e7e4      	b.n	1e8e <getopt+0x2a>
    1ec4:	b949      	cbnz	r1, 1eda <getopt+0x76>
    1ec6:	4b24      	ldr	r3, [pc, #144]	; (1f58 <getopt+0xf4>)
    1ec8:	6163      	str	r3, [r4, #20]
    1eca:	4641      	mov	r1, r8
    1ecc:	4628      	mov	r0, r5
    1ece:	f00a f988 	bl	c1e2 <strchr>
    1ed2:	2800      	cmp	r0, #0
    1ed4:	d0dd      	beq.n	1e92 <getopt+0x2e>
    1ed6:	f8c4 8008 	str.w	r8, [r4, #8]
    1eda:	68a1      	ldr	r1, [r4, #8]
    1edc:	4628      	mov	r0, r5
    1ede:	f00a f980 	bl	c1e2 <strchr>
    1ee2:	68a3      	ldr	r3, [r4, #8]
    1ee4:	2b3a      	cmp	r3, #58	; 0x3a
    1ee6:	6963      	ldr	r3, [r4, #20]
    1ee8:	d001      	beq.n	1eee <getopt+0x8a>
    1eea:	461a      	mov	r2, r3
    1eec:	b970      	cbnz	r0, 1f0c <getopt+0xa8>
    1eee:	781b      	ldrb	r3, [r3, #0]
    1ef0:	b913      	cbnz	r3, 1ef8 <getopt+0x94>
    1ef2:	6863      	ldr	r3, [r4, #4]
    1ef4:	3301      	adds	r3, #1
    1ef6:	6063      	str	r3, [r4, #4]
    1ef8:	4620      	mov	r0, r4
    1efa:	f000 f82f 	bl	1f5c <z_getopt_global_state_update>
    1efe:	203f      	movs	r0, #63	; 0x3f
    1f00:	e7cc      	b.n	1e9c <getopt+0x38>
    1f02:	1c5a      	adds	r2, r3, #1
    1f04:	6142      	str	r2, [r0, #20]
    1f06:	781b      	ldrb	r3, [r3, #0]
    1f08:	6083      	str	r3, [r0, #8]
    1f0a:	e7e6      	b.n	1eda <getopt+0x76>
    1f0c:	7841      	ldrb	r1, [r0, #1]
    1f0e:	293a      	cmp	r1, #58	; 0x3a
    1f10:	d00b      	beq.n	1f2a <getopt+0xc6>
    1f12:	2200      	movs	r2, #0
    1f14:	6122      	str	r2, [r4, #16]
    1f16:	781b      	ldrb	r3, [r3, #0]
    1f18:	b913      	cbnz	r3, 1f20 <getopt+0xbc>
    1f1a:	6863      	ldr	r3, [r4, #4]
    1f1c:	3301      	adds	r3, #1
    1f1e:	6063      	str	r3, [r4, #4]
    1f20:	4620      	mov	r0, r4
    1f22:	f000 f81b 	bl	1f5c <z_getopt_global_state_update>
    1f26:	68a0      	ldr	r0, [r4, #8]
    1f28:	e7b8      	b.n	1e9c <getopt+0x38>
    1f2a:	7810      	ldrb	r0, [r2, #0]
    1f2c:	6863      	ldr	r3, [r4, #4]
    1f2e:	490a      	ldr	r1, [pc, #40]	; (1f58 <getopt+0xf4>)
    1f30:	b928      	cbnz	r0, 1f3e <getopt+0xda>
    1f32:	3301      	adds	r3, #1
    1f34:	429f      	cmp	r7, r3
    1f36:	6063      	str	r3, [r4, #4]
    1f38:	dd04      	ble.n	1f44 <getopt+0xe0>
    1f3a:	f856 2023 	ldr.w	r2, [r6, r3, lsl #2]
    1f3e:	e9c4 2104 	strd	r2, r1, [r4, #16]
    1f42:	e7ea      	b.n	1f1a <getopt+0xb6>
    1f44:	6161      	str	r1, [r4, #20]
    1f46:	782d      	ldrb	r5, [r5, #0]
    1f48:	2d3a      	cmp	r5, #58	; 0x3a
    1f4a:	4620      	mov	r0, r4
    1f4c:	d1d5      	bne.n	1efa <getopt+0x96>
    1f4e:	f000 f805 	bl	1f5c <z_getopt_global_state_update>
    1f52:	4628      	mov	r0, r5
    1f54:	e7a2      	b.n	1e9c <getopt+0x38>
    1f56:	bf00      	nop
    1f58:	0000d6db 	.word	0x0000d6db

00001f5c <z_getopt_global_state_update>:
    1f5c:	4b07      	ldr	r3, [pc, #28]	; (1f7c <z_getopt_global_state_update+0x20>)
    1f5e:	6802      	ldr	r2, [r0, #0]
    1f60:	601a      	str	r2, [r3, #0]
    1f62:	4b07      	ldr	r3, [pc, #28]	; (1f80 <z_getopt_global_state_update+0x24>)
    1f64:	6842      	ldr	r2, [r0, #4]
    1f66:	601a      	str	r2, [r3, #0]
    1f68:	4b06      	ldr	r3, [pc, #24]	; (1f84 <z_getopt_global_state_update+0x28>)
    1f6a:	6882      	ldr	r2, [r0, #8]
    1f6c:	601a      	str	r2, [r3, #0]
    1f6e:	4b06      	ldr	r3, [pc, #24]	; (1f88 <z_getopt_global_state_update+0x2c>)
    1f70:	68c2      	ldr	r2, [r0, #12]
    1f72:	601a      	str	r2, [r3, #0]
    1f74:	4b05      	ldr	r3, [pc, #20]	; (1f8c <z_getopt_global_state_update+0x30>)
    1f76:	6902      	ldr	r2, [r0, #16]
    1f78:	601a      	str	r2, [r3, #0]
    1f7a:	4770      	bx	lr
    1f7c:	20000020 	.word	0x20000020
    1f80:	2000001c 	.word	0x2000001c
    1f84:	20000838 	.word	0x20000838
    1f88:	20000834 	.word	0x20000834
    1f8c:	20000830 	.word	0x20000830

00001f90 <getopt_state_get>:
    1f90:	4800      	ldr	r0, [pc, #0]	; (1f94 <getopt_state_get+0x4>)
    1f92:	4770      	bx	lr
    1f94:	20000004 	.word	0x20000004

00001f98 <char_out>:
    1f98:	4b01      	ldr	r3, [pc, #4]	; (1fa0 <char_out+0x8>)
    1f9a:	681b      	ldr	r3, [r3, #0]
    1f9c:	4718      	bx	r3
    1f9e:	bf00      	nop
    1fa0:	20000024 	.word	0x20000024

00001fa4 <__printk_hook_install>:
    1fa4:	4b01      	ldr	r3, [pc, #4]	; (1fac <__printk_hook_install+0x8>)
    1fa6:	6018      	str	r0, [r3, #0]
    1fa8:	4770      	bx	lr
    1faa:	bf00      	nop
    1fac:	20000024 	.word	0x20000024

00001fb0 <vprintk>:
    1fb0:	b507      	push	{r0, r1, r2, lr}
    1fb2:	460b      	mov	r3, r1
    1fb4:	2100      	movs	r1, #0
    1fb6:	4602      	mov	r2, r0
    1fb8:	9100      	str	r1, [sp, #0]
    1fba:	4803      	ldr	r0, [pc, #12]	; (1fc8 <vprintk+0x18>)
    1fbc:	f000 f976 	bl	22ac <z_cbvprintf_impl>
    1fc0:	b003      	add	sp, #12
    1fc2:	f85d fb04 	ldr.w	pc, [sp], #4
    1fc6:	bf00      	nop
    1fc8:	00001f99 	.word	0x00001f99

00001fcc <process_event>:
    1fcc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    1fd0:	8b05      	ldrh	r5, [r0, #24]
    1fd2:	4604      	mov	r4, r0
    1fd4:	0728      	lsls	r0, r5, #28
    1fd6:	4690      	mov	r8, r2
    1fd8:	d411      	bmi.n	1ffe <process_event+0x32>
    1fda:	2902      	cmp	r1, #2
    1fdc:	f005 0507 	and.w	r5, r5, #7
    1fe0:	f040 80cd 	bne.w	217e <process_event+0x1b2>
    1fe4:	4620      	mov	r0, r4
    1fe6:	f008 f84b 	bl	a080 <process_recheck>
    1fea:	b178      	cbz	r0, 200c <process_event+0x40>
    1fec:	3801      	subs	r0, #1
    1fee:	8b21      	ldrh	r1, [r4, #24]
    1ff0:	2804      	cmp	r0, #4
    1ff2:	d811      	bhi.n	2018 <process_event+0x4c>
    1ff4:	e8df f000 	tbb	[pc, r0]
    1ff8:	856d10c3 	.word	0x856d10c3
    1ffc:	95          	.byte	0x95
    1ffd:	00          	.byte	0x00
    1ffe:	2901      	cmp	r1, #1
    2000:	bf0c      	ite	eq
    2002:	f045 0510 	orreq.w	r5, r5, #16
    2006:	f045 0520 	orrne.w	r5, r5, #32
    200a:	8325      	strh	r5, [r4, #24]
    200c:	f388 8811 	msr	BASEPRI, r8
    2010:	f3bf 8f6f 	isb	sy
    2014:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2018:	f001 0a07 	and.w	sl, r1, #7
    201c:	45aa      	cmp	sl, r5
    201e:	f000 80a6 	beq.w	216e <process_event+0x1a2>
    2022:	2700      	movs	r7, #0
    2024:	46b9      	mov	r9, r7
    2026:	463e      	mov	r6, r7
    2028:	68a3      	ldr	r3, [r4, #8]
    202a:	2b00      	cmp	r3, #0
    202c:	f000 80bd 	beq.w	21aa <process_event+0x1de>
    2030:	f041 0108 	orr.w	r1, r1, #8
    2034:	8321      	strh	r1, [r4, #24]
    2036:	f388 8811 	msr	BASEPRI, r8
    203a:	f3bf 8f6f 	isb	sy
    203e:	68a1      	ldr	r1, [r4, #8]
    2040:	2900      	cmp	r1, #0
    2042:	f000 80bb 	beq.w	21bc <process_event+0x1f0>
    2046:	680d      	ldr	r5, [r1, #0]
    2048:	2900      	cmp	r1, #0
    204a:	f000 80b7 	beq.w	21bc <process_event+0x1f0>
    204e:	f8d1 8004 	ldr.w	r8, [r1, #4]
    2052:	4633      	mov	r3, r6
    2054:	4652      	mov	r2, sl
    2056:	4620      	mov	r0, r4
    2058:	47c0      	blx	r8
    205a:	2d00      	cmp	r5, #0
    205c:	d076      	beq.n	214c <process_event+0x180>
    205e:	682b      	ldr	r3, [r5, #0]
    2060:	4629      	mov	r1, r5
    2062:	461d      	mov	r5, r3
    2064:	e7f0      	b.n	2048 <process_event+0x7c>
    2066:	f001 0307 	and.w	r3, r1, #7
    206a:	1f5a      	subs	r2, r3, #5
    206c:	2a01      	cmp	r2, #1
    206e:	d81b      	bhi.n	20a8 <process_event+0xdc>
    2070:	2200      	movs	r2, #0
    2072:	f021 0107 	bic.w	r1, r1, #7
    2076:	2b06      	cmp	r3, #6
    2078:	6827      	ldr	r7, [r4, #0]
    207a:	b289      	uxth	r1, r1
    207c:	e9c4 2200 	strd	r2, r2, [r4]
    2080:	d109      	bne.n	2096 <process_event+0xca>
    2082:	463b      	mov	r3, r7
    2084:	e003      	b.n	208e <process_event+0xc2>
    2086:	8b62      	ldrh	r2, [r4, #26]
    2088:	3201      	adds	r2, #1
    208a:	8362      	strh	r2, [r4, #26]
    208c:	681b      	ldr	r3, [r3, #0]
    208e:	2b00      	cmp	r3, #0
    2090:	d1f9      	bne.n	2086 <process_event+0xba>
    2092:	f041 0102 	orr.w	r1, r1, #2
    2096:	8321      	strh	r1, [r4, #24]
    2098:	4620      	mov	r0, r4
    209a:	f007 fff1 	bl	a080 <process_recheck>
    209e:	2800      	cmp	r0, #0
    20a0:	d07b      	beq.n	219a <process_event+0x1ce>
    20a2:	f041 0120 	orr.w	r1, r1, #32
    20a6:	e077      	b.n	2198 <process_event+0x1cc>
    20a8:	2b04      	cmp	r3, #4
    20aa:	d10a      	bne.n	20c2 <process_event+0xf6>
    20ac:	f021 0107 	bic.w	r1, r1, #7
    20b0:	b289      	uxth	r1, r1
    20b2:	8321      	strh	r1, [r4, #24]
    20b4:	4620      	mov	r0, r4
    20b6:	f007 ffe3 	bl	a080 <process_recheck>
    20ba:	b110      	cbz	r0, 20c2 <process_event+0xf6>
    20bc:	f041 0120 	orr.w	r1, r1, #32
    20c0:	8321      	strh	r1, [r4, #24]
    20c2:	8b21      	ldrh	r1, [r4, #24]
    20c4:	f001 0a07 	and.w	sl, r1, #7
    20c8:	45aa      	cmp	sl, r5
    20ca:	d050      	beq.n	216e <process_event+0x1a2>
    20cc:	2700      	movs	r7, #0
    20ce:	46b9      	mov	r9, r7
    20d0:	e7aa      	b.n	2028 <process_event+0x5c>
    20d2:	6923      	ldr	r3, [r4, #16]
    20d4:	f021 0107 	bic.w	r1, r1, #7
    20d8:	f041 0106 	orr.w	r1, r1, #6
    20dc:	2d06      	cmp	r5, #6
    20de:	f8d3 9000 	ldr.w	r9, [r3]
    20e2:	8321      	strh	r1, [r4, #24]
    20e4:	d12d      	bne.n	2142 <process_event+0x176>
    20e6:	f1b9 0f00 	cmp.w	r9, #0
    20ea:	d040      	beq.n	216e <process_event+0x1a2>
    20ec:	f041 0108 	orr.w	r1, r1, #8
    20f0:	8321      	strh	r1, [r4, #24]
    20f2:	f388 8811 	msr	BASEPRI, r8
    20f6:	f3bf 8f6f 	isb	sy
    20fa:	493a      	ldr	r1, [pc, #232]	; (21e4 <process_event+0x218>)
    20fc:	4620      	mov	r0, r4
    20fe:	47c8      	blx	r9
    2100:	e029      	b.n	2156 <process_event+0x18a>
    2102:	f021 0107 	bic.w	r1, r1, #7
    2106:	6923      	ldr	r3, [r4, #16]
    2108:	f041 0104 	orr.w	r1, r1, #4
    210c:	b289      	uxth	r1, r1
    210e:	2d04      	cmp	r5, #4
    2110:	f8d3 9004 	ldr.w	r9, [r3, #4]
    2114:	8321      	strh	r1, [r4, #24]
    2116:	d0e6      	beq.n	20e6 <process_event+0x11a>
    2118:	2700      	movs	r7, #0
    211a:	463e      	mov	r6, r7
    211c:	f04f 0a04 	mov.w	sl, #4
    2120:	e782      	b.n	2028 <process_event+0x5c>
    2122:	f021 0107 	bic.w	r1, r1, #7
    2126:	6923      	ldr	r3, [r4, #16]
    2128:	f041 0105 	orr.w	r1, r1, #5
    212c:	b289      	uxth	r1, r1
    212e:	2d05      	cmp	r5, #5
    2130:	f8d3 9008 	ldr.w	r9, [r3, #8]
    2134:	8321      	strh	r1, [r4, #24]
    2136:	d0d6      	beq.n	20e6 <process_event+0x11a>
    2138:	2700      	movs	r7, #0
    213a:	463e      	mov	r6, r7
    213c:	f04f 0a05 	mov.w	sl, #5
    2140:	e772      	b.n	2028 <process_event+0x5c>
    2142:	2700      	movs	r7, #0
    2144:	463e      	mov	r6, r7
    2146:	f04f 0a06 	mov.w	sl, #6
    214a:	e76d      	b.n	2028 <process_event+0x5c>
    214c:	462b      	mov	r3, r5
    214e:	e787      	b.n	2060 <process_event+0x94>
    2150:	f1b9 0f00 	cmp.w	r9, #0
    2154:	d1d1      	bne.n	20fa <process_event+0x12e>
    2156:	f04f 0320 	mov.w	r3, #32
    215a:	f3ef 8811 	mrs	r8, BASEPRI
    215e:	f383 8812 	msr	BASEPRI_MAX, r3
    2162:	f3bf 8f6f 	isb	sy
    2166:	8b23      	ldrh	r3, [r4, #24]
    2168:	f023 0308 	bic.w	r3, r3, #8
    216c:	8323      	strh	r3, [r4, #24]
    216e:	8b25      	ldrh	r5, [r4, #24]
    2170:	06ea      	lsls	r2, r5, #27
    2172:	d52e      	bpl.n	21d2 <process_event+0x206>
    2174:	f025 0310 	bic.w	r3, r5, #16
    2178:	8323      	strh	r3, [r4, #24]
    217a:	f005 0507 	and.w	r5, r5, #7
    217e:	6966      	ldr	r6, [r4, #20]
    2180:	8b21      	ldrh	r1, [r4, #24]
    2182:	2e00      	cmp	r6, #0
    2184:	f6bf af6f 	bge.w	2066 <process_event+0x9a>
    2188:	2300      	movs	r3, #0
    218a:	6827      	ldr	r7, [r4, #0]
    218c:	e9c4 3300 	strd	r3, r3, [r4]
    2190:	f021 0107 	bic.w	r1, r1, #7
    2194:	f041 0101 	orr.w	r1, r1, #1
    2198:	8321      	strh	r1, [r4, #24]
    219a:	8b21      	ldrh	r1, [r4, #24]
    219c:	f001 0a07 	and.w	sl, r1, #7
    21a0:	45aa      	cmp	sl, r5
    21a2:	f04f 0900 	mov.w	r9, #0
    21a6:	f47f af3f 	bne.w	2028 <process_event+0x5c>
    21aa:	2f00      	cmp	r7, #0
    21ac:	d09b      	beq.n	20e6 <process_event+0x11a>
    21ae:	f041 0108 	orr.w	r1, r1, #8
    21b2:	8321      	strh	r1, [r4, #24]
    21b4:	f388 8811 	msr	BASEPRI, r8
    21b8:	f3bf 8f6f 	isb	sy
    21bc:	2f00      	cmp	r7, #0
    21be:	d0c7      	beq.n	2150 <process_event+0x184>
    21c0:	683d      	ldr	r5, [r7, #0]
    21c2:	4639      	mov	r1, r7
    21c4:	4633      	mov	r3, r6
    21c6:	4652      	mov	r2, sl
    21c8:	4620      	mov	r0, r4
    21ca:	f007 ff85 	bl	a0d8 <notify_one>
    21ce:	462f      	mov	r7, r5
    21d0:	e7f4      	b.n	21bc <process_event+0x1f0>
    21d2:	06ab      	lsls	r3, r5, #26
    21d4:	f57f af1a 	bpl.w	200c <process_event+0x40>
    21d8:	f025 0320 	bic.w	r3, r5, #32
    21dc:	8323      	strh	r3, [r4, #24]
    21de:	f005 0507 	and.w	r5, r5, #7
    21e2:	e6ff      	b.n	1fe4 <process_event+0x18>
    21e4:	0000a105 	.word	0x0000a105

000021e8 <extract_decimal>:
    21e8:	b5f0      	push	{r4, r5, r6, r7, lr}
    21ea:	4e09      	ldr	r6, [pc, #36]	; (2210 <extract_decimal+0x28>)
    21ec:	6801      	ldr	r1, [r0, #0]
    21ee:	4602      	mov	r2, r0
    21f0:	270a      	movs	r7, #10
    21f2:	2000      	movs	r0, #0
    21f4:	460b      	mov	r3, r1
    21f6:	3101      	adds	r1, #1
    21f8:	781c      	ldrb	r4, [r3, #0]
    21fa:	5d35      	ldrb	r5, [r6, r4]
    21fc:	076d      	lsls	r5, r5, #29
    21fe:	d401      	bmi.n	2204 <extract_decimal+0x1c>
    2200:	6013      	str	r3, [r2, #0]
    2202:	bdf0      	pop	{r4, r5, r6, r7, pc}
    2204:	fb07 4300 	mla	r3, r7, r0, r4
    2208:	f1a3 0030 	sub.w	r0, r3, #48	; 0x30
    220c:	e7f2      	b.n	21f4 <extract_decimal+0xc>
    220e:	bf00      	nop
    2210:	0000e695 	.word	0x0000e695

00002214 <encode_uint>:
    2214:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2218:	4615      	mov	r5, r2
    221a:	469a      	mov	sl, r3
    221c:	78d3      	ldrb	r3, [r2, #3]
    221e:	4a22      	ldr	r2, [pc, #136]	; (22a8 <encode_uint+0x94>)
    2220:	f812 b003 	ldrb.w	fp, [r2, r3]
    2224:	2b6f      	cmp	r3, #111	; 0x6f
    2226:	4680      	mov	r8, r0
    2228:	460f      	mov	r7, r1
    222a:	f00b 0b03 	and.w	fp, fp, #3
    222e:	d029      	beq.n	2284 <encode_uint+0x70>
    2230:	d824      	bhi.n	227c <encode_uint+0x68>
    2232:	2b58      	cmp	r3, #88	; 0x58
    2234:	bf0c      	ite	eq
    2236:	2610      	moveq	r6, #16
    2238:	260a      	movne	r6, #10
    223a:	f8dd 9028 	ldr.w	r9, [sp, #40]	; 0x28
    223e:	4632      	mov	r2, r6
    2240:	2300      	movs	r3, #0
    2242:	4640      	mov	r0, r8
    2244:	4639      	mov	r1, r7
    2246:	f7fe fc03 	bl	a50 <__aeabi_uldivmod>
    224a:	2a09      	cmp	r2, #9
    224c:	b2d4      	uxtb	r4, r2
    224e:	d81e      	bhi.n	228e <encode_uint+0x7a>
    2250:	3430      	adds	r4, #48	; 0x30
    2252:	45b0      	cmp	r8, r6
    2254:	b2e4      	uxtb	r4, r4
    2256:	f177 0700 	sbcs.w	r7, r7, #0
    225a:	f809 4d01 	strb.w	r4, [r9, #-1]!
    225e:	d301      	bcc.n	2264 <encode_uint+0x50>
    2260:	45d1      	cmp	r9, sl
    2262:	d811      	bhi.n	2288 <encode_uint+0x74>
    2264:	782b      	ldrb	r3, [r5, #0]
    2266:	069b      	lsls	r3, r3, #26
    2268:	d505      	bpl.n	2276 <encode_uint+0x62>
    226a:	2e08      	cmp	r6, #8
    226c:	d115      	bne.n	229a <encode_uint+0x86>
    226e:	78ab      	ldrb	r3, [r5, #2]
    2270:	f043 0308 	orr.w	r3, r3, #8
    2274:	70ab      	strb	r3, [r5, #2]
    2276:	4648      	mov	r0, r9
    2278:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    227c:	f003 03f7 	and.w	r3, r3, #247	; 0xf7
    2280:	2b70      	cmp	r3, #112	; 0x70
    2282:	e7d7      	b.n	2234 <encode_uint+0x20>
    2284:	2608      	movs	r6, #8
    2286:	e7d8      	b.n	223a <encode_uint+0x26>
    2288:	4680      	mov	r8, r0
    228a:	460f      	mov	r7, r1
    228c:	e7d7      	b.n	223e <encode_uint+0x2a>
    228e:	f1bb 0f01 	cmp.w	fp, #1
    2292:	bf0c      	ite	eq
    2294:	3437      	addeq	r4, #55	; 0x37
    2296:	3457      	addne	r4, #87	; 0x57
    2298:	e7db      	b.n	2252 <encode_uint+0x3e>
    229a:	2e10      	cmp	r6, #16
    229c:	d1eb      	bne.n	2276 <encode_uint+0x62>
    229e:	78ab      	ldrb	r3, [r5, #2]
    22a0:	f043 0310 	orr.w	r3, r3, #16
    22a4:	e7e6      	b.n	2274 <encode_uint+0x60>
    22a6:	bf00      	nop
    22a8:	0000e695 	.word	0x0000e695

000022ac <z_cbvprintf_impl>:
    22ac:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    22b0:	b097      	sub	sp, #92	; 0x5c
    22b2:	4682      	mov	sl, r0
    22b4:	9103      	str	r1, [sp, #12]
    22b6:	4617      	mov	r7, r2
    22b8:	461c      	mov	r4, r3
    22ba:	2500      	movs	r5, #0
    22bc:	7838      	ldrb	r0, [r7, #0]
    22be:	b908      	cbnz	r0, 22c4 <z_cbvprintf_impl+0x18>
    22c0:	4628      	mov	r0, r5
    22c2:	e34a      	b.n	295a <z_cbvprintf_impl+0x6ae>
    22c4:	1c7b      	adds	r3, r7, #1
    22c6:	2825      	cmp	r0, #37	; 0x25
    22c8:	9304      	str	r3, [sp, #16]
    22ca:	d006      	beq.n	22da <z_cbvprintf_impl+0x2e>
    22cc:	9903      	ldr	r1, [sp, #12]
    22ce:	47d0      	blx	sl
    22d0:	2800      	cmp	r0, #0
    22d2:	f2c0 8342 	blt.w	295a <z_cbvprintf_impl+0x6ae>
    22d6:	3501      	adds	r5, #1
    22d8:	e1f0      	b.n	26bc <z_cbvprintf_impl+0x410>
    22da:	2218      	movs	r2, #24
    22dc:	2100      	movs	r1, #0
    22de:	a810      	add	r0, sp, #64	; 0x40
    22e0:	f009 ff44 	bl	c16c <memset>
    22e4:	787b      	ldrb	r3, [r7, #1]
    22e6:	2b25      	cmp	r3, #37	; 0x25
    22e8:	f000 80a3 	beq.w	2432 <z_cbvprintf_impl+0x186>
    22ec:	2300      	movs	r3, #0
    22ee:	1c79      	adds	r1, r7, #1
    22f0:	4698      	mov	r8, r3
    22f2:	469e      	mov	lr, r3
    22f4:	469c      	mov	ip, r3
    22f6:	4618      	mov	r0, r3
    22f8:	460e      	mov	r6, r1
    22fa:	f811 2b01 	ldrb.w	r2, [r1], #1
    22fe:	2a2b      	cmp	r2, #43	; 0x2b
    2300:	f000 80c6 	beq.w	2490 <z_cbvprintf_impl+0x1e4>
    2304:	f200 80bd 	bhi.w	2482 <z_cbvprintf_impl+0x1d6>
    2308:	2a20      	cmp	r2, #32
    230a:	f000 80c4 	beq.w	2496 <z_cbvprintf_impl+0x1ea>
    230e:	2a23      	cmp	r2, #35	; 0x23
    2310:	f000 80c4 	beq.w	249c <z_cbvprintf_impl+0x1f0>
    2314:	b12b      	cbz	r3, 2322 <z_cbvprintf_impl+0x76>
    2316:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    231a:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    231e:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    2322:	f1b8 0f00 	cmp.w	r8, #0
    2326:	d005      	beq.n	2334 <z_cbvprintf_impl+0x88>
    2328:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    232c:	f043 0320 	orr.w	r3, r3, #32
    2330:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    2334:	f1be 0f00 	cmp.w	lr, #0
    2338:	d005      	beq.n	2346 <z_cbvprintf_impl+0x9a>
    233a:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    233e:	f043 0310 	orr.w	r3, r3, #16
    2342:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    2346:	f1bc 0f00 	cmp.w	ip, #0
    234a:	d005      	beq.n	2358 <z_cbvprintf_impl+0xac>
    234c:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    2350:	f043 0308 	orr.w	r3, r3, #8
    2354:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    2358:	b128      	cbz	r0, 2366 <z_cbvprintf_impl+0xba>
    235a:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    235e:	f043 0304 	orr.w	r3, r3, #4
    2362:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    2366:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    236a:	f003 0144 	and.w	r1, r3, #68	; 0x44
    236e:	2944      	cmp	r1, #68	; 0x44
    2370:	d103      	bne.n	237a <z_cbvprintf_impl+0xce>
    2372:	f36f 1386 	bfc	r3, #6, #1
    2376:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    237a:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    237e:	9609      	str	r6, [sp, #36]	; 0x24
    2380:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    2384:	2a2a      	cmp	r2, #42	; 0x2a
    2386:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    238a:	f040 808c 	bne.w	24a6 <z_cbvprintf_impl+0x1fa>
    238e:	f89d 3049 	ldrb.w	r3, [sp, #73]	; 0x49
    2392:	f043 0301 	orr.w	r3, r3, #1
    2396:	f88d 3049 	strb.w	r3, [sp, #73]	; 0x49
    239a:	1c73      	adds	r3, r6, #1
    239c:	781a      	ldrb	r2, [r3, #0]
    239e:	2a2e      	cmp	r2, #46	; 0x2e
    23a0:	f89d 2049 	ldrb.w	r2, [sp, #73]	; 0x49
    23a4:	bf0c      	ite	eq
    23a6:	2101      	moveq	r1, #1
    23a8:	2100      	movne	r1, #0
    23aa:	f361 0241 	bfi	r2, r1, #1, #1
    23ae:	f88d 2049 	strb.w	r2, [sp, #73]	; 0x49
    23b2:	d10c      	bne.n	23ce <z_cbvprintf_impl+0x122>
    23b4:	1c5a      	adds	r2, r3, #1
    23b6:	9209      	str	r2, [sp, #36]	; 0x24
    23b8:	785a      	ldrb	r2, [r3, #1]
    23ba:	2a2a      	cmp	r2, #42	; 0x2a
    23bc:	f040 8083 	bne.w	24c6 <z_cbvprintf_impl+0x21a>
    23c0:	f89d 2049 	ldrb.w	r2, [sp, #73]	; 0x49
    23c4:	f042 0204 	orr.w	r2, r2, #4
    23c8:	f88d 2049 	strb.w	r2, [sp, #73]	; 0x49
    23cc:	3302      	adds	r3, #2
    23ce:	781a      	ldrb	r2, [r3, #0]
    23d0:	2a6c      	cmp	r2, #108	; 0x6c
    23d2:	f000 80a4 	beq.w	251e <z_cbvprintf_impl+0x272>
    23d6:	f200 8086 	bhi.w	24e6 <z_cbvprintf_impl+0x23a>
    23da:	2a68      	cmp	r2, #104	; 0x68
    23dc:	f000 808c 	beq.w	24f8 <z_cbvprintf_impl+0x24c>
    23e0:	2a6a      	cmp	r2, #106	; 0x6a
    23e2:	f000 80a5 	beq.w	2530 <z_cbvprintf_impl+0x284>
    23e6:	2a4c      	cmp	r2, #76	; 0x4c
    23e8:	f000 80aa 	beq.w	2540 <z_cbvprintf_impl+0x294>
    23ec:	461a      	mov	r2, r3
    23ee:	f812 3b01 	ldrb.w	r3, [r2], #1
    23f2:	9204      	str	r2, [sp, #16]
    23f4:	2b78      	cmp	r3, #120	; 0x78
    23f6:	f89d 2049 	ldrb.w	r2, [sp, #73]	; 0x49
    23fa:	f88d 304b 	strb.w	r3, [sp, #75]	; 0x4b
    23fe:	f200 8117 	bhi.w	2630 <z_cbvprintf_impl+0x384>
    2402:	2b6d      	cmp	r3, #109	; 0x6d
    2404:	f200 80a9 	bhi.w	255a <z_cbvprintf_impl+0x2ae>
    2408:	2b69      	cmp	r3, #105	; 0x69
    240a:	f200 8111 	bhi.w	2630 <z_cbvprintf_impl+0x384>
    240e:	2b57      	cmp	r3, #87	; 0x57
    2410:	f200 80be 	bhi.w	2590 <z_cbvprintf_impl+0x2e4>
    2414:	2b41      	cmp	r3, #65	; 0x41
    2416:	d003      	beq.n	2420 <z_cbvprintf_impl+0x174>
    2418:	3b45      	subs	r3, #69	; 0x45
    241a:	2b02      	cmp	r3, #2
    241c:	f200 8108 	bhi.w	2630 <z_cbvprintf_impl+0x384>
    2420:	f89d 304a 	ldrb.w	r3, [sp, #74]	; 0x4a
    2424:	2204      	movs	r2, #4
    2426:	f362 0302 	bfi	r3, r2, #0, #3
    242a:	f88d 304a 	strb.w	r3, [sp, #74]	; 0x4a
    242e:	2301      	movs	r3, #1
    2430:	e0ca      	b.n	25c8 <z_cbvprintf_impl+0x31c>
    2432:	1cba      	adds	r2, r7, #2
    2434:	9204      	str	r2, [sp, #16]
    2436:	f88d 304b 	strb.w	r3, [sp, #75]	; 0x4b
    243a:	f89d 3049 	ldrb.w	r3, [sp, #73]	; 0x49
    243e:	07da      	lsls	r2, r3, #31
    2440:	f140 80fd 	bpl.w	263e <z_cbvprintf_impl+0x392>
    2444:	f854 9b04 	ldr.w	r9, [r4], #4
    2448:	f1b9 0f00 	cmp.w	r9, #0
    244c:	da07      	bge.n	245e <z_cbvprintf_impl+0x1b2>
    244e:	f89d 2048 	ldrb.w	r2, [sp, #72]	; 0x48
    2452:	f042 0204 	orr.w	r2, r2, #4
    2456:	f88d 2048 	strb.w	r2, [sp, #72]	; 0x48
    245a:	f1c9 0900 	rsb	r9, r9, #0
    245e:	075e      	lsls	r6, r3, #29
    2460:	f140 80f6 	bpl.w	2650 <z_cbvprintf_impl+0x3a4>
    2464:	f854 bb04 	ldr.w	fp, [r4], #4
    2468:	f1bb 0f00 	cmp.w	fp, #0
    246c:	f280 80f5 	bge.w	265a <z_cbvprintf_impl+0x3ae>
    2470:	f89d 3049 	ldrb.w	r3, [sp, #73]	; 0x49
    2474:	f36f 0341 	bfc	r3, #1, #1
    2478:	f88d 3049 	strb.w	r3, [sp, #73]	; 0x49
    247c:	f04f 3bff 	mov.w	fp, #4294967295	; 0xffffffff
    2480:	e0eb      	b.n	265a <z_cbvprintf_impl+0x3ae>
    2482:	2a2d      	cmp	r2, #45	; 0x2d
    2484:	d00d      	beq.n	24a2 <z_cbvprintf_impl+0x1f6>
    2486:	2a30      	cmp	r2, #48	; 0x30
    2488:	f47f af44 	bne.w	2314 <z_cbvprintf_impl+0x68>
    248c:	2301      	movs	r3, #1
    248e:	e733      	b.n	22f8 <z_cbvprintf_impl+0x4c>
    2490:	f04f 0c01 	mov.w	ip, #1
    2494:	e730      	b.n	22f8 <z_cbvprintf_impl+0x4c>
    2496:	f04f 0e01 	mov.w	lr, #1
    249a:	e72d      	b.n	22f8 <z_cbvprintf_impl+0x4c>
    249c:	f04f 0801 	mov.w	r8, #1
    24a0:	e72a      	b.n	22f8 <z_cbvprintf_impl+0x4c>
    24a2:	2001      	movs	r0, #1
    24a4:	e728      	b.n	22f8 <z_cbvprintf_impl+0x4c>
    24a6:	a809      	add	r0, sp, #36	; 0x24
    24a8:	f7ff fe9e 	bl	21e8 <extract_decimal>
    24ac:	9b09      	ldr	r3, [sp, #36]	; 0x24
    24ae:	42b3      	cmp	r3, r6
    24b0:	f43f af74 	beq.w	239c <z_cbvprintf_impl+0xf0>
    24b4:	f89d 2048 	ldrb.w	r2, [sp, #72]	; 0x48
    24b8:	9013      	str	r0, [sp, #76]	; 0x4c
    24ba:	0fc0      	lsrs	r0, r0, #31
    24bc:	f360 0241 	bfi	r2, r0, #1, #1
    24c0:	f88d 2048 	strb.w	r2, [sp, #72]	; 0x48
    24c4:	e76a      	b.n	239c <z_cbvprintf_impl+0xf0>
    24c6:	a809      	add	r0, sp, #36	; 0x24
    24c8:	f7ff fe8e 	bl	21e8 <extract_decimal>
    24cc:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    24d0:	9014      	str	r0, [sp, #80]	; 0x50
    24d2:	f3c3 0240 	ubfx	r2, r3, #1, #1
    24d6:	ea42 72d0 	orr.w	r2, r2, r0, lsr #31
    24da:	f362 0341 	bfi	r3, r2, #1, #1
    24de:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    24e2:	9b09      	ldr	r3, [sp, #36]	; 0x24
    24e4:	e773      	b.n	23ce <z_cbvprintf_impl+0x122>
    24e6:	2a74      	cmp	r2, #116	; 0x74
    24e8:	d026      	beq.n	2538 <z_cbvprintf_impl+0x28c>
    24ea:	2a7a      	cmp	r2, #122	; 0x7a
    24ec:	f47f af7e 	bne.w	23ec <z_cbvprintf_impl+0x140>
    24f0:	f89d 2049 	ldrb.w	r2, [sp, #73]	; 0x49
    24f4:	2106      	movs	r1, #6
    24f6:	e00c      	b.n	2512 <z_cbvprintf_impl+0x266>
    24f8:	785a      	ldrb	r2, [r3, #1]
    24fa:	2a68      	cmp	r2, #104	; 0x68
    24fc:	f89d 2049 	ldrb.w	r2, [sp, #73]	; 0x49
    2500:	d106      	bne.n	2510 <z_cbvprintf_impl+0x264>
    2502:	2101      	movs	r1, #1
    2504:	f361 02c6 	bfi	r2, r1, #3, #4
    2508:	f88d 2049 	strb.w	r2, [sp, #73]	; 0x49
    250c:	3302      	adds	r3, #2
    250e:	e76d      	b.n	23ec <z_cbvprintf_impl+0x140>
    2510:	2102      	movs	r1, #2
    2512:	f361 02c6 	bfi	r2, r1, #3, #4
    2516:	f88d 2049 	strb.w	r2, [sp, #73]	; 0x49
    251a:	3301      	adds	r3, #1
    251c:	e766      	b.n	23ec <z_cbvprintf_impl+0x140>
    251e:	785a      	ldrb	r2, [r3, #1]
    2520:	2a6c      	cmp	r2, #108	; 0x6c
    2522:	f89d 2049 	ldrb.w	r2, [sp, #73]	; 0x49
    2526:	d101      	bne.n	252c <z_cbvprintf_impl+0x280>
    2528:	2104      	movs	r1, #4
    252a:	e7eb      	b.n	2504 <z_cbvprintf_impl+0x258>
    252c:	2103      	movs	r1, #3
    252e:	e7f0      	b.n	2512 <z_cbvprintf_impl+0x266>
    2530:	f89d 2049 	ldrb.w	r2, [sp, #73]	; 0x49
    2534:	2105      	movs	r1, #5
    2536:	e7ec      	b.n	2512 <z_cbvprintf_impl+0x266>
    2538:	f89d 2049 	ldrb.w	r2, [sp, #73]	; 0x49
    253c:	2107      	movs	r1, #7
    253e:	e7e8      	b.n	2512 <z_cbvprintf_impl+0x266>
    2540:	f8bd 2048 	ldrh.w	r2, [sp, #72]	; 0x48
    2544:	f422 42f0 	bic.w	r2, r2, #30720	; 0x7800
    2548:	f022 0202 	bic.w	r2, r2, #2
    254c:	f442 4280 	orr.w	r2, r2, #16384	; 0x4000
    2550:	f042 0202 	orr.w	r2, r2, #2
    2554:	f8ad 2048 	strh.w	r2, [sp, #72]	; 0x48
    2558:	e7df      	b.n	251a <z_cbvprintf_impl+0x26e>
    255a:	3b6e      	subs	r3, #110	; 0x6e
    255c:	b2d9      	uxtb	r1, r3
    255e:	2301      	movs	r3, #1
    2560:	408b      	lsls	r3, r1
    2562:	f240 4182 	movw	r1, #1154	; 0x482
    2566:	420b      	tst	r3, r1
    2568:	d138      	bne.n	25dc <z_cbvprintf_impl+0x330>
    256a:	f013 0f24 	tst.w	r3, #36	; 0x24
    256e:	d152      	bne.n	2616 <z_cbvprintf_impl+0x36a>
    2570:	07d8      	lsls	r0, r3, #31
    2572:	d55d      	bpl.n	2630 <z_cbvprintf_impl+0x384>
    2574:	f89d 304a 	ldrb.w	r3, [sp, #74]	; 0x4a
    2578:	2103      	movs	r1, #3
    257a:	f361 0302 	bfi	r3, r1, #0, #3
    257e:	f88d 304a 	strb.w	r3, [sp, #74]	; 0x4a
    2582:	f002 0378 	and.w	r3, r2, #120	; 0x78
    2586:	f1a3 0140 	sub.w	r1, r3, #64	; 0x40
    258a:	424b      	negs	r3, r1
    258c:	414b      	adcs	r3, r1
    258e:	e01b      	b.n	25c8 <z_cbvprintf_impl+0x31c>
    2590:	f1a3 0158 	sub.w	r1, r3, #88	; 0x58
    2594:	b2c9      	uxtb	r1, r1
    2596:	2001      	movs	r0, #1
    2598:	fa00 f101 	lsl.w	r1, r0, r1
    259c:	f411 4f62 	tst.w	r1, #57856	; 0xe200
    25a0:	f47f af3e 	bne.w	2420 <z_cbvprintf_impl+0x174>
    25a4:	f640 0601 	movw	r6, #2049	; 0x801
    25a8:	4231      	tst	r1, r6
    25aa:	d11d      	bne.n	25e8 <z_cbvprintf_impl+0x33c>
    25ac:	f411 3f04 	tst.w	r1, #135168	; 0x21000
    25b0:	d03e      	beq.n	2630 <z_cbvprintf_impl+0x384>
    25b2:	f89d 304a 	ldrb.w	r3, [sp, #74]	; 0x4a
    25b6:	f360 0302 	bfi	r3, r0, #0, #3
    25ba:	f002 0278 	and.w	r2, r2, #120	; 0x78
    25be:	2a40      	cmp	r2, #64	; 0x40
    25c0:	f88d 304a 	strb.w	r3, [sp, #74]	; 0x4a
    25c4:	d034      	beq.n	2630 <z_cbvprintf_impl+0x384>
    25c6:	2300      	movs	r3, #0
    25c8:	f89d 2048 	ldrb.w	r2, [sp, #72]	; 0x48
    25cc:	f3c2 0140 	ubfx	r1, r2, #1, #1
    25d0:	430b      	orrs	r3, r1
    25d2:	f363 0241 	bfi	r2, r3, #1, #1
    25d6:	f88d 2048 	strb.w	r2, [sp, #72]	; 0x48
    25da:	e72e      	b.n	243a <z_cbvprintf_impl+0x18e>
    25dc:	f89d 304a 	ldrb.w	r3, [sp, #74]	; 0x4a
    25e0:	2102      	movs	r1, #2
    25e2:	f361 0302 	bfi	r3, r1, #0, #3
    25e6:	e7e8      	b.n	25ba <z_cbvprintf_impl+0x30e>
    25e8:	f89d 104a 	ldrb.w	r1, [sp, #74]	; 0x4a
    25ec:	2002      	movs	r0, #2
    25ee:	f002 0278 	and.w	r2, r2, #120	; 0x78
    25f2:	f360 0102 	bfi	r1, r0, #0, #3
    25f6:	2a40      	cmp	r2, #64	; 0x40
    25f8:	f88d 104a 	strb.w	r1, [sp, #74]	; 0x4a
    25fc:	bf02      	ittt	eq
    25fe:	f89d 1048 	ldrbeq.w	r1, [sp, #72]	; 0x48
    2602:	f041 0101 	orreq.w	r1, r1, #1
    2606:	f88d 1048 	strbeq.w	r1, [sp, #72]	; 0x48
    260a:	2b63      	cmp	r3, #99	; 0x63
    260c:	d1db      	bne.n	25c6 <z_cbvprintf_impl+0x31a>
    260e:	1e13      	subs	r3, r2, #0
    2610:	bf18      	it	ne
    2612:	2301      	movne	r3, #1
    2614:	e7d8      	b.n	25c8 <z_cbvprintf_impl+0x31c>
    2616:	f89d 304a 	ldrb.w	r3, [sp, #74]	; 0x4a
    261a:	2103      	movs	r1, #3
    261c:	f361 0302 	bfi	r3, r1, #0, #3
    2620:	f012 0f78 	tst.w	r2, #120	; 0x78
    2624:	f88d 304a 	strb.w	r3, [sp, #74]	; 0x4a
    2628:	bf14      	ite	ne
    262a:	2301      	movne	r3, #1
    262c:	2300      	moveq	r3, #0
    262e:	e7cb      	b.n	25c8 <z_cbvprintf_impl+0x31c>
    2630:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    2634:	f043 0301 	orr.w	r3, r3, #1
    2638:	f88d 3048 	strb.w	r3, [sp, #72]	; 0x48
    263c:	e7c3      	b.n	25c6 <z_cbvprintf_impl+0x31a>
    263e:	f99d 2048 	ldrsb.w	r2, [sp, #72]	; 0x48
    2642:	2a00      	cmp	r2, #0
    2644:	bfb4      	ite	lt
    2646:	f8dd 904c 	ldrlt.w	r9, [sp, #76]	; 0x4c
    264a:	f04f 39ff 	movge.w	r9, #4294967295	; 0xffffffff
    264e:	e706      	b.n	245e <z_cbvprintf_impl+0x1b2>
    2650:	0798      	lsls	r0, r3, #30
    2652:	f57f af13 	bpl.w	247c <z_cbvprintf_impl+0x1d0>
    2656:	f8dd b050 	ldr.w	fp, [sp, #80]	; 0x50
    265a:	f89d 1049 	ldrb.w	r1, [sp, #73]	; 0x49
    265e:	2300      	movs	r3, #0
    2660:	e9cd 3313 	strd	r3, r3, [sp, #76]	; 0x4c
    2664:	f89d 304a 	ldrb.w	r3, [sp, #74]	; 0x4a
    2668:	f003 0307 	and.w	r3, r3, #7
    266c:	2b01      	cmp	r3, #1
    266e:	f3c1 01c3 	ubfx	r1, r1, #3, #4
    2672:	d133      	bne.n	26dc <z_cbvprintf_impl+0x430>
    2674:	1ecb      	subs	r3, r1, #3
    2676:	2b04      	cmp	r3, #4
    2678:	d804      	bhi.n	2684 <z_cbvprintf_impl+0x3d8>
    267a:	e8df f003 	tbb	[pc, r3]
    267e:	4621      	.short	0x4621
    2680:	2146      	.short	0x2146
    2682:	21          	.byte	0x21
    2683:	00          	.byte	0x00
    2684:	6823      	ldr	r3, [r4, #0]
    2686:	2901      	cmp	r1, #1
    2688:	ea4f 72e3 	mov.w	r2, r3, asr #31
    268c:	e9cd 3210 	strd	r3, r2, [sp, #64]	; 0x40
    2690:	d11c      	bne.n	26cc <z_cbvprintf_impl+0x420>
    2692:	f99d 3040 	ldrsb.w	r3, [sp, #64]	; 0x40
    2696:	17da      	asrs	r2, r3, #31
    2698:	e9cd 3210 	strd	r3, r2, [sp, #64]	; 0x40
    269c:	3404      	adds	r4, #4
    269e:	f89d 3048 	ldrb.w	r3, [sp, #72]	; 0x48
    26a2:	f013 0603 	ands.w	r6, r3, #3
    26a6:	d050      	beq.n	274a <z_cbvprintf_impl+0x49e>
    26a8:	9b04      	ldr	r3, [sp, #16]
    26aa:	9903      	ldr	r1, [sp, #12]
    26ac:	463a      	mov	r2, r7
    26ae:	4650      	mov	r0, sl
    26b0:	f007 fdce 	bl	a250 <outs>
    26b4:	2800      	cmp	r0, #0
    26b6:	f2c0 8150 	blt.w	295a <z_cbvprintf_impl+0x6ae>
    26ba:	4405      	add	r5, r0
    26bc:	9f04      	ldr	r7, [sp, #16]
    26be:	e5fd      	b.n	22bc <z_cbvprintf_impl+0x10>
    26c0:	f854 3b04 	ldr.w	r3, [r4], #4
    26c4:	17da      	asrs	r2, r3, #31
    26c6:	e9cd 3210 	strd	r3, r2, [sp, #64]	; 0x40
    26ca:	e7e8      	b.n	269e <z_cbvprintf_impl+0x3f2>
    26cc:	2902      	cmp	r1, #2
    26ce:	d1e5      	bne.n	269c <z_cbvprintf_impl+0x3f0>
    26d0:	b21a      	sxth	r2, r3
    26d2:	f343 33c0 	sbfx	r3, r3, #15, #1
    26d6:	e9cd 2310 	strd	r2, r3, [sp, #64]	; 0x40
    26da:	e7df      	b.n	269c <z_cbvprintf_impl+0x3f0>
    26dc:	2b02      	cmp	r3, #2
    26de:	d124      	bne.n	272a <z_cbvprintf_impl+0x47e>
    26e0:	1ecb      	subs	r3, r1, #3
    26e2:	2b04      	cmp	r3, #4
    26e4:	d804      	bhi.n	26f0 <z_cbvprintf_impl+0x444>
    26e6:	e8df f003 	tbb	[pc, r3]
    26ea:	1018      	.short	0x1018
    26ec:	1810      	.short	0x1810
    26ee:	18          	.byte	0x18
    26ef:	00          	.byte	0x00
    26f0:	2901      	cmp	r1, #1
    26f2:	f854 3b04 	ldr.w	r3, [r4], #4
    26f6:	f04f 0200 	mov.w	r2, #0
    26fa:	d014      	beq.n	2726 <z_cbvprintf_impl+0x47a>
    26fc:	2902      	cmp	r1, #2
    26fe:	e9cd 3210 	strd	r3, r2, [sp, #64]	; 0x40
    2702:	d1cc      	bne.n	269e <z_cbvprintf_impl+0x3f2>
    2704:	b29b      	uxth	r3, r3
    2706:	9310      	str	r3, [sp, #64]	; 0x40
    2708:	e7c9      	b.n	269e <z_cbvprintf_impl+0x3f2>
    270a:	3407      	adds	r4, #7
    270c:	f024 0407 	bic.w	r4, r4, #7
    2710:	e8f4 2302 	ldrd	r2, r3, [r4], #8
    2714:	e9cd 2310 	strd	r2, r3, [sp, #64]	; 0x40
    2718:	e7c1      	b.n	269e <z_cbvprintf_impl+0x3f2>
    271a:	f854 3b04 	ldr.w	r3, [r4], #4
    271e:	9310      	str	r3, [sp, #64]	; 0x40
    2720:	2300      	movs	r3, #0
    2722:	9311      	str	r3, [sp, #68]	; 0x44
    2724:	e7bb      	b.n	269e <z_cbvprintf_impl+0x3f2>
    2726:	b2db      	uxtb	r3, r3
    2728:	e7cd      	b.n	26c6 <z_cbvprintf_impl+0x41a>
    272a:	2b04      	cmp	r3, #4
    272c:	d108      	bne.n	2740 <z_cbvprintf_impl+0x494>
    272e:	3407      	adds	r4, #7
    2730:	f024 0407 	bic.w	r4, r4, #7
    2734:	e9d4 2300 	ldrd	r2, r3, [r4]
    2738:	3408      	adds	r4, #8
    273a:	e9cd 2310 	strd	r2, r3, [sp, #64]	; 0x40
    273e:	e7ae      	b.n	269e <z_cbvprintf_impl+0x3f2>
    2740:	2b03      	cmp	r3, #3
    2742:	d1ac      	bne.n	269e <z_cbvprintf_impl+0x3f2>
    2744:	f854 3b04 	ldr.w	r3, [r4], #4
    2748:	e7dd      	b.n	2706 <z_cbvprintf_impl+0x45a>
    274a:	f89d 004b 	ldrb.w	r0, [sp, #75]	; 0x4b
    274e:	2878      	cmp	r0, #120	; 0x78
    2750:	d8b4      	bhi.n	26bc <z_cbvprintf_impl+0x410>
    2752:	2862      	cmp	r0, #98	; 0x62
    2754:	d81c      	bhi.n	2790 <z_cbvprintf_impl+0x4e4>
    2756:	2825      	cmp	r0, #37	; 0x25
    2758:	f43f adb8 	beq.w	22cc <z_cbvprintf_impl+0x20>
    275c:	2858      	cmp	r0, #88	; 0x58
    275e:	d1ad      	bne.n	26bc <z_cbvprintf_impl+0x410>
    2760:	f10d 033e 	add.w	r3, sp, #62	; 0x3e
    2764:	9300      	str	r3, [sp, #0]
    2766:	e9dd 0110 	ldrd	r0, r1, [sp, #64]	; 0x40
    276a:	ab0a      	add	r3, sp, #40	; 0x28
    276c:	aa12      	add	r2, sp, #72	; 0x48
    276e:	f7ff fd51 	bl	2214 <encode_uint>
    2772:	f1bb 0f00 	cmp.w	fp, #0
    2776:	4607      	mov	r7, r0
    2778:	f280 8098 	bge.w	28ac <z_cbvprintf_impl+0x600>
    277c:	2f00      	cmp	r7, #0
    277e:	d09d      	beq.n	26bc <z_cbvprintf_impl+0x410>
    2780:	f10d 083e 	add.w	r8, sp, #62	; 0x3e
    2784:	eba8 0007 	sub.w	r0, r8, r7
    2788:	2e00      	cmp	r6, #0
    278a:	d04e      	beq.n	282a <z_cbvprintf_impl+0x57e>
    278c:	3001      	adds	r0, #1
    278e:	e04c      	b.n	282a <z_cbvprintf_impl+0x57e>
    2790:	3863      	subs	r0, #99	; 0x63
    2792:	2815      	cmp	r0, #21
    2794:	d892      	bhi.n	26bc <z_cbvprintf_impl+0x410>
    2796:	a201      	add	r2, pc, #4	; (adr r2, 279c <z_cbvprintf_impl+0x4f0>)
    2798:	f852 f020 	ldr.w	pc, [r2, r0, lsl #2]
    279c:	0000281b 	.word	0x0000281b
    27a0:	00002881 	.word	0x00002881
    27a4:	000026bd 	.word	0x000026bd
    27a8:	000026bd 	.word	0x000026bd
    27ac:	000026bd 	.word	0x000026bd
    27b0:	000026bd 	.word	0x000026bd
    27b4:	00002881 	.word	0x00002881
    27b8:	000026bd 	.word	0x000026bd
    27bc:	000026bd 	.word	0x000026bd
    27c0:	000026bd 	.word	0x000026bd
    27c4:	000026bd 	.word	0x000026bd
    27c8:	0000290b 	.word	0x0000290b
    27cc:	000028a7 	.word	0x000028a7
    27d0:	000028cd 	.word	0x000028cd
    27d4:	000026bd 	.word	0x000026bd
    27d8:	000026bd 	.word	0x000026bd
    27dc:	000027f5 	.word	0x000027f5
    27e0:	000026bd 	.word	0x000026bd
    27e4:	000028a7 	.word	0x000028a7
    27e8:	000026bd 	.word	0x000026bd
    27ec:	000026bd 	.word	0x000026bd
    27f0:	000028a7 	.word	0x000028a7
    27f4:	f1bb 0f00 	cmp.w	fp, #0
    27f8:	9f10      	ldr	r7, [sp, #64]	; 0x40
    27fa:	db0a      	blt.n	2812 <z_cbvprintf_impl+0x566>
    27fc:	4659      	mov	r1, fp
    27fe:	4638      	mov	r0, r7
    2800:	f009 fd29 	bl	c256 <strnlen>
    2804:	eb07 0800 	add.w	r8, r7, r0
    2808:	2f00      	cmp	r7, #0
    280a:	f43f af57 	beq.w	26bc <z_cbvprintf_impl+0x410>
    280e:	2600      	movs	r6, #0
    2810:	e00b      	b.n	282a <z_cbvprintf_impl+0x57e>
    2812:	4638      	mov	r0, r7
    2814:	f7ff f952 	bl	1abc <strlen>
    2818:	e7f4      	b.n	2804 <z_cbvprintf_impl+0x558>
    281a:	9b10      	ldr	r3, [sp, #64]	; 0x40
    281c:	f88d 3028 	strb.w	r3, [sp, #40]	; 0x28
    2820:	2600      	movs	r6, #0
    2822:	f10d 0829 	add.w	r8, sp, #41	; 0x29
    2826:	af0a      	add	r7, sp, #40	; 0x28
    2828:	2001      	movs	r0, #1
    282a:	f89d 304a 	ldrb.w	r3, [sp, #74]	; 0x4a
    282e:	f013 0210 	ands.w	r2, r3, #16
    2832:	9205      	str	r2, [sp, #20]
    2834:	f000 8084 	beq.w	2940 <z_cbvprintf_impl+0x694>
    2838:	3002      	adds	r0, #2
    283a:	065b      	lsls	r3, r3, #25
    283c:	f8dd b04c 	ldr.w	fp, [sp, #76]	; 0x4c
    2840:	bf48      	it	mi
    2842:	9b14      	ldrmi	r3, [sp, #80]	; 0x50
    2844:	4458      	add	r0, fp
    2846:	bf48      	it	mi
    2848:	18c0      	addmi	r0, r0, r3
    284a:	f1b9 0f00 	cmp.w	r9, #0
    284e:	f340 8091 	ble.w	2974 <z_cbvprintf_impl+0x6c8>
    2852:	f89d 2048 	ldrb.w	r2, [sp, #72]	; 0x48
    2856:	eba9 0900 	sub.w	r9, r9, r0
    285a:	f3c2 0380 	ubfx	r3, r2, #2, #1
    285e:	0750      	lsls	r0, r2, #29
    2860:	9306      	str	r3, [sp, #24]
    2862:	f100 8087 	bmi.w	2974 <z_cbvprintf_impl+0x6c8>
    2866:	0651      	lsls	r1, r2, #25
    2868:	d57a      	bpl.n	2960 <z_cbvprintf_impl+0x6b4>
    286a:	b13e      	cbz	r6, 287c <z_cbvprintf_impl+0x5d0>
    286c:	9903      	ldr	r1, [sp, #12]
    286e:	4630      	mov	r0, r6
    2870:	47d0      	blx	sl
    2872:	2800      	cmp	r0, #0
    2874:	db71      	blt.n	295a <z_cbvprintf_impl+0x6ae>
    2876:	9b06      	ldr	r3, [sp, #24]
    2878:	3501      	adds	r5, #1
    287a:	461e      	mov	r6, r3
    287c:	2230      	movs	r2, #48	; 0x30
    287e:	e070      	b.n	2962 <z_cbvprintf_impl+0x6b6>
    2880:	0719      	lsls	r1, r3, #28
    2882:	bf5c      	itt	pl
    2884:	f3c3 1300 	ubfxpl	r3, r3, #4, #1
    2888:	015e      	lslpl	r6, r3, #5
    288a:	e9dd 2310 	ldrd	r2, r3, [sp, #64]	; 0x40
    288e:	bf48      	it	mi
    2890:	262b      	movmi	r6, #43	; 0x2b
    2892:	2b00      	cmp	r3, #0
    2894:	f6bf af64 	bge.w	2760 <z_cbvprintf_impl+0x4b4>
    2898:	4252      	negs	r2, r2
    289a:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
    289e:	e9cd 2310 	strd	r2, r3, [sp, #64]	; 0x40
    28a2:	262d      	movs	r6, #45	; 0x2d
    28a4:	e75c      	b.n	2760 <z_cbvprintf_impl+0x4b4>
    28a6:	2600      	movs	r6, #0
    28a8:	e75a      	b.n	2760 <z_cbvprintf_impl+0x4b4>
    28aa:	2600      	movs	r6, #0
    28ac:	f89d 2048 	ldrb.w	r2, [sp, #72]	; 0x48
    28b0:	f10d 033e 	add.w	r3, sp, #62	; 0x3e
    28b4:	1bdb      	subs	r3, r3, r7
    28b6:	f36f 1286 	bfc	r2, #6, #1
    28ba:	459b      	cmp	fp, r3
    28bc:	f88d 2048 	strb.w	r2, [sp, #72]	; 0x48
    28c0:	f67f af5c 	bls.w	277c <z_cbvprintf_impl+0x4d0>
    28c4:	ebab 0303 	sub.w	r3, fp, r3
    28c8:	9313      	str	r3, [sp, #76]	; 0x4c
    28ca:	e757      	b.n	277c <z_cbvprintf_impl+0x4d0>
    28cc:	9810      	ldr	r0, [sp, #64]	; 0x40
    28ce:	b380      	cbz	r0, 2932 <z_cbvprintf_impl+0x686>
    28d0:	f10d 083e 	add.w	r8, sp, #62	; 0x3e
    28d4:	ab0a      	add	r3, sp, #40	; 0x28
    28d6:	f8cd 8000 	str.w	r8, [sp]
    28da:	aa12      	add	r2, sp, #72	; 0x48
    28dc:	2100      	movs	r1, #0
    28de:	f7ff fc99 	bl	2214 <encode_uint>
    28e2:	f8bd 304a 	ldrh.w	r3, [sp, #74]	; 0x4a
    28e6:	f003 03ef 	and.w	r3, r3, #239	; 0xef
    28ea:	f443 43f0 	orr.w	r3, r3, #30720	; 0x7800
    28ee:	f043 0310 	orr.w	r3, r3, #16
    28f2:	f1bb 0f00 	cmp.w	fp, #0
    28f6:	4607      	mov	r7, r0
    28f8:	f8ad 304a 	strh.w	r3, [sp, #74]	; 0x4a
    28fc:	dad5      	bge.n	28aa <z_cbvprintf_impl+0x5fe>
    28fe:	2800      	cmp	r0, #0
    2900:	f43f aedc 	beq.w	26bc <z_cbvprintf_impl+0x410>
    2904:	eba8 0000 	sub.w	r0, r8, r0
    2908:	e781      	b.n	280e <z_cbvprintf_impl+0x562>
    290a:	9b10      	ldr	r3, [sp, #64]	; 0x40
    290c:	2907      	cmp	r1, #7
    290e:	f63f aed5 	bhi.w	26bc <z_cbvprintf_impl+0x410>
    2912:	e8df f001 	tbb	[pc, r1]
    2916:	040c      	.short	0x040c
    2918:	08080c06 	.word	0x08080c06
    291c:	0c0c      	.short	0x0c0c
    291e:	701d      	strb	r5, [r3, #0]
    2920:	e6cc      	b.n	26bc <z_cbvprintf_impl+0x410>
    2922:	801d      	strh	r5, [r3, #0]
    2924:	e6ca      	b.n	26bc <z_cbvprintf_impl+0x410>
    2926:	17ea      	asrs	r2, r5, #31
    2928:	e9c3 5200 	strd	r5, r2, [r3]
    292c:	e6c6      	b.n	26bc <z_cbvprintf_impl+0x410>
    292e:	601d      	str	r5, [r3, #0]
    2930:	e6c4      	b.n	26bc <z_cbvprintf_impl+0x410>
    2932:	f8df 80bc 	ldr.w	r8, [pc, #188]	; 29f0 <z_cbvprintf_impl+0x744>
    2936:	4606      	mov	r6, r0
    2938:	f1a8 0705 	sub.w	r7, r8, #5
    293c:	2005      	movs	r0, #5
    293e:	e774      	b.n	282a <z_cbvprintf_impl+0x57e>
    2940:	071a      	lsls	r2, r3, #28
    2942:	bf48      	it	mi
    2944:	3001      	addmi	r0, #1
    2946:	e778      	b.n	283a <z_cbvprintf_impl+0x58e>
    2948:	9307      	str	r3, [sp, #28]
    294a:	4610      	mov	r0, r2
    294c:	9206      	str	r2, [sp, #24]
    294e:	9903      	ldr	r1, [sp, #12]
    2950:	47d0      	blx	sl
    2952:	2800      	cmp	r0, #0
    2954:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
    2958:	da04      	bge.n	2964 <z_cbvprintf_impl+0x6b8>
    295a:	b017      	add	sp, #92	; 0x5c
    295c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2960:	2220      	movs	r2, #32
    2962:	464b      	mov	r3, r9
    2964:	4619      	mov	r1, r3
    2966:	2900      	cmp	r1, #0
    2968:	f103 33ff 	add.w	r3, r3, #4294967295	; 0xffffffff
    296c:	dcec      	bgt.n	2948 <z_cbvprintf_impl+0x69c>
    296e:	444d      	add	r5, r9
    2970:	1a6d      	subs	r5, r5, r1
    2972:	4699      	mov	r9, r3
    2974:	b12e      	cbz	r6, 2982 <z_cbvprintf_impl+0x6d6>
    2976:	9903      	ldr	r1, [sp, #12]
    2978:	4630      	mov	r0, r6
    297a:	47d0      	blx	sl
    297c:	2800      	cmp	r0, #0
    297e:	dbec      	blt.n	295a <z_cbvprintf_impl+0x6ae>
    2980:	3501      	adds	r5, #1
    2982:	f89d 304a 	ldrb.w	r3, [sp, #74]	; 0x4a
    2986:	06da      	lsls	r2, r3, #27
    2988:	d401      	bmi.n	298e <z_cbvprintf_impl+0x6e2>
    298a:	071b      	lsls	r3, r3, #28
    298c:	d505      	bpl.n	299a <z_cbvprintf_impl+0x6ee>
    298e:	9903      	ldr	r1, [sp, #12]
    2990:	2030      	movs	r0, #48	; 0x30
    2992:	47d0      	blx	sl
    2994:	2800      	cmp	r0, #0
    2996:	dbe0      	blt.n	295a <z_cbvprintf_impl+0x6ae>
    2998:	3501      	adds	r5, #1
    299a:	9b05      	ldr	r3, [sp, #20]
    299c:	b133      	cbz	r3, 29ac <z_cbvprintf_impl+0x700>
    299e:	9903      	ldr	r1, [sp, #12]
    29a0:	f89d 004b 	ldrb.w	r0, [sp, #75]	; 0x4b
    29a4:	47d0      	blx	sl
    29a6:	2800      	cmp	r0, #0
    29a8:	dbd7      	blt.n	295a <z_cbvprintf_impl+0x6ae>
    29aa:	3501      	adds	r5, #1
    29ac:	44ab      	add	fp, r5
    29ae:	e005      	b.n	29bc <z_cbvprintf_impl+0x710>
    29b0:	9903      	ldr	r1, [sp, #12]
    29b2:	2030      	movs	r0, #48	; 0x30
    29b4:	47d0      	blx	sl
    29b6:	2800      	cmp	r0, #0
    29b8:	dbcf      	blt.n	295a <z_cbvprintf_impl+0x6ae>
    29ba:	3501      	adds	r5, #1
    29bc:	ebab 0305 	sub.w	r3, fp, r5
    29c0:	2b00      	cmp	r3, #0
    29c2:	dcf5      	bgt.n	29b0 <z_cbvprintf_impl+0x704>
    29c4:	9903      	ldr	r1, [sp, #12]
    29c6:	4643      	mov	r3, r8
    29c8:	463a      	mov	r2, r7
    29ca:	4650      	mov	r0, sl
    29cc:	f007 fc40 	bl	a250 <outs>
    29d0:	2800      	cmp	r0, #0
    29d2:	dbc2      	blt.n	295a <z_cbvprintf_impl+0x6ae>
    29d4:	4405      	add	r5, r0
    29d6:	44a9      	add	r9, r5
    29d8:	eba9 0305 	sub.w	r3, r9, r5
    29dc:	2b00      	cmp	r3, #0
    29de:	f77f ae6d 	ble.w	26bc <z_cbvprintf_impl+0x410>
    29e2:	9903      	ldr	r1, [sp, #12]
    29e4:	2020      	movs	r0, #32
    29e6:	47d0      	blx	sl
    29e8:	2800      	cmp	r0, #0
    29ea:	dbb6      	blt.n	295a <z_cbvprintf_impl+0x6ae>
    29ec:	3501      	adds	r5, #1
    29ee:	e7f3      	b.n	29d8 <z_cbvprintf_impl+0x72c>
    29f0:	0000d5a9 	.word	0x0000d5a9

000029f4 <sys_reboot>:
    29f4:	b508      	push	{r3, lr}
    29f6:	f04f 0220 	mov.w	r2, #32
    29fa:	f3ef 8311 	mrs	r3, BASEPRI
    29fe:	f382 8812 	msr	BASEPRI_MAX, r2
    2a02:	f3bf 8f6f 	isb	sy
    2a06:	f003 f8af 	bl	5b68 <sys_arch_reboot>
    2a0a:	4803      	ldr	r0, [pc, #12]	; (2a18 <sys_reboot+0x24>)
    2a0c:	f007 fabd 	bl	9f8a <printk>
    2a10:	f002 fc72 	bl	52f8 <arch_cpu_idle>
    2a14:	e7fc      	b.n	2a10 <sys_reboot+0x1c>
    2a16:	bf00      	nop
    2a18:	0000d5aa 	.word	0x0000d5aa

00002a1c <foldcase>:
    2a1c:	070b      	lsls	r3, r1, #28
    2a1e:	d506      	bpl.n	2a2e <foldcase+0x12>
    2a20:	4b03      	ldr	r3, [pc, #12]	; (2a30 <foldcase+0x14>)
    2a22:	5c1b      	ldrb	r3, [r3, r0]
    2a24:	f003 0303 	and.w	r3, r3, #3
    2a28:	2b01      	cmp	r3, #1
    2a2a:	bf08      	it	eq
    2a2c:	3020      	addeq	r0, #32
    2a2e:	4770      	bx	lr
    2a30:	0000e695 	.word	0x0000e695

00002a34 <z_arm_platform_init>:
    2a34:	f004 b892 	b.w	6b5c <SystemInit>

00002a38 <cmd_kernel_version>:
    2a38:	b513      	push	{r0, r1, r4, lr}
    2a3a:	4604      	mov	r4, r0
    2a3c:	f005 f8f8 	bl	7c30 <sys_kernel_version_get>
    2a40:	f3c0 2307 	ubfx	r3, r0, #8, #8
    2a44:	9301      	str	r3, [sp, #4]
    2a46:	f3c0 4307 	ubfx	r3, r0, #16, #8
    2a4a:	9300      	str	r3, [sp, #0]
    2a4c:	4a04      	ldr	r2, [pc, #16]	; (2a60 <cmd_kernel_version+0x28>)
    2a4e:	0e03      	lsrs	r3, r0, #24
    2a50:	2108      	movs	r1, #8
    2a52:	4620      	mov	r0, r4
    2a54:	f007 ffcc 	bl	a9f0 <shell_fprintf>
    2a58:	2000      	movs	r0, #0
    2a5a:	b002      	add	sp, #8
    2a5c:	bd10      	pop	{r4, pc}
    2a5e:	bf00      	nop
    2a60:	0000d5d3 	.word	0x0000d5d3

00002a64 <cmd_kernel_uptime>:
    2a64:	b538      	push	{r3, r4, r5, lr}
    2a66:	4604      	mov	r4, r0
    2a68:	f009 f9b1 	bl	bdce <z_impl_k_uptime_ticks>
    2a6c:	f44f 757a 	mov.w	r5, #1000	; 0x3e8
    2a70:	fba0 2305 	umull	r2, r3, r0, r5
    2a74:	fb05 3301 	mla	r3, r5, r1, r3
    2a78:	0bd2      	lsrs	r2, r2, #15
    2a7a:	ea42 4343 	orr.w	r3, r2, r3, lsl #17
    2a7e:	4620      	mov	r0, r4
    2a80:	4a02      	ldr	r2, [pc, #8]	; (2a8c <cmd_kernel_uptime+0x28>)
    2a82:	2108      	movs	r1, #8
    2a84:	f007 ffb4 	bl	a9f0 <shell_fprintf>
    2a88:	2000      	movs	r0, #0
    2a8a:	bd38      	pop	{r3, r4, r5, pc}
    2a8c:	0000d5ec 	.word	0x0000d5ec

00002a90 <cmd_kernel_threads>:
    2a90:	b510      	push	{r4, lr}
    2a92:	4604      	mov	r4, r0
    2a94:	f003 ff84 	bl	69a0 <sys_clock_elapsed>
    2a98:	4a08      	ldr	r2, [pc, #32]	; (2abc <cmd_kernel_threads+0x2c>)
    2a9a:	4603      	mov	r3, r0
    2a9c:	2108      	movs	r1, #8
    2a9e:	4620      	mov	r0, r4
    2aa0:	f007 ffa6 	bl	a9f0 <shell_fprintf>
    2aa4:	4a06      	ldr	r2, [pc, #24]	; (2ac0 <cmd_kernel_threads+0x30>)
    2aa6:	4620      	mov	r0, r4
    2aa8:	2108      	movs	r1, #8
    2aaa:	f007 ffa1 	bl	a9f0 <shell_fprintf>
    2aae:	4805      	ldr	r0, [pc, #20]	; (2ac4 <cmd_kernel_threads+0x34>)
    2ab0:	4621      	mov	r1, r4
    2ab2:	f004 ff39 	bl	7928 <k_thread_foreach>
    2ab6:	2000      	movs	r0, #0
    2ab8:	bd10      	pop	{r4, pc}
    2aba:	bf00      	nop
    2abc:	0000d5fb 	.word	0x0000d5fb
    2ac0:	0000d61a 	.word	0x0000d61a
    2ac4:	00002ac9 	.word	0x00002ac9

00002ac8 <shell_tdata_dump>:
    2ac8:	b5f0      	push	{r4, r5, r6, r7, lr}
    2aca:	b08f      	sub	sp, #60	; 0x3c
    2acc:	f8d0 70a0 	ldr.w	r7, [r0, #160]	; 0xa0
    2ad0:	4604      	mov	r4, r0
    2ad2:	460d      	mov	r5, r1
    2ad4:	f009 f82b 	bl	bb2e <k_thread_name_get>
    2ad8:	4606      	mov	r6, r0
    2ada:	f005 fcb1 	bl	8440 <z_impl_z_current_get>
    2ade:	4b24      	ldr	r3, [pc, #144]	; (2b70 <shell_tdata_dump+0xa8>)
    2ae0:	4a24      	ldr	r2, [pc, #144]	; (2b74 <shell_tdata_dump+0xac>)
    2ae2:	2e00      	cmp	r6, #0
    2ae4:	bf08      	it	eq
    2ae6:	461e      	moveq	r6, r3
    2ae8:	4b23      	ldr	r3, [pc, #140]	; (2b78 <shell_tdata_dump+0xb0>)
    2aea:	e9cd 4600 	strd	r4, r6, [sp]
    2aee:	4284      	cmp	r4, r0
    2af0:	bf18      	it	ne
    2af2:	4613      	movne	r3, r2
    2af4:	2108      	movs	r1, #8
    2af6:	4628      	mov	r0, r5
    2af8:	4a20      	ldr	r2, [pc, #128]	; (2b7c <shell_tdata_dump+0xb4>)
    2afa:	f007 ff79 	bl	a9f0 <shell_fprintf>
    2afe:	e9d4 230a 	ldrd	r2, r3, [r4, #40]	; 0x28
    2b02:	e9cd 2302 	strd	r2, r3, [sp, #8]
    2b06:	f994 300e 	ldrsb.w	r3, [r4, #14]
    2b0a:	9300      	str	r3, [sp, #0]
    2b0c:	7b23      	ldrb	r3, [r4, #12]
    2b0e:	4a1c      	ldr	r2, [pc, #112]	; (2b80 <shell_tdata_dump+0xb8>)
    2b10:	4628      	mov	r0, r5
    2b12:	2108      	movs	r1, #8
    2b14:	f007 ff6c 	bl	a9f0 <shell_fprintf>
    2b18:	a906      	add	r1, sp, #24
    2b1a:	2220      	movs	r2, #32
    2b1c:	4620      	mov	r0, r4
    2b1e:	f004 ff4b 	bl	79b8 <k_thread_state_str>
    2b22:	6e62      	ldr	r2, [r4, #100]	; 0x64
    2b24:	9200      	str	r2, [sp, #0]
    2b26:	4603      	mov	r3, r0
    2b28:	4a16      	ldr	r2, [pc, #88]	; (2b84 <shell_tdata_dump+0xbc>)
    2b2a:	2108      	movs	r1, #8
    2b2c:	4628      	mov	r0, r5
    2b2e:	f007 ff5f 	bl	a9f0 <shell_fprintf>
    2b32:	a905      	add	r1, sp, #20
    2b34:	4620      	mov	r0, r4
    2b36:	f009 f80a 	bl	bb4e <z_impl_k_thread_stack_space_get>
    2b3a:	4603      	mov	r3, r0
    2b3c:	b130      	cbz	r0, 2b4c <shell_tdata_dump+0x84>
    2b3e:	4a12      	ldr	r2, [pc, #72]	; (2b88 <shell_tdata_dump+0xc0>)
    2b40:	2108      	movs	r1, #8
    2b42:	4628      	mov	r0, r5
    2b44:	f007 ff54 	bl	a9f0 <shell_fprintf>
    2b48:	b00f      	add	sp, #60	; 0x3c
    2b4a:	bdf0      	pop	{r4, r5, r6, r7, pc}
    2b4c:	9a05      	ldr	r2, [sp, #20]
    2b4e:	2364      	movs	r3, #100	; 0x64
    2b50:	1ab9      	subs	r1, r7, r2
    2b52:	e9cd 2100 	strd	r2, r1, [sp]
    2b56:	434b      	muls	r3, r1
    2b58:	4a0c      	ldr	r2, [pc, #48]	; (2b8c <shell_tdata_dump+0xc4>)
    2b5a:	fbb3 f3f7 	udiv	r3, r3, r7
    2b5e:	2108      	movs	r1, #8
    2b60:	e9cd 7302 	strd	r7, r3, [sp, #8]
    2b64:	4628      	mov	r0, r5
    2b66:	463b      	mov	r3, r7
    2b68:	f007 ff42 	bl	a9f0 <shell_fprintf>
    2b6c:	e7ec      	b.n	2b48 <shell_tdata_dump+0x80>
    2b6e:	bf00      	nop
    2b70:	0000d626 	.word	0x0000d626
    2b74:	0000defb 	.word	0x0000defb
    2b78:	0000d624 	.word	0x0000d624
    2b7c:	0000d629 	.word	0x0000d629
    2b80:	0000d635 	.word	0x0000d635
    2b84:	0000d661 	.word	0x0000d661
    2b88:	0000d678 	.word	0x0000d678
    2b8c:	0000d6a5 	.word	0x0000d6a5

00002b90 <cmd_kernel_stacks>:
    2b90:	b530      	push	{r4, r5, lr}
    2b92:	b093      	sub	sp, #76	; 0x4c
    2b94:	2100      	movs	r1, #0
    2b96:	221c      	movs	r2, #28
    2b98:	4604      	mov	r4, r0
    2b9a:	a80b      	add	r0, sp, #44	; 0x2c
    2b9c:	910a      	str	r1, [sp, #40]	; 0x28
    2b9e:	f009 fae5 	bl	c16c <memset>
    2ba2:	481b      	ldr	r0, [pc, #108]	; (2c10 <cmd_kernel_stacks+0x80>)
    2ba4:	f7fe ff8a 	bl	1abc <strlen>
    2ba8:	f1c0 0020 	rsb	r0, r0, #32
    2bac:	2801      	cmp	r0, #1
    2bae:	d92d      	bls.n	2c0c <cmd_kernel_stacks+0x7c>
    2bb0:	4817      	ldr	r0, [pc, #92]	; (2c10 <cmd_kernel_stacks+0x80>)
    2bb2:	f7fe ff83 	bl	1abc <strlen>
    2bb6:	f1c0 0220 	rsb	r2, r0, #32
    2bba:	2320      	movs	r3, #32
    2bbc:	ad0a      	add	r5, sp, #40	; 0x28
    2bbe:	4619      	mov	r1, r3
    2bc0:	4628      	mov	r0, r5
    2bc2:	f009 fadb 	bl	c17c <__memset_chk>
    2bc6:	4621      	mov	r1, r4
    2bc8:	4812      	ldr	r0, [pc, #72]	; (2c14 <cmd_kernel_stacks+0x84>)
    2bca:	f004 fead 	bl	7928 <k_thread_foreach>
    2bce:	aa09      	add	r2, sp, #36	; 0x24
    2bd0:	f44f 6100 	mov.w	r1, #2048	; 0x800
    2bd4:	4810      	ldr	r0, [pc, #64]	; (2c18 <cmd_kernel_stacks+0x88>)
    2bd6:	f008 ffae 	bl	bb36 <z_stack_space_get>
    2bda:	9a09      	ldr	r2, [sp, #36]	; 0x24
    2bdc:	9501      	str	r5, [sp, #4]
    2bde:	f5c2 6100 	rsb	r1, r2, #2048	; 0x800
    2be2:	2364      	movs	r3, #100	; 0x64
    2be4:	434b      	muls	r3, r1
    2be6:	0adb      	lsrs	r3, r3, #11
    2be8:	9306      	str	r3, [sp, #24]
    2bea:	2500      	movs	r5, #0
    2bec:	f44f 6300 	mov.w	r3, #2048	; 0x800
    2bf0:	e9cd 1304 	strd	r1, r3, [sp, #16]
    2bf4:	e9cd 3202 	strd	r3, r2, [sp, #8]
    2bf8:	4620      	mov	r0, r4
    2bfa:	4b08      	ldr	r3, [pc, #32]	; (2c1c <cmd_kernel_stacks+0x8c>)
    2bfc:	4a08      	ldr	r2, [pc, #32]	; (2c20 <cmd_kernel_stacks+0x90>)
    2bfe:	9500      	str	r5, [sp, #0]
    2c00:	2108      	movs	r1, #8
    2c02:	f007 fef5 	bl	a9f0 <shell_fprintf>
    2c06:	4628      	mov	r0, r5
    2c08:	b013      	add	sp, #76	; 0x4c
    2c0a:	bd30      	pop	{r4, r5, pc}
    2c0c:	2201      	movs	r2, #1
    2c0e:	e7d4      	b.n	2bba <cmd_kernel_stacks+0x2a>
    2c10:	0000d6dc 	.word	0x0000d6dc
    2c14:	00002c95 	.word	0x00002c95
    2c18:	20002e00 	.word	0x20002e00
    2c1c:	20002dc0 	.word	0x20002dc0
    2c20:	0000d6e3 	.word	0x0000d6e3

00002c24 <cmd_kernel_cycles>:
    2c24:	b510      	push	{r4, lr}
    2c26:	4604      	mov	r4, r0
    2c28:	f008 fe17 	bl	b85a <sys_clock_cycle_get_32>
    2c2c:	4a03      	ldr	r2, [pc, #12]	; (2c3c <cmd_kernel_cycles+0x18>)
    2c2e:	4603      	mov	r3, r0
    2c30:	2108      	movs	r1, #8
    2c32:	4620      	mov	r0, r4
    2c34:	f007 fedc 	bl	a9f0 <shell_fprintf>
    2c38:	2000      	movs	r0, #0
    2c3a:	bd10      	pop	{r4, pc}
    2c3c:	0000d72c 	.word	0x0000d72c

00002c40 <cmd_kernel_sleep>:
    2c40:	b573      	push	{r0, r1, r4, r5, r6, lr}
    2c42:	4613      	mov	r3, r2
    2c44:	2200      	movs	r2, #0
    2c46:	9201      	str	r2, [sp, #4]
    2c48:	4604      	mov	r4, r0
    2c4a:	aa01      	add	r2, sp, #4
    2c4c:	6858      	ldr	r0, [r3, #4]
    2c4e:	210a      	movs	r1, #10
    2c50:	f007 ffbe 	bl	abd0 <shell_strtoul>
    2c54:	9d01      	ldr	r5, [sp, #4]
    2c56:	b995      	cbnz	r5, 2c7e <cmd_kernel_sleep+0x3e>
    2c58:	ea20 74e0 	bic.w	r4, r0, r0, asr #31
    2c5c:	f44f 4600 	mov.w	r6, #32768	; 0x8000
    2c60:	4629      	mov	r1, r5
    2c62:	f240 30e7 	movw	r0, #999	; 0x3e7
    2c66:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    2c6a:	2300      	movs	r3, #0
    2c6c:	fbc4 0106 	smlal	r0, r1, r4, r6
    2c70:	f7fd feee 	bl	a50 <__aeabi_uldivmod>
    2c74:	f005 fbca 	bl	840c <z_impl_k_sleep>
    2c78:	4628      	mov	r0, r5
    2c7a:	b002      	add	sp, #8
    2c7c:	bd70      	pop	{r4, r5, r6, pc}
    2c7e:	462b      	mov	r3, r5
    2c80:	4a03      	ldr	r2, [pc, #12]	; (2c90 <cmd_kernel_sleep+0x50>)
    2c82:	2101      	movs	r1, #1
    2c84:	4620      	mov	r0, r4
    2c86:	f007 feb3 	bl	a9f0 <shell_fprintf>
    2c8a:	9d01      	ldr	r5, [sp, #4]
    2c8c:	e7f4      	b.n	2c78 <cmd_kernel_sleep+0x38>
    2c8e:	bf00      	nop
    2c90:	0000d742 	.word	0x0000d742

00002c94 <shell_stack_dump>:
    2c94:	b5f0      	push	{r4, r5, r6, r7, lr}
    2c96:	4604      	mov	r4, r0
    2c98:	f8d0 60a0 	ldr.w	r6, [r0, #160]	; 0xa0
    2c9c:	b089      	sub	sp, #36	; 0x24
    2c9e:	460d      	mov	r5, r1
    2ca0:	a907      	add	r1, sp, #28
    2ca2:	f008 ff54 	bl	bb4e <z_impl_k_thread_stack_space_get>
    2ca6:	4603      	mov	r3, r0
    2ca8:	b130      	cbz	r0, 2cb8 <shell_stack_dump+0x24>
    2caa:	4a10      	ldr	r2, [pc, #64]	; (2cec <shell_stack_dump+0x58>)
    2cac:	2108      	movs	r1, #8
    2cae:	4628      	mov	r0, r5
    2cb0:	f007 fe9e 	bl	a9f0 <shell_fprintf>
    2cb4:	b009      	add	sp, #36	; 0x24
    2cb6:	bdf0      	pop	{r4, r5, r6, r7, pc}
    2cb8:	4620      	mov	r0, r4
    2cba:	f008 ff38 	bl	bb2e <k_thread_name_get>
    2cbe:	4f0c      	ldr	r7, [pc, #48]	; (2cf0 <shell_stack_dump+0x5c>)
    2cc0:	9a07      	ldr	r2, [sp, #28]
    2cc2:	2800      	cmp	r0, #0
    2cc4:	bf18      	it	ne
    2cc6:	4607      	movne	r7, r0
    2cc8:	1ab1      	subs	r1, r6, r2
    2cca:	2364      	movs	r3, #100	; 0x64
    2ccc:	e9cd 2102 	strd	r2, r1, [sp, #8]
    2cd0:	434b      	muls	r3, r1
    2cd2:	e9cd 7600 	strd	r7, r6, [sp]
    2cd6:	fbb3 f3f6 	udiv	r3, r3, r6
    2cda:	4a06      	ldr	r2, [pc, #24]	; (2cf4 <shell_stack_dump+0x60>)
    2cdc:	e9cd 6304 	strd	r6, r3, [sp, #16]
    2ce0:	2108      	movs	r1, #8
    2ce2:	4623      	mov	r3, r4
    2ce4:	4628      	mov	r0, r5
    2ce6:	f007 fe83 	bl	a9f0 <shell_fprintf>
    2cea:	e7e3      	b.n	2cb4 <shell_stack_dump+0x20>
    2cec:	0000d678 	.word	0x0000d678
    2cf0:	0000d626 	.word	0x0000d626
    2cf4:	0000d762 	.word	0x0000d762

00002cf8 <get_device_name>:
    2cf8:	b510      	push	{r4, lr}
    2cfa:	4603      	mov	r3, r0
    2cfc:	6800      	ldr	r0, [r0, #0]
    2cfe:	460c      	mov	r4, r1
    2d00:	4611      	mov	r1, r2
    2d02:	b108      	cbz	r0, 2d08 <get_device_name+0x10>
    2d04:	7802      	ldrb	r2, [r0, #0]
    2d06:	b922      	cbnz	r2, 2d12 <get_device_name+0x1a>
    2d08:	4a02      	ldr	r2, [pc, #8]	; (2d14 <get_device_name+0x1c>)
    2d0a:	4620      	mov	r0, r4
    2d0c:	f006 f846 	bl	8d9c <sniprintf>
    2d10:	4620      	mov	r0, r4
    2d12:	bd10      	pop	{r4, pc}
    2d14:	0000d87a 	.word	0x0000d87a

00002d18 <cmd_device_list_visitor>:
    2d18:	b510      	push	{r4, lr}
    2d1a:	680c      	ldr	r4, [r1, #0]
    2d1c:	e9d1 1201 	ldrd	r1, r2, [r1, #4]
    2d20:	f7ff ffea 	bl	2cf8 <get_device_name>
    2d24:	4a03      	ldr	r2, [pc, #12]	; (2d34 <cmd_device_list_visitor+0x1c>)
    2d26:	4603      	mov	r3, r0
    2d28:	2108      	movs	r1, #8
    2d2a:	4620      	mov	r0, r4
    2d2c:	f007 fe60 	bl	a9f0 <shell_fprintf>
    2d30:	2000      	movs	r0, #0
    2d32:	bd10      	pop	{r4, pc}
    2d34:	0000d87f 	.word	0x0000d87f

00002d38 <cmd_device_list>:
    2d38:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    2d3c:	b08a      	sub	sp, #40	; 0x28
    2d3e:	4605      	mov	r5, r0
    2d40:	a801      	add	r0, sp, #4
    2d42:	f004 fca9 	bl	7698 <z_device_get_all_static>
    2d46:	9e01      	ldr	r6, [sp, #4]
    2d48:	4a1b      	ldr	r2, [pc, #108]	; (2db8 <cmd_device_list+0x80>)
    2d4a:	f8df 8070 	ldr.w	r8, [pc, #112]	; 2dbc <cmd_device_list+0x84>
    2d4e:	f8df 9070 	ldr.w	r9, [pc, #112]	; 2dc0 <cmd_device_list+0x88>
    2d52:	f8df a070 	ldr.w	sl, [pc, #112]	; 2dc4 <cmd_device_list+0x8c>
    2d56:	2318      	movs	r3, #24
    2d58:	fb03 6600 	mla	r6, r3, r0, r6
    2d5c:	2108      	movs	r1, #8
    2d5e:	4628      	mov	r0, r5
    2d60:	f007 fe46 	bl	a9f0 <shell_fprintf>
    2d64:	9c01      	ldr	r4, [sp, #4]
    2d66:	42b4      	cmp	r4, r6
    2d68:	d303      	bcc.n	2d72 <cmd_device_list+0x3a>
    2d6a:	2000      	movs	r0, #0
    2d6c:	b00a      	add	sp, #40	; 0x28
    2d6e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    2d72:	af05      	add	r7, sp, #20
    2d74:	4639      	mov	r1, r7
    2d76:	2214      	movs	r2, #20
    2d78:	4620      	mov	r0, r4
    2d7a:	f7ff ffbd 	bl	2cf8 <get_device_name>
    2d7e:	4642      	mov	r2, r8
    2d80:	4603      	mov	r3, r0
    2d82:	2108      	movs	r1, #8
    2d84:	4628      	mov	r0, r5
    2d86:	f007 fe33 	bl	a9f0 <shell_fprintf>
    2d8a:	4620      	mov	r0, r4
    2d8c:	f008 fe39 	bl	ba02 <z_device_is_ready>
    2d90:	4a0d      	ldr	r2, [pc, #52]	; (2dc8 <cmd_device_list+0x90>)
    2d92:	2800      	cmp	r0, #0
    2d94:	bf0c      	ite	eq
    2d96:	464b      	moveq	r3, r9
    2d98:	4653      	movne	r3, sl
    2d9a:	2108      	movs	r1, #8
    2d9c:	4628      	mov	r0, r5
    2d9e:	f007 fe27 	bl	a9f0 <shell_fprintf>
    2da2:	2314      	movs	r3, #20
    2da4:	4620      	mov	r0, r4
    2da6:	4909      	ldr	r1, [pc, #36]	; (2dcc <cmd_device_list+0x94>)
    2da8:	9304      	str	r3, [sp, #16]
    2daa:	aa02      	add	r2, sp, #8
    2dac:	e9cd 5702 	strd	r5, r7, [sp, #8]
    2db0:	3418      	adds	r4, #24
    2db2:	f008 fe31 	bl	ba18 <device_required_foreach>
    2db6:	e7d6      	b.n	2d66 <cmd_device_list+0x2e>
    2db8:	0000d89e 	.word	0x0000d89e
    2dbc:	0000d8a8 	.word	0x0000d8a8
    2dc0:	0000d895 	.word	0x0000d895
    2dc4:	0000d88f 	.word	0x0000d88f
    2dc8:	0000d8ad 	.word	0x0000d8ad
    2dcc:	00002d19 	.word	0x00002d19

00002dd0 <device_get_config_level>:
    2dd0:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    2dd4:	4b11      	ldr	r3, [pc, #68]	; (2e1c <device_get_config_level+0x4c>)
    2dd6:	f8df 9048 	ldr.w	r9, [pc, #72]	; 2e20 <device_get_config_level+0x50>
    2dda:	f853 4021 	ldr.w	r4, [r3, r1, lsl #2]
    2dde:	3101      	adds	r1, #1
    2de0:	b087      	sub	sp, #28
    2de2:	f853 8021 	ldr.w	r8, [r3, r1, lsl #2]
    2de6:	4606      	mov	r6, r0
    2de8:	2700      	movs	r7, #0
    2dea:	45a0      	cmp	r8, r4
    2dec:	d803      	bhi.n	2df6 <device_get_config_level+0x26>
    2dee:	4638      	mov	r0, r7
    2df0:	b007      	add	sp, #28
    2df2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    2df6:	4620      	mov	r0, r4
    2df8:	f008 fe03 	bl	ba02 <z_device_is_ready>
    2dfc:	4605      	mov	r5, r0
    2dfe:	b158      	cbz	r0, 2e18 <device_get_config_level+0x48>
    2e00:	2214      	movs	r2, #20
    2e02:	a901      	add	r1, sp, #4
    2e04:	4620      	mov	r0, r4
    2e06:	f7ff ff77 	bl	2cf8 <get_device_name>
    2e0a:	464a      	mov	r2, r9
    2e0c:	4603      	mov	r3, r0
    2e0e:	2108      	movs	r1, #8
    2e10:	4630      	mov	r0, r6
    2e12:	f007 fded 	bl	a9f0 <shell_fprintf>
    2e16:	462f      	mov	r7, r5
    2e18:	3418      	adds	r4, #24
    2e1a:	e7e6      	b.n	2dea <device_get_config_level+0x1a>
    2e1c:	0000cf9c 	.word	0x0000cf9c
    2e20:	0000d8b4 	.word	0x0000d8b4

00002e24 <cmd_device_levels>:
    2e24:	b510      	push	{r4, lr}
    2e26:	2108      	movs	r1, #8
    2e28:	4604      	mov	r4, r0
    2e2a:	4a25      	ldr	r2, [pc, #148]	; (2ec0 <cmd_device_levels+0x9c>)
    2e2c:	f007 fde0 	bl	a9f0 <shell_fprintf>
    2e30:	2100      	movs	r1, #0
    2e32:	4620      	mov	r0, r4
    2e34:	f7ff ffcc 	bl	2dd0 <device_get_config_level>
    2e38:	b920      	cbnz	r0, 2e44 <cmd_device_levels+0x20>
    2e3a:	4a22      	ldr	r2, [pc, #136]	; (2ec4 <cmd_device_levels+0xa0>)
    2e3c:	2108      	movs	r1, #8
    2e3e:	4620      	mov	r0, r4
    2e40:	f007 fdd6 	bl	a9f0 <shell_fprintf>
    2e44:	2108      	movs	r1, #8
    2e46:	4620      	mov	r0, r4
    2e48:	4a1f      	ldr	r2, [pc, #124]	; (2ec8 <cmd_device_levels+0xa4>)
    2e4a:	f007 fdd1 	bl	a9f0 <shell_fprintf>
    2e4e:	2101      	movs	r1, #1
    2e50:	4620      	mov	r0, r4
    2e52:	f7ff ffbd 	bl	2dd0 <device_get_config_level>
    2e56:	b920      	cbnz	r0, 2e62 <cmd_device_levels+0x3e>
    2e58:	4a1a      	ldr	r2, [pc, #104]	; (2ec4 <cmd_device_levels+0xa0>)
    2e5a:	2108      	movs	r1, #8
    2e5c:	4620      	mov	r0, r4
    2e5e:	f007 fdc7 	bl	a9f0 <shell_fprintf>
    2e62:	2108      	movs	r1, #8
    2e64:	4620      	mov	r0, r4
    2e66:	4a19      	ldr	r2, [pc, #100]	; (2ecc <cmd_device_levels+0xa8>)
    2e68:	f007 fdc2 	bl	a9f0 <shell_fprintf>
    2e6c:	2102      	movs	r1, #2
    2e6e:	4620      	mov	r0, r4
    2e70:	f7ff ffae 	bl	2dd0 <device_get_config_level>
    2e74:	b920      	cbnz	r0, 2e80 <cmd_device_levels+0x5c>
    2e76:	4a13      	ldr	r2, [pc, #76]	; (2ec4 <cmd_device_levels+0xa0>)
    2e78:	2108      	movs	r1, #8
    2e7a:	4620      	mov	r0, r4
    2e7c:	f007 fdb8 	bl	a9f0 <shell_fprintf>
    2e80:	2108      	movs	r1, #8
    2e82:	4620      	mov	r0, r4
    2e84:	4a12      	ldr	r2, [pc, #72]	; (2ed0 <cmd_device_levels+0xac>)
    2e86:	f007 fdb3 	bl	a9f0 <shell_fprintf>
    2e8a:	2103      	movs	r1, #3
    2e8c:	4620      	mov	r0, r4
    2e8e:	f7ff ff9f 	bl	2dd0 <device_get_config_level>
    2e92:	b920      	cbnz	r0, 2e9e <cmd_device_levels+0x7a>
    2e94:	4a0b      	ldr	r2, [pc, #44]	; (2ec4 <cmd_device_levels+0xa0>)
    2e96:	2108      	movs	r1, #8
    2e98:	4620      	mov	r0, r4
    2e9a:	f007 fda9 	bl	a9f0 <shell_fprintf>
    2e9e:	2108      	movs	r1, #8
    2ea0:	4620      	mov	r0, r4
    2ea2:	4a0c      	ldr	r2, [pc, #48]	; (2ed4 <cmd_device_levels+0xb0>)
    2ea4:	f007 fda4 	bl	a9f0 <shell_fprintf>
    2ea8:	2104      	movs	r1, #4
    2eaa:	4620      	mov	r0, r4
    2eac:	f7ff ff90 	bl	2dd0 <device_get_config_level>
    2eb0:	b920      	cbnz	r0, 2ebc <cmd_device_levels+0x98>
    2eb2:	4a04      	ldr	r2, [pc, #16]	; (2ec4 <cmd_device_levels+0xa0>)
    2eb4:	2108      	movs	r1, #8
    2eb6:	4620      	mov	r0, r4
    2eb8:	f007 fd9a 	bl	a9f0 <shell_fprintf>
    2ebc:	2000      	movs	r0, #0
    2ebe:	bd10      	pop	{r4, pc}
    2ec0:	0000d8ba 	.word	0x0000d8ba
    2ec4:	0000d8c2 	.word	0x0000d8c2
    2ec8:	0000d8ca 	.word	0x0000d8ca
    2ecc:	0000d8d9 	.word	0x0000d8d9
    2ed0:	0000d8e8 	.word	0x0000d8e8
    2ed4:	0000d8f6 	.word	0x0000d8f6

00002ed8 <cmd_devmem>:
    2ed8:	1e8b      	subs	r3, r1, #2
    2eda:	2b02      	cmp	r3, #2
    2edc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    2ee0:	4607      	mov	r7, r0
    2ee2:	4688      	mov	r8, r1
    2ee4:	4614      	mov	r4, r2
    2ee6:	d837      	bhi.n	2f58 <cmd_devmem+0x80>
    2ee8:	6860      	ldr	r0, [r4, #4]
    2eea:	2210      	movs	r2, #16
    2eec:	2100      	movs	r1, #0
    2eee:	f006 f883 	bl	8ff8 <strtoul>
    2ef2:	f1b8 0f02 	cmp.w	r8, #2
    2ef6:	4606      	mov	r6, r0
    2ef8:	d107      	bne.n	2f0a <cmd_devmem+0x32>
    2efa:	4a26      	ldr	r2, [pc, #152]	; (2f94 <cmd_devmem+0xbc>)
    2efc:	2320      	movs	r3, #32
    2efe:	2108      	movs	r1, #8
    2f00:	4638      	mov	r0, r7
    2f02:	f007 fd75 	bl	a9f0 <shell_fprintf>
    2f06:	6833      	ldr	r3, [r6, #0]
    2f08:	e016      	b.n	2f38 <cmd_devmem+0x60>
    2f0a:	220a      	movs	r2, #10
    2f0c:	2100      	movs	r1, #0
    2f0e:	68a0      	ldr	r0, [r4, #8]
    2f10:	f006 f872 	bl	8ff8 <strtoul>
    2f14:	b2c5      	uxtb	r5, r0
    2f16:	4a1f      	ldr	r2, [pc, #124]	; (2f94 <cmd_devmem+0xbc>)
    2f18:	462b      	mov	r3, r5
    2f1a:	2108      	movs	r1, #8
    2f1c:	4638      	mov	r0, r7
    2f1e:	f007 fd67 	bl	a9f0 <shell_fprintf>
    2f22:	f1b8 0f04 	cmp.w	r8, #4
    2f26:	d01a      	beq.n	2f5e <cmd_devmem+0x86>
    2f28:	2d10      	cmp	r5, #16
    2f2a:	d00d      	beq.n	2f48 <cmd_devmem+0x70>
    2f2c:	2d20      	cmp	r5, #32
    2f2e:	d0ea      	beq.n	2f06 <cmd_devmem+0x2e>
    2f30:	2d08      	cmp	r5, #8
    2f32:	d10c      	bne.n	2f4e <cmd_devmem+0x76>
    2f34:	7833      	ldrb	r3, [r6, #0]
    2f36:	b2db      	uxtb	r3, r3
    2f38:	4a17      	ldr	r2, [pc, #92]	; (2f98 <cmd_devmem+0xc0>)
    2f3a:	2108      	movs	r1, #8
    2f3c:	4638      	mov	r0, r7
    2f3e:	f007 fd57 	bl	a9f0 <shell_fprintf>
    2f42:	2000      	movs	r0, #0
    2f44:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    2f48:	8833      	ldrh	r3, [r6, #0]
    2f4a:	b29b      	uxth	r3, r3
    2f4c:	e7f4      	b.n	2f38 <cmd_devmem+0x60>
    2f4e:	4a13      	ldr	r2, [pc, #76]	; (2f9c <cmd_devmem+0xc4>)
    2f50:	2108      	movs	r1, #8
    2f52:	4638      	mov	r0, r7
    2f54:	f007 fd4c 	bl	a9f0 <shell_fprintf>
    2f58:	f06f 0015 	mvn.w	r0, #21
    2f5c:	e7f2      	b.n	2f44 <cmd_devmem+0x6c>
    2f5e:	68e0      	ldr	r0, [r4, #12]
    2f60:	2210      	movs	r2, #16
    2f62:	2100      	movs	r1, #0
    2f64:	f006 f848 	bl	8ff8 <strtoul>
    2f68:	4a0d      	ldr	r2, [pc, #52]	; (2fa0 <cmd_devmem+0xc8>)
    2f6a:	4603      	mov	r3, r0
    2f6c:	4604      	mov	r4, r0
    2f6e:	2108      	movs	r1, #8
    2f70:	4638      	mov	r0, r7
    2f72:	f007 fd3d 	bl	a9f0 <shell_fprintf>
    2f76:	2d10      	cmp	r5, #16
    2f78:	d006      	beq.n	2f88 <cmd_devmem+0xb0>
    2f7a:	2d20      	cmp	r5, #32
    2f7c:	d007      	beq.n	2f8e <cmd_devmem+0xb6>
    2f7e:	2d08      	cmp	r5, #8
    2f80:	d1e5      	bne.n	2f4e <cmd_devmem+0x76>
    2f82:	b2e4      	uxtb	r4, r4
    2f84:	7034      	strb	r4, [r6, #0]
    2f86:	e7dc      	b.n	2f42 <cmd_devmem+0x6a>
    2f88:	b2a4      	uxth	r4, r4
    2f8a:	8034      	strh	r4, [r6, #0]
    2f8c:	e7d9      	b.n	2f42 <cmd_devmem+0x6a>
    2f8e:	6034      	str	r4, [r6, #0]
    2f90:	e7d7      	b.n	2f42 <cmd_devmem+0x6a>
    2f92:	bf00      	nop
    2f94:	0000d95a 	.word	0x0000d95a
    2f98:	0000d985 	.word	0x0000d985
    2f9c:	0000d96f 	.word	0x0000d96f
    2fa0:	0000d996 	.word	0x0000d996

00002fa4 <cmd_dump>:
    2fa4:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2fa8:	4b57      	ldr	r3, [pc, #348]	; (3108 <cmd_dump+0x164>)
    2faa:	f8df a160 	ldr.w	sl, [pc, #352]	; 310c <cmd_dump+0x168>
    2fae:	4691      	mov	r9, r2
    2fb0:	f04f 35ff 	mov.w	r5, #4294967295	; 0xffffffff
    2fb4:	2201      	movs	r2, #1
    2fb6:	b085      	sub	sp, #20
    2fb8:	4607      	mov	r7, r0
    2fba:	4688      	mov	r8, r1
    2fbc:	601a      	str	r2, [r3, #0]
    2fbe:	2620      	movs	r6, #32
    2fc0:	462c      	mov	r4, r5
    2fc2:	4649      	mov	r1, r9
    2fc4:	4652      	mov	r2, sl
    2fc6:	4640      	mov	r0, r8
    2fc8:	f7fe ff4c 	bl	1e64 <getopt>
    2fcc:	1c41      	adds	r1, r0, #1
    2fce:	d107      	bne.n	2fe0 <cmd_dump+0x3c>
    2fd0:	1c6a      	adds	r2, r5, #1
    2fd2:	d14f      	bne.n	3074 <cmd_dump+0xd0>
    2fd4:	4a4e      	ldr	r2, [pc, #312]	; (3110 <cmd_dump+0x16c>)
    2fd6:	2101      	movs	r1, #1
    2fd8:	4638      	mov	r0, r7
    2fda:	f007 fd09 	bl	a9f0 <shell_fprintf>
    2fde:	e01c      	b.n	301a <cmd_dump+0x76>
    2fe0:	2873      	cmp	r0, #115	; 0x73
    2fe2:	d01f      	beq.n	3024 <cmd_dump+0x80>
    2fe4:	2877      	cmp	r0, #119	; 0x77
    2fe6:	d031      	beq.n	304c <cmd_dump+0xa8>
    2fe8:	2861      	cmp	r0, #97	; 0x61
    2fea:	d116      	bne.n	301a <cmd_dump+0x76>
    2fec:	f8df b124 	ldr.w	fp, [pc, #292]	; 3114 <cmd_dump+0x170>
    2ff0:	2210      	movs	r2, #16
    2ff2:	f8db 0000 	ldr.w	r0, [fp]
    2ff6:	2100      	movs	r1, #0
    2ff8:	f005 fffe 	bl	8ff8 <strtoul>
    2ffc:	4605      	mov	r5, r0
    2ffe:	2800      	cmp	r0, #0
    3000:	d1df      	bne.n	2fc2 <cmd_dump+0x1e>
    3002:	f008 f98a 	bl	b31a <__errno>
    3006:	6803      	ldr	r3, [r0, #0]
    3008:	2b16      	cmp	r3, #22
    300a:	d1da      	bne.n	2fc2 <cmd_dump+0x1e>
    300c:	f8db 3000 	ldr.w	r3, [fp]
    3010:	4a41      	ldr	r2, [pc, #260]	; (3118 <cmd_dump+0x174>)
    3012:	2101      	movs	r1, #1
    3014:	4638      	mov	r0, r7
    3016:	f007 fceb 	bl	a9f0 <shell_fprintf>
    301a:	f06f 0015 	mvn.w	r0, #21
    301e:	b005      	add	sp, #20
    3020:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3024:	f8df b0ec 	ldr.w	fp, [pc, #236]	; 3114 <cmd_dump+0x170>
    3028:	2200      	movs	r2, #0
    302a:	f8db 0000 	ldr.w	r0, [fp]
    302e:	4611      	mov	r1, r2
    3030:	f005 ffe2 	bl	8ff8 <strtoul>
    3034:	4604      	mov	r4, r0
    3036:	2800      	cmp	r0, #0
    3038:	d1c3      	bne.n	2fc2 <cmd_dump+0x1e>
    303a:	f008 f96e 	bl	b31a <__errno>
    303e:	6803      	ldr	r3, [r0, #0]
    3040:	2b16      	cmp	r3, #22
    3042:	d1be      	bne.n	2fc2 <cmd_dump+0x1e>
    3044:	f8db 3000 	ldr.w	r3, [fp]
    3048:	4a34      	ldr	r2, [pc, #208]	; (311c <cmd_dump+0x178>)
    304a:	e7e2      	b.n	3012 <cmd_dump+0x6e>
    304c:	f8df b0c4 	ldr.w	fp, [pc, #196]	; 3114 <cmd_dump+0x170>
    3050:	2200      	movs	r2, #0
    3052:	f8db 0000 	ldr.w	r0, [fp]
    3056:	4611      	mov	r1, r2
    3058:	f005 ffce 	bl	8ff8 <strtoul>
    305c:	4606      	mov	r6, r0
    305e:	2800      	cmp	r0, #0
    3060:	d1af      	bne.n	2fc2 <cmd_dump+0x1e>
    3062:	f008 f95a 	bl	b31a <__errno>
    3066:	6803      	ldr	r3, [r0, #0]
    3068:	2b16      	cmp	r3, #22
    306a:	d1aa      	bne.n	2fc2 <cmd_dump+0x1e>
    306c:	f8db 3000 	ldr.w	r3, [fp]
    3070:	4a2b      	ldr	r2, [pc, #172]	; (3120 <cmd_dump+0x17c>)
    3072:	e7ce      	b.n	3012 <cmd_dump+0x6e>
    3074:	1c63      	adds	r3, r4, #1
    3076:	d101      	bne.n	307c <cmd_dump+0xd8>
    3078:	4a2a      	ldr	r2, [pc, #168]	; (3124 <cmd_dump+0x180>)
    307a:	e7ac      	b.n	2fd6 <cmd_dump+0x32>
    307c:	fa5f f886 	uxtb.w	r8, r6
    3080:	f3c6 06c4 	ubfx	r6, r6, #3, #5
    3084:	2c00      	cmp	r4, #0
    3086:	d03c      	beq.n	3102 <cmd_dump+0x15e>
    3088:	466b      	mov	r3, sp
    308a:	4629      	mov	r1, r5
    308c:	461a      	mov	r2, r3
    308e:	eba6 0c05 	sub.w	ip, r6, r5
    3092:	e00c      	b.n	30ae <cmd_dump+0x10a>
    3094:	f1b8 0f10 	cmp.w	r8, #16
    3098:	d01d      	beq.n	30d6 <cmd_dump+0x132>
    309a:	f1b8 0f20 	cmp.w	r8, #32
    309e:	d020      	beq.n	30e2 <cmd_dump+0x13e>
    30a0:	f1b8 0f08 	cmp.w	r8, #8
    30a4:	d12a      	bne.n	30fc <cmd_dump+0x158>
    30a6:	7808      	ldrb	r0, [r1, #0]
    30a8:	7018      	strb	r0, [r3, #0]
    30aa:	4431      	add	r1, r6
    30ac:	4433      	add	r3, r6
    30ae:	42a6      	cmp	r6, r4
    30b0:	d803      	bhi.n	30ba <cmd_dump+0x116>
    30b2:	eb0c 0001 	add.w	r0, ip, r1
    30b6:	2810      	cmp	r0, #16
    30b8:	d9ec      	bls.n	3094 <cmd_dump+0xf0>
    30ba:	2c10      	cmp	r4, #16
    30bc:	46a1      	mov	r9, r4
    30be:	bf28      	it	cs
    30c0:	f04f 0910 	movcs.w	r9, #16
    30c4:	4629      	mov	r1, r5
    30c6:	464b      	mov	r3, r9
    30c8:	4638      	mov	r0, r7
    30ca:	f001 f81b 	bl	4104 <shell_hexdump_line>
    30ce:	3510      	adds	r5, #16
    30d0:	eba4 0409 	sub.w	r4, r4, r9
    30d4:	e7d6      	b.n	3084 <cmd_dump+0xe0>
    30d6:	8808      	ldrh	r0, [r1, #0]
    30d8:	b280      	uxth	r0, r0
    30da:	7018      	strb	r0, [r3, #0]
    30dc:	0a00      	lsrs	r0, r0, #8
    30de:	7058      	strb	r0, [r3, #1]
    30e0:	e7e3      	b.n	30aa <cmd_dump+0x106>
    30e2:	6808      	ldr	r0, [r1, #0]
    30e4:	7018      	strb	r0, [r3, #0]
    30e6:	ea4f 2e10 	mov.w	lr, r0, lsr #8
    30ea:	f883 e001 	strb.w	lr, [r3, #1]
    30ee:	ea4f 4e10 	mov.w	lr, r0, lsr #16
    30f2:	0e00      	lsrs	r0, r0, #24
    30f4:	f883 e002 	strb.w	lr, [r3, #2]
    30f8:	70d8      	strb	r0, [r3, #3]
    30fa:	e7d6      	b.n	30aa <cmd_dump+0x106>
    30fc:	4a0a      	ldr	r2, [pc, #40]	; (3128 <cmd_dump+0x184>)
    30fe:	2108      	movs	r1, #8
    3100:	e76a      	b.n	2fd8 <cmd_dump+0x34>
    3102:	4620      	mov	r0, r4
    3104:	e78b      	b.n	301e <cmd_dump+0x7a>
    3106:	bf00      	nop
    3108:	2000001c 	.word	0x2000001c
    310c:	0000d9e4 	.word	0x0000d9e4
    3110:	0000d9eb 	.word	0x0000d9eb
    3114:	20000830 	.word	0x20000830
    3118:	0000d9aa 	.word	0x0000d9aa
    311c:	0000d9bd 	.word	0x0000d9bd
    3120:	0000d9d0 	.word	0x0000d9d0
    3124:	0000da08 	.word	0x0000da08
    3128:	0000d96f 	.word	0x0000d96f

0000312c <set_bypass.isra.0>:
    312c:	b570      	push	{r4, r5, r6, lr}
    312e:	4e10      	ldr	r6, [pc, #64]	; (3170 <set_bypass.isra.0+0x44>)
    3130:	4604      	mov	r4, r0
    3132:	7833      	ldrb	r3, [r6, #0]
    3134:	460d      	mov	r5, r1
    3136:	b181      	cbz	r1, 315a <set_bypass.isra.0+0x2e>
    3138:	b12b      	cbz	r3, 3146 <set_bypass.isra.0+0x1a>
    313a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    313e:	4a0d      	ldr	r2, [pc, #52]	; (3174 <set_bypass.isra.0+0x48>)
    3140:	2101      	movs	r1, #1
    3142:	f007 bc55 	b.w	a9f0 <shell_fprintf>
    3146:	2301      	movs	r3, #1
    3148:	7033      	strb	r3, [r6, #0]
    314a:	4a0b      	ldr	r2, [pc, #44]	; (3178 <set_bypass.isra.0+0x4c>)
    314c:	2108      	movs	r1, #8
    314e:	4620      	mov	r0, r4
    3150:	f007 fc4e 	bl	a9f0 <shell_fprintf>
    3154:	2301      	movs	r3, #1
    3156:	7033      	strb	r3, [r6, #0]
    3158:	e004      	b.n	3164 <set_bypass.isra.0+0x38>
    315a:	f083 0301 	eor.w	r3, r3, #1
    315e:	7033      	strb	r3, [r6, #0]
    3160:	2b00      	cmp	r3, #0
    3162:	d1f2      	bne.n	314a <set_bypass.isra.0+0x1e>
    3164:	4629      	mov	r1, r5
    3166:	4620      	mov	r0, r4
    3168:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    316c:	f007 bc4d 	b.w	aa0a <shell_set_bypass>
    3170:	20001871 	.word	0x20001871
    3174:	0000da22 	.word	0x0000da22
    3178:	0000da5d 	.word	0x0000da5d

0000317c <bypass_cb>:
    317c:	b570      	push	{r4, r5, r6, lr}
    317e:	4604      	mov	r4, r0
    3180:	483c      	ldr	r0, [pc, #240]	; (3274 <bypass_cb+0xf8>)
    3182:	7803      	ldrb	r3, [r0, #0]
    3184:	2b18      	cmp	r3, #24
    3186:	d102      	bne.n	318e <bypass_cb+0x12>
    3188:	780b      	ldrb	r3, [r1, #0]
    318a:	2b11      	cmp	r3, #17
    318c:	d031      	beq.n	31f2 <bypass_cb+0x76>
    318e:	3a01      	subs	r2, #1
    3190:	460b      	mov	r3, r1
    3192:	188d      	adds	r5, r1, r2
    3194:	42ab      	cmp	r3, r5
    3196:	d125      	bne.n	31e4 <bypass_cb+0x68>
    3198:	5c8b      	ldrb	r3, [r1, r2]
    319a:	780a      	ldrb	r2, [r1, #0]
    319c:	7003      	strb	r3, [r0, #0]
    319e:	f1a2 0330 	sub.w	r3, r2, #48	; 0x30
    31a2:	2b09      	cmp	r3, #9
    31a4:	4c34      	ldr	r4, [pc, #208]	; (3278 <bypass_cb+0xfc>)
    31a6:	d904      	bls.n	31b2 <bypass_cb+0x36>
    31a8:	f022 0320 	bic.w	r3, r2, #32
    31ac:	3b41      	subs	r3, #65	; 0x41
    31ae:	2b05      	cmp	r3, #5
    31b0:	d804      	bhi.n	31bc <bypass_cb+0x40>
    31b2:	6823      	ldr	r3, [r4, #0]
    31b4:	4931      	ldr	r1, [pc, #196]	; (327c <bypass_cb+0x100>)
    31b6:	54ca      	strb	r2, [r1, r3]
    31b8:	3301      	adds	r3, #1
    31ba:	6023      	str	r3, [r4, #0]
    31bc:	6823      	ldr	r3, [r4, #0]
    31be:	2b02      	cmp	r3, #2
    31c0:	d134      	bne.n	322c <bypass_cb+0xb0>
    31c2:	2210      	movs	r2, #16
    31c4:	482d      	ldr	r0, [pc, #180]	; (327c <bypass_cb+0x100>)
    31c6:	2100      	movs	r1, #0
    31c8:	f005 ff16 	bl	8ff8 <strtoul>
    31cc:	4a2c      	ldr	r2, [pc, #176]	; (3280 <bypass_cb+0x104>)
    31ce:	6813      	ldr	r3, [r2, #0]
    31d0:	f803 0b01 	strb.w	r0, [r3], #1
    31d4:	6013      	str	r3, [r2, #0]
    31d6:	4a2b      	ldr	r2, [pc, #172]	; (3284 <bypass_cb+0x108>)
    31d8:	6813      	ldr	r3, [r2, #0]
    31da:	3301      	adds	r3, #1
    31dc:	6013      	str	r3, [r2, #0]
    31de:	2300      	movs	r3, #0
    31e0:	6023      	str	r3, [r4, #0]
    31e2:	e023      	b.n	322c <bypass_cb+0xb0>
    31e4:	f813 6b01 	ldrb.w	r6, [r3], #1
    31e8:	2e18      	cmp	r6, #24
    31ea:	d1d3      	bne.n	3194 <bypass_cb+0x18>
    31ec:	781e      	ldrb	r6, [r3, #0]
    31ee:	2e11      	cmp	r6, #17
    31f0:	d1d0      	bne.n	3194 <bypass_cb+0x18>
    31f2:	4d24      	ldr	r5, [pc, #144]	; (3284 <bypass_cb+0x108>)
    31f4:	4a24      	ldr	r2, [pc, #144]	; (3288 <bypass_cb+0x10c>)
    31f6:	682b      	ldr	r3, [r5, #0]
    31f8:	2108      	movs	r1, #8
    31fa:	4620      	mov	r0, r4
    31fc:	f007 fbf8 	bl	a9f0 <shell_fprintf>
    3200:	4620      	mov	r0, r4
    3202:	2100      	movs	r1, #0
    3204:	f7ff ff92 	bl	312c <set_bypass.isra.0>
    3208:	4b20      	ldr	r3, [pc, #128]	; (328c <bypass_cb+0x110>)
    320a:	7818      	ldrb	r0, [r3, #0]
    320c:	b970      	cbnz	r0, 322c <bypass_cb+0xb0>
    320e:	4a20      	ldr	r2, [pc, #128]	; (3290 <bypass_cb+0x114>)
    3210:	682b      	ldr	r3, [r5, #0]
    3212:	6811      	ldr	r1, [r2, #0]
    3214:	2b04      	cmp	r3, #4
    3216:	dc0a      	bgt.n	322e <bypass_cb+0xb2>
    3218:	b108      	cbz	r0, 321e <bypass_cb+0xa2>
    321a:	6011      	str	r1, [r2, #0]
    321c:	602b      	str	r3, [r5, #0]
    321e:	f013 0103 	ands.w	r1, r3, #3
    3222:	d10b      	bne.n	323c <bypass_cb+0xc0>
    3224:	6812      	ldr	r2, [r2, #0]
    3226:	6813      	ldr	r3, [r2, #0]
    3228:	ba1b      	rev	r3, r3
    322a:	6013      	str	r3, [r2, #0]
    322c:	bd70      	pop	{r4, r5, r6, pc}
    322e:	6808      	ldr	r0, [r1, #0]
    3230:	ba00      	rev	r0, r0
    3232:	f841 0b04 	str.w	r0, [r1], #4
    3236:	3b04      	subs	r3, #4
    3238:	2001      	movs	r0, #1
    323a:	e7eb      	b.n	3214 <bypass_cb+0x98>
    323c:	425b      	negs	r3, r3
    323e:	f003 0303 	and.w	r3, r3, #3
    3242:	bf58      	it	pl
    3244:	4259      	negpl	r1, r3
    3246:	2902      	cmp	r1, #2
    3248:	d104      	bne.n	3254 <bypass_cb+0xd8>
    324a:	6812      	ldr	r2, [r2, #0]
    324c:	8813      	ldrh	r3, [r2, #0]
    324e:	ba5b      	rev16	r3, r3
    3250:	b29b      	uxth	r3, r3
    3252:	e7ea      	b.n	322a <bypass_cb+0xae>
    3254:	2903      	cmp	r1, #3
    3256:	d1e9      	bne.n	322c <bypass_cb+0xb0>
    3258:	6810      	ldr	r0, [r2, #0]
    325a:	6802      	ldr	r2, [r0, #0]
    325c:	0411      	lsls	r1, r2, #16
    325e:	f3c2 4307 	ubfx	r3, r2, #16, #8
    3262:	f401 017f 	and.w	r1, r1, #16711680	; 0xff0000
    3266:	430b      	orrs	r3, r1
    3268:	f402 427f 	and.w	r2, r2, #65280	; 0xff00
    326c:	4313      	orrs	r3, r2
    326e:	6003      	str	r3, [r0, #0]
    3270:	e7dc      	b.n	322c <bypass_cb+0xb0>
    3272:	bf00      	nop
    3274:	20001872 	.word	0x20001872
    3278:	2000083c 	.word	0x2000083c
    327c:	20001874 	.word	0x20001874
    3280:	20000848 	.word	0x20000848
    3284:	20000840 	.word	0x20000840
    3288:	0000da87 	.word	0x0000da87
    328c:	20001873 	.word	0x20001873
    3290:	20000844 	.word	0x20000844

00003294 <cmd_load>:
    3294:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3298:	460d      	mov	r5, r1
    329a:	492b      	ldr	r1, [pc, #172]	; (3348 <cmd_load+0xb4>)
    329c:	f8df 80ac 	ldr.w	r8, [pc, #172]	; 334c <cmd_load+0xb8>
    32a0:	f8df 90ac 	ldr.w	r9, [pc, #172]	; 3350 <cmd_load+0xbc>
    32a4:	f8df b0ac 	ldr.w	fp, [pc, #172]	; 3354 <cmd_load+0xc0>
    32a8:	2300      	movs	r3, #0
    32aa:	600b      	str	r3, [r1, #0]
    32ac:	492a      	ldr	r1, [pc, #168]	; (3358 <cmd_load+0xc4>)
    32ae:	f888 3000 	strb.w	r3, [r8]
    32b2:	4606      	mov	r6, r0
    32b4:	600b      	str	r3, [r1, #0]
    32b6:	4614      	mov	r4, r2
    32b8:	2d01      	cmp	r5, #1
    32ba:	4627      	mov	r7, r4
    32bc:	f854 af04 	ldr.w	sl, [r4, #4]!
    32c0:	d91e      	bls.n	3300 <cmd_load+0x6c>
    32c2:	2202      	movs	r2, #2
    32c4:	4649      	mov	r1, r9
    32c6:	4650      	mov	r0, sl
    32c8:	f008 ffa0 	bl	c20c <strncmp>
    32cc:	b980      	cbnz	r0, 32f0 <cmd_load+0x5c>
    32ce:	6822      	ldr	r2, [r4, #0]
    32d0:	7892      	ldrb	r2, [r2, #2]
    32d2:	3a00      	subs	r2, #0
    32d4:	bf18      	it	ne
    32d6:	2201      	movne	r2, #1
    32d8:	4492      	add	sl, r2
    32da:	4920      	ldr	r1, [pc, #128]	; (335c <cmd_load+0xc8>)
    32dc:	2202      	movs	r2, #2
    32de:	4650      	mov	r0, sl
    32e0:	f008 ff94 	bl	c20c <strncmp>
    32e4:	b930      	cbnz	r0, 32f4 <cmd_load+0x60>
    32e6:	2301      	movs	r3, #1
    32e8:	f888 3000 	strb.w	r3, [r8]
    32ec:	3d01      	subs	r5, #1
    32ee:	e7e3      	b.n	32b8 <cmd_load+0x24>
    32f0:	2200      	movs	r2, #0
    32f2:	e7f1      	b.n	32d8 <cmd_load+0x44>
    32f4:	4649      	mov	r1, r9
    32f6:	4650      	mov	r0, sl
    32f8:	f7fe fbd6 	bl	1aa8 <strcmp>
    32fc:	b9a8      	cbnz	r0, 332a <cmd_load+0x96>
    32fe:	3704      	adds	r7, #4
    3300:	2200      	movs	r2, #0
    3302:	4611      	mov	r1, r2
    3304:	6878      	ldr	r0, [r7, #4]
    3306:	f005 fdfb 	bl	8f00 <strtol>
    330a:	4b15      	ldr	r3, [pc, #84]	; (3360 <cmd_load+0xcc>)
    330c:	2200      	movs	r2, #0
    330e:	4611      	mov	r1, r2
    3310:	6018      	str	r0, [r3, #0]
    3312:	6878      	ldr	r0, [r7, #4]
    3314:	f005 fdf4 	bl	8f00 <strtol>
    3318:	4b12      	ldr	r3, [pc, #72]	; (3364 <cmd_load+0xd0>)
    331a:	4913      	ldr	r1, [pc, #76]	; (3368 <cmd_load+0xd4>)
    331c:	6018      	str	r0, [r3, #0]
    331e:	4630      	mov	r0, r6
    3320:	f7ff ff04 	bl	312c <set_bypass.isra.0>
    3324:	2000      	movs	r0, #0
    3326:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    332a:	f89a 2000 	ldrb.w	r2, [sl]
    332e:	2a2d      	cmp	r2, #45	; 0x2d
    3330:	d1e6      	bne.n	3300 <cmd_load+0x6c>
    3332:	f89a 2001 	ldrb.w	r2, [sl, #1]
    3336:	2a00      	cmp	r2, #0
    3338:	d0e2      	beq.n	3300 <cmd_load+0x6c>
    333a:	4653      	mov	r3, sl
    333c:	465a      	mov	r2, fp
    333e:	2108      	movs	r1, #8
    3340:	4630      	mov	r0, r6
    3342:	f007 fb55 	bl	a9f0 <shell_fprintf>
    3346:	e7d1      	b.n	32ec <cmd_load+0x58>
    3348:	2000083c 	.word	0x2000083c
    334c:	20001873 	.word	0x20001873
    3350:	0000daa1 	.word	0x0000daa1
    3354:	0000daa7 	.word	0x0000daa7
    3358:	20000840 	.word	0x20000840
    335c:	0000daa4 	.word	0x0000daa4
    3360:	20000848 	.word	0x20000848
    3364:	20000844 	.word	0x20000844
    3368:	0000317d 	.word	0x0000317d

0000336c <enable_shell_uart>:
    336c:	b513      	push	{r0, r1, r4, lr}
    336e:	4809      	ldr	r0, [pc, #36]	; (3394 <enable_shell_uart+0x28>)
    3370:	f008 fb47 	bl	ba02 <z_device_is_ready>
    3374:	b158      	cbz	r0, 338e <enable_shell_uart+0x22>
    3376:	4a08      	ldr	r2, [pc, #32]	; (3398 <enable_shell_uart+0x2c>)
    3378:	4906      	ldr	r1, [pc, #24]	; (3394 <enable_shell_uart+0x28>)
    337a:	6812      	ldr	r2, [r2, #0]
    337c:	4807      	ldr	r0, [pc, #28]	; (339c <enable_shell_uart+0x30>)
    337e:	2400      	movs	r4, #0
    3380:	9400      	str	r4, [sp, #0]
    3382:	2301      	movs	r3, #1
    3384:	f000 fda4 	bl	3ed0 <shell_init>
    3388:	4620      	mov	r0, r4
    338a:	b002      	add	sp, #8
    338c:	bd10      	pop	{r4, pc}
    338e:	f06f 0012 	mvn.w	r0, #18
    3392:	e7fa      	b.n	338a <enable_shell_uart+0x1e>
    3394:	0000c8b8 	.word	0x0000c8b8
    3398:	0000d008 	.word	0x0000d008
    339c:	0000cb04 	.word	0x0000cb04

000033a0 <init>:
    33a0:	b510      	push	{r4, lr}
    33a2:	4614      	mov	r4, r2
    33a4:	6842      	ldr	r2, [r0, #4]
    33a6:	6810      	ldr	r0, [r2, #0]
    33a8:	6001      	str	r1, [r0, #0]
    33aa:	6811      	ldr	r1, [r2, #0]
    33ac:	604c      	str	r4, [r1, #4]
    33ae:	6811      	ldr	r1, [r2, #0]
    33b0:	608b      	str	r3, [r1, #8]
    33b2:	6813      	ldr	r3, [r2, #0]
    33b4:	6891      	ldr	r1, [r2, #8]
    33b6:	681c      	ldr	r4, [r3, #0]
    33b8:	2300      	movs	r3, #0
    33ba:	e9c1 3302 	strd	r3, r3, [r1, #8]
    33be:	e9c1 3305 	strd	r3, r3, [r1, #20]
    33c2:	604b      	str	r3, [r1, #4]
    33c4:	610b      	str	r3, [r1, #16]
    33c6:	68d1      	ldr	r1, [r2, #12]
    33c8:	e9c1 3302 	strd	r3, r3, [r1, #8]
    33cc:	e9c1 3305 	strd	r3, r3, [r1, #20]
    33d0:	604b      	str	r3, [r1, #4]
    33d2:	610b      	str	r3, [r1, #16]
    33d4:	6811      	ldr	r1, [r2, #0]
    33d6:	60cb      	str	r3, [r1, #12]
    33d8:	68a3      	ldr	r3, [r4, #8]
    33da:	b123      	cbz	r3, 33e6 <init+0x46>
    33dc:	6c9b      	ldr	r3, [r3, #72]	; 0x48
    33de:	b113      	cbz	r3, 33e6 <init+0x46>
    33e0:	4904      	ldr	r1, [pc, #16]	; (33f4 <init+0x54>)
    33e2:	4620      	mov	r0, r4
    33e4:	4798      	blx	r3
    33e6:	68a3      	ldr	r3, [r4, #8]
    33e8:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    33ea:	b10b      	cbz	r3, 33f0 <init+0x50>
    33ec:	4620      	mov	r0, r4
    33ee:	4798      	blx	r3
    33f0:	2000      	movs	r0, #0
    33f2:	bd10      	pop	{r4, pc}
    33f4:	0000a6ef 	.word	0x0000a6ef

000033f8 <enable_shell_dummy>:
    33f8:	b507      	push	{r0, r1, r2, lr}
    33fa:	4a06      	ldr	r2, [pc, #24]	; (3414 <enable_shell_dummy+0x1c>)
    33fc:	4806      	ldr	r0, [pc, #24]	; (3418 <enable_shell_dummy+0x20>)
    33fe:	6812      	ldr	r2, [r2, #0]
    3400:	2303      	movs	r3, #3
    3402:	9300      	str	r3, [sp, #0]
    3404:	2100      	movs	r1, #0
    3406:	2301      	movs	r3, #1
    3408:	f000 fd62 	bl	3ed0 <shell_init>
    340c:	2000      	movs	r0, #0
    340e:	b003      	add	sp, #12
    3410:	f85d fb04 	ldr.w	pc, [sp], #4
    3414:	0000d048 	.word	0x0000d048
    3418:	0000cad8 	.word	0x0000cad8

0000341c <shell_internal_help_print>:
    341c:	b510      	push	{r4, lr}
    341e:	6881      	ldr	r1, [r0, #8]
    3420:	4604      	mov	r4, r0
    3422:	3108      	adds	r1, #8
    3424:	f001 fb0e 	bl	4a44 <z_shell_help_cmd_print>
    3428:	68a1      	ldr	r1, [r4, #8]
    342a:	4a03      	ldr	r2, [pc, #12]	; (3438 <shell_internal_help_print+0x1c>)
    342c:	4620      	mov	r0, r4
    342e:	3108      	adds	r1, #8
    3430:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    3434:	f001 ba96 	b.w	4964 <z_shell_help_subcmd_print>
    3438:	0000dc28 	.word	0x0000dc28

0000343c <z_cursor_next_line_move.isra.0>:
    343c:	4901      	ldr	r1, [pc, #4]	; (3444 <z_cursor_next_line_move.isra.0+0x8>)
    343e:	f007 ba41 	b.w	a8c4 <z_shell_raw_fprintf>
    3442:	bf00      	nop
    3444:	0000d6da 	.word	0x0000d6da

00003448 <history_handle>:
    3448:	b537      	push	{r0, r1, r2, r4, r5, lr}
    344a:	4604      	mov	r4, r0
    344c:	6880      	ldr	r0, [r0, #8]
    344e:	f8d0 3264 	ldr.w	r3, [r0, #612]	; 0x264
    3452:	075a      	lsls	r2, r3, #29
    3454:	460d      	mov	r5, r1
    3456:	d505      	bpl.n	3464 <history_handle+0x1c>
    3458:	2100      	movs	r1, #0
    345a:	f007 fa71 	bl	a940 <z_flag_history_exit_set.isra.0>
    345e:	68e0      	ldr	r0, [r4, #12]
    3460:	f007 fe26 	bl	b0b0 <z_shell_history_mode_exit>
    3464:	68e3      	ldr	r3, [r4, #12]
    3466:	68db      	ldr	r3, [r3, #12]
    3468:	b973      	cbnz	r3, 3488 <history_handle+0x40>
    346a:	2d00      	cmp	r5, #0
    346c:	d039      	beq.n	34e2 <history_handle+0x9a>
    346e:	68a0      	ldr	r0, [r4, #8]
    3470:	3042      	adds	r0, #66	; 0x42
    3472:	f007 fa21 	bl	a8b8 <z_shell_strlen>
    3476:	68a3      	ldr	r3, [r4, #8]
    3478:	2800      	cmp	r0, #0
    347a:	d034      	beq.n	34e6 <history_handle+0x9e>
    347c:	f103 0142 	add.w	r1, r3, #66	; 0x42
    3480:	f503 70a1 	add.w	r0, r3, #322	; 0x142
    3484:	f008 feba 	bl	c1fc <strcpy>
    3488:	68a2      	ldr	r2, [r4, #8]
    348a:	68e0      	ldr	r0, [r4, #12]
    348c:	f10d 0306 	add.w	r3, sp, #6
    3490:	3242      	adds	r2, #66	; 0x42
    3492:	4629      	mov	r1, r5
    3494:	f007 fe0f 	bl	b0b6 <z_shell_history_get>
    3498:	b958      	cbnz	r0, 34b2 <history_handle+0x6a>
    349a:	68a0      	ldr	r0, [r4, #8]
    349c:	f500 71a1 	add.w	r1, r0, #322	; 0x142
    34a0:	3042      	adds	r0, #66	; 0x42
    34a2:	f008 feab 	bl	c1fc <strcpy>
    34a6:	68a0      	ldr	r0, [r4, #8]
    34a8:	3042      	adds	r0, #66	; 0x42
    34aa:	f007 fa05 	bl	a8b8 <z_shell_strlen>
    34ae:	f8ad 0006 	strh.w	r0, [sp, #6]
    34b2:	4620      	mov	r0, r4
    34b4:	f007 fc4a 	bl	ad4c <z_shell_op_cursor_home_move>
    34b8:	68a3      	ldr	r3, [r4, #8]
    34ba:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    34be:	069b      	lsls	r3, r3, #26
    34c0:	d503      	bpl.n	34ca <history_handle+0x82>
    34c2:	490a      	ldr	r1, [pc, #40]	; (34ec <history_handle+0xa4>)
    34c4:	6960      	ldr	r0, [r4, #20]
    34c6:	f007 f9fd 	bl	a8c4 <z_shell_raw_fprintf>
    34ca:	4620      	mov	r0, r4
    34cc:	f001 f8a4 	bl	4618 <z_shell_print_cmd>
    34d0:	68a2      	ldr	r2, [r4, #8]
    34d2:	f8bd 3006 	ldrh.w	r3, [sp, #6]
    34d6:	87d3      	strh	r3, [r2, #62]	; 0x3e
    34d8:	68a2      	ldr	r2, [r4, #8]
    34da:	4620      	mov	r0, r4
    34dc:	8793      	strh	r3, [r2, #60]	; 0x3c
    34de:	f007 fbde 	bl	ac9e <z_shell_op_cond_next_line>
    34e2:	b003      	add	sp, #12
    34e4:	bd30      	pop	{r4, r5, pc}
    34e6:	f883 0142 	strb.w	r0, [r3, #322]	; 0x142
    34ea:	e7cd      	b.n	3488 <history_handle+0x40>
    34ec:	0000cdfd 	.word	0x0000cdfd

000034f0 <state_set.constprop.0>:
    34f0:	b510      	push	{r4, lr}
    34f2:	6883      	ldr	r3, [r0, #8]
    34f4:	2202      	movs	r2, #2
    34f6:	711a      	strb	r2, [r3, #4]
    34f8:	6882      	ldr	r2, [r0, #8]
    34fa:	6b93      	ldr	r3, [r2, #56]	; 0x38
    34fc:	4604      	mov	r4, r0
    34fe:	b9db      	cbnz	r3, 3538 <state_set.constprop.0+0x48>
    3500:	f882 3042 	strb.w	r3, [r2, #66]	; 0x42
    3504:	6882      	ldr	r2, [r0, #8]
    3506:	87d3      	strh	r3, [r2, #62]	; 0x3e
    3508:	6882      	ldr	r2, [r0, #8]
    350a:	8793      	strh	r3, [r2, #60]	; 0x3c
    350c:	6883      	ldr	r3, [r0, #8]
    350e:	f8d3 3264 	ldr.w	r3, [r3, #612]	; 0x264
    3512:	04db      	lsls	r3, r3, #19
    3514:	d50b      	bpl.n	352e <state_set.constprop.0+0x3e>
    3516:	2103      	movs	r1, #3
    3518:	4b08      	ldr	r3, [pc, #32]	; (353c <state_set.constprop.0+0x4c>)
    351a:	4a09      	ldr	r2, [pc, #36]	; (3540 <state_set.constprop.0+0x50>)
    351c:	f007 fcc4 	bl	aea8 <z_shell_fprintf>
    3520:	68a0      	ldr	r0, [r4, #8]
    3522:	f46f 5180 	mvn.w	r1, #4096	; 0x1000
    3526:	f500 7019 	add.w	r0, r0, #612	; 0x264
    352a:	f007 f9a0 	bl	a86e <atomic_and>
    352e:	4620      	mov	r0, r4
    3530:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    3534:	f001 b986 	b.w	4844 <z_shell_print_prompt_and_cmd>
    3538:	bd10      	pop	{r4, pc}
    353a:	bf00      	nop
    353c:	0000dc36 	.word	0x0000dc36
    3540:	0000d8aa 	.word	0x0000d8aa

00003544 <execute>:
    3544:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3548:	b0a7      	sub	sp, #156	; 0x9c
    354a:	4604      	mov	r4, r0
    354c:	2254      	movs	r2, #84	; 0x54
    354e:	2100      	movs	r1, #0
    3550:	a811      	add	r0, sp, #68	; 0x44
    3552:	f008 fe0b 	bl	c16c <memset>
    3556:	2300      	movs	r3, #0
    3558:	e9cd 3305 	strd	r3, r3, [sp, #20]
    355c:	68a3      	ldr	r3, [r4, #8]
    355e:	4620      	mov	r0, r4
    3560:	3342      	adds	r3, #66	; 0x42
    3562:	9302      	str	r3, [sp, #8]
    3564:	f007 fbf8 	bl	ad58 <z_shell_op_cursor_end_move>
    3568:	4620      	mov	r0, r4
    356a:	f007 fb7f 	bl	ac6c <z_shell_cursor_in_empty_line>
    356e:	b910      	cbnz	r0, 3576 <execute+0x32>
    3570:	6960      	ldr	r0, [r4, #20]
    3572:	f7ff ff63 	bl	343c <z_cursor_next_line_move.isra.0>
    3576:	68a0      	ldr	r0, [r4, #8]
    3578:	2214      	movs	r2, #20
    357a:	2100      	movs	r1, #0
    357c:	3008      	adds	r0, #8
    357e:	f008 fdf5 	bl	c16c <memset>
    3582:	4620      	mov	r0, r4
    3584:	f000 ff96 	bl	44b4 <z_shell_cmd_trim>
    3588:	68a1      	ldr	r1, [r4, #8]
    358a:	68e0      	ldr	r0, [r4, #12]
    358c:	8f8a      	ldrh	r2, [r1, #60]	; 0x3c
    358e:	3142      	adds	r1, #66	; 0x42
    3590:	2600      	movs	r6, #0
    3592:	f007 fdc7 	bl	b124 <z_shell_history_put>
    3596:	4620      	mov	r0, r4
    3598:	f007 fe46 	bl	b228 <z_shell_wildcard_prepare>
    359c:	f04f 37ff 	mov.w	r7, #4294967295	; 0xffffffff
    35a0:	46b2      	mov	sl, r6
    35a2:	9603      	str	r6, [sp, #12]
    35a4:	f10d 0844 	add.w	r8, sp, #68	; 0x44
    35a8:	46b3      	mov	fp, r6
    35aa:	4635      	mov	r5, r6
    35ac:	46b1      	mov	r9, r6
    35ae:	e9dd 3205 	ldrd	r3, r2, [sp, #20]
    35b2:	2a01      	cmp	r2, #1
    35b4:	d06d      	beq.n	3692 <execute+0x14e>
    35b6:	2b13      	cmp	r3, #19
    35b8:	d86e      	bhi.n	3698 <execute+0x154>
    35ba:	bb5f      	cbnz	r7, 3614 <execute+0xd0>
    35bc:	f1bb 0f00 	cmp.w	fp, #0
    35c0:	d00a      	beq.n	35d8 <execute+0x94>
    35c2:	4620      	mov	r0, r4
    35c4:	f007 fe51 	bl	b26a <z_shell_wildcard_finalize>
    35c8:	68a2      	ldr	r2, [r4, #8]
    35ca:	2314      	movs	r3, #20
    35cc:	3242      	adds	r2, #66	; 0x42
    35ce:	a911      	add	r1, sp, #68	; 0x44
    35d0:	eb0d 0003 	add.w	r0, sp, r3
    35d4:	f000 fe22 	bl	421c <z_shell_make_argv>
    35d8:	f1b9 0f00 	cmp.w	r9, #0
    35dc:	d00c      	beq.n	35f8 <execute+0xb4>
    35de:	f899 3011 	ldrb.w	r3, [r9, #17]
    35e2:	2bfe      	cmp	r3, #254	; 0xfe
    35e4:	d108      	bne.n	35f8 <execute+0xb4>
    35e6:	9b05      	ldr	r3, [sp, #20]
    35e8:	aa26      	add	r2, sp, #152	; 0x98
    35ea:	eb02 0283 	add.w	r2, r2, r3, lsl #2
    35ee:	f852 2c54 	ldr.w	r2, [r2, #-84]
    35f2:	b10a      	cbz	r2, 35f8 <execute+0xb4>
    35f4:	3301      	adds	r3, #1
    35f6:	9305      	str	r3, [sp, #20]
    35f8:	68a0      	ldr	r0, [r4, #8]
    35fa:	9d05      	ldr	r5, [sp, #20]
    35fc:	6943      	ldr	r3, [r0, #20]
    35fe:	2b00      	cmp	r3, #0
    3600:	f040 80b6 	bne.w	3770 <execute+0x22c>
    3604:	b1ce      	cbz	r6, 363a <execute+0xf6>
    3606:	68c3      	ldr	r3, [r0, #12]
    3608:	429e      	cmp	r6, r3
    360a:	d02d      	beq.n	3668 <execute+0x124>
    360c:	960d      	str	r6, [sp, #52]	; 0x34
    360e:	f100 0508 	add.w	r5, r0, #8
    3612:	e024      	b.n	365e <execute+0x11a>
    3614:	9a02      	ldr	r2, [sp, #8]
    3616:	2302      	movs	r3, #2
    3618:	4641      	mov	r1, r8
    361a:	a806      	add	r0, sp, #24
    361c:	f000 fdfe 	bl	421c <z_shell_make_argv>
    3620:	9906      	ldr	r1, [sp, #24]
    3622:	f8d8 2004 	ldr.w	r2, [r8, #4]
    3626:	9202      	str	r2, [sp, #8]
    3628:	4603      	mov	r3, r0
    362a:	b131      	cbz	r1, 363a <execute+0xf6>
    362c:	2901      	cmp	r1, #1
    362e:	d10a      	bne.n	3646 <execute+0x102>
    3630:	b148      	cbz	r0, 3646 <execute+0x102>
    3632:	4a6f      	ldr	r2, [pc, #444]	; (37f0 <execute+0x2ac>)
    3634:	4620      	mov	r0, r4
    3636:	f007 fc37 	bl	aea8 <z_shell_fprintf>
    363a:	f06f 0507 	mvn.w	r5, #7
    363e:	4628      	mov	r0, r5
    3640:	b027      	add	sp, #156	; 0x9c
    3642:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    3646:	9b05      	ldr	r3, [sp, #20]
    3648:	2b00      	cmp	r3, #0
    364a:	d034      	beq.n	36b6 <execute+0x172>
    364c:	f8d8 0000 	ldr.w	r0, [r8]
    3650:	f001 fa1c 	bl	4a8c <z_shell_help_request>
    3654:	b198      	cbz	r0, 367e <execute+0x13a>
    3656:	b166      	cbz	r6, 3672 <execute+0x12e>
    3658:	68a5      	ldr	r5, [r4, #8]
    365a:	960d      	str	r6, [sp, #52]	; 0x34
    365c:	3508      	adds	r5, #8
    365e:	ae0c      	add	r6, sp, #48	; 0x30
    3660:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
    3662:	c50f      	stmia	r5!, {r0, r1, r2, r3}
    3664:	6833      	ldr	r3, [r6, #0]
    3666:	602b      	str	r3, [r5, #0]
    3668:	4620      	mov	r0, r4
    366a:	f7ff fed7 	bl	341c <shell_internal_help_print>
    366e:	2501      	movs	r5, #1
    3670:	e7e5      	b.n	363e <execute+0xfa>
    3672:	4a60      	ldr	r2, [pc, #384]	; (37f4 <execute+0x2b0>)
    3674:	2101      	movs	r1, #1
    3676:	4620      	mov	r0, r4
    3678:	f007 fc16 	bl	aea8 <z_shell_fprintf>
    367c:	e7dd      	b.n	363a <execute+0xf6>
    367e:	9b05      	ldr	r3, [sp, #20]
    3680:	b1cb      	cbz	r3, 36b6 <execute+0x172>
    3682:	f8d8 2000 	ldr.w	r2, [r8]
    3686:	4629      	mov	r1, r5
    3688:	4620      	mov	r0, r4
    368a:	f001 fb99 	bl	4dc0 <z_shell_wildcard_process>
    368e:	2802      	cmp	r0, #2
    3690:	d109      	bne.n	36a6 <execute+0x162>
    3692:	9b05      	ldr	r3, [sp, #20]
    3694:	2b13      	cmp	r3, #19
    3696:	d991      	bls.n	35bc <execute+0x78>
    3698:	9b06      	ldr	r3, [sp, #24]
    369a:	2b02      	cmp	r3, #2
    369c:	d18e      	bne.n	35bc <execute+0x78>
    369e:	4b56      	ldr	r3, [pc, #344]	; (37f8 <execute+0x2b4>)
    36a0:	4a56      	ldr	r2, [pc, #344]	; (37fc <execute+0x2b8>)
    36a2:	2101      	movs	r1, #1
    36a4:	e7c6      	b.n	3634 <execute+0xf0>
    36a6:	2803      	cmp	r0, #3
    36a8:	d005      	beq.n	36b6 <execute+0x172>
    36aa:	9b05      	ldr	r3, [sp, #20]
    36ac:	3301      	adds	r3, #1
    36ae:	9305      	str	r3, [sp, #20]
    36b0:	f04f 0b01 	mov.w	fp, #1
    36b4:	e77b      	b.n	35ae <execute+0x6a>
    36b6:	9b03      	ldr	r3, [sp, #12]
    36b8:	b933      	cbnz	r3, 36c8 <execute+0x184>
    36ba:	f8d8 1000 	ldr.w	r1, [r8]
    36be:	aa07      	add	r2, sp, #28
    36c0:	4648      	mov	r0, r9
    36c2:	f007 fa2c 	bl	ab1e <z_shell_find_cmd>
    36c6:	4605      	mov	r5, r0
    36c8:	f108 0804 	add.w	r8, r8, #4
    36cc:	3f01      	subs	r7, #1
    36ce:	b39d      	cbz	r5, 3738 <execute+0x1f4>
    36d0:	68eb      	ldr	r3, [r5, #12]
    36d2:	f1bb 0f00 	cmp.w	fp, #0
    36d6:	d008      	beq.n	36ea <execute+0x1a6>
    36d8:	b1f3      	cbz	r3, 3718 <execute+0x1d4>
    36da:	4620      	mov	r0, r4
    36dc:	f007 fb3c 	bl	ad58 <z_shell_op_cursor_end_move>
    36e0:	4620      	mov	r0, r4
    36e2:	f007 fadc 	bl	ac9e <z_shell_op_cond_next_line>
    36e6:	4a46      	ldr	r2, [pc, #280]	; (3800 <execute+0x2bc>)
    36e8:	e7c4      	b.n	3674 <execute+0x130>
    36ea:	b1ab      	cbz	r3, 3718 <execute+0x1d4>
    36ec:	68a3      	ldr	r3, [r4, #8]
    36ee:	f8dd a014 	ldr.w	sl, [sp, #20]
    36f2:	46ae      	mov	lr, r5
    36f4:	f103 0c08 	add.w	ip, r3, #8
    36f8:	e8be 000f 	ldmia.w	lr!, {r0, r1, r2, r3}
    36fc:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
    3700:	f8de 3000 	ldr.w	r3, [lr]
    3704:	f8cc 3000 	str.w	r3, [ip]
    3708:	68ab      	ldr	r3, [r5, #8]
    370a:	b92b      	cbnz	r3, 3718 <execute+0x1d4>
    370c:	7c6b      	ldrb	r3, [r5, #17]
    370e:	2bfe      	cmp	r3, #254	; 0xfe
    3710:	bf04      	itt	eq
    3712:	7c2f      	ldrbeq	r7, [r5, #16]
    3714:	f107 37ff 	addeq.w	r7, r7, #4294967295	; 0xffffffff
    3718:	f8d5 c004 	ldr.w	ip, [r5, #4]
    371c:	f1bc 0f00 	cmp.w	ip, #0
    3720:	d008      	beq.n	3734 <execute+0x1f0>
    3722:	46ae      	mov	lr, r5
    3724:	e8be 000f 	ldmia.w	lr!, {r0, r1, r2, r3}
    3728:	ae0c      	add	r6, sp, #48	; 0x30
    372a:	c60f      	stmia	r6!, {r0, r1, r2, r3}
    372c:	f8de 3000 	ldr.w	r3, [lr]
    3730:	6033      	str	r3, [r6, #0]
    3732:	4666      	mov	r6, ip
    3734:	46a9      	mov	r9, r5
    3736:	e003      	b.n	3740 <execute+0x1fc>
    3738:	9b05      	ldr	r3, [sp, #20]
    373a:	b153      	cbz	r3, 3752 <execute+0x20e>
    373c:	2301      	movs	r3, #1
    373e:	9303      	str	r3, [sp, #12]
    3740:	9b06      	ldr	r3, [sp, #24]
    3742:	b917      	cbnz	r7, 374a <execute+0x206>
    3744:	2b02      	cmp	r3, #2
    3746:	f47f af32 	bne.w	35ae <execute+0x6a>
    374a:	9b05      	ldr	r3, [sp, #20]
    374c:	3301      	adds	r3, #1
    374e:	9305      	str	r3, [sp, #20]
    3750:	e72d      	b.n	35ae <execute+0x6a>
    3752:	68a3      	ldr	r3, [r4, #8]
    3754:	69db      	ldr	r3, [r3, #28]
    3756:	b113      	cbz	r3, 375e <execute+0x21a>
    3758:	68db      	ldr	r3, [r3, #12]
    375a:	2b00      	cmp	r3, #0
    375c:	d1ee      	bne.n	373c <execute+0x1f8>
    375e:	4b29      	ldr	r3, [pc, #164]	; (3804 <execute+0x2c0>)
    3760:	9300      	str	r3, [sp, #0]
    3762:	4a29      	ldr	r2, [pc, #164]	; (3808 <execute+0x2c4>)
    3764:	9b11      	ldr	r3, [sp, #68]	; 0x44
    3766:	2101      	movs	r1, #1
    3768:	4620      	mov	r0, r4
    376a:	f007 fb9d 	bl	aea8 <z_shell_fprintf>
    376e:	e7e5      	b.n	373c <execute+0x1f8>
    3770:	7e03      	ldrb	r3, [r0, #24]
    3772:	eba5 050a 	sub.w	r5, r5, sl
    3776:	b1b3      	cbz	r3, 37a6 <execute+0x262>
    3778:	7e41      	ldrb	r1, [r0, #25]
    377a:	f64f 72ff 	movw	r2, #65535	; 0xffff
    377e:	29ff      	cmp	r1, #255	; 0xff
    3780:	bf18      	it	ne
    3782:	460a      	movne	r2, r1
    3784:	429d      	cmp	r5, r3
    3786:	d302      	bcc.n	378e <execute+0x24a>
    3788:	4413      	add	r3, r2
    378a:	429d      	cmp	r5, r3
    378c:	d90b      	bls.n	37a6 <execute+0x262>
    378e:	6883      	ldr	r3, [r0, #8]
    3790:	4a1e      	ldr	r2, [pc, #120]	; (380c <execute+0x2c8>)
    3792:	2101      	movs	r1, #1
    3794:	4620      	mov	r0, r4
    3796:	f007 fb87 	bl	aea8 <z_shell_fprintf>
    379a:	4620      	mov	r0, r4
    379c:	f7ff fe3e 	bl	341c <shell_internal_help_print>
    37a0:	f06f 0515 	mvn.w	r5, #21
    37a4:	e74b      	b.n	363e <execute+0xfa>
    37a6:	f44f 6100 	mov.w	r1, #2048	; 0x800
    37aa:	f500 7019 	add.w	r0, r0, #612	; 0x264
    37ae:	f007 f84f 	bl	a850 <atomic_or>
    37b2:	68a0      	ldr	r0, [r4, #8]
    37b4:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    37b8:	f007 f8db 	bl	a972 <k_mutex_unlock.isra.0>
    37bc:	68a3      	ldr	r3, [r4, #8]
    37be:	aa11      	add	r2, sp, #68	; 0x44
    37c0:	4629      	mov	r1, r5
    37c2:	eb02 028a 	add.w	r2, r2, sl, lsl #2
    37c6:	695b      	ldr	r3, [r3, #20]
    37c8:	4620      	mov	r0, r4
    37ca:	4798      	blx	r3
    37cc:	4605      	mov	r5, r0
    37ce:	68a0      	ldr	r0, [r4, #8]
    37d0:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    37d4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    37d8:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    37dc:	f007 f87f 	bl	a8de <k_mutex_lock.constprop.0.isra.0>
    37e0:	68a0      	ldr	r0, [r4, #8]
    37e2:	f46f 6100 	mvn.w	r1, #2048	; 0x800
    37e6:	f500 7019 	add.w	r0, r0, #612	; 0x264
    37ea:	f007 f840 	bl	a86e <atomic_and>
    37ee:	e726      	b.n	363e <execute+0xfa>
    37f0:	0000dc7a 	.word	0x0000dc7a
    37f4:	0000dc8e 	.word	0x0000dc8e
    37f8:	0000dcef 	.word	0x0000dcef
    37fc:	0000d8b6 	.word	0x0000d8b6
    3800:	0000dcac 	.word	0x0000dcac
    3804:	0000dcdb 	.word	0x0000dcdb
    3808:	0000df8e 	.word	0x0000df8e
    380c:	0000dd13 	.word	0x0000dd13

00003810 <shell_process>:
    3810:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3814:	4604      	mov	r4, r0
    3816:	6880      	ldr	r0, [r0, #8]
    3818:	b0b1      	sub	sp, #196	; 0xc4
    381a:	2101      	movs	r1, #1
    381c:	f500 7019 	add.w	r0, r0, #612	; 0x264
    3820:	f007 f816 	bl	a850 <atomic_or>
    3824:	68a3      	ldr	r3, [r4, #8]
    3826:	791b      	ldrb	r3, [r3, #4]
    3828:	2b02      	cmp	r3, #2
    382a:	d117      	bne.n	385c <shell_process+0x4c>
    382c:	2300      	movs	r3, #0
    382e:	9309      	str	r3, [sp, #36]	; 0x24
    3830:	68a3      	ldr	r3, [r4, #8]
    3832:	6860      	ldr	r0, [r4, #4]
    3834:	6b9e      	ldr	r6, [r3, #56]	; 0x38
    3836:	6803      	ldr	r3, [r0, #0]
    3838:	691d      	ldr	r5, [r3, #16]
    383a:	ab09      	add	r3, sp, #36	; 0x24
    383c:	b1c6      	cbz	r6, 3870 <shell_process+0x60>
    383e:	2210      	movs	r2, #16
    3840:	a91b      	add	r1, sp, #108	; 0x6c
    3842:	47a8      	blx	r5
    3844:	9a09      	ldr	r2, [sp, #36]	; 0x24
    3846:	b14a      	cbz	r2, 385c <shell_process+0x4c>
    3848:	a91b      	add	r1, sp, #108	; 0x6c
    384a:	4620      	mov	r0, r4
    384c:	47b0      	blx	r6
    384e:	68a3      	ldr	r3, [r4, #8]
    3850:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    3852:	2b00      	cmp	r3, #0
    3854:	d1ec      	bne.n	3830 <shell_process+0x20>
    3856:	4620      	mov	r0, r4
    3858:	f7ff fe4a 	bl	34f0 <state_set.constprop.0>
    385c:	68a0      	ldr	r0, [r4, #8]
    385e:	f06f 0101 	mvn.w	r1, #1
    3862:	f500 7019 	add.w	r0, r0, #612	; 0x264
    3866:	b031      	add	sp, #196	; 0xc4
    3868:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    386c:	f006 bfff 	b.w	a86e <atomic_and>
    3870:	2201      	movs	r2, #1
    3872:	f10d 0123 	add.w	r1, sp, #35	; 0x23
    3876:	47a8      	blx	r5
    3878:	9b09      	ldr	r3, [sp, #36]	; 0x24
    387a:	2b00      	cmp	r3, #0
    387c:	d0ee      	beq.n	385c <shell_process+0x4c>
    387e:	f99d 1023 	ldrsb.w	r1, [sp, #35]	; 0x23
    3882:	f89d 3023 	ldrb.w	r3, [sp, #35]	; 0x23
    3886:	68a2      	ldr	r2, [r4, #8]
    3888:	2900      	cmp	r1, #0
    388a:	dbd1      	blt.n	3830 <shell_process+0x20>
    388c:	7951      	ldrb	r1, [r2, #5]
    388e:	2903      	cmp	r1, #3
    3890:	f200 830f 	bhi.w	3eb2 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x41a>
    3894:	e8df f011 	tbh	[pc, r1, lsl #1]
    3898:	028f0004 	.word	0x028f0004
    389c:	030d02a7 	.word	0x030d02a7
    38a0:	2b0d      	cmp	r3, #13
    38a2:	d054      	beq.n	394e <shell_process+0x13e>
    38a4:	2b0a      	cmp	r3, #10
    38a6:	d032      	beq.n	390e <shell_process+0xfe>
    38a8:	f8b2 1264 	ldrh.w	r1, [r2, #612]	; 0x264
    38ac:	f36f 01ca 	bfc	r1, #3, #8
    38b0:	f8a2 1264 	strh.w	r1, [r2, #612]	; 0x264
    38b4:	2b09      	cmp	r3, #9
    38b6:	68a0      	ldr	r0, [r4, #8]
    38b8:	d05c      	beq.n	3974 <shell_process+0x164>
    38ba:	d813      	bhi.n	38e4 <shell_process+0xd4>
    38bc:	2b00      	cmp	r3, #0
    38be:	d0b7      	beq.n	3830 <shell_process+0x20>
    38c0:	2b08      	cmp	r3, #8
    38c2:	f000 81d8 	beq.w	3c76 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x1de>
    38c6:	1c5a      	adds	r2, r3, #1
    38c8:	4986      	ldr	r1, [pc, #536]	; (3ae4 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x4c>)
    38ca:	68a0      	ldr	r0, [r4, #8]
    38cc:	b2d2      	uxtb	r2, r2
    38ce:	5c8a      	ldrb	r2, [r1, r2]
    38d0:	f012 0f97 	tst.w	r2, #151	; 0x97
    38d4:	f000 81db 	beq.w	3c8e <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x1f6>
    38d8:	2101      	movs	r1, #1
    38da:	f007 f831 	bl	a940 <z_flag_history_exit_set.isra.0>
    38de:	f89d 1023 	ldrb.w	r1, [sp, #35]	; 0x23
    38e2:	e0f5      	b.n	3ad0 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x38>
    38e4:	2b1b      	cmp	r3, #27
    38e6:	d042      	beq.n	396e <shell_process+0x15e>
    38e8:	2b7f      	cmp	r3, #127	; 0x7f
    38ea:	d1ec      	bne.n	38c6 <shell_process+0xb6>
    38ec:	f8d0 3260 	ldr.w	r3, [r0, #608]	; 0x260
    38f0:	079d      	lsls	r5, r3, #30
    38f2:	d59d      	bpl.n	3830 <shell_process+0x20>
    38f4:	2101      	movs	r1, #1
    38f6:	f007 f823 	bl	a940 <z_flag_history_exit_set.isra.0>
    38fa:	68a3      	ldr	r3, [r4, #8]
    38fc:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    3900:	0719      	lsls	r1, r3, #28
    3902:	f100 81c0 	bmi.w	3c86 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x1ee>
    3906:	4620      	mov	r0, r4
    3908:	f007 fb10 	bl	af2c <z_shell_op_char_delete>
    390c:	e790      	b.n	3830 <shell_process+0x20>
    390e:	f8d2 1264 	ldr.w	r1, [r2, #612]	; 0x264
    3912:	f3c1 01c7 	ubfx	r1, r1, #3, #8
    3916:	b129      	cbz	r1, 3924 <shell_process+0x114>
    3918:	f8d2 1264 	ldr.w	r1, [r2, #612]	; 0x264
    391c:	f3c1 01c7 	ubfx	r1, r1, #3, #8
    3920:	290a      	cmp	r1, #10
    3922:	d1d0      	bne.n	38c6 <shell_process+0xb6>
    3924:	f8b2 1264 	ldrh.w	r1, [r2, #612]	; 0x264
    3928:	f363 01ca 	bfi	r1, r3, #3, #8
    392c:	f8a2 1264 	strh.w	r1, [r2, #612]	; 0x264
    3930:	68a0      	ldr	r0, [r4, #8]
    3932:	8f81      	ldrh	r1, [r0, #60]	; 0x3c
    3934:	b9b9      	cbnz	r1, 3966 <shell_process+0x156>
    3936:	f007 f803 	bl	a940 <z_flag_history_exit_set.isra.0>
    393a:	68e0      	ldr	r0, [r4, #12]
    393c:	f007 fbb8 	bl	b0b0 <z_shell_history_mode_exit>
    3940:	6960      	ldr	r0, [r4, #20]
    3942:	f7ff fd7b 	bl	343c <z_cursor_next_line_move.isra.0>
    3946:	4620      	mov	r0, r4
    3948:	f7ff fdd2 	bl	34f0 <state_set.constprop.0>
    394c:	e770      	b.n	3830 <shell_process+0x20>
    394e:	f8d2 1264 	ldr.w	r1, [r2, #612]	; 0x264
    3952:	f3c1 01c7 	ubfx	r1, r1, #3, #8
    3956:	2900      	cmp	r1, #0
    3958:	d0e4      	beq.n	3924 <shell_process+0x114>
    395a:	f8d2 1264 	ldr.w	r1, [r2, #612]	; 0x264
    395e:	f3c1 01c7 	ubfx	r1, r1, #3, #8
    3962:	290d      	cmp	r1, #13
    3964:	e7dd      	b.n	3922 <shell_process+0x112>
    3966:	4620      	mov	r0, r4
    3968:	f7ff fdec 	bl	3544 <execute>
    396c:	e7eb      	b.n	3946 <shell_process+0x136>
    396e:	2301      	movs	r3, #1
    3970:	7143      	strb	r3, [r0, #5]
    3972:	e75d      	b.n	3830 <shell_process+0x20>
    3974:	f8d0 3260 	ldr.w	r3, [r0, #608]	; 0x260
    3978:	079a      	lsls	r2, r3, #30
    397a:	f57f af59 	bpl.w	3830 <shell_process+0x20>
    397e:	2101      	movs	r1, #1
    3980:	f006 ffde 	bl	a940 <z_flag_history_exit_set.isra.0>
    3984:	68a0      	ldr	r0, [r4, #8]
    3986:	8f83      	ldrh	r3, [r0, #60]	; 0x3c
    3988:	2bff      	cmp	r3, #255	; 0xff
    398a:	f43f af51 	beq.w	3830 <shell_process+0x20>
    398e:	8fc2      	ldrh	r2, [r0, #62]	; 0x3e
    3990:	f100 0142 	add.w	r1, r0, #66	; 0x42
    3994:	f500 70a1 	add.w	r0, r0, #322	; 0x142
    3998:	f008 fbc0 	bl	c11c <memcpy>
    399c:	68a3      	ldr	r3, [r4, #8]
    399e:	8fda      	ldrh	r2, [r3, #62]	; 0x3e
    39a0:	4413      	add	r3, r2
    39a2:	2500      	movs	r5, #0
    39a4:	f883 5142 	strb.w	r5, [r3, #322]	; 0x142
    39a8:	68a2      	ldr	r2, [r4, #8]
    39aa:	a91b      	add	r1, sp, #108	; 0x6c
    39ac:	2314      	movs	r3, #20
    39ae:	f502 72a1 	add.w	r2, r2, #322	; 0x142
    39b2:	a80b      	add	r0, sp, #44	; 0x2c
    39b4:	f000 fc32 	bl	421c <z_shell_make_argv>
    39b8:	990b      	ldr	r1, [sp, #44]	; 0x2c
    39ba:	2914      	cmp	r1, #20
    39bc:	f63f af38 	bhi.w	3830 <shell_process+0x20>
    39c0:	ab30      	add	r3, sp, #192	; 0xc0
    39c2:	eb03 0381 	add.w	r3, r3, r1, lsl #2
    39c6:	f8df a120 	ldr.w	sl, [pc, #288]	; 3ae8 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x50>
    39ca:	f843 5c54 	str.w	r5, [r3, #-84]
    39ce:	68a3      	ldr	r3, [r4, #8]
    39d0:	8fda      	ldrh	r2, [r3, #62]	; 0x3e
    39d2:	4413      	add	r3, r2
    39d4:	f893 3041 	ldrb.w	r3, [r3, #65]	; 0x41
    39d8:	f81a 3003 	ldrb.w	r3, [sl, r3]
    39dc:	b119      	cbz	r1, 39e6 <shell_process+0x1d6>
    39de:	071b      	lsls	r3, r3, #28
    39e0:	d451      	bmi.n	3a86 <shell_process+0x276>
    39e2:	2901      	cmp	r1, #1
    39e4:	d14e      	bne.n	3a84 <shell_process+0x274>
    39e6:	2500      	movs	r5, #0
    39e8:	950a      	str	r5, [sp, #40]	; 0x28
    39ea:	9b0a      	ldr	r3, [sp, #40]	; 0x28
    39ec:	aa30      	add	r2, sp, #192	; 0xc0
    39ee:	eb02 0383 	add.w	r3, r2, r3, lsl #2
    39f2:	2600      	movs	r6, #0
    39f4:	f853 bc54 	ldr.w	fp, [r3, #-84]
    39f8:	4658      	mov	r0, fp
    39fa:	f006 ff5d 	bl	a8b8 <z_shell_strlen>
    39fe:	4637      	mov	r7, r6
    3a00:	9002      	str	r0, [sp, #8]
    3a02:	9603      	str	r6, [sp, #12]
    3a04:	46b0      	mov	r8, r6
    3a06:	aa16      	add	r2, sp, #88	; 0x58
    3a08:	4641      	mov	r1, r8
    3a0a:	4628      	mov	r0, r5
    3a0c:	f000 fce2 	bl	43d4 <z_shell_cmd_get>
    3a10:	4681      	mov	r9, r0
    3a12:	2800      	cmp	r0, #0
    3a14:	d143      	bne.n	3a9e <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x6>
    3a16:	2e01      	cmp	r6, #1
    3a18:	d168      	bne.n	3aec <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x54>
    3a1a:	9b0a      	ldr	r3, [sp, #40]	; 0x28
    3a1c:	aa30      	add	r2, sp, #192	; 0xc0
    3a1e:	eb02 0383 	add.w	r3, r2, r3, lsl #2
    3a22:	f853 0c54 	ldr.w	r0, [r3, #-84]
    3a26:	f006 ff47 	bl	a8b8 <z_shell_strlen>
    3a2a:	68a2      	ldr	r2, [r4, #8]
    3a2c:	4606      	mov	r6, r0
    3a2e:	3208      	adds	r2, #8
    3a30:	4639      	mov	r1, r7
    3a32:	4628      	mov	r0, r5
    3a34:	f000 fcce 	bl	43d4 <z_shell_cmd_get>
    3a38:	4605      	mov	r5, r0
    3a3a:	6800      	ldr	r0, [r0, #0]
    3a3c:	f006 ff3c 	bl	a8b8 <z_shell_strlen>
    3a40:	4286      	cmp	r6, r0
    3a42:	d006      	beq.n	3a52 <shell_process+0x242>
    3a44:	6829      	ldr	r1, [r5, #0]
    3a46:	1b82      	subs	r2, r0, r6
    3a48:	b292      	uxth	r2, r2
    3a4a:	4431      	add	r1, r6
    3a4c:	4620      	mov	r0, r4
    3a4e:	f007 fa6b 	bl	af28 <z_shell_op_completion_insert>
    3a52:	68a0      	ldr	r0, [r4, #8]
    3a54:	8fc3      	ldrh	r3, [r0, #62]	; 0x3e
    3a56:	4403      	add	r3, r0
    3a58:	f893 3042 	ldrb.w	r3, [r3, #66]	; 0x42
    3a5c:	f81a 1003 	ldrb.w	r1, [sl, r3]
    3a60:	f011 0108 	ands.w	r1, r1, #8
    3a64:	d138      	bne.n	3ad8 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x40>
    3a66:	f8d0 3260 	ldr.w	r3, [r0, #608]	; 0x260
    3a6a:	07df      	lsls	r7, r3, #31
    3a6c:	d52f      	bpl.n	3ace <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x36>
    3a6e:	f006 ff71 	bl	a954 <z_flag_insert_mode_set.isra.0>
    3a72:	2120      	movs	r1, #32
    3a74:	4620      	mov	r0, r4
    3a76:	f000 feaf 	bl	47d8 <z_shell_op_char_insert>
    3a7a:	68a0      	ldr	r0, [r4, #8]
    3a7c:	2101      	movs	r1, #1
    3a7e:	f006 ff69 	bl	a954 <z_flag_insert_mode_set.isra.0>
    3a82:	e6d5      	b.n	3830 <shell_process+0x20>
    3a84:	3901      	subs	r1, #1
    3a86:	2000      	movs	r0, #0
    3a88:	ab0c      	add	r3, sp, #48	; 0x30
    3a8a:	9300      	str	r3, [sp, #0]
    3a8c:	9001      	str	r0, [sp, #4]
    3a8e:	ab0a      	add	r3, sp, #40	; 0x28
    3a90:	aa1b      	add	r2, sp, #108	; 0x6c
    3a92:	f007 f86f 	bl	ab74 <z_shell_get_last_command>
    3a96:	4605      	mov	r5, r0
    3a98:	2800      	cmp	r0, #0
    3a9a:	d1a6      	bne.n	39ea <shell_process+0x1da>
    3a9c:	e6c8      	b.n	3830 <shell_process+0x20>
    3a9e:	9a02      	ldr	r2, [sp, #8]
    3aa0:	f8d9 0000 	ldr.w	r0, [r9]
    3aa4:	4659      	mov	r1, fp
    3aa6:	f008 fbb1 	bl	c20c <strncmp>
    3aaa:	b968      	cbnz	r0, 3ac8 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x30>
    3aac:	f8d9 0000 	ldr.w	r0, [r9]
    3ab0:	f7fe f804 	bl	1abc <strlen>
    3ab4:	9b03      	ldr	r3, [sp, #12]
    3ab6:	4283      	cmp	r3, r0
    3ab8:	bf38      	it	cc
    3aba:	4603      	movcc	r3, r0
    3abc:	b29b      	uxth	r3, r3
    3abe:	2e00      	cmp	r6, #0
    3ac0:	bf08      	it	eq
    3ac2:	4647      	moveq	r7, r8
    3ac4:	9303      	str	r3, [sp, #12]
    3ac6:	3601      	adds	r6, #1
    3ac8:	f108 0801 	add.w	r8, r8, #1
    3acc:	e79b      	b.n	3a06 <shell_process+0x1f6>
    3ace:	2120      	movs	r1, #32
    3ad0:	4620      	mov	r0, r4
    3ad2:	f000 fe81 	bl	47d8 <z_shell_op_char_insert>
    3ad6:	e6ab      	b.n	3830 <shell_process+0x20>
    3ad8:	2101      	movs	r1, #1
    3ada:	4620      	mov	r0, r4
    3adc:	f007 f912 	bl	ad04 <z_shell_op_cursor_move>
    3ae0:	e6a6      	b.n	3830 <shell_process+0x20>
    3ae2:	bf00      	nop
    3ae4:	0000e694 	.word	0x0000e694
    3ae8:	0000e695 	.word	0x0000e695
    3aec:	f67f aea0 	bls.w	3830 <shell_process+0x20>
    3af0:	9a0a      	ldr	r2, [sp, #40]	; 0x28
    3af2:	ab30      	add	r3, sp, #192	; 0xc0
    3af4:	eb03 0282 	add.w	r2, r3, r2, lsl #2
    3af8:	46ba      	mov	sl, r7
    3afa:	f852 3c54 	ldr.w	r3, [r2, #-84]
    3afe:	9302      	str	r3, [sp, #8]
    3b00:	4618      	mov	r0, r3
    3b02:	f006 fed9 	bl	a8b8 <z_shell_strlen>
    3b06:	68a2      	ldr	r2, [r4, #8]
    3b08:	9005      	str	r0, [sp, #20]
    3b0a:	f8a2 9030 	strh.w	r9, [r2, #48]	; 0x30
    3b0e:	9604      	str	r6, [sp, #16]
    3b10:	68a2      	ldr	r2, [r4, #8]
    3b12:	4651      	mov	r1, sl
    3b14:	3208      	adds	r2, #8
    3b16:	4628      	mov	r0, r5
    3b18:	f000 fc5c 	bl	43d4 <z_shell_cmd_get>
    3b1c:	9b02      	ldr	r3, [sp, #8]
    3b1e:	4680      	mov	r8, r0
    3b20:	f10a 0a01 	add.w	sl, sl, #1
    3b24:	2b00      	cmp	r3, #0
    3b26:	d152      	bne.n	3bce <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x136>
    3b28:	f8d8 3000 	ldr.w	r3, [r8]
    3b2c:	2b00      	cmp	r3, #0
    3b2e:	d158      	bne.n	3be2 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x14a>
    3b30:	68a2      	ldr	r2, [r4, #8]
    3b32:	8613      	strh	r3, [r2, #48]	; 0x30
    3b34:	9b04      	ldr	r3, [sp, #16]
    3b36:	3b01      	subs	r3, #1
    3b38:	9304      	str	r3, [sp, #16]
    3b3a:	d1e9      	bne.n	3b10 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x78>
    3b3c:	6960      	ldr	r0, [r4, #20]
    3b3e:	f7ff fc7d 	bl	343c <z_cursor_next_line_move.isra.0>
    3b42:	4620      	mov	r0, r4
    3b44:	f000 fe7e 	bl	4844 <z_shell_print_prompt_and_cmd>
    3b48:	9b0a      	ldr	r3, [sp, #40]	; 0x28
    3b4a:	aa30      	add	r2, sp, #192	; 0xc0
    3b4c:	eb02 0383 	add.w	r3, r2, r3, lsl #2
    3b50:	f107 0901 	add.w	r9, r7, #1
    3b54:	f853 0c54 	ldr.w	r0, [r3, #-84]
    3b58:	f006 feae 	bl	a8b8 <z_shell_strlen>
    3b5c:	4639      	mov	r1, r7
    3b5e:	aa11      	add	r2, sp, #68	; 0x44
    3b60:	4680      	mov	r8, r0
    3b62:	4628      	mov	r0, r5
    3b64:	f000 fc36 	bl	43d4 <z_shell_cmd_get>
    3b68:	4607      	mov	r7, r0
    3b6a:	68a0      	ldr	r0, [r4, #8]
    3b6c:	6839      	ldr	r1, [r7, #0]
    3b6e:	22ff      	movs	r2, #255	; 0xff
    3b70:	f500 70a1 	add.w	r0, r0, #322	; 0x142
    3b74:	f008 fb5c 	bl	c230 <strncpy>
    3b78:	683b      	ldr	r3, [r7, #0]
    3b7a:	9302      	str	r3, [sp, #8]
    3b7c:	f64f 77ff 	movw	r7, #65535	; 0xffff
    3b80:	46ba      	mov	sl, r7
    3b82:	aa16      	add	r2, sp, #88	; 0x58
    3b84:	4649      	mov	r1, r9
    3b86:	4628      	mov	r0, r5
    3b88:	f109 0b01 	add.w	fp, r9, #1
    3b8c:	f000 fc22 	bl	43d4 <z_shell_cmd_get>
    3b90:	2800      	cmp	r0, #0
    3b92:	d064      	beq.n	3c5e <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x1c6>
    3b94:	68a1      	ldr	r1, [r4, #8]
    3b96:	6803      	ldr	r3, [r0, #0]
    3b98:	f201 1141 	addw	r1, r1, #321	; 0x141
    3b9c:	2200      	movs	r2, #0
    3b9e:	f811 ef01 	ldrb.w	lr, [r1, #1]!
    3ba2:	5c98      	ldrb	r0, [r3, r2]
    3ba4:	4570      	cmp	r0, lr
    3ba6:	d103      	bne.n	3bb0 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x118>
    3ba8:	b110      	cbz	r0, 3bb0 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x118>
    3baa:	3201      	adds	r2, #1
    3bac:	4552      	cmp	r2, sl
    3bae:	d1f6      	bne.n	3b9e <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x106>
    3bb0:	f1b8 0f00 	cmp.w	r8, #0
    3bb4:	d001      	beq.n	3bba <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x122>
    3bb6:	4542      	cmp	r2, r8
    3bb8:	db07      	blt.n	3bca <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x132>
    3bba:	42ba      	cmp	r2, r7
    3bbc:	f106 36ff 	add.w	r6, r6, #4294967295	; 0xffffffff
    3bc0:	bfa8      	it	ge
    3bc2:	463a      	movge	r2, r7
    3bc4:	2e01      	cmp	r6, #1
    3bc6:	b297      	uxth	r7, r2
    3bc8:	d049      	beq.n	3c5e <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x1c6>
    3bca:	46d9      	mov	r9, fp
    3bcc:	e7d9      	b.n	3b82 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0xea>
    3bce:	6800      	ldr	r0, [r0, #0]
    3bd0:	2800      	cmp	r0, #0
    3bd2:	d0a9      	beq.n	3b28 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x90>
    3bd4:	9a05      	ldr	r2, [sp, #20]
    3bd6:	9902      	ldr	r1, [sp, #8]
    3bd8:	f008 fb18 	bl	c20c <strncmp>
    3bdc:	2800      	cmp	r0, #0
    3bde:	d0a3      	beq.n	3b28 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x90>
    3be0:	e796      	b.n	3b10 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x78>
    3be2:	48b5      	ldr	r0, [pc, #724]	; (3eb8 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x420>)
    3be4:	9306      	str	r3, [sp, #24]
    3be6:	f006 fe67 	bl	a8b8 <z_shell_strlen>
    3bea:	9b03      	ldr	r3, [sp, #12]
    3bec:	68a2      	ldr	r2, [r4, #8]
    3bee:	eb00 0b03 	add.w	fp, r0, r3
    3bf2:	48b1      	ldr	r0, [pc, #708]	; (3eb8 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x420>)
    3bf4:	f8b2 802a 	ldrh.w	r8, [r2, #42]	; 0x2a
    3bf8:	f006 fe5e 	bl	a8b8 <z_shell_strlen>
    3bfc:	9b06      	ldr	r3, [sp, #24]
    3bfe:	9007      	str	r0, [sp, #28]
    3c00:	4618      	mov	r0, r3
    3c02:	f006 fe59 	bl	a8b8 <z_shell_strlen>
    3c06:	fa1f fb8b 	uxth.w	fp, fp
    3c0a:	ebab 0900 	sub.w	r9, fp, r0
    3c0e:	68a0      	ldr	r0, [r4, #8]
    3c10:	9a07      	ldr	r2, [sp, #28]
    3c12:	8e01      	ldrh	r1, [r0, #48]	; 0x30
    3c14:	9b06      	ldr	r3, [sp, #24]
    3c16:	eba8 0802 	sub.w	r8, r8, r2
    3c1a:	fb98 f8fb 	sdiv	r8, r8, fp
    3c1e:	fa1f f888 	uxth.w	r8, r8
    3c22:	f101 0c01 	add.w	ip, r1, #1
    3c26:	fbb1 f2f8 	udiv	r2, r1, r8
    3c2a:	fb08 1112 	mls	r1, r8, r2, r1
    3c2e:	b289      	uxth	r1, r1
    3c30:	fa1f f989 	uxth.w	r9, r9
    3c34:	f8a0 c030 	strh.w	ip, [r0, #48]	; 0x30
    3c38:	b959      	cbnz	r1, 3c52 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x1ba>
    3c3a:	9300      	str	r3, [sp, #0]
    3c3c:	4a9f      	ldr	r2, [pc, #636]	; (3ebc <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x424>)
    3c3e:	4b9e      	ldr	r3, [pc, #632]	; (3eb8 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x420>)
    3c40:	2106      	movs	r1, #6
    3c42:	4620      	mov	r0, r4
    3c44:	f007 f930 	bl	aea8 <z_shell_fprintf>
    3c48:	4649      	mov	r1, r9
    3c4a:	4620      	mov	r0, r4
    3c4c:	f000 fc92 	bl	4574 <z_shell_op_cursor_horiz_move>
    3c50:	e770      	b.n	3b34 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x9c>
    3c52:	4a9b      	ldr	r2, [pc, #620]	; (3ec0 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x428>)
    3c54:	2106      	movs	r1, #6
    3c56:	4620      	mov	r0, r4
    3c58:	f007 f926 	bl	aea8 <z_shell_fprintf>
    3c5c:	e7f4      	b.n	3c48 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x1b0>
    3c5e:	2f00      	cmp	r7, #0
    3c60:	f43f ade6 	beq.w	3830 <shell_process+0x20>
    3c64:	9902      	ldr	r1, [sp, #8]
    3c66:	eba7 0208 	sub.w	r2, r7, r8
    3c6a:	b292      	uxth	r2, r2
    3c6c:	4441      	add	r1, r8
    3c6e:	4620      	mov	r0, r4
    3c70:	f007 f95a 	bl	af28 <z_shell_op_completion_insert>
    3c74:	e5dc      	b.n	3830 <shell_process+0x20>
    3c76:	f8d0 3260 	ldr.w	r3, [r0, #608]	; 0x260
    3c7a:	079e      	lsls	r6, r3, #30
    3c7c:	f57f add8 	bpl.w	3830 <shell_process+0x20>
    3c80:	2101      	movs	r1, #1
    3c82:	f006 fe5d 	bl	a940 <z_flag_history_exit_set.isra.0>
    3c86:	4620      	mov	r0, r4
    3c88:	f007 f96b 	bl	af62 <z_shell_op_char_backspace>
    3c8c:	e5d0      	b.n	3830 <shell_process+0x20>
    3c8e:	f8d0 2260 	ldr.w	r2, [r0, #608]	; 0x260
    3c92:	0792      	lsls	r2, r2, #30
    3c94:	f57f adcc 	bpl.w	3830 <shell_process+0x20>
    3c98:	3b01      	subs	r3, #1
    3c9a:	2b16      	cmp	r3, #22
    3c9c:	f63f adc8 	bhi.w	3830 <shell_process+0x20>
    3ca0:	a201      	add	r2, pc, #4	; (adr r2, 3ca8 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x210>)
    3ca2:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
    3ca6:	bf00      	nop
    3ca8:	00003e85 	.word	0x00003e85
    3cac:	00003d05 	.word	0x00003d05
    3cb0:	00003d0d 	.word	0x00003d0d
    3cb4:	00003907 	.word	0x00003907
    3cb8:	00003e79 	.word	0x00003e79
    3cbc:	00003d2b 	.word	0x00003d2b
    3cc0:	00003831 	.word	0x00003831
    3cc4:	00003831 	.word	0x00003831
    3cc8:	00003831 	.word	0x00003831
    3ccc:	00003831 	.word	0x00003831
    3cd0:	00003d33 	.word	0x00003d33
    3cd4:	00003d3b 	.word	0x00003d3b
    3cd8:	00003831 	.word	0x00003831
    3cdc:	00003d65 	.word	0x00003d65
    3ce0:	00003831 	.word	0x00003831
    3ce4:	00003d6f 	.word	0x00003d6f
    3ce8:	00003831 	.word	0x00003831
    3cec:	00003831 	.word	0x00003831
    3cf0:	00003831 	.word	0x00003831
    3cf4:	00003831 	.word	0x00003831
    3cf8:	00003d73 	.word	0x00003d73
    3cfc:	00003831 	.word	0x00003831
    3d00:	00003da7 	.word	0x00003da7
    3d04:	4620      	mov	r0, r4
    3d06:	f007 f82e 	bl	ad66 <z_shell_op_left_arrow>
    3d0a:	e591      	b.n	3830 <shell_process+0x20>
    3d0c:	4620      	mov	r0, r4
    3d0e:	f007 f823 	bl	ad58 <z_shell_op_cursor_end_move>
    3d12:	4620      	mov	r0, r4
    3d14:	f006 ffaa 	bl	ac6c <z_shell_cursor_in_empty_line>
    3d18:	b910      	cbnz	r0, 3d20 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x288>
    3d1a:	6960      	ldr	r0, [r4, #20]
    3d1c:	f7ff fb8e 	bl	343c <z_cursor_next_line_move.isra.0>
    3d20:	68a0      	ldr	r0, [r4, #8]
    3d22:	2101      	movs	r1, #1
    3d24:	f006 fe0c 	bl	a940 <z_flag_history_exit_set.isra.0>
    3d28:	e60d      	b.n	3946 <shell_process+0x136>
    3d2a:	4620      	mov	r0, r4
    3d2c:	f007 f823 	bl	ad76 <z_shell_op_right_arrow>
    3d30:	e57e      	b.n	3830 <shell_process+0x20>
    3d32:	4620      	mov	r0, r4
    3d34:	f007 f828 	bl	ad88 <z_shell_op_delete_from_cursor>
    3d38:	e57a      	b.n	3830 <shell_process+0x20>
    3d3a:	f8d0 3260 	ldr.w	r3, [r0, #608]	; 0x260
    3d3e:	069f      	lsls	r7, r3, #26
    3d40:	d503      	bpl.n	3d4a <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x2b2>
    3d42:	4960      	ldr	r1, [pc, #384]	; (3ec4 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x42c>)
    3d44:	6960      	ldr	r0, [r4, #20]
    3d46:	f006 fdbd 	bl	a8c4 <z_shell_raw_fprintf>
    3d4a:	68a3      	ldr	r3, [r4, #8]
    3d4c:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    3d50:	069e      	lsls	r6, r3, #26
    3d52:	d503      	bpl.n	3d5c <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x2c4>
    3d54:	495c      	ldr	r1, [pc, #368]	; (3ec8 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x430>)
    3d56:	6960      	ldr	r0, [r4, #20]
    3d58:	f006 fdb4 	bl	a8c4 <z_shell_raw_fprintf>
    3d5c:	4620      	mov	r0, r4
    3d5e:	f000 fd71 	bl	4844 <z_shell_print_prompt_and_cmd>
    3d62:	e565      	b.n	3830 <shell_process+0x20>
    3d64:	2100      	movs	r1, #0
    3d66:	4620      	mov	r0, r4
    3d68:	f7ff fb6e 	bl	3448 <history_handle>
    3d6c:	e560      	b.n	3830 <shell_process+0x20>
    3d6e:	2101      	movs	r1, #1
    3d70:	e7f9      	b.n	3d66 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x2ce>
    3d72:	4620      	mov	r0, r4
    3d74:	f006 ffea 	bl	ad4c <z_shell_op_cursor_home_move>
    3d78:	68a2      	ldr	r2, [r4, #8]
    3d7a:	2300      	movs	r3, #0
    3d7c:	f882 3042 	strb.w	r3, [r2, #66]	; 0x42
    3d80:	68a2      	ldr	r2, [r4, #8]
    3d82:	87d3      	strh	r3, [r2, #62]	; 0x3e
    3d84:	68a2      	ldr	r2, [r4, #8]
    3d86:	8793      	strh	r3, [r2, #60]	; 0x3c
    3d88:	68a0      	ldr	r0, [r4, #8]
    3d8a:	2101      	movs	r1, #1
    3d8c:	f006 fdd8 	bl	a940 <z_flag_history_exit_set.isra.0>
    3d90:	68a3      	ldr	r3, [r4, #8]
    3d92:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    3d96:	069d      	lsls	r5, r3, #26
    3d98:	f57f ad4a 	bpl.w	3830 <shell_process+0x20>
    3d9c:	494b      	ldr	r1, [pc, #300]	; (3ecc <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x434>)
    3d9e:	6960      	ldr	r0, [r4, #20]
    3da0:	f006 fd90 	bl	a8c4 <z_shell_raw_fprintf>
    3da4:	e544      	b.n	3830 <shell_process+0x20>
    3da6:	4620      	mov	r0, r4
    3da8:	f000 fc7c 	bl	46a4 <z_shell_op_word_remove>
    3dac:	68a0      	ldr	r0, [r4, #8]
    3dae:	2101      	movs	r1, #1
    3db0:	f006 fdc6 	bl	a940 <z_flag_history_exit_set.isra.0>
    3db4:	e53c      	b.n	3830 <shell_process+0x20>
    3db6:	2b5b      	cmp	r3, #91	; 0x5b
    3db8:	d102      	bne.n	3dc0 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x328>
    3dba:	2302      	movs	r3, #2
    3dbc:	7153      	strb	r3, [r2, #5]
    3dbe:	e537      	b.n	3830 <shell_process+0x20>
    3dc0:	f8d2 2260 	ldr.w	r2, [r2, #608]	; 0x260
    3dc4:	0790      	lsls	r0, r2, #30
    3dc6:	d506      	bpl.n	3dd6 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x33e>
    3dc8:	2b62      	cmp	r3, #98	; 0x62
    3dca:	d108      	bne.n	3dde <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x346>
    3dcc:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    3dd0:	4620      	mov	r0, r4
    3dd2:	f000 fbe5 	bl	45a0 <z_shell_op_cursor_word_move>
    3dd6:	68a3      	ldr	r3, [r4, #8]
    3dd8:	2200      	movs	r2, #0
    3dda:	715a      	strb	r2, [r3, #5]
    3ddc:	e528      	b.n	3830 <shell_process+0x20>
    3dde:	2b66      	cmp	r3, #102	; 0x66
    3de0:	d1f9      	bne.n	3dd6 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x33e>
    3de2:	2101      	movs	r1, #1
    3de4:	e7f4      	b.n	3dd0 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x338>
    3de6:	2100      	movs	r1, #0
    3de8:	7151      	strb	r1, [r2, #5]
    3dea:	68a2      	ldr	r2, [r4, #8]
    3dec:	f8d2 1260 	ldr.w	r1, [r2, #608]	; 0x260
    3df0:	0789      	lsls	r1, r1, #30
    3df2:	f57f ad1d 	bpl.w	3830 <shell_process+0x20>
    3df6:	3b31      	subs	r3, #49	; 0x31
    3df8:	2b1b      	cmp	r3, #27
    3dfa:	f63f ad19 	bhi.w	3830 <shell_process+0x20>
    3dfe:	a101      	add	r1, pc, #4	; (adr r1, 3e04 <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x36c>)
    3e00:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
    3e04:	00003e81 	.word	0x00003e81
    3e08:	00003e8d 	.word	0x00003e8d
    3e0c:	00003ea1 	.word	0x00003ea1
    3e10:	00003e75 	.word	0x00003e75
    3e14:	00003831 	.word	0x00003831
    3e18:	00003831 	.word	0x00003831
    3e1c:	00003831 	.word	0x00003831
    3e20:	00003831 	.word	0x00003831
    3e24:	00003831 	.word	0x00003831
    3e28:	00003831 	.word	0x00003831
    3e2c:	00003831 	.word	0x00003831
    3e30:	00003831 	.word	0x00003831
    3e34:	00003831 	.word	0x00003831
    3e38:	00003831 	.word	0x00003831
    3e3c:	00003831 	.word	0x00003831
    3e40:	00003831 	.word	0x00003831
    3e44:	00003d6f 	.word	0x00003d6f
    3e48:	00003d65 	.word	0x00003d65
    3e4c:	00003d2b 	.word	0x00003d2b
    3e50:	00003d05 	.word	0x00003d05
    3e54:	00003831 	.word	0x00003831
    3e58:	00003e79 	.word	0x00003e79
    3e5c:	00003831 	.word	0x00003831
    3e60:	00003e85 	.word	0x00003e85
    3e64:	00003831 	.word	0x00003831
    3e68:	00003831 	.word	0x00003831
    3e6c:	00003831 	.word	0x00003831
    3e70:	00003e91 	.word	0x00003e91
    3e74:	2303      	movs	r3, #3
    3e76:	7153      	strb	r3, [r2, #5]
    3e78:	4620      	mov	r0, r4
    3e7a:	f006 ff6d 	bl	ad58 <z_shell_op_cursor_end_move>
    3e7e:	e4d7      	b.n	3830 <shell_process+0x20>
    3e80:	2303      	movs	r3, #3
    3e82:	7153      	strb	r3, [r2, #5]
    3e84:	4620      	mov	r0, r4
    3e86:	f006 ff61 	bl	ad4c <z_shell_op_cursor_home_move>
    3e8a:	e4d1      	b.n	3830 <shell_process+0x20>
    3e8c:	2303      	movs	r3, #3
    3e8e:	7153      	strb	r3, [r2, #5]
    3e90:	68a0      	ldr	r0, [r4, #8]
    3e92:	f8d0 1260 	ldr.w	r1, [r0, #608]	; 0x260
    3e96:	f001 0101 	and.w	r1, r1, #1
    3e9a:	f081 0101 	eor.w	r1, r1, #1
    3e9e:	e5ee      	b.n	3a7e <shell_process+0x26e>
    3ea0:	2303      	movs	r3, #3
    3ea2:	7153      	strb	r3, [r2, #5]
    3ea4:	68a3      	ldr	r3, [r4, #8]
    3ea6:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    3eaa:	079b      	lsls	r3, r3, #30
    3eac:	f57f acc0 	bpl.w	3830 <shell_process+0x20>
    3eb0:	e529      	b.n	3906 <shell_process+0xf6>
    3eb2:	2300      	movs	r3, #0
    3eb4:	e782      	b.n	3dbc <CONFIG_UART_CONSOLE_INPUT_EXPIRED_TIMEOUT+0x324>
    3eb6:	bf00      	nop
    3eb8:	0000defa 	.word	0x0000defa
    3ebc:	0000dd2e 	.word	0x0000dd2e
    3ec0:	0000d8aa 	.word	0x0000d8aa
    3ec4:	0000ce02 	.word	0x0000ce02
    3ec8:	0000ce07 	.word	0x0000ce07
    3ecc:	0000cdfd 	.word	0x0000cdfd

00003ed0 <shell_init>:
    3ed0:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    3ed4:	4604      	mov	r4, r0
    3ed6:	6880      	ldr	r0, [r0, #8]
    3ed8:	4688      	mov	r8, r1
    3eda:	f8d0 130c 	ldr.w	r1, [r0, #780]	; 0x30c
    3ede:	b089      	sub	sp, #36	; 0x24
    3ee0:	4615      	mov	r5, r2
    3ee2:	461f      	mov	r7, r3
    3ee4:	2900      	cmp	r1, #0
    3ee6:	d166      	bne.n	3fb6 <shell_init+0xe6>
    3ee8:	f44f 7244 	mov.w	r2, #784	; 0x310
    3eec:	f008 f93e 	bl	c16c <memset>
    3ef0:	68a3      	ldr	r3, [r4, #8]
    3ef2:	6822      	ldr	r2, [r4, #0]
    3ef4:	601a      	str	r2, [r3, #0]
    3ef6:	68e0      	ldr	r0, [r4, #12]
    3ef8:	f007 f97c 	bl	b1f4 <z_shell_history_init>
    3efc:	68a0      	ldr	r0, [r4, #8]
    3efe:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    3f02:	f007 fe38 	bl	bb76 <z_impl_k_mutex_init>
    3f06:	f44f 792a 	mov.w	r9, #680	; 0x2a8
    3f0a:	f44f 761a 	mov.w	r6, #616	; 0x268
    3f0e:	68a0      	ldr	r0, [r4, #8]
    3f10:	4430      	add	r0, r6
    3f12:	f008 f8b0 	bl	c076 <z_impl_k_poll_signal_init>
    3f16:	68a0      	ldr	r0, [r4, #8]
    3f18:	2200      	movs	r2, #0
    3f1a:	1983      	adds	r3, r0, r6
    3f1c:	2101      	movs	r1, #1
    3f1e:	4448      	add	r0, r9
    3f20:	3610      	adds	r6, #16
    3f22:	f008 f88b 	bl	c03c <k_poll_event_init>
    3f26:	f5b6 7f2a 	cmp.w	r6, #680	; 0x2a8
    3f2a:	f109 0914 	add.w	r9, r9, #20
    3f2e:	d1ee      	bne.n	3f0e <shell_init+0x3e>
    3f30:	69a3      	ldr	r3, [r4, #24]
    3f32:	2600      	movs	r6, #0
    3f34:	601e      	str	r6, [r3, #0]
    3f36:	68a0      	ldr	r0, [r4, #8]
    3f38:	2102      	movs	r1, #2
    3f3a:	f500 7019 	add.w	r0, r0, #612	; 0x264
    3f3e:	f006 fc87 	bl	a850 <atomic_or>
    3f42:	68a3      	ldr	r3, [r4, #8]
    3f44:	2250      	movs	r2, #80	; 0x50
    3f46:	855a      	strh	r2, [r3, #42]	; 0x2a
    3f48:	68a3      	ldr	r3, [r4, #8]
    3f4a:	2218      	movs	r2, #24
    3f4c:	851a      	strh	r2, [r3, #40]	; 0x28
    3f4e:	68a3      	ldr	r3, [r4, #8]
    3f50:	6818      	ldr	r0, [r3, #0]
    3f52:	f006 fcb1 	bl	a8b8 <z_shell_strlen>
    3f56:	68a3      	ldr	r3, [r4, #8]
    3f58:	4a18      	ldr	r2, [pc, #96]	; (3fbc <shell_init+0xec>)
    3f5a:	f883 002c 	strb.w	r0, [r3, #44]	; 0x2c
    3f5e:	68a3      	ldr	r3, [r4, #8]
    3f60:	f366 0582 	bfi	r5, r6, #2, #1
    3f64:	f8c3 5260 	str.w	r5, [r3, #608]	; 0x260
    3f68:	6860      	ldr	r0, [r4, #4]
    3f6a:	6803      	ldr	r3, [r0, #0]
    3f6c:	4641      	mov	r1, r8
    3f6e:	681d      	ldr	r5, [r3, #0]
    3f70:	4623      	mov	r3, r4
    3f72:	47a8      	blx	r5
    3f74:	4605      	mov	r5, r0
    3f76:	b9d0      	cbnz	r0, 3fae <shell_init+0xde>
    3f78:	68a3      	ldr	r3, [r4, #8]
    3f7a:	2201      	movs	r2, #1
    3f7c:	711a      	strb	r2, [r3, #4]
    3f7e:	e9d4 0109 	ldrd	r0, r1, [r4, #36]	; 0x24
    3f82:	2200      	movs	r2, #0
    3f84:	2300      	movs	r3, #0
    3f86:	e9cd 2306 	strd	r2, r3, [sp, #24]
    3f8a:	230e      	movs	r3, #14
    3f8c:	9303      	str	r3, [sp, #12]
    3f8e:	9b10      	ldr	r3, [sp, #64]	; 0x40
    3f90:	9504      	str	r5, [sp, #16]
    3f92:	e9cd 7301 	strd	r7, r3, [sp, #4]
    3f96:	9400      	str	r4, [sp, #0]
    3f98:	4b09      	ldr	r3, [pc, #36]	; (3fc0 <shell_init+0xf0>)
    3f9a:	f44f 6200 	mov.w	r2, #2048	; 0x800
    3f9e:	f003 fdbf 	bl	7b20 <z_impl_k_thread_create>
    3fa2:	68a3      	ldr	r3, [r4, #8]
    3fa4:	f8c3 030c 	str.w	r0, [r3, #780]	; 0x30c
    3fa8:	6a21      	ldr	r1, [r4, #32]
    3faa:	f003 fcf5 	bl	7998 <z_impl_k_thread_name_set>
    3fae:	4628      	mov	r0, r5
    3fb0:	b009      	add	sp, #36	; 0x24
    3fb2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    3fb6:	f06f 0577 	mvn.w	r5, #119	; 0x77
    3fba:	e7f8      	b.n	3fae <shell_init+0xde>
    3fbc:	0000a8e3 	.word	0x0000a8e3
    3fc0:	00004019 	.word	0x00004019

00003fc4 <shell_start>:
    3fc4:	b510      	push	{r4, lr}
    3fc6:	4604      	mov	r4, r0
    3fc8:	6880      	ldr	r0, [r0, #8]
    3fca:	7903      	ldrb	r3, [r0, #4]
    3fcc:	2b01      	cmp	r3, #1
    3fce:	d11d      	bne.n	400c <CONFIG_COVERAGE_GCOV_HEAP_SIZE+0xc>
    3fd0:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    3fd4:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    3fd8:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    3fdc:	f006 fc7f 	bl	a8de <k_mutex_lock.constprop.0.isra.0>
    3fe0:	4620      	mov	r0, r4
    3fe2:	2108      	movs	r1, #8
    3fe4:	f000 fb20 	bl	4628 <z_shell_vt100_color_set>
    3fe8:	6820      	ldr	r0, [r4, #0]
    3fea:	f006 fc65 	bl	a8b8 <z_shell_strlen>
    3fee:	b118      	cbz	r0, 3ff8 <shell_start+0x34>
    3ff0:	4908      	ldr	r1, [pc, #32]	; (4014 <CONFIG_COVERAGE_GCOV_HEAP_SIZE+0x14>)
    3ff2:	6960      	ldr	r0, [r4, #20]
    3ff4:	f006 fc66 	bl	a8c4 <z_shell_raw_fprintf>
    3ff8:	4620      	mov	r0, r4
    3ffa:	f7ff fa79 	bl	34f0 <state_set.constprop.0>
    3ffe:	68a0      	ldr	r0, [r4, #8]
    4000:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    4004:	f006 fcb5 	bl	a972 <k_mutex_unlock.isra.0>
    4008:	2000      	movs	r0, #0
    400a:	bd10      	pop	{r4, pc}
    400c:	f06f 0085 	mvn.w	r0, #133	; 0x85
    4010:	e7fb      	b.n	400a <CONFIG_COVERAGE_GCOV_HEAP_SIZE+0xa>
    4012:	bf00      	nop
    4014:	0000d6d9 	.word	0x0000d6d9

00004018 <shell_thread>:
    4018:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    401a:	4604      	mov	r4, r0
    401c:	6840      	ldr	r0, [r0, #4]
    401e:	6803      	ldr	r3, [r0, #0]
    4020:	2100      	movs	r1, #0
    4022:	689b      	ldr	r3, [r3, #8]
    4024:	4798      	blx	r3
    4026:	2800      	cmp	r0, #0
    4028:	d13f      	bne.n	40aa <shell_thread+0x92>
    402a:	4620      	mov	r0, r4
    402c:	f7ff ffca 	bl	3fc4 <shell_start>
    4030:	2800      	cmp	r0, #0
    4032:	d13a      	bne.n	40aa <shell_thread+0x92>
    4034:	4e1d      	ldr	r6, [pc, #116]	; (40ac <shell_thread+0x94>)
    4036:	4f1e      	ldr	r7, [pc, #120]	; (40b0 <shell_thread+0x98>)
    4038:	68a0      	ldr	r0, [r4, #8]
    403a:	f500 702a 	add.w	r0, r0, #680	; 0x2a8
    403e:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    4042:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    4046:	2103      	movs	r1, #3
    4048:	f004 fbd0 	bl	87ec <z_impl_k_poll>
    404c:	4605      	mov	r5, r0
    404e:	68a0      	ldr	r0, [r4, #8]
    4050:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    4054:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    4058:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    405c:	b175      	cbz	r5, 407c <shell_thread+0x64>
    405e:	f006 fc3e 	bl	a8de <k_mutex_lock.constprop.0.isra.0>
    4062:	4620      	mov	r0, r4
    4064:	462b      	mov	r3, r5
    4066:	4a13      	ldr	r2, [pc, #76]	; (40b4 <shell_thread+0x9c>)
    4068:	2101      	movs	r1, #1
    406a:	f006 ff1d 	bl	aea8 <z_shell_fprintf>
    406e:	68a0      	ldr	r0, [r4, #8]
    4070:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    4074:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    4078:	f006 bc7b 	b.w	a972 <k_mutex_unlock.isra.0>
    407c:	f006 fc2f 	bl	a8de <k_mutex_lock.constprop.0.isra.0>
    4080:	4632      	mov	r2, r6
    4082:	2102      	movs	r1, #2
    4084:	4620      	mov	r0, r4
    4086:	f006 fc01 	bl	a88c <shell_signal_handle>
    408a:	4620      	mov	r0, r4
    408c:	463a      	mov	r2, r7
    408e:	4629      	mov	r1, r5
    4090:	f006 fbfc 	bl	a88c <shell_signal_handle>
    4094:	6860      	ldr	r0, [r4, #4]
    4096:	6803      	ldr	r3, [r0, #0]
    4098:	695b      	ldr	r3, [r3, #20]
    409a:	b103      	cbz	r3, 409e <shell_thread+0x86>
    409c:	4798      	blx	r3
    409e:	68a0      	ldr	r0, [r4, #8]
    40a0:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    40a4:	f006 fc65 	bl	a972 <k_mutex_unlock.isra.0>
    40a8:	e7c6      	b.n	4038 <shell_thread+0x20>
    40aa:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    40ac:	0000a8f7 	.word	0x0000a8f7
    40b0:	00003811 	.word	0x00003811
    40b4:	0000dd34 	.word	0x0000dd34

000040b8 <cmd_help>:
    40b8:	b510      	push	{r4, lr}
    40ba:	4a0d      	ldr	r2, [pc, #52]	; (40f0 <cmd_help+0x38>)
    40bc:	4604      	mov	r4, r0
    40be:	2108      	movs	r1, #8
    40c0:	f006 fc96 	bl	a9f0 <shell_fprintf>
    40c4:	4620      	mov	r0, r4
    40c6:	4a0b      	ldr	r2, [pc, #44]	; (40f4 <cmd_help+0x3c>)
    40c8:	2108      	movs	r1, #8
    40ca:	f006 fc91 	bl	a9f0 <shell_fprintf>
    40ce:	4620      	mov	r0, r4
    40d0:	4a09      	ldr	r2, [pc, #36]	; (40f8 <cmd_help+0x40>)
    40d2:	2108      	movs	r1, #8
    40d4:	f006 fc8c 	bl	a9f0 <shell_fprintf>
    40d8:	4620      	mov	r0, r4
    40da:	4a08      	ldr	r2, [pc, #32]	; (40fc <cmd_help+0x44>)
    40dc:	2108      	movs	r1, #8
    40de:	f006 fc87 	bl	a9f0 <shell_fprintf>
    40e2:	4620      	mov	r0, r4
    40e4:	4a06      	ldr	r2, [pc, #24]	; (4100 <cmd_help+0x48>)
    40e6:	2100      	movs	r1, #0
    40e8:	f000 fc3c 	bl	4964 <z_shell_help_subcmd_print>
    40ec:	2000      	movs	r0, #0
    40ee:	bd10      	pop	{r4, pc}
    40f0:	0000dd4b 	.word	0x0000dd4b
    40f4:	0000dd89 	.word	0x0000dd89
    40f8:	0000dde8 	.word	0x0000dde8
    40fc:	0000de3c 	.word	0x0000de3c
    4100:	0000ded6 	.word	0x0000ded6

00004104 <shell_hexdump_line>:
    4104:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    4106:	461e      	mov	r6, r3
    4108:	4617      	mov	r7, r2
    410a:	460b      	mov	r3, r1
    410c:	4a2f      	ldr	r2, [pc, #188]	; (41cc <shell_hexdump_line+0xc8>)
    410e:	2108      	movs	r1, #8
    4110:	4604      	mov	r4, r0
    4112:	f006 fc6d 	bl	a9f0 <shell_fprintf>
    4116:	b36e      	cbz	r6, 4174 <shell_hexdump_line+0x70>
    4118:	783b      	ldrb	r3, [r7, #0]
    411a:	4a2d      	ldr	r2, [pc, #180]	; (41d0 <shell_hexdump_line+0xcc>)
    411c:	2108      	movs	r1, #8
    411e:	4620      	mov	r0, r4
    4120:	f006 fc66 	bl	a9f0 <shell_fprintf>
    4124:	2501      	movs	r5, #1
    4126:	076a      	lsls	r2, r5, #29
    4128:	d104      	bne.n	4134 <shell_hexdump_line+0x30>
    412a:	4a2a      	ldr	r2, [pc, #168]	; (41d4 <shell_hexdump_line+0xd0>)
    412c:	2108      	movs	r1, #8
    412e:	4620      	mov	r0, r4
    4130:	f006 fc5e 	bl	a9f0 <shell_fprintf>
    4134:	42ae      	cmp	r6, r5
    4136:	d923      	bls.n	4180 <shell_hexdump_line+0x7c>
    4138:	5d7b      	ldrb	r3, [r7, r5]
    413a:	4a25      	ldr	r2, [pc, #148]	; (41d0 <shell_hexdump_line+0xcc>)
    413c:	2108      	movs	r1, #8
    413e:	4620      	mov	r0, r4
    4140:	f006 fc56 	bl	a9f0 <shell_fprintf>
    4144:	3501      	adds	r5, #1
    4146:	2d10      	cmp	r5, #16
    4148:	d1ed      	bne.n	4126 <shell_hexdump_line+0x22>
    414a:	4a23      	ldr	r2, [pc, #140]	; (41d8 <shell_hexdump_line+0xd4>)
    414c:	2108      	movs	r1, #8
    414e:	4620      	mov	r0, r4
    4150:	f006 fc4e 	bl	a9f0 <shell_fprintf>
    4154:	b9d6      	cbnz	r6, 418c <shell_hexdump_line+0x88>
    4156:	4a1f      	ldr	r2, [pc, #124]	; (41d4 <shell_hexdump_line+0xd0>)
    4158:	2108      	movs	r1, #8
    415a:	4620      	mov	r0, r4
    415c:	f006 fc48 	bl	a9f0 <shell_fprintf>
    4160:	2501      	movs	r5, #1
    4162:	42ae      	cmp	r6, r5
    4164:	462b      	mov	r3, r5
    4166:	d813      	bhi.n	4190 <shell_hexdump_line+0x8c>
    4168:	4a1a      	ldr	r2, [pc, #104]	; (41d4 <shell_hexdump_line+0xd0>)
    416a:	2108      	movs	r1, #8
    416c:	4620      	mov	r0, r4
    416e:	f006 fc3f 	bl	a9f0 <shell_fprintf>
    4172:	e019      	b.n	41a8 <shell_hexdump_line+0xa4>
    4174:	4a19      	ldr	r2, [pc, #100]	; (41dc <shell_hexdump_line+0xd8>)
    4176:	2108      	movs	r1, #8
    4178:	4620      	mov	r0, r4
    417a:	f006 fc39 	bl	a9f0 <shell_fprintf>
    417e:	2501      	movs	r5, #1
    4180:	4a16      	ldr	r2, [pc, #88]	; (41dc <shell_hexdump_line+0xd8>)
    4182:	2108      	movs	r1, #8
    4184:	4620      	mov	r0, r4
    4186:	f006 fc33 	bl	a9f0 <shell_fprintf>
    418a:	e7db      	b.n	4144 <shell_hexdump_line+0x40>
    418c:	2500      	movs	r5, #0
    418e:	462b      	mov	r3, r5
    4190:	5cfb      	ldrb	r3, [r7, r3]
    4192:	4a13      	ldr	r2, [pc, #76]	; (41e0 <shell_hexdump_line+0xdc>)
    4194:	5cd2      	ldrb	r2, [r2, r3]
    4196:	f012 0f97 	tst.w	r2, #151	; 0x97
    419a:	bf08      	it	eq
    419c:	232e      	moveq	r3, #46	; 0x2e
    419e:	4a11      	ldr	r2, [pc, #68]	; (41e4 <shell_hexdump_line+0xe0>)
    41a0:	2108      	movs	r1, #8
    41a2:	4620      	mov	r0, r4
    41a4:	f006 fc24 	bl	a9f0 <shell_fprintf>
    41a8:	3501      	adds	r5, #1
    41aa:	2d10      	cmp	r5, #16
    41ac:	d007      	beq.n	41be <shell_hexdump_line+0xba>
    41ae:	076b      	lsls	r3, r5, #29
    41b0:	d1d7      	bne.n	4162 <shell_hexdump_line+0x5e>
    41b2:	4a08      	ldr	r2, [pc, #32]	; (41d4 <shell_hexdump_line+0xd0>)
    41b4:	2108      	movs	r1, #8
    41b6:	4620      	mov	r0, r4
    41b8:	f006 fc1a 	bl	a9f0 <shell_fprintf>
    41bc:	e7d1      	b.n	4162 <shell_hexdump_line+0x5e>
    41be:	4620      	mov	r0, r4
    41c0:	4a09      	ldr	r2, [pc, #36]	; (41e8 <shell_hexdump_line+0xe4>)
    41c2:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    41c6:	2108      	movs	r1, #8
    41c8:	f006 bc12 	b.w	a9f0 <shell_fprintf>
    41cc:	0000deec 	.word	0x0000deec
    41d0:	0000def3 	.word	0x0000def3
    41d4:	0000defb 	.word	0x0000defb
    41d8:	0000defd 	.word	0x0000defd
    41dc:	0000def9 	.word	0x0000def9
    41e0:	0000e695 	.word	0x0000e695
    41e4:	0000df1f 	.word	0x0000df1f
    41e8:	0000deff 	.word	0x0000deff

000041ec <z_shell_fprintf_fmt>:
    41ec:	b513      	push	{r0, r1, r4, lr}
    41ee:	4613      	mov	r3, r2
    41f0:	4604      	mov	r4, r0
    41f2:	2200      	movs	r2, #0
    41f4:	9200      	str	r2, [sp, #0]
    41f6:	460a      	mov	r2, r1
    41f8:	4601      	mov	r1, r0
    41fa:	4807      	ldr	r0, [pc, #28]	; (4218 <z_shell_fprintf_fmt+0x2c>)
    41fc:	f7fe f856 	bl	22ac <z_cbvprintf_impl>
    4200:	6923      	ldr	r3, [r4, #16]
    4202:	791b      	ldrb	r3, [r3, #4]
    4204:	b12b      	cbz	r3, 4212 <z_shell_fprintf_fmt+0x26>
    4206:	4620      	mov	r0, r4
    4208:	b002      	add	sp, #8
    420a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    420e:	f006 bbff 	b.w	aa10 <z_shell_fprintf_buffer_flush>
    4212:	b002      	add	sp, #8
    4214:	bd10      	pop	{r4, pc}
    4216:	bf00      	nop
    4218:	0000aa29 	.word	0x0000aa29

0000421c <z_shell_make_argv>:
    421c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    4220:	b085      	sub	sp, #20
    4222:	2600      	movs	r6, #0
    4224:	f8df a1a8 	ldr.w	sl, [pc, #424]	; 43d0 <z_shell_make_argv+0x1b4>
    4228:	9101      	str	r1, [sp, #4]
    422a:	4607      	mov	r7, r0
    422c:	4614      	mov	r4, r2
    422e:	4699      	mov	r9, r3
    4230:	6006      	str	r6, [r0, #0]
    4232:	46b3      	mov	fp, r6
    4234:	7823      	ldrb	r3, [r4, #0]
    4236:	2b00      	cmp	r3, #0
    4238:	f000 80c6 	beq.w	43c8 <z_shell_make_argv+0x1ac>
    423c:	f81a 3003 	ldrb.w	r3, [sl, r3]
    4240:	f013 0308 	ands.w	r3, r3, #8
    4244:	d004      	beq.n	4250 <z_shell_make_argv+0x34>
    4246:	f804 bb01 	strb.w	fp, [r4], #1
    424a:	e7f3      	b.n	4234 <z_shell_make_argv+0x18>
    424c:	2600      	movs	r6, #0
    424e:	e7f1      	b.n	4234 <z_shell_make_argv+0x18>
    4250:	683a      	ldr	r2, [r7, #0]
    4252:	1c51      	adds	r1, r2, #1
    4254:	6039      	str	r1, [r7, #0]
    4256:	9901      	ldr	r1, [sp, #4]
    4258:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
    425c:	683a      	ldr	r2, [r7, #0]
    425e:	454a      	cmp	r2, r9
    4260:	f000 80b2 	beq.w	43c8 <z_shell_make_argv+0x1ac>
    4264:	461e      	mov	r6, r3
    4266:	7821      	ldrb	r1, [r4, #0]
    4268:	2900      	cmp	r1, #0
    426a:	d0e3      	beq.n	4234 <z_shell_make_argv+0x18>
    426c:	b9a6      	cbnz	r6, 4298 <z_shell_make_argv+0x7c>
    426e:	460e      	mov	r6, r1
    4270:	4623      	mov	r3, r4
    4272:	461c      	mov	r4, r3
    4274:	2e27      	cmp	r6, #39	; 0x27
    4276:	d004      	beq.n	4282 <z_shell_make_argv+0x66>
    4278:	2e5c      	cmp	r6, #92	; 0x5c
    427a:	d020      	beq.n	42be <z_shell_make_argv+0xa2>
    427c:	2e22      	cmp	r6, #34	; 0x22
    427e:	f040 8097 	bne.w	43b0 <z_shell_make_argv+0x194>
    4282:	4620      	mov	r0, r4
    4284:	f006 fbee 	bl	aa64 <z_shell_strlen>
    4288:	1c61      	adds	r1, r4, #1
    428a:	4602      	mov	r2, r0
    428c:	4620      	mov	r0, r4
    428e:	f007 ff53 	bl	c138 <memmove>
    4292:	7821      	ldrb	r1, [r4, #0]
    4294:	2900      	cmp	r1, #0
    4296:	d0cd      	beq.n	4234 <z_shell_make_argv+0x18>
    4298:	42b1      	cmp	r1, r6
    429a:	46a0      	mov	r8, r4
    429c:	f104 0401 	add.w	r4, r4, #1
    42a0:	d11b      	bne.n	42da <z_shell_make_argv+0xbe>
    42a2:	4640      	mov	r0, r8
    42a4:	f006 fbde 	bl	aa64 <z_shell_strlen>
    42a8:	4621      	mov	r1, r4
    42aa:	4602      	mov	r2, r0
    42ac:	4640      	mov	r0, r8
    42ae:	f007 ff43 	bl	c138 <memmove>
    42b2:	f898 6000 	ldrb.w	r6, [r8]
    42b6:	4644      	mov	r4, r8
    42b8:	2e00      	cmp	r6, #0
    42ba:	d1d9      	bne.n	4270 <z_shell_make_argv+0x54>
    42bc:	e7ba      	b.n	4234 <z_shell_make_argv+0x18>
    42be:	4620      	mov	r0, r4
    42c0:	f006 fbd0 	bl	aa64 <z_shell_strlen>
    42c4:	1c65      	adds	r5, r4, #1
    42c6:	4602      	mov	r2, r0
    42c8:	4629      	mov	r1, r5
    42ca:	4620      	mov	r0, r4
    42cc:	f007 ff34 	bl	c138 <memmove>
    42d0:	7866      	ldrb	r6, [r4, #1]
    42d2:	462c      	mov	r4, r5
    42d4:	2e00      	cmp	r6, #0
    42d6:	d1cd      	bne.n	4274 <z_shell_make_argv+0x58>
    42d8:	e7ac      	b.n	4234 <z_shell_make_argv+0x18>
    42da:	295c      	cmp	r1, #92	; 0x5c
    42dc:	f898 1001 	ldrb.w	r1, [r8, #1]
    42e0:	d1d8      	bne.n	4294 <z_shell_make_argv+0x78>
    42e2:	42b1      	cmp	r1, r6
    42e4:	468c      	mov	ip, r1
    42e6:	d108      	bne.n	42fa <z_shell_make_argv+0xde>
    42e8:	4640      	mov	r0, r8
    42ea:	f006 fbbb 	bl	aa64 <z_shell_strlen>
    42ee:	4621      	mov	r1, r4
    42f0:	4602      	mov	r2, r0
    42f2:	4640      	mov	r0, r8
    42f4:	f007 ff20 	bl	c138 <memmove>
    42f8:	e7b5      	b.n	4266 <z_shell_make_argv+0x4a>
    42fa:	2930      	cmp	r1, #48	; 0x30
    42fc:	d125      	bne.n	434a <z_shell_make_argv+0x12e>
    42fe:	2500      	movs	r5, #0
    4300:	2202      	movs	r2, #2
    4302:	f818 c002 	ldrb.w	ip, [r8, r2]
    4306:	f1ac 0030 	sub.w	r0, ip, #48	; 0x30
    430a:	b2c0      	uxtb	r0, r0
    430c:	2807      	cmp	r0, #7
    430e:	d819      	bhi.n	4344 <z_shell_make_argv+0x128>
    4310:	00ed      	lsls	r5, r5, #3
    4312:	3201      	adds	r2, #1
    4314:	b2ed      	uxtb	r5, r5
    4316:	2a05      	cmp	r2, #5
    4318:	ea45 0500 	orr.w	r5, r5, r0
    431c:	d1f1      	bne.n	4302 <z_shell_make_argv+0xe6>
    431e:	1e51      	subs	r1, r2, #1
    4320:	4441      	add	r1, r8
    4322:	4640      	mov	r0, r8
    4324:	9203      	str	r2, [sp, #12]
    4326:	9102      	str	r1, [sp, #8]
    4328:	f006 fb9c 	bl	aa64 <z_shell_strlen>
    432c:	9a03      	ldr	r2, [sp, #12]
    432e:	9902      	ldr	r1, [sp, #8]
    4330:	3a02      	subs	r2, #2
    4332:	1a82      	subs	r2, r0, r2
    4334:	4640      	mov	r0, r8
    4336:	f007 feff 	bl	c138 <memmove>
    433a:	f898 1001 	ldrb.w	r1, [r8, #1]
    433e:	f888 5000 	strb.w	r5, [r8]
    4342:	e7a7      	b.n	4294 <z_shell_make_argv+0x78>
    4344:	b2d2      	uxtb	r2, r2
    4346:	2a02      	cmp	r2, #2
    4348:	d1e9      	bne.n	431e <z_shell_make_argv+0x102>
    434a:	f1bc 0f78 	cmp.w	ip, #120	; 0x78
    434e:	d12a      	bne.n	43a6 <z_shell_make_argv+0x18a>
    4350:	2500      	movs	r5, #0
    4352:	2002      	movs	r0, #2
    4354:	f818 2000 	ldrb.w	r2, [r8, r0]
    4358:	f1a2 0c30 	sub.w	ip, r2, #48	; 0x30
    435c:	fa5f fc8c 	uxtb.w	ip, ip
    4360:	f1bc 0f09 	cmp.w	ip, #9
    4364:	d809      	bhi.n	437a <z_shell_make_argv+0x15e>
    4366:	012d      	lsls	r5, r5, #4
    4368:	b2ed      	uxtb	r5, r5
    436a:	ea4c 0505 	orr.w	r5, ip, r5
    436e:	2802      	cmp	r0, #2
    4370:	d001      	beq.n	4376 <z_shell_make_argv+0x15a>
    4372:	2204      	movs	r2, #4
    4374:	e7d3      	b.n	431e <z_shell_make_argv+0x102>
    4376:	2003      	movs	r0, #3
    4378:	e7ec      	b.n	4354 <z_shell_make_argv+0x138>
    437a:	f1a2 0c61 	sub.w	ip, r2, #97	; 0x61
    437e:	f1bc 0f05 	cmp.w	ip, #5
    4382:	d805      	bhi.n	4390 <z_shell_make_argv+0x174>
    4384:	012d      	lsls	r5, r5, #4
    4386:	b2ed      	uxtb	r5, r5
    4388:	3a57      	subs	r2, #87	; 0x57
    438a:	4315      	orrs	r5, r2
    438c:	b2ed      	uxtb	r5, r5
    438e:	e7ee      	b.n	436e <z_shell_make_argv+0x152>
    4390:	f1a2 0c41 	sub.w	ip, r2, #65	; 0x41
    4394:	f1bc 0f05 	cmp.w	ip, #5
    4398:	d803      	bhi.n	43a2 <z_shell_make_argv+0x186>
    439a:	012d      	lsls	r5, r5, #4
    439c:	b2ed      	uxtb	r5, r5
    439e:	3a37      	subs	r2, #55	; 0x37
    43a0:	e7f3      	b.n	438a <z_shell_make_argv+0x16e>
    43a2:	2802      	cmp	r0, #2
    43a4:	d102      	bne.n	43ac <z_shell_make_argv+0x190>
    43a6:	f108 0401 	add.w	r4, r8, #1
    43aa:	e773      	b.n	4294 <z_shell_make_argv+0x78>
    43ac:	2203      	movs	r2, #3
    43ae:	e7b6      	b.n	431e <z_shell_make_argv+0x102>
    43b0:	f81a 3006 	ldrb.w	r3, [sl, r6]
    43b4:	071b      	lsls	r3, r3, #28
    43b6:	f53f af49 	bmi.w	424c <z_shell_make_argv+0x30>
    43ba:	7866      	ldrb	r6, [r4, #1]
    43bc:	1c63      	adds	r3, r4, #1
    43be:	2e00      	cmp	r6, #0
    43c0:	f47f af57 	bne.w	4272 <z_shell_make_argv+0x56>
    43c4:	461c      	mov	r4, r3
    43c6:	e735      	b.n	4234 <z_shell_make_argv+0x18>
    43c8:	4630      	mov	r0, r6
    43ca:	b005      	add	sp, #20
    43cc:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    43d0:	0000e695 	.word	0x0000e695

000043d4 <z_shell_cmd_get>:
    43d4:	b538      	push	{r3, r4, r5, lr}
    43d6:	460b      	mov	r3, r1
    43d8:	4615      	mov	r5, r2
    43da:	b948      	cbnz	r0, 43f0 <z_shell_cmd_get+0x1c>
    43dc:	4914      	ldr	r1, [pc, #80]	; (4430 <z_shell_cmd_get+0x5c>)
    43de:	4a15      	ldr	r2, [pc, #84]	; (4434 <z_shell_cmd_get+0x60>)
    43e0:	1a52      	subs	r2, r2, r1
    43e2:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
    43e6:	d205      	bcs.n	43f4 <z_shell_cmd_get+0x20>
    43e8:	f851 5023 	ldr.w	r5, [r1, r3, lsl #2]
    43ec:	4628      	mov	r0, r5
    43ee:	bd38      	pop	{r3, r4, r5, pc}
    43f0:	6884      	ldr	r4, [r0, #8]
    43f2:	b90c      	cbnz	r4, 43f8 <z_shell_cmd_get+0x24>
    43f4:	2500      	movs	r5, #0
    43f6:	e7f9      	b.n	43ec <z_shell_cmd_get+0x18>
    43f8:	4a0f      	ldr	r2, [pc, #60]	; (4438 <z_shell_cmd_get+0x64>)
    43fa:	4294      	cmp	r4, r2
    43fc:	d30a      	bcc.n	4414 <z_shell_cmd_get+0x40>
    43fe:	4a0f      	ldr	r2, [pc, #60]	; (443c <z_shell_cmd_get+0x68>)
    4400:	4294      	cmp	r4, r2
    4402:	d207      	bcs.n	4414 <z_shell_cmd_get+0x40>
    4404:	4618      	mov	r0, r3
    4406:	6822      	ldr	r2, [r4, #0]
    4408:	4629      	mov	r1, r5
    440a:	4790      	blx	r2
    440c:	682b      	ldr	r3, [r5, #0]
    440e:	2b00      	cmp	r3, #0
    4410:	d1ec      	bne.n	43ec <z_shell_cmd_get+0x18>
    4412:	e7ef      	b.n	43f4 <z_shell_cmd_get+0x20>
    4414:	4a0a      	ldr	r2, [pc, #40]	; (4440 <z_shell_cmd_get+0x6c>)
    4416:	4294      	cmp	r4, r2
    4418:	d302      	bcc.n	4420 <z_shell_cmd_get+0x4c>
    441a:	4a0a      	ldr	r2, [pc, #40]	; (4444 <z_shell_cmd_get+0x70>)
    441c:	4294      	cmp	r4, r2
    441e:	d305      	bcc.n	442c <z_shell_cmd_get+0x58>
    4420:	6824      	ldr	r4, [r4, #0]
    4422:	2214      	movs	r2, #20
    4424:	4353      	muls	r3, r2
    4426:	18e5      	adds	r5, r4, r3
    4428:	58e3      	ldr	r3, [r4, r3]
    442a:	e7f0      	b.n	440e <z_shell_cmd_get+0x3a>
    442c:	3301      	adds	r3, #1
    442e:	e7f8      	b.n	4422 <z_shell_cmd_get+0x4e>
    4430:	0000cb30 	.word	0x0000cb30
    4434:	0000cb54 	.word	0x0000cb54
    4438:	0000cb68 	.word	0x0000cb68
    443c:	0000cb68 	.word	0x0000cb68
    4440:	0000cb54 	.word	0x0000cb54
    4444:	0000cb68 	.word	0x0000cb68

00004448 <z_shell_spaces_trim>:
    4448:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    444c:	4607      	mov	r7, r0
    444e:	f006 fb09 	bl	aa64 <z_shell_strlen>
    4452:	4606      	mov	r6, r0
    4454:	bb37      	cbnz	r7, 44a4 <z_shell_spaces_trim+0x5c>
    4456:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    445a:	b154      	cbz	r4, 4472 <z_shell_spaces_trim+0x2a>
    445c:	b28a      	uxth	r2, r1
    445e:	1ab2      	subs	r2, r6, r2
    4460:	3001      	adds	r0, #1
    4462:	3201      	adds	r2, #1
    4464:	4439      	add	r1, r7
    4466:	4438      	add	r0, r7
    4468:	f007 fe66 	bl	c138 <memmove>
    446c:	1b34      	subs	r4, r6, r4
    446e:	b2a6      	uxth	r6, r4
    4470:	4644      	mov	r4, r8
    4472:	1e73      	subs	r3, r6, #1
    4474:	429d      	cmp	r5, r3
    4476:	daee      	bge.n	4456 <z_shell_spaces_trim+0xe>
    4478:	4628      	mov	r0, r5
    447a:	3501      	adds	r5, #1
    447c:	5c3b      	ldrb	r3, [r7, r0]
    447e:	f819 3003 	ldrb.w	r3, [r9, r3]
    4482:	071b      	lsls	r3, r3, #28
    4484:	b2ad      	uxth	r5, r5
    4486:	d5f4      	bpl.n	4472 <z_shell_spaces_trim+0x2a>
    4488:	4629      	mov	r1, r5
    448a:	b28b      	uxth	r3, r1
    448c:	429e      	cmp	r6, r3
    448e:	d9f0      	bls.n	4472 <z_shell_spaces_trim+0x2a>
    4490:	5c7b      	ldrb	r3, [r7, r1]
    4492:	f819 8003 	ldrb.w	r8, [r9, r3]
    4496:	f018 0808 	ands.w	r8, r8, #8
    449a:	d0de      	beq.n	445a <z_shell_spaces_trim+0x12>
    449c:	3401      	adds	r4, #1
    449e:	3101      	adds	r1, #1
    44a0:	b2a4      	uxth	r4, r4
    44a2:	e7f2      	b.n	448a <z_shell_spaces_trim+0x42>
    44a4:	2500      	movs	r5, #0
    44a6:	f8df 9008 	ldr.w	r9, [pc, #8]	; 44b0 <z_shell_spaces_trim+0x68>
    44aa:	462c      	mov	r4, r5
    44ac:	e7e1      	b.n	4472 <z_shell_spaces_trim+0x2a>
    44ae:	bf00      	nop
    44b0:	0000e695 	.word	0x0000e695

000044b4 <z_shell_cmd_trim>:
    44b4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    44b6:	6884      	ldr	r4, [r0, #8]
    44b8:	f894 3042 	ldrb.w	r3, [r4, #66]	; 0x42
    44bc:	4605      	mov	r5, r0
    44be:	b953      	cbnz	r3, 44d6 <z_shell_cmd_trim+0x22>
    44c0:	68ab      	ldr	r3, [r5, #8]
    44c2:	8f9a      	ldrh	r2, [r3, #60]	; 0x3c
    44c4:	87da      	strh	r2, [r3, #62]	; 0x3e
    44c6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    44c8:	3a01      	subs	r2, #1
    44ca:	b292      	uxth	r2, r2
    44cc:	87a2      	strh	r2, [r4, #60]	; 0x3c
    44ce:	b92a      	cbnz	r2, 44dc <z_shell_cmd_trim+0x28>
    44d0:	f884 2042 	strb.w	r2, [r4, #66]	; 0x42
    44d4:	e7f4      	b.n	44c0 <z_shell_cmd_trim+0xc>
    44d6:	4e12      	ldr	r6, [pc, #72]	; (4520 <z_shell_cmd_trim+0x6c>)
    44d8:	f104 0042 	add.w	r0, r4, #66	; 0x42
    44dc:	8fa2      	ldrh	r2, [r4, #60]	; 0x3c
    44de:	1883      	adds	r3, r0, r2
    44e0:	f813 3c01 	ldrb.w	r3, [r3, #-1]
    44e4:	5cf3      	ldrb	r3, [r6, r3]
    44e6:	f013 0308 	ands.w	r3, r3, #8
    44ea:	d1ed      	bne.n	44c8 <z_shell_cmd_trim+0x14>
    44ec:	5483      	strb	r3, [r0, r2]
    44ee:	b29a      	uxth	r2, r3
    44f0:	fa10 f183 	uxtah	r1, r0, r3
    44f4:	f810 c002 	ldrb.w	ip, [r0, r2]
    44f8:	f816 c00c 	ldrb.w	ip, [r6, ip]
    44fc:	f01c 0f08 	tst.w	ip, #8
    4500:	461f      	mov	r7, r3
    4502:	f103 0301 	add.w	r3, r3, #1
    4506:	d1f2      	bne.n	44ee <z_shell_cmd_trim+0x3a>
    4508:	b2bf      	uxth	r7, r7
    450a:	2f00      	cmp	r7, #0
    450c:	d0d8      	beq.n	44c0 <z_shell_cmd_trim+0xc>
    450e:	8fa6      	ldrh	r6, [r4, #60]	; 0x3c
    4510:	1c73      	adds	r3, r6, #1
    4512:	1a9a      	subs	r2, r3, r2
    4514:	1bf6      	subs	r6, r6, r7
    4516:	f007 fe0f 	bl	c138 <memmove>
    451a:	87a6      	strh	r6, [r4, #60]	; 0x3c
    451c:	e7d0      	b.n	44c0 <z_shell_cmd_trim+0xc>
    451e:	bf00      	nop
    4520:	0000e695 	.word	0x0000e695

00004524 <z_clear_eos>:
    4524:	6883      	ldr	r3, [r0, #8]
    4526:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    452a:	069b      	lsls	r3, r3, #26
    452c:	d503      	bpl.n	4536 <z_clear_eos+0x12>
    452e:	4902      	ldr	r1, [pc, #8]	; (4538 <z_clear_eos+0x14>)
    4530:	6940      	ldr	r0, [r0, #20]
    4532:	f006 bb7a 	b.w	ac2a <z_shell_raw_fprintf>
    4536:	4770      	bx	lr
    4538:	0000ce0d 	.word	0x0000ce0d

0000453c <z_cursor_next_line_move.isra.0>:
    453c:	4901      	ldr	r1, [pc, #4]	; (4544 <z_cursor_next_line_move.isra.0+0x8>)
    453e:	f006 bb74 	b.w	ac2a <z_shell_raw_fprintf>
    4542:	bf00      	nop
    4544:	0000d6da 	.word	0x0000d6da

00004548 <z_shell_op_cursor_vert_move>:
    4548:	1e0a      	subs	r2, r1, #0
    454a:	dc0d      	bgt.n	4568 <z_shell_op_cursor_vert_move+0x20>
    454c:	d00e      	beq.n	456c <z_shell_op_cursor_vert_move+0x24>
    454e:	2342      	movs	r3, #66	; 0x42
    4550:	6881      	ldr	r1, [r0, #8]
    4552:	f8d1 1260 	ldr.w	r1, [r1, #608]	; 0x260
    4556:	0689      	lsls	r1, r1, #26
    4558:	d508      	bpl.n	456c <z_shell_op_cursor_vert_move+0x24>
    455a:	2a00      	cmp	r2, #0
    455c:	4904      	ldr	r1, [pc, #16]	; (4570 <z_shell_op_cursor_vert_move+0x28>)
    455e:	6940      	ldr	r0, [r0, #20]
    4560:	bfb8      	it	lt
    4562:	4252      	neglt	r2, r2
    4564:	f006 bb61 	b.w	ac2a <z_shell_raw_fprintf>
    4568:	2341      	movs	r3, #65	; 0x41
    456a:	e7f1      	b.n	4550 <z_shell_op_cursor_vert_move+0x8>
    456c:	4770      	bx	lr
    456e:	bf00      	nop
    4570:	0000df1b 	.word	0x0000df1b

00004574 <z_shell_op_cursor_horiz_move>:
    4574:	1e0a      	subs	r2, r1, #0
    4576:	dc0d      	bgt.n	4594 <z_shell_op_cursor_horiz_move+0x20>
    4578:	d00e      	beq.n	4598 <z_shell_op_cursor_horiz_move+0x24>
    457a:	2344      	movs	r3, #68	; 0x44
    457c:	6881      	ldr	r1, [r0, #8]
    457e:	f8d1 1260 	ldr.w	r1, [r1, #608]	; 0x260
    4582:	0689      	lsls	r1, r1, #26
    4584:	d508      	bpl.n	4598 <z_shell_op_cursor_horiz_move+0x24>
    4586:	2a00      	cmp	r2, #0
    4588:	4904      	ldr	r1, [pc, #16]	; (459c <z_shell_op_cursor_horiz_move+0x28>)
    458a:	6940      	ldr	r0, [r0, #20]
    458c:	bfb8      	it	lt
    458e:	4252      	neglt	r2, r2
    4590:	f006 bb4b 	b.w	ac2a <z_shell_raw_fprintf>
    4594:	2343      	movs	r3, #67	; 0x43
    4596:	e7f1      	b.n	457c <z_shell_op_cursor_horiz_move+0x8>
    4598:	4770      	bx	lr
    459a:	bf00      	nop
    459c:	0000df1b 	.word	0x0000df1b

000045a0 <z_shell_op_cursor_word_move>:
    45a0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    45a4:	1e0c      	subs	r4, r1, #0
    45a6:	4606      	mov	r6, r0
    45a8:	da31      	bge.n	460e <z_shell_op_cursor_word_move+0x6e>
    45aa:	4264      	negs	r4, r4
    45ac:	b224      	sxth	r4, r4
    45ae:	f04f 35ff 	mov.w	r5, #4294967295	; 0xffffffff
    45b2:	f8df 8060 	ldr.w	r8, [pc, #96]	; 4614 <z_shell_op_cursor_word_move+0x74>
    45b6:	b2a4      	uxth	r4, r4
    45b8:	b2af      	uxth	r7, r5
    45ba:	e012      	b.n	45e2 <z_shell_op_cursor_word_move+0x42>
    45bc:	68b3      	ldr	r3, [r6, #8]
    45be:	8fda      	ldrh	r2, [r3, #62]	; 0x3e
    45c0:	f103 0c42 	add.w	ip, r3, #66	; 0x42
    45c4:	8f9b      	ldrh	r3, [r3, #60]	; 0x3c
    45c6:	4611      	mov	r1, r2
    45c8:	2000      	movs	r0, #0
    45ca:	b971      	cbnz	r1, 45ea <z_shell_op_cursor_word_move+0x4a>
    45cc:	f1b5 3fff 	cmp.w	r5, #4294967295	; 0xffffffff
    45d0:	d000      	beq.n	45d4 <z_shell_op_cursor_word_move+0x34>
    45d2:	b973      	cbnz	r3, 45f2 <z_shell_op_cursor_word_move+0x52>
    45d4:	1a89      	subs	r1, r1, r2
    45d6:	b209      	sxth	r1, r1
    45d8:	4630      	mov	r0, r6
    45da:	f006 fb93 	bl	ad04 <z_shell_op_cursor_move>
    45de:	3c01      	subs	r4, #1
    45e0:	b2a4      	uxth	r4, r4
    45e2:	2c00      	cmp	r4, #0
    45e4:	d1ea      	bne.n	45bc <z_shell_op_cursor_word_move+0x1c>
    45e6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    45ea:	428b      	cmp	r3, r1
    45ec:	d101      	bne.n	45f2 <z_shell_op_cursor_word_move+0x52>
    45ee:	2d01      	cmp	r5, #1
    45f0:	d0f0      	beq.n	45d4 <z_shell_op_cursor_word_move+0x34>
    45f2:	f81c e001 	ldrb.w	lr, [ip, r1]
    45f6:	f818 e00e 	ldrb.w	lr, [r8, lr]
    45fa:	f01e 0f07 	tst.w	lr, #7
    45fe:	d104      	bne.n	460a <z_shell_op_cursor_word_move+0x6a>
    4600:	2800      	cmp	r0, #0
    4602:	d1e7      	bne.n	45d4 <z_shell_op_cursor_word_move+0x34>
    4604:	4439      	add	r1, r7
    4606:	b289      	uxth	r1, r1
    4608:	e7df      	b.n	45ca <z_shell_op_cursor_word_move+0x2a>
    460a:	2001      	movs	r0, #1
    460c:	e7fa      	b.n	4604 <z_shell_op_cursor_word_move+0x64>
    460e:	2501      	movs	r5, #1
    4610:	e7cf      	b.n	45b2 <z_shell_op_cursor_word_move+0x12>
    4612:	bf00      	nop
    4614:	0000e695 	.word	0x0000e695

00004618 <z_shell_print_cmd>:
    4618:	6882      	ldr	r2, [r0, #8]
    461a:	4902      	ldr	r1, [pc, #8]	; (4624 <z_shell_print_cmd+0xc>)
    461c:	6940      	ldr	r0, [r0, #20]
    461e:	3242      	adds	r2, #66	; 0x42
    4620:	f006 bb03 	b.w	ac2a <z_shell_raw_fprintf>
    4624:	0000d8aa 	.word	0x0000d8aa

00004628 <z_shell_vt100_color_set>:
    4628:	2908      	cmp	r1, #8
    462a:	460a      	mov	r2, r1
    462c:	d817      	bhi.n	465e <z_shell_vt100_color_set+0x36>
    462e:	6883      	ldr	r3, [r0, #8]
    4630:	f893 102e 	ldrb.w	r1, [r3, #46]	; 0x2e
    4634:	4291      	cmp	r1, r2
    4636:	d012      	beq.n	465e <z_shell_vt100_color_set+0x36>
    4638:	f883 202e 	strb.w	r2, [r3, #46]	; 0x2e
    463c:	6883      	ldr	r3, [r0, #8]
    463e:	2a08      	cmp	r2, #8
    4640:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4644:	d005      	beq.n	4652 <z_shell_vt100_color_set+0x2a>
    4646:	0699      	lsls	r1, r3, #26
    4648:	d509      	bpl.n	465e <z_shell_vt100_color_set+0x36>
    464a:	4905      	ldr	r1, [pc, #20]	; (4660 <z_shell_vt100_color_set+0x38>)
    464c:	6940      	ldr	r0, [r0, #20]
    464e:	f006 baec 	b.w	ac2a <z_shell_raw_fprintf>
    4652:	069b      	lsls	r3, r3, #26
    4654:	d503      	bpl.n	465e <z_shell_vt100_color_set+0x36>
    4656:	4903      	ldr	r1, [pc, #12]	; (4664 <z_shell_vt100_color_set+0x3c>)
    4658:	6940      	ldr	r0, [r0, #20]
    465a:	f006 bae6 	b.w	ac2a <z_shell_raw_fprintf>
    465e:	4770      	bx	lr
    4660:	0000df22 	.word	0x0000df22
    4664:	0000ce12 	.word	0x0000ce12

00004668 <z_shell_vt100_colors_restore>:
    4668:	b538      	push	{r3, r4, r5, lr}
    466a:	460d      	mov	r5, r1
    466c:	7809      	ldrb	r1, [r1, #0]
    466e:	4604      	mov	r4, r0
    4670:	f7ff ffda 	bl	4628 <z_shell_vt100_color_set>
    4674:	786a      	ldrb	r2, [r5, #1]
    4676:	2a07      	cmp	r2, #7
    4678:	d811      	bhi.n	469e <z_shell_vt100_colors_restore+0x36>
    467a:	68a3      	ldr	r3, [r4, #8]
    467c:	f893 102f 	ldrb.w	r1, [r3, #47]	; 0x2f
    4680:	4291      	cmp	r1, r2
    4682:	d00c      	beq.n	469e <z_shell_vt100_colors_restore+0x36>
    4684:	f883 202f 	strb.w	r2, [r3, #47]	; 0x2f
    4688:	68a3      	ldr	r3, [r4, #8]
    468a:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    468e:	069b      	lsls	r3, r3, #26
    4690:	d505      	bpl.n	469e <z_shell_vt100_colors_restore+0x36>
    4692:	6960      	ldr	r0, [r4, #20]
    4694:	4902      	ldr	r1, [pc, #8]	; (46a0 <z_shell_vt100_colors_restore+0x38>)
    4696:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    469a:	f006 bac6 	b.w	ac2a <z_shell_raw_fprintf>
    469e:	bd38      	pop	{r3, r4, r5, pc}
    46a0:	0000df2b 	.word	0x0000df2b

000046a4 <z_shell_op_word_remove>:
    46a4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    46a6:	6883      	ldr	r3, [r0, #8]
    46a8:	8f9a      	ldrh	r2, [r3, #60]	; 0x3c
    46aa:	8fd9      	ldrh	r1, [r3, #62]	; 0x3e
    46ac:	4604      	mov	r4, r0
    46ae:	2a00      	cmp	r2, #0
    46b0:	d050      	beq.n	4754 <z_shell_op_word_remove+0xb0>
    46b2:	2900      	cmp	r1, #0
    46b4:	d04e      	beq.n	4754 <z_shell_op_word_remove+0xb0>
    46b6:	3141      	adds	r1, #65	; 0x41
    46b8:	f103 0542 	add.w	r5, r3, #66	; 0x42
    46bc:	440b      	add	r3, r1
    46be:	4618      	mov	r0, r3
    46c0:	42a8      	cmp	r0, r5
    46c2:	d306      	bcc.n	46d2 <z_shell_op_word_remove+0x2e>
    46c4:	4601      	mov	r1, r0
    46c6:	f811 6901 	ldrb.w	r6, [r1], #-1
    46ca:	2e20      	cmp	r6, #32
    46cc:	d039      	beq.n	4742 <z_shell_op_word_remove+0x9e>
    46ce:	42a8      	cmp	r0, r5
    46d0:	d239      	bcs.n	4746 <z_shell_op_word_remove+0xa2>
    46d2:	b286      	uxth	r6, r0
    46d4:	b29d      	uxth	r5, r3
    46d6:	1bab      	subs	r3, r5, r6
    46d8:	b29b      	uxth	r3, r3
    46da:	1c59      	adds	r1, r3, #1
    46dc:	1c47      	adds	r7, r0, #1
    46de:	1ad2      	subs	r2, r2, r3
    46e0:	4401      	add	r1, r0
    46e2:	4638      	mov	r0, r7
    46e4:	f007 fd28 	bl	c138 <memmove>
    46e8:	68a2      	ldr	r2, [r4, #8]
    46ea:	8f93      	ldrh	r3, [r2, #60]	; 0x3c
    46ec:	1b71      	subs	r1, r6, r5
    46ee:	fa13 f381 	uxtah	r3, r3, r1
    46f2:	8793      	strh	r3, [r2, #60]	; 0x3c
    46f4:	68a3      	ldr	r3, [r4, #8]
    46f6:	8f9a      	ldrh	r2, [r3, #60]	; 0x3c
    46f8:	4413      	add	r3, r2
    46fa:	2200      	movs	r2, #0
    46fc:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
    4700:	b209      	sxth	r1, r1
    4702:	4620      	mov	r0, r4
    4704:	f006 fafe 	bl	ad04 <z_shell_op_cursor_move>
    4708:	68a3      	ldr	r3, [r4, #8]
    470a:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    470e:	069a      	lsls	r2, r3, #26
    4710:	d503      	bpl.n	471a <z_shell_op_word_remove+0x76>
    4712:	4911      	ldr	r1, [pc, #68]	; (4758 <z_shell_op_word_remove+0xb4>)
    4714:	6960      	ldr	r0, [r4, #20]
    4716:	f006 fa88 	bl	ac2a <z_shell_raw_fprintf>
    471a:	463b      	mov	r3, r7
    471c:	4a0f      	ldr	r2, [pc, #60]	; (475c <z_shell_op_word_remove+0xb8>)
    471e:	2108      	movs	r1, #8
    4720:	4620      	mov	r0, r4
    4722:	f006 fbc1 	bl	aea8 <z_shell_fprintf>
    4726:	4620      	mov	r0, r4
    4728:	f7ff fefc 	bl	4524 <z_clear_eos>
    472c:	68a3      	ldr	r3, [r4, #8]
    472e:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4732:	069b      	lsls	r3, r3, #26
    4734:	d50e      	bpl.n	4754 <z_shell_op_word_remove+0xb0>
    4736:	6960      	ldr	r0, [r4, #20]
    4738:	4909      	ldr	r1, [pc, #36]	; (4760 <z_shell_op_word_remove+0xbc>)
    473a:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    473e:	f006 ba74 	b.w	ac2a <z_shell_raw_fprintf>
    4742:	4608      	mov	r0, r1
    4744:	e7bc      	b.n	46c0 <z_shell_op_word_remove+0x1c>
    4746:	4601      	mov	r1, r0
    4748:	f811 6901 	ldrb.w	r6, [r1], #-1
    474c:	2e20      	cmp	r6, #32
    474e:	d0c0      	beq.n	46d2 <z_shell_op_word_remove+0x2e>
    4750:	4608      	mov	r0, r1
    4752:	e7bc      	b.n	46ce <z_shell_op_word_remove+0x2a>
    4754:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    4756:	bf00      	nop
    4758:	0000ce17 	.word	0x0000ce17
    475c:	0000d8aa 	.word	0x0000d8aa
    4760:	0000ce1b 	.word	0x0000ce1b

00004764 <reprint_from_cursor>:
    4764:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    4768:	4604      	mov	r4, r0
    476a:	460d      	mov	r5, r1
    476c:	4617      	mov	r7, r2
    476e:	b10a      	cbz	r2, 4774 <reprint_from_cursor+0x10>
    4770:	f7ff fed8 	bl	4524 <z_clear_eos>
    4774:	68a3      	ldr	r3, [r4, #8]
    4776:	8fda      	ldrh	r2, [r3, #62]	; 0x3e
    4778:	f8d3 1260 	ldr.w	r1, [r3, #608]	; 0x260
    477c:	3242      	adds	r2, #66	; 0x42
    477e:	4413      	add	r3, r2
    4780:	074a      	lsls	r2, r1, #29
    4782:	d51f      	bpl.n	47c4 <reprint_from_cursor+0x60>
    4784:	4618      	mov	r0, r3
    4786:	f7fd f999 	bl	1abc <strlen>
    478a:	f8df 8044 	ldr.w	r8, [pc, #68]	; 47d0 <reprint_from_cursor+0x6c>
    478e:	4606      	mov	r6, r0
    4790:	b996      	cbnz	r6, 47b8 <reprint_from_cursor+0x54>
    4792:	68a3      	ldr	r3, [r4, #8]
    4794:	8f9a      	ldrh	r2, [r3, #60]	; 0x3c
    4796:	87da      	strh	r2, [r3, #62]	; 0x3e
    4798:	4620      	mov	r0, r4
    479a:	f006 fa53 	bl	ac44 <full_line_cmd>
    479e:	b120      	cbz	r0, 47aa <reprint_from_cursor+0x46>
    47a0:	b107      	cbz	r7, 47a4 <reprint_from_cursor+0x40>
    47a2:	b115      	cbz	r5, 47aa <reprint_from_cursor+0x46>
    47a4:	6960      	ldr	r0, [r4, #20]
    47a6:	f7ff fec9 	bl	453c <z_cursor_next_line_move.isra.0>
    47aa:	4269      	negs	r1, r5
    47ac:	4620      	mov	r0, r4
    47ae:	b209      	sxth	r1, r1
    47b0:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    47b4:	f006 baa6 	b.w	ad04 <z_shell_op_cursor_move>
    47b8:	6960      	ldr	r0, [r4, #20]
    47ba:	4641      	mov	r1, r8
    47bc:	f006 fa35 	bl	ac2a <z_shell_raw_fprintf>
    47c0:	3e01      	subs	r6, #1
    47c2:	e7e5      	b.n	4790 <reprint_from_cursor+0x2c>
    47c4:	4a03      	ldr	r2, [pc, #12]	; (47d4 <reprint_from_cursor+0x70>)
    47c6:	2108      	movs	r1, #8
    47c8:	4620      	mov	r0, r4
    47ca:	f006 fb6d 	bl	aea8 <z_shell_fprintf>
    47ce:	e7e0      	b.n	4792 <reprint_from_cursor+0x2e>
    47d0:	0000d624 	.word	0x0000d624
    47d4:	0000d8aa 	.word	0x0000d8aa

000047d8 <z_shell_op_char_insert>:
    47d8:	b513      	push	{r0, r1, r4, lr}
    47da:	6883      	ldr	r3, [r0, #8]
    47dc:	f88d 1007 	strb.w	r1, [sp, #7]
    47e0:	f8d3 2260 	ldr.w	r2, [r3, #608]	; 0x260
    47e4:	4604      	mov	r4, r0
    47e6:	07d0      	lsls	r0, r2, #31
    47e8:	d522      	bpl.n	4830 <z_shell_op_char_insert+0x58>
    47ea:	8fd9      	ldrh	r1, [r3, #62]	; 0x3e
    47ec:	8f9a      	ldrh	r2, [r3, #60]	; 0x3c
    47ee:	428a      	cmp	r2, r1
    47f0:	d01e      	beq.n	4830 <z_shell_op_char_insert+0x58>
    47f2:	1c48      	adds	r0, r1, #1
    47f4:	87d8      	strh	r0, [r3, #62]	; 0x3e
    47f6:	440b      	add	r3, r1
    47f8:	f89d 2007 	ldrb.w	r2, [sp, #7]
    47fc:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
    4800:	68a3      	ldr	r3, [r4, #8]
    4802:	f8d3 1260 	ldr.w	r1, [r3, #608]	; 0x260
    4806:	0789      	lsls	r1, r1, #30
    4808:	d510      	bpl.n	482c <z_shell_op_char_insert+0x54>
    480a:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    480e:	6960      	ldr	r0, [r4, #20]
    4810:	490b      	ldr	r1, [pc, #44]	; (4840 <z_shell_op_char_insert+0x68>)
    4812:	f013 0f04 	tst.w	r3, #4
    4816:	bf18      	it	ne
    4818:	222a      	movne	r2, #42	; 0x2a
    481a:	f006 fa06 	bl	ac2a <z_shell_raw_fprintf>
    481e:	4620      	mov	r0, r4
    4820:	f006 fa24 	bl	ac6c <z_shell_cursor_in_empty_line>
    4824:	b110      	cbz	r0, 482c <z_shell_op_char_insert+0x54>
    4826:	6960      	ldr	r0, [r4, #20]
    4828:	f7ff fe88 	bl	453c <z_cursor_next_line_move.isra.0>
    482c:	b002      	add	sp, #8
    482e:	bd10      	pop	{r4, pc}
    4830:	2201      	movs	r2, #1
    4832:	f10d 0107 	add.w	r1, sp, #7
    4836:	4620      	mov	r0, r4
    4838:	f006 fb43 	bl	aec2 <data_insert>
    483c:	e7f6      	b.n	482c <z_shell_op_char_insert+0x54>
    483e:	bf00      	nop
    4840:	0000df1f 	.word	0x0000df1f

00004844 <z_shell_print_prompt_and_cmd>:
    4844:	b510      	push	{r4, lr}
    4846:	6883      	ldr	r3, [r0, #8]
    4848:	4a09      	ldr	r2, [pc, #36]	; (4870 <z_shell_print_prompt_and_cmd+0x2c>)
    484a:	681b      	ldr	r3, [r3, #0]
    484c:	4604      	mov	r4, r0
    484e:	2102      	movs	r1, #2
    4850:	f006 fb2a 	bl	aea8 <z_shell_fprintf>
    4854:	68a3      	ldr	r3, [r4, #8]
    4856:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    485a:	079b      	lsls	r3, r3, #30
    485c:	d507      	bpl.n	486e <z_shell_print_prompt_and_cmd+0x2a>
    485e:	4620      	mov	r0, r4
    4860:	f7ff feda 	bl	4618 <z_shell_print_cmd>
    4864:	4620      	mov	r0, r4
    4866:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    486a:	f006 ba28 	b.w	acbe <z_shell_op_cursor_position_synchronize>
    486e:	bd10      	pop	{r4, pc}
    4870:	0000d8aa 	.word	0x0000d8aa

00004874 <z_cursor_next_line_move.isra.0>:
    4874:	4901      	ldr	r1, [pc, #4]	; (487c <z_cursor_next_line_move.isra.0+0x8>)
    4876:	f006 bb85 	b.w	af84 <z_shell_raw_fprintf>
    487a:	bf00      	nop
    487c:	0000d6da 	.word	0x0000d6da

00004880 <formatted_text_print.constprop.0>:
    4880:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    4884:	4605      	mov	r5, r0
    4886:	4690      	mov	r8, r2
    4888:	460e      	mov	r6, r1
    488a:	2900      	cmp	r1, #0
    488c:	d065      	beq.n	495a <formatted_text_print.constprop.0+0xda>
    488e:	f8df 90d0 	ldr.w	r9, [pc, #208]	; 4960 <formatted_text_print.constprop.0+0xe0>
    4892:	2400      	movs	r4, #0
    4894:	5d33      	ldrb	r3, [r6, r4]
    4896:	f819 3003 	ldrb.w	r3, [r9, r3]
    489a:	071a      	lsls	r2, r3, #28
    489c:	d41e      	bmi.n	48dc <formatted_text_print.constprop.0+0x5c>
    489e:	4630      	mov	r0, r6
    48a0:	f7fd f90c 	bl	1abc <strlen>
    48a4:	68ab      	ldr	r3, [r5, #8]
    48a6:	8d5a      	ldrh	r2, [r3, #42]	; 0x2a
    48a8:	b280      	uxth	r0, r0
    48aa:	1b00      	subs	r0, r0, r4
    48ac:	eba2 0308 	sub.w	r3, r2, r8
    48b0:	4298      	cmp	r0, r3
    48b2:	eb06 0a04 	add.w	sl, r6, r4
    48b6:	d913      	bls.n	48e0 <formatted_text_print.constprop.0+0x60>
    48b8:	4651      	mov	r1, sl
    48ba:	2700      	movs	r7, #0
    48bc:	f811 0b01 	ldrb.w	r0, [r1], #1
    48c0:	f819 c000 	ldrb.w	ip, [r9, r0]
    48c4:	f01c 0f08 	tst.w	ip, #8
    48c8:	d002      	beq.n	48d0 <formatted_text_print.constprop.0+0x50>
    48ca:	280a      	cmp	r0, #10
    48cc:	d02d      	beq.n	492a <formatted_text_print.constprop.0+0xaa>
    48ce:	463b      	mov	r3, r7
    48d0:	eb08 0007 	add.w	r0, r8, r7
    48d4:	4282      	cmp	r2, r0
    48d6:	d927      	bls.n	4928 <formatted_text_print.constprop.0+0xa8>
    48d8:	3701      	adds	r7, #1
    48da:	e7ef      	b.n	48bc <formatted_text_print.constprop.0+0x3c>
    48dc:	3401      	adds	r4, #1
    48de:	e7d9      	b.n	4894 <formatted_text_print.constprop.0+0x14>
    48e0:	4653      	mov	r3, sl
    48e2:	2700      	movs	r7, #0
    48e4:	42b8      	cmp	r0, r7
    48e6:	d014      	beq.n	4912 <formatted_text_print.constprop.0+0x92>
    48e8:	f813 2b01 	ldrb.w	r2, [r3], #1
    48ec:	2a0a      	cmp	r2, #10
    48ee:	d119      	bne.n	4924 <formatted_text_print.constprop.0+0xa4>
    48f0:	6968      	ldr	r0, [r5, #20]
    48f2:	f006 f88d 	bl	aa10 <z_shell_fprintf_buffer_flush>
    48f6:	4651      	mov	r1, sl
    48f8:	463a      	mov	r2, r7
    48fa:	4628      	mov	r0, r5
    48fc:	f006 fa69 	bl	add2 <z_shell_write>
    4900:	6968      	ldr	r0, [r5, #20]
    4902:	f7ff ffb7 	bl	4874 <z_cursor_next_line_move.isra.0>
    4906:	3401      	adds	r4, #1
    4908:	4641      	mov	r1, r8
    490a:	4628      	mov	r0, r5
    490c:	443c      	add	r4, r7
    490e:	f7ff fe31 	bl	4574 <z_shell_op_cursor_horiz_move>
    4912:	6968      	ldr	r0, [r5, #20]
    4914:	1931      	adds	r1, r6, r4
    4916:	f006 fb35 	bl	af84 <z_shell_raw_fprintf>
    491a:	6968      	ldr	r0, [r5, #20]
    491c:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    4920:	f7ff bfa8 	b.w	4874 <z_cursor_next_line_move.isra.0>
    4924:	3701      	adds	r7, #1
    4926:	e7dd      	b.n	48e4 <formatted_text_print.constprop.0+0x64>
    4928:	461f      	mov	r7, r3
    492a:	6968      	ldr	r0, [r5, #20]
    492c:	f006 f870 	bl	aa10 <z_shell_fprintf_buffer_flush>
    4930:	463a      	mov	r2, r7
    4932:	4651      	mov	r1, sl
    4934:	4628      	mov	r0, r5
    4936:	f006 fa4c 	bl	add2 <z_shell_write>
    493a:	443c      	add	r4, r7
    493c:	5d33      	ldrb	r3, [r6, r4]
    493e:	f819 3003 	ldrb.w	r3, [r9, r3]
    4942:	071b      	lsls	r3, r3, #28
    4944:	d407      	bmi.n	4956 <formatted_text_print.constprop.0+0xd6>
    4946:	6968      	ldr	r0, [r5, #20]
    4948:	f7ff ff94 	bl	4874 <z_cursor_next_line_move.isra.0>
    494c:	4641      	mov	r1, r8
    494e:	4628      	mov	r0, r5
    4950:	f7ff fe10 	bl	4574 <z_shell_op_cursor_horiz_move>
    4954:	e7a3      	b.n	489e <formatted_text_print.constprop.0+0x1e>
    4956:	3401      	adds	r4, #1
    4958:	e7f0      	b.n	493c <formatted_text_print.constprop.0+0xbc>
    495a:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    495e:	bf00      	nop
    4960:	0000e695 	.word	0x0000e695

00004964 <z_shell_help_subcmd_print>:
    4964:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    4968:	b08b      	sub	sp, #44	; 0x2c
    496a:	4604      	mov	r4, r0
    496c:	9102      	str	r1, [sp, #8]
    496e:	2100      	movs	r1, #0
    4970:	4616      	mov	r6, r2
    4972:	460d      	mov	r5, r1
    4974:	9802      	ldr	r0, [sp, #8]
    4976:	aa05      	add	r2, sp, #20
    4978:	f101 0801 	add.w	r8, r1, #1
    497c:	f7ff fd2a 	bl	43d4 <z_shell_cmd_get>
    4980:	b998      	cbnz	r0, 49aa <z_shell_help_subcmd_print+0x46>
    4982:	b17d      	cbz	r5, 49a4 <z_shell_help_subcmd_print+0x40>
    4984:	b126      	cbz	r6, 4990 <z_shell_help_subcmd_print+0x2c>
    4986:	4632      	mov	r2, r6
    4988:	2108      	movs	r1, #8
    498a:	4620      	mov	r0, r4
    498c:	f006 fa8c 	bl	aea8 <z_shell_fprintf>
    4990:	f8df 80a4 	ldr.w	r8, [pc, #164]	; 4a38 <z_shell_help_subcmd_print+0xd4>
    4994:	2100      	movs	r1, #0
    4996:	9802      	ldr	r0, [sp, #8]
    4998:	aa05      	add	r2, sp, #20
    499a:	f101 0b01 	add.w	fp, r1, #1
    499e:	f7ff fd19 	bl	43d4 <z_shell_cmd_get>
    49a2:	b960      	cbnz	r0, 49be <z_shell_help_subcmd_print+0x5a>
    49a4:	b00b      	add	sp, #44	; 0x2c
    49a6:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    49aa:	6800      	ldr	r0, [r0, #0]
    49ac:	b110      	cbz	r0, 49b4 <z_shell_help_subcmd_print+0x50>
    49ae:	f7fd f885 	bl	1abc <strlen>
    49b2:	b280      	uxth	r0, r0
    49b4:	4285      	cmp	r5, r0
    49b6:	bf38      	it	cc
    49b8:	4605      	movcc	r5, r0
    49ba:	4641      	mov	r1, r8
    49bc:	e7da      	b.n	4974 <z_shell_help_subcmd_print+0x10>
    49be:	e9d0 7a00 	ldrd	r7, sl, [r0]
    49c2:	4640      	mov	r0, r8
    49c4:	f7fd f87a 	bl	1abc <strlen>
    49c8:	4681      	mov	r9, r0
    49ca:	b1b7      	cbz	r7, 49fa <z_shell_help_subcmd_print+0x96>
    49cc:	783a      	ldrb	r2, [r7, #0]
    49ce:	b1a2      	cbz	r2, 49fa <z_shell_help_subcmd_print+0x96>
    49d0:	4638      	mov	r0, r7
    49d2:	f7fd f873 	bl	1abc <strlen>
    49d6:	2220      	movs	r2, #32
    49d8:	1a2e      	subs	r6, r5, r0
    49da:	f88d 2013 	strb.w	r2, [sp, #19]
    49de:	9700      	str	r7, [sp, #0]
    49e0:	4a16      	ldr	r2, [pc, #88]	; (4a3c <z_shell_help_subcmd_print+0xd8>)
    49e2:	4643      	mov	r3, r8
    49e4:	2108      	movs	r1, #8
    49e6:	4620      	mov	r0, r4
    49e8:	b2b6      	uxth	r6, r6
    49ea:	f006 fa5d 	bl	aea8 <z_shell_fprintf>
    49ee:	f1ba 0f00 	cmp.w	sl, #0
    49f2:	d11f      	bne.n	4a34 <z_shell_help_subcmd_print+0xd0>
    49f4:	6960      	ldr	r0, [r4, #20]
    49f6:	f7ff ff3d 	bl	4874 <z_cursor_next_line_move.isra.0>
    49fa:	4659      	mov	r1, fp
    49fc:	e7cb      	b.n	4996 <z_shell_help_subcmd_print+0x32>
    49fe:	2201      	movs	r2, #1
    4a00:	f10d 0113 	add.w	r1, sp, #19
    4a04:	4620      	mov	r0, r4
    4a06:	9303      	str	r3, [sp, #12]
    4a08:	f006 f9e3 	bl	add2 <z_shell_write>
    4a0c:	9b03      	ldr	r3, [sp, #12]
    4a0e:	3301      	adds	r3, #1
    4a10:	b29a      	uxth	r2, r3
    4a12:	4296      	cmp	r6, r2
    4a14:	d8f3      	bhi.n	49fe <z_shell_help_subcmd_print+0x9a>
    4a16:	4620      	mov	r0, r4
    4a18:	4a09      	ldr	r2, [pc, #36]	; (4a40 <z_shell_help_subcmd_print+0xdc>)
    4a1a:	4643      	mov	r3, r8
    4a1c:	2108      	movs	r1, #8
    4a1e:	f006 fa43 	bl	aea8 <z_shell_fprintf>
    4a22:	1c6a      	adds	r2, r5, #1
    4a24:	eb02 0249 	add.w	r2, r2, r9, lsl #1
    4a28:	b292      	uxth	r2, r2
    4a2a:	4651      	mov	r1, sl
    4a2c:	4620      	mov	r0, r4
    4a2e:	f7ff ff27 	bl	4880 <formatted_text_print.constprop.0>
    4a32:	e7e2      	b.n	49fa <z_shell_help_subcmd_print+0x96>
    4a34:	2300      	movs	r3, #0
    4a36:	e7eb      	b.n	4a10 <z_shell_help_subcmd_print+0xac>
    4a38:	0000df46 	.word	0x0000df46
    4a3c:	0000dd2f 	.word	0x0000dd2f
    4a40:	0000df34 	.word	0x0000df34

00004a44 <z_shell_help_cmd_print>:
    4a44:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    4a46:	4606      	mov	r6, r0
    4a48:	6808      	ldr	r0, [r1, #0]
    4a4a:	460d      	mov	r5, r1
    4a4c:	b1b8      	cbz	r0, 4a7e <z_shell_help_cmd_print+0x3a>
    4a4e:	f7fd f835 	bl	1abc <strlen>
    4a52:	b284      	uxth	r4, r0
    4a54:	4f0b      	ldr	r7, [pc, #44]	; (4a84 <z_shell_help_cmd_print+0x40>)
    4a56:	4638      	mov	r0, r7
    4a58:	f7fd f830 	bl	1abc <strlen>
    4a5c:	9700      	str	r7, [sp, #0]
    4a5e:	682b      	ldr	r3, [r5, #0]
    4a60:	4a09      	ldr	r2, [pc, #36]	; (4a88 <z_shell_help_cmd_print+0x44>)
    4a62:	4404      	add	r4, r0
    4a64:	2108      	movs	r1, #8
    4a66:	4630      	mov	r0, r6
    4a68:	f006 fa1e 	bl	aea8 <z_shell_fprintf>
    4a6c:	b2a4      	uxth	r4, r4
    4a6e:	6869      	ldr	r1, [r5, #4]
    4a70:	4622      	mov	r2, r4
    4a72:	4630      	mov	r0, r6
    4a74:	b003      	add	sp, #12
    4a76:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
    4a7a:	f7ff bf01 	b.w	4880 <formatted_text_print.constprop.0>
    4a7e:	4604      	mov	r4, r0
    4a80:	e7e8      	b.n	4a54 <z_shell_help_cmd_print+0x10>
    4a82:	bf00      	nop
    4a84:	0000df42 	.word	0x0000df42
    4a88:	0000dd2f 	.word	0x0000dd2f

00004a8c <z_shell_help_request>:
    4a8c:	b510      	push	{r4, lr}
    4a8e:	4907      	ldr	r1, [pc, #28]	; (4aac <z_shell_help_request+0x20>)
    4a90:	4604      	mov	r4, r0
    4a92:	f7fd f809 	bl	1aa8 <strcmp>
    4a96:	b138      	cbz	r0, 4aa8 <z_shell_help_request+0x1c>
    4a98:	4905      	ldr	r1, [pc, #20]	; (4ab0 <z_shell_help_request+0x24>)
    4a9a:	4620      	mov	r0, r4
    4a9c:	f7fd f804 	bl	1aa8 <strcmp>
    4aa0:	fab0 f080 	clz	r0, r0
    4aa4:	0940      	lsrs	r0, r0, #5
    4aa6:	bd10      	pop	{r4, pc}
    4aa8:	2001      	movs	r0, #1
    4aaa:	e7fc      	b.n	4aa6 <z_shell_help_request+0x1a>
    4aac:	0000df38 	.word	0x0000df38
    4ab0:	0000df3b 	.word	0x0000df3b

00004ab4 <cmd_resize_default>:
    4ab4:	b510      	push	{r4, lr}
    4ab6:	6883      	ldr	r3, [r0, #8]
    4ab8:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4abc:	069b      	lsls	r3, r3, #26
    4abe:	4604      	mov	r4, r0
    4ac0:	d503      	bpl.n	4aca <cmd_resize_default+0x16>
    4ac2:	4906      	ldr	r1, [pc, #24]	; (4adc <cmd_resize_default+0x28>)
    4ac4:	6940      	ldr	r0, [r0, #20]
    4ac6:	f006 fa6e 	bl	afa6 <z_shell_raw_fprintf>
    4aca:	68a3      	ldr	r3, [r4, #8]
    4acc:	2250      	movs	r2, #80	; 0x50
    4ace:	855a      	strh	r2, [r3, #42]	; 0x2a
    4ad0:	68a3      	ldr	r3, [r4, #8]
    4ad2:	2218      	movs	r2, #24
    4ad4:	851a      	strh	r2, [r3, #40]	; 0x28
    4ad6:	2000      	movs	r0, #0
    4ad8:	bd10      	pop	{r4, pc}
    4ada:	bf00      	nop
    4adc:	0000ce1f 	.word	0x0000ce1f

00004ae0 <cmd_shell_stats_show>:
    4ae0:	b508      	push	{r3, lr}
    4ae2:	6983      	ldr	r3, [r0, #24]
    4ae4:	4a03      	ldr	r2, [pc, #12]	; (4af4 <cmd_shell_stats_show+0x14>)
    4ae6:	681b      	ldr	r3, [r3, #0]
    4ae8:	2108      	movs	r1, #8
    4aea:	f005 ff81 	bl	a9f0 <shell_fprintf>
    4aee:	2000      	movs	r0, #0
    4af0:	bd08      	pop	{r3, pc}
    4af2:	bf00      	nop
    4af4:	0000df49 	.word	0x0000df49

00004af8 <cmd_backends>:
    4af8:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
    4afc:	4a0e      	ldr	r2, [pc, #56]	; (4b38 <cmd_backends+0x40>)
    4afe:	4c0f      	ldr	r4, [pc, #60]	; (4b3c <cmd_backends+0x44>)
    4b00:	4e0f      	ldr	r6, [pc, #60]	; (4b40 <cmd_backends+0x48>)
    4b02:	f8df 8040 	ldr.w	r8, [pc, #64]	; 4b44 <cmd_backends+0x4c>
    4b06:	2108      	movs	r1, #8
    4b08:	4605      	mov	r5, r0
    4b0a:	f005 ff71 	bl	a9f0 <shell_fprintf>
    4b0e:	2300      	movs	r3, #0
    4b10:	42b4      	cmp	r4, r6
    4b12:	f103 0701 	add.w	r7, r3, #1
    4b16:	d303      	bcc.n	4b20 <cmd_backends+0x28>
    4b18:	2000      	movs	r0, #0
    4b1a:	b002      	add	sp, #8
    4b1c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    4b20:	68a2      	ldr	r2, [r4, #8]
    4b22:	6812      	ldr	r2, [r2, #0]
    4b24:	9200      	str	r2, [sp, #0]
    4b26:	b29b      	uxth	r3, r3
    4b28:	4642      	mov	r2, r8
    4b2a:	2108      	movs	r1, #8
    4b2c:	4628      	mov	r0, r5
    4b2e:	f005 ff5f 	bl	a9f0 <shell_fprintf>
    4b32:	342c      	adds	r4, #44	; 0x2c
    4b34:	463b      	mov	r3, r7
    4b36:	e7eb      	b.n	4b10 <cmd_backends+0x18>
    4b38:	0000df59 	.word	0x0000df59
    4b3c:	0000cad8 	.word	0x0000cad8
    4b40:	0000cb30 	.word	0x0000cb30
    4b44:	0000df71 	.word	0x0000df71

00004b48 <cmd_history>:
    4b48:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
    4b4a:	4e0f      	ldr	r6, [pc, #60]	; (4b88 <cmd_history+0x40>)
    4b4c:	4604      	mov	r4, r0
    4b4e:	2500      	movs	r5, #0
    4b50:	68a2      	ldr	r2, [r4, #8]
    4b52:	68e0      	ldr	r0, [r4, #12]
    4b54:	f10d 030e 	add.w	r3, sp, #14
    4b58:	f502 72a1 	add.w	r2, r2, #322	; 0x142
    4b5c:	2101      	movs	r1, #1
    4b5e:	f006 faaa 	bl	b0b6 <z_shell_history_get>
    4b62:	f8bd 000e 	ldrh.w	r0, [sp, #14]
    4b66:	68a3      	ldr	r3, [r4, #8]
    4b68:	b150      	cbz	r0, 4b80 <cmd_history+0x38>
    4b6a:	f503 73a1 	add.w	r3, r3, #322	; 0x142
    4b6e:	9300      	str	r3, [sp, #0]
    4b70:	4632      	mov	r2, r6
    4b72:	462b      	mov	r3, r5
    4b74:	2108      	movs	r1, #8
    4b76:	4620      	mov	r0, r4
    4b78:	f005 ff3a 	bl	a9f0 <shell_fprintf>
    4b7c:	3501      	adds	r5, #1
    4b7e:	e7e7      	b.n	4b50 <cmd_history+0x8>
    4b80:	f883 0142 	strb.w	r0, [r3, #322]	; 0x142
    4b84:	b004      	add	sp, #16
    4b86:	bd70      	pop	{r4, r5, r6, pc}
    4b88:	0000df7d 	.word	0x0000df7d

00004b8c <cmd_echo>:
    4b8c:	2902      	cmp	r1, #2
    4b8e:	b507      	push	{r0, r1, r2, lr}
    4b90:	d10d      	bne.n	4bae <cmd_echo+0x22>
    4b92:	6853      	ldr	r3, [r2, #4]
    4b94:	9301      	str	r3, [sp, #4]
    4b96:	4b0e      	ldr	r3, [pc, #56]	; (4bd0 <cmd_echo+0x44>)
    4b98:	9300      	str	r3, [sp, #0]
    4b9a:	6813      	ldr	r3, [r2, #0]
    4b9c:	4a0d      	ldr	r2, [pc, #52]	; (4bd4 <cmd_echo+0x48>)
    4b9e:	2101      	movs	r1, #1
    4ba0:	f005 ff26 	bl	a9f0 <shell_fprintf>
    4ba4:	f06f 0015 	mvn.w	r0, #21
    4ba8:	b003      	add	sp, #12
    4baa:	f85d fb04 	ldr.w	pc, [sp], #4
    4bae:	6883      	ldr	r3, [r0, #8]
    4bb0:	4a09      	ldr	r2, [pc, #36]	; (4bd8 <cmd_echo+0x4c>)
    4bb2:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4bb6:	f013 0f02 	tst.w	r3, #2
    4bba:	f04f 0108 	mov.w	r1, #8
    4bbe:	4b07      	ldr	r3, [pc, #28]	; (4bdc <cmd_echo+0x50>)
    4bc0:	bf08      	it	eq
    4bc2:	4613      	moveq	r3, r2
    4bc4:	4a06      	ldr	r2, [pc, #24]	; (4be0 <cmd_echo+0x54>)
    4bc6:	f005 ff13 	bl	a9f0 <shell_fprintf>
    4bca:	2000      	movs	r0, #0
    4bcc:	e7ec      	b.n	4ba8 <cmd_echo+0x1c>
    4bce:	bf00      	nop
    4bd0:	0000df94 	.word	0x0000df94
    4bd4:	0000df8b 	.word	0x0000df8b
    4bd8:	0000df87 	.word	0x0000df87
    4bdc:	0000d83a 	.word	0x0000d83a
    4be0:	0000dfa9 	.word	0x0000dfa9

00004be4 <cmd_clear>:
    4be4:	b510      	push	{r4, lr}
    4be6:	6883      	ldr	r3, [r0, #8]
    4be8:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4bec:	069a      	lsls	r2, r3, #26
    4bee:	4604      	mov	r4, r0
    4bf0:	d503      	bpl.n	4bfa <cmd_clear+0x16>
    4bf2:	4907      	ldr	r1, [pc, #28]	; (4c10 <cmd_clear+0x2c>)
    4bf4:	6940      	ldr	r0, [r0, #20]
    4bf6:	f006 f9d6 	bl	afa6 <z_shell_raw_fprintf>
    4bfa:	68a3      	ldr	r3, [r4, #8]
    4bfc:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4c00:	069b      	lsls	r3, r3, #26
    4c02:	d503      	bpl.n	4c0c <cmd_clear+0x28>
    4c04:	4903      	ldr	r1, [pc, #12]	; (4c14 <cmd_clear+0x30>)
    4c06:	6960      	ldr	r0, [r4, #20]
    4c08:	f006 f9cd 	bl	afa6 <z_shell_raw_fprintf>
    4c0c:	2000      	movs	r0, #0
    4c0e:	bd10      	pop	{r4, pc}
    4c10:	0000ce26 	.word	0x0000ce26
    4c14:	0000ce2b 	.word	0x0000ce2b

00004c18 <cmd_resize>:
    4c18:	b5f0      	push	{r4, r5, r6, r7, lr}
    4c1a:	2901      	cmp	r1, #1
    4c1c:	b085      	sub	sp, #20
    4c1e:	4604      	mov	r4, r0
    4c20:	d00c      	beq.n	4c3c <cmd_resize+0x24>
    4c22:	6853      	ldr	r3, [r2, #4]
    4c24:	9301      	str	r3, [sp, #4]
    4c26:	4b60      	ldr	r3, [pc, #384]	; (4da8 <cmd_resize+0x190>)
    4c28:	9300      	str	r3, [sp, #0]
    4c2a:	6813      	ldr	r3, [r2, #0]
    4c2c:	4a5f      	ldr	r2, [pc, #380]	; (4dac <cmd_resize+0x194>)
    4c2e:	2101      	movs	r1, #1
    4c30:	f005 fede 	bl	a9f0 <shell_fprintf>
    4c34:	f06f 0015 	mvn.w	r0, #21
    4c38:	b005      	add	sp, #20
    4c3a:	bdf0      	pop	{r4, r5, r6, r7, pc}
    4c3c:	6883      	ldr	r3, [r0, #8]
    4c3e:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4c42:	0699      	lsls	r1, r3, #26
    4c44:	d503      	bpl.n	4c4e <cmd_resize+0x36>
    4c46:	495a      	ldr	r1, [pc, #360]	; (4db0 <cmd_resize+0x198>)
    4c48:	6940      	ldr	r0, [r0, #20]
    4c4a:	f006 f9ac 	bl	afa6 <z_shell_raw_fprintf>
    4c4e:	f06f 01f9 	mvn.w	r1, #249	; 0xf9
    4c52:	4620      	mov	r0, r4
    4c54:	f7ff fc78 	bl	4548 <z_shell_op_cursor_vert_move>
    4c58:	21fa      	movs	r1, #250	; 0xfa
    4c5a:	4620      	mov	r0, r4
    4c5c:	f7ff fc8a 	bl	4574 <z_shell_op_cursor_horiz_move>
    4c60:	68a0      	ldr	r0, [r4, #8]
    4c62:	2500      	movs	r5, #0
    4c64:	f44f 7280 	mov.w	r2, #256	; 0x100
    4c68:	4629      	mov	r1, r5
    4c6a:	f500 70a1 	add.w	r0, r0, #322	; 0x142
    4c6e:	f88d 500b 	strb.w	r5, [sp, #11]
    4c72:	f007 fa7b 	bl	c16c <memset>
    4c76:	494f      	ldr	r1, [pc, #316]	; (4db4 <cmd_resize+0x19c>)
    4c78:	6960      	ldr	r0, [r4, #20]
    4c7a:	f006 f994 	bl	afa6 <z_shell_raw_fprintf>
    4c7e:	6960      	ldr	r0, [r4, #20]
    4c80:	f005 fec6 	bl	aa10 <z_shell_fprintf_buffer_flush>
    4c84:	f44f 767a 	mov.w	r6, #1000	; 0x3e8
    4c88:	6860      	ldr	r0, [r4, #4]
    4c8a:	6803      	ldr	r3, [r0, #0]
    4c8c:	2201      	movs	r2, #1
    4c8e:	691f      	ldr	r7, [r3, #16]
    4c90:	f10d 010b 	add.w	r1, sp, #11
    4c94:	ab03      	add	r3, sp, #12
    4c96:	47b8      	blx	r7
    4c98:	9b03      	ldr	r3, [sp, #12]
    4c9a:	b9f3      	cbnz	r3, 4cda <cmd_resize+0xc2>
    4c9c:	3e01      	subs	r6, #1
    4c9e:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
    4ca2:	b2b6      	uxth	r6, r6
    4ca4:	f007 f895 	bl	bdd2 <z_impl_k_busy_wait>
    4ca8:	2e00      	cmp	r6, #0
    4caa:	d1ed      	bne.n	4c88 <cmd_resize+0x70>
    4cac:	68a3      	ldr	r3, [r4, #8]
    4cae:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4cb2:	069b      	lsls	r3, r3, #26
    4cb4:	d503      	bpl.n	4cbe <cmd_resize+0xa6>
    4cb6:	4940      	ldr	r1, [pc, #256]	; (4db8 <cmd_resize+0x1a0>)
    4cb8:	6960      	ldr	r0, [r4, #20]
    4cba:	f006 f974 	bl	afa6 <z_shell_raw_fprintf>
    4cbe:	68a3      	ldr	r3, [r4, #8]
    4cc0:	2250      	movs	r2, #80	; 0x50
    4cc2:	855a      	strh	r2, [r3, #42]	; 0x2a
    4cc4:	68a3      	ldr	r3, [r4, #8]
    4cc6:	2218      	movs	r2, #24
    4cc8:	851a      	strh	r2, [r3, #40]	; 0x28
    4cca:	4620      	mov	r0, r4
    4ccc:	4a3b      	ldr	r2, [pc, #236]	; (4dbc <cmd_resize+0x1a4>)
    4cce:	2103      	movs	r1, #3
    4cd0:	f005 fe8e 	bl	a9f0 <shell_fprintf>
    4cd4:	f06f 0007 	mvn.w	r0, #7
    4cd8:	e7ae      	b.n	4c38 <cmd_resize+0x20>
    4cda:	f89d 200b 	ldrb.w	r2, [sp, #11]
    4cde:	68a3      	ldr	r3, [r4, #8]
    4ce0:	2a1b      	cmp	r2, #27
    4ce2:	d053      	beq.n	4d8c <cmd_resize+0x174>
    4ce4:	f893 1142 	ldrb.w	r1, [r3, #322]	; 0x142
    4ce8:	291b      	cmp	r1, #27
    4cea:	d1cd      	bne.n	4c88 <cmd_resize+0x70>
    4cec:	2a52      	cmp	r2, #82	; 0x52
    4cee:	d14d      	bne.n	4d8c <cmd_resize+0x174>
    4cf0:	195a      	adds	r2, r3, r5
    4cf2:	2300      	movs	r3, #0
    4cf4:	f882 3142 	strb.w	r3, [r2, #322]	; 0x142
    4cf8:	68a6      	ldr	r6, [r4, #8]
    4cfa:	f896 2143 	ldrb.w	r2, [r6, #323]	; 0x143
    4cfe:	2a5b      	cmp	r2, #91	; 0x5b
    4d00:	d12b      	bne.n	4d5a <cmd_resize+0x142>
    4d02:	f206 1043 	addw	r0, r6, #323	; 0x143
    4d06:	2502      	movs	r5, #2
    4d08:	f810 1f01 	ldrb.w	r1, [r0, #1]!
    4d0c:	462a      	mov	r2, r5
    4d0e:	293b      	cmp	r1, #59	; 0x3b
    4d10:	f105 0501 	add.w	r5, r5, #1
    4d14:	b2ad      	uxth	r5, r5
    4d16:	d123      	bne.n	4d60 <cmd_resize+0x148>
    4d18:	2aff      	cmp	r2, #255	; 0xff
    4d1a:	d0c7      	beq.n	4cac <cmd_resize+0x94>
    4d1c:	f502 72a1 	add.w	r2, r2, #322	; 0x142
    4d20:	fa16 f182 	uxtah	r1, r6, r2
    4d24:	2200      	movs	r2, #0
    4d26:	f811 0f01 	ldrb.w	r0, [r1, #1]!
    4d2a:	bb18      	cbnz	r0, 4d74 <cmd_resize+0x15c>
    4d2c:	f886 0142 	strb.w	r0, [r6, #322]	; 0x142
    4d30:	2afa      	cmp	r2, #250	; 0xfa
    4d32:	68a1      	ldr	r1, [r4, #8]
    4d34:	bf28      	it	cs
    4d36:	22fa      	movcs	r2, #250	; 0xfa
    4d38:	854a      	strh	r2, [r1, #42]	; 0x2a
    4d3a:	2bfa      	cmp	r3, #250	; 0xfa
    4d3c:	68a2      	ldr	r2, [r4, #8]
    4d3e:	bf28      	it	cs
    4d40:	23fa      	movcs	r3, #250	; 0xfa
    4d42:	8513      	strh	r3, [r2, #40]	; 0x28
    4d44:	68a3      	ldr	r3, [r4, #8]
    4d46:	f8d3 3260 	ldr.w	r3, [r3, #608]	; 0x260
    4d4a:	069a      	lsls	r2, r3, #26
    4d4c:	d503      	bpl.n	4d56 <cmd_resize+0x13e>
    4d4e:	491a      	ldr	r1, [pc, #104]	; (4db8 <cmd_resize+0x1a0>)
    4d50:	6960      	ldr	r0, [r4, #20]
    4d52:	f006 f928 	bl	afa6 <z_shell_raw_fprintf>
    4d56:	2000      	movs	r0, #0
    4d58:	e76e      	b.n	4c38 <cmd_resize+0x20>
    4d5a:	f886 3142 	strb.w	r3, [r6, #322]	; 0x142
    4d5e:	e7a5      	b.n	4cac <cmd_resize+0x94>
    4d60:	eb03 0383 	add.w	r3, r3, r3, lsl #2
    4d64:	3930      	subs	r1, #48	; 0x30
    4d66:	eb01 0143 	add.w	r1, r1, r3, lsl #1
    4d6a:	f5b5 7f80 	cmp.w	r5, #256	; 0x100
    4d6e:	b28b      	uxth	r3, r1
    4d70:	d1ca      	bne.n	4d08 <cmd_resize+0xf0>
    4d72:	e79b      	b.n	4cac <cmd_resize+0x94>
    4d74:	3501      	adds	r5, #1
    4d76:	eb02 0282 	add.w	r2, r2, r2, lsl #2
    4d7a:	b2ad      	uxth	r5, r5
    4d7c:	3830      	subs	r0, #48	; 0x30
    4d7e:	eb00 0042 	add.w	r0, r0, r2, lsl #1
    4d82:	f5b5 7f80 	cmp.w	r5, #256	; 0x100
    4d86:	b282      	uxth	r2, r0
    4d88:	d1cd      	bne.n	4d26 <cmd_resize+0x10e>
    4d8a:	e78f      	b.n	4cac <cmd_resize+0x94>
    4d8c:	442b      	add	r3, r5
    4d8e:	3501      	adds	r5, #1
    4d90:	b2ad      	uxth	r5, r5
    4d92:	2d09      	cmp	r5, #9
    4d94:	f883 2142 	strb.w	r2, [r3, #322]	; 0x142
    4d98:	f67f af76 	bls.w	4c88 <cmd_resize+0x70>
    4d9c:	68a3      	ldr	r3, [r4, #8]
    4d9e:	2200      	movs	r2, #0
    4da0:	f883 2142 	strb.w	r2, [r3, #322]	; 0x142
    4da4:	e782      	b.n	4cac <cmd_resize+0x94>
    4da6:	bf00      	nop
    4da8:	0000df94 	.word	0x0000df94
    4dac:	0000df8b 	.word	0x0000df8b
    4db0:	0000ce31 	.word	0x0000ce31
    4db4:	0000dff4 	.word	0x0000dff4
    4db8:	0000ce35 	.word	0x0000ce35
    4dbc:	0000dfba 	.word	0x0000dfba

00004dc0 <z_shell_wildcard_process>:
    4dc0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    4dc4:	4607      	mov	r7, r0
    4dc6:	b089      	sub	sp, #36	; 0x24
    4dc8:	4615      	mov	r5, r2
    4dca:	4689      	mov	r9, r1
    4dcc:	b921      	cbnz	r1, 4dd8 <z_shell_wildcard_process+0x18>
    4dce:	2403      	movs	r4, #3
    4dd0:	4620      	mov	r0, r4
    4dd2:	b009      	add	sp, #36	; 0x24
    4dd4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    4dd8:	4610      	mov	r0, r2
    4dda:	f006 fa11 	bl	b200 <z_shell_has_wildcard>
    4dde:	2800      	cmp	r0, #0
    4de0:	d0f5      	beq.n	4dce <z_shell_wildcard_process+0xe>
    4de2:	f04f 0800 	mov.w	r8, #0
    4de6:	4641      	mov	r1, r8
    4de8:	2402      	movs	r4, #2
    4dea:	e024      	b.n	4e36 <z_shell_wildcard_process+0x76>
    4dec:	465c      	mov	r4, fp
    4dee:	e03c      	b.n	4e6a <z_shell_wildcard_process+0xaa>
    4df0:	4629      	mov	r1, r5
    4df2:	f50a 70a1 	add.w	r0, sl, #322	; 0x142
    4df6:	f007 fa3a 	bl	c26e <strstr>
    4dfa:	4606      	mov	r6, r0
    4dfc:	2800      	cmp	r0, #0
    4dfe:	d04c      	beq.n	4e9a <z_shell_wildcard_process+0xda>
    4e00:	f7fc fe5c 	bl	1abc <strlen>
    4e04:	b282      	uxth	r2, r0
    4e06:	1c60      	adds	r0, r4, #1
    4e08:	3201      	adds	r2, #1
    4e0a:	4631      	mov	r1, r6
    4e0c:	4430      	add	r0, r6
    4e0e:	f007 f993 	bl	c138 <memmove>
    4e12:	4622      	mov	r2, r4
    4e14:	4659      	mov	r1, fp
    4e16:	4630      	mov	r0, r6
    4e18:	f007 f980 	bl	c11c <memcpy>
    4e1c:	f04f 0320 	mov.w	r3, #32
    4e20:	5533      	strb	r3, [r6, r4]
    4e22:	f8ba 3040 	ldrh.w	r3, [sl, #64]	; 0x40
    4e26:	3301      	adds	r3, #1
    4e28:	441c      	add	r4, r3
    4e2a:	f8aa 4040 	strh.w	r4, [sl, #64]	; 0x40
    4e2e:	f108 0801 	add.w	r8, r8, #1
    4e32:	2400      	movs	r4, #0
    4e34:	9901      	ldr	r1, [sp, #4]
    4e36:	1c4b      	adds	r3, r1, #1
    4e38:	aa03      	add	r2, sp, #12
    4e3a:	4648      	mov	r0, r9
    4e3c:	9301      	str	r3, [sp, #4]
    4e3e:	f7ff fac9 	bl	43d4 <z_shell_cmd_get>
    4e42:	4606      	mov	r6, r0
    4e44:	b1e8      	cbz	r0, 4e82 <z_shell_wildcard_process+0xc2>
    4e46:	6831      	ldr	r1, [r6, #0]
    4e48:	2200      	movs	r2, #0
    4e4a:	4628      	mov	r0, r5
    4e4c:	f005 fbe5 	bl	a61a <fnmatch>
    4e50:	2800      	cmp	r0, #0
    4e52:	d1ef      	bne.n	4e34 <z_shell_wildcard_process+0x74>
    4e54:	f8d6 b000 	ldr.w	fp, [r6]
    4e58:	f8d7 a008 	ldr.w	sl, [r7, #8]
    4e5c:	f1bb 0f00 	cmp.w	fp, #0
    4e60:	d0c4      	beq.n	4dec <z_shell_wildcard_process+0x2c>
    4e62:	4658      	mov	r0, fp
    4e64:	f7fc fe2a 	bl	1abc <strlen>
    4e68:	b284      	uxth	r4, r0
    4e6a:	f8ba 3040 	ldrh.w	r3, [sl, #64]	; 0x40
    4e6e:	4423      	add	r3, r4
    4e70:	2bff      	cmp	r3, #255	; 0xff
    4e72:	ddbd      	ble.n	4df0 <z_shell_wildcard_process+0x30>
    4e74:	4a0a      	ldr	r2, [pc, #40]	; (4ea0 <z_shell_wildcard_process+0xe0>)
    4e76:	462b      	mov	r3, r5
    4e78:	2103      	movs	r1, #3
    4e7a:	4638      	mov	r0, r7
    4e7c:	f006 f814 	bl	aea8 <z_shell_fprintf>
    4e80:	2401      	movs	r4, #1
    4e82:	f1b8 0f00 	cmp.w	r8, #0
    4e86:	d0a3      	beq.n	4dd0 <z_shell_wildcard_process+0x10>
    4e88:	68b8      	ldr	r0, [r7, #8]
    4e8a:	462a      	mov	r2, r5
    4e8c:	f100 0140 	add.w	r1, r0, #64	; 0x40
    4e90:	f500 70a1 	add.w	r0, r0, #322	; 0x142
    4e94:	f005 fe1c 	bl	aad0 <z_shell_pattern_remove>
    4e98:	e79a      	b.n	4dd0 <z_shell_wildcard_process+0x10>
    4e9a:	2402      	movs	r4, #2
    4e9c:	e7f1      	b.n	4e82 <z_shell_wildcard_process+0xc2>
    4e9e:	bf00      	nop
    4ea0:	0000e3e3 	.word	0x0000e3e3

00004ea4 <pm_state_notify>:
    4ea4:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    4ea8:	4605      	mov	r5, r0
    4eaa:	f04f 0320 	mov.w	r3, #32
    4eae:	f3ef 8611 	mrs	r6, BASEPRI
    4eb2:	f383 8812 	msr	BASEPRI_MAX, r3
    4eb6:	f3bf 8f6f 	isb	sy
    4eba:	4b0e      	ldr	r3, [pc, #56]	; (4ef4 <pm_state_notify+0x50>)
    4ebc:	4f0e      	ldr	r7, [pc, #56]	; (4ef8 <pm_state_notify+0x54>)
    4ebe:	681c      	ldr	r4, [r3, #0]
    4ec0:	f8df 8038 	ldr.w	r8, [pc, #56]	; 4efc <pm_state_notify+0x58>
    4ec4:	f04f 090c 	mov.w	r9, #12
    4ec8:	b92c      	cbnz	r4, 4ed6 <pm_state_notify+0x32>
    4eca:	f386 8811 	msr	BASEPRI, r6
    4ece:	f3bf 8f6f 	isb	sy
    4ed2:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    4ed6:	e9d4 2301 	ldrd	r2, r3, [r4, #4]
    4eda:	2d00      	cmp	r5, #0
    4edc:	bf18      	it	ne
    4ede:	4613      	movne	r3, r2
    4ee0:	b12b      	cbz	r3, 4eee <pm_state_notify+0x4a>
    4ee2:	f898 2014 	ldrb.w	r2, [r8, #20]
    4ee6:	fb09 f202 	mul.w	r2, r9, r2
    4eea:	5cb8      	ldrb	r0, [r7, r2]
    4eec:	4798      	blx	r3
    4eee:	6824      	ldr	r4, [r4, #0]
    4ef0:	e7ea      	b.n	4ec8 <pm_state_notify+0x24>
    4ef2:	bf00      	nop
    4ef4:	20000fd4 	.word	0x20000fd4
    4ef8:	20000fc8 	.word	0x20000fc8
    4efc:	20001648 	.word	0x20001648

00004f00 <pm_system_resume>:
    4f00:	b570      	push	{r4, r5, r6, lr}
    4f02:	4b19      	ldr	r3, [pc, #100]	; (4f68 <pm_system_resume+0x68>)
    4f04:	7d1c      	ldrb	r4, [r3, #20]
    4f06:	f3bf 8f5b 	dmb	ish
    4f0a:	f004 031f 	and.w	r3, r4, #31
    4f0e:	2201      	movs	r2, #1
    4f10:	409a      	lsls	r2, r3
    4f12:	4b16      	ldr	r3, [pc, #88]	; (4f6c <pm_system_resume+0x6c>)
    4f14:	0961      	lsrs	r1, r4, #5
    4f16:	eb03 0381 	add.w	r3, r3, r1, lsl #2
    4f1a:	43d0      	mvns	r0, r2
    4f1c:	e853 1f00 	ldrex	r1, [r3]
    4f20:	ea01 0500 	and.w	r5, r1, r0
    4f24:	e843 5600 	strex	r6, r5, [r3]
    4f28:	2e00      	cmp	r6, #0
    4f2a:	d1f7      	bne.n	4f1c <pm_system_resume+0x1c>
    4f2c:	f3bf 8f5b 	dmb	ish
    4f30:	420a      	tst	r2, r1
    4f32:	d013      	beq.n	4f5c <pm_system_resume+0x5c>
    4f34:	4b0e      	ldr	r3, [pc, #56]	; (4f70 <pm_system_resume+0x70>)
    4f36:	4d0f      	ldr	r5, [pc, #60]	; (4f74 <pm_system_resume+0x74>)
    4f38:	b18b      	cbz	r3, 4f5e <pm_system_resume+0x5e>
    4f3a:	230c      	movs	r3, #12
    4f3c:	4363      	muls	r3, r4
    4f3e:	18ea      	adds	r2, r5, r3
    4f40:	5ce8      	ldrb	r0, [r5, r3]
    4f42:	7851      	ldrb	r1, [r2, #1]
    4f44:	f006 f9f7 	bl	b336 <pm_state_exit_post_ops>
    4f48:	2000      	movs	r0, #0
    4f4a:	f7ff ffab 	bl	4ea4 <pm_state_notify>
    4f4e:	230c      	movs	r3, #12
    4f50:	435c      	muls	r4, r3
    4f52:	192a      	adds	r2, r5, r4
    4f54:	2300      	movs	r3, #0
    4f56:	512b      	str	r3, [r5, r4]
    4f58:	e9c2 3301 	strd	r3, r3, [r2, #4]
    4f5c:	bd70      	pop	{r4, r5, r6, pc}
    4f5e:	f383 8811 	msr	BASEPRI, r3
    4f62:	f3bf 8f6f 	isb	sy
    4f66:	e7ef      	b.n	4f48 <pm_system_resume+0x48>
    4f68:	20001648 	.word	0x20001648
    4f6c:	20000fdc 	.word	0x20000fdc
    4f70:	0000b337 	.word	0x0000b337
    4f74:	20000fc8 	.word	0x20000fc8

00004f78 <pm_system_suspend>:
    4f78:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    4f7c:	4b35      	ldr	r3, [pc, #212]	; (5054 <pm_system_suspend+0xdc>)
    4f7e:	4607      	mov	r7, r0
    4f80:	7d1d      	ldrb	r5, [r3, #20]
    4f82:	f04f 0320 	mov.w	r3, #32
    4f86:	f3ef 8811 	mrs	r8, BASEPRI
    4f8a:	f383 8812 	msr	BASEPRI_MAX, r3
    4f8e:	f3bf 8f6f 	isb	sy
    4f92:	240c      	movs	r4, #12
    4f94:	4b30      	ldr	r3, [pc, #192]	; (5058 <pm_system_suspend+0xe0>)
    4f96:	4e31      	ldr	r6, [pc, #196]	; (505c <pm_system_suspend+0xe4>)
    4f98:	436c      	muls	r4, r5
    4f9a:	191a      	adds	r2, r3, r4
    4f9c:	5d19      	ldrb	r1, [r3, r4]
    4f9e:	2900      	cmp	r1, #0
    4fa0:	d04c      	beq.n	503c <pm_system_suspend+0xc4>
    4fa2:	ca07      	ldmia	r2, {r0, r1, r2}
    4fa4:	eb06 0c04 	add.w	ip, r6, r4
    4fa8:	e88c 0007 	stmia.w	ip, {r0, r1, r2}
    4fac:	2200      	movs	r2, #0
    4fae:	551a      	strb	r2, [r3, r4]
    4fb0:	f388 8811 	msr	BASEPRI, r8
    4fb4:	f3bf 8f6f 	isb	sy
    4fb8:	230c      	movs	r3, #12
    4fba:	436b      	muls	r3, r5
    4fbc:	18f2      	adds	r2, r6, r3
    4fbe:	5cf0      	ldrb	r0, [r6, r3]
    4fc0:	2800      	cmp	r0, #0
    4fc2:	d039      	beq.n	5038 <pm_system_suspend+0xc0>
    4fc4:	1c7b      	adds	r3, r7, #1
    4fc6:	d010      	beq.n	4fea <pm_system_suspend+0x72>
    4fc8:	f8d2 c008 	ldr.w	ip, [r2, #8]
    4fcc:	4c24      	ldr	r4, [pc, #144]	; (5060 <pm_system_suspend+0xe8>)
    4fce:	4a25      	ldr	r2, [pc, #148]	; (5064 <pm_system_suspend+0xec>)
    4fd0:	f44f 4000 	mov.w	r0, #32768	; 0x8000
    4fd4:	2100      	movs	r1, #0
    4fd6:	fbec 4100 	umlal	r4, r1, ip, r0
    4fda:	2300      	movs	r3, #0
    4fdc:	4620      	mov	r0, r4
    4fde:	f7fb fd37 	bl	a50 <__aeabi_uldivmod>
    4fe2:	2101      	movs	r1, #1
    4fe4:	1a38      	subs	r0, r7, r0
    4fe6:	f006 fed2 	bl	bd8e <z_set_timeout_expiry>
    4fea:	f003 f951 	bl	8290 <k_sched_lock>
    4fee:	2001      	movs	r0, #1
    4ff0:	f7ff ff58 	bl	4ea4 <pm_state_notify>
    4ff4:	f3bf 8f5b 	dmb	ish
    4ff8:	4b1b      	ldr	r3, [pc, #108]	; (5068 <pm_system_suspend+0xf0>)
    4ffa:	096a      	lsrs	r2, r5, #5
    4ffc:	eb03 0382 	add.w	r3, r3, r2, lsl #2
    5000:	f005 011f 	and.w	r1, r5, #31
    5004:	2201      	movs	r2, #1
    5006:	408a      	lsls	r2, r1
    5008:	e853 0f00 	ldrex	r0, [r3]
    500c:	4310      	orrs	r0, r2
    500e:	e843 0100 	strex	r1, r0, [r3]
    5012:	2900      	cmp	r1, #0
    5014:	d1f8      	bne.n	5008 <pm_system_suspend+0x90>
    5016:	f3bf 8f5b 	dmb	ish
    501a:	4b14      	ldr	r3, [pc, #80]	; (506c <pm_system_suspend+0xf4>)
    501c:	b13b      	cbz	r3, 502e <pm_system_suspend+0xb6>
    501e:	230c      	movs	r3, #12
    5020:	fb03 f005 	mul.w	r0, r3, r5
    5024:	1833      	adds	r3, r6, r0
    5026:	5c30      	ldrb	r0, [r6, r0]
    5028:	7859      	ldrb	r1, [r3, #1]
    502a:	f006 f978 	bl	b31e <pm_state_set>
    502e:	f7ff ff67 	bl	4f00 <pm_system_resume>
    5032:	f003 f941 	bl	82b8 <k_sched_unlock>
    5036:	2001      	movs	r0, #1
    5038:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    503c:	4601      	mov	r1, r0
    503e:	4628      	mov	r0, r5
    5040:	f000 f816 	bl	5070 <pm_policy_next_state>
    5044:	2800      	cmp	r0, #0
    5046:	d0b3      	beq.n	4fb0 <pm_system_suspend+0x38>
    5048:	c807      	ldmia	r0, {r0, r1, r2}
    504a:	4434      	add	r4, r6
    504c:	e884 0007 	stmia.w	r4, {r0, r1, r2}
    5050:	e7ae      	b.n	4fb0 <pm_system_suspend+0x38>
    5052:	bf00      	nop
    5054:	20001648 	.word	0x20001648
    5058:	20000fbc 	.word	0x20000fbc
    505c:	20000fc8 	.word	0x20000fc8
    5060:	000f423f 	.word	0x000f423f
    5064:	000f4240 	.word	0x000f4240
    5068:	20000fdc 	.word	0x20000fdc
    506c:	0000b31f 	.word	0x0000b31f

00005070 <pm_policy_next_state>:
    5070:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    5074:	b085      	sub	sp, #20
    5076:	460e      	mov	r6, r1
    5078:	a903      	add	r1, sp, #12
    507a:	f000 f843 	bl	5104 <pm_state_cpu_get_all>
    507e:	4b1e      	ldr	r3, [pc, #120]	; (50f8 <pm_policy_next_state+0x88>)
    5080:	9d03      	ldr	r5, [sp, #12]
    5082:	f8d3 a000 	ldr.w	sl, [r3]
    5086:	f8df 8074 	ldr.w	r8, [pc, #116]	; 50fc <pm_policy_next_state+0x8c>
    508a:	1e43      	subs	r3, r0, #1
    508c:	b21b      	sxth	r3, r3
    508e:	eb03 0343 	add.w	r3, r3, r3, lsl #1
    5092:	4604      	mov	r4, r0
    5094:	eb05 0583 	add.w	r5, r5, r3, lsl #2
    5098:	f44f 4700 	mov.w	r7, #32768	; 0x8000
    509c:	f04f 0b00 	mov.w	fp, #0
    50a0:	b924      	cbnz	r4, 50ac <pm_policy_next_state+0x3c>
    50a2:	46a1      	mov	r9, r4
    50a4:	4648      	mov	r0, r9
    50a6:	b005      	add	sp, #20
    50a8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    50ac:	6868      	ldr	r0, [r5, #4]
    50ae:	4a14      	ldr	r2, [pc, #80]	; (5100 <pm_policy_next_state+0x90>)
    50b0:	46c4      	mov	ip, r8
    50b2:	4659      	mov	r1, fp
    50b4:	fbe0 c107 	umlal	ip, r1, r0, r7
    50b8:	2300      	movs	r3, #0
    50ba:	4660      	mov	r0, ip
    50bc:	f7fb fcc8 	bl	a50 <__aeabi_uldivmod>
    50c0:	9001      	str	r0, [sp, #4]
    50c2:	68a8      	ldr	r0, [r5, #8]
    50c4:	4a0e      	ldr	r2, [pc, #56]	; (5100 <pm_policy_next_state+0x90>)
    50c6:	46c4      	mov	ip, r8
    50c8:	4659      	mov	r1, fp
    50ca:	fbe0 c107 	umlal	ip, r1, r0, r7
    50ce:	2300      	movs	r3, #0
    50d0:	4660      	mov	r0, ip
    50d2:	f7fb fcbd 	bl	a50 <__aeabi_uldivmod>
    50d6:	f1ba 3fff 	cmp.w	sl, #4294967295	; 0xffffffff
    50da:	46a9      	mov	r9, r5
    50dc:	d001      	beq.n	50e2 <pm_policy_next_state+0x72>
    50de:	4582      	cmp	sl, r0
    50e0:	d905      	bls.n	50ee <pm_policy_next_state+0x7e>
    50e2:	1c73      	adds	r3, r6, #1
    50e4:	d0de      	beq.n	50a4 <pm_policy_next_state+0x34>
    50e6:	9b01      	ldr	r3, [sp, #4]
    50e8:	4418      	add	r0, r3
    50ea:	42b0      	cmp	r0, r6
    50ec:	d9da      	bls.n	50a4 <pm_policy_next_state+0x34>
    50ee:	3c01      	subs	r4, #1
    50f0:	b2a4      	uxth	r4, r4
    50f2:	3d0c      	subs	r5, #12
    50f4:	e7d4      	b.n	50a0 <pm_policy_next_state+0x30>
    50f6:	bf00      	nop
    50f8:	200000e8 	.word	0x200000e8
    50fc:	000f423f 	.word	0x000f423f
    5100:	000f4240 	.word	0x000f4240

00005104 <pm_state_cpu_get_all>:
    5104:	b908      	cbnz	r0, 510a <pm_state_cpu_get_all+0x6>
    5106:	4b02      	ldr	r3, [pc, #8]	; (5110 <pm_state_cpu_get_all+0xc>)
    5108:	600b      	str	r3, [r1, #0]
    510a:	2000      	movs	r0, #0
    510c:	4770      	bx	lr
    510e:	bf00      	nop
    5110:	0000d284 	.word	0x0000d284

00005114 <nrf_cc3xx_platform_abort_init>:
    5114:	4801      	ldr	r0, [pc, #4]	; (511c <nrf_cc3xx_platform_abort_init+0x8>)
    5116:	f004 bd85 	b.w	9c24 <nrf_cc3xx_platform_set_abort>
    511a:	bf00      	nop
    511c:	0000d284 	.word	0x0000d284

00005120 <mutex_free_platform>:
    5120:	b538      	push	{r3, r4, r5, lr}
    5122:	4604      	mov	r4, r0
    5124:	b918      	cbnz	r0, 512e <mutex_free_platform+0xe>
    5126:	4b0f      	ldr	r3, [pc, #60]	; (5164 <mutex_free_platform+0x44>)
    5128:	480f      	ldr	r0, [pc, #60]	; (5168 <mutex_free_platform+0x48>)
    512a:	685b      	ldr	r3, [r3, #4]
    512c:	4798      	blx	r3
    512e:	6861      	ldr	r1, [r4, #4]
    5130:	f5b1 3f68 	cmp.w	r1, #237568	; 0x3a000
    5134:	d00f      	beq.n	5156 <mutex_free_platform+0x36>
    5136:	f5b1 0f68 	cmp.w	r1, #15204352	; 0xe80000
    513a:	d00c      	beq.n	5156 <mutex_free_platform+0x36>
    513c:	4d0b      	ldr	r5, [pc, #44]	; (516c <mutex_free_platform+0x4c>)
    513e:	42a9      	cmp	r1, r5
    5140:	d009      	beq.n	5156 <mutex_free_platform+0x36>
    5142:	f411 6168 	ands.w	r1, r1, #3712	; 0xe80
    5146:	d007      	beq.n	5158 <mutex_free_platform+0x38>
    5148:	4809      	ldr	r0, [pc, #36]	; (5170 <mutex_free_platform+0x50>)
    514a:	4621      	mov	r1, r4
    514c:	f006 fcbf 	bl	bace <k_mem_slab_free>
    5150:	2300      	movs	r3, #0
    5152:	6023      	str	r3, [r4, #0]
    5154:	6065      	str	r5, [r4, #4]
    5156:	bd38      	pop	{r3, r4, r5, pc}
    5158:	6820      	ldr	r0, [r4, #0]
    515a:	2214      	movs	r2, #20
    515c:	f007 f806 	bl	c16c <memset>
    5160:	e7f8      	b.n	5154 <mutex_free_platform+0x34>
    5162:	bf00      	nop
    5164:	20000274 	.word	0x20000274
    5168:	0000e438 	.word	0x0000e438
    516c:	a95c5f2c 	.word	0xa95c5f2c
    5170:	200014e0 	.word	0x200014e0

00005174 <mutex_lock_platform>:
    5174:	b508      	push	{r3, lr}
    5176:	b320      	cbz	r0, 51c2 <mutex_lock_platform+0x4e>
    5178:	6843      	ldr	r3, [r0, #4]
    517a:	f5b3 3f68 	cmp.w	r3, #237568	; 0x3a000
    517e:	d110      	bne.n	51a2 <mutex_lock_platform+0x2e>
    5180:	2201      	movs	r2, #1
    5182:	6803      	ldr	r3, [r0, #0]
    5184:	f3bf 8f5b 	dmb	ish
    5188:	e853 1f00 	ldrex	r1, [r3]
    518c:	2900      	cmp	r1, #0
    518e:	d103      	bne.n	5198 <mutex_lock_platform+0x24>
    5190:	e843 2000 	strex	r0, r2, [r3]
    5194:	2800      	cmp	r0, #0
    5196:	d1f7      	bne.n	5188 <mutex_lock_platform+0x14>
    5198:	f3bf 8f5b 	dmb	ish
    519c:	d10d      	bne.n	51ba <mutex_lock_platform+0x46>
    519e:	2000      	movs	r0, #0
    51a0:	bd08      	pop	{r3, pc}
    51a2:	4a09      	ldr	r2, [pc, #36]	; (51c8 <mutex_lock_platform+0x54>)
    51a4:	4293      	cmp	r3, r2
    51a6:	d00a      	beq.n	51be <mutex_lock_platform+0x4a>
    51a8:	6800      	ldr	r0, [r0, #0]
    51aa:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    51ae:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    51b2:	f002 fd5d 	bl	7c70 <z_impl_k_mutex_lock>
    51b6:	2800      	cmp	r0, #0
    51b8:	d0f1      	beq.n	519e <mutex_lock_platform+0x2a>
    51ba:	4804      	ldr	r0, [pc, #16]	; (51cc <mutex_lock_platform+0x58>)
    51bc:	e7f0      	b.n	51a0 <mutex_lock_platform+0x2c>
    51be:	4804      	ldr	r0, [pc, #16]	; (51d0 <mutex_lock_platform+0x5c>)
    51c0:	e7ee      	b.n	51a0 <mutex_lock_platform+0x2c>
    51c2:	f46f 40e0 	mvn.w	r0, #28672	; 0x7000
    51c6:	e7eb      	b.n	51a0 <mutex_lock_platform+0x2c>
    51c8:	a95c5f2c 	.word	0xa95c5f2c
    51cc:	ffff8fe9 	.word	0xffff8fe9
    51d0:	ffff8fea 	.word	0xffff8fea

000051d4 <mutex_unlock_platform>:
    51d4:	b508      	push	{r3, lr}
    51d6:	b1d8      	cbz	r0, 5210 <mutex_unlock_platform+0x3c>
    51d8:	6843      	ldr	r3, [r0, #4]
    51da:	f5b3 3f68 	cmp.w	r3, #237568	; 0x3a000
    51de:	d110      	bne.n	5202 <mutex_unlock_platform+0x2e>
    51e0:	2200      	movs	r2, #0
    51e2:	6803      	ldr	r3, [r0, #0]
    51e4:	f3bf 8f5b 	dmb	ish
    51e8:	e853 1f00 	ldrex	r1, [r3]
    51ec:	2901      	cmp	r1, #1
    51ee:	d103      	bne.n	51f8 <mutex_unlock_platform+0x24>
    51f0:	e843 2000 	strex	r0, r2, [r3]
    51f4:	2800      	cmp	r0, #0
    51f6:	d1f7      	bne.n	51e8 <mutex_unlock_platform+0x14>
    51f8:	f3bf 8f5b 	dmb	ish
    51fc:	d10b      	bne.n	5216 <mutex_unlock_platform+0x42>
    51fe:	2000      	movs	r0, #0
    5200:	bd08      	pop	{r3, pc}
    5202:	4a07      	ldr	r2, [pc, #28]	; (5220 <mutex_unlock_platform+0x4c>)
    5204:	4293      	cmp	r3, r2
    5206:	d008      	beq.n	521a <mutex_unlock_platform+0x46>
    5208:	6800      	ldr	r0, [r0, #0]
    520a:	f002 fdab 	bl	7d64 <z_impl_k_mutex_unlock>
    520e:	e7f6      	b.n	51fe <mutex_unlock_platform+0x2a>
    5210:	f46f 40e0 	mvn.w	r0, #28672	; 0x7000
    5214:	e7f4      	b.n	5200 <mutex_unlock_platform+0x2c>
    5216:	4803      	ldr	r0, [pc, #12]	; (5224 <mutex_unlock_platform+0x50>)
    5218:	e7f2      	b.n	5200 <mutex_unlock_platform+0x2c>
    521a:	4803      	ldr	r0, [pc, #12]	; (5228 <mutex_unlock_platform+0x54>)
    521c:	e7f0      	b.n	5200 <mutex_unlock_platform+0x2c>
    521e:	bf00      	nop
    5220:	a95c5f2c 	.word	0xa95c5f2c
    5224:	ffff8fe9 	.word	0xffff8fe9
    5228:	ffff8fea 	.word	0xffff8fea

0000522c <mutex_init_platform>:
    522c:	b510      	push	{r4, lr}
    522e:	4604      	mov	r4, r0
    5230:	b918      	cbnz	r0, 523a <mutex_init_platform+0xe>
    5232:	4b1d      	ldr	r3, [pc, #116]	; (52a8 <mutex_init_platform+0x7c>)
    5234:	481d      	ldr	r0, [pc, #116]	; (52ac <mutex_init_platform+0x80>)
    5236:	685b      	ldr	r3, [r3, #4]
    5238:	4798      	blx	r3
    523a:	6863      	ldr	r3, [r4, #4]
    523c:	f5b3 3f68 	cmp.w	r3, #237568	; 0x3a000
    5240:	d02f      	beq.n	52a2 <mutex_init_platform+0x76>
    5242:	f5b3 0f68 	cmp.w	r3, #15204352	; 0xe80000
    5246:	d02c      	beq.n	52a2 <mutex_init_platform+0x76>
    5248:	4a19      	ldr	r2, [pc, #100]	; (52b0 <mutex_init_platform+0x84>)
    524a:	4293      	cmp	r3, r2
    524c:	d119      	bne.n	5282 <mutex_init_platform+0x56>
    524e:	6823      	ldr	r3, [r4, #0]
    5250:	bb03      	cbnz	r3, 5294 <mutex_init_platform+0x68>
    5252:	4818      	ldr	r0, [pc, #96]	; (52b4 <mutex_init_platform+0x88>)
    5254:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    5258:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    525c:	4621      	mov	r1, r4
    525e:	f002 fb35 	bl	78cc <k_mem_slab_alloc>
    5262:	b908      	cbnz	r0, 5268 <mutex_init_platform+0x3c>
    5264:	6823      	ldr	r3, [r4, #0]
    5266:	b91b      	cbnz	r3, 5270 <mutex_init_platform+0x44>
    5268:	4b0f      	ldr	r3, [pc, #60]	; (52a8 <mutex_init_platform+0x7c>)
    526a:	4813      	ldr	r0, [pc, #76]	; (52b8 <mutex_init_platform+0x8c>)
    526c:	685b      	ldr	r3, [r3, #4]
    526e:	4798      	blx	r3
    5270:	6820      	ldr	r0, [r4, #0]
    5272:	2214      	movs	r2, #20
    5274:	2100      	movs	r1, #0
    5276:	f006 ff79 	bl	c16c <memset>
    527a:	f44f 6368 	mov.w	r3, #3712	; 0xe80
    527e:	6063      	str	r3, [r4, #4]
    5280:	e008      	b.n	5294 <mutex_init_platform+0x68>
    5282:	f5b3 3f68 	cmp.w	r3, #237568	; 0x3a000
    5286:	d80d      	bhi.n	52a4 <mutex_init_platform+0x78>
    5288:	2b3a      	cmp	r3, #58	; 0x3a
    528a:	d003      	beq.n	5294 <mutex_init_platform+0x68>
    528c:	f640 62ba 	movw	r2, #3770	; 0xeba
    5290:	4293      	cmp	r3, r2
    5292:	d1de      	bne.n	5252 <mutex_init_platform+0x26>
    5294:	6820      	ldr	r0, [r4, #0]
    5296:	f006 fc6e 	bl	bb76 <z_impl_k_mutex_init>
    529a:	6863      	ldr	r3, [r4, #4]
    529c:	f043 033a 	orr.w	r3, r3, #58	; 0x3a
    52a0:	6063      	str	r3, [r4, #4]
    52a2:	bd10      	pop	{r4, pc}
    52a4:	4a05      	ldr	r2, [pc, #20]	; (52bc <mutex_init_platform+0x90>)
    52a6:	e7f3      	b.n	5290 <mutex_init_platform+0x64>
    52a8:	20000274 	.word	0x20000274
    52ac:	0000e438 	.word	0x0000e438
    52b0:	a95c5f2c 	.word	0xa95c5f2c
    52b4:	200014e0 	.word	0x200014e0
    52b8:	0000e45e 	.word	0x0000e45e
    52bc:	3a00003a 	.word	0x3a00003a

000052c0 <nrf_cc3xx_platform_mutex_init>:
    52c0:	b508      	push	{r3, lr}
    52c2:	4906      	ldr	r1, [pc, #24]	; (52dc <nrf_cc3xx_platform_mutex_init+0x1c>)
    52c4:	4806      	ldr	r0, [pc, #24]	; (52e0 <nrf_cc3xx_platform_mutex_init+0x20>)
    52c6:	2340      	movs	r3, #64	; 0x40
    52c8:	2214      	movs	r2, #20
    52ca:	f006 fbf2 	bl	bab2 <k_mem_slab_init>
    52ce:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    52d2:	4904      	ldr	r1, [pc, #16]	; (52e4 <nrf_cc3xx_platform_mutex_init+0x24>)
    52d4:	4804      	ldr	r0, [pc, #16]	; (52e8 <nrf_cc3xx_platform_mutex_init+0x28>)
    52d6:	f004 bd17 	b.w	9d08 <nrf_cc3xx_platform_set_mutexes>
    52da:	bf00      	nop
    52dc:	20000fe0 	.word	0x20000fe0
    52e0:	200014e0 	.word	0x200014e0
    52e4:	0000d28c 	.word	0x0000d28c
    52e8:	0000d2a0 	.word	0x0000d2a0

000052ec <z_arm_cpu_idle_init>:
    52ec:	4901      	ldr	r1, [pc, #4]	; (52f4 <z_arm_cpu_idle_init+0x8>)
    52ee:	2210      	movs	r2, #16
    52f0:	600a      	str	r2, [r1, #0]
    52f2:	4770      	bx	lr
    52f4:	e000ed10 	.word	0xe000ed10

000052f8 <arch_cpu_idle>:
    52f8:	b672      	cpsid	i
    52fa:	4040      	eors	r0, r0
    52fc:	f380 8811 	msr	BASEPRI, r0
    5300:	f3bf 8f6f 	isb	sy
    5304:	f3bf 8f4f 	dsb	sy
    5308:	bf30      	wfi
    530a:	b662      	cpsie	i
    530c:	f3bf 8f6f 	isb	sy
    5310:	4770      	bx	lr
    5312:	bf00      	nop

00005314 <arch_cpu_atomic_idle>:
    5314:	b672      	cpsid	i
    5316:	4049      	eors	r1, r1
    5318:	f381 8811 	msr	BASEPRI, r1
    531c:	f3bf 8f4f 	dsb	sy
    5320:	bf20      	wfe
    5322:	f380 8811 	msr	BASEPRI, r0
    5326:	b662      	cpsie	i
    5328:	4770      	bx	lr
    532a:	bf00      	nop

0000532c <arch_irq_enable>:
    532c:	b240      	sxtb	r0, r0
    532e:	2800      	cmp	r0, #0
    5330:	db07      	blt.n	5342 <arch_irq_enable+0x16>
    5332:	4a04      	ldr	r2, [pc, #16]	; (5344 <arch_irq_enable+0x18>)
    5334:	0941      	lsrs	r1, r0, #5
    5336:	2301      	movs	r3, #1
    5338:	f000 001f 	and.w	r0, r0, #31
    533c:	4083      	lsls	r3, r0
    533e:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
    5342:	4770      	bx	lr
    5344:	e000e100 	.word	0xe000e100

00005348 <arch_irq_is_enabled>:
    5348:	4b05      	ldr	r3, [pc, #20]	; (5360 <arch_irq_is_enabled+0x18>)
    534a:	0942      	lsrs	r2, r0, #5
    534c:	f000 001f 	and.w	r0, r0, #31
    5350:	f853 2022 	ldr.w	r2, [r3, r2, lsl #2]
    5354:	2301      	movs	r3, #1
    5356:	fa03 f000 	lsl.w	r0, r3, r0
    535a:	4010      	ands	r0, r2
    535c:	4770      	bx	lr
    535e:	bf00      	nop
    5360:	e000e100 	.word	0xe000e100

00005364 <z_arm_irq_priority_set>:
    5364:	b240      	sxtb	r0, r0
    5366:	2800      	cmp	r0, #0
    5368:	bfa8      	it	ge
    536a:	f100 4060 	addge.w	r0, r0, #3758096384	; 0xe0000000
    536e:	f101 0101 	add.w	r1, r1, #1
    5372:	bfb8      	it	lt
    5374:	4b06      	ldrlt	r3, [pc, #24]	; (5390 <z_arm_irq_priority_set+0x2c>)
    5376:	ea4f 1141 	mov.w	r1, r1, lsl #5
    537a:	bfac      	ite	ge
    537c:	f500 4061 	addge.w	r0, r0, #57600	; 0xe100
    5380:	f000 000f 	andlt.w	r0, r0, #15
    5384:	b2c9      	uxtb	r1, r1
    5386:	bfb4      	ite	lt
    5388:	5419      	strblt	r1, [r3, r0]
    538a:	f880 1300 	strbge.w	r1, [r0, #768]	; 0x300
    538e:	4770      	bx	lr
    5390:	e000ed14 	.word	0xe000ed14

00005394 <z_SysNmiOnReset>:
    5394:	bf30      	wfi
    5396:	f7ff bffd 	b.w	5394 <z_SysNmiOnReset>
    539a:	bf00      	nop

0000539c <z_arm_prep_c>:
    539c:	4a0b      	ldr	r2, [pc, #44]	; (53cc <z_arm_prep_c+0x30>)
    539e:	b508      	push	{r3, lr}
    53a0:	4b0b      	ldr	r3, [pc, #44]	; (53d0 <z_arm_prep_c+0x34>)
    53a2:	f022 027f 	bic.w	r2, r2, #127	; 0x7f
    53a6:	609a      	str	r2, [r3, #8]
    53a8:	f3bf 8f4f 	dsb	sy
    53ac:	f3bf 8f6f 	isb	sy
    53b0:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
    53b4:	f422 0270 	bic.w	r2, r2, #15728640	; 0xf00000
    53b8:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
    53bc:	f002 f9bc 	bl	7738 <z_bss_zero>
    53c0:	f003 f8ba 	bl	8538 <z_data_copy>
    53c4:	f000 f9e2 	bl	578c <z_arm_interrupt_init>
    53c8:	f002 f9fe 	bl	77c8 <z_cstart>
    53cc:	00000000 	.word	0x00000000
    53d0:	e000ed00 	.word	0xe000ed00

000053d4 <arch_swap>:
    53d4:	4a0a      	ldr	r2, [pc, #40]	; (5400 <arch_swap+0x2c>)
    53d6:	490b      	ldr	r1, [pc, #44]	; (5404 <arch_swap+0x30>)
    53d8:	6893      	ldr	r3, [r2, #8]
    53da:	6809      	ldr	r1, [r1, #0]
    53dc:	f8c3 10b0 	str.w	r1, [r3, #176]	; 0xb0
    53e0:	4909      	ldr	r1, [pc, #36]	; (5408 <arch_swap+0x34>)
    53e2:	f8c3 00ac 	str.w	r0, [r3, #172]	; 0xac
    53e6:	684b      	ldr	r3, [r1, #4]
    53e8:	f043 5380 	orr.w	r3, r3, #268435456	; 0x10000000
    53ec:	604b      	str	r3, [r1, #4]
    53ee:	2300      	movs	r3, #0
    53f0:	f383 8811 	msr	BASEPRI, r3
    53f4:	f3bf 8f6f 	isb	sy
    53f8:	6893      	ldr	r3, [r2, #8]
    53fa:	f8d3 00b0 	ldr.w	r0, [r3, #176]	; 0xb0
    53fe:	4770      	bx	lr
    5400:	20001648 	.word	0x20001648
    5404:	0000d444 	.word	0x0000d444
    5408:	e000ed00 	.word	0xe000ed00

0000540c <z_arm_pendsv>:
    540c:	4913      	ldr	r1, [pc, #76]	; (545c <z_arm_pendsv+0x50>)
    540e:	688a      	ldr	r2, [r1, #8]
    5410:	f04f 0030 	mov.w	r0, #48	; 0x30
    5414:	4410      	add	r0, r2
    5416:	f3ef 8c09 	mrs	ip, PSP
    541a:	e880 1ff0 	stmia.w	r0, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
    541e:	2020      	movs	r0, #32
    5420:	f380 8812 	msr	BASEPRI_MAX, r0
    5424:	f3bf 8f6f 	isb	sy
    5428:	4f0d      	ldr	r7, [pc, #52]	; (5460 <z_arm_pendsv+0x54>)
    542a:	f04f 6600 	mov.w	r6, #134217728	; 0x8000000
    542e:	69ca      	ldr	r2, [r1, #28]
    5430:	608a      	str	r2, [r1, #8]
    5432:	603e      	str	r6, [r7, #0]
    5434:	f8d2 00ac 	ldr.w	r0, [r2, #172]	; 0xac
    5438:	2300      	movs	r3, #0
    543a:	f8c2 30ac 	str.w	r3, [r2, #172]	; 0xac
    543e:	f380 8811 	msr	BASEPRI, r0
    5442:	b504      	push	{r2, lr}
    5444:	4610      	mov	r0, r2
    5446:	f000 fa45 	bl	58d4 <z_arm_configure_dynamic_mpu_regions>
    544a:	e8bd 4004 	ldmia.w	sp!, {r2, lr}
    544e:	f102 0030 	add.w	r0, r2, #48	; 0x30
    5452:	e890 1ff0 	ldmia.w	r0, {r4, r5, r6, r7, r8, r9, sl, fp, ip}
    5456:	f38c 8809 	msr	PSP, ip
    545a:	4770      	bx	lr
    545c:	20001648 	.word	0x20001648
    5460:	e000ed04 	.word	0xe000ed04

00005464 <z_arm_svc>:
    5464:	f01e 0f04 	tst.w	lr, #4
    5468:	bf0c      	ite	eq
    546a:	f3ef 8008 	mrseq	r0, MSP
    546e:	f3ef 8009 	mrsne	r0, PSP
    5472:	6981      	ldr	r1, [r0, #24]
    5474:	f811 1c02 	ldrb.w	r1, [r1, #-2]
    5478:	2902      	cmp	r1, #2
    547a:	d0ff      	beq.n	547c <_oops>

0000547c <_oops>:
    547c:	b501      	push	{r0, lr}
    547e:	f005 ff09 	bl	b294 <z_do_kernel_oops>
    5482:	bd01      	pop	{r0, pc}

00005484 <arch_new_thread>:
    5484:	f842 3c20 	str.w	r3, [r2, #-32]
    5488:	9b00      	ldr	r3, [sp, #0]
    548a:	f842 3c1c 	str.w	r3, [r2, #-28]
    548e:	490a      	ldr	r1, [pc, #40]	; (54b8 <arch_new_thread+0x34>)
    5490:	9b01      	ldr	r3, [sp, #4]
    5492:	f842 3c18 	str.w	r3, [r2, #-24]
    5496:	9b02      	ldr	r3, [sp, #8]
    5498:	f842 3c14 	str.w	r3, [r2, #-20]
    549c:	f021 0101 	bic.w	r1, r1, #1
    54a0:	f04f 7380 	mov.w	r3, #16777216	; 0x1000000
    54a4:	f842 3c04 	str.w	r3, [r2, #-4]
    54a8:	f842 1c08 	str.w	r1, [r2, #-8]
    54ac:	2300      	movs	r3, #0
    54ae:	3a20      	subs	r2, #32
    54b0:	6502      	str	r2, [r0, #80]	; 0x50
    54b2:	f8c0 30ac 	str.w	r3, [r0, #172]	; 0xac
    54b6:	4770      	bx	lr
    54b8:	00009fa5 	.word	0x00009fa5

000054bc <z_check_thread_stack_fail>:
    54bc:	4a0a      	ldr	r2, [pc, #40]	; (54e8 <z_check_thread_stack_fail+0x2c>)
    54be:	4603      	mov	r3, r0
    54c0:	6890      	ldr	r0, [r2, #8]
    54c2:	b178      	cbz	r0, 54e4 <z_check_thread_stack_fail+0x28>
    54c4:	f113 0f16 	cmn.w	r3, #22
    54c8:	f8d0 009c 	ldr.w	r0, [r0, #156]	; 0x9c
    54cc:	d005      	beq.n	54da <z_check_thread_stack_fail+0x1e>
    54ce:	f1a0 0240 	sub.w	r2, r0, #64	; 0x40
    54d2:	429a      	cmp	r2, r3
    54d4:	d805      	bhi.n	54e2 <z_check_thread_stack_fail+0x26>
    54d6:	4283      	cmp	r3, r0
    54d8:	d203      	bcs.n	54e2 <z_check_thread_stack_fail+0x26>
    54da:	4281      	cmp	r1, r0
    54dc:	bf28      	it	cs
    54de:	2000      	movcs	r0, #0
    54e0:	4770      	bx	lr
    54e2:	2000      	movs	r0, #0
    54e4:	4770      	bx	lr
    54e6:	bf00      	nop
    54e8:	20001648 	.word	0x20001648

000054ec <arch_switch_to_main_thread>:
    54ec:	b508      	push	{r3, lr}
    54ee:	4b09      	ldr	r3, [pc, #36]	; (5514 <arch_switch_to_main_thread+0x28>)
    54f0:	6098      	str	r0, [r3, #8]
    54f2:	460d      	mov	r5, r1
    54f4:	4614      	mov	r4, r2
    54f6:	f000 f9ed 	bl	58d4 <z_arm_configure_dynamic_mpu_regions>
    54fa:	4620      	mov	r0, r4
    54fc:	f385 8809 	msr	PSP, r5
    5500:	2100      	movs	r1, #0
    5502:	b663      	cpsie	if
    5504:	f381 8811 	msr	BASEPRI, r1
    5508:	f3bf 8f6f 	isb	sy
    550c:	2200      	movs	r2, #0
    550e:	2300      	movs	r3, #0
    5510:	f004 fd48 	bl	9fa4 <z_thread_entry>
    5514:	20001648 	.word	0x20001648

00005518 <_isr_wrapper>:
    5518:	b501      	push	{r0, lr}
    551a:	b672      	cpsid	i
    551c:	4a0b      	ldr	r2, [pc, #44]	; (554c <_isr_wrapper+0x34>)
    551e:	6990      	ldr	r0, [r2, #24]
    5520:	2800      	cmp	r0, #0
    5522:	bf1e      	ittt	ne
    5524:	2100      	movne	r1, #0
    5526:	6191      	strne	r1, [r2, #24]
    5528:	f006 fb16 	blne	bb58 <z_pm_save_idle_exit>
    552c:	b662      	cpsie	i
    552e:	f3ef 8005 	mrs	r0, IPSR
    5532:	f1a0 0010 	sub.w	r0, r0, #16
    5536:	ea4f 00c0 	mov.w	r0, r0, lsl #3
    553a:	4905      	ldr	r1, [pc, #20]	; (5550 <_isr_wrapper+0x38>)
    553c:	4401      	add	r1, r0
    553e:	c909      	ldmia	r1!, {r0, r3}
    5540:	4798      	blx	r3
    5542:	e8bd 4001 	ldmia.w	sp!, {r0, lr}
    5546:	4903      	ldr	r1, [pc, #12]	; (5554 <_isr_wrapper+0x3c>)
    5548:	4708      	bx	r1
    554a:	0000      	.short	0x0000
    554c:	20001648 	.word	0x20001648
    5550:	0000c8d0 	.word	0x0000c8d0
    5554:	00005559 	.word	0x00005559

00005558 <z_arm_exc_exit>:
    5558:	4b04      	ldr	r3, [pc, #16]	; (556c <_EXIT_EXC+0x2>)
    555a:	6899      	ldr	r1, [r3, #8]
    555c:	69d8      	ldr	r0, [r3, #28]
    555e:	4288      	cmp	r0, r1
    5560:	d003      	beq.n	556a <_EXIT_EXC>
    5562:	4903      	ldr	r1, [pc, #12]	; (5570 <_EXIT_EXC+0x6>)
    5564:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
    5568:	600a      	str	r2, [r1, #0]

0000556a <_EXIT_EXC>:
    556a:	4770      	bx	lr
    556c:	20001648 	.word	0x20001648
    5570:	e000ed04 	.word	0xe000ed04

00005574 <mem_manage_fault>:
    5574:	b570      	push	{r4, r5, r6, lr}
    5576:	4b1d      	ldr	r3, [pc, #116]	; (55ec <mem_manage_fault+0x78>)
    5578:	4615      	mov	r5, r2
    557a:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    557c:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    557e:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    5580:	0792      	lsls	r2, r2, #30
    5582:	4606      	mov	r6, r0
    5584:	d522      	bpl.n	55cc <mem_manage_fault+0x58>
    5586:	6b58      	ldr	r0, [r3, #52]	; 0x34
    5588:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    558a:	0614      	lsls	r4, r2, #24
    558c:	d51e      	bpl.n	55cc <mem_manage_fault+0x58>
    558e:	b119      	cbz	r1, 5598 <mem_manage_fault+0x24>
    5590:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    5592:	f022 0280 	bic.w	r2, r2, #128	; 0x80
    5596:	629a      	str	r2, [r3, #40]	; 0x28
    5598:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    559a:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    559c:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    559e:	4c13      	ldr	r4, [pc, #76]	; (55ec <mem_manage_fault+0x78>)
    55a0:	f012 0f10 	tst.w	r2, #16
    55a4:	d115      	bne.n	55d2 <mem_manage_fault+0x5e>
    55a6:	6a9b      	ldr	r3, [r3, #40]	; 0x28
    55a8:	0799      	lsls	r1, r3, #30
    55aa:	d412      	bmi.n	55d2 <mem_manage_fault+0x5e>
    55ac:	2000      	movs	r0, #0
    55ae:	6aa3      	ldr	r3, [r4, #40]	; 0x28
    55b0:	4a0e      	ldr	r2, [pc, #56]	; (55ec <mem_manage_fault+0x78>)
    55b2:	069b      	lsls	r3, r3, #26
    55b4:	bf42      	ittt	mi
    55b6:	6a63      	ldrmi	r3, [r4, #36]	; 0x24
    55b8:	f423 5300 	bicmi.w	r3, r3, #8192	; 0x2000
    55bc:	6263      	strmi	r3, [r4, #36]	; 0x24
    55be:	6a93      	ldr	r3, [r2, #40]	; 0x28
    55c0:	f043 03ff 	orr.w	r3, r3, #255	; 0xff
    55c4:	6293      	str	r3, [r2, #40]	; 0x28
    55c6:	2300      	movs	r3, #0
    55c8:	702b      	strb	r3, [r5, #0]
    55ca:	bd70      	pop	{r4, r5, r6, pc}
    55cc:	f06f 0015 	mvn.w	r0, #21
    55d0:	e7e2      	b.n	5598 <mem_manage_fault+0x24>
    55d2:	6863      	ldr	r3, [r4, #4]
    55d4:	051a      	lsls	r2, r3, #20
    55d6:	d5e9      	bpl.n	55ac <mem_manage_fault+0x38>
    55d8:	4631      	mov	r1, r6
    55da:	f7ff ff6f 	bl	54bc <z_check_thread_stack_fail>
    55de:	2800      	cmp	r0, #0
    55e0:	d0e4      	beq.n	55ac <mem_manage_fault+0x38>
    55e2:	f380 8809 	msr	PSP, r0
    55e6:	2002      	movs	r0, #2
    55e8:	e7e1      	b.n	55ae <mem_manage_fault+0x3a>
    55ea:	bf00      	nop
    55ec:	e000ed00 	.word	0xe000ed00

000055f0 <bus_fault.constprop.0>:
    55f0:	4b0d      	ldr	r3, [pc, #52]	; (5628 <bus_fault.constprop.0+0x38>)
    55f2:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    55f4:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    55f6:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    55f8:	0592      	lsls	r2, r2, #22
    55fa:	d508      	bpl.n	560e <bus_fault.constprop.0+0x1e>
    55fc:	6b9a      	ldr	r2, [r3, #56]	; 0x38
    55fe:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    5600:	0412      	lsls	r2, r2, #16
    5602:	d504      	bpl.n	560e <bus_fault.constprop.0+0x1e>
    5604:	b118      	cbz	r0, 560e <bus_fault.constprop.0+0x1e>
    5606:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    5608:	f422 4200 	bic.w	r2, r2, #32768	; 0x8000
    560c:	629a      	str	r2, [r3, #40]	; 0x28
    560e:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    5610:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    5612:	05d2      	lsls	r2, r2, #23
    5614:	4a04      	ldr	r2, [pc, #16]	; (5628 <bus_fault.constprop.0+0x38>)
    5616:	bf58      	it	pl
    5618:	6a9b      	ldrpl	r3, [r3, #40]	; 0x28
    561a:	6a93      	ldr	r3, [r2, #40]	; 0x28
    561c:	2000      	movs	r0, #0
    561e:	f443 437f 	orr.w	r3, r3, #65280	; 0xff00
    5622:	6293      	str	r3, [r2, #40]	; 0x28
    5624:	7008      	strb	r0, [r1, #0]
    5626:	4770      	bx	lr
    5628:	e000ed00 	.word	0xe000ed00

0000562c <z_arm_fault>:
    562c:	b5f0      	push	{r4, r5, r6, r7, lr}
    562e:	4b4d      	ldr	r3, [pc, #308]	; (5764 <z_arm_fault+0x138>)
    5630:	685b      	ldr	r3, [r3, #4]
    5632:	b08b      	sub	sp, #44	; 0x2c
    5634:	4604      	mov	r4, r0
    5636:	f3c3 0308 	ubfx	r3, r3, #0, #9
    563a:	2500      	movs	r5, #0
    563c:	f385 8811 	msr	BASEPRI, r5
    5640:	f3bf 8f6f 	isb	sy
    5644:	f002 407f 	and.w	r0, r2, #4278190080	; 0xff000000
    5648:	f1b0 4f7f 	cmp.w	r0, #4278190080	; 0xff000000
    564c:	d111      	bne.n	5672 <z_arm_fault+0x46>
    564e:	f002 000c 	and.w	r0, r2, #12
    5652:	2808      	cmp	r0, #8
    5654:	d00d      	beq.n	5672 <z_arm_fault+0x46>
    5656:	0710      	lsls	r0, r2, #28
    5658:	bf4c      	ite	mi
    565a:	460c      	movmi	r4, r1
    565c:	2501      	movpl	r5, #1
    565e:	2200      	movs	r2, #0
    5660:	3b03      	subs	r3, #3
    5662:	f88d 2007 	strb.w	r2, [sp, #7]
    5666:	2b03      	cmp	r3, #3
    5668:	d84d      	bhi.n	5706 <z_arm_fault+0xda>
    566a:	e8df f003 	tbb	[pc, r3]
    566e:	6b04      	.short	0x6b04
    5670:	736f      	.short	0x736f
    5672:	462c      	mov	r4, r5
    5674:	e7f3      	b.n	565e <z_arm_fault+0x32>
    5676:	4b3b      	ldr	r3, [pc, #236]	; (5764 <z_arm_fault+0x138>)
    5678:	6ada      	ldr	r2, [r3, #44]	; 0x2c
    567a:	0791      	lsls	r1, r2, #30
    567c:	d443      	bmi.n	5706 <z_arm_fault+0xda>
    567e:	6ada      	ldr	r2, [r3, #44]	; 0x2c
    5680:	2a00      	cmp	r2, #0
    5682:	db40      	blt.n	5706 <z_arm_fault+0xda>
    5684:	6ada      	ldr	r2, [r3, #44]	; 0x2c
    5686:	0052      	lsls	r2, r2, #1
    5688:	d53d      	bpl.n	5706 <z_arm_fault+0xda>
    568a:	695a      	ldr	r2, [r3, #20]
    568c:	69a1      	ldr	r1, [r4, #24]
    568e:	f442 7280 	orr.w	r2, r2, #256	; 0x100
    5692:	615a      	str	r2, [r3, #20]
    5694:	f3bf 8f4f 	dsb	sy
    5698:	f3bf 8f6f 	isb	sy
    569c:	695a      	ldr	r2, [r3, #20]
    569e:	f831 1c02 	ldrh.w	r1, [r1, #-2]
    56a2:	f422 7280 	bic.w	r2, r2, #256	; 0x100
    56a6:	615a      	str	r2, [r3, #20]
    56a8:	f3bf 8f4f 	dsb	sy
    56ac:	f3bf 8f6f 	isb	sy
    56b0:	f64d 7202 	movw	r2, #57090	; 0xdf02
    56b4:	4291      	cmp	r1, r2
    56b6:	d009      	beq.n	56cc <z_arm_fault+0xa0>
    56b8:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56ba:	b2d2      	uxtb	r2, r2
    56bc:	b142      	cbz	r2, 56d0 <z_arm_fault+0xa4>
    56be:	f10d 0207 	add.w	r2, sp, #7
    56c2:	2101      	movs	r1, #1
    56c4:	4620      	mov	r0, r4
    56c6:	f7ff ff55 	bl	5574 <mem_manage_fault>
    56ca:	e00a      	b.n	56e2 <z_arm_fault+0xb6>
    56cc:	6823      	ldr	r3, [r4, #0]
    56ce:	e01b      	b.n	5708 <z_arm_fault+0xdc>
    56d0:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56d2:	f412 4f7f 	tst.w	r2, #65280	; 0xff00
    56d6:	d006      	beq.n	56e6 <z_arm_fault+0xba>
    56d8:	f10d 0107 	add.w	r1, sp, #7
    56dc:	2001      	movs	r0, #1
    56de:	f7ff ff87 	bl	55f0 <bus_fault.constprop.0>
    56e2:	4603      	mov	r3, r0
    56e4:	e010      	b.n	5708 <z_arm_fault+0xdc>
    56e6:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56e8:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
    56ec:	d30b      	bcc.n	5706 <z_arm_fault+0xda>
    56ee:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56f0:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56f2:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56f4:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56f6:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56f8:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56fa:	6a9a      	ldr	r2, [r3, #40]	; 0x28
    56fc:	ea6f 4202 	mvn.w	r2, r2, lsl #16
    5700:	ea6f 4212 	mvn.w	r2, r2, lsr #16
    5704:	629a      	str	r2, [r3, #40]	; 0x28
    5706:	2300      	movs	r3, #0
    5708:	f89d 2007 	ldrb.w	r2, [sp, #7]
    570c:	b9c2      	cbnz	r2, 5740 <z_arm_fault+0x114>
    570e:	ae02      	add	r6, sp, #8
    5710:	f104 0720 	add.w	r7, r4, #32
    5714:	6820      	ldr	r0, [r4, #0]
    5716:	6861      	ldr	r1, [r4, #4]
    5718:	4632      	mov	r2, r6
    571a:	c203      	stmia	r2!, {r0, r1}
    571c:	3408      	adds	r4, #8
    571e:	42bc      	cmp	r4, r7
    5720:	4616      	mov	r6, r2
    5722:	d1f7      	bne.n	5714 <z_arm_fault+0xe8>
    5724:	9a09      	ldr	r2, [sp, #36]	; 0x24
    5726:	b1bd      	cbz	r5, 5758 <z_arm_fault+0x12c>
    5728:	f3c2 0108 	ubfx	r1, r2, #0, #9
    572c:	b921      	cbnz	r1, 5738 <z_arm_fault+0x10c>
    572e:	ea6f 2252 	mvn.w	r2, r2, lsr #9
    5732:	ea6f 2242 	mvn.w	r2, r2, lsl #9
    5736:	9209      	str	r2, [sp, #36]	; 0x24
    5738:	a902      	add	r1, sp, #8
    573a:	4618      	mov	r0, r3
    573c:	f005 fda8 	bl	b290 <z_arm_fatal_error>
    5740:	b00b      	add	sp, #44	; 0x2c
    5742:	bdf0      	pop	{r4, r5, r6, r7, pc}
    5744:	f10d 0207 	add.w	r2, sp, #7
    5748:	2100      	movs	r1, #0
    574a:	e7bb      	b.n	56c4 <z_arm_fault+0x98>
    574c:	f10d 0107 	add.w	r1, sp, #7
    5750:	2000      	movs	r0, #0
    5752:	e7c4      	b.n	56de <z_arm_fault+0xb2>
    5754:	4b03      	ldr	r3, [pc, #12]	; (5764 <z_arm_fault+0x138>)
    5756:	e7ca      	b.n	56ee <z_arm_fault+0xc2>
    5758:	f422 72ff 	bic.w	r2, r2, #510	; 0x1fe
    575c:	f022 0201 	bic.w	r2, r2, #1
    5760:	e7e9      	b.n	5736 <z_arm_fault+0x10a>
    5762:	bf00      	nop
    5764:	e000ed00 	.word	0xe000ed00

00005768 <z_arm_fault_init>:
    5768:	4a02      	ldr	r2, [pc, #8]	; (5774 <z_arm_fault_init+0xc>)
    576a:	6953      	ldr	r3, [r2, #20]
    576c:	f043 0310 	orr.w	r3, r3, #16
    5770:	6153      	str	r3, [r2, #20]
    5772:	4770      	bx	lr
    5774:	e000ed00 	.word	0xe000ed00

00005778 <z_arm_bus_fault>:
    5778:	f3ef 8008 	mrs	r0, MSP
    577c:	f3ef 8109 	mrs	r1, PSP
    5780:	b501      	push	{r0, lr}
    5782:	4672      	mov	r2, lr
    5784:	f7ff ff52 	bl	562c <z_arm_fault>
    5788:	bd01      	pop	{r0, pc}
    578a:	bf00      	nop

0000578c <z_arm_interrupt_init>:
    578c:	4804      	ldr	r0, [pc, #16]	; (57a0 <z_arm_interrupt_init+0x14>)
    578e:	2300      	movs	r3, #0
    5790:	2120      	movs	r1, #32
    5792:	18c2      	adds	r2, r0, r3
    5794:	3301      	adds	r3, #1
    5796:	2b30      	cmp	r3, #48	; 0x30
    5798:	f882 1300 	strb.w	r1, [r2, #768]	; 0x300
    579c:	d1f9      	bne.n	5792 <z_arm_interrupt_init+0x6>
    579e:	4770      	bx	lr
    57a0:	e000e100 	.word	0xe000e100

000057a4 <__start>:
    57a4:	2000      	movs	r0, #0
    57a6:	f380 8814 	msr	CONTROL, r0
    57aa:	f3bf 8f6f 	isb	sy
    57ae:	f7fd f941 	bl	2a34 <z_arm_platform_init>
    57b2:	2000      	movs	r0, #0
    57b4:	4911      	ldr	r1, [pc, #68]	; (57fc <__start+0x58>)
    57b6:	6008      	str	r0, [r1, #0]
    57b8:	f3bf 8f4f 	dsb	sy
    57bc:	4810      	ldr	r0, [pc, #64]	; (5800 <__start+0x5c>)
    57be:	f380 8808 	msr	MSP, r0
    57c2:	f000 f833 	bl	582c <z_arm_init_arch_hw_at_boot>
    57c6:	2020      	movs	r0, #32
    57c8:	f380 8811 	msr	BASEPRI, r0
    57cc:	480d      	ldr	r0, [pc, #52]	; (5804 <__start+0x60>)
    57ce:	f04f 01aa 	mov.w	r1, #170	; 0xaa
    57d2:	f44f 6204 	mov.w	r2, #2112	; 0x840
    57d6:	f006 f952 	bl	ba7e <z_early_memset>
    57da:	480a      	ldr	r0, [pc, #40]	; (5804 <__start+0x60>)
    57dc:	f44f 6104 	mov.w	r1, #2112	; 0x840
    57e0:	1840      	adds	r0, r0, r1
    57e2:	f380 8809 	msr	PSP, r0
    57e6:	f3ef 8014 	mrs	r0, CONTROL
    57ea:	2102      	movs	r1, #2
    57ec:	4308      	orrs	r0, r1
    57ee:	f380 8814 	msr	CONTROL, r0
    57f2:	f3bf 8f6f 	isb	sy
    57f6:	f7ff fdd1 	bl	539c <z_arm_prep_c>
    57fa:	0000      	.short	0x0000
    57fc:	e000ed94 	.word	0xe000ed94
    5800:	20003b80 	.word	0x20003b80
    5804:	20002dc0 	.word	0x20002dc0

00005808 <z_arm_clear_arm_mpu_config>:
    5808:	4907      	ldr	r1, [pc, #28]	; (5828 <z_arm_clear_arm_mpu_config+0x20>)
    580a:	f8d1 2090 	ldr.w	r2, [r1, #144]	; 0x90
    580e:	2300      	movs	r3, #0
    5810:	f3c2 2207 	ubfx	r2, r2, #8, #8
    5814:	4618      	mov	r0, r3
    5816:	4293      	cmp	r3, r2
    5818:	db00      	blt.n	581c <z_arm_clear_arm_mpu_config+0x14>
    581a:	4770      	bx	lr
    581c:	f8c1 3098 	str.w	r3, [r1, #152]	; 0x98
    5820:	f8c1 00a0 	str.w	r0, [r1, #160]	; 0xa0
    5824:	3301      	adds	r3, #1
    5826:	e7f6      	b.n	5816 <z_arm_clear_arm_mpu_config+0xe>
    5828:	e000ed00 	.word	0xe000ed00

0000582c <z_arm_init_arch_hw_at_boot>:
    582c:	b508      	push	{r3, lr}
    582e:	b672      	cpsid	i
    5830:	2300      	movs	r3, #0
    5832:	f383 8813 	msr	FAULTMASK, r3
    5836:	f7ff ffe7 	bl	5808 <z_arm_clear_arm_mpu_config>
    583a:	4b14      	ldr	r3, [pc, #80]	; (588c <z_arm_init_arch_hw_at_boot+0x60>)
    583c:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    5840:	f8c3 2080 	str.w	r2, [r3, #128]	; 0x80
    5844:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
    5848:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
    584c:	f8c3 208c 	str.w	r2, [r3, #140]	; 0x8c
    5850:	f8c3 2090 	str.w	r2, [r3, #144]	; 0x90
    5854:	f8c3 2094 	str.w	r2, [r3, #148]	; 0x94
    5858:	f8c3 2098 	str.w	r2, [r3, #152]	; 0x98
    585c:	f8c3 209c 	str.w	r2, [r3, #156]	; 0x9c
    5860:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
    5864:	f8c3 2184 	str.w	r2, [r3, #388]	; 0x184
    5868:	f8c3 2188 	str.w	r2, [r3, #392]	; 0x188
    586c:	f8c3 218c 	str.w	r2, [r3, #396]	; 0x18c
    5870:	f8c3 2190 	str.w	r2, [r3, #400]	; 0x190
    5874:	f8c3 2194 	str.w	r2, [r3, #404]	; 0x194
    5878:	f8c3 2198 	str.w	r2, [r3, #408]	; 0x198
    587c:	f8c3 219c 	str.w	r2, [r3, #412]	; 0x19c
    5880:	b662      	cpsie	i
    5882:	f3bf 8f4f 	dsb	sy
    5886:	f3bf 8f6f 	isb	sy
    588a:	bd08      	pop	{r3, pc}
    588c:	e000e100 	.word	0xe000e100

00005890 <z_impl_k_thread_abort>:
    5890:	4b08      	ldr	r3, [pc, #32]	; (58b4 <z_impl_k_thread_abort+0x24>)
    5892:	689b      	ldr	r3, [r3, #8]
    5894:	4283      	cmp	r3, r0
    5896:	d10b      	bne.n	58b0 <z_impl_k_thread_abort+0x20>
    5898:	f3ef 8305 	mrs	r3, IPSR
    589c:	b143      	cbz	r3, 58b0 <z_impl_k_thread_abort+0x20>
    589e:	4b06      	ldr	r3, [pc, #24]	; (58b8 <z_impl_k_thread_abort+0x28>)
    58a0:	685a      	ldr	r2, [r3, #4]
    58a2:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
    58a6:	605a      	str	r2, [r3, #4]
    58a8:	6a5a      	ldr	r2, [r3, #36]	; 0x24
    58aa:	f422 4200 	bic.w	r2, r2, #32768	; 0x8000
    58ae:	625a      	str	r2, [r3, #36]	; 0x24
    58b0:	f002 bdcc 	b.w	844c <z_thread_abort>
    58b4:	20001648 	.word	0x20001648
    58b8:	e000ed00 	.word	0xe000ed00

000058bc <z_arm_configure_static_mpu_regions>:
    58bc:	4b02      	ldr	r3, [pc, #8]	; (58c8 <z_arm_configure_static_mpu_regions+0xc>)
    58be:	4a03      	ldr	r2, [pc, #12]	; (58cc <z_arm_configure_static_mpu_regions+0x10>)
    58c0:	4803      	ldr	r0, [pc, #12]	; (58d0 <z_arm_configure_static_mpu_regions+0x14>)
    58c2:	2101      	movs	r1, #1
    58c4:	f000 b872 	b.w	59ac <arm_core_mpu_configure_static_mpu_regions>
    58c8:	20040000 	.word	0x20040000
    58cc:	20000000 	.word	0x20000000
    58d0:	0000d2b0 	.word	0x0000d2b0

000058d4 <z_arm_configure_dynamic_mpu_regions>:
    58d4:	f8d0 209c 	ldr.w	r2, [r0, #156]	; 0x9c
    58d8:	4b05      	ldr	r3, [pc, #20]	; (58f0 <z_arm_configure_dynamic_mpu_regions+0x1c>)
    58da:	3a40      	subs	r2, #64	; 0x40
    58dc:	601a      	str	r2, [r3, #0]
    58de:	4a05      	ldr	r2, [pc, #20]	; (58f4 <z_arm_configure_dynamic_mpu_regions+0x20>)
    58e0:	2140      	movs	r1, #64	; 0x40
    58e2:	e9c3 1201 	strd	r1, r2, [r3, #4]
    58e6:	4618      	mov	r0, r3
    58e8:	2101      	movs	r1, #1
    58ea:	f000 b869 	b.w	59c0 <arm_core_mpu_configure_dynamic_mpu_regions>
    58ee:	bf00      	nop
    58f0:	200014fc 	.word	0x200014fc
    58f4:	150b0000 	.word	0x150b0000

000058f8 <mpu_configure_regions>:
    58f8:	b5f0      	push	{r4, r5, r6, r7, lr}
    58fa:	4e20      	ldr	r6, [pc, #128]	; (597c <mpu_configure_regions+0x84>)
    58fc:	2500      	movs	r5, #0
    58fe:	428d      	cmp	r5, r1
    5900:	da39      	bge.n	5976 <mpu_configure_regions+0x7e>
    5902:	6844      	ldr	r4, [r0, #4]
    5904:	b374      	cbz	r4, 5964 <mpu_configure_regions+0x6c>
    5906:	b153      	cbz	r3, 591e <mpu_configure_regions+0x26>
    5908:	f104 3cff 	add.w	ip, r4, #4294967295	; 0xffffffff
    590c:	ea14 0f0c 	tst.w	r4, ip
    5910:	d12f      	bne.n	5972 <mpu_configure_regions+0x7a>
    5912:	2c1f      	cmp	r4, #31
    5914:	d92d      	bls.n	5972 <mpu_configure_regions+0x7a>
    5916:	6807      	ldr	r7, [r0, #0]
    5918:	ea1c 0f07 	tst.w	ip, r7
    591c:	d129      	bne.n	5972 <mpu_configure_regions+0x7a>
    591e:	2c20      	cmp	r4, #32
    5920:	6807      	ldr	r7, [r0, #0]
    5922:	f8d0 c008 	ldr.w	ip, [r0, #8]
    5926:	fa5f fe82 	uxtb.w	lr, r2
    592a:	d91e      	bls.n	596a <mpu_configure_regions+0x72>
    592c:	f1b4 4f00 	cmp.w	r4, #2147483648	; 0x80000000
    5930:	d81d      	bhi.n	596e <mpu_configure_regions+0x76>
    5932:	3c01      	subs	r4, #1
    5934:	fab4 f484 	clz	r4, r4
    5938:	f1c4 041f 	rsb	r4, r4, #31
    593c:	0064      	lsls	r4, r4, #1
    593e:	f1be 0f07 	cmp.w	lr, #7
    5942:	ea4c 0c04 	orr.w	ip, ip, r4
    5946:	d814      	bhi.n	5972 <mpu_configure_regions+0x7a>
    5948:	f027 041f 	bic.w	r4, r7, #31
    594c:	4314      	orrs	r4, r2
    594e:	f044 0410 	orr.w	r4, r4, #16
    5952:	f8c6 2098 	str.w	r2, [r6, #152]	; 0x98
    5956:	f8c6 409c 	str.w	r4, [r6, #156]	; 0x9c
    595a:	f04c 0401 	orr.w	r4, ip, #1
    595e:	f8c6 40a0 	str.w	r4, [r6, #160]	; 0xa0
    5962:	3201      	adds	r2, #1
    5964:	3501      	adds	r5, #1
    5966:	300c      	adds	r0, #12
    5968:	e7c9      	b.n	58fe <mpu_configure_regions+0x6>
    596a:	2408      	movs	r4, #8
    596c:	e7e7      	b.n	593e <mpu_configure_regions+0x46>
    596e:	243e      	movs	r4, #62	; 0x3e
    5970:	e7e5      	b.n	593e <mpu_configure_regions+0x46>
    5972:	f06f 0215 	mvn.w	r2, #21
    5976:	4610      	mov	r0, r2
    5978:	bdf0      	pop	{r4, r5, r6, r7, pc}
    597a:	bf00      	nop
    597c:	e000ed00 	.word	0xe000ed00

00005980 <arm_core_mpu_enable>:
    5980:	4b04      	ldr	r3, [pc, #16]	; (5994 <arm_core_mpu_enable+0x14>)
    5982:	2205      	movs	r2, #5
    5984:	f8c3 2094 	str.w	r2, [r3, #148]	; 0x94
    5988:	f3bf 8f4f 	dsb	sy
    598c:	f3bf 8f6f 	isb	sy
    5990:	4770      	bx	lr
    5992:	bf00      	nop
    5994:	e000ed00 	.word	0xe000ed00

00005998 <arm_core_mpu_disable>:
    5998:	f3bf 8f5f 	dmb	sy
    599c:	4b02      	ldr	r3, [pc, #8]	; (59a8 <arm_core_mpu_disable+0x10>)
    599e:	2200      	movs	r2, #0
    59a0:	f8c3 2094 	str.w	r2, [r3, #148]	; 0x94
    59a4:	4770      	bx	lr
    59a6:	bf00      	nop
    59a8:	e000ed00 	.word	0xe000ed00

000059ac <arm_core_mpu_configure_static_mpu_regions>:
    59ac:	b510      	push	{r4, lr}
    59ae:	4c03      	ldr	r4, [pc, #12]	; (59bc <arm_core_mpu_configure_static_mpu_regions+0x10>)
    59b0:	2301      	movs	r3, #1
    59b2:	7822      	ldrb	r2, [r4, #0]
    59b4:	f7ff ffa0 	bl	58f8 <mpu_configure_regions>
    59b8:	7020      	strb	r0, [r4, #0]
    59ba:	bd10      	pop	{r4, pc}
    59bc:	200018b2 	.word	0x200018b2

000059c0 <arm_core_mpu_configure_dynamic_mpu_regions>:
    59c0:	b508      	push	{r3, lr}
    59c2:	4a09      	ldr	r2, [pc, #36]	; (59e8 <arm_core_mpu_configure_dynamic_mpu_regions+0x28>)
    59c4:	2300      	movs	r3, #0
    59c6:	7812      	ldrb	r2, [r2, #0]
    59c8:	f7ff ff96 	bl	58f8 <mpu_configure_regions>
    59cc:	f110 0f16 	cmn.w	r0, #22
    59d0:	d002      	beq.n	59d8 <arm_core_mpu_configure_dynamic_mpu_regions+0x18>
    59d2:	4a06      	ldr	r2, [pc, #24]	; (59ec <arm_core_mpu_configure_dynamic_mpu_regions+0x2c>)
    59d4:	2807      	cmp	r0, #7
    59d6:	dd00      	ble.n	59da <arm_core_mpu_configure_dynamic_mpu_regions+0x1a>
    59d8:	bd08      	pop	{r3, pc}
    59da:	f8c2 0098 	str.w	r0, [r2, #152]	; 0x98
    59de:	f8c2 30a0 	str.w	r3, [r2, #160]	; 0xa0
    59e2:	3001      	adds	r0, #1
    59e4:	e7f6      	b.n	59d4 <arm_core_mpu_configure_dynamic_mpu_regions+0x14>
    59e6:	bf00      	nop
    59e8:	200018b2 	.word	0x200018b2
    59ec:	e000ed00 	.word	0xe000ed00

000059f0 <z_arm_mpu_init>:
    59f0:	4914      	ldr	r1, [pc, #80]	; (5a44 <z_arm_mpu_init+0x54>)
    59f2:	6808      	ldr	r0, [r1, #0]
    59f4:	2808      	cmp	r0, #8
    59f6:	b510      	push	{r4, lr}
    59f8:	d821      	bhi.n	5a3e <z_arm_mpu_init+0x4e>
    59fa:	f7ff ffcd 	bl	5998 <arm_core_mpu_disable>
    59fe:	4c12      	ldr	r4, [pc, #72]	; (5a48 <z_arm_mpu_init+0x58>)
    5a00:	6849      	ldr	r1, [r1, #4]
    5a02:	2200      	movs	r2, #0
    5a04:	4290      	cmp	r0, r2
    5a06:	f101 010c 	add.w	r1, r1, #12
    5a0a:	d105      	bne.n	5a18 <z_arm_mpu_init+0x28>
    5a0c:	4b0f      	ldr	r3, [pc, #60]	; (5a4c <z_arm_mpu_init+0x5c>)
    5a0e:	7018      	strb	r0, [r3, #0]
    5a10:	f7ff ffb6 	bl	5980 <arm_core_mpu_enable>
    5a14:	2000      	movs	r0, #0
    5a16:	bd10      	pop	{r4, pc}
    5a18:	f8c4 2098 	str.w	r2, [r4, #152]	; 0x98
    5a1c:	f851 3c0c 	ldr.w	r3, [r1, #-12]
    5a20:	f023 031f 	bic.w	r3, r3, #31
    5a24:	4313      	orrs	r3, r2
    5a26:	f043 0310 	orr.w	r3, r3, #16
    5a2a:	f8c4 309c 	str.w	r3, [r4, #156]	; 0x9c
    5a2e:	f851 3c04 	ldr.w	r3, [r1, #-4]
    5a32:	f043 0301 	orr.w	r3, r3, #1
    5a36:	f8c4 30a0 	str.w	r3, [r4, #160]	; 0xa0
    5a3a:	3201      	adds	r2, #1
    5a3c:	e7e2      	b.n	5a04 <z_arm_mpu_init+0x14>
    5a3e:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    5a42:	e7e8      	b.n	5a16 <z_arm_mpu_init+0x26>
    5a44:	0000d2bc 	.word	0x0000d2bc
    5a48:	e000ed00 	.word	0xe000ed00
    5a4c:	200018b2 	.word	0x200018b2

00005a50 <__stdout_hook_install>:
    5a50:	4b01      	ldr	r3, [pc, #4]	; (5a58 <__stdout_hook_install+0x8>)
    5a52:	6018      	str	r0, [r3, #0]
    5a54:	4770      	bx	lr
    5a56:	bf00      	nop
    5a58:	20000110 	.word	0x20000110

00005a5c <z_impl_zephyr_read_stdin>:
    5a5c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    5a5e:	4f08      	ldr	r7, [pc, #32]	; (5a80 <z_impl_zephyr_read_stdin+0x24>)
    5a60:	4606      	mov	r6, r0
    5a62:	460d      	mov	r5, r1
    5a64:	2400      	movs	r4, #0
    5a66:	42ac      	cmp	r4, r5
    5a68:	da08      	bge.n	5a7c <z_impl_zephyr_read_stdin+0x20>
    5a6a:	683b      	ldr	r3, [r7, #0]
    5a6c:	4798      	blx	r3
    5a6e:	280a      	cmp	r0, #10
    5a70:	5530      	strb	r0, [r6, r4]
    5a72:	f104 0401 	add.w	r4, r4, #1
    5a76:	d001      	beq.n	5a7c <z_impl_zephyr_read_stdin+0x20>
    5a78:	280d      	cmp	r0, #13
    5a7a:	d1f4      	bne.n	5a66 <z_impl_zephyr_read_stdin+0xa>
    5a7c:	4620      	mov	r0, r4
    5a7e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    5a80:	2000010c 	.word	0x2000010c

00005a84 <z_impl_zephyr_write_stdout>:
    5a84:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    5a86:	4f0a      	ldr	r7, [pc, #40]	; (5ab0 <z_impl_zephyr_write_stdout+0x2c>)
    5a88:	460d      	mov	r5, r1
    5a8a:	1e46      	subs	r6, r0, #1
    5a8c:	f1c0 0401 	rsb	r4, r0, #1
    5a90:	19a3      	adds	r3, r4, r6
    5a92:	429d      	cmp	r5, r3
    5a94:	dc01      	bgt.n	5a9a <z_impl_zephyr_write_stdout+0x16>
    5a96:	4628      	mov	r0, r5
    5a98:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    5a9a:	7873      	ldrb	r3, [r6, #1]
    5a9c:	2b0a      	cmp	r3, #10
    5a9e:	d102      	bne.n	5aa6 <z_impl_zephyr_write_stdout+0x22>
    5aa0:	683b      	ldr	r3, [r7, #0]
    5aa2:	200d      	movs	r0, #13
    5aa4:	4798      	blx	r3
    5aa6:	683b      	ldr	r3, [r7, #0]
    5aa8:	f816 0f01 	ldrb.w	r0, [r6, #1]!
    5aac:	4798      	blx	r3
    5aae:	e7ef      	b.n	5a90 <z_impl_zephyr_write_stdout+0xc>
    5ab0:	20000110 	.word	0x20000110

00005ab4 <_exit>:
    5ab4:	b508      	push	{r3, lr}
    5ab6:	4802      	ldr	r0, [pc, #8]	; (5ac0 <_exit+0xc>)
    5ab8:	2105      	movs	r1, #5
    5aba:	f7ff ffe3 	bl	5a84 <z_impl_zephyr_write_stdout>
    5abe:	e7fe      	b.n	5abe <_exit+0xa>
    5ac0:	0000e48f 	.word	0x0000e48f

00005ac4 <_sbrk>:
    5ac4:	b510      	push	{r4, lr}
    5ac6:	4c07      	ldr	r4, [pc, #28]	; (5ae4 <_sbrk+0x20>)
    5ac8:	6823      	ldr	r3, [r4, #0]
    5aca:	18c2      	adds	r2, r0, r3
    5acc:	4806      	ldr	r0, [pc, #24]	; (5ae8 <_sbrk+0x24>)
    5ace:	f1c0 5100 	rsb	r1, r0, #536870912	; 0x20000000
    5ad2:	f501 2180 	add.w	r1, r1, #262144	; 0x40000
    5ad6:	428a      	cmp	r2, r1
    5ad8:	bf3a      	itte	cc
    5ada:	6022      	strcc	r2, [r4, #0]
    5adc:	18c0      	addcc	r0, r0, r3
    5ade:	f04f 30ff 	movcs.w	r0, #4294967295	; 0xffffffff
    5ae2:	bd10      	pop	{r4, pc}
    5ae4:	20001508 	.word	0x20001508
    5ae8:	20004830 	.word	0x20004830

00005aec <__chk_fail>:
    5aec:	b508      	push	{r3, lr}
    5aee:	211d      	movs	r1, #29
    5af0:	4804      	ldr	r0, [pc, #16]	; (5b04 <__chk_fail+0x18>)
    5af2:	f7ff ffc7 	bl	5a84 <z_impl_zephyr_write_stdout>
    5af6:	4040      	eors	r0, r0
    5af8:	f380 8811 	msr	BASEPRI, r0
    5afc:	f04f 0003 	mov.w	r0, #3
    5b00:	df02      	svc	2
    5b02:	bf00      	nop
    5b04:	0000e495 	.word	0x0000e495

00005b08 <nordicsemi_nrf52_init>:
    5b08:	b510      	push	{r4, lr}
    5b0a:	f04f 0320 	mov.w	r3, #32
    5b0e:	f3ef 8011 	mrs	r0, BASEPRI
    5b12:	f383 8812 	msr	BASEPRI_MAX, r3
    5b16:	f3bf 8f6f 	isb	sy
    5b1a:	4a11      	ldr	r2, [pc, #68]	; (5b60 <nordicsemi_nrf52_init+0x58>)
    5b1c:	2301      	movs	r3, #1
    5b1e:	f8c2 3540 	str.w	r3, [r2, #1344]	; 0x540
    5b22:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    5b26:	f04f 5180 	mov.w	r1, #268435456	; 0x10000000
    5b2a:	f8c2 3578 	str.w	r3, [r2, #1400]	; 0x578
    5b2e:	f8d1 4130 	ldr.w	r4, [r1, #304]	; 0x130
    5b32:	2c08      	cmp	r4, #8
    5b34:	d108      	bne.n	5b48 <nordicsemi_nrf52_init+0x40>
    5b36:	f8d1 1134 	ldr.w	r1, [r1, #308]	; 0x134
    5b3a:	2905      	cmp	r1, #5
    5b3c:	d804      	bhi.n	5b48 <nordicsemi_nrf52_init+0x40>
    5b3e:	4c09      	ldr	r4, [pc, #36]	; (5b64 <nordicsemi_nrf52_init+0x5c>)
    5b40:	5c61      	ldrb	r1, [r4, r1]
    5b42:	b109      	cbz	r1, 5b48 <nordicsemi_nrf52_init+0x40>
    5b44:	f8c2 3638 	str.w	r3, [r2, #1592]	; 0x638
    5b48:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    5b4c:	2201      	movs	r2, #1
    5b4e:	f8c3 2580 	str.w	r2, [r3, #1408]	; 0x580
    5b52:	f380 8811 	msr	BASEPRI, r0
    5b56:	f3bf 8f6f 	isb	sy
    5b5a:	2000      	movs	r0, #0
    5b5c:	bd10      	pop	{r4, pc}
    5b5e:	bf00      	nop
    5b60:	4001e000 	.word	0x4001e000
    5b64:	0000e4c2 	.word	0x0000e4c2

00005b68 <sys_arch_reboot>:
    5b68:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    5b6c:	b2c0      	uxtb	r0, r0
    5b6e:	f8c3 051c 	str.w	r0, [r3, #1308]	; 0x51c
    5b72:	f3bf 8f4f 	dsb	sy
    5b76:	4905      	ldr	r1, [pc, #20]	; (5b8c <sys_arch_reboot+0x24>)
    5b78:	4b05      	ldr	r3, [pc, #20]	; (5b90 <sys_arch_reboot+0x28>)
    5b7a:	68ca      	ldr	r2, [r1, #12]
    5b7c:	f402 62e0 	and.w	r2, r2, #1792	; 0x700
    5b80:	4313      	orrs	r3, r2
    5b82:	60cb      	str	r3, [r1, #12]
    5b84:	f3bf 8f4f 	dsb	sy
    5b88:	bf00      	nop
    5b8a:	e7fd      	b.n	5b88 <sys_arch_reboot+0x20>
    5b8c:	e000ed00 	.word	0xe000ed00
    5b90:	05fa0004 	.word	0x05fa0004

00005b94 <arch_busy_wait>:
    5b94:	b120      	cbz	r0, 5ba0 <arch_busy_wait+0xc>
    5b96:	4b03      	ldr	r3, [pc, #12]	; (5ba4 <arch_busy_wait+0x10>)
    5b98:	0180      	lsls	r0, r0, #6
    5b9a:	f043 0301 	orr.w	r3, r3, #1
    5b9e:	4718      	bx	r3
    5ba0:	4770      	bx	lr
    5ba2:	bf00      	nop
    5ba4:	0000ce40 	.word	0x0000ce40

00005ba8 <onoff_stop>:
    5ba8:	4b08      	ldr	r3, [pc, #32]	; (5bcc <onoff_stop+0x24>)
    5baa:	b570      	push	{r4, r5, r6, lr}
    5bac:	1ac3      	subs	r3, r0, r3
    5bae:	460d      	mov	r5, r1
    5bb0:	4907      	ldr	r1, [pc, #28]	; (5bd0 <onoff_stop+0x28>)
    5bb2:	109b      	asrs	r3, r3, #2
    5bb4:	4604      	mov	r4, r0
    5bb6:	4359      	muls	r1, r3
    5bb8:	4806      	ldr	r0, [pc, #24]	; (5bd4 <onoff_stop+0x2c>)
    5bba:	2240      	movs	r2, #64	; 0x40
    5bbc:	f005 fbdd 	bl	b37a <stop>
    5bc0:	462b      	mov	r3, r5
    5bc2:	4601      	mov	r1, r0
    5bc4:	4620      	mov	r0, r4
    5bc6:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    5bca:	4718      	bx	r3
    5bcc:	20001520 	.word	0x20001520
    5bd0:	b6db6db7 	.word	0xb6db6db7
    5bd4:	0000c858 	.word	0x0000c858

00005bd8 <onoff_start>:
    5bd8:	b573      	push	{r0, r1, r4, r5, r6, lr}
    5bda:	4c0c      	ldr	r4, [pc, #48]	; (5c0c <onoff_start+0x34>)
    5bdc:	4a0c      	ldr	r2, [pc, #48]	; (5c10 <onoff_start+0x38>)
    5bde:	2340      	movs	r3, #64	; 0x40
    5be0:	1b04      	subs	r4, r0, r4
    5be2:	9300      	str	r3, [sp, #0]
    5be4:	460d      	mov	r5, r1
    5be6:	460b      	mov	r3, r1
    5be8:	490a      	ldr	r1, [pc, #40]	; (5c14 <onoff_start+0x3c>)
    5bea:	10a4      	asrs	r4, r4, #2
    5bec:	4361      	muls	r1, r4
    5bee:	4606      	mov	r6, r0
    5bf0:	4809      	ldr	r0, [pc, #36]	; (5c18 <onoff_start+0x40>)
    5bf2:	f005 fbef 	bl	b3d4 <async_start>
    5bf6:	1e01      	subs	r1, r0, #0
    5bf8:	da05      	bge.n	5c06 <onoff_start+0x2e>
    5bfa:	4630      	mov	r0, r6
    5bfc:	462b      	mov	r3, r5
    5bfe:	b002      	add	sp, #8
    5c00:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    5c04:	4718      	bx	r3
    5c06:	b002      	add	sp, #8
    5c08:	bd70      	pop	{r4, r5, r6, pc}
    5c0a:	bf00      	nop
    5c0c:	20001520 	.word	0x20001520
    5c10:	0000b441 	.word	0x0000b441
    5c14:	b6db6db7 	.word	0xb6db6db7
    5c18:	0000c858 	.word	0x0000c858

00005c1c <hfclk_start>:
    5c1c:	b510      	push	{r4, lr}
    5c1e:	f006 f8d6 	bl	bdce <z_impl_k_uptime_ticks>
    5c22:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    5c26:	fba0 0302 	umull	r0, r3, r0, r2
    5c2a:	4c07      	ldr	r4, [pc, #28]	; (5c48 <hfclk_start+0x2c>)
    5c2c:	fb02 3101 	mla	r1, r2, r1, r3
    5c30:	0bc0      	lsrs	r0, r0, #15
    5c32:	ea40 4041 	orr.w	r0, r0, r1, lsl #17
    5c36:	0bc9      	lsrs	r1, r1, #15
    5c38:	e9c4 0100 	strd	r0, r1, [r4]
    5c3c:	2001      	movs	r0, #1
    5c3e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    5c42:	f005 be40 	b.w	b8c6 <nrfx_clock_start>
    5c46:	bf00      	nop
    5c48:	20000520 	.word	0x20000520

00005c4c <clk_init>:
    5c4c:	2200      	movs	r2, #0
    5c4e:	b570      	push	{r4, r5, r6, lr}
    5c50:	2101      	movs	r1, #1
    5c52:	4604      	mov	r4, r0
    5c54:	4610      	mov	r0, r2
    5c56:	f7ff fb85 	bl	5364 <z_arm_irq_priority_set>
    5c5a:	480f      	ldr	r0, [pc, #60]	; (5c98 <clk_init+0x4c>)
    5c5c:	f001 f906 	bl	6e6c <nrfx_clock_init>
    5c60:	4b0e      	ldr	r3, [pc, #56]	; (5c9c <clk_init+0x50>)
    5c62:	4298      	cmp	r0, r3
    5c64:	d115      	bne.n	5c92 <clk_init+0x46>
    5c66:	f005 fe21 	bl	b8ac <nrfx_clock_enable>
    5c6a:	6926      	ldr	r6, [r4, #16]
    5c6c:	490c      	ldr	r1, [pc, #48]	; (5ca0 <clk_init+0x54>)
    5c6e:	4630      	mov	r0, r6
    5c70:	f004 fa56 	bl	a120 <onoff_manager_init>
    5c74:	2800      	cmp	r0, #0
    5c76:	db0b      	blt.n	5c90 <clk_init+0x44>
    5c78:	2501      	movs	r5, #1
    5c7a:	6435      	str	r5, [r6, #64]	; 0x40
    5c7c:	6924      	ldr	r4, [r4, #16]
    5c7e:	4908      	ldr	r1, [pc, #32]	; (5ca0 <clk_init+0x54>)
    5c80:	f104 001c 	add.w	r0, r4, #28
    5c84:	f004 fa4c 	bl	a120 <onoff_manager_init>
    5c88:	2800      	cmp	r0, #0
    5c8a:	db01      	blt.n	5c90 <clk_init+0x44>
    5c8c:	64e5      	str	r5, [r4, #76]	; 0x4c
    5c8e:	2000      	movs	r0, #0
    5c90:	bd70      	pop	{r4, r5, r6, pc}
    5c92:	f06f 0004 	mvn.w	r0, #4
    5c96:	e7fb      	b.n	5c90 <clk_init+0x44>
    5c98:	00005cd9 	.word	0x00005cd9
    5c9c:	0bad0000 	.word	0x0bad0000
    5ca0:	0000d2dc 	.word	0x0000d2dc

00005ca4 <clkstarted_handle.constprop.0>:
    5ca4:	b570      	push	{r4, r5, r6, lr}
    5ca6:	4601      	mov	r1, r0
    5ca8:	230c      	movs	r3, #12
    5caa:	4809      	ldr	r0, [pc, #36]	; (5cd0 <clkstarted_handle.constprop.0+0x2c>)
    5cac:	434b      	muls	r3, r1
    5cae:	18c4      	adds	r4, r0, r3
    5cb0:	e9d4 560e 	ldrd	r5, r6, [r4, #56]	; 0x38
    5cb4:	2200      	movs	r2, #0
    5cb6:	3340      	adds	r3, #64	; 0x40
    5cb8:	63a2      	str	r2, [r4, #56]	; 0x38
    5cba:	4418      	add	r0, r3
    5cbc:	f005 fb4a 	bl	b354 <set_on_state>
    5cc0:	b12d      	cbz	r5, 5cce <clkstarted_handle.constprop.0+0x2a>
    5cc2:	4632      	mov	r2, r6
    5cc4:	462b      	mov	r3, r5
    5cc6:	4803      	ldr	r0, [pc, #12]	; (5cd4 <clkstarted_handle.constprop.0+0x30>)
    5cc8:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    5ccc:	4718      	bx	r3
    5cce:	bd70      	pop	{r4, r5, r6, pc}
    5cd0:	20001520 	.word	0x20001520
    5cd4:	0000c858 	.word	0x0000c858

00005cd8 <clock_event_handler>:
    5cd8:	b110      	cbz	r0, 5ce0 <clock_event_handler+0x8>
    5cda:	2801      	cmp	r0, #1
    5cdc:	d004      	beq.n	5ce8 <clock_event_handler+0x10>
    5cde:	4770      	bx	lr
    5ce0:	4b03      	ldr	r3, [pc, #12]	; (5cf0 <clock_event_handler+0x18>)
    5ce2:	6c1b      	ldr	r3, [r3, #64]	; 0x40
    5ce4:	075b      	lsls	r3, r3, #29
    5ce6:	d101      	bne.n	5cec <clock_event_handler+0x14>
    5ce8:	f7ff bfdc 	b.w	5ca4 <clkstarted_handle.constprop.0>
    5cec:	4770      	bx	lr
    5cee:	bf00      	nop
    5cf0:	20001520 	.word	0x20001520

00005cf4 <generic_hfclk_start>:
    5cf4:	b508      	push	{r3, lr}
    5cf6:	f04f 0320 	mov.w	r3, #32
    5cfa:	f3ef 8111 	mrs	r1, BASEPRI
    5cfe:	f383 8812 	msr	BASEPRI_MAX, r3
    5d02:	f3bf 8f6f 	isb	sy
    5d06:	4a11      	ldr	r2, [pc, #68]	; (5d4c <generic_hfclk_start+0x58>)
    5d08:	6813      	ldr	r3, [r2, #0]
    5d0a:	f043 0002 	orr.w	r0, r3, #2
    5d0e:	6010      	str	r0, [r2, #0]
    5d10:	07da      	lsls	r2, r3, #31
    5d12:	d407      	bmi.n	5d24 <generic_hfclk_start+0x30>
    5d14:	f381 8811 	msr	BASEPRI, r1
    5d18:	f3bf 8f6f 	isb	sy
    5d1c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    5d20:	f7ff bf7c 	b.w	5c1c <hfclk_start>
    5d24:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    5d28:	f8d3 240c 	ldr.w	r2, [r3, #1036]	; 0x40c
    5d2c:	f8d3 340c 	ldr.w	r3, [r3, #1036]	; 0x40c
    5d30:	07d3      	lsls	r3, r2, #31
    5d32:	d5ef      	bpl.n	5d14 <generic_hfclk_start+0x20>
    5d34:	4806      	ldr	r0, [pc, #24]	; (5d50 <generic_hfclk_start+0x5c>)
    5d36:	f005 fb0d 	bl	b354 <set_on_state>
    5d3a:	f381 8811 	msr	BASEPRI, r1
    5d3e:	f3bf 8f6f 	isb	sy
    5d42:	2000      	movs	r0, #0
    5d44:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    5d48:	f7ff bfac 	b.w	5ca4 <clkstarted_handle.constprop.0>
    5d4c:	20001570 	.word	0x20001570
    5d50:	20001560 	.word	0x20001560

00005d54 <api_blocking_start>:
    5d54:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
    5d56:	2200      	movs	r2, #0
    5d58:	2301      	movs	r3, #1
    5d5a:	e9cd 2302 	strd	r2, r3, [sp, #8]
    5d5e:	ab04      	add	r3, sp, #16
    5d60:	e9cd 3304 	strd	r3, r3, [sp, #16]
    5d64:	4a09      	ldr	r2, [pc, #36]	; (5d8c <api_blocking_start+0x38>)
    5d66:	f8cd d000 	str.w	sp, [sp]
    5d6a:	466b      	mov	r3, sp
    5d6c:	f8cd d004 	str.w	sp, [sp, #4]
    5d70:	f005 fb5f 	bl	b432 <api_start>
    5d74:	2800      	cmp	r0, #0
    5d76:	db05      	blt.n	5d84 <api_blocking_start+0x30>
    5d78:	f44f 4280 	mov.w	r2, #16384	; 0x4000
    5d7c:	2300      	movs	r3, #0
    5d7e:	4668      	mov	r0, sp
    5d80:	f002 f854 	bl	7e2c <z_impl_k_sem_take>
    5d84:	b007      	add	sp, #28
    5d86:	f85d fb04 	ldr.w	pc, [sp], #4
    5d8a:	bf00      	nop
    5d8c:	0000b45f 	.word	0x0000b45f

00005d90 <cmd_status>:
    5d90:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    5d94:	f04f 4880 	mov.w	r8, #1073741824	; 0x40000000
    5d98:	4605      	mov	r5, r0
    5d9a:	f8d8 6418 	ldr.w	r6, [r8, #1048]	; 0x418
    5d9e:	f406 3680 	and.w	r6, r6, #65536	; 0x10000
    5da2:	f04f 0320 	mov.w	r3, #32
    5da6:	f3ef 8711 	mrs	r7, BASEPRI
    5daa:	f383 8812 	msr	BASEPRI_MAX, r3
    5dae:	f3bf 8f6f 	isb	sy
    5db2:	f006 f80c 	bl	bdce <z_impl_k_uptime_ticks>
    5db6:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    5dba:	fba0 4302 	umull	r4, r3, r0, r2
    5dbe:	fb02 3301 	mla	r3, r2, r1, r3
    5dc2:	0be4      	lsrs	r4, r4, #15
    5dc4:	f8d8 940c 	ldr.w	r9, [r8, #1036]	; 0x40c
    5dc8:	ea44 4443 	orr.w	r4, r4, r3, lsl #17
    5dcc:	f8d8 340c 	ldr.w	r3, [r8, #1036]	; 0x40c
    5dd0:	4b23      	ldr	r3, [pc, #140]	; (5e60 <cmd_status+0xd0>)
    5dd2:	f8d3 b000 	ldr.w	fp, [r3]
    5dd6:	4b23      	ldr	r3, [pc, #140]	; (5e64 <cmd_status+0xd4>)
    5dd8:	f8d3 a000 	ldr.w	sl, [r3]
    5ddc:	f387 8811 	msr	BASEPRI, r7
    5de0:	f3bf 8f6f 	isb	sy
    5de4:	4a20      	ldr	r2, [pc, #128]	; (5e68 <cmd_status+0xd8>)
    5de6:	f8df 8084 	ldr.w	r8, [pc, #132]	; 5e6c <cmd_status+0xdc>
    5dea:	4f21      	ldr	r7, [pc, #132]	; (5e70 <cmd_status+0xe0>)
    5dec:	4628      	mov	r0, r5
    5dee:	2108      	movs	r1, #8
    5df0:	f004 fdfe 	bl	a9f0 <shell_fprintf>
    5df4:	f019 0f01 	tst.w	r9, #1
    5df8:	f8df 9078 	ldr.w	r9, [pc, #120]	; 5e74 <cmd_status+0xe4>
    5dfc:	4a1e      	ldr	r2, [pc, #120]	; (5e78 <cmd_status+0xe8>)
    5dfe:	f8b9 301a 	ldrh.w	r3, [r9, #26]
    5e02:	9300      	str	r3, [sp, #0]
    5e04:	4628      	mov	r0, r5
    5e06:	bf0c      	ite	eq
    5e08:	4643      	moveq	r3, r8
    5e0a:	463b      	movne	r3, r7
    5e0c:	2108      	movs	r1, #8
    5e0e:	f004 fdef 	bl	a9f0 <shell_fprintf>
    5e12:	eba4 030b 	sub.w	r3, r4, fp
    5e16:	9300      	str	r3, [sp, #0]
    5e18:	4628      	mov	r0, r5
    5e1a:	465b      	mov	r3, fp
    5e1c:	4a17      	ldr	r2, [pc, #92]	; (5e7c <cmd_status+0xec>)
    5e1e:	2108      	movs	r1, #8
    5e20:	eba4 040a 	sub.w	r4, r4, sl
    5e24:	f004 fde4 	bl	a9f0 <shell_fprintf>
    5e28:	4653      	mov	r3, sl
    5e2a:	4628      	mov	r0, r5
    5e2c:	4a14      	ldr	r2, [pc, #80]	; (5e80 <cmd_status+0xf0>)
    5e2e:	9400      	str	r4, [sp, #0]
    5e30:	2108      	movs	r1, #8
    5e32:	f004 fddd 	bl	a9f0 <shell_fprintf>
    5e36:	4628      	mov	r0, r5
    5e38:	4a12      	ldr	r2, [pc, #72]	; (5e84 <cmd_status+0xf4>)
    5e3a:	2108      	movs	r1, #8
    5e3c:	f004 fdd8 	bl	a9f0 <shell_fprintf>
    5e40:	f8b9 3036 	ldrh.w	r3, [r9, #54]	; 0x36
    5e44:	9300      	str	r3, [sp, #0]
    5e46:	4628      	mov	r0, r5
    5e48:	4a0b      	ldr	r2, [pc, #44]	; (5e78 <cmd_status+0xe8>)
    5e4a:	2e00      	cmp	r6, #0
    5e4c:	bf0c      	ite	eq
    5e4e:	4643      	moveq	r3, r8
    5e50:	463b      	movne	r3, r7
    5e52:	2108      	movs	r1, #8
    5e54:	f004 fdcc 	bl	a9f0 <shell_fprintf>
    5e58:	2000      	movs	r0, #0
    5e5a:	b003      	add	sp, #12
    5e5c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    5e60:	20000520 	.word	0x20000520
    5e64:	20000518 	.word	0x20000518
    5e68:	0000e4d1 	.word	0x0000e4d1
    5e6c:	0000e4cc 	.word	0x0000e4cc
    5e70:	0000d6db 	.word	0x0000d6db
    5e74:	20001520 	.word	0x20001520
    5e78:	0000e4dc 	.word	0x0000e4dc
    5e7c:	0000e4f6 	.word	0x0000e4f6
    5e80:	0000e518 	.word	0x0000e518
    5e84:	0000e539 	.word	0x0000e539

00005e88 <hfclk_stop>:
    5e88:	b510      	push	{r4, lr}
    5e8a:	f005 ffa0 	bl	bdce <z_impl_k_uptime_ticks>
    5e8e:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    5e92:	fba0 0302 	umull	r0, r3, r0, r2
    5e96:	4c07      	ldr	r4, [pc, #28]	; (5eb4 <hfclk_stop+0x2c>)
    5e98:	fb02 3101 	mla	r1, r2, r1, r3
    5e9c:	0bc0      	lsrs	r0, r0, #15
    5e9e:	ea40 4041 	orr.w	r0, r0, r1, lsl #17
    5ea2:	0bc9      	lsrs	r1, r1, #15
    5ea4:	e9c4 0100 	strd	r0, r1, [r4]
    5ea8:	2001      	movs	r0, #1
    5eaa:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    5eae:	f005 bd46 	b.w	b93e <nrfx_clock_stop>
    5eb2:	bf00      	nop
    5eb4:	20000518 	.word	0x20000518

00005eb8 <generic_hfclk_stop>:
    5eb8:	b510      	push	{r4, lr}
    5eba:	f04f 0320 	mov.w	r3, #32
    5ebe:	f3ef 8411 	mrs	r4, BASEPRI
    5ec2:	f383 8812 	msr	BASEPRI_MAX, r3
    5ec6:	f3bf 8f6f 	isb	sy
    5eca:	4a07      	ldr	r2, [pc, #28]	; (5ee8 <generic_hfclk_stop+0x30>)
    5ecc:	6813      	ldr	r3, [r2, #0]
    5ece:	f023 0102 	bic.w	r1, r3, #2
    5ed2:	07db      	lsls	r3, r3, #31
    5ed4:	6011      	str	r1, [r2, #0]
    5ed6:	d401      	bmi.n	5edc <generic_hfclk_stop+0x24>
    5ed8:	f7ff ffd6 	bl	5e88 <hfclk_stop>
    5edc:	f384 8811 	msr	BASEPRI, r4
    5ee0:	f3bf 8f6f 	isb	sy
    5ee4:	bd10      	pop	{r4, pc}
    5ee6:	bf00      	nop
    5ee8:	20001570 	.word	0x20001570

00005eec <z_nrf_clock_control_lf_on>:
    5eec:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    5ef0:	4938      	ldr	r1, [pc, #224]	; (5fd4 <z_nrf_clock_control_lf_on+0xe8>)
    5ef2:	f3bf 8f5b 	dmb	ish
    5ef6:	4607      	mov	r7, r0
    5ef8:	2201      	movs	r2, #1
    5efa:	e851 3f00 	ldrex	r3, [r1]
    5efe:	e841 2000 	strex	r0, r2, [r1]
    5f02:	2800      	cmp	r0, #0
    5f04:	d1f9      	bne.n	5efa <z_nrf_clock_control_lf_on+0xe>
    5f06:	f3bf 8f5b 	dmb	ish
    5f0a:	b933      	cbnz	r3, 5f1a <z_nrf_clock_control_lf_on+0x2e>
    5f0c:	4932      	ldr	r1, [pc, #200]	; (5fd8 <z_nrf_clock_control_lf_on+0xec>)
    5f0e:	4833      	ldr	r0, [pc, #204]	; (5fdc <z_nrf_clock_control_lf_on+0xf0>)
    5f10:	604b      	str	r3, [r1, #4]
    5f12:	60cb      	str	r3, [r1, #12]
    5f14:	608a      	str	r2, [r1, #8]
    5f16:	f004 f916 	bl	a146 <onoff_request>
    5f1a:	1e7b      	subs	r3, r7, #1
    5f1c:	2b01      	cmp	r3, #1
    5f1e:	d82b      	bhi.n	5f78 <z_nrf_clock_control_lf_on+0x8c>
    5f20:	2f01      	cmp	r7, #1
    5f22:	d107      	bne.n	5f34 <z_nrf_clock_control_lf_on+0x48>
    5f24:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    5f28:	f8d3 341c 	ldr.w	r3, [r3, #1052]	; 0x41c
    5f2c:	f003 0303 	and.w	r3, r3, #3
    5f30:	2b01      	cmp	r3, #1
    5f32:	d021      	beq.n	5f78 <z_nrf_clock_control_lf_on+0x8c>
    5f34:	f005 fdf5 	bl	bb22 <k_is_in_isr>
    5f38:	4605      	mov	r5, r0
    5f3a:	b9f8      	cbnz	r0, 5f7c <z_nrf_clock_control_lf_on+0x90>
    5f3c:	4b28      	ldr	r3, [pc, #160]	; (5fe0 <z_nrf_clock_control_lf_on+0xf4>)
    5f3e:	781b      	ldrb	r3, [r3, #0]
    5f40:	b1e3      	cbz	r3, 5f7c <z_nrf_clock_control_lf_on+0x90>
    5f42:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    5f46:	2202      	movs	r2, #2
    5f48:	f8c3 2308 	str.w	r2, [r3, #776]	; 0x308
    5f4c:	4606      	mov	r6, r0
    5f4e:	f8df 8094 	ldr.w	r8, [pc, #148]	; 5fe4 <z_nrf_clock_control_lf_on+0xf8>
    5f52:	f04f 4480 	mov.w	r4, #1073741824	; 0x40000000
    5f56:	f8d4 3418 	ldr.w	r3, [r4, #1048]	; 0x418
    5f5a:	f8d4 2418 	ldr.w	r2, [r4, #1048]	; 0x418
    5f5e:	03d2      	lsls	r2, r2, #15
    5f60:	d516      	bpl.n	5f90 <z_nrf_clock_control_lf_on+0xa4>
    5f62:	f003 0303 	and.w	r3, r3, #3
    5f66:	2b01      	cmp	r3, #1
    5f68:	d001      	beq.n	5f6e <z_nrf_clock_control_lf_on+0x82>
    5f6a:	2f01      	cmp	r7, #1
    5f6c:	d110      	bne.n	5f90 <z_nrf_clock_control_lf_on+0xa4>
    5f6e:	b35d      	cbz	r5, 5fc8 <z_nrf_clock_control_lf_on+0xdc>
    5f70:	f386 8811 	msr	BASEPRI, r6
    5f74:	f3bf 8f6f 	isb	sy
    5f78:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    5f7c:	f04f 0320 	mov.w	r3, #32
    5f80:	f3ef 8611 	mrs	r6, BASEPRI
    5f84:	f383 8812 	msr	BASEPRI_MAX, r3
    5f88:	f3bf 8f6f 	isb	sy
    5f8c:	2501      	movs	r5, #1
    5f8e:	e7de      	b.n	5f4e <z_nrf_clock_control_lf_on+0x62>
    5f90:	b1ad      	cbz	r5, 5fbe <z_nrf_clock_control_lf_on+0xd2>
    5f92:	4630      	mov	r0, r6
    5f94:	f7ff f9be 	bl	5314 <arch_cpu_atomic_idle>
    5f98:	f8d4 3518 	ldr.w	r3, [r4, #1304]	; 0x518
    5f9c:	2b00      	cmp	r3, #0
    5f9e:	d1da      	bne.n	5f56 <z_nrf_clock_control_lf_on+0x6a>
    5fa0:	f8d4 2104 	ldr.w	r2, [r4, #260]	; 0x104
    5fa4:	2a00      	cmp	r2, #0
    5fa6:	d0d6      	beq.n	5f56 <z_nrf_clock_control_lf_on+0x6a>
    5fa8:	f8c4 3104 	str.w	r3, [r4, #260]	; 0x104
    5fac:	f8d4 3104 	ldr.w	r3, [r4, #260]	; 0x104
    5fb0:	2301      	movs	r3, #1
    5fb2:	f8c4 3518 	str.w	r3, [r4, #1304]	; 0x518
    5fb6:	f8c8 3180 	str.w	r3, [r8, #384]	; 0x180
    5fba:	60a3      	str	r3, [r4, #8]
    5fbc:	e7cb      	b.n	5f56 <z_nrf_clock_control_lf_on+0x6a>
    5fbe:	2100      	movs	r1, #0
    5fc0:	2021      	movs	r0, #33	; 0x21
    5fc2:	f002 fa23 	bl	840c <z_impl_k_sleep>
    5fc6:	e7e7      	b.n	5f98 <z_nrf_clock_control_lf_on+0xac>
    5fc8:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    5fcc:	2202      	movs	r2, #2
    5fce:	f8c3 2304 	str.w	r2, [r3, #772]	; 0x304
    5fd2:	e7d1      	b.n	5f78 <z_nrf_clock_control_lf_on+0x8c>
    5fd4:	2000151c 	.word	0x2000151c
    5fd8:	2000150c 	.word	0x2000150c
    5fdc:	2000153c 	.word	0x2000153c
    5fe0:	20001d07 	.word	0x20001d07
    5fe4:	e000e100 	.word	0xe000e100

00005fe8 <uart_console_init>:
    5fe8:	b508      	push	{r3, lr}
    5fea:	4807      	ldr	r0, [pc, #28]	; (6008 <uart_console_init+0x20>)
    5fec:	f005 fd09 	bl	ba02 <z_device_is_ready>
    5ff0:	b138      	cbz	r0, 6002 <uart_console_init+0x1a>
    5ff2:	4806      	ldr	r0, [pc, #24]	; (600c <uart_console_init+0x24>)
    5ff4:	f7ff fd2c 	bl	5a50 <__stdout_hook_install>
    5ff8:	4804      	ldr	r0, [pc, #16]	; (600c <uart_console_init+0x24>)
    5ffa:	f7fb ffd3 	bl	1fa4 <__printk_hook_install>
    5ffe:	2000      	movs	r0, #0
    6000:	bd08      	pop	{r3, pc}
    6002:	f06f 0012 	mvn.w	r0, #18
    6006:	e7fb      	b.n	6000 <uart_console_init+0x18>
    6008:	0000c8b8 	.word	0x0000c8b8
    600c:	00006011 	.word	0x00006011

00006010 <console_out>:
    6010:	280a      	cmp	r0, #10
    6012:	b538      	push	{r3, r4, r5, lr}
    6014:	4d07      	ldr	r5, [pc, #28]	; (6034 <console_out+0x24>)
    6016:	4604      	mov	r4, r0
    6018:	d104      	bne.n	6024 <console_out+0x14>
    601a:	68ab      	ldr	r3, [r5, #8]
    601c:	210d      	movs	r1, #13
    601e:	685b      	ldr	r3, [r3, #4]
    6020:	4628      	mov	r0, r5
    6022:	4798      	blx	r3
    6024:	68ab      	ldr	r3, [r5, #8]
    6026:	4803      	ldr	r0, [pc, #12]	; (6034 <console_out+0x24>)
    6028:	685b      	ldr	r3, [r3, #4]
    602a:	b2e1      	uxtb	r1, r4
    602c:	4798      	blx	r3
    602e:	4620      	mov	r0, r4
    6030:	bd38      	pop	{r3, r4, r5, pc}
    6032:	bf00      	nop
    6034:	0000c8b8 	.word	0x0000c8b8

00006038 <gpio_nrfx_pin_interrupt_configure>:
    6038:	b530      	push	{r4, r5, lr}
    603a:	6840      	ldr	r0, [r0, #4]
    603c:	7b05      	ldrb	r5, [r0, #12]
    603e:	f001 041f 	and.w	r4, r1, #31
    6042:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
    6046:	b085      	sub	sp, #20
    6048:	ea44 1445 	orr.w	r4, r4, r5, lsl #5
    604c:	d105      	bne.n	605a <gpio_nrfx_pin_interrupt_configure+0x22>
    604e:	4620      	mov	r0, r4
    6050:	f001 f98e 	bl	7370 <nrfx_gpiote_trigger_disable>
    6054:	2000      	movs	r0, #0
    6056:	b005      	add	sp, #20
    6058:	bd30      	pop	{r4, r5, pc}
    605a:	2500      	movs	r5, #0
    605c:	f5b2 0f80 	cmp.w	r2, #4194304	; 0x400000
    6060:	e9cd 5502 	strd	r5, r5, [sp, #8]
    6064:	d114      	bne.n	6090 <gpio_nrfx_pin_interrupt_configure+0x58>
    6066:	f1b3 7f00 	cmp.w	r3, #33554432	; 0x2000000
    606a:	bf0c      	ite	eq
    606c:	2304      	moveq	r3, #4
    606e:	2305      	movne	r3, #5
    6070:	f88d 3008 	strb.w	r3, [sp, #8]
    6074:	2300      	movs	r3, #0
    6076:	4619      	mov	r1, r3
    6078:	aa02      	add	r2, sp, #8
    607a:	4620      	mov	r0, r4
    607c:	f000 ffb6 	bl	6fec <nrfx_gpiote_input_configure>
    6080:	4b1f      	ldr	r3, [pc, #124]	; (6100 <gpio_nrfx_pin_interrupt_configure+0xc8>)
    6082:	4298      	cmp	r0, r3
    6084:	d139      	bne.n	60fa <gpio_nrfx_pin_interrupt_configure+0xc2>
    6086:	2101      	movs	r1, #1
    6088:	4620      	mov	r0, r4
    608a:	f001 f929 	bl	72e0 <nrfx_gpiote_trigger_enable>
    608e:	e7e1      	b.n	6054 <gpio_nrfx_pin_interrupt_configure+0x1c>
    6090:	f1b3 6fc0 	cmp.w	r3, #100663296	; 0x6000000
    6094:	d026      	beq.n	60e4 <gpio_nrfx_pin_interrupt_configure+0xac>
    6096:	f1b3 7f00 	cmp.w	r3, #33554432	; 0x2000000
    609a:	bf14      	ite	ne
    609c:	2301      	movne	r3, #1
    609e:	2302      	moveq	r3, #2
    60a0:	f88d 3008 	strb.w	r3, [sp, #8]
    60a4:	6883      	ldr	r3, [r0, #8]
    60a6:	40cb      	lsrs	r3, r1
    60a8:	07d9      	lsls	r1, r3, #31
    60aa:	d4e3      	bmi.n	6074 <gpio_nrfx_pin_interrupt_configure+0x3c>
    60ac:	f1b2 7fa0 	cmp.w	r2, #20971520	; 0x1400000
    60b0:	d1e0      	bne.n	6074 <gpio_nrfx_pin_interrupt_configure+0x3c>
    60b2:	0962      	lsrs	r2, r4, #5
    60b4:	2a01      	cmp	r2, #1
    60b6:	f004 031f 	and.w	r3, r4, #31
    60ba:	4a12      	ldr	r2, [pc, #72]	; (6104 <gpio_nrfx_pin_interrupt_configure+0xcc>)
    60bc:	f503 73e0 	add.w	r3, r3, #448	; 0x1c0
    60c0:	bf18      	it	ne
    60c2:	f04f 42a0 	movne.w	r2, #1342177280	; 0x50000000
    60c6:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
    60ca:	07db      	lsls	r3, r3, #31
    60cc:	d4d2      	bmi.n	6074 <gpio_nrfx_pin_interrupt_configure+0x3c>
    60ce:	f10d 0507 	add.w	r5, sp, #7
    60d2:	4629      	mov	r1, r5
    60d4:	4620      	mov	r0, r4
    60d6:	f001 f8af 	bl	7238 <nrfx_gpiote_channel_get>
    60da:	4b0b      	ldr	r3, [pc, #44]	; (6108 <gpio_nrfx_pin_interrupt_configure+0xd0>)
    60dc:	4298      	cmp	r0, r3
    60de:	d003      	beq.n	60e8 <gpio_nrfx_pin_interrupt_configure+0xb0>
    60e0:	9503      	str	r5, [sp, #12]
    60e2:	e7c7      	b.n	6074 <gpio_nrfx_pin_interrupt_configure+0x3c>
    60e4:	2303      	movs	r3, #3
    60e6:	e7db      	b.n	60a0 <gpio_nrfx_pin_interrupt_configure+0x68>
    60e8:	4628      	mov	r0, r5
    60ea:	f001 f8f3 	bl	72d4 <nrfx_gpiote_channel_alloc>
    60ee:	4b04      	ldr	r3, [pc, #16]	; (6100 <gpio_nrfx_pin_interrupt_configure+0xc8>)
    60f0:	4298      	cmp	r0, r3
    60f2:	d0f5      	beq.n	60e0 <gpio_nrfx_pin_interrupt_configure+0xa8>
    60f4:	f06f 000b 	mvn.w	r0, #11
    60f8:	e7ad      	b.n	6056 <gpio_nrfx_pin_interrupt_configure+0x1e>
    60fa:	f06f 0015 	mvn.w	r0, #21
    60fe:	e7aa      	b.n	6056 <gpio_nrfx_pin_interrupt_configure+0x1e>
    6100:	0bad0000 	.word	0x0bad0000
    6104:	50000300 	.word	0x50000300
    6108:	0bad0004 	.word	0x0bad0004

0000610c <gpio_nrfx_init>:
    610c:	b510      	push	{r4, lr}
    610e:	f001 f8d1 	bl	72b4 <nrfx_gpiote_is_init>
    6112:	4604      	mov	r4, r0
    6114:	b968      	cbnz	r0, 6132 <gpio_nrfx_init+0x26>
    6116:	f001 f8a5 	bl	7264 <nrfx_gpiote_init>
    611a:	4b08      	ldr	r3, [pc, #32]	; (613c <gpio_nrfx_init+0x30>)
    611c:	4298      	cmp	r0, r3
    611e:	d10a      	bne.n	6136 <gpio_nrfx_init+0x2a>
    6120:	4807      	ldr	r0, [pc, #28]	; (6140 <gpio_nrfx_init+0x34>)
    6122:	4621      	mov	r1, r4
    6124:	f001 f882 	bl	722c <nrfx_gpiote_global_callback_set>
    6128:	4622      	mov	r2, r4
    612a:	2105      	movs	r1, #5
    612c:	2006      	movs	r0, #6
    612e:	f7ff f919 	bl	5364 <z_arm_irq_priority_set>
    6132:	2000      	movs	r0, #0
    6134:	bd10      	pop	{r4, pc}
    6136:	f06f 0004 	mvn.w	r0, #4
    613a:	e7fb      	b.n	6134 <gpio_nrfx_init+0x28>
    613c:	0bad0000 	.word	0x0bad0000
    6140:	00006145 	.word	0x00006145

00006144 <nrfx_gpio_handler>:
    6144:	0942      	lsrs	r2, r0, #5
    6146:	b570      	push	{r4, r5, r6, lr}
    6148:	4603      	mov	r3, r0
    614a:	d002      	beq.n	6152 <nrfx_gpio_handler+0xe>
    614c:	2a01      	cmp	r2, #1
    614e:	d017      	beq.n	6180 <nrfx_gpio_handler+0x3c>
    6150:	bd70      	pop	{r4, r5, r6, pc}
    6152:	4e0d      	ldr	r6, [pc, #52]	; (6188 <nrfx_gpio_handler+0x44>)
    6154:	6932      	ldr	r2, [r6, #16]
    6156:	6851      	ldr	r1, [r2, #4]
    6158:	2900      	cmp	r1, #0
    615a:	d0f9      	beq.n	6150 <nrfx_gpio_handler+0xc>
    615c:	f003 031f 	and.w	r3, r3, #31
    6160:	2501      	movs	r5, #1
    6162:	680c      	ldr	r4, [r1, #0]
    6164:	409d      	lsls	r5, r3
    6166:	2900      	cmp	r1, #0
    6168:	d0f2      	beq.n	6150 <nrfx_gpio_handler+0xc>
    616a:	688a      	ldr	r2, [r1, #8]
    616c:	402a      	ands	r2, r5
    616e:	d002      	beq.n	6176 <nrfx_gpio_handler+0x32>
    6170:	684b      	ldr	r3, [r1, #4]
    6172:	4630      	mov	r0, r6
    6174:	4798      	blx	r3
    6176:	b12c      	cbz	r4, 6184 <nrfx_gpio_handler+0x40>
    6178:	6823      	ldr	r3, [r4, #0]
    617a:	4621      	mov	r1, r4
    617c:	461c      	mov	r4, r3
    617e:	e7f2      	b.n	6166 <nrfx_gpio_handler+0x22>
    6180:	4e02      	ldr	r6, [pc, #8]	; (618c <nrfx_gpio_handler+0x48>)
    6182:	e7e7      	b.n	6154 <nrfx_gpio_handler+0x10>
    6184:	4623      	mov	r3, r4
    6186:	e7f8      	b.n	617a <nrfx_gpio_handler+0x36>
    6188:	0000c888 	.word	0x0000c888
    618c:	0000c870 	.word	0x0000c870

00006190 <gpio_nrfx_pin_configure>:
    6190:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
    6194:	6847      	ldr	r7, [r0, #4]
    6196:	7b3b      	ldrb	r3, [r7, #12]
    6198:	f001 051f 	and.w	r5, r1, #31
    619c:	ea45 1543 	orr.w	r5, r5, r3, lsl #5
    61a0:	460e      	mov	r6, r1
    61a2:	4628      	mov	r0, r5
    61a4:	f10d 0103 	add.w	r1, sp, #3
    61a8:	4614      	mov	r4, r2
    61aa:	f001 f845 	bl	7238 <nrfx_gpiote_channel_get>
    61ae:	f414 3f40 	tst.w	r4, #196608	; 0x30000
    61b2:	4680      	mov	r8, r0
    61b4:	d10b      	bne.n	61ce <gpio_nrfx_pin_configure+0x3e>
    61b6:	4628      	mov	r0, r5
    61b8:	f001 f902 	bl	73c0 <nrfx_gpiote_pin_uninit>
    61bc:	4b3d      	ldr	r3, [pc, #244]	; (62b4 <gpio_nrfx_pin_configure+0x124>)
    61be:	4598      	cmp	r8, r3
    61c0:	d103      	bne.n	61ca <gpio_nrfx_pin_configure+0x3a>
    61c2:	f89d 0003 	ldrb.w	r0, [sp, #3]
    61c6:	f001 f87f 	bl	72c8 <nrfx_gpiote_channel_free>
    61ca:	2000      	movs	r0, #0
    61cc:	e00c      	b.n	61e8 <gpio_nrfx_pin_configure+0x58>
    61ce:	2300      	movs	r3, #0
    61d0:	4619      	mov	r1, r3
    61d2:	aa02      	add	r2, sp, #8
    61d4:	4628      	mov	r0, r5
    61d6:	e9cd 3302 	strd	r3, r3, [sp, #8]
    61da:	f000 ff07 	bl	6fec <nrfx_gpiote_input_configure>
    61de:	4b35      	ldr	r3, [pc, #212]	; (62b4 <gpio_nrfx_pin_configure+0x124>)
    61e0:	4298      	cmp	r0, r3
    61e2:	d004      	beq.n	61ee <gpio_nrfx_pin_configure+0x5e>
    61e4:	f06f 0015 	mvn.w	r0, #21
    61e8:	b004      	add	sp, #16
    61ea:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    61ee:	4580      	cmp	r8, r0
    61f0:	d103      	bne.n	61fa <gpio_nrfx_pin_configure+0x6a>
    61f2:	f89d 0003 	ldrb.w	r0, [sp, #3]
    61f6:	f001 f867 	bl	72c8 <nrfx_gpiote_channel_free>
    61fa:	03a3      	lsls	r3, r4, #14
    61fc:	d54b      	bpl.n	6296 <gpio_nrfx_pin_configure+0x106>
    61fe:	f240 3306 	movw	r3, #774	; 0x306
    6202:	4023      	ands	r3, r4
    6204:	f5b3 7f83 	cmp.w	r3, #262	; 0x106
    6208:	d019      	beq.n	623e <gpio_nrfx_pin_configure+0xae>
    620a:	d80c      	bhi.n	6226 <gpio_nrfx_pin_configure+0x96>
    620c:	2b06      	cmp	r3, #6
    620e:	d017      	beq.n	6240 <gpio_nrfx_pin_configure+0xb0>
    6210:	d804      	bhi.n	621c <gpio_nrfx_pin_configure+0x8c>
    6212:	b1ab      	cbz	r3, 6240 <gpio_nrfx_pin_configure+0xb0>
    6214:	2b02      	cmp	r3, #2
    6216:	d1e5      	bne.n	61e4 <gpio_nrfx_pin_configure+0x54>
    6218:	2304      	movs	r3, #4
    621a:	e011      	b.n	6240 <gpio_nrfx_pin_configure+0xb0>
    621c:	f5b3 7f80 	cmp.w	r3, #256	; 0x100
    6220:	d1e0      	bne.n	61e4 <gpio_nrfx_pin_configure+0x54>
    6222:	2301      	movs	r3, #1
    6224:	e00c      	b.n	6240 <gpio_nrfx_pin_configure+0xb0>
    6226:	f240 2202 	movw	r2, #514	; 0x202
    622a:	4293      	cmp	r3, r2
    622c:	d027      	beq.n	627e <gpio_nrfx_pin_configure+0xee>
    622e:	f5b3 7f40 	cmp.w	r3, #768	; 0x300
    6232:	d026      	beq.n	6282 <gpio_nrfx_pin_configure+0xf2>
    6234:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    6238:	d1d4      	bne.n	61e4 <gpio_nrfx_pin_configure+0x54>
    623a:	2302      	movs	r3, #2
    623c:	e000      	b.n	6240 <gpio_nrfx_pin_configure+0xb0>
    623e:	2307      	movs	r3, #7
    6240:	f88d 3004 	strb.w	r3, [sp, #4]
    6244:	f484 3380 	eor.w	r3, r4, #65536	; 0x10000
    6248:	f3c3 4300 	ubfx	r3, r3, #16, #1
    624c:	06e0      	lsls	r0, r4, #27
    624e:	f88d 3005 	strb.w	r3, [sp, #5]
    6252:	bf54      	ite	pl
    6254:	f3c4 1340 	ubfxpl	r3, r4, #5, #1
    6258:	2303      	movmi	r3, #3
    625a:	0321      	lsls	r1, r4, #12
    625c:	f88d 3006 	strb.w	r3, [sp, #6]
    6260:	d511      	bpl.n	6286 <gpio_nrfx_pin_configure+0xf6>
    6262:	687a      	ldr	r2, [r7, #4]
    6264:	2301      	movs	r3, #1
    6266:	40b3      	lsls	r3, r6
    6268:	f8c2 3508 	str.w	r3, [r2, #1288]	; 0x508
    626c:	2200      	movs	r2, #0
    626e:	a901      	add	r1, sp, #4
    6270:	4628      	mov	r0, r5
    6272:	f000 ff69 	bl	7148 <nrfx_gpiote_output_configure>
    6276:	4b0f      	ldr	r3, [pc, #60]	; (62b4 <gpio_nrfx_pin_configure+0x124>)
    6278:	4298      	cmp	r0, r3
    627a:	d0a6      	beq.n	61ca <gpio_nrfx_pin_configure+0x3a>
    627c:	e7b2      	b.n	61e4 <gpio_nrfx_pin_configure+0x54>
    627e:	2305      	movs	r3, #5
    6280:	e7de      	b.n	6240 <gpio_nrfx_pin_configure+0xb0>
    6282:	2303      	movs	r3, #3
    6284:	e7dc      	b.n	6240 <gpio_nrfx_pin_configure+0xb0>
    6286:	0362      	lsls	r2, r4, #13
    6288:	bf41      	itttt	mi
    628a:	2301      	movmi	r3, #1
    628c:	687a      	ldrmi	r2, [r7, #4]
    628e:	40b3      	lslmi	r3, r6
    6290:	f8c2 350c 	strmi.w	r3, [r2, #1292]	; 0x50c
    6294:	e7ea      	b.n	626c <gpio_nrfx_pin_configure+0xdc>
    6296:	06e3      	lsls	r3, r4, #27
    6298:	f04f 0300 	mov.w	r3, #0
    629c:	bf54      	ite	pl
    629e:	f3c4 1440 	ubfxpl	r4, r4, #5, #1
    62a2:	2403      	movmi	r4, #3
    62a4:	461a      	mov	r2, r3
    62a6:	a901      	add	r1, sp, #4
    62a8:	4628      	mov	r0, r5
    62aa:	f88d 4004 	strb.w	r4, [sp, #4]
    62ae:	f000 fe9d 	bl	6fec <nrfx_gpiote_input_configure>
    62b2:	e7e0      	b.n	6276 <gpio_nrfx_pin_configure+0xe6>
    62b4:	0bad0000 	.word	0x0bad0000

000062b8 <uarte_nrfx_configure>:
    62b8:	b5f0      	push	{r4, r5, r6, r7, lr}
    62ba:	794b      	ldrb	r3, [r1, #5]
    62bc:	2b01      	cmp	r3, #1
    62be:	d026      	beq.n	630e <uarte_nrfx_configure+0x56>
    62c0:	2b03      	cmp	r3, #3
    62c2:	d121      	bne.n	6308 <uarte_nrfx_configure+0x50>
    62c4:	2510      	movs	r5, #16
    62c6:	798b      	ldrb	r3, [r1, #6]
    62c8:	2b03      	cmp	r3, #3
    62ca:	d11d      	bne.n	6308 <uarte_nrfx_configure+0x50>
    62cc:	79ce      	ldrb	r6, [r1, #7]
    62ce:	b10e      	cbz	r6, 62d4 <uarte_nrfx_configure+0x1c>
    62d0:	2e01      	cmp	r6, #1
    62d2:	d119      	bne.n	6308 <uarte_nrfx_configure+0x50>
    62d4:	790a      	ldrb	r2, [r1, #4]
    62d6:	b112      	cbz	r2, 62de <uarte_nrfx_configure+0x26>
    62d8:	2a02      	cmp	r2, #2
    62da:	d115      	bne.n	6308 <uarte_nrfx_configure+0x50>
    62dc:	220e      	movs	r2, #14
    62de:	680b      	ldr	r3, [r1, #0]
    62e0:	6844      	ldr	r4, [r0, #4]
    62e2:	f5b3 4f16 	cmp.w	r3, #38400	; 0x9600
    62e6:	6827      	ldr	r7, [r4, #0]
    62e8:	d067      	beq.n	63ba <uarte_nrfx_configure+0x102>
    62ea:	d82d      	bhi.n	6348 <uarte_nrfx_configure+0x90>
    62ec:	f5b3 5f16 	cmp.w	r3, #9600	; 0x2580
    62f0:	d066      	beq.n	63c0 <uarte_nrfx_configure+0x108>
    62f2:	d816      	bhi.n	6322 <uarte_nrfx_configure+0x6a>
    62f4:	f5b3 6f96 	cmp.w	r3, #1200	; 0x4b0
    62f8:	d064      	beq.n	63c4 <uarte_nrfx_configure+0x10c>
    62fa:	d80a      	bhi.n	6312 <uarte_nrfx_configure+0x5a>
    62fc:	f5b3 7f96 	cmp.w	r3, #300	; 0x12c
    6300:	d063      	beq.n	63ca <uarte_nrfx_configure+0x112>
    6302:	f5b3 7f16 	cmp.w	r3, #600	; 0x258
    6306:	d063      	beq.n	63d0 <uarte_nrfx_configure+0x118>
    6308:	f06f 0085 	mvn.w	r0, #133	; 0x85
    630c:	e054      	b.n	63b8 <uarte_nrfx_configure+0x100>
    630e:	2500      	movs	r5, #0
    6310:	e7d9      	b.n	62c6 <uarte_nrfx_configure+0xe>
    6312:	f5b3 6f16 	cmp.w	r3, #2400	; 0x960
    6316:	d05e      	beq.n	63d6 <uarte_nrfx_configure+0x11e>
    6318:	f5b3 5f96 	cmp.w	r3, #4800	; 0x12c0
    631c:	d1f4      	bne.n	6308 <uarte_nrfx_configure+0x50>
    631e:	4b38      	ldr	r3, [pc, #224]	; (6400 <uarte_nrfx_configure+0x148>)
    6320:	e03c      	b.n	639c <uarte_nrfx_configure+0xe4>
    6322:	f5b3 4fe1 	cmp.w	r3, #28800	; 0x7080
    6326:	d059      	beq.n	63dc <uarte_nrfx_configure+0x124>
    6328:	d807      	bhi.n	633a <uarte_nrfx_configure+0x82>
    632a:	f5b3 5f61 	cmp.w	r3, #14400	; 0x3840
    632e:	d057      	beq.n	63e0 <uarte_nrfx_configure+0x128>
    6330:	f5b3 4f96 	cmp.w	r3, #19200	; 0x4b00
    6334:	d1e8      	bne.n	6308 <uarte_nrfx_configure+0x50>
    6336:	4b33      	ldr	r3, [pc, #204]	; (6404 <uarte_nrfx_configure+0x14c>)
    6338:	e030      	b.n	639c <uarte_nrfx_configure+0xe4>
    633a:	f647 2412 	movw	r4, #31250	; 0x7a12
    633e:	42a3      	cmp	r3, r4
    6340:	d1e2      	bne.n	6308 <uarte_nrfx_configure+0x50>
    6342:	f44f 0300 	mov.w	r3, #8388608	; 0x800000
    6346:	e029      	b.n	639c <uarte_nrfx_configure+0xe4>
    6348:	f5b3 3f61 	cmp.w	r3, #230400	; 0x38400
    634c:	d04a      	beq.n	63e4 <uarte_nrfx_configure+0x12c>
    634e:	d813      	bhi.n	6378 <uarte_nrfx_configure+0xc0>
    6350:	f5b3 3f96 	cmp.w	r3, #76800	; 0x12c00
    6354:	d049      	beq.n	63ea <uarte_nrfx_configure+0x132>
    6356:	d809      	bhi.n	636c <uarte_nrfx_configure+0xb4>
    6358:	f64d 24c0 	movw	r4, #56000	; 0xdac0
    635c:	42a3      	cmp	r3, r4
    635e:	d046      	beq.n	63ee <uarte_nrfx_configure+0x136>
    6360:	f5b3 4f61 	cmp.w	r3, #57600	; 0xe100
    6364:	d1d0      	bne.n	6308 <uarte_nrfx_configure+0x50>
    6366:	f44f 036b 	mov.w	r3, #15400960	; 0xeb0000
    636a:	e017      	b.n	639c <uarte_nrfx_configure+0xe4>
    636c:	f5b3 3fe1 	cmp.w	r3, #115200	; 0x1c200
    6370:	d1ca      	bne.n	6308 <uarte_nrfx_configure+0x50>
    6372:	f04f 73eb 	mov.w	r3, #30801920	; 0x1d60000
    6376:	e011      	b.n	639c <uarte_nrfx_configure+0xe4>
    6378:	f5b3 2f61 	cmp.w	r3, #921600	; 0xe1000
    637c:	d03a      	beq.n	63f4 <uarte_nrfx_configure+0x13c>
    637e:	d808      	bhi.n	6392 <uarte_nrfx_configure+0xda>
    6380:	4c21      	ldr	r4, [pc, #132]	; (6408 <uarte_nrfx_configure+0x150>)
    6382:	42a3      	cmp	r3, r4
    6384:	d039      	beq.n	63fa <uarte_nrfx_configure+0x142>
    6386:	f5b3 2fe1 	cmp.w	r3, #460800	; 0x70800
    638a:	d1bd      	bne.n	6308 <uarte_nrfx_configure+0x50>
    638c:	f04f 63e8 	mov.w	r3, #121634816	; 0x7400000
    6390:	e004      	b.n	639c <uarte_nrfx_configure+0xe4>
    6392:	4c1e      	ldr	r4, [pc, #120]	; (640c <uarte_nrfx_configure+0x154>)
    6394:	42a3      	cmp	r3, r4
    6396:	d1b7      	bne.n	6308 <uarte_nrfx_configure+0x50>
    6398:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    639c:	6904      	ldr	r4, [r0, #16]
    639e:	f8c7 3524 	str.w	r3, [r7, #1316]	; 0x524
    63a2:	6843      	ldr	r3, [r0, #4]
    63a4:	4335      	orrs	r5, r6
    63a6:	681b      	ldr	r3, [r3, #0]
    63a8:	432a      	orrs	r2, r5
    63aa:	f8c3 256c 	str.w	r2, [r3, #1388]	; 0x56c
    63ae:	c903      	ldmia	r1, {r0, r1}
    63b0:	1d23      	adds	r3, r4, #4
    63b2:	e883 0003 	stmia.w	r3, {r0, r1}
    63b6:	2000      	movs	r0, #0
    63b8:	bdf0      	pop	{r4, r5, r6, r7, pc}
    63ba:	f44f 031d 	mov.w	r3, #10289152	; 0x9d0000
    63be:	e7ed      	b.n	639c <uarte_nrfx_configure+0xe4>
    63c0:	4b13      	ldr	r3, [pc, #76]	; (6410 <uarte_nrfx_configure+0x158>)
    63c2:	e7eb      	b.n	639c <uarte_nrfx_configure+0xe4>
    63c4:	f44f 239e 	mov.w	r3, #323584	; 0x4f000
    63c8:	e7e8      	b.n	639c <uarte_nrfx_configure+0xe4>
    63ca:	f44f 33a0 	mov.w	r3, #81920	; 0x14000
    63ce:	e7e5      	b.n	639c <uarte_nrfx_configure+0xe4>
    63d0:	f44f 331c 	mov.w	r3, #159744	; 0x27000
    63d4:	e7e2      	b.n	639c <uarte_nrfx_configure+0xe4>
    63d6:	f44f 231d 	mov.w	r3, #643072	; 0x9d000
    63da:	e7df      	b.n	639c <uarte_nrfx_configure+0xe4>
    63dc:	4b0d      	ldr	r3, [pc, #52]	; (6414 <uarte_nrfx_configure+0x15c>)
    63de:	e7dd      	b.n	639c <uarte_nrfx_configure+0xe4>
    63e0:	4b0d      	ldr	r3, [pc, #52]	; (6418 <uarte_nrfx_configure+0x160>)
    63e2:	e7db      	b.n	639c <uarte_nrfx_configure+0xe4>
    63e4:	f04f 736c 	mov.w	r3, #61865984	; 0x3b00000
    63e8:	e7d8      	b.n	639c <uarte_nrfx_configure+0xe4>
    63ea:	4b0c      	ldr	r3, [pc, #48]	; (641c <uarte_nrfx_configure+0x164>)
    63ec:	e7d6      	b.n	639c <uarte_nrfx_configure+0xe4>
    63ee:	f44f 0365 	mov.w	r3, #15007744	; 0xe50000
    63f2:	e7d3      	b.n	639c <uarte_nrfx_configure+0xe4>
    63f4:	f04f 6370 	mov.w	r3, #251658240	; 0xf000000
    63f8:	e7d0      	b.n	639c <uarte_nrfx_configure+0xe4>
    63fa:	f04f 6380 	mov.w	r3, #67108864	; 0x4000000
    63fe:	e7cd      	b.n	639c <uarte_nrfx_configure+0xe4>
    6400:	0013b000 	.word	0x0013b000
    6404:	004ea000 	.word	0x004ea000
    6408:	0003d090 	.word	0x0003d090
    640c:	000f4240 	.word	0x000f4240
    6410:	00275000 	.word	0x00275000
    6414:	0075c000 	.word	0x0075c000
    6418:	003af000 	.word	0x003af000
    641c:	013a9000 	.word	0x013a9000

00006420 <uarte_instance_init.constprop.0>:
    6420:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
    6424:	6847      	ldr	r7, [r0, #4]
    6426:	6906      	ldr	r6, [r0, #16]
    6428:	683c      	ldr	r4, [r7, #0]
    642a:	2100      	movs	r1, #0
    642c:	f8c4 1500 	str.w	r1, [r4, #1280]	; 0x500
    6430:	6030      	str	r0, [r6, #0]
    6432:	f8d7 900c 	ldr.w	r9, [r7, #12]
    6436:	4680      	mov	r8, r0
    6438:	aa01      	add	r2, sp, #4
    643a:	4648      	mov	r0, r9
    643c:	f005 fa11 	bl	b862 <pinctrl_lookup_state>
    6440:	1e05      	subs	r5, r0, #0
    6442:	db54      	blt.n	64ee <uarte_instance_init.constprop.0+0xce>
    6444:	9b01      	ldr	r3, [sp, #4]
    6446:	f8d9 2000 	ldr.w	r2, [r9]
    644a:	7919      	ldrb	r1, [r3, #4]
    644c:	6818      	ldr	r0, [r3, #0]
    644e:	f000 fab1 	bl	69b4 <pinctrl_configure_pins>
    6452:	1e05      	subs	r5, r0, #0
    6454:	db4b      	blt.n	64ee <uarte_instance_init.constprop.0+0xce>
    6456:	1d31      	adds	r1, r6, #4
    6458:	4640      	mov	r0, r8
    645a:	f7ff ff2d 	bl	62b8 <uarte_nrfx_configure>
    645e:	4605      	mov	r5, r0
    6460:	2800      	cmp	r0, #0
    6462:	d144      	bne.n	64ee <uarte_instance_init.constprop.0+0xce>
    6464:	687b      	ldr	r3, [r7, #4]
    6466:	0799      	lsls	r1, r3, #30
    6468:	d51a      	bpl.n	64a0 <uarte_instance_init.constprop.0+0x80>
    646a:	f106 001c 	add.w	r0, r6, #28
    646e:	f001 f8a9 	bl	75c4 <nrfx_ppi_channel_alloc>
    6472:	4b22      	ldr	r3, [pc, #136]	; (64fc <uarte_instance_init.constprop.0+0xdc>)
    6474:	4298      	cmp	r0, r3
    6476:	d13e      	bne.n	64f6 <uarte_instance_init.constprop.0+0xd6>
    6478:	7f33      	ldrb	r3, [r6, #28]
    647a:	00db      	lsls	r3, r3, #3
    647c:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    6480:	f503 33f8 	add.w	r3, r3, #126976	; 0x1f000
    6484:	f104 020c 	add.w	r2, r4, #12
    6488:	f504 7190 	add.w	r1, r4, #288	; 0x120
    648c:	f8c3 1510 	str.w	r1, [r3, #1296]	; 0x510
    6490:	f8c3 2514 	str.w	r2, [r3, #1300]	; 0x514
    6494:	7f32      	ldrb	r2, [r6, #28]
    6496:	2301      	movs	r3, #1
    6498:	4093      	lsls	r3, r2
    649a:	4a19      	ldr	r2, [pc, #100]	; (6500 <uarte_instance_init.constprop.0+0xe0>)
    649c:	f8c2 3504 	str.w	r3, [r2, #1284]	; 0x504
    64a0:	2308      	movs	r3, #8
    64a2:	f8c4 3500 	str.w	r3, [r4, #1280]	; 0x500
    64a6:	7a3b      	ldrb	r3, [r7, #8]
    64a8:	b953      	cbnz	r3, 64c0 <uarte_instance_init.constprop.0+0xa0>
    64aa:	f8c4 3110 	str.w	r3, [r4, #272]	; 0x110
    64ae:	f8d4 3110 	ldr.w	r3, [r4, #272]	; 0x110
    64b2:	69b3      	ldr	r3, [r6, #24]
    64b4:	f8c4 3534 	str.w	r3, [r4, #1332]	; 0x534
    64b8:	2301      	movs	r3, #1
    64ba:	f8c4 3538 	str.w	r3, [r4, #1336]	; 0x538
    64be:	6023      	str	r3, [r4, #0]
    64c0:	687b      	ldr	r3, [r7, #4]
    64c2:	079a      	lsls	r2, r3, #30
    64c4:	bf5c      	itt	pl
    64c6:	f44f 7380 	movpl.w	r3, #256	; 0x100
    64ca:	f8c4 3304 	strpl.w	r3, [r4, #772]	; 0x304
    64ce:	687b      	ldr	r3, [r7, #4]
    64d0:	06db      	lsls	r3, r3, #27
    64d2:	bf44      	itt	mi
    64d4:	f44f 0380 	movmi.w	r3, #4194304	; 0x400000
    64d8:	f8c4 3304 	strmi.w	r3, [r4, #772]	; 0x304
    64dc:	6973      	ldr	r3, [r6, #20]
    64de:	f8c4 3544 	str.w	r3, [r4, #1348]	; 0x544
    64e2:	2300      	movs	r3, #0
    64e4:	f8c4 3548 	str.w	r3, [r4, #1352]	; 0x548
    64e8:	2301      	movs	r3, #1
    64ea:	60a3      	str	r3, [r4, #8]
    64ec:	60e3      	str	r3, [r4, #12]
    64ee:	4628      	mov	r0, r5
    64f0:	b003      	add	sp, #12
    64f2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    64f6:	f06f 0504 	mvn.w	r5, #4
    64fa:	e7f8      	b.n	64ee <uarte_instance_init.constprop.0+0xce>
    64fc:	0bad0000 	.word	0x0bad0000
    6500:	4001f000 	.word	0x4001f000

00006504 <uarte_nrfx_poll_out>:
    6504:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    6506:	4604      	mov	r4, r0
    6508:	6907      	ldr	r7, [r0, #16]
    650a:	460d      	mov	r5, r1
    650c:	f005 fb09 	bl	bb22 <k_is_in_isr>
    6510:	b9b0      	cbnz	r0, 6540 <uarte_nrfx_poll_out+0x3c>
    6512:	4b21      	ldr	r3, [pc, #132]	; (6598 <uarte_nrfx_poll_out+0x94>)
    6514:	781b      	ldrb	r3, [r3, #0]
    6516:	b19b      	cbz	r3, 6540 <uarte_nrfx_poll_out+0x3c>
    6518:	2664      	movs	r6, #100	; 0x64
    651a:	6860      	ldr	r0, [r4, #4]
    651c:	f005 f8c6 	bl	b6ac <is_tx_ready.isra.0>
    6520:	bb00      	cbnz	r0, 6564 <uarte_nrfx_poll_out+0x60>
    6522:	2001      	movs	r0, #1
    6524:	f005 f9c0 	bl	b8a8 <nrfx_busy_wait>
    6528:	3e01      	subs	r6, #1
    652a:	d1f6      	bne.n	651a <uarte_nrfx_poll_out+0x16>
    652c:	2100      	movs	r1, #0
    652e:	2021      	movs	r0, #33	; 0x21
    6530:	f001 ff6c 	bl	840c <z_impl_k_sleep>
    6534:	e7f0      	b.n	6518 <uarte_nrfx_poll_out+0x14>
    6536:	f381 8811 	msr	BASEPRI, r1
    653a:	f3bf 8f6f 	isb	sy
    653e:	e7f5      	b.n	652c <uarte_nrfx_poll_out+0x28>
    6540:	f04f 0320 	mov.w	r3, #32
    6544:	f3ef 8111 	mrs	r1, BASEPRI
    6548:	f383 8812 	msr	BASEPRI_MAX, r3
    654c:	f3bf 8f6f 	isb	sy
    6550:	6860      	ldr	r0, [r4, #4]
    6552:	460e      	mov	r6, r1
    6554:	f005 f8aa 	bl	b6ac <is_tx_ready.isra.0>
    6558:	b990      	cbnz	r0, 6580 <uarte_nrfx_poll_out+0x7c>
    655a:	f381 8811 	msr	BASEPRI, r1
    655e:	f3bf 8f6f 	isb	sy
    6562:	e7ed      	b.n	6540 <uarte_nrfx_poll_out+0x3c>
    6564:	f04f 0320 	mov.w	r3, #32
    6568:	f3ef 8111 	mrs	r1, BASEPRI
    656c:	f383 8812 	msr	BASEPRI_MAX, r3
    6570:	f3bf 8f6f 	isb	sy
    6574:	6860      	ldr	r0, [r4, #4]
    6576:	460e      	mov	r6, r1
    6578:	f005 f898 	bl	b6ac <is_tx_ready.isra.0>
    657c:	2800      	cmp	r0, #0
    657e:	d0da      	beq.n	6536 <uarte_nrfx_poll_out+0x32>
    6580:	697b      	ldr	r3, [r7, #20]
    6582:	701d      	strb	r5, [r3, #0]
    6584:	6979      	ldr	r1, [r7, #20]
    6586:	2201      	movs	r2, #1
    6588:	4620      	mov	r0, r4
    658a:	f004 ffcf 	bl	b52c <tx_start>
    658e:	f386 8811 	msr	BASEPRI, r6
    6592:	f3bf 8f6f 	isb	sy
    6596:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    6598:	20001d07 	.word	0x20001d07

0000659c <compare_int_lock>:
    659c:	b570      	push	{r4, r5, r6, lr}
    659e:	2301      	movs	r3, #1
    65a0:	4083      	lsls	r3, r0
    65a2:	4a0e      	ldr	r2, [pc, #56]	; (65dc <compare_int_lock+0x40>)
    65a4:	f3bf 8f5b 	dmb	ish
    65a8:	43dc      	mvns	r4, r3
    65aa:	e852 1f00 	ldrex	r1, [r2]
    65ae:	ea01 0504 	and.w	r5, r1, r4
    65b2:	e842 5600 	strex	r6, r5, [r2]
    65b6:	2e00      	cmp	r6, #0
    65b8:	d1f7      	bne.n	65aa <compare_int_lock+0xe>
    65ba:	f3bf 8f5b 	dmb	ish
    65be:	f44f 3280 	mov.w	r2, #65536	; 0x10000
    65c2:	4082      	lsls	r2, r0
    65c4:	4806      	ldr	r0, [pc, #24]	; (65e0 <compare_int_lock+0x44>)
    65c6:	f8c0 2308 	str.w	r2, [r0, #776]	; 0x308
    65ca:	f3bf 8f5f 	dmb	sy
    65ce:	f3bf 8f6f 	isb	sy
    65d2:	420b      	tst	r3, r1
    65d4:	bf14      	ite	ne
    65d6:	2001      	movne	r0, #1
    65d8:	2000      	moveq	r0, #0
    65da:	bd70      	pop	{r4, r5, r6, pc}
    65dc:	20001590 	.word	0x20001590
    65e0:	40011000 	.word	0x40011000

000065e4 <sys_clock_timeout_handler>:
    65e4:	b470      	push	{r4, r5, r6}
    65e6:	490e      	ldr	r1, [pc, #56]	; (6620 <sys_clock_timeout_handler+0x3c>)
    65e8:	e9d1 3400 	ldrd	r3, r4, [r1]
    65ec:	1ad0      	subs	r0, r2, r3
    65ee:	18c3      	adds	r3, r0, r3
    65f0:	f144 0400 	adc.w	r4, r4, #0
    65f4:	f022 467f 	bic.w	r6, r2, #4278190080	; 0xff000000
    65f8:	e9c1 3400 	strd	r3, r4, [r1]
    65fc:	f5a6 1300 	sub.w	r3, r6, #2097152	; 0x200000
    6600:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
    6604:	d209      	bcs.n	661a <sys_clock_timeout_handler+0x36>
    6606:	4b07      	ldr	r3, [pc, #28]	; (6624 <sys_clock_timeout_handler+0x40>)
    6608:	681b      	ldr	r3, [r3, #0]
    660a:	0a1a      	lsrs	r2, r3, #8
    660c:	061b      	lsls	r3, r3, #24
    660e:	199c      	adds	r4, r3, r6
    6610:	4b05      	ldr	r3, [pc, #20]	; (6628 <sys_clock_timeout_handler+0x44>)
    6612:	f142 0500 	adc.w	r5, r2, #0
    6616:	e9c3 4500 	strd	r4, r5, [r3]
    661a:	bc70      	pop	{r4, r5, r6}
    661c:	f002 b872 	b.w	8704 <sys_clock_announce>
    6620:	20000538 	.word	0x20000538
    6624:	20001594 	.word	0x20001594
    6628:	20000540 	.word	0x20000540

0000662c <compare_int_unlock>:
    662c:	b311      	cbz	r1, 6674 <compare_int_unlock+0x48>
    662e:	f3bf 8f5b 	dmb	ish
    6632:	2301      	movs	r3, #1
    6634:	4a10      	ldr	r2, [pc, #64]	; (6678 <compare_int_unlock+0x4c>)
    6636:	4083      	lsls	r3, r0
    6638:	e852 cf00 	ldrex	ip, [r2]
    663c:	ea4c 0c03 	orr.w	ip, ip, r3
    6640:	e842 c100 	strex	r1, ip, [r2]
    6644:	2900      	cmp	r1, #0
    6646:	d1f7      	bne.n	6638 <compare_int_unlock+0xc>
    6648:	f3bf 8f5b 	dmb	ish
    664c:	4a0b      	ldr	r2, [pc, #44]	; (667c <compare_int_unlock+0x50>)
    664e:	f44f 3380 	mov.w	r3, #65536	; 0x10000
    6652:	4083      	lsls	r3, r0
    6654:	f8c2 3304 	str.w	r3, [r2, #772]	; 0x304
    6658:	4b09      	ldr	r3, [pc, #36]	; (6680 <compare_int_unlock+0x54>)
    665a:	f3bf 8f5b 	dmb	ish
    665e:	681b      	ldr	r3, [r3, #0]
    6660:	f3bf 8f5b 	dmb	ish
    6664:	40c3      	lsrs	r3, r0
    6666:	07db      	lsls	r3, r3, #31
    6668:	bf42      	ittt	mi
    666a:	4b06      	ldrmi	r3, [pc, #24]	; (6684 <compare_int_unlock+0x58>)
    666c:	f44f 3200 	movmi.w	r2, #131072	; 0x20000
    6670:	f8c3 2100 	strmi.w	r2, [r3, #256]	; 0x100
    6674:	4770      	bx	lr
    6676:	bf00      	nop
    6678:	20001590 	.word	0x20001590
    667c:	40011000 	.word	0x40011000
    6680:	2000158c 	.word	0x2000158c
    6684:	e000e100 	.word	0xe000e100

00006688 <z_nrf_rtc_timer_read>:
    6688:	4b0d      	ldr	r3, [pc, #52]	; (66c0 <z_nrf_rtc_timer_read+0x38>)
    668a:	6818      	ldr	r0, [r3, #0]
    668c:	0a01      	lsrs	r1, r0, #8
    668e:	0600      	lsls	r0, r0, #24
    6690:	f3bf 8f5f 	dmb	sy
    6694:	4b0b      	ldr	r3, [pc, #44]	; (66c4 <z_nrf_rtc_timer_read+0x3c>)
    6696:	f8d3 3504 	ldr.w	r3, [r3, #1284]	; 0x504
    669a:	1818      	adds	r0, r3, r0
    669c:	f141 0100 	adc.w	r1, r1, #0
    66a0:	f5b3 1f80 	cmp.w	r3, #1048576	; 0x100000
    66a4:	d20a      	bcs.n	66bc <z_nrf_rtc_timer_read+0x34>
    66a6:	4b08      	ldr	r3, [pc, #32]	; (66c8 <z_nrf_rtc_timer_read+0x40>)
    66a8:	e9d3 2300 	ldrd	r2, r3, [r3]
    66ac:	4290      	cmp	r0, r2
    66ae:	eb71 0303 	sbcs.w	r3, r1, r3
    66b2:	d203      	bcs.n	66bc <z_nrf_rtc_timer_read+0x34>
    66b4:	f110 7080 	adds.w	r0, r0, #16777216	; 0x1000000
    66b8:	f141 0100 	adc.w	r1, r1, #0
    66bc:	4770      	bx	lr
    66be:	bf00      	nop
    66c0:	20001594 	.word	0x20001594
    66c4:	40011000 	.word	0x40011000
    66c8:	20000540 	.word	0x20000540

000066cc <compare_set>:
    66cc:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    66d0:	4616      	mov	r6, r2
    66d2:	461f      	mov	r7, r3
    66d4:	4604      	mov	r4, r0
    66d6:	f7ff ff61 	bl	659c <compare_int_lock>
    66da:	9000      	str	r0, [sp, #0]
    66dc:	f7ff ffd4 	bl	6688 <z_nrf_rtc_timer_read>
    66e0:	42b0      	cmp	r0, r6
    66e2:	eb71 0307 	sbcs.w	r3, r1, r7
    66e6:	d251      	bcs.n	678c <compare_set+0xc0>
    66e8:	4b3a      	ldr	r3, [pc, #232]	; (67d4 <compare_set+0x108>)
    66ea:	1a30      	subs	r0, r6, r0
    66ec:	eb67 0101 	sbc.w	r1, r7, r1
    66f0:	4298      	cmp	r0, r3
    66f2:	f171 0100 	sbcs.w	r1, r1, #0
    66f6:	d26a      	bcs.n	67ce <compare_set+0x102>
    66f8:	4b37      	ldr	r3, [pc, #220]	; (67d8 <compare_set+0x10c>)
    66fa:	eb03 1304 	add.w	r3, r3, r4, lsl #4
    66fe:	e9d3 2302 	ldrd	r2, r3, [r3, #8]
    6702:	429f      	cmp	r7, r3
    6704:	bf08      	it	eq
    6706:	4296      	cmpeq	r6, r2
    6708:	d04e      	beq.n	67a8 <compare_set+0xdc>
    670a:	4934      	ldr	r1, [pc, #208]	; (67dc <compare_set+0x110>)
    670c:	f44f 3980 	mov.w	r9, #65536	; 0x10000
    6710:	f104 0550 	add.w	r5, r4, #80	; 0x50
    6714:	fa09 f904 	lsl.w	r9, r9, r4
    6718:	00ad      	lsls	r5, r5, #2
    671a:	f8c1 9348 	str.w	r9, [r1, #840]	; 0x348
    671e:	4620      	mov	r0, r4
    6720:	b2ad      	uxth	r5, r5
    6722:	f005 f88e 	bl	b842 <event_clear>
    6726:	f026 4b7f 	bic.w	fp, r6, #4278190080	; 0xff000000
    672a:	f105 4580 	add.w	r5, r5, #1073741824	; 0x40000000
    672e:	f504 73a8 	add.w	r3, r4, #336	; 0x150
    6732:	4a2b      	ldr	r2, [pc, #172]	; (67e0 <compare_set+0x114>)
    6734:	9301      	str	r3, [sp, #4]
    6736:	f505 3588 	add.w	r5, r5, #69632	; 0x11000
    673a:	46dc      	mov	ip, fp
    673c:	f04f 0a03 	mov.w	sl, #3
    6740:	9b01      	ldr	r3, [sp, #4]
    6742:	f02c 407f 	bic.w	r0, ip, #4278190080	; 0xff000000
    6746:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
    674a:	f8c1 9344 	str.w	r9, [r1, #836]	; 0x344
    674e:	f8d1 8504 	ldr.w	r8, [r1, #1284]	; 0x504
    6752:	f06f 0002 	mvn.w	r0, #2
    6756:	eba0 0008 	sub.w	r0, r0, r8
    675a:	4460      	add	r0, ip
    675c:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
    6760:	4290      	cmp	r0, r2
    6762:	d921      	bls.n	67a8 <compare_set+0xdc>
    6764:	6828      	ldr	r0, [r5, #0]
    6766:	b160      	cbz	r0, 6782 <compare_set+0xb6>
    6768:	f8d1 8504 	ldr.w	r8, [r1, #1284]	; 0x504
    676c:	eba8 000b 	sub.w	r0, r8, fp
    6770:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
    6774:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
    6778:	d916      	bls.n	67a8 <compare_set+0xdc>
    677a:	4620      	mov	r0, r4
    677c:	f005 f861 	bl	b842 <event_clear>
    6780:	4a17      	ldr	r2, [pc, #92]	; (67e0 <compare_set+0x114>)
    6782:	eb0a 0c08 	add.w	ip, sl, r8
    6786:	f10a 0a01 	add.w	sl, sl, #1
    678a:	e7d9      	b.n	6740 <compare_set+0x74>
    678c:	2301      	movs	r3, #1
    678e:	4a15      	ldr	r2, [pc, #84]	; (67e4 <compare_set+0x118>)
    6790:	f3bf 8f5b 	dmb	ish
    6794:	40a3      	lsls	r3, r4
    6796:	e852 0f00 	ldrex	r0, [r2]
    679a:	4318      	orrs	r0, r3
    679c:	e842 0100 	strex	r1, r0, [r2]
    67a0:	2900      	cmp	r1, #0
    67a2:	d1f8      	bne.n	6796 <compare_set+0xca>
    67a4:	f3bf 8f5b 	dmb	ish
    67a8:	490b      	ldr	r1, [pc, #44]	; (67d8 <compare_set+0x10c>)
    67aa:	980c      	ldr	r0, [sp, #48]	; 0x30
    67ac:	0123      	lsls	r3, r4, #4
    67ae:	eb01 1204 	add.w	r2, r1, r4, lsl #4
    67b2:	e9c2 6702 	strd	r6, r7, [r2, #8]
    67b6:	50c8      	str	r0, [r1, r3]
    67b8:	9b0d      	ldr	r3, [sp, #52]	; 0x34
    67ba:	6053      	str	r3, [r2, #4]
    67bc:	2500      	movs	r5, #0
    67be:	4620      	mov	r0, r4
    67c0:	9900      	ldr	r1, [sp, #0]
    67c2:	f7ff ff33 	bl	662c <compare_int_unlock>
    67c6:	4628      	mov	r0, r5
    67c8:	b003      	add	sp, #12
    67ca:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    67ce:	f06f 0515 	mvn.w	r5, #21
    67d2:	e7f4      	b.n	67be <compare_set+0xf2>
    67d4:	00800001 	.word	0x00800001
    67d8:	20000528 	.word	0x20000528
    67dc:	40011000 	.word	0x40011000
    67e0:	007ffffd 	.word	0x007ffffd
    67e4:	2000158c 	.word	0x2000158c

000067e8 <sys_clock_driver_init>:
    67e8:	b573      	push	{r0, r1, r4, r5, r6, lr}
    67ea:	4b19      	ldr	r3, [pc, #100]	; (6850 <sys_clock_driver_init+0x68>)
    67ec:	4d19      	ldr	r5, [pc, #100]	; (6854 <sys_clock_driver_init+0x6c>)
    67ee:	2400      	movs	r4, #0
    67f0:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    67f4:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    67f8:	f8c5 4508 	str.w	r4, [r5, #1288]	; 0x508
    67fc:	e9c3 0102 	strd	r0, r1, [r3, #8]
    6800:	f44f 3380 	mov.w	r3, #65536	; 0x10000
    6804:	f8c5 3304 	str.w	r3, [r5, #772]	; 0x304
    6808:	4b13      	ldr	r3, [pc, #76]	; (6858 <sys_clock_driver_init+0x70>)
    680a:	2602      	movs	r6, #2
    680c:	f44f 3200 	mov.w	r2, #131072	; 0x20000
    6810:	2101      	movs	r1, #1
    6812:	f8c5 6304 	str.w	r6, [r5, #772]	; 0x304
    6816:	2011      	movs	r0, #17
    6818:	f8c3 2180 	str.w	r2, [r3, #384]	; 0x180
    681c:	4622      	mov	r2, r4
    681e:	f7fe fda1 	bl	5364 <z_arm_irq_priority_set>
    6822:	2011      	movs	r0, #17
    6824:	f7fe fd82 	bl	532c <arch_irq_enable>
    6828:	4a0c      	ldr	r2, [pc, #48]	; (685c <sys_clock_driver_init+0x74>)
    682a:	2301      	movs	r3, #1
    682c:	60ab      	str	r3, [r5, #8]
    682e:	602b      	str	r3, [r5, #0]
    6830:	6013      	str	r3, [r2, #0]
    6832:	4b0b      	ldr	r3, [pc, #44]	; (6860 <sys_clock_driver_init+0x78>)
    6834:	4a0b      	ldr	r2, [pc, #44]	; (6864 <sys_clock_driver_init+0x7c>)
    6836:	9300      	str	r3, [sp, #0]
    6838:	9401      	str	r4, [sp, #4]
    683a:	2300      	movs	r3, #0
    683c:	4620      	mov	r0, r4
    683e:	f7ff ff45 	bl	66cc <compare_set>
    6842:	4630      	mov	r0, r6
    6844:	f7ff fb52 	bl	5eec <z_nrf_clock_control_lf_on>
    6848:	4620      	mov	r0, r4
    684a:	b002      	add	sp, #8
    684c:	bd70      	pop	{r4, r5, r6, pc}
    684e:	bf00      	nop
    6850:	20000528 	.word	0x20000528
    6854:	40011000 	.word	0x40011000
    6858:	e000e100 	.word	0xe000e100
    685c:	20001590 	.word	0x20001590
    6860:	000065e5 	.word	0x000065e5
    6864:	007fffff 	.word	0x007fffff

00006868 <rtc_nrf_isr>:
    6868:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
    686c:	4c2f      	ldr	r4, [pc, #188]	; (692c <rtc_nrf_isr+0xc4>)
    686e:	f8d4 3304 	ldr.w	r3, [r4, #772]	; 0x304
    6872:	0799      	lsls	r1, r3, #30
    6874:	d50b      	bpl.n	688e <rtc_nrf_isr+0x26>
    6876:	f8d4 3104 	ldr.w	r3, [r4, #260]	; 0x104
    687a:	b143      	cbz	r3, 688e <rtc_nrf_isr+0x26>
    687c:	4a2c      	ldr	r2, [pc, #176]	; (6930 <rtc_nrf_isr+0xc8>)
    687e:	2300      	movs	r3, #0
    6880:	f8c4 3104 	str.w	r3, [r4, #260]	; 0x104
    6884:	f8d4 3104 	ldr.w	r3, [r4, #260]	; 0x104
    6888:	6813      	ldr	r3, [r2, #0]
    688a:	3301      	adds	r3, #1
    688c:	6013      	str	r3, [r2, #0]
    688e:	f8d4 3304 	ldr.w	r3, [r4, #772]	; 0x304
    6892:	03da      	lsls	r2, r3, #15
    6894:	d52a      	bpl.n	68ec <rtc_nrf_isr+0x84>
    6896:	f3bf 8f5b 	dmb	ish
    689a:	4b26      	ldr	r3, [pc, #152]	; (6934 <rtc_nrf_isr+0xcc>)
    689c:	e853 2f00 	ldrex	r2, [r3]
    68a0:	f022 0101 	bic.w	r1, r2, #1
    68a4:	e843 1000 	strex	r0, r1, [r3]
    68a8:	2800      	cmp	r0, #0
    68aa:	d1f7      	bne.n	689c <rtc_nrf_isr+0x34>
    68ac:	f3bf 8f5b 	dmb	ish
    68b0:	07d3      	lsls	r3, r2, #31
    68b2:	d402      	bmi.n	68ba <rtc_nrf_isr+0x52>
    68b4:	f8d4 3140 	ldr.w	r3, [r4, #320]	; 0x140
    68b8:	b1c3      	cbz	r3, 68ec <rtc_nrf_isr+0x84>
    68ba:	2500      	movs	r5, #0
    68bc:	f8c4 5140 	str.w	r5, [r4, #320]	; 0x140
    68c0:	f8d4 3140 	ldr.w	r3, [r4, #320]	; 0x140
    68c4:	f7ff fee0 	bl	6688 <z_nrf_rtc_timer_read>
    68c8:	f04f 0320 	mov.w	r3, #32
    68cc:	f3ef 8211 	mrs	r2, BASEPRI
    68d0:	f383 8812 	msr	BASEPRI_MAX, r3
    68d4:	f3bf 8f6f 	isb	sy
    68d8:	4b17      	ldr	r3, [pc, #92]	; (6938 <rtc_nrf_isr+0xd0>)
    68da:	e9d3 6702 	ldrd	r6, r7, [r3, #8]
    68de:	42b0      	cmp	r0, r6
    68e0:	41b9      	sbcs	r1, r7
    68e2:	d206      	bcs.n	68f2 <rtc_nrf_isr+0x8a>
    68e4:	f382 8811 	msr	BASEPRI, r2
    68e8:	f3bf 8f6f 	isb	sy
    68ec:	b003      	add	sp, #12
    68ee:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    68f2:	f04f 38ff 	mov.w	r8, #4294967295	; 0xffffffff
    68f6:	f04f 39ff 	mov.w	r9, #4294967295	; 0xffffffff
    68fa:	e9c3 8902 	strd	r8, r9, [r3, #8]
    68fe:	e9d3 1000 	ldrd	r1, r0, [r3]
    6902:	601d      	str	r5, [r3, #0]
    6904:	f44f 3380 	mov.w	r3, #65536	; 0x10000
    6908:	f8c4 3348 	str.w	r3, [r4, #840]	; 0x348
    690c:	f8c4 5140 	str.w	r5, [r4, #320]	; 0x140
    6910:	f8d4 3140 	ldr.w	r3, [r4, #320]	; 0x140
    6914:	f382 8811 	msr	BASEPRI, r2
    6918:	f3bf 8f6f 	isb	sy
    691c:	2900      	cmp	r1, #0
    691e:	d0e5      	beq.n	68ec <rtc_nrf_isr+0x84>
    6920:	9000      	str	r0, [sp, #0]
    6922:	4632      	mov	r2, r6
    6924:	463b      	mov	r3, r7
    6926:	4628      	mov	r0, r5
    6928:	4788      	blx	r1
    692a:	e7df      	b.n	68ec <rtc_nrf_isr+0x84>
    692c:	40011000 	.word	0x40011000
    6930:	20001594 	.word	0x20001594
    6934:	2000158c 	.word	0x2000158c
    6938:	20000528 	.word	0x20000528

0000693c <sys_clock_set_timeout>:
    693c:	1c43      	adds	r3, r0, #1
    693e:	b513      	push	{r0, r1, r4, lr}
    6940:	d022      	beq.n	6988 <sys_clock_set_timeout+0x4c>
    6942:	2801      	cmp	r0, #1
    6944:	dd22      	ble.n	698c <sys_clock_set_timeout+0x50>
    6946:	4a12      	ldr	r2, [pc, #72]	; (6990 <sys_clock_set_timeout+0x54>)
    6948:	4b12      	ldr	r3, [pc, #72]	; (6994 <sys_clock_set_timeout+0x58>)
    694a:	4290      	cmp	r0, r2
    694c:	bfd4      	ite	le
    694e:	4604      	movle	r4, r0
    6950:	461c      	movgt	r4, r3
    6952:	f7ff fe99 	bl	6688 <z_nrf_rtc_timer_read>
    6956:	4b10      	ldr	r3, [pc, #64]	; (6998 <sys_clock_set_timeout+0x5c>)
    6958:	490e      	ldr	r1, [pc, #56]	; (6994 <sys_clock_set_timeout+0x58>)
    695a:	e9d3 2300 	ldrd	r2, r3, [r3]
    695e:	1a80      	subs	r0, r0, r2
    6960:	f5b0 0f00 	cmp.w	r0, #8388608	; 0x800000
    6964:	bf28      	it	cs
    6966:	2400      	movcs	r4, #0
    6968:	4404      	add	r4, r0
    696a:	428c      	cmp	r4, r1
    696c:	bf28      	it	cs
    696e:	460c      	movcs	r4, r1
    6970:	18a2      	adds	r2, r4, r2
    6972:	490a      	ldr	r1, [pc, #40]	; (699c <sys_clock_set_timeout+0x60>)
    6974:	9100      	str	r1, [sp, #0]
    6976:	f04f 0000 	mov.w	r0, #0
    697a:	9001      	str	r0, [sp, #4]
    697c:	f143 0300 	adc.w	r3, r3, #0
    6980:	f7ff fea4 	bl	66cc <compare_set>
    6984:	b002      	add	sp, #8
    6986:	bd10      	pop	{r4, pc}
    6988:	4c02      	ldr	r4, [pc, #8]	; (6994 <sys_clock_set_timeout+0x58>)
    698a:	e7e2      	b.n	6952 <sys_clock_set_timeout+0x16>
    698c:	2401      	movs	r4, #1
    698e:	e7e0      	b.n	6952 <sys_clock_set_timeout+0x16>
    6990:	007ffffe 	.word	0x007ffffe
    6994:	007fffff 	.word	0x007fffff
    6998:	20000538 	.word	0x20000538
    699c:	000065e5 	.word	0x000065e5

000069a0 <sys_clock_elapsed>:
    69a0:	b508      	push	{r3, lr}
    69a2:	f7ff fe71 	bl	6688 <z_nrf_rtc_timer_read>
    69a6:	4b02      	ldr	r3, [pc, #8]	; (69b0 <sys_clock_elapsed+0x10>)
    69a8:	681b      	ldr	r3, [r3, #0]
    69aa:	1ac0      	subs	r0, r0, r3
    69ac:	bd08      	pop	{r3, pc}
    69ae:	bf00      	nop
    69b0:	20000538 	.word	0x20000538

000069b4 <pinctrl_configure_pins>:
    69b4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    69b8:	4e5a      	ldr	r6, [pc, #360]	; (6b24 <pinctrl_configure_pins+0x170>)
    69ba:	eb00 0181 	add.w	r1, r0, r1, lsl #2
    69be:	2701      	movs	r7, #1
    69c0:	4281      	cmp	r1, r0
    69c2:	d102      	bne.n	69ca <pinctrl_configure_pins+0x16>
    69c4:	2000      	movs	r0, #0
    69c6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    69ca:	6804      	ldr	r4, [r0, #0]
    69cc:	f004 037f 	and.w	r3, r4, #127	; 0x7f
    69d0:	f3c4 2543 	ubfx	r5, r4, #9, #4
    69d4:	2b7f      	cmp	r3, #127	; 0x7f
    69d6:	ea4f 4414 	mov.w	r4, r4, lsr #16
    69da:	bf08      	it	eq
    69dc:	f04f 33ff 	moveq.w	r3, #4294967295	; 0xffffffff
    69e0:	2c22      	cmp	r4, #34	; 0x22
    69e2:	f200 809b 	bhi.w	6b1c <pinctrl_configure_pins+0x168>
    69e6:	e8df f004 	tbb	[pc, r4]
    69ea:	2412      	.short	0x2412
    69ec:	402c4429 	.word	0x402c4429
    69f0:	99999944 	.word	0x99999944
    69f4:	99704799 	.word	0x99704799
    69f8:	99999999 	.word	0x99999999
    69fc:	99999999 	.word	0x99999999
    6a00:	817e7b73 	.word	0x817e7b73
    6a04:	84999999 	.word	0x84999999
    6a08:	93908d8a 	.word	0x93908d8a
    6a0c:	96          	.byte	0x96
    6a0d:	00          	.byte	0x00
    6a0e:	f8c2 350c 	str.w	r3, [r2, #1292]	; 0x50c
    6a12:	ea4f 1c53 	mov.w	ip, r3, lsr #5
    6a16:	f1bc 0f01 	cmp.w	ip, #1
    6a1a:	f003 041f 	and.w	r4, r3, #31
    6a1e:	bf14      	ite	ne
    6a20:	f04f 4ca0 	movne.w	ip, #1342177280	; 0x50000000
    6a24:	46b4      	moveq	ip, r6
    6a26:	fa07 f404 	lsl.w	r4, r7, r4
    6a2a:	f8cc 4508 	str.w	r4, [ip, #1288]	; 0x508
    6a2e:	2401      	movs	r4, #1
    6a30:	e002      	b.n	6a38 <pinctrl_configure_pins+0x84>
    6a32:	f8c2 3514 	str.w	r3, [r2, #1300]	; 0x514
    6a36:	2400      	movs	r4, #0
    6a38:	46a6      	mov	lr, r4
    6a3a:	e024      	b.n	6a86 <pinctrl_configure_pins+0xd2>
    6a3c:	f8c2 3508 	str.w	r3, [r2, #1288]	; 0x508
    6a40:	e7e7      	b.n	6a12 <pinctrl_configure_pins+0x5e>
    6a42:	f8c2 3508 	str.w	r3, [r2, #1288]	; 0x508
    6a46:	2400      	movs	r4, #0
    6a48:	ea4f 1e53 	mov.w	lr, r3, lsr #5
    6a4c:	f1be 0f01 	cmp.w	lr, #1
    6a50:	bf14      	ite	ne
    6a52:	f04f 4ea0 	movne.w	lr, #1342177280	; 0x50000000
    6a56:	46b6      	moveq	lr, r6
    6a58:	f003 0c1f 	and.w	ip, r3, #31
    6a5c:	fa07 fc0c 	lsl.w	ip, r7, ip
    6a60:	f8ce c50c 	str.w	ip, [lr, #1292]	; 0x50c
    6a64:	f04f 0e01 	mov.w	lr, #1
    6a68:	e00d      	b.n	6a86 <pinctrl_configure_pins+0xd2>
    6a6a:	f8c2 350c 	str.w	r3, [r2, #1292]	; 0x50c
    6a6e:	2401      	movs	r4, #1
    6a70:	e7ea      	b.n	6a48 <pinctrl_configure_pins+0x94>
    6a72:	f8c2 3510 	str.w	r3, [r2, #1296]	; 0x510
    6a76:	e7de      	b.n	6a36 <pinctrl_configure_pins+0x82>
    6a78:	f8c2 3508 	str.w	r3, [r2, #1288]	; 0x508
    6a7c:	2d00      	cmp	r5, #0
    6a7e:	d1da      	bne.n	6a36 <pinctrl_configure_pins+0x82>
    6a80:	2400      	movs	r4, #0
    6a82:	46a6      	mov	lr, r4
    6a84:	2506      	movs	r5, #6
    6a86:	f850 cb04 	ldr.w	ip, [r0], #4
    6a8a:	f40c 5800 	and.w	r8, ip, #8192	; 0x2000
    6a8e:	f1b8 0f00 	cmp.w	r8, #0
    6a92:	ea4f 2505 	mov.w	r5, r5, lsl #8
    6a96:	f3cc 18c1 	ubfx	r8, ip, #7, #2
    6a9a:	f003 0c1f 	and.w	ip, r3, #31
    6a9e:	ea4f 1353 	mov.w	r3, r3, lsr #5
    6aa2:	bf1c      	itt	ne
    6aa4:	2401      	movne	r4, #1
    6aa6:	f04f 0e00 	movne.w	lr, #0
    6aaa:	ea45 0588 	orr.w	r5, r5, r8, lsl #2
    6aae:	2b01      	cmp	r3, #1
    6ab0:	bf0c      	ite	eq
    6ab2:	4633      	moveq	r3, r6
    6ab4:	f04f 43a0 	movne.w	r3, #1342177280	; 0x50000000
    6ab8:	ea45 050e 	orr.w	r5, r5, lr
    6abc:	f50c 7ce0 	add.w	ip, ip, #448	; 0x1c0
    6ac0:	ea45 0544 	orr.w	r5, r5, r4, lsl #1
    6ac4:	f843 502c 	str.w	r5, [r3, ip, lsl #2]
    6ac8:	e77a      	b.n	69c0 <pinctrl_configure_pins+0xc>
    6aca:	f8c2 350c 	str.w	r3, [r2, #1292]	; 0x50c
    6ace:	e7d5      	b.n	6a7c <pinctrl_configure_pins+0xc8>
    6ad0:	f8c2 3560 	str.w	r3, [r2, #1376]	; 0x560
    6ad4:	6804      	ldr	r4, [r0, #0]
    6ad6:	f3c4 3480 	ubfx	r4, r4, #14, #1
    6ada:	2c00      	cmp	r4, #0
    6adc:	d0c7      	beq.n	6a6e <pinctrl_configure_pins+0xba>
    6ade:	e798      	b.n	6a12 <pinctrl_configure_pins+0x5e>
    6ae0:	f8c2 3564 	str.w	r3, [r2, #1380]	; 0x564
    6ae4:	e7f6      	b.n	6ad4 <pinctrl_configure_pins+0x120>
    6ae6:	f8c2 3568 	str.w	r3, [r2, #1384]	; 0x568
    6aea:	e7f3      	b.n	6ad4 <pinctrl_configure_pins+0x120>
    6aec:	f8c2 356c 	str.w	r3, [r2, #1388]	; 0x56c
    6af0:	e7f0      	b.n	6ad4 <pinctrl_configure_pins+0x120>
    6af2:	f8c2 3524 	str.w	r3, [r2, #1316]	; 0x524
    6af6:	2401      	movs	r4, #1
    6af8:	f04f 0e00 	mov.w	lr, #0
    6afc:	e7c3      	b.n	6a86 <pinctrl_configure_pins+0xd2>
    6afe:	f8c2 3528 	str.w	r3, [r2, #1320]	; 0x528
    6b02:	e786      	b.n	6a12 <pinctrl_configure_pins+0x5e>
    6b04:	f8c2 3530 	str.w	r3, [r2, #1328]	; 0x530
    6b08:	e7f5      	b.n	6af6 <pinctrl_configure_pins+0x142>
    6b0a:	f8c2 3534 	str.w	r3, [r2, #1332]	; 0x534
    6b0e:	e7f2      	b.n	6af6 <pinctrl_configure_pins+0x142>
    6b10:	f8c2 3538 	str.w	r3, [r2, #1336]	; 0x538
    6b14:	e7ef      	b.n	6af6 <pinctrl_configure_pins+0x142>
    6b16:	f8c2 353c 	str.w	r3, [r2, #1340]	; 0x53c
    6b1a:	e7ec      	b.n	6af6 <pinctrl_configure_pins+0x142>
    6b1c:	f06f 0085 	mvn.w	r0, #133	; 0x85
    6b20:	e751      	b.n	69c6 <pinctrl_configure_pins+0x12>
    6b22:	bf00      	nop
    6b24:	50000300 	.word	0x50000300

00006b28 <nrf52_errata_103>:
    6b28:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    6b2c:	f8d3 2130 	ldr.w	r2, [r3, #304]	; 0x130
    6b30:	2a08      	cmp	r2, #8
    6b32:	d106      	bne.n	6b42 <nrf52_errata_103+0x1a>
    6b34:	f8d3 3134 	ldr.w	r3, [r3, #308]	; 0x134
    6b38:	2b05      	cmp	r3, #5
    6b3a:	d802      	bhi.n	6b42 <nrf52_errata_103+0x1a>
    6b3c:	4a02      	ldr	r2, [pc, #8]	; (6b48 <nrf52_errata_103+0x20>)
    6b3e:	5cd0      	ldrb	r0, [r2, r3]
    6b40:	4770      	bx	lr
    6b42:	2000      	movs	r0, #0
    6b44:	4770      	bx	lr
    6b46:	bf00      	nop
    6b48:	0000e5e4 	.word	0x0000e5e4

00006b4c <nvmc_wait>:
    6b4c:	4a02      	ldr	r2, [pc, #8]	; (6b58 <nvmc_wait+0xc>)
    6b4e:	f8d2 3400 	ldr.w	r3, [r2, #1024]	; 0x400
    6b52:	2b00      	cmp	r3, #0
    6b54:	d0fb      	beq.n	6b4e <nvmc_wait+0x2>
    6b56:	4770      	bx	lr
    6b58:	4001e000 	.word	0x4001e000

00006b5c <SystemInit>:
    6b5c:	b510      	push	{r4, lr}
    6b5e:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    6b62:	f8d3 2130 	ldr.w	r2, [r3, #304]	; 0x130
    6b66:	2a08      	cmp	r2, #8
    6b68:	d14e      	bne.n	6c08 <SystemInit+0xac>
    6b6a:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    6b6e:	2100      	movs	r1, #0
    6b70:	f8c2 110c 	str.w	r1, [r2, #268]	; 0x10c
    6b74:	f8c2 1110 	str.w	r1, [r2, #272]	; 0x110
    6b78:	f8c2 1538 	str.w	r1, [r2, #1336]	; 0x538
    6b7c:	f502 4240 	add.w	r2, r2, #49152	; 0xc000
    6b80:	f8d3 1404 	ldr.w	r1, [r3, #1028]	; 0x404
    6b84:	f8c2 1520 	str.w	r1, [r2, #1312]	; 0x520
    6b88:	f8d3 1408 	ldr.w	r1, [r3, #1032]	; 0x408
    6b8c:	f8c2 1524 	str.w	r1, [r2, #1316]	; 0x524
    6b90:	f8d3 140c 	ldr.w	r1, [r3, #1036]	; 0x40c
    6b94:	f8c2 1528 	str.w	r1, [r2, #1320]	; 0x528
    6b98:	f8d3 1410 	ldr.w	r1, [r3, #1040]	; 0x410
    6b9c:	f8c2 152c 	str.w	r1, [r2, #1324]	; 0x52c
    6ba0:	f8d3 1414 	ldr.w	r1, [r3, #1044]	; 0x414
    6ba4:	f8c2 1530 	str.w	r1, [r2, #1328]	; 0x530
    6ba8:	f8d3 1418 	ldr.w	r1, [r3, #1048]	; 0x418
    6bac:	f8c2 1534 	str.w	r1, [r2, #1332]	; 0x534
    6bb0:	f8d3 141c 	ldr.w	r1, [r3, #1052]	; 0x41c
    6bb4:	f8c2 1540 	str.w	r1, [r2, #1344]	; 0x540
    6bb8:	f8d3 1420 	ldr.w	r1, [r3, #1056]	; 0x420
    6bbc:	f8c2 1544 	str.w	r1, [r2, #1348]	; 0x544
    6bc0:	f8d3 1424 	ldr.w	r1, [r3, #1060]	; 0x424
    6bc4:	f8c2 1548 	str.w	r1, [r2, #1352]	; 0x548
    6bc8:	f8d3 1428 	ldr.w	r1, [r3, #1064]	; 0x428
    6bcc:	f8c2 154c 	str.w	r1, [r2, #1356]	; 0x54c
    6bd0:	f8d3 142c 	ldr.w	r1, [r3, #1068]	; 0x42c
    6bd4:	f8c2 1550 	str.w	r1, [r2, #1360]	; 0x550
    6bd8:	f8d3 1430 	ldr.w	r1, [r3, #1072]	; 0x430
    6bdc:	f8c2 1554 	str.w	r1, [r2, #1364]	; 0x554
    6be0:	f8d3 1434 	ldr.w	r1, [r3, #1076]	; 0x434
    6be4:	f8c2 1560 	str.w	r1, [r2, #1376]	; 0x560
    6be8:	f8d3 1438 	ldr.w	r1, [r3, #1080]	; 0x438
    6bec:	f8c2 1564 	str.w	r1, [r2, #1380]	; 0x564
    6bf0:	f8d3 143c 	ldr.w	r1, [r3, #1084]	; 0x43c
    6bf4:	f8c2 1568 	str.w	r1, [r2, #1384]	; 0x568
    6bf8:	f8d3 1440 	ldr.w	r1, [r3, #1088]	; 0x440
    6bfc:	f8c2 156c 	str.w	r1, [r2, #1388]	; 0x56c
    6c00:	f8d3 3444 	ldr.w	r3, [r3, #1092]	; 0x444
    6c04:	f8c2 3570 	str.w	r3, [r2, #1392]	; 0x570
    6c08:	f7ff ff8e 	bl	6b28 <nrf52_errata_103>
    6c0c:	b118      	cbz	r0, 6c16 <SystemInit+0xba>
    6c0e:	4b3b      	ldr	r3, [pc, #236]	; (6cfc <SystemInit+0x1a0>)
    6c10:	4a3b      	ldr	r2, [pc, #236]	; (6d00 <SystemInit+0x1a4>)
    6c12:	f8c3 268c 	str.w	r2, [r3, #1676]	; 0x68c
    6c16:	f7ff ff87 	bl	6b28 <nrf52_errata_103>
    6c1a:	b118      	cbz	r0, 6c24 <SystemInit+0xc8>
    6c1c:	4b39      	ldr	r3, [pc, #228]	; (6d04 <SystemInit+0x1a8>)
    6c1e:	22fb      	movs	r2, #251	; 0xfb
    6c20:	f8c3 2518 	str.w	r2, [r3, #1304]	; 0x518
    6c24:	f7ff ff80 	bl	6b28 <nrf52_errata_103>
    6c28:	b170      	cbz	r0, 6c48 <SystemInit+0xec>
    6c2a:	f04f 4180 	mov.w	r1, #1073741824	; 0x40000000
    6c2e:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    6c32:	f8d1 2ee4 	ldr.w	r2, [r1, #3812]	; 0xee4
    6c36:	f8d3 3258 	ldr.w	r3, [r3, #600]	; 0x258
    6c3a:	f022 020f 	bic.w	r2, r2, #15
    6c3e:	f003 030f 	and.w	r3, r3, #15
    6c42:	4313      	orrs	r3, r2
    6c44:	f8c1 3ee4 	str.w	r3, [r1, #3812]	; 0xee4
    6c48:	f7ff ff6e 	bl	6b28 <nrf52_errata_103>
    6c4c:	b120      	cbz	r0, 6c58 <SystemInit+0xfc>
    6c4e:	4b2e      	ldr	r3, [pc, #184]	; (6d08 <SystemInit+0x1ac>)
    6c50:	f44f 7200 	mov.w	r2, #512	; 0x200
    6c54:	f8c3 2640 	str.w	r2, [r3, #1600]	; 0x640
    6c58:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    6c5c:	f8d3 3130 	ldr.w	r3, [r3, #304]	; 0x130
    6c60:	2b08      	cmp	r3, #8
    6c62:	d11a      	bne.n	6c9a <SystemInit+0x13e>
    6c64:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    6c68:	f8d3 2400 	ldr.w	r2, [r3, #1024]	; 0x400
    6c6c:	07d2      	lsls	r2, r2, #31
    6c6e:	bf44      	itt	mi
    6c70:	f06f 0201 	mvnmi.w	r2, #1
    6c74:	f8c3 2400 	strmi.w	r2, [r3, #1024]	; 0x400
    6c78:	f04f 5380 	mov.w	r3, #268435456	; 0x10000000
    6c7c:	f8d3 3134 	ldr.w	r3, [r3, #308]	; 0x134
    6c80:	2b05      	cmp	r3, #5
    6c82:	d802      	bhi.n	6c8a <SystemInit+0x12e>
    6c84:	4a21      	ldr	r2, [pc, #132]	; (6d0c <SystemInit+0x1b0>)
    6c86:	5cd3      	ldrb	r3, [r2, r3]
    6c88:	b13b      	cbz	r3, 6c9a <SystemInit+0x13e>
    6c8a:	f04f 2310 	mov.w	r3, #268439552	; 0x10001000
    6c8e:	f8d3 2208 	ldr.w	r2, [r3, #520]	; 0x208
    6c92:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    6c96:	f8c3 2558 	str.w	r2, [r3, #1368]	; 0x558
    6c9a:	f04f 2310 	mov.w	r3, #268439552	; 0x10001000
    6c9e:	f8d3 2200 	ldr.w	r2, [r3, #512]	; 0x200
    6ca2:	2a00      	cmp	r2, #0
    6ca4:	db03      	blt.n	6cae <SystemInit+0x152>
    6ca6:	f8d3 3204 	ldr.w	r3, [r3, #516]	; 0x204
    6caa:	2b00      	cmp	r3, #0
    6cac:	da22      	bge.n	6cf4 <SystemInit+0x198>
    6cae:	4918      	ldr	r1, [pc, #96]	; (6d10 <SystemInit+0x1b4>)
    6cb0:	2301      	movs	r3, #1
    6cb2:	f04f 2010 	mov.w	r0, #268439552	; 0x10001000
    6cb6:	f8c1 3504 	str.w	r3, [r1, #1284]	; 0x504
    6cba:	2412      	movs	r4, #18
    6cbc:	f7ff ff46 	bl	6b4c <nvmc_wait>
    6cc0:	f8c0 4200 	str.w	r4, [r0, #512]	; 0x200
    6cc4:	f7ff ff42 	bl	6b4c <nvmc_wait>
    6cc8:	f8c0 4204 	str.w	r4, [r0, #516]	; 0x204
    6ccc:	f7ff ff3e 	bl	6b4c <nvmc_wait>
    6cd0:	2300      	movs	r3, #0
    6cd2:	f8c1 3504 	str.w	r3, [r1, #1284]	; 0x504
    6cd6:	f7ff ff39 	bl	6b4c <nvmc_wait>
    6cda:	f3bf 8f4f 	dsb	sy
    6cde:	490d      	ldr	r1, [pc, #52]	; (6d14 <SystemInit+0x1b8>)
    6ce0:	4b0d      	ldr	r3, [pc, #52]	; (6d18 <SystemInit+0x1bc>)
    6ce2:	68ca      	ldr	r2, [r1, #12]
    6ce4:	f402 62e0 	and.w	r2, r2, #1792	; 0x700
    6ce8:	4313      	orrs	r3, r2
    6cea:	60cb      	str	r3, [r1, #12]
    6cec:	f3bf 8f4f 	dsb	sy
    6cf0:	bf00      	nop
    6cf2:	e7fd      	b.n	6cf0 <SystemInit+0x194>
    6cf4:	4b09      	ldr	r3, [pc, #36]	; (6d1c <SystemInit+0x1c0>)
    6cf6:	4a0a      	ldr	r2, [pc, #40]	; (6d20 <SystemInit+0x1c4>)
    6cf8:	601a      	str	r2, [r3, #0]
    6cfa:	bd10      	pop	{r4, pc}
    6cfc:	40005000 	.word	0x40005000
    6d00:	00038148 	.word	0x00038148
    6d04:	4000f000 	.word	0x4000f000
    6d08:	40029000 	.word	0x40029000
    6d0c:	0000e5de 	.word	0x0000e5de
    6d10:	4001e000 	.word	0x4001e000
    6d14:	e000ed00 	.word	0xe000ed00
    6d18:	05fa0004 	.word	0x05fa0004
    6d1c:	2000017c 	.word	0x2000017c
    6d20:	03d09000 	.word	0x03d09000

00006d24 <nrfx_flag32_alloc>:
    6d24:	b570      	push	{r4, r5, r6, lr}
    6d26:	2501      	movs	r5, #1
    6d28:	6802      	ldr	r2, [r0, #0]
    6d2a:	f3bf 8f5b 	dmb	ish
    6d2e:	fab2 f382 	clz	r3, r2
    6d32:	f1c3 031f 	rsb	r3, r3, #31
    6d36:	b2db      	uxtb	r3, r3
    6d38:	fa05 f403 	lsl.w	r4, r5, r3
    6d3c:	ea22 0404 	bic.w	r4, r2, r4
    6d40:	e850 6f00 	ldrex	r6, [r0]
    6d44:	4296      	cmp	r6, r2
    6d46:	d104      	bne.n	6d52 <nrfx_flag32_alloc+0x2e>
    6d48:	e840 4c00 	strex	ip, r4, [r0]
    6d4c:	f1bc 0f00 	cmp.w	ip, #0
    6d50:	d1f6      	bne.n	6d40 <nrfx_flag32_alloc+0x1c>
    6d52:	f3bf 8f5b 	dmb	ish
    6d56:	d1e7      	bne.n	6d28 <nrfx_flag32_alloc+0x4>
    6d58:	4801      	ldr	r0, [pc, #4]	; (6d60 <nrfx_flag32_alloc+0x3c>)
    6d5a:	700b      	strb	r3, [r1, #0]
    6d5c:	bd70      	pop	{r4, r5, r6, pc}
    6d5e:	bf00      	nop
    6d60:	0bad0000 	.word	0x0bad0000

00006d64 <nrfx_flag32_free>:
    6d64:	b510      	push	{r4, lr}
    6d66:	6803      	ldr	r3, [r0, #0]
    6d68:	40cb      	lsrs	r3, r1
    6d6a:	07db      	lsls	r3, r3, #31
    6d6c:	d414      	bmi.n	6d98 <nrfx_flag32_free+0x34>
    6d6e:	2301      	movs	r3, #1
    6d70:	408b      	lsls	r3, r1
    6d72:	6802      	ldr	r2, [r0, #0]
    6d74:	f3bf 8f5b 	dmb	ish
    6d78:	ea43 0102 	orr.w	r1, r3, r2
    6d7c:	e850 4f00 	ldrex	r4, [r0]
    6d80:	4294      	cmp	r4, r2
    6d82:	d104      	bne.n	6d8e <nrfx_flag32_free+0x2a>
    6d84:	e840 1c00 	strex	ip, r1, [r0]
    6d88:	f1bc 0f00 	cmp.w	ip, #0
    6d8c:	d1f6      	bne.n	6d7c <nrfx_flag32_free+0x18>
    6d8e:	f3bf 8f5b 	dmb	ish
    6d92:	d1ee      	bne.n	6d72 <nrfx_flag32_free+0xe>
    6d94:	4801      	ldr	r0, [pc, #4]	; (6d9c <nrfx_flag32_free+0x38>)
    6d96:	bd10      	pop	{r4, pc}
    6d98:	4801      	ldr	r0, [pc, #4]	; (6da0 <nrfx_flag32_free+0x3c>)
    6d9a:	e7fc      	b.n	6d96 <nrfx_flag32_free+0x32>
    6d9c:	0bad0000 	.word	0x0bad0000
    6da0:	0bad0004 	.word	0x0bad0004

00006da4 <clock_stop>:
    6da4:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    6da6:	4604      	mov	r4, r0
    6da8:	b118      	cbz	r0, 6db2 <clock_stop+0xe>
    6daa:	2801      	cmp	r0, #1
    6dac:	d022      	beq.n	6df4 <clock_stop+0x50>
    6dae:	b003      	add	sp, #12
    6db0:	bdf0      	pop	{r4, r5, r6, r7, pc}
    6db2:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    6db6:	2202      	movs	r2, #2
    6db8:	f8c3 2308 	str.w	r2, [r3, #776]	; 0x308
    6dbc:	f8c3 0104 	str.w	r0, [r3, #260]	; 0x104
    6dc0:	f8d3 2104 	ldr.w	r2, [r3, #260]	; 0x104
    6dc4:	2201      	movs	r2, #1
    6dc6:	60da      	str	r2, [r3, #12]
    6dc8:	4607      	mov	r7, r0
    6dca:	2301      	movs	r3, #1
    6dcc:	f88d 3007 	strb.w	r3, [sp, #7]
    6dd0:	f242 7510 	movw	r5, #10000	; 0x2710
    6dd4:	f04f 4680 	mov.w	r6, #1073741824	; 0x40000000
    6dd8:	b1cc      	cbz	r4, 6e0e <clock_stop+0x6a>
    6dda:	2c01      	cmp	r4, #1
    6ddc:	d1e7      	bne.n	6dae <clock_stop+0xa>
    6dde:	b3c7      	cbz	r7, 6e52 <clock_stop+0xae>
    6de0:	f8d6 340c 	ldr.w	r3, [r6, #1036]	; 0x40c
    6de4:	f003 0301 	and.w	r3, r3, #1
    6de8:	703b      	strb	r3, [r7, #0]
    6dea:	f8d6 340c 	ldr.w	r3, [r6, #1036]	; 0x40c
    6dee:	03da      	lsls	r2, r3, #15
    6df0:	d521      	bpl.n	6e36 <clock_stop+0x92>
    6df2:	e016      	b.n	6e22 <clock_stop+0x7e>
    6df4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    6df8:	2200      	movs	r2, #0
    6dfa:	f8c3 0308 	str.w	r0, [r3, #776]	; 0x308
    6dfe:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
    6e02:	f8d3 2100 	ldr.w	r2, [r3, #256]	; 0x100
    6e06:	6058      	str	r0, [r3, #4]
    6e08:	f10d 0707 	add.w	r7, sp, #7
    6e0c:	e7dd      	b.n	6dca <clock_stop+0x26>
    6e0e:	b1b7      	cbz	r7, 6e3e <clock_stop+0x9a>
    6e10:	f8d6 3418 	ldr.w	r3, [r6, #1048]	; 0x418
    6e14:	f003 0303 	and.w	r3, r3, #3
    6e18:	603b      	str	r3, [r7, #0]
    6e1a:	f8d6 3418 	ldr.w	r3, [r6, #1048]	; 0x418
    6e1e:	03d8      	lsls	r0, r3, #15
    6e20:	d5c5      	bpl.n	6dae <clock_stop+0xa>
    6e22:	f89d 0007 	ldrb.w	r0, [sp, #7]
    6e26:	2801      	cmp	r0, #1
    6e28:	d103      	bne.n	6e32 <clock_stop+0x8e>
    6e2a:	f004 fd3d 	bl	b8a8 <nrfx_busy_wait>
    6e2e:	3d01      	subs	r5, #1
    6e30:	d1d2      	bne.n	6dd8 <clock_stop+0x34>
    6e32:	2c01      	cmp	r4, #1
    6e34:	d1bb      	bne.n	6dae <clock_stop+0xa>
    6e36:	4b0c      	ldr	r3, [pc, #48]	; (6e68 <clock_stop+0xc4>)
    6e38:	2200      	movs	r2, #0
    6e3a:	715a      	strb	r2, [r3, #5]
    6e3c:	e7b7      	b.n	6dae <clock_stop+0xa>
    6e3e:	f8d6 3418 	ldr.w	r3, [r6, #1048]	; 0x418
    6e42:	03d9      	lsls	r1, r3, #15
    6e44:	d5b3      	bpl.n	6dae <clock_stop+0xa>
    6e46:	2001      	movs	r0, #1
    6e48:	f004 fd2e 	bl	b8a8 <nrfx_busy_wait>
    6e4c:	3d01      	subs	r5, #1
    6e4e:	d1f6      	bne.n	6e3e <clock_stop+0x9a>
    6e50:	e7ad      	b.n	6dae <clock_stop+0xa>
    6e52:	f8d6 340c 	ldr.w	r3, [r6, #1036]	; 0x40c
    6e56:	03db      	lsls	r3, r3, #15
    6e58:	d5ed      	bpl.n	6e36 <clock_stop+0x92>
    6e5a:	2001      	movs	r0, #1
    6e5c:	f004 fd24 	bl	b8a8 <nrfx_busy_wait>
    6e60:	3d01      	subs	r5, #1
    6e62:	d1f6      	bne.n	6e52 <clock_stop+0xae>
    6e64:	e7e7      	b.n	6e36 <clock_stop+0x92>
    6e66:	bf00      	nop
    6e68:	20001598 	.word	0x20001598

00006e6c <nrfx_clock_init>:
    6e6c:	4b04      	ldr	r3, [pc, #16]	; (6e80 <nrfx_clock_init+0x14>)
    6e6e:	791a      	ldrb	r2, [r3, #4]
    6e70:	b922      	cbnz	r2, 6e7c <nrfx_clock_init+0x10>
    6e72:	2201      	movs	r2, #1
    6e74:	6018      	str	r0, [r3, #0]
    6e76:	809a      	strh	r2, [r3, #4]
    6e78:	4802      	ldr	r0, [pc, #8]	; (6e84 <nrfx_clock_init+0x18>)
    6e7a:	4770      	bx	lr
    6e7c:	4802      	ldr	r0, [pc, #8]	; (6e88 <nrfx_clock_init+0x1c>)
    6e7e:	4770      	bx	lr
    6e80:	20001598 	.word	0x20001598
    6e84:	0bad0000 	.word	0x0bad0000
    6e88:	0bad000c 	.word	0x0bad000c

00006e8c <nrfx_power_clock_irq_handler>:
    6e8c:	b510      	push	{r4, lr}
    6e8e:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    6e92:	f8d3 2100 	ldr.w	r2, [r3, #256]	; 0x100
    6e96:	b16a      	cbz	r2, 6eb4 <nrfx_power_clock_irq_handler+0x28>
    6e98:	2200      	movs	r2, #0
    6e9a:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
    6e9e:	f8d3 2100 	ldr.w	r2, [r3, #256]	; 0x100
    6ea2:	2201      	movs	r2, #1
    6ea4:	f8c3 2308 	str.w	r2, [r3, #776]	; 0x308
    6ea8:	4b11      	ldr	r3, [pc, #68]	; (6ef0 <nrfx_power_clock_irq_handler+0x64>)
    6eaa:	7958      	ldrb	r0, [r3, #5]
    6eac:	b910      	cbnz	r0, 6eb4 <nrfx_power_clock_irq_handler+0x28>
    6eae:	715a      	strb	r2, [r3, #5]
    6eb0:	681b      	ldr	r3, [r3, #0]
    6eb2:	4798      	blx	r3
    6eb4:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    6eb8:	f8d3 2104 	ldr.w	r2, [r3, #260]	; 0x104
    6ebc:	b172      	cbz	r2, 6edc <nrfx_power_clock_irq_handler+0x50>
    6ebe:	2200      	movs	r2, #0
    6ec0:	f8c3 2104 	str.w	r2, [r3, #260]	; 0x104
    6ec4:	f8d3 2104 	ldr.w	r2, [r3, #260]	; 0x104
    6ec8:	f8d3 2418 	ldr.w	r2, [r3, #1048]	; 0x418
    6ecc:	f8d3 1418 	ldr.w	r1, [r3, #1048]	; 0x418
    6ed0:	0792      	lsls	r2, r2, #30
    6ed2:	d104      	bne.n	6ede <nrfx_power_clock_irq_handler+0x52>
    6ed4:	2201      	movs	r2, #1
    6ed6:	f8c3 2518 	str.w	r2, [r3, #1304]	; 0x518
    6eda:	609a      	str	r2, [r3, #8]
    6edc:	bd10      	pop	{r4, pc}
    6ede:	2202      	movs	r2, #2
    6ee0:	f8c3 2308 	str.w	r2, [r3, #776]	; 0x308
    6ee4:	4b02      	ldr	r3, [pc, #8]	; (6ef0 <nrfx_power_clock_irq_handler+0x64>)
    6ee6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    6eea:	681b      	ldr	r3, [r3, #0]
    6eec:	2001      	movs	r0, #1
    6eee:	4718      	bx	r3
    6ef0:	20001598 	.word	0x20001598

00006ef4 <nrf_gpio_pin_port_decode>:
    6ef4:	6803      	ldr	r3, [r0, #0]
    6ef6:	f003 021f 	and.w	r2, r3, #31
    6efa:	095b      	lsrs	r3, r3, #5
    6efc:	2b01      	cmp	r3, #1
    6efe:	6002      	str	r2, [r0, #0]
    6f00:	4802      	ldr	r0, [pc, #8]	; (6f0c <nrf_gpio_pin_port_decode+0x18>)
    6f02:	bf18      	it	ne
    6f04:	f04f 40a0 	movne.w	r0, #1342177280	; 0x50000000
    6f08:	4770      	bx	lr
    6f0a:	bf00      	nop
    6f0c:	50000300 	.word	0x50000300

00006f10 <pin_in_use_by_te>:
    6f10:	4b03      	ldr	r3, [pc, #12]	; (6f20 <pin_in_use_by_te+0x10>)
    6f12:	3008      	adds	r0, #8
    6f14:	f833 0010 	ldrh.w	r0, [r3, r0, lsl #1]
    6f18:	f3c0 1040 	ubfx	r0, r0, #5, #1
    6f1c:	4770      	bx	lr
    6f1e:	bf00      	nop
    6f20:	20000180 	.word	0x20000180

00006f24 <call_handler>:
    6f24:	b570      	push	{r4, r5, r6, lr}
    6f26:	f100 0308 	add.w	r3, r0, #8
    6f2a:	4c0c      	ldr	r4, [pc, #48]	; (6f5c <call_handler+0x38>)
    6f2c:	f834 3013 	ldrh.w	r3, [r4, r3, lsl #1]
    6f30:	05da      	lsls	r2, r3, #23
    6f32:	4605      	mov	r5, r0
    6f34:	460e      	mov	r6, r1
    6f36:	d507      	bpl.n	6f48 <call_handler+0x24>
    6f38:	f3c3 2343 	ubfx	r3, r3, #9, #4
    6f3c:	eb04 02c3 	add.w	r2, r4, r3, lsl #3
    6f40:	f854 3033 	ldr.w	r3, [r4, r3, lsl #3]
    6f44:	6852      	ldr	r2, [r2, #4]
    6f46:	4798      	blx	r3
    6f48:	68a3      	ldr	r3, [r4, #8]
    6f4a:	b12b      	cbz	r3, 6f58 <call_handler+0x34>
    6f4c:	68e2      	ldr	r2, [r4, #12]
    6f4e:	4631      	mov	r1, r6
    6f50:	4628      	mov	r0, r5
    6f52:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    6f56:	4718      	bx	r3
    6f58:	bd70      	pop	{r4, r5, r6, pc}
    6f5a:	bf00      	nop
    6f5c:	20000180 	.word	0x20000180

00006f60 <release_handler>:
    6f60:	b410      	push	{r4}
    6f62:	4a12      	ldr	r2, [pc, #72]	; (6fac <release_handler+0x4c>)
    6f64:	3008      	adds	r0, #8
    6f66:	f832 3010 	ldrh.w	r3, [r2, r0, lsl #1]
    6f6a:	05d9      	lsls	r1, r3, #23
    6f6c:	d51b      	bpl.n	6fa6 <release_handler+0x46>
    6f6e:	f3c3 2143 	ubfx	r1, r3, #9, #4
    6f72:	f423 53f8 	bic.w	r3, r3, #7936	; 0x1f00
    6f76:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
    6f7a:	f102 040e 	add.w	r4, r2, #14
    6f7e:	2000      	movs	r0, #0
    6f80:	f834 3f02 	ldrh.w	r3, [r4, #2]!
    6f84:	f413 7f80 	tst.w	r3, #256	; 0x100
    6f88:	d003      	beq.n	6f92 <release_handler+0x32>
    6f8a:	f3c3 2343 	ubfx	r3, r3, #9, #4
    6f8e:	4299      	cmp	r1, r3
    6f90:	d009      	beq.n	6fa6 <release_handler+0x46>
    6f92:	3001      	adds	r0, #1
    6f94:	2830      	cmp	r0, #48	; 0x30
    6f96:	d1f3      	bne.n	6f80 <release_handler+0x20>
    6f98:	2300      	movs	r3, #0
    6f9a:	f842 3031 	str.w	r3, [r2, r1, lsl #3]
    6f9e:	4804      	ldr	r0, [pc, #16]	; (6fb0 <release_handler+0x50>)
    6fa0:	bc10      	pop	{r4}
    6fa2:	f7ff bedf 	b.w	6d64 <nrfx_flag32_free>
    6fa6:	bc10      	pop	{r4}
    6fa8:	4770      	bx	lr
    6faa:	bf00      	nop
    6fac:	20000180 	.word	0x20000180
    6fb0:	200001f4 	.word	0x200001f4

00006fb4 <pin_handler_trigger_uninit>:
    6fb4:	b538      	push	{r3, r4, r5, lr}
    6fb6:	4602      	mov	r2, r0
    6fb8:	f7ff ffaa 	bl	6f10 <pin_in_use_by_te>
    6fbc:	4c09      	ldr	r4, [pc, #36]	; (6fe4 <pin_handler_trigger_uninit+0x30>)
    6fbe:	f102 0508 	add.w	r5, r2, #8
    6fc2:	b140      	cbz	r0, 6fd6 <pin_handler_trigger_uninit+0x22>
    6fc4:	f834 3015 	ldrh.w	r3, [r4, r5, lsl #1]
    6fc8:	4907      	ldr	r1, [pc, #28]	; (6fe8 <pin_handler_trigger_uninit+0x34>)
    6fca:	0b5b      	lsrs	r3, r3, #13
    6fcc:	f503 73a2 	add.w	r3, r3, #324	; 0x144
    6fd0:	2000      	movs	r0, #0
    6fd2:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
    6fd6:	4610      	mov	r0, r2
    6fd8:	f7ff ffc2 	bl	6f60 <release_handler>
    6fdc:	2300      	movs	r3, #0
    6fde:	f824 3015 	strh.w	r3, [r4, r5, lsl #1]
    6fe2:	bd38      	pop	{r3, r4, r5, pc}
    6fe4:	20000180 	.word	0x20000180
    6fe8:	40006000 	.word	0x40006000

00006fec <nrfx_gpiote_input_configure>:
    6fec:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
    6ff0:	4604      	mov	r4, r0
    6ff2:	4616      	mov	r6, r2
    6ff4:	461d      	mov	r5, r3
    6ff6:	b301      	cbz	r1, 703a <nrfx_gpiote_input_configure+0x4e>
    6ff8:	4f4e      	ldr	r7, [pc, #312]	; (7134 <nrfx_gpiote_input_configure+0x148>)
    6ffa:	f100 0808 	add.w	r8, r0, #8
    6ffe:	f837 3018 	ldrh.w	r3, [r7, r8, lsl #1]
    7002:	079b      	lsls	r3, r3, #30
    7004:	d502      	bpl.n	700c <nrfx_gpiote_input_configure+0x20>
    7006:	f7ff ff83 	bl	6f10 <pin_in_use_by_te>
    700a:	bb10      	cbnz	r0, 7052 <nrfx_gpiote_input_configure+0x66>
    700c:	2300      	movs	r3, #0
    700e:	e9cd 3300 	strd	r3, r3, [sp]
    7012:	f88d 300e 	strb.w	r3, [sp, #14]
    7016:	f88d 300f 	strb.w	r3, [sp, #15]
    701a:	f10d 020f 	add.w	r2, sp, #15
    701e:	460b      	mov	r3, r1
    7020:	4620      	mov	r0, r4
    7022:	f10d 010e 	add.w	r1, sp, #14
    7026:	f004 fc8c 	bl	b942 <nrf_gpio_reconfigure>
    702a:	f837 3018 	ldrh.w	r3, [r7, r8, lsl #1]
    702e:	f023 0302 	bic.w	r3, r3, #2
    7032:	f043 0301 	orr.w	r3, r3, #1
    7036:	f827 3018 	strh.w	r3, [r7, r8, lsl #1]
    703a:	b346      	cbz	r6, 708e <nrfx_gpiote_input_configure+0xa2>
    703c:	4b3d      	ldr	r3, [pc, #244]	; (7134 <nrfx_gpiote_input_configure+0x148>)
    703e:	f896 c000 	ldrb.w	ip, [r6]
    7042:	6872      	ldr	r2, [r6, #4]
    7044:	f104 0708 	add.w	r7, r4, #8
    7048:	f833 1017 	ldrh.w	r1, [r3, r7, lsl #1]
    704c:	0788      	lsls	r0, r1, #30
    704e:	d502      	bpl.n	7056 <nrfx_gpiote_input_configure+0x6a>
    7050:	b1aa      	cbz	r2, 707e <nrfx_gpiote_input_configure+0x92>
    7052:	4839      	ldr	r0, [pc, #228]	; (7138 <nrfx_gpiote_input_configure+0x14c>)
    7054:	e01d      	b.n	7092 <nrfx_gpiote_input_configure+0xa6>
    7056:	f021 0120 	bic.w	r1, r1, #32
    705a:	04c9      	lsls	r1, r1, #19
    705c:	0cc9      	lsrs	r1, r1, #19
    705e:	f823 1017 	strh.w	r1, [r3, r7, lsl #1]
    7062:	b162      	cbz	r2, 707e <nrfx_gpiote_input_configure+0x92>
    7064:	f1bc 0f03 	cmp.w	ip, #3
    7068:	d8f3      	bhi.n	7052 <nrfx_gpiote_input_configure+0x66>
    706a:	6872      	ldr	r2, [r6, #4]
    706c:	7816      	ldrb	r6, [r2, #0]
    706e:	f1bc 0f00 	cmp.w	ip, #0
    7072:	d111      	bne.n	7098 <nrfx_gpiote_input_configure+0xac>
    7074:	4a31      	ldr	r2, [pc, #196]	; (713c <nrfx_gpiote_input_configure+0x150>)
    7076:	f506 76a2 	add.w	r6, r6, #324	; 0x144
    707a:	f842 c026 	str.w	ip, [r2, r6, lsl #2]
    707e:	f833 2017 	ldrh.w	r2, [r3, r7, lsl #1]
    7082:	f022 021c 	bic.w	r2, r2, #28
    7086:	ea42 028c 	orr.w	r2, r2, ip, lsl #2
    708a:	f823 2017 	strh.w	r2, [r3, r7, lsl #1]
    708e:	bb45      	cbnz	r5, 70e2 <nrfx_gpiote_input_configure+0xf6>
    7090:	482b      	ldr	r0, [pc, #172]	; (7140 <nrfx_gpiote_input_configure+0x154>)
    7092:	b004      	add	sp, #16
    7094:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    7098:	00b2      	lsls	r2, r6, #2
    709a:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    709e:	f502 42c0 	add.w	r2, r2, #24576	; 0x6000
    70a2:	ea41 3146 	orr.w	r1, r1, r6, lsl #13
    70a6:	f8d2 0510 	ldr.w	r0, [r2, #1296]	; 0x510
    70aa:	f020 0003 	bic.w	r0, r0, #3
    70ae:	f8c2 0510 	str.w	r0, [r2, #1296]	; 0x510
    70b2:	f8d2 0510 	ldr.w	r0, [r2, #1296]	; 0x510
    70b6:	f420 304f 	bic.w	r0, r0, #211968	; 0x33c00
    70ba:	f420 7040 	bic.w	r0, r0, #768	; 0x300
    70be:	f8c2 0510 	str.w	r0, [r2, #1296]	; 0x510
    70c2:	0220      	lsls	r0, r4, #8
    70c4:	f8d2 e510 	ldr.w	lr, [r2, #1296]	; 0x510
    70c8:	f400 507c 	and.w	r0, r0, #16128	; 0x3f00
    70cc:	ea40 400c 	orr.w	r0, r0, ip, lsl #16
    70d0:	ea40 000e 	orr.w	r0, r0, lr
    70d4:	f041 0120 	orr.w	r1, r1, #32
    70d8:	f823 1017 	strh.w	r1, [r3, r7, lsl #1]
    70dc:	f8c2 0510 	str.w	r0, [r2, #1296]	; 0x510
    70e0:	e7cd      	b.n	707e <nrfx_gpiote_input_configure+0x92>
    70e2:	e9d5 6700 	ldrd	r6, r7, [r5]
    70e6:	4620      	mov	r0, r4
    70e8:	f7ff ff3a 	bl	6f60 <release_handler>
    70ec:	2e00      	cmp	r6, #0
    70ee:	d0cf      	beq.n	7090 <nrfx_gpiote_input_configure+0xa4>
    70f0:	4d10      	ldr	r5, [pc, #64]	; (7134 <nrfx_gpiote_input_configure+0x148>)
    70f2:	e9d5 2300 	ldrd	r2, r3, [r5]
    70f6:	4296      	cmp	r6, r2
    70f8:	d101      	bne.n	70fe <nrfx_gpiote_input_configure+0x112>
    70fa:	429f      	cmp	r7, r3
    70fc:	d018      	beq.n	7130 <nrfx_gpiote_input_configure+0x144>
    70fe:	4811      	ldr	r0, [pc, #68]	; (7144 <nrfx_gpiote_input_configure+0x158>)
    7100:	f10d 010f 	add.w	r1, sp, #15
    7104:	f7ff fe0e 	bl	6d24 <nrfx_flag32_alloc>
    7108:	4b0d      	ldr	r3, [pc, #52]	; (7140 <nrfx_gpiote_input_configure+0x154>)
    710a:	4298      	cmp	r0, r3
    710c:	d1c1      	bne.n	7092 <nrfx_gpiote_input_configure+0xa6>
    710e:	f89d 200f 	ldrb.w	r2, [sp, #15]
    7112:	f845 6032 	str.w	r6, [r5, r2, lsl #3]
    7116:	eb05 03c2 	add.w	r3, r5, r2, lsl #3
    711a:	3408      	adds	r4, #8
    711c:	605f      	str	r7, [r3, #4]
    711e:	f835 3014 	ldrh.w	r3, [r5, r4, lsl #1]
    7122:	ea43 2342 	orr.w	r3, r3, r2, lsl #9
    7126:	f443 7380 	orr.w	r3, r3, #256	; 0x100
    712a:	f825 3014 	strh.w	r3, [r5, r4, lsl #1]
    712e:	e7af      	b.n	7090 <nrfx_gpiote_input_configure+0xa4>
    7130:	2200      	movs	r2, #0
    7132:	e7ee      	b.n	7112 <nrfx_gpiote_input_configure+0x126>
    7134:	20000180 	.word	0x20000180
    7138:	0bad0004 	.word	0x0bad0004
    713c:	40006000 	.word	0x40006000
    7140:	0bad0000 	.word	0x0bad0000
    7144:	200001f4 	.word	0x200001f4

00007148 <nrfx_gpiote_output_configure>:
    7148:	b5f0      	push	{r4, r5, r6, r7, lr}
    714a:	4604      	mov	r4, r0
    714c:	b085      	sub	sp, #20
    714e:	4615      	mov	r5, r2
    7150:	b319      	cbz	r1, 719a <nrfx_gpiote_output_configure+0x52>
    7152:	4e33      	ldr	r6, [pc, #204]	; (7220 <nrfx_gpiote_output_configure+0xd8>)
    7154:	f100 0708 	add.w	r7, r0, #8
    7158:	f836 2017 	ldrh.w	r2, [r6, r7, lsl #1]
    715c:	0793      	lsls	r3, r2, #30
    715e:	d403      	bmi.n	7168 <nrfx_gpiote_output_configure+0x20>
    7160:	f7ff fed6 	bl	6f10 <pin_in_use_by_te>
    7164:	2800      	cmp	r0, #0
    7166:	d158      	bne.n	721a <nrfx_gpiote_output_configure+0xd2>
    7168:	f012 0f1c 	tst.w	r2, #28
    716c:	d002      	beq.n	7174 <nrfx_gpiote_output_configure+0x2c>
    716e:	784b      	ldrb	r3, [r1, #1]
    7170:	2b01      	cmp	r3, #1
    7172:	d052      	beq.n	721a <nrfx_gpiote_output_configure+0xd2>
    7174:	2301      	movs	r3, #1
    7176:	f88d 300f 	strb.w	r3, [sp, #15]
    717a:	2300      	movs	r3, #0
    717c:	e9cd 1300 	strd	r1, r3, [sp]
    7180:	1c4a      	adds	r2, r1, #1
    7182:	1c8b      	adds	r3, r1, #2
    7184:	4620      	mov	r0, r4
    7186:	f10d 010f 	add.w	r1, sp, #15
    718a:	f004 fbda 	bl	b942 <nrf_gpio_reconfigure>
    718e:	f836 3017 	ldrh.w	r3, [r6, r7, lsl #1]
    7192:	f043 0303 	orr.w	r3, r3, #3
    7196:	f826 3017 	strh.w	r3, [r6, r7, lsl #1]
    719a:	b915      	cbnz	r5, 71a2 <nrfx_gpiote_output_configure+0x5a>
    719c:	4821      	ldr	r0, [pc, #132]	; (7224 <nrfx_gpiote_output_configure+0xdc>)
    719e:	b005      	add	sp, #20
    71a0:	bdf0      	pop	{r4, r5, r6, r7, pc}
    71a2:	4e1f      	ldr	r6, [pc, #124]	; (7220 <nrfx_gpiote_output_configure+0xd8>)
    71a4:	f104 0708 	add.w	r7, r4, #8
    71a8:	f836 0017 	ldrh.w	r0, [r6, r7, lsl #1]
    71ac:	0783      	lsls	r3, r0, #30
    71ae:	d534      	bpl.n	721a <nrfx_gpiote_output_configure+0xd2>
    71b0:	f895 c000 	ldrb.w	ip, [r5]
    71b4:	4661      	mov	r1, ip
    71b6:	0089      	lsls	r1, r1, #2
    71b8:	f020 0020 	bic.w	r0, r0, #32
    71bc:	f101 4180 	add.w	r1, r1, #1073741824	; 0x40000000
    71c0:	04c0      	lsls	r0, r0, #19
    71c2:	f501 41c0 	add.w	r1, r1, #24576	; 0x6000
    71c6:	0cc0      	lsrs	r0, r0, #19
    71c8:	f826 0017 	strh.w	r0, [r6, r7, lsl #1]
    71cc:	2300      	movs	r3, #0
    71ce:	f8c1 3510 	str.w	r3, [r1, #1296]	; 0x510
    71d2:	786a      	ldrb	r2, [r5, #1]
    71d4:	2a00      	cmp	r2, #0
    71d6:	d0e1      	beq.n	719c <nrfx_gpiote_output_configure+0x54>
    71d8:	f8d1 3510 	ldr.w	r3, [r1, #1296]	; 0x510
    71dc:	78ad      	ldrb	r5, [r5, #2]
    71de:	f423 1399 	bic.w	r3, r3, #1253376	; 0x132000
    71e2:	f423 53f8 	bic.w	r3, r3, #7936	; 0x1f00
    71e6:	f8c1 3510 	str.w	r3, [r1, #1296]	; 0x510
    71ea:	f8d1 e510 	ldr.w	lr, [r1, #1296]	; 0x510
    71ee:	0223      	lsls	r3, r4, #8
    71f0:	f403 537c 	and.w	r3, r3, #16128	; 0x3f00
    71f4:	0412      	lsls	r2, r2, #16
    71f6:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
    71fa:	ea43 030e 	orr.w	r3, r3, lr
    71fe:	4313      	orrs	r3, r2
    7200:	052a      	lsls	r2, r5, #20
    7202:	f402 1280 	and.w	r2, r2, #1048576	; 0x100000
    7206:	ea40 304c 	orr.w	r0, r0, ip, lsl #13
    720a:	4313      	orrs	r3, r2
    720c:	f040 0020 	orr.w	r0, r0, #32
    7210:	f826 0017 	strh.w	r0, [r6, r7, lsl #1]
    7214:	f8c1 3510 	str.w	r3, [r1, #1296]	; 0x510
    7218:	e7c0      	b.n	719c <nrfx_gpiote_output_configure+0x54>
    721a:	4803      	ldr	r0, [pc, #12]	; (7228 <nrfx_gpiote_output_configure+0xe0>)
    721c:	e7bf      	b.n	719e <nrfx_gpiote_output_configure+0x56>
    721e:	bf00      	nop
    7220:	20000180 	.word	0x20000180
    7224:	0bad0000 	.word	0x0bad0000
    7228:	0bad0004 	.word	0x0bad0004

0000722c <nrfx_gpiote_global_callback_set>:
    722c:	4b01      	ldr	r3, [pc, #4]	; (7234 <nrfx_gpiote_global_callback_set+0x8>)
    722e:	e9c3 0102 	strd	r0, r1, [r3, #8]
    7232:	4770      	bx	lr
    7234:	20000180 	.word	0x20000180

00007238 <nrfx_gpiote_channel_get>:
    7238:	b508      	push	{r3, lr}
    723a:	4602      	mov	r2, r0
    723c:	f7ff fe68 	bl	6f10 <pin_in_use_by_te>
    7240:	b138      	cbz	r0, 7252 <nrfx_gpiote_channel_get+0x1a>
    7242:	4b05      	ldr	r3, [pc, #20]	; (7258 <nrfx_gpiote_channel_get+0x20>)
    7244:	4805      	ldr	r0, [pc, #20]	; (725c <nrfx_gpiote_channel_get+0x24>)
    7246:	3208      	adds	r2, #8
    7248:	f833 3012 	ldrh.w	r3, [r3, r2, lsl #1]
    724c:	0b5b      	lsrs	r3, r3, #13
    724e:	700b      	strb	r3, [r1, #0]
    7250:	bd08      	pop	{r3, pc}
    7252:	4803      	ldr	r0, [pc, #12]	; (7260 <nrfx_gpiote_channel_get+0x28>)
    7254:	e7fc      	b.n	7250 <nrfx_gpiote_channel_get+0x18>
    7256:	bf00      	nop
    7258:	20000180 	.word	0x20000180
    725c:	0bad0000 	.word	0x0bad0000
    7260:	0bad0004 	.word	0x0bad0004

00007264 <nrfx_gpiote_init>:
    7264:	b538      	push	{r3, r4, r5, lr}
    7266:	4c0f      	ldr	r4, [pc, #60]	; (72a4 <nrfx_gpiote_init+0x40>)
    7268:	f894 5078 	ldrb.w	r5, [r4, #120]	; 0x78
    726c:	b9bd      	cbnz	r5, 729e <nrfx_gpiote_init+0x3a>
    726e:	2260      	movs	r2, #96	; 0x60
    7270:	4629      	mov	r1, r5
    7272:	f104 0010 	add.w	r0, r4, #16
    7276:	f004 ff79 	bl	c16c <memset>
    727a:	2006      	movs	r0, #6
    727c:	f7fe f856 	bl	532c <arch_irq_enable>
    7280:	4b09      	ldr	r3, [pc, #36]	; (72a8 <nrfx_gpiote_init+0x44>)
    7282:	480a      	ldr	r0, [pc, #40]	; (72ac <nrfx_gpiote_init+0x48>)
    7284:	f8c3 517c 	str.w	r5, [r3, #380]	; 0x17c
    7288:	f8d3 217c 	ldr.w	r2, [r3, #380]	; 0x17c
    728c:	f04f 4200 	mov.w	r2, #2147483648	; 0x80000000
    7290:	f8c3 2304 	str.w	r2, [r3, #772]	; 0x304
    7294:	2301      	movs	r3, #1
    7296:	f884 3078 	strb.w	r3, [r4, #120]	; 0x78
    729a:	6763      	str	r3, [r4, #116]	; 0x74
    729c:	bd38      	pop	{r3, r4, r5, pc}
    729e:	4804      	ldr	r0, [pc, #16]	; (72b0 <nrfx_gpiote_init+0x4c>)
    72a0:	e7fc      	b.n	729c <nrfx_gpiote_init+0x38>
    72a2:	bf00      	nop
    72a4:	20000180 	.word	0x20000180
    72a8:	40006000 	.word	0x40006000
    72ac:	0bad0000 	.word	0x0bad0000
    72b0:	0bad0005 	.word	0x0bad0005

000072b4 <nrfx_gpiote_is_init>:
    72b4:	4b03      	ldr	r3, [pc, #12]	; (72c4 <nrfx_gpiote_is_init+0x10>)
    72b6:	f893 0078 	ldrb.w	r0, [r3, #120]	; 0x78
    72ba:	3800      	subs	r0, #0
    72bc:	bf18      	it	ne
    72be:	2001      	movne	r0, #1
    72c0:	4770      	bx	lr
    72c2:	bf00      	nop
    72c4:	20000180 	.word	0x20000180

000072c8 <nrfx_gpiote_channel_free>:
    72c8:	4601      	mov	r1, r0
    72ca:	4801      	ldr	r0, [pc, #4]	; (72d0 <nrfx_gpiote_channel_free+0x8>)
    72cc:	f7ff bd4a 	b.w	6d64 <nrfx_flag32_free>
    72d0:	200001f0 	.word	0x200001f0

000072d4 <nrfx_gpiote_channel_alloc>:
    72d4:	4601      	mov	r1, r0
    72d6:	4801      	ldr	r0, [pc, #4]	; (72dc <nrfx_gpiote_channel_alloc+0x8>)
    72d8:	f7ff bd24 	b.w	6d24 <nrfx_flag32_alloc>
    72dc:	200001f0 	.word	0x200001f0

000072e0 <nrfx_gpiote_trigger_enable>:
    72e0:	b537      	push	{r0, r1, r2, r4, r5, lr}
    72e2:	4604      	mov	r4, r0
    72e4:	f7ff fe14 	bl	6f10 <pin_in_use_by_te>
    72e8:	f104 0208 	add.w	r2, r4, #8
    72ec:	4b1e      	ldr	r3, [pc, #120]	; (7368 <nrfx_gpiote_trigger_enable+0x88>)
    72ee:	f833 3012 	ldrh.w	r3, [r3, r2, lsl #1]
    72f2:	b1e8      	cbz	r0, 7330 <nrfx_gpiote_trigger_enable+0x50>
    72f4:	f013 0502 	ands.w	r5, r3, #2
    72f8:	d11a      	bne.n	7330 <nrfx_gpiote_trigger_enable+0x50>
    72fa:	0b5b      	lsrs	r3, r3, #13
    72fc:	009a      	lsls	r2, r3, #2
    72fe:	f102 4080 	add.w	r0, r2, #1073741824	; 0x40000000
    7302:	f500 40c2 	add.w	r0, r0, #24832	; 0x6100
    7306:	f102 4280 	add.w	r2, r2, #1073741824	; 0x40000000
    730a:	f502 42c0 	add.w	r2, r2, #24576	; 0x6000
    730e:	6005      	str	r5, [r0, #0]
    7310:	6800      	ldr	r0, [r0, #0]
    7312:	f8d2 0510 	ldr.w	r0, [r2, #1296]	; 0x510
    7316:	f040 0001 	orr.w	r0, r0, #1
    731a:	f8c2 0510 	str.w	r0, [r2, #1296]	; 0x510
    731e:	b129      	cbz	r1, 732c <nrfx_gpiote_trigger_enable+0x4c>
    7320:	2201      	movs	r2, #1
    7322:	fa02 f303 	lsl.w	r3, r2, r3
    7326:	4a11      	ldr	r2, [pc, #68]	; (736c <nrfx_gpiote_trigger_enable+0x8c>)
    7328:	f8c2 3304 	str.w	r3, [r2, #772]	; 0x304
    732c:	b003      	add	sp, #12
    732e:	bd30      	pop	{r4, r5, pc}
    7330:	f3c3 0382 	ubfx	r3, r3, #2, #3
    7334:	2b04      	cmp	r3, #4
    7336:	d012      	beq.n	735e <nrfx_gpiote_trigger_enable+0x7e>
    7338:	2b05      	cmp	r3, #5
    733a:	d012      	beq.n	7362 <nrfx_gpiote_trigger_enable+0x82>
    733c:	a801      	add	r0, sp, #4
    733e:	9401      	str	r4, [sp, #4]
    7340:	f7ff fdd8 	bl	6ef4 <nrf_gpio_pin_port_decode>
    7344:	9b01      	ldr	r3, [sp, #4]
    7346:	f8d0 1510 	ldr.w	r1, [r0, #1296]	; 0x510
    734a:	40d9      	lsrs	r1, r3
    734c:	f001 0101 	and.w	r1, r1, #1
    7350:	3102      	adds	r1, #2
    7352:	4620      	mov	r0, r4
    7354:	b003      	add	sp, #12
    7356:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
    735a:	f004 bb3b 	b.w	b9d4 <nrf_gpio_cfg_sense_set>
    735e:	2103      	movs	r1, #3
    7360:	e7f7      	b.n	7352 <nrfx_gpiote_trigger_enable+0x72>
    7362:	2102      	movs	r1, #2
    7364:	e7f5      	b.n	7352 <nrfx_gpiote_trigger_enable+0x72>
    7366:	bf00      	nop
    7368:	20000180 	.word	0x20000180
    736c:	40006000 	.word	0x40006000

00007370 <nrfx_gpiote_trigger_disable>:
    7370:	b508      	push	{r3, lr}
    7372:	4602      	mov	r2, r0
    7374:	f7ff fdcc 	bl	6f10 <pin_in_use_by_te>
    7378:	b1c0      	cbz	r0, 73ac <nrfx_gpiote_trigger_disable+0x3c>
    737a:	f102 0108 	add.w	r1, r2, #8
    737e:	4b0e      	ldr	r3, [pc, #56]	; (73b8 <nrfx_gpiote_trigger_disable+0x48>)
    7380:	f833 3011 	ldrh.w	r3, [r3, r1, lsl #1]
    7384:	0799      	lsls	r1, r3, #30
    7386:	d411      	bmi.n	73ac <nrfx_gpiote_trigger_disable+0x3c>
    7388:	0b5b      	lsrs	r3, r3, #13
    738a:	2201      	movs	r2, #1
    738c:	409a      	lsls	r2, r3
    738e:	009b      	lsls	r3, r3, #2
    7390:	490a      	ldr	r1, [pc, #40]	; (73bc <nrfx_gpiote_trigger_disable+0x4c>)
    7392:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    7396:	f503 43c0 	add.w	r3, r3, #24576	; 0x6000
    739a:	f8c1 2308 	str.w	r2, [r1, #776]	; 0x308
    739e:	f8d3 2510 	ldr.w	r2, [r3, #1296]	; 0x510
    73a2:	f022 0203 	bic.w	r2, r2, #3
    73a6:	f8c3 2510 	str.w	r2, [r3, #1296]	; 0x510
    73aa:	bd08      	pop	{r3, pc}
    73ac:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    73b0:	2100      	movs	r1, #0
    73b2:	4610      	mov	r0, r2
    73b4:	f004 bb0e 	b.w	b9d4 <nrf_gpio_cfg_sense_set>
    73b8:	20000180 	.word	0x20000180
    73bc:	40006000 	.word	0x40006000

000073c0 <nrfx_gpiote_pin_uninit>:
    73c0:	b513      	push	{r0, r1, r4, lr}
    73c2:	4b0e      	ldr	r3, [pc, #56]	; (73fc <nrfx_gpiote_pin_uninit+0x3c>)
    73c4:	f100 0208 	add.w	r2, r0, #8
    73c8:	4604      	mov	r4, r0
    73ca:	f833 3012 	ldrh.w	r3, [r3, r2, lsl #1]
    73ce:	07db      	lsls	r3, r3, #31
    73d0:	d511      	bpl.n	73f6 <nrfx_gpiote_pin_uninit+0x36>
    73d2:	f7ff ffcd 	bl	7370 <nrfx_gpiote_trigger_disable>
    73d6:	4620      	mov	r0, r4
    73d8:	f7ff fdec 	bl	6fb4 <pin_handler_trigger_uninit>
    73dc:	a801      	add	r0, sp, #4
    73de:	9401      	str	r4, [sp, #4]
    73e0:	f7ff fd88 	bl	6ef4 <nrf_gpio_pin_port_decode>
    73e4:	9b01      	ldr	r3, [sp, #4]
    73e6:	f503 73e0 	add.w	r3, r3, #448	; 0x1c0
    73ea:	2202      	movs	r2, #2
    73ec:	f840 2023 	str.w	r2, [r0, r3, lsl #2]
    73f0:	4803      	ldr	r0, [pc, #12]	; (7400 <nrfx_gpiote_pin_uninit+0x40>)
    73f2:	b002      	add	sp, #8
    73f4:	bd10      	pop	{r4, pc}
    73f6:	4803      	ldr	r0, [pc, #12]	; (7404 <nrfx_gpiote_pin_uninit+0x44>)
    73f8:	e7fb      	b.n	73f2 <nrfx_gpiote_pin_uninit+0x32>
    73fa:	bf00      	nop
    73fc:	20000180 	.word	0x20000180
    7400:	0bad0000 	.word	0x0bad0000
    7404:	0bad0004 	.word	0x0bad0004

00007408 <nrfx_gpiote_irq_handler>:
    7408:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    740c:	4b68      	ldr	r3, [pc, #416]	; (75b0 <nrfx_gpiote_irq_handler+0x1a8>)
    740e:	4869      	ldr	r0, [pc, #420]	; (75b4 <nrfx_gpiote_irq_handler+0x1ac>)
    7410:	4969      	ldr	r1, [pc, #420]	; (75b8 <nrfx_gpiote_irq_handler+0x1b0>)
    7412:	2600      	movs	r6, #0
    7414:	b087      	sub	sp, #28
    7416:	2201      	movs	r2, #1
    7418:	4634      	mov	r4, r6
    741a:	681d      	ldr	r5, [r3, #0]
    741c:	b135      	cbz	r5, 742c <nrfx_gpiote_irq_handler+0x24>
    741e:	f8d0 5304 	ldr.w	r5, [r0, #772]	; 0x304
    7422:	4215      	tst	r5, r2
    7424:	bf1e      	ittt	ne
    7426:	601c      	strne	r4, [r3, #0]
    7428:	681d      	ldrne	r5, [r3, #0]
    742a:	4316      	orrne	r6, r2
    742c:	3304      	adds	r3, #4
    742e:	428b      	cmp	r3, r1
    7430:	ea4f 0242 	mov.w	r2, r2, lsl #1
    7434:	d1f1      	bne.n	741a <nrfx_gpiote_irq_handler+0x12>
    7436:	f8df 917c 	ldr.w	r9, [pc, #380]	; 75b4 <nrfx_gpiote_irq_handler+0x1ac>
    743a:	f8d9 317c 	ldr.w	r3, [r9, #380]	; 0x17c
    743e:	2b00      	cmp	r3, #0
    7440:	f000 8099 	beq.w	7576 <nrfx_gpiote_irq_handler+0x16e>
    7444:	f04f 43a0 	mov.w	r3, #1342177280	; 0x50000000
    7448:	f8d3 2520 	ldr.w	r2, [r3, #1312]	; 0x520
    744c:	9204      	str	r2, [sp, #16]
    744e:	f8c3 2520 	str.w	r2, [r3, #1312]	; 0x520
    7452:	f8d3 2820 	ldr.w	r2, [r3, #2080]	; 0x820
    7456:	9205      	str	r2, [sp, #20]
    7458:	f8c3 2820 	str.w	r2, [r3, #2080]	; 0x820
    745c:	f04f 0800 	mov.w	r8, #0
    7460:	f10d 0a10 	add.w	sl, sp, #16
    7464:	ea4f 1348 	mov.w	r3, r8, lsl #5
    7468:	9300      	str	r3, [sp, #0]
    746a:	f04f 0b01 	mov.w	fp, #1
    746e:	e049      	b.n	7504 <nrfx_gpiote_irq_handler+0xfc>
    7470:	9b00      	ldr	r3, [sp, #0]
    7472:	4a52      	ldr	r2, [pc, #328]	; (75bc <nrfx_gpiote_irq_handler+0x1b4>)
    7474:	fa94 f4a4 	rbit	r4, r4
    7478:	fab4 f484 	clz	r4, r4
    747c:	441c      	add	r4, r3
    747e:	08e0      	lsrs	r0, r4, #3
    7480:	f104 0308 	add.w	r3, r4, #8
    7484:	9403      	str	r4, [sp, #12]
    7486:	f832 7013 	ldrh.w	r7, [r2, r3, lsl #1]
    748a:	f81a 3000 	ldrb.w	r3, [sl, r0]
    748e:	f004 0207 	and.w	r2, r4, #7
    7492:	fa0b f202 	lsl.w	r2, fp, r2
    7496:	ea23 0302 	bic.w	r3, r3, r2
    749a:	f80a 3000 	strb.w	r3, [sl, r0]
    749e:	a803      	add	r0, sp, #12
    74a0:	f7ff fd28 	bl	6ef4 <nrf_gpio_pin_port_decode>
    74a4:	9b03      	ldr	r3, [sp, #12]
    74a6:	f503 73e0 	add.w	r3, r3, #448	; 0x1c0
    74aa:	08b9      	lsrs	r1, r7, #2
    74ac:	f850 3023 	ldr.w	r3, [r0, r3, lsl #2]
    74b0:	f3c7 0582 	ubfx	r5, r7, #2, #3
    74b4:	074a      	lsls	r2, r1, #29
    74b6:	462f      	mov	r7, r5
    74b8:	f3c3 4301 	ubfx	r3, r3, #16, #2
    74bc:	d52c      	bpl.n	7518 <nrfx_gpiote_irq_handler+0x110>
    74be:	4620      	mov	r0, r4
    74c0:	4639      	mov	r1, r7
    74c2:	b2dd      	uxtb	r5, r3
    74c4:	f7ff fd2e 	bl	6f24 <call_handler>
    74c8:	a803      	add	r0, sp, #12
    74ca:	9403      	str	r4, [sp, #12]
    74cc:	f7ff fd12 	bl	6ef4 <nrf_gpio_pin_port_decode>
    74d0:	9b03      	ldr	r3, [sp, #12]
    74d2:	f503 73e0 	add.w	r3, r3, #448	; 0x1c0
    74d6:	f850 3023 	ldr.w	r3, [r0, r3, lsl #2]
    74da:	f3c3 4301 	ubfx	r3, r3, #16, #2
    74de:	429d      	cmp	r5, r3
    74e0:	d107      	bne.n	74f2 <nrfx_gpiote_irq_handler+0xea>
    74e2:	2100      	movs	r1, #0
    74e4:	4620      	mov	r0, r4
    74e6:	f004 fa75 	bl	b9d4 <nrf_gpio_cfg_sense_set>
    74ea:	4629      	mov	r1, r5
    74ec:	4620      	mov	r0, r4
    74ee:	f004 fa71 	bl	b9d4 <nrf_gpio_cfg_sense_set>
    74f2:	a803      	add	r0, sp, #12
    74f4:	9403      	str	r4, [sp, #12]
    74f6:	f7ff fcfd 	bl	6ef4 <nrf_gpio_pin_port_decode>
    74fa:	9b03      	ldr	r3, [sp, #12]
    74fc:	fa0b f303 	lsl.w	r3, fp, r3
    7500:	f8c0 3520 	str.w	r3, [r0, #1312]	; 0x520
    7504:	f85a 4028 	ldr.w	r4, [sl, r8, lsl #2]
    7508:	2c00      	cmp	r4, #0
    750a:	d1b1      	bne.n	7470 <nrfx_gpiote_irq_handler+0x68>
    750c:	f1b8 0f00 	cmp.w	r8, #0
    7510:	d11d      	bne.n	754e <nrfx_gpiote_irq_handler+0x146>
    7512:	f04f 0801 	mov.w	r8, #1
    7516:	e7a5      	b.n	7464 <nrfx_gpiote_irq_handler+0x5c>
    7518:	2b02      	cmp	r3, #2
    751a:	d10c      	bne.n	7536 <nrfx_gpiote_irq_handler+0x12e>
    751c:	2103      	movs	r1, #3
    751e:	4620      	mov	r0, r4
    7520:	f004 fa58 	bl	b9d4 <nrf_gpio_cfg_sense_set>
    7524:	f005 0305 	and.w	r3, r5, #5
    7528:	2b01      	cmp	r3, #1
    752a:	d1e2      	bne.n	74f2 <nrfx_gpiote_irq_handler+0xea>
    752c:	4639      	mov	r1, r7
    752e:	4620      	mov	r0, r4
    7530:	f7ff fcf8 	bl	6f24 <call_handler>
    7534:	e7dd      	b.n	74f2 <nrfx_gpiote_irq_handler+0xea>
    7536:	2102      	movs	r1, #2
    7538:	4620      	mov	r0, r4
    753a:	9301      	str	r3, [sp, #4]
    753c:	f004 fa4a 	bl	b9d4 <nrf_gpio_cfg_sense_set>
    7540:	2d03      	cmp	r5, #3
    7542:	d0f3      	beq.n	752c <nrfx_gpiote_irq_handler+0x124>
    7544:	9b01      	ldr	r3, [sp, #4]
    7546:	2b03      	cmp	r3, #3
    7548:	d1d3      	bne.n	74f2 <nrfx_gpiote_irq_handler+0xea>
    754a:	2d02      	cmp	r5, #2
    754c:	e7ed      	b.n	752a <nrfx_gpiote_irq_handler+0x122>
    754e:	f04f 42a0 	mov.w	r2, #1342177280	; 0x50000000
    7552:	f8c9 417c 	str.w	r4, [r9, #380]	; 0x17c
    7556:	f8d9 317c 	ldr.w	r3, [r9, #380]	; 0x17c
    755a:	4919      	ldr	r1, [pc, #100]	; (75c0 <nrfx_gpiote_irq_handler+0x1b8>)
    755c:	f8d2 3520 	ldr.w	r3, [r2, #1312]	; 0x520
    7560:	9304      	str	r3, [sp, #16]
    7562:	f8c2 3520 	str.w	r3, [r2, #1312]	; 0x520
    7566:	f8d1 2520 	ldr.w	r2, [r1, #1312]	; 0x520
    756a:	9205      	str	r2, [sp, #20]
    756c:	4313      	orrs	r3, r2
    756e:	f8c1 2520 	str.w	r2, [r1, #1312]	; 0x520
    7572:	f47f af73 	bne.w	745c <nrfx_gpiote_irq_handler+0x54>
    7576:	2401      	movs	r4, #1
    7578:	b916      	cbnz	r6, 7580 <nrfx_gpiote_irq_handler+0x178>
    757a:	b007      	add	sp, #28
    757c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    7580:	fa96 f3a6 	rbit	r3, r6
    7584:	fab3 f383 	clz	r3, r3
    7588:	fa04 f203 	lsl.w	r2, r4, r3
    758c:	009b      	lsls	r3, r3, #2
    758e:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    7592:	f503 43c0 	add.w	r3, r3, #24576	; 0x6000
    7596:	ea26 0602 	bic.w	r6, r6, r2
    759a:	f8d3 0510 	ldr.w	r0, [r3, #1296]	; 0x510
    759e:	f8d3 1510 	ldr.w	r1, [r3, #1296]	; 0x510
    75a2:	f3c0 2005 	ubfx	r0, r0, #8, #6
    75a6:	f3c1 4101 	ubfx	r1, r1, #16, #2
    75aa:	f7ff fcbb 	bl	6f24 <call_handler>
    75ae:	e7e3      	b.n	7578 <nrfx_gpiote_irq_handler+0x170>
    75b0:	40006100 	.word	0x40006100
    75b4:	40006000 	.word	0x40006000
    75b8:	40006120 	.word	0x40006120
    75bc:	20000180 	.word	0x20000180
    75c0:	50000300 	.word	0x50000300

000075c4 <nrfx_ppi_channel_alloc>:
    75c4:	4601      	mov	r1, r0
    75c6:	4801      	ldr	r0, [pc, #4]	; (75cc <nrfx_ppi_channel_alloc+0x8>)
    75c8:	f7ff bbac 	b.w	6d24 <nrfx_flag32_alloc>
    75cc:	200001fc 	.word	0x200001fc

000075d0 <_DoInit>:
    75d0:	4b14      	ldr	r3, [pc, #80]	; (7624 <_DoInit+0x54>)
    75d2:	4915      	ldr	r1, [pc, #84]	; (7628 <_DoInit+0x58>)
    75d4:	2203      	movs	r2, #3
    75d6:	611a      	str	r2, [r3, #16]
    75d8:	615a      	str	r2, [r3, #20]
    75da:	4a14      	ldr	r2, [pc, #80]	; (762c <_DoInit+0x5c>)
    75dc:	6199      	str	r1, [r3, #24]
    75de:	61da      	str	r2, [r3, #28]
    75e0:	f44f 6280 	mov.w	r2, #1024	; 0x400
    75e4:	621a      	str	r2, [r3, #32]
    75e6:	2200      	movs	r2, #0
    75e8:	629a      	str	r2, [r3, #40]	; 0x28
    75ea:	625a      	str	r2, [r3, #36]	; 0x24
    75ec:	62da      	str	r2, [r3, #44]	; 0x2c
    75ee:	6619      	str	r1, [r3, #96]	; 0x60
    75f0:	490f      	ldr	r1, [pc, #60]	; (7630 <_DoInit+0x60>)
    75f2:	6659      	str	r1, [r3, #100]	; 0x64
    75f4:	2110      	movs	r1, #16
    75f6:	6699      	str	r1, [r3, #104]	; 0x68
    75f8:	671a      	str	r2, [r3, #112]	; 0x70
    75fa:	66da      	str	r2, [r3, #108]	; 0x6c
    75fc:	675a      	str	r2, [r3, #116]	; 0x74
    75fe:	4a0d      	ldr	r2, [pc, #52]	; (7634 <_DoInit+0x64>)
    7600:	6812      	ldr	r2, [r2, #0]
    7602:	f8c3 2007 	str.w	r2, [r3, #7]
    7606:	f3bf 8f5f 	dmb	sy
    760a:	4a0b      	ldr	r2, [pc, #44]	; (7638 <_DoInit+0x68>)
    760c:	6810      	ldr	r0, [r2, #0]
    760e:	8892      	ldrh	r2, [r2, #4]
    7610:	6018      	str	r0, [r3, #0]
    7612:	809a      	strh	r2, [r3, #4]
    7614:	f3bf 8f5f 	dmb	sy
    7618:	2220      	movs	r2, #32
    761a:	719a      	strb	r2, [r3, #6]
    761c:	f3bf 8f5f 	dmb	sy
    7620:	4770      	bx	lr
    7622:	bf00      	nop
    7624:	200015a0 	.word	0x200015a0
    7628:	0000e60a 	.word	0x0000e60a
    762c:	20001907 	.word	0x20001907
    7630:	200018f7 	.word	0x200018f7
    7634:	0000e613 	.word	0x0000e613
    7638:	0000e617 	.word	0x0000e617

0000763c <device_visitor>:
    763c:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    7640:	f8df b048 	ldr.w	fp, [pc, #72]	; 768c <device_visitor+0x50>
    7644:	4d12      	ldr	r5, [pc, #72]	; (7690 <device_visitor+0x54>)
    7646:	469a      	mov	sl, r3
    7648:	eba5 050b 	sub.w	r5, r5, fp
    764c:	4b11      	ldr	r3, [pc, #68]	; (7694 <device_visitor+0x58>)
    764e:	10ed      	asrs	r5, r5, #3
    7650:	4680      	mov	r8, r0
    7652:	460f      	mov	r7, r1
    7654:	4691      	mov	r9, r2
    7656:	435d      	muls	r5, r3
    7658:	2600      	movs	r6, #0
    765a:	42be      	cmp	r6, r7
    765c:	d102      	bne.n	7664 <device_visitor+0x28>
    765e:	4630      	mov	r0, r6
    7660:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    7664:	f938 4016 	ldrsh.w	r4, [r8, r6, lsl #1]
    7668:	2c00      	cmp	r4, #0
    766a:	dd0d      	ble.n	7688 <device_visitor+0x4c>
    766c:	42a5      	cmp	r5, r4
    766e:	d30b      	bcc.n	7688 <device_visitor+0x4c>
    7670:	3c01      	subs	r4, #1
    7672:	b224      	sxth	r4, r4
    7674:	eb04 0444 	add.w	r4, r4, r4, lsl #1
    7678:	eb0b 00c4 	add.w	r0, fp, r4, lsl #3
    767c:	4651      	mov	r1, sl
    767e:	47c8      	blx	r9
    7680:	2800      	cmp	r0, #0
    7682:	dbed      	blt.n	7660 <device_visitor+0x24>
    7684:	3601      	adds	r6, #1
    7686:	e7e8      	b.n	765a <device_visitor+0x1e>
    7688:	2000      	movs	r0, #0
    768a:	e7f7      	b.n	767c <device_visitor+0x40>
    768c:	0000c858 	.word	0x0000c858
    7690:	0000c8d0 	.word	0x0000c8d0
    7694:	aaaaaaab 	.word	0xaaaaaaab

00007698 <z_device_get_all_static>:
    7698:	4a03      	ldr	r2, [pc, #12]	; (76a8 <z_device_get_all_static+0x10>)
    769a:	4b04      	ldr	r3, [pc, #16]	; (76ac <z_device_get_all_static+0x14>)
    769c:	6002      	str	r2, [r0, #0]
    769e:	1a9b      	subs	r3, r3, r2
    76a0:	4803      	ldr	r0, [pc, #12]	; (76b0 <z_device_get_all_static+0x18>)
    76a2:	10db      	asrs	r3, r3, #3
    76a4:	4358      	muls	r0, r3
    76a6:	4770      	bx	lr
    76a8:	0000c858 	.word	0x0000c858
    76ac:	0000c8d0 	.word	0x0000c8d0
    76b0:	aaaaaaab 	.word	0xaaaaaaab

000076b4 <z_impl_z_errno>:
    76b4:	4b01      	ldr	r3, [pc, #4]	; (76bc <z_impl_z_errno+0x8>)
    76b6:	6898      	ldr	r0, [r3, #8]
    76b8:	3098      	adds	r0, #152	; 0x98
    76ba:	4770      	bx	lr
    76bc:	20001648 	.word	0x20001648

000076c0 <z_sys_init_run_level>:
    76c0:	4b0f      	ldr	r3, [pc, #60]	; (7700 <z_sys_init_run_level+0x40>)
    76c2:	b570      	push	{r4, r5, r6, lr}
    76c4:	f853 4020 	ldr.w	r4, [r3, r0, lsl #2]
    76c8:	3001      	adds	r0, #1
    76ca:	f853 6020 	ldr.w	r6, [r3, r0, lsl #2]
    76ce:	42a6      	cmp	r6, r4
    76d0:	d800      	bhi.n	76d4 <z_sys_init_run_level+0x14>
    76d2:	bd70      	pop	{r4, r5, r6, pc}
    76d4:	e9d4 3500 	ldrd	r3, r5, [r4]
    76d8:	4628      	mov	r0, r5
    76da:	4798      	blx	r3
    76dc:	b16d      	cbz	r5, 76fa <z_sys_init_run_level+0x3a>
    76de:	b138      	cbz	r0, 76f0 <z_sys_init_run_level+0x30>
    76e0:	2800      	cmp	r0, #0
    76e2:	bfb8      	it	lt
    76e4:	4240      	neglt	r0, r0
    76e6:	68eb      	ldr	r3, [r5, #12]
    76e8:	28ff      	cmp	r0, #255	; 0xff
    76ea:	bfa8      	it	ge
    76ec:	20ff      	movge	r0, #255	; 0xff
    76ee:	7018      	strb	r0, [r3, #0]
    76f0:	68ea      	ldr	r2, [r5, #12]
    76f2:	7853      	ldrb	r3, [r2, #1]
    76f4:	f043 0301 	orr.w	r3, r3, #1
    76f8:	7053      	strb	r3, [r2, #1]
    76fa:	3408      	adds	r4, #8
    76fc:	e7e7      	b.n	76ce <z_sys_init_run_level+0xe>
    76fe:	bf00      	nop
    7700:	0000d448 	.word	0x0000d448

00007704 <bg_thread_main>:
    7704:	b508      	push	{r3, lr}
    7706:	4b0a      	ldr	r3, [pc, #40]	; (7730 <bg_thread_main+0x2c>)
    7708:	2201      	movs	r2, #1
    770a:	2003      	movs	r0, #3
    770c:	701a      	strb	r2, [r3, #0]
    770e:	f7ff ffd7 	bl	76c0 <z_sys_init_run_level>
    7712:	f001 f8f5 	bl	8900 <boot_banner>
    7716:	2004      	movs	r0, #4
    7718:	f7ff ffd2 	bl	76c0 <z_sys_init_run_level>
    771c:	f000 fa2c 	bl	7b78 <z_init_static_threads>
    7720:	f7fa fb7c 	bl	1e1c <main>
    7724:	4a03      	ldr	r2, [pc, #12]	; (7734 <bg_thread_main+0x30>)
    7726:	7b13      	ldrb	r3, [r2, #12]
    7728:	f023 0301 	bic.w	r3, r3, #1
    772c:	7313      	strb	r3, [r2, #12]
    772e:	bd08      	pop	{r3, pc}
    7730:	20001d07 	.word	0x20001d07
    7734:	20000600 	.word	0x20000600

00007738 <z_bss_zero>:
    7738:	b508      	push	{r3, lr}
    773a:	4803      	ldr	r0, [pc, #12]	; (7748 <z_bss_zero+0x10>)
    773c:	4a03      	ldr	r2, [pc, #12]	; (774c <z_bss_zero+0x14>)
    773e:	2100      	movs	r1, #0
    7740:	1a12      	subs	r2, r2, r0
    7742:	f004 f99c 	bl	ba7e <z_early_memset>
    7746:	bd08      	pop	{r3, pc}
    7748:	20000380 	.word	0x20000380
    774c:	20001d08 	.word	0x20001d08

00007750 <z_init_cpu>:
    7750:	b570      	push	{r4, r5, r6, lr}
    7752:	4e17      	ldr	r6, [pc, #92]	; (77b0 <z_init_cpu+0x60>)
    7754:	4d17      	ldr	r5, [pc, #92]	; (77b4 <z_init_cpu+0x64>)
    7756:	4918      	ldr	r1, [pc, #96]	; (77b8 <z_init_cpu+0x68>)
    7758:	b086      	sub	sp, #24
    775a:	23b8      	movs	r3, #184	; 0xb8
    775c:	fb03 6600 	mla	r6, r3, r0, r6
    7760:	4b16      	ldr	r3, [pc, #88]	; (77bc <z_init_cpu+0x6c>)
    7762:	9305      	str	r3, [sp, #20]
    7764:	2201      	movs	r2, #1
    7766:	230f      	movs	r3, #15
    7768:	e9cd 3203 	strd	r3, r2, [sp, #12]
    776c:	2300      	movs	r3, #0
    776e:	e9cd 3301 	strd	r3, r3, [sp, #4]
    7772:	2318      	movs	r3, #24
    7774:	fb03 5500 	mla	r5, r3, r0, r5
    7778:	4604      	mov	r4, r0
    777a:	f44f 70c0 	mov.w	r0, #384	; 0x180
    777e:	fb00 1104 	mla	r1, r0, r4, r1
    7782:	4b0f      	ldr	r3, [pc, #60]	; (77c0 <z_init_cpu+0x70>)
    7784:	9500      	str	r5, [sp, #0]
    7786:	f44f 72a0 	mov.w	r2, #320	; 0x140
    778a:	4630      	mov	r0, r6
    778c:	f000 f962 	bl	7a54 <z_setup_new_thread>
    7790:	7b73      	ldrb	r3, [r6, #13]
    7792:	4a0c      	ldr	r2, [pc, #48]	; (77c4 <z_init_cpu+0x74>)
    7794:	60ee      	str	r6, [r5, #12]
    7796:	f023 0304 	bic.w	r3, r3, #4
    779a:	7373      	strb	r3, [r6, #13]
    779c:	f44f 6304 	mov.w	r3, #2112	; 0x840
    77a0:	fb04 3303 	mla	r3, r4, r3, r3
    77a4:	4413      	add	r3, r2
    77a6:	752c      	strb	r4, [r5, #20]
    77a8:	606b      	str	r3, [r5, #4]
    77aa:	b006      	add	sp, #24
    77ac:	bd70      	pop	{r4, r5, r6, pc}
    77ae:	bf00      	nop
    77b0:	20000548 	.word	0x20000548
    77b4:	20001648 	.word	0x20001648
    77b8:	20003600 	.word	0x20003600
    77bc:	0000e61e 	.word	0x0000e61e
    77c0:	00007c39 	.word	0x00007c39
    77c4:	20002dc0 	.word	0x20002dc0

000077c8 <z_cstart>:
    77c8:	b580      	push	{r7, lr}
    77ca:	2000      	movs	r0, #0
    77cc:	b0b4      	sub	sp, #208	; 0xd0
    77ce:	f7ff ff77 	bl	76c0 <z_sys_init_run_level>
    77d2:	4b2e      	ldr	r3, [pc, #184]	; (788c <z_cstart+0xc4>)
    77d4:	f383 8808 	msr	MSP, r3
    77d8:	4d2d      	ldr	r5, [pc, #180]	; (7890 <z_cstart+0xc8>)
    77da:	4e2e      	ldr	r6, [pc, #184]	; (7894 <z_cstart+0xcc>)
    77dc:	696b      	ldr	r3, [r5, #20]
    77de:	4f2e      	ldr	r7, [pc, #184]	; (7898 <z_cstart+0xd0>)
    77e0:	f443 7300 	orr.w	r3, r3, #512	; 0x200
    77e4:	616b      	str	r3, [r5, #20]
    77e6:	2400      	movs	r4, #0
    77e8:	23e0      	movs	r3, #224	; 0xe0
    77ea:	f885 3022 	strb.w	r3, [r5, #34]	; 0x22
    77ee:	77ec      	strb	r4, [r5, #31]
    77f0:	762c      	strb	r4, [r5, #24]
    77f2:	766c      	strb	r4, [r5, #25]
    77f4:	76ac      	strb	r4, [r5, #26]
    77f6:	f885 4020 	strb.w	r4, [r5, #32]
    77fa:	6a6b      	ldr	r3, [r5, #36]	; 0x24
    77fc:	f443 23e0 	orr.w	r3, r3, #458752	; 0x70000
    7800:	626b      	str	r3, [r5, #36]	; 0x24
    7802:	f885 4023 	strb.w	r4, [r5, #35]	; 0x23
    7806:	f7fd ffaf 	bl	5768 <z_arm_fault_init>
    780a:	f7fd fd6f 	bl	52ec <z_arm_cpu_idle_init>
    780e:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    7812:	62ab      	str	r3, [r5, #40]	; 0x28
    7814:	62eb      	str	r3, [r5, #44]	; 0x2c
    7816:	ad06      	add	r5, sp, #24
    7818:	f7fe f8ea 	bl	59f0 <z_arm_mpu_init>
    781c:	f7fe f84e 	bl	58bc <z_arm_configure_static_mpu_regions>
    7820:	f240 1301 	movw	r3, #257	; 0x101
    7824:	4628      	mov	r0, r5
    7826:	f8ad 3024 	strh.w	r3, [sp, #36]	; 0x24
    782a:	e9cd 442d 	strd	r4, r4, [sp, #180]	; 0xb4
    782e:	f001 f861 	bl	88f4 <k_thread_system_pool_assign>
    7832:	60b5      	str	r5, [r6, #8]
    7834:	f004 f8e4 	bl	ba00 <z_device_state_init>
    7838:	2001      	movs	r0, #1
    783a:	f7ff ff41 	bl	76c0 <z_sys_init_run_level>
    783e:	2002      	movs	r0, #2
    7840:	4d16      	ldr	r5, [pc, #88]	; (789c <z_cstart+0xd4>)
    7842:	f7ff ff3d 	bl	76c0 <z_sys_init_run_level>
    7846:	f000 fd53 	bl	82f0 <z_sched_init>
    784a:	4b15      	ldr	r3, [pc, #84]	; (78a0 <z_cstart+0xd8>)
    784c:	61f5      	str	r5, [r6, #28]
    784e:	9305      	str	r3, [sp, #20]
    7850:	2301      	movs	r3, #1
    7852:	4914      	ldr	r1, [pc, #80]	; (78a4 <z_cstart+0xdc>)
    7854:	9400      	str	r4, [sp, #0]
    7856:	e9cd 4303 	strd	r4, r3, [sp, #12]
    785a:	f44f 6280 	mov.w	r2, #1024	; 0x400
    785e:	463b      	mov	r3, r7
    7860:	e9cd 4401 	strd	r4, r4, [sp, #4]
    7864:	4628      	mov	r0, r5
    7866:	f000 f8f5 	bl	7a54 <z_setup_new_thread>
    786a:	7b6a      	ldrb	r2, [r5, #13]
    786c:	4606      	mov	r6, r0
    786e:	f022 0204 	bic.w	r2, r2, #4
    7872:	4628      	mov	r0, r5
    7874:	736a      	strb	r2, [r5, #13]
    7876:	f004 f9ea 	bl	bc4e <z_ready_thread>
    787a:	4620      	mov	r0, r4
    787c:	f7ff ff68 	bl	7750 <z_init_cpu>
    7880:	463a      	mov	r2, r7
    7882:	4631      	mov	r1, r6
    7884:	4628      	mov	r0, r5
    7886:	f7fd fe31 	bl	54ec <arch_switch_to_main_thread>
    788a:	bf00      	nop
    788c:	20003600 	.word	0x20003600
    7890:	e000ed00 	.word	0xe000ed00
    7894:	20001648 	.word	0x20001648
    7898:	00007705 	.word	0x00007705
    789c:	20000600 	.word	0x20000600
    78a0:	0000e623 	.word	0x0000e623
    78a4:	20003780 	.word	0x20003780

000078a8 <init_mem_slab_module>:
    78a8:	b538      	push	{r3, r4, r5, lr}
    78aa:	4c06      	ldr	r4, [pc, #24]	; (78c4 <init_mem_slab_module+0x1c>)
    78ac:	4d06      	ldr	r5, [pc, #24]	; (78c8 <init_mem_slab_module+0x20>)
    78ae:	2000      	movs	r0, #0
    78b0:	42ac      	cmp	r4, r5
    78b2:	d300      	bcc.n	78b6 <init_mem_slab_module+0xe>
    78b4:	bd38      	pop	{r3, r4, r5, pc}
    78b6:	4620      	mov	r0, r4
    78b8:	f004 f8e5 	bl	ba86 <create_free_list>
    78bc:	2800      	cmp	r0, #0
    78be:	dbf9      	blt.n	78b4 <init_mem_slab_module+0xc>
    78c0:	341c      	adds	r4, #28
    78c2:	e7f5      	b.n	78b0 <init_mem_slab_module+0x8>
    78c4:	200002de 	.word	0x200002de
    78c8:	200002de 	.word	0x200002de

000078cc <k_mem_slab_alloc>:
    78cc:	b573      	push	{r0, r1, r4, r5, r6, lr}
    78ce:	460c      	mov	r4, r1
    78d0:	f04f 0520 	mov.w	r5, #32
    78d4:	f3ef 8111 	mrs	r1, BASEPRI
    78d8:	f385 8812 	msr	BASEPRI_MAX, r5
    78dc:	f3bf 8f6f 	isb	sy
    78e0:	6945      	ldr	r5, [r0, #20]
    78e2:	b15d      	cbz	r5, 78fc <k_mem_slab_alloc+0x30>
    78e4:	6025      	str	r5, [r4, #0]
    78e6:	682b      	ldr	r3, [r5, #0]
    78e8:	6143      	str	r3, [r0, #20]
    78ea:	6983      	ldr	r3, [r0, #24]
    78ec:	3301      	adds	r3, #1
    78ee:	6183      	str	r3, [r0, #24]
    78f0:	2000      	movs	r0, #0
    78f2:	f381 8811 	msr	BASEPRI, r1
    78f6:	f3bf 8f6f 	isb	sy
    78fa:	e011      	b.n	7920 <k_mem_slab_alloc+0x54>
    78fc:	ea52 0603 	orrs.w	r6, r2, r3
    7900:	d103      	bne.n	790a <k_mem_slab_alloc+0x3e>
    7902:	6025      	str	r5, [r4, #0]
    7904:	f06f 000b 	mvn.w	r0, #11
    7908:	e7f3      	b.n	78f2 <k_mem_slab_alloc+0x26>
    790a:	e9cd 2300 	strd	r2, r3, [sp]
    790e:	4602      	mov	r2, r0
    7910:	3008      	adds	r0, #8
    7912:	f000 fbf7 	bl	8104 <z_pend_curr>
    7916:	b918      	cbnz	r0, 7920 <k_mem_slab_alloc+0x54>
    7918:	4b02      	ldr	r3, [pc, #8]	; (7924 <k_mem_slab_alloc+0x58>)
    791a:	689b      	ldr	r3, [r3, #8]
    791c:	695b      	ldr	r3, [r3, #20]
    791e:	6023      	str	r3, [r4, #0]
    7920:	b002      	add	sp, #8
    7922:	bd70      	pop	{r4, r5, r6, pc}
    7924:	20001648 	.word	0x20001648

00007928 <k_thread_foreach>:
    7928:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    792a:	4605      	mov	r5, r0
    792c:	460e      	mov	r6, r1
    792e:	f04f 0320 	mov.w	r3, #32
    7932:	f3ef 8711 	mrs	r7, BASEPRI
    7936:	f383 8812 	msr	BASEPRI_MAX, r3
    793a:	f3bf 8f6f 	isb	sy
    793e:	4b06      	ldr	r3, [pc, #24]	; (7958 <k_thread_foreach+0x30>)
    7940:	6a9c      	ldr	r4, [r3, #40]	; 0x28
    7942:	b924      	cbnz	r4, 794e <k_thread_foreach+0x26>
    7944:	f387 8811 	msr	BASEPRI, r7
    7948:	f3bf 8f6f 	isb	sy
    794c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    794e:	4620      	mov	r0, r4
    7950:	4631      	mov	r1, r6
    7952:	47a8      	blx	r5
    7954:	6f64      	ldr	r4, [r4, #116]	; 0x74
    7956:	e7f4      	b.n	7942 <k_thread_foreach+0x1a>
    7958:	20001648 	.word	0x20001648

0000795c <z_thread_monitor_exit>:
    795c:	f04f 0320 	mov.w	r3, #32
    7960:	f3ef 8111 	mrs	r1, BASEPRI
    7964:	f383 8812 	msr	BASEPRI_MAX, r3
    7968:	f3bf 8f6f 	isb	sy
    796c:	4a09      	ldr	r2, [pc, #36]	; (7994 <z_thread_monitor_exit+0x38>)
    796e:	6a93      	ldr	r3, [r2, #40]	; 0x28
    7970:	4283      	cmp	r3, r0
    7972:	d107      	bne.n	7984 <z_thread_monitor_exit+0x28>
    7974:	6f5b      	ldr	r3, [r3, #116]	; 0x74
    7976:	6293      	str	r3, [r2, #40]	; 0x28
    7978:	f381 8811 	msr	BASEPRI, r1
    797c:	f3bf 8f6f 	isb	sy
    7980:	4770      	bx	lr
    7982:	4613      	mov	r3, r2
    7984:	2b00      	cmp	r3, #0
    7986:	d0f7      	beq.n	7978 <z_thread_monitor_exit+0x1c>
    7988:	6f5a      	ldr	r2, [r3, #116]	; 0x74
    798a:	4282      	cmp	r2, r0
    798c:	d1f9      	bne.n	7982 <z_thread_monitor_exit+0x26>
    798e:	6f42      	ldr	r2, [r0, #116]	; 0x74
    7990:	675a      	str	r2, [r3, #116]	; 0x74
    7992:	e7f1      	b.n	7978 <z_thread_monitor_exit+0x1c>
    7994:	20001648 	.word	0x20001648

00007998 <z_impl_k_thread_name_set>:
    7998:	b510      	push	{r4, lr}
    799a:	4604      	mov	r4, r0
    799c:	b908      	cbnz	r0, 79a2 <z_impl_k_thread_name_set+0xa>
    799e:	4b05      	ldr	r3, [pc, #20]	; (79b4 <z_impl_k_thread_name_set+0x1c>)
    79a0:	689c      	ldr	r4, [r3, #8]
    79a2:	221f      	movs	r2, #31
    79a4:	f104 0078 	add.w	r0, r4, #120	; 0x78
    79a8:	f004 fc42 	bl	c230 <strncpy>
    79ac:	2000      	movs	r0, #0
    79ae:	f884 0097 	strb.w	r0, [r4, #151]	; 0x97
    79b2:	bd10      	pop	{r4, pc}
    79b4:	20001648 	.word	0x20001648

000079b8 <k_thread_state_str>:
    79b8:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    79bc:	460c      	mov	r4, r1
    79be:	2900      	cmp	r1, #0
    79c0:	d03d      	beq.n	7a3e <k_thread_state_str+0x86>
    79c2:	2a00      	cmp	r2, #0
    79c4:	d03b      	beq.n	7a3e <k_thread_state_str+0x86>
    79c6:	7b47      	ldrb	r7, [r0, #13]
    79c8:	1e56      	subs	r6, r2, #1
    79ca:	4608      	mov	r0, r1
    79cc:	b38f      	cbz	r7, 7a32 <k_thread_state_str+0x7a>
    79ce:	f04f 0b00 	mov.w	fp, #0
    79d2:	f8df 9070 	ldr.w	r9, [pc, #112]	; 7a44 <k_thread_state_str+0x8c>
    79d6:	f8df a070 	ldr.w	sl, [pc, #112]	; 7a48 <k_thread_state_str+0x90>
    79da:	465d      	mov	r5, fp
    79dc:	fa5f f18b 	uxtb.w	r1, fp
    79e0:	f04f 0801 	mov.w	r8, #1
    79e4:	fa08 f801 	lsl.w	r8, r8, r1
    79e8:	ea17 0f08 	tst.w	r7, r8
    79ec:	d01d      	beq.n	7a2a <k_thread_state_str+0x72>
    79ee:	f859 3021 	ldr.w	r3, [r9, r1, lsl #2]
    79f2:	f85a 1021 	ldr.w	r1, [sl, r1, lsl #2]
    79f6:	1b72      	subs	r2, r6, r5
    79f8:	429a      	cmp	r2, r3
    79fa:	bf28      	it	cs
    79fc:	461a      	movcs	r2, r3
    79fe:	9201      	str	r2, [sp, #4]
    7a00:	f004 fb8c 	bl	c11c <memcpy>
    7a04:	9a01      	ldr	r2, [sp, #4]
    7a06:	ea37 0708 	bics.w	r7, r7, r8
    7a0a:	4415      	add	r5, r2
    7a0c:	eb04 0005 	add.w	r0, r4, r5
    7a10:	d00f      	beq.n	7a32 <k_thread_state_str+0x7a>
    7a12:	eba6 0805 	sub.w	r8, r6, r5
    7a16:	f1b8 0f01 	cmp.w	r8, #1
    7a1a:	bf28      	it	cs
    7a1c:	f04f 0801 	movcs.w	r8, #1
    7a20:	490a      	ldr	r1, [pc, #40]	; (7a4c <k_thread_state_str+0x94>)
    7a22:	4642      	mov	r2, r8
    7a24:	f004 fb7a 	bl	c11c <memcpy>
    7a28:	4445      	add	r5, r8
    7a2a:	f10b 0b01 	add.w	fp, fp, #1
    7a2e:	1960      	adds	r0, r4, r5
    7a30:	e7d4      	b.n	79dc <k_thread_state_str+0x24>
    7a32:	2300      	movs	r3, #0
    7a34:	7003      	strb	r3, [r0, #0]
    7a36:	4620      	mov	r0, r4
    7a38:	b003      	add	sp, #12
    7a3a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    7a3e:	4804      	ldr	r0, [pc, #16]	; (7a50 <k_thread_state_str+0x98>)
    7a40:	e7fa      	b.n	7a38 <k_thread_state_str+0x80>
    7a42:	bf00      	nop
    7a44:	0000d460 	.word	0x0000d460
    7a48:	0000d480 	.word	0x0000d480
    7a4c:	0000e62b 	.word	0x0000e62b
    7a50:	0000d6db 	.word	0x0000d6db

00007a54 <z_setup_new_thread>:
    7a54:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    7a58:	b085      	sub	sp, #20
    7a5a:	4698      	mov	r8, r3
    7a5c:	f100 0358 	add.w	r3, r0, #88	; 0x58
    7a60:	e9c0 3316 	strd	r3, r3, [r0, #88]	; 0x58
    7a64:	9b12      	ldr	r3, [sp, #72]	; 0x48
    7a66:	7303      	strb	r3, [r0, #12]
    7a68:	3207      	adds	r2, #7
    7a6a:	2304      	movs	r3, #4
    7a6c:	f022 0a07 	bic.w	sl, r2, #7
    7a70:	7343      	strb	r3, [r0, #13]
    7a72:	9b11      	ldr	r3, [sp, #68]	; 0x44
    7a74:	7383      	strb	r3, [r0, #14]
    7a76:	2500      	movs	r5, #0
    7a78:	f101 0340 	add.w	r3, r1, #64	; 0x40
    7a7c:	f10a 0740 	add.w	r7, sl, #64	; 0x40
    7a80:	4604      	mov	r4, r0
    7a82:	e9c0 5506 	strd	r5, r5, [r0, #24]
    7a86:	460e      	mov	r6, r1
    7a88:	6085      	str	r5, [r0, #8]
    7a8a:	73c5      	strb	r5, [r0, #15]
    7a8c:	440f      	add	r7, r1
    7a8e:	4652      	mov	r2, sl
    7a90:	21aa      	movs	r1, #170	; 0xaa
    7a92:	4618      	mov	r0, r3
    7a94:	f8dd b038 	ldr.w	fp, [sp, #56]	; 0x38
    7a98:	f8dd 904c 	ldr.w	r9, [sp, #76]	; 0x4c
    7a9c:	f004 fb66 	bl	c16c <memset>
    7aa0:	9b10      	ldr	r3, [sp, #64]	; 0x40
    7aa2:	f8c4 50a4 	str.w	r5, [r4, #164]	; 0xa4
    7aa6:	e9c4 0a27 	strd	r0, sl, [r4, #156]	; 0x9c
    7aaa:	9302      	str	r3, [sp, #8]
    7aac:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
    7aae:	463a      	mov	r2, r7
    7ab0:	e9cd b300 	strd	fp, r3, [sp]
    7ab4:	4631      	mov	r1, r6
    7ab6:	4643      	mov	r3, r8
    7ab8:	4620      	mov	r0, r4
    7aba:	f7fd fce3 	bl	5484 <arch_new_thread>
    7abe:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
    7ac0:	66e3      	str	r3, [r4, #108]	; 0x6c
    7ac2:	9b10      	ldr	r3, [sp, #64]	; 0x40
    7ac4:	6565      	str	r5, [r4, #84]	; 0x54
    7ac6:	e9c4 8b19 	strd	r8, fp, [r4, #100]	; 0x64
    7aca:	6723      	str	r3, [r4, #112]	; 0x70
    7acc:	f04f 0220 	mov.w	r2, #32
    7ad0:	f3ef 8311 	mrs	r3, BASEPRI
    7ad4:	f382 8812 	msr	BASEPRI_MAX, r2
    7ad8:	f3bf 8f6f 	isb	sy
    7adc:	4e0f      	ldr	r6, [pc, #60]	; (7b1c <z_setup_new_thread+0xc8>)
    7ade:	6ab2      	ldr	r2, [r6, #40]	; 0x28
    7ae0:	6762      	str	r2, [r4, #116]	; 0x74
    7ae2:	62b4      	str	r4, [r6, #40]	; 0x28
    7ae4:	f383 8811 	msr	BASEPRI, r3
    7ae8:	f3bf 8f6f 	isb	sy
    7aec:	f1b9 0f00 	cmp.w	r9, #0
    7af0:	d011      	beq.n	7b16 <z_setup_new_thread+0xc2>
    7af2:	221f      	movs	r2, #31
    7af4:	4649      	mov	r1, r9
    7af6:	f104 0078 	add.w	r0, r4, #120	; 0x78
    7afa:	f004 fb99 	bl	c230 <strncpy>
    7afe:	f884 5097 	strb.w	r5, [r4, #151]	; 0x97
    7b02:	68b3      	ldr	r3, [r6, #8]
    7b04:	b10b      	cbz	r3, 7b0a <z_setup_new_thread+0xb6>
    7b06:	f8d3 30a8 	ldr.w	r3, [r3, #168]	; 0xa8
    7b0a:	f8c4 30a8 	str.w	r3, [r4, #168]	; 0xa8
    7b0e:	4638      	mov	r0, r7
    7b10:	b005      	add	sp, #20
    7b12:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    7b16:	f884 9078 	strb.w	r9, [r4, #120]	; 0x78
    7b1a:	e7f2      	b.n	7b02 <z_setup_new_thread+0xae>
    7b1c:	20001648 	.word	0x20001648

00007b20 <z_impl_k_thread_create>:
    7b20:	b5f0      	push	{r4, r5, r6, r7, lr}
    7b22:	b087      	sub	sp, #28
    7b24:	2500      	movs	r5, #0
    7b26:	9505      	str	r5, [sp, #20]
    7b28:	9d10      	ldr	r5, [sp, #64]	; 0x40
    7b2a:	9504      	str	r5, [sp, #16]
    7b2c:	9d0f      	ldr	r5, [sp, #60]	; 0x3c
    7b2e:	9503      	str	r5, [sp, #12]
    7b30:	9d0e      	ldr	r5, [sp, #56]	; 0x38
    7b32:	9502      	str	r5, [sp, #8]
    7b34:	e9dd 7612 	ldrd	r7, r6, [sp, #72]	; 0x48
    7b38:	9d0d      	ldr	r5, [sp, #52]	; 0x34
    7b3a:	9501      	str	r5, [sp, #4]
    7b3c:	9d0c      	ldr	r5, [sp, #48]	; 0x30
    7b3e:	9500      	str	r5, [sp, #0]
    7b40:	4604      	mov	r4, r0
    7b42:	f7ff ff87 	bl	7a54 <z_setup_new_thread>
    7b46:	f1b6 3fff 	cmp.w	r6, #4294967295	; 0xffffffff
    7b4a:	bf08      	it	eq
    7b4c:	f1b7 3fff 	cmpeq.w	r7, #4294967295	; 0xffffffff
    7b50:	d005      	beq.n	7b5e <z_impl_k_thread_create+0x3e>
    7b52:	ea56 0307 	orrs.w	r3, r6, r7
    7b56:	d105      	bne.n	7b64 <z_impl_k_thread_create+0x44>
    7b58:	4620      	mov	r0, r4
    7b5a:	f000 fb49 	bl	81f0 <z_sched_start>
    7b5e:	4620      	mov	r0, r4
    7b60:	b007      	add	sp, #28
    7b62:	bdf0      	pop	{r4, r5, r6, r7, pc}
    7b64:	4903      	ldr	r1, [pc, #12]	; (7b74 <z_impl_k_thread_create+0x54>)
    7b66:	463a      	mov	r2, r7
    7b68:	4633      	mov	r3, r6
    7b6a:	f104 0018 	add.w	r0, r4, #24
    7b6e:	f000 fd4b 	bl	8608 <z_add_timeout>
    7b72:	e7f4      	b.n	7b5e <z_impl_k_thread_create+0x3e>
    7b74:	0000bbbb 	.word	0x0000bbbb

00007b78 <z_init_static_threads>:
    7b78:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    7b7c:	4c29      	ldr	r4, [pc, #164]	; (7c24 <z_init_static_threads+0xac>)
    7b7e:	4d2a      	ldr	r5, [pc, #168]	; (7c28 <z_init_static_threads+0xb0>)
    7b80:	b087      	sub	sp, #28
    7b82:	4626      	mov	r6, r4
    7b84:	42ae      	cmp	r6, r5
    7b86:	f104 0430 	add.w	r4, r4, #48	; 0x30
    7b8a:	d30f      	bcc.n	7bac <z_init_static_threads+0x34>
    7b8c:	f000 fb80 	bl	8290 <k_sched_lock>
    7b90:	4c24      	ldr	r4, [pc, #144]	; (7c24 <z_init_static_threads+0xac>)
    7b92:	f8df 9098 	ldr.w	r9, [pc, #152]	; 7c2c <z_init_static_threads+0xb4>
    7b96:	f44f 4600 	mov.w	r6, #32768	; 0x8000
    7b9a:	f240 37e7 	movw	r7, #999	; 0x3e7
    7b9e:	42ac      	cmp	r4, r5
    7ba0:	d320      	bcc.n	7be4 <z_init_static_threads+0x6c>
    7ba2:	b007      	add	sp, #28
    7ba4:	e8bd 43f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, lr}
    7ba8:	f000 bb86 	b.w	82b8 <k_sched_unlock>
    7bac:	f854 3c04 	ldr.w	r3, [r4, #-4]
    7bb0:	9305      	str	r3, [sp, #20]
    7bb2:	f854 3c10 	ldr.w	r3, [r4, #-16]
    7bb6:	9304      	str	r3, [sp, #16]
    7bb8:	f854 3c14 	ldr.w	r3, [r4, #-20]
    7bbc:	9303      	str	r3, [sp, #12]
    7bbe:	f854 3c18 	ldr.w	r3, [r4, #-24]
    7bc2:	9302      	str	r3, [sp, #8]
    7bc4:	f854 3c1c 	ldr.w	r3, [r4, #-28]
    7bc8:	9301      	str	r3, [sp, #4]
    7bca:	f854 3c20 	ldr.w	r3, [r4, #-32]
    7bce:	9300      	str	r3, [sp, #0]
    7bd0:	e954 230a 	ldrd	r2, r3, [r4, #-40]	; 0x28
    7bd4:	e954 010c 	ldrd	r0, r1, [r4, #-48]	; 0x30
    7bd8:	f7ff ff3c 	bl	7a54 <z_setup_new_thread>
    7bdc:	f854 3c30 	ldr.w	r3, [r4, #-48]
    7be0:	655e      	str	r6, [r3, #84]	; 0x54
    7be2:	e7ce      	b.n	7b82 <z_init_static_threads+0xa>
    7be4:	6a63      	ldr	r3, [r4, #36]	; 0x24
    7be6:	1c5a      	adds	r2, r3, #1
    7be8:	d00d      	beq.n	7c06 <z_init_static_threads+0x8e>
    7bea:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
    7bee:	2100      	movs	r1, #0
    7bf0:	4638      	mov	r0, r7
    7bf2:	fbc3 0106 	smlal	r0, r1, r3, r6
    7bf6:	ea51 33c3 	orrs.w	r3, r1, r3, lsl #15
    7bfa:	f8d4 8000 	ldr.w	r8, [r4]
    7bfe:	d104      	bne.n	7c0a <z_init_static_threads+0x92>
    7c00:	4640      	mov	r0, r8
    7c02:	f000 faf5 	bl	81f0 <z_sched_start>
    7c06:	3430      	adds	r4, #48	; 0x30
    7c08:	e7c9      	b.n	7b9e <z_init_static_threads+0x26>
    7c0a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    7c0e:	2300      	movs	r3, #0
    7c10:	f7f8 ff1e 	bl	a50 <__aeabi_uldivmod>
    7c14:	4602      	mov	r2, r0
    7c16:	460b      	mov	r3, r1
    7c18:	f108 0018 	add.w	r0, r8, #24
    7c1c:	4649      	mov	r1, r9
    7c1e:	f000 fcf3 	bl	8608 <z_add_timeout>
    7c22:	e7f0      	b.n	7c06 <z_init_static_threads+0x8e>
    7c24:	0000ca50 	.word	0x0000ca50
    7c28:	0000ca50 	.word	0x0000ca50
    7c2c:	0000bbbb 	.word	0x0000bbbb

00007c30 <sys_kernel_version_get>:
    7c30:	4800      	ldr	r0, [pc, #0]	; (7c34 <sys_kernel_version_get+0x4>)
    7c32:	4770      	bx	lr
    7c34:	03026300 	.word	0x03026300

00007c38 <idle>:
    7c38:	b508      	push	{r3, lr}
    7c3a:	4c0b      	ldr	r4, [pc, #44]	; (7c68 <idle+0x30>)
    7c3c:	4d0b      	ldr	r5, [pc, #44]	; (7c6c <idle+0x34>)
    7c3e:	f04f 0220 	mov.w	r2, #32
    7c42:	f3ef 8311 	mrs	r3, BASEPRI
    7c46:	f382 8812 	msr	BASEPRI_MAX, r2
    7c4a:	f3bf 8f6f 	isb	sy
    7c4e:	f004 f88e 	bl	bd6e <z_get_next_timeout_expiry>
    7c52:	782b      	ldrb	r3, [r5, #0]
    7c54:	61a0      	str	r0, [r4, #24]
    7c56:	b913      	cbnz	r3, 7c5e <idle+0x26>
    7c58:	f7fd fb4e 	bl	52f8 <arch_cpu_idle>
    7c5c:	e7ef      	b.n	7c3e <idle+0x6>
    7c5e:	f7fd f98b 	bl	4f78 <pm_system_suspend>
    7c62:	2800      	cmp	r0, #0
    7c64:	d1eb      	bne.n	7c3e <idle+0x6>
    7c66:	e7f7      	b.n	7c58 <idle+0x20>
    7c68:	20001648 	.word	0x20001648
    7c6c:	20001d07 	.word	0x20001d07

00007c70 <z_impl_k_mutex_lock>:
    7c70:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
    7c74:	4604      	mov	r4, r0
    7c76:	4617      	mov	r7, r2
    7c78:	461e      	mov	r6, r3
    7c7a:	f04f 0320 	mov.w	r3, #32
    7c7e:	f3ef 8811 	mrs	r8, BASEPRI
    7c82:	f383 8812 	msr	BASEPRI_MAX, r3
    7c86:	f3bf 8f6f 	isb	sy
    7c8a:	68c3      	ldr	r3, [r0, #12]
    7c8c:	4a33      	ldr	r2, [pc, #204]	; (7d5c <z_impl_k_mutex_lock+0xec>)
    7c8e:	b17b      	cbz	r3, 7cb0 <z_impl_k_mutex_lock+0x40>
    7c90:	6880      	ldr	r0, [r0, #8]
    7c92:	6891      	ldr	r1, [r2, #8]
    7c94:	4288      	cmp	r0, r1
    7c96:	d019      	beq.n	7ccc <z_impl_k_mutex_lock+0x5c>
    7c98:	ea57 0306 	orrs.w	r3, r7, r6
    7c9c:	d118      	bne.n	7cd0 <z_impl_k_mutex_lock+0x60>
    7c9e:	f388 8811 	msr	BASEPRI, r8
    7ca2:	f3bf 8f6f 	isb	sy
    7ca6:	f06f 000f 	mvn.w	r0, #15
    7caa:	b002      	add	sp, #8
    7cac:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    7cb0:	6891      	ldr	r1, [r2, #8]
    7cb2:	f991 100e 	ldrsb.w	r1, [r1, #14]
    7cb6:	6121      	str	r1, [r4, #16]
    7cb8:	3301      	adds	r3, #1
    7cba:	60e3      	str	r3, [r4, #12]
    7cbc:	6893      	ldr	r3, [r2, #8]
    7cbe:	60a3      	str	r3, [r4, #8]
    7cc0:	f388 8811 	msr	BASEPRI, r8
    7cc4:	f3bf 8f6f 	isb	sy
    7cc8:	2000      	movs	r0, #0
    7cca:	e7ee      	b.n	7caa <z_impl_k_mutex_lock+0x3a>
    7ccc:	6921      	ldr	r1, [r4, #16]
    7cce:	e7f2      	b.n	7cb6 <z_impl_k_mutex_lock+0x46>
    7cd0:	f991 100e 	ldrsb.w	r1, [r1, #14]
    7cd4:	f990 300e 	ldrsb.w	r3, [r0, #14]
    7cd8:	4299      	cmp	r1, r3
    7cda:	bfa8      	it	ge
    7cdc:	4619      	movge	r1, r3
    7cde:	f06f 027e 	mvn.w	r2, #126	; 0x7e
    7ce2:	4291      	cmp	r1, r2
    7ce4:	bfb8      	it	lt
    7ce6:	4611      	movlt	r1, r2
    7ce8:	428b      	cmp	r3, r1
    7cea:	dd2e      	ble.n	7d4a <z_impl_k_mutex_lock+0xda>
    7cec:	f003 ff3b 	bl	bb66 <adjust_owner_prio.isra.0>
    7cf0:	4605      	mov	r5, r0
    7cf2:	e9cd 7600 	strd	r7, r6, [sp]
    7cf6:	481a      	ldr	r0, [pc, #104]	; (7d60 <z_impl_k_mutex_lock+0xf0>)
    7cf8:	4622      	mov	r2, r4
    7cfa:	4641      	mov	r1, r8
    7cfc:	f000 fa02 	bl	8104 <z_pend_curr>
    7d00:	2800      	cmp	r0, #0
    7d02:	d0e1      	beq.n	7cc8 <z_impl_k_mutex_lock+0x58>
    7d04:	f04f 0320 	mov.w	r3, #32
    7d08:	f3ef 8611 	mrs	r6, BASEPRI
    7d0c:	f383 8812 	msr	BASEPRI_MAX, r3
    7d10:	f3bf 8f6f 	isb	sy
    7d14:	68a0      	ldr	r0, [r4, #8]
    7d16:	b1d0      	cbz	r0, 7d4e <z_impl_k_mutex_lock+0xde>
    7d18:	6823      	ldr	r3, [r4, #0]
    7d1a:	6921      	ldr	r1, [r4, #16]
    7d1c:	429c      	cmp	r4, r3
    7d1e:	d00a      	beq.n	7d36 <z_impl_k_mutex_lock+0xc6>
    7d20:	b14b      	cbz	r3, 7d36 <z_impl_k_mutex_lock+0xc6>
    7d22:	f993 300e 	ldrsb.w	r3, [r3, #14]
    7d26:	4299      	cmp	r1, r3
    7d28:	bfa8      	it	ge
    7d2a:	4619      	movge	r1, r3
    7d2c:	f06f 037e 	mvn.w	r3, #126	; 0x7e
    7d30:	4299      	cmp	r1, r3
    7d32:	bfb8      	it	lt
    7d34:	4619      	movlt	r1, r3
    7d36:	f003 ff16 	bl	bb66 <adjust_owner_prio.isra.0>
    7d3a:	b140      	cbz	r0, 7d4e <z_impl_k_mutex_lock+0xde>
    7d3c:	4808      	ldr	r0, [pc, #32]	; (7d60 <z_impl_k_mutex_lock+0xf0>)
    7d3e:	4631      	mov	r1, r6
    7d40:	f000 fa44 	bl	81cc <z_reschedule>
    7d44:	f06f 000a 	mvn.w	r0, #10
    7d48:	e7af      	b.n	7caa <z_impl_k_mutex_lock+0x3a>
    7d4a:	2500      	movs	r5, #0
    7d4c:	e7d1      	b.n	7cf2 <z_impl_k_mutex_lock+0x82>
    7d4e:	2d00      	cmp	r5, #0
    7d50:	d1f4      	bne.n	7d3c <z_impl_k_mutex_lock+0xcc>
    7d52:	f386 8811 	msr	BASEPRI, r6
    7d56:	f3bf 8f6f 	isb	sy
    7d5a:	e7f3      	b.n	7d44 <z_impl_k_mutex_lock+0xd4>
    7d5c:	20001648 	.word	0x20001648
    7d60:	20001d08 	.word	0x20001d08

00007d64 <z_impl_k_mutex_unlock>:
    7d64:	b538      	push	{r3, r4, r5, lr}
    7d66:	6883      	ldr	r3, [r0, #8]
    7d68:	4604      	mov	r4, r0
    7d6a:	b373      	cbz	r3, 7dca <z_impl_k_mutex_unlock+0x66>
    7d6c:	4a1a      	ldr	r2, [pc, #104]	; (7dd8 <z_impl_k_mutex_unlock+0x74>)
    7d6e:	6892      	ldr	r2, [r2, #8]
    7d70:	4293      	cmp	r3, r2
    7d72:	d12d      	bne.n	7dd0 <z_impl_k_mutex_unlock+0x6c>
    7d74:	68c3      	ldr	r3, [r0, #12]
    7d76:	2b01      	cmp	r3, #1
    7d78:	d903      	bls.n	7d82 <z_impl_k_mutex_unlock+0x1e>
    7d7a:	3b01      	subs	r3, #1
    7d7c:	60c3      	str	r3, [r0, #12]
    7d7e:	2000      	movs	r0, #0
    7d80:	bd38      	pop	{r3, r4, r5, pc}
    7d82:	f04f 0320 	mov.w	r3, #32
    7d86:	f3ef 8511 	mrs	r5, BASEPRI
    7d8a:	f383 8812 	msr	BASEPRI_MAX, r3
    7d8e:	f3bf 8f6f 	isb	sy
    7d92:	6901      	ldr	r1, [r0, #16]
    7d94:	6880      	ldr	r0, [r0, #8]
    7d96:	f003 fee6 	bl	bb66 <adjust_owner_prio.isra.0>
    7d9a:	4620      	mov	r0, r4
    7d9c:	f003 ff67 	bl	bc6e <z_unpend_first_thread>
    7da0:	60a0      	str	r0, [r4, #8]
    7da2:	b160      	cbz	r0, 7dbe <z_impl_k_mutex_unlock+0x5a>
    7da4:	f990 200e 	ldrsb.w	r2, [r0, #14]
    7da8:	6122      	str	r2, [r4, #16]
    7daa:	2200      	movs	r2, #0
    7dac:	f8c0 20b0 	str.w	r2, [r0, #176]	; 0xb0
    7db0:	f003 ff4d 	bl	bc4e <z_ready_thread>
    7db4:	4809      	ldr	r0, [pc, #36]	; (7ddc <z_impl_k_mutex_unlock+0x78>)
    7db6:	4629      	mov	r1, r5
    7db8:	f000 fa08 	bl	81cc <z_reschedule>
    7dbc:	e7df      	b.n	7d7e <z_impl_k_mutex_unlock+0x1a>
    7dbe:	60e0      	str	r0, [r4, #12]
    7dc0:	f385 8811 	msr	BASEPRI, r5
    7dc4:	f3bf 8f6f 	isb	sy
    7dc8:	e7d9      	b.n	7d7e <z_impl_k_mutex_unlock+0x1a>
    7dca:	f06f 0015 	mvn.w	r0, #21
    7dce:	e7d7      	b.n	7d80 <z_impl_k_mutex_unlock+0x1c>
    7dd0:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    7dd4:	e7d4      	b.n	7d80 <z_impl_k_mutex_unlock+0x1c>
    7dd6:	bf00      	nop
    7dd8:	20001648 	.word	0x20001648
    7ddc:	20001d08 	.word	0x20001d08

00007de0 <z_impl_k_sem_give>:
    7de0:	b538      	push	{r3, r4, r5, lr}
    7de2:	4604      	mov	r4, r0
    7de4:	f04f 0320 	mov.w	r3, #32
    7de8:	f3ef 8511 	mrs	r5, BASEPRI
    7dec:	f383 8812 	msr	BASEPRI_MAX, r3
    7df0:	f3bf 8f6f 	isb	sy
    7df4:	f003 ff3b 	bl	bc6e <z_unpend_first_thread>
    7df8:	b150      	cbz	r0, 7e10 <z_impl_k_sem_give+0x30>
    7dfa:	2200      	movs	r2, #0
    7dfc:	f8c0 20b0 	str.w	r2, [r0, #176]	; 0xb0
    7e00:	f003 ff25 	bl	bc4e <z_ready_thread>
    7e04:	4629      	mov	r1, r5
    7e06:	4808      	ldr	r0, [pc, #32]	; (7e28 <z_impl_k_sem_give+0x48>)
    7e08:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    7e0c:	f000 b9de 	b.w	81cc <z_reschedule>
    7e10:	e9d4 3202 	ldrd	r3, r2, [r4, #8]
    7e14:	429a      	cmp	r2, r3
    7e16:	bf18      	it	ne
    7e18:	3301      	addne	r3, #1
    7e1a:	60a3      	str	r3, [r4, #8]
    7e1c:	2102      	movs	r1, #2
    7e1e:	f104 0010 	add.w	r0, r4, #16
    7e22:	f004 f91a 	bl	c05a <z_handle_obj_poll_events>
    7e26:	e7ed      	b.n	7e04 <z_impl_k_sem_give+0x24>
    7e28:	20001d08 	.word	0x20001d08

00007e2c <z_impl_k_sem_take>:
    7e2c:	b513      	push	{r0, r1, r4, lr}
    7e2e:	f04f 0420 	mov.w	r4, #32
    7e32:	f3ef 8111 	mrs	r1, BASEPRI
    7e36:	f384 8812 	msr	BASEPRI_MAX, r4
    7e3a:	f3bf 8f6f 	isb	sy
    7e3e:	6884      	ldr	r4, [r0, #8]
    7e40:	b144      	cbz	r4, 7e54 <z_impl_k_sem_take+0x28>
    7e42:	3c01      	subs	r4, #1
    7e44:	6084      	str	r4, [r0, #8]
    7e46:	f381 8811 	msr	BASEPRI, r1
    7e4a:	f3bf 8f6f 	isb	sy
    7e4e:	2000      	movs	r0, #0
    7e50:	b002      	add	sp, #8
    7e52:	bd10      	pop	{r4, pc}
    7e54:	ea52 0403 	orrs.w	r4, r2, r3
    7e58:	d106      	bne.n	7e68 <z_impl_k_sem_take+0x3c>
    7e5a:	f381 8811 	msr	BASEPRI, r1
    7e5e:	f3bf 8f6f 	isb	sy
    7e62:	f06f 000f 	mvn.w	r0, #15
    7e66:	e7f3      	b.n	7e50 <z_impl_k_sem_take+0x24>
    7e68:	e9cd 2300 	strd	r2, r3, [sp]
    7e6c:	4602      	mov	r2, r0
    7e6e:	4802      	ldr	r0, [pc, #8]	; (7e78 <z_impl_k_sem_take+0x4c>)
    7e70:	f000 f948 	bl	8104 <z_pend_curr>
    7e74:	e7ec      	b.n	7e50 <z_impl_k_sem_take+0x24>
    7e76:	bf00      	nop
    7e78:	20001d08 	.word	0x20001d08

00007e7c <z_reset_time_slice>:
    7e7c:	b538      	push	{r3, r4, r5, lr}
    7e7e:	4d07      	ldr	r5, [pc, #28]	; (7e9c <z_reset_time_slice+0x20>)
    7e80:	682c      	ldr	r4, [r5, #0]
    7e82:	b154      	cbz	r4, 7e9a <z_reset_time_slice+0x1e>
    7e84:	f7fe fd8c 	bl	69a0 <sys_clock_elapsed>
    7e88:	4b05      	ldr	r3, [pc, #20]	; (7ea0 <z_reset_time_slice+0x24>)
    7e8a:	4404      	add	r4, r0
    7e8c:	611c      	str	r4, [r3, #16]
    7e8e:	6828      	ldr	r0, [r5, #0]
    7e90:	2100      	movs	r1, #0
    7e92:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    7e96:	f003 bf7a 	b.w	bd8e <z_set_timeout_expiry>
    7e9a:	bd38      	pop	{r3, r4, r5, pc}
    7e9c:	2000167c 	.word	0x2000167c
    7ea0:	20001648 	.word	0x20001648

00007ea4 <update_cache>:
    7ea4:	b538      	push	{r3, r4, r5, lr}
    7ea6:	4d0d      	ldr	r5, [pc, #52]	; (7edc <update_cache+0x38>)
    7ea8:	462b      	mov	r3, r5
    7eaa:	f853 4f20 	ldr.w	r4, [r3, #32]!
    7eae:	429c      	cmp	r4, r3
    7eb0:	d000      	beq.n	7eb4 <update_cache+0x10>
    7eb2:	b904      	cbnz	r4, 7eb6 <update_cache+0x12>
    7eb4:	68ec      	ldr	r4, [r5, #12]
    7eb6:	68ab      	ldr	r3, [r5, #8]
    7eb8:	b938      	cbnz	r0, 7eca <update_cache+0x26>
    7eba:	7b5a      	ldrb	r2, [r3, #13]
    7ebc:	06d2      	lsls	r2, r2, #27
    7ebe:	d104      	bne.n	7eca <update_cache+0x26>
    7ec0:	69a2      	ldr	r2, [r4, #24]
    7ec2:	b912      	cbnz	r2, 7eca <update_cache+0x26>
    7ec4:	89da      	ldrh	r2, [r3, #14]
    7ec6:	2a7f      	cmp	r2, #127	; 0x7f
    7ec8:	d805      	bhi.n	7ed6 <update_cache+0x32>
    7eca:	429c      	cmp	r4, r3
    7ecc:	d002      	beq.n	7ed4 <update_cache+0x30>
    7ece:	4620      	mov	r0, r4
    7ed0:	f7ff ffd4 	bl	7e7c <z_reset_time_slice>
    7ed4:	4623      	mov	r3, r4
    7ed6:	61eb      	str	r3, [r5, #28]
    7ed8:	bd38      	pop	{r3, r4, r5, pc}
    7eda:	bf00      	nop
    7edc:	20001648 	.word	0x20001648

00007ee0 <move_thread_to_end_of_prio_q>:
    7ee0:	b570      	push	{r4, r5, r6, lr}
    7ee2:	f990 200d 	ldrsb.w	r2, [r0, #13]
    7ee6:	7b43      	ldrb	r3, [r0, #13]
    7ee8:	2a00      	cmp	r2, #0
    7eea:	4601      	mov	r1, r0
    7eec:	da04      	bge.n	7ef8 <move_thread_to_end_of_prio_q+0x18>
    7eee:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    7ef2:	7343      	strb	r3, [r0, #13]
    7ef4:	f003 fe46 	bl	bb84 <sys_dlist_remove>
    7ef8:	7b4b      	ldrb	r3, [r1, #13]
    7efa:	4a15      	ldr	r2, [pc, #84]	; (7f50 <move_thread_to_end_of_prio_q+0x70>)
    7efc:	f063 037f 	orn	r3, r3, #127	; 0x7f
    7f00:	4610      	mov	r0, r2
    7f02:	734b      	strb	r3, [r1, #13]
    7f04:	f850 3f20 	ldr.w	r3, [r0, #32]!
    7f08:	6a54      	ldr	r4, [r2, #36]	; 0x24
    7f0a:	4283      	cmp	r3, r0
    7f0c:	bf08      	it	eq
    7f0e:	2300      	moveq	r3, #0
    7f10:	b923      	cbnz	r3, 7f1c <move_thread_to_end_of_prio_q+0x3c>
    7f12:	e9c1 0400 	strd	r0, r4, [r1]
    7f16:	6021      	str	r1, [r4, #0]
    7f18:	6251      	str	r1, [r2, #36]	; 0x24
    7f1a:	e00c      	b.n	7f36 <move_thread_to_end_of_prio_q+0x56>
    7f1c:	f991 500e 	ldrsb.w	r5, [r1, #14]
    7f20:	f993 600e 	ldrsb.w	r6, [r3, #14]
    7f24:	42b5      	cmp	r5, r6
    7f26:	d00e      	beq.n	7f46 <move_thread_to_end_of_prio_q+0x66>
    7f28:	42ae      	cmp	r6, r5
    7f2a:	dd0c      	ble.n	7f46 <move_thread_to_end_of_prio_q+0x66>
    7f2c:	6858      	ldr	r0, [r3, #4]
    7f2e:	e9c1 3000 	strd	r3, r0, [r1]
    7f32:	6001      	str	r1, [r0, #0]
    7f34:	6059      	str	r1, [r3, #4]
    7f36:	6890      	ldr	r0, [r2, #8]
    7f38:	1a43      	subs	r3, r0, r1
    7f3a:	4258      	negs	r0, r3
    7f3c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    7f40:	4158      	adcs	r0, r3
    7f42:	f7ff bfaf 	b.w	7ea4 <update_cache>
    7f46:	429c      	cmp	r4, r3
    7f48:	d0e3      	beq.n	7f12 <move_thread_to_end_of_prio_q+0x32>
    7f4a:	681b      	ldr	r3, [r3, #0]
    7f4c:	e7e0      	b.n	7f10 <move_thread_to_end_of_prio_q+0x30>
    7f4e:	bf00      	nop
    7f50:	20001648 	.word	0x20001648

00007f54 <ready_thread>:
    7f54:	b470      	push	{r4, r5, r6}
    7f56:	f990 300d 	ldrsb.w	r3, [r0, #13]
    7f5a:	7b42      	ldrb	r2, [r0, #13]
    7f5c:	2b00      	cmp	r3, #0
    7f5e:	db29      	blt.n	7fb4 <ready_thread+0x60>
    7f60:	06d3      	lsls	r3, r2, #27
    7f62:	d127      	bne.n	7fb4 <ready_thread+0x60>
    7f64:	6983      	ldr	r3, [r0, #24]
    7f66:	bb2b      	cbnz	r3, 7fb4 <ready_thread+0x60>
    7f68:	4913      	ldr	r1, [pc, #76]	; (7fb8 <ready_thread+0x64>)
    7f6a:	f062 027f 	orn	r2, r2, #127	; 0x7f
    7f6e:	7342      	strb	r2, [r0, #13]
    7f70:	460a      	mov	r2, r1
    7f72:	f852 4f20 	ldr.w	r4, [r2, #32]!
    7f76:	4294      	cmp	r4, r2
    7f78:	bf18      	it	ne
    7f7a:	4623      	movne	r3, r4
    7f7c:	6a4c      	ldr	r4, [r1, #36]	; 0x24
    7f7e:	b923      	cbnz	r3, 7f8a <ready_thread+0x36>
    7f80:	e9c0 2400 	strd	r2, r4, [r0]
    7f84:	6020      	str	r0, [r4, #0]
    7f86:	6248      	str	r0, [r1, #36]	; 0x24
    7f88:	e00c      	b.n	7fa4 <ready_thread+0x50>
    7f8a:	f990 500e 	ldrsb.w	r5, [r0, #14]
    7f8e:	f993 600e 	ldrsb.w	r6, [r3, #14]
    7f92:	42b5      	cmp	r5, r6
    7f94:	d00a      	beq.n	7fac <ready_thread+0x58>
    7f96:	42ae      	cmp	r6, r5
    7f98:	dd08      	ble.n	7fac <ready_thread+0x58>
    7f9a:	685a      	ldr	r2, [r3, #4]
    7f9c:	e9c0 3200 	strd	r3, r2, [r0]
    7fa0:	6010      	str	r0, [r2, #0]
    7fa2:	6058      	str	r0, [r3, #4]
    7fa4:	bc70      	pop	{r4, r5, r6}
    7fa6:	2000      	movs	r0, #0
    7fa8:	f7ff bf7c 	b.w	7ea4 <update_cache>
    7fac:	42a3      	cmp	r3, r4
    7fae:	d0e7      	beq.n	7f80 <ready_thread+0x2c>
    7fb0:	681b      	ldr	r3, [r3, #0]
    7fb2:	e7e4      	b.n	7f7e <ready_thread+0x2a>
    7fb4:	bc70      	pop	{r4, r5, r6}
    7fb6:	4770      	bx	lr
    7fb8:	20001648 	.word	0x20001648

00007fbc <unready_thread>:
    7fbc:	b508      	push	{r3, lr}
    7fbe:	f990 200d 	ldrsb.w	r2, [r0, #13]
    7fc2:	7b43      	ldrb	r3, [r0, #13]
    7fc4:	2a00      	cmp	r2, #0
    7fc6:	4601      	mov	r1, r0
    7fc8:	da04      	bge.n	7fd4 <unready_thread+0x18>
    7fca:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    7fce:	7343      	strb	r3, [r0, #13]
    7fd0:	f003 fdd8 	bl	bb84 <sys_dlist_remove>
    7fd4:	4b04      	ldr	r3, [pc, #16]	; (7fe8 <unready_thread+0x2c>)
    7fd6:	6898      	ldr	r0, [r3, #8]
    7fd8:	1a43      	subs	r3, r0, r1
    7fda:	4258      	negs	r0, r3
    7fdc:	4158      	adcs	r0, r3
    7fde:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    7fe2:	f7ff bf5f 	b.w	7ea4 <update_cache>
    7fe6:	bf00      	nop
    7fe8:	20001648 	.word	0x20001648

00007fec <pend_locked>:
    7fec:	b570      	push	{r4, r5, r6, lr}
    7fee:	4615      	mov	r5, r2
    7ff0:	461c      	mov	r4, r3
    7ff2:	4606      	mov	r6, r0
    7ff4:	f003 fe03 	bl	bbfe <add_to_waitq_locked>
    7ff8:	f1b4 3fff 	cmp.w	r4, #4294967295	; 0xffffffff
    7ffc:	bf08      	it	eq
    7ffe:	f1b5 3fff 	cmpeq.w	r5, #4294967295	; 0xffffffff
    8002:	d008      	beq.n	8016 <CONFIG_PM_PARTITION_SIZE_B0_IMAGE+0x16>
    8004:	462a      	mov	r2, r5
    8006:	4623      	mov	r3, r4
    8008:	f106 0018 	add.w	r0, r6, #24
    800c:	4902      	ldr	r1, [pc, #8]	; (8018 <CONFIG_PM_PARTITION_SIZE_B0_IMAGE+0x18>)
    800e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    8012:	f000 baf9 	b.w	8608 <z_add_timeout>
    8016:	bd70      	pop	{r4, r5, r6, pc}
    8018:	0000bbbb 	.word	0x0000bbbb

0000801c <k_sched_time_slice_set>:
    801c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    801e:	4604      	mov	r4, r0
    8020:	460d      	mov	r5, r1
    8022:	f04f 0320 	mov.w	r3, #32
    8026:	f3ef 8711 	mrs	r7, BASEPRI
    802a:	f383 8812 	msr	BASEPRI_MAX, r3
    802e:	f3bf 8f6f 	isb	sy
    8032:	2600      	movs	r6, #0
    8034:	f44f 4c00 	mov.w	ip, #32768	; 0x8000
    8038:	f240 30e7 	movw	r0, #999	; 0x3e7
    803c:	4631      	mov	r1, r6
    803e:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
    8042:	2300      	movs	r3, #0
    8044:	fbe4 010c 	umlal	r0, r1, r4, ip
    8048:	f7f8 fd02 	bl	a50 <__aeabi_uldivmod>
    804c:	42b4      	cmp	r4, r6
    804e:	dd02      	ble.n	8056 <k_sched_time_slice_set+0x3a>
    8050:	2802      	cmp	r0, #2
    8052:	bfb8      	it	lt
    8054:	2002      	movlt	r0, #2
    8056:	4a07      	ldr	r2, [pc, #28]	; (8074 <k_sched_time_slice_set+0x58>)
    8058:	4b07      	ldr	r3, [pc, #28]	; (8078 <k_sched_time_slice_set+0x5c>)
    805a:	6010      	str	r0, [r2, #0]
    805c:	4a07      	ldr	r2, [pc, #28]	; (807c <k_sched_time_slice_set+0x60>)
    805e:	6898      	ldr	r0, [r3, #8]
    8060:	611e      	str	r6, [r3, #16]
    8062:	6015      	str	r5, [r2, #0]
    8064:	f7ff ff0a 	bl	7e7c <z_reset_time_slice>
    8068:	f387 8811 	msr	BASEPRI, r7
    806c:	f3bf 8f6f 	isb	sy
    8070:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    8072:	bf00      	nop
    8074:	2000167c 	.word	0x2000167c
    8078:	20001648 	.word	0x20001648
    807c:	20001678 	.word	0x20001678

00008080 <z_time_slice>:
    8080:	b538      	push	{r3, r4, r5, lr}
    8082:	f04f 0320 	mov.w	r3, #32
    8086:	f3ef 8511 	mrs	r5, BASEPRI
    808a:	f383 8812 	msr	BASEPRI_MAX, r3
    808e:	f3bf 8f6f 	isb	sy
    8092:	4b17      	ldr	r3, [pc, #92]	; (80f0 <z_time_slice+0x70>)
    8094:	4a17      	ldr	r2, [pc, #92]	; (80f4 <z_time_slice+0x74>)
    8096:	689c      	ldr	r4, [r3, #8]
    8098:	6811      	ldr	r1, [r2, #0]
    809a:	428c      	cmp	r4, r1
    809c:	d107      	bne.n	80ae <z_time_slice+0x2e>
    809e:	4620      	mov	r0, r4
    80a0:	f7ff feec 	bl	7e7c <z_reset_time_slice>
    80a4:	f385 8811 	msr	BASEPRI, r5
    80a8:	f3bf 8f6f 	isb	sy
    80ac:	bd38      	pop	{r3, r4, r5, pc}
    80ae:	2100      	movs	r1, #0
    80b0:	6011      	str	r1, [r2, #0]
    80b2:	4a11      	ldr	r2, [pc, #68]	; (80f8 <z_time_slice+0x78>)
    80b4:	6812      	ldr	r2, [r2, #0]
    80b6:	b1c2      	cbz	r2, 80ea <z_time_slice+0x6a>
    80b8:	89e2      	ldrh	r2, [r4, #14]
    80ba:	2a7f      	cmp	r2, #127	; 0x7f
    80bc:	d815      	bhi.n	80ea <z_time_slice+0x6a>
    80be:	7b62      	ldrb	r2, [r4, #13]
    80c0:	06d2      	lsls	r2, r2, #27
    80c2:	d112      	bne.n	80ea <z_time_slice+0x6a>
    80c4:	4a0d      	ldr	r2, [pc, #52]	; (80fc <z_time_slice+0x7c>)
    80c6:	f994 100e 	ldrsb.w	r1, [r4, #14]
    80ca:	6812      	ldr	r2, [r2, #0]
    80cc:	4291      	cmp	r1, r2
    80ce:	db0c      	blt.n	80ea <z_time_slice+0x6a>
    80d0:	4a0b      	ldr	r2, [pc, #44]	; (8100 <z_time_slice+0x80>)
    80d2:	4294      	cmp	r4, r2
    80d4:	d009      	beq.n	80ea <z_time_slice+0x6a>
    80d6:	691a      	ldr	r2, [r3, #16]
    80d8:	4282      	cmp	r2, r0
    80da:	dc03      	bgt.n	80e4 <z_time_slice+0x64>
    80dc:	4620      	mov	r0, r4
    80de:	f7ff feff 	bl	7ee0 <move_thread_to_end_of_prio_q>
    80e2:	e7dc      	b.n	809e <z_time_slice+0x1e>
    80e4:	1a12      	subs	r2, r2, r0
    80e6:	611a      	str	r2, [r3, #16]
    80e8:	e7dc      	b.n	80a4 <z_time_slice+0x24>
    80ea:	2200      	movs	r2, #0
    80ec:	e7fb      	b.n	80e6 <z_time_slice+0x66>
    80ee:	bf00      	nop
    80f0:	20001648 	.word	0x20001648
    80f4:	20001674 	.word	0x20001674
    80f8:	2000167c 	.word	0x2000167c
    80fc:	20001678 	.word	0x20001678
    8100:	20000548 	.word	0x20000548

00008104 <z_pend_curr>:
    8104:	b570      	push	{r4, r5, r6, lr}
    8106:	480c      	ldr	r0, [pc, #48]	; (8138 <z_pend_curr+0x34>)
    8108:	4d0c      	ldr	r5, [pc, #48]	; (813c <z_pend_curr+0x38>)
    810a:	6886      	ldr	r6, [r0, #8]
    810c:	602e      	str	r6, [r5, #0]
    810e:	460c      	mov	r4, r1
    8110:	4611      	mov	r1, r2
    8112:	e9dd 2304 	ldrd	r2, r3, [sp, #16]
    8116:	f04f 0620 	mov.w	r6, #32
    811a:	f3ef 8511 	mrs	r5, BASEPRI
    811e:	f386 8812 	msr	BASEPRI_MAX, r6
    8122:	f3bf 8f6f 	isb	sy
    8126:	6880      	ldr	r0, [r0, #8]
    8128:	f7ff ff60 	bl	7fec <pend_locked>
    812c:	4620      	mov	r0, r4
    812e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    8132:	f7fd b94f 	b.w	53d4 <arch_swap>
    8136:	bf00      	nop
    8138:	20001648 	.word	0x20001648
    813c:	20001674 	.word	0x20001674

00008140 <z_set_prio>:
    8140:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8142:	4604      	mov	r4, r0
    8144:	f04f 0320 	mov.w	r3, #32
    8148:	f3ef 8611 	mrs	r6, BASEPRI
    814c:	f383 8812 	msr	BASEPRI_MAX, r3
    8150:	f3bf 8f6f 	isb	sy
    8154:	7b43      	ldrb	r3, [r0, #13]
    8156:	06da      	lsls	r2, r3, #27
    8158:	b249      	sxtb	r1, r1
    815a:	d119      	bne.n	8190 <z_set_prio+0x50>
    815c:	6985      	ldr	r5, [r0, #24]
    815e:	b9bd      	cbnz	r5, 8190 <z_set_prio+0x50>
    8160:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    8164:	7343      	strb	r3, [r0, #13]
    8166:	f003 fd0d 	bl	bb84 <sys_dlist_remove>
    816a:	7b43      	ldrb	r3, [r0, #13]
    816c:	4a16      	ldr	r2, [pc, #88]	; (81c8 <z_set_prio+0x88>)
    816e:	7381      	strb	r1, [r0, #14]
    8170:	f063 037f 	orn	r3, r3, #127	; 0x7f
    8174:	7343      	strb	r3, [r0, #13]
    8176:	4613      	mov	r3, r2
    8178:	f853 0f20 	ldr.w	r0, [r3, #32]!
    817c:	4298      	cmp	r0, r3
    817e:	bf18      	it	ne
    8180:	4605      	movne	r5, r0
    8182:	6a50      	ldr	r0, [r2, #36]	; 0x24
    8184:	b95d      	cbnz	r5, 819e <z_set_prio+0x5e>
    8186:	e9c4 3000 	strd	r3, r0, [r4]
    818a:	6004      	str	r4, [r0, #0]
    818c:	6254      	str	r4, [r2, #36]	; 0x24
    818e:	e011      	b.n	81b4 <z_set_prio+0x74>
    8190:	73a1      	strb	r1, [r4, #14]
    8192:	2000      	movs	r0, #0
    8194:	f386 8811 	msr	BASEPRI, r6
    8198:	f3bf 8f6f 	isb	sy
    819c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    819e:	f995 700e 	ldrsb.w	r7, [r5, #14]
    81a2:	42b9      	cmp	r1, r7
    81a4:	d00b      	beq.n	81be <z_set_prio+0x7e>
    81a6:	428f      	cmp	r7, r1
    81a8:	dd09      	ble.n	81be <z_set_prio+0x7e>
    81aa:	686b      	ldr	r3, [r5, #4]
    81ac:	e9c4 5300 	strd	r5, r3, [r4]
    81b0:	601c      	str	r4, [r3, #0]
    81b2:	606c      	str	r4, [r5, #4]
    81b4:	2001      	movs	r0, #1
    81b6:	f7ff fe75 	bl	7ea4 <update_cache>
    81ba:	2001      	movs	r0, #1
    81bc:	e7ea      	b.n	8194 <z_set_prio+0x54>
    81be:	42a8      	cmp	r0, r5
    81c0:	d0e1      	beq.n	8186 <z_set_prio+0x46>
    81c2:	682d      	ldr	r5, [r5, #0]
    81c4:	e7de      	b.n	8184 <z_set_prio+0x44>
    81c6:	bf00      	nop
    81c8:	20001648 	.word	0x20001648

000081cc <z_reschedule>:
    81cc:	b949      	cbnz	r1, 81e2 <z_reschedule+0x16>
    81ce:	f3ef 8005 	mrs	r0, IPSR
    81d2:	b930      	cbnz	r0, 81e2 <z_reschedule+0x16>
    81d4:	4b05      	ldr	r3, [pc, #20]	; (81ec <z_reschedule+0x20>)
    81d6:	69da      	ldr	r2, [r3, #28]
    81d8:	689b      	ldr	r3, [r3, #8]
    81da:	429a      	cmp	r2, r3
    81dc:	d001      	beq.n	81e2 <z_reschedule+0x16>
    81de:	f7fd b8f9 	b.w	53d4 <arch_swap>
    81e2:	f381 8811 	msr	BASEPRI, r1
    81e6:	f3bf 8f6f 	isb	sy
    81ea:	4770      	bx	lr
    81ec:	20001648 	.word	0x20001648

000081f0 <z_sched_start>:
    81f0:	b510      	push	{r4, lr}
    81f2:	f04f 0220 	mov.w	r2, #32
    81f6:	f3ef 8411 	mrs	r4, BASEPRI
    81fa:	f382 8812 	msr	BASEPRI_MAX, r2
    81fe:	f3bf 8f6f 	isb	sy
    8202:	7b42      	ldrb	r2, [r0, #13]
    8204:	0751      	lsls	r1, r2, #29
    8206:	d404      	bmi.n	8212 <z_sched_start+0x22>
    8208:	f384 8811 	msr	BASEPRI, r4
    820c:	f3bf 8f6f 	isb	sy
    8210:	bd10      	pop	{r4, pc}
    8212:	f022 0204 	bic.w	r2, r2, #4
    8216:	7342      	strb	r2, [r0, #13]
    8218:	f7ff fe9c 	bl	7f54 <ready_thread>
    821c:	4621      	mov	r1, r4
    821e:	4802      	ldr	r0, [pc, #8]	; (8228 <z_sched_start+0x38>)
    8220:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    8224:	f7ff bfd2 	b.w	81cc <z_reschedule>
    8228:	20001d08 	.word	0x20001d08

0000822c <z_impl_k_thread_suspend>:
    822c:	b570      	push	{r4, r5, r6, lr}
    822e:	4604      	mov	r4, r0
    8230:	3018      	adds	r0, #24
    8232:	f003 fd86 	bl	bd42 <z_abort_timeout>
    8236:	f04f 0320 	mov.w	r3, #32
    823a:	f3ef 8611 	mrs	r6, BASEPRI
    823e:	f383 8812 	msr	BASEPRI_MAX, r3
    8242:	f3bf 8f6f 	isb	sy
    8246:	f994 200d 	ldrsb.w	r2, [r4, #13]
    824a:	7b63      	ldrb	r3, [r4, #13]
    824c:	2a00      	cmp	r2, #0
    824e:	da05      	bge.n	825c <z_impl_k_thread_suspend+0x30>
    8250:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    8254:	7363      	strb	r3, [r4, #13]
    8256:	4620      	mov	r0, r4
    8258:	f003 fc94 	bl	bb84 <sys_dlist_remove>
    825c:	4d0b      	ldr	r5, [pc, #44]	; (828c <z_impl_k_thread_suspend+0x60>)
    825e:	7b63      	ldrb	r3, [r4, #13]
    8260:	68a8      	ldr	r0, [r5, #8]
    8262:	f043 0310 	orr.w	r3, r3, #16
    8266:	7363      	strb	r3, [r4, #13]
    8268:	1b03      	subs	r3, r0, r4
    826a:	4258      	negs	r0, r3
    826c:	4158      	adcs	r0, r3
    826e:	f7ff fe19 	bl	7ea4 <update_cache>
    8272:	f386 8811 	msr	BASEPRI, r6
    8276:	f3bf 8f6f 	isb	sy
    827a:	68ab      	ldr	r3, [r5, #8]
    827c:	42a3      	cmp	r3, r4
    827e:	d103      	bne.n	8288 <z_impl_k_thread_suspend+0x5c>
    8280:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    8284:	f003 bd2f 	b.w	bce6 <z_reschedule_unlocked>
    8288:	bd70      	pop	{r4, r5, r6, pc}
    828a:	bf00      	nop
    828c:	20001648 	.word	0x20001648

00008290 <k_sched_lock>:
    8290:	f04f 0320 	mov.w	r3, #32
    8294:	f3ef 8111 	mrs	r1, BASEPRI
    8298:	f383 8812 	msr	BASEPRI_MAX, r3
    829c:	f3bf 8f6f 	isb	sy
    82a0:	4b04      	ldr	r3, [pc, #16]	; (82b4 <k_sched_lock+0x24>)
    82a2:	689a      	ldr	r2, [r3, #8]
    82a4:	7bd3      	ldrb	r3, [r2, #15]
    82a6:	3b01      	subs	r3, #1
    82a8:	73d3      	strb	r3, [r2, #15]
    82aa:	f381 8811 	msr	BASEPRI, r1
    82ae:	f3bf 8f6f 	isb	sy
    82b2:	4770      	bx	lr
    82b4:	20001648 	.word	0x20001648

000082b8 <k_sched_unlock>:
    82b8:	b510      	push	{r4, lr}
    82ba:	f04f 0320 	mov.w	r3, #32
    82be:	f3ef 8411 	mrs	r4, BASEPRI
    82c2:	f383 8812 	msr	BASEPRI_MAX, r3
    82c6:	f3bf 8f6f 	isb	sy
    82ca:	4b08      	ldr	r3, [pc, #32]	; (82ec <k_sched_unlock+0x34>)
    82cc:	689a      	ldr	r2, [r3, #8]
    82ce:	7bd3      	ldrb	r3, [r2, #15]
    82d0:	3301      	adds	r3, #1
    82d2:	73d3      	strb	r3, [r2, #15]
    82d4:	2000      	movs	r0, #0
    82d6:	f7ff fde5 	bl	7ea4 <update_cache>
    82da:	f384 8811 	msr	BASEPRI, r4
    82de:	f3bf 8f6f 	isb	sy
    82e2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    82e6:	f003 bcfe 	b.w	bce6 <z_reschedule_unlocked>
    82ea:	bf00      	nop
    82ec:	20001648 	.word	0x20001648

000082f0 <z_sched_init>:
    82f0:	4b04      	ldr	r3, [pc, #16]	; (8304 <z_sched_init+0x14>)
    82f2:	2100      	movs	r1, #0
    82f4:	f103 0220 	add.w	r2, r3, #32
    82f8:	e9c3 2208 	strd	r2, r2, [r3, #32]
    82fc:	4608      	mov	r0, r1
    82fe:	f7ff be8d 	b.w	801c <k_sched_time_slice_set>
    8302:	bf00      	nop
    8304:	20001648 	.word	0x20001648

00008308 <z_impl_k_yield>:
    8308:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    830a:	f04f 0320 	mov.w	r3, #32
    830e:	f3ef 8511 	mrs	r5, BASEPRI
    8312:	f383 8812 	msr	BASEPRI_MAX, r3
    8316:	f3bf 8f6f 	isb	sy
    831a:	4919      	ldr	r1, [pc, #100]	; (8380 <z_impl_k_yield+0x78>)
    831c:	6888      	ldr	r0, [r1, #8]
    831e:	7b43      	ldrb	r3, [r0, #13]
    8320:	f003 037f 	and.w	r3, r3, #127	; 0x7f
    8324:	7343      	strb	r3, [r0, #13]
    8326:	f003 fc2d 	bl	bb84 <sys_dlist_remove>
    832a:	688b      	ldr	r3, [r1, #8]
    832c:	7b5a      	ldrb	r2, [r3, #13]
    832e:	4608      	mov	r0, r1
    8330:	f062 027f 	orn	r2, r2, #127	; 0x7f
    8334:	735a      	strb	r2, [r3, #13]
    8336:	f850 2f20 	ldr.w	r2, [r0, #32]!
    833a:	6a4c      	ldr	r4, [r1, #36]	; 0x24
    833c:	4282      	cmp	r2, r0
    833e:	bf08      	it	eq
    8340:	2200      	moveq	r2, #0
    8342:	b922      	cbnz	r2, 834e <z_impl_k_yield+0x46>
    8344:	e9c3 0400 	strd	r0, r4, [r3]
    8348:	6023      	str	r3, [r4, #0]
    834a:	624b      	str	r3, [r1, #36]	; 0x24
    834c:	e00c      	b.n	8368 <z_impl_k_yield+0x60>
    834e:	f993 600e 	ldrsb.w	r6, [r3, #14]
    8352:	f992 700e 	ldrsb.w	r7, [r2, #14]
    8356:	42be      	cmp	r6, r7
    8358:	d00e      	beq.n	8378 <z_impl_k_yield+0x70>
    835a:	42b7      	cmp	r7, r6
    835c:	dd0c      	ble.n	8378 <z_impl_k_yield+0x70>
    835e:	6851      	ldr	r1, [r2, #4]
    8360:	e9c3 2100 	strd	r2, r1, [r3]
    8364:	600b      	str	r3, [r1, #0]
    8366:	6053      	str	r3, [r2, #4]
    8368:	2001      	movs	r0, #1
    836a:	f7ff fd9b 	bl	7ea4 <update_cache>
    836e:	4628      	mov	r0, r5
    8370:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    8374:	f7fd b82e 	b.w	53d4 <arch_swap>
    8378:	42a2      	cmp	r2, r4
    837a:	d0e3      	beq.n	8344 <z_impl_k_yield+0x3c>
    837c:	6812      	ldr	r2, [r2, #0]
    837e:	e7e0      	b.n	8342 <z_impl_k_yield+0x3a>
    8380:	20001648 	.word	0x20001648

00008384 <z_tick_sleep>:
    8384:	ea50 0301 	orrs.w	r3, r0, r1
    8388:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    838c:	4605      	mov	r5, r0
    838e:	460e      	mov	r6, r1
    8390:	d103      	bne.n	839a <z_tick_sleep+0x16>
    8392:	f7ff ffb9 	bl	8308 <z_impl_k_yield>
    8396:	2000      	movs	r0, #0
    8398:	e02c      	b.n	83f4 <z_tick_sleep+0x70>
    839a:	1c83      	adds	r3, r0, #2
    839c:	f171 33ff 	sbcs.w	r3, r1, #4294967295	; 0xffffffff
    83a0:	db2a      	blt.n	83f8 <z_tick_sleep+0x74>
    83a2:	f003 fd10 	bl	bdc6 <sys_clock_tick_get_32>
    83a6:	182c      	adds	r4, r5, r0
    83a8:	f04f 0320 	mov.w	r3, #32
    83ac:	f3ef 8811 	mrs	r8, BASEPRI
    83b0:	f383 8812 	msr	BASEPRI_MAX, r3
    83b4:	f3bf 8f6f 	isb	sy
    83b8:	4f11      	ldr	r7, [pc, #68]	; (8400 <z_tick_sleep+0x7c>)
    83ba:	4b12      	ldr	r3, [pc, #72]	; (8404 <z_tick_sleep+0x80>)
    83bc:	68b8      	ldr	r0, [r7, #8]
    83be:	6018      	str	r0, [r3, #0]
    83c0:	f7ff fdfc 	bl	7fbc <unready_thread>
    83c4:	68b8      	ldr	r0, [r7, #8]
    83c6:	4910      	ldr	r1, [pc, #64]	; (8408 <z_tick_sleep+0x84>)
    83c8:	462a      	mov	r2, r5
    83ca:	4633      	mov	r3, r6
    83cc:	3018      	adds	r0, #24
    83ce:	f000 f91b 	bl	8608 <z_add_timeout>
    83d2:	68ba      	ldr	r2, [r7, #8]
    83d4:	7b53      	ldrb	r3, [r2, #13]
    83d6:	f043 0310 	orr.w	r3, r3, #16
    83da:	7353      	strb	r3, [r2, #13]
    83dc:	4640      	mov	r0, r8
    83de:	f7fc fff9 	bl	53d4 <arch_swap>
    83e2:	f003 fcf0 	bl	bdc6 <sys_clock_tick_get_32>
    83e6:	1a20      	subs	r0, r4, r0
    83e8:	eb63 0303 	sbc.w	r3, r3, r3
    83ec:	2801      	cmp	r0, #1
    83ee:	f173 0300 	sbcs.w	r3, r3, #0
    83f2:	dbd0      	blt.n	8396 <z_tick_sleep+0x12>
    83f4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    83f8:	f06f 0401 	mvn.w	r4, #1
    83fc:	1a24      	subs	r4, r4, r0
    83fe:	e7d3      	b.n	83a8 <z_tick_sleep+0x24>
    8400:	20001648 	.word	0x20001648
    8404:	20001674 	.word	0x20001674
    8408:	0000bbbb 	.word	0x0000bbbb

0000840c <z_impl_k_sleep>:
    840c:	f1b1 3fff 	cmp.w	r1, #4294967295	; 0xffffffff
    8410:	bf08      	it	eq
    8412:	f1b0 3fff 	cmpeq.w	r0, #4294967295	; 0xffffffff
    8416:	b508      	push	{r3, lr}
    8418:	d106      	bne.n	8428 <z_impl_k_sleep+0x1c>
    841a:	4b08      	ldr	r3, [pc, #32]	; (843c <z_impl_k_sleep+0x30>)
    841c:	6898      	ldr	r0, [r3, #8]
    841e:	f7ff ff05 	bl	822c <z_impl_k_thread_suspend>
    8422:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    8426:	bd08      	pop	{r3, pc}
    8428:	f7ff ffac 	bl	8384 <z_tick_sleep>
    842c:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
    8430:	fb80 0303 	smull	r0, r3, r0, r3
    8434:	0bc0      	lsrs	r0, r0, #15
    8436:	ea40 4043 	orr.w	r0, r0, r3, lsl #17
    843a:	e7f4      	b.n	8426 <z_impl_k_sleep+0x1a>
    843c:	20001648 	.word	0x20001648

00008440 <z_impl_z_current_get>:
    8440:	4b01      	ldr	r3, [pc, #4]	; (8448 <z_impl_z_current_get+0x8>)
    8442:	6898      	ldr	r0, [r3, #8]
    8444:	4770      	bx	lr
    8446:	bf00      	nop
    8448:	20001648 	.word	0x20001648

0000844c <z_thread_abort>:
    844c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    8450:	4604      	mov	r4, r0
    8452:	f04f 0320 	mov.w	r3, #32
    8456:	f3ef 8611 	mrs	r6, BASEPRI
    845a:	f383 8812 	msr	BASEPRI_MAX, r3
    845e:	f3bf 8f6f 	isb	sy
    8462:	7b03      	ldrb	r3, [r0, #12]
    8464:	07d9      	lsls	r1, r3, #31
    8466:	d50b      	bpl.n	8480 <z_thread_abort+0x34>
    8468:	f386 8811 	msr	BASEPRI, r6
    846c:	f3bf 8f6f 	isb	sy
    8470:	4040      	eors	r0, r0
    8472:	f380 8811 	msr	BASEPRI, r0
    8476:	f04f 0004 	mov.w	r0, #4
    847a:	df02      	svc	2
    847c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    8480:	7b43      	ldrb	r3, [r0, #13]
    8482:	071a      	lsls	r2, r3, #28
    8484:	d504      	bpl.n	8490 <z_thread_abort+0x44>
    8486:	f386 8811 	msr	BASEPRI, r6
    848a:	f3bf 8f6f 	isb	sy
    848e:	e7f5      	b.n	847c <z_thread_abort+0x30>
    8490:	f023 0220 	bic.w	r2, r3, #32
    8494:	f042 0108 	orr.w	r1, r2, #8
    8498:	09d2      	lsrs	r2, r2, #7
    849a:	d123      	bne.n	84e4 <z_thread_abort+0x98>
    849c:	7341      	strb	r1, [r0, #13]
    849e:	68a3      	ldr	r3, [r4, #8]
    84a0:	b113      	cbz	r3, 84a8 <z_thread_abort+0x5c>
    84a2:	4620      	mov	r0, r4
    84a4:	f003 fb76 	bl	bb94 <unpend_thread_no_timeout>
    84a8:	f104 0018 	add.w	r0, r4, #24
    84ac:	f003 fc49 	bl	bd42 <z_abort_timeout>
    84b0:	f104 0758 	add.w	r7, r4, #88	; 0x58
    84b4:	f04f 0800 	mov.w	r8, #0
    84b8:	6da5      	ldr	r5, [r4, #88]	; 0x58
    84ba:	42bd      	cmp	r5, r7
    84bc:	d000      	beq.n	84c0 <z_thread_abort+0x74>
    84be:	b9cd      	cbnz	r5, 84f4 <z_thread_abort+0xa8>
    84c0:	2001      	movs	r0, #1
    84c2:	f7ff fcef 	bl	7ea4 <update_cache>
    84c6:	4620      	mov	r0, r4
    84c8:	f7ff fa48 	bl	795c <z_thread_monitor_exit>
    84cc:	4b10      	ldr	r3, [pc, #64]	; (8510 <z_thread_abort+0xc4>)
    84ce:	689b      	ldr	r3, [r3, #8]
    84d0:	42a3      	cmp	r3, r4
    84d2:	d1d8      	bne.n	8486 <z_thread_abort+0x3a>
    84d4:	f3ef 8305 	mrs	r3, IPSR
    84d8:	2b00      	cmp	r3, #0
    84da:	d1d4      	bne.n	8486 <z_thread_abort+0x3a>
    84dc:	4630      	mov	r0, r6
    84de:	f7fc ff79 	bl	53d4 <arch_swap>
    84e2:	e7d0      	b.n	8486 <z_thread_abort+0x3a>
    84e4:	f003 035f 	and.w	r3, r3, #95	; 0x5f
    84e8:	f043 0308 	orr.w	r3, r3, #8
    84ec:	7343      	strb	r3, [r0, #13]
    84ee:	f003 fb49 	bl	bb84 <sys_dlist_remove>
    84f2:	e7d4      	b.n	849e <z_thread_abort+0x52>
    84f4:	4628      	mov	r0, r5
    84f6:	f003 fb4d 	bl	bb94 <unpend_thread_no_timeout>
    84fa:	f105 0018 	add.w	r0, r5, #24
    84fe:	f003 fc20 	bl	bd42 <z_abort_timeout>
    8502:	f8c5 80b0 	str.w	r8, [r5, #176]	; 0xb0
    8506:	4628      	mov	r0, r5
    8508:	f7ff fd24 	bl	7f54 <ready_thread>
    850c:	e7d4      	b.n	84b8 <z_thread_abort+0x6c>
    850e:	bf00      	nop
    8510:	20001648 	.word	0x20001648

00008514 <z_sched_wait>:
    8514:	b5d3      	push	{r0, r1, r4, r6, r7, lr}
    8516:	e9dd 6706 	ldrd	r6, r7, [sp, #24]
    851a:	9c08      	ldr	r4, [sp, #32]
    851c:	e9cd 6700 	strd	r6, r7, [sp]
    8520:	f7ff fdf0 	bl	8104 <z_pend_curr>
    8524:	b11c      	cbz	r4, 852e <z_sched_wait+0x1a>
    8526:	4b03      	ldr	r3, [pc, #12]	; (8534 <z_sched_wait+0x20>)
    8528:	689b      	ldr	r3, [r3, #8]
    852a:	695b      	ldr	r3, [r3, #20]
    852c:	6023      	str	r3, [r4, #0]
    852e:	b002      	add	sp, #8
    8530:	bdd0      	pop	{r4, r6, r7, pc}
    8532:	bf00      	nop
    8534:	20001648 	.word	0x20001648

00008538 <z_data_copy>:
    8538:	b508      	push	{r3, lr}
    853a:	4806      	ldr	r0, [pc, #24]	; (8554 <z_data_copy+0x1c>)
    853c:	4a06      	ldr	r2, [pc, #24]	; (8558 <z_data_copy+0x20>)
    853e:	4907      	ldr	r1, [pc, #28]	; (855c <z_data_copy+0x24>)
    8540:	1a12      	subs	r2, r2, r0
    8542:	f003 fa9e 	bl	ba82 <z_early_memcpy>
    8546:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    854a:	4a05      	ldr	r2, [pc, #20]	; (8560 <z_data_copy+0x28>)
    854c:	4905      	ldr	r1, [pc, #20]	; (8564 <z_data_copy+0x2c>)
    854e:	4806      	ldr	r0, [pc, #24]	; (8568 <z_data_copy+0x30>)
    8550:	f003 ba97 	b.w	ba82 <z_early_memcpy>
    8554:	20000000 	.word	0x20000000
    8558:	20000380 	.word	0x20000380
    855c:	0000e7ec 	.word	0x0000e7ec
    8560:	00000000 	.word	0x00000000
    8564:	0000e7ec 	.word	0x0000e7ec
    8568:	20000000 	.word	0x20000000

0000856c <elapsed>:
    856c:	4b03      	ldr	r3, [pc, #12]	; (857c <elapsed+0x10>)
    856e:	681b      	ldr	r3, [r3, #0]
    8570:	b90b      	cbnz	r3, 8576 <elapsed+0xa>
    8572:	f7fe ba15 	b.w	69a0 <sys_clock_elapsed>
    8576:	2000      	movs	r0, #0
    8578:	4770      	bx	lr
    857a:	bf00      	nop
    857c:	20001680 	.word	0x20001680

00008580 <next_timeout>:
    8580:	b510      	push	{r4, lr}
    8582:	4b11      	ldr	r3, [pc, #68]	; (85c8 <next_timeout+0x48>)
    8584:	681c      	ldr	r4, [r3, #0]
    8586:	429c      	cmp	r4, r3
    8588:	d10a      	bne.n	85a0 <next_timeout+0x20>
    858a:	f7ff ffef 	bl	856c <elapsed>
    858e:	f06f 4000 	mvn.w	r0, #2147483648	; 0x80000000
    8592:	4b0e      	ldr	r3, [pc, #56]	; (85cc <next_timeout+0x4c>)
    8594:	691b      	ldr	r3, [r3, #16]
    8596:	b113      	cbz	r3, 859e <next_timeout+0x1e>
    8598:	4298      	cmp	r0, r3
    859a:	bfa8      	it	ge
    859c:	4618      	movge	r0, r3
    859e:	bd10      	pop	{r4, pc}
    85a0:	f7ff ffe4 	bl	856c <elapsed>
    85a4:	2c00      	cmp	r4, #0
    85a6:	d0f2      	beq.n	858e <next_timeout+0xe>
    85a8:	e9d4 3204 	ldrd	r3, r2, [r4, #16]
    85ac:	1a1b      	subs	r3, r3, r0
    85ae:	eb62 72e0 	sbc.w	r2, r2, r0, asr #31
    85b2:	f1b3 4f00 	cmp.w	r3, #2147483648	; 0x80000000
    85b6:	f172 0100 	sbcs.w	r1, r2, #0
    85ba:	dae8      	bge.n	858e <next_timeout+0xe>
    85bc:	2a00      	cmp	r2, #0
    85be:	bfac      	ite	ge
    85c0:	4618      	movge	r0, r3
    85c2:	2000      	movlt	r0, #0
    85c4:	e7e5      	b.n	8592 <next_timeout+0x12>
    85c6:	bf00      	nop
    85c8:	20000200 	.word	0x20000200
    85cc:	20001648 	.word	0x20001648

000085d0 <remove_timeout>:
    85d0:	b530      	push	{r4, r5, lr}
    85d2:	b170      	cbz	r0, 85f2 <remove_timeout+0x22>
    85d4:	4b0b      	ldr	r3, [pc, #44]	; (8604 <remove_timeout+0x34>)
    85d6:	685b      	ldr	r3, [r3, #4]
    85d8:	4298      	cmp	r0, r3
    85da:	d00a      	beq.n	85f2 <remove_timeout+0x22>
    85dc:	6803      	ldr	r3, [r0, #0]
    85de:	b143      	cbz	r3, 85f2 <remove_timeout+0x22>
    85e0:	e9d3 2104 	ldrd	r2, r1, [r3, #16]
    85e4:	e9d0 4504 	ldrd	r4, r5, [r0, #16]
    85e8:	1912      	adds	r2, r2, r4
    85ea:	eb41 0105 	adc.w	r1, r1, r5
    85ee:	e9c3 2104 	strd	r2, r1, [r3, #16]
    85f2:	e9d0 3200 	ldrd	r3, r2, [r0]
    85f6:	6013      	str	r3, [r2, #0]
    85f8:	605a      	str	r2, [r3, #4]
    85fa:	2300      	movs	r3, #0
    85fc:	e9c0 3300 	strd	r3, r3, [r0]
    8600:	bd30      	pop	{r4, r5, pc}
    8602:	bf00      	nop
    8604:	20000200 	.word	0x20000200

00008608 <z_add_timeout>:
    8608:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    860c:	bf08      	it	eq
    860e:	f1b2 3fff 	cmpeq.w	r2, #4294967295	; 0xffffffff
    8612:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8614:	4604      	mov	r4, r0
    8616:	461d      	mov	r5, r3
    8618:	4616      	mov	r6, r2
    861a:	d061      	beq.n	86e0 <z_add_timeout+0xd8>
    861c:	6081      	str	r1, [r0, #8]
    861e:	f04f 0320 	mov.w	r3, #32
    8622:	f3ef 8711 	mrs	r7, BASEPRI
    8626:	f383 8812 	msr	BASEPRI_MAX, r3
    862a:	f3bf 8f6f 	isb	sy
    862e:	3201      	adds	r2, #1
    8630:	f175 33ff 	sbcs.w	r3, r5, #4294967295	; 0xffffffff
    8634:	da24      	bge.n	8680 <z_add_timeout+0x78>
    8636:	4930      	ldr	r1, [pc, #192]	; (86f8 <z_add_timeout+0xf0>)
    8638:	e9d1 2000 	ldrd	r2, r0, [r1]
    863c:	f06f 0301 	mvn.w	r3, #1
    8640:	1a9b      	subs	r3, r3, r2
    8642:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    8646:	eb62 0000 	sbc.w	r0, r2, r0
    864a:	1b9e      	subs	r6, r3, r6
    864c:	eb60 0005 	sbc.w	r0, r0, r5
    8650:	2e01      	cmp	r6, #1
    8652:	f170 0300 	sbcs.w	r3, r0, #0
    8656:	da01      	bge.n	865c <z_add_timeout+0x54>
    8658:	2601      	movs	r6, #1
    865a:	2000      	movs	r0, #0
    865c:	e9c4 6004 	strd	r6, r0, [r4, #16]
    8660:	4e26      	ldr	r6, [pc, #152]	; (86fc <z_add_timeout+0xf4>)
    8662:	f8d6 c000 	ldr.w	ip, [r6]
    8666:	6875      	ldr	r5, [r6, #4]
    8668:	45b4      	cmp	ip, r6
    866a:	bf08      	it	eq
    866c:	f04f 0c00 	moveq.w	ip, #0
    8670:	f1bc 0f00 	cmp.w	ip, #0
    8674:	d10d      	bne.n	8692 <z_add_timeout+0x8a>
    8676:	e9c4 6500 	strd	r6, r5, [r4]
    867a:	602c      	str	r4, [r5, #0]
    867c:	6074      	str	r4, [r6, #4]
    867e:	e01c      	b.n	86ba <z_add_timeout+0xb2>
    8680:	f7ff ff74 	bl	856c <elapsed>
    8684:	3601      	adds	r6, #1
    8686:	f145 0500 	adc.w	r5, r5, #0
    868a:	1836      	adds	r6, r6, r0
    868c:	eb45 70e0 	adc.w	r0, r5, r0, asr #31
    8690:	e7e4      	b.n	865c <z_add_timeout+0x54>
    8692:	e9dc 2004 	ldrd	r2, r0, [ip, #16]
    8696:	e9d4 3104 	ldrd	r3, r1, [r4, #16]
    869a:	4293      	cmp	r3, r2
    869c:	eb71 0e00 	sbcs.w	lr, r1, r0
    86a0:	da1f      	bge.n	86e2 <z_add_timeout+0xda>
    86a2:	1ad2      	subs	r2, r2, r3
    86a4:	f8dc 3004 	ldr.w	r3, [ip, #4]
    86a8:	eb60 0001 	sbc.w	r0, r0, r1
    86ac:	e9cc 2004 	strd	r2, r0, [ip, #16]
    86b0:	e9c4 c300 	strd	ip, r3, [r4]
    86b4:	601c      	str	r4, [r3, #0]
    86b6:	f8cc 4004 	str.w	r4, [ip, #4]
    86ba:	6833      	ldr	r3, [r6, #0]
    86bc:	42b3      	cmp	r3, r6
    86be:	d00b      	beq.n	86d8 <z_add_timeout+0xd0>
    86c0:	429c      	cmp	r4, r3
    86c2:	d109      	bne.n	86d8 <z_add_timeout+0xd0>
    86c4:	f7ff ff5c 	bl	8580 <next_timeout>
    86c8:	b118      	cbz	r0, 86d2 <z_add_timeout+0xca>
    86ca:	4b0d      	ldr	r3, [pc, #52]	; (8700 <z_add_timeout+0xf8>)
    86cc:	691b      	ldr	r3, [r3, #16]
    86ce:	4283      	cmp	r3, r0
    86d0:	d002      	beq.n	86d8 <z_add_timeout+0xd0>
    86d2:	2100      	movs	r1, #0
    86d4:	f7fe f932 	bl	693c <sys_clock_set_timeout>
    86d8:	f387 8811 	msr	BASEPRI, r7
    86dc:	f3bf 8f6f 	isb	sy
    86e0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    86e2:	1a9b      	subs	r3, r3, r2
    86e4:	eb61 0100 	sbc.w	r1, r1, r0
    86e8:	45ac      	cmp	ip, r5
    86ea:	e9c4 3104 	strd	r3, r1, [r4, #16]
    86ee:	d0c2      	beq.n	8676 <z_add_timeout+0x6e>
    86f0:	f8dc c000 	ldr.w	ip, [ip]
    86f4:	e7bc      	b.n	8670 <z_add_timeout+0x68>
    86f6:	bf00      	nop
    86f8:	200006b8 	.word	0x200006b8
    86fc:	20000200 	.word	0x20000200
    8700:	20001648 	.word	0x20001648

00008704 <sys_clock_announce>:
    8704:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    8708:	4604      	mov	r4, r0
    870a:	f7ff fcb9 	bl	8080 <z_time_slice>
    870e:	f04f 0320 	mov.w	r3, #32
    8712:	f3ef 8611 	mrs	r6, BASEPRI
    8716:	f383 8812 	msr	BASEPRI_MAX, r3
    871a:	f3bf 8f6f 	isb	sy
    871e:	4f23      	ldr	r7, [pc, #140]	; (87ac <sys_clock_announce+0xa8>)
    8720:	f8df 808c 	ldr.w	r8, [pc, #140]	; 87b0 <sys_clock_announce+0xac>
    8724:	f8d8 0000 	ldr.w	r0, [r8]
    8728:	4a22      	ldr	r2, [pc, #136]	; (87b4 <sys_clock_announce+0xb0>)
    872a:	603c      	str	r4, [r7, #0]
    872c:	4540      	cmp	r0, r8
    872e:	e9d2 3e00 	ldrd	r3, lr, [r2]
    8732:	ea4f 71e4 	mov.w	r1, r4, asr #31
    8736:	d00b      	beq.n	8750 <sys_clock_announce+0x4c>
    8738:	b150      	cbz	r0, 8750 <sys_clock_announce+0x4c>
    873a:	e9d0 5c04 	ldrd	r5, ip, [r0, #16]
    873e:	42ac      	cmp	r4, r5
    8740:	eb71 090c 	sbcs.w	r9, r1, ip
    8744:	da16      	bge.n	8774 <sys_clock_announce+0x70>
    8746:	1b2d      	subs	r5, r5, r4
    8748:	eb6c 0c01 	sbc.w	ip, ip, r1
    874c:	e9c0 5c04 	strd	r5, ip, [r0, #16]
    8750:	18e3      	adds	r3, r4, r3
    8752:	eb4e 0101 	adc.w	r1, lr, r1
    8756:	2400      	movs	r4, #0
    8758:	e9c2 3100 	strd	r3, r1, [r2]
    875c:	603c      	str	r4, [r7, #0]
    875e:	f7ff ff0f 	bl	8580 <next_timeout>
    8762:	4621      	mov	r1, r4
    8764:	f7fe f8ea 	bl	693c <sys_clock_set_timeout>
    8768:	f386 8811 	msr	BASEPRI, r6
    876c:	f3bf 8f6f 	isb	sy
    8770:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    8774:	18eb      	adds	r3, r5, r3
    8776:	eb4e 71e5 	adc.w	r1, lr, r5, asr #31
    877a:	e9c2 3100 	strd	r3, r1, [r2]
    877e:	2200      	movs	r2, #0
    8780:	2300      	movs	r3, #0
    8782:	e9c0 2304 	strd	r2, r3, [r0, #16]
    8786:	f7ff ff23 	bl	85d0 <remove_timeout>
    878a:	f386 8811 	msr	BASEPRI, r6
    878e:	f3bf 8f6f 	isb	sy
    8792:	6883      	ldr	r3, [r0, #8]
    8794:	4798      	blx	r3
    8796:	f04f 0320 	mov.w	r3, #32
    879a:	f3ef 8611 	mrs	r6, BASEPRI
    879e:	f383 8812 	msr	BASEPRI_MAX, r3
    87a2:	f3bf 8f6f 	isb	sy
    87a6:	683c      	ldr	r4, [r7, #0]
    87a8:	1b64      	subs	r4, r4, r5
    87aa:	e7bb      	b.n	8724 <sys_clock_announce+0x20>
    87ac:	20001680 	.word	0x20001680
    87b0:	20000200 	.word	0x20000200
    87b4:	200006b8 	.word	0x200006b8

000087b8 <sys_clock_tick_get>:
    87b8:	b510      	push	{r4, lr}
    87ba:	f04f 0320 	mov.w	r3, #32
    87be:	f3ef 8411 	mrs	r4, BASEPRI
    87c2:	f383 8812 	msr	BASEPRI_MAX, r3
    87c6:	f3bf 8f6f 	isb	sy
    87ca:	f7ff fecf 	bl	856c <elapsed>
    87ce:	4a06      	ldr	r2, [pc, #24]	; (87e8 <sys_clock_tick_get+0x30>)
    87d0:	4603      	mov	r3, r0
    87d2:	e9d2 0100 	ldrd	r0, r1, [r2]
    87d6:	1818      	adds	r0, r3, r0
    87d8:	eb41 71e3 	adc.w	r1, r1, r3, asr #31
    87dc:	f384 8811 	msr	BASEPRI, r4
    87e0:	f3bf 8f6f 	isb	sy
    87e4:	bd10      	pop	{r4, pc}
    87e6:	bf00      	nop
    87e8:	200006b8 	.word	0x200006b8

000087ec <z_impl_k_poll>:
    87ec:	e92d 47f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, r9, sl, lr}
    87f0:	461d      	mov	r5, r3
    87f2:	4b29      	ldr	r3, [pc, #164]	; (8898 <z_impl_k_poll+0xac>)
    87f4:	689f      	ldr	r7, [r3, #8]
    87f6:	2301      	movs	r3, #1
    87f8:	f887 3060 	strb.w	r3, [r7, #96]	; 0x60
    87fc:	f887 3061 	strb.w	r3, [r7, #97]	; 0x61
    8800:	ea52 0305 	orrs.w	r3, r2, r5
    8804:	4616      	mov	r6, r2
    8806:	bf0c      	ite	eq
    8808:	2301      	moveq	r3, #1
    880a:	2300      	movne	r3, #0
    880c:	f107 0260 	add.w	r2, r7, #96	; 0x60
    8810:	4680      	mov	r8, r0
    8812:	f003 fb13 	bl	be3c <register_events>
    8816:	4681      	mov	r9, r0
    8818:	f04f 0320 	mov.w	r3, #32
    881c:	f3ef 8a11 	mrs	sl, BASEPRI
    8820:	f383 8812 	msr	BASEPRI_MAX, r3
    8824:	f3bf 8f6f 	isb	sy
    8828:	f897 4060 	ldrb.w	r4, [r7, #96]	; 0x60
    882c:	b964      	cbnz	r4, 8848 <z_impl_k_poll+0x5c>
    882e:	4601      	mov	r1, r0
    8830:	4652      	mov	r2, sl
    8832:	4640      	mov	r0, r8
    8834:	f003 fbd3 	bl	bfde <clear_event_registrations>
    8838:	f38a 8811 	msr	BASEPRI, sl
    883c:	f3bf 8f6f 	isb	sy
    8840:	4620      	mov	r0, r4
    8842:	b002      	add	sp, #8
    8844:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    8848:	2300      	movs	r3, #0
    884a:	f887 3060 	strb.w	r3, [r7, #96]	; 0x60
    884e:	ea56 0305 	orrs.w	r3, r6, r5
    8852:	d106      	bne.n	8862 <z_impl_k_poll+0x76>
    8854:	f38a 8811 	msr	BASEPRI, sl
    8858:	f3bf 8f6f 	isb	sy
    885c:	f06f 040a 	mvn.w	r4, #10
    8860:	e7ee      	b.n	8840 <z_impl_k_poll+0x54>
    8862:	e9cd 6500 	strd	r6, r5, [sp]
    8866:	4a0d      	ldr	r2, [pc, #52]	; (889c <z_impl_k_poll+0xb0>)
    8868:	480d      	ldr	r0, [pc, #52]	; (88a0 <z_impl_k_poll+0xb4>)
    886a:	4651      	mov	r1, sl
    886c:	f7ff fc4a 	bl	8104 <z_pend_curr>
    8870:	4604      	mov	r4, r0
    8872:	f04f 0320 	mov.w	r3, #32
    8876:	f3ef 8511 	mrs	r5, BASEPRI
    887a:	f383 8812 	msr	BASEPRI_MAX, r3
    887e:	f3bf 8f6f 	isb	sy
    8882:	462a      	mov	r2, r5
    8884:	4649      	mov	r1, r9
    8886:	4640      	mov	r0, r8
    8888:	f003 fba9 	bl	bfde <clear_event_registrations>
    888c:	f385 8811 	msr	BASEPRI, r5
    8890:	f3bf 8f6f 	isb	sy
    8894:	e7d4      	b.n	8840 <z_impl_k_poll+0x54>
    8896:	bf00      	nop
    8898:	20001648 	.word	0x20001648
    889c:	20000208 	.word	0x20000208
    88a0:	20001d08 	.word	0x20001d08

000088a4 <z_impl_k_poll_signal_raise>:
    88a4:	b538      	push	{r3, r4, r5, lr}
    88a6:	4603      	mov	r3, r0
    88a8:	f04f 0220 	mov.w	r2, #32
    88ac:	f3ef 8511 	mrs	r5, BASEPRI
    88b0:	f382 8812 	msr	BASEPRI_MAX, r2
    88b4:	f3bf 8f6f 	isb	sy
    88b8:	60c1      	str	r1, [r0, #12]
    88ba:	2101      	movs	r1, #1
    88bc:	6081      	str	r1, [r0, #8]
    88be:	6800      	ldr	r0, [r0, #0]
    88c0:	4283      	cmp	r3, r0
    88c2:	d106      	bne.n	88d2 <z_impl_k_poll_signal_raise+0x2e>
    88c4:	f385 8811 	msr	BASEPRI, r5
    88c8:	f3bf 8f6f 	isb	sy
    88cc:	2400      	movs	r4, #0
    88ce:	4620      	mov	r0, r4
    88d0:	bd38      	pop	{r3, r4, r5, pc}
    88d2:	e9d0 3200 	ldrd	r3, r2, [r0]
    88d6:	6013      	str	r3, [r2, #0]
    88d8:	605a      	str	r2, [r3, #4]
    88da:	2300      	movs	r3, #0
    88dc:	e9c0 3300 	strd	r3, r3, [r0]
    88e0:	f003 fb23 	bl	bf2a <signal_poll_event>
    88e4:	4629      	mov	r1, r5
    88e6:	4604      	mov	r4, r0
    88e8:	4801      	ldr	r0, [pc, #4]	; (88f0 <z_impl_k_poll_signal_raise+0x4c>)
    88ea:	f7ff fc6f 	bl	81cc <z_reschedule>
    88ee:	e7ee      	b.n	88ce <z_impl_k_poll_signal_raise+0x2a>
    88f0:	20001d08 	.word	0x20001d08

000088f4 <k_thread_system_pool_assign>:
    88f4:	4b01      	ldr	r3, [pc, #4]	; (88fc <k_thread_system_pool_assign+0x8>)
    88f6:	f8c0 30a8 	str.w	r3, [r0, #168]	; 0xa8
    88fa:	4770      	bx	lr
    88fc:	200002e0 	.word	0x200002e0

00008900 <boot_banner>:
    8900:	4801      	ldr	r0, [pc, #4]	; (8908 <boot_banner+0x8>)
    8902:	f001 bb42 	b.w	9f8a <printk>
    8906:	bf00      	nop
    8908:	0000e65d 	.word	0x0000e65d

0000890c <statics_init>:
    890c:	b538      	push	{r3, r4, r5, lr}
    890e:	4c06      	ldr	r4, [pc, #24]	; (8928 <statics_init+0x1c>)
    8910:	4d06      	ldr	r5, [pc, #24]	; (892c <statics_init+0x20>)
    8912:	42ac      	cmp	r4, r5
    8914:	d301      	bcc.n	891a <statics_init+0xe>
    8916:	2000      	movs	r0, #0
    8918:	bd38      	pop	{r3, r4, r5, pc}
    891a:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
    891e:	4620      	mov	r0, r4
    8920:	f003 fbb6 	bl	c090 <k_heap_init>
    8924:	3414      	adds	r4, #20
    8926:	e7f4      	b.n	8912 <statics_init+0x6>
    8928:	200002e0 	.word	0x200002e0
    892c:	200002f4 	.word	0x200002f4

00008930 <k_sys_work_q_init>:
    8930:	b51f      	push	{r0, r1, r2, r3, r4, lr}
    8932:	4b09      	ldr	r3, [pc, #36]	; (8958 <k_sys_work_q_init+0x28>)
    8934:	9302      	str	r3, [sp, #8]
    8936:	ab02      	add	r3, sp, #8
    8938:	2400      	movs	r4, #0
    893a:	9300      	str	r3, [sp, #0]
    893c:	4907      	ldr	r1, [pc, #28]	; (895c <k_sys_work_q_init+0x2c>)
    893e:	4808      	ldr	r0, [pc, #32]	; (8960 <k_sys_work_q_init+0x30>)
    8940:	f88d 400c 	strb.w	r4, [sp, #12]
    8944:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    8948:	f44f 6280 	mov.w	r2, #1024	; 0x400
    894c:	f000 f900 	bl	8b50 <k_work_queue_start>
    8950:	4620      	mov	r0, r4
    8952:	b004      	add	sp, #16
    8954:	bd10      	pop	{r4, pc}
    8956:	bf00      	nop
    8958:	0000e68b 	.word	0x0000e68b
    895c:	20003bc0 	.word	0x20003bc0
    8960:	200006c0 	.word	0x200006c0

00008964 <work_queue_main>:
    8964:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8968:	4e4a      	ldr	r6, [pc, #296]	; (8a94 <work_queue_main+0x130>)
    896a:	b085      	sub	sp, #20
    896c:	4604      	mov	r4, r0
    896e:	f04f 38ff 	mov.w	r8, #4294967295	; 0xffffffff
    8972:	f04f 39ff 	mov.w	r9, #4294967295	; 0xffffffff
    8976:	f04f 0320 	mov.w	r3, #32
    897a:	f3ef 8711 	mrs	r7, BASEPRI
    897e:	f383 8812 	msr	BASEPRI_MAX, r3
    8982:	f3bf 8f6f 	isb	sy
    8986:	f8d4 50b8 	ldr.w	r5, [r4, #184]	; 0xb8
    898a:	b98d      	cbnz	r5, 89b0 <work_queue_main+0x4c>
    898c:	2102      	movs	r1, #2
    898e:	f104 00d0 	add.w	r0, r4, #208	; 0xd0
    8992:	f003 fb85 	bl	c0a0 <flag_test_and_clear>
    8996:	2800      	cmp	r0, #0
    8998:	d143      	bne.n	8a22 <work_queue_main+0xbe>
    899a:	2300      	movs	r3, #0
    899c:	e9cd 8900 	strd	r8, r9, [sp]
    89a0:	9302      	str	r3, [sp, #8]
    89a2:	f104 02c0 	add.w	r2, r4, #192	; 0xc0
    89a6:	4639      	mov	r1, r7
    89a8:	483b      	ldr	r0, [pc, #236]	; (8a98 <work_queue_main+0x134>)
    89aa:	f7ff fdb3 	bl	8514 <z_sched_wait>
    89ae:	e7e2      	b.n	8976 <work_queue_main+0x12>
    89b0:	f8d4 20bc 	ldr.w	r2, [r4, #188]	; 0xbc
    89b4:	682b      	ldr	r3, [r5, #0]
    89b6:	f8c4 30b8 	str.w	r3, [r4, #184]	; 0xb8
    89ba:	4295      	cmp	r5, r2
    89bc:	bf08      	it	eq
    89be:	f8c4 30bc 	streq.w	r3, [r4, #188]	; 0xbc
    89c2:	f8d4 30d0 	ldr.w	r3, [r4, #208]	; 0xd0
    89c6:	f043 0302 	orr.w	r3, r3, #2
    89ca:	f8c4 30d0 	str.w	r3, [r4, #208]	; 0xd0
    89ce:	68eb      	ldr	r3, [r5, #12]
    89d0:	f023 0304 	bic.w	r3, r3, #4
    89d4:	f043 0301 	orr.w	r3, r3, #1
    89d8:	60eb      	str	r3, [r5, #12]
    89da:	686b      	ldr	r3, [r5, #4]
    89dc:	f387 8811 	msr	BASEPRI, r7
    89e0:	f3bf 8f6f 	isb	sy
    89e4:	4628      	mov	r0, r5
    89e6:	4798      	blx	r3
    89e8:	f04f 0320 	mov.w	r3, #32
    89ec:	f3ef 8b11 	mrs	fp, BASEPRI
    89f0:	f383 8812 	msr	BASEPRI_MAX, r3
    89f4:	f3bf 8f6f 	isb	sy
    89f8:	68eb      	ldr	r3, [r5, #12]
    89fa:	0799      	lsls	r1, r3, #30
    89fc:	f023 0201 	bic.w	r2, r3, #1
    8a00:	d419      	bmi.n	8a36 <work_queue_main+0xd2>
    8a02:	60ea      	str	r2, [r5, #12]
    8a04:	f8d4 30d0 	ldr.w	r3, [r4, #208]	; 0xd0
    8a08:	f023 0302 	bic.w	r3, r3, #2
    8a0c:	f8c4 30d0 	str.w	r3, [r4, #208]	; 0xd0
    8a10:	f38b 8811 	msr	BASEPRI, fp
    8a14:	f3bf 8f6f 	isb	sy
    8a18:	05db      	lsls	r3, r3, #23
    8a1a:	d4ac      	bmi.n	8976 <work_queue_main+0x12>
    8a1c:	f7ff fc74 	bl	8308 <z_impl_k_yield>
    8a20:	e7a9      	b.n	8976 <work_queue_main+0x12>
    8a22:	f104 05c8 	add.w	r5, r4, #200	; 0xc8
    8a26:	2200      	movs	r2, #0
    8a28:	2101      	movs	r1, #1
    8a2a:	4628      	mov	r0, r5
    8a2c:	f003 f965 	bl	bcfa <z_sched_wake>
    8a30:	2800      	cmp	r0, #0
    8a32:	d1f8      	bne.n	8a26 <work_queue_main+0xc2>
    8a34:	e7b1      	b.n	899a <work_queue_main+0x36>
    8a36:	6830      	ldr	r0, [r6, #0]
    8a38:	f023 0303 	bic.w	r3, r3, #3
    8a3c:	60eb      	str	r3, [r5, #12]
    8a3e:	2800      	cmp	r0, #0
    8a40:	d0e0      	beq.n	8a04 <work_queue_main+0xa0>
    8a42:	2700      	movs	r7, #0
    8a44:	f8d0 a000 	ldr.w	sl, [r0]
    8a48:	463b      	mov	r3, r7
    8a4a:	2800      	cmp	r0, #0
    8a4c:	d0da      	beq.n	8a04 <work_queue_main+0xa0>
    8a4e:	6842      	ldr	r2, [r0, #4]
    8a50:	4295      	cmp	r5, r2
    8a52:	4601      	mov	r1, r0
    8a54:	d10c      	bne.n	8a70 <work_queue_main+0x10c>
    8a56:	6801      	ldr	r1, [r0, #0]
    8a58:	b99f      	cbnz	r7, 8a82 <work_queue_main+0x11e>
    8a5a:	6872      	ldr	r2, [r6, #4]
    8a5c:	6031      	str	r1, [r6, #0]
    8a5e:	4282      	cmp	r2, r0
    8a60:	d100      	bne.n	8a64 <work_queue_main+0x100>
    8a62:	6071      	str	r1, [r6, #4]
    8a64:	f840 3b08 	str.w	r3, [r0], #8
    8a68:	f7ff f9ba 	bl	7de0 <z_impl_k_sem_give>
    8a6c:	4639      	mov	r1, r7
    8a6e:	2300      	movs	r3, #0
    8a70:	f1ba 0f00 	cmp.w	sl, #0
    8a74:	d00b      	beq.n	8a8e <work_queue_main+0x12a>
    8a76:	f8da 2000 	ldr.w	r2, [sl]
    8a7a:	4650      	mov	r0, sl
    8a7c:	460f      	mov	r7, r1
    8a7e:	4692      	mov	sl, r2
    8a80:	e7e3      	b.n	8a4a <work_queue_main+0xe6>
    8a82:	6039      	str	r1, [r7, #0]
    8a84:	6872      	ldr	r2, [r6, #4]
    8a86:	4282      	cmp	r2, r0
    8a88:	bf08      	it	eq
    8a8a:	6077      	streq	r7, [r6, #4]
    8a8c:	e7ea      	b.n	8a64 <work_queue_main+0x100>
    8a8e:	4652      	mov	r2, sl
    8a90:	e7f3      	b.n	8a7a <work_queue_main+0x116>
    8a92:	bf00      	nop
    8a94:	20001684 	.word	0x20001684
    8a98:	20001d08 	.word	0x20001d08

00008a9c <submit_to_queue_locked>:
    8a9c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8a9e:	68c3      	ldr	r3, [r0, #12]
    8aa0:	079a      	lsls	r2, r3, #30
    8aa2:	4604      	mov	r4, r0
    8aa4:	460f      	mov	r7, r1
    8aa6:	f3c3 0640 	ubfx	r6, r3, #1, #1
    8aaa:	d42c      	bmi.n	8b06 <submit_to_queue_locked+0x6a>
    8aac:	075b      	lsls	r3, r3, #29
    8aae:	d41a      	bmi.n	8ae6 <submit_to_queue_locked+0x4a>
    8ab0:	680b      	ldr	r3, [r1, #0]
    8ab2:	b90b      	cbnz	r3, 8ab8 <submit_to_queue_locked+0x1c>
    8ab4:	6883      	ldr	r3, [r0, #8]
    8ab6:	600b      	str	r3, [r1, #0]
    8ab8:	68e3      	ldr	r3, [r4, #12]
    8aba:	07dd      	lsls	r5, r3, #31
    8abc:	bf44      	itt	mi
    8abe:	68a3      	ldrmi	r3, [r4, #8]
    8ac0:	603b      	strmi	r3, [r7, #0]
    8ac2:	683d      	ldr	r5, [r7, #0]
    8ac4:	bf4c      	ite	mi
    8ac6:	2602      	movmi	r6, #2
    8ac8:	2601      	movpl	r6, #1
    8aca:	2d00      	cmp	r5, #0
    8acc:	d03a      	beq.n	8b44 <submit_to_queue_locked+0xa8>
    8ace:	4b1f      	ldr	r3, [pc, #124]	; (8b4c <submit_to_queue_locked+0xb0>)
    8ad0:	689b      	ldr	r3, [r3, #8]
    8ad2:	42ab      	cmp	r3, r5
    8ad4:	d00a      	beq.n	8aec <submit_to_queue_locked+0x50>
    8ad6:	f8d5 30d0 	ldr.w	r3, [r5, #208]	; 0xd0
    8ada:	07d8      	lsls	r0, r3, #31
    8adc:	f3c3 0280 	ubfx	r2, r3, #2, #1
    8ae0:	d414      	bmi.n	8b0c <submit_to_queue_locked+0x70>
    8ae2:	f06f 0612 	mvn.w	r6, #18
    8ae6:	2300      	movs	r3, #0
    8ae8:	603b      	str	r3, [r7, #0]
    8aea:	e025      	b.n	8b38 <submit_to_queue_locked+0x9c>
    8aec:	f003 f819 	bl	bb22 <k_is_in_isr>
    8af0:	f8d5 30d0 	ldr.w	r3, [r5, #208]	; 0xd0
    8af4:	2800      	cmp	r0, #0
    8af6:	d1f0      	bne.n	8ada <submit_to_queue_locked+0x3e>
    8af8:	07d9      	lsls	r1, r3, #31
    8afa:	f3c3 02c0 	ubfx	r2, r3, #3, #1
    8afe:	d5f0      	bpl.n	8ae2 <submit_to_queue_locked+0x46>
    8b00:	b152      	cbz	r2, 8b18 <submit_to_queue_locked+0x7c>
    8b02:	075b      	lsls	r3, r3, #29
    8b04:	d408      	bmi.n	8b18 <submit_to_queue_locked+0x7c>
    8b06:	f06f 060f 	mvn.w	r6, #15
    8b0a:	e7ec      	b.n	8ae6 <submit_to_queue_locked+0x4a>
    8b0c:	2a00      	cmp	r2, #0
    8b0e:	d1fa      	bne.n	8b06 <submit_to_queue_locked+0x6a>
    8b10:	f3c3 03c0 	ubfx	r3, r3, #3, #1
    8b14:	2b00      	cmp	r3, #0
    8b16:	d1f6      	bne.n	8b06 <submit_to_queue_locked+0x6a>
    8b18:	2300      	movs	r3, #0
    8b1a:	6023      	str	r3, [r4, #0]
    8b1c:	f8d5 30bc 	ldr.w	r3, [r5, #188]	; 0xbc
    8b20:	b963      	cbnz	r3, 8b3c <submit_to_queue_locked+0xa0>
    8b22:	e9c5 442e 	strd	r4, r4, [r5, #184]	; 0xb8
    8b26:	4628      	mov	r0, r5
    8b28:	f003 fac5 	bl	c0b6 <notify_queue_locked.isra.0>
    8b2c:	68e3      	ldr	r3, [r4, #12]
    8b2e:	f043 0304 	orr.w	r3, r3, #4
    8b32:	60e3      	str	r3, [r4, #12]
    8b34:	683b      	ldr	r3, [r7, #0]
    8b36:	60a3      	str	r3, [r4, #8]
    8b38:	4630      	mov	r0, r6
    8b3a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    8b3c:	601c      	str	r4, [r3, #0]
    8b3e:	f8c5 40bc 	str.w	r4, [r5, #188]	; 0xbc
    8b42:	e7f0      	b.n	8b26 <submit_to_queue_locked+0x8a>
    8b44:	f06f 0615 	mvn.w	r6, #21
    8b48:	e7cd      	b.n	8ae6 <submit_to_queue_locked+0x4a>
    8b4a:	bf00      	nop
    8b4c:	20001648 	.word	0x20001648

00008b50 <k_work_queue_start>:
    8b50:	b5f0      	push	{r4, r5, r6, r7, lr}
    8b52:	b089      	sub	sp, #36	; 0x24
    8b54:	4604      	mov	r4, r0
    8b56:	2000      	movs	r0, #0
    8b58:	e9c4 002e 	strd	r0, r0, [r4, #184]	; 0xb8
    8b5c:	9d0e      	ldr	r5, [sp, #56]	; 0x38
    8b5e:	f104 00c0 	add.w	r0, r4, #192	; 0xc0
    8b62:	e9c4 0030 	strd	r0, r0, [r4, #192]	; 0xc0
    8b66:	f104 00c8 	add.w	r0, r4, #200	; 0xc8
    8b6a:	e9c4 0032 	strd	r0, r0, [r4, #200]	; 0xc8
    8b6e:	b31d      	cbz	r5, 8bb8 <k_work_queue_start+0x68>
    8b70:	7928      	ldrb	r0, [r5, #4]
    8b72:	2800      	cmp	r0, #0
    8b74:	f240 1001 	movw	r0, #257	; 0x101
    8b78:	bf08      	it	eq
    8b7a:	2001      	moveq	r0, #1
    8b7c:	f8c4 00d0 	str.w	r0, [r4, #208]	; 0xd0
    8b80:	2000      	movs	r0, #0
    8b82:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
    8b86:	f04f 37ff 	mov.w	r7, #4294967295	; 0xffffffff
    8b8a:	e9cd 3003 	strd	r3, r0, [sp, #12]
    8b8e:	e9cd 0001 	strd	r0, r0, [sp, #4]
    8b92:	e9cd 6706 	strd	r6, r7, [sp, #24]
    8b96:	4b09      	ldr	r3, [pc, #36]	; (8bbc <k_work_queue_start+0x6c>)
    8b98:	9400      	str	r4, [sp, #0]
    8b9a:	4620      	mov	r0, r4
    8b9c:	f7fe ffc0 	bl	7b20 <z_impl_k_thread_create>
    8ba0:	b125      	cbz	r5, 8bac <k_work_queue_start+0x5c>
    8ba2:	6829      	ldr	r1, [r5, #0]
    8ba4:	b111      	cbz	r1, 8bac <k_work_queue_start+0x5c>
    8ba6:	4620      	mov	r0, r4
    8ba8:	f7fe fef6 	bl	7998 <z_impl_k_thread_name_set>
    8bac:	4620      	mov	r0, r4
    8bae:	b009      	add	sp, #36	; 0x24
    8bb0:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
    8bb4:	f002 bfbd 	b.w	bb32 <z_impl_k_thread_start>
    8bb8:	2001      	movs	r0, #1
    8bba:	e7df      	b.n	8b7c <k_work_queue_start+0x2c>
    8bbc:	00008965 	.word	0x00008965

00008bc0 <malloc>:
    8bc0:	4b02      	ldr	r3, [pc, #8]	; (8bcc <malloc+0xc>)
    8bc2:	4601      	mov	r1, r0
    8bc4:	6818      	ldr	r0, [r3, #0]
    8bc6:	f000 b84d 	b.w	8c64 <_malloc_r>
    8bca:	bf00      	nop
    8bcc:	20000210 	.word	0x20000210

00008bd0 <_free_r>:
    8bd0:	b538      	push	{r3, r4, r5, lr}
    8bd2:	4605      	mov	r5, r0
    8bd4:	2900      	cmp	r1, #0
    8bd6:	d041      	beq.n	8c5c <_free_r+0x8c>
    8bd8:	f851 3c04 	ldr.w	r3, [r1, #-4]
    8bdc:	1f0c      	subs	r4, r1, #4
    8bde:	2b00      	cmp	r3, #0
    8be0:	bfb8      	it	lt
    8be2:	18e4      	addlt	r4, r4, r3
    8be4:	f000 fad2 	bl	918c <__malloc_lock>
    8be8:	4a1d      	ldr	r2, [pc, #116]	; (8c60 <_free_r+0x90>)
    8bea:	6813      	ldr	r3, [r2, #0]
    8bec:	b933      	cbnz	r3, 8bfc <_free_r+0x2c>
    8bee:	6063      	str	r3, [r4, #4]
    8bf0:	6014      	str	r4, [r2, #0]
    8bf2:	4628      	mov	r0, r5
    8bf4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    8bf8:	f000 bace 	b.w	9198 <__malloc_unlock>
    8bfc:	42a3      	cmp	r3, r4
    8bfe:	d908      	bls.n	8c12 <_free_r+0x42>
    8c00:	6820      	ldr	r0, [r4, #0]
    8c02:	1821      	adds	r1, r4, r0
    8c04:	428b      	cmp	r3, r1
    8c06:	bf01      	itttt	eq
    8c08:	6819      	ldreq	r1, [r3, #0]
    8c0a:	685b      	ldreq	r3, [r3, #4]
    8c0c:	1809      	addeq	r1, r1, r0
    8c0e:	6021      	streq	r1, [r4, #0]
    8c10:	e7ed      	b.n	8bee <_free_r+0x1e>
    8c12:	461a      	mov	r2, r3
    8c14:	685b      	ldr	r3, [r3, #4]
    8c16:	b10b      	cbz	r3, 8c1c <_free_r+0x4c>
    8c18:	42a3      	cmp	r3, r4
    8c1a:	d9fa      	bls.n	8c12 <_free_r+0x42>
    8c1c:	6811      	ldr	r1, [r2, #0]
    8c1e:	1850      	adds	r0, r2, r1
    8c20:	42a0      	cmp	r0, r4
    8c22:	d10b      	bne.n	8c3c <_free_r+0x6c>
    8c24:	6820      	ldr	r0, [r4, #0]
    8c26:	4401      	add	r1, r0
    8c28:	1850      	adds	r0, r2, r1
    8c2a:	4283      	cmp	r3, r0
    8c2c:	6011      	str	r1, [r2, #0]
    8c2e:	d1e0      	bne.n	8bf2 <_free_r+0x22>
    8c30:	6818      	ldr	r0, [r3, #0]
    8c32:	685b      	ldr	r3, [r3, #4]
    8c34:	6053      	str	r3, [r2, #4]
    8c36:	4408      	add	r0, r1
    8c38:	6010      	str	r0, [r2, #0]
    8c3a:	e7da      	b.n	8bf2 <_free_r+0x22>
    8c3c:	d902      	bls.n	8c44 <_free_r+0x74>
    8c3e:	230c      	movs	r3, #12
    8c40:	602b      	str	r3, [r5, #0]
    8c42:	e7d6      	b.n	8bf2 <_free_r+0x22>
    8c44:	6820      	ldr	r0, [r4, #0]
    8c46:	1821      	adds	r1, r4, r0
    8c48:	428b      	cmp	r3, r1
    8c4a:	bf04      	itt	eq
    8c4c:	6819      	ldreq	r1, [r3, #0]
    8c4e:	685b      	ldreq	r3, [r3, #4]
    8c50:	6063      	str	r3, [r4, #4]
    8c52:	bf04      	itt	eq
    8c54:	1809      	addeq	r1, r1, r0
    8c56:	6021      	streq	r1, [r4, #0]
    8c58:	6054      	str	r4, [r2, #4]
    8c5a:	e7ca      	b.n	8bf2 <_free_r+0x22>
    8c5c:	bd38      	pop	{r3, r4, r5, pc}
    8c5e:	bf00      	nop
    8c60:	20001690 	.word	0x20001690

00008c64 <_malloc_r>:
    8c64:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8c66:	1ccd      	adds	r5, r1, #3
    8c68:	f025 0503 	bic.w	r5, r5, #3
    8c6c:	3508      	adds	r5, #8
    8c6e:	2d0c      	cmp	r5, #12
    8c70:	bf38      	it	cc
    8c72:	250c      	movcc	r5, #12
    8c74:	2d00      	cmp	r5, #0
    8c76:	4606      	mov	r6, r0
    8c78:	db01      	blt.n	8c7e <_malloc_r+0x1a>
    8c7a:	42a9      	cmp	r1, r5
    8c7c:	d903      	bls.n	8c86 <_malloc_r+0x22>
    8c7e:	230c      	movs	r3, #12
    8c80:	6033      	str	r3, [r6, #0]
    8c82:	2000      	movs	r0, #0
    8c84:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    8c86:	f000 fa81 	bl	918c <__malloc_lock>
    8c8a:	4921      	ldr	r1, [pc, #132]	; (8d10 <_malloc_r+0xac>)
    8c8c:	680a      	ldr	r2, [r1, #0]
    8c8e:	4614      	mov	r4, r2
    8c90:	b99c      	cbnz	r4, 8cba <_malloc_r+0x56>
    8c92:	4f20      	ldr	r7, [pc, #128]	; (8d14 <_malloc_r+0xb0>)
    8c94:	683b      	ldr	r3, [r7, #0]
    8c96:	b923      	cbnz	r3, 8ca2 <_malloc_r+0x3e>
    8c98:	4621      	mov	r1, r4
    8c9a:	4630      	mov	r0, r6
    8c9c:	f000 f854 	bl	8d48 <_sbrk_r>
    8ca0:	6038      	str	r0, [r7, #0]
    8ca2:	4629      	mov	r1, r5
    8ca4:	4630      	mov	r0, r6
    8ca6:	f000 f84f 	bl	8d48 <_sbrk_r>
    8caa:	1c43      	adds	r3, r0, #1
    8cac:	d123      	bne.n	8cf6 <_malloc_r+0x92>
    8cae:	230c      	movs	r3, #12
    8cb0:	6033      	str	r3, [r6, #0]
    8cb2:	4630      	mov	r0, r6
    8cb4:	f000 fa70 	bl	9198 <__malloc_unlock>
    8cb8:	e7e3      	b.n	8c82 <_malloc_r+0x1e>
    8cba:	6823      	ldr	r3, [r4, #0]
    8cbc:	1b5b      	subs	r3, r3, r5
    8cbe:	d417      	bmi.n	8cf0 <_malloc_r+0x8c>
    8cc0:	2b0b      	cmp	r3, #11
    8cc2:	d903      	bls.n	8ccc <_malloc_r+0x68>
    8cc4:	6023      	str	r3, [r4, #0]
    8cc6:	441c      	add	r4, r3
    8cc8:	6025      	str	r5, [r4, #0]
    8cca:	e004      	b.n	8cd6 <_malloc_r+0x72>
    8ccc:	6863      	ldr	r3, [r4, #4]
    8cce:	42a2      	cmp	r2, r4
    8cd0:	bf0c      	ite	eq
    8cd2:	600b      	streq	r3, [r1, #0]
    8cd4:	6053      	strne	r3, [r2, #4]
    8cd6:	4630      	mov	r0, r6
    8cd8:	f000 fa5e 	bl	9198 <__malloc_unlock>
    8cdc:	f104 000b 	add.w	r0, r4, #11
    8ce0:	1d23      	adds	r3, r4, #4
    8ce2:	f020 0007 	bic.w	r0, r0, #7
    8ce6:	1ac2      	subs	r2, r0, r3
    8ce8:	bf1c      	itt	ne
    8cea:	1a1b      	subne	r3, r3, r0
    8cec:	50a3      	strne	r3, [r4, r2]
    8cee:	e7c9      	b.n	8c84 <_malloc_r+0x20>
    8cf0:	4622      	mov	r2, r4
    8cf2:	6864      	ldr	r4, [r4, #4]
    8cf4:	e7cc      	b.n	8c90 <_malloc_r+0x2c>
    8cf6:	1cc4      	adds	r4, r0, #3
    8cf8:	f024 0403 	bic.w	r4, r4, #3
    8cfc:	42a0      	cmp	r0, r4
    8cfe:	d0e3      	beq.n	8cc8 <_malloc_r+0x64>
    8d00:	1a21      	subs	r1, r4, r0
    8d02:	4630      	mov	r0, r6
    8d04:	f000 f820 	bl	8d48 <_sbrk_r>
    8d08:	3001      	adds	r0, #1
    8d0a:	d1dd      	bne.n	8cc8 <_malloc_r+0x64>
    8d0c:	e7cf      	b.n	8cae <_malloc_r+0x4a>
    8d0e:	bf00      	nop
    8d10:	20001690 	.word	0x20001690
    8d14:	2000168c 	.word	0x2000168c

00008d18 <iprintf>:
    8d18:	b40f      	push	{r0, r1, r2, r3}
    8d1a:	4b0a      	ldr	r3, [pc, #40]	; (8d44 <iprintf+0x2c>)
    8d1c:	b513      	push	{r0, r1, r4, lr}
    8d1e:	681c      	ldr	r4, [r3, #0]
    8d20:	b124      	cbz	r4, 8d2c <iprintf+0x14>
    8d22:	69a3      	ldr	r3, [r4, #24]
    8d24:	b913      	cbnz	r3, 8d2c <iprintf+0x14>
    8d26:	4620      	mov	r0, r4
    8d28:	f000 f9b2 	bl	9090 <__sinit>
    8d2c:	ab05      	add	r3, sp, #20
    8d2e:	9a04      	ldr	r2, [sp, #16]
    8d30:	68a1      	ldr	r1, [r4, #8]
    8d32:	9301      	str	r3, [sp, #4]
    8d34:	4620      	mov	r0, r4
    8d36:	f000 fb31 	bl	939c <_vfiprintf_r>
    8d3a:	b002      	add	sp, #8
    8d3c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    8d40:	b004      	add	sp, #16
    8d42:	4770      	bx	lr
    8d44:	20000210 	.word	0x20000210

00008d48 <_sbrk_r>:
    8d48:	b538      	push	{r3, r4, r5, lr}
    8d4a:	4d06      	ldr	r5, [pc, #24]	; (8d64 <_sbrk_r+0x1c>)
    8d4c:	2300      	movs	r3, #0
    8d4e:	4604      	mov	r4, r0
    8d50:	4608      	mov	r0, r1
    8d52:	602b      	str	r3, [r5, #0]
    8d54:	f7fc feb6 	bl	5ac4 <_sbrk>
    8d58:	1c43      	adds	r3, r0, #1
    8d5a:	d102      	bne.n	8d62 <_sbrk_r+0x1a>
    8d5c:	682b      	ldr	r3, [r5, #0]
    8d5e:	b103      	cbz	r3, 8d62 <_sbrk_r+0x1a>
    8d60:	6023      	str	r3, [r4, #0]
    8d62:	bd38      	pop	{r3, r4, r5, pc}
    8d64:	20001694 	.word	0x20001694

00008d68 <raise>:
    8d68:	4b02      	ldr	r3, [pc, #8]	; (8d74 <raise+0xc>)
    8d6a:	4601      	mov	r1, r0
    8d6c:	6818      	ldr	r0, [r3, #0]
    8d6e:	f003 ba0e 	b.w	c18e <_raise_r>
    8d72:	bf00      	nop
    8d74:	20000210 	.word	0x20000210

00008d78 <_kill_r>:
    8d78:	b538      	push	{r3, r4, r5, lr}
    8d7a:	4d07      	ldr	r5, [pc, #28]	; (8d98 <_kill_r+0x20>)
    8d7c:	2300      	movs	r3, #0
    8d7e:	4604      	mov	r4, r0
    8d80:	4608      	mov	r0, r1
    8d82:	4611      	mov	r1, r2
    8d84:	602b      	str	r3, [r5, #0]
    8d86:	f002 faad 	bl	b2e4 <_kill>
    8d8a:	1c43      	adds	r3, r0, #1
    8d8c:	d102      	bne.n	8d94 <_kill_r+0x1c>
    8d8e:	682b      	ldr	r3, [r5, #0]
    8d90:	b103      	cbz	r3, 8d94 <_kill_r+0x1c>
    8d92:	6023      	str	r3, [r4, #0]
    8d94:	bd38      	pop	{r3, r4, r5, pc}
    8d96:	bf00      	nop
    8d98:	20001694 	.word	0x20001694

00008d9c <sniprintf>:
    8d9c:	b40c      	push	{r2, r3}
    8d9e:	b530      	push	{r4, r5, lr}
    8da0:	4b17      	ldr	r3, [pc, #92]	; (8e00 <sniprintf+0x64>)
    8da2:	1e0c      	subs	r4, r1, #0
    8da4:	681d      	ldr	r5, [r3, #0]
    8da6:	b09d      	sub	sp, #116	; 0x74
    8da8:	da08      	bge.n	8dbc <sniprintf+0x20>
    8daa:	238b      	movs	r3, #139	; 0x8b
    8dac:	602b      	str	r3, [r5, #0]
    8dae:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    8db2:	b01d      	add	sp, #116	; 0x74
    8db4:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
    8db8:	b002      	add	sp, #8
    8dba:	4770      	bx	lr
    8dbc:	f44f 7302 	mov.w	r3, #520	; 0x208
    8dc0:	f8ad 3014 	strh.w	r3, [sp, #20]
    8dc4:	bf14      	ite	ne
    8dc6:	f104 33ff 	addne.w	r3, r4, #4294967295	; 0xffffffff
    8dca:	4623      	moveq	r3, r4
    8dcc:	9304      	str	r3, [sp, #16]
    8dce:	9307      	str	r3, [sp, #28]
    8dd0:	f64f 73ff 	movw	r3, #65535	; 0xffff
    8dd4:	9002      	str	r0, [sp, #8]
    8dd6:	9006      	str	r0, [sp, #24]
    8dd8:	f8ad 3016 	strh.w	r3, [sp, #22]
    8ddc:	9a20      	ldr	r2, [sp, #128]	; 0x80
    8dde:	ab21      	add	r3, sp, #132	; 0x84
    8de0:	a902      	add	r1, sp, #8
    8de2:	4628      	mov	r0, r5
    8de4:	9301      	str	r3, [sp, #4]
    8de6:	f000 f9dd 	bl	91a4 <_svfiprintf_r>
    8dea:	1c43      	adds	r3, r0, #1
    8dec:	bfbc      	itt	lt
    8dee:	238b      	movlt	r3, #139	; 0x8b
    8df0:	602b      	strlt	r3, [r5, #0]
    8df2:	2c00      	cmp	r4, #0
    8df4:	d0dd      	beq.n	8db2 <sniprintf+0x16>
    8df6:	9b02      	ldr	r3, [sp, #8]
    8df8:	2200      	movs	r2, #0
    8dfa:	701a      	strb	r2, [r3, #0]
    8dfc:	e7d9      	b.n	8db2 <sniprintf+0x16>
    8dfe:	bf00      	nop
    8e00:	20000210 	.word	0x20000210

00008e04 <_strtol_l.constprop.0>:
    8e04:	2b24      	cmp	r3, #36	; 0x24
    8e06:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    8e0a:	4686      	mov	lr, r0
    8e0c:	4690      	mov	r8, r2
    8e0e:	d801      	bhi.n	8e14 <_strtol_l.constprop.0+0x10>
    8e10:	2b01      	cmp	r3, #1
    8e12:	d106      	bne.n	8e22 <_strtol_l.constprop.0+0x1e>
    8e14:	f002 fa81 	bl	b31a <__errno>
    8e18:	2316      	movs	r3, #22
    8e1a:	6003      	str	r3, [r0, #0]
    8e1c:	2000      	movs	r0, #0
    8e1e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    8e22:	4836      	ldr	r0, [pc, #216]	; (8efc <_strtol_l.constprop.0+0xf8>)
    8e24:	460d      	mov	r5, r1
    8e26:	462a      	mov	r2, r5
    8e28:	f815 4b01 	ldrb.w	r4, [r5], #1
    8e2c:	5d06      	ldrb	r6, [r0, r4]
    8e2e:	f016 0608 	ands.w	r6, r6, #8
    8e32:	d1f8      	bne.n	8e26 <_strtol_l.constprop.0+0x22>
    8e34:	2c2d      	cmp	r4, #45	; 0x2d
    8e36:	d124      	bne.n	8e82 <_strtol_l.constprop.0+0x7e>
    8e38:	782c      	ldrb	r4, [r5, #0]
    8e3a:	2601      	movs	r6, #1
    8e3c:	1c95      	adds	r5, r2, #2
    8e3e:	bb2b      	cbnz	r3, 8e8c <_strtol_l.constprop.0+0x88>
    8e40:	2c30      	cmp	r4, #48	; 0x30
    8e42:	d030      	beq.n	8ea6 <_strtol_l.constprop.0+0xa2>
    8e44:	230a      	movs	r3, #10
    8e46:	f106 4c00 	add.w	ip, r6, #2147483648	; 0x80000000
    8e4a:	f10c 3cff 	add.w	ip, ip, #4294967295	; 0xffffffff
    8e4e:	2200      	movs	r2, #0
    8e50:	fbbc f9f3 	udiv	r9, ip, r3
    8e54:	4610      	mov	r0, r2
    8e56:	fb03 ca19 	mls	sl, r3, r9, ip
    8e5a:	f1a4 0730 	sub.w	r7, r4, #48	; 0x30
    8e5e:	2f09      	cmp	r7, #9
    8e60:	d828      	bhi.n	8eb4 <_strtol_l.constprop.0+0xb0>
    8e62:	463c      	mov	r4, r7
    8e64:	42a3      	cmp	r3, r4
    8e66:	dd34      	ble.n	8ed2 <_strtol_l.constprop.0+0xce>
    8e68:	1c57      	adds	r7, r2, #1
    8e6a:	d007      	beq.n	8e7c <_strtol_l.constprop.0+0x78>
    8e6c:	4581      	cmp	r9, r0
    8e6e:	d32d      	bcc.n	8ecc <_strtol_l.constprop.0+0xc8>
    8e70:	d101      	bne.n	8e76 <_strtol_l.constprop.0+0x72>
    8e72:	45a2      	cmp	sl, r4
    8e74:	db2a      	blt.n	8ecc <_strtol_l.constprop.0+0xc8>
    8e76:	fb00 4003 	mla	r0, r0, r3, r4
    8e7a:	2201      	movs	r2, #1
    8e7c:	f815 4b01 	ldrb.w	r4, [r5], #1
    8e80:	e7eb      	b.n	8e5a <_strtol_l.constprop.0+0x56>
    8e82:	2c2b      	cmp	r4, #43	; 0x2b
    8e84:	bf04      	itt	eq
    8e86:	782c      	ldrbeq	r4, [r5, #0]
    8e88:	1c95      	addeq	r5, r2, #2
    8e8a:	e7d8      	b.n	8e3e <_strtol_l.constprop.0+0x3a>
    8e8c:	2b10      	cmp	r3, #16
    8e8e:	d1da      	bne.n	8e46 <_strtol_l.constprop.0+0x42>
    8e90:	2c30      	cmp	r4, #48	; 0x30
    8e92:	d1d8      	bne.n	8e46 <_strtol_l.constprop.0+0x42>
    8e94:	782a      	ldrb	r2, [r5, #0]
    8e96:	f002 02df 	and.w	r2, r2, #223	; 0xdf
    8e9a:	2a58      	cmp	r2, #88	; 0x58
    8e9c:	d1d3      	bne.n	8e46 <_strtol_l.constprop.0+0x42>
    8e9e:	786c      	ldrb	r4, [r5, #1]
    8ea0:	2310      	movs	r3, #16
    8ea2:	3502      	adds	r5, #2
    8ea4:	e7cf      	b.n	8e46 <_strtol_l.constprop.0+0x42>
    8ea6:	782b      	ldrb	r3, [r5, #0]
    8ea8:	f003 03df 	and.w	r3, r3, #223	; 0xdf
    8eac:	2b58      	cmp	r3, #88	; 0x58
    8eae:	d0f6      	beq.n	8e9e <_strtol_l.constprop.0+0x9a>
    8eb0:	2308      	movs	r3, #8
    8eb2:	e7c8      	b.n	8e46 <_strtol_l.constprop.0+0x42>
    8eb4:	f1a4 0741 	sub.w	r7, r4, #65	; 0x41
    8eb8:	2f19      	cmp	r7, #25
    8eba:	d801      	bhi.n	8ec0 <_strtol_l.constprop.0+0xbc>
    8ebc:	3c37      	subs	r4, #55	; 0x37
    8ebe:	e7d1      	b.n	8e64 <_strtol_l.constprop.0+0x60>
    8ec0:	f1a4 0761 	sub.w	r7, r4, #97	; 0x61
    8ec4:	2f19      	cmp	r7, #25
    8ec6:	d804      	bhi.n	8ed2 <_strtol_l.constprop.0+0xce>
    8ec8:	3c57      	subs	r4, #87	; 0x57
    8eca:	e7cb      	b.n	8e64 <_strtol_l.constprop.0+0x60>
    8ecc:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    8ed0:	e7d4      	b.n	8e7c <_strtol_l.constprop.0+0x78>
    8ed2:	1c53      	adds	r3, r2, #1
    8ed4:	d108      	bne.n	8ee8 <_strtol_l.constprop.0+0xe4>
    8ed6:	2322      	movs	r3, #34	; 0x22
    8ed8:	f8ce 3000 	str.w	r3, [lr]
    8edc:	4660      	mov	r0, ip
    8ede:	f1b8 0f00 	cmp.w	r8, #0
    8ee2:	d09c      	beq.n	8e1e <_strtol_l.constprop.0+0x1a>
    8ee4:	1e69      	subs	r1, r5, #1
    8ee6:	e006      	b.n	8ef6 <_strtol_l.constprop.0+0xf2>
    8ee8:	b106      	cbz	r6, 8eec <_strtol_l.constprop.0+0xe8>
    8eea:	4240      	negs	r0, r0
    8eec:	f1b8 0f00 	cmp.w	r8, #0
    8ef0:	d095      	beq.n	8e1e <_strtol_l.constprop.0+0x1a>
    8ef2:	2a00      	cmp	r2, #0
    8ef4:	d1f6      	bne.n	8ee4 <_strtol_l.constprop.0+0xe0>
    8ef6:	f8c8 1000 	str.w	r1, [r8]
    8efa:	e790      	b.n	8e1e <_strtol_l.constprop.0+0x1a>
    8efc:	0000e695 	.word	0x0000e695

00008f00 <strtol>:
    8f00:	4613      	mov	r3, r2
    8f02:	460a      	mov	r2, r1
    8f04:	4601      	mov	r1, r0
    8f06:	4802      	ldr	r0, [pc, #8]	; (8f10 <strtol+0x10>)
    8f08:	6800      	ldr	r0, [r0, #0]
    8f0a:	f7ff bf7b 	b.w	8e04 <_strtol_l.constprop.0>
    8f0e:	bf00      	nop
    8f10:	20000210 	.word	0x20000210

00008f14 <_strtoul_l.constprop.0>:
    8f14:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    8f18:	4e36      	ldr	r6, [pc, #216]	; (8ff4 <_strtoul_l.constprop.0+0xe0>)
    8f1a:	4686      	mov	lr, r0
    8f1c:	460d      	mov	r5, r1
    8f1e:	4628      	mov	r0, r5
    8f20:	f815 4b01 	ldrb.w	r4, [r5], #1
    8f24:	5d37      	ldrb	r7, [r6, r4]
    8f26:	f017 0708 	ands.w	r7, r7, #8
    8f2a:	d1f8      	bne.n	8f1e <_strtoul_l.constprop.0+0xa>
    8f2c:	2c2d      	cmp	r4, #45	; 0x2d
    8f2e:	d126      	bne.n	8f7e <_strtoul_l.constprop.0+0x6a>
    8f30:	782c      	ldrb	r4, [r5, #0]
    8f32:	2701      	movs	r7, #1
    8f34:	1c85      	adds	r5, r0, #2
    8f36:	bb3b      	cbnz	r3, 8f88 <_strtoul_l.constprop.0+0x74>
    8f38:	2c30      	cmp	r4, #48	; 0x30
    8f3a:	d032      	beq.n	8fa2 <_strtoul_l.constprop.0+0x8e>
    8f3c:	230a      	movs	r3, #10
    8f3e:	f04f 38ff 	mov.w	r8, #4294967295	; 0xffffffff
    8f42:	2600      	movs	r6, #0
    8f44:	fbb8 f8f3 	udiv	r8, r8, r3
    8f48:	fb03 f908 	mul.w	r9, r3, r8
    8f4c:	ea6f 0909 	mvn.w	r9, r9
    8f50:	4630      	mov	r0, r6
    8f52:	f1a4 0c30 	sub.w	ip, r4, #48	; 0x30
    8f56:	f1bc 0f09 	cmp.w	ip, #9
    8f5a:	d829      	bhi.n	8fb0 <_strtoul_l.constprop.0+0x9c>
    8f5c:	4664      	mov	r4, ip
    8f5e:	42a3      	cmp	r3, r4
    8f60:	dd37      	ble.n	8fd2 <_strtoul_l.constprop.0+0xbe>
    8f62:	f1b6 3fff 	cmp.w	r6, #4294967295	; 0xffffffff
    8f66:	d007      	beq.n	8f78 <_strtoul_l.constprop.0+0x64>
    8f68:	4580      	cmp	r8, r0
    8f6a:	d32f      	bcc.n	8fcc <_strtoul_l.constprop.0+0xb8>
    8f6c:	d101      	bne.n	8f72 <_strtoul_l.constprop.0+0x5e>
    8f6e:	45a1      	cmp	r9, r4
    8f70:	db2c      	blt.n	8fcc <_strtoul_l.constprop.0+0xb8>
    8f72:	fb00 4003 	mla	r0, r0, r3, r4
    8f76:	2601      	movs	r6, #1
    8f78:	f815 4b01 	ldrb.w	r4, [r5], #1
    8f7c:	e7e9      	b.n	8f52 <_strtoul_l.constprop.0+0x3e>
    8f7e:	2c2b      	cmp	r4, #43	; 0x2b
    8f80:	bf04      	itt	eq
    8f82:	782c      	ldrbeq	r4, [r5, #0]
    8f84:	1c85      	addeq	r5, r0, #2
    8f86:	e7d6      	b.n	8f36 <_strtoul_l.constprop.0+0x22>
    8f88:	2b10      	cmp	r3, #16
    8f8a:	d1d8      	bne.n	8f3e <_strtoul_l.constprop.0+0x2a>
    8f8c:	2c30      	cmp	r4, #48	; 0x30
    8f8e:	d1d6      	bne.n	8f3e <_strtoul_l.constprop.0+0x2a>
    8f90:	7828      	ldrb	r0, [r5, #0]
    8f92:	f000 00df 	and.w	r0, r0, #223	; 0xdf
    8f96:	2858      	cmp	r0, #88	; 0x58
    8f98:	d1d1      	bne.n	8f3e <_strtoul_l.constprop.0+0x2a>
    8f9a:	786c      	ldrb	r4, [r5, #1]
    8f9c:	2310      	movs	r3, #16
    8f9e:	3502      	adds	r5, #2
    8fa0:	e7cd      	b.n	8f3e <_strtoul_l.constprop.0+0x2a>
    8fa2:	782b      	ldrb	r3, [r5, #0]
    8fa4:	f003 03df 	and.w	r3, r3, #223	; 0xdf
    8fa8:	2b58      	cmp	r3, #88	; 0x58
    8faa:	d0f6      	beq.n	8f9a <_strtoul_l.constprop.0+0x86>
    8fac:	2308      	movs	r3, #8
    8fae:	e7c6      	b.n	8f3e <_strtoul_l.constprop.0+0x2a>
    8fb0:	f1a4 0c41 	sub.w	ip, r4, #65	; 0x41
    8fb4:	f1bc 0f19 	cmp.w	ip, #25
    8fb8:	d801      	bhi.n	8fbe <_strtoul_l.constprop.0+0xaa>
    8fba:	3c37      	subs	r4, #55	; 0x37
    8fbc:	e7cf      	b.n	8f5e <_strtoul_l.constprop.0+0x4a>
    8fbe:	f1a4 0c61 	sub.w	ip, r4, #97	; 0x61
    8fc2:	f1bc 0f19 	cmp.w	ip, #25
    8fc6:	d804      	bhi.n	8fd2 <_strtoul_l.constprop.0+0xbe>
    8fc8:	3c57      	subs	r4, #87	; 0x57
    8fca:	e7c8      	b.n	8f5e <_strtoul_l.constprop.0+0x4a>
    8fcc:	f04f 36ff 	mov.w	r6, #4294967295	; 0xffffffff
    8fd0:	e7d2      	b.n	8f78 <_strtoul_l.constprop.0+0x64>
    8fd2:	1c73      	adds	r3, r6, #1
    8fd4:	d106      	bne.n	8fe4 <_strtoul_l.constprop.0+0xd0>
    8fd6:	2322      	movs	r3, #34	; 0x22
    8fd8:	f8ce 3000 	str.w	r3, [lr]
    8fdc:	4630      	mov	r0, r6
    8fde:	b932      	cbnz	r2, 8fee <_strtoul_l.constprop.0+0xda>
    8fe0:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    8fe4:	b107      	cbz	r7, 8fe8 <_strtoul_l.constprop.0+0xd4>
    8fe6:	4240      	negs	r0, r0
    8fe8:	2a00      	cmp	r2, #0
    8fea:	d0f9      	beq.n	8fe0 <_strtoul_l.constprop.0+0xcc>
    8fec:	b106      	cbz	r6, 8ff0 <_strtoul_l.constprop.0+0xdc>
    8fee:	1e69      	subs	r1, r5, #1
    8ff0:	6011      	str	r1, [r2, #0]
    8ff2:	e7f5      	b.n	8fe0 <_strtoul_l.constprop.0+0xcc>
    8ff4:	0000e695 	.word	0x0000e695

00008ff8 <strtoul>:
    8ff8:	4613      	mov	r3, r2
    8ffa:	460a      	mov	r2, r1
    8ffc:	4601      	mov	r1, r0
    8ffe:	4802      	ldr	r0, [pc, #8]	; (9008 <strtoul+0x10>)
    9000:	6800      	ldr	r0, [r0, #0]
    9002:	f7ff bf87 	b.w	8f14 <_strtoul_l.constprop.0>
    9006:	bf00      	nop
    9008:	20000210 	.word	0x20000210

0000900c <std>:
    900c:	2300      	movs	r3, #0
    900e:	b510      	push	{r4, lr}
    9010:	4604      	mov	r4, r0
    9012:	e9c0 3300 	strd	r3, r3, [r0]
    9016:	e9c0 3304 	strd	r3, r3, [r0, #16]
    901a:	6083      	str	r3, [r0, #8]
    901c:	8181      	strh	r1, [r0, #12]
    901e:	6643      	str	r3, [r0, #100]	; 0x64
    9020:	81c2      	strh	r2, [r0, #14]
    9022:	6183      	str	r3, [r0, #24]
    9024:	4619      	mov	r1, r3
    9026:	2208      	movs	r2, #8
    9028:	305c      	adds	r0, #92	; 0x5c
    902a:	f003 f89f 	bl	c16c <memset>
    902e:	4b05      	ldr	r3, [pc, #20]	; (9044 <std+0x38>)
    9030:	6263      	str	r3, [r4, #36]	; 0x24
    9032:	4b05      	ldr	r3, [pc, #20]	; (9048 <std+0x3c>)
    9034:	62a3      	str	r3, [r4, #40]	; 0x28
    9036:	4b05      	ldr	r3, [pc, #20]	; (904c <std+0x40>)
    9038:	62e3      	str	r3, [r4, #44]	; 0x2c
    903a:	4b05      	ldr	r3, [pc, #20]	; (9050 <std+0x44>)
    903c:	6224      	str	r4, [r4, #32]
    903e:	6323      	str	r3, [r4, #48]	; 0x30
    9040:	bd10      	pop	{r4, pc}
    9042:	bf00      	nop
    9044:	0000c4e3 	.word	0x0000c4e3
    9048:	0000c505 	.word	0x0000c505
    904c:	0000c53d 	.word	0x0000c53d
    9050:	0000c561 	.word	0x0000c561

00009054 <_cleanup_r>:
    9054:	4901      	ldr	r1, [pc, #4]	; (905c <_cleanup_r+0x8>)
    9056:	f003 b936 	b.w	c2c6 <_fwalk_reent>
    905a:	bf00      	nop
    905c:	00009a11 	.word	0x00009a11

00009060 <__sfp_lock_acquire>:
    9060:	4801      	ldr	r0, [pc, #4]	; (9068 <__sfp_lock_acquire+0x8>)
    9062:	f002 b952 	b.w	b30a <__retarget_lock_acquire_recursive>
    9066:	bf00      	nop
    9068:	20000308 	.word	0x20000308

0000906c <__sfp_lock_release>:
    906c:	4801      	ldr	r0, [pc, #4]	; (9074 <__sfp_lock_release+0x8>)
    906e:	f002 b952 	b.w	b316 <__retarget_lock_release_recursive>
    9072:	bf00      	nop
    9074:	20000308 	.word	0x20000308

00009078 <__sinit_lock_acquire>:
    9078:	4801      	ldr	r0, [pc, #4]	; (9080 <__sinit_lock_acquire+0x8>)
    907a:	f002 b946 	b.w	b30a <__retarget_lock_acquire_recursive>
    907e:	bf00      	nop
    9080:	2000031c 	.word	0x2000031c

00009084 <__sinit_lock_release>:
    9084:	4801      	ldr	r0, [pc, #4]	; (908c <__sinit_lock_release+0x8>)
    9086:	f002 b946 	b.w	b316 <__retarget_lock_release_recursive>
    908a:	bf00      	nop
    908c:	2000031c 	.word	0x2000031c

00009090 <__sinit>:
    9090:	b510      	push	{r4, lr}
    9092:	4604      	mov	r4, r0
    9094:	f7ff fff0 	bl	9078 <__sinit_lock_acquire>
    9098:	69a3      	ldr	r3, [r4, #24]
    909a:	b11b      	cbz	r3, 90a4 <__sinit+0x14>
    909c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    90a0:	f7ff bff0 	b.w	9084 <__sinit_lock_release>
    90a4:	e9c4 3312 	strd	r3, r3, [r4, #72]	; 0x48
    90a8:	6523      	str	r3, [r4, #80]	; 0x50
    90aa:	4b13      	ldr	r3, [pc, #76]	; (90f8 <__sinit+0x68>)
    90ac:	4a13      	ldr	r2, [pc, #76]	; (90fc <__sinit+0x6c>)
    90ae:	681b      	ldr	r3, [r3, #0]
    90b0:	62a2      	str	r2, [r4, #40]	; 0x28
    90b2:	42a3      	cmp	r3, r4
    90b4:	bf04      	itt	eq
    90b6:	2301      	moveq	r3, #1
    90b8:	61a3      	streq	r3, [r4, #24]
    90ba:	4620      	mov	r0, r4
    90bc:	f000 f820 	bl	9100 <__sfp>
    90c0:	6060      	str	r0, [r4, #4]
    90c2:	4620      	mov	r0, r4
    90c4:	f000 f81c 	bl	9100 <__sfp>
    90c8:	60a0      	str	r0, [r4, #8]
    90ca:	4620      	mov	r0, r4
    90cc:	f000 f818 	bl	9100 <__sfp>
    90d0:	2200      	movs	r2, #0
    90d2:	60e0      	str	r0, [r4, #12]
    90d4:	2104      	movs	r1, #4
    90d6:	6860      	ldr	r0, [r4, #4]
    90d8:	f7ff ff98 	bl	900c <std>
    90dc:	68a0      	ldr	r0, [r4, #8]
    90de:	2201      	movs	r2, #1
    90e0:	2109      	movs	r1, #9
    90e2:	f7ff ff93 	bl	900c <std>
    90e6:	68e0      	ldr	r0, [r4, #12]
    90e8:	2202      	movs	r2, #2
    90ea:	2112      	movs	r1, #18
    90ec:	f7ff ff8e 	bl	900c <std>
    90f0:	2301      	movs	r3, #1
    90f2:	61a3      	str	r3, [r4, #24]
    90f4:	e7d2      	b.n	909c <__sinit+0xc>
    90f6:	bf00      	nop
    90f8:	0000d500 	.word	0x0000d500
    90fc:	00009055 	.word	0x00009055

00009100 <__sfp>:
    9100:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    9102:	4607      	mov	r7, r0
    9104:	f7ff ffac 	bl	9060 <__sfp_lock_acquire>
    9108:	4b1e      	ldr	r3, [pc, #120]	; (9184 <__sfp+0x84>)
    910a:	681e      	ldr	r6, [r3, #0]
    910c:	69b3      	ldr	r3, [r6, #24]
    910e:	b913      	cbnz	r3, 9116 <__sfp+0x16>
    9110:	4630      	mov	r0, r6
    9112:	f7ff ffbd 	bl	9090 <__sinit>
    9116:	3648      	adds	r6, #72	; 0x48
    9118:	e9d6 3401 	ldrd	r3, r4, [r6, #4]
    911c:	3b01      	subs	r3, #1
    911e:	d503      	bpl.n	9128 <__sfp+0x28>
    9120:	6833      	ldr	r3, [r6, #0]
    9122:	b30b      	cbz	r3, 9168 <__sfp+0x68>
    9124:	6836      	ldr	r6, [r6, #0]
    9126:	e7f7      	b.n	9118 <__sfp+0x18>
    9128:	f9b4 500c 	ldrsh.w	r5, [r4, #12]
    912c:	b9d5      	cbnz	r5, 9164 <__sfp+0x64>
    912e:	4b16      	ldr	r3, [pc, #88]	; (9188 <__sfp+0x88>)
    9130:	60e3      	str	r3, [r4, #12]
    9132:	f104 0058 	add.w	r0, r4, #88	; 0x58
    9136:	6665      	str	r5, [r4, #100]	; 0x64
    9138:	f002 f8dd 	bl	b2f6 <__retarget_lock_init_recursive>
    913c:	f7ff ff96 	bl	906c <__sfp_lock_release>
    9140:	e9c4 5501 	strd	r5, r5, [r4, #4]
    9144:	e9c4 5504 	strd	r5, r5, [r4, #16]
    9148:	6025      	str	r5, [r4, #0]
    914a:	61a5      	str	r5, [r4, #24]
    914c:	2208      	movs	r2, #8
    914e:	4629      	mov	r1, r5
    9150:	f104 005c 	add.w	r0, r4, #92	; 0x5c
    9154:	f003 f80a 	bl	c16c <memset>
    9158:	e9c4 550d 	strd	r5, r5, [r4, #52]	; 0x34
    915c:	e9c4 5512 	strd	r5, r5, [r4, #72]	; 0x48
    9160:	4620      	mov	r0, r4
    9162:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    9164:	3468      	adds	r4, #104	; 0x68
    9166:	e7d9      	b.n	911c <__sfp+0x1c>
    9168:	2104      	movs	r1, #4
    916a:	4638      	mov	r0, r7
    916c:	f003 f895 	bl	c29a <__sfmoreglue>
    9170:	4604      	mov	r4, r0
    9172:	6030      	str	r0, [r6, #0]
    9174:	2800      	cmp	r0, #0
    9176:	d1d5      	bne.n	9124 <__sfp+0x24>
    9178:	f7ff ff78 	bl	906c <__sfp_lock_release>
    917c:	230c      	movs	r3, #12
    917e:	603b      	str	r3, [r7, #0]
    9180:	e7ee      	b.n	9160 <__sfp+0x60>
    9182:	bf00      	nop
    9184:	0000d500 	.word	0x0000d500
    9188:	ffff0001 	.word	0xffff0001

0000918c <__malloc_lock>:
    918c:	4801      	ldr	r0, [pc, #4]	; (9194 <__malloc_lock+0x8>)
    918e:	f002 b8bc 	b.w	b30a <__retarget_lock_acquire_recursive>
    9192:	bf00      	nop
    9194:	200002f4 	.word	0x200002f4

00009198 <__malloc_unlock>:
    9198:	4801      	ldr	r0, [pc, #4]	; (91a0 <__malloc_unlock+0x8>)
    919a:	f002 b8bc 	b.w	b316 <__retarget_lock_release_recursive>
    919e:	bf00      	nop
    91a0:	200002f4 	.word	0x200002f4

000091a4 <_svfiprintf_r>:
    91a4:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    91a8:	4698      	mov	r8, r3
    91aa:	898b      	ldrh	r3, [r1, #12]
    91ac:	061b      	lsls	r3, r3, #24
    91ae:	b09d      	sub	sp, #116	; 0x74
    91b0:	4607      	mov	r7, r0
    91b2:	460d      	mov	r5, r1
    91b4:	4614      	mov	r4, r2
    91b6:	d510      	bpl.n	91da <_svfiprintf_r+0x36>
    91b8:	690b      	ldr	r3, [r1, #16]
    91ba:	b973      	cbnz	r3, 91da <_svfiprintf_r+0x36>
    91bc:	2140      	movs	r1, #64	; 0x40
    91be:	f7ff fd51 	bl	8c64 <_malloc_r>
    91c2:	6028      	str	r0, [r5, #0]
    91c4:	6128      	str	r0, [r5, #16]
    91c6:	b930      	cbnz	r0, 91d6 <_svfiprintf_r+0x32>
    91c8:	230c      	movs	r3, #12
    91ca:	603b      	str	r3, [r7, #0]
    91cc:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    91d0:	b01d      	add	sp, #116	; 0x74
    91d2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    91d6:	2340      	movs	r3, #64	; 0x40
    91d8:	616b      	str	r3, [r5, #20]
    91da:	2300      	movs	r3, #0
    91dc:	9309      	str	r3, [sp, #36]	; 0x24
    91de:	2320      	movs	r3, #32
    91e0:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
    91e4:	f8cd 800c 	str.w	r8, [sp, #12]
    91e8:	2330      	movs	r3, #48	; 0x30
    91ea:	f8df 819c 	ldr.w	r8, [pc, #412]	; 9388 <_svfiprintf_r+0x1e4>
    91ee:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
    91f2:	f04f 0901 	mov.w	r9, #1
    91f6:	4623      	mov	r3, r4
    91f8:	469a      	mov	sl, r3
    91fa:	f813 2b01 	ldrb.w	r2, [r3], #1
    91fe:	b10a      	cbz	r2, 9204 <_svfiprintf_r+0x60>
    9200:	2a25      	cmp	r2, #37	; 0x25
    9202:	d1f9      	bne.n	91f8 <_svfiprintf_r+0x54>
    9204:	ebba 0b04 	subs.w	fp, sl, r4
    9208:	d00b      	beq.n	9222 <_svfiprintf_r+0x7e>
    920a:	465b      	mov	r3, fp
    920c:	4622      	mov	r2, r4
    920e:	4629      	mov	r1, r5
    9210:	4638      	mov	r0, r7
    9212:	f003 f877 	bl	c304 <__ssputs_r>
    9216:	3001      	adds	r0, #1
    9218:	f000 80a7 	beq.w	936a <_svfiprintf_r+0x1c6>
    921c:	9a09      	ldr	r2, [sp, #36]	; 0x24
    921e:	445a      	add	r2, fp
    9220:	9209      	str	r2, [sp, #36]	; 0x24
    9222:	f89a 3000 	ldrb.w	r3, [sl]
    9226:	2b00      	cmp	r3, #0
    9228:	f000 809f 	beq.w	936a <_svfiprintf_r+0x1c6>
    922c:	2300      	movs	r3, #0
    922e:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    9232:	e9cd 2305 	strd	r2, r3, [sp, #20]
    9236:	f10a 0a01 	add.w	sl, sl, #1
    923a:	9304      	str	r3, [sp, #16]
    923c:	9307      	str	r3, [sp, #28]
    923e:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
    9242:	931a      	str	r3, [sp, #104]	; 0x68
    9244:	4654      	mov	r4, sl
    9246:	2205      	movs	r2, #5
    9248:	f814 1b01 	ldrb.w	r1, [r4], #1
    924c:	484e      	ldr	r0, [pc, #312]	; (9388 <_svfiprintf_r+0x1e4>)
    924e:	f7f6 ff57 	bl	100 <memchr>
    9252:	9a04      	ldr	r2, [sp, #16]
    9254:	b9d8      	cbnz	r0, 928e <_svfiprintf_r+0xea>
    9256:	06d0      	lsls	r0, r2, #27
    9258:	bf44      	itt	mi
    925a:	2320      	movmi	r3, #32
    925c:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
    9260:	0711      	lsls	r1, r2, #28
    9262:	bf44      	itt	mi
    9264:	232b      	movmi	r3, #43	; 0x2b
    9266:	f88d 3053 	strbmi.w	r3, [sp, #83]	; 0x53
    926a:	f89a 3000 	ldrb.w	r3, [sl]
    926e:	2b2a      	cmp	r3, #42	; 0x2a
    9270:	d015      	beq.n	929e <_svfiprintf_r+0xfa>
    9272:	9a07      	ldr	r2, [sp, #28]
    9274:	4654      	mov	r4, sl
    9276:	2000      	movs	r0, #0
    9278:	f04f 0c0a 	mov.w	ip, #10
    927c:	4621      	mov	r1, r4
    927e:	f811 3b01 	ldrb.w	r3, [r1], #1
    9282:	3b30      	subs	r3, #48	; 0x30
    9284:	2b09      	cmp	r3, #9
    9286:	d94b      	bls.n	9320 <_svfiprintf_r+0x17c>
    9288:	b1b0      	cbz	r0, 92b8 <_svfiprintf_r+0x114>
    928a:	9207      	str	r2, [sp, #28]
    928c:	e014      	b.n	92b8 <_svfiprintf_r+0x114>
    928e:	eba0 0308 	sub.w	r3, r0, r8
    9292:	fa09 f303 	lsl.w	r3, r9, r3
    9296:	4313      	orrs	r3, r2
    9298:	9304      	str	r3, [sp, #16]
    929a:	46a2      	mov	sl, r4
    929c:	e7d2      	b.n	9244 <_svfiprintf_r+0xa0>
    929e:	9b03      	ldr	r3, [sp, #12]
    92a0:	1d19      	adds	r1, r3, #4
    92a2:	681b      	ldr	r3, [r3, #0]
    92a4:	9103      	str	r1, [sp, #12]
    92a6:	2b00      	cmp	r3, #0
    92a8:	bfbb      	ittet	lt
    92aa:	425b      	neglt	r3, r3
    92ac:	f042 0202 	orrlt.w	r2, r2, #2
    92b0:	9307      	strge	r3, [sp, #28]
    92b2:	9307      	strlt	r3, [sp, #28]
    92b4:	bfb8      	it	lt
    92b6:	9204      	strlt	r2, [sp, #16]
    92b8:	7823      	ldrb	r3, [r4, #0]
    92ba:	2b2e      	cmp	r3, #46	; 0x2e
    92bc:	d10a      	bne.n	92d4 <_svfiprintf_r+0x130>
    92be:	7863      	ldrb	r3, [r4, #1]
    92c0:	2b2a      	cmp	r3, #42	; 0x2a
    92c2:	d132      	bne.n	932a <_svfiprintf_r+0x186>
    92c4:	9b03      	ldr	r3, [sp, #12]
    92c6:	1d1a      	adds	r2, r3, #4
    92c8:	681b      	ldr	r3, [r3, #0]
    92ca:	9203      	str	r2, [sp, #12]
    92cc:	ea43 73e3 	orr.w	r3, r3, r3, asr #31
    92d0:	3402      	adds	r4, #2
    92d2:	9305      	str	r3, [sp, #20]
    92d4:	f8df a0b4 	ldr.w	sl, [pc, #180]	; 938c <_svfiprintf_r+0x1e8>
    92d8:	7821      	ldrb	r1, [r4, #0]
    92da:	2203      	movs	r2, #3
    92dc:	4650      	mov	r0, sl
    92de:	f7f6 ff0f 	bl	100 <memchr>
    92e2:	b138      	cbz	r0, 92f4 <_svfiprintf_r+0x150>
    92e4:	9b04      	ldr	r3, [sp, #16]
    92e6:	eba0 000a 	sub.w	r0, r0, sl
    92ea:	2240      	movs	r2, #64	; 0x40
    92ec:	4082      	lsls	r2, r0
    92ee:	4313      	orrs	r3, r2
    92f0:	3401      	adds	r4, #1
    92f2:	9304      	str	r3, [sp, #16]
    92f4:	f814 1b01 	ldrb.w	r1, [r4], #1
    92f8:	4825      	ldr	r0, [pc, #148]	; (9390 <_svfiprintf_r+0x1ec>)
    92fa:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
    92fe:	2206      	movs	r2, #6
    9300:	f7f6 fefe 	bl	100 <memchr>
    9304:	2800      	cmp	r0, #0
    9306:	d036      	beq.n	9376 <_svfiprintf_r+0x1d2>
    9308:	4b22      	ldr	r3, [pc, #136]	; (9394 <_svfiprintf_r+0x1f0>)
    930a:	bb1b      	cbnz	r3, 9354 <_svfiprintf_r+0x1b0>
    930c:	9b03      	ldr	r3, [sp, #12]
    930e:	3307      	adds	r3, #7
    9310:	f023 0307 	bic.w	r3, r3, #7
    9314:	3308      	adds	r3, #8
    9316:	9303      	str	r3, [sp, #12]
    9318:	9b09      	ldr	r3, [sp, #36]	; 0x24
    931a:	4433      	add	r3, r6
    931c:	9309      	str	r3, [sp, #36]	; 0x24
    931e:	e76a      	b.n	91f6 <_svfiprintf_r+0x52>
    9320:	fb0c 3202 	mla	r2, ip, r2, r3
    9324:	460c      	mov	r4, r1
    9326:	2001      	movs	r0, #1
    9328:	e7a8      	b.n	927c <_svfiprintf_r+0xd8>
    932a:	2300      	movs	r3, #0
    932c:	3401      	adds	r4, #1
    932e:	9305      	str	r3, [sp, #20]
    9330:	4619      	mov	r1, r3
    9332:	f04f 0c0a 	mov.w	ip, #10
    9336:	4620      	mov	r0, r4
    9338:	f810 2b01 	ldrb.w	r2, [r0], #1
    933c:	3a30      	subs	r2, #48	; 0x30
    933e:	2a09      	cmp	r2, #9
    9340:	d903      	bls.n	934a <_svfiprintf_r+0x1a6>
    9342:	2b00      	cmp	r3, #0
    9344:	d0c6      	beq.n	92d4 <_svfiprintf_r+0x130>
    9346:	9105      	str	r1, [sp, #20]
    9348:	e7c4      	b.n	92d4 <_svfiprintf_r+0x130>
    934a:	fb0c 2101 	mla	r1, ip, r1, r2
    934e:	4604      	mov	r4, r0
    9350:	2301      	movs	r3, #1
    9352:	e7f0      	b.n	9336 <_svfiprintf_r+0x192>
    9354:	ab03      	add	r3, sp, #12
    9356:	9300      	str	r3, [sp, #0]
    9358:	462a      	mov	r2, r5
    935a:	4b0f      	ldr	r3, [pc, #60]	; (9398 <_svfiprintf_r+0x1f4>)
    935c:	a904      	add	r1, sp, #16
    935e:	4638      	mov	r0, r7
    9360:	f3af 8000 	nop.w
    9364:	1c42      	adds	r2, r0, #1
    9366:	4606      	mov	r6, r0
    9368:	d1d6      	bne.n	9318 <_svfiprintf_r+0x174>
    936a:	89ab      	ldrh	r3, [r5, #12]
    936c:	065b      	lsls	r3, r3, #25
    936e:	f53f af2d 	bmi.w	91cc <_svfiprintf_r+0x28>
    9372:	9809      	ldr	r0, [sp, #36]	; 0x24
    9374:	e72c      	b.n	91d0 <_svfiprintf_r+0x2c>
    9376:	ab03      	add	r3, sp, #12
    9378:	9300      	str	r3, [sp, #0]
    937a:	462a      	mov	r2, r5
    937c:	4b06      	ldr	r3, [pc, #24]	; (9398 <_svfiprintf_r+0x1f4>)
    937e:	a904      	add	r1, sp, #16
    9380:	4638      	mov	r0, r7
    9382:	f000 f937 	bl	95f4 <_printf_i>
    9386:	e7ed      	b.n	9364 <_svfiprintf_r+0x1c0>
    9388:	0000e795 	.word	0x0000e795
    938c:	0000e79b 	.word	0x0000e79b
    9390:	0000e79f 	.word	0x0000e79f
    9394:	00000000 	.word	0x00000000
    9398:	0000c305 	.word	0x0000c305

0000939c <_vfiprintf_r>:
    939c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    93a0:	460d      	mov	r5, r1
    93a2:	b09d      	sub	sp, #116	; 0x74
    93a4:	4614      	mov	r4, r2
    93a6:	4698      	mov	r8, r3
    93a8:	4606      	mov	r6, r0
    93aa:	b118      	cbz	r0, 93b4 <_vfiprintf_r+0x18>
    93ac:	6983      	ldr	r3, [r0, #24]
    93ae:	b90b      	cbnz	r3, 93b4 <_vfiprintf_r+0x18>
    93b0:	f7ff fe6e 	bl	9090 <__sinit>
    93b4:	4b87      	ldr	r3, [pc, #540]	; (95d4 <_vfiprintf_r+0x238>)
    93b6:	429d      	cmp	r5, r3
    93b8:	d11b      	bne.n	93f2 <_vfiprintf_r+0x56>
    93ba:	6875      	ldr	r5, [r6, #4]
    93bc:	6e6b      	ldr	r3, [r5, #100]	; 0x64
    93be:	07d9      	lsls	r1, r3, #31
    93c0:	d405      	bmi.n	93ce <_vfiprintf_r+0x32>
    93c2:	89ab      	ldrh	r3, [r5, #12]
    93c4:	059a      	lsls	r2, r3, #22
    93c6:	d402      	bmi.n	93ce <_vfiprintf_r+0x32>
    93c8:	6da8      	ldr	r0, [r5, #88]	; 0x58
    93ca:	f001 ff9e 	bl	b30a <__retarget_lock_acquire_recursive>
    93ce:	89ab      	ldrh	r3, [r5, #12]
    93d0:	071b      	lsls	r3, r3, #28
    93d2:	d501      	bpl.n	93d8 <_vfiprintf_r+0x3c>
    93d4:	692b      	ldr	r3, [r5, #16]
    93d6:	b9eb      	cbnz	r3, 9414 <_vfiprintf_r+0x78>
    93d8:	4629      	mov	r1, r5
    93da:	4630      	mov	r0, r6
    93dc:	f000 fa9c 	bl	9918 <__swsetup_r>
    93e0:	b1c0      	cbz	r0, 9414 <_vfiprintf_r+0x78>
    93e2:	6e6b      	ldr	r3, [r5, #100]	; 0x64
    93e4:	07dc      	lsls	r4, r3, #31
    93e6:	d50e      	bpl.n	9406 <_vfiprintf_r+0x6a>
    93e8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    93ec:	b01d      	add	sp, #116	; 0x74
    93ee:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    93f2:	4b79      	ldr	r3, [pc, #484]	; (95d8 <_vfiprintf_r+0x23c>)
    93f4:	429d      	cmp	r5, r3
    93f6:	d101      	bne.n	93fc <_vfiprintf_r+0x60>
    93f8:	68b5      	ldr	r5, [r6, #8]
    93fa:	e7df      	b.n	93bc <_vfiprintf_r+0x20>
    93fc:	4b77      	ldr	r3, [pc, #476]	; (95dc <_vfiprintf_r+0x240>)
    93fe:	429d      	cmp	r5, r3
    9400:	bf08      	it	eq
    9402:	68f5      	ldreq	r5, [r6, #12]
    9404:	e7da      	b.n	93bc <_vfiprintf_r+0x20>
    9406:	89ab      	ldrh	r3, [r5, #12]
    9408:	0598      	lsls	r0, r3, #22
    940a:	d4ed      	bmi.n	93e8 <_vfiprintf_r+0x4c>
    940c:	6da8      	ldr	r0, [r5, #88]	; 0x58
    940e:	f001 ff82 	bl	b316 <__retarget_lock_release_recursive>
    9412:	e7e9      	b.n	93e8 <_vfiprintf_r+0x4c>
    9414:	2300      	movs	r3, #0
    9416:	9309      	str	r3, [sp, #36]	; 0x24
    9418:	2320      	movs	r3, #32
    941a:	f88d 3029 	strb.w	r3, [sp, #41]	; 0x29
    941e:	f8cd 800c 	str.w	r8, [sp, #12]
    9422:	2330      	movs	r3, #48	; 0x30
    9424:	f8df 81b8 	ldr.w	r8, [pc, #440]	; 95e0 <_vfiprintf_r+0x244>
    9428:	f88d 302a 	strb.w	r3, [sp, #42]	; 0x2a
    942c:	f04f 0901 	mov.w	r9, #1
    9430:	4623      	mov	r3, r4
    9432:	469a      	mov	sl, r3
    9434:	f813 2b01 	ldrb.w	r2, [r3], #1
    9438:	b10a      	cbz	r2, 943e <_vfiprintf_r+0xa2>
    943a:	2a25      	cmp	r2, #37	; 0x25
    943c:	d1f9      	bne.n	9432 <_vfiprintf_r+0x96>
    943e:	ebba 0b04 	subs.w	fp, sl, r4
    9442:	d00b      	beq.n	945c <_vfiprintf_r+0xc0>
    9444:	465b      	mov	r3, fp
    9446:	4622      	mov	r2, r4
    9448:	4629      	mov	r1, r5
    944a:	4630      	mov	r0, r6
    944c:	f002 ffca 	bl	c3e4 <__sfputs_r>
    9450:	3001      	adds	r0, #1
    9452:	f000 80a6 	beq.w	95a2 <_vfiprintf_r+0x206>
    9456:	9a09      	ldr	r2, [sp, #36]	; 0x24
    9458:	445a      	add	r2, fp
    945a:	9209      	str	r2, [sp, #36]	; 0x24
    945c:	f89a 3000 	ldrb.w	r3, [sl]
    9460:	2b00      	cmp	r3, #0
    9462:	f000 809e 	beq.w	95a2 <_vfiprintf_r+0x206>
    9466:	2300      	movs	r3, #0
    9468:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    946c:	e9cd 2305 	strd	r2, r3, [sp, #20]
    9470:	f10a 0a01 	add.w	sl, sl, #1
    9474:	9304      	str	r3, [sp, #16]
    9476:	9307      	str	r3, [sp, #28]
    9478:	f88d 3053 	strb.w	r3, [sp, #83]	; 0x53
    947c:	931a      	str	r3, [sp, #104]	; 0x68
    947e:	4654      	mov	r4, sl
    9480:	4857      	ldr	r0, [pc, #348]	; (95e0 <_vfiprintf_r+0x244>)
    9482:	f814 1b01 	ldrb.w	r1, [r4], #1
    9486:	2205      	movs	r2, #5
    9488:	f7f6 fe3a 	bl	100 <memchr>
    948c:	9b04      	ldr	r3, [sp, #16]
    948e:	b9d0      	cbnz	r0, 94c6 <_vfiprintf_r+0x12a>
    9490:	06d9      	lsls	r1, r3, #27
    9492:	bf44      	itt	mi
    9494:	2220      	movmi	r2, #32
    9496:	f88d 2053 	strbmi.w	r2, [sp, #83]	; 0x53
    949a:	071a      	lsls	r2, r3, #28
    949c:	bf44      	itt	mi
    949e:	222b      	movmi	r2, #43	; 0x2b
    94a0:	f88d 2053 	strbmi.w	r2, [sp, #83]	; 0x53
    94a4:	f89a 2000 	ldrb.w	r2, [sl]
    94a8:	2a2a      	cmp	r2, #42	; 0x2a
    94aa:	d014      	beq.n	94d6 <_vfiprintf_r+0x13a>
    94ac:	9a07      	ldr	r2, [sp, #28]
    94ae:	4654      	mov	r4, sl
    94b0:	2000      	movs	r0, #0
    94b2:	f04f 0c0a 	mov.w	ip, #10
    94b6:	4621      	mov	r1, r4
    94b8:	f811 3b01 	ldrb.w	r3, [r1], #1
    94bc:	3b30      	subs	r3, #48	; 0x30
    94be:	2b09      	cmp	r3, #9
    94c0:	d94a      	bls.n	9558 <_vfiprintf_r+0x1bc>
    94c2:	b970      	cbnz	r0, 94e2 <_vfiprintf_r+0x146>
    94c4:	e014      	b.n	94f0 <_vfiprintf_r+0x154>
    94c6:	eba0 0008 	sub.w	r0, r0, r8
    94ca:	fa09 f000 	lsl.w	r0, r9, r0
    94ce:	4318      	orrs	r0, r3
    94d0:	9004      	str	r0, [sp, #16]
    94d2:	46a2      	mov	sl, r4
    94d4:	e7d3      	b.n	947e <_vfiprintf_r+0xe2>
    94d6:	9a03      	ldr	r2, [sp, #12]
    94d8:	1d11      	adds	r1, r2, #4
    94da:	6812      	ldr	r2, [r2, #0]
    94dc:	9103      	str	r1, [sp, #12]
    94de:	2a00      	cmp	r2, #0
    94e0:	db01      	blt.n	94e6 <_vfiprintf_r+0x14a>
    94e2:	9207      	str	r2, [sp, #28]
    94e4:	e004      	b.n	94f0 <_vfiprintf_r+0x154>
    94e6:	4252      	negs	r2, r2
    94e8:	f043 0302 	orr.w	r3, r3, #2
    94ec:	9207      	str	r2, [sp, #28]
    94ee:	9304      	str	r3, [sp, #16]
    94f0:	7823      	ldrb	r3, [r4, #0]
    94f2:	2b2e      	cmp	r3, #46	; 0x2e
    94f4:	d10a      	bne.n	950c <_vfiprintf_r+0x170>
    94f6:	7863      	ldrb	r3, [r4, #1]
    94f8:	2b2a      	cmp	r3, #42	; 0x2a
    94fa:	d132      	bne.n	9562 <_vfiprintf_r+0x1c6>
    94fc:	9b03      	ldr	r3, [sp, #12]
    94fe:	1d1a      	adds	r2, r3, #4
    9500:	681b      	ldr	r3, [r3, #0]
    9502:	9203      	str	r2, [sp, #12]
    9504:	ea43 73e3 	orr.w	r3, r3, r3, asr #31
    9508:	3402      	adds	r4, #2
    950a:	9305      	str	r3, [sp, #20]
    950c:	f8df a0d4 	ldr.w	sl, [pc, #212]	; 95e4 <_vfiprintf_r+0x248>
    9510:	7821      	ldrb	r1, [r4, #0]
    9512:	2203      	movs	r2, #3
    9514:	4650      	mov	r0, sl
    9516:	f7f6 fdf3 	bl	100 <memchr>
    951a:	b138      	cbz	r0, 952c <_vfiprintf_r+0x190>
    951c:	9b04      	ldr	r3, [sp, #16]
    951e:	eba0 000a 	sub.w	r0, r0, sl
    9522:	2240      	movs	r2, #64	; 0x40
    9524:	4082      	lsls	r2, r0
    9526:	4313      	orrs	r3, r2
    9528:	3401      	adds	r4, #1
    952a:	9304      	str	r3, [sp, #16]
    952c:	f814 1b01 	ldrb.w	r1, [r4], #1
    9530:	482d      	ldr	r0, [pc, #180]	; (95e8 <_vfiprintf_r+0x24c>)
    9532:	f88d 1028 	strb.w	r1, [sp, #40]	; 0x28
    9536:	2206      	movs	r2, #6
    9538:	f7f6 fde2 	bl	100 <memchr>
    953c:	2800      	cmp	r0, #0
    953e:	d03f      	beq.n	95c0 <_vfiprintf_r+0x224>
    9540:	4b2a      	ldr	r3, [pc, #168]	; (95ec <_vfiprintf_r+0x250>)
    9542:	bb1b      	cbnz	r3, 958c <_vfiprintf_r+0x1f0>
    9544:	9b03      	ldr	r3, [sp, #12]
    9546:	3307      	adds	r3, #7
    9548:	f023 0307 	bic.w	r3, r3, #7
    954c:	3308      	adds	r3, #8
    954e:	9303      	str	r3, [sp, #12]
    9550:	9b09      	ldr	r3, [sp, #36]	; 0x24
    9552:	443b      	add	r3, r7
    9554:	9309      	str	r3, [sp, #36]	; 0x24
    9556:	e76b      	b.n	9430 <_vfiprintf_r+0x94>
    9558:	fb0c 3202 	mla	r2, ip, r2, r3
    955c:	460c      	mov	r4, r1
    955e:	2001      	movs	r0, #1
    9560:	e7a9      	b.n	94b6 <_vfiprintf_r+0x11a>
    9562:	2300      	movs	r3, #0
    9564:	3401      	adds	r4, #1
    9566:	9305      	str	r3, [sp, #20]
    9568:	4619      	mov	r1, r3
    956a:	f04f 0c0a 	mov.w	ip, #10
    956e:	4620      	mov	r0, r4
    9570:	f810 2b01 	ldrb.w	r2, [r0], #1
    9574:	3a30      	subs	r2, #48	; 0x30
    9576:	2a09      	cmp	r2, #9
    9578:	d903      	bls.n	9582 <_vfiprintf_r+0x1e6>
    957a:	2b00      	cmp	r3, #0
    957c:	d0c6      	beq.n	950c <_vfiprintf_r+0x170>
    957e:	9105      	str	r1, [sp, #20]
    9580:	e7c4      	b.n	950c <_vfiprintf_r+0x170>
    9582:	fb0c 2101 	mla	r1, ip, r1, r2
    9586:	4604      	mov	r4, r0
    9588:	2301      	movs	r3, #1
    958a:	e7f0      	b.n	956e <_vfiprintf_r+0x1d2>
    958c:	ab03      	add	r3, sp, #12
    958e:	9300      	str	r3, [sp, #0]
    9590:	462a      	mov	r2, r5
    9592:	4b17      	ldr	r3, [pc, #92]	; (95f0 <_vfiprintf_r+0x254>)
    9594:	a904      	add	r1, sp, #16
    9596:	4630      	mov	r0, r6
    9598:	f3af 8000 	nop.w
    959c:	4607      	mov	r7, r0
    959e:	1c78      	adds	r0, r7, #1
    95a0:	d1d6      	bne.n	9550 <_vfiprintf_r+0x1b4>
    95a2:	6e6b      	ldr	r3, [r5, #100]	; 0x64
    95a4:	07d9      	lsls	r1, r3, #31
    95a6:	d405      	bmi.n	95b4 <_vfiprintf_r+0x218>
    95a8:	89ab      	ldrh	r3, [r5, #12]
    95aa:	059a      	lsls	r2, r3, #22
    95ac:	d402      	bmi.n	95b4 <_vfiprintf_r+0x218>
    95ae:	6da8      	ldr	r0, [r5, #88]	; 0x58
    95b0:	f001 feb1 	bl	b316 <__retarget_lock_release_recursive>
    95b4:	89ab      	ldrh	r3, [r5, #12]
    95b6:	065b      	lsls	r3, r3, #25
    95b8:	f53f af16 	bmi.w	93e8 <_vfiprintf_r+0x4c>
    95bc:	9809      	ldr	r0, [sp, #36]	; 0x24
    95be:	e715      	b.n	93ec <_vfiprintf_r+0x50>
    95c0:	ab03      	add	r3, sp, #12
    95c2:	9300      	str	r3, [sp, #0]
    95c4:	462a      	mov	r2, r5
    95c6:	4b0a      	ldr	r3, [pc, #40]	; (95f0 <_vfiprintf_r+0x254>)
    95c8:	a904      	add	r1, sp, #16
    95ca:	4630      	mov	r0, r6
    95cc:	f000 f812 	bl	95f4 <_printf_i>
    95d0:	e7e4      	b.n	959c <_vfiprintf_r+0x200>
    95d2:	bf00      	nop
    95d4:	0000d4e0 	.word	0x0000d4e0
    95d8:	0000d4c0 	.word	0x0000d4c0
    95dc:	0000d4a0 	.word	0x0000d4a0
    95e0:	0000e795 	.word	0x0000e795
    95e4:	0000e79b 	.word	0x0000e79b
    95e8:	0000e79f 	.word	0x0000e79f
    95ec:	00000000 	.word	0x00000000
    95f0:	0000c3e5 	.word	0x0000c3e5

000095f4 <_printf_i>:
    95f4:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
    95f8:	7e0f      	ldrb	r7, [r1, #24]
    95fa:	9d0c      	ldr	r5, [sp, #48]	; 0x30
    95fc:	2f78      	cmp	r7, #120	; 0x78
    95fe:	4691      	mov	r9, r2
    9600:	4680      	mov	r8, r0
    9602:	460c      	mov	r4, r1
    9604:	469a      	mov	sl, r3
    9606:	f101 0243 	add.w	r2, r1, #67	; 0x43
    960a:	d807      	bhi.n	961c <_printf_i+0x28>
    960c:	2f62      	cmp	r7, #98	; 0x62
    960e:	d80a      	bhi.n	9626 <_printf_i+0x32>
    9610:	2f00      	cmp	r7, #0
    9612:	f000 80e0 	beq.w	97d6 <_printf_i+0x1e2>
    9616:	2f58      	cmp	r7, #88	; 0x58
    9618:	f000 80bb 	beq.w	9792 <_printf_i+0x19e>
    961c:	f104 0642 	add.w	r6, r4, #66	; 0x42
    9620:	f884 7042 	strb.w	r7, [r4, #66]	; 0x42
    9624:	e03a      	b.n	969c <_printf_i+0xa8>
    9626:	f1a7 0363 	sub.w	r3, r7, #99	; 0x63
    962a:	2b15      	cmp	r3, #21
    962c:	d8f6      	bhi.n	961c <_printf_i+0x28>
    962e:	a101      	add	r1, pc, #4	; (adr r1, 9634 <_printf_i+0x40>)
    9630:	f851 f023 	ldr.w	pc, [r1, r3, lsl #2]
    9634:	0000968d 	.word	0x0000968d
    9638:	000096a1 	.word	0x000096a1
    963c:	0000961d 	.word	0x0000961d
    9640:	0000961d 	.word	0x0000961d
    9644:	0000961d 	.word	0x0000961d
    9648:	0000961d 	.word	0x0000961d
    964c:	000096a1 	.word	0x000096a1
    9650:	0000961d 	.word	0x0000961d
    9654:	0000961d 	.word	0x0000961d
    9658:	0000961d 	.word	0x0000961d
    965c:	0000961d 	.word	0x0000961d
    9660:	000097bd 	.word	0x000097bd
    9664:	00009731 	.word	0x00009731
    9668:	00009773 	.word	0x00009773
    966c:	0000961d 	.word	0x0000961d
    9670:	0000961d 	.word	0x0000961d
    9674:	000097df 	.word	0x000097df
    9678:	0000961d 	.word	0x0000961d
    967c:	00009731 	.word	0x00009731
    9680:	0000961d 	.word	0x0000961d
    9684:	0000961d 	.word	0x0000961d
    9688:	0000977b 	.word	0x0000977b
    968c:	682b      	ldr	r3, [r5, #0]
    968e:	1d1a      	adds	r2, r3, #4
    9690:	681b      	ldr	r3, [r3, #0]
    9692:	602a      	str	r2, [r5, #0]
    9694:	f104 0642 	add.w	r6, r4, #66	; 0x42
    9698:	f884 3042 	strb.w	r3, [r4, #66]	; 0x42
    969c:	2301      	movs	r3, #1
    969e:	e0ab      	b.n	97f8 <_printf_i+0x204>
    96a0:	6823      	ldr	r3, [r4, #0]
    96a2:	6829      	ldr	r1, [r5, #0]
    96a4:	061f      	lsls	r7, r3, #24
    96a6:	f101 0004 	add.w	r0, r1, #4
    96aa:	6028      	str	r0, [r5, #0]
    96ac:	d501      	bpl.n	96b2 <_printf_i+0xbe>
    96ae:	680d      	ldr	r5, [r1, #0]
    96b0:	e003      	b.n	96ba <_printf_i+0xc6>
    96b2:	065e      	lsls	r6, r3, #25
    96b4:	d5fb      	bpl.n	96ae <_printf_i+0xba>
    96b6:	f9b1 5000 	ldrsh.w	r5, [r1]
    96ba:	6861      	ldr	r1, [r4, #4]
    96bc:	2d00      	cmp	r5, #0
    96be:	da7a      	bge.n	97b6 <_printf_i+0x1c2>
    96c0:	202d      	movs	r0, #45	; 0x2d
    96c2:	2900      	cmp	r1, #0
    96c4:	f884 0043 	strb.w	r0, [r4, #67]	; 0x43
    96c8:	60a1      	str	r1, [r4, #8]
    96ca:	da2d      	bge.n	9728 <_printf_i+0x134>
    96cc:	485e      	ldr	r0, [pc, #376]	; (9848 <_printf_i+0x254>)
    96ce:	426d      	negs	r5, r5
    96d0:	230a      	movs	r3, #10
    96d2:	4616      	mov	r6, r2
    96d4:	fbb5 f1f3 	udiv	r1, r5, r3
    96d8:	fb03 5711 	mls	r7, r3, r1, r5
    96dc:	5dc7      	ldrb	r7, [r0, r7]
    96de:	f806 7d01 	strb.w	r7, [r6, #-1]!
    96e2:	462f      	mov	r7, r5
    96e4:	42bb      	cmp	r3, r7
    96e6:	460d      	mov	r5, r1
    96e8:	d9f4      	bls.n	96d4 <_printf_i+0xe0>
    96ea:	2b08      	cmp	r3, #8
    96ec:	d10b      	bne.n	9706 <_printf_i+0x112>
    96ee:	6823      	ldr	r3, [r4, #0]
    96f0:	07df      	lsls	r7, r3, #31
    96f2:	d508      	bpl.n	9706 <_printf_i+0x112>
    96f4:	6923      	ldr	r3, [r4, #16]
    96f6:	6861      	ldr	r1, [r4, #4]
    96f8:	4299      	cmp	r1, r3
    96fa:	bfde      	ittt	le
    96fc:	2330      	movle	r3, #48	; 0x30
    96fe:	f806 3c01 	strble.w	r3, [r6, #-1]
    9702:	f106 36ff 	addle.w	r6, r6, #4294967295	; 0xffffffff
    9706:	1b92      	subs	r2, r2, r6
    9708:	6122      	str	r2, [r4, #16]
    970a:	f8cd a000 	str.w	sl, [sp]
    970e:	464b      	mov	r3, r9
    9710:	aa03      	add	r2, sp, #12
    9712:	4621      	mov	r1, r4
    9714:	4640      	mov	r0, r8
    9716:	f002 fe77 	bl	c408 <_printf_common>
    971a:	3001      	adds	r0, #1
    971c:	d171      	bne.n	9802 <_printf_i+0x20e>
    971e:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    9722:	b004      	add	sp, #16
    9724:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    9728:	f023 0304 	bic.w	r3, r3, #4
    972c:	6023      	str	r3, [r4, #0]
    972e:	e7cd      	b.n	96cc <_printf_i+0xd8>
    9730:	682b      	ldr	r3, [r5, #0]
    9732:	6820      	ldr	r0, [r4, #0]
    9734:	1d19      	adds	r1, r3, #4
    9736:	6029      	str	r1, [r5, #0]
    9738:	0605      	lsls	r5, r0, #24
    973a:	d501      	bpl.n	9740 <_printf_i+0x14c>
    973c:	681d      	ldr	r5, [r3, #0]
    973e:	e002      	b.n	9746 <_printf_i+0x152>
    9740:	0641      	lsls	r1, r0, #25
    9742:	d5fb      	bpl.n	973c <_printf_i+0x148>
    9744:	881d      	ldrh	r5, [r3, #0]
    9746:	4840      	ldr	r0, [pc, #256]	; (9848 <_printf_i+0x254>)
    9748:	2f6f      	cmp	r7, #111	; 0x6f
    974a:	bf14      	ite	ne
    974c:	230a      	movne	r3, #10
    974e:	2308      	moveq	r3, #8
    9750:	2100      	movs	r1, #0
    9752:	f884 1043 	strb.w	r1, [r4, #67]	; 0x43
    9756:	6866      	ldr	r6, [r4, #4]
    9758:	60a6      	str	r6, [r4, #8]
    975a:	2e00      	cmp	r6, #0
    975c:	dbb9      	blt.n	96d2 <_printf_i+0xde>
    975e:	6821      	ldr	r1, [r4, #0]
    9760:	f021 0104 	bic.w	r1, r1, #4
    9764:	6021      	str	r1, [r4, #0]
    9766:	2d00      	cmp	r5, #0
    9768:	d1b3      	bne.n	96d2 <_printf_i+0xde>
    976a:	2e00      	cmp	r6, #0
    976c:	d1b1      	bne.n	96d2 <_printf_i+0xde>
    976e:	4616      	mov	r6, r2
    9770:	e7bb      	b.n	96ea <_printf_i+0xf6>
    9772:	6823      	ldr	r3, [r4, #0]
    9774:	f043 0320 	orr.w	r3, r3, #32
    9778:	6023      	str	r3, [r4, #0]
    977a:	4834      	ldr	r0, [pc, #208]	; (984c <_printf_i+0x258>)
    977c:	2778      	movs	r7, #120	; 0x78
    977e:	f884 7045 	strb.w	r7, [r4, #69]	; 0x45
    9782:	6829      	ldr	r1, [r5, #0]
    9784:	6823      	ldr	r3, [r4, #0]
    9786:	1d0e      	adds	r6, r1, #4
    9788:	602e      	str	r6, [r5, #0]
    978a:	061e      	lsls	r6, r3, #24
    978c:	d503      	bpl.n	9796 <_printf_i+0x1a2>
    978e:	680d      	ldr	r5, [r1, #0]
    9790:	e004      	b.n	979c <_printf_i+0x1a8>
    9792:	482d      	ldr	r0, [pc, #180]	; (9848 <_printf_i+0x254>)
    9794:	e7f3      	b.n	977e <_printf_i+0x18a>
    9796:	065d      	lsls	r5, r3, #25
    9798:	d5f9      	bpl.n	978e <_printf_i+0x19a>
    979a:	880d      	ldrh	r5, [r1, #0]
    979c:	07d9      	lsls	r1, r3, #31
    979e:	bf44      	itt	mi
    97a0:	f043 0320 	orrmi.w	r3, r3, #32
    97a4:	6023      	strmi	r3, [r4, #0]
    97a6:	b10d      	cbz	r5, 97ac <_printf_i+0x1b8>
    97a8:	2310      	movs	r3, #16
    97aa:	e7d1      	b.n	9750 <_printf_i+0x15c>
    97ac:	6823      	ldr	r3, [r4, #0]
    97ae:	f023 0320 	bic.w	r3, r3, #32
    97b2:	6023      	str	r3, [r4, #0]
    97b4:	e7f8      	b.n	97a8 <_printf_i+0x1b4>
    97b6:	4824      	ldr	r0, [pc, #144]	; (9848 <_printf_i+0x254>)
    97b8:	230a      	movs	r3, #10
    97ba:	e7cc      	b.n	9756 <_printf_i+0x162>
    97bc:	682b      	ldr	r3, [r5, #0]
    97be:	6826      	ldr	r6, [r4, #0]
    97c0:	6961      	ldr	r1, [r4, #20]
    97c2:	1d18      	adds	r0, r3, #4
    97c4:	6028      	str	r0, [r5, #0]
    97c6:	0635      	lsls	r5, r6, #24
    97c8:	681b      	ldr	r3, [r3, #0]
    97ca:	d501      	bpl.n	97d0 <_printf_i+0x1dc>
    97cc:	6019      	str	r1, [r3, #0]
    97ce:	e002      	b.n	97d6 <_printf_i+0x1e2>
    97d0:	0670      	lsls	r0, r6, #25
    97d2:	d5fb      	bpl.n	97cc <_printf_i+0x1d8>
    97d4:	8019      	strh	r1, [r3, #0]
    97d6:	2300      	movs	r3, #0
    97d8:	6123      	str	r3, [r4, #16]
    97da:	4616      	mov	r6, r2
    97dc:	e795      	b.n	970a <_printf_i+0x116>
    97de:	682b      	ldr	r3, [r5, #0]
    97e0:	1d1a      	adds	r2, r3, #4
    97e2:	602a      	str	r2, [r5, #0]
    97e4:	681e      	ldr	r6, [r3, #0]
    97e6:	6862      	ldr	r2, [r4, #4]
    97e8:	2100      	movs	r1, #0
    97ea:	4630      	mov	r0, r6
    97ec:	f7f6 fc88 	bl	100 <memchr>
    97f0:	b108      	cbz	r0, 97f6 <_printf_i+0x202>
    97f2:	1b80      	subs	r0, r0, r6
    97f4:	6060      	str	r0, [r4, #4]
    97f6:	6863      	ldr	r3, [r4, #4]
    97f8:	6123      	str	r3, [r4, #16]
    97fa:	2300      	movs	r3, #0
    97fc:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
    9800:	e783      	b.n	970a <_printf_i+0x116>
    9802:	6923      	ldr	r3, [r4, #16]
    9804:	4632      	mov	r2, r6
    9806:	4649      	mov	r1, r9
    9808:	4640      	mov	r0, r8
    980a:	47d0      	blx	sl
    980c:	3001      	adds	r0, #1
    980e:	d086      	beq.n	971e <_printf_i+0x12a>
    9810:	6823      	ldr	r3, [r4, #0]
    9812:	079b      	lsls	r3, r3, #30
    9814:	d414      	bmi.n	9840 <_printf_i+0x24c>
    9816:	68e0      	ldr	r0, [r4, #12]
    9818:	9b03      	ldr	r3, [sp, #12]
    981a:	4298      	cmp	r0, r3
    981c:	bfb8      	it	lt
    981e:	4618      	movlt	r0, r3
    9820:	e77f      	b.n	9722 <_printf_i+0x12e>
    9822:	2301      	movs	r3, #1
    9824:	4632      	mov	r2, r6
    9826:	4649      	mov	r1, r9
    9828:	4640      	mov	r0, r8
    982a:	47d0      	blx	sl
    982c:	3001      	adds	r0, #1
    982e:	f43f af76 	beq.w	971e <_printf_i+0x12a>
    9832:	3501      	adds	r5, #1
    9834:	68e3      	ldr	r3, [r4, #12]
    9836:	9903      	ldr	r1, [sp, #12]
    9838:	1a5b      	subs	r3, r3, r1
    983a:	42ab      	cmp	r3, r5
    983c:	dcf1      	bgt.n	9822 <_printf_i+0x22e>
    983e:	e7ea      	b.n	9816 <_printf_i+0x222>
    9840:	2500      	movs	r5, #0
    9842:	f104 0619 	add.w	r6, r4, #25
    9846:	e7f5      	b.n	9834 <_printf_i+0x240>
    9848:	0000e7a6 	.word	0x0000e7a6
    984c:	0000e7b7 	.word	0x0000e7b7

00009850 <__swbuf_r>:
    9850:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    9852:	460e      	mov	r6, r1
    9854:	4614      	mov	r4, r2
    9856:	4605      	mov	r5, r0
    9858:	b118      	cbz	r0, 9862 <__swbuf_r+0x12>
    985a:	6983      	ldr	r3, [r0, #24]
    985c:	b90b      	cbnz	r3, 9862 <__swbuf_r+0x12>
    985e:	f7ff fc17 	bl	9090 <__sinit>
    9862:	4b21      	ldr	r3, [pc, #132]	; (98e8 <__swbuf_r+0x98>)
    9864:	429c      	cmp	r4, r3
    9866:	d110      	bne.n	988a <__swbuf_r+0x3a>
    9868:	686c      	ldr	r4, [r5, #4]
    986a:	69a3      	ldr	r3, [r4, #24]
    986c:	60a3      	str	r3, [r4, #8]
    986e:	89a3      	ldrh	r3, [r4, #12]
    9870:	071a      	lsls	r2, r3, #28
    9872:	d501      	bpl.n	9878 <__swbuf_r+0x28>
    9874:	6923      	ldr	r3, [r4, #16]
    9876:	b993      	cbnz	r3, 989e <__swbuf_r+0x4e>
    9878:	4621      	mov	r1, r4
    987a:	4628      	mov	r0, r5
    987c:	f000 f84c 	bl	9918 <__swsetup_r>
    9880:	b168      	cbz	r0, 989e <__swbuf_r+0x4e>
    9882:	f04f 37ff 	mov.w	r7, #4294967295	; 0xffffffff
    9886:	4638      	mov	r0, r7
    9888:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    988a:	4b18      	ldr	r3, [pc, #96]	; (98ec <__swbuf_r+0x9c>)
    988c:	429c      	cmp	r4, r3
    988e:	d101      	bne.n	9894 <__swbuf_r+0x44>
    9890:	68ac      	ldr	r4, [r5, #8]
    9892:	e7ea      	b.n	986a <__swbuf_r+0x1a>
    9894:	4b16      	ldr	r3, [pc, #88]	; (98f0 <__swbuf_r+0xa0>)
    9896:	429c      	cmp	r4, r3
    9898:	bf08      	it	eq
    989a:	68ec      	ldreq	r4, [r5, #12]
    989c:	e7e5      	b.n	986a <__swbuf_r+0x1a>
    989e:	6923      	ldr	r3, [r4, #16]
    98a0:	6820      	ldr	r0, [r4, #0]
    98a2:	1ac0      	subs	r0, r0, r3
    98a4:	6963      	ldr	r3, [r4, #20]
    98a6:	b2f6      	uxtb	r6, r6
    98a8:	4283      	cmp	r3, r0
    98aa:	4637      	mov	r7, r6
    98ac:	dc05      	bgt.n	98ba <__swbuf_r+0x6a>
    98ae:	4621      	mov	r1, r4
    98b0:	4628      	mov	r0, r5
    98b2:	f000 f8ad 	bl	9a10 <_fflush_r>
    98b6:	2800      	cmp	r0, #0
    98b8:	d1e3      	bne.n	9882 <__swbuf_r+0x32>
    98ba:	68a3      	ldr	r3, [r4, #8]
    98bc:	3b01      	subs	r3, #1
    98be:	60a3      	str	r3, [r4, #8]
    98c0:	6823      	ldr	r3, [r4, #0]
    98c2:	1c5a      	adds	r2, r3, #1
    98c4:	6022      	str	r2, [r4, #0]
    98c6:	701e      	strb	r6, [r3, #0]
    98c8:	6963      	ldr	r3, [r4, #20]
    98ca:	3001      	adds	r0, #1
    98cc:	4283      	cmp	r3, r0
    98ce:	d004      	beq.n	98da <__swbuf_r+0x8a>
    98d0:	89a3      	ldrh	r3, [r4, #12]
    98d2:	07db      	lsls	r3, r3, #31
    98d4:	d5d7      	bpl.n	9886 <__swbuf_r+0x36>
    98d6:	2e0a      	cmp	r6, #10
    98d8:	d1d5      	bne.n	9886 <__swbuf_r+0x36>
    98da:	4621      	mov	r1, r4
    98dc:	4628      	mov	r0, r5
    98de:	f000 f897 	bl	9a10 <_fflush_r>
    98e2:	2800      	cmp	r0, #0
    98e4:	d0cf      	beq.n	9886 <__swbuf_r+0x36>
    98e6:	e7cc      	b.n	9882 <__swbuf_r+0x32>
    98e8:	0000d4e0 	.word	0x0000d4e0
    98ec:	0000d4c0 	.word	0x0000d4c0
    98f0:	0000d4a0 	.word	0x0000d4a0

000098f4 <_write_r>:
    98f4:	b538      	push	{r3, r4, r5, lr}
    98f6:	4d07      	ldr	r5, [pc, #28]	; (9914 <_write_r+0x20>)
    98f8:	4604      	mov	r4, r0
    98fa:	4608      	mov	r0, r1
    98fc:	4611      	mov	r1, r2
    98fe:	2200      	movs	r2, #0
    9900:	602a      	str	r2, [r5, #0]
    9902:	461a      	mov	r2, r3
    9904:	f001 fce0 	bl	b2c8 <_write>
    9908:	1c43      	adds	r3, r0, #1
    990a:	d102      	bne.n	9912 <_write_r+0x1e>
    990c:	682b      	ldr	r3, [r5, #0]
    990e:	b103      	cbz	r3, 9912 <_write_r+0x1e>
    9910:	6023      	str	r3, [r4, #0]
    9912:	bd38      	pop	{r3, r4, r5, pc}
    9914:	20001694 	.word	0x20001694

00009918 <__swsetup_r>:
    9918:	4b31      	ldr	r3, [pc, #196]	; (99e0 <__swsetup_r+0xc8>)
    991a:	b570      	push	{r4, r5, r6, lr}
    991c:	681d      	ldr	r5, [r3, #0]
    991e:	4606      	mov	r6, r0
    9920:	460c      	mov	r4, r1
    9922:	b125      	cbz	r5, 992e <__swsetup_r+0x16>
    9924:	69ab      	ldr	r3, [r5, #24]
    9926:	b913      	cbnz	r3, 992e <__swsetup_r+0x16>
    9928:	4628      	mov	r0, r5
    992a:	f7ff fbb1 	bl	9090 <__sinit>
    992e:	4b2d      	ldr	r3, [pc, #180]	; (99e4 <__swsetup_r+0xcc>)
    9930:	429c      	cmp	r4, r3
    9932:	d10e      	bne.n	9952 <__swsetup_r+0x3a>
    9934:	686c      	ldr	r4, [r5, #4]
    9936:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    993a:	071a      	lsls	r2, r3, #28
    993c:	d42c      	bmi.n	9998 <__swsetup_r+0x80>
    993e:	06dd      	lsls	r5, r3, #27
    9940:	d411      	bmi.n	9966 <__swsetup_r+0x4e>
    9942:	2209      	movs	r2, #9
    9944:	6032      	str	r2, [r6, #0]
    9946:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    994a:	81a3      	strh	r3, [r4, #12]
    994c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    9950:	e03d      	b.n	99ce <__swsetup_r+0xb6>
    9952:	4b25      	ldr	r3, [pc, #148]	; (99e8 <__swsetup_r+0xd0>)
    9954:	429c      	cmp	r4, r3
    9956:	d101      	bne.n	995c <__swsetup_r+0x44>
    9958:	68ac      	ldr	r4, [r5, #8]
    995a:	e7ec      	b.n	9936 <__swsetup_r+0x1e>
    995c:	4b23      	ldr	r3, [pc, #140]	; (99ec <__swsetup_r+0xd4>)
    995e:	429c      	cmp	r4, r3
    9960:	bf08      	it	eq
    9962:	68ec      	ldreq	r4, [r5, #12]
    9964:	e7e7      	b.n	9936 <__swsetup_r+0x1e>
    9966:	0758      	lsls	r0, r3, #29
    9968:	d512      	bpl.n	9990 <__swsetup_r+0x78>
    996a:	6b61      	ldr	r1, [r4, #52]	; 0x34
    996c:	b141      	cbz	r1, 9980 <__swsetup_r+0x68>
    996e:	f104 0344 	add.w	r3, r4, #68	; 0x44
    9972:	4299      	cmp	r1, r3
    9974:	d002      	beq.n	997c <__swsetup_r+0x64>
    9976:	4630      	mov	r0, r6
    9978:	f7ff f92a 	bl	8bd0 <_free_r>
    997c:	2300      	movs	r3, #0
    997e:	6363      	str	r3, [r4, #52]	; 0x34
    9980:	89a3      	ldrh	r3, [r4, #12]
    9982:	f023 0324 	bic.w	r3, r3, #36	; 0x24
    9986:	81a3      	strh	r3, [r4, #12]
    9988:	2300      	movs	r3, #0
    998a:	6063      	str	r3, [r4, #4]
    998c:	6923      	ldr	r3, [r4, #16]
    998e:	6023      	str	r3, [r4, #0]
    9990:	89a3      	ldrh	r3, [r4, #12]
    9992:	f043 0308 	orr.w	r3, r3, #8
    9996:	81a3      	strh	r3, [r4, #12]
    9998:	6923      	ldr	r3, [r4, #16]
    999a:	b94b      	cbnz	r3, 99b0 <__swsetup_r+0x98>
    999c:	89a3      	ldrh	r3, [r4, #12]
    999e:	f403 7320 	and.w	r3, r3, #640	; 0x280
    99a2:	f5b3 7f00 	cmp.w	r3, #512	; 0x200
    99a6:	d003      	beq.n	99b0 <__swsetup_r+0x98>
    99a8:	4621      	mov	r1, r4
    99aa:	4630      	mov	r0, r6
    99ac:	f000 f87e 	bl	9aac <__smakebuf_r>
    99b0:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    99b4:	f013 0201 	ands.w	r2, r3, #1
    99b8:	d00a      	beq.n	99d0 <__swsetup_r+0xb8>
    99ba:	2200      	movs	r2, #0
    99bc:	60a2      	str	r2, [r4, #8]
    99be:	6962      	ldr	r2, [r4, #20]
    99c0:	4252      	negs	r2, r2
    99c2:	61a2      	str	r2, [r4, #24]
    99c4:	6922      	ldr	r2, [r4, #16]
    99c6:	b942      	cbnz	r2, 99da <__swsetup_r+0xc2>
    99c8:	f013 0080 	ands.w	r0, r3, #128	; 0x80
    99cc:	d1bb      	bne.n	9946 <__swsetup_r+0x2e>
    99ce:	bd70      	pop	{r4, r5, r6, pc}
    99d0:	0799      	lsls	r1, r3, #30
    99d2:	bf58      	it	pl
    99d4:	6962      	ldrpl	r2, [r4, #20]
    99d6:	60a2      	str	r2, [r4, #8]
    99d8:	e7f4      	b.n	99c4 <__swsetup_r+0xac>
    99da:	2000      	movs	r0, #0
    99dc:	e7f7      	b.n	99ce <__swsetup_r+0xb6>
    99de:	bf00      	nop
    99e0:	20000210 	.word	0x20000210
    99e4:	0000d4e0 	.word	0x0000d4e0
    99e8:	0000d4c0 	.word	0x0000d4c0
    99ec:	0000d4a0 	.word	0x0000d4a0

000099f0 <_close_r>:
    99f0:	b538      	push	{r3, r4, r5, lr}
    99f2:	4d06      	ldr	r5, [pc, #24]	; (9a0c <_close_r+0x1c>)
    99f4:	2300      	movs	r3, #0
    99f6:	4604      	mov	r4, r0
    99f8:	4608      	mov	r0, r1
    99fa:	602b      	str	r3, [r5, #0]
    99fc:	f001 fc68 	bl	b2d0 <_close>
    9a00:	1c43      	adds	r3, r0, #1
    9a02:	d102      	bne.n	9a0a <_close_r+0x1a>
    9a04:	682b      	ldr	r3, [r5, #0]
    9a06:	b103      	cbz	r3, 9a0a <_close_r+0x1a>
    9a08:	6023      	str	r3, [r4, #0]
    9a0a:	bd38      	pop	{r3, r4, r5, pc}
    9a0c:	20001694 	.word	0x20001694

00009a10 <_fflush_r>:
    9a10:	b538      	push	{r3, r4, r5, lr}
    9a12:	690b      	ldr	r3, [r1, #16]
    9a14:	4605      	mov	r5, r0
    9a16:	460c      	mov	r4, r1
    9a18:	b913      	cbnz	r3, 9a20 <_fflush_r+0x10>
    9a1a:	2500      	movs	r5, #0
    9a1c:	4628      	mov	r0, r5
    9a1e:	bd38      	pop	{r3, r4, r5, pc}
    9a20:	b118      	cbz	r0, 9a2a <_fflush_r+0x1a>
    9a22:	6983      	ldr	r3, [r0, #24]
    9a24:	b90b      	cbnz	r3, 9a2a <_fflush_r+0x1a>
    9a26:	f7ff fb33 	bl	9090 <__sinit>
    9a2a:	4b14      	ldr	r3, [pc, #80]	; (9a7c <_fflush_r+0x6c>)
    9a2c:	429c      	cmp	r4, r3
    9a2e:	d11b      	bne.n	9a68 <_fflush_r+0x58>
    9a30:	686c      	ldr	r4, [r5, #4]
    9a32:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    9a36:	2b00      	cmp	r3, #0
    9a38:	d0ef      	beq.n	9a1a <_fflush_r+0xa>
    9a3a:	6e62      	ldr	r2, [r4, #100]	; 0x64
    9a3c:	07d0      	lsls	r0, r2, #31
    9a3e:	d404      	bmi.n	9a4a <_fflush_r+0x3a>
    9a40:	0599      	lsls	r1, r3, #22
    9a42:	d402      	bmi.n	9a4a <_fflush_r+0x3a>
    9a44:	6da0      	ldr	r0, [r4, #88]	; 0x58
    9a46:	f001 fc60 	bl	b30a <__retarget_lock_acquire_recursive>
    9a4a:	4628      	mov	r0, r5
    9a4c:	4621      	mov	r1, r4
    9a4e:	f002 fd8b 	bl	c568 <__sflush_r>
    9a52:	6e63      	ldr	r3, [r4, #100]	; 0x64
    9a54:	07da      	lsls	r2, r3, #31
    9a56:	4605      	mov	r5, r0
    9a58:	d4e0      	bmi.n	9a1c <_fflush_r+0xc>
    9a5a:	89a3      	ldrh	r3, [r4, #12]
    9a5c:	059b      	lsls	r3, r3, #22
    9a5e:	d4dd      	bmi.n	9a1c <_fflush_r+0xc>
    9a60:	6da0      	ldr	r0, [r4, #88]	; 0x58
    9a62:	f001 fc58 	bl	b316 <__retarget_lock_release_recursive>
    9a66:	e7d9      	b.n	9a1c <_fflush_r+0xc>
    9a68:	4b05      	ldr	r3, [pc, #20]	; (9a80 <_fflush_r+0x70>)
    9a6a:	429c      	cmp	r4, r3
    9a6c:	d101      	bne.n	9a72 <_fflush_r+0x62>
    9a6e:	68ac      	ldr	r4, [r5, #8]
    9a70:	e7df      	b.n	9a32 <_fflush_r+0x22>
    9a72:	4b04      	ldr	r3, [pc, #16]	; (9a84 <_fflush_r+0x74>)
    9a74:	429c      	cmp	r4, r3
    9a76:	bf08      	it	eq
    9a78:	68ec      	ldreq	r4, [r5, #12]
    9a7a:	e7da      	b.n	9a32 <_fflush_r+0x22>
    9a7c:	0000d4e0 	.word	0x0000d4e0
    9a80:	0000d4c0 	.word	0x0000d4c0
    9a84:	0000d4a0 	.word	0x0000d4a0

00009a88 <_lseek_r>:
    9a88:	b538      	push	{r3, r4, r5, lr}
    9a8a:	4d07      	ldr	r5, [pc, #28]	; (9aa8 <_lseek_r+0x20>)
    9a8c:	4604      	mov	r4, r0
    9a8e:	4608      	mov	r0, r1
    9a90:	4611      	mov	r1, r2
    9a92:	2200      	movs	r2, #0
    9a94:	602a      	str	r2, [r5, #0]
    9a96:	461a      	mov	r2, r3
    9a98:	f001 fc1d 	bl	b2d6 <_lseek>
    9a9c:	1c43      	adds	r3, r0, #1
    9a9e:	d102      	bne.n	9aa6 <_lseek_r+0x1e>
    9aa0:	682b      	ldr	r3, [r5, #0]
    9aa2:	b103      	cbz	r3, 9aa6 <_lseek_r+0x1e>
    9aa4:	6023      	str	r3, [r4, #0]
    9aa6:	bd38      	pop	{r3, r4, r5, pc}
    9aa8:	20001694 	.word	0x20001694

00009aac <__smakebuf_r>:
    9aac:	898b      	ldrh	r3, [r1, #12]
    9aae:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    9ab0:	079d      	lsls	r5, r3, #30
    9ab2:	4606      	mov	r6, r0
    9ab4:	460c      	mov	r4, r1
    9ab6:	d507      	bpl.n	9ac8 <__smakebuf_r+0x1c>
    9ab8:	f104 0347 	add.w	r3, r4, #71	; 0x47
    9abc:	6023      	str	r3, [r4, #0]
    9abe:	6123      	str	r3, [r4, #16]
    9ac0:	2301      	movs	r3, #1
    9ac2:	6163      	str	r3, [r4, #20]
    9ac4:	b003      	add	sp, #12
    9ac6:	bdf0      	pop	{r4, r5, r6, r7, pc}
    9ac8:	ab01      	add	r3, sp, #4
    9aca:	466a      	mov	r2, sp
    9acc:	f002 fdcc 	bl	c668 <__swhatbuf_r>
    9ad0:	9f00      	ldr	r7, [sp, #0]
    9ad2:	4605      	mov	r5, r0
    9ad4:	4639      	mov	r1, r7
    9ad6:	4630      	mov	r0, r6
    9ad8:	f7ff f8c4 	bl	8c64 <_malloc_r>
    9adc:	b948      	cbnz	r0, 9af2 <__smakebuf_r+0x46>
    9ade:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    9ae2:	059a      	lsls	r2, r3, #22
    9ae4:	d4ee      	bmi.n	9ac4 <__smakebuf_r+0x18>
    9ae6:	f023 0303 	bic.w	r3, r3, #3
    9aea:	f043 0302 	orr.w	r3, r3, #2
    9aee:	81a3      	strh	r3, [r4, #12]
    9af0:	e7e2      	b.n	9ab8 <__smakebuf_r+0xc>
    9af2:	4b0d      	ldr	r3, [pc, #52]	; (9b28 <__smakebuf_r+0x7c>)
    9af4:	62b3      	str	r3, [r6, #40]	; 0x28
    9af6:	89a3      	ldrh	r3, [r4, #12]
    9af8:	6020      	str	r0, [r4, #0]
    9afa:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    9afe:	81a3      	strh	r3, [r4, #12]
    9b00:	9b01      	ldr	r3, [sp, #4]
    9b02:	e9c4 0704 	strd	r0, r7, [r4, #16]
    9b06:	b15b      	cbz	r3, 9b20 <__smakebuf_r+0x74>
    9b08:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    9b0c:	4630      	mov	r0, r6
    9b0e:	f000 f831 	bl	9b74 <_isatty_r>
    9b12:	b128      	cbz	r0, 9b20 <__smakebuf_r+0x74>
    9b14:	89a3      	ldrh	r3, [r4, #12]
    9b16:	f023 0303 	bic.w	r3, r3, #3
    9b1a:	f043 0301 	orr.w	r3, r3, #1
    9b1e:	81a3      	strh	r3, [r4, #12]
    9b20:	89a3      	ldrh	r3, [r4, #12]
    9b22:	431d      	orrs	r5, r3
    9b24:	81a5      	strh	r5, [r4, #12]
    9b26:	e7cd      	b.n	9ac4 <__smakebuf_r+0x18>
    9b28:	00009055 	.word	0x00009055

00009b2c <_read_r>:
    9b2c:	b538      	push	{r3, r4, r5, lr}
    9b2e:	4d07      	ldr	r5, [pc, #28]	; (9b4c <_read_r+0x20>)
    9b30:	4604      	mov	r4, r0
    9b32:	4608      	mov	r0, r1
    9b34:	4611      	mov	r1, r2
    9b36:	2200      	movs	r2, #0
    9b38:	602a      	str	r2, [r5, #0]
    9b3a:	461a      	mov	r2, r3
    9b3c:	f001 fbc0 	bl	b2c0 <_read>
    9b40:	1c43      	adds	r3, r0, #1
    9b42:	d102      	bne.n	9b4a <_read_r+0x1e>
    9b44:	682b      	ldr	r3, [r5, #0]
    9b46:	b103      	cbz	r3, 9b4a <_read_r+0x1e>
    9b48:	6023      	str	r3, [r4, #0]
    9b4a:	bd38      	pop	{r3, r4, r5, pc}
    9b4c:	20001694 	.word	0x20001694

00009b50 <_fstat_r>:
    9b50:	b538      	push	{r3, r4, r5, lr}
    9b52:	4d07      	ldr	r5, [pc, #28]	; (9b70 <_fstat_r+0x20>)
    9b54:	2300      	movs	r3, #0
    9b56:	4604      	mov	r4, r0
    9b58:	4608      	mov	r0, r1
    9b5a:	4611      	mov	r1, r2
    9b5c:	602b      	str	r3, [r5, #0]
    9b5e:	f001 fbc5 	bl	b2ec <_fstat>
    9b62:	1c43      	adds	r3, r0, #1
    9b64:	d102      	bne.n	9b6c <_fstat_r+0x1c>
    9b66:	682b      	ldr	r3, [r5, #0]
    9b68:	b103      	cbz	r3, 9b6c <_fstat_r+0x1c>
    9b6a:	6023      	str	r3, [r4, #0]
    9b6c:	bd38      	pop	{r3, r4, r5, pc}
    9b6e:	bf00      	nop
    9b70:	20001694 	.word	0x20001694

00009b74 <_isatty_r>:
    9b74:	b538      	push	{r3, r4, r5, lr}
    9b76:	4d06      	ldr	r5, [pc, #24]	; (9b90 <_isatty_r+0x1c>)
    9b78:	2300      	movs	r3, #0
    9b7a:	4604      	mov	r4, r0
    9b7c:	4608      	mov	r0, r1
    9b7e:	602b      	str	r3, [r5, #0]
    9b80:	f001 fbab 	bl	b2da <_isatty>
    9b84:	1c43      	adds	r3, r0, #1
    9b86:	d102      	bne.n	9b8e <_isatty_r+0x1a>
    9b88:	682b      	ldr	r3, [r5, #0]
    9b8a:	b103      	cbz	r3, 9b8e <_isatty_r+0x1a>
    9b8c:	6023      	str	r3, [r4, #0]
    9b8e:	bd38      	pop	{r3, r4, r5, pc}
    9b90:	20001694 	.word	0x20001694

00009b94 <nrf_cc3xx_platform_init_no_rng>:
    9b94:	b510      	push	{r4, lr}
    9b96:	4c0a      	ldr	r4, [pc, #40]	; (9bc0 <nrf_cc3xx_platform_init_no_rng+0x2c>)
    9b98:	6823      	ldr	r3, [r4, #0]
    9b9a:	b11b      	cbz	r3, 9ba4 <nrf_cc3xx_platform_init_no_rng+0x10>
    9b9c:	2301      	movs	r3, #1
    9b9e:	6023      	str	r3, [r4, #0]
    9ba0:	2000      	movs	r0, #0
    9ba2:	bd10      	pop	{r4, pc}
    9ba4:	f000 f8e6 	bl	9d74 <CC_LibInitNoRng>
    9ba8:	2800      	cmp	r0, #0
    9baa:	d0f7      	beq.n	9b9c <nrf_cc3xx_platform_init_no_rng+0x8>
    9bac:	3801      	subs	r0, #1
    9bae:	2806      	cmp	r0, #6
    9bb0:	d803      	bhi.n	9bba <nrf_cc3xx_platform_init_no_rng+0x26>
    9bb2:	4b04      	ldr	r3, [pc, #16]	; (9bc4 <nrf_cc3xx_platform_init_no_rng+0x30>)
    9bb4:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
    9bb8:	bd10      	pop	{r4, pc}
    9bba:	4803      	ldr	r0, [pc, #12]	; (9bc8 <nrf_cc3xx_platform_init_no_rng+0x34>)
    9bbc:	bd10      	pop	{r4, pc}
    9bbe:	bf00      	nop
    9bc0:	20001698 	.word	0x20001698
    9bc4:	0000d504 	.word	0x0000d504
    9bc8:	ffff8ffe 	.word	0xffff8ffe

00009bcc <nrf_cc3xx_platform_abort>:
    9bcc:	f3bf 8f4f 	dsb	sy
    9bd0:	4905      	ldr	r1, [pc, #20]	; (9be8 <nrf_cc3xx_platform_abort+0x1c>)
    9bd2:	4b06      	ldr	r3, [pc, #24]	; (9bec <nrf_cc3xx_platform_abort+0x20>)
    9bd4:	68ca      	ldr	r2, [r1, #12]
    9bd6:	f402 62e0 	and.w	r2, r2, #1792	; 0x700
    9bda:	4313      	orrs	r3, r2
    9bdc:	60cb      	str	r3, [r1, #12]
    9bde:	f3bf 8f4f 	dsb	sy
    9be2:	bf00      	nop
    9be4:	e7fd      	b.n	9be2 <nrf_cc3xx_platform_abort+0x16>
    9be6:	bf00      	nop
    9be8:	e000ed00 	.word	0xe000ed00
    9bec:	05fa0004 	.word	0x05fa0004

00009bf0 <CC_PalAbort>:
    9bf0:	b410      	push	{r4}
    9bf2:	4b09      	ldr	r3, [pc, #36]	; (9c18 <CC_PalAbort+0x28>)
    9bf4:	4909      	ldr	r1, [pc, #36]	; (9c1c <CC_PalAbort+0x2c>)
    9bf6:	4c0a      	ldr	r4, [pc, #40]	; (9c20 <CC_PalAbort+0x30>)
    9bf8:	f04f 32fe 	mov.w	r2, #4278124286	; 0xfefefefe
    9bfc:	f8c3 2400 	str.w	r2, [r3, #1024]	; 0x400
    9c00:	6849      	ldr	r1, [r1, #4]
    9c02:	f8c3 2404 	str.w	r2, [r3, #1028]	; 0x404
    9c06:	f8c3 2408 	str.w	r2, [r3, #1032]	; 0x408
    9c0a:	f8c3 240c 	str.w	r2, [r3, #1036]	; 0x40c
    9c0e:	2300      	movs	r3, #0
    9c10:	f8c4 3500 	str.w	r3, [r4, #1280]	; 0x500
    9c14:	bc10      	pop	{r4}
    9c16:	4708      	bx	r1
    9c18:	5002b000 	.word	0x5002b000
    9c1c:	20000274 	.word	0x20000274
    9c20:	5002a000 	.word	0x5002a000

00009c24 <nrf_cc3xx_platform_set_abort>:
    9c24:	e9d0 1200 	ldrd	r1, r2, [r0]
    9c28:	4b01      	ldr	r3, [pc, #4]	; (9c30 <nrf_cc3xx_platform_set_abort+0xc>)
    9c2a:	e9c3 1200 	strd	r1, r2, [r3]
    9c2e:	4770      	bx	lr
    9c30:	20000274 	.word	0x20000274

00009c34 <mutex_free>:
    9c34:	b510      	push	{r4, lr}
    9c36:	4604      	mov	r4, r0
    9c38:	b150      	cbz	r0, 9c50 <mutex_free+0x1c>
    9c3a:	6863      	ldr	r3, [r4, #4]
    9c3c:	f013 5f68 	tst.w	r3, #973078528	; 0x3a000000
    9c40:	d005      	beq.n	9c4e <mutex_free+0x1a>
    9c42:	4a06      	ldr	r2, [pc, #24]	; (9c5c <mutex_free+0x28>)
    9c44:	4293      	cmp	r3, r2
    9c46:	d002      	beq.n	9c4e <mutex_free+0x1a>
    9c48:	2300      	movs	r3, #0
    9c4a:	6023      	str	r3, [r4, #0]
    9c4c:	6062      	str	r2, [r4, #4]
    9c4e:	bd10      	pop	{r4, pc}
    9c50:	4b03      	ldr	r3, [pc, #12]	; (9c60 <mutex_free+0x2c>)
    9c52:	4804      	ldr	r0, [pc, #16]	; (9c64 <mutex_free+0x30>)
    9c54:	685b      	ldr	r3, [r3, #4]
    9c56:	4798      	blx	r3
    9c58:	e7ef      	b.n	9c3a <mutex_free+0x6>
    9c5a:	bf00      	nop
    9c5c:	a95c5f2c 	.word	0xa95c5f2c
    9c60:	20000274 	.word	0x20000274
    9c64:	0000d520 	.word	0x0000d520

00009c68 <mutex_lock>:
    9c68:	b1c8      	cbz	r0, 9c9e <mutex_lock+0x36>
    9c6a:	6843      	ldr	r3, [r0, #4]
    9c6c:	4a0d      	ldr	r2, [pc, #52]	; (9ca4 <mutex_lock+0x3c>)
    9c6e:	4293      	cmp	r3, r2
    9c70:	d013      	beq.n	9c9a <mutex_lock+0x32>
    9c72:	f013 5f68 	tst.w	r3, #973078528	; 0x3a000000
    9c76:	d00e      	beq.n	9c96 <mutex_lock+0x2e>
    9c78:	2301      	movs	r3, #1
    9c7a:	e850 2f00 	ldrex	r2, [r0]
    9c7e:	4619      	mov	r1, r3
    9c80:	e840 1c00 	strex	ip, r1, [r0]
    9c84:	f09c 0f00 	teq	ip, #0
    9c88:	d1f7      	bne.n	9c7a <mutex_lock+0x12>
    9c8a:	2a01      	cmp	r2, #1
    9c8c:	d0f5      	beq.n	9c7a <mutex_lock+0x12>
    9c8e:	f3bf 8f5f 	dmb	sy
    9c92:	2000      	movs	r0, #0
    9c94:	4770      	bx	lr
    9c96:	4804      	ldr	r0, [pc, #16]	; (9ca8 <mutex_lock+0x40>)
    9c98:	4770      	bx	lr
    9c9a:	4804      	ldr	r0, [pc, #16]	; (9cac <mutex_lock+0x44>)
    9c9c:	4770      	bx	lr
    9c9e:	f46f 40e0 	mvn.w	r0, #28672	; 0x7000
    9ca2:	4770      	bx	lr
    9ca4:	a95c5f2c 	.word	0xa95c5f2c
    9ca8:	ffff8fe9 	.word	0xffff8fe9
    9cac:	ffff8fea 	.word	0xffff8fea

00009cb0 <mutex_unlock>:
    9cb0:	b180      	cbz	r0, 9cd4 <mutex_unlock+0x24>
    9cb2:	6843      	ldr	r3, [r0, #4]
    9cb4:	4a09      	ldr	r2, [pc, #36]	; (9cdc <mutex_unlock+0x2c>)
    9cb6:	4293      	cmp	r3, r2
    9cb8:	d00a      	beq.n	9cd0 <mutex_unlock+0x20>
    9cba:	f013 5f68 	tst.w	r3, #973078528	; 0x3a000000
    9cbe:	d005      	beq.n	9ccc <mutex_unlock+0x1c>
    9cc0:	f3bf 8f5f 	dmb	sy
    9cc4:	2300      	movs	r3, #0
    9cc6:	6003      	str	r3, [r0, #0]
    9cc8:	4618      	mov	r0, r3
    9cca:	4770      	bx	lr
    9ccc:	4804      	ldr	r0, [pc, #16]	; (9ce0 <mutex_unlock+0x30>)
    9cce:	4770      	bx	lr
    9cd0:	4804      	ldr	r0, [pc, #16]	; (9ce4 <mutex_unlock+0x34>)
    9cd2:	4770      	bx	lr
    9cd4:	f46f 40e0 	mvn.w	r0, #28672	; 0x7000
    9cd8:	4770      	bx	lr
    9cda:	bf00      	nop
    9cdc:	a95c5f2c 	.word	0xa95c5f2c
    9ce0:	ffff8fe9 	.word	0xffff8fe9
    9ce4:	ffff8fea 	.word	0xffff8fea

00009ce8 <mutex_init>:
    9ce8:	b510      	push	{r4, lr}
    9cea:	4604      	mov	r4, r0
    9cec:	b120      	cbz	r0, 9cf8 <mutex_init+0x10>
    9cee:	4b04      	ldr	r3, [pc, #16]	; (9d00 <mutex_init+0x18>)
    9cf0:	6063      	str	r3, [r4, #4]
    9cf2:	2200      	movs	r2, #0
    9cf4:	6022      	str	r2, [r4, #0]
    9cf6:	bd10      	pop	{r4, pc}
    9cf8:	4802      	ldr	r0, [pc, #8]	; (9d04 <mutex_init+0x1c>)
    9cfa:	f7ff ff79 	bl	9bf0 <CC_PalAbort>
    9cfe:	e7f6      	b.n	9cee <mutex_init+0x6>
    9d00:	3a00003a 	.word	0x3a00003a
    9d04:	0000d548 	.word	0x0000d548

00009d08 <nrf_cc3xx_platform_set_mutexes>:
    9d08:	b570      	push	{r4, r5, r6, lr}
    9d0a:	e9d0 2300 	ldrd	r2, r3, [r0]
    9d0e:	4c15      	ldr	r4, [pc, #84]	; (9d64 <nrf_cc3xx_platform_set_mutexes+0x5c>)
    9d10:	4d15      	ldr	r5, [pc, #84]	; (9d68 <nrf_cc3xx_platform_set_mutexes+0x60>)
    9d12:	6063      	str	r3, [r4, #4]
    9d14:	e9d0 3002 	ldrd	r3, r0, [r0, #8]
    9d18:	e9c4 3002 	strd	r3, r0, [r4, #8]
    9d1c:	6022      	str	r2, [r4, #0]
    9d1e:	4b13      	ldr	r3, [pc, #76]	; (9d6c <nrf_cc3xx_platform_set_mutexes+0x64>)
    9d20:	6808      	ldr	r0, [r1, #0]
    9d22:	6018      	str	r0, [r3, #0]
    9d24:	6848      	ldr	r0, [r1, #4]
    9d26:	6058      	str	r0, [r3, #4]
    9d28:	6888      	ldr	r0, [r1, #8]
    9d2a:	6098      	str	r0, [r3, #8]
    9d2c:	e9d1 0103 	ldrd	r0, r1, [r1, #12]
    9d30:	60d8      	str	r0, [r3, #12]
    9d32:	6119      	str	r1, [r3, #16]
    9d34:	f8d5 3118 	ldr.w	r3, [r5, #280]	; 0x118
    9d38:	f013 5f68 	tst.w	r3, #973078528	; 0x3a000000
    9d3c:	d010      	beq.n	9d60 <nrf_cc3xx_platform_set_mutexes+0x58>
    9d3e:	490c      	ldr	r1, [pc, #48]	; (9d70 <nrf_cc3xx_platform_set_mutexes+0x68>)
    9d40:	f8c5 11bc 	str.w	r1, [r5, #444]	; 0x1bc
    9d44:	2300      	movs	r3, #0
    9d46:	e9c5 3145 	strd	r3, r1, [r5, #276]	; 0x114
    9d4a:	f505 708a 	add.w	r0, r5, #276	; 0x114
    9d4e:	f8c5 31b8 	str.w	r3, [r5, #440]	; 0x1b8
    9d52:	4790      	blx	r2
    9d54:	6823      	ldr	r3, [r4, #0]
    9d56:	f505 70dc 	add.w	r0, r5, #440	; 0x1b8
    9d5a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    9d5e:	4718      	bx	r3
    9d60:	bd70      	pop	{r4, r5, r6, pc}
    9d62:	bf00      	nop
    9d64:	20000284 	.word	0x20000284
    9d68:	200016b0 	.word	0x200016b0
    9d6c:	20000294 	.word	0x20000294
    9d70:	a95c5f2c 	.word	0xa95c5f2c

00009d74 <CC_LibInitNoRng>:
    9d74:	b538      	push	{r3, r4, r5, lr}
    9d76:	f000 f82f 	bl	9dd8 <CC_HalInit>
    9d7a:	b120      	cbz	r0, 9d86 <CC_LibInitNoRng+0x12>
    9d7c:	2403      	movs	r4, #3
    9d7e:	f000 f863 	bl	9e48 <CC_PalTerminate>
    9d82:	4620      	mov	r0, r4
    9d84:	bd38      	pop	{r3, r4, r5, pc}
    9d86:	f000 f831 	bl	9dec <CC_PalInit>
    9d8a:	b998      	cbnz	r0, 9db4 <CC_LibInitNoRng+0x40>
    9d8c:	f000 f8ac 	bl	9ee8 <CC_PalPowerSaveModeSelect>
    9d90:	b998      	cbnz	r0, 9dba <CC_LibInitNoRng+0x46>
    9d92:	4d0f      	ldr	r5, [pc, #60]	; (9dd0 <CC_LibInitNoRng+0x5c>)
    9d94:	f8d5 3928 	ldr.w	r3, [r5, #2344]	; 0x928
    9d98:	0e1b      	lsrs	r3, r3, #24
    9d9a:	2bf0      	cmp	r3, #240	; 0xf0
    9d9c:	d108      	bne.n	9db0 <CC_LibInitNoRng+0x3c>
    9d9e:	f8d5 2a24 	ldr.w	r2, [r5, #2596]	; 0xa24
    9da2:	4b0c      	ldr	r3, [pc, #48]	; (9dd4 <CC_LibInitNoRng+0x60>)
    9da4:	429a      	cmp	r2, r3
    9da6:	d00a      	beq.n	9dbe <CC_LibInitNoRng+0x4a>
    9da8:	2407      	movs	r4, #7
    9daa:	f000 f817 	bl	9ddc <CC_HalTerminate>
    9dae:	e7e6      	b.n	9d7e <CC_LibInitNoRng+0xa>
    9db0:	2406      	movs	r4, #6
    9db2:	e7fa      	b.n	9daa <CC_LibInitNoRng+0x36>
    9db4:	2404      	movs	r4, #4
    9db6:	4620      	mov	r0, r4
    9db8:	bd38      	pop	{r3, r4, r5, pc}
    9dba:	2400      	movs	r4, #0
    9dbc:	e7f5      	b.n	9daa <CC_LibInitNoRng+0x36>
    9dbe:	2001      	movs	r0, #1
    9dc0:	f000 f892 	bl	9ee8 <CC_PalPowerSaveModeSelect>
    9dc4:	4604      	mov	r4, r0
    9dc6:	2800      	cmp	r0, #0
    9dc8:	d1f7      	bne.n	9dba <CC_LibInitNoRng+0x46>
    9dca:	f8c5 0a0c 	str.w	r0, [r5, #2572]	; 0xa0c
    9dce:	e7d8      	b.n	9d82 <CC_LibInitNoRng+0xe>
    9dd0:	5002b000 	.word	0x5002b000
    9dd4:	20e00000 	.word	0x20e00000

00009dd8 <CC_HalInit>:
    9dd8:	2000      	movs	r0, #0
    9dda:	4770      	bx	lr

00009ddc <CC_HalTerminate>:
    9ddc:	2000      	movs	r0, #0
    9dde:	4770      	bx	lr

00009de0 <CC_HalMaskInterrupt>:
    9de0:	4b01      	ldr	r3, [pc, #4]	; (9de8 <CC_HalMaskInterrupt+0x8>)
    9de2:	f8c3 0a04 	str.w	r0, [r3, #2564]	; 0xa04
    9de6:	4770      	bx	lr
    9de8:	5002b000 	.word	0x5002b000

00009dec <CC_PalInit>:
    9dec:	b510      	push	{r4, lr}
    9dee:	4811      	ldr	r0, [pc, #68]	; (9e34 <CC_PalInit+0x48>)
    9df0:	f000 f848 	bl	9e84 <CC_PalMutexCreate>
    9df4:	b100      	cbz	r0, 9df8 <CC_PalInit+0xc>
    9df6:	bd10      	pop	{r4, pc}
    9df8:	480f      	ldr	r0, [pc, #60]	; (9e38 <CC_PalInit+0x4c>)
    9dfa:	f000 f843 	bl	9e84 <CC_PalMutexCreate>
    9dfe:	2800      	cmp	r0, #0
    9e00:	d1f9      	bne.n	9df6 <CC_PalInit+0xa>
    9e02:	4c0e      	ldr	r4, [pc, #56]	; (9e3c <CC_PalInit+0x50>)
    9e04:	4620      	mov	r0, r4
    9e06:	f000 f83d 	bl	9e84 <CC_PalMutexCreate>
    9e0a:	2800      	cmp	r0, #0
    9e0c:	d1f3      	bne.n	9df6 <CC_PalInit+0xa>
    9e0e:	4b0c      	ldr	r3, [pc, #48]	; (9e40 <CC_PalInit+0x54>)
    9e10:	480c      	ldr	r0, [pc, #48]	; (9e44 <CC_PalInit+0x58>)
    9e12:	601c      	str	r4, [r3, #0]
    9e14:	f000 f836 	bl	9e84 <CC_PalMutexCreate>
    9e18:	4601      	mov	r1, r0
    9e1a:	2800      	cmp	r0, #0
    9e1c:	d1eb      	bne.n	9df6 <CC_PalInit+0xa>
    9e1e:	f000 f82d 	bl	9e7c <CC_PalDmaInit>
    9e22:	4604      	mov	r4, r0
    9e24:	b108      	cbz	r0, 9e2a <CC_PalInit+0x3e>
    9e26:	4620      	mov	r0, r4
    9e28:	bd10      	pop	{r4, pc}
    9e2a:	f000 f83f 	bl	9eac <CC_PalPowerSaveModeInit>
    9e2e:	4620      	mov	r0, r4
    9e30:	e7fa      	b.n	9e28 <CC_PalInit+0x3c>
    9e32:	bf00      	nop
    9e34:	200002cc 	.word	0x200002cc
    9e38:	200002c0 	.word	0x200002c0
    9e3c:	200002c8 	.word	0x200002c8
    9e40:	200002d0 	.word	0x200002d0
    9e44:	200002c4 	.word	0x200002c4

00009e48 <CC_PalTerminate>:
    9e48:	b508      	push	{r3, lr}
    9e4a:	4808      	ldr	r0, [pc, #32]	; (9e6c <CC_PalTerminate+0x24>)
    9e4c:	f000 f824 	bl	9e98 <CC_PalMutexDestroy>
    9e50:	4807      	ldr	r0, [pc, #28]	; (9e70 <CC_PalTerminate+0x28>)
    9e52:	f000 f821 	bl	9e98 <CC_PalMutexDestroy>
    9e56:	4807      	ldr	r0, [pc, #28]	; (9e74 <CC_PalTerminate+0x2c>)
    9e58:	f000 f81e 	bl	9e98 <CC_PalMutexDestroy>
    9e5c:	4806      	ldr	r0, [pc, #24]	; (9e78 <CC_PalTerminate+0x30>)
    9e5e:	f000 f81b 	bl	9e98 <CC_PalMutexDestroy>
    9e62:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    9e66:	f000 b80b 	b.w	9e80 <CC_PalDmaTerminate>
    9e6a:	bf00      	nop
    9e6c:	200002cc 	.word	0x200002cc
    9e70:	200002c0 	.word	0x200002c0
    9e74:	200002c8 	.word	0x200002c8
    9e78:	200002c4 	.word	0x200002c4

00009e7c <CC_PalDmaInit>:
    9e7c:	2000      	movs	r0, #0
    9e7e:	4770      	bx	lr

00009e80 <CC_PalDmaTerminate>:
    9e80:	4770      	bx	lr
    9e82:	bf00      	nop

00009e84 <CC_PalMutexCreate>:
    9e84:	b508      	push	{r3, lr}
    9e86:	4b03      	ldr	r3, [pc, #12]	; (9e94 <CC_PalMutexCreate+0x10>)
    9e88:	6802      	ldr	r2, [r0, #0]
    9e8a:	681b      	ldr	r3, [r3, #0]
    9e8c:	6810      	ldr	r0, [r2, #0]
    9e8e:	4798      	blx	r3
    9e90:	2000      	movs	r0, #0
    9e92:	bd08      	pop	{r3, pc}
    9e94:	20000284 	.word	0x20000284

00009e98 <CC_PalMutexDestroy>:
    9e98:	b508      	push	{r3, lr}
    9e9a:	4b03      	ldr	r3, [pc, #12]	; (9ea8 <CC_PalMutexDestroy+0x10>)
    9e9c:	6802      	ldr	r2, [r0, #0]
    9e9e:	685b      	ldr	r3, [r3, #4]
    9ea0:	6810      	ldr	r0, [r2, #0]
    9ea2:	4798      	blx	r3
    9ea4:	2000      	movs	r0, #0
    9ea6:	bd08      	pop	{r3, pc}
    9ea8:	20000284 	.word	0x20000284

00009eac <CC_PalPowerSaveModeInit>:
    9eac:	b570      	push	{r4, r5, r6, lr}
    9eae:	4c09      	ldr	r4, [pc, #36]	; (9ed4 <CC_PalPowerSaveModeInit+0x28>)
    9eb0:	4d09      	ldr	r5, [pc, #36]	; (9ed8 <CC_PalPowerSaveModeInit+0x2c>)
    9eb2:	6920      	ldr	r0, [r4, #16]
    9eb4:	68ab      	ldr	r3, [r5, #8]
    9eb6:	4798      	blx	r3
    9eb8:	b118      	cbz	r0, 9ec2 <CC_PalPowerSaveModeInit+0x16>
    9eba:	4b08      	ldr	r3, [pc, #32]	; (9edc <CC_PalPowerSaveModeInit+0x30>)
    9ebc:	4808      	ldr	r0, [pc, #32]	; (9ee0 <CC_PalPowerSaveModeInit+0x34>)
    9ebe:	685b      	ldr	r3, [r3, #4]
    9ec0:	4798      	blx	r3
    9ec2:	4a08      	ldr	r2, [pc, #32]	; (9ee4 <CC_PalPowerSaveModeInit+0x38>)
    9ec4:	68eb      	ldr	r3, [r5, #12]
    9ec6:	6920      	ldr	r0, [r4, #16]
    9ec8:	2100      	movs	r1, #0
    9eca:	6011      	str	r1, [r2, #0]
    9ecc:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    9ed0:	4718      	bx	r3
    9ed2:	bf00      	nop
    9ed4:	20000294 	.word	0x20000294
    9ed8:	20000284 	.word	0x20000284
    9edc:	20000274 	.word	0x20000274
    9ee0:	0000d56c 	.word	0x0000d56c
    9ee4:	200016ac 	.word	0x200016ac

00009ee8 <CC_PalPowerSaveModeSelect>:
    9ee8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    9eea:	4d1a      	ldr	r5, [pc, #104]	; (9f54 <CC_PalPowerSaveModeSelect+0x6c>)
    9eec:	4e1a      	ldr	r6, [pc, #104]	; (9f58 <CC_PalPowerSaveModeSelect+0x70>)
    9eee:	4604      	mov	r4, r0
    9ef0:	68b2      	ldr	r2, [r6, #8]
    9ef2:	6928      	ldr	r0, [r5, #16]
    9ef4:	4790      	blx	r2
    9ef6:	b9e8      	cbnz	r0, 9f34 <CC_PalPowerSaveModeSelect+0x4c>
    9ef8:	4f18      	ldr	r7, [pc, #96]	; (9f5c <CC_PalPowerSaveModeSelect+0x74>)
    9efa:	683b      	ldr	r3, [r7, #0]
    9efc:	b14c      	cbz	r4, 9f12 <CC_PalPowerSaveModeSelect+0x2a>
    9efe:	b1a3      	cbz	r3, 9f2a <CC_PalPowerSaveModeSelect+0x42>
    9f00:	2b01      	cmp	r3, #1
    9f02:	d019      	beq.n	9f38 <CC_PalPowerSaveModeSelect+0x50>
    9f04:	3b01      	subs	r3, #1
    9f06:	603b      	str	r3, [r7, #0]
    9f08:	6928      	ldr	r0, [r5, #16]
    9f0a:	68f3      	ldr	r3, [r6, #12]
    9f0c:	4798      	blx	r3
    9f0e:	2000      	movs	r0, #0
    9f10:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    9f12:	b943      	cbnz	r3, 9f26 <CC_PalPowerSaveModeSelect+0x3e>
    9f14:	4a12      	ldr	r2, [pc, #72]	; (9f60 <CC_PalPowerSaveModeSelect+0x78>)
    9f16:	2101      	movs	r1, #1
    9f18:	f8c2 1500 	str.w	r1, [r2, #1280]	; 0x500
    9f1c:	4911      	ldr	r1, [pc, #68]	; (9f64 <CC_PalPowerSaveModeSelect+0x7c>)
    9f1e:	f8d1 2910 	ldr.w	r2, [r1, #2320]	; 0x910
    9f22:	2a00      	cmp	r2, #0
    9f24:	d1fb      	bne.n	9f1e <CC_PalPowerSaveModeSelect+0x36>
    9f26:	3301      	adds	r3, #1
    9f28:	603b      	str	r3, [r7, #0]
    9f2a:	68f3      	ldr	r3, [r6, #12]
    9f2c:	6928      	ldr	r0, [r5, #16]
    9f2e:	4798      	blx	r3
    9f30:	2000      	movs	r0, #0
    9f32:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    9f34:	480c      	ldr	r0, [pc, #48]	; (9f68 <CC_PalPowerSaveModeSelect+0x80>)
    9f36:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    9f38:	4a0a      	ldr	r2, [pc, #40]	; (9f64 <CC_PalPowerSaveModeSelect+0x7c>)
    9f3a:	f8d2 3910 	ldr.w	r3, [r2, #2320]	; 0x910
    9f3e:	2b00      	cmp	r3, #0
    9f40:	d1fb      	bne.n	9f3a <CC_PalPowerSaveModeSelect+0x52>
    9f42:	4a07      	ldr	r2, [pc, #28]	; (9f60 <CC_PalPowerSaveModeSelect+0x78>)
    9f44:	f06f 407e 	mvn.w	r0, #4261412864	; 0xfe000000
    9f48:	f8c2 3500 	str.w	r3, [r2, #1280]	; 0x500
    9f4c:	f7ff ff48 	bl	9de0 <CC_HalMaskInterrupt>
    9f50:	683b      	ldr	r3, [r7, #0]
    9f52:	e7d7      	b.n	9f04 <CC_PalPowerSaveModeSelect+0x1c>
    9f54:	20000294 	.word	0x20000294
    9f58:	20000284 	.word	0x20000284
    9f5c:	200016ac 	.word	0x200016ac
    9f60:	5002a000 	.word	0x5002a000
    9f64:	5002b000 	.word	0x5002b000
    9f68:	ffff8fe9 	.word	0xffff8fe9

00009f6c <fixed_patch_point_hanlder>:
    9f6c:	b501      	push	{r0, lr}
    9f6e:	f3ef 8014 	mrs	r0, CONTROL
    9f72:	f010 0f02 	tst.w	r0, #2
    9f76:	bf0c      	ite	eq
    9f78:	f3ef 8008 	mrseq	r0, MSP
    9f7c:	f3ef 8009 	mrsne	r0, PSP
    9f80:	bd01      	pop	{r0, pc}
    9f82:	bf00      	nop
    9f84:	4618      	mov	r0, r3

00009f86 <arch_printk_char_out>:
    9f86:	2000      	movs	r0, #0
    9f88:	4770      	bx	lr

00009f8a <printk>:
    9f8a:	b40f      	push	{r0, r1, r2, r3}
    9f8c:	b507      	push	{r0, r1, r2, lr}
    9f8e:	a904      	add	r1, sp, #16
    9f90:	f851 0b04 	ldr.w	r0, [r1], #4
    9f94:	9101      	str	r1, [sp, #4]
    9f96:	f7f8 f80b 	bl	1fb0 <vprintk>
    9f9a:	b003      	add	sp, #12
    9f9c:	f85d eb04 	ldr.w	lr, [sp], #4
    9fa0:	b004      	add	sp, #16
    9fa2:	4770      	bx	lr

00009fa4 <z_thread_entry>:
    9fa4:	4604      	mov	r4, r0
    9fa6:	b508      	push	{r3, lr}
    9fa8:	4608      	mov	r0, r1
    9faa:	4611      	mov	r1, r2
    9fac:	461a      	mov	r2, r3
    9fae:	47a0      	blx	r4
    9fb0:	f7fe fa46 	bl	8440 <z_impl_z_current_get>
    9fb4:	f7fb fc6c 	bl	5890 <z_impl_k_thread_abort>

00009fb8 <chunk_size>:
    9fb8:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
    9fbc:	8840      	ldrh	r0, [r0, #2]
    9fbe:	0840      	lsrs	r0, r0, #1
    9fc0:	4770      	bx	lr

00009fc2 <free_list_add>:
    9fc2:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    9fc4:	4603      	mov	r3, r0
    9fc6:	f7ff fff7 	bl	9fb8 <chunk_size>
    9fca:	fab0 f080 	clz	r0, r0
    9fce:	f1c0 001f 	rsb	r0, r0, #31
    9fd2:	eb03 0c80 	add.w	ip, r3, r0, lsl #2
    9fd6:	00ca      	lsls	r2, r1, #3
    9fd8:	f8dc 6010 	ldr.w	r6, [ip, #16]
    9fdc:	1d17      	adds	r7, r2, #4
    9fde:	460c      	mov	r4, r1
    9fe0:	3206      	adds	r2, #6
    9fe2:	b28d      	uxth	r5, r1
    9fe4:	b956      	cbnz	r6, 9ffc <free_list_add+0x3a>
    9fe6:	2101      	movs	r1, #1
    9fe8:	fa01 f000 	lsl.w	r0, r1, r0
    9fec:	68d9      	ldr	r1, [r3, #12]
    9fee:	4301      	orrs	r1, r0
    9ff0:	60d9      	str	r1, [r3, #12]
    9ff2:	f8cc 4010 	str.w	r4, [ip, #16]
    9ff6:	53dd      	strh	r5, [r3, r7]
    9ff8:	529d      	strh	r5, [r3, r2]
    9ffa:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    9ffc:	00f1      	lsls	r1, r6, #3
    9ffe:	3104      	adds	r1, #4
    a000:	5a58      	ldrh	r0, [r3, r1]
    a002:	53d8      	strh	r0, [r3, r7]
    a004:	eb03 00c0 	add.w	r0, r3, r0, lsl #3
    a008:	529e      	strh	r6, [r3, r2]
    a00a:	80c5      	strh	r5, [r0, #6]
    a00c:	525d      	strh	r5, [r3, r1]
    a00e:	e7f4      	b.n	9ffa <free_list_add+0x38>

0000a010 <sys_heap_init>:
    a010:	3a04      	subs	r2, #4
    a012:	b4f0      	push	{r4, r5, r6, r7}
    a014:	4604      	mov	r4, r0
    a016:	1dc8      	adds	r0, r1, #7
    a018:	4411      	add	r1, r2
    a01a:	f020 0007 	bic.w	r0, r0, #7
    a01e:	f021 0107 	bic.w	r1, r1, #7
    a022:	1a0e      	subs	r6, r1, r0
    a024:	08f3      	lsrs	r3, r6, #3
    a026:	6020      	str	r0, [r4, #0]
    a028:	fab3 f283 	clz	r2, r3
    a02c:	4604      	mov	r4, r0
    a02e:	f1c2 0524 	rsb	r5, r2, #36	; 0x24
    a032:	2700      	movs	r7, #0
    a034:	6083      	str	r3, [r0, #8]
    a036:	00ad      	lsls	r5, r5, #2
    a038:	f844 7f0c 	str.w	r7, [r4, #12]!
    a03c:	3507      	adds	r5, #7
    a03e:	f1c2 0220 	rsb	r2, r2, #32
    a042:	08e9      	lsrs	r1, r5, #3
    a044:	eb04 0282 	add.w	r2, r4, r2, lsl #2
    a048:	f844 7f04 	str.w	r7, [r4, #4]!
    a04c:	4294      	cmp	r4, r2
    a04e:	d1fb      	bne.n	a048 <sys_heap_init+0x38>
    a050:	004a      	lsls	r2, r1, #1
    a052:	f042 0201 	orr.w	r2, r2, #1
    a056:	8042      	strh	r2, [r0, #2]
    a058:	eb00 04c1 	add.w	r4, r0, r1, lsl #3
    a05c:	1a5a      	subs	r2, r3, r1
    a05e:	0055      	lsls	r5, r2, #1
    a060:	8007      	strh	r7, [r0, #0]
    a062:	8065      	strh	r5, [r4, #2]
    a064:	1984      	adds	r4, r0, r6
    a066:	f820 1031 	strh.w	r1, [r0, r1, lsl #3]
    a06a:	eb00 03c3 	add.w	r3, r0, r3, lsl #3
    a06e:	8067      	strh	r7, [r4, #2]
    a070:	5382      	strh	r2, [r0, r6]
    a072:	885a      	ldrh	r2, [r3, #2]
    a074:	f042 0201 	orr.w	r2, r2, #1
    a078:	805a      	strh	r2, [r3, #2]
    a07a:	bcf0      	pop	{r4, r5, r6, r7}
    a07c:	f7ff bfa1 	b.w	9fc2 <free_list_add>

0000a080 <process_recheck>:
    a080:	8b03      	ldrh	r3, [r0, #24]
    a082:	f013 0307 	ands.w	r3, r3, #7
    a086:	d105      	bne.n	a094 <process_recheck+0x14>
    a088:	6803      	ldr	r3, [r0, #0]
    a08a:	2b00      	cmp	r3, #0
    a08c:	bf0c      	ite	eq
    a08e:	2000      	moveq	r0, #0
    a090:	2003      	movne	r0, #3
    a092:	4770      	bx	lr
    a094:	2b02      	cmp	r3, #2
    a096:	d105      	bne.n	a0a4 <process_recheck+0x24>
    a098:	8b40      	ldrh	r0, [r0, #26]
    a09a:	fab0 f080 	clz	r0, r0
    a09e:	0940      	lsrs	r0, r0, #5
    a0a0:	0080      	lsls	r0, r0, #2
    a0a2:	4770      	bx	lr
    a0a4:	2b01      	cmp	r3, #1
    a0a6:	d105      	bne.n	a0b4 <process_recheck+0x34>
    a0a8:	6803      	ldr	r3, [r0, #0]
    a0aa:	2b00      	cmp	r3, #0
    a0ac:	bf0c      	ite	eq
    a0ae:	2000      	moveq	r0, #0
    a0b0:	2005      	movne	r0, #5
    a0b2:	4770      	bx	lr
    a0b4:	2000      	movs	r0, #0
    a0b6:	4770      	bx	lr

0000a0b8 <validate_args>:
    a0b8:	b510      	push	{r4, lr}
    a0ba:	460c      	mov	r4, r1
    a0bc:	b100      	cbz	r0, a0c0 <validate_args+0x8>
    a0be:	b911      	cbnz	r1, a0c6 <validate_args+0xe>
    a0c0:	f06f 0015 	mvn.w	r0, #21
    a0c4:	bd10      	pop	{r4, pc}
    a0c6:	1d08      	adds	r0, r1, #4
    a0c8:	f000 f895 	bl	a1f6 <sys_notify_validate>
    a0cc:	2800      	cmp	r0, #0
    a0ce:	d1f9      	bne.n	a0c4 <validate_args+0xc>
    a0d0:	68a3      	ldr	r3, [r4, #8]
    a0d2:	2b03      	cmp	r3, #3
    a0d4:	d9f6      	bls.n	a0c4 <validate_args+0xc>
    a0d6:	e7f3      	b.n	a0c0 <validate_args+0x8>

0000a0d8 <notify_one>:
    a0d8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    a0dc:	460d      	mov	r5, r1
    a0de:	4607      	mov	r7, r0
    a0e0:	4619      	mov	r1, r3
    a0e2:	1d28      	adds	r0, r5, #4
    a0e4:	4690      	mov	r8, r2
    a0e6:	461e      	mov	r6, r3
    a0e8:	f000 f899 	bl	a21e <sys_notify_finalize>
    a0ec:	4604      	mov	r4, r0
    a0ee:	b138      	cbz	r0, a100 <notify_one+0x28>
    a0f0:	4633      	mov	r3, r6
    a0f2:	4642      	mov	r2, r8
    a0f4:	4629      	mov	r1, r5
    a0f6:	4638      	mov	r0, r7
    a0f8:	46a4      	mov	ip, r4
    a0fa:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    a0fe:	4760      	bx	ip
    a100:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0000a104 <transition_complete>:
    a104:	b410      	push	{r4}
    a106:	f04f 0420 	mov.w	r4, #32
    a10a:	f3ef 8211 	mrs	r2, BASEPRI
    a10e:	f384 8812 	msr	BASEPRI_MAX, r4
    a112:	f3bf 8f6f 	isb	sy
    a116:	6141      	str	r1, [r0, #20]
    a118:	bc10      	pop	{r4}
    a11a:	2101      	movs	r1, #1
    a11c:	f7f7 bf56 	b.w	1fcc <process_event>

0000a120 <onoff_manager_init>:
    a120:	b538      	push	{r3, r4, r5, lr}
    a122:	460c      	mov	r4, r1
    a124:	4605      	mov	r5, r0
    a126:	b158      	cbz	r0, a140 <onoff_manager_init+0x20>
    a128:	b151      	cbz	r1, a140 <onoff_manager_init+0x20>
    a12a:	680b      	ldr	r3, [r1, #0]
    a12c:	b143      	cbz	r3, a140 <onoff_manager_init+0x20>
    a12e:	684b      	ldr	r3, [r1, #4]
    a130:	b133      	cbz	r3, a140 <onoff_manager_init+0x20>
    a132:	221c      	movs	r2, #28
    a134:	2100      	movs	r1, #0
    a136:	f002 f819 	bl	c16c <memset>
    a13a:	612c      	str	r4, [r5, #16]
    a13c:	2000      	movs	r0, #0
    a13e:	bd38      	pop	{r3, r4, r5, pc}
    a140:	f06f 0015 	mvn.w	r0, #21
    a144:	e7fb      	b.n	a13e <onoff_manager_init+0x1e>

0000a146 <onoff_request>:
    a146:	b570      	push	{r4, r5, r6, lr}
    a148:	4605      	mov	r5, r0
    a14a:	460e      	mov	r6, r1
    a14c:	f7ff ffb4 	bl	a0b8 <validate_args>
    a150:	1e04      	subs	r4, r0, #0
    a152:	db15      	blt.n	a180 <onoff_request+0x3a>
    a154:	f04f 0320 	mov.w	r3, #32
    a158:	f3ef 8211 	mrs	r2, BASEPRI
    a15c:	f383 8812 	msr	BASEPRI_MAX, r3
    a160:	f3bf 8f6f 	isb	sy
    a164:	8b6b      	ldrh	r3, [r5, #26]
    a166:	8b2c      	ldrh	r4, [r5, #24]
    a168:	f64f 71ff 	movw	r1, #65535	; 0xffff
    a16c:	428b      	cmp	r3, r1
    a16e:	f004 0407 	and.w	r4, r4, #7
    a172:	d107      	bne.n	a184 <onoff_request+0x3e>
    a174:	f382 8811 	msr	BASEPRI, r2
    a178:	f3bf 8f6f 	isb	sy
    a17c:	f06f 040a 	mvn.w	r4, #10
    a180:	4620      	mov	r0, r4
    a182:	bd70      	pop	{r4, r5, r6, pc}
    a184:	2c02      	cmp	r4, #2
    a186:	d10c      	bne.n	a1a2 <onoff_request+0x5c>
    a188:	3301      	adds	r3, #1
    a18a:	836b      	strh	r3, [r5, #26]
    a18c:	f382 8811 	msr	BASEPRI, r2
    a190:	f3bf 8f6f 	isb	sy
    a194:	2300      	movs	r3, #0
    a196:	4622      	mov	r2, r4
    a198:	4631      	mov	r1, r6
    a19a:	4628      	mov	r0, r5
    a19c:	f7ff ff9c 	bl	a0d8 <notify_one>
    a1a0:	e7ee      	b.n	a180 <onoff_request+0x3a>
    a1a2:	2c06      	cmp	r4, #6
    a1a4:	d814      	bhi.n	a1d0 <onoff_request+0x8a>
    a1a6:	e8df f004 	tbb	[pc, r4]
    a1aa:	1304      	.short	0x1304
    a1ac:	1a041313 	.word	0x1a041313
    a1b0:	04          	.byte	0x04
    a1b1:	00          	.byte	0x00
    a1b2:	2300      	movs	r3, #0
    a1b4:	6033      	str	r3, [r6, #0]
    a1b6:	686b      	ldr	r3, [r5, #4]
    a1b8:	b93b      	cbnz	r3, a1ca <onoff_request+0x84>
    a1ba:	e9c5 6600 	strd	r6, r6, [r5]
    a1be:	b9ac      	cbnz	r4, a1ec <onoff_request+0xa6>
    a1c0:	2102      	movs	r1, #2
    a1c2:	4628      	mov	r0, r5
    a1c4:	f7f7 ff02 	bl	1fcc <process_event>
    a1c8:	e7da      	b.n	a180 <onoff_request+0x3a>
    a1ca:	601e      	str	r6, [r3, #0]
    a1cc:	606e      	str	r6, [r5, #4]
    a1ce:	e7f6      	b.n	a1be <onoff_request+0x78>
    a1d0:	f382 8811 	msr	BASEPRI, r2
    a1d4:	f3bf 8f6f 	isb	sy
    a1d8:	f06f 0404 	mvn.w	r4, #4
    a1dc:	e7d0      	b.n	a180 <onoff_request+0x3a>
    a1de:	f382 8811 	msr	BASEPRI, r2
    a1e2:	f3bf 8f6f 	isb	sy
    a1e6:	f06f 0485 	mvn.w	r4, #133	; 0x85
    a1ea:	e7c9      	b.n	a180 <onoff_request+0x3a>
    a1ec:	f382 8811 	msr	BASEPRI, r2
    a1f0:	f3bf 8f6f 	isb	sy
    a1f4:	e7c4      	b.n	a180 <onoff_request+0x3a>

0000a1f6 <sys_notify_validate>:
    a1f6:	4603      	mov	r3, r0
    a1f8:	b140      	cbz	r0, a20c <sys_notify_validate+0x16>
    a1fa:	6842      	ldr	r2, [r0, #4]
    a1fc:	f002 0203 	and.w	r2, r2, #3
    a200:	2a02      	cmp	r2, #2
    a202:	d006      	beq.n	a212 <sys_notify_validate+0x1c>
    a204:	2a03      	cmp	r2, #3
    a206:	d004      	beq.n	a212 <sys_notify_validate+0x1c>
    a208:	2a01      	cmp	r2, #1
    a20a:	d005      	beq.n	a218 <sys_notify_validate+0x22>
    a20c:	f06f 0015 	mvn.w	r0, #21
    a210:	4770      	bx	lr
    a212:	681a      	ldr	r2, [r3, #0]
    a214:	2a00      	cmp	r2, #0
    a216:	d0f9      	beq.n	a20c <sys_notify_validate+0x16>
    a218:	2000      	movs	r0, #0
    a21a:	6098      	str	r0, [r3, #8]
    a21c:	4770      	bx	lr

0000a21e <sys_notify_finalize>:
    a21e:	b510      	push	{r4, lr}
    a220:	6842      	ldr	r2, [r0, #4]
    a222:	6081      	str	r1, [r0, #8]
    a224:	f002 0203 	and.w	r2, r2, #3
    a228:	2a02      	cmp	r2, #2
    a22a:	4603      	mov	r3, r0
    a22c:	f04f 0400 	mov.w	r4, #0
    a230:	d007      	beq.n	a242 <sys_notify_finalize+0x24>
    a232:	2a03      	cmp	r2, #3
    a234:	d002      	beq.n	a23c <sys_notify_finalize+0x1e>
    a236:	605c      	str	r4, [r3, #4]
    a238:	2000      	movs	r0, #0
    a23a:	e001      	b.n	a240 <sys_notify_finalize+0x22>
    a23c:	6818      	ldr	r0, [r3, #0]
    a23e:	605c      	str	r4, [r3, #4]
    a240:	bd10      	pop	{r4, pc}
    a242:	6818      	ldr	r0, [r3, #0]
    a244:	605c      	str	r4, [r3, #4]
    a246:	2800      	cmp	r0, #0
    a248:	d0f6      	beq.n	a238 <sys_notify_finalize+0x1a>
    a24a:	f7fe fb2b 	bl	88a4 <z_impl_k_poll_signal_raise>
    a24e:	e7f3      	b.n	a238 <sys_notify_finalize+0x1a>

0000a250 <outs>:
    a250:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    a254:	4607      	mov	r7, r0
    a256:	4688      	mov	r8, r1
    a258:	4615      	mov	r5, r2
    a25a:	461e      	mov	r6, r3
    a25c:	4614      	mov	r4, r2
    a25e:	42b4      	cmp	r4, r6
    a260:	d305      	bcc.n	a26e <outs+0x1e>
    a262:	b10e      	cbz	r6, a268 <outs+0x18>
    a264:	1b60      	subs	r0, r4, r5
    a266:	e008      	b.n	a27a <outs+0x2a>
    a268:	7823      	ldrb	r3, [r4, #0]
    a26a:	2b00      	cmp	r3, #0
    a26c:	d0fa      	beq.n	a264 <outs+0x14>
    a26e:	f814 0b01 	ldrb.w	r0, [r4], #1
    a272:	4641      	mov	r1, r8
    a274:	47b8      	blx	r7
    a276:	2800      	cmp	r0, #0
    a278:	daf1      	bge.n	a25e <outs+0xe>
    a27a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0000a27e <ring_buf_put_claim>:
    a27e:	b5f0      	push	{r4, r5, r6, r7, lr}
    a280:	68c6      	ldr	r6, [r0, #12]
    a282:	6845      	ldr	r5, [r0, #4]
    a284:	69c3      	ldr	r3, [r0, #28]
    a286:	1baf      	subs	r7, r5, r6
    a288:	4604      	mov	r4, r0
    a28a:	6940      	ldr	r0, [r0, #20]
    a28c:	42bb      	cmp	r3, r7
    a28e:	bf98      	it	ls
    a290:	1aff      	subls	r7, r7, r3
    a292:	eba5 0000 	sub.w	r0, r5, r0
    a296:	4694      	mov	ip, r2
    a298:	bf98      	it	ls
    a29a:	18f6      	addls	r6, r6, r3
    a29c:	1a1a      	subs	r2, r3, r0
    a29e:	1bd8      	subs	r0, r3, r7
    a2a0:	6823      	ldr	r3, [r4, #0]
    a2a2:	1bad      	subs	r5, r5, r6
    a2a4:	4562      	cmp	r2, ip
    a2a6:	442b      	add	r3, r5
    a2a8:	bf28      	it	cs
    a2aa:	4662      	movcs	r2, ip
    a2ac:	600b      	str	r3, [r1, #0]
    a2ae:	6863      	ldr	r3, [r4, #4]
    a2b0:	4290      	cmp	r0, r2
    a2b2:	bf28      	it	cs
    a2b4:	4610      	movcs	r0, r2
    a2b6:	4403      	add	r3, r0
    a2b8:	6063      	str	r3, [r4, #4]
    a2ba:	bdf0      	pop	{r4, r5, r6, r7, pc}

0000a2bc <ring_buf_put_finish>:
    a2bc:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
    a2c0:	1ad2      	subs	r2, r2, r3
    a2c2:	428a      	cmp	r2, r1
    a2c4:	d30c      	bcc.n	a2e0 <ring_buf_put_finish+0x24>
    a2c6:	4419      	add	r1, r3
    a2c8:	68c3      	ldr	r3, [r0, #12]
    a2ca:	69c2      	ldr	r2, [r0, #28]
    a2cc:	e9c0 1101 	strd	r1, r1, [r0, #4]
    a2d0:	1ac9      	subs	r1, r1, r3
    a2d2:	428a      	cmp	r2, r1
    a2d4:	d901      	bls.n	a2da <ring_buf_put_finish+0x1e>
    a2d6:	2000      	movs	r0, #0
    a2d8:	4770      	bx	lr
    a2da:	4413      	add	r3, r2
    a2dc:	60c3      	str	r3, [r0, #12]
    a2de:	e7fa      	b.n	a2d6 <ring_buf_put_finish+0x1a>
    a2e0:	f06f 0015 	mvn.w	r0, #21
    a2e4:	4770      	bx	lr

0000a2e6 <ring_buf_put>:
    a2e6:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
    a2ea:	4680      	mov	r8, r0
    a2ec:	460e      	mov	r6, r1
    a2ee:	4615      	mov	r5, r2
    a2f0:	2700      	movs	r7, #0
    a2f2:	462a      	mov	r2, r5
    a2f4:	a901      	add	r1, sp, #4
    a2f6:	4640      	mov	r0, r8
    a2f8:	f7ff ffc1 	bl	a27e <ring_buf_put_claim>
    a2fc:	4631      	mov	r1, r6
    a2fe:	4604      	mov	r4, r0
    a300:	4602      	mov	r2, r0
    a302:	9801      	ldr	r0, [sp, #4]
    a304:	f001 ff0a 	bl	c11c <memcpy>
    a308:	1b2d      	subs	r5, r5, r4
    a30a:	4427      	add	r7, r4
    a30c:	4426      	add	r6, r4
    a30e:	d001      	beq.n	a314 <ring_buf_put+0x2e>
    a310:	2c00      	cmp	r4, #0
    a312:	d1ee      	bne.n	a2f2 <ring_buf_put+0xc>
    a314:	4639      	mov	r1, r7
    a316:	4640      	mov	r0, r8
    a318:	f7ff ffd0 	bl	a2bc <ring_buf_put_finish>
    a31c:	4638      	mov	r0, r7
    a31e:	b002      	add	sp, #8
    a320:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0000a324 <ring_buf_get_claim>:
    a324:	b5f0      	push	{r4, r5, r6, r7, lr}
    a326:	4604      	mov	r4, r0
    a328:	6986      	ldr	r6, [r0, #24]
    a32a:	6905      	ldr	r5, [r0, #16]
    a32c:	69c0      	ldr	r0, [r0, #28]
    a32e:	68a3      	ldr	r3, [r4, #8]
    a330:	1baf      	subs	r7, r5, r6
    a332:	42b8      	cmp	r0, r7
    a334:	4694      	mov	ip, r2
    a336:	bf98      	it	ls
    a338:	1836      	addls	r6, r6, r0
    a33a:	eba3 0205 	sub.w	r2, r3, r5
    a33e:	6823      	ldr	r3, [r4, #0]
    a340:	eba5 0506 	sub.w	r5, r5, r6
    a344:	bf98      	it	ls
    a346:	1a3f      	subls	r7, r7, r0
    a348:	442b      	add	r3, r5
    a34a:	4562      	cmp	r2, ip
    a34c:	eba0 0007 	sub.w	r0, r0, r7
    a350:	bf28      	it	cs
    a352:	4662      	movcs	r2, ip
    a354:	600b      	str	r3, [r1, #0]
    a356:	6923      	ldr	r3, [r4, #16]
    a358:	4290      	cmp	r0, r2
    a35a:	bf28      	it	cs
    a35c:	4610      	movcs	r0, r2
    a35e:	4403      	add	r3, r0
    a360:	6123      	str	r3, [r4, #16]
    a362:	bdf0      	pop	{r4, r5, r6, r7, pc}

0000a364 <ring_buf_get_finish>:
    a364:	e9d0 2304 	ldrd	r2, r3, [r0, #16]
    a368:	1ad2      	subs	r2, r2, r3
    a36a:	428a      	cmp	r2, r1
    a36c:	d30c      	bcc.n	a388 <ring_buf_get_finish+0x24>
    a36e:	4419      	add	r1, r3
    a370:	e9d0 3206 	ldrd	r3, r2, [r0, #24]
    a374:	e9c0 1104 	strd	r1, r1, [r0, #16]
    a378:	1ac9      	subs	r1, r1, r3
    a37a:	428a      	cmp	r2, r1
    a37c:	d901      	bls.n	a382 <ring_buf_get_finish+0x1e>
    a37e:	2000      	movs	r0, #0
    a380:	4770      	bx	lr
    a382:	4413      	add	r3, r2
    a384:	6183      	str	r3, [r0, #24]
    a386:	e7fa      	b.n	a37e <ring_buf_get_finish+0x1a>
    a388:	f06f 0015 	mvn.w	r0, #21
    a38c:	4770      	bx	lr

0000a38e <ring_buf_get>:
    a38e:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
    a392:	4680      	mov	r8, r0
    a394:	460d      	mov	r5, r1
    a396:	4616      	mov	r6, r2
    a398:	2700      	movs	r7, #0
    a39a:	4632      	mov	r2, r6
    a39c:	a901      	add	r1, sp, #4
    a39e:	4640      	mov	r0, r8
    a3a0:	f7ff ffc0 	bl	a324 <ring_buf_get_claim>
    a3a4:	4604      	mov	r4, r0
    a3a6:	b12d      	cbz	r5, a3b4 <ring_buf_get+0x26>
    a3a8:	4602      	mov	r2, r0
    a3aa:	9901      	ldr	r1, [sp, #4]
    a3ac:	4628      	mov	r0, r5
    a3ae:	f001 feb5 	bl	c11c <memcpy>
    a3b2:	4425      	add	r5, r4
    a3b4:	1b36      	subs	r6, r6, r4
    a3b6:	4427      	add	r7, r4
    a3b8:	d001      	beq.n	a3be <ring_buf_get+0x30>
    a3ba:	2c00      	cmp	r4, #0
    a3bc:	d1ed      	bne.n	a39a <ring_buf_get+0xc>
    a3be:	4639      	mov	r1, r7
    a3c0:	4640      	mov	r0, r8
    a3c2:	f7ff ffcf 	bl	a364 <ring_buf_get_finish>
    a3c6:	4638      	mov	r0, r7
    a3c8:	b002      	add	sp, #8
    a3ca:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0000a3ce <fnmatchx>:
    a3ce:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a3d2:	b087      	sub	sp, #28
    a3d4:	4614      	mov	r4, r2
    a3d6:	9101      	str	r1, [sp, #4]
    a3d8:	9303      	str	r3, [sp, #12]
    a3da:	4605      	mov	r5, r0
    a3dc:	b918      	cbnz	r0, a3e6 <fnmatchx+0x18>
    a3de:	2001      	movs	r0, #1
    a3e0:	b007      	add	sp, #28
    a3e2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a3e6:	9b01      	ldr	r3, [sp, #4]
    a3e8:	2b00      	cmp	r3, #0
    a3ea:	d0f8      	beq.n	a3de <fnmatchx+0x10>
    a3ec:	9b03      	ldr	r3, [sp, #12]
    a3ee:	2b00      	cmp	r3, #0
    a3f0:	f000 810f 	beq.w	a612 <fnmatchx+0x244>
    a3f4:	9a01      	ldr	r2, [sp, #4]
    a3f6:	46a9      	mov	r9, r5
    a3f8:	4621      	mov	r1, r4
    a3fa:	f819 0b01 	ldrb.w	r0, [r9], #1
    a3fe:	f7f8 fb0d 	bl	2a1c <foldcase>
    a402:	4603      	mov	r3, r0
    a404:	b2c0      	uxtb	r0, r0
    a406:	283f      	cmp	r0, #63	; 0x3f
    a408:	7816      	ldrb	r6, [r2, #0]
    a40a:	4607      	mov	r7, r0
    a40c:	d025      	beq.n	a45a <fnmatchx+0x8c>
    a40e:	f013 0fc0 	tst.w	r3, #192	; 0xc0
    a412:	d10b      	bne.n	a42c <fnmatchx+0x5e>
    a414:	b1c8      	cbz	r0, a44a <fnmatchx+0x7c>
    a416:	282a      	cmp	r0, #42	; 0x2a
    a418:	d036      	beq.n	a488 <fnmatchx+0xba>
    a41a:	4621      	mov	r1, r4
    a41c:	4630      	mov	r0, r6
    a41e:	f7f8 fafd 	bl	2a1c <foldcase>
    a422:	4287      	cmp	r7, r0
    a424:	f102 0201 	add.w	r2, r2, #1
    a428:	d01e      	beq.n	a468 <fnmatchx+0x9a>
    a42a:	e7d8      	b.n	a3de <fnmatchx+0x10>
    a42c:	285b      	cmp	r0, #91	; 0x5b
    a42e:	d07d      	beq.n	a52c <fnmatchx+0x15e>
    a430:	285c      	cmp	r0, #92	; 0x5c
    a432:	d1f2      	bne.n	a41a <fnmatchx+0x4c>
    a434:	07e3      	lsls	r3, r4, #31
    a436:	d4f0      	bmi.n	a41a <fnmatchx+0x4c>
    a438:	7868      	ldrb	r0, [r5, #1]
    a43a:	f7f8 faef 	bl	2a1c <foldcase>
    a43e:	f010 07ff 	ands.w	r7, r0, #255	; 0xff
    a442:	bf18      	it	ne
    a444:	f105 0902 	addne.w	r9, r5, #2
    a448:	e7e7      	b.n	a41a <fnmatchx+0x4c>
    a44a:	06e7      	lsls	r7, r4, #27
    a44c:	d501      	bpl.n	a452 <fnmatchx+0x84>
    a44e:	2e2f      	cmp	r6, #47	; 0x2f
    a450:	d0c6      	beq.n	a3e0 <fnmatchx+0x12>
    a452:	1e30      	subs	r0, r6, #0
    a454:	bf18      	it	ne
    a456:	2001      	movne	r0, #1
    a458:	e7c2      	b.n	a3e0 <fnmatchx+0x12>
    a45a:	2e00      	cmp	r6, #0
    a45c:	d0bf      	beq.n	a3de <fnmatchx+0x10>
    a45e:	2e2f      	cmp	r6, #47	; 0x2f
    a460:	d104      	bne.n	a46c <fnmatchx+0x9e>
    a462:	07a5      	lsls	r5, r4, #30
    a464:	d4bb      	bmi.n	a3de <fnmatchx+0x10>
    a466:	3201      	adds	r2, #1
    a468:	464d      	mov	r5, r9
    a46a:	e7c4      	b.n	a3f6 <fnmatchx+0x28>
    a46c:	2e2e      	cmp	r6, #46	; 0x2e
    a46e:	d1fa      	bne.n	a466 <fnmatchx+0x98>
    a470:	0760      	lsls	r0, r4, #29
    a472:	d5f8      	bpl.n	a466 <fnmatchx+0x98>
    a474:	9b01      	ldr	r3, [sp, #4]
    a476:	429a      	cmp	r2, r3
    a478:	d0b1      	beq.n	a3de <fnmatchx+0x10>
    a47a:	07a1      	lsls	r1, r4, #30
    a47c:	d5f3      	bpl.n	a466 <fnmatchx+0x98>
    a47e:	f812 3c01 	ldrb.w	r3, [r2, #-1]
    a482:	2b2f      	cmp	r3, #47	; 0x2f
    a484:	d1ef      	bne.n	a466 <fnmatchx+0x98>
    a486:	e7aa      	b.n	a3de <fnmatchx+0x10>
    a488:	7868      	ldrb	r0, [r5, #1]
    a48a:	f7f8 fac7 	bl	2a1c <foldcase>
    a48e:	b2c1      	uxtb	r1, r0
    a490:	292a      	cmp	r1, #42	; 0x2a
    a492:	d019      	beq.n	a4c8 <fnmatchx+0xfa>
    a494:	2e2e      	cmp	r6, #46	; 0x2e
    a496:	d10a      	bne.n	a4ae <fnmatchx+0xe0>
    a498:	0763      	lsls	r3, r4, #29
    a49a:	d508      	bpl.n	a4ae <fnmatchx+0xe0>
    a49c:	9b01      	ldr	r3, [sp, #4]
    a49e:	429a      	cmp	r2, r3
    a4a0:	d09d      	beq.n	a3de <fnmatchx+0x10>
    a4a2:	07a7      	lsls	r7, r4, #30
    a4a4:	d503      	bpl.n	a4ae <fnmatchx+0xe0>
    a4a6:	f812 3c01 	ldrb.w	r3, [r2, #-1]
    a4aa:	2b2f      	cmp	r3, #47	; 0x2f
    a4ac:	d097      	beq.n	a3de <fnmatchx+0x10>
    a4ae:	b979      	cbnz	r1, a4d0 <fnmatchx+0x102>
    a4b0:	f014 0002 	ands.w	r0, r4, #2
    a4b4:	d094      	beq.n	a3e0 <fnmatchx+0x12>
    a4b6:	06e6      	lsls	r6, r4, #27
    a4b8:	f100 80ad 	bmi.w	a616 <fnmatchx+0x248>
    a4bc:	212f      	movs	r1, #47	; 0x2f
    a4be:	4610      	mov	r0, r2
    a4c0:	f001 fe8f 	bl	c1e2 <strchr>
    a4c4:	3800      	subs	r0, #0
    a4c6:	e7c5      	b.n	a454 <fnmatchx+0x86>
    a4c8:	f819 0f01 	ldrb.w	r0, [r9, #1]!
    a4cc:	4621      	mov	r1, r4
    a4ce:	e7dc      	b.n	a48a <fnmatchx+0xbc>
    a4d0:	292f      	cmp	r1, #47	; 0x2f
    a4d2:	d123      	bne.n	a51c <fnmatchx+0x14e>
    a4d4:	07a5      	lsls	r5, r4, #30
    a4d6:	d521      	bpl.n	a51c <fnmatchx+0x14e>
    a4d8:	4610      	mov	r0, r2
    a4da:	f001 fe82 	bl	c1e2 <strchr>
    a4de:	4602      	mov	r2, r0
    a4e0:	2800      	cmp	r0, #0
    a4e2:	d1c1      	bne.n	a468 <fnmatchx+0x9a>
    a4e4:	e77b      	b.n	a3de <fnmatchx+0x10>
    a4e6:	463b      	mov	r3, r7
    a4e8:	4642      	mov	r2, r8
    a4ea:	4659      	mov	r1, fp
    a4ec:	4648      	mov	r0, r9
    a4ee:	f7ff ff6e 	bl	a3ce <fnmatchx>
    a4f2:	2801      	cmp	r0, #1
    a4f4:	f47f af74 	bne.w	a3e0 <fnmatchx+0x12>
    a4f8:	2d2f      	cmp	r5, #47	; 0x2f
    a4fa:	d103      	bne.n	a504 <fnmatchx+0x136>
    a4fc:	f1ba 0f00 	cmp.w	sl, #0
    a500:	f47f af6d 	bne.w	a3de <fnmatchx+0x10>
    a504:	46b3      	mov	fp, r6
    a506:	4621      	mov	r1, r4
    a508:	f89b 0000 	ldrb.w	r0, [fp]
    a50c:	f7f8 fa86 	bl	2a1c <foldcase>
    a510:	f010 05ff 	ands.w	r5, r0, #255	; 0xff
    a514:	f106 0601 	add.w	r6, r6, #1
    a518:	d1e5      	bne.n	a4e6 <fnmatchx+0x118>
    a51a:	e760      	b.n	a3de <fnmatchx+0x10>
    a51c:	9b03      	ldr	r3, [sp, #12]
    a51e:	4616      	mov	r6, r2
    a520:	1e5f      	subs	r7, r3, #1
    a522:	f024 0804 	bic.w	r8, r4, #4
    a526:	f004 0a02 	and.w	sl, r4, #2
    a52a:	e7eb      	b.n	a504 <fnmatchx+0x136>
    a52c:	2e00      	cmp	r6, #0
    a52e:	f43f af56 	beq.w	a3de <fnmatchx+0x10>
    a532:	2e2f      	cmp	r6, #47	; 0x2f
    a534:	d102      	bne.n	a53c <fnmatchx+0x16e>
    a536:	07a0      	lsls	r0, r4, #30
    a538:	f53f af51 	bmi.w	a3de <fnmatchx+0x10>
    a53c:	4630      	mov	r0, r6
    a53e:	f7f8 fa6d 	bl	2a1c <foldcase>
    a542:	786b      	ldrb	r3, [r5, #1]
    a544:	2b21      	cmp	r3, #33	; 0x21
    a546:	4682      	mov	sl, r0
    a548:	d001      	beq.n	a54e <fnmatchx+0x180>
    a54a:	2b5e      	cmp	r3, #94	; 0x5e
    a54c:	d123      	bne.n	a596 <fnmatchx+0x1c8>
    a54e:	3502      	adds	r5, #2
    a550:	2301      	movs	r3, #1
    a552:	9302      	str	r3, [sp, #8]
    a554:	2301      	movs	r3, #1
    a556:	ea04 0103 	and.w	r1, r4, r3
    a55a:	f04f 0b00 	mov.w	fp, #0
    a55e:	9104      	str	r1, [sp, #16]
    a560:	462f      	mov	r7, r5
    a562:	4621      	mov	r1, r4
    a564:	f817 0b01 	ldrb.w	r0, [r7], #1
    a568:	9305      	str	r3, [sp, #20]
    a56a:	f7f8 fa57 	bl	2a1c <foldcase>
    a56e:	fa5f f880 	uxtb.w	r8, r0
    a572:	f1b8 0f5d 	cmp.w	r8, #93	; 0x5d
    a576:	9b05      	ldr	r3, [sp, #20]
    a578:	d110      	bne.n	a59c <fnmatchx+0x1ce>
    a57a:	bb0b      	cbnz	r3, a5c0 <fnmatchx+0x1f2>
    a57c:	9b02      	ldr	r3, [sp, #8]
    a57e:	455b      	cmp	r3, fp
    a580:	f43f af2d 	beq.w	a3de <fnmatchx+0x10>
    a584:	1c79      	adds	r1, r7, #1
    a586:	d103      	bne.n	a590 <fnmatchx+0x1c2>
    a588:	2e5b      	cmp	r6, #91	; 0x5b
    a58a:	f47f af28 	bne.w	a3de <fnmatchx+0x10>
    a58e:	464f      	mov	r7, r9
    a590:	3201      	adds	r2, #1
    a592:	46b9      	mov	r9, r7
    a594:	e768      	b.n	a468 <fnmatchx+0x9a>
    a596:	464d      	mov	r5, r9
    a598:	2300      	movs	r3, #0
    a59a:	e7da      	b.n	a552 <fnmatchx+0x184>
    a59c:	f1b8 0f2f 	cmp.w	r8, #47	; 0x2f
    a5a0:	d0f2      	beq.n	a588 <fnmatchx+0x1ba>
    a5a2:	f1b8 0f5c 	cmp.w	r8, #92	; 0x5c
    a5a6:	d107      	bne.n	a5b8 <fnmatchx+0x1ea>
    a5a8:	9b04      	ldr	r3, [sp, #16]
    a5aa:	b94b      	cbnz	r3, a5c0 <fnmatchx+0x1f2>
    a5ac:	7868      	ldrb	r0, [r5, #1]
    a5ae:	f7f8 fa35 	bl	2a1c <foldcase>
    a5b2:	1caf      	adds	r7, r5, #2
    a5b4:	fa5f f880 	uxtb.w	r8, r0
    a5b8:	f1b8 0f00 	cmp.w	r8, #0
    a5bc:	f43f af0f 	beq.w	a3de <fnmatchx+0x10>
    a5c0:	783b      	ldrb	r3, [r7, #0]
    a5c2:	2b2d      	cmp	r3, #45	; 0x2d
    a5c4:	d11f      	bne.n	a606 <fnmatchx+0x238>
    a5c6:	7878      	ldrb	r0, [r7, #1]
    a5c8:	4621      	mov	r1, r4
    a5ca:	f7f8 fa27 	bl	2a1c <foldcase>
    a5ce:	f010 00ff 	ands.w	r0, r0, #255	; 0xff
    a5d2:	d018      	beq.n	a606 <fnmatchx+0x238>
    a5d4:	285d      	cmp	r0, #93	; 0x5d
    a5d6:	d016      	beq.n	a606 <fnmatchx+0x238>
    a5d8:	285c      	cmp	r0, #92	; 0x5c
    a5da:	f107 0502 	add.w	r5, r7, #2
    a5de:	d10a      	bne.n	a5f6 <fnmatchx+0x228>
    a5e0:	07e3      	lsls	r3, r4, #31
    a5e2:	d408      	bmi.n	a5f6 <fnmatchx+0x228>
    a5e4:	78b8      	ldrb	r0, [r7, #2]
    a5e6:	f7f8 fa19 	bl	2a1c <foldcase>
    a5ea:	f010 00ff 	ands.w	r0, r0, #255	; 0xff
    a5ee:	f107 0503 	add.w	r5, r7, #3
    a5f2:	f43f aef4 	beq.w	a3de <fnmatchx+0x10>
    a5f6:	45d0      	cmp	r8, sl
    a5f8:	dc03      	bgt.n	a602 <fnmatchx+0x234>
    a5fa:	4550      	cmp	r0, sl
    a5fc:	bfa8      	it	ge
    a5fe:	f04f 0b01 	movge.w	fp, #1
    a602:	2300      	movs	r3, #0
    a604:	e7ac      	b.n	a560 <fnmatchx+0x192>
    a606:	463d      	mov	r5, r7
    a608:	45d0      	cmp	r8, sl
    a60a:	bf08      	it	eq
    a60c:	f04f 0b01 	moveq.w	fp, #1
    a610:	e7f7      	b.n	a602 <fnmatchx+0x234>
    a612:	2003      	movs	r0, #3
    a614:	e6e4      	b.n	a3e0 <fnmatchx+0x12>
    a616:	4608      	mov	r0, r1
    a618:	e6e2      	b.n	a3e0 <fnmatchx+0x12>

0000a61a <fnmatch>:
    a61a:	2340      	movs	r3, #64	; 0x40
    a61c:	f7ff bed7 	b.w	a3ce <fnmatchx>

0000a620 <_ConfigAbsSyms>:
    a620:	4770      	bx	lr

0000a622 <cmd_kernel_reboot_warm>:
    a622:	b508      	push	{r3, lr}
    a624:	2000      	movs	r0, #0
    a626:	f7f8 f9e5 	bl	29f4 <sys_reboot>

0000a62a <cmd_kernel_reboot_cold>:
    a62a:	b508      	push	{r3, lr}
    a62c:	2001      	movs	r0, #1
    a62e:	f7f8 f9e1 	bl	29f4 <sys_reboot>

0000a632 <uart_irq_tx_disable>:
    a632:	6883      	ldr	r3, [r0, #8]
    a634:	6a1b      	ldr	r3, [r3, #32]
    a636:	b103      	cbz	r3, a63a <uart_irq_tx_disable+0x8>
    a638:	4718      	bx	r3
    a63a:	4770      	bx	lr

0000a63c <uninit>:
    a63c:	b510      	push	{r4, lr}
    a63e:	6843      	ldr	r3, [r0, #4]
    a640:	681b      	ldr	r3, [r3, #0]
    a642:	681c      	ldr	r4, [r3, #0]
    a644:	4620      	mov	r0, r4
    a646:	f7ff fff4 	bl	a632 <uart_irq_tx_disable>
    a64a:	68a3      	ldr	r3, [r4, #8]
    a64c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
    a64e:	b10b      	cbz	r3, a654 <uninit+0x18>
    a650:	4620      	mov	r0, r4
    a652:	4798      	blx	r3
    a654:	2000      	movs	r0, #0
    a656:	bd10      	pop	{r4, pc}

0000a658 <enable>:
    a658:	b508      	push	{r3, lr}
    a65a:	6843      	ldr	r3, [r0, #4]
    a65c:	681a      	ldr	r2, [r3, #0]
    a65e:	7411      	strb	r1, [r2, #16]
    a660:	b119      	cbz	r1, a66a <enable+0x12>
    a662:	681b      	ldr	r3, [r3, #0]
    a664:	6818      	ldr	r0, [r3, #0]
    a666:	f7ff ffe4 	bl	a632 <uart_irq_tx_disable>
    a66a:	2000      	movs	r0, #0
    a66c:	bd08      	pop	{r3, pc}

0000a66e <read>:
    a66e:	b510      	push	{r4, lr}
    a670:	461c      	mov	r4, r3
    a672:	6843      	ldr	r3, [r0, #4]
    a674:	68d8      	ldr	r0, [r3, #12]
    a676:	f7ff fe8a 	bl	a38e <ring_buf_get>
    a67a:	6020      	str	r0, [r4, #0]
    a67c:	2000      	movs	r0, #0
    a67e:	bd10      	pop	{r4, pc}

0000a680 <write>:
    a680:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    a684:	6845      	ldr	r5, [r0, #4]
    a686:	461e      	mov	r6, r3
    a688:	682b      	ldr	r3, [r5, #0]
    a68a:	7c1b      	ldrb	r3, [r3, #16]
    a68c:	460c      	mov	r4, r1
    a68e:	4617      	mov	r7, r2
    a690:	b153      	cbz	r3, a6a8 <write+0x28>
    a692:	eb01 0802 	add.w	r8, r1, r2
    a696:	45a0      	cmp	r8, r4
    a698:	d121      	bne.n	a6de <write+0x5e>
    a69a:	6037      	str	r7, [r6, #0]
    a69c:	682b      	ldr	r3, [r5, #0]
    a69e:	2001      	movs	r0, #1
    a6a0:	e9d3 2101 	ldrd	r2, r1, [r3, #4]
    a6a4:	4790      	blx	r2
    a6a6:	e017      	b.n	a6d8 <write+0x58>
    a6a8:	68a8      	ldr	r0, [r5, #8]
    a6aa:	f7ff fe1c 	bl	a2e6 <ring_buf_put>
    a6ae:	6030      	str	r0, [r6, #0]
    a6b0:	682b      	ldr	r3, [r5, #0]
    a6b2:	f3bf 8f5b 	dmb	ish
    a6b6:	330c      	adds	r3, #12
    a6b8:	2101      	movs	r1, #1
    a6ba:	e853 2f00 	ldrex	r2, [r3]
    a6be:	e843 1000 	strex	r0, r1, [r3]
    a6c2:	2800      	cmp	r0, #0
    a6c4:	d1f9      	bne.n	a6ba <write+0x3a>
    a6c6:	f3bf 8f5b 	dmb	ish
    a6ca:	b92a      	cbnz	r2, a6d8 <write+0x58>
    a6cc:	682b      	ldr	r3, [r5, #0]
    a6ce:	6818      	ldr	r0, [r3, #0]
    a6d0:	6883      	ldr	r3, [r0, #8]
    a6d2:	69db      	ldr	r3, [r3, #28]
    a6d4:	b103      	cbz	r3, a6d8 <write+0x58>
    a6d6:	4798      	blx	r3
    a6d8:	2000      	movs	r0, #0
    a6da:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    a6de:	682b      	ldr	r3, [r5, #0]
    a6e0:	f814 1b01 	ldrb.w	r1, [r4], #1
    a6e4:	6818      	ldr	r0, [r3, #0]
    a6e6:	6883      	ldr	r3, [r0, #8]
    a6e8:	685b      	ldr	r3, [r3, #4]
    a6ea:	4798      	blx	r3
    a6ec:	e7d3      	b.n	a696 <write+0x16>

0000a6ee <uart_callback>:
    a6ee:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
    a6f2:	4604      	mov	r4, r0
    a6f4:	460d      	mov	r5, r1
    a6f6:	6883      	ldr	r3, [r0, #8]
    a6f8:	6c5b      	ldr	r3, [r3, #68]	; 0x44
    a6fa:	b103      	cbz	r3, a6fe <uart_callback+0x10>
    a6fc:	4798      	blx	r3
    a6fe:	68a3      	ldr	r3, [r4, #8]
    a700:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    a702:	bb03      	cbnz	r3, a746 <uart_callback+0x58>
    a704:	f04f 0800 	mov.w	r8, #0
    a708:	68e8      	ldr	r0, [r5, #12]
    a70a:	a901      	add	r1, sp, #4
    a70c:	69c2      	ldr	r2, [r0, #28]
    a70e:	f7ff fdb6 	bl	a27e <ring_buf_put_claim>
    a712:	68a3      	ldr	r3, [r4, #8]
    a714:	4607      	mov	r7, r0
    a716:	2800      	cmp	r0, #0
    a718:	d034      	beq.n	a784 <uart_callback+0x96>
    a71a:	699b      	ldr	r3, [r3, #24]
    a71c:	9901      	ldr	r1, [sp, #4]
    a71e:	b333      	cbz	r3, a76e <uart_callback+0x80>
    a720:	4602      	mov	r2, r0
    a722:	4620      	mov	r0, r4
    a724:	4798      	blx	r3
    a726:	4606      	mov	r6, r0
    a728:	b320      	cbz	r0, a774 <uart_callback+0x86>
    a72a:	68e8      	ldr	r0, [r5, #12]
    a72c:	4631      	mov	r1, r6
    a72e:	f7ff fdc5 	bl	a2bc <ring_buf_put_finish>
    a732:	42b7      	cmp	r7, r6
    a734:	f04f 0801 	mov.w	r8, #1
    a738:	d0e6      	beq.n	a708 <uart_callback+0x1a>
    a73a:	682b      	ldr	r3, [r5, #0]
    a73c:	2000      	movs	r0, #0
    a73e:	e9d3 2101 	ldrd	r2, r1, [r3, #4]
    a742:	4790      	blx	r2
    a744:	e003      	b.n	a74e <uart_callback+0x60>
    a746:	4620      	mov	r0, r4
    a748:	4798      	blx	r3
    a74a:	2800      	cmp	r0, #0
    a74c:	d1da      	bne.n	a704 <uart_callback+0x16>
    a74e:	68a3      	ldr	r3, [r4, #8]
    a750:	6a5b      	ldr	r3, [r3, #36]	; 0x24
    a752:	bb03      	cbnz	r3, a796 <uart_callback+0xa8>
    a754:	68a8      	ldr	r0, [r5, #8]
    a756:	a901      	add	r1, sp, #4
    a758:	69c2      	ldr	r2, [r0, #28]
    a75a:	f7ff fde3 	bl	a324 <ring_buf_get_claim>
    a75e:	4606      	mov	r6, r0
    a760:	bb00      	cbnz	r0, a7a4 <uart_callback+0xb6>
    a762:	4620      	mov	r0, r4
    a764:	f7ff ff65 	bl	a632 <uart_irq_tx_disable>
    a768:	682b      	ldr	r3, [r5, #0]
    a76a:	60de      	str	r6, [r3, #12]
    a76c:	e025      	b.n	a7ba <uart_callback+0xcc>
    a76e:	f06f 0657 	mvn.w	r6, #87	; 0x57
    a772:	e7da      	b.n	a72a <uart_callback+0x3c>
    a774:	4601      	mov	r1, r0
    a776:	68e8      	ldr	r0, [r5, #12]
    a778:	f7ff fda0 	bl	a2bc <ring_buf_put_finish>
    a77c:	f1b8 0f00 	cmp.w	r8, #0
    a780:	d0e5      	beq.n	a74e <uart_callback+0x60>
    a782:	e7da      	b.n	a73a <uart_callback+0x4c>
    a784:	699b      	ldr	r3, [r3, #24]
    a786:	2b00      	cmp	r3, #0
    a788:	d0f8      	beq.n	a77c <uart_callback+0x8e>
    a78a:	2201      	movs	r2, #1
    a78c:	f10d 0103 	add.w	r1, sp, #3
    a790:	4620      	mov	r0, r4
    a792:	4798      	blx	r3
    a794:	e7f2      	b.n	a77c <uart_callback+0x8e>
    a796:	4620      	mov	r0, r4
    a798:	4798      	blx	r3
    a79a:	2800      	cmp	r0, #0
    a79c:	d1da      	bne.n	a754 <uart_callback+0x66>
    a79e:	b002      	add	sp, #8
    a7a0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    a7a4:	68a3      	ldr	r3, [r4, #8]
    a7a6:	9901      	ldr	r1, [sp, #4]
    a7a8:	695b      	ldr	r3, [r3, #20]
    a7aa:	b163      	cbz	r3, a7c6 <uart_callback+0xd8>
    a7ac:	4602      	mov	r2, r0
    a7ae:	4620      	mov	r0, r4
    a7b0:	4798      	blx	r3
    a7b2:	4601      	mov	r1, r0
    a7b4:	68a8      	ldr	r0, [r5, #8]
    a7b6:	f7ff fdd5 	bl	a364 <ring_buf_get_finish>
    a7ba:	682b      	ldr	r3, [r5, #0]
    a7bc:	2001      	movs	r0, #1
    a7be:	e9d3 2101 	ldrd	r2, r1, [r3, #4]
    a7c2:	4790      	blx	r2
    a7c4:	e7eb      	b.n	a79e <uart_callback+0xb0>
    a7c6:	f06f 0157 	mvn.w	r1, #87	; 0x57
    a7ca:	e7f3      	b.n	a7b4 <uart_callback+0xc6>

0000a7cc <init>:
    a7cc:	6843      	ldr	r3, [r0, #4]
    a7ce:	7818      	ldrb	r0, [r3, #0]
    a7d0:	b910      	cbnz	r0, a7d8 <init+0xc>
    a7d2:	2201      	movs	r2, #1
    a7d4:	701a      	strb	r2, [r3, #0]
    a7d6:	4770      	bx	lr
    a7d8:	f06f 0015 	mvn.w	r0, #21
    a7dc:	4770      	bx	lr

0000a7de <uninit>:
    a7de:	6843      	ldr	r3, [r0, #4]
    a7e0:	781a      	ldrb	r2, [r3, #0]
    a7e2:	b112      	cbz	r2, a7ea <uninit+0xc>
    a7e4:	2000      	movs	r0, #0
    a7e6:	7018      	strb	r0, [r3, #0]
    a7e8:	4770      	bx	lr
    a7ea:	f06f 0012 	mvn.w	r0, #18
    a7ee:	4770      	bx	lr

0000a7f0 <enable>:
    a7f0:	6843      	ldr	r3, [r0, #4]
    a7f2:	781b      	ldrb	r3, [r3, #0]
    a7f4:	2b00      	cmp	r3, #0
    a7f6:	bf0c      	ite	eq
    a7f8:	f06f 0012 	mvneq.w	r0, #18
    a7fc:	2000      	movne	r0, #0
    a7fe:	4770      	bx	lr

0000a800 <read>:
    a800:	6842      	ldr	r2, [r0, #4]
    a802:	7812      	ldrb	r2, [r2, #0]
    a804:	b112      	cbz	r2, a80c <read+0xc>
    a806:	2000      	movs	r0, #0
    a808:	6018      	str	r0, [r3, #0]
    a80a:	4770      	bx	lr
    a80c:	f06f 0012 	mvn.w	r0, #18
    a810:	4770      	bx	lr

0000a812 <write>:
    a812:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    a814:	6845      	ldr	r5, [r0, #4]
    a816:	461f      	mov	r7, r3
    a818:	782b      	ldrb	r3, [r5, #0]
    a81a:	4614      	mov	r4, r2
    a81c:	b1a3      	cbz	r3, a848 <write+0x36>
    a81e:	686b      	ldr	r3, [r5, #4]
    a820:	189a      	adds	r2, r3, r2
    a822:	f5b2 7f96 	cmp.w	r2, #300	; 0x12c
    a826:	bf26      	itte	cs
    a828:	f5c3 7695 	rsbcs	r6, r3, #298	; 0x12a
    a82c:	3601      	addcs	r6, #1
    a82e:	4626      	movcc	r6, r4
    a830:	f105 0008 	add.w	r0, r5, #8
    a834:	4418      	add	r0, r3
    a836:	4632      	mov	r2, r6
    a838:	f001 fc70 	bl	c11c <memcpy>
    a83c:	686b      	ldr	r3, [r5, #4]
    a83e:	4433      	add	r3, r6
    a840:	606b      	str	r3, [r5, #4]
    a842:	2000      	movs	r0, #0
    a844:	603c      	str	r4, [r7, #0]
    a846:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    a848:	461c      	mov	r4, r3
    a84a:	f06f 0012 	mvn.w	r0, #18
    a84e:	e7f9      	b.n	a844 <write+0x32>

0000a850 <atomic_or>:
    a850:	b510      	push	{r4, lr}
    a852:	4603      	mov	r3, r0
    a854:	f3bf 8f5b 	dmb	ish
    a858:	e853 0f00 	ldrex	r0, [r3]
    a85c:	ea40 0201 	orr.w	r2, r0, r1
    a860:	e843 2400 	strex	r4, r2, [r3]
    a864:	2c00      	cmp	r4, #0
    a866:	d1f7      	bne.n	a858 <atomic_or+0x8>
    a868:	f3bf 8f5b 	dmb	ish
    a86c:	bd10      	pop	{r4, pc}

0000a86e <atomic_and>:
    a86e:	b510      	push	{r4, lr}
    a870:	4603      	mov	r3, r0
    a872:	f3bf 8f5b 	dmb	ish
    a876:	e853 0f00 	ldrex	r0, [r3]
    a87a:	ea00 0201 	and.w	r2, r0, r1
    a87e:	e843 2400 	strex	r4, r2, [r3]
    a882:	2c00      	cmp	r4, #0
    a884:	d1f7      	bne.n	a876 <atomic_and+0x8>
    a886:	f3bf 8f5b 	dmb	ish
    a88a:	bd10      	pop	{r4, pc}

0000a88c <shell_signal_handle>:
    a88c:	b573      	push	{r0, r1, r4, r5, r6, lr}
    a88e:	0109      	lsls	r1, r1, #4
    a890:	6885      	ldr	r5, [r0, #8]
    a892:	f501 711a 	add.w	r1, r1, #616	; 0x268
    a896:	4604      	mov	r4, r0
    a898:	4616      	mov	r6, r2
    a89a:	440d      	add	r5, r1
    a89c:	aa01      	add	r2, sp, #4
    a89e:	4669      	mov	r1, sp
    a8a0:	4628      	mov	r0, r5
    a8a2:	f001 fbf0 	bl	c086 <z_impl_k_poll_signal_check>
    a8a6:	9b00      	ldr	r3, [sp, #0]
    a8a8:	b123      	cbz	r3, a8b4 <shell_signal_handle+0x28>
    a8aa:	4628      	mov	r0, r5
    a8ac:	f001 fbe8 	bl	c080 <z_impl_k_poll_signal_reset>
    a8b0:	4620      	mov	r0, r4
    a8b2:	47b0      	blx	r6
    a8b4:	b002      	add	sp, #8
    a8b6:	bd70      	pop	{r4, r5, r6, pc}

0000a8b8 <z_shell_strlen>:
    a8b8:	b508      	push	{r3, lr}
    a8ba:	b110      	cbz	r0, a8c2 <z_shell_strlen+0xa>
    a8bc:	f7f7 f8fe 	bl	1abc <strlen>
    a8c0:	b280      	uxth	r0, r0
    a8c2:	bd08      	pop	{r3, pc}

0000a8c4 <z_shell_raw_fprintf>:
    a8c4:	b40e      	push	{r1, r2, r3}
    a8c6:	b503      	push	{r0, r1, lr}
    a8c8:	aa03      	add	r2, sp, #12
    a8ca:	f852 1b04 	ldr.w	r1, [r2], #4
    a8ce:	9201      	str	r2, [sp, #4]
    a8d0:	f7f9 fc8c 	bl	41ec <z_shell_fprintf_fmt>
    a8d4:	b002      	add	sp, #8
    a8d6:	f85d eb04 	ldr.w	lr, [sp], #4
    a8da:	b003      	add	sp, #12
    a8dc:	4770      	bx	lr

0000a8de <k_mutex_lock.constprop.0.isra.0>:
    a8de:	f7fd b9c7 	b.w	7c70 <z_impl_k_mutex_lock>

0000a8e2 <transport_evt_handler>:
    a8e2:	688b      	ldr	r3, [r1, #8]
    a8e4:	b920      	cbnz	r0, a8f0 <transport_evt_handler+0xe>
    a8e6:	f503 701a 	add.w	r0, r3, #616	; 0x268
    a8ea:	2100      	movs	r1, #0
    a8ec:	f7fd bfda 	b.w	88a4 <z_impl_k_poll_signal_raise>
    a8f0:	f503 7026 	add.w	r0, r3, #664	; 0x298
    a8f4:	e7f9      	b.n	a8ea <transport_evt_handler+0x8>

0000a8f6 <kill_handler>:
    a8f6:	b538      	push	{r3, r4, r5, lr}
    a8f8:	6883      	ldr	r3, [r0, #8]
    a8fa:	f8d3 3264 	ldr.w	r3, [r3, #612]	; 0x264
    a8fe:	07db      	lsls	r3, r3, #31
    a900:	4604      	mov	r4, r0
    a902:	d41a      	bmi.n	a93a <kill_handler+0x44>
    a904:	6840      	ldr	r0, [r0, #4]
    a906:	6803      	ldr	r3, [r0, #0]
    a908:	685b      	ldr	r3, [r3, #4]
    a90a:	4798      	blx	r3
    a90c:	4605      	mov	r5, r0
    a90e:	b920      	cbnz	r0, a91a <kill_handler+0x24>
    a910:	68e0      	ldr	r0, [r4, #12]
    a912:	f000 fbfb 	bl	b10c <z_shell_history_purge>
    a916:	68a3      	ldr	r3, [r4, #8]
    a918:	711d      	strb	r5, [r3, #4]
    a91a:	68a3      	ldr	r3, [r4, #8]
    a91c:	6b5b      	ldr	r3, [r3, #52]	; 0x34
    a91e:	b113      	cbz	r3, a926 <kill_handler+0x30>
    a920:	4629      	mov	r1, r5
    a922:	4620      	mov	r0, r4
    a924:	4798      	blx	r3
    a926:	68a3      	ldr	r3, [r4, #8]
    a928:	2200      	movs	r2, #0
    a92a:	f8c3 230c 	str.w	r2, [r3, #780]	; 0x30c
    a92e:	f7fd fd87 	bl	8440 <z_impl_z_current_get>
    a932:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    a936:	f7fa bfab 	b.w	5890 <z_impl_k_thread_abort>
    a93a:	f06f 050f 	mvn.w	r5, #15
    a93e:	e7ec      	b.n	a91a <kill_handler+0x24>

0000a940 <z_flag_history_exit_set.isra.0>:
    a940:	f500 7019 	add.w	r0, r0, #612	; 0x264
    a944:	b111      	cbz	r1, a94c <z_flag_history_exit_set.isra.0+0xc>
    a946:	2104      	movs	r1, #4
    a948:	f7ff bf82 	b.w	a850 <atomic_or>
    a94c:	f06f 0104 	mvn.w	r1, #4
    a950:	f7ff bf8d 	b.w	a86e <atomic_and>

0000a954 <z_flag_insert_mode_set.isra.0>:
    a954:	b508      	push	{r3, lr}
    a956:	f500 7018 	add.w	r0, r0, #608	; 0x260
    a95a:	b129      	cbz	r1, a968 <z_flag_insert_mode_set.isra.0+0x14>
    a95c:	2101      	movs	r1, #1
    a95e:	f7ff ff77 	bl	a850 <atomic_or>
    a962:	f000 0001 	and.w	r0, r0, #1
    a966:	bd08      	pop	{r3, pc}
    a968:	f06f 0101 	mvn.w	r1, #1
    a96c:	f7ff ff7f 	bl	a86e <atomic_and>
    a970:	e7f7      	b.n	a962 <z_flag_insert_mode_set.isra.0+0xe>

0000a972 <k_mutex_unlock.isra.0>:
    a972:	f7fd b9f7 	b.w	7d64 <z_impl_k_mutex_unlock>

0000a976 <shell_vfprintf>:
    a976:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    a978:	4604      	mov	r4, r0
    a97a:	6880      	ldr	r0, [r0, #8]
    a97c:	461f      	mov	r7, r3
    a97e:	7903      	ldrb	r3, [r0, #4]
    a980:	2b02      	cmp	r3, #2
    a982:	460d      	mov	r5, r1
    a984:	4616      	mov	r6, r2
    a986:	d007      	beq.n	a998 <shell_vfprintf+0x22>
    a988:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    a98c:	f44f 5180 	mov.w	r1, #4096	; 0x1000
    a990:	f500 7019 	add.w	r0, r0, #612	; 0x264
    a994:	f7ff bf5c 	b.w	a850 <atomic_or>
    a998:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    a99c:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    a9a0:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    a9a4:	f7ff ff9b 	bl	a8de <k_mutex_lock.constprop.0.isra.0>
    a9a8:	68a3      	ldr	r3, [r4, #8]
    a9aa:	f8d3 2264 	ldr.w	r2, [r3, #612]	; 0x264
    a9ae:	0511      	lsls	r1, r2, #20
    a9b0:	d404      	bmi.n	a9bc <shell_vfprintf+0x46>
    a9b2:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    a9b4:	b913      	cbnz	r3, a9bc <shell_vfprintf+0x46>
    a9b6:	4620      	mov	r0, r4
    a9b8:	f000 f9f1 	bl	ad9e <z_shell_cmd_line_erase>
    a9bc:	463b      	mov	r3, r7
    a9be:	4632      	mov	r2, r6
    a9c0:	4629      	mov	r1, r5
    a9c2:	4620      	mov	r0, r4
    a9c4:	f000 fa4b 	bl	ae5e <z_shell_vfprintf>
    a9c8:	68a3      	ldr	r3, [r4, #8]
    a9ca:	f8d3 2264 	ldr.w	r2, [r3, #612]	; 0x264
    a9ce:	0512      	lsls	r2, r2, #20
    a9d0:	d404      	bmi.n	a9dc <shell_vfprintf+0x66>
    a9d2:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    a9d4:	b913      	cbnz	r3, a9dc <shell_vfprintf+0x66>
    a9d6:	4620      	mov	r0, r4
    a9d8:	f7f9 ff34 	bl	4844 <z_shell_print_prompt_and_cmd>
    a9dc:	6960      	ldr	r0, [r4, #20]
    a9de:	f000 f817 	bl	aa10 <z_shell_fprintf_buffer_flush>
    a9e2:	68a0      	ldr	r0, [r4, #8]
    a9e4:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    a9e8:	f500 703e 	add.w	r0, r0, #760	; 0x2f8
    a9ec:	f7ff bfc1 	b.w	a972 <k_mutex_unlock.isra.0>

0000a9f0 <shell_fprintf>:
    a9f0:	b40c      	push	{r2, r3}
    a9f2:	b507      	push	{r0, r1, r2, lr}
    a9f4:	ab04      	add	r3, sp, #16
    a9f6:	f853 2b04 	ldr.w	r2, [r3], #4
    a9fa:	9301      	str	r3, [sp, #4]
    a9fc:	f7ff ffbb 	bl	a976 <shell_vfprintf>
    aa00:	b003      	add	sp, #12
    aa02:	f85d eb04 	ldr.w	lr, [sp], #4
    aa06:	b002      	add	sp, #8
    aa08:	4770      	bx	lr

0000aa0a <shell_set_bypass>:
    aa0a:	6883      	ldr	r3, [r0, #8]
    aa0c:	6399      	str	r1, [r3, #56]	; 0x38
    aa0e:	4770      	bx	lr

0000aa10 <z_shell_fprintf_buffer_flush>:
    aa10:	b510      	push	{r4, lr}
    aa12:	6902      	ldr	r2, [r0, #16]
    aa14:	6883      	ldr	r3, [r0, #8]
    aa16:	6812      	ldr	r2, [r2, #0]
    aa18:	6801      	ldr	r1, [r0, #0]
    aa1a:	4604      	mov	r4, r0
    aa1c:	68c0      	ldr	r0, [r0, #12]
    aa1e:	4798      	blx	r3
    aa20:	6923      	ldr	r3, [r4, #16]
    aa22:	2200      	movs	r2, #0
    aa24:	601a      	str	r2, [r3, #0]
    aa26:	bd10      	pop	{r4, pc}

0000aa28 <out_func>:
    aa28:	b538      	push	{r3, r4, r5, lr}
    aa2a:	68cb      	ldr	r3, [r1, #12]
    aa2c:	7c1b      	ldrb	r3, [r3, #16]
    aa2e:	2b02      	cmp	r3, #2
    aa30:	4605      	mov	r5, r0
    aa32:	460c      	mov	r4, r1
    aa34:	d104      	bne.n	aa40 <out_func+0x18>
    aa36:	280a      	cmp	r0, #10
    aa38:	d102      	bne.n	aa40 <out_func+0x18>
    aa3a:	200d      	movs	r0, #13
    aa3c:	f7ff fff4 	bl	aa28 <out_func>
    aa40:	6923      	ldr	r3, [r4, #16]
    aa42:	6822      	ldr	r2, [r4, #0]
    aa44:	681b      	ldr	r3, [r3, #0]
    aa46:	54d5      	strb	r5, [r2, r3]
    aa48:	6922      	ldr	r2, [r4, #16]
    aa4a:	6813      	ldr	r3, [r2, #0]
    aa4c:	3301      	adds	r3, #1
    aa4e:	6013      	str	r3, [r2, #0]
    aa50:	6923      	ldr	r3, [r4, #16]
    aa52:	681a      	ldr	r2, [r3, #0]
    aa54:	6863      	ldr	r3, [r4, #4]
    aa56:	429a      	cmp	r2, r3
    aa58:	d102      	bne.n	aa60 <out_func+0x38>
    aa5a:	4620      	mov	r0, r4
    aa5c:	f7ff ffd8 	bl	aa10 <z_shell_fprintf_buffer_flush>
    aa60:	2000      	movs	r0, #0
    aa62:	bd38      	pop	{r3, r4, r5, pc}

0000aa64 <z_shell_strlen>:
    aa64:	b508      	push	{r3, lr}
    aa66:	b110      	cbz	r0, aa6e <z_shell_strlen+0xa>
    aa68:	f7f7 f828 	bl	1abc <strlen>
    aa6c:	b280      	uxth	r0, r0
    aa6e:	bd08      	pop	{r3, pc}

0000aa70 <z_column_span_with_buffer_offsets_get>:
    aa70:	b510      	push	{r4, lr}
    aa72:	7b04      	ldrb	r4, [r0, #12]
    aa74:	8943      	ldrh	r3, [r0, #10]
    aa76:	4422      	add	r2, r4
    aa78:	4421      	add	r1, r4
    aa7a:	fbb2 f0f3 	udiv	r0, r2, r3
    aa7e:	fb03 2210 	mls	r2, r3, r0, r2
    aa82:	fbb1 f0f3 	udiv	r0, r1, r3
    aa86:	fb03 1010 	mls	r0, r3, r0, r1
    aa8a:	1a10      	subs	r0, r2, r0
    aa8c:	bd10      	pop	{r4, pc}

0000aa8e <z_row_span_with_buffer_offsets_get>:
    aa8e:	b510      	push	{r4, lr}
    aa90:	7b04      	ldrb	r4, [r0, #12]
    aa92:	8943      	ldrh	r3, [r0, #10]
    aa94:	4421      	add	r1, r4
    aa96:	1910      	adds	r0, r2, r4
    aa98:	fbb1 f1f3 	udiv	r1, r1, r3
    aa9c:	fbb0 f0f3 	udiv	r0, r0, r3
    aaa0:	1a40      	subs	r0, r0, r1
    aaa2:	bd10      	pop	{r4, pc}

0000aaa4 <z_shell_multiline_data_calc>:
    aaa4:	b530      	push	{r4, r5, lr}
    aaa6:	7b05      	ldrb	r5, [r0, #12]
    aaa8:	8943      	ldrh	r3, [r0, #10]
    aaaa:	4429      	add	r1, r5
    aaac:	fbb1 f4f3 	udiv	r4, r1, r3
    aab0:	fb03 1114 	mls	r1, r3, r4, r1
    aab4:	3101      	adds	r1, #1
    aab6:	442a      	add	r2, r5
    aab8:	3401      	adds	r4, #1
    aaba:	8001      	strh	r1, [r0, #0]
    aabc:	fbb2 f1f3 	udiv	r1, r2, r3
    aac0:	fb03 2211 	mls	r2, r3, r1, r2
    aac4:	8084      	strh	r4, [r0, #4]
    aac6:	3201      	adds	r2, #1
    aac8:	1c4c      	adds	r4, r1, #1
    aaca:	80c4      	strh	r4, [r0, #6]
    aacc:	8042      	strh	r2, [r0, #2]
    aace:	bd30      	pop	{r4, r5, pc}

0000aad0 <z_shell_pattern_remove>:
    aad0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    aad2:	460e      	mov	r6, r1
    aad4:	4611      	mov	r1, r2
    aad6:	4615      	mov	r5, r2
    aad8:	4607      	mov	r7, r0
    aada:	f001 fbc8 	bl	c26e <strstr>
    aade:	4604      	mov	r4, r0
    aae0:	4628      	mov	r0, r5
    aae2:	f7ff ffbf 	bl	aa64 <z_shell_strlen>
    aae6:	4605      	mov	r5, r0
    aae8:	b1c4      	cbz	r4, ab1c <z_shell_pattern_remove+0x4c>
    aaea:	42a7      	cmp	r7, r4
    aaec:	d207      	bcs.n	aafe <z_shell_pattern_remove+0x2e>
    aaee:	f814 3c01 	ldrb.w	r3, [r4, #-1]
    aaf2:	2b20      	cmp	r3, #32
    aaf4:	bf02      	ittt	eq
    aaf6:	3501      	addeq	r5, #1
    aaf8:	b2ad      	uxtheq	r5, r5
    aafa:	f104 34ff 	addeq.w	r4, r4, #4294967295	; 0xffffffff
    aafe:	4620      	mov	r0, r4
    ab00:	f7ff ffb0 	bl	aa64 <z_shell_strlen>
    ab04:	8833      	ldrh	r3, [r6, #0]
    ab06:	1c42      	adds	r2, r0, #1
    ab08:	1b5b      	subs	r3, r3, r5
    ab0a:	1b52      	subs	r2, r2, r5
    ab0c:	8033      	strh	r3, [r6, #0]
    ab0e:	1961      	adds	r1, r4, r5
    ab10:	4620      	mov	r0, r4
    ab12:	b292      	uxth	r2, r2
    ab14:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    ab18:	f001 bb0e 	b.w	c138 <memmove>
    ab1c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

0000ab1e <z_shell_find_cmd>:
    ab1e:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    ab22:	460f      	mov	r7, r1
    ab24:	b086      	sub	sp, #24
    ab26:	4616      	mov	r6, r2
    ab28:	4604      	mov	r4, r0
    ab2a:	b170      	cbz	r0, ab4a <z_shell_find_cmd+0x2c>
    ab2c:	4603      	mov	r3, r0
    ab2e:	ac01      	add	r4, sp, #4
    ab30:	f100 0510 	add.w	r5, r0, #16
    ab34:	6818      	ldr	r0, [r3, #0]
    ab36:	6859      	ldr	r1, [r3, #4]
    ab38:	4622      	mov	r2, r4
    ab3a:	c203      	stmia	r2!, {r0, r1}
    ab3c:	3308      	adds	r3, #8
    ab3e:	42ab      	cmp	r3, r5
    ab40:	4614      	mov	r4, r2
    ab42:	d1f7      	bne.n	ab34 <z_shell_find_cmd+0x16>
    ab44:	6818      	ldr	r0, [r3, #0]
    ab46:	6010      	str	r0, [r2, #0]
    ab48:	ac01      	add	r4, sp, #4
    ab4a:	f04f 0800 	mov.w	r8, #0
    ab4e:	4641      	mov	r1, r8
    ab50:	4632      	mov	r2, r6
    ab52:	4620      	mov	r0, r4
    ab54:	f7f9 fc3e 	bl	43d4 <z_shell_cmd_get>
    ab58:	f108 0801 	add.w	r8, r8, #1
    ab5c:	4605      	mov	r5, r0
    ab5e:	b128      	cbz	r0, ab6c <z_shell_find_cmd+0x4e>
    ab60:	6829      	ldr	r1, [r5, #0]
    ab62:	4638      	mov	r0, r7
    ab64:	f7f6 ffa0 	bl	1aa8 <strcmp>
    ab68:	2800      	cmp	r0, #0
    ab6a:	d1f0      	bne.n	ab4e <z_shell_find_cmd+0x30>
    ab6c:	4628      	mov	r0, r5
    ab6e:	b006      	add	sp, #24
    ab70:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0000ab74 <z_shell_get_last_command>:
    ab74:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ab78:	461c      	mov	r4, r3
    ab7a:	f8dd 8020 	ldr.w	r8, [sp, #32]
    ab7e:	f89d 9024 	ldrb.w	r9, [sp, #36]	; 0x24
    ab82:	2300      	movs	r3, #0
    ab84:	460f      	mov	r7, r1
    ab86:	4616      	mov	r6, r2
    ab88:	6023      	str	r3, [r4, #0]
    ab8a:	6823      	ldr	r3, [r4, #0]
    ab8c:	42bb      	cmp	r3, r7
    ab8e:	4605      	mov	r5, r0
    ab90:	d21b      	bcs.n	abca <z_shell_get_last_command+0x56>
    ab92:	f856 0023 	ldr.w	r0, [r6, r3, lsl #2]
    ab96:	f000 fb33 	bl	b200 <z_shell_has_wildcard>
    ab9a:	6823      	ldr	r3, [r4, #0]
    ab9c:	4682      	mov	sl, r0
    ab9e:	b118      	cbz	r0, aba8 <z_shell_get_last_command+0x34>
    aba0:	3301      	adds	r3, #1
    aba2:	6023      	str	r3, [r4, #0]
    aba4:	4628      	mov	r0, r5
    aba6:	e7f0      	b.n	ab8a <z_shell_get_last_command+0x16>
    aba8:	f856 1023 	ldr.w	r1, [r6, r3, lsl #2]
    abac:	4642      	mov	r2, r8
    abae:	4628      	mov	r0, r5
    abb0:	f7ff ffb5 	bl	ab1e <z_shell_find_cmd>
    abb4:	b148      	cbz	r0, abca <z_shell_get_last_command+0x56>
    abb6:	6823      	ldr	r3, [r4, #0]
    abb8:	1c5a      	adds	r2, r3, #1
    abba:	6022      	str	r2, [r4, #0]
    abbc:	f1b9 0f00 	cmp.w	r9, #0
    abc0:	d0e3      	beq.n	ab8a <z_shell_get_last_command+0x16>
    abc2:	4580      	cmp	r8, r0
    abc4:	d1e1      	bne.n	ab8a <z_shell_get_last_command+0x16>
    abc6:	6023      	str	r3, [r4, #0]
    abc8:	4655      	mov	r5, sl
    abca:	4628      	mov	r0, r5
    abcc:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

0000abd0 <shell_strtoul>:
    abd0:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    abd2:	7803      	ldrb	r3, [r0, #0]
    abd4:	2700      	movs	r7, #0
    abd6:	2b2d      	cmp	r3, #45	; 0x2d
    abd8:	4604      	mov	r4, r0
    abda:	460d      	mov	r5, r1
    abdc:	4616      	mov	r6, r2
    abde:	9701      	str	r7, [sp, #4]
    abe0:	d106      	bne.n	abf0 <shell_strtoul+0x20>
    abe2:	f06f 0315 	mvn.w	r3, #21
    abe6:	6033      	str	r3, [r6, #0]
    abe8:	2500      	movs	r5, #0
    abea:	4628      	mov	r0, r5
    abec:	b003      	add	sp, #12
    abee:	bdf0      	pop	{r4, r5, r6, r7, pc}
    abf0:	f000 fb93 	bl	b31a <__errno>
    abf4:	462a      	mov	r2, r5
    abf6:	6007      	str	r7, [r0, #0]
    abf8:	a901      	add	r1, sp, #4
    abfa:	4620      	mov	r0, r4
    abfc:	f7fe f9fc 	bl	8ff8 <strtoul>
    ac00:	4605      	mov	r5, r0
    ac02:	f000 fb8a 	bl	b31a <__errno>
    ac06:	6803      	ldr	r3, [r0, #0]
    ac08:	2b22      	cmp	r3, #34	; 0x22
    ac0a:	d102      	bne.n	ac12 <shell_strtoul+0x42>
    ac0c:	f06f 0321 	mvn.w	r3, #33	; 0x21
    ac10:	e7e9      	b.n	abe6 <shell_strtoul+0x16>
    ac12:	f000 fb82 	bl	b31a <__errno>
    ac16:	6803      	ldr	r3, [r0, #0]
    ac18:	2b00      	cmp	r3, #0
    ac1a:	d1e2      	bne.n	abe2 <shell_strtoul+0x12>
    ac1c:	9b01      	ldr	r3, [sp, #4]
    ac1e:	42a3      	cmp	r3, r4
    ac20:	d0df      	beq.n	abe2 <shell_strtoul+0x12>
    ac22:	781b      	ldrb	r3, [r3, #0]
    ac24:	2b00      	cmp	r3, #0
    ac26:	d0e0      	beq.n	abea <shell_strtoul+0x1a>
    ac28:	e7db      	b.n	abe2 <shell_strtoul+0x12>

0000ac2a <z_shell_raw_fprintf>:
    ac2a:	b40e      	push	{r1, r2, r3}
    ac2c:	b503      	push	{r0, r1, lr}
    ac2e:	aa03      	add	r2, sp, #12
    ac30:	f852 1b04 	ldr.w	r1, [r2], #4
    ac34:	9201      	str	r2, [sp, #4]
    ac36:	f7f9 fad9 	bl	41ec <z_shell_fprintf_fmt>
    ac3a:	b002      	add	sp, #8
    ac3c:	f85d eb04 	ldr.w	lr, [sp], #4
    ac40:	b003      	add	sp, #12
    ac42:	4770      	bx	lr

0000ac44 <full_line_cmd>:
    ac44:	b538      	push	{r3, r4, r5, lr}
    ac46:	6883      	ldr	r3, [r0, #8]
    ac48:	4604      	mov	r4, r0
    ac4a:	6818      	ldr	r0, [r3, #0]
    ac4c:	8f9d      	ldrh	r5, [r3, #60]	; 0x3c
    ac4e:	b110      	cbz	r0, ac56 <full_line_cmd+0x12>
    ac50:	f7f6 ff34 	bl	1abc <strlen>
    ac54:	b280      	uxth	r0, r0
    ac56:	68a2      	ldr	r2, [r4, #8]
    ac58:	8d52      	ldrh	r2, [r2, #42]	; 0x2a
    ac5a:	1943      	adds	r3, r0, r5
    ac5c:	fbb3 f1f2 	udiv	r1, r3, r2
    ac60:	fb02 3011 	mls	r0, r2, r1, r3
    ac64:	fab0 f080 	clz	r0, r0
    ac68:	0940      	lsrs	r0, r0, #5
    ac6a:	bd38      	pop	{r3, r4, r5, pc}

0000ac6c <z_shell_cursor_in_empty_line>:
    ac6c:	b538      	push	{r3, r4, r5, lr}
    ac6e:	6883      	ldr	r3, [r0, #8]
    ac70:	f8d3 2260 	ldr.w	r2, [r3, #608]	; 0x260
    ac74:	8fdd      	ldrh	r5, [r3, #62]	; 0x3e
    ac76:	4604      	mov	r4, r0
    ac78:	6818      	ldr	r0, [r3, #0]
    ac7a:	f3c2 0240 	ubfx	r2, r2, #1, #1
    ac7e:	4355      	muls	r5, r2
    ac80:	b110      	cbz	r0, ac88 <z_shell_cursor_in_empty_line+0x1c>
    ac82:	f7f6 ff1b 	bl	1abc <strlen>
    ac86:	b280      	uxth	r0, r0
    ac88:	68a2      	ldr	r2, [r4, #8]
    ac8a:	8d52      	ldrh	r2, [r2, #42]	; 0x2a
    ac8c:	1943      	adds	r3, r0, r5
    ac8e:	fbb3 f1f2 	udiv	r1, r3, r2
    ac92:	fb02 3011 	mls	r0, r2, r1, r3
    ac96:	fab0 f080 	clz	r0, r0
    ac9a:	0940      	lsrs	r0, r0, #5
    ac9c:	bd38      	pop	{r3, r4, r5, pc}

0000ac9e <z_shell_op_cond_next_line>:
    ac9e:	b510      	push	{r4, lr}
    aca0:	4604      	mov	r4, r0
    aca2:	f7ff ffe3 	bl	ac6c <z_shell_cursor_in_empty_line>
    aca6:	b120      	cbz	r0, acb2 <z_shell_op_cond_next_line+0x14>
    aca8:	6960      	ldr	r0, [r4, #20]
    acaa:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    acae:	f7f9 bc45 	b.w	453c <z_cursor_next_line_move.isra.0>
    acb2:	4620      	mov	r0, r4
    acb4:	f7ff ffc6 	bl	ac44 <full_line_cmd>
    acb8:	2800      	cmp	r0, #0
    acba:	d1f5      	bne.n	aca8 <z_shell_op_cond_next_line+0xa>
    acbc:	bd10      	pop	{r4, pc}

0000acbe <z_shell_op_cursor_position_synchronize>:
    acbe:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    acc0:	6884      	ldr	r4, [r0, #8]
    acc2:	4605      	mov	r5, r0
    acc4:	8fa2      	ldrh	r2, [r4, #60]	; 0x3c
    acc6:	8fe1      	ldrh	r1, [r4, #62]	; 0x3e
    acc8:	f104 0020 	add.w	r0, r4, #32
    accc:	f7ff feea 	bl	aaa4 <z_shell_multiline_data_calc>
    acd0:	4628      	mov	r0, r5
    acd2:	8ca7      	ldrh	r7, [r4, #36]	; 0x24
    acd4:	8ce6      	ldrh	r6, [r4, #38]	; 0x26
    acd6:	f7ff ffb5 	bl	ac44 <full_line_cmd>
    acda:	b110      	cbz	r0, ace2 <z_shell_op_cursor_position_synchronize+0x24>
    acdc:	6968      	ldr	r0, [r5, #20]
    acde:	f7f9 fc2d 	bl	453c <z_cursor_next_line_move.isra.0>
    ace2:	42b7      	cmp	r7, r6
    ace4:	d107      	bne.n	acf6 <z_shell_op_cursor_position_synchronize+0x38>
    ace6:	8c21      	ldrh	r1, [r4, #32]
    ace8:	8c63      	ldrh	r3, [r4, #34]	; 0x22
    acea:	4628      	mov	r0, r5
    acec:	1ac9      	subs	r1, r1, r3
    acee:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    acf2:	f7f9 bc3f 	b.w	4574 <z_shell_op_cursor_horiz_move>
    acf6:	8ce1      	ldrh	r1, [r4, #38]	; 0x26
    acf8:	8ca3      	ldrh	r3, [r4, #36]	; 0x24
    acfa:	4628      	mov	r0, r5
    acfc:	1ac9      	subs	r1, r1, r3
    acfe:	f7f9 fc23 	bl	4548 <z_shell_op_cursor_vert_move>
    ad02:	e7f0      	b.n	ace6 <z_shell_op_cursor_position_synchronize+0x28>

0000ad04 <z_shell_op_cursor_move>:
    ad04:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    ad06:	4604      	mov	r4, r0
    ad08:	6880      	ldr	r0, [r0, #8]
    ad0a:	460d      	mov	r5, r1
    ad0c:	8fc1      	ldrh	r1, [r0, #62]	; 0x3e
    ad0e:	8f82      	ldrh	r2, [r0, #60]	; 0x3c
    ad10:	3020      	adds	r0, #32
    ad12:	440d      	add	r5, r1
    ad14:	f7ff fec6 	bl	aaa4 <z_shell_multiline_data_calc>
    ad18:	68a0      	ldr	r0, [r4, #8]
    ad1a:	b2ad      	uxth	r5, r5
    ad1c:	8fc1      	ldrh	r1, [r0, #62]	; 0x3e
    ad1e:	462a      	mov	r2, r5
    ad20:	3020      	adds	r0, #32
    ad22:	f7ff feb4 	bl	aa8e <z_row_span_with_buffer_offsets_get>
    ad26:	4607      	mov	r7, r0
    ad28:	68a0      	ldr	r0, [r4, #8]
    ad2a:	462a      	mov	r2, r5
    ad2c:	8fc1      	ldrh	r1, [r0, #62]	; 0x3e
    ad2e:	3020      	adds	r0, #32
    ad30:	f7ff fe9e 	bl	aa70 <z_column_span_with_buffer_offsets_get>
    ad34:	4279      	negs	r1, r7
    ad36:	4606      	mov	r6, r0
    ad38:	4620      	mov	r0, r4
    ad3a:	f7f9 fc05 	bl	4548 <z_shell_op_cursor_vert_move>
    ad3e:	4631      	mov	r1, r6
    ad40:	4620      	mov	r0, r4
    ad42:	f7f9 fc17 	bl	4574 <z_shell_op_cursor_horiz_move>
    ad46:	68a3      	ldr	r3, [r4, #8]
    ad48:	87dd      	strh	r5, [r3, #62]	; 0x3e
    ad4a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

0000ad4c <z_shell_op_cursor_home_move>:
    ad4c:	6883      	ldr	r3, [r0, #8]
    ad4e:	8fd9      	ldrh	r1, [r3, #62]	; 0x3e
    ad50:	4249      	negs	r1, r1
    ad52:	b209      	sxth	r1, r1
    ad54:	f7ff bfd6 	b.w	ad04 <z_shell_op_cursor_move>

0000ad58 <z_shell_op_cursor_end_move>:
    ad58:	6883      	ldr	r3, [r0, #8]
    ad5a:	8f99      	ldrh	r1, [r3, #60]	; 0x3c
    ad5c:	8fdb      	ldrh	r3, [r3, #62]	; 0x3e
    ad5e:	1ac9      	subs	r1, r1, r3
    ad60:	b209      	sxth	r1, r1
    ad62:	f7ff bfcf 	b.w	ad04 <z_shell_op_cursor_move>

0000ad66 <z_shell_op_left_arrow>:
    ad66:	6883      	ldr	r3, [r0, #8]
    ad68:	8fdb      	ldrh	r3, [r3, #62]	; 0x3e
    ad6a:	b11b      	cbz	r3, ad74 <z_shell_op_left_arrow+0xe>
    ad6c:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    ad70:	f7ff bfc8 	b.w	ad04 <z_shell_op_cursor_move>
    ad74:	4770      	bx	lr

0000ad76 <z_shell_op_right_arrow>:
    ad76:	6883      	ldr	r3, [r0, #8]
    ad78:	8fda      	ldrh	r2, [r3, #62]	; 0x3e
    ad7a:	8f9b      	ldrh	r3, [r3, #60]	; 0x3c
    ad7c:	429a      	cmp	r2, r3
    ad7e:	d202      	bcs.n	ad86 <z_shell_op_right_arrow+0x10>
    ad80:	2101      	movs	r1, #1
    ad82:	f7ff bfbf 	b.w	ad04 <z_shell_op_cursor_move>
    ad86:	4770      	bx	lr

0000ad88 <z_shell_op_delete_from_cursor>:
    ad88:	6882      	ldr	r2, [r0, #8]
    ad8a:	8fd1      	ldrh	r1, [r2, #62]	; 0x3e
    ad8c:	8791      	strh	r1, [r2, #60]	; 0x3c
    ad8e:	6883      	ldr	r3, [r0, #8]
    ad90:	8fda      	ldrh	r2, [r3, #62]	; 0x3e
    ad92:	4413      	add	r3, r2
    ad94:	2200      	movs	r2, #0
    ad96:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
    ad9a:	f7f9 bbc3 	b.w	4524 <z_clear_eos>

0000ad9e <z_shell_cmd_line_erase>:
    ad9e:	b510      	push	{r4, lr}
    ada0:	4604      	mov	r4, r0
    ada2:	6880      	ldr	r0, [r0, #8]
    ada4:	8f82      	ldrh	r2, [r0, #60]	; 0x3c
    ada6:	8fc1      	ldrh	r1, [r0, #62]	; 0x3e
    ada8:	3020      	adds	r0, #32
    adaa:	f7ff fe7b 	bl	aaa4 <z_shell_multiline_data_calc>
    adae:	68a3      	ldr	r3, [r4, #8]
    adb0:	8c19      	ldrh	r1, [r3, #32]
    adb2:	4620      	mov	r0, r4
    adb4:	f1c1 0101 	rsb	r1, r1, #1
    adb8:	f7f9 fbdc 	bl	4574 <z_shell_op_cursor_horiz_move>
    adbc:	68a3      	ldr	r3, [r4, #8]
    adbe:	8c99      	ldrh	r1, [r3, #36]	; 0x24
    adc0:	4620      	mov	r0, r4
    adc2:	3901      	subs	r1, #1
    adc4:	f7f9 fbc0 	bl	4548 <z_shell_op_cursor_vert_move>
    adc8:	4620      	mov	r0, r4
    adca:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    adce:	f7f9 bba9 	b.w	4524 <z_clear_eos>

0000add2 <z_shell_write>:
    add2:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    add6:	4605      	mov	r5, r0
    add8:	b086      	sub	sp, #24
    adda:	460f      	mov	r7, r1
    addc:	4614      	mov	r4, r2
    adde:	2600      	movs	r6, #0
    ade0:	b9a4      	cbnz	r4, ae0c <z_shell_write+0x3a>
    ade2:	b006      	add	sp, #24
    ade4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    ade8:	f8d3 2264 	ldr.w	r2, [r3, #612]	; 0x264
    adec:	0792      	lsls	r2, r2, #30
    adee:	d5fb      	bpl.n	ade8 <z_shell_write+0x16>
    adf0:	f3bf 8f5b 	dmb	ish
    adf4:	f503 7319 	add.w	r3, r3, #612	; 0x264
    adf8:	e853 1f00 	ldrex	r1, [r3]
    adfc:	f021 0102 	bic.w	r1, r1, #2
    ae00:	e843 1200 	strex	r2, r1, [r3]
    ae04:	2a00      	cmp	r2, #0
    ae06:	d1f7      	bne.n	adf8 <z_shell_write+0x26>
    ae08:	f3bf 8f5b 	dmb	ish
    ae0c:	6868      	ldr	r0, [r5, #4]
    ae0e:	6803      	ldr	r3, [r0, #0]
    ae10:	4622      	mov	r2, r4
    ae12:	f8d3 800c 	ldr.w	r8, [r3, #12]
    ae16:	19b9      	adds	r1, r7, r6
    ae18:	466b      	mov	r3, sp
    ae1a:	47c0      	blx	r8
    ae1c:	9a00      	ldr	r2, [sp, #0]
    ae1e:	4416      	add	r6, r2
    ae20:	1aa4      	subs	r4, r4, r2
    ae22:	2a00      	cmp	r2, #0
    ae24:	d1dc      	bne.n	ade0 <z_shell_write+0xe>
    ae26:	68ab      	ldr	r3, [r5, #8]
    ae28:	7919      	ldrb	r1, [r3, #4]
    ae2a:	2903      	cmp	r1, #3
    ae2c:	d0ee      	beq.n	ae0c <z_shell_write+0x3a>
    ae2e:	2902      	cmp	r1, #2
    ae30:	d8da      	bhi.n	ade8 <z_shell_write+0x16>
    ae32:	f503 7326 	add.w	r3, r3, #664	; 0x298
    ae36:	2101      	movs	r1, #1
    ae38:	a801      	add	r0, sp, #4
    ae3a:	f001 f8ff 	bl	c03c <k_poll_event_init>
    ae3e:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    ae42:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    ae46:	2101      	movs	r1, #1
    ae48:	a801      	add	r0, sp, #4
    ae4a:	f7fd fccf 	bl	87ec <z_impl_k_poll>
    ae4e:	68a8      	ldr	r0, [r5, #8]
    ae50:	f500 7026 	add.w	r0, r0, #664	; 0x298
    ae54:	f001 f914 	bl	c080 <z_impl_k_poll_signal_reset>
    ae58:	e7d8      	b.n	ae0c <z_shell_write+0x3a>

0000ae5a <z_shell_print_stream>:
    ae5a:	f7ff bfba 	b.w	add2 <z_shell_write>

0000ae5e <z_shell_vfprintf>:
    ae5e:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    ae60:	461e      	mov	r6, r3
    ae62:	6883      	ldr	r3, [r0, #8]
    ae64:	4615      	mov	r5, r2
    ae66:	f8d3 2260 	ldr.w	r2, [r3, #608]	; 0x260
    ae6a:	06d2      	lsls	r2, r2, #27
    ae6c:	4604      	mov	r4, r0
    ae6e:	d513      	bpl.n	ae98 <z_shell_vfprintf+0x3a>
    ae70:	f893 202e 	ldrb.w	r2, [r3, #46]	; 0x2e
    ae74:	428a      	cmp	r2, r1
    ae76:	d00f      	beq.n	ae98 <z_shell_vfprintf+0x3a>
    ae78:	8ddb      	ldrh	r3, [r3, #46]	; 0x2e
    ae7a:	f8ad 3004 	strh.w	r3, [sp, #4]
    ae7e:	f7f9 fbd3 	bl	4628 <z_shell_vt100_color_set>
    ae82:	6960      	ldr	r0, [r4, #20]
    ae84:	4632      	mov	r2, r6
    ae86:	4629      	mov	r1, r5
    ae88:	f7f9 f9b0 	bl	41ec <z_shell_fprintf_fmt>
    ae8c:	a901      	add	r1, sp, #4
    ae8e:	4620      	mov	r0, r4
    ae90:	f7f9 fbea 	bl	4668 <z_shell_vt100_colors_restore>
    ae94:	b003      	add	sp, #12
    ae96:	bdf0      	pop	{r4, r5, r6, r7, pc}
    ae98:	6960      	ldr	r0, [r4, #20]
    ae9a:	4632      	mov	r2, r6
    ae9c:	4629      	mov	r1, r5
    ae9e:	b003      	add	sp, #12
    aea0:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
    aea4:	f7f9 b9a2 	b.w	41ec <z_shell_fprintf_fmt>

0000aea8 <z_shell_fprintf>:
    aea8:	b40c      	push	{r2, r3}
    aeaa:	b507      	push	{r0, r1, r2, lr}
    aeac:	ab04      	add	r3, sp, #16
    aeae:	f853 2b04 	ldr.w	r2, [r3], #4
    aeb2:	9301      	str	r3, [sp, #4]
    aeb4:	f7ff ffd3 	bl	ae5e <z_shell_vfprintf>
    aeb8:	b003      	add	sp, #12
    aeba:	f85d eb04 	ldr.w	lr, [sp], #4
    aebe:	b002      	add	sp, #8
    aec0:	4770      	bx	lr

0000aec2 <data_insert>:
    aec2:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    aec6:	6887      	ldr	r7, [r0, #8]
    aec8:	8fbe      	ldrh	r6, [r7, #60]	; 0x3c
    aeca:	18b3      	adds	r3, r6, r2
    aecc:	2bff      	cmp	r3, #255	; 0xff
    aece:	4605      	mov	r5, r0
    aed0:	4688      	mov	r8, r1
    aed2:	4614      	mov	r4, r2
    aed4:	dc20      	bgt.n	af18 <data_insert+0x56>
    aed6:	8ffb      	ldrh	r3, [r7, #62]	; 0x3e
    aed8:	1af6      	subs	r6, r6, r3
    aeda:	3342      	adds	r3, #66	; 0x42
    aedc:	441f      	add	r7, r3
    aede:	b2b6      	uxth	r6, r6
    aee0:	4632      	mov	r2, r6
    aee2:	4639      	mov	r1, r7
    aee4:	1938      	adds	r0, r7, r4
    aee6:	f001 f927 	bl	c138 <memmove>
    aeea:	4622      	mov	r2, r4
    aeec:	4641      	mov	r1, r8
    aeee:	4638      	mov	r0, r7
    aef0:	f001 f914 	bl	c11c <memcpy>
    aef4:	68aa      	ldr	r2, [r5, #8]
    aef6:	8f93      	ldrh	r3, [r2, #60]	; 0x3c
    aef8:	4423      	add	r3, r4
    aefa:	8793      	strh	r3, [r2, #60]	; 0x3c
    aefc:	68ab      	ldr	r3, [r5, #8]
    aefe:	8f9a      	ldrh	r2, [r3, #60]	; 0x3c
    af00:	4413      	add	r3, r2
    af02:	2200      	movs	r2, #0
    af04:	f883 2042 	strb.w	r2, [r3, #66]	; 0x42
    af08:	68ab      	ldr	r3, [r5, #8]
    af0a:	f8d3 1260 	ldr.w	r1, [r3, #608]	; 0x260
    af0e:	0789      	lsls	r1, r1, #30
    af10:	d404      	bmi.n	af1c <data_insert+0x5a>
    af12:	8fda      	ldrh	r2, [r3, #62]	; 0x3e
    af14:	4414      	add	r4, r2
    af16:	87dc      	strh	r4, [r3, #62]	; 0x3e
    af18:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    af1c:	4631      	mov	r1, r6
    af1e:	4628      	mov	r0, r5
    af20:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    af24:	f7f9 bc1e 	b.w	4764 <reprint_from_cursor>

0000af28 <z_shell_op_completion_insert>:
    af28:	f7ff bfcb 	b.w	aec2 <data_insert>

0000af2c <z_shell_op_char_delete>:
    af2c:	b538      	push	{r3, r4, r5, lr}
    af2e:	4605      	mov	r5, r0
    af30:	6880      	ldr	r0, [r0, #8]
    af32:	8fc2      	ldrh	r2, [r0, #62]	; 0x3e
    af34:	8f84      	ldrh	r4, [r0, #60]	; 0x3c
    af36:	1aa4      	subs	r4, r4, r2
    af38:	b2a4      	uxth	r4, r4
    af3a:	b18c      	cbz	r4, af60 <z_shell_op_char_delete+0x34>
    af3c:	3242      	adds	r2, #66	; 0x42
    af3e:	4410      	add	r0, r2
    af40:	1c41      	adds	r1, r0, #1
    af42:	4622      	mov	r2, r4
    af44:	f001 f8f8 	bl	c138 <memmove>
    af48:	68aa      	ldr	r2, [r5, #8]
    af4a:	8f93      	ldrh	r3, [r2, #60]	; 0x3c
    af4c:	3b01      	subs	r3, #1
    af4e:	8793      	strh	r3, [r2, #60]	; 0x3c
    af50:	1e61      	subs	r1, r4, #1
    af52:	4628      	mov	r0, r5
    af54:	2201      	movs	r2, #1
    af56:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    af5a:	b289      	uxth	r1, r1
    af5c:	f7f9 bc02 	b.w	4764 <reprint_from_cursor>
    af60:	bd38      	pop	{r3, r4, r5, pc}

0000af62 <z_shell_op_char_backspace>:
    af62:	b510      	push	{r4, lr}
    af64:	6883      	ldr	r3, [r0, #8]
    af66:	8f9a      	ldrh	r2, [r3, #60]	; 0x3c
    af68:	4604      	mov	r4, r0
    af6a:	b152      	cbz	r2, af82 <z_shell_op_char_backspace+0x20>
    af6c:	8fdb      	ldrh	r3, [r3, #62]	; 0x3e
    af6e:	b143      	cbz	r3, af82 <z_shell_op_char_backspace+0x20>
    af70:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
    af74:	f7ff fec6 	bl	ad04 <z_shell_op_cursor_move>
    af78:	4620      	mov	r0, r4
    af7a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    af7e:	f7ff bfd5 	b.w	af2c <z_shell_op_char_delete>
    af82:	bd10      	pop	{r4, pc}

0000af84 <z_shell_raw_fprintf>:
    af84:	b40e      	push	{r1, r2, r3}
    af86:	b503      	push	{r0, r1, lr}
    af88:	aa03      	add	r2, sp, #12
    af8a:	f852 1b04 	ldr.w	r1, [r2], #4
    af8e:	9201      	str	r2, [sp, #4]
    af90:	f7f9 f92c 	bl	41ec <z_shell_fprintf_fmt>
    af94:	b002      	add	sp, #8
    af96:	f85d eb04 	ldr.w	lr, [sp], #4
    af9a:	b003      	add	sp, #12
    af9c:	4770      	bx	lr

0000af9e <cmd_shell_stats_reset>:
    af9e:	6983      	ldr	r3, [r0, #24]
    afa0:	2000      	movs	r0, #0
    afa2:	6018      	str	r0, [r3, #0]
    afa4:	4770      	bx	lr

0000afa6 <z_shell_raw_fprintf>:
    afa6:	b40e      	push	{r1, r2, r3}
    afa8:	b503      	push	{r0, r1, lr}
    afaa:	aa03      	add	r2, sp, #12
    afac:	f852 1b04 	ldr.w	r1, [r2], #4
    afb0:	9201      	str	r2, [sp, #4]
    afb2:	f7f9 f91b 	bl	41ec <z_shell_fprintf_fmt>
    afb6:	b002      	add	sp, #8
    afb8:	f85d eb04 	ldr.w	lr, [sp], #4
    afbc:	b003      	add	sp, #12
    afbe:	4770      	bx	lr

0000afc0 <cmd_bacskpace_mode_backspace>:
    afc0:	6883      	ldr	r3, [r0, #8]
    afc2:	f3bf 8f5b 	dmb	ish
    afc6:	f503 7318 	add.w	r3, r3, #608	; 0x260
    afca:	e853 1f00 	ldrex	r1, [r3]
    afce:	f021 0108 	bic.w	r1, r1, #8
    afd2:	e843 1200 	strex	r2, r1, [r3]
    afd6:	2a00      	cmp	r2, #0
    afd8:	d1f7      	bne.n	afca <cmd_bacskpace_mode_backspace+0xa>
    afda:	f3bf 8f5b 	dmb	ish
    afde:	2000      	movs	r0, #0
    afe0:	4770      	bx	lr

0000afe2 <cmd_bacskpace_mode_delete>:
    afe2:	6883      	ldr	r3, [r0, #8]
    afe4:	f3bf 8f5b 	dmb	ish
    afe8:	f503 7318 	add.w	r3, r3, #608	; 0x260
    afec:	e853 1f00 	ldrex	r1, [r3]
    aff0:	f041 0108 	orr.w	r1, r1, #8
    aff4:	e843 1200 	strex	r2, r1, [r3]
    aff8:	2a00      	cmp	r2, #0
    affa:	d1f7      	bne.n	afec <cmd_bacskpace_mode_delete+0xa>
    affc:	f3bf 8f5b 	dmb	ish
    b000:	2000      	movs	r0, #0
    b002:	4770      	bx	lr

0000b004 <cmd_echo_off>:
    b004:	6883      	ldr	r3, [r0, #8]
    b006:	f3bf 8f5b 	dmb	ish
    b00a:	f503 7318 	add.w	r3, r3, #608	; 0x260
    b00e:	e853 1f00 	ldrex	r1, [r3]
    b012:	f021 0102 	bic.w	r1, r1, #2
    b016:	e843 1200 	strex	r2, r1, [r3]
    b01a:	2a00      	cmp	r2, #0
    b01c:	d1f7      	bne.n	b00e <cmd_echo_off+0xa>
    b01e:	f3bf 8f5b 	dmb	ish
    b022:	2000      	movs	r0, #0
    b024:	4770      	bx	lr

0000b026 <cmd_colors_off>:
    b026:	6883      	ldr	r3, [r0, #8]
    b028:	f3bf 8f5b 	dmb	ish
    b02c:	f503 7318 	add.w	r3, r3, #608	; 0x260
    b030:	e853 1f00 	ldrex	r1, [r3]
    b034:	f021 0110 	bic.w	r1, r1, #16
    b038:	e843 1200 	strex	r2, r1, [r3]
    b03c:	2a00      	cmp	r2, #0
    b03e:	d1f7      	bne.n	b030 <cmd_colors_off+0xa>
    b040:	f3bf 8f5b 	dmb	ish
    b044:	2000      	movs	r0, #0
    b046:	4770      	bx	lr

0000b048 <cmd_colors_on>:
    b048:	6883      	ldr	r3, [r0, #8]
    b04a:	f3bf 8f5b 	dmb	ish
    b04e:	f503 7318 	add.w	r3, r3, #608	; 0x260
    b052:	e853 1f00 	ldrex	r1, [r3]
    b056:	f041 0110 	orr.w	r1, r1, #16
    b05a:	e843 1200 	strex	r2, r1, [r3]
    b05e:	2a00      	cmp	r2, #0
    b060:	d1f7      	bne.n	b052 <cmd_colors_on+0xa>
    b062:	f3bf 8f5b 	dmb	ish
    b066:	2000      	movs	r0, #0
    b068:	4770      	bx	lr

0000b06a <cmd_echo_on>:
    b06a:	6883      	ldr	r3, [r0, #8]
    b06c:	f3bf 8f5b 	dmb	ish
    b070:	f503 7318 	add.w	r3, r3, #608	; 0x260
    b074:	e853 1f00 	ldrex	r1, [r3]
    b078:	f041 0102 	orr.w	r1, r1, #2
    b07c:	e843 1200 	strex	r2, r1, [r3]
    b080:	2a00      	cmp	r2, #0
    b082:	d1f7      	bne.n	b074 <cmd_echo_on+0xa>
    b084:	f3bf 8f5b 	dmb	ish
    b088:	2000      	movs	r0, #0
    b08a:	4770      	bx	lr

0000b08c <remove_from_tail.part.0>:
    b08c:	b508      	push	{r3, lr}
    b08e:	6883      	ldr	r3, [r0, #8]
    b090:	e9d3 2100 	ldrd	r2, r1, [r3]
    b094:	600a      	str	r2, [r1, #0]
    b096:	6051      	str	r1, [r2, #4]
    b098:	2100      	movs	r1, #0
    b09a:	e9c3 1100 	strd	r1, r1, [r3]
    b09e:	891a      	ldrh	r2, [r3, #8]
    b0a0:	895b      	ldrh	r3, [r3, #10]
    b0a2:	6800      	ldr	r0, [r0, #0]
    b0a4:	441a      	add	r2, r3
    b0a6:	320c      	adds	r2, #12
    b0a8:	f7ff f971 	bl	a38e <ring_buf_get>
    b0ac:	2001      	movs	r0, #1
    b0ae:	bd08      	pop	{r3, pc}

0000b0b0 <z_shell_history_mode_exit>:
    b0b0:	2300      	movs	r3, #0
    b0b2:	60c3      	str	r3, [r0, #12]
    b0b4:	4770      	bx	lr

0000b0b6 <z_shell_history_get>:
    b0b6:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    b0b8:	461f      	mov	r7, r3
    b0ba:	4603      	mov	r3, r0
    b0bc:	4616      	mov	r6, r2
    b0be:	f853 4f04 	ldr.w	r4, [r3, #4]!
    b0c2:	429c      	cmp	r4, r3
    b0c4:	d102      	bne.n	b0cc <z_shell_history_get+0x16>
    b0c6:	2000      	movs	r0, #0
    b0c8:	8038      	strh	r0, [r7, #0]
    b0ca:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    b0cc:	68c5      	ldr	r5, [r0, #12]
    b0ce:	b9b1      	cbnz	r1, b0fe <z_shell_history_get+0x48>
    b0d0:	2d00      	cmp	r5, #0
    b0d2:	d0f8      	beq.n	b0c6 <z_shell_history_get+0x10>
    b0d4:	42a5      	cmp	r5, r4
    b0d6:	d102      	bne.n	b0de <z_shell_history_get+0x28>
    b0d8:	2300      	movs	r3, #0
    b0da:	60c3      	str	r3, [r0, #12]
    b0dc:	e7f3      	b.n	b0c6 <z_shell_history_get+0x10>
    b0de:	686c      	ldr	r4, [r5, #4]
    b0e0:	60c4      	str	r4, [r0, #12]
    b0e2:	2c00      	cmp	r4, #0
    b0e4:	d0ef      	beq.n	b0c6 <z_shell_history_get+0x10>
    b0e6:	8922      	ldrh	r2, [r4, #8]
    b0e8:	f104 010c 	add.w	r1, r4, #12
    b0ec:	4630      	mov	r0, r6
    b0ee:	f001 f815 	bl	c11c <memcpy>
    b0f2:	8923      	ldrh	r3, [r4, #8]
    b0f4:	803b      	strh	r3, [r7, #0]
    b0f6:	2200      	movs	r2, #0
    b0f8:	54f2      	strb	r2, [r6, r3]
    b0fa:	2001      	movs	r0, #1
    b0fc:	e7e5      	b.n	b0ca <z_shell_history_get+0x14>
    b0fe:	2d00      	cmp	r5, #0
    b100:	d0ee      	beq.n	b0e0 <z_shell_history_get+0x2a>
    b102:	6883      	ldr	r3, [r0, #8]
    b104:	429d      	cmp	r5, r3
    b106:	d0e7      	beq.n	b0d8 <z_shell_history_get+0x22>
    b108:	682c      	ldr	r4, [r5, #0]
    b10a:	e7e9      	b.n	b0e0 <z_shell_history_get+0x2a>

0000b10c <z_shell_history_purge>:
    b10c:	b538      	push	{r3, r4, r5, lr}
    b10e:	4604      	mov	r4, r0
    b110:	1d05      	adds	r5, r0, #4
    b112:	6863      	ldr	r3, [r4, #4]
    b114:	42ab      	cmp	r3, r5
    b116:	d004      	beq.n	b122 <z_shell_history_purge+0x16>
    b118:	4620      	mov	r0, r4
    b11a:	f7ff ffb7 	bl	b08c <remove_from_tail.part.0>
    b11e:	2800      	cmp	r0, #0
    b120:	d1f7      	bne.n	b112 <z_shell_history_purge+0x6>
    b122:	bd38      	pop	{r3, r4, r5, pc}

0000b124 <z_shell_history_put>:
    b124:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b128:	f102 050c 	add.w	r5, r2, #12
    b12c:	6803      	ldr	r3, [r0, #0]
    b12e:	f1c5 0900 	rsb	r9, r5, #0
    b132:	69db      	ldr	r3, [r3, #28]
    b134:	f009 0903 	and.w	r9, r9, #3
    b138:	b085      	sub	sp, #20
    b13a:	444d      	add	r5, r9
    b13c:	429d      	cmp	r5, r3
    b13e:	4604      	mov	r4, r0
    b140:	9101      	str	r1, [sp, #4]
    b142:	4617      	mov	r7, r2
    b144:	d810      	bhi.n	b168 <z_shell_history_put+0x44>
    b146:	2300      	movs	r3, #0
    b148:	60c3      	str	r3, [r0, #12]
    b14a:	b16a      	cbz	r2, b168 <z_shell_history_put+0x44>
    b14c:	6846      	ldr	r6, [r0, #4]
    b14e:	f100 0a04 	add.w	sl, r0, #4
    b152:	45b2      	cmp	sl, r6
    b154:	d00b      	beq.n	b16e <z_shell_history_put+0x4a>
    b156:	b15e      	cbz	r6, b170 <z_shell_history_put+0x4c>
    b158:	8933      	ldrh	r3, [r6, #8]
    b15a:	4293      	cmp	r3, r2
    b15c:	d108      	bne.n	b170 <z_shell_history_put+0x4c>
    b15e:	f106 000c 	add.w	r0, r6, #12
    b162:	f000 ffcb 	bl	c0fc <memcmp>
    b166:	b918      	cbnz	r0, b170 <z_shell_history_put+0x4c>
    b168:	b005      	add	sp, #20
    b16a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b16e:	461e      	mov	r6, r3
    b170:	f04f 0800 	mov.w	r8, #0
    b174:	6823      	ldr	r3, [r4, #0]
    b176:	6919      	ldr	r1, [r3, #16]
    b178:	689a      	ldr	r2, [r3, #8]
    b17a:	4291      	cmp	r1, r2
    b17c:	bf01      	itttt	eq
    b17e:	e9c3 8802 	strdeq	r8, r8, [r3, #8]
    b182:	e9c3 8805 	strdeq	r8, r8, [r3, #20]
    b186:	f8c3 8004 	streq.w	r8, [r3, #4]
    b18a:	f8c3 8010 	streq.w	r8, [r3, #16]
    b18e:	6820      	ldr	r0, [r4, #0]
    b190:	462a      	mov	r2, r5
    b192:	a903      	add	r1, sp, #12
    b194:	f7ff f873 	bl	a27e <ring_buf_put_claim>
    b198:	4285      	cmp	r5, r0
    b19a:	4683      	mov	fp, r0
    b19c:	d91e      	bls.n	b1dc <z_shell_history_put+0xb8>
    b19e:	6820      	ldr	r0, [r4, #0]
    b1a0:	462a      	mov	r2, r5
    b1a2:	a903      	add	r1, sp, #12
    b1a4:	f7ff f86b 	bl	a27e <ring_buf_put_claim>
    b1a8:	4285      	cmp	r5, r0
    b1aa:	d118      	bne.n	b1de <z_shell_history_put+0xba>
    b1ac:	8972      	ldrh	r2, [r6, #10]
    b1ae:	445a      	add	r2, fp
    b1b0:	8172      	strh	r2, [r6, #10]
    b1b2:	44ab      	add	fp, r5
    b1b4:	9d03      	ldr	r5, [sp, #12]
    b1b6:	9901      	ldr	r1, [sp, #4]
    b1b8:	812f      	strh	r7, [r5, #8]
    b1ba:	463a      	mov	r2, r7
    b1bc:	f8a5 900a 	strh.w	r9, [r5, #10]
    b1c0:	f105 000c 	add.w	r0, r5, #12
    b1c4:	f000 ffaa 	bl	c11c <memcpy>
    b1c8:	6862      	ldr	r2, [r4, #4]
    b1ca:	e9c5 2a00 	strd	r2, sl, [r5]
    b1ce:	6055      	str	r5, [r2, #4]
    b1d0:	6820      	ldr	r0, [r4, #0]
    b1d2:	6065      	str	r5, [r4, #4]
    b1d4:	4659      	mov	r1, fp
    b1d6:	f7ff f871 	bl	a2bc <ring_buf_put_finish>
    b1da:	e7c5      	b.n	b168 <z_shell_history_put+0x44>
    b1dc:	d0ea      	beq.n	b1b4 <z_shell_history_put+0x90>
    b1de:	6820      	ldr	r0, [r4, #0]
    b1e0:	2100      	movs	r1, #0
    b1e2:	f7ff f86b 	bl	a2bc <ring_buf_put_finish>
    b1e6:	6863      	ldr	r3, [r4, #4]
    b1e8:	459a      	cmp	sl, r3
    b1ea:	d0c3      	beq.n	b174 <z_shell_history_put+0x50>
    b1ec:	4620      	mov	r0, r4
    b1ee:	f7ff ff4d 	bl	b08c <remove_from_tail.part.0>
    b1f2:	e7bf      	b.n	b174 <z_shell_history_put+0x50>

0000b1f4 <z_shell_history_init>:
    b1f4:	1d03      	adds	r3, r0, #4
    b1f6:	e9c0 3301 	strd	r3, r3, [r0, #4]
    b1fa:	2300      	movs	r3, #0
    b1fc:	60c3      	str	r3, [r0, #12]
    b1fe:	4770      	bx	lr

0000b200 <z_shell_has_wildcard>:
    b200:	b510      	push	{r4, lr}
    b202:	4604      	mov	r4, r0
    b204:	b128      	cbz	r0, b212 <z_shell_has_wildcard+0x12>
    b206:	f7f6 fc59 	bl	1abc <strlen>
    b20a:	2300      	movs	r3, #0
    b20c:	b280      	uxth	r0, r0
    b20e:	4298      	cmp	r0, r3
    b210:	d801      	bhi.n	b216 <z_shell_has_wildcard+0x16>
    b212:	2000      	movs	r0, #0
    b214:	bd10      	pop	{r4, pc}
    b216:	5ce2      	ldrb	r2, [r4, r3]
    b218:	2a3f      	cmp	r2, #63	; 0x3f
    b21a:	d003      	beq.n	b224 <z_shell_has_wildcard+0x24>
    b21c:	2a2a      	cmp	r2, #42	; 0x2a
    b21e:	d001      	beq.n	b224 <z_shell_has_wildcard+0x24>
    b220:	3301      	adds	r3, #1
    b222:	e7f4      	b.n	b20e <z_shell_has_wildcard+0xe>
    b224:	2001      	movs	r0, #1
    b226:	e7f5      	b.n	b214 <z_shell_has_wildcard+0x14>

0000b228 <z_shell_wildcard_prepare>:
    b228:	b510      	push	{r4, lr}
    b22a:	4604      	mov	r4, r0
    b22c:	6880      	ldr	r0, [r0, #8]
    b22e:	f44f 7280 	mov.w	r2, #256	; 0x100
    b232:	2100      	movs	r1, #0
    b234:	f500 70a1 	add.w	r0, r0, #322	; 0x142
    b238:	f000 ff98 	bl	c16c <memset>
    b23c:	68a0      	ldr	r0, [r4, #8]
    b23e:	8f82      	ldrh	r2, [r0, #60]	; 0x3c
    b240:	f100 0142 	add.w	r1, r0, #66	; 0x42
    b244:	f500 70a1 	add.w	r0, r0, #322	; 0x142
    b248:	f000 ff68 	bl	c11c <memcpy>
    b24c:	68a0      	ldr	r0, [r4, #8]
    b24e:	f500 70a1 	add.w	r0, r0, #322	; 0x142
    b252:	f7f9 f8f9 	bl	4448 <z_shell_spaces_trim>
    b256:	68a0      	ldr	r0, [r4, #8]
    b258:	f500 70a1 	add.w	r0, r0, #322	; 0x142
    b25c:	f7f6 fc2e 	bl	1abc <strlen>
    b260:	68a3      	ldr	r3, [r4, #8]
    b262:	3001      	adds	r0, #1
    b264:	f8a3 0040 	strh.w	r0, [r3, #64]	; 0x40
    b268:	bd10      	pop	{r4, pc}

0000b26a <z_shell_wildcard_finalize>:
    b26a:	b510      	push	{r4, lr}
    b26c:	4604      	mov	r4, r0
    b26e:	6880      	ldr	r0, [r0, #8]
    b270:	f8b0 2040 	ldrh.w	r2, [r0, #64]	; 0x40
    b274:	f500 71a1 	add.w	r1, r0, #322	; 0x142
    b278:	3042      	adds	r0, #66	; 0x42
    b27a:	f000 ff4f 	bl	c11c <memcpy>
    b27e:	68a3      	ldr	r3, [r4, #8]
    b280:	f8b3 2040 	ldrh.w	r2, [r3, #64]	; 0x40
    b284:	879a      	strh	r2, [r3, #60]	; 0x3c
    b286:	bd10      	pop	{r4, pc}

0000b288 <abort_function>:
    b288:	b508      	push	{r3, lr}
    b28a:	2000      	movs	r0, #0
    b28c:	f7f7 fbb2 	bl	29f4 <sys_reboot>

0000b290 <z_arm_fatal_error>:
    b290:	f000 bbda 	b.w	ba48 <z_fatal_error>

0000b294 <z_do_kernel_oops>:
    b294:	4601      	mov	r1, r0
    b296:	6800      	ldr	r0, [r0, #0]
    b298:	f000 bbd6 	b.w	ba48 <z_fatal_error>

0000b29c <z_irq_spurious>:
    b29c:	2100      	movs	r1, #0
    b29e:	2001      	movs	r0, #1
    b2a0:	f7ff bff6 	b.w	b290 <z_arm_fatal_error>

0000b2a4 <z_arm_nmi>:
    b2a4:	b508      	push	{r3, lr}
    b2a6:	f7fa f875 	bl	5394 <z_SysNmiOnReset>
    b2aa:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    b2ae:	f7fa b953 	b.w	5558 <z_arm_exc_exit>

0000b2b2 <malloc_prepare>:
    b2b2:	2000      	movs	r0, #0
    b2b4:	4770      	bx	lr

0000b2b6 <_stdout_hook_default>:
    b2b6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    b2ba:	4770      	bx	lr

0000b2bc <_stdin_hook_default>:
    b2bc:	2000      	movs	r0, #0
    b2be:	4770      	bx	lr

0000b2c0 <_read>:
    b2c0:	4608      	mov	r0, r1
    b2c2:	4611      	mov	r1, r2
    b2c4:	f7fa bbca 	b.w	5a5c <z_impl_zephyr_read_stdin>

0000b2c8 <_write>:
    b2c8:	4608      	mov	r0, r1
    b2ca:	4611      	mov	r1, r2
    b2cc:	f7fa bbda 	b.w	5a84 <z_impl_zephyr_write_stdout>

0000b2d0 <_close>:
    b2d0:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    b2d4:	4770      	bx	lr

0000b2d6 <_lseek>:
    b2d6:	2000      	movs	r0, #0
    b2d8:	4770      	bx	lr

0000b2da <_isatty>:
    b2da:	2802      	cmp	r0, #2
    b2dc:	bfcc      	ite	gt
    b2de:	2000      	movgt	r0, #0
    b2e0:	2001      	movle	r0, #1
    b2e2:	4770      	bx	lr

0000b2e4 <_kill>:
    b2e4:	2000      	movs	r0, #0
    b2e6:	4770      	bx	lr

0000b2e8 <_getpid>:
    b2e8:	2000      	movs	r0, #0
    b2ea:	4770      	bx	lr

0000b2ec <_fstat>:
    b2ec:	f44f 5300 	mov.w	r3, #8192	; 0x2000
    b2f0:	604b      	str	r3, [r1, #4]
    b2f2:	2000      	movs	r0, #0
    b2f4:	4770      	bx	lr

0000b2f6 <__retarget_lock_init_recursive>:
    b2f6:	b510      	push	{r4, lr}
    b2f8:	4604      	mov	r4, r0
    b2fa:	2014      	movs	r0, #20
    b2fc:	f7fd fc60 	bl	8bc0 <malloc>
    b300:	6020      	str	r0, [r4, #0]
    b302:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    b306:	f000 bc36 	b.w	bb76 <z_impl_k_mutex_init>

0000b30a <__retarget_lock_acquire_recursive>:
    b30a:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
    b30e:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
    b312:	f7fc bcad 	b.w	7c70 <z_impl_k_mutex_lock>

0000b316 <__retarget_lock_release_recursive>:
    b316:	f7fc bd25 	b.w	7d64 <z_impl_k_mutex_unlock>

0000b31a <__errno>:
    b31a:	f7fc b9cb 	b.w	76b4 <z_impl_z_errno>

0000b31e <pm_state_set>:
    b31e:	2806      	cmp	r0, #6
    b320:	d108      	bne.n	b334 <pm_state_set+0x16>
    b322:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    b326:	2201      	movs	r2, #1
    b328:	f8c3 2500 	str.w	r2, [r3, #1280]	; 0x500
    b32c:	f3bf 8f4f 	dsb	sy
    b330:	bf20      	wfe
    b332:	e7fd      	b.n	b330 <pm_state_set+0x12>
    b334:	4770      	bx	lr

0000b336 <pm_state_exit_post_ops>:
    b336:	2300      	movs	r3, #0
    b338:	f383 8811 	msr	BASEPRI, r3
    b33c:	f3bf 8f6f 	isb	sy
    b340:	4770      	bx	lr

0000b342 <get_status>:
    b342:	6903      	ldr	r3, [r0, #16]
    b344:	b2c9      	uxtb	r1, r1
    b346:	220c      	movs	r2, #12
    b348:	fb01 3302 	mla	r3, r1, r2, r3
    b34c:	6c18      	ldr	r0, [r3, #64]	; 0x40
    b34e:	f000 0007 	and.w	r0, r0, #7
    b352:	4770      	bx	lr

0000b354 <set_on_state>:
    b354:	f04f 0320 	mov.w	r3, #32
    b358:	f3ef 8211 	mrs	r2, BASEPRI
    b35c:	f383 8812 	msr	BASEPRI_MAX, r3
    b360:	f3bf 8f6f 	isb	sy
    b364:	6803      	ldr	r3, [r0, #0]
    b366:	f003 03c0 	and.w	r3, r3, #192	; 0xc0
    b36a:	f043 0302 	orr.w	r3, r3, #2
    b36e:	6003      	str	r3, [r0, #0]
    b370:	f382 8811 	msr	BASEPRI, r2
    b374:	f3bf 8f6f 	isb	sy
    b378:	4770      	bx	lr

0000b37a <stop>:
    b37a:	b570      	push	{r4, r5, r6, lr}
    b37c:	b2c9      	uxtb	r1, r1
    b37e:	6903      	ldr	r3, [r0, #16]
    b380:	f04f 0420 	mov.w	r4, #32
    b384:	f3ef 8511 	mrs	r5, BASEPRI
    b388:	f384 8812 	msr	BASEPRI_MAX, r4
    b38c:	f3bf 8f6f 	isb	sy
    b390:	260c      	movs	r6, #12
    b392:	fb06 3401 	mla	r4, r6, r1, r3
    b396:	6c24      	ldr	r4, [r4, #64]	; 0x40
    b398:	f014 04c0 	ands.w	r4, r4, #192	; 0xc0
    b39c:	d008      	beq.n	b3b0 <stop+0x36>
    b39e:	42a2      	cmp	r2, r4
    b3a0:	d006      	beq.n	b3b0 <stop+0x36>
    b3a2:	f385 8811 	msr	BASEPRI, r5
    b3a6:	f3bf 8f6f 	isb	sy
    b3aa:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    b3ae:	bd70      	pop	{r4, r5, r6, pc}
    b3b0:	fb06 3301 	mla	r3, r6, r1, r3
    b3b4:	2201      	movs	r2, #1
    b3b6:	641a      	str	r2, [r3, #64]	; 0x40
    b3b8:	f385 8811 	msr	BASEPRI, r5
    b3bc:	f3bf 8f6f 	isb	sy
    b3c0:	6843      	ldr	r3, [r0, #4]
    b3c2:	eb03 03c1 	add.w	r3, r3, r1, lsl #3
    b3c6:	685b      	ldr	r3, [r3, #4]
    b3c8:	4798      	blx	r3
    b3ca:	2000      	movs	r0, #0
    b3cc:	e7ef      	b.n	b3ae <stop+0x34>

0000b3ce <api_stop>:
    b3ce:	2280      	movs	r2, #128	; 0x80
    b3d0:	f7ff bfd3 	b.w	b37a <stop>

0000b3d4 <async_start>:
    b3d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    b3d6:	9f06      	ldr	r7, [sp, #24]
    b3d8:	6904      	ldr	r4, [r0, #16]
    b3da:	b2c9      	uxtb	r1, r1
    b3dc:	f04f 0520 	mov.w	r5, #32
    b3e0:	f3ef 8611 	mrs	r6, BASEPRI
    b3e4:	f385 8812 	msr	BASEPRI_MAX, r5
    b3e8:	f3bf 8f6f 	isb	sy
    b3ec:	250c      	movs	r5, #12
    b3ee:	fb05 4401 	mla	r4, r5, r1, r4
    b3f2:	6c25      	ldr	r5, [r4, #64]	; 0x40
    b3f4:	f005 0c07 	and.w	ip, r5, #7
    b3f8:	f1bc 0f01 	cmp.w	ip, #1
    b3fc:	d10c      	bne.n	b418 <async_start+0x44>
    b3fe:	6427      	str	r7, [r4, #64]	; 0x40
    b400:	f386 8811 	msr	BASEPRI, r6
    b404:	f3bf 8f6f 	isb	sy
    b408:	e9c4 230e 	strd	r2, r3, [r4, #56]	; 0x38
    b40c:	6843      	ldr	r3, [r0, #4]
    b40e:	f853 3031 	ldr.w	r3, [r3, r1, lsl #3]
    b412:	4798      	blx	r3
    b414:	2000      	movs	r0, #0
    b416:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    b418:	f005 05c0 	and.w	r5, r5, #192	; 0xc0
    b41c:	42af      	cmp	r7, r5
    b41e:	f386 8811 	msr	BASEPRI, r6
    b422:	f3bf 8f6f 	isb	sy
    b426:	bf0c      	ite	eq
    b428:	f06f 0077 	mvneq.w	r0, #119	; 0x77
    b42c:	f04f 30ff 	movne.w	r0, #4294967295	; 0xffffffff
    b430:	e7f1      	b.n	b416 <async_start+0x42>

0000b432 <api_start>:
    b432:	b513      	push	{r0, r1, r4, lr}
    b434:	2480      	movs	r4, #128	; 0x80
    b436:	9400      	str	r4, [sp, #0]
    b438:	f7ff ffcc 	bl	b3d4 <async_start>
    b43c:	b002      	add	sp, #8
    b43e:	bd10      	pop	{r4, pc}

0000b440 <onoff_started_callback>:
    b440:	b410      	push	{r4}
    b442:	6900      	ldr	r0, [r0, #16]
    b444:	b2cb      	uxtb	r3, r1
    b446:	241c      	movs	r4, #28
    b448:	fb03 0004 	mla	r0, r3, r4, r0
    b44c:	2100      	movs	r1, #0
    b44e:	bc10      	pop	{r4}
    b450:	4710      	bx	r2

0000b452 <lfclk_start>:
    b452:	2000      	movs	r0, #0
    b454:	f000 ba37 	b.w	b8c6 <nrfx_clock_start>

0000b458 <lfclk_stop>:
    b458:	2000      	movs	r0, #0
    b45a:	f000 ba70 	b.w	b93e <nrfx_clock_stop>

0000b45e <blocking_start_callback>:
    b45e:	4610      	mov	r0, r2
    b460:	f7fc bcbe 	b.w	7de0 <z_impl_k_sem_give>

0000b464 <gpio_nrfx_port_get_raw>:
    b464:	6843      	ldr	r3, [r0, #4]
    b466:	685b      	ldr	r3, [r3, #4]
    b468:	f8d3 3510 	ldr.w	r3, [r3, #1296]	; 0x510
    b46c:	600b      	str	r3, [r1, #0]
    b46e:	2000      	movs	r0, #0
    b470:	4770      	bx	lr

0000b472 <gpio_nrfx_port_set_masked_raw>:
    b472:	6843      	ldr	r3, [r0, #4]
    b474:	685b      	ldr	r3, [r3, #4]
    b476:	ea02 0001 	and.w	r0, r2, r1
    b47a:	ea21 0102 	bic.w	r1, r1, r2
    b47e:	f8c3 0508 	str.w	r0, [r3, #1288]	; 0x508
    b482:	f8c3 150c 	str.w	r1, [r3, #1292]	; 0x50c
    b486:	2000      	movs	r0, #0
    b488:	4770      	bx	lr

0000b48a <gpio_nrfx_port_set_bits_raw>:
    b48a:	6843      	ldr	r3, [r0, #4]
    b48c:	685b      	ldr	r3, [r3, #4]
    b48e:	2000      	movs	r0, #0
    b490:	f8c3 1508 	str.w	r1, [r3, #1288]	; 0x508
    b494:	4770      	bx	lr

0000b496 <gpio_nrfx_port_clear_bits_raw>:
    b496:	6843      	ldr	r3, [r0, #4]
    b498:	685b      	ldr	r3, [r3, #4]
    b49a:	2000      	movs	r0, #0
    b49c:	f8c3 150c 	str.w	r1, [r3, #1292]	; 0x50c
    b4a0:	4770      	bx	lr

0000b4a2 <gpio_nrfx_port_toggle_bits>:
    b4a2:	6843      	ldr	r3, [r0, #4]
    b4a4:	685a      	ldr	r2, [r3, #4]
    b4a6:	f8d2 3504 	ldr.w	r3, [r2, #1284]	; 0x504
    b4aa:	ea21 0003 	bic.w	r0, r1, r3
    b4ae:	400b      	ands	r3, r1
    b4b0:	f8c2 0508 	str.w	r0, [r2, #1288]	; 0x508
    b4b4:	f8c2 350c 	str.w	r3, [r2, #1292]	; 0x50c
    b4b8:	2000      	movs	r0, #0
    b4ba:	4770      	bx	lr

0000b4bc <gpio_nrfx_manage_callback>:
    b4bc:	b510      	push	{r4, lr}
    b4be:	6903      	ldr	r3, [r0, #16]
    b4c0:	6858      	ldr	r0, [r3, #4]
    b4c2:	b1f8      	cbz	r0, b504 <gpio_nrfx_manage_callback+0x48>
    b4c4:	4288      	cmp	r0, r1
    b4c6:	d119      	bne.n	b4fc <gpio_nrfx_manage_callback+0x40>
    b4c8:	689c      	ldr	r4, [r3, #8]
    b4ca:	6808      	ldr	r0, [r1, #0]
    b4cc:	6058      	str	r0, [r3, #4]
    b4ce:	42a1      	cmp	r1, r4
    b4d0:	d100      	bne.n	b4d4 <gpio_nrfx_manage_callback+0x18>
    b4d2:	6098      	str	r0, [r3, #8]
    b4d4:	2000      	movs	r0, #0
    b4d6:	6008      	str	r0, [r1, #0]
    b4d8:	b12a      	cbz	r2, b4e6 <gpio_nrfx_manage_callback+0x2a>
    b4da:	685a      	ldr	r2, [r3, #4]
    b4dc:	600a      	str	r2, [r1, #0]
    b4de:	689a      	ldr	r2, [r3, #8]
    b4e0:	6059      	str	r1, [r3, #4]
    b4e2:	b902      	cbnz	r2, b4e6 <gpio_nrfx_manage_callback+0x2a>
    b4e4:	6099      	str	r1, [r3, #8]
    b4e6:	2000      	movs	r0, #0
    b4e8:	e010      	b.n	b50c <gpio_nrfx_manage_callback+0x50>
    b4ea:	4281      	cmp	r1, r0
    b4ec:	d106      	bne.n	b4fc <gpio_nrfx_manage_callback+0x40>
    b4ee:	6808      	ldr	r0, [r1, #0]
    b4f0:	6020      	str	r0, [r4, #0]
    b4f2:	6898      	ldr	r0, [r3, #8]
    b4f4:	4281      	cmp	r1, r0
    b4f6:	d1ed      	bne.n	b4d4 <gpio_nrfx_manage_callback+0x18>
    b4f8:	609c      	str	r4, [r3, #8]
    b4fa:	e7eb      	b.n	b4d4 <gpio_nrfx_manage_callback+0x18>
    b4fc:	4604      	mov	r4, r0
    b4fe:	6800      	ldr	r0, [r0, #0]
    b500:	2800      	cmp	r0, #0
    b502:	d1f2      	bne.n	b4ea <gpio_nrfx_manage_callback+0x2e>
    b504:	2a00      	cmp	r2, #0
    b506:	d1e8      	bne.n	b4da <gpio_nrfx_manage_callback+0x1e>
    b508:	f06f 0015 	mvn.w	r0, #21
    b50c:	bd10      	pop	{r4, pc}

0000b50e <uarte_nrfx_config_get>:
    b50e:	6902      	ldr	r2, [r0, #16]
    b510:	460b      	mov	r3, r1
    b512:	e9d2 0101 	ldrd	r0, r1, [r2, #4]
    b516:	e883 0003 	stmia.w	r3, {r0, r1}
    b51a:	2000      	movs	r0, #0
    b51c:	4770      	bx	lr

0000b51e <uarte_nrfx_err_check>:
    b51e:	6843      	ldr	r3, [r0, #4]
    b520:	681b      	ldr	r3, [r3, #0]
    b522:	f8d3 0480 	ldr.w	r0, [r3, #1152]	; 0x480
    b526:	f8c3 0480 	str.w	r0, [r3, #1152]	; 0x480
    b52a:	4770      	bx	lr

0000b52c <tx_start>:
    b52c:	b510      	push	{r4, lr}
    b52e:	6844      	ldr	r4, [r0, #4]
    b530:	6823      	ldr	r3, [r4, #0]
    b532:	f8c3 1544 	str.w	r1, [r3, #1348]	; 0x544
    b536:	f8c3 2548 	str.w	r2, [r3, #1352]	; 0x548
    b53a:	2200      	movs	r2, #0
    b53c:	f8c3 2120 	str.w	r2, [r3, #288]	; 0x120
    b540:	f8d3 1120 	ldr.w	r1, [r3, #288]	; 0x120
    b544:	f8c3 2158 	str.w	r2, [r3, #344]	; 0x158
    b548:	f8d3 2158 	ldr.w	r2, [r3, #344]	; 0x158
    b54c:	6862      	ldr	r2, [r4, #4]
    b54e:	06d2      	lsls	r2, r2, #27
    b550:	d508      	bpl.n	b564 <tx_start+0x38>
    b552:	6842      	ldr	r2, [r0, #4]
    b554:	6812      	ldr	r2, [r2, #0]
    b556:	2108      	movs	r1, #8
    b558:	f8c2 1500 	str.w	r1, [r2, #1280]	; 0x500
    b55c:	f44f 0280 	mov.w	r2, #4194304	; 0x400000
    b560:	f8c3 2304 	str.w	r2, [r3, #772]	; 0x304
    b564:	2201      	movs	r2, #1
    b566:	609a      	str	r2, [r3, #8]
    b568:	bd10      	pop	{r4, pc}

0000b56a <uarte_nrfx_poll_in>:
    b56a:	6843      	ldr	r3, [r0, #4]
    b56c:	6902      	ldr	r2, [r0, #16]
    b56e:	681b      	ldr	r3, [r3, #0]
    b570:	f8d3 0110 	ldr.w	r0, [r3, #272]	; 0x110
    b574:	b150      	cbz	r0, b58c <uarte_nrfx_poll_in+0x22>
    b576:	6992      	ldr	r2, [r2, #24]
    b578:	2000      	movs	r0, #0
    b57a:	7812      	ldrb	r2, [r2, #0]
    b57c:	700a      	strb	r2, [r1, #0]
    b57e:	f8c3 0110 	str.w	r0, [r3, #272]	; 0x110
    b582:	f8d3 2110 	ldr.w	r2, [r3, #272]	; 0x110
    b586:	2201      	movs	r2, #1
    b588:	601a      	str	r2, [r3, #0]
    b58a:	4770      	bx	lr
    b58c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    b590:	4770      	bx	lr

0000b592 <uarte_nrfx_fifo_read>:
    b592:	2a00      	cmp	r2, #0
    b594:	b510      	push	{r4, lr}
    b596:	4604      	mov	r4, r0
    b598:	dd10      	ble.n	b5bc <uarte_nrfx_fifo_read+0x2a>
    b59a:	6843      	ldr	r3, [r0, #4]
    b59c:	681b      	ldr	r3, [r3, #0]
    b59e:	f8d3 0110 	ldr.w	r0, [r3, #272]	; 0x110
    b5a2:	b150      	cbz	r0, b5ba <uarte_nrfx_fifo_read+0x28>
    b5a4:	6922      	ldr	r2, [r4, #16]
    b5a6:	2000      	movs	r0, #0
    b5a8:	f8c3 0110 	str.w	r0, [r3, #272]	; 0x110
    b5ac:	6992      	ldr	r2, [r2, #24]
    b5ae:	f8d3 0110 	ldr.w	r0, [r3, #272]	; 0x110
    b5b2:	7812      	ldrb	r2, [r2, #0]
    b5b4:	700a      	strb	r2, [r1, #0]
    b5b6:	2001      	movs	r0, #1
    b5b8:	6018      	str	r0, [r3, #0]
    b5ba:	bd10      	pop	{r4, pc}
    b5bc:	2000      	movs	r0, #0
    b5be:	e7fc      	b.n	b5ba <uarte_nrfx_fifo_read+0x28>

0000b5c0 <uarte_nrfx_irq_tx_enable>:
    b5c0:	6843      	ldr	r3, [r0, #4]
    b5c2:	6901      	ldr	r1, [r0, #16]
    b5c4:	681a      	ldr	r2, [r3, #0]
    b5c6:	f04f 0020 	mov.w	r0, #32
    b5ca:	f3ef 8311 	mrs	r3, BASEPRI
    b5ce:	f380 8812 	msr	BASEPRI_MAX, r0
    b5d2:	f3bf 8f6f 	isb	sy
    b5d6:	68c9      	ldr	r1, [r1, #12]
    b5d8:	2000      	movs	r0, #0
    b5da:	7388      	strb	r0, [r1, #14]
    b5dc:	f44f 0180 	mov.w	r1, #4194304	; 0x400000
    b5e0:	f8c2 1304 	str.w	r1, [r2, #772]	; 0x304
    b5e4:	f383 8811 	msr	BASEPRI, r3
    b5e8:	f3bf 8f6f 	isb	sy
    b5ec:	4770      	bx	lr

0000b5ee <uarte_nrfx_irq_tx_disable>:
    b5ee:	6903      	ldr	r3, [r0, #16]
    b5f0:	68db      	ldr	r3, [r3, #12]
    b5f2:	2201      	movs	r2, #1
    b5f4:	739a      	strb	r2, [r3, #14]
    b5f6:	4770      	bx	lr

0000b5f8 <uarte_nrfx_irq_tx_ready_complete>:
    b5f8:	6903      	ldr	r3, [r0, #16]
    b5fa:	68db      	ldr	r3, [r3, #12]
    b5fc:	7b9a      	ldrb	r2, [r3, #14]
    b5fe:	f002 01ff 	and.w	r1, r2, #255	; 0xff
    b602:	b962      	cbnz	r2, b61e <uarte_nrfx_irq_tx_ready_complete+0x26>
    b604:	6842      	ldr	r2, [r0, #4]
    b606:	6812      	ldr	r2, [r2, #0]
    b608:	f8d2 0158 	ldr.w	r0, [r2, #344]	; 0x158
    b60c:	b140      	cbz	r0, b620 <uarte_nrfx_irq_tx_ready_complete+0x28>
    b60e:	f8d2 0304 	ldr.w	r0, [r2, #772]	; 0x304
    b612:	f410 0080 	ands.w	r0, r0, #4194304	; 0x400000
    b616:	d003      	beq.n	b620 <uarte_nrfx_irq_tx_ready_complete+0x28>
    b618:	6119      	str	r1, [r3, #16]
    b61a:	2001      	movs	r0, #1
    b61c:	4770      	bx	lr
    b61e:	2000      	movs	r0, #0
    b620:	4770      	bx	lr

0000b622 <uarte_nrfx_irq_rx_ready>:
    b622:	6843      	ldr	r3, [r0, #4]
    b624:	681b      	ldr	r3, [r3, #0]
    b626:	f8d3 0110 	ldr.w	r0, [r3, #272]	; 0x110
    b62a:	3800      	subs	r0, #0
    b62c:	bf18      	it	ne
    b62e:	2001      	movne	r0, #1
    b630:	4770      	bx	lr

0000b632 <uarte_nrfx_irq_rx_enable>:
    b632:	6843      	ldr	r3, [r0, #4]
    b634:	681b      	ldr	r3, [r3, #0]
    b636:	2210      	movs	r2, #16
    b638:	f8c3 2304 	str.w	r2, [r3, #772]	; 0x304
    b63c:	4770      	bx	lr

0000b63e <uarte_nrfx_irq_rx_disable>:
    b63e:	6843      	ldr	r3, [r0, #4]
    b640:	681b      	ldr	r3, [r3, #0]
    b642:	2210      	movs	r2, #16
    b644:	f8c3 2308 	str.w	r2, [r3, #776]	; 0x308
    b648:	4770      	bx	lr

0000b64a <uarte_nrfx_irq_err_enable>:
    b64a:	6843      	ldr	r3, [r0, #4]
    b64c:	681b      	ldr	r3, [r3, #0]
    b64e:	f44f 7200 	mov.w	r2, #512	; 0x200
    b652:	f8c3 2304 	str.w	r2, [r3, #772]	; 0x304
    b656:	4770      	bx	lr

0000b658 <uarte_nrfx_irq_err_disable>:
    b658:	6843      	ldr	r3, [r0, #4]
    b65a:	681b      	ldr	r3, [r3, #0]
    b65c:	f44f 7200 	mov.w	r2, #512	; 0x200
    b660:	f8c3 2308 	str.w	r2, [r3, #776]	; 0x308
    b664:	4770      	bx	lr

0000b666 <uarte_nrfx_irq_is_pending>:
    b666:	b538      	push	{r3, r4, r5, lr}
    b668:	6843      	ldr	r3, [r0, #4]
    b66a:	681d      	ldr	r5, [r3, #0]
    b66c:	f8d5 3304 	ldr.w	r3, [r5, #772]	; 0x304
    b670:	025b      	lsls	r3, r3, #9
    b672:	4604      	mov	r4, r0
    b674:	d405      	bmi.n	b682 <uarte_nrfx_irq_is_pending+0x1c>
    b676:	f8d5 0304 	ldr.w	r0, [r5, #772]	; 0x304
    b67a:	f010 0010 	ands.w	r0, r0, #16
    b67e:	d106      	bne.n	b68e <uarte_nrfx_irq_is_pending+0x28>
    b680:	bd38      	pop	{r3, r4, r5, pc}
    b682:	f7ff ffb9 	bl	b5f8 <uarte_nrfx_irq_tx_ready_complete>
    b686:	2800      	cmp	r0, #0
    b688:	d0f5      	beq.n	b676 <uarte_nrfx_irq_is_pending+0x10>
    b68a:	2001      	movs	r0, #1
    b68c:	e7f8      	b.n	b680 <uarte_nrfx_irq_is_pending+0x1a>
    b68e:	4620      	mov	r0, r4
    b690:	f7ff ffc7 	bl	b622 <uarte_nrfx_irq_rx_ready>
    b694:	3800      	subs	r0, #0
    b696:	bf18      	it	ne
    b698:	2001      	movne	r0, #1
    b69a:	e7f1      	b.n	b680 <uarte_nrfx_irq_is_pending+0x1a>

0000b69c <uarte_nrfx_irq_update>:
    b69c:	2001      	movs	r0, #1
    b69e:	4770      	bx	lr

0000b6a0 <uarte_nrfx_irq_callback_set>:
    b6a0:	6903      	ldr	r3, [r0, #16]
    b6a2:	68d8      	ldr	r0, [r3, #12]
    b6a4:	6001      	str	r1, [r0, #0]
    b6a6:	68db      	ldr	r3, [r3, #12]
    b6a8:	605a      	str	r2, [r3, #4]
    b6aa:	4770      	bx	lr

0000b6ac <is_tx_ready.isra.0>:
    b6ac:	6802      	ldr	r2, [r0, #0]
    b6ae:	4603      	mov	r3, r0
    b6b0:	f8d2 0158 	ldr.w	r0, [r2, #344]	; 0x158
    b6b4:	b940      	cbnz	r0, b6c8 <is_tx_ready.isra.0+0x1c>
    b6b6:	685b      	ldr	r3, [r3, #4]
    b6b8:	079b      	lsls	r3, r3, #30
    b6ba:	d406      	bmi.n	b6ca <is_tx_ready.isra.0+0x1e>
    b6bc:	f8d2 0120 	ldr.w	r0, [r2, #288]	; 0x120
    b6c0:	3800      	subs	r0, #0
    b6c2:	bf18      	it	ne
    b6c4:	2001      	movne	r0, #1
    b6c6:	4770      	bx	lr
    b6c8:	2001      	movs	r0, #1
    b6ca:	4770      	bx	lr

0000b6cc <uarte_nrfx_fifo_fill>:
    b6cc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    b6ce:	6906      	ldr	r6, [r0, #16]
    b6d0:	68f3      	ldr	r3, [r6, #12]
    b6d2:	899c      	ldrh	r4, [r3, #12]
    b6d4:	f3bf 8f5b 	dmb	ish
    b6d8:	4294      	cmp	r4, r2
    b6da:	bfa8      	it	ge
    b6dc:	4614      	movge	r4, r2
    b6de:	4605      	mov	r5, r0
    b6e0:	3310      	adds	r3, #16
    b6e2:	2201      	movs	r2, #1
    b6e4:	e853 0f00 	ldrex	r0, [r3]
    b6e8:	2800      	cmp	r0, #0
    b6ea:	d103      	bne.n	b6f4 <uarte_nrfx_fifo_fill+0x28>
    b6ec:	e843 2700 	strex	r7, r2, [r3]
    b6f0:	2f00      	cmp	r7, #0
    b6f2:	d1f7      	bne.n	b6e4 <uarte_nrfx_fifo_fill+0x18>
    b6f4:	f3bf 8f5b 	dmb	ish
    b6f8:	bf0c      	ite	eq
    b6fa:	4613      	moveq	r3, r2
    b6fc:	2300      	movne	r3, #0
    b6fe:	d11f      	bne.n	b740 <uarte_nrfx_fifo_fill+0x74>
    b700:	68f3      	ldr	r3, [r6, #12]
    b702:	4622      	mov	r2, r4
    b704:	6898      	ldr	r0, [r3, #8]
    b706:	f000 fd09 	bl	c11c <memcpy>
    b70a:	f04f 0320 	mov.w	r3, #32
    b70e:	f3ef 8711 	mrs	r7, BASEPRI
    b712:	f383 8812 	msr	BASEPRI_MAX, r3
    b716:	f3bf 8f6f 	isb	sy
    b71a:	6868      	ldr	r0, [r5, #4]
    b71c:	f7ff ffc6 	bl	b6ac <is_tx_ready.isra.0>
    b720:	68f3      	ldr	r3, [r6, #12]
    b722:	b938      	cbnz	r0, b734 <uarte_nrfx_fifo_fill+0x68>
    b724:	6118      	str	r0, [r3, #16]
    b726:	4604      	mov	r4, r0
    b728:	f387 8811 	msr	BASEPRI, r7
    b72c:	f3bf 8f6f 	isb	sy
    b730:	4620      	mov	r0, r4
    b732:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    b734:	6899      	ldr	r1, [r3, #8]
    b736:	4622      	mov	r2, r4
    b738:	4628      	mov	r0, r5
    b73a:	f7ff fef7 	bl	b52c <tx_start>
    b73e:	e7f3      	b.n	b728 <uarte_nrfx_fifo_fill+0x5c>
    b740:	461c      	mov	r4, r3
    b742:	e7f5      	b.n	b730 <uarte_nrfx_fifo_fill+0x64>

0000b744 <uarte_nrfx_isr_int>:
    b744:	b410      	push	{r4}
    b746:	6842      	ldr	r2, [r0, #4]
    b748:	6813      	ldr	r3, [r2, #0]
    b74a:	f8d3 1304 	ldr.w	r1, [r3, #772]	; 0x304
    b74e:	05c9      	lsls	r1, r1, #23
    b750:	d518      	bpl.n	b784 <uarte_nrfx_isr_int+0x40>
    b752:	f8d3 1120 	ldr.w	r1, [r3, #288]	; 0x120
    b756:	b1a9      	cbz	r1, b784 <uarte_nrfx_isr_int+0x40>
    b758:	f04f 0420 	mov.w	r4, #32
    b75c:	f3ef 8111 	mrs	r1, BASEPRI
    b760:	f384 8812 	msr	BASEPRI_MAX, r4
    b764:	f3bf 8f6f 	isb	sy
    b768:	f8d3 4120 	ldr.w	r4, [r3, #288]	; 0x120
    b76c:	b134      	cbz	r4, b77c <uarte_nrfx_isr_int+0x38>
    b76e:	2400      	movs	r4, #0
    b770:	f8c3 4120 	str.w	r4, [r3, #288]	; 0x120
    b774:	f8d3 4120 	ldr.w	r4, [r3, #288]	; 0x120
    b778:	2401      	movs	r4, #1
    b77a:	60dc      	str	r4, [r3, #12]
    b77c:	f381 8811 	msr	BASEPRI, r1
    b780:	f3bf 8f6f 	isb	sy
    b784:	6852      	ldr	r2, [r2, #4]
    b786:	06d2      	lsls	r2, r2, #27
    b788:	d51a      	bpl.n	b7c0 <uarte_nrfx_isr_int+0x7c>
    b78a:	f04f 0220 	mov.w	r2, #32
    b78e:	f3ef 8111 	mrs	r1, BASEPRI
    b792:	f382 8812 	msr	BASEPRI_MAX, r2
    b796:	f3bf 8f6f 	isb	sy
    b79a:	f8d3 2158 	ldr.w	r2, [r3, #344]	; 0x158
    b79e:	b112      	cbz	r2, b7a6 <uarte_nrfx_isr_int+0x62>
    b7a0:	2200      	movs	r2, #0
    b7a2:	f8c3 2500 	str.w	r2, [r3, #1280]	; 0x500
    b7a6:	6902      	ldr	r2, [r0, #16]
    b7a8:	68d2      	ldr	r2, [r2, #12]
    b7aa:	b10a      	cbz	r2, b7b0 <uarte_nrfx_isr_int+0x6c>
    b7ac:	6912      	ldr	r2, [r2, #16]
    b7ae:	b91a      	cbnz	r2, b7b8 <uarte_nrfx_isr_int+0x74>
    b7b0:	f44f 0280 	mov.w	r2, #4194304	; 0x400000
    b7b4:	f8c3 2308 	str.w	r2, [r3, #776]	; 0x308
    b7b8:	f381 8811 	msr	BASEPRI, r1
    b7bc:	f3bf 8f6f 	isb	sy
    b7c0:	6902      	ldr	r2, [r0, #16]
    b7c2:	68d4      	ldr	r4, [r2, #12]
    b7c4:	b16c      	cbz	r4, b7e2 <uarte_nrfx_isr_int+0x9e>
    b7c6:	f8d3 1158 	ldr.w	r1, [r3, #344]	; 0x158
    b7ca:	b161      	cbz	r1, b7e6 <uarte_nrfx_isr_int+0xa2>
    b7cc:	2100      	movs	r1, #0
    b7ce:	6121      	str	r1, [r4, #16]
    b7d0:	68d4      	ldr	r4, [r2, #12]
    b7d2:	7ba4      	ldrb	r4, [r4, #14]
    b7d4:	b13c      	cbz	r4, b7e6 <uarte_nrfx_isr_int+0xa2>
    b7d6:	f44f 0080 	mov.w	r0, #4194304	; 0x400000
    b7da:	f8c3 0308 	str.w	r0, [r3, #776]	; 0x308
    b7de:	68d3      	ldr	r3, [r2, #12]
    b7e0:	7399      	strb	r1, [r3, #14]
    b7e2:	bc10      	pop	{r4}
    b7e4:	4770      	bx	lr
    b7e6:	f8d3 1124 	ldr.w	r1, [r3, #292]	; 0x124
    b7ea:	b121      	cbz	r1, b7f6 <uarte_nrfx_isr_int+0xb2>
    b7ec:	2100      	movs	r1, #0
    b7ee:	f8c3 1124 	str.w	r1, [r3, #292]	; 0x124
    b7f2:	f8d3 3124 	ldr.w	r3, [r3, #292]	; 0x124
    b7f6:	68d2      	ldr	r2, [r2, #12]
    b7f8:	6813      	ldr	r3, [r2, #0]
    b7fa:	2b00      	cmp	r3, #0
    b7fc:	d0f1      	beq.n	b7e2 <uarte_nrfx_isr_int+0x9e>
    b7fe:	6851      	ldr	r1, [r2, #4]
    b800:	bc10      	pop	{r4}
    b802:	4718      	bx	r3

0000b804 <uarte_1_init>:
    b804:	b510      	push	{r4, lr}
    b806:	2200      	movs	r2, #0
    b808:	4604      	mov	r4, r0
    b80a:	2101      	movs	r1, #1
    b80c:	2028      	movs	r0, #40	; 0x28
    b80e:	f7f9 fda9 	bl	5364 <z_arm_irq_priority_set>
    b812:	2028      	movs	r0, #40	; 0x28
    b814:	f7f9 fd8a 	bl	532c <arch_irq_enable>
    b818:	4620      	mov	r0, r4
    b81a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    b81e:	f7fa bdff 	b.w	6420 <uarte_instance_init.constprop.0>

0000b822 <uarte_0_init>:
    b822:	b510      	push	{r4, lr}
    b824:	2200      	movs	r2, #0
    b826:	4604      	mov	r4, r0
    b828:	2101      	movs	r1, #1
    b82a:	2002      	movs	r0, #2
    b82c:	f7f9 fd9a 	bl	5364 <z_arm_irq_priority_set>
    b830:	2002      	movs	r0, #2
    b832:	f7f9 fd7b 	bl	532c <arch_irq_enable>
    b836:	4620      	mov	r0, r4
    b838:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    b83c:	f7fa bdf0 	b.w	6420 <uarte_instance_init.constprop.0>

0000b840 <sys_clock_idle_exit>:
    b840:	4770      	bx	lr

0000b842 <event_clear>:
    b842:	f100 0350 	add.w	r3, r0, #80	; 0x50
    b846:	009b      	lsls	r3, r3, #2
    b848:	b29b      	uxth	r3, r3
    b84a:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
    b84e:	f503 3388 	add.w	r3, r3, #69632	; 0x11000
    b852:	2200      	movs	r2, #0
    b854:	601a      	str	r2, [r3, #0]
    b856:	681b      	ldr	r3, [r3, #0]
    b858:	4770      	bx	lr

0000b85a <sys_clock_cycle_get_32>:
    b85a:	b508      	push	{r3, lr}
    b85c:	f7fa ff14 	bl	6688 <z_nrf_rtc_timer_read>
    b860:	bd08      	pop	{r3, pc}

0000b862 <pinctrl_lookup_state>:
    b862:	b530      	push	{r4, r5, lr}
    b864:	6843      	ldr	r3, [r0, #4]
    b866:	6013      	str	r3, [r2, #0]
    b868:	7a05      	ldrb	r5, [r0, #8]
    b86a:	6844      	ldr	r4, [r0, #4]
    b86c:	eb04 04c5 	add.w	r4, r4, r5, lsl #3
    b870:	42a3      	cmp	r3, r4
    b872:	d302      	bcc.n	b87a <pinctrl_lookup_state+0x18>
    b874:	f06f 0001 	mvn.w	r0, #1
    b878:	bd30      	pop	{r4, r5, pc}
    b87a:	795c      	ldrb	r4, [r3, #5]
    b87c:	428c      	cmp	r4, r1
    b87e:	d001      	beq.n	b884 <pinctrl_lookup_state+0x22>
    b880:	3308      	adds	r3, #8
    b882:	e7f0      	b.n	b866 <pinctrl_lookup_state+0x4>
    b884:	2000      	movs	r0, #0
    b886:	e7f7      	b.n	b878 <pinctrl_lookup_state+0x16>

0000b888 <k_sys_fatal_error_handler>:
    b888:	b508      	push	{r3, lr}
    b88a:	2000      	movs	r0, #0
    b88c:	f7fa f96c 	bl	5b68 <sys_arch_reboot>

0000b890 <hw_cc3xx_init_internal>:
    b890:	f7fe b980 	b.w	9b94 <nrf_cc3xx_platform_init_no_rng>

0000b894 <hw_cc3xx_init>:
    b894:	b508      	push	{r3, lr}
    b896:	f7f9 fc3d 	bl	5114 <nrf_cc3xx_platform_abort_init>
    b89a:	f7f9 fd11 	bl	52c0 <nrf_cc3xx_platform_mutex_init>
    b89e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    b8a2:	f7fe b977 	b.w	9b94 <nrf_cc3xx_platform_init_no_rng>

0000b8a6 <nrfx_isr>:
    b8a6:	4700      	bx	r0

0000b8a8 <nrfx_busy_wait>:
    b8a8:	f000 ba93 	b.w	bdd2 <z_impl_k_busy_wait>

0000b8ac <nrfx_clock_enable>:
    b8ac:	b508      	push	{r3, lr}
    b8ae:	2000      	movs	r0, #0
    b8b0:	f7f9 fd4a 	bl	5348 <arch_irq_is_enabled>
    b8b4:	b908      	cbnz	r0, b8ba <nrfx_clock_enable+0xe>
    b8b6:	f7f9 fd39 	bl	532c <arch_irq_enable>
    b8ba:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    b8be:	2200      	movs	r2, #0
    b8c0:	f8c3 2518 	str.w	r2, [r3, #1304]	; 0x518
    b8c4:	bd08      	pop	{r3, pc}

0000b8c6 <nrfx_clock_start>:
    b8c6:	b508      	push	{r3, lr}
    b8c8:	b110      	cbz	r0, b8d0 <nrfx_clock_start+0xa>
    b8ca:	2801      	cmp	r0, #1
    b8cc:	d02c      	beq.n	b928 <nrfx_clock_start+0x62>
    b8ce:	bd08      	pop	{r3, pc}
    b8d0:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    b8d4:	f8d2 3418 	ldr.w	r3, [r2, #1048]	; 0x418
    b8d8:	f8d2 1418 	ldr.w	r1, [r2, #1048]	; 0x418
    b8dc:	03c8      	lsls	r0, r1, #15
    b8de:	d40b      	bmi.n	b8f8 <nrfx_clock_start+0x32>
    b8e0:	f8d2 3414 	ldr.w	r3, [r2, #1044]	; 0x414
    b8e4:	07d9      	lsls	r1, r3, #31
    b8e6:	d50f      	bpl.n	b908 <nrfx_clock_start+0x42>
    b8e8:	f8d2 341c 	ldr.w	r3, [r2, #1052]	; 0x41c
    b8ec:	079b      	lsls	r3, r3, #30
    b8ee:	d408      	bmi.n	b902 <nrfx_clock_start+0x3c>
    b8f0:	2302      	movs	r3, #2
    b8f2:	f8c2 3304 	str.w	r3, [r2, #772]	; 0x304
    b8f6:	e7ea      	b.n	b8ce <nrfx_clock_start+0x8>
    b8f8:	f003 0303 	and.w	r3, r3, #3
    b8fc:	2b01      	cmp	r3, #1
    b8fe:	d004      	beq.n	b90a <nrfx_clock_start+0x44>
    b900:	b113      	cbz	r3, b908 <nrfx_clock_start+0x42>
    b902:	2000      	movs	r0, #0
    b904:	f7fb fa4e 	bl	6da4 <clock_stop>
    b908:	2300      	movs	r3, #0
    b90a:	f04f 4280 	mov.w	r2, #1073741824	; 0x40000000
    b90e:	f8c2 3518 	str.w	r3, [r2, #1304]	; 0x518
    b912:	2300      	movs	r3, #0
    b914:	f8c2 3104 	str.w	r3, [r2, #260]	; 0x104
    b918:	f8d2 3104 	ldr.w	r3, [r2, #260]	; 0x104
    b91c:	2302      	movs	r3, #2
    b91e:	f8c2 3304 	str.w	r3, [r2, #772]	; 0x304
    b922:	2301      	movs	r3, #1
    b924:	6093      	str	r3, [r2, #8]
    b926:	e7d2      	b.n	b8ce <nrfx_clock_start+0x8>
    b928:	f04f 4380 	mov.w	r3, #1073741824	; 0x40000000
    b92c:	2200      	movs	r2, #0
    b92e:	f8c3 2100 	str.w	r2, [r3, #256]	; 0x100
    b932:	f8d3 2100 	ldr.w	r2, [r3, #256]	; 0x100
    b936:	f8c3 0304 	str.w	r0, [r3, #772]	; 0x304
    b93a:	6018      	str	r0, [r3, #0]
    b93c:	e7c7      	b.n	b8ce <nrfx_clock_start+0x8>

0000b93e <nrfx_clock_stop>:
    b93e:	f7fb ba31 	b.w	6da4 <clock_stop>

0000b942 <nrf_gpio_reconfigure>:
    b942:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
    b944:	9001      	str	r0, [sp, #4]
    b946:	a801      	add	r0, sp, #4
    b948:	e9dd 4708 	ldrd	r4, r7, [sp, #32]
    b94c:	4616      	mov	r6, r2
    b94e:	461d      	mov	r5, r3
    b950:	f7fb fad0 	bl	6ef4 <nrf_gpio_pin_port_decode>
    b954:	9b01      	ldr	r3, [sp, #4]
    b956:	f1b6 0c00 	subs.w	ip, r6, #0
    b95a:	bf18      	it	ne
    b95c:	f04f 0c01 	movne.w	ip, #1
    b960:	eb00 0083 	add.w	r0, r0, r3, lsl #2
    b964:	1e0b      	subs	r3, r1, #0
    b966:	bf18      	it	ne
    b968:	2301      	movne	r3, #1
    b96a:	2d00      	cmp	r5, #0
    b96c:	ea43 034c 	orr.w	r3, r3, ip, lsl #1
    b970:	bf14      	ite	ne
    b972:	f04f 0c0c 	movne.w	ip, #12
    b976:	f04f 0c00 	moveq.w	ip, #0
    b97a:	2c00      	cmp	r4, #0
    b97c:	ea43 030c 	orr.w	r3, r3, ip
    b980:	bf14      	ite	ne
    b982:	f44f 6ce0 	movne.w	ip, #1792	; 0x700
    b986:	f04f 0c00 	moveq.w	ip, #0
    b98a:	2f00      	cmp	r7, #0
    b98c:	ea43 030c 	orr.w	r3, r3, ip
    b990:	f8d0 2700 	ldr.w	r2, [r0, #1792]	; 0x700
    b994:	bf14      	ite	ne
    b996:	f44f 3c40 	movne.w	ip, #196608	; 0x30000
    b99a:	f04f 0c00 	moveq.w	ip, #0
    b99e:	ea43 030c 	orr.w	r3, r3, ip
    b9a2:	ea22 0303 	bic.w	r3, r2, r3
    b9a6:	b101      	cbz	r1, b9aa <nrf_gpio_reconfigure+0x68>
    b9a8:	7809      	ldrb	r1, [r1, #0]
    b9aa:	b10e      	cbz	r6, b9b0 <nrf_gpio_reconfigure+0x6e>
    b9ac:	7836      	ldrb	r6, [r6, #0]
    b9ae:	0076      	lsls	r6, r6, #1
    b9b0:	4319      	orrs	r1, r3
    b9b2:	b10d      	cbz	r5, b9b8 <nrf_gpio_reconfigure+0x76>
    b9b4:	782d      	ldrb	r5, [r5, #0]
    b9b6:	00ad      	lsls	r5, r5, #2
    b9b8:	4331      	orrs	r1, r6
    b9ba:	b10c      	cbz	r4, b9c0 <nrf_gpio_reconfigure+0x7e>
    b9bc:	7824      	ldrb	r4, [r4, #0]
    b9be:	0224      	lsls	r4, r4, #8
    b9c0:	4329      	orrs	r1, r5
    b9c2:	b10f      	cbz	r7, b9c8 <nrf_gpio_reconfigure+0x86>
    b9c4:	783f      	ldrb	r7, [r7, #0]
    b9c6:	043f      	lsls	r7, r7, #16
    b9c8:	430c      	orrs	r4, r1
    b9ca:	433c      	orrs	r4, r7
    b9cc:	f8c0 4700 	str.w	r4, [r0, #1792]	; 0x700
    b9d0:	b003      	add	sp, #12
    b9d2:	bdf0      	pop	{r4, r5, r6, r7, pc}

0000b9d4 <nrf_gpio_cfg_sense_set>:
    b9d4:	b51f      	push	{r0, r1, r2, r3, r4, lr}
    b9d6:	f10d 030f 	add.w	r3, sp, #15
    b9da:	9301      	str	r3, [sp, #4]
    b9dc:	2300      	movs	r3, #0
    b9de:	f88d 100f 	strb.w	r1, [sp, #15]
    b9e2:	9300      	str	r3, [sp, #0]
    b9e4:	461a      	mov	r2, r3
    b9e6:	4619      	mov	r1, r3
    b9e8:	f7ff ffab 	bl	b942 <nrf_gpio_reconfigure>
    b9ec:	b005      	add	sp, #20
    b9ee:	f85d fb04 	ldr.w	pc, [sp], #4

0000b9f2 <SEGGER_RTT_Init>:
    b9f2:	f7fb bded 	b.w	75d0 <_DoInit>

0000b9f6 <rtt_init>:
    b9f6:	b508      	push	{r3, lr}
    b9f8:	f7ff fffb 	bl	b9f2 <SEGGER_RTT_Init>
    b9fc:	2000      	movs	r0, #0
    b9fe:	bd08      	pop	{r3, pc}

0000ba00 <z_device_state_init>:
    ba00:	4770      	bx	lr

0000ba02 <z_device_is_ready>:
    ba02:	b140      	cbz	r0, ba16 <z_device_is_ready+0x14>
    ba04:	68c3      	ldr	r3, [r0, #12]
    ba06:	7858      	ldrb	r0, [r3, #1]
    ba08:	f010 0001 	ands.w	r0, r0, #1
    ba0c:	bf1e      	ittt	ne
    ba0e:	7818      	ldrbne	r0, [r3, #0]
    ba10:	fab0 f080 	clzne	r0, r0
    ba14:	0940      	lsrne	r0, r0, #5
    ba16:	4770      	bx	lr

0000ba18 <device_required_foreach>:
    ba18:	b470      	push	{r4, r5, r6}
    ba1a:	6940      	ldr	r0, [r0, #20]
    ba1c:	460d      	mov	r5, r1
    ba1e:	4613      	mov	r3, r2
    ba20:	b960      	cbnz	r0, ba3c <device_required_foreach+0x24>
    ba22:	4601      	mov	r1, r0
    ba24:	462a      	mov	r2, r5
    ba26:	bc70      	pop	{r4, r5, r6}
    ba28:	f7fb be08 	b.w	763c <device_visitor>
    ba2c:	3101      	adds	r1, #1
    ba2e:	f830 4011 	ldrh.w	r4, [r0, r1, lsl #1]
    ba32:	4434      	add	r4, r6
    ba34:	b2a4      	uxth	r4, r4
    ba36:	4294      	cmp	r4, r2
    ba38:	d9f8      	bls.n	ba2c <device_required_foreach+0x14>
    ba3a:	e7f3      	b.n	ba24 <device_required_foreach+0xc>
    ba3c:	2100      	movs	r1, #0
    ba3e:	f647 76ff 	movw	r6, #32767	; 0x7fff
    ba42:	f64f 72fd 	movw	r2, #65533	; 0xfffd
    ba46:	e7f2      	b.n	ba2e <device_required_foreach+0x16>

0000ba48 <z_fatal_error>:
    ba48:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    ba4a:	4605      	mov	r5, r0
    ba4c:	460e      	mov	r6, r1
    ba4e:	f04f 0320 	mov.w	r3, #32
    ba52:	f3ef 8711 	mrs	r7, BASEPRI
    ba56:	f383 8812 	msr	BASEPRI_MAX, r3
    ba5a:	f3bf 8f6f 	isb	sy
    ba5e:	f7fc fcef 	bl	8440 <z_impl_z_current_get>
    ba62:	4631      	mov	r1, r6
    ba64:	4604      	mov	r4, r0
    ba66:	4628      	mov	r0, r5
    ba68:	f7ff ff0e 	bl	b888 <k_sys_fatal_error_handler>
    ba6c:	f387 8811 	msr	BASEPRI, r7
    ba70:	f3bf 8f6f 	isb	sy
    ba74:	4620      	mov	r0, r4
    ba76:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    ba7a:	f7f9 bf09 	b.w	5890 <z_impl_k_thread_abort>

0000ba7e <z_early_memset>:
    ba7e:	f000 bb75 	b.w	c16c <memset>

0000ba82 <z_early_memcpy>:
    ba82:	f000 bb4b 	b.w	c11c <memcpy>

0000ba86 <create_free_list>:
    ba86:	e9d0 3203 	ldrd	r3, r2, [r0, #12]
    ba8a:	4313      	orrs	r3, r2
    ba8c:	f013 0303 	ands.w	r3, r3, #3
    ba90:	d10c      	bne.n	baac <create_free_list+0x26>
    ba92:	6143      	str	r3, [r0, #20]
    ba94:	6881      	ldr	r1, [r0, #8]
    ba96:	4299      	cmp	r1, r3
    ba98:	d801      	bhi.n	ba9e <create_free_list+0x18>
    ba9a:	2000      	movs	r0, #0
    ba9c:	4770      	bx	lr
    ba9e:	6941      	ldr	r1, [r0, #20]
    baa0:	6011      	str	r1, [r2, #0]
    baa2:	68c1      	ldr	r1, [r0, #12]
    baa4:	6142      	str	r2, [r0, #20]
    baa6:	3301      	adds	r3, #1
    baa8:	440a      	add	r2, r1
    baaa:	e7f3      	b.n	ba94 <create_free_list+0xe>
    baac:	f06f 0015 	mvn.w	r0, #21
    bab0:	4770      	bx	lr

0000bab2 <k_mem_slab_init>:
    bab2:	b510      	push	{r4, lr}
    bab4:	e9c0 3202 	strd	r3, r2, [r0, #8]
    bab8:	2300      	movs	r3, #0
    baba:	6101      	str	r1, [r0, #16]
    babc:	6183      	str	r3, [r0, #24]
    babe:	4604      	mov	r4, r0
    bac0:	f7ff ffe1 	bl	ba86 <create_free_list>
    bac4:	2800      	cmp	r0, #0
    bac6:	bfa8      	it	ge
    bac8:	e9c4 4400 	strdge	r4, r4, [r4]
    bacc:	bd10      	pop	{r4, pc}

0000bace <k_mem_slab_free>:
    bace:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    bad0:	4604      	mov	r4, r0
    bad2:	460d      	mov	r5, r1
    bad4:	f04f 0320 	mov.w	r3, #32
    bad8:	f3ef 8611 	mrs	r6, BASEPRI
    badc:	f383 8812 	msr	BASEPRI_MAX, r3
    bae0:	f3bf 8f6f 	isb	sy
    bae4:	6947      	ldr	r7, [r0, #20]
    bae6:	b97f      	cbnz	r7, bb08 <k_mem_slab_free+0x3a>
    bae8:	f000 f8c1 	bl	bc6e <z_unpend_first_thread>
    baec:	b160      	cbz	r0, bb08 <k_mem_slab_free+0x3a>
    baee:	682a      	ldr	r2, [r5, #0]
    baf0:	6142      	str	r2, [r0, #20]
    baf2:	f8c0 70b0 	str.w	r7, [r0, #176]	; 0xb0
    baf6:	f000 f8aa 	bl	bc4e <z_ready_thread>
    bafa:	4631      	mov	r1, r6
    bafc:	f104 0008 	add.w	r0, r4, #8
    bb00:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    bb04:	f7fc bb62 	b.w	81cc <z_reschedule>
    bb08:	682b      	ldr	r3, [r5, #0]
    bb0a:	6962      	ldr	r2, [r4, #20]
    bb0c:	601a      	str	r2, [r3, #0]
    bb0e:	682b      	ldr	r3, [r5, #0]
    bb10:	6163      	str	r3, [r4, #20]
    bb12:	69a3      	ldr	r3, [r4, #24]
    bb14:	3b01      	subs	r3, #1
    bb16:	61a3      	str	r3, [r4, #24]
    bb18:	f386 8811 	msr	BASEPRI, r6
    bb1c:	f3bf 8f6f 	isb	sy
    bb20:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

0000bb22 <k_is_in_isr>:
    bb22:	f3ef 8005 	mrs	r0, IPSR
    bb26:	3800      	subs	r0, #0
    bb28:	bf18      	it	ne
    bb2a:	2001      	movne	r0, #1
    bb2c:	4770      	bx	lr

0000bb2e <k_thread_name_get>:
    bb2e:	3078      	adds	r0, #120	; 0x78
    bb30:	4770      	bx	lr

0000bb32 <z_impl_k_thread_start>:
    bb32:	f7fc bb5d 	b.w	81f0 <z_sched_start>

0000bb36 <z_stack_space_get>:
    bb36:	b510      	push	{r4, lr}
    bb38:	2300      	movs	r3, #0
    bb3a:	428b      	cmp	r3, r1
    bb3c:	d102      	bne.n	bb44 <z_stack_space_get+0xe>
    bb3e:	6013      	str	r3, [r2, #0]
    bb40:	2000      	movs	r0, #0
    bb42:	bd10      	pop	{r4, pc}
    bb44:	5cc4      	ldrb	r4, [r0, r3]
    bb46:	2caa      	cmp	r4, #170	; 0xaa
    bb48:	d1f9      	bne.n	bb3e <z_stack_space_get+0x8>
    bb4a:	3301      	adds	r3, #1
    bb4c:	e7f5      	b.n	bb3a <z_stack_space_get+0x4>

0000bb4e <z_impl_k_thread_stack_space_get>:
    bb4e:	460a      	mov	r2, r1
    bb50:	e9d0 0127 	ldrd	r0, r1, [r0, #156]	; 0x9c
    bb54:	f7ff bfef 	b.w	bb36 <z_stack_space_get>

0000bb58 <z_pm_save_idle_exit>:
    bb58:	b508      	push	{r3, lr}
    bb5a:	f7f9 f9d1 	bl	4f00 <pm_system_resume>
    bb5e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    bb62:	f7ff be6d 	b.w	b840 <sys_clock_idle_exit>

0000bb66 <adjust_owner_prio.isra.0>:
    bb66:	f990 300e 	ldrsb.w	r3, [r0, #14]
    bb6a:	428b      	cmp	r3, r1
    bb6c:	d001      	beq.n	bb72 <adjust_owner_prio.isra.0+0xc>
    bb6e:	f7fc bae7 	b.w	8140 <z_set_prio>
    bb72:	2000      	movs	r0, #0
    bb74:	4770      	bx	lr

0000bb76 <z_impl_k_mutex_init>:
    bb76:	4603      	mov	r3, r0
    bb78:	2000      	movs	r0, #0
    bb7a:	e9c3 0002 	strd	r0, r0, [r3, #8]
    bb7e:	e9c3 3300 	strd	r3, r3, [r3]
    bb82:	4770      	bx	lr

0000bb84 <sys_dlist_remove>:
    bb84:	e9d0 3200 	ldrd	r3, r2, [r0]
    bb88:	6013      	str	r3, [r2, #0]
    bb8a:	605a      	str	r2, [r3, #4]
    bb8c:	2300      	movs	r3, #0
    bb8e:	e9c0 3300 	strd	r3, r3, [r0]
    bb92:	4770      	bx	lr

0000bb94 <unpend_thread_no_timeout>:
    bb94:	b508      	push	{r3, lr}
    bb96:	f7ff fff5 	bl	bb84 <sys_dlist_remove>
    bb9a:	7b43      	ldrb	r3, [r0, #13]
    bb9c:	f023 0302 	bic.w	r3, r3, #2
    bba0:	7343      	strb	r3, [r0, #13]
    bba2:	2300      	movs	r3, #0
    bba4:	6083      	str	r3, [r0, #8]
    bba6:	bd08      	pop	{r3, pc}

0000bba8 <z_sched_prio_cmp>:
    bba8:	f990 300e 	ldrsb.w	r3, [r0, #14]
    bbac:	f991 000e 	ldrsb.w	r0, [r1, #14]
    bbb0:	4283      	cmp	r3, r0
    bbb2:	bf14      	ite	ne
    bbb4:	1ac0      	subne	r0, r0, r3
    bbb6:	2000      	moveq	r0, #0
    bbb8:	4770      	bx	lr

0000bbba <z_thread_timeout>:
    bbba:	b510      	push	{r4, lr}
    bbbc:	4601      	mov	r1, r0
    bbbe:	f04f 0320 	mov.w	r3, #32
    bbc2:	f3ef 8411 	mrs	r4, BASEPRI
    bbc6:	f383 8812 	msr	BASEPRI_MAX, r3
    bbca:	f3bf 8f6f 	isb	sy
    bbce:	f810 3c0b 	ldrb.w	r3, [r0, #-11]
    bbd2:	f013 0f28 	tst.w	r3, #40	; 0x28
    bbd6:	d10d      	bne.n	bbf4 <z_thread_timeout+0x3a>
    bbd8:	f851 3c10 	ldr.w	r3, [r1, #-16]
    bbdc:	3818      	subs	r0, #24
    bbde:	b10b      	cbz	r3, bbe4 <z_thread_timeout+0x2a>
    bbe0:	f7ff ffd8 	bl	bb94 <unpend_thread_no_timeout>
    bbe4:	f811 3c0b 	ldrb.w	r3, [r1, #-11]
    bbe8:	f023 0314 	bic.w	r3, r3, #20
    bbec:	f801 3c0b 	strb.w	r3, [r1, #-11]
    bbf0:	f7fc f9b0 	bl	7f54 <ready_thread>
    bbf4:	f384 8811 	msr	BASEPRI, r4
    bbf8:	f3bf 8f6f 	isb	sy
    bbfc:	bd10      	pop	{r4, pc}

0000bbfe <add_to_waitq_locked>:
    bbfe:	b538      	push	{r3, r4, r5, lr}
    bc00:	4604      	mov	r4, r0
    bc02:	460d      	mov	r5, r1
    bc04:	f7fc f9da 	bl	7fbc <unready_thread>
    bc08:	7b63      	ldrb	r3, [r4, #13]
    bc0a:	f043 0302 	orr.w	r3, r3, #2
    bc0e:	7363      	strb	r3, [r4, #13]
    bc10:	b1e5      	cbz	r5, bc4c <add_to_waitq_locked+0x4e>
    bc12:	60a5      	str	r5, [r4, #8]
    bc14:	682b      	ldr	r3, [r5, #0]
    bc16:	429d      	cmp	r5, r3
    bc18:	d109      	bne.n	bc2e <add_to_waitq_locked+0x30>
    bc1a:	686b      	ldr	r3, [r5, #4]
    bc1c:	e9c4 5300 	strd	r5, r3, [r4]
    bc20:	601c      	str	r4, [r3, #0]
    bc22:	606c      	str	r4, [r5, #4]
    bc24:	e012      	b.n	bc4c <add_to_waitq_locked+0x4e>
    bc26:	686a      	ldr	r2, [r5, #4]
    bc28:	4293      	cmp	r3, r2
    bc2a:	d0f6      	beq.n	bc1a <add_to_waitq_locked+0x1c>
    bc2c:	681b      	ldr	r3, [r3, #0]
    bc2e:	2b00      	cmp	r3, #0
    bc30:	d0f3      	beq.n	bc1a <add_to_waitq_locked+0x1c>
    bc32:	f994 200e 	ldrsb.w	r2, [r4, #14]
    bc36:	f993 100e 	ldrsb.w	r1, [r3, #14]
    bc3a:	428a      	cmp	r2, r1
    bc3c:	d0f3      	beq.n	bc26 <add_to_waitq_locked+0x28>
    bc3e:	4291      	cmp	r1, r2
    bc40:	ddf1      	ble.n	bc26 <add_to_waitq_locked+0x28>
    bc42:	685a      	ldr	r2, [r3, #4]
    bc44:	e9c4 3200 	strd	r3, r2, [r4]
    bc48:	6014      	str	r4, [r2, #0]
    bc4a:	605c      	str	r4, [r3, #4]
    bc4c:	bd38      	pop	{r3, r4, r5, pc}

0000bc4e <z_ready_thread>:
    bc4e:	b510      	push	{r4, lr}
    bc50:	f04f 0320 	mov.w	r3, #32
    bc54:	f3ef 8411 	mrs	r4, BASEPRI
    bc58:	f383 8812 	msr	BASEPRI_MAX, r3
    bc5c:	f3bf 8f6f 	isb	sy
    bc60:	f7fc f978 	bl	7f54 <ready_thread>
    bc64:	f384 8811 	msr	BASEPRI, r4
    bc68:	f3bf 8f6f 	isb	sy
    bc6c:	bd10      	pop	{r4, pc}

0000bc6e <z_unpend_first_thread>:
    bc6e:	b538      	push	{r3, r4, r5, lr}
    bc70:	f04f 0320 	mov.w	r3, #32
    bc74:	f3ef 8511 	mrs	r5, BASEPRI
    bc78:	f383 8812 	msr	BASEPRI_MAX, r3
    bc7c:	f3bf 8f6f 	isb	sy
    bc80:	6804      	ldr	r4, [r0, #0]
    bc82:	42a0      	cmp	r0, r4
    bc84:	d00d      	beq.n	bca2 <z_unpend_first_thread+0x34>
    bc86:	b134      	cbz	r4, bc96 <z_unpend_first_thread+0x28>
    bc88:	4620      	mov	r0, r4
    bc8a:	f7ff ff83 	bl	bb94 <unpend_thread_no_timeout>
    bc8e:	f104 0018 	add.w	r0, r4, #24
    bc92:	f000 f856 	bl	bd42 <z_abort_timeout>
    bc96:	f385 8811 	msr	BASEPRI, r5
    bc9a:	f3bf 8f6f 	isb	sy
    bc9e:	4620      	mov	r0, r4
    bca0:	bd38      	pop	{r3, r4, r5, pc}
    bca2:	2400      	movs	r4, #0
    bca4:	e7f7      	b.n	bc96 <z_unpend_first_thread+0x28>

0000bca6 <z_unpend_thread>:
    bca6:	b510      	push	{r4, lr}
    bca8:	f04f 0320 	mov.w	r3, #32
    bcac:	f3ef 8411 	mrs	r4, BASEPRI
    bcb0:	f383 8812 	msr	BASEPRI_MAX, r3
    bcb4:	f3bf 8f6f 	isb	sy
    bcb8:	f7ff ff6c 	bl	bb94 <unpend_thread_no_timeout>
    bcbc:	f384 8811 	msr	BASEPRI, r4
    bcc0:	f3bf 8f6f 	isb	sy
    bcc4:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    bcc8:	3018      	adds	r0, #24
    bcca:	f000 b83a 	b.w	bd42 <z_abort_timeout>

0000bcce <z_reschedule_irqlock>:
    bcce:	4603      	mov	r3, r0
    bcd0:	b920      	cbnz	r0, bcdc <z_reschedule_irqlock+0xe>
    bcd2:	f3ef 8205 	mrs	r2, IPSR
    bcd6:	b90a      	cbnz	r2, bcdc <z_reschedule_irqlock+0xe>
    bcd8:	f7f9 bb7c 	b.w	53d4 <arch_swap>
    bcdc:	f383 8811 	msr	BASEPRI, r3
    bce0:	f3bf 8f6f 	isb	sy
    bce4:	4770      	bx	lr

0000bce6 <z_reschedule_unlocked>:
    bce6:	f04f 0320 	mov.w	r3, #32
    bcea:	f3ef 8011 	mrs	r0, BASEPRI
    bcee:	f383 8812 	msr	BASEPRI_MAX, r3
    bcf2:	f3bf 8f6f 	isb	sy
    bcf6:	f7ff bfea 	b.w	bcce <z_reschedule_irqlock>

0000bcfa <z_sched_wake>:
    bcfa:	b538      	push	{r3, r4, r5, lr}
    bcfc:	f04f 0320 	mov.w	r3, #32
    bd00:	f3ef 8511 	mrs	r5, BASEPRI
    bd04:	f383 8812 	msr	BASEPRI_MAX, r3
    bd08:	f3bf 8f6f 	isb	sy
    bd0c:	6804      	ldr	r4, [r0, #0]
    bd0e:	42a0      	cmp	r0, r4
    bd10:	d013      	beq.n	bd3a <z_sched_wake+0x40>
    bd12:	b1a4      	cbz	r4, bd3e <z_sched_wake+0x44>
    bd14:	f8c4 10b0 	str.w	r1, [r4, #176]	; 0xb0
    bd18:	6162      	str	r2, [r4, #20]
    bd1a:	4620      	mov	r0, r4
    bd1c:	f7ff ff3a 	bl	bb94 <unpend_thread_no_timeout>
    bd20:	f104 0018 	add.w	r0, r4, #24
    bd24:	f000 f80d 	bl	bd42 <z_abort_timeout>
    bd28:	4620      	mov	r0, r4
    bd2a:	f7fc f913 	bl	7f54 <ready_thread>
    bd2e:	2001      	movs	r0, #1
    bd30:	f385 8811 	msr	BASEPRI, r5
    bd34:	f3bf 8f6f 	isb	sy
    bd38:	bd38      	pop	{r3, r4, r5, pc}
    bd3a:	2000      	movs	r0, #0
    bd3c:	e7f8      	b.n	bd30 <z_sched_wake+0x36>
    bd3e:	4620      	mov	r0, r4
    bd40:	e7f6      	b.n	bd30 <z_sched_wake+0x36>

0000bd42 <z_abort_timeout>:
    bd42:	b510      	push	{r4, lr}
    bd44:	f04f 0220 	mov.w	r2, #32
    bd48:	f3ef 8411 	mrs	r4, BASEPRI
    bd4c:	f382 8812 	msr	BASEPRI_MAX, r2
    bd50:	f3bf 8f6f 	isb	sy
    bd54:	6803      	ldr	r3, [r0, #0]
    bd56:	b13b      	cbz	r3, bd68 <z_abort_timeout+0x26>
    bd58:	f7fc fc3a 	bl	85d0 <remove_timeout>
    bd5c:	2000      	movs	r0, #0
    bd5e:	f384 8811 	msr	BASEPRI, r4
    bd62:	f3bf 8f6f 	isb	sy
    bd66:	bd10      	pop	{r4, pc}
    bd68:	f06f 0015 	mvn.w	r0, #21
    bd6c:	e7f7      	b.n	bd5e <z_abort_timeout+0x1c>

0000bd6e <z_get_next_timeout_expiry>:
    bd6e:	b510      	push	{r4, lr}
    bd70:	f04f 0320 	mov.w	r3, #32
    bd74:	f3ef 8411 	mrs	r4, BASEPRI
    bd78:	f383 8812 	msr	BASEPRI_MAX, r3
    bd7c:	f3bf 8f6f 	isb	sy
    bd80:	f7fc fbfe 	bl	8580 <next_timeout>
    bd84:	f384 8811 	msr	BASEPRI, r4
    bd88:	f3bf 8f6f 	isb	sy
    bd8c:	bd10      	pop	{r4, pc}

0000bd8e <z_set_timeout_expiry>:
    bd8e:	b570      	push	{r4, r5, r6, lr}
    bd90:	4604      	mov	r4, r0
    bd92:	460d      	mov	r5, r1
    bd94:	f04f 0320 	mov.w	r3, #32
    bd98:	f3ef 8611 	mrs	r6, BASEPRI
    bd9c:	f383 8812 	msr	BASEPRI_MAX, r3
    bda0:	f3bf 8f6f 	isb	sy
    bda4:	f7fc fbec 	bl	8580 <next_timeout>
    bda8:	2801      	cmp	r0, #1
    bdaa:	dd07      	ble.n	bdbc <z_set_timeout_expiry+0x2e>
    bdac:	42a0      	cmp	r0, r4
    bdae:	db05      	blt.n	bdbc <z_set_timeout_expiry+0x2e>
    bdb0:	42a0      	cmp	r0, r4
    bdb2:	4629      	mov	r1, r5
    bdb4:	bfa8      	it	ge
    bdb6:	4620      	movge	r0, r4
    bdb8:	f7fa fdc0 	bl	693c <sys_clock_set_timeout>
    bdbc:	f386 8811 	msr	BASEPRI, r6
    bdc0:	f3bf 8f6f 	isb	sy
    bdc4:	bd70      	pop	{r4, r5, r6, pc}

0000bdc6 <sys_clock_tick_get_32>:
    bdc6:	b508      	push	{r3, lr}
    bdc8:	f7fc fcf6 	bl	87b8 <sys_clock_tick_get>
    bdcc:	bd08      	pop	{r3, pc}

0000bdce <z_impl_k_uptime_ticks>:
    bdce:	f7fc bcf3 	b.w	87b8 <sys_clock_tick_get>

0000bdd2 <z_impl_k_busy_wait>:
    bdd2:	b108      	cbz	r0, bdd8 <z_impl_k_busy_wait+0x6>
    bdd4:	f7f9 bede 	b.w	5b94 <arch_busy_wait>
    bdd8:	4770      	bx	lr

0000bdda <add_event>:
    bdda:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    bddc:	460d      	mov	r5, r1
    bdde:	e9d0 1300 	ldrd	r1, r3, [r0]
    bde2:	4288      	cmp	r0, r1
    bde4:	4604      	mov	r4, r0
    bde6:	d105      	bne.n	bdf4 <add_event+0x1a>
    bde8:	6863      	ldr	r3, [r4, #4]
    bdea:	e9c5 4300 	strd	r4, r3, [r5]
    bdee:	601d      	str	r5, [r3, #0]
    bdf0:	6065      	str	r5, [r4, #4]
    bdf2:	e01d      	b.n	be30 <add_event+0x56>
    bdf4:	2b00      	cmp	r3, #0
    bdf6:	d0f7      	beq.n	bde8 <add_event+0xe>
    bdf8:	6898      	ldr	r0, [r3, #8]
    bdfa:	b100      	cbz	r0, bdfe <add_event+0x24>
    bdfc:	3860      	subs	r0, #96	; 0x60
    bdfe:	f1a2 0760 	sub.w	r7, r2, #96	; 0x60
    be02:	4639      	mov	r1, r7
    be04:	f7ff fed0 	bl	bba8 <z_sched_prio_cmp>
    be08:	2800      	cmp	r0, #0
    be0a:	dced      	bgt.n	bde8 <add_event+0xe>
    be0c:	6826      	ldr	r6, [r4, #0]
    be0e:	42b4      	cmp	r4, r6
    be10:	d0ea      	beq.n	bde8 <add_event+0xe>
    be12:	2e00      	cmp	r6, #0
    be14:	d0e8      	beq.n	bde8 <add_event+0xe>
    be16:	68b1      	ldr	r1, [r6, #8]
    be18:	b101      	cbz	r1, be1c <add_event+0x42>
    be1a:	3960      	subs	r1, #96	; 0x60
    be1c:	4638      	mov	r0, r7
    be1e:	f7ff fec3 	bl	bba8 <z_sched_prio_cmp>
    be22:	2800      	cmp	r0, #0
    be24:	dd05      	ble.n	be32 <add_event+0x58>
    be26:	6873      	ldr	r3, [r6, #4]
    be28:	e9c5 6300 	strd	r6, r3, [r5]
    be2c:	601d      	str	r5, [r3, #0]
    be2e:	6075      	str	r5, [r6, #4]
    be30:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    be32:	6863      	ldr	r3, [r4, #4]
    be34:	429e      	cmp	r6, r3
    be36:	d0d7      	beq.n	bde8 <add_event+0xe>
    be38:	6836      	ldr	r6, [r6, #0]
    be3a:	e7ea      	b.n	be12 <add_event+0x38>

0000be3c <register_events>:
    be3c:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    be40:	2500      	movs	r5, #0
    be42:	468b      	mov	fp, r1
    be44:	4614      	mov	r4, r2
    be46:	461f      	mov	r7, r3
    be48:	4682      	mov	sl, r0
    be4a:	462e      	mov	r6, r5
    be4c:	46a8      	mov	r8, r5
    be4e:	455d      	cmp	r5, fp
    be50:	db02      	blt.n	be58 <register_events+0x1c>
    be52:	4630      	mov	r0, r6
    be54:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    be58:	f04f 0320 	mov.w	r3, #32
    be5c:	f3ef 8911 	mrs	r9, BASEPRI
    be60:	f383 8812 	msr	BASEPRI_MAX, r3
    be64:	f3bf 8f6f 	isb	sy
    be68:	f89a 300d 	ldrb.w	r3, [sl, #13]
    be6c:	f003 033f 	and.w	r3, r3, #63	; 0x3f
    be70:	3b01      	subs	r3, #1
    be72:	2b07      	cmp	r3, #7
    be74:	d80f      	bhi.n	be96 <register_events+0x5a>
    be76:	e8df f003 	tbb	[pc, r3]
    be7a:	041e      	.short	0x041e
    be7c:	0e0e0a0e 	.word	0x0e0e0a0e
    be80:	250e      	.short	0x250e
    be82:	f8da 3010 	ldr.w	r3, [sl, #16]
    be86:	689b      	ldr	r3, [r3, #8]
    be88:	b12b      	cbz	r3, be96 <register_events+0x5a>
    be8a:	2302      	movs	r3, #2
    be8c:	e020      	b.n	bed0 <register_events+0x94>
    be8e:	f8da 3010 	ldr.w	r3, [sl, #16]
    be92:	681b      	ldr	r3, [r3, #0]
    be94:	bb8b      	cbnz	r3, befa <register_events+0xbe>
    be96:	bb47      	cbnz	r7, beea <register_events+0xae>
    be98:	7823      	ldrb	r3, [r4, #0]
    be9a:	b333      	cbz	r3, beea <register_events+0xae>
    be9c:	f89a 300d 	ldrb.w	r3, [sl, #13]
    bea0:	f003 033f 	and.w	r3, r3, #63	; 0x3f
    bea4:	3b01      	subs	r3, #1
    bea6:	2b07      	cmp	r3, #7
    bea8:	d830      	bhi.n	bf0c <register_events+0xd0>
    beaa:	e8df f003 	tbb	[pc, r3]
    beae:	2833      	.short	0x2833
    beb0:	2f2f282f 	.word	0x2f2f282f
    beb4:	382f      	.short	0x382f
    beb6:	f8da 3010 	ldr.w	r3, [sl, #16]
    beba:	689b      	ldr	r3, [r3, #8]
    bebc:	2b00      	cmp	r3, #0
    bebe:	d0ea      	beq.n	be96 <register_events+0x5a>
    bec0:	2301      	movs	r3, #1
    bec2:	e005      	b.n	bed0 <register_events+0x94>
    bec4:	f8da 3010 	ldr.w	r3, [sl, #16]
    bec8:	6a1b      	ldr	r3, [r3, #32]
    beca:	2b00      	cmp	r3, #0
    becc:	d0e3      	beq.n	be96 <register_events+0x5a>
    bece:	2310      	movs	r3, #16
    bed0:	f8da 200c 	ldr.w	r2, [sl, #12]
    bed4:	f8ca 8008 	str.w	r8, [sl, #8]
    bed8:	f3c2 3186 	ubfx	r1, r2, #14, #7
    bedc:	430b      	orrs	r3, r1
    bede:	f363 3294 	bfi	r2, r3, #14, #7
    bee2:	f8ca 200c 	str.w	r2, [sl, #12]
    bee6:	f884 8000 	strb.w	r8, [r4]
    beea:	f389 8811 	msr	BASEPRI, r9
    beee:	f3bf 8f6f 	isb	sy
    bef2:	3501      	adds	r5, #1
    bef4:	f10a 0a14 	add.w	sl, sl, #20
    bef8:	e7a9      	b.n	be4e <register_events+0x12>
    befa:	2304      	movs	r3, #4
    befc:	e7e8      	b.n	bed0 <register_events+0x94>
    befe:	f8da 0010 	ldr.w	r0, [sl, #16]
    bf02:	4622      	mov	r2, r4
    bf04:	4651      	mov	r1, sl
    bf06:	3010      	adds	r0, #16
    bf08:	f7ff ff67 	bl	bdda <add_event>
    bf0c:	f8ca 4008 	str.w	r4, [sl, #8]
    bf10:	3601      	adds	r6, #1
    bf12:	e7ea      	b.n	beea <register_events+0xae>
    bf14:	f8da 0010 	ldr.w	r0, [sl, #16]
    bf18:	4622      	mov	r2, r4
    bf1a:	4651      	mov	r1, sl
    bf1c:	e7f4      	b.n	bf08 <register_events+0xcc>
    bf1e:	f8da 0010 	ldr.w	r0, [sl, #16]
    bf22:	4622      	mov	r2, r4
    bf24:	4651      	mov	r1, sl
    bf26:	3024      	adds	r0, #36	; 0x24
    bf28:	e7ee      	b.n	bf08 <register_events+0xcc>

0000bf2a <signal_poll_event>:
    bf2a:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    bf2e:	6884      	ldr	r4, [r0, #8]
    bf30:	4605      	mov	r5, r0
    bf32:	460e      	mov	r6, r1
    bf34:	b144      	cbz	r4, bf48 <signal_poll_event+0x1e>
    bf36:	7863      	ldrb	r3, [r4, #1]
    bf38:	2b01      	cmp	r3, #1
    bf3a:	d12e      	bne.n	bf9a <signal_poll_event+0x70>
    bf3c:	f814 3c53 	ldrb.w	r3, [r4, #-83]
    bf40:	f013 0302 	ands.w	r3, r3, #2
    bf44:	d10a      	bne.n	bf5c <signal_poll_event+0x32>
    bf46:	7023      	strb	r3, [r4, #0]
    bf48:	68eb      	ldr	r3, [r5, #12]
    bf4a:	f3c3 3286 	ubfx	r2, r3, #14, #7
    bf4e:	4316      	orrs	r6, r2
    bf50:	2000      	movs	r0, #0
    bf52:	f366 3394 	bfi	r3, r6, #14, #7
    bf56:	60a8      	str	r0, [r5, #8]
    bf58:	60eb      	str	r3, [r5, #12]
    bf5a:	e03e      	b.n	bfda <signal_poll_event+0xb0>
    bf5c:	e954 230e 	ldrd	r2, r3, [r4, #-56]	; 0x38
    bf60:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
    bf64:	bf08      	it	eq
    bf66:	f112 0f02 	cmneq.w	r2, #2
    bf6a:	d032      	beq.n	bfd2 <signal_poll_event+0xa8>
    bf6c:	f1a4 0860 	sub.w	r8, r4, #96	; 0x60
    bf70:	4640      	mov	r0, r8
    bf72:	f7ff fe98 	bl	bca6 <z_unpend_thread>
    bf76:	2e08      	cmp	r6, #8
    bf78:	bf0c      	ite	eq
    bf7a:	f06f 0303 	mvneq.w	r3, #3
    bf7e:	2300      	movne	r3, #0
    bf80:	6523      	str	r3, [r4, #80]	; 0x50
    bf82:	f814 3c53 	ldrb.w	r3, [r4, #-83]
    bf86:	06db      	lsls	r3, r3, #27
    bf88:	d109      	bne.n	bf9e <signal_poll_event+0x74>
    bf8a:	f854 7c48 	ldr.w	r7, [r4, #-72]
    bf8e:	b937      	cbnz	r7, bf9e <signal_poll_event+0x74>
    bf90:	4640      	mov	r0, r8
    bf92:	f7ff fe5c 	bl	bc4e <z_ready_thread>
    bf96:	7027      	strb	r7, [r4, #0]
    bf98:	e7d6      	b.n	bf48 <signal_poll_event+0x1e>
    bf9a:	2b02      	cmp	r3, #2
    bf9c:	d001      	beq.n	bfa2 <signal_poll_event+0x78>
    bf9e:	2300      	movs	r3, #0
    bfa0:	e7d1      	b.n	bf46 <signal_poll_event+0x1c>
    bfa2:	7823      	ldrb	r3, [r4, #0]
    bfa4:	2b00      	cmp	r3, #0
    bfa6:	d0cf      	beq.n	bf48 <signal_poll_event+0x1e>
    bfa8:	f854 7c04 	ldr.w	r7, [r4, #-4]
    bfac:	2f00      	cmp	r7, #0
    bfae:	d0f2      	beq.n	bf96 <signal_poll_event+0x6c>
    bfb0:	f04f 0800 	mov.w	r8, #0
    bfb4:	f1a4 0914 	sub.w	r9, r4, #20
    bfb8:	f104 0014 	add.w	r0, r4, #20
    bfbc:	f7ff fec1 	bl	bd42 <z_abort_timeout>
    bfc0:	f8c4 802c 	str.w	r8, [r4, #44]	; 0x2c
    bfc4:	4649      	mov	r1, r9
    bfc6:	4638      	mov	r0, r7
    bfc8:	f000 f87c 	bl	c0c4 <z_work_submit_to_queue>
    bfcc:	f884 8000 	strb.w	r8, [r4]
    bfd0:	e7ba      	b.n	bf48 <signal_poll_event+0x1e>
    bfd2:	2300      	movs	r3, #0
    bfd4:	7023      	strb	r3, [r4, #0]
    bfd6:	f06f 000a 	mvn.w	r0, #10
    bfda:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

0000bfde <clear_event_registrations>:
    bfde:	2314      	movs	r3, #20
    bfe0:	b5f0      	push	{r4, r5, r6, r7, lr}
    bfe2:	fb03 0001 	mla	r0, r3, r1, r0
    bfe6:	2400      	movs	r4, #0
    bfe8:	f44f 768b 	mov.w	r6, #278	; 0x116
    bfec:	b901      	cbnz	r1, bff0 <clear_event_registrations+0x12>
    bfee:	bdf0      	pop	{r4, r5, r6, r7, pc}
    bff0:	f810 3c07 	ldrb.w	r3, [r0, #-7]
    bff4:	f840 4c0c 	str.w	r4, [r0, #-12]
    bff8:	f003 033f 	and.w	r3, r3, #63	; 0x3f
    bffc:	2b08      	cmp	r3, #8
    bffe:	f1a0 0714 	sub.w	r7, r0, #20
    c002:	d80c      	bhi.n	c01e <clear_event_registrations+0x40>
    c004:	fa26 f303 	lsr.w	r3, r6, r3
    c008:	07db      	lsls	r3, r3, #31
    c00a:	d508      	bpl.n	c01e <clear_event_registrations+0x40>
    c00c:	f850 3c14 	ldr.w	r3, [r0, #-20]
    c010:	b12b      	cbz	r3, c01e <clear_event_registrations+0x40>
    c012:	f850 5c10 	ldr.w	r5, [r0, #-16]
    c016:	602b      	str	r3, [r5, #0]
    c018:	605d      	str	r5, [r3, #4]
    c01a:	e940 4405 	strd	r4, r4, [r0, #-20]
    c01e:	f382 8811 	msr	BASEPRI, r2
    c022:	f3bf 8f6f 	isb	sy
    c026:	f04f 0320 	mov.w	r3, #32
    c02a:	f3ef 8211 	mrs	r2, BASEPRI
    c02e:	f383 8812 	msr	BASEPRI_MAX, r3
    c032:	f3bf 8f6f 	isb	sy
    c036:	3901      	subs	r1, #1
    c038:	4638      	mov	r0, r7
    c03a:	e7d7      	b.n	bfec <clear_event_registrations+0xe>

0000c03c <k_poll_event_init>:
    c03c:	b510      	push	{r4, lr}
    c03e:	0552      	lsls	r2, r2, #21
    c040:	0209      	lsls	r1, r1, #8
    c042:	f401 517c 	and.w	r1, r1, #16128	; 0x3f00
    c046:	f402 1200 	and.w	r2, r2, #2097152	; 0x200000
    c04a:	430a      	orrs	r2, r1
    c04c:	7b01      	ldrb	r1, [r0, #12]
    c04e:	2400      	movs	r4, #0
    c050:	430a      	orrs	r2, r1
    c052:	e9c0 2303 	strd	r2, r3, [r0, #12]
    c056:	6084      	str	r4, [r0, #8]
    c058:	bd10      	pop	{r4, pc}

0000c05a <z_handle_obj_poll_events>:
    c05a:	4603      	mov	r3, r0
    c05c:	6800      	ldr	r0, [r0, #0]
    c05e:	4283      	cmp	r3, r0
    c060:	d008      	beq.n	c074 <z_handle_obj_poll_events+0x1a>
    c062:	e9d0 3200 	ldrd	r3, r2, [r0]
    c066:	6013      	str	r3, [r2, #0]
    c068:	605a      	str	r2, [r3, #4]
    c06a:	2300      	movs	r3, #0
    c06c:	e9c0 3300 	strd	r3, r3, [r0]
    c070:	f7ff bf5b 	b.w	bf2a <signal_poll_event>
    c074:	4770      	bx	lr

0000c076 <z_impl_k_poll_signal_init>:
    c076:	2300      	movs	r3, #0
    c078:	e9c0 0000 	strd	r0, r0, [r0]
    c07c:	6083      	str	r3, [r0, #8]
    c07e:	4770      	bx	lr

0000c080 <z_impl_k_poll_signal_reset>:
    c080:	2300      	movs	r3, #0
    c082:	6083      	str	r3, [r0, #8]
    c084:	4770      	bx	lr

0000c086 <z_impl_k_poll_signal_check>:
    c086:	6883      	ldr	r3, [r0, #8]
    c088:	600b      	str	r3, [r1, #0]
    c08a:	68c3      	ldr	r3, [r0, #12]
    c08c:	6013      	str	r3, [r2, #0]
    c08e:	4770      	bx	lr

0000c090 <k_heap_init>:
    c090:	b410      	push	{r4}
    c092:	f100 040c 	add.w	r4, r0, #12
    c096:	e9c0 4403 	strd	r4, r4, [r0, #12]
    c09a:	bc10      	pop	{r4}
    c09c:	f7fd bfb8 	b.w	a010 <sys_heap_init>

0000c0a0 <flag_test_and_clear>:
    c0a0:	6802      	ldr	r2, [r0, #0]
    c0a2:	2301      	movs	r3, #1
    c0a4:	408b      	lsls	r3, r1
    c0a6:	ea22 0303 	bic.w	r3, r2, r3
    c0aa:	6003      	str	r3, [r0, #0]
    c0ac:	fa22 f001 	lsr.w	r0, r2, r1
    c0b0:	f000 0001 	and.w	r0, r0, #1
    c0b4:	4770      	bx	lr

0000c0b6 <notify_queue_locked.isra.0>:
    c0b6:	b120      	cbz	r0, c0c2 <notify_queue_locked.isra.0+0xc>
    c0b8:	2200      	movs	r2, #0
    c0ba:	4611      	mov	r1, r2
    c0bc:	30c0      	adds	r0, #192	; 0xc0
    c0be:	f7ff be1c 	b.w	bcfa <z_sched_wake>
    c0c2:	4770      	bx	lr

0000c0c4 <z_work_submit_to_queue>:
    c0c4:	b513      	push	{r0, r1, r4, lr}
    c0c6:	9001      	str	r0, [sp, #4]
    c0c8:	4608      	mov	r0, r1
    c0ca:	f04f 0320 	mov.w	r3, #32
    c0ce:	f3ef 8411 	mrs	r4, BASEPRI
    c0d2:	f383 8812 	msr	BASEPRI_MAX, r3
    c0d6:	f3bf 8f6f 	isb	sy
    c0da:	a901      	add	r1, sp, #4
    c0dc:	f7fc fcde 	bl	8a9c <submit_to_queue_locked>
    c0e0:	f384 8811 	msr	BASEPRI, r4
    c0e4:	f3bf 8f6f 	isb	sy
    c0e8:	b002      	add	sp, #8
    c0ea:	bd10      	pop	{r4, pc}

0000c0ec <_OffsetAbsSyms>:
    c0ec:	4770      	bx	lr

0000c0ee <abort>:
    c0ee:	b508      	push	{r3, lr}
    c0f0:	2006      	movs	r0, #6
    c0f2:	f7fc fe39 	bl	8d68 <raise>
    c0f6:	2001      	movs	r0, #1
    c0f8:	f7f9 fcdc 	bl	5ab4 <_exit>

0000c0fc <memcmp>:
    c0fc:	b510      	push	{r4, lr}
    c0fe:	3901      	subs	r1, #1
    c100:	4402      	add	r2, r0
    c102:	4290      	cmp	r0, r2
    c104:	d101      	bne.n	c10a <memcmp+0xe>
    c106:	2000      	movs	r0, #0
    c108:	e005      	b.n	c116 <memcmp+0x1a>
    c10a:	7803      	ldrb	r3, [r0, #0]
    c10c:	f811 4f01 	ldrb.w	r4, [r1, #1]!
    c110:	42a3      	cmp	r3, r4
    c112:	d001      	beq.n	c118 <memcmp+0x1c>
    c114:	1b18      	subs	r0, r3, r4
    c116:	bd10      	pop	{r4, pc}
    c118:	3001      	adds	r0, #1
    c11a:	e7f2      	b.n	c102 <memcmp+0x6>

0000c11c <memcpy>:
    c11c:	440a      	add	r2, r1
    c11e:	4291      	cmp	r1, r2
    c120:	f100 33ff 	add.w	r3, r0, #4294967295	; 0xffffffff
    c124:	d100      	bne.n	c128 <memcpy+0xc>
    c126:	4770      	bx	lr
    c128:	b510      	push	{r4, lr}
    c12a:	f811 4b01 	ldrb.w	r4, [r1], #1
    c12e:	f803 4f01 	strb.w	r4, [r3, #1]!
    c132:	4291      	cmp	r1, r2
    c134:	d1f9      	bne.n	c12a <memcpy+0xe>
    c136:	bd10      	pop	{r4, pc}

0000c138 <memmove>:
    c138:	4288      	cmp	r0, r1
    c13a:	b510      	push	{r4, lr}
    c13c:	eb01 0402 	add.w	r4, r1, r2
    c140:	d902      	bls.n	c148 <memmove+0x10>
    c142:	4284      	cmp	r4, r0
    c144:	4623      	mov	r3, r4
    c146:	d807      	bhi.n	c158 <memmove+0x20>
    c148:	1e43      	subs	r3, r0, #1
    c14a:	42a1      	cmp	r1, r4
    c14c:	d008      	beq.n	c160 <memmove+0x28>
    c14e:	f811 2b01 	ldrb.w	r2, [r1], #1
    c152:	f803 2f01 	strb.w	r2, [r3, #1]!
    c156:	e7f8      	b.n	c14a <memmove+0x12>
    c158:	4402      	add	r2, r0
    c15a:	4601      	mov	r1, r0
    c15c:	428a      	cmp	r2, r1
    c15e:	d100      	bne.n	c162 <memmove+0x2a>
    c160:	bd10      	pop	{r4, pc}
    c162:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
    c166:	f802 4d01 	strb.w	r4, [r2, #-1]!
    c16a:	e7f7      	b.n	c15c <memmove+0x24>

0000c16c <memset>:
    c16c:	4402      	add	r2, r0
    c16e:	4603      	mov	r3, r0
    c170:	4293      	cmp	r3, r2
    c172:	d100      	bne.n	c176 <memset+0xa>
    c174:	4770      	bx	lr
    c176:	f803 1b01 	strb.w	r1, [r3], #1
    c17a:	e7f9      	b.n	c170 <memset+0x4>

0000c17c <__memset_chk>:
    c17c:	429a      	cmp	r2, r3
    c17e:	b508      	push	{r3, lr}
    c180:	d901      	bls.n	c186 <__memset_chk+0xa>
    c182:	f7f9 fcb3 	bl	5aec <__chk_fail>
    c186:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    c18a:	f7ff bfef 	b.w	c16c <memset>

0000c18e <_raise_r>:
    c18e:	291f      	cmp	r1, #31
    c190:	b538      	push	{r3, r4, r5, lr}
    c192:	4605      	mov	r5, r0
    c194:	460c      	mov	r4, r1
    c196:	d904      	bls.n	c1a2 <_raise_r+0x14>
    c198:	2316      	movs	r3, #22
    c19a:	6003      	str	r3, [r0, #0]
    c19c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    c1a0:	bd38      	pop	{r3, r4, r5, pc}
    c1a2:	6c42      	ldr	r2, [r0, #68]	; 0x44
    c1a4:	b112      	cbz	r2, c1ac <_raise_r+0x1e>
    c1a6:	f852 3021 	ldr.w	r3, [r2, r1, lsl #2]
    c1aa:	b94b      	cbnz	r3, c1c0 <_raise_r+0x32>
    c1ac:	4628      	mov	r0, r5
    c1ae:	f000 f816 	bl	c1de <_getpid_r>
    c1b2:	4622      	mov	r2, r4
    c1b4:	4601      	mov	r1, r0
    c1b6:	4628      	mov	r0, r5
    c1b8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    c1bc:	f7fc bddc 	b.w	8d78 <_kill_r>
    c1c0:	2b01      	cmp	r3, #1
    c1c2:	d00a      	beq.n	c1da <_raise_r+0x4c>
    c1c4:	1c59      	adds	r1, r3, #1
    c1c6:	d103      	bne.n	c1d0 <_raise_r+0x42>
    c1c8:	2316      	movs	r3, #22
    c1ca:	6003      	str	r3, [r0, #0]
    c1cc:	2001      	movs	r0, #1
    c1ce:	e7e7      	b.n	c1a0 <_raise_r+0x12>
    c1d0:	2100      	movs	r1, #0
    c1d2:	f842 1024 	str.w	r1, [r2, r4, lsl #2]
    c1d6:	4620      	mov	r0, r4
    c1d8:	4798      	blx	r3
    c1da:	2000      	movs	r0, #0
    c1dc:	e7e0      	b.n	c1a0 <_raise_r+0x12>

0000c1de <_getpid_r>:
    c1de:	f7ff b883 	b.w	b2e8 <_getpid>

0000c1e2 <strchr>:
    c1e2:	b2c9      	uxtb	r1, r1
    c1e4:	4603      	mov	r3, r0
    c1e6:	4618      	mov	r0, r3
    c1e8:	f813 2b01 	ldrb.w	r2, [r3], #1
    c1ec:	b112      	cbz	r2, c1f4 <strchr+0x12>
    c1ee:	428a      	cmp	r2, r1
    c1f0:	d1f9      	bne.n	c1e6 <strchr+0x4>
    c1f2:	4770      	bx	lr
    c1f4:	2900      	cmp	r1, #0
    c1f6:	bf18      	it	ne
    c1f8:	2000      	movne	r0, #0
    c1fa:	4770      	bx	lr

0000c1fc <strcpy>:
    c1fc:	4603      	mov	r3, r0
    c1fe:	f811 2b01 	ldrb.w	r2, [r1], #1
    c202:	f803 2b01 	strb.w	r2, [r3], #1
    c206:	2a00      	cmp	r2, #0
    c208:	d1f9      	bne.n	c1fe <strcpy+0x2>
    c20a:	4770      	bx	lr

0000c20c <strncmp>:
    c20c:	b510      	push	{r4, lr}
    c20e:	b16a      	cbz	r2, c22c <strncmp+0x20>
    c210:	3901      	subs	r1, #1
    c212:	1884      	adds	r4, r0, r2
    c214:	f810 2b01 	ldrb.w	r2, [r0], #1
    c218:	f811 3f01 	ldrb.w	r3, [r1, #1]!
    c21c:	429a      	cmp	r2, r3
    c21e:	d103      	bne.n	c228 <strncmp+0x1c>
    c220:	42a0      	cmp	r0, r4
    c222:	d001      	beq.n	c228 <strncmp+0x1c>
    c224:	2a00      	cmp	r2, #0
    c226:	d1f5      	bne.n	c214 <strncmp+0x8>
    c228:	1ad0      	subs	r0, r2, r3
    c22a:	bd10      	pop	{r4, pc}
    c22c:	4610      	mov	r0, r2
    c22e:	e7fc      	b.n	c22a <strncmp+0x1e>

0000c230 <strncpy>:
    c230:	b510      	push	{r4, lr}
    c232:	3901      	subs	r1, #1
    c234:	4603      	mov	r3, r0
    c236:	b132      	cbz	r2, c246 <strncpy+0x16>
    c238:	f811 4f01 	ldrb.w	r4, [r1, #1]!
    c23c:	f803 4b01 	strb.w	r4, [r3], #1
    c240:	3a01      	subs	r2, #1
    c242:	2c00      	cmp	r4, #0
    c244:	d1f7      	bne.n	c236 <strncpy+0x6>
    c246:	441a      	add	r2, r3
    c248:	2100      	movs	r1, #0
    c24a:	4293      	cmp	r3, r2
    c24c:	d100      	bne.n	c250 <strncpy+0x20>
    c24e:	bd10      	pop	{r4, pc}
    c250:	f803 1b01 	strb.w	r1, [r3], #1
    c254:	e7f9      	b.n	c24a <strncpy+0x1a>

0000c256 <strnlen>:
    c256:	b510      	push	{r4, lr}
    c258:	4602      	mov	r2, r0
    c25a:	4401      	add	r1, r0
    c25c:	428a      	cmp	r2, r1
    c25e:	4613      	mov	r3, r2
    c260:	d003      	beq.n	c26a <strnlen+0x14>
    c262:	781c      	ldrb	r4, [r3, #0]
    c264:	3201      	adds	r2, #1
    c266:	2c00      	cmp	r4, #0
    c268:	d1f8      	bne.n	c25c <strnlen+0x6>
    c26a:	1a18      	subs	r0, r3, r0
    c26c:	bd10      	pop	{r4, pc}

0000c26e <strstr>:
    c26e:	780a      	ldrb	r2, [r1, #0]
    c270:	b570      	push	{r4, r5, r6, lr}
    c272:	b96a      	cbnz	r2, c290 <strstr+0x22>
    c274:	bd70      	pop	{r4, r5, r6, pc}
    c276:	429a      	cmp	r2, r3
    c278:	d109      	bne.n	c28e <strstr+0x20>
    c27a:	460c      	mov	r4, r1
    c27c:	4605      	mov	r5, r0
    c27e:	f814 3f01 	ldrb.w	r3, [r4, #1]!
    c282:	2b00      	cmp	r3, #0
    c284:	d0f6      	beq.n	c274 <strstr+0x6>
    c286:	f815 6f01 	ldrb.w	r6, [r5, #1]!
    c28a:	429e      	cmp	r6, r3
    c28c:	d0f7      	beq.n	c27e <strstr+0x10>
    c28e:	3001      	adds	r0, #1
    c290:	7803      	ldrb	r3, [r0, #0]
    c292:	2b00      	cmp	r3, #0
    c294:	d1ef      	bne.n	c276 <strstr+0x8>
    c296:	4618      	mov	r0, r3
    c298:	e7ec      	b.n	c274 <strstr+0x6>

0000c29a <__sfmoreglue>:
    c29a:	b570      	push	{r4, r5, r6, lr}
    c29c:	2368      	movs	r3, #104	; 0x68
    c29e:	1e4d      	subs	r5, r1, #1
    c2a0:	435d      	muls	r5, r3
    c2a2:	460e      	mov	r6, r1
    c2a4:	f105 0174 	add.w	r1, r5, #116	; 0x74
    c2a8:	f7fc fcdc 	bl	8c64 <_malloc_r>
    c2ac:	4604      	mov	r4, r0
    c2ae:	b140      	cbz	r0, c2c2 <__sfmoreglue+0x28>
    c2b0:	2100      	movs	r1, #0
    c2b2:	e9c0 1600 	strd	r1, r6, [r0]
    c2b6:	300c      	adds	r0, #12
    c2b8:	60a0      	str	r0, [r4, #8]
    c2ba:	f105 0268 	add.w	r2, r5, #104	; 0x68
    c2be:	f7ff ff55 	bl	c16c <memset>
    c2c2:	4620      	mov	r0, r4
    c2c4:	bd70      	pop	{r4, r5, r6, pc}

0000c2c6 <_fwalk_reent>:
    c2c6:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    c2ca:	4606      	mov	r6, r0
    c2cc:	4688      	mov	r8, r1
    c2ce:	f100 0448 	add.w	r4, r0, #72	; 0x48
    c2d2:	2700      	movs	r7, #0
    c2d4:	e9d4 9501 	ldrd	r9, r5, [r4, #4]
    c2d8:	f1b9 0901 	subs.w	r9, r9, #1
    c2dc:	d505      	bpl.n	c2ea <_fwalk_reent+0x24>
    c2de:	6824      	ldr	r4, [r4, #0]
    c2e0:	2c00      	cmp	r4, #0
    c2e2:	d1f7      	bne.n	c2d4 <_fwalk_reent+0xe>
    c2e4:	4638      	mov	r0, r7
    c2e6:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    c2ea:	89ab      	ldrh	r3, [r5, #12]
    c2ec:	2b01      	cmp	r3, #1
    c2ee:	d907      	bls.n	c300 <_fwalk_reent+0x3a>
    c2f0:	f9b5 300e 	ldrsh.w	r3, [r5, #14]
    c2f4:	3301      	adds	r3, #1
    c2f6:	d003      	beq.n	c300 <_fwalk_reent+0x3a>
    c2f8:	4629      	mov	r1, r5
    c2fa:	4630      	mov	r0, r6
    c2fc:	47c0      	blx	r8
    c2fe:	4307      	orrs	r7, r0
    c300:	3568      	adds	r5, #104	; 0x68
    c302:	e7e9      	b.n	c2d8 <_fwalk_reent+0x12>

0000c304 <__ssputs_r>:
    c304:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    c308:	688e      	ldr	r6, [r1, #8]
    c30a:	461f      	mov	r7, r3
    c30c:	42be      	cmp	r6, r7
    c30e:	680b      	ldr	r3, [r1, #0]
    c310:	4682      	mov	sl, r0
    c312:	460c      	mov	r4, r1
    c314:	4690      	mov	r8, r2
    c316:	d82d      	bhi.n	c374 <__ssputs_r+0x70>
    c318:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
    c31c:	f412 6f90 	tst.w	r2, #1152	; 0x480
    c320:	d026      	beq.n	c370 <__ssputs_r+0x6c>
    c322:	6965      	ldr	r5, [r4, #20]
    c324:	6909      	ldr	r1, [r1, #16]
    c326:	eb05 0545 	add.w	r5, r5, r5, lsl #1
    c32a:	eba3 0901 	sub.w	r9, r3, r1
    c32e:	eb05 75d5 	add.w	r5, r5, r5, lsr #31
    c332:	1c7b      	adds	r3, r7, #1
    c334:	444b      	add	r3, r9
    c336:	106d      	asrs	r5, r5, #1
    c338:	429d      	cmp	r5, r3
    c33a:	bf38      	it	cc
    c33c:	461d      	movcc	r5, r3
    c33e:	0553      	lsls	r3, r2, #21
    c340:	d527      	bpl.n	c392 <__ssputs_r+0x8e>
    c342:	4629      	mov	r1, r5
    c344:	f7fc fc8e 	bl	8c64 <_malloc_r>
    c348:	4606      	mov	r6, r0
    c34a:	b360      	cbz	r0, c3a6 <__ssputs_r+0xa2>
    c34c:	6921      	ldr	r1, [r4, #16]
    c34e:	464a      	mov	r2, r9
    c350:	f7ff fee4 	bl	c11c <memcpy>
    c354:	89a3      	ldrh	r3, [r4, #12]
    c356:	f423 6390 	bic.w	r3, r3, #1152	; 0x480
    c35a:	f043 0380 	orr.w	r3, r3, #128	; 0x80
    c35e:	81a3      	strh	r3, [r4, #12]
    c360:	6126      	str	r6, [r4, #16]
    c362:	6165      	str	r5, [r4, #20]
    c364:	444e      	add	r6, r9
    c366:	eba5 0509 	sub.w	r5, r5, r9
    c36a:	6026      	str	r6, [r4, #0]
    c36c:	60a5      	str	r5, [r4, #8]
    c36e:	463e      	mov	r6, r7
    c370:	42be      	cmp	r6, r7
    c372:	d900      	bls.n	c376 <__ssputs_r+0x72>
    c374:	463e      	mov	r6, r7
    c376:	6820      	ldr	r0, [r4, #0]
    c378:	4632      	mov	r2, r6
    c37a:	4641      	mov	r1, r8
    c37c:	f7ff fedc 	bl	c138 <memmove>
    c380:	68a3      	ldr	r3, [r4, #8]
    c382:	1b9b      	subs	r3, r3, r6
    c384:	60a3      	str	r3, [r4, #8]
    c386:	6823      	ldr	r3, [r4, #0]
    c388:	4433      	add	r3, r6
    c38a:	6023      	str	r3, [r4, #0]
    c38c:	2000      	movs	r0, #0
    c38e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    c392:	462a      	mov	r2, r5
    c394:	f000 f98e 	bl	c6b4 <_realloc_r>
    c398:	4606      	mov	r6, r0
    c39a:	2800      	cmp	r0, #0
    c39c:	d1e0      	bne.n	c360 <__ssputs_r+0x5c>
    c39e:	6921      	ldr	r1, [r4, #16]
    c3a0:	4650      	mov	r0, sl
    c3a2:	f7fc fc15 	bl	8bd0 <_free_r>
    c3a6:	230c      	movs	r3, #12
    c3a8:	f8ca 3000 	str.w	r3, [sl]
    c3ac:	89a3      	ldrh	r3, [r4, #12]
    c3ae:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    c3b2:	81a3      	strh	r3, [r4, #12]
    c3b4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    c3b8:	e7e9      	b.n	c38e <__ssputs_r+0x8a>

0000c3ba <__sfputc_r>:
    c3ba:	6893      	ldr	r3, [r2, #8]
    c3bc:	3b01      	subs	r3, #1
    c3be:	2b00      	cmp	r3, #0
    c3c0:	b410      	push	{r4}
    c3c2:	6093      	str	r3, [r2, #8]
    c3c4:	da07      	bge.n	c3d6 <__sfputc_r+0x1c>
    c3c6:	6994      	ldr	r4, [r2, #24]
    c3c8:	42a3      	cmp	r3, r4
    c3ca:	db01      	blt.n	c3d0 <__sfputc_r+0x16>
    c3cc:	290a      	cmp	r1, #10
    c3ce:	d102      	bne.n	c3d6 <__sfputc_r+0x1c>
    c3d0:	bc10      	pop	{r4}
    c3d2:	f7fd ba3d 	b.w	9850 <__swbuf_r>
    c3d6:	6813      	ldr	r3, [r2, #0]
    c3d8:	1c58      	adds	r0, r3, #1
    c3da:	6010      	str	r0, [r2, #0]
    c3dc:	7019      	strb	r1, [r3, #0]
    c3de:	4608      	mov	r0, r1
    c3e0:	bc10      	pop	{r4}
    c3e2:	4770      	bx	lr

0000c3e4 <__sfputs_r>:
    c3e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    c3e6:	4606      	mov	r6, r0
    c3e8:	460f      	mov	r7, r1
    c3ea:	4614      	mov	r4, r2
    c3ec:	18d5      	adds	r5, r2, r3
    c3ee:	42ac      	cmp	r4, r5
    c3f0:	d101      	bne.n	c3f6 <__sfputs_r+0x12>
    c3f2:	2000      	movs	r0, #0
    c3f4:	e007      	b.n	c406 <__sfputs_r+0x22>
    c3f6:	f814 1b01 	ldrb.w	r1, [r4], #1
    c3fa:	463a      	mov	r2, r7
    c3fc:	4630      	mov	r0, r6
    c3fe:	f7ff ffdc 	bl	c3ba <__sfputc_r>
    c402:	1c43      	adds	r3, r0, #1
    c404:	d1f3      	bne.n	c3ee <__sfputs_r+0xa>
    c406:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

0000c408 <_printf_common>:
    c408:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    c40c:	4616      	mov	r6, r2
    c40e:	4698      	mov	r8, r3
    c410:	688a      	ldr	r2, [r1, #8]
    c412:	690b      	ldr	r3, [r1, #16]
    c414:	f8dd 9020 	ldr.w	r9, [sp, #32]
    c418:	4293      	cmp	r3, r2
    c41a:	bfb8      	it	lt
    c41c:	4613      	movlt	r3, r2
    c41e:	6033      	str	r3, [r6, #0]
    c420:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
    c424:	4607      	mov	r7, r0
    c426:	460c      	mov	r4, r1
    c428:	b10a      	cbz	r2, c42e <_printf_common+0x26>
    c42a:	3301      	adds	r3, #1
    c42c:	6033      	str	r3, [r6, #0]
    c42e:	6823      	ldr	r3, [r4, #0]
    c430:	0699      	lsls	r1, r3, #26
    c432:	bf42      	ittt	mi
    c434:	6833      	ldrmi	r3, [r6, #0]
    c436:	3302      	addmi	r3, #2
    c438:	6033      	strmi	r3, [r6, #0]
    c43a:	6825      	ldr	r5, [r4, #0]
    c43c:	f015 0506 	ands.w	r5, r5, #6
    c440:	d106      	bne.n	c450 <_printf_common+0x48>
    c442:	f104 0a19 	add.w	sl, r4, #25
    c446:	68e3      	ldr	r3, [r4, #12]
    c448:	6832      	ldr	r2, [r6, #0]
    c44a:	1a9b      	subs	r3, r3, r2
    c44c:	42ab      	cmp	r3, r5
    c44e:	dc26      	bgt.n	c49e <_printf_common+0x96>
    c450:	f894 3043 	ldrb.w	r3, [r4, #67]	; 0x43
    c454:	6822      	ldr	r2, [r4, #0]
    c456:	3b00      	subs	r3, #0
    c458:	bf18      	it	ne
    c45a:	2301      	movne	r3, #1
    c45c:	0692      	lsls	r2, r2, #26
    c45e:	d42b      	bmi.n	c4b8 <_printf_common+0xb0>
    c460:	f104 0243 	add.w	r2, r4, #67	; 0x43
    c464:	4641      	mov	r1, r8
    c466:	4638      	mov	r0, r7
    c468:	47c8      	blx	r9
    c46a:	3001      	adds	r0, #1
    c46c:	d01e      	beq.n	c4ac <_printf_common+0xa4>
    c46e:	6823      	ldr	r3, [r4, #0]
    c470:	6922      	ldr	r2, [r4, #16]
    c472:	f003 0306 	and.w	r3, r3, #6
    c476:	2b04      	cmp	r3, #4
    c478:	bf02      	ittt	eq
    c47a:	68e5      	ldreq	r5, [r4, #12]
    c47c:	6833      	ldreq	r3, [r6, #0]
    c47e:	1aed      	subeq	r5, r5, r3
    c480:	68a3      	ldr	r3, [r4, #8]
    c482:	bf0c      	ite	eq
    c484:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
    c488:	2500      	movne	r5, #0
    c48a:	4293      	cmp	r3, r2
    c48c:	bfc4      	itt	gt
    c48e:	1a9b      	subgt	r3, r3, r2
    c490:	18ed      	addgt	r5, r5, r3
    c492:	2600      	movs	r6, #0
    c494:	341a      	adds	r4, #26
    c496:	42b5      	cmp	r5, r6
    c498:	d11a      	bne.n	c4d0 <_printf_common+0xc8>
    c49a:	2000      	movs	r0, #0
    c49c:	e008      	b.n	c4b0 <_printf_common+0xa8>
    c49e:	2301      	movs	r3, #1
    c4a0:	4652      	mov	r2, sl
    c4a2:	4641      	mov	r1, r8
    c4a4:	4638      	mov	r0, r7
    c4a6:	47c8      	blx	r9
    c4a8:	3001      	adds	r0, #1
    c4aa:	d103      	bne.n	c4b4 <_printf_common+0xac>
    c4ac:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    c4b0:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    c4b4:	3501      	adds	r5, #1
    c4b6:	e7c6      	b.n	c446 <_printf_common+0x3e>
    c4b8:	18e1      	adds	r1, r4, r3
    c4ba:	1c5a      	adds	r2, r3, #1
    c4bc:	2030      	movs	r0, #48	; 0x30
    c4be:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
    c4c2:	4422      	add	r2, r4
    c4c4:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
    c4c8:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
    c4cc:	3302      	adds	r3, #2
    c4ce:	e7c7      	b.n	c460 <_printf_common+0x58>
    c4d0:	2301      	movs	r3, #1
    c4d2:	4622      	mov	r2, r4
    c4d4:	4641      	mov	r1, r8
    c4d6:	4638      	mov	r0, r7
    c4d8:	47c8      	blx	r9
    c4da:	3001      	adds	r0, #1
    c4dc:	d0e6      	beq.n	c4ac <_printf_common+0xa4>
    c4de:	3601      	adds	r6, #1
    c4e0:	e7d9      	b.n	c496 <_printf_common+0x8e>

0000c4e2 <__sread>:
    c4e2:	b510      	push	{r4, lr}
    c4e4:	460c      	mov	r4, r1
    c4e6:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    c4ea:	f7fd fb1f 	bl	9b2c <_read_r>
    c4ee:	2800      	cmp	r0, #0
    c4f0:	bfab      	itete	ge
    c4f2:	6d63      	ldrge	r3, [r4, #84]	; 0x54
    c4f4:	89a3      	ldrhlt	r3, [r4, #12]
    c4f6:	181b      	addge	r3, r3, r0
    c4f8:	f423 5380 	biclt.w	r3, r3, #4096	; 0x1000
    c4fc:	bfac      	ite	ge
    c4fe:	6563      	strge	r3, [r4, #84]	; 0x54
    c500:	81a3      	strhlt	r3, [r4, #12]
    c502:	bd10      	pop	{r4, pc}

0000c504 <__swrite>:
    c504:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    c508:	461f      	mov	r7, r3
    c50a:	898b      	ldrh	r3, [r1, #12]
    c50c:	05db      	lsls	r3, r3, #23
    c50e:	4605      	mov	r5, r0
    c510:	460c      	mov	r4, r1
    c512:	4616      	mov	r6, r2
    c514:	d505      	bpl.n	c522 <__swrite+0x1e>
    c516:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    c51a:	2302      	movs	r3, #2
    c51c:	2200      	movs	r2, #0
    c51e:	f7fd fab3 	bl	9a88 <_lseek_r>
    c522:	89a3      	ldrh	r3, [r4, #12]
    c524:	f9b4 100e 	ldrsh.w	r1, [r4, #14]
    c528:	f423 5380 	bic.w	r3, r3, #4096	; 0x1000
    c52c:	81a3      	strh	r3, [r4, #12]
    c52e:	4632      	mov	r2, r6
    c530:	463b      	mov	r3, r7
    c532:	4628      	mov	r0, r5
    c534:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    c538:	f7fd b9dc 	b.w	98f4 <_write_r>

0000c53c <__sseek>:
    c53c:	b510      	push	{r4, lr}
    c53e:	460c      	mov	r4, r1
    c540:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    c544:	f7fd faa0 	bl	9a88 <_lseek_r>
    c548:	1c43      	adds	r3, r0, #1
    c54a:	89a3      	ldrh	r3, [r4, #12]
    c54c:	bf15      	itete	ne
    c54e:	6560      	strne	r0, [r4, #84]	; 0x54
    c550:	f423 5380 	biceq.w	r3, r3, #4096	; 0x1000
    c554:	f443 5380 	orrne.w	r3, r3, #4096	; 0x1000
    c558:	81a3      	strheq	r3, [r4, #12]
    c55a:	bf18      	it	ne
    c55c:	81a3      	strhne	r3, [r4, #12]
    c55e:	bd10      	pop	{r4, pc}

0000c560 <__sclose>:
    c560:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    c564:	f7fd ba44 	b.w	99f0 <_close_r>

0000c568 <__sflush_r>:
    c568:	f9b1 200c 	ldrsh.w	r2, [r1, #12]
    c56c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    c56e:	0717      	lsls	r7, r2, #28
    c570:	4605      	mov	r5, r0
    c572:	460c      	mov	r4, r1
    c574:	d456      	bmi.n	c624 <__sflush_r+0xbc>
    c576:	684b      	ldr	r3, [r1, #4]
    c578:	2b00      	cmp	r3, #0
    c57a:	dc02      	bgt.n	c582 <__sflush_r+0x1a>
    c57c:	6c0b      	ldr	r3, [r1, #64]	; 0x40
    c57e:	2b00      	cmp	r3, #0
    c580:	dd3d      	ble.n	c5fe <__sflush_r+0x96>
    c582:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
    c584:	2e00      	cmp	r6, #0
    c586:	d03a      	beq.n	c5fe <__sflush_r+0x96>
    c588:	2300      	movs	r3, #0
    c58a:	f412 5280 	ands.w	r2, r2, #4096	; 0x1000
    c58e:	682f      	ldr	r7, [r5, #0]
    c590:	6a21      	ldr	r1, [r4, #32]
    c592:	602b      	str	r3, [r5, #0]
    c594:	d025      	beq.n	c5e2 <__sflush_r+0x7a>
    c596:	6d62      	ldr	r2, [r4, #84]	; 0x54
    c598:	89a3      	ldrh	r3, [r4, #12]
    c59a:	0758      	lsls	r0, r3, #29
    c59c:	d505      	bpl.n	c5aa <__sflush_r+0x42>
    c59e:	6863      	ldr	r3, [r4, #4]
    c5a0:	1ad2      	subs	r2, r2, r3
    c5a2:	6b63      	ldr	r3, [r4, #52]	; 0x34
    c5a4:	b10b      	cbz	r3, c5aa <__sflush_r+0x42>
    c5a6:	6c23      	ldr	r3, [r4, #64]	; 0x40
    c5a8:	1ad2      	subs	r2, r2, r3
    c5aa:	6a21      	ldr	r1, [r4, #32]
    c5ac:	6ae6      	ldr	r6, [r4, #44]	; 0x2c
    c5ae:	2300      	movs	r3, #0
    c5b0:	4628      	mov	r0, r5
    c5b2:	47b0      	blx	r6
    c5b4:	1c41      	adds	r1, r0, #1
    c5b6:	d024      	beq.n	c602 <__sflush_r+0x9a>
    c5b8:	2300      	movs	r3, #0
    c5ba:	6063      	str	r3, [r4, #4]
    c5bc:	6923      	ldr	r3, [r4, #16]
    c5be:	6023      	str	r3, [r4, #0]
    c5c0:	89a3      	ldrh	r3, [r4, #12]
    c5c2:	04da      	lsls	r2, r3, #19
    c5c4:	d500      	bpl.n	c5c8 <__sflush_r+0x60>
    c5c6:	6560      	str	r0, [r4, #84]	; 0x54
    c5c8:	6b61      	ldr	r1, [r4, #52]	; 0x34
    c5ca:	602f      	str	r7, [r5, #0]
    c5cc:	b1b9      	cbz	r1, c5fe <__sflush_r+0x96>
    c5ce:	f104 0344 	add.w	r3, r4, #68	; 0x44
    c5d2:	4299      	cmp	r1, r3
    c5d4:	d002      	beq.n	c5dc <__sflush_r+0x74>
    c5d6:	4628      	mov	r0, r5
    c5d8:	f7fc fafa 	bl	8bd0 <_free_r>
    c5dc:	2300      	movs	r3, #0
    c5de:	6363      	str	r3, [r4, #52]	; 0x34
    c5e0:	e00d      	b.n	c5fe <__sflush_r+0x96>
    c5e2:	2301      	movs	r3, #1
    c5e4:	4628      	mov	r0, r5
    c5e6:	47b0      	blx	r6
    c5e8:	1c46      	adds	r6, r0, #1
    c5ea:	4602      	mov	r2, r0
    c5ec:	d1d4      	bne.n	c598 <__sflush_r+0x30>
    c5ee:	682b      	ldr	r3, [r5, #0]
    c5f0:	2b00      	cmp	r3, #0
    c5f2:	d0d1      	beq.n	c598 <__sflush_r+0x30>
    c5f4:	2b1d      	cmp	r3, #29
    c5f6:	d001      	beq.n	c5fc <__sflush_r+0x94>
    c5f8:	2b16      	cmp	r3, #22
    c5fa:	d12a      	bne.n	c652 <__sflush_r+0xea>
    c5fc:	602f      	str	r7, [r5, #0]
    c5fe:	2000      	movs	r0, #0
    c600:	e02e      	b.n	c660 <__sflush_r+0xf8>
    c602:	682a      	ldr	r2, [r5, #0]
    c604:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    c608:	b142      	cbz	r2, c61c <__sflush_r+0xb4>
    c60a:	2a1d      	cmp	r2, #29
    c60c:	d001      	beq.n	c612 <__sflush_r+0xaa>
    c60e:	2a16      	cmp	r2, #22
    c610:	d121      	bne.n	c656 <__sflush_r+0xee>
    c612:	2300      	movs	r3, #0
    c614:	6063      	str	r3, [r4, #4]
    c616:	6923      	ldr	r3, [r4, #16]
    c618:	6023      	str	r3, [r4, #0]
    c61a:	e7d5      	b.n	c5c8 <__sflush_r+0x60>
    c61c:	6062      	str	r2, [r4, #4]
    c61e:	6922      	ldr	r2, [r4, #16]
    c620:	6022      	str	r2, [r4, #0]
    c622:	e7ce      	b.n	c5c2 <__sflush_r+0x5a>
    c624:	690f      	ldr	r7, [r1, #16]
    c626:	2f00      	cmp	r7, #0
    c628:	d0e9      	beq.n	c5fe <__sflush_r+0x96>
    c62a:	0793      	lsls	r3, r2, #30
    c62c:	680e      	ldr	r6, [r1, #0]
    c62e:	bf08      	it	eq
    c630:	694b      	ldreq	r3, [r1, #20]
    c632:	600f      	str	r7, [r1, #0]
    c634:	bf18      	it	ne
    c636:	2300      	movne	r3, #0
    c638:	1bf6      	subs	r6, r6, r7
    c63a:	608b      	str	r3, [r1, #8]
    c63c:	2e00      	cmp	r6, #0
    c63e:	ddde      	ble.n	c5fe <__sflush_r+0x96>
    c640:	6a21      	ldr	r1, [r4, #32]
    c642:	f8d4 c028 	ldr.w	ip, [r4, #40]	; 0x28
    c646:	4633      	mov	r3, r6
    c648:	463a      	mov	r2, r7
    c64a:	4628      	mov	r0, r5
    c64c:	47e0      	blx	ip
    c64e:	2800      	cmp	r0, #0
    c650:	dc07      	bgt.n	c662 <__sflush_r+0xfa>
    c652:	f9b4 300c 	ldrsh.w	r3, [r4, #12]
    c656:	f043 0340 	orr.w	r3, r3, #64	; 0x40
    c65a:	81a3      	strh	r3, [r4, #12]
    c65c:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
    c660:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    c662:	4407      	add	r7, r0
    c664:	1a36      	subs	r6, r6, r0
    c666:	e7e9      	b.n	c63c <__sflush_r+0xd4>

0000c668 <__swhatbuf_r>:
    c668:	b570      	push	{r4, r5, r6, lr}
    c66a:	460c      	mov	r4, r1
    c66c:	f9b1 100e 	ldrsh.w	r1, [r1, #14]
    c670:	2900      	cmp	r1, #0
    c672:	b096      	sub	sp, #88	; 0x58
    c674:	4615      	mov	r5, r2
    c676:	461e      	mov	r6, r3
    c678:	da0d      	bge.n	c696 <__swhatbuf_r+0x2e>
    c67a:	89a3      	ldrh	r3, [r4, #12]
    c67c:	f013 0f80 	tst.w	r3, #128	; 0x80
    c680:	f04f 0100 	mov.w	r1, #0
    c684:	bf14      	ite	ne
    c686:	2340      	movne	r3, #64	; 0x40
    c688:	f44f 6380 	moveq.w	r3, #1024	; 0x400
    c68c:	2000      	movs	r0, #0
    c68e:	6031      	str	r1, [r6, #0]
    c690:	602b      	str	r3, [r5, #0]
    c692:	b016      	add	sp, #88	; 0x58
    c694:	bd70      	pop	{r4, r5, r6, pc}
    c696:	466a      	mov	r2, sp
    c698:	f7fd fa5a 	bl	9b50 <_fstat_r>
    c69c:	2800      	cmp	r0, #0
    c69e:	dbec      	blt.n	c67a <__swhatbuf_r+0x12>
    c6a0:	9901      	ldr	r1, [sp, #4]
    c6a2:	f401 4170 	and.w	r1, r1, #61440	; 0xf000
    c6a6:	f5a1 5300 	sub.w	r3, r1, #8192	; 0x2000
    c6aa:	4259      	negs	r1, r3
    c6ac:	4159      	adcs	r1, r3
    c6ae:	f44f 6380 	mov.w	r3, #1024	; 0x400
    c6b2:	e7eb      	b.n	c68c <__swhatbuf_r+0x24>

0000c6b4 <_realloc_r>:
    c6b4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    c6b6:	4607      	mov	r7, r0
    c6b8:	4615      	mov	r5, r2
    c6ba:	460c      	mov	r4, r1
    c6bc:	b921      	cbnz	r1, c6c8 <_realloc_r+0x14>
    c6be:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    c6c2:	4611      	mov	r1, r2
    c6c4:	f7fc bace 	b.w	8c64 <_malloc_r>
    c6c8:	b922      	cbnz	r2, c6d4 <_realloc_r+0x20>
    c6ca:	f7fc fa81 	bl	8bd0 <_free_r>
    c6ce:	2400      	movs	r4, #0
    c6d0:	4620      	mov	r0, r4
    c6d2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    c6d4:	f000 f813 	bl	c6fe <_malloc_usable_size_r>
    c6d8:	42a8      	cmp	r0, r5
    c6da:	d2f9      	bcs.n	c6d0 <_realloc_r+0x1c>
    c6dc:	4629      	mov	r1, r5
    c6de:	4638      	mov	r0, r7
    c6e0:	f7fc fac0 	bl	8c64 <_malloc_r>
    c6e4:	4606      	mov	r6, r0
    c6e6:	2800      	cmp	r0, #0
    c6e8:	d0f1      	beq.n	c6ce <_realloc_r+0x1a>
    c6ea:	4621      	mov	r1, r4
    c6ec:	462a      	mov	r2, r5
    c6ee:	f7ff fd15 	bl	c11c <memcpy>
    c6f2:	4621      	mov	r1, r4
    c6f4:	4638      	mov	r0, r7
    c6f6:	f7fc fa6b 	bl	8bd0 <_free_r>
    c6fa:	4634      	mov	r4, r6
    c6fc:	e7e8      	b.n	c6d0 <_realloc_r+0x1c>

0000c6fe <_malloc_usable_size_r>:
    c6fe:	f851 3c04 	ldr.w	r3, [r1, #-4]
    c702:	1f18      	subs	r0, r3, #4
    c704:	2b00      	cmp	r3, #0
    c706:	bfbc      	itt	lt
    c708:	580b      	ldrlt	r3, [r1, r0]
    c70a:	18c0      	addlt	r0, r0, r3
    c70c:	4770      	bx	lr
	...
