
obj/__user_hello.out：     文件格式 elf64-littleriscv


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

000000000080005e <sys_getpid>:
  80005e:	4549                	li	a0,18
  800060:	b7c1                	j	800020 <syscall>

0000000000800062 <sys_putc>:
  800062:	85aa                	mv	a1,a0
  800064:	4579                	li	a0,30
  800066:	bf6d                	j	800020 <syscall>

0000000000800068 <exit>:
  800068:	1141                	addi	sp,sp,-16
  80006a:	e406                	sd	ra,8(sp)
  80006c:	fedff0ef          	jal	ra,800058 <sys_exit>
  800070:	00000517          	auipc	a0,0x0
  800074:	4b850513          	addi	a0,a0,1208 # 800528 <main+0x36>
  800078:	028000ef          	jal	ra,8000a0 <cprintf>
  80007c:	a001                	j	80007c <exit+0x14>

000000000080007e <getpid>:
  80007e:	b7c5                	j	80005e <sys_getpid>

0000000000800080 <_start>:
  800080:	054000ef          	jal	ra,8000d4 <umain>
  800084:	a001                	j	800084 <_start+0x4>

0000000000800086 <cputch>:
  800086:	1141                	addi	sp,sp,-16
  800088:	e022                	sd	s0,0(sp)
  80008a:	e406                	sd	ra,8(sp)
  80008c:	842e                	mv	s0,a1
  80008e:	fd5ff0ef          	jal	ra,800062 <sys_putc>
  800092:	401c                	lw	a5,0(s0)
  800094:	60a2                	ld	ra,8(sp)
  800096:	2785                	addiw	a5,a5,1
  800098:	c01c                	sw	a5,0(s0)
  80009a:	6402                	ld	s0,0(sp)
  80009c:	0141                	addi	sp,sp,16
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
  8000b4:	fd650513          	addi	a0,a0,-42 # 800086 <cputch>
  8000b8:	869a                	mv	a3,t1
  8000ba:	ec06                	sd	ra,24(sp)
  8000bc:	e0ba                	sd	a4,64(sp)
  8000be:	e4be                	sd	a5,72(sp)
  8000c0:	e8c2                	sd	a6,80(sp)
  8000c2:	ecc6                	sd	a7,88(sp)
  8000c4:	e41a                	sd	t1,8(sp)
  8000c6:	c202                	sw	zero,4(sp)
  8000c8:	0aa000ef          	jal	ra,800172 <vprintfmt>
  8000cc:	60e2                	ld	ra,24(sp)
  8000ce:	4512                	lw	a0,4(sp)
  8000d0:	6125                	addi	sp,sp,96
  8000d2:	8082                	ret

00000000008000d4 <umain>:
  8000d4:	1141                	addi	sp,sp,-16
  8000d6:	e406                	sd	ra,8(sp)
  8000d8:	41a000ef          	jal	ra,8004f2 <main>
  8000dc:	f8dff0ef          	jal	ra,800068 <exit>

00000000008000e0 <strnlen>:
  8000e0:	c185                	beqz	a1,800100 <strnlen+0x20>
  8000e2:	00054783          	lbu	a5,0(a0)
  8000e6:	cf89                	beqz	a5,800100 <strnlen+0x20>
  8000e8:	4781                	li	a5,0
  8000ea:	a021                	j	8000f2 <strnlen+0x12>
  8000ec:	00074703          	lbu	a4,0(a4)
  8000f0:	c711                	beqz	a4,8000fc <strnlen+0x1c>
  8000f2:	0785                	addi	a5,a5,1
  8000f4:	00f50733          	add	a4,a0,a5
  8000f8:	fef59ae3          	bne	a1,a5,8000ec <strnlen+0xc>
  8000fc:	853e                	mv	a0,a5
  8000fe:	8082                	ret
  800100:	4781                	li	a5,0
  800102:	853e                	mv	a0,a5
  800104:	8082                	ret

