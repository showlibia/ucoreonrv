
obj/__user_waitkill.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	132000ef          	jal	ra,800152 <umain>
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
  800038:	67c50513          	addi	a0,a0,1660 # 8006b0 <main+0xb4>
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
  800058:	9b450513          	addi	a0,a0,-1612 # 800a08 <error_string+0x1c8>
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
  800094:	136000ef          	jal	ra,8001ca <vprintfmt>
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
  8000c8:	102000ef          	jal	ra,8001ca <vprintfmt>
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
  80013e:	59650513          	addi	a0,a0,1430 # 8006d0 <main+0xd4>
  800142:	f5fff0ef          	jal	ra,8000a0 <cprintf>
  800146:	a001                	j	800146 <exit+0x14>

0000000000800148 <fork>:
  800148:	b7e9                	j	800112 <sys_fork>

000000000080014a <waitpid>:
  80014a:	b7f1                	j	800116 <sys_wait>

000000000080014c <yield>:
  80014c:	bfc9                	j	80011e <sys_yield>

000000000080014e <kill>:
  80014e:	bfd1                	j	800122 <sys_kill>

0000000000800150 <getpid>:
  800150:	bfe1                	j	800128 <sys_getpid>

0000000000800152 <umain>:
  800152:	1141                	addi	sp,sp,-16
  800154:	e406                	sd	ra,8(sp)
  800156:	4a6000ef          	jal	ra,8005fc <main>
  80015a:	fd9ff0ef          	jal	ra,800132 <exit>

000000000080015e <printnum>:
  80015e:	02069813          	slli	a6,a3,0x20
  800162:	7179                	addi	sp,sp,-48
  800164:	02085813          	srli	a6,a6,0x20
  800168:	e052                	sd	s4,0(sp)
  80016a:	03067a33          	remu	s4,a2,a6
  80016e:	f022                	sd	s0,32(sp)
  800170:	ec26                	sd	s1,24(sp)
  800172:	e84a                	sd	s2,16(sp)
  800174:	f406                	sd	ra,40(sp)
  800176:	e44e                	sd	s3,8(sp)
  800178:	84aa                	mv	s1,a0
  80017a:	892e                	mv	s2,a1
  80017c:	fff7041b          	addiw	s0,a4,-1
  800180:	2a01                	sext.w	s4,s4
  800182:	03067e63          	bgeu	a2,a6,8001be <printnum+0x60>
  800186:	89be                	mv	s3,a5
  800188:	00805763          	blez	s0,800196 <printnum+0x38>
  80018c:	347d                	addiw	s0,s0,-1
  80018e:	85ca                	mv	a1,s2
  800190:	854e                	mv	a0,s3
  800192:	9482                	jalr	s1
  800194:	fc65                	bnez	s0,80018c <printnum+0x2e>
  800196:	1a02                	slli	s4,s4,0x20
  800198:	020a5a13          	srli	s4,s4,0x20
  80019c:	00000797          	auipc	a5,0x0
  8001a0:	76c78793          	addi	a5,a5,1900 # 800908 <error_string+0xc8>
  8001a4:	9a3e                	add	s4,s4,a5
  8001a6:	7402                	ld	s0,32(sp)
  8001a8:	000a4503          	lbu	a0,0(s4)
  8001ac:	70a2                	ld	ra,40(sp)
  8001ae:	69a2                	ld	s3,8(sp)
  8001b0:	6a02                	ld	s4,0(sp)
  8001b2:	85ca                	mv	a1,s2
  8001b4:	8326                	mv	t1,s1
  8001b6:	6942                	ld	s2,16(sp)
  8001b8:	64e2                	ld	s1,24(sp)
  8001ba:	6145                	addi	sp,sp,48
  8001bc:	8302                	jr	t1
  8001be:	03065633          	divu	a2,a2,a6
  8001c2:	8722                	mv	a4,s0
  8001c4:	f9bff0ef          	jal	ra,80015e <printnum>
  8001c8:	b7f9                	j	800196 <printnum+0x38>

