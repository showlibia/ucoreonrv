
obj/__user_forktest.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	122000ef          	jal	800142 <umain>
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
  800038:	5cc50513          	addi	a0,a0,1484 # 800600 <main+0xae>
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
  800058:	5cc50513          	addi	a0,a0,1484 # 800620 <main+0xce>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0c2000ef          	jal	800124 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0b0000ef          	jal	80011e <sys_putc>
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
  800094:	128000ef          	jal	8001bc <vprintfmt>
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
  8000c8:	0f4000ef          	jal	8001bc <vprintfmt>
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

000000000080011e <sys_putc>:
  80011e:	85aa                	mv	a1,a0
  800120:	4579                	li	a0,30
  800122:	bf4d                	j	8000d4 <syscall>

0000000000800124 <exit>:
  800124:	1141                	addi	sp,sp,-16
  800126:	e406                	sd	ra,8(sp)
  800128:	fe5ff0ef          	jal	80010c <sys_exit>
  80012c:	00000517          	auipc	a0,0x0
  800130:	4fc50513          	addi	a0,a0,1276 # 800628 <main+0xd6>
  800134:	f6dff0ef          	jal	8000a0 <cprintf>
  800138:	a001                	j	800138 <exit+0x14>

000000000080013a <fork>:
  80013a:	bfe1                	j	800112 <sys_fork>

000000000080013c <wait>:
  80013c:	4581                	li	a1,0
  80013e:	4501                	li	a0,0
  800140:	bfd9                	j	800116 <sys_wait>

0000000000800142 <umain>:
  800142:	1141                	addi	sp,sp,-16
  800144:	e406                	sd	ra,8(sp)
  800146:	40c000ef          	jal	800552 <main>
  80014a:	fdbff0ef          	jal	800124 <exit>

000000000080014e <printnum>:
  80014e:	02069813          	slli	a6,a3,0x20
  800152:	7179                	addi	sp,sp,-48
  800154:	02085813          	srli	a6,a6,0x20
  800158:	e052                	sd	s4,0(sp)
  80015a:	03067a33          	remu	s4,a2,a6
  80015e:	f022                	sd	s0,32(sp)
  800160:	ec26                	sd	s1,24(sp)
  800162:	e84a                	sd	s2,16(sp)
  800164:	f406                	sd	ra,40(sp)
  800166:	84aa                	mv	s1,a0
  800168:	892e                	mv	s2,a1
  80016a:	fff7041b          	addiw	s0,a4,-1
  80016e:	2a01                	sext.w	s4,s4
  800170:	05067063          	bgeu	a2,a6,8001b0 <printnum+0x62>
  800174:	e44e                	sd	s3,8(sp)
  800176:	89be                	mv	s3,a5
  800178:	4785                	li	a5,1
  80017a:	00e7d763          	bge	a5,a4,800188 <printnum+0x3a>
  80017e:	85ca                	mv	a1,s2
  800180:	854e                	mv	a0,s3
  800182:	347d                	addiw	s0,s0,-1
  800184:	9482                	jalr	s1
  800186:	fc65                	bnez	s0,80017e <printnum+0x30>
  800188:	69a2                	ld	s3,8(sp)
  80018a:	1a02                	slli	s4,s4,0x20
  80018c:	020a5a13          	srli	s4,s4,0x20
  800190:	00000797          	auipc	a5,0x0
  800194:	4b078793          	addi	a5,a5,1200 # 800640 <main+0xee>
  800198:	97d2                	add	a5,a5,s4
  80019a:	7402                	ld	s0,32(sp)
  80019c:	0007c503          	lbu	a0,0(a5)
  8001a0:	70a2                	ld	ra,40(sp)
  8001a2:	6a02                	ld	s4,0(sp)
  8001a4:	85ca                	mv	a1,s2
  8001a6:	87a6                	mv	a5,s1
  8001a8:	6942                	ld	s2,16(sp)
  8001aa:	64e2                	ld	s1,24(sp)
  8001ac:	6145                	addi	sp,sp,48
  8001ae:	8782                	jr	a5
  8001b0:	03065633          	divu	a2,a2,a6
  8001b4:	8722                	mv	a4,s0
  8001b6:	f99ff0ef          	jal	80014e <printnum>
  8001ba:	bfc1                	j	80018a <printnum+0x3c>

