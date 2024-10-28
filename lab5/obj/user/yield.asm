
obj/__user_yield.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	0bc000ef          	jal	8000dc <umain>
  800024:	a001                	j	800024 <_start+0x4>

0000000000800026 <cputch>:
  800026:	1141                	addi	sp,sp,-16
  800028:	e022                	sd	s0,0(sp)
  80002a:	e406                	sd	ra,8(sp)
  80002c:	842e                	mv	s0,a1
  80002e:	08e000ef          	jal	8000bc <sys_putc>
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
  800068:	0ee000ef          	jal	800156 <vprintfmt>
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
  800094:	6522                	ld	a0,8(sp)
  800096:	75a2                	ld	a1,40(sp)
  800098:	7642                	ld	a2,48(sp)
  80009a:	76e2                	ld	a3,56(sp)
  80009c:	6706                	ld	a4,64(sp)
  80009e:	67a6                	ld	a5,72(sp)
  8000a0:	00000073          	ecall
  8000a4:	00a13e23          	sd	a0,28(sp)
  8000a8:	4572                	lw	a0,28(sp)
  8000aa:	6149                	addi	sp,sp,144
  8000ac:	8082                	ret

00000000008000ae <sys_exit>:
  8000ae:	85aa                	mv	a1,a0
  8000b0:	4505                	li	a0,1
  8000b2:	b7c9                	j	800074 <syscall>

00000000008000b4 <sys_yield>:
  8000b4:	4529                	li	a0,10
  8000b6:	bf7d                	j	800074 <syscall>

00000000008000b8 <sys_getpid>:
  8000b8:	4549                	li	a0,18
  8000ba:	bf6d                	j	800074 <syscall>

00000000008000bc <sys_putc>:
  8000bc:	85aa                	mv	a1,a0
  8000be:	4579                	li	a0,30
  8000c0:	bf55                	j	800074 <syscall>

00000000008000c2 <exit>:
  8000c2:	1141                	addi	sp,sp,-16
  8000c4:	e406                	sd	ra,8(sp)
  8000c6:	fe9ff0ef          	jal	8000ae <sys_exit>
  8000ca:	00000517          	auipc	a0,0x0
  8000ce:	48e50513          	addi	a0,a0,1166 # 800558 <main+0x6c>
  8000d2:	f6fff0ef          	jal	800040 <cprintf>
  8000d6:	a001                	j	8000d6 <exit+0x14>

00000000008000d8 <yield>:
  8000d8:	bff1                	j	8000b4 <sys_yield>

00000000008000da <getpid>:
  8000da:	bff9                	j	8000b8 <sys_getpid>

00000000008000dc <umain>:
  8000dc:	1141                	addi	sp,sp,-16
  8000de:	e406                	sd	ra,8(sp)
  8000e0:	40c000ef          	jal	8004ec <main>
  8000e4:	fdfff0ef          	jal	8000c2 <exit>