00000000008001ca <vprintfmt>:
  8001ca:	7119                	addi	sp,sp,-128
  8001cc:	f4a6                	sd	s1,104(sp)
  8001ce:	f0ca                	sd	s2,96(sp)
  8001d0:	e8d2                	sd	s4,80(sp)
  8001d2:	e4d6                	sd	s5,72(sp)
  8001d4:	e0da                	sd	s6,64(sp)
  8001d6:	fc5e                	sd	s7,56(sp)
  8001d8:	f862                	sd	s8,48(sp)
  8001da:	f06a                	sd	s10,32(sp)
  8001dc:	fc86                	sd	ra,120(sp)
  8001de:	f8a2                	sd	s0,112(sp)
  8001e0:	ecce                	sd	s3,88(sp)
  8001e2:	f466                	sd	s9,40(sp)
  8001e4:	ec6e                	sd	s11,24(sp)
  8001e6:	892a                	mv	s2,a0
  8001e8:	84ae                	mv	s1,a1
  8001ea:	8d32                	mv	s10,a2
  8001ec:	8ab6                	mv	s5,a3
  8001ee:	5b7d                	li	s6,-1
  8001f0:	00000a17          	auipc	s4,0x0
  8001f4:	4f4a0a13          	addi	s4,s4,1268 # 8006e4 <main+0xe8>
  8001f8:	05e00b93          	li	s7,94
  8001fc:	00000c17          	auipc	s8,0x0
  800200:	644c0c13          	addi	s8,s8,1604 # 800840 <error_string>
  800204:	000d4503          	lbu	a0,0(s10)
  800208:	02500793          	li	a5,37
  80020c:	001d0413          	addi	s0,s10,1
  800210:	00f50e63          	beq	a0,a5,80022c <vprintfmt+0x62>
  800214:	c521                	beqz	a0,80025c <vprintfmt+0x92>
  800216:	02500993          	li	s3,37
  80021a:	a011                	j	80021e <vprintfmt+0x54>
  80021c:	c121                	beqz	a0,80025c <vprintfmt+0x92>
  80021e:	85a6                	mv	a1,s1
  800220:	0405                	addi	s0,s0,1
  800222:	9902                	jalr	s2
  800224:	fff44503          	lbu	a0,-1(s0)
  800228:	ff351ae3          	bne	a0,s3,80021c <vprintfmt+0x52>
  80022c:	00044603          	lbu	a2,0(s0)
  800230:	02000793          	li	a5,32
  800234:	4981                	li	s3,0
  800236:	4801                	li	a6,0
  800238:	5cfd                	li	s9,-1
  80023a:	5dfd                	li	s11,-1
  80023c:	05500593          	li	a1,85
  800240:	4525                	li	a0,9
  800242:	fdd6069b          	addiw	a3,a2,-35
  800246:	0ff6f693          	andi	a3,a3,255
  80024a:	00140d13          	addi	s10,s0,1
  80024e:	1ed5ef63          	bltu	a1,a3,80044c <vprintfmt+0x282>
  800252:	068a                	slli	a3,a3,0x2
  800254:	96d2                	add	a3,a3,s4
  800256:	4294                	lw	a3,0(a3)
  800258:	96d2                	add	a3,a3,s4
  80025a:	8682                	jr	a3
  80025c:	70e6                	ld	ra,120(sp)
  80025e:	7446                	ld	s0,112(sp)
  800260:	74a6                	ld	s1,104(sp)
  800262:	7906                	ld	s2,96(sp)
  800264:	69e6                	ld	s3,88(sp)
  800266:	6a46                	ld	s4,80(sp)
  800268:	6aa6                	ld	s5,72(sp)
  80026a:	6b06                	ld	s6,64(sp)
  80026c:	7be2                	ld	s7,56(sp)
  80026e:	7c42                	ld	s8,48(sp)
  800270:	7ca2                	ld	s9,40(sp)
  800272:	7d02                	ld	s10,32(sp)
  800274:	6de2                	ld	s11,24(sp)
  800276:	6109                	addi	sp,sp,128
  800278:	8082                	ret
  80027a:	87b2                	mv	a5,a2
  80027c:	00144603          	lbu	a2,1(s0)
  800280:	846a                	mv	s0,s10
  800282:	b7c1                	j	800242 <vprintfmt+0x78>
  800284:	000aac83          	lw	s9,0(s5)
  800288:	00144603          	lbu	a2,1(s0)
  80028c:	0aa1                	addi	s5,s5,8
  80028e:	846a                	mv	s0,s10
  800290:	fa0dd9e3          	bgez	s11,800242 <vprintfmt+0x78>
  800294:	8de6                	mv	s11,s9
  800296:	5cfd                	li	s9,-1
  800298:	b76d                	j	800242 <vprintfmt+0x78>
  80029a:	fffdc693          	not	a3,s11
  80029e:	96fd                	srai	a3,a3,0x3f
  8002a0:	00ddfdb3          	and	s11,s11,a3
  8002a4:	00144603          	lbu	a2,1(s0)
  8002a8:	2d81                	sext.w	s11,s11
  8002aa:	846a                	mv	s0,s10
  8002ac:	bf59                	j	800242 <vprintfmt+0x78>
  8002ae:	4705                	li	a4,1
  8002b0:	008a8593          	addi	a1,s5,8
  8002b4:	01074463          	blt	a4,a6,8002bc <vprintfmt+0xf2>
  8002b8:	22080863          	beqz	a6,8004e8 <vprintfmt+0x31e>
  8002bc:	000ab603          	ld	a2,0(s5)
  8002c0:	46c1                	li	a3,16
  8002c2:	8aae                	mv	s5,a1
  8002c4:	a291                	j	800408 <vprintfmt+0x23e>
  8002c6:	fd060c9b          	addiw	s9,a2,-48
  8002ca:	00144603          	lbu	a2,1(s0)
  8002ce:	846a                	mv	s0,s10
  8002d0:	fd06069b          	addiw	a3,a2,-48
  8002d4:	0006089b          	sext.w	a7,a2
  8002d8:	fad56ce3          	bltu	a0,a3,800290 <vprintfmt+0xc6>
  8002dc:	0405                	addi	s0,s0,1
  8002de:	002c969b          	slliw	a3,s9,0x2
  8002e2:	00044603          	lbu	a2,0(s0)
  8002e6:	0196873b          	addw	a4,a3,s9
  8002ea:	0017171b          	slliw	a4,a4,0x1
  8002ee:	0117073b          	addw	a4,a4,a7
  8002f2:	fd06069b          	addiw	a3,a2,-48
  8002f6:	fd070c9b          	addiw	s9,a4,-48
  8002fa:	0006089b          	sext.w	a7,a2
  8002fe:	fcd57fe3          	bgeu	a0,a3,8002dc <vprintfmt+0x112>
  800302:	b779                	j	800290 <vprintfmt+0xc6>
  800304:	000aa503          	lw	a0,0(s5)
  800308:	85a6                	mv	a1,s1
  80030a:	0aa1                	addi	s5,s5,8
  80030c:	9902                	jalr	s2
  80030e:	bddd                	j	800204 <vprintfmt+0x3a>
  800310:	4705                	li	a4,1
  800312:	008a8993          	addi	s3,s5,8
  800316:	01074463          	blt	a4,a6,80031e <vprintfmt+0x154>
  80031a:	1c080463          	beqz	a6,8004e2 <vprintfmt+0x318>
  80031e:	000ab403          	ld	s0,0(s5)
  800322:	1c044a63          	bltz	s0,8004f6 <vprintfmt+0x32c>
  800326:	8622                	mv	a2,s0
  800328:	8ace                	mv	s5,s3
  80032a:	46a9                	li	a3,10
  80032c:	a8f1                	j	800408 <vprintfmt+0x23e>
  80032e:	000aa783          	lw	a5,0(s5)
  800332:	4761                	li	a4,24
  800334:	0aa1                	addi	s5,s5,8
  800336:	41f7d69b          	sraiw	a3,a5,0x1f
  80033a:	8fb5                	xor	a5,a5,a3
  80033c:	40d786bb          	subw	a3,a5,a3
  800340:	12d74963          	blt	a4,a3,800472 <vprintfmt+0x2a8>
  800344:	00369793          	slli	a5,a3,0x3
  800348:	97e2                	add	a5,a5,s8
  80034a:	639c                	ld	a5,0(a5)
  80034c:	12078363          	beqz	a5,800472 <vprintfmt+0x2a8>
  800350:	86be                	mv	a3,a5
  800352:	00000617          	auipc	a2,0x0
  800356:	6a660613          	addi	a2,a2,1702 # 8009f8 <error_string+0x1b8>
  80035a:	85a6                	mv	a1,s1
  80035c:	854a                	mv	a0,s2
  80035e:	1cc000ef          	jal	ra,80052a <printfmt>
  800362:	b54d                	j	800204 <vprintfmt+0x3a>
  800364:	000ab603          	ld	a2,0(s5)
  800368:	0aa1                	addi	s5,s5,8
  80036a:	1a060163          	beqz	a2,80050c <vprintfmt+0x342>
  80036e:	00160413          	addi	s0,a2,1
  800372:	15b05763          	blez	s11,8004c0 <vprintfmt+0x2f6>
  800376:	02d00593          	li	a1,45
  80037a:	10b79d63          	bne	a5,a1,800494 <vprintfmt+0x2ca>
  80037e:	00064783          	lbu	a5,0(a2)
  800382:	0007851b          	sext.w	a0,a5
  800386:	c905                	beqz	a0,8003b6 <vprintfmt+0x1ec>
  800388:	000cc563          	bltz	s9,800392 <vprintfmt+0x1c8>
  80038c:	3cfd                	addiw	s9,s9,-1
  80038e:	036c8263          	beq	s9,s6,8003b2 <vprintfmt+0x1e8>
  800392:	85a6                	mv	a1,s1
  800394:	14098f63          	beqz	s3,8004f2 <vprintfmt+0x328>
  800398:	3781                	addiw	a5,a5,-32
  80039a:	14fbfc63          	bgeu	s7,a5,8004f2 <vprintfmt+0x328>
  80039e:	03f00513          	li	a0,63
  8003a2:	9902                	jalr	s2
  8003a4:	0405                	addi	s0,s0,1
  8003a6:	fff44783          	lbu	a5,-1(s0)
  8003aa:	3dfd                	addiw	s11,s11,-1
  8003ac:	0007851b          	sext.w	a0,a5
  8003b0:	fd61                	bnez	a0,800388 <vprintfmt+0x1be>
  8003b2:	e5b059e3          	blez	s11,800204 <vprintfmt+0x3a>
  8003b6:	3dfd                	addiw	s11,s11,-1
  8003b8:	85a6                	mv	a1,s1
  8003ba:	02000513          	li	a0,32
  8003be:	9902                	jalr	s2
  8003c0:	e40d82e3          	beqz	s11,800204 <vprintfmt+0x3a>
  8003c4:	3dfd                	addiw	s11,s11,-1
  8003c6:	85a6                	mv	a1,s1
  8003c8:	02000513          	li	a0,32
  8003cc:	9902                	jalr	s2
  8003ce:	fe0d94e3          	bnez	s11,8003b6 <vprintfmt+0x1ec>
  8003d2:	bd0d                	j	800204 <vprintfmt+0x3a>
  8003d4:	4705                	li	a4,1
  8003d6:	008a8593          	addi	a1,s5,8
  8003da:	01074463          	blt	a4,a6,8003e2 <vprintfmt+0x218>
  8003de:	0e080863          	beqz	a6,8004ce <vprintfmt+0x304>
  8003e2:	000ab603          	ld	a2,0(s5)
  8003e6:	46a1                	li	a3,8
  8003e8:	8aae                	mv	s5,a1
  8003ea:	a839                	j	800408 <vprintfmt+0x23e>
  8003ec:	03000513          	li	a0,48
  8003f0:	85a6                	mv	a1,s1
  8003f2:	e03e                	sd	a5,0(sp)
  8003f4:	9902                	jalr	s2
  8003f6:	85a6                	mv	a1,s1
  8003f8:	07800513          	li	a0,120
  8003fc:	9902                	jalr	s2
  8003fe:	0aa1                	addi	s5,s5,8
  800400:	ff8ab603          	ld	a2,-8(s5)
  800404:	6782                	ld	a5,0(sp)
  800406:	46c1                	li	a3,16
  800408:	2781                	sext.w	a5,a5
  80040a:	876e                	mv	a4,s11
  80040c:	85a6                	mv	a1,s1
  80040e:	854a                	mv	a0,s2
  800410:	d4fff0ef          	jal	ra,80015e <printnum>
  800414:	bbc5                	j	800204 <vprintfmt+0x3a>
  800416:	00144603          	lbu	a2,1(s0)
  80041a:	2805                	addiw	a6,a6,1
  80041c:	846a                	mv	s0,s10
  80041e:	b515                	j	800242 <vprintfmt+0x78>
  800420:	00144603          	lbu	a2,1(s0)
  800424:	4985                	li	s3,1
  800426:	846a                	mv	s0,s10
  800428:	bd29                	j	800242 <vprintfmt+0x78>
  80042a:	85a6                	mv	a1,s1
  80042c:	02500513          	li	a0,37
  800430:	9902                	jalr	s2
  800432:	bbc9                	j	800204 <vprintfmt+0x3a>
  800434:	4705                	li	a4,1
  800436:	008a8593          	addi	a1,s5,8
  80043a:	01074463          	blt	a4,a6,800442 <vprintfmt+0x278>
  80043e:	08080d63          	beqz	a6,8004d8 <vprintfmt+0x30e>
  800442:	000ab603          	ld	a2,0(s5)
  800446:	46a9                	li	a3,10
  800448:	8aae                	mv	s5,a1
  80044a:	bf7d                	j	800408 <vprintfmt+0x23e>
  80044c:	85a6                	mv	a1,s1
  80044e:	02500513          	li	a0,37
  800452:	9902                	jalr	s2
  800454:	fff44703          	lbu	a4,-1(s0)
  800458:	02500793          	li	a5,37
  80045c:	8d22                	mv	s10,s0
  80045e:	daf703e3          	beq	a4,a5,800204 <vprintfmt+0x3a>
  800462:	02500713          	li	a4,37
  800466:	1d7d                	addi	s10,s10,-1
  800468:	fffd4783          	lbu	a5,-1(s10)
  80046c:	fee79de3          	bne	a5,a4,800466 <vprintfmt+0x29c>
  800470:	bb51                	j	800204 <vprintfmt+0x3a>
  800472:	00000617          	auipc	a2,0x0
  800476:	57660613          	addi	a2,a2,1398 # 8009e8 <error_string+0x1a8>
  80047a:	85a6                	mv	a1,s1
  80047c:	854a                	mv	a0,s2
  80047e:	0ac000ef          	jal	ra,80052a <printfmt>
  800482:	b349                	j	800204 <vprintfmt+0x3a>
  800484:	00000617          	auipc	a2,0x0
  800488:	55c60613          	addi	a2,a2,1372 # 8009e0 <error_string+0x1a0>
  80048c:	00000417          	auipc	s0,0x0
  800490:	55540413          	addi	s0,s0,1365 # 8009e1 <error_string+0x1a1>
  800494:	8532                	mv	a0,a2
  800496:	85e6                	mv	a1,s9
  800498:	e032                	sd	a2,0(sp)
  80049a:	e43e                	sd	a5,8(sp)
  80049c:	0ae000ef          	jal	ra,80054a <strnlen>
  8004a0:	40ad8dbb          	subw	s11,s11,a0
  8004a4:	6602                	ld	a2,0(sp)
  8004a6:	01b05d63          	blez	s11,8004c0 <vprintfmt+0x2f6>
  8004aa:	67a2                	ld	a5,8(sp)
  8004ac:	2781                	sext.w	a5,a5
  8004ae:	e43e                	sd	a5,8(sp)
  8004b0:	6522                	ld	a0,8(sp)
  8004b2:	85a6                	mv	a1,s1
  8004b4:	e032                	sd	a2,0(sp)
  8004b6:	3dfd                	addiw	s11,s11,-1
  8004b8:	9902                	jalr	s2
  8004ba:	6602                	ld	a2,0(sp)
  8004bc:	fe0d9ae3          	bnez	s11,8004b0 <vprintfmt+0x2e6>
  8004c0:	00064783          	lbu	a5,0(a2)
  8004c4:	0007851b          	sext.w	a0,a5
  8004c8:	ec0510e3          	bnez	a0,800388 <vprintfmt+0x1be>
  8004cc:	bb25                	j	800204 <vprintfmt+0x3a>
  8004ce:	000ae603          	lwu	a2,0(s5)
  8004d2:	46a1                	li	a3,8
  8004d4:	8aae                	mv	s5,a1
  8004d6:	bf0d                	j	800408 <vprintfmt+0x23e>
  8004d8:	000ae603          	lwu	a2,0(s5)
  8004dc:	46a9                	li	a3,10
  8004de:	8aae                	mv	s5,a1
  8004e0:	b725                	j	800408 <vprintfmt+0x23e>
  8004e2:	000aa403          	lw	s0,0(s5)
  8004e6:	bd35                	j	800322 <vprintfmt+0x158>
  8004e8:	000ae603          	lwu	a2,0(s5)
  8004ec:	46c1                	li	a3,16
  8004ee:	8aae                	mv	s5,a1
  8004f0:	bf21                	j	800408 <vprintfmt+0x23e>
  8004f2:	9902                	jalr	s2
  8004f4:	bd45                	j	8003a4 <vprintfmt+0x1da>
  8004f6:	85a6                	mv	a1,s1
  8004f8:	02d00513          	li	a0,45
  8004fc:	e03e                	sd	a5,0(sp)
  8004fe:	9902                	jalr	s2
  800500:	8ace                	mv	s5,s3
  800502:	40800633          	neg	a2,s0
  800506:	46a9                	li	a3,10
  800508:	6782                	ld	a5,0(sp)
  80050a:	bdfd                	j	800408 <vprintfmt+0x23e>
  80050c:	01b05663          	blez	s11,800518 <vprintfmt+0x34e>
  800510:	02d00693          	li	a3,45
  800514:	f6d798e3          	bne	a5,a3,800484 <vprintfmt+0x2ba>
  800518:	00000417          	auipc	s0,0x0
  80051c:	4c940413          	addi	s0,s0,1225 # 8009e1 <error_string+0x1a1>
  800520:	02800513          	li	a0,40
  800524:	02800793          	li	a5,40
  800528:	b585                	j	800388 <vprintfmt+0x1be>