0000000000800106 <printnum>:
  800106:	02069813          	slli	a6,a3,0x20
  80010a:	7179                	addi	sp,sp,-48
  80010c:	02085813          	srli	a6,a6,0x20
  800110:	e052                	sd	s4,0(sp)
  800112:	03067a33          	remu	s4,a2,a6
  800116:	f022                	sd	s0,32(sp)
  800118:	ec26                	sd	s1,24(sp)
  80011a:	e84a                	sd	s2,16(sp)
  80011c:	f406                	sd	ra,40(sp)
  80011e:	e44e                	sd	s3,8(sp)
  800120:	84aa                	mv	s1,a0
  800122:	892e                	mv	s2,a1
  800124:	fff7041b          	addiw	s0,a4,-1
  800128:	2a01                	sext.w	s4,s4
  80012a:	03067e63          	bgeu	a2,a6,800166 <printnum+0x60>
  80012e:	89be                	mv	s3,a5
  800130:	00805763          	blez	s0,80013e <printnum+0x38>
  800134:	347d                	addiw	s0,s0,-1
  800136:	85ca                	mv	a1,s2
  800138:	854e                	mv	a0,s3
  80013a:	9482                	jalr	s1
  80013c:	fc65                	bnez	s0,800134 <printnum+0x2e>
  80013e:	1a02                	slli	s4,s4,0x20
  800140:	020a5a13          	srli	s4,s4,0x20
  800144:	00000797          	auipc	a5,0x0
  800148:	61c78793          	addi	a5,a5,1564 # 800760 <error_string+0xc8>
  80014c:	9a3e                	add	s4,s4,a5
  80014e:	7402                	ld	s0,32(sp)
  800150:	000a4503          	lbu	a0,0(s4)
  800154:	70a2                	ld	ra,40(sp)
  800156:	69a2                	ld	s3,8(sp)
  800158:	6a02                	ld	s4,0(sp)
  80015a:	85ca                	mv	a1,s2
  80015c:	8326                	mv	t1,s1
  80015e:	6942                	ld	s2,16(sp)
  800160:	64e2                	ld	s1,24(sp)
  800162:	6145                	addi	sp,sp,48
  800164:	8302                	jr	t1
  800166:	03065633          	divu	a2,a2,a6
  80016a:	8722                	mv	a4,s0
  80016c:	f9bff0ef          	jal	ra,800106 <printnum>
  800170:	b7f9                	j	80013e <printnum+0x38>

