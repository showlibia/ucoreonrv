
obj/__user_softint.out：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000800020 <syscall>:
  800020:	7175                	addi	sp,sp,-144
  800022:	f8ba                	sd	a4,112(sp)
  800024:	e0ba                	sd	a4,64(sp)
  800026:	0118                	addi	a4,sp,128
  800028:	e42a                	sd	a0,8(sp)
  80002a:	ecae                	sd	a1,88(sp)
  80002c:	f0b2                	sd	a2,96(sp)
  80002e:	f4b6                	sd	a3,104(sp)
  800030:	fcbe                	sd	a5,120(sp)
  800032:	e142                	sd	a6,128(sp)
  800034:	e546                	sd	a7,136(sp)
  800036:	f42e                	sd	a1,40(sp)
  800038:	f832                	sd	a2,48(sp)
  80003a:	fc36                	sd	a3,56(sp)
  80003c:	f03a                	sd	a4,32(sp)
  80003e:	e4be                	sd	a5,72(sp)
  800040:	4522                	lw	a0,8(sp)
  800042:	55a2                	lw	a1,40(sp)
  800044:	5642                	lw	a2,48(sp)
  800046:	56e2                	lw	a3,56(sp)
  800048:	4706                	lw	a4,64(sp)
  80004a:	47a6                	lw	a5,72(sp)
  80004c:	00000073          	ecall
  800050:	ce2a                	sw	a0,28(sp)
  800052:	4572                	lw	a0,28(sp)
  800054:	6149                	addi	sp,sp,144
  800056:	8082                	ret

0000000000800058 <sys_exit>:
  800058:	85aa                	mv	a1,a0
  80005a:	4505                	li	a0,1
  80005c:	b7d1                	j	800020 <syscall>

000000000080005e <sys_putc>:
  80005e:	85aa                	mv	a1,a0
  800060:	4579                	li	a0,30
  800062:	bf7d                	j	800020 <syscall>

0000000000800064 <exit>:
  800064:	1141                	addi	sp,sp,-16
  800066:	e406                	sd	ra,8(sp)
  800068:	ff1ff0ef          	jal	ra,800058 <sys_exit>
  80006c:	00000517          	auipc	a0,0x0
  800070:	48c50513          	addi	a0,a0,1164 # 8004f8 <main+0xc>
  800074:	026000ef          	jal	ra,80009a <cprintf>
  800078:	a001                	j	800078 <exit+0x14>

000000000080007a <_start>:
  80007a:	054000ef          	jal	ra,8000ce <umain>
  80007e:	a001                	j	80007e <_start+0x4>

0000000000800080 <cputch>:
  800080:	1141                	addi	sp,sp,-16
  800082:	e022                	sd	s0,0(sp)
  800084:	e406                	sd	ra,8(sp)
  800086:	842e                	mv	s0,a1
  800088:	fd7ff0ef          	jal	ra,80005e <sys_putc>
  80008c:	401c                	lw	a5,0(s0)
  80008e:	60a2                	ld	ra,8(sp)
  800090:	2785                	addiw	a5,a5,1
  800092:	c01c                	sw	a5,0(s0)
  800094:	6402                	ld	s0,0(sp)
  800096:	0141                	addi	sp,sp,16
  800098:	8082                	ret

000000000080009a <cprintf>:
  80009a:	711d                	addi	sp,sp,-96
  80009c:	02810313          	addi	t1,sp,40
  8000a0:	f42e                	sd	a1,40(sp)
  8000a2:	f832                	sd	a2,48(sp)
  8000a4:	fc36                	sd	a3,56(sp)
  8000a6:	862a                	mv	a2,a0
  8000a8:	004c                	addi	a1,sp,4
  8000aa:	00000517          	auipc	a0,0x0
  8000ae:	fd650513          	addi	a0,a0,-42 # 800080 <cputch>
  8000b2:	869a                	mv	a3,t1
  8000b4:	ec06                	sd	ra,24(sp)
  8000b6:	e0ba                	sd	a4,64(sp)
  8000b8:	e4be                	sd	a5,72(sp)
  8000ba:	e8c2                	sd	a6,80(sp)
  8000bc:	ecc6                	sd	a7,88(sp)
  8000be:	e41a                	sd	t1,8(sp)
  8000c0:	c202                	sw	zero,4(sp)
  8000c2:	0aa000ef          	jal	ra,80016c <vprintfmt>
  8000c6:	60e2                	ld	ra,24(sp)
  8000c8:	4512                	lw	a0,4(sp)
  8000ca:	6125                	addi	sp,sp,96
  8000cc:	8082                	ret

