
obj/__user_spin.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	12e000ef          	jal	80014e <umain>
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
  800038:	5fc50513          	addi	a0,a0,1532 # 800630 <main+0xd2>
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
  800058:	5fc50513          	addi	a0,a0,1532 # 800650 <main+0xf2>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0ce000ef          	jal	800130 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0bc000ef          	jal	80012a <sys_putc>
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
  800094:	134000ef          	jal	8001c8 <vprintfmt>
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
  8000c8:	100000ef          	jal	8001c8 <vprintfmt>
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

0000000000800124 <sys_kill>:
  800124:	85aa                	mv	a1,a0
  800126:	4531                	li	a0,12
  800128:	b775                	j	8000d4 <syscall>

000000000080012a <sys_putc>:
  80012a:	85aa                	mv	a1,a0
  80012c:	4579                	li	a0,30
  80012e:	b75d                	j	8000d4 <syscall>

0000000000800130 <exit>:
  800130:	1141                	addi	sp,sp,-16
  800132:	e406                	sd	ra,8(sp)
  800134:	fdbff0ef          	jal	80010e <sys_exit>
  800138:	00000517          	auipc	a0,0x0
  80013c:	52050513          	addi	a0,a0,1312 # 800658 <main+0xfa>
  800140:	f61ff0ef          	jal	8000a0 <cprintf>
  800144:	a001                	j	800144 <exit+0x14>

0000000000800146 <fork>:
  800146:	b7f9                	j	800114 <sys_fork>

0000000000800148 <waitpid>:
  800148:	bfc1                	j	800118 <sys_wait>

000000000080014a <yield>:
  80014a:	bfd9                	j	800120 <sys_yield>

000000000080014c <kill>:
  80014c:	bfe1                	j	800124 <sys_kill>

000000000080014e <umain>:
  80014e:	1141                	addi	sp,sp,-16
  800150:	e406                	sd	ra,8(sp)
  800152:	40c000ef          	jal	80055e <main>
  800156:	fdbff0ef          	jal	800130 <exit>

000000000080015a <printnum>:
  80015a:	02069813          	slli	a6,a3,0x20
  80015e:	7179                	addi	sp,sp,-48
  800160:	02085813          	srli	a6,a6,0x20
  800164:	e052                	sd	s4,0(sp)
  800166:	03067a33          	remu	s4,a2,a6
  80016a:	f022                	sd	s0,32(sp)
  80016c:	ec26                	sd	s1,24(sp)
  80016e:	e84a                	sd	s2,16(sp)
  800170:	f406                	sd	ra,40(sp)
  800172:	84aa                	mv	s1,a0
  800174:	892e                	mv	s2,a1
  800176:	fff7041b          	addiw	s0,a4,-1
  80017a:	2a01                	sext.w	s4,s4
  80017c:	05067063          	bgeu	a2,a6,8001bc <printnum+0x62>
  800180:	e44e                	sd	s3,8(sp)
  800182:	89be                	mv	s3,a5
  800184:	4785                	li	a5,1
  800186:	00e7d763          	bge	a5,a4,800194 <printnum+0x3a>
  80018a:	85ca                	mv	a1,s2
  80018c:	854e                	mv	a0,s3
  80018e:	347d                	addiw	s0,s0,-1
  800190:	9482                	jalr	s1
  800192:	fc65                	bnez	s0,80018a <printnum+0x30>
  800194:	69a2                	ld	s3,8(sp)
  800196:	1a02                	slli	s4,s4,0x20
  800198:	020a5a13          	srli	s4,s4,0x20
  80019c:	00000797          	auipc	a5,0x0
  8001a0:	4d478793          	addi	a5,a5,1236 # 800670 <main+0x112>
  8001a4:	97d2                	add	a5,a5,s4
  8001a6:	7402                	ld	s0,32(sp)
  8001a8:	0007c503          	lbu	a0,0(a5)
  8001ac:	70a2                	ld	ra,40(sp)
  8001ae:	6a02                	ld	s4,0(sp)
  8001b0:	85ca                	mv	a1,s2
  8001b2:	87a6                	mv	a5,s1
  8001b4:	6942                	ld	s2,16(sp)
  8001b6:	64e2                	ld	s1,24(sp)
  8001b8:	6145                	addi	sp,sp,48
  8001ba:	8782                	jr	a5
  8001bc:	03065633          	divu	a2,a2,a6
  8001c0:	8722                	mv	a4,s0
  8001c2:	f99ff0ef          	jal	80015a <printnum>
  8001c6:	bfc1                	j	800196 <printnum+0x3c>

