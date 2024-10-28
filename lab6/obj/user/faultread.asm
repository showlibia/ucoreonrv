
obj/__user_faultread.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	0ae000ef          	jal	8000ce <umain>
  800024:	a001                	j	800024 <_start+0x4>

0000000000800026 <cputch>:
  800026:	1141                	addi	sp,sp,-16
  800028:	e022                	sd	s0,0(sp)
  80002a:	e406                	sd	ra,8(sp)
  80002c:	842e                	mv	s0,a1
  80002e:	084000ef          	jal	8000b2 <sys_putc>
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
  800068:	0e0000ef          	jal	800148 <vprintfmt>
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

00000000008000b2 <sys_putc>:
  8000b2:	85aa                	mv	a1,a0
  8000b4:	4579                	li	a0,30
  8000b6:	bf7d                	j	800074 <syscall>

00000000008000b8 <exit>:
  8000b8:	1141                	addi	sp,sp,-16
  8000ba:	e406                	sd	ra,8(sp)
  8000bc:	ff1ff0ef          	jal	8000ac <sys_exit>
  8000c0:	00000517          	auipc	a0,0x0
  8000c4:	42850513          	addi	a0,a0,1064 # 8004e8 <main+0xa>
  8000c8:	f79ff0ef          	jal	800040 <cprintf>
  8000cc:	a001                	j	8000cc <exit+0x14>

00000000008000ce <umain>:
  8000ce:	1141                	addi	sp,sp,-16
  8000d0:	e406                	sd	ra,8(sp)
  8000d2:	40c000ef          	jal	8004de <main>
  8000d6:	fe3ff0ef          	jal	8000b8 <exit>

00000000008000da <printnum>:
  8000da:	02069813          	slli	a6,a3,0x20
  8000de:	7179                	addi	sp,sp,-48
  8000e0:	02085813          	srli	a6,a6,0x20
  8000e4:	e052                	sd	s4,0(sp)
  8000e6:	03067a33          	remu	s4,a2,a6
  8000ea:	f022                	sd	s0,32(sp)
  8000ec:	ec26                	sd	s1,24(sp)
  8000ee:	e84a                	sd	s2,16(sp)
  8000f0:	f406                	sd	ra,40(sp)
  8000f2:	84aa                	mv	s1,a0
  8000f4:	892e                	mv	s2,a1
  8000f6:	fff7041b          	addiw	s0,a4,-1
  8000fa:	2a01                	sext.w	s4,s4
  8000fc:	05067063          	bgeu	a2,a6,80013c <printnum+0x62>
  800100:	e44e                	sd	s3,8(sp)
  800102:	89be                	mv	s3,a5
  800104:	4785                	li	a5,1
  800106:	00e7d763          	bge	a5,a4,800114 <printnum+0x3a>
  80010a:	85ca                	mv	a1,s2
  80010c:	854e                	mv	a0,s3
  80010e:	347d                	addiw	s0,s0,-1
  800110:	9482                	jalr	s1
  800112:	fc65                	bnez	s0,80010a <printnum+0x30>
  800114:	69a2                	ld	s3,8(sp)
  800116:	1a02                	slli	s4,s4,0x20
  800118:	020a5a13          	srli	s4,s4,0x20
  80011c:	00000797          	auipc	a5,0x0
  800120:	3e478793          	addi	a5,a5,996 # 800500 <main+0x22>
  800124:	97d2                	add	a5,a5,s4
  800126:	7402                	ld	s0,32(sp)
  800128:	0007c503          	lbu	a0,0(a5)
  80012c:	70a2                	ld	ra,40(sp)
  80012e:	6a02                	ld	s4,0(sp)
  800130:	85ca                	mv	a1,s2
  800132:	87a6                	mv	a5,s1
  800134:	6942                	ld	s2,16(sp)
  800136:	64e2                	ld	s1,24(sp)
  800138:	6145                	addi	sp,sp,48
  80013a:	8782                	jr	a5
  80013c:	03065633          	divu	a2,a2,a6
  800140:	8722                	mv	a4,s0
  800142:	f99ff0ef          	jal	8000da <printnum>
  800146:	bfc1                	j	800116 <printnum+0x3c>

