
obj/__user_faultread.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	0ae000ef          	jal	ra,8000ce <umain>
  800024:	a001                	j	800024 <_start+0x4>

0000000000800026 <cputch>:
  800026:	1141                	addi	sp,sp,-16
  800028:	e022                	sd	s0,0(sp)
  80002a:	e406                	sd	ra,8(sp)
  80002c:	842e                	mv	s0,a1
  80002e:	084000ef          	jal	ra,8000b2 <sys_putc>
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
  800068:	0de000ef          	jal	ra,800146 <vprintfmt>
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

00000000008000b2 <sys_putc>:
  8000b2:	85aa                	mv	a1,a0
  8000b4:	4579                	li	a0,30
  8000b6:	bf7d                	j	800074 <syscall>

00000000008000b8 <exit>:
  8000b8:	1141                	addi	sp,sp,-16
  8000ba:	e406                	sd	ra,8(sp)
  8000bc:	ff1ff0ef          	jal	ra,8000ac <sys_exit>
  8000c0:	00000517          	auipc	a0,0x0
  8000c4:	43850513          	addi	a0,a0,1080 # 8004f8 <main+0xc>
  8000c8:	f79ff0ef          	jal	ra,800040 <cprintf>
  8000cc:	a001                	j	8000cc <exit+0x14>

00000000008000ce <umain>:
  8000ce:	1141                	addi	sp,sp,-16
  8000d0:	e406                	sd	ra,8(sp)
  8000d2:	41a000ef          	jal	ra,8004ec <main>
  8000d6:	fe3ff0ef          	jal	ra,8000b8 <exit>

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
  8000f2:	e44e                	sd	s3,8(sp)
  8000f4:	84aa                	mv	s1,a0
  8000f6:	892e                	mv	s2,a1
  8000f8:	fff7041b          	addiw	s0,a4,-1
  8000fc:	2a01                	sext.w	s4,s4
  8000fe:	03067e63          	bgeu	a2,a6,80013a <printnum+0x60>
  800102:	89be                	mv	s3,a5
  800104:	00805763          	blez	s0,800112 <printnum+0x38>
  800108:	347d                	addiw	s0,s0,-1
  80010a:	85ca                	mv	a1,s2
  80010c:	854e                	mv	a0,s3
  80010e:	9482                	jalr	s1
  800110:	fc65                	bnez	s0,800108 <printnum+0x2e>
  800112:	1a02                	slli	s4,s4,0x20
  800114:	020a5a13          	srli	s4,s4,0x20
  800118:	00000797          	auipc	a5,0x0
  80011c:	61878793          	addi	a5,a5,1560 # 800730 <error_string+0xc8>
  800120:	9a3e                	add	s4,s4,a5
  800122:	7402                	ld	s0,32(sp)
  800124:	000a4503          	lbu	a0,0(s4)
  800128:	70a2                	ld	ra,40(sp)
  80012a:	69a2                	ld	s3,8(sp)
  80012c:	6a02                	ld	s4,0(sp)
  80012e:	85ca                	mv	a1,s2
  800130:	8326                	mv	t1,s1
  800132:	6942                	ld	s2,16(sp)
  800134:	64e2                	ld	s1,24(sp)
  800136:	6145                	addi	sp,sp,48
  800138:	8302                	jr	t1
  80013a:	03065633          	divu	a2,a2,a6
  80013e:	8722                	mv	a4,s0
  800140:	f9bff0ef          	jal	ra,8000da <printnum>
  800144:	b7f9                	j	800112 <printnum+0x38>

