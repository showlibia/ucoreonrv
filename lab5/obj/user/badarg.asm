
obj/__user_badarg.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	126000ef          	jal	800146 <umain>
  800024:	a001                	j	800024 <_start+0x4>

0000000000800026 <__panic>:
  800026:	715d                	addi	sp,sp,-80
  800028:	e822                	sd	s0,16(sp)
  80002a:	fc3e                	sd	a5,56(sp)
  80002c:	8432                	mv	s0,a2
  80002e:	103c                	addi	a5,sp,40
  800030:	862e                	mv	a2,a1
  800032:	85aa                	mv	a1,a0
  800034:	00000517          	auipc	a0,0x0
  800038:	61450513          	addi	a0,a0,1556 # 800648 <main+0xf2>
  80003c:	ec06                	sd	ra,24(sp)
  80003e:	f436                	sd	a3,40(sp)
  800040:	f83a                	sd	a4,48(sp)
  800042:	e0c2                	sd	a6,64(sp)
  800044:	e4c6                	sd	a7,72(sp)
  800046:	e43e                	sd	a5,8(sp)
  800048:	058000ef          	jal	8000a0 <cprintf>
  80004c:	65a2                	ld	a1,8(sp)
  80004e:	8522                	mv	a0,s0
  800050:	030000ef          	jal	800080 <vcprintf>
  800054:	00000517          	auipc	a0,0x0
  800058:	61450513          	addi	a0,a0,1556 # 800668 <main+0x112>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0c8000ef          	jal	80012a <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0b6000ef          	jal	800124 <sys_putc>
  800072:	401c                	lw	a5,0(s0)
  800074:	60a2                	ld	ra,8(sp)
  800076:	2785                	addiw	a5,a5,1
  800078:	c01c                	sw	a5,0(s0)
  80007a:	6402                	ld	s0,0(sp)
  80007c:	0141                	addi	sp,sp,16
  80007e:	8082                	ret

0000000000800080 <vcprintf>:
  800080:	1101                	addi	sp,sp,-32
  800082:	862a                	mv	a2,a0
  800084:	86ae                	mv	a3,a1
  800086:	00000517          	auipc	a0,0x0
  80008a:	fe050513          	addi	a0,a0,-32 # 800066 <cputch>
  80008e:	006c                	addi	a1,sp,12
  800090:	ec06                	sd	ra,24(sp)
  800092:	c602                	sw	zero,12(sp)
  800094:	12c000ef          	jal	8001c0 <vprintfmt>
  800098:	60e2                	ld	ra,24(sp)
  80009a:	4532                	lw	a0,12(sp)
  80009c:	6105                	addi	sp,sp,32
  80009e:	8082                	ret

00000000008000a0 <cprintf>:
  8000a0:	711d                	addi	sp,sp,-96
  8000a2:	02810313          	addi	t1,sp,40
  8000a6:	f42e                	sd	a1,40(sp)
  8000a8:	f832                	sd	a2,48(sp)
  8000aa:	fc36                	sd	a3,56(sp)
  8000ac:	862a                	mv	a2,a0
  8000ae:	004c                	addi	a1,sp,4
  8000b0:	00000517          	auipc	a0,0x0
  8000b4:	fb650513          	addi	a0,a0,-74 # 800066 <cputch>
  8000b8:	869a                	mv	a3,t1
  8000ba:	ec06                	sd	ra,24(sp)
  8000bc:	e0ba                	sd	a4,64(sp)
  8000be:	e4be                	sd	a5,72(sp)
  8000c0:	e8c2                	sd	a6,80(sp)
  8000c2:	ecc6                	sd	a7,88(sp)
  8000c4:	e41a                	sd	t1,8(sp)
  8000c6:	c202                	sw	zero,4(sp)
  8000c8:	0f8000ef          	jal	8001c0 <vprintfmt>
  8000cc:	60e2                	ld	ra,24(sp)
  8000ce:	4512                	lw	a0,4(sp)
  8000d0:	6125                	addi	sp,sp,96
  8000d2:	8082                	ret

