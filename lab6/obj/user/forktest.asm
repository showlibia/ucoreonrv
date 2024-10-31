
obj/__user_forktest.out：     文件格式 elf64-littleriscv


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
  800032:	5da50513          	addi	a0,a0,1498 # 800608 <main+0xa8>
  800036:	ec06                	sd	ra,24(sp)
  800038:	f436                	sd	a3,40(sp)
  80003a:	f83a                	sd	a4,48(sp)
  80003c:	e0c2                	sd	a6,64(sp)
  80003e:	e4c6                	sd	a7,72(sp)
  800040:	e43e                	sd	a5,8(sp)
  800042:	0cc000ef          	jal	ra,80010e <cprintf>
  800046:	65a2                	ld	a1,8(sp)
  800048:	8522                	mv	a0,s0
  80004a:	0a4000ef          	jal	ra,8000ee <vcprintf>
  80004e:	00000517          	auipc	a0,0x0
  800052:	5da50513          	addi	a0,a0,1498 # 800628 <main+0xc8>
  800056:	0b8000ef          	jal	ra,80010e <cprintf>
  80005a:	5559                	li	a0,-10
  80005c:	054000ef          	jal	ra,8000b0 <exit>

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

00000000008000aa <sys_putc>:
  8000aa:	85aa                	mv	a1,a0
  8000ac:	4579                	li	a0,30
  8000ae:	bf4d                	j	800060 <syscall>

00000000008000b0 <exit>:
  8000b0:	1141                	addi	sp,sp,-16
  8000b2:	e406                	sd	ra,8(sp)
  8000b4:	fe5ff0ef          	jal	ra,800098 <sys_exit>
  8000b8:	00000517          	auipc	a0,0x0
  8000bc:	57850513          	addi	a0,a0,1400 # 800630 <main+0xd0>
  8000c0:	04e000ef          	jal	ra,80010e <cprintf>
  8000c4:	a001                	j	8000c4 <exit+0x14>

00000000008000c6 <fork>:
  8000c6:	bfe1                	j	80009e <sys_fork>

00000000008000c8 <wait>:
  8000c8:	4581                	li	a1,0
  8000ca:	4501                	li	a0,0
  8000cc:	bfd9                	j	8000a2 <sys_wait>

00000000008000ce <_start>:
  8000ce:	074000ef          	jal	ra,800142 <umain>
  8000d2:	a001                	j	8000d2 <_start+0x4>

00000000008000d4 <cputch>:
  8000d4:	1141                	addi	sp,sp,-16
  8000d6:	e022                	sd	s0,0(sp)
  8000d8:	e406                	sd	ra,8(sp)
  8000da:	842e                	mv	s0,a1
  8000dc:	fcfff0ef          	jal	ra,8000aa <sys_putc>
  8000e0:	401c                	lw	a5,0(s0)
  8000e2:	60a2                	ld	ra,8(sp)
  8000e4:	2785                	addiw	a5,a5,1
  8000e6:	c01c                	sw	a5,0(s0)
  8000e8:	6402                	ld	s0,0(sp)
  8000ea:	0141                	addi	sp,sp,16
  8000ec:	8082                	ret

00000000008000ee <vcprintf>:
  8000ee:	1101                	addi	sp,sp,-32
  8000f0:	86ae                	mv	a3,a1
  8000f2:	862a                	mv	a2,a0
  8000f4:	006c                	addi	a1,sp,12
  8000f6:	00000517          	auipc	a0,0x0
  8000fa:	fde50513          	addi	a0,a0,-34 # 8000d4 <cputch>
  8000fe:	ec06                	sd	ra,24(sp)
  800100:	c602                	sw	zero,12(sp)
  800102:	0de000ef          	jal	ra,8001e0 <vprintfmt>
  800106:	60e2                	ld	ra,24(sp)
  800108:	4532                	lw	a0,12(sp)
  80010a:	6105                	addi	sp,sp,32
  80010c:	8082                	ret

