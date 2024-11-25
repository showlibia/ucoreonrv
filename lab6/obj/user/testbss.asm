
obj/__user_testbss.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	10e000ef          	jal	ra,80012e <umain>
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
  800038:	5dc50513          	addi	a0,a0,1500 # 800610 <main+0xc4>
  80003c:	ec06                	sd	ra,24(sp)
  80003e:	f436                	sd	a3,40(sp)
  800040:	f83a                	sd	a4,48(sp)
  800042:	e0c2                	sd	a6,64(sp)
  800044:	e4c6                	sd	a7,72(sp)
  800046:	e43e                	sd	a5,8(sp)
  800048:	058000ef          	jal	ra,8000a0 <cprintf>
  80004c:	65a2                	ld	a1,8(sp)
  80004e:	8522                	mv	a0,s0
  800050:	030000ef          	jal	ra,800080 <vcprintf>
  800054:	00000517          	auipc	a0,0x0
  800058:	5dc50513          	addi	a0,a0,1500 # 800630 <main+0xe4>
  80005c:	044000ef          	jal	ra,8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0b6000ef          	jal	ra,800118 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0a4000ef          	jal	ra,800112 <sys_putc>
  800072:	401c                	lw	a5,0(s0)
  800074:	60a2                	ld	ra,8(sp)
  800076:	2785                	addiw	a5,a5,1
  800078:	c01c                	sw	a5,0(s0)
  80007a:	6402                	ld	s0,0(sp)
  80007c:	0141                	addi	sp,sp,16
  80007e:	8082                	ret

0000000000800080 <vcprintf>:
  800080:	1101                	addi	sp,sp,-32
  800082:	86ae                	mv	a3,a1
  800084:	862a                	mv	a2,a0
  800086:	006c                	addi	a1,sp,12
  800088:	00000517          	auipc	a0,0x0
  80008c:	fde50513          	addi	a0,a0,-34 # 800066 <cputch>
  800090:	ec06                	sd	ra,24(sp)
  800092:	c602                	sw	zero,12(sp)
  800094:	112000ef          	jal	ra,8001a6 <vprintfmt>
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
  8000c8:	0de000ef          	jal	ra,8001a6 <vprintfmt>
  8000cc:	60e2                	ld	ra,24(sp)
  8000ce:	4512                	lw	a0,4(sp)
  8000d0:	6125                	addi	sp,sp,96
  8000d2:	8082                	ret

00000000008000d4 <syscall>:
  8000d4:	7175                	addi	sp,sp,-144
  8000d6:	f8ba                	sd	a4,112(sp)
  8000d8:	e0ba                	sd	a4,64(sp)
  8000da:	0118                	addi	a4,sp,128
  8000dc:	e42a                	sd	a0,8(sp)
  8000de:	ecae                	sd	a1,88(sp)
  8000e0:	f0b2                	sd	a2,96(sp)
  8000e2:	f4b6                	sd	a3,104(sp)
  8000e4:	fcbe                	sd	a5,120(sp)
  8000e6:	e142                	sd	a6,128(sp)
  8000e8:	e546                	sd	a7,136(sp)
  8000ea:	f42e                	sd	a1,40(sp)
  8000ec:	f832                	sd	a2,48(sp)
  8000ee:	fc36                	sd	a3,56(sp)
  8000f0:	f03a                	sd	a4,32(sp)
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
  80011c:	ff1ff0ef          	jal	ra,80010c <sys_exit>
  800120:	00000517          	auipc	a0,0x0
  800124:	51850513          	addi	a0,a0,1304 # 800638 <main+0xec>
  800128:	f79ff0ef          	jal	ra,8000a0 <cprintf>
  80012c:	a001                	j	80012c <exit+0x14>

