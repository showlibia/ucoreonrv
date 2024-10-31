
obj/__user_forktree.out：     文件格式 elf64-littleriscv


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

000000000080005e <sys_fork>:
  80005e:	4509                	li	a0,2
  800060:	b7c1                	j	800020 <syscall>

0000000000800062 <sys_yield>:
  800062:	4529                	li	a0,10
  800064:	bf75                	j	800020 <syscall>

0000000000800066 <sys_getpid>:
  800066:	4549                	li	a0,18
  800068:	bf65                	j	800020 <syscall>

000000000080006a <sys_putc>:
  80006a:	85aa                	mv	a1,a0
  80006c:	4579                	li	a0,30
  80006e:	bf4d                	j	800020 <syscall>

0000000000800070 <exit>:
  800070:	1141                	addi	sp,sp,-16
  800072:	e406                	sd	ra,8(sp)
  800074:	fe5ff0ef          	jal	ra,800058 <sys_exit>
  800078:	00000517          	auipc	a0,0x0
  80007c:	5a850513          	addi	a0,a0,1448 # 800620 <main+0x18>
  800080:	02c000ef          	jal	ra,8000ac <cprintf>
  800084:	a001                	j	800084 <exit+0x14>

0000000000800086 <fork>:
  800086:	bfe1                	j	80005e <sys_fork>

0000000000800088 <yield>:
  800088:	bfe9                	j	800062 <sys_yield>

000000000080008a <getpid>:
  80008a:	bff1                	j	800066 <sys_getpid>

000000000080008c <_start>:
  80008c:	054000ef          	jal	ra,8000e0 <umain>
  800090:	a001                	j	800090 <_start+0x4>

0000000000800092 <cputch>:
  800092:	1141                	addi	sp,sp,-16
  800094:	e022                	sd	s0,0(sp)
  800096:	e406                	sd	ra,8(sp)
  800098:	842e                	mv	s0,a1
  80009a:	fd1ff0ef          	jal	ra,80006a <sys_putc>
  80009e:	401c                	lw	a5,0(s0)
  8000a0:	60a2                	ld	ra,8(sp)
  8000a2:	2785                	addiw	a5,a5,1
  8000a4:	c01c                	sw	a5,0(s0)
  8000a6:	6402                	ld	s0,0(sp)
  8000a8:	0141                	addi	sp,sp,16
  8000aa:	8082                	ret

00000000008000ac <cprintf>:
  8000ac:	711d                	addi	sp,sp,-96
  8000ae:	02810313          	addi	t1,sp,40
  8000b2:	f42e                	sd	a1,40(sp)
  8000b4:	f832                	sd	a2,48(sp)
  8000b6:	fc36                	sd	a3,56(sp)
  8000b8:	862a                	mv	a2,a0
  8000ba:	004c                	addi	a1,sp,4
  8000bc:	00000517          	auipc	a0,0x0
  8000c0:	fd650513          	addi	a0,a0,-42 # 800092 <cputch>
  8000c4:	869a                	mv	a3,t1
  8000c6:	ec06                	sd	ra,24(sp)
  8000c8:	e0ba                	sd	a4,64(sp)
  8000ca:	e4be                	sd	a5,72(sp)
  8000cc:	e8c2                	sd	a6,80(sp)
  8000ce:	ecc6                	sd	a7,88(sp)
  8000d0:	e41a                	sd	t1,8(sp)
  8000d2:	c202                	sw	zero,4(sp)
  8000d4:	0e2000ef          	jal	ra,8001b6 <vprintfmt>
  8000d8:	60e2                	ld	ra,24(sp)
  8000da:	4512                	lw	a0,4(sp)
  8000dc:	6125                	addi	sp,sp,96
  8000de:	8082                	ret

00000000008000e0 <umain>:
  8000e0:	1141                	addi	sp,sp,-16
  8000e2:	e406                	sd	ra,8(sp)
  8000e4:	524000ef          	jal	ra,800608 <main>
  8000e8:	f89ff0ef          	jal	ra,800070 <exit>

