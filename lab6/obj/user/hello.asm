
obj/__user_hello.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	0b4000ef          	jal	ra,8000d4 <umain>
  800024:	a001                	j	800024 <_start+0x4>

0000000000800026 <cputch>:
  800026:	1141                	addi	sp,sp,-16
  800028:	e022                	sd	s0,0(sp)
  80002a:	e406                	sd	ra,8(sp)
  80002c:	842e                	mv	s0,a1
  80002e:	088000ef          	jal	ra,8000b6 <sys_putc>
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
  800068:	0e4000ef          	jal	ra,80014c <vprintfmt>
  80006c:	60e2                	ld	ra,24(sp)
  80006e:	4512                	lw	a0,4(sp)
  800070:	6125                	addi	sp,sp,96
  800072:	8082                	ret

0000000000800074 <syscall>:
  800074:	7175                	addi	sp,sp,-144
  800076:	f8ba                	sd	a4,112(sp)
  800078:	e0ba                	sd	a4,64(sp)
  80007a:	0118                	addi	a4,sp,128
  80007c:	e42a                	sd	a0,8(sp)
  80007e:	ecae                	sd	a1,88(sp)
  800080:	f0b2                	sd	a2,96(sp)
  800082:	f4b6                	sd	a3,104(sp)
  800084:	fcbe                	sd	a5,120(sp)
  800086:	e142                	sd	a6,128(sp)
  800088:	e546                	sd	a7,136(sp)
  80008a:	f42e                	sd	a1,40(sp)
  80008c:	f832                	sd	a2,48(sp)
  80008e:	fc36                	sd	a3,56(sp)
  800090:	f03a                	sd	a4,32(sp)
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

00000000008000b2 <sys_getpid>:
  8000b2:	4549                	li	a0,18
  8000b4:	b7c1                	j	800074 <syscall>

00000000008000b6 <sys_putc>:
  8000b6:	85aa                	mv	a1,a0
  8000b8:	4579                	li	a0,30
  8000ba:	bf6d                	j	800074 <syscall>

00000000008000bc <exit>:
  8000bc:	1141                	addi	sp,sp,-16
  8000be:	e406                	sd	ra,8(sp)
  8000c0:	fedff0ef          	jal	ra,8000ac <sys_exit>
  8000c4:	00000517          	auipc	a0,0x0
  8000c8:	46450513          	addi	a0,a0,1124 # 800528 <main+0x36>
  8000cc:	f75ff0ef          	jal	ra,800040 <cprintf>
  8000d0:	a001                	j	8000d0 <exit+0x14>

00000000008000d2 <getpid>:
  8000d2:	b7c5                	j	8000b2 <sys_getpid>

00000000008000d4 <umain>:
  8000d4:	1141                	addi	sp,sp,-16
  8000d6:	e406                	sd	ra,8(sp)
  8000d8:	41a000ef          	jal	ra,8004f2 <main>
  8000dc:	fe1ff0ef          	jal	ra,8000bc <exit>

