
obj/__user_exit.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	12a000ef          	jal	80014a <umain>
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
  800038:	63c50513          	addi	a0,a0,1596 # 800670 <main+0x116>
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
  800058:	63c50513          	addi	a0,a0,1596 # 800690 <main+0x136>
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
  800094:	130000ef          	jal	8001c4 <vprintfmt>
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
  8000c8:	0fc000ef          	jal	8001c4 <vprintfmt>
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
  800134:	56850513          	addi	a0,a0,1384 # 800698 <main+0x13e>
  800138:	f69ff0ef          	jal	8000a0 <cprintf>
  80013c:	a001                	j	80013c <exit+0x14>

000000000080013e <fork>:
  80013e:	bfd1                	j	800112 <sys_fork>

0000000000800140 <wait>:
  800140:	4581                	li	a1,0
  800142:	4501                	li	a0,0
  800144:	bfc9                	j	800116 <sys_wait>

0000000000800146 <waitpid>:
  800146:	bfc1                	j	800116 <sys_wait>

0000000000800148 <yield>:
  800148:	bfd9                	j	80011e <sys_yield>

000000000080014a <umain>:
  80014a:	1141                	addi	sp,sp,-16
  80014c:	e406                	sd	ra,8(sp)
  80014e:	40c000ef          	jal	80055a <main>
  800152:	fd7ff0ef          	jal	800128 <exit>

0000000000800156 <printnum>:
  800156:	02069813          	slli	a6,a3,0x20
  80015a:	7179                	addi	sp,sp,-48
  80015c:	02085813          	srli	a6,a6,0x20
  800160:	e052                	sd	s4,0(sp)
  800162:	03067a33          	remu	s4,a2,a6
  800166:	f022                	sd	s0,32(sp)
  800168:	ec26                	sd	s1,24(sp)
  80016a:	e84a                	sd	s2,16(sp)
  80016c:	f406                	sd	ra,40(sp)
  80016e:	84aa                	mv	s1,a0
  800170:	892e                	mv	s2,a1
  800172:	fff7041b          	addiw	s0,a4,-1
  800176:	2a01                	sext.w	s4,s4
  800178:	05067063          	bgeu	a2,a6,8001b8 <printnum+0x62>
  80017c:	e44e                	sd	s3,8(sp)
  80017e:	89be                	mv	s3,a5
  800180:	4785                	li	a5,1
  800182:	00e7d763          	bge	a5,a4,800190 <printnum+0x3a>
  800186:	85ca                	mv	a1,s2
  800188:	854e                	mv	a0,s3
  80018a:	347d                	addiw	s0,s0,-1
  80018c:	9482                	jalr	s1
  80018e:	fc65                	bnez	s0,800186 <printnum+0x30>
  800190:	69a2                	ld	s3,8(sp)
  800192:	1a02                	slli	s4,s4,0x20
  800194:	020a5a13          	srli	s4,s4,0x20
  800198:	00000797          	auipc	a5,0x0
  80019c:	51878793          	addi	a5,a5,1304 # 8006b0 <main+0x156>
  8001a0:	97d2                	add	a5,a5,s4
  8001a2:	7402                	ld	s0,32(sp)
  8001a4:	0007c503          	lbu	a0,0(a5)
  8001a8:	70a2                	ld	ra,40(sp)
  8001aa:	6a02                	ld	s4,0(sp)
  8001ac:	85ca                	mv	a1,s2
  8001ae:	87a6                	mv	a5,s1
  8001b0:	6942                	ld	s2,16(sp)
  8001b2:	64e2                	ld	s1,24(sp)
  8001b4:	6145                	addi	sp,sp,48
  8001b6:	8782                	jr	a5
  8001b8:	03065633          	divu	a2,a2,a6
  8001bc:	8722                	mv	a4,s0
  8001be:	f99ff0ef          	jal	800156 <printnum>
  8001c2:	bfc1                	j	800192 <printnum+0x3c>

