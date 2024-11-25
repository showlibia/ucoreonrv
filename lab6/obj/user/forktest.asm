
obj/__user_forktest.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	122000ef          	jal	ra,800142 <umain>
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
  800038:	5d450513          	addi	a0,a0,1492 # 800608 <main+0xa8>
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
  800058:	5d450513          	addi	a0,a0,1492 # 800628 <main+0xc8>
  80005c:	044000ef          	jal	ra,8000a0 <cprintf>
  800060:	5559                	li	a0,-10
  800062:	0c2000ef          	jal	ra,800124 <exit>

0000000000800066 <cputch>:
  800066:	1141                	addi	sp,sp,-16
  800068:	e022                	sd	s0,0(sp)
  80006a:	e406                	sd	ra,8(sp)
  80006c:	842e                	mv	s0,a1
  80006e:	0b0000ef          	jal	ra,80011e <sys_putc>
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
  800094:	126000ef          	jal	ra,8001ba <vprintfmt>
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
  8000c8:	0f2000ef          	jal	ra,8001ba <vprintfmt>
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

000000000080011e <sys_putc>:
  80011e:	85aa                	mv	a1,a0
  800120:	4579                	li	a0,30
  800122:	bf4d                	j	8000d4 <syscall>

0000000000800124 <exit>:
  800124:	1141                	addi	sp,sp,-16
  800126:	e406                	sd	ra,8(sp)
  800128:	fe5ff0ef          	jal	ra,80010c <sys_exit>
  80012c:	00000517          	auipc	a0,0x0
  800130:	50450513          	addi	a0,a0,1284 # 800630 <main+0xd0>
  800134:	f6dff0ef          	jal	ra,8000a0 <cprintf>
  800138:	a001                	j	800138 <exit+0x14>

000000000080013a <fork>:
  80013a:	bfe1                	j	800112 <sys_fork>

000000000080013c <wait>:
  80013c:	4581                	li	a1,0
  80013e:	4501                	li	a0,0
  800140:	bfd9                	j	800116 <sys_wait>

0000000000800142 <umain>:
  800142:	1141                	addi	sp,sp,-16
  800144:	e406                	sd	ra,8(sp)
  800146:	41a000ef          	jal	ra,800560 <main>
  80014a:	fdbff0ef          	jal	ra,800124 <exit>

000000000080014e <printnum>:
  80014e:	02069813          	slli	a6,a3,0x20
  800152:	7179                	addi	sp,sp,-48
  800154:	02085813          	srli	a6,a6,0x20
  800158:	e052                	sd	s4,0(sp)
  80015a:	03067a33          	remu	s4,a2,a6
  80015e:	f022                	sd	s0,32(sp)
  800160:	ec26                	sd	s1,24(sp)
  800162:	e84a                	sd	s2,16(sp)
  800164:	f406                	sd	ra,40(sp)
  800166:	e44e                	sd	s3,8(sp)
  800168:	84aa                	mv	s1,a0
  80016a:	892e                	mv	s2,a1
  80016c:	fff7041b          	addiw	s0,a4,-1
  800170:	2a01                	sext.w	s4,s4
  800172:	03067e63          	bgeu	a2,a6,8001ae <printnum+0x60>
  800176:	89be                	mv	s3,a5
  800178:	00805763          	blez	s0,800186 <printnum+0x38>
  80017c:	347d                	addiw	s0,s0,-1
  80017e:	85ca                	mv	a1,s2
  800180:	854e                	mv	a0,s3
  800182:	9482                	jalr	s1
  800184:	fc65                	bnez	s0,80017c <printnum+0x2e>
  800186:	1a02                	slli	s4,s4,0x20
  800188:	020a5a13          	srli	s4,s4,0x20
  80018c:	00000797          	auipc	a5,0x0
  800190:	6dc78793          	addi	a5,a5,1756 # 800868 <error_string+0xc8>
  800194:	9a3e                	add	s4,s4,a5
  800196:	7402                	ld	s0,32(sp)
  800198:	000a4503          	lbu	a0,0(s4)
  80019c:	70a2                	ld	ra,40(sp)
  80019e:	69a2                	ld	s3,8(sp)
  8001a0:	6a02                	ld	s4,0(sp)
  8001a2:	85ca                	mv	a1,s2
  8001a4:	8326                	mv	t1,s1
  8001a6:	6942                	ld	s2,16(sp)
  8001a8:	64e2                	ld	s1,24(sp)
  8001aa:	6145                	addi	sp,sp,48
  8001ac:	8302                	jr	t1
  8001ae:	03065633          	divu	a2,a2,a6
  8001b2:	8722                	mv	a4,s0
  8001b4:	f9bff0ef          	jal	ra,80014e <printnum>
  8001b8:	b7f9                	j	800186 <printnum+0x38>

