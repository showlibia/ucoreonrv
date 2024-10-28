
obj/__user_divzero.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	10e000ef          	jal	80012e <umain>
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
  800038:	54c50513          	addi	a0,a0,1356 # 800580 <main+0x42>
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
  800058:	54c50513          	addi	a0,a0,1356 # 8005a0 <main+0x62>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0b6000ef          	jal	800118 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0a4000ef          	jal	800112 <sys_putc>
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
  800094:	114000ef          	jal	8001a8 <vprintfmt>
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
  8000c8:	0e0000ef          	jal	8001a8 <vprintfmt>
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

0000000000800112 <sys_putc>:
  800112:	85aa                	mv	a1,a0
  800114:	4579                	li	a0,30
  800116:	bf7d                	j	8000d4 <syscall>

0000000000800118 <exit>:
  800118:	1141                	addi	sp,sp,-16
  80011a:	e406                	sd	ra,8(sp)
  80011c:	ff1ff0ef          	jal	80010c <sys_exit>
  800120:	00000517          	auipc	a0,0x0
  800124:	48850513          	addi	a0,a0,1160 # 8005a8 <main+0x6a>
  800128:	f79ff0ef          	jal	8000a0 <cprintf>
  80012c:	a001                	j	80012c <exit+0x14>

000000000080012e <umain>:
  80012e:	1141                	addi	sp,sp,-16
  800130:	e406                	sd	ra,8(sp)
  800132:	40c000ef          	jal	80053e <main>
  800136:	fe3ff0ef          	jal	800118 <exit>

000000000080013a <printnum>:
  80013a:	02069813          	slli	a6,a3,0x20
  80013e:	7179                	addi	sp,sp,-48
  800140:	02085813          	srli	a6,a6,0x20
  800144:	e052                	sd	s4,0(sp)
  800146:	03067a33          	remu	s4,a2,a6
  80014a:	f022                	sd	s0,32(sp)
  80014c:	ec26                	sd	s1,24(sp)
  80014e:	e84a                	sd	s2,16(sp)
  800150:	f406                	sd	ra,40(sp)
  800152:	84aa                	mv	s1,a0
  800154:	892e                	mv	s2,a1
  800156:	fff7041b          	addiw	s0,a4,-1
  80015a:	2a01                	sext.w	s4,s4
  80015c:	05067063          	bgeu	a2,a6,80019c <printnum+0x62>
  800160:	e44e                	sd	s3,8(sp)
  800162:	89be                	mv	s3,a5
  800164:	4785                	li	a5,1
  800166:	00e7d763          	bge	a5,a4,800174 <printnum+0x3a>
  80016a:	85ca                	mv	a1,s2
  80016c:	854e                	mv	a0,s3
  80016e:	347d                	addiw	s0,s0,-1
  800170:	9482                	jalr	s1
  800172:	fc65                	bnez	s0,80016a <printnum+0x30>
  800174:	69a2                	ld	s3,8(sp)
  800176:	1a02                	slli	s4,s4,0x20
  800178:	020a5a13          	srli	s4,s4,0x20
  80017c:	00000797          	auipc	a5,0x0
  800180:	44478793          	addi	a5,a5,1092 # 8005c0 <main+0x82>
  800184:	97d2                	add	a5,a5,s4
  800186:	7402                	ld	s0,32(sp)
  800188:	0007c503          	lbu	a0,0(a5)
  80018c:	70a2                	ld	ra,40(sp)
  80018e:	6a02                	ld	s4,0(sp)
  800190:	85ca                	mv	a1,s2
  800192:	87a6                	mv	a5,s1
  800194:	6942                	ld	s2,16(sp)
  800196:	64e2                	ld	s1,24(sp)
  800198:	6145                	addi	sp,sp,48
  80019a:	8782                	jr	a5
  80019c:	03065633          	divu	a2,a2,a6
  8001a0:	8722                	mv	a4,s0
  8001a2:	f99ff0ef          	jal	80013a <printnum>
  8001a6:	bfc1                	j	800176 <printnum+0x3c>