00000000008000ce <umain>:
  8000ce:	1141                	addi	sp,sp,-16
  8000d0:	e406                	sd	ra,8(sp)
  8000d2:	41a000ef          	jal	ra,8004ec <main>
  8000d6:	f8fff0ef          	jal	ra,800064 <exit>

00000000008000da <strnlen>:
  8000da:	c185                	beqz	a1,8000fa <strnlen+0x20>
  8000dc:	00054783          	lbu	a5,0(a0)
  8000e0:	cf89                	beqz	a5,8000fa <strnlen+0x20>
  8000e2:	4781                	li	a5,0
  8000e4:	a021                	j	8000ec <strnlen+0x12>
  8000e6:	00074703          	lbu	a4,0(a4)
  8000ea:	c711                	beqz	a4,8000f6 <strnlen+0x1c>
  8000ec:	0785                	addi	a5,a5,1
  8000ee:	00f50733          	add	a4,a0,a5
  8000f2:	fef59ae3          	bne	a1,a5,8000e6 <strnlen+0xc>
  8000f6:	853e                	mv	a0,a5
  8000f8:	8082                	ret
  8000fa:	4781                	li	a5,0
  8000fc:	853e                	mv	a0,a5
  8000fe:	8082                	ret

0000000000800100 <printnum>:
  800100:	02069813          	slli	a6,a3,0x20
  800104:	7179                	addi	sp,sp,-48
  800106:	02085813          	srli	a6,a6,0x20
  80010a:	e052                	sd	s4,0(sp)
  80010c:	03067a33          	remu	s4,a2,a6
  800110:	f022                	sd	s0,32(sp)
  800112:	ec26                	sd	s1,24(sp)
  800114:	e84a                	sd	s2,16(sp)
  800116:	f406                	sd	ra,40(sp)
  800118:	e44e                	sd	s3,8(sp)
  80011a:	84aa                	mv	s1,a0
  80011c:	892e                	mv	s2,a1
  80011e:	fff7041b          	addiw	s0,a4,-1
  800122:	2a01                	sext.w	s4,s4
  800124:	03067e63          	bgeu	a2,a6,800160 <printnum+0x60>
  800128:	89be                	mv	s3,a5
  80012a:	00805763          	blez	s0,800138 <printnum+0x38>
  80012e:	347d                	addiw	s0,s0,-1
  800130:	85ca                	mv	a1,s2
  800132:	854e                	mv	a0,s3
  800134:	9482                	jalr	s1
  800136:	fc65                	bnez	s0,80012e <printnum+0x2e>
  800138:	1a02                	slli	s4,s4,0x20
  80013a:	020a5a13          	srli	s4,s4,0x20
  80013e:	00000797          	auipc	a5,0x0
  800142:	5f278793          	addi	a5,a5,1522 # 800730 <error_string+0xc8>
  800146:	9a3e                	add	s4,s4,a5
  800148:	7402                	ld	s0,32(sp)
  80014a:	000a4503          	lbu	a0,0(s4)
  80014e:	70a2                	ld	ra,40(sp)
  800150:	69a2                	ld	s3,8(sp)
  800152:	6a02                	ld	s4,0(sp)
  800154:	85ca                	mv	a1,s2
  800156:	8326                	mv	t1,s1
  800158:	6942                	ld	s2,16(sp)
  80015a:	64e2                	ld	s1,24(sp)
  80015c:	6145                	addi	sp,sp,48
  80015e:	8302                	jr	t1
  800160:	03065633          	divu	a2,a2,a6
  800164:	8722                	mv	a4,s0
  800166:	f9bff0ef          	jal	ra,800100 <printnum>
  80016a:	b7f9                	j	800138 <printnum+0x38>