00000000008001ba <vprintfmt>:
  8001ba:	7119                	addi	sp,sp,-128
  8001bc:	f4a6                	sd	s1,104(sp)
  8001be:	f0ca                	sd	s2,96(sp)
  8001c0:	e8d2                	sd	s4,80(sp)
  8001c2:	e4d6                	sd	s5,72(sp)
  8001c4:	e0da                	sd	s6,64(sp)
  8001c6:	fc5e                	sd	s7,56(sp)
  8001c8:	f862                	sd	s8,48(sp)
  8001ca:	f06a                	sd	s10,32(sp)
  8001cc:	fc86                	sd	ra,120(sp)
  8001ce:	f8a2                	sd	s0,112(sp)
  8001d0:	ecce                	sd	s3,88(sp)
  8001d2:	f466                	sd	s9,40(sp)
  8001d4:	ec6e                	sd	s11,24(sp)
  8001d6:	892a                	mv	s2,a0
  8001d8:	84ae                	mv	s1,a1
  8001da:	8d32                	mv	s10,a2
  8001dc:	8ab6                	mv	s5,a3
  8001de:	5b7d                	li	s6,-1
  8001e0:	00000a17          	auipc	s4,0x0
  8001e4:	464a0a13          	addi	s4,s4,1124 # 800644 <main+0xe4>
  8001e8:	05e00b93          	li	s7,94
  8001ec:	00000c17          	auipc	s8,0x0
  8001f0:	5b4c0c13          	addi	s8,s8,1460 # 8007a0 <error_string>
  8001f4:	000d4503          	lbu	a0,0(s10)
  8001f8:	02500793          	li	a5,37
  8001fc:	001d0413          	addi	s0,s10,1
  800200:	00f50e63          	beq	a0,a5,80021c <vprintfmt+0x62>
  800204:	c521                	beqz	a0,80024c <vprintfmt+0x92>
  800206:	02500993          	li	s3,37
  80020a:	a011                	j	80020e <vprintfmt+0x54>
  80020c:	c121                	beqz	a0,80024c <vprintfmt+0x92>
  80020e:	85a6                	mv	a1,s1
  800210:	0405                	addi	s0,s0,1
  800212:	9902                	jalr	s2
  800214:	fff44503          	lbu	a0,-1(s0)
  800218:	ff351ae3          	bne	a0,s3,80020c <vprintfmt+0x52>
  80021c:	00044603          	lbu	a2,0(s0)
  800220:	02000793          	li	a5,32
  800224:	4981                	li	s3,0
  800226:	4801                	li	a6,0
  800228:	5cfd                	li	s9,-1
  80022a:	5dfd                	li	s11,-1
  80022c:	05500593          	li	a1,85
  800230:	4525                	li	a0,9
  800232:	fdd6069b          	addiw	a3,a2,-35
  800236:	0ff6f693          	andi	a3,a3,255
  80023a:	00140d13          	addi	s10,s0,1
  80023e:	1ed5ef63          	bltu	a1,a3,80043c <vprintfmt+0x282>
  800242:	068a                	slli	a3,a3,0x2
  800244:	96d2                	add	a3,a3,s4
  800246:	4294                	lw	a3,0(a3)
  800248:	96d2                	add	a3,a3,s4
  80024a:	8682                	jr	a3
  80024c:	70e6                	ld	ra,120(sp)
  80024e:	7446                	ld	s0,112(sp)
  800250:	74a6                	ld	s1,104(sp)
  800252:	7906                	ld	s2,96(sp)
  800254:	69e6                	ld	s3,88(sp)
  800256:	6a46                	ld	s4,80(sp)
  800258:	6aa6                	ld	s5,72(sp)
  80025a:	6b06                	ld	s6,64(sp)
  80025c:	7be2                	ld	s7,56(sp)
  80025e:	7c42                	ld	s8,48(sp)
  800260:	7ca2                	ld	s9,40(sp)
  800262:	7d02                	ld	s10,32(sp)
  800264:	6de2                	ld	s11,24(sp)
  800266:	6109                	addi	sp,sp,128
  800268:	8082                	ret
  80026a:	87b2                	mv	a5,a2
  80026c:	00144603          	lbu	a2,1(s0)
  800270:	846a                	mv	s0,s10
  800272:	b7c1                	j	800232 <vprintfmt+0x78>
  800274:	000aac83          	lw	s9,0(s5)
  800278:	00144603          	lbu	a2,1(s0)
  80027c:	0aa1                	addi	s5,s5,8
  80027e:	846a                	mv	s0,s10
  800280:	fa0dd9e3          	bgez	s11,800232 <vprintfmt+0x78>
  800284:	8de6                	mv	s11,s9
  800286:	5cfd                	li	s9,-1
  800288:	b76d                	j	800232 <vprintfmt+0x78>
  80028a:	fffdc693          	not	a3,s11
  80028e:	96fd                	srai	a3,a3,0x3f
  800290:	00ddfdb3          	and	s11,s11,a3
  800294:	00144603          	lbu	a2,1(s0)
  800298:	2d81                	sext.w	s11,s11
  80029a:	846a                	mv	s0,s10
  80029c:	bf59                	j	800232 <vprintfmt+0x78>
  80029e:	4705                	li	a4,1
  8002a0:	008a8593          	addi	a1,s5,8
  8002a4:	01074463          	blt	a4,a6,8002ac <vprintfmt+0xf2>
  8002a8:	22080863          	beqz	a6,8004d8 <vprintfmt+0x31e>
  8002ac:	000ab603          	ld	a2,0(s5)
  8002b0:	46c1                	li	a3,16
  8002b2:	8aae                	mv	s5,a1
  8002b4:	a291                	j	8003f8 <vprintfmt+0x23e>
  8002b6:	fd060c9b          	addiw	s9,a2,-48
  8002ba:	00144603          	lbu	a2,1(s0)
  8002be:	846a                	mv	s0,s10
  8002c0:	fd06069b          	addiw	a3,a2,-48
  8002c4:	0006089b          	sext.w	a7,a2
  8002c8:	fad56ce3          	bltu	a0,a3,800280 <vprintfmt+0xc6>
  8002cc:	0405                	addi	s0,s0,1
  8002ce:	002c969b          	slliw	a3,s9,0x2
  8002d2:	00044603          	lbu	a2,0(s0)
  8002d6:	0196873b          	addw	a4,a3,s9
  8002da:	0017171b          	slliw	a4,a4,0x1
  8002de:	0117073b          	addw	a4,a4,a7
  8002e2:	fd06069b          	addiw	a3,a2,-48
  8002e6:	fd070c9b          	addiw	s9,a4,-48
  8002ea:	0006089b          	sext.w	a7,a2
  8002ee:	fcd57fe3          	bgeu	a0,a3,8002cc <vprintfmt+0x112>
  8002f2:	b779                	j	800280 <vprintfmt+0xc6>
  8002f4:	000aa503          	lw	a0,0(s5)
  8002f8:	85a6                	mv	a1,s1
  8002fa:	0aa1                	addi	s5,s5,8
  8002fc:	9902                	jalr	s2
  8002fe:	bddd                	j	8001f4 <vprintfmt+0x3a>
  800300:	4705                	li	a4,1
  800302:	008a8993          	addi	s3,s5,8
  800306:	01074463          	blt	a4,a6,80030e <vprintfmt+0x154>
  80030a:	1c080463          	beqz	a6,8004d2 <vprintfmt+0x318>
  80030e:	000ab403          	ld	s0,0(s5)
  800312:	1c044a63          	bltz	s0,8004e6 <vprintfmt+0x32c>
  800316:	8622                	mv	a2,s0
  800318:	8ace                	mv	s5,s3
  80031a:	46a9                	li	a3,10
  80031c:	a8f1                	j	8003f8 <vprintfmt+0x23e>
  80031e:	000aa783          	lw	a5,0(s5)
  800322:	4761                	li	a4,24
  800324:	0aa1                	addi	s5,s5,8
  800326:	41f7d69b          	sraiw	a3,a5,0x1f
  80032a:	8fb5                	xor	a5,a5,a3
  80032c:	40d786bb          	subw	a3,a5,a3
  800330:	12d74963          	blt	a4,a3,800462 <vprintfmt+0x2a8>
  800334:	00369793          	slli	a5,a3,0x3
  800338:	97e2                	add	a5,a5,s8
  80033a:	639c                	ld	a5,0(a5)
  80033c:	12078363          	beqz	a5,800462 <vprintfmt+0x2a8>
  800340:	86be                	mv	a3,a5
  800342:	00000617          	auipc	a2,0x0
  800346:	61660613          	addi	a2,a2,1558 # 800958 <error_string+0x1b8>
  80034a:	85a6                	mv	a1,s1
  80034c:	854a                	mv	a0,s2
  80034e:	1cc000ef          	jal	ra,80051a <printfmt>
  800352:	b54d                	j	8001f4 <vprintfmt+0x3a>
  800354:	000ab603          	ld	a2,0(s5)
  800358:	0aa1                	addi	s5,s5,8
  80035a:	1a060163          	beqz	a2,8004fc <vprintfmt+0x342>
  80035e:	00160413          	addi	s0,a2,1
  800362:	15b05763          	blez	s11,8004b0 <vprintfmt+0x2f6>
  800366:	02d00593          	li	a1,45
  80036a:	10b79d63          	bne	a5,a1,800484 <vprintfmt+0x2ca>
  80036e:	00064783          	lbu	a5,0(a2)
  800372:	0007851b          	sext.w	a0,a5
  800376:	c905                	beqz	a0,8003a6 <vprintfmt+0x1ec>
  800378:	000cc563          	bltz	s9,800382 <vprintfmt+0x1c8>
  80037c:	3cfd                	addiw	s9,s9,-1
  80037e:	036c8263          	beq	s9,s6,8003a2 <vprintfmt+0x1e8>
  800382:	85a6                	mv	a1,s1
  800384:	14098f63          	beqz	s3,8004e2 <vprintfmt+0x328>
  800388:	3781                	addiw	a5,a5,-32
  80038a:	14fbfc63          	bgeu	s7,a5,8004e2 <vprintfmt+0x328>
  80038e:	03f00513          	li	a0,63
  800392:	9902                	jalr	s2
  800394:	0405                	addi	s0,s0,1
  800396:	fff44783          	lbu	a5,-1(s0)
  80039a:	3dfd                	addiw	s11,s11,-1
  80039c:	0007851b          	sext.w	a0,a5
  8003a0:	fd61                	bnez	a0,800378 <vprintfmt+0x1be>
  8003a2:	e5b059e3          	blez	s11,8001f4 <vprintfmt+0x3a>
  8003a6:	3dfd                	addiw	s11,s11,-1
  8003a8:	85a6                	mv	a1,s1
  8003aa:	02000513          	li	a0,32
  8003ae:	9902                	jalr	s2
  8003b0:	e40d82e3          	beqz	s11,8001f4 <vprintfmt+0x3a>
  8003b4:	3dfd                	addiw	s11,s11,-1
  8003b6:	85a6                	mv	a1,s1
  8003b8:	02000513          	li	a0,32
  8003bc:	9902                	jalr	s2
  8003be:	fe0d94e3          	bnez	s11,8003a6 <vprintfmt+0x1ec>
  8003c2:	bd0d                	j	8001f4 <vprintfmt+0x3a>
  8003c4:	4705                	li	a4,1
  8003c6:	008a8593          	addi	a1,s5,8
  8003ca:	01074463          	blt	a4,a6,8003d2 <vprintfmt+0x218>
  8003ce:	0e080863          	beqz	a6,8004be <vprintfmt+0x304>
  8003d2:	000ab603          	ld	a2,0(s5)
  8003d6:	46a1                	li	a3,8
  8003d8:	8aae                	mv	s5,a1
  8003da:	a839                	j	8003f8 <vprintfmt+0x23e>
  8003dc:	03000513          	li	a0,48
  8003e0:	85a6                	mv	a1,s1
  8003e2:	e03e                	sd	a5,0(sp)
  8003e4:	9902                	jalr	s2
  8003e6:	85a6                	mv	a1,s1
  8003e8:	07800513          	li	a0,120
  8003ec:	9902                	jalr	s2
  8003ee:	0aa1                	addi	s5,s5,8
  8003f0:	ff8ab603          	ld	a2,-8(s5)
  8003f4:	6782                	ld	a5,0(sp)
  8003f6:	46c1                	li	a3,16
  8003f8:	2781                	sext.w	a5,a5
  8003fa:	876e                	mv	a4,s11
  8003fc:	85a6                	mv	a1,s1
  8003fe:	854a                	mv	a0,s2
  800400:	d4fff0ef          	jal	ra,80014e <printnum>
  800404:	bbc5                	j	8001f4 <vprintfmt+0x3a>
  800406:	00144603          	lbu	a2,1(s0)
  80040a:	2805                	addiw	a6,a6,1
  80040c:	846a                	mv	s0,s10
  80040e:	b515                	j	800232 <vprintfmt+0x78>
  800410:	00144603          	lbu	a2,1(s0)
  800414:	4985                	li	s3,1
  800416:	846a                	mv	s0,s10
  800418:	bd29                	j	800232 <vprintfmt+0x78>
  80041a:	85a6                	mv	a1,s1
  80041c:	02500513          	li	a0,37
  800420:	9902                	jalr	s2
  800422:	bbc9                	j	8001f4 <vprintfmt+0x3a>
  800424:	4705                	li	a4,1
  800426:	008a8593          	addi	a1,s5,8
  80042a:	01074463          	blt	a4,a6,800432 <vprintfmt+0x278>
  80042e:	08080d63          	beqz	a6,8004c8 <vprintfmt+0x30e>
  800432:	000ab603          	ld	a2,0(s5)
  800436:	46a9                	li	a3,10
  800438:	8aae                	mv	s5,a1
  80043a:	bf7d                	j	8003f8 <vprintfmt+0x23e>
  80043c:	85a6                	mv	a1,s1
  80043e:	02500513          	li	a0,37
  800442:	9902                	jalr	s2
  800444:	fff44703          	lbu	a4,-1(s0)
  800448:	02500793          	li	a5,37
  80044c:	8d22                	mv	s10,s0
  80044e:	daf703e3          	beq	a4,a5,8001f4 <vprintfmt+0x3a>
  800452:	02500713          	li	a4,37
  800456:	1d7d                	addi	s10,s10,-1
  800458:	fffd4783          	lbu	a5,-1(s10)
  80045c:	fee79de3          	bne	a5,a4,800456 <vprintfmt+0x29c>
  800460:	bb51                	j	8001f4 <vprintfmt+0x3a>
  800462:	00000617          	auipc	a2,0x0
  800466:	4e660613          	addi	a2,a2,1254 # 800948 <error_string+0x1a8>
  80046a:	85a6                	mv	a1,s1
  80046c:	854a                	mv	a0,s2
  80046e:	0ac000ef          	jal	ra,80051a <printfmt>
  800472:	b349                	j	8001f4 <vprintfmt+0x3a>
  800474:	00000617          	auipc	a2,0x0
  800478:	4cc60613          	addi	a2,a2,1228 # 800940 <error_string+0x1a0>
  80047c:	00000417          	auipc	s0,0x0
  800480:	4c540413          	addi	s0,s0,1221 # 800941 <error_string+0x1a1>
  800484:	8532                	mv	a0,a2
  800486:	85e6                	mv	a1,s9
  800488:	e032                	sd	a2,0(sp)
  80048a:	e43e                	sd	a5,8(sp)
  80048c:	0ae000ef          	jal	ra,80053a <strnlen>
  800490:	40ad8dbb          	subw	s11,s11,a0
  800494:	6602                	ld	a2,0(sp)
  800496:	01b05d63          	blez	s11,8004b0 <vprintfmt+0x2f6>
  80049a:	67a2                	ld	a5,8(sp)
  80049c:	2781                	sext.w	a5,a5
  80049e:	e43e                	sd	a5,8(sp)
  8004a0:	6522                	ld	a0,8(sp)
  8004a2:	85a6                	mv	a1,s1
  8004a4:	e032                	sd	a2,0(sp)
  8004a6:	3dfd                	addiw	s11,s11,-1
  8004a8:	9902                	jalr	s2
  8004aa:	6602                	ld	a2,0(sp)
  8004ac:	fe0d9ae3          	bnez	s11,8004a0 <vprintfmt+0x2e6>
  8004b0:	00064783          	lbu	a5,0(a2)
  8004b4:	0007851b          	sext.w	a0,a5
  8004b8:	ec0510e3          	bnez	a0,800378 <vprintfmt+0x1be>
  8004bc:	bb25                	j	8001f4 <vprintfmt+0x3a>
  8004be:	000ae603          	lwu	a2,0(s5)
  8004c2:	46a1                	li	a3,8
  8004c4:	8aae                	mv	s5,a1
  8004c6:	bf0d                	j	8003f8 <vprintfmt+0x23e>
  8004c8:	000ae603          	lwu	a2,0(s5)
  8004cc:	46a9                	li	a3,10
  8004ce:	8aae                	mv	s5,a1
  8004d0:	b725                	j	8003f8 <vprintfmt+0x23e>
  8004d2:	000aa403          	lw	s0,0(s5)
  8004d6:	bd35                	j	800312 <vprintfmt+0x158>
  8004d8:	000ae603          	lwu	a2,0(s5)
  8004dc:	46c1                	li	a3,16
  8004de:	8aae                	mv	s5,a1
  8004e0:	bf21                	j	8003f8 <vprintfmt+0x23e>
  8004e2:	9902                	jalr	s2
  8004e4:	bd45                	j	800394 <vprintfmt+0x1da>
  8004e6:	85a6                	mv	a1,s1
  8004e8:	02d00513          	li	a0,45
  8004ec:	e03e                	sd	a5,0(sp)
  8004ee:	9902                	jalr	s2
  8004f0:	8ace                	mv	s5,s3
  8004f2:	40800633          	neg	a2,s0
  8004f6:	46a9                	li	a3,10
  8004f8:	6782                	ld	a5,0(sp)
  8004fa:	bdfd                	j	8003f8 <vprintfmt+0x23e>
  8004fc:	01b05663          	blez	s11,800508 <vprintfmt+0x34e>
  800500:	02d00693          	li	a3,45
  800504:	f6d798e3          	bne	a5,a3,800474 <vprintfmt+0x2ba>
  800508:	00000417          	auipc	s0,0x0
  80050c:	43940413          	addi	s0,s0,1081 # 800941 <error_string+0x1a1>
  800510:	02800513          	li	a0,40
  800514:	02800793          	li	a5,40
  800518:	b585                	j	800378 <vprintfmt+0x1be>