00000000008000e8 <printnum>:
  8000e8:	02069813          	slli	a6,a3,0x20
  8000ec:	7179                	addi	sp,sp,-48
  8000ee:	02085813          	srli	a6,a6,0x20
  8000f2:	e052                	sd	s4,0(sp)
  8000f4:	03067a33          	remu	s4,a2,a6
  8000f8:	f022                	sd	s0,32(sp)
  8000fa:	ec26                	sd	s1,24(sp)
  8000fc:	e84a                	sd	s2,16(sp)
  8000fe:	f406                	sd	ra,40(sp)
  800100:	84aa                	mv	s1,a0
  800102:	892e                	mv	s2,a1
  800104:	fff7041b          	addiw	s0,a4,-1
  800108:	2a01                	sext.w	s4,s4
  80010a:	05067063          	bgeu	a2,a6,80014a <printnum+0x62>
  80010e:	e44e                	sd	s3,8(sp)
  800110:	89be                	mv	s3,a5
  800112:	4785                	li	a5,1
  800114:	00e7d763          	bge	a5,a4,800122 <printnum+0x3a>
  800118:	85ca                	mv	a1,s2
  80011a:	854e                	mv	a0,s3
  80011c:	347d                	addiw	s0,s0,-1
  80011e:	9482                	jalr	s1
  800120:	fc65                	bnez	s0,800118 <printnum+0x30>
  800122:	69a2                	ld	s3,8(sp)
  800124:	1a02                	slli	s4,s4,0x20
  800126:	020a5a13          	srli	s4,s4,0x20
  80012a:	00000797          	auipc	a5,0x0
  80012e:	44678793          	addi	a5,a5,1094 # 800570 <main+0x84>
  800132:	97d2                	add	a5,a5,s4
  800134:	7402                	ld	s0,32(sp)
  800136:	0007c503          	lbu	a0,0(a5)
  80013a:	70a2                	ld	ra,40(sp)
  80013c:	6a02                	ld	s4,0(sp)
  80013e:	85ca                	mv	a1,s2
  800140:	87a6                	mv	a5,s1
  800142:	6942                	ld	s2,16(sp)
  800144:	64e2                	ld	s1,24(sp)
  800146:	6145                	addi	sp,sp,48
  800148:	8782                	jr	a5
  80014a:	03065633          	divu	a2,a2,a6
  80014e:	8722                	mv	a4,s0
  800150:	f99ff0ef          	jal	8000e8 <printnum>
  800154:	bfc1                	j	800124 <printnum+0x3c>

