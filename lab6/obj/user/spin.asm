
obj/__user_spin.out：     文件格式 elf64-littleriscv


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
  800032:	60a50513          	addi	a0,a0,1546 # 800638 <main+0xce>
  800036:	ec06                	sd	ra,24(sp)
  800038:	f436                	sd	a3,40(sp)
  80003a:	f83a                	sd	a4,48(sp)
  80003c:	e0c2                	sd	a6,64(sp)
  80003e:	e4c6                	sd	a7,72(sp)
  800040:	e43e                	sd	a5,8(sp)
  800042:	0d6000ef          	jal	ra,800118 <cprintf>
  800046:	65a2                	ld	a1,8(sp)
  800048:	8522                	mv	a0,s0
  80004a:	0ae000ef          	jal	ra,8000f8 <vcprintf>
  80004e:	00000517          	auipc	a0,0x0
  800052:	60a50513          	addi	a0,a0,1546 # 800658 <main+0xee>
  800056:	0c2000ef          	jal	ra,800118 <cprintf>
  80005a:	5559                	li	a0,-10
  80005c:	05e000ef          	jal	ra,8000ba <exit>

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

000000000080009e <sys_fork>:
  80009e:	4509                	li	a0,2
  8000a0:	b7c1                	j	800060 <syscall>

00000000008000a2 <sys_wait>:
  8000a2:	862e                	mv	a2,a1
  8000a4:	85aa                	mv	a1,a0
  8000a6:	450d                	li	a0,3
  8000a8:	bf65                	j	800060 <syscall>

00000000008000aa <sys_yield>:
  8000aa:	4529                	li	a0,10
  8000ac:	bf55                	j	800060 <syscall>

00000000008000ae <sys_kill>:
  8000ae:	85aa                	mv	a1,a0
  8000b0:	4531                	li	a0,12
  8000b2:	b77d                	j	800060 <syscall>

00000000008000b4 <sys_putc>:
  8000b4:	85aa                	mv	a1,a0
  8000b6:	4579                	li	a0,30
  8000b8:	b765                	j	800060 <syscall>

00000000008000ba <exit>:
  8000ba:	1141                	addi	sp,sp,-16
  8000bc:	e406                	sd	ra,8(sp)
  8000be:	fdbff0ef          	jal	ra,800098 <sys_exit>
  8000c2:	00000517          	auipc	a0,0x0
  8000c6:	59e50513          	addi	a0,a0,1438 # 800660 <main+0xf6>
  8000ca:	04e000ef          	jal	ra,800118 <cprintf>
  8000ce:	a001                	j	8000ce <exit+0x14>

00000000008000d0 <fork>:
  8000d0:	b7f9                	j	80009e <sys_fork>

00000000008000d2 <waitpid>:
  8000d2:	bfc1                	j	8000a2 <sys_wait>

00000000008000d4 <yield>:
  8000d4:	bfd9                	j	8000aa <sys_yield>

00000000008000d6 <kill>:
  8000d6:	bfe1                	j	8000ae <sys_kill>

00000000008000d8 <_start>:
  8000d8:	074000ef          	jal	ra,80014c <umain>
  8000dc:	a001                	j	8000dc <_start+0x4>

00000000008000de <cputch>:
  8000de:	1141                	addi	sp,sp,-16
  8000e0:	e022                	sd	s0,0(sp)
  8000e2:	e406                	sd	ra,8(sp)
  8000e4:	842e                	mv	s0,a1
  8000e6:	fcfff0ef          	jal	ra,8000b4 <sys_putc>
  8000ea:	401c                	lw	a5,0(s0)
  8000ec:	60a2                	ld	ra,8(sp)
  8000ee:	2785                	addiw	a5,a5,1
  8000f0:	c01c                	sw	a5,0(s0)
  8000f2:	6402                	ld	s0,0(sp)
  8000f4:	0141                	addi	sp,sp,16
  8000f6:	8082                	ret

