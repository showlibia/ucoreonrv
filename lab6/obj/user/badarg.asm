
obj/__user_badarg.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000800020 <_start>:
  800020:	124000ef          	jal	ra,800144 <umain>
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
  800038:	61c50513          	addi	a0,a0,1564 # 800650 <main+0xee>
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
  800058:	95450513          	addi	a0,a0,-1708 # 8009a8 <error_string+0x1c8>
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
  800094:	128000ef          	jal	ra,8001bc <vprintfmt>
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
  8000c8:	0f4000ef          	jal	ra,8001bc <vprintfmt>
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
  800134:	54050513          	addi	a0,a0,1344 # 800670 <main+0x10e>
  800138:	f69ff0ef          	jal	ra,8000a0 <cprintf>
  80013c:	a001                	j	80013c <exit+0x14>

000000000080013e <fork>:
  80013e:	bfd1                	j	800112 <sys_fork>

0000000000800140 <waitpid>:
  800140:	bfd9                	j	800116 <sys_wait>

0000000000800142 <yield>:
  800142:	bff1                	j	80011e <sys_yield>

0000000000800144 <umain>:
  800144:	1141                	addi	sp,sp,-16
  800146:	e406                	sd	ra,8(sp)
  800148:	41a000ef          	jal	ra,800562 <main>
  80014c:	fddff0ef          	jal	ra,800128 <exit>

0000000000800150 <printnum>:
  800150:	02069813          	slli	a6,a3,0x20
  800154:	7179                	addi	sp,sp,-48
  800156:	02085813          	srli	a6,a6,0x20
  80015a:	e052                	sd	s4,0(sp)
  80015c:	03067a33          	remu	s4,a2,a6
  800160:	f022                	sd	s0,32(sp)
  800162:	ec26                	sd	s1,24(sp)
  800164:	e84a                	sd	s2,16(sp)
  800166:	f406                	sd	ra,40(sp)
  800168:	e44e                	sd	s3,8(sp)
  80016a:	84aa                	mv	s1,a0
  80016c:	892e                	mv	s2,a1
  80016e:	fff7041b          	addiw	s0,a4,-1
  800172:	2a01                	sext.w	s4,s4
  800174:	03067e63          	bgeu	a2,a6,8001b0 <printnum+0x60>
  800178:	89be                	mv	s3,a5
  80017a:	00805763          	blez	s0,800188 <printnum+0x38>
  80017e:	347d                	addiw	s0,s0,-1
  800180:	85ca                	mv	a1,s2
  800182:	854e                	mv	a0,s3
  800184:	9482                	jalr	s1
  800186:	fc65                	bnez	s0,80017e <printnum+0x2e>
  800188:	1a02                	slli	s4,s4,0x20
  80018a:	020a5a13          	srli	s4,s4,0x20
  80018e:	00000797          	auipc	a5,0x0
  800192:	71a78793          	addi	a5,a5,1818 # 8008a8 <error_string+0xc8>
  800196:	9a3e                	add	s4,s4,a5
  800198:	7402                	ld	s0,32(sp)
  80019a:	000a4503          	lbu	a0,0(s4)
  80019e:	70a2                	ld	ra,40(sp)
  8001a0:	69a2                	ld	s3,8(sp)
  8001a2:	6a02                	ld	s4,0(sp)
  8001a4:	85ca                	mv	a1,s2
  8001a6:	8326                	mv	t1,s1
  8001a8:	6942                	ld	s2,16(sp)
  8001aa:	64e2                	ld	s1,24(sp)
  8001ac:	6145                	addi	sp,sp,48
  8001ae:	8302                	jr	t1
  8001b0:	03065633          	divu	a2,a2,a6
  8001b4:	8722                	mv	a4,s0
  8001b6:	f9bff0ef          	jal	ra,800150 <printnum>
  8001ba:	b7f9                	j	800188 <printnum+0x38>