0000000000800146 <vprintfmt>:
  800146:	7119                	addi	sp,sp,-128
  800148:	f4a6                	sd	s1,104(sp)
  80014a:	f0ca                	sd	s2,96(sp)
  80014c:	e8d2                	sd	s4,80(sp)
  80014e:	e4d6                	sd	s5,72(sp)
  800150:	e0da                	sd	s6,64(sp)
  800152:	fc5e                	sd	s7,56(sp)
  800154:	f862                	sd	s8,48(sp)
  800156:	f06a                	sd	s10,32(sp)
  800158:	fc86                	sd	ra,120(sp)
  80015a:	f8a2                	sd	s0,112(sp)
  80015c:	ecce                	sd	s3,88(sp)
  80015e:	f466                	sd	s9,40(sp)
  800160:	ec6e                	sd	s11,24(sp)
  800162:	892a                	mv	s2,a0
  800164:	84ae                	mv	s1,a1
  800166:	8d32                	mv	s10,a2
  800168:	8ab6                	mv	s5,a3
  80016a:	5b7d                	li	s6,-1
  80016c:	00000a17          	auipc	s4,0x0
  800170:	3a0a0a13          	addi	s4,s4,928 # 80050c <main+0x20>
  800174:	05e00b93          	li	s7,94
  800178:	00000c17          	auipc	s8,0x0
  80017c:	4f0c0c13          	addi	s8,s8,1264 # 800668 <error_string>
  800180:	000d4503          	lbu	a0,0(s10)
  800184:	02500793          	li	a5,37
  800188:	001d0413          	addi	s0,s10,1
  80018c:	00f50e63          	beq	a0,a5,8001a8 <vprintfmt+0x62>
  800190:	c521                	beqz	a0,8001d8 <vprintfmt+0x92>
  800192:	02500993          	li	s3,37
  800196:	a011                	j	80019a <vprintfmt+0x54>
  800198:	c121                	beqz	a0,8001d8 <vprintfmt+0x92>
  80019a:	85a6                	mv	a1,s1
  80019c:	0405                	addi	s0,s0,1
  80019e:	9902                	jalr	s2
  8001a0:	fff44503          	lbu	a0,-1(s0)
  8001a4:	ff351ae3          	bne	a0,s3,800198 <vprintfmt+0x52>
  8001a8:	00044603          	lbu	a2,0(s0)
  8001ac:	02000793          	li	a5,32
  8001b0:	4981                	li	s3,0
  8001b2:	4801                	li	a6,0
  8001b4:	5cfd                	li	s9,-1
  8001b6:	5dfd                	li	s11,-1
  8001b8:	05500593          	li	a1,85
  8001bc:	4525                	li	a0,9
  8001be:	fdd6069b          	addiw	a3,a2,-35
  8001c2:	0ff6f693          	andi	a3,a3,255
  8001c6:	00140d13          	addi	s10,s0,1
  8001ca:	1ed5ef63          	bltu	a1,a3,8003c8 <vprintfmt+0x282>
  8001ce:	068a                	slli	a3,a3,0x2
  8001d0:	96d2                	add	a3,a3,s4
  8001d2:	4294                	lw	a3,0(a3)
  8001d4:	96d2                	add	a3,a3,s4
  8001d6:	8682                	jr	a3
  8001d8:	70e6                	ld	ra,120(sp)
  8001da:	7446                	ld	s0,112(sp)
  8001dc:	74a6                	ld	s1,104(sp)
  8001de:	7906                	ld	s2,96(sp)
  8001e0:	69e6                	ld	s3,88(sp)
  8001e2:	6a46                	ld	s4,80(sp)
  8001e4:	6aa6                	ld	s5,72(sp)
  8001e6:	6b06                	ld	s6,64(sp)
  8001e8:	7be2                	ld	s7,56(sp)
  8001ea:	7c42                	ld	s8,48(sp)
  8001ec:	7ca2                	ld	s9,40(sp)
  8001ee:	7d02                	ld	s10,32(sp)
  8001f0:	6de2                	ld	s11,24(sp)
  8001f2:	6109                	addi	sp,sp,128
  8001f4:	8082                	ret
  8001f6:	87b2                	mv	a5,a2
  8001f8:	00144603          	lbu	a2,1(s0)
  8001fc:	846a                	mv	s0,s10
  8001fe:	b7c1                	j	8001be <vprintfmt+0x78>
  800200:	000aac83          	lw	s9,0(s5)
  800204:	00144603          	lbu	a2,1(s0)
  800208:	0aa1                	addi	s5,s5,8
  80020a:	846a                	mv	s0,s10
  80020c:	fa0dd9e3          	bgez	s11,8001be <vprintfmt+0x78>
  800210:	8de6                	mv	s11,s9
  800212:	5cfd                	li	s9,-1
  800214:	b76d                	j	8001be <vprintfmt+0x78>
  800216:	fffdc693          	not	a3,s11
  80021a:	96fd                	srai	a3,a3,0x3f
  80021c:	00ddfdb3          	and	s11,s11,a3
  800220:	00144603          	lbu	a2,1(s0)
  800224:	2d81                	sext.w	s11,s11
  800226:	846a                	mv	s0,s10
  800228:	bf59                	j	8001be <vprintfmt+0x78>
  80022a:	4705                	li	a4,1
  80022c:	008a8593          	addi	a1,s5,8
  800230:	01074463          	blt	a4,a6,800238 <vprintfmt+0xf2>
  800234:	22080863          	beqz	a6,800464 <vprintfmt+0x31e>
  800238:	000ab603          	ld	a2,0(s5)
  80023c:	46c1                	li	a3,16
  80023e:	8aae                	mv	s5,a1
  800240:	a291                	j	800384 <vprintfmt+0x23e>
  800242:	fd060c9b          	addiw	s9,a2,-48
  800246:	00144603          	lbu	a2,1(s0)
  80024a:	846a                	mv	s0,s10
  80024c:	fd06069b          	addiw	a3,a2,-48
  800250:	0006089b          	sext.w	a7,a2
  800254:	fad56ce3          	bltu	a0,a3,80020c <vprintfmt+0xc6>
  800258:	0405                	addi	s0,s0,1
  80025a:	002c969b          	slliw	a3,s9,0x2
  80025e:	00044603          	lbu	a2,0(s0)
  800262:	0196873b          	addw	a4,a3,s9
  800266:	0017171b          	slliw	a4,a4,0x1
  80026a:	0117073b          	addw	a4,a4,a7
  80026e:	fd06069b          	addiw	a3,a2,-48
  800272:	fd070c9b          	addiw	s9,a4,-48
  800276:	0006089b          	sext.w	a7,a2
  80027a:	fcd57fe3          	bgeu	a0,a3,800258 <vprintfmt+0x112>
  80027e:	b779                	j	80020c <vprintfmt+0xc6>
  800280:	000aa503          	lw	a0,0(s5)
  800284:	85a6                	mv	a1,s1
  800286:	0aa1                	addi	s5,s5,8
  800288:	9902                	jalr	s2
  80028a:	bddd                	j	800180 <vprintfmt+0x3a>
  80028c:	4705                	li	a4,1
  80028e:	008a8993          	addi	s3,s5,8
  800292:	01074463          	blt	a4,a6,80029a <vprintfmt+0x154>
  800296:	1c080463          	beqz	a6,80045e <vprintfmt+0x318>
  80029a:	000ab403          	ld	s0,0(s5)
  80029e:	1c044a63          	bltz	s0,800472 <vprintfmt+0x32c>
  8002a2:	8622                	mv	a2,s0
  8002a4:	8ace                	mv	s5,s3
  8002a6:	46a9                	li	a3,10
  8002a8:	a8f1                	j	800384 <vprintfmt+0x23e>
  8002aa:	000aa783          	lw	a5,0(s5)
  8002ae:	4761                	li	a4,24
  8002b0:	0aa1                	addi	s5,s5,8
  8002b2:	41f7d69b          	sraiw	a3,a5,0x1f
  8002b6:	8fb5                	xor	a5,a5,a3
  8002b8:	40d786bb          	subw	a3,a5,a3
  8002bc:	12d74963          	blt	a4,a3,8003ee <vprintfmt+0x2a8>
  8002c0:	00369793          	slli	a5,a3,0x3
  8002c4:	97e2                	add	a5,a5,s8
  8002c6:	639c                	ld	a5,0(a5)
  8002c8:	12078363          	beqz	a5,8003ee <vprintfmt+0x2a8>
  8002cc:	86be                	mv	a3,a5
  8002ce:	00000617          	auipc	a2,0x0
  8002d2:	55260613          	addi	a2,a2,1362 # 800820 <error_string+0x1b8>
  8002d6:	85a6                	mv	a1,s1
  8002d8:	854a                	mv	a0,s2
  8002da:	1cc000ef          	jal	ra,8004a6 <printfmt>
  8002de:	b54d                	j	800180 <vprintfmt+0x3a>
  8002e0:	000ab603          	ld	a2,0(s5)
  8002e4:	0aa1                	addi	s5,s5,8
  8002e6:	1a060163          	beqz	a2,800488 <vprintfmt+0x342>
  8002ea:	00160413          	addi	s0,a2,1
  8002ee:	15b05763          	blez	s11,80043c <vprintfmt+0x2f6>
  8002f2:	02d00593          	li	a1,45
  8002f6:	10b79d63          	bne	a5,a1,800410 <vprintfmt+0x2ca>
  8002fa:	00064783          	lbu	a5,0(a2)
  8002fe:	0007851b          	sext.w	a0,a5
  800302:	c905                	beqz	a0,800332 <vprintfmt+0x1ec>
  800304:	000cc563          	bltz	s9,80030e <vprintfmt+0x1c8>
  800308:	3cfd                	addiw	s9,s9,-1
  80030a:	036c8263          	beq	s9,s6,80032e <vprintfmt+0x1e8>
  80030e:	85a6                	mv	a1,s1
  800310:	14098f63          	beqz	s3,80046e <vprintfmt+0x328>
  800314:	3781                	addiw	a5,a5,-32
  800316:	14fbfc63          	bgeu	s7,a5,80046e <vprintfmt+0x328>
  80031a:	03f00513          	li	a0,63
  80031e:	9902                	jalr	s2
  800320:	0405                	addi	s0,s0,1
  800322:	fff44783          	lbu	a5,-1(s0)
  800326:	3dfd                	addiw	s11,s11,-1
  800328:	0007851b          	sext.w	a0,a5
  80032c:	fd61                	bnez	a0,800304 <vprintfmt+0x1be>
  80032e:	e5b059e3          	blez	s11,800180 <vprintfmt+0x3a>
  800332:	3dfd                	addiw	s11,s11,-1
  800334:	85a6                	mv	a1,s1
  800336:	02000513          	li	a0,32
  80033a:	9902                	jalr	s2
  80033c:	e40d82e3          	beqz	s11,800180 <vprintfmt+0x3a>
  800340:	3dfd                	addiw	s11,s11,-1
  800342:	85a6                	mv	a1,s1
  800344:	02000513          	li	a0,32
  800348:	9902                	jalr	s2
  80034a:	fe0d94e3          	bnez	s11,800332 <vprintfmt+0x1ec>
  80034e:	bd0d                	j	800180 <vprintfmt+0x3a>
  800350:	4705                	li	a4,1
  800352:	008a8593          	addi	a1,s5,8
  800356:	01074463          	blt	a4,a6,80035e <vprintfmt+0x218>
  80035a:	0e080863          	beqz	a6,80044a <vprintfmt+0x304>
  80035e:	000ab603          	ld	a2,0(s5)
  800362:	46a1                	li	a3,8
  800364:	8aae                	mv	s5,a1
  800366:	a839                	j	800384 <vprintfmt+0x23e>
  800368:	03000513          	li	a0,48
  80036c:	85a6                	mv	a1,s1
  80036e:	e03e                	sd	a5,0(sp)
  800370:	9902                	jalr	s2
  800372:	85a6                	mv	a1,s1
  800374:	07800513          	li	a0,120
  800378:	9902                	jalr	s2
  80037a:	0aa1                	addi	s5,s5,8
  80037c:	ff8ab603          	ld	a2,-8(s5)
  800380:	6782                	ld	a5,0(sp)
  800382:	46c1                	li	a3,16
  800384:	2781                	sext.w	a5,a5
  800386:	876e                	mv	a4,s11
  800388:	85a6                	mv	a1,s1
  80038a:	854a                	mv	a0,s2
  80038c:	d4fff0ef          	jal	ra,8000da <printnum>
  800390:	bbc5                	j	800180 <vprintfmt+0x3a>
  800392:	00144603          	lbu	a2,1(s0)
  800396:	2805                	addiw	a6,a6,1
  800398:	846a                	mv	s0,s10
  80039a:	b515                	j	8001be <vprintfmt+0x78>
  80039c:	00144603          	lbu	a2,1(s0)
  8003a0:	4985                	li	s3,1
  8003a2:	846a                	mv	s0,s10
  8003a4:	bd29                	j	8001be <vprintfmt+0x78>
  8003a6:	85a6                	mv	a1,s1
  8003a8:	02500513          	li	a0,37
  8003ac:	9902                	jalr	s2
  8003ae:	bbc9                	j	800180 <vprintfmt+0x3a>
  8003b0:	4705                	li	a4,1
  8003b2:	008a8593          	addi	a1,s5,8
  8003b6:	01074463          	blt	a4,a6,8003be <vprintfmt+0x278>
  8003ba:	08080d63          	beqz	a6,800454 <vprintfmt+0x30e>
  8003be:	000ab603          	ld	a2,0(s5)
  8003c2:	46a9                	li	a3,10
  8003c4:	8aae                	mv	s5,a1
  8003c6:	bf7d                	j	800384 <vprintfmt+0x23e>
  8003c8:	85a6                	mv	a1,s1
  8003ca:	02500513          	li	a0,37
  8003ce:	9902                	jalr	s2
  8003d0:	fff44703          	lbu	a4,-1(s0)
  8003d4:	02500793          	li	a5,37
  8003d8:	8d22                	mv	s10,s0
  8003da:	daf703e3          	beq	a4,a5,800180 <vprintfmt+0x3a>
  8003de:	02500713          	li	a4,37
  8003e2:	1d7d                	addi	s10,s10,-1
  8003e4:	fffd4783          	lbu	a5,-1(s10)
  8003e8:	fee79de3          	bne	a5,a4,8003e2 <vprintfmt+0x29c>
  8003ec:	bb51                	j	800180 <vprintfmt+0x3a>
  8003ee:	00000617          	auipc	a2,0x0
  8003f2:	42260613          	addi	a2,a2,1058 # 800810 <error_string+0x1a8>
  8003f6:	85a6                	mv	a1,s1
  8003f8:	854a                	mv	a0,s2
  8003fa:	0ac000ef          	jal	ra,8004a6 <printfmt>
  8003fe:	b349                	j	800180 <vprintfmt+0x3a>
  800400:	00000617          	auipc	a2,0x0
  800404:	40860613          	addi	a2,a2,1032 # 800808 <error_string+0x1a0>
  800408:	00000417          	auipc	s0,0x0
  80040c:	40140413          	addi	s0,s0,1025 # 800809 <error_string+0x1a1>
  800410:	8532                	mv	a0,a2
  800412:	85e6                	mv	a1,s9
  800414:	e032                	sd	a2,0(sp)
  800416:	e43e                	sd	a5,8(sp)
  800418:	0ae000ef          	jal	ra,8004c6 <strnlen>
  80041c:	40ad8dbb          	subw	s11,s11,a0
  800420:	6602                	ld	a2,0(sp)
  800422:	01b05d63          	blez	s11,80043c <vprintfmt+0x2f6>
  800426:	67a2                	ld	a5,8(sp)
  800428:	2781                	sext.w	a5,a5
  80042a:	e43e                	sd	a5,8(sp)
  80042c:	6522                	ld	a0,8(sp)
  80042e:	85a6                	mv	a1,s1
  800430:	e032                	sd	a2,0(sp)
  800432:	3dfd                	addiw	s11,s11,-1
  800434:	9902                	jalr	s2
  800436:	6602                	ld	a2,0(sp)
  800438:	fe0d9ae3          	bnez	s11,80042c <vprintfmt+0x2e6>
  80043c:	00064783          	lbu	a5,0(a2)
  800440:	0007851b          	sext.w	a0,a5
  800444:	ec0510e3          	bnez	a0,800304 <vprintfmt+0x1be>
  800448:	bb25                	j	800180 <vprintfmt+0x3a>
  80044a:	000ae603          	lwu	a2,0(s5)
  80044e:	46a1                	li	a3,8
  800450:	8aae                	mv	s5,a1
  800452:	bf0d                	j	800384 <vprintfmt+0x23e>
  800454:	000ae603          	lwu	a2,0(s5)
  800458:	46a9                	li	a3,10
  80045a:	8aae                	mv	s5,a1
  80045c:	b725                	j	800384 <vprintfmt+0x23e>
  80045e:	000aa403          	lw	s0,0(s5)
  800462:	bd35                	j	80029e <vprintfmt+0x158>
  800464:	000ae603          	lwu	a2,0(s5)
  800468:	46c1                	li	a3,16
  80046a:	8aae                	mv	s5,a1
  80046c:	bf21                	j	800384 <vprintfmt+0x23e>
  80046e:	9902                	jalr	s2
  800470:	bd45                	j	800320 <vprintfmt+0x1da>
  800472:	85a6                	mv	a1,s1
  800474:	02d00513          	li	a0,45
  800478:	e03e                	sd	a5,0(sp)
  80047a:	9902                	jalr	s2
  80047c:	8ace                	mv	s5,s3
  80047e:	40800633          	neg	a2,s0
  800482:	46a9                	li	a3,10
  800484:	6782                	ld	a5,0(sp)
  800486:	bdfd                	j	800384 <vprintfmt+0x23e>
  800488:	01b05663          	blez	s11,800494 <vprintfmt+0x34e>
  80048c:	02d00693          	li	a3,45
  800490:	f6d798e3          	bne	a5,a3,800400 <vprintfmt+0x2ba>
  800494:	00000417          	auipc	s0,0x0
  800498:	37540413          	addi	s0,s0,885 # 800809 <error_string+0x1a1>
  80049c:	02800513          	li	a0,40
  8004a0:	02800793          	li	a5,40
  8004a4:	b585                	j	800304 <vprintfmt+0x1be>