0000000000800172 <vprintfmt>:
  800172:	7119                	addi	sp,sp,-128
  800174:	f4a6                	sd	s1,104(sp)
  800176:	f0ca                	sd	s2,96(sp)
  800178:	e8d2                	sd	s4,80(sp)
  80017a:	e4d6                	sd	s5,72(sp)
  80017c:	e0da                	sd	s6,64(sp)
  80017e:	fc5e                	sd	s7,56(sp)
  800180:	f862                	sd	s8,48(sp)
  800182:	f06a                	sd	s10,32(sp)
  800184:	fc86                	sd	ra,120(sp)
  800186:	f8a2                	sd	s0,112(sp)
  800188:	ecce                	sd	s3,88(sp)
  80018a:	f466                	sd	s9,40(sp)
  80018c:	ec6e                	sd	s11,24(sp)
  80018e:	892a                	mv	s2,a0
  800190:	84ae                	mv	s1,a1
  800192:	8d32                	mv	s10,a2
  800194:	8ab6                	mv	s5,a3
  800196:	5b7d                	li	s6,-1
  800198:	00000a17          	auipc	s4,0x0
  80019c:	3a4a0a13          	addi	s4,s4,932 # 80053c <main+0x4a>
  8001a0:	05e00b93          	li	s7,94
  8001a4:	00000c17          	auipc	s8,0x0
  8001a8:	4f4c0c13          	addi	s8,s8,1268 # 800698 <error_string>
  8001ac:	000d4503          	lbu	a0,0(s10)
  8001b0:	02500793          	li	a5,37
  8001b4:	001d0413          	addi	s0,s10,1
  8001b8:	00f50e63          	beq	a0,a5,8001d4 <vprintfmt+0x62>
  8001bc:	c521                	beqz	a0,800204 <vprintfmt+0x92>
  8001be:	02500993          	li	s3,37
  8001c2:	a011                	j	8001c6 <vprintfmt+0x54>
  8001c4:	c121                	beqz	a0,800204 <vprintfmt+0x92>
  8001c6:	85a6                	mv	a1,s1
  8001c8:	0405                	addi	s0,s0,1
  8001ca:	9902                	jalr	s2
  8001cc:	fff44503          	lbu	a0,-1(s0)
  8001d0:	ff351ae3          	bne	a0,s3,8001c4 <vprintfmt+0x52>
  8001d4:	00044603          	lbu	a2,0(s0)
  8001d8:	02000793          	li	a5,32
  8001dc:	4981                	li	s3,0
  8001de:	4801                	li	a6,0
  8001e0:	5cfd                	li	s9,-1
  8001e2:	5dfd                	li	s11,-1
  8001e4:	05500593          	li	a1,85
  8001e8:	4525                	li	a0,9
  8001ea:	fdd6069b          	addiw	a3,a2,-35
  8001ee:	0ff6f693          	andi	a3,a3,255
  8001f2:	00140d13          	addi	s10,s0,1
  8001f6:	1ed5ef63          	bltu	a1,a3,8003f4 <vprintfmt+0x282>
  8001fa:	068a                	slli	a3,a3,0x2
  8001fc:	96d2                	add	a3,a3,s4
  8001fe:	4294                	lw	a3,0(a3)
  800200:	96d2                	add	a3,a3,s4
  800202:	8682                	jr	a3
  800204:	70e6                	ld	ra,120(sp)
  800206:	7446                	ld	s0,112(sp)
  800208:	74a6                	ld	s1,104(sp)
  80020a:	7906                	ld	s2,96(sp)
  80020c:	69e6                	ld	s3,88(sp)
  80020e:	6a46                	ld	s4,80(sp)
  800210:	6aa6                	ld	s5,72(sp)
  800212:	6b06                	ld	s6,64(sp)
  800214:	7be2                	ld	s7,56(sp)
  800216:	7c42                	ld	s8,48(sp)
  800218:	7ca2                	ld	s9,40(sp)
  80021a:	7d02                	ld	s10,32(sp)
  80021c:	6de2                	ld	s11,24(sp)
  80021e:	6109                	addi	sp,sp,128
  800220:	8082                	ret
  800222:	87b2                	mv	a5,a2
  800224:	00144603          	lbu	a2,1(s0)
  800228:	846a                	mv	s0,s10
  80022a:	b7c1                	j	8001ea <vprintfmt+0x78>
  80022c:	000aac83          	lw	s9,0(s5)
  800230:	00144603          	lbu	a2,1(s0)
  800234:	0aa1                	addi	s5,s5,8
  800236:	846a                	mv	s0,s10
  800238:	fa0dd9e3          	bgez	s11,8001ea <vprintfmt+0x78>
  80023c:	8de6                	mv	s11,s9
  80023e:	5cfd                	li	s9,-1
  800240:	b76d                	j	8001ea <vprintfmt+0x78>
  800242:	fffdc693          	not	a3,s11
  800246:	96fd                	srai	a3,a3,0x3f
  800248:	00ddfdb3          	and	s11,s11,a3
  80024c:	00144603          	lbu	a2,1(s0)
  800250:	2d81                	sext.w	s11,s11
  800252:	846a                	mv	s0,s10
  800254:	bf59                	j	8001ea <vprintfmt+0x78>
  800256:	4705                	li	a4,1
  800258:	008a8593          	addi	a1,s5,8
  80025c:	01074463          	blt	a4,a6,800264 <vprintfmt+0xf2>
  800260:	22080863          	beqz	a6,800490 <vprintfmt+0x31e>
  800264:	000ab603          	ld	a2,0(s5)
  800268:	46c1                	li	a3,16
  80026a:	8aae                	mv	s5,a1
  80026c:	a291                	j	8003b0 <vprintfmt+0x23e>
  80026e:	fd060c9b          	addiw	s9,a2,-48
  800272:	00144603          	lbu	a2,1(s0)
  800276:	846a                	mv	s0,s10
  800278:	fd06069b          	addiw	a3,a2,-48
  80027c:	0006089b          	sext.w	a7,a2
  800280:	fad56ce3          	bltu	a0,a3,800238 <vprintfmt+0xc6>
  800284:	0405                	addi	s0,s0,1
  800286:	002c969b          	slliw	a3,s9,0x2
  80028a:	00044603          	lbu	a2,0(s0)
  80028e:	0196873b          	addw	a4,a3,s9
  800292:	0017171b          	slliw	a4,a4,0x1
  800296:	0117073b          	addw	a4,a4,a7
  80029a:	fd06069b          	addiw	a3,a2,-48
  80029e:	fd070c9b          	addiw	s9,a4,-48
  8002a2:	0006089b          	sext.w	a7,a2
  8002a6:	fcd57fe3          	bgeu	a0,a3,800284 <vprintfmt+0x112>
  8002aa:	b779                	j	800238 <vprintfmt+0xc6>
  8002ac:	000aa503          	lw	a0,0(s5)
  8002b0:	85a6                	mv	a1,s1
  8002b2:	0aa1                	addi	s5,s5,8
  8002b4:	9902                	jalr	s2
  8002b6:	bddd                	j	8001ac <vprintfmt+0x3a>
  8002b8:	4705                	li	a4,1
  8002ba:	008a8993          	addi	s3,s5,8
  8002be:	01074463          	blt	a4,a6,8002c6 <vprintfmt+0x154>
  8002c2:	1c080463          	beqz	a6,80048a <vprintfmt+0x318>
  8002c6:	000ab403          	ld	s0,0(s5)
  8002ca:	1c044a63          	bltz	s0,80049e <vprintfmt+0x32c>
  8002ce:	8622                	mv	a2,s0
  8002d0:	8ace                	mv	s5,s3
  8002d2:	46a9                	li	a3,10
  8002d4:	a8f1                	j	8003b0 <vprintfmt+0x23e>
  8002d6:	000aa783          	lw	a5,0(s5)
  8002da:	4761                	li	a4,24
  8002dc:	0aa1                	addi	s5,s5,8
  8002de:	41f7d69b          	sraiw	a3,a5,0x1f
  8002e2:	8fb5                	xor	a5,a5,a3
  8002e4:	40d786bb          	subw	a3,a5,a3
  8002e8:	12d74963          	blt	a4,a3,80041a <vprintfmt+0x2a8>
  8002ec:	00369793          	slli	a5,a3,0x3
  8002f0:	97e2                	add	a5,a5,s8
  8002f2:	639c                	ld	a5,0(a5)
  8002f4:	12078363          	beqz	a5,80041a <vprintfmt+0x2a8>
  8002f8:	86be                	mv	a3,a5
  8002fa:	00000617          	auipc	a2,0x0
  8002fe:	55660613          	addi	a2,a2,1366 # 800850 <error_string+0x1b8>
  800302:	85a6                	mv	a1,s1
  800304:	854a                	mv	a0,s2
  800306:	1cc000ef          	jal	ra,8004d2 <printfmt>
  80030a:	b54d                	j	8001ac <vprintfmt+0x3a>
  80030c:	000ab603          	ld	a2,0(s5)
  800310:	0aa1                	addi	s5,s5,8
  800312:	1a060163          	beqz	a2,8004b4 <vprintfmt+0x342>
  800316:	00160413          	addi	s0,a2,1
  80031a:	15b05763          	blez	s11,800468 <vprintfmt+0x2f6>
  80031e:	02d00593          	li	a1,45
  800322:	10b79d63          	bne	a5,a1,80043c <vprintfmt+0x2ca>
  800326:	00064783          	lbu	a5,0(a2)
  80032a:	0007851b          	sext.w	a0,a5
  80032e:	c905                	beqz	a0,80035e <vprintfmt+0x1ec>
  800330:	000cc563          	bltz	s9,80033a <vprintfmt+0x1c8>
  800334:	3cfd                	addiw	s9,s9,-1
  800336:	036c8263          	beq	s9,s6,80035a <vprintfmt+0x1e8>
  80033a:	85a6                	mv	a1,s1
  80033c:	14098f63          	beqz	s3,80049a <vprintfmt+0x328>
  800340:	3781                	addiw	a5,a5,-32
  800342:	14fbfc63          	bgeu	s7,a5,80049a <vprintfmt+0x328>
  800346:	03f00513          	li	a0,63
  80034a:	9902                	jalr	s2
  80034c:	0405                	addi	s0,s0,1
  80034e:	fff44783          	lbu	a5,-1(s0)
  800352:	3dfd                	addiw	s11,s11,-1
  800354:	0007851b          	sext.w	a0,a5
  800358:	fd61                	bnez	a0,800330 <vprintfmt+0x1be>
  80035a:	e5b059e3          	blez	s11,8001ac <vprintfmt+0x3a>
  80035e:	3dfd                	addiw	s11,s11,-1
  800360:	85a6                	mv	a1,s1
  800362:	02000513          	li	a0,32
  800366:	9902                	jalr	s2
  800368:	e40d82e3          	beqz	s11,8001ac <vprintfmt+0x3a>
  80036c:	3dfd                	addiw	s11,s11,-1
  80036e:	85a6                	mv	a1,s1
  800370:	02000513          	li	a0,32
  800374:	9902                	jalr	s2
  800376:	fe0d94e3          	bnez	s11,80035e <vprintfmt+0x1ec>
  80037a:	bd0d                	j	8001ac <vprintfmt+0x3a>
  80037c:	4705                	li	a4,1
  80037e:	008a8593          	addi	a1,s5,8
  800382:	01074463          	blt	a4,a6,80038a <vprintfmt+0x218>
  800386:	0e080863          	beqz	a6,800476 <vprintfmt+0x304>
  80038a:	000ab603          	ld	a2,0(s5)
  80038e:	46a1                	li	a3,8
  800390:	8aae                	mv	s5,a1
  800392:	a839                	j	8003b0 <vprintfmt+0x23e>
  800394:	03000513          	li	a0,48
  800398:	85a6                	mv	a1,s1
  80039a:	e03e                	sd	a5,0(sp)
  80039c:	9902                	jalr	s2
  80039e:	85a6                	mv	a1,s1
  8003a0:	07800513          	li	a0,120
  8003a4:	9902                	jalr	s2
  8003a6:	0aa1                	addi	s5,s5,8
  8003a8:	ff8ab603          	ld	a2,-8(s5)
  8003ac:	6782                	ld	a5,0(sp)
  8003ae:	46c1                	li	a3,16
  8003b0:	2781                	sext.w	a5,a5
  8003b2:	876e                	mv	a4,s11
  8003b4:	85a6                	mv	a1,s1
  8003b6:	854a                	mv	a0,s2
  8003b8:	d4fff0ef          	jal	ra,800106 <printnum>
  8003bc:	bbc5                	j	8001ac <vprintfmt+0x3a>
  8003be:	00144603          	lbu	a2,1(s0)
  8003c2:	2805                	addiw	a6,a6,1
  8003c4:	846a                	mv	s0,s10
  8003c6:	b515                	j	8001ea <vprintfmt+0x78>
  8003c8:	00144603          	lbu	a2,1(s0)
  8003cc:	4985                	li	s3,1
  8003ce:	846a                	mv	s0,s10
  8003d0:	bd29                	j	8001ea <vprintfmt+0x78>
  8003d2:	85a6                	mv	a1,s1
  8003d4:	02500513          	li	a0,37
  8003d8:	9902                	jalr	s2
  8003da:	bbc9                	j	8001ac <vprintfmt+0x3a>
  8003dc:	4705                	li	a4,1
  8003de:	008a8593          	addi	a1,s5,8
  8003e2:	01074463          	blt	a4,a6,8003ea <vprintfmt+0x278>
  8003e6:	08080d63          	beqz	a6,800480 <vprintfmt+0x30e>
  8003ea:	000ab603          	ld	a2,0(s5)
  8003ee:	46a9                	li	a3,10
  8003f0:	8aae                	mv	s5,a1
  8003f2:	bf7d                	j	8003b0 <vprintfmt+0x23e>
  8003f4:	85a6                	mv	a1,s1
  8003f6:	02500513          	li	a0,37
  8003fa:	9902                	jalr	s2
  8003fc:	fff44703          	lbu	a4,-1(s0)
  800400:	02500793          	li	a5,37
  800404:	8d22                	mv	s10,s0
  800406:	daf703e3          	beq	a4,a5,8001ac <vprintfmt+0x3a>
  80040a:	02500713          	li	a4,37
  80040e:	1d7d                	addi	s10,s10,-1
  800410:	fffd4783          	lbu	a5,-1(s10)
  800414:	fee79de3          	bne	a5,a4,80040e <vprintfmt+0x29c>
  800418:	bb51                	j	8001ac <vprintfmt+0x3a>
  80041a:	00000617          	auipc	a2,0x0
  80041e:	42660613          	addi	a2,a2,1062 # 800840 <error_string+0x1a8>
  800422:	85a6                	mv	a1,s1
  800424:	854a                	mv	a0,s2
  800426:	0ac000ef          	jal	ra,8004d2 <printfmt>
  80042a:	b349                	j	8001ac <vprintfmt+0x3a>
  80042c:	00000617          	auipc	a2,0x0
  800430:	40c60613          	addi	a2,a2,1036 # 800838 <error_string+0x1a0>
  800434:	00000417          	auipc	s0,0x0
  800438:	40540413          	addi	s0,s0,1029 # 800839 <error_string+0x1a1>
  80043c:	8532                	mv	a0,a2
  80043e:	85e6                	mv	a1,s9
  800440:	e032                	sd	a2,0(sp)
  800442:	e43e                	sd	a5,8(sp)
  800444:	c9dff0ef          	jal	ra,8000e0 <strnlen>
  800448:	40ad8dbb          	subw	s11,s11,a0
  80044c:	6602                	ld	a2,0(sp)
  80044e:	01b05d63          	blez	s11,800468 <vprintfmt+0x2f6>
  800452:	67a2                	ld	a5,8(sp)
  800454:	2781                	sext.w	a5,a5
  800456:	e43e                	sd	a5,8(sp)
  800458:	6522                	ld	a0,8(sp)
  80045a:	85a6                	mv	a1,s1
  80045c:	e032                	sd	a2,0(sp)
  80045e:	3dfd                	addiw	s11,s11,-1
  800460:	9902                	jalr	s2
  800462:	6602                	ld	a2,0(sp)
  800464:	fe0d9ae3          	bnez	s11,800458 <vprintfmt+0x2e6>
  800468:	00064783          	lbu	a5,0(a2)
  80046c:	0007851b          	sext.w	a0,a5
  800470:	ec0510e3          	bnez	a0,800330 <vprintfmt+0x1be>
  800474:	bb25                	j	8001ac <vprintfmt+0x3a>
  800476:	000ae603          	lwu	a2,0(s5)
  80047a:	46a1                	li	a3,8
  80047c:	8aae                	mv	s5,a1
  80047e:	bf0d                	j	8003b0 <vprintfmt+0x23e>
  800480:	000ae603          	lwu	a2,0(s5)
  800484:	46a9                	li	a3,10
  800486:	8aae                	mv	s5,a1
  800488:	b725                	j	8003b0 <vprintfmt+0x23e>
  80048a:	000aa403          	lw	s0,0(s5)
  80048e:	bd35                	j	8002ca <vprintfmt+0x158>
  800490:	000ae603          	lwu	a2,0(s5)
  800494:	46c1                	li	a3,16
  800496:	8aae                	mv	s5,a1
  800498:	bf21                	j	8003b0 <vprintfmt+0x23e>
  80049a:	9902                	jalr	s2
  80049c:	bd45                	j	80034c <vprintfmt+0x1da>
  80049e:	85a6                	mv	a1,s1
  8004a0:	02d00513          	li	a0,45
  8004a4:	e03e                	sd	a5,0(sp)
  8004a6:	9902                	jalr	s2
  8004a8:	8ace                	mv	s5,s3
  8004aa:	40800633          	neg	a2,s0
  8004ae:	46a9                	li	a3,10
  8004b0:	6782                	ld	a5,0(sp)
  8004b2:	bdfd                	j	8003b0 <vprintfmt+0x23e>
  8004b4:	01b05663          	blez	s11,8004c0 <vprintfmt+0x34e>
  8004b8:	02d00693          	li	a3,45
  8004bc:	f6d798e3          	bne	a5,a3,80042c <vprintfmt+0x2ba>
  8004c0:	00000417          	auipc	s0,0x0
  8004c4:	37940413          	addi	s0,s0,889 # 800839 <error_string+0x1a1>
  8004c8:	02800513          	li	a0,40
  8004cc:	02800793          	li	a5,40
  8004d0:	b585                	j	800330 <vprintfmt+0x1be>

