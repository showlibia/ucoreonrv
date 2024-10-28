
obj/__user_spin.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	12c000ef          	jal	80014c <umain>
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
  800038:	5f450513          	addi	a0,a0,1524 # 800628 <main+0xcc>
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
  800058:	5f450513          	addi	a0,a0,1524 # 800648 <main+0xec>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0cc000ef          	jal	80012e <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0ba000ef          	jal	800128 <sys_putc>
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
  800094:	132000ef          	jal	8001c6 <vprintfmt>
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
  8000c8:	0fe000ef          	jal	8001c6 <vprintfmt>
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

0000000000800128 <sys_putc>:
  800128:	85aa                	mv	a1,a0
  80012a:	4579                	li	a0,30
  80012c:	b765                	j	8000d4 <syscall>

000000000080012e <exit>:
  80012e:	1141                	addi	sp,sp,-16
  800130:	e406                	sd	ra,8(sp)
  800132:	fdbff0ef          	jal	80010c <sys_exit>
  800136:	00000517          	auipc	a0,0x0
  80013a:	51a50513          	addi	a0,a0,1306 # 800650 <main+0xf4>
  80013e:	f63ff0ef          	jal	8000a0 <cprintf>
  800142:	a001                	j	800142 <exit+0x14>

0000000000800144 <fork>:
  800144:	b7f9                	j	800112 <sys_fork>

0000000000800146 <waitpid>:
  800146:	bfc1                	j	800116 <sys_wait>

0000000000800148 <yield>:
  800148:	bfd9                	j	80011e <sys_yield>

000000000080014a <kill>:
  80014a:	bfe1                	j	800122 <sys_kill>

000000000080014c <umain>:
  80014c:	1141                	addi	sp,sp,-16
  80014e:	e406                	sd	ra,8(sp)
  800150:	40c000ef          	jal	80055c <main>
  800154:	fdbff0ef          	jal	80012e <exit>

0000000000800158 <printnum>:
  800158:	02069813          	slli	a6,a3,0x20
  80015c:	7179                	addi	sp,sp,-48
  80015e:	02085813          	srli	a6,a6,0x20
  800162:	e052                	sd	s4,0(sp)
  800164:	03067a33          	remu	s4,a2,a6
  800168:	f022                	sd	s0,32(sp)
  80016a:	ec26                	sd	s1,24(sp)
  80016c:	e84a                	sd	s2,16(sp)
  80016e:	f406                	sd	ra,40(sp)
  800170:	84aa                	mv	s1,a0
  800172:	892e                	mv	s2,a1
  800174:	fff7041b          	addiw	s0,a4,-1
  800178:	2a01                	sext.w	s4,s4
  80017a:	05067063          	bgeu	a2,a6,8001ba <printnum+0x62>
  80017e:	e44e                	sd	s3,8(sp)
  800180:	89be                	mv	s3,a5
  800182:	4785                	li	a5,1
  800184:	00e7d763          	bge	a5,a4,800192 <printnum+0x3a>
  800188:	85ca                	mv	a1,s2
  80018a:	854e                	mv	a0,s3
  80018c:	347d                	addiw	s0,s0,-1
  80018e:	9482                	jalr	s1
  800190:	fc65                	bnez	s0,800188 <printnum+0x30>
  800192:	69a2                	ld	s3,8(sp)
  800194:	1a02                	slli	s4,s4,0x20
  800196:	020a5a13          	srli	s4,s4,0x20
  80019a:	00000797          	auipc	a5,0x0
  80019e:	4ce78793          	addi	a5,a5,1230 # 800668 <main+0x10c>
  8001a2:	97d2                	add	a5,a5,s4
  8001a4:	7402                	ld	s0,32(sp)
  8001a6:	0007c503          	lbu	a0,0(a5)
  8001aa:	70a2                	ld	ra,40(sp)
  8001ac:	6a02                	ld	s4,0(sp)
  8001ae:	85ca                	mv	a1,s2
  8001b0:	87a6                	mv	a5,s1
  8001b2:	6942                	ld	s2,16(sp)
  8001b4:	64e2                	ld	s1,24(sp)
  8001b6:	6145                	addi	sp,sp,48
  8001b8:	8782                	jr	a5
  8001ba:	03065633          	divu	a2,a2,a6
  8001be:	8722                	mv	a4,s0
  8001c0:	f99ff0ef          	jal	800158 <printnum>
  8001c4:	bfc1                	j	800194 <printnum+0x3c>

