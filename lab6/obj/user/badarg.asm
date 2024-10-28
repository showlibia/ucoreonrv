
obj/__user_badarg.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	124000ef          	jal	800144 <umain>
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
  800038:	60c50513          	addi	a0,a0,1548 # 800640 <main+0xec>
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
  800058:	60c50513          	addi	a0,a0,1548 # 800660 <main+0x10c>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0c6000ef          	jal	800128 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0b4000ef          	jal	800122 <sys_putc>
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
  800094:	12a000ef          	jal	8001be <vprintfmt>
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
  8000c8:	0f6000ef          	jal	8001be <vprintfmt>
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

0000000000800122 <sys_putc>:
  800122:	85aa                	mv	a1,a0
  800124:	4579                	li	a0,30
  800126:	b77d                	j	8000d4 <syscall>

0000000000800128 <exit>:
  800128:	1141                	addi	sp,sp,-16
  80012a:	e406                	sd	ra,8(sp)
  80012c:	fe1ff0ef          	jal	80010c <sys_exit>
  800130:	00000517          	auipc	a0,0x0
  800134:	53850513          	addi	a0,a0,1336 # 800668 <main+0x114>
  800138:	f69ff0ef          	jal	8000a0 <cprintf>
  80013c:	a001                	j	80013c <exit+0x14>

000000000080013e <fork>:
  80013e:	bfd1                	j	800112 <sys_fork>

0000000000800140 <waitpid>:
  800140:	bfd9                	j	800116 <sys_wait>

0000000000800142 <yield>:
  800142:	bff1                	j	80011e <sys_yield>

0000000000800144 <umain>:
  800144:	1141                	addi	sp,sp,-16
  800146:	e406                	sd	ra,8(sp)
  800148:	40c000ef          	jal	800554 <main>
  80014c:	fddff0ef          	jal	800128 <exit>

0000000000800150 <printnum>:
  800150:	02069813          	slli	a6,a3,0x20
  800154:	7179                	addi	sp,sp,-48
  800156:	02085813          	srli	a6,a6,0x20
  80015a:	e052                	sd	s4,0(sp)
  80015c:	03067a33          	remu	s4,a2,a6
  800160:	f022                	sd	s0,32(sp)
  800162:	ec26                	sd	s1,24(sp)
  800164:	e84a                	sd	s2,16(sp)
  800166:	f406                	sd	ra,40(sp)
  800168:	84aa                	mv	s1,a0
  80016a:	892e                	mv	s2,a1
  80016c:	fff7041b          	addiw	s0,a4,-1
  800170:	2a01                	sext.w	s4,s4
  800172:	05067063          	bgeu	a2,a6,8001b2 <printnum+0x62>
  800176:	e44e                	sd	s3,8(sp)
  800178:	89be                	mv	s3,a5
  80017a:	4785                	li	a5,1
  80017c:	00e7d763          	bge	a5,a4,80018a <printnum+0x3a>
  800180:	85ca                	mv	a1,s2
  800182:	854e                	mv	a0,s3
  800184:	347d                	addiw	s0,s0,-1
  800186:	9482                	jalr	s1
  800188:	fc65                	bnez	s0,800180 <printnum+0x30>
  80018a:	69a2                	ld	s3,8(sp)
  80018c:	1a02                	slli	s4,s4,0x20
  80018e:	020a5a13          	srli	s4,s4,0x20
  800192:	00000797          	auipc	a5,0x0
  800196:	4ee78793          	addi	a5,a5,1262 # 800680 <main+0x12c>
  80019a:	97d2                	add	a5,a5,s4
  80019c:	7402                	ld	s0,32(sp)
  80019e:	0007c503          	lbu	a0,0(a5)
  8001a2:	70a2                	ld	ra,40(sp)
  8001a4:	6a02                	ld	s4,0(sp)
  8001a6:	85ca                	mv	a1,s2
  8001a8:	87a6                	mv	a5,s1
  8001aa:	6942                	ld	s2,16(sp)
  8001ac:	64e2                	ld	s1,24(sp)
  8001ae:	6145                	addi	sp,sp,48
  8001b0:	8782                	jr	a5
  8001b2:	03065633          	divu	a2,a2,a6
  8001b6:	8722                	mv	a4,s0
  8001b8:	f99ff0ef          	jal	800150 <printnum>
  8001bc:	bfc1                	j	80018c <printnum+0x3c>