00000000008001a8 <vprintfmt>:
  8001a8:	7119                	addi	sp,sp,-128
  8001aa:	f4a6                	sd	s1,104(sp)
  8001ac:	f0ca                	sd	s2,96(sp)
  8001ae:	ecce                	sd	s3,88(sp)
  8001b0:	e8d2                	sd	s4,80(sp)
  8001b2:	e4d6                	sd	s5,72(sp)
  8001b4:	e0da                	sd	s6,64(sp)
  8001b6:	f862                	sd	s8,48(sp)
  8001b8:	fc86                	sd	ra,120(sp)
  8001ba:	f8a2                	sd	s0,112(sp)
  8001bc:	fc5e                	sd	s7,56(sp)
  8001be:	f466                	sd	s9,40(sp)
  8001c0:	f06a                	sd	s10,32(sp)
  8001c2:	ec6e                	sd	s11,24(sp)
  8001c4:	892a                	mv	s2,a0
  8001c6:	84ae                	mv	s1,a1
  8001c8:	8c32                	mv	s8,a2
  8001ca:	8a36                	mv	s4,a3
  8001cc:	02500993          	li	s3,37
  8001d0:	05500b13          	li	s6,85
  8001d4:	00000a97          	auipc	s5,0x0
  8001d8:	514a8a93          	addi	s5,s5,1300 # 8006e8 <main+0x1aa>
  8001dc:	000c4503          	lbu	a0,0(s8)
  8001e0:	001c0413          	addi	s0,s8,1
  8001e4:	01350a63          	beq	a0,s3,8001f8 <vprintfmt+0x50>
  8001e8:	cd0d                	beqz	a0,800222 <vprintfmt+0x7a>
  8001ea:	85a6                	mv	a1,s1
  8001ec:	9902                	jalr	s2
  8001ee:	00044503          	lbu	a0,0(s0)
  8001f2:	0405                	addi	s0,s0,1
  8001f4:	ff351ae3          	bne	a0,s3,8001e8 <vprintfmt+0x40>
  8001f8:	02000d93          	li	s11,32
  8001fc:	4b81                	li	s7,0
  8001fe:	4601                	li	a2,0
  800200:	5d7d                	li	s10,-1
  800202:	5cfd                	li	s9,-1
  800204:	00044683          	lbu	a3,0(s0)
  800208:	00140c13          	addi	s8,s0,1
  80020c:	fdd6859b          	addiw	a1,a3,-35
  800210:	0ff5f593          	zext.b	a1,a1
  800214:	02bb6663          	bltu	s6,a1,800240 <vprintfmt+0x98>
  800218:	058a                	slli	a1,a1,0x2
  80021a:	95d6                	add	a1,a1,s5
  80021c:	4198                	lw	a4,0(a1)
  80021e:	9756                	add	a4,a4,s5
  800220:	8702                	jr	a4
  800222:	70e6                	ld	ra,120(sp)
  800224:	7446                	ld	s0,112(sp)
  800226:	74a6                	ld	s1,104(sp)
  800228:	7906                	ld	s2,96(sp)
  80022a:	69e6                	ld	s3,88(sp)
  80022c:	6a46                	ld	s4,80(sp)
  80022e:	6aa6                	ld	s5,72(sp)
  800230:	6b06                	ld	s6,64(sp)
  800232:	7be2                	ld	s7,56(sp)
  800234:	7c42                	ld	s8,48(sp)
  800236:	7ca2                	ld	s9,40(sp)
  800238:	7d02                	ld	s10,32(sp)
  80023a:	6de2                	ld	s11,24(sp)
  80023c:	6109                	addi	sp,sp,128
  80023e:	8082                	ret
  800240:	85a6                	mv	a1,s1
  800242:	02500513          	li	a0,37
  800246:	9902                	jalr	s2
  800248:	fff44703          	lbu	a4,-1(s0)
  80024c:	02500793          	li	a5,37
  800250:	8c22                	mv	s8,s0
  800252:	f8f705e3          	beq	a4,a5,8001dc <vprintfmt+0x34>
  800256:	02500713          	li	a4,37
  80025a:	ffec4783          	lbu	a5,-2(s8)
  80025e:	1c7d                	addi	s8,s8,-1
  800260:	fee79de3          	bne	a5,a4,80025a <vprintfmt+0xb2>
  800264:	bfa5                	j	8001dc <vprintfmt+0x34>
  800266:	00144783          	lbu	a5,1(s0)
  80026a:	4725                	li	a4,9
  80026c:	fd068d1b          	addiw	s10,a3,-48
  800270:	fd07859b          	addiw	a1,a5,-48
  800274:	0007869b          	sext.w	a3,a5
  800278:	8462                	mv	s0,s8
  80027a:	02b76563          	bltu	a4,a1,8002a4 <vprintfmt+0xfc>
  80027e:	4525                	li	a0,9
  800280:	00144783          	lbu	a5,1(s0)
  800284:	002d171b          	slliw	a4,s10,0x2
  800288:	01a7073b          	addw	a4,a4,s10
  80028c:	0017171b          	slliw	a4,a4,0x1
  800290:	9f35                	addw	a4,a4,a3
  800292:	fd07859b          	addiw	a1,a5,-48
  800296:	0405                	addi	s0,s0,1
  800298:	fd070d1b          	addiw	s10,a4,-48
  80029c:	0007869b          	sext.w	a3,a5
  8002a0:	feb570e3          	bgeu	a0,a1,800280 <vprintfmt+0xd8>
  8002a4:	f60cd0e3          	bgez	s9,800204 <vprintfmt+0x5c>
  8002a8:	8cea                	mv	s9,s10
  8002aa:	5d7d                	li	s10,-1
  8002ac:	bfa1                	j	800204 <vprintfmt+0x5c>
  8002ae:	8db6                	mv	s11,a3
  8002b0:	8462                	mv	s0,s8
  8002b2:	bf89                	j	800204 <vprintfmt+0x5c>
  8002b4:	8462                	mv	s0,s8
  8002b6:	4b85                	li	s7,1
  8002b8:	b7b1                	j	800204 <vprintfmt+0x5c>
  8002ba:	4785                	li	a5,1
  8002bc:	008a0713          	addi	a4,s4,8
  8002c0:	00c7c463          	blt	a5,a2,8002c8 <vprintfmt+0x120>
  8002c4:	1a060163          	beqz	a2,800466 <vprintfmt+0x2be>
  8002c8:	000a3603          	ld	a2,0(s4)
  8002cc:	46c1                	li	a3,16
  8002ce:	8a3a                	mv	s4,a4
  8002d0:	000d879b          	sext.w	a5,s11
  8002d4:	8766                	mv	a4,s9
  8002d6:	85a6                	mv	a1,s1
  8002d8:	854a                	mv	a0,s2
  8002da:	e61ff0ef          	jal	80013a <printnum>
  8002de:	bdfd                	j	8001dc <vprintfmt+0x34>
  8002e0:	000a2503          	lw	a0,0(s4)
  8002e4:	85a6                	mv	a1,s1
  8002e6:	0a21                	addi	s4,s4,8
  8002e8:	9902                	jalr	s2
  8002ea:	bdcd                	j	8001dc <vprintfmt+0x34>
  8002ec:	4785                	li	a5,1
  8002ee:	008a0713          	addi	a4,s4,8
  8002f2:	00c7c463          	blt	a5,a2,8002fa <vprintfmt+0x152>
  8002f6:	16060363          	beqz	a2,80045c <vprintfmt+0x2b4>
  8002fa:	000a3603          	ld	a2,0(s4)
  8002fe:	46a9                	li	a3,10
  800300:	8a3a                	mv	s4,a4
  800302:	b7f9                	j	8002d0 <vprintfmt+0x128>
  800304:	85a6                	mv	a1,s1
  800306:	03000513          	li	a0,48
  80030a:	9902                	jalr	s2
  80030c:	85a6                	mv	a1,s1
  80030e:	07800513          	li	a0,120
  800312:	9902                	jalr	s2
  800314:	000a3603          	ld	a2,0(s4)
  800318:	46c1                	li	a3,16
  80031a:	0a21                	addi	s4,s4,8
  80031c:	bf55                	j	8002d0 <vprintfmt+0x128>
  80031e:	85a6                	mv	a1,s1
  800320:	02500513          	li	a0,37
  800324:	9902                	jalr	s2
  800326:	bd5d                	j	8001dc <vprintfmt+0x34>
  800328:	000a2d03          	lw	s10,0(s4)
  80032c:	8462                	mv	s0,s8
  80032e:	0a21                	addi	s4,s4,8
  800330:	bf95                	j	8002a4 <vprintfmt+0xfc>
  800332:	4785                	li	a5,1
  800334:	008a0713          	addi	a4,s4,8
  800338:	00c7c463          	blt	a5,a2,800340 <vprintfmt+0x198>
  80033c:	10060b63          	beqz	a2,800452 <vprintfmt+0x2aa>
  800340:	000a3603          	ld	a2,0(s4)
  800344:	46a1                	li	a3,8
  800346:	8a3a                	mv	s4,a4
  800348:	b761                	j	8002d0 <vprintfmt+0x128>
  80034a:	fffcc793          	not	a5,s9
  80034e:	97fd                	srai	a5,a5,0x3f
  800350:	00fcf7b3          	and	a5,s9,a5
  800354:	00078c9b          	sext.w	s9,a5
  800358:	8462                	mv	s0,s8
  80035a:	b56d                	j	800204 <vprintfmt+0x5c>
  80035c:	000a3403          	ld	s0,0(s4)
  800360:	008a0793          	addi	a5,s4,8
  800364:	e43e                	sd	a5,8(sp)
  800366:	12040063          	beqz	s0,800486 <vprintfmt+0x2de>
  80036a:	0d905963          	blez	s9,80043c <vprintfmt+0x294>
  80036e:	02d00793          	li	a5,45
  800372:	00140a13          	addi	s4,s0,1
  800376:	12fd9763          	bne	s11,a5,8004a4 <vprintfmt+0x2fc>
  80037a:	00044783          	lbu	a5,0(s0)
  80037e:	0007851b          	sext.w	a0,a5
  800382:	cb9d                	beqz	a5,8003b8 <vprintfmt+0x210>
  800384:	547d                	li	s0,-1
  800386:	05e00d93          	li	s11,94
  80038a:	000d4563          	bltz	s10,800394 <vprintfmt+0x1ec>
  80038e:	3d7d                	addiw	s10,s10,-1
  800390:	028d0263          	beq	s10,s0,8003b4 <vprintfmt+0x20c>
  800394:	85a6                	mv	a1,s1
  800396:	0c0b8d63          	beqz	s7,800470 <vprintfmt+0x2c8>
  80039a:	3781                	addiw	a5,a5,-32
  80039c:	0cfdfa63          	bgeu	s11,a5,800470 <vprintfmt+0x2c8>
  8003a0:	03f00513          	li	a0,63
  8003a4:	9902                	jalr	s2
  8003a6:	000a4783          	lbu	a5,0(s4)
  8003aa:	3cfd                	addiw	s9,s9,-1
  8003ac:	0a05                	addi	s4,s4,1
  8003ae:	0007851b          	sext.w	a0,a5
  8003b2:	ffe1                	bnez	a5,80038a <vprintfmt+0x1e2>
  8003b4:	01905963          	blez	s9,8003c6 <vprintfmt+0x21e>
  8003b8:	85a6                	mv	a1,s1
  8003ba:	02000513          	li	a0,32
  8003be:	3cfd                	addiw	s9,s9,-1
  8003c0:	9902                	jalr	s2
  8003c2:	fe0c9be3          	bnez	s9,8003b8 <vprintfmt+0x210>
  8003c6:	6a22                	ld	s4,8(sp)
  8003c8:	bd11                	j	8001dc <vprintfmt+0x34>
  8003ca:	4785                	li	a5,1
  8003cc:	008a0b93          	addi	s7,s4,8
  8003d0:	00c7c363          	blt	a5,a2,8003d6 <vprintfmt+0x22e>
  8003d4:	ce25                	beqz	a2,80044c <vprintfmt+0x2a4>
  8003d6:	000a3403          	ld	s0,0(s4)
  8003da:	08044d63          	bltz	s0,800474 <vprintfmt+0x2cc>
  8003de:	8622                	mv	a2,s0
  8003e0:	8a5e                	mv	s4,s7
  8003e2:	46a9                	li	a3,10
  8003e4:	b5f5                	j	8002d0 <vprintfmt+0x128>
  8003e6:	000a2783          	lw	a5,0(s4)
  8003ea:	4661                	li	a2,24
  8003ec:	41f7d71b          	sraiw	a4,a5,0x1f
  8003f0:	8fb9                	xor	a5,a5,a4
  8003f2:	40e786bb          	subw	a3,a5,a4
  8003f6:	02d64663          	blt	a2,a3,800422 <vprintfmt+0x27a>
  8003fa:	00369713          	slli	a4,a3,0x3
  8003fe:	00000797          	auipc	a5,0x0
  800402:	44278793          	addi	a5,a5,1090 # 800840 <error_string>
  800406:	97ba                	add	a5,a5,a4
  800408:	639c                	ld	a5,0(a5)
  80040a:	cf81                	beqz	a5,800422 <vprintfmt+0x27a>
  80040c:	86be                	mv	a3,a5
  80040e:	00000617          	auipc	a2,0x0
  800412:	1e260613          	addi	a2,a2,482 # 8005f0 <main+0xb2>
  800416:	85a6                	mv	a1,s1
  800418:	854a                	mv	a0,s2
  80041a:	0e8000ef          	jal	800502 <printfmt>
  80041e:	0a21                	addi	s4,s4,8
  800420:	bb75                	j	8001dc <vprintfmt+0x34>
  800422:	00000617          	auipc	a2,0x0
  800426:	1be60613          	addi	a2,a2,446 # 8005e0 <main+0xa2>
  80042a:	85a6                	mv	a1,s1
  80042c:	854a                	mv	a0,s2
  80042e:	0d4000ef          	jal	800502 <printfmt>
  800432:	0a21                	addi	s4,s4,8
  800434:	b365                	j	8001dc <vprintfmt+0x34>
  800436:	2605                	addiw	a2,a2,1
  800438:	8462                	mv	s0,s8
  80043a:	b3e9                	j	800204 <vprintfmt+0x5c>
  80043c:	00044783          	lbu	a5,0(s0)
  800440:	0007851b          	sext.w	a0,a5
  800444:	d3c9                	beqz	a5,8003c6 <vprintfmt+0x21e>
  800446:	00140a13          	addi	s4,s0,1
  80044a:	bf2d                	j	800384 <vprintfmt+0x1dc>
  80044c:	000a2403          	lw	s0,0(s4)
  800450:	b769                	j	8003da <vprintfmt+0x232>
  800452:	000a6603          	lwu	a2,0(s4)
  800456:	46a1                	li	a3,8
  800458:	8a3a                	mv	s4,a4
  80045a:	bd9d                	j	8002d0 <vprintfmt+0x128>
  80045c:	000a6603          	lwu	a2,0(s4)
  800460:	46a9                	li	a3,10
  800462:	8a3a                	mv	s4,a4
  800464:	b5b5                	j	8002d0 <vprintfmt+0x128>
  800466:	000a6603          	lwu	a2,0(s4)
  80046a:	46c1                	li	a3,16
  80046c:	8a3a                	mv	s4,a4
  80046e:	b58d                	j	8002d0 <vprintfmt+0x128>
  800470:	9902                	jalr	s2
  800472:	bf15                	j	8003a6 <vprintfmt+0x1fe>
  800474:	85a6                	mv	a1,s1
  800476:	02d00513          	li	a0,45
  80047a:	9902                	jalr	s2
  80047c:	40800633          	neg	a2,s0
  800480:	8a5e                	mv	s4,s7
  800482:	46a9                	li	a3,10
  800484:	b5b1                	j	8002d0 <vprintfmt+0x128>
  800486:	01905663          	blez	s9,800492 <vprintfmt+0x2ea>
  80048a:	02d00793          	li	a5,45
  80048e:	04fd9263          	bne	s11,a5,8004d2 <vprintfmt+0x32a>
  800492:	02800793          	li	a5,40
  800496:	00000a17          	auipc	s4,0x0
  80049a:	143a0a13          	addi	s4,s4,323 # 8005d9 <main+0x9b>
  80049e:	02800513          	li	a0,40
  8004a2:	b5cd                	j	800384 <vprintfmt+0x1dc>
  8004a4:	85ea                	mv	a1,s10
  8004a6:	8522                	mv	a0,s0
  8004a8:	07a000ef          	jal	800522 <strnlen>
  8004ac:	40ac8cbb          	subw	s9,s9,a0
  8004b0:	01905963          	blez	s9,8004c2 <vprintfmt+0x31a>
  8004b4:	2d81                	sext.w	s11,s11
  8004b6:	85a6                	mv	a1,s1
  8004b8:	856e                	mv	a0,s11
  8004ba:	3cfd                	addiw	s9,s9,-1
  8004bc:	9902                	jalr	s2
  8004be:	fe0c9ce3          	bnez	s9,8004b6 <vprintfmt+0x30e>
  8004c2:	00044783          	lbu	a5,0(s0)
  8004c6:	0007851b          	sext.w	a0,a5
  8004ca:	ea079de3          	bnez	a5,800384 <vprintfmt+0x1dc>
  8004ce:	6a22                	ld	s4,8(sp)
  8004d0:	b331                	j	8001dc <vprintfmt+0x34>
  8004d2:	85ea                	mv	a1,s10
  8004d4:	00000517          	auipc	a0,0x0
  8004d8:	10450513          	addi	a0,a0,260 # 8005d8 <main+0x9a>
  8004dc:	046000ef          	jal	800522 <strnlen>
  8004e0:	40ac8cbb          	subw	s9,s9,a0
  8004e4:	00000417          	auipc	s0,0x0
  8004e8:	0f440413          	addi	s0,s0,244 # 8005d8 <main+0x9a>
  8004ec:	00000a17          	auipc	s4,0x0
  8004f0:	0eda0a13          	addi	s4,s4,237 # 8005d9 <main+0x9b>
  8004f4:	02800793          	li	a5,40
  8004f8:	02800513          	li	a0,40
  8004fc:	fb904ce3          	bgtz	s9,8004b4 <vprintfmt+0x30c>
  800500:	b551                	j	800384 <vprintfmt+0x1dc>