00000000008001c6 <vprintfmt>:
  8001c6:	7119                	addi	sp,sp,-128
  8001c8:	f4a6                	sd	s1,104(sp)
  8001ca:	f0ca                	sd	s2,96(sp)
  8001cc:	ecce                	sd	s3,88(sp)
  8001ce:	e8d2                	sd	s4,80(sp)
  8001d0:	e4d6                	sd	s5,72(sp)
  8001d2:	e0da                	sd	s6,64(sp)
  8001d4:	f862                	sd	s8,48(sp)
  8001d6:	fc86                	sd	ra,120(sp)
  8001d8:	f8a2                	sd	s0,112(sp)
  8001da:	fc5e                	sd	s7,56(sp)
  8001dc:	f466                	sd	s9,40(sp)
  8001de:	f06a                	sd	s10,32(sp)
  8001e0:	ec6e                	sd	s11,24(sp)
  8001e2:	892a                	mv	s2,a0
  8001e4:	84ae                	mv	s1,a1
  8001e6:	8c32                	mv	s8,a2
  8001e8:	8a36                	mv	s4,a3
  8001ea:	02500993          	li	s3,37
  8001ee:	05500b13          	li	s6,85
  8001f2:	00000a97          	auipc	s5,0x0
  8001f6:	6a6a8a93          	addi	s5,s5,1702 # 800898 <main+0x33c>
  8001fa:	000c4503          	lbu	a0,0(s8)
  8001fe:	001c0413          	addi	s0,s8,1
  800202:	01350a63          	beq	a0,s3,800216 <vprintfmt+0x50>
  800206:	cd0d                	beqz	a0,800240 <vprintfmt+0x7a>
  800208:	85a6                	mv	a1,s1
  80020a:	9902                	jalr	s2
  80020c:	00044503          	lbu	a0,0(s0)
  800210:	0405                	addi	s0,s0,1
  800212:	ff351ae3          	bne	a0,s3,800206 <vprintfmt+0x40>
  800216:	02000d93          	li	s11,32
  80021a:	4b81                	li	s7,0
  80021c:	4601                	li	a2,0
  80021e:	5d7d                	li	s10,-1
  800220:	5cfd                	li	s9,-1
  800222:	00044683          	lbu	a3,0(s0)
  800226:	00140c13          	addi	s8,s0,1
  80022a:	fdd6859b          	addiw	a1,a3,-35
  80022e:	0ff5f593          	zext.b	a1,a1
  800232:	02bb6663          	bltu	s6,a1,80025e <vprintfmt+0x98>
  800236:	058a                	slli	a1,a1,0x2
  800238:	95d6                	add	a1,a1,s5
  80023a:	4198                	lw	a4,0(a1)
  80023c:	9756                	add	a4,a4,s5
  80023e:	8702                	jr	a4
  800240:	70e6                	ld	ra,120(sp)
  800242:	7446                	ld	s0,112(sp)
  800244:	74a6                	ld	s1,104(sp)
  800246:	7906                	ld	s2,96(sp)
  800248:	69e6                	ld	s3,88(sp)
  80024a:	6a46                	ld	s4,80(sp)
  80024c:	6aa6                	ld	s5,72(sp)
  80024e:	6b06                	ld	s6,64(sp)
  800250:	7be2                	ld	s7,56(sp)
  800252:	7c42                	ld	s8,48(sp)
  800254:	7ca2                	ld	s9,40(sp)
  800256:	7d02                	ld	s10,32(sp)
  800258:	6de2                	ld	s11,24(sp)
  80025a:	6109                	addi	sp,sp,128
  80025c:	8082                	ret
  80025e:	85a6                	mv	a1,s1
  800260:	02500513          	li	a0,37
  800264:	9902                	jalr	s2
  800266:	fff44703          	lbu	a4,-1(s0)
  80026a:	02500793          	li	a5,37
  80026e:	8c22                	mv	s8,s0
  800270:	f8f705e3          	beq	a4,a5,8001fa <vprintfmt+0x34>
  800274:	02500713          	li	a4,37
  800278:	ffec4783          	lbu	a5,-2(s8)
  80027c:	1c7d                	addi	s8,s8,-1
  80027e:	fee79de3          	bne	a5,a4,800278 <vprintfmt+0xb2>
  800282:	bfa5                	j	8001fa <vprintfmt+0x34>
  800284:	00144783          	lbu	a5,1(s0)
  800288:	4725                	li	a4,9
  80028a:	fd068d1b          	addiw	s10,a3,-48
  80028e:	fd07859b          	addiw	a1,a5,-48
  800292:	0007869b          	sext.w	a3,a5
  800296:	8462                	mv	s0,s8
  800298:	02b76563          	bltu	a4,a1,8002c2 <vprintfmt+0xfc>
  80029c:	4525                	li	a0,9
  80029e:	00144783          	lbu	a5,1(s0)
  8002a2:	002d171b          	slliw	a4,s10,0x2
  8002a6:	01a7073b          	addw	a4,a4,s10
  8002aa:	0017171b          	slliw	a4,a4,0x1
  8002ae:	9f35                	addw	a4,a4,a3
  8002b0:	fd07859b          	addiw	a1,a5,-48
  8002b4:	0405                	addi	s0,s0,1
  8002b6:	fd070d1b          	addiw	s10,a4,-48
  8002ba:	0007869b          	sext.w	a3,a5
  8002be:	feb570e3          	bgeu	a0,a1,80029e <vprintfmt+0xd8>
  8002c2:	f60cd0e3          	bgez	s9,800222 <vprintfmt+0x5c>
  8002c6:	8cea                	mv	s9,s10
  8002c8:	5d7d                	li	s10,-1
  8002ca:	bfa1                	j	800222 <vprintfmt+0x5c>
  8002cc:	8db6                	mv	s11,a3
  8002ce:	8462                	mv	s0,s8
  8002d0:	bf89                	j	800222 <vprintfmt+0x5c>
  8002d2:	8462                	mv	s0,s8
  8002d4:	4b85                	li	s7,1
  8002d6:	b7b1                	j	800222 <vprintfmt+0x5c>
  8002d8:	4785                	li	a5,1
  8002da:	008a0713          	addi	a4,s4,8
  8002de:	00c7c463          	blt	a5,a2,8002e6 <vprintfmt+0x120>
  8002e2:	1a060163          	beqz	a2,800484 <vprintfmt+0x2be>
  8002e6:	000a3603          	ld	a2,0(s4)
  8002ea:	46c1                	li	a3,16
  8002ec:	8a3a                	mv	s4,a4
  8002ee:	000d879b          	sext.w	a5,s11
  8002f2:	8766                	mv	a4,s9
  8002f4:	85a6                	mv	a1,s1
  8002f6:	854a                	mv	a0,s2
  8002f8:	e61ff0ef          	jal	800158 <printnum>
  8002fc:	bdfd                	j	8001fa <vprintfmt+0x34>
  8002fe:	000a2503          	lw	a0,0(s4)
  800302:	85a6                	mv	a1,s1
  800304:	0a21                	addi	s4,s4,8
  800306:	9902                	jalr	s2
  800308:	bdcd                	j	8001fa <vprintfmt+0x34>
  80030a:	4785                	li	a5,1
  80030c:	008a0713          	addi	a4,s4,8
  800310:	00c7c463          	blt	a5,a2,800318 <vprintfmt+0x152>
  800314:	16060363          	beqz	a2,80047a <vprintfmt+0x2b4>
  800318:	000a3603          	ld	a2,0(s4)
  80031c:	46a9                	li	a3,10
  80031e:	8a3a                	mv	s4,a4
  800320:	b7f9                	j	8002ee <vprintfmt+0x128>
  800322:	85a6                	mv	a1,s1
  800324:	03000513          	li	a0,48
  800328:	9902                	jalr	s2
  80032a:	85a6                	mv	a1,s1
  80032c:	07800513          	li	a0,120
  800330:	9902                	jalr	s2
  800332:	000a3603          	ld	a2,0(s4)
  800336:	46c1                	li	a3,16
  800338:	0a21                	addi	s4,s4,8
  80033a:	bf55                	j	8002ee <vprintfmt+0x128>
  80033c:	85a6                	mv	a1,s1
  80033e:	02500513          	li	a0,37
  800342:	9902                	jalr	s2
  800344:	bd5d                	j	8001fa <vprintfmt+0x34>
  800346:	000a2d03          	lw	s10,0(s4)
  80034a:	8462                	mv	s0,s8
  80034c:	0a21                	addi	s4,s4,8
  80034e:	bf95                	j	8002c2 <vprintfmt+0xfc>
  800350:	4785                	li	a5,1
  800352:	008a0713          	addi	a4,s4,8
  800356:	00c7c463          	blt	a5,a2,80035e <vprintfmt+0x198>
  80035a:	10060b63          	beqz	a2,800470 <vprintfmt+0x2aa>
  80035e:	000a3603          	ld	a2,0(s4)
  800362:	46a1                	li	a3,8
  800364:	8a3a                	mv	s4,a4
  800366:	b761                	j	8002ee <vprintfmt+0x128>
  800368:	fffcc793          	not	a5,s9
  80036c:	97fd                	srai	a5,a5,0x3f
  80036e:	00fcf7b3          	and	a5,s9,a5
  800372:	00078c9b          	sext.w	s9,a5
  800376:	8462                	mv	s0,s8
  800378:	b56d                	j	800222 <vprintfmt+0x5c>
  80037a:	000a3403          	ld	s0,0(s4)
  80037e:	008a0793          	addi	a5,s4,8
  800382:	e43e                	sd	a5,8(sp)
  800384:	12040063          	beqz	s0,8004a4 <vprintfmt+0x2de>
  800388:	0d905963          	blez	s9,80045a <vprintfmt+0x294>
  80038c:	02d00793          	li	a5,45
  800390:	00140a13          	addi	s4,s0,1
  800394:	12fd9763          	bne	s11,a5,8004c2 <vprintfmt+0x2fc>
  800398:	00044783          	lbu	a5,0(s0)
  80039c:	0007851b          	sext.w	a0,a5
  8003a0:	cb9d                	beqz	a5,8003d6 <vprintfmt+0x210>
  8003a2:	547d                	li	s0,-1
  8003a4:	05e00d93          	li	s11,94
  8003a8:	000d4563          	bltz	s10,8003b2 <vprintfmt+0x1ec>
  8003ac:	3d7d                	addiw	s10,s10,-1
  8003ae:	028d0263          	beq	s10,s0,8003d2 <vprintfmt+0x20c>
  8003b2:	85a6                	mv	a1,s1
  8003b4:	0c0b8d63          	beqz	s7,80048e <vprintfmt+0x2c8>
  8003b8:	3781                	addiw	a5,a5,-32
  8003ba:	0cfdfa63          	bgeu	s11,a5,80048e <vprintfmt+0x2c8>
  8003be:	03f00513          	li	a0,63
  8003c2:	9902                	jalr	s2
  8003c4:	000a4783          	lbu	a5,0(s4)
  8003c8:	3cfd                	addiw	s9,s9,-1
  8003ca:	0a05                	addi	s4,s4,1
  8003cc:	0007851b          	sext.w	a0,a5
  8003d0:	ffe1                	bnez	a5,8003a8 <vprintfmt+0x1e2>
  8003d2:	01905963          	blez	s9,8003e4 <vprintfmt+0x21e>
  8003d6:	85a6                	mv	a1,s1
  8003d8:	02000513          	li	a0,32
  8003dc:	3cfd                	addiw	s9,s9,-1
  8003de:	9902                	jalr	s2
  8003e0:	fe0c9be3          	bnez	s9,8003d6 <vprintfmt+0x210>
  8003e4:	6a22                	ld	s4,8(sp)
  8003e6:	bd11                	j	8001fa <vprintfmt+0x34>
  8003e8:	4785                	li	a5,1
  8003ea:	008a0b93          	addi	s7,s4,8
  8003ee:	00c7c363          	blt	a5,a2,8003f4 <vprintfmt+0x22e>
  8003f2:	ce25                	beqz	a2,80046a <vprintfmt+0x2a4>
  8003f4:	000a3403          	ld	s0,0(s4)
  8003f8:	08044d63          	bltz	s0,800492 <vprintfmt+0x2cc>
  8003fc:	8622                	mv	a2,s0
  8003fe:	8a5e                	mv	s4,s7
  800400:	46a9                	li	a3,10
  800402:	b5f5                	j	8002ee <vprintfmt+0x128>
  800404:	000a2783          	lw	a5,0(s4)
  800408:	4661                	li	a2,24
  80040a:	41f7d71b          	sraiw	a4,a5,0x1f
  80040e:	8fb9                	xor	a5,a5,a4
  800410:	40e786bb          	subw	a3,a5,a4
  800414:	02d64663          	blt	a2,a3,800440 <vprintfmt+0x27a>
  800418:	00369713          	slli	a4,a3,0x3
  80041c:	00000797          	auipc	a5,0x0
  800420:	5d478793          	addi	a5,a5,1492 # 8009f0 <error_string>
  800424:	97ba                	add	a5,a5,a4
  800426:	639c                	ld	a5,0(a5)
  800428:	cf81                	beqz	a5,800440 <vprintfmt+0x27a>
  80042a:	86be                	mv	a3,a5
  80042c:	00000617          	auipc	a2,0x0
  800430:	26c60613          	addi	a2,a2,620 # 800698 <main+0x13c>
  800434:	85a6                	mv	a1,s1
  800436:	854a                	mv	a0,s2
  800438:	0e8000ef          	jal	800520 <printfmt>
  80043c:	0a21                	addi	s4,s4,8
  80043e:	bb75                	j	8001fa <vprintfmt+0x34>
  800440:	00000617          	auipc	a2,0x0
  800444:	24860613          	addi	a2,a2,584 # 800688 <main+0x12c>
  800448:	85a6                	mv	a1,s1
  80044a:	854a                	mv	a0,s2
  80044c:	0d4000ef          	jal	800520 <printfmt>
  800450:	0a21                	addi	s4,s4,8
  800452:	b365                	j	8001fa <vprintfmt+0x34>
  800454:	2605                	addiw	a2,a2,1
  800456:	8462                	mv	s0,s8
  800458:	b3e9                	j	800222 <vprintfmt+0x5c>
  80045a:	00044783          	lbu	a5,0(s0)
  80045e:	0007851b          	sext.w	a0,a5
  800462:	d3c9                	beqz	a5,8003e4 <vprintfmt+0x21e>
  800464:	00140a13          	addi	s4,s0,1
  800468:	bf2d                	j	8003a2 <vprintfmt+0x1dc>
  80046a:	000a2403          	lw	s0,0(s4)
  80046e:	b769                	j	8003f8 <vprintfmt+0x232>
  800470:	000a6603          	lwu	a2,0(s4)
  800474:	46a1                	li	a3,8
  800476:	8a3a                	mv	s4,a4
  800478:	bd9d                	j	8002ee <vprintfmt+0x128>
  80047a:	000a6603          	lwu	a2,0(s4)
  80047e:	46a9                	li	a3,10
  800480:	8a3a                	mv	s4,a4
  800482:	b5b5                	j	8002ee <vprintfmt+0x128>
  800484:	000a6603          	lwu	a2,0(s4)
  800488:	46c1                	li	a3,16
  80048a:	8a3a                	mv	s4,a4
  80048c:	b58d                	j	8002ee <vprintfmt+0x128>
  80048e:	9902                	jalr	s2
  800490:	bf15                	j	8003c4 <vprintfmt+0x1fe>
  800492:	85a6                	mv	a1,s1
  800494:	02d00513          	li	a0,45
  800498:	9902                	jalr	s2
  80049a:	40800633          	neg	a2,s0
  80049e:	8a5e                	mv	s4,s7
  8004a0:	46a9                	li	a3,10
  8004a2:	b5b1                	j	8002ee <vprintfmt+0x128>
  8004a4:	01905663          	blez	s9,8004b0 <vprintfmt+0x2ea>
  8004a8:	02d00793          	li	a5,45
  8004ac:	04fd9263          	bne	s11,a5,8004f0 <vprintfmt+0x32a>
  8004b0:	02800793          	li	a5,40
  8004b4:	00000a17          	auipc	s4,0x0
  8004b8:	1cda0a13          	addi	s4,s4,461 # 800681 <main+0x125>
  8004bc:	02800513          	li	a0,40
  8004c0:	b5cd                	j	8003a2 <vprintfmt+0x1dc>
  8004c2:	85ea                	mv	a1,s10
  8004c4:	8522                	mv	a0,s0
  8004c6:	07a000ef          	jal	800540 <strnlen>
  8004ca:	40ac8cbb          	subw	s9,s9,a0
  8004ce:	01905963          	blez	s9,8004e0 <vprintfmt+0x31a>
  8004d2:	2d81                	sext.w	s11,s11
  8004d4:	85a6                	mv	a1,s1
  8004d6:	856e                	mv	a0,s11
  8004d8:	3cfd                	addiw	s9,s9,-1
  8004da:	9902                	jalr	s2
  8004dc:	fe0c9ce3          	bnez	s9,8004d4 <vprintfmt+0x30e>
  8004e0:	00044783          	lbu	a5,0(s0)
  8004e4:	0007851b          	sext.w	a0,a5
  8004e8:	ea079de3          	bnez	a5,8003a2 <vprintfmt+0x1dc>
  8004ec:	6a22                	ld	s4,8(sp)
  8004ee:	b331                	j	8001fa <vprintfmt+0x34>
  8004f0:	85ea                	mv	a1,s10
  8004f2:	00000517          	auipc	a0,0x0
  8004f6:	18e50513          	addi	a0,a0,398 # 800680 <main+0x124>
  8004fa:	046000ef          	jal	800540 <strnlen>
  8004fe:	40ac8cbb          	subw	s9,s9,a0
  800502:	00000417          	auipc	s0,0x0
  800506:	17e40413          	addi	s0,s0,382 # 800680 <main+0x124>
  80050a:	00000a17          	auipc	s4,0x0
  80050e:	177a0a13          	addi	s4,s4,375 # 800681 <main+0x125>
  800512:	02800793          	li	a5,40
  800516:	02800513          	li	a0,40
  80051a:	fb904ce3          	bgtz	s9,8004d2 <vprintfmt+0x30c>
  80051e:	b551                	j	8003a2 <vprintfmt+0x1dc>

