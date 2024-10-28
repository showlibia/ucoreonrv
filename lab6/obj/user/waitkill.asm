
obj/__user_waitkill.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	132000ef          	jal	800152 <umain>
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
  800038:	66450513          	addi	a0,a0,1636 # 800698 <main+0xae>
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
  800058:	77c50513          	addi	a0,a0,1916 # 8007d0 <main+0x1e6>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0d0000ef          	jal	800132 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0be000ef          	jal	80012c <sys_putc>
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
  800094:	138000ef          	jal	8001cc <vprintfmt>
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
  8000c8:	104000ef          	jal	8001cc <vprintfmt>
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
  8000f4:	4522                	lw	a0,8(sp)
  8000f6:	55a2                	lw	a1,40(sp)
  8000f8:	5642                	lw	a2,48(sp)
  8000fa:	56e2                	lw	a3,56(sp)
  8000fc:	4706                	lw	a4,64(sp)
  8000fe:	47a6                	lw	a5,72(sp)
  800100:	00000073          	ecall
  800104:	ce2a                	sw	a0,28(sp)
  800106:	4572                	lw	a0,28(sp)
  800108:	6149                	addi	sp,sp,144
  80010a:	8082                	ret

000000000080010c <sys_exit>:
  80010c:	85aa                	mv	a1,a0
  80010e:	4505                	li	a0,1
  800110:	b7d1                	j	8000d4 <syscall>

0000000000800112 <sys_fork>:
  800112:	4509                	li	a0,2
  800114:	b7c1                	j	8000d4 <syscall>

0000000000800116 <sys_wait>:
  800116:	862e                	mv	a2,a1
  800118:	85aa                	mv	a1,a0
  80011a:	450d                	li	a0,3
  80011c:	bf65                	j	8000d4 <syscall>

000000000080011e <sys_yield>:
  80011e:	4529                	li	a0,10
  800120:	bf55                	j	8000d4 <syscall>

0000000000800122 <sys_kill>:
  800122:	85aa                	mv	a1,a0
  800124:	4531                	li	a0,12
  800126:	b77d                	j	8000d4 <syscall>

0000000000800128 <sys_getpid>:
  800128:	4549                	li	a0,18
  80012a:	b76d                	j	8000d4 <syscall>

000000000080012c <sys_putc>:
  80012c:	85aa                	mv	a1,a0
  80012e:	4579                	li	a0,30
  800130:	b755                	j	8000d4 <syscall>

0000000000800132 <exit>:
  800132:	1141                	addi	sp,sp,-16
  800134:	e406                	sd	ra,8(sp)
  800136:	fd7ff0ef          	jal	80010c <sys_exit>
  80013a:	00000517          	auipc	a0,0x0
  80013e:	57e50513          	addi	a0,a0,1406 # 8006b8 <main+0xce>
  800142:	f5fff0ef          	jal	8000a0 <cprintf>
  800146:	a001                	j	800146 <exit+0x14>

0000000000800148 <fork>:
  800148:	b7e9                	j	800112 <sys_fork>

000000000080014a <waitpid>:
  80014a:	b7f1                	j	800116 <sys_wait>

000000000080014c <yield>:
  80014c:	bfc9                	j	80011e <sys_yield>

000000000080014e <kill>:
  80014e:	bfd1                	j	800122 <sys_kill>

0000000000800150 <getpid>:
  800150:	bfe1                	j	800128 <sys_getpid>

0000000000800152 <umain>:
  800152:	1141                	addi	sp,sp,-16
  800154:	e406                	sd	ra,8(sp)
  800156:	494000ef          	jal	8005ea <main>
  80015a:	fd9ff0ef          	jal	800132 <exit>

