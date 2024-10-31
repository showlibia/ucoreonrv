
obj/__user_badarg.out：     文件格式 elf64-littleriscv


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
  800032:	62250513          	addi	a0,a0,1570 # 800650 <main+0xee>
  800036:	ec06                	sd	ra,24(sp)
  800038:	f436                	sd	a3,40(sp)
  80003a:	f83a                	sd	a4,48(sp)
  80003c:	e0c2                	sd	a6,64(sp)
  80003e:	e4c6                	sd	a7,72(sp)
  800040:	e43e                	sd	a5,8(sp)
  800042:	0ce000ef          	jal	ra,800110 <cprintf>
  800046:	65a2                	ld	a1,8(sp)
  800048:	8522                	mv	a0,s0
  80004a:	0a6000ef          	jal	ra,8000f0 <vcprintf>
  80004e:	00001517          	auipc	a0,0x1
  800052:	95a50513          	addi	a0,a0,-1702 # 8009a8 <error_string+0x1c8>
  800056:	0ba000ef          	jal	ra,800110 <cprintf>
  80005a:	5559                	li	a0,-10
  80005c:	058000ef          	jal	ra,8000b4 <exit>

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

00000000008000ae <sys_putc>:
  8000ae:	85aa                	mv	a1,a0
  8000b0:	4579                	li	a0,30
  8000b2:	b77d                	j	800060 <syscall>

00000000008000b4 <exit>:
  8000b4:	1141                	addi	sp,sp,-16
  8000b6:	e406                	sd	ra,8(sp)
  8000b8:	fe1ff0ef          	jal	ra,800098 <sys_exit>
  8000bc:	00000517          	auipc	a0,0x0
  8000c0:	5b450513          	addi	a0,a0,1460 # 800670 <main+0x10e>
  8000c4:	04c000ef          	jal	ra,800110 <cprintf>
  8000c8:	a001                	j	8000c8 <exit+0x14>

00000000008000ca <fork>:
  8000ca:	bfd1                	j	80009e <sys_fork>

00000000008000cc <waitpid>:
  8000cc:	bfd9                	j	8000a2 <sys_wait>

00000000008000ce <yield>:
  8000ce:	bff1                	j	8000aa <sys_yield>

00000000008000d0 <_start>:
  8000d0:	074000ef          	jal	ra,800144 <umain>
  8000d4:	a001                	j	8000d4 <_start+0x4>

00000000008000d6 <cputch>:
  8000d6:	1141                	addi	sp,sp,-16
  8000d8:	e022                	sd	s0,0(sp)
  8000da:	e406                	sd	ra,8(sp)
  8000dc:	842e                	mv	s0,a1
  8000de:	fd1ff0ef          	jal	ra,8000ae <sys_putc>
  8000e2:	401c                	lw	a5,0(s0)
  8000e4:	60a2                	ld	ra,8(sp)
  8000e6:	2785                	addiw	a5,a5,1
  8000e8:	c01c                	sw	a5,0(s0)
  8000ea:	6402                	ld	s0,0(sp)
  8000ec:	0141                	addi	sp,sp,16
  8000ee:	8082                	ret

00000000008000f0 <vcprintf>:
  8000f0:	1101                	addi	sp,sp,-32
  8000f2:	86ae                	mv	a3,a1
  8000f4:	862a                	mv	a2,a0
  8000f6:	006c                	addi	a1,sp,12
  8000f8:	00000517          	auipc	a0,0x0
  8000fc:	fde50513          	addi	a0,a0,-34 # 8000d6 <cputch>
  800100:	ec06                	sd	ra,24(sp)
  800102:	c602                	sw	zero,12(sp)
  800104:	0de000ef          	jal	ra,8001e2 <vprintfmt>
  800108:	60e2                	ld	ra,24(sp)
  80010a:	4532                	lw	a0,12(sp)
  80010c:	6105                	addi	sp,sp,32
  80010e:	8082                	ret

