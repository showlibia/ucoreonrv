
obj/__user_forktree.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	0c0000ef          	jal	8000e0 <umain>
  800024:	a001                	j	800024 <_start+0x4>

0000000000800026 <cputch>:
  800026:	1141                	addi	sp,sp,-16
  800028:	e022                	sd	s0,0(sp)
  80002a:	e406                	sd	ra,8(sp)
  80002c:	842e                	mv	s0,a1
  80002e:	090000ef          	jal	8000be <sys_putc>
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
  800068:	10c000ef          	jal	800174 <vprintfmt>
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

00000000008000b2 <sys_fork>:
  8000b2:	4509                	li	a0,2
  8000b4:	b7c1                	j	800074 <syscall>

00000000008000b6 <sys_yield>:
  8000b6:	4529                	li	a0,10
  8000b8:	bf75                	j	800074 <syscall>

00000000008000ba <sys_getpid>:
  8000ba:	4549                	li	a0,18
  8000bc:	bf65                	j	800074 <syscall>

00000000008000be <sys_putc>:
  8000be:	85aa                	mv	a1,a0
  8000c0:	4579                	li	a0,30
  8000c2:	bf4d                	j	800074 <syscall>

00000000008000c4 <exit>:
  8000c4:	1141                	addi	sp,sp,-16
  8000c6:	e406                	sd	ra,8(sp)
  8000c8:	fe5ff0ef          	jal	8000ac <sys_exit>
  8000cc:	00000517          	auipc	a0,0x0
  8000d0:	56c50513          	addi	a0,a0,1388 # 800638 <main+0x1e>
  8000d4:	f6dff0ef          	jal	800040 <cprintf>
  8000d8:	a001                	j	8000d8 <exit+0x14>

00000000008000da <fork>:
  8000da:	bfe1                	j	8000b2 <sys_fork>

00000000008000dc <yield>:
  8000dc:	bfe9                	j	8000b6 <sys_yield>

00000000008000de <getpid>:
  8000de:	bff1                	j	8000ba <sys_getpid>

00000000008000e0 <umain>:
  8000e0:	1141                	addi	sp,sp,-16
  8000e2:	e406                	sd	ra,8(sp)
  8000e4:	536000ef          	jal	80061a <main>
  8000e8:	fddff0ef          	jal	8000c4 <exit>

00000000008000ec <printnum>:
  8000ec:	02069813          	slli	a6,a3,0x20
  8000f0:	7179                	addi	sp,sp,-48
  8000f2:	02085813          	srli	a6,a6,0x20
  8000f6:	e052                	sd	s4,0(sp)
  8000f8:	03067a33          	remu	s4,a2,a6
  8000fc:	f022                	sd	s0,32(sp)
  8000fe:	ec26                	sd	s1,24(sp)
  800100:	e84a                	sd	s2,16(sp)
  800102:	f406                	sd	ra,40(sp)
  800104:	84aa                	mv	s1,a0
  800106:	892e                	mv	s2,a1
  800108:	fff7041b          	addiw	s0,a4,-1
  80010c:	2a01                	sext.w	s4,s4
  80010e:	05067063          	bgeu	a2,a6,80014e <printnum+0x62>
  800112:	e44e                	sd	s3,8(sp)
  800114:	89be                	mv	s3,a5
  800116:	4785                	li	a5,1
  800118:	00e7d763          	bge	a5,a4,800126 <printnum+0x3a>
  80011c:	85ca                	mv	a1,s2
  80011e:	854e                	mv	a0,s3
  800120:	347d                	addiw	s0,s0,-1
  800122:	9482                	jalr	s1
  800124:	fc65                	bnez	s0,80011c <printnum+0x30>
  800126:	69a2                	ld	s3,8(sp)
  800128:	1a02                	slli	s4,s4,0x20
  80012a:	020a5a13          	srli	s4,s4,0x20
  80012e:	00000797          	auipc	a5,0x0
  800132:	52278793          	addi	a5,a5,1314 # 800650 <main+0x36>
  800136:	97d2                	add	a5,a5,s4
  800138:	7402                	ld	s0,32(sp)
  80013a:	0007c503          	lbu	a0,0(a5)
  80013e:	70a2                	ld	ra,40(sp)
  800140:	6a02                	ld	s4,0(sp)
  800142:	85ca                	mv	a1,s2
  800144:	87a6                	mv	a5,s1
  800146:	6942                	ld	s2,16(sp)
  800148:	64e2                	ld	s1,24(sp)
  80014a:	6145                	addi	sp,sp,48
  80014c:	8782                	jr	a5
  80014e:	03065633          	divu	a2,a2,a6
  800152:	8722                	mv	a4,s0
  800154:	f99ff0ef          	jal	8000ec <printnum>
  800158:	bfc1                	j	800128 <printnum+0x3c>

