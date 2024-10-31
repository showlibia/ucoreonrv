
obj/__user_testbss.out：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000800020 <__panic>:
  800020:	715d                	addi	sp,sp,-80
  800022:	e822                	sd	s0,16(sp)
  800024:	fc3e                	sd	a5,56(sp)
  800026:	8432                	mv	s0,a2
  800028:	103c                	addi	a5,sp,40
  80002a:	862e                	mv	a2,a1
  80002c:	85aa                	mv	a1,a0
  80002e:	00000517          	auipc	a0,0x0
  800032:	5e250513          	addi	a0,a0,1506 # 800610 <main+0xc4>
  800036:	ec06                	sd	ra,24(sp)
  800038:	f436                	sd	a3,40(sp)
  80003a:	f83a                	sd	a4,48(sp)
  80003c:	e0c2                	sd	a6,64(sp)
  80003e:	e4c6                	sd	a7,72(sp)
  800040:	e43e                	sd	a5,8(sp)
  800042:	0b8000ef          	jal	ra,8000fa <cprintf>
  800046:	65a2                	ld	a1,8(sp)
  800048:	8522                	mv	a0,s0
  80004a:	090000ef          	jal	ra,8000da <vcprintf>
  80004e:	00000517          	auipc	a0,0x0
  800052:	5e250513          	addi	a0,a0,1506 # 800630 <main+0xe4>
  800056:	0a4000ef          	jal	ra,8000fa <cprintf>
  80005a:	5559                	li	a0,-10
  80005c:	048000ef          	jal	ra,8000a4 <exit>

0000000000800060 <syscall>:
  800060:	7175                	addi	sp,sp,-144
  800062:	f8ba                	sd	a4,112(sp)
  800064:	e0ba                	sd	a4,64(sp)
  800066:	0118                	addi	a4,sp,128
  800068:	e42a                	sd	a0,8(sp)
  80006a:	ecae                	sd	a1,88(sp)
  80006c:	f0b2                	sd	a2,96(sp)
  80006e:	f4b6                	sd	a3,104(sp)
  800070:	fcbe                	sd	a5,120(sp)
  800072:	e142                	sd	a6,128(sp)
  800074:	e546                	sd	a7,136(sp)
  800076:	f42e                	sd	a1,40(sp)
  800078:	f832                	sd	a2,48(sp)
  80007a:	fc36                	sd	a3,56(sp)
  80007c:	f03a                	sd	a4,32(sp)
  80007e:	e4be                	sd	a5,72(sp)
  800080:	4522                	lw	a0,8(sp)
  800082:	55a2                	lw	a1,40(sp)
  800084:	5642                	lw	a2,48(sp)
  800086:	56e2                	lw	a3,56(sp)
  800088:	4706                	lw	a4,64(sp)
  80008a:	47a6                	lw	a5,72(sp)
  80008c:	00000073          	ecall
  800090:	ce2a                	sw	a0,28(sp)
  800092:	4572                	lw	a0,28(sp)
  800094:	6149                	addi	sp,sp,144
  800096:	8082                	ret

0000000000800098 <sys_exit>:
  800098:	85aa                	mv	a1,a0
  80009a:	4505                	li	a0,1
  80009c:	b7d1                	j	800060 <syscall>

000000000080009e <sys_putc>:
  80009e:	85aa                	mv	a1,a0
  8000a0:	4579                	li	a0,30
  8000a2:	bf7d                	j	800060 <syscall>

00000000008000a4 <exit>:
  8000a4:	1141                	addi	sp,sp,-16
  8000a6:	e406                	sd	ra,8(sp)
  8000a8:	ff1ff0ef          	jal	ra,800098 <sys_exit>
  8000ac:	00000517          	auipc	a0,0x0
  8000b0:	58c50513          	addi	a0,a0,1420 # 800638 <main+0xec>
  8000b4:	046000ef          	jal	ra,8000fa <cprintf>
  8000b8:	a001                	j	8000b8 <exit+0x14>

