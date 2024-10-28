
obj/__user_pgdir.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	0ba000ef          	jal	8000da <umain>
  800024:	a001                	j	800024 <_start+0x4>

0000000000800026 <cputch>:
  800026:	1141                	addi	sp,sp,-16
  800028:	e022                	sd	s0,0(sp)
  80002a:	e406                	sd	ra,8(sp)
  80002c:	842e                	mv	s0,a1
  80002e:	088000ef          	jal	8000b6 <sys_putc>
  800032:	401c                	lw	a5,0(s0)
  800034:	60a2                	ld	ra,8(sp)
  800036:	2785                	addiw	a5,a5,1
  800038:	c01c                	sw	a5,0(s0)
  80003a:	6402                	ld	s0,0(sp)
  80003c:	0141                	addi	sp,sp,16
  80003e:	8082                	ret

0000000000800040 <cprintf>:
  800040:	711d                	addi	sp,sp,-96
  800042:	02810313          	addi	t1,sp,40
  800046:	f42e                	sd	a1,40(sp)
  800048:	f832                	sd	a2,48(sp)
  80004a:	fc36                	sd	a3,56(sp)
  80004c:	862a                	mv	a2,a0
  80004e:	004c                	addi	a1,sp,4
  800050:	00000517          	auipc	a0,0x0
  800054:	fd650513          	addi	a0,a0,-42 # 800026 <cputch>
  800058:	869a                	mv	a3,t1
  80005a:	ec06                	sd	ra,24(sp)
  80005c:	e0ba                	sd	a4,64(sp)
  80005e:	e4be                	sd	a5,72(sp)
  800060:	e8c2                	sd	a6,80(sp)
  800062:	ecc6                	sd	a7,88(sp)
  800064:	e41a                	sd	t1,8(sp)
  800066:	c202                	sw	zero,4(sp)
  800068:	0ec000ef          	jal	800154 <vprintfmt>
  80006c:	60e2                	ld	ra,24(sp)
  80006e:	4512                	lw	a0,4(sp)
  800070:	6125                	addi	sp,sp,96
  800072:	8082                	ret

0000000000800074 <syscall>:
  800074:	7175                	addi	sp,sp,-144
  800076:	e42a                	sd	a0,8(sp)
  800078:	0108                	addi	a0,sp,128
  80007a:	ecae                	sd	a1,88(sp)
  80007c:	f0b2                	sd	a2,96(sp)
  80007e:	f4b6                	sd	a3,104(sp)
  800080:	f8ba                	sd	a4,112(sp)
  800082:	fcbe                	sd	a5,120(sp)
  800084:	e142                	sd	a6,128(sp)
  800086:	e546                	sd	a7,136(sp)
  800088:	f02a                	sd	a0,32(sp)
  80008a:	f42e                	sd	a1,40(sp)
  80008c:	f832                	sd	a2,48(sp)
  80008e:	fc36                	sd	a3,56(sp)
  800090:	e0ba                	sd	a4,64(sp)
  800092:	e4be                	sd	a5,72(sp)
  800094:	4522                	lw	a0,8(sp)
  800096:	55a2                	lw	a1,40(sp)
  800098:	5642                	lw	a2,48(sp)
  80009a:	56e2                	lw	a3,56(sp)
  80009c:	4706                	lw	a4,64(sp)
  80009e:	47a6                	lw	a5,72(sp)
  8000a0:	00000073          	ecall
  8000a4:	ce2a                	sw	a0,28(sp)
  8000a6:	4572                	lw	a0,28(sp)
  8000a8:	6149                	addi	sp,sp,144
  8000aa:	8082                	ret

00000000008000ac <sys_exit>:
  8000ac:	85aa                	mv	a1,a0
  8000ae:	4505                	li	a0,1
  8000b0:	b7d1                	j	800074 <syscall>

00000000008000b2 <sys_getpid>:
  8000b2:	4549                	li	a0,18
  8000b4:	b7c1                	j	800074 <syscall>

00000000008000b6 <sys_putc>:
  8000b6:	85aa                	mv	a1,a0
  8000b8:	4579                	li	a0,30
  8000ba:	bf6d                	j	800074 <syscall>