0000000000800148 <vprintfmt>:
  800148:	7119                	addi	sp,sp,-128
  80014a:	f4a6                	sd	s1,104(sp)
  80014c:	f0ca                	sd	s2,96(sp)
  80014e:	ecce                	sd	s3,88(sp)
  800150:	e8d2                	sd	s4,80(sp)
  800152:	e4d6                	sd	s5,72(sp)
  800154:	e0da                	sd	s6,64(sp)
  800156:	f862                	sd	s8,48(sp)
  800158:	fc86                	sd	ra,120(sp)
  80015a:	f8a2                	sd	s0,112(sp)
  80015c:	fc5e                	sd	s7,56(sp)
  80015e:	f466                	sd	s9,40(sp)
  800160:	f06a                	sd	s10,32(sp)
  800162:	ec6e                	sd	s11,24(sp)
  800164:	892a                	mv	s2,a0
  800166:	84ae                	mv	s1,a1
  800168:	8c32                	mv	s8,a2
  80016a:	8a36                	mv	s4,a3
  80016c:	02500993          	li	s3,37
  800170:	05500b13          	li	s6,85
  800174:	00000a97          	auipc	s5,0x0
  800178:	48ca8a93          	addi	s5,s5,1164 # 800600 <main+0x122>
  80017c:	000c4503          	lbu	a0,0(s8)
  800180:	001c0413          	addi	s0,s8,1
  800184:	01350a63          	beq	a0,s3,800198 <vprintfmt+0x50>
  800188:	cd0d                	beqz	a0,8001c2 <vprintfmt+0x7a>
  80018a:	85a6                	mv	a1,s1
  80018c:	9902                	jalr	s2
  80018e:	00044503          	lbu	a0,0(s0)
  800192:	0405                	addi	s0,s0,1
  800194:	ff351ae3          	bne	a0,s3,800188 <vprintfmt+0x40>
  800198:	02000d93          	li	s11,32
  80019c:	4b81                	li	s7,0
  80019e:	4601                	li	a2,0
  8001a0:	5d7d                	li	s10,-1
  8001a2:	5cfd                	li	s9,-1
  8001a4:	00044683          	lbu	a3,0(s0)
  8001a8:	00140c13          	addi	s8,s0,1
  8001ac:	fdd6859b          	addiw	a1,a3,-35
  8001b0:	0ff5f593          	zext.b	a1,a1
  8001b4:	02bb6663          	bltu	s6,a1,8001e0 <vprintfmt+0x98>
  8001b8:	058a                	slli	a1,a1,0x2
  8001ba:	95d6                	add	a1,a1,s5
  8001bc:	4198                	lw	a4,0(a1)
  8001be:	9756                	add	a4,a4,s5
  8001c0:	8702                	jr	a4
  8001c2:	70e6                	ld	ra,120(sp)
  8001c4:	7446                	ld	s0,112(sp)
  8001c6:	74a6                	ld	s1,104(sp)
  8001c8:	7906                	ld	s2,96(sp)
  8001ca:	69e6                	ld	s3,88(sp)
  8001cc:	6a46                	ld	s4,80(sp)
  8001ce:	6aa6                	ld	s5,72(sp)
  8001d0:	6b06                	ld	s6,64(sp)
  8001d2:	7be2                	ld	s7,56(sp)
  8001d4:	7c42                	ld	s8,48(sp)
  8001d6:	7ca2                	ld	s9,40(sp)
  8001d8:	7d02                	ld	s10,32(sp)
  8001da:	6de2                	ld	s11,24(sp)
  8001dc:	6109                	addi	sp,sp,128
  8001de:	8082                	ret
  8001e0:	85a6                	mv	a1,s1
  8001e2:	02500513          	li	a0,37
  8001e6:	9902                	jalr	s2
  8001e8:	fff44703          	lbu	a4,-1(s0)
  8001ec:	02500793          	li	a5,37
  8001f0:	8c22                	mv	s8,s0
  8001f2:	f8f705e3          	beq	a4,a5,80017c <vprintfmt+0x34>
  8001f6:	02500713          	li	a4,37
  8001fa:	ffec4783          	lbu	a5,-2(s8)
  8001fe:	1c7d                	addi	s8,s8,-1
  800200:	fee79de3          	bne	a5,a4,8001fa <vprintfmt+0xb2>
  800204:	bfa5                	j	80017c <vprintfmt+0x34>
  800206:	00144783          	lbu	a5,1(s0)
  80020a:	4725                	li	a4,9
  80020c:	fd068d1b          	addiw	s10,a3,-48
  800210:	fd07859b          	addiw	a1,a5,-48
  800214:	0007869b          	sext.w	a3,a5
  800218:	8462                	mv	s0,s8
  80021a:	02b76563          	bltu	a4,a1,800244 <vprintfmt+0xfc>
  80021e:	4525                	li	a0,9
  800220:	00144783          	lbu	a5,1(s0)
  800224:	002d171b          	slliw	a4,s10,0x2
  800228:	01a7073b          	addw	a4,a4,s10
  80022c:	0017171b          	slliw	a4,a4,0x1
  800230:	9f35                	addw	a4,a4,a3
  800232:	fd07859b          	addiw	a1,a5,-48
  800236:	0405                	addi	s0,s0,1
  800238:	fd070d1b          	addiw	s10,a4,-48
  80023c:	0007869b          	sext.w	a3,a5
  800240:	feb570e3          	bgeu	a0,a1,800220 <vprintfmt+0xd8>
  800244:	f60cd0e3          	bgez	s9,8001a4 <vprintfmt+0x5c>
  800248:	8cea                	mv	s9,s10
  80024a:	5d7d                	li	s10,-1
  80024c:	bfa1                	j	8001a4 <vprintfmt+0x5c>
  80024e:	8db6                	mv	s11,a3
  800250:	8462                	mv	s0,s8
  800252:	bf89                	j	8001a4 <vprintfmt+0x5c>
  800254:	8462                	mv	s0,s8
  800256:	4b85                	li	s7,1
  800258:	b7b1                	j	8001a4 <vprintfmt+0x5c>
  80025a:	4785                	li	a5,1
  80025c:	008a0713          	addi	a4,s4,8
  800260:	00c7c463          	blt	a5,a2,800268 <vprintfmt+0x120>
  800264:	1a060163          	beqz	a2,800406 <vprintfmt+0x2be>
  800268:	000a3603          	ld	a2,0(s4)
  80026c:	46c1                	li	a3,16
  80026e:	8a3a                	mv	s4,a4
  800270:	000d879b          	sext.w	a5,s11
  800274:	8766                	mv	a4,s9
  800276:	85a6                	mv	a1,s1
  800278:	854a                	mv	a0,s2
  80027a:	e61ff0ef          	jal	8000da <printnum>
  80027e:	bdfd                	j	80017c <vprintfmt+0x34>
  800280:	000a2503          	lw	a0,0(s4)
  800284:	85a6                	mv	a1,s1
  800286:	0a21                	addi	s4,s4,8
  800288:	9902                	jalr	s2
  80028a:	bdcd                	j	80017c <vprintfmt+0x34>
  80028c:	4785                	li	a5,1
  80028e:	008a0713          	addi	a4,s4,8
  800292:	00c7c463          	blt	a5,a2,80029a <vprintfmt+0x152>
  800296:	16060363          	beqz	a2,8003fc <vprintfmt+0x2b4>
  80029a:	000a3603          	ld	a2,0(s4)
  80029e:	46a9                	li	a3,10
  8002a0:	8a3a                	mv	s4,a4
  8002a2:	b7f9                	j	800270 <vprintfmt+0x128>
  8002a4:	85a6                	mv	a1,s1
  8002a6:	03000513          	li	a0,48
  8002aa:	9902                	jalr	s2
  8002ac:	85a6                	mv	a1,s1
  8002ae:	07800513          	li	a0,120
  8002b2:	9902                	jalr	s2
  8002b4:	000a3603          	ld	a2,0(s4)
  8002b8:	46c1                	li	a3,16
  8002ba:	0a21                	addi	s4,s4,8
  8002bc:	bf55                	j	800270 <vprintfmt+0x128>
  8002be:	85a6                	mv	a1,s1
  8002c0:	02500513          	li	a0,37
  8002c4:	9902                	jalr	s2
  8002c6:	bd5d                	j	80017c <vprintfmt+0x34>
  8002c8:	000a2d03          	lw	s10,0(s4)
  8002cc:	8462                	mv	s0,s8
  8002ce:	0a21                	addi	s4,s4,8
  8002d0:	bf95                	j	800244 <vprintfmt+0xfc>
  8002d2:	4785                	li	a5,1
  8002d4:	008a0713          	addi	a4,s4,8
  8002d8:	00c7c463          	blt	a5,a2,8002e0 <vprintfmt+0x198>
  8002dc:	10060b63          	beqz	a2,8003f2 <vprintfmt+0x2aa>
  8002e0:	000a3603          	ld	a2,0(s4)
  8002e4:	46a1                	li	a3,8
  8002e6:	8a3a                	mv	s4,a4
  8002e8:	b761                	j	800270 <vprintfmt+0x128>
  8002ea:	fffcc793          	not	a5,s9
  8002ee:	97fd                	srai	a5,a5,0x3f
  8002f0:	00fcf7b3          	and	a5,s9,a5
  8002f4:	00078c9b          	sext.w	s9,a5
  8002f8:	8462                	mv	s0,s8
  8002fa:	b56d                	j	8001a4 <vprintfmt+0x5c>
  8002fc:	000a3403          	ld	s0,0(s4)
  800300:	008a0793          	addi	a5,s4,8
  800304:	e43e                	sd	a5,8(sp)
  800306:	12040063          	beqz	s0,800426 <vprintfmt+0x2de>
  80030a:	0d905963          	blez	s9,8003dc <vprintfmt+0x294>
  80030e:	02d00793          	li	a5,45
  800312:	00140a13          	addi	s4,s0,1
  800316:	12fd9763          	bne	s11,a5,800444 <vprintfmt+0x2fc>
  80031a:	00044783          	lbu	a5,0(s0)
  80031e:	0007851b          	sext.w	a0,a5
  800322:	cb9d                	beqz	a5,800358 <vprintfmt+0x210>
  800324:	547d                	li	s0,-1
  800326:	05e00d93          	li	s11,94
  80032a:	000d4563          	bltz	s10,800334 <vprintfmt+0x1ec>
  80032e:	3d7d                	addiw	s10,s10,-1
  800330:	028d0263          	beq	s10,s0,800354 <vprintfmt+0x20c>
  800334:	85a6                	mv	a1,s1
  800336:	0c0b8d63          	beqz	s7,800410 <vprintfmt+0x2c8>
  80033a:	3781                	addiw	a5,a5,-32
  80033c:	0cfdfa63          	bgeu	s11,a5,800410 <vprintfmt+0x2c8>
  800340:	03f00513          	li	a0,63
  800344:	9902                	jalr	s2
  800346:	000a4783          	lbu	a5,0(s4)
  80034a:	3cfd                	addiw	s9,s9,-1
  80034c:	0a05                	addi	s4,s4,1
  80034e:	0007851b          	sext.w	a0,a5
  800352:	ffe1                	bnez	a5,80032a <vprintfmt+0x1e2>
  800354:	01905963          	blez	s9,800366 <vprintfmt+0x21e>
  800358:	85a6                	mv	a1,s1
  80035a:	02000513          	li	a0,32
  80035e:	3cfd                	addiw	s9,s9,-1
  800360:	9902                	jalr	s2
  800362:	fe0c9be3          	bnez	s9,800358 <vprintfmt+0x210>
  800366:	6a22                	ld	s4,8(sp)
  800368:	bd11                	j	80017c <vprintfmt+0x34>
  80036a:	4785                	li	a5,1
  80036c:	008a0b93          	addi	s7,s4,8
  800370:	00c7c363          	blt	a5,a2,800376 <vprintfmt+0x22e>
  800374:	ce25                	beqz	a2,8003ec <vprintfmt+0x2a4>
  800376:	000a3403          	ld	s0,0(s4)
  80037a:	08044d63          	bltz	s0,800414 <vprintfmt+0x2cc>
  80037e:	8622                	mv	a2,s0
  800380:	8a5e                	mv	s4,s7
  800382:	46a9                	li	a3,10
  800384:	b5f5                	j	800270 <vprintfmt+0x128>
  800386:	000a2783          	lw	a5,0(s4)
  80038a:	4661                	li	a2,24
  80038c:	41f7d71b          	sraiw	a4,a5,0x1f
  800390:	8fb9                	xor	a5,a5,a4
  800392:	40e786bb          	subw	a3,a5,a4
  800396:	02d64663          	blt	a2,a3,8003c2 <vprintfmt+0x27a>
  80039a:	00369713          	slli	a4,a3,0x3
  80039e:	00000797          	auipc	a5,0x0
  8003a2:	3ba78793          	addi	a5,a5,954 # 800758 <error_string>
  8003a6:	97ba                	add	a5,a5,a4
  8003a8:	639c                	ld	a5,0(a5)
  8003aa:	cf81                	beqz	a5,8003c2 <vprintfmt+0x27a>
  8003ac:	86be                	mv	a3,a5
  8003ae:	00000617          	auipc	a2,0x0
  8003b2:	18a60613          	addi	a2,a2,394 # 800538 <main+0x5a>
  8003b6:	85a6                	mv	a1,s1
  8003b8:	854a                	mv	a0,s2
  8003ba:	0e8000ef          	jal	8004a2 <printfmt>
  8003be:	0a21                	addi	s4,s4,8
  8003c0:	bb75                	j	80017c <vprintfmt+0x34>
  8003c2:	00000617          	auipc	a2,0x0
  8003c6:	16660613          	addi	a2,a2,358 # 800528 <main+0x4a>
  8003ca:	85a6                	mv	a1,s1
  8003cc:	854a                	mv	a0,s2
  8003ce:	0d4000ef          	jal	8004a2 <printfmt>
  8003d2:	0a21                	addi	s4,s4,8
  8003d4:	b365                	j	80017c <vprintfmt+0x34>
  8003d6:	2605                	addiw	a2,a2,1
  8003d8:	8462                	mv	s0,s8
  8003da:	b3e9                	j	8001a4 <vprintfmt+0x5c>
  8003dc:	00044783          	lbu	a5,0(s0)
  8003e0:	0007851b          	sext.w	a0,a5
  8003e4:	d3c9                	beqz	a5,800366 <vprintfmt+0x21e>
  8003e6:	00140a13          	addi	s4,s0,1
  8003ea:	bf2d                	j	800324 <vprintfmt+0x1dc>
  8003ec:	000a2403          	lw	s0,0(s4)
  8003f0:	b769                	j	80037a <vprintfmt+0x232>
  8003f2:	000a6603          	lwu	a2,0(s4)
  8003f6:	46a1                	li	a3,8
  8003f8:	8a3a                	mv	s4,a4
  8003fa:	bd9d                	j	800270 <vprintfmt+0x128>
  8003fc:	000a6603          	lwu	a2,0(s4)
  800400:	46a9                	li	a3,10
  800402:	8a3a                	mv	s4,a4
  800404:	b5b5                	j	800270 <vprintfmt+0x128>
  800406:	000a6603          	lwu	a2,0(s4)
  80040a:	46c1                	li	a3,16
  80040c:	8a3a                	mv	s4,a4
  80040e:	b58d                	j	800270 <vprintfmt+0x128>
  800410:	9902                	jalr	s2
  800412:	bf15                	j	800346 <vprintfmt+0x1fe>
  800414:	85a6                	mv	a1,s1
  800416:	02d00513          	li	a0,45
  80041a:	9902                	jalr	s2
  80041c:	40800633          	neg	a2,s0
  800420:	8a5e                	mv	s4,s7
  800422:	46a9                	li	a3,10
  800424:	b5b1                	j	800270 <vprintfmt+0x128>
  800426:	01905663          	blez	s9,800432 <vprintfmt+0x2ea>
  80042a:	02d00793          	li	a5,45
  80042e:	04fd9263          	bne	s11,a5,800472 <vprintfmt+0x32a>
  800432:	02800793          	li	a5,40
  800436:	00000a17          	auipc	s4,0x0
  80043a:	0e3a0a13          	addi	s4,s4,227 # 800519 <main+0x3b>
  80043e:	02800513          	li	a0,40
  800442:	b5cd                	j	800324 <vprintfmt+0x1dc>
  800444:	85ea                	mv	a1,s10
  800446:	8522                	mv	a0,s0
  800448:	07a000ef          	jal	8004c2 <strnlen>
  80044c:	40ac8cbb          	subw	s9,s9,a0
  800450:	01905963          	blez	s9,800462 <vprintfmt+0x31a>
  800454:	2d81                	sext.w	s11,s11
  800456:	85a6                	mv	a1,s1
  800458:	856e                	mv	a0,s11
  80045a:	3cfd                	addiw	s9,s9,-1
  80045c:	9902                	jalr	s2
  80045e:	fe0c9ce3          	bnez	s9,800456 <vprintfmt+0x30e>
  800462:	00044783          	lbu	a5,0(s0)
  800466:	0007851b          	sext.w	a0,a5
  80046a:	ea079de3          	bnez	a5,800324 <vprintfmt+0x1dc>
  80046e:	6a22                	ld	s4,8(sp)
  800470:	b331                	j	80017c <vprintfmt+0x34>
  800472:	85ea                	mv	a1,s10
  800474:	00000517          	auipc	a0,0x0
  800478:	0a450513          	addi	a0,a0,164 # 800518 <main+0x3a>
  80047c:	046000ef          	jal	8004c2 <strnlen>
  800480:	40ac8cbb          	subw	s9,s9,a0
  800484:	00000417          	auipc	s0,0x0
  800488:	09440413          	addi	s0,s0,148 # 800518 <main+0x3a>
  80048c:	00000a17          	auipc	s4,0x0
  800490:	08da0a13          	addi	s4,s4,141 # 800519 <main+0x3b>
  800494:	02800793          	li	a5,40
  800498:	02800513          	li	a0,40
  80049c:	fb904ce3          	bgtz	s9,800454 <vprintfmt+0x30c>
  8004a0:	b551                	j	800324 <vprintfmt+0x1dc>

