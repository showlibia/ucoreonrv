
obj/__user_priority.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	140000ef          	jal	ra,800160 <umain>
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
  800038:	71c50513          	addi	a0,a0,1820 # 800750 <main+0x1c0>
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
  800058:	71c50513          	addi	a0,a0,1820 # 800770 <main+0x1e0>
  80005c:	044000ef          	jal	ra,8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0d8000ef          	jal	ra,80013a <exit>

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
  800094:	144000ef          	jal	ra,8001d8 <vprintfmt>
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
  8000c8:	110000ef          	jal	ra,8001d8 <vprintfmt>
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

000000000080011e <sys_kill>:
  80011e:	85aa                	mv	a1,a0
  800120:	4531                	li	a0,12
  800122:	bf4d                	j	8000d4 <syscall>

0000000000800124 <sys_getpid>:
  800124:	4549                	li	a0,18
  800126:	b77d                	j	8000d4 <syscall>

0000000000800128 <sys_putc>:
  800128:	85aa                	mv	a1,a0
  80012a:	4579                	li	a0,30
  80012c:	b765                	j	8000d4 <syscall>

000000000080012e <sys_gettime>:
  80012e:	4545                	li	a0,17
  800130:	b755                	j	8000d4 <syscall>

0000000000800132 <sys_lab6_set_priority>:
  800132:	85aa                	mv	a1,a0
  800134:	0ff00513          	li	a0,255
  800138:	bf71                	j	8000d4 <syscall>

000000000080013a <exit>:
  80013a:	1141                	addi	sp,sp,-16
  80013c:	e406                	sd	ra,8(sp)
  80013e:	fcfff0ef          	jal	ra,80010c <sys_exit>
  800142:	00000517          	auipc	a0,0x0
  800146:	63650513          	addi	a0,a0,1590 # 800778 <main+0x1e8>
  80014a:	f57ff0ef          	jal	ra,8000a0 <cprintf>
  80014e:	a001                	j	80014e <exit+0x14>

0000000000800150 <fork>:
  800150:	b7c9                	j	800112 <sys_fork>

0000000000800152 <waitpid>:
  800152:	b7d1                	j	800116 <sys_wait>

0000000000800154 <kill>:
  800154:	b7e9                	j	80011e <sys_kill>

0000000000800156 <getpid>:
  800156:	b7f9                	j	800124 <sys_getpid>

0000000000800158 <gettime_msec>:
  800158:	bfd9                	j	80012e <sys_gettime>

000000000080015a <lab6_setpriority>:
  80015a:	1502                	slli	a0,a0,0x20
  80015c:	9101                	srli	a0,a0,0x20
  80015e:	bfd1                	j	800132 <sys_lab6_set_priority>

0000000000800160 <umain>:
  800160:	1141                	addi	sp,sp,-16
  800162:	e406                	sd	ra,8(sp)
  800164:	42c000ef          	jal	ra,800590 <main>
  800168:	fd3ff0ef          	jal	ra,80013a <exit>

000000000080016c <printnum>:
  80016c:	02069813          	slli	a6,a3,0x20
  800170:	7179                	addi	sp,sp,-48
  800172:	02085813          	srli	a6,a6,0x20
  800176:	e052                	sd	s4,0(sp)
  800178:	03067a33          	remu	s4,a2,a6
  80017c:	f022                	sd	s0,32(sp)
  80017e:	ec26                	sd	s1,24(sp)
  800180:	e84a                	sd	s2,16(sp)
  800182:	f406                	sd	ra,40(sp)
  800184:	e44e                	sd	s3,8(sp)
  800186:	84aa                	mv	s1,a0
  800188:	892e                	mv	s2,a1
  80018a:	fff7041b          	addiw	s0,a4,-1
  80018e:	2a01                	sext.w	s4,s4
  800190:	03067e63          	bgeu	a2,a6,8001cc <printnum+0x60>
  800194:	89be                	mv	s3,a5
  800196:	00805763          	blez	s0,8001a4 <printnum+0x38>
  80019a:	347d                	addiw	s0,s0,-1
  80019c:	85ca                	mv	a1,s2
  80019e:	854e                	mv	a0,s3
  8001a0:	9482                	jalr	s1
  8001a2:	fc65                	bnez	s0,80019a <printnum+0x2e>
  8001a4:	1a02                	slli	s4,s4,0x20
  8001a6:	020a5a13          	srli	s4,s4,0x20
  8001aa:	00001797          	auipc	a5,0x1
  8001ae:	80678793          	addi	a5,a5,-2042 # 8009b0 <error_string+0xc8>
  8001b2:	9a3e                	add	s4,s4,a5
  8001b4:	7402                	ld	s0,32(sp)
  8001b6:	000a4503          	lbu	a0,0(s4)
  8001ba:	70a2                	ld	ra,40(sp)
  8001bc:	69a2                	ld	s3,8(sp)
  8001be:	6a02                	ld	s4,0(sp)
  8001c0:	85ca                	mv	a1,s2
  8001c2:	8326                	mv	t1,s1
  8001c4:	6942                	ld	s2,16(sp)
  8001c6:	64e2                	ld	s1,24(sp)
  8001c8:	6145                	addi	sp,sp,48
  8001ca:	8302                	jr	t1
  8001cc:	03065633          	divu	a2,a2,a6
  8001d0:	8722                	mv	a4,s0
  8001d2:	f9bff0ef          	jal	ra,80016c <printnum>
  8001d6:	b7f9                	j	8001a4 <printnum+0x38>

