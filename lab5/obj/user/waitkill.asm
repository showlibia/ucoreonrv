
obj/__user_waitkill.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	134000ef          	jal	800154 <umain>
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
  800038:	66450513          	addi	a0,a0,1636 # 800698 <main+0xac>
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
  800058:	77c50513          	addi	a0,a0,1916 # 8007d0 <main+0x1e4>
  80005c:	044000ef          	jal	8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0d2000ef          	jal	800134 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0c0000ef          	jal	80012e <sys_putc>
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
  800094:	13a000ef          	jal	8001ce <vprintfmt>
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
  8000c8:	106000ef          	jal	8001ce <vprintfmt>
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

000000000080012a <sys_getpid>:
  80012a:	4549                	li	a0,18
  80012c:	b765                	j	8000d4 <syscall>

000000000080012e <sys_putc>:
  80012e:	85aa                	mv	a1,a0
  800130:	4579                	li	a0,30
  800132:	b74d                	j	8000d4 <syscall>

0000000000800134 <exit>:
  800134:	1141                	addi	sp,sp,-16
  800136:	e406                	sd	ra,8(sp)
  800138:	fd7ff0ef          	jal	80010e <sys_exit>
  80013c:	00000517          	auipc	a0,0x0
  800140:	57c50513          	addi	a0,a0,1404 # 8006b8 <main+0xcc>
  800144:	f5dff0ef          	jal	8000a0 <cprintf>
  800148:	a001                	j	800148 <exit+0x14>

000000000080014a <fork>:
  80014a:	b7e9                	j	800114 <sys_fork>

000000000080014c <waitpid>:
  80014c:	b7f1                	j	800118 <sys_wait>

000000000080014e <yield>:
  80014e:	bfc9                	j	800120 <sys_yield>

0000000000800150 <kill>:
  800150:	bfd1                	j	800124 <sys_kill>

0000000000800152 <getpid>:
  800152:	bfe1                	j	80012a <sys_getpid>

0000000000800154 <umain>:
  800154:	1141                	addi	sp,sp,-16
  800156:	e406                	sd	ra,8(sp)
  800158:	494000ef          	jal	8005ec <main>
  80015c:	fd9ff0ef          	jal	800134 <exit>

0000000000800160 <printnum>:
  800160:	02069813          	slli	a6,a3,0x20
  800164:	7179                	addi	sp,sp,-48
  800166:	02085813          	srli	a6,a6,0x20
  80016a:	e052                	sd	s4,0(sp)
  80016c:	03067a33          	remu	s4,a2,a6
  800170:	f022                	sd	s0,32(sp)
  800172:	ec26                	sd	s1,24(sp)
  800174:	e84a                	sd	s2,16(sp)
  800176:	f406                	sd	ra,40(sp)
  800178:	84aa                	mv	s1,a0
  80017a:	892e                	mv	s2,a1
  80017c:	fff7041b          	addiw	s0,a4,-1
  800180:	2a01                	sext.w	s4,s4
  800182:	05067063          	bgeu	a2,a6,8001c2 <printnum+0x62>
  800186:	e44e                	sd	s3,8(sp)
  800188:	89be                	mv	s3,a5
  80018a:	4785                	li	a5,1
  80018c:	00e7d763          	bge	a5,a4,80019a <printnum+0x3a>
  800190:	85ca                	mv	a1,s2
  800192:	854e                	mv	a0,s3
  800194:	347d                	addiw	s0,s0,-1
  800196:	9482                	jalr	s1
  800198:	fc65                	bnez	s0,800190 <printnum+0x30>
  80019a:	69a2                	ld	s3,8(sp)
  80019c:	1a02                	slli	s4,s4,0x20
  80019e:	020a5a13          	srli	s4,s4,0x20
  8001a2:	00000797          	auipc	a5,0x0
  8001a6:	52e78793          	addi	a5,a5,1326 # 8006d0 <main+0xe4>
  8001aa:	97d2                	add	a5,a5,s4
  8001ac:	7402                	ld	s0,32(sp)
  8001ae:	0007c503          	lbu	a0,0(a5)
  8001b2:	70a2                	ld	ra,40(sp)
  8001b4:	6a02                	ld	s4,0(sp)
  8001b6:	85ca                	mv	a1,s2
  8001b8:	87a6                	mv	a5,s1
  8001ba:	6942                	ld	s2,16(sp)
  8001bc:	64e2                	ld	s1,24(sp)
  8001be:	6145                	addi	sp,sp,48
  8001c0:	8782                	jr	a5
  8001c2:	03065633          	divu	a2,a2,a6
  8001c6:	8722                	mv	a4,s0
  8001c8:	f99ff0ef          	jal	800160 <printnum>
  8001cc:	bfc1                	j	80019c <printnum+0x3c>