000000000080012e <umain>:
  80012e:	1141                	addi	sp,sp,-16
  800130:	e406                	sd	ra,8(sp)
  800132:	41a000ef          	jal	ra,80054c <main>
  800136:	fe3ff0ef          	jal	ra,800118 <exit>

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
  800152:	e44e                	sd	s3,8(sp)
  800154:	84aa                	mv	s1,a0
  800156:	892e                	mv	s2,a1
  800158:	fff7041b          	addiw	s0,a4,-1
  80015c:	2a01                	sext.w	s4,s4
  80015e:	03067e63          	bgeu	a2,a6,80019a <printnum+0x60>
  800162:	89be                	mv	s3,a5
  800164:	00805763          	blez	s0,800172 <printnum+0x38>
  800168:	347d                	addiw	s0,s0,-1
  80016a:	85ca                	mv	a1,s2
  80016c:	854e                	mv	a0,s3
  80016e:	9482                	jalr	s1
  800170:	fc65                	bnez	s0,800168 <printnum+0x2e>
  800172:	1a02                	slli	s4,s4,0x20
  800174:	020a5a13          	srli	s4,s4,0x20
  800178:	00000797          	auipc	a5,0x0
  80017c:	6f878793          	addi	a5,a5,1784 # 800870 <error_string+0xc8>
  800180:	9a3e                	add	s4,s4,a5
  800182:	7402                	ld	s0,32(sp)
  800184:	000a4503          	lbu	a0,0(s4)
  800188:	70a2                	ld	ra,40(sp)
  80018a:	69a2                	ld	s3,8(sp)
  80018c:	6a02                	ld	s4,0(sp)
  80018e:	85ca                	mv	a1,s2
  800190:	8326                	mv	t1,s1
  800192:	6942                	ld	s2,16(sp)
  800194:	64e2                	ld	s1,24(sp)
  800196:	6145                	addi	sp,sp,48
  800198:	8302                	jr	t1
  80019a:	03065633          	divu	a2,a2,a6
  80019e:	8722                	mv	a4,s0
  8001a0:	f9bff0ef          	jal	ra,80013a <printnum>
  8001a4:	b7f9                	j	800172 <printnum+0x38>