000000000080052a <printfmt>:
  80052a:	715d                	addi	sp,sp,-80
  80052c:	02810313          	addi	t1,sp,40
  800530:	f436                	sd	a3,40(sp)
  800532:	869a                	mv	a3,t1
  800534:	ec06                	sd	ra,24(sp)
  800536:	f83a                	sd	a4,48(sp)
  800538:	fc3e                	sd	a5,56(sp)
  80053a:	e0c2                	sd	a6,64(sp)
  80053c:	e4c6                	sd	a7,72(sp)
  80053e:	e41a                	sd	t1,8(sp)
  800540:	c8bff0ef          	jal	ra,8001ca <vprintfmt>
  800544:	60e2                	ld	ra,24(sp)
  800546:	6161                	addi	sp,sp,80
  800548:	8082                	ret

000000000080054a <strnlen>:
  80054a:	c185                	beqz	a1,80056a <strnlen+0x20>
  80054c:	00054783          	lbu	a5,0(a0)
  800550:	cf89                	beqz	a5,80056a <strnlen+0x20>
  800552:	4781                	li	a5,0
  800554:	a021                	j	80055c <strnlen+0x12>
  800556:	00074703          	lbu	a4,0(a4)
  80055a:	c711                	beqz	a4,800566 <strnlen+0x1c>
  80055c:	0785                	addi	a5,a5,1
  80055e:	00f50733          	add	a4,a0,a5
  800562:	fef59ae3          	bne	a1,a5,800556 <strnlen+0xc>
  800566:	853e                	mv	a0,a5
  800568:	8082                	ret
  80056a:	4781                	li	a5,0
  80056c:	853e                	mv	a0,a5
  80056e:	8082                	ret

