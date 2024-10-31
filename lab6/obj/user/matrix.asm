
obj/__user_matrix.out：     文件格式 elf64-littleriscv


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
  800032:	78a50513          	addi	a0,a0,1930 # 8007b8 <main+0xca>
  800036:	ec06                	sd	ra,24(sp)
  800038:	f436                	sd	a3,40(sp)
  80003a:	f83a                	sd	a4,48(sp)
  80003c:	e0c2                	sd	a6,64(sp)
  80003e:	e4c6                	sd	a7,72(sp)
  800040:	e43e                	sd	a5,8(sp)
  800042:	0e0000ef          	jal	ra,800122 <cprintf>
  800046:	65a2                	ld	a1,8(sp)
  800048:	8522                	mv	a0,s0
  80004a:	0b8000ef          	jal	ra,800102 <vcprintf>
  80004e:	00001517          	auipc	a0,0x1
  800052:	aca50513          	addi	a0,a0,-1334 # 800b18 <error_string+0x1d0>
  800056:	0cc000ef          	jal	ra,800122 <cprintf>
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
  8000ca:	71250513          	addi	a0,a0,1810 # 8007d8 <main+0xea>
  8000ce:	054000ef          	jal	ra,800122 <cprintf>
  8000d2:	a001                	j	8000d2 <exit+0x14>

00000000008000d4 <fork>:
  8000d4:	b7e9                	j	80009e <sys_fork>

00000000008000d6 <wait>:
  8000d6:	4581                	li	a1,0
  8000d8:	4501                	li	a0,0
  8000da:	b7e1                	j	8000a2 <sys_wait>

00000000008000dc <yield>:
  8000dc:	b7f9                	j	8000aa <sys_yield>

00000000008000de <kill>:
  8000de:	bfc1                	j	8000ae <sys_kill>

00000000008000e0 <getpid>:
  8000e0:	bfd1                	j	8000b4 <sys_getpid>

00000000008000e2 <_start>:
  8000e2:	074000ef          	jal	ra,800156 <umain>
  8000e6:	a001                	j	8000e6 <_start+0x4>

00000000008000e8 <cputch>:
  8000e8:	1141                	addi	sp,sp,-16
  8000ea:	e022                	sd	s0,0(sp)
  8000ec:	e406                	sd	ra,8(sp)
  8000ee:	842e                	mv	s0,a1
  8000f0:	fc9ff0ef          	jal	ra,8000b8 <sys_putc>
  8000f4:	401c                	lw	a5,0(s0)
  8000f6:	60a2                	ld	ra,8(sp)
  8000f8:	2785                	addiw	a5,a5,1
  8000fa:	c01c                	sw	a5,0(s0)
  8000fc:	6402                	ld	s0,0(sp)
  8000fe:	0141                	addi	sp,sp,16
  800100:	8082                	ret

0000000000800102 <vcprintf>:
  800102:	1101                	addi	sp,sp,-32
  800104:	86ae                	mv	a3,a1
  800106:	862a                	mv	a2,a0
  800108:	006c                	addi	a1,sp,12
  80010a:	00000517          	auipc	a0,0x0
  80010e:	fde50513          	addi	a0,a0,-34 # 8000e8 <cputch>
  800112:	ec06                	sd	ra,24(sp)
  800114:	c602                	sw	zero,12(sp)
  800116:	0f0000ef          	jal	ra,800206 <vprintfmt>
  80011a:	60e2                	ld	ra,24(sp)
  80011c:	4532                	lw	a0,12(sp)
  80011e:	6105                	addi	sp,sp,32
  800120:	8082                	ret

0000000000800122 <cprintf>:
  800122:	711d                	addi	sp,sp,-96
  800124:	02810313          	addi	t1,sp,40
  800128:	f42e                	sd	a1,40(sp)
  80012a:	f832                	sd	a2,48(sp)
  80012c:	fc36                	sd	a3,56(sp)
  80012e:	862a                	mv	a2,a0
  800130:	004c                	addi	a1,sp,4
  800132:	00000517          	auipc	a0,0x0
  800136:	fb650513          	addi	a0,a0,-74 # 8000e8 <cputch>
  80013a:	869a                	mv	a3,t1
  80013c:	ec06                	sd	ra,24(sp)
  80013e:	e0ba                	sd	a4,64(sp)
  800140:	e4be                	sd	a5,72(sp)
  800142:	e8c2                	sd	a6,80(sp)
  800144:	ecc6                	sd	a7,88(sp)
  800146:	e41a                	sd	t1,8(sp)
  800148:	c202                	sw	zero,4(sp)
  80014a:	0bc000ef          	jal	ra,800206 <vprintfmt>
  80014e:	60e2                	ld	ra,24(sp)
  800150:	4512                	lw	a0,4(sp)
  800152:	6125                	addi	sp,sp,96
  800154:	8082                	ret

0000000000800156 <umain>:
  800156:	1141                	addi	sp,sp,-16
  800158:	e406                	sd	ra,8(sp)
  80015a:	594000ef          	jal	ra,8006ee <main>
  80015e:	f61ff0ef          	jal	ra,8000be <exit>

