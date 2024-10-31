
obj/__user_waitkill.out：     文件格式 elf64-littleriscv


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
  800032:	68250513          	addi	a0,a0,1666 # 8006b0 <main+0xb4>
  800036:	ec06                	sd	ra,24(sp)
  800038:	f436                	sd	a3,40(sp)
  80003a:	f83a                	sd	a4,48(sp)
  80003c:	e0c2                	sd	a6,64(sp)
  80003e:	e4c6                	sd	a7,72(sp)
  800040:	e43e                	sd	a5,8(sp)
  800042:	0dc000ef          	jal	ra,80011e <cprintf>
  800046:	65a2                	ld	a1,8(sp)
  800048:	8522                	mv	a0,s0
  80004a:	0b4000ef          	jal	ra,8000fe <vcprintf>
  80004e:	00001517          	auipc	a0,0x1
  800052:	9ba50513          	addi	a0,a0,-1606 # 800a08 <error_string+0x1c8>
  800056:	0c8000ef          	jal	ra,80011e <cprintf>
  80005a:	5559                	li	a0,-10
  80005c:	062000ef          	jal	ra,8000be <exit>

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

00000000008000ae <sys_kill>:
  8000ae:	85aa                	mv	a1,a0
  8000b0:	4531                	li	a0,12
  8000b2:	b77d                	j	800060 <syscall>

00000000008000b4 <sys_getpid>:
  8000b4:	4549                	li	a0,18
  8000b6:	b76d                	j	800060 <syscall>

00000000008000b8 <sys_putc>:
  8000b8:	85aa                	mv	a1,a0
  8000ba:	4579                	li	a0,30
  8000bc:	b755                	j	800060 <syscall>

00000000008000be <exit>:
  8000be:	1141                	addi	sp,sp,-16
  8000c0:	e406                	sd	ra,8(sp)
  8000c2:	fd7ff0ef          	jal	ra,800098 <sys_exit>
  8000c6:	00000517          	auipc	a0,0x0
  8000ca:	60a50513          	addi	a0,a0,1546 # 8006d0 <main+0xd4>
  8000ce:	050000ef          	jal	ra,80011e <cprintf>
  8000d2:	a001                	j	8000d2 <exit+0x14>

00000000008000d4 <fork>:
  8000d4:	b7e9                	j	80009e <sys_fork>

00000000008000d6 <waitpid>:
  8000d6:	b7f1                	j	8000a2 <sys_wait>

00000000008000d8 <yield>:
  8000d8:	bfc9                	j	8000aa <sys_yield>

00000000008000da <kill>:
  8000da:	bfd1                	j	8000ae <sys_kill>

00000000008000dc <getpid>:
  8000dc:	bfe1                	j	8000b4 <sys_getpid>

00000000008000de <_start>:
  8000de:	074000ef          	jal	ra,800152 <umain>
  8000e2:	a001                	j	8000e2 <_start+0x4>

00000000008000e4 <cputch>:
  8000e4:	1141                	addi	sp,sp,-16
  8000e6:	e022                	sd	s0,0(sp)
  8000e8:	e406                	sd	ra,8(sp)
  8000ea:	842e                	mv	s0,a1
  8000ec:	fcdff0ef          	jal	ra,8000b8 <sys_putc>
  8000f0:	401c                	lw	a5,0(s0)
  8000f2:	60a2                	ld	ra,8(sp)
  8000f4:	2785                	addiw	a5,a5,1
  8000f6:	c01c                	sw	a5,0(s0)
  8000f8:	6402                	ld	s0,0(sp)
  8000fa:	0141                	addi	sp,sp,16
  8000fc:	8082                	ret

00000000008000fe <vcprintf>:
  8000fe:	1101                	addi	sp,sp,-32
  800100:	86ae                	mv	a3,a1
  800102:	862a                	mv	a2,a0
  800104:	006c                	addi	a1,sp,12
  800106:	00000517          	auipc	a0,0x0
  80010a:	fde50513          	addi	a0,a0,-34 # 8000e4 <cputch>
  80010e:	ec06                	sd	ra,24(sp)
  800110:	c602                	sw	zero,12(sp)
  800112:	0de000ef          	jal	ra,8001f0 <vprintfmt>
  800116:	60e2                	ld	ra,24(sp)
  800118:	4532                	lw	a0,12(sp)
  80011a:	6105                	addi	sp,sp,32
  80011c:	8082                	ret