00000000008000ec <strlen>:
  8000ec:	00054783          	lbu	a5,0(a0)
  8000f0:	cb91                	beqz	a5,800104 <strlen+0x18>
  8000f2:	4781                	li	a5,0
  8000f4:	0785                	addi	a5,a5,1
  8000f6:	00f50733          	add	a4,a0,a5
  8000fa:	00074703          	lbu	a4,0(a4)
  8000fe:	fb7d                	bnez	a4,8000f4 <strlen+0x8>
  800100:	853e                	mv	a0,a5
  800102:	8082                	ret
  800104:	4781                	li	a5,0
  800106:	853e                	mv	a0,a5
  800108:	8082                	ret

000000000080010a <strnlen>:
  80010a:	c185                	beqz	a1,80012a <strnlen+0x20>
  80010c:	00054783          	lbu	a5,0(a0)
  800110:	cf89                	beqz	a5,80012a <strnlen+0x20>
  800112:	4781                	li	a5,0
  800114:	a021                	j	80011c <strnlen+0x12>
  800116:	00074703          	lbu	a4,0(a4)
  80011a:	c711                	beqz	a4,800126 <strnlen+0x1c>
  80011c:	0785                	addi	a5,a5,1
  80011e:	00f50733          	add	a4,a0,a5
  800122:	fef59ae3          	bne	a1,a5,800116 <strnlen+0xc>
  800126:	853e                	mv	a0,a5
  800128:	8082                	ret
  80012a:	4781                	li	a5,0
  80012c:	853e                	mv	a0,a5
  80012e:	8082                	ret

0000000000800130 <printnum>:
  800130:	02069813          	slli	a6,a3,0x20
  800134:	7179                	addi	sp,sp,-48
  800136:	02085813          	srli	a6,a6,0x20
  80013a:	e052                	sd	s4,0(sp)
  80013c:	03067a33          	remu	s4,a2,a6
  800140:	f022                	sd	s0,32(sp)
  800142:	ec26                	sd	s1,24(sp)
  800144:	e84a                	sd	s2,16(sp)
  800146:	f406                	sd	ra,40(sp)
  800148:	e44e                	sd	s3,8(sp)
  80014a:	84aa                	mv	s1,a0
  80014c:	892e                	mv	s2,a1
  80014e:	fff7041b          	addiw	s0,a4,-1
  800152:	2a01                	sext.w	s4,s4
  800154:	03067e63          	bgeu	a2,a6,800190 <printnum+0x60>
  800158:	89be                	mv	s3,a5
  80015a:	00805763          	blez	s0,800168 <printnum+0x38>
  80015e:	347d                	addiw	s0,s0,-1
  800160:	85ca                	mv	a1,s2
  800162:	854e                	mv	a0,s3
  800164:	9482                	jalr	s1
  800166:	fc65                	bnez	s0,80015e <printnum+0x2e>
  800168:	1a02                	slli	s4,s4,0x20
  80016a:	020a5a13          	srli	s4,s4,0x20
  80016e:	00000797          	auipc	a5,0x0
  800172:	6ea78793          	addi	a5,a5,1770 # 800858 <error_string+0xc8>
  800176:	9a3e                	add	s4,s4,a5
  800178:	7402                	ld	s0,32(sp)
  80017a:	000a4503          	lbu	a0,0(s4)
  80017e:	70a2                	ld	ra,40(sp)
  800180:	69a2                	ld	s3,8(sp)
  800182:	6a02                	ld	s4,0(sp)
  800184:	85ca                	mv	a1,s2
  800186:	8326                	mv	t1,s1
  800188:	6942                	ld	s2,16(sp)
  80018a:	64e2                	ld	s1,24(sp)
  80018c:	6145                	addi	sp,sp,48
  80018e:	8302                	jr	t1
  800190:	03065633          	divu	a2,a2,a6
  800194:	8722                	mv	a4,s0
  800196:	f9bff0ef          	jal	ra,800130 <printnum>
  80019a:	b7f9                	j	800168 <printnum+0x38>

000000000080019c <sprintputch>:
  80019c:	499c                	lw	a5,16(a1)
  80019e:	6198                	ld	a4,0(a1)
  8001a0:	6594                	ld	a3,8(a1)
  8001a2:	2785                	addiw	a5,a5,1
  8001a4:	c99c                	sw	a5,16(a1)
  8001a6:	00d77763          	bgeu	a4,a3,8001b4 <sprintputch+0x18>
  8001aa:	00170793          	addi	a5,a4,1
  8001ae:	e19c                	sd	a5,0(a1)
  8001b0:	00a70023          	sb	a0,0(a4)
  8001b4:	8082                	ret