000000000080015a <sprintputch>:
  80015a:	499c                	lw	a5,16(a1)
  80015c:	6198                	ld	a4,0(a1)
  80015e:	6594                	ld	a3,8(a1)
  800160:	2785                	addiw	a5,a5,1
  800162:	c99c                	sw	a5,16(a1)
  800164:	00d77763          	bgeu	a4,a3,800172 <sprintputch+0x18>
  800168:	00170793          	addi	a5,a4,1
  80016c:	e19c                	sd	a5,0(a1)
  80016e:	00a70023          	sb	a0,0(a4)
  800172:	8082                	ret

0000000000800174 <vprintfmt>:
  800174:	7119                	addi	sp,sp,-128
  800176:	f4a6                	sd	s1,104(sp)
  800178:	f0ca                	sd	s2,96(sp)
  80017a:	ecce                	sd	s3,88(sp)
  80017c:	e8d2                	sd	s4,80(sp)
  80017e:	e4d6                	sd	s5,72(sp)
  800180:	e0da                	sd	s6,64(sp)
  800182:	f862                	sd	s8,48(sp)
  800184:	fc86                	sd	ra,120(sp)
  800186:	f8a2                	sd	s0,112(sp)
  800188:	fc5e                	sd	s7,56(sp)
  80018a:	f466                	sd	s9,40(sp)
  80018c:	f06a                	sd	s10,32(sp)
  80018e:	ec6e                	sd	s11,24(sp)
  800190:	892a                	mv	s2,a0
  800192:	84ae                	mv	s1,a1
  800194:	8c32                	mv	s8,a2
  800196:	8a36                	mv	s4,a3
  800198:	02500993          	li	s3,37
  80019c:	05500b13          	li	s6,85
  8001a0:	00000a97          	auipc	s5,0x0
  8001a4:	5c8a8a93          	addi	s5,s5,1480 # 800768 <main+0x14e>
  8001a8:	000c4503          	lbu	a0,0(s8)
  8001ac:	001c0413          	addi	s0,s8,1
  8001b0:	01350a63          	beq	a0,s3,8001c4 <vprintfmt+0x50>
  8001b4:	cd0d                	beqz	a0,8001ee <vprintfmt+0x7a>
  8001b6:	85a6                	mv	a1,s1
  8001b8:	9902                	jalr	s2
  8001ba:	00044503          	lbu	a0,0(s0)
  8001be:	0405                	addi	s0,s0,1
  8001c0:	ff351ae3          	bne	a0,s3,8001b4 <vprintfmt+0x40>
  8001c4:	02000d93          	li	s11,32
  8001c8:	4b81                	li	s7,0
  8001ca:	4601                	li	a2,0
  8001cc:	5d7d                	li	s10,-1
  8001ce:	5cfd                	li	s9,-1
  8001d0:	00044683          	lbu	a3,0(s0)
  8001d4:	00140c13          	addi	s8,s0,1
  8001d8:	fdd6859b          	addiw	a1,a3,-35
  8001dc:	0ff5f593          	zext.b	a1,a1
  8001e0:	02bb6663          	bltu	s6,a1,80020c <vprintfmt+0x98>
  8001e4:	058a                	slli	a1,a1,0x2
  8001e6:	95d6                	add	a1,a1,s5
  8001e8:	4198                	lw	a4,0(a1)
  8001ea:	9756                	add	a4,a4,s5
  8001ec:	8702                	jr	a4
  8001ee:	70e6                	ld	ra,120(sp)
  8001f0:	7446                	ld	s0,112(sp)
  8001f2:	74a6                	ld	s1,104(sp)
  8001f4:	7906                	ld	s2,96(sp)
  8001f6:	69e6                	ld	s3,88(sp)
  8001f8:	6a46                	ld	s4,80(sp)
  8001fa:	6aa6                	ld	s5,72(sp)
  8001fc:	6b06                	ld	s6,64(sp)
  8001fe:	7be2                	ld	s7,56(sp)
  800200:	7c42                	ld	s8,48(sp)
  800202:	7ca2                	ld	s9,40(sp)
  800204:	7d02                	ld	s10,32(sp)
  800206:	6de2                	ld	s11,24(sp)
  800208:	6109                	addi	sp,sp,128
  80020a:	8082                	ret
  80020c:	85a6                	mv	a1,s1
  80020e:	02500513          	li	a0,37
  800212:	9902                	jalr	s2
  800214:	fff44703          	lbu	a4,-1(s0)
  800218:	02500793          	li	a5,37
  80021c:	8c22                	mv	s8,s0
  80021e:	f8f705e3          	beq	a4,a5,8001a8 <vprintfmt+0x34>
  800222:	02500713          	li	a4,37
  800226:	ffec4783          	lbu	a5,-2(s8)
  80022a:	1c7d                	addi	s8,s8,-1
  80022c:	fee79de3          	bne	a5,a4,800226 <vprintfmt+0xb2>
  800230:	bfa5                	j	8001a8 <vprintfmt+0x34>
  800232:	00144783          	lbu	a5,1(s0)
  800236:	4725                	li	a4,9
  800238:	fd068d1b          	addiw	s10,a3,-48
  80023c:	fd07859b          	addiw	a1,a5,-48
  800240:	0007869b          	sext.w	a3,a5
  800244:	8462                	mv	s0,s8
  800246:	02b76563          	bltu	a4,a1,800270 <vprintfmt+0xfc>
  80024a:	4525                	li	a0,9
  80024c:	00144783          	lbu	a5,1(s0)
  800250:	002d171b          	slliw	a4,s10,0x2
  800254:	01a7073b          	addw	a4,a4,s10
  800258:	0017171b          	slliw	a4,a4,0x1
  80025c:	9f35                	addw	a4,a4,a3
  80025e:	fd07859b          	addiw	a1,a5,-48
  800262:	0405                	addi	s0,s0,1
  800264:	fd070d1b          	addiw	s10,a4,-48
  800268:	0007869b          	sext.w	a3,a5
  80026c:	feb570e3          	bgeu	a0,a1,80024c <vprintfmt+0xd8>
  800270:	f60cd0e3          	bgez	s9,8001d0 <vprintfmt+0x5c>
  800274:	8cea                	mv	s9,s10
  800276:	5d7d                	li	s10,-1
  800278:	bfa1                	j	8001d0 <vprintfmt+0x5c>
  80027a:	8db6                	mv	s11,a3
  80027c:	8462                	mv	s0,s8
  80027e:	bf89                	j	8001d0 <vprintfmt+0x5c>
  800280:	8462                	mv	s0,s8
  800282:	4b85                	li	s7,1
  800284:	b7b1                	j	8001d0 <vprintfmt+0x5c>
  800286:	4785                	li	a5,1
  800288:	008a0713          	addi	a4,s4,8
  80028c:	00c7c463          	blt	a5,a2,800294 <vprintfmt+0x120>
  800290:	1a060163          	beqz	a2,800432 <vprintfmt+0x2be>
  800294:	000a3603          	ld	a2,0(s4)
  800298:	46c1                	li	a3,16
  80029a:	8a3a                	mv	s4,a4
  80029c:	000d879b          	sext.w	a5,s11
  8002a0:	8766                	mv	a4,s9
  8002a2:	85a6                	mv	a1,s1
  8002a4:	854a                	mv	a0,s2
  8002a6:	e47ff0ef          	jal	8000ec <printnum>
  8002aa:	bdfd                	j	8001a8 <vprintfmt+0x34>
  8002ac:	000a2503          	lw	a0,0(s4)
  8002b0:	85a6                	mv	a1,s1
  8002b2:	0a21                	addi	s4,s4,8
  8002b4:	9902                	jalr	s2
  8002b6:	bdcd                	j	8001a8 <vprintfmt+0x34>
  8002b8:	4785                	li	a5,1
  8002ba:	008a0713          	addi	a4,s4,8
  8002be:	00c7c463          	blt	a5,a2,8002c6 <vprintfmt+0x152>
  8002c2:	16060363          	beqz	a2,800428 <vprintfmt+0x2b4>
  8002c6:	000a3603          	ld	a2,0(s4)
  8002ca:	46a9                	li	a3,10
  8002cc:	8a3a                	mv	s4,a4
  8002ce:	b7f9                	j	80029c <vprintfmt+0x128>
  8002d0:	85a6                	mv	a1,s1
  8002d2:	03000513          	li	a0,48
  8002d6:	9902                	jalr	s2
  8002d8:	85a6                	mv	a1,s1
  8002da:	07800513          	li	a0,120
  8002de:	9902                	jalr	s2
  8002e0:	000a3603          	ld	a2,0(s4)
  8002e4:	46c1                	li	a3,16
  8002e6:	0a21                	addi	s4,s4,8
  8002e8:	bf55                	j	80029c <vprintfmt+0x128>
  8002ea:	85a6                	mv	a1,s1
  8002ec:	02500513          	li	a0,37
  8002f0:	9902                	jalr	s2
  8002f2:	bd5d                	j	8001a8 <vprintfmt+0x34>
  8002f4:	000a2d03          	lw	s10,0(s4)
  8002f8:	8462                	mv	s0,s8
  8002fa:	0a21                	addi	s4,s4,8
  8002fc:	bf95                	j	800270 <vprintfmt+0xfc>
  8002fe:	4785                	li	a5,1
  800300:	008a0713          	addi	a4,s4,8
  800304:	00c7c463          	blt	a5,a2,80030c <vprintfmt+0x198>
  800308:	10060b63          	beqz	a2,80041e <vprintfmt+0x2aa>
  80030c:	000a3603          	ld	a2,0(s4)
  800310:	46a1                	li	a3,8
  800312:	8a3a                	mv	s4,a4
  800314:	b761                	j	80029c <vprintfmt+0x128>
  800316:	fffcc793          	not	a5,s9
  80031a:	97fd                	srai	a5,a5,0x3f
  80031c:	00fcf7b3          	and	a5,s9,a5
  800320:	00078c9b          	sext.w	s9,a5
  800324:	8462                	mv	s0,s8
  800326:	b56d                	j	8001d0 <vprintfmt+0x5c>
  800328:	000a3403          	ld	s0,0(s4)
  80032c:	008a0793          	addi	a5,s4,8
  800330:	e43e                	sd	a5,8(sp)
  800332:	12040063          	beqz	s0,800452 <vprintfmt+0x2de>
  800336:	0d905963          	blez	s9,800408 <vprintfmt+0x294>
  80033a:	02d00793          	li	a5,45
  80033e:	00140a13          	addi	s4,s0,1
  800342:	12fd9763          	bne	s11,a5,800470 <vprintfmt+0x2fc>
  800346:	00044783          	lbu	a5,0(s0)
  80034a:	0007851b          	sext.w	a0,a5
  80034e:	cb9d                	beqz	a5,800384 <vprintfmt+0x210>
  800350:	547d                	li	s0,-1
  800352:	05e00d93          	li	s11,94
  800356:	000d4563          	bltz	s10,800360 <vprintfmt+0x1ec>
  80035a:	3d7d                	addiw	s10,s10,-1
  80035c:	028d0263          	beq	s10,s0,800380 <vprintfmt+0x20c>
  800360:	85a6                	mv	a1,s1
  800362:	0c0b8d63          	beqz	s7,80043c <vprintfmt+0x2c8>
  800366:	3781                	addiw	a5,a5,-32
  800368:	0cfdfa63          	bgeu	s11,a5,80043c <vprintfmt+0x2c8>
  80036c:	03f00513          	li	a0,63
  800370:	9902                	jalr	s2
  800372:	000a4783          	lbu	a5,0(s4)
  800376:	3cfd                	addiw	s9,s9,-1
  800378:	0a05                	addi	s4,s4,1
  80037a:	0007851b          	sext.w	a0,a5
  80037e:	ffe1                	bnez	a5,800356 <vprintfmt+0x1e2>
  800380:	01905963          	blez	s9,800392 <vprintfmt+0x21e>
  800384:	85a6                	mv	a1,s1
  800386:	02000513          	li	a0,32
  80038a:	3cfd                	addiw	s9,s9,-1
  80038c:	9902                	jalr	s2
  80038e:	fe0c9be3          	bnez	s9,800384 <vprintfmt+0x210>
  800392:	6a22                	ld	s4,8(sp)
  800394:	bd11                	j	8001a8 <vprintfmt+0x34>
  800396:	4785                	li	a5,1
  800398:	008a0b93          	addi	s7,s4,8
  80039c:	00c7c363          	blt	a5,a2,8003a2 <vprintfmt+0x22e>
  8003a0:	ce25                	beqz	a2,800418 <vprintfmt+0x2a4>
  8003a2:	000a3403          	ld	s0,0(s4)
  8003a6:	08044d63          	bltz	s0,800440 <vprintfmt+0x2cc>
  8003aa:	8622                	mv	a2,s0
  8003ac:	8a5e                	mv	s4,s7
  8003ae:	46a9                	li	a3,10
  8003b0:	b5f5                	j	80029c <vprintfmt+0x128>
  8003b2:	000a2783          	lw	a5,0(s4)
  8003b6:	4661                	li	a2,24
  8003b8:	41f7d71b          	sraiw	a4,a5,0x1f
  8003bc:	8fb9                	xor	a5,a5,a4
  8003be:	40e786bb          	subw	a3,a5,a4
  8003c2:	02d64663          	blt	a2,a3,8003ee <vprintfmt+0x27a>
  8003c6:	00369713          	slli	a4,a3,0x3
  8003ca:	00000797          	auipc	a5,0x0
  8003ce:	4f678793          	addi	a5,a5,1270 # 8008c0 <error_string>
  8003d2:	97ba                	add	a5,a5,a4
  8003d4:	639c                	ld	a5,0(a5)
  8003d6:	cf81                	beqz	a5,8003ee <vprintfmt+0x27a>
  8003d8:	86be                	mv	a3,a5
  8003da:	00000617          	auipc	a2,0x0
  8003de:	2a660613          	addi	a2,a2,678 # 800680 <main+0x66>
  8003e2:	85a6                	mv	a1,s1
  8003e4:	854a                	mv	a0,s2
  8003e6:	0e8000ef          	jal	8004ce <printfmt>
  8003ea:	0a21                	addi	s4,s4,8
  8003ec:	bb75                	j	8001a8 <vprintfmt+0x34>
  8003ee:	00000617          	auipc	a2,0x0
  8003f2:	28260613          	addi	a2,a2,642 # 800670 <main+0x56>
  8003f6:	85a6                	mv	a1,s1
  8003f8:	854a                	mv	a0,s2
  8003fa:	0d4000ef          	jal	8004ce <printfmt>
  8003fe:	0a21                	addi	s4,s4,8
  800400:	b365                	j	8001a8 <vprintfmt+0x34>
  800402:	2605                	addiw	a2,a2,1
  800404:	8462                	mv	s0,s8
  800406:	b3e9                	j	8001d0 <vprintfmt+0x5c>
  800408:	00044783          	lbu	a5,0(s0)
  80040c:	0007851b          	sext.w	a0,a5
  800410:	d3c9                	beqz	a5,800392 <vprintfmt+0x21e>
  800412:	00140a13          	addi	s4,s0,1
  800416:	bf2d                	j	800350 <vprintfmt+0x1dc>
  800418:	000a2403          	lw	s0,0(s4)
  80041c:	b769                	j	8003a6 <vprintfmt+0x232>
  80041e:	000a6603          	lwu	a2,0(s4)
  800422:	46a1                	li	a3,8
  800424:	8a3a                	mv	s4,a4
  800426:	bd9d                	j	80029c <vprintfmt+0x128>
  800428:	000a6603          	lwu	a2,0(s4)
  80042c:	46a9                	li	a3,10
  80042e:	8a3a                	mv	s4,a4
  800430:	b5b5                	j	80029c <vprintfmt+0x128>
  800432:	000a6603          	lwu	a2,0(s4)
  800436:	46c1                	li	a3,16
  800438:	8a3a                	mv	s4,a4
  80043a:	b58d                	j	80029c <vprintfmt+0x128>
  80043c:	9902                	jalr	s2
  80043e:	bf15                	j	800372 <vprintfmt+0x1fe>
  800440:	85a6                	mv	a1,s1
  800442:	02d00513          	li	a0,45
  800446:	9902                	jalr	s2
  800448:	40800633          	neg	a2,s0
  80044c:	8a5e                	mv	s4,s7
  80044e:	46a9                	li	a3,10
  800450:	b5b1                	j	80029c <vprintfmt+0x128>
  800452:	01905663          	blez	s9,80045e <vprintfmt+0x2ea>
  800456:	02d00793          	li	a5,45
  80045a:	04fd9263          	bne	s11,a5,80049e <vprintfmt+0x32a>
  80045e:	02800793          	li	a5,40
  800462:	00000a17          	auipc	s4,0x0
  800466:	207a0a13          	addi	s4,s4,519 # 800669 <main+0x4f>
  80046a:	02800513          	li	a0,40
  80046e:	b5cd                	j	800350 <vprintfmt+0x1dc>
  800470:	85ea                	mv	a1,s10
  800472:	8522                	mv	a0,s0
  800474:	0da000ef          	jal	80054e <strnlen>
  800478:	40ac8cbb          	subw	s9,s9,a0
  80047c:	01905963          	blez	s9,80048e <vprintfmt+0x31a>
  800480:	2d81                	sext.w	s11,s11
  800482:	85a6                	mv	a1,s1
  800484:	856e                	mv	a0,s11
  800486:	3cfd                	addiw	s9,s9,-1
  800488:	9902                	jalr	s2
  80048a:	fe0c9ce3          	bnez	s9,800482 <vprintfmt+0x30e>
  80048e:	00044783          	lbu	a5,0(s0)
  800492:	0007851b          	sext.w	a0,a5
  800496:	ea079de3          	bnez	a5,800350 <vprintfmt+0x1dc>
  80049a:	6a22                	ld	s4,8(sp)
  80049c:	b331                	j	8001a8 <vprintfmt+0x34>
  80049e:	85ea                	mv	a1,s10
  8004a0:	00000517          	auipc	a0,0x0
  8004a4:	1c850513          	addi	a0,a0,456 # 800668 <main+0x4e>
  8004a8:	0a6000ef          	jal	80054e <strnlen>
  8004ac:	40ac8cbb          	subw	s9,s9,a0
  8004b0:	00000417          	auipc	s0,0x0
  8004b4:	1b840413          	addi	s0,s0,440 # 800668 <main+0x4e>
  8004b8:	00000a17          	auipc	s4,0x0
  8004bc:	1b1a0a13          	addi	s4,s4,433 # 800669 <main+0x4f>
  8004c0:	02800793          	li	a5,40
  8004c4:	02800513          	li	a0,40
  8004c8:	fb904ce3          	bgtz	s9,800480 <vprintfmt+0x30c>
  8004cc:	b551                	j	800350 <vprintfmt+0x1dc>