00000000008001c8 <vprintfmt>:
  8001c8:	7119                	addi	sp,sp,-128
  8001ca:	f4a6                	sd	s1,104(sp)
  8001cc:	f0ca                	sd	s2,96(sp)
  8001ce:	ecce                	sd	s3,88(sp)
  8001d0:	e8d2                	sd	s4,80(sp)
  8001d2:	e4d6                	sd	s5,72(sp)
  8001d4:	e0da                	sd	s6,64(sp)
  8001d6:	f862                	sd	s8,48(sp)
  8001d8:	fc86                	sd	ra,120(sp)
  8001da:	f8a2                	sd	s0,112(sp)
  8001dc:	fc5e                	sd	s7,56(sp)
  8001de:	f466                	sd	s9,40(sp)
  8001e0:	f06a                	sd	s10,32(sp)
  8001e2:	ec6e                	sd	s11,24(sp)
  8001e4:	892a                	mv	s2,a0
  8001e6:	84ae                	mv	s1,a1
  8001e8:	8c32                	mv	s8,a2
  8001ea:	8a36                	mv	s4,a3
  8001ec:	02500993          	li	s3,37
  8001f0:	05500b13          	li	s6,85
  8001f4:	00000a97          	auipc	s5,0x0
  8001f8:	6aca8a93          	addi	s5,s5,1708 # 8008a0 <main+0x342>
  8001fc:	000c4503          	lbu	a0,0(s8)
  800200:	001c0413          	addi	s0,s8,1
  800204:	01350a63          	beq	a0,s3,800218 <vprintfmt+0x50>
  800208:	cd0d                	beqz	a0,800242 <vprintfmt+0x7a>
  80020a:	85a6                	mv	a1,s1
  80020c:	9902                	jalr	s2
  80020e:	00044503          	lbu	a0,0(s0)
  800212:	0405                	addi	s0,s0,1
  800214:	ff351ae3          	bne	a0,s3,800208 <vprintfmt+0x40>
  800218:	02000d93          	li	s11,32
  80021c:	4b81                	li	s7,0
  80021e:	4601                	li	a2,0
  800220:	5d7d                	li	s10,-1
  800222:	5cfd                	li	s9,-1
  800224:	00044683          	lbu	a3,0(s0)
  800228:	00140c13          	addi	s8,s0,1
  80022c:	fdd6859b          	addiw	a1,a3,-35
  800230:	0ff5f593          	zext.b	a1,a1
  800234:	02bb6663          	bltu	s6,a1,800260 <vprintfmt+0x98>
  800238:	058a                	slli	a1,a1,0x2
  80023a:	95d6                	add	a1,a1,s5
  80023c:	4198                	lw	a4,0(a1)
  80023e:	9756                	add	a4,a4,s5
  800240:	8702                	jr	a4
  800242:	70e6                	ld	ra,120(sp)
  800244:	7446                	ld	s0,112(sp)
  800246:	74a6                	ld	s1,104(sp)
  800248:	7906                	ld	s2,96(sp)
  80024a:	69e6                	ld	s3,88(sp)
  80024c:	6a46                	ld	s4,80(sp)
  80024e:	6aa6                	ld	s5,72(sp)
  800250:	6b06                	ld	s6,64(sp)
  800252:	7be2                	ld	s7,56(sp)
  800254:	7c42                	ld	s8,48(sp)
  800256:	7ca2                	ld	s9,40(sp)
  800258:	7d02                	ld	s10,32(sp)
  80025a:	6de2                	ld	s11,24(sp)
  80025c:	6109                	addi	sp,sp,128
  80025e:	8082                	ret
  800260:	85a6                	mv	a1,s1
  800262:	02500513          	li	a0,37
  800266:	9902                	jalr	s2
  800268:	fff44703          	lbu	a4,-1(s0)
  80026c:	02500793          	li	a5,37
  800270:	8c22                	mv	s8,s0
  800272:	f8f705e3          	beq	a4,a5,8001fc <vprintfmt+0x34>
  800276:	02500713          	li	a4,37
  80027a:	ffec4783          	lbu	a5,-2(s8)
  80027e:	1c7d                	addi	s8,s8,-1
  800280:	fee79de3          	bne	a5,a4,80027a <vprintfmt+0xb2>
  800284:	bfa5                	j	8001fc <vprintfmt+0x34>
  800286:	00144783          	lbu	a5,1(s0)
  80028a:	4725                	li	a4,9
  80028c:	fd068d1b          	addiw	s10,a3,-48
  800290:	fd07859b          	addiw	a1,a5,-48
  800294:	0007869b          	sext.w	a3,a5
  800298:	8462                	mv	s0,s8
  80029a:	02b76563          	bltu	a4,a1,8002c4 <vprintfmt+0xfc>
  80029e:	4525                	li	a0,9
  8002a0:	00144783          	lbu	a5,1(s0)
  8002a4:	002d171b          	slliw	a4,s10,0x2
  8002a8:	01a7073b          	addw	a4,a4,s10
  8002ac:	0017171b          	slliw	a4,a4,0x1
  8002b0:	9f35                	addw	a4,a4,a3
  8002b2:	fd07859b          	addiw	a1,a5,-48
  8002b6:	0405                	addi	s0,s0,1
  8002b8:	fd070d1b          	addiw	s10,a4,-48
  8002bc:	0007869b          	sext.w	a3,a5
  8002c0:	feb570e3          	bgeu	a0,a1,8002a0 <vprintfmt+0xd8>
  8002c4:	f60cd0e3          	bgez	s9,800224 <vprintfmt+0x5c>
  8002c8:	8cea                	mv	s9,s10
  8002ca:	5d7d                	li	s10,-1
  8002cc:	bfa1                	j	800224 <vprintfmt+0x5c>
  8002ce:	8db6                	mv	s11,a3
  8002d0:	8462                	mv	s0,s8
  8002d2:	bf89                	j	800224 <vprintfmt+0x5c>
  8002d4:	8462                	mv	s0,s8
  8002d6:	4b85                	li	s7,1
  8002d8:	b7b1                	j	800224 <vprintfmt+0x5c>
  8002da:	4785                	li	a5,1
  8002dc:	008a0713          	addi	a4,s4,8
  8002e0:	00c7c463          	blt	a5,a2,8002e8 <vprintfmt+0x120>
  8002e4:	1a060163          	beqz	a2,800486 <vprintfmt+0x2be>
  8002e8:	000a3603          	ld	a2,0(s4)
  8002ec:	46c1                	li	a3,16
  8002ee:	8a3a                	mv	s4,a4
  8002f0:	000d879b          	sext.w	a5,s11
  8002f4:	8766                	mv	a4,s9
  8002f6:	85a6                	mv	a1,s1
  8002f8:	854a                	mv	a0,s2
  8002fa:	e61ff0ef          	jal	80015a <printnum>
  8002fe:	bdfd                	j	8001fc <vprintfmt+0x34>
  800300:	000a2503          	lw	a0,0(s4)
  800304:	85a6                	mv	a1,s1
  800306:	0a21                	addi	s4,s4,8
  800308:	9902                	jalr	s2
  80030a:	bdcd                	j	8001fc <vprintfmt+0x34>
  80030c:	4785                	li	a5,1
  80030e:	008a0713          	addi	a4,s4,8
  800312:	00c7c463          	blt	a5,a2,80031a <vprintfmt+0x152>
  800316:	16060363          	beqz	a2,80047c <vprintfmt+0x2b4>
  80031a:	000a3603          	ld	a2,0(s4)
  80031e:	46a9                	li	a3,10
  800320:	8a3a                	mv	s4,a4
  800322:	b7f9                	j	8002f0 <vprintfmt+0x128>
  800324:	85a6                	mv	a1,s1
  800326:	03000513          	li	a0,48
  80032a:	9902                	jalr	s2
  80032c:	85a6                	mv	a1,s1
  80032e:	07800513          	li	a0,120
  800332:	9902                	jalr	s2
  800334:	000a3603          	ld	a2,0(s4)
  800338:	46c1                	li	a3,16
  80033a:	0a21                	addi	s4,s4,8
  80033c:	bf55                	j	8002f0 <vprintfmt+0x128>
  80033e:	85a6                	mv	a1,s1
  800340:	02500513          	li	a0,37
  800344:	9902                	jalr	s2
  800346:	bd5d                	j	8001fc <vprintfmt+0x34>
  800348:	000a2d03          	lw	s10,0(s4)
  80034c:	8462                	mv	s0,s8
  80034e:	0a21                	addi	s4,s4,8
  800350:	bf95                	j	8002c4 <vprintfmt+0xfc>
  800352:	4785                	li	a5,1
  800354:	008a0713          	addi	a4,s4,8
  800358:	00c7c463          	blt	a5,a2,800360 <vprintfmt+0x198>
  80035c:	10060b63          	beqz	a2,800472 <vprintfmt+0x2aa>
  800360:	000a3603          	ld	a2,0(s4)
  800364:	46a1                	li	a3,8
  800366:	8a3a                	mv	s4,a4
  800368:	b761                	j	8002f0 <vprintfmt+0x128>
  80036a:	fffcc793          	not	a5,s9
  80036e:	97fd                	srai	a5,a5,0x3f
  800370:	00fcf7b3          	and	a5,s9,a5
  800374:	00078c9b          	sext.w	s9,a5
  800378:	8462                	mv	s0,s8
  80037a:	b56d                	j	800224 <vprintfmt+0x5c>
  80037c:	000a3403          	ld	s0,0(s4)
  800380:	008a0793          	addi	a5,s4,8
  800384:	e43e                	sd	a5,8(sp)
  800386:	12040063          	beqz	s0,8004a6 <vprintfmt+0x2de>
  80038a:	0d905963          	blez	s9,80045c <vprintfmt+0x294>
  80038e:	02d00793          	li	a5,45
  800392:	00140a13          	addi	s4,s0,1
  800396:	12fd9763          	bne	s11,a5,8004c4 <vprintfmt+0x2fc>
  80039a:	00044783          	lbu	a5,0(s0)
  80039e:	0007851b          	sext.w	a0,a5
  8003a2:	cb9d                	beqz	a5,8003d8 <vprintfmt+0x210>
  8003a4:	547d                	li	s0,-1
  8003a6:	05e00d93          	li	s11,94
  8003aa:	000d4563          	bltz	s10,8003b4 <vprintfmt+0x1ec>
  8003ae:	3d7d                	addiw	s10,s10,-1
  8003b0:	028d0263          	beq	s10,s0,8003d4 <vprintfmt+0x20c>
  8003b4:	85a6                	mv	a1,s1
  8003b6:	0c0b8d63          	beqz	s7,800490 <vprintfmt+0x2c8>
  8003ba:	3781                	addiw	a5,a5,-32
  8003bc:	0cfdfa63          	bgeu	s11,a5,800490 <vprintfmt+0x2c8>
  8003c0:	03f00513          	li	a0,63
  8003c4:	9902                	jalr	s2
  8003c6:	000a4783          	lbu	a5,0(s4)
  8003ca:	3cfd                	addiw	s9,s9,-1
  8003cc:	0a05                	addi	s4,s4,1
  8003ce:	0007851b          	sext.w	a0,a5
  8003d2:	ffe1                	bnez	a5,8003aa <vprintfmt+0x1e2>
  8003d4:	01905963          	blez	s9,8003e6 <vprintfmt+0x21e>
  8003d8:	85a6                	mv	a1,s1
  8003da:	02000513          	li	a0,32
  8003de:	3cfd                	addiw	s9,s9,-1
  8003e0:	9902                	jalr	s2
  8003e2:	fe0c9be3          	bnez	s9,8003d8 <vprintfmt+0x210>
  8003e6:	6a22                	ld	s4,8(sp)
  8003e8:	bd11                	j	8001fc <vprintfmt+0x34>
  8003ea:	4785                	li	a5,1
  8003ec:	008a0b93          	addi	s7,s4,8
  8003f0:	00c7c363          	blt	a5,a2,8003f6 <vprintfmt+0x22e>
  8003f4:	ce25                	beqz	a2,80046c <vprintfmt+0x2a4>
  8003f6:	000a3403          	ld	s0,0(s4)
  8003fa:	08044d63          	bltz	s0,800494 <vprintfmt+0x2cc>
  8003fe:	8622                	mv	a2,s0
  800400:	8a5e                	mv	s4,s7
  800402:	46a9                	li	a3,10
  800404:	b5f5                	j	8002f0 <vprintfmt+0x128>
  800406:	000a2783          	lw	a5,0(s4)
  80040a:	4661                	li	a2,24
  80040c:	41f7d71b          	sraiw	a4,a5,0x1f
  800410:	8fb9                	xor	a5,a5,a4
  800412:	40e786bb          	subw	a3,a5,a4
  800416:	02d64663          	blt	a2,a3,800442 <vprintfmt+0x27a>
  80041a:	00369713          	slli	a4,a3,0x3
  80041e:	00000797          	auipc	a5,0x0
  800422:	5da78793          	addi	a5,a5,1498 # 8009f8 <error_string>
  800426:	97ba                	add	a5,a5,a4
  800428:	639c                	ld	a5,0(a5)
  80042a:	cf81                	beqz	a5,800442 <vprintfmt+0x27a>
  80042c:	86be                	mv	a3,a5
  80042e:	00000617          	auipc	a2,0x0
  800432:	27260613          	addi	a2,a2,626 # 8006a0 <main+0x142>
  800436:	85a6                	mv	a1,s1
  800438:	854a                	mv	a0,s2
  80043a:	0e8000ef          	jal	800522 <printfmt>
  80043e:	0a21                	addi	s4,s4,8
  800440:	bb75                	j	8001fc <vprintfmt+0x34>
  800442:	00000617          	auipc	a2,0x0
  800446:	24e60613          	addi	a2,a2,590 # 800690 <main+0x132>
  80044a:	85a6                	mv	a1,s1
  80044c:	854a                	mv	a0,s2
  80044e:	0d4000ef          	jal	800522 <printfmt>
  800452:	0a21                	addi	s4,s4,8
  800454:	b365                	j	8001fc <vprintfmt+0x34>
  800456:	2605                	addiw	a2,a2,1
  800458:	8462                	mv	s0,s8
  80045a:	b3e9                	j	800224 <vprintfmt+0x5c>
  80045c:	00044783          	lbu	a5,0(s0)
  800460:	0007851b          	sext.w	a0,a5
  800464:	d3c9                	beqz	a5,8003e6 <vprintfmt+0x21e>
  800466:	00140a13          	addi	s4,s0,1
  80046a:	bf2d                	j	8003a4 <vprintfmt+0x1dc>
  80046c:	000a2403          	lw	s0,0(s4)
  800470:	b769                	j	8003fa <vprintfmt+0x232>
  800472:	000a6603          	lwu	a2,0(s4)
  800476:	46a1                	li	a3,8
  800478:	8a3a                	mv	s4,a4
  80047a:	bd9d                	j	8002f0 <vprintfmt+0x128>
  80047c:	000a6603          	lwu	a2,0(s4)
  800480:	46a9                	li	a3,10
  800482:	8a3a                	mv	s4,a4
  800484:	b5b5                	j	8002f0 <vprintfmt+0x128>
  800486:	000a6603          	lwu	a2,0(s4)
  80048a:	46c1                	li	a3,16
  80048c:	8a3a                	mv	s4,a4
  80048e:	b58d                	j	8002f0 <vprintfmt+0x128>
  800490:	9902                	jalr	s2
  800492:	bf15                	j	8003c6 <vprintfmt+0x1fe>
  800494:	85a6                	mv	a1,s1
  800496:	02d00513          	li	a0,45
  80049a:	9902                	jalr	s2
  80049c:	40800633          	neg	a2,s0
  8004a0:	8a5e                	mv	s4,s7
  8004a2:	46a9                	li	a3,10
  8004a4:	b5b1                	j	8002f0 <vprintfmt+0x128>
  8004a6:	01905663          	blez	s9,8004b2 <vprintfmt+0x2ea>
  8004aa:	02d00793          	li	a5,45
  8004ae:	04fd9263          	bne	s11,a5,8004f2 <vprintfmt+0x32a>
  8004b2:	02800793          	li	a5,40
  8004b6:	00000a17          	auipc	s4,0x0
  8004ba:	1d3a0a13          	addi	s4,s4,467 # 800689 <main+0x12b>
  8004be:	02800513          	li	a0,40
  8004c2:	b5cd                	j	8003a4 <vprintfmt+0x1dc>
  8004c4:	85ea                	mv	a1,s10
  8004c6:	8522                	mv	a0,s0
  8004c8:	07a000ef          	jal	800542 <strnlen>
  8004cc:	40ac8cbb          	subw	s9,s9,a0
  8004d0:	01905963          	blez	s9,8004e2 <vprintfmt+0x31a>
  8004d4:	2d81                	sext.w	s11,s11
  8004d6:	85a6                	mv	a1,s1
  8004d8:	856e                	mv	a0,s11
  8004da:	3cfd                	addiw	s9,s9,-1
  8004dc:	9902                	jalr	s2
  8004de:	fe0c9ce3          	bnez	s9,8004d6 <vprintfmt+0x30e>
  8004e2:	00044783          	lbu	a5,0(s0)
  8004e6:	0007851b          	sext.w	a0,a5
  8004ea:	ea079de3          	bnez	a5,8003a4 <vprintfmt+0x1dc>
  8004ee:	6a22                	ld	s4,8(sp)
  8004f0:	b331                	j	8001fc <vprintfmt+0x34>
  8004f2:	85ea                	mv	a1,s10
  8004f4:	00000517          	auipc	a0,0x0
  8004f8:	19450513          	addi	a0,a0,404 # 800688 <main+0x12a>
  8004fc:	046000ef          	jal	800542 <strnlen>
  800500:	40ac8cbb          	subw	s9,s9,a0
  800504:	00000417          	auipc	s0,0x0
  800508:	18440413          	addi	s0,s0,388 # 800688 <main+0x12a>
  80050c:	00000a17          	auipc	s4,0x0
  800510:	17da0a13          	addi	s4,s4,381 # 800689 <main+0x12b>
  800514:	02800793          	li	a5,40
  800518:	02800513          	li	a0,40
  80051c:	fb904ce3          	bgtz	s9,8004d4 <vprintfmt+0x30c>
  800520:	b551                	j	8003a4 <vprintfmt+0x1dc>