00000000008001b6 <vprintfmt>:
  8001b6:	7119                	addi	sp,sp,-128
  8001b8:	f4a6                	sd	s1,104(sp)
  8001ba:	f0ca                	sd	s2,96(sp)
  8001bc:	e8d2                	sd	s4,80(sp)
  8001be:	e4d6                	sd	s5,72(sp)
  8001c0:	e0da                	sd	s6,64(sp)
  8001c2:	fc5e                	sd	s7,56(sp)
  8001c4:	f862                	sd	s8,48(sp)
  8001c6:	f06a                	sd	s10,32(sp)
  8001c8:	fc86                	sd	ra,120(sp)
  8001ca:	f8a2                	sd	s0,112(sp)
  8001cc:	ecce                	sd	s3,88(sp)
  8001ce:	f466                	sd	s9,40(sp)
  8001d0:	ec6e                	sd	s11,24(sp)
  8001d2:	892a                	mv	s2,a0
  8001d4:	84ae                	mv	s1,a1
  8001d6:	8d32                	mv	s10,a2
  8001d8:	8ab6                	mv	s5,a3
  8001da:	5b7d                	li	s6,-1
  8001dc:	00000a17          	auipc	s4,0x0
  8001e0:	458a0a13          	addi	s4,s4,1112 # 800634 <main+0x2c>
  8001e4:	05e00b93          	li	s7,94
  8001e8:	00000c17          	auipc	s8,0x0
  8001ec:	5a8c0c13          	addi	s8,s8,1448 # 800790 <error_string>
  8001f0:	000d4503          	lbu	a0,0(s10)
  8001f4:	02500793          	li	a5,37
  8001f8:	001d0413          	addi	s0,s10,1
  8001fc:	00f50e63          	beq	a0,a5,800218 <vprintfmt+0x62>
  800200:	c521                	beqz	a0,800248 <vprintfmt+0x92>
  800202:	02500993          	li	s3,37
  800206:	a011                	j	80020a <vprintfmt+0x54>
  800208:	c121                	beqz	a0,800248 <vprintfmt+0x92>
  80020a:	85a6                	mv	a1,s1
  80020c:	0405                	addi	s0,s0,1
  80020e:	9902                	jalr	s2
  800210:	fff44503          	lbu	a0,-1(s0)
  800214:	ff351ae3          	bne	a0,s3,800208 <vprintfmt+0x52>
  800218:	00044603          	lbu	a2,0(s0)
  80021c:	02000793          	li	a5,32
  800220:	4981                	li	s3,0
  800222:	4801                	li	a6,0
  800224:	5cfd                	li	s9,-1
  800226:	5dfd                	li	s11,-1
  800228:	05500593          	li	a1,85
  80022c:	4525                	li	a0,9
  80022e:	fdd6069b          	addiw	a3,a2,-35
  800232:	0ff6f693          	andi	a3,a3,255
  800236:	00140d13          	addi	s10,s0,1
  80023a:	1ed5ef63          	bltu	a1,a3,800438 <vprintfmt+0x282>
  80023e:	068a                	slli	a3,a3,0x2
  800240:	96d2                	add	a3,a3,s4
  800242:	4294                	lw	a3,0(a3)
  800244:	96d2                	add	a3,a3,s4
  800246:	8682                	jr	a3
  800248:	70e6                	ld	ra,120(sp)
  80024a:	7446                	ld	s0,112(sp)
  80024c:	74a6                	ld	s1,104(sp)
  80024e:	7906                	ld	s2,96(sp)
  800250:	69e6                	ld	s3,88(sp)
  800252:	6a46                	ld	s4,80(sp)
  800254:	6aa6                	ld	s5,72(sp)
  800256:	6b06                	ld	s6,64(sp)
  800258:	7be2                	ld	s7,56(sp)
  80025a:	7c42                	ld	s8,48(sp)
  80025c:	7ca2                	ld	s9,40(sp)
  80025e:	7d02                	ld	s10,32(sp)
  800260:	6de2                	ld	s11,24(sp)
  800262:	6109                	addi	sp,sp,128
  800264:	8082                	ret
  800266:	87b2                	mv	a5,a2
  800268:	00144603          	lbu	a2,1(s0)
  80026c:	846a                	mv	s0,s10
  80026e:	b7c1                	j	80022e <vprintfmt+0x78>
  800270:	000aac83          	lw	s9,0(s5)
  800274:	00144603          	lbu	a2,1(s0)
  800278:	0aa1                	addi	s5,s5,8
  80027a:	846a                	mv	s0,s10
  80027c:	fa0dd9e3          	bgez	s11,80022e <vprintfmt+0x78>
  800280:	8de6                	mv	s11,s9
  800282:	5cfd                	li	s9,-1
  800284:	b76d                	j	80022e <vprintfmt+0x78>
  800286:	fffdc693          	not	a3,s11
  80028a:	96fd                	srai	a3,a3,0x3f
  80028c:	00ddfdb3          	and	s11,s11,a3
  800290:	00144603          	lbu	a2,1(s0)
  800294:	2d81                	sext.w	s11,s11
  800296:	846a                	mv	s0,s10
  800298:	bf59                	j	80022e <vprintfmt+0x78>
  80029a:	4705                	li	a4,1
  80029c:	008a8593          	addi	a1,s5,8
  8002a0:	01074463          	blt	a4,a6,8002a8 <vprintfmt+0xf2>
  8002a4:	22080863          	beqz	a6,8004d4 <vprintfmt+0x31e>
  8002a8:	000ab603          	ld	a2,0(s5)
  8002ac:	46c1                	li	a3,16
  8002ae:	8aae                	mv	s5,a1
  8002b0:	a291                	j	8003f4 <vprintfmt+0x23e>
  8002b2:	fd060c9b          	addiw	s9,a2,-48
  8002b6:	00144603          	lbu	a2,1(s0)
  8002ba:	846a                	mv	s0,s10
  8002bc:	fd06069b          	addiw	a3,a2,-48
  8002c0:	0006089b          	sext.w	a7,a2
  8002c4:	fad56ce3          	bltu	a0,a3,80027c <vprintfmt+0xc6>
  8002c8:	0405                	addi	s0,s0,1
  8002ca:	002c969b          	slliw	a3,s9,0x2
  8002ce:	00044603          	lbu	a2,0(s0)
  8002d2:	0196873b          	addw	a4,a3,s9
  8002d6:	0017171b          	slliw	a4,a4,0x1
  8002da:	0117073b          	addw	a4,a4,a7
  8002de:	fd06069b          	addiw	a3,a2,-48
  8002e2:	fd070c9b          	addiw	s9,a4,-48
  8002e6:	0006089b          	sext.w	a7,a2
  8002ea:	fcd57fe3          	bgeu	a0,a3,8002c8 <vprintfmt+0x112>
  8002ee:	b779                	j	80027c <vprintfmt+0xc6>
  8002f0:	000aa503          	lw	a0,0(s5)
  8002f4:	85a6                	mv	a1,s1
  8002f6:	0aa1                	addi	s5,s5,8
  8002f8:	9902                	jalr	s2
  8002fa:	bddd                	j	8001f0 <vprintfmt+0x3a>
  8002fc:	4705                	li	a4,1
  8002fe:	008a8993          	addi	s3,s5,8
  800302:	01074463          	blt	a4,a6,80030a <vprintfmt+0x154>
  800306:	1c080463          	beqz	a6,8004ce <vprintfmt+0x318>
  80030a:	000ab403          	ld	s0,0(s5)
  80030e:	1c044a63          	bltz	s0,8004e2 <vprintfmt+0x32c>
  800312:	8622                	mv	a2,s0
  800314:	8ace                	mv	s5,s3
  800316:	46a9                	li	a3,10
  800318:	a8f1                	j	8003f4 <vprintfmt+0x23e>
  80031a:	000aa783          	lw	a5,0(s5)
  80031e:	4761                	li	a4,24
  800320:	0aa1                	addi	s5,s5,8
  800322:	41f7d69b          	sraiw	a3,a5,0x1f
  800326:	8fb5                	xor	a5,a5,a3
  800328:	40d786bb          	subw	a3,a5,a3
  80032c:	12d74963          	blt	a4,a3,80045e <vprintfmt+0x2a8>
  800330:	00369793          	slli	a5,a3,0x3
  800334:	97e2                	add	a5,a5,s8
  800336:	639c                	ld	a5,0(a5)
  800338:	12078363          	beqz	a5,80045e <vprintfmt+0x2a8>
  80033c:	86be                	mv	a3,a5
  80033e:	00000617          	auipc	a2,0x0
  800342:	60a60613          	addi	a2,a2,1546 # 800948 <error_string+0x1b8>
  800346:	85a6                	mv	a1,s1
  800348:	854a                	mv	a0,s2
  80034a:	1cc000ef          	jal	ra,800516 <printfmt>
  80034e:	b54d                	j	8001f0 <vprintfmt+0x3a>
  800350:	000ab603          	ld	a2,0(s5)
  800354:	0aa1                	addi	s5,s5,8
  800356:	1a060163          	beqz	a2,8004f8 <vprintfmt+0x342>
  80035a:	00160413          	addi	s0,a2,1
  80035e:	15b05763          	blez	s11,8004ac <vprintfmt+0x2f6>
  800362:	02d00593          	li	a1,45
  800366:	10b79d63          	bne	a5,a1,800480 <vprintfmt+0x2ca>
  80036a:	00064783          	lbu	a5,0(a2)
  80036e:	0007851b          	sext.w	a0,a5
  800372:	c905                	beqz	a0,8003a2 <vprintfmt+0x1ec>
  800374:	000cc563          	bltz	s9,80037e <vprintfmt+0x1c8>
  800378:	3cfd                	addiw	s9,s9,-1
  80037a:	036c8263          	beq	s9,s6,80039e <vprintfmt+0x1e8>
  80037e:	85a6                	mv	a1,s1
  800380:	14098f63          	beqz	s3,8004de <vprintfmt+0x328>
  800384:	3781                	addiw	a5,a5,-32
  800386:	14fbfc63          	bgeu	s7,a5,8004de <vprintfmt+0x328>
  80038a:	03f00513          	li	a0,63
  80038e:	9902                	jalr	s2
  800390:	0405                	addi	s0,s0,1
  800392:	fff44783          	lbu	a5,-1(s0)
  800396:	3dfd                	addiw	s11,s11,-1
  800398:	0007851b          	sext.w	a0,a5
  80039c:	fd61                	bnez	a0,800374 <vprintfmt+0x1be>
  80039e:	e5b059e3          	blez	s11,8001f0 <vprintfmt+0x3a>
  8003a2:	3dfd                	addiw	s11,s11,-1
  8003a4:	85a6                	mv	a1,s1
  8003a6:	02000513          	li	a0,32
  8003aa:	9902                	jalr	s2
  8003ac:	e40d82e3          	beqz	s11,8001f0 <vprintfmt+0x3a>
  8003b0:	3dfd                	addiw	s11,s11,-1
  8003b2:	85a6                	mv	a1,s1
  8003b4:	02000513          	li	a0,32
  8003b8:	9902                	jalr	s2
  8003ba:	fe0d94e3          	bnez	s11,8003a2 <vprintfmt+0x1ec>
  8003be:	bd0d                	j	8001f0 <vprintfmt+0x3a>
  8003c0:	4705                	li	a4,1
  8003c2:	008a8593          	addi	a1,s5,8
  8003c6:	01074463          	blt	a4,a6,8003ce <vprintfmt+0x218>
  8003ca:	0e080863          	beqz	a6,8004ba <vprintfmt+0x304>
  8003ce:	000ab603          	ld	a2,0(s5)
  8003d2:	46a1                	li	a3,8
  8003d4:	8aae                	mv	s5,a1
  8003d6:	a839                	j	8003f4 <vprintfmt+0x23e>
  8003d8:	03000513          	li	a0,48
  8003dc:	85a6                	mv	a1,s1
  8003de:	e03e                	sd	a5,0(sp)
  8003e0:	9902                	jalr	s2
  8003e2:	85a6                	mv	a1,s1
  8003e4:	07800513          	li	a0,120
  8003e8:	9902                	jalr	s2
  8003ea:	0aa1                	addi	s5,s5,8
  8003ec:	ff8ab603          	ld	a2,-8(s5)
  8003f0:	6782                	ld	a5,0(sp)
  8003f2:	46c1                	li	a3,16
  8003f4:	2781                	sext.w	a5,a5
  8003f6:	876e                	mv	a4,s11
  8003f8:	85a6                	mv	a1,s1
  8003fa:	854a                	mv	a0,s2
  8003fc:	d35ff0ef          	jal	ra,800130 <printnum>
  800400:	bbc5                	j	8001f0 <vprintfmt+0x3a>
  800402:	00144603          	lbu	a2,1(s0)
  800406:	2805                	addiw	a6,a6,1
  800408:	846a                	mv	s0,s10
  80040a:	b515                	j	80022e <vprintfmt+0x78>
  80040c:	00144603          	lbu	a2,1(s0)
  800410:	4985                	li	s3,1
  800412:	846a                	mv	s0,s10
  800414:	bd29                	j	80022e <vprintfmt+0x78>
  800416:	85a6                	mv	a1,s1
  800418:	02500513          	li	a0,37
  80041c:	9902                	jalr	s2
  80041e:	bbc9                	j	8001f0 <vprintfmt+0x3a>
  800420:	4705                	li	a4,1
  800422:	008a8593          	addi	a1,s5,8
  800426:	01074463          	blt	a4,a6,80042e <vprintfmt+0x278>
  80042a:	08080d63          	beqz	a6,8004c4 <vprintfmt+0x30e>
  80042e:	000ab603          	ld	a2,0(s5)
  800432:	46a9                	li	a3,10
  800434:	8aae                	mv	s5,a1
  800436:	bf7d                	j	8003f4 <vprintfmt+0x23e>
  800438:	85a6                	mv	a1,s1
  80043a:	02500513          	li	a0,37
  80043e:	9902                	jalr	s2
  800440:	fff44703          	lbu	a4,-1(s0)
  800444:	02500793          	li	a5,37
  800448:	8d22                	mv	s10,s0
  80044a:	daf703e3          	beq	a4,a5,8001f0 <vprintfmt+0x3a>
  80044e:	02500713          	li	a4,37
  800452:	1d7d                	addi	s10,s10,-1
  800454:	fffd4783          	lbu	a5,-1(s10)
  800458:	fee79de3          	bne	a5,a4,800452 <vprintfmt+0x29c>
  80045c:	bb51                	j	8001f0 <vprintfmt+0x3a>
  80045e:	00000617          	auipc	a2,0x0
  800462:	4da60613          	addi	a2,a2,1242 # 800938 <error_string+0x1a8>
  800466:	85a6                	mv	a1,s1
  800468:	854a                	mv	a0,s2
  80046a:	0ac000ef          	jal	ra,800516 <printfmt>
  80046e:	b349                	j	8001f0 <vprintfmt+0x3a>
  800470:	00000617          	auipc	a2,0x0
  800474:	4c060613          	addi	a2,a2,1216 # 800930 <error_string+0x1a0>
  800478:	00000417          	auipc	s0,0x0
  80047c:	4b940413          	addi	s0,s0,1209 # 800931 <error_string+0x1a1>
  800480:	8532                	mv	a0,a2
  800482:	85e6                	mv	a1,s9
  800484:	e032                	sd	a2,0(sp)
  800486:	e43e                	sd	a5,8(sp)
  800488:	c83ff0ef          	jal	ra,80010a <strnlen>
  80048c:	40ad8dbb          	subw	s11,s11,a0
  800490:	6602                	ld	a2,0(sp)
  800492:	01b05d63          	blez	s11,8004ac <vprintfmt+0x2f6>
  800496:	67a2                	ld	a5,8(sp)
  800498:	2781                	sext.w	a5,a5
  80049a:	e43e                	sd	a5,8(sp)
  80049c:	6522                	ld	a0,8(sp)
  80049e:	85a6                	mv	a1,s1
  8004a0:	e032                	sd	a2,0(sp)
  8004a2:	3dfd                	addiw	s11,s11,-1
  8004a4:	9902                	jalr	s2
  8004a6:	6602                	ld	a2,0(sp)
  8004a8:	fe0d9ae3          	bnez	s11,80049c <vprintfmt+0x2e6>
  8004ac:	00064783          	lbu	a5,0(a2)
  8004b0:	0007851b          	sext.w	a0,a5
  8004b4:	ec0510e3          	bnez	a0,800374 <vprintfmt+0x1be>
  8004b8:	bb25                	j	8001f0 <vprintfmt+0x3a>
  8004ba:	000ae603          	lwu	a2,0(s5)
  8004be:	46a1                	li	a3,8
  8004c0:	8aae                	mv	s5,a1
  8004c2:	bf0d                	j	8003f4 <vprintfmt+0x23e>
  8004c4:	000ae603          	lwu	a2,0(s5)
  8004c8:	46a9                	li	a3,10
  8004ca:	8aae                	mv	s5,a1
  8004cc:	b725                	j	8003f4 <vprintfmt+0x23e>
  8004ce:	000aa403          	lw	s0,0(s5)
  8004d2:	bd35                	j	80030e <vprintfmt+0x158>
  8004d4:	000ae603          	lwu	a2,0(s5)
  8004d8:	46c1                	li	a3,16
  8004da:	8aae                	mv	s5,a1
  8004dc:	bf21                	j	8003f4 <vprintfmt+0x23e>
  8004de:	9902                	jalr	s2
  8004e0:	bd45                	j	800390 <vprintfmt+0x1da>
  8004e2:	85a6                	mv	a1,s1
  8004e4:	02d00513          	li	a0,45
  8004e8:	e03e                	sd	a5,0(sp)
  8004ea:	9902                	jalr	s2
  8004ec:	8ace                	mv	s5,s3
  8004ee:	40800633          	neg	a2,s0
  8004f2:	46a9                	li	a3,10
  8004f4:	6782                	ld	a5,0(sp)
  8004f6:	bdfd                	j	8003f4 <vprintfmt+0x23e>
  8004f8:	01b05663          	blez	s11,800504 <vprintfmt+0x34e>
  8004fc:	02d00693          	li	a3,45
  800500:	f6d798e3          	bne	a5,a3,800470 <vprintfmt+0x2ba>
  800504:	00000417          	auipc	s0,0x0
  800508:	42d40413          	addi	s0,s0,1069 # 800931 <error_string+0x1a1>
  80050c:	02800513          	li	a0,40
  800510:	02800793          	li	a5,40
  800514:	b585                	j	800374 <vprintfmt+0x1be>