00000000008000bc <sys_pgdir>:
  8000bc:	457d                	li	a0,31
  8000be:	bf5d                	j	800074 <syscall>

00000000008000c0 <exit>:
  8000c0:	1141                	addi	sp,sp,-16
  8000c2:	e406                	sd	ra,8(sp)
  8000c4:	fe9ff0ef          	jal	8000ac <sys_exit>
  8000c8:	00000517          	auipc	a0,0x0
  8000cc:	45050513          	addi	a0,a0,1104 # 800518 <main+0x2e>
  8000d0:	f71ff0ef          	jal	800040 <cprintf>
  8000d4:	a001                	j	8000d4 <exit+0x14>

00000000008000d6 <getpid>:
  8000d6:	bff1                	j	8000b2 <sys_getpid>

00000000008000d8 <print_pgdir>:
  8000d8:	b7d5                	j	8000bc <sys_pgdir>

00000000008000da <umain>:
  8000da:	1141                	addi	sp,sp,-16
  8000dc:	e406                	sd	ra,8(sp)
  8000de:	40c000ef          	jal	8004ea <main>
  8000e2:	fdfff0ef          	jal	8000c0 <exit>

00000000008000e6 <printnum>:
  8000e6:	02069813          	slli	a6,a3,0x20
  8000ea:	7179                	addi	sp,sp,-48
  8000ec:	02085813          	srli	a6,a6,0x20
  8000f0:	e052                	sd	s4,0(sp)
  8000f2:	03067a33          	remu	s4,a2,a6
  8000f6:	f022                	sd	s0,32(sp)
  8000f8:	ec26                	sd	s1,24(sp)
  8000fa:	e84a                	sd	s2,16(sp)
  8000fc:	f406                	sd	ra,40(sp)
  8000fe:	84aa                	mv	s1,a0
  800100:	892e                	mv	s2,a1
  800102:	fff7041b          	addiw	s0,a4,-1
  800106:	2a01                	sext.w	s4,s4
  800108:	05067063          	bgeu	a2,a6,800148 <printnum+0x62>
  80010c:	e44e                	sd	s3,8(sp)
  80010e:	89be                	mv	s3,a5
  800110:	4785                	li	a5,1
  800112:	00e7d763          	bge	a5,a4,800120 <printnum+0x3a>
  800116:	85ca                	mv	a1,s2
  800118:	854e                	mv	a0,s3
  80011a:	347d                	addiw	s0,s0,-1
  80011c:	9482                	jalr	s1
  80011e:	fc65                	bnez	s0,800116 <printnum+0x30>
  800120:	69a2                	ld	s3,8(sp)
  800122:	1a02                	slli	s4,s4,0x20
  800124:	020a5a13          	srli	s4,s4,0x20
  800128:	00000797          	auipc	a5,0x0
  80012c:	40878793          	addi	a5,a5,1032 # 800530 <main+0x46>
  800130:	97d2                	add	a5,a5,s4
  800132:	7402                	ld	s0,32(sp)
  800134:	0007c503          	lbu	a0,0(a5)
  800138:	70a2                	ld	ra,40(sp)
  80013a:	6a02                	ld	s4,0(sp)
  80013c:	85ca                	mv	a1,s2
  80013e:	87a6                	mv	a5,s1
  800140:	6942                	ld	s2,16(sp)
  800142:	64e2                	ld	s1,24(sp)
  800144:	6145                	addi	sp,sp,48
  800146:	8782                	jr	a5
  800148:	03065633          	divu	a2,a2,a6
  80014c:	8722                	mv	a4,s0
  80014e:	f99ff0ef          	jal	8000e6 <printnum>
  800152:	bfc1                	j	800122 <printnum+0x3c>