00000000008001c4 <vprintfmt>:
  8001c4:	7119                	addi	sp,sp,-128
  8001c6:	f4a6                	sd	s1,104(sp)
  8001c8:	f0ca                	sd	s2,96(sp)
  8001ca:	ecce                	sd	s3,88(sp)
  8001cc:	e8d2                	sd	s4,80(sp)
  8001ce:	e4d6                	sd	s5,72(sp)
  8001d0:	e0da                	sd	s6,64(sp)
  8001d2:	f862                	sd	s8,48(sp)
  8001d4:	fc86                	sd	ra,120(sp)
  8001d6:	f8a2                	sd	s0,112(sp)
  8001d8:	fc5e                	sd	s7,56(sp)
  8001da:	f466                	sd	s9,40(sp)
  8001dc:	f06a                	sd	s10,32(sp)
  8001de:	ec6e                	sd	s11,24(sp)
  8001e0:	892a                	mv	s2,a0
  8001e2:	84ae                	mv	s1,a1
  8001e4:	8c32                	mv	s8,a2
  8001e6:	8a36                	mv	s4,a3
  8001e8:	02500993          	li	s3,37
  8001ec:	05500b13          	li	s6,85
  8001f0:	00000a97          	auipc	s5,0x0
  8001f4:	6e4a8a93          	addi	s5,s5,1764 # 8008d4 <main+0x37a>
  8001f8:	000c4503          	lbu	a0,0(s8)
  8001fc:	001c0413          	addi	s0,s8,1
  800200:	01350a63          	beq	a0,s3,800214 <vprintfmt+0x50>
  800204:	cd0d                	beqz	a0,80023e <vprintfmt+0x7a>
  800206:	85a6                	mv	a1,s1
  800208:	9902                	jalr	s2
  80020a:	00044503          	lbu	a0,0(s0)
  80020e:	0405                	addi	s0,s0,1
  800210:	ff351ae3          	bne	a0,s3,800204 <vprintfmt+0x40>
  800214:	02000d93          	li	s11,32
  800218:	4b81                	li	s7,0
  80021a:	4601                	li	a2,0
  80021c:	5d7d                	li	s10,-1
  80021e:	5cfd                	li	s9,-1
  800220:	00044683          	lbu	a3,0(s0)
  800224:	00140c13          	addi	s8,s0,1
  800228:	fdd6859b          	addiw	a1,a3,-35
  80022c:	0ff5f593          	zext.b	a1,a1
  800230:	02bb6663          	bltu	s6,a1,80025c <vprintfmt+0x98>
  800234:	058a                	slli	a1,a1,0x2
  800236:	95d6                	add	a1,a1,s5
  800238:	4198                	lw	a4,0(a1)
  80023a:	9756                	add	a4,a4,s5
  80023c:	8702                	jr	a4
  80023e:	70e6                	ld	ra,120(sp)
  800240:	7446                	ld	s0,112(sp)
  800242:	74a6                	ld	s1,104(sp)
  800244:	7906                	ld	s2,96(sp)
  800246:	69e6                	ld	s3,88(sp)
  800248:	6a46                	ld	s4,80(sp)
  80024a:	6aa6                	ld	s5,72(sp)
  80024c:	6b06                	ld	s6,64(sp)
  80024e:	7be2                	ld	s7,56(sp)
  800250:	7c42                	ld	s8,48(sp)
  800252:	7ca2                	ld	s9,40(sp)
  800254:	7d02                	ld	s10,32(sp)
  800256:	6de2                	ld	s11,24(sp)
  800258:	6109                	addi	sp,sp,128
  80025a:	8082                	ret
  80025c:	85a6                	mv	a1,s1
  80025e:	02500513          	li	a0,37
  800262:	9902                	jalr	s2
  800264:	fff44703          	lbu	a4,-1(s0)
  800268:	02500793          	li	a5,37
  80026c:	8c22                	mv	s8,s0
  80026e:	f8f705e3          	beq	a4,a5,8001f8 <vprintfmt+0x34>
  800272:	02500713          	li	a4,37
  800276:	ffec4783          	lbu	a5,-2(s8)
  80027a:	1c7d                	addi	s8,s8,-1
  80027c:	fee79de3          	bne	a5,a4,800276 <vprintfmt+0xb2>
  800280:	bfa5                	j	8001f8 <vprintfmt+0x34>
  800282:	00144783          	lbu	a5,1(s0)
  800286:	4725                	li	a4,9
  800288:	fd068d1b          	addiw	s10,a3,-48
  80028c:	fd07859b          	addiw	a1,a5,-48
  800290:	0007869b          	sext.w	a3,a5
  800294:	8462                	mv	s0,s8
  800296:	02b76563          	bltu	a4,a1,8002c0 <vprintfmt+0xfc>
  80029a:	4525                	li	a0,9
  80029c:	00144783          	lbu	a5,1(s0)
  8002a0:	002d171b          	slliw	a4,s10,0x2
  8002a4:	01a7073b          	addw	a4,a4,s10
  8002a8:	0017171b          	slliw	a4,a4,0x1
  8002ac:	9f35                	addw	a4,a4,a3
  8002ae:	fd07859b          	addiw	a1,a5,-48
  8002b2:	0405                	addi	s0,s0,1
  8002b4:	fd070d1b          	addiw	s10,a4,-48
  8002b8:	0007869b          	sext.w	a3,a5
  8002bc:	feb570e3          	bgeu	a0,a1,80029c <vprintfmt+0xd8>
  8002c0:	f60cd0e3          	bgez	s9,800220 <vprintfmt+0x5c>
  8002c4:	8cea                	mv	s9,s10
  8002c6:	5d7d                	li	s10,-1
  8002c8:	bfa1                	j	800220 <vprintfmt+0x5c>
  8002ca:	8db6                	mv	s11,a3
  8002cc:	8462                	mv	s0,s8
  8002ce:	bf89                	j	800220 <vprintfmt+0x5c>
  8002d0:	8462                	mv	s0,s8
  8002d2:	4b85                	li	s7,1
  8002d4:	b7b1                	j	800220 <vprintfmt+0x5c>
  8002d6:	4785                	li	a5,1
  8002d8:	008a0713          	addi	a4,s4,8
  8002dc:	00c7c463          	blt	a5,a2,8002e4 <vprintfmt+0x120>
  8002e0:	1a060163          	beqz	a2,800482 <vprintfmt+0x2be>
  8002e4:	000a3603          	ld	a2,0(s4)
  8002e8:	46c1                	li	a3,16
  8002ea:	8a3a                	mv	s4,a4
  8002ec:	000d879b          	sext.w	a5,s11
  8002f0:	8766                	mv	a4,s9
  8002f2:	85a6                	mv	a1,s1
  8002f4:	854a                	mv	a0,s2
  8002f6:	e61ff0ef          	jal	800156 <printnum>
  8002fa:	bdfd                	j	8001f8 <vprintfmt+0x34>
  8002fc:	000a2503          	lw	a0,0(s4)
  800300:	85a6                	mv	a1,s1
  800302:	0a21                	addi	s4,s4,8
  800304:	9902                	jalr	s2
  800306:	bdcd                	j	8001f8 <vprintfmt+0x34>
  800308:	4785                	li	a5,1
  80030a:	008a0713          	addi	a4,s4,8
  80030e:	00c7c463          	blt	a5,a2,800316 <vprintfmt+0x152>
  800312:	16060363          	beqz	a2,800478 <vprintfmt+0x2b4>
  800316:	000a3603          	ld	a2,0(s4)
  80031a:	46a9                	li	a3,10
  80031c:	8a3a                	mv	s4,a4
  80031e:	b7f9                	j	8002ec <vprintfmt+0x128>
  800320:	85a6                	mv	a1,s1
  800322:	03000513          	li	a0,48
  800326:	9902                	jalr	s2
  800328:	85a6                	mv	a1,s1
  80032a:	07800513          	li	a0,120
  80032e:	9902                	jalr	s2
  800330:	000a3603          	ld	a2,0(s4)
  800334:	46c1                	li	a3,16
  800336:	0a21                	addi	s4,s4,8
  800338:	bf55                	j	8002ec <vprintfmt+0x128>
  80033a:	85a6                	mv	a1,s1
  80033c:	02500513          	li	a0,37
  800340:	9902                	jalr	s2
  800342:	bd5d                	j	8001f8 <vprintfmt+0x34>
  800344:	000a2d03          	lw	s10,0(s4)
  800348:	8462                	mv	s0,s8
  80034a:	0a21                	addi	s4,s4,8
  80034c:	bf95                	j	8002c0 <vprintfmt+0xfc>
  80034e:	4785                	li	a5,1
  800350:	008a0713          	addi	a4,s4,8
  800354:	00c7c463          	blt	a5,a2,80035c <vprintfmt+0x198>
  800358:	10060b63          	beqz	a2,80046e <vprintfmt+0x2aa>
  80035c:	000a3603          	ld	a2,0(s4)
  800360:	46a1                	li	a3,8
  800362:	8a3a                	mv	s4,a4
  800364:	b761                	j	8002ec <vprintfmt+0x128>
  800366:	fffcc793          	not	a5,s9
  80036a:	97fd                	srai	a5,a5,0x3f
  80036c:	00fcf7b3          	and	a5,s9,a5
  800370:	00078c9b          	sext.w	s9,a5
  800374:	8462                	mv	s0,s8
  800376:	b56d                	j	800220 <vprintfmt+0x5c>
  800378:	000a3403          	ld	s0,0(s4)
  80037c:	008a0793          	addi	a5,s4,8
  800380:	e43e                	sd	a5,8(sp)
  800382:	12040063          	beqz	s0,8004a2 <vprintfmt+0x2de>
  800386:	0d905963          	blez	s9,800458 <vprintfmt+0x294>
  80038a:	02d00793          	li	a5,45
  80038e:	00140a13          	addi	s4,s0,1
  800392:	12fd9763          	bne	s11,a5,8004c0 <vprintfmt+0x2fc>
  800396:	00044783          	lbu	a5,0(s0)
  80039a:	0007851b          	sext.w	a0,a5
  80039e:	cb9d                	beqz	a5,8003d4 <vprintfmt+0x210>
  8003a0:	547d                	li	s0,-1
  8003a2:	05e00d93          	li	s11,94
  8003a6:	000d4563          	bltz	s10,8003b0 <vprintfmt+0x1ec>
  8003aa:	3d7d                	addiw	s10,s10,-1
  8003ac:	028d0263          	beq	s10,s0,8003d0 <vprintfmt+0x20c>
  8003b0:	85a6                	mv	a1,s1
  8003b2:	0c0b8d63          	beqz	s7,80048c <vprintfmt+0x2c8>
  8003b6:	3781                	addiw	a5,a5,-32
  8003b8:	0cfdfa63          	bgeu	s11,a5,80048c <vprintfmt+0x2c8>
  8003bc:	03f00513          	li	a0,63
  8003c0:	9902                	jalr	s2
  8003c2:	000a4783          	lbu	a5,0(s4)
  8003c6:	3cfd                	addiw	s9,s9,-1
  8003c8:	0a05                	addi	s4,s4,1
  8003ca:	0007851b          	sext.w	a0,a5
  8003ce:	ffe1                	bnez	a5,8003a6 <vprintfmt+0x1e2>
  8003d0:	01905963          	blez	s9,8003e2 <vprintfmt+0x21e>
  8003d4:	85a6                	mv	a1,s1
  8003d6:	02000513          	li	a0,32
  8003da:	3cfd                	addiw	s9,s9,-1
  8003dc:	9902                	jalr	s2
  8003de:	fe0c9be3          	bnez	s9,8003d4 <vprintfmt+0x210>
  8003e2:	6a22                	ld	s4,8(sp)
  8003e4:	bd11                	j	8001f8 <vprintfmt+0x34>
  8003e6:	4785                	li	a5,1
  8003e8:	008a0b93          	addi	s7,s4,8
  8003ec:	00c7c363          	blt	a5,a2,8003f2 <vprintfmt+0x22e>
  8003f0:	ce25                	beqz	a2,800468 <vprintfmt+0x2a4>
  8003f2:	000a3403          	ld	s0,0(s4)
  8003f6:	08044d63          	bltz	s0,800490 <vprintfmt+0x2cc>
  8003fa:	8622                	mv	a2,s0
  8003fc:	8a5e                	mv	s4,s7
  8003fe:	46a9                	li	a3,10
  800400:	b5f5                	j	8002ec <vprintfmt+0x128>
  800402:	000a2783          	lw	a5,0(s4)
  800406:	4661                	li	a2,24
  800408:	41f7d71b          	sraiw	a4,a5,0x1f
  80040c:	8fb9                	xor	a5,a5,a4
  80040e:	40e786bb          	subw	a3,a5,a4
  800412:	02d64663          	blt	a2,a3,80043e <vprintfmt+0x27a>
  800416:	00369713          	slli	a4,a3,0x3
  80041a:	00000797          	auipc	a5,0x0
  80041e:	61678793          	addi	a5,a5,1558 # 800a30 <error_string>
  800422:	97ba                	add	a5,a5,a4
  800424:	639c                	ld	a5,0(a5)
  800426:	cf81                	beqz	a5,80043e <vprintfmt+0x27a>
  800428:	86be                	mv	a3,a5
  80042a:	00000617          	auipc	a2,0x0
  80042e:	2b660613          	addi	a2,a2,694 # 8006e0 <main+0x186>
  800432:	85a6                	mv	a1,s1
  800434:	854a                	mv	a0,s2
  800436:	0e8000ef          	jal	80051e <printfmt>
  80043a:	0a21                	addi	s4,s4,8
  80043c:	bb75                	j	8001f8 <vprintfmt+0x34>
  80043e:	00000617          	auipc	a2,0x0
  800442:	29260613          	addi	a2,a2,658 # 8006d0 <main+0x176>
  800446:	85a6                	mv	a1,s1
  800448:	854a                	mv	a0,s2
  80044a:	0d4000ef          	jal	80051e <printfmt>
  80044e:	0a21                	addi	s4,s4,8
  800450:	b365                	j	8001f8 <vprintfmt+0x34>
  800452:	2605                	addiw	a2,a2,1
  800454:	8462                	mv	s0,s8
  800456:	b3e9                	j	800220 <vprintfmt+0x5c>
  800458:	00044783          	lbu	a5,0(s0)
  80045c:	0007851b          	sext.w	a0,a5
  800460:	d3c9                	beqz	a5,8003e2 <vprintfmt+0x21e>
  800462:	00140a13          	addi	s4,s0,1
  800466:	bf2d                	j	8003a0 <vprintfmt+0x1dc>
  800468:	000a2403          	lw	s0,0(s4)
  80046c:	b769                	j	8003f6 <vprintfmt+0x232>
  80046e:	000a6603          	lwu	a2,0(s4)
  800472:	46a1                	li	a3,8
  800474:	8a3a                	mv	s4,a4
  800476:	bd9d                	j	8002ec <vprintfmt+0x128>
  800478:	000a6603          	lwu	a2,0(s4)
  80047c:	46a9                	li	a3,10
  80047e:	8a3a                	mv	s4,a4
  800480:	b5b5                	j	8002ec <vprintfmt+0x128>
  800482:	000a6603          	lwu	a2,0(s4)
  800486:	46c1                	li	a3,16
  800488:	8a3a                	mv	s4,a4
  80048a:	b58d                	j	8002ec <vprintfmt+0x128>
  80048c:	9902                	jalr	s2
  80048e:	bf15                	j	8003c2 <vprintfmt+0x1fe>
  800490:	85a6                	mv	a1,s1
  800492:	02d00513          	li	a0,45
  800496:	9902                	jalr	s2
  800498:	40800633          	neg	a2,s0
  80049c:	8a5e                	mv	s4,s7
  80049e:	46a9                	li	a3,10
  8004a0:	b5b1                	j	8002ec <vprintfmt+0x128>
  8004a2:	01905663          	blez	s9,8004ae <vprintfmt+0x2ea>
  8004a6:	02d00793          	li	a5,45
  8004aa:	04fd9263          	bne	s11,a5,8004ee <vprintfmt+0x32a>
  8004ae:	02800793          	li	a5,40
  8004b2:	00000a17          	auipc	s4,0x0
  8004b6:	217a0a13          	addi	s4,s4,535 # 8006c9 <main+0x16f>
  8004ba:	02800513          	li	a0,40
  8004be:	b5cd                	j	8003a0 <vprintfmt+0x1dc>
  8004c0:	85ea                	mv	a1,s10
  8004c2:	8522                	mv	a0,s0
  8004c4:	07a000ef          	jal	80053e <strnlen>
  8004c8:	40ac8cbb          	subw	s9,s9,a0
  8004cc:	01905963          	blez	s9,8004de <vprintfmt+0x31a>
  8004d0:	2d81                	sext.w	s11,s11
  8004d2:	85a6                	mv	a1,s1
  8004d4:	856e                	mv	a0,s11
  8004d6:	3cfd                	addiw	s9,s9,-1
  8004d8:	9902                	jalr	s2
  8004da:	fe0c9ce3          	bnez	s9,8004d2 <vprintfmt+0x30e>
  8004de:	00044783          	lbu	a5,0(s0)
  8004e2:	0007851b          	sext.w	a0,a5
  8004e6:	ea079de3          	bnez	a5,8003a0 <vprintfmt+0x1dc>
  8004ea:	6a22                	ld	s4,8(sp)
  8004ec:	b331                	j	8001f8 <vprintfmt+0x34>
  8004ee:	85ea                	mv	a1,s10
  8004f0:	00000517          	auipc	a0,0x0
  8004f4:	1d850513          	addi	a0,a0,472 # 8006c8 <main+0x16e>
  8004f8:	046000ef          	jal	80053e <strnlen>
  8004fc:	40ac8cbb          	subw	s9,s9,a0
  800500:	00000417          	auipc	s0,0x0
  800504:	1c840413          	addi	s0,s0,456 # 8006c8 <main+0x16e>
  800508:	00000a17          	auipc	s4,0x0
  80050c:	1c1a0a13          	addi	s4,s4,449 # 8006c9 <main+0x16f>
  800510:	02800793          	li	a5,40
  800514:	02800513          	li	a0,40
  800518:	fb904ce3          	bgtz	s9,8004d0 <vprintfmt+0x30c>
  80051c:	b551                	j	8003a0 <vprintfmt+0x1dc>

