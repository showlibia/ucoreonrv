
obj/__user_matrix.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	136000ef          	jal	800156 <umain>
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
  800038:	77450513          	addi	a0,a0,1908 # 8007a8 <main+0xca>
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
  800058:	77450513          	addi	a0,a0,1908 # 8007c8 <main+0xea>
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
  800094:	13c000ef          	jal	8001d0 <vprintfmt>
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
  8000c8:	108000ef          	jal	8001d0 <vprintfmt>
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
  80013e:	69650513          	addi	a0,a0,1686 # 8007d0 <main+0xf2>
  800142:	f5fff0ef          	jal	8000a0 <cprintf>
  800146:	a001                	j	800146 <exit+0x14>

0000000000800148 <fork>:
  800148:	b7e9                	j	800112 <sys_fork>

000000000080014a <wait>:
  80014a:	4581                	li	a1,0
  80014c:	4501                	li	a0,0
  80014e:	b7e1                	j	800116 <sys_wait>

0000000000800150 <yield>:
  800150:	b7f9                	j	80011e <sys_yield>

0000000000800152 <kill>:
  800152:	bfc1                	j	800122 <sys_kill>

0000000000800154 <getpid>:
  800154:	bfd1                	j	800128 <sys_getpid>

0000000000800156 <umain>:
  800156:	1141                	addi	sp,sp,-16
  800158:	e406                	sd	ra,8(sp)
  80015a:	584000ef          	jal	8006de <main>
  80015e:	fd5ff0ef          	jal	800132 <exit>

0000000000800162 <printnum>:
  800162:	02069813          	slli	a6,a3,0x20
  800166:	7179                	addi	sp,sp,-48
  800168:	02085813          	srli	a6,a6,0x20
  80016c:	e052                	sd	s4,0(sp)
  80016e:	03067a33          	remu	s4,a2,a6
  800172:	f022                	sd	s0,32(sp)
  800174:	ec26                	sd	s1,24(sp)
  800176:	e84a                	sd	s2,16(sp)
  800178:	f406                	sd	ra,40(sp)
  80017a:	84aa                	mv	s1,a0
  80017c:	892e                	mv	s2,a1
  80017e:	fff7041b          	addiw	s0,a4,-1
  800182:	2a01                	sext.w	s4,s4
  800184:	05067063          	bgeu	a2,a6,8001c4 <printnum+0x62>
  800188:	e44e                	sd	s3,8(sp)
  80018a:	89be                	mv	s3,a5
  80018c:	4785                	li	a5,1
  80018e:	00e7d763          	bge	a5,a4,80019c <printnum+0x3a>
  800192:	85ca                	mv	a1,s2
  800194:	854e                	mv	a0,s3
  800196:	347d                	addiw	s0,s0,-1
  800198:	9482                	jalr	s1
  80019a:	fc65                	bnez	s0,800192 <printnum+0x30>
  80019c:	69a2                	ld	s3,8(sp)
  80019e:	1a02                	slli	s4,s4,0x20
  8001a0:	020a5a13          	srli	s4,s4,0x20
  8001a4:	00000797          	auipc	a5,0x0
  8001a8:	64478793          	addi	a5,a5,1604 # 8007e8 <main+0x10a>
  8001ac:	97d2                	add	a5,a5,s4
  8001ae:	7402                	ld	s0,32(sp)
  8001b0:	0007c503          	lbu	a0,0(a5)
  8001b4:	70a2                	ld	ra,40(sp)
  8001b6:	6a02                	ld	s4,0(sp)
  8001b8:	85ca                	mv	a1,s2
  8001ba:	87a6                	mv	a5,s1
  8001bc:	6942                	ld	s2,16(sp)
  8001be:	64e2                	ld	s1,24(sp)
  8001c0:	6145                	addi	sp,sp,48
  8001c2:	8782                	jr	a5
  8001c4:	03065633          	divu	a2,a2,a6
  8001c8:	8722                	mv	a4,s0
  8001ca:	f99ff0ef          	jal	800162 <printnum>
  8001ce:	bfc1                	j	80019e <printnum+0x3c>