0000000000800156 <vprintfmt>:
  800156:	7119                	addi	sp,sp,-128
  800158:	f4a6                	sd	s1,104(sp)
  80015a:	f0ca                	sd	s2,96(sp)
  80015c:	ecce                	sd	s3,88(sp)
  80015e:	e8d2                	sd	s4,80(sp)
  800160:	e4d6                	sd	s5,72(sp)
  800162:	e0da                	sd	s6,64(sp)
  800164:	f862                	sd	s8,48(sp)
  800166:	fc86                	sd	ra,120(sp)
  800168:	f8a2                	sd	s0,112(sp)
  80016a:	fc5e                	sd	s7,56(sp)
  80016c:	f466                	sd	s9,40(sp)
  80016e:	f06a                	sd	s10,32(sp)
  800170:	ec6e                	sd	s11,24(sp)
  800172:	892a                	mv	s2,a0
  800174:	84ae                	mv	s1,a1
  800176:	8c32                	mv	s8,a2
  800178:	8a36                	mv	s4,a3
  80017a:	02500993          	li	s3,37
  80017e:	05500b13          	li	s6,85
  800182:	00000a97          	auipc	s5,0x0
  800186:	566a8a93          	addi	s5,s5,1382 # 8006e8 <main+0x1fc>
  80018a:	000c4503          	lbu	a0,0(s8)
  80018e:	001c0413          	addi	s0,s8,1
  800192:	01350a63          	beq	a0,s3,8001a6 <vprintfmt+0x50>
  800196:	cd0d                	beqz	a0,8001d0 <vprintfmt+0x7a>
  800198:	85a6                	mv	a1,s1
  80019a:	9902                	jalr	s2
  80019c:	00044503          	lbu	a0,0(s0)
  8001a0:	0405                	addi	s0,s0,1
  8001a2:	ff351ae3          	bne	a0,s3,800196 <vprintfmt+0x40>
  8001a6:	02000d93          	li	s11,32
  8001aa:	4b81                	li	s7,0
  8001ac:	4601                	li	a2,0
  8001ae:	5d7d                	li	s10,-1
  8001b0:	5cfd                	li	s9,-1
  8001b2:	00044683          	lbu	a3,0(s0)
  8001b6:	00140c13          	addi	s8,s0,1
  8001ba:	fdd6859b          	addiw	a1,a3,-35
  8001be:	0ff5f593          	zext.b	a1,a1
  8001c2:	02bb6663          	bltu	s6,a1,8001ee <vprintfmt+0x98>
  8001c6:	058a                	slli	a1,a1,0x2
  8001c8:	95d6                	add	a1,a1,s5
  8001ca:	4198                	lw	a4,0(a1)
  8001cc:	9756                	add	a4,a4,s5
  8001ce:	8702                	jr	a4
  8001d0:	70e6                	ld	ra,120(sp)
  8001d2:	7446                	ld	s0,112(sp)
  8001d4:	74a6                	ld	s1,104(sp)
  8001d6:	7906                	ld	s2,96(sp)
  8001d8:	69e6                	ld	s3,88(sp)
  8001da:	6a46                	ld	s4,80(sp)
  8001dc:	6aa6                	ld	s5,72(sp)
  8001de:	6b06                	ld	s6,64(sp)
  8001e0:	7be2                	ld	s7,56(sp)
  8001e2:	7c42                	ld	s8,48(sp)
  8001e4:	7ca2                	ld	s9,40(sp)
  8001e6:	7d02                	ld	s10,32(sp)
  8001e8:	6de2                	ld	s11,24(sp)
  8001ea:	6109                	addi	sp,sp,128
  8001ec:	8082                	ret
  8001ee:	85a6                	mv	a1,s1
  8001f0:	02500513          	li	a0,37
  8001f4:	9902                	jalr	s2
  8001f6:	fff44703          	lbu	a4,-1(s0)
  8001fa:	02500793          	li	a5,37
  8001fe:	8c22                	mv	s8,s0
  800200:	f8f705e3          	beq	a4,a5,80018a <vprintfmt+0x34>
  800204:	02500713          	li	a4,37
  800208:	ffec4783          	lbu	a5,-2(s8)
  80020c:	1c7d                	addi	s8,s8,-1
  80020e:	fee79de3          	bne	a5,a4,800208 <vprintfmt+0xb2>
  800212:	bfa5                	j	80018a <vprintfmt+0x34>
  800214:	00144783          	lbu	a5,1(s0)
  800218:	4725                	li	a4,9
  80021a:	fd068d1b          	addiw	s10,a3,-48
  80021e:	fd07859b          	addiw	a1,a5,-48
  800222:	0007869b          	sext.w	a3,a5
  800226:	8462                	mv	s0,s8
  800228:	02b76563          	bltu	a4,a1,800252 <vprintfmt+0xfc>
  80022c:	4525                	li	a0,9
  80022e:	00144783          	lbu	a5,1(s0)
  800232:	002d171b          	slliw	a4,s10,0x2
  800236:	01a7073b          	addw	a4,a4,s10
  80023a:	0017171b          	slliw	a4,a4,0x1
  80023e:	9f35                	addw	a4,a4,a3
  800240:	fd07859b          	addiw	a1,a5,-48
  800244:	0405                	addi	s0,s0,1
  800246:	fd070d1b          	addiw	s10,a4,-48
  80024a:	0007869b          	sext.w	a3,a5
  80024e:	feb570e3          	bgeu	a0,a1,80022e <vprintfmt+0xd8>
  800252:	f60cd0e3          	bgez	s9,8001b2 <vprintfmt+0x5c>
  800256:	8cea                	mv	s9,s10
  800258:	5d7d                	li	s10,-1
  80025a:	bfa1                	j	8001b2 <vprintfmt+0x5c>
  80025c:	8db6                	mv	s11,a3
  80025e:	8462                	mv	s0,s8
  800260:	bf89                	j	8001b2 <vprintfmt+0x5c>
  800262:	8462                	mv	s0,s8
  800264:	4b85                	li	s7,1
  800266:	b7b1                	j	8001b2 <vprintfmt+0x5c>
  800268:	4785                	li	a5,1
  80026a:	008a0713          	addi	a4,s4,8
  80026e:	00c7c463          	blt	a5,a2,800276 <vprintfmt+0x120>
  800272:	1a060163          	beqz	a2,800414 <vprintfmt+0x2be>
  800276:	000a3603          	ld	a2,0(s4)
  80027a:	46c1                	li	a3,16
  80027c:	8a3a                	mv	s4,a4
  80027e:	000d879b          	sext.w	a5,s11
  800282:	8766                	mv	a4,s9
  800284:	85a6                	mv	a1,s1
  800286:	854a                	mv	a0,s2
  800288:	e61ff0ef          	jal	8000e8 <printnum>
  80028c:	bdfd                	j	80018a <vprintfmt+0x34>
  80028e:	000a2503          	lw	a0,0(s4)
  800292:	85a6                	mv	a1,s1
  800294:	0a21                	addi	s4,s4,8
  800296:	9902                	jalr	s2
  800298:	bdcd                	j	80018a <vprintfmt+0x34>
  80029a:	4785                	li	a5,1
  80029c:	008a0713          	addi	a4,s4,8
  8002a0:	00c7c463          	blt	a5,a2,8002a8 <vprintfmt+0x152>
  8002a4:	16060363          	beqz	a2,80040a <vprintfmt+0x2b4>
  8002a8:	000a3603          	ld	a2,0(s4)
  8002ac:	46a9                	li	a3,10
  8002ae:	8a3a                	mv	s4,a4
  8002b0:	b7f9                	j	80027e <vprintfmt+0x128>
  8002b2:	85a6                	mv	a1,s1
  8002b4:	03000513          	li	a0,48
  8002b8:	9902                	jalr	s2
  8002ba:	85a6                	mv	a1,s1
  8002bc:	07800513          	li	a0,120
  8002c0:	9902                	jalr	s2
  8002c2:	000a3603          	ld	a2,0(s4)
  8002c6:	46c1                	li	a3,16
  8002c8:	0a21                	addi	s4,s4,8
  8002ca:	bf55                	j	80027e <vprintfmt+0x128>
  8002cc:	85a6                	mv	a1,s1
  8002ce:	02500513          	li	a0,37
  8002d2:	9902                	jalr	s2
  8002d4:	bd5d                	j	80018a <vprintfmt+0x34>
  8002d6:	000a2d03          	lw	s10,0(s4)
  8002da:	8462                	mv	s0,s8
  8002dc:	0a21                	addi	s4,s4,8
  8002de:	bf95                	j	800252 <vprintfmt+0xfc>
  8002e0:	4785                	li	a5,1
  8002e2:	008a0713          	addi	a4,s4,8
  8002e6:	00c7c463          	blt	a5,a2,8002ee <vprintfmt+0x198>
  8002ea:	10060b63          	beqz	a2,800400 <vprintfmt+0x2aa>
  8002ee:	000a3603          	ld	a2,0(s4)
  8002f2:	46a1                	li	a3,8
  8002f4:	8a3a                	mv	s4,a4
  8002f6:	b761                	j	80027e <vprintfmt+0x128>
  8002f8:	fffcc793          	not	a5,s9
  8002fc:	97fd                	srai	a5,a5,0x3f
  8002fe:	00fcf7b3          	and	a5,s9,a5
  800302:	00078c9b          	sext.w	s9,a5
  800306:	8462                	mv	s0,s8
  800308:	b56d                	j	8001b2 <vprintfmt+0x5c>
  80030a:	000a3403          	ld	s0,0(s4)
  80030e:	008a0793          	addi	a5,s4,8
  800312:	e43e                	sd	a5,8(sp)
  800314:	12040063          	beqz	s0,800434 <vprintfmt+0x2de>
  800318:	0d905963          	blez	s9,8003ea <vprintfmt+0x294>
  80031c:	02d00793          	li	a5,45
  800320:	00140a13          	addi	s4,s0,1
  800324:	12fd9763          	bne	s11,a5,800452 <vprintfmt+0x2fc>
  800328:	00044783          	lbu	a5,0(s0)
  80032c:	0007851b          	sext.w	a0,a5
  800330:	cb9d                	beqz	a5,800366 <vprintfmt+0x210>
  800332:	547d                	li	s0,-1
  800334:	05e00d93          	li	s11,94
  800338:	000d4563          	bltz	s10,800342 <vprintfmt+0x1ec>
  80033c:	3d7d                	addiw	s10,s10,-1
  80033e:	028d0263          	beq	s10,s0,800362 <vprintfmt+0x20c>
  800342:	85a6                	mv	a1,s1
  800344:	0c0b8d63          	beqz	s7,80041e <vprintfmt+0x2c8>
  800348:	3781                	addiw	a5,a5,-32
  80034a:	0cfdfa63          	bgeu	s11,a5,80041e <vprintfmt+0x2c8>
  80034e:	03f00513          	li	a0,63
  800352:	9902                	jalr	s2
  800354:	000a4783          	lbu	a5,0(s4)
  800358:	3cfd                	addiw	s9,s9,-1
  80035a:	0a05                	addi	s4,s4,1
  80035c:	0007851b          	sext.w	a0,a5
  800360:	ffe1                	bnez	a5,800338 <vprintfmt+0x1e2>
  800362:	01905963          	blez	s9,800374 <vprintfmt+0x21e>
  800366:	85a6                	mv	a1,s1
  800368:	02000513          	li	a0,32
  80036c:	3cfd                	addiw	s9,s9,-1
  80036e:	9902                	jalr	s2
  800370:	fe0c9be3          	bnez	s9,800366 <vprintfmt+0x210>
  800374:	6a22                	ld	s4,8(sp)
  800376:	bd11                	j	80018a <vprintfmt+0x34>
  800378:	4785                	li	a5,1
  80037a:	008a0b93          	addi	s7,s4,8
  80037e:	00c7c363          	blt	a5,a2,800384 <vprintfmt+0x22e>
  800382:	ce25                	beqz	a2,8003fa <vprintfmt+0x2a4>
  800384:	000a3403          	ld	s0,0(s4)
  800388:	08044d63          	bltz	s0,800422 <vprintfmt+0x2cc>
  80038c:	8622                	mv	a2,s0
  80038e:	8a5e                	mv	s4,s7
  800390:	46a9                	li	a3,10
  800392:	b5f5                	j	80027e <vprintfmt+0x128>
  800394:	000a2783          	lw	a5,0(s4)
  800398:	4661                	li	a2,24
  80039a:	41f7d71b          	sraiw	a4,a5,0x1f
  80039e:	8fb9                	xor	a5,a5,a4
  8003a0:	40e786bb          	subw	a3,a5,a4
  8003a4:	02d64663          	blt	a2,a3,8003d0 <vprintfmt+0x27a>
  8003a8:	00369713          	slli	a4,a3,0x3
  8003ac:	00000797          	auipc	a5,0x0
  8003b0:	49478793          	addi	a5,a5,1172 # 800840 <error_string>
  8003b4:	97ba                	add	a5,a5,a4
  8003b6:	639c                	ld	a5,0(a5)
  8003b8:	cf81                	beqz	a5,8003d0 <vprintfmt+0x27a>
  8003ba:	86be                	mv	a3,a5
  8003bc:	00000617          	auipc	a2,0x0
  8003c0:	1ec60613          	addi	a2,a2,492 # 8005a8 <main+0xbc>
  8003c4:	85a6                	mv	a1,s1
  8003c6:	854a                	mv	a0,s2
  8003c8:	0e8000ef          	jal	8004b0 <printfmt>
  8003cc:	0a21                	addi	s4,s4,8
  8003ce:	bb75                	j	80018a <vprintfmt+0x34>
  8003d0:	00000617          	auipc	a2,0x0
  8003d4:	1c860613          	addi	a2,a2,456 # 800598 <main+0xac>
  8003d8:	85a6                	mv	a1,s1
  8003da:	854a                	mv	a0,s2
  8003dc:	0d4000ef          	jal	8004b0 <printfmt>
  8003e0:	0a21                	addi	s4,s4,8
  8003e2:	b365                	j	80018a <vprintfmt+0x34>
  8003e4:	2605                	addiw	a2,a2,1
  8003e6:	8462                	mv	s0,s8
  8003e8:	b3e9                	j	8001b2 <vprintfmt+0x5c>
  8003ea:	00044783          	lbu	a5,0(s0)
  8003ee:	0007851b          	sext.w	a0,a5
  8003f2:	d3c9                	beqz	a5,800374 <vprintfmt+0x21e>
  8003f4:	00140a13          	addi	s4,s0,1
  8003f8:	bf2d                	j	800332 <vprintfmt+0x1dc>
  8003fa:	000a2403          	lw	s0,0(s4)
  8003fe:	b769                	j	800388 <vprintfmt+0x232>
  800400:	000a6603          	lwu	a2,0(s4)
  800404:	46a1                	li	a3,8
  800406:	8a3a                	mv	s4,a4
  800408:	bd9d                	j	80027e <vprintfmt+0x128>
  80040a:	000a6603          	lwu	a2,0(s4)
  80040e:	46a9                	li	a3,10
  800410:	8a3a                	mv	s4,a4
  800412:	b5b5                	j	80027e <vprintfmt+0x128>
  800414:	000a6603          	lwu	a2,0(s4)
  800418:	46c1                	li	a3,16
  80041a:	8a3a                	mv	s4,a4
  80041c:	b58d                	j	80027e <vprintfmt+0x128>
  80041e:	9902                	jalr	s2
  800420:	bf15                	j	800354 <vprintfmt+0x1fe>
  800422:	85a6                	mv	a1,s1
  800424:	02d00513          	li	a0,45
  800428:	9902                	jalr	s2
  80042a:	40800633          	neg	a2,s0
  80042e:	8a5e                	mv	s4,s7
  800430:	46a9                	li	a3,10
  800432:	b5b1                	j	80027e <vprintfmt+0x128>
  800434:	01905663          	blez	s9,800440 <vprintfmt+0x2ea>
  800438:	02d00793          	li	a5,45
  80043c:	04fd9263          	bne	s11,a5,800480 <vprintfmt+0x32a>
  800440:	02800793          	li	a5,40
  800444:	00000a17          	auipc	s4,0x0
  800448:	145a0a13          	addi	s4,s4,325 # 800589 <main+0x9d>
  80044c:	02800513          	li	a0,40
  800450:	b5cd                	j	800332 <vprintfmt+0x1dc>
  800452:	85ea                	mv	a1,s10
  800454:	8522                	mv	a0,s0
  800456:	07a000ef          	jal	8004d0 <strnlen>
  80045a:	40ac8cbb          	subw	s9,s9,a0
  80045e:	01905963          	blez	s9,800470 <vprintfmt+0x31a>
  800462:	2d81                	sext.w	s11,s11
  800464:	85a6                	mv	a1,s1
  800466:	856e                	mv	a0,s11
  800468:	3cfd                	addiw	s9,s9,-1
  80046a:	9902                	jalr	s2
  80046c:	fe0c9ce3          	bnez	s9,800464 <vprintfmt+0x30e>
  800470:	00044783          	lbu	a5,0(s0)
  800474:	0007851b          	sext.w	a0,a5
  800478:	ea079de3          	bnez	a5,800332 <vprintfmt+0x1dc>
  80047c:	6a22                	ld	s4,8(sp)
  80047e:	b331                	j	80018a <vprintfmt+0x34>
  800480:	85ea                	mv	a1,s10
  800482:	00000517          	auipc	a0,0x0
  800486:	10650513          	addi	a0,a0,262 # 800588 <main+0x9c>
  80048a:	046000ef          	jal	8004d0 <strnlen>
  80048e:	40ac8cbb          	subw	s9,s9,a0
  800492:	00000417          	auipc	s0,0x0
  800496:	0f640413          	addi	s0,s0,246 # 800588 <main+0x9c>
  80049a:	00000a17          	auipc	s4,0x0
  80049e:	0efa0a13          	addi	s4,s4,239 # 800589 <main+0x9d>
  8004a2:	02800793          	li	a5,40
  8004a6:	02800513          	li	a0,40
  8004aa:	fb904ce3          	bgtz	s9,800462 <vprintfmt+0x30c>
  8004ae:	b551                	j	800332 <vprintfmt+0x1dc>