000000000080051a <printfmt>:
  80051a:	715d                	addi	sp,sp,-80
  80051c:	02810313          	addi	t1,sp,40
  800520:	f436                	sd	a3,40(sp)
  800522:	869a                	mv	a3,t1
  800524:	ec06                	sd	ra,24(sp)
  800526:	f83a                	sd	a4,48(sp)
  800528:	fc3e                	sd	a5,56(sp)
  80052a:	e0c2                	sd	a6,64(sp)
  80052c:	e4c6                	sd	a7,72(sp)
  80052e:	e41a                	sd	t1,8(sp)
  800530:	c8bff0ef          	jal	ra,8001ba <vprintfmt>
  800534:	60e2                	ld	ra,24(sp)
  800536:	6161                	addi	sp,sp,80
  800538:	8082                	ret

000000000080053a <strnlen>:
  80053a:	c185                	beqz	a1,80055a <strnlen+0x20>
  80053c:	00054783          	lbu	a5,0(a0)
  800540:	cf89                	beqz	a5,80055a <strnlen+0x20>
  800542:	4781                	li	a5,0
  800544:	a021                	j	80054c <strnlen+0x12>
  800546:	00074703          	lbu	a4,0(a4)
  80054a:	c711                	beqz	a4,800556 <strnlen+0x1c>
  80054c:	0785                	addi	a5,a5,1
  80054e:	00f50733          	add	a4,a0,a5
  800552:	fef59ae3          	bne	a1,a5,800546 <strnlen+0xc>
  800556:	853e                	mv	a0,a5
  800558:	8082                	ret
  80055a:	4781                	li	a5,0
  80055c:	853e                	mv	a0,a5
  80055e:	8082                	ret