0000000000800502 <printfmt>:
  800502:	715d                	addi	sp,sp,-80
  800504:	02810313          	addi	t1,sp,40
  800508:	f436                	sd	a3,40(sp)
  80050a:	869a                	mv	a3,t1
  80050c:	ec06                	sd	ra,24(sp)
  80050e:	f83a                	sd	a4,48(sp)
  800510:	fc3e                	sd	a5,56(sp)
  800512:	e0c2                	sd	a6,64(sp)
  800514:	e4c6                	sd	a7,72(sp)
  800516:	e41a                	sd	t1,8(sp)
  800518:	c91ff0ef          	jal	8001a8 <vprintfmt>
  80051c:	60e2                	ld	ra,24(sp)
  80051e:	6161                	addi	sp,sp,80
  800520:	8082                	ret

0000000000800522 <strnlen>:
  800522:	4781                	li	a5,0
  800524:	e589                	bnez	a1,80052e <strnlen+0xc>
  800526:	a811                	j	80053a <strnlen+0x18>
  800528:	0785                	addi	a5,a5,1
  80052a:	00f58863          	beq	a1,a5,80053a <strnlen+0x18>
  80052e:	00f50733          	add	a4,a0,a5
  800532:	00074703          	lbu	a4,0(a4)
  800536:	fb6d                	bnez	a4,800528 <strnlen+0x6>
  800538:	85be                	mv	a1,a5
  80053a:	852e                	mv	a0,a1
  80053c:	8082                	ret

000000000080053e <main>:
  80053e:	00001717          	auipc	a4,0x1
  800542:	ac272703          	lw	a4,-1342(a4) # 801000 <zero>
  800546:	1141                	addi	sp,sp,-16
  800548:	0017079b          	addiw	a5,a4,1
  80054c:	e406                	sd	ra,8(sp)
  80054e:	0037b793          	sltiu	a5,a5,3
  800552:	0007059b          	sext.w	a1,a4
  800556:	e391                	bnez	a5,80055a <main+0x1c>
  800558:	4581                	li	a1,0
  80055a:	00000517          	auipc	a0,0x0
  80055e:	15e50513          	addi	a0,a0,350 # 8006b8 <main+0x17a>
  800562:	b3fff0ef          	jal	8000a0 <cprintf>
  800566:	00000617          	auipc	a2,0x0
  80056a:	16260613          	addi	a2,a2,354 # 8006c8 <main+0x18a>
  80056e:	45a5                	li	a1,9
  800570:	00000517          	auipc	a0,0x0
  800574:	16850513          	addi	a0,a0,360 # 8006d8 <main+0x19a>
  800578:	aafff0ef          	jal	800026 <__panic>