00000000008000ba <_start>:
  8000ba:	074000ef          	jal	ra,80012e <umain>
  8000be:	a001                	j	8000be <_start+0x4>

00000000008000c0 <cputch>:
  8000c0:	1141                	addi	sp,sp,-16
  8000c2:	e022                	sd	s0,0(sp)
  8000c4:	e406                	sd	ra,8(sp)
  8000c6:	842e                	mv	s0,a1
  8000c8:	fd7ff0ef          	jal	ra,80009e <sys_putc>
  8000cc:	401c                	lw	a5,0(s0)
  8000ce:	60a2                	ld	ra,8(sp)
  8000d0:	2785                	addiw	a5,a5,1
  8000d2:	c01c                	sw	a5,0(s0)
  8000d4:	6402                	ld	s0,0(sp)
  8000d6:	0141                	addi	sp,sp,16
  8000d8:	8082                	ret

00000000008000da <vcprintf>:
  8000da:	1101                	addi	sp,sp,-32
  8000dc:	86ae                	mv	a3,a1
  8000de:	862a                	mv	a2,a0
  8000e0:	006c                	addi	a1,sp,12
  8000e2:	00000517          	auipc	a0,0x0
  8000e6:	fde50513          	addi	a0,a0,-34 # 8000c0 <cputch>
  8000ea:	ec06                	sd	ra,24(sp)
  8000ec:	c602                	sw	zero,12(sp)
  8000ee:	0de000ef          	jal	ra,8001cc <vprintfmt>
  8000f2:	60e2                	ld	ra,24(sp)
  8000f4:	4532                	lw	a0,12(sp)
  8000f6:	6105                	addi	sp,sp,32
  8000f8:	8082                	ret

00000000008000fa <cprintf>:
  8000fa:	711d                	addi	sp,sp,-96
  8000fc:	02810313          	addi	t1,sp,40
  800100:	f42e                	sd	a1,40(sp)
  800102:	f832                	sd	a2,48(sp)
  800104:	fc36                	sd	a3,56(sp)
  800106:	862a                	mv	a2,a0
  800108:	004c                	addi	a1,sp,4
  80010a:	00000517          	auipc	a0,0x0
  80010e:	fb650513          	addi	a0,a0,-74 # 8000c0 <cputch>
  800112:	869a                	mv	a3,t1
  800114:	ec06                	sd	ra,24(sp)
  800116:	e0ba                	sd	a4,64(sp)
  800118:	e4be                	sd	a5,72(sp)
  80011a:	e8c2                	sd	a6,80(sp)
  80011c:	ecc6                	sd	a7,88(sp)
  80011e:	e41a                	sd	t1,8(sp)
  800120:	c202                	sw	zero,4(sp)
  800122:	0aa000ef          	jal	ra,8001cc <vprintfmt>
  800126:	60e2                	ld	ra,24(sp)
  800128:	4512                	lw	a0,4(sp)
  80012a:	6125                	addi	sp,sp,96
  80012c:	8082                	ret

000000000080012e <umain>:
  80012e:	1141                	addi	sp,sp,-16
  800130:	e406                	sd	ra,8(sp)
  800132:	41a000ef          	jal	ra,80054c <main>
  800136:	f6fff0ef          	jal	ra,8000a4 <exit>