00000000008004ce <printfmt>:
  8004ce:	715d                	addi	sp,sp,-80
  8004d0:	02810313          	addi	t1,sp,40
  8004d4:	f436                	sd	a3,40(sp)
  8004d6:	869a                	mv	a3,t1
  8004d8:	ec06                	sd	ra,24(sp)
  8004da:	f83a                	sd	a4,48(sp)
  8004dc:	fc3e                	sd	a5,56(sp)
  8004de:	e0c2                	sd	a6,64(sp)
  8004e0:	e4c6                	sd	a7,72(sp)
  8004e2:	e41a                	sd	t1,8(sp)
  8004e4:	c91ff0ef          	jal	800174 <vprintfmt>
  8004e8:	60e2                	ld	ra,24(sp)
  8004ea:	6161                	addi	sp,sp,80
  8004ec:	8082                	ret

00000000008004ee <snprintf>:
  8004ee:	711d                	addi	sp,sp,-96
  8004f0:	15fd                	addi	a1,a1,-1
  8004f2:	03810313          	addi	t1,sp,56
  8004f6:	95aa                	add	a1,a1,a0
  8004f8:	f406                	sd	ra,40(sp)
  8004fa:	fc36                	sd	a3,56(sp)
  8004fc:	e0ba                	sd	a4,64(sp)
  8004fe:	e4be                	sd	a5,72(sp)
  800500:	e8c2                	sd	a6,80(sp)
  800502:	ecc6                	sd	a7,88(sp)
  800504:	e01a                	sd	t1,0(sp)
  800506:	e42a                	sd	a0,8(sp)
  800508:	e82e                	sd	a1,16(sp)
  80050a:	cc02                	sw	zero,24(sp)
  80050c:	c115                	beqz	a0,800530 <snprintf+0x42>
  80050e:	02a5e163          	bltu	a1,a0,800530 <snprintf+0x42>
  800512:	00000517          	auipc	a0,0x0
  800516:	c4850513          	addi	a0,a0,-952 # 80015a <sprintputch>
  80051a:	869a                	mv	a3,t1
  80051c:	002c                	addi	a1,sp,8
  80051e:	c57ff0ef          	jal	800174 <vprintfmt>
  800522:	67a2                	ld	a5,8(sp)
  800524:	00078023          	sb	zero,0(a5)
  800528:	4562                	lw	a0,24(sp)
  80052a:	70a2                	ld	ra,40(sp)
  80052c:	6125                	addi	sp,sp,96
  80052e:	8082                	ret
  800530:	5575                	li	a0,-3
  800532:	bfe5                	j	80052a <snprintf+0x3c>