00000000008000e0 <printnum>:
  8000e0:	02069813          	slli	a6,a3,0x20
  8000e4:	7179                	addi	sp,sp,-48
  8000e6:	02085813          	srli	a6,a6,0x20
  8000ea:	e052                	sd	s4,0(sp)
  8000ec:	03067a33          	remu	s4,a2,a6
  8000f0:	f022                	sd	s0,32(sp)
  8000f2:	ec26                	sd	s1,24(sp)
  8000f4:	e84a                	sd	s2,16(sp)
  8000f6:	f406                	sd	ra,40(sp)
  8000f8:	e44e                	sd	s3,8(sp)
  8000fa:	84aa                	mv	s1,a0
  8000fc:	892e                	mv	s2,a1
  8000fe:	fff7041b          	addiw	s0,a4,-1
  800102:	2a01                	sext.w	s4,s4
  800104:	03067e63          	bgeu	a2,a6,800140 <printnum+0x60>
  800108:	89be                	mv	s3,a5
  80010a:	00805763          	blez	s0,800118 <printnum+0x38>
  80010e:	347d                	addiw	s0,s0,-1
  800110:	85ca                	mv	a1,s2
  800112:	854e                	mv	a0,s3
  800114:	9482                	jalr	s1
  800116:	fc65                	bnez	s0,80010e <printnum+0x2e>
  800118:	1a02                	slli	s4,s4,0x20
  80011a:	020a5a13          	srli	s4,s4,0x20
  80011e:	00000797          	auipc	a5,0x0
  800122:	64278793          	addi	a5,a5,1602 # 800760 <error_string+0xc8>
  800126:	9a3e                	add	s4,s4,a5
  800128:	7402                	ld	s0,32(sp)
  80012a:	000a4503          	lbu	a0,0(s4)
  80012e:	70a2                	ld	ra,40(sp)
  800130:	69a2                	ld	s3,8(sp)
  800132:	6a02                	ld	s4,0(sp)
  800134:	85ca                	mv	a1,s2
  800136:	8326                	mv	t1,s1
  800138:	6942                	ld	s2,16(sp)
  80013a:	64e2                	ld	s1,24(sp)
  80013c:	6145                	addi	sp,sp,48
  80013e:	8302                	jr	t1
  800140:	03065633          	divu	a2,a2,a6
  800144:	8722                	mv	a4,s0
  800146:	f9bff0ef          	jal	ra,8000e0 <printnum>
  80014a:	b7f9                	j	800118 <printnum+0x38>