000000000080013a <strnlen>:
  80013a:	c185                	beqz	a1,80015a <strnlen+0x20>
  80013c:	00054783          	lbu	a5,0(a0)
  800140:	cf89                	beqz	a5,80015a <strnlen+0x20>
  800142:	4781                	li	a5,0
  800144:	a021                	j	80014c <strnlen+0x12>
  800146:	00074703          	lbu	a4,0(a4)
  80014a:	c711                	beqz	a4,800156 <strnlen+0x1c>
  80014c:	0785                	addi	a5,a5,1
  80014e:	00f50733          	add	a4,a0,a5
  800152:	fef59ae3          	bne	a1,a5,800146 <strnlen+0xc>
  800156:	853e                	mv	a0,a5
  800158:	8082                	ret
  80015a:	4781                	li	a5,0
  80015c:	853e                	mv	a0,a5
  80015e:	8082                	ret

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
  800178:	e44e                	sd	s3,8(sp)
  80017a:	84aa                	mv	s1,a0
  80017c:	892e                	mv	s2,a1
  80017e:	fff7041b          	addiw	s0,a4,-1
  800182:	2a01                	sext.w	s4,s4
  800184:	03067e63          	bgeu	a2,a6,8001c0 <printnum+0x60>
  800188:	89be                	mv	s3,a5
  80018a:	00805763          	blez	s0,800198 <printnum+0x38>
  80018e:	347d                	addiw	s0,s0,-1
  800190:	85ca                	mv	a1,s2
  800192:	854e                	mv	a0,s3
  800194:	9482                	jalr	s1
  800196:	fc65                	bnez	s0,80018e <printnum+0x2e>
  800198:	1a02                	slli	s4,s4,0x20
  80019a:	020a5a13          	srli	s4,s4,0x20
  80019e:	00000797          	auipc	a5,0x0
  8001a2:	6d278793          	addi	a5,a5,1746 # 800870 <error_string+0xc8>
  8001a6:	9a3e                	add	s4,s4,a5
  8001a8:	7402                	ld	s0,32(sp)
  8001aa:	000a4503          	lbu	a0,0(s4)
  8001ae:	70a2                	ld	ra,40(sp)
  8001b0:	69a2                	ld	s3,8(sp)
  8001b2:	6a02                	ld	s4,0(sp)
  8001b4:	85ca                	mv	a1,s2
  8001b6:	8326                	mv	t1,s1
  8001b8:	6942                	ld	s2,16(sp)
  8001ba:	64e2                	ld	s1,24(sp)
  8001bc:	6145                	addi	sp,sp,48
  8001be:	8302                	jr	t1
  8001c0:	03065633          	divu	a2,a2,a6
  8001c4:	8722                	mv	a4,s0
  8001c6:	f9bff0ef          	jal	ra,800160 <printnum>
  8001ca:	b7f9                	j	800198 <printnum+0x38>

