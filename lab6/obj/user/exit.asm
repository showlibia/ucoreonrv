
obj/__user_exit.out：     文件格式 elf64-littleriscv


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
  800032:	65250513          	addi	a0,a0,1618 # 800680 <main+0x118>
  800036:	ec06                	sd	ra,24(sp)
  800038:	f436                	sd	a3,40(sp)
  80003a:	f83a                	sd	a4,48(sp)
  80003c:	e0c2                	sd	a6,64(sp)
  80003e:	e4c6                	sd	a7,72(sp)
  800040:	e43e                	sd	a5,8(sp)
  800042:	0d4000ef          	jal	ra,800116 <cprintf>
  800046:	65a2                	ld	a1,8(sp)
  800048:	8522                	mv	a0,s0
  80004a:	0ac000ef          	jal	ra,8000f6 <vcprintf>
  80004e:	00001517          	auipc	a0,0x1
  800052:	9e250513          	addi	a0,a0,-1566 # 800a30 <error_string+0x220>
  800056:	0c0000ef          	jal	ra,800116 <cprintf>
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
  8000c0:	5e450513          	addi	a0,a0,1508 # 8006a0 <main+0x138>
  8000c4:	052000ef          	jal	ra,800116 <cprintf>
  8000c8:	a001                	j	8000c8 <exit+0x14>

00000000008000ca <fork>:
  8000ca:	bfd1                	j	80009e <sys_fork>

00000000008000cc <wait>:
  8000cc:	4581                	li	a1,0
  8000ce:	4501                	li	a0,0
  8000d0:	bfc9                	j	8000a2 <sys_wait>

00000000008000d2 <waitpid>:
  8000d2:	bfc1                	j	8000a2 <sys_wait>

00000000008000d4 <yield>:
  8000d4:	bfd9                	j	8000aa <sys_yield>

00000000008000d6 <_start>:
  8000d6:	074000ef          	jal	ra,80014a <umain>
  8000da:	a001                	j	8000da <_start+0x4>

00000000008000dc <cputch>:
  8000dc:	1141                	addi	sp,sp,-16
  8000de:	e022                	sd	s0,0(sp)
  8000e0:	e406                	sd	ra,8(sp)
  8000e2:	842e                	mv	s0,a1
  8000e4:	fcbff0ef          	jal	ra,8000ae <sys_putc>
  8000e8:	401c                	lw	a5,0(s0)
  8000ea:	60a2                	ld	ra,8(sp)
  8000ec:	2785                	addiw	a5,a5,1
  8000ee:	c01c                	sw	a5,0(s0)
  8000f0:	6402                	ld	s0,0(sp)
  8000f2:	0141                	addi	sp,sp,16
  8000f4:	8082                	ret

00000000008000f6 <vcprintf>:
  8000f6:	1101                	addi	sp,sp,-32
  8000f8:	86ae                	mv	a3,a1
  8000fa:	862a                	mv	a2,a0
  8000fc:	006c                	addi	a1,sp,12
  8000fe:	00000517          	auipc	a0,0x0
  800102:	fde50513          	addi	a0,a0,-34 # 8000dc <cputch>
  800106:	ec06                	sd	ra,24(sp)
  800108:	c602                	sw	zero,12(sp)
  80010a:	0de000ef          	jal	ra,8001e8 <vprintfmt>
  80010e:	60e2                	ld	ra,24(sp)
  800110:	4532                	lw	a0,12(sp)
  800112:	6105                	addi	sp,sp,32
  800114:	8082                	ret

0000000000800116 <cprintf>:
  800116:	711d                	addi	sp,sp,-96
  800118:	02810313          	addi	t1,sp,40
  80011c:	f42e                	sd	a1,40(sp)
  80011e:	f832                	sd	a2,48(sp)
  800120:	fc36                	sd	a3,56(sp)
  800122:	862a                	mv	a2,a0
  800124:	004c                	addi	a1,sp,4
  800126:	00000517          	auipc	a0,0x0
  80012a:	fb650513          	addi	a0,a0,-74 # 8000dc <cputch>
  80012e:	869a                	mv	a3,t1
  800130:	ec06                	sd	ra,24(sp)
  800132:	e0ba                	sd	a4,64(sp)
  800134:	e4be                	sd	a5,72(sp)
  800136:	e8c2                	sd	a6,80(sp)
  800138:	ecc6                	sd	a7,88(sp)
  80013a:	e41a                	sd	t1,8(sp)
  80013c:	c202                	sw	zero,4(sp)
  80013e:	0aa000ef          	jal	ra,8001e8 <vprintfmt>
  800142:	60e2                	ld	ra,24(sp)
  800144:	4512                	lw	a0,4(sp)
  800146:	6125                	addi	sp,sp,96
  800148:	8082                	ret