00000000008001d8 <vprintfmt>:
  8001d8:	7119                	addi	sp,sp,-128
  8001da:	f4a6                	sd	s1,104(sp)
  8001dc:	f0ca                	sd	s2,96(sp)
  8001de:	e8d2                	sd	s4,80(sp)
  8001e0:	e4d6                	sd	s5,72(sp)
  8001e2:	e0da                	sd	s6,64(sp)
  8001e4:	fc5e                	sd	s7,56(sp)
  8001e6:	f862                	sd	s8,48(sp)
  8001e8:	f06a                	sd	s10,32(sp)
  8001ea:	fc86                	sd	ra,120(sp)
  8001ec:	f8a2                	sd	s0,112(sp)
  8001ee:	ecce                	sd	s3,88(sp)
  8001f0:	f466                	sd	s9,40(sp)
  8001f2:	ec6e                	sd	s11,24(sp)
  8001f4:	892a                	mv	s2,a0
  8001f6:	84ae                	mv	s1,a1
  8001f8:	8d32                	mv	s10,a2
  8001fa:	8ab6                	mv	s5,a3
  8001fc:	5b7d                	li	s6,-1
  8001fe:	00000a17          	auipc	s4,0x0
  800202:	58ea0a13          	addi	s4,s4,1422 # 80078c <main+0x1fc>
  800206:	05e00b93          	li	s7,94
  80020a:	00000c17          	auipc	s8,0x0
  80020e:	6dec0c13          	addi	s8,s8,1758 # 8008e8 <error_string>
  800212:	000d4503          	lbu	a0,0(s10)
  800216:	02500793          	li	a5,37
  80021a:	001d0413          	addi	s0,s10,1
  80021e:	00f50e63          	beq	a0,a5,80023a <vprintfmt+0x62>
  800222:	c521                	beqz	a0,80026a <vprintfmt+0x92>
  800224:	02500993          	li	s3,37
  800228:	a011                	j	80022c <vprintfmt+0x54>
  80022a:	c121                	beqz	a0,80026a <vprintfmt+0x92>
  80022c:	85a6                	mv	a1,s1
  80022e:	0405                	addi	s0,s0,1
  800230:	9902                	jalr	s2
  800232:	fff44503          	lbu	a0,-1(s0)
  800236:	ff351ae3          	bne	a0,s3,80022a <vprintfmt+0x52>
  80023a:	00044603          	lbu	a2,0(s0)
  80023e:	02000793          	li	a5,32
  800242:	4981                	li	s3,0
  800244:	4801                	li	a6,0
  800246:	5cfd                	li	s9,-1
  800248:	5dfd                	li	s11,-1
  80024a:	05500593          	li	a1,85
  80024e:	4525                	li	a0,9
  800250:	fdd6069b          	addiw	a3,a2,-35
  800254:	0ff6f693          	andi	a3,a3,255
  800258:	00140d13          	addi	s10,s0,1
  80025c:	1ed5ef63          	bltu	a1,a3,80045a <vprintfmt+0x282>
  800260:	068a                	slli	a3,a3,0x2
  800262:	96d2                	add	a3,a3,s4
  800264:	4294                	lw	a3,0(a3)
  800266:	96d2                	add	a3,a3,s4
  800268:	8682                	jr	a3
  80026a:	70e6                	ld	ra,120(sp)
  80026c:	7446                	ld	s0,112(sp)
  80026e:	74a6                	ld	s1,104(sp)
  800270:	7906                	ld	s2,96(sp)
  800272:	69e6                	ld	s3,88(sp)
  800274:	6a46                	ld	s4,80(sp)
  800276:	6aa6                	ld	s5,72(sp)
  800278:	6b06                	ld	s6,64(sp)
  80027a:	7be2                	ld	s7,56(sp)
  80027c:	7c42                	ld	s8,48(sp)
  80027e:	7ca2                	ld	s9,40(sp)
  800280:	7d02                	ld	s10,32(sp)
  800282:	6de2                	ld	s11,24(sp)
  800284:	6109                	addi	sp,sp,128
  800286:	8082                	ret
  800288:	87b2                	mv	a5,a2
  80028a:	00144603          	lbu	a2,1(s0)
  80028e:	846a                	mv	s0,s10
  800290:	b7c1                	j	800250 <vprintfmt+0x78>
  800292:	000aac83          	lw	s9,0(s5)
  800296:	00144603          	lbu	a2,1(s0)
  80029a:	0aa1                	addi	s5,s5,8
  80029c:	846a                	mv	s0,s10
  80029e:	fa0dd9e3          	bgez	s11,800250 <vprintfmt+0x78>
  8002a2:	8de6                	mv	s11,s9
  8002a4:	5cfd                	li	s9,-1
  8002a6:	b76d                	j	800250 <vprintfmt+0x78>
  8002a8:	fffdc693          	not	a3,s11
  8002ac:	96fd                	srai	a3,a3,0x3f
  8002ae:	00ddfdb3          	and	s11,s11,a3
  8002b2:	00144603          	lbu	a2,1(s0)
  8002b6:	2d81                	sext.w	s11,s11
  8002b8:	846a                	mv	s0,s10
  8002ba:	bf59                	j	800250 <vprintfmt+0x78>
  8002bc:	4705                	li	a4,1
  8002be:	008a8593          	addi	a1,s5,8
  8002c2:	01074463          	blt	a4,a6,8002ca <vprintfmt+0xf2>
  8002c6:	22080863          	beqz	a6,8004f6 <vprintfmt+0x31e>
  8002ca:	000ab603          	ld	a2,0(s5)
  8002ce:	46c1                	li	a3,16
  8002d0:	8aae                	mv	s5,a1
  8002d2:	a291                	j	800416 <vprintfmt+0x23e>
  8002d4:	fd060c9b          	addiw	s9,a2,-48
  8002d8:	00144603          	lbu	a2,1(s0)
  8002dc:	846a                	mv	s0,s10
  8002de:	fd06069b          	addiw	a3,a2,-48
  8002e2:	0006089b          	sext.w	a7,a2
  8002e6:	fad56ce3          	bltu	a0,a3,80029e <vprintfmt+0xc6>
  8002ea:	0405                	addi	s0,s0,1
  8002ec:	002c969b          	slliw	a3,s9,0x2
  8002f0:	00044603          	lbu	a2,0(s0)
  8002f4:	0196873b          	addw	a4,a3,s9
  8002f8:	0017171b          	slliw	a4,a4,0x1
  8002fc:	0117073b          	addw	a4,a4,a7
  800300:	fd06069b          	addiw	a3,a2,-48
  800304:	fd070c9b          	addiw	s9,a4,-48
  800308:	0006089b          	sext.w	a7,a2
  80030c:	fcd57fe3          	bgeu	a0,a3,8002ea <vprintfmt+0x112>
  800310:	b779                	j	80029e <vprintfmt+0xc6>
  800312:	000aa503          	lw	a0,0(s5)
  800316:	85a6                	mv	a1,s1
  800318:	0aa1                	addi	s5,s5,8
  80031a:	9902                	jalr	s2
  80031c:	bddd                	j	800212 <vprintfmt+0x3a>
  80031e:	4705                	li	a4,1
  800320:	008a8993          	addi	s3,s5,8
  800324:	01074463          	blt	a4,a6,80032c <vprintfmt+0x154>
  800328:	1c080463          	beqz	a6,8004f0 <vprintfmt+0x318>
  80032c:	000ab403          	ld	s0,0(s5)
  800330:	1c044a63          	bltz	s0,800504 <vprintfmt+0x32c>
  800334:	8622                	mv	a2,s0
  800336:	8ace                	mv	s5,s3
  800338:	46a9                	li	a3,10
  80033a:	a8f1                	j	800416 <vprintfmt+0x23e>
  80033c:	000aa783          	lw	a5,0(s5)
  800340:	4761                	li	a4,24
  800342:	0aa1                	addi	s5,s5,8
  800344:	41f7d69b          	sraiw	a3,a5,0x1f
  800348:	8fb5                	xor	a5,a5,a3
  80034a:	40d786bb          	subw	a3,a5,a3
  80034e:	12d74963          	blt	a4,a3,800480 <vprintfmt+0x2a8>
  800352:	00369793          	slli	a5,a3,0x3
  800356:	97e2                	add	a5,a5,s8
  800358:	639c                	ld	a5,0(a5)
  80035a:	12078363          	beqz	a5,800480 <vprintfmt+0x2a8>
  80035e:	86be                	mv	a3,a5
  800360:	00000617          	auipc	a2,0x0
  800364:	74060613          	addi	a2,a2,1856 # 800aa0 <error_string+0x1b8>
  800368:	85a6                	mv	a1,s1
  80036a:	854a                	mv	a0,s2
  80036c:	1cc000ef          	jal	ra,800538 <printfmt>
  800370:	b54d                	j	800212 <vprintfmt+0x3a>
  800372:	000ab603          	ld	a2,0(s5)
  800376:	0aa1                	addi	s5,s5,8
  800378:	1a060163          	beqz	a2,80051a <vprintfmt+0x342>
  80037c:	00160413          	addi	s0,a2,1
  800380:	15b05763          	blez	s11,8004ce <vprintfmt+0x2f6>
  800384:	02d00593          	li	a1,45
  800388:	10b79d63          	bne	a5,a1,8004a2 <vprintfmt+0x2ca>
  80038c:	00064783          	lbu	a5,0(a2)
  800390:	0007851b          	sext.w	a0,a5
  800394:	c905                	beqz	a0,8003c4 <vprintfmt+0x1ec>
  800396:	000cc563          	bltz	s9,8003a0 <vprintfmt+0x1c8>
  80039a:	3cfd                	addiw	s9,s9,-1
  80039c:	036c8263          	beq	s9,s6,8003c0 <vprintfmt+0x1e8>
  8003a0:	85a6                	mv	a1,s1
  8003a2:	14098f63          	beqz	s3,800500 <vprintfmt+0x328>
  8003a6:	3781                	addiw	a5,a5,-32
  8003a8:	14fbfc63          	bgeu	s7,a5,800500 <vprintfmt+0x328>
  8003ac:	03f00513          	li	a0,63
  8003b0:	9902                	jalr	s2
  8003b2:	0405                	addi	s0,s0,1
  8003b4:	fff44783          	lbu	a5,-1(s0)
  8003b8:	3dfd                	addiw	s11,s11,-1
  8003ba:	0007851b          	sext.w	a0,a5
  8003be:	fd61                	bnez	a0,800396 <vprintfmt+0x1be>
  8003c0:	e5b059e3          	blez	s11,800212 <vprintfmt+0x3a>
  8003c4:	3dfd                	addiw	s11,s11,-1
  8003c6:	85a6                	mv	a1,s1
  8003c8:	02000513          	li	a0,32
  8003cc:	9902                	jalr	s2
  8003ce:	e40d82e3          	beqz	s11,800212 <vprintfmt+0x3a>
  8003d2:	3dfd                	addiw	s11,s11,-1
  8003d4:	85a6                	mv	a1,s1
  8003d6:	02000513          	li	a0,32
  8003da:	9902                	jalr	s2
  8003dc:	fe0d94e3          	bnez	s11,8003c4 <vprintfmt+0x1ec>
  8003e0:	bd0d                	j	800212 <vprintfmt+0x3a>
  8003e2:	4705                	li	a4,1
  8003e4:	008a8593          	addi	a1,s5,8
  8003e8:	01074463          	blt	a4,a6,8003f0 <vprintfmt+0x218>
  8003ec:	0e080863          	beqz	a6,8004dc <vprintfmt+0x304>
  8003f0:	000ab603          	ld	a2,0(s5)
  8003f4:	46a1                	li	a3,8
  8003f6:	8aae                	mv	s5,a1
  8003f8:	a839                	j	800416 <vprintfmt+0x23e>
  8003fa:	03000513          	li	a0,48
  8003fe:	85a6                	mv	a1,s1
  800400:	e03e                	sd	a5,0(sp)
  800402:	9902                	jalr	s2
  800404:	85a6                	mv	a1,s1
  800406:	07800513          	li	a0,120
  80040a:	9902                	jalr	s2
  80040c:	0aa1                	addi	s5,s5,8
  80040e:	ff8ab603          	ld	a2,-8(s5)
  800412:	6782                	ld	a5,0(sp)
  800414:	46c1                	li	a3,16
  800416:	2781                	sext.w	a5,a5
  800418:	876e                	mv	a4,s11
  80041a:	85a6                	mv	a1,s1
  80041c:	854a                	mv	a0,s2
  80041e:	d4fff0ef          	jal	ra,80016c <printnum>
  800422:	bbc5                	j	800212 <vprintfmt+0x3a>
  800424:	00144603          	lbu	a2,1(s0)
  800428:	2805                	addiw	a6,a6,1
  80042a:	846a                	mv	s0,s10
  80042c:	b515                	j	800250 <vprintfmt+0x78>
  80042e:	00144603          	lbu	a2,1(s0)
  800432:	4985                	li	s3,1
  800434:	846a                	mv	s0,s10
  800436:	bd29                	j	800250 <vprintfmt+0x78>
  800438:	85a6                	mv	a1,s1
  80043a:	02500513          	li	a0,37
  80043e:	9902                	jalr	s2
  800440:	bbc9                	j	800212 <vprintfmt+0x3a>
  800442:	4705                	li	a4,1
  800444:	008a8593          	addi	a1,s5,8
  800448:	01074463          	blt	a4,a6,800450 <vprintfmt+0x278>
  80044c:	08080d63          	beqz	a6,8004e6 <vprintfmt+0x30e>
  800450:	000ab603          	ld	a2,0(s5)
  800454:	46a9                	li	a3,10
  800456:	8aae                	mv	s5,a1
  800458:	bf7d                	j	800416 <vprintfmt+0x23e>
  80045a:	85a6                	mv	a1,s1
  80045c:	02500513          	li	a0,37
  800460:	9902                	jalr	s2
  800462:	fff44703          	lbu	a4,-1(s0)
  800466:	02500793          	li	a5,37
  80046a:	8d22                	mv	s10,s0
  80046c:	daf703e3          	beq	a4,a5,800212 <vprintfmt+0x3a>
  800470:	02500713          	li	a4,37
  800474:	1d7d                	addi	s10,s10,-1
  800476:	fffd4783          	lbu	a5,-1(s10)
  80047a:	fee79de3          	bne	a5,a4,800474 <vprintfmt+0x29c>
  80047e:	bb51                	j	800212 <vprintfmt+0x3a>
  800480:	00000617          	auipc	a2,0x0
  800484:	61060613          	addi	a2,a2,1552 # 800a90 <error_string+0x1a8>
  800488:	85a6                	mv	a1,s1
  80048a:	854a                	mv	a0,s2
  80048c:	0ac000ef          	jal	ra,800538 <printfmt>
  800490:	b349                	j	800212 <vprintfmt+0x3a>
  800492:	00000617          	auipc	a2,0x0
  800496:	5f660613          	addi	a2,a2,1526 # 800a88 <error_string+0x1a0>
  80049a:	00000417          	auipc	s0,0x0
  80049e:	5ef40413          	addi	s0,s0,1519 # 800a89 <error_string+0x1a1>
  8004a2:	8532                	mv	a0,a2
  8004a4:	85e6                	mv	a1,s9
  8004a6:	e032                	sd	a2,0(sp)
  8004a8:	e43e                	sd	a5,8(sp)
  8004aa:	0ae000ef          	jal	ra,800558 <strnlen>
  8004ae:	40ad8dbb          	subw	s11,s11,a0
  8004b2:	6602                	ld	a2,0(sp)
  8004b4:	01b05d63          	blez	s11,8004ce <vprintfmt+0x2f6>
  8004b8:	67a2                	ld	a5,8(sp)
  8004ba:	2781                	sext.w	a5,a5
  8004bc:	e43e                	sd	a5,8(sp)
  8004be:	6522                	ld	a0,8(sp)
  8004c0:	85a6                	mv	a1,s1
  8004c2:	e032                	sd	a2,0(sp)
  8004c4:	3dfd                	addiw	s11,s11,-1
  8004c6:	9902                	jalr	s2
  8004c8:	6602                	ld	a2,0(sp)
  8004ca:	fe0d9ae3          	bnez	s11,8004be <vprintfmt+0x2e6>
  8004ce:	00064783          	lbu	a5,0(a2)
  8004d2:	0007851b          	sext.w	a0,a5
  8004d6:	ec0510e3          	bnez	a0,800396 <vprintfmt+0x1be>
  8004da:	bb25                	j	800212 <vprintfmt+0x3a>
  8004dc:	000ae603          	lwu	a2,0(s5)
  8004e0:	46a1                	li	a3,8
  8004e2:	8aae                	mv	s5,a1
  8004e4:	bf0d                	j	800416 <vprintfmt+0x23e>
  8004e6:	000ae603          	lwu	a2,0(s5)
  8004ea:	46a9                	li	a3,10
  8004ec:	8aae                	mv	s5,a1
  8004ee:	b725                	j	800416 <vprintfmt+0x23e>
  8004f0:	000aa403          	lw	s0,0(s5)
  8004f4:	bd35                	j	800330 <vprintfmt+0x158>
  8004f6:	000ae603          	lwu	a2,0(s5)
  8004fa:	46c1                	li	a3,16
  8004fc:	8aae                	mv	s5,a1
  8004fe:	bf21                	j	800416 <vprintfmt+0x23e>
  800500:	9902                	jalr	s2
  800502:	bd45                	j	8003b2 <vprintfmt+0x1da>
  800504:	85a6                	mv	a1,s1
  800506:	02d00513          	li	a0,45
  80050a:	e03e                	sd	a5,0(sp)
  80050c:	9902                	jalr	s2
  80050e:	8ace                	mv	s5,s3
  800510:	40800633          	neg	a2,s0
  800514:	46a9                	li	a3,10
  800516:	6782                	ld	a5,0(sp)
  800518:	bdfd                	j	800416 <vprintfmt+0x23e>
  80051a:	01b05663          	blez	s11,800526 <vprintfmt+0x34e>
  80051e:	02d00693          	li	a3,45
  800522:	f6d798e3          	bne	a5,a3,800492 <vprintfmt+0x2ba>
  800526:	00000417          	auipc	s0,0x0
  80052a:	56340413          	addi	s0,s0,1379 # 800a89 <error_string+0x1a1>
  80052e:	02800513          	li	a0,40
  800532:	02800793          	li	a5,40
  800536:	b585                	j	800396 <vprintfmt+0x1be>