00000000008004a2 <printfmt>:
  8004a2:	715d                	addi	sp,sp,-80
  8004a4:	02810313          	addi	t1,sp,40
  8004a8:	f436                	sd	a3,40(sp)
  8004aa:	869a                	mv	a3,t1
  8004ac:	ec06                	sd	ra,24(sp)
  8004ae:	f83a                	sd	a4,48(sp)
  8004b0:	fc3e                	sd	a5,56(sp)
  8004b2:	e0c2                	sd	a6,64(sp)
  8004b4:	e4c6                	sd	a7,72(sp)
  8004b6:	e41a                	sd	t1,8(sp)
  8004b8:	c91ff0ef          	jal	800148 <vprintfmt>
  8004bc:	60e2                	ld	ra,24(sp)
  8004be:	6161                	addi	sp,sp,80
  8004c0:	8082                	ret

00000000008004c2 <strnlen>:
  8004c2:	4781                	li	a5,0
  8004c4:	e589                	bnez	a1,8004ce <strnlen+0xc>
  8004c6:	a811                	j	8004da <strnlen+0x18>
  8004c8:	0785                	addi	a5,a5,1
  8004ca:	00f58863          	beq	a1,a5,8004da <strnlen+0x18>
  8004ce:	00f50733          	add	a4,a0,a5
  8004d2:	00074703          	lbu	a4,0(a4)
  8004d6:	fb6d                	bnez	a4,8004c8 <strnlen+0x6>
  8004d8:	85be                	mv	a1,a5
  8004da:	852e                	mv	a0,a1
  8004dc:	8082                	ret

00000000008004de <main>:
  8004de:	00002783          	lw	a5,0(zero) # 0 <_start-0x800020>
  8004e2:	9002                	ebreak