0000000000800520 <printfmt>:
  800520:	715d                	addi	sp,sp,-80
  800522:	02810313          	addi	t1,sp,40
  800526:	f436                	sd	a3,40(sp)
  800528:	869a                	mv	a3,t1
  80052a:	ec06                	sd	ra,24(sp)
  80052c:	f83a                	sd	a4,48(sp)
  80052e:	fc3e                	sd	a5,56(sp)
  800530:	e0c2                	sd	a6,64(sp)
  800532:	e4c6                	sd	a7,72(sp)
  800534:	e41a                	sd	t1,8(sp)
  800536:	c91ff0ef          	jal	8001c6 <vprintfmt>
  80053a:	60e2                	ld	ra,24(sp)
  80053c:	6161                	addi	sp,sp,80
  80053e:	8082                	ret

0000000000800540 <strnlen>:
  800540:	4781                	li	a5,0
  800542:	e589                	bnez	a1,80054c <strnlen+0xc>
  800544:	a811                	j	800558 <strnlen+0x18>
  800546:	0785                	addi	a5,a5,1
  800548:	00f58863          	beq	a1,a5,800558 <strnlen+0x18>
  80054c:	00f50733          	add	a4,a0,a5
  800550:	00074703          	lbu	a4,0(a4)
  800554:	fb6d                	bnez	a4,800546 <strnlen+0x6>
  800556:	85be                	mv	a1,a5
  800558:	852e                	mv	a0,a1
  80055a:	8082                	ret