000000000080011e <cprintf>:
  80011e:	711d                	addi	sp,sp,-96
  800120:	02810313          	addi	t1,sp,40
  800124:	f42e                	sd	a1,40(sp)
  800126:	f832                	sd	a2,48(sp)
  800128:	fc36                	sd	a3,56(sp)
  80012a:	862a                	mv	a2,a0
  80012c:	004c                	addi	a1,sp,4
  80012e:	00000517          	auipc	a0,0x0
  800132:	fb650513          	addi	a0,a0,-74 # 8000e4 <cputch>
  800136:	869a                	mv	a3,t1
  800138:	ec06                	sd	ra,24(sp)
  80013a:	e0ba                	sd	a4,64(sp)
  80013c:	e4be                	sd	a5,72(sp)
  80013e:	e8c2                	sd	a6,80(sp)
  800140:	ecc6                	sd	a7,88(sp)
  800142:	e41a                	sd	t1,8(sp)
  800144:	c202                	sw	zero,4(sp)
  800146:	0aa000ef          	jal	ra,8001f0 <vprintfmt>
  80014a:	60e2                	ld	ra,24(sp)
  80014c:	4512                	lw	a0,4(sp)
  80014e:	6125                	addi	sp,sp,96
  800150:	8082                	ret

0000000000800152 <umain>:
  800152:	1141                	addi	sp,sp,-16
  800154:	e406                	sd	ra,8(sp)
  800156:	4a6000ef          	jal	ra,8005fc <main>
  80015a:	f65ff0ef          	jal	ra,8000be <exit>

000000000080015e <strnlen>:
  80015e:	c185                	beqz	a1,80017e <strnlen+0x20>
  800160:	00054783          	lbu	a5,0(a0)
  800164:	cf89                	beqz	a5,80017e <strnlen+0x20>
  800166:	4781                	li	a5,0
  800168:	a021                	j	800170 <strnlen+0x12>
  80016a:	00074703          	lbu	a4,0(a4)
  80016e:	c711                	beqz	a4,80017a <strnlen+0x1c>
  800170:	0785                	addi	a5,a5,1
  800172:	00f50733          	add	a4,a0,a5
  800176:	fef59ae3          	bne	a1,a5,80016a <strnlen+0xc>
  80017a:	853e                	mv	a0,a5
  80017c:	8082                	ret
  80017e:	4781                	li	a5,0
  800180:	853e                	mv	a0,a5
  800182:	8082                	ret

0000000000800184 <printnum>:
  800184:	02069813          	slli	a6,a3,0x20
  800188:	7179                	addi	sp,sp,-48
  80018a:	02085813          	srli	a6,a6,0x20
  80018e:	e052                	sd	s4,0(sp)
  800190:	03067a33          	remu	s4,a2,a6
  800194:	f022                	sd	s0,32(sp)
  800196:	ec26                	sd	s1,24(sp)
  800198:	e84a                	sd	s2,16(sp)
  80019a:	f406                	sd	ra,40(sp)
  80019c:	e44e                	sd	s3,8(sp)
  80019e:	84aa                	mv	s1,a0
  8001a0:	892e                	mv	s2,a1
  8001a2:	fff7041b          	addiw	s0,a4,-1
  8001a6:	2a01                	sext.w	s4,s4
  8001a8:	03067e63          	bgeu	a2,a6,8001e4 <printnum+0x60>
  8001ac:	89be                	mv	s3,a5
  8001ae:	00805763          	blez	s0,8001bc <printnum+0x38>
  8001b2:	347d                	addiw	s0,s0,-1
  8001b4:	85ca                	mv	a1,s2
  8001b6:	854e                	mv	a0,s3
  8001b8:	9482                	jalr	s1
  8001ba:	fc65                	bnez	s0,8001b2 <printnum+0x2e>
  8001bc:	1a02                	slli	s4,s4,0x20
  8001be:	020a5a13          	srli	s4,s4,0x20
  8001c2:	00000797          	auipc	a5,0x0
  8001c6:	74678793          	addi	a5,a5,1862 # 800908 <error_string+0xc8>
  8001ca:	9a3e                	add	s4,s4,a5
  8001cc:	7402                	ld	s0,32(sp)
  8001ce:	000a4503          	lbu	a0,0(s4)
  8001d2:	70a2                	ld	ra,40(sp)
  8001d4:	69a2                	ld	s3,8(sp)
  8001d6:	6a02                	ld	s4,0(sp)
  8001d8:	85ca                	mv	a1,s2
  8001da:	8326                	mv	t1,s1
  8001dc:	6942                	ld	s2,16(sp)
  8001de:	64e2                	ld	s1,24(sp)
  8001e0:	6145                	addi	sp,sp,48
  8001e2:	8302                	jr	t1
  8001e4:	03065633          	divu	a2,a2,a6
  8001e8:	8722                	mv	a4,s0
  8001ea:	f9bff0ef          	jal	ra,800184 <printnum>
  8001ee:	b7f9                	j	8001bc <printnum+0x38>