0000000000800516 <printfmt>:
  800516:	715d                	addi	sp,sp,-80
  800518:	02810313          	addi	t1,sp,40
  80051c:	f436                	sd	a3,40(sp)
  80051e:	869a                	mv	a3,t1
  800520:	ec06                	sd	ra,24(sp)
  800522:	f83a                	sd	a4,48(sp)
  800524:	fc3e                	sd	a5,56(sp)
  800526:	e0c2                	sd	a6,64(sp)
  800528:	e4c6                	sd	a7,72(sp)
  80052a:	e41a                	sd	t1,8(sp)
  80052c:	c8bff0ef          	jal	ra,8001b6 <vprintfmt>
  800530:	60e2                	ld	ra,24(sp)
  800532:	6161                	addi	sp,sp,80
  800534:	8082                	ret

0000000000800536 <vsnprintf>:
  800536:	15fd                	addi	a1,a1,-1
  800538:	7179                	addi	sp,sp,-48
  80053a:	95aa                	add	a1,a1,a0
  80053c:	f406                	sd	ra,40(sp)
  80053e:	e42a                	sd	a0,8(sp)
  800540:	e82e                	sd	a1,16(sp)
  800542:	cc02                	sw	zero,24(sp)
  800544:	c10d                	beqz	a0,800566 <vsnprintf+0x30>
  800546:	02a5e063          	bltu	a1,a0,800566 <vsnprintf+0x30>
  80054a:	00000517          	auipc	a0,0x0
  80054e:	c5250513          	addi	a0,a0,-942 # 80019c <sprintputch>
  800552:	002c                	addi	a1,sp,8
  800554:	c63ff0ef          	jal	ra,8001b6 <vprintfmt>
  800558:	67a2                	ld	a5,8(sp)
  80055a:	00078023          	sb	zero,0(a5)
  80055e:	4562                	lw	a0,24(sp)
  800560:	70a2                	ld	ra,40(sp)
  800562:	6145                	addi	sp,sp,48
  800564:	8082                	ret
  800566:	5575                	li	a0,-3
  800568:	bfe5                	j	800560 <vsnprintf+0x2a>