00000000008001d0 <vprintfmt>:
  8001d0:	7119                	addi	sp,sp,-128
  8001d2:	f4a6                	sd	s1,104(sp)
  8001d4:	f0ca                	sd	s2,96(sp)
  8001d6:	ecce                	sd	s3,88(sp)
  8001d8:	e8d2                	sd	s4,80(sp)
  8001da:	e4d6                	sd	s5,72(sp)
  8001dc:	e0da                	sd	s6,64(sp)
  8001de:	f862                	sd	s8,48(sp)
  8001e0:	fc86                	sd	ra,120(sp)
  8001e2:	f8a2                	sd	s0,112(sp)
  8001e4:	fc5e                	sd	s7,56(sp)
  8001e6:	f466                	sd	s9,40(sp)
  8001e8:	f06a                	sd	s10,32(sp)
  8001ea:	ec6e                	sd	s11,24(sp)
  8001ec:	892a                	mv	s2,a0
  8001ee:	84ae                	mv	s1,a1
  8001f0:	8c32                	mv	s8,a2
  8001f2:	8a36                	mv	s4,a3
  8001f4:	02500993          	li	s3,37
  8001f8:	05500b13          	li	s6,85
  8001fc:	00000a97          	auipc	s5,0x0
  800200:	764a8a93          	addi	s5,s5,1892 # 800960 <main+0x282>
  800204:	000c4503          	lbu	a0,0(s8)
  800208:	001c0413          	addi	s0,s8,1
  80020c:	01350a63          	beq	a0,s3,800220 <vprintfmt+0x50>
  800210:	cd0d                	beqz	a0,80024a <vprintfmt+0x7a>
  800212:	85a6                	mv	a1,s1
  800214:	9902                	jalr	s2
  800216:	00044503          	lbu	a0,0(s0)
  80021a:	0405                	addi	s0,s0,1
  80021c:	ff351ae3          	bne	a0,s3,800210 <vprintfmt+0x40>
  800220:	02000d93          	li	s11,32
  800224:	4b81                	li	s7,0
  800226:	4601                	li	a2,0
  800228:	5d7d                	li	s10,-1
  80022a:	5cfd                	li	s9,-1
  80022c:	00044683          	lbu	a3,0(s0)
  800230:	00140c13          	addi	s8,s0,1
  800234:	fdd6859b          	addiw	a1,a3,-35
  800238:	0ff5f593          	zext.b	a1,a1
  80023c:	02bb6663          	bltu	s6,a1,800268 <vprintfmt+0x98>
  800240:	058a                	slli	a1,a1,0x2
  800242:	95d6                	add	a1,a1,s5
  800244:	4198                	lw	a4,0(a1)
  800246:	9756                	add	a4,a4,s5
  800248:	8702                	jr	a4
  80024a:	70e6                	ld	ra,120(sp)
  80024c:	7446                	ld	s0,112(sp)
  80024e:	74a6                	ld	s1,104(sp)
  800250:	7906                	ld	s2,96(sp)
  800252:	69e6                	ld	s3,88(sp)
  800254:	6a46                	ld	s4,80(sp)
  800256:	6aa6                	ld	s5,72(sp)
  800258:	6b06                	ld	s6,64(sp)
  80025a:	7be2                	ld	s7,56(sp)
  80025c:	7c42                	ld	s8,48(sp)
  80025e:	7ca2                	ld	s9,40(sp)
  800260:	7d02                	ld	s10,32(sp)
  800262:	6de2                	ld	s11,24(sp)
  800264:	6109                	addi	sp,sp,128
  800266:	8082                	ret
  800268:	85a6                	mv	a1,s1
  80026a:	02500513          	li	a0,37
  80026e:	9902                	jalr	s2
  800270:	fff44703          	lbu	a4,-1(s0)
  800274:	02500793          	li	a5,37
  800278:	8c22                	mv	s8,s0
  80027a:	f8f705e3          	beq	a4,a5,800204 <vprintfmt+0x34>
  80027e:	02500713          	li	a4,37
  800282:	ffec4783          	lbu	a5,-2(s8)
  800286:	1c7d                	addi	s8,s8,-1
  800288:	fee79de3          	bne	a5,a4,800282 <vprintfmt+0xb2>
  80028c:	bfa5                	j	800204 <vprintfmt+0x34>
  80028e:	00144783          	lbu	a5,1(s0)
  800292:	4725                	li	a4,9
  800294:	fd068d1b          	addiw	s10,a3,-48
  800298:	fd07859b          	addiw	a1,a5,-48
  80029c:	0007869b          	sext.w	a3,a5
  8002a0:	8462                	mv	s0,s8
  8002a2:	02b76563          	bltu	a4,a1,8002cc <vprintfmt+0xfc>
  8002a6:	4525                	li	a0,9
  8002a8:	00144783          	lbu	a5,1(s0)
  8002ac:	002d171b          	slliw	a4,s10,0x2
  8002b0:	01a7073b          	addw	a4,a4,s10
  8002b4:	0017171b          	slliw	a4,a4,0x1
  8002b8:	9f35                	addw	a4,a4,a3
  8002ba:	fd07859b          	addiw	a1,a5,-48
  8002be:	0405                	addi	s0,s0,1
  8002c0:	fd070d1b          	addiw	s10,a4,-48
  8002c4:	0007869b          	sext.w	a3,a5
  8002c8:	feb570e3          	bgeu	a0,a1,8002a8 <vprintfmt+0xd8>
  8002cc:	f60cd0e3          	bgez	s9,80022c <vprintfmt+0x5c>
  8002d0:	8cea                	mv	s9,s10
  8002d2:	5d7d                	li	s10,-1
  8002d4:	bfa1                	j	80022c <vprintfmt+0x5c>
  8002d6:	8db6                	mv	s11,a3
  8002d8:	8462                	mv	s0,s8
  8002da:	bf89                	j	80022c <vprintfmt+0x5c>
  8002dc:	8462                	mv	s0,s8
  8002de:	4b85                	li	s7,1
  8002e0:	b7b1                	j	80022c <vprintfmt+0x5c>
  8002e2:	4785                	li	a5,1
  8002e4:	008a0713          	addi	a4,s4,8
  8002e8:	00c7c463          	blt	a5,a2,8002f0 <vprintfmt+0x120>
  8002ec:	1a060163          	beqz	a2,80048e <vprintfmt+0x2be>
  8002f0:	000a3603          	ld	a2,0(s4)
  8002f4:	46c1                	li	a3,16
  8002f6:	8a3a                	mv	s4,a4
  8002f8:	000d879b          	sext.w	a5,s11
  8002fc:	8766                	mv	a4,s9
  8002fe:	85a6                	mv	a1,s1
  800300:	854a                	mv	a0,s2
  800302:	e61ff0ef          	jal	800162 <printnum>
  800306:	bdfd                	j	800204 <vprintfmt+0x34>
  800308:	000a2503          	lw	a0,0(s4)
  80030c:	85a6                	mv	a1,s1
  80030e:	0a21                	addi	s4,s4,8
  800310:	9902                	jalr	s2
  800312:	bdcd                	j	800204 <vprintfmt+0x34>
  800314:	4785                	li	a5,1
  800316:	008a0713          	addi	a4,s4,8
  80031a:	00c7c463          	blt	a5,a2,800322 <vprintfmt+0x152>
  80031e:	16060363          	beqz	a2,800484 <vprintfmt+0x2b4>
  800322:	000a3603          	ld	a2,0(s4)
  800326:	46a9                	li	a3,10
  800328:	8a3a                	mv	s4,a4
  80032a:	b7f9                	j	8002f8 <vprintfmt+0x128>
  80032c:	85a6                	mv	a1,s1
  80032e:	03000513          	li	a0,48
  800332:	9902                	jalr	s2
  800334:	85a6                	mv	a1,s1
  800336:	07800513          	li	a0,120
  80033a:	9902                	jalr	s2
  80033c:	000a3603          	ld	a2,0(s4)
  800340:	46c1                	li	a3,16
  800342:	0a21                	addi	s4,s4,8
  800344:	bf55                	j	8002f8 <vprintfmt+0x128>
  800346:	85a6                	mv	a1,s1
  800348:	02500513          	li	a0,37
  80034c:	9902                	jalr	s2
  80034e:	bd5d                	j	800204 <vprintfmt+0x34>
  800350:	000a2d03          	lw	s10,0(s4)
  800354:	8462                	mv	s0,s8
  800356:	0a21                	addi	s4,s4,8
  800358:	bf95                	j	8002cc <vprintfmt+0xfc>
  80035a:	4785                	li	a5,1
  80035c:	008a0713          	addi	a4,s4,8
  800360:	00c7c463          	blt	a5,a2,800368 <vprintfmt+0x198>
  800364:	10060b63          	beqz	a2,80047a <vprintfmt+0x2aa>
  800368:	000a3603          	ld	a2,0(s4)
  80036c:	46a1                	li	a3,8
  80036e:	8a3a                	mv	s4,a4
  800370:	b761                	j	8002f8 <vprintfmt+0x128>
  800372:	fffcc793          	not	a5,s9
  800376:	97fd                	srai	a5,a5,0x3f
  800378:	00fcf7b3          	and	a5,s9,a5
  80037c:	00078c9b          	sext.w	s9,a5
  800380:	8462                	mv	s0,s8
  800382:	b56d                	j	80022c <vprintfmt+0x5c>
  800384:	000a3403          	ld	s0,0(s4)
  800388:	008a0793          	addi	a5,s4,8
  80038c:	e43e                	sd	a5,8(sp)
  80038e:	12040063          	beqz	s0,8004ae <vprintfmt+0x2de>
  800392:	0d905963          	blez	s9,800464 <vprintfmt+0x294>
  800396:	02d00793          	li	a5,45
  80039a:	00140a13          	addi	s4,s0,1
  80039e:	12fd9763          	bne	s11,a5,8004cc <vprintfmt+0x2fc>
  8003a2:	00044783          	lbu	a5,0(s0)
  8003a6:	0007851b          	sext.w	a0,a5
  8003aa:	cb9d                	beqz	a5,8003e0 <vprintfmt+0x210>
  8003ac:	547d                	li	s0,-1
  8003ae:	05e00d93          	li	s11,94
  8003b2:	000d4563          	bltz	s10,8003bc <vprintfmt+0x1ec>
  8003b6:	3d7d                	addiw	s10,s10,-1
  8003b8:	028d0263          	beq	s10,s0,8003dc <vprintfmt+0x20c>
  8003bc:	85a6                	mv	a1,s1
  8003be:	0c0b8d63          	beqz	s7,800498 <vprintfmt+0x2c8>
  8003c2:	3781                	addiw	a5,a5,-32
  8003c4:	0cfdfa63          	bgeu	s11,a5,800498 <vprintfmt+0x2c8>
  8003c8:	03f00513          	li	a0,63
  8003cc:	9902                	jalr	s2
  8003ce:	000a4783          	lbu	a5,0(s4)
  8003d2:	3cfd                	addiw	s9,s9,-1
  8003d4:	0a05                	addi	s4,s4,1
  8003d6:	0007851b          	sext.w	a0,a5
  8003da:	ffe1                	bnez	a5,8003b2 <vprintfmt+0x1e2>
  8003dc:	01905963          	blez	s9,8003ee <vprintfmt+0x21e>
  8003e0:	85a6                	mv	a1,s1
  8003e2:	02000513          	li	a0,32
  8003e6:	3cfd                	addiw	s9,s9,-1
  8003e8:	9902                	jalr	s2
  8003ea:	fe0c9be3          	bnez	s9,8003e0 <vprintfmt+0x210>
  8003ee:	6a22                	ld	s4,8(sp)
  8003f0:	bd11                	j	800204 <vprintfmt+0x34>
  8003f2:	4785                	li	a5,1
  8003f4:	008a0b93          	addi	s7,s4,8
  8003f8:	00c7c363          	blt	a5,a2,8003fe <vprintfmt+0x22e>
  8003fc:	ce25                	beqz	a2,800474 <vprintfmt+0x2a4>
  8003fe:	000a3403          	ld	s0,0(s4)
  800402:	08044d63          	bltz	s0,80049c <vprintfmt+0x2cc>
  800406:	8622                	mv	a2,s0
  800408:	8a5e                	mv	s4,s7
  80040a:	46a9                	li	a3,10
  80040c:	b5f5                	j	8002f8 <vprintfmt+0x128>
  80040e:	000a2783          	lw	a5,0(s4)
  800412:	4661                	li	a2,24
  800414:	41f7d71b          	sraiw	a4,a5,0x1f
  800418:	8fb9                	xor	a5,a5,a4
  80041a:	40e786bb          	subw	a3,a5,a4
  80041e:	02d64663          	blt	a2,a3,80044a <vprintfmt+0x27a>
  800422:	00369713          	slli	a4,a3,0x3
  800426:	00000797          	auipc	a5,0x0
  80042a:	69278793          	addi	a5,a5,1682 # 800ab8 <error_string>
  80042e:	97ba                	add	a5,a5,a4
  800430:	639c                	ld	a5,0(a5)
  800432:	cf81                	beqz	a5,80044a <vprintfmt+0x27a>
  800434:	86be                	mv	a3,a5
  800436:	00000617          	auipc	a2,0x0
  80043a:	3e260613          	addi	a2,a2,994 # 800818 <main+0x13a>
  80043e:	85a6                	mv	a1,s1
  800440:	854a                	mv	a0,s2
  800442:	0e8000ef          	jal	80052a <printfmt>
  800446:	0a21                	addi	s4,s4,8
  800448:	bb75                	j	800204 <vprintfmt+0x34>
  80044a:	00000617          	auipc	a2,0x0
  80044e:	3be60613          	addi	a2,a2,958 # 800808 <main+0x12a>
  800452:	85a6                	mv	a1,s1
  800454:	854a                	mv	a0,s2
  800456:	0d4000ef          	jal	80052a <printfmt>
  80045a:	0a21                	addi	s4,s4,8
  80045c:	b365                	j	800204 <vprintfmt+0x34>
  80045e:	2605                	addiw	a2,a2,1
  800460:	8462                	mv	s0,s8
  800462:	b3e9                	j	80022c <vprintfmt+0x5c>
  800464:	00044783          	lbu	a5,0(s0)
  800468:	0007851b          	sext.w	a0,a5
  80046c:	d3c9                	beqz	a5,8003ee <vprintfmt+0x21e>
  80046e:	00140a13          	addi	s4,s0,1
  800472:	bf2d                	j	8003ac <vprintfmt+0x1dc>
  800474:	000a2403          	lw	s0,0(s4)
  800478:	b769                	j	800402 <vprintfmt+0x232>
  80047a:	000a6603          	lwu	a2,0(s4)
  80047e:	46a1                	li	a3,8
  800480:	8a3a                	mv	s4,a4
  800482:	bd9d                	j	8002f8 <vprintfmt+0x128>
  800484:	000a6603          	lwu	a2,0(s4)
  800488:	46a9                	li	a3,10
  80048a:	8a3a                	mv	s4,a4
  80048c:	b5b5                	j	8002f8 <vprintfmt+0x128>
  80048e:	000a6603          	lwu	a2,0(s4)
  800492:	46c1                	li	a3,16
  800494:	8a3a                	mv	s4,a4
  800496:	b58d                	j	8002f8 <vprintfmt+0x128>
  800498:	9902                	jalr	s2
  80049a:	bf15                	j	8003ce <vprintfmt+0x1fe>
  80049c:	85a6                	mv	a1,s1
  80049e:	02d00513          	li	a0,45
  8004a2:	9902                	jalr	s2
  8004a4:	40800633          	neg	a2,s0
  8004a8:	8a5e                	mv	s4,s7
  8004aa:	46a9                	li	a3,10
  8004ac:	b5b1                	j	8002f8 <vprintfmt+0x128>
  8004ae:	01905663          	blez	s9,8004ba <vprintfmt+0x2ea>
  8004b2:	02d00793          	li	a5,45
  8004b6:	04fd9263          	bne	s11,a5,8004fa <vprintfmt+0x32a>
  8004ba:	02800793          	li	a5,40
  8004be:	00000a17          	auipc	s4,0x0
  8004c2:	343a0a13          	addi	s4,s4,835 # 800801 <main+0x123>
  8004c6:	02800513          	li	a0,40
  8004ca:	b5cd                	j	8003ac <vprintfmt+0x1dc>
  8004cc:	85ea                	mv	a1,s10
  8004ce:	8522                	mv	a0,s0
  8004d0:	0c0000ef          	jal	800590 <strnlen>
  8004d4:	40ac8cbb          	subw	s9,s9,a0
  8004d8:	01905963          	blez	s9,8004ea <vprintfmt+0x31a>
  8004dc:	2d81                	sext.w	s11,s11
  8004de:	85a6                	mv	a1,s1
  8004e0:	856e                	mv	a0,s11
  8004e2:	3cfd                	addiw	s9,s9,-1
  8004e4:	9902                	jalr	s2
  8004e6:	fe0c9ce3          	bnez	s9,8004de <vprintfmt+0x30e>
  8004ea:	00044783          	lbu	a5,0(s0)
  8004ee:	0007851b          	sext.w	a0,a5
  8004f2:	ea079de3          	bnez	a5,8003ac <vprintfmt+0x1dc>
  8004f6:	6a22                	ld	s4,8(sp)
  8004f8:	b331                	j	800204 <vprintfmt+0x34>
  8004fa:	85ea                	mv	a1,s10
  8004fc:	00000517          	auipc	a0,0x0
  800500:	30450513          	addi	a0,a0,772 # 800800 <main+0x122>
  800504:	08c000ef          	jal	800590 <strnlen>
  800508:	40ac8cbb          	subw	s9,s9,a0
  80050c:	00000417          	auipc	s0,0x0
  800510:	2f440413          	addi	s0,s0,756 # 800800 <main+0x122>
  800514:	00000a17          	auipc	s4,0x0
  800518:	2eda0a13          	addi	s4,s4,749 # 800801 <main+0x123>
  80051c:	02800793          	li	a5,40
  800520:	02800513          	li	a0,40
  800524:	fb904ce3          	bgtz	s9,8004dc <vprintfmt+0x30c>
  800528:	b551                	j	8003ac <vprintfmt+0x1dc>