00000000008000d4 <syscall>:
  8000d4:	7175                	addi	sp,sp,-144
  8000d6:	e42a                	sd	a0,8(sp)
  8000d8:	0108                	addi	a0,sp,128
  8000da:	ecae                	sd	a1,88(sp)
  8000dc:	f0b2                	sd	a2,96(sp)
  8000de:	f4b6                	sd	a3,104(sp)
  8000e0:	f8ba                	sd	a4,112(sp)
  8000e2:	fcbe                	sd	a5,120(sp)
  8000e4:	e142                	sd	a6,128(sp)
  8000e6:	e546                	sd	a7,136(sp)
  8000e8:	f02a                	sd	a0,32(sp)
  8000ea:	f42e                	sd	a1,40(sp)
  8000ec:	f832                	sd	a2,48(sp)
  8000ee:	fc36                	sd	a3,56(sp)
  8000f0:	e0ba                	sd	a4,64(sp)
  8000f2:	e4be                	sd	a5,72(sp)
  8000f4:	6522                	ld	a0,8(sp)
  8000f6:	75a2                	ld	a1,40(sp)
  8000f8:	7642                	ld	a2,48(sp)
  8000fa:	76e2                	ld	a3,56(sp)
  8000fc:	6706                	ld	a4,64(sp)
  8000fe:	67a6                	ld	a5,72(sp)
  800100:	00000073          	ecall
  800104:	00a13e23          	sd	a0,28(sp)
  800108:	4572                	lw	a0,28(sp)
  80010a:	6149                	addi	sp,sp,144
  80010c:	8082                	ret

000000000080010e <sys_exit>:
  80010e:	85aa                	mv	a1,a0
  800110:	4505                	li	a0,1
  800112:	b7c9                	j	8000d4 <syscall>

0000000000800114 <sys_fork>:
  800114:	4509                	li	a0,2
  800116:	bf7d                	j	8000d4 <syscall>

0000000000800118 <sys_wait>:
  800118:	862e                	mv	a2,a1
  80011a:	85aa                	mv	a1,a0
  80011c:	450d                	li	a0,3
  80011e:	bf5d                	j	8000d4 <syscall>

0000000000800120 <sys_yield>:
  800120:	4529                	li	a0,10
  800122:	bf4d                	j	8000d4 <syscall>

0000000000800124 <sys_putc>:
  800124:	85aa                	mv	a1,a0
  800126:	4579                	li	a0,30
  800128:	b775                	j	8000d4 <syscall>

000000000080012a <exit>:
  80012a:	1141                	addi	sp,sp,-16
  80012c:	e406                	sd	ra,8(sp)
  80012e:	fe1ff0ef          	jal	80010e <sys_exit>
  800132:	00000517          	auipc	a0,0x0
  800136:	53e50513          	addi	a0,a0,1342 # 800670 <main+0x11a>
  80013a:	f67ff0ef          	jal	8000a0 <cprintf>
  80013e:	a001                	j	80013e <exit+0x14>

0000000000800140 <fork>:
  800140:	bfd1                	j	800114 <sys_fork>

0000000000800142 <waitpid>:
  800142:	bfd9                	j	800118 <sys_wait>

0000000000800144 <yield>:
  800144:	bff1                	j	800120 <sys_yield>

0000000000800146 <umain>:
  800146:	1141                	addi	sp,sp,-16
  800148:	e406                	sd	ra,8(sp)
  80014a:	40c000ef          	jal	800556 <main>
  80014e:	fddff0ef          	jal	80012a <exit>

0000000000800152 <printnum>:
  800152:	02069813          	slli	a6,a3,0x20
  800156:	7179                	addi	sp,sp,-48
  800158:	02085813          	srli	a6,a6,0x20
  80015c:	e052                	sd	s4,0(sp)
  80015e:	03067a33          	remu	s4,a2,a6
  800162:	f022                	sd	s0,32(sp)
  800164:	ec26                	sd	s1,24(sp)
  800166:	e84a                	sd	s2,16(sp)
  800168:	f406                	sd	ra,40(sp)
  80016a:	84aa                	mv	s1,a0
  80016c:	892e                	mv	s2,a1
  80016e:	fff7041b          	addiw	s0,a4,-1
  800172:	2a01                	sext.w	s4,s4
  800174:	05067063          	bgeu	a2,a6,8001b4 <printnum+0x62>
  800178:	e44e                	sd	s3,8(sp)
  80017a:	89be                	mv	s3,a5
  80017c:	4785                	li	a5,1
  80017e:	00e7d763          	bge	a5,a4,80018c <printnum+0x3a>
  800182:	85ca                	mv	a1,s2
  800184:	854e                	mv	a0,s3
  800186:	347d                	addiw	s0,s0,-1
  800188:	9482                	jalr	s1
  80018a:	fc65                	bnez	s0,800182 <printnum+0x30>
  80018c:	69a2                	ld	s3,8(sp)
  80018e:	1a02                	slli	s4,s4,0x20
  800190:	020a5a13          	srli	s4,s4,0x20
  800194:	00000797          	auipc	a5,0x0
  800198:	4f478793          	addi	a5,a5,1268 # 800688 <main+0x132>
  80019c:	97d2                	add	a5,a5,s4
  80019e:	7402                	ld	s0,32(sp)
  8001a0:	0007c503          	lbu	a0,0(a5)
  8001a4:	70a2                	ld	ra,40(sp)
  8001a6:	6a02                	ld	s4,0(sp)
  8001a8:	85ca                	mv	a1,s2
  8001aa:	87a6                	mv	a5,s1
  8001ac:	6942                	ld	s2,16(sp)
  8001ae:	64e2                	ld	s1,24(sp)
  8001b0:	6145                	addi	sp,sp,48
  8001b2:	8782                	jr	a5
  8001b4:	03065633          	divu	a2,a2,a6
  8001b8:	8722                	mv	a4,s0
  8001ba:	f99ff0ef          	jal	800152 <printnum>
  8001be:	bfc1                	j	80018e <printnum+0x3c>