000000000080014a <umain>:
  80014a:	1141                	addi	sp,sp,-16
  80014c:	e406                	sd	ra,8(sp)
  80014e:	41a000ef          	jal	ra,800568 <main>
  800152:	f63ff0ef          	jal	ra,8000b4 <exit>

0000000000800156 <strnlen>:
  800156:	c185                	beqz	a1,800176 <strnlen+0x20>
  800158:	00054783          	lbu	a5,0(a0)
  80015c:	cf89                	beqz	a5,800176 <strnlen+0x20>
  80015e:	4781                	li	a5,0
  800160:	a021                	j	800168 <strnlen+0x12>
  800162:	00074703          	lbu	a4,0(a4)
  800166:	c711                	beqz	a4,800172 <strnlen+0x1c>
  800168:	0785                	addi	a5,a5,1
  80016a:	00f50733          	add	a4,a0,a5
  80016e:	fef59ae3          	bne	a1,a5,800162 <strnlen+0xc>
  800172:	853e                	mv	a0,a5
  800174:	8082                	ret
  800176:	4781                	li	a5,0
  800178:	853e                	mv	a0,a5
  80017a:	8082                	ret

000000000080017c <printnum>:
  80017c:	02069813          	slli	a6,a3,0x20
  800180:	7179                	addi	sp,sp,-48
  800182:	02085813          	srli	a6,a6,0x20
  800186:	e052                	sd	s4,0(sp)
  800188:	03067a33          	remu	s4,a2,a6
  80018c:	f022                	sd	s0,32(sp)
  80018e:	ec26                	sd	s1,24(sp)
  800190:	e84a                	sd	s2,16(sp)
  800192:	f406                	sd	ra,40(sp)
  800194:	e44e                	sd	s3,8(sp)
  800196:	84aa                	mv	s1,a0
  800198:	892e                	mv	s2,a1
  80019a:	fff7041b          	addiw	s0,a4,-1
  80019e:	2a01                	sext.w	s4,s4
  8001a0:	03067e63          	bgeu	a2,a6,8001dc <printnum+0x60>
  8001a4:	89be                	mv	s3,a5
  8001a6:	00805763          	blez	s0,8001b4 <printnum+0x38>
  8001aa:	347d                	addiw	s0,s0,-1
  8001ac:	85ca                	mv	a1,s2
  8001ae:	854e                	mv	a0,s3
  8001b0:	9482                	jalr	s1
  8001b2:	fc65                	bnez	s0,8001aa <printnum+0x2e>
  8001b4:	1a02                	slli	s4,s4,0x20
  8001b6:	020a5a13          	srli	s4,s4,0x20
  8001ba:	00000797          	auipc	a5,0x0
  8001be:	71e78793          	addi	a5,a5,1822 # 8008d8 <error_string+0xc8>
  8001c2:	9a3e                	add	s4,s4,a5
  8001c4:	7402                	ld	s0,32(sp)
  8001c6:	000a4503          	lbu	a0,0(s4)
  8001ca:	70a2                	ld	ra,40(sp)
  8001cc:	69a2                	ld	s3,8(sp)
  8001ce:	6a02                	ld	s4,0(sp)
  8001d0:	85ca                	mv	a1,s2
  8001d2:	8326                	mv	t1,s1
  8001d4:	6942                	ld	s2,16(sp)
  8001d6:	64e2                	ld	s1,24(sp)
  8001d8:	6145                	addi	sp,sp,48
  8001da:	8302                	jr	t1
  8001dc:	03065633          	divu	a2,a2,a6
  8001e0:	8722                	mv	a4,s0
  8001e2:	f9bff0ef          	jal	ra,80017c <printnum>
  8001e6:	b7f9                	j	8001b4 <printnum+0x38>