000000000080016c <vprintfmt>:
  80016c:	7119                	addi	sp,sp,-128
  80016e:	f4a6                	sd	s1,104(sp)
  800170:	f0ca                	sd	s2,96(sp)
  800172:	e8d2                	sd	s4,80(sp)
  800174:	e4d6                	sd	s5,72(sp)
  800176:	e0da                	sd	s6,64(sp)
  800178:	fc5e                	sd	s7,56(sp)
  80017a:	f862                	sd	s8,48(sp)
  80017c:	f06a                	sd	s10,32(sp)
  80017e:	fc86                	sd	ra,120(sp)
  800180:	f8a2                	sd	s0,112(sp)
  800182:	ecce                	sd	s3,88(sp)
  800184:	f466                	sd	s9,40(sp)
  800186:	ec6e                	sd	s11,24(sp)
  800188:	892a                	mv	s2,a0
  80018a:	84ae                	mv	s1,a1
  80018c:	8d32                	mv	s10,a2
  80018e:	8ab6                	mv	s5,a3
  800190:	5b7d                	li	s6,-1
  800192:	00000a17          	auipc	s4,0x0
  800196:	37aa0a13          	addi	s4,s4,890 # 80050c <main+0x20>
  80019a:	05e00b93          	li	s7,94
  80019e:	00000c17          	auipc	s8,0x0
  8001a2:	4cac0c13          	addi	s8,s8,1226 # 800668 <error_string>
  8001a6:	000d4503          	lbu	a0,0(s10)
  8001aa:	02500793          	li	a5,37
  8001ae:	001d0413          	addi	s0,s10,1
  8001b2:	00f50e63          	beq	a0,a5,8001ce <vprintfmt+0x62>
  8001b6:	c521                	beqz	a0,8001fe <vprintfmt+0x92>
  8001b8:	02500993          	li	s3,37
  8001bc:	a011                	j	8001c0 <vprintfmt+0x54>
  8001be:	c121                	beqz	a0,8001fe <vprintfmt+0x92>
  8001c0:	85a6                	mv	a1,s1
  8001c2:	0405                	addi	s0,s0,1
  8001c4:	9902                	jalr	s2
  8001c6:	fff44503          	lbu	a0,-1(s0)
  8001ca:	ff351ae3          	bne	a0,s3,8001be <vprintfmt+0x52>
  8001ce:	00044603          	lbu	a2,0(s0)
  8001d2:	02000793          	li	a5,32
  8001d6:	4981                	li	s3,0
  8001d8:	4801                	li	a6,0
  8001da:	5cfd                	li	s9,-1
  8001dc:	5dfd                	li	s11,-1
  8001de:	05500593          	li	a1,85
  8001e2:	4525                	li	a0,9
  8001e4:	fdd6069b          	addiw	a3,a2,-35
  8001e8:	0ff6f693          	andi	a3,a3,255
  8001ec:	00140d13          	addi	s10,s0,1
  8001f0:	1ed5ef63          	bltu	a1,a3,8003ee <vprintfmt+0x282>
  8001f4:	068a                	slli	a3,a3,0x2
  8001f6:	96d2                	add	a3,a3,s4
  8001f8:	4294                	lw	a3,0(a3)
  8001fa:	96d2                	add	a3,a3,s4
  8001fc:	8682                	jr	a3
  8001fe:	70e6                	ld	ra,120(sp)
  800200:	7446                	ld	s0,112(sp)
  800202:	74a6                	ld	s1,104(sp)
  800204:	7906                	ld	s2,96(sp)
  800206:	69e6                	ld	s3,88(sp)
  800208:	6a46                	ld	s4,80(sp)
  80020a:	6aa6                	ld	s5,72(sp)
  80020c:	6b06                	ld	s6,64(sp)
  80020e:	7be2                	ld	s7,56(sp)
  800210:	7c42                	ld	s8,48(sp)
  800212:	7ca2                	ld	s9,40(sp)
  800214:	7d02                	ld	s10,32(sp)
  800216:	6de2                	ld	s11,24(sp)
  800218:	6109                	addi	sp,sp,128
  80021a:	8082                	ret
  80021c:	87b2                	mv	a5,a2
  80021e:	00144603          	lbu	a2,1(s0)
  800222:	846a                	mv	s0,s10
  800224:	b7c1                	j	8001e4 <vprintfmt+0x78>
  800226:	000aac83          	lw	s9,0(s5)
  80022a:	00144603          	lbu	a2,1(s0)
  80022e:	0aa1                	addi	s5,s5,8
  800230:	846a                	mv	s0,s10
  800232:	fa0dd9e3          	bgez	s11,8001e4 <vprintfmt+0x78>
  800236:	8de6                	mv	s11,s9
  800238:	5cfd                	li	s9,-1
  80023a:	b76d                	j	8001e4 <vprintfmt+0x78>
  80023c:	fffdc693          	not	a3,s11
  800240:	96fd                	srai	a3,a3,0x3f
  800242:	00ddfdb3          	and	s11,s11,a3
  800246:	00144603          	lbu	a2,1(s0)
  80024a:	2d81                	sext.w	s11,s11
  80024c:	846a                	mv	s0,s10
  80024e:	bf59                	j	8001e4 <vprintfmt+0x78>
  800250:	4705                	li	a4,1
  800252:	008a8593          	addi	a1,s5,8
  800256:	01074463          	blt	a4,a6,80025e <vprintfmt+0xf2>
  80025a:	22080863          	beqz	a6,80048a <vprintfmt+0x31e>
  80025e:	000ab603          	ld	a2,0(s5)
  800262:	46c1                	li	a3,16
  800264:	8aae                	mv	s5,a1
  800266:	a291                	j	8003aa <vprintfmt+0x23e>
  800268:	fd060c9b          	addiw	s9,a2,-48
  80026c:	00144603          	lbu	a2,1(s0)
  800270:	846a                	mv	s0,s10
  800272:	fd06069b          	addiw	a3,a2,-48
  800276:	0006089b          	sext.w	a7,a2
  80027a:	fad56ce3          	bltu	a0,a3,800232 <vprintfmt+0xc6>
  80027e:	0405                	addi	s0,s0,1
  800280:	002c969b          	slliw	a3,s9,0x2
  800284:	00044603          	lbu	a2,0(s0)
  800288:	0196873b          	addw	a4,a3,s9
  80028c:	0017171b          	slliw	a4,a4,0x1
  800290:	0117073b          	addw	a4,a4,a7
  800294:	fd06069b          	addiw	a3,a2,-48
  800298:	fd070c9b          	addiw	s9,a4,-48
  80029c:	0006089b          	sext.w	a7,a2
  8002a0:	fcd57fe3          	bgeu	a0,a3,80027e <vprintfmt+0x112>
  8002a4:	b779                	j	800232 <vprintfmt+0xc6>
  8002a6:	000aa503          	lw	a0,0(s5)
  8002aa:	85a6                	mv	a1,s1
  8002ac:	0aa1                	addi	s5,s5,8
  8002ae:	9902                	jalr	s2
  8002b0:	bddd                	j	8001a6 <vprintfmt+0x3a>
  8002b2:	4705                	li	a4,1
  8002b4:	008a8993          	addi	s3,s5,8
  8002b8:	01074463          	blt	a4,a6,8002c0 <vprintfmt+0x154>
  8002bc:	1c080463          	beqz	a6,800484 <vprintfmt+0x318>
  8002c0:	000ab403          	ld	s0,0(s5)
  8002c4:	1c044a63          	bltz	s0,800498 <vprintfmt+0x32c>
  8002c8:	8622                	mv	a2,s0
  8002ca:	8ace                	mv	s5,s3
  8002cc:	46a9                	li	a3,10
  8002ce:	a8f1                	j	8003aa <vprintfmt+0x23e>
  8002d0:	000aa783          	lw	a5,0(s5)
  8002d4:	4761                	li	a4,24
  8002d6:	0aa1                	addi	s5,s5,8
  8002d8:	41f7d69b          	sraiw	a3,a5,0x1f
  8002dc:	8fb5                	xor	a5,a5,a3
  8002de:	40d786bb          	subw	a3,a5,a3
  8002e2:	12d74963          	blt	a4,a3,800414 <vprintfmt+0x2a8>
  8002e6:	00369793          	slli	a5,a3,0x3
  8002ea:	97e2                	add	a5,a5,s8
  8002ec:	639c                	ld	a5,0(a5)
  8002ee:	12078363          	beqz	a5,800414 <vprintfmt+0x2a8>
  8002f2:	86be                	mv	a3,a5
  8002f4:	00000617          	auipc	a2,0x0
  8002f8:	52c60613          	addi	a2,a2,1324 # 800820 <error_string+0x1b8>
  8002fc:	85a6                	mv	a1,s1
  8002fe:	854a                	mv	a0,s2
  800300:	1cc000ef          	jal	ra,8004cc <printfmt>
  800304:	b54d                	j	8001a6 <vprintfmt+0x3a>
  800306:	000ab603          	ld	a2,0(s5)
  80030a:	0aa1                	addi	s5,s5,8
  80030c:	1a060163          	beqz	a2,8004ae <vprintfmt+0x342>
  800310:	00160413          	addi	s0,a2,1
  800314:	15b05763          	blez	s11,800462 <vprintfmt+0x2f6>
  800318:	02d00593          	li	a1,45
  80031c:	10b79d63          	bne	a5,a1,800436 <vprintfmt+0x2ca>
  800320:	00064783          	lbu	a5,0(a2)
  800324:	0007851b          	sext.w	a0,a5
  800328:	c905                	beqz	a0,800358 <vprintfmt+0x1ec>
  80032a:	000cc563          	bltz	s9,800334 <vprintfmt+0x1c8>
  80032e:	3cfd                	addiw	s9,s9,-1
  800330:	036c8263          	beq	s9,s6,800354 <vprintfmt+0x1e8>
  800334:	85a6                	mv	a1,s1
  800336:	14098f63          	beqz	s3,800494 <vprintfmt+0x328>
  80033a:	3781                	addiw	a5,a5,-32
  80033c:	14fbfc63          	bgeu	s7,a5,800494 <vprintfmt+0x328>
  800340:	03f00513          	li	a0,63
  800344:	9902                	jalr	s2
  800346:	0405                	addi	s0,s0,1
  800348:	fff44783          	lbu	a5,-1(s0)
  80034c:	3dfd                	addiw	s11,s11,-1
  80034e:	0007851b          	sext.w	a0,a5
  800352:	fd61                	bnez	a0,80032a <vprintfmt+0x1be>
  800354:	e5b059e3          	blez	s11,8001a6 <vprintfmt+0x3a>
  800358:	3dfd                	addiw	s11,s11,-1
  80035a:	85a6                	mv	a1,s1
  80035c:	02000513          	li	a0,32
  800360:	9902                	jalr	s2
  800362:	e40d82e3          	beqz	s11,8001a6 <vprintfmt+0x3a>
  800366:	3dfd                	addiw	s11,s11,-1
  800368:	85a6                	mv	a1,s1
  80036a:	02000513          	li	a0,32
  80036e:	9902                	jalr	s2
  800370:	fe0d94e3          	bnez	s11,800358 <vprintfmt+0x1ec>
  800374:	bd0d                	j	8001a6 <vprintfmt+0x3a>
  800376:	4705                	li	a4,1
  800378:	008a8593          	addi	a1,s5,8
  80037c:	01074463          	blt	a4,a6,800384 <vprintfmt+0x218>
  800380:	0e080863          	beqz	a6,800470 <vprintfmt+0x304>
  800384:	000ab603          	ld	a2,0(s5)
  800388:	46a1                	li	a3,8
  80038a:	8aae                	mv	s5,a1
  80038c:	a839                	j	8003aa <vprintfmt+0x23e>
  80038e:	03000513          	li	a0,48
  800392:	85a6                	mv	a1,s1
  800394:	e03e                	sd	a5,0(sp)
  800396:	9902                	jalr	s2
  800398:	85a6                	mv	a1,s1
  80039a:	07800513          	li	a0,120
  80039e:	9902                	jalr	s2
  8003a0:	0aa1                	addi	s5,s5,8
  8003a2:	ff8ab603          	ld	a2,-8(s5)
  8003a6:	6782                	ld	a5,0(sp)
  8003a8:	46c1                	li	a3,16
  8003aa:	2781                	sext.w	a5,a5
  8003ac:	876e                	mv	a4,s11
  8003ae:	85a6                	mv	a1,s1
  8003b0:	854a                	mv	a0,s2
  8003b2:	d4fff0ef          	jal	ra,800100 <printnum>
  8003b6:	bbc5                	j	8001a6 <vprintfmt+0x3a>
  8003b8:	00144603          	lbu	a2,1(s0)
  8003bc:	2805                	addiw	a6,a6,1
  8003be:	846a                	mv	s0,s10
  8003c0:	b515                	j	8001e4 <vprintfmt+0x78>
  8003c2:	00144603          	lbu	a2,1(s0)
  8003c6:	4985                	li	s3,1
  8003c8:	846a                	mv	s0,s10
  8003ca:	bd29                	j	8001e4 <vprintfmt+0x78>
  8003cc:	85a6                	mv	a1,s1
  8003ce:	02500513          	li	a0,37
  8003d2:	9902                	jalr	s2
  8003d4:	bbc9                	j	8001a6 <vprintfmt+0x3a>
  8003d6:	4705                	li	a4,1
  8003d8:	008a8593          	addi	a1,s5,8
  8003dc:	01074463          	blt	a4,a6,8003e4 <vprintfmt+0x278>
  8003e0:	08080d63          	beqz	a6,80047a <vprintfmt+0x30e>
  8003e4:	000ab603          	ld	a2,0(s5)
  8003e8:	46a9                	li	a3,10
  8003ea:	8aae                	mv	s5,a1
  8003ec:	bf7d                	j	8003aa <vprintfmt+0x23e>
  8003ee:	85a6                	mv	a1,s1
  8003f0:	02500513          	li	a0,37
  8003f4:	9902                	jalr	s2
  8003f6:	fff44703          	lbu	a4,-1(s0)
  8003fa:	02500793          	li	a5,37
  8003fe:	8d22                	mv	s10,s0
  800400:	daf703e3          	beq	a4,a5,8001a6 <vprintfmt+0x3a>
  800404:	02500713          	li	a4,37
  800408:	1d7d                	addi	s10,s10,-1
  80040a:	fffd4783          	lbu	a5,-1(s10)
  80040e:	fee79de3          	bne	a5,a4,800408 <vprintfmt+0x29c>
  800412:	bb51                	j	8001a6 <vprintfmt+0x3a>
  800414:	00000617          	auipc	a2,0x0
  800418:	3fc60613          	addi	a2,a2,1020 # 800810 <error_string+0x1a8>
  80041c:	85a6                	mv	a1,s1
  80041e:	854a                	mv	a0,s2
  800420:	0ac000ef          	jal	ra,8004cc <printfmt>
  800424:	b349                	j	8001a6 <vprintfmt+0x3a>
  800426:	00000617          	auipc	a2,0x0
  80042a:	3e260613          	addi	a2,a2,994 # 800808 <error_string+0x1a0>
  80042e:	00000417          	auipc	s0,0x0
  800432:	3db40413          	addi	s0,s0,987 # 800809 <error_string+0x1a1>
  800436:	8532                	mv	a0,a2
  800438:	85e6                	mv	a1,s9
  80043a:	e032                	sd	a2,0(sp)
  80043c:	e43e                	sd	a5,8(sp)
  80043e:	c9dff0ef          	jal	ra,8000da <strnlen>
  800442:	40ad8dbb          	subw	s11,s11,a0
  800446:	6602                	ld	a2,0(sp)
  800448:	01b05d63          	blez	s11,800462 <vprintfmt+0x2f6>
  80044c:	67a2                	ld	a5,8(sp)
  80044e:	2781                	sext.w	a5,a5
  800450:	e43e                	sd	a5,8(sp)
  800452:	6522                	ld	a0,8(sp)
  800454:	85a6                	mv	a1,s1
  800456:	e032                	sd	a2,0(sp)
  800458:	3dfd                	addiw	s11,s11,-1
  80045a:	9902                	jalr	s2
  80045c:	6602                	ld	a2,0(sp)
  80045e:	fe0d9ae3          	bnez	s11,800452 <vprintfmt+0x2e6>
  800462:	00064783          	lbu	a5,0(a2)
  800466:	0007851b          	sext.w	a0,a5
  80046a:	ec0510e3          	bnez	a0,80032a <vprintfmt+0x1be>
  80046e:	bb25                	j	8001a6 <vprintfmt+0x3a>
  800470:	000ae603          	lwu	a2,0(s5)
  800474:	46a1                	li	a3,8
  800476:	8aae                	mv	s5,a1
  800478:	bf0d                	j	8003aa <vprintfmt+0x23e>
  80047a:	000ae603          	lwu	a2,0(s5)
  80047e:	46a9                	li	a3,10
  800480:	8aae                	mv	s5,a1
  800482:	b725                	j	8003aa <vprintfmt+0x23e>
  800484:	000aa403          	lw	s0,0(s5)
  800488:	bd35                	j	8002c4 <vprintfmt+0x158>
  80048a:	000ae603          	lwu	a2,0(s5)
  80048e:	46c1                	li	a3,16
  800490:	8aae                	mv	s5,a1
  800492:	bf21                	j	8003aa <vprintfmt+0x23e>
  800494:	9902                	jalr	s2
  800496:	bd45                	j	800346 <vprintfmt+0x1da>
  800498:	85a6                	mv	a1,s1
  80049a:	02d00513          	li	a0,45
  80049e:	e03e                	sd	a5,0(sp)
  8004a0:	9902                	jalr	s2
  8004a2:	8ace                	mv	s5,s3
  8004a4:	40800633          	neg	a2,s0
  8004a8:	46a9                	li	a3,10
  8004aa:	6782                	ld	a5,0(sp)
  8004ac:	bdfd                	j	8003aa <vprintfmt+0x23e>
  8004ae:	01b05663          	blez	s11,8004ba <vprintfmt+0x34e>
  8004b2:	02d00693          	li	a3,45
  8004b6:	f6d798e3          	bne	a5,a3,800426 <vprintfmt+0x2ba>
  8004ba:	00000417          	auipc	s0,0x0
  8004be:	34f40413          	addi	s0,s0,847 # 800809 <error_string+0x1a1>
  8004c2:	02800513          	li	a0,40
  8004c6:	02800793          	li	a5,40
  8004ca:	b585                	j	80032a <vprintfmt+0x1be>

00000000008004cc <printfmt>:
  8004cc:	715d                	addi	sp,sp,-80
  8004ce:	02810313          	addi	t1,sp,40
  8004d2:	f436                	sd	a3,40(sp)
  8004d4:	869a                	mv	a3,t1
  8004d6:	ec06                	sd	ra,24(sp)
  8004d8:	f83a                	sd	a4,48(sp)
  8004da:	fc3e                	sd	a5,56(sp)
  8004dc:	e0c2                	sd	a6,64(sp)
  8004de:	e4c6                	sd	a7,72(sp)
  8004e0:	e41a                	sd	t1,8(sp)
  8004e2:	c8bff0ef          	jal	ra,80016c <vprintfmt>
  8004e6:	60e2                	ld	ra,24(sp)
  8004e8:	6161                	addi	sp,sp,80
  8004ea:	8082                	ret

00000000008004ec <main>:
  8004ec:	1141                	addi	sp,sp,-16
  8004ee:	4501                	li	a0,0
  8004f0:	e406                	sd	ra,8(sp)
  8004f2:	b73ff0ef          	jal	ra,800064 <exit>
