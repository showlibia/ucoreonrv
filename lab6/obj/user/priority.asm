
obj/__user_priority.out：     文件格式 elf64-littleriscv


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
  800032:	72250513          	addi	a0,a0,1826 # 800750 <main+0x1c0>
  800036:	ec06                	sd	ra,24(sp)
  800038:	f436                	sd	a3,40(sp)
  80003a:	f83a                	sd	a4,48(sp)
  80003c:	e0c2                	sd	a6,64(sp)
  80003e:	e4c6                	sd	a7,72(sp)
  800040:	e43e                	sd	a5,8(sp)
  800042:	0ea000ef          	jal	ra,80012c <cprintf>
  800046:	65a2                	ld	a1,8(sp)
  800048:	8522                	mv	a0,s0
  80004a:	0c2000ef          	jal	ra,80010c <vcprintf>
  80004e:	00000517          	auipc	a0,0x0
  800052:	72250513          	addi	a0,a0,1826 # 800770 <main+0x1e0>
  800056:	0d6000ef          	jal	ra,80012c <cprintf>
  80005a:	5559                	li	a0,-10
  80005c:	06a000ef          	jal	ra,8000c6 <exit>

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

00000000008000aa <sys_kill>:
  8000aa:	85aa                	mv	a1,a0
  8000ac:	4531                	li	a0,12
  8000ae:	bf4d                	j	800060 <syscall>

00000000008000b0 <sys_getpid>:
  8000b0:	4549                	li	a0,18
  8000b2:	b77d                	j	800060 <syscall>

00000000008000b4 <sys_putc>:
  8000b4:	85aa                	mv	a1,a0
  8000b6:	4579                	li	a0,30
  8000b8:	b765                	j	800060 <syscall>

00000000008000ba <sys_gettime>:
  8000ba:	4545                	li	a0,17
  8000bc:	b755                	j	800060 <syscall>

00000000008000be <sys_lab6_set_priority>:
  8000be:	85aa                	mv	a1,a0
  8000c0:	0ff00513          	li	a0,255
  8000c4:	bf71                	j	800060 <syscall>

00000000008000c6 <exit>:
  8000c6:	1141                	addi	sp,sp,-16
  8000c8:	e406                	sd	ra,8(sp)
  8000ca:	fcfff0ef          	jal	ra,800098 <sys_exit>
  8000ce:	00000517          	auipc	a0,0x0
  8000d2:	6aa50513          	addi	a0,a0,1706 # 800778 <main+0x1e8>
  8000d6:	056000ef          	jal	ra,80012c <cprintf>
  8000da:	a001                	j	8000da <exit+0x14>

00000000008000dc <fork>:
  8000dc:	b7c9                	j	80009e <sys_fork>

00000000008000de <waitpid>:
  8000de:	b7d1                	j	8000a2 <sys_wait>

00000000008000e0 <kill>:
  8000e0:	b7e9                	j	8000aa <sys_kill>

00000000008000e2 <getpid>:
  8000e2:	b7f9                	j	8000b0 <sys_getpid>

00000000008000e4 <gettime_msec>:
  8000e4:	bfd9                	j	8000ba <sys_gettime>

00000000008000e6 <lab6_setpriority>:
  8000e6:	1502                	slli	a0,a0,0x20
  8000e8:	9101                	srli	a0,a0,0x20
  8000ea:	bfd1                	j	8000be <sys_lab6_set_priority>

00000000008000ec <_start>:
  8000ec:	074000ef          	jal	ra,800160 <umain>
  8000f0:	a001                	j	8000f0 <_start+0x4>

00000000008000f2 <cputch>:
  8000f2:	1141                	addi	sp,sp,-16
  8000f4:	e022                	sd	s0,0(sp)
  8000f6:	e406                	sd	ra,8(sp)
  8000f8:	842e                	mv	s0,a1
  8000fa:	fbbff0ef          	jal	ra,8000b4 <sys_putc>
  8000fe:	401c                	lw	a5,0(s0)
  800100:	60a2                	ld	ra,8(sp)
  800102:	2785                	addiw	a5,a5,1
  800104:	c01c                	sw	a5,0(s0)
  800106:	6402                	ld	s0,0(sp)
  800108:	0141                	addi	sp,sp,16
  80010a:	8082                	ret

