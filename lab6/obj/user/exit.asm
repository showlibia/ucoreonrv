
obj/__user_exit.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	12a000ef          	jal	ra,80014a <umain>
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
  800038:	64c50513          	addi	a0,a0,1612 # 800680 <main+0x118>
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
  800058:	9dc50513          	addi	a0,a0,-1572 # 800a30 <error_string+0x220>
  80005c:	044000ef          	jal	ra,8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0c6000ef          	jal	ra,800128 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0b4000ef          	jal	ra,800122 <sys_putc>
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
  800094:	12e000ef          	jal	ra,8001c2 <vprintfmt>
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
  8000c8:	0fa000ef          	jal	ra,8001c2 <vprintfmt>
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

0000000000800122 <sys_putc>:
  800122:	85aa                	mv	a1,a0
  800124:	4579                	li	a0,30
  800126:	b77d                	j	8000d4 <syscall>

0000000000800128 <exit>:
  800128:	1141                	addi	sp,sp,-16
  80012a:	e406                	sd	ra,8(sp)
  80012c:	fe1ff0ef          	jal	ra,80010c <sys_exit>
  800130:	00000517          	auipc	a0,0x0
  800134:	57050513          	addi	a0,a0,1392 # 8006a0 <main+0x138>
  800138:	f69ff0ef          	jal	ra,8000a0 <cprintf>
  80013c:	a001                	j	80013c <exit+0x14>

000000000080013e <fork>:
  80013e:	bfd1                	j	800112 <sys_fork>

0000000000800140 <wait>:
  800140:	4581                	li	a1,0
  800142:	4501                	li	a0,0
  800144:	bfc9                	j	800116 <sys_wait>

0000000000800146 <waitpid>:
  800146:	bfc1                	j	800116 <sys_wait>

0000000000800148 <yield>:
  800148:	bfd9                	j	80011e <sys_yield>

000000000080014a <umain>:
  80014a:	1141                	addi	sp,sp,-16
  80014c:	e406                	sd	ra,8(sp)
  80014e:	41a000ef          	jal	ra,800568 <main>
  800152:	fd7ff0ef          	jal	ra,800128 <exit>

0000000000800156 <printnum>:
  800156:	02069813          	slli	a6,a3,0x20
  80015a:	7179                	addi	sp,sp,-48
  80015c:	02085813          	srli	a6,a6,0x20
  800160:	e052                	sd	s4,0(sp)
  800162:	03067a33          	remu	s4,a2,a6
  800166:	f022                	sd	s0,32(sp)
  800168:	ec26                	sd	s1,24(sp)
  80016a:	e84a                	sd	s2,16(sp)
  80016c:	f406                	sd	ra,40(sp)
  80016e:	e44e                	sd	s3,8(sp)
  800170:	84aa                	mv	s1,a0
  800172:	892e                	mv	s2,a1
  800174:	fff7041b          	addiw	s0,a4,-1
  800178:	2a01                	sext.w	s4,s4
  80017a:	03067e63          	bgeu	a2,a6,8001b6 <printnum+0x60>
  80017e:	89be                	mv	s3,a5
  800180:	00805763          	blez	s0,80018e <printnum+0x38>
  800184:	347d                	addiw	s0,s0,-1
  800186:	85ca                	mv	a1,s2
  800188:	854e                	mv	a0,s3
  80018a:	9482                	jalr	s1
  80018c:	fc65                	bnez	s0,800184 <printnum+0x2e>
  80018e:	1a02                	slli	s4,s4,0x20
  800190:	020a5a13          	srli	s4,s4,0x20
  800194:	00000797          	auipc	a5,0x0
  800198:	74478793          	addi	a5,a5,1860 # 8008d8 <error_string+0xc8>
  80019c:	9a3e                	add	s4,s4,a5
  80019e:	7402                	ld	s0,32(sp)
  8001a0:	000a4503          	lbu	a0,0(s4)
  8001a4:	70a2                	ld	ra,40(sp)
  8001a6:	69a2                	ld	s3,8(sp)
  8001a8:	6a02                	ld	s4,0(sp)
  8001aa:	85ca                	mv	a1,s2
  8001ac:	8326                	mv	t1,s1
  8001ae:	6942                	ld	s2,16(sp)
  8001b0:	64e2                	ld	s1,24(sp)
  8001b2:	6145                	addi	sp,sp,48
  8001b4:	8302                	jr	t1
  8001b6:	03065633          	divu	a2,a2,a6
  8001ba:	8722                	mv	a4,s0
  8001bc:	f9bff0ef          	jal	ra,800156 <printnum>
  8001c0:	b7f9                	j	80018e <printnum+0x38>