00000000008001f0 <vprintfmt>:
  8001f0:	7119                	addi	sp,sp,-128
  8001f2:	f4a6                	sd	s1,104(sp)
  8001f4:	f0ca                	sd	s2,96(sp)
  8001f6:	e8d2                	sd	s4,80(sp)
  8001f8:	e4d6                	sd	s5,72(sp)
  8001fa:	e0da                	sd	s6,64(sp)
  8001fc:	fc5e                	sd	s7,56(sp)
  8001fe:	f862                	sd	s8,48(sp)
  800200:	f06a                	sd	s10,32(sp)
  800202:	fc86                	sd	ra,120(sp)
  800204:	f8a2                	sd	s0,112(sp)
  800206:	ecce                	sd	s3,88(sp)
  800208:	f466                	sd	s9,40(sp)
  80020a:	ec6e                	sd	s11,24(sp)
  80020c:	892a                	mv	s2,a0
  80020e:	84ae                	mv	s1,a1
  800210:	8d32                	mv	s10,a2
  800212:	8ab6                	mv	s5,a3
  800214:	5b7d                	li	s6,-1
  800216:	00000a17          	auipc	s4,0x0
  80021a:	4cea0a13          	addi	s4,s4,1230 # 8006e4 <main+0xe8>
  80021e:	05e00b93          	li	s7,94
  800222:	00000c17          	auipc	s8,0x0
  800226:	61ec0c13          	addi	s8,s8,1566 # 800840 <error_string>
  80022a:	000d4503          	lbu	a0,0(s10)
  80022e:	02500793          	li	a5,37
  800232:	001d0413          	addi	s0,s10,1
  800236:	00f50e63          	beq	a0,a5,800252 <vprintfmt+0x62>
  80023a:	c521                	beqz	a0,800282 <vprintfmt+0x92>
  80023c:	02500993          	li	s3,37
  800240:	a011                	j	800244 <vprintfmt+0x54>
  800242:	c121                	beqz	a0,800282 <vprintfmt+0x92>
  800244:	85a6                	mv	a1,s1
  800246:	0405                	addi	s0,s0,1
  800248:	9902                	jalr	s2
  80024a:	fff44503          	lbu	a0,-1(s0)
  80024e:	ff351ae3          	bne	a0,s3,800242 <vprintfmt+0x52>
  800252:	00044603          	lbu	a2,0(s0)
  800256:	02000793          	li	a5,32
  80025a:	4981                	li	s3,0
  80025c:	4801                	li	a6,0
  80025e:	5cfd                	li	s9,-1
  800260:	5dfd                	li	s11,-1
  800262:	05500593          	li	a1,85
  800266:	4525                	li	a0,9
  800268:	fdd6069b          	addiw	a3,a2,-35
  80026c:	0ff6f693          	andi	a3,a3,255
  800270:	00140d13          	addi	s10,s0,1
  800274:	1ed5ef63          	bltu	a1,a3,800472 <vprintfmt+0x282>
  800278:	068a                	slli	a3,a3,0x2
  80027a:	96d2                	add	a3,a3,s4
  80027c:	4294                	lw	a3,0(a3)
  80027e:	96d2                	add	a3,a3,s4
  800280:	8682                	jr	a3
  800282:	70e6                	ld	ra,120(sp)
  800284:	7446                	ld	s0,112(sp)
  800286:	74a6                	ld	s1,104(sp)
  800288:	7906                	ld	s2,96(sp)
  80028a:	69e6                	ld	s3,88(sp)
  80028c:	6a46                	ld	s4,80(sp)
  80028e:	6aa6                	ld	s5,72(sp)
  800290:	6b06                	ld	s6,64(sp)
  800292:	7be2                	ld	s7,56(sp)
  800294:	7c42                	ld	s8,48(sp)
  800296:	7ca2                	ld	s9,40(sp)
  800298:	7d02                	ld	s10,32(sp)
  80029a:	6de2                	ld	s11,24(sp)
  80029c:	6109                	addi	sp,sp,128
  80029e:	8082                	ret
  8002a0:	87b2                	mv	a5,a2
  8002a2:	00144603          	lbu	a2,1(s0)
  8002a6:	846a                	mv	s0,s10
  8002a8:	b7c1                	j	800268 <vprintfmt+0x78>
  8002aa:	000aac83          	lw	s9,0(s5)
  8002ae:	00144603          	lbu	a2,1(s0)
  8002b2:	0aa1                	addi	s5,s5,8
  8002b4:	846a                	mv	s0,s10
  8002b6:	fa0dd9e3          	bgez	s11,800268 <vprintfmt+0x78>
  8002ba:	8de6                	mv	s11,s9
  8002bc:	5cfd                	li	s9,-1
  8002be:	b76d                	j	800268 <vprintfmt+0x78>
  8002c0:	fffdc693          	not	a3,s11
  8002c4:	96fd                	srai	a3,a3,0x3f
  8002c6:	00ddfdb3          	and	s11,s11,a3
  8002ca:	00144603          	lbu	a2,1(s0)
  8002ce:	2d81                	sext.w	s11,s11
  8002d0:	846a                	mv	s0,s10
  8002d2:	bf59                	j	800268 <vprintfmt+0x78>
  8002d4:	4705                	li	a4,1
  8002d6:	008a8593          	addi	a1,s5,8
  8002da:	01074463          	blt	a4,a6,8002e2 <vprintfmt+0xf2>
  8002de:	22080863          	beqz	a6,80050e <vprintfmt+0x31e>
  8002e2:	000ab603          	ld	a2,0(s5)
  8002e6:	46c1                	li	a3,16
  8002e8:	8aae                	mv	s5,a1
  8002ea:	a291                	j	80042e <vprintfmt+0x23e>
  8002ec:	fd060c9b          	addiw	s9,a2,-48
  8002f0:	00144603          	lbu	a2,1(s0)
  8002f4:	846a                	mv	s0,s10
  8002f6:	fd06069b          	addiw	a3,a2,-48
  8002fa:	0006089b          	sext.w	a7,a2
  8002fe:	fad56ce3          	bltu	a0,a3,8002b6 <vprintfmt+0xc6>
  800302:	0405                	addi	s0,s0,1
  800304:	002c969b          	slliw	a3,s9,0x2
  800308:	00044603          	lbu	a2,0(s0)
  80030c:	0196873b          	addw	a4,a3,s9
  800310:	0017171b          	slliw	a4,a4,0x1
  800314:	0117073b          	addw	a4,a4,a7
  800318:	fd06069b          	addiw	a3,a2,-48
  80031c:	fd070c9b          	addiw	s9,a4,-48
  800320:	0006089b          	sext.w	a7,a2
  800324:	fcd57fe3          	bgeu	a0,a3,800302 <vprintfmt+0x112>
  800328:	b779                	j	8002b6 <vprintfmt+0xc6>
  80032a:	000aa503          	lw	a0,0(s5)
  80032e:	85a6                	mv	a1,s1
  800330:	0aa1                	addi	s5,s5,8
  800332:	9902                	jalr	s2
  800334:	bddd                	j	80022a <vprintfmt+0x3a>
  800336:	4705                	li	a4,1
  800338:	008a8993          	addi	s3,s5,8
  80033c:	01074463          	blt	a4,a6,800344 <vprintfmt+0x154>
  800340:	1c080463          	beqz	a6,800508 <vprintfmt+0x318>
  800344:	000ab403          	ld	s0,0(s5)
  800348:	1c044a63          	bltz	s0,80051c <vprintfmt+0x32c>
  80034c:	8622                	mv	a2,s0
  80034e:	8ace                	mv	s5,s3
  800350:	46a9                	li	a3,10
  800352:	a8f1                	j	80042e <vprintfmt+0x23e>
  800354:	000aa783          	lw	a5,0(s5)
  800358:	4761                	li	a4,24
  80035a:	0aa1                	addi	s5,s5,8
  80035c:	41f7d69b          	sraiw	a3,a5,0x1f
  800360:	8fb5                	xor	a5,a5,a3
  800362:	40d786bb          	subw	a3,a5,a3
  800366:	12d74963          	blt	a4,a3,800498 <vprintfmt+0x2a8>
  80036a:	00369793          	slli	a5,a3,0x3
  80036e:	97e2                	add	a5,a5,s8
  800370:	639c                	ld	a5,0(a5)
  800372:	12078363          	beqz	a5,800498 <vprintfmt+0x2a8>
  800376:	86be                	mv	a3,a5
  800378:	00000617          	auipc	a2,0x0
  80037c:	68060613          	addi	a2,a2,1664 # 8009f8 <error_string+0x1b8>
  800380:	85a6                	mv	a1,s1
  800382:	854a                	mv	a0,s2
  800384:	1cc000ef          	jal	ra,800550 <printfmt>
  800388:	b54d                	j	80022a <vprintfmt+0x3a>
  80038a:	000ab603          	ld	a2,0(s5)
  80038e:	0aa1                	addi	s5,s5,8
  800390:	1a060163          	beqz	a2,800532 <vprintfmt+0x342>
  800394:	00160413          	addi	s0,a2,1
  800398:	15b05763          	blez	s11,8004e6 <vprintfmt+0x2f6>
  80039c:	02d00593          	li	a1,45
  8003a0:	10b79d63          	bne	a5,a1,8004ba <vprintfmt+0x2ca>
  8003a4:	00064783          	lbu	a5,0(a2)
  8003a8:	0007851b          	sext.w	a0,a5
  8003ac:	c905                	beqz	a0,8003dc <vprintfmt+0x1ec>
  8003ae:	000cc563          	bltz	s9,8003b8 <vprintfmt+0x1c8>
  8003b2:	3cfd                	addiw	s9,s9,-1
  8003b4:	036c8263          	beq	s9,s6,8003d8 <vprintfmt+0x1e8>
  8003b8:	85a6                	mv	a1,s1
  8003ba:	14098f63          	beqz	s3,800518 <vprintfmt+0x328>
  8003be:	3781                	addiw	a5,a5,-32
  8003c0:	14fbfc63          	bgeu	s7,a5,800518 <vprintfmt+0x328>
  8003c4:	03f00513          	li	a0,63
  8003c8:	9902                	jalr	s2
  8003ca:	0405                	addi	s0,s0,1
  8003cc:	fff44783          	lbu	a5,-1(s0)
  8003d0:	3dfd                	addiw	s11,s11,-1
  8003d2:	0007851b          	sext.w	a0,a5
  8003d6:	fd61                	bnez	a0,8003ae <vprintfmt+0x1be>
  8003d8:	e5b059e3          	blez	s11,80022a <vprintfmt+0x3a>
  8003dc:	3dfd                	addiw	s11,s11,-1
  8003de:	85a6                	mv	a1,s1
  8003e0:	02000513          	li	a0,32
  8003e4:	9902                	jalr	s2
  8003e6:	e40d82e3          	beqz	s11,80022a <vprintfmt+0x3a>
  8003ea:	3dfd                	addiw	s11,s11,-1
  8003ec:	85a6                	mv	a1,s1
  8003ee:	02000513          	li	a0,32
  8003f2:	9902                	jalr	s2
  8003f4:	fe0d94e3          	bnez	s11,8003dc <vprintfmt+0x1ec>
  8003f8:	bd0d                	j	80022a <vprintfmt+0x3a>
  8003fa:	4705                	li	a4,1
  8003fc:	008a8593          	addi	a1,s5,8
  800400:	01074463          	blt	a4,a6,800408 <vprintfmt+0x218>
  800404:	0e080863          	beqz	a6,8004f4 <vprintfmt+0x304>
  800408:	000ab603          	ld	a2,0(s5)
  80040c:	46a1                	li	a3,8
  80040e:	8aae                	mv	s5,a1
  800410:	a839                	j	80042e <vprintfmt+0x23e>
  800412:	03000513          	li	a0,48
  800416:	85a6                	mv	a1,s1
  800418:	e03e                	sd	a5,0(sp)
  80041a:	9902                	jalr	s2
  80041c:	85a6                	mv	a1,s1
  80041e:	07800513          	li	a0,120
  800422:	9902                	jalr	s2
  800424:	0aa1                	addi	s5,s5,8
  800426:	ff8ab603          	ld	a2,-8(s5)
  80042a:	6782                	ld	a5,0(sp)
  80042c:	46c1                	li	a3,16
  80042e:	2781                	sext.w	a5,a5
  800430:	876e                	mv	a4,s11
  800432:	85a6                	mv	a1,s1
  800434:	854a                	mv	a0,s2
  800436:	d4fff0ef          	jal	ra,800184 <printnum>
  80043a:	bbc5                	j	80022a <vprintfmt+0x3a>
  80043c:	00144603          	lbu	a2,1(s0)
  800440:	2805                	addiw	a6,a6,1
  800442:	846a                	mv	s0,s10
  800444:	b515                	j	800268 <vprintfmt+0x78>
  800446:	00144603          	lbu	a2,1(s0)
  80044a:	4985                	li	s3,1
  80044c:	846a                	mv	s0,s10
  80044e:	bd29                	j	800268 <vprintfmt+0x78>
  800450:	85a6                	mv	a1,s1
  800452:	02500513          	li	a0,37
  800456:	9902                	jalr	s2
  800458:	bbc9                	j	80022a <vprintfmt+0x3a>
  80045a:	4705                	li	a4,1
  80045c:	008a8593          	addi	a1,s5,8
  800460:	01074463          	blt	a4,a6,800468 <vprintfmt+0x278>
  800464:	08080d63          	beqz	a6,8004fe <vprintfmt+0x30e>
  800468:	000ab603          	ld	a2,0(s5)
  80046c:	46a9                	li	a3,10
  80046e:	8aae                	mv	s5,a1
  800470:	bf7d                	j	80042e <vprintfmt+0x23e>
  800472:	85a6                	mv	a1,s1
  800474:	02500513          	li	a0,37
  800478:	9902                	jalr	s2
  80047a:	fff44703          	lbu	a4,-1(s0)
  80047e:	02500793          	li	a5,37
  800482:	8d22                	mv	s10,s0
  800484:	daf703e3          	beq	a4,a5,80022a <vprintfmt+0x3a>
  800488:	02500713          	li	a4,37
  80048c:	1d7d                	addi	s10,s10,-1
  80048e:	fffd4783          	lbu	a5,-1(s10)
  800492:	fee79de3          	bne	a5,a4,80048c <vprintfmt+0x29c>
  800496:	bb51                	j	80022a <vprintfmt+0x3a>
  800498:	00000617          	auipc	a2,0x0
  80049c:	55060613          	addi	a2,a2,1360 # 8009e8 <error_string+0x1a8>
  8004a0:	85a6                	mv	a1,s1
  8004a2:	854a                	mv	a0,s2
  8004a4:	0ac000ef          	jal	ra,800550 <printfmt>
  8004a8:	b349                	j	80022a <vprintfmt+0x3a>
  8004aa:	00000617          	auipc	a2,0x0
  8004ae:	53660613          	addi	a2,a2,1334 # 8009e0 <error_string+0x1a0>
  8004b2:	00000417          	auipc	s0,0x0
  8004b6:	52f40413          	addi	s0,s0,1327 # 8009e1 <error_string+0x1a1>
  8004ba:	8532                	mv	a0,a2
  8004bc:	85e6                	mv	a1,s9
  8004be:	e032                	sd	a2,0(sp)
  8004c0:	e43e                	sd	a5,8(sp)
  8004c2:	c9dff0ef          	jal	ra,80015e <strnlen>
  8004c6:	40ad8dbb          	subw	s11,s11,a0
  8004ca:	6602                	ld	a2,0(sp)
  8004cc:	01b05d63          	blez	s11,8004e6 <vprintfmt+0x2f6>
  8004d0:	67a2                	ld	a5,8(sp)
  8004d2:	2781                	sext.w	a5,a5
  8004d4:	e43e                	sd	a5,8(sp)
  8004d6:	6522                	ld	a0,8(sp)
  8004d8:	85a6                	mv	a1,s1
  8004da:	e032                	sd	a2,0(sp)
  8004dc:	3dfd                	addiw	s11,s11,-1
  8004de:	9902                	jalr	s2
  8004e0:	6602                	ld	a2,0(sp)
  8004e2:	fe0d9ae3          	bnez	s11,8004d6 <vprintfmt+0x2e6>
  8004e6:	00064783          	lbu	a5,0(a2)
  8004ea:	0007851b          	sext.w	a0,a5
  8004ee:	ec0510e3          	bnez	a0,8003ae <vprintfmt+0x1be>
  8004f2:	bb25                	j	80022a <vprintfmt+0x3a>
  8004f4:	000ae603          	lwu	a2,0(s5)
  8004f8:	46a1                	li	a3,8
  8004fa:	8aae                	mv	s5,a1
  8004fc:	bf0d                	j	80042e <vprintfmt+0x23e>
  8004fe:	000ae603          	lwu	a2,0(s5)
  800502:	46a9                	li	a3,10
  800504:	8aae                	mv	s5,a1
  800506:	b725                	j	80042e <vprintfmt+0x23e>
  800508:	000aa403          	lw	s0,0(s5)
  80050c:	bd35                	j	800348 <vprintfmt+0x158>
  80050e:	000ae603          	lwu	a2,0(s5)
  800512:	46c1                	li	a3,16
  800514:	8aae                	mv	s5,a1
  800516:	bf21                	j	80042e <vprintfmt+0x23e>
  800518:	9902                	jalr	s2
  80051a:	bd45                	j	8003ca <vprintfmt+0x1da>
  80051c:	85a6                	mv	a1,s1
  80051e:	02d00513          	li	a0,45
  800522:	e03e                	sd	a5,0(sp)
  800524:	9902                	jalr	s2
  800526:	8ace                	mv	s5,s3
  800528:	40800633          	neg	a2,s0
  80052c:	46a9                	li	a3,10
  80052e:	6782                	ld	a5,0(sp)
  800530:	bdfd                	j	80042e <vprintfmt+0x23e>
  800532:	01b05663          	blez	s11,80053e <vprintfmt+0x34e>
  800536:	02d00693          	li	a3,45
  80053a:	f6d798e3          	bne	a5,a3,8004aa <vprintfmt+0x2ba>
  80053e:	00000417          	auipc	s0,0x0
  800542:	4a340413          	addi	s0,s0,1187 # 8009e1 <error_string+0x1a1>
  800546:	02800513          	li	a0,40
  80054a:	02800793          	li	a5,40
  80054e:	b585                	j	8003ae <vprintfmt+0x1be>