000000000080010c <vcprintf>:
  80010c:	1101                	addi	sp,sp,-32
  80010e:	86ae                	mv	a3,a1
  800110:	862a                	mv	a2,a0
  800112:	006c                	addi	a1,sp,12
  800114:	00000517          	auipc	a0,0x0
  800118:	fde50513          	addi	a0,a0,-34 # 8000f2 <cputch>
  80011c:	ec06                	sd	ra,24(sp)
  80011e:	c602                	sw	zero,12(sp)
  800120:	0f0000ef          	jal	ra,800210 <vprintfmt>
  800124:	60e2                	ld	ra,24(sp)
  800126:	4532                	lw	a0,12(sp)
  800128:	6105                	addi	sp,sp,32
  80012a:	8082                	ret

000000000080012c <cprintf>:
  80012c:	711d                	addi	sp,sp,-96
  80012e:	02810313          	addi	t1,sp,40
  800132:	f42e                	sd	a1,40(sp)
  800134:	f832                	sd	a2,48(sp)
  800136:	fc36                	sd	a3,56(sp)
  800138:	862a                	mv	a2,a0
  80013a:	004c                	addi	a1,sp,4
  80013c:	00000517          	auipc	a0,0x0
  800140:	fb650513          	addi	a0,a0,-74 # 8000f2 <cputch>
  800144:	869a                	mv	a3,t1
  800146:	ec06                	sd	ra,24(sp)
  800148:	e0ba                	sd	a4,64(sp)
  80014a:	e4be                	sd	a5,72(sp)
  80014c:	e8c2                	sd	a6,80(sp)
  80014e:	ecc6                	sd	a7,88(sp)
  800150:	e41a                	sd	t1,8(sp)
  800152:	c202                	sw	zero,4(sp)
  800154:	0bc000ef          	jal	ra,800210 <vprintfmt>
  800158:	60e2                	ld	ra,24(sp)
  80015a:	4512                	lw	a0,4(sp)
  80015c:	6125                	addi	sp,sp,96
  80015e:	8082                	ret

0000000000800160 <umain>:
  800160:	1141                	addi	sp,sp,-16
  800162:	e406                	sd	ra,8(sp)
  800164:	42c000ef          	jal	ra,800590 <main>
  800168:	f5fff0ef          	jal	ra,8000c6 <exit>

000000000080016c <strnlen>:
  80016c:	c185                	beqz	a1,80018c <strnlen+0x20>
  80016e:	00054783          	lbu	a5,0(a0)
  800172:	cf89                	beqz	a5,80018c <strnlen+0x20>
  800174:	4781                	li	a5,0
  800176:	a021                	j	80017e <strnlen+0x12>
  800178:	00074703          	lbu	a4,0(a4)
  80017c:	c711                	beqz	a4,800188 <strnlen+0x1c>
  80017e:	0785                	addi	a5,a5,1
  800180:	00f50733          	add	a4,a0,a5
  800184:	fef59ae3          	bne	a1,a5,800178 <strnlen+0xc>
  800188:	853e                	mv	a0,a5
  80018a:	8082                	ret
  80018c:	4781                	li	a5,0
  80018e:	853e                	mv	a0,a5
  800190:	8082                	ret

0000000000800192 <memset>:
  800192:	ca01                	beqz	a2,8001a2 <memset+0x10>
  800194:	962a                	add	a2,a2,a0
  800196:	87aa                	mv	a5,a0
  800198:	0785                	addi	a5,a5,1
  80019a:	feb78fa3          	sb	a1,-1(a5)
  80019e:	fec79de3          	bne	a5,a2,800198 <memset+0x6>
  8001a2:	8082                	ret

