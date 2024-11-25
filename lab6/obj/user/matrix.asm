
obj/__user_matrix.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	136000ef          	jal	ra,800156 <umain>
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
  800038:	78450513          	addi	a0,a0,1924 # 8007b8 <main+0xca>
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
  800054:	00001517          	auipc	a0,0x1
  800058:	ac450513          	addi	a0,a0,-1340 # 800b18 <error_string+0x1d0>
  80005c:	044000ef          	jal	ra,8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0d0000ef          	jal	ra,800132 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0be000ef          	jal	ra,80012c <sys_putc>
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
  800094:	13a000ef          	jal	ra,8001ce <vprintfmt>
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
  8000c8:	106000ef          	jal	ra,8001ce <vprintfmt>
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

0000000000800122 <sys_kill>:
  800122:	85aa                	mv	a1,a0
  800124:	4531                	li	a0,12
  800126:	b77d                	j	8000d4 <syscall>

0000000000800128 <sys_getpid>:
  800128:	4549                	li	a0,18
  80012a:	b76d                	j	8000d4 <syscall>

000000000080012c <sys_putc>:
  80012c:	85aa                	mv	a1,a0
  80012e:	4579                	li	a0,30
  800130:	b755                	j	8000d4 <syscall>

0000000000800132 <exit>:
  800132:	1141                	addi	sp,sp,-16
  800134:	e406                	sd	ra,8(sp)
  800136:	fd7ff0ef          	jal	ra,80010c <sys_exit>
  80013a:	00000517          	auipc	a0,0x0
  80013e:	69e50513          	addi	a0,a0,1694 # 8007d8 <main+0xea>
  800142:	f5fff0ef          	jal	ra,8000a0 <cprintf>
  800146:	a001                	j	800146 <exit+0x14>

0000000000800148 <fork>:
  800148:	b7e9                	j	800112 <sys_fork>

000000000080014a <wait>:
  80014a:	4581                	li	a1,0
  80014c:	4501                	li	a0,0
  80014e:	b7e1                	j	800116 <sys_wait>

0000000000800150 <yield>:
  800150:	b7f9                	j	80011e <sys_yield>

0000000000800152 <kill>:
  800152:	bfc1                	j	800122 <sys_kill>

0000000000800154 <getpid>:
  800154:	bfd1                	j	800128 <sys_getpid>

0000000000800156 <umain>:
  800156:	1141                	addi	sp,sp,-16
  800158:	e406                	sd	ra,8(sp)
  80015a:	594000ef          	jal	ra,8006ee <main>
  80015e:	fd5ff0ef          	jal	ra,800132 <exit>

0000000000800162 <printnum>:
  800162:	02069813          	slli	a6,a3,0x20
  800166:	7179                	addi	sp,sp,-48
  800168:	02085813          	srli	a6,a6,0x20
  80016c:	e052                	sd	s4,0(sp)
  80016e:	03067a33          	remu	s4,a2,a6
  800172:	f022                	sd	s0,32(sp)
  800174:	ec26                	sd	s1,24(sp)
  800176:	e84a                	sd	s2,16(sp)
  800178:	f406                	sd	ra,40(sp)
  80017a:	e44e                	sd	s3,8(sp)
  80017c:	84aa                	mv	s1,a0
  80017e:	892e                	mv	s2,a1
  800180:	fff7041b          	addiw	s0,a4,-1
  800184:	2a01                	sext.w	s4,s4
  800186:	03067e63          	bgeu	a2,a6,8001c2 <printnum+0x60>
  80018a:	89be                	mv	s3,a5
  80018c:	00805763          	blez	s0,80019a <printnum+0x38>
  800190:	347d                	addiw	s0,s0,-1
  800192:	85ca                	mv	a1,s2
  800194:	854e                	mv	a0,s3
  800196:	9482                	jalr	s1
  800198:	fc65                	bnez	s0,800190 <printnum+0x2e>
  80019a:	1a02                	slli	s4,s4,0x20
  80019c:	020a5a13          	srli	s4,s4,0x20
  8001a0:	00001797          	auipc	a5,0x1
  8001a4:	87078793          	addi	a5,a5,-1936 # 800a10 <error_string+0xc8>
  8001a8:	9a3e                	add	s4,s4,a5
  8001aa:	7402                	ld	s0,32(sp)
  8001ac:	000a4503          	lbu	a0,0(s4)
  8001b0:	70a2                	ld	ra,40(sp)
  8001b2:	69a2                	ld	s3,8(sp)
  8001b4:	6a02                	ld	s4,0(sp)
  8001b6:	85ca                	mv	a1,s2
  8001b8:	8326                	mv	t1,s1
  8001ba:	6942                	ld	s2,16(sp)
  8001bc:	64e2                	ld	s1,24(sp)
  8001be:	6145                	addi	sp,sp,48
  8001c0:	8302                	jr	t1
  8001c2:	03065633          	divu	a2,a2,a6
  8001c6:	8722                	mv	a4,s0
  8001c8:	f9bff0ef          	jal	ra,800162 <printnum>
  8001cc:	b7f9                	j	80019a <printnum+0x38>

