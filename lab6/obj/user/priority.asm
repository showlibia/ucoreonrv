
obj/__user_priority.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	140000ef          	jal	800160 <umain>
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
  800038:	71450513          	addi	a0,a0,1812 # 800748 <main+0x1c6>
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
  800058:	71450513          	addi	a0,a0,1812 # 800768 <main+0x1e6>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0d8000ef          	jal	80013a <exit>

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
  800094:	146000ef          	jal	8001da <vprintfmt>
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
  8000c8:	112000ef          	jal	8001da <vprintfmt>
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

000000000080011e <sys_kill>:
  80011e:	85aa                	mv	a1,a0
  800120:	4531                	li	a0,12
  800122:	bf4d                	j	8000d4 <syscall>

0000000000800124 <sys_getpid>:
  800124:	4549                	li	a0,18
  800126:	b77d                	j	8000d4 <syscall>

0000000000800128 <sys_putc>:
  800128:	85aa                	mv	a1,a0
  80012a:	4579                	li	a0,30
  80012c:	b765                	j	8000d4 <syscall>

000000000080012e <sys_gettime>:
  80012e:	4545                	li	a0,17
  800130:	b755                	j	8000d4 <syscall>

0000000000800132 <sys_lab6_set_priority>:
  800132:	85aa                	mv	a1,a0
  800134:	0ff00513          	li	a0,255
  800138:	bf71                	j	8000d4 <syscall>

000000000080013a <exit>:
  80013a:	1141                	addi	sp,sp,-16
  80013c:	e406                	sd	ra,8(sp)
  80013e:	fcfff0ef          	jal	80010c <sys_exit>
  800142:	00000517          	auipc	a0,0x0
  800146:	62e50513          	addi	a0,a0,1582 # 800770 <main+0x1ee>
  80014a:	f57ff0ef          	jal	8000a0 <cprintf>
  80014e:	a001                	j	80014e <exit+0x14>

0000000000800150 <fork>:
  800150:	b7c9                	j	800112 <sys_fork>

0000000000800152 <waitpid>:
  800152:	b7d1                	j	800116 <sys_wait>

0000000000800154 <kill>:
  800154:	b7e9                	j	80011e <sys_kill>

0000000000800156 <getpid>:
  800156:	b7f9                	j	800124 <sys_getpid>

0000000000800158 <gettime_msec>:
  800158:	bfd9                	j	80012e <sys_gettime>

000000000080015a <lab6_setpriority>:
  80015a:	1502                	slli	a0,a0,0x20
  80015c:	9101                	srli	a0,a0,0x20
  80015e:	bfd1                	j	800132 <sys_lab6_set_priority>

0000000000800160 <umain>:
  800160:	1141                	addi	sp,sp,-16
  800162:	e406                	sd	ra,8(sp)
  800164:	41e000ef          	jal	800582 <main>
  800168:	fd3ff0ef          	jal	80013a <exit>

000000000080016c <printnum>:
  80016c:	02069813          	slli	a6,a3,0x20
  800170:	7179                	addi	sp,sp,-48
  800172:	02085813          	srli	a6,a6,0x20
  800176:	e052                	sd	s4,0(sp)
  800178:	03067a33          	remu	s4,a2,a6
  80017c:	f022                	sd	s0,32(sp)
  80017e:	ec26                	sd	s1,24(sp)
  800180:	e84a                	sd	s2,16(sp)
  800182:	f406                	sd	ra,40(sp)
  800184:	84aa                	mv	s1,a0
  800186:	892e                	mv	s2,a1
  800188:	fff7041b          	addiw	s0,a4,-1
  80018c:	2a01                	sext.w	s4,s4
  80018e:	05067063          	bgeu	a2,a6,8001ce <printnum+0x62>
  800192:	e44e                	sd	s3,8(sp)
  800194:	89be                	mv	s3,a5
  800196:	4785                	li	a5,1
  800198:	00e7d763          	bge	a5,a4,8001a6 <printnum+0x3a>
  80019c:	85ca                	mv	a1,s2
  80019e:	854e                	mv	a0,s3
  8001a0:	347d                	addiw	s0,s0,-1
  8001a2:	9482                	jalr	s1
  8001a4:	fc65                	bnez	s0,80019c <printnum+0x30>
  8001a6:	69a2                	ld	s3,8(sp)
  8001a8:	1a02                	slli	s4,s4,0x20
  8001aa:	020a5a13          	srli	s4,s4,0x20
  8001ae:	00000797          	auipc	a5,0x0
  8001b2:	5da78793          	addi	a5,a5,1498 # 800788 <main+0x206>
  8001b6:	97d2                	add	a5,a5,s4
  8001b8:	7402                	ld	s0,32(sp)
  8001ba:	0007c503          	lbu	a0,0(a5)
  8001be:	70a2                	ld	ra,40(sp)
  8001c0:	6a02                	ld	s4,0(sp)
  8001c2:	85ca                	mv	a1,s2
  8001c4:	87a6                	mv	a5,s1
  8001c6:	6942                	ld	s2,16(sp)
  8001c8:	64e2                	ld	s1,24(sp)
  8001ca:	6145                	addi	sp,sp,48
  8001cc:	8782                	jr	a5
  8001ce:	03065633          	divu	a2,a2,a6
  8001d2:	8722                	mv	a4,s0
  8001d4:	f99ff0ef          	jal	80016c <printnum>
  8001d8:	bfc1                	j	8001a8 <printnum+0x3c>