00000000008001c2 <vprintfmt>:
  8001c2:	7119                	addi	sp,sp,-128
  8001c4:	f4a6                	sd	s1,104(sp)
  8001c6:	f0ca                	sd	s2,96(sp)
  8001c8:	e8d2                	sd	s4,80(sp)
  8001ca:	e4d6                	sd	s5,72(sp)
  8001cc:	e0da                	sd	s6,64(sp)
  8001ce:	fc5e                	sd	s7,56(sp)
  8001d0:	f862                	sd	s8,48(sp)
  8001d2:	f06a                	sd	s10,32(sp)
  8001d4:	fc86                	sd	ra,120(sp)
  8001d6:	f8a2                	sd	s0,112(sp)
  8001d8:	ecce                	sd	s3,88(sp)
  8001da:	f466                	sd	s9,40(sp)
  8001dc:	ec6e                	sd	s11,24(sp)
  8001de:	892a                	mv	s2,a0
  8001e0:	84ae                	mv	s1,a1
  8001e2:	8d32                	mv	s10,a2
  8001e4:	8ab6                	mv	s5,a3
  8001e6:	5b7d                	li	s6,-1
  8001e8:	00000a17          	auipc	s4,0x0
  8001ec:	4cca0a13          	addi	s4,s4,1228 # 8006b4 <main+0x14c>
  8001f0:	05e00b93          	li	s7,94
  8001f4:	00000c17          	auipc	s8,0x0
  8001f8:	61cc0c13          	addi	s8,s8,1564 # 800810 <error_string>
  8001fc:	000d4503          	lbu	a0,0(s10)
  800200:	02500793          	li	a5,37
  800204:	001d0413          	addi	s0,s10,1
  800208:	00f50e63          	beq	a0,a5,800224 <vprintfmt+0x62>
  80020c:	c521                	beqz	a0,800254 <vprintfmt+0x92>
  80020e:	02500993          	li	s3,37
  800212:	a011                	j	800216 <vprintfmt+0x54>
  800214:	c121                	beqz	a0,800254 <vprintfmt+0x92>
  800216:	85a6                	mv	a1,s1
  800218:	0405                	addi	s0,s0,1
  80021a:	9902                	jalr	s2
  80021c:	fff44503          	lbu	a0,-1(s0)
  800220:	ff351ae3          	bne	a0,s3,800214 <vprintfmt+0x52>
  800224:	00044603          	lbu	a2,0(s0)
  800228:	02000793          	li	a5,32
  80022c:	4981                	li	s3,0
  80022e:	4801                	li	a6,0
  800230:	5cfd                	li	s9,-1
  800232:	5dfd                	li	s11,-1
  800234:	05500593          	li	a1,85
  800238:	4525                	li	a0,9
  80023a:	fdd6069b          	addiw	a3,a2,-35
  80023e:	0ff6f693          	andi	a3,a3,255
  800242:	00140d13          	addi	s10,s0,1
  800246:	1ed5ef63          	bltu	a1,a3,800444 <vprintfmt+0x282>
  80024a:	068a                	slli	a3,a3,0x2
  80024c:	96d2                	add	a3,a3,s4
  80024e:	4294                	lw	a3,0(a3)
  800250:	96d2                	add	a3,a3,s4
  800252:	8682                	jr	a3
  800254:	70e6                	ld	ra,120(sp)
  800256:	7446                	ld	s0,112(sp)
  800258:	74a6                	ld	s1,104(sp)
  80025a:	7906                	ld	s2,96(sp)
  80025c:	69e6                	ld	s3,88(sp)
  80025e:	6a46                	ld	s4,80(sp)
  800260:	6aa6                	ld	s5,72(sp)
  800262:	6b06                	ld	s6,64(sp)
  800264:	7be2                	ld	s7,56(sp)
  800266:	7c42                	ld	s8,48(sp)
  800268:	7ca2                	ld	s9,40(sp)
  80026a:	7d02                	ld	s10,32(sp)
  80026c:	6de2                	ld	s11,24(sp)
  80026e:	6109                	addi	sp,sp,128
  800270:	8082                	ret
  800272:	87b2                	mv	a5,a2
  800274:	00144603          	lbu	a2,1(s0)
  800278:	846a                	mv	s0,s10
  80027a:	b7c1                	j	80023a <vprintfmt+0x78>
  80027c:	000aac83          	lw	s9,0(s5)
  800280:	00144603          	lbu	a2,1(s0)
  800284:	0aa1                	addi	s5,s5,8
  800286:	846a                	mv	s0,s10
  800288:	fa0dd9e3          	bgez	s11,80023a <vprintfmt+0x78>
  80028c:	8de6                	mv	s11,s9
  80028e:	5cfd                	li	s9,-1
  800290:	b76d                	j	80023a <vprintfmt+0x78>
  800292:	fffdc693          	not	a3,s11
  800296:	96fd                	srai	a3,a3,0x3f
  800298:	00ddfdb3          	and	s11,s11,a3
  80029c:	00144603          	lbu	a2,1(s0)
  8002a0:	2d81                	sext.w	s11,s11
  8002a2:	846a                	mv	s0,s10
  8002a4:	bf59                	j	80023a <vprintfmt+0x78>
  8002a6:	4705                	li	a4,1
  8002a8:	008a8593          	addi	a1,s5,8
  8002ac:	01074463          	blt	a4,a6,8002b4 <vprintfmt+0xf2>
  8002b0:	22080863          	beqz	a6,8004e0 <vprintfmt+0x31e>
  8002b4:	000ab603          	ld	a2,0(s5)
  8002b8:	46c1                	li	a3,16
  8002ba:	8aae                	mv	s5,a1
  8002bc:	a291                	j	800400 <vprintfmt+0x23e>
  8002be:	fd060c9b          	addiw	s9,a2,-48
  8002c2:	00144603          	lbu	a2,1(s0)
  8002c6:	846a                	mv	s0,s10
  8002c8:	fd06069b          	addiw	a3,a2,-48
  8002cc:	0006089b          	sext.w	a7,a2
  8002d0:	fad56ce3          	bltu	a0,a3,800288 <vprintfmt+0xc6>
  8002d4:	0405                	addi	s0,s0,1
  8002d6:	002c969b          	slliw	a3,s9,0x2
  8002da:	00044603          	lbu	a2,0(s0)
  8002de:	0196873b          	addw	a4,a3,s9
  8002e2:	0017171b          	slliw	a4,a4,0x1
  8002e6:	0117073b          	addw	a4,a4,a7
  8002ea:	fd06069b          	addiw	a3,a2,-48
  8002ee:	fd070c9b          	addiw	s9,a4,-48
  8002f2:	0006089b          	sext.w	a7,a2
  8002f6:	fcd57fe3          	bgeu	a0,a3,8002d4 <vprintfmt+0x112>
  8002fa:	b779                	j	800288 <vprintfmt+0xc6>
  8002fc:	000aa503          	lw	a0,0(s5)
  800300:	85a6                	mv	a1,s1
  800302:	0aa1                	addi	s5,s5,8
  800304:	9902                	jalr	s2
  800306:	bddd                	j	8001fc <vprintfmt+0x3a>
  800308:	4705                	li	a4,1
  80030a:	008a8993          	addi	s3,s5,8
  80030e:	01074463          	blt	a4,a6,800316 <vprintfmt+0x154>
  800312:	1c080463          	beqz	a6,8004da <vprintfmt+0x318>
  800316:	000ab403          	ld	s0,0(s5)
  80031a:	1c044a63          	bltz	s0,8004ee <vprintfmt+0x32c>
  80031e:	8622                	mv	a2,s0
  800320:	8ace                	mv	s5,s3
  800322:	46a9                	li	a3,10
  800324:	a8f1                	j	800400 <vprintfmt+0x23e>
  800326:	000aa783          	lw	a5,0(s5)
  80032a:	4761                	li	a4,24
  80032c:	0aa1                	addi	s5,s5,8
  80032e:	41f7d69b          	sraiw	a3,a5,0x1f
  800332:	8fb5                	xor	a5,a5,a3
  800334:	40d786bb          	subw	a3,a5,a3
  800338:	12d74963          	blt	a4,a3,80046a <vprintfmt+0x2a8>
  80033c:	00369793          	slli	a5,a3,0x3
  800340:	97e2                	add	a5,a5,s8
  800342:	639c                	ld	a5,0(a5)
  800344:	12078363          	beqz	a5,80046a <vprintfmt+0x2a8>
  800348:	86be                	mv	a3,a5
  80034a:	00000617          	auipc	a2,0x0
  80034e:	67e60613          	addi	a2,a2,1662 # 8009c8 <error_string+0x1b8>
  800352:	85a6                	mv	a1,s1
  800354:	854a                	mv	a0,s2
  800356:	1cc000ef          	jal	ra,800522 <printfmt>
  80035a:	b54d                	j	8001fc <vprintfmt+0x3a>
  80035c:	000ab603          	ld	a2,0(s5)
  800360:	0aa1                	addi	s5,s5,8
  800362:	1a060163          	beqz	a2,800504 <vprintfmt+0x342>
  800366:	00160413          	addi	s0,a2,1
  80036a:	15b05763          	blez	s11,8004b8 <vprintfmt+0x2f6>
  80036e:	02d00593          	li	a1,45
  800372:	10b79d63          	bne	a5,a1,80048c <vprintfmt+0x2ca>
  800376:	00064783          	lbu	a5,0(a2)
  80037a:	0007851b          	sext.w	a0,a5
  80037e:	c905                	beqz	a0,8003ae <vprintfmt+0x1ec>
  800380:	000cc563          	bltz	s9,80038a <vprintfmt+0x1c8>
  800384:	3cfd                	addiw	s9,s9,-1
  800386:	036c8263          	beq	s9,s6,8003aa <vprintfmt+0x1e8>
  80038a:	85a6                	mv	a1,s1
  80038c:	14098f63          	beqz	s3,8004ea <vprintfmt+0x328>
  800390:	3781                	addiw	a5,a5,-32
  800392:	14fbfc63          	bgeu	s7,a5,8004ea <vprintfmt+0x328>
  800396:	03f00513          	li	a0,63
  80039a:	9902                	jalr	s2
  80039c:	0405                	addi	s0,s0,1
  80039e:	fff44783          	lbu	a5,-1(s0)
  8003a2:	3dfd                	addiw	s11,s11,-1
  8003a4:	0007851b          	sext.w	a0,a5
  8003a8:	fd61                	bnez	a0,800380 <vprintfmt+0x1be>
  8003aa:	e5b059e3          	blez	s11,8001fc <vprintfmt+0x3a>
  8003ae:	3dfd                	addiw	s11,s11,-1
  8003b0:	85a6                	mv	a1,s1
  8003b2:	02000513          	li	a0,32
  8003b6:	9902                	jalr	s2
  8003b8:	e40d82e3          	beqz	s11,8001fc <vprintfmt+0x3a>
  8003bc:	3dfd                	addiw	s11,s11,-1
  8003be:	85a6                	mv	a1,s1
  8003c0:	02000513          	li	a0,32
  8003c4:	9902                	jalr	s2
  8003c6:	fe0d94e3          	bnez	s11,8003ae <vprintfmt+0x1ec>
  8003ca:	bd0d                	j	8001fc <vprintfmt+0x3a>
  8003cc:	4705                	li	a4,1
  8003ce:	008a8593          	addi	a1,s5,8
  8003d2:	01074463          	blt	a4,a6,8003da <vprintfmt+0x218>
  8003d6:	0e080863          	beqz	a6,8004c6 <vprintfmt+0x304>
  8003da:	000ab603          	ld	a2,0(s5)
  8003de:	46a1                	li	a3,8
  8003e0:	8aae                	mv	s5,a1
  8003e2:	a839                	j	800400 <vprintfmt+0x23e>
  8003e4:	03000513          	li	a0,48
  8003e8:	85a6                	mv	a1,s1
  8003ea:	e03e                	sd	a5,0(sp)
  8003ec:	9902                	jalr	s2
  8003ee:	85a6                	mv	a1,s1
  8003f0:	07800513          	li	a0,120
  8003f4:	9902                	jalr	s2
  8003f6:	0aa1                	addi	s5,s5,8
  8003f8:	ff8ab603          	ld	a2,-8(s5)
  8003fc:	6782                	ld	a5,0(sp)
  8003fe:	46c1                	li	a3,16
  800400:	2781                	sext.w	a5,a5
  800402:	876e                	mv	a4,s11
  800404:	85a6                	mv	a1,s1
  800406:	854a                	mv	a0,s2
  800408:	d4fff0ef          	jal	ra,800156 <printnum>
  80040c:	bbc5                	j	8001fc <vprintfmt+0x3a>
  80040e:	00144603          	lbu	a2,1(s0)
  800412:	2805                	addiw	a6,a6,1
  800414:	846a                	mv	s0,s10
  800416:	b515                	j	80023a <vprintfmt+0x78>
  800418:	00144603          	lbu	a2,1(s0)
  80041c:	4985                	li	s3,1
  80041e:	846a                	mv	s0,s10
  800420:	bd29                	j	80023a <vprintfmt+0x78>
  800422:	85a6                	mv	a1,s1
  800424:	02500513          	li	a0,37
  800428:	9902                	jalr	s2
  80042a:	bbc9                	j	8001fc <vprintfmt+0x3a>
  80042c:	4705                	li	a4,1
  80042e:	008a8593          	addi	a1,s5,8
  800432:	01074463          	blt	a4,a6,80043a <vprintfmt+0x278>
  800436:	08080d63          	beqz	a6,8004d0 <vprintfmt+0x30e>
  80043a:	000ab603          	ld	a2,0(s5)
  80043e:	46a9                	li	a3,10
  800440:	8aae                	mv	s5,a1
  800442:	bf7d                	j	800400 <vprintfmt+0x23e>
  800444:	85a6                	mv	a1,s1
  800446:	02500513          	li	a0,37
  80044a:	9902                	jalr	s2
  80044c:	fff44703          	lbu	a4,-1(s0)
  800450:	02500793          	li	a5,37
  800454:	8d22                	mv	s10,s0
  800456:	daf703e3          	beq	a4,a5,8001fc <vprintfmt+0x3a>
  80045a:	02500713          	li	a4,37
  80045e:	1d7d                	addi	s10,s10,-1
  800460:	fffd4783          	lbu	a5,-1(s10)
  800464:	fee79de3          	bne	a5,a4,80045e <vprintfmt+0x29c>
  800468:	bb51                	j	8001fc <vprintfmt+0x3a>
  80046a:	00000617          	auipc	a2,0x0
  80046e:	54e60613          	addi	a2,a2,1358 # 8009b8 <error_string+0x1a8>
  800472:	85a6                	mv	a1,s1
  800474:	854a                	mv	a0,s2
  800476:	0ac000ef          	jal	ra,800522 <printfmt>
  80047a:	b349                	j	8001fc <vprintfmt+0x3a>
  80047c:	00000617          	auipc	a2,0x0
  800480:	53460613          	addi	a2,a2,1332 # 8009b0 <error_string+0x1a0>
  800484:	00000417          	auipc	s0,0x0
  800488:	52d40413          	addi	s0,s0,1325 # 8009b1 <error_string+0x1a1>
  80048c:	8532                	mv	a0,a2
  80048e:	85e6                	mv	a1,s9
  800490:	e032                	sd	a2,0(sp)
  800492:	e43e                	sd	a5,8(sp)
  800494:	0ae000ef          	jal	ra,800542 <strnlen>
  800498:	40ad8dbb          	subw	s11,s11,a0
  80049c:	6602                	ld	a2,0(sp)
  80049e:	01b05d63          	blez	s11,8004b8 <vprintfmt+0x2f6>
  8004a2:	67a2                	ld	a5,8(sp)
  8004a4:	2781                	sext.w	a5,a5
  8004a6:	e43e                	sd	a5,8(sp)
  8004a8:	6522                	ld	a0,8(sp)
  8004aa:	85a6                	mv	a1,s1
  8004ac:	e032                	sd	a2,0(sp)
  8004ae:	3dfd                	addiw	s11,s11,-1
  8004b0:	9902                	jalr	s2
  8004b2:	6602                	ld	a2,0(sp)
  8004b4:	fe0d9ae3          	bnez	s11,8004a8 <vprintfmt+0x2e6>
  8004b8:	00064783          	lbu	a5,0(a2)
  8004bc:	0007851b          	sext.w	a0,a5
  8004c0:	ec0510e3          	bnez	a0,800380 <vprintfmt+0x1be>
  8004c4:	bb25                	j	8001fc <vprintfmt+0x3a>
  8004c6:	000ae603          	lwu	a2,0(s5)
  8004ca:	46a1                	li	a3,8
  8004cc:	8aae                	mv	s5,a1
  8004ce:	bf0d                	j	800400 <vprintfmt+0x23e>
  8004d0:	000ae603          	lwu	a2,0(s5)
  8004d4:	46a9                	li	a3,10
  8004d6:	8aae                	mv	s5,a1
  8004d8:	b725                	j	800400 <vprintfmt+0x23e>
  8004da:	000aa403          	lw	s0,0(s5)
  8004de:	bd35                	j	80031a <vprintfmt+0x158>
  8004e0:	000ae603          	lwu	a2,0(s5)
  8004e4:	46c1                	li	a3,16
  8004e6:	8aae                	mv	s5,a1
  8004e8:	bf21                	j	800400 <vprintfmt+0x23e>
  8004ea:	9902                	jalr	s2
  8004ec:	bd45                	j	80039c <vprintfmt+0x1da>
  8004ee:	85a6                	mv	a1,s1
  8004f0:	02d00513          	li	a0,45
  8004f4:	e03e                	sd	a5,0(sp)
  8004f6:	9902                	jalr	s2
  8004f8:	8ace                	mv	s5,s3
  8004fa:	40800633          	neg	a2,s0
  8004fe:	46a9                	li	a3,10
  800500:	6782                	ld	a5,0(sp)
  800502:	bdfd                	j	800400 <vprintfmt+0x23e>
  800504:	01b05663          	blez	s11,800510 <vprintfmt+0x34e>
  800508:	02d00693          	li	a3,45
  80050c:	f6d798e3          	bne	a5,a3,80047c <vprintfmt+0x2ba>
  800510:	00000417          	auipc	s0,0x0
  800514:	4a140413          	addi	s0,s0,1185 # 8009b1 <error_string+0x1a1>
  800518:	02800513          	li	a0,40
  80051c:	02800793          	li	a5,40
  800520:	b585                	j	800380 <vprintfmt+0x1be>