00000000008001bc <vprintfmt>:
  8001bc:	7119                	addi	sp,sp,-128
  8001be:	f4a6                	sd	s1,104(sp)
  8001c0:	f0ca                	sd	s2,96(sp)
  8001c2:	e8d2                	sd	s4,80(sp)
  8001c4:	e4d6                	sd	s5,72(sp)
  8001c6:	e0da                	sd	s6,64(sp)
  8001c8:	fc5e                	sd	s7,56(sp)
  8001ca:	f862                	sd	s8,48(sp)
  8001cc:	f06a                	sd	s10,32(sp)
  8001ce:	fc86                	sd	ra,120(sp)
  8001d0:	f8a2                	sd	s0,112(sp)
  8001d2:	ecce                	sd	s3,88(sp)
  8001d4:	f466                	sd	s9,40(sp)
  8001d6:	ec6e                	sd	s11,24(sp)
  8001d8:	892a                	mv	s2,a0
  8001da:	84ae                	mv	s1,a1
  8001dc:	8d32                	mv	s10,a2
  8001de:	8ab6                	mv	s5,a3
  8001e0:	5b7d                	li	s6,-1
  8001e2:	00000a17          	auipc	s4,0x0
  8001e6:	4a2a0a13          	addi	s4,s4,1186 # 800684 <main+0x122>
  8001ea:	05e00b93          	li	s7,94
  8001ee:	00000c17          	auipc	s8,0x0
  8001f2:	5f2c0c13          	addi	s8,s8,1522 # 8007e0 <error_string>
  8001f6:	000d4503          	lbu	a0,0(s10)
  8001fa:	02500793          	li	a5,37
  8001fe:	001d0413          	addi	s0,s10,1
  800202:	00f50e63          	beq	a0,a5,80021e <vprintfmt+0x62>
  800206:	c521                	beqz	a0,80024e <vprintfmt+0x92>
  800208:	02500993          	li	s3,37
  80020c:	a011                	j	800210 <vprintfmt+0x54>
  80020e:	c121                	beqz	a0,80024e <vprintfmt+0x92>
  800210:	85a6                	mv	a1,s1
  800212:	0405                	addi	s0,s0,1
  800214:	9902                	jalr	s2
  800216:	fff44503          	lbu	a0,-1(s0)
  80021a:	ff351ae3          	bne	a0,s3,80020e <vprintfmt+0x52>
  80021e:	00044603          	lbu	a2,0(s0)
  800222:	02000793          	li	a5,32
  800226:	4981                	li	s3,0
  800228:	4801                	li	a6,0
  80022a:	5cfd                	li	s9,-1
  80022c:	5dfd                	li	s11,-1
  80022e:	05500593          	li	a1,85
  800232:	4525                	li	a0,9
  800234:	fdd6069b          	addiw	a3,a2,-35
  800238:	0ff6f693          	andi	a3,a3,255
  80023c:	00140d13          	addi	s10,s0,1
  800240:	1ed5ef63          	bltu	a1,a3,80043e <vprintfmt+0x282>
  800244:	068a                	slli	a3,a3,0x2
  800246:	96d2                	add	a3,a3,s4
  800248:	4294                	lw	a3,0(a3)
  80024a:	96d2                	add	a3,a3,s4
  80024c:	8682                	jr	a3
  80024e:	70e6                	ld	ra,120(sp)
  800250:	7446                	ld	s0,112(sp)
  800252:	74a6                	ld	s1,104(sp)
  800254:	7906                	ld	s2,96(sp)
  800256:	69e6                	ld	s3,88(sp)
  800258:	6a46                	ld	s4,80(sp)
  80025a:	6aa6                	ld	s5,72(sp)
  80025c:	6b06                	ld	s6,64(sp)
  80025e:	7be2                	ld	s7,56(sp)
  800260:	7c42                	ld	s8,48(sp)
  800262:	7ca2                	ld	s9,40(sp)
  800264:	7d02                	ld	s10,32(sp)
  800266:	6de2                	ld	s11,24(sp)
  800268:	6109                	addi	sp,sp,128
  80026a:	8082                	ret
  80026c:	87b2                	mv	a5,a2
  80026e:	00144603          	lbu	a2,1(s0)
  800272:	846a                	mv	s0,s10
  800274:	b7c1                	j	800234 <vprintfmt+0x78>
  800276:	000aac83          	lw	s9,0(s5)
  80027a:	00144603          	lbu	a2,1(s0)
  80027e:	0aa1                	addi	s5,s5,8
  800280:	846a                	mv	s0,s10
  800282:	fa0dd9e3          	bgez	s11,800234 <vprintfmt+0x78>
  800286:	8de6                	mv	s11,s9
  800288:	5cfd                	li	s9,-1
  80028a:	b76d                	j	800234 <vprintfmt+0x78>
  80028c:	fffdc693          	not	a3,s11
  800290:	96fd                	srai	a3,a3,0x3f
  800292:	00ddfdb3          	and	s11,s11,a3
  800296:	00144603          	lbu	a2,1(s0)
  80029a:	2d81                	sext.w	s11,s11
  80029c:	846a                	mv	s0,s10
  80029e:	bf59                	j	800234 <vprintfmt+0x78>
  8002a0:	4705                	li	a4,1
  8002a2:	008a8593          	addi	a1,s5,8
  8002a6:	01074463          	blt	a4,a6,8002ae <vprintfmt+0xf2>
  8002aa:	22080863          	beqz	a6,8004da <vprintfmt+0x31e>
  8002ae:	000ab603          	ld	a2,0(s5)
  8002b2:	46c1                	li	a3,16
  8002b4:	8aae                	mv	s5,a1
  8002b6:	a291                	j	8003fa <vprintfmt+0x23e>
  8002b8:	fd060c9b          	addiw	s9,a2,-48
  8002bc:	00144603          	lbu	a2,1(s0)
  8002c0:	846a                	mv	s0,s10
  8002c2:	fd06069b          	addiw	a3,a2,-48
  8002c6:	0006089b          	sext.w	a7,a2
  8002ca:	fad56ce3          	bltu	a0,a3,800282 <vprintfmt+0xc6>
  8002ce:	0405                	addi	s0,s0,1
  8002d0:	002c969b          	slliw	a3,s9,0x2
  8002d4:	00044603          	lbu	a2,0(s0)
  8002d8:	0196873b          	addw	a4,a3,s9
  8002dc:	0017171b          	slliw	a4,a4,0x1
  8002e0:	0117073b          	addw	a4,a4,a7
  8002e4:	fd06069b          	addiw	a3,a2,-48
  8002e8:	fd070c9b          	addiw	s9,a4,-48
  8002ec:	0006089b          	sext.w	a7,a2
  8002f0:	fcd57fe3          	bgeu	a0,a3,8002ce <vprintfmt+0x112>
  8002f4:	b779                	j	800282 <vprintfmt+0xc6>
  8002f6:	000aa503          	lw	a0,0(s5)
  8002fa:	85a6                	mv	a1,s1
  8002fc:	0aa1                	addi	s5,s5,8
  8002fe:	9902                	jalr	s2
  800300:	bddd                	j	8001f6 <vprintfmt+0x3a>
  800302:	4705                	li	a4,1
  800304:	008a8993          	addi	s3,s5,8
  800308:	01074463          	blt	a4,a6,800310 <vprintfmt+0x154>
  80030c:	1c080463          	beqz	a6,8004d4 <vprintfmt+0x318>
  800310:	000ab403          	ld	s0,0(s5)
  800314:	1c044a63          	bltz	s0,8004e8 <vprintfmt+0x32c>
  800318:	8622                	mv	a2,s0
  80031a:	8ace                	mv	s5,s3
  80031c:	46a9                	li	a3,10
  80031e:	a8f1                	j	8003fa <vprintfmt+0x23e>
  800320:	000aa783          	lw	a5,0(s5)
  800324:	4761                	li	a4,24
  800326:	0aa1                	addi	s5,s5,8
  800328:	41f7d69b          	sraiw	a3,a5,0x1f
  80032c:	8fb5                	xor	a5,a5,a3
  80032e:	40d786bb          	subw	a3,a5,a3
  800332:	12d74963          	blt	a4,a3,800464 <vprintfmt+0x2a8>
  800336:	00369793          	slli	a5,a3,0x3
  80033a:	97e2                	add	a5,a5,s8
  80033c:	639c                	ld	a5,0(a5)
  80033e:	12078363          	beqz	a5,800464 <vprintfmt+0x2a8>
  800342:	86be                	mv	a3,a5
  800344:	00000617          	auipc	a2,0x0
  800348:	65460613          	addi	a2,a2,1620 # 800998 <error_string+0x1b8>
  80034c:	85a6                	mv	a1,s1
  80034e:	854a                	mv	a0,s2
  800350:	1cc000ef          	jal	ra,80051c <printfmt>
  800354:	b54d                	j	8001f6 <vprintfmt+0x3a>
  800356:	000ab603          	ld	a2,0(s5)
  80035a:	0aa1                	addi	s5,s5,8
  80035c:	1a060163          	beqz	a2,8004fe <vprintfmt+0x342>
  800360:	00160413          	addi	s0,a2,1
  800364:	15b05763          	blez	s11,8004b2 <vprintfmt+0x2f6>
  800368:	02d00593          	li	a1,45
  80036c:	10b79d63          	bne	a5,a1,800486 <vprintfmt+0x2ca>
  800370:	00064783          	lbu	a5,0(a2)
  800374:	0007851b          	sext.w	a0,a5
  800378:	c905                	beqz	a0,8003a8 <vprintfmt+0x1ec>
  80037a:	000cc563          	bltz	s9,800384 <vprintfmt+0x1c8>
  80037e:	3cfd                	addiw	s9,s9,-1
  800380:	036c8263          	beq	s9,s6,8003a4 <vprintfmt+0x1e8>
  800384:	85a6                	mv	a1,s1
  800386:	14098f63          	beqz	s3,8004e4 <vprintfmt+0x328>
  80038a:	3781                	addiw	a5,a5,-32
  80038c:	14fbfc63          	bgeu	s7,a5,8004e4 <vprintfmt+0x328>
  800390:	03f00513          	li	a0,63
  800394:	9902                	jalr	s2
  800396:	0405                	addi	s0,s0,1
  800398:	fff44783          	lbu	a5,-1(s0)
  80039c:	3dfd                	addiw	s11,s11,-1
  80039e:	0007851b          	sext.w	a0,a5
  8003a2:	fd61                	bnez	a0,80037a <vprintfmt+0x1be>
  8003a4:	e5b059e3          	blez	s11,8001f6 <vprintfmt+0x3a>
  8003a8:	3dfd                	addiw	s11,s11,-1
  8003aa:	85a6                	mv	a1,s1
  8003ac:	02000513          	li	a0,32
  8003b0:	9902                	jalr	s2
  8003b2:	e40d82e3          	beqz	s11,8001f6 <vprintfmt+0x3a>
  8003b6:	3dfd                	addiw	s11,s11,-1
  8003b8:	85a6                	mv	a1,s1
  8003ba:	02000513          	li	a0,32
  8003be:	9902                	jalr	s2
  8003c0:	fe0d94e3          	bnez	s11,8003a8 <vprintfmt+0x1ec>
  8003c4:	bd0d                	j	8001f6 <vprintfmt+0x3a>
  8003c6:	4705                	li	a4,1
  8003c8:	008a8593          	addi	a1,s5,8
  8003cc:	01074463          	blt	a4,a6,8003d4 <vprintfmt+0x218>
  8003d0:	0e080863          	beqz	a6,8004c0 <vprintfmt+0x304>
  8003d4:	000ab603          	ld	a2,0(s5)
  8003d8:	46a1                	li	a3,8
  8003da:	8aae                	mv	s5,a1
  8003dc:	a839                	j	8003fa <vprintfmt+0x23e>
  8003de:	03000513          	li	a0,48
  8003e2:	85a6                	mv	a1,s1
  8003e4:	e03e                	sd	a5,0(sp)
  8003e6:	9902                	jalr	s2
  8003e8:	85a6                	mv	a1,s1
  8003ea:	07800513          	li	a0,120
  8003ee:	9902                	jalr	s2
  8003f0:	0aa1                	addi	s5,s5,8
  8003f2:	ff8ab603          	ld	a2,-8(s5)
  8003f6:	6782                	ld	a5,0(sp)
  8003f8:	46c1                	li	a3,16
  8003fa:	2781                	sext.w	a5,a5
  8003fc:	876e                	mv	a4,s11
  8003fe:	85a6                	mv	a1,s1
  800400:	854a                	mv	a0,s2
  800402:	d4fff0ef          	jal	ra,800150 <printnum>
  800406:	bbc5                	j	8001f6 <vprintfmt+0x3a>
  800408:	00144603          	lbu	a2,1(s0)
  80040c:	2805                	addiw	a6,a6,1
  80040e:	846a                	mv	s0,s10
  800410:	b515                	j	800234 <vprintfmt+0x78>
  800412:	00144603          	lbu	a2,1(s0)
  800416:	4985                	li	s3,1
  800418:	846a                	mv	s0,s10
  80041a:	bd29                	j	800234 <vprintfmt+0x78>
  80041c:	85a6                	mv	a1,s1
  80041e:	02500513          	li	a0,37
  800422:	9902                	jalr	s2
  800424:	bbc9                	j	8001f6 <vprintfmt+0x3a>
  800426:	4705                	li	a4,1
  800428:	008a8593          	addi	a1,s5,8
  80042c:	01074463          	blt	a4,a6,800434 <vprintfmt+0x278>
  800430:	08080d63          	beqz	a6,8004ca <vprintfmt+0x30e>
  800434:	000ab603          	ld	a2,0(s5)
  800438:	46a9                	li	a3,10
  80043a:	8aae                	mv	s5,a1
  80043c:	bf7d                	j	8003fa <vprintfmt+0x23e>
  80043e:	85a6                	mv	a1,s1
  800440:	02500513          	li	a0,37
  800444:	9902                	jalr	s2
  800446:	fff44703          	lbu	a4,-1(s0)
  80044a:	02500793          	li	a5,37
  80044e:	8d22                	mv	s10,s0
  800450:	daf703e3          	beq	a4,a5,8001f6 <vprintfmt+0x3a>
  800454:	02500713          	li	a4,37
  800458:	1d7d                	addi	s10,s10,-1
  80045a:	fffd4783          	lbu	a5,-1(s10)
  80045e:	fee79de3          	bne	a5,a4,800458 <vprintfmt+0x29c>
  800462:	bb51                	j	8001f6 <vprintfmt+0x3a>
  800464:	00000617          	auipc	a2,0x0
  800468:	52460613          	addi	a2,a2,1316 # 800988 <error_string+0x1a8>
  80046c:	85a6                	mv	a1,s1
  80046e:	854a                	mv	a0,s2
  800470:	0ac000ef          	jal	ra,80051c <printfmt>
  800474:	b349                	j	8001f6 <vprintfmt+0x3a>
  800476:	00000617          	auipc	a2,0x0
  80047a:	50a60613          	addi	a2,a2,1290 # 800980 <error_string+0x1a0>
  80047e:	00000417          	auipc	s0,0x0
  800482:	50340413          	addi	s0,s0,1283 # 800981 <error_string+0x1a1>
  800486:	8532                	mv	a0,a2
  800488:	85e6                	mv	a1,s9
  80048a:	e032                	sd	a2,0(sp)
  80048c:	e43e                	sd	a5,8(sp)
  80048e:	0ae000ef          	jal	ra,80053c <strnlen>
  800492:	40ad8dbb          	subw	s11,s11,a0
  800496:	6602                	ld	a2,0(sp)
  800498:	01b05d63          	blez	s11,8004b2 <vprintfmt+0x2f6>
  80049c:	67a2                	ld	a5,8(sp)
  80049e:	2781                	sext.w	a5,a5
  8004a0:	e43e                	sd	a5,8(sp)
  8004a2:	6522                	ld	a0,8(sp)
  8004a4:	85a6                	mv	a1,s1
  8004a6:	e032                	sd	a2,0(sp)
  8004a8:	3dfd                	addiw	s11,s11,-1
  8004aa:	9902                	jalr	s2
  8004ac:	6602                	ld	a2,0(sp)
  8004ae:	fe0d9ae3          	bnez	s11,8004a2 <vprintfmt+0x2e6>
  8004b2:	00064783          	lbu	a5,0(a2)
  8004b6:	0007851b          	sext.w	a0,a5
  8004ba:	ec0510e3          	bnez	a0,80037a <vprintfmt+0x1be>
  8004be:	bb25                	j	8001f6 <vprintfmt+0x3a>
  8004c0:	000ae603          	lwu	a2,0(s5)
  8004c4:	46a1                	li	a3,8
  8004c6:	8aae                	mv	s5,a1
  8004c8:	bf0d                	j	8003fa <vprintfmt+0x23e>
  8004ca:	000ae603          	lwu	a2,0(s5)
  8004ce:	46a9                	li	a3,10
  8004d0:	8aae                	mv	s5,a1
  8004d2:	b725                	j	8003fa <vprintfmt+0x23e>
  8004d4:	000aa403          	lw	s0,0(s5)
  8004d8:	bd35                	j	800314 <vprintfmt+0x158>
  8004da:	000ae603          	lwu	a2,0(s5)
  8004de:	46c1                	li	a3,16
  8004e0:	8aae                	mv	s5,a1
  8004e2:	bf21                	j	8003fa <vprintfmt+0x23e>
  8004e4:	9902                	jalr	s2
  8004e6:	bd45                	j	800396 <vprintfmt+0x1da>
  8004e8:	85a6                	mv	a1,s1
  8004ea:	02d00513          	li	a0,45
  8004ee:	e03e                	sd	a5,0(sp)
  8004f0:	9902                	jalr	s2
  8004f2:	8ace                	mv	s5,s3
  8004f4:	40800633          	neg	a2,s0
  8004f8:	46a9                	li	a3,10
  8004fa:	6782                	ld	a5,0(sp)
  8004fc:	bdfd                	j	8003fa <vprintfmt+0x23e>
  8004fe:	01b05663          	blez	s11,80050a <vprintfmt+0x34e>
  800502:	02d00693          	li	a3,45
  800506:	f6d798e3          	bne	a5,a3,800476 <vprintfmt+0x2ba>
  80050a:	00000417          	auipc	s0,0x0
  80050e:	47740413          	addi	s0,s0,1143 # 800981 <error_string+0x1a1>
  800512:	02800513          	li	a0,40
  800516:	02800793          	li	a5,40
  80051a:	b585                	j	80037a <vprintfmt+0x1be>