00000000008001a6 <vprintfmt>:
  8001a6:	7119                	addi	sp,sp,-128
  8001a8:	f4a6                	sd	s1,104(sp)
  8001aa:	f0ca                	sd	s2,96(sp)
  8001ac:	e8d2                	sd	s4,80(sp)
  8001ae:	e4d6                	sd	s5,72(sp)
  8001b0:	e0da                	sd	s6,64(sp)
  8001b2:	fc5e                	sd	s7,56(sp)
  8001b4:	f862                	sd	s8,48(sp)
  8001b6:	f06a                	sd	s10,32(sp)
  8001b8:	fc86                	sd	ra,120(sp)
  8001ba:	f8a2                	sd	s0,112(sp)
  8001bc:	ecce                	sd	s3,88(sp)
  8001be:	f466                	sd	s9,40(sp)
  8001c0:	ec6e                	sd	s11,24(sp)
  8001c2:	892a                	mv	s2,a0
  8001c4:	84ae                	mv	s1,a1
  8001c6:	8d32                	mv	s10,a2
  8001c8:	8ab6                	mv	s5,a3
  8001ca:	5b7d                	li	s6,-1
  8001cc:	00000a17          	auipc	s4,0x0
  8001d0:	480a0a13          	addi	s4,s4,1152 # 80064c <main+0x100>
  8001d4:	05e00b93          	li	s7,94
  8001d8:	00000c17          	auipc	s8,0x0
  8001dc:	5d0c0c13          	addi	s8,s8,1488 # 8007a8 <error_string>
  8001e0:	000d4503          	lbu	a0,0(s10)
  8001e4:	02500793          	li	a5,37
  8001e8:	001d0413          	addi	s0,s10,1
  8001ec:	00f50e63          	beq	a0,a5,800208 <vprintfmt+0x62>
  8001f0:	c521                	beqz	a0,800238 <vprintfmt+0x92>
  8001f2:	02500993          	li	s3,37
  8001f6:	a011                	j	8001fa <vprintfmt+0x54>
  8001f8:	c121                	beqz	a0,800238 <vprintfmt+0x92>
  8001fa:	85a6                	mv	a1,s1
  8001fc:	0405                	addi	s0,s0,1
  8001fe:	9902                	jalr	s2
  800200:	fff44503          	lbu	a0,-1(s0)
  800204:	ff351ae3          	bne	a0,s3,8001f8 <vprintfmt+0x52>
  800208:	00044603          	lbu	a2,0(s0)
  80020c:	02000793          	li	a5,32
  800210:	4981                	li	s3,0
  800212:	4801                	li	a6,0
  800214:	5cfd                	li	s9,-1
  800216:	5dfd                	li	s11,-1
  800218:	05500593          	li	a1,85
  80021c:	4525                	li	a0,9
  80021e:	fdd6069b          	addiw	a3,a2,-35
  800222:	0ff6f693          	andi	a3,a3,255
  800226:	00140d13          	addi	s10,s0,1
  80022a:	1ed5ef63          	bltu	a1,a3,800428 <vprintfmt+0x282>
  80022e:	068a                	slli	a3,a3,0x2
  800230:	96d2                	add	a3,a3,s4
  800232:	4294                	lw	a3,0(a3)
  800234:	96d2                	add	a3,a3,s4
  800236:	8682                	jr	a3
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
  800256:	87b2                	mv	a5,a2
  800258:	00144603          	lbu	a2,1(s0)
  80025c:	846a                	mv	s0,s10
  80025e:	b7c1                	j	80021e <vprintfmt+0x78>
  800260:	000aac83          	lw	s9,0(s5)
  800264:	00144603          	lbu	a2,1(s0)
  800268:	0aa1                	addi	s5,s5,8
  80026a:	846a                	mv	s0,s10
  80026c:	fa0dd9e3          	bgez	s11,80021e <vprintfmt+0x78>
  800270:	8de6                	mv	s11,s9
  800272:	5cfd                	li	s9,-1
  800274:	b76d                	j	80021e <vprintfmt+0x78>
  800276:	fffdc693          	not	a3,s11
  80027a:	96fd                	srai	a3,a3,0x3f
  80027c:	00ddfdb3          	and	s11,s11,a3
  800280:	00144603          	lbu	a2,1(s0)
  800284:	2d81                	sext.w	s11,s11
  800286:	846a                	mv	s0,s10
  800288:	bf59                	j	80021e <vprintfmt+0x78>
  80028a:	4705                	li	a4,1
  80028c:	008a8593          	addi	a1,s5,8
  800290:	01074463          	blt	a4,a6,800298 <vprintfmt+0xf2>
  800294:	22080863          	beqz	a6,8004c4 <vprintfmt+0x31e>
  800298:	000ab603          	ld	a2,0(s5)
  80029c:	46c1                	li	a3,16
  80029e:	8aae                	mv	s5,a1
  8002a0:	a291                	j	8003e4 <vprintfmt+0x23e>
  8002a2:	fd060c9b          	addiw	s9,a2,-48
  8002a6:	00144603          	lbu	a2,1(s0)
  8002aa:	846a                	mv	s0,s10
  8002ac:	fd06069b          	addiw	a3,a2,-48
  8002b0:	0006089b          	sext.w	a7,a2
  8002b4:	fad56ce3          	bltu	a0,a3,80026c <vprintfmt+0xc6>
  8002b8:	0405                	addi	s0,s0,1
  8002ba:	002c969b          	slliw	a3,s9,0x2
  8002be:	00044603          	lbu	a2,0(s0)
  8002c2:	0196873b          	addw	a4,a3,s9
  8002c6:	0017171b          	slliw	a4,a4,0x1
  8002ca:	0117073b          	addw	a4,a4,a7
  8002ce:	fd06069b          	addiw	a3,a2,-48
  8002d2:	fd070c9b          	addiw	s9,a4,-48
  8002d6:	0006089b          	sext.w	a7,a2
  8002da:	fcd57fe3          	bgeu	a0,a3,8002b8 <vprintfmt+0x112>
  8002de:	b779                	j	80026c <vprintfmt+0xc6>
  8002e0:	000aa503          	lw	a0,0(s5)
  8002e4:	85a6                	mv	a1,s1
  8002e6:	0aa1                	addi	s5,s5,8
  8002e8:	9902                	jalr	s2
  8002ea:	bddd                	j	8001e0 <vprintfmt+0x3a>
  8002ec:	4705                	li	a4,1
  8002ee:	008a8993          	addi	s3,s5,8
  8002f2:	01074463          	blt	a4,a6,8002fa <vprintfmt+0x154>
  8002f6:	1c080463          	beqz	a6,8004be <vprintfmt+0x318>
  8002fa:	000ab403          	ld	s0,0(s5)
  8002fe:	1c044a63          	bltz	s0,8004d2 <vprintfmt+0x32c>
  800302:	8622                	mv	a2,s0
  800304:	8ace                	mv	s5,s3
  800306:	46a9                	li	a3,10
  800308:	a8f1                	j	8003e4 <vprintfmt+0x23e>
  80030a:	000aa783          	lw	a5,0(s5)
  80030e:	4761                	li	a4,24
  800310:	0aa1                	addi	s5,s5,8
  800312:	41f7d69b          	sraiw	a3,a5,0x1f
  800316:	8fb5                	xor	a5,a5,a3
  800318:	40d786bb          	subw	a3,a5,a3
  80031c:	12d74963          	blt	a4,a3,80044e <vprintfmt+0x2a8>
  800320:	00369793          	slli	a5,a3,0x3
  800324:	97e2                	add	a5,a5,s8
  800326:	639c                	ld	a5,0(a5)
  800328:	12078363          	beqz	a5,80044e <vprintfmt+0x2a8>
  80032c:	86be                	mv	a3,a5
  80032e:	00000617          	auipc	a2,0x0
  800332:	63260613          	addi	a2,a2,1586 # 800960 <error_string+0x1b8>
  800336:	85a6                	mv	a1,s1
  800338:	854a                	mv	a0,s2
  80033a:	1cc000ef          	jal	ra,800506 <printfmt>
  80033e:	b54d                	j	8001e0 <vprintfmt+0x3a>
  800340:	000ab603          	ld	a2,0(s5)
  800344:	0aa1                	addi	s5,s5,8
  800346:	1a060163          	beqz	a2,8004e8 <vprintfmt+0x342>
  80034a:	00160413          	addi	s0,a2,1
  80034e:	15b05763          	blez	s11,80049c <vprintfmt+0x2f6>
  800352:	02d00593          	li	a1,45
  800356:	10b79d63          	bne	a5,a1,800470 <vprintfmt+0x2ca>
  80035a:	00064783          	lbu	a5,0(a2)
  80035e:	0007851b          	sext.w	a0,a5
  800362:	c905                	beqz	a0,800392 <vprintfmt+0x1ec>
  800364:	000cc563          	bltz	s9,80036e <vprintfmt+0x1c8>
  800368:	3cfd                	addiw	s9,s9,-1
  80036a:	036c8263          	beq	s9,s6,80038e <vprintfmt+0x1e8>
  80036e:	85a6                	mv	a1,s1
  800370:	14098f63          	beqz	s3,8004ce <vprintfmt+0x328>
  800374:	3781                	addiw	a5,a5,-32
  800376:	14fbfc63          	bgeu	s7,a5,8004ce <vprintfmt+0x328>
  80037a:	03f00513          	li	a0,63
  80037e:	9902                	jalr	s2
  800380:	0405                	addi	s0,s0,1
  800382:	fff44783          	lbu	a5,-1(s0)
  800386:	3dfd                	addiw	s11,s11,-1
  800388:	0007851b          	sext.w	a0,a5
  80038c:	fd61                	bnez	a0,800364 <vprintfmt+0x1be>
  80038e:	e5b059e3          	blez	s11,8001e0 <vprintfmt+0x3a>
  800392:	3dfd                	addiw	s11,s11,-1
  800394:	85a6                	mv	a1,s1
  800396:	02000513          	li	a0,32
  80039a:	9902                	jalr	s2
  80039c:	e40d82e3          	beqz	s11,8001e0 <vprintfmt+0x3a>
  8003a0:	3dfd                	addiw	s11,s11,-1
  8003a2:	85a6                	mv	a1,s1
  8003a4:	02000513          	li	a0,32
  8003a8:	9902                	jalr	s2
  8003aa:	fe0d94e3          	bnez	s11,800392 <vprintfmt+0x1ec>
  8003ae:	bd0d                	j	8001e0 <vprintfmt+0x3a>
  8003b0:	4705                	li	a4,1
  8003b2:	008a8593          	addi	a1,s5,8
  8003b6:	01074463          	blt	a4,a6,8003be <vprintfmt+0x218>
  8003ba:	0e080863          	beqz	a6,8004aa <vprintfmt+0x304>
  8003be:	000ab603          	ld	a2,0(s5)
  8003c2:	46a1                	li	a3,8
  8003c4:	8aae                	mv	s5,a1
  8003c6:	a839                	j	8003e4 <vprintfmt+0x23e>
  8003c8:	03000513          	li	a0,48
  8003cc:	85a6                	mv	a1,s1
  8003ce:	e03e                	sd	a5,0(sp)
  8003d0:	9902                	jalr	s2
  8003d2:	85a6                	mv	a1,s1
  8003d4:	07800513          	li	a0,120
  8003d8:	9902                	jalr	s2
  8003da:	0aa1                	addi	s5,s5,8
  8003dc:	ff8ab603          	ld	a2,-8(s5)
  8003e0:	6782                	ld	a5,0(sp)
  8003e2:	46c1                	li	a3,16
  8003e4:	2781                	sext.w	a5,a5
  8003e6:	876e                	mv	a4,s11
  8003e8:	85a6                	mv	a1,s1
  8003ea:	854a                	mv	a0,s2
  8003ec:	d4fff0ef          	jal	ra,80013a <printnum>
  8003f0:	bbc5                	j	8001e0 <vprintfmt+0x3a>
  8003f2:	00144603          	lbu	a2,1(s0)
  8003f6:	2805                	addiw	a6,a6,1
  8003f8:	846a                	mv	s0,s10
  8003fa:	b515                	j	80021e <vprintfmt+0x78>
  8003fc:	00144603          	lbu	a2,1(s0)
  800400:	4985                	li	s3,1
  800402:	846a                	mv	s0,s10
  800404:	bd29                	j	80021e <vprintfmt+0x78>
  800406:	85a6                	mv	a1,s1
  800408:	02500513          	li	a0,37
  80040c:	9902                	jalr	s2
  80040e:	bbc9                	j	8001e0 <vprintfmt+0x3a>
  800410:	4705                	li	a4,1
  800412:	008a8593          	addi	a1,s5,8
  800416:	01074463          	blt	a4,a6,80041e <vprintfmt+0x278>
  80041a:	08080d63          	beqz	a6,8004b4 <vprintfmt+0x30e>
  80041e:	000ab603          	ld	a2,0(s5)
  800422:	46a9                	li	a3,10
  800424:	8aae                	mv	s5,a1
  800426:	bf7d                	j	8003e4 <vprintfmt+0x23e>
  800428:	85a6                	mv	a1,s1
  80042a:	02500513          	li	a0,37
  80042e:	9902                	jalr	s2
  800430:	fff44703          	lbu	a4,-1(s0)
  800434:	02500793          	li	a5,37
  800438:	8d22                	mv	s10,s0
  80043a:	daf703e3          	beq	a4,a5,8001e0 <vprintfmt+0x3a>
  80043e:	02500713          	li	a4,37
  800442:	1d7d                	addi	s10,s10,-1
  800444:	fffd4783          	lbu	a5,-1(s10)
  800448:	fee79de3          	bne	a5,a4,800442 <vprintfmt+0x29c>
  80044c:	bb51                	j	8001e0 <vprintfmt+0x3a>
  80044e:	00000617          	auipc	a2,0x0
  800452:	50260613          	addi	a2,a2,1282 # 800950 <error_string+0x1a8>
  800456:	85a6                	mv	a1,s1
  800458:	854a                	mv	a0,s2
  80045a:	0ac000ef          	jal	ra,800506 <printfmt>
  80045e:	b349                	j	8001e0 <vprintfmt+0x3a>
  800460:	00000617          	auipc	a2,0x0
  800464:	4e860613          	addi	a2,a2,1256 # 800948 <error_string+0x1a0>
  800468:	00000417          	auipc	s0,0x0
  80046c:	4e140413          	addi	s0,s0,1249 # 800949 <error_string+0x1a1>
  800470:	8532                	mv	a0,a2
  800472:	85e6                	mv	a1,s9
  800474:	e032                	sd	a2,0(sp)
  800476:	e43e                	sd	a5,8(sp)
  800478:	0ae000ef          	jal	ra,800526 <strnlen>
  80047c:	40ad8dbb          	subw	s11,s11,a0
  800480:	6602                	ld	a2,0(sp)
  800482:	01b05d63          	blez	s11,80049c <vprintfmt+0x2f6>
  800486:	67a2                	ld	a5,8(sp)
  800488:	2781                	sext.w	a5,a5
  80048a:	e43e                	sd	a5,8(sp)
  80048c:	6522                	ld	a0,8(sp)
  80048e:	85a6                	mv	a1,s1
  800490:	e032                	sd	a2,0(sp)
  800492:	3dfd                	addiw	s11,s11,-1
  800494:	9902                	jalr	s2
  800496:	6602                	ld	a2,0(sp)
  800498:	fe0d9ae3          	bnez	s11,80048c <vprintfmt+0x2e6>
  80049c:	00064783          	lbu	a5,0(a2)
  8004a0:	0007851b          	sext.w	a0,a5
  8004a4:	ec0510e3          	bnez	a0,800364 <vprintfmt+0x1be>
  8004a8:	bb25                	j	8001e0 <vprintfmt+0x3a>
  8004aa:	000ae603          	lwu	a2,0(s5)
  8004ae:	46a1                	li	a3,8
  8004b0:	8aae                	mv	s5,a1
  8004b2:	bf0d                	j	8003e4 <vprintfmt+0x23e>
  8004b4:	000ae603          	lwu	a2,0(s5)
  8004b8:	46a9                	li	a3,10
  8004ba:	8aae                	mv	s5,a1
  8004bc:	b725                	j	8003e4 <vprintfmt+0x23e>
  8004be:	000aa403          	lw	s0,0(s5)
  8004c2:	bd35                	j	8002fe <vprintfmt+0x158>
  8004c4:	000ae603          	lwu	a2,0(s5)
  8004c8:	46c1                	li	a3,16
  8004ca:	8aae                	mv	s5,a1
  8004cc:	bf21                	j	8003e4 <vprintfmt+0x23e>
  8004ce:	9902                	jalr	s2
  8004d0:	bd45                	j	800380 <vprintfmt+0x1da>
  8004d2:	85a6                	mv	a1,s1
  8004d4:	02d00513          	li	a0,45
  8004d8:	e03e                	sd	a5,0(sp)
  8004da:	9902                	jalr	s2
  8004dc:	8ace                	mv	s5,s3
  8004de:	40800633          	neg	a2,s0
  8004e2:	46a9                	li	a3,10
  8004e4:	6782                	ld	a5,0(sp)
  8004e6:	bdfd                	j	8003e4 <vprintfmt+0x23e>
  8004e8:	01b05663          	blez	s11,8004f4 <vprintfmt+0x34e>
  8004ec:	02d00693          	li	a3,45
  8004f0:	f6d798e3          	bne	a5,a3,800460 <vprintfmt+0x2ba>
  8004f4:	00000417          	auipc	s0,0x0
  8004f8:	45540413          	addi	s0,s0,1109 # 800949 <error_string+0x1a1>
  8004fc:	02800513          	li	a0,40
  800500:	02800793          	li	a5,40
  800504:	b585                	j	800364 <vprintfmt+0x1be>

