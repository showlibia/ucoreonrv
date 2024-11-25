
obj/__user_spin.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	12c000ef          	jal	ra,80014c <umain>
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
  800038:	60450513          	addi	a0,a0,1540 # 800638 <main+0xce>
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
  800058:	60450513          	addi	a0,a0,1540 # 800658 <main+0xee>
  80005c:	044000ef          	jal	ra,8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0cc000ef          	jal	ra,80012e <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0ba000ef          	jal	ra,800128 <sys_putc>
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
  800094:	130000ef          	jal	ra,8001c4 <vprintfmt>
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
  8000c8:	0fc000ef          	jal	ra,8001c4 <vprintfmt>
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

0000000000800128 <sys_putc>:
  800128:	85aa                	mv	a1,a0
  80012a:	4579                	li	a0,30
  80012c:	b765                	j	8000d4 <syscall>

000000000080012e <exit>:
  80012e:	1141                	addi	sp,sp,-16
  800130:	e406                	sd	ra,8(sp)
  800132:	fdbff0ef          	jal	ra,80010c <sys_exit>
  800136:	00000517          	auipc	a0,0x0
  80013a:	52a50513          	addi	a0,a0,1322 # 800660 <main+0xf6>
  80013e:	f63ff0ef          	jal	ra,8000a0 <cprintf>
  800142:	a001                	j	800142 <exit+0x14>

0000000000800144 <fork>:
  800144:	b7f9                	j	800112 <sys_fork>

0000000000800146 <waitpid>:
  800146:	bfc1                	j	800116 <sys_wait>

0000000000800148 <yield>:
  800148:	bfd9                	j	80011e <sys_yield>

000000000080014a <kill>:
  80014a:	bfe1                	j	800122 <sys_kill>

000000000080014c <umain>:
  80014c:	1141                	addi	sp,sp,-16
  80014e:	e406                	sd	ra,8(sp)
  800150:	41a000ef          	jal	ra,80056a <main>
  800154:	fdbff0ef          	jal	ra,80012e <exit>

0000000000800158 <printnum>:
  800158:	02069813          	slli	a6,a3,0x20
  80015c:	7179                	addi	sp,sp,-48
  80015e:	02085813          	srli	a6,a6,0x20
  800162:	e052                	sd	s4,0(sp)
  800164:	03067a33          	remu	s4,a2,a6
  800168:	f022                	sd	s0,32(sp)
  80016a:	ec26                	sd	s1,24(sp)
  80016c:	e84a                	sd	s2,16(sp)
  80016e:	f406                	sd	ra,40(sp)
  800170:	e44e                	sd	s3,8(sp)
  800172:	84aa                	mv	s1,a0
  800174:	892e                	mv	s2,a1
  800176:	fff7041b          	addiw	s0,a4,-1
  80017a:	2a01                	sext.w	s4,s4
  80017c:	03067e63          	bgeu	a2,a6,8001b8 <printnum+0x60>
  800180:	89be                	mv	s3,a5
  800182:	00805763          	blez	s0,800190 <printnum+0x38>
  800186:	347d                	addiw	s0,s0,-1
  800188:	85ca                	mv	a1,s2
  80018a:	854e                	mv	a0,s3
  80018c:	9482                	jalr	s1
  80018e:	fc65                	bnez	s0,800186 <printnum+0x2e>
  800190:	1a02                	slli	s4,s4,0x20
  800192:	020a5a13          	srli	s4,s4,0x20
  800196:	00000797          	auipc	a5,0x0
  80019a:	70278793          	addi	a5,a5,1794 # 800898 <error_string+0xc8>
  80019e:	9a3e                	add	s4,s4,a5
  8001a0:	7402                	ld	s0,32(sp)
  8001a2:	000a4503          	lbu	a0,0(s4)
  8001a6:	70a2                	ld	ra,40(sp)
  8001a8:	69a2                	ld	s3,8(sp)
  8001aa:	6a02                	ld	s4,0(sp)
  8001ac:	85ca                	mv	a1,s2
  8001ae:	8326                	mv	t1,s1
  8001b0:	6942                	ld	s2,16(sp)
  8001b2:	64e2                	ld	s1,24(sp)
  8001b4:	6145                	addi	sp,sp,48
  8001b6:	8302                	jr	t1
  8001b8:	03065633          	divu	a2,a2,a6
  8001bc:	8722                	mv	a4,s0
  8001be:	f9bff0ef          	jal	ra,800158 <printnum>
  8001c2:	b7f9                	j	800190 <printnum+0x38>

