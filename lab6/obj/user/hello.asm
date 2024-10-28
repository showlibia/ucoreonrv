
obj/__user_hello.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	0b4000ef          	jal	8000d4 <umain>
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
  800068:	0e6000ef          	jal	80014e <vprintfmt>
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

00000000008000bc <exit>:
  8000bc:	1141                	addi	sp,sp,-16
  8000be:	e406                	sd	ra,8(sp)
  8000c0:	fedff0ef          	jal	8000ac <sys_exit>
  8000c4:	00000517          	auipc	a0,0x0
  8000c8:	45c50513          	addi	a0,a0,1116 # 800520 <main+0x3c>
  8000cc:	f75ff0ef          	jal	800040 <cprintf>
  8000d0:	a001                	j	8000d0 <exit+0x14>

00000000008000d2 <getpid>:
  8000d2:	b7c5                	j	8000b2 <sys_getpid>

00000000008000d4 <umain>:
  8000d4:	1141                	addi	sp,sp,-16
  8000d6:	e406                	sd	ra,8(sp)
  8000d8:	40c000ef          	jal	8004e4 <main>
  8000dc:	fe1ff0ef          	jal	8000bc <exit>

00000000008000e0 <printnum>:
  8000e0:	02069813          	slli	a6,a3,0x20
  8000e4:	7179                	addi	sp,sp,-48
  8000e6:	02085813          	srli	a6,a6,0x20
  8000ea:	e052                	sd	s4,0(sp)
  8000ec:	03067a33          	remu	s4,a2,a6
  8000f0:	f022                	sd	s0,32(sp)
  8000f2:	ec26                	sd	s1,24(sp)
  8000f4:	e84a                	sd	s2,16(sp)
  8000f6:	f406                	sd	ra,40(sp)
  8000f8:	84aa                	mv	s1,a0
  8000fa:	892e                	mv	s2,a1
  8000fc:	fff7041b          	addiw	s0,a4,-1
  800100:	2a01                	sext.w	s4,s4
  800102:	05067063          	bgeu	a2,a6,800142 <printnum+0x62>
  800106:	e44e                	sd	s3,8(sp)
  800108:	89be                	mv	s3,a5
  80010a:	4785                	li	a5,1
  80010c:	00e7d763          	bge	a5,a4,80011a <printnum+0x3a>
  800110:	85ca                	mv	a1,s2
  800112:	854e                	mv	a0,s3
  800114:	347d                	addiw	s0,s0,-1
  800116:	9482                	jalr	s1
  800118:	fc65                	bnez	s0,800110 <printnum+0x30>
  80011a:	69a2                	ld	s3,8(sp)
  80011c:	1a02                	slli	s4,s4,0x20
  80011e:	020a5a13          	srli	s4,s4,0x20
  800122:	00000797          	auipc	a5,0x0
  800126:	41678793          	addi	a5,a5,1046 # 800538 <main+0x54>
  80012a:	97d2                	add	a5,a5,s4
  80012c:	7402                	ld	s0,32(sp)
  80012e:	0007c503          	lbu	a0,0(a5)
  800132:	70a2                	ld	ra,40(sp)
  800134:	6a02                	ld	s4,0(sp)
  800136:	85ca                	mv	a1,s2
  800138:	87a6                	mv	a5,s1
  80013a:	6942                	ld	s2,16(sp)
  80013c:	64e2                	ld	s1,24(sp)
  80013e:	6145                	addi	sp,sp,48
  800140:	8782                	jr	a5
  800142:	03065633          	divu	a2,a2,a6
  800146:	8722                	mv	a4,s0
  800148:	f99ff0ef          	jal	8000e0 <printnum>
  80014c:	bfc1                	j	80011c <printnum+0x3c>

