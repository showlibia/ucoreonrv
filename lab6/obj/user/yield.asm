
obj/__user_yield.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	0ba000ef          	jal	ra,8000da <umain>
  800024:	a001                	j	800024 <_start+0x4>

0000000000800026 <cputch>:
  800026:	1141                	addi	sp,sp,-16
  800028:	e022                	sd	s0,0(sp)
  80002a:	e406                	sd	ra,8(sp)
  80002c:	842e                	mv	s0,a1
  80002e:	08c000ef          	jal	ra,8000ba <sys_putc>
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
  800068:	0ea000ef          	jal	ra,800152 <vprintfmt>
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

00000000008000b2 <sys_yield>:
  8000b2:	4529                	li	a0,10
  8000b4:	b7c1                	j	800074 <syscall>

00000000008000b6 <sys_getpid>:
  8000b6:	4549                	li	a0,18
  8000b8:	bf75                	j	800074 <syscall>

00000000008000ba <sys_putc>:
  8000ba:	85aa                	mv	a1,a0
  8000bc:	4579                	li	a0,30
  8000be:	bf5d                	j	800074 <syscall>

00000000008000c0 <exit>:
  8000c0:	1141                	addi	sp,sp,-16
  8000c2:	e406                	sd	ra,8(sp)
  8000c4:	fe9ff0ef          	jal	ra,8000ac <sys_exit>
  8000c8:	00000517          	auipc	a0,0x0
  8000cc:	4a050513          	addi	a0,a0,1184 # 800568 <main+0x70>
  8000d0:	f71ff0ef          	jal	ra,800040 <cprintf>
  8000d4:	a001                	j	8000d4 <exit+0x14>

00000000008000d6 <yield>:
  8000d6:	bff1                	j	8000b2 <sys_yield>

00000000008000d8 <getpid>:
  8000d8:	bff9                	j	8000b6 <sys_getpid>

00000000008000da <umain>:
  8000da:	1141                	addi	sp,sp,-16
  8000dc:	e406                	sd	ra,8(sp)
  8000de:	41a000ef          	jal	ra,8004f8 <main>
  8000e2:	fdfff0ef          	jal	ra,8000c0 <exit>

00000000008000e6 <printnum>:
  8000e6:	02069813          	slli	a6,a3,0x20
  8000ea:	7179                	addi	sp,sp,-48
  8000ec:	02085813          	srli	a6,a6,0x20
  8000f0:	e052                	sd	s4,0(sp)
  8000f2:	03067a33          	remu	s4,a2,a6
  8000f6:	f022                	sd	s0,32(sp)
  8000f8:	ec26                	sd	s1,24(sp)
  8000fa:	e84a                	sd	s2,16(sp)
  8000fc:	f406                	sd	ra,40(sp)
  8000fe:	e44e                	sd	s3,8(sp)
  800100:	84aa                	mv	s1,a0
  800102:	892e                	mv	s2,a1
  800104:	fff7041b          	addiw	s0,a4,-1
  800108:	2a01                	sext.w	s4,s4
  80010a:	03067e63          	bgeu	a2,a6,800146 <printnum+0x60>
  80010e:	89be                	mv	s3,a5
  800110:	00805763          	blez	s0,80011e <printnum+0x38>
  800114:	347d                	addiw	s0,s0,-1
  800116:	85ca                	mv	a1,s2
  800118:	854e                	mv	a0,s3
  80011a:	9482                	jalr	s1
  80011c:	fc65                	bnez	s0,800114 <printnum+0x2e>
  80011e:	1a02                	slli	s4,s4,0x20
  800120:	020a5a13          	srli	s4,s4,0x20
  800124:	00000797          	auipc	a5,0x0
  800128:	67c78793          	addi	a5,a5,1660 # 8007a0 <error_string+0xc8>
  80012c:	9a3e                	add	s4,s4,a5
  80012e:	7402                	ld	s0,32(sp)
  800130:	000a4503          	lbu	a0,0(s4)
  800134:	70a2                	ld	ra,40(sp)
  800136:	69a2                	ld	s3,8(sp)
  800138:	6a02                	ld	s4,0(sp)
  80013a:	85ca                	mv	a1,s2
  80013c:	8326                	mv	t1,s1
  80013e:	6942                	ld	s2,16(sp)
  800140:	64e2                	ld	s1,24(sp)
  800142:	6145                	addi	sp,sp,48
  800144:	8302                	jr	t1
  800146:	03065633          	divu	a2,a2,a6
  80014a:	8722                	mv	a4,s0
  80014c:	f9bff0ef          	jal	ra,8000e6 <printnum>
  800150:	b7f9                	j	80011e <printnum+0x38>