00000000008004b0 <printfmt>:
  8004b0:	715d                	addi	sp,sp,-80
  8004b2:	02810313          	addi	t1,sp,40
  8004b6:	f436                	sd	a3,40(sp)
  8004b8:	869a                	mv	a3,t1
  8004ba:	ec06                	sd	ra,24(sp)
  8004bc:	f83a                	sd	a4,48(sp)
  8004be:	fc3e                	sd	a5,56(sp)
  8004c0:	e0c2                	sd	a6,64(sp)
  8004c2:	e4c6                	sd	a7,72(sp)
  8004c4:	e41a                	sd	t1,8(sp)
  8004c6:	c91ff0ef          	jal	800156 <vprintfmt>
  8004ca:	60e2                	ld	ra,24(sp)
  8004cc:	6161                	addi	sp,sp,80
  8004ce:	8082                	ret

00000000008004d0 <strnlen>:
  8004d0:	4781                	li	a5,0
  8004d2:	e589                	bnez	a1,8004dc <strnlen+0xc>
  8004d4:	a811                	j	8004e8 <strnlen+0x18>
  8004d6:	0785                	addi	a5,a5,1
  8004d8:	00f58863          	beq	a1,a5,8004e8 <strnlen+0x18>
  8004dc:	00f50733          	add	a4,a0,a5
  8004e0:	00074703          	lbu	a4,0(a4)
  8004e4:	fb6d                	bnez	a4,8004d6 <strnlen+0x6>
  8004e6:	85be                	mv	a1,a5
  8004e8:	852e                	mv	a0,a1
  8004ea:	8082                	ret