0000000000800550 <printfmt>:
  800550:	715d                	addi	sp,sp,-80
  800552:	02810313          	addi	t1,sp,40
  800556:	f436                	sd	a3,40(sp)
  800558:	869a                	mv	a3,t1
  80055a:	ec06                	sd	ra,24(sp)
  80055c:	f83a                	sd	a4,48(sp)
  80055e:	fc3e                	sd	a5,56(sp)
  800560:	e0c2                	sd	a6,64(sp)
  800562:	e4c6                	sd	a7,72(sp)
  800564:	e41a                	sd	t1,8(sp)
  800566:	c8bff0ef          	jal	ra,8001f0 <vprintfmt>
  80056a:	60e2                	ld	ra,24(sp)
  80056c:	6161                	addi	sp,sp,80
  80056e:	8082                	ret

0000000000800570 <do_yield>:
  800570:	1141                	addi	sp,sp,-16
  800572:	e406                	sd	ra,8(sp)
  800574:	b65ff0ef          	jal	ra,8000d8 <yield>
  800578:	b61ff0ef          	jal	ra,8000d8 <yield>
  80057c:	b5dff0ef          	jal	ra,8000d8 <yield>
  800580:	b59ff0ef          	jal	ra,8000d8 <yield>
  800584:	b55ff0ef          	jal	ra,8000d8 <yield>
  800588:	60a2                	ld	ra,8(sp)
  80058a:	0141                	addi	sp,sp,16
  80058c:	b6b1                	j	8000d8 <yield>