0000000000800570 <do_yield>:
  800570:	1141                	addi	sp,sp,-16
  800572:	e406                	sd	ra,8(sp)
  800574:	bd9ff0ef          	jal	ra,80014c <yield>
  800578:	bd5ff0ef          	jal	ra,80014c <yield>
  80057c:	bd1ff0ef          	jal	ra,80014c <yield>
  800580:	bcdff0ef          	jal	ra,80014c <yield>
  800584:	bc9ff0ef          	jal	ra,80014c <yield>
  800588:	60a2                	ld	ra,8(sp)
  80058a:	0141                	addi	sp,sp,16
  80058c:	b6c1                	j	80014c <yield>

000000000080058e <loop>:
  80058e:	1141                	addi	sp,sp,-16
  800590:	00000517          	auipc	a0,0x0
  800594:	47050513          	addi	a0,a0,1136 # 800a00 <error_string+0x1c0>
  800598:	e406                	sd	ra,8(sp)
  80059a:	b07ff0ef          	jal	ra,8000a0 <cprintf>
  80059e:	a001                	j	80059e <loop+0x10>

00000000008005a0 <work>:
  8005a0:	1141                	addi	sp,sp,-16
  8005a2:	00000517          	auipc	a0,0x0
  8005a6:	4de50513          	addi	a0,a0,1246 # 800a80 <error_string+0x240>
  8005aa:	e406                	sd	ra,8(sp)
  8005ac:	af5ff0ef          	jal	ra,8000a0 <cprintf>
  8005b0:	fc1ff0ef          	jal	ra,800570 <do_yield>
  8005b4:	00001797          	auipc	a5,0x1
  8005b8:	a4c78793          	addi	a5,a5,-1460 # 801000 <parent>
  8005bc:	4388                	lw	a0,0(a5)
  8005be:	b91ff0ef          	jal	ra,80014e <kill>
  8005c2:	e10d                	bnez	a0,8005e4 <work+0x44>
  8005c4:	00000517          	auipc	a0,0x0
  8005c8:	4cc50513          	addi	a0,a0,1228 # 800a90 <error_string+0x250>
  8005cc:	ad5ff0ef          	jal	ra,8000a0 <cprintf>
  8005d0:	fa1ff0ef          	jal	ra,800570 <do_yield>
  8005d4:	00001797          	auipc	a5,0x1
  8005d8:	a3478793          	addi	a5,a5,-1484 # 801008 <pid1>
  8005dc:	4388                	lw	a0,0(a5)
  8005de:	b71ff0ef          	jal	ra,80014e <kill>
  8005e2:	c501                	beqz	a0,8005ea <work+0x4a>
  8005e4:	557d                	li	a0,-1
  8005e6:	b4dff0ef          	jal	ra,800132 <exit>
  8005ea:	00000517          	auipc	a0,0x0
  8005ee:	4be50513          	addi	a0,a0,1214 # 800aa8 <error_string+0x268>
  8005f2:	aafff0ef          	jal	ra,8000a0 <cprintf>
  8005f6:	4501                	li	a0,0
  8005f8:	b3bff0ef          	jal	ra,800132 <exit>