000000000080055c <main>:
  80055c:	1141                	addi	sp,sp,-16
  80055e:	00000517          	auipc	a0,0x0
  800562:	20250513          	addi	a0,a0,514 # 800760 <main+0x204>
  800566:	e406                	sd	ra,8(sp)
  800568:	e022                	sd	s0,0(sp)
  80056a:	b37ff0ef          	jal	8000a0 <cprintf>
  80056e:	bd7ff0ef          	jal	800144 <fork>
  800572:	e901                	bnez	a0,800582 <main+0x26>
  800574:	00000517          	auipc	a0,0x0
  800578:	21450513          	addi	a0,a0,532 # 800788 <main+0x22c>
  80057c:	b25ff0ef          	jal	8000a0 <cprintf>
  800580:	a001                	j	800580 <main+0x24>
  800582:	842a                	mv	s0,a0
  800584:	00000517          	auipc	a0,0x0
  800588:	22450513          	addi	a0,a0,548 # 8007a8 <main+0x24c>
  80058c:	b15ff0ef          	jal	8000a0 <cprintf>
  800590:	bb9ff0ef          	jal	800148 <yield>
  800594:	bb5ff0ef          	jal	800148 <yield>
  800598:	bb1ff0ef          	jal	800148 <yield>
  80059c:	00000517          	auipc	a0,0x0
  8005a0:	23450513          	addi	a0,a0,564 # 8007d0 <main+0x274>
  8005a4:	afdff0ef          	jal	8000a0 <cprintf>
  8005a8:	8522                	mv	a0,s0
  8005aa:	ba1ff0ef          	jal	80014a <kill>
  8005ae:	ed31                	bnez	a0,80060a <main+0xae>
  8005b0:	4581                	li	a1,0
  8005b2:	00000517          	auipc	a0,0x0
  8005b6:	28650513          	addi	a0,a0,646 # 800838 <main+0x2dc>
  8005ba:	ae7ff0ef          	jal	8000a0 <cprintf>
  8005be:	4581                	li	a1,0
  8005c0:	8522                	mv	a0,s0
  8005c2:	b85ff0ef          	jal	800146 <waitpid>
  8005c6:	e11d                	bnez	a0,8005ec <main+0x90>
  8005c8:	4581                	li	a1,0
  8005ca:	00000517          	auipc	a0,0x0
  8005ce:	2a650513          	addi	a0,a0,678 # 800870 <main+0x314>
  8005d2:	acfff0ef          	jal	8000a0 <cprintf>
  8005d6:	00000517          	auipc	a0,0x0
  8005da:	2b250513          	addi	a0,a0,690 # 800888 <main+0x32c>
  8005de:	ac3ff0ef          	jal	8000a0 <cprintf>
  8005e2:	60a2                	ld	ra,8(sp)
  8005e4:	6402                	ld	s0,0(sp)
  8005e6:	4501                	li	a0,0
  8005e8:	0141                	addi	sp,sp,16
  8005ea:	8082                	ret
  8005ec:	00000697          	auipc	a3,0x0
  8005f0:	26468693          	addi	a3,a3,612 # 800850 <main+0x2f4>
  8005f4:	00000617          	auipc	a2,0x0
  8005f8:	21c60613          	addi	a2,a2,540 # 800810 <main+0x2b4>
  8005fc:	45dd                	li	a1,23
  8005fe:	00000517          	auipc	a0,0x0
  800602:	22a50513          	addi	a0,a0,554 # 800828 <main+0x2cc>
  800606:	a21ff0ef          	jal	800026 <__panic>
  80060a:	00000697          	auipc	a3,0x0
  80060e:	1ee68693          	addi	a3,a3,494 # 8007f8 <main+0x29c>
  800612:	00000617          	auipc	a2,0x0
  800616:	1fe60613          	addi	a2,a2,510 # 800810 <main+0x2b4>
  80061a:	45d1                	li	a1,20
  80061c:	00000517          	auipc	a0,0x0
  800620:	20c50513          	addi	a0,a0,524 # 800828 <main+0x2cc>
  800624:	a03ff0ef          	jal	800026 <__panic>