00000000008001be <vprintfmt>:
  8001be:	7119                	addi	sp,sp,-128
  8001c0:	f4a6                	sd	s1,104(sp)
  8001c2:	f0ca                	sd	s2,96(sp)
  8001c4:	ecce                	sd	s3,88(sp)
  8001c6:	e8d2                	sd	s4,80(sp)
  8001c8:	e4d6                	sd	s5,72(sp)
  8001ca:	e0da                	sd	s6,64(sp)
  8001cc:	f862                	sd	s8,48(sp)
  8001ce:	fc86                	sd	ra,120(sp)
  8001d0:	f8a2                	sd	s0,112(sp)
  8001d2:	fc5e                	sd	s7,56(sp)
  8001d4:	f466                	sd	s9,40(sp)
  8001d6:	f06a                	sd	s10,32(sp)
  8001d8:	ec6e                	sd	s11,24(sp)
  8001da:	892a                	mv	s2,a0
  8001dc:	84ae                	mv	s1,a1
  8001de:	8c32                	mv	s8,a2
  8001e0:	8a36                	mv	s4,a3
  8001e2:	02500993          	li	s3,37
  8001e6:	05500b13          	li	s6,85
  8001ea:	00000a97          	auipc	s5,0x0
  8001ee:	656a8a93          	addi	s5,s5,1622 # 800840 <main+0x2ec>
  8001f2:	000c4503          	lbu	a0,0(s8)
  8001f6:	001c0413          	addi	s0,s8,1
  8001fa:	01350a63          	beq	a0,s3,80020e <vprintfmt+0x50>
  8001fe:	cd0d                	beqz	a0,800238 <vprintfmt+0x7a>
  800200:	85a6                	mv	a1,s1
  800202:	9902                	jalr	s2
  800204:	00044503          	lbu	a0,0(s0)
  800208:	0405                	addi	s0,s0,1
  80020a:	ff351ae3          	bne	a0,s3,8001fe <vprintfmt+0x40>
  80020e:	02000d93          	li	s11,32
  800212:	4b81                	li	s7,0
  800214:	4601                	li	a2,0
  800216:	5d7d                	li	s10,-1
  800218:	5cfd                	li	s9,-1
  80021a:	00044683          	lbu	a3,0(s0)
  80021e:	00140c13          	addi	s8,s0,1
  800222:	fdd6859b          	addiw	a1,a3,-35
  800226:	0ff5f593          	zext.b	a1,a1
  80022a:	02bb6663          	bltu	s6,a1,800256 <vprintfmt+0x98>
  80022e:	058a                	slli	a1,a1,0x2
  800230:	95d6                	add	a1,a1,s5
  800232:	4198                	lw	a4,0(a1)
  800234:	9756                	add	a4,a4,s5
  800236:	8702                	jr	a4
  800238:	70e6                	ld	ra,120(sp)
  80023a:	7446                	ld	s0,112(sp)
  80023c:	74a6                	ld	s1,104(sp)
  80023e:	7906                	ld	s2,96(sp)
  800240:	69e6                	ld	s3,88(sp)
  800242:	6a46                	ld	s4,80(sp)
  800244:	6aa6                	ld	s5,72(sp)
  800246:	6b06                	ld	s6,64(sp)
  800248:	7be2                	ld	s7,56(sp)
  80024a:	7c42                	ld	s8,48(sp)
  80024c:	7ca2                	ld	s9,40(sp)
  80024e:	7d02                	ld	s10,32(sp)
  800250:	6de2                	ld	s11,24(sp)
  800252:	6109                	addi	sp,sp,128
  800254:	8082                	ret
  800256:	85a6                	mv	a1,s1
  800258:	02500513          	li	a0,37
  80025c:	9902                	jalr	s2
  80025e:	fff44703          	lbu	a4,-1(s0)
  800262:	02500793          	li	a5,37
  800266:	8c22                	mv	s8,s0
  800268:	f8f705e3          	beq	a4,a5,8001f2 <vprintfmt+0x34>
  80026c:	02500713          	li	a4,37
  800270:	ffec4783          	lbu	a5,-2(s8)
  800274:	1c7d                	addi	s8,s8,-1
  800276:	fee79de3          	bne	a5,a4,800270 <vprintfmt+0xb2>
  80027a:	bfa5                	j	8001f2 <vprintfmt+0x34>
  80027c:	00144783          	lbu	a5,1(s0)
  800280:	4725                	li	a4,9
  800282:	fd068d1b          	addiw	s10,a3,-48
  800286:	fd07859b          	addiw	a1,a5,-48
  80028a:	0007869b          	sext.w	a3,a5
  80028e:	8462                	mv	s0,s8
  800290:	02b76563          	bltu	a4,a1,8002ba <vprintfmt+0xfc>
  800294:	4525                	li	a0,9
  800296:	00144783          	lbu	a5,1(s0)
  80029a:	002d171b          	slliw	a4,s10,0x2
  80029e:	01a7073b          	addw	a4,a4,s10
  8002a2:	0017171b          	slliw	a4,a4,0x1
  8002a6:	9f35                	addw	a4,a4,a3
  8002a8:	fd07859b          	addiw	a1,a5,-48
  8002ac:	0405                	addi	s0,s0,1
  8002ae:	fd070d1b          	addiw	s10,a4,-48
  8002b2:	0007869b          	sext.w	a3,a5
  8002b6:	feb570e3          	bgeu	a0,a1,800296 <vprintfmt+0xd8>
  8002ba:	f60cd0e3          	bgez	s9,80021a <vprintfmt+0x5c>
  8002be:	8cea                	mv	s9,s10
  8002c0:	5d7d                	li	s10,-1
  8002c2:	bfa1                	j	80021a <vprintfmt+0x5c>
  8002c4:	8db6                	mv	s11,a3
  8002c6:	8462                	mv	s0,s8
  8002c8:	bf89                	j	80021a <vprintfmt+0x5c>
  8002ca:	8462                	mv	s0,s8
  8002cc:	4b85                	li	s7,1
  8002ce:	b7b1                	j	80021a <vprintfmt+0x5c>
  8002d0:	4785                	li	a5,1
  8002d2:	008a0713          	addi	a4,s4,8
  8002d6:	00c7c463          	blt	a5,a2,8002de <vprintfmt+0x120>
  8002da:	1a060163          	beqz	a2,80047c <vprintfmt+0x2be>
  8002de:	000a3603          	ld	a2,0(s4)
  8002e2:	46c1                	li	a3,16
  8002e4:	8a3a                	mv	s4,a4
  8002e6:	000d879b          	sext.w	a5,s11
  8002ea:	8766                	mv	a4,s9
  8002ec:	85a6                	mv	a1,s1
  8002ee:	854a                	mv	a0,s2
  8002f0:	e61ff0ef          	jal	800150 <printnum>
  8002f4:	bdfd                	j	8001f2 <vprintfmt+0x34>
  8002f6:	000a2503          	lw	a0,0(s4)
  8002fa:	85a6                	mv	a1,s1
  8002fc:	0a21                	addi	s4,s4,8
  8002fe:	9902                	jalr	s2
  800300:	bdcd                	j	8001f2 <vprintfmt+0x34>
  800302:	4785                	li	a5,1
  800304:	008a0713          	addi	a4,s4,8
  800308:	00c7c463          	blt	a5,a2,800310 <vprintfmt+0x152>
  80030c:	16060363          	beqz	a2,800472 <vprintfmt+0x2b4>
  800310:	000a3603          	ld	a2,0(s4)
  800314:	46a9                	li	a3,10
  800316:	8a3a                	mv	s4,a4
  800318:	b7f9                	j	8002e6 <vprintfmt+0x128>
  80031a:	85a6                	mv	a1,s1
  80031c:	03000513          	li	a0,48
  800320:	9902                	jalr	s2
  800322:	85a6                	mv	a1,s1
  800324:	07800513          	li	a0,120
  800328:	9902                	jalr	s2
  80032a:	000a3603          	ld	a2,0(s4)
  80032e:	46c1                	li	a3,16
  800330:	0a21                	addi	s4,s4,8
  800332:	bf55                	j	8002e6 <vprintfmt+0x128>
  800334:	85a6                	mv	a1,s1
  800336:	02500513          	li	a0,37
  80033a:	9902                	jalr	s2
  80033c:	bd5d                	j	8001f2 <vprintfmt+0x34>
  80033e:	000a2d03          	lw	s10,0(s4)
  800342:	8462                	mv	s0,s8
  800344:	0a21                	addi	s4,s4,8
  800346:	bf95                	j	8002ba <vprintfmt+0xfc>
  800348:	4785                	li	a5,1
  80034a:	008a0713          	addi	a4,s4,8
  80034e:	00c7c463          	blt	a5,a2,800356 <vprintfmt+0x198>
  800352:	10060b63          	beqz	a2,800468 <vprintfmt+0x2aa>
  800356:	000a3603          	ld	a2,0(s4)
  80035a:	46a1                	li	a3,8
  80035c:	8a3a                	mv	s4,a4
  80035e:	b761                	j	8002e6 <vprintfmt+0x128>
  800360:	fffcc793          	not	a5,s9
  800364:	97fd                	srai	a5,a5,0x3f
  800366:	00fcf7b3          	and	a5,s9,a5
  80036a:	00078c9b          	sext.w	s9,a5
  80036e:	8462                	mv	s0,s8
  800370:	b56d                	j	80021a <vprintfmt+0x5c>
  800372:	000a3403          	ld	s0,0(s4)
  800376:	008a0793          	addi	a5,s4,8
  80037a:	e43e                	sd	a5,8(sp)
  80037c:	12040063          	beqz	s0,80049c <vprintfmt+0x2de>
  800380:	0d905963          	blez	s9,800452 <vprintfmt+0x294>
  800384:	02d00793          	li	a5,45
  800388:	00140a13          	addi	s4,s0,1
  80038c:	12fd9763          	bne	s11,a5,8004ba <vprintfmt+0x2fc>
  800390:	00044783          	lbu	a5,0(s0)
  800394:	0007851b          	sext.w	a0,a5
  800398:	cb9d                	beqz	a5,8003ce <vprintfmt+0x210>
  80039a:	547d                	li	s0,-1
  80039c:	05e00d93          	li	s11,94
  8003a0:	000d4563          	bltz	s10,8003aa <vprintfmt+0x1ec>
  8003a4:	3d7d                	addiw	s10,s10,-1
  8003a6:	028d0263          	beq	s10,s0,8003ca <vprintfmt+0x20c>
  8003aa:	85a6                	mv	a1,s1
  8003ac:	0c0b8d63          	beqz	s7,800486 <vprintfmt+0x2c8>
  8003b0:	3781                	addiw	a5,a5,-32
  8003b2:	0cfdfa63          	bgeu	s11,a5,800486 <vprintfmt+0x2c8>
  8003b6:	03f00513          	li	a0,63
  8003ba:	9902                	jalr	s2
  8003bc:	000a4783          	lbu	a5,0(s4)
  8003c0:	3cfd                	addiw	s9,s9,-1
  8003c2:	0a05                	addi	s4,s4,1
  8003c4:	0007851b          	sext.w	a0,a5
  8003c8:	ffe1                	bnez	a5,8003a0 <vprintfmt+0x1e2>
  8003ca:	01905963          	blez	s9,8003dc <vprintfmt+0x21e>
  8003ce:	85a6                	mv	a1,s1
  8003d0:	02000513          	li	a0,32
  8003d4:	3cfd                	addiw	s9,s9,-1
  8003d6:	9902                	jalr	s2
  8003d8:	fe0c9be3          	bnez	s9,8003ce <vprintfmt+0x210>
  8003dc:	6a22                	ld	s4,8(sp)
  8003de:	bd11                	j	8001f2 <vprintfmt+0x34>
  8003e0:	4785                	li	a5,1
  8003e2:	008a0b93          	addi	s7,s4,8
  8003e6:	00c7c363          	blt	a5,a2,8003ec <vprintfmt+0x22e>
  8003ea:	ce25                	beqz	a2,800462 <vprintfmt+0x2a4>
  8003ec:	000a3403          	ld	s0,0(s4)
  8003f0:	08044d63          	bltz	s0,80048a <vprintfmt+0x2cc>
  8003f4:	8622                	mv	a2,s0
  8003f6:	8a5e                	mv	s4,s7
  8003f8:	46a9                	li	a3,10
  8003fa:	b5f5                	j	8002e6 <vprintfmt+0x128>
  8003fc:	000a2783          	lw	a5,0(s4)
  800400:	4661                	li	a2,24
  800402:	41f7d71b          	sraiw	a4,a5,0x1f
  800406:	8fb9                	xor	a5,a5,a4
  800408:	40e786bb          	subw	a3,a5,a4
  80040c:	02d64663          	blt	a2,a3,800438 <vprintfmt+0x27a>
  800410:	00369713          	slli	a4,a3,0x3
  800414:	00000797          	auipc	a5,0x0
  800418:	58478793          	addi	a5,a5,1412 # 800998 <error_string>
  80041c:	97ba                	add	a5,a5,a4
  80041e:	639c                	ld	a5,0(a5)
  800420:	cf81                	beqz	a5,800438 <vprintfmt+0x27a>
  800422:	86be                	mv	a3,a5
  800424:	00000617          	auipc	a2,0x0
  800428:	28c60613          	addi	a2,a2,652 # 8006b0 <main+0x15c>
  80042c:	85a6                	mv	a1,s1
  80042e:	854a                	mv	a0,s2
  800430:	0e8000ef          	jal	800518 <printfmt>
  800434:	0a21                	addi	s4,s4,8
  800436:	bb75                	j	8001f2 <vprintfmt+0x34>
  800438:	00000617          	auipc	a2,0x0
  80043c:	26860613          	addi	a2,a2,616 # 8006a0 <main+0x14c>
  800440:	85a6                	mv	a1,s1
  800442:	854a                	mv	a0,s2
  800444:	0d4000ef          	jal	800518 <printfmt>
  800448:	0a21                	addi	s4,s4,8
  80044a:	b365                	j	8001f2 <vprintfmt+0x34>
  80044c:	2605                	addiw	a2,a2,1
  80044e:	8462                	mv	s0,s8
  800450:	b3e9                	j	80021a <vprintfmt+0x5c>
  800452:	00044783          	lbu	a5,0(s0)
  800456:	0007851b          	sext.w	a0,a5
  80045a:	d3c9                	beqz	a5,8003dc <vprintfmt+0x21e>
  80045c:	00140a13          	addi	s4,s0,1
  800460:	bf2d                	j	80039a <vprintfmt+0x1dc>
  800462:	000a2403          	lw	s0,0(s4)
  800466:	b769                	j	8003f0 <vprintfmt+0x232>
  800468:	000a6603          	lwu	a2,0(s4)
  80046c:	46a1                	li	a3,8
  80046e:	8a3a                	mv	s4,a4
  800470:	bd9d                	j	8002e6 <vprintfmt+0x128>
  800472:	000a6603          	lwu	a2,0(s4)
  800476:	46a9                	li	a3,10
  800478:	8a3a                	mv	s4,a4
  80047a:	b5b5                	j	8002e6 <vprintfmt+0x128>
  80047c:	000a6603          	lwu	a2,0(s4)
  800480:	46c1                	li	a3,16
  800482:	8a3a                	mv	s4,a4
  800484:	b58d                	j	8002e6 <vprintfmt+0x128>
  800486:	9902                	jalr	s2
  800488:	bf15                	j	8003bc <vprintfmt+0x1fe>
  80048a:	85a6                	mv	a1,s1
  80048c:	02d00513          	li	a0,45
  800490:	9902                	jalr	s2
  800492:	40800633          	neg	a2,s0
  800496:	8a5e                	mv	s4,s7
  800498:	46a9                	li	a3,10
  80049a:	b5b1                	j	8002e6 <vprintfmt+0x128>
  80049c:	01905663          	blez	s9,8004a8 <vprintfmt+0x2ea>
  8004a0:	02d00793          	li	a5,45
  8004a4:	04fd9263          	bne	s11,a5,8004e8 <vprintfmt+0x32a>
  8004a8:	02800793          	li	a5,40
  8004ac:	00000a17          	auipc	s4,0x0
  8004b0:	1eda0a13          	addi	s4,s4,493 # 800699 <main+0x145>
  8004b4:	02800513          	li	a0,40
  8004b8:	b5cd                	j	80039a <vprintfmt+0x1dc>
  8004ba:	85ea                	mv	a1,s10
  8004bc:	8522                	mv	a0,s0
  8004be:	07a000ef          	jal	800538 <strnlen>
  8004c2:	40ac8cbb          	subw	s9,s9,a0
  8004c6:	01905963          	blez	s9,8004d8 <vprintfmt+0x31a>
  8004ca:	2d81                	sext.w	s11,s11
  8004cc:	85a6                	mv	a1,s1
  8004ce:	856e                	mv	a0,s11
  8004d0:	3cfd                	addiw	s9,s9,-1
  8004d2:	9902                	jalr	s2
  8004d4:	fe0c9ce3          	bnez	s9,8004cc <vprintfmt+0x30e>
  8004d8:	00044783          	lbu	a5,0(s0)
  8004dc:	0007851b          	sext.w	a0,a5
  8004e0:	ea079de3          	bnez	a5,80039a <vprintfmt+0x1dc>
  8004e4:	6a22                	ld	s4,8(sp)
  8004e6:	b331                	j	8001f2 <vprintfmt+0x34>
  8004e8:	85ea                	mv	a1,s10
  8004ea:	00000517          	auipc	a0,0x0
  8004ee:	1ae50513          	addi	a0,a0,430 # 800698 <main+0x144>
  8004f2:	046000ef          	jal	800538 <strnlen>
  8004f6:	40ac8cbb          	subw	s9,s9,a0
  8004fa:	00000417          	auipc	s0,0x0
  8004fe:	19e40413          	addi	s0,s0,414 # 800698 <main+0x144>
  800502:	00000a17          	auipc	s4,0x0
  800506:	197a0a13          	addi	s4,s4,407 # 800699 <main+0x145>
  80050a:	02800793          	li	a5,40
  80050e:	02800513          	li	a0,40
  800512:	fb904ce3          	bgtz	s9,8004ca <vprintfmt+0x30c>
  800516:	b551                	j	80039a <vprintfmt+0x1dc>