000000000080015e <printnum>:
  80015e:	02069813          	slli	a6,a3,0x20
  800162:	7179                	addi	sp,sp,-48
  800164:	02085813          	srli	a6,a6,0x20
  800168:	e052                	sd	s4,0(sp)
  80016a:	03067a33          	remu	s4,a2,a6
  80016e:	f022                	sd	s0,32(sp)
  800170:	ec26                	sd	s1,24(sp)
  800172:	e84a                	sd	s2,16(sp)
  800174:	f406                	sd	ra,40(sp)
  800176:	84aa                	mv	s1,a0
  800178:	892e                	mv	s2,a1
  80017a:	fff7041b          	addiw	s0,a4,-1
  80017e:	2a01                	sext.w	s4,s4
  800180:	05067063          	bgeu	a2,a6,8001c0 <printnum+0x62>
  800184:	e44e                	sd	s3,8(sp)
  800186:	89be                	mv	s3,a5
  800188:	4785                	li	a5,1
  80018a:	00e7d763          	bge	a5,a4,800198 <printnum+0x3a>
  80018e:	85ca                	mv	a1,s2
  800190:	854e                	mv	a0,s3
  800192:	347d                	addiw	s0,s0,-1
  800194:	9482                	jalr	s1
  800196:	fc65                	bnez	s0,80018e <printnum+0x30>
  800198:	69a2                	ld	s3,8(sp)
  80019a:	1a02                	slli	s4,s4,0x20
  80019c:	020a5a13          	srli	s4,s4,0x20
  8001a0:	00000797          	auipc	a5,0x0
  8001a4:	53078793          	addi	a5,a5,1328 # 8006d0 <main+0xe6>
  8001a8:	97d2                	add	a5,a5,s4
  8001aa:	7402                	ld	s0,32(sp)
  8001ac:	0007c503          	lbu	a0,0(a5)
  8001b0:	70a2                	ld	ra,40(sp)
  8001b2:	6a02                	ld	s4,0(sp)
  8001b4:	85ca                	mv	a1,s2
  8001b6:	87a6                	mv	a5,s1
  8001b8:	6942                	ld	s2,16(sp)
  8001ba:	64e2                	ld	s1,24(sp)
  8001bc:	6145                	addi	sp,sp,48
  8001be:	8782                	jr	a5
  8001c0:	03065633          	divu	a2,a2,a6
  8001c4:	8722                	mv	a4,s0
  8001c6:	f99ff0ef          	jal	80015e <printnum>
  8001ca:	bfc1                	j	80019a <printnum+0x3c>