00000000008001a4 <printnum>:
  8001a4:	02069813          	slli	a6,a3,0x20
  8001a8:	7179                	addi	sp,sp,-48
  8001aa:	02085813          	srli	a6,a6,0x20
  8001ae:	e052                	sd	s4,0(sp)
  8001b0:	03067a33          	remu	s4,a2,a6
  8001b4:	f022                	sd	s0,32(sp)
  8001b6:	ec26                	sd	s1,24(sp)
  8001b8:	e84a                	sd	s2,16(sp)
  8001ba:	f406                	sd	ra,40(sp)
  8001bc:	e44e                	sd	s3,8(sp)
  8001be:	84aa                	mv	s1,a0
  8001c0:	892e                	mv	s2,a1
  8001c2:	fff7041b          	addiw	s0,a4,-1
  8001c6:	2a01                	sext.w	s4,s4
  8001c8:	03067e63          	bgeu	a2,a6,800204 <printnum+0x60>
  8001cc:	89be                	mv	s3,a5
  8001ce:	00805763          	blez	s0,8001dc <printnum+0x38>
  8001d2:	347d                	addiw	s0,s0,-1
  8001d4:	85ca                	mv	a1,s2
  8001d6:	854e                	mv	a0,s3
  8001d8:	9482                	jalr	s1
  8001da:	fc65                	bnez	s0,8001d2 <printnum+0x2e>
  8001dc:	1a02                	slli	s4,s4,0x20
  8001de:	020a5a13          	srli	s4,s4,0x20
  8001e2:	00000797          	auipc	a5,0x0
  8001e6:	7ce78793          	addi	a5,a5,1998 # 8009b0 <error_string+0xc8>
  8001ea:	9a3e                	add	s4,s4,a5
  8001ec:	7402                	ld	s0,32(sp)
  8001ee:	000a4503          	lbu	a0,0(s4)
  8001f2:	70a2                	ld	ra,40(sp)
  8001f4:	69a2                	ld	s3,8(sp)
  8001f6:	6a02                	ld	s4,0(sp)
  8001f8:	85ca                	mv	a1,s2
  8001fa:	8326                	mv	t1,s1
  8001fc:	6942                	ld	s2,16(sp)
  8001fe:	64e2                	ld	s1,24(sp)
  800200:	6145                	addi	sp,sp,48
  800202:	8302                	jr	t1
  800204:	03065633          	divu	a2,a2,a6
  800208:	8722                	mv	a4,s0
  80020a:	f9bff0ef          	jal	ra,8001a4 <printnum>
  80020e:	b7f9                	j	8001dc <printnum+0x38>