000000000080052a <printfmt>:
  80052a:	715d                	addi	sp,sp,-80
  80052c:	02810313          	addi	t1,sp,40
  800530:	f436                	sd	a3,40(sp)
  800532:	869a                	mv	a3,t1
  800534:	ec06                	sd	ra,24(sp)
  800536:	f83a                	sd	a4,48(sp)
  800538:	fc3e                	sd	a5,56(sp)
  80053a:	e0c2                	sd	a6,64(sp)
  80053c:	e4c6                	sd	a7,72(sp)
  80053e:	e41a                	sd	t1,8(sp)
  800540:	c91ff0ef          	jal	8001d0 <vprintfmt>
  800544:	60e2                	ld	ra,24(sp)
  800546:	6161                	addi	sp,sp,80
  800548:	8082                	ret

000000000080054a <rand>:
  80054a:	00001697          	auipc	a3,0x1
  80054e:	ab668693          	addi	a3,a3,-1354 # 801000 <next>
  800552:	002ef737          	lui	a4,0x2ef
  800556:	629c                	ld	a5,0(a3)
  800558:	76770713          	addi	a4,a4,1895 # 2ef767 <_start-0x5108b9>
  80055c:	0736                	slli	a4,a4,0xd
  80055e:	66d70713          	addi	a4,a4,1645
  800562:	02e787b3          	mul	a5,a5,a4
  800566:	80000737          	lui	a4,0x80000
  80056a:	fff74713          	not	a4,a4
  80056e:	07ad                	addi	a5,a5,11
  800570:	07c2                	slli	a5,a5,0x10
  800572:	83c1                	srli	a5,a5,0x10
  800574:	00c7d513          	srli	a0,a5,0xc
  800578:	02e57533          	remu	a0,a0,a4
  80057c:	e29c                	sd	a5,0(a3)
  80057e:	2505                	addiw	a0,a0,1
  800580:	8082                	ret