0000000000800162 <strnlen>:
  800162:	c185                	beqz	a1,800182 <strnlen+0x20>
  800164:	00054783          	lbu	a5,0(a0)
  800168:	cf89                	beqz	a5,800182 <strnlen+0x20>
  80016a:	4781                	li	a5,0
  80016c:	a021                	j	800174 <strnlen+0x12>
  80016e:	00074703          	lbu	a4,0(a4)
  800172:	c711                	beqz	a4,80017e <strnlen+0x1c>
  800174:	0785                	addi	a5,a5,1
  800176:	00f50733          	add	a4,a0,a5
  80017a:	fef59ae3          	bne	a1,a5,80016e <strnlen+0xc>
  80017e:	853e                	mv	a0,a5
  800180:	8082                	ret
  800182:	4781                	li	a5,0
  800184:	853e                	mv	a0,a5
  800186:	8082                	ret

0000000000800188 <memset>:
  800188:	ca01                	beqz	a2,800198 <memset+0x10>
  80018a:	962a                	add	a2,a2,a0
  80018c:	87aa                	mv	a5,a0
  80018e:	0785                	addi	a5,a5,1
  800190:	feb78fa3          	sb	a1,-1(a5)
  800194:	fec79de3          	bne	a5,a2,80018e <memset+0x6>
  800198:	8082                	ret

000000000080019a <printnum>:
  80019a:	02069813          	slli	a6,a3,0x20
  80019e:	7179                	addi	sp,sp,-48
  8001a0:	02085813          	srli	a6,a6,0x20
  8001a4:	e052                	sd	s4,0(sp)
  8001a6:	03067a33          	remu	s4,a2,a6
  8001aa:	f022                	sd	s0,32(sp)
  8001ac:	ec26                	sd	s1,24(sp)
  8001ae:	e84a                	sd	s2,16(sp)
  8001b0:	f406                	sd	ra,40(sp)
  8001b2:	e44e                	sd	s3,8(sp)
  8001b4:	84aa                	mv	s1,a0
  8001b6:	892e                	mv	s2,a1
  8001b8:	fff7041b          	addiw	s0,a4,-1
  8001bc:	2a01                	sext.w	s4,s4
  8001be:	03067e63          	bgeu	a2,a6,8001fa <printnum+0x60>
  8001c2:	89be                	mv	s3,a5
  8001c4:	00805763          	blez	s0,8001d2 <printnum+0x38>
  8001c8:	347d                	addiw	s0,s0,-1
  8001ca:	85ca                	mv	a1,s2
  8001cc:	854e                	mv	a0,s3
  8001ce:	9482                	jalr	s1
  8001d0:	fc65                	bnez	s0,8001c8 <printnum+0x2e>
  8001d2:	1a02                	slli	s4,s4,0x20
  8001d4:	020a5a13          	srli	s4,s4,0x20
  8001d8:	00001797          	auipc	a5,0x1
  8001dc:	83878793          	addi	a5,a5,-1992 # 800a10 <error_string+0xc8>
  8001e0:	9a3e                	add	s4,s4,a5
  8001e2:	7402                	ld	s0,32(sp)
  8001e4:	000a4503          	lbu	a0,0(s4)
  8001e8:	70a2                	ld	ra,40(sp)
  8001ea:	69a2                	ld	s3,8(sp)
  8001ec:	6a02                	ld	s4,0(sp)
  8001ee:	85ca                	mv	a1,s2
  8001f0:	8326                	mv	t1,s1
  8001f2:	6942                	ld	s2,16(sp)
  8001f4:	64e2                	ld	s1,24(sp)
  8001f6:	6145                	addi	sp,sp,48
  8001f8:	8302                	jr	t1
  8001fa:	03065633          	divu	a2,a2,a6
  8001fe:	8722                	mv	a4,s0
  800200:	f9bff0ef          	jal	ra,80019a <printnum>
  800204:	b7f9                	j	8001d2 <printnum+0x38>