000000000080051e <printfmt>:
  80051e:	715d                	addi	sp,sp,-80
  800520:	02810313          	addi	t1,sp,40
  800524:	f436                	sd	a3,40(sp)
  800526:	869a                	mv	a3,t1
  800528:	ec06                	sd	ra,24(sp)
  80052a:	f83a                	sd	a4,48(sp)
  80052c:	fc3e                	sd	a5,56(sp)
  80052e:	e0c2                	sd	a6,64(sp)
  800530:	e4c6                	sd	a7,72(sp)
  800532:	e41a                	sd	t1,8(sp)
  800534:	c91ff0ef          	jal	8001c4 <vprintfmt>
  800538:	60e2                	ld	ra,24(sp)
  80053a:	6161                	addi	sp,sp,80
  80053c:	8082                	ret

000000000080053e <strnlen>:
  80053e:	4781                	li	a5,0
  800540:	e589                	bnez	a1,80054a <strnlen+0xc>
  800542:	a811                	j	800556 <strnlen+0x18>
  800544:	0785                	addi	a5,a5,1
  800546:	00f58863          	beq	a1,a5,800556 <strnlen+0x18>
  80054a:	00f50733          	add	a4,a0,a5
  80054e:	00074703          	lbu	a4,0(a4)
  800552:	fb6d                	bnez	a4,800544 <strnlen+0x6>
  800554:	85be                	mv	a1,a5
  800556:	852e                	mv	a0,a1
  800558:	8082                	ret