00000000008001c0 <vprintfmt>:
  8001c0:	7119                	addi	sp,sp,-128
  8001c2:	f4a6                	sd	s1,104(sp)
  8001c4:	f0ca                	sd	s2,96(sp)
  8001c6:	ecce                	sd	s3,88(sp)
  8001c8:	e8d2                	sd	s4,80(sp)
  8001ca:	e4d6                	sd	s5,72(sp)
  8001cc:	e0da                	sd	s6,64(sp)
  8001ce:	f862                	sd	s8,48(sp)
  8001d0:	fc86                	sd	ra,120(sp)
  8001d2:	f8a2                	sd	s0,112(sp)
  8001d4:	fc5e                	sd	s7,56(sp)
  8001d6:	f466                	sd	s9,40(sp)
  8001d8:	f06a                	sd	s10,32(sp)
  8001da:	ec6e                	sd	s11,24(sp)
  8001dc:	892a                	mv	s2,a0
  8001de:	84ae                	mv	s1,a1
  8001e0:	8c32                	mv	s8,a2
  8001e2:	8a36                	mv	s4,a3
  8001e4:	02500993          	li	s3,37
  8001e8:	05500b13          	li	s6,85
  8001ec:	00000a97          	auipc	s5,0x0
  8001f0:	65ca8a93          	addi	s5,s5,1628 # 800848 <main+0x2f2>
  8001f4:	000c4503          	lbu	a0,0(s8)
  8001f8:	001c0413          	addi	s0,s8,1
  8001fc:	01350a63          	beq	a0,s3,800210 <vprintfmt+0x50>
  800200:	cd0d                	beqz	a0,80023a <vprintfmt+0x7a>
  800202:	85a6                	mv	a1,s1
  800204:	9902                	jalr	s2
  800206:	00044503          	lbu	a0,0(s0)
  80020a:	0405                	addi	s0,s0,1
  80020c:	ff351ae3          	bne	a0,s3,800200 <vprintfmt+0x40>
  800210:	02000d93          	li	s11,32
  800214:	4b81                	li	s7,0
  800216:	4601                	li	a2,0
  800218:	5d7d                	li	s10,-1
  80021a:	5cfd                	li	s9,-1
  80021c:	00044683          	lbu	a3,0(s0)
  800220:	00140c13          	addi	s8,s0,1
  800224:	fdd6859b          	addiw	a1,a3,-35
  800228:	0ff5f593          	zext.b	a1,a1
  80022c:	02bb6663          	bltu	s6,a1,800258 <vprintfmt+0x98>
  800230:	058a                	slli	a1,a1,0x2
  800232:	95d6                	add	a1,a1,s5
  800234:	4198                	lw	a4,0(a1)
  800236:	9756                	add	a4,a4,s5
  800238:	8702                	jr	a4
  80023a:	70e6                	ld	ra,120(sp)
  80023c:	7446                	ld	s0,112(sp)
  80023e:	74a6                	ld	s1,104(sp)
  800240:	7906                	ld	s2,96(sp)
  800242:	69e6                	ld	s3,88(sp)
  800244:	6a46                	ld	s4,80(sp)
  800246:	6aa6                	ld	s5,72(sp)
  800248:	6b06                	ld	s6,64(sp)
  80024a:	7be2                	ld	s7,56(sp)
  80024c:	7c42                	ld	s8,48(sp)
  80024e:	7ca2                	ld	s9,40(sp)
  800250:	7d02                	ld	s10,32(sp)
  800252:	6de2                	ld	s11,24(sp)
  800254:	6109                	addi	sp,sp,128
  800256:	8082                	ret
  800258:	85a6                	mv	a1,s1
  80025a:	02500513          	li	a0,37
  80025e:	9902                	jalr	s2
  800260:	fff44703          	lbu	a4,-1(s0)
  800264:	02500793          	li	a5,37
  800268:	8c22                	mv	s8,s0
  80026a:	f8f705e3          	beq	a4,a5,8001f4 <vprintfmt+0x34>
  80026e:	02500713          	li	a4,37
  800272:	ffec4783          	lbu	a5,-2(s8)
  800276:	1c7d                	addi	s8,s8,-1
  800278:	fee79de3          	bne	a5,a4,800272 <vprintfmt+0xb2>
  80027c:	bfa5                	j	8001f4 <vprintfmt+0x34>
  80027e:	00144783          	lbu	a5,1(s0)
  800282:	4725                	li	a4,9
  800284:	fd068d1b          	addiw	s10,a3,-48
  800288:	fd07859b          	addiw	a1,a5,-48
  80028c:	0007869b          	sext.w	a3,a5
  800290:	8462                	mv	s0,s8
  800292:	02b76563          	bltu	a4,a1,8002bc <vprintfmt+0xfc>
  800296:	4525                	li	a0,9
  800298:	00144783          	lbu	a5,1(s0)
  80029c:	002d171b          	slliw	a4,s10,0x2
  8002a0:	01a7073b          	addw	a4,a4,s10
  8002a4:	0017171b          	slliw	a4,a4,0x1
  8002a8:	9f35                	addw	a4,a4,a3
  8002aa:	fd07859b          	addiw	a1,a5,-48
  8002ae:	0405                	addi	s0,s0,1
  8002b0:	fd070d1b          	addiw	s10,a4,-48
  8002b4:	0007869b          	sext.w	a3,a5
  8002b8:	feb570e3          	bgeu	a0,a1,800298 <vprintfmt+0xd8>
  8002bc:	f60cd0e3          	bgez	s9,80021c <vprintfmt+0x5c>
  8002c0:	8cea                	mv	s9,s10
  8002c2:	5d7d                	li	s10,-1
  8002c4:	bfa1                	j	80021c <vprintfmt+0x5c>
  8002c6:	8db6                	mv	s11,a3
  8002c8:	8462                	mv	s0,s8
  8002ca:	bf89                	j	80021c <vprintfmt+0x5c>
  8002cc:	8462                	mv	s0,s8
  8002ce:	4b85                	li	s7,1
  8002d0:	b7b1                	j	80021c <vprintfmt+0x5c>
  8002d2:	4785                	li	a5,1
  8002d4:	008a0713          	addi	a4,s4,8
  8002d8:	00c7c463          	blt	a5,a2,8002e0 <vprintfmt+0x120>
  8002dc:	1a060163          	beqz	a2,80047e <vprintfmt+0x2be>
  8002e0:	000a3603          	ld	a2,0(s4)
  8002e4:	46c1                	li	a3,16
  8002e6:	8a3a                	mv	s4,a4
  8002e8:	000d879b          	sext.w	a5,s11
  8002ec:	8766                	mv	a4,s9
  8002ee:	85a6                	mv	a1,s1
  8002f0:	854a                	mv	a0,s2
  8002f2:	e61ff0ef          	jal	800152 <printnum>
  8002f6:	bdfd                	j	8001f4 <vprintfmt+0x34>
  8002f8:	000a2503          	lw	a0,0(s4)
  8002fc:	85a6                	mv	a1,s1
  8002fe:	0a21                	addi	s4,s4,8
  800300:	9902                	jalr	s2
  800302:	bdcd                	j	8001f4 <vprintfmt+0x34>
  800304:	4785                	li	a5,1
  800306:	008a0713          	addi	a4,s4,8
  80030a:	00c7c463          	blt	a5,a2,800312 <vprintfmt+0x152>
  80030e:	16060363          	beqz	a2,800474 <vprintfmt+0x2b4>
  800312:	000a3603          	ld	a2,0(s4)
  800316:	46a9                	li	a3,10
  800318:	8a3a                	mv	s4,a4
  80031a:	b7f9                	j	8002e8 <vprintfmt+0x128>
  80031c:	85a6                	mv	a1,s1
  80031e:	03000513          	li	a0,48
  800322:	9902                	jalr	s2
  800324:	85a6                	mv	a1,s1
  800326:	07800513          	li	a0,120
  80032a:	9902                	jalr	s2
  80032c:	000a3603          	ld	a2,0(s4)
  800330:	46c1                	li	a3,16
  800332:	0a21                	addi	s4,s4,8
  800334:	bf55                	j	8002e8 <vprintfmt+0x128>
  800336:	85a6                	mv	a1,s1
  800338:	02500513          	li	a0,37
  80033c:	9902                	jalr	s2
  80033e:	bd5d                	j	8001f4 <vprintfmt+0x34>
  800340:	000a2d03          	lw	s10,0(s4)
  800344:	8462                	mv	s0,s8
  800346:	0a21                	addi	s4,s4,8
  800348:	bf95                	j	8002bc <vprintfmt+0xfc>
  80034a:	4785                	li	a5,1
  80034c:	008a0713          	addi	a4,s4,8
  800350:	00c7c463          	blt	a5,a2,800358 <vprintfmt+0x198>
  800354:	10060b63          	beqz	a2,80046a <vprintfmt+0x2aa>
  800358:	000a3603          	ld	a2,0(s4)
  80035c:	46a1                	li	a3,8
  80035e:	8a3a                	mv	s4,a4
  800360:	b761                	j	8002e8 <vprintfmt+0x128>
  800362:	fffcc793          	not	a5,s9
  800366:	97fd                	srai	a5,a5,0x3f
  800368:	00fcf7b3          	and	a5,s9,a5
  80036c:	00078c9b          	sext.w	s9,a5
  800370:	8462                	mv	s0,s8
  800372:	b56d                	j	80021c <vprintfmt+0x5c>
  800374:	000a3403          	ld	s0,0(s4)
  800378:	008a0793          	addi	a5,s4,8
  80037c:	e43e                	sd	a5,8(sp)
  80037e:	12040063          	beqz	s0,80049e <vprintfmt+0x2de>
  800382:	0d905963          	blez	s9,800454 <vprintfmt+0x294>
  800386:	02d00793          	li	a5,45
  80038a:	00140a13          	addi	s4,s0,1
  80038e:	12fd9763          	bne	s11,a5,8004bc <vprintfmt+0x2fc>
  800392:	00044783          	lbu	a5,0(s0)
  800396:	0007851b          	sext.w	a0,a5
  80039a:	cb9d                	beqz	a5,8003d0 <vprintfmt+0x210>
  80039c:	547d                	li	s0,-1
  80039e:	05e00d93          	li	s11,94
  8003a2:	000d4563          	bltz	s10,8003ac <vprintfmt+0x1ec>
  8003a6:	3d7d                	addiw	s10,s10,-1
  8003a8:	028d0263          	beq	s10,s0,8003cc <vprintfmt+0x20c>
  8003ac:	85a6                	mv	a1,s1
  8003ae:	0c0b8d63          	beqz	s7,800488 <vprintfmt+0x2c8>
  8003b2:	3781                	addiw	a5,a5,-32
  8003b4:	0cfdfa63          	bgeu	s11,a5,800488 <vprintfmt+0x2c8>
  8003b8:	03f00513          	li	a0,63
  8003bc:	9902                	jalr	s2
  8003be:	000a4783          	lbu	a5,0(s4)
  8003c2:	3cfd                	addiw	s9,s9,-1
  8003c4:	0a05                	addi	s4,s4,1
  8003c6:	0007851b          	sext.w	a0,a5
  8003ca:	ffe1                	bnez	a5,8003a2 <vprintfmt+0x1e2>
  8003cc:	01905963          	blez	s9,8003de <vprintfmt+0x21e>
  8003d0:	85a6                	mv	a1,s1
  8003d2:	02000513          	li	a0,32
  8003d6:	3cfd                	addiw	s9,s9,-1
  8003d8:	9902                	jalr	s2
  8003da:	fe0c9be3          	bnez	s9,8003d0 <vprintfmt+0x210>
  8003de:	6a22                	ld	s4,8(sp)
  8003e0:	bd11                	j	8001f4 <vprintfmt+0x34>
  8003e2:	4785                	li	a5,1
  8003e4:	008a0b93          	addi	s7,s4,8
  8003e8:	00c7c363          	blt	a5,a2,8003ee <vprintfmt+0x22e>
  8003ec:	ce25                	beqz	a2,800464 <vprintfmt+0x2a4>
  8003ee:	000a3403          	ld	s0,0(s4)
  8003f2:	08044d63          	bltz	s0,80048c <vprintfmt+0x2cc>
  8003f6:	8622                	mv	a2,s0
  8003f8:	8a5e                	mv	s4,s7
  8003fa:	46a9                	li	a3,10
  8003fc:	b5f5                	j	8002e8 <vprintfmt+0x128>
  8003fe:	000a2783          	lw	a5,0(s4)
  800402:	4661                	li	a2,24
  800404:	41f7d71b          	sraiw	a4,a5,0x1f
  800408:	8fb9                	xor	a5,a5,a4
  80040a:	40e786bb          	subw	a3,a5,a4
  80040e:	02d64663          	blt	a2,a3,80043a <vprintfmt+0x27a>
  800412:	00369713          	slli	a4,a3,0x3
  800416:	00000797          	auipc	a5,0x0
  80041a:	58a78793          	addi	a5,a5,1418 # 8009a0 <error_string>
  80041e:	97ba                	add	a5,a5,a4
  800420:	639c                	ld	a5,0(a5)
  800422:	cf81                	beqz	a5,80043a <vprintfmt+0x27a>
  800424:	86be                	mv	a3,a5
  800426:	00000617          	auipc	a2,0x0
  80042a:	29260613          	addi	a2,a2,658 # 8006b8 <main+0x162>
  80042e:	85a6                	mv	a1,s1
  800430:	854a                	mv	a0,s2
  800432:	0e8000ef          	jal	80051a <printfmt>
  800436:	0a21                	addi	s4,s4,8
  800438:	bb75                	j	8001f4 <vprintfmt+0x34>
  80043a:	00000617          	auipc	a2,0x0
  80043e:	26e60613          	addi	a2,a2,622 # 8006a8 <main+0x152>
  800442:	85a6                	mv	a1,s1
  800444:	854a                	mv	a0,s2
  800446:	0d4000ef          	jal	80051a <printfmt>
  80044a:	0a21                	addi	s4,s4,8
  80044c:	b365                	j	8001f4 <vprintfmt+0x34>
  80044e:	2605                	addiw	a2,a2,1
  800450:	8462                	mv	s0,s8
  800452:	b3e9                	j	80021c <vprintfmt+0x5c>
  800454:	00044783          	lbu	a5,0(s0)
  800458:	0007851b          	sext.w	a0,a5
  80045c:	d3c9                	beqz	a5,8003de <vprintfmt+0x21e>
  80045e:	00140a13          	addi	s4,s0,1
  800462:	bf2d                	j	80039c <vprintfmt+0x1dc>
  800464:	000a2403          	lw	s0,0(s4)
  800468:	b769                	j	8003f2 <vprintfmt+0x232>
  80046a:	000a6603          	lwu	a2,0(s4)
  80046e:	46a1                	li	a3,8
  800470:	8a3a                	mv	s4,a4
  800472:	bd9d                	j	8002e8 <vprintfmt+0x128>
  800474:	000a6603          	lwu	a2,0(s4)
  800478:	46a9                	li	a3,10
  80047a:	8a3a                	mv	s4,a4
  80047c:	b5b5                	j	8002e8 <vprintfmt+0x128>
  80047e:	000a6603          	lwu	a2,0(s4)
  800482:	46c1                	li	a3,16
  800484:	8a3a                	mv	s4,a4
  800486:	b58d                	j	8002e8 <vprintfmt+0x128>
  800488:	9902                	jalr	s2
  80048a:	bf15                	j	8003be <vprintfmt+0x1fe>
  80048c:	85a6                	mv	a1,s1
  80048e:	02d00513          	li	a0,45
  800492:	9902                	jalr	s2
  800494:	40800633          	neg	a2,s0
  800498:	8a5e                	mv	s4,s7
  80049a:	46a9                	li	a3,10
  80049c:	b5b1                	j	8002e8 <vprintfmt+0x128>
  80049e:	01905663          	blez	s9,8004aa <vprintfmt+0x2ea>
  8004a2:	02d00793          	li	a5,45
  8004a6:	04fd9263          	bne	s11,a5,8004ea <vprintfmt+0x32a>
  8004aa:	02800793          	li	a5,40
  8004ae:	00000a17          	auipc	s4,0x0
  8004b2:	1f3a0a13          	addi	s4,s4,499 # 8006a1 <main+0x14b>
  8004b6:	02800513          	li	a0,40
  8004ba:	b5cd                	j	80039c <vprintfmt+0x1dc>
  8004bc:	85ea                	mv	a1,s10
  8004be:	8522                	mv	a0,s0
  8004c0:	07a000ef          	jal	80053a <strnlen>
  8004c4:	40ac8cbb          	subw	s9,s9,a0
  8004c8:	01905963          	blez	s9,8004da <vprintfmt+0x31a>
  8004cc:	2d81                	sext.w	s11,s11
  8004ce:	85a6                	mv	a1,s1
  8004d0:	856e                	mv	a0,s11
  8004d2:	3cfd                	addiw	s9,s9,-1
  8004d4:	9902                	jalr	s2
  8004d6:	fe0c9ce3          	bnez	s9,8004ce <vprintfmt+0x30e>
  8004da:	00044783          	lbu	a5,0(s0)
  8004de:	0007851b          	sext.w	a0,a5
  8004e2:	ea079de3          	bnez	a5,80039c <vprintfmt+0x1dc>
  8004e6:	6a22                	ld	s4,8(sp)
  8004e8:	b331                	j	8001f4 <vprintfmt+0x34>
  8004ea:	85ea                	mv	a1,s10
  8004ec:	00000517          	auipc	a0,0x0
  8004f0:	1b450513          	addi	a0,a0,436 # 8006a0 <main+0x14a>
  8004f4:	046000ef          	jal	80053a <strnlen>
  8004f8:	40ac8cbb          	subw	s9,s9,a0
  8004fc:	00000417          	auipc	s0,0x0
  800500:	1a440413          	addi	s0,s0,420 # 8006a0 <main+0x14a>
  800504:	00000a17          	auipc	s4,0x0
  800508:	19da0a13          	addi	s4,s4,413 # 8006a1 <main+0x14b>
  80050c:	02800793          	li	a5,40
  800510:	02800513          	li	a0,40
  800514:	fb904ce3          	bgtz	s9,8004cc <vprintfmt+0x30c>
  800518:	b551                	j	80039c <vprintfmt+0x1dc>