0000000000800582 <srand>:
  800582:	1502                	slli	a0,a0,0x20
  800584:	9101                	srli	a0,a0,0x20
  800586:	00001797          	auipc	a5,0x1
  80058a:	a6a7bd23          	sd	a0,-1414(a5) # 801000 <next>
  80058e:	8082                	ret

0000000000800590 <strnlen>:
  800590:	4781                	li	a5,0
  800592:	e589                	bnez	a1,80059c <strnlen+0xc>
  800594:	a811                	j	8005a8 <strnlen+0x18>
  800596:	0785                	addi	a5,a5,1
  800598:	00f58863          	beq	a1,a5,8005a8 <strnlen+0x18>
  80059c:	00f50733          	add	a4,a0,a5
  8005a0:	00074703          	lbu	a4,0(a4) # ffffffff80000000 <mata+0xffffffff7f7fecd8>
  8005a4:	fb6d                	bnez	a4,800596 <strnlen+0x6>
  8005a6:	85be                	mv	a1,a5
  8005a8:	852e                	mv	a0,a1
  8005aa:	8082                	ret

00000000008005ac <memset>:
  8005ac:	ca01                	beqz	a2,8005bc <memset+0x10>
  8005ae:	962a                	add	a2,a2,a0
  8005b0:	87aa                	mv	a5,a0
  8005b2:	0785                	addi	a5,a5,1
  8005b4:	feb78fa3          	sb	a1,-1(a5)
  8005b8:	fef61de3          	bne	a2,a5,8005b2 <memset+0x6>
  8005bc:	8082                	ret