00000000008001cc <vprintfmt>:
  8001cc:	7119                	addi	sp,sp,-128
  8001ce:	f4a6                	sd	s1,104(sp)
  8001d0:	f0ca                	sd	s2,96(sp)
  8001d2:	ecce                	sd	s3,88(sp)
  8001d4:	e8d2                	sd	s4,80(sp)
  8001d6:	e4d6                	sd	s5,72(sp)
  8001d8:	e0da                	sd	s6,64(sp)
  8001da:	f862                	sd	s8,48(sp)
  8001dc:	fc86                	sd	ra,120(sp)
  8001de:	f8a2                	sd	s0,112(sp)
  8001e0:	fc5e                	sd	s7,56(sp)
  8001e2:	f466                	sd	s9,40(sp)
  8001e4:	f06a                	sd	s10,32(sp)
  8001e6:	ec6e                	sd	s11,24(sp)
  8001e8:	892a                	mv	s2,a0
  8001ea:	84ae                	mv	s1,a1
  8001ec:	8c32                	mv	s8,a2
  8001ee:	8a36                	mv	s4,a3
  8001f0:	02500993          	li	s3,37
  8001f4:	05500b13          	li	s6,85
  8001f8:	00000a97          	auipc	s5,0x0
  8001fc:	68ca8a93          	addi	s5,s5,1676 # 800884 <main+0x29a>
  800200:	000c4503          	lbu	a0,0(s8)
  800204:	001c0413          	addi	s0,s8,1
  800208:	01350a63          	beq	a0,s3,80021c <vprintfmt+0x50>
  80020c:	cd0d                	beqz	a0,800246 <vprintfmt+0x7a>
  80020e:	85a6                	mv	a1,s1
  800210:	9902                	jalr	s2
  800212:	00044503          	lbu	a0,0(s0)
  800216:	0405                	addi	s0,s0,1
  800218:	ff351ae3          	bne	a0,s3,80020c <vprintfmt+0x40>
  80021c:	02000d93          	li	s11,32
  800220:	4b81                	li	s7,0
  800222:	4601                	li	a2,0
  800224:	5d7d                	li	s10,-1
  800226:	5cfd                	li	s9,-1
  800228:	00044683          	lbu	a3,0(s0)
  80022c:	00140c13          	addi	s8,s0,1
  800230:	fdd6859b          	addiw	a1,a3,-35
  800234:	0ff5f593          	zext.b	a1,a1
  800238:	02bb6663          	bltu	s6,a1,800264 <vprintfmt+0x98>
  80023c:	058a                	slli	a1,a1,0x2
  80023e:	95d6                	add	a1,a1,s5
  800240:	4198                	lw	a4,0(a1)
  800242:	9756                	add	a4,a4,s5
  800244:	8702                	jr	a4
  800246:	70e6                	ld	ra,120(sp)
  800248:	7446                	ld	s0,112(sp)
  80024a:	74a6                	ld	s1,104(sp)
  80024c:	7906                	ld	s2,96(sp)
  80024e:	69e6                	ld	s3,88(sp)
  800250:	6a46                	ld	s4,80(sp)
  800252:	6aa6                	ld	s5,72(sp)
  800254:	6b06                	ld	s6,64(sp)
  800256:	7be2                	ld	s7,56(sp)
  800258:	7c42                	ld	s8,48(sp)
  80025a:	7ca2                	ld	s9,40(sp)
  80025c:	7d02                	ld	s10,32(sp)
  80025e:	6de2                	ld	s11,24(sp)
  800260:	6109                	addi	sp,sp,128
  800262:	8082                	ret
  800264:	85a6                	mv	a1,s1
  800266:	02500513          	li	a0,37
  80026a:	9902                	jalr	s2
  80026c:	fff44703          	lbu	a4,-1(s0)
  800270:	02500793          	li	a5,37
  800274:	8c22                	mv	s8,s0
  800276:	f8f705e3          	beq	a4,a5,800200 <vprintfmt+0x34>
  80027a:	02500713          	li	a4,37
  80027e:	ffec4783          	lbu	a5,-2(s8)
  800282:	1c7d                	addi	s8,s8,-1
  800284:	fee79de3          	bne	a5,a4,80027e <vprintfmt+0xb2>
  800288:	bfa5                	j	800200 <vprintfmt+0x34>
  80028a:	00144783          	lbu	a5,1(s0)
  80028e:	4725                	li	a4,9
  800290:	fd068d1b          	addiw	s10,a3,-48
  800294:	fd07859b          	addiw	a1,a5,-48
  800298:	0007869b          	sext.w	a3,a5
  80029c:	8462                	mv	s0,s8
  80029e:	02b76563          	bltu	a4,a1,8002c8 <vprintfmt+0xfc>
  8002a2:	4525                	li	a0,9
  8002a4:	00144783          	lbu	a5,1(s0)
  8002a8:	002d171b          	slliw	a4,s10,0x2
  8002ac:	01a7073b          	addw	a4,a4,s10
  8002b0:	0017171b          	slliw	a4,a4,0x1
  8002b4:	9f35                	addw	a4,a4,a3
  8002b6:	fd07859b          	addiw	a1,a5,-48
  8002ba:	0405                	addi	s0,s0,1
  8002bc:	fd070d1b          	addiw	s10,a4,-48
  8002c0:	0007869b          	sext.w	a3,a5
  8002c4:	feb570e3          	bgeu	a0,a1,8002a4 <vprintfmt+0xd8>
  8002c8:	f60cd0e3          	bgez	s9,800228 <vprintfmt+0x5c>
  8002cc:	8cea                	mv	s9,s10
  8002ce:	5d7d                	li	s10,-1
  8002d0:	bfa1                	j	800228 <vprintfmt+0x5c>
  8002d2:	8db6                	mv	s11,a3
  8002d4:	8462                	mv	s0,s8
  8002d6:	bf89                	j	800228 <vprintfmt+0x5c>
  8002d8:	8462                	mv	s0,s8
  8002da:	4b85                	li	s7,1
  8002dc:	b7b1                	j	800228 <vprintfmt+0x5c>
  8002de:	4785                	li	a5,1
  8002e0:	008a0713          	addi	a4,s4,8
  8002e4:	00c7c463          	blt	a5,a2,8002ec <vprintfmt+0x120>
  8002e8:	1a060163          	beqz	a2,80048a <vprintfmt+0x2be>
  8002ec:	000a3603          	ld	a2,0(s4)
  8002f0:	46c1                	li	a3,16
  8002f2:	8a3a                	mv	s4,a4
  8002f4:	000d879b          	sext.w	a5,s11
  8002f8:	8766                	mv	a4,s9
  8002fa:	85a6                	mv	a1,s1
  8002fc:	854a                	mv	a0,s2
  8002fe:	e61ff0ef          	jal	80015e <printnum>
  800302:	bdfd                	j	800200 <vprintfmt+0x34>
  800304:	000a2503          	lw	a0,0(s4)
  800308:	85a6                	mv	a1,s1
  80030a:	0a21                	addi	s4,s4,8
  80030c:	9902                	jalr	s2
  80030e:	bdcd                	j	800200 <vprintfmt+0x34>
  800310:	4785                	li	a5,1
  800312:	008a0713          	addi	a4,s4,8
  800316:	00c7c463          	blt	a5,a2,80031e <vprintfmt+0x152>
  80031a:	16060363          	beqz	a2,800480 <vprintfmt+0x2b4>
  80031e:	000a3603          	ld	a2,0(s4)
  800322:	46a9                	li	a3,10
  800324:	8a3a                	mv	s4,a4
  800326:	b7f9                	j	8002f4 <vprintfmt+0x128>
  800328:	85a6                	mv	a1,s1
  80032a:	03000513          	li	a0,48
  80032e:	9902                	jalr	s2
  800330:	85a6                	mv	a1,s1
  800332:	07800513          	li	a0,120
  800336:	9902                	jalr	s2
  800338:	000a3603          	ld	a2,0(s4)
  80033c:	46c1                	li	a3,16
  80033e:	0a21                	addi	s4,s4,8
  800340:	bf55                	j	8002f4 <vprintfmt+0x128>
  800342:	85a6                	mv	a1,s1
  800344:	02500513          	li	a0,37
  800348:	9902                	jalr	s2
  80034a:	bd5d                	j	800200 <vprintfmt+0x34>
  80034c:	000a2d03          	lw	s10,0(s4)
  800350:	8462                	mv	s0,s8
  800352:	0a21                	addi	s4,s4,8
  800354:	bf95                	j	8002c8 <vprintfmt+0xfc>
  800356:	4785                	li	a5,1
  800358:	008a0713          	addi	a4,s4,8
  80035c:	00c7c463          	blt	a5,a2,800364 <vprintfmt+0x198>
  800360:	10060b63          	beqz	a2,800476 <vprintfmt+0x2aa>
  800364:	000a3603          	ld	a2,0(s4)
  800368:	46a1                	li	a3,8
  80036a:	8a3a                	mv	s4,a4
  80036c:	b761                	j	8002f4 <vprintfmt+0x128>
  80036e:	fffcc793          	not	a5,s9
  800372:	97fd                	srai	a5,a5,0x3f
  800374:	00fcf7b3          	and	a5,s9,a5
  800378:	00078c9b          	sext.w	s9,a5
  80037c:	8462                	mv	s0,s8
  80037e:	b56d                	j	800228 <vprintfmt+0x5c>
  800380:	000a3403          	ld	s0,0(s4)
  800384:	008a0793          	addi	a5,s4,8
  800388:	e43e                	sd	a5,8(sp)
  80038a:	12040063          	beqz	s0,8004aa <vprintfmt+0x2de>
  80038e:	0d905963          	blez	s9,800460 <vprintfmt+0x294>
  800392:	02d00793          	li	a5,45
  800396:	00140a13          	addi	s4,s0,1
  80039a:	12fd9763          	bne	s11,a5,8004c8 <vprintfmt+0x2fc>
  80039e:	00044783          	lbu	a5,0(s0)
  8003a2:	0007851b          	sext.w	a0,a5
  8003a6:	cb9d                	beqz	a5,8003dc <vprintfmt+0x210>
  8003a8:	547d                	li	s0,-1
  8003aa:	05e00d93          	li	s11,94
  8003ae:	000d4563          	bltz	s10,8003b8 <vprintfmt+0x1ec>
  8003b2:	3d7d                	addiw	s10,s10,-1
  8003b4:	028d0263          	beq	s10,s0,8003d8 <vprintfmt+0x20c>
  8003b8:	85a6                	mv	a1,s1
  8003ba:	0c0b8d63          	beqz	s7,800494 <vprintfmt+0x2c8>
  8003be:	3781                	addiw	a5,a5,-32
  8003c0:	0cfdfa63          	bgeu	s11,a5,800494 <vprintfmt+0x2c8>
  8003c4:	03f00513          	li	a0,63
  8003c8:	9902                	jalr	s2
  8003ca:	000a4783          	lbu	a5,0(s4)
  8003ce:	3cfd                	addiw	s9,s9,-1
  8003d0:	0a05                	addi	s4,s4,1
  8003d2:	0007851b          	sext.w	a0,a5
  8003d6:	ffe1                	bnez	a5,8003ae <vprintfmt+0x1e2>
  8003d8:	01905963          	blez	s9,8003ea <vprintfmt+0x21e>
  8003dc:	85a6                	mv	a1,s1
  8003de:	02000513          	li	a0,32
  8003e2:	3cfd                	addiw	s9,s9,-1
  8003e4:	9902                	jalr	s2
  8003e6:	fe0c9be3          	bnez	s9,8003dc <vprintfmt+0x210>
  8003ea:	6a22                	ld	s4,8(sp)
  8003ec:	bd11                	j	800200 <vprintfmt+0x34>
  8003ee:	4785                	li	a5,1
  8003f0:	008a0b93          	addi	s7,s4,8
  8003f4:	00c7c363          	blt	a5,a2,8003fa <vprintfmt+0x22e>
  8003f8:	ce25                	beqz	a2,800470 <vprintfmt+0x2a4>
  8003fa:	000a3403          	ld	s0,0(s4)
  8003fe:	08044d63          	bltz	s0,800498 <vprintfmt+0x2cc>
  800402:	8622                	mv	a2,s0
  800404:	8a5e                	mv	s4,s7
  800406:	46a9                	li	a3,10
  800408:	b5f5                	j	8002f4 <vprintfmt+0x128>
  80040a:	000a2783          	lw	a5,0(s4)
  80040e:	4661                	li	a2,24
  800410:	41f7d71b          	sraiw	a4,a5,0x1f
  800414:	8fb9                	xor	a5,a5,a4
  800416:	40e786bb          	subw	a3,a5,a4
  80041a:	02d64663          	blt	a2,a3,800446 <vprintfmt+0x27a>
  80041e:	00369713          	slli	a4,a3,0x3
  800422:	00000797          	auipc	a5,0x0
  800426:	5be78793          	addi	a5,a5,1470 # 8009e0 <error_string>
  80042a:	97ba                	add	a5,a5,a4
  80042c:	639c                	ld	a5,0(a5)
  80042e:	cf81                	beqz	a5,800446 <vprintfmt+0x27a>
  800430:	86be                	mv	a3,a5
  800432:	00000617          	auipc	a2,0x0
  800436:	2ce60613          	addi	a2,a2,718 # 800700 <main+0x116>
  80043a:	85a6                	mv	a1,s1
  80043c:	854a                	mv	a0,s2
  80043e:	0e8000ef          	jal	800526 <printfmt>
  800442:	0a21                	addi	s4,s4,8
  800444:	bb75                	j	800200 <vprintfmt+0x34>
  800446:	00000617          	auipc	a2,0x0
  80044a:	2aa60613          	addi	a2,a2,682 # 8006f0 <main+0x106>
  80044e:	85a6                	mv	a1,s1
  800450:	854a                	mv	a0,s2
  800452:	0d4000ef          	jal	800526 <printfmt>
  800456:	0a21                	addi	s4,s4,8
  800458:	b365                	j	800200 <vprintfmt+0x34>
  80045a:	2605                	addiw	a2,a2,1
  80045c:	8462                	mv	s0,s8
  80045e:	b3e9                	j	800228 <vprintfmt+0x5c>
  800460:	00044783          	lbu	a5,0(s0)
  800464:	0007851b          	sext.w	a0,a5
  800468:	d3c9                	beqz	a5,8003ea <vprintfmt+0x21e>
  80046a:	00140a13          	addi	s4,s0,1
  80046e:	bf2d                	j	8003a8 <vprintfmt+0x1dc>
  800470:	000a2403          	lw	s0,0(s4)
  800474:	b769                	j	8003fe <vprintfmt+0x232>
  800476:	000a6603          	lwu	a2,0(s4)
  80047a:	46a1                	li	a3,8
  80047c:	8a3a                	mv	s4,a4
  80047e:	bd9d                	j	8002f4 <vprintfmt+0x128>
  800480:	000a6603          	lwu	a2,0(s4)
  800484:	46a9                	li	a3,10
  800486:	8a3a                	mv	s4,a4
  800488:	b5b5                	j	8002f4 <vprintfmt+0x128>
  80048a:	000a6603          	lwu	a2,0(s4)
  80048e:	46c1                	li	a3,16
  800490:	8a3a                	mv	s4,a4
  800492:	b58d                	j	8002f4 <vprintfmt+0x128>
  800494:	9902                	jalr	s2
  800496:	bf15                	j	8003ca <vprintfmt+0x1fe>
  800498:	85a6                	mv	a1,s1
  80049a:	02d00513          	li	a0,45
  80049e:	9902                	jalr	s2
  8004a0:	40800633          	neg	a2,s0
  8004a4:	8a5e                	mv	s4,s7
  8004a6:	46a9                	li	a3,10
  8004a8:	b5b1                	j	8002f4 <vprintfmt+0x128>
  8004aa:	01905663          	blez	s9,8004b6 <vprintfmt+0x2ea>
  8004ae:	02d00793          	li	a5,45
  8004b2:	04fd9263          	bne	s11,a5,8004f6 <vprintfmt+0x32a>
  8004b6:	02800793          	li	a5,40
  8004ba:	00000a17          	auipc	s4,0x0
  8004be:	22fa0a13          	addi	s4,s4,559 # 8006e9 <main+0xff>
  8004c2:	02800513          	li	a0,40
  8004c6:	b5cd                	j	8003a8 <vprintfmt+0x1dc>
  8004c8:	85ea                	mv	a1,s10
  8004ca:	8522                	mv	a0,s0
  8004cc:	07a000ef          	jal	800546 <strnlen>
  8004d0:	40ac8cbb          	subw	s9,s9,a0
  8004d4:	01905963          	blez	s9,8004e6 <vprintfmt+0x31a>
  8004d8:	2d81                	sext.w	s11,s11
  8004da:	85a6                	mv	a1,s1
  8004dc:	856e                	mv	a0,s11
  8004de:	3cfd                	addiw	s9,s9,-1
  8004e0:	9902                	jalr	s2
  8004e2:	fe0c9ce3          	bnez	s9,8004da <vprintfmt+0x30e>
  8004e6:	00044783          	lbu	a5,0(s0)
  8004ea:	0007851b          	sext.w	a0,a5
  8004ee:	ea079de3          	bnez	a5,8003a8 <vprintfmt+0x1dc>
  8004f2:	6a22                	ld	s4,8(sp)
  8004f4:	b331                	j	800200 <vprintfmt+0x34>
  8004f6:	85ea                	mv	a1,s10
  8004f8:	00000517          	auipc	a0,0x0
  8004fc:	1f050513          	addi	a0,a0,496 # 8006e8 <main+0xfe>
  800500:	046000ef          	jal	800546 <strnlen>
  800504:	40ac8cbb          	subw	s9,s9,a0
  800508:	00000417          	auipc	s0,0x0
  80050c:	1e040413          	addi	s0,s0,480 # 8006e8 <main+0xfe>
  800510:	00000a17          	auipc	s4,0x0
  800514:	1d9a0a13          	addi	s4,s4,473 # 8006e9 <main+0xff>
  800518:	02800793          	li	a5,40
  80051c:	02800513          	li	a0,40
  800520:	fb904ce3          	bgtz	s9,8004d8 <vprintfmt+0x30c>
  800524:	b551                	j	8003a8 <vprintfmt+0x1dc>