00000000008001da <vprintfmt>:
  8001da:	7119                	addi	sp,sp,-128
  8001dc:	f4a6                	sd	s1,104(sp)
  8001de:	f0ca                	sd	s2,96(sp)
  8001e0:	ecce                	sd	s3,88(sp)
  8001e2:	e8d2                	sd	s4,80(sp)
  8001e4:	e4d6                	sd	s5,72(sp)
  8001e6:	e0da                	sd	s6,64(sp)
  8001e8:	f862                	sd	s8,48(sp)
  8001ea:	fc86                	sd	ra,120(sp)
  8001ec:	f8a2                	sd	s0,112(sp)
  8001ee:	fc5e                	sd	s7,56(sp)
  8001f0:	f466                	sd	s9,40(sp)
  8001f2:	f06a                	sd	s10,32(sp)
  8001f4:	ec6e                	sd	s11,24(sp)
  8001f6:	892a                	mv	s2,a0
  8001f8:	84ae                	mv	s1,a1
  8001fa:	8c32                	mv	s8,a2
  8001fc:	8a36                	mv	s4,a3
  8001fe:	02500993          	li	s3,37
  800202:	05500b13          	li	s6,85
  800206:	00000a97          	auipc	s5,0x0
  80020a:	742a8a93          	addi	s5,s5,1858 # 800948 <main+0x3c6>
  80020e:	000c4503          	lbu	a0,0(s8)
  800212:	001c0413          	addi	s0,s8,1
  800216:	01350a63          	beq	a0,s3,80022a <vprintfmt+0x50>
  80021a:	cd0d                	beqz	a0,800254 <vprintfmt+0x7a>
  80021c:	85a6                	mv	a1,s1
  80021e:	9902                	jalr	s2
  800220:	00044503          	lbu	a0,0(s0)
  800224:	0405                	addi	s0,s0,1
  800226:	ff351ae3          	bne	a0,s3,80021a <vprintfmt+0x40>
  80022a:	02000d93          	li	s11,32
  80022e:	4b81                	li	s7,0
  800230:	4601                	li	a2,0
  800232:	5d7d                	li	s10,-1
  800234:	5cfd                	li	s9,-1
  800236:	00044683          	lbu	a3,0(s0)
  80023a:	00140c13          	addi	s8,s0,1
  80023e:	fdd6859b          	addiw	a1,a3,-35
  800242:	0ff5f593          	zext.b	a1,a1
  800246:	02bb6663          	bltu	s6,a1,800272 <vprintfmt+0x98>
  80024a:	058a                	slli	a1,a1,0x2
  80024c:	95d6                	add	a1,a1,s5
  80024e:	4198                	lw	a4,0(a1)
  800250:	9756                	add	a4,a4,s5
  800252:	8702                	jr	a4
  800254:	70e6                	ld	ra,120(sp)
  800256:	7446                	ld	s0,112(sp)
  800258:	74a6                	ld	s1,104(sp)
  80025a:	7906                	ld	s2,96(sp)
  80025c:	69e6                	ld	s3,88(sp)
  80025e:	6a46                	ld	s4,80(sp)
  800260:	6aa6                	ld	s5,72(sp)
  800262:	6b06                	ld	s6,64(sp)
  800264:	7be2                	ld	s7,56(sp)
  800266:	7c42                	ld	s8,48(sp)
  800268:	7ca2                	ld	s9,40(sp)
  80026a:	7d02                	ld	s10,32(sp)
  80026c:	6de2                	ld	s11,24(sp)
  80026e:	6109                	addi	sp,sp,128
  800270:	8082                	ret
  800272:	85a6                	mv	a1,s1
  800274:	02500513          	li	a0,37
  800278:	9902                	jalr	s2
  80027a:	fff44703          	lbu	a4,-1(s0)
  80027e:	02500793          	li	a5,37
  800282:	8c22                	mv	s8,s0
  800284:	f8f705e3          	beq	a4,a5,80020e <vprintfmt+0x34>
  800288:	02500713          	li	a4,37
  80028c:	ffec4783          	lbu	a5,-2(s8)
  800290:	1c7d                	addi	s8,s8,-1
  800292:	fee79de3          	bne	a5,a4,80028c <vprintfmt+0xb2>
  800296:	bfa5                	j	80020e <vprintfmt+0x34>
  800298:	00144783          	lbu	a5,1(s0)
  80029c:	4725                	li	a4,9
  80029e:	fd068d1b          	addiw	s10,a3,-48
  8002a2:	fd07859b          	addiw	a1,a5,-48
  8002a6:	0007869b          	sext.w	a3,a5
  8002aa:	8462                	mv	s0,s8
  8002ac:	02b76563          	bltu	a4,a1,8002d6 <vprintfmt+0xfc>
  8002b0:	4525                	li	a0,9
  8002b2:	00144783          	lbu	a5,1(s0)
  8002b6:	002d171b          	slliw	a4,s10,0x2
  8002ba:	01a7073b          	addw	a4,a4,s10
  8002be:	0017171b          	slliw	a4,a4,0x1
  8002c2:	9f35                	addw	a4,a4,a3
  8002c4:	fd07859b          	addiw	a1,a5,-48
  8002c8:	0405                	addi	s0,s0,1
  8002ca:	fd070d1b          	addiw	s10,a4,-48
  8002ce:	0007869b          	sext.w	a3,a5
  8002d2:	feb570e3          	bgeu	a0,a1,8002b2 <vprintfmt+0xd8>
  8002d6:	f60cd0e3          	bgez	s9,800236 <vprintfmt+0x5c>
  8002da:	8cea                	mv	s9,s10
  8002dc:	5d7d                	li	s10,-1
  8002de:	bfa1                	j	800236 <vprintfmt+0x5c>
  8002e0:	8db6                	mv	s11,a3
  8002e2:	8462                	mv	s0,s8
  8002e4:	bf89                	j	800236 <vprintfmt+0x5c>
  8002e6:	8462                	mv	s0,s8
  8002e8:	4b85                	li	s7,1
  8002ea:	b7b1                	j	800236 <vprintfmt+0x5c>
  8002ec:	4785                	li	a5,1
  8002ee:	008a0713          	addi	a4,s4,8
  8002f2:	00c7c463          	blt	a5,a2,8002fa <vprintfmt+0x120>
  8002f6:	1a060163          	beqz	a2,800498 <vprintfmt+0x2be>
  8002fa:	000a3603          	ld	a2,0(s4)
  8002fe:	46c1                	li	a3,16
  800300:	8a3a                	mv	s4,a4
  800302:	000d879b          	sext.w	a5,s11
  800306:	8766                	mv	a4,s9
  800308:	85a6                	mv	a1,s1
  80030a:	854a                	mv	a0,s2
  80030c:	e61ff0ef          	jal	80016c <printnum>
  800310:	bdfd                	j	80020e <vprintfmt+0x34>
  800312:	000a2503          	lw	a0,0(s4)
  800316:	85a6                	mv	a1,s1
  800318:	0a21                	addi	s4,s4,8
  80031a:	9902                	jalr	s2
  80031c:	bdcd                	j	80020e <vprintfmt+0x34>
  80031e:	4785                	li	a5,1
  800320:	008a0713          	addi	a4,s4,8
  800324:	00c7c463          	blt	a5,a2,80032c <vprintfmt+0x152>
  800328:	16060363          	beqz	a2,80048e <vprintfmt+0x2b4>
  80032c:	000a3603          	ld	a2,0(s4)
  800330:	46a9                	li	a3,10
  800332:	8a3a                	mv	s4,a4
  800334:	b7f9                	j	800302 <vprintfmt+0x128>
  800336:	85a6                	mv	a1,s1
  800338:	03000513          	li	a0,48
  80033c:	9902                	jalr	s2
  80033e:	85a6                	mv	a1,s1
  800340:	07800513          	li	a0,120
  800344:	9902                	jalr	s2
  800346:	000a3603          	ld	a2,0(s4)
  80034a:	46c1                	li	a3,16
  80034c:	0a21                	addi	s4,s4,8
  80034e:	bf55                	j	800302 <vprintfmt+0x128>
  800350:	85a6                	mv	a1,s1
  800352:	02500513          	li	a0,37
  800356:	9902                	jalr	s2
  800358:	bd5d                	j	80020e <vprintfmt+0x34>
  80035a:	000a2d03          	lw	s10,0(s4)
  80035e:	8462                	mv	s0,s8
  800360:	0a21                	addi	s4,s4,8
  800362:	bf95                	j	8002d6 <vprintfmt+0xfc>
  800364:	4785                	li	a5,1
  800366:	008a0713          	addi	a4,s4,8
  80036a:	00c7c463          	blt	a5,a2,800372 <vprintfmt+0x198>
  80036e:	10060b63          	beqz	a2,800484 <vprintfmt+0x2aa>
  800372:	000a3603          	ld	a2,0(s4)
  800376:	46a1                	li	a3,8
  800378:	8a3a                	mv	s4,a4
  80037a:	b761                	j	800302 <vprintfmt+0x128>
  80037c:	fffcc793          	not	a5,s9
  800380:	97fd                	srai	a5,a5,0x3f
  800382:	00fcf7b3          	and	a5,s9,a5
  800386:	00078c9b          	sext.w	s9,a5
  80038a:	8462                	mv	s0,s8
  80038c:	b56d                	j	800236 <vprintfmt+0x5c>
  80038e:	000a3403          	ld	s0,0(s4)
  800392:	008a0793          	addi	a5,s4,8
  800396:	e43e                	sd	a5,8(sp)
  800398:	12040063          	beqz	s0,8004b8 <vprintfmt+0x2de>
  80039c:	0d905963          	blez	s9,80046e <vprintfmt+0x294>
  8003a0:	02d00793          	li	a5,45
  8003a4:	00140a13          	addi	s4,s0,1
  8003a8:	12fd9763          	bne	s11,a5,8004d6 <vprintfmt+0x2fc>
  8003ac:	00044783          	lbu	a5,0(s0)
  8003b0:	0007851b          	sext.w	a0,a5
  8003b4:	cb9d                	beqz	a5,8003ea <vprintfmt+0x210>
  8003b6:	547d                	li	s0,-1
  8003b8:	05e00d93          	li	s11,94
  8003bc:	000d4563          	bltz	s10,8003c6 <vprintfmt+0x1ec>
  8003c0:	3d7d                	addiw	s10,s10,-1
  8003c2:	028d0263          	beq	s10,s0,8003e6 <vprintfmt+0x20c>
  8003c6:	85a6                	mv	a1,s1
  8003c8:	0c0b8d63          	beqz	s7,8004a2 <vprintfmt+0x2c8>
  8003cc:	3781                	addiw	a5,a5,-32
  8003ce:	0cfdfa63          	bgeu	s11,a5,8004a2 <vprintfmt+0x2c8>
  8003d2:	03f00513          	li	a0,63
  8003d6:	9902                	jalr	s2
  8003d8:	000a4783          	lbu	a5,0(s4)
  8003dc:	3cfd                	addiw	s9,s9,-1
  8003de:	0a05                	addi	s4,s4,1
  8003e0:	0007851b          	sext.w	a0,a5
  8003e4:	ffe1                	bnez	a5,8003bc <vprintfmt+0x1e2>
  8003e6:	01905963          	blez	s9,8003f8 <vprintfmt+0x21e>
  8003ea:	85a6                	mv	a1,s1
  8003ec:	02000513          	li	a0,32
  8003f0:	3cfd                	addiw	s9,s9,-1
  8003f2:	9902                	jalr	s2
  8003f4:	fe0c9be3          	bnez	s9,8003ea <vprintfmt+0x210>
  8003f8:	6a22                	ld	s4,8(sp)
  8003fa:	bd11                	j	80020e <vprintfmt+0x34>
  8003fc:	4785                	li	a5,1
  8003fe:	008a0b93          	addi	s7,s4,8
  800402:	00c7c363          	blt	a5,a2,800408 <vprintfmt+0x22e>
  800406:	ce25                	beqz	a2,80047e <vprintfmt+0x2a4>
  800408:	000a3403          	ld	s0,0(s4)
  80040c:	08044d63          	bltz	s0,8004a6 <vprintfmt+0x2cc>
  800410:	8622                	mv	a2,s0
  800412:	8a5e                	mv	s4,s7
  800414:	46a9                	li	a3,10
  800416:	b5f5                	j	800302 <vprintfmt+0x128>
  800418:	000a2783          	lw	a5,0(s4)
  80041c:	4661                	li	a2,24
  80041e:	41f7d71b          	sraiw	a4,a5,0x1f
  800422:	8fb9                	xor	a5,a5,a4
  800424:	40e786bb          	subw	a3,a5,a4
  800428:	02d64663          	blt	a2,a3,800454 <vprintfmt+0x27a>
  80042c:	00369713          	slli	a4,a3,0x3
  800430:	00000797          	auipc	a5,0x0
  800434:	67078793          	addi	a5,a5,1648 # 800aa0 <error_string>
  800438:	97ba                	add	a5,a5,a4
  80043a:	639c                	ld	a5,0(a5)
  80043c:	cf81                	beqz	a5,800454 <vprintfmt+0x27a>
  80043e:	86be                	mv	a3,a5
  800440:	00000617          	auipc	a2,0x0
  800444:	37860613          	addi	a2,a2,888 # 8007b8 <main+0x236>
  800448:	85a6                	mv	a1,s1
  80044a:	854a                	mv	a0,s2
  80044c:	0e8000ef          	jal	800534 <printfmt>
  800450:	0a21                	addi	s4,s4,8
  800452:	bb75                	j	80020e <vprintfmt+0x34>
  800454:	00000617          	auipc	a2,0x0
  800458:	35460613          	addi	a2,a2,852 # 8007a8 <main+0x226>
  80045c:	85a6                	mv	a1,s1
  80045e:	854a                	mv	a0,s2
  800460:	0d4000ef          	jal	800534 <printfmt>
  800464:	0a21                	addi	s4,s4,8
  800466:	b365                	j	80020e <vprintfmt+0x34>
  800468:	2605                	addiw	a2,a2,1
  80046a:	8462                	mv	s0,s8
  80046c:	b3e9                	j	800236 <vprintfmt+0x5c>
  80046e:	00044783          	lbu	a5,0(s0)
  800472:	0007851b          	sext.w	a0,a5
  800476:	d3c9                	beqz	a5,8003f8 <vprintfmt+0x21e>
  800478:	00140a13          	addi	s4,s0,1
  80047c:	bf2d                	j	8003b6 <vprintfmt+0x1dc>
  80047e:	000a2403          	lw	s0,0(s4)
  800482:	b769                	j	80040c <vprintfmt+0x232>
  800484:	000a6603          	lwu	a2,0(s4)
  800488:	46a1                	li	a3,8
  80048a:	8a3a                	mv	s4,a4
  80048c:	bd9d                	j	800302 <vprintfmt+0x128>
  80048e:	000a6603          	lwu	a2,0(s4)
  800492:	46a9                	li	a3,10
  800494:	8a3a                	mv	s4,a4
  800496:	b5b5                	j	800302 <vprintfmt+0x128>
  800498:	000a6603          	lwu	a2,0(s4)
  80049c:	46c1                	li	a3,16
  80049e:	8a3a                	mv	s4,a4
  8004a0:	b58d                	j	800302 <vprintfmt+0x128>
  8004a2:	9902                	jalr	s2
  8004a4:	bf15                	j	8003d8 <vprintfmt+0x1fe>
  8004a6:	85a6                	mv	a1,s1
  8004a8:	02d00513          	li	a0,45
  8004ac:	9902                	jalr	s2
  8004ae:	40800633          	neg	a2,s0
  8004b2:	8a5e                	mv	s4,s7
  8004b4:	46a9                	li	a3,10
  8004b6:	b5b1                	j	800302 <vprintfmt+0x128>
  8004b8:	01905663          	blez	s9,8004c4 <vprintfmt+0x2ea>
  8004bc:	02d00793          	li	a5,45
  8004c0:	04fd9263          	bne	s11,a5,800504 <vprintfmt+0x32a>
  8004c4:	02800793          	li	a5,40
  8004c8:	00000a17          	auipc	s4,0x0
  8004cc:	2d9a0a13          	addi	s4,s4,729 # 8007a1 <main+0x21f>
  8004d0:	02800513          	li	a0,40
  8004d4:	b5cd                	j	8003b6 <vprintfmt+0x1dc>
  8004d6:	85ea                	mv	a1,s10
  8004d8:	8522                	mv	a0,s0
  8004da:	07a000ef          	jal	800554 <strnlen>
  8004de:	40ac8cbb          	subw	s9,s9,a0
  8004e2:	01905963          	blez	s9,8004f4 <vprintfmt+0x31a>
  8004e6:	2d81                	sext.w	s11,s11
  8004e8:	85a6                	mv	a1,s1
  8004ea:	856e                	mv	a0,s11
  8004ec:	3cfd                	addiw	s9,s9,-1
  8004ee:	9902                	jalr	s2
  8004f0:	fe0c9ce3          	bnez	s9,8004e8 <vprintfmt+0x30e>
  8004f4:	00044783          	lbu	a5,0(s0)
  8004f8:	0007851b          	sext.w	a0,a5
  8004fc:	ea079de3          	bnez	a5,8003b6 <vprintfmt+0x1dc>
  800500:	6a22                	ld	s4,8(sp)
  800502:	b331                	j	80020e <vprintfmt+0x34>
  800504:	85ea                	mv	a1,s10
  800506:	00000517          	auipc	a0,0x0
  80050a:	29a50513          	addi	a0,a0,666 # 8007a0 <main+0x21e>
  80050e:	046000ef          	jal	800554 <strnlen>
  800512:	40ac8cbb          	subw	s9,s9,a0
  800516:	00000417          	auipc	s0,0x0
  80051a:	28a40413          	addi	s0,s0,650 # 8007a0 <main+0x21e>
  80051e:	00000a17          	auipc	s4,0x0
  800522:	283a0a13          	addi	s4,s4,643 # 8007a1 <main+0x21f>
  800526:	02800793          	li	a5,40
  80052a:	02800513          	li	a0,40
  80052e:	fb904ce3          	bgtz	s9,8004e6 <vprintfmt+0x30c>
  800532:	b551                	j	8003b6 <vprintfmt+0x1dc>