000000000080010e <cprintf>:
  80010e:	711d                	addi	sp,sp,-96
  800110:	02810313          	addi	t1,sp,40
  800114:	f42e                	sd	a1,40(sp)
  800116:	f832                	sd	a2,48(sp)
  800118:	fc36                	sd	a3,56(sp)
  80011a:	862a                	mv	a2,a0
  80011c:	004c                	addi	a1,sp,4
  80011e:	00000517          	auipc	a0,0x0
  800122:	fb650513          	addi	a0,a0,-74 # 8000d4 <cputch>
  800126:	869a                	mv	a3,t1
  800128:	ec06                	sd	ra,24(sp)
  80012a:	e0ba                	sd	a4,64(sp)
  80012c:	e4be                	sd	a5,72(sp)
  80012e:	e8c2                	sd	a6,80(sp)
  800130:	ecc6                	sd	a7,88(sp)
  800132:	e41a                	sd	t1,8(sp)
  800134:	c202                	sw	zero,4(sp)
  800136:	0aa000ef          	jal	ra,8001e0 <vprintfmt>
  80013a:	60e2                	ld	ra,24(sp)
  80013c:	4512                	lw	a0,4(sp)
  80013e:	6125                	addi	sp,sp,96
  800140:	8082                	ret

0000000000800142 <umain>:
  800142:	1141                	addi	sp,sp,-16
  800144:	e406                	sd	ra,8(sp)
  800146:	41a000ef          	jal	ra,800560 <main>
  80014a:	f67ff0ef          	jal	ra,8000b0 <exit>

000000000080014e <strnlen>:
  80014e:	c185                	beqz	a1,80016e <strnlen+0x20>
  800150:	00054783          	lbu	a5,0(a0)
  800154:	cf89                	beqz	a5,80016e <strnlen+0x20>
  800156:	4781                	li	a5,0
  800158:	a021                	j	800160 <strnlen+0x12>
  80015a:	00074703          	lbu	a4,0(a4)
  80015e:	c711                	beqz	a4,80016a <strnlen+0x1c>
  800160:	0785                	addi	a5,a5,1
  800162:	00f50733          	add	a4,a0,a5
  800166:	fef59ae3          	bne	a1,a5,80015a <strnlen+0xc>
  80016a:	853e                	mv	a0,a5
  80016c:	8082                	ret
  80016e:	4781                	li	a5,0
  800170:	853e                	mv	a0,a5
  800172:	8082                	ret

0000000000800174 <printnum>:
  800174:	02069813          	slli	a6,a3,0x20
  800178:	7179                	addi	sp,sp,-48
  80017a:	02085813          	srli	a6,a6,0x20
  80017e:	e052                	sd	s4,0(sp)
  800180:	03067a33          	remu	s4,a2,a6
  800184:	f022                	sd	s0,32(sp)
  800186:	ec26                	sd	s1,24(sp)
  800188:	e84a                	sd	s2,16(sp)
  80018a:	f406                	sd	ra,40(sp)
  80018c:	e44e                	sd	s3,8(sp)
  80018e:	84aa                	mv	s1,a0
  800190:	892e                	mv	s2,a1
  800192:	fff7041b          	addiw	s0,a4,-1
  800196:	2a01                	sext.w	s4,s4
  800198:	03067e63          	bgeu	a2,a6,8001d4 <printnum+0x60>
  80019c:	89be                	mv	s3,a5
  80019e:	00805763          	blez	s0,8001ac <printnum+0x38>
  8001a2:	347d                	addiw	s0,s0,-1
  8001a4:	85ca                	mv	a1,s2
  8001a6:	854e                	mv	a0,s3
  8001a8:	9482                	jalr	s1
  8001aa:	fc65                	bnez	s0,8001a2 <printnum+0x2e>
  8001ac:	1a02                	slli	s4,s4,0x20
  8001ae:	020a5a13          	srli	s4,s4,0x20
  8001b2:	00000797          	auipc	a5,0x0
  8001b6:	6b678793          	addi	a5,a5,1718 # 800868 <error_string+0xc8>
  8001ba:	9a3e                	add	s4,s4,a5
  8001bc:	7402                	ld	s0,32(sp)
  8001be:	000a4503          	lbu	a0,0(s4)
  8001c2:	70a2                	ld	ra,40(sp)
  8001c4:	69a2                	ld	s3,8(sp)
  8001c6:	6a02                	ld	s4,0(sp)
  8001c8:	85ca                	mv	a1,s2
  8001ca:	8326                	mv	t1,s1
  8001cc:	6942                	ld	s2,16(sp)
  8001ce:	64e2                	ld	s1,24(sp)
  8001d0:	6145                	addi	sp,sp,48
  8001d2:	8302                	jr	t1
  8001d4:	03065633          	divu	a2,a2,a6
  8001d8:	8722                	mv	a4,s0
  8001da:	f9bff0ef          	jal	ra,800174 <printnum>
  8001de:	b7f9                	j	8001ac <printnum+0x38>