00000000008001ce <vprintfmt>:
  8001ce:	7119                	addi	sp,sp,-128
  8001d0:	f4a6                	sd	s1,104(sp)
  8001d2:	f0ca                	sd	s2,96(sp)
  8001d4:	ecce                	sd	s3,88(sp)
  8001d6:	e8d2                	sd	s4,80(sp)
  8001d8:	e4d6                	sd	s5,72(sp)
  8001da:	e0da                	sd	s6,64(sp)
  8001dc:	f862                	sd	s8,48(sp)
  8001de:	fc86                	sd	ra,120(sp)
  8001e0:	f8a2                	sd	s0,112(sp)
  8001e2:	fc5e                	sd	s7,56(sp)
  8001e4:	f466                	sd	s9,40(sp)
  8001e6:	f06a                	sd	s10,32(sp)
  8001e8:	ec6e                	sd	s11,24(sp)
  8001ea:	892a                	mv	s2,a0
  8001ec:	84ae                	mv	s1,a1
  8001ee:	8c32                	mv	s8,a2
  8001f0:	8a36                	mv	s4,a3
  8001f2:	02500993          	li	s3,37
  8001f6:	05500b13          	li	s6,85
  8001fa:	00000a97          	auipc	s5,0x0
  8001fe:	68aa8a93          	addi	s5,s5,1674 # 800884 <main+0x298>
  800202:	000c4503          	lbu	a0,0(s8)
  800206:	001c0413          	addi	s0,s8,1
  80020a:	01350a63          	beq	a0,s3,80021e <vprintfmt+0x50>
  80020e:	cd0d                	beqz	a0,800248 <vprintfmt+0x7a>
  800210:	85a6                	mv	a1,s1
  800212:	9902                	jalr	s2
  800214:	00044503          	lbu	a0,0(s0)
  800218:	0405                	addi	s0,s0,1
  80021a:	ff351ae3          	bne	a0,s3,80020e <vprintfmt+0x40>
  80021e:	02000d93          	li	s11,32
  800222:	4b81                	li	s7,0
  800224:	4601                	li	a2,0
  800226:	5d7d                	li	s10,-1
  800228:	5cfd                	li	s9,-1
  80022a:	00044683          	lbu	a3,0(s0)
  80022e:	00140c13          	addi	s8,s0,1
  800232:	fdd6859b          	addiw	a1,a3,-35
  800236:	0ff5f593          	zext.b	a1,a1
  80023a:	02bb6663          	bltu	s6,a1,800266 <vprintfmt+0x98>
  80023e:	058a                	slli	a1,a1,0x2
  800240:	95d6                	add	a1,a1,s5
  800242:	4198                	lw	a4,0(a1)
  800244:	9756                	add	a4,a4,s5
  800246:	8702                	jr	a4
  800248:	70e6                	ld	ra,120(sp)
  80024a:	7446                	ld	s0,112(sp)
  80024c:	74a6                	ld	s1,104(sp)
  80024e:	7906                	ld	s2,96(sp)
  800250:	69e6                	ld	s3,88(sp)
  800252:	6a46                	ld	s4,80(sp)
  800254:	6aa6                	ld	s5,72(sp)
  800256:	6b06                	ld	s6,64(sp)
  800258:	7be2                	ld	s7,56(sp)
  80025a:	7c42                	ld	s8,48(sp)
  80025c:	7ca2                	ld	s9,40(sp)
  80025e:	7d02                	ld	s10,32(sp)
  800260:	6de2                	ld	s11,24(sp)
  800262:	6109                	addi	sp,sp,128
  800264:	8082                	ret
  800266:	85a6                	mv	a1,s1
  800268:	02500513          	li	a0,37
  80026c:	9902                	jalr	s2
  80026e:	fff44703          	lbu	a4,-1(s0)
  800272:	02500793          	li	a5,37
  800276:	8c22                	mv	s8,s0
  800278:	f8f705e3          	beq	a4,a5,800202 <vprintfmt+0x34>
  80027c:	02500713          	li	a4,37
  800280:	ffec4783          	lbu	a5,-2(s8)
  800284:	1c7d                	addi	s8,s8,-1
  800286:	fee79de3          	bne	a5,a4,800280 <vprintfmt+0xb2>
  80028a:	bfa5                	j	800202 <vprintfmt+0x34>
  80028c:	00144783          	lbu	a5,1(s0)
  800290:	4725                	li	a4,9
  800292:	fd068d1b          	addiw	s10,a3,-48
  800296:	fd07859b          	addiw	a1,a5,-48
  80029a:	0007869b          	sext.w	a3,a5
  80029e:	8462                	mv	s0,s8
  8002a0:	02b76563          	bltu	a4,a1,8002ca <vprintfmt+0xfc>
  8002a4:	4525                	li	a0,9
  8002a6:	00144783          	lbu	a5,1(s0)
  8002aa:	002d171b          	slliw	a4,s10,0x2
  8002ae:	01a7073b          	addw	a4,a4,s10
  8002b2:	0017171b          	slliw	a4,a4,0x1
  8002b6:	9f35                	addw	a4,a4,a3
  8002b8:	fd07859b          	addiw	a1,a5,-48
  8002bc:	0405                	addi	s0,s0,1
  8002be:	fd070d1b          	addiw	s10,a4,-48
  8002c2:	0007869b          	sext.w	a3,a5
  8002c6:	feb570e3          	bgeu	a0,a1,8002a6 <vprintfmt+0xd8>
  8002ca:	f60cd0e3          	bgez	s9,80022a <vprintfmt+0x5c>
  8002ce:	8cea                	mv	s9,s10
  8002d0:	5d7d                	li	s10,-1
  8002d2:	bfa1                	j	80022a <vprintfmt+0x5c>
  8002d4:	8db6                	mv	s11,a3
  8002d6:	8462                	mv	s0,s8
  8002d8:	bf89                	j	80022a <vprintfmt+0x5c>
  8002da:	8462                	mv	s0,s8
  8002dc:	4b85                	li	s7,1
  8002de:	b7b1                	j	80022a <vprintfmt+0x5c>
  8002e0:	4785                	li	a5,1
  8002e2:	008a0713          	addi	a4,s4,8
  8002e6:	00c7c463          	blt	a5,a2,8002ee <vprintfmt+0x120>
  8002ea:	1a060163          	beqz	a2,80048c <vprintfmt+0x2be>
  8002ee:	000a3603          	ld	a2,0(s4)
  8002f2:	46c1                	li	a3,16
  8002f4:	8a3a                	mv	s4,a4
  8002f6:	000d879b          	sext.w	a5,s11
  8002fa:	8766                	mv	a4,s9
  8002fc:	85a6                	mv	a1,s1
  8002fe:	854a                	mv	a0,s2
  800300:	e61ff0ef          	jal	800160 <printnum>
  800304:	bdfd                	j	800202 <vprintfmt+0x34>
  800306:	000a2503          	lw	a0,0(s4)
  80030a:	85a6                	mv	a1,s1
  80030c:	0a21                	addi	s4,s4,8
  80030e:	9902                	jalr	s2
  800310:	bdcd                	j	800202 <vprintfmt+0x34>
  800312:	4785                	li	a5,1
  800314:	008a0713          	addi	a4,s4,8
  800318:	00c7c463          	blt	a5,a2,800320 <vprintfmt+0x152>
  80031c:	16060363          	beqz	a2,800482 <vprintfmt+0x2b4>
  800320:	000a3603          	ld	a2,0(s4)
  800324:	46a9                	li	a3,10
  800326:	8a3a                	mv	s4,a4
  800328:	b7f9                	j	8002f6 <vprintfmt+0x128>
  80032a:	85a6                	mv	a1,s1
  80032c:	03000513          	li	a0,48
  800330:	9902                	jalr	s2
  800332:	85a6                	mv	a1,s1
  800334:	07800513          	li	a0,120
  800338:	9902                	jalr	s2
  80033a:	000a3603          	ld	a2,0(s4)
  80033e:	46c1                	li	a3,16
  800340:	0a21                	addi	s4,s4,8
  800342:	bf55                	j	8002f6 <vprintfmt+0x128>
  800344:	85a6                	mv	a1,s1
  800346:	02500513          	li	a0,37
  80034a:	9902                	jalr	s2
  80034c:	bd5d                	j	800202 <vprintfmt+0x34>
  80034e:	000a2d03          	lw	s10,0(s4)
  800352:	8462                	mv	s0,s8
  800354:	0a21                	addi	s4,s4,8
  800356:	bf95                	j	8002ca <vprintfmt+0xfc>
  800358:	4785                	li	a5,1
  80035a:	008a0713          	addi	a4,s4,8
  80035e:	00c7c463          	blt	a5,a2,800366 <vprintfmt+0x198>
  800362:	10060b63          	beqz	a2,800478 <vprintfmt+0x2aa>
  800366:	000a3603          	ld	a2,0(s4)
  80036a:	46a1                	li	a3,8
  80036c:	8a3a                	mv	s4,a4
  80036e:	b761                	j	8002f6 <vprintfmt+0x128>
  800370:	fffcc793          	not	a5,s9
  800374:	97fd                	srai	a5,a5,0x3f
  800376:	00fcf7b3          	and	a5,s9,a5
  80037a:	00078c9b          	sext.w	s9,a5
  80037e:	8462                	mv	s0,s8
  800380:	b56d                	j	80022a <vprintfmt+0x5c>
  800382:	000a3403          	ld	s0,0(s4)
  800386:	008a0793          	addi	a5,s4,8
  80038a:	e43e                	sd	a5,8(sp)
  80038c:	12040063          	beqz	s0,8004ac <vprintfmt+0x2de>
  800390:	0d905963          	blez	s9,800462 <vprintfmt+0x294>
  800394:	02d00793          	li	a5,45
  800398:	00140a13          	addi	s4,s0,1
  80039c:	12fd9763          	bne	s11,a5,8004ca <vprintfmt+0x2fc>
  8003a0:	00044783          	lbu	a5,0(s0)
  8003a4:	0007851b          	sext.w	a0,a5
  8003a8:	cb9d                	beqz	a5,8003de <vprintfmt+0x210>
  8003aa:	547d                	li	s0,-1
  8003ac:	05e00d93          	li	s11,94
  8003b0:	000d4563          	bltz	s10,8003ba <vprintfmt+0x1ec>
  8003b4:	3d7d                	addiw	s10,s10,-1
  8003b6:	028d0263          	beq	s10,s0,8003da <vprintfmt+0x20c>
  8003ba:	85a6                	mv	a1,s1
  8003bc:	0c0b8d63          	beqz	s7,800496 <vprintfmt+0x2c8>
  8003c0:	3781                	addiw	a5,a5,-32
  8003c2:	0cfdfa63          	bgeu	s11,a5,800496 <vprintfmt+0x2c8>
  8003c6:	03f00513          	li	a0,63
  8003ca:	9902                	jalr	s2
  8003cc:	000a4783          	lbu	a5,0(s4)
  8003d0:	3cfd                	addiw	s9,s9,-1
  8003d2:	0a05                	addi	s4,s4,1
  8003d4:	0007851b          	sext.w	a0,a5
  8003d8:	ffe1                	bnez	a5,8003b0 <vprintfmt+0x1e2>
  8003da:	01905963          	blez	s9,8003ec <vprintfmt+0x21e>
  8003de:	85a6                	mv	a1,s1
  8003e0:	02000513          	li	a0,32
  8003e4:	3cfd                	addiw	s9,s9,-1
  8003e6:	9902                	jalr	s2
  8003e8:	fe0c9be3          	bnez	s9,8003de <vprintfmt+0x210>
  8003ec:	6a22                	ld	s4,8(sp)
  8003ee:	bd11                	j	800202 <vprintfmt+0x34>
  8003f0:	4785                	li	a5,1
  8003f2:	008a0b93          	addi	s7,s4,8
  8003f6:	00c7c363          	blt	a5,a2,8003fc <vprintfmt+0x22e>
  8003fa:	ce25                	beqz	a2,800472 <vprintfmt+0x2a4>
  8003fc:	000a3403          	ld	s0,0(s4)
  800400:	08044d63          	bltz	s0,80049a <vprintfmt+0x2cc>
  800404:	8622                	mv	a2,s0
  800406:	8a5e                	mv	s4,s7
  800408:	46a9                	li	a3,10
  80040a:	b5f5                	j	8002f6 <vprintfmt+0x128>
  80040c:	000a2783          	lw	a5,0(s4)
  800410:	4661                	li	a2,24
  800412:	41f7d71b          	sraiw	a4,a5,0x1f
  800416:	8fb9                	xor	a5,a5,a4
  800418:	40e786bb          	subw	a3,a5,a4
  80041c:	02d64663          	blt	a2,a3,800448 <vprintfmt+0x27a>
  800420:	00369713          	slli	a4,a3,0x3
  800424:	00000797          	auipc	a5,0x0
  800428:	5bc78793          	addi	a5,a5,1468 # 8009e0 <error_string>
  80042c:	97ba                	add	a5,a5,a4
  80042e:	639c                	ld	a5,0(a5)
  800430:	cf81                	beqz	a5,800448 <vprintfmt+0x27a>
  800432:	86be                	mv	a3,a5
  800434:	00000617          	auipc	a2,0x0
  800438:	2cc60613          	addi	a2,a2,716 # 800700 <main+0x114>
  80043c:	85a6                	mv	a1,s1
  80043e:	854a                	mv	a0,s2
  800440:	0e8000ef          	jal	800528 <printfmt>
  800444:	0a21                	addi	s4,s4,8
  800446:	bb75                	j	800202 <vprintfmt+0x34>
  800448:	00000617          	auipc	a2,0x0
  80044c:	2a860613          	addi	a2,a2,680 # 8006f0 <main+0x104>
  800450:	85a6                	mv	a1,s1
  800452:	854a                	mv	a0,s2
  800454:	0d4000ef          	jal	800528 <printfmt>
  800458:	0a21                	addi	s4,s4,8
  80045a:	b365                	j	800202 <vprintfmt+0x34>
  80045c:	2605                	addiw	a2,a2,1
  80045e:	8462                	mv	s0,s8
  800460:	b3e9                	j	80022a <vprintfmt+0x5c>
  800462:	00044783          	lbu	a5,0(s0)
  800466:	0007851b          	sext.w	a0,a5
  80046a:	d3c9                	beqz	a5,8003ec <vprintfmt+0x21e>
  80046c:	00140a13          	addi	s4,s0,1
  800470:	bf2d                	j	8003aa <vprintfmt+0x1dc>
  800472:	000a2403          	lw	s0,0(s4)
  800476:	b769                	j	800400 <vprintfmt+0x232>
  800478:	000a6603          	lwu	a2,0(s4)
  80047c:	46a1                	li	a3,8
  80047e:	8a3a                	mv	s4,a4
  800480:	bd9d                	j	8002f6 <vprintfmt+0x128>
  800482:	000a6603          	lwu	a2,0(s4)
  800486:	46a9                	li	a3,10
  800488:	8a3a                	mv	s4,a4
  80048a:	b5b5                	j	8002f6 <vprintfmt+0x128>
  80048c:	000a6603          	lwu	a2,0(s4)
  800490:	46c1                	li	a3,16
  800492:	8a3a                	mv	s4,a4
  800494:	b58d                	j	8002f6 <vprintfmt+0x128>
  800496:	9902                	jalr	s2
  800498:	bf15                	j	8003cc <vprintfmt+0x1fe>
  80049a:	85a6                	mv	a1,s1
  80049c:	02d00513          	li	a0,45
  8004a0:	9902                	jalr	s2
  8004a2:	40800633          	neg	a2,s0
  8004a6:	8a5e                	mv	s4,s7
  8004a8:	46a9                	li	a3,10
  8004aa:	b5b1                	j	8002f6 <vprintfmt+0x128>
  8004ac:	01905663          	blez	s9,8004b8 <vprintfmt+0x2ea>
  8004b0:	02d00793          	li	a5,45
  8004b4:	04fd9263          	bne	s11,a5,8004f8 <vprintfmt+0x32a>
  8004b8:	02800793          	li	a5,40
  8004bc:	00000a17          	auipc	s4,0x0
  8004c0:	22da0a13          	addi	s4,s4,557 # 8006e9 <main+0xfd>
  8004c4:	02800513          	li	a0,40
  8004c8:	b5cd                	j	8003aa <vprintfmt+0x1dc>
  8004ca:	85ea                	mv	a1,s10
  8004cc:	8522                	mv	a0,s0
  8004ce:	07a000ef          	jal	800548 <strnlen>
  8004d2:	40ac8cbb          	subw	s9,s9,a0
  8004d6:	01905963          	blez	s9,8004e8 <vprintfmt+0x31a>
  8004da:	2d81                	sext.w	s11,s11
  8004dc:	85a6                	mv	a1,s1
  8004de:	856e                	mv	a0,s11
  8004e0:	3cfd                	addiw	s9,s9,-1
  8004e2:	9902                	jalr	s2
  8004e4:	fe0c9ce3          	bnez	s9,8004dc <vprintfmt+0x30e>
  8004e8:	00044783          	lbu	a5,0(s0)
  8004ec:	0007851b          	sext.w	a0,a5
  8004f0:	ea079de3          	bnez	a5,8003aa <vprintfmt+0x1dc>
  8004f4:	6a22                	ld	s4,8(sp)
  8004f6:	b331                	j	800202 <vprintfmt+0x34>
  8004f8:	85ea                	mv	a1,s10
  8004fa:	00000517          	auipc	a0,0x0
  8004fe:	1ee50513          	addi	a0,a0,494 # 8006e8 <main+0xfc>
  800502:	046000ef          	jal	800548 <strnlen>
  800506:	40ac8cbb          	subw	s9,s9,a0
  80050a:	00000417          	auipc	s0,0x0
  80050e:	1de40413          	addi	s0,s0,478 # 8006e8 <main+0xfc>
  800512:	00000a17          	auipc	s4,0x0
  800516:	1d7a0a13          	addi	s4,s4,471 # 8006e9 <main+0xfd>
  80051a:	02800793          	li	a5,40
  80051e:	02800513          	li	a0,40
  800522:	fb904ce3          	bgtz	s9,8004da <vprintfmt+0x30c>
  800526:	b551                	j	8003aa <vprintfmt+0x1dc>

