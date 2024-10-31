
obj/__user_yield.out：     文件格式 elf64-littleriscv


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

000000000080005e <sys_yield>:
  80005e:	4529                	li	a0,10
  800060:	b7c1                	j	800020 <syscall>

0000000000800062 <sys_getpid>:
  800062:	4549                	li	a0,18
  800064:	bf75                	j	800020 <syscall>

0000000000800066 <sys_putc>:
  800066:	85aa                	mv	a1,a0
  800068:	4579                	li	a0,30
  80006a:	bf5d                	j	800020 <syscall>

000000000080006c <exit>:
  80006c:	1141                	addi	sp,sp,-16
  80006e:	e406                	sd	ra,8(sp)
  800070:	fe9ff0ef          	jal	ra,800058 <sys_exit>
  800074:	00000517          	auipc	a0,0x0
  800078:	4f450513          	addi	a0,a0,1268 # 800568 <main+0x70>
  80007c:	02a000ef          	jal	ra,8000a6 <cprintf>
  800080:	a001                	j	800080 <exit+0x14>

0000000000800082 <yield>:
  800082:	bff1                	j	80005e <sys_yield>

0000000000800084 <getpid>:
  800084:	bff9                	j	800062 <sys_getpid>

0000000000800086 <_start>:
  800086:	054000ef          	jal	ra,8000da <umain>
  80008a:	a001                	j	80008a <_start+0x4>

000000000080008c <cputch>:
  80008c:	1141                	addi	sp,sp,-16
  80008e:	e022                	sd	s0,0(sp)
  800090:	e406                	sd	ra,8(sp)
  800092:	842e                	mv	s0,a1
  800094:	fd3ff0ef          	jal	ra,800066 <sys_putc>
  800098:	401c                	lw	a5,0(s0)
  80009a:	60a2                	ld	ra,8(sp)
  80009c:	2785                	addiw	a5,a5,1
  80009e:	c01c                	sw	a5,0(s0)
  8000a0:	6402                	ld	s0,0(sp)
  8000a2:	0141                	addi	sp,sp,16
  8000a4:	8082                	ret

00000000008000a6 <cprintf>:
  8000a6:	711d                	addi	sp,sp,-96
  8000a8:	02810313          	addi	t1,sp,40
  8000ac:	f42e                	sd	a1,40(sp)
  8000ae:	f832                	sd	a2,48(sp)
  8000b0:	fc36                	sd	a3,56(sp)
  8000b2:	862a                	mv	a2,a0
  8000b4:	004c                	addi	a1,sp,4
  8000b6:	00000517          	auipc	a0,0x0
  8000ba:	fd650513          	addi	a0,a0,-42 # 80008c <cputch>
  8000be:	869a                	mv	a3,t1
  8000c0:	ec06                	sd	ra,24(sp)
  8000c2:	e0ba                	sd	a4,64(sp)
  8000c4:	e4be                	sd	a5,72(sp)
  8000c6:	e8c2                	sd	a6,80(sp)
  8000c8:	ecc6                	sd	a7,88(sp)
  8000ca:	e41a                	sd	t1,8(sp)
  8000cc:	c202                	sw	zero,4(sp)
  8000ce:	0aa000ef          	jal	ra,800178 <vprintfmt>
  8000d2:	60e2                	ld	ra,24(sp)
  8000d4:	4512                	lw	a0,4(sp)
  8000d6:	6125                	addi	sp,sp,96
  8000d8:	8082                	ret

00000000008000da <umain>:
  8000da:	1141                	addi	sp,sp,-16
  8000dc:	e406                	sd	ra,8(sp)
  8000de:	41a000ef          	jal	ra,8004f8 <main>
  8000e2:	f8bff0ef          	jal	ra,80006c <exit>