0000000000800518 <printfmt>:
  800518:	715d                	addi	sp,sp,-80
  80051a:	02810313          	addi	t1,sp,40
  80051e:	f436                	sd	a3,40(sp)
  800520:	869a                	mv	a3,t1
  800522:	ec06                	sd	ra,24(sp)
  800524:	f83a                	sd	a4,48(sp)
  800526:	fc3e                	sd	a5,56(sp)
  800528:	e0c2                	sd	a6,64(sp)
  80052a:	e4c6                	sd	a7,72(sp)
  80052c:	e41a                	sd	t1,8(sp)
  80052e:	c91ff0ef          	jal	8001be <vprintfmt>
  800532:	60e2                	ld	ra,24(sp)
  800534:	6161                	addi	sp,sp,80
  800536:	8082                	ret

0000000000800538 <strnlen>:
  800538:	4781                	li	a5,0
  80053a:	e589                	bnez	a1,800544 <strnlen+0xc>
  80053c:	a811                	j	800550 <strnlen+0x18>
  80053e:	0785                	addi	a5,a5,1
  800540:	00f58863          	beq	a1,a5,800550 <strnlen+0x18>
  800544:	00f50733          	add	a4,a0,a5
  800548:	00074703          	lbu	a4,0(a4)
  80054c:	fb6d                	bnez	a4,80053e <strnlen+0x6>
  80054e:	85be                	mv	a1,a5
  800550:	852e                	mv	a0,a1
  800552:	8082                	ret