00000000008001ce <vprintfmt>:
  8001ce:	7119                	addi	sp,sp,-128
  8001d0:	f4a6                	sd	s1,104(sp)
  8001d2:	f0ca                	sd	s2,96(sp)
  8001d4:	e8d2                	sd	s4,80(sp)
  8001d6:	e4d6                	sd	s5,72(sp)
  8001d8:	e0da                	sd	s6,64(sp)
  8001da:	fc5e                	sd	s7,56(sp)
  8001dc:	f862                	sd	s8,48(sp)
  8001de:	f06a                	sd	s10,32(sp)
  8001e0:	fc86                	sd	ra,120(sp)
  8001e2:	f8a2                	sd	s0,112(sp)
  8001e4:	ecce                	sd	s3,88(sp)
  8001e6:	f466                	sd	s9,40(sp)
  8001e8:	ec6e                	sd	s11,24(sp)
  8001ea:	892a                	mv	s2,a0
  8001ec:	84ae                	mv	s1,a1
  8001ee:	8d32                	mv	s10,a2
  8001f0:	8ab6                	mv	s5,a3
  8001f2:	5b7d                	li	s6,-1
  8001f4:	00000a17          	auipc	s4,0x0
  8001f8:	5f8a0a13          	addi	s4,s4,1528 # 8007ec <main+0xfe>
  8001fc:	05e00b93          	li	s7,94
  800200:	00000c17          	auipc	s8,0x0
  800204:	748c0c13          	addi	s8,s8,1864 # 800948 <error_string>
  800208:	000d4503          	lbu	a0,0(s10)
  80020c:	02500793          	li	a5,37
  800210:	001d0413          	addi	s0,s10,1
  800214:	00f50e63          	beq	a0,a5,800230 <vprintfmt+0x62>
  800218:	c521                	beqz	a0,800260 <vprintfmt+0x92>
  80021a:	02500993          	li	s3,37
  80021e:	a011                	j	800222 <vprintfmt+0x54>
  800220:	c121                	beqz	a0,800260 <vprintfmt+0x92>
  800222:	85a6                	mv	a1,s1
  800224:	0405                	addi	s0,s0,1
  800226:	9902                	jalr	s2
  800228:	fff44503          	lbu	a0,-1(s0)
  80022c:	ff351ae3          	bne	a0,s3,800220 <vprintfmt+0x52>
  800230:	00044603          	lbu	a2,0(s0)
  800234:	02000793          	li	a5,32
  800238:	4981                	li	s3,0
  80023a:	4801                	li	a6,0
  80023c:	5cfd                	li	s9,-1
  80023e:	5dfd                	li	s11,-1
  800240:	05500593          	li	a1,85
  800244:	4525                	li	a0,9
  800246:	fdd6069b          	addiw	a3,a2,-35
  80024a:	0ff6f693          	andi	a3,a3,255
  80024e:	00140d13          	addi	s10,s0,1
  800252:	1ed5ef63          	bltu	a1,a3,800450 <vprintfmt+0x282>
  800256:	068a                	slli	a3,a3,0x2
  800258:	96d2                	add	a3,a3,s4
  80025a:	4294                	lw	a3,0(a3)
  80025c:	96d2                	add	a3,a3,s4
  80025e:	8682                	jr	a3
  800260:	70e6                	ld	ra,120(sp)
  800262:	7446                	ld	s0,112(sp)
  800264:	74a6                	ld	s1,104(sp)
  800266:	7906                	ld	s2,96(sp)
  800268:	69e6                	ld	s3,88(sp)
  80026a:	6a46                	ld	s4,80(sp)
  80026c:	6aa6                	ld	s5,72(sp)
  80026e:	6b06                	ld	s6,64(sp)
  800270:	7be2                	ld	s7,56(sp)
  800272:	7c42                	ld	s8,48(sp)
  800274:	7ca2                	ld	s9,40(sp)
  800276:	7d02                	ld	s10,32(sp)
  800278:	6de2                	ld	s11,24(sp)
  80027a:	6109                	addi	sp,sp,128
  80027c:	8082                	ret
  80027e:	87b2                	mv	a5,a2
  800280:	00144603          	lbu	a2,1(s0)
  800284:	846a                	mv	s0,s10
  800286:	b7c1                	j	800246 <vprintfmt+0x78>
  800288:	000aac83          	lw	s9,0(s5)
  80028c:	00144603          	lbu	a2,1(s0)
  800290:	0aa1                	addi	s5,s5,8
  800292:	846a                	mv	s0,s10
  800294:	fa0dd9e3          	bgez	s11,800246 <vprintfmt+0x78>
  800298:	8de6                	mv	s11,s9
  80029a:	5cfd                	li	s9,-1
  80029c:	b76d                	j	800246 <vprintfmt+0x78>
  80029e:	fffdc693          	not	a3,s11
  8002a2:	96fd                	srai	a3,a3,0x3f
  8002a4:	00ddfdb3          	and	s11,s11,a3
  8002a8:	00144603          	lbu	a2,1(s0)
  8002ac:	2d81                	sext.w	s11,s11
  8002ae:	846a                	mv	s0,s10
  8002b0:	bf59                	j	800246 <vprintfmt+0x78>
  8002b2:	4705                	li	a4,1
  8002b4:	008a8593          	addi	a1,s5,8
  8002b8:	01074463          	blt	a4,a6,8002c0 <vprintfmt+0xf2>
  8002bc:	22080863          	beqz	a6,8004ec <vprintfmt+0x31e>
  8002c0:	000ab603          	ld	a2,0(s5)
  8002c4:	46c1                	li	a3,16
  8002c6:	8aae                	mv	s5,a1
  8002c8:	a291                	j	80040c <vprintfmt+0x23e>
  8002ca:	fd060c9b          	addiw	s9,a2,-48
  8002ce:	00144603          	lbu	a2,1(s0)
  8002d2:	846a                	mv	s0,s10
  8002d4:	fd06069b          	addiw	a3,a2,-48
  8002d8:	0006089b          	sext.w	a7,a2
  8002dc:	fad56ce3          	bltu	a0,a3,800294 <vprintfmt+0xc6>
  8002e0:	0405                	addi	s0,s0,1
  8002e2:	002c969b          	slliw	a3,s9,0x2
  8002e6:	00044603          	lbu	a2,0(s0)
  8002ea:	0196873b          	addw	a4,a3,s9
  8002ee:	0017171b          	slliw	a4,a4,0x1
  8002f2:	0117073b          	addw	a4,a4,a7
  8002f6:	fd06069b          	addiw	a3,a2,-48
  8002fa:	fd070c9b          	addiw	s9,a4,-48
  8002fe:	0006089b          	sext.w	a7,a2
  800302:	fcd57fe3          	bgeu	a0,a3,8002e0 <vprintfmt+0x112>
  800306:	b779                	j	800294 <vprintfmt+0xc6>
  800308:	000aa503          	lw	a0,0(s5)
  80030c:	85a6                	mv	a1,s1
  80030e:	0aa1                	addi	s5,s5,8
  800310:	9902                	jalr	s2
  800312:	bddd                	j	800208 <vprintfmt+0x3a>
  800314:	4705                	li	a4,1
  800316:	008a8993          	addi	s3,s5,8
  80031a:	01074463          	blt	a4,a6,800322 <vprintfmt+0x154>
  80031e:	1c080463          	beqz	a6,8004e6 <vprintfmt+0x318>
  800322:	000ab403          	ld	s0,0(s5)
  800326:	1c044a63          	bltz	s0,8004fa <vprintfmt+0x32c>
  80032a:	8622                	mv	a2,s0
  80032c:	8ace                	mv	s5,s3
  80032e:	46a9                	li	a3,10
  800330:	a8f1                	j	80040c <vprintfmt+0x23e>
  800332:	000aa783          	lw	a5,0(s5)
  800336:	4761                	li	a4,24
  800338:	0aa1                	addi	s5,s5,8
  80033a:	41f7d69b          	sraiw	a3,a5,0x1f
  80033e:	8fb5                	xor	a5,a5,a3
  800340:	40d786bb          	subw	a3,a5,a3
  800344:	12d74963          	blt	a4,a3,800476 <vprintfmt+0x2a8>
  800348:	00369793          	slli	a5,a3,0x3
  80034c:	97e2                	add	a5,a5,s8
  80034e:	639c                	ld	a5,0(a5)
  800350:	12078363          	beqz	a5,800476 <vprintfmt+0x2a8>
  800354:	86be                	mv	a3,a5
  800356:	00000617          	auipc	a2,0x0
  80035a:	7aa60613          	addi	a2,a2,1962 # 800b00 <error_string+0x1b8>
  80035e:	85a6                	mv	a1,s1
  800360:	854a                	mv	a0,s2
  800362:	1cc000ef          	jal	ra,80052e <printfmt>
  800366:	b54d                	j	800208 <vprintfmt+0x3a>
  800368:	000ab603          	ld	a2,0(s5)
  80036c:	0aa1                	addi	s5,s5,8
  80036e:	1a060163          	beqz	a2,800510 <vprintfmt+0x342>
  800372:	00160413          	addi	s0,a2,1
  800376:	15b05763          	blez	s11,8004c4 <vprintfmt+0x2f6>
  80037a:	02d00593          	li	a1,45
  80037e:	10b79d63          	bne	a5,a1,800498 <vprintfmt+0x2ca>
  800382:	00064783          	lbu	a5,0(a2)
  800386:	0007851b          	sext.w	a0,a5
  80038a:	c905                	beqz	a0,8003ba <vprintfmt+0x1ec>
  80038c:	000cc563          	bltz	s9,800396 <vprintfmt+0x1c8>
  800390:	3cfd                	addiw	s9,s9,-1
  800392:	036c8263          	beq	s9,s6,8003b6 <vprintfmt+0x1e8>
  800396:	85a6                	mv	a1,s1
  800398:	14098f63          	beqz	s3,8004f6 <vprintfmt+0x328>
  80039c:	3781                	addiw	a5,a5,-32
  80039e:	14fbfc63          	bgeu	s7,a5,8004f6 <vprintfmt+0x328>
  8003a2:	03f00513          	li	a0,63
  8003a6:	9902                	jalr	s2
  8003a8:	0405                	addi	s0,s0,1
  8003aa:	fff44783          	lbu	a5,-1(s0)
  8003ae:	3dfd                	addiw	s11,s11,-1
  8003b0:	0007851b          	sext.w	a0,a5
  8003b4:	fd61                	bnez	a0,80038c <vprintfmt+0x1be>
  8003b6:	e5b059e3          	blez	s11,800208 <vprintfmt+0x3a>
  8003ba:	3dfd                	addiw	s11,s11,-1
  8003bc:	85a6                	mv	a1,s1
  8003be:	02000513          	li	a0,32
  8003c2:	9902                	jalr	s2
  8003c4:	e40d82e3          	beqz	s11,800208 <vprintfmt+0x3a>
  8003c8:	3dfd                	addiw	s11,s11,-1
  8003ca:	85a6                	mv	a1,s1
  8003cc:	02000513          	li	a0,32
  8003d0:	9902                	jalr	s2
  8003d2:	fe0d94e3          	bnez	s11,8003ba <vprintfmt+0x1ec>
  8003d6:	bd0d                	j	800208 <vprintfmt+0x3a>
  8003d8:	4705                	li	a4,1
  8003da:	008a8593          	addi	a1,s5,8
  8003de:	01074463          	blt	a4,a6,8003e6 <vprintfmt+0x218>
  8003e2:	0e080863          	beqz	a6,8004d2 <vprintfmt+0x304>
  8003e6:	000ab603          	ld	a2,0(s5)
  8003ea:	46a1                	li	a3,8
  8003ec:	8aae                	mv	s5,a1
  8003ee:	a839                	j	80040c <vprintfmt+0x23e>
  8003f0:	03000513          	li	a0,48
  8003f4:	85a6                	mv	a1,s1
  8003f6:	e03e                	sd	a5,0(sp)
  8003f8:	9902                	jalr	s2
  8003fa:	85a6                	mv	a1,s1
  8003fc:	07800513          	li	a0,120
  800400:	9902                	jalr	s2
  800402:	0aa1                	addi	s5,s5,8
  800404:	ff8ab603          	ld	a2,-8(s5)
  800408:	6782                	ld	a5,0(sp)
  80040a:	46c1                	li	a3,16
  80040c:	2781                	sext.w	a5,a5
  80040e:	876e                	mv	a4,s11
  800410:	85a6                	mv	a1,s1
  800412:	854a                	mv	a0,s2
  800414:	d4fff0ef          	jal	ra,800162 <printnum>
  800418:	bbc5                	j	800208 <vprintfmt+0x3a>
  80041a:	00144603          	lbu	a2,1(s0)
  80041e:	2805                	addiw	a6,a6,1
  800420:	846a                	mv	s0,s10
  800422:	b515                	j	800246 <vprintfmt+0x78>
  800424:	00144603          	lbu	a2,1(s0)
  800428:	4985                	li	s3,1
  80042a:	846a                	mv	s0,s10
  80042c:	bd29                	j	800246 <vprintfmt+0x78>
  80042e:	85a6                	mv	a1,s1
  800430:	02500513          	li	a0,37
  800434:	9902                	jalr	s2
  800436:	bbc9                	j	800208 <vprintfmt+0x3a>
  800438:	4705                	li	a4,1
  80043a:	008a8593          	addi	a1,s5,8
  80043e:	01074463          	blt	a4,a6,800446 <vprintfmt+0x278>
  800442:	08080d63          	beqz	a6,8004dc <vprintfmt+0x30e>
  800446:	000ab603          	ld	a2,0(s5)
  80044a:	46a9                	li	a3,10
  80044c:	8aae                	mv	s5,a1
  80044e:	bf7d                	j	80040c <vprintfmt+0x23e>
  800450:	85a6                	mv	a1,s1
  800452:	02500513          	li	a0,37
  800456:	9902                	jalr	s2
  800458:	fff44703          	lbu	a4,-1(s0)
  80045c:	02500793          	li	a5,37
  800460:	8d22                	mv	s10,s0
  800462:	daf703e3          	beq	a4,a5,800208 <vprintfmt+0x3a>
  800466:	02500713          	li	a4,37
  80046a:	1d7d                	addi	s10,s10,-1
  80046c:	fffd4783          	lbu	a5,-1(s10)
  800470:	fee79de3          	bne	a5,a4,80046a <vprintfmt+0x29c>
  800474:	bb51                	j	800208 <vprintfmt+0x3a>
  800476:	00000617          	auipc	a2,0x0
  80047a:	67a60613          	addi	a2,a2,1658 # 800af0 <error_string+0x1a8>
  80047e:	85a6                	mv	a1,s1
  800480:	854a                	mv	a0,s2
  800482:	0ac000ef          	jal	ra,80052e <printfmt>
  800486:	b349                	j	800208 <vprintfmt+0x3a>
  800488:	00000617          	auipc	a2,0x0
  80048c:	66060613          	addi	a2,a2,1632 # 800ae8 <error_string+0x1a0>
  800490:	00000417          	auipc	s0,0x0
  800494:	65940413          	addi	s0,s0,1625 # 800ae9 <error_string+0x1a1>
  800498:	8532                	mv	a0,a2
  80049a:	85e6                	mv	a1,s9
  80049c:	e032                	sd	a2,0(sp)
  80049e:	e43e                	sd	a5,8(sp)
  8004a0:	0f0000ef          	jal	ra,800590 <strnlen>
  8004a4:	40ad8dbb          	subw	s11,s11,a0
  8004a8:	6602                	ld	a2,0(sp)
  8004aa:	01b05d63          	blez	s11,8004c4 <vprintfmt+0x2f6>
  8004ae:	67a2                	ld	a5,8(sp)
  8004b0:	2781                	sext.w	a5,a5
  8004b2:	e43e                	sd	a5,8(sp)
  8004b4:	6522                	ld	a0,8(sp)
  8004b6:	85a6                	mv	a1,s1
  8004b8:	e032                	sd	a2,0(sp)
  8004ba:	3dfd                	addiw	s11,s11,-1
  8004bc:	9902                	jalr	s2
  8004be:	6602                	ld	a2,0(sp)
  8004c0:	fe0d9ae3          	bnez	s11,8004b4 <vprintfmt+0x2e6>
  8004c4:	00064783          	lbu	a5,0(a2)
  8004c8:	0007851b          	sext.w	a0,a5
  8004cc:	ec0510e3          	bnez	a0,80038c <vprintfmt+0x1be>
  8004d0:	bb25                	j	800208 <vprintfmt+0x3a>
  8004d2:	000ae603          	lwu	a2,0(s5)
  8004d6:	46a1                	li	a3,8
  8004d8:	8aae                	mv	s5,a1
  8004da:	bf0d                	j	80040c <vprintfmt+0x23e>
  8004dc:	000ae603          	lwu	a2,0(s5)
  8004e0:	46a9                	li	a3,10
  8004e2:	8aae                	mv	s5,a1
  8004e4:	b725                	j	80040c <vprintfmt+0x23e>
  8004e6:	000aa403          	lw	s0,0(s5)
  8004ea:	bd35                	j	800326 <vprintfmt+0x158>
  8004ec:	000ae603          	lwu	a2,0(s5)
  8004f0:	46c1                	li	a3,16
  8004f2:	8aae                	mv	s5,a1
  8004f4:	bf21                	j	80040c <vprintfmt+0x23e>
  8004f6:	9902                	jalr	s2
  8004f8:	bd45                	j	8003a8 <vprintfmt+0x1da>
  8004fa:	85a6                	mv	a1,s1
  8004fc:	02d00513          	li	a0,45
  800500:	e03e                	sd	a5,0(sp)
  800502:	9902                	jalr	s2
  800504:	8ace                	mv	s5,s3
  800506:	40800633          	neg	a2,s0
  80050a:	46a9                	li	a3,10
  80050c:	6782                	ld	a5,0(sp)
  80050e:	bdfd                	j	80040c <vprintfmt+0x23e>
  800510:	01b05663          	blez	s11,80051c <vprintfmt+0x34e>
  800514:	02d00693          	li	a3,45
  800518:	f6d798e3          	bne	a5,a3,800488 <vprintfmt+0x2ba>
  80051c:	00000417          	auipc	s0,0x0
  800520:	5cd40413          	addi	s0,s0,1485 # 800ae9 <error_string+0x1a1>
  800524:	02800513          	li	a0,40
  800528:	02800793          	li	a5,40
  80052c:	b585                	j	80038c <vprintfmt+0x1be>