000000000080056a <snprintf>:
  80056a:	715d                	addi	sp,sp,-80
  80056c:	02810313          	addi	t1,sp,40
  800570:	f436                	sd	a3,40(sp)
  800572:	869a                	mv	a3,t1
  800574:	ec06                	sd	ra,24(sp)
  800576:	f83a                	sd	a4,48(sp)
  800578:	fc3e                	sd	a5,56(sp)
  80057a:	e0c2                	sd	a6,64(sp)
  80057c:	e4c6                	sd	a7,72(sp)
  80057e:	e41a                	sd	t1,8(sp)
  800580:	fb7ff0ef          	jal	ra,800536 <vsnprintf>
  800584:	60e2                	ld	ra,24(sp)
  800586:	6161                	addi	sp,sp,80
  800588:	8082                	ret

000000000080058a <forktree>:
  80058a:	1141                	addi	sp,sp,-16
  80058c:	e406                	sd	ra,8(sp)
  80058e:	e022                	sd	s0,0(sp)
  800590:	842a                	mv	s0,a0
  800592:	af9ff0ef          	jal	ra,80008a <getpid>
  800596:	8622                	mv	a2,s0
  800598:	85aa                	mv	a1,a0
  80059a:	00000517          	auipc	a0,0x0
  80059e:	3be50513          	addi	a0,a0,958 # 800958 <error_string+0x1c8>
  8005a2:	b0bff0ef          	jal	ra,8000ac <cprintf>
  8005a6:	8522                	mv	a0,s0
  8005a8:	03000593          	li	a1,48
  8005ac:	012000ef          	jal	ra,8005be <forkchild>
  8005b0:	8522                	mv	a0,s0
  8005b2:	6402                	ld	s0,0(sp)
  8005b4:	60a2                	ld	ra,8(sp)
  8005b6:	03100593          	li	a1,49
  8005ba:	0141                	addi	sp,sp,16
  8005bc:	a009                	j	8005be <forkchild>