0000000000800528 <printfmt>:
  800528:	715d                	addi	sp,sp,-80
  80052a:	02810313          	addi	t1,sp,40
  80052e:	f436                	sd	a3,40(sp)
  800530:	869a                	mv	a3,t1
  800532:	ec06                	sd	ra,24(sp)
  800534:	f83a                	sd	a4,48(sp)
  800536:	fc3e                	sd	a5,56(sp)
  800538:	e0c2                	sd	a6,64(sp)
  80053a:	e4c6                	sd	a7,72(sp)
  80053c:	e41a                	sd	t1,8(sp)
  80053e:	c91ff0ef          	jal	8001ce <vprintfmt>
  800542:	60e2                	ld	ra,24(sp)
  800544:	6161                	addi	sp,sp,80
  800546:	8082                	ret

0000000000800548 <strnlen>:
  800548:	4781                	li	a5,0
  80054a:	e589                	bnez	a1,800554 <strnlen+0xc>
  80054c:	a811                	j	800560 <strnlen+0x18>
  80054e:	0785                	addi	a5,a5,1
  800550:	00f58863          	beq	a1,a5,800560 <strnlen+0x18>
  800554:	00f50733          	add	a4,a0,a5
  800558:	00074703          	lbu	a4,0(a4)
  80055c:	fb6d                	bnez	a4,80054e <strnlen+0x6>
  80055e:	85be                	mv	a1,a5
  800560:	852e                	mv	a0,a1
  800562:	8082                	ret