0000000000800110 <cprintf>:
  800110:	711d                	addi	sp,sp,-96
  800112:	02810313          	addi	t1,sp,40
  800116:	f42e                	sd	a1,40(sp)
  800118:	f832                	sd	a2,48(sp)
  80011a:	fc36                	sd	a3,56(sp)
  80011c:	862a                	mv	a2,a0
  80011e:	004c                	addi	a1,sp,4
  800120:	00000517          	auipc	a0,0x0
  800124:	fb650513          	addi	a0,a0,-74 # 8000d6 <cputch>
  800128:	869a                	mv	a3,t1
  80012a:	ec06                	sd	ra,24(sp)
  80012c:	e0ba                	sd	a4,64(sp)
  80012e:	e4be                	sd	a5,72(sp)
  800130:	e8c2                	sd	a6,80(sp)
  800132:	ecc6                	sd	a7,88(sp)
  800134:	e41a                	sd	t1,8(sp)
  800136:	c202                	sw	zero,4(sp)
  800138:	0aa000ef          	jal	ra,8001e2 <vprintfmt>
  80013c:	60e2                	ld	ra,24(sp)
  80013e:	4512                	lw	a0,4(sp)
  800140:	6125                	addi	sp,sp,96
  800142:	8082                	ret

0000000000800144 <umain>:
  800144:	1141                	addi	sp,sp,-16
  800146:	e406                	sd	ra,8(sp)
  800148:	41a000ef          	jal	ra,800562 <main>
  80014c:	f69ff0ef          	jal	ra,8000b4 <exit>

0000000000800150 <strnlen>:
  800150:	c185                	beqz	a1,800170 <strnlen+0x20>
  800152:	00054783          	lbu	a5,0(a0)
  800156:	cf89                	beqz	a5,800170 <strnlen+0x20>
  800158:	4781                	li	a5,0
  80015a:	a021                	j	800162 <strnlen+0x12>
  80015c:	00074703          	lbu	a4,0(a4)
  800160:	c711                	beqz	a4,80016c <strnlen+0x1c>
  800162:	0785                	addi	a5,a5,1
  800164:	00f50733          	add	a4,a0,a5
  800168:	fef59ae3          	bne	a1,a5,80015c <strnlen+0xc>
  80016c:	853e                	mv	a0,a5
  80016e:	8082                	ret
  800170:	4781                	li	a5,0
  800172:	853e                	mv	a0,a5
  800174:	8082                	ret

0000000000800176 <printnum>:
  800176:	02069813          	slli	a6,a3,0x20
  80017a:	7179                	addi	sp,sp,-48
  80017c:	02085813          	srli	a6,a6,0x20
  800180:	e052                	sd	s4,0(sp)
  800182:	03067a33          	remu	s4,a2,a6
  800186:	f022                	sd	s0,32(sp)
  800188:	ec26                	sd	s1,24(sp)
  80018a:	e84a                	sd	s2,16(sp)
  80018c:	f406                	sd	ra,40(sp)
  80018e:	e44e                	sd	s3,8(sp)
  800190:	84aa                	mv	s1,a0
  800192:	892e                	mv	s2,a1
  800194:	fff7041b          	addiw	s0,a4,-1
  800198:	2a01                	sext.w	s4,s4
  80019a:	03067e63          	bgeu	a2,a6,8001d6 <printnum+0x60>
  80019e:	89be                	mv	s3,a5
  8001a0:	00805763          	blez	s0,8001ae <printnum+0x38>
  8001a4:	347d                	addiw	s0,s0,-1
  8001a6:	85ca                	mv	a1,s2
  8001a8:	854e                	mv	a0,s3
  8001aa:	9482                	jalr	s1
  8001ac:	fc65                	bnez	s0,8001a4 <printnum+0x2e>
  8001ae:	1a02                	slli	s4,s4,0x20
  8001b0:	020a5a13          	srli	s4,s4,0x20
  8001b4:	00000797          	auipc	a5,0x0
  8001b8:	6f478793          	addi	a5,a5,1780 # 8008a8 <error_string+0xc8>
  8001bc:	9a3e                	add	s4,s4,a5
  8001be:	7402                	ld	s0,32(sp)
  8001c0:	000a4503          	lbu	a0,0(s4)
  8001c4:	70a2                	ld	ra,40(sp)
  8001c6:	69a2                	ld	s3,8(sp)
  8001c8:	6a02                	ld	s4,0(sp)
  8001ca:	85ca                	mv	a1,s2
  8001cc:	8326                	mv	t1,s1
  8001ce:	6942                	ld	s2,16(sp)
  8001d0:	64e2                	ld	s1,24(sp)
  8001d2:	6145                	addi	sp,sp,48
  8001d4:	8302                	jr	t1
  8001d6:	03065633          	divu	a2,a2,a6
  8001da:	8722                	mv	a4,s0
  8001dc:	f9bff0ef          	jal	ra,800176 <printnum>
  8001e0:	b7f9                	j	8001ae <printnum+0x38>