0000000000800522 <printfmt>:
  800522:	715d                	addi	sp,sp,-80
  800524:	02810313          	addi	t1,sp,40
  800528:	f436                	sd	a3,40(sp)
  80052a:	869a                	mv	a3,t1
  80052c:	ec06                	sd	ra,24(sp)
  80052e:	f83a                	sd	a4,48(sp)
  800530:	fc3e                	sd	a5,56(sp)
  800532:	e0c2                	sd	a6,64(sp)
  800534:	e4c6                	sd	a7,72(sp)
  800536:	e41a                	sd	t1,8(sp)
  800538:	c91ff0ef          	jal	8001c8 <vprintfmt>
  80053c:	60e2                	ld	ra,24(sp)
  80053e:	6161                	addi	sp,sp,80
  800540:	8082                	ret

0000000000800542 <strnlen>:
  800542:	4781                	li	a5,0
  800544:	e589                	bnez	a1,80054e <strnlen+0xc>
  800546:	a811                	j	80055a <strnlen+0x18>
  800548:	0785                	addi	a5,a5,1
  80054a:	00f58863          	beq	a1,a5,80055a <strnlen+0x18>
  80054e:	00f50733          	add	a4,a0,a5
  800552:	00074703          	lbu	a4,0(a4)
  800556:	fb6d                	bnez	a4,800548 <strnlen+0x6>
  800558:	85be                	mv	a1,a5
  80055a:	852e                	mv	a0,a1
  80055c:	8082                	ret