0000000000800522 <printfmt>:
  800522:	715d                	addi	sp,sp,-80
  800524:	02810313          	addi	t1,sp,40
  800528:	f436                	sd	a3,40(sp)
  80052a:	869a                	mv	a3,t1
  80052c:	ec06                	sd	ra,24(sp)
  80052e:	f83a                	sd	a4,48(sp)
  800530:	fc3e                	sd	a5,56(sp)
  800532:	e0c2                	sd	a6,64(sp)
  800534:	e4c6                	sd	a7,72(sp)
  800536:	e41a                	sd	t1,8(sp)
  800538:	c8bff0ef          	jal	ra,8001c2 <vprintfmt>
  80053c:	60e2                	ld	ra,24(sp)
  80053e:	6161                	addi	sp,sp,80
  800540:	8082                	ret

0000000000800542 <strnlen>:
  800542:	c185                	beqz	a1,800562 <strnlen+0x20>
  800544:	00054783          	lbu	a5,0(a0)
  800548:	cf89                	beqz	a5,800562 <strnlen+0x20>
  80054a:	4781                	li	a5,0
  80054c:	a021                	j	800554 <strnlen+0x12>
  80054e:	00074703          	lbu	a4,0(a4)
  800552:	c711                	beqz	a4,80055e <strnlen+0x1c>
  800554:	0785                	addi	a5,a5,1
  800556:	00f50733          	add	a4,a0,a5
  80055a:	fef59ae3          	bne	a1,a5,80054e <strnlen+0xc>
  80055e:	853e                	mv	a0,a5
  800560:	8082                	ret
  800562:	4781                	li	a5,0
  800564:	853e                	mv	a0,a5
  800566:	8082                	ret