0000000000800506 <printfmt>:
  800506:	715d                	addi	sp,sp,-80
  800508:	02810313          	addi	t1,sp,40
  80050c:	f436                	sd	a3,40(sp)
  80050e:	869a                	mv	a3,t1
  800510:	ec06                	sd	ra,24(sp)
  800512:	f83a                	sd	a4,48(sp)
  800514:	fc3e                	sd	a5,56(sp)
  800516:	e0c2                	sd	a6,64(sp)
  800518:	e4c6                	sd	a7,72(sp)
  80051a:	e41a                	sd	t1,8(sp)
  80051c:	c8bff0ef          	jal	ra,8001a6 <vprintfmt>
  800520:	60e2                	ld	ra,24(sp)
  800522:	6161                	addi	sp,sp,80
  800524:	8082                	ret

0000000000800526 <strnlen>:
  800526:	c185                	beqz	a1,800546 <strnlen+0x20>
  800528:	00054783          	lbu	a5,0(a0)
  80052c:	cf89                	beqz	a5,800546 <strnlen+0x20>
  80052e:	4781                	li	a5,0
  800530:	a021                	j	800538 <strnlen+0x12>
  800532:	00074703          	lbu	a4,0(a4)
  800536:	c711                	beqz	a4,800542 <strnlen+0x1c>
  800538:	0785                	addi	a5,a5,1
  80053a:	00f50733          	add	a4,a0,a5
  80053e:	fef59ae3          	bne	a1,a5,800532 <strnlen+0xc>
  800542:	853e                	mv	a0,a5
  800544:	8082                	ret
  800546:	4781                	li	a5,0
  800548:	853e                	mv	a0,a5
  80054a:	8082                	ret