00000000008001bc <vprintfmt>:
  8001bc:	7119                	addi	sp,sp,-128
  8001be:	f4a6                	sd	s1,104(sp)
  8001c0:	f0ca                	sd	s2,96(sp)
  8001c2:	ecce                	sd	s3,88(sp)
  8001c4:	e8d2                	sd	s4,80(sp)
  8001c6:	e4d6                	sd	s5,72(sp)
  8001c8:	e0da                	sd	s6,64(sp)
  8001ca:	f862                	sd	s8,48(sp)
  8001cc:	fc86                	sd	ra,120(sp)
  8001ce:	f8a2                	sd	s0,112(sp)
  8001d0:	fc5e                	sd	s7,56(sp)
  8001d2:	f466                	sd	s9,40(sp)
  8001d4:	f06a                	sd	s10,32(sp)
  8001d6:	ec6e                	sd	s11,24(sp)
  8001d8:	892a                	mv	s2,a0
  8001da:	84ae                	mv	s1,a1
  8001dc:	8c32                	mv	s8,a2
  8001de:	8a36                	mv	s4,a3
  8001e0:	02500993          	li	s3,37
  8001e4:	05500b13          	li	s6,85
  8001e8:	00000a97          	auipc	s5,0x0
  8001ec:	5d0a8a93          	addi	s5,s5,1488 # 8007b8 <main+0x266>
  8001f0:	000c4503          	lbu	a0,0(s8)
  8001f4:	001c0413          	addi	s0,s8,1
  8001f8:	01350a63          	beq	a0,s3,80020c <vprintfmt+0x50>
  8001fc:	cd0d                	beqz	a0,800236 <vprintfmt+0x7a>
  8001fe:	85a6                	mv	a1,s1
  800200:	9902                	jalr	s2
  800202:	00044503          	lbu	a0,0(s0)
  800206:	0405                	addi	s0,s0,1
  800208:	ff351ae3          	bne	a0,s3,8001fc <vprintfmt+0x40>
  80020c:	02000d93          	li	s11,32
  800210:	4b81                	li	s7,0
  800212:	4601                	li	a2,0
  800214:	5d7d                	li	s10,-1
  800216:	5cfd                	li	s9,-1
  800218:	00044683          	lbu	a3,0(s0)
  80021c:	00140c13          	addi	s8,s0,1
  800220:	fdd6859b          	addiw	a1,a3,-35
  800224:	0ff5f593          	zext.b	a1,a1
  800228:	02bb6663          	bltu	s6,a1,800254 <vprintfmt+0x98>
  80022c:	058a                	slli	a1,a1,0x2
  80022e:	95d6                	add	a1,a1,s5
  800230:	4198                	lw	a4,0(a1)
  800232:	9756                	add	a4,a4,s5
  800234:	8702                	jr	a4
  800236:	70e6                	ld	ra,120(sp)
  800238:	7446                	ld	s0,112(sp)
  80023a:	74a6                	ld	s1,104(sp)
  80023c:	7906                	ld	s2,96(sp)
  80023e:	69e6                	ld	s3,88(sp)
  800240:	6a46                	ld	s4,80(sp)
  800242:	6aa6                	ld	s5,72(sp)
  800244:	6b06                	ld	s6,64(sp)
  800246:	7be2                	ld	s7,56(sp)
  800248:	7c42                	ld	s8,48(sp)
  80024a:	7ca2                	ld	s9,40(sp)
  80024c:	7d02                	ld	s10,32(sp)
  80024e:	6de2                	ld	s11,24(sp)
  800250:	6109                	addi	sp,sp,128
  800252:	8082                	ret
  800254:	85a6                	mv	a1,s1
  800256:	02500513          	li	a0,37
  80025a:	9902                	jalr	s2
  80025c:	fff44703          	lbu	a4,-1(s0)
  800260:	02500793          	li	a5,37
  800264:	8c22                	mv	s8,s0
  800266:	f8f705e3          	beq	a4,a5,8001f0 <vprintfmt+0x34>
  80026a:	02500713          	li	a4,37
  80026e:	ffec4783          	lbu	a5,-2(s8)
  800272:	1c7d                	addi	s8,s8,-1
  800274:	fee79de3          	bne	a5,a4,80026e <vprintfmt+0xb2>
  800278:	bfa5                	j	8001f0 <vprintfmt+0x34>
  80027a:	00144783          	lbu	a5,1(s0)
  80027e:	4725                	li	a4,9
  800280:	fd068d1b          	addiw	s10,a3,-48
  800284:	fd07859b          	addiw	a1,a5,-48
  800288:	0007869b          	sext.w	a3,a5
  80028c:	8462                	mv	s0,s8
  80028e:	02b76563          	bltu	a4,a1,8002b8 <vprintfmt+0xfc>
  800292:	4525                	li	a0,9
  800294:	00144783          	lbu	a5,1(s0)
  800298:	002d171b          	slliw	a4,s10,0x2
  80029c:	01a7073b          	addw	a4,a4,s10
  8002a0:	0017171b          	slliw	a4,a4,0x1
  8002a4:	9f35                	addw	a4,a4,a3
  8002a6:	fd07859b          	addiw	a1,a5,-48
  8002aa:	0405                	addi	s0,s0,1
  8002ac:	fd070d1b          	addiw	s10,a4,-48
  8002b0:	0007869b          	sext.w	a3,a5
  8002b4:	feb570e3          	bgeu	a0,a1,800294 <vprintfmt+0xd8>
  8002b8:	f60cd0e3          	bgez	s9,800218 <vprintfmt+0x5c>
  8002bc:	8cea                	mv	s9,s10
  8002be:	5d7d                	li	s10,-1
  8002c0:	bfa1                	j	800218 <vprintfmt+0x5c>
  8002c2:	8db6                	mv	s11,a3
  8002c4:	8462                	mv	s0,s8
  8002c6:	bf89                	j	800218 <vprintfmt+0x5c>
  8002c8:	8462                	mv	s0,s8
  8002ca:	4b85                	li	s7,1
  8002cc:	b7b1                	j	800218 <vprintfmt+0x5c>
  8002ce:	4785                	li	a5,1
  8002d0:	008a0713          	addi	a4,s4,8
  8002d4:	00c7c463          	blt	a5,a2,8002dc <vprintfmt+0x120>
  8002d8:	1a060163          	beqz	a2,80047a <vprintfmt+0x2be>
  8002dc:	000a3603          	ld	a2,0(s4)
  8002e0:	46c1                	li	a3,16
  8002e2:	8a3a                	mv	s4,a4
  8002e4:	000d879b          	sext.w	a5,s11
  8002e8:	8766                	mv	a4,s9
  8002ea:	85a6                	mv	a1,s1
  8002ec:	854a                	mv	a0,s2
  8002ee:	e61ff0ef          	jal	80014e <printnum>
  8002f2:	bdfd                	j	8001f0 <vprintfmt+0x34>
  8002f4:	000a2503          	lw	a0,0(s4)
  8002f8:	85a6                	mv	a1,s1
  8002fa:	0a21                	addi	s4,s4,8
  8002fc:	9902                	jalr	s2
  8002fe:	bdcd                	j	8001f0 <vprintfmt+0x34>
  800300:	4785                	li	a5,1
  800302:	008a0713          	addi	a4,s4,8
  800306:	00c7c463          	blt	a5,a2,80030e <vprintfmt+0x152>
  80030a:	16060363          	beqz	a2,800470 <vprintfmt+0x2b4>
  80030e:	000a3603          	ld	a2,0(s4)
  800312:	46a9                	li	a3,10
  800314:	8a3a                	mv	s4,a4
  800316:	b7f9                	j	8002e4 <vprintfmt+0x128>
  800318:	85a6                	mv	a1,s1
  80031a:	03000513          	li	a0,48
  80031e:	9902                	jalr	s2
  800320:	85a6                	mv	a1,s1
  800322:	07800513          	li	a0,120
  800326:	9902                	jalr	s2
  800328:	000a3603          	ld	a2,0(s4)
  80032c:	46c1                	li	a3,16
  80032e:	0a21                	addi	s4,s4,8
  800330:	bf55                	j	8002e4 <vprintfmt+0x128>
  800332:	85a6                	mv	a1,s1
  800334:	02500513          	li	a0,37
  800338:	9902                	jalr	s2
  80033a:	bd5d                	j	8001f0 <vprintfmt+0x34>
  80033c:	000a2d03          	lw	s10,0(s4)
  800340:	8462                	mv	s0,s8
  800342:	0a21                	addi	s4,s4,8
  800344:	bf95                	j	8002b8 <vprintfmt+0xfc>
  800346:	4785                	li	a5,1
  800348:	008a0713          	addi	a4,s4,8
  80034c:	00c7c463          	blt	a5,a2,800354 <vprintfmt+0x198>
  800350:	10060b63          	beqz	a2,800466 <vprintfmt+0x2aa>
  800354:	000a3603          	ld	a2,0(s4)
  800358:	46a1                	li	a3,8
  80035a:	8a3a                	mv	s4,a4
  80035c:	b761                	j	8002e4 <vprintfmt+0x128>
  80035e:	fffcc793          	not	a5,s9
  800362:	97fd                	srai	a5,a5,0x3f
  800364:	00fcf7b3          	and	a5,s9,a5
  800368:	00078c9b          	sext.w	s9,a5
  80036c:	8462                	mv	s0,s8
  80036e:	b56d                	j	800218 <vprintfmt+0x5c>
  800370:	000a3403          	ld	s0,0(s4)
  800374:	008a0793          	addi	a5,s4,8
  800378:	e43e                	sd	a5,8(sp)
  80037a:	12040063          	beqz	s0,80049a <vprintfmt+0x2de>
  80037e:	0d905963          	blez	s9,800450 <vprintfmt+0x294>
  800382:	02d00793          	li	a5,45
  800386:	00140a13          	addi	s4,s0,1
  80038a:	12fd9763          	bne	s11,a5,8004b8 <vprintfmt+0x2fc>
  80038e:	00044783          	lbu	a5,0(s0)
  800392:	0007851b          	sext.w	a0,a5
  800396:	cb9d                	beqz	a5,8003cc <vprintfmt+0x210>
  800398:	547d                	li	s0,-1
  80039a:	05e00d93          	li	s11,94
  80039e:	000d4563          	bltz	s10,8003a8 <vprintfmt+0x1ec>
  8003a2:	3d7d                	addiw	s10,s10,-1
  8003a4:	028d0263          	beq	s10,s0,8003c8 <vprintfmt+0x20c>
  8003a8:	85a6                	mv	a1,s1
  8003aa:	0c0b8d63          	beqz	s7,800484 <vprintfmt+0x2c8>
  8003ae:	3781                	addiw	a5,a5,-32
  8003b0:	0cfdfa63          	bgeu	s11,a5,800484 <vprintfmt+0x2c8>
  8003b4:	03f00513          	li	a0,63
  8003b8:	9902                	jalr	s2
  8003ba:	000a4783          	lbu	a5,0(s4)
  8003be:	3cfd                	addiw	s9,s9,-1
  8003c0:	0a05                	addi	s4,s4,1
  8003c2:	0007851b          	sext.w	a0,a5
  8003c6:	ffe1                	bnez	a5,80039e <vprintfmt+0x1e2>
  8003c8:	01905963          	blez	s9,8003da <vprintfmt+0x21e>
  8003cc:	85a6                	mv	a1,s1
  8003ce:	02000513          	li	a0,32
  8003d2:	3cfd                	addiw	s9,s9,-1
  8003d4:	9902                	jalr	s2
  8003d6:	fe0c9be3          	bnez	s9,8003cc <vprintfmt+0x210>
  8003da:	6a22                	ld	s4,8(sp)
  8003dc:	bd11                	j	8001f0 <vprintfmt+0x34>
  8003de:	4785                	li	a5,1
  8003e0:	008a0b93          	addi	s7,s4,8
  8003e4:	00c7c363          	blt	a5,a2,8003ea <vprintfmt+0x22e>
  8003e8:	ce25                	beqz	a2,800460 <vprintfmt+0x2a4>
  8003ea:	000a3403          	ld	s0,0(s4)
  8003ee:	08044d63          	bltz	s0,800488 <vprintfmt+0x2cc>
  8003f2:	8622                	mv	a2,s0
  8003f4:	8a5e                	mv	s4,s7
  8003f6:	46a9                	li	a3,10
  8003f8:	b5f5                	j	8002e4 <vprintfmt+0x128>
  8003fa:	000a2783          	lw	a5,0(s4)
  8003fe:	4661                	li	a2,24
  800400:	41f7d71b          	sraiw	a4,a5,0x1f
  800404:	8fb9                	xor	a5,a5,a4
  800406:	40e786bb          	subw	a3,a5,a4
  80040a:	02d64663          	blt	a2,a3,800436 <vprintfmt+0x27a>
  80040e:	00369713          	slli	a4,a3,0x3
  800412:	00000797          	auipc	a5,0x0
  800416:	4fe78793          	addi	a5,a5,1278 # 800910 <error_string>
  80041a:	97ba                	add	a5,a5,a4
  80041c:	639c                	ld	a5,0(a5)
  80041e:	cf81                	beqz	a5,800436 <vprintfmt+0x27a>
  800420:	86be                	mv	a3,a5
  800422:	00000617          	auipc	a2,0x0
  800426:	24e60613          	addi	a2,a2,590 # 800670 <main+0x11e>
  80042a:	85a6                	mv	a1,s1
  80042c:	854a                	mv	a0,s2
  80042e:	0e8000ef          	jal	800516 <printfmt>
  800432:	0a21                	addi	s4,s4,8
  800434:	bb75                	j	8001f0 <vprintfmt+0x34>
  800436:	00000617          	auipc	a2,0x0
  80043a:	22a60613          	addi	a2,a2,554 # 800660 <main+0x10e>
  80043e:	85a6                	mv	a1,s1
  800440:	854a                	mv	a0,s2
  800442:	0d4000ef          	jal	800516 <printfmt>
  800446:	0a21                	addi	s4,s4,8
  800448:	b365                	j	8001f0 <vprintfmt+0x34>
  80044a:	2605                	addiw	a2,a2,1
  80044c:	8462                	mv	s0,s8
  80044e:	b3e9                	j	800218 <vprintfmt+0x5c>
  800450:	00044783          	lbu	a5,0(s0)
  800454:	0007851b          	sext.w	a0,a5
  800458:	d3c9                	beqz	a5,8003da <vprintfmt+0x21e>
  80045a:	00140a13          	addi	s4,s0,1
  80045e:	bf2d                	j	800398 <vprintfmt+0x1dc>
  800460:	000a2403          	lw	s0,0(s4)
  800464:	b769                	j	8003ee <vprintfmt+0x232>
  800466:	000a6603          	lwu	a2,0(s4)
  80046a:	46a1                	li	a3,8
  80046c:	8a3a                	mv	s4,a4
  80046e:	bd9d                	j	8002e4 <vprintfmt+0x128>
  800470:	000a6603          	lwu	a2,0(s4)
  800474:	46a9                	li	a3,10
  800476:	8a3a                	mv	s4,a4
  800478:	b5b5                	j	8002e4 <vprintfmt+0x128>
  80047a:	000a6603          	lwu	a2,0(s4)
  80047e:	46c1                	li	a3,16
  800480:	8a3a                	mv	s4,a4
  800482:	b58d                	j	8002e4 <vprintfmt+0x128>
  800484:	9902                	jalr	s2
  800486:	bf15                	j	8003ba <vprintfmt+0x1fe>
  800488:	85a6                	mv	a1,s1
  80048a:	02d00513          	li	a0,45
  80048e:	9902                	jalr	s2
  800490:	40800633          	neg	a2,s0
  800494:	8a5e                	mv	s4,s7
  800496:	46a9                	li	a3,10
  800498:	b5b1                	j	8002e4 <vprintfmt+0x128>
  80049a:	01905663          	blez	s9,8004a6 <vprintfmt+0x2ea>
  80049e:	02d00793          	li	a5,45
  8004a2:	04fd9263          	bne	s11,a5,8004e6 <vprintfmt+0x32a>
  8004a6:	02800793          	li	a5,40
  8004aa:	00000a17          	auipc	s4,0x0
  8004ae:	1afa0a13          	addi	s4,s4,431 # 800659 <main+0x107>
  8004b2:	02800513          	li	a0,40
  8004b6:	b5cd                	j	800398 <vprintfmt+0x1dc>
  8004b8:	85ea                	mv	a1,s10
  8004ba:	8522                	mv	a0,s0
  8004bc:	07a000ef          	jal	800536 <strnlen>
  8004c0:	40ac8cbb          	subw	s9,s9,a0
  8004c4:	01905963          	blez	s9,8004d6 <vprintfmt+0x31a>
  8004c8:	2d81                	sext.w	s11,s11
  8004ca:	85a6                	mv	a1,s1
  8004cc:	856e                	mv	a0,s11
  8004ce:	3cfd                	addiw	s9,s9,-1
  8004d0:	9902                	jalr	s2
  8004d2:	fe0c9ce3          	bnez	s9,8004ca <vprintfmt+0x30e>
  8004d6:	00044783          	lbu	a5,0(s0)
  8004da:	0007851b          	sext.w	a0,a5
  8004de:	ea079de3          	bnez	a5,800398 <vprintfmt+0x1dc>
  8004e2:	6a22                	ld	s4,8(sp)
  8004e4:	b331                	j	8001f0 <vprintfmt+0x34>
  8004e6:	85ea                	mv	a1,s10
  8004e8:	00000517          	auipc	a0,0x0
  8004ec:	17050513          	addi	a0,a0,368 # 800658 <main+0x106>
  8004f0:	046000ef          	jal	800536 <strnlen>
  8004f4:	40ac8cbb          	subw	s9,s9,a0
  8004f8:	00000417          	auipc	s0,0x0
  8004fc:	16040413          	addi	s0,s0,352 # 800658 <main+0x106>
  800500:	00000a17          	auipc	s4,0x0
  800504:	159a0a13          	addi	s4,s4,345 # 800659 <main+0x107>
  800508:	02800793          	li	a5,40
  80050c:	02800513          	li	a0,40
  800510:	fb904ce3          	bgtz	s9,8004c8 <vprintfmt+0x30c>
  800514:	b551                	j	800398 <vprintfmt+0x1dc>