0000000000800564 <do_yield>:
  800564:	1141                	addi	sp,sp,-16
  800566:	e406                	sd	ra,8(sp)
  800568:	be7ff0ef          	jal	80014e <yield>
  80056c:	be3ff0ef          	jal	80014e <yield>
  800570:	bdfff0ef          	jal	80014e <yield>
  800574:	bdbff0ef          	jal	80014e <yield>
  800578:	bd7ff0ef          	jal	80014e <yield>
  80057c:	60a2                	ld	ra,8(sp)
  80057e:	0141                	addi	sp,sp,16
  800580:	b6f9                	j	80014e <yield>

0000000000800582 <loop>:
  800582:	1141                	addi	sp,sp,-16
  800584:	00000517          	auipc	a0,0x0
  800588:	24450513          	addi	a0,a0,580 # 8007c8 <main+0x1dc>
  80058c:	e406                	sd	ra,8(sp)
  80058e:	b13ff0ef          	jal	8000a0 <cprintf>
  800592:	a001                	j	800592 <loop+0x10>

0000000000800594 <work>:
  800594:	1141                	addi	sp,sp,-16
  800596:	00000517          	auipc	a0,0x0
  80059a:	24250513          	addi	a0,a0,578 # 8007d8 <main+0x1ec>
  80059e:	e406                	sd	ra,8(sp)
  8005a0:	b01ff0ef          	jal	8000a0 <cprintf>
  8005a4:	fc1ff0ef          	jal	800564 <do_yield>
  8005a8:	00001517          	auipc	a0,0x1
  8005ac:	a6052503          	lw	a0,-1440(a0) # 801008 <parent>
  8005b0:	ba1ff0ef          	jal	800150 <kill>
  8005b4:	e105                	bnez	a0,8005d4 <work+0x40>
  8005b6:	00000517          	auipc	a0,0x0
  8005ba:	23250513          	addi	a0,a0,562 # 8007e8 <main+0x1fc>
  8005be:	ae3ff0ef          	jal	8000a0 <cprintf>
  8005c2:	fa3ff0ef          	jal	800564 <do_yield>
  8005c6:	00001517          	auipc	a0,0x1
  8005ca:	a3e52503          	lw	a0,-1474(a0) # 801004 <pid1>
  8005ce:	b83ff0ef          	jal	800150 <kill>
  8005d2:	c501                	beqz	a0,8005da <work+0x46>
  8005d4:	557d                	li	a0,-1
  8005d6:	b5fff0ef          	jal	800134 <exit>
  8005da:	00000517          	auipc	a0,0x0
  8005de:	22650513          	addi	a0,a0,550 # 800800 <main+0x214>
  8005e2:	abfff0ef          	jal	8000a0 <cprintf>
  8005e6:	4501                	li	a0,0
  8005e8:	b4dff0ef          	jal	800134 <exit>