0000000000800534 <printfmt>:
  800534:	715d                	addi	sp,sp,-80
  800536:	02810313          	addi	t1,sp,40
  80053a:	f436                	sd	a3,40(sp)
  80053c:	869a                	mv	a3,t1
  80053e:	ec06                	sd	ra,24(sp)
  800540:	f83a                	sd	a4,48(sp)
  800542:	fc3e                	sd	a5,56(sp)
  800544:	e0c2                	sd	a6,64(sp)
  800546:	e4c6                	sd	a7,72(sp)
  800548:	e41a                	sd	t1,8(sp)
  80054a:	c91ff0ef          	jal	8001da <vprintfmt>
  80054e:	60e2                	ld	ra,24(sp)
  800550:	6161                	addi	sp,sp,80
  800552:	8082                	ret

0000000000800554 <strnlen>:
  800554:	4781                	li	a5,0
  800556:	e589                	bnez	a1,800560 <strnlen+0xc>
  800558:	a811                	j	80056c <strnlen+0x18>
  80055a:	0785                	addi	a5,a5,1
  80055c:	00f58863          	beq	a1,a5,80056c <strnlen+0x18>
  800560:	00f50733          	add	a4,a0,a5
  800564:	00074703          	lbu	a4,0(a4)
  800568:	fb6d                	bnez	a4,80055a <strnlen+0x6>
  80056a:	85be                	mv	a1,a5
  80056c:	852e                	mv	a0,a1
  80056e:	8082                	ret