0000000000800534 <strlen>:
  800534:	00054783          	lbu	a5,0(a0)
  800538:	872a                	mv	a4,a0
  80053a:	4501                	li	a0,0
  80053c:	cb81                	beqz	a5,80054c <strlen+0x18>
  80053e:	0505                	addi	a0,a0,1
  800540:	00a707b3          	add	a5,a4,a0
  800544:	0007c783          	lbu	a5,0(a5)
  800548:	fbfd                	bnez	a5,80053e <strlen+0xa>
  80054a:	8082                	ret
  80054c:	8082                	ret

000000000080054e <strnlen>:
  80054e:	4781                	li	a5,0
  800550:	e589                	bnez	a1,80055a <strnlen+0xc>
  800552:	a811                	j	800566 <strnlen+0x18>
  800554:	0785                	addi	a5,a5,1
  800556:	00f58863          	beq	a1,a5,800566 <strnlen+0x18>
  80055a:	00f50733          	add	a4,a0,a5
  80055e:	00074703          	lbu	a4,0(a4)
  800562:	fb6d                	bnez	a4,800554 <strnlen+0x6>
  800564:	85be                	mv	a1,a5
  800566:	852e                	mv	a0,a1
  800568:	8082                	ret

000000000080056a <forktree>:
  80056a:	1101                	addi	sp,sp,-32
  80056c:	ec06                	sd	ra,24(sp)
  80056e:	e822                	sd	s0,16(sp)
  800570:	842a                	mv	s0,a0
  800572:	b6dff0ef          	jal	8000de <getpid>
  800576:	85aa                	mv	a1,a0
  800578:	8622                	mv	a2,s0
  80057a:	00000517          	auipc	a0,0x0
  80057e:	1ce50513          	addi	a0,a0,462 # 800748 <main+0x12e>
  800582:	abfff0ef          	jal	800040 <cprintf>
  800586:	03000593          	li	a1,48
  80058a:	8522                	mv	a0,s0
  80058c:	044000ef          	jal	8005d0 <forkchild>
  800590:	8522                	mv	a0,s0
  800592:	fa3ff0ef          	jal	800534 <strlen>
  800596:	478d                	li	a5,3
  800598:	00a7f663          	bgeu	a5,a0,8005a4 <forktree+0x3a>
  80059c:	60e2                	ld	ra,24(sp)
  80059e:	6442                	ld	s0,16(sp)
  8005a0:	6105                	addi	sp,sp,32
  8005a2:	8082                	ret
  8005a4:	03100713          	li	a4,49
  8005a8:	86a2                	mv	a3,s0
  8005aa:	00000617          	auipc	a2,0x0
  8005ae:	1b660613          	addi	a2,a2,438 # 800760 <main+0x146>
  8005b2:	4595                	li	a1,5
  8005b4:	0028                	addi	a0,sp,8
  8005b6:	f39ff0ef          	jal	8004ee <snprintf>
  8005ba:	b21ff0ef          	jal	8000da <fork>
  8005be:	fd79                	bnez	a0,80059c <forktree+0x32>
  8005c0:	0028                	addi	a0,sp,8
  8005c2:	fa9ff0ef          	jal	80056a <forktree>
  8005c6:	b17ff0ef          	jal	8000dc <yield>
  8005ca:	4501                	li	a0,0
  8005cc:	af9ff0ef          	jal	8000c4 <exit>