00000000008001cc <vprintfmt>:
  8001cc:	7119                	addi	sp,sp,-128
  8001ce:	f4a6                	sd	s1,104(sp)
  8001d0:	f0ca                	sd	s2,96(sp)
  8001d2:	e8d2                	sd	s4,80(sp)
  8001d4:	e4d6                	sd	s5,72(sp)
  8001d6:	e0da                	sd	s6,64(sp)
  8001d8:	fc5e                	sd	s7,56(sp)
  8001da:	f862                	sd	s8,48(sp)
  8001dc:	f06a                	sd	s10,32(sp)
  8001de:	fc86                	sd	ra,120(sp)
  8001e0:	f8a2                	sd	s0,112(sp)
  8001e2:	ecce                	sd	s3,88(sp)
  8001e4:	f466                	sd	s9,40(sp)
  8001e6:	ec6e                	sd	s11,24(sp)
  8001e8:	892a                	mv	s2,a0
  8001ea:	84ae                	mv	s1,a1
  8001ec:	8d32                	mv	s10,a2
  8001ee:	8ab6                	mv	s5,a3
  8001f0:	5b7d                	li	s6,-1
  8001f2:	00000a17          	auipc	s4,0x0
  8001f6:	45aa0a13          	addi	s4,s4,1114 # 80064c <main+0x100>
  8001fa:	05e00b93          	li	s7,94
  8001fe:	00000c17          	auipc	s8,0x0
  800202:	5aac0c13          	addi	s8,s8,1450 # 8007a8 <error_string>
  800206:	000d4503          	lbu	a0,0(s10)
  80020a:	02500793          	li	a5,37
  80020e:	001d0413          	addi	s0,s10,1
  800212:	00f50e63          	beq	a0,a5,80022e <vprintfmt+0x62>
  800216:	c521                	beqz	a0,80025e <vprintfmt+0x92>
  800218:	02500993          	li	s3,37
  80021c:	a011                	j	800220 <vprintfmt+0x54>
  80021e:	c121                	beqz	a0,80025e <vprintfmt+0x92>
  800220:	85a6                	mv	a1,s1
  800222:	0405                	addi	s0,s0,1
  800224:	9902                	jalr	s2
  800226:	fff44503          	lbu	a0,-1(s0)
  80022a:	ff351ae3          	bne	a0,s3,80021e <vprintfmt+0x52>
  80022e:	00044603          	lbu	a2,0(s0)
  800232:	02000793          	li	a5,32
  800236:	4981                	li	s3,0
  800238:	4801                	li	a6,0
  80023a:	5cfd                	li	s9,-1
  80023c:	5dfd                	li	s11,-1
  80023e:	05500593          	li	a1,85
  800242:	4525                	li	a0,9
  800244:	fdd6069b          	addiw	a3,a2,-35
  800248:	0ff6f693          	andi	a3,a3,255
  80024c:	00140d13          	addi	s10,s0,1
  800250:	1ed5ef63          	bltu	a1,a3,80044e <vprintfmt+0x282>
  800254:	068a                	slli	a3,a3,0x2
  800256:	96d2                	add	a3,a3,s4
  800258:	4294                	lw	a3,0(a3)
  80025a:	96d2                	add	a3,a3,s4
  80025c:	8682                	jr	a3
  80025e:	70e6                	ld	ra,120(sp)
  800260:	7446                	ld	s0,112(sp)
  800262:	74a6                	ld	s1,104(sp)
  800264:	7906                	ld	s2,96(sp)
  800266:	69e6                	ld	s3,88(sp)
  800268:	6a46                	ld	s4,80(sp)
  80026a:	6aa6                	ld	s5,72(sp)
  80026c:	6b06                	ld	s6,64(sp)
  80026e:	7be2                	ld	s7,56(sp)
  800270:	7c42                	ld	s8,48(sp)
  800272:	7ca2                	ld	s9,40(sp)
  800274:	7d02                	ld	s10,32(sp)
  800276:	6de2                	ld	s11,24(sp)
  800278:	6109                	addi	sp,sp,128
  80027a:	8082                	ret
  80027c:	87b2                	mv	a5,a2
  80027e:	00144603          	lbu	a2,1(s0)
  800282:	846a                	mv	s0,s10
  800284:	b7c1                	j	800244 <vprintfmt+0x78>
  800286:	000aac83          	lw	s9,0(s5)
  80028a:	00144603          	lbu	a2,1(s0)
  80028e:	0aa1                	addi	s5,s5,8
  800290:	846a                	mv	s0,s10
  800292:	fa0dd9e3          	bgez	s11,800244 <vprintfmt+0x78>
  800296:	8de6                	mv	s11,s9
  800298:	5cfd                	li	s9,-1
  80029a:	b76d                	j	800244 <vprintfmt+0x78>
  80029c:	fffdc693          	not	a3,s11
  8002a0:	96fd                	srai	a3,a3,0x3f
  8002a2:	00ddfdb3          	and	s11,s11,a3
  8002a6:	00144603          	lbu	a2,1(s0)
  8002aa:	2d81                	sext.w	s11,s11
  8002ac:	846a                	mv	s0,s10
  8002ae:	bf59                	j	800244 <vprintfmt+0x78>
  8002b0:	4705                	li	a4,1
  8002b2:	008a8593          	addi	a1,s5,8
  8002b6:	01074463          	blt	a4,a6,8002be <vprintfmt+0xf2>
  8002ba:	22080863          	beqz	a6,8004ea <vprintfmt+0x31e>
  8002be:	000ab603          	ld	a2,0(s5)
  8002c2:	46c1                	li	a3,16
  8002c4:	8aae                	mv	s5,a1
  8002c6:	a291                	j	80040a <vprintfmt+0x23e>
  8002c8:	fd060c9b          	addiw	s9,a2,-48
  8002cc:	00144603          	lbu	a2,1(s0)
  8002d0:	846a                	mv	s0,s10
  8002d2:	fd06069b          	addiw	a3,a2,-48
  8002d6:	0006089b          	sext.w	a7,a2
  8002da:	fad56ce3          	bltu	a0,a3,800292 <vprintfmt+0xc6>
  8002de:	0405                	addi	s0,s0,1
  8002e0:	002c969b          	slliw	a3,s9,0x2
  8002e4:	00044603          	lbu	a2,0(s0)
  8002e8:	0196873b          	addw	a4,a3,s9
  8002ec:	0017171b          	slliw	a4,a4,0x1
  8002f0:	0117073b          	addw	a4,a4,a7
  8002f4:	fd06069b          	addiw	a3,a2,-48
  8002f8:	fd070c9b          	addiw	s9,a4,-48
  8002fc:	0006089b          	sext.w	a7,a2
  800300:	fcd57fe3          	bgeu	a0,a3,8002de <vprintfmt+0x112>
  800304:	b779                	j	800292 <vprintfmt+0xc6>
  800306:	000aa503          	lw	a0,0(s5)
  80030a:	85a6                	mv	a1,s1
  80030c:	0aa1                	addi	s5,s5,8
  80030e:	9902                	jalr	s2
  800310:	bddd                	j	800206 <vprintfmt+0x3a>
  800312:	4705                	li	a4,1
  800314:	008a8993          	addi	s3,s5,8
  800318:	01074463          	blt	a4,a6,800320 <vprintfmt+0x154>
  80031c:	1c080463          	beqz	a6,8004e4 <vprintfmt+0x318>
  800320:	000ab403          	ld	s0,0(s5)
  800324:	1c044a63          	bltz	s0,8004f8 <vprintfmt+0x32c>
  800328:	8622                	mv	a2,s0
  80032a:	8ace                	mv	s5,s3
  80032c:	46a9                	li	a3,10
  80032e:	a8f1                	j	80040a <vprintfmt+0x23e>
  800330:	000aa783          	lw	a5,0(s5)
  800334:	4761                	li	a4,24
  800336:	0aa1                	addi	s5,s5,8
  800338:	41f7d69b          	sraiw	a3,a5,0x1f
  80033c:	8fb5                	xor	a5,a5,a3
  80033e:	40d786bb          	subw	a3,a5,a3
  800342:	12d74963          	blt	a4,a3,800474 <vprintfmt+0x2a8>
  800346:	00369793          	slli	a5,a3,0x3
  80034a:	97e2                	add	a5,a5,s8
  80034c:	639c                	ld	a5,0(a5)
  80034e:	12078363          	beqz	a5,800474 <vprintfmt+0x2a8>
  800352:	86be                	mv	a3,a5
  800354:	00000617          	auipc	a2,0x0
  800358:	60c60613          	addi	a2,a2,1548 # 800960 <error_string+0x1b8>
  80035c:	85a6                	mv	a1,s1
  80035e:	854a                	mv	a0,s2
  800360:	1cc000ef          	jal	ra,80052c <printfmt>
  800364:	b54d                	j	800206 <vprintfmt+0x3a>
  800366:	000ab603          	ld	a2,0(s5)
  80036a:	0aa1                	addi	s5,s5,8
  80036c:	1a060163          	beqz	a2,80050e <vprintfmt+0x342>
  800370:	00160413          	addi	s0,a2,1
  800374:	15b05763          	blez	s11,8004c2 <vprintfmt+0x2f6>
  800378:	02d00593          	li	a1,45
  80037c:	10b79d63          	bne	a5,a1,800496 <vprintfmt+0x2ca>
  800380:	00064783          	lbu	a5,0(a2)
  800384:	0007851b          	sext.w	a0,a5
  800388:	c905                	beqz	a0,8003b8 <vprintfmt+0x1ec>
  80038a:	000cc563          	bltz	s9,800394 <vprintfmt+0x1c8>
  80038e:	3cfd                	addiw	s9,s9,-1
  800390:	036c8263          	beq	s9,s6,8003b4 <vprintfmt+0x1e8>
  800394:	85a6                	mv	a1,s1
  800396:	14098f63          	beqz	s3,8004f4 <vprintfmt+0x328>
  80039a:	3781                	addiw	a5,a5,-32
  80039c:	14fbfc63          	bgeu	s7,a5,8004f4 <vprintfmt+0x328>
  8003a0:	03f00513          	li	a0,63
  8003a4:	9902                	jalr	s2
  8003a6:	0405                	addi	s0,s0,1
  8003a8:	fff44783          	lbu	a5,-1(s0)
  8003ac:	3dfd                	addiw	s11,s11,-1
  8003ae:	0007851b          	sext.w	a0,a5
  8003b2:	fd61                	bnez	a0,80038a <vprintfmt+0x1be>
  8003b4:	e5b059e3          	blez	s11,800206 <vprintfmt+0x3a>
  8003b8:	3dfd                	addiw	s11,s11,-1
  8003ba:	85a6                	mv	a1,s1
  8003bc:	02000513          	li	a0,32
  8003c0:	9902                	jalr	s2
  8003c2:	e40d82e3          	beqz	s11,800206 <vprintfmt+0x3a>
  8003c6:	3dfd                	addiw	s11,s11,-1
  8003c8:	85a6                	mv	a1,s1
  8003ca:	02000513          	li	a0,32
  8003ce:	9902                	jalr	s2
  8003d0:	fe0d94e3          	bnez	s11,8003b8 <vprintfmt+0x1ec>
  8003d4:	bd0d                	j	800206 <vprintfmt+0x3a>
  8003d6:	4705                	li	a4,1
  8003d8:	008a8593          	addi	a1,s5,8
  8003dc:	01074463          	blt	a4,a6,8003e4 <vprintfmt+0x218>
  8003e0:	0e080863          	beqz	a6,8004d0 <vprintfmt+0x304>
  8003e4:	000ab603          	ld	a2,0(s5)
  8003e8:	46a1                	li	a3,8
  8003ea:	8aae                	mv	s5,a1
  8003ec:	a839                	j	80040a <vprintfmt+0x23e>
  8003ee:	03000513          	li	a0,48
  8003f2:	85a6                	mv	a1,s1
  8003f4:	e03e                	sd	a5,0(sp)
  8003f6:	9902                	jalr	s2
  8003f8:	85a6                	mv	a1,s1
  8003fa:	07800513          	li	a0,120
  8003fe:	9902                	jalr	s2
  800400:	0aa1                	addi	s5,s5,8
  800402:	ff8ab603          	ld	a2,-8(s5)
  800406:	6782                	ld	a5,0(sp)
  800408:	46c1                	li	a3,16
  80040a:	2781                	sext.w	a5,a5
  80040c:	876e                	mv	a4,s11
  80040e:	85a6                	mv	a1,s1
  800410:	854a                	mv	a0,s2
  800412:	d4fff0ef          	jal	ra,800160 <printnum>
  800416:	bbc5                	j	800206 <vprintfmt+0x3a>
  800418:	00144603          	lbu	a2,1(s0)
  80041c:	2805                	addiw	a6,a6,1
  80041e:	846a                	mv	s0,s10
  800420:	b515                	j	800244 <vprintfmt+0x78>
  800422:	00144603          	lbu	a2,1(s0)
  800426:	4985                	li	s3,1
  800428:	846a                	mv	s0,s10
  80042a:	bd29                	j	800244 <vprintfmt+0x78>
  80042c:	85a6                	mv	a1,s1
  80042e:	02500513          	li	a0,37
  800432:	9902                	jalr	s2
  800434:	bbc9                	j	800206 <vprintfmt+0x3a>
  800436:	4705                	li	a4,1
  800438:	008a8593          	addi	a1,s5,8
  80043c:	01074463          	blt	a4,a6,800444 <vprintfmt+0x278>
  800440:	08080d63          	beqz	a6,8004da <vprintfmt+0x30e>
  800444:	000ab603          	ld	a2,0(s5)
  800448:	46a9                	li	a3,10
  80044a:	8aae                	mv	s5,a1
  80044c:	bf7d                	j	80040a <vprintfmt+0x23e>
  80044e:	85a6                	mv	a1,s1
  800450:	02500513          	li	a0,37
  800454:	9902                	jalr	s2
  800456:	fff44703          	lbu	a4,-1(s0)
  80045a:	02500793          	li	a5,37
  80045e:	8d22                	mv	s10,s0
  800460:	daf703e3          	beq	a4,a5,800206 <vprintfmt+0x3a>
  800464:	02500713          	li	a4,37
  800468:	1d7d                	addi	s10,s10,-1
  80046a:	fffd4783          	lbu	a5,-1(s10)
  80046e:	fee79de3          	bne	a5,a4,800468 <vprintfmt+0x29c>
  800472:	bb51                	j	800206 <vprintfmt+0x3a>
  800474:	00000617          	auipc	a2,0x0
  800478:	4dc60613          	addi	a2,a2,1244 # 800950 <error_string+0x1a8>
  80047c:	85a6                	mv	a1,s1
  80047e:	854a                	mv	a0,s2
  800480:	0ac000ef          	jal	ra,80052c <printfmt>
  800484:	b349                	j	800206 <vprintfmt+0x3a>
  800486:	00000617          	auipc	a2,0x0
  80048a:	4c260613          	addi	a2,a2,1218 # 800948 <error_string+0x1a0>
  80048e:	00000417          	auipc	s0,0x0
  800492:	4bb40413          	addi	s0,s0,1211 # 800949 <error_string+0x1a1>
  800496:	8532                	mv	a0,a2
  800498:	85e6                	mv	a1,s9
  80049a:	e032                	sd	a2,0(sp)
  80049c:	e43e                	sd	a5,8(sp)
  80049e:	c9dff0ef          	jal	ra,80013a <strnlen>
  8004a2:	40ad8dbb          	subw	s11,s11,a0
  8004a6:	6602                	ld	a2,0(sp)
  8004a8:	01b05d63          	blez	s11,8004c2 <vprintfmt+0x2f6>
  8004ac:	67a2                	ld	a5,8(sp)
  8004ae:	2781                	sext.w	a5,a5
  8004b0:	e43e                	sd	a5,8(sp)
  8004b2:	6522                	ld	a0,8(sp)
  8004b4:	85a6                	mv	a1,s1
  8004b6:	e032                	sd	a2,0(sp)
  8004b8:	3dfd                	addiw	s11,s11,-1
  8004ba:	9902                	jalr	s2
  8004bc:	6602                	ld	a2,0(sp)
  8004be:	fe0d9ae3          	bnez	s11,8004b2 <vprintfmt+0x2e6>
  8004c2:	00064783          	lbu	a5,0(a2)
  8004c6:	0007851b          	sext.w	a0,a5
  8004ca:	ec0510e3          	bnez	a0,80038a <vprintfmt+0x1be>
  8004ce:	bb25                	j	800206 <vprintfmt+0x3a>
  8004d0:	000ae603          	lwu	a2,0(s5)
  8004d4:	46a1                	li	a3,8
  8004d6:	8aae                	mv	s5,a1
  8004d8:	bf0d                	j	80040a <vprintfmt+0x23e>
  8004da:	000ae603          	lwu	a2,0(s5)
  8004de:	46a9                	li	a3,10
  8004e0:	8aae                	mv	s5,a1
  8004e2:	b725                	j	80040a <vprintfmt+0x23e>
  8004e4:	000aa403          	lw	s0,0(s5)
  8004e8:	bd35                	j	800324 <vprintfmt+0x158>
  8004ea:	000ae603          	lwu	a2,0(s5)
  8004ee:	46c1                	li	a3,16
  8004f0:	8aae                	mv	s5,a1
  8004f2:	bf21                	j	80040a <vprintfmt+0x23e>
  8004f4:	9902                	jalr	s2
  8004f6:	bd45                	j	8003a6 <vprintfmt+0x1da>
  8004f8:	85a6                	mv	a1,s1
  8004fa:	02d00513          	li	a0,45
  8004fe:	e03e                	sd	a5,0(sp)
  800500:	9902                	jalr	s2
  800502:	8ace                	mv	s5,s3
  800504:	40800633          	neg	a2,s0
  800508:	46a9                	li	a3,10
  80050a:	6782                	ld	a5,0(sp)
  80050c:	bdfd                	j	80040a <vprintfmt+0x23e>
  80050e:	01b05663          	blez	s11,80051a <vprintfmt+0x34e>
  800512:	02d00693          	li	a3,45
  800516:	f6d798e3          	bne	a5,a3,800486 <vprintfmt+0x2ba>
  80051a:	00000417          	auipc	s0,0x0
  80051e:	42f40413          	addi	s0,s0,1071 # 800949 <error_string+0x1a1>
  800522:	02800513          	li	a0,40
  800526:	02800793          	li	a5,40
  80052a:	b585                	j	80038a <vprintfmt+0x1be>