00000000008004d2 <printfmt>:
  8004d2:	715d                	addi	sp,sp,-80
  8004d4:	02810313          	addi	t1,sp,40
  8004d8:	f436                	sd	a3,40(sp)
  8004da:	869a                	mv	a3,t1
  8004dc:	ec06                	sd	ra,24(sp)
  8004de:	f83a                	sd	a4,48(sp)
  8004e0:	fc3e                	sd	a5,56(sp)
  8004e2:	e0c2                	sd	a6,64(sp)
  8004e4:	e4c6                	sd	a7,72(sp)
  8004e6:	e41a                	sd	t1,8(sp)
  8004e8:	c8bff0ef          	jal	ra,800172 <vprintfmt>
  8004ec:	60e2                	ld	ra,24(sp)
  8004ee:	6161                	addi	sp,sp,80
  8004f0:	8082                	ret

00000000008004f2 <main>:
  8004f2:	1141                	addi	sp,sp,-16
  8004f4:	00000517          	auipc	a0,0x0
  8004f8:	36450513          	addi	a0,a0,868 # 800858 <error_string+0x1c0>
  8004fc:	e406                	sd	ra,8(sp)
  8004fe:	ba3ff0ef          	jal	ra,8000a0 <cprintf>
  800502:	b7dff0ef          	jal	ra,80007e <getpid>
  800506:	85aa                	mv	a1,a0
  800508:	00000517          	auipc	a0,0x0
  80050c:	36050513          	addi	a0,a0,864 # 800868 <error_string+0x1d0>
  800510:	b91ff0ef          	jal	ra,8000a0 <cprintf>
  800514:	00000517          	auipc	a0,0x0
  800518:	36c50513          	addi	a0,a0,876 # 800880 <error_string+0x1e8>
  80051c:	b85ff0ef          	jal	ra,8000a0 <cprintf>
  800520:	60a2                	ld	ra,8(sp)
  800522:	4501                	li	a0,0
  800524:	0141                	addi	sp,sp,16
  800526:	8082                	ret