0000000000800516 <printfmt>:
  800516:	715d                	addi	sp,sp,-80
  800518:	02810313          	addi	t1,sp,40
  80051c:	f436                	sd	a3,40(sp)
  80051e:	869a                	mv	a3,t1
  800520:	ec06                	sd	ra,24(sp)
  800522:	f83a                	sd	a4,48(sp)
  800524:	fc3e                	sd	a5,56(sp)
  800526:	e0c2                	sd	a6,64(sp)
  800528:	e4c6                	sd	a7,72(sp)
  80052a:	e41a                	sd	t1,8(sp)
  80052c:	c91ff0ef          	jal	8001bc <vprintfmt>
  800530:	60e2                	ld	ra,24(sp)
  800532:	6161                	addi	sp,sp,80
  800534:	8082                	ret

0000000000800536 <strnlen>:
  800536:	4781                	li	a5,0
  800538:	e589                	bnez	a1,800542 <strnlen+0xc>
  80053a:	a811                	j	80054e <strnlen+0x18>
  80053c:	0785                	addi	a5,a5,1
  80053e:	00f58863          	beq	a1,a5,80054e <strnlen+0x18>
  800542:	00f50733          	add	a4,a0,a5
  800546:	00074703          	lbu	a4,0(a4)
  80054a:	fb6d                	bnez	a4,80053c <strnlen+0x6>
  80054c:	85be                	mv	a1,a5
  80054e:	852e                	mv	a0,a1
  800550:	8082                	ret