0000000000800560 <main>:
  800560:	1101                	addi	sp,sp,-32
  800562:	e822                	sd	s0,16(sp)
  800564:	e426                	sd	s1,8(sp)
  800566:	ec06                	sd	ra,24(sp)
  800568:	4401                	li	s0,0
  80056a:	02000493          	li	s1,32
  80056e:	bcdff0ef          	jal	ra,80013a <fork>
  800572:	cd05                	beqz	a0,8005aa <main+0x4a>
  800574:	06a05063          	blez	a0,8005d4 <main+0x74>
  800578:	2405                	addiw	s0,s0,1
  80057a:	fe941ae3          	bne	s0,s1,80056e <main+0xe>
  80057e:	02000413          	li	s0,32
  800582:	bbbff0ef          	jal	ra,80013c <wait>
  800586:	ed05                	bnez	a0,8005be <main+0x5e>
  800588:	347d                	addiw	s0,s0,-1
  80058a:	fc65                	bnez	s0,800582 <main+0x22>
  80058c:	bb1ff0ef          	jal	ra,80013c <wait>
  800590:	c12d                	beqz	a0,8005f2 <main+0x92>
  800592:	00000517          	auipc	a0,0x0
  800596:	43e50513          	addi	a0,a0,1086 # 8009d0 <error_string+0x230>
  80059a:	b07ff0ef          	jal	ra,8000a0 <cprintf>
  80059e:	60e2                	ld	ra,24(sp)
  8005a0:	6442                	ld	s0,16(sp)
  8005a2:	64a2                	ld	s1,8(sp)
  8005a4:	4501                	li	a0,0
  8005a6:	6105                	addi	sp,sp,32
  8005a8:	8082                	ret
  8005aa:	85a2                	mv	a1,s0
  8005ac:	00000517          	auipc	a0,0x0
  8005b0:	3b450513          	addi	a0,a0,948 # 800960 <error_string+0x1c0>
  8005b4:	aedff0ef          	jal	ra,8000a0 <cprintf>
  8005b8:	4501                	li	a0,0
  8005ba:	b6bff0ef          	jal	ra,800124 <exit>
  8005be:	00000617          	auipc	a2,0x0
  8005c2:	3e260613          	addi	a2,a2,994 # 8009a0 <error_string+0x200>
  8005c6:	45dd                	li	a1,23
  8005c8:	00000517          	auipc	a0,0x0
  8005cc:	3c850513          	addi	a0,a0,968 # 800990 <error_string+0x1f0>
  8005d0:	a57ff0ef          	jal	ra,800026 <__panic>
  8005d4:	00000697          	auipc	a3,0x0
  8005d8:	39c68693          	addi	a3,a3,924 # 800970 <error_string+0x1d0>
  8005dc:	00000617          	auipc	a2,0x0
  8005e0:	39c60613          	addi	a2,a2,924 # 800978 <error_string+0x1d8>
  8005e4:	45b9                	li	a1,14
  8005e6:	00000517          	auipc	a0,0x0
  8005ea:	3aa50513          	addi	a0,a0,938 # 800990 <error_string+0x1f0>
  8005ee:	a39ff0ef          	jal	ra,800026 <__panic>
  8005f2:	00000617          	auipc	a2,0x0
  8005f6:	3c660613          	addi	a2,a2,966 # 8009b8 <error_string+0x218>
  8005fa:	45f1                	li	a1,28
  8005fc:	00000517          	auipc	a0,0x0
  800600:	39450513          	addi	a0,a0,916 # 800990 <error_string+0x1f0>
  800604:	a23ff0ef          	jal	ra,800026 <__panic>