0000000000800570 <memset>:
  800570:	ca01                	beqz	a2,800580 <memset+0x10>
  800572:	962a                	add	a2,a2,a0
  800574:	87aa                	mv	a5,a0
  800576:	0785                	addi	a5,a5,1
  800578:	feb78fa3          	sb	a1,-1(a5)
  80057c:	fef61de3          	bne	a2,a5,800576 <memset+0x6>
  800580:	8082                	ret

0000000000800582 <main>:
  800582:	711d                	addi	sp,sp,-96
  800584:	4651                	li	a2,20
  800586:	4581                	li	a1,0
  800588:	00001517          	auipc	a0,0x1
  80058c:	a7850513          	addi	a0,a0,-1416 # 801000 <pids>
  800590:	ec86                	sd	ra,88(sp)
  800592:	e8a2                	sd	s0,80(sp)
  800594:	e4a6                	sd	s1,72(sp)
  800596:	e0ca                	sd	s2,64(sp)
  800598:	fc4e                	sd	s3,56(sp)
  80059a:	f852                	sd	s4,48(sp)
  80059c:	f456                	sd	s5,40(sp)
  80059e:	f05a                	sd	s6,32(sp)
  8005a0:	ec5e                	sd	s7,24(sp)
  8005a2:	fcfff0ef          	jal	800570 <memset>
  8005a6:	4519                	li	a0,6
  8005a8:	00001a97          	auipc	s5,0x1
  8005ac:	a88a8a93          	addi	s5,s5,-1400 # 801030 <acc>
  8005b0:	00001917          	auipc	s2,0x1
  8005b4:	a5090913          	addi	s2,s2,-1456 # 801000 <pids>
  8005b8:	ba3ff0ef          	jal	80015a <lab6_setpriority>
  8005bc:	89d6                	mv	s3,s5
  8005be:	84ca                	mv	s1,s2
  8005c0:	4401                	li	s0,0
  8005c2:	4a15                	li	s4,5
  8005c4:	0009a023          	sw	zero,0(s3)
  8005c8:	b89ff0ef          	jal	800150 <fork>
  8005cc:	c088                	sw	a0,0(s1)
  8005ce:	c969                	beqz	a0,8006a0 <main+0x11e>
  8005d0:	14054063          	bltz	a0,800710 <main+0x18e>
  8005d4:	2405                	addiw	s0,s0,1
  8005d6:	0991                	addi	s3,s3,4
  8005d8:	0491                	addi	s1,s1,4
  8005da:	ff4415e3          	bne	s0,s4,8005c4 <main+0x42>
  8005de:	00001497          	auipc	s1,0x1
  8005e2:	a3a48493          	addi	s1,s1,-1478 # 801018 <status>
  8005e6:	00000517          	auipc	a0,0x0
  8005ea:	2ba50513          	addi	a0,a0,698 # 8008a0 <main+0x31e>
  8005ee:	ab3ff0ef          	jal	8000a0 <cprintf>
  8005f2:	00001997          	auipc	s3,0x1
  8005f6:	a3a98993          	addi	s3,s3,-1478 # 80102c <status+0x14>
  8005fa:	8a26                	mv	s4,s1
  8005fc:	8426                	mv	s0,s1
  8005fe:	00000b97          	auipc	s7,0x0
  800602:	2cab8b93          	addi	s7,s7,714 # 8008c8 <main+0x346>
  800606:	00092503          	lw	a0,0(s2)
  80060a:	85a2                	mv	a1,s0
  80060c:	00042023          	sw	zero,0(s0)
  800610:	b43ff0ef          	jal	800152 <waitpid>
  800614:	00092a83          	lw	s5,0(s2)
  800618:	00042b03          	lw	s6,0(s0)
  80061c:	b3dff0ef          	jal	800158 <gettime_msec>
  800620:	0005069b          	sext.w	a3,a0
  800624:	865a                	mv	a2,s6
  800626:	85d6                	mv	a1,s5
  800628:	855e                	mv	a0,s7
  80062a:	0411                	addi	s0,s0,4
  80062c:	a75ff0ef          	jal	8000a0 <cprintf>
  800630:	0911                	addi	s2,s2,4
  800632:	fd341ae3          	bne	s0,s3,800606 <main+0x84>
  800636:	00000517          	auipc	a0,0x0
  80063a:	2b250513          	addi	a0,a0,690 # 8008e8 <main+0x366>
  80063e:	a63ff0ef          	jal	8000a0 <cprintf>
  800642:	00000517          	auipc	a0,0x0
  800646:	2be50513          	addi	a0,a0,702 # 800900 <main+0x37e>
  80064a:	a57ff0ef          	jal	8000a0 <cprintf>
  80064e:	00000417          	auipc	s0,0x0
  800652:	2d240413          	addi	s0,s0,722 # 800920 <main+0x39e>
  800656:	409c                	lw	a5,0(s1)
  800658:	000a2703          	lw	a4,0(s4)
  80065c:	8522                	mv	a0,s0
  80065e:	0017979b          	slliw	a5,a5,0x1
  800662:	02e7c7bb          	divw	a5,a5,a4
  800666:	0491                	addi	s1,s1,4
  800668:	2785                	addiw	a5,a5,1
  80066a:	01f7d59b          	srliw	a1,a5,0x1f
  80066e:	9dbd                	addw	a1,a1,a5
  800670:	4015d59b          	sraiw	a1,a1,0x1
  800674:	a2dff0ef          	jal	8000a0 <cprintf>
  800678:	fd349fe3          	bne	s1,s3,800656 <main+0xd4>
  80067c:	00000517          	auipc	a0,0x0
  800680:	0ec50513          	addi	a0,a0,236 # 800768 <main+0x1e6>
  800684:	a1dff0ef          	jal	8000a0 <cprintf>
  800688:	60e6                	ld	ra,88(sp)
  80068a:	6446                	ld	s0,80(sp)
  80068c:	64a6                	ld	s1,72(sp)
  80068e:	6906                	ld	s2,64(sp)
  800690:	79e2                	ld	s3,56(sp)
  800692:	7a42                	ld	s4,48(sp)
  800694:	7aa2                	ld	s5,40(sp)
  800696:	7b02                	ld	s6,32(sp)
  800698:	6be2                	ld	s7,24(sp)
  80069a:	4501                	li	a0,0
  80069c:	6125                	addi	sp,sp,96
  80069e:	8082                	ret
  8006a0:	0014051b          	addiw	a0,s0,1
  8006a4:	040a                	slli	s0,s0,0x2
  8006a6:	9aa2                	add	s5,s5,s0
  8006a8:	6909                	lui	s2,0x2
  8006aa:	6405                	lui	s0,0x1
  8006ac:	aafff0ef          	jal	80015a <lab6_setpriority>
  8006b0:	fa04041b          	addiw	s0,s0,-96 # fa0 <_start-0x7ff080>
  8006b4:	000aa023          	sw	zero,0(s5)
  8006b8:	71090913          	addi	s2,s2,1808 # 2710 <_start-0x7fd910>
  8006bc:	000aa683          	lw	a3,0(s5)
  8006c0:	2685                	addiw	a3,a3,1
  8006c2:	0c800713          	li	a4,200
  8006c6:	47b2                	lw	a5,12(sp)
  8006c8:	377d                	addiw	a4,a4,-1
  8006ca:	0017b793          	seqz	a5,a5
  8006ce:	c63e                	sw	a5,12(sp)
  8006d0:	fb7d                	bnez	a4,8006c6 <main+0x144>
  8006d2:	0286f7bb          	remuw	a5,a3,s0
  8006d6:	0016871b          	addiw	a4,a3,1
  8006da:	c399                	beqz	a5,8006e0 <main+0x15e>
  8006dc:	86ba                	mv	a3,a4
  8006de:	b7d5                	j	8006c2 <main+0x140>
  8006e0:	00daa023          	sw	a3,0(s5)
  8006e4:	a75ff0ef          	jal	800158 <gettime_msec>
  8006e8:	0005049b          	sext.w	s1,a0
  8006ec:	fc9958e3          	bge	s2,s1,8006bc <main+0x13a>
  8006f0:	a67ff0ef          	jal	800156 <getpid>
  8006f4:	000aa603          	lw	a2,0(s5)
  8006f8:	85aa                	mv	a1,a0
  8006fa:	86a6                	mv	a3,s1
  8006fc:	00000517          	auipc	a0,0x0
  800700:	18450513          	addi	a0,a0,388 # 800880 <main+0x2fe>
  800704:	99dff0ef          	jal	8000a0 <cprintf>
  800708:	000aa503          	lw	a0,0(s5)
  80070c:	a2fff0ef          	jal	80013a <exit>
  800710:	00001417          	auipc	s0,0x1
  800714:	90440413          	addi	s0,s0,-1788 # 801014 <pids+0x14>
  800718:	00092503          	lw	a0,0(s2)
  80071c:	00a05463          	blez	a0,800724 <main+0x1a2>
  800720:	a35ff0ef          	jal	800154 <kill>
  800724:	0911                	addi	s2,s2,4
  800726:	fe8919e3          	bne	s2,s0,800718 <main+0x196>
  80072a:	00000617          	auipc	a2,0x0
  80072e:	1fe60613          	addi	a2,a2,510 # 800928 <main+0x3a6>
  800732:	04b00593          	li	a1,75
  800736:	00000517          	auipc	a0,0x0
  80073a:	20250513          	addi	a0,a0,514 # 800938 <main+0x3b6>
  80073e:	8e9ff0ef          	jal	800026 <__panic>