00000000008000e6 <strnlen>:
  8000e6:	c185                	beqz	a1,800106 <strnlen+0x20>
  8000e8:	00054783          	lbu	a5,0(a0)
  8000ec:	cf89                	beqz	a5,800106 <strnlen+0x20>
  8000ee:	4781                	li	a5,0
  8000f0:	a021                	j	8000f8 <strnlen+0x12>
  8000f2:	00074703          	lbu	a4,0(a4)
  8000f6:	c711                	beqz	a4,800102 <strnlen+0x1c>
  8000f8:	0785                	addi	a5,a5,1
  8000fa:	00f50733          	add	a4,a0,a5
  8000fe:	fef59ae3          	bne	a1,a5,8000f2 <strnlen+0xc>
  800102:	853e                	mv	a0,a5
  800104:	8082                	ret
  800106:	4781                	li	a5,0
  800108:	853e                	mv	a0,a5
  80010a:	8082                	ret

000000000080010c <printnum>:
  80010c:	02069813          	slli	a6,a3,0x20
  800110:	7179                	addi	sp,sp,-48
  800112:	02085813          	srli	a6,a6,0x20
  800116:	e052                	sd	s4,0(sp)
  800118:	03067a33          	remu	s4,a2,a6
  80011c:	f022                	sd	s0,32(sp)
  80011e:	ec26                	sd	s1,24(sp)
  800120:	e84a                	sd	s2,16(sp)
  800122:	f406                	sd	ra,40(sp)
  800124:	e44e                	sd	s3,8(sp)
  800126:	84aa                	mv	s1,a0
  800128:	892e                	mv	s2,a1
  80012a:	fff7041b          	addiw	s0,a4,-1
  80012e:	2a01                	sext.w	s4,s4
  800130:	03067e63          	bgeu	a2,a6,80016c <printnum+0x60>
  800134:	89be                	mv	s3,a5
  800136:	00805763          	blez	s0,800144 <printnum+0x38>
  80013a:	347d                	addiw	s0,s0,-1
  80013c:	85ca                	mv	a1,s2
  80013e:	854e                	mv	a0,s3
  800140:	9482                	jalr	s1
  800142:	fc65                	bnez	s0,80013a <printnum+0x2e>
  800144:	1a02                	slli	s4,s4,0x20
  800146:	020a5a13          	srli	s4,s4,0x20
  80014a:	00000797          	auipc	a5,0x0
  80014e:	65678793          	addi	a5,a5,1622 # 8007a0 <error_string+0xc8>
  800152:	9a3e                	add	s4,s4,a5
  800154:	7402                	ld	s0,32(sp)
  800156:	000a4503          	lbu	a0,0(s4)
  80015a:	70a2                	ld	ra,40(sp)
  80015c:	69a2                	ld	s3,8(sp)
  80015e:	6a02                	ld	s4,0(sp)
  800160:	85ca                	mv	a1,s2
  800162:	8326                	mv	t1,s1
  800164:	6942                	ld	s2,16(sp)
  800166:	64e2                	ld	s1,24(sp)
  800168:	6145                	addi	sp,sp,48
  80016a:	8302                	jr	t1
  80016c:	03065633          	divu	a2,a2,a6
  800170:	8722                	mv	a4,s0
  800172:	f9bff0ef          	jal	ra,80010c <printnum>
  800176:	b7f9                	j	800144 <printnum+0x38>