000000000080014c <vprintfmt>:
  80014c:	7119                	addi	sp,sp,-128
  80014e:	f4a6                	sd	s1,104(sp)
  800150:	f0ca                	sd	s2,96(sp)
  800152:	e8d2                	sd	s4,80(sp)
  800154:	e4d6                	sd	s5,72(sp)
  800156:	e0da                	sd	s6,64(sp)
  800158:	fc5e                	sd	s7,56(sp)
  80015a:	f862                	sd	s8,48(sp)
  80015c:	f06a                	sd	s10,32(sp)
  80015e:	fc86                	sd	ra,120(sp)
  800160:	f8a2                	sd	s0,112(sp)
  800162:	ecce                	sd	s3,88(sp)
  800164:	f466                	sd	s9,40(sp)
  800166:	ec6e                	sd	s11,24(sp)
  800168:	892a                	mv	s2,a0
  80016a:	84ae                	mv	s1,a1
  80016c:	8d32                	mv	s10,a2
  80016e:	8ab6                	mv	s5,a3
  800170:	5b7d                	li	s6,-1
  800172:	00000a17          	auipc	s4,0x0
  800176:	3caa0a13          	addi	s4,s4,970 # 80053c <main+0x4a>
  80017a:	05e00b93          	li	s7,94
  80017e:	00000c17          	auipc	s8,0x0
  800182:	51ac0c13          	addi	s8,s8,1306 # 800698 <error_string>
  800186:	000d4503          	lbu	a0,0(s10)
  80018a:	02500793          	li	a5,37
  80018e:	001d0413          	addi	s0,s10,1
  800192:	00f50e63          	beq	a0,a5,8001ae <vprintfmt+0x62>
  800196:	c521                	beqz	a0,8001de <vprintfmt+0x92>
  800198:	02500993          	li	s3,37
  80019c:	a011                	j	8001a0 <vprintfmt+0x54>
  80019e:	c121                	beqz	a0,8001de <vprintfmt+0x92>
  8001a0:	85a6                	mv	a1,s1
  8001a2:	0405                	addi	s0,s0,1
  8001a4:	9902                	jalr	s2
  8001a6:	fff44503          	lbu	a0,-1(s0)
  8001aa:	ff351ae3          	bne	a0,s3,80019e <vprintfmt+0x52>
  8001ae:	00044603          	lbu	a2,0(s0)
  8001b2:	02000793          	li	a5,32
  8001b6:	4981                	li	s3,0
  8001b8:	4801                	li	a6,0
  8001ba:	5cfd                	li	s9,-1
  8001bc:	5dfd                	li	s11,-1
  8001be:	05500593          	li	a1,85
  8001c2:	4525                	li	a0,9
  8001c4:	fdd6069b          	addiw	a3,a2,-35
  8001c8:	0ff6f693          	andi	a3,a3,255
  8001cc:	00140d13          	addi	s10,s0,1
  8001d0:	1ed5ef63          	bltu	a1,a3,8003ce <vprintfmt+0x282>
  8001d4:	068a                	slli	a3,a3,0x2
  8001d6:	96d2                	add	a3,a3,s4
  8001d8:	4294                	lw	a3,0(a3)
  8001da:	96d2                	add	a3,a3,s4
  8001dc:	8682                	jr	a3
  8001de:	70e6                	ld	ra,120(sp)
  8001e0:	7446                	ld	s0,112(sp)
  8001e2:	74a6                	ld	s1,104(sp)
  8001e4:	7906                	ld	s2,96(sp)
  8001e6:	69e6                	ld	s3,88(sp)
  8001e8:	6a46                	ld	s4,80(sp)
  8001ea:	6aa6                	ld	s5,72(sp)
  8001ec:	6b06                	ld	s6,64(sp)
  8001ee:	7be2                	ld	s7,56(sp)
  8001f0:	7c42                	ld	s8,48(sp)
  8001f2:	7ca2                	ld	s9,40(sp)
  8001f4:	7d02                	ld	s10,32(sp)
  8001f6:	6de2                	ld	s11,24(sp)
  8001f8:	6109                	addi	sp,sp,128
  8001fa:	8082                	ret
  8001fc:	87b2                	mv	a5,a2
  8001fe:	00144603          	lbu	a2,1(s0)
  800202:	846a                	mv	s0,s10
  800204:	b7c1                	j	8001c4 <vprintfmt+0x78>
  800206:	000aac83          	lw	s9,0(s5)
  80020a:	00144603          	lbu	a2,1(s0)
  80020e:	0aa1                	addi	s5,s5,8
  800210:	846a                	mv	s0,s10
  800212:	fa0dd9e3          	bgez	s11,8001c4 <vprintfmt+0x78>
  800216:	8de6                	mv	s11,s9
  800218:	5cfd                	li	s9,-1
  80021a:	b76d                	j	8001c4 <vprintfmt+0x78>
  80021c:	fffdc693          	not	a3,s11
  800220:	96fd                	srai	a3,a3,0x3f
  800222:	00ddfdb3          	and	s11,s11,a3
  800226:	00144603          	lbu	a2,1(s0)
  80022a:	2d81                	sext.w	s11,s11
  80022c:	846a                	mv	s0,s10
  80022e:	bf59                	j	8001c4 <vprintfmt+0x78>
  800230:	4705                	li	a4,1
  800232:	008a8593          	addi	a1,s5,8
  800236:	01074463          	blt	a4,a6,80023e <vprintfmt+0xf2>
  80023a:	22080863          	beqz	a6,80046a <vprintfmt+0x31e>
  80023e:	000ab603          	ld	a2,0(s5)
  800242:	46c1                	li	a3,16
  800244:	8aae                	mv	s5,a1
  800246:	a291                	j	80038a <vprintfmt+0x23e>
  800248:	fd060c9b          	addiw	s9,a2,-48
  80024c:	00144603          	lbu	a2,1(s0)
  800250:	846a                	mv	s0,s10
  800252:	fd06069b          	addiw	a3,a2,-48
  800256:	0006089b          	sext.w	a7,a2
  80025a:	fad56ce3          	bltu	a0,a3,800212 <vprintfmt+0xc6>
  80025e:	0405                	addi	s0,s0,1
  800260:	002c969b          	slliw	a3,s9,0x2
  800264:	00044603          	lbu	a2,0(s0)
  800268:	0196873b          	addw	a4,a3,s9
  80026c:	0017171b          	slliw	a4,a4,0x1
  800270:	0117073b          	addw	a4,a4,a7
  800274:	fd06069b          	addiw	a3,a2,-48
  800278:	fd070c9b          	addiw	s9,a4,-48
  80027c:	0006089b          	sext.w	a7,a2
  800280:	fcd57fe3          	bgeu	a0,a3,80025e <vprintfmt+0x112>
  800284:	b779                	j	800212 <vprintfmt+0xc6>
  800286:	000aa503          	lw	a0,0(s5)
  80028a:	85a6                	mv	a1,s1
  80028c:	0aa1                	addi	s5,s5,8
  80028e:	9902                	jalr	s2
  800290:	bddd                	j	800186 <vprintfmt+0x3a>
  800292:	4705                	li	a4,1
  800294:	008a8993          	addi	s3,s5,8
  800298:	01074463          	blt	a4,a6,8002a0 <vprintfmt+0x154>
  80029c:	1c080463          	beqz	a6,800464 <vprintfmt+0x318>
  8002a0:	000ab403          	ld	s0,0(s5)
  8002a4:	1c044a63          	bltz	s0,800478 <vprintfmt+0x32c>
  8002a8:	8622                	mv	a2,s0
  8002aa:	8ace                	mv	s5,s3
  8002ac:	46a9                	li	a3,10
  8002ae:	a8f1                	j	80038a <vprintfmt+0x23e>
  8002b0:	000aa783          	lw	a5,0(s5)
  8002b4:	4761                	li	a4,24
  8002b6:	0aa1                	addi	s5,s5,8
  8002b8:	41f7d69b          	sraiw	a3,a5,0x1f
  8002bc:	8fb5                	xor	a5,a5,a3
  8002be:	40d786bb          	subw	a3,a5,a3
  8002c2:	12d74963          	blt	a4,a3,8003f4 <vprintfmt+0x2a8>
  8002c6:	00369793          	slli	a5,a3,0x3
  8002ca:	97e2                	add	a5,a5,s8
  8002cc:	639c                	ld	a5,0(a5)
  8002ce:	12078363          	beqz	a5,8003f4 <vprintfmt+0x2a8>
  8002d2:	86be                	mv	a3,a5
  8002d4:	00000617          	auipc	a2,0x0
  8002d8:	57c60613          	addi	a2,a2,1404 # 800850 <error_string+0x1b8>
  8002dc:	85a6                	mv	a1,s1
  8002de:	854a                	mv	a0,s2
  8002e0:	1cc000ef          	jal	ra,8004ac <printfmt>
  8002e4:	b54d                	j	800186 <vprintfmt+0x3a>
  8002e6:	000ab603          	ld	a2,0(s5)
  8002ea:	0aa1                	addi	s5,s5,8
  8002ec:	1a060163          	beqz	a2,80048e <vprintfmt+0x342>
  8002f0:	00160413          	addi	s0,a2,1
  8002f4:	15b05763          	blez	s11,800442 <vprintfmt+0x2f6>
  8002f8:	02d00593          	li	a1,45
  8002fc:	10b79d63          	bne	a5,a1,800416 <vprintfmt+0x2ca>
  800300:	00064783          	lbu	a5,0(a2)
  800304:	0007851b          	sext.w	a0,a5
  800308:	c905                	beqz	a0,800338 <vprintfmt+0x1ec>
  80030a:	000cc563          	bltz	s9,800314 <vprintfmt+0x1c8>
  80030e:	3cfd                	addiw	s9,s9,-1
  800310:	036c8263          	beq	s9,s6,800334 <vprintfmt+0x1e8>
  800314:	85a6                	mv	a1,s1
  800316:	14098f63          	beqz	s3,800474 <vprintfmt+0x328>
  80031a:	3781                	addiw	a5,a5,-32
  80031c:	14fbfc63          	bgeu	s7,a5,800474 <vprintfmt+0x328>
  800320:	03f00513          	li	a0,63
  800324:	9902                	jalr	s2
  800326:	0405                	addi	s0,s0,1
  800328:	fff44783          	lbu	a5,-1(s0)
  80032c:	3dfd                	addiw	s11,s11,-1
  80032e:	0007851b          	sext.w	a0,a5
  800332:	fd61                	bnez	a0,80030a <vprintfmt+0x1be>
  800334:	e5b059e3          	blez	s11,800186 <vprintfmt+0x3a>
  800338:	3dfd                	addiw	s11,s11,-1
  80033a:	85a6                	mv	a1,s1
  80033c:	02000513          	li	a0,32
  800340:	9902                	jalr	s2
  800342:	e40d82e3          	beqz	s11,800186 <vprintfmt+0x3a>
  800346:	3dfd                	addiw	s11,s11,-1
  800348:	85a6                	mv	a1,s1
  80034a:	02000513          	li	a0,32
  80034e:	9902                	jalr	s2
  800350:	fe0d94e3          	bnez	s11,800338 <vprintfmt+0x1ec>
  800354:	bd0d                	j	800186 <vprintfmt+0x3a>
  800356:	4705                	li	a4,1
  800358:	008a8593          	addi	a1,s5,8
  80035c:	01074463          	blt	a4,a6,800364 <vprintfmt+0x218>
  800360:	0e080863          	beqz	a6,800450 <vprintfmt+0x304>
  800364:	000ab603          	ld	a2,0(s5)
  800368:	46a1                	li	a3,8
  80036a:	8aae                	mv	s5,a1
  80036c:	a839                	j	80038a <vprintfmt+0x23e>
  80036e:	03000513          	li	a0,48
  800372:	85a6                	mv	a1,s1
  800374:	e03e                	sd	a5,0(sp)
  800376:	9902                	jalr	s2
  800378:	85a6                	mv	a1,s1
  80037a:	07800513          	li	a0,120
  80037e:	9902                	jalr	s2
  800380:	0aa1                	addi	s5,s5,8
  800382:	ff8ab603          	ld	a2,-8(s5)
  800386:	6782                	ld	a5,0(sp)
  800388:	46c1                	li	a3,16
  80038a:	2781                	sext.w	a5,a5
  80038c:	876e                	mv	a4,s11
  80038e:	85a6                	mv	a1,s1
  800390:	854a                	mv	a0,s2
  800392:	d4fff0ef          	jal	ra,8000e0 <printnum>
  800396:	bbc5                	j	800186 <vprintfmt+0x3a>
  800398:	00144603          	lbu	a2,1(s0)
  80039c:	2805                	addiw	a6,a6,1
  80039e:	846a                	mv	s0,s10
  8003a0:	b515                	j	8001c4 <vprintfmt+0x78>
  8003a2:	00144603          	lbu	a2,1(s0)
  8003a6:	4985                	li	s3,1
  8003a8:	846a                	mv	s0,s10
  8003aa:	bd29                	j	8001c4 <vprintfmt+0x78>
  8003ac:	85a6                	mv	a1,s1
  8003ae:	02500513          	li	a0,37
  8003b2:	9902                	jalr	s2
  8003b4:	bbc9                	j	800186 <vprintfmt+0x3a>
  8003b6:	4705                	li	a4,1
  8003b8:	008a8593          	addi	a1,s5,8
  8003bc:	01074463          	blt	a4,a6,8003c4 <vprintfmt+0x278>
  8003c0:	08080d63          	beqz	a6,80045a <vprintfmt+0x30e>
  8003c4:	000ab603          	ld	a2,0(s5)
  8003c8:	46a9                	li	a3,10
  8003ca:	8aae                	mv	s5,a1
  8003cc:	bf7d                	j	80038a <vprintfmt+0x23e>
  8003ce:	85a6                	mv	a1,s1
  8003d0:	02500513          	li	a0,37
  8003d4:	9902                	jalr	s2
  8003d6:	fff44703          	lbu	a4,-1(s0)
  8003da:	02500793          	li	a5,37
  8003de:	8d22                	mv	s10,s0
  8003e0:	daf703e3          	beq	a4,a5,800186 <vprintfmt+0x3a>
  8003e4:	02500713          	li	a4,37
  8003e8:	1d7d                	addi	s10,s10,-1
  8003ea:	fffd4783          	lbu	a5,-1(s10)
  8003ee:	fee79de3          	bne	a5,a4,8003e8 <vprintfmt+0x29c>
  8003f2:	bb51                	j	800186 <vprintfmt+0x3a>
  8003f4:	00000617          	auipc	a2,0x0
  8003f8:	44c60613          	addi	a2,a2,1100 # 800840 <error_string+0x1a8>
  8003fc:	85a6                	mv	a1,s1
  8003fe:	854a                	mv	a0,s2
  800400:	0ac000ef          	jal	ra,8004ac <printfmt>
  800404:	b349                	j	800186 <vprintfmt+0x3a>
  800406:	00000617          	auipc	a2,0x0
  80040a:	43260613          	addi	a2,a2,1074 # 800838 <error_string+0x1a0>
  80040e:	00000417          	auipc	s0,0x0
  800412:	42b40413          	addi	s0,s0,1067 # 800839 <error_string+0x1a1>
  800416:	8532                	mv	a0,a2
  800418:	85e6                	mv	a1,s9
  80041a:	e032                	sd	a2,0(sp)
  80041c:	e43e                	sd	a5,8(sp)
  80041e:	0ae000ef          	jal	ra,8004cc <strnlen>
  800422:	40ad8dbb          	subw	s11,s11,a0
  800426:	6602                	ld	a2,0(sp)
  800428:	01b05d63          	blez	s11,800442 <vprintfmt+0x2f6>
  80042c:	67a2                	ld	a5,8(sp)
  80042e:	2781                	sext.w	a5,a5
  800430:	e43e                	sd	a5,8(sp)
  800432:	6522                	ld	a0,8(sp)
  800434:	85a6                	mv	a1,s1
  800436:	e032                	sd	a2,0(sp)
  800438:	3dfd                	addiw	s11,s11,-1
  80043a:	9902                	jalr	s2
  80043c:	6602                	ld	a2,0(sp)
  80043e:	fe0d9ae3          	bnez	s11,800432 <vprintfmt+0x2e6>
  800442:	00064783          	lbu	a5,0(a2)
  800446:	0007851b          	sext.w	a0,a5
  80044a:	ec0510e3          	bnez	a0,80030a <vprintfmt+0x1be>
  80044e:	bb25                	j	800186 <vprintfmt+0x3a>
  800450:	000ae603          	lwu	a2,0(s5)
  800454:	46a1                	li	a3,8
  800456:	8aae                	mv	s5,a1
  800458:	bf0d                	j	80038a <vprintfmt+0x23e>
  80045a:	000ae603          	lwu	a2,0(s5)
  80045e:	46a9                	li	a3,10
  800460:	8aae                	mv	s5,a1
  800462:	b725                	j	80038a <vprintfmt+0x23e>
  800464:	000aa403          	lw	s0,0(s5)
  800468:	bd35                	j	8002a4 <vprintfmt+0x158>
  80046a:	000ae603          	lwu	a2,0(s5)
  80046e:	46c1                	li	a3,16
  800470:	8aae                	mv	s5,a1
  800472:	bf21                	j	80038a <vprintfmt+0x23e>
  800474:	9902                	jalr	s2
  800476:	bd45                	j	800326 <vprintfmt+0x1da>
  800478:	85a6                	mv	a1,s1
  80047a:	02d00513          	li	a0,45
  80047e:	e03e                	sd	a5,0(sp)
  800480:	9902                	jalr	s2
  800482:	8ace                	mv	s5,s3
  800484:	40800633          	neg	a2,s0
  800488:	46a9                	li	a3,10
  80048a:	6782                	ld	a5,0(sp)
  80048c:	bdfd                	j	80038a <vprintfmt+0x23e>
  80048e:	01b05663          	blez	s11,80049a <vprintfmt+0x34e>
  800492:	02d00693          	li	a3,45
  800496:	f6d798e3          	bne	a5,a3,800406 <vprintfmt+0x2ba>
  80049a:	00000417          	auipc	s0,0x0
  80049e:	39f40413          	addi	s0,s0,927 # 800839 <error_string+0x1a1>
  8004a2:	02800513          	li	a0,40
  8004a6:	02800793          	li	a5,40
  8004aa:	b585                	j	80030a <vprintfmt+0x1be>