000000000080051c <printfmt>:
  80051c:	715d                	addi	sp,sp,-80
  80051e:	02810313          	addi	t1,sp,40
  800522:	f436                	sd	a3,40(sp)
  800524:	869a                	mv	a3,t1
  800526:	ec06                	sd	ra,24(sp)
  800528:	f83a                	sd	a4,48(sp)
  80052a:	fc3e                	sd	a5,56(sp)
  80052c:	e0c2                	sd	a6,64(sp)
  80052e:	e4c6                	sd	a7,72(sp)
  800530:	e41a                	sd	t1,8(sp)
  800532:	c8bff0ef          	jal	ra,8001bc <vprintfmt>
  800536:	60e2                	ld	ra,24(sp)
  800538:	6161                	addi	sp,sp,80
  80053a:	8082                	ret

000000000080053c <strnlen>:
  80053c:	c185                	beqz	a1,80055c <strnlen+0x20>
  80053e:	00054783          	lbu	a5,0(a0)
  800542:	cf89                	beqz	a5,80055c <strnlen+0x20>
  800544:	4781                	li	a5,0
  800546:	a021                	j	80054e <strnlen+0x12>
  800548:	00074703          	lbu	a4,0(a4)
  80054c:	c711                	beqz	a4,800558 <strnlen+0x1c>
  80054e:	0785                	addi	a5,a5,1
  800550:	00f50733          	add	a4,a0,a5
  800554:	fef59ae3          	bne	a1,a5,800548 <strnlen+0xc>
  800558:	853e                	mv	a0,a5
  80055a:	8082                	ret
  80055c:	4781                	li	a5,0
  80055e:	853e                	mv	a0,a5
  800560:	8082                	ret