00000000008001e8 <vprintfmt>:
  8001e8:	7119                	addi	sp,sp,-128
  8001ea:	f4a6                	sd	s1,104(sp)
  8001ec:	f0ca                	sd	s2,96(sp)
  8001ee:	e8d2                	sd	s4,80(sp)
  8001f0:	e4d6                	sd	s5,72(sp)
  8001f2:	e0da                	sd	s6,64(sp)
  8001f4:	fc5e                	sd	s7,56(sp)
  8001f6:	f862                	sd	s8,48(sp)
  8001f8:	f06a                	sd	s10,32(sp)
  8001fa:	fc86                	sd	ra,120(sp)
  8001fc:	f8a2                	sd	s0,112(sp)
  8001fe:	ecce                	sd	s3,88(sp)
  800200:	f466                	sd	s9,40(sp)
  800202:	ec6e                	sd	s11,24(sp)
  800204:	892a                	mv	s2,a0
  800206:	84ae                	mv	s1,a1
  800208:	8d32                	mv	s10,a2
  80020a:	8ab6                	mv	s5,a3
  80020c:	5b7d                	li	s6,-1
  80020e:	00000a17          	auipc	s4,0x0
  800212:	4a6a0a13          	addi	s4,s4,1190 # 8006b4 <main+0x14c>
  800216:	05e00b93          	li	s7,94
  80021a:	00000c17          	auipc	s8,0x0
  80021e:	5f6c0c13          	addi	s8,s8,1526 # 800810 <error_string>
  800222:	000d4503          	lbu	a0,0(s10)
  800226:	02500793          	li	a5,37
  80022a:	001d0413          	addi	s0,s10,1
  80022e:	00f50e63          	beq	a0,a5,80024a <vprintfmt+0x62>
  800232:	c521                	beqz	a0,80027a <vprintfmt+0x92>
  800234:	02500993          	li	s3,37
  800238:	a011                	j	80023c <vprintfmt+0x54>
  80023a:	c121                	beqz	a0,80027a <vprintfmt+0x92>
  80023c:	85a6                	mv	a1,s1
  80023e:	0405                	addi	s0,s0,1
  800240:	9902                	jalr	s2
  800242:	fff44503          	lbu	a0,-1(s0)
  800246:	ff351ae3          	bne	a0,s3,80023a <vprintfmt+0x52>
  80024a:	00044603          	lbu	a2,0(s0)
  80024e:	02000793          	li	a5,32
  800252:	4981                	li	s3,0
  800254:	4801                	li	a6,0
  800256:	5cfd                	li	s9,-1
  800258:	5dfd                	li	s11,-1
  80025a:	05500593          	li	a1,85
  80025e:	4525                	li	a0,9
  800260:	fdd6069b          	addiw	a3,a2,-35
  800264:	0ff6f693          	andi	a3,a3,255
  800268:	00140d13          	addi	s10,s0,1
  80026c:	1ed5ef63          	bltu	a1,a3,80046a <vprintfmt+0x282>
  800270:	068a                	slli	a3,a3,0x2
  800272:	96d2                	add	a3,a3,s4
  800274:	4294                	lw	a3,0(a3)
  800276:	96d2                	add	a3,a3,s4
  800278:	8682                	jr	a3
  80027a:	70e6                	ld	ra,120(sp)
  80027c:	7446                	ld	s0,112(sp)
  80027e:	74a6                	ld	s1,104(sp)
  800280:	7906                	ld	s2,96(sp)
  800282:	69e6                	ld	s3,88(sp)
  800284:	6a46                	ld	s4,80(sp)
  800286:	6aa6                	ld	s5,72(sp)
  800288:	6b06                	ld	s6,64(sp)
  80028a:	7be2                	ld	s7,56(sp)
  80028c:	7c42                	ld	s8,48(sp)
  80028e:	7ca2                	ld	s9,40(sp)
  800290:	7d02                	ld	s10,32(sp)
  800292:	6de2                	ld	s11,24(sp)
  800294:	6109                	addi	sp,sp,128
  800296:	8082                	ret
  800298:	87b2                	mv	a5,a2
  80029a:	00144603          	lbu	a2,1(s0)
  80029e:	846a                	mv	s0,s10
  8002a0:	b7c1                	j	800260 <vprintfmt+0x78>
  8002a2:	000aac83          	lw	s9,0(s5)
  8002a6:	00144603          	lbu	a2,1(s0)
  8002aa:	0aa1                	addi	s5,s5,8
  8002ac:	846a                	mv	s0,s10
  8002ae:	fa0dd9e3          	bgez	s11,800260 <vprintfmt+0x78>
  8002b2:	8de6                	mv	s11,s9
  8002b4:	5cfd                	li	s9,-1
  8002b6:	b76d                	j	800260 <vprintfmt+0x78>
  8002b8:	fffdc693          	not	a3,s11
  8002bc:	96fd                	srai	a3,a3,0x3f
  8002be:	00ddfdb3          	and	s11,s11,a3
  8002c2:	00144603          	lbu	a2,1(s0)
  8002c6:	2d81                	sext.w	s11,s11
  8002c8:	846a                	mv	s0,s10
  8002ca:	bf59                	j	800260 <vprintfmt+0x78>
  8002cc:	4705                	li	a4,1
  8002ce:	008a8593          	addi	a1,s5,8
  8002d2:	01074463          	blt	a4,a6,8002da <vprintfmt+0xf2>
  8002d6:	22080863          	beqz	a6,800506 <vprintfmt+0x31e>
  8002da:	000ab603          	ld	a2,0(s5)
  8002de:	46c1                	li	a3,16
  8002e0:	8aae                	mv	s5,a1
  8002e2:	a291                	j	800426 <vprintfmt+0x23e>
  8002e4:	fd060c9b          	addiw	s9,a2,-48
  8002e8:	00144603          	lbu	a2,1(s0)
  8002ec:	846a                	mv	s0,s10
  8002ee:	fd06069b          	addiw	a3,a2,-48
  8002f2:	0006089b          	sext.w	a7,a2
  8002f6:	fad56ce3          	bltu	a0,a3,8002ae <vprintfmt+0xc6>
  8002fa:	0405                	addi	s0,s0,1
  8002fc:	002c969b          	slliw	a3,s9,0x2
  800300:	00044603          	lbu	a2,0(s0)
  800304:	0196873b          	addw	a4,a3,s9
  800308:	0017171b          	slliw	a4,a4,0x1
  80030c:	0117073b          	addw	a4,a4,a7
  800310:	fd06069b          	addiw	a3,a2,-48
  800314:	fd070c9b          	addiw	s9,a4,-48
  800318:	0006089b          	sext.w	a7,a2
  80031c:	fcd57fe3          	bgeu	a0,a3,8002fa <vprintfmt+0x112>
  800320:	b779                	j	8002ae <vprintfmt+0xc6>
  800322:	000aa503          	lw	a0,0(s5)
  800326:	85a6                	mv	a1,s1
  800328:	0aa1                	addi	s5,s5,8
  80032a:	9902                	jalr	s2
  80032c:	bddd                	j	800222 <vprintfmt+0x3a>
  80032e:	4705                	li	a4,1
  800330:	008a8993          	addi	s3,s5,8
  800334:	01074463          	blt	a4,a6,80033c <vprintfmt+0x154>
  800338:	1c080463          	beqz	a6,800500 <vprintfmt+0x318>
  80033c:	000ab403          	ld	s0,0(s5)
  800340:	1c044a63          	bltz	s0,800514 <vprintfmt+0x32c>
  800344:	8622                	mv	a2,s0
  800346:	8ace                	mv	s5,s3
  800348:	46a9                	li	a3,10
  80034a:	a8f1                	j	800426 <vprintfmt+0x23e>
  80034c:	000aa783          	lw	a5,0(s5)
  800350:	4761                	li	a4,24
  800352:	0aa1                	addi	s5,s5,8
  800354:	41f7d69b          	sraiw	a3,a5,0x1f
  800358:	8fb5                	xor	a5,a5,a3
  80035a:	40d786bb          	subw	a3,a5,a3
  80035e:	12d74963          	blt	a4,a3,800490 <vprintfmt+0x2a8>
  800362:	00369793          	slli	a5,a3,0x3
  800366:	97e2                	add	a5,a5,s8
  800368:	639c                	ld	a5,0(a5)
  80036a:	12078363          	beqz	a5,800490 <vprintfmt+0x2a8>
  80036e:	86be                	mv	a3,a5
  800370:	00000617          	auipc	a2,0x0
  800374:	65860613          	addi	a2,a2,1624 # 8009c8 <error_string+0x1b8>
  800378:	85a6                	mv	a1,s1
  80037a:	854a                	mv	a0,s2
  80037c:	1cc000ef          	jal	ra,800548 <printfmt>
  800380:	b54d                	j	800222 <vprintfmt+0x3a>
  800382:	000ab603          	ld	a2,0(s5)
  800386:	0aa1                	addi	s5,s5,8
  800388:	1a060163          	beqz	a2,80052a <vprintfmt+0x342>
  80038c:	00160413          	addi	s0,a2,1
  800390:	15b05763          	blez	s11,8004de <vprintfmt+0x2f6>
  800394:	02d00593          	li	a1,45
  800398:	10b79d63          	bne	a5,a1,8004b2 <vprintfmt+0x2ca>
  80039c:	00064783          	lbu	a5,0(a2)
  8003a0:	0007851b          	sext.w	a0,a5
  8003a4:	c905                	beqz	a0,8003d4 <vprintfmt+0x1ec>
  8003a6:	000cc563          	bltz	s9,8003b0 <vprintfmt+0x1c8>
  8003aa:	3cfd                	addiw	s9,s9,-1
  8003ac:	036c8263          	beq	s9,s6,8003d0 <vprintfmt+0x1e8>
  8003b0:	85a6                	mv	a1,s1
  8003b2:	14098f63          	beqz	s3,800510 <vprintfmt+0x328>
  8003b6:	3781                	addiw	a5,a5,-32
  8003b8:	14fbfc63          	bgeu	s7,a5,800510 <vprintfmt+0x328>
  8003bc:	03f00513          	li	a0,63
  8003c0:	9902                	jalr	s2
  8003c2:	0405                	addi	s0,s0,1
  8003c4:	fff44783          	lbu	a5,-1(s0)
  8003c8:	3dfd                	addiw	s11,s11,-1
  8003ca:	0007851b          	sext.w	a0,a5
  8003ce:	fd61                	bnez	a0,8003a6 <vprintfmt+0x1be>
  8003d0:	e5b059e3          	blez	s11,800222 <vprintfmt+0x3a>
  8003d4:	3dfd                	addiw	s11,s11,-1
  8003d6:	85a6                	mv	a1,s1
  8003d8:	02000513          	li	a0,32
  8003dc:	9902                	jalr	s2
  8003de:	e40d82e3          	beqz	s11,800222 <vprintfmt+0x3a>
  8003e2:	3dfd                	addiw	s11,s11,-1
  8003e4:	85a6                	mv	a1,s1
  8003e6:	02000513          	li	a0,32
  8003ea:	9902                	jalr	s2
  8003ec:	fe0d94e3          	bnez	s11,8003d4 <vprintfmt+0x1ec>
  8003f0:	bd0d                	j	800222 <vprintfmt+0x3a>
  8003f2:	4705                	li	a4,1
  8003f4:	008a8593          	addi	a1,s5,8
  8003f8:	01074463          	blt	a4,a6,800400 <vprintfmt+0x218>
  8003fc:	0e080863          	beqz	a6,8004ec <vprintfmt+0x304>
  800400:	000ab603          	ld	a2,0(s5)
  800404:	46a1                	li	a3,8
  800406:	8aae                	mv	s5,a1
  800408:	a839                	j	800426 <vprintfmt+0x23e>
  80040a:	03000513          	li	a0,48
  80040e:	85a6                	mv	a1,s1
  800410:	e03e                	sd	a5,0(sp)
  800412:	9902                	jalr	s2
  800414:	85a6                	mv	a1,s1
  800416:	07800513          	li	a0,120
  80041a:	9902                	jalr	s2
  80041c:	0aa1                	addi	s5,s5,8
  80041e:	ff8ab603          	ld	a2,-8(s5)
  800422:	6782                	ld	a5,0(sp)
  800424:	46c1                	li	a3,16
  800426:	2781                	sext.w	a5,a5
  800428:	876e                	mv	a4,s11
  80042a:	85a6                	mv	a1,s1
  80042c:	854a                	mv	a0,s2
  80042e:	d4fff0ef          	jal	ra,80017c <printnum>
  800432:	bbc5                	j	800222 <vprintfmt+0x3a>
  800434:	00144603          	lbu	a2,1(s0)
  800438:	2805                	addiw	a6,a6,1
  80043a:	846a                	mv	s0,s10
  80043c:	b515                	j	800260 <vprintfmt+0x78>
  80043e:	00144603          	lbu	a2,1(s0)
  800442:	4985                	li	s3,1
  800444:	846a                	mv	s0,s10
  800446:	bd29                	j	800260 <vprintfmt+0x78>
  800448:	85a6                	mv	a1,s1
  80044a:	02500513          	li	a0,37
  80044e:	9902                	jalr	s2
  800450:	bbc9                	j	800222 <vprintfmt+0x3a>
  800452:	4705                	li	a4,1
  800454:	008a8593          	addi	a1,s5,8
  800458:	01074463          	blt	a4,a6,800460 <vprintfmt+0x278>
  80045c:	08080d63          	beqz	a6,8004f6 <vprintfmt+0x30e>
  800460:	000ab603          	ld	a2,0(s5)
  800464:	46a9                	li	a3,10
  800466:	8aae                	mv	s5,a1
  800468:	bf7d                	j	800426 <vprintfmt+0x23e>
  80046a:	85a6                	mv	a1,s1
  80046c:	02500513          	li	a0,37
  800470:	9902                	jalr	s2
  800472:	fff44703          	lbu	a4,-1(s0)
  800476:	02500793          	li	a5,37
  80047a:	8d22                	mv	s10,s0
  80047c:	daf703e3          	beq	a4,a5,800222 <vprintfmt+0x3a>
  800480:	02500713          	li	a4,37
  800484:	1d7d                	addi	s10,s10,-1
  800486:	fffd4783          	lbu	a5,-1(s10)
  80048a:	fee79de3          	bne	a5,a4,800484 <vprintfmt+0x29c>
  80048e:	bb51                	j	800222 <vprintfmt+0x3a>
  800490:	00000617          	auipc	a2,0x0
  800494:	52860613          	addi	a2,a2,1320 # 8009b8 <error_string+0x1a8>
  800498:	85a6                	mv	a1,s1
  80049a:	854a                	mv	a0,s2
  80049c:	0ac000ef          	jal	ra,800548 <printfmt>
  8004a0:	b349                	j	800222 <vprintfmt+0x3a>
  8004a2:	00000617          	auipc	a2,0x0
  8004a6:	50e60613          	addi	a2,a2,1294 # 8009b0 <error_string+0x1a0>
  8004aa:	00000417          	auipc	s0,0x0
  8004ae:	50740413          	addi	s0,s0,1287 # 8009b1 <error_string+0x1a1>
  8004b2:	8532                	mv	a0,a2
  8004b4:	85e6                	mv	a1,s9
  8004b6:	e032                	sd	a2,0(sp)
  8004b8:	e43e                	sd	a5,8(sp)
  8004ba:	c9dff0ef          	jal	ra,800156 <strnlen>
  8004be:	40ad8dbb          	subw	s11,s11,a0
  8004c2:	6602                	ld	a2,0(sp)
  8004c4:	01b05d63          	blez	s11,8004de <vprintfmt+0x2f6>
  8004c8:	67a2                	ld	a5,8(sp)
  8004ca:	2781                	sext.w	a5,a5
  8004cc:	e43e                	sd	a5,8(sp)
  8004ce:	6522                	ld	a0,8(sp)
  8004d0:	85a6                	mv	a1,s1
  8004d2:	e032                	sd	a2,0(sp)
  8004d4:	3dfd                	addiw	s11,s11,-1
  8004d6:	9902                	jalr	s2
  8004d8:	6602                	ld	a2,0(sp)
  8004da:	fe0d9ae3          	bnez	s11,8004ce <vprintfmt+0x2e6>
  8004de:	00064783          	lbu	a5,0(a2)
  8004e2:	0007851b          	sext.w	a0,a5
  8004e6:	ec0510e3          	bnez	a0,8003a6 <vprintfmt+0x1be>
  8004ea:	bb25                	j	800222 <vprintfmt+0x3a>
  8004ec:	000ae603          	lwu	a2,0(s5)
  8004f0:	46a1                	li	a3,8
  8004f2:	8aae                	mv	s5,a1
  8004f4:	bf0d                	j	800426 <vprintfmt+0x23e>
  8004f6:	000ae603          	lwu	a2,0(s5)
  8004fa:	46a9                	li	a3,10
  8004fc:	8aae                	mv	s5,a1
  8004fe:	b725                	j	800426 <vprintfmt+0x23e>
  800500:	000aa403          	lw	s0,0(s5)
  800504:	bd35                	j	800340 <vprintfmt+0x158>
  800506:	000ae603          	lwu	a2,0(s5)
  80050a:	46c1                	li	a3,16
  80050c:	8aae                	mv	s5,a1
  80050e:	bf21                	j	800426 <vprintfmt+0x23e>
  800510:	9902                	jalr	s2
  800512:	bd45                	j	8003c2 <vprintfmt+0x1da>
  800514:	85a6                	mv	a1,s1
  800516:	02d00513          	li	a0,45
  80051a:	e03e                	sd	a5,0(sp)
  80051c:	9902                	jalr	s2
  80051e:	8ace                	mv	s5,s3
  800520:	40800633          	neg	a2,s0
  800524:	46a9                	li	a3,10
  800526:	6782                	ld	a5,0(sp)
  800528:	bdfd                	j	800426 <vprintfmt+0x23e>
  80052a:	01b05663          	blez	s11,800536 <vprintfmt+0x34e>
  80052e:	02d00693          	li	a3,45
  800532:	f6d798e3          	bne	a5,a3,8004a2 <vprintfmt+0x2ba>
  800536:	00000417          	auipc	s0,0x0
  80053a:	47b40413          	addi	s0,s0,1147 # 8009b1 <error_string+0x1a1>
  80053e:	02800513          	li	a0,40
  800542:	02800793          	li	a5,40
  800546:	b585                	j	8003a6 <vprintfmt+0x1be>