0000000000800206 <vprintfmt>:
  800206:	7119                	addi	sp,sp,-128
  800208:	f4a6                	sd	s1,104(sp)
  80020a:	f0ca                	sd	s2,96(sp)
  80020c:	e8d2                	sd	s4,80(sp)
  80020e:	e4d6                	sd	s5,72(sp)
  800210:	e0da                	sd	s6,64(sp)
  800212:	fc5e                	sd	s7,56(sp)
  800214:	f862                	sd	s8,48(sp)
  800216:	f06a                	sd	s10,32(sp)
  800218:	fc86                	sd	ra,120(sp)
  80021a:	f8a2                	sd	s0,112(sp)
  80021c:	ecce                	sd	s3,88(sp)
  80021e:	f466                	sd	s9,40(sp)
  800220:	ec6e                	sd	s11,24(sp)
  800222:	892a                	mv	s2,a0
  800224:	84ae                	mv	s1,a1
  800226:	8d32                	mv	s10,a2
  800228:	8ab6                	mv	s5,a3
  80022a:	5b7d                	li	s6,-1
  80022c:	00000a17          	auipc	s4,0x0
  800230:	5c0a0a13          	addi	s4,s4,1472 # 8007ec <main+0xfe>
  800234:	05e00b93          	li	s7,94
  800238:	00000c17          	auipc	s8,0x0
  80023c:	710c0c13          	addi	s8,s8,1808 # 800948 <error_string>
  800240:	000d4503          	lbu	a0,0(s10)
  800244:	02500793          	li	a5,37
  800248:	001d0413          	addi	s0,s10,1
  80024c:	00f50e63          	beq	a0,a5,800268 <vprintfmt+0x62>
  800250:	c521                	beqz	a0,800298 <vprintfmt+0x92>
  800252:	02500993          	li	s3,37
  800256:	a011                	j	80025a <vprintfmt+0x54>
  800258:	c121                	beqz	a0,800298 <vprintfmt+0x92>
  80025a:	85a6                	mv	a1,s1
  80025c:	0405                	addi	s0,s0,1
  80025e:	9902                	jalr	s2
  800260:	fff44503          	lbu	a0,-1(s0)
  800264:	ff351ae3          	bne	a0,s3,800258 <vprintfmt+0x52>
  800268:	00044603          	lbu	a2,0(s0)
  80026c:	02000793          	li	a5,32
  800270:	4981                	li	s3,0
  800272:	4801                	li	a6,0
  800274:	5cfd                	li	s9,-1
  800276:	5dfd                	li	s11,-1
  800278:	05500593          	li	a1,85
  80027c:	4525                	li	a0,9
  80027e:	fdd6069b          	addiw	a3,a2,-35
  800282:	0ff6f693          	andi	a3,a3,255
  800286:	00140d13          	addi	s10,s0,1
  80028a:	1ed5ef63          	bltu	a1,a3,800488 <vprintfmt+0x282>
  80028e:	068a                	slli	a3,a3,0x2
  800290:	96d2                	add	a3,a3,s4
  800292:	4294                	lw	a3,0(a3)
  800294:	96d2                	add	a3,a3,s4
  800296:	8682                	jr	a3
  800298:	70e6                	ld	ra,120(sp)
  80029a:	7446                	ld	s0,112(sp)
  80029c:	74a6                	ld	s1,104(sp)
  80029e:	7906                	ld	s2,96(sp)
  8002a0:	69e6                	ld	s3,88(sp)
  8002a2:	6a46                	ld	s4,80(sp)
  8002a4:	6aa6                	ld	s5,72(sp)
  8002a6:	6b06                	ld	s6,64(sp)
  8002a8:	7be2                	ld	s7,56(sp)
  8002aa:	7c42                	ld	s8,48(sp)
  8002ac:	7ca2                	ld	s9,40(sp)
  8002ae:	7d02                	ld	s10,32(sp)
  8002b0:	6de2                	ld	s11,24(sp)
  8002b2:	6109                	addi	sp,sp,128
  8002b4:	8082                	ret
  8002b6:	87b2                	mv	a5,a2
  8002b8:	00144603          	lbu	a2,1(s0)
  8002bc:	846a                	mv	s0,s10
  8002be:	b7c1                	j	80027e <vprintfmt+0x78>
  8002c0:	000aac83          	lw	s9,0(s5)
  8002c4:	00144603          	lbu	a2,1(s0)
  8002c8:	0aa1                	addi	s5,s5,8
  8002ca:	846a                	mv	s0,s10
  8002cc:	fa0dd9e3          	bgez	s11,80027e <vprintfmt+0x78>
  8002d0:	8de6                	mv	s11,s9
  8002d2:	5cfd                	li	s9,-1
  8002d4:	b76d                	j	80027e <vprintfmt+0x78>
  8002d6:	fffdc693          	not	a3,s11
  8002da:	96fd                	srai	a3,a3,0x3f
  8002dc:	00ddfdb3          	and	s11,s11,a3
  8002e0:	00144603          	lbu	a2,1(s0)
  8002e4:	2d81                	sext.w	s11,s11
  8002e6:	846a                	mv	s0,s10
  8002e8:	bf59                	j	80027e <vprintfmt+0x78>
  8002ea:	4705                	li	a4,1
  8002ec:	008a8593          	addi	a1,s5,8
  8002f0:	01074463          	blt	a4,a6,8002f8 <vprintfmt+0xf2>
  8002f4:	22080863          	beqz	a6,800524 <vprintfmt+0x31e>
  8002f8:	000ab603          	ld	a2,0(s5)
  8002fc:	46c1                	li	a3,16
  8002fe:	8aae                	mv	s5,a1
  800300:	a291                	j	800444 <vprintfmt+0x23e>
  800302:	fd060c9b          	addiw	s9,a2,-48
  800306:	00144603          	lbu	a2,1(s0)
  80030a:	846a                	mv	s0,s10
  80030c:	fd06069b          	addiw	a3,a2,-48
  800310:	0006089b          	sext.w	a7,a2
  800314:	fad56ce3          	bltu	a0,a3,8002cc <vprintfmt+0xc6>
  800318:	0405                	addi	s0,s0,1
  80031a:	002c969b          	slliw	a3,s9,0x2
  80031e:	00044603          	lbu	a2,0(s0)
  800322:	0196873b          	addw	a4,a3,s9
  800326:	0017171b          	slliw	a4,a4,0x1
  80032a:	0117073b          	addw	a4,a4,a7
  80032e:	fd06069b          	addiw	a3,a2,-48
  800332:	fd070c9b          	addiw	s9,a4,-48
  800336:	0006089b          	sext.w	a7,a2
  80033a:	fcd57fe3          	bgeu	a0,a3,800318 <vprintfmt+0x112>
  80033e:	b779                	j	8002cc <vprintfmt+0xc6>
  800340:	000aa503          	lw	a0,0(s5)
  800344:	85a6                	mv	a1,s1
  800346:	0aa1                	addi	s5,s5,8
  800348:	9902                	jalr	s2
  80034a:	bddd                	j	800240 <vprintfmt+0x3a>
  80034c:	4705                	li	a4,1
  80034e:	008a8993          	addi	s3,s5,8
  800352:	01074463          	blt	a4,a6,80035a <vprintfmt+0x154>
  800356:	1c080463          	beqz	a6,80051e <vprintfmt+0x318>
  80035a:	000ab403          	ld	s0,0(s5)
  80035e:	1c044a63          	bltz	s0,800532 <vprintfmt+0x32c>
  800362:	8622                	mv	a2,s0
  800364:	8ace                	mv	s5,s3
  800366:	46a9                	li	a3,10
  800368:	a8f1                	j	800444 <vprintfmt+0x23e>
  80036a:	000aa783          	lw	a5,0(s5)
  80036e:	4761                	li	a4,24
  800370:	0aa1                	addi	s5,s5,8
  800372:	41f7d69b          	sraiw	a3,a5,0x1f
  800376:	8fb5                	xor	a5,a5,a3
  800378:	40d786bb          	subw	a3,a5,a3
  80037c:	12d74963          	blt	a4,a3,8004ae <vprintfmt+0x2a8>
  800380:	00369793          	slli	a5,a3,0x3
  800384:	97e2                	add	a5,a5,s8
  800386:	639c                	ld	a5,0(a5)
  800388:	12078363          	beqz	a5,8004ae <vprintfmt+0x2a8>
  80038c:	86be                	mv	a3,a5
  80038e:	00000617          	auipc	a2,0x0
  800392:	77260613          	addi	a2,a2,1906 # 800b00 <error_string+0x1b8>
  800396:	85a6                	mv	a1,s1
  800398:	854a                	mv	a0,s2
  80039a:	1cc000ef          	jal	ra,800566 <printfmt>
  80039e:	b54d                	j	800240 <vprintfmt+0x3a>
  8003a0:	000ab603          	ld	a2,0(s5)
  8003a4:	0aa1                	addi	s5,s5,8
  8003a6:	1a060163          	beqz	a2,800548 <vprintfmt+0x342>
  8003aa:	00160413          	addi	s0,a2,1
  8003ae:	15b05763          	blez	s11,8004fc <vprintfmt+0x2f6>
  8003b2:	02d00593          	li	a1,45
  8003b6:	10b79d63          	bne	a5,a1,8004d0 <vprintfmt+0x2ca>
  8003ba:	00064783          	lbu	a5,0(a2)
  8003be:	0007851b          	sext.w	a0,a5
  8003c2:	c905                	beqz	a0,8003f2 <vprintfmt+0x1ec>
  8003c4:	000cc563          	bltz	s9,8003ce <vprintfmt+0x1c8>
  8003c8:	3cfd                	addiw	s9,s9,-1
  8003ca:	036c8263          	beq	s9,s6,8003ee <vprintfmt+0x1e8>
  8003ce:	85a6                	mv	a1,s1
  8003d0:	14098f63          	beqz	s3,80052e <vprintfmt+0x328>
  8003d4:	3781                	addiw	a5,a5,-32
  8003d6:	14fbfc63          	bgeu	s7,a5,80052e <vprintfmt+0x328>
  8003da:	03f00513          	li	a0,63
  8003de:	9902                	jalr	s2
  8003e0:	0405                	addi	s0,s0,1
  8003e2:	fff44783          	lbu	a5,-1(s0)
  8003e6:	3dfd                	addiw	s11,s11,-1
  8003e8:	0007851b          	sext.w	a0,a5
  8003ec:	fd61                	bnez	a0,8003c4 <vprintfmt+0x1be>
  8003ee:	e5b059e3          	blez	s11,800240 <vprintfmt+0x3a>
  8003f2:	3dfd                	addiw	s11,s11,-1
  8003f4:	85a6                	mv	a1,s1
  8003f6:	02000513          	li	a0,32
  8003fa:	9902                	jalr	s2
  8003fc:	e40d82e3          	beqz	s11,800240 <vprintfmt+0x3a>
  800400:	3dfd                	addiw	s11,s11,-1
  800402:	85a6                	mv	a1,s1
  800404:	02000513          	li	a0,32
  800408:	9902                	jalr	s2
  80040a:	fe0d94e3          	bnez	s11,8003f2 <vprintfmt+0x1ec>
  80040e:	bd0d                	j	800240 <vprintfmt+0x3a>
  800410:	4705                	li	a4,1
  800412:	008a8593          	addi	a1,s5,8
  800416:	01074463          	blt	a4,a6,80041e <vprintfmt+0x218>
  80041a:	0e080863          	beqz	a6,80050a <vprintfmt+0x304>
  80041e:	000ab603          	ld	a2,0(s5)
  800422:	46a1                	li	a3,8
  800424:	8aae                	mv	s5,a1
  800426:	a839                	j	800444 <vprintfmt+0x23e>
  800428:	03000513          	li	a0,48
  80042c:	85a6                	mv	a1,s1
  80042e:	e03e                	sd	a5,0(sp)
  800430:	9902                	jalr	s2
  800432:	85a6                	mv	a1,s1
  800434:	07800513          	li	a0,120
  800438:	9902                	jalr	s2
  80043a:	0aa1                	addi	s5,s5,8
  80043c:	ff8ab603          	ld	a2,-8(s5)
  800440:	6782                	ld	a5,0(sp)
  800442:	46c1                	li	a3,16
  800444:	2781                	sext.w	a5,a5
  800446:	876e                	mv	a4,s11
  800448:	85a6                	mv	a1,s1
  80044a:	854a                	mv	a0,s2
  80044c:	d4fff0ef          	jal	ra,80019a <printnum>
  800450:	bbc5                	j	800240 <vprintfmt+0x3a>
  800452:	00144603          	lbu	a2,1(s0)
  800456:	2805                	addiw	a6,a6,1
  800458:	846a                	mv	s0,s10
  80045a:	b515                	j	80027e <vprintfmt+0x78>
  80045c:	00144603          	lbu	a2,1(s0)
  800460:	4985                	li	s3,1
  800462:	846a                	mv	s0,s10
  800464:	bd29                	j	80027e <vprintfmt+0x78>
  800466:	85a6                	mv	a1,s1
  800468:	02500513          	li	a0,37
  80046c:	9902                	jalr	s2
  80046e:	bbc9                	j	800240 <vprintfmt+0x3a>
  800470:	4705                	li	a4,1
  800472:	008a8593          	addi	a1,s5,8
  800476:	01074463          	blt	a4,a6,80047e <vprintfmt+0x278>
  80047a:	08080d63          	beqz	a6,800514 <vprintfmt+0x30e>
  80047e:	000ab603          	ld	a2,0(s5)
  800482:	46a9                	li	a3,10
  800484:	8aae                	mv	s5,a1
  800486:	bf7d                	j	800444 <vprintfmt+0x23e>
  800488:	85a6                	mv	a1,s1
  80048a:	02500513          	li	a0,37
  80048e:	9902                	jalr	s2
  800490:	fff44703          	lbu	a4,-1(s0)
  800494:	02500793          	li	a5,37
  800498:	8d22                	mv	s10,s0
  80049a:	daf703e3          	beq	a4,a5,800240 <vprintfmt+0x3a>
  80049e:	02500713          	li	a4,37
  8004a2:	1d7d                	addi	s10,s10,-1
  8004a4:	fffd4783          	lbu	a5,-1(s10)
  8004a8:	fee79de3          	bne	a5,a4,8004a2 <vprintfmt+0x29c>
  8004ac:	bb51                	j	800240 <vprintfmt+0x3a>
  8004ae:	00000617          	auipc	a2,0x0
  8004b2:	64260613          	addi	a2,a2,1602 # 800af0 <error_string+0x1a8>
  8004b6:	85a6                	mv	a1,s1
  8004b8:	854a                	mv	a0,s2
  8004ba:	0ac000ef          	jal	ra,800566 <printfmt>
  8004be:	b349                	j	800240 <vprintfmt+0x3a>
  8004c0:	00000617          	auipc	a2,0x0
  8004c4:	62860613          	addi	a2,a2,1576 # 800ae8 <error_string+0x1a0>
  8004c8:	00000417          	auipc	s0,0x0
  8004cc:	62140413          	addi	s0,s0,1569 # 800ae9 <error_string+0x1a1>
  8004d0:	8532                	mv	a0,a2
  8004d2:	85e6                	mv	a1,s9
  8004d4:	e032                	sd	a2,0(sp)
  8004d6:	e43e                	sd	a5,8(sp)
  8004d8:	c8bff0ef          	jal	ra,800162 <strnlen>
  8004dc:	40ad8dbb          	subw	s11,s11,a0
  8004e0:	6602                	ld	a2,0(sp)
  8004e2:	01b05d63          	blez	s11,8004fc <vprintfmt+0x2f6>
  8004e6:	67a2                	ld	a5,8(sp)
  8004e8:	2781                	sext.w	a5,a5
  8004ea:	e43e                	sd	a5,8(sp)
  8004ec:	6522                	ld	a0,8(sp)
  8004ee:	85a6                	mv	a1,s1
  8004f0:	e032                	sd	a2,0(sp)
  8004f2:	3dfd                	addiw	s11,s11,-1
  8004f4:	9902                	jalr	s2
  8004f6:	6602                	ld	a2,0(sp)
  8004f8:	fe0d9ae3          	bnez	s11,8004ec <vprintfmt+0x2e6>
  8004fc:	00064783          	lbu	a5,0(a2)
  800500:	0007851b          	sext.w	a0,a5
  800504:	ec0510e3          	bnez	a0,8003c4 <vprintfmt+0x1be>
  800508:	bb25                	j	800240 <vprintfmt+0x3a>
  80050a:	000ae603          	lwu	a2,0(s5)
  80050e:	46a1                	li	a3,8
  800510:	8aae                	mv	s5,a1
  800512:	bf0d                	j	800444 <vprintfmt+0x23e>
  800514:	000ae603          	lwu	a2,0(s5)
  800518:	46a9                	li	a3,10
  80051a:	8aae                	mv	s5,a1
  80051c:	b725                	j	800444 <vprintfmt+0x23e>
  80051e:	000aa403          	lw	s0,0(s5)
  800522:	bd35                	j	80035e <vprintfmt+0x158>
  800524:	000ae603          	lwu	a2,0(s5)
  800528:	46c1                	li	a3,16
  80052a:	8aae                	mv	s5,a1
  80052c:	bf21                	j	800444 <vprintfmt+0x23e>
  80052e:	9902                	jalr	s2
  800530:	bd45                	j	8003e0 <vprintfmt+0x1da>
  800532:	85a6                	mv	a1,s1
  800534:	02d00513          	li	a0,45
  800538:	e03e                	sd	a5,0(sp)
  80053a:	9902                	jalr	s2
  80053c:	8ace                	mv	s5,s3
  80053e:	40800633          	neg	a2,s0
  800542:	46a9                	li	a3,10
  800544:	6782                	ld	a5,0(sp)
  800546:	bdfd                	j	800444 <vprintfmt+0x23e>
  800548:	01b05663          	blez	s11,800554 <vprintfmt+0x34e>
  80054c:	02d00693          	li	a3,45
  800550:	f6d798e3          	bne	a5,a3,8004c0 <vprintfmt+0x2ba>
  800554:	00000417          	auipc	s0,0x0
  800558:	59540413          	addi	s0,s0,1429 # 800ae9 <error_string+0x1a1>
  80055c:	02800513          	li	a0,40
  800560:	02800793          	li	a5,40
  800564:	b585                	j	8003c4 <vprintfmt+0x1be>