000000000080054c <main>:
  80054c:	1141                	addi	sp,sp,-16
  80054e:	00000517          	auipc	a0,0x0
  800552:	41a50513          	addi	a0,a0,1050 # 800968 <error_string+0x1c0>
  800556:	e406                	sd	ra,8(sp)
  800558:	b49ff0ef          	jal	ra,8000a0 <cprintf>
  80055c:	00001597          	auipc	a1,0x1
  800560:	aa458593          	addi	a1,a1,-1372 # 801000 <bigarray>
  800564:	87ae                	mv	a5,a1
  800566:	4681                	li	a3,0
  800568:	00100637          	lui	a2,0x100
  80056c:	a029                	j	800576 <main+0x2a>
  80056e:	2685                	addiw	a3,a3,1
  800570:	0791                	addi	a5,a5,4
  800572:	00c68f63          	beq	a3,a2,800590 <main+0x44>
  800576:	4398                	lw	a4,0(a5)
  800578:	db7d                	beqz	a4,80056e <main+0x22>
  80057a:	00000617          	auipc	a2,0x0
  80057e:	40e60613          	addi	a2,a2,1038 # 800988 <error_string+0x1e0>
  800582:	45b9                	li	a1,14
  800584:	00000517          	auipc	a0,0x0
  800588:	42450513          	addi	a0,a0,1060 # 8009a8 <error_string+0x200>
  80058c:	a9bff0ef          	jal	ra,800026 <__panic>
  800590:	00001717          	auipc	a4,0x1
  800594:	a7070713          	addi	a4,a4,-1424 # 801000 <bigarray>
  800598:	4781                	li	a5,0
  80059a:	001006b7          	lui	a3,0x100
  80059e:	c31c                	sw	a5,0(a4)
  8005a0:	2785                	addiw	a5,a5,1
  8005a2:	0711                	addi	a4,a4,4
  8005a4:	fed79de3          	bne	a5,a3,80059e <main+0x52>
  8005a8:	4681                	li	a3,0
  8005aa:	00100737          	lui	a4,0x100
  8005ae:	a029                	j	8005b8 <main+0x6c>
  8005b0:	2685                	addiw	a3,a3,1
  8005b2:	0591                	addi	a1,a1,4
  8005b4:	02e68063          	beq	a3,a4,8005d4 <main+0x88>
  8005b8:	419c                	lw	a5,0(a1)
  8005ba:	fed78be3          	beq	a5,a3,8005b0 <main+0x64>
  8005be:	00000617          	auipc	a2,0x0
  8005c2:	3fa60613          	addi	a2,a2,1018 # 8009b8 <error_string+0x210>
  8005c6:	45d9                	li	a1,22
  8005c8:	00000517          	auipc	a0,0x0
  8005cc:	3e050513          	addi	a0,a0,992 # 8009a8 <error_string+0x200>
  8005d0:	a57ff0ef          	jal	ra,800026 <__panic>
  8005d4:	00000517          	auipc	a0,0x0
  8005d8:	40c50513          	addi	a0,a0,1036 # 8009e0 <error_string+0x238>
  8005dc:	ac5ff0ef          	jal	ra,8000a0 <cprintf>
  8005e0:	00000517          	auipc	a0,0x0
  8005e4:	43850513          	addi	a0,a0,1080 # 800a18 <error_string+0x270>
  8005e8:	ab9ff0ef          	jal	ra,8000a0 <cprintf>
  8005ec:	00000617          	auipc	a2,0x0
  8005f0:	44460613          	addi	a2,a2,1092 # 800a30 <error_string+0x288>
  8005f4:	45fd                	li	a1,31
  8005f6:	00000517          	auipc	a0,0x0
  8005fa:	3b250513          	addi	a0,a0,946 # 8009a8 <error_string+0x200>
  8005fe:	00402797          	auipc	a5,0x402
  800602:	a007a123          	sw	zero,-1534(a5) # c02000 <bigarray+0x401000>
  800606:	a21ff0ef          	jal	ra,800026 <__panic>