0000000000800154 <vprintfmt>:
  800154:	7119                	addi	sp,sp,-128
  800156:	f4a6                	sd	s1,104(sp)
  800158:	f0ca                	sd	s2,96(sp)
  80015a:	ecce                	sd	s3,88(sp)
  80015c:	e8d2                	sd	s4,80(sp)
  80015e:	e4d6                	sd	s5,72(sp)
  800160:	e0da                	sd	s6,64(sp)
  800162:	f862                	sd	s8,48(sp)
  800164:	fc86                	sd	ra,120(sp)
  800166:	f8a2                	sd	s0,112(sp)
  800168:	fc5e                	sd	s7,56(sp)
  80016a:	f466                	sd	s9,40(sp)
  80016c:	f06a                	sd	s10,32(sp)
  80016e:	ec6e                	sd	s11,24(sp)
  800170:	892a                	mv	s2,a0
  800172:	84ae                	mv	s1,a1
  800174:	8c32                	mv	s8,a2
  800176:	8a36                	mv	s4,a3
  800178:	02500993          	li	s3,37
  80017c:	05500b13          	li	s6,85
  800180:	00000a97          	auipc	s5,0x0
  800184:	4d8a8a93          	addi	s5,s5,1240 # 800658 <main+0x16e>
  800188:	000c4503          	lbu	a0,0(s8)
  80018c:	001c0413          	addi	s0,s8,1
  800190:	01350a63          	beq	a0,s3,8001a4 <vprintfmt+0x50>
  800194:	cd0d                	beqz	a0,8001ce <vprintfmt+0x7a>
  800196:	85a6                	mv	a1,s1
  800198:	9902                	jalr	s2
  80019a:	00044503          	lbu	a0,0(s0)
  80019e:	0405                	addi	s0,s0,1
  8001a0:	ff351ae3          	bne	a0,s3,800194 <vprintfmt+0x40>
  8001a4:	02000d93          	li	s11,32
  8001a8:	4b81                	li	s7,0
  8001aa:	4601                	li	a2,0
  8001ac:	5d7d                	li	s10,-1
  8001ae:	5cfd                	li	s9,-1
  8001b0:	00044683          	lbu	a3,0(s0)
  8001b4:	00140c13          	addi	s8,s0,1
  8001b8:	fdd6859b          	addiw	a1,a3,-35
  8001bc:	0ff5f593          	zext.b	a1,a1
  8001c0:	02bb6663          	bltu	s6,a1,8001ec <vprintfmt+0x98>
  8001c4:	058a                	slli	a1,a1,0x2
  8001c6:	95d6                	add	a1,a1,s5
  8001c8:	4198                	lw	a4,0(a1)
  8001ca:	9756                	add	a4,a4,s5
  8001cc:	8702                	jr	a4
  8001ce:	70e6                	ld	ra,120(sp)
  8001d0:	7446                	ld	s0,112(sp)
  8001d2:	74a6                	ld	s1,104(sp)
  8001d4:	7906                	ld	s2,96(sp)
  8001d6:	69e6                	ld	s3,88(sp)
  8001d8:	6a46                	ld	s4,80(sp)
  8001da:	6aa6                	ld	s5,72(sp)
  8001dc:	6b06                	ld	s6,64(sp)
  8001de:	7be2                	ld	s7,56(sp)
  8001e0:	7c42                	ld	s8,48(sp)
  8001e2:	7ca2                	ld	s9,40(sp)
  8001e4:	7d02                	ld	s10,32(sp)
  8001e6:	6de2                	ld	s11,24(sp)
  8001e8:	6109                	addi	sp,sp,128
  8001ea:	8082                	ret
  8001ec:	85a6                	mv	a1,s1
  8001ee:	02500513          	li	a0,37
  8001f2:	9902                	jalr	s2
  8001f4:	fff44703          	lbu	a4,-1(s0)
  8001f8:	02500793          	li	a5,37
  8001fc:	8c22                	mv	s8,s0
  8001fe:	f8f705e3          	beq	a4,a5,800188 <vprintfmt+0x34>
  800202:	02500713          	li	a4,37
  800206:	ffec4783          	lbu	a5,-2(s8)
  80020a:	1c7d                	addi	s8,s8,-1
  80020c:	fee79de3          	bne	a5,a4,800206 <vprintfmt+0xb2>
  800210:	bfa5                	j	800188 <vprintfmt+0x34>
  800212:	00144783          	lbu	a5,1(s0)
  800216:	4725                	li	a4,9
  800218:	fd068d1b          	addiw	s10,a3,-48
  80021c:	fd07859b          	addiw	a1,a5,-48
  800220:	0007869b          	sext.w	a3,a5
  800224:	8462                	mv	s0,s8
  800226:	02b76563          	bltu	a4,a1,800250 <vprintfmt+0xfc>
  80022a:	4525                	li	a0,9
  80022c:	00144783          	lbu	a5,1(s0)
  800230:	002d171b          	slliw	a4,s10,0x2
  800234:	01a7073b          	addw	a4,a4,s10
  800238:	0017171b          	slliw	a4,a4,0x1
  80023c:	9f35                	addw	a4,a4,a3
  80023e:	fd07859b          	addiw	a1,a5,-48
  800242:	0405                	addi	s0,s0,1
  800244:	fd070d1b          	addiw	s10,a4,-48
  800248:	0007869b          	sext.w	a3,a5
  80024c:	feb570e3          	bgeu	a0,a1,80022c <vprintfmt+0xd8>
  800250:	f60cd0e3          	bgez	s9,8001b0 <vprintfmt+0x5c>
  800254:	8cea                	mv	s9,s10
  800256:	5d7d                	li	s10,-1
  800258:	bfa1                	j	8001b0 <vprintfmt+0x5c>
  80025a:	8db6                	mv	s11,a3
  80025c:	8462                	mv	s0,s8
  80025e:	bf89                	j	8001b0 <vprintfmt+0x5c>
  800260:	8462                	mv	s0,s8
  800262:	4b85                	li	s7,1
  800264:	b7b1                	j	8001b0 <vprintfmt+0x5c>
  800266:	4785                	li	a5,1
  800268:	008a0713          	addi	a4,s4,8
  80026c:	00c7c463          	blt	a5,a2,800274 <vprintfmt+0x120>
  800270:	1a060163          	beqz	a2,800412 <vprintfmt+0x2be>
  800274:	000a3603          	ld	a2,0(s4)
  800278:	46c1                	li	a3,16
  80027a:	8a3a                	mv	s4,a4
  80027c:	000d879b          	sext.w	a5,s11
  800280:	8766                	mv	a4,s9
  800282:	85a6                	mv	a1,s1
  800284:	854a                	mv	a0,s2
  800286:	e61ff0ef          	jal	8000e6 <printnum>
  80028a:	bdfd                	j	800188 <vprintfmt+0x34>
  80028c:	000a2503          	lw	a0,0(s4)
  800290:	85a6                	mv	a1,s1
  800292:	0a21                	addi	s4,s4,8
  800294:	9902                	jalr	s2
  800296:	bdcd                	j	800188 <vprintfmt+0x34>
  800298:	4785                	li	a5,1
  80029a:	008a0713          	addi	a4,s4,8
  80029e:	00c7c463          	blt	a5,a2,8002a6 <vprintfmt+0x152>
  8002a2:	16060363          	beqz	a2,800408 <vprintfmt+0x2b4>
  8002a6:	000a3603          	ld	a2,0(s4)
  8002aa:	46a9                	li	a3,10
  8002ac:	8a3a                	mv	s4,a4
  8002ae:	b7f9                	j	80027c <vprintfmt+0x128>
  8002b0:	85a6                	mv	a1,s1
  8002b2:	03000513          	li	a0,48
  8002b6:	9902                	jalr	s2
  8002b8:	85a6                	mv	a1,s1
  8002ba:	07800513          	li	a0,120
  8002be:	9902                	jalr	s2
  8002c0:	000a3603          	ld	a2,0(s4)
  8002c4:	46c1                	li	a3,16
  8002c6:	0a21                	addi	s4,s4,8
  8002c8:	bf55                	j	80027c <vprintfmt+0x128>
  8002ca:	85a6                	mv	a1,s1
  8002cc:	02500513          	li	a0,37
  8002d0:	9902                	jalr	s2
  8002d2:	bd5d                	j	800188 <vprintfmt+0x34>
  8002d4:	000a2d03          	lw	s10,0(s4)
  8002d8:	8462                	mv	s0,s8
  8002da:	0a21                	addi	s4,s4,8
  8002dc:	bf95                	j	800250 <vprintfmt+0xfc>
  8002de:	4785                	li	a5,1
  8002e0:	008a0713          	addi	a4,s4,8
  8002e4:	00c7c463          	blt	a5,a2,8002ec <vprintfmt+0x198>
  8002e8:	10060b63          	beqz	a2,8003fe <vprintfmt+0x2aa>
  8002ec:	000a3603          	ld	a2,0(s4)
  8002f0:	46a1                	li	a3,8
  8002f2:	8a3a                	mv	s4,a4
  8002f4:	b761                	j	80027c <vprintfmt+0x128>
  8002f6:	fffcc793          	not	a5,s9
  8002fa:	97fd                	srai	a5,a5,0x3f
  8002fc:	00fcf7b3          	and	a5,s9,a5
  800300:	00078c9b          	sext.w	s9,a5
  800304:	8462                	mv	s0,s8
  800306:	b56d                	j	8001b0 <vprintfmt+0x5c>
  800308:	000a3403          	ld	s0,0(s4)
  80030c:	008a0793          	addi	a5,s4,8
  800310:	e43e                	sd	a5,8(sp)
  800312:	12040063          	beqz	s0,800432 <vprintfmt+0x2de>
  800316:	0d905963          	blez	s9,8003e8 <vprintfmt+0x294>
  80031a:	02d00793          	li	a5,45
  80031e:	00140a13          	addi	s4,s0,1
  800322:	12fd9763          	bne	s11,a5,800450 <vprintfmt+0x2fc>
  800326:	00044783          	lbu	a5,0(s0)
  80032a:	0007851b          	sext.w	a0,a5
  80032e:	cb9d                	beqz	a5,800364 <vprintfmt+0x210>
  800330:	547d                	li	s0,-1
  800332:	05e00d93          	li	s11,94
  800336:	000d4563          	bltz	s10,800340 <vprintfmt+0x1ec>
  80033a:	3d7d                	addiw	s10,s10,-1
  80033c:	028d0263          	beq	s10,s0,800360 <vprintfmt+0x20c>
  800340:	85a6                	mv	a1,s1
  800342:	0c0b8d63          	beqz	s7,80041c <vprintfmt+0x2c8>
  800346:	3781                	addiw	a5,a5,-32
  800348:	0cfdfa63          	bgeu	s11,a5,80041c <vprintfmt+0x2c8>
  80034c:	03f00513          	li	a0,63
  800350:	9902                	jalr	s2
  800352:	000a4783          	lbu	a5,0(s4)
  800356:	3cfd                	addiw	s9,s9,-1
  800358:	0a05                	addi	s4,s4,1
  80035a:	0007851b          	sext.w	a0,a5
  80035e:	ffe1                	bnez	a5,800336 <vprintfmt+0x1e2>
  800360:	01905963          	blez	s9,800372 <vprintfmt+0x21e>
  800364:	85a6                	mv	a1,s1
  800366:	02000513          	li	a0,32
  80036a:	3cfd                	addiw	s9,s9,-1
  80036c:	9902                	jalr	s2
  80036e:	fe0c9be3          	bnez	s9,800364 <vprintfmt+0x210>
  800372:	6a22                	ld	s4,8(sp)
  800374:	bd11                	j	800188 <vprintfmt+0x34>
  800376:	4785                	li	a5,1
  800378:	008a0b93          	addi	s7,s4,8
  80037c:	00c7c363          	blt	a5,a2,800382 <vprintfmt+0x22e>
  800380:	ce25                	beqz	a2,8003f8 <vprintfmt+0x2a4>
  800382:	000a3403          	ld	s0,0(s4)
  800386:	08044d63          	bltz	s0,800420 <vprintfmt+0x2cc>
  80038a:	8622                	mv	a2,s0
  80038c:	8a5e                	mv	s4,s7
  80038e:	46a9                	li	a3,10
  800390:	b5f5                	j	80027c <vprintfmt+0x128>
  800392:	000a2783          	lw	a5,0(s4)
  800396:	4661                	li	a2,24
  800398:	41f7d71b          	sraiw	a4,a5,0x1f
  80039c:	8fb9                	xor	a5,a5,a4
  80039e:	40e786bb          	subw	a3,a5,a4
  8003a2:	02d64663          	blt	a2,a3,8003ce <vprintfmt+0x27a>
  8003a6:	00369713          	slli	a4,a3,0x3
  8003aa:	00000797          	auipc	a5,0x0
  8003ae:	40678793          	addi	a5,a5,1030 # 8007b0 <error_string>
  8003b2:	97ba                	add	a5,a5,a4
  8003b4:	639c                	ld	a5,0(a5)
  8003b6:	cf81                	beqz	a5,8003ce <vprintfmt+0x27a>
  8003b8:	86be                	mv	a3,a5
  8003ba:	00000617          	auipc	a2,0x0
  8003be:	1ae60613          	addi	a2,a2,430 # 800568 <main+0x7e>
  8003c2:	85a6                	mv	a1,s1
  8003c4:	854a                	mv	a0,s2
  8003c6:	0e8000ef          	jal	8004ae <printfmt>
  8003ca:	0a21                	addi	s4,s4,8
  8003cc:	bb75                	j	800188 <vprintfmt+0x34>
  8003ce:	00000617          	auipc	a2,0x0
  8003d2:	18a60613          	addi	a2,a2,394 # 800558 <main+0x6e>
  8003d6:	85a6                	mv	a1,s1
  8003d8:	854a                	mv	a0,s2
  8003da:	0d4000ef          	jal	8004ae <printfmt>
  8003de:	0a21                	addi	s4,s4,8
  8003e0:	b365                	j	800188 <vprintfmt+0x34>
  8003e2:	2605                	addiw	a2,a2,1
  8003e4:	8462                	mv	s0,s8
  8003e6:	b3e9                	j	8001b0 <vprintfmt+0x5c>
  8003e8:	00044783          	lbu	a5,0(s0)
  8003ec:	0007851b          	sext.w	a0,a5
  8003f0:	d3c9                	beqz	a5,800372 <vprintfmt+0x21e>
  8003f2:	00140a13          	addi	s4,s0,1
  8003f6:	bf2d                	j	800330 <vprintfmt+0x1dc>
  8003f8:	000a2403          	lw	s0,0(s4)
  8003fc:	b769                	j	800386 <vprintfmt+0x232>
  8003fe:	000a6603          	lwu	a2,0(s4)
  800402:	46a1                	li	a3,8
  800404:	8a3a                	mv	s4,a4
  800406:	bd9d                	j	80027c <vprintfmt+0x128>
  800408:	000a6603          	lwu	a2,0(s4)
  80040c:	46a9                	li	a3,10
  80040e:	8a3a                	mv	s4,a4
  800410:	b5b5                	j	80027c <vprintfmt+0x128>
  800412:	000a6603          	lwu	a2,0(s4)
  800416:	46c1                	li	a3,16
  800418:	8a3a                	mv	s4,a4
  80041a:	b58d                	j	80027c <vprintfmt+0x128>
  80041c:	9902                	jalr	s2
  80041e:	bf15                	j	800352 <vprintfmt+0x1fe>
  800420:	85a6                	mv	a1,s1
  800422:	02d00513          	li	a0,45
  800426:	9902                	jalr	s2
  800428:	40800633          	neg	a2,s0
  80042c:	8a5e                	mv	s4,s7
  80042e:	46a9                	li	a3,10
  800430:	b5b1                	j	80027c <vprintfmt+0x128>
  800432:	01905663          	blez	s9,80043e <vprintfmt+0x2ea>
  800436:	02d00793          	li	a5,45
  80043a:	04fd9263          	bne	s11,a5,80047e <vprintfmt+0x32a>
  80043e:	02800793          	li	a5,40
  800442:	00000a17          	auipc	s4,0x0
  800446:	107a0a13          	addi	s4,s4,263 # 800549 <main+0x5f>
  80044a:	02800513          	li	a0,40
  80044e:	b5cd                	j	800330 <vprintfmt+0x1dc>
  800450:	85ea                	mv	a1,s10
  800452:	8522                	mv	a0,s0
  800454:	07a000ef          	jal	8004ce <strnlen>
  800458:	40ac8cbb          	subw	s9,s9,a0
  80045c:	01905963          	blez	s9,80046e <vprintfmt+0x31a>
  800460:	2d81                	sext.w	s11,s11
  800462:	85a6                	mv	a1,s1
  800464:	856e                	mv	a0,s11
  800466:	3cfd                	addiw	s9,s9,-1
  800468:	9902                	jalr	s2
  80046a:	fe0c9ce3          	bnez	s9,800462 <vprintfmt+0x30e>
  80046e:	00044783          	lbu	a5,0(s0)
  800472:	0007851b          	sext.w	a0,a5
  800476:	ea079de3          	bnez	a5,800330 <vprintfmt+0x1dc>
  80047a:	6a22                	ld	s4,8(sp)
  80047c:	b331                	j	800188 <vprintfmt+0x34>
  80047e:	85ea                	mv	a1,s10
  800480:	00000517          	auipc	a0,0x0
  800484:	0c850513          	addi	a0,a0,200 # 800548 <main+0x5e>
  800488:	046000ef          	jal	8004ce <strnlen>
  80048c:	40ac8cbb          	subw	s9,s9,a0
  800490:	00000417          	auipc	s0,0x0
  800494:	0b840413          	addi	s0,s0,184 # 800548 <main+0x5e>
  800498:	00000a17          	auipc	s4,0x0
  80049c:	0b1a0a13          	addi	s4,s4,177 # 800549 <main+0x5f>
  8004a0:	02800793          	li	a5,40
  8004a4:	02800513          	li	a0,40
  8004a8:	fb904ce3          	bgtz	s9,800460 <vprintfmt+0x30c>
  8004ac:	b551                	j	800330 <vprintfmt+0x1dc>