000000000080014e <vprintfmt>:
  80014e:	7119                	addi	sp,sp,-128
  800150:	f4a6                	sd	s1,104(sp)
  800152:	f0ca                	sd	s2,96(sp)
  800154:	ecce                	sd	s3,88(sp)
  800156:	e8d2                	sd	s4,80(sp)
  800158:	e4d6                	sd	s5,72(sp)
  80015a:	e0da                	sd	s6,64(sp)
  80015c:	f862                	sd	s8,48(sp)
  80015e:	fc86                	sd	ra,120(sp)
  800160:	f8a2                	sd	s0,112(sp)
  800162:	fc5e                	sd	s7,56(sp)
  800164:	f466                	sd	s9,40(sp)
  800166:	f06a                	sd	s10,32(sp)
  800168:	ec6e                	sd	s11,24(sp)
  80016a:	892a                	mv	s2,a0
  80016c:	84ae                	mv	s1,a1
  80016e:	8c32                	mv	s8,a2
  800170:	8a36                	mv	s4,a3
  800172:	02500993          	li	s3,37
  800176:	05500b13          	li	s6,85
  80017a:	00000a97          	auipc	s5,0x0
  80017e:	4f6a8a93          	addi	s5,s5,1270 # 800670 <main+0x18c>
  800182:	000c4503          	lbu	a0,0(s8)
  800186:	001c0413          	addi	s0,s8,1
  80018a:	01350a63          	beq	a0,s3,80019e <vprintfmt+0x50>
  80018e:	cd0d                	beqz	a0,8001c8 <vprintfmt+0x7a>
  800190:	85a6                	mv	a1,s1
  800192:	9902                	jalr	s2
  800194:	00044503          	lbu	a0,0(s0)
  800198:	0405                	addi	s0,s0,1
  80019a:	ff351ae3          	bne	a0,s3,80018e <vprintfmt+0x40>
  80019e:	02000d93          	li	s11,32
  8001a2:	4b81                	li	s7,0
  8001a4:	4601                	li	a2,0
  8001a6:	5d7d                	li	s10,-1
  8001a8:	5cfd                	li	s9,-1
  8001aa:	00044683          	lbu	a3,0(s0)
  8001ae:	00140c13          	addi	s8,s0,1
  8001b2:	fdd6859b          	addiw	a1,a3,-35
  8001b6:	0ff5f593          	zext.b	a1,a1
  8001ba:	02bb6663          	bltu	s6,a1,8001e6 <vprintfmt+0x98>
  8001be:	058a                	slli	a1,a1,0x2
  8001c0:	95d6                	add	a1,a1,s5
  8001c2:	4198                	lw	a4,0(a1)
  8001c4:	9756                	add	a4,a4,s5
  8001c6:	8702                	jr	a4
  8001c8:	70e6                	ld	ra,120(sp)
  8001ca:	7446                	ld	s0,112(sp)
  8001cc:	74a6                	ld	s1,104(sp)
  8001ce:	7906                	ld	s2,96(sp)
  8001d0:	69e6                	ld	s3,88(sp)
  8001d2:	6a46                	ld	s4,80(sp)
  8001d4:	6aa6                	ld	s5,72(sp)
  8001d6:	6b06                	ld	s6,64(sp)
  8001d8:	7be2                	ld	s7,56(sp)
  8001da:	7c42                	ld	s8,48(sp)
  8001dc:	7ca2                	ld	s9,40(sp)
  8001de:	7d02                	ld	s10,32(sp)
  8001e0:	6de2                	ld	s11,24(sp)
  8001e2:	6109                	addi	sp,sp,128
  8001e4:	8082                	ret
  8001e6:	85a6                	mv	a1,s1
  8001e8:	02500513          	li	a0,37
  8001ec:	9902                	jalr	s2
  8001ee:	fff44703          	lbu	a4,-1(s0)
  8001f2:	02500793          	li	a5,37
  8001f6:	8c22                	mv	s8,s0
  8001f8:	f8f705e3          	beq	a4,a5,800182 <vprintfmt+0x34>
  8001fc:	02500713          	li	a4,37
  800200:	ffec4783          	lbu	a5,-2(s8)
  800204:	1c7d                	addi	s8,s8,-1
  800206:	fee79de3          	bne	a5,a4,800200 <vprintfmt+0xb2>
  80020a:	bfa5                	j	800182 <vprintfmt+0x34>
  80020c:	00144783          	lbu	a5,1(s0)
  800210:	4725                	li	a4,9
  800212:	fd068d1b          	addiw	s10,a3,-48
  800216:	fd07859b          	addiw	a1,a5,-48
  80021a:	0007869b          	sext.w	a3,a5
  80021e:	8462                	mv	s0,s8
  800220:	02b76563          	bltu	a4,a1,80024a <vprintfmt+0xfc>
  800224:	4525                	li	a0,9
  800226:	00144783          	lbu	a5,1(s0)
  80022a:	002d171b          	slliw	a4,s10,0x2
  80022e:	01a7073b          	addw	a4,a4,s10
  800232:	0017171b          	slliw	a4,a4,0x1
  800236:	9f35                	addw	a4,a4,a3
  800238:	fd07859b          	addiw	a1,a5,-48
  80023c:	0405                	addi	s0,s0,1
  80023e:	fd070d1b          	addiw	s10,a4,-48
  800242:	0007869b          	sext.w	a3,a5
  800246:	feb570e3          	bgeu	a0,a1,800226 <vprintfmt+0xd8>
  80024a:	f60cd0e3          	bgez	s9,8001aa <vprintfmt+0x5c>
  80024e:	8cea                	mv	s9,s10
  800250:	5d7d                	li	s10,-1
  800252:	bfa1                	j	8001aa <vprintfmt+0x5c>
  800254:	8db6                	mv	s11,a3
  800256:	8462                	mv	s0,s8
  800258:	bf89                	j	8001aa <vprintfmt+0x5c>
  80025a:	8462                	mv	s0,s8
  80025c:	4b85                	li	s7,1
  80025e:	b7b1                	j	8001aa <vprintfmt+0x5c>
  800260:	4785                	li	a5,1
  800262:	008a0713          	addi	a4,s4,8
  800266:	00c7c463          	blt	a5,a2,80026e <vprintfmt+0x120>
  80026a:	1a060163          	beqz	a2,80040c <vprintfmt+0x2be>
  80026e:	000a3603          	ld	a2,0(s4)
  800272:	46c1                	li	a3,16
  800274:	8a3a                	mv	s4,a4
  800276:	000d879b          	sext.w	a5,s11
  80027a:	8766                	mv	a4,s9
  80027c:	85a6                	mv	a1,s1
  80027e:	854a                	mv	a0,s2
  800280:	e61ff0ef          	jal	8000e0 <printnum>
  800284:	bdfd                	j	800182 <vprintfmt+0x34>
  800286:	000a2503          	lw	a0,0(s4)
  80028a:	85a6                	mv	a1,s1
  80028c:	0a21                	addi	s4,s4,8
  80028e:	9902                	jalr	s2
  800290:	bdcd                	j	800182 <vprintfmt+0x34>
  800292:	4785                	li	a5,1
  800294:	008a0713          	addi	a4,s4,8
  800298:	00c7c463          	blt	a5,a2,8002a0 <vprintfmt+0x152>
  80029c:	16060363          	beqz	a2,800402 <vprintfmt+0x2b4>
  8002a0:	000a3603          	ld	a2,0(s4)
  8002a4:	46a9                	li	a3,10
  8002a6:	8a3a                	mv	s4,a4
  8002a8:	b7f9                	j	800276 <vprintfmt+0x128>
  8002aa:	85a6                	mv	a1,s1
  8002ac:	03000513          	li	a0,48
  8002b0:	9902                	jalr	s2
  8002b2:	85a6                	mv	a1,s1
  8002b4:	07800513          	li	a0,120
  8002b8:	9902                	jalr	s2
  8002ba:	000a3603          	ld	a2,0(s4)
  8002be:	46c1                	li	a3,16
  8002c0:	0a21                	addi	s4,s4,8
  8002c2:	bf55                	j	800276 <vprintfmt+0x128>
  8002c4:	85a6                	mv	a1,s1
  8002c6:	02500513          	li	a0,37
  8002ca:	9902                	jalr	s2
  8002cc:	bd5d                	j	800182 <vprintfmt+0x34>
  8002ce:	000a2d03          	lw	s10,0(s4)
  8002d2:	8462                	mv	s0,s8
  8002d4:	0a21                	addi	s4,s4,8
  8002d6:	bf95                	j	80024a <vprintfmt+0xfc>
  8002d8:	4785                	li	a5,1
  8002da:	008a0713          	addi	a4,s4,8
  8002de:	00c7c463          	blt	a5,a2,8002e6 <vprintfmt+0x198>
  8002e2:	10060b63          	beqz	a2,8003f8 <vprintfmt+0x2aa>
  8002e6:	000a3603          	ld	a2,0(s4)
  8002ea:	46a1                	li	a3,8
  8002ec:	8a3a                	mv	s4,a4
  8002ee:	b761                	j	800276 <vprintfmt+0x128>
  8002f0:	fffcc793          	not	a5,s9
  8002f4:	97fd                	srai	a5,a5,0x3f
  8002f6:	00fcf7b3          	and	a5,s9,a5
  8002fa:	00078c9b          	sext.w	s9,a5
  8002fe:	8462                	mv	s0,s8
  800300:	b56d                	j	8001aa <vprintfmt+0x5c>
  800302:	000a3403          	ld	s0,0(s4)
  800306:	008a0793          	addi	a5,s4,8
  80030a:	e43e                	sd	a5,8(sp)
  80030c:	12040063          	beqz	s0,80042c <vprintfmt+0x2de>
  800310:	0d905963          	blez	s9,8003e2 <vprintfmt+0x294>
  800314:	02d00793          	li	a5,45
  800318:	00140a13          	addi	s4,s0,1
  80031c:	12fd9763          	bne	s11,a5,80044a <vprintfmt+0x2fc>
  800320:	00044783          	lbu	a5,0(s0)
  800324:	0007851b          	sext.w	a0,a5
  800328:	cb9d                	beqz	a5,80035e <vprintfmt+0x210>
  80032a:	547d                	li	s0,-1
  80032c:	05e00d93          	li	s11,94
  800330:	000d4563          	bltz	s10,80033a <vprintfmt+0x1ec>
  800334:	3d7d                	addiw	s10,s10,-1
  800336:	028d0263          	beq	s10,s0,80035a <vprintfmt+0x20c>
  80033a:	85a6                	mv	a1,s1
  80033c:	0c0b8d63          	beqz	s7,800416 <vprintfmt+0x2c8>
  800340:	3781                	addiw	a5,a5,-32
  800342:	0cfdfa63          	bgeu	s11,a5,800416 <vprintfmt+0x2c8>
  800346:	03f00513          	li	a0,63
  80034a:	9902                	jalr	s2
  80034c:	000a4783          	lbu	a5,0(s4)
  800350:	3cfd                	addiw	s9,s9,-1
  800352:	0a05                	addi	s4,s4,1
  800354:	0007851b          	sext.w	a0,a5
  800358:	ffe1                	bnez	a5,800330 <vprintfmt+0x1e2>
  80035a:	01905963          	blez	s9,80036c <vprintfmt+0x21e>
  80035e:	85a6                	mv	a1,s1
  800360:	02000513          	li	a0,32
  800364:	3cfd                	addiw	s9,s9,-1
  800366:	9902                	jalr	s2
  800368:	fe0c9be3          	bnez	s9,80035e <vprintfmt+0x210>
  80036c:	6a22                	ld	s4,8(sp)
  80036e:	bd11                	j	800182 <vprintfmt+0x34>
  800370:	4785                	li	a5,1
  800372:	008a0b93          	addi	s7,s4,8
  800376:	00c7c363          	blt	a5,a2,80037c <vprintfmt+0x22e>
  80037a:	ce25                	beqz	a2,8003f2 <vprintfmt+0x2a4>
  80037c:	000a3403          	ld	s0,0(s4)
  800380:	08044d63          	bltz	s0,80041a <vprintfmt+0x2cc>
  800384:	8622                	mv	a2,s0
  800386:	8a5e                	mv	s4,s7
  800388:	46a9                	li	a3,10
  80038a:	b5f5                	j	800276 <vprintfmt+0x128>
  80038c:	000a2783          	lw	a5,0(s4)
  800390:	4661                	li	a2,24
  800392:	41f7d71b          	sraiw	a4,a5,0x1f
  800396:	8fb9                	xor	a5,a5,a4
  800398:	40e786bb          	subw	a3,a5,a4
  80039c:	02d64663          	blt	a2,a3,8003c8 <vprintfmt+0x27a>
  8003a0:	00369713          	slli	a4,a3,0x3
  8003a4:	00000797          	auipc	a5,0x0
  8003a8:	42478793          	addi	a5,a5,1060 # 8007c8 <error_string>
  8003ac:	97ba                	add	a5,a5,a4
  8003ae:	639c                	ld	a5,0(a5)
  8003b0:	cf81                	beqz	a5,8003c8 <vprintfmt+0x27a>
  8003b2:	86be                	mv	a3,a5
  8003b4:	00000617          	auipc	a2,0x0
  8003b8:	1bc60613          	addi	a2,a2,444 # 800570 <main+0x8c>
  8003bc:	85a6                	mv	a1,s1
  8003be:	854a                	mv	a0,s2
  8003c0:	0e8000ef          	jal	8004a8 <printfmt>
  8003c4:	0a21                	addi	s4,s4,8
  8003c6:	bb75                	j	800182 <vprintfmt+0x34>
  8003c8:	00000617          	auipc	a2,0x0
  8003cc:	19860613          	addi	a2,a2,408 # 800560 <main+0x7c>
  8003d0:	85a6                	mv	a1,s1
  8003d2:	854a                	mv	a0,s2
  8003d4:	0d4000ef          	jal	8004a8 <printfmt>
  8003d8:	0a21                	addi	s4,s4,8
  8003da:	b365                	j	800182 <vprintfmt+0x34>
  8003dc:	2605                	addiw	a2,a2,1
  8003de:	8462                	mv	s0,s8
  8003e0:	b3e9                	j	8001aa <vprintfmt+0x5c>
  8003e2:	00044783          	lbu	a5,0(s0)
  8003e6:	0007851b          	sext.w	a0,a5
  8003ea:	d3c9                	beqz	a5,80036c <vprintfmt+0x21e>
  8003ec:	00140a13          	addi	s4,s0,1
  8003f0:	bf2d                	j	80032a <vprintfmt+0x1dc>
  8003f2:	000a2403          	lw	s0,0(s4)
  8003f6:	b769                	j	800380 <vprintfmt+0x232>
  8003f8:	000a6603          	lwu	a2,0(s4)
  8003fc:	46a1                	li	a3,8
  8003fe:	8a3a                	mv	s4,a4
  800400:	bd9d                	j	800276 <vprintfmt+0x128>
  800402:	000a6603          	lwu	a2,0(s4)
  800406:	46a9                	li	a3,10
  800408:	8a3a                	mv	s4,a4
  80040a:	b5b5                	j	800276 <vprintfmt+0x128>
  80040c:	000a6603          	lwu	a2,0(s4)
  800410:	46c1                	li	a3,16
  800412:	8a3a                	mv	s4,a4
  800414:	b58d                	j	800276 <vprintfmt+0x128>
  800416:	9902                	jalr	s2
  800418:	bf15                	j	80034c <vprintfmt+0x1fe>
  80041a:	85a6                	mv	a1,s1
  80041c:	02d00513          	li	a0,45
  800420:	9902                	jalr	s2
  800422:	40800633          	neg	a2,s0
  800426:	8a5e                	mv	s4,s7
  800428:	46a9                	li	a3,10
  80042a:	b5b1                	j	800276 <vprintfmt+0x128>
  80042c:	01905663          	blez	s9,800438 <vprintfmt+0x2ea>
  800430:	02d00793          	li	a5,45
  800434:	04fd9263          	bne	s11,a5,800478 <vprintfmt+0x32a>
  800438:	02800793          	li	a5,40
  80043c:	00000a17          	auipc	s4,0x0
  800440:	115a0a13          	addi	s4,s4,277 # 800551 <main+0x6d>
  800444:	02800513          	li	a0,40
  800448:	b5cd                	j	80032a <vprintfmt+0x1dc>
  80044a:	85ea                	mv	a1,s10
  80044c:	8522                	mv	a0,s0
  80044e:	07a000ef          	jal	8004c8 <strnlen>
  800452:	40ac8cbb          	subw	s9,s9,a0
  800456:	01905963          	blez	s9,800468 <vprintfmt+0x31a>
  80045a:	2d81                	sext.w	s11,s11
  80045c:	85a6                	mv	a1,s1
  80045e:	856e                	mv	a0,s11
  800460:	3cfd                	addiw	s9,s9,-1
  800462:	9902                	jalr	s2
  800464:	fe0c9ce3          	bnez	s9,80045c <vprintfmt+0x30e>
  800468:	00044783          	lbu	a5,0(s0)
  80046c:	0007851b          	sext.w	a0,a5
  800470:	ea079de3          	bnez	a5,80032a <vprintfmt+0x1dc>
  800474:	6a22                	ld	s4,8(sp)
  800476:	b331                	j	800182 <vprintfmt+0x34>
  800478:	85ea                	mv	a1,s10
  80047a:	00000517          	auipc	a0,0x0
  80047e:	0d650513          	addi	a0,a0,214 # 800550 <main+0x6c>
  800482:	046000ef          	jal	8004c8 <strnlen>
  800486:	40ac8cbb          	subw	s9,s9,a0
  80048a:	00000417          	auipc	s0,0x0
  80048e:	0c640413          	addi	s0,s0,198 # 800550 <main+0x6c>
  800492:	00000a17          	auipc	s4,0x0
  800496:	0bfa0a13          	addi	s4,s4,191 # 800551 <main+0x6d>
  80049a:	02800793          	li	a5,40
  80049e:	02800513          	li	a0,40
  8004a2:	fb904ce3          	bgtz	s9,80045a <vprintfmt+0x30c>
  8004a6:	b551                	j	80032a <vprintfmt+0x1dc>