0000000000800538 <printfmt>:
  800538:	715d                	addi	sp,sp,-80
  80053a:	02810313          	addi	t1,sp,40
  80053e:	f436                	sd	a3,40(sp)
  800540:	869a                	mv	a3,t1
  800542:	ec06                	sd	ra,24(sp)
  800544:	f83a                	sd	a4,48(sp)
  800546:	fc3e                	sd	a5,56(sp)
  800548:	e0c2                	sd	a6,64(sp)
  80054a:	e4c6                	sd	a7,72(sp)
  80054c:	e41a                	sd	t1,8(sp)
  80054e:	c8bff0ef          	jal	ra,8001d8 <vprintfmt>
  800552:	60e2                	ld	ra,24(sp)
  800554:	6161                	addi	sp,sp,80
  800556:	8082                	ret

0000000000800558 <strnlen>:
  800558:	c185                	beqz	a1,800578 <strnlen+0x20>
  80055a:	00054783          	lbu	a5,0(a0)
  80055e:	cf89                	beqz	a5,800578 <strnlen+0x20>
  800560:	4781                	li	a5,0
  800562:	a021                	j	80056a <strnlen+0x12>
  800564:	00074703          	lbu	a4,0(a4)
  800568:	c711                	beqz	a4,800574 <strnlen+0x1c>
  80056a:	0785                	addi	a5,a5,1
  80056c:	00f50733          	add	a4,a0,a5
  800570:	fef59ae3          	bne	a1,a5,800564 <strnlen+0xc>
  800574:	853e                	mv	a0,a5
  800576:	8082                	ret
  800578:	4781                	li	a5,0
  80057a:	853e                	mv	a0,a5
  80057c:	8082                	ret