0000000000800178 <vprintfmt>:
  800178:	7119                	addi	sp,sp,-128
  80017a:	f4a6                	sd	s1,104(sp)
  80017c:	f0ca                	sd	s2,96(sp)
  80017e:	e8d2                	sd	s4,80(sp)
  800180:	e4d6                	sd	s5,72(sp)
  800182:	e0da                	sd	s6,64(sp)
  800184:	fc5e                	sd	s7,56(sp)
  800186:	f862                	sd	s8,48(sp)
  800188:	f06a                	sd	s10,32(sp)
  80018a:	fc86                	sd	ra,120(sp)
  80018c:	f8a2                	sd	s0,112(sp)
  80018e:	ecce                	sd	s3,88(sp)
  800190:	f466                	sd	s9,40(sp)
  800192:	ec6e                	sd	s11,24(sp)
  800194:	892a                	mv	s2,a0
  800196:	84ae                	mv	s1,a1
  800198:	8d32                	mv	s10,a2
  80019a:	8ab6                	mv	s5,a3
  80019c:	5b7d                	li	s6,-1
  80019e:	00000a17          	auipc	s4,0x0
  8001a2:	3dea0a13          	addi	s4,s4,990 # 80057c <main+0x84>
  8001a6:	05e00b93          	li	s7,94
  8001aa:	00000c17          	auipc	s8,0x0
  8001ae:	52ec0c13          	addi	s8,s8,1326 # 8006d8 <error_string>
  8001b2:	000d4503          	lbu	a0,0(s10)
  8001b6:	02500793          	li	a5,37
  8001ba:	001d0413          	addi	s0,s10,1
  8001be:	00f50e63          	beq	a0,a5,8001da <vprintfmt+0x62>
  8001c2:	c521                	beqz	a0,80020a <vprintfmt+0x92>
  8001c4:	02500993          	li	s3,37
  8001c8:	a011                	j	8001cc <vprintfmt+0x54>
  8001ca:	c121                	beqz	a0,80020a <vprintfmt+0x92>
  8001cc:	85a6                	mv	a1,s1
  8001ce:	0405                	addi	s0,s0,1
  8001d0:	9902                	jalr	s2
  8001d2:	fff44503          	lbu	a0,-1(s0)
  8001d6:	ff351ae3          	bne	a0,s3,8001ca <vprintfmt+0x52>
  8001da:	00044603          	lbu	a2,0(s0)
  8001de:	02000793          	li	a5,32
  8001e2:	4981                	li	s3,0
  8001e4:	4801                	li	a6,0
  8001e6:	5cfd                	li	s9,-1
  8001e8:	5dfd                	li	s11,-1
  8001ea:	05500593          	li	a1,85
  8001ee:	4525                	li	a0,9
  8001f0:	fdd6069b          	addiw	a3,a2,-35
  8001f4:	0ff6f693          	andi	a3,a3,255
  8001f8:	00140d13          	addi	s10,s0,1
  8001fc:	1ed5ef63          	bltu	a1,a3,8003fa <vprintfmt+0x282>
  800200:	068a                	slli	a3,a3,0x2
  800202:	96d2                	add	a3,a3,s4
  800204:	4294                	lw	a3,0(a3)
  800206:	96d2                	add	a3,a3,s4
  800208:	8682                	jr	a3
  80020a:	70e6                	ld	ra,120(sp)
  80020c:	7446                	ld	s0,112(sp)
  80020e:	74a6                	ld	s1,104(sp)
  800210:	7906                	ld	s2,96(sp)
  800212:	69e6                	ld	s3,88(sp)
  800214:	6a46                	ld	s4,80(sp)
  800216:	6aa6                	ld	s5,72(sp)
  800218:	6b06                	ld	s6,64(sp)
  80021a:	7be2                	ld	s7,56(sp)
  80021c:	7c42                	ld	s8,48(sp)
  80021e:	7ca2                	ld	s9,40(sp)
  800220:	7d02                	ld	s10,32(sp)
  800222:	6de2                	ld	s11,24(sp)
  800224:	6109                	addi	sp,sp,128
  800226:	8082                	ret
  800228:	87b2                	mv	a5,a2
  80022a:	00144603          	lbu	a2,1(s0)
  80022e:	846a                	mv	s0,s10
  800230:	b7c1                	j	8001f0 <vprintfmt+0x78>
  800232:	000aac83          	lw	s9,0(s5)
  800236:	00144603          	lbu	a2,1(s0)
  80023a:	0aa1                	addi	s5,s5,8
  80023c:	846a                	mv	s0,s10
  80023e:	fa0dd9e3          	bgez	s11,8001f0 <vprintfmt+0x78>
  800242:	8de6                	mv	s11,s9
  800244:	5cfd                	li	s9,-1
  800246:	b76d                	j	8001f0 <vprintfmt+0x78>
  800248:	fffdc693          	not	a3,s11
  80024c:	96fd                	srai	a3,a3,0x3f
  80024e:	00ddfdb3          	and	s11,s11,a3
  800252:	00144603          	lbu	a2,1(s0)
  800256:	2d81                	sext.w	s11,s11
  800258:	846a                	mv	s0,s10
  80025a:	bf59                	j	8001f0 <vprintfmt+0x78>
  80025c:	4705                	li	a4,1
  80025e:	008a8593          	addi	a1,s5,8
  800262:	01074463          	blt	a4,a6,80026a <vprintfmt+0xf2>
  800266:	22080863          	beqz	a6,800496 <vprintfmt+0x31e>
  80026a:	000ab603          	ld	a2,0(s5)
  80026e:	46c1                	li	a3,16
  800270:	8aae                	mv	s5,a1
  800272:	a291                	j	8003b6 <vprintfmt+0x23e>
  800274:	fd060c9b          	addiw	s9,a2,-48
  800278:	00144603          	lbu	a2,1(s0)
  80027c:	846a                	mv	s0,s10
  80027e:	fd06069b          	addiw	a3,a2,-48
  800282:	0006089b          	sext.w	a7,a2
  800286:	fad56ce3          	bltu	a0,a3,80023e <vprintfmt+0xc6>
  80028a:	0405                	addi	s0,s0,1
  80028c:	002c969b          	slliw	a3,s9,0x2
  800290:	00044603          	lbu	a2,0(s0)
  800294:	0196873b          	addw	a4,a3,s9
  800298:	0017171b          	slliw	a4,a4,0x1
  80029c:	0117073b          	addw	a4,a4,a7
  8002a0:	fd06069b          	addiw	a3,a2,-48
  8002a4:	fd070c9b          	addiw	s9,a4,-48
  8002a8:	0006089b          	sext.w	a7,a2
  8002ac:	fcd57fe3          	bgeu	a0,a3,80028a <vprintfmt+0x112>
  8002b0:	b779                	j	80023e <vprintfmt+0xc6>
  8002b2:	000aa503          	lw	a0,0(s5)
  8002b6:	85a6                	mv	a1,s1
  8002b8:	0aa1                	addi	s5,s5,8
  8002ba:	9902                	jalr	s2
  8002bc:	bddd                	j	8001b2 <vprintfmt+0x3a>
  8002be:	4705                	li	a4,1
  8002c0:	008a8993          	addi	s3,s5,8
  8002c4:	01074463          	blt	a4,a6,8002cc <vprintfmt+0x154>
  8002c8:	1c080463          	beqz	a6,800490 <vprintfmt+0x318>
  8002cc:	000ab403          	ld	s0,0(s5)
  8002d0:	1c044a63          	bltz	s0,8004a4 <vprintfmt+0x32c>
  8002d4:	8622                	mv	a2,s0
  8002d6:	8ace                	mv	s5,s3
  8002d8:	46a9                	li	a3,10
  8002da:	a8f1                	j	8003b6 <vprintfmt+0x23e>
  8002dc:	000aa783          	lw	a5,0(s5)
  8002e0:	4761                	li	a4,24
  8002e2:	0aa1                	addi	s5,s5,8
  8002e4:	41f7d69b          	sraiw	a3,a5,0x1f
  8002e8:	8fb5                	xor	a5,a5,a3
  8002ea:	40d786bb          	subw	a3,a5,a3
  8002ee:	12d74963          	blt	a4,a3,800420 <vprintfmt+0x2a8>
  8002f2:	00369793          	slli	a5,a3,0x3
  8002f6:	97e2                	add	a5,a5,s8
  8002f8:	639c                	ld	a5,0(a5)
  8002fa:	12078363          	beqz	a5,800420 <vprintfmt+0x2a8>
  8002fe:	86be                	mv	a3,a5
  800300:	00000617          	auipc	a2,0x0
  800304:	59060613          	addi	a2,a2,1424 # 800890 <error_string+0x1b8>
  800308:	85a6                	mv	a1,s1
  80030a:	854a                	mv	a0,s2
  80030c:	1cc000ef          	jal	ra,8004d8 <printfmt>
  800310:	b54d                	j	8001b2 <vprintfmt+0x3a>
  800312:	000ab603          	ld	a2,0(s5)
  800316:	0aa1                	addi	s5,s5,8
  800318:	1a060163          	beqz	a2,8004ba <vprintfmt+0x342>
  80031c:	00160413          	addi	s0,a2,1
  800320:	15b05763          	blez	s11,80046e <vprintfmt+0x2f6>
  800324:	02d00593          	li	a1,45
  800328:	10b79d63          	bne	a5,a1,800442 <vprintfmt+0x2ca>
  80032c:	00064783          	lbu	a5,0(a2)
  800330:	0007851b          	sext.w	a0,a5
  800334:	c905                	beqz	a0,800364 <vprintfmt+0x1ec>
  800336:	000cc563          	bltz	s9,800340 <vprintfmt+0x1c8>
  80033a:	3cfd                	addiw	s9,s9,-1
  80033c:	036c8263          	beq	s9,s6,800360 <vprintfmt+0x1e8>
  800340:	85a6                	mv	a1,s1
  800342:	14098f63          	beqz	s3,8004a0 <vprintfmt+0x328>
  800346:	3781                	addiw	a5,a5,-32
  800348:	14fbfc63          	bgeu	s7,a5,8004a0 <vprintfmt+0x328>
  80034c:	03f00513          	li	a0,63
  800350:	9902                	jalr	s2
  800352:	0405                	addi	s0,s0,1
  800354:	fff44783          	lbu	a5,-1(s0)
  800358:	3dfd                	addiw	s11,s11,-1
  80035a:	0007851b          	sext.w	a0,a5
  80035e:	fd61                	bnez	a0,800336 <vprintfmt+0x1be>
  800360:	e5b059e3          	blez	s11,8001b2 <vprintfmt+0x3a>
  800364:	3dfd                	addiw	s11,s11,-1
  800366:	85a6                	mv	a1,s1
  800368:	02000513          	li	a0,32
  80036c:	9902                	jalr	s2
  80036e:	e40d82e3          	beqz	s11,8001b2 <vprintfmt+0x3a>
  800372:	3dfd                	addiw	s11,s11,-1
  800374:	85a6                	mv	a1,s1
  800376:	02000513          	li	a0,32
  80037a:	9902                	jalr	s2
  80037c:	fe0d94e3          	bnez	s11,800364 <vprintfmt+0x1ec>
  800380:	bd0d                	j	8001b2 <vprintfmt+0x3a>
  800382:	4705                	li	a4,1
  800384:	008a8593          	addi	a1,s5,8
  800388:	01074463          	blt	a4,a6,800390 <vprintfmt+0x218>
  80038c:	0e080863          	beqz	a6,80047c <vprintfmt+0x304>
  800390:	000ab603          	ld	a2,0(s5)
  800394:	46a1                	li	a3,8
  800396:	8aae                	mv	s5,a1
  800398:	a839                	j	8003b6 <vprintfmt+0x23e>
  80039a:	03000513          	li	a0,48
  80039e:	85a6                	mv	a1,s1
  8003a0:	e03e                	sd	a5,0(sp)
  8003a2:	9902                	jalr	s2
  8003a4:	85a6                	mv	a1,s1
  8003a6:	07800513          	li	a0,120
  8003aa:	9902                	jalr	s2
  8003ac:	0aa1                	addi	s5,s5,8
  8003ae:	ff8ab603          	ld	a2,-8(s5)
  8003b2:	6782                	ld	a5,0(sp)
  8003b4:	46c1                	li	a3,16
  8003b6:	2781                	sext.w	a5,a5
  8003b8:	876e                	mv	a4,s11
  8003ba:	85a6                	mv	a1,s1
  8003bc:	854a                	mv	a0,s2
  8003be:	d4fff0ef          	jal	ra,80010c <printnum>
  8003c2:	bbc5                	j	8001b2 <vprintfmt+0x3a>
  8003c4:	00144603          	lbu	a2,1(s0)
  8003c8:	2805                	addiw	a6,a6,1
  8003ca:	846a                	mv	s0,s10
  8003cc:	b515                	j	8001f0 <vprintfmt+0x78>
  8003ce:	00144603          	lbu	a2,1(s0)
  8003d2:	4985                	li	s3,1
  8003d4:	846a                	mv	s0,s10
  8003d6:	bd29                	j	8001f0 <vprintfmt+0x78>
  8003d8:	85a6                	mv	a1,s1
  8003da:	02500513          	li	a0,37
  8003de:	9902                	jalr	s2
  8003e0:	bbc9                	j	8001b2 <vprintfmt+0x3a>
  8003e2:	4705                	li	a4,1
  8003e4:	008a8593          	addi	a1,s5,8
  8003e8:	01074463          	blt	a4,a6,8003f0 <vprintfmt+0x278>
  8003ec:	08080d63          	beqz	a6,800486 <vprintfmt+0x30e>
  8003f0:	000ab603          	ld	a2,0(s5)
  8003f4:	46a9                	li	a3,10
  8003f6:	8aae                	mv	s5,a1
  8003f8:	bf7d                	j	8003b6 <vprintfmt+0x23e>
  8003fa:	85a6                	mv	a1,s1
  8003fc:	02500513          	li	a0,37
  800400:	9902                	jalr	s2
  800402:	fff44703          	lbu	a4,-1(s0)
  800406:	02500793          	li	a5,37
  80040a:	8d22                	mv	s10,s0
  80040c:	daf703e3          	beq	a4,a5,8001b2 <vprintfmt+0x3a>
  800410:	02500713          	li	a4,37
  800414:	1d7d                	addi	s10,s10,-1
  800416:	fffd4783          	lbu	a5,-1(s10)
  80041a:	fee79de3          	bne	a5,a4,800414 <vprintfmt+0x29c>
  80041e:	bb51                	j	8001b2 <vprintfmt+0x3a>
  800420:	00000617          	auipc	a2,0x0
  800424:	46060613          	addi	a2,a2,1120 # 800880 <error_string+0x1a8>
  800428:	85a6                	mv	a1,s1
  80042a:	854a                	mv	a0,s2
  80042c:	0ac000ef          	jal	ra,8004d8 <printfmt>
  800430:	b349                	j	8001b2 <vprintfmt+0x3a>
  800432:	00000617          	auipc	a2,0x0
  800436:	44660613          	addi	a2,a2,1094 # 800878 <error_string+0x1a0>
  80043a:	00000417          	auipc	s0,0x0
  80043e:	43f40413          	addi	s0,s0,1087 # 800879 <error_string+0x1a1>
  800442:	8532                	mv	a0,a2
  800444:	85e6                	mv	a1,s9
  800446:	e032                	sd	a2,0(sp)
  800448:	e43e                	sd	a5,8(sp)
  80044a:	c9dff0ef          	jal	ra,8000e6 <strnlen>
  80044e:	40ad8dbb          	subw	s11,s11,a0
  800452:	6602                	ld	a2,0(sp)
  800454:	01b05d63          	blez	s11,80046e <vprintfmt+0x2f6>
  800458:	67a2                	ld	a5,8(sp)
  80045a:	2781                	sext.w	a5,a5
  80045c:	e43e                	sd	a5,8(sp)
  80045e:	6522                	ld	a0,8(sp)
  800460:	85a6                	mv	a1,s1
  800462:	e032                	sd	a2,0(sp)
  800464:	3dfd                	addiw	s11,s11,-1
  800466:	9902                	jalr	s2
  800468:	6602                	ld	a2,0(sp)
  80046a:	fe0d9ae3          	bnez	s11,80045e <vprintfmt+0x2e6>
  80046e:	00064783          	lbu	a5,0(a2)
  800472:	0007851b          	sext.w	a0,a5
  800476:	ec0510e3          	bnez	a0,800336 <vprintfmt+0x1be>
  80047a:	bb25                	j	8001b2 <vprintfmt+0x3a>
  80047c:	000ae603          	lwu	a2,0(s5)
  800480:	46a1                	li	a3,8
  800482:	8aae                	mv	s5,a1
  800484:	bf0d                	j	8003b6 <vprintfmt+0x23e>
  800486:	000ae603          	lwu	a2,0(s5)
  80048a:	46a9                	li	a3,10
  80048c:	8aae                	mv	s5,a1
  80048e:	b725                	j	8003b6 <vprintfmt+0x23e>
  800490:	000aa403          	lw	s0,0(s5)
  800494:	bd35                	j	8002d0 <vprintfmt+0x158>
  800496:	000ae603          	lwu	a2,0(s5)
  80049a:	46c1                	li	a3,16
  80049c:	8aae                	mv	s5,a1
  80049e:	bf21                	j	8003b6 <vprintfmt+0x23e>
  8004a0:	9902                	jalr	s2
  8004a2:	bd45                	j	800352 <vprintfmt+0x1da>
  8004a4:	85a6                	mv	a1,s1
  8004a6:	02d00513          	li	a0,45
  8004aa:	e03e                	sd	a5,0(sp)
  8004ac:	9902                	jalr	s2
  8004ae:	8ace                	mv	s5,s3
  8004b0:	40800633          	neg	a2,s0
  8004b4:	46a9                	li	a3,10
  8004b6:	6782                	ld	a5,0(sp)
  8004b8:	bdfd                	j	8003b6 <vprintfmt+0x23e>
  8004ba:	01b05663          	blez	s11,8004c6 <vprintfmt+0x34e>
  8004be:	02d00693          	li	a3,45
  8004c2:	f6d798e3          	bne	a5,a3,800432 <vprintfmt+0x2ba>
  8004c6:	00000417          	auipc	s0,0x0
  8004ca:	3b340413          	addi	s0,s0,947 # 800879 <error_string+0x1a1>
  8004ce:	02800513          	li	a0,40
  8004d2:	02800793          	li	a5,40
  8004d6:	b585                	j	800336 <vprintfmt+0x1be>