00000000008004a8 <printfmt>:
  8004a8:	715d                	addi	sp,sp,-80
  8004aa:	02810313          	addi	t1,sp,40
  8004ae:	f436                	sd	a3,40(sp)
  8004b0:	869a                	mv	a3,t1
  8004b2:	ec06                	sd	ra,24(sp)
  8004b4:	f83a                	sd	a4,48(sp)
  8004b6:	fc3e                	sd	a5,56(sp)
  8004b8:	e0c2                	sd	a6,64(sp)
  8004ba:	e4c6                	sd	a7,72(sp)
  8004bc:	e41a                	sd	t1,8(sp)
  8004be:	c91ff0ef          	jal	80014e <vprintfmt>
  8004c2:	60e2                	ld	ra,24(sp)
  8004c4:	6161                	addi	sp,sp,80
  8004c6:	8082                	ret

00000000008004c8 <strnlen>:
  8004c8:	4781                	li	a5,0
  8004ca:	e589                	bnez	a1,8004d4 <strnlen+0xc>
  8004cc:	a811                	j	8004e0 <strnlen+0x18>
  8004ce:	0785                	addi	a5,a5,1
  8004d0:	00f58863          	beq	a1,a5,8004e0 <strnlen+0x18>
  8004d4:	00f50733          	add	a4,a0,a5
  8004d8:	00074703          	lbu	a4,0(a4)
  8004dc:	fb6d                	bnez	a4,8004ce <strnlen+0x6>
  8004de:	85be                	mv	a1,a5
  8004e0:	852e                	mv	a0,a1
  8004e2:	8082                	ret

00000000008004e4 <main>:
  8004e4:	1141                	addi	sp,sp,-16
  8004e6:	00000517          	auipc	a0,0x0
  8004ea:	15250513          	addi	a0,a0,338 # 800638 <main+0x154>
  8004ee:	e406                	sd	ra,8(sp)
  8004f0:	b51ff0ef          	jal	800040 <cprintf>
  8004f4:	bdfff0ef          	jal	8000d2 <getpid>
  8004f8:	85aa                	mv	a1,a0
  8004fa:	00000517          	auipc	a0,0x0
  8004fe:	14e50513          	addi	a0,a0,334 # 800648 <main+0x164>
  800502:	b3fff0ef          	jal	800040 <cprintf>
  800506:	00000517          	auipc	a0,0x0
  80050a:	15a50513          	addi	a0,a0,346 # 800660 <main+0x17c>
  80050e:	b33ff0ef          	jal	800040 <cprintf>
  800512:	60a2                	ld	ra,8(sp)
  800514:	4501                	li	a0,0
  800516:	0141                	addi	sp,sp,16
  800518:	8082                	ret