000000000080057e <memset>:
  80057e:	ca01                	beqz	a2,80058e <memset+0x10>
  800580:	962a                	add	a2,a2,a0
  800582:	87aa                	mv	a5,a0
  800584:	0785                	addi	a5,a5,1
  800586:	feb78fa3          	sb	a1,-1(a5)
  80058a:	fec79de3          	bne	a5,a2,800584 <memset+0x6>
  80058e:	8082                	ret

0000000000800590 <main>:
  800590:	711d                	addi	sp,sp,-96
  800592:	4651                	li	a2,20
  800594:	4581                	li	a1,0
  800596:	00001517          	auipc	a0,0x1
  80059a:	a9a50513          	addi	a0,a0,-1382 # 801030 <pids>
  80059e:	ec86                	sd	ra,88(sp)
  8005a0:	e8a2                	sd	s0,80(sp)
  8005a2:	e4a6                	sd	s1,72(sp)
  8005a4:	e0ca                	sd	s2,64(sp)
  8005a6:	fc4e                	sd	s3,56(sp)
  8005a8:	f852                	sd	s4,48(sp)
  8005aa:	f456                	sd	s5,40(sp)
  8005ac:	f05a                	sd	s6,32(sp)
  8005ae:	ec5e                	sd	s7,24(sp)
  8005b0:	fcfff0ef          	jal	ra,80057e <memset>
  8005b4:	4519                	li	a0,6
  8005b6:	00001a97          	auipc	s5,0x1
  8005ba:	a4aa8a93          	addi	s5,s5,-1462 # 801000 <acc>
  8005be:	00001917          	auipc	s2,0x1
  8005c2:	a7290913          	addi	s2,s2,-1422 # 801030 <pids>
  8005c6:	b95ff0ef          	jal	ra,80015a <lab6_setpriority>
  8005ca:	89d6                	mv	s3,s5
  8005cc:	84ca                	mv	s1,s2
  8005ce:	4401                	li	s0,0
  8005d0:	4a15                	li	s4,5
  8005d2:	0009a023          	sw	zero,0(s3)
  8005d6:	b7bff0ef          	jal	ra,800150 <fork>
  8005da:	c088                	sw	a0,0(s1)
  8005dc:	c969                	beqz	a0,8006ae <main+0x11e>
  8005de:	12054d63          	bltz	a0,800718 <main+0x188>
  8005e2:	2405                	addiw	s0,s0,1
  8005e4:	0991                	addi	s3,s3,4
  8005e6:	0491                	addi	s1,s1,4
  8005e8:	ff4415e3          	bne	s0,s4,8005d2 <main+0x42>
  8005ec:	00001497          	auipc	s1,0x1
  8005f0:	a2c48493          	addi	s1,s1,-1492 # 801018 <status>
  8005f4:	00000517          	auipc	a0,0x0
  8005f8:	4d450513          	addi	a0,a0,1236 # 800ac8 <error_string+0x1e0>
  8005fc:	aa5ff0ef          	jal	ra,8000a0 <cprintf>
  800600:	00001997          	auipc	s3,0x1
  800604:	a2c98993          	addi	s3,s3,-1492 # 80102c <status+0x14>
  800608:	8a26                	mv	s4,s1
  80060a:	8426                	mv	s0,s1
  80060c:	00000b97          	auipc	s7,0x0
  800610:	4e4b8b93          	addi	s7,s7,1252 # 800af0 <error_string+0x208>
  800614:	00092503          	lw	a0,0(s2)
  800618:	85a2                	mv	a1,s0
  80061a:	00042023          	sw	zero,0(s0)
  80061e:	b35ff0ef          	jal	ra,800152 <waitpid>
  800622:	00092a83          	lw	s5,0(s2)
  800626:	00042b03          	lw	s6,0(s0)
  80062a:	b2fff0ef          	jal	ra,800158 <gettime_msec>
  80062e:	0005069b          	sext.w	a3,a0
  800632:	865a                	mv	a2,s6
  800634:	85d6                	mv	a1,s5
  800636:	855e                	mv	a0,s7
  800638:	0411                	addi	s0,s0,4
  80063a:	a67ff0ef          	jal	ra,8000a0 <cprintf>
  80063e:	0911                	addi	s2,s2,4
  800640:	fd341ae3          	bne	s0,s3,800614 <main+0x84>
  800644:	00000517          	auipc	a0,0x0
  800648:	4cc50513          	addi	a0,a0,1228 # 800b10 <error_string+0x228>
  80064c:	a55ff0ef          	jal	ra,8000a0 <cprintf>
  800650:	00000517          	auipc	a0,0x0
  800654:	4d850513          	addi	a0,a0,1240 # 800b28 <error_string+0x240>
  800658:	a49ff0ef          	jal	ra,8000a0 <cprintf>
  80065c:	00000417          	auipc	s0,0x0
  800660:	4ec40413          	addi	s0,s0,1260 # 800b48 <error_string+0x260>
  800664:	408c                	lw	a1,0(s1)
  800666:	000a2783          	lw	a5,0(s4)
  80066a:	0491                	addi	s1,s1,4
  80066c:	0015959b          	slliw	a1,a1,0x1
  800670:	02f5c5bb          	divw	a1,a1,a5
  800674:	8522                	mv	a0,s0
  800676:	2585                	addiw	a1,a1,1
  800678:	01f5d79b          	srliw	a5,a1,0x1f
  80067c:	9dbd                	addw	a1,a1,a5
  80067e:	4015d59b          	sraiw	a1,a1,0x1
  800682:	a1fff0ef          	jal	ra,8000a0 <cprintf>
  800686:	fd349fe3          	bne	s1,s3,800664 <main+0xd4>
  80068a:	00000517          	auipc	a0,0x0
  80068e:	0e650513          	addi	a0,a0,230 # 800770 <main+0x1e0>
  800692:	a0fff0ef          	jal	ra,8000a0 <cprintf>
  800696:	60e6                	ld	ra,88(sp)
  800698:	6446                	ld	s0,80(sp)
  80069a:	64a6                	ld	s1,72(sp)
  80069c:	6906                	ld	s2,64(sp)
  80069e:	79e2                	ld	s3,56(sp)
  8006a0:	7a42                	ld	s4,48(sp)
  8006a2:	7aa2                	ld	s5,40(sp)
  8006a4:	7b02                	ld	s6,32(sp)
  8006a6:	6be2                	ld	s7,24(sp)
  8006a8:	4501                	li	a0,0
  8006aa:	6125                	addi	sp,sp,96
  8006ac:	8082                	ret
  8006ae:	0014051b          	addiw	a0,s0,1
  8006b2:	040a                	slli	s0,s0,0x2
  8006b4:	9456                	add	s0,s0,s5
  8006b6:	6485                	lui	s1,0x1
  8006b8:	6909                	lui	s2,0x2
  8006ba:	aa1ff0ef          	jal	ra,80015a <lab6_setpriority>
  8006be:	fa04849b          	addiw	s1,s1,-96
  8006c2:	00042023          	sw	zero,0(s0)
  8006c6:	71090913          	addi	s2,s2,1808 # 2710 <_start-0x7fd910>
  8006ca:	4014                	lw	a3,0(s0)
  8006cc:	2685                	addiw	a3,a3,1
  8006ce:	0c800713          	li	a4,200
  8006d2:	47b2                	lw	a5,12(sp)
  8006d4:	377d                	addiw	a4,a4,-1
  8006d6:	2781                	sext.w	a5,a5
  8006d8:	0017b793          	seqz	a5,a5
  8006dc:	c63e                	sw	a5,12(sp)
  8006de:	fb75                	bnez	a4,8006d2 <main+0x142>
  8006e0:	0296f7bb          	remuw	a5,a3,s1
  8006e4:	0016871b          	addiw	a4,a3,1
  8006e8:	c399                	beqz	a5,8006ee <main+0x15e>
  8006ea:	86ba                	mv	a3,a4
  8006ec:	b7cd                	j	8006ce <main+0x13e>
  8006ee:	c014                	sw	a3,0(s0)
  8006f0:	a69ff0ef          	jal	ra,800158 <gettime_msec>
  8006f4:	0005099b          	sext.w	s3,a0
  8006f8:	fd3959e3          	bge	s2,s3,8006ca <main+0x13a>
  8006fc:	a5bff0ef          	jal	ra,800156 <getpid>
  800700:	4010                	lw	a2,0(s0)
  800702:	85aa                	mv	a1,a0
  800704:	86ce                	mv	a3,s3
  800706:	00000517          	auipc	a0,0x0
  80070a:	3a250513          	addi	a0,a0,930 # 800aa8 <error_string+0x1c0>
  80070e:	993ff0ef          	jal	ra,8000a0 <cprintf>
  800712:	4008                	lw	a0,0(s0)
  800714:	a27ff0ef          	jal	ra,80013a <exit>
  800718:	00001417          	auipc	s0,0x1
  80071c:	92c40413          	addi	s0,s0,-1748 # 801044 <pids+0x14>
  800720:	00092503          	lw	a0,0(s2)
  800724:	00a05463          	blez	a0,80072c <main+0x19c>
  800728:	a2dff0ef          	jal	ra,800154 <kill>
  80072c:	0911                	addi	s2,s2,4
  80072e:	ff2419e3          	bne	s0,s2,800720 <main+0x190>
  800732:	00000617          	auipc	a2,0x0
  800736:	41e60613          	addi	a2,a2,1054 # 800b50 <error_string+0x268>
  80073a:	04b00593          	li	a1,75
  80073e:	00000517          	auipc	a0,0x0
  800742:	42250513          	addi	a0,a0,1058 # 800b60 <error_string+0x278>
  800746:	8e1ff0ef          	jal	ra,800026 <__panic>