00000000008000f8 <vcprintf>:
  8000f8:	1101                	addi	sp,sp,-32
  8000fa:	86ae                	mv	a3,a1
  8000fc:	862a                	mv	a2,a0
  8000fe:	006c                	addi	a1,sp,12
  800100:	00000517          	auipc	a0,0x0
  800104:	fde50513          	addi	a0,a0,-34 # 8000de <cputch>
  800108:	ec06                	sd	ra,24(sp)
  80010a:	c602                	sw	zero,12(sp)
  80010c:	0de000ef          	jal	ra,8001ea <vprintfmt>
  800110:	60e2                	ld	ra,24(sp)
  800112:	4532                	lw	a0,12(sp)
  800114:	6105                	addi	sp,sp,32
  800116:	8082                	ret

0000000000800118 <cprintf>:
  800118:	711d                	addi	sp,sp,-96
  80011a:	02810313          	addi	t1,sp,40
  80011e:	f42e                	sd	a1,40(sp)
  800120:	f832                	sd	a2,48(sp)
  800122:	fc36                	sd	a3,56(sp)
  800124:	862a                	mv	a2,a0
  800126:	004c                	addi	a1,sp,4
  800128:	00000517          	auipc	a0,0x0
  80012c:	fb650513          	addi	a0,a0,-74 # 8000de <cputch>
  800130:	869a                	mv	a3,t1
  800132:	ec06                	sd	ra,24(sp)
  800134:	e0ba                	sd	a4,64(sp)
  800136:	e4be                	sd	a5,72(sp)
  800138:	e8c2                	sd	a6,80(sp)
  80013a:	ecc6                	sd	a7,88(sp)
  80013c:	e41a                	sd	t1,8(sp)
  80013e:	c202                	sw	zero,4(sp)
  800140:	0aa000ef          	jal	ra,8001ea <vprintfmt>
  800144:	60e2                	ld	ra,24(sp)
  800146:	4512                	lw	a0,4(sp)
  800148:	6125                	addi	sp,sp,96
  80014a:	8082                	ret

000000000080014c <umain>:
  80014c:	1141                	addi	sp,sp,-16
  80014e:	e406                	sd	ra,8(sp)
  800150:	41a000ef          	jal	ra,80056a <main>
  800154:	f67ff0ef          	jal	ra,8000ba <exit>

0000000000800158 <strnlen>:
  800158:	c185                	beqz	a1,800178 <strnlen+0x20>
  80015a:	00054783          	lbu	a5,0(a0)
  80015e:	cf89                	beqz	a5,800178 <strnlen+0x20>
  800160:	4781                	li	a5,0
  800162:	a021                	j	80016a <strnlen+0x12>
  800164:	00074703          	lbu	a4,0(a4)
  800168:	c711                	beqz	a4,800174 <strnlen+0x1c>
  80016a:	0785                	addi	a5,a5,1
  80016c:	00f50733          	add	a4,a0,a5
  800170:	fef59ae3          	bne	a1,a5,800164 <strnlen+0xc>
  800174:	853e                	mv	a0,a5
  800176:	8082                	ret
  800178:	4781                	li	a5,0
  80017a:	853e                	mv	a0,a5
  80017c:	8082                	ret

000000000080017e <printnum>:
  80017e:	02069813          	slli	a6,a3,0x20
  800182:	7179                	addi	sp,sp,-48
  800184:	02085813          	srli	a6,a6,0x20
  800188:	e052                	sd	s4,0(sp)
  80018a:	03067a33          	remu	s4,a2,a6
  80018e:	f022                	sd	s0,32(sp)
  800190:	ec26                	sd	s1,24(sp)
  800192:	e84a                	sd	s2,16(sp)
  800194:	f406                	sd	ra,40(sp)
  800196:	e44e                	sd	s3,8(sp)
  800198:	84aa                	mv	s1,a0
  80019a:	892e                	mv	s2,a1
  80019c:	fff7041b          	addiw	s0,a4,-1
  8001a0:	2a01                	sext.w	s4,s4
  8001a2:	03067e63          	bgeu	a2,a6,8001de <printnum+0x60>
  8001a6:	89be                	mv	s3,a5
  8001a8:	00805763          	blez	s0,8001b6 <printnum+0x38>
  8001ac:	347d                	addiw	s0,s0,-1
  8001ae:	85ca                	mv	a1,s2
  8001b0:	854e                	mv	a0,s3
  8001b2:	9482                	jalr	s1
  8001b4:	fc65                	bnez	s0,8001ac <printnum+0x2e>
  8001b6:	1a02                	slli	s4,s4,0x20
  8001b8:	020a5a13          	srli	s4,s4,0x20
  8001bc:	00000797          	auipc	a5,0x0
  8001c0:	6dc78793          	addi	a5,a5,1756 # 800898 <error_string+0xc8>
  8001c4:	9a3e                	add	s4,s4,a5
  8001c6:	7402                	ld	s0,32(sp)
  8001c8:	000a4503          	lbu	a0,0(s4)
  8001cc:	70a2                	ld	ra,40(sp)
  8001ce:	69a2                	ld	s3,8(sp)
  8001d0:	6a02                	ld	s4,0(sp)
  8001d2:	85ca                	mv	a1,s2
  8001d4:	8326                	mv	t1,s1
  8001d6:	6942                	ld	s2,16(sp)
  8001d8:	64e2                	ld	s1,24(sp)
  8001da:	6145                	addi	sp,sp,48
  8001dc:	8302                	jr	t1
  8001de:	03065633          	divu	a2,a2,a6
  8001e2:	8722                	mv	a4,s0
  8001e4:	f9bff0ef          	jal	ra,80017e <printnum>
  8001e8:	b7f9                	j	8001b6 <printnum+0x38>