000000000080055a <main>:
  80055a:	1101                	addi	sp,sp,-32
  80055c:	00000517          	auipc	a0,0x0
  800560:	24c50513          	addi	a0,a0,588 # 8007a8 <main+0x24e>
  800564:	ec06                	sd	ra,24(sp)
  800566:	e822                	sd	s0,16(sp)
  800568:	b39ff0ef          	jal	8000a0 <cprintf>
  80056c:	bd3ff0ef          	jal	80013e <fork>
  800570:	c561                	beqz	a0,800638 <main+0xde>
  800572:	842a                	mv	s0,a0
  800574:	85aa                	mv	a1,a0
  800576:	00000517          	auipc	a0,0x0
  80057a:	27250513          	addi	a0,a0,626 # 8007e8 <main+0x28e>
  80057e:	b23ff0ef          	jal	8000a0 <cprintf>
  800582:	08805c63          	blez	s0,80061a <main+0xc0>
  800586:	00000517          	auipc	a0,0x0
  80058a:	2ba50513          	addi	a0,a0,698 # 800840 <main+0x2e6>
  80058e:	b13ff0ef          	jal	8000a0 <cprintf>
  800592:	006c                	addi	a1,sp,12
  800594:	8522                	mv	a0,s0
  800596:	bb1ff0ef          	jal	800146 <waitpid>
  80059a:	e131                	bnez	a0,8005de <main+0x84>
  80059c:	4732                	lw	a4,12(sp)
  80059e:	00001797          	auipc	a5,0x1
  8005a2:	a627a783          	lw	a5,-1438(a5) # 801000 <magic>
  8005a6:	02f71c63          	bne	a4,a5,8005de <main+0x84>
  8005aa:	006c                	addi	a1,sp,12
  8005ac:	8522                	mv	a0,s0
  8005ae:	b99ff0ef          	jal	800146 <waitpid>
  8005b2:	c529                	beqz	a0,8005fc <main+0xa2>
  8005b4:	b8dff0ef          	jal	800140 <wait>
  8005b8:	c131                	beqz	a0,8005fc <main+0xa2>
  8005ba:	85a2                	mv	a1,s0
  8005bc:	00000517          	auipc	a0,0x0
  8005c0:	2fc50513          	addi	a0,a0,764 # 8008b8 <main+0x35e>
  8005c4:	addff0ef          	jal	8000a0 <cprintf>
  8005c8:	00000517          	auipc	a0,0x0
  8005cc:	30050513          	addi	a0,a0,768 # 8008c8 <main+0x36e>
  8005d0:	ad1ff0ef          	jal	8000a0 <cprintf>
  8005d4:	60e2                	ld	ra,24(sp)
  8005d6:	6442                	ld	s0,16(sp)
  8005d8:	4501                	li	a0,0
  8005da:	6105                	addi	sp,sp,32
  8005dc:	8082                	ret
  8005de:	00000697          	auipc	a3,0x0
  8005e2:	28268693          	addi	a3,a3,642 # 800860 <main+0x306>
  8005e6:	00000617          	auipc	a2,0x0
  8005ea:	23260613          	addi	a2,a2,562 # 800818 <main+0x2be>
  8005ee:	45ed                	li	a1,27
  8005f0:	00000517          	auipc	a0,0x0
  8005f4:	24050513          	addi	a0,a0,576 # 800830 <main+0x2d6>
  8005f8:	a2fff0ef          	jal	800026 <__panic>
  8005fc:	00000697          	auipc	a3,0x0
  800600:	29468693          	addi	a3,a3,660 # 800890 <main+0x336>
  800604:	00000617          	auipc	a2,0x0
  800608:	21460613          	addi	a2,a2,532 # 800818 <main+0x2be>
  80060c:	45f1                	li	a1,28
  80060e:	00000517          	auipc	a0,0x0
  800612:	22250513          	addi	a0,a0,546 # 800830 <main+0x2d6>
  800616:	a11ff0ef          	jal	800026 <__panic>
  80061a:	00000697          	auipc	a3,0x0
  80061e:	1f668693          	addi	a3,a3,502 # 800810 <main+0x2b6>
  800622:	00000617          	auipc	a2,0x0
  800626:	1f660613          	addi	a2,a2,502 # 800818 <main+0x2be>
  80062a:	45e1                	li	a1,24
  80062c:	00000517          	auipc	a0,0x0
  800630:	20450513          	addi	a0,a0,516 # 800830 <main+0x2d6>
  800634:	9f3ff0ef          	jal	800026 <__panic>
  800638:	00000517          	auipc	a0,0x0
  80063c:	19850513          	addi	a0,a0,408 # 8007d0 <main+0x276>
  800640:	a61ff0ef          	jal	8000a0 <cprintf>
  800644:	b05ff0ef          	jal	800148 <yield>
  800648:	b01ff0ef          	jal	800148 <yield>
  80064c:	afdff0ef          	jal	800148 <yield>
  800650:	af9ff0ef          	jal	800148 <yield>
  800654:	af5ff0ef          	jal	800148 <yield>
  800658:	af1ff0ef          	jal	800148 <yield>
  80065c:	aedff0ef          	jal	800148 <yield>
  800660:	00001517          	auipc	a0,0x1
  800664:	9a052503          	lw	a0,-1632(a0) # 801000 <magic>
  800668:	ac1ff0ef          	jal	800128 <exit>