00000000008001c4 <vprintfmt>:
  8001c4:	7119                	addi	sp,sp,-128
  8001c6:	f4a6                	sd	s1,104(sp)
  8001c8:	f0ca                	sd	s2,96(sp)
  8001ca:	e8d2                	sd	s4,80(sp)
  8001cc:	e4d6                	sd	s5,72(sp)
  8001ce:	e0da                	sd	s6,64(sp)
  8001d0:	fc5e                	sd	s7,56(sp)
  8001d2:	f862                	sd	s8,48(sp)
  8001d4:	f06a                	sd	s10,32(sp)
  8001d6:	fc86                	sd	ra,120(sp)
  8001d8:	f8a2                	sd	s0,112(sp)
  8001da:	ecce                	sd	s3,88(sp)
  8001dc:	f466                	sd	s9,40(sp)
  8001de:	ec6e                	sd	s11,24(sp)
  8001e0:	892a                	mv	s2,a0
  8001e2:	84ae                	mv	s1,a1
  8001e4:	8d32                	mv	s10,a2
  8001e6:	8ab6                	mv	s5,a3
  8001e8:	5b7d                	li	s6,-1
  8001ea:	00000a17          	auipc	s4,0x0
  8001ee:	48aa0a13          	addi	s4,s4,1162 # 800674 <main+0x10a>
  8001f2:	05e00b93          	li	s7,94
  8001f6:	00000c17          	auipc	s8,0x0
  8001fa:	5dac0c13          	addi	s8,s8,1498 # 8007d0 <error_string>
  8001fe:	000d4503          	lbu	a0,0(s10)
  800202:	02500793          	li	a5,37
  800206:	001d0413          	addi	s0,s10,1
  80020a:	00f50e63          	beq	a0,a5,800226 <vprintfmt+0x62>
  80020e:	c521                	beqz	a0,800256 <vprintfmt+0x92>
  800210:	02500993          	li	s3,37
  800214:	a011                	j	800218 <vprintfmt+0x54>
  800216:	c121                	beqz	a0,800256 <vprintfmt+0x92>
  800218:	85a6                	mv	a1,s1
  80021a:	0405                	addi	s0,s0,1
  80021c:	9902                	jalr	s2
  80021e:	fff44503          	lbu	a0,-1(s0)
  800222:	ff351ae3          	bne	a0,s3,800216 <vprintfmt+0x52>
  800226:	00044603          	lbu	a2,0(s0)
  80022a:	02000793          	li	a5,32
  80022e:	4981                	li	s3,0
  800230:	4801                	li	a6,0
  800232:	5cfd                	li	s9,-1
  800234:	5dfd                	li	s11,-1
  800236:	05500593          	li	a1,85
  80023a:	4525                	li	a0,9
  80023c:	fdd6069b          	addiw	a3,a2,-35
  800240:	0ff6f693          	andi	a3,a3,255
  800244:	00140d13          	addi	s10,s0,1
  800248:	1ed5ef63          	bltu	a1,a3,800446 <vprintfmt+0x282>
  80024c:	068a                	slli	a3,a3,0x2
  80024e:	96d2                	add	a3,a3,s4
  800250:	4294                	lw	a3,0(a3)
  800252:	96d2                	add	a3,a3,s4
  800254:	8682                	jr	a3
  800256:	70e6                	ld	ra,120(sp)
  800258:	7446                	ld	s0,112(sp)
  80025a:	74a6                	ld	s1,104(sp)
  80025c:	7906                	ld	s2,96(sp)
  80025e:	69e6                	ld	s3,88(sp)
  800260:	6a46                	ld	s4,80(sp)
  800262:	6aa6                	ld	s5,72(sp)
  800264:	6b06                	ld	s6,64(sp)
  800266:	7be2                	ld	s7,56(sp)
  800268:	7c42                	ld	s8,48(sp)
  80026a:	7ca2                	ld	s9,40(sp)
  80026c:	7d02                	ld	s10,32(sp)
  80026e:	6de2                	ld	s11,24(sp)
  800270:	6109                	addi	sp,sp,128
  800272:	8082                	ret
  800274:	87b2                	mv	a5,a2
  800276:	00144603          	lbu	a2,1(s0)
  80027a:	846a                	mv	s0,s10
  80027c:	b7c1                	j	80023c <vprintfmt+0x78>
  80027e:	000aac83          	lw	s9,0(s5)
  800282:	00144603          	lbu	a2,1(s0)
  800286:	0aa1                	addi	s5,s5,8
  800288:	846a                	mv	s0,s10
  80028a:	fa0dd9e3          	bgez	s11,80023c <vprintfmt+0x78>
  80028e:	8de6                	mv	s11,s9
  800290:	5cfd                	li	s9,-1
  800292:	b76d                	j	80023c <vprintfmt+0x78>
  800294:	fffdc693          	not	a3,s11
  800298:	96fd                	srai	a3,a3,0x3f
  80029a:	00ddfdb3          	and	s11,s11,a3
  80029e:	00144603          	lbu	a2,1(s0)
  8002a2:	2d81                	sext.w	s11,s11
  8002a4:	846a                	mv	s0,s10
  8002a6:	bf59                	j	80023c <vprintfmt+0x78>
  8002a8:	4705                	li	a4,1
  8002aa:	008a8593          	addi	a1,s5,8
  8002ae:	01074463          	blt	a4,a6,8002b6 <vprintfmt+0xf2>
  8002b2:	22080863          	beqz	a6,8004e2 <vprintfmt+0x31e>
  8002b6:	000ab603          	ld	a2,0(s5)
  8002ba:	46c1                	li	a3,16
  8002bc:	8aae                	mv	s5,a1
  8002be:	a291                	j	800402 <vprintfmt+0x23e>
  8002c0:	fd060c9b          	addiw	s9,a2,-48
  8002c4:	00144603          	lbu	a2,1(s0)
  8002c8:	846a                	mv	s0,s10
  8002ca:	fd06069b          	addiw	a3,a2,-48
  8002ce:	0006089b          	sext.w	a7,a2
  8002d2:	fad56ce3          	bltu	a0,a3,80028a <vprintfmt+0xc6>
  8002d6:	0405                	addi	s0,s0,1
  8002d8:	002c969b          	slliw	a3,s9,0x2
  8002dc:	00044603          	lbu	a2,0(s0)
  8002e0:	0196873b          	addw	a4,a3,s9
  8002e4:	0017171b          	slliw	a4,a4,0x1
  8002e8:	0117073b          	addw	a4,a4,a7
  8002ec:	fd06069b          	addiw	a3,a2,-48
  8002f0:	fd070c9b          	addiw	s9,a4,-48
  8002f4:	0006089b          	sext.w	a7,a2
  8002f8:	fcd57fe3          	bgeu	a0,a3,8002d6 <vprintfmt+0x112>
  8002fc:	b779                	j	80028a <vprintfmt+0xc6>
  8002fe:	000aa503          	lw	a0,0(s5)
  800302:	85a6                	mv	a1,s1
  800304:	0aa1                	addi	s5,s5,8
  800306:	9902                	jalr	s2
  800308:	bddd                	j	8001fe <vprintfmt+0x3a>
  80030a:	4705                	li	a4,1
  80030c:	008a8993          	addi	s3,s5,8
  800310:	01074463          	blt	a4,a6,800318 <vprintfmt+0x154>
  800314:	1c080463          	beqz	a6,8004dc <vprintfmt+0x318>
  800318:	000ab403          	ld	s0,0(s5)
  80031c:	1c044a63          	bltz	s0,8004f0 <vprintfmt+0x32c>
  800320:	8622                	mv	a2,s0
  800322:	8ace                	mv	s5,s3
  800324:	46a9                	li	a3,10
  800326:	a8f1                	j	800402 <vprintfmt+0x23e>
  800328:	000aa783          	lw	a5,0(s5)
  80032c:	4761                	li	a4,24
  80032e:	0aa1                	addi	s5,s5,8
  800330:	41f7d69b          	sraiw	a3,a5,0x1f
  800334:	8fb5                	xor	a5,a5,a3
  800336:	40d786bb          	subw	a3,a5,a3
  80033a:	12d74963          	blt	a4,a3,80046c <vprintfmt+0x2a8>
  80033e:	00369793          	slli	a5,a3,0x3
  800342:	97e2                	add	a5,a5,s8
  800344:	639c                	ld	a5,0(a5)
  800346:	12078363          	beqz	a5,80046c <vprintfmt+0x2a8>
  80034a:	86be                	mv	a3,a5
  80034c:	00000617          	auipc	a2,0x0
  800350:	63c60613          	addi	a2,a2,1596 # 800988 <error_string+0x1b8>
  800354:	85a6                	mv	a1,s1
  800356:	854a                	mv	a0,s2
  800358:	1cc000ef          	jal	ra,800524 <printfmt>
  80035c:	b54d                	j	8001fe <vprintfmt+0x3a>
  80035e:	000ab603          	ld	a2,0(s5)
  800362:	0aa1                	addi	s5,s5,8
  800364:	1a060163          	beqz	a2,800506 <vprintfmt+0x342>
  800368:	00160413          	addi	s0,a2,1
  80036c:	15b05763          	blez	s11,8004ba <vprintfmt+0x2f6>
  800370:	02d00593          	li	a1,45
  800374:	10b79d63          	bne	a5,a1,80048e <vprintfmt+0x2ca>
  800378:	00064783          	lbu	a5,0(a2)
  80037c:	0007851b          	sext.w	a0,a5
  800380:	c905                	beqz	a0,8003b0 <vprintfmt+0x1ec>
  800382:	000cc563          	bltz	s9,80038c <vprintfmt+0x1c8>
  800386:	3cfd                	addiw	s9,s9,-1
  800388:	036c8263          	beq	s9,s6,8003ac <vprintfmt+0x1e8>
  80038c:	85a6                	mv	a1,s1
  80038e:	14098f63          	beqz	s3,8004ec <vprintfmt+0x328>
  800392:	3781                	addiw	a5,a5,-32
  800394:	14fbfc63          	bgeu	s7,a5,8004ec <vprintfmt+0x328>
  800398:	03f00513          	li	a0,63
  80039c:	9902                	jalr	s2
  80039e:	0405                	addi	s0,s0,1
  8003a0:	fff44783          	lbu	a5,-1(s0)
  8003a4:	3dfd                	addiw	s11,s11,-1
  8003a6:	0007851b          	sext.w	a0,a5
  8003aa:	fd61                	bnez	a0,800382 <vprintfmt+0x1be>
  8003ac:	e5b059e3          	blez	s11,8001fe <vprintfmt+0x3a>
  8003b0:	3dfd                	addiw	s11,s11,-1
  8003b2:	85a6                	mv	a1,s1
  8003b4:	02000513          	li	a0,32
  8003b8:	9902                	jalr	s2
  8003ba:	e40d82e3          	beqz	s11,8001fe <vprintfmt+0x3a>
  8003be:	3dfd                	addiw	s11,s11,-1
  8003c0:	85a6                	mv	a1,s1
  8003c2:	02000513          	li	a0,32
  8003c6:	9902                	jalr	s2
  8003c8:	fe0d94e3          	bnez	s11,8003b0 <vprintfmt+0x1ec>
  8003cc:	bd0d                	j	8001fe <vprintfmt+0x3a>
  8003ce:	4705                	li	a4,1
  8003d0:	008a8593          	addi	a1,s5,8
  8003d4:	01074463          	blt	a4,a6,8003dc <vprintfmt+0x218>
  8003d8:	0e080863          	beqz	a6,8004c8 <vprintfmt+0x304>
  8003dc:	000ab603          	ld	a2,0(s5)
  8003e0:	46a1                	li	a3,8
  8003e2:	8aae                	mv	s5,a1
  8003e4:	a839                	j	800402 <vprintfmt+0x23e>
  8003e6:	03000513          	li	a0,48
  8003ea:	85a6                	mv	a1,s1
  8003ec:	e03e                	sd	a5,0(sp)
  8003ee:	9902                	jalr	s2
  8003f0:	85a6                	mv	a1,s1
  8003f2:	07800513          	li	a0,120
  8003f6:	9902                	jalr	s2
  8003f8:	0aa1                	addi	s5,s5,8
  8003fa:	ff8ab603          	ld	a2,-8(s5)
  8003fe:	6782                	ld	a5,0(sp)
  800400:	46c1                	li	a3,16
  800402:	2781                	sext.w	a5,a5
  800404:	876e                	mv	a4,s11
  800406:	85a6                	mv	a1,s1
  800408:	854a                	mv	a0,s2
  80040a:	d4fff0ef          	jal	ra,800158 <printnum>
  80040e:	bbc5                	j	8001fe <vprintfmt+0x3a>
  800410:	00144603          	lbu	a2,1(s0)
  800414:	2805                	addiw	a6,a6,1
  800416:	846a                	mv	s0,s10
  800418:	b515                	j	80023c <vprintfmt+0x78>
  80041a:	00144603          	lbu	a2,1(s0)
  80041e:	4985                	li	s3,1
  800420:	846a                	mv	s0,s10
  800422:	bd29                	j	80023c <vprintfmt+0x78>
  800424:	85a6                	mv	a1,s1
  800426:	02500513          	li	a0,37
  80042a:	9902                	jalr	s2
  80042c:	bbc9                	j	8001fe <vprintfmt+0x3a>
  80042e:	4705                	li	a4,1
  800430:	008a8593          	addi	a1,s5,8
  800434:	01074463          	blt	a4,a6,80043c <vprintfmt+0x278>
  800438:	08080d63          	beqz	a6,8004d2 <vprintfmt+0x30e>
  80043c:	000ab603          	ld	a2,0(s5)
  800440:	46a9                	li	a3,10
  800442:	8aae                	mv	s5,a1
  800444:	bf7d                	j	800402 <vprintfmt+0x23e>
  800446:	85a6                	mv	a1,s1
  800448:	02500513          	li	a0,37
  80044c:	9902                	jalr	s2
  80044e:	fff44703          	lbu	a4,-1(s0)
  800452:	02500793          	li	a5,37
  800456:	8d22                	mv	s10,s0
  800458:	daf703e3          	beq	a4,a5,8001fe <vprintfmt+0x3a>
  80045c:	02500713          	li	a4,37
  800460:	1d7d                	addi	s10,s10,-1
  800462:	fffd4783          	lbu	a5,-1(s10)
  800466:	fee79de3          	bne	a5,a4,800460 <vprintfmt+0x29c>
  80046a:	bb51                	j	8001fe <vprintfmt+0x3a>
  80046c:	00000617          	auipc	a2,0x0
  800470:	50c60613          	addi	a2,a2,1292 # 800978 <error_string+0x1a8>
  800474:	85a6                	mv	a1,s1
  800476:	854a                	mv	a0,s2
  800478:	0ac000ef          	jal	ra,800524 <printfmt>
  80047c:	b349                	j	8001fe <vprintfmt+0x3a>
  80047e:	00000617          	auipc	a2,0x0
  800482:	4f260613          	addi	a2,a2,1266 # 800970 <error_string+0x1a0>
  800486:	00000417          	auipc	s0,0x0
  80048a:	4eb40413          	addi	s0,s0,1259 # 800971 <error_string+0x1a1>
  80048e:	8532                	mv	a0,a2
  800490:	85e6                	mv	a1,s9
  800492:	e032                	sd	a2,0(sp)
  800494:	e43e                	sd	a5,8(sp)
  800496:	0ae000ef          	jal	ra,800544 <strnlen>
  80049a:	40ad8dbb          	subw	s11,s11,a0
  80049e:	6602                	ld	a2,0(sp)
  8004a0:	01b05d63          	blez	s11,8004ba <vprintfmt+0x2f6>
  8004a4:	67a2                	ld	a5,8(sp)
  8004a6:	2781                	sext.w	a5,a5
  8004a8:	e43e                	sd	a5,8(sp)
  8004aa:	6522                	ld	a0,8(sp)
  8004ac:	85a6                	mv	a1,s1
  8004ae:	e032                	sd	a2,0(sp)
  8004b0:	3dfd                	addiw	s11,s11,-1
  8004b2:	9902                	jalr	s2
  8004b4:	6602                	ld	a2,0(sp)
  8004b6:	fe0d9ae3          	bnez	s11,8004aa <vprintfmt+0x2e6>
  8004ba:	00064783          	lbu	a5,0(a2)
  8004be:	0007851b          	sext.w	a0,a5
  8004c2:	ec0510e3          	bnez	a0,800382 <vprintfmt+0x1be>
  8004c6:	bb25                	j	8001fe <vprintfmt+0x3a>
  8004c8:	000ae603          	lwu	a2,0(s5)
  8004cc:	46a1                	li	a3,8
  8004ce:	8aae                	mv	s5,a1
  8004d0:	bf0d                	j	800402 <vprintfmt+0x23e>
  8004d2:	000ae603          	lwu	a2,0(s5)
  8004d6:	46a9                	li	a3,10
  8004d8:	8aae                	mv	s5,a1
  8004da:	b725                	j	800402 <vprintfmt+0x23e>
  8004dc:	000aa403          	lw	s0,0(s5)
  8004e0:	bd35                	j	80031c <vprintfmt+0x158>
  8004e2:	000ae603          	lwu	a2,0(s5)
  8004e6:	46c1                	li	a3,16
  8004e8:	8aae                	mv	s5,a1
  8004ea:	bf21                	j	800402 <vprintfmt+0x23e>
  8004ec:	9902                	jalr	s2
  8004ee:	bd45                	j	80039e <vprintfmt+0x1da>
  8004f0:	85a6                	mv	a1,s1
  8004f2:	02d00513          	li	a0,45
  8004f6:	e03e                	sd	a5,0(sp)
  8004f8:	9902                	jalr	s2
  8004fa:	8ace                	mv	s5,s3
  8004fc:	40800633          	neg	a2,s0
  800500:	46a9                	li	a3,10
  800502:	6782                	ld	a5,0(sp)
  800504:	bdfd                	j	800402 <vprintfmt+0x23e>
  800506:	01b05663          	blez	s11,800512 <vprintfmt+0x34e>
  80050a:	02d00693          	li	a3,45
  80050e:	f6d798e3          	bne	a5,a3,80047e <vprintfmt+0x2ba>
  800512:	00000417          	auipc	s0,0x0
  800516:	45f40413          	addi	s0,s0,1119 # 800971 <error_string+0x1a1>
  80051a:	02800513          	li	a0,40
  80051e:	02800793          	li	a5,40
  800522:	b585                	j	800382 <vprintfmt+0x1be>