0000000000800566 <printfmt>:
  800566:	715d                	addi	sp,sp,-80
  800568:	02810313          	addi	t1,sp,40
  80056c:	f436                	sd	a3,40(sp)
  80056e:	869a                	mv	a3,t1
  800570:	ec06                	sd	ra,24(sp)
  800572:	f83a                	sd	a4,48(sp)
  800574:	fc3e                	sd	a5,56(sp)
  800576:	e0c2                	sd	a6,64(sp)
  800578:	e4c6                	sd	a7,72(sp)
  80057a:	e41a                	sd	t1,8(sp)
  80057c:	c8bff0ef          	jal	ra,800206 <vprintfmt>
  800580:	60e2                	ld	ra,24(sp)
  800582:	6161                	addi	sp,sp,80
  800584:	8082                	ret

0000000000800586 <rand>:
  800586:	00001697          	auipc	a3,0x1
  80058a:	a7a68693          	addi	a3,a3,-1414 # 801000 <next>
  80058e:	00000717          	auipc	a4,0x0
  800592:	57a70713          	addi	a4,a4,1402 # 800b08 <error_string+0x1c0>
  800596:	629c                	ld	a5,0(a3)
  800598:	6318                	ld	a4,0(a4)
  80059a:	02e787b3          	mul	a5,a5,a4
  80059e:	80000737          	lui	a4,0x80000
  8005a2:	fff74713          	not	a4,a4
  8005a6:	07ad                	addi	a5,a5,11
  8005a8:	07c2                	slli	a5,a5,0x10
  8005aa:	83c1                	srli	a5,a5,0x10
  8005ac:	00c7d513          	srli	a0,a5,0xc
  8005b0:	02e57533          	remu	a0,a0,a4
  8005b4:	e29c                	sd	a5,0(a3)
  8005b6:	2505                	addiw	a0,a0,1
  8005b8:	8082                	ret