000000000080052e <printfmt>:
  80052e:	715d                	addi	sp,sp,-80
  800530:	02810313          	addi	t1,sp,40
  800534:	f436                	sd	a3,40(sp)
  800536:	869a                	mv	a3,t1
  800538:	ec06                	sd	ra,24(sp)
  80053a:	f83a                	sd	a4,48(sp)
  80053c:	fc3e                	sd	a5,56(sp)
  80053e:	e0c2                	sd	a6,64(sp)
  800540:	e4c6                	sd	a7,72(sp)
  800542:	e41a                	sd	t1,8(sp)
  800544:	c8bff0ef          	jal	ra,8001ce <vprintfmt>
  800548:	60e2                	ld	ra,24(sp)
  80054a:	6161                	addi	sp,sp,80
  80054c:	8082                	ret

000000000080054e <rand>:
  80054e:	00001697          	auipc	a3,0x1
  800552:	ab268693          	addi	a3,a3,-1358 # 801000 <next>
  800556:	00000717          	auipc	a4,0x0
  80055a:	5b270713          	addi	a4,a4,1458 # 800b08 <error_string+0x1c0>
  80055e:	629c                	ld	a5,0(a3)
  800560:	6318                	ld	a4,0(a4)
  800562:	02e787b3          	mul	a5,a5,a4
  800566:	80000737          	lui	a4,0x80000
  80056a:	fff74713          	not	a4,a4
  80056e:	07ad                	addi	a5,a5,11
  800570:	07c2                	slli	a5,a5,0x10
  800572:	83c1                	srli	a5,a5,0x10
  800574:	00c7d513          	srli	a0,a5,0xc
  800578:	02e57533          	remu	a0,a0,a4
  80057c:	e29c                	sd	a5,0(a3)
  80057e:	2505                	addiw	a0,a0,1
  800580:	8082                	ret