0000000000800524 <printfmt>:
  800524:	715d                	addi	sp,sp,-80
  800526:	02810313          	addi	t1,sp,40
  80052a:	f436                	sd	a3,40(sp)
  80052c:	869a                	mv	a3,t1
  80052e:	ec06                	sd	ra,24(sp)
  800530:	f83a                	sd	a4,48(sp)
  800532:	fc3e                	sd	a5,56(sp)
  800534:	e0c2                	sd	a6,64(sp)
  800536:	e4c6                	sd	a7,72(sp)
  800538:	e41a                	sd	t1,8(sp)
  80053a:	c8bff0ef          	jal	ra,8001c4 <vprintfmt>
  80053e:	60e2                	ld	ra,24(sp)
  800540:	6161                	addi	sp,sp,80
  800542:	8082                	ret

0000000000800544 <strnlen>:
  800544:	c185                	beqz	a1,800564 <strnlen+0x20>
  800546:	00054783          	lbu	a5,0(a0)
  80054a:	cf89                	beqz	a5,800564 <strnlen+0x20>
  80054c:	4781                	li	a5,0
  80054e:	a021                	j	800556 <strnlen+0x12>
  800550:	00074703          	lbu	a4,0(a4)
  800554:	c711                	beqz	a4,800560 <strnlen+0x1c>
  800556:	0785                	addi	a5,a5,1
  800558:	00f50733          	add	a4,a0,a5
  80055c:	fef59ae3          	bne	a1,a5,800550 <strnlen+0xc>
  800560:	853e                	mv	a0,a5
  800562:	8082                	ret
  800564:	4781                	li	a5,0
  800566:	853e                	mv	a0,a5
  800568:	8082                	ret