00000000008005ba <srand>:
  8005ba:	1502                	slli	a0,a0,0x20
  8005bc:	9101                	srli	a0,a0,0x20
  8005be:	00001797          	auipc	a5,0x1
  8005c2:	a4a7b123          	sd	a0,-1470(a5) # 801000 <next>
  8005c6:	8082                	ret

00000000008005c8 <work>:
  8005c8:	7179                	addi	sp,sp,-48
  8005ca:	e84a                	sd	s2,16(sp)
  8005cc:	00001597          	auipc	a1,0x1
  8005d0:	a1458593          	addi	a1,a1,-1516 # 800fe0 <error_string+0x698>
  8005d4:	00001917          	auipc	s2,0x1
  8005d8:	bc490913          	addi	s2,s2,-1084 # 801198 <matb>
  8005dc:	f022                	sd	s0,32(sp)
  8005de:	ec26                	sd	s1,24(sp)
  8005e0:	e44e                	sd	s3,8(sp)
  8005e2:	f406                	sd	ra,40(sp)
  8005e4:	84aa                	mv	s1,a0
  8005e6:	00001617          	auipc	a2,0x1
  8005ea:	bda60613          	addi	a2,a2,-1062 # 8011c0 <matb+0x28>
  8005ee:	00001417          	auipc	s0,0x1
  8005f2:	d6240413          	addi	s0,s0,-670 # 801350 <matc+0x28>
  8005f6:	00001997          	auipc	s3,0x1
  8005fa:	a1298993          	addi	s3,s3,-1518 # 801008 <mata>
  8005fe:	412585b3          	sub	a1,a1,s2
  800602:	4685                	li	a3,1
  800604:	fd860793          	addi	a5,a2,-40
  800608:	00c58733          	add	a4,a1,a2
  80060c:	c394                	sw	a3,0(a5)
  80060e:	c314                	sw	a3,0(a4)
  800610:	0791                	addi	a5,a5,4
  800612:	0711                	addi	a4,a4,4
  800614:	fec79ce3          	bne	a5,a2,80060c <work+0x44>
  800618:	02878613          	addi	a2,a5,40
  80061c:	fe8614e3          	bne	a2,s0,800604 <work+0x3c>
  800620:	abdff0ef          	jal	ra,8000dc <yield>
  800624:	abdff0ef          	jal	ra,8000e0 <getpid>
  800628:	8626                	mv	a2,s1
  80062a:	85aa                	mv	a1,a0
  80062c:	00000517          	auipc	a0,0x0
  800630:	53450513          	addi	a0,a0,1332 # 800b60 <error_string+0x218>
  800634:	aefff0ef          	jal	ra,800122 <cprintf>
  800638:	53fd                	li	t2,-1
  80063a:	34fd                	addiw	s1,s1,-1
  80063c:	00001297          	auipc	t0,0x1
  800640:	b5c28293          	addi	t0,t0,-1188 # 801198 <matb>
  800644:	00001f97          	auipc	t6,0x1
  800648:	ce4f8f93          	addi	t6,t6,-796 # 801328 <matc>
  80064c:	00001f17          	auipc	t5,0x1
  800650:	e6cf0f13          	addi	t5,t5,-404 # 8014b8 <matc+0x190>
  800654:	02800e13          	li	t3,40
  800658:	06748f63          	beq	s1,t2,8006d6 <work+0x10e>
  80065c:	00001897          	auipc	a7,0x1
  800660:	ccc88893          	addi	a7,a7,-820 # 801328 <matc>
  800664:	8ec6                	mv	t4,a7
  800666:	834e                	mv	t1,s3
  800668:	857e                	mv	a0,t6
  80066a:	8876                	mv	a6,t4
  80066c:	e7050793          	addi	a5,a0,-400
  800670:	869a                	mv	a3,t1
  800672:	4601                	li	a2,0
  800674:	4298                	lw	a4,0(a3)
  800676:	438c                	lw	a1,0(a5)
  800678:	02878793          	addi	a5,a5,40
  80067c:	0691                	addi	a3,a3,4
  80067e:	02b7073b          	mulw	a4,a4,a1
  800682:	9e39                	addw	a2,a2,a4
  800684:	fea798e3          	bne	a5,a0,800674 <work+0xac>
  800688:	00c82023          	sw	a2,0(a6)
  80068c:	00478513          	addi	a0,a5,4
  800690:	0811                	addi	a6,a6,4
  800692:	fc851de3          	bne	a0,s0,80066c <work+0xa4>
  800696:	02830313          	addi	t1,t1,40
  80069a:	028e8e93          	addi	t4,t4,40
  80069e:	fc5315e3          	bne	t1,t0,800668 <work+0xa0>
  8006a2:	854e                	mv	a0,s3
  8006a4:	85ca                	mv	a1,s2
  8006a6:	4781                	li	a5,0
  8006a8:	00f88733          	add	a4,a7,a5
  8006ac:	4318                	lw	a4,0(a4)
  8006ae:	00f58633          	add	a2,a1,a5
  8006b2:	00f506b3          	add	a3,a0,a5
  8006b6:	c218                	sw	a4,0(a2)
  8006b8:	c298                	sw	a4,0(a3)
  8006ba:	0791                	addi	a5,a5,4
  8006bc:	ffc796e3          	bne	a5,t3,8006a8 <work+0xe0>
  8006c0:	02888893          	addi	a7,a7,40
  8006c4:	02858593          	addi	a1,a1,40
  8006c8:	02850513          	addi	a0,a0,40
  8006cc:	fde89de3          	bne	a7,t5,8006a6 <work+0xde>
  8006d0:	34fd                	addiw	s1,s1,-1
  8006d2:	f87495e3          	bne	s1,t2,80065c <work+0x94>
  8006d6:	a0bff0ef          	jal	ra,8000e0 <getpid>
  8006da:	85aa                	mv	a1,a0
  8006dc:	00000517          	auipc	a0,0x0
  8006e0:	4a450513          	addi	a0,a0,1188 # 800b80 <error_string+0x238>
  8006e4:	a3fff0ef          	jal	ra,800122 <cprintf>
  8006e8:	4501                	li	a0,0
  8006ea:	9d5ff0ef          	jal	ra,8000be <exit>