00000000008001e2 <vprintfmt>:
  8001e2:	7119                	addi	sp,sp,-128
  8001e4:	f4a6                	sd	s1,104(sp)
  8001e6:	f0ca                	sd	s2,96(sp)
  8001e8:	e8d2                	sd	s4,80(sp)
  8001ea:	e4d6                	sd	s5,72(sp)
  8001ec:	e0da                	sd	s6,64(sp)
  8001ee:	fc5e                	sd	s7,56(sp)
  8001f0:	f862                	sd	s8,48(sp)
  8001f2:	f06a                	sd	s10,32(sp)
  8001f4:	fc86                	sd	ra,120(sp)
  8001f6:	f8a2                	sd	s0,112(sp)
  8001f8:	ecce                	sd	s3,88(sp)
  8001fa:	f466                	sd	s9,40(sp)
  8001fc:	ec6e                	sd	s11,24(sp)
  8001fe:	892a                	mv	s2,a0
  800200:	84ae                	mv	s1,a1
  800202:	8d32                	mv	s10,a2
  800204:	8ab6                	mv	s5,a3
  800206:	5b7d                	li	s6,-1
  800208:	00000a17          	auipc	s4,0x0
  80020c:	47ca0a13          	addi	s4,s4,1148 # 800684 <main+0x122>
  800210:	05e00b93          	li	s7,94
  800214:	00000c17          	auipc	s8,0x0
  800218:	5ccc0c13          	addi	s8,s8,1484 # 8007e0 <error_string>
  80021c:	000d4503          	lbu	a0,0(s10)
  800220:	02500793          	li	a5,37
  800224:	001d0413          	addi	s0,s10,1
  800228:	00f50e63          	beq	a0,a5,800244 <vprintfmt+0x62>
  80022c:	c521                	beqz	a0,800274 <vprintfmt+0x92>
  80022e:	02500993          	li	s3,37
  800232:	a011                	j	800236 <vprintfmt+0x54>
  800234:	c121                	beqz	a0,800274 <vprintfmt+0x92>
  800236:	85a6                	mv	a1,s1
  800238:	0405                	addi	s0,s0,1
  80023a:	9902                	jalr	s2
  80023c:	fff44503          	lbu	a0,-1(s0)
  800240:	ff351ae3          	bne	a0,s3,800234 <vprintfmt+0x52>
  800244:	00044603          	lbu	a2,0(s0)
  800248:	02000793          	li	a5,32
  80024c:	4981                	li	s3,0
  80024e:	4801                	li	a6,0
  800250:	5cfd                	li	s9,-1
  800252:	5dfd                	li	s11,-1
  800254:	05500593          	li	a1,85
  800258:	4525                	li	a0,9
  80025a:	fdd6069b          	addiw	a3,a2,-35
  80025e:	0ff6f693          	andi	a3,a3,255
  800262:	00140d13          	addi	s10,s0,1
  800266:	1ed5ef63          	bltu	a1,a3,800464 <vprintfmt+0x282>
  80026a:	068a                	slli	a3,a3,0x2
  80026c:	96d2                	add	a3,a3,s4
  80026e:	4294                	lw	a3,0(a3)
  800270:	96d2                	add	a3,a3,s4
  800272:	8682                	jr	a3
  800274:	70e6                	ld	ra,120(sp)
  800276:	7446                	ld	s0,112(sp)
  800278:	74a6                	ld	s1,104(sp)
  80027a:	7906                	ld	s2,96(sp)
  80027c:	69e6                	ld	s3,88(sp)
  80027e:	6a46                	ld	s4,80(sp)
  800280:	6aa6                	ld	s5,72(sp)
  800282:	6b06                	ld	s6,64(sp)
  800284:	7be2                	ld	s7,56(sp)
  800286:	7c42                	ld	s8,48(sp)
  800288:	7ca2                	ld	s9,40(sp)
  80028a:	7d02                	ld	s10,32(sp)
  80028c:	6de2                	ld	s11,24(sp)
  80028e:	6109                	addi	sp,sp,128
  800290:	8082                	ret
  800292:	87b2                	mv	a5,a2
  800294:	00144603          	lbu	a2,1(s0)
  800298:	846a                	mv	s0,s10
  80029a:	b7c1                	j	80025a <vprintfmt+0x78>
  80029c:	000aac83          	lw	s9,0(s5)
  8002a0:	00144603          	lbu	a2,1(s0)
  8002a4:	0aa1                	addi	s5,s5,8
  8002a6:	846a                	mv	s0,s10
  8002a8:	fa0dd9e3          	bgez	s11,80025a <vprintfmt+0x78>
  8002ac:	8de6                	mv	s11,s9
  8002ae:	5cfd                	li	s9,-1
  8002b0:	b76d                	j	80025a <vprintfmt+0x78>
  8002b2:	fffdc693          	not	a3,s11
  8002b6:	96fd                	srai	a3,a3,0x3f
  8002b8:	00ddfdb3          	and	s11,s11,a3
  8002bc:	00144603          	lbu	a2,1(s0)
  8002c0:	2d81                	sext.w	s11,s11
  8002c2:	846a                	mv	s0,s10
  8002c4:	bf59                	j	80025a <vprintfmt+0x78>
  8002c6:	4705                	li	a4,1
  8002c8:	008a8593          	addi	a1,s5,8
  8002cc:	01074463          	blt	a4,a6,8002d4 <vprintfmt+0xf2>
  8002d0:	22080863          	beqz	a6,800500 <vprintfmt+0x31e>
  8002d4:	000ab603          	ld	a2,0(s5)
  8002d8:	46c1                	li	a3,16
  8002da:	8aae                	mv	s5,a1
  8002dc:	a291                	j	800420 <vprintfmt+0x23e>
  8002de:	fd060c9b          	addiw	s9,a2,-48
  8002e2:	00144603          	lbu	a2,1(s0)
  8002e6:	846a                	mv	s0,s10
  8002e8:	fd06069b          	addiw	a3,a2,-48
  8002ec:	0006089b          	sext.w	a7,a2
  8002f0:	fad56ce3          	bltu	a0,a3,8002a8 <vprintfmt+0xc6>
  8002f4:	0405                	addi	s0,s0,1
  8002f6:	002c969b          	slliw	a3,s9,0x2
  8002fa:	00044603          	lbu	a2,0(s0)
  8002fe:	0196873b          	addw	a4,a3,s9
  800302:	0017171b          	slliw	a4,a4,0x1
  800306:	0117073b          	addw	a4,a4,a7
  80030a:	fd06069b          	addiw	a3,a2,-48
  80030e:	fd070c9b          	addiw	s9,a4,-48
  800312:	0006089b          	sext.w	a7,a2
  800316:	fcd57fe3          	bgeu	a0,a3,8002f4 <vprintfmt+0x112>
  80031a:	b779                	j	8002a8 <vprintfmt+0xc6>
  80031c:	000aa503          	lw	a0,0(s5)
  800320:	85a6                	mv	a1,s1
  800322:	0aa1                	addi	s5,s5,8
  800324:	9902                	jalr	s2
  800326:	bddd                	j	80021c <vprintfmt+0x3a>
  800328:	4705                	li	a4,1
  80032a:	008a8993          	addi	s3,s5,8
  80032e:	01074463          	blt	a4,a6,800336 <vprintfmt+0x154>
  800332:	1c080463          	beqz	a6,8004fa <vprintfmt+0x318>
  800336:	000ab403          	ld	s0,0(s5)
  80033a:	1c044a63          	bltz	s0,80050e <vprintfmt+0x32c>
  80033e:	8622                	mv	a2,s0
  800340:	8ace                	mv	s5,s3
  800342:	46a9                	li	a3,10
  800344:	a8f1                	j	800420 <vprintfmt+0x23e>
  800346:	000aa783          	lw	a5,0(s5)
  80034a:	4761                	li	a4,24
  80034c:	0aa1                	addi	s5,s5,8
  80034e:	41f7d69b          	sraiw	a3,a5,0x1f
  800352:	8fb5                	xor	a5,a5,a3
  800354:	40d786bb          	subw	a3,a5,a3
  800358:	12d74963          	blt	a4,a3,80048a <vprintfmt+0x2a8>
  80035c:	00369793          	slli	a5,a3,0x3
  800360:	97e2                	add	a5,a5,s8
  800362:	639c                	ld	a5,0(a5)
  800364:	12078363          	beqz	a5,80048a <vprintfmt+0x2a8>
  800368:	86be                	mv	a3,a5
  80036a:	00000617          	auipc	a2,0x0
  80036e:	62e60613          	addi	a2,a2,1582 # 800998 <error_string+0x1b8>
  800372:	85a6                	mv	a1,s1
  800374:	854a                	mv	a0,s2
  800376:	1cc000ef          	jal	ra,800542 <printfmt>
  80037a:	b54d                	j	80021c <vprintfmt+0x3a>
  80037c:	000ab603          	ld	a2,0(s5)
  800380:	0aa1                	addi	s5,s5,8
  800382:	1a060163          	beqz	a2,800524 <vprintfmt+0x342>
  800386:	00160413          	addi	s0,a2,1
  80038a:	15b05763          	blez	s11,8004d8 <vprintfmt+0x2f6>
  80038e:	02d00593          	li	a1,45
  800392:	10b79d63          	bne	a5,a1,8004ac <vprintfmt+0x2ca>
  800396:	00064783          	lbu	a5,0(a2)
  80039a:	0007851b          	sext.w	a0,a5
  80039e:	c905                	beqz	a0,8003ce <vprintfmt+0x1ec>
  8003a0:	000cc563          	bltz	s9,8003aa <vprintfmt+0x1c8>
  8003a4:	3cfd                	addiw	s9,s9,-1
  8003a6:	036c8263          	beq	s9,s6,8003ca <vprintfmt+0x1e8>
  8003aa:	85a6                	mv	a1,s1
  8003ac:	14098f63          	beqz	s3,80050a <vprintfmt+0x328>
  8003b0:	3781                	addiw	a5,a5,-32
  8003b2:	14fbfc63          	bgeu	s7,a5,80050a <vprintfmt+0x328>
  8003b6:	03f00513          	li	a0,63
  8003ba:	9902                	jalr	s2
  8003bc:	0405                	addi	s0,s0,1
  8003be:	fff44783          	lbu	a5,-1(s0)
  8003c2:	3dfd                	addiw	s11,s11,-1
  8003c4:	0007851b          	sext.w	a0,a5
  8003c8:	fd61                	bnez	a0,8003a0 <vprintfmt+0x1be>
  8003ca:	e5b059e3          	blez	s11,80021c <vprintfmt+0x3a>
  8003ce:	3dfd                	addiw	s11,s11,-1
  8003d0:	85a6                	mv	a1,s1
  8003d2:	02000513          	li	a0,32
  8003d6:	9902                	jalr	s2
  8003d8:	e40d82e3          	beqz	s11,80021c <vprintfmt+0x3a>
  8003dc:	3dfd                	addiw	s11,s11,-1
  8003de:	85a6                	mv	a1,s1
  8003e0:	02000513          	li	a0,32
  8003e4:	9902                	jalr	s2
  8003e6:	fe0d94e3          	bnez	s11,8003ce <vprintfmt+0x1ec>
  8003ea:	bd0d                	j	80021c <vprintfmt+0x3a>
  8003ec:	4705                	li	a4,1
  8003ee:	008a8593          	addi	a1,s5,8
  8003f2:	01074463          	blt	a4,a6,8003fa <vprintfmt+0x218>
  8003f6:	0e080863          	beqz	a6,8004e6 <vprintfmt+0x304>
  8003fa:	000ab603          	ld	a2,0(s5)
  8003fe:	46a1                	li	a3,8
  800400:	8aae                	mv	s5,a1
  800402:	a839                	j	800420 <vprintfmt+0x23e>
  800404:	03000513          	li	a0,48
  800408:	85a6                	mv	a1,s1
  80040a:	e03e                	sd	a5,0(sp)
  80040c:	9902                	jalr	s2
  80040e:	85a6                	mv	a1,s1
  800410:	07800513          	li	a0,120
  800414:	9902                	jalr	s2
  800416:	0aa1                	addi	s5,s5,8
  800418:	ff8ab603          	ld	a2,-8(s5)
  80041c:	6782                	ld	a5,0(sp)
  80041e:	46c1                	li	a3,16
  800420:	2781                	sext.w	a5,a5
  800422:	876e                	mv	a4,s11
  800424:	85a6                	mv	a1,s1
  800426:	854a                	mv	a0,s2
  800428:	d4fff0ef          	jal	ra,800176 <printnum>
  80042c:	bbc5                	j	80021c <vprintfmt+0x3a>
  80042e:	00144603          	lbu	a2,1(s0)
  800432:	2805                	addiw	a6,a6,1
  800434:	846a                	mv	s0,s10
  800436:	b515                	j	80025a <vprintfmt+0x78>
  800438:	00144603          	lbu	a2,1(s0)
  80043c:	4985                	li	s3,1
  80043e:	846a                	mv	s0,s10
  800440:	bd29                	j	80025a <vprintfmt+0x78>
  800442:	85a6                	mv	a1,s1
  800444:	02500513          	li	a0,37
  800448:	9902                	jalr	s2
  80044a:	bbc9                	j	80021c <vprintfmt+0x3a>
  80044c:	4705                	li	a4,1
  80044e:	008a8593          	addi	a1,s5,8
  800452:	01074463          	blt	a4,a6,80045a <vprintfmt+0x278>
  800456:	08080d63          	beqz	a6,8004f0 <vprintfmt+0x30e>
  80045a:	000ab603          	ld	a2,0(s5)
  80045e:	46a9                	li	a3,10
  800460:	8aae                	mv	s5,a1
  800462:	bf7d                	j	800420 <vprintfmt+0x23e>
  800464:	85a6                	mv	a1,s1
  800466:	02500513          	li	a0,37
  80046a:	9902                	jalr	s2
  80046c:	fff44703          	lbu	a4,-1(s0)
  800470:	02500793          	li	a5,37
  800474:	8d22                	mv	s10,s0
  800476:	daf703e3          	beq	a4,a5,80021c <vprintfmt+0x3a>
  80047a:	02500713          	li	a4,37
  80047e:	1d7d                	addi	s10,s10,-1
  800480:	fffd4783          	lbu	a5,-1(s10)
  800484:	fee79de3          	bne	a5,a4,80047e <vprintfmt+0x29c>
  800488:	bb51                	j	80021c <vprintfmt+0x3a>
  80048a:	00000617          	auipc	a2,0x0
  80048e:	4fe60613          	addi	a2,a2,1278 # 800988 <error_string+0x1a8>
  800492:	85a6                	mv	a1,s1
  800494:	854a                	mv	a0,s2
  800496:	0ac000ef          	jal	ra,800542 <printfmt>
  80049a:	b349                	j	80021c <vprintfmt+0x3a>
  80049c:	00000617          	auipc	a2,0x0
  8004a0:	4e460613          	addi	a2,a2,1252 # 800980 <error_string+0x1a0>
  8004a4:	00000417          	auipc	s0,0x0
  8004a8:	4dd40413          	addi	s0,s0,1245 # 800981 <error_string+0x1a1>
  8004ac:	8532                	mv	a0,a2
  8004ae:	85e6                	mv	a1,s9
  8004b0:	e032                	sd	a2,0(sp)
  8004b2:	e43e                	sd	a5,8(sp)
  8004b4:	c9dff0ef          	jal	ra,800150 <strnlen>
  8004b8:	40ad8dbb          	subw	s11,s11,a0
  8004bc:	6602                	ld	a2,0(sp)
  8004be:	01b05d63          	blez	s11,8004d8 <vprintfmt+0x2f6>
  8004c2:	67a2                	ld	a5,8(sp)
  8004c4:	2781                	sext.w	a5,a5
  8004c6:	e43e                	sd	a5,8(sp)
  8004c8:	6522                	ld	a0,8(sp)
  8004ca:	85a6                	mv	a1,s1
  8004cc:	e032                	sd	a2,0(sp)
  8004ce:	3dfd                	addiw	s11,s11,-1
  8004d0:	9902                	jalr	s2
  8004d2:	6602                	ld	a2,0(sp)
  8004d4:	fe0d9ae3          	bnez	s11,8004c8 <vprintfmt+0x2e6>
  8004d8:	00064783          	lbu	a5,0(a2)
  8004dc:	0007851b          	sext.w	a0,a5
  8004e0:	ec0510e3          	bnez	a0,8003a0 <vprintfmt+0x1be>
  8004e4:	bb25                	j	80021c <vprintfmt+0x3a>
  8004e6:	000ae603          	lwu	a2,0(s5)
  8004ea:	46a1                	li	a3,8
  8004ec:	8aae                	mv	s5,a1
  8004ee:	bf0d                	j	800420 <vprintfmt+0x23e>
  8004f0:	000ae603          	lwu	a2,0(s5)
  8004f4:	46a9                	li	a3,10
  8004f6:	8aae                	mv	s5,a1
  8004f8:	b725                	j	800420 <vprintfmt+0x23e>
  8004fa:	000aa403          	lw	s0,0(s5)
  8004fe:	bd35                	j	80033a <vprintfmt+0x158>
  800500:	000ae603          	lwu	a2,0(s5)
  800504:	46c1                	li	a3,16
  800506:	8aae                	mv	s5,a1
  800508:	bf21                	j	800420 <vprintfmt+0x23e>
  80050a:	9902                	jalr	s2
  80050c:	bd45                	j	8003bc <vprintfmt+0x1da>
  80050e:	85a6                	mv	a1,s1
  800510:	02d00513          	li	a0,45
  800514:	e03e                	sd	a5,0(sp)
  800516:	9902                	jalr	s2
  800518:	8ace                	mv	s5,s3
  80051a:	40800633          	neg	a2,s0
  80051e:	46a9                	li	a3,10
  800520:	6782                	ld	a5,0(sp)
  800522:	bdfd                	j	800420 <vprintfmt+0x23e>
  800524:	01b05663          	blez	s11,800530 <vprintfmt+0x34e>
  800528:	02d00693          	li	a3,45
  80052c:	f6d798e3          	bne	a5,a3,80049c <vprintfmt+0x2ba>
  800530:	00000417          	auipc	s0,0x0
  800534:	45140413          	addi	s0,s0,1105 # 800981 <error_string+0x1a1>
  800538:	02800513          	li	a0,40
  80053c:	02800793          	li	a5,40
  800540:	b585                	j	8003a0 <vprintfmt+0x1be>