000000000080055e <main>:
  80055e:	1141                	addi	sp,sp,-16
  800560:	00000517          	auipc	a0,0x0
  800564:	20850513          	addi	a0,a0,520 # 800768 <main+0x20a>
  800568:	e406                	sd	ra,8(sp)
  80056a:	e022                	sd	s0,0(sp)
  80056c:	b35ff0ef          	jal	8000a0 <cprintf>
  800570:	bd7ff0ef          	jal	800146 <fork>
  800574:	e901                	bnez	a0,800584 <main+0x26>
  800576:	00000517          	auipc	a0,0x0
  80057a:	21a50513          	addi	a0,a0,538 # 800790 <main+0x232>
  80057e:	b23ff0ef          	jal	8000a0 <cprintf>
  800582:	a001                	j	800582 <main+0x24>
  800584:	842a                	mv	s0,a0
  800586:	00000517          	auipc	a0,0x0
  80058a:	22a50513          	addi	a0,a0,554 # 8007b0 <main+0x252>
  80058e:	b13ff0ef          	jal	8000a0 <cprintf>
  800592:	bb9ff0ef          	jal	80014a <yield>
  800596:	bb5ff0ef          	jal	80014a <yield>
  80059a:	bb1ff0ef          	jal	80014a <yield>
  80059e:	00000517          	auipc	a0,0x0
  8005a2:	23a50513          	addi	a0,a0,570 # 8007d8 <main+0x27a>
  8005a6:	afbff0ef          	jal	8000a0 <cprintf>
  8005aa:	8522                	mv	a0,s0
  8005ac:	ba1ff0ef          	jal	80014c <kill>
  8005b0:	ed31                	bnez	a0,80060c <main+0xae>
  8005b2:	4581                	li	a1,0
  8005b4:	00000517          	auipc	a0,0x0
  8005b8:	28c50513          	addi	a0,a0,652 # 800840 <main+0x2e2>
  8005bc:	ae5ff0ef          	jal	8000a0 <cprintf>
  8005c0:	4581                	li	a1,0
  8005c2:	8522                	mv	a0,s0
  8005c4:	b85ff0ef          	jal	800148 <waitpid>
  8005c8:	e11d                	bnez	a0,8005ee <main+0x90>
  8005ca:	4581                	li	a1,0
  8005cc:	00000517          	auipc	a0,0x0
  8005d0:	2ac50513          	addi	a0,a0,684 # 800878 <main+0x31a>
  8005d4:	acdff0ef          	jal	8000a0 <cprintf>
  8005d8:	00000517          	auipc	a0,0x0
  8005dc:	2b850513          	addi	a0,a0,696 # 800890 <main+0x332>
  8005e0:	ac1ff0ef          	jal	8000a0 <cprintf>
  8005e4:	60a2                	ld	ra,8(sp)
  8005e6:	6402                	ld	s0,0(sp)
  8005e8:	4501                	li	a0,0
  8005ea:	0141                	addi	sp,sp,16
  8005ec:	8082                	ret
  8005ee:	00000697          	auipc	a3,0x0
  8005f2:	26a68693          	addi	a3,a3,618 # 800858 <main+0x2fa>
  8005f6:	00000617          	auipc	a2,0x0
  8005fa:	22260613          	addi	a2,a2,546 # 800818 <main+0x2ba>
  8005fe:	45dd                	li	a1,23
  800600:	00000517          	auipc	a0,0x0
  800604:	23050513          	addi	a0,a0,560 # 800830 <main+0x2d2>
  800608:	a1fff0ef          	jal	800026 <__panic>
  80060c:	00000697          	auipc	a3,0x0
  800610:	1f468693          	addi	a3,a3,500 # 800800 <main+0x2a2>
  800614:	00000617          	auipc	a2,0x0
  800618:	20460613          	addi	a2,a2,516 # 800818 <main+0x2ba>
  80061c:	45d1                	li	a1,20
  80061e:	00000517          	auipc	a0,0x0
  800622:	21250513          	addi	a0,a0,530 # 800830 <main+0x2d2>
  800626:	a01ff0ef          	jal	800026 <__panic>