000000000080051a <printfmt>:
  80051a:	715d                	addi	sp,sp,-80
  80051c:	02810313          	addi	t1,sp,40
  800520:	f436                	sd	a3,40(sp)
  800522:	869a                	mv	a3,t1
  800524:	ec06                	sd	ra,24(sp)
  800526:	f83a                	sd	a4,48(sp)
  800528:	fc3e                	sd	a5,56(sp)
  80052a:	e0c2                	sd	a6,64(sp)
  80052c:	e4c6                	sd	a7,72(sp)
  80052e:	e41a                	sd	t1,8(sp)
  800530:	c91ff0ef          	jal	8001c0 <vprintfmt>
  800534:	60e2                	ld	ra,24(sp)
  800536:	6161                	addi	sp,sp,80
  800538:	8082                	ret

000000000080053a <strnlen>:
  80053a:	4781                	li	a5,0
  80053c:	e589                	bnez	a1,800546 <strnlen+0xc>
  80053e:	a811                	j	800552 <strnlen+0x18>
  800540:	0785                	addi	a5,a5,1
  800542:	00f58863          	beq	a1,a5,800552 <strnlen+0x18>
  800546:	00f50733          	add	a4,a0,a5
  80054a:	00074703          	lbu	a4,0(a4)
  80054e:	fb6d                	bnez	a4,800540 <strnlen+0x6>
  800550:	85be                	mv	a1,a5
  800552:	852e                	mv	a0,a1
  800554:	8082                	ret