00000000008005be <work>:
  8005be:	7179                	addi	sp,sp,-48
  8005c0:	ec26                	sd	s1,24(sp)
  8005c2:	00001497          	auipc	s1,0x1
  8005c6:	d6648493          	addi	s1,s1,-666 # 801328 <mata>
  8005ca:	f022                	sd	s0,32(sp)
  8005cc:	e84a                	sd	s2,16(sp)
  8005ce:	e44e                	sd	s3,8(sp)
  8005d0:	f406                	sd	ra,40(sp)
  8005d2:	89aa                	mv	s3,a0
  8005d4:	00001917          	auipc	s2,0x1
  8005d8:	bc490913          	addi	s2,s2,-1084 # 801198 <matb>
  8005dc:	00001597          	auipc	a1,0x1
  8005e0:	be458593          	addi	a1,a1,-1052 # 8011c0 <matb+0x28>
  8005e4:	00001417          	auipc	s0,0x1
  8005e8:	d6c40413          	addi	s0,s0,-660 # 801350 <mata+0x28>
  8005ec:	8626                	mv	a2,s1
  8005ee:	4685                	li	a3,1
  8005f0:	fd858793          	addi	a5,a1,-40
  8005f4:	8732                	mv	a4,a2
  8005f6:	c394                	sw	a3,0(a5)
  8005f8:	c314                	sw	a3,0(a4)
  8005fa:	0791                	addi	a5,a5,4
  8005fc:	0711                	addi	a4,a4,4
  8005fe:	feb79ce3          	bne	a5,a1,8005f6 <work+0x38>
  800602:	02878593          	addi	a1,a5,40
  800606:	02860613          	addi	a2,a2,40
  80060a:	fe8593e3          	bne	a1,s0,8005f0 <work+0x32>
  80060e:	b43ff0ef          	jal	800150 <yield>
  800612:	b43ff0ef          	jal	800154 <getpid>
  800616:	85aa                	mv	a1,a0
  800618:	864e                	mv	a2,s3
  80061a:	00000517          	auipc	a0,0x0
  80061e:	2c650513          	addi	a0,a0,710 # 8008e0 <main+0x202>
  800622:	a7fff0ef          	jal	8000a0 <cprintf>
  800626:	fff98f9b          	addiw	t6,s3,-1
  80062a:	00001e97          	auipc	t4,0x1
  80062e:	cfee8e93          	addi	t4,t4,-770 # 801328 <mata>
  800632:	00001f17          	auipc	t5,0x1
  800636:	e86f0f13          	addi	t5,t5,-378 # 8014b8 <mata+0x190>
  80063a:	00001397          	auipc	t2,0x1
  80063e:	9f638393          	addi	t2,t2,-1546 # 801030 <matc+0x28>
  800642:	52fd                	li	t0,-1
  800644:	08098163          	beqz	s3,8006c6 <work+0x108>
  800648:	00001317          	auipc	t1,0x1
  80064c:	9c030313          	addi	t1,t1,-1600 # 801008 <matc>
  800650:	8e1a                	mv	t3,t1
  800652:	88a6                	mv	a7,s1
  800654:	8576                	mv	a0,t4
  800656:	8872                	mv	a6,t3
  800658:	e7050713          	addi	a4,a0,-400
  80065c:	86c6                	mv	a3,a7
  80065e:	4601                	li	a2,0
  800660:	428c                	lw	a1,0(a3)
  800662:	431c                	lw	a5,0(a4)
  800664:	02870713          	addi	a4,a4,40
  800668:	0691                	addi	a3,a3,4
  80066a:	02b787bb          	mulw	a5,a5,a1
  80066e:	9e3d                	addw	a2,a2,a5
  800670:	fea718e3          	bne	a4,a0,800660 <work+0xa2>
  800674:	00c82023          	sw	a2,0(a6)
  800678:	00470513          	addi	a0,a4,4
  80067c:	0811                	addi	a6,a6,4
  80067e:	fc851de3          	bne	a0,s0,800658 <work+0x9a>
  800682:	02888893          	addi	a7,a7,40
  800686:	028e0e13          	addi	t3,t3,40
  80068a:	fd1f15e3          	bne	t5,a7,800654 <work+0x96>
  80068e:	859e                	mv	a1,t2
  800690:	8826                	mv	a6,s1
  800692:	854a                	mv	a0,s2
  800694:	86aa                	mv	a3,a0
  800696:	8742                	mv	a4,a6
  800698:	879a                	mv	a5,t1
  80069a:	6390                	ld	a2,0(a5)
  80069c:	0721                	addi	a4,a4,8
  80069e:	07a1                	addi	a5,a5,8
  8006a0:	e290                	sd	a2,0(a3)
  8006a2:	fec73c23          	sd	a2,-8(a4)
  8006a6:	06a1                	addi	a3,a3,8
  8006a8:	feb799e3          	bne	a5,a1,80069a <work+0xdc>
  8006ac:	02850513          	addi	a0,a0,40
  8006b0:	02830313          	addi	t1,t1,40
  8006b4:	02880813          	addi	a6,a6,40
  8006b8:	02878593          	addi	a1,a5,40
  8006bc:	fcae9ce3          	bne	t4,a0,800694 <work+0xd6>
  8006c0:	3ffd                	addiw	t6,t6,-1
  8006c2:	f85f93e3          	bne	t6,t0,800648 <work+0x8a>
  8006c6:	a8fff0ef          	jal	800154 <getpid>
  8006ca:	85aa                	mv	a1,a0
  8006cc:	00000517          	auipc	a0,0x0
  8006d0:	23450513          	addi	a0,a0,564 # 800900 <main+0x222>
  8006d4:	9cdff0ef          	jal	8000a0 <cprintf>
  8006d8:	4501                	li	a0,0
  8006da:	a59ff0ef          	jal	800132 <exit>