00000000008005fc <main>:
  8005fc:	1141                	addi	sp,sp,-16
  8005fe:	e406                	sd	ra,8(sp)
  800600:	e022                	sd	s0,0(sp)
  800602:	b4fff0ef          	jal	ra,800150 <getpid>
  800606:	00001797          	auipc	a5,0x1
  80060a:	9ea7ad23          	sw	a0,-1542(a5) # 801000 <parent>
  80060e:	b3bff0ef          	jal	ra,800148 <fork>
  800612:	00001797          	auipc	a5,0x1
  800616:	9ea7ab23          	sw	a0,-1546(a5) # 801008 <pid1>
  80061a:	c53d                	beqz	a0,800688 <main+0x8c>
  80061c:	04a05663          	blez	a0,800668 <main+0x6c>
  800620:	b29ff0ef          	jal	ra,800148 <fork>
  800624:	00001797          	auipc	a5,0x1
  800628:	9ea7a023          	sw	a0,-1568(a5) # 801004 <pid2>
  80062c:	cd3d                	beqz	a0,8006aa <main+0xae>
  80062e:	00001417          	auipc	s0,0x1
  800632:	9da40413          	addi	s0,s0,-1574 # 801008 <pid1>
  800636:	04a05b63          	blez	a0,80068c <main+0x90>
  80063a:	00000517          	auipc	a0,0x0
  80063e:	40e50513          	addi	a0,a0,1038 # 800a48 <error_string+0x208>
  800642:	a5fff0ef          	jal	ra,8000a0 <cprintf>
  800646:	4008                	lw	a0,0(s0)
  800648:	4581                	li	a1,0
  80064a:	b01ff0ef          	jal	ra,80014a <waitpid>
  80064e:	4014                	lw	a3,0(s0)
  800650:	00000617          	auipc	a2,0x0
  800654:	40860613          	addi	a2,a2,1032 # 800a58 <error_string+0x218>
  800658:	03400593          	li	a1,52
  80065c:	00000517          	auipc	a0,0x0
  800660:	3dc50513          	addi	a0,a0,988 # 800a38 <error_string+0x1f8>
  800664:	9c3ff0ef          	jal	ra,800026 <__panic>
  800668:	00000697          	auipc	a3,0x0
  80066c:	3a868693          	addi	a3,a3,936 # 800a10 <error_string+0x1d0>
  800670:	00000617          	auipc	a2,0x0
  800674:	3b060613          	addi	a2,a2,944 # 800a20 <error_string+0x1e0>
  800678:	02c00593          	li	a1,44
  80067c:	00000517          	auipc	a0,0x0
  800680:	3bc50513          	addi	a0,a0,956 # 800a38 <error_string+0x1f8>
  800684:	9a3ff0ef          	jal	ra,800026 <__panic>
  800688:	f07ff0ef          	jal	ra,80058e <loop>
  80068c:	4008                	lw	a0,0(s0)
  80068e:	ac1ff0ef          	jal	ra,80014e <kill>
  800692:	00000617          	auipc	a2,0x0
  800696:	3de60613          	addi	a2,a2,990 # 800a70 <error_string+0x230>
  80069a:	03900593          	li	a1,57
  80069e:	00000517          	auipc	a0,0x0
  8006a2:	39a50513          	addi	a0,a0,922 # 800a38 <error_string+0x1f8>
  8006a6:	981ff0ef          	jal	ra,800026 <__panic>
  8006aa:	ef7ff0ef          	jal	ra,8005a0 <work>