00000000008001ea <vprintfmt>:
  8001ea:	7119                	addi	sp,sp,-128
  8001ec:	f4a6                	sd	s1,104(sp)
  8001ee:	f0ca                	sd	s2,96(sp)
  8001f0:	e8d2                	sd	s4,80(sp)
  8001f2:	e4d6                	sd	s5,72(sp)
  8001f4:	e0da                	sd	s6,64(sp)
  8001f6:	fc5e                	sd	s7,56(sp)
  8001f8:	f862                	sd	s8,48(sp)
  8001fa:	f06a                	sd	s10,32(sp)
  8001fc:	fc86                	sd	ra,120(sp)
  8001fe:	f8a2                	sd	s0,112(sp)
  800200:	ecce                	sd	s3,88(sp)
  800202:	f466                	sd	s9,40(sp)
  800204:	ec6e                	sd	s11,24(sp)
  800206:	892a                	mv	s2,a0
  800208:	84ae                	mv	s1,a1
  80020a:	8d32                	mv	s10,a2
  80020c:	8ab6                	mv	s5,a3
  80020e:	5b7d                	li	s6,-1
  800210:	00000a17          	auipc	s4,0x0
  800214:	464a0a13          	addi	s4,s4,1124 # 800674 <main+0x10a>
  800218:	05e00b93          	li	s7,94
  80021c:	00000c17          	auipc	s8,0x0
  800220:	5b4c0c13          	addi	s8,s8,1460 # 8007d0 <error_string>
  800224:	000d4503          	lbu	a0,0(s10)
  800228:	02500793          	li	a5,37
  80022c:	001d0413          	addi	s0,s10,1
  800230:	00f50e63          	beq	a0,a5,80024c <vprintfmt+0x62>
  800234:	c521                	beqz	a0,80027c <vprintfmt+0x92>
  800236:	02500993          	li	s3,37
  80023a:	a011                	j	80023e <vprintfmt+0x54>
  80023c:	c121                	beqz	a0,80027c <vprintfmt+0x92>
  80023e:	85a6                	mv	a1,s1
  800240:	0405                	addi	s0,s0,1
  800242:	9902                	jalr	s2
  800244:	fff44503          	lbu	a0,-1(s0)
  800248:	ff351ae3          	bne	a0,s3,80023c <vprintfmt+0x52>
  80024c:	00044603          	lbu	a2,0(s0)
  800250:	02000793          	li	a5,32
  800254:	4981                	li	s3,0
  800256:	4801                	li	a6,0
  800258:	5cfd                	li	s9,-1
  80025a:	5dfd                	li	s11,-1
  80025c:	05500593          	li	a1,85
  800260:	4525                	li	a0,9
  800262:	fdd6069b          	addiw	a3,a2,-35
  800266:	0ff6f693          	andi	a3,a3,255
  80026a:	00140d13          	addi	s10,s0,1
  80026e:	1ed5ef63          	bltu	a1,a3,80046c <vprintfmt+0x282>
  800272:	068a                	slli	a3,a3,0x2
  800274:	96d2                	add	a3,a3,s4
  800276:	4294                	lw	a3,0(a3)
  800278:	96d2                	add	a3,a3,s4
  80027a:	8682                	jr	a3
  80027c:	70e6                	ld	ra,120(sp)
  80027e:	7446                	ld	s0,112(sp)
  800280:	74a6                	ld	s1,104(sp)
  800282:	7906                	ld	s2,96(sp)
  800284:	69e6                	ld	s3,88(sp)
  800286:	6a46                	ld	s4,80(sp)
  800288:	6aa6                	ld	s5,72(sp)
  80028a:	6b06                	ld	s6,64(sp)
  80028c:	7be2                	ld	s7,56(sp)
  80028e:	7c42                	ld	s8,48(sp)
  800290:	7ca2                	ld	s9,40(sp)
  800292:	7d02                	ld	s10,32(sp)
  800294:	6de2                	ld	s11,24(sp)
  800296:	6109                	addi	sp,sp,128
  800298:	8082                	ret
  80029a:	87b2                	mv	a5,a2
  80029c:	00144603          	lbu	a2,1(s0)
  8002a0:	846a                	mv	s0,s10
  8002a2:	b7c1                	j	800262 <vprintfmt+0x78>
  8002a4:	000aac83          	lw	s9,0(s5)
  8002a8:	00144603          	lbu	a2,1(s0)
  8002ac:	0aa1                	addi	s5,s5,8
  8002ae:	846a                	mv	s0,s10
  8002b0:	fa0dd9e3          	bgez	s11,800262 <vprintfmt+0x78>
  8002b4:	8de6                	mv	s11,s9
  8002b6:	5cfd                	li	s9,-1
  8002b8:	b76d                	j	800262 <vprintfmt+0x78>
  8002ba:	fffdc693          	not	a3,s11
  8002be:	96fd                	srai	a3,a3,0x3f
  8002c0:	00ddfdb3          	and	s11,s11,a3
  8002c4:	00144603          	lbu	a2,1(s0)
  8002c8:	2d81                	sext.w	s11,s11
  8002ca:	846a                	mv	s0,s10
  8002cc:	bf59                	j	800262 <vprintfmt+0x78>
  8002ce:	4705                	li	a4,1
  8002d0:	008a8593          	addi	a1,s5,8
  8002d4:	01074463          	blt	a4,a6,8002dc <vprintfmt+0xf2>
  8002d8:	22080863          	beqz	a6,800508 <vprintfmt+0x31e>
  8002dc:	000ab603          	ld	a2,0(s5)
  8002e0:	46c1                	li	a3,16
  8002e2:	8aae                	mv	s5,a1
  8002e4:	a291                	j	800428 <vprintfmt+0x23e>
  8002e6:	fd060c9b          	addiw	s9,a2,-48
  8002ea:	00144603          	lbu	a2,1(s0)
  8002ee:	846a                	mv	s0,s10
  8002f0:	fd06069b          	addiw	a3,a2,-48
  8002f4:	0006089b          	sext.w	a7,a2
  8002f8:	fad56ce3          	bltu	a0,a3,8002b0 <vprintfmt+0xc6>
  8002fc:	0405                	addi	s0,s0,1
  8002fe:	002c969b          	slliw	a3,s9,0x2
  800302:	00044603          	lbu	a2,0(s0)
  800306:	0196873b          	addw	a4,a3,s9
  80030a:	0017171b          	slliw	a4,a4,0x1
  80030e:	0117073b          	addw	a4,a4,a7
  800312:	fd06069b          	addiw	a3,a2,-48
  800316:	fd070c9b          	addiw	s9,a4,-48
  80031a:	0006089b          	sext.w	a7,a2
  80031e:	fcd57fe3          	bgeu	a0,a3,8002fc <vprintfmt+0x112>
  800322:	b779                	j	8002b0 <vprintfmt+0xc6>
  800324:	000aa503          	lw	a0,0(s5)
  800328:	85a6                	mv	a1,s1
  80032a:	0aa1                	addi	s5,s5,8
  80032c:	9902                	jalr	s2
  80032e:	bddd                	j	800224 <vprintfmt+0x3a>
  800330:	4705                	li	a4,1
  800332:	008a8993          	addi	s3,s5,8
  800336:	01074463          	blt	a4,a6,80033e <vprintfmt+0x154>
  80033a:	1c080463          	beqz	a6,800502 <vprintfmt+0x318>
  80033e:	000ab403          	ld	s0,0(s5)
  800342:	1c044a63          	bltz	s0,800516 <vprintfmt+0x32c>
  800346:	8622                	mv	a2,s0
  800348:	8ace                	mv	s5,s3
  80034a:	46a9                	li	a3,10
  80034c:	a8f1                	j	800428 <vprintfmt+0x23e>
  80034e:	000aa783          	lw	a5,0(s5)
  800352:	4761                	li	a4,24
  800354:	0aa1                	addi	s5,s5,8
  800356:	41f7d69b          	sraiw	a3,a5,0x1f
  80035a:	8fb5                	xor	a5,a5,a3
  80035c:	40d786bb          	subw	a3,a5,a3
  800360:	12d74963          	blt	a4,a3,800492 <vprintfmt+0x2a8>
  800364:	00369793          	slli	a5,a3,0x3
  800368:	97e2                	add	a5,a5,s8
  80036a:	639c                	ld	a5,0(a5)
  80036c:	12078363          	beqz	a5,800492 <vprintfmt+0x2a8>
  800370:	86be                	mv	a3,a5
  800372:	00000617          	auipc	a2,0x0
  800376:	61660613          	addi	a2,a2,1558 # 800988 <error_string+0x1b8>
  80037a:	85a6                	mv	a1,s1
  80037c:	854a                	mv	a0,s2
  80037e:	1cc000ef          	jal	ra,80054a <printfmt>
  800382:	b54d                	j	800224 <vprintfmt+0x3a>
  800384:	000ab603          	ld	a2,0(s5)
  800388:	0aa1                	addi	s5,s5,8
  80038a:	1a060163          	beqz	a2,80052c <vprintfmt+0x342>
  80038e:	00160413          	addi	s0,a2,1
  800392:	15b05763          	blez	s11,8004e0 <vprintfmt+0x2f6>
  800396:	02d00593          	li	a1,45
  80039a:	10b79d63          	bne	a5,a1,8004b4 <vprintfmt+0x2ca>
  80039e:	00064783          	lbu	a5,0(a2)
  8003a2:	0007851b          	sext.w	a0,a5
  8003a6:	c905                	beqz	a0,8003d6 <vprintfmt+0x1ec>
  8003a8:	000cc563          	bltz	s9,8003b2 <vprintfmt+0x1c8>
  8003ac:	3cfd                	addiw	s9,s9,-1
  8003ae:	036c8263          	beq	s9,s6,8003d2 <vprintfmt+0x1e8>
  8003b2:	85a6                	mv	a1,s1
  8003b4:	14098f63          	beqz	s3,800512 <vprintfmt+0x328>
  8003b8:	3781                	addiw	a5,a5,-32
  8003ba:	14fbfc63          	bgeu	s7,a5,800512 <vprintfmt+0x328>
  8003be:	03f00513          	li	a0,63
  8003c2:	9902                	jalr	s2
  8003c4:	0405                	addi	s0,s0,1
  8003c6:	fff44783          	lbu	a5,-1(s0)
  8003ca:	3dfd                	addiw	s11,s11,-1
  8003cc:	0007851b          	sext.w	a0,a5
  8003d0:	fd61                	bnez	a0,8003a8 <vprintfmt+0x1be>
  8003d2:	e5b059e3          	blez	s11,800224 <vprintfmt+0x3a>
  8003d6:	3dfd                	addiw	s11,s11,-1
  8003d8:	85a6                	mv	a1,s1
  8003da:	02000513          	li	a0,32
  8003de:	9902                	jalr	s2
  8003e0:	e40d82e3          	beqz	s11,800224 <vprintfmt+0x3a>
  8003e4:	3dfd                	addiw	s11,s11,-1
  8003e6:	85a6                	mv	a1,s1
  8003e8:	02000513          	li	a0,32
  8003ec:	9902                	jalr	s2
  8003ee:	fe0d94e3          	bnez	s11,8003d6 <vprintfmt+0x1ec>
  8003f2:	bd0d                	j	800224 <vprintfmt+0x3a>
  8003f4:	4705                	li	a4,1
  8003f6:	008a8593          	addi	a1,s5,8
  8003fa:	01074463          	blt	a4,a6,800402 <vprintfmt+0x218>
  8003fe:	0e080863          	beqz	a6,8004ee <vprintfmt+0x304>
  800402:	000ab603          	ld	a2,0(s5)
  800406:	46a1                	li	a3,8
  800408:	8aae                	mv	s5,a1
  80040a:	a839                	j	800428 <vprintfmt+0x23e>
  80040c:	03000513          	li	a0,48
  800410:	85a6                	mv	a1,s1
  800412:	e03e                	sd	a5,0(sp)
  800414:	9902                	jalr	s2
  800416:	85a6                	mv	a1,s1
  800418:	07800513          	li	a0,120
  80041c:	9902                	jalr	s2
  80041e:	0aa1                	addi	s5,s5,8
  800420:	ff8ab603          	ld	a2,-8(s5)
  800424:	6782                	ld	a5,0(sp)
  800426:	46c1                	li	a3,16
  800428:	2781                	sext.w	a5,a5
  80042a:	876e                	mv	a4,s11
  80042c:	85a6                	mv	a1,s1
  80042e:	854a                	mv	a0,s2
  800430:	d4fff0ef          	jal	ra,80017e <printnum>
  800434:	bbc5                	j	800224 <vprintfmt+0x3a>
  800436:	00144603          	lbu	a2,1(s0)
  80043a:	2805                	addiw	a6,a6,1
  80043c:	846a                	mv	s0,s10
  80043e:	b515                	j	800262 <vprintfmt+0x78>
  800440:	00144603          	lbu	a2,1(s0)
  800444:	4985                	li	s3,1
  800446:	846a                	mv	s0,s10
  800448:	bd29                	j	800262 <vprintfmt+0x78>
  80044a:	85a6                	mv	a1,s1
  80044c:	02500513          	li	a0,37
  800450:	9902                	jalr	s2
  800452:	bbc9                	j	800224 <vprintfmt+0x3a>
  800454:	4705                	li	a4,1
  800456:	008a8593          	addi	a1,s5,8
  80045a:	01074463          	blt	a4,a6,800462 <vprintfmt+0x278>
  80045e:	08080d63          	beqz	a6,8004f8 <vprintfmt+0x30e>
  800462:	000ab603          	ld	a2,0(s5)
  800466:	46a9                	li	a3,10
  800468:	8aae                	mv	s5,a1
  80046a:	bf7d                	j	800428 <vprintfmt+0x23e>
  80046c:	85a6                	mv	a1,s1
  80046e:	02500513          	li	a0,37
  800472:	9902                	jalr	s2
  800474:	fff44703          	lbu	a4,-1(s0)
  800478:	02500793          	li	a5,37
  80047c:	8d22                	mv	s10,s0
  80047e:	daf703e3          	beq	a4,a5,800224 <vprintfmt+0x3a>
  800482:	02500713          	li	a4,37
  800486:	1d7d                	addi	s10,s10,-1
  800488:	fffd4783          	lbu	a5,-1(s10)
  80048c:	fee79de3          	bne	a5,a4,800486 <vprintfmt+0x29c>
  800490:	bb51                	j	800224 <vprintfmt+0x3a>
  800492:	00000617          	auipc	a2,0x0
  800496:	4e660613          	addi	a2,a2,1254 # 800978 <error_string+0x1a8>
  80049a:	85a6                	mv	a1,s1
  80049c:	854a                	mv	a0,s2
  80049e:	0ac000ef          	jal	ra,80054a <printfmt>
  8004a2:	b349                	j	800224 <vprintfmt+0x3a>
  8004a4:	00000617          	auipc	a2,0x0
  8004a8:	4cc60613          	addi	a2,a2,1228 # 800970 <error_string+0x1a0>
  8004ac:	00000417          	auipc	s0,0x0
  8004b0:	4c540413          	addi	s0,s0,1221 # 800971 <error_string+0x1a1>
  8004b4:	8532                	mv	a0,a2
  8004b6:	85e6                	mv	a1,s9
  8004b8:	e032                	sd	a2,0(sp)
  8004ba:	e43e                	sd	a5,8(sp)
  8004bc:	c9dff0ef          	jal	ra,800158 <strnlen>
  8004c0:	40ad8dbb          	subw	s11,s11,a0
  8004c4:	6602                	ld	a2,0(sp)
  8004c6:	01b05d63          	blez	s11,8004e0 <vprintfmt+0x2f6>
  8004ca:	67a2                	ld	a5,8(sp)
  8004cc:	2781                	sext.w	a5,a5
  8004ce:	e43e                	sd	a5,8(sp)
  8004d0:	6522                	ld	a0,8(sp)
  8004d2:	85a6                	mv	a1,s1
  8004d4:	e032                	sd	a2,0(sp)
  8004d6:	3dfd                	addiw	s11,s11,-1
  8004d8:	9902                	jalr	s2
  8004da:	6602                	ld	a2,0(sp)
  8004dc:	fe0d9ae3          	bnez	s11,8004d0 <vprintfmt+0x2e6>
  8004e0:	00064783          	lbu	a5,0(a2)
  8004e4:	0007851b          	sext.w	a0,a5
  8004e8:	ec0510e3          	bnez	a0,8003a8 <vprintfmt+0x1be>
  8004ec:	bb25                	j	800224 <vprintfmt+0x3a>
  8004ee:	000ae603          	lwu	a2,0(s5)
  8004f2:	46a1                	li	a3,8
  8004f4:	8aae                	mv	s5,a1
  8004f6:	bf0d                	j	800428 <vprintfmt+0x23e>
  8004f8:	000ae603          	lwu	a2,0(s5)
  8004fc:	46a9                	li	a3,10
  8004fe:	8aae                	mv	s5,a1
  800500:	b725                	j	800428 <vprintfmt+0x23e>
  800502:	000aa403          	lw	s0,0(s5)
  800506:	bd35                	j	800342 <vprintfmt+0x158>
  800508:	000ae603          	lwu	a2,0(s5)
  80050c:	46c1                	li	a3,16
  80050e:	8aae                	mv	s5,a1
  800510:	bf21                	j	800428 <vprintfmt+0x23e>
  800512:	9902                	jalr	s2
  800514:	bd45                	j	8003c4 <vprintfmt+0x1da>
  800516:	85a6                	mv	a1,s1
  800518:	02d00513          	li	a0,45
  80051c:	e03e                	sd	a5,0(sp)
  80051e:	9902                	jalr	s2
  800520:	8ace                	mv	s5,s3
  800522:	40800633          	neg	a2,s0
  800526:	46a9                	li	a3,10
  800528:	6782                	ld	a5,0(sp)
  80052a:	bdfd                	j	800428 <vprintfmt+0x23e>
  80052c:	01b05663          	blez	s11,800538 <vprintfmt+0x34e>
  800530:	02d00693          	li	a3,45
  800534:	f6d798e3          	bne	a5,a3,8004a4 <vprintfmt+0x2ba>
  800538:	00000417          	auipc	s0,0x0
  80053c:	43940413          	addi	s0,s0,1081 # 800971 <error_string+0x1a1>
  800540:	02800513          	li	a0,40
  800544:	02800793          	li	a5,40
  800548:	b585                	j	8003a8 <vprintfmt+0x1be>