0000000000800210 <vprintfmt>:
  800210:	7119                	addi	sp,sp,-128
  800212:	f4a6                	sd	s1,104(sp)
  800214:	f0ca                	sd	s2,96(sp)
  800216:	e8d2                	sd	s4,80(sp)
  800218:	e4d6                	sd	s5,72(sp)
  80021a:	e0da                	sd	s6,64(sp)
  80021c:	fc5e                	sd	s7,56(sp)
  80021e:	f862                	sd	s8,48(sp)
  800220:	f06a                	sd	s10,32(sp)
  800222:	fc86                	sd	ra,120(sp)
  800224:	f8a2                	sd	s0,112(sp)
  800226:	ecce                	sd	s3,88(sp)
  800228:	f466                	sd	s9,40(sp)
  80022a:	ec6e                	sd	s11,24(sp)
  80022c:	892a                	mv	s2,a0
  80022e:	84ae                	mv	s1,a1
  800230:	8d32                	mv	s10,a2
  800232:	8ab6                	mv	s5,a3
  800234:	5b7d                	li	s6,-1
  800236:	00000a17          	auipc	s4,0x0
  80023a:	556a0a13          	addi	s4,s4,1366 # 80078c <main+0x1fc>
  80023e:	05e00b93          	li	s7,94
  800242:	00000c17          	auipc	s8,0x0
  800246:	6a6c0c13          	addi	s8,s8,1702 # 8008e8 <error_string>
  80024a:	000d4503          	lbu	a0,0(s10)
  80024e:	02500793          	li	a5,37
  800252:	001d0413          	addi	s0,s10,1
  800256:	00f50e63          	beq	a0,a5,800272 <vprintfmt+0x62>
  80025a:	c521                	beqz	a0,8002a2 <vprintfmt+0x92>
  80025c:	02500993          	li	s3,37
  800260:	a011                	j	800264 <vprintfmt+0x54>
  800262:	c121                	beqz	a0,8002a2 <vprintfmt+0x92>
  800264:	85a6                	mv	a1,s1
  800266:	0405                	addi	s0,s0,1
  800268:	9902                	jalr	s2
  80026a:	fff44503          	lbu	a0,-1(s0)
  80026e:	ff351ae3          	bne	a0,s3,800262 <vprintfmt+0x52>
  800272:	00044603          	lbu	a2,0(s0)
  800276:	02000793          	li	a5,32
  80027a:	4981                	li	s3,0
  80027c:	4801                	li	a6,0
  80027e:	5cfd                	li	s9,-1
  800280:	5dfd                	li	s11,-1
  800282:	05500593          	li	a1,85
  800286:	4525                	li	a0,9
  800288:	fdd6069b          	addiw	a3,a2,-35
  80028c:	0ff6f693          	andi	a3,a3,255
  800290:	00140d13          	addi	s10,s0,1
  800294:	1ed5ef63          	bltu	a1,a3,800492 <vprintfmt+0x282>
  800298:	068a                	slli	a3,a3,0x2
  80029a:	96d2                	add	a3,a3,s4
  80029c:	4294                	lw	a3,0(a3)
  80029e:	96d2                	add	a3,a3,s4
  8002a0:	8682                	jr	a3
  8002a2:	70e6                	ld	ra,120(sp)
  8002a4:	7446                	ld	s0,112(sp)
  8002a6:	74a6                	ld	s1,104(sp)
  8002a8:	7906                	ld	s2,96(sp)
  8002aa:	69e6                	ld	s3,88(sp)
  8002ac:	6a46                	ld	s4,80(sp)
  8002ae:	6aa6                	ld	s5,72(sp)
  8002b0:	6b06                	ld	s6,64(sp)
  8002b2:	7be2                	ld	s7,56(sp)
  8002b4:	7c42                	ld	s8,48(sp)
  8002b6:	7ca2                	ld	s9,40(sp)
  8002b8:	7d02                	ld	s10,32(sp)
  8002ba:	6de2                	ld	s11,24(sp)
  8002bc:	6109                	addi	sp,sp,128
  8002be:	8082                	ret
  8002c0:	87b2                	mv	a5,a2
  8002c2:	00144603          	lbu	a2,1(s0)
  8002c6:	846a                	mv	s0,s10
  8002c8:	b7c1                	j	800288 <vprintfmt+0x78>
  8002ca:	000aac83          	lw	s9,0(s5)
  8002ce:	00144603          	lbu	a2,1(s0)
  8002d2:	0aa1                	addi	s5,s5,8
  8002d4:	846a                	mv	s0,s10
  8002d6:	fa0dd9e3          	bgez	s11,800288 <vprintfmt+0x78>
  8002da:	8de6                	mv	s11,s9
  8002dc:	5cfd                	li	s9,-1
  8002de:	b76d                	j	800288 <vprintfmt+0x78>
  8002e0:	fffdc693          	not	a3,s11
  8002e4:	96fd                	srai	a3,a3,0x3f
  8002e6:	00ddfdb3          	and	s11,s11,a3
  8002ea:	00144603          	lbu	a2,1(s0)
  8002ee:	2d81                	sext.w	s11,s11
  8002f0:	846a                	mv	s0,s10
  8002f2:	bf59                	j	800288 <vprintfmt+0x78>
  8002f4:	4705                	li	a4,1
  8002f6:	008a8593          	addi	a1,s5,8
  8002fa:	01074463          	blt	a4,a6,800302 <vprintfmt+0xf2>
  8002fe:	22080863          	beqz	a6,80052e <vprintfmt+0x31e>
  800302:	000ab603          	ld	a2,0(s5)
  800306:	46c1                	li	a3,16
  800308:	8aae                	mv	s5,a1
  80030a:	a291                	j	80044e <vprintfmt+0x23e>
  80030c:	fd060c9b          	addiw	s9,a2,-48
  800310:	00144603          	lbu	a2,1(s0)
  800314:	846a                	mv	s0,s10
  800316:	fd06069b          	addiw	a3,a2,-48
  80031a:	0006089b          	sext.w	a7,a2
  80031e:	fad56ce3          	bltu	a0,a3,8002d6 <vprintfmt+0xc6>
  800322:	0405                	addi	s0,s0,1
  800324:	002c969b          	slliw	a3,s9,0x2
  800328:	00044603          	lbu	a2,0(s0)
  80032c:	0196873b          	addw	a4,a3,s9
  800330:	0017171b          	slliw	a4,a4,0x1
  800334:	0117073b          	addw	a4,a4,a7
  800338:	fd06069b          	addiw	a3,a2,-48
  80033c:	fd070c9b          	addiw	s9,a4,-48
  800340:	0006089b          	sext.w	a7,a2
  800344:	fcd57fe3          	bgeu	a0,a3,800322 <vprintfmt+0x112>
  800348:	b779                	j	8002d6 <vprintfmt+0xc6>
  80034a:	000aa503          	lw	a0,0(s5)
  80034e:	85a6                	mv	a1,s1
  800350:	0aa1                	addi	s5,s5,8
  800352:	9902                	jalr	s2
  800354:	bddd                	j	80024a <vprintfmt+0x3a>
  800356:	4705                	li	a4,1
  800358:	008a8993          	addi	s3,s5,8
  80035c:	01074463          	blt	a4,a6,800364 <vprintfmt+0x154>
  800360:	1c080463          	beqz	a6,800528 <vprintfmt+0x318>
  800364:	000ab403          	ld	s0,0(s5)
  800368:	1c044a63          	bltz	s0,80053c <vprintfmt+0x32c>
  80036c:	8622                	mv	a2,s0
  80036e:	8ace                	mv	s5,s3
  800370:	46a9                	li	a3,10
  800372:	a8f1                	j	80044e <vprintfmt+0x23e>
  800374:	000aa783          	lw	a5,0(s5)
  800378:	4761                	li	a4,24
  80037a:	0aa1                	addi	s5,s5,8
  80037c:	41f7d69b          	sraiw	a3,a5,0x1f
  800380:	8fb5                	xor	a5,a5,a3
  800382:	40d786bb          	subw	a3,a5,a3
  800386:	12d74963          	blt	a4,a3,8004b8 <vprintfmt+0x2a8>
  80038a:	00369793          	slli	a5,a3,0x3
  80038e:	97e2                	add	a5,a5,s8
  800390:	639c                	ld	a5,0(a5)
  800392:	12078363          	beqz	a5,8004b8 <vprintfmt+0x2a8>
  800396:	86be                	mv	a3,a5
  800398:	00000617          	auipc	a2,0x0
  80039c:	70860613          	addi	a2,a2,1800 # 800aa0 <error_string+0x1b8>
  8003a0:	85a6                	mv	a1,s1
  8003a2:	854a                	mv	a0,s2
  8003a4:	1cc000ef          	jal	ra,800570 <printfmt>
  8003a8:	b54d                	j	80024a <vprintfmt+0x3a>
  8003aa:	000ab603          	ld	a2,0(s5)
  8003ae:	0aa1                	addi	s5,s5,8
  8003b0:	1a060163          	beqz	a2,800552 <vprintfmt+0x342>
  8003b4:	00160413          	addi	s0,a2,1
  8003b8:	15b05763          	blez	s11,800506 <vprintfmt+0x2f6>
  8003bc:	02d00593          	li	a1,45
  8003c0:	10b79d63          	bne	a5,a1,8004da <vprintfmt+0x2ca>
  8003c4:	00064783          	lbu	a5,0(a2)
  8003c8:	0007851b          	sext.w	a0,a5
  8003cc:	c905                	beqz	a0,8003fc <vprintfmt+0x1ec>
  8003ce:	000cc563          	bltz	s9,8003d8 <vprintfmt+0x1c8>
  8003d2:	3cfd                	addiw	s9,s9,-1
  8003d4:	036c8263          	beq	s9,s6,8003f8 <vprintfmt+0x1e8>
  8003d8:	85a6                	mv	a1,s1
  8003da:	14098f63          	beqz	s3,800538 <vprintfmt+0x328>
  8003de:	3781                	addiw	a5,a5,-32
  8003e0:	14fbfc63          	bgeu	s7,a5,800538 <vprintfmt+0x328>
  8003e4:	03f00513          	li	a0,63
  8003e8:	9902                	jalr	s2
  8003ea:	0405                	addi	s0,s0,1
  8003ec:	fff44783          	lbu	a5,-1(s0)
  8003f0:	3dfd                	addiw	s11,s11,-1
  8003f2:	0007851b          	sext.w	a0,a5
  8003f6:	fd61                	bnez	a0,8003ce <vprintfmt+0x1be>
  8003f8:	e5b059e3          	blez	s11,80024a <vprintfmt+0x3a>
  8003fc:	3dfd                	addiw	s11,s11,-1
  8003fe:	85a6                	mv	a1,s1
  800400:	02000513          	li	a0,32
  800404:	9902                	jalr	s2
  800406:	e40d82e3          	beqz	s11,80024a <vprintfmt+0x3a>
  80040a:	3dfd                	addiw	s11,s11,-1
  80040c:	85a6                	mv	a1,s1
  80040e:	02000513          	li	a0,32
  800412:	9902                	jalr	s2
  800414:	fe0d94e3          	bnez	s11,8003fc <vprintfmt+0x1ec>
  800418:	bd0d                	j	80024a <vprintfmt+0x3a>
  80041a:	4705                	li	a4,1
  80041c:	008a8593          	addi	a1,s5,8
  800420:	01074463          	blt	a4,a6,800428 <vprintfmt+0x218>
  800424:	0e080863          	beqz	a6,800514 <vprintfmt+0x304>
  800428:	000ab603          	ld	a2,0(s5)
  80042c:	46a1                	li	a3,8
  80042e:	8aae                	mv	s5,a1
  800430:	a839                	j	80044e <vprintfmt+0x23e>
  800432:	03000513          	li	a0,48
  800436:	85a6                	mv	a1,s1
  800438:	e03e                	sd	a5,0(sp)
  80043a:	9902                	jalr	s2
  80043c:	85a6                	mv	a1,s1
  80043e:	07800513          	li	a0,120
  800442:	9902                	jalr	s2
  800444:	0aa1                	addi	s5,s5,8
  800446:	ff8ab603          	ld	a2,-8(s5)
  80044a:	6782                	ld	a5,0(sp)
  80044c:	46c1                	li	a3,16
  80044e:	2781                	sext.w	a5,a5
  800450:	876e                	mv	a4,s11
  800452:	85a6                	mv	a1,s1
  800454:	854a                	mv	a0,s2
  800456:	d4fff0ef          	jal	ra,8001a4 <printnum>
  80045a:	bbc5                	j	80024a <vprintfmt+0x3a>
  80045c:	00144603          	lbu	a2,1(s0)
  800460:	2805                	addiw	a6,a6,1
  800462:	846a                	mv	s0,s10
  800464:	b515                	j	800288 <vprintfmt+0x78>
  800466:	00144603          	lbu	a2,1(s0)
  80046a:	4985                	li	s3,1
  80046c:	846a                	mv	s0,s10
  80046e:	bd29                	j	800288 <vprintfmt+0x78>
  800470:	85a6                	mv	a1,s1
  800472:	02500513          	li	a0,37
  800476:	9902                	jalr	s2
  800478:	bbc9                	j	80024a <vprintfmt+0x3a>
  80047a:	4705                	li	a4,1
  80047c:	008a8593          	addi	a1,s5,8
  800480:	01074463          	blt	a4,a6,800488 <vprintfmt+0x278>
  800484:	08080d63          	beqz	a6,80051e <vprintfmt+0x30e>
  800488:	000ab603          	ld	a2,0(s5)
  80048c:	46a9                	li	a3,10
  80048e:	8aae                	mv	s5,a1
  800490:	bf7d                	j	80044e <vprintfmt+0x23e>
  800492:	85a6                	mv	a1,s1
  800494:	02500513          	li	a0,37
  800498:	9902                	jalr	s2
  80049a:	fff44703          	lbu	a4,-1(s0)
  80049e:	02500793          	li	a5,37
  8004a2:	8d22                	mv	s10,s0
  8004a4:	daf703e3          	beq	a4,a5,80024a <vprintfmt+0x3a>
  8004a8:	02500713          	li	a4,37
  8004ac:	1d7d                	addi	s10,s10,-1
  8004ae:	fffd4783          	lbu	a5,-1(s10)
  8004b2:	fee79de3          	bne	a5,a4,8004ac <vprintfmt+0x29c>
  8004b6:	bb51                	j	80024a <vprintfmt+0x3a>
  8004b8:	00000617          	auipc	a2,0x0
  8004bc:	5d860613          	addi	a2,a2,1496 # 800a90 <error_string+0x1a8>
  8004c0:	85a6                	mv	a1,s1
  8004c2:	854a                	mv	a0,s2
  8004c4:	0ac000ef          	jal	ra,800570 <printfmt>
  8004c8:	b349                	j	80024a <vprintfmt+0x3a>
  8004ca:	00000617          	auipc	a2,0x0
  8004ce:	5be60613          	addi	a2,a2,1470 # 800a88 <error_string+0x1a0>
  8004d2:	00000417          	auipc	s0,0x0
  8004d6:	5b740413          	addi	s0,s0,1463 # 800a89 <error_string+0x1a1>
  8004da:	8532                	mv	a0,a2
  8004dc:	85e6                	mv	a1,s9
  8004de:	e032                	sd	a2,0(sp)
  8004e0:	e43e                	sd	a5,8(sp)
  8004e2:	c8bff0ef          	jal	ra,80016c <strnlen>
  8004e6:	40ad8dbb          	subw	s11,s11,a0
  8004ea:	6602                	ld	a2,0(sp)
  8004ec:	01b05d63          	blez	s11,800506 <vprintfmt+0x2f6>
  8004f0:	67a2                	ld	a5,8(sp)
  8004f2:	2781                	sext.w	a5,a5
  8004f4:	e43e                	sd	a5,8(sp)
  8004f6:	6522                	ld	a0,8(sp)
  8004f8:	85a6                	mv	a1,s1
  8004fa:	e032                	sd	a2,0(sp)
  8004fc:	3dfd                	addiw	s11,s11,-1
  8004fe:	9902                	jalr	s2
  800500:	6602                	ld	a2,0(sp)
  800502:	fe0d9ae3          	bnez	s11,8004f6 <vprintfmt+0x2e6>
  800506:	00064783          	lbu	a5,0(a2)
  80050a:	0007851b          	sext.w	a0,a5
  80050e:	ec0510e3          	bnez	a0,8003ce <vprintfmt+0x1be>
  800512:	bb25                	j	80024a <vprintfmt+0x3a>
  800514:	000ae603          	lwu	a2,0(s5)
  800518:	46a1                	li	a3,8
  80051a:	8aae                	mv	s5,a1
  80051c:	bf0d                	j	80044e <vprintfmt+0x23e>
  80051e:	000ae603          	lwu	a2,0(s5)
  800522:	46a9                	li	a3,10
  800524:	8aae                	mv	s5,a1
  800526:	b725                	j	80044e <vprintfmt+0x23e>
  800528:	000aa403          	lw	s0,0(s5)
  80052c:	bd35                	j	800368 <vprintfmt+0x158>
  80052e:	000ae603          	lwu	a2,0(s5)
  800532:	46c1                	li	a3,16
  800534:	8aae                	mv	s5,a1
  800536:	bf21                	j	80044e <vprintfmt+0x23e>
  800538:	9902                	jalr	s2
  80053a:	bd45                	j	8003ea <vprintfmt+0x1da>
  80053c:	85a6                	mv	a1,s1
  80053e:	02d00513          	li	a0,45
  800542:	e03e                	sd	a5,0(sp)
  800544:	9902                	jalr	s2
  800546:	8ace                	mv	s5,s3
  800548:	40800633          	neg	a2,s0
  80054c:	46a9                	li	a3,10
  80054e:	6782                	ld	a5,0(sp)
  800550:	bdfd                	j	80044e <vprintfmt+0x23e>
  800552:	01b05663          	blez	s11,80055e <vprintfmt+0x34e>
  800556:	02d00693          	li	a3,45
  80055a:	f6d798e3          	bne	a5,a3,8004ca <vprintfmt+0x2ba>
  80055e:	00000417          	auipc	s0,0x0
  800562:	52b40413          	addi	s0,s0,1323 # 800a89 <error_string+0x1a1>
  800566:	02800513          	li	a0,40
  80056a:	02800793          	li	a5,40
  80056e:	b585                	j	8003ce <vprintfmt+0x1be>