0000000000800152 <vprintfmt>:
  800152:	7119                	addi	sp,sp,-128
  800154:	f4a6                	sd	s1,104(sp)
  800156:	f0ca                	sd	s2,96(sp)
  800158:	e8d2                	sd	s4,80(sp)
  80015a:	e4d6                	sd	s5,72(sp)
  80015c:	e0da                	sd	s6,64(sp)
  80015e:	fc5e                	sd	s7,56(sp)
  800160:	f862                	sd	s8,48(sp)
  800162:	f06a                	sd	s10,32(sp)
  800164:	fc86                	sd	ra,120(sp)
  800166:	f8a2                	sd	s0,112(sp)
  800168:	ecce                	sd	s3,88(sp)
  80016a:	f466                	sd	s9,40(sp)
  80016c:	ec6e                	sd	s11,24(sp)
  80016e:	892a                	mv	s2,a0
  800170:	84ae                	mv	s1,a1
  800172:	8d32                	mv	s10,a2
  800174:	8ab6                	mv	s5,a3
  800176:	5b7d                	li	s6,-1
  800178:	00000a17          	auipc	s4,0x0
  80017c:	404a0a13          	addi	s4,s4,1028 # 80057c <main+0x84>
  800180:	05e00b93          	li	s7,94
  800184:	00000c17          	auipc	s8,0x0
  800188:	554c0c13          	addi	s8,s8,1364 # 8006d8 <error_string>
  80018c:	000d4503          	lbu	a0,0(s10)
  800190:	02500793          	li	a5,37
  800194:	001d0413          	addi	s0,s10,1
  800198:	00f50e63          	beq	a0,a5,8001b4 <vprintfmt+0x62>
  80019c:	c521                	beqz	a0,8001e4 <vprintfmt+0x92>
  80019e:	02500993          	li	s3,37
  8001a2:	a011                	j	8001a6 <vprintfmt+0x54>
  8001a4:	c121                	beqz	a0,8001e4 <vprintfmt+0x92>
  8001a6:	85a6                	mv	a1,s1
  8001a8:	0405                	addi	s0,s0,1
  8001aa:	9902                	jalr	s2
  8001ac:	fff44503          	lbu	a0,-1(s0)
  8001b0:	ff351ae3          	bne	a0,s3,8001a4 <vprintfmt+0x52>
  8001b4:	00044603          	lbu	a2,0(s0)
  8001b8:	02000793          	li	a5,32
  8001bc:	4981                	li	s3,0
  8001be:	4801                	li	a6,0
  8001c0:	5cfd                	li	s9,-1
  8001c2:	5dfd                	li	s11,-1
  8001c4:	05500593          	li	a1,85
  8001c8:	4525                	li	a0,9
  8001ca:	fdd6069b          	addiw	a3,a2,-35
  8001ce:	0ff6f693          	andi	a3,a3,255
  8001d2:	00140d13          	addi	s10,s0,1
  8001d6:	1ed5ef63          	bltu	a1,a3,8003d4 <vprintfmt+0x282>
  8001da:	068a                	slli	a3,a3,0x2
  8001dc:	96d2                	add	a3,a3,s4
  8001de:	4294                	lw	a3,0(a3)
  8001e0:	96d2                	add	a3,a3,s4
  8001e2:	8682                	jr	a3
  8001e4:	70e6                	ld	ra,120(sp)
  8001e6:	7446                	ld	s0,112(sp)
  8001e8:	74a6                	ld	s1,104(sp)
  8001ea:	7906                	ld	s2,96(sp)
  8001ec:	69e6                	ld	s3,88(sp)
  8001ee:	6a46                	ld	s4,80(sp)
  8001f0:	6aa6                	ld	s5,72(sp)
  8001f2:	6b06                	ld	s6,64(sp)
  8001f4:	7be2                	ld	s7,56(sp)
  8001f6:	7c42                	ld	s8,48(sp)
  8001f8:	7ca2                	ld	s9,40(sp)
  8001fa:	7d02                	ld	s10,32(sp)
  8001fc:	6de2                	ld	s11,24(sp)
  8001fe:	6109                	addi	sp,sp,128
  800200:	8082                	ret
  800202:	87b2                	mv	a5,a2
  800204:	00144603          	lbu	a2,1(s0)
  800208:	846a                	mv	s0,s10
  80020a:	b7c1                	j	8001ca <vprintfmt+0x78>
  80020c:	000aac83          	lw	s9,0(s5)
  800210:	00144603          	lbu	a2,1(s0)
  800214:	0aa1                	addi	s5,s5,8
  800216:	846a                	mv	s0,s10
  800218:	fa0dd9e3          	bgez	s11,8001ca <vprintfmt+0x78>
  80021c:	8de6                	mv	s11,s9
  80021e:	5cfd                	li	s9,-1
  800220:	b76d                	j	8001ca <vprintfmt+0x78>
  800222:	fffdc693          	not	a3,s11
  800226:	96fd                	srai	a3,a3,0x3f
  800228:	00ddfdb3          	and	s11,s11,a3
  80022c:	00144603          	lbu	a2,1(s0)
  800230:	2d81                	sext.w	s11,s11
  800232:	846a                	mv	s0,s10
  800234:	bf59                	j	8001ca <vprintfmt+0x78>
  800236:	4705                	li	a4,1
  800238:	008a8593          	addi	a1,s5,8
  80023c:	01074463          	blt	a4,a6,800244 <vprintfmt+0xf2>
  800240:	22080863          	beqz	a6,800470 <vprintfmt+0x31e>
  800244:	000ab603          	ld	a2,0(s5)
  800248:	46c1                	li	a3,16
  80024a:	8aae                	mv	s5,a1
  80024c:	a291                	j	800390 <vprintfmt+0x23e>
  80024e:	fd060c9b          	addiw	s9,a2,-48
  800252:	00144603          	lbu	a2,1(s0)
  800256:	846a                	mv	s0,s10
  800258:	fd06069b          	addiw	a3,a2,-48
  80025c:	0006089b          	sext.w	a7,a2
  800260:	fad56ce3          	bltu	a0,a3,800218 <vprintfmt+0xc6>
  800264:	0405                	addi	s0,s0,1
  800266:	002c969b          	slliw	a3,s9,0x2
  80026a:	00044603          	lbu	a2,0(s0)
  80026e:	0196873b          	addw	a4,a3,s9
  800272:	0017171b          	slliw	a4,a4,0x1
  800276:	0117073b          	addw	a4,a4,a7
  80027a:	fd06069b          	addiw	a3,a2,-48
  80027e:	fd070c9b          	addiw	s9,a4,-48
  800282:	0006089b          	sext.w	a7,a2
  800286:	fcd57fe3          	bgeu	a0,a3,800264 <vprintfmt+0x112>
  80028a:	b779                	j	800218 <vprintfmt+0xc6>
  80028c:	000aa503          	lw	a0,0(s5)
  800290:	85a6                	mv	a1,s1
  800292:	0aa1                	addi	s5,s5,8
  800294:	9902                	jalr	s2
  800296:	bddd                	j	80018c <vprintfmt+0x3a>
  800298:	4705                	li	a4,1
  80029a:	008a8993          	addi	s3,s5,8
  80029e:	01074463          	blt	a4,a6,8002a6 <vprintfmt+0x154>
  8002a2:	1c080463          	beqz	a6,80046a <vprintfmt+0x318>
  8002a6:	000ab403          	ld	s0,0(s5)
  8002aa:	1c044a63          	bltz	s0,80047e <vprintfmt+0x32c>
  8002ae:	8622                	mv	a2,s0
  8002b0:	8ace                	mv	s5,s3
  8002b2:	46a9                	li	a3,10
  8002b4:	a8f1                	j	800390 <vprintfmt+0x23e>
  8002b6:	000aa783          	lw	a5,0(s5)
  8002ba:	4761                	li	a4,24
  8002bc:	0aa1                	addi	s5,s5,8
  8002be:	41f7d69b          	sraiw	a3,a5,0x1f
  8002c2:	8fb5                	xor	a5,a5,a3
  8002c4:	40d786bb          	subw	a3,a5,a3
  8002c8:	12d74963          	blt	a4,a3,8003fa <vprintfmt+0x2a8>
  8002cc:	00369793          	slli	a5,a3,0x3
  8002d0:	97e2                	add	a5,a5,s8
  8002d2:	639c                	ld	a5,0(a5)
  8002d4:	12078363          	beqz	a5,8003fa <vprintfmt+0x2a8>
  8002d8:	86be                	mv	a3,a5
  8002da:	00000617          	auipc	a2,0x0
  8002de:	5b660613          	addi	a2,a2,1462 # 800890 <error_string+0x1b8>
  8002e2:	85a6                	mv	a1,s1
  8002e4:	854a                	mv	a0,s2
  8002e6:	1cc000ef          	jal	ra,8004b2 <printfmt>
  8002ea:	b54d                	j	80018c <vprintfmt+0x3a>
  8002ec:	000ab603          	ld	a2,0(s5)
  8002f0:	0aa1                	addi	s5,s5,8
  8002f2:	1a060163          	beqz	a2,800494 <vprintfmt+0x342>
  8002f6:	00160413          	addi	s0,a2,1
  8002fa:	15b05763          	blez	s11,800448 <vprintfmt+0x2f6>
  8002fe:	02d00593          	li	a1,45
  800302:	10b79d63          	bne	a5,a1,80041c <vprintfmt+0x2ca>
  800306:	00064783          	lbu	a5,0(a2)
  80030a:	0007851b          	sext.w	a0,a5
  80030e:	c905                	beqz	a0,80033e <vprintfmt+0x1ec>
  800310:	000cc563          	bltz	s9,80031a <vprintfmt+0x1c8>
  800314:	3cfd                	addiw	s9,s9,-1
  800316:	036c8263          	beq	s9,s6,80033a <vprintfmt+0x1e8>
  80031a:	85a6                	mv	a1,s1
  80031c:	14098f63          	beqz	s3,80047a <vprintfmt+0x328>
  800320:	3781                	addiw	a5,a5,-32
  800322:	14fbfc63          	bgeu	s7,a5,80047a <vprintfmt+0x328>
  800326:	03f00513          	li	a0,63
  80032a:	9902                	jalr	s2
  80032c:	0405                	addi	s0,s0,1
  80032e:	fff44783          	lbu	a5,-1(s0)
  800332:	3dfd                	addiw	s11,s11,-1
  800334:	0007851b          	sext.w	a0,a5
  800338:	fd61                	bnez	a0,800310 <vprintfmt+0x1be>
  80033a:	e5b059e3          	blez	s11,80018c <vprintfmt+0x3a>
  80033e:	3dfd                	addiw	s11,s11,-1
  800340:	85a6                	mv	a1,s1
  800342:	02000513          	li	a0,32
  800346:	9902                	jalr	s2
  800348:	e40d82e3          	beqz	s11,80018c <vprintfmt+0x3a>
  80034c:	3dfd                	addiw	s11,s11,-1
  80034e:	85a6                	mv	a1,s1
  800350:	02000513          	li	a0,32
  800354:	9902                	jalr	s2
  800356:	fe0d94e3          	bnez	s11,80033e <vprintfmt+0x1ec>
  80035a:	bd0d                	j	80018c <vprintfmt+0x3a>
  80035c:	4705                	li	a4,1
  80035e:	008a8593          	addi	a1,s5,8
  800362:	01074463          	blt	a4,a6,80036a <vprintfmt+0x218>
  800366:	0e080863          	beqz	a6,800456 <vprintfmt+0x304>
  80036a:	000ab603          	ld	a2,0(s5)
  80036e:	46a1                	li	a3,8
  800370:	8aae                	mv	s5,a1
  800372:	a839                	j	800390 <vprintfmt+0x23e>
  800374:	03000513          	li	a0,48
  800378:	85a6                	mv	a1,s1
  80037a:	e03e                	sd	a5,0(sp)
  80037c:	9902                	jalr	s2
  80037e:	85a6                	mv	a1,s1
  800380:	07800513          	li	a0,120
  800384:	9902                	jalr	s2
  800386:	0aa1                	addi	s5,s5,8
  800388:	ff8ab603          	ld	a2,-8(s5)
  80038c:	6782                	ld	a5,0(sp)
  80038e:	46c1                	li	a3,16
  800390:	2781                	sext.w	a5,a5
  800392:	876e                	mv	a4,s11
  800394:	85a6                	mv	a1,s1
  800396:	854a                	mv	a0,s2
  800398:	d4fff0ef          	jal	ra,8000e6 <printnum>
  80039c:	bbc5                	j	80018c <vprintfmt+0x3a>
  80039e:	00144603          	lbu	a2,1(s0)
  8003a2:	2805                	addiw	a6,a6,1
  8003a4:	846a                	mv	s0,s10
  8003a6:	b515                	j	8001ca <vprintfmt+0x78>
  8003a8:	00144603          	lbu	a2,1(s0)
  8003ac:	4985                	li	s3,1
  8003ae:	846a                	mv	s0,s10
  8003b0:	bd29                	j	8001ca <vprintfmt+0x78>
  8003b2:	85a6                	mv	a1,s1
  8003b4:	02500513          	li	a0,37
  8003b8:	9902                	jalr	s2
  8003ba:	bbc9                	j	80018c <vprintfmt+0x3a>
  8003bc:	4705                	li	a4,1
  8003be:	008a8593          	addi	a1,s5,8
  8003c2:	01074463          	blt	a4,a6,8003ca <vprintfmt+0x278>
  8003c6:	08080d63          	beqz	a6,800460 <vprintfmt+0x30e>
  8003ca:	000ab603          	ld	a2,0(s5)
  8003ce:	46a9                	li	a3,10
  8003d0:	8aae                	mv	s5,a1
  8003d2:	bf7d                	j	800390 <vprintfmt+0x23e>
  8003d4:	85a6                	mv	a1,s1
  8003d6:	02500513          	li	a0,37
  8003da:	9902                	jalr	s2
  8003dc:	fff44703          	lbu	a4,-1(s0)
  8003e0:	02500793          	li	a5,37
  8003e4:	8d22                	mv	s10,s0
  8003e6:	daf703e3          	beq	a4,a5,80018c <vprintfmt+0x3a>
  8003ea:	02500713          	li	a4,37
  8003ee:	1d7d                	addi	s10,s10,-1
  8003f0:	fffd4783          	lbu	a5,-1(s10)
  8003f4:	fee79de3          	bne	a5,a4,8003ee <vprintfmt+0x29c>
  8003f8:	bb51                	j	80018c <vprintfmt+0x3a>
  8003fa:	00000617          	auipc	a2,0x0
  8003fe:	48660613          	addi	a2,a2,1158 # 800880 <error_string+0x1a8>
  800402:	85a6                	mv	a1,s1
  800404:	854a                	mv	a0,s2
  800406:	0ac000ef          	jal	ra,8004b2 <printfmt>
  80040a:	b349                	j	80018c <vprintfmt+0x3a>
  80040c:	00000617          	auipc	a2,0x0
  800410:	46c60613          	addi	a2,a2,1132 # 800878 <error_string+0x1a0>
  800414:	00000417          	auipc	s0,0x0
  800418:	46540413          	addi	s0,s0,1125 # 800879 <error_string+0x1a1>
  80041c:	8532                	mv	a0,a2
  80041e:	85e6                	mv	a1,s9
  800420:	e032                	sd	a2,0(sp)
  800422:	e43e                	sd	a5,8(sp)
  800424:	0ae000ef          	jal	ra,8004d2 <strnlen>
  800428:	40ad8dbb          	subw	s11,s11,a0
  80042c:	6602                	ld	a2,0(sp)
  80042e:	01b05d63          	blez	s11,800448 <vprintfmt+0x2f6>
  800432:	67a2                	ld	a5,8(sp)
  800434:	2781                	sext.w	a5,a5
  800436:	e43e                	sd	a5,8(sp)
  800438:	6522                	ld	a0,8(sp)
  80043a:	85a6                	mv	a1,s1
  80043c:	e032                	sd	a2,0(sp)
  80043e:	3dfd                	addiw	s11,s11,-1
  800440:	9902                	jalr	s2
  800442:	6602                	ld	a2,0(sp)
  800444:	fe0d9ae3          	bnez	s11,800438 <vprintfmt+0x2e6>
  800448:	00064783          	lbu	a5,0(a2)
  80044c:	0007851b          	sext.w	a0,a5
  800450:	ec0510e3          	bnez	a0,800310 <vprintfmt+0x1be>
  800454:	bb25                	j	80018c <vprintfmt+0x3a>
  800456:	000ae603          	lwu	a2,0(s5)
  80045a:	46a1                	li	a3,8
  80045c:	8aae                	mv	s5,a1
  80045e:	bf0d                	j	800390 <vprintfmt+0x23e>
  800460:	000ae603          	lwu	a2,0(s5)
  800464:	46a9                	li	a3,10
  800466:	8aae                	mv	s5,a1
  800468:	b725                	j	800390 <vprintfmt+0x23e>
  80046a:	000aa403          	lw	s0,0(s5)
  80046e:	bd35                	j	8002aa <vprintfmt+0x158>
  800470:	000ae603          	lwu	a2,0(s5)
  800474:	46c1                	li	a3,16
  800476:	8aae                	mv	s5,a1
  800478:	bf21                	j	800390 <vprintfmt+0x23e>
  80047a:	9902                	jalr	s2
  80047c:	bd45                	j	80032c <vprintfmt+0x1da>
  80047e:	85a6                	mv	a1,s1
  800480:	02d00513          	li	a0,45
  800484:	e03e                	sd	a5,0(sp)
  800486:	9902                	jalr	s2
  800488:	8ace                	mv	s5,s3
  80048a:	40800633          	neg	a2,s0
  80048e:	46a9                	li	a3,10
  800490:	6782                	ld	a5,0(sp)
  800492:	bdfd                	j	800390 <vprintfmt+0x23e>
  800494:	01b05663          	blez	s11,8004a0 <vprintfmt+0x34e>
  800498:	02d00693          	li	a3,45
  80049c:	f6d798e3          	bne	a5,a3,80040c <vprintfmt+0x2ba>
  8004a0:	00000417          	auipc	s0,0x0
  8004a4:	3d940413          	addi	s0,s0,985 # 800879 <error_string+0x1a1>
  8004a8:	02800513          	li	a0,40
  8004ac:	02800793          	li	a5,40
  8004b0:	b585                	j	800310 <vprintfmt+0x1be>