0000000000800526 <printfmt>:
  800526:	715d                	addi	sp,sp,-80
  800528:	02810313          	addi	t1,sp,40
  80052c:	f436                	sd	a3,40(sp)
  80052e:	869a                	mv	a3,t1
  800530:	ec06                	sd	ra,24(sp)
  800532:	f83a                	sd	a4,48(sp)
  800534:	fc3e                	sd	a5,56(sp)
  800536:	e0c2                	sd	a6,64(sp)
  800538:	e4c6                	sd	a7,72(sp)
  80053a:	e41a                	sd	t1,8(sp)
  80053c:	c91ff0ef          	jal	8001cc <vprintfmt>
  800540:	60e2                	ld	ra,24(sp)
  800542:	6161                	addi	sp,sp,80
  800544:	8082                	ret

0000000000800546 <strnlen>:
  800546:	4781                	li	a5,0
  800548:	e589                	bnez	a1,800552 <strnlen+0xc>
  80054a:	a811                	j	80055e <strnlen+0x18>
  80054c:	0785                	addi	a5,a5,1
  80054e:	00f58863          	beq	a1,a5,80055e <strnlen+0x18>
  800552:	00f50733          	add	a4,a0,a5
  800556:	00074703          	lbu	a4,0(a4)
  80055a:	fb6d                	bnez	a4,80054c <strnlen+0x6>
  80055c:	85be                	mv	a1,a5
  80055e:	852e                	mv	a0,a1
  800560:	8082                	ret