000000000080056a <main>:
  80056a:	1141                	addi	sp,sp,-16
  80056c:	00000517          	auipc	a0,0x0
  800570:	42450513          	addi	a0,a0,1060 # 800990 <error_string+0x1c0>
  800574:	e406                	sd	ra,8(sp)
  800576:	e022                	sd	s0,0(sp)
  800578:	b29ff0ef          	jal	ra,8000a0 <cprintf>
  80057c:	bc9ff0ef          	jal	ra,800144 <fork>
  800580:	e901                	bnez	a0,800590 <main+0x26>
  800582:	00000517          	auipc	a0,0x0
  800586:	43650513          	addi	a0,a0,1078 # 8009b8 <error_string+0x1e8>
  80058a:	b17ff0ef          	jal	ra,8000a0 <cprintf>
  80058e:	a001                	j	80058e <main+0x24>
  800590:	842a                	mv	s0,a0
  800592:	00000517          	auipc	a0,0x0
  800596:	44650513          	addi	a0,a0,1094 # 8009d8 <error_string+0x208>
  80059a:	b07ff0ef          	jal	ra,8000a0 <cprintf>
  80059e:	babff0ef          	jal	ra,800148 <yield>
  8005a2:	ba7ff0ef          	jal	ra,800148 <yield>
  8005a6:	ba3ff0ef          	jal	ra,800148 <yield>
  8005aa:	00000517          	auipc	a0,0x0
  8005ae:	45650513          	addi	a0,a0,1110 # 800a00 <error_string+0x230>
  8005b2:	aefff0ef          	jal	ra,8000a0 <cprintf>
  8005b6:	8522                	mv	a0,s0
  8005b8:	b93ff0ef          	jal	ra,80014a <kill>
  8005bc:	ed31                	bnez	a0,800618 <main+0xae>
  8005be:	4581                	li	a1,0
  8005c0:	00000517          	auipc	a0,0x0
  8005c4:	4a850513          	addi	a0,a0,1192 # 800a68 <error_string+0x298>
  8005c8:	ad9ff0ef          	jal	ra,8000a0 <cprintf>
  8005cc:	4581                	li	a1,0
  8005ce:	8522                	mv	a0,s0
  8005d0:	b77ff0ef          	jal	ra,800146 <waitpid>
  8005d4:	e11d                	bnez	a0,8005fa <main+0x90>
  8005d6:	4581                	li	a1,0
  8005d8:	00000517          	auipc	a0,0x0
  8005dc:	4c850513          	addi	a0,a0,1224 # 800aa0 <error_string+0x2d0>
  8005e0:	ac1ff0ef          	jal	ra,8000a0 <cprintf>
  8005e4:	00000517          	auipc	a0,0x0
  8005e8:	4d450513          	addi	a0,a0,1236 # 800ab8 <error_string+0x2e8>
  8005ec:	ab5ff0ef          	jal	ra,8000a0 <cprintf>
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
  800614:	a13ff0ef          	jal	ra,800026 <__panic>
  800618:	00000697          	auipc	a3,0x0
  80061c:	41068693          	addi	a3,a3,1040 # 800a28 <error_string+0x258>
  800620:	00000617          	auipc	a2,0x0
  800624:	42060613          	addi	a2,a2,1056 # 800a40 <error_string+0x270>
  800628:	45d1                	li	a1,20
  80062a:	00000517          	auipc	a0,0x0
  80062e:	42e50513          	addi	a0,a0,1070 # 800a58 <error_string+0x288>
  800632:	9f5ff0ef          	jal	ra,800026 <__panic>