000000000080058e <loop>:
  80058e:	1141                	addi	sp,sp,-16
  800590:	00000517          	auipc	a0,0x0
  800594:	47050513          	addi	a0,a0,1136 # 800a00 <error_string+0x1c0>
  800598:	e406                	sd	ra,8(sp)
  80059a:	b85ff0ef          	jal	ra,80011e <cprintf>
  80059e:	a001                	j	80059e <loop+0x10>

00000000008005a0 <work>:
  8005a0:	1141                	addi	sp,sp,-16
  8005a2:	00000517          	auipc	a0,0x0
  8005a6:	4de50513          	addi	a0,a0,1246 # 800a80 <error_string+0x240>
  8005aa:	e406                	sd	ra,8(sp)
  8005ac:	b73ff0ef          	jal	ra,80011e <cprintf>
  8005b0:	fc1ff0ef          	jal	ra,800570 <do_yield>
  8005b4:	00001797          	auipc	a5,0x1
  8005b8:	a4c78793          	addi	a5,a5,-1460 # 801000 <parent>
  8005bc:	4388                	lw	a0,0(a5)
  8005be:	b1dff0ef          	jal	ra,8000da <kill>
  8005c2:	e10d                	bnez	a0,8005e4 <work+0x44>
  8005c4:	00000517          	auipc	a0,0x0
  8005c8:	4cc50513          	addi	a0,a0,1228 # 800a90 <error_string+0x250>
  8005cc:	b53ff0ef          	jal	ra,80011e <cprintf>
  8005d0:	fa1ff0ef          	jal	ra,800570 <do_yield>
  8005d4:	00001797          	auipc	a5,0x1
  8005d8:	a3478793          	addi	a5,a5,-1484 # 801008 <pid1>
  8005dc:	4388                	lw	a0,0(a5)
  8005de:	afdff0ef          	jal	ra,8000da <kill>
  8005e2:	c501                	beqz	a0,8005ea <work+0x4a>
  8005e4:	557d                	li	a0,-1
  8005e6:	ad9ff0ef          	jal	ra,8000be <exit>
  8005ea:	00000517          	auipc	a0,0x0
  8005ee:	4be50513          	addi	a0,a0,1214 # 800aa8 <error_string+0x268>
  8005f2:	b2dff0ef          	jal	ra,80011e <cprintf>
  8005f6:	4501                	li	a0,0
  8005f8:	ac7ff0ef          	jal	ra,8000be <exit>