00000000008004a6 <printfmt>:
  8004a6:	715d                	addi	sp,sp,-80
  8004a8:	02810313          	addi	t1,sp,40
  8004ac:	f436                	sd	a3,40(sp)
  8004ae:	869a                	mv	a3,t1
  8004b0:	ec06                	sd	ra,24(sp)
  8004b2:	f83a                	sd	a4,48(sp)
  8004b4:	fc3e                	sd	a5,56(sp)
  8004b6:	e0c2                	sd	a6,64(sp)
  8004b8:	e4c6                	sd	a7,72(sp)
  8004ba:	e41a                	sd	t1,8(sp)
  8004bc:	c8bff0ef          	jal	ra,800146 <vprintfmt>
  8004c0:	60e2                	ld	ra,24(sp)
  8004c2:	6161                	addi	sp,sp,80
  8004c4:	8082                	ret

00000000008004c6 <strnlen>:
  8004c6:	c185                	beqz	a1,8004e6 <strnlen+0x20>
  8004c8:	00054783          	lbu	a5,0(a0)
  8004cc:	cf89                	beqz	a5,8004e6 <strnlen+0x20>
  8004ce:	4781                	li	a5,0
  8004d0:	a021                	j	8004d8 <strnlen+0x12>
  8004d2:	00074703          	lbu	a4,0(a4)
  8004d6:	c711                	beqz	a4,8004e2 <strnlen+0x1c>
  8004d8:	0785                	addi	a5,a5,1
  8004da:	00f50733          	add	a4,a0,a5
  8004de:	fef59ae3          	bne	a1,a5,8004d2 <strnlen+0xc>
  8004e2:	853e                	mv	a0,a5
  8004e4:	8082                	ret
  8004e6:	4781                	li	a5,0
  8004e8:	853e                	mv	a0,a5
  8004ea:	8082                	ret

00000000008004ec <main>:
  8004ec:	00002783          	lw	a5,0(zero) # 0 <_start-0x800020>
  8004f0:	9002                	ebreak