0000000000800556 <main>:
  800556:	1101                	addi	sp,sp,-32
  800558:	ec06                	sd	ra,24(sp)
  80055a:	e822                	sd	s0,16(sp)
  80055c:	be5ff0ef          	jal	800140 <fork>
  800560:	c169                	beqz	a0,800622 <main+0xcc>
  800562:	842a                	mv	s0,a0
  800564:	0aa05063          	blez	a0,800604 <main+0xae>
  800568:	4581                	li	a1,0
  80056a:	557d                	li	a0,-1
  80056c:	bd7ff0ef          	jal	800142 <waitpid>
  800570:	c93d                	beqz	a0,8005e6 <main+0x90>
  800572:	458d                	li	a1,3
  800574:	05fa                	slli	a1,a1,0x1e
  800576:	8522                	mv	a0,s0
  800578:	bcbff0ef          	jal	800142 <waitpid>
  80057c:	c531                	beqz	a0,8005c8 <main+0x72>
  80057e:	006c                	addi	a1,sp,12
  800580:	8522                	mv	a0,s0
  800582:	bc1ff0ef          	jal	800142 <waitpid>
  800586:	e115                	bnez	a0,8005aa <main+0x54>
  800588:	4732                	lw	a4,12(sp)
  80058a:	67b1                	lui	a5,0xc
  80058c:	eaf78793          	addi	a5,a5,-337 # beaf <_start-0x7f4171>
  800590:	00f71d63          	bne	a4,a5,8005aa <main+0x54>
  800594:	00000517          	auipc	a0,0x0
  800598:	2a450513          	addi	a0,a0,676 # 800838 <main+0x2e2>
  80059c:	b05ff0ef          	jal	8000a0 <cprintf>
  8005a0:	60e2                	ld	ra,24(sp)
  8005a2:	6442                	ld	s0,16(sp)
  8005a4:	4501                	li	a0,0
  8005a6:	6105                	addi	sp,sp,32
  8005a8:	8082                	ret
  8005aa:	00000697          	auipc	a3,0x0
  8005ae:	25668693          	addi	a3,a3,598 # 800800 <main+0x2aa>
  8005b2:	00000617          	auipc	a2,0x0
  8005b6:	1e660613          	addi	a2,a2,486 # 800798 <main+0x242>
  8005ba:	45c9                	li	a1,18
  8005bc:	00000517          	auipc	a0,0x0
  8005c0:	1f450513          	addi	a0,a0,500 # 8007b0 <main+0x25a>
  8005c4:	a63ff0ef          	jal	800026 <__panic>
  8005c8:	00000697          	auipc	a3,0x0
  8005cc:	21068693          	addi	a3,a3,528 # 8007d8 <main+0x282>
  8005d0:	00000617          	auipc	a2,0x0
  8005d4:	1c860613          	addi	a2,a2,456 # 800798 <main+0x242>
  8005d8:	45c5                	li	a1,17
  8005da:	00000517          	auipc	a0,0x0
  8005de:	1d650513          	addi	a0,a0,470 # 8007b0 <main+0x25a>
  8005e2:	a45ff0ef          	jal	800026 <__panic>
  8005e6:	00000697          	auipc	a3,0x0
  8005ea:	1da68693          	addi	a3,a3,474 # 8007c0 <main+0x26a>
  8005ee:	00000617          	auipc	a2,0x0
  8005f2:	1aa60613          	addi	a2,a2,426 # 800798 <main+0x242>
  8005f6:	45c1                	li	a1,16
  8005f8:	00000517          	auipc	a0,0x0
  8005fc:	1b850513          	addi	a0,a0,440 # 8007b0 <main+0x25a>
  800600:	a27ff0ef          	jal	800026 <__panic>
  800604:	00000697          	auipc	a3,0x0
  800608:	18c68693          	addi	a3,a3,396 # 800790 <main+0x23a>
  80060c:	00000617          	auipc	a2,0x0
  800610:	18c60613          	addi	a2,a2,396 # 800798 <main+0x242>
  800614:	45bd                	li	a1,15
  800616:	00000517          	auipc	a0,0x0
  80061a:	19a50513          	addi	a0,a0,410 # 8007b0 <main+0x25a>
  80061e:	a09ff0ef          	jal	800026 <__panic>
  800622:	00000517          	auipc	a0,0x0
  800626:	15e50513          	addi	a0,a0,350 # 800780 <main+0x22a>
  80062a:	a77ff0ef          	jal	8000a0 <cprintf>
  80062e:	4429                	li	s0,10
  800630:	347d                	addiw	s0,s0,-1
  800632:	b13ff0ef          	jal	800144 <yield>
  800636:	fc6d                	bnez	s0,800630 <main+0xda>
  800638:	6531                	lui	a0,0xc
  80063a:	eaf50513          	addi	a0,a0,-337 # beaf <_start-0x7f4171>
  80063e:	aedff0ef          	jal	80012a <exit>