0000000000800562 <do_yield>:
  800562:	1141                	addi	sp,sp,-16
  800564:	e406                	sd	ra,8(sp)
  800566:	be7ff0ef          	jal	80014c <yield>
  80056a:	be3ff0ef          	jal	80014c <yield>
  80056e:	bdfff0ef          	jal	80014c <yield>
  800572:	bdbff0ef          	jal	80014c <yield>
  800576:	bd7ff0ef          	jal	80014c <yield>
  80057a:	60a2                	ld	ra,8(sp)
  80057c:	0141                	addi	sp,sp,16
  80057e:	b6f9                	j	80014c <yield>

0000000000800580 <loop>:
  800580:	1141                	addi	sp,sp,-16
  800582:	00000517          	auipc	a0,0x0
  800586:	24650513          	addi	a0,a0,582 # 8007c8 <main+0x1de>
  80058a:	e406                	sd	ra,8(sp)
  80058c:	b15ff0ef          	jal	8000a0 <cprintf>
  800590:	a001                	j	800590 <loop+0x10>

0000000000800592 <work>:
  800592:	1141                	addi	sp,sp,-16
  800594:	00000517          	auipc	a0,0x0
  800598:	24450513          	addi	a0,a0,580 # 8007d8 <main+0x1ee>
  80059c:	e406                	sd	ra,8(sp)
  80059e:	b03ff0ef          	jal	8000a0 <cprintf>
  8005a2:	fc1ff0ef          	jal	800562 <do_yield>
  8005a6:	00001517          	auipc	a0,0x1
  8005aa:	a6252503          	lw	a0,-1438(a0) # 801008 <parent>
  8005ae:	ba1ff0ef          	jal	80014e <kill>
  8005b2:	e105                	bnez	a0,8005d2 <work+0x40>
  8005b4:	00000517          	auipc	a0,0x0
  8005b8:	23450513          	addi	a0,a0,564 # 8007e8 <main+0x1fe>
  8005bc:	ae5ff0ef          	jal	8000a0 <cprintf>
  8005c0:	fa3ff0ef          	jal	800562 <do_yield>
  8005c4:	00001517          	auipc	a0,0x1
  8005c8:	a4052503          	lw	a0,-1472(a0) # 801004 <pid1>
  8005cc:	b83ff0ef          	jal	80014e <kill>
  8005d0:	c501                	beqz	a0,8005d8 <work+0x46>
  8005d2:	557d                	li	a0,-1
  8005d4:	b5fff0ef          	jal	800132 <exit>
  8005d8:	00000517          	auipc	a0,0x0
  8005dc:	22850513          	addi	a0,a0,552 # 800800 <main+0x216>
  8005e0:	ac1ff0ef          	jal	8000a0 <cprintf>
  8005e4:	4501                	li	a0,0
  8005e6:	b4dff0ef          	jal	800132 <exit>