00000000008004d8 <printfmt>:
  8004d8:	715d                	addi	sp,sp,-80
  8004da:	02810313          	addi	t1,sp,40
  8004de:	f436                	sd	a3,40(sp)
  8004e0:	869a                	mv	a3,t1
  8004e2:	ec06                	sd	ra,24(sp)
  8004e4:	f83a                	sd	a4,48(sp)
  8004e6:	fc3e                	sd	a5,56(sp)
  8004e8:	e0c2                	sd	a6,64(sp)
  8004ea:	e4c6                	sd	a7,72(sp)
  8004ec:	e41a                	sd	t1,8(sp)
  8004ee:	c8bff0ef          	jal	ra,800178 <vprintfmt>
  8004f2:	60e2                	ld	ra,24(sp)
  8004f4:	6161                	addi	sp,sp,80
  8004f6:	8082                	ret

00000000008004f8 <main>:
  8004f8:	1101                	addi	sp,sp,-32
  8004fa:	ec06                	sd	ra,24(sp)
  8004fc:	e822                	sd	s0,16(sp)
  8004fe:	e426                	sd	s1,8(sp)
  800500:	e04a                	sd	s2,0(sp)
  800502:	b83ff0ef          	jal	ra,800084 <getpid>
  800506:	85aa                	mv	a1,a0
  800508:	00000517          	auipc	a0,0x0
  80050c:	39050513          	addi	a0,a0,912 # 800898 <error_string+0x1c0>
  800510:	b97ff0ef          	jal	ra,8000a6 <cprintf>
  800514:	4401                	li	s0,0
  800516:	00000917          	auipc	s2,0x0
  80051a:	3a290913          	addi	s2,s2,930 # 8008b8 <error_string+0x1e0>
  80051e:	4495                	li	s1,5
  800520:	b63ff0ef          	jal	ra,800082 <yield>
  800524:	b61ff0ef          	jal	ra,800084 <getpid>
  800528:	8622                	mv	a2,s0
  80052a:	85aa                	mv	a1,a0
  80052c:	2405                	addiw	s0,s0,1
  80052e:	854a                	mv	a0,s2
  800530:	b77ff0ef          	jal	ra,8000a6 <cprintf>
  800534:	fe9416e3          	bne	s0,s1,800520 <main+0x28>
  800538:	b4dff0ef          	jal	ra,800084 <getpid>
  80053c:	85aa                	mv	a1,a0
  80053e:	00000517          	auipc	a0,0x0
  800542:	3a250513          	addi	a0,a0,930 # 8008e0 <error_string+0x208>
  800546:	b61ff0ef          	jal	ra,8000a6 <cprintf>
  80054a:	00000517          	auipc	a0,0x0
  80054e:	3b650513          	addi	a0,a0,950 # 800900 <error_string+0x228>
  800552:	b55ff0ef          	jal	ra,8000a6 <cprintf>
  800556:	60e2                	ld	ra,24(sp)
  800558:	6442                	ld	s0,16(sp)
  80055a:	64a2                	ld	s1,8(sp)
  80055c:	6902                	ld	s2,0(sp)
  80055e:	4501                	li	a0,0
  800560:	6105                	addi	sp,sp,32
  800562:	8082                	ret