00000000008004ec <main>:
  8004ec:	1101                	addi	sp,sp,-32
  8004ee:	ec06                	sd	ra,24(sp)
  8004f0:	e822                	sd	s0,16(sp)
  8004f2:	e426                	sd	s1,8(sp)
  8004f4:	e04a                	sd	s2,0(sp)
  8004f6:	be5ff0ef          	jal	8000da <getpid>
  8004fa:	85aa                	mv	a1,a0
  8004fc:	00000517          	auipc	a0,0x0
  800500:	17450513          	addi	a0,a0,372 # 800670 <main+0x184>
  800504:	b3dff0ef          	jal	800040 <cprintf>
  800508:	4401                	li	s0,0
  80050a:	00000917          	auipc	s2,0x0
  80050e:	18690913          	addi	s2,s2,390 # 800690 <main+0x1a4>
  800512:	4495                	li	s1,5
  800514:	bc5ff0ef          	jal	8000d8 <yield>
  800518:	bc3ff0ef          	jal	8000da <getpid>
  80051c:	85aa                	mv	a1,a0
  80051e:	8622                	mv	a2,s0
  800520:	854a                	mv	a0,s2
  800522:	2405                	addiw	s0,s0,1
  800524:	b1dff0ef          	jal	800040 <cprintf>
  800528:	fe9416e3          	bne	s0,s1,800514 <main+0x28>
  80052c:	bafff0ef          	jal	8000da <getpid>
  800530:	85aa                	mv	a1,a0
  800532:	00000517          	auipc	a0,0x0
  800536:	18650513          	addi	a0,a0,390 # 8006b8 <main+0x1cc>
  80053a:	b07ff0ef          	jal	800040 <cprintf>
  80053e:	00000517          	auipc	a0,0x0
  800542:	19a50513          	addi	a0,a0,410 # 8006d8 <main+0x1ec>
  800546:	afbff0ef          	jal	800040 <cprintf>
  80054a:	60e2                	ld	ra,24(sp)
  80054c:	6442                	ld	s0,16(sp)
  80054e:	64a2                	ld	s1,8(sp)
  800550:	6902                	ld	s2,0(sp)
  800552:	4501                	li	a0,0
  800554:	6105                	addi	sp,sp,32
  800556:	8082                	ret