00000000008005fc <main>:
  8005fc:	1141                	addi	sp,sp,-16
  8005fe:	e406                	sd	ra,8(sp)
  800600:	e022                	sd	s0,0(sp)
  800602:	adbff0ef          	jal	ra,8000dc <getpid>
  800606:	00001797          	auipc	a5,0x1
  80060a:	9ea7ad23          	sw	a0,-1542(a5) # 801000 <parent>
  80060e:	ac7ff0ef          	jal	ra,8000d4 <fork>
  800612:	00001797          	auipc	a5,0x1
  800616:	9ea7ab23          	sw	a0,-1546(a5) # 801008 <pid1>
  80061a:	c53d                	beqz	a0,800688 <main+0x8c>
  80061c:	04a05663          	blez	a0,800668 <main+0x6c>
  800620:	ab5ff0ef          	jal	ra,8000d4 <fork>
  800624:	00001797          	auipc	a5,0x1
  800628:	9ea7a023          	sw	a0,-1568(a5) # 801004 <pid2>
  80062c:	cd3d                	beqz	a0,8006aa <main+0xae>
  80062e:	00001417          	auipc	s0,0x1
  800632:	9da40413          	addi	s0,s0,-1574 # 801008 <pid1>
  800636:	04a05b63          	blez	a0,80068c <main+0x90>
  80063a:	00000517          	auipc	a0,0x0
  80063e:	40e50513          	addi	a0,a0,1038 # 800a48 <error_string+0x208>
  800642:	addff0ef          	jal	ra,80011e <cprintf>
  800646:	4008                	lw	a0,0(s0)
  800648:	4581                	li	a1,0
  80064a:	a8dff0ef          	jal	ra,8000d6 <waitpid>
  80064e:	4014                	lw	a3,0(s0)
  800650:	00000617          	auipc	a2,0x0
  800654:	40860613          	addi	a2,a2,1032 # 800a58 <error_string+0x218>
  800658:	03400593          	li	a1,52
  80065c:	00000517          	auipc	a0,0x0
  800660:	3dc50513          	addi	a0,a0,988 # 800a38 <error_string+0x1f8>
  800664:	9bdff0ef          	jal	ra,800020 <__panic>
  800668:	00000697          	auipc	a3,0x0
  80066c:	3a868693          	addi	a3,a3,936 # 800a10 <error_string+0x1d0>
  800670:	00000617          	auipc	a2,0x0
  800674:	3b060613          	addi	a2,a2,944 # 800a20 <error_string+0x1e0>
  800678:	02c00593          	li	a1,44
  80067c:	00000517          	auipc	a0,0x0
  800680:	3bc50513          	addi	a0,a0,956 # 800a38 <error_string+0x1f8>
  800684:	99dff0ef          	jal	ra,800020 <__panic>
  800688:	f07ff0ef          	jal	ra,80058e <loop>
  80068c:	4008                	lw	a0,0(s0)
  80068e:	a4dff0ef          	jal	ra,8000da <kill>
  800692:	00000617          	auipc	a2,0x0
  800696:	3de60613          	addi	a2,a2,990 # 800a70 <error_string+0x230>
  80069a:	03900593          	li	a1,57
  80069e:	00000517          	auipc	a0,0x0
  8006a2:	39a50513          	addi	a0,a0,922 # 800a38 <error_string+0x1f8>
  8006a6:	97bff0ef          	jal	ra,800020 <__panic>
  8006aa:	ef7ff0ef          	jal	ra,8005a0 <work>