0000000000800548 <printfmt>:
  800548:	715d                	addi	sp,sp,-80
  80054a:	02810313          	addi	t1,sp,40
  80054e:	f436                	sd	a3,40(sp)
  800550:	869a                	mv	a3,t1
  800552:	ec06                	sd	ra,24(sp)
  800554:	f83a                	sd	a4,48(sp)
  800556:	fc3e                	sd	a5,56(sp)
  800558:	e0c2                	sd	a6,64(sp)
  80055a:	e4c6                	sd	a7,72(sp)
  80055c:	e41a                	sd	t1,8(sp)
  80055e:	c8bff0ef          	jal	ra,8001e8 <vprintfmt>
  800562:	60e2                	ld	ra,24(sp)
  800564:	6161                	addi	sp,sp,80
  800566:	8082                	ret

0000000000800568 <main>:
  800568:	1101                	addi	sp,sp,-32
  80056a:	00000517          	auipc	a0,0x0
  80056e:	46650513          	addi	a0,a0,1126 # 8009d0 <error_string+0x1c0>
  800572:	ec06                	sd	ra,24(sp)
  800574:	e822                	sd	s0,16(sp)
  800576:	ba1ff0ef          	jal	ra,800116 <cprintf>
  80057a:	b51ff0ef          	jal	ra,8000ca <fork>
  80057e:	c569                	beqz	a0,800648 <main+0xe0>
  800580:	842a                	mv	s0,a0
  800582:	85aa                	mv	a1,a0
  800584:	00000517          	auipc	a0,0x0
  800588:	48c50513          	addi	a0,a0,1164 # 800a10 <error_string+0x200>
  80058c:	b8bff0ef          	jal	ra,800116 <cprintf>
  800590:	08805d63          	blez	s0,80062a <main+0xc2>
  800594:	00000517          	auipc	a0,0x0
  800598:	4d450513          	addi	a0,a0,1236 # 800a68 <error_string+0x258>
  80059c:	b7bff0ef          	jal	ra,800116 <cprintf>
  8005a0:	006c                	addi	a1,sp,12
  8005a2:	8522                	mv	a0,s0
  8005a4:	b2fff0ef          	jal	ra,8000d2 <waitpid>
  8005a8:	e139                	bnez	a0,8005ee <main+0x86>
  8005aa:	00001797          	auipc	a5,0x1
  8005ae:	a5678793          	addi	a5,a5,-1450 # 801000 <magic>
  8005b2:	4732                	lw	a4,12(sp)
  8005b4:	439c                	lw	a5,0(a5)
  8005b6:	02f71c63          	bne	a4,a5,8005ee <main+0x86>
  8005ba:	006c                	addi	a1,sp,12
  8005bc:	8522                	mv	a0,s0
  8005be:	b15ff0ef          	jal	ra,8000d2 <waitpid>
  8005c2:	c529                	beqz	a0,80060c <main+0xa4>
  8005c4:	b09ff0ef          	jal	ra,8000cc <wait>
  8005c8:	c131                	beqz	a0,80060c <main+0xa4>
  8005ca:	85a2                	mv	a1,s0
  8005cc:	00000517          	auipc	a0,0x0
  8005d0:	51450513          	addi	a0,a0,1300 # 800ae0 <error_string+0x2d0>
  8005d4:	b43ff0ef          	jal	ra,800116 <cprintf>
  8005d8:	00000517          	auipc	a0,0x0
  8005dc:	51850513          	addi	a0,a0,1304 # 800af0 <error_string+0x2e0>
  8005e0:	b37ff0ef          	jal	ra,800116 <cprintf>
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
  800608:	a19ff0ef          	jal	ra,800020 <__panic>
  80060c:	00000697          	auipc	a3,0x0
  800610:	4ac68693          	addi	a3,a3,1196 # 800ab8 <error_string+0x2a8>
  800614:	00000617          	auipc	a2,0x0
  800618:	42c60613          	addi	a2,a2,1068 # 800a40 <error_string+0x230>
  80061c:	45f1                	li	a1,28
  80061e:	00000517          	auipc	a0,0x0
  800622:	43a50513          	addi	a0,a0,1082 # 800a58 <error_string+0x248>
  800626:	9fbff0ef          	jal	ra,800020 <__panic>
  80062a:	00000697          	auipc	a3,0x0
  80062e:	40e68693          	addi	a3,a3,1038 # 800a38 <error_string+0x228>
  800632:	00000617          	auipc	a2,0x0
  800636:	40e60613          	addi	a2,a2,1038 # 800a40 <error_string+0x230>
  80063a:	45e1                	li	a1,24
  80063c:	00000517          	auipc	a0,0x0
  800640:	41c50513          	addi	a0,a0,1052 # 800a58 <error_string+0x248>
  800644:	9ddff0ef          	jal	ra,800020 <__panic>
  800648:	00000517          	auipc	a0,0x0
  80064c:	3b050513          	addi	a0,a0,944 # 8009f8 <error_string+0x1e8>
  800650:	ac7ff0ef          	jal	ra,800116 <cprintf>
  800654:	a81ff0ef          	jal	ra,8000d4 <yield>
  800658:	a7dff0ef          	jal	ra,8000d4 <yield>
  80065c:	a79ff0ef          	jal	ra,8000d4 <yield>
  800660:	a75ff0ef          	jal	ra,8000d4 <yield>
  800664:	a71ff0ef          	jal	ra,8000d4 <yield>
  800668:	a6dff0ef          	jal	ra,8000d4 <yield>
  80066c:	a69ff0ef          	jal	ra,8000d4 <yield>
  800670:	00001797          	auipc	a5,0x1
  800674:	99078793          	addi	a5,a5,-1648 # 801000 <magic>
  800678:	4388                	lw	a0,0(a5)
  80067a:	a3bff0ef          	jal	ra,8000b4 <exit>