00000000008005be <forkchild>:
  8005be:	7179                	addi	sp,sp,-48
  8005c0:	f022                	sd	s0,32(sp)
  8005c2:	ec26                	sd	s1,24(sp)
  8005c4:	f406                	sd	ra,40(sp)
  8005c6:	842a                	mv	s0,a0
  8005c8:	84ae                	mv	s1,a1
  8005ca:	b23ff0ef          	jal	ra,8000ec <strlen>
  8005ce:	478d                	li	a5,3
  8005d0:	00a7f763          	bgeu	a5,a0,8005de <forkchild+0x20>
  8005d4:	70a2                	ld	ra,40(sp)
  8005d6:	7402                	ld	s0,32(sp)
  8005d8:	64e2                	ld	s1,24(sp)
  8005da:	6145                	addi	sp,sp,48
  8005dc:	8082                	ret
  8005de:	8726                	mv	a4,s1
  8005e0:	86a2                	mv	a3,s0
  8005e2:	00000617          	auipc	a2,0x0
  8005e6:	36e60613          	addi	a2,a2,878 # 800950 <error_string+0x1c0>
  8005ea:	4595                	li	a1,5
  8005ec:	0028                	addi	a0,sp,8
  8005ee:	f7dff0ef          	jal	ra,80056a <snprintf>
  8005f2:	a95ff0ef          	jal	ra,800086 <fork>
  8005f6:	fd79                	bnez	a0,8005d4 <forkchild+0x16>
  8005f8:	0028                	addi	a0,sp,8
  8005fa:	f91ff0ef          	jal	ra,80058a <forktree>
  8005fe:	a8bff0ef          	jal	ra,800088 <yield>
  800602:	4501                	li	a0,0
  800604:	a6dff0ef          	jal	ra,800070 <exit>

0000000000800608 <main>:
  800608:	1141                	addi	sp,sp,-16
  80060a:	00000517          	auipc	a0,0x0
  80060e:	35e50513          	addi	a0,a0,862 # 800968 <error_string+0x1d8>
  800612:	e406                	sd	ra,8(sp)
  800614:	f77ff0ef          	jal	ra,80058a <forktree>
  800618:	60a2                	ld	ra,8(sp)
  80061a:	4501                	li	a0,0
  80061c:	0141                	addi	sp,sp,16
  80061e:	8082                	ret