0000000000800568 <main>:
  800568:	1101                	addi	sp,sp,-32
  80056a:	00000517          	auipc	a0,0x0
  80056e:	46650513          	addi	a0,a0,1126 # 8009d0 <error_string+0x1c0>
  800572:	ec06                	sd	ra,24(sp)
  800574:	e822                	sd	s0,16(sp)
  800576:	b2bff0ef          	jal	ra,8000a0 <cprintf>
  80057a:	bc5ff0ef          	jal	ra,80013e <fork>
  80057e:	c569                	beqz	a0,800648 <main+0xe0>
  800580:	842a                	mv	s0,a0
  800582:	85aa                	mv	a1,a0
  800584:	00000517          	auipc	a0,0x0
  800588:	48c50513          	addi	a0,a0,1164 # 800a10 <error_string+0x200>
  80058c:	b15ff0ef          	jal	ra,8000a0 <cprintf>
  800590:	08805d63          	blez	s0,80062a <main+0xc2>
  800594:	00000517          	auipc	a0,0x0
  800598:	4d450513          	addi	a0,a0,1236 # 800a68 <error_string+0x258>
  80059c:	b05ff0ef          	jal	ra,8000a0 <cprintf>
  8005a0:	006c                	addi	a1,sp,12
  8005a2:	8522                	mv	a0,s0
  8005a4:	ba3ff0ef          	jal	ra,800146 <waitpid>
  8005a8:	e139                	bnez	a0,8005ee <main+0x86>
  8005aa:	00001797          	auipc	a5,0x1
  8005ae:	a5678793          	addi	a5,a5,-1450 # 801000 <magic>
  8005b2:	4732                	lw	a4,12(sp)
  8005b4:	439c                	lw	a5,0(a5)
  8005b6:	02f71c63          	bne	a4,a5,8005ee <main+0x86>
  8005ba:	006c                	addi	a1,sp,12
  8005bc:	8522                	mv	a0,s0
  8005be:	b89ff0ef          	jal	ra,800146 <waitpid>
  8005c2:	c529                	beqz	a0,80060c <main+0xa4>
  8005c4:	b7dff0ef          	jal	ra,800140 <wait>
  8005c8:	c131                	beqz	a0,80060c <main+0xa4>
  8005ca:	85a2                	mv	a1,s0
  8005cc:	00000517          	auipc	a0,0x0
  8005d0:	51450513          	addi	a0,a0,1300 # 800ae0 <error_string+0x2d0>
  8005d4:	acdff0ef          	jal	ra,8000a0 <cprintf>
  8005d8:	00000517          	auipc	a0,0x0
  8005dc:	51850513          	addi	a0,a0,1304 # 800af0 <error_string+0x2e0>
  8005e0:	ac1ff0ef          	jal	ra,8000a0 <cprintf>
  8005e4:	60e2                	ld	ra,24(sp)
  8005e6:	6442                	ld	s0,16(sp)
  8005e8:	4501                	li	a0,0
  8005ea:	6105                	addi	sp,sp,32
  8005ec:	8082                	ret
  8005ee:	00000697          	auipc	a3,0x0
  8005f2:	49a68693          	addi	a3,a3,1178 # 800a88 <error_string+0x278>
  8005f6:	00000617          	auipc	a2,0x0
  8005fa:	44a60613          	addi	a2,a2,1098 # 800a40 <error_string+0x230>
  8005fe:	45ed                	li	a1,27
  800600:	00000517          	auipc	a0,0x0
  800604:	45850513          	addi	a0,a0,1112 # 800a58 <error_string+0x248>
  800608:	a1fff0ef          	jal	ra,800026 <__panic>
  80060c:	00000697          	auipc	a3,0x0
  800610:	4ac68693          	addi	a3,a3,1196 # 800ab8 <error_string+0x2a8>
  800614:	00000617          	auipc	a2,0x0
  800618:	42c60613          	addi	a2,a2,1068 # 800a40 <error_string+0x230>
  80061c:	45f1                	li	a1,28
  80061e:	00000517          	auipc	a0,0x0
  800622:	43a50513          	addi	a0,a0,1082 # 800a58 <error_string+0x248>
  800626:	a01ff0ef          	jal	ra,800026 <__panic>
  80062a:	00000697          	auipc	a3,0x0
  80062e:	40e68693          	addi	a3,a3,1038 # 800a38 <error_string+0x228>
  800632:	00000617          	auipc	a2,0x0
  800636:	40e60613          	addi	a2,a2,1038 # 800a40 <error_string+0x230>
  80063a:	45e1                	li	a1,24
  80063c:	00000517          	auipc	a0,0x0
  800640:	41c50513          	addi	a0,a0,1052 # 800a58 <error_string+0x248>
  800644:	9e3ff0ef          	jal	ra,800026 <__panic>
  800648:	00000517          	auipc	a0,0x0
  80064c:	3b050513          	addi	a0,a0,944 # 8009f8 <error_string+0x1e8>
  800650:	a51ff0ef          	jal	ra,8000a0 <cprintf>
  800654:	af5ff0ef          	jal	ra,800148 <yield>
  800658:	af1ff0ef          	jal	ra,800148 <yield>
  80065c:	aedff0ef          	jal	ra,800148 <yield>
  800660:	ae9ff0ef          	jal	ra,800148 <yield>
  800664:	ae5ff0ef          	jal	ra,800148 <yield>
  800668:	ae1ff0ef          	jal	ra,800148 <yield>
  80066c:	addff0ef          	jal	ra,800148 <yield>
  800670:	00001797          	auipc	a5,0x1
  800674:	99078793          	addi	a5,a5,-1648 # 801000 <magic>
  800678:	4388                	lw	a0,0(a5)
  80067a:	aafff0ef          	jal	ra,800128 <exit>