000000000080052c <printfmt>:
  80052c:	715d                	addi	sp,sp,-80
  80052e:	02810313          	addi	t1,sp,40
  800532:	f436                	sd	a3,40(sp)
  800534:	869a                	mv	a3,t1
  800536:	ec06                	sd	ra,24(sp)
  800538:	f83a                	sd	a4,48(sp)
  80053a:	fc3e                	sd	a5,56(sp)
  80053c:	e0c2                	sd	a6,64(sp)
  80053e:	e4c6                	sd	a7,72(sp)
  800540:	e41a                	sd	t1,8(sp)
  800542:	c8bff0ef          	jal	ra,8001cc <vprintfmt>
  800546:	60e2                	ld	ra,24(sp)
  800548:	6161                	addi	sp,sp,80
  80054a:	8082                	ret

000000000080054c <main>:
  80054c:	1141                	addi	sp,sp,-16
  80054e:	00000517          	auipc	a0,0x0
  800552:	41a50513          	addi	a0,a0,1050 # 800968 <error_string+0x1c0>
  800556:	e406                	sd	ra,8(sp)
  800558:	ba3ff0ef          	jal	ra,8000fa <cprintf>
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
  80058c:	a95ff0ef          	jal	ra,800020 <__panic>
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
  8005d0:	a51ff0ef          	jal	ra,800020 <__panic>
  8005d4:	00000517          	auipc	a0,0x0
  8005d8:	40c50513          	addi	a0,a0,1036 # 8009e0 <error_string+0x238>
  8005dc:	b1fff0ef          	jal	ra,8000fa <cprintf>
  8005e0:	00000517          	auipc	a0,0x0
  8005e4:	43850513          	addi	a0,a0,1080 # 800a18 <error_string+0x270>
  8005e8:	b13ff0ef          	jal	ra,8000fa <cprintf>
  8005ec:	00000617          	auipc	a2,0x0
  8005f0:	44460613          	addi	a2,a2,1092 # 800a30 <error_string+0x288>
  8005f4:	45fd                	li	a1,31
  8005f6:	00000517          	auipc	a0,0x0
  8005fa:	3b250513          	addi	a0,a0,946 # 8009a8 <error_string+0x200>
  8005fe:	00402797          	auipc	a5,0x402
  800602:	a007a123          	sw	zero,-1534(a5) # c02000 <bigarray+0x401000>
  800606:	a1bff0ef          	jal	ra,800020 <__panic>