00000000008004b2 <printfmt>:
  8004b2:	715d                	addi	sp,sp,-80
  8004b4:	02810313          	addi	t1,sp,40
  8004b8:	f436                	sd	a3,40(sp)
  8004ba:	869a                	mv	a3,t1
  8004bc:	ec06                	sd	ra,24(sp)
  8004be:	f83a                	sd	a4,48(sp)
  8004c0:	fc3e                	sd	a5,56(sp)
  8004c2:	e0c2                	sd	a6,64(sp)
  8004c4:	e4c6                	sd	a7,72(sp)
  8004c6:	e41a                	sd	t1,8(sp)
  8004c8:	c8bff0ef          	jal	ra,800152 <vprintfmt>
  8004cc:	60e2                	ld	ra,24(sp)
  8004ce:	6161                	addi	sp,sp,80
  8004d0:	8082                	ret

00000000008004d2 <strnlen>:
  8004d2:	c185                	beqz	a1,8004f2 <strnlen+0x20>
  8004d4:	00054783          	lbu	a5,0(a0)
  8004d8:	cf89                	beqz	a5,8004f2 <strnlen+0x20>
  8004da:	4781                	li	a5,0
  8004dc:	a021                	j	8004e4 <strnlen+0x12>
  8004de:	00074703          	lbu	a4,0(a4)
  8004e2:	c711                	beqz	a4,8004ee <strnlen+0x1c>
  8004e4:	0785                	addi	a5,a5,1
  8004e6:	00f50733          	add	a4,a0,a5
  8004ea:	fef59ae3          	bne	a1,a5,8004de <strnlen+0xc>
  8004ee:	853e                	mv	a0,a5
  8004f0:	8082                	ret
  8004f2:	4781                	li	a5,0
  8004f4:	853e                	mv	a0,a5
  8004f6:	8082                	ret