00000000008005ea <main>:
  8005ea:	1141                	addi	sp,sp,-16
  8005ec:	e406                	sd	ra,8(sp)
  8005ee:	e022                	sd	s0,0(sp)
  8005f0:	b61ff0ef          	jal	800150 <getpid>
  8005f4:	00001797          	auipc	a5,0x1
  8005f8:	a0a7aa23          	sw	a0,-1516(a5) # 801008 <parent>
  8005fc:	00001417          	auipc	s0,0x1
  800600:	a0840413          	addi	s0,s0,-1528 # 801004 <pid1>
  800604:	b45ff0ef          	jal	800148 <fork>
  800608:	c008                	sw	a0,0(s0)
  80060a:	c13d                	beqz	a0,800670 <main+0x86>
  80060c:	04a05263          	blez	a0,800650 <main+0x66>
  800610:	b39ff0ef          	jal	800148 <fork>
  800614:	00001797          	auipc	a5,0x1
  800618:	9ea7a623          	sw	a0,-1556(a5) # 801000 <pid2>
  80061c:	c93d                	beqz	a0,800692 <main+0xa8>
  80061e:	04a05b63          	blez	a0,800674 <main+0x8a>
  800622:	00000517          	auipc	a0,0x0
  800626:	22e50513          	addi	a0,a0,558 # 800850 <main+0x266>
  80062a:	a77ff0ef          	jal	8000a0 <cprintf>
  80062e:	4008                	lw	a0,0(s0)
  800630:	4581                	li	a1,0
  800632:	b19ff0ef          	jal	80014a <waitpid>
  800636:	4014                	lw	a3,0(s0)
  800638:	00000617          	auipc	a2,0x0
  80063c:	22860613          	addi	a2,a2,552 # 800860 <main+0x276>
  800640:	03400593          	li	a1,52
  800644:	00000517          	auipc	a0,0x0
  800648:	1fc50513          	addi	a0,a0,508 # 800840 <main+0x256>
  80064c:	9dbff0ef          	jal	800026 <__panic>
  800650:	00000697          	auipc	a3,0x0
  800654:	1c868693          	addi	a3,a3,456 # 800818 <main+0x22e>
  800658:	00000617          	auipc	a2,0x0
  80065c:	1d060613          	addi	a2,a2,464 # 800828 <main+0x23e>
  800660:	02c00593          	li	a1,44
  800664:	00000517          	auipc	a0,0x0
  800668:	1dc50513          	addi	a0,a0,476 # 800840 <main+0x256>
  80066c:	9bbff0ef          	jal	800026 <__panic>
  800670:	f11ff0ef          	jal	800580 <loop>
  800674:	4008                	lw	a0,0(s0)
  800676:	ad9ff0ef          	jal	80014e <kill>
  80067a:	00000617          	auipc	a2,0x0
  80067e:	1fe60613          	addi	a2,a2,510 # 800878 <main+0x28e>
  800682:	03900593          	li	a1,57
  800686:	00000517          	auipc	a0,0x0
  80068a:	1ba50513          	addi	a0,a0,442 # 800840 <main+0x256>
  80068e:	999ff0ef          	jal	800026 <__panic>
  800692:	f01ff0ef          	jal	800592 <work>