00000000008005ec <main>:
  8005ec:	1141                	addi	sp,sp,-16
  8005ee:	e406                	sd	ra,8(sp)
  8005f0:	e022                	sd	s0,0(sp)
  8005f2:	b61ff0ef          	jal	800152 <getpid>
  8005f6:	00001797          	auipc	a5,0x1
  8005fa:	a0a7a923          	sw	a0,-1518(a5) # 801008 <parent>
  8005fe:	00001417          	auipc	s0,0x1
  800602:	a0640413          	addi	s0,s0,-1530 # 801004 <pid1>
  800606:	b45ff0ef          	jal	80014a <fork>
  80060a:	c008                	sw	a0,0(s0)
  80060c:	c13d                	beqz	a0,800672 <main+0x86>
  80060e:	04a05263          	blez	a0,800652 <main+0x66>
  800612:	b39ff0ef          	jal	80014a <fork>
  800616:	00001797          	auipc	a5,0x1
  80061a:	9ea7a523          	sw	a0,-1558(a5) # 801000 <pid2>
  80061e:	c93d                	beqz	a0,800694 <main+0xa8>
  800620:	04a05b63          	blez	a0,800676 <main+0x8a>
  800624:	00000517          	auipc	a0,0x0
  800628:	22c50513          	addi	a0,a0,556 # 800850 <main+0x264>
  80062c:	a75ff0ef          	jal	8000a0 <cprintf>
  800630:	4008                	lw	a0,0(s0)
  800632:	4581                	li	a1,0
  800634:	b19ff0ef          	jal	80014c <waitpid>
  800638:	4014                	lw	a3,0(s0)
  80063a:	00000617          	auipc	a2,0x0
  80063e:	22660613          	addi	a2,a2,550 # 800860 <main+0x274>
  800642:	03400593          	li	a1,52
  800646:	00000517          	auipc	a0,0x0
  80064a:	1fa50513          	addi	a0,a0,506 # 800840 <main+0x254>
  80064e:	9d9ff0ef          	jal	800026 <__panic>
  800652:	00000697          	auipc	a3,0x0
  800656:	1c668693          	addi	a3,a3,454 # 800818 <main+0x22c>
  80065a:	00000617          	auipc	a2,0x0
  80065e:	1ce60613          	addi	a2,a2,462 # 800828 <main+0x23c>
  800662:	02c00593          	li	a1,44
  800666:	00000517          	auipc	a0,0x0
  80066a:	1da50513          	addi	a0,a0,474 # 800840 <main+0x254>
  80066e:	9b9ff0ef          	jal	800026 <__panic>
  800672:	f11ff0ef          	jal	800582 <loop>
  800676:	4008                	lw	a0,0(s0)
  800678:	ad9ff0ef          	jal	800150 <kill>
  80067c:	00000617          	auipc	a2,0x0
  800680:	1fc60613          	addi	a2,a2,508 # 800878 <main+0x28c>
  800684:	03900593          	li	a1,57
  800688:	00000517          	auipc	a0,0x0
  80068c:	1b850513          	addi	a0,a0,440 # 800840 <main+0x254>
  800690:	997ff0ef          	jal	800026 <__panic>
  800694:	f01ff0ef          	jal	800594 <work>