00000000008001e0 <vprintfmt>:
  8001e0:	7119                	addi	sp,sp,-128
  8001e2:	f4a6                	sd	s1,104(sp)
  8001e4:	f0ca                	sd	s2,96(sp)
  8001e6:	e8d2                	sd	s4,80(sp)
  8001e8:	e4d6                	sd	s5,72(sp)
  8001ea:	e0da                	sd	s6,64(sp)
  8001ec:	fc5e                	sd	s7,56(sp)
  8001ee:	f862                	sd	s8,48(sp)
  8001f0:	f06a                	sd	s10,32(sp)
  8001f2:	fc86                	sd	ra,120(sp)
  8001f4:	f8a2                	sd	s0,112(sp)
  8001f6:	ecce                	sd	s3,88(sp)
  8001f8:	f466                	sd	s9,40(sp)
  8001fa:	ec6e                	sd	s11,24(sp)
  8001fc:	892a                	mv	s2,a0
  8001fe:	84ae                	mv	s1,a1
  800200:	8d32                	mv	s10,a2
  800202:	8ab6                	mv	s5,a3
  800204:	5b7d                	li	s6,-1
  800206:	00000a17          	auipc	s4,0x0
  80020a:	43ea0a13          	addi	s4,s4,1086 # 800644 <main+0xe4>
  80020e:	05e00b93          	li	s7,94
  800212:	00000c17          	auipc	s8,0x0
  800216:	58ec0c13          	addi	s8,s8,1422 # 8007a0 <error_string>
  80021a:	000d4503          	lbu	a0,0(s10)
  80021e:	02500793          	li	a5,37
  800222:	001d0413          	addi	s0,s10,1
  800226:	00f50e63          	beq	a0,a5,800242 <vprintfmt+0x62>
  80022a:	c521                	beqz	a0,800272 <vprintfmt+0x92>
  80022c:	02500993          	li	s3,37
  800230:	a011                	j	800234 <vprintfmt+0x54>
  800232:	c121                	beqz	a0,800272 <vprintfmt+0x92>
  800234:	85a6                	mv	a1,s1
  800236:	0405                	addi	s0,s0,1
  800238:	9902                	jalr	s2
  80023a:	fff44503          	lbu	a0,-1(s0)
  80023e:	ff351ae3          	bne	a0,s3,800232 <vprintfmt+0x52>
  800242:	00044603          	lbu	a2,0(s0)
  800246:	02000793          	li	a5,32
  80024a:	4981                	li	s3,0
  80024c:	4801                	li	a6,0
  80024e:	5cfd                	li	s9,-1
  800250:	5dfd                	li	s11,-1
  800252:	05500593          	li	a1,85
  800256:	4525                	li	a0,9
  800258:	fdd6069b          	addiw	a3,a2,-35
  80025c:	0ff6f693          	andi	a3,a3,255
  800260:	00140d13          	addi	s10,s0,1
  800264:	1ed5ef63          	bltu	a1,a3,800462 <vprintfmt+0x282>
  800268:	068a                	slli	a3,a3,0x2
  80026a:	96d2                	add	a3,a3,s4
  80026c:	4294                	lw	a3,0(a3)
  80026e:	96d2                	add	a3,a3,s4
  800270:	8682                	jr	a3
  800272:	70e6                	ld	ra,120(sp)
  800274:	7446                	ld	s0,112(sp)
  800276:	74a6                	ld	s1,104(sp)
  800278:	7906                	ld	s2,96(sp)
  80027a:	69e6                	ld	s3,88(sp)
  80027c:	6a46                	ld	s4,80(sp)
  80027e:	6aa6                	ld	s5,72(sp)
  800280:	6b06                	ld	s6,64(sp)
  800282:	7be2                	ld	s7,56(sp)
  800284:	7c42                	ld	s8,48(sp)
  800286:	7ca2                	ld	s9,40(sp)
  800288:	7d02                	ld	s10,32(sp)
  80028a:	6de2                	ld	s11,24(sp)
  80028c:	6109                	addi	sp,sp,128
  80028e:	8082                	ret
  800290:	87b2                	mv	a5,a2
  800292:	00144603          	lbu	a2,1(s0)
  800296:	846a                	mv	s0,s10
  800298:	b7c1                	j	800258 <vprintfmt+0x78>
  80029a:	000aac83          	lw	s9,0(s5)
  80029e:	00144603          	lbu	a2,1(s0)
  8002a2:	0aa1                	addi	s5,s5,8
  8002a4:	846a                	mv	s0,s10
  8002a6:	fa0dd9e3          	bgez	s11,800258 <vprintfmt+0x78>
  8002aa:	8de6                	mv	s11,s9
  8002ac:	5cfd                	li	s9,-1
  8002ae:	b76d                	j	800258 <vprintfmt+0x78>
  8002b0:	fffdc693          	not	a3,s11
  8002b4:	96fd                	srai	a3,a3,0x3f
  8002b6:	00ddfdb3          	and	s11,s11,a3
  8002ba:	00144603          	lbu	a2,1(s0)
  8002be:	2d81                	sext.w	s11,s11
  8002c0:	846a                	mv	s0,s10
  8002c2:	bf59                	j	800258 <vprintfmt+0x78>
  8002c4:	4705                	li	a4,1
  8002c6:	008a8593          	addi	a1,s5,8
  8002ca:	01074463          	blt	a4,a6,8002d2 <vprintfmt+0xf2>
  8002ce:	22080863          	beqz	a6,8004fe <vprintfmt+0x31e>
  8002d2:	000ab603          	ld	a2,0(s5)
  8002d6:	46c1                	li	a3,16
  8002d8:	8aae                	mv	s5,a1
  8002da:	a291                	j	80041e <vprintfmt+0x23e>
  8002dc:	fd060c9b          	addiw	s9,a2,-48
  8002e0:	00144603          	lbu	a2,1(s0)
  8002e4:	846a                	mv	s0,s10
  8002e6:	fd06069b          	addiw	a3,a2,-48
  8002ea:	0006089b          	sext.w	a7,a2
  8002ee:	fad56ce3          	bltu	a0,a3,8002a6 <vprintfmt+0xc6>
  8002f2:	0405                	addi	s0,s0,1
  8002f4:	002c969b          	slliw	a3,s9,0x2
  8002f8:	00044603          	lbu	a2,0(s0)
  8002fc:	0196873b          	addw	a4,a3,s9
  800300:	0017171b          	slliw	a4,a4,0x1
  800304:	0117073b          	addw	a4,a4,a7
  800308:	fd06069b          	addiw	a3,a2,-48
  80030c:	fd070c9b          	addiw	s9,a4,-48
  800310:	0006089b          	sext.w	a7,a2
  800314:	fcd57fe3          	bgeu	a0,a3,8002f2 <vprintfmt+0x112>
  800318:	b779                	j	8002a6 <vprintfmt+0xc6>
  80031a:	000aa503          	lw	a0,0(s5)
  80031e:	85a6                	mv	a1,s1
  800320:	0aa1                	addi	s5,s5,8
  800322:	9902                	jalr	s2
  800324:	bddd                	j	80021a <vprintfmt+0x3a>
  800326:	4705                	li	a4,1
  800328:	008a8993          	addi	s3,s5,8
  80032c:	01074463          	blt	a4,a6,800334 <vprintfmt+0x154>
  800330:	1c080463          	beqz	a6,8004f8 <vprintfmt+0x318>
  800334:	000ab403          	ld	s0,0(s5)
  800338:	1c044a63          	bltz	s0,80050c <vprintfmt+0x32c>
  80033c:	8622                	mv	a2,s0
  80033e:	8ace                	mv	s5,s3
  800340:	46a9                	li	a3,10
  800342:	a8f1                	j	80041e <vprintfmt+0x23e>
  800344:	000aa783          	lw	a5,0(s5)
  800348:	4761                	li	a4,24
  80034a:	0aa1                	addi	s5,s5,8
  80034c:	41f7d69b          	sraiw	a3,a5,0x1f
  800350:	8fb5                	xor	a5,a5,a3
  800352:	40d786bb          	subw	a3,a5,a3
  800356:	12d74963          	blt	a4,a3,800488 <vprintfmt+0x2a8>
  80035a:	00369793          	slli	a5,a3,0x3
  80035e:	97e2                	add	a5,a5,s8
  800360:	639c                	ld	a5,0(a5)
  800362:	12078363          	beqz	a5,800488 <vprintfmt+0x2a8>
  800366:	86be                	mv	a3,a5
  800368:	00000617          	auipc	a2,0x0
  80036c:	5f060613          	addi	a2,a2,1520 # 800958 <error_string+0x1b8>
  800370:	85a6                	mv	a1,s1
  800372:	854a                	mv	a0,s2
  800374:	1cc000ef          	jal	ra,800540 <printfmt>
  800378:	b54d                	j	80021a <vprintfmt+0x3a>
  80037a:	000ab603          	ld	a2,0(s5)
  80037e:	0aa1                	addi	s5,s5,8
  800380:	1a060163          	beqz	a2,800522 <vprintfmt+0x342>
  800384:	00160413          	addi	s0,a2,1
  800388:	15b05763          	blez	s11,8004d6 <vprintfmt+0x2f6>
  80038c:	02d00593          	li	a1,45
  800390:	10b79d63          	bne	a5,a1,8004aa <vprintfmt+0x2ca>
  800394:	00064783          	lbu	a5,0(a2)
  800398:	0007851b          	sext.w	a0,a5
  80039c:	c905                	beqz	a0,8003cc <vprintfmt+0x1ec>
  80039e:	000cc563          	bltz	s9,8003a8 <vprintfmt+0x1c8>
  8003a2:	3cfd                	addiw	s9,s9,-1
  8003a4:	036c8263          	beq	s9,s6,8003c8 <vprintfmt+0x1e8>
  8003a8:	85a6                	mv	a1,s1
  8003aa:	14098f63          	beqz	s3,800508 <vprintfmt+0x328>
  8003ae:	3781                	addiw	a5,a5,-32
  8003b0:	14fbfc63          	bgeu	s7,a5,800508 <vprintfmt+0x328>
  8003b4:	03f00513          	li	a0,63
  8003b8:	9902                	jalr	s2
  8003ba:	0405                	addi	s0,s0,1
  8003bc:	fff44783          	lbu	a5,-1(s0)
  8003c0:	3dfd                	addiw	s11,s11,-1
  8003c2:	0007851b          	sext.w	a0,a5
  8003c6:	fd61                	bnez	a0,80039e <vprintfmt+0x1be>
  8003c8:	e5b059e3          	blez	s11,80021a <vprintfmt+0x3a>
  8003cc:	3dfd                	addiw	s11,s11,-1
  8003ce:	85a6                	mv	a1,s1
  8003d0:	02000513          	li	a0,32
  8003d4:	9902                	jalr	s2
  8003d6:	e40d82e3          	beqz	s11,80021a <vprintfmt+0x3a>
  8003da:	3dfd                	addiw	s11,s11,-1
  8003dc:	85a6                	mv	a1,s1
  8003de:	02000513          	li	a0,32
  8003e2:	9902                	jalr	s2
  8003e4:	fe0d94e3          	bnez	s11,8003cc <vprintfmt+0x1ec>
  8003e8:	bd0d                	j	80021a <vprintfmt+0x3a>
  8003ea:	4705                	li	a4,1
  8003ec:	008a8593          	addi	a1,s5,8
  8003f0:	01074463          	blt	a4,a6,8003f8 <vprintfmt+0x218>
  8003f4:	0e080863          	beqz	a6,8004e4 <vprintfmt+0x304>
  8003f8:	000ab603          	ld	a2,0(s5)
  8003fc:	46a1                	li	a3,8
  8003fe:	8aae                	mv	s5,a1
  800400:	a839                	j	80041e <vprintfmt+0x23e>
  800402:	03000513          	li	a0,48
  800406:	85a6                	mv	a1,s1
  800408:	e03e                	sd	a5,0(sp)
  80040a:	9902                	jalr	s2
  80040c:	85a6                	mv	a1,s1
  80040e:	07800513          	li	a0,120
  800412:	9902                	jalr	s2
  800414:	0aa1                	addi	s5,s5,8
  800416:	ff8ab603          	ld	a2,-8(s5)
  80041a:	6782                	ld	a5,0(sp)
  80041c:	46c1                	li	a3,16
  80041e:	2781                	sext.w	a5,a5
  800420:	876e                	mv	a4,s11
  800422:	85a6                	mv	a1,s1
  800424:	854a                	mv	a0,s2
  800426:	d4fff0ef          	jal	ra,800174 <printnum>
  80042a:	bbc5                	j	80021a <vprintfmt+0x3a>
  80042c:	00144603          	lbu	a2,1(s0)
  800430:	2805                	addiw	a6,a6,1
  800432:	846a                	mv	s0,s10
  800434:	b515                	j	800258 <vprintfmt+0x78>
  800436:	00144603          	lbu	a2,1(s0)
  80043a:	4985                	li	s3,1
  80043c:	846a                	mv	s0,s10
  80043e:	bd29                	j	800258 <vprintfmt+0x78>
  800440:	85a6                	mv	a1,s1
  800442:	02500513          	li	a0,37
  800446:	9902                	jalr	s2
  800448:	bbc9                	j	80021a <vprintfmt+0x3a>
  80044a:	4705                	li	a4,1
  80044c:	008a8593          	addi	a1,s5,8
  800450:	01074463          	blt	a4,a6,800458 <vprintfmt+0x278>
  800454:	08080d63          	beqz	a6,8004ee <vprintfmt+0x30e>
  800458:	000ab603          	ld	a2,0(s5)
  80045c:	46a9                	li	a3,10
  80045e:	8aae                	mv	s5,a1
  800460:	bf7d                	j	80041e <vprintfmt+0x23e>
  800462:	85a6                	mv	a1,s1
  800464:	02500513          	li	a0,37
  800468:	9902                	jalr	s2
  80046a:	fff44703          	lbu	a4,-1(s0)
  80046e:	02500793          	li	a5,37
  800472:	8d22                	mv	s10,s0
  800474:	daf703e3          	beq	a4,a5,80021a <vprintfmt+0x3a>
  800478:	02500713          	li	a4,37
  80047c:	1d7d                	addi	s10,s10,-1
  80047e:	fffd4783          	lbu	a5,-1(s10)
  800482:	fee79de3          	bne	a5,a4,80047c <vprintfmt+0x29c>
  800486:	bb51                	j	80021a <vprintfmt+0x3a>
  800488:	00000617          	auipc	a2,0x0
  80048c:	4c060613          	addi	a2,a2,1216 # 800948 <error_string+0x1a8>
  800490:	85a6                	mv	a1,s1
  800492:	854a                	mv	a0,s2
  800494:	0ac000ef          	jal	ra,800540 <printfmt>
  800498:	b349                	j	80021a <vprintfmt+0x3a>
  80049a:	00000617          	auipc	a2,0x0
  80049e:	4a660613          	addi	a2,a2,1190 # 800940 <error_string+0x1a0>
  8004a2:	00000417          	auipc	s0,0x0
  8004a6:	49f40413          	addi	s0,s0,1183 # 800941 <error_string+0x1a1>
  8004aa:	8532                	mv	a0,a2
  8004ac:	85e6                	mv	a1,s9
  8004ae:	e032                	sd	a2,0(sp)
  8004b0:	e43e                	sd	a5,8(sp)
  8004b2:	c9dff0ef          	jal	ra,80014e <strnlen>
  8004b6:	40ad8dbb          	subw	s11,s11,a0
  8004ba:	6602                	ld	a2,0(sp)
  8004bc:	01b05d63          	blez	s11,8004d6 <vprintfmt+0x2f6>
  8004c0:	67a2                	ld	a5,8(sp)
  8004c2:	2781                	sext.w	a5,a5
  8004c4:	e43e                	sd	a5,8(sp)
  8004c6:	6522                	ld	a0,8(sp)
  8004c8:	85a6                	mv	a1,s1
  8004ca:	e032                	sd	a2,0(sp)
  8004cc:	3dfd                	addiw	s11,s11,-1
  8004ce:	9902                	jalr	s2
  8004d0:	6602                	ld	a2,0(sp)
  8004d2:	fe0d9ae3          	bnez	s11,8004c6 <vprintfmt+0x2e6>
  8004d6:	00064783          	lbu	a5,0(a2)
  8004da:	0007851b          	sext.w	a0,a5
  8004de:	ec0510e3          	bnez	a0,80039e <vprintfmt+0x1be>
  8004e2:	bb25                	j	80021a <vprintfmt+0x3a>
  8004e4:	000ae603          	lwu	a2,0(s5)
  8004e8:	46a1                	li	a3,8
  8004ea:	8aae                	mv	s5,a1
  8004ec:	bf0d                	j	80041e <vprintfmt+0x23e>
  8004ee:	000ae603          	lwu	a2,0(s5)
  8004f2:	46a9                	li	a3,10
  8004f4:	8aae                	mv	s5,a1
  8004f6:	b725                	j	80041e <vprintfmt+0x23e>
  8004f8:	000aa403          	lw	s0,0(s5)
  8004fc:	bd35                	j	800338 <vprintfmt+0x158>
  8004fe:	000ae603          	lwu	a2,0(s5)
  800502:	46c1                	li	a3,16
  800504:	8aae                	mv	s5,a1
  800506:	bf21                	j	80041e <vprintfmt+0x23e>
  800508:	9902                	jalr	s2
  80050a:	bd45                	j	8003ba <vprintfmt+0x1da>
  80050c:	85a6                	mv	a1,s1
  80050e:	02d00513          	li	a0,45
  800512:	e03e                	sd	a5,0(sp)
  800514:	9902                	jalr	s2
  800516:	8ace                	mv	s5,s3
  800518:	40800633          	neg	a2,s0
  80051c:	46a9                	li	a3,10
  80051e:	6782                	ld	a5,0(sp)
  800520:	bdfd                	j	80041e <vprintfmt+0x23e>
  800522:	01b05663          	blez	s11,80052e <vprintfmt+0x34e>
  800526:	02d00693          	li	a3,45
  80052a:	f6d798e3          	bne	a5,a3,80049a <vprintfmt+0x2ba>
  80052e:	00000417          	auipc	s0,0x0
  800532:	41340413          	addi	s0,s0,1043 # 800941 <error_string+0x1a1>
  800536:	02800513          	li	a0,40
  80053a:	02800793          	li	a5,40
  80053e:	b585                	j	80039e <vprintfmt+0x1be>