0000000000800554 <main>:
  800554:	1101                	addi	sp,sp,-32
  800556:	ec06                	sd	ra,24(sp)
  800558:	e822                	sd	s0,16(sp)
  80055a:	be5ff0ef          	jal	80013e <fork>
  80055e:	c169                	beqz	a0,800620 <main+0xcc>
  800560:	842a                	mv	s0,a0
  800562:	0aa05063          	blez	a0,800602 <main+0xae>
  800566:	4581                	li	a1,0
  800568:	557d                	li	a0,-1
  80056a:	bd7ff0ef          	jal	800140 <waitpid>
  80056e:	c93d                	beqz	a0,8005e4 <main+0x90>
  800570:	458d                	li	a1,3
  800572:	05fa                	slli	a1,a1,0x1e
  800574:	8522                	mv	a0,s0
  800576:	bcbff0ef          	jal	800140 <waitpid>
  80057a:	c531                	beqz	a0,8005c6 <main+0x72>
  80057c:	006c                	addi	a1,sp,12
  80057e:	8522                	mv	a0,s0
  800580:	bc1ff0ef          	jal	800140 <waitpid>
  800584:	e115                	bnez	a0,8005a8 <main+0x54>
  800586:	4732                	lw	a4,12(sp)
  800588:	67b1                	lui	a5,0xc
  80058a:	eaf78793          	addi	a5,a5,-337 # beaf <_start-0x7f4171>
  80058e:	00f71d63          	bne	a4,a5,8005a8 <main+0x54>
  800592:	00000517          	auipc	a0,0x0
  800596:	29e50513          	addi	a0,a0,670 # 800830 <main+0x2dc>
  80059a:	b07ff0ef          	jal	8000a0 <cprintf>
  80059e:	60e2                	ld	ra,24(sp)
  8005a0:	6442                	ld	s0,16(sp)
  8005a2:	4501                	li	a0,0
  8005a4:	6105                	addi	sp,sp,32
  8005a6:	8082                	ret
  8005a8:	00000697          	auipc	a3,0x0
  8005ac:	25068693          	addi	a3,a3,592 # 8007f8 <main+0x2a4>
  8005b0:	00000617          	auipc	a2,0x0
  8005b4:	1e060613          	addi	a2,a2,480 # 800790 <main+0x23c>
  8005b8:	45c9                	li	a1,18
  8005ba:	00000517          	auipc	a0,0x0
  8005be:	1ee50513          	addi	a0,a0,494 # 8007a8 <main+0x254>
  8005c2:	a65ff0ef          	jal	800026 <__panic>
  8005c6:	00000697          	auipc	a3,0x0
  8005ca:	20a68693          	addi	a3,a3,522 # 8007d0 <main+0x27c>
  8005ce:	00000617          	auipc	a2,0x0
  8005d2:	1c260613          	addi	a2,a2,450 # 800790 <main+0x23c>
  8005d6:	45c5                	li	a1,17
  8005d8:	00000517          	auipc	a0,0x0
  8005dc:	1d050513          	addi	a0,a0,464 # 8007a8 <main+0x254>
  8005e0:	a47ff0ef          	jal	800026 <__panic>
  8005e4:	00000697          	auipc	a3,0x0
  8005e8:	1d468693          	addi	a3,a3,468 # 8007b8 <main+0x264>
  8005ec:	00000617          	auipc	a2,0x0
  8005f0:	1a460613          	addi	a2,a2,420 # 800790 <main+0x23c>
  8005f4:	45c1                	li	a1,16
  8005f6:	00000517          	auipc	a0,0x0
  8005fa:	1b250513          	addi	a0,a0,434 # 8007a8 <main+0x254>
  8005fe:	a29ff0ef          	jal	800026 <__panic>
  800602:	00000697          	auipc	a3,0x0
  800606:	18668693          	addi	a3,a3,390 # 800788 <main+0x234>
  80060a:	00000617          	auipc	a2,0x0
  80060e:	18660613          	addi	a2,a2,390 # 800790 <main+0x23c>
  800612:	45bd                	li	a1,15
  800614:	00000517          	auipc	a0,0x0
  800618:	19450513          	addi	a0,a0,404 # 8007a8 <main+0x254>
  80061c:	a0bff0ef          	jal	800026 <__panic>
  800620:	00000517          	auipc	a0,0x0
  800624:	15850513          	addi	a0,a0,344 # 800778 <main+0x224>
  800628:	a79ff0ef          	jal	8000a0 <cprintf>
  80062c:	4429                	li	s0,10
  80062e:	347d                	addiw	s0,s0,-1
  800630:	b13ff0ef          	jal	800142 <yield>
  800634:	fc6d                	bnez	s0,80062e <main+0xda>
  800636:	6531                	lui	a0,0xc
  800638:	eaf50513          	addi	a0,a0,-337 # beaf <_start-0x7f4171>
  80063c:	aedff0ef          	jal	800128 <exit>