0000000000800552 <main>:
  800552:	1101                	addi	sp,sp,-32
  800554:	e822                	sd	s0,16(sp)
  800556:	e426                	sd	s1,8(sp)
  800558:	ec06                	sd	ra,24(sp)
  80055a:	4401                	li	s0,0
  80055c:	02000493          	li	s1,32
  800560:	bdbff0ef          	jal	80013a <fork>
  800564:	cd05                	beqz	a0,80059c <main+0x4a>
  800566:	06a05063          	blez	a0,8005c6 <main+0x74>
  80056a:	2405                	addiw	s0,s0,1
  80056c:	fe941ae3          	bne	s0,s1,800560 <main+0xe>
  800570:	02000413          	li	s0,32
  800574:	bc9ff0ef          	jal	80013c <wait>
  800578:	ed05                	bnez	a0,8005b0 <main+0x5e>
  80057a:	347d                	addiw	s0,s0,-1
  80057c:	fc65                	bnez	s0,800574 <main+0x22>
  80057e:	bbfff0ef          	jal	80013c <wait>
  800582:	c12d                	beqz	a0,8005e4 <main+0x92>
  800584:	00000517          	auipc	a0,0x0
  800588:	22450513          	addi	a0,a0,548 # 8007a8 <main+0x256>
  80058c:	b15ff0ef          	jal	8000a0 <cprintf>
  800590:	60e2                	ld	ra,24(sp)
  800592:	6442                	ld	s0,16(sp)
  800594:	64a2                	ld	s1,8(sp)
  800596:	4501                	li	a0,0
  800598:	6105                	addi	sp,sp,32
  80059a:	8082                	ret
  80059c:	85a2                	mv	a1,s0
  80059e:	00000517          	auipc	a0,0x0
  8005a2:	19a50513          	addi	a0,a0,410 # 800738 <main+0x1e6>
  8005a6:	afbff0ef          	jal	8000a0 <cprintf>
  8005aa:	4501                	li	a0,0
  8005ac:	b79ff0ef          	jal	800124 <exit>
  8005b0:	00000617          	auipc	a2,0x0
  8005b4:	1c860613          	addi	a2,a2,456 # 800778 <main+0x226>
  8005b8:	45dd                	li	a1,23
  8005ba:	00000517          	auipc	a0,0x0
  8005be:	1ae50513          	addi	a0,a0,430 # 800768 <main+0x216>
  8005c2:	a65ff0ef          	jal	800026 <__panic>
  8005c6:	00000697          	auipc	a3,0x0
  8005ca:	18268693          	addi	a3,a3,386 # 800748 <main+0x1f6>
  8005ce:	00000617          	auipc	a2,0x0
  8005d2:	18260613          	addi	a2,a2,386 # 800750 <main+0x1fe>
  8005d6:	45b9                	li	a1,14
  8005d8:	00000517          	auipc	a0,0x0
  8005dc:	19050513          	addi	a0,a0,400 # 800768 <main+0x216>
  8005e0:	a47ff0ef          	jal	800026 <__panic>
  8005e4:	00000617          	auipc	a2,0x0
  8005e8:	1ac60613          	addi	a2,a2,428 # 800790 <main+0x23e>
  8005ec:	45f1                	li	a1,28
  8005ee:	00000517          	auipc	a0,0x0
  8005f2:	17a50513          	addi	a0,a0,378 # 800768 <main+0x216>
  8005f6:	a31ff0ef          	jal	800026 <__panic>