0000000000800540 <printfmt>:
  800540:	715d                	addi	sp,sp,-80
  800542:	02810313          	addi	t1,sp,40
  800546:	f436                	sd	a3,40(sp)
  800548:	869a                	mv	a3,t1
  80054a:	ec06                	sd	ra,24(sp)
  80054c:	f83a                	sd	a4,48(sp)
  80054e:	fc3e                	sd	a5,56(sp)
  800550:	e0c2                	sd	a6,64(sp)
  800552:	e4c6                	sd	a7,72(sp)
  800554:	e41a                	sd	t1,8(sp)
  800556:	c8bff0ef          	jal	ra,8001e0 <vprintfmt>
  80055a:	60e2                	ld	ra,24(sp)
  80055c:	6161                	addi	sp,sp,80
  80055e:	8082                	ret

0000000000800560 <main>:
  800560:	1101                	addi	sp,sp,-32
  800562:	e822                	sd	s0,16(sp)
  800564:	e426                	sd	s1,8(sp)
  800566:	ec06                	sd	ra,24(sp)
  800568:	4401                	li	s0,0
  80056a:	02000493          	li	s1,32
  80056e:	b59ff0ef          	jal	ra,8000c6 <fork>
  800572:	cd05                	beqz	a0,8005aa <main+0x4a>
  800574:	06a05063          	blez	a0,8005d4 <main+0x74>
  800578:	2405                	addiw	s0,s0,1
  80057a:	fe941ae3          	bne	s0,s1,80056e <main+0xe>
  80057e:	02000413          	li	s0,32
  800582:	b47ff0ef          	jal	ra,8000c8 <wait>
  800586:	ed05                	bnez	a0,8005be <main+0x5e>
  800588:	347d                	addiw	s0,s0,-1
  80058a:	fc65                	bnez	s0,800582 <main+0x22>
  80058c:	b3dff0ef          	jal	ra,8000c8 <wait>
  800590:	c12d                	beqz	a0,8005f2 <main+0x92>
  800592:	00000517          	auipc	a0,0x0
  800596:	43e50513          	addi	a0,a0,1086 # 8009d0 <error_string+0x230>
  80059a:	b75ff0ef          	jal	ra,80010e <cprintf>
  80059e:	60e2                	ld	ra,24(sp)
  8005a0:	6442                	ld	s0,16(sp)
  8005a2:	64a2                	ld	s1,8(sp)
  8005a4:	4501                	li	a0,0
  8005a6:	6105                	addi	sp,sp,32
  8005a8:	8082                	ret
  8005aa:	85a2                	mv	a1,s0
  8005ac:	00000517          	auipc	a0,0x0
  8005b0:	3b450513          	addi	a0,a0,948 # 800960 <error_string+0x1c0>
  8005b4:	b5bff0ef          	jal	ra,80010e <cprintf>
  8005b8:	4501                	li	a0,0
  8005ba:	af7ff0ef          	jal	ra,8000b0 <exit>
  8005be:	00000617          	auipc	a2,0x0
  8005c2:	3e260613          	addi	a2,a2,994 # 8009a0 <error_string+0x200>
  8005c6:	45dd                	li	a1,23
  8005c8:	00000517          	auipc	a0,0x0
  8005cc:	3c850513          	addi	a0,a0,968 # 800990 <error_string+0x1f0>
  8005d0:	a51ff0ef          	jal	ra,800020 <__panic>
  8005d4:	00000697          	auipc	a3,0x0
  8005d8:	39c68693          	addi	a3,a3,924 # 800970 <error_string+0x1d0>
  8005dc:	00000617          	auipc	a2,0x0
  8005e0:	39c60613          	addi	a2,a2,924 # 800978 <error_string+0x1d8>
  8005e4:	45b9                	li	a1,14
  8005e6:	00000517          	auipc	a0,0x0
  8005ea:	3aa50513          	addi	a0,a0,938 # 800990 <error_string+0x1f0>
  8005ee:	a33ff0ef          	jal	ra,800020 <__panic>
  8005f2:	00000617          	auipc	a2,0x0
  8005f6:	3c660613          	addi	a2,a2,966 # 8009b8 <error_string+0x218>
  8005fa:	45f1                	li	a1,28
  8005fc:	00000517          	auipc	a0,0x0
  800600:	39450513          	addi	a0,a0,916 # 800990 <error_string+0x1f0>
  800604:	a1dff0ef          	jal	ra,800020 <__panic>