00000000008004ac <printfmt>:
  8004ac:	715d                	addi	sp,sp,-80
  8004ae:	02810313          	addi	t1,sp,40
  8004b2:	f436                	sd	a3,40(sp)
  8004b4:	869a                	mv	a3,t1
  8004b6:	ec06                	sd	ra,24(sp)
  8004b8:	f83a                	sd	a4,48(sp)
  8004ba:	fc3e                	sd	a5,56(sp)
  8004bc:	e0c2                	sd	a6,64(sp)
  8004be:	e4c6                	sd	a7,72(sp)
  8004c0:	e41a                	sd	t1,8(sp)
  8004c2:	c8bff0ef          	jal	ra,80014c <vprintfmt>
  8004c6:	60e2                	ld	ra,24(sp)
  8004c8:	6161                	addi	sp,sp,80
  8004ca:	8082                	ret

00000000008004cc <strnlen>:
  8004cc:	c185                	beqz	a1,8004ec <strnlen+0x20>
  8004ce:	00054783          	lbu	a5,0(a0)
  8004d2:	cf89                	beqz	a5,8004ec <strnlen+0x20>
  8004d4:	4781                	li	a5,0
  8004d6:	a021                	j	8004de <strnlen+0x12>
  8004d8:	00074703          	lbu	a4,0(a4)
  8004dc:	c711                	beqz	a4,8004e8 <strnlen+0x1c>
  8004de:	0785                	addi	a5,a5,1
  8004e0:	00f50733          	add	a4,a0,a5
  8004e4:	fef59ae3          	bne	a1,a5,8004d8 <strnlen+0xc>
  8004e8:	853e                	mv	a0,a5
  8004ea:	8082                	ret
  8004ec:	4781                	li	a5,0
  8004ee:	853e                	mv	a0,a5
  8004f0:	8082                	ret

00000000008004f2 <main>:
  8004f2:	1141                	addi	sp,sp,-16
  8004f4:	00000517          	auipc	a0,0x0
  8004f8:	36450513          	addi	a0,a0,868 # 800858 <error_string+0x1c0>
  8004fc:	e406                	sd	ra,8(sp)
  8004fe:	b43ff0ef          	jal	ra,800040 <cprintf>
  800502:	bd1ff0ef          	jal	ra,8000d2 <getpid>
  800506:	85aa                	mv	a1,a0
  800508:	00000517          	auipc	a0,0x0
  80050c:	36050513          	addi	a0,a0,864 # 800868 <error_string+0x1d0>
  800510:	b31ff0ef          	jal	ra,800040 <cprintf>
  800514:	00000517          	auipc	a0,0x0
  800518:	36c50513          	addi	a0,a0,876 # 800880 <error_string+0x1e8>
  80051c:	b25ff0ef          	jal	ra,800040 <cprintf>
  800520:	60a2                	ld	ra,8(sp)
  800522:	4501                	li	a0,0
  800524:	0141                	addi	sp,sp,16
  800526:	8082                	ret