00000000008004ae <printfmt>:
  8004ae:	715d                	addi	sp,sp,-80
  8004b0:	02810313          	addi	t1,sp,40
  8004b4:	f436                	sd	a3,40(sp)
  8004b6:	869a                	mv	a3,t1
  8004b8:	ec06                	sd	ra,24(sp)
  8004ba:	f83a                	sd	a4,48(sp)
  8004bc:	fc3e                	sd	a5,56(sp)
  8004be:	e0c2                	sd	a6,64(sp)
  8004c0:	e4c6                	sd	a7,72(sp)
  8004c2:	e41a                	sd	t1,8(sp)
  8004c4:	c91ff0ef          	jal	800154 <vprintfmt>
  8004c8:	60e2                	ld	ra,24(sp)
  8004ca:	6161                	addi	sp,sp,80
  8004cc:	8082                	ret

00000000008004ce <strnlen>:
  8004ce:	4781                	li	a5,0
  8004d0:	e589                	bnez	a1,8004da <strnlen+0xc>
  8004d2:	a811                	j	8004e6 <strnlen+0x18>
  8004d4:	0785                	addi	a5,a5,1
  8004d6:	00f58863          	beq	a1,a5,8004e6 <strnlen+0x18>
  8004da:	00f50733          	add	a4,a0,a5
  8004de:	00074703          	lbu	a4,0(a4)
  8004e2:	fb6d                	bnez	a4,8004d4 <strnlen+0x6>
  8004e4:	85be                	mv	a1,a5
  8004e6:	852e                	mv	a0,a1
  8004e8:	8082                	ret

00000000008004ea <main>:
  8004ea:	1141                	addi	sp,sp,-16
  8004ec:	e406                	sd	ra,8(sp)
  8004ee:	be9ff0ef          	jal	8000d6 <getpid>
  8004f2:	85aa                	mv	a1,a0
  8004f4:	00000517          	auipc	a0,0x0
  8004f8:	13c50513          	addi	a0,a0,316 # 800630 <main+0x146>
  8004fc:	b45ff0ef          	jal	800040 <cprintf>
  800500:	bd9ff0ef          	jal	8000d8 <print_pgdir>
  800504:	00000517          	auipc	a0,0x0
  800508:	14450513          	addi	a0,a0,324 # 800648 <main+0x15e>
  80050c:	b35ff0ef          	jal	800040 <cprintf>
  800510:	60a2                	ld	ra,8(sp)
  800512:	4501                	li	a0,0
  800514:	0141                	addi	sp,sp,16
  800516:	8082                	ret