00000000008004f8 <main>:
  8004f8:	1101                	addi	sp,sp,-32
  8004fa:	ec06                	sd	ra,24(sp)
  8004fc:	e822                	sd	s0,16(sp)
  8004fe:	e426                	sd	s1,8(sp)
  800500:	e04a                	sd	s2,0(sp)
  800502:	bd7ff0ef          	jal	ra,8000d8 <getpid>
  800506:	85aa                	mv	a1,a0
  800508:	00000517          	auipc	a0,0x0
  80050c:	39050513          	addi	a0,a0,912 # 800898 <error_string+0x1c0>
  800510:	b31ff0ef          	jal	ra,800040 <cprintf>
  800514:	4401                	li	s0,0
  800516:	00000917          	auipc	s2,0x0
  80051a:	3a290913          	addi	s2,s2,930 # 8008b8 <error_string+0x1e0>
  80051e:	4495                	li	s1,5
  800520:	bb7ff0ef          	jal	ra,8000d6 <yield>
  800524:	bb5ff0ef          	jal	ra,8000d8 <getpid>
  800528:	8622                	mv	a2,s0
  80052a:	85aa                	mv	a1,a0
  80052c:	2405                	addiw	s0,s0,1
  80052e:	854a                	mv	a0,s2
  800530:	b11ff0ef          	jal	ra,800040 <cprintf>
  800534:	fe9416e3          	bne	s0,s1,800520 <main+0x28>
  800538:	ba1ff0ef          	jal	ra,8000d8 <getpid>
  80053c:	85aa                	mv	a1,a0
  80053e:	00000517          	auipc	a0,0x0
  800542:	3a250513          	addi	a0,a0,930 # 8008e0 <error_string+0x208>
  800546:	afbff0ef          	jal	ra,800040 <cprintf>
  80054a:	00000517          	auipc	a0,0x0
  80054e:	3b650513          	addi	a0,a0,950 # 800900 <error_string+0x228>
  800552:	aefff0ef          	jal	ra,800040 <cprintf>
  800556:	60e2                	ld	ra,24(sp)
  800558:	6442                	ld	s0,16(sp)
  80055a:	64a2                	ld	s1,8(sp)
  80055c:	6902                	ld	s2,0(sp)
  80055e:	4501                	li	a0,0
  800560:	6105                	addi	sp,sp,32
  800562:	8082                	ret