00000000008006de <main>:
  8006de:	7175                	addi	sp,sp,-144
  8006e0:	f4ce                	sd	s3,104(sp)
  8006e2:	05400613          	li	a2,84
  8006e6:	4581                	li	a1,0
  8006e8:	0028                	addi	a0,sp,8
  8006ea:	00810993          	addi	s3,sp,8
  8006ee:	e122                	sd	s0,128(sp)
  8006f0:	fca6                	sd	s1,120(sp)
  8006f2:	f8ca                	sd	s2,112(sp)
  8006f4:	e506                	sd	ra,136(sp)
  8006f6:	84ce                	mv	s1,s3
  8006f8:	eb5ff0ef          	jal	8005ac <memset>
  8006fc:	4401                	li	s0,0
  8006fe:	4955                	li	s2,21
  800700:	a49ff0ef          	jal	800148 <fork>
  800704:	c088                	sw	a0,0(s1)
  800706:	cd2d                	beqz	a0,800780 <main+0xa2>
  800708:	04054663          	bltz	a0,800754 <main+0x76>
  80070c:	2405                	addiw	s0,s0,1
  80070e:	0491                	addi	s1,s1,4
  800710:	ff2418e3          	bne	s0,s2,800700 <main+0x22>
  800714:	00000517          	auipc	a0,0x0
  800718:	1fc50513          	addi	a0,a0,508 # 800910 <main+0x232>
  80071c:	985ff0ef          	jal	8000a0 <cprintf>
  800720:	4455                	li	s0,21
  800722:	a29ff0ef          	jal	80014a <wait>
  800726:	e10d                	bnez	a0,800748 <main+0x6a>
  800728:	347d                	addiw	s0,s0,-1
  80072a:	fc65                	bnez	s0,800722 <main+0x44>
  80072c:	00000517          	auipc	a0,0x0
  800730:	20450513          	addi	a0,a0,516 # 800930 <main+0x252>
  800734:	96dff0ef          	jal	8000a0 <cprintf>
  800738:	60aa                	ld	ra,136(sp)
  80073a:	640a                	ld	s0,128(sp)
  80073c:	74e6                	ld	s1,120(sp)
  80073e:	7946                	ld	s2,112(sp)
  800740:	79a6                	ld	s3,104(sp)
  800742:	4501                	li	a0,0
  800744:	6149                	addi	sp,sp,144
  800746:	8082                	ret
  800748:	00000517          	auipc	a0,0x0
  80074c:	1d850513          	addi	a0,a0,472 # 800920 <main+0x242>
  800750:	951ff0ef          	jal	8000a0 <cprintf>
  800754:	08e0                	addi	s0,sp,92
  800756:	0009a503          	lw	a0,0(s3)
  80075a:	00a05463          	blez	a0,800762 <main+0x84>
  80075e:	9f5ff0ef          	jal	800152 <kill>
  800762:	0991                	addi	s3,s3,4
  800764:	fe8999e3          	bne	s3,s0,800756 <main+0x78>
  800768:	00000617          	auipc	a2,0x0
  80076c:	1d860613          	addi	a2,a2,472 # 800940 <main+0x262>
  800770:	05200593          	li	a1,82
  800774:	00000517          	auipc	a0,0x0
  800778:	1dc50513          	addi	a0,a0,476 # 800950 <main+0x272>
  80077c:	8abff0ef          	jal	800026 <__panic>
  800780:	0284053b          	mulw	a0,s0,s0
  800784:	dffff0ef          	jal	800582 <srand>
  800788:	dc3ff0ef          	jal	80054a <rand>
  80078c:	47d5                	li	a5,21
  80078e:	02f577bb          	remuw	a5,a0,a5
  800792:	06400513          	li	a0,100
  800796:	02f787bb          	mulw	a5,a5,a5
  80079a:	27a9                	addiw	a5,a5,10
  80079c:	02f5053b          	mulw	a0,a0,a5
  8007a0:	e1fff0ef          	jal	8005be <work>