0000000000800582 <srand>:
  800582:	1502                	slli	a0,a0,0x20
  800584:	9101                	srli	a0,a0,0x20
  800586:	00001797          	auipc	a5,0x1
  80058a:	a6a7bd23          	sd	a0,-1414(a5) # 801000 <next>
  80058e:	8082                	ret

0000000000800590 <strnlen>:
  800590:	c185                	beqz	a1,8005b0 <strnlen+0x20>
  800592:	00054783          	lbu	a5,0(a0)
  800596:	cf89                	beqz	a5,8005b0 <strnlen+0x20>
  800598:	4781                	li	a5,0
  80059a:	a021                	j	8005a2 <strnlen+0x12>
  80059c:	00074703          	lbu	a4,0(a4) # ffffffff80000000 <matc+0xffffffff7f7fecd8>
  8005a0:	c711                	beqz	a4,8005ac <strnlen+0x1c>
  8005a2:	0785                	addi	a5,a5,1
  8005a4:	00f50733          	add	a4,a0,a5
  8005a8:	fef59ae3          	bne	a1,a5,80059c <strnlen+0xc>
  8005ac:	853e                	mv	a0,a5
  8005ae:	8082                	ret
  8005b0:	4781                	li	a5,0
  8005b2:	853e                	mv	a0,a5
  8005b4:	8082                	ret