0000000000800562 <main>:
  800562:	1101                	addi	sp,sp,-32
  800564:	ec06                	sd	ra,24(sp)
  800566:	e822                	sd	s0,16(sp)
  800568:	bd7ff0ef          	jal	ra,80013e <fork>
  80056c:	c169                	beqz	a0,80062e <main+0xcc>
  80056e:	842a                	mv	s0,a0
  800570:	0aa05063          	blez	a0,800610 <main+0xae>
  800574:	4581                	li	a1,0
  800576:	557d                	li	a0,-1
  800578:	bc9ff0ef          	jal	ra,800140 <waitpid>
  80057c:	c93d                	beqz	a0,8005f2 <main+0x90>
  80057e:	458d                	li	a1,3
  800580:	05fa                	slli	a1,a1,0x1e
  800582:	8522                	mv	a0,s0
  800584:	bbdff0ef          	jal	ra,800140 <waitpid>
  800588:	c531                	beqz	a0,8005d4 <main+0x72>
  80058a:	006c                	addi	a1,sp,12
  80058c:	8522                	mv	a0,s0
  80058e:	bb3ff0ef          	jal	ra,800140 <waitpid>
  800592:	e115                	bnez	a0,8005b6 <main+0x54>
  800594:	4732                	lw	a4,12(sp)
  800596:	67b1                	lui	a5,0xc
  800598:	eaf78793          	addi	a5,a5,-337 # beaf <_start-0x7f4171>
  80059c:	00f71d63          	bne	a4,a5,8005b6 <main+0x54>
  8005a0:	00000517          	auipc	a0,0x0
  8005a4:	4b850513          	addi	a0,a0,1208 # 800a58 <error_string+0x278>
  8005a8:	af9ff0ef          	jal	ra,8000a0 <cprintf>
  8005ac:	60e2                	ld	ra,24(sp)
  8005ae:	6442                	ld	s0,16(sp)
  8005b0:	4501                	li	a0,0
  8005b2:	6105                	addi	sp,sp,32
  8005b4:	8082                	ret
  8005b6:	00000697          	auipc	a3,0x0
  8005ba:	46a68693          	addi	a3,a3,1130 # 800a20 <error_string+0x240>
  8005be:	00000617          	auipc	a2,0x0
  8005c2:	3fa60613          	addi	a2,a2,1018 # 8009b8 <error_string+0x1d8>
  8005c6:	45c9                	li	a1,18
  8005c8:	00000517          	auipc	a0,0x0
  8005cc:	40850513          	addi	a0,a0,1032 # 8009d0 <error_string+0x1f0>
  8005d0:	a57ff0ef          	jal	ra,800026 <__panic>
  8005d4:	00000697          	auipc	a3,0x0
  8005d8:	42468693          	addi	a3,a3,1060 # 8009f8 <error_string+0x218>
  8005dc:	00000617          	auipc	a2,0x0
  8005e0:	3dc60613          	addi	a2,a2,988 # 8009b8 <error_string+0x1d8>
  8005e4:	45c5                	li	a1,17
  8005e6:	00000517          	auipc	a0,0x0
  8005ea:	3ea50513          	addi	a0,a0,1002 # 8009d0 <error_string+0x1f0>
  8005ee:	a39ff0ef          	jal	ra,800026 <__panic>
  8005f2:	00000697          	auipc	a3,0x0
  8005f6:	3ee68693          	addi	a3,a3,1006 # 8009e0 <error_string+0x200>
  8005fa:	00000617          	auipc	a2,0x0
  8005fe:	3be60613          	addi	a2,a2,958 # 8009b8 <error_string+0x1d8>
  800602:	45c1                	li	a1,16
  800604:	00000517          	auipc	a0,0x0
  800608:	3cc50513          	addi	a0,a0,972 # 8009d0 <error_string+0x1f0>
  80060c:	a1bff0ef          	jal	ra,800026 <__panic>
  800610:	00000697          	auipc	a3,0x0
  800614:	3a068693          	addi	a3,a3,928 # 8009b0 <error_string+0x1d0>
  800618:	00000617          	auipc	a2,0x0
  80061c:	3a060613          	addi	a2,a2,928 # 8009b8 <error_string+0x1d8>
  800620:	45bd                	li	a1,15
  800622:	00000517          	auipc	a0,0x0
  800626:	3ae50513          	addi	a0,a0,942 # 8009d0 <error_string+0x1f0>
  80062a:	9fdff0ef          	jal	ra,800026 <__panic>
  80062e:	00000517          	auipc	a0,0x0
  800632:	37250513          	addi	a0,a0,882 # 8009a0 <error_string+0x1c0>
  800636:	a6bff0ef          	jal	ra,8000a0 <cprintf>
  80063a:	4429                	li	s0,10
  80063c:	347d                	addiw	s0,s0,-1
  80063e:	b05ff0ef          	jal	ra,800142 <yield>
  800642:	fc6d                	bnez	s0,80063c <main+0xda>
  800644:	6531                	lui	a0,0xc
  800646:	eaf50513          	addi	a0,a0,-337 # beaf <_start-0x7f4171>
  80064a:	adfff0ef          	jal	ra,800128 <exit>