000000000080054a <printfmt>:
  80054a:	715d                	addi	sp,sp,-80
  80054c:	02810313          	addi	t1,sp,40
  800550:	f436                	sd	a3,40(sp)
  800552:	869a                	mv	a3,t1
  800554:	ec06                	sd	ra,24(sp)
  800556:	f83a                	sd	a4,48(sp)
  800558:	fc3e                	sd	a5,56(sp)
  80055a:	e0c2                	sd	a6,64(sp)
  80055c:	e4c6                	sd	a7,72(sp)
  80055e:	e41a                	sd	t1,8(sp)
  800560:	c8bff0ef          	jal	ra,8001ea <vprintfmt>
  800564:	60e2                	ld	ra,24(sp)
  800566:	6161                	addi	sp,sp,80
  800568:	8082                	ret

000000000080056a <main>:
  80056a:	1141                	addi	sp,sp,-16
  80056c:	00000517          	auipc	a0,0x0
  800570:	42450513          	addi	a0,a0,1060 # 800990 <error_string+0x1c0>
  800574:	e406                	sd	ra,8(sp)
  800576:	e022                	sd	s0,0(sp)
  800578:	ba1ff0ef          	jal	ra,800118 <cprintf>
  80057c:	b55ff0ef          	jal	ra,8000d0 <fork>
  800580:	e901                	bnez	a0,800590 <main+0x26>
  800582:	00000517          	auipc	a0,0x0
  800586:	43650513          	addi	a0,a0,1078 # 8009b8 <error_string+0x1e8>
  80058a:	b8fff0ef          	jal	ra,800118 <cprintf>
  80058e:	a001                	j	80058e <main+0x24>
  800590:	842a                	mv	s0,a0
  800592:	00000517          	auipc	a0,0x0
  800596:	44650513          	addi	a0,a0,1094 # 8009d8 <error_string+0x208>
  80059a:	b7fff0ef          	jal	ra,800118 <cprintf>
  80059e:	b37ff0ef          	jal	ra,8000d4 <yield>
  8005a2:	b33ff0ef          	jal	ra,8000d4 <yield>
  8005a6:	b2fff0ef          	jal	ra,8000d4 <yield>
  8005aa:	00000517          	auipc	a0,0x0
  8005ae:	45650513          	addi	a0,a0,1110 # 800a00 <error_string+0x230>
  8005b2:	b67ff0ef          	jal	ra,800118 <cprintf>
  8005b6:	8522                	mv	a0,s0
  8005b8:	b1fff0ef          	jal	ra,8000d6 <kill>
  8005bc:	ed31                	bnez	a0,800618 <main+0xae>
  8005be:	4581                	li	a1,0
  8005c0:	00000517          	auipc	a0,0x0
  8005c4:	4a850513          	addi	a0,a0,1192 # 800a68 <error_string+0x298>
  8005c8:	b51ff0ef          	jal	ra,800118 <cprintf>
  8005cc:	4581                	li	a1,0
  8005ce:	8522                	mv	a0,s0
  8005d0:	b03ff0ef          	jal	ra,8000d2 <waitpid>
  8005d4:	e11d                	bnez	a0,8005fa <main+0x90>
  8005d6:	4581                	li	a1,0
  8005d8:	00000517          	auipc	a0,0x0
  8005dc:	4c850513          	addi	a0,a0,1224 # 800aa0 <error_string+0x2d0>
  8005e0:	b39ff0ef          	jal	ra,800118 <cprintf>
  8005e4:	00000517          	auipc	a0,0x0
  8005e8:	4d450513          	addi	a0,a0,1236 # 800ab8 <error_string+0x2e8>
  8005ec:	b2dff0ef          	jal	ra,800118 <cprintf>
  8005f0:	60a2                	ld	ra,8(sp)
  8005f2:	6402                	ld	s0,0(sp)
  8005f4:	4501                	li	a0,0
  8005f6:	0141                	addi	sp,sp,16
  8005f8:	8082                	ret
  8005fa:	00000697          	auipc	a3,0x0
  8005fe:	48668693          	addi	a3,a3,1158 # 800a80 <error_string+0x2b0>
  800602:	00000617          	auipc	a2,0x0
  800606:	43e60613          	addi	a2,a2,1086 # 800a40 <error_string+0x270>
  80060a:	45dd                	li	a1,23
  80060c:	00000517          	auipc	a0,0x0
  800610:	44c50513          	addi	a0,a0,1100 # 800a58 <error_string+0x288>
  800614:	a0dff0ef          	jal	ra,800020 <__panic>
  800618:	00000697          	auipc	a3,0x0
  80061c:	41068693          	addi	a3,a3,1040 # 800a28 <error_string+0x258>
  800620:	00000617          	auipc	a2,0x0
  800624:	42060613          	addi	a2,a2,1056 # 800a40 <error_string+0x270>
  800628:	45d1                	li	a1,20
  80062a:	00000517          	auipc	a0,0x0
  80062e:	42e50513          	addi	a0,a0,1070 # 800a58 <error_string+0x288>
  800632:	9efff0ef          	jal	ra,800020 <__panic>