0000000000800570 <printfmt>:
  800570:	715d                	addi	sp,sp,-80
  800572:	02810313          	addi	t1,sp,40
  800576:	f436                	sd	a3,40(sp)
  800578:	869a                	mv	a3,t1
  80057a:	ec06                	sd	ra,24(sp)
  80057c:	f83a                	sd	a4,48(sp)
  80057e:	fc3e                	sd	a5,56(sp)
  800580:	e0c2                	sd	a6,64(sp)
  800582:	e4c6                	sd	a7,72(sp)
  800584:	e41a                	sd	t1,8(sp)
  800586:	c8bff0ef          	jal	ra,800210 <vprintfmt>
  80058a:	60e2                	ld	ra,24(sp)
  80058c:	6161                	addi	sp,sp,80
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
  8005b0:	be3ff0ef          	jal	ra,800192 <memset>
  8005b4:	4519                	li	a0,6
  8005b6:	00001a97          	auipc	s5,0x1
  8005ba:	a4aa8a93          	addi	s5,s5,-1462 # 801000 <acc>
  8005be:	00001917          	auipc	s2,0x1
  8005c2:	a7290913          	addi	s2,s2,-1422 # 801030 <pids>
  8005c6:	b21ff0ef          	jal	ra,8000e6 <lab6_setpriority>
  8005ca:	89d6                	mv	s3,s5
  8005cc:	84ca                	mv	s1,s2
  8005ce:	4401                	li	s0,0
  8005d0:	4a15                	li	s4,5
  8005d2:	0009a023          	sw	zero,0(s3)
  8005d6:	b07ff0ef          	jal	ra,8000dc <fork>
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
  8005fc:	b31ff0ef          	jal	ra,80012c <cprintf>
  800600:	00001997          	auipc	s3,0x1
  800604:	a2c98993          	addi	s3,s3,-1492 # 80102c <status+0x14>
  800608:	8a26                	mv	s4,s1
  80060a:	8426                	mv	s0,s1
  80060c:	00000b97          	auipc	s7,0x0
  800610:	4e4b8b93          	addi	s7,s7,1252 # 800af0 <error_string+0x208>
  800614:	00092503          	lw	a0,0(s2)
  800618:	85a2                	mv	a1,s0
  80061a:	00042023          	sw	zero,0(s0)
  80061e:	ac1ff0ef          	jal	ra,8000de <waitpid>
  800622:	00092a83          	lw	s5,0(s2)
  800626:	00042b03          	lw	s6,0(s0)
  80062a:	abbff0ef          	jal	ra,8000e4 <gettime_msec>
  80062e:	0005069b          	sext.w	a3,a0
  800632:	865a                	mv	a2,s6
  800634:	85d6                	mv	a1,s5
  800636:	855e                	mv	a0,s7
  800638:	0411                	addi	s0,s0,4
  80063a:	af3ff0ef          	jal	ra,80012c <cprintf>
  80063e:	0911                	addi	s2,s2,4
  800640:	fd341ae3          	bne	s0,s3,800614 <main+0x84>
  800644:	00000517          	auipc	a0,0x0
  800648:	4cc50513          	addi	a0,a0,1228 # 800b10 <error_string+0x228>
  80064c:	ae1ff0ef          	jal	ra,80012c <cprintf>
  800650:	00000517          	auipc	a0,0x0
  800654:	4d850513          	addi	a0,a0,1240 # 800b28 <error_string+0x240>
  800658:	ad5ff0ef          	jal	ra,80012c <cprintf>
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
  800682:	aabff0ef          	jal	ra,80012c <cprintf>
  800686:	fd349fe3          	bne	s1,s3,800664 <main+0xd4>
  80068a:	00000517          	auipc	a0,0x0
  80068e:	0e650513          	addi	a0,a0,230 # 800770 <main+0x1e0>
  800692:	a9bff0ef          	jal	ra,80012c <cprintf>
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
  8006ba:	a2dff0ef          	jal	ra,8000e6 <lab6_setpriority>
  8006be:	fa04849b          	addiw	s1,s1,-96
  8006c2:	00042023          	sw	zero,0(s0)
  8006c6:	71090913          	addi	s2,s2,1808 # 2710 <__panic-0x7fd910>
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
  8006f0:	9f5ff0ef          	jal	ra,8000e4 <gettime_msec>
  8006f4:	0005099b          	sext.w	s3,a0
  8006f8:	fd3959e3          	bge	s2,s3,8006ca <main+0x13a>
  8006fc:	9e7ff0ef          	jal	ra,8000e2 <getpid>
  800700:	4010                	lw	a2,0(s0)
  800702:	85aa                	mv	a1,a0
  800704:	86ce                	mv	a3,s3
  800706:	00000517          	auipc	a0,0x0
  80070a:	3a250513          	addi	a0,a0,930 # 800aa8 <error_string+0x1c0>
  80070e:	a1fff0ef          	jal	ra,80012c <cprintf>
  800712:	4008                	lw	a0,0(s0)
  800714:	9b3ff0ef          	jal	ra,8000c6 <exit>
  800718:	00001417          	auipc	s0,0x1
  80071c:	92c40413          	addi	s0,s0,-1748 # 801044 <pids+0x14>
  800720:	00092503          	lw	a0,0(s2)
  800724:	00a05463          	blez	a0,80072c <main+0x19c>
  800728:	9b9ff0ef          	jal	ra,8000e0 <kill>
  80072c:	0911                	addi	s2,s2,4
  80072e:	ff2419e3          	bne	s0,s2,800720 <main+0x190>
  800732:	00000617          	auipc	a2,0x0
  800736:	41e60613          	addi	a2,a2,1054 # 800b50 <error_string+0x268>
  80073a:	04b00593          	li	a1,75
  80073e:	00000517          	auipc	a0,0x0
  800742:	42250513          	addi	a0,a0,1058 # 800b60 <error_string+0x278>
  800746:	8dbff0ef          	jal	ra,800020 <__panic>