00000000008006ee <main>:
  8006ee:	7175                	addi	sp,sp,-144
  8006f0:	f4ce                	sd	s3,104(sp)
  8006f2:	05400613          	li	a2,84
  8006f6:	4581                	li	a1,0
  8006f8:	0028                	addi	a0,sp,8
  8006fa:	00810993          	addi	s3,sp,8
  8006fe:	e122                	sd	s0,128(sp)
  800700:	fca6                	sd	s1,120(sp)
  800702:	f8ca                	sd	s2,112(sp)
  800704:	e506                	sd	ra,136(sp)
  800706:	84ce                	mv	s1,s3
  800708:	a81ff0ef          	jal	ra,800188 <memset>
  80070c:	4401                	li	s0,0
  80070e:	4955                	li	s2,21
  800710:	9c5ff0ef          	jal	ra,8000d4 <fork>
  800714:	c088                	sw	a0,0(s1)
  800716:	cd2d                	beqz	a0,800790 <main+0xa2>
  800718:	04054663          	bltz	a0,800764 <main+0x76>
  80071c:	2405                	addiw	s0,s0,1
  80071e:	0491                	addi	s1,s1,4
  800720:	ff2418e3          	bne	s0,s2,800710 <main+0x22>
  800724:	00000517          	auipc	a0,0x0
  800728:	3ec50513          	addi	a0,a0,1004 # 800b10 <error_string+0x1c8>
  80072c:	9f7ff0ef          	jal	ra,800122 <cprintf>
  800730:	4455                	li	s0,21
  800732:	9a5ff0ef          	jal	ra,8000d6 <wait>
  800736:	e10d                	bnez	a0,800758 <main+0x6a>
  800738:	347d                	addiw	s0,s0,-1
  80073a:	fc65                	bnez	s0,800732 <main+0x44>
  80073c:	00000517          	auipc	a0,0x0
  800740:	3f450513          	addi	a0,a0,1012 # 800b30 <error_string+0x1e8>
  800744:	9dfff0ef          	jal	ra,800122 <cprintf>
  800748:	60aa                	ld	ra,136(sp)
  80074a:	640a                	ld	s0,128(sp)
  80074c:	74e6                	ld	s1,120(sp)
  80074e:	7946                	ld	s2,112(sp)
  800750:	79a6                	ld	s3,104(sp)
  800752:	4501                	li	a0,0
  800754:	6149                	addi	sp,sp,144
  800756:	8082                	ret
  800758:	00000517          	auipc	a0,0x0
  80075c:	3c850513          	addi	a0,a0,968 # 800b20 <error_string+0x1d8>
  800760:	9c3ff0ef          	jal	ra,800122 <cprintf>
  800764:	08e0                	addi	s0,sp,92
  800766:	0009a503          	lw	a0,0(s3)
  80076a:	00a05463          	blez	a0,800772 <main+0x84>
  80076e:	971ff0ef          	jal	ra,8000de <kill>
  800772:	0991                	addi	s3,s3,4
  800774:	ff3419e3          	bne	s0,s3,800766 <main+0x78>
  800778:	00000617          	auipc	a2,0x0
  80077c:	3c860613          	addi	a2,a2,968 # 800b40 <error_string+0x1f8>
  800780:	05200593          	li	a1,82
  800784:	00000517          	auipc	a0,0x0
  800788:	3cc50513          	addi	a0,a0,972 # 800b50 <error_string+0x208>
  80078c:	895ff0ef          	jal	ra,800020 <__panic>
  800790:	0284053b          	mulw	a0,s0,s0
  800794:	e27ff0ef          	jal	ra,8005ba <srand>
  800798:	defff0ef          	jal	ra,800586 <rand>
  80079c:	47d5                	li	a5,21
  80079e:	02f5753b          	remuw	a0,a0,a5
  8007a2:	02a5053b          	mulw	a0,a0,a0
  8007a6:	00a5079b          	addiw	a5,a0,10
  8007aa:	06400513          	li	a0,100
  8007ae:	02f50533          	mul	a0,a0,a5
  8007b2:	e17ff0ef          	jal	ra,8005c8 <work>