00000000008005b6 <memset>:
  8005b6:	ca01                	beqz	a2,8005c6 <memset+0x10>
  8005b8:	962a                	add	a2,a2,a0
  8005ba:	87aa                	mv	a5,a0
  8005bc:	0785                	addi	a5,a5,1
  8005be:	feb78fa3          	sb	a1,-1(a5)
  8005c2:	fec79de3          	bne	a5,a2,8005bc <memset+0x6>
  8005c6:	8082                	ret

00000000008005c8 <work>:
  8005c8:	7179                	addi	sp,sp,-48
  8005ca:	e84a                	sd	s2,16(sp)
  8005cc:	00001597          	auipc	a1,0x1
  8005d0:	a1458593          	addi	a1,a1,-1516 # 800fe0 <error_string+0x698>
  8005d4:	00001917          	auipc	s2,0x1
  8005d8:	bc490913          	addi	s2,s2,-1084 # 801198 <matb>
  8005dc:	f022                	sd	s0,32(sp)
  8005de:	ec26                	sd	s1,24(sp)
  8005e0:	e44e                	sd	s3,8(sp)
  8005e2:	f406                	sd	ra,40(sp)
  8005e4:	84aa                	mv	s1,a0
  8005e6:	00001617          	auipc	a2,0x1
  8005ea:	bda60613          	addi	a2,a2,-1062 # 8011c0 <matb+0x28>
  8005ee:	00001417          	auipc	s0,0x1
  8005f2:	d6240413          	addi	s0,s0,-670 # 801350 <matc+0x28>
  8005f6:	00001997          	auipc	s3,0x1
  8005fa:	a1298993          	addi	s3,s3,-1518 # 801008 <mata>
  8005fe:	412585b3          	sub	a1,a1,s2
  800602:	4685                	li	a3,1
  800604:	fd860793          	addi	a5,a2,-40
  800608:	00c58733          	add	a4,a1,a2
  80060c:	c394                	sw	a3,0(a5)
  80060e:	c314                	sw	a3,0(a4)
  800610:	0791                	addi	a5,a5,4
  800612:	0711                	addi	a4,a4,4
  800614:	fec79ce3          	bne	a5,a2,80060c <work+0x44>
  800618:	02878613          	addi	a2,a5,40
  80061c:	fe8614e3          	bne	a2,s0,800604 <work+0x3c>
  800620:	b31ff0ef          	jal	ra,800150 <yield>
  800624:	b31ff0ef          	jal	ra,800154 <getpid>
  800628:	8626                	mv	a2,s1
  80062a:	85aa                	mv	a1,a0
  80062c:	00000517          	auipc	a0,0x0
  800630:	53450513          	addi	a0,a0,1332 # 800b60 <error_string+0x218>
  800634:	a6dff0ef          	jal	ra,8000a0 <cprintf>
  800638:	53fd                	li	t2,-1
  80063a:	34fd                	addiw	s1,s1,-1
  80063c:	00001297          	auipc	t0,0x1
  800640:	b5c28293          	addi	t0,t0,-1188 # 801198 <matb>
  800644:	00001f97          	auipc	t6,0x1
  800648:	ce4f8f93          	addi	t6,t6,-796 # 801328 <matc>
  80064c:	00001f17          	auipc	t5,0x1
  800650:	e6cf0f13          	addi	t5,t5,-404 # 8014b8 <matc+0x190>
  800654:	02800e13          	li	t3,40
  800658:	06748f63          	beq	s1,t2,8006d6 <work+0x10e>
  80065c:	00001897          	auipc	a7,0x1
  800660:	ccc88893          	addi	a7,a7,-820 # 801328 <matc>
  800664:	8ec6                	mv	t4,a7
  800666:	834e                	mv	t1,s3
  800668:	857e                	mv	a0,t6
  80066a:	8876                	mv	a6,t4
  80066c:	e7050793          	addi	a5,a0,-400
  800670:	869a                	mv	a3,t1
  800672:	4601                	li	a2,0
  800674:	4298                	lw	a4,0(a3)
  800676:	438c                	lw	a1,0(a5)
  800678:	02878793          	addi	a5,a5,40
  80067c:	0691                	addi	a3,a3,4
  80067e:	02b7073b          	mulw	a4,a4,a1
  800682:	9e39                	addw	a2,a2,a4
  800684:	fea798e3          	bne	a5,a0,800674 <work+0xac>
  800688:	00c82023          	sw	a2,0(a6)
  80068c:	00478513          	addi	a0,a5,4
  800690:	0811                	addi	a6,a6,4
  800692:	fc851de3          	bne	a0,s0,80066c <work+0xa4>
  800696:	02830313          	addi	t1,t1,40
  80069a:	028e8e93          	addi	t4,t4,40
  80069e:	fc5315e3          	bne	t1,t0,800668 <work+0xa0>
  8006a2:	854e                	mv	a0,s3
  8006a4:	85ca                	mv	a1,s2
  8006a6:	4781                	li	a5,0
  8006a8:	00f88733          	add	a4,a7,a5
  8006ac:	4318                	lw	a4,0(a4)
  8006ae:	00f58633          	add	a2,a1,a5
  8006b2:	00f506b3          	add	a3,a0,a5
  8006b6:	c218                	sw	a4,0(a2)
  8006b8:	c298                	sw	a4,0(a3)
  8006ba:	0791                	addi	a5,a5,4
  8006bc:	ffc796e3          	bne	a5,t3,8006a8 <work+0xe0>
  8006c0:	02888893          	addi	a7,a7,40
  8006c4:	02858593          	addi	a1,a1,40
  8006c8:	02850513          	addi	a0,a0,40
  8006cc:	fde89de3          	bne	a7,t5,8006a6 <work+0xde>
  8006d0:	34fd                	addiw	s1,s1,-1
  8006d2:	f87495e3          	bne	s1,t2,80065c <work+0x94>
  8006d6:	a7fff0ef          	jal	ra,800154 <getpid>
  8006da:	85aa                	mv	a1,a0
  8006dc:	00000517          	auipc	a0,0x0
  8006e0:	4a450513          	addi	a0,a0,1188 # 800b80 <error_string+0x238>
  8006e4:	9bdff0ef          	jal	ra,8000a0 <cprintf>
  8006e8:	4501                	li	a0,0
  8006ea:	a49ff0ef          	jal	ra,800132 <exit>