00000000008005d0 <forkchild>:
  8005d0:	7179                	addi	sp,sp,-48
  8005d2:	f022                	sd	s0,32(sp)
  8005d4:	ec26                	sd	s1,24(sp)
  8005d6:	f406                	sd	ra,40(sp)
  8005d8:	842a                	mv	s0,a0
  8005da:	84ae                	mv	s1,a1
  8005dc:	f59ff0ef          	jal	800534 <strlen>
  8005e0:	478d                	li	a5,3
  8005e2:	00a7f763          	bgeu	a5,a0,8005f0 <forkchild+0x20>
  8005e6:	70a2                	ld	ra,40(sp)
  8005e8:	7402                	ld	s0,32(sp)
  8005ea:	64e2                	ld	s1,24(sp)
  8005ec:	6145                	addi	sp,sp,48
  8005ee:	8082                	ret
  8005f0:	8726                	mv	a4,s1
  8005f2:	86a2                	mv	a3,s0
  8005f4:	00000617          	auipc	a2,0x0
  8005f8:	16c60613          	addi	a2,a2,364 # 800760 <main+0x146>
  8005fc:	4595                	li	a1,5
  8005fe:	0028                	addi	a0,sp,8
  800600:	eefff0ef          	jal	8004ee <snprintf>
  800604:	ad7ff0ef          	jal	8000da <fork>
  800608:	fd79                	bnez	a0,8005e6 <forkchild+0x16>
  80060a:	0028                	addi	a0,sp,8
  80060c:	f5fff0ef          	jal	80056a <forktree>
  800610:	acdff0ef          	jal	8000dc <yield>
  800614:	4501                	li	a0,0
  800616:	aafff0ef          	jal	8000c4 <exit>

000000000080061a <main>:
  80061a:	1141                	addi	sp,sp,-16
  80061c:	00000517          	auipc	a0,0x0
  800620:	13c50513          	addi	a0,a0,316 # 800758 <main+0x13e>
  800624:	e406                	sd	ra,8(sp)
  800626:	f45ff0ef          	jal	80056a <forktree>
  80062a:	60a2                	ld	ra,8(sp)
  80062c:	4501                	li	a0,0
  80062e:	0141                	addi	sp,sp,16
  800630:	8082                	ret