0000000000800542 <printfmt>:
  800542:	715d                	addi	sp,sp,-80
  800544:	02810313          	addi	t1,sp,40
  800548:	f436                	sd	a3,40(sp)
  80054a:	869a                	mv	a3,t1
  80054c:	ec06                	sd	ra,24(sp)
  80054e:	f83a                	sd	a4,48(sp)
  800550:	fc3e                	sd	a5,56(sp)
  800552:	e0c2                	sd	a6,64(sp)
  800554:	e4c6                	sd	a7,72(sp)
  800556:	e41a                	sd	t1,8(sp)
  800558:	c8bff0ef          	jal	ra,8001e2 <vprintfmt>
  80055c:	60e2                	ld	ra,24(sp)
  80055e:	6161                	addi	sp,sp,80
  800560:	8082                	ret

0000000000800562 <main>:
  800562:	1101                	addi	sp,sp,-32
  800564:	ec06                	sd	ra,24(sp)
  800566:	e822                	sd	s0,16(sp)
  800568:	b63ff0ef          	jal	ra,8000ca <fork>
  80056c:	c169                	beqz	a0,80062e <main+0xcc>
  80056e:	842a                	mv	s0,a0
  800570:	0aa05063          	blez	a0,800610 <main+0xae>
  800574:	4581                	li	a1,0
  800576:	557d                	li	a0,-1
  800578:	b55ff0ef          	jal	ra,8000cc <waitpid>
  80057c:	c93d                	beqz	a0,8005f2 <main+0x90>
  80057e:	458d                	li	a1,3
  800580:	05fa                	slli	a1,a1,0x1e
  800582:	8522                	mv	a0,s0
  800584:	b49ff0ef          	jal	ra,8000cc <waitpid>
  800588:	c531                	beqz	a0,8005d4 <main+0x72>
  80058a:	006c                	addi	a1,sp,12
  80058c:	8522                	mv	a0,s0
  80058e:	b3fff0ef          	jal	ra,8000cc <waitpid>
  800592:	e115                	bnez	a0,8005b6 <main+0x54>
  800594:	4732                	lw	a4,12(sp)
  800596:	67b1                	lui	a5,0xc
  800598:	eaf78793          	addi	a5,a5,-337 # beaf <__panic-0x7f4171>
  80059c:	00f71d63          	bne	a4,a5,8005b6 <main+0x54>
  8005a0:	00000517          	auipc	a0,0x0
  8005a4:	4b850513          	addi	a0,a0,1208 # 800a58 <error_string+0x278>
  8005a8:	b69ff0ef          	jal	ra,800110 <cprintf>
  8005ac:	60e2                	ld	ra,24(sp)
  8005ae:	6442                	ld	s0,16(sp)
  8005b0:	4501                	li	a0,0
  8005b2:	6105                	addi	sp,sp,32
  8005b4:	8082                	ret
  8005b6:	00000697          	auipc	a3,0x0
  8005ba:	46a68693          	addi	a3,a3,1130 # 800a20 <error_string+0x240>
  8005be:	00000617          	auipc	a2,0x0
  8005c2:	3fa60613          	addi	a2,a2,1018 # 8009b8 <error_string+0x1d8>
  8005c6:	45c9                	li	a1,18
  8005c8:	00000517          	auipc	a0,0x0
  8005cc:	40850513          	addi	a0,a0,1032 # 8009d0 <error_string+0x1f0>
  8005d0:	a51ff0ef          	jal	ra,800020 <__panic>
  8005d4:	00000697          	auipc	a3,0x0
  8005d8:	42468693          	addi	a3,a3,1060 # 8009f8 <error_string+0x218>
  8005dc:	00000617          	auipc	a2,0x0
  8005e0:	3dc60613          	addi	a2,a2,988 # 8009b8 <error_string+0x1d8>
  8005e4:	45c5                	li	a1,17
  8005e6:	00000517          	auipc	a0,0x0
  8005ea:	3ea50513          	addi	a0,a0,1002 # 8009d0 <error_string+0x1f0>
  8005ee:	a33ff0ef          	jal	ra,800020 <__panic>
  8005f2:	00000697          	auipc	a3,0x0
  8005f6:	3ee68693          	addi	a3,a3,1006 # 8009e0 <error_string+0x200>
  8005fa:	00000617          	auipc	a2,0x0
  8005fe:	3be60613          	addi	a2,a2,958 # 8009b8 <error_string+0x1d8>
  800602:	45c1                	li	a1,16
  800604:	00000517          	auipc	a0,0x0
  800608:	3cc50513          	addi	a0,a0,972 # 8009d0 <error_string+0x1f0>
  80060c:	a15ff0ef          	jal	ra,800020 <__panic>
  800610:	00000697          	auipc	a3,0x0
  800614:	3a068693          	addi	a3,a3,928 # 8009b0 <error_string+0x1d0>
  800618:	00000617          	auipc	a2,0x0
  80061c:	3a060613          	addi	a2,a2,928 # 8009b8 <error_string+0x1d8>
  800620:	45bd                	li	a1,15
  800622:	00000517          	auipc	a0,0x0
  800626:	3ae50513          	addi	a0,a0,942 # 8009d0 <error_string+0x1f0>
  80062a:	9f7ff0ef          	jal	ra,800020 <__panic>
  80062e:	00000517          	auipc	a0,0x0
  800632:	37250513          	addi	a0,a0,882 # 8009a0 <error_string+0x1c0>
  800636:	adbff0ef          	jal	ra,800110 <cprintf>
  80063a:	4429                	li	s0,10
  80063c:	347d                	addiw	s0,s0,-1
  80063e:	a91ff0ef          	jal	ra,8000ce <yield>
  800642:	fc6d                	bnez	s0,80063c <main+0xda>
  800644:	6531                	lui	a0,0xc
  800646:	eaf50513          	addi	a0,a0,-337 # beaf <__panic-0x7f4171>
  80064a:	a6bff0ef          	jal	ra,8000b4 <exit>