00000000008006ee <main>:
  8006ee:	7175                	addi	sp,sp,-144
  8006f0:	f4ce                	sd	s3,104(sp)
  8006f2:	05400613          	li	a2,84
  8006f6:	4581                	li	a1,0
  8006f8:	0028                	addi	a0,sp,8
  8006fa:	00810993          	addi	s3,sp,8
  8006fe:	e122                	sd	s0,128(sp)
  800700:	fca6                	sd	s1,120(sp)
  800702:	f8ca                	sd	s2,112(sp)
  800704:	e506                	sd	ra,136(sp)
  800706:	84ce                	mv	s1,s3
  800708:	eafff0ef          	jal	ra,8005b6 <memset>
  80070c:	4401                	li	s0,0
  80070e:	4955                	li	s2,21
  800710:	a39ff0ef          	jal	ra,800148 <fork>
  800714:	c088                	sw	a0,0(s1)
  800716:	cd2d                	beqz	a0,800790 <main+0xa2>
  800718:	04054663          	bltz	a0,800764 <main+0x76>
  80071c:	2405                	addiw	s0,s0,1
  80071e:	0491                	addi	s1,s1,4
  800720:	ff2418e3          	bne	s0,s2,800710 <main+0x22>
  800724:	00000517          	auipc	a0,0x0
  800728:	3ec50513          	addi	a0,a0,1004 # 800b10 <error_string+0x1c8>
  80072c:	975ff0ef          	jal	ra,8000a0 <cprintf>
  800730:	4455                	li	s0,21
  800732:	a19ff0ef          	jal	ra,80014a <wait>
  800736:	e10d                	bnez	a0,800758 <main+0x6a>
  800738:	347d                	addiw	s0,s0,-1
  80073a:	fc65                	bnez	s0,800732 <main+0x44>
  80073c:	00000517          	auipc	a0,0x0
  800740:	3f450513          	addi	a0,a0,1012 # 800b30 <error_string+0x1e8>
  800744:	95dff0ef          	jal	ra,8000a0 <cprintf>
  800748:	60aa                	ld	ra,136(sp)
  80074a:	640a                	ld	s0,128(sp)
  80074c:	74e6                	ld	s1,120(sp)
  80074e:	7946                	ld	s2,112(sp)
  800750:	79a6                	ld	s3,104(sp)
  800752:	4501                	li	a0,0
  800754:	6149                	addi	sp,sp,144
  800756:	8082                	ret
  800758:	00000517          	auipc	a0,0x0
  80075c:	3c850513          	addi	a0,a0,968 # 800b20 <error_string+0x1d8>
  800760:	941ff0ef          	jal	ra,8000a0 <cprintf>
  800764:	08e0                	addi	s0,sp,92
  800766:	0009a503          	lw	a0,0(s3)
  80076a:	00a05463          	blez	a0,800772 <main+0x84>
  80076e:	9e5ff0ef          	jal	ra,800152 <kill>
  800772:	0991                	addi	s3,s3,4
  800774:	ff3419e3          	bne	s0,s3,800766 <main+0x78>
  800778:	00000617          	auipc	a2,0x0
  80077c:	3c860613          	addi	a2,a2,968 # 800b40 <error_string+0x1f8>
  800780:	05200593          	li	a1,82
  800784:	00000517          	auipc	a0,0x0
  800788:	3cc50513          	addi	a0,a0,972 # 800b50 <error_string+0x208>
  80078c:	89bff0ef          	jal	ra,800026 <__panic>
  800790:	0284053b          	mulw	a0,s0,s0
  800794:	defff0ef          	jal	ra,800582 <srand>
  800798:	db7ff0ef          	jal	ra,80054e <rand>
  80079c:	47d5                	li	a5,21
  80079e:	02f5753b          	remuw	a0,a0,a5
  8007a2:	02a5053b          	mulw	a0,a0,a0
  8007a6:	00a5079b          	addiw	a5,a0,10
  8007aa:	06400513          	li	a0,100
  8007ae:	02f50533          	mul	a0,a0,a5
  8007b2:	e17ff0ef          	jal	ra,8005c8 <work>
