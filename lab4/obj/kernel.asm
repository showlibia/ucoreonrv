
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c02092b7          	lui	t0,0xc0209
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c0209137          	lui	sp,0xc0209
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	0000a517          	auipc	a0,0xa
ffffffffc0200036:	02650513          	addi	a0,a0,38 # ffffffffc020a058 <buf>
ffffffffc020003a:	00015617          	auipc	a2,0x15
ffffffffc020003e:	58e60613          	addi	a2,a2,1422 # ffffffffc02155c8 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16 # ffffffffc0208ff0 <bootstack+0x1ff0>
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	772040ef          	jal	ffffffffc02047bc <memset>
ffffffffc020004e:	494000ef          	jal	ffffffffc02004e2 <cons_init>
ffffffffc0200052:	00004597          	auipc	a1,0x4
ffffffffc0200056:	79658593          	addi	a1,a1,1942 # ffffffffc02047e8 <etext+0x2>
ffffffffc020005a:	00004517          	auipc	a0,0x4
ffffffffc020005e:	7ae50513          	addi	a0,a0,1966 # ffffffffc0204808 <etext+0x22>
ffffffffc0200062:	11e000ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200066:	160000ef          	jal	ffffffffc02001c6 <print_kerninfo>
ffffffffc020006a:	67d010ef          	jal	ffffffffc0201ee6 <pmm_init>
ffffffffc020006e:	548000ef          	jal	ffffffffc02005b6 <pic_init>
ffffffffc0200072:	5b6000ef          	jal	ffffffffc0200628 <idt_init>
ffffffffc0200076:	6d4030ef          	jal	ffffffffc020374a <vmm_init>
ffffffffc020007a:	7a1030ef          	jal	ffffffffc020401a <proc_init>
ffffffffc020007e:	4d6000ef          	jal	ffffffffc0200554 <ide_init>
ffffffffc0200082:	0d9020ef          	jal	ffffffffc020295a <swap_init>
ffffffffc0200086:	40a000ef          	jal	ffffffffc0200490 <clock_init>
ffffffffc020008a:	520000ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc020008e:	182040ef          	jal	ffffffffc0204210 <cpu_idle>

ffffffffc0200092 <readline>:
ffffffffc0200092:	715d                	addi	sp,sp,-80
ffffffffc0200094:	e486                	sd	ra,72(sp)
ffffffffc0200096:	e0a2                	sd	s0,64(sp)
ffffffffc0200098:	fc26                	sd	s1,56(sp)
ffffffffc020009a:	f84a                	sd	s2,48(sp)
ffffffffc020009c:	f44e                	sd	s3,40(sp)
ffffffffc020009e:	f052                	sd	s4,32(sp)
ffffffffc02000a0:	ec56                	sd	s5,24(sp)
ffffffffc02000a2:	e85a                	sd	s6,16(sp)
ffffffffc02000a4:	c901                	beqz	a0,ffffffffc02000b4 <readline+0x22>
ffffffffc02000a6:	85aa                	mv	a1,a0
ffffffffc02000a8:	00004517          	auipc	a0,0x4
ffffffffc02000ac:	76850513          	addi	a0,a0,1896 # ffffffffc0204810 <etext+0x2a>
ffffffffc02000b0:	0d0000ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02000b4:	4401                	li	s0,0
ffffffffc02000b6:	44fd                	li	s1,31
ffffffffc02000b8:	4921                	li	s2,8
ffffffffc02000ba:	4a29                	li	s4,10
ffffffffc02000bc:	4ab5                	li	s5,13
ffffffffc02000be:	0000ab17          	auipc	s6,0xa
ffffffffc02000c2:	f9ab0b13          	addi	s6,s6,-102 # ffffffffc020a058 <buf>
ffffffffc02000c6:	3fe00993          	li	s3,1022
ffffffffc02000ca:	0ec000ef          	jal	ffffffffc02001b6 <getchar>
ffffffffc02000ce:	00054a63          	bltz	a0,ffffffffc02000e2 <readline+0x50>
ffffffffc02000d2:	00a4da63          	bge	s1,a0,ffffffffc02000e6 <readline+0x54>
ffffffffc02000d6:	0289d263          	bge	s3,s0,ffffffffc02000fa <readline+0x68>
ffffffffc02000da:	0dc000ef          	jal	ffffffffc02001b6 <getchar>
ffffffffc02000de:	fe055ae3          	bgez	a0,ffffffffc02000d2 <readline+0x40>
ffffffffc02000e2:	4501                	li	a0,0
ffffffffc02000e4:	a091                	j	ffffffffc0200128 <readline+0x96>
ffffffffc02000e6:	03251463          	bne	a0,s2,ffffffffc020010e <readline+0x7c>
ffffffffc02000ea:	04804963          	bgtz	s0,ffffffffc020013c <readline+0xaa>
ffffffffc02000ee:	0c8000ef          	jal	ffffffffc02001b6 <getchar>
ffffffffc02000f2:	fe0548e3          	bltz	a0,ffffffffc02000e2 <readline+0x50>
ffffffffc02000f6:	fea4d8e3          	bge	s1,a0,ffffffffc02000e6 <readline+0x54>
ffffffffc02000fa:	e42a                	sd	a0,8(sp)
ffffffffc02000fc:	0b8000ef          	jal	ffffffffc02001b4 <cputchar>
ffffffffc0200100:	6522                	ld	a0,8(sp)
ffffffffc0200102:	008b07b3          	add	a5,s6,s0
ffffffffc0200106:	2405                	addiw	s0,s0,1
ffffffffc0200108:	00a78023          	sb	a0,0(a5)
ffffffffc020010c:	bf7d                	j	ffffffffc02000ca <readline+0x38>
ffffffffc020010e:	01450463          	beq	a0,s4,ffffffffc0200116 <readline+0x84>
ffffffffc0200112:	fb551ce3          	bne	a0,s5,ffffffffc02000ca <readline+0x38>
ffffffffc0200116:	09e000ef          	jal	ffffffffc02001b4 <cputchar>
ffffffffc020011a:	0000a517          	auipc	a0,0xa
ffffffffc020011e:	f3e50513          	addi	a0,a0,-194 # ffffffffc020a058 <buf>
ffffffffc0200122:	942a                	add	s0,s0,a0
ffffffffc0200124:	00040023          	sb	zero,0(s0)
ffffffffc0200128:	60a6                	ld	ra,72(sp)
ffffffffc020012a:	6406                	ld	s0,64(sp)
ffffffffc020012c:	74e2                	ld	s1,56(sp)
ffffffffc020012e:	7942                	ld	s2,48(sp)
ffffffffc0200130:	79a2                	ld	s3,40(sp)
ffffffffc0200132:	7a02                	ld	s4,32(sp)
ffffffffc0200134:	6ae2                	ld	s5,24(sp)
ffffffffc0200136:	6b42                	ld	s6,16(sp)
ffffffffc0200138:	6161                	addi	sp,sp,80
ffffffffc020013a:	8082                	ret
ffffffffc020013c:	4521                	li	a0,8
ffffffffc020013e:	076000ef          	jal	ffffffffc02001b4 <cputchar>
ffffffffc0200142:	347d                	addiw	s0,s0,-1
ffffffffc0200144:	b759                	j	ffffffffc02000ca <readline+0x38>

ffffffffc0200146 <cputch>:
ffffffffc0200146:	1141                	addi	sp,sp,-16
ffffffffc0200148:	e022                	sd	s0,0(sp)
ffffffffc020014a:	e406                	sd	ra,8(sp)
ffffffffc020014c:	842e                	mv	s0,a1
ffffffffc020014e:	396000ef          	jal	ffffffffc02004e4 <cons_putc>
ffffffffc0200152:	401c                	lw	a5,0(s0)
ffffffffc0200154:	60a2                	ld	ra,8(sp)
ffffffffc0200156:	2785                	addiw	a5,a5,1
ffffffffc0200158:	c01c                	sw	a5,0(s0)
ffffffffc020015a:	6402                	ld	s0,0(sp)
ffffffffc020015c:	0141                	addi	sp,sp,16
ffffffffc020015e:	8082                	ret

ffffffffc0200160 <vcprintf>:
ffffffffc0200160:	1101                	addi	sp,sp,-32
ffffffffc0200162:	862a                	mv	a2,a0
ffffffffc0200164:	86ae                	mv	a3,a1
ffffffffc0200166:	00000517          	auipc	a0,0x0
ffffffffc020016a:	fe050513          	addi	a0,a0,-32 # ffffffffc0200146 <cputch>
ffffffffc020016e:	006c                	addi	a1,sp,12
ffffffffc0200170:	ec06                	sd	ra,24(sp)
ffffffffc0200172:	c602                	sw	zero,12(sp)
ffffffffc0200174:	238040ef          	jal	ffffffffc02043ac <vprintfmt>
ffffffffc0200178:	60e2                	ld	ra,24(sp)
ffffffffc020017a:	4532                	lw	a0,12(sp)
ffffffffc020017c:	6105                	addi	sp,sp,32
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <cprintf>:
ffffffffc0200180:	711d                	addi	sp,sp,-96
ffffffffc0200182:	02810313          	addi	t1,sp,40
ffffffffc0200186:	f42e                	sd	a1,40(sp)
ffffffffc0200188:	f832                	sd	a2,48(sp)
ffffffffc020018a:	fc36                	sd	a3,56(sp)
ffffffffc020018c:	862a                	mv	a2,a0
ffffffffc020018e:	004c                	addi	a1,sp,4
ffffffffc0200190:	00000517          	auipc	a0,0x0
ffffffffc0200194:	fb650513          	addi	a0,a0,-74 # ffffffffc0200146 <cputch>
ffffffffc0200198:	869a                	mv	a3,t1
ffffffffc020019a:	ec06                	sd	ra,24(sp)
ffffffffc020019c:	e0ba                	sd	a4,64(sp)
ffffffffc020019e:	e4be                	sd	a5,72(sp)
ffffffffc02001a0:	e8c2                	sd	a6,80(sp)
ffffffffc02001a2:	ecc6                	sd	a7,88(sp)
ffffffffc02001a4:	e41a                	sd	t1,8(sp)
ffffffffc02001a6:	c202                	sw	zero,4(sp)
ffffffffc02001a8:	204040ef          	jal	ffffffffc02043ac <vprintfmt>
ffffffffc02001ac:	60e2                	ld	ra,24(sp)
ffffffffc02001ae:	4512                	lw	a0,4(sp)
ffffffffc02001b0:	6125                	addi	sp,sp,96
ffffffffc02001b2:	8082                	ret

ffffffffc02001b4 <cputchar>:
ffffffffc02001b4:	ae05                	j	ffffffffc02004e4 <cons_putc>

ffffffffc02001b6 <getchar>:
ffffffffc02001b6:	1141                	addi	sp,sp,-16
ffffffffc02001b8:	e406                	sd	ra,8(sp)
ffffffffc02001ba:	35e000ef          	jal	ffffffffc0200518 <cons_getc>
ffffffffc02001be:	dd75                	beqz	a0,ffffffffc02001ba <getchar+0x4>
ffffffffc02001c0:	60a2                	ld	ra,8(sp)
ffffffffc02001c2:	0141                	addi	sp,sp,16
ffffffffc02001c4:	8082                	ret

ffffffffc02001c6 <print_kerninfo>:
ffffffffc02001c6:	1141                	addi	sp,sp,-16
ffffffffc02001c8:	00004517          	auipc	a0,0x4
ffffffffc02001cc:	65050513          	addi	a0,a0,1616 # ffffffffc0204818 <etext+0x32>
ffffffffc02001d0:	e406                	sd	ra,8(sp)
ffffffffc02001d2:	fafff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02001d6:	00000597          	auipc	a1,0x0
ffffffffc02001da:	e5c58593          	addi	a1,a1,-420 # ffffffffc0200032 <kern_init>
ffffffffc02001de:	00004517          	auipc	a0,0x4
ffffffffc02001e2:	65a50513          	addi	a0,a0,1626 # ffffffffc0204838 <etext+0x52>
ffffffffc02001e6:	f9bff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02001ea:	00004597          	auipc	a1,0x4
ffffffffc02001ee:	5fc58593          	addi	a1,a1,1532 # ffffffffc02047e6 <etext>
ffffffffc02001f2:	00004517          	auipc	a0,0x4
ffffffffc02001f6:	66650513          	addi	a0,a0,1638 # ffffffffc0204858 <etext+0x72>
ffffffffc02001fa:	f87ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02001fe:	0000a597          	auipc	a1,0xa
ffffffffc0200202:	e5a58593          	addi	a1,a1,-422 # ffffffffc020a058 <buf>
ffffffffc0200206:	00004517          	auipc	a0,0x4
ffffffffc020020a:	67250513          	addi	a0,a0,1650 # ffffffffc0204878 <etext+0x92>
ffffffffc020020e:	f73ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200212:	00015597          	auipc	a1,0x15
ffffffffc0200216:	3b658593          	addi	a1,a1,950 # ffffffffc02155c8 <end>
ffffffffc020021a:	00004517          	auipc	a0,0x4
ffffffffc020021e:	67e50513          	addi	a0,a0,1662 # ffffffffc0204898 <etext+0xb2>
ffffffffc0200222:	f5fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200226:	00015797          	auipc	a5,0x15
ffffffffc020022a:	7a178793          	addi	a5,a5,1953 # ffffffffc02159c7 <end+0x3ff>
ffffffffc020022e:	00000717          	auipc	a4,0x0
ffffffffc0200232:	e0470713          	addi	a4,a4,-508 # ffffffffc0200032 <kern_init>
ffffffffc0200236:	8f99                	sub	a5,a5,a4
ffffffffc0200238:	43f7d593          	srai	a1,a5,0x3f
ffffffffc020023c:	60a2                	ld	ra,8(sp)
ffffffffc020023e:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200242:	95be                	add	a1,a1,a5
ffffffffc0200244:	85a9                	srai	a1,a1,0xa
ffffffffc0200246:	00004517          	auipc	a0,0x4
ffffffffc020024a:	67250513          	addi	a0,a0,1650 # ffffffffc02048b8 <etext+0xd2>
ffffffffc020024e:	0141                	addi	sp,sp,16
ffffffffc0200250:	bf05                	j	ffffffffc0200180 <cprintf>

ffffffffc0200252 <print_stackframe>:
ffffffffc0200252:	1141                	addi	sp,sp,-16
ffffffffc0200254:	00004617          	auipc	a2,0x4
ffffffffc0200258:	69460613          	addi	a2,a2,1684 # ffffffffc02048e8 <etext+0x102>
ffffffffc020025c:	05b00593          	li	a1,91
ffffffffc0200260:	00004517          	auipc	a0,0x4
ffffffffc0200264:	6a050513          	addi	a0,a0,1696 # ffffffffc0204900 <etext+0x11a>
ffffffffc0200268:	e406                	sd	ra,8(sp)
ffffffffc020026a:	1c8000ef          	jal	ffffffffc0200432 <__panic>

ffffffffc020026e <mon_help>:
ffffffffc020026e:	1141                	addi	sp,sp,-16
ffffffffc0200270:	00004617          	auipc	a2,0x4
ffffffffc0200274:	6a860613          	addi	a2,a2,1704 # ffffffffc0204918 <etext+0x132>
ffffffffc0200278:	00004597          	auipc	a1,0x4
ffffffffc020027c:	6c058593          	addi	a1,a1,1728 # ffffffffc0204938 <etext+0x152>
ffffffffc0200280:	00004517          	auipc	a0,0x4
ffffffffc0200284:	6c050513          	addi	a0,a0,1728 # ffffffffc0204940 <etext+0x15a>
ffffffffc0200288:	e406                	sd	ra,8(sp)
ffffffffc020028a:	ef7ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020028e:	00004617          	auipc	a2,0x4
ffffffffc0200292:	6c260613          	addi	a2,a2,1730 # ffffffffc0204950 <etext+0x16a>
ffffffffc0200296:	00004597          	auipc	a1,0x4
ffffffffc020029a:	6e258593          	addi	a1,a1,1762 # ffffffffc0204978 <etext+0x192>
ffffffffc020029e:	00004517          	auipc	a0,0x4
ffffffffc02002a2:	6a250513          	addi	a0,a0,1698 # ffffffffc0204940 <etext+0x15a>
ffffffffc02002a6:	edbff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02002aa:	00004617          	auipc	a2,0x4
ffffffffc02002ae:	6de60613          	addi	a2,a2,1758 # ffffffffc0204988 <etext+0x1a2>
ffffffffc02002b2:	00004597          	auipc	a1,0x4
ffffffffc02002b6:	6f658593          	addi	a1,a1,1782 # ffffffffc02049a8 <etext+0x1c2>
ffffffffc02002ba:	00004517          	auipc	a0,0x4
ffffffffc02002be:	68650513          	addi	a0,a0,1670 # ffffffffc0204940 <etext+0x15a>
ffffffffc02002c2:	ebfff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02002c6:	60a2                	ld	ra,8(sp)
ffffffffc02002c8:	4501                	li	a0,0
ffffffffc02002ca:	0141                	addi	sp,sp,16
ffffffffc02002cc:	8082                	ret

ffffffffc02002ce <mon_kerninfo>:
ffffffffc02002ce:	1141                	addi	sp,sp,-16
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	ef5ff0ef          	jal	ffffffffc02001c6 <print_kerninfo>
ffffffffc02002d6:	60a2                	ld	ra,8(sp)
ffffffffc02002d8:	4501                	li	a0,0
ffffffffc02002da:	0141                	addi	sp,sp,16
ffffffffc02002dc:	8082                	ret

ffffffffc02002de <mon_backtrace>:
ffffffffc02002de:	1141                	addi	sp,sp,-16
ffffffffc02002e0:	e406                	sd	ra,8(sp)
ffffffffc02002e2:	f71ff0ef          	jal	ffffffffc0200252 <print_stackframe>
ffffffffc02002e6:	60a2                	ld	ra,8(sp)
ffffffffc02002e8:	4501                	li	a0,0
ffffffffc02002ea:	0141                	addi	sp,sp,16
ffffffffc02002ec:	8082                	ret

ffffffffc02002ee <kmonitor>:
ffffffffc02002ee:	7115                	addi	sp,sp,-224
ffffffffc02002f0:	f15a                	sd	s6,160(sp)
ffffffffc02002f2:	8b2a                	mv	s6,a0
ffffffffc02002f4:	00004517          	auipc	a0,0x4
ffffffffc02002f8:	6c450513          	addi	a0,a0,1732 # ffffffffc02049b8 <etext+0x1d2>
ffffffffc02002fc:	ed86                	sd	ra,216(sp)
ffffffffc02002fe:	e9a2                	sd	s0,208(sp)
ffffffffc0200300:	e5a6                	sd	s1,200(sp)
ffffffffc0200302:	e1ca                	sd	s2,192(sp)
ffffffffc0200304:	fd4e                	sd	s3,184(sp)
ffffffffc0200306:	f952                	sd	s4,176(sp)
ffffffffc0200308:	f556                	sd	s5,168(sp)
ffffffffc020030a:	ed5e                	sd	s7,152(sp)
ffffffffc020030c:	e962                	sd	s8,144(sp)
ffffffffc020030e:	e566                	sd	s9,136(sp)
ffffffffc0200310:	e16a                	sd	s10,128(sp)
ffffffffc0200312:	e6fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200316:	00004517          	auipc	a0,0x4
ffffffffc020031a:	6ca50513          	addi	a0,a0,1738 # ffffffffc02049e0 <etext+0x1fa>
ffffffffc020031e:	e63ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200322:	000b0563          	beqz	s6,ffffffffc020032c <kmonitor+0x3e>
ffffffffc0200326:	855a                	mv	a0,s6
ffffffffc0200328:	4e8000ef          	jal	ffffffffc0200810 <print_trapframe>
ffffffffc020032c:	4501                	li	a0,0
ffffffffc020032e:	4581                	li	a1,0
ffffffffc0200330:	4601                	li	a2,0
ffffffffc0200332:	48a1                	li	a7,8
ffffffffc0200334:	00000073          	ecall
ffffffffc0200338:	00006c17          	auipc	s8,0x6
ffffffffc020033c:	2b8c0c13          	addi	s8,s8,696 # ffffffffc02065f0 <commands>
ffffffffc0200340:	00004917          	auipc	s2,0x4
ffffffffc0200344:	6c890913          	addi	s2,s2,1736 # ffffffffc0204a08 <etext+0x222>
ffffffffc0200348:	00004497          	auipc	s1,0x4
ffffffffc020034c:	6c848493          	addi	s1,s1,1736 # ffffffffc0204a10 <etext+0x22a>
ffffffffc0200350:	49bd                	li	s3,15
ffffffffc0200352:	00004a97          	auipc	s5,0x4
ffffffffc0200356:	6c6a8a93          	addi	s5,s5,1734 # ffffffffc0204a18 <etext+0x232>
ffffffffc020035a:	4a0d                	li	s4,3
ffffffffc020035c:	00004b97          	auipc	s7,0x4
ffffffffc0200360:	6dcb8b93          	addi	s7,s7,1756 # ffffffffc0204a38 <etext+0x252>
ffffffffc0200364:	854a                	mv	a0,s2
ffffffffc0200366:	d2dff0ef          	jal	ffffffffc0200092 <readline>
ffffffffc020036a:	842a                	mv	s0,a0
ffffffffc020036c:	dd65                	beqz	a0,ffffffffc0200364 <kmonitor+0x76>
ffffffffc020036e:	00054583          	lbu	a1,0(a0)
ffffffffc0200372:	4c81                	li	s9,0
ffffffffc0200374:	e59d                	bnez	a1,ffffffffc02003a2 <kmonitor+0xb4>
ffffffffc0200376:	fe0c87e3          	beqz	s9,ffffffffc0200364 <kmonitor+0x76>
ffffffffc020037a:	00006d17          	auipc	s10,0x6
ffffffffc020037e:	276d0d13          	addi	s10,s10,630 # ffffffffc02065f0 <commands>
ffffffffc0200382:	4401                	li	s0,0
ffffffffc0200384:	6582                	ld	a1,0(sp)
ffffffffc0200386:	000d3503          	ld	a0,0(s10)
ffffffffc020038a:	3e4040ef          	jal	ffffffffc020476e <strcmp>
ffffffffc020038e:	c53d                	beqz	a0,ffffffffc02003fc <kmonitor+0x10e>
ffffffffc0200390:	2405                	addiw	s0,s0,1
ffffffffc0200392:	0d61                	addi	s10,s10,24
ffffffffc0200394:	ff4418e3          	bne	s0,s4,ffffffffc0200384 <kmonitor+0x96>
ffffffffc0200398:	6582                	ld	a1,0(sp)
ffffffffc020039a:	855e                	mv	a0,s7
ffffffffc020039c:	de5ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02003a0:	b7d1                	j	ffffffffc0200364 <kmonitor+0x76>
ffffffffc02003a2:	8526                	mv	a0,s1
ffffffffc02003a4:	402040ef          	jal	ffffffffc02047a6 <strchr>
ffffffffc02003a8:	c901                	beqz	a0,ffffffffc02003b8 <kmonitor+0xca>
ffffffffc02003aa:	00144583          	lbu	a1,1(s0)
ffffffffc02003ae:	00040023          	sb	zero,0(s0)
ffffffffc02003b2:	0405                	addi	s0,s0,1
ffffffffc02003b4:	d1e9                	beqz	a1,ffffffffc0200376 <kmonitor+0x88>
ffffffffc02003b6:	b7f5                	j	ffffffffc02003a2 <kmonitor+0xb4>
ffffffffc02003b8:	00044783          	lbu	a5,0(s0)
ffffffffc02003bc:	dfcd                	beqz	a5,ffffffffc0200376 <kmonitor+0x88>
ffffffffc02003be:	033c8a63          	beq	s9,s3,ffffffffc02003f2 <kmonitor+0x104>
ffffffffc02003c2:	003c9793          	slli	a5,s9,0x3
ffffffffc02003c6:	08078793          	addi	a5,a5,128
ffffffffc02003ca:	978a                	add	a5,a5,sp
ffffffffc02003cc:	f887b023          	sd	s0,-128(a5)
ffffffffc02003d0:	00044583          	lbu	a1,0(s0)
ffffffffc02003d4:	2c85                	addiw	s9,s9,1
ffffffffc02003d6:	e591                	bnez	a1,ffffffffc02003e2 <kmonitor+0xf4>
ffffffffc02003d8:	bf79                	j	ffffffffc0200376 <kmonitor+0x88>
ffffffffc02003da:	00144583          	lbu	a1,1(s0)
ffffffffc02003de:	0405                	addi	s0,s0,1
ffffffffc02003e0:	d9d9                	beqz	a1,ffffffffc0200376 <kmonitor+0x88>
ffffffffc02003e2:	8526                	mv	a0,s1
ffffffffc02003e4:	3c2040ef          	jal	ffffffffc02047a6 <strchr>
ffffffffc02003e8:	d96d                	beqz	a0,ffffffffc02003da <kmonitor+0xec>
ffffffffc02003ea:	00044583          	lbu	a1,0(s0)
ffffffffc02003ee:	d5c1                	beqz	a1,ffffffffc0200376 <kmonitor+0x88>
ffffffffc02003f0:	bf4d                	j	ffffffffc02003a2 <kmonitor+0xb4>
ffffffffc02003f2:	45c1                	li	a1,16
ffffffffc02003f4:	8556                	mv	a0,s5
ffffffffc02003f6:	d8bff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02003fa:	b7e1                	j	ffffffffc02003c2 <kmonitor+0xd4>
ffffffffc02003fc:	00141793          	slli	a5,s0,0x1
ffffffffc0200400:	97a2                	add	a5,a5,s0
ffffffffc0200402:	078e                	slli	a5,a5,0x3
ffffffffc0200404:	97e2                	add	a5,a5,s8
ffffffffc0200406:	6b9c                	ld	a5,16(a5)
ffffffffc0200408:	865a                	mv	a2,s6
ffffffffc020040a:	002c                	addi	a1,sp,8
ffffffffc020040c:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200410:	9782                	jalr	a5
ffffffffc0200412:	f40559e3          	bgez	a0,ffffffffc0200364 <kmonitor+0x76>
ffffffffc0200416:	60ee                	ld	ra,216(sp)
ffffffffc0200418:	644e                	ld	s0,208(sp)
ffffffffc020041a:	64ae                	ld	s1,200(sp)
ffffffffc020041c:	690e                	ld	s2,192(sp)
ffffffffc020041e:	79ea                	ld	s3,184(sp)
ffffffffc0200420:	7a4a                	ld	s4,176(sp)
ffffffffc0200422:	7aaa                	ld	s5,168(sp)
ffffffffc0200424:	7b0a                	ld	s6,160(sp)
ffffffffc0200426:	6bea                	ld	s7,152(sp)
ffffffffc0200428:	6c4a                	ld	s8,144(sp)
ffffffffc020042a:	6caa                	ld	s9,136(sp)
ffffffffc020042c:	6d0a                	ld	s10,128(sp)
ffffffffc020042e:	612d                	addi	sp,sp,224
ffffffffc0200430:	8082                	ret

ffffffffc0200432 <__panic>:
ffffffffc0200432:	00015317          	auipc	t1,0x15
ffffffffc0200436:	0fe30313          	addi	t1,t1,254 # ffffffffc0215530 <is_panic>
ffffffffc020043a:	00032e03          	lw	t3,0(t1)
ffffffffc020043e:	715d                	addi	sp,sp,-80
ffffffffc0200440:	ec06                	sd	ra,24(sp)
ffffffffc0200442:	f436                	sd	a3,40(sp)
ffffffffc0200444:	f83a                	sd	a4,48(sp)
ffffffffc0200446:	fc3e                	sd	a5,56(sp)
ffffffffc0200448:	e0c2                	sd	a6,64(sp)
ffffffffc020044a:	e4c6                	sd	a7,72(sp)
ffffffffc020044c:	020e1c63          	bnez	t3,ffffffffc0200484 <__panic+0x52>
ffffffffc0200450:	4785                	li	a5,1
ffffffffc0200452:	00f32023          	sw	a5,0(t1)
ffffffffc0200456:	e822                	sd	s0,16(sp)
ffffffffc0200458:	103c                	addi	a5,sp,40
ffffffffc020045a:	8432                	mv	s0,a2
ffffffffc020045c:	862e                	mv	a2,a1
ffffffffc020045e:	85aa                	mv	a1,a0
ffffffffc0200460:	00004517          	auipc	a0,0x4
ffffffffc0200464:	5f050513          	addi	a0,a0,1520 # ffffffffc0204a50 <etext+0x26a>
ffffffffc0200468:	e43e                	sd	a5,8(sp)
ffffffffc020046a:	d17ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020046e:	65a2                	ld	a1,8(sp)
ffffffffc0200470:	8522                	mv	a0,s0
ffffffffc0200472:	cefff0ef          	jal	ffffffffc0200160 <vcprintf>
ffffffffc0200476:	00004517          	auipc	a0,0x4
ffffffffc020047a:	5fa50513          	addi	a0,a0,1530 # ffffffffc0204a70 <etext+0x28a>
ffffffffc020047e:	d03ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200482:	6442                	ld	s0,16(sp)
ffffffffc0200484:	12c000ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0200488:	4501                	li	a0,0
ffffffffc020048a:	e65ff0ef          	jal	ffffffffc02002ee <kmonitor>
ffffffffc020048e:	bfed                	j	ffffffffc0200488 <__panic+0x56>

ffffffffc0200490 <clock_init>:
ffffffffc0200490:	67e1                	lui	a5,0x18
ffffffffc0200492:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc0200496:	00015717          	auipc	a4,0x15
ffffffffc020049a:	0af73123          	sd	a5,162(a4) # ffffffffc0215538 <timebase>
ffffffffc020049e:	c0102573          	rdtime	a0
ffffffffc02004a2:	4581                	li	a1,0
ffffffffc02004a4:	953e                	add	a0,a0,a5
ffffffffc02004a6:	4601                	li	a2,0
ffffffffc02004a8:	4881                	li	a7,0
ffffffffc02004aa:	00000073          	ecall
ffffffffc02004ae:	02000793          	li	a5,32
ffffffffc02004b2:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc02004b6:	00004517          	auipc	a0,0x4
ffffffffc02004ba:	5c250513          	addi	a0,a0,1474 # ffffffffc0204a78 <etext+0x292>
ffffffffc02004be:	00015797          	auipc	a5,0x15
ffffffffc02004c2:	0807b123          	sd	zero,130(a5) # ffffffffc0215540 <ticks>
ffffffffc02004c6:	b96d                	j	ffffffffc0200180 <cprintf>

ffffffffc02004c8 <clock_set_next_event>:
ffffffffc02004c8:	c0102573          	rdtime	a0
ffffffffc02004cc:	00015797          	auipc	a5,0x15
ffffffffc02004d0:	06c7b783          	ld	a5,108(a5) # ffffffffc0215538 <timebase>
ffffffffc02004d4:	953e                	add	a0,a0,a5
ffffffffc02004d6:	4581                	li	a1,0
ffffffffc02004d8:	4601                	li	a2,0
ffffffffc02004da:	4881                	li	a7,0
ffffffffc02004dc:	00000073          	ecall
ffffffffc02004e0:	8082                	ret

ffffffffc02004e2 <cons_init>:
ffffffffc02004e2:	8082                	ret

ffffffffc02004e4 <cons_putc>:
ffffffffc02004e4:	100027f3          	csrr	a5,sstatus
ffffffffc02004e8:	8b89                	andi	a5,a5,2
ffffffffc02004ea:	0ff57513          	zext.b	a0,a0
ffffffffc02004ee:	e799                	bnez	a5,ffffffffc02004fc <cons_putc+0x18>
ffffffffc02004f0:	4581                	li	a1,0
ffffffffc02004f2:	4601                	li	a2,0
ffffffffc02004f4:	4885                	li	a7,1
ffffffffc02004f6:	00000073          	ecall
ffffffffc02004fa:	8082                	ret
ffffffffc02004fc:	1101                	addi	sp,sp,-32
ffffffffc02004fe:	ec06                	sd	ra,24(sp)
ffffffffc0200500:	e42a                	sd	a0,8(sp)
ffffffffc0200502:	0ae000ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0200506:	6522                	ld	a0,8(sp)
ffffffffc0200508:	4581                	li	a1,0
ffffffffc020050a:	4601                	li	a2,0
ffffffffc020050c:	4885                	li	a7,1
ffffffffc020050e:	00000073          	ecall
ffffffffc0200512:	60e2                	ld	ra,24(sp)
ffffffffc0200514:	6105                	addi	sp,sp,32
ffffffffc0200516:	a851                	j	ffffffffc02005aa <intr_enable>

ffffffffc0200518 <cons_getc>:
ffffffffc0200518:	100027f3          	csrr	a5,sstatus
ffffffffc020051c:	8b89                	andi	a5,a5,2
ffffffffc020051e:	eb89                	bnez	a5,ffffffffc0200530 <cons_getc+0x18>
ffffffffc0200520:	4501                	li	a0,0
ffffffffc0200522:	4581                	li	a1,0
ffffffffc0200524:	4601                	li	a2,0
ffffffffc0200526:	4889                	li	a7,2
ffffffffc0200528:	00000073          	ecall
ffffffffc020052c:	2501                	sext.w	a0,a0
ffffffffc020052e:	8082                	ret
ffffffffc0200530:	1101                	addi	sp,sp,-32
ffffffffc0200532:	ec06                	sd	ra,24(sp)
ffffffffc0200534:	07c000ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0200538:	4501                	li	a0,0
ffffffffc020053a:	4581                	li	a1,0
ffffffffc020053c:	4601                	li	a2,0
ffffffffc020053e:	4889                	li	a7,2
ffffffffc0200540:	00000073          	ecall
ffffffffc0200544:	2501                	sext.w	a0,a0
ffffffffc0200546:	e42a                	sd	a0,8(sp)
ffffffffc0200548:	062000ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc020054c:	60e2                	ld	ra,24(sp)
ffffffffc020054e:	6522                	ld	a0,8(sp)
ffffffffc0200550:	6105                	addi	sp,sp,32
ffffffffc0200552:	8082                	ret

ffffffffc0200554 <ide_init>:
ffffffffc0200554:	8082                	ret

ffffffffc0200556 <ide_device_valid>:
ffffffffc0200556:	00253513          	sltiu	a0,a0,2
ffffffffc020055a:	8082                	ret

ffffffffc020055c <ide_device_size>:
ffffffffc020055c:	03800513          	li	a0,56
ffffffffc0200560:	8082                	ret

ffffffffc0200562 <ide_read_secs>:
ffffffffc0200562:	0000a797          	auipc	a5,0xa
ffffffffc0200566:	ef678793          	addi	a5,a5,-266 # ffffffffc020a458 <ide>
ffffffffc020056a:	0095959b          	slliw	a1,a1,0x9
ffffffffc020056e:	1141                	addi	sp,sp,-16
ffffffffc0200570:	8532                	mv	a0,a2
ffffffffc0200572:	95be                	add	a1,a1,a5
ffffffffc0200574:	00969613          	slli	a2,a3,0x9
ffffffffc0200578:	e406                	sd	ra,8(sp)
ffffffffc020057a:	254040ef          	jal	ffffffffc02047ce <memcpy>
ffffffffc020057e:	60a2                	ld	ra,8(sp)
ffffffffc0200580:	4501                	li	a0,0
ffffffffc0200582:	0141                	addi	sp,sp,16
ffffffffc0200584:	8082                	ret

ffffffffc0200586 <ide_write_secs>:
ffffffffc0200586:	0095979b          	slliw	a5,a1,0x9
ffffffffc020058a:	0000a517          	auipc	a0,0xa
ffffffffc020058e:	ece50513          	addi	a0,a0,-306 # ffffffffc020a458 <ide>
ffffffffc0200592:	1141                	addi	sp,sp,-16
ffffffffc0200594:	85b2                	mv	a1,a2
ffffffffc0200596:	953e                	add	a0,a0,a5
ffffffffc0200598:	00969613          	slli	a2,a3,0x9
ffffffffc020059c:	e406                	sd	ra,8(sp)
ffffffffc020059e:	230040ef          	jal	ffffffffc02047ce <memcpy>
ffffffffc02005a2:	60a2                	ld	ra,8(sp)
ffffffffc02005a4:	4501                	li	a0,0
ffffffffc02005a6:	0141                	addi	sp,sp,16
ffffffffc02005a8:	8082                	ret

ffffffffc02005aa <intr_enable>:
ffffffffc02005aa:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc02005ae:	8082                	ret

ffffffffc02005b0 <intr_disable>:
ffffffffc02005b0:	100177f3          	csrrci	a5,sstatus,2
ffffffffc02005b4:	8082                	ret

ffffffffc02005b6 <pic_init>:
ffffffffc02005b6:	8082                	ret

ffffffffc02005b8 <pgfault_handler>:
ffffffffc02005b8:	10053783          	ld	a5,256(a0)
ffffffffc02005bc:	1141                	addi	sp,sp,-16
ffffffffc02005be:	e022                	sd	s0,0(sp)
ffffffffc02005c0:	e406                	sd	ra,8(sp)
ffffffffc02005c2:	1007f793          	andi	a5,a5,256
ffffffffc02005c6:	11053583          	ld	a1,272(a0)
ffffffffc02005ca:	842a                	mv	s0,a0
ffffffffc02005cc:	04b00613          	li	a2,75
ffffffffc02005d0:	e399                	bnez	a5,ffffffffc02005d6 <pgfault_handler+0x1e>
ffffffffc02005d2:	05500613          	li	a2,85
ffffffffc02005d6:	11843703          	ld	a4,280(s0)
ffffffffc02005da:	47bd                	li	a5,15
ffffffffc02005dc:	05200693          	li	a3,82
ffffffffc02005e0:	00f71463          	bne	a4,a5,ffffffffc02005e8 <pgfault_handler+0x30>
ffffffffc02005e4:	05700693          	li	a3,87
ffffffffc02005e8:	00004517          	auipc	a0,0x4
ffffffffc02005ec:	4b050513          	addi	a0,a0,1200 # ffffffffc0204a98 <etext+0x2b2>
ffffffffc02005f0:	b91ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02005f4:	00015517          	auipc	a0,0x15
ffffffffc02005f8:	fac53503          	ld	a0,-84(a0) # ffffffffc02155a0 <check_mm_struct>
ffffffffc02005fc:	c911                	beqz	a0,ffffffffc0200610 <pgfault_handler+0x58>
ffffffffc02005fe:	11043603          	ld	a2,272(s0)
ffffffffc0200602:	11842583          	lw	a1,280(s0)
ffffffffc0200606:	6402                	ld	s0,0(sp)
ffffffffc0200608:	60a2                	ld	ra,8(sp)
ffffffffc020060a:	0141                	addi	sp,sp,16
ffffffffc020060c:	6b00306f          	j	ffffffffc0203cbc <do_pgfault>
ffffffffc0200610:	00004617          	auipc	a2,0x4
ffffffffc0200614:	4a860613          	addi	a2,a2,1192 # ffffffffc0204ab8 <etext+0x2d2>
ffffffffc0200618:	06200593          	li	a1,98
ffffffffc020061c:	00004517          	auipc	a0,0x4
ffffffffc0200620:	4b450513          	addi	a0,a0,1204 # ffffffffc0204ad0 <etext+0x2ea>
ffffffffc0200624:	e0fff0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0200628 <idt_init>:
ffffffffc0200628:	14005073          	csrwi	sscratch,0
ffffffffc020062c:	00000797          	auipc	a5,0x0
ffffffffc0200630:	49c78793          	addi	a5,a5,1180 # ffffffffc0200ac8 <__alltraps>
ffffffffc0200634:	10579073          	csrw	stvec,a5
ffffffffc0200638:	000407b7          	lui	a5,0x40
ffffffffc020063c:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200640:	8082                	ret

ffffffffc0200642 <print_regs>:
ffffffffc0200642:	610c                	ld	a1,0(a0)
ffffffffc0200644:	1141                	addi	sp,sp,-16
ffffffffc0200646:	e022                	sd	s0,0(sp)
ffffffffc0200648:	842a                	mv	s0,a0
ffffffffc020064a:	00004517          	auipc	a0,0x4
ffffffffc020064e:	49e50513          	addi	a0,a0,1182 # ffffffffc0204ae8 <etext+0x302>
ffffffffc0200652:	e406                	sd	ra,8(sp)
ffffffffc0200654:	b2dff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200658:	640c                	ld	a1,8(s0)
ffffffffc020065a:	00004517          	auipc	a0,0x4
ffffffffc020065e:	4a650513          	addi	a0,a0,1190 # ffffffffc0204b00 <etext+0x31a>
ffffffffc0200662:	b1fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200666:	680c                	ld	a1,16(s0)
ffffffffc0200668:	00004517          	auipc	a0,0x4
ffffffffc020066c:	4b050513          	addi	a0,a0,1200 # ffffffffc0204b18 <etext+0x332>
ffffffffc0200670:	b11ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200674:	6c0c                	ld	a1,24(s0)
ffffffffc0200676:	00004517          	auipc	a0,0x4
ffffffffc020067a:	4ba50513          	addi	a0,a0,1210 # ffffffffc0204b30 <etext+0x34a>
ffffffffc020067e:	b03ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200682:	700c                	ld	a1,32(s0)
ffffffffc0200684:	00004517          	auipc	a0,0x4
ffffffffc0200688:	4c450513          	addi	a0,a0,1220 # ffffffffc0204b48 <etext+0x362>
ffffffffc020068c:	af5ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200690:	740c                	ld	a1,40(s0)
ffffffffc0200692:	00004517          	auipc	a0,0x4
ffffffffc0200696:	4ce50513          	addi	a0,a0,1230 # ffffffffc0204b60 <etext+0x37a>
ffffffffc020069a:	ae7ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020069e:	780c                	ld	a1,48(s0)
ffffffffc02006a0:	00004517          	auipc	a0,0x4
ffffffffc02006a4:	4d850513          	addi	a0,a0,1240 # ffffffffc0204b78 <etext+0x392>
ffffffffc02006a8:	ad9ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006ac:	7c0c                	ld	a1,56(s0)
ffffffffc02006ae:	00004517          	auipc	a0,0x4
ffffffffc02006b2:	4e250513          	addi	a0,a0,1250 # ffffffffc0204b90 <etext+0x3aa>
ffffffffc02006b6:	acbff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006ba:	602c                	ld	a1,64(s0)
ffffffffc02006bc:	00004517          	auipc	a0,0x4
ffffffffc02006c0:	4ec50513          	addi	a0,a0,1260 # ffffffffc0204ba8 <etext+0x3c2>
ffffffffc02006c4:	abdff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006c8:	642c                	ld	a1,72(s0)
ffffffffc02006ca:	00004517          	auipc	a0,0x4
ffffffffc02006ce:	4f650513          	addi	a0,a0,1270 # ffffffffc0204bc0 <etext+0x3da>
ffffffffc02006d2:	aafff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006d6:	682c                	ld	a1,80(s0)
ffffffffc02006d8:	00004517          	auipc	a0,0x4
ffffffffc02006dc:	50050513          	addi	a0,a0,1280 # ffffffffc0204bd8 <etext+0x3f2>
ffffffffc02006e0:	aa1ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006e4:	6c2c                	ld	a1,88(s0)
ffffffffc02006e6:	00004517          	auipc	a0,0x4
ffffffffc02006ea:	50a50513          	addi	a0,a0,1290 # ffffffffc0204bf0 <etext+0x40a>
ffffffffc02006ee:	a93ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006f2:	702c                	ld	a1,96(s0)
ffffffffc02006f4:	00004517          	auipc	a0,0x4
ffffffffc02006f8:	51450513          	addi	a0,a0,1300 # ffffffffc0204c08 <etext+0x422>
ffffffffc02006fc:	a85ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200700:	742c                	ld	a1,104(s0)
ffffffffc0200702:	00004517          	auipc	a0,0x4
ffffffffc0200706:	51e50513          	addi	a0,a0,1310 # ffffffffc0204c20 <etext+0x43a>
ffffffffc020070a:	a77ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020070e:	782c                	ld	a1,112(s0)
ffffffffc0200710:	00004517          	auipc	a0,0x4
ffffffffc0200714:	52850513          	addi	a0,a0,1320 # ffffffffc0204c38 <etext+0x452>
ffffffffc0200718:	a69ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020071c:	7c2c                	ld	a1,120(s0)
ffffffffc020071e:	00004517          	auipc	a0,0x4
ffffffffc0200722:	53250513          	addi	a0,a0,1330 # ffffffffc0204c50 <etext+0x46a>
ffffffffc0200726:	a5bff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020072a:	604c                	ld	a1,128(s0)
ffffffffc020072c:	00004517          	auipc	a0,0x4
ffffffffc0200730:	53c50513          	addi	a0,a0,1340 # ffffffffc0204c68 <etext+0x482>
ffffffffc0200734:	a4dff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200738:	644c                	ld	a1,136(s0)
ffffffffc020073a:	00004517          	auipc	a0,0x4
ffffffffc020073e:	54650513          	addi	a0,a0,1350 # ffffffffc0204c80 <etext+0x49a>
ffffffffc0200742:	a3fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200746:	684c                	ld	a1,144(s0)
ffffffffc0200748:	00004517          	auipc	a0,0x4
ffffffffc020074c:	55050513          	addi	a0,a0,1360 # ffffffffc0204c98 <etext+0x4b2>
ffffffffc0200750:	a31ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200754:	6c4c                	ld	a1,152(s0)
ffffffffc0200756:	00004517          	auipc	a0,0x4
ffffffffc020075a:	55a50513          	addi	a0,a0,1370 # ffffffffc0204cb0 <etext+0x4ca>
ffffffffc020075e:	a23ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200762:	704c                	ld	a1,160(s0)
ffffffffc0200764:	00004517          	auipc	a0,0x4
ffffffffc0200768:	56450513          	addi	a0,a0,1380 # ffffffffc0204cc8 <etext+0x4e2>
ffffffffc020076c:	a15ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200770:	744c                	ld	a1,168(s0)
ffffffffc0200772:	00004517          	auipc	a0,0x4
ffffffffc0200776:	56e50513          	addi	a0,a0,1390 # ffffffffc0204ce0 <etext+0x4fa>
ffffffffc020077a:	a07ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020077e:	784c                	ld	a1,176(s0)
ffffffffc0200780:	00004517          	auipc	a0,0x4
ffffffffc0200784:	57850513          	addi	a0,a0,1400 # ffffffffc0204cf8 <etext+0x512>
ffffffffc0200788:	9f9ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020078c:	7c4c                	ld	a1,184(s0)
ffffffffc020078e:	00004517          	auipc	a0,0x4
ffffffffc0200792:	58250513          	addi	a0,a0,1410 # ffffffffc0204d10 <etext+0x52a>
ffffffffc0200796:	9ebff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020079a:	606c                	ld	a1,192(s0)
ffffffffc020079c:	00004517          	auipc	a0,0x4
ffffffffc02007a0:	58c50513          	addi	a0,a0,1420 # ffffffffc0204d28 <etext+0x542>
ffffffffc02007a4:	9ddff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007a8:	646c                	ld	a1,200(s0)
ffffffffc02007aa:	00004517          	auipc	a0,0x4
ffffffffc02007ae:	59650513          	addi	a0,a0,1430 # ffffffffc0204d40 <etext+0x55a>
ffffffffc02007b2:	9cfff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007b6:	686c                	ld	a1,208(s0)
ffffffffc02007b8:	00004517          	auipc	a0,0x4
ffffffffc02007bc:	5a050513          	addi	a0,a0,1440 # ffffffffc0204d58 <etext+0x572>
ffffffffc02007c0:	9c1ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007c4:	6c6c                	ld	a1,216(s0)
ffffffffc02007c6:	00004517          	auipc	a0,0x4
ffffffffc02007ca:	5aa50513          	addi	a0,a0,1450 # ffffffffc0204d70 <etext+0x58a>
ffffffffc02007ce:	9b3ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007d2:	706c                	ld	a1,224(s0)
ffffffffc02007d4:	00004517          	auipc	a0,0x4
ffffffffc02007d8:	5b450513          	addi	a0,a0,1460 # ffffffffc0204d88 <etext+0x5a2>
ffffffffc02007dc:	9a5ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007e0:	746c                	ld	a1,232(s0)
ffffffffc02007e2:	00004517          	auipc	a0,0x4
ffffffffc02007e6:	5be50513          	addi	a0,a0,1470 # ffffffffc0204da0 <etext+0x5ba>
ffffffffc02007ea:	997ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007ee:	786c                	ld	a1,240(s0)
ffffffffc02007f0:	00004517          	auipc	a0,0x4
ffffffffc02007f4:	5c850513          	addi	a0,a0,1480 # ffffffffc0204db8 <etext+0x5d2>
ffffffffc02007f8:	989ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007fc:	7c6c                	ld	a1,248(s0)
ffffffffc02007fe:	6402                	ld	s0,0(sp)
ffffffffc0200800:	60a2                	ld	ra,8(sp)
ffffffffc0200802:	00004517          	auipc	a0,0x4
ffffffffc0200806:	5ce50513          	addi	a0,a0,1486 # ffffffffc0204dd0 <etext+0x5ea>
ffffffffc020080a:	0141                	addi	sp,sp,16
ffffffffc020080c:	975ff06f          	j	ffffffffc0200180 <cprintf>

ffffffffc0200810 <print_trapframe>:
ffffffffc0200810:	1141                	addi	sp,sp,-16
ffffffffc0200812:	e022                	sd	s0,0(sp)
ffffffffc0200814:	85aa                	mv	a1,a0
ffffffffc0200816:	842a                	mv	s0,a0
ffffffffc0200818:	00004517          	auipc	a0,0x4
ffffffffc020081c:	5d050513          	addi	a0,a0,1488 # ffffffffc0204de8 <etext+0x602>
ffffffffc0200820:	e406                	sd	ra,8(sp)
ffffffffc0200822:	95fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200826:	8522                	mv	a0,s0
ffffffffc0200828:	e1bff0ef          	jal	ffffffffc0200642 <print_regs>
ffffffffc020082c:	10043583          	ld	a1,256(s0)
ffffffffc0200830:	00004517          	auipc	a0,0x4
ffffffffc0200834:	5d050513          	addi	a0,a0,1488 # ffffffffc0204e00 <etext+0x61a>
ffffffffc0200838:	949ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020083c:	10843583          	ld	a1,264(s0)
ffffffffc0200840:	00004517          	auipc	a0,0x4
ffffffffc0200844:	5d850513          	addi	a0,a0,1496 # ffffffffc0204e18 <etext+0x632>
ffffffffc0200848:	939ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020084c:	11043583          	ld	a1,272(s0)
ffffffffc0200850:	00004517          	auipc	a0,0x4
ffffffffc0200854:	5e050513          	addi	a0,a0,1504 # ffffffffc0204e30 <etext+0x64a>
ffffffffc0200858:	929ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020085c:	11843583          	ld	a1,280(s0)
ffffffffc0200860:	6402                	ld	s0,0(sp)
ffffffffc0200862:	60a2                	ld	ra,8(sp)
ffffffffc0200864:	00004517          	auipc	a0,0x4
ffffffffc0200868:	5e450513          	addi	a0,a0,1508 # ffffffffc0204e48 <etext+0x662>
ffffffffc020086c:	0141                	addi	sp,sp,16
ffffffffc020086e:	913ff06f          	j	ffffffffc0200180 <cprintf>

ffffffffc0200872 <interrupt_handler>:
ffffffffc0200872:	11853783          	ld	a5,280(a0)
ffffffffc0200876:	472d                	li	a4,11
ffffffffc0200878:	0786                	slli	a5,a5,0x1
ffffffffc020087a:	8385                	srli	a5,a5,0x1
ffffffffc020087c:	06f76c63          	bltu	a4,a5,ffffffffc02008f4 <interrupt_handler+0x82>
ffffffffc0200880:	00006717          	auipc	a4,0x6
ffffffffc0200884:	db870713          	addi	a4,a4,-584 # ffffffffc0206638 <commands+0x48>
ffffffffc0200888:	078a                	slli	a5,a5,0x2
ffffffffc020088a:	97ba                	add	a5,a5,a4
ffffffffc020088c:	439c                	lw	a5,0(a5)
ffffffffc020088e:	97ba                	add	a5,a5,a4
ffffffffc0200890:	8782                	jr	a5
ffffffffc0200892:	00004517          	auipc	a0,0x4
ffffffffc0200896:	62e50513          	addi	a0,a0,1582 # ffffffffc0204ec0 <etext+0x6da>
ffffffffc020089a:	8e7ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc020089e:	00004517          	auipc	a0,0x4
ffffffffc02008a2:	60250513          	addi	a0,a0,1538 # ffffffffc0204ea0 <etext+0x6ba>
ffffffffc02008a6:	8dbff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc02008aa:	00004517          	auipc	a0,0x4
ffffffffc02008ae:	5b650513          	addi	a0,a0,1462 # ffffffffc0204e60 <etext+0x67a>
ffffffffc02008b2:	8cfff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc02008b6:	00004517          	auipc	a0,0x4
ffffffffc02008ba:	5ca50513          	addi	a0,a0,1482 # ffffffffc0204e80 <etext+0x69a>
ffffffffc02008be:	8c3ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc02008c2:	1141                	addi	sp,sp,-16
ffffffffc02008c4:	e406                	sd	ra,8(sp)
ffffffffc02008c6:	c03ff0ef          	jal	ffffffffc02004c8 <clock_set_next_event>
ffffffffc02008ca:	00015697          	auipc	a3,0x15
ffffffffc02008ce:	c7668693          	addi	a3,a3,-906 # ffffffffc0215540 <ticks>
ffffffffc02008d2:	629c                	ld	a5,0(a3)
ffffffffc02008d4:	06400713          	li	a4,100
ffffffffc02008d8:	0785                	addi	a5,a5,1 # 40001 <kern_entry-0xffffffffc01bffff>
ffffffffc02008da:	02e7f733          	remu	a4,a5,a4
ffffffffc02008de:	e29c                	sd	a5,0(a3)
ffffffffc02008e0:	cb19                	beqz	a4,ffffffffc02008f6 <interrupt_handler+0x84>
ffffffffc02008e2:	60a2                	ld	ra,8(sp)
ffffffffc02008e4:	0141                	addi	sp,sp,16
ffffffffc02008e6:	8082                	ret
ffffffffc02008e8:	00004517          	auipc	a0,0x4
ffffffffc02008ec:	63050513          	addi	a0,a0,1584 # ffffffffc0204f18 <etext+0x732>
ffffffffc02008f0:	891ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc02008f4:	bf31                	j	ffffffffc0200810 <print_trapframe>
ffffffffc02008f6:	06400593          	li	a1,100
ffffffffc02008fa:	00004517          	auipc	a0,0x4
ffffffffc02008fe:	5e650513          	addi	a0,a0,1510 # ffffffffc0204ee0 <etext+0x6fa>
ffffffffc0200902:	87fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200906:	00004517          	auipc	a0,0x4
ffffffffc020090a:	5ea50513          	addi	a0,a0,1514 # ffffffffc0204ef0 <etext+0x70a>
ffffffffc020090e:	873ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200912:	00004617          	auipc	a2,0x4
ffffffffc0200916:	5ee60613          	addi	a2,a2,1518 # ffffffffc0204f00 <etext+0x71a>
ffffffffc020091a:	45d1                	li	a1,20
ffffffffc020091c:	00004517          	auipc	a0,0x4
ffffffffc0200920:	1b450513          	addi	a0,a0,436 # ffffffffc0204ad0 <etext+0x2ea>
ffffffffc0200924:	b0fff0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0200928 <exception_handler>:
ffffffffc0200928:	11853783          	ld	a5,280(a0)
ffffffffc020092c:	1101                	addi	sp,sp,-32
ffffffffc020092e:	e822                	sd	s0,16(sp)
ffffffffc0200930:	ec06                	sd	ra,24(sp)
ffffffffc0200932:	473d                	li	a4,15
ffffffffc0200934:	842a                	mv	s0,a0
ffffffffc0200936:	14f76d63          	bltu	a4,a5,ffffffffc0200a90 <exception_handler+0x168>
ffffffffc020093a:	00006717          	auipc	a4,0x6
ffffffffc020093e:	d2e70713          	addi	a4,a4,-722 # ffffffffc0206668 <commands+0x78>
ffffffffc0200942:	078a                	slli	a5,a5,0x2
ffffffffc0200944:	97ba                	add	a5,a5,a4
ffffffffc0200946:	439c                	lw	a5,0(a5)
ffffffffc0200948:	97ba                	add	a5,a5,a4
ffffffffc020094a:	8782                	jr	a5
ffffffffc020094c:	00004517          	auipc	a0,0x4
ffffffffc0200950:	78c50513          	addi	a0,a0,1932 # ffffffffc02050d8 <etext+0x8f2>
ffffffffc0200954:	e426                	sd	s1,8(sp)
ffffffffc0200956:	82bff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020095a:	8522                	mv	a0,s0
ffffffffc020095c:	c5dff0ef          	jal	ffffffffc02005b8 <pgfault_handler>
ffffffffc0200960:	84aa                	mv	s1,a0
ffffffffc0200962:	12051c63          	bnez	a0,ffffffffc0200a9a <exception_handler+0x172>
ffffffffc0200966:	60e2                	ld	ra,24(sp)
ffffffffc0200968:	6442                	ld	s0,16(sp)
ffffffffc020096a:	64a2                	ld	s1,8(sp)
ffffffffc020096c:	6105                	addi	sp,sp,32
ffffffffc020096e:	8082                	ret
ffffffffc0200970:	00004517          	auipc	a0,0x4
ffffffffc0200974:	5c850513          	addi	a0,a0,1480 # ffffffffc0204f38 <etext+0x752>
ffffffffc0200978:	6442                	ld	s0,16(sp)
ffffffffc020097a:	60e2                	ld	ra,24(sp)
ffffffffc020097c:	6105                	addi	sp,sp,32
ffffffffc020097e:	803ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc0200982:	00004517          	auipc	a0,0x4
ffffffffc0200986:	5d650513          	addi	a0,a0,1494 # ffffffffc0204f58 <etext+0x772>
ffffffffc020098a:	b7fd                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc020098c:	00004517          	auipc	a0,0x4
ffffffffc0200990:	5ec50513          	addi	a0,a0,1516 # ffffffffc0204f78 <etext+0x792>
ffffffffc0200994:	b7d5                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc0200996:	00004517          	auipc	a0,0x4
ffffffffc020099a:	5fa50513          	addi	a0,a0,1530 # ffffffffc0204f90 <etext+0x7aa>
ffffffffc020099e:	bfe9                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc02009a0:	00004517          	auipc	a0,0x4
ffffffffc02009a4:	60050513          	addi	a0,a0,1536 # ffffffffc0204fa0 <etext+0x7ba>
ffffffffc02009a8:	bfc1                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc02009aa:	00004517          	auipc	a0,0x4
ffffffffc02009ae:	61650513          	addi	a0,a0,1558 # ffffffffc0204fc0 <etext+0x7da>
ffffffffc02009b2:	e426                	sd	s1,8(sp)
ffffffffc02009b4:	fccff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02009b8:	8522                	mv	a0,s0
ffffffffc02009ba:	bffff0ef          	jal	ffffffffc02005b8 <pgfault_handler>
ffffffffc02009be:	84aa                	mv	s1,a0
ffffffffc02009c0:	d15d                	beqz	a0,ffffffffc0200966 <exception_handler+0x3e>
ffffffffc02009c2:	8522                	mv	a0,s0
ffffffffc02009c4:	e4dff0ef          	jal	ffffffffc0200810 <print_trapframe>
ffffffffc02009c8:	86a6                	mv	a3,s1
ffffffffc02009ca:	00004617          	auipc	a2,0x4
ffffffffc02009ce:	60e60613          	addi	a2,a2,1550 # ffffffffc0204fd8 <etext+0x7f2>
ffffffffc02009d2:	0b300593          	li	a1,179
ffffffffc02009d6:	00004517          	auipc	a0,0x4
ffffffffc02009da:	0fa50513          	addi	a0,a0,250 # ffffffffc0204ad0 <etext+0x2ea>
ffffffffc02009de:	a55ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02009e2:	00004517          	auipc	a0,0x4
ffffffffc02009e6:	61650513          	addi	a0,a0,1558 # ffffffffc0204ff8 <etext+0x812>
ffffffffc02009ea:	b779                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc02009ec:	00004517          	auipc	a0,0x4
ffffffffc02009f0:	62450513          	addi	a0,a0,1572 # ffffffffc0205010 <etext+0x82a>
ffffffffc02009f4:	e426                	sd	s1,8(sp)
ffffffffc02009f6:	f8aff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02009fa:	8522                	mv	a0,s0
ffffffffc02009fc:	bbdff0ef          	jal	ffffffffc02005b8 <pgfault_handler>
ffffffffc0200a00:	84aa                	mv	s1,a0
ffffffffc0200a02:	d135                	beqz	a0,ffffffffc0200966 <exception_handler+0x3e>
ffffffffc0200a04:	8522                	mv	a0,s0
ffffffffc0200a06:	e0bff0ef          	jal	ffffffffc0200810 <print_trapframe>
ffffffffc0200a0a:	86a6                	mv	a3,s1
ffffffffc0200a0c:	00004617          	auipc	a2,0x4
ffffffffc0200a10:	5cc60613          	addi	a2,a2,1484 # ffffffffc0204fd8 <etext+0x7f2>
ffffffffc0200a14:	0bd00593          	li	a1,189
ffffffffc0200a18:	00004517          	auipc	a0,0x4
ffffffffc0200a1c:	0b850513          	addi	a0,a0,184 # ffffffffc0204ad0 <etext+0x2ea>
ffffffffc0200a20:	a13ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200a24:	00004517          	auipc	a0,0x4
ffffffffc0200a28:	60450513          	addi	a0,a0,1540 # ffffffffc0205028 <etext+0x842>
ffffffffc0200a2c:	b7b1                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc0200a2e:	00004517          	auipc	a0,0x4
ffffffffc0200a32:	61a50513          	addi	a0,a0,1562 # ffffffffc0205048 <etext+0x862>
ffffffffc0200a36:	b789                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc0200a38:	00004517          	auipc	a0,0x4
ffffffffc0200a3c:	63050513          	addi	a0,a0,1584 # ffffffffc0205068 <etext+0x882>
ffffffffc0200a40:	bf25                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc0200a42:	00004517          	auipc	a0,0x4
ffffffffc0200a46:	64650513          	addi	a0,a0,1606 # ffffffffc0205088 <etext+0x8a2>
ffffffffc0200a4a:	b73d                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc0200a4c:	00004517          	auipc	a0,0x4
ffffffffc0200a50:	65c50513          	addi	a0,a0,1628 # ffffffffc02050a8 <etext+0x8c2>
ffffffffc0200a54:	b715                	j	ffffffffc0200978 <exception_handler+0x50>
ffffffffc0200a56:	00004517          	auipc	a0,0x4
ffffffffc0200a5a:	66a50513          	addi	a0,a0,1642 # ffffffffc02050c0 <etext+0x8da>
ffffffffc0200a5e:	e426                	sd	s1,8(sp)
ffffffffc0200a60:	f20ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200a64:	8522                	mv	a0,s0
ffffffffc0200a66:	b53ff0ef          	jal	ffffffffc02005b8 <pgfault_handler>
ffffffffc0200a6a:	84aa                	mv	s1,a0
ffffffffc0200a6c:	ee050de3          	beqz	a0,ffffffffc0200966 <exception_handler+0x3e>
ffffffffc0200a70:	8522                	mv	a0,s0
ffffffffc0200a72:	d9fff0ef          	jal	ffffffffc0200810 <print_trapframe>
ffffffffc0200a76:	86a6                	mv	a3,s1
ffffffffc0200a78:	00004617          	auipc	a2,0x4
ffffffffc0200a7c:	56060613          	addi	a2,a2,1376 # ffffffffc0204fd8 <etext+0x7f2>
ffffffffc0200a80:	0d300593          	li	a1,211
ffffffffc0200a84:	00004517          	auipc	a0,0x4
ffffffffc0200a88:	04c50513          	addi	a0,a0,76 # ffffffffc0204ad0 <etext+0x2ea>
ffffffffc0200a8c:	9a7ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200a90:	8522                	mv	a0,s0
ffffffffc0200a92:	6442                	ld	s0,16(sp)
ffffffffc0200a94:	60e2                	ld	ra,24(sp)
ffffffffc0200a96:	6105                	addi	sp,sp,32
ffffffffc0200a98:	bba5                	j	ffffffffc0200810 <print_trapframe>
ffffffffc0200a9a:	8522                	mv	a0,s0
ffffffffc0200a9c:	d75ff0ef          	jal	ffffffffc0200810 <print_trapframe>
ffffffffc0200aa0:	86a6                	mv	a3,s1
ffffffffc0200aa2:	00004617          	auipc	a2,0x4
ffffffffc0200aa6:	53660613          	addi	a2,a2,1334 # ffffffffc0204fd8 <etext+0x7f2>
ffffffffc0200aaa:	0da00593          	li	a1,218
ffffffffc0200aae:	00004517          	auipc	a0,0x4
ffffffffc0200ab2:	02250513          	addi	a0,a0,34 # ffffffffc0204ad0 <etext+0x2ea>
ffffffffc0200ab6:	97dff0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0200aba <trap>:
ffffffffc0200aba:	11853783          	ld	a5,280(a0)
ffffffffc0200abe:	0007c363          	bltz	a5,ffffffffc0200ac4 <trap+0xa>
ffffffffc0200ac2:	b59d                	j	ffffffffc0200928 <exception_handler>
ffffffffc0200ac4:	b37d                	j	ffffffffc0200872 <interrupt_handler>
	...

ffffffffc0200ac8 <__alltraps>:
ffffffffc0200ac8:	14011073          	csrw	sscratch,sp
ffffffffc0200acc:	712d                	addi	sp,sp,-288
ffffffffc0200ace:	e406                	sd	ra,8(sp)
ffffffffc0200ad0:	ec0e                	sd	gp,24(sp)
ffffffffc0200ad2:	f012                	sd	tp,32(sp)
ffffffffc0200ad4:	f416                	sd	t0,40(sp)
ffffffffc0200ad6:	f81a                	sd	t1,48(sp)
ffffffffc0200ad8:	fc1e                	sd	t2,56(sp)
ffffffffc0200ada:	e0a2                	sd	s0,64(sp)
ffffffffc0200adc:	e4a6                	sd	s1,72(sp)
ffffffffc0200ade:	e8aa                	sd	a0,80(sp)
ffffffffc0200ae0:	ecae                	sd	a1,88(sp)
ffffffffc0200ae2:	f0b2                	sd	a2,96(sp)
ffffffffc0200ae4:	f4b6                	sd	a3,104(sp)
ffffffffc0200ae6:	f8ba                	sd	a4,112(sp)
ffffffffc0200ae8:	fcbe                	sd	a5,120(sp)
ffffffffc0200aea:	e142                	sd	a6,128(sp)
ffffffffc0200aec:	e546                	sd	a7,136(sp)
ffffffffc0200aee:	e94a                	sd	s2,144(sp)
ffffffffc0200af0:	ed4e                	sd	s3,152(sp)
ffffffffc0200af2:	f152                	sd	s4,160(sp)
ffffffffc0200af4:	f556                	sd	s5,168(sp)
ffffffffc0200af6:	f95a                	sd	s6,176(sp)
ffffffffc0200af8:	fd5e                	sd	s7,184(sp)
ffffffffc0200afa:	e1e2                	sd	s8,192(sp)
ffffffffc0200afc:	e5e6                	sd	s9,200(sp)
ffffffffc0200afe:	e9ea                	sd	s10,208(sp)
ffffffffc0200b00:	edee                	sd	s11,216(sp)
ffffffffc0200b02:	f1f2                	sd	t3,224(sp)
ffffffffc0200b04:	f5f6                	sd	t4,232(sp)
ffffffffc0200b06:	f9fa                	sd	t5,240(sp)
ffffffffc0200b08:	fdfe                	sd	t6,248(sp)
ffffffffc0200b0a:	14002473          	csrr	s0,sscratch
ffffffffc0200b0e:	100024f3          	csrr	s1,sstatus
ffffffffc0200b12:	14102973          	csrr	s2,sepc
ffffffffc0200b16:	143029f3          	csrr	s3,stval
ffffffffc0200b1a:	14202a73          	csrr	s4,scause
ffffffffc0200b1e:	e822                	sd	s0,16(sp)
ffffffffc0200b20:	e226                	sd	s1,256(sp)
ffffffffc0200b22:	e64a                	sd	s2,264(sp)
ffffffffc0200b24:	ea4e                	sd	s3,272(sp)
ffffffffc0200b26:	ee52                	sd	s4,280(sp)
ffffffffc0200b28:	850a                	mv	a0,sp
ffffffffc0200b2a:	f91ff0ef          	jal	ffffffffc0200aba <trap>

ffffffffc0200b2e <__trapret>:
ffffffffc0200b2e:	6492                	ld	s1,256(sp)
ffffffffc0200b30:	6932                	ld	s2,264(sp)
ffffffffc0200b32:	10049073          	csrw	sstatus,s1
ffffffffc0200b36:	14191073          	csrw	sepc,s2
ffffffffc0200b3a:	60a2                	ld	ra,8(sp)
ffffffffc0200b3c:	61e2                	ld	gp,24(sp)
ffffffffc0200b3e:	7202                	ld	tp,32(sp)
ffffffffc0200b40:	72a2                	ld	t0,40(sp)
ffffffffc0200b42:	7342                	ld	t1,48(sp)
ffffffffc0200b44:	73e2                	ld	t2,56(sp)
ffffffffc0200b46:	6406                	ld	s0,64(sp)
ffffffffc0200b48:	64a6                	ld	s1,72(sp)
ffffffffc0200b4a:	6546                	ld	a0,80(sp)
ffffffffc0200b4c:	65e6                	ld	a1,88(sp)
ffffffffc0200b4e:	7606                	ld	a2,96(sp)
ffffffffc0200b50:	76a6                	ld	a3,104(sp)
ffffffffc0200b52:	7746                	ld	a4,112(sp)
ffffffffc0200b54:	77e6                	ld	a5,120(sp)
ffffffffc0200b56:	680a                	ld	a6,128(sp)
ffffffffc0200b58:	68aa                	ld	a7,136(sp)
ffffffffc0200b5a:	694a                	ld	s2,144(sp)
ffffffffc0200b5c:	69ea                	ld	s3,152(sp)
ffffffffc0200b5e:	7a0a                	ld	s4,160(sp)
ffffffffc0200b60:	7aaa                	ld	s5,168(sp)
ffffffffc0200b62:	7b4a                	ld	s6,176(sp)
ffffffffc0200b64:	7bea                	ld	s7,184(sp)
ffffffffc0200b66:	6c0e                	ld	s8,192(sp)
ffffffffc0200b68:	6cae                	ld	s9,200(sp)
ffffffffc0200b6a:	6d4e                	ld	s10,208(sp)
ffffffffc0200b6c:	6dee                	ld	s11,216(sp)
ffffffffc0200b6e:	7e0e                	ld	t3,224(sp)
ffffffffc0200b70:	7eae                	ld	t4,232(sp)
ffffffffc0200b72:	7f4e                	ld	t5,240(sp)
ffffffffc0200b74:	7fee                	ld	t6,248(sp)
ffffffffc0200b76:	6142                	ld	sp,16(sp)
ffffffffc0200b78:	10200073          	sret

ffffffffc0200b7c <forkrets>:
ffffffffc0200b7c:	812a                	mv	sp,a0
ffffffffc0200b7e:	bf45                	j	ffffffffc0200b2e <__trapret>
	...

ffffffffc0200b82 <default_init>:
ffffffffc0200b82:	00011797          	auipc	a5,0x11
ffffffffc0200b86:	8d678793          	addi	a5,a5,-1834 # ffffffffc0211458 <free_area>
ffffffffc0200b8a:	e79c                	sd	a5,8(a5)
ffffffffc0200b8c:	e39c                	sd	a5,0(a5)
ffffffffc0200b8e:	0007a823          	sw	zero,16(a5)
ffffffffc0200b92:	8082                	ret

ffffffffc0200b94 <default_nr_free_pages>:
ffffffffc0200b94:	00011517          	auipc	a0,0x11
ffffffffc0200b98:	8d456503          	lwu	a0,-1836(a0) # ffffffffc0211468 <free_area+0x10>
ffffffffc0200b9c:	8082                	ret

ffffffffc0200b9e <default_check>:
ffffffffc0200b9e:	715d                	addi	sp,sp,-80
ffffffffc0200ba0:	e0a2                	sd	s0,64(sp)
ffffffffc0200ba2:	00011417          	auipc	s0,0x11
ffffffffc0200ba6:	8b640413          	addi	s0,s0,-1866 # ffffffffc0211458 <free_area>
ffffffffc0200baa:	641c                	ld	a5,8(s0)
ffffffffc0200bac:	e486                	sd	ra,72(sp)
ffffffffc0200bae:	fc26                	sd	s1,56(sp)
ffffffffc0200bb0:	f84a                	sd	s2,48(sp)
ffffffffc0200bb2:	f44e                	sd	s3,40(sp)
ffffffffc0200bb4:	f052                	sd	s4,32(sp)
ffffffffc0200bb6:	ec56                	sd	s5,24(sp)
ffffffffc0200bb8:	e85a                	sd	s6,16(sp)
ffffffffc0200bba:	e45e                	sd	s7,8(sp)
ffffffffc0200bbc:	e062                	sd	s8,0(sp)
ffffffffc0200bbe:	2a878d63          	beq	a5,s0,ffffffffc0200e78 <default_check+0x2da>
ffffffffc0200bc2:	4481                	li	s1,0
ffffffffc0200bc4:	4901                	li	s2,0
ffffffffc0200bc6:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200bca:	8b09                	andi	a4,a4,2
ffffffffc0200bcc:	2a070a63          	beqz	a4,ffffffffc0200e80 <default_check+0x2e2>
ffffffffc0200bd0:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200bd4:	679c                	ld	a5,8(a5)
ffffffffc0200bd6:	2905                	addiw	s2,s2,1
ffffffffc0200bd8:	9cb9                	addw	s1,s1,a4
ffffffffc0200bda:	fe8796e3          	bne	a5,s0,ffffffffc0200bc6 <default_check+0x28>
ffffffffc0200bde:	89a6                	mv	s3,s1
ffffffffc0200be0:	711000ef          	jal	ffffffffc0201af0 <nr_free_pages>
ffffffffc0200be4:	6f351e63          	bne	a0,s3,ffffffffc02012e0 <default_check+0x742>
ffffffffc0200be8:	4505                	li	a0,1
ffffffffc0200bea:	637000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200bee:	8aaa                	mv	s5,a0
ffffffffc0200bf0:	42050863          	beqz	a0,ffffffffc0201020 <default_check+0x482>
ffffffffc0200bf4:	4505                	li	a0,1
ffffffffc0200bf6:	62b000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200bfa:	89aa                	mv	s3,a0
ffffffffc0200bfc:	70050263          	beqz	a0,ffffffffc0201300 <default_check+0x762>
ffffffffc0200c00:	4505                	li	a0,1
ffffffffc0200c02:	61f000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200c06:	8a2a                	mv	s4,a0
ffffffffc0200c08:	48050c63          	beqz	a0,ffffffffc02010a0 <default_check+0x502>
ffffffffc0200c0c:	293a8a63          	beq	s5,s3,ffffffffc0200ea0 <default_check+0x302>
ffffffffc0200c10:	28aa8863          	beq	s5,a0,ffffffffc0200ea0 <default_check+0x302>
ffffffffc0200c14:	28a98663          	beq	s3,a0,ffffffffc0200ea0 <default_check+0x302>
ffffffffc0200c18:	000aa783          	lw	a5,0(s5)
ffffffffc0200c1c:	2a079263          	bnez	a5,ffffffffc0200ec0 <default_check+0x322>
ffffffffc0200c20:	0009a783          	lw	a5,0(s3)
ffffffffc0200c24:	28079e63          	bnez	a5,ffffffffc0200ec0 <default_check+0x322>
ffffffffc0200c28:	411c                	lw	a5,0(a0)
ffffffffc0200c2a:	28079b63          	bnez	a5,ffffffffc0200ec0 <default_check+0x322>
ffffffffc0200c2e:	00015797          	auipc	a5,0x15
ffffffffc0200c32:	94a7b783          	ld	a5,-1718(a5) # ffffffffc0215578 <pages>
ffffffffc0200c36:	40fa8733          	sub	a4,s5,a5
ffffffffc0200c3a:	00006617          	auipc	a2,0x6
ffffffffc0200c3e:	c3663603          	ld	a2,-970(a2) # ffffffffc0206870 <nbase>
ffffffffc0200c42:	8719                	srai	a4,a4,0x6
ffffffffc0200c44:	9732                	add	a4,a4,a2
ffffffffc0200c46:	00015697          	auipc	a3,0x15
ffffffffc0200c4a:	92a6b683          	ld	a3,-1750(a3) # ffffffffc0215570 <npage>
ffffffffc0200c4e:	06b2                	slli	a3,a3,0xc
ffffffffc0200c50:	0732                	slli	a4,a4,0xc
ffffffffc0200c52:	28d77763          	bgeu	a4,a3,ffffffffc0200ee0 <default_check+0x342>
ffffffffc0200c56:	40f98733          	sub	a4,s3,a5
ffffffffc0200c5a:	8719                	srai	a4,a4,0x6
ffffffffc0200c5c:	9732                	add	a4,a4,a2
ffffffffc0200c5e:	0732                	slli	a4,a4,0xc
ffffffffc0200c60:	4cd77063          	bgeu	a4,a3,ffffffffc0201120 <default_check+0x582>
ffffffffc0200c64:	40f507b3          	sub	a5,a0,a5
ffffffffc0200c68:	8799                	srai	a5,a5,0x6
ffffffffc0200c6a:	97b2                	add	a5,a5,a2
ffffffffc0200c6c:	07b2                	slli	a5,a5,0xc
ffffffffc0200c6e:	30d7f963          	bgeu	a5,a3,ffffffffc0200f80 <default_check+0x3e2>
ffffffffc0200c72:	4505                	li	a0,1
ffffffffc0200c74:	00043c03          	ld	s8,0(s0)
ffffffffc0200c78:	00843b83          	ld	s7,8(s0)
ffffffffc0200c7c:	01042b03          	lw	s6,16(s0)
ffffffffc0200c80:	e400                	sd	s0,8(s0)
ffffffffc0200c82:	e000                	sd	s0,0(s0)
ffffffffc0200c84:	00010797          	auipc	a5,0x10
ffffffffc0200c88:	7e07a223          	sw	zero,2020(a5) # ffffffffc0211468 <free_area+0x10>
ffffffffc0200c8c:	595000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200c90:	2c051863          	bnez	a0,ffffffffc0200f60 <default_check+0x3c2>
ffffffffc0200c94:	4585                	li	a1,1
ffffffffc0200c96:	8556                	mv	a0,s5
ffffffffc0200c98:	619000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200c9c:	4585                	li	a1,1
ffffffffc0200c9e:	854e                	mv	a0,s3
ffffffffc0200ca0:	611000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200ca4:	4585                	li	a1,1
ffffffffc0200ca6:	8552                	mv	a0,s4
ffffffffc0200ca8:	609000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200cac:	4818                	lw	a4,16(s0)
ffffffffc0200cae:	478d                	li	a5,3
ffffffffc0200cb0:	28f71863          	bne	a4,a5,ffffffffc0200f40 <default_check+0x3a2>
ffffffffc0200cb4:	4505                	li	a0,1
ffffffffc0200cb6:	56b000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200cba:	89aa                	mv	s3,a0
ffffffffc0200cbc:	26050263          	beqz	a0,ffffffffc0200f20 <default_check+0x382>
ffffffffc0200cc0:	4505                	li	a0,1
ffffffffc0200cc2:	55f000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200cc6:	8aaa                	mv	s5,a0
ffffffffc0200cc8:	3a050c63          	beqz	a0,ffffffffc0201080 <default_check+0x4e2>
ffffffffc0200ccc:	4505                	li	a0,1
ffffffffc0200cce:	553000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200cd2:	8a2a                	mv	s4,a0
ffffffffc0200cd4:	38050663          	beqz	a0,ffffffffc0201060 <default_check+0x4c2>
ffffffffc0200cd8:	4505                	li	a0,1
ffffffffc0200cda:	547000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200cde:	36051163          	bnez	a0,ffffffffc0201040 <default_check+0x4a2>
ffffffffc0200ce2:	4585                	li	a1,1
ffffffffc0200ce4:	854e                	mv	a0,s3
ffffffffc0200ce6:	5cb000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200cea:	641c                	ld	a5,8(s0)
ffffffffc0200cec:	20878a63          	beq	a5,s0,ffffffffc0200f00 <default_check+0x362>
ffffffffc0200cf0:	4505                	li	a0,1
ffffffffc0200cf2:	52f000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200cf6:	30a99563          	bne	s3,a0,ffffffffc0201000 <default_check+0x462>
ffffffffc0200cfa:	4505                	li	a0,1
ffffffffc0200cfc:	525000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200d00:	2e051063          	bnez	a0,ffffffffc0200fe0 <default_check+0x442>
ffffffffc0200d04:	481c                	lw	a5,16(s0)
ffffffffc0200d06:	2a079d63          	bnez	a5,ffffffffc0200fc0 <default_check+0x422>
ffffffffc0200d0a:	854e                	mv	a0,s3
ffffffffc0200d0c:	4585                	li	a1,1
ffffffffc0200d0e:	01843023          	sd	s8,0(s0)
ffffffffc0200d12:	01743423          	sd	s7,8(s0)
ffffffffc0200d16:	01642823          	sw	s6,16(s0)
ffffffffc0200d1a:	597000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200d1e:	4585                	li	a1,1
ffffffffc0200d20:	8556                	mv	a0,s5
ffffffffc0200d22:	58f000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200d26:	4585                	li	a1,1
ffffffffc0200d28:	8552                	mv	a0,s4
ffffffffc0200d2a:	587000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200d2e:	4515                	li	a0,5
ffffffffc0200d30:	4f1000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200d34:	89aa                	mv	s3,a0
ffffffffc0200d36:	26050563          	beqz	a0,ffffffffc0200fa0 <default_check+0x402>
ffffffffc0200d3a:	651c                	ld	a5,8(a0)
ffffffffc0200d3c:	8385                	srli	a5,a5,0x1
ffffffffc0200d3e:	8b85                	andi	a5,a5,1
ffffffffc0200d40:	54079063          	bnez	a5,ffffffffc0201280 <default_check+0x6e2>
ffffffffc0200d44:	4505                	li	a0,1
ffffffffc0200d46:	00043b03          	ld	s6,0(s0)
ffffffffc0200d4a:	00843a83          	ld	s5,8(s0)
ffffffffc0200d4e:	e000                	sd	s0,0(s0)
ffffffffc0200d50:	e400                	sd	s0,8(s0)
ffffffffc0200d52:	4cf000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200d56:	50051563          	bnez	a0,ffffffffc0201260 <default_check+0x6c2>
ffffffffc0200d5a:	08098a13          	addi	s4,s3,128
ffffffffc0200d5e:	8552                	mv	a0,s4
ffffffffc0200d60:	458d                	li	a1,3
ffffffffc0200d62:	01042b83          	lw	s7,16(s0)
ffffffffc0200d66:	00010797          	auipc	a5,0x10
ffffffffc0200d6a:	7007a123          	sw	zero,1794(a5) # ffffffffc0211468 <free_area+0x10>
ffffffffc0200d6e:	543000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200d72:	4511                	li	a0,4
ffffffffc0200d74:	4ad000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200d78:	4c051463          	bnez	a0,ffffffffc0201240 <default_check+0x6a2>
ffffffffc0200d7c:	0889b783          	ld	a5,136(s3)
ffffffffc0200d80:	8385                	srli	a5,a5,0x1
ffffffffc0200d82:	8b85                	andi	a5,a5,1
ffffffffc0200d84:	48078e63          	beqz	a5,ffffffffc0201220 <default_check+0x682>
ffffffffc0200d88:	0909a703          	lw	a4,144(s3)
ffffffffc0200d8c:	478d                	li	a5,3
ffffffffc0200d8e:	48f71963          	bne	a4,a5,ffffffffc0201220 <default_check+0x682>
ffffffffc0200d92:	450d                	li	a0,3
ffffffffc0200d94:	48d000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200d98:	8c2a                	mv	s8,a0
ffffffffc0200d9a:	46050363          	beqz	a0,ffffffffc0201200 <default_check+0x662>
ffffffffc0200d9e:	4505                	li	a0,1
ffffffffc0200da0:	481000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200da4:	42051e63          	bnez	a0,ffffffffc02011e0 <default_check+0x642>
ffffffffc0200da8:	418a1c63          	bne	s4,s8,ffffffffc02011c0 <default_check+0x622>
ffffffffc0200dac:	4585                	li	a1,1
ffffffffc0200dae:	854e                	mv	a0,s3
ffffffffc0200db0:	501000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200db4:	458d                	li	a1,3
ffffffffc0200db6:	8552                	mv	a0,s4
ffffffffc0200db8:	4f9000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200dbc:	0089b783          	ld	a5,8(s3)
ffffffffc0200dc0:	04098c13          	addi	s8,s3,64
ffffffffc0200dc4:	8385                	srli	a5,a5,0x1
ffffffffc0200dc6:	8b85                	andi	a5,a5,1
ffffffffc0200dc8:	3c078c63          	beqz	a5,ffffffffc02011a0 <default_check+0x602>
ffffffffc0200dcc:	0109a703          	lw	a4,16(s3)
ffffffffc0200dd0:	4785                	li	a5,1
ffffffffc0200dd2:	3cf71763          	bne	a4,a5,ffffffffc02011a0 <default_check+0x602>
ffffffffc0200dd6:	008a3783          	ld	a5,8(s4)
ffffffffc0200dda:	8385                	srli	a5,a5,0x1
ffffffffc0200ddc:	8b85                	andi	a5,a5,1
ffffffffc0200dde:	3a078163          	beqz	a5,ffffffffc0201180 <default_check+0x5e2>
ffffffffc0200de2:	010a2703          	lw	a4,16(s4)
ffffffffc0200de6:	478d                	li	a5,3
ffffffffc0200de8:	38f71c63          	bne	a4,a5,ffffffffc0201180 <default_check+0x5e2>
ffffffffc0200dec:	4505                	li	a0,1
ffffffffc0200dee:	433000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200df2:	36a99763          	bne	s3,a0,ffffffffc0201160 <default_check+0x5c2>
ffffffffc0200df6:	4585                	li	a1,1
ffffffffc0200df8:	4b9000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200dfc:	4509                	li	a0,2
ffffffffc0200dfe:	423000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200e02:	32aa1f63          	bne	s4,a0,ffffffffc0201140 <default_check+0x5a2>
ffffffffc0200e06:	4589                	li	a1,2
ffffffffc0200e08:	4a9000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200e0c:	4585                	li	a1,1
ffffffffc0200e0e:	8562                	mv	a0,s8
ffffffffc0200e10:	4a1000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200e14:	4515                	li	a0,5
ffffffffc0200e16:	40b000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200e1a:	89aa                	mv	s3,a0
ffffffffc0200e1c:	48050263          	beqz	a0,ffffffffc02012a0 <default_check+0x702>
ffffffffc0200e20:	4505                	li	a0,1
ffffffffc0200e22:	3ff000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0200e26:	2c051d63          	bnez	a0,ffffffffc0201100 <default_check+0x562>
ffffffffc0200e2a:	481c                	lw	a5,16(s0)
ffffffffc0200e2c:	2a079a63          	bnez	a5,ffffffffc02010e0 <default_check+0x542>
ffffffffc0200e30:	4595                	li	a1,5
ffffffffc0200e32:	854e                	mv	a0,s3
ffffffffc0200e34:	01742823          	sw	s7,16(s0)
ffffffffc0200e38:	01643023          	sd	s6,0(s0)
ffffffffc0200e3c:	01543423          	sd	s5,8(s0)
ffffffffc0200e40:	471000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0200e44:	641c                	ld	a5,8(s0)
ffffffffc0200e46:	00878963          	beq	a5,s0,ffffffffc0200e58 <default_check+0x2ba>
ffffffffc0200e4a:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200e4e:	679c                	ld	a5,8(a5)
ffffffffc0200e50:	397d                	addiw	s2,s2,-1
ffffffffc0200e52:	9c99                	subw	s1,s1,a4
ffffffffc0200e54:	fe879be3          	bne	a5,s0,ffffffffc0200e4a <default_check+0x2ac>
ffffffffc0200e58:	26091463          	bnez	s2,ffffffffc02010c0 <default_check+0x522>
ffffffffc0200e5c:	46049263          	bnez	s1,ffffffffc02012c0 <default_check+0x722>
ffffffffc0200e60:	60a6                	ld	ra,72(sp)
ffffffffc0200e62:	6406                	ld	s0,64(sp)
ffffffffc0200e64:	74e2                	ld	s1,56(sp)
ffffffffc0200e66:	7942                	ld	s2,48(sp)
ffffffffc0200e68:	79a2                	ld	s3,40(sp)
ffffffffc0200e6a:	7a02                	ld	s4,32(sp)
ffffffffc0200e6c:	6ae2                	ld	s5,24(sp)
ffffffffc0200e6e:	6b42                	ld	s6,16(sp)
ffffffffc0200e70:	6ba2                	ld	s7,8(sp)
ffffffffc0200e72:	6c02                	ld	s8,0(sp)
ffffffffc0200e74:	6161                	addi	sp,sp,80
ffffffffc0200e76:	8082                	ret
ffffffffc0200e78:	4981                	li	s3,0
ffffffffc0200e7a:	4481                	li	s1,0
ffffffffc0200e7c:	4901                	li	s2,0
ffffffffc0200e7e:	b38d                	j	ffffffffc0200be0 <default_check+0x42>
ffffffffc0200e80:	00004697          	auipc	a3,0x4
ffffffffc0200e84:	27068693          	addi	a3,a3,624 # ffffffffc02050f0 <etext+0x90a>
ffffffffc0200e88:	00004617          	auipc	a2,0x4
ffffffffc0200e8c:	27860613          	addi	a2,a2,632 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200e90:	0f000593          	li	a1,240
ffffffffc0200e94:	00004517          	auipc	a0,0x4
ffffffffc0200e98:	28450513          	addi	a0,a0,644 # ffffffffc0205118 <etext+0x932>
ffffffffc0200e9c:	d96ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200ea0:	00004697          	auipc	a3,0x4
ffffffffc0200ea4:	31068693          	addi	a3,a3,784 # ffffffffc02051b0 <etext+0x9ca>
ffffffffc0200ea8:	00004617          	auipc	a2,0x4
ffffffffc0200eac:	25860613          	addi	a2,a2,600 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200eb0:	0bd00593          	li	a1,189
ffffffffc0200eb4:	00004517          	auipc	a0,0x4
ffffffffc0200eb8:	26450513          	addi	a0,a0,612 # ffffffffc0205118 <etext+0x932>
ffffffffc0200ebc:	d76ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200ec0:	00004697          	auipc	a3,0x4
ffffffffc0200ec4:	31868693          	addi	a3,a3,792 # ffffffffc02051d8 <etext+0x9f2>
ffffffffc0200ec8:	00004617          	auipc	a2,0x4
ffffffffc0200ecc:	23860613          	addi	a2,a2,568 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200ed0:	0be00593          	li	a1,190
ffffffffc0200ed4:	00004517          	auipc	a0,0x4
ffffffffc0200ed8:	24450513          	addi	a0,a0,580 # ffffffffc0205118 <etext+0x932>
ffffffffc0200edc:	d56ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200ee0:	00004697          	auipc	a3,0x4
ffffffffc0200ee4:	33868693          	addi	a3,a3,824 # ffffffffc0205218 <etext+0xa32>
ffffffffc0200ee8:	00004617          	auipc	a2,0x4
ffffffffc0200eec:	21860613          	addi	a2,a2,536 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200ef0:	0c000593          	li	a1,192
ffffffffc0200ef4:	00004517          	auipc	a0,0x4
ffffffffc0200ef8:	22450513          	addi	a0,a0,548 # ffffffffc0205118 <etext+0x932>
ffffffffc0200efc:	d36ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200f00:	00004697          	auipc	a3,0x4
ffffffffc0200f04:	3a068693          	addi	a3,a3,928 # ffffffffc02052a0 <etext+0xaba>
ffffffffc0200f08:	00004617          	auipc	a2,0x4
ffffffffc0200f0c:	1f860613          	addi	a2,a2,504 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200f10:	0d900593          	li	a1,217
ffffffffc0200f14:	00004517          	auipc	a0,0x4
ffffffffc0200f18:	20450513          	addi	a0,a0,516 # ffffffffc0205118 <etext+0x932>
ffffffffc0200f1c:	d16ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200f20:	00004697          	auipc	a3,0x4
ffffffffc0200f24:	23068693          	addi	a3,a3,560 # ffffffffc0205150 <etext+0x96a>
ffffffffc0200f28:	00004617          	auipc	a2,0x4
ffffffffc0200f2c:	1d860613          	addi	a2,a2,472 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200f30:	0d200593          	li	a1,210
ffffffffc0200f34:	00004517          	auipc	a0,0x4
ffffffffc0200f38:	1e450513          	addi	a0,a0,484 # ffffffffc0205118 <etext+0x932>
ffffffffc0200f3c:	cf6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200f40:	00004697          	auipc	a3,0x4
ffffffffc0200f44:	35068693          	addi	a3,a3,848 # ffffffffc0205290 <etext+0xaaa>
ffffffffc0200f48:	00004617          	auipc	a2,0x4
ffffffffc0200f4c:	1b860613          	addi	a2,a2,440 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200f50:	0d000593          	li	a1,208
ffffffffc0200f54:	00004517          	auipc	a0,0x4
ffffffffc0200f58:	1c450513          	addi	a0,a0,452 # ffffffffc0205118 <etext+0x932>
ffffffffc0200f5c:	cd6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200f60:	00004697          	auipc	a3,0x4
ffffffffc0200f64:	31868693          	addi	a3,a3,792 # ffffffffc0205278 <etext+0xa92>
ffffffffc0200f68:	00004617          	auipc	a2,0x4
ffffffffc0200f6c:	19860613          	addi	a2,a2,408 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200f70:	0cb00593          	li	a1,203
ffffffffc0200f74:	00004517          	auipc	a0,0x4
ffffffffc0200f78:	1a450513          	addi	a0,a0,420 # ffffffffc0205118 <etext+0x932>
ffffffffc0200f7c:	cb6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200f80:	00004697          	auipc	a3,0x4
ffffffffc0200f84:	2d868693          	addi	a3,a3,728 # ffffffffc0205258 <etext+0xa72>
ffffffffc0200f88:	00004617          	auipc	a2,0x4
ffffffffc0200f8c:	17860613          	addi	a2,a2,376 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200f90:	0c200593          	li	a1,194
ffffffffc0200f94:	00004517          	auipc	a0,0x4
ffffffffc0200f98:	18450513          	addi	a0,a0,388 # ffffffffc0205118 <etext+0x932>
ffffffffc0200f9c:	c96ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200fa0:	00004697          	auipc	a3,0x4
ffffffffc0200fa4:	34868693          	addi	a3,a3,840 # ffffffffc02052e8 <etext+0xb02>
ffffffffc0200fa8:	00004617          	auipc	a2,0x4
ffffffffc0200fac:	15860613          	addi	a2,a2,344 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200fb0:	0f800593          	li	a1,248
ffffffffc0200fb4:	00004517          	auipc	a0,0x4
ffffffffc0200fb8:	16450513          	addi	a0,a0,356 # ffffffffc0205118 <etext+0x932>
ffffffffc0200fbc:	c76ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200fc0:	00004697          	auipc	a3,0x4
ffffffffc0200fc4:	31868693          	addi	a3,a3,792 # ffffffffc02052d8 <etext+0xaf2>
ffffffffc0200fc8:	00004617          	auipc	a2,0x4
ffffffffc0200fcc:	13860613          	addi	a2,a2,312 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200fd0:	0df00593          	li	a1,223
ffffffffc0200fd4:	00004517          	auipc	a0,0x4
ffffffffc0200fd8:	14450513          	addi	a0,a0,324 # ffffffffc0205118 <etext+0x932>
ffffffffc0200fdc:	c56ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0200fe0:	00004697          	auipc	a3,0x4
ffffffffc0200fe4:	29868693          	addi	a3,a3,664 # ffffffffc0205278 <etext+0xa92>
ffffffffc0200fe8:	00004617          	auipc	a2,0x4
ffffffffc0200fec:	11860613          	addi	a2,a2,280 # ffffffffc0205100 <etext+0x91a>
ffffffffc0200ff0:	0dd00593          	li	a1,221
ffffffffc0200ff4:	00004517          	auipc	a0,0x4
ffffffffc0200ff8:	12450513          	addi	a0,a0,292 # ffffffffc0205118 <etext+0x932>
ffffffffc0200ffc:	c36ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201000:	00004697          	auipc	a3,0x4
ffffffffc0201004:	2b868693          	addi	a3,a3,696 # ffffffffc02052b8 <etext+0xad2>
ffffffffc0201008:	00004617          	auipc	a2,0x4
ffffffffc020100c:	0f860613          	addi	a2,a2,248 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201010:	0dc00593          	li	a1,220
ffffffffc0201014:	00004517          	auipc	a0,0x4
ffffffffc0201018:	10450513          	addi	a0,a0,260 # ffffffffc0205118 <etext+0x932>
ffffffffc020101c:	c16ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201020:	00004697          	auipc	a3,0x4
ffffffffc0201024:	13068693          	addi	a3,a3,304 # ffffffffc0205150 <etext+0x96a>
ffffffffc0201028:	00004617          	auipc	a2,0x4
ffffffffc020102c:	0d860613          	addi	a2,a2,216 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201030:	0b900593          	li	a1,185
ffffffffc0201034:	00004517          	auipc	a0,0x4
ffffffffc0201038:	0e450513          	addi	a0,a0,228 # ffffffffc0205118 <etext+0x932>
ffffffffc020103c:	bf6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201040:	00004697          	auipc	a3,0x4
ffffffffc0201044:	23868693          	addi	a3,a3,568 # ffffffffc0205278 <etext+0xa92>
ffffffffc0201048:	00004617          	auipc	a2,0x4
ffffffffc020104c:	0b860613          	addi	a2,a2,184 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201050:	0d600593          	li	a1,214
ffffffffc0201054:	00004517          	auipc	a0,0x4
ffffffffc0201058:	0c450513          	addi	a0,a0,196 # ffffffffc0205118 <etext+0x932>
ffffffffc020105c:	bd6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201060:	00004697          	auipc	a3,0x4
ffffffffc0201064:	13068693          	addi	a3,a3,304 # ffffffffc0205190 <etext+0x9aa>
ffffffffc0201068:	00004617          	auipc	a2,0x4
ffffffffc020106c:	09860613          	addi	a2,a2,152 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201070:	0d400593          	li	a1,212
ffffffffc0201074:	00004517          	auipc	a0,0x4
ffffffffc0201078:	0a450513          	addi	a0,a0,164 # ffffffffc0205118 <etext+0x932>
ffffffffc020107c:	bb6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201080:	00004697          	auipc	a3,0x4
ffffffffc0201084:	0f068693          	addi	a3,a3,240 # ffffffffc0205170 <etext+0x98a>
ffffffffc0201088:	00004617          	auipc	a2,0x4
ffffffffc020108c:	07860613          	addi	a2,a2,120 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201090:	0d300593          	li	a1,211
ffffffffc0201094:	00004517          	auipc	a0,0x4
ffffffffc0201098:	08450513          	addi	a0,a0,132 # ffffffffc0205118 <etext+0x932>
ffffffffc020109c:	b96ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02010a0:	00004697          	auipc	a3,0x4
ffffffffc02010a4:	0f068693          	addi	a3,a3,240 # ffffffffc0205190 <etext+0x9aa>
ffffffffc02010a8:	00004617          	auipc	a2,0x4
ffffffffc02010ac:	05860613          	addi	a2,a2,88 # ffffffffc0205100 <etext+0x91a>
ffffffffc02010b0:	0bb00593          	li	a1,187
ffffffffc02010b4:	00004517          	auipc	a0,0x4
ffffffffc02010b8:	06450513          	addi	a0,a0,100 # ffffffffc0205118 <etext+0x932>
ffffffffc02010bc:	b76ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02010c0:	00004697          	auipc	a3,0x4
ffffffffc02010c4:	37868693          	addi	a3,a3,888 # ffffffffc0205438 <etext+0xc52>
ffffffffc02010c8:	00004617          	auipc	a2,0x4
ffffffffc02010cc:	03860613          	addi	a2,a2,56 # ffffffffc0205100 <etext+0x91a>
ffffffffc02010d0:	12500593          	li	a1,293
ffffffffc02010d4:	00004517          	auipc	a0,0x4
ffffffffc02010d8:	04450513          	addi	a0,a0,68 # ffffffffc0205118 <etext+0x932>
ffffffffc02010dc:	b56ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02010e0:	00004697          	auipc	a3,0x4
ffffffffc02010e4:	1f868693          	addi	a3,a3,504 # ffffffffc02052d8 <etext+0xaf2>
ffffffffc02010e8:	00004617          	auipc	a2,0x4
ffffffffc02010ec:	01860613          	addi	a2,a2,24 # ffffffffc0205100 <etext+0x91a>
ffffffffc02010f0:	11a00593          	li	a1,282
ffffffffc02010f4:	00004517          	auipc	a0,0x4
ffffffffc02010f8:	02450513          	addi	a0,a0,36 # ffffffffc0205118 <etext+0x932>
ffffffffc02010fc:	b36ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201100:	00004697          	auipc	a3,0x4
ffffffffc0201104:	17868693          	addi	a3,a3,376 # ffffffffc0205278 <etext+0xa92>
ffffffffc0201108:	00004617          	auipc	a2,0x4
ffffffffc020110c:	ff860613          	addi	a2,a2,-8 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201110:	11800593          	li	a1,280
ffffffffc0201114:	00004517          	auipc	a0,0x4
ffffffffc0201118:	00450513          	addi	a0,a0,4 # ffffffffc0205118 <etext+0x932>
ffffffffc020111c:	b16ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201120:	00004697          	auipc	a3,0x4
ffffffffc0201124:	11868693          	addi	a3,a3,280 # ffffffffc0205238 <etext+0xa52>
ffffffffc0201128:	00004617          	auipc	a2,0x4
ffffffffc020112c:	fd860613          	addi	a2,a2,-40 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201130:	0c100593          	li	a1,193
ffffffffc0201134:	00004517          	auipc	a0,0x4
ffffffffc0201138:	fe450513          	addi	a0,a0,-28 # ffffffffc0205118 <etext+0x932>
ffffffffc020113c:	af6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201140:	00004697          	auipc	a3,0x4
ffffffffc0201144:	2b868693          	addi	a3,a3,696 # ffffffffc02053f8 <etext+0xc12>
ffffffffc0201148:	00004617          	auipc	a2,0x4
ffffffffc020114c:	fb860613          	addi	a2,a2,-72 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201150:	11200593          	li	a1,274
ffffffffc0201154:	00004517          	auipc	a0,0x4
ffffffffc0201158:	fc450513          	addi	a0,a0,-60 # ffffffffc0205118 <etext+0x932>
ffffffffc020115c:	ad6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201160:	00004697          	auipc	a3,0x4
ffffffffc0201164:	27868693          	addi	a3,a3,632 # ffffffffc02053d8 <etext+0xbf2>
ffffffffc0201168:	00004617          	auipc	a2,0x4
ffffffffc020116c:	f9860613          	addi	a2,a2,-104 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201170:	11000593          	li	a1,272
ffffffffc0201174:	00004517          	auipc	a0,0x4
ffffffffc0201178:	fa450513          	addi	a0,a0,-92 # ffffffffc0205118 <etext+0x932>
ffffffffc020117c:	ab6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201180:	00004697          	auipc	a3,0x4
ffffffffc0201184:	23068693          	addi	a3,a3,560 # ffffffffc02053b0 <etext+0xbca>
ffffffffc0201188:	00004617          	auipc	a2,0x4
ffffffffc020118c:	f7860613          	addi	a2,a2,-136 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201190:	10e00593          	li	a1,270
ffffffffc0201194:	00004517          	auipc	a0,0x4
ffffffffc0201198:	f8450513          	addi	a0,a0,-124 # ffffffffc0205118 <etext+0x932>
ffffffffc020119c:	a96ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02011a0:	00004697          	auipc	a3,0x4
ffffffffc02011a4:	1e868693          	addi	a3,a3,488 # ffffffffc0205388 <etext+0xba2>
ffffffffc02011a8:	00004617          	auipc	a2,0x4
ffffffffc02011ac:	f5860613          	addi	a2,a2,-168 # ffffffffc0205100 <etext+0x91a>
ffffffffc02011b0:	10d00593          	li	a1,269
ffffffffc02011b4:	00004517          	auipc	a0,0x4
ffffffffc02011b8:	f6450513          	addi	a0,a0,-156 # ffffffffc0205118 <etext+0x932>
ffffffffc02011bc:	a76ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02011c0:	00004697          	auipc	a3,0x4
ffffffffc02011c4:	1b868693          	addi	a3,a3,440 # ffffffffc0205378 <etext+0xb92>
ffffffffc02011c8:	00004617          	auipc	a2,0x4
ffffffffc02011cc:	f3860613          	addi	a2,a2,-200 # ffffffffc0205100 <etext+0x91a>
ffffffffc02011d0:	10800593          	li	a1,264
ffffffffc02011d4:	00004517          	auipc	a0,0x4
ffffffffc02011d8:	f4450513          	addi	a0,a0,-188 # ffffffffc0205118 <etext+0x932>
ffffffffc02011dc:	a56ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02011e0:	00004697          	auipc	a3,0x4
ffffffffc02011e4:	09868693          	addi	a3,a3,152 # ffffffffc0205278 <etext+0xa92>
ffffffffc02011e8:	00004617          	auipc	a2,0x4
ffffffffc02011ec:	f1860613          	addi	a2,a2,-232 # ffffffffc0205100 <etext+0x91a>
ffffffffc02011f0:	10700593          	li	a1,263
ffffffffc02011f4:	00004517          	auipc	a0,0x4
ffffffffc02011f8:	f2450513          	addi	a0,a0,-220 # ffffffffc0205118 <etext+0x932>
ffffffffc02011fc:	a36ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201200:	00004697          	auipc	a3,0x4
ffffffffc0201204:	15868693          	addi	a3,a3,344 # ffffffffc0205358 <etext+0xb72>
ffffffffc0201208:	00004617          	auipc	a2,0x4
ffffffffc020120c:	ef860613          	addi	a2,a2,-264 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201210:	10600593          	li	a1,262
ffffffffc0201214:	00004517          	auipc	a0,0x4
ffffffffc0201218:	f0450513          	addi	a0,a0,-252 # ffffffffc0205118 <etext+0x932>
ffffffffc020121c:	a16ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201220:	00004697          	auipc	a3,0x4
ffffffffc0201224:	10868693          	addi	a3,a3,264 # ffffffffc0205328 <etext+0xb42>
ffffffffc0201228:	00004617          	auipc	a2,0x4
ffffffffc020122c:	ed860613          	addi	a2,a2,-296 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201230:	10500593          	li	a1,261
ffffffffc0201234:	00004517          	auipc	a0,0x4
ffffffffc0201238:	ee450513          	addi	a0,a0,-284 # ffffffffc0205118 <etext+0x932>
ffffffffc020123c:	9f6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201240:	00004697          	auipc	a3,0x4
ffffffffc0201244:	0d068693          	addi	a3,a3,208 # ffffffffc0205310 <etext+0xb2a>
ffffffffc0201248:	00004617          	auipc	a2,0x4
ffffffffc020124c:	eb860613          	addi	a2,a2,-328 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201250:	10400593          	li	a1,260
ffffffffc0201254:	00004517          	auipc	a0,0x4
ffffffffc0201258:	ec450513          	addi	a0,a0,-316 # ffffffffc0205118 <etext+0x932>
ffffffffc020125c:	9d6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201260:	00004697          	auipc	a3,0x4
ffffffffc0201264:	01868693          	addi	a3,a3,24 # ffffffffc0205278 <etext+0xa92>
ffffffffc0201268:	00004617          	auipc	a2,0x4
ffffffffc020126c:	e9860613          	addi	a2,a2,-360 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201270:	0fe00593          	li	a1,254
ffffffffc0201274:	00004517          	auipc	a0,0x4
ffffffffc0201278:	ea450513          	addi	a0,a0,-348 # ffffffffc0205118 <etext+0x932>
ffffffffc020127c:	9b6ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201280:	00004697          	auipc	a3,0x4
ffffffffc0201284:	07868693          	addi	a3,a3,120 # ffffffffc02052f8 <etext+0xb12>
ffffffffc0201288:	00004617          	auipc	a2,0x4
ffffffffc020128c:	e7860613          	addi	a2,a2,-392 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201290:	0f900593          	li	a1,249
ffffffffc0201294:	00004517          	auipc	a0,0x4
ffffffffc0201298:	e8450513          	addi	a0,a0,-380 # ffffffffc0205118 <etext+0x932>
ffffffffc020129c:	996ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02012a0:	00004697          	auipc	a3,0x4
ffffffffc02012a4:	17868693          	addi	a3,a3,376 # ffffffffc0205418 <etext+0xc32>
ffffffffc02012a8:	00004617          	auipc	a2,0x4
ffffffffc02012ac:	e5860613          	addi	a2,a2,-424 # ffffffffc0205100 <etext+0x91a>
ffffffffc02012b0:	11700593          	li	a1,279
ffffffffc02012b4:	00004517          	auipc	a0,0x4
ffffffffc02012b8:	e6450513          	addi	a0,a0,-412 # ffffffffc0205118 <etext+0x932>
ffffffffc02012bc:	976ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02012c0:	00004697          	auipc	a3,0x4
ffffffffc02012c4:	18868693          	addi	a3,a3,392 # ffffffffc0205448 <etext+0xc62>
ffffffffc02012c8:	00004617          	auipc	a2,0x4
ffffffffc02012cc:	e3860613          	addi	a2,a2,-456 # ffffffffc0205100 <etext+0x91a>
ffffffffc02012d0:	12600593          	li	a1,294
ffffffffc02012d4:	00004517          	auipc	a0,0x4
ffffffffc02012d8:	e4450513          	addi	a0,a0,-444 # ffffffffc0205118 <etext+0x932>
ffffffffc02012dc:	956ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02012e0:	00004697          	auipc	a3,0x4
ffffffffc02012e4:	e5068693          	addi	a3,a3,-432 # ffffffffc0205130 <etext+0x94a>
ffffffffc02012e8:	00004617          	auipc	a2,0x4
ffffffffc02012ec:	e1860613          	addi	a2,a2,-488 # ffffffffc0205100 <etext+0x91a>
ffffffffc02012f0:	0f300593          	li	a1,243
ffffffffc02012f4:	00004517          	auipc	a0,0x4
ffffffffc02012f8:	e2450513          	addi	a0,a0,-476 # ffffffffc0205118 <etext+0x932>
ffffffffc02012fc:	936ff0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201300:	00004697          	auipc	a3,0x4
ffffffffc0201304:	e7068693          	addi	a3,a3,-400 # ffffffffc0205170 <etext+0x98a>
ffffffffc0201308:	00004617          	auipc	a2,0x4
ffffffffc020130c:	df860613          	addi	a2,a2,-520 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201310:	0ba00593          	li	a1,186
ffffffffc0201314:	00004517          	auipc	a0,0x4
ffffffffc0201318:	e0450513          	addi	a0,a0,-508 # ffffffffc0205118 <etext+0x932>
ffffffffc020131c:	916ff0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0201320 <default_free_pages>:
ffffffffc0201320:	1141                	addi	sp,sp,-16
ffffffffc0201322:	e406                	sd	ra,8(sp)
ffffffffc0201324:	14058463          	beqz	a1,ffffffffc020146c <default_free_pages+0x14c>
ffffffffc0201328:	00659713          	slli	a4,a1,0x6
ffffffffc020132c:	00e506b3          	add	a3,a0,a4
ffffffffc0201330:	87aa                	mv	a5,a0
ffffffffc0201332:	c30d                	beqz	a4,ffffffffc0201354 <default_free_pages+0x34>
ffffffffc0201334:	6798                	ld	a4,8(a5)
ffffffffc0201336:	8b05                	andi	a4,a4,1
ffffffffc0201338:	10071a63          	bnez	a4,ffffffffc020144c <default_free_pages+0x12c>
ffffffffc020133c:	6798                	ld	a4,8(a5)
ffffffffc020133e:	8b09                	andi	a4,a4,2
ffffffffc0201340:	10071663          	bnez	a4,ffffffffc020144c <default_free_pages+0x12c>
ffffffffc0201344:	0007b423          	sd	zero,8(a5)
ffffffffc0201348:	0007a023          	sw	zero,0(a5)
ffffffffc020134c:	04078793          	addi	a5,a5,64
ffffffffc0201350:	fed792e3          	bne	a5,a3,ffffffffc0201334 <default_free_pages+0x14>
ffffffffc0201354:	2581                	sext.w	a1,a1
ffffffffc0201356:	c90c                	sw	a1,16(a0)
ffffffffc0201358:	00850893          	addi	a7,a0,8
ffffffffc020135c:	4789                	li	a5,2
ffffffffc020135e:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201362:	00010697          	auipc	a3,0x10
ffffffffc0201366:	0f668693          	addi	a3,a3,246 # ffffffffc0211458 <free_area>
ffffffffc020136a:	4a98                	lw	a4,16(a3)
ffffffffc020136c:	669c                	ld	a5,8(a3)
ffffffffc020136e:	9f2d                	addw	a4,a4,a1
ffffffffc0201370:	ca98                	sw	a4,16(a3)
ffffffffc0201372:	0ad78163          	beq	a5,a3,ffffffffc0201414 <default_free_pages+0xf4>
ffffffffc0201376:	fe878713          	addi	a4,a5,-24
ffffffffc020137a:	4581                	li	a1,0
ffffffffc020137c:	01850613          	addi	a2,a0,24
ffffffffc0201380:	00e56a63          	bltu	a0,a4,ffffffffc0201394 <default_free_pages+0x74>
ffffffffc0201384:	6798                	ld	a4,8(a5)
ffffffffc0201386:	04d70c63          	beq	a4,a3,ffffffffc02013de <default_free_pages+0xbe>
ffffffffc020138a:	87ba                	mv	a5,a4
ffffffffc020138c:	fe878713          	addi	a4,a5,-24
ffffffffc0201390:	fee57ae3          	bgeu	a0,a4,ffffffffc0201384 <default_free_pages+0x64>
ffffffffc0201394:	c199                	beqz	a1,ffffffffc020139a <default_free_pages+0x7a>
ffffffffc0201396:	0106b023          	sd	a6,0(a3)
ffffffffc020139a:	6398                	ld	a4,0(a5)
ffffffffc020139c:	e390                	sd	a2,0(a5)
ffffffffc020139e:	e710                	sd	a2,8(a4)
ffffffffc02013a0:	f11c                	sd	a5,32(a0)
ffffffffc02013a2:	ed18                	sd	a4,24(a0)
ffffffffc02013a4:	00d70d63          	beq	a4,a3,ffffffffc02013be <default_free_pages+0x9e>
ffffffffc02013a8:	ff872583          	lw	a1,-8(a4)
ffffffffc02013ac:	fe870613          	addi	a2,a4,-24
ffffffffc02013b0:	02059813          	slli	a6,a1,0x20
ffffffffc02013b4:	01a85793          	srli	a5,a6,0x1a
ffffffffc02013b8:	97b2                	add	a5,a5,a2
ffffffffc02013ba:	02f50c63          	beq	a0,a5,ffffffffc02013f2 <default_free_pages+0xd2>
ffffffffc02013be:	711c                	ld	a5,32(a0)
ffffffffc02013c0:	00d78c63          	beq	a5,a3,ffffffffc02013d8 <default_free_pages+0xb8>
ffffffffc02013c4:	4910                	lw	a2,16(a0)
ffffffffc02013c6:	fe878693          	addi	a3,a5,-24
ffffffffc02013ca:	02061593          	slli	a1,a2,0x20
ffffffffc02013ce:	01a5d713          	srli	a4,a1,0x1a
ffffffffc02013d2:	972a                	add	a4,a4,a0
ffffffffc02013d4:	04e68c63          	beq	a3,a4,ffffffffc020142c <default_free_pages+0x10c>
ffffffffc02013d8:	60a2                	ld	ra,8(sp)
ffffffffc02013da:	0141                	addi	sp,sp,16
ffffffffc02013dc:	8082                	ret
ffffffffc02013de:	e790                	sd	a2,8(a5)
ffffffffc02013e0:	f114                	sd	a3,32(a0)
ffffffffc02013e2:	6798                	ld	a4,8(a5)
ffffffffc02013e4:	ed1c                	sd	a5,24(a0)
ffffffffc02013e6:	8832                	mv	a6,a2
ffffffffc02013e8:	02d70f63          	beq	a4,a3,ffffffffc0201426 <default_free_pages+0x106>
ffffffffc02013ec:	4585                	li	a1,1
ffffffffc02013ee:	87ba                	mv	a5,a4
ffffffffc02013f0:	bf71                	j	ffffffffc020138c <default_free_pages+0x6c>
ffffffffc02013f2:	491c                	lw	a5,16(a0)
ffffffffc02013f4:	9fad                	addw	a5,a5,a1
ffffffffc02013f6:	fef72c23          	sw	a5,-8(a4)
ffffffffc02013fa:	57f5                	li	a5,-3
ffffffffc02013fc:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201400:	01853803          	ld	a6,24(a0)
ffffffffc0201404:	710c                	ld	a1,32(a0)
ffffffffc0201406:	8532                	mv	a0,a2
ffffffffc0201408:	00b83423          	sd	a1,8(a6)
ffffffffc020140c:	671c                	ld	a5,8(a4)
ffffffffc020140e:	0105b023          	sd	a6,0(a1)
ffffffffc0201412:	b77d                	j	ffffffffc02013c0 <default_free_pages+0xa0>
ffffffffc0201414:	60a2                	ld	ra,8(sp)
ffffffffc0201416:	01850713          	addi	a4,a0,24
ffffffffc020141a:	e398                	sd	a4,0(a5)
ffffffffc020141c:	e798                	sd	a4,8(a5)
ffffffffc020141e:	f11c                	sd	a5,32(a0)
ffffffffc0201420:	ed1c                	sd	a5,24(a0)
ffffffffc0201422:	0141                	addi	sp,sp,16
ffffffffc0201424:	8082                	ret
ffffffffc0201426:	e290                	sd	a2,0(a3)
ffffffffc0201428:	873e                	mv	a4,a5
ffffffffc020142a:	bfad                	j	ffffffffc02013a4 <default_free_pages+0x84>
ffffffffc020142c:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201430:	ff078693          	addi	a3,a5,-16
ffffffffc0201434:	9f31                	addw	a4,a4,a2
ffffffffc0201436:	c918                	sw	a4,16(a0)
ffffffffc0201438:	5775                	li	a4,-3
ffffffffc020143a:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc020143e:	6398                	ld	a4,0(a5)
ffffffffc0201440:	679c                	ld	a5,8(a5)
ffffffffc0201442:	60a2                	ld	ra,8(sp)
ffffffffc0201444:	e71c                	sd	a5,8(a4)
ffffffffc0201446:	e398                	sd	a4,0(a5)
ffffffffc0201448:	0141                	addi	sp,sp,16
ffffffffc020144a:	8082                	ret
ffffffffc020144c:	00004697          	auipc	a3,0x4
ffffffffc0201450:	01468693          	addi	a3,a3,20 # ffffffffc0205460 <etext+0xc7a>
ffffffffc0201454:	00004617          	auipc	a2,0x4
ffffffffc0201458:	cac60613          	addi	a2,a2,-852 # ffffffffc0205100 <etext+0x91a>
ffffffffc020145c:	08300593          	li	a1,131
ffffffffc0201460:	00004517          	auipc	a0,0x4
ffffffffc0201464:	cb850513          	addi	a0,a0,-840 # ffffffffc0205118 <etext+0x932>
ffffffffc0201468:	fcbfe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020146c:	00004697          	auipc	a3,0x4
ffffffffc0201470:	fec68693          	addi	a3,a3,-20 # ffffffffc0205458 <etext+0xc72>
ffffffffc0201474:	00004617          	auipc	a2,0x4
ffffffffc0201478:	c8c60613          	addi	a2,a2,-884 # ffffffffc0205100 <etext+0x91a>
ffffffffc020147c:	08000593          	li	a1,128
ffffffffc0201480:	00004517          	auipc	a0,0x4
ffffffffc0201484:	c9850513          	addi	a0,a0,-872 # ffffffffc0205118 <etext+0x932>
ffffffffc0201488:	fabfe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc020148c <default_alloc_pages>:
ffffffffc020148c:	c949                	beqz	a0,ffffffffc020151e <default_alloc_pages+0x92>
ffffffffc020148e:	00010617          	auipc	a2,0x10
ffffffffc0201492:	fca60613          	addi	a2,a2,-54 # ffffffffc0211458 <free_area>
ffffffffc0201496:	4a0c                	lw	a1,16(a2)
ffffffffc0201498:	872a                	mv	a4,a0
ffffffffc020149a:	02059793          	slli	a5,a1,0x20
ffffffffc020149e:	9381                	srli	a5,a5,0x20
ffffffffc02014a0:	00a7eb63          	bltu	a5,a0,ffffffffc02014b6 <default_alloc_pages+0x2a>
ffffffffc02014a4:	87b2                	mv	a5,a2
ffffffffc02014a6:	a029                	j	ffffffffc02014b0 <default_alloc_pages+0x24>
ffffffffc02014a8:	ff87e683          	lwu	a3,-8(a5)
ffffffffc02014ac:	00e6f763          	bgeu	a3,a4,ffffffffc02014ba <default_alloc_pages+0x2e>
ffffffffc02014b0:	679c                	ld	a5,8(a5)
ffffffffc02014b2:	fec79be3          	bne	a5,a2,ffffffffc02014a8 <default_alloc_pages+0x1c>
ffffffffc02014b6:	4501                	li	a0,0
ffffffffc02014b8:	8082                	ret
ffffffffc02014ba:	0087b883          	ld	a7,8(a5)
ffffffffc02014be:	ff87a803          	lw	a6,-8(a5)
ffffffffc02014c2:	6394                	ld	a3,0(a5)
ffffffffc02014c4:	fe878513          	addi	a0,a5,-24
ffffffffc02014c8:	02081313          	slli	t1,a6,0x20
ffffffffc02014cc:	0116b423          	sd	a7,8(a3)
ffffffffc02014d0:	00d8b023          	sd	a3,0(a7)
ffffffffc02014d4:	02035313          	srli	t1,t1,0x20
ffffffffc02014d8:	0007089b          	sext.w	a7,a4
ffffffffc02014dc:	02677963          	bgeu	a4,t1,ffffffffc020150e <default_alloc_pages+0x82>
ffffffffc02014e0:	071a                	slli	a4,a4,0x6
ffffffffc02014e2:	972a                	add	a4,a4,a0
ffffffffc02014e4:	4118083b          	subw	a6,a6,a7
ffffffffc02014e8:	01072823          	sw	a6,16(a4)
ffffffffc02014ec:	4589                	li	a1,2
ffffffffc02014ee:	00870813          	addi	a6,a4,8
ffffffffc02014f2:	40b8302f          	amoor.d	zero,a1,(a6)
ffffffffc02014f6:	0086b803          	ld	a6,8(a3)
ffffffffc02014fa:	01870313          	addi	t1,a4,24
ffffffffc02014fe:	4a0c                	lw	a1,16(a2)
ffffffffc0201500:	00683023          	sd	t1,0(a6)
ffffffffc0201504:	0066b423          	sd	t1,8(a3)
ffffffffc0201508:	03073023          	sd	a6,32(a4)
ffffffffc020150c:	ef14                	sd	a3,24(a4)
ffffffffc020150e:	411585bb          	subw	a1,a1,a7
ffffffffc0201512:	ca0c                	sw	a1,16(a2)
ffffffffc0201514:	5775                	li	a4,-3
ffffffffc0201516:	17c1                	addi	a5,a5,-16
ffffffffc0201518:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc020151c:	8082                	ret
ffffffffc020151e:	1141                	addi	sp,sp,-16
ffffffffc0201520:	00004697          	auipc	a3,0x4
ffffffffc0201524:	f3868693          	addi	a3,a3,-200 # ffffffffc0205458 <etext+0xc72>
ffffffffc0201528:	00004617          	auipc	a2,0x4
ffffffffc020152c:	bd860613          	addi	a2,a2,-1064 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201530:	06200593          	li	a1,98
ffffffffc0201534:	00004517          	auipc	a0,0x4
ffffffffc0201538:	be450513          	addi	a0,a0,-1052 # ffffffffc0205118 <etext+0x932>
ffffffffc020153c:	e406                	sd	ra,8(sp)
ffffffffc020153e:	ef5fe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0201542 <default_init_memmap>:
ffffffffc0201542:	1141                	addi	sp,sp,-16
ffffffffc0201544:	e406                	sd	ra,8(sp)
ffffffffc0201546:	c5f1                	beqz	a1,ffffffffc0201612 <default_init_memmap+0xd0>
ffffffffc0201548:	00659713          	slli	a4,a1,0x6
ffffffffc020154c:	00e506b3          	add	a3,a0,a4
ffffffffc0201550:	87aa                	mv	a5,a0
ffffffffc0201552:	cf11                	beqz	a4,ffffffffc020156e <default_init_memmap+0x2c>
ffffffffc0201554:	6798                	ld	a4,8(a5)
ffffffffc0201556:	8b05                	andi	a4,a4,1
ffffffffc0201558:	cf49                	beqz	a4,ffffffffc02015f2 <default_init_memmap+0xb0>
ffffffffc020155a:	0007a823          	sw	zero,16(a5)
ffffffffc020155e:	0007b423          	sd	zero,8(a5)
ffffffffc0201562:	0007a023          	sw	zero,0(a5)
ffffffffc0201566:	04078793          	addi	a5,a5,64
ffffffffc020156a:	fed795e3          	bne	a5,a3,ffffffffc0201554 <default_init_memmap+0x12>
ffffffffc020156e:	2581                	sext.w	a1,a1
ffffffffc0201570:	c90c                	sw	a1,16(a0)
ffffffffc0201572:	4789                	li	a5,2
ffffffffc0201574:	00850713          	addi	a4,a0,8
ffffffffc0201578:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc020157c:	00010697          	auipc	a3,0x10
ffffffffc0201580:	edc68693          	addi	a3,a3,-292 # ffffffffc0211458 <free_area>
ffffffffc0201584:	4a98                	lw	a4,16(a3)
ffffffffc0201586:	669c                	ld	a5,8(a3)
ffffffffc0201588:	9f2d                	addw	a4,a4,a1
ffffffffc020158a:	ca98                	sw	a4,16(a3)
ffffffffc020158c:	04d78663          	beq	a5,a3,ffffffffc02015d8 <default_init_memmap+0x96>
ffffffffc0201590:	fe878713          	addi	a4,a5,-24
ffffffffc0201594:	4581                	li	a1,0
ffffffffc0201596:	01850613          	addi	a2,a0,24
ffffffffc020159a:	00e56a63          	bltu	a0,a4,ffffffffc02015ae <default_init_memmap+0x6c>
ffffffffc020159e:	6798                	ld	a4,8(a5)
ffffffffc02015a0:	02d70263          	beq	a4,a3,ffffffffc02015c4 <default_init_memmap+0x82>
ffffffffc02015a4:	87ba                	mv	a5,a4
ffffffffc02015a6:	fe878713          	addi	a4,a5,-24
ffffffffc02015aa:	fee57ae3          	bgeu	a0,a4,ffffffffc020159e <default_init_memmap+0x5c>
ffffffffc02015ae:	c199                	beqz	a1,ffffffffc02015b4 <default_init_memmap+0x72>
ffffffffc02015b0:	0106b023          	sd	a6,0(a3)
ffffffffc02015b4:	6398                	ld	a4,0(a5)
ffffffffc02015b6:	60a2                	ld	ra,8(sp)
ffffffffc02015b8:	e390                	sd	a2,0(a5)
ffffffffc02015ba:	e710                	sd	a2,8(a4)
ffffffffc02015bc:	f11c                	sd	a5,32(a0)
ffffffffc02015be:	ed18                	sd	a4,24(a0)
ffffffffc02015c0:	0141                	addi	sp,sp,16
ffffffffc02015c2:	8082                	ret
ffffffffc02015c4:	e790                	sd	a2,8(a5)
ffffffffc02015c6:	f114                	sd	a3,32(a0)
ffffffffc02015c8:	6798                	ld	a4,8(a5)
ffffffffc02015ca:	ed1c                	sd	a5,24(a0)
ffffffffc02015cc:	8832                	mv	a6,a2
ffffffffc02015ce:	00d70e63          	beq	a4,a3,ffffffffc02015ea <default_init_memmap+0xa8>
ffffffffc02015d2:	4585                	li	a1,1
ffffffffc02015d4:	87ba                	mv	a5,a4
ffffffffc02015d6:	bfc1                	j	ffffffffc02015a6 <default_init_memmap+0x64>
ffffffffc02015d8:	60a2                	ld	ra,8(sp)
ffffffffc02015da:	01850713          	addi	a4,a0,24
ffffffffc02015de:	e398                	sd	a4,0(a5)
ffffffffc02015e0:	e798                	sd	a4,8(a5)
ffffffffc02015e2:	f11c                	sd	a5,32(a0)
ffffffffc02015e4:	ed1c                	sd	a5,24(a0)
ffffffffc02015e6:	0141                	addi	sp,sp,16
ffffffffc02015e8:	8082                	ret
ffffffffc02015ea:	60a2                	ld	ra,8(sp)
ffffffffc02015ec:	e290                	sd	a2,0(a3)
ffffffffc02015ee:	0141                	addi	sp,sp,16
ffffffffc02015f0:	8082                	ret
ffffffffc02015f2:	00004697          	auipc	a3,0x4
ffffffffc02015f6:	e9668693          	addi	a3,a3,-362 # ffffffffc0205488 <etext+0xca2>
ffffffffc02015fa:	00004617          	auipc	a2,0x4
ffffffffc02015fe:	b0660613          	addi	a2,a2,-1274 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201602:	04900593          	li	a1,73
ffffffffc0201606:	00004517          	auipc	a0,0x4
ffffffffc020160a:	b1250513          	addi	a0,a0,-1262 # ffffffffc0205118 <etext+0x932>
ffffffffc020160e:	e25fe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201612:	00004697          	auipc	a3,0x4
ffffffffc0201616:	e4668693          	addi	a3,a3,-442 # ffffffffc0205458 <etext+0xc72>
ffffffffc020161a:	00004617          	auipc	a2,0x4
ffffffffc020161e:	ae660613          	addi	a2,a2,-1306 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201622:	04600593          	li	a1,70
ffffffffc0201626:	00004517          	auipc	a0,0x4
ffffffffc020162a:	af250513          	addi	a0,a0,-1294 # ffffffffc0205118 <etext+0x932>
ffffffffc020162e:	e05fe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0201632 <slob_free>:
ffffffffc0201632:	cd49                	beqz	a0,ffffffffc02016cc <slob_free+0x9a>
ffffffffc0201634:	1141                	addi	sp,sp,-16
ffffffffc0201636:	e022                	sd	s0,0(sp)
ffffffffc0201638:	e406                	sd	ra,8(sp)
ffffffffc020163a:	842a                	mv	s0,a0
ffffffffc020163c:	eda1                	bnez	a1,ffffffffc0201694 <slob_free+0x62>
ffffffffc020163e:	100027f3          	csrr	a5,sstatus
ffffffffc0201642:	8b89                	andi	a5,a5,2
ffffffffc0201644:	4501                	li	a0,0
ffffffffc0201646:	efb9                	bnez	a5,ffffffffc02016a4 <slob_free+0x72>
ffffffffc0201648:	00009617          	auipc	a2,0x9
ffffffffc020164c:	a0860613          	addi	a2,a2,-1528 # ffffffffc020a050 <slobfree>
ffffffffc0201650:	621c                	ld	a5,0(a2)
ffffffffc0201652:	6798                	ld	a4,8(a5)
ffffffffc0201654:	0287fa63          	bgeu	a5,s0,ffffffffc0201688 <slob_free+0x56>
ffffffffc0201658:	00e46463          	bltu	s0,a4,ffffffffc0201660 <slob_free+0x2e>
ffffffffc020165c:	02e7ea63          	bltu	a5,a4,ffffffffc0201690 <slob_free+0x5e>
ffffffffc0201660:	400c                	lw	a1,0(s0)
ffffffffc0201662:	00459693          	slli	a3,a1,0x4
ffffffffc0201666:	96a2                	add	a3,a3,s0
ffffffffc0201668:	04d70d63          	beq	a4,a3,ffffffffc02016c2 <slob_free+0x90>
ffffffffc020166c:	438c                	lw	a1,0(a5)
ffffffffc020166e:	e418                	sd	a4,8(s0)
ffffffffc0201670:	00459693          	slli	a3,a1,0x4
ffffffffc0201674:	96be                	add	a3,a3,a5
ffffffffc0201676:	04d40063          	beq	s0,a3,ffffffffc02016b6 <slob_free+0x84>
ffffffffc020167a:	e780                	sd	s0,8(a5)
ffffffffc020167c:	e21c                	sd	a5,0(a2)
ffffffffc020167e:	e51d                	bnez	a0,ffffffffc02016ac <slob_free+0x7a>
ffffffffc0201680:	60a2                	ld	ra,8(sp)
ffffffffc0201682:	6402                	ld	s0,0(sp)
ffffffffc0201684:	0141                	addi	sp,sp,16
ffffffffc0201686:	8082                	ret
ffffffffc0201688:	00e7e463          	bltu	a5,a4,ffffffffc0201690 <slob_free+0x5e>
ffffffffc020168c:	fce46ae3          	bltu	s0,a4,ffffffffc0201660 <slob_free+0x2e>
ffffffffc0201690:	87ba                	mv	a5,a4
ffffffffc0201692:	b7c1                	j	ffffffffc0201652 <slob_free+0x20>
ffffffffc0201694:	25bd                	addiw	a1,a1,15
ffffffffc0201696:	8191                	srli	a1,a1,0x4
ffffffffc0201698:	c10c                	sw	a1,0(a0)
ffffffffc020169a:	100027f3          	csrr	a5,sstatus
ffffffffc020169e:	8b89                	andi	a5,a5,2
ffffffffc02016a0:	4501                	li	a0,0
ffffffffc02016a2:	d3dd                	beqz	a5,ffffffffc0201648 <slob_free+0x16>
ffffffffc02016a4:	f0dfe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc02016a8:	4505                	li	a0,1
ffffffffc02016aa:	bf79                	j	ffffffffc0201648 <slob_free+0x16>
ffffffffc02016ac:	6402                	ld	s0,0(sp)
ffffffffc02016ae:	60a2                	ld	ra,8(sp)
ffffffffc02016b0:	0141                	addi	sp,sp,16
ffffffffc02016b2:	ef9fe06f          	j	ffffffffc02005aa <intr_enable>
ffffffffc02016b6:	4014                	lw	a3,0(s0)
ffffffffc02016b8:	843a                	mv	s0,a4
ffffffffc02016ba:	00b6873b          	addw	a4,a3,a1
ffffffffc02016be:	c398                	sw	a4,0(a5)
ffffffffc02016c0:	bf6d                	j	ffffffffc020167a <slob_free+0x48>
ffffffffc02016c2:	4314                	lw	a3,0(a4)
ffffffffc02016c4:	6718                	ld	a4,8(a4)
ffffffffc02016c6:	9ead                	addw	a3,a3,a1
ffffffffc02016c8:	c014                	sw	a3,0(s0)
ffffffffc02016ca:	b74d                	j	ffffffffc020166c <slob_free+0x3a>
ffffffffc02016cc:	8082                	ret

ffffffffc02016ce <__slob_get_free_pages.constprop.0>:
ffffffffc02016ce:	4785                	li	a5,1
ffffffffc02016d0:	1141                	addi	sp,sp,-16
ffffffffc02016d2:	00a7953b          	sllw	a0,a5,a0
ffffffffc02016d6:	e406                	sd	ra,8(sp)
ffffffffc02016d8:	348000ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc02016dc:	c91d                	beqz	a0,ffffffffc0201712 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc02016de:	00014797          	auipc	a5,0x14
ffffffffc02016e2:	e9a7b783          	ld	a5,-358(a5) # ffffffffc0215578 <pages>
ffffffffc02016e6:	8d1d                	sub	a0,a0,a5
ffffffffc02016e8:	8519                	srai	a0,a0,0x6
ffffffffc02016ea:	00005797          	auipc	a5,0x5
ffffffffc02016ee:	1867b783          	ld	a5,390(a5) # ffffffffc0206870 <nbase>
ffffffffc02016f2:	953e                	add	a0,a0,a5
ffffffffc02016f4:	00c51793          	slli	a5,a0,0xc
ffffffffc02016f8:	83b1                	srli	a5,a5,0xc
ffffffffc02016fa:	00014717          	auipc	a4,0x14
ffffffffc02016fe:	e7673703          	ld	a4,-394(a4) # ffffffffc0215570 <npage>
ffffffffc0201702:	0532                	slli	a0,a0,0xc
ffffffffc0201704:	00e7fa63          	bgeu	a5,a4,ffffffffc0201718 <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201708:	00014797          	auipc	a5,0x14
ffffffffc020170c:	e607b783          	ld	a5,-416(a5) # ffffffffc0215568 <va_pa_offset>
ffffffffc0201710:	953e                	add	a0,a0,a5
ffffffffc0201712:	60a2                	ld	ra,8(sp)
ffffffffc0201714:	0141                	addi	sp,sp,16
ffffffffc0201716:	8082                	ret
ffffffffc0201718:	86aa                	mv	a3,a0
ffffffffc020171a:	00004617          	auipc	a2,0x4
ffffffffc020171e:	d9660613          	addi	a2,a2,-618 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0201722:	06900593          	li	a1,105
ffffffffc0201726:	00004517          	auipc	a0,0x4
ffffffffc020172a:	db250513          	addi	a0,a0,-590 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc020172e:	d05fe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0201732 <slob_alloc.constprop.0>:
ffffffffc0201732:	1101                	addi	sp,sp,-32
ffffffffc0201734:	ec06                	sd	ra,24(sp)
ffffffffc0201736:	e822                	sd	s0,16(sp)
ffffffffc0201738:	e426                	sd	s1,8(sp)
ffffffffc020173a:	e04a                	sd	s2,0(sp)
ffffffffc020173c:	01050713          	addi	a4,a0,16
ffffffffc0201740:	6785                	lui	a5,0x1
ffffffffc0201742:	0cf77363          	bgeu	a4,a5,ffffffffc0201808 <slob_alloc.constprop.0+0xd6>
ffffffffc0201746:	00f50493          	addi	s1,a0,15
ffffffffc020174a:	8091                	srli	s1,s1,0x4
ffffffffc020174c:	2481                	sext.w	s1,s1
ffffffffc020174e:	10002673          	csrr	a2,sstatus
ffffffffc0201752:	8a09                	andi	a2,a2,2
ffffffffc0201754:	e25d                	bnez	a2,ffffffffc02017fa <slob_alloc.constprop.0+0xc8>
ffffffffc0201756:	00009917          	auipc	s2,0x9
ffffffffc020175a:	8fa90913          	addi	s2,s2,-1798 # ffffffffc020a050 <slobfree>
ffffffffc020175e:	00093683          	ld	a3,0(s2)
ffffffffc0201762:	669c                	ld	a5,8(a3)
ffffffffc0201764:	4398                	lw	a4,0(a5)
ffffffffc0201766:	08975e63          	bge	a4,s1,ffffffffc0201802 <slob_alloc.constprop.0+0xd0>
ffffffffc020176a:	00f68b63          	beq	a3,a5,ffffffffc0201780 <slob_alloc.constprop.0+0x4e>
ffffffffc020176e:	6780                	ld	s0,8(a5)
ffffffffc0201770:	4018                	lw	a4,0(s0)
ffffffffc0201772:	02975a63          	bge	a4,s1,ffffffffc02017a6 <slob_alloc.constprop.0+0x74>
ffffffffc0201776:	00093683          	ld	a3,0(s2)
ffffffffc020177a:	87a2                	mv	a5,s0
ffffffffc020177c:	fef699e3          	bne	a3,a5,ffffffffc020176e <slob_alloc.constprop.0+0x3c>
ffffffffc0201780:	ee31                	bnez	a2,ffffffffc02017dc <slob_alloc.constprop.0+0xaa>
ffffffffc0201782:	4501                	li	a0,0
ffffffffc0201784:	f4bff0ef          	jal	ffffffffc02016ce <__slob_get_free_pages.constprop.0>
ffffffffc0201788:	842a                	mv	s0,a0
ffffffffc020178a:	cd05                	beqz	a0,ffffffffc02017c2 <slob_alloc.constprop.0+0x90>
ffffffffc020178c:	6585                	lui	a1,0x1
ffffffffc020178e:	ea5ff0ef          	jal	ffffffffc0201632 <slob_free>
ffffffffc0201792:	10002673          	csrr	a2,sstatus
ffffffffc0201796:	8a09                	andi	a2,a2,2
ffffffffc0201798:	ee05                	bnez	a2,ffffffffc02017d0 <slob_alloc.constprop.0+0x9e>
ffffffffc020179a:	00093783          	ld	a5,0(s2)
ffffffffc020179e:	6780                	ld	s0,8(a5)
ffffffffc02017a0:	4018                	lw	a4,0(s0)
ffffffffc02017a2:	fc974ae3          	blt	a4,s1,ffffffffc0201776 <slob_alloc.constprop.0+0x44>
ffffffffc02017a6:	04e48763          	beq	s1,a4,ffffffffc02017f4 <slob_alloc.constprop.0+0xc2>
ffffffffc02017aa:	00449693          	slli	a3,s1,0x4
ffffffffc02017ae:	96a2                	add	a3,a3,s0
ffffffffc02017b0:	e794                	sd	a3,8(a5)
ffffffffc02017b2:	640c                	ld	a1,8(s0)
ffffffffc02017b4:	9f05                	subw	a4,a4,s1
ffffffffc02017b6:	c298                	sw	a4,0(a3)
ffffffffc02017b8:	e68c                	sd	a1,8(a3)
ffffffffc02017ba:	c004                	sw	s1,0(s0)
ffffffffc02017bc:	00f93023          	sd	a5,0(s2)
ffffffffc02017c0:	e20d                	bnez	a2,ffffffffc02017e2 <slob_alloc.constprop.0+0xb0>
ffffffffc02017c2:	60e2                	ld	ra,24(sp)
ffffffffc02017c4:	8522                	mv	a0,s0
ffffffffc02017c6:	6442                	ld	s0,16(sp)
ffffffffc02017c8:	64a2                	ld	s1,8(sp)
ffffffffc02017ca:	6902                	ld	s2,0(sp)
ffffffffc02017cc:	6105                	addi	sp,sp,32
ffffffffc02017ce:	8082                	ret
ffffffffc02017d0:	de1fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc02017d4:	00093783          	ld	a5,0(s2)
ffffffffc02017d8:	4605                	li	a2,1
ffffffffc02017da:	b7d1                	j	ffffffffc020179e <slob_alloc.constprop.0+0x6c>
ffffffffc02017dc:	dcffe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc02017e0:	b74d                	j	ffffffffc0201782 <slob_alloc.constprop.0+0x50>
ffffffffc02017e2:	dc9fe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc02017e6:	60e2                	ld	ra,24(sp)
ffffffffc02017e8:	8522                	mv	a0,s0
ffffffffc02017ea:	6442                	ld	s0,16(sp)
ffffffffc02017ec:	64a2                	ld	s1,8(sp)
ffffffffc02017ee:	6902                	ld	s2,0(sp)
ffffffffc02017f0:	6105                	addi	sp,sp,32
ffffffffc02017f2:	8082                	ret
ffffffffc02017f4:	6418                	ld	a4,8(s0)
ffffffffc02017f6:	e798                	sd	a4,8(a5)
ffffffffc02017f8:	b7d1                	j	ffffffffc02017bc <slob_alloc.constprop.0+0x8a>
ffffffffc02017fa:	db7fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc02017fe:	4605                	li	a2,1
ffffffffc0201800:	bf99                	j	ffffffffc0201756 <slob_alloc.constprop.0+0x24>
ffffffffc0201802:	843e                	mv	s0,a5
ffffffffc0201804:	87b6                	mv	a5,a3
ffffffffc0201806:	b745                	j	ffffffffc02017a6 <slob_alloc.constprop.0+0x74>
ffffffffc0201808:	00004697          	auipc	a3,0x4
ffffffffc020180c:	ce068693          	addi	a3,a3,-800 # ffffffffc02054e8 <etext+0xd02>
ffffffffc0201810:	00004617          	auipc	a2,0x4
ffffffffc0201814:	8f060613          	addi	a2,a2,-1808 # ffffffffc0205100 <etext+0x91a>
ffffffffc0201818:	06300593          	li	a1,99
ffffffffc020181c:	00004517          	auipc	a0,0x4
ffffffffc0201820:	cec50513          	addi	a0,a0,-788 # ffffffffc0205508 <etext+0xd22>
ffffffffc0201824:	c0ffe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0201828 <kmalloc_init>:
ffffffffc0201828:	1141                	addi	sp,sp,-16
ffffffffc020182a:	00004517          	auipc	a0,0x4
ffffffffc020182e:	cf650513          	addi	a0,a0,-778 # ffffffffc0205520 <etext+0xd3a>
ffffffffc0201832:	e406                	sd	ra,8(sp)
ffffffffc0201834:	94dfe0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0201838:	60a2                	ld	ra,8(sp)
ffffffffc020183a:	00004517          	auipc	a0,0x4
ffffffffc020183e:	cfe50513          	addi	a0,a0,-770 # ffffffffc0205538 <etext+0xd52>
ffffffffc0201842:	0141                	addi	sp,sp,16
ffffffffc0201844:	93dfe06f          	j	ffffffffc0200180 <cprintf>

ffffffffc0201848 <kmalloc>:
ffffffffc0201848:	1101                	addi	sp,sp,-32
ffffffffc020184a:	6785                	lui	a5,0x1
ffffffffc020184c:	e822                	sd	s0,16(sp)
ffffffffc020184e:	ec06                	sd	ra,24(sp)
ffffffffc0201850:	17bd                	addi	a5,a5,-17 # fef <kern_entry-0xffffffffc01ff011>
ffffffffc0201852:	842a                	mv	s0,a0
ffffffffc0201854:	04a7fa63          	bgeu	a5,a0,ffffffffc02018a8 <kmalloc+0x60>
ffffffffc0201858:	4561                	li	a0,24
ffffffffc020185a:	e426                	sd	s1,8(sp)
ffffffffc020185c:	ed7ff0ef          	jal	ffffffffc0201732 <slob_alloc.constprop.0>
ffffffffc0201860:	84aa                	mv	s1,a0
ffffffffc0201862:	c549                	beqz	a0,ffffffffc02018ec <kmalloc+0xa4>
ffffffffc0201864:	e04a                	sd	s2,0(sp)
ffffffffc0201866:	0004079b          	sext.w	a5,s0
ffffffffc020186a:	6905                	lui	s2,0x1
ffffffffc020186c:	4501                	li	a0,0
ffffffffc020186e:	00f95763          	bge	s2,a5,ffffffffc020187c <kmalloc+0x34>
ffffffffc0201872:	6705                	lui	a4,0x1
ffffffffc0201874:	8785                	srai	a5,a5,0x1
ffffffffc0201876:	2505                	addiw	a0,a0,1
ffffffffc0201878:	fef74ee3          	blt	a4,a5,ffffffffc0201874 <kmalloc+0x2c>
ffffffffc020187c:	c088                	sw	a0,0(s1)
ffffffffc020187e:	e51ff0ef          	jal	ffffffffc02016ce <__slob_get_free_pages.constprop.0>
ffffffffc0201882:	e488                	sd	a0,8(s1)
ffffffffc0201884:	cd21                	beqz	a0,ffffffffc02018dc <kmalloc+0x94>
ffffffffc0201886:	100027f3          	csrr	a5,sstatus
ffffffffc020188a:	8b89                	andi	a5,a5,2
ffffffffc020188c:	e795                	bnez	a5,ffffffffc02018b8 <kmalloc+0x70>
ffffffffc020188e:	00014797          	auipc	a5,0x14
ffffffffc0201892:	cba78793          	addi	a5,a5,-838 # ffffffffc0215548 <bigblocks>
ffffffffc0201896:	6398                	ld	a4,0(a5)
ffffffffc0201898:	6902                	ld	s2,0(sp)
ffffffffc020189a:	e384                	sd	s1,0(a5)
ffffffffc020189c:	e898                	sd	a4,16(s1)
ffffffffc020189e:	64a2                	ld	s1,8(sp)
ffffffffc02018a0:	60e2                	ld	ra,24(sp)
ffffffffc02018a2:	6442                	ld	s0,16(sp)
ffffffffc02018a4:	6105                	addi	sp,sp,32
ffffffffc02018a6:	8082                	ret
ffffffffc02018a8:	0541                	addi	a0,a0,16
ffffffffc02018aa:	e89ff0ef          	jal	ffffffffc0201732 <slob_alloc.constprop.0>
ffffffffc02018ae:	87aa                	mv	a5,a0
ffffffffc02018b0:	0541                	addi	a0,a0,16
ffffffffc02018b2:	f7fd                	bnez	a5,ffffffffc02018a0 <kmalloc+0x58>
ffffffffc02018b4:	4501                	li	a0,0
ffffffffc02018b6:	b7ed                	j	ffffffffc02018a0 <kmalloc+0x58>
ffffffffc02018b8:	cf9fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc02018bc:	00014797          	auipc	a5,0x14
ffffffffc02018c0:	c8c78793          	addi	a5,a5,-884 # ffffffffc0215548 <bigblocks>
ffffffffc02018c4:	6398                	ld	a4,0(a5)
ffffffffc02018c6:	e384                	sd	s1,0(a5)
ffffffffc02018c8:	e898                	sd	a4,16(s1)
ffffffffc02018ca:	ce1fe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc02018ce:	60e2                	ld	ra,24(sp)
ffffffffc02018d0:	6442                	ld	s0,16(sp)
ffffffffc02018d2:	6488                	ld	a0,8(s1)
ffffffffc02018d4:	6902                	ld	s2,0(sp)
ffffffffc02018d6:	64a2                	ld	s1,8(sp)
ffffffffc02018d8:	6105                	addi	sp,sp,32
ffffffffc02018da:	8082                	ret
ffffffffc02018dc:	8526                	mv	a0,s1
ffffffffc02018de:	45e1                	li	a1,24
ffffffffc02018e0:	d53ff0ef          	jal	ffffffffc0201632 <slob_free>
ffffffffc02018e4:	4501                	li	a0,0
ffffffffc02018e6:	64a2                	ld	s1,8(sp)
ffffffffc02018e8:	6902                	ld	s2,0(sp)
ffffffffc02018ea:	bf5d                	j	ffffffffc02018a0 <kmalloc+0x58>
ffffffffc02018ec:	64a2                	ld	s1,8(sp)
ffffffffc02018ee:	4501                	li	a0,0
ffffffffc02018f0:	bf45                	j	ffffffffc02018a0 <kmalloc+0x58>

ffffffffc02018f2 <kfree>:
ffffffffc02018f2:	c169                	beqz	a0,ffffffffc02019b4 <kfree+0xc2>
ffffffffc02018f4:	1101                	addi	sp,sp,-32
ffffffffc02018f6:	e822                	sd	s0,16(sp)
ffffffffc02018f8:	ec06                	sd	ra,24(sp)
ffffffffc02018fa:	03451793          	slli	a5,a0,0x34
ffffffffc02018fe:	842a                	mv	s0,a0
ffffffffc0201900:	e7c9                	bnez	a5,ffffffffc020198a <kfree+0x98>
ffffffffc0201902:	100027f3          	csrr	a5,sstatus
ffffffffc0201906:	8b89                	andi	a5,a5,2
ffffffffc0201908:	ebc1                	bnez	a5,ffffffffc0201998 <kfree+0xa6>
ffffffffc020190a:	00014797          	auipc	a5,0x14
ffffffffc020190e:	c3e7b783          	ld	a5,-962(a5) # ffffffffc0215548 <bigblocks>
ffffffffc0201912:	4601                	li	a2,0
ffffffffc0201914:	cbbd                	beqz	a5,ffffffffc020198a <kfree+0x98>
ffffffffc0201916:	e426                	sd	s1,8(sp)
ffffffffc0201918:	00014697          	auipc	a3,0x14
ffffffffc020191c:	c3068693          	addi	a3,a3,-976 # ffffffffc0215548 <bigblocks>
ffffffffc0201920:	a021                	j	ffffffffc0201928 <kfree+0x36>
ffffffffc0201922:	01048693          	addi	a3,s1,16
ffffffffc0201926:	c3a5                	beqz	a5,ffffffffc0201986 <kfree+0x94>
ffffffffc0201928:	6798                	ld	a4,8(a5)
ffffffffc020192a:	84be                	mv	s1,a5
ffffffffc020192c:	6b9c                	ld	a5,16(a5)
ffffffffc020192e:	fe871ae3          	bne	a4,s0,ffffffffc0201922 <kfree+0x30>
ffffffffc0201932:	e29c                	sd	a5,0(a3)
ffffffffc0201934:	ee2d                	bnez	a2,ffffffffc02019ae <kfree+0xbc>
ffffffffc0201936:	c02007b7          	lui	a5,0xc0200
ffffffffc020193a:	4098                	lw	a4,0(s1)
ffffffffc020193c:	08f46963          	bltu	s0,a5,ffffffffc02019ce <kfree+0xdc>
ffffffffc0201940:	00014797          	auipc	a5,0x14
ffffffffc0201944:	c287b783          	ld	a5,-984(a5) # ffffffffc0215568 <va_pa_offset>
ffffffffc0201948:	8c1d                	sub	s0,s0,a5
ffffffffc020194a:	8031                	srli	s0,s0,0xc
ffffffffc020194c:	00014797          	auipc	a5,0x14
ffffffffc0201950:	c247b783          	ld	a5,-988(a5) # ffffffffc0215570 <npage>
ffffffffc0201954:	06f47163          	bgeu	s0,a5,ffffffffc02019b6 <kfree+0xc4>
ffffffffc0201958:	00005797          	auipc	a5,0x5
ffffffffc020195c:	f187b783          	ld	a5,-232(a5) # ffffffffc0206870 <nbase>
ffffffffc0201960:	8c1d                	sub	s0,s0,a5
ffffffffc0201962:	041a                	slli	s0,s0,0x6
ffffffffc0201964:	00014517          	auipc	a0,0x14
ffffffffc0201968:	c1453503          	ld	a0,-1004(a0) # ffffffffc0215578 <pages>
ffffffffc020196c:	4585                	li	a1,1
ffffffffc020196e:	9522                	add	a0,a0,s0
ffffffffc0201970:	00e595bb          	sllw	a1,a1,a4
ffffffffc0201974:	13c000ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0201978:	6442                	ld	s0,16(sp)
ffffffffc020197a:	60e2                	ld	ra,24(sp)
ffffffffc020197c:	8526                	mv	a0,s1
ffffffffc020197e:	64a2                	ld	s1,8(sp)
ffffffffc0201980:	45e1                	li	a1,24
ffffffffc0201982:	6105                	addi	sp,sp,32
ffffffffc0201984:	b17d                	j	ffffffffc0201632 <slob_free>
ffffffffc0201986:	64a2                	ld	s1,8(sp)
ffffffffc0201988:	e205                	bnez	a2,ffffffffc02019a8 <kfree+0xb6>
ffffffffc020198a:	ff040513          	addi	a0,s0,-16
ffffffffc020198e:	6442                	ld	s0,16(sp)
ffffffffc0201990:	60e2                	ld	ra,24(sp)
ffffffffc0201992:	4581                	li	a1,0
ffffffffc0201994:	6105                	addi	sp,sp,32
ffffffffc0201996:	b971                	j	ffffffffc0201632 <slob_free>
ffffffffc0201998:	c19fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc020199c:	00014797          	auipc	a5,0x14
ffffffffc02019a0:	bac7b783          	ld	a5,-1108(a5) # ffffffffc0215548 <bigblocks>
ffffffffc02019a4:	4605                	li	a2,1
ffffffffc02019a6:	fba5                	bnez	a5,ffffffffc0201916 <kfree+0x24>
ffffffffc02019a8:	c03fe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc02019ac:	bff9                	j	ffffffffc020198a <kfree+0x98>
ffffffffc02019ae:	bfdfe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc02019b2:	b751                	j	ffffffffc0201936 <kfree+0x44>
ffffffffc02019b4:	8082                	ret
ffffffffc02019b6:	00004617          	auipc	a2,0x4
ffffffffc02019ba:	bca60613          	addi	a2,a2,-1078 # ffffffffc0205580 <etext+0xd9a>
ffffffffc02019be:	06200593          	li	a1,98
ffffffffc02019c2:	00004517          	auipc	a0,0x4
ffffffffc02019c6:	b1650513          	addi	a0,a0,-1258 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc02019ca:	a69fe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02019ce:	86a2                	mv	a3,s0
ffffffffc02019d0:	00004617          	auipc	a2,0x4
ffffffffc02019d4:	b8860613          	addi	a2,a2,-1144 # ffffffffc0205558 <etext+0xd72>
ffffffffc02019d8:	06e00593          	li	a1,110
ffffffffc02019dc:	00004517          	auipc	a0,0x4
ffffffffc02019e0:	afc50513          	addi	a0,a0,-1284 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc02019e4:	a4ffe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc02019e8 <pa2page.part.0>:
ffffffffc02019e8:	1141                	addi	sp,sp,-16
ffffffffc02019ea:	00004617          	auipc	a2,0x4
ffffffffc02019ee:	b9660613          	addi	a2,a2,-1130 # ffffffffc0205580 <etext+0xd9a>
ffffffffc02019f2:	06200593          	li	a1,98
ffffffffc02019f6:	00004517          	auipc	a0,0x4
ffffffffc02019fa:	ae250513          	addi	a0,a0,-1310 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc02019fe:	e406                	sd	ra,8(sp)
ffffffffc0201a00:	a33fe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0201a04 <pte2page.part.0>:
ffffffffc0201a04:	1141                	addi	sp,sp,-16
ffffffffc0201a06:	00004617          	auipc	a2,0x4
ffffffffc0201a0a:	b9a60613          	addi	a2,a2,-1126 # ffffffffc02055a0 <etext+0xdba>
ffffffffc0201a0e:	07400593          	li	a1,116
ffffffffc0201a12:	00004517          	auipc	a0,0x4
ffffffffc0201a16:	ac650513          	addi	a0,a0,-1338 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc0201a1a:	e406                	sd	ra,8(sp)
ffffffffc0201a1c:	a17fe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0201a20 <alloc_pages>:
ffffffffc0201a20:	7139                	addi	sp,sp,-64
ffffffffc0201a22:	f426                	sd	s1,40(sp)
ffffffffc0201a24:	f04a                	sd	s2,32(sp)
ffffffffc0201a26:	ec4e                	sd	s3,24(sp)
ffffffffc0201a28:	e852                	sd	s4,16(sp)
ffffffffc0201a2a:	e456                	sd	s5,8(sp)
ffffffffc0201a2c:	e05a                	sd	s6,0(sp)
ffffffffc0201a2e:	fc06                	sd	ra,56(sp)
ffffffffc0201a30:	f822                	sd	s0,48(sp)
ffffffffc0201a32:	84aa                	mv	s1,a0
ffffffffc0201a34:	00014917          	auipc	s2,0x14
ffffffffc0201a38:	b1c90913          	addi	s2,s2,-1252 # ffffffffc0215550 <pmm_manager>
ffffffffc0201a3c:	4a05                	li	s4,1
ffffffffc0201a3e:	00014a97          	auipc	s5,0x14
ffffffffc0201a42:	b42a8a93          	addi	s5,s5,-1214 # ffffffffc0215580 <swap_init_ok>
ffffffffc0201a46:	0005099b          	sext.w	s3,a0
ffffffffc0201a4a:	00014b17          	auipc	s6,0x14
ffffffffc0201a4e:	b56b0b13          	addi	s6,s6,-1194 # ffffffffc02155a0 <check_mm_struct>
ffffffffc0201a52:	a015                	j	ffffffffc0201a76 <alloc_pages+0x56>
ffffffffc0201a54:	00093783          	ld	a5,0(s2)
ffffffffc0201a58:	6f9c                	ld	a5,24(a5)
ffffffffc0201a5a:	9782                	jalr	a5
ffffffffc0201a5c:	842a                	mv	s0,a0
ffffffffc0201a5e:	4601                	li	a2,0
ffffffffc0201a60:	85ce                	mv	a1,s3
ffffffffc0201a62:	ec05                	bnez	s0,ffffffffc0201a9a <alloc_pages+0x7a>
ffffffffc0201a64:	029a6b63          	bltu	s4,s1,ffffffffc0201a9a <alloc_pages+0x7a>
ffffffffc0201a68:	000aa783          	lw	a5,0(s5)
ffffffffc0201a6c:	c79d                	beqz	a5,ffffffffc0201a9a <alloc_pages+0x7a>
ffffffffc0201a6e:	000b3503          	ld	a0,0(s6)
ffffffffc0201a72:	58e010ef          	jal	ffffffffc0203000 <swap_out>
ffffffffc0201a76:	100027f3          	csrr	a5,sstatus
ffffffffc0201a7a:	8b89                	andi	a5,a5,2
ffffffffc0201a7c:	8526                	mv	a0,s1
ffffffffc0201a7e:	dbf9                	beqz	a5,ffffffffc0201a54 <alloc_pages+0x34>
ffffffffc0201a80:	b31fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0201a84:	00093783          	ld	a5,0(s2)
ffffffffc0201a88:	8526                	mv	a0,s1
ffffffffc0201a8a:	6f9c                	ld	a5,24(a5)
ffffffffc0201a8c:	9782                	jalr	a5
ffffffffc0201a8e:	842a                	mv	s0,a0
ffffffffc0201a90:	b1bfe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc0201a94:	4601                	li	a2,0
ffffffffc0201a96:	85ce                	mv	a1,s3
ffffffffc0201a98:	d471                	beqz	s0,ffffffffc0201a64 <alloc_pages+0x44>
ffffffffc0201a9a:	70e2                	ld	ra,56(sp)
ffffffffc0201a9c:	8522                	mv	a0,s0
ffffffffc0201a9e:	7442                	ld	s0,48(sp)
ffffffffc0201aa0:	74a2                	ld	s1,40(sp)
ffffffffc0201aa2:	7902                	ld	s2,32(sp)
ffffffffc0201aa4:	69e2                	ld	s3,24(sp)
ffffffffc0201aa6:	6a42                	ld	s4,16(sp)
ffffffffc0201aa8:	6aa2                	ld	s5,8(sp)
ffffffffc0201aaa:	6b02                	ld	s6,0(sp)
ffffffffc0201aac:	6121                	addi	sp,sp,64
ffffffffc0201aae:	8082                	ret

ffffffffc0201ab0 <free_pages>:
ffffffffc0201ab0:	100027f3          	csrr	a5,sstatus
ffffffffc0201ab4:	8b89                	andi	a5,a5,2
ffffffffc0201ab6:	e799                	bnez	a5,ffffffffc0201ac4 <free_pages+0x14>
ffffffffc0201ab8:	00014797          	auipc	a5,0x14
ffffffffc0201abc:	a987b783          	ld	a5,-1384(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc0201ac0:	739c                	ld	a5,32(a5)
ffffffffc0201ac2:	8782                	jr	a5
ffffffffc0201ac4:	1101                	addi	sp,sp,-32
ffffffffc0201ac6:	ec06                	sd	ra,24(sp)
ffffffffc0201ac8:	e822                	sd	s0,16(sp)
ffffffffc0201aca:	e426                	sd	s1,8(sp)
ffffffffc0201acc:	842a                	mv	s0,a0
ffffffffc0201ace:	84ae                	mv	s1,a1
ffffffffc0201ad0:	ae1fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0201ad4:	00014797          	auipc	a5,0x14
ffffffffc0201ad8:	a7c7b783          	ld	a5,-1412(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc0201adc:	739c                	ld	a5,32(a5)
ffffffffc0201ade:	85a6                	mv	a1,s1
ffffffffc0201ae0:	8522                	mv	a0,s0
ffffffffc0201ae2:	9782                	jalr	a5
ffffffffc0201ae4:	6442                	ld	s0,16(sp)
ffffffffc0201ae6:	60e2                	ld	ra,24(sp)
ffffffffc0201ae8:	64a2                	ld	s1,8(sp)
ffffffffc0201aea:	6105                	addi	sp,sp,32
ffffffffc0201aec:	abffe06f          	j	ffffffffc02005aa <intr_enable>

ffffffffc0201af0 <nr_free_pages>:
ffffffffc0201af0:	100027f3          	csrr	a5,sstatus
ffffffffc0201af4:	8b89                	andi	a5,a5,2
ffffffffc0201af6:	e799                	bnez	a5,ffffffffc0201b04 <nr_free_pages+0x14>
ffffffffc0201af8:	00014797          	auipc	a5,0x14
ffffffffc0201afc:	a587b783          	ld	a5,-1448(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc0201b00:	779c                	ld	a5,40(a5)
ffffffffc0201b02:	8782                	jr	a5
ffffffffc0201b04:	1141                	addi	sp,sp,-16
ffffffffc0201b06:	e406                	sd	ra,8(sp)
ffffffffc0201b08:	e022                	sd	s0,0(sp)
ffffffffc0201b0a:	aa7fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0201b0e:	00014797          	auipc	a5,0x14
ffffffffc0201b12:	a427b783          	ld	a5,-1470(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc0201b16:	779c                	ld	a5,40(a5)
ffffffffc0201b18:	9782                	jalr	a5
ffffffffc0201b1a:	842a                	mv	s0,a0
ffffffffc0201b1c:	a8ffe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc0201b20:	60a2                	ld	ra,8(sp)
ffffffffc0201b22:	8522                	mv	a0,s0
ffffffffc0201b24:	6402                	ld	s0,0(sp)
ffffffffc0201b26:	0141                	addi	sp,sp,16
ffffffffc0201b28:	8082                	ret

ffffffffc0201b2a <get_pte>:
ffffffffc0201b2a:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0201b2e:	1ff7f793          	andi	a5,a5,511
ffffffffc0201b32:	7139                	addi	sp,sp,-64
ffffffffc0201b34:	078e                	slli	a5,a5,0x3
ffffffffc0201b36:	f426                	sd	s1,40(sp)
ffffffffc0201b38:	00f504b3          	add	s1,a0,a5
ffffffffc0201b3c:	6094                	ld	a3,0(s1)
ffffffffc0201b3e:	f04a                	sd	s2,32(sp)
ffffffffc0201b40:	ec4e                	sd	s3,24(sp)
ffffffffc0201b42:	e852                	sd	s4,16(sp)
ffffffffc0201b44:	fc06                	sd	ra,56(sp)
ffffffffc0201b46:	f822                	sd	s0,48(sp)
ffffffffc0201b48:	e456                	sd	s5,8(sp)
ffffffffc0201b4a:	0016f793          	andi	a5,a3,1
ffffffffc0201b4e:	892e                	mv	s2,a1
ffffffffc0201b50:	89b2                	mv	s3,a2
ffffffffc0201b52:	00014a17          	auipc	s4,0x14
ffffffffc0201b56:	a1ea0a13          	addi	s4,s4,-1506 # ffffffffc0215570 <npage>
ffffffffc0201b5a:	eba5                	bnez	a5,ffffffffc0201bca <get_pte+0xa0>
ffffffffc0201b5c:	12060e63          	beqz	a2,ffffffffc0201c98 <get_pte+0x16e>
ffffffffc0201b60:	4505                	li	a0,1
ffffffffc0201b62:	ebfff0ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0201b66:	842a                	mv	s0,a0
ffffffffc0201b68:	12050863          	beqz	a0,ffffffffc0201c98 <get_pte+0x16e>
ffffffffc0201b6c:	e05a                	sd	s6,0(sp)
ffffffffc0201b6e:	00014b17          	auipc	s6,0x14
ffffffffc0201b72:	a0ab0b13          	addi	s6,s6,-1526 # ffffffffc0215578 <pages>
ffffffffc0201b76:	000b3503          	ld	a0,0(s6)
ffffffffc0201b7a:	00080ab7          	lui	s5,0x80
ffffffffc0201b7e:	00014a17          	auipc	s4,0x14
ffffffffc0201b82:	9f2a0a13          	addi	s4,s4,-1550 # ffffffffc0215570 <npage>
ffffffffc0201b86:	40a40533          	sub	a0,s0,a0
ffffffffc0201b8a:	8519                	srai	a0,a0,0x6
ffffffffc0201b8c:	9556                	add	a0,a0,s5
ffffffffc0201b8e:	000a3703          	ld	a4,0(s4)
ffffffffc0201b92:	00c51793          	slli	a5,a0,0xc
ffffffffc0201b96:	4685                	li	a3,1
ffffffffc0201b98:	c014                	sw	a3,0(s0)
ffffffffc0201b9a:	83b1                	srli	a5,a5,0xc
ffffffffc0201b9c:	0532                	slli	a0,a0,0xc
ffffffffc0201b9e:	14e7f563          	bgeu	a5,a4,ffffffffc0201ce8 <get_pte+0x1be>
ffffffffc0201ba2:	00014797          	auipc	a5,0x14
ffffffffc0201ba6:	9c67b783          	ld	a5,-1594(a5) # ffffffffc0215568 <va_pa_offset>
ffffffffc0201baa:	953e                	add	a0,a0,a5
ffffffffc0201bac:	6605                	lui	a2,0x1
ffffffffc0201bae:	4581                	li	a1,0
ffffffffc0201bb0:	40d020ef          	jal	ffffffffc02047bc <memset>
ffffffffc0201bb4:	000b3783          	ld	a5,0(s6)
ffffffffc0201bb8:	6b02                	ld	s6,0(sp)
ffffffffc0201bba:	40f406b3          	sub	a3,s0,a5
ffffffffc0201bbe:	8699                	srai	a3,a3,0x6
ffffffffc0201bc0:	96d6                	add	a3,a3,s5
ffffffffc0201bc2:	06aa                	slli	a3,a3,0xa
ffffffffc0201bc4:	0116e693          	ori	a3,a3,17
ffffffffc0201bc8:	e094                	sd	a3,0(s1)
ffffffffc0201bca:	77fd                	lui	a5,0xfffff
ffffffffc0201bcc:	068a                	slli	a3,a3,0x2
ffffffffc0201bce:	000a3703          	ld	a4,0(s4)
ffffffffc0201bd2:	8efd                	and	a3,a3,a5
ffffffffc0201bd4:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201bd8:	0ce7f263          	bgeu	a5,a4,ffffffffc0201c9c <get_pte+0x172>
ffffffffc0201bdc:	00014a97          	auipc	s5,0x14
ffffffffc0201be0:	98ca8a93          	addi	s5,s5,-1652 # ffffffffc0215568 <va_pa_offset>
ffffffffc0201be4:	000ab603          	ld	a2,0(s5)
ffffffffc0201be8:	01595793          	srli	a5,s2,0x15
ffffffffc0201bec:	1ff7f793          	andi	a5,a5,511
ffffffffc0201bf0:	96b2                	add	a3,a3,a2
ffffffffc0201bf2:	078e                	slli	a5,a5,0x3
ffffffffc0201bf4:	00f68433          	add	s0,a3,a5
ffffffffc0201bf8:	6014                	ld	a3,0(s0)
ffffffffc0201bfa:	0016f793          	andi	a5,a3,1
ffffffffc0201bfe:	e3bd                	bnez	a5,ffffffffc0201c64 <get_pte+0x13a>
ffffffffc0201c00:	08098c63          	beqz	s3,ffffffffc0201c98 <get_pte+0x16e>
ffffffffc0201c04:	4505                	li	a0,1
ffffffffc0201c06:	e1bff0ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0201c0a:	84aa                	mv	s1,a0
ffffffffc0201c0c:	c551                	beqz	a0,ffffffffc0201c98 <get_pte+0x16e>
ffffffffc0201c0e:	e05a                	sd	s6,0(sp)
ffffffffc0201c10:	00014b17          	auipc	s6,0x14
ffffffffc0201c14:	968b0b13          	addi	s6,s6,-1688 # ffffffffc0215578 <pages>
ffffffffc0201c18:	000b3683          	ld	a3,0(s6)
ffffffffc0201c1c:	000809b7          	lui	s3,0x80
ffffffffc0201c20:	000a3703          	ld	a4,0(s4)
ffffffffc0201c24:	40d506b3          	sub	a3,a0,a3
ffffffffc0201c28:	8699                	srai	a3,a3,0x6
ffffffffc0201c2a:	96ce                	add	a3,a3,s3
ffffffffc0201c2c:	00c69793          	slli	a5,a3,0xc
ffffffffc0201c30:	4605                	li	a2,1
ffffffffc0201c32:	c110                	sw	a2,0(a0)
ffffffffc0201c34:	83b1                	srli	a5,a5,0xc
ffffffffc0201c36:	06b2                	slli	a3,a3,0xc
ffffffffc0201c38:	08e7fc63          	bgeu	a5,a4,ffffffffc0201cd0 <get_pte+0x1a6>
ffffffffc0201c3c:	000ab503          	ld	a0,0(s5)
ffffffffc0201c40:	6605                	lui	a2,0x1
ffffffffc0201c42:	4581                	li	a1,0
ffffffffc0201c44:	9536                	add	a0,a0,a3
ffffffffc0201c46:	377020ef          	jal	ffffffffc02047bc <memset>
ffffffffc0201c4a:	000b3783          	ld	a5,0(s6)
ffffffffc0201c4e:	6b02                	ld	s6,0(sp)
ffffffffc0201c50:	40f486b3          	sub	a3,s1,a5
ffffffffc0201c54:	8699                	srai	a3,a3,0x6
ffffffffc0201c56:	96ce                	add	a3,a3,s3
ffffffffc0201c58:	06aa                	slli	a3,a3,0xa
ffffffffc0201c5a:	0116e693          	ori	a3,a3,17
ffffffffc0201c5e:	e014                	sd	a3,0(s0)
ffffffffc0201c60:	000a3703          	ld	a4,0(s4)
ffffffffc0201c64:	77fd                	lui	a5,0xfffff
ffffffffc0201c66:	068a                	slli	a3,a3,0x2
ffffffffc0201c68:	8efd                	and	a3,a3,a5
ffffffffc0201c6a:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201c6e:	04e7f463          	bgeu	a5,a4,ffffffffc0201cb6 <get_pte+0x18c>
ffffffffc0201c72:	000ab783          	ld	a5,0(s5)
ffffffffc0201c76:	00c95913          	srli	s2,s2,0xc
ffffffffc0201c7a:	1ff97913          	andi	s2,s2,511
ffffffffc0201c7e:	96be                	add	a3,a3,a5
ffffffffc0201c80:	090e                	slli	s2,s2,0x3
ffffffffc0201c82:	01268533          	add	a0,a3,s2
ffffffffc0201c86:	70e2                	ld	ra,56(sp)
ffffffffc0201c88:	7442                	ld	s0,48(sp)
ffffffffc0201c8a:	74a2                	ld	s1,40(sp)
ffffffffc0201c8c:	7902                	ld	s2,32(sp)
ffffffffc0201c8e:	69e2                	ld	s3,24(sp)
ffffffffc0201c90:	6a42                	ld	s4,16(sp)
ffffffffc0201c92:	6aa2                	ld	s5,8(sp)
ffffffffc0201c94:	6121                	addi	sp,sp,64
ffffffffc0201c96:	8082                	ret
ffffffffc0201c98:	4501                	li	a0,0
ffffffffc0201c9a:	b7f5                	j	ffffffffc0201c86 <get_pte+0x15c>
ffffffffc0201c9c:	00004617          	auipc	a2,0x4
ffffffffc0201ca0:	81460613          	addi	a2,a2,-2028 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0201ca4:	0ff00593          	li	a1,255
ffffffffc0201ca8:	00004517          	auipc	a0,0x4
ffffffffc0201cac:	92050513          	addi	a0,a0,-1760 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0201cb0:	e05a                	sd	s6,0(sp)
ffffffffc0201cb2:	f80fe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201cb6:	00003617          	auipc	a2,0x3
ffffffffc0201cba:	7fa60613          	addi	a2,a2,2042 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0201cbe:	10a00593          	li	a1,266
ffffffffc0201cc2:	00004517          	auipc	a0,0x4
ffffffffc0201cc6:	90650513          	addi	a0,a0,-1786 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0201cca:	e05a                	sd	s6,0(sp)
ffffffffc0201ccc:	f66fe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201cd0:	00003617          	auipc	a2,0x3
ffffffffc0201cd4:	7e060613          	addi	a2,a2,2016 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0201cd8:	10700593          	li	a1,263
ffffffffc0201cdc:	00004517          	auipc	a0,0x4
ffffffffc0201ce0:	8ec50513          	addi	a0,a0,-1812 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0201ce4:	f4efe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0201ce8:	86aa                	mv	a3,a0
ffffffffc0201cea:	00003617          	auipc	a2,0x3
ffffffffc0201cee:	7c660613          	addi	a2,a2,1990 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0201cf2:	0fc00593          	li	a1,252
ffffffffc0201cf6:	00004517          	auipc	a0,0x4
ffffffffc0201cfa:	8d250513          	addi	a0,a0,-1838 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0201cfe:	f34fe0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0201d02 <get_page>:
ffffffffc0201d02:	1141                	addi	sp,sp,-16
ffffffffc0201d04:	e022                	sd	s0,0(sp)
ffffffffc0201d06:	8432                	mv	s0,a2
ffffffffc0201d08:	4601                	li	a2,0
ffffffffc0201d0a:	e406                	sd	ra,8(sp)
ffffffffc0201d0c:	e1fff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0201d10:	c011                	beqz	s0,ffffffffc0201d14 <get_page+0x12>
ffffffffc0201d12:	e008                	sd	a0,0(s0)
ffffffffc0201d14:	c511                	beqz	a0,ffffffffc0201d20 <get_page+0x1e>
ffffffffc0201d16:	611c                	ld	a5,0(a0)
ffffffffc0201d18:	4501                	li	a0,0
ffffffffc0201d1a:	0017f713          	andi	a4,a5,1
ffffffffc0201d1e:	e709                	bnez	a4,ffffffffc0201d28 <get_page+0x26>
ffffffffc0201d20:	60a2                	ld	ra,8(sp)
ffffffffc0201d22:	6402                	ld	s0,0(sp)
ffffffffc0201d24:	0141                	addi	sp,sp,16
ffffffffc0201d26:	8082                	ret
ffffffffc0201d28:	078a                	slli	a5,a5,0x2
ffffffffc0201d2a:	83b1                	srli	a5,a5,0xc
ffffffffc0201d2c:	00014717          	auipc	a4,0x14
ffffffffc0201d30:	84473703          	ld	a4,-1980(a4) # ffffffffc0215570 <npage>
ffffffffc0201d34:	00e7ff63          	bgeu	a5,a4,ffffffffc0201d52 <get_page+0x50>
ffffffffc0201d38:	60a2                	ld	ra,8(sp)
ffffffffc0201d3a:	6402                	ld	s0,0(sp)
ffffffffc0201d3c:	fff80737          	lui	a4,0xfff80
ffffffffc0201d40:	97ba                	add	a5,a5,a4
ffffffffc0201d42:	00014517          	auipc	a0,0x14
ffffffffc0201d46:	83653503          	ld	a0,-1994(a0) # ffffffffc0215578 <pages>
ffffffffc0201d4a:	079a                	slli	a5,a5,0x6
ffffffffc0201d4c:	953e                	add	a0,a0,a5
ffffffffc0201d4e:	0141                	addi	sp,sp,16
ffffffffc0201d50:	8082                	ret
ffffffffc0201d52:	c97ff0ef          	jal	ffffffffc02019e8 <pa2page.part.0>

ffffffffc0201d56 <page_remove>:
ffffffffc0201d56:	7179                	addi	sp,sp,-48
ffffffffc0201d58:	4601                	li	a2,0
ffffffffc0201d5a:	ec26                	sd	s1,24(sp)
ffffffffc0201d5c:	f406                	sd	ra,40(sp)
ffffffffc0201d5e:	84ae                	mv	s1,a1
ffffffffc0201d60:	dcbff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0201d64:	c901                	beqz	a0,ffffffffc0201d74 <page_remove+0x1e>
ffffffffc0201d66:	611c                	ld	a5,0(a0)
ffffffffc0201d68:	f022                	sd	s0,32(sp)
ffffffffc0201d6a:	842a                	mv	s0,a0
ffffffffc0201d6c:	0017f713          	andi	a4,a5,1
ffffffffc0201d70:	e711                	bnez	a4,ffffffffc0201d7c <page_remove+0x26>
ffffffffc0201d72:	7402                	ld	s0,32(sp)
ffffffffc0201d74:	70a2                	ld	ra,40(sp)
ffffffffc0201d76:	64e2                	ld	s1,24(sp)
ffffffffc0201d78:	6145                	addi	sp,sp,48
ffffffffc0201d7a:	8082                	ret
ffffffffc0201d7c:	078a                	slli	a5,a5,0x2
ffffffffc0201d7e:	83b1                	srli	a5,a5,0xc
ffffffffc0201d80:	00013717          	auipc	a4,0x13
ffffffffc0201d84:	7f073703          	ld	a4,2032(a4) # ffffffffc0215570 <npage>
ffffffffc0201d88:	06e7f363          	bgeu	a5,a4,ffffffffc0201dee <page_remove+0x98>
ffffffffc0201d8c:	fff80737          	lui	a4,0xfff80
ffffffffc0201d90:	97ba                	add	a5,a5,a4
ffffffffc0201d92:	079a                	slli	a5,a5,0x6
ffffffffc0201d94:	00013517          	auipc	a0,0x13
ffffffffc0201d98:	7e453503          	ld	a0,2020(a0) # ffffffffc0215578 <pages>
ffffffffc0201d9c:	953e                	add	a0,a0,a5
ffffffffc0201d9e:	411c                	lw	a5,0(a0)
ffffffffc0201da0:	fff7871b          	addiw	a4,a5,-1 # ffffffffffffefff <end+0x3fde9a37>
ffffffffc0201da4:	c118                	sw	a4,0(a0)
ffffffffc0201da6:	cb11                	beqz	a4,ffffffffc0201dba <page_remove+0x64>
ffffffffc0201da8:	00043023          	sd	zero,0(s0)
ffffffffc0201dac:	12048073          	sfence.vma	s1
ffffffffc0201db0:	7402                	ld	s0,32(sp)
ffffffffc0201db2:	70a2                	ld	ra,40(sp)
ffffffffc0201db4:	64e2                	ld	s1,24(sp)
ffffffffc0201db6:	6145                	addi	sp,sp,48
ffffffffc0201db8:	8082                	ret
ffffffffc0201dba:	100027f3          	csrr	a5,sstatus
ffffffffc0201dbe:	8b89                	andi	a5,a5,2
ffffffffc0201dc0:	eb89                	bnez	a5,ffffffffc0201dd2 <page_remove+0x7c>
ffffffffc0201dc2:	00013797          	auipc	a5,0x13
ffffffffc0201dc6:	78e7b783          	ld	a5,1934(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc0201dca:	739c                	ld	a5,32(a5)
ffffffffc0201dcc:	4585                	li	a1,1
ffffffffc0201dce:	9782                	jalr	a5
ffffffffc0201dd0:	bfe1                	j	ffffffffc0201da8 <page_remove+0x52>
ffffffffc0201dd2:	e42a                	sd	a0,8(sp)
ffffffffc0201dd4:	fdcfe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0201dd8:	00013797          	auipc	a5,0x13
ffffffffc0201ddc:	7787b783          	ld	a5,1912(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc0201de0:	739c                	ld	a5,32(a5)
ffffffffc0201de2:	6522                	ld	a0,8(sp)
ffffffffc0201de4:	4585                	li	a1,1
ffffffffc0201de6:	9782                	jalr	a5
ffffffffc0201de8:	fc2fe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc0201dec:	bf75                	j	ffffffffc0201da8 <page_remove+0x52>
ffffffffc0201dee:	bfbff0ef          	jal	ffffffffc02019e8 <pa2page.part.0>

ffffffffc0201df2 <page_insert>:
ffffffffc0201df2:	7139                	addi	sp,sp,-64
ffffffffc0201df4:	e852                	sd	s4,16(sp)
ffffffffc0201df6:	8a32                	mv	s4,a2
ffffffffc0201df8:	f822                	sd	s0,48(sp)
ffffffffc0201dfa:	4605                	li	a2,1
ffffffffc0201dfc:	842e                	mv	s0,a1
ffffffffc0201dfe:	85d2                	mv	a1,s4
ffffffffc0201e00:	f426                	sd	s1,40(sp)
ffffffffc0201e02:	fc06                	sd	ra,56(sp)
ffffffffc0201e04:	84b6                	mv	s1,a3
ffffffffc0201e06:	d25ff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0201e0a:	c971                	beqz	a0,ffffffffc0201ede <page_insert+0xec>
ffffffffc0201e0c:	4014                	lw	a3,0(s0)
ffffffffc0201e0e:	611c                	ld	a5,0(a0)
ffffffffc0201e10:	ec4e                	sd	s3,24(sp)
ffffffffc0201e12:	0016871b          	addiw	a4,a3,1
ffffffffc0201e16:	c018                	sw	a4,0(s0)
ffffffffc0201e18:	0017f713          	andi	a4,a5,1
ffffffffc0201e1c:	89aa                	mv	s3,a0
ffffffffc0201e1e:	eb15                	bnez	a4,ffffffffc0201e52 <page_insert+0x60>
ffffffffc0201e20:	00013717          	auipc	a4,0x13
ffffffffc0201e24:	75873703          	ld	a4,1880(a4) # ffffffffc0215578 <pages>
ffffffffc0201e28:	8c19                	sub	s0,s0,a4
ffffffffc0201e2a:	000807b7          	lui	a5,0x80
ffffffffc0201e2e:	8419                	srai	s0,s0,0x6
ffffffffc0201e30:	943e                	add	s0,s0,a5
ffffffffc0201e32:	042a                	slli	s0,s0,0xa
ffffffffc0201e34:	8cc1                	or	s1,s1,s0
ffffffffc0201e36:	0014e493          	ori	s1,s1,1
ffffffffc0201e3a:	0099b023          	sd	s1,0(s3) # 80000 <kern_entry-0xffffffffc0180000>
ffffffffc0201e3e:	120a0073          	sfence.vma	s4
ffffffffc0201e42:	69e2                	ld	s3,24(sp)
ffffffffc0201e44:	4501                	li	a0,0
ffffffffc0201e46:	70e2                	ld	ra,56(sp)
ffffffffc0201e48:	7442                	ld	s0,48(sp)
ffffffffc0201e4a:	74a2                	ld	s1,40(sp)
ffffffffc0201e4c:	6a42                	ld	s4,16(sp)
ffffffffc0201e4e:	6121                	addi	sp,sp,64
ffffffffc0201e50:	8082                	ret
ffffffffc0201e52:	078a                	slli	a5,a5,0x2
ffffffffc0201e54:	f04a                	sd	s2,32(sp)
ffffffffc0201e56:	e456                	sd	s5,8(sp)
ffffffffc0201e58:	83b1                	srli	a5,a5,0xc
ffffffffc0201e5a:	00013717          	auipc	a4,0x13
ffffffffc0201e5e:	71673703          	ld	a4,1814(a4) # ffffffffc0215570 <npage>
ffffffffc0201e62:	08e7f063          	bgeu	a5,a4,ffffffffc0201ee2 <page_insert+0xf0>
ffffffffc0201e66:	00013a97          	auipc	s5,0x13
ffffffffc0201e6a:	712a8a93          	addi	s5,s5,1810 # ffffffffc0215578 <pages>
ffffffffc0201e6e:	000ab703          	ld	a4,0(s5)
ffffffffc0201e72:	fff80637          	lui	a2,0xfff80
ffffffffc0201e76:	00c78933          	add	s2,a5,a2
ffffffffc0201e7a:	091a                	slli	s2,s2,0x6
ffffffffc0201e7c:	993a                	add	s2,s2,a4
ffffffffc0201e7e:	01240e63          	beq	s0,s2,ffffffffc0201e9a <page_insert+0xa8>
ffffffffc0201e82:	00092783          	lw	a5,0(s2)
ffffffffc0201e86:	fff7869b          	addiw	a3,a5,-1 # 7ffff <kern_entry-0xffffffffc0180001>
ffffffffc0201e8a:	00d92023          	sw	a3,0(s2)
ffffffffc0201e8e:	ca91                	beqz	a3,ffffffffc0201ea2 <page_insert+0xb0>
ffffffffc0201e90:	120a0073          	sfence.vma	s4
ffffffffc0201e94:	7902                	ld	s2,32(sp)
ffffffffc0201e96:	6aa2                	ld	s5,8(sp)
ffffffffc0201e98:	bf41                	j	ffffffffc0201e28 <page_insert+0x36>
ffffffffc0201e9a:	7902                	ld	s2,32(sp)
ffffffffc0201e9c:	6aa2                	ld	s5,8(sp)
ffffffffc0201e9e:	c014                	sw	a3,0(s0)
ffffffffc0201ea0:	b761                	j	ffffffffc0201e28 <page_insert+0x36>
ffffffffc0201ea2:	100027f3          	csrr	a5,sstatus
ffffffffc0201ea6:	8b89                	andi	a5,a5,2
ffffffffc0201ea8:	ef81                	bnez	a5,ffffffffc0201ec0 <page_insert+0xce>
ffffffffc0201eaa:	00013797          	auipc	a5,0x13
ffffffffc0201eae:	6a67b783          	ld	a5,1702(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc0201eb2:	739c                	ld	a5,32(a5)
ffffffffc0201eb4:	4585                	li	a1,1
ffffffffc0201eb6:	854a                	mv	a0,s2
ffffffffc0201eb8:	9782                	jalr	a5
ffffffffc0201eba:	000ab703          	ld	a4,0(s5)
ffffffffc0201ebe:	bfc9                	j	ffffffffc0201e90 <page_insert+0x9e>
ffffffffc0201ec0:	ef0fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0201ec4:	00013797          	auipc	a5,0x13
ffffffffc0201ec8:	68c7b783          	ld	a5,1676(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc0201ecc:	739c                	ld	a5,32(a5)
ffffffffc0201ece:	4585                	li	a1,1
ffffffffc0201ed0:	854a                	mv	a0,s2
ffffffffc0201ed2:	9782                	jalr	a5
ffffffffc0201ed4:	ed6fe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc0201ed8:	000ab703          	ld	a4,0(s5)
ffffffffc0201edc:	bf55                	j	ffffffffc0201e90 <page_insert+0x9e>
ffffffffc0201ede:	5571                	li	a0,-4
ffffffffc0201ee0:	b79d                	j	ffffffffc0201e46 <page_insert+0x54>
ffffffffc0201ee2:	b07ff0ef          	jal	ffffffffc02019e8 <pa2page.part.0>

ffffffffc0201ee6 <pmm_init>:
ffffffffc0201ee6:	00004797          	auipc	a5,0x4
ffffffffc0201eea:	7c278793          	addi	a5,a5,1986 # ffffffffc02066a8 <default_pmm_manager>
ffffffffc0201eee:	638c                	ld	a1,0(a5)
ffffffffc0201ef0:	711d                	addi	sp,sp,-96
ffffffffc0201ef2:	ec86                	sd	ra,88(sp)
ffffffffc0201ef4:	e0ca                	sd	s2,64(sp)
ffffffffc0201ef6:	fc4e                	sd	s3,56(sp)
ffffffffc0201ef8:	f05a                	sd	s6,32(sp)
ffffffffc0201efa:	ec5e                	sd	s7,24(sp)
ffffffffc0201efc:	e8a2                	sd	s0,80(sp)
ffffffffc0201efe:	e4a6                	sd	s1,72(sp)
ffffffffc0201f00:	f852                	sd	s4,48(sp)
ffffffffc0201f02:	f456                	sd	s5,40(sp)
ffffffffc0201f04:	00013b97          	auipc	s7,0x13
ffffffffc0201f08:	64cb8b93          	addi	s7,s7,1612 # ffffffffc0215550 <pmm_manager>
ffffffffc0201f0c:	00003517          	auipc	a0,0x3
ffffffffc0201f10:	6cc50513          	addi	a0,a0,1740 # ffffffffc02055d8 <etext+0xdf2>
ffffffffc0201f14:	00fbb023          	sd	a5,0(s7)
ffffffffc0201f18:	a68fe0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0201f1c:	000bb783          	ld	a5,0(s7)
ffffffffc0201f20:	00013997          	auipc	s3,0x13
ffffffffc0201f24:	64898993          	addi	s3,s3,1608 # ffffffffc0215568 <va_pa_offset>
ffffffffc0201f28:	00013917          	auipc	s2,0x13
ffffffffc0201f2c:	64890913          	addi	s2,s2,1608 # ffffffffc0215570 <npage>
ffffffffc0201f30:	679c                	ld	a5,8(a5)
ffffffffc0201f32:	00013b17          	auipc	s6,0x13
ffffffffc0201f36:	646b0b13          	addi	s6,s6,1606 # ffffffffc0215578 <pages>
ffffffffc0201f3a:	9782                	jalr	a5
ffffffffc0201f3c:	57f5                	li	a5,-3
ffffffffc0201f3e:	07fa                	slli	a5,a5,0x1e
ffffffffc0201f40:	00003517          	auipc	a0,0x3
ffffffffc0201f44:	6b050513          	addi	a0,a0,1712 # ffffffffc02055f0 <etext+0xe0a>
ffffffffc0201f48:	00f9b023          	sd	a5,0(s3)
ffffffffc0201f4c:	a34fe0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0201f50:	44300693          	li	a3,1091
ffffffffc0201f54:	06d6                	slli	a3,a3,0x15
ffffffffc0201f56:	40100613          	li	a2,1025
ffffffffc0201f5a:	16fd                	addi	a3,a3,-1
ffffffffc0201f5c:	0656                	slli	a2,a2,0x15
ffffffffc0201f5e:	088005b7          	lui	a1,0x8800
ffffffffc0201f62:	00003517          	auipc	a0,0x3
ffffffffc0201f66:	6a650513          	addi	a0,a0,1702 # ffffffffc0205608 <etext+0xe22>
ffffffffc0201f6a:	a16fe0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0201f6e:	76fd                	lui	a3,0xfffff
ffffffffc0201f70:	00088737          	lui	a4,0x88
ffffffffc0201f74:	00014797          	auipc	a5,0x14
ffffffffc0201f78:	65378793          	addi	a5,a5,1619 # ffffffffc02165c7 <end+0xfff>
ffffffffc0201f7c:	8ff5                	and	a5,a5,a3
ffffffffc0201f7e:	60070713          	addi	a4,a4,1536 # 88600 <kern_entry-0xffffffffc0177a00>
ffffffffc0201f82:	00e93023          	sd	a4,0(s2)
ffffffffc0201f86:	00fb3023          	sd	a5,0(s6)
ffffffffc0201f8a:	4705                	li	a4,1
ffffffffc0201f8c:	07a1                	addi	a5,a5,8
ffffffffc0201f8e:	40e7b02f          	amoor.d	zero,a4,(a5)
ffffffffc0201f92:	4505                	li	a0,1
ffffffffc0201f94:	fff805b7          	lui	a1,0xfff80
ffffffffc0201f98:	000b3783          	ld	a5,0(s6)
ffffffffc0201f9c:	00671693          	slli	a3,a4,0x6
ffffffffc0201fa0:	97b6                	add	a5,a5,a3
ffffffffc0201fa2:	07a1                	addi	a5,a5,8
ffffffffc0201fa4:	40a7b02f          	amoor.d	zero,a0,(a5)
ffffffffc0201fa8:	00093603          	ld	a2,0(s2)
ffffffffc0201fac:	0705                	addi	a4,a4,1
ffffffffc0201fae:	00b607b3          	add	a5,a2,a1
ffffffffc0201fb2:	fef763e3          	bltu	a4,a5,ffffffffc0201f98 <pmm_init+0xb2>
ffffffffc0201fb6:	000b3503          	ld	a0,0(s6)
ffffffffc0201fba:	079a                	slli	a5,a5,0x6
ffffffffc0201fbc:	c0200737          	lui	a4,0xc0200
ffffffffc0201fc0:	00f506b3          	add	a3,a0,a5
ffffffffc0201fc4:	50e6e763          	bltu	a3,a4,ffffffffc02024d2 <pmm_init+0x5ec>
ffffffffc0201fc8:	0009b583          	ld	a1,0(s3)
ffffffffc0201fcc:	44300713          	li	a4,1091
ffffffffc0201fd0:	0756                	slli	a4,a4,0x15
ffffffffc0201fd2:	8e8d                	sub	a3,a3,a1
ffffffffc0201fd4:	36e6ea63          	bltu	a3,a4,ffffffffc0202348 <pmm_init+0x462>
ffffffffc0201fd8:	00003517          	auipc	a0,0x3
ffffffffc0201fdc:	65850513          	addi	a0,a0,1624 # ffffffffc0205630 <etext+0xe4a>
ffffffffc0201fe0:	9a0fe0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0201fe4:	000bb783          	ld	a5,0(s7)
ffffffffc0201fe8:	00013497          	auipc	s1,0x13
ffffffffc0201fec:	57848493          	addi	s1,s1,1400 # ffffffffc0215560 <boot_pgdir>
ffffffffc0201ff0:	7b9c                	ld	a5,48(a5)
ffffffffc0201ff2:	9782                	jalr	a5
ffffffffc0201ff4:	00003517          	auipc	a0,0x3
ffffffffc0201ff8:	65450513          	addi	a0,a0,1620 # ffffffffc0205648 <etext+0xe62>
ffffffffc0201ffc:	984fe0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202000:	00007517          	auipc	a0,0x7
ffffffffc0202004:	00050513          	mv	a0,a0
ffffffffc0202008:	e088                	sd	a0,0(s1)
ffffffffc020200a:	c02007b7          	lui	a5,0xc0200
ffffffffc020200e:	44f56563          	bltu	a0,a5,ffffffffc0202458 <pmm_init+0x572>
ffffffffc0202012:	0009b703          	ld	a4,0(s3)
ffffffffc0202016:	00093683          	ld	a3,0(s2)
ffffffffc020201a:	c80007b7          	lui	a5,0xc8000
ffffffffc020201e:	40e50733          	sub	a4,a0,a4
ffffffffc0202022:	00013617          	auipc	a2,0x13
ffffffffc0202026:	52e63b23          	sd	a4,1334(a2) # ffffffffc0215558 <boot_cr3>
ffffffffc020202a:	83b1                	srli	a5,a5,0xc
ffffffffc020202c:	64d7e363          	bltu	a5,a3,ffffffffc0202672 <pmm_init+0x78c>
ffffffffc0202030:	03451793          	slli	a5,a0,0x34
ffffffffc0202034:	60079f63          	bnez	a5,ffffffffc0202652 <pmm_init+0x76c>
ffffffffc0202038:	4601                	li	a2,0
ffffffffc020203a:	4581                	li	a1,0
ffffffffc020203c:	cc7ff0ef          	jal	ffffffffc0201d02 <get_page>
ffffffffc0202040:	5e051963          	bnez	a0,ffffffffc0202632 <pmm_init+0x74c>
ffffffffc0202044:	4505                	li	a0,1
ffffffffc0202046:	9dbff0ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc020204a:	842a                	mv	s0,a0
ffffffffc020204c:	6088                	ld	a0,0(s1)
ffffffffc020204e:	4681                	li	a3,0
ffffffffc0202050:	4601                	li	a2,0
ffffffffc0202052:	85a2                	mv	a1,s0
ffffffffc0202054:	d9fff0ef          	jal	ffffffffc0201df2 <page_insert>
ffffffffc0202058:	5a051d63          	bnez	a0,ffffffffc0202612 <pmm_init+0x72c>
ffffffffc020205c:	6088                	ld	a0,0(s1)
ffffffffc020205e:	4601                	li	a2,0
ffffffffc0202060:	4581                	li	a1,0
ffffffffc0202062:	ac9ff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0202066:	58050663          	beqz	a0,ffffffffc02025f2 <pmm_init+0x70c>
ffffffffc020206a:	611c                	ld	a5,0(a0)
ffffffffc020206c:	0017f713          	andi	a4,a5,1
ffffffffc0202070:	56070f63          	beqz	a4,ffffffffc02025ee <pmm_init+0x708>
ffffffffc0202074:	00093603          	ld	a2,0(s2)
ffffffffc0202078:	078a                	slli	a5,a5,0x2
ffffffffc020207a:	83b1                	srli	a5,a5,0xc
ffffffffc020207c:	56c7f763          	bgeu	a5,a2,ffffffffc02025ea <pmm_init+0x704>
ffffffffc0202080:	000b3703          	ld	a4,0(s6)
ffffffffc0202084:	fff806b7          	lui	a3,0xfff80
ffffffffc0202088:	97b6                	add	a5,a5,a3
ffffffffc020208a:	079a                	slli	a5,a5,0x6
ffffffffc020208c:	97ba                	add	a5,a5,a4
ffffffffc020208e:	7ef41763          	bne	s0,a5,ffffffffc020287c <pmm_init+0x996>
ffffffffc0202092:	4018                	lw	a4,0(s0)
ffffffffc0202094:	4785                	li	a5,1
ffffffffc0202096:	6cf71763          	bne	a4,a5,ffffffffc0202764 <pmm_init+0x87e>
ffffffffc020209a:	6088                	ld	a0,0(s1)
ffffffffc020209c:	77fd                	lui	a5,0xfffff
ffffffffc020209e:	6114                	ld	a3,0(a0)
ffffffffc02020a0:	068a                	slli	a3,a3,0x2
ffffffffc02020a2:	8efd                	and	a3,a3,a5
ffffffffc02020a4:	00c6d713          	srli	a4,a3,0xc
ffffffffc02020a8:	6ac77263          	bgeu	a4,a2,ffffffffc020274c <pmm_init+0x866>
ffffffffc02020ac:	0009ba83          	ld	s5,0(s3)
ffffffffc02020b0:	96d6                	add	a3,a3,s5
ffffffffc02020b2:	0006ba03          	ld	s4,0(a3) # fffffffffff80000 <end+0x3fd6aa38>
ffffffffc02020b6:	0a0a                	slli	s4,s4,0x2
ffffffffc02020b8:	00fa7a33          	and	s4,s4,a5
ffffffffc02020bc:	00ca5793          	srli	a5,s4,0xc
ffffffffc02020c0:	66c7f963          	bgeu	a5,a2,ffffffffc0202732 <pmm_init+0x84c>
ffffffffc02020c4:	4601                	li	a2,0
ffffffffc02020c6:	6585                	lui	a1,0x1
ffffffffc02020c8:	9ad2                	add	s5,s5,s4
ffffffffc02020ca:	a61ff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc02020ce:	0aa1                	addi	s5,s5,8
ffffffffc02020d0:	65551163          	bne	a0,s5,ffffffffc0202712 <pmm_init+0x82c>
ffffffffc02020d4:	4505                	li	a0,1
ffffffffc02020d6:	94bff0ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc02020da:	8a2a                	mv	s4,a0
ffffffffc02020dc:	6088                	ld	a0,0(s1)
ffffffffc02020de:	46d1                	li	a3,20
ffffffffc02020e0:	6605                	lui	a2,0x1
ffffffffc02020e2:	85d2                	mv	a1,s4
ffffffffc02020e4:	d0fff0ef          	jal	ffffffffc0201df2 <page_insert>
ffffffffc02020e8:	60051563          	bnez	a0,ffffffffc02026f2 <pmm_init+0x80c>
ffffffffc02020ec:	6088                	ld	a0,0(s1)
ffffffffc02020ee:	4601                	li	a2,0
ffffffffc02020f0:	6585                	lui	a1,0x1
ffffffffc02020f2:	a39ff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc02020f6:	5c050e63          	beqz	a0,ffffffffc02026d2 <pmm_init+0x7ec>
ffffffffc02020fa:	611c                	ld	a5,0(a0)
ffffffffc02020fc:	0107f713          	andi	a4,a5,16
ffffffffc0202100:	5a070963          	beqz	a4,ffffffffc02026b2 <pmm_init+0x7cc>
ffffffffc0202104:	8b91                	andi	a5,a5,4
ffffffffc0202106:	4c078263          	beqz	a5,ffffffffc02025ca <pmm_init+0x6e4>
ffffffffc020210a:	6088                	ld	a0,0(s1)
ffffffffc020210c:	611c                	ld	a5,0(a0)
ffffffffc020210e:	8bc1                	andi	a5,a5,16
ffffffffc0202110:	48078d63          	beqz	a5,ffffffffc02025aa <pmm_init+0x6c4>
ffffffffc0202114:	000a2703          	lw	a4,0(s4)
ffffffffc0202118:	4785                	li	a5,1
ffffffffc020211a:	46f71863          	bne	a4,a5,ffffffffc020258a <pmm_init+0x6a4>
ffffffffc020211e:	4681                	li	a3,0
ffffffffc0202120:	6605                	lui	a2,0x1
ffffffffc0202122:	85a2                	mv	a1,s0
ffffffffc0202124:	ccfff0ef          	jal	ffffffffc0201df2 <page_insert>
ffffffffc0202128:	44051163          	bnez	a0,ffffffffc020256a <pmm_init+0x684>
ffffffffc020212c:	4018                	lw	a4,0(s0)
ffffffffc020212e:	4789                	li	a5,2
ffffffffc0202130:	40f71d63          	bne	a4,a5,ffffffffc020254a <pmm_init+0x664>
ffffffffc0202134:	000a2783          	lw	a5,0(s4)
ffffffffc0202138:	3e079963          	bnez	a5,ffffffffc020252a <pmm_init+0x644>
ffffffffc020213c:	6088                	ld	a0,0(s1)
ffffffffc020213e:	4601                	li	a2,0
ffffffffc0202140:	6585                	lui	a1,0x1
ffffffffc0202142:	9e9ff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0202146:	3c050263          	beqz	a0,ffffffffc020250a <pmm_init+0x624>
ffffffffc020214a:	6118                	ld	a4,0(a0)
ffffffffc020214c:	00177793          	andi	a5,a4,1
ffffffffc0202150:	48078f63          	beqz	a5,ffffffffc02025ee <pmm_init+0x708>
ffffffffc0202154:	00093683          	ld	a3,0(s2)
ffffffffc0202158:	00271793          	slli	a5,a4,0x2
ffffffffc020215c:	83b1                	srli	a5,a5,0xc
ffffffffc020215e:	48d7f663          	bgeu	a5,a3,ffffffffc02025ea <pmm_init+0x704>
ffffffffc0202162:	000b3683          	ld	a3,0(s6)
ffffffffc0202166:	fff80637          	lui	a2,0xfff80
ffffffffc020216a:	97b2                	add	a5,a5,a2
ffffffffc020216c:	079a                	slli	a5,a5,0x6
ffffffffc020216e:	97b6                	add	a5,a5,a3
ffffffffc0202170:	36f41d63          	bne	s0,a5,ffffffffc02024ea <pmm_init+0x604>
ffffffffc0202174:	8b41                	andi	a4,a4,16
ffffffffc0202176:	60071763          	bnez	a4,ffffffffc0202784 <pmm_init+0x89e>
ffffffffc020217a:	6088                	ld	a0,0(s1)
ffffffffc020217c:	4581                	li	a1,0
ffffffffc020217e:	bd9ff0ef          	jal	ffffffffc0201d56 <page_remove>
ffffffffc0202182:	4018                	lw	a4,0(s0)
ffffffffc0202184:	4785                	li	a5,1
ffffffffc0202186:	32f71663          	bne	a4,a5,ffffffffc02024b2 <pmm_init+0x5cc>
ffffffffc020218a:	000a2783          	lw	a5,0(s4)
ffffffffc020218e:	30079263          	bnez	a5,ffffffffc0202492 <pmm_init+0x5ac>
ffffffffc0202192:	6088                	ld	a0,0(s1)
ffffffffc0202194:	6585                	lui	a1,0x1
ffffffffc0202196:	bc1ff0ef          	jal	ffffffffc0201d56 <page_remove>
ffffffffc020219a:	401c                	lw	a5,0(s0)
ffffffffc020219c:	2c079b63          	bnez	a5,ffffffffc0202472 <pmm_init+0x58c>
ffffffffc02021a0:	000a2783          	lw	a5,0(s4)
ffffffffc02021a4:	4e079763          	bnez	a5,ffffffffc0202692 <pmm_init+0x7ac>
ffffffffc02021a8:	609c                	ld	a5,0(s1)
ffffffffc02021aa:	00093703          	ld	a4,0(s2)
ffffffffc02021ae:	639c                	ld	a5,0(a5)
ffffffffc02021b0:	078a                	slli	a5,a5,0x2
ffffffffc02021b2:	83b1                	srli	a5,a5,0xc
ffffffffc02021b4:	42e7fb63          	bgeu	a5,a4,ffffffffc02025ea <pmm_init+0x704>
ffffffffc02021b8:	fff80737          	lui	a4,0xfff80
ffffffffc02021bc:	000b3503          	ld	a0,0(s6)
ffffffffc02021c0:	97ba                	add	a5,a5,a4
ffffffffc02021c2:	079a                	slli	a5,a5,0x6
ffffffffc02021c4:	953e                	add	a0,a0,a5
ffffffffc02021c6:	4118                	lw	a4,0(a0)
ffffffffc02021c8:	4785                	li	a5,1
ffffffffc02021ca:	26f71763          	bne	a4,a5,ffffffffc0202438 <pmm_init+0x552>
ffffffffc02021ce:	100027f3          	csrr	a5,sstatus
ffffffffc02021d2:	8b89                	andi	a5,a5,2
ffffffffc02021d4:	1a079263          	bnez	a5,ffffffffc0202378 <pmm_init+0x492>
ffffffffc02021d8:	000bb783          	ld	a5,0(s7)
ffffffffc02021dc:	4585                	li	a1,1
ffffffffc02021de:	739c                	ld	a5,32(a5)
ffffffffc02021e0:	9782                	jalr	a5
ffffffffc02021e2:	609c                	ld	a5,0(s1)
ffffffffc02021e4:	00003517          	auipc	a0,0x3
ffffffffc02021e8:	72c50513          	addi	a0,a0,1836 # ffffffffc0205910 <etext+0x112a>
ffffffffc02021ec:	c0200437          	lui	s0,0xc0200
ffffffffc02021f0:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fde9a38>
ffffffffc02021f4:	f8dfd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02021f8:	00093703          	ld	a4,0(s2)
ffffffffc02021fc:	7afd                	lui	s5,0xfffff
ffffffffc02021fe:	6a05                	lui	s4,0x1
ffffffffc0202200:	00c71793          	slli	a5,a4,0xc
ffffffffc0202204:	02f47c63          	bgeu	s0,a5,ffffffffc020223c <pmm_init+0x356>
ffffffffc0202208:	00c45793          	srli	a5,s0,0xc
ffffffffc020220c:	6088                	ld	a0,0(s1)
ffffffffc020220e:	1ee7f863          	bgeu	a5,a4,ffffffffc02023fe <pmm_init+0x518>
ffffffffc0202212:	0009b583          	ld	a1,0(s3)
ffffffffc0202216:	4601                	li	a2,0
ffffffffc0202218:	95a2                	add	a1,a1,s0
ffffffffc020221a:	911ff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc020221e:	1c050063          	beqz	a0,ffffffffc02023de <pmm_init+0x4f8>
ffffffffc0202222:	611c                	ld	a5,0(a0)
ffffffffc0202224:	078a                	slli	a5,a5,0x2
ffffffffc0202226:	0157f7b3          	and	a5,a5,s5
ffffffffc020222a:	18879a63          	bne	a5,s0,ffffffffc02023be <pmm_init+0x4d8>
ffffffffc020222e:	00093703          	ld	a4,0(s2)
ffffffffc0202232:	9452                	add	s0,s0,s4
ffffffffc0202234:	00c71793          	slli	a5,a4,0xc
ffffffffc0202238:	fcf468e3          	bltu	s0,a5,ffffffffc0202208 <pmm_init+0x322>
ffffffffc020223c:	609c                	ld	a5,0(s1)
ffffffffc020223e:	639c                	ld	a5,0(a5)
ffffffffc0202240:	5a079e63          	bnez	a5,ffffffffc02027fc <pmm_init+0x916>
ffffffffc0202244:	4505                	li	a0,1
ffffffffc0202246:	fdaff0ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc020224a:	842a                	mv	s0,a0
ffffffffc020224c:	6088                	ld	a0,0(s1)
ffffffffc020224e:	4699                	li	a3,6
ffffffffc0202250:	10000613          	li	a2,256
ffffffffc0202254:	85a2                	mv	a1,s0
ffffffffc0202256:	b9dff0ef          	jal	ffffffffc0201df2 <page_insert>
ffffffffc020225a:	58051163          	bnez	a0,ffffffffc02027dc <pmm_init+0x8f6>
ffffffffc020225e:	4018                	lw	a4,0(s0)
ffffffffc0202260:	4785                	li	a5,1
ffffffffc0202262:	1af71b63          	bne	a4,a5,ffffffffc0202418 <pmm_init+0x532>
ffffffffc0202266:	6088                	ld	a0,0(s1)
ffffffffc0202268:	6605                	lui	a2,0x1
ffffffffc020226a:	4699                	li	a3,6
ffffffffc020226c:	10060613          	addi	a2,a2,256 # 1100 <kern_entry-0xffffffffc01fef00>
ffffffffc0202270:	85a2                	mv	a1,s0
ffffffffc0202272:	b81ff0ef          	jal	ffffffffc0201df2 <page_insert>
ffffffffc0202276:	5e051363          	bnez	a0,ffffffffc020285c <pmm_init+0x976>
ffffffffc020227a:	4018                	lw	a4,0(s0)
ffffffffc020227c:	4789                	li	a5,2
ffffffffc020227e:	5af71f63          	bne	a4,a5,ffffffffc020283c <pmm_init+0x956>
ffffffffc0202282:	00003597          	auipc	a1,0x3
ffffffffc0202286:	7c658593          	addi	a1,a1,1990 # ffffffffc0205a48 <etext+0x1262>
ffffffffc020228a:	10000513          	li	a0,256
ffffffffc020228e:	4ce020ef          	jal	ffffffffc020475c <strcpy>
ffffffffc0202292:	6585                	lui	a1,0x1
ffffffffc0202294:	10058593          	addi	a1,a1,256 # 1100 <kern_entry-0xffffffffc01fef00>
ffffffffc0202298:	10000513          	li	a0,256
ffffffffc020229c:	4d2020ef          	jal	ffffffffc020476e <strcmp>
ffffffffc02022a0:	56051e63          	bnez	a0,ffffffffc020281c <pmm_init+0x936>
ffffffffc02022a4:	000b3683          	ld	a3,0(s6)
ffffffffc02022a8:	000807b7          	lui	a5,0x80
ffffffffc02022ac:	00093703          	ld	a4,0(s2)
ffffffffc02022b0:	40d406b3          	sub	a3,s0,a3
ffffffffc02022b4:	8699                	srai	a3,a3,0x6
ffffffffc02022b6:	96be                	add	a3,a3,a5
ffffffffc02022b8:	00c69793          	slli	a5,a3,0xc
ffffffffc02022bc:	83b1                	srli	a5,a5,0xc
ffffffffc02022be:	06b2                	slli	a3,a3,0xc
ffffffffc02022c0:	50e7f263          	bgeu	a5,a4,ffffffffc02027c4 <pmm_init+0x8de>
ffffffffc02022c4:	0009b783          	ld	a5,0(s3)
ffffffffc02022c8:	10000513          	li	a0,256
ffffffffc02022cc:	97b6                	add	a5,a5,a3
ffffffffc02022ce:	10078023          	sb	zero,256(a5) # 80100 <kern_entry-0xffffffffc017ff00>
ffffffffc02022d2:	454020ef          	jal	ffffffffc0204726 <strlen>
ffffffffc02022d6:	4c051763          	bnez	a0,ffffffffc02027a4 <pmm_init+0x8be>
ffffffffc02022da:	100027f3          	csrr	a5,sstatus
ffffffffc02022de:	8b89                	andi	a5,a5,2
ffffffffc02022e0:	e7e1                	bnez	a5,ffffffffc02023a8 <pmm_init+0x4c2>
ffffffffc02022e2:	000bb783          	ld	a5,0(s7)
ffffffffc02022e6:	4585                	li	a1,1
ffffffffc02022e8:	8522                	mv	a0,s0
ffffffffc02022ea:	739c                	ld	a5,32(a5)
ffffffffc02022ec:	9782                	jalr	a5
ffffffffc02022ee:	609c                	ld	a5,0(s1)
ffffffffc02022f0:	00093703          	ld	a4,0(s2)
ffffffffc02022f4:	639c                	ld	a5,0(a5)
ffffffffc02022f6:	078a                	slli	a5,a5,0x2
ffffffffc02022f8:	83b1                	srli	a5,a5,0xc
ffffffffc02022fa:	2ee7f863          	bgeu	a5,a4,ffffffffc02025ea <pmm_init+0x704>
ffffffffc02022fe:	000b3503          	ld	a0,0(s6)
ffffffffc0202302:	fff80737          	lui	a4,0xfff80
ffffffffc0202306:	97ba                	add	a5,a5,a4
ffffffffc0202308:	079a                	slli	a5,a5,0x6
ffffffffc020230a:	953e                	add	a0,a0,a5
ffffffffc020230c:	100027f3          	csrr	a5,sstatus
ffffffffc0202310:	8b89                	andi	a5,a5,2
ffffffffc0202312:	efbd                	bnez	a5,ffffffffc0202390 <pmm_init+0x4aa>
ffffffffc0202314:	000bb783          	ld	a5,0(s7)
ffffffffc0202318:	4585                	li	a1,1
ffffffffc020231a:	739c                	ld	a5,32(a5)
ffffffffc020231c:	9782                	jalr	a5
ffffffffc020231e:	609c                	ld	a5,0(s1)
ffffffffc0202320:	00003517          	auipc	a0,0x3
ffffffffc0202324:	7a050513          	addi	a0,a0,1952 # ffffffffc0205ac0 <etext+0x12da>
ffffffffc0202328:	0007b023          	sd	zero,0(a5)
ffffffffc020232c:	e55fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202330:	6446                	ld	s0,80(sp)
ffffffffc0202332:	60e6                	ld	ra,88(sp)
ffffffffc0202334:	64a6                	ld	s1,72(sp)
ffffffffc0202336:	6906                	ld	s2,64(sp)
ffffffffc0202338:	79e2                	ld	s3,56(sp)
ffffffffc020233a:	7a42                	ld	s4,48(sp)
ffffffffc020233c:	7aa2                	ld	s5,40(sp)
ffffffffc020233e:	7b02                	ld	s6,32(sp)
ffffffffc0202340:	6be2                	ld	s7,24(sp)
ffffffffc0202342:	6125                	addi	sp,sp,96
ffffffffc0202344:	ce4ff06f          	j	ffffffffc0201828 <kmalloc_init>
ffffffffc0202348:	6785                	lui	a5,0x1
ffffffffc020234a:	17fd                	addi	a5,a5,-1 # fff <kern_entry-0xffffffffc01ff001>
ffffffffc020234c:	96be                	add	a3,a3,a5
ffffffffc020234e:	77fd                	lui	a5,0xfffff
ffffffffc0202350:	8ff5                	and	a5,a5,a3
ffffffffc0202352:	00c7d693          	srli	a3,a5,0xc
ffffffffc0202356:	28c6fa63          	bgeu	a3,a2,ffffffffc02025ea <pmm_init+0x704>
ffffffffc020235a:	000bb603          	ld	a2,0(s7)
ffffffffc020235e:	fff805b7          	lui	a1,0xfff80
ffffffffc0202362:	96ae                	add	a3,a3,a1
ffffffffc0202364:	6a10                	ld	a2,16(a2)
ffffffffc0202366:	8f1d                	sub	a4,a4,a5
ffffffffc0202368:	069a                	slli	a3,a3,0x6
ffffffffc020236a:	00c75593          	srli	a1,a4,0xc
ffffffffc020236e:	9536                	add	a0,a0,a3
ffffffffc0202370:	9602                	jalr	a2
ffffffffc0202372:	0009b583          	ld	a1,0(s3)
ffffffffc0202376:	b18d                	j	ffffffffc0201fd8 <pmm_init+0xf2>
ffffffffc0202378:	e42a                	sd	a0,8(sp)
ffffffffc020237a:	a36fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc020237e:	000bb783          	ld	a5,0(s7)
ffffffffc0202382:	6522                	ld	a0,8(sp)
ffffffffc0202384:	4585                	li	a1,1
ffffffffc0202386:	739c                	ld	a5,32(a5)
ffffffffc0202388:	9782                	jalr	a5
ffffffffc020238a:	a20fe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc020238e:	bd91                	j	ffffffffc02021e2 <pmm_init+0x2fc>
ffffffffc0202390:	e42a                	sd	a0,8(sp)
ffffffffc0202392:	a1efe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0202396:	000bb783          	ld	a5,0(s7)
ffffffffc020239a:	6522                	ld	a0,8(sp)
ffffffffc020239c:	4585                	li	a1,1
ffffffffc020239e:	739c                	ld	a5,32(a5)
ffffffffc02023a0:	9782                	jalr	a5
ffffffffc02023a2:	a08fe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc02023a6:	bfa5                	j	ffffffffc020231e <pmm_init+0x438>
ffffffffc02023a8:	a08fe0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc02023ac:	000bb783          	ld	a5,0(s7)
ffffffffc02023b0:	4585                	li	a1,1
ffffffffc02023b2:	8522                	mv	a0,s0
ffffffffc02023b4:	739c                	ld	a5,32(a5)
ffffffffc02023b6:	9782                	jalr	a5
ffffffffc02023b8:	9f2fe0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc02023bc:	bf0d                	j	ffffffffc02022ee <pmm_init+0x408>
ffffffffc02023be:	00003697          	auipc	a3,0x3
ffffffffc02023c2:	5b268693          	addi	a3,a3,1458 # ffffffffc0205970 <etext+0x118a>
ffffffffc02023c6:	00003617          	auipc	a2,0x3
ffffffffc02023ca:	d3a60613          	addi	a2,a2,-710 # ffffffffc0205100 <etext+0x91a>
ffffffffc02023ce:	1c100593          	li	a1,449
ffffffffc02023d2:	00003517          	auipc	a0,0x3
ffffffffc02023d6:	1f650513          	addi	a0,a0,502 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02023da:	858fe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02023de:	00003697          	auipc	a3,0x3
ffffffffc02023e2:	55268693          	addi	a3,a3,1362 # ffffffffc0205930 <etext+0x114a>
ffffffffc02023e6:	00003617          	auipc	a2,0x3
ffffffffc02023ea:	d1a60613          	addi	a2,a2,-742 # ffffffffc0205100 <etext+0x91a>
ffffffffc02023ee:	1c000593          	li	a1,448
ffffffffc02023f2:	00003517          	auipc	a0,0x3
ffffffffc02023f6:	1d650513          	addi	a0,a0,470 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02023fa:	838fe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02023fe:	86a2                	mv	a3,s0
ffffffffc0202400:	00003617          	auipc	a2,0x3
ffffffffc0202404:	0b060613          	addi	a2,a2,176 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0202408:	1c000593          	li	a1,448
ffffffffc020240c:	00003517          	auipc	a0,0x3
ffffffffc0202410:	1bc50513          	addi	a0,a0,444 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202414:	81efe0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202418:	00003697          	auipc	a3,0x3
ffffffffc020241c:	5c068693          	addi	a3,a3,1472 # ffffffffc02059d8 <etext+0x11f2>
ffffffffc0202420:	00003617          	auipc	a2,0x3
ffffffffc0202424:	ce060613          	addi	a2,a2,-800 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202428:	1c900593          	li	a1,457
ffffffffc020242c:	00003517          	auipc	a0,0x3
ffffffffc0202430:	19c50513          	addi	a0,a0,412 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202434:	ffffd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202438:	00003697          	auipc	a3,0x3
ffffffffc020243c:	4b068693          	addi	a3,a3,1200 # ffffffffc02058e8 <etext+0x1102>
ffffffffc0202440:	00003617          	auipc	a2,0x3
ffffffffc0202444:	cc060613          	addi	a2,a2,-832 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202448:	1b500593          	li	a1,437
ffffffffc020244c:	00003517          	auipc	a0,0x3
ffffffffc0202450:	17c50513          	addi	a0,a0,380 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202454:	fdffd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202458:	86aa                	mv	a3,a0
ffffffffc020245a:	00003617          	auipc	a2,0x3
ffffffffc020245e:	0fe60613          	addi	a2,a2,254 # ffffffffc0205558 <etext+0xd72>
ffffffffc0202462:	0c300593          	li	a1,195
ffffffffc0202466:	00003517          	auipc	a0,0x3
ffffffffc020246a:	16250513          	addi	a0,a0,354 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020246e:	fc5fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202472:	00003697          	auipc	a3,0x3
ffffffffc0202476:	45e68693          	addi	a3,a3,1118 # ffffffffc02058d0 <etext+0x10ea>
ffffffffc020247a:	00003617          	auipc	a2,0x3
ffffffffc020247e:	c8660613          	addi	a2,a2,-890 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202482:	1b200593          	li	a1,434
ffffffffc0202486:	00003517          	auipc	a0,0x3
ffffffffc020248a:	14250513          	addi	a0,a0,322 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020248e:	fa5fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202492:	00003697          	auipc	a3,0x3
ffffffffc0202496:	40e68693          	addi	a3,a3,1038 # ffffffffc02058a0 <etext+0x10ba>
ffffffffc020249a:	00003617          	auipc	a2,0x3
ffffffffc020249e:	c6660613          	addi	a2,a2,-922 # ffffffffc0205100 <etext+0x91a>
ffffffffc02024a2:	1af00593          	li	a1,431
ffffffffc02024a6:	00003517          	auipc	a0,0x3
ffffffffc02024aa:	12250513          	addi	a0,a0,290 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02024ae:	f85fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02024b2:	00003697          	auipc	a3,0x3
ffffffffc02024b6:	2ae68693          	addi	a3,a3,686 # ffffffffc0205760 <etext+0xf7a>
ffffffffc02024ba:	00003617          	auipc	a2,0x3
ffffffffc02024be:	c4660613          	addi	a2,a2,-954 # ffffffffc0205100 <etext+0x91a>
ffffffffc02024c2:	1ae00593          	li	a1,430
ffffffffc02024c6:	00003517          	auipc	a0,0x3
ffffffffc02024ca:	10250513          	addi	a0,a0,258 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02024ce:	f65fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02024d2:	00003617          	auipc	a2,0x3
ffffffffc02024d6:	08660613          	addi	a2,a2,134 # ffffffffc0205558 <etext+0xd72>
ffffffffc02024da:	07f00593          	li	a1,127
ffffffffc02024de:	00003517          	auipc	a0,0x3
ffffffffc02024e2:	0ea50513          	addi	a0,a0,234 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02024e6:	f4dfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02024ea:	00003697          	auipc	a3,0x3
ffffffffc02024ee:	25e68693          	addi	a3,a3,606 # ffffffffc0205748 <etext+0xf62>
ffffffffc02024f2:	00003617          	auipc	a2,0x3
ffffffffc02024f6:	c0e60613          	addi	a2,a2,-1010 # ffffffffc0205100 <etext+0x91a>
ffffffffc02024fa:	1aa00593          	li	a1,426
ffffffffc02024fe:	00003517          	auipc	a0,0x3
ffffffffc0202502:	0ca50513          	addi	a0,a0,202 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202506:	f2dfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020250a:	00003697          	auipc	a3,0x3
ffffffffc020250e:	2ce68693          	addi	a3,a3,718 # ffffffffc02057d8 <etext+0xff2>
ffffffffc0202512:	00003617          	auipc	a2,0x3
ffffffffc0202516:	bee60613          	addi	a2,a2,-1042 # ffffffffc0205100 <etext+0x91a>
ffffffffc020251a:	1a900593          	li	a1,425
ffffffffc020251e:	00003517          	auipc	a0,0x3
ffffffffc0202522:	0aa50513          	addi	a0,a0,170 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202526:	f0dfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020252a:	00003697          	auipc	a3,0x3
ffffffffc020252e:	37668693          	addi	a3,a3,886 # ffffffffc02058a0 <etext+0x10ba>
ffffffffc0202532:	00003617          	auipc	a2,0x3
ffffffffc0202536:	bce60613          	addi	a2,a2,-1074 # ffffffffc0205100 <etext+0x91a>
ffffffffc020253a:	1a800593          	li	a1,424
ffffffffc020253e:	00003517          	auipc	a0,0x3
ffffffffc0202542:	08a50513          	addi	a0,a0,138 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202546:	eedfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020254a:	00003697          	auipc	a3,0x3
ffffffffc020254e:	33e68693          	addi	a3,a3,830 # ffffffffc0205888 <etext+0x10a2>
ffffffffc0202552:	00003617          	auipc	a2,0x3
ffffffffc0202556:	bae60613          	addi	a2,a2,-1106 # ffffffffc0205100 <etext+0x91a>
ffffffffc020255a:	1a700593          	li	a1,423
ffffffffc020255e:	00003517          	auipc	a0,0x3
ffffffffc0202562:	06a50513          	addi	a0,a0,106 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202566:	ecdfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020256a:	00003697          	auipc	a3,0x3
ffffffffc020256e:	2ee68693          	addi	a3,a3,750 # ffffffffc0205858 <etext+0x1072>
ffffffffc0202572:	00003617          	auipc	a2,0x3
ffffffffc0202576:	b8e60613          	addi	a2,a2,-1138 # ffffffffc0205100 <etext+0x91a>
ffffffffc020257a:	1a600593          	li	a1,422
ffffffffc020257e:	00003517          	auipc	a0,0x3
ffffffffc0202582:	04a50513          	addi	a0,a0,74 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202586:	eadfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020258a:	00003697          	auipc	a3,0x3
ffffffffc020258e:	2b668693          	addi	a3,a3,694 # ffffffffc0205840 <etext+0x105a>
ffffffffc0202592:	00003617          	auipc	a2,0x3
ffffffffc0202596:	b6e60613          	addi	a2,a2,-1170 # ffffffffc0205100 <etext+0x91a>
ffffffffc020259a:	1a400593          	li	a1,420
ffffffffc020259e:	00003517          	auipc	a0,0x3
ffffffffc02025a2:	02a50513          	addi	a0,a0,42 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02025a6:	e8dfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02025aa:	00003697          	auipc	a3,0x3
ffffffffc02025ae:	27e68693          	addi	a3,a3,638 # ffffffffc0205828 <etext+0x1042>
ffffffffc02025b2:	00003617          	auipc	a2,0x3
ffffffffc02025b6:	b4e60613          	addi	a2,a2,-1202 # ffffffffc0205100 <etext+0x91a>
ffffffffc02025ba:	1a300593          	li	a1,419
ffffffffc02025be:	00003517          	auipc	a0,0x3
ffffffffc02025c2:	00a50513          	addi	a0,a0,10 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02025c6:	e6dfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02025ca:	00003697          	auipc	a3,0x3
ffffffffc02025ce:	24e68693          	addi	a3,a3,590 # ffffffffc0205818 <etext+0x1032>
ffffffffc02025d2:	00003617          	auipc	a2,0x3
ffffffffc02025d6:	b2e60613          	addi	a2,a2,-1234 # ffffffffc0205100 <etext+0x91a>
ffffffffc02025da:	1a200593          	li	a1,418
ffffffffc02025de:	00003517          	auipc	a0,0x3
ffffffffc02025e2:	fea50513          	addi	a0,a0,-22 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02025e6:	e4dfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02025ea:	bfeff0ef          	jal	ffffffffc02019e8 <pa2page.part.0>
ffffffffc02025ee:	c16ff0ef          	jal	ffffffffc0201a04 <pte2page.part.0>
ffffffffc02025f2:	00003697          	auipc	a3,0x3
ffffffffc02025f6:	12668693          	addi	a3,a3,294 # ffffffffc0205718 <etext+0xf32>
ffffffffc02025fa:	00003617          	auipc	a2,0x3
ffffffffc02025fe:	b0660613          	addi	a2,a2,-1274 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202602:	19600593          	li	a1,406
ffffffffc0202606:	00003517          	auipc	a0,0x3
ffffffffc020260a:	fc250513          	addi	a0,a0,-62 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020260e:	e25fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202612:	00003697          	auipc	a3,0x3
ffffffffc0202616:	0d668693          	addi	a3,a3,214 # ffffffffc02056e8 <etext+0xf02>
ffffffffc020261a:	00003617          	auipc	a2,0x3
ffffffffc020261e:	ae660613          	addi	a2,a2,-1306 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202622:	19300593          	li	a1,403
ffffffffc0202626:	00003517          	auipc	a0,0x3
ffffffffc020262a:	fa250513          	addi	a0,a0,-94 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020262e:	e05fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202632:	00003697          	auipc	a3,0x3
ffffffffc0202636:	08e68693          	addi	a3,a3,142 # ffffffffc02056c0 <etext+0xeda>
ffffffffc020263a:	00003617          	auipc	a2,0x3
ffffffffc020263e:	ac660613          	addi	a2,a2,-1338 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202642:	18f00593          	li	a1,399
ffffffffc0202646:	00003517          	auipc	a0,0x3
ffffffffc020264a:	f8250513          	addi	a0,a0,-126 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020264e:	de5fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202652:	00003697          	auipc	a3,0x3
ffffffffc0202656:	03668693          	addi	a3,a3,54 # ffffffffc0205688 <etext+0xea2>
ffffffffc020265a:	00003617          	auipc	a2,0x3
ffffffffc020265e:	aa660613          	addi	a2,a2,-1370 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202662:	18e00593          	li	a1,398
ffffffffc0202666:	00003517          	auipc	a0,0x3
ffffffffc020266a:	f6250513          	addi	a0,a0,-158 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020266e:	dc5fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202672:	00003697          	auipc	a3,0x3
ffffffffc0202676:	ff668693          	addi	a3,a3,-10 # ffffffffc0205668 <etext+0xe82>
ffffffffc020267a:	00003617          	auipc	a2,0x3
ffffffffc020267e:	a8660613          	addi	a2,a2,-1402 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202682:	18d00593          	li	a1,397
ffffffffc0202686:	00003517          	auipc	a0,0x3
ffffffffc020268a:	f4250513          	addi	a0,a0,-190 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020268e:	da5fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202692:	00003697          	auipc	a3,0x3
ffffffffc0202696:	20e68693          	addi	a3,a3,526 # ffffffffc02058a0 <etext+0x10ba>
ffffffffc020269a:	00003617          	auipc	a2,0x3
ffffffffc020269e:	a6660613          	addi	a2,a2,-1434 # ffffffffc0205100 <etext+0x91a>
ffffffffc02026a2:	1b300593          	li	a1,435
ffffffffc02026a6:	00003517          	auipc	a0,0x3
ffffffffc02026aa:	f2250513          	addi	a0,a0,-222 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02026ae:	d85fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02026b2:	00003697          	auipc	a3,0x3
ffffffffc02026b6:	15668693          	addi	a3,a3,342 # ffffffffc0205808 <etext+0x1022>
ffffffffc02026ba:	00003617          	auipc	a2,0x3
ffffffffc02026be:	a4660613          	addi	a2,a2,-1466 # ffffffffc0205100 <etext+0x91a>
ffffffffc02026c2:	1a100593          	li	a1,417
ffffffffc02026c6:	00003517          	auipc	a0,0x3
ffffffffc02026ca:	f0250513          	addi	a0,a0,-254 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02026ce:	d65fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02026d2:	00003697          	auipc	a3,0x3
ffffffffc02026d6:	10668693          	addi	a3,a3,262 # ffffffffc02057d8 <etext+0xff2>
ffffffffc02026da:	00003617          	auipc	a2,0x3
ffffffffc02026de:	a2660613          	addi	a2,a2,-1498 # ffffffffc0205100 <etext+0x91a>
ffffffffc02026e2:	1a000593          	li	a1,416
ffffffffc02026e6:	00003517          	auipc	a0,0x3
ffffffffc02026ea:	ee250513          	addi	a0,a0,-286 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02026ee:	d45fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02026f2:	00003697          	auipc	a3,0x3
ffffffffc02026f6:	0ae68693          	addi	a3,a3,174 # ffffffffc02057a0 <etext+0xfba>
ffffffffc02026fa:	00003617          	auipc	a2,0x3
ffffffffc02026fe:	a0660613          	addi	a2,a2,-1530 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202702:	19f00593          	li	a1,415
ffffffffc0202706:	00003517          	auipc	a0,0x3
ffffffffc020270a:	ec250513          	addi	a0,a0,-318 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020270e:	d25fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202712:	00003697          	auipc	a3,0x3
ffffffffc0202716:	06668693          	addi	a3,a3,102 # ffffffffc0205778 <etext+0xf92>
ffffffffc020271a:	00003617          	auipc	a2,0x3
ffffffffc020271e:	9e660613          	addi	a2,a2,-1562 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202722:	19c00593          	li	a1,412
ffffffffc0202726:	00003517          	auipc	a0,0x3
ffffffffc020272a:	ea250513          	addi	a0,a0,-350 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020272e:	d05fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202732:	86d2                	mv	a3,s4
ffffffffc0202734:	00003617          	auipc	a2,0x3
ffffffffc0202738:	d7c60613          	addi	a2,a2,-644 # ffffffffc02054b0 <etext+0xcca>
ffffffffc020273c:	19b00593          	li	a1,411
ffffffffc0202740:	00003517          	auipc	a0,0x3
ffffffffc0202744:	e8850513          	addi	a0,a0,-376 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202748:	cebfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020274c:	00003617          	auipc	a2,0x3
ffffffffc0202750:	d6460613          	addi	a2,a2,-668 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0202754:	19a00593          	li	a1,410
ffffffffc0202758:	00003517          	auipc	a0,0x3
ffffffffc020275c:	e7050513          	addi	a0,a0,-400 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202760:	cd3fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202764:	00003697          	auipc	a3,0x3
ffffffffc0202768:	ffc68693          	addi	a3,a3,-4 # ffffffffc0205760 <etext+0xf7a>
ffffffffc020276c:	00003617          	auipc	a2,0x3
ffffffffc0202770:	99460613          	addi	a2,a2,-1644 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202774:	19800593          	li	a1,408
ffffffffc0202778:	00003517          	auipc	a0,0x3
ffffffffc020277c:	e5050513          	addi	a0,a0,-432 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202780:	cb3fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202784:	00003697          	auipc	a3,0x3
ffffffffc0202788:	13468693          	addi	a3,a3,308 # ffffffffc02058b8 <etext+0x10d2>
ffffffffc020278c:	00003617          	auipc	a2,0x3
ffffffffc0202790:	97460613          	addi	a2,a2,-1676 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202794:	1ab00593          	li	a1,427
ffffffffc0202798:	00003517          	auipc	a0,0x3
ffffffffc020279c:	e3050513          	addi	a0,a0,-464 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02027a0:	c93fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02027a4:	00003697          	auipc	a3,0x3
ffffffffc02027a8:	2f468693          	addi	a3,a3,756 # ffffffffc0205a98 <etext+0x12b2>
ffffffffc02027ac:	00003617          	auipc	a2,0x3
ffffffffc02027b0:	95460613          	addi	a2,a2,-1708 # ffffffffc0205100 <etext+0x91a>
ffffffffc02027b4:	1d200593          	li	a1,466
ffffffffc02027b8:	00003517          	auipc	a0,0x3
ffffffffc02027bc:	e1050513          	addi	a0,a0,-496 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02027c0:	c73fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02027c4:	00003617          	auipc	a2,0x3
ffffffffc02027c8:	cec60613          	addi	a2,a2,-788 # ffffffffc02054b0 <etext+0xcca>
ffffffffc02027cc:	06900593          	li	a1,105
ffffffffc02027d0:	00003517          	auipc	a0,0x3
ffffffffc02027d4:	d0850513          	addi	a0,a0,-760 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc02027d8:	c5bfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02027dc:	00003697          	auipc	a3,0x3
ffffffffc02027e0:	1c468693          	addi	a3,a3,452 # ffffffffc02059a0 <etext+0x11ba>
ffffffffc02027e4:	00003617          	auipc	a2,0x3
ffffffffc02027e8:	91c60613          	addi	a2,a2,-1764 # ffffffffc0205100 <etext+0x91a>
ffffffffc02027ec:	1c800593          	li	a1,456
ffffffffc02027f0:	00003517          	auipc	a0,0x3
ffffffffc02027f4:	dd850513          	addi	a0,a0,-552 # ffffffffc02055c8 <etext+0xde2>
ffffffffc02027f8:	c3bfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02027fc:	00003697          	auipc	a3,0x3
ffffffffc0202800:	18c68693          	addi	a3,a3,396 # ffffffffc0205988 <etext+0x11a2>
ffffffffc0202804:	00003617          	auipc	a2,0x3
ffffffffc0202808:	8fc60613          	addi	a2,a2,-1796 # ffffffffc0205100 <etext+0x91a>
ffffffffc020280c:	1c400593          	li	a1,452
ffffffffc0202810:	00003517          	auipc	a0,0x3
ffffffffc0202814:	db850513          	addi	a0,a0,-584 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202818:	c1bfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020281c:	00003697          	auipc	a3,0x3
ffffffffc0202820:	24468693          	addi	a3,a3,580 # ffffffffc0205a60 <etext+0x127a>
ffffffffc0202824:	00003617          	auipc	a2,0x3
ffffffffc0202828:	8dc60613          	addi	a2,a2,-1828 # ffffffffc0205100 <etext+0x91a>
ffffffffc020282c:	1cf00593          	li	a1,463
ffffffffc0202830:	00003517          	auipc	a0,0x3
ffffffffc0202834:	d9850513          	addi	a0,a0,-616 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202838:	bfbfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020283c:	00003697          	auipc	a3,0x3
ffffffffc0202840:	1f468693          	addi	a3,a3,500 # ffffffffc0205a30 <etext+0x124a>
ffffffffc0202844:	00003617          	auipc	a2,0x3
ffffffffc0202848:	8bc60613          	addi	a2,a2,-1860 # ffffffffc0205100 <etext+0x91a>
ffffffffc020284c:	1cb00593          	li	a1,459
ffffffffc0202850:	00003517          	auipc	a0,0x3
ffffffffc0202854:	d7850513          	addi	a0,a0,-648 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202858:	bdbfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020285c:	00003697          	auipc	a3,0x3
ffffffffc0202860:	19468693          	addi	a3,a3,404 # ffffffffc02059f0 <etext+0x120a>
ffffffffc0202864:	00003617          	auipc	a2,0x3
ffffffffc0202868:	89c60613          	addi	a2,a2,-1892 # ffffffffc0205100 <etext+0x91a>
ffffffffc020286c:	1ca00593          	li	a1,458
ffffffffc0202870:	00003517          	auipc	a0,0x3
ffffffffc0202874:	d5850513          	addi	a0,a0,-680 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202878:	bbbfd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020287c:	00003697          	auipc	a3,0x3
ffffffffc0202880:	ecc68693          	addi	a3,a3,-308 # ffffffffc0205748 <etext+0xf62>
ffffffffc0202884:	00003617          	auipc	a2,0x3
ffffffffc0202888:	87c60613          	addi	a2,a2,-1924 # ffffffffc0205100 <etext+0x91a>
ffffffffc020288c:	19700593          	li	a1,407
ffffffffc0202890:	00003517          	auipc	a0,0x3
ffffffffc0202894:	d3850513          	addi	a0,a0,-712 # ffffffffc02055c8 <etext+0xde2>
ffffffffc0202898:	b9bfd0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc020289c <tlb_invalidate>:
ffffffffc020289c:	12058073          	sfence.vma	a1
ffffffffc02028a0:	8082                	ret

ffffffffc02028a2 <pgdir_alloc_page>:
ffffffffc02028a2:	7179                	addi	sp,sp,-48
ffffffffc02028a4:	e84a                	sd	s2,16(sp)
ffffffffc02028a6:	892a                	mv	s2,a0
ffffffffc02028a8:	4505                	li	a0,1
ffffffffc02028aa:	ec26                	sd	s1,24(sp)
ffffffffc02028ac:	e44e                	sd	s3,8(sp)
ffffffffc02028ae:	f406                	sd	ra,40(sp)
ffffffffc02028b0:	f022                	sd	s0,32(sp)
ffffffffc02028b2:	84ae                	mv	s1,a1
ffffffffc02028b4:	89b2                	mv	s3,a2
ffffffffc02028b6:	96aff0ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc02028ba:	c131                	beqz	a0,ffffffffc02028fe <pgdir_alloc_page+0x5c>
ffffffffc02028bc:	842a                	mv	s0,a0
ffffffffc02028be:	85aa                	mv	a1,a0
ffffffffc02028c0:	86ce                	mv	a3,s3
ffffffffc02028c2:	8626                	mv	a2,s1
ffffffffc02028c4:	854a                	mv	a0,s2
ffffffffc02028c6:	d2cff0ef          	jal	ffffffffc0201df2 <page_insert>
ffffffffc02028ca:	ed11                	bnez	a0,ffffffffc02028e6 <pgdir_alloc_page+0x44>
ffffffffc02028cc:	00013797          	auipc	a5,0x13
ffffffffc02028d0:	cb47a783          	lw	a5,-844(a5) # ffffffffc0215580 <swap_init_ok>
ffffffffc02028d4:	e79d                	bnez	a5,ffffffffc0202902 <pgdir_alloc_page+0x60>
ffffffffc02028d6:	70a2                	ld	ra,40(sp)
ffffffffc02028d8:	8522                	mv	a0,s0
ffffffffc02028da:	7402                	ld	s0,32(sp)
ffffffffc02028dc:	64e2                	ld	s1,24(sp)
ffffffffc02028de:	6942                	ld	s2,16(sp)
ffffffffc02028e0:	69a2                	ld	s3,8(sp)
ffffffffc02028e2:	6145                	addi	sp,sp,48
ffffffffc02028e4:	8082                	ret
ffffffffc02028e6:	100027f3          	csrr	a5,sstatus
ffffffffc02028ea:	8b89                	andi	a5,a5,2
ffffffffc02028ec:	eba9                	bnez	a5,ffffffffc020293e <pgdir_alloc_page+0x9c>
ffffffffc02028ee:	00013797          	auipc	a5,0x13
ffffffffc02028f2:	c627b783          	ld	a5,-926(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc02028f6:	739c                	ld	a5,32(a5)
ffffffffc02028f8:	4585                	li	a1,1
ffffffffc02028fa:	8522                	mv	a0,s0
ffffffffc02028fc:	9782                	jalr	a5
ffffffffc02028fe:	4401                	li	s0,0
ffffffffc0202900:	bfd9                	j	ffffffffc02028d6 <pgdir_alloc_page+0x34>
ffffffffc0202902:	4681                	li	a3,0
ffffffffc0202904:	8622                	mv	a2,s0
ffffffffc0202906:	85a6                	mv	a1,s1
ffffffffc0202908:	00013517          	auipc	a0,0x13
ffffffffc020290c:	c9853503          	ld	a0,-872(a0) # ffffffffc02155a0 <check_mm_struct>
ffffffffc0202910:	6e4000ef          	jal	ffffffffc0202ff4 <swap_map_swappable>
ffffffffc0202914:	4018                	lw	a4,0(s0)
ffffffffc0202916:	fc04                	sd	s1,56(s0)
ffffffffc0202918:	4785                	li	a5,1
ffffffffc020291a:	faf70ee3          	beq	a4,a5,ffffffffc02028d6 <pgdir_alloc_page+0x34>
ffffffffc020291e:	00003697          	auipc	a3,0x3
ffffffffc0202922:	1c268693          	addi	a3,a3,450 # ffffffffc0205ae0 <etext+0x12fa>
ffffffffc0202926:	00002617          	auipc	a2,0x2
ffffffffc020292a:	7da60613          	addi	a2,a2,2010 # ffffffffc0205100 <etext+0x91a>
ffffffffc020292e:	17900593          	li	a1,377
ffffffffc0202932:	00003517          	auipc	a0,0x3
ffffffffc0202936:	c9650513          	addi	a0,a0,-874 # ffffffffc02055c8 <etext+0xde2>
ffffffffc020293a:	af9fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc020293e:	c73fd0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0202942:	00013797          	auipc	a5,0x13
ffffffffc0202946:	c0e7b783          	ld	a5,-1010(a5) # ffffffffc0215550 <pmm_manager>
ffffffffc020294a:	739c                	ld	a5,32(a5)
ffffffffc020294c:	8522                	mv	a0,s0
ffffffffc020294e:	4585                	li	a1,1
ffffffffc0202950:	9782                	jalr	a5
ffffffffc0202952:	4401                	li	s0,0
ffffffffc0202954:	c57fd0ef          	jal	ffffffffc02005aa <intr_enable>
ffffffffc0202958:	bfbd                	j	ffffffffc02028d6 <pgdir_alloc_page+0x34>

ffffffffc020295a <swap_init>:
ffffffffc020295a:	7135                	addi	sp,sp,-160
ffffffffc020295c:	ed06                	sd	ra,152(sp)
ffffffffc020295e:	45e010ef          	jal	ffffffffc0203dbc <swapfs_init>
ffffffffc0202962:	00013697          	auipc	a3,0x13
ffffffffc0202966:	c266b683          	ld	a3,-986(a3) # ffffffffc0215588 <max_swap_offset>
ffffffffc020296a:	010007b7          	lui	a5,0x1000
ffffffffc020296e:	ff968713          	addi	a4,a3,-7
ffffffffc0202972:	17e1                	addi	a5,a5,-8 # fffff8 <kern_entry-0xffffffffbf200008>
ffffffffc0202974:	40e7e263          	bltu	a5,a4,ffffffffc0202d78 <swap_init+0x41e>
ffffffffc0202978:	00007797          	auipc	a5,0x7
ffffffffc020297c:	69878793          	addi	a5,a5,1688 # ffffffffc020a010 <swap_manager_fifo>
ffffffffc0202980:	6798                	ld	a4,8(a5)
ffffffffc0202982:	fcce                	sd	s3,120(sp)
ffffffffc0202984:	f0da                	sd	s6,96(sp)
ffffffffc0202986:	00013b17          	auipc	s6,0x13
ffffffffc020298a:	c0ab0b13          	addi	s6,s6,-1014 # ffffffffc0215590 <sm>
ffffffffc020298e:	00fb3023          	sd	a5,0(s6)
ffffffffc0202992:	9702                	jalr	a4
ffffffffc0202994:	89aa                	mv	s3,a0
ffffffffc0202996:	c519                	beqz	a0,ffffffffc02029a4 <swap_init+0x4a>
ffffffffc0202998:	60ea                	ld	ra,152(sp)
ffffffffc020299a:	7b06                	ld	s6,96(sp)
ffffffffc020299c:	854e                	mv	a0,s3
ffffffffc020299e:	79e6                	ld	s3,120(sp)
ffffffffc02029a0:	610d                	addi	sp,sp,160
ffffffffc02029a2:	8082                	ret
ffffffffc02029a4:	000b3783          	ld	a5,0(s6)
ffffffffc02029a8:	00003517          	auipc	a0,0x3
ffffffffc02029ac:	18050513          	addi	a0,a0,384 # ffffffffc0205b28 <etext+0x1342>
ffffffffc02029b0:	e922                	sd	s0,144(sp)
ffffffffc02029b2:	638c                	ld	a1,0(a5)
ffffffffc02029b4:	4785                	li	a5,1
ffffffffc02029b6:	e526                	sd	s1,136(sp)
ffffffffc02029b8:	e0ea                	sd	s10,64(sp)
ffffffffc02029ba:	00013717          	auipc	a4,0x13
ffffffffc02029be:	bcf72323          	sw	a5,-1082(a4) # ffffffffc0215580 <swap_init_ok>
ffffffffc02029c2:	e14a                	sd	s2,128(sp)
ffffffffc02029c4:	f8d2                	sd	s4,112(sp)
ffffffffc02029c6:	f4d6                	sd	s5,104(sp)
ffffffffc02029c8:	ecde                	sd	s7,88(sp)
ffffffffc02029ca:	e8e2                	sd	s8,80(sp)
ffffffffc02029cc:	e4e6                	sd	s9,72(sp)
ffffffffc02029ce:	fc6e                	sd	s11,56(sp)
ffffffffc02029d0:	0000f497          	auipc	s1,0xf
ffffffffc02029d4:	a8848493          	addi	s1,s1,-1400 # ffffffffc0211458 <free_area>
ffffffffc02029d8:	fa8fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02029dc:	649c                	ld	a5,8(s1)
ffffffffc02029de:	4401                	li	s0,0
ffffffffc02029e0:	4d01                	li	s10,0
ffffffffc02029e2:	2e978163          	beq	a5,s1,ffffffffc0202cc4 <swap_init+0x36a>
ffffffffc02029e6:	ff07b703          	ld	a4,-16(a5)
ffffffffc02029ea:	8b09                	andi	a4,a4,2
ffffffffc02029ec:	2c070e63          	beqz	a4,ffffffffc0202cc8 <swap_init+0x36e>
ffffffffc02029f0:	ff87a703          	lw	a4,-8(a5)
ffffffffc02029f4:	679c                	ld	a5,8(a5)
ffffffffc02029f6:	2d05                	addiw	s10,s10,1
ffffffffc02029f8:	9c39                	addw	s0,s0,a4
ffffffffc02029fa:	fe9796e3          	bne	a5,s1,ffffffffc02029e6 <swap_init+0x8c>
ffffffffc02029fe:	8922                	mv	s2,s0
ffffffffc0202a00:	8f0ff0ef          	jal	ffffffffc0201af0 <nr_free_pages>
ffffffffc0202a04:	4b251263          	bne	a0,s2,ffffffffc0202ea8 <swap_init+0x54e>
ffffffffc0202a08:	8622                	mv	a2,s0
ffffffffc0202a0a:	85ea                	mv	a1,s10
ffffffffc0202a0c:	00003517          	auipc	a0,0x3
ffffffffc0202a10:	13450513          	addi	a0,a0,308 # ffffffffc0205b40 <etext+0x135a>
ffffffffc0202a14:	f6cfd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202a18:	37f000ef          	jal	ffffffffc0203596 <mm_create>
ffffffffc0202a1c:	ec2a                	sd	a0,24(sp)
ffffffffc0202a1e:	56050563          	beqz	a0,ffffffffc0202f88 <swap_init+0x62e>
ffffffffc0202a22:	00013797          	auipc	a5,0x13
ffffffffc0202a26:	b7e78793          	addi	a5,a5,-1154 # ffffffffc02155a0 <check_mm_struct>
ffffffffc0202a2a:	6398                	ld	a4,0(a5)
ffffffffc0202a2c:	56071e63          	bnez	a4,ffffffffc0202fa8 <swap_init+0x64e>
ffffffffc0202a30:	00013697          	auipc	a3,0x13
ffffffffc0202a34:	b306b683          	ld	a3,-1232(a3) # ffffffffc0215560 <boot_pgdir>
ffffffffc0202a38:	6662                	ld	a2,24(sp)
ffffffffc0202a3a:	6298                	ld	a4,0(a3)
ffffffffc0202a3c:	e836                	sd	a3,16(sp)
ffffffffc0202a3e:	e390                	sd	a2,0(a5)
ffffffffc0202a40:	ee14                	sd	a3,24(a2)
ffffffffc0202a42:	40071363          	bnez	a4,ffffffffc0202e48 <swap_init+0x4ee>
ffffffffc0202a46:	6599                	lui	a1,0x6
ffffffffc0202a48:	460d                	li	a2,3
ffffffffc0202a4a:	6505                	lui	a0,0x1
ffffffffc0202a4c:	393000ef          	jal	ffffffffc02035de <vma_create>
ffffffffc0202a50:	85aa                	mv	a1,a0
ffffffffc0202a52:	40050b63          	beqz	a0,ffffffffc0202e68 <swap_init+0x50e>
ffffffffc0202a56:	6962                	ld	s2,24(sp)
ffffffffc0202a58:	854a                	mv	a0,s2
ffffffffc0202a5a:	3f3000ef          	jal	ffffffffc020364c <insert_vma_struct>
ffffffffc0202a5e:	00003517          	auipc	a0,0x3
ffffffffc0202a62:	15250513          	addi	a0,a0,338 # ffffffffc0205bb0 <etext+0x13ca>
ffffffffc0202a66:	f1afd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202a6a:	01893503          	ld	a0,24(s2)
ffffffffc0202a6e:	4605                	li	a2,1
ffffffffc0202a70:	6585                	lui	a1,0x1
ffffffffc0202a72:	8b8ff0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0202a76:	40050963          	beqz	a0,ffffffffc0202e88 <swap_init+0x52e>
ffffffffc0202a7a:	00003517          	auipc	a0,0x3
ffffffffc0202a7e:	18650513          	addi	a0,a0,390 # ffffffffc0205c00 <etext+0x141a>
ffffffffc0202a82:	0000f917          	auipc	s2,0xf
ffffffffc0202a86:	a0e90913          	addi	s2,s2,-1522 # ffffffffc0211490 <check_rp>
ffffffffc0202a8a:	ef6fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202a8e:	0000fa17          	auipc	s4,0xf
ffffffffc0202a92:	a22a0a13          	addi	s4,s4,-1502 # ffffffffc02114b0 <swap_out_seq_no>
ffffffffc0202a96:	8c4a                	mv	s8,s2
ffffffffc0202a98:	4505                	li	a0,1
ffffffffc0202a9a:	f87fe0ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc0202a9e:	00ac3023          	sd	a0,0(s8)
ffffffffc0202aa2:	2a050b63          	beqz	a0,ffffffffc0202d58 <swap_init+0x3fe>
ffffffffc0202aa6:	651c                	ld	a5,8(a0)
ffffffffc0202aa8:	8b89                	andi	a5,a5,2
ffffffffc0202aaa:	28079763          	bnez	a5,ffffffffc0202d38 <swap_init+0x3de>
ffffffffc0202aae:	0c21                	addi	s8,s8,8
ffffffffc0202ab0:	ff4c14e3          	bne	s8,s4,ffffffffc0202a98 <swap_init+0x13e>
ffffffffc0202ab4:	609c                	ld	a5,0(s1)
ffffffffc0202ab6:	0084bd83          	ld	s11,8(s1)
ffffffffc0202aba:	e084                	sd	s1,0(s1)
ffffffffc0202abc:	f03e                	sd	a5,32(sp)
ffffffffc0202abe:	489c                	lw	a5,16(s1)
ffffffffc0202ac0:	e484                	sd	s1,8(s1)
ffffffffc0202ac2:	0000fc17          	auipc	s8,0xf
ffffffffc0202ac6:	9cec0c13          	addi	s8,s8,-1586 # ffffffffc0211490 <check_rp>
ffffffffc0202aca:	f43e                	sd	a5,40(sp)
ffffffffc0202acc:	0000f797          	auipc	a5,0xf
ffffffffc0202ad0:	9807ae23          	sw	zero,-1636(a5) # ffffffffc0211468 <free_area+0x10>
ffffffffc0202ad4:	000c3503          	ld	a0,0(s8)
ffffffffc0202ad8:	4585                	li	a1,1
ffffffffc0202ada:	0c21                	addi	s8,s8,8
ffffffffc0202adc:	fd5fe0ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0202ae0:	ff4c1ae3          	bne	s8,s4,ffffffffc0202ad4 <swap_init+0x17a>
ffffffffc0202ae4:	0104ac03          	lw	s8,16(s1)
ffffffffc0202ae8:	4791                	li	a5,4
ffffffffc0202aea:	4cfc1f63          	bne	s8,a5,ffffffffc0202fc8 <swap_init+0x66e>
ffffffffc0202aee:	00003517          	auipc	a0,0x3
ffffffffc0202af2:	19a50513          	addi	a0,a0,410 # ffffffffc0205c88 <etext+0x14a2>
ffffffffc0202af6:	e8afd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202afa:	00013797          	auipc	a5,0x13
ffffffffc0202afe:	a807af23          	sw	zero,-1378(a5) # ffffffffc0215598 <pgfault_num>
ffffffffc0202b02:	6785                	lui	a5,0x1
ffffffffc0202b04:	4529                	li	a0,10
ffffffffc0202b06:	00a78023          	sb	a0,0(a5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0202b0a:	00013597          	auipc	a1,0x13
ffffffffc0202b0e:	a8e5a583          	lw	a1,-1394(a1) # ffffffffc0215598 <pgfault_num>
ffffffffc0202b12:	4605                	li	a2,1
ffffffffc0202b14:	00013797          	auipc	a5,0x13
ffffffffc0202b18:	a8478793          	addi	a5,a5,-1404 # ffffffffc0215598 <pgfault_num>
ffffffffc0202b1c:	42c59663          	bne	a1,a2,ffffffffc0202f48 <swap_init+0x5ee>
ffffffffc0202b20:	6605                	lui	a2,0x1
ffffffffc0202b22:	00a60823          	sb	a0,16(a2) # 1010 <kern_entry-0xffffffffc01feff0>
ffffffffc0202b26:	4388                	lw	a0,0(a5)
ffffffffc0202b28:	44b51063          	bne	a0,a1,ffffffffc0202f68 <swap_init+0x60e>
ffffffffc0202b2c:	6609                	lui	a2,0x2
ffffffffc0202b2e:	45ad                	li	a1,11
ffffffffc0202b30:	00b60023          	sb	a1,0(a2) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc0202b34:	4390                	lw	a2,0(a5)
ffffffffc0202b36:	4809                	li	a6,2
ffffffffc0202b38:	0006051b          	sext.w	a0,a2
ffffffffc0202b3c:	39061663          	bne	a2,a6,ffffffffc0202ec8 <swap_init+0x56e>
ffffffffc0202b40:	6609                	lui	a2,0x2
ffffffffc0202b42:	00b60823          	sb	a1,16(a2) # 2010 <kern_entry-0xffffffffc01fdff0>
ffffffffc0202b46:	438c                	lw	a1,0(a5)
ffffffffc0202b48:	3aa59063          	bne	a1,a0,ffffffffc0202ee8 <swap_init+0x58e>
ffffffffc0202b4c:	660d                	lui	a2,0x3
ffffffffc0202b4e:	45b1                	li	a1,12
ffffffffc0202b50:	00b60023          	sb	a1,0(a2) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc0202b54:	4390                	lw	a2,0(a5)
ffffffffc0202b56:	480d                	li	a6,3
ffffffffc0202b58:	0006051b          	sext.w	a0,a2
ffffffffc0202b5c:	3b061663          	bne	a2,a6,ffffffffc0202f08 <swap_init+0x5ae>
ffffffffc0202b60:	660d                	lui	a2,0x3
ffffffffc0202b62:	00b60823          	sb	a1,16(a2) # 3010 <kern_entry-0xffffffffc01fcff0>
ffffffffc0202b66:	438c                	lw	a1,0(a5)
ffffffffc0202b68:	3ca59063          	bne	a1,a0,ffffffffc0202f28 <swap_init+0x5ce>
ffffffffc0202b6c:	6611                	lui	a2,0x4
ffffffffc0202b6e:	45b5                	li	a1,13
ffffffffc0202b70:	00b60023          	sb	a1,0(a2) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc0202b74:	4390                	lw	a2,0(a5)
ffffffffc0202b76:	0006051b          	sext.w	a0,a2
ffffffffc0202b7a:	25861763          	bne	a2,s8,ffffffffc0202dc8 <swap_init+0x46e>
ffffffffc0202b7e:	6611                	lui	a2,0x4
ffffffffc0202b80:	00b60823          	sb	a1,16(a2) # 4010 <kern_entry-0xffffffffc01fbff0>
ffffffffc0202b84:	439c                	lw	a5,0(a5)
ffffffffc0202b86:	26a79163          	bne	a5,a0,ffffffffc0202de8 <swap_init+0x48e>
ffffffffc0202b8a:	489c                	lw	a5,16(s1)
ffffffffc0202b8c:	26079e63          	bnez	a5,ffffffffc0202e08 <swap_init+0x4ae>
ffffffffc0202b90:	0000f797          	auipc	a5,0xf
ffffffffc0202b94:	94878793          	addi	a5,a5,-1720 # ffffffffc02114d8 <swap_in_seq_no>
ffffffffc0202b98:	0000f617          	auipc	a2,0xf
ffffffffc0202b9c:	91860613          	addi	a2,a2,-1768 # ffffffffc02114b0 <swap_out_seq_no>
ffffffffc0202ba0:	0000f517          	auipc	a0,0xf
ffffffffc0202ba4:	96050513          	addi	a0,a0,-1696 # ffffffffc0211500 <pra_list_head>
ffffffffc0202ba8:	55fd                	li	a1,-1
ffffffffc0202baa:	c38c                	sw	a1,0(a5)
ffffffffc0202bac:	c20c                	sw	a1,0(a2)
ffffffffc0202bae:	0791                	addi	a5,a5,4
ffffffffc0202bb0:	0611                	addi	a2,a2,4
ffffffffc0202bb2:	fea79ce3          	bne	a5,a0,ffffffffc0202baa <swap_init+0x250>
ffffffffc0202bb6:	0000f817          	auipc	a6,0xf
ffffffffc0202bba:	8ba80813          	addi	a6,a6,-1862 # ffffffffc0211470 <check_ptep>
ffffffffc0202bbe:	0000f897          	auipc	a7,0xf
ffffffffc0202bc2:	8d288893          	addi	a7,a7,-1838 # ffffffffc0211490 <check_rp>
ffffffffc0202bc6:	6a85                	lui	s5,0x1
ffffffffc0202bc8:	00013b97          	auipc	s7,0x13
ffffffffc0202bcc:	9a8b8b93          	addi	s7,s7,-1624 # ffffffffc0215570 <npage>
ffffffffc0202bd0:	00013c17          	auipc	s8,0x13
ffffffffc0202bd4:	9a8c0c13          	addi	s8,s8,-1624 # ffffffffc0215578 <pages>
ffffffffc0202bd8:	00004c97          	auipc	s9,0x4
ffffffffc0202bdc:	c98c8c93          	addi	s9,s9,-872 # ffffffffc0206870 <nbase>
ffffffffc0202be0:	6542                	ld	a0,16(sp)
ffffffffc0202be2:	00083023          	sd	zero,0(a6)
ffffffffc0202be6:	4601                	li	a2,0
ffffffffc0202be8:	85d6                	mv	a1,s5
ffffffffc0202bea:	e446                	sd	a7,8(sp)
ffffffffc0202bec:	e042                	sd	a6,0(sp)
ffffffffc0202bee:	f3dfe0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0202bf2:	6802                	ld	a6,0(sp)
ffffffffc0202bf4:	68a2                	ld	a7,8(sp)
ffffffffc0202bf6:	00a83023          	sd	a0,0(a6)
ffffffffc0202bfa:	1a050763          	beqz	a0,ffffffffc0202da8 <swap_init+0x44e>
ffffffffc0202bfe:	611c                	ld	a5,0(a0)
ffffffffc0202c00:	0017f613          	andi	a2,a5,1
ffffffffc0202c04:	10060263          	beqz	a2,ffffffffc0202d08 <swap_init+0x3ae>
ffffffffc0202c08:	000bb603          	ld	a2,0(s7)
ffffffffc0202c0c:	078a                	slli	a5,a5,0x2
ffffffffc0202c0e:	83b1                	srli	a5,a5,0xc
ffffffffc0202c10:	10c7f863          	bgeu	a5,a2,ffffffffc0202d20 <swap_init+0x3c6>
ffffffffc0202c14:	000cbf03          	ld	t5,0(s9)
ffffffffc0202c18:	000c3603          	ld	a2,0(s8)
ffffffffc0202c1c:	0008b503          	ld	a0,0(a7)
ffffffffc0202c20:	41e787b3          	sub	a5,a5,t5
ffffffffc0202c24:	079a                	slli	a5,a5,0x6
ffffffffc0202c26:	6705                	lui	a4,0x1
ffffffffc0202c28:	97b2                	add	a5,a5,a2
ffffffffc0202c2a:	08a1                	addi	a7,a7,8
ffffffffc0202c2c:	0821                	addi	a6,a6,8
ffffffffc0202c2e:	9aba                	add	s5,s5,a4
ffffffffc0202c30:	0af51c63          	bne	a0,a5,ffffffffc0202ce8 <swap_init+0x38e>
ffffffffc0202c34:	6795                	lui	a5,0x5
ffffffffc0202c36:	fafa95e3          	bne	s5,a5,ffffffffc0202be0 <swap_init+0x286>
ffffffffc0202c3a:	00003517          	auipc	a0,0x3
ffffffffc0202c3e:	0f650513          	addi	a0,a0,246 # ffffffffc0205d30 <etext+0x154a>
ffffffffc0202c42:	d3efd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202c46:	000b3783          	ld	a5,0(s6)
ffffffffc0202c4a:	7f9c                	ld	a5,56(a5)
ffffffffc0202c4c:	9782                	jalr	a5
ffffffffc0202c4e:	1c051d63          	bnez	a0,ffffffffc0202e28 <swap_init+0x4ce>
ffffffffc0202c52:	00093503          	ld	a0,0(s2)
ffffffffc0202c56:	4585                	li	a1,1
ffffffffc0202c58:	0921                	addi	s2,s2,8
ffffffffc0202c5a:	e57fe0ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0202c5e:	ff491ae3          	bne	s2,s4,ffffffffc0202c52 <swap_init+0x2f8>
ffffffffc0202c62:	6562                	ld	a0,24(sp)
ffffffffc0202c64:	2b9000ef          	jal	ffffffffc020371c <mm_destroy>
ffffffffc0202c68:	77a2                	ld	a5,40(sp)
ffffffffc0202c6a:	01b4b423          	sd	s11,8(s1)
ffffffffc0202c6e:	c89c                	sw	a5,16(s1)
ffffffffc0202c70:	7782                	ld	a5,32(sp)
ffffffffc0202c72:	e09c                	sd	a5,0(s1)
ffffffffc0202c74:	009d8a63          	beq	s11,s1,ffffffffc0202c88 <swap_init+0x32e>
ffffffffc0202c78:	ff8da783          	lw	a5,-8(s11)
ffffffffc0202c7c:	008dbd83          	ld	s11,8(s11)
ffffffffc0202c80:	3d7d                	addiw	s10,s10,-1
ffffffffc0202c82:	9c1d                	subw	s0,s0,a5
ffffffffc0202c84:	fe9d9ae3          	bne	s11,s1,ffffffffc0202c78 <swap_init+0x31e>
ffffffffc0202c88:	8622                	mv	a2,s0
ffffffffc0202c8a:	85ea                	mv	a1,s10
ffffffffc0202c8c:	00003517          	auipc	a0,0x3
ffffffffc0202c90:	0d450513          	addi	a0,a0,212 # ffffffffc0205d60 <etext+0x157a>
ffffffffc0202c94:	cecfd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202c98:	00003517          	auipc	a0,0x3
ffffffffc0202c9c:	0e850513          	addi	a0,a0,232 # ffffffffc0205d80 <etext+0x159a>
ffffffffc0202ca0:	ce0fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202ca4:	60ea                	ld	ra,152(sp)
ffffffffc0202ca6:	644a                	ld	s0,144(sp)
ffffffffc0202ca8:	64aa                	ld	s1,136(sp)
ffffffffc0202caa:	690a                	ld	s2,128(sp)
ffffffffc0202cac:	7a46                	ld	s4,112(sp)
ffffffffc0202cae:	7aa6                	ld	s5,104(sp)
ffffffffc0202cb0:	6be6                	ld	s7,88(sp)
ffffffffc0202cb2:	6c46                	ld	s8,80(sp)
ffffffffc0202cb4:	6ca6                	ld	s9,72(sp)
ffffffffc0202cb6:	6d06                	ld	s10,64(sp)
ffffffffc0202cb8:	7de2                	ld	s11,56(sp)
ffffffffc0202cba:	7b06                	ld	s6,96(sp)
ffffffffc0202cbc:	854e                	mv	a0,s3
ffffffffc0202cbe:	79e6                	ld	s3,120(sp)
ffffffffc0202cc0:	610d                	addi	sp,sp,160
ffffffffc0202cc2:	8082                	ret
ffffffffc0202cc4:	4901                	li	s2,0
ffffffffc0202cc6:	bb2d                	j	ffffffffc0202a00 <swap_init+0xa6>
ffffffffc0202cc8:	00002697          	auipc	a3,0x2
ffffffffc0202ccc:	42868693          	addi	a3,a3,1064 # ffffffffc02050f0 <etext+0x90a>
ffffffffc0202cd0:	00002617          	auipc	a2,0x2
ffffffffc0202cd4:	43060613          	addi	a2,a2,1072 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202cd8:	0bd00593          	li	a1,189
ffffffffc0202cdc:	00003517          	auipc	a0,0x3
ffffffffc0202ce0:	e3c50513          	addi	a0,a0,-452 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202ce4:	f4efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202ce8:	00003697          	auipc	a3,0x3
ffffffffc0202cec:	02068693          	addi	a3,a3,32 # ffffffffc0205d08 <etext+0x1522>
ffffffffc0202cf0:	00002617          	auipc	a2,0x2
ffffffffc0202cf4:	41060613          	addi	a2,a2,1040 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202cf8:	0fd00593          	li	a1,253
ffffffffc0202cfc:	00003517          	auipc	a0,0x3
ffffffffc0202d00:	e1c50513          	addi	a0,a0,-484 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202d04:	f2efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202d08:	00003617          	auipc	a2,0x3
ffffffffc0202d0c:	89860613          	addi	a2,a2,-1896 # ffffffffc02055a0 <etext+0xdba>
ffffffffc0202d10:	07400593          	li	a1,116
ffffffffc0202d14:	00002517          	auipc	a0,0x2
ffffffffc0202d18:	7c450513          	addi	a0,a0,1988 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc0202d1c:	f16fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202d20:	00003617          	auipc	a2,0x3
ffffffffc0202d24:	86060613          	addi	a2,a2,-1952 # ffffffffc0205580 <etext+0xd9a>
ffffffffc0202d28:	06200593          	li	a1,98
ffffffffc0202d2c:	00002517          	auipc	a0,0x2
ffffffffc0202d30:	7ac50513          	addi	a0,a0,1964 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc0202d34:	efefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202d38:	00003697          	auipc	a3,0x3
ffffffffc0202d3c:	f0868693          	addi	a3,a3,-248 # ffffffffc0205c40 <etext+0x145a>
ffffffffc0202d40:	00002617          	auipc	a2,0x2
ffffffffc0202d44:	3c060613          	addi	a2,a2,960 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202d48:	0de00593          	li	a1,222
ffffffffc0202d4c:	00003517          	auipc	a0,0x3
ffffffffc0202d50:	dcc50513          	addi	a0,a0,-564 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202d54:	edefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202d58:	00003697          	auipc	a3,0x3
ffffffffc0202d5c:	ed068693          	addi	a3,a3,-304 # ffffffffc0205c28 <etext+0x1442>
ffffffffc0202d60:	00002617          	auipc	a2,0x2
ffffffffc0202d64:	3a060613          	addi	a2,a2,928 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202d68:	0dd00593          	li	a1,221
ffffffffc0202d6c:	00003517          	auipc	a0,0x3
ffffffffc0202d70:	dac50513          	addi	a0,a0,-596 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202d74:	ebefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202d78:	00003617          	auipc	a2,0x3
ffffffffc0202d7c:	d8060613          	addi	a2,a2,-640 # ffffffffc0205af8 <etext+0x1312>
ffffffffc0202d80:	02a00593          	li	a1,42
ffffffffc0202d84:	00003517          	auipc	a0,0x3
ffffffffc0202d88:	d9450513          	addi	a0,a0,-620 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202d8c:	e922                	sd	s0,144(sp)
ffffffffc0202d8e:	e526                	sd	s1,136(sp)
ffffffffc0202d90:	e14a                	sd	s2,128(sp)
ffffffffc0202d92:	fcce                	sd	s3,120(sp)
ffffffffc0202d94:	f8d2                	sd	s4,112(sp)
ffffffffc0202d96:	f4d6                	sd	s5,104(sp)
ffffffffc0202d98:	f0da                	sd	s6,96(sp)
ffffffffc0202d9a:	ecde                	sd	s7,88(sp)
ffffffffc0202d9c:	e8e2                	sd	s8,80(sp)
ffffffffc0202d9e:	e4e6                	sd	s9,72(sp)
ffffffffc0202da0:	e0ea                	sd	s10,64(sp)
ffffffffc0202da2:	fc6e                	sd	s11,56(sp)
ffffffffc0202da4:	e8efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202da8:	00003697          	auipc	a3,0x3
ffffffffc0202dac:	f4868693          	addi	a3,a3,-184 # ffffffffc0205cf0 <etext+0x150a>
ffffffffc0202db0:	00002617          	auipc	a2,0x2
ffffffffc0202db4:	35060613          	addi	a2,a2,848 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202db8:	0fc00593          	li	a1,252
ffffffffc0202dbc:	00003517          	auipc	a0,0x3
ffffffffc0202dc0:	d5c50513          	addi	a0,a0,-676 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202dc4:	e6efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202dc8:	00003697          	auipc	a3,0x3
ffffffffc0202dcc:	f1868693          	addi	a3,a3,-232 # ffffffffc0205ce0 <etext+0x14fa>
ffffffffc0202dd0:	00002617          	auipc	a2,0x2
ffffffffc0202dd4:	33060613          	addi	a2,a2,816 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202dd8:	0a000593          	li	a1,160
ffffffffc0202ddc:	00003517          	auipc	a0,0x3
ffffffffc0202de0:	d3c50513          	addi	a0,a0,-708 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202de4:	e4efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202de8:	00003697          	auipc	a3,0x3
ffffffffc0202dec:	ef868693          	addi	a3,a3,-264 # ffffffffc0205ce0 <etext+0x14fa>
ffffffffc0202df0:	00002617          	auipc	a2,0x2
ffffffffc0202df4:	31060613          	addi	a2,a2,784 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202df8:	0a200593          	li	a1,162
ffffffffc0202dfc:	00003517          	auipc	a0,0x3
ffffffffc0202e00:	d1c50513          	addi	a0,a0,-740 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202e04:	e2efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202e08:	00002697          	auipc	a3,0x2
ffffffffc0202e0c:	4d068693          	addi	a3,a3,1232 # ffffffffc02052d8 <etext+0xaf2>
ffffffffc0202e10:	00002617          	auipc	a2,0x2
ffffffffc0202e14:	2f060613          	addi	a2,a2,752 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202e18:	0f400593          	li	a1,244
ffffffffc0202e1c:	00003517          	auipc	a0,0x3
ffffffffc0202e20:	cfc50513          	addi	a0,a0,-772 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202e24:	e0efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202e28:	00003697          	auipc	a3,0x3
ffffffffc0202e2c:	f3068693          	addi	a3,a3,-208 # ffffffffc0205d58 <etext+0x1572>
ffffffffc0202e30:	00002617          	auipc	a2,0x2
ffffffffc0202e34:	2d060613          	addi	a2,a2,720 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202e38:	10300593          	li	a1,259
ffffffffc0202e3c:	00003517          	auipc	a0,0x3
ffffffffc0202e40:	cdc50513          	addi	a0,a0,-804 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202e44:	deefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202e48:	00003697          	auipc	a3,0x3
ffffffffc0202e4c:	d4868693          	addi	a3,a3,-696 # ffffffffc0205b90 <etext+0x13aa>
ffffffffc0202e50:	00002617          	auipc	a2,0x2
ffffffffc0202e54:	2b060613          	addi	a2,a2,688 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202e58:	0cd00593          	li	a1,205
ffffffffc0202e5c:	00003517          	auipc	a0,0x3
ffffffffc0202e60:	cbc50513          	addi	a0,a0,-836 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202e64:	dcefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202e68:	00003697          	auipc	a3,0x3
ffffffffc0202e6c:	d3868693          	addi	a3,a3,-712 # ffffffffc0205ba0 <etext+0x13ba>
ffffffffc0202e70:	00002617          	auipc	a2,0x2
ffffffffc0202e74:	29060613          	addi	a2,a2,656 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202e78:	0d000593          	li	a1,208
ffffffffc0202e7c:	00003517          	auipc	a0,0x3
ffffffffc0202e80:	c9c50513          	addi	a0,a0,-868 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202e84:	daefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202e88:	00003697          	auipc	a3,0x3
ffffffffc0202e8c:	d6068693          	addi	a3,a3,-672 # ffffffffc0205be8 <etext+0x1402>
ffffffffc0202e90:	00002617          	auipc	a2,0x2
ffffffffc0202e94:	27060613          	addi	a2,a2,624 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202e98:	0d800593          	li	a1,216
ffffffffc0202e9c:	00003517          	auipc	a0,0x3
ffffffffc0202ea0:	c7c50513          	addi	a0,a0,-900 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202ea4:	d8efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202ea8:	00002697          	auipc	a3,0x2
ffffffffc0202eac:	28868693          	addi	a3,a3,648 # ffffffffc0205130 <etext+0x94a>
ffffffffc0202eb0:	00002617          	auipc	a2,0x2
ffffffffc0202eb4:	25060613          	addi	a2,a2,592 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202eb8:	0c000593          	li	a1,192
ffffffffc0202ebc:	00003517          	auipc	a0,0x3
ffffffffc0202ec0:	c5c50513          	addi	a0,a0,-932 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202ec4:	d6efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202ec8:	00003697          	auipc	a3,0x3
ffffffffc0202ecc:	df868693          	addi	a3,a3,-520 # ffffffffc0205cc0 <etext+0x14da>
ffffffffc0202ed0:	00002617          	auipc	a2,0x2
ffffffffc0202ed4:	23060613          	addi	a2,a2,560 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202ed8:	09800593          	li	a1,152
ffffffffc0202edc:	00003517          	auipc	a0,0x3
ffffffffc0202ee0:	c3c50513          	addi	a0,a0,-964 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202ee4:	d4efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202ee8:	00003697          	auipc	a3,0x3
ffffffffc0202eec:	dd868693          	addi	a3,a3,-552 # ffffffffc0205cc0 <etext+0x14da>
ffffffffc0202ef0:	00002617          	auipc	a2,0x2
ffffffffc0202ef4:	21060613          	addi	a2,a2,528 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202ef8:	09a00593          	li	a1,154
ffffffffc0202efc:	00003517          	auipc	a0,0x3
ffffffffc0202f00:	c1c50513          	addi	a0,a0,-996 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202f04:	d2efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202f08:	00003697          	auipc	a3,0x3
ffffffffc0202f0c:	dc868693          	addi	a3,a3,-568 # ffffffffc0205cd0 <etext+0x14ea>
ffffffffc0202f10:	00002617          	auipc	a2,0x2
ffffffffc0202f14:	1f060613          	addi	a2,a2,496 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202f18:	09c00593          	li	a1,156
ffffffffc0202f1c:	00003517          	auipc	a0,0x3
ffffffffc0202f20:	bfc50513          	addi	a0,a0,-1028 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202f24:	d0efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202f28:	00003697          	auipc	a3,0x3
ffffffffc0202f2c:	da868693          	addi	a3,a3,-600 # ffffffffc0205cd0 <etext+0x14ea>
ffffffffc0202f30:	00002617          	auipc	a2,0x2
ffffffffc0202f34:	1d060613          	addi	a2,a2,464 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202f38:	09e00593          	li	a1,158
ffffffffc0202f3c:	00003517          	auipc	a0,0x3
ffffffffc0202f40:	bdc50513          	addi	a0,a0,-1060 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202f44:	ceefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202f48:	00003697          	auipc	a3,0x3
ffffffffc0202f4c:	d6868693          	addi	a3,a3,-664 # ffffffffc0205cb0 <etext+0x14ca>
ffffffffc0202f50:	00002617          	auipc	a2,0x2
ffffffffc0202f54:	1b060613          	addi	a2,a2,432 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202f58:	09400593          	li	a1,148
ffffffffc0202f5c:	00003517          	auipc	a0,0x3
ffffffffc0202f60:	bbc50513          	addi	a0,a0,-1092 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202f64:	ccefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202f68:	00003697          	auipc	a3,0x3
ffffffffc0202f6c:	d4868693          	addi	a3,a3,-696 # ffffffffc0205cb0 <etext+0x14ca>
ffffffffc0202f70:	00002617          	auipc	a2,0x2
ffffffffc0202f74:	19060613          	addi	a2,a2,400 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202f78:	09600593          	li	a1,150
ffffffffc0202f7c:	00003517          	auipc	a0,0x3
ffffffffc0202f80:	b9c50513          	addi	a0,a0,-1124 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202f84:	caefd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202f88:	00003697          	auipc	a3,0x3
ffffffffc0202f8c:	be068693          	addi	a3,a3,-1056 # ffffffffc0205b68 <etext+0x1382>
ffffffffc0202f90:	00002617          	auipc	a2,0x2
ffffffffc0202f94:	17060613          	addi	a2,a2,368 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202f98:	0c500593          	li	a1,197
ffffffffc0202f9c:	00003517          	auipc	a0,0x3
ffffffffc0202fa0:	b7c50513          	addi	a0,a0,-1156 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202fa4:	c8efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202fa8:	00003697          	auipc	a3,0x3
ffffffffc0202fac:	bd068693          	addi	a3,a3,-1072 # ffffffffc0205b78 <etext+0x1392>
ffffffffc0202fb0:	00002617          	auipc	a2,0x2
ffffffffc0202fb4:	15060613          	addi	a2,a2,336 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202fb8:	0c800593          	li	a1,200
ffffffffc0202fbc:	00003517          	auipc	a0,0x3
ffffffffc0202fc0:	b5c50513          	addi	a0,a0,-1188 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202fc4:	c6efd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0202fc8:	00003697          	auipc	a3,0x3
ffffffffc0202fcc:	c9868693          	addi	a3,a3,-872 # ffffffffc0205c60 <etext+0x147a>
ffffffffc0202fd0:	00002617          	auipc	a2,0x2
ffffffffc0202fd4:	13060613          	addi	a2,a2,304 # ffffffffc0205100 <etext+0x91a>
ffffffffc0202fd8:	0eb00593          	li	a1,235
ffffffffc0202fdc:	00003517          	auipc	a0,0x3
ffffffffc0202fe0:	b3c50513          	addi	a0,a0,-1220 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0202fe4:	c4efd0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0202fe8 <swap_init_mm>:
ffffffffc0202fe8:	00012797          	auipc	a5,0x12
ffffffffc0202fec:	5a87b783          	ld	a5,1448(a5) # ffffffffc0215590 <sm>
ffffffffc0202ff0:	6b9c                	ld	a5,16(a5)
ffffffffc0202ff2:	8782                	jr	a5

ffffffffc0202ff4 <swap_map_swappable>:
ffffffffc0202ff4:	00012797          	auipc	a5,0x12
ffffffffc0202ff8:	59c7b783          	ld	a5,1436(a5) # ffffffffc0215590 <sm>
ffffffffc0202ffc:	739c                	ld	a5,32(a5)
ffffffffc0202ffe:	8782                	jr	a5

ffffffffc0203000 <swap_out>:
ffffffffc0203000:	711d                	addi	sp,sp,-96
ffffffffc0203002:	ec86                	sd	ra,88(sp)
ffffffffc0203004:	e8a2                	sd	s0,80(sp)
ffffffffc0203006:	0e058663          	beqz	a1,ffffffffc02030f2 <swap_out+0xf2>
ffffffffc020300a:	e0ca                	sd	s2,64(sp)
ffffffffc020300c:	fc4e                	sd	s3,56(sp)
ffffffffc020300e:	f852                	sd	s4,48(sp)
ffffffffc0203010:	f456                	sd	s5,40(sp)
ffffffffc0203012:	f05a                	sd	s6,32(sp)
ffffffffc0203014:	ec5e                	sd	s7,24(sp)
ffffffffc0203016:	e4a6                	sd	s1,72(sp)
ffffffffc0203018:	e862                	sd	s8,16(sp)
ffffffffc020301a:	8a2e                	mv	s4,a1
ffffffffc020301c:	892a                	mv	s2,a0
ffffffffc020301e:	8ab2                	mv	s5,a2
ffffffffc0203020:	4401                	li	s0,0
ffffffffc0203022:	00012997          	auipc	s3,0x12
ffffffffc0203026:	56e98993          	addi	s3,s3,1390 # ffffffffc0215590 <sm>
ffffffffc020302a:	00003b17          	auipc	s6,0x3
ffffffffc020302e:	dd6b0b13          	addi	s6,s6,-554 # ffffffffc0205e00 <etext+0x161a>
ffffffffc0203032:	00003b97          	auipc	s7,0x3
ffffffffc0203036:	db6b8b93          	addi	s7,s7,-586 # ffffffffc0205de8 <etext+0x1602>
ffffffffc020303a:	a825                	j	ffffffffc0203072 <swap_out+0x72>
ffffffffc020303c:	67a2                	ld	a5,8(sp)
ffffffffc020303e:	8626                	mv	a2,s1
ffffffffc0203040:	85a2                	mv	a1,s0
ffffffffc0203042:	7f94                	ld	a3,56(a5)
ffffffffc0203044:	855a                	mv	a0,s6
ffffffffc0203046:	2405                	addiw	s0,s0,1 # ffffffffc0200001 <kern_entry+0x1>
ffffffffc0203048:	82b1                	srli	a3,a3,0xc
ffffffffc020304a:	0685                	addi	a3,a3,1
ffffffffc020304c:	934fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203050:	6522                	ld	a0,8(sp)
ffffffffc0203052:	4585                	li	a1,1
ffffffffc0203054:	7d1c                	ld	a5,56(a0)
ffffffffc0203056:	83b1                	srli	a5,a5,0xc
ffffffffc0203058:	0785                	addi	a5,a5,1
ffffffffc020305a:	07a2                	slli	a5,a5,0x8
ffffffffc020305c:	00fc3023          	sd	a5,0(s8)
ffffffffc0203060:	a51fe0ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc0203064:	01893503          	ld	a0,24(s2)
ffffffffc0203068:	85a6                	mv	a1,s1
ffffffffc020306a:	833ff0ef          	jal	ffffffffc020289c <tlb_invalidate>
ffffffffc020306e:	048a0d63          	beq	s4,s0,ffffffffc02030c8 <swap_out+0xc8>
ffffffffc0203072:	0009b783          	ld	a5,0(s3)
ffffffffc0203076:	8656                	mv	a2,s5
ffffffffc0203078:	002c                	addi	a1,sp,8
ffffffffc020307a:	7b9c                	ld	a5,48(a5)
ffffffffc020307c:	854a                	mv	a0,s2
ffffffffc020307e:	9782                	jalr	a5
ffffffffc0203080:	e12d                	bnez	a0,ffffffffc02030e2 <swap_out+0xe2>
ffffffffc0203082:	67a2                	ld	a5,8(sp)
ffffffffc0203084:	01893503          	ld	a0,24(s2)
ffffffffc0203088:	4601                	li	a2,0
ffffffffc020308a:	7f84                	ld	s1,56(a5)
ffffffffc020308c:	85a6                	mv	a1,s1
ffffffffc020308e:	a9dfe0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0203092:	611c                	ld	a5,0(a0)
ffffffffc0203094:	8c2a                	mv	s8,a0
ffffffffc0203096:	8b85                	andi	a5,a5,1
ffffffffc0203098:	cfb9                	beqz	a5,ffffffffc02030f6 <swap_out+0xf6>
ffffffffc020309a:	65a2                	ld	a1,8(sp)
ffffffffc020309c:	7d9c                	ld	a5,56(a1)
ffffffffc020309e:	83b1                	srli	a5,a5,0xc
ffffffffc02030a0:	0785                	addi	a5,a5,1
ffffffffc02030a2:	00879513          	slli	a0,a5,0x8
ffffffffc02030a6:	5dd000ef          	jal	ffffffffc0203e82 <swapfs_write>
ffffffffc02030aa:	d949                	beqz	a0,ffffffffc020303c <swap_out+0x3c>
ffffffffc02030ac:	855e                	mv	a0,s7
ffffffffc02030ae:	8d2fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02030b2:	0009b783          	ld	a5,0(s3)
ffffffffc02030b6:	6622                	ld	a2,8(sp)
ffffffffc02030b8:	4681                	li	a3,0
ffffffffc02030ba:	739c                	ld	a5,32(a5)
ffffffffc02030bc:	85a6                	mv	a1,s1
ffffffffc02030be:	854a                	mv	a0,s2
ffffffffc02030c0:	2405                	addiw	s0,s0,1
ffffffffc02030c2:	9782                	jalr	a5
ffffffffc02030c4:	fa8a17e3          	bne	s4,s0,ffffffffc0203072 <swap_out+0x72>
ffffffffc02030c8:	64a6                	ld	s1,72(sp)
ffffffffc02030ca:	6906                	ld	s2,64(sp)
ffffffffc02030cc:	79e2                	ld	s3,56(sp)
ffffffffc02030ce:	7a42                	ld	s4,48(sp)
ffffffffc02030d0:	7aa2                	ld	s5,40(sp)
ffffffffc02030d2:	7b02                	ld	s6,32(sp)
ffffffffc02030d4:	6be2                	ld	s7,24(sp)
ffffffffc02030d6:	6c42                	ld	s8,16(sp)
ffffffffc02030d8:	60e6                	ld	ra,88(sp)
ffffffffc02030da:	8522                	mv	a0,s0
ffffffffc02030dc:	6446                	ld	s0,80(sp)
ffffffffc02030de:	6125                	addi	sp,sp,96
ffffffffc02030e0:	8082                	ret
ffffffffc02030e2:	85a2                	mv	a1,s0
ffffffffc02030e4:	00003517          	auipc	a0,0x3
ffffffffc02030e8:	cbc50513          	addi	a0,a0,-836 # ffffffffc0205da0 <etext+0x15ba>
ffffffffc02030ec:	894fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02030f0:	bfe1                	j	ffffffffc02030c8 <swap_out+0xc8>
ffffffffc02030f2:	4401                	li	s0,0
ffffffffc02030f4:	b7d5                	j	ffffffffc02030d8 <swap_out+0xd8>
ffffffffc02030f6:	00003697          	auipc	a3,0x3
ffffffffc02030fa:	cda68693          	addi	a3,a3,-806 # ffffffffc0205dd0 <etext+0x15ea>
ffffffffc02030fe:	00002617          	auipc	a2,0x2
ffffffffc0203102:	00260613          	addi	a2,a2,2 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203106:	06900593          	li	a1,105
ffffffffc020310a:	00003517          	auipc	a0,0x3
ffffffffc020310e:	a0e50513          	addi	a0,a0,-1522 # ffffffffc0205b18 <etext+0x1332>
ffffffffc0203112:	b20fd0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203116 <swap_in>:
ffffffffc0203116:	7179                	addi	sp,sp,-48
ffffffffc0203118:	e84a                	sd	s2,16(sp)
ffffffffc020311a:	892a                	mv	s2,a0
ffffffffc020311c:	4505                	li	a0,1
ffffffffc020311e:	ec26                	sd	s1,24(sp)
ffffffffc0203120:	e44e                	sd	s3,8(sp)
ffffffffc0203122:	f406                	sd	ra,40(sp)
ffffffffc0203124:	f022                	sd	s0,32(sp)
ffffffffc0203126:	84ae                	mv	s1,a1
ffffffffc0203128:	89b2                	mv	s3,a2
ffffffffc020312a:	8f7fe0ef          	jal	ffffffffc0201a20 <alloc_pages>
ffffffffc020312e:	c129                	beqz	a0,ffffffffc0203170 <swap_in+0x5a>
ffffffffc0203130:	842a                	mv	s0,a0
ffffffffc0203132:	01893503          	ld	a0,24(s2)
ffffffffc0203136:	4601                	li	a2,0
ffffffffc0203138:	85a6                	mv	a1,s1
ffffffffc020313a:	9f1fe0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc020313e:	892a                	mv	s2,a0
ffffffffc0203140:	6108                	ld	a0,0(a0)
ffffffffc0203142:	85a2                	mv	a1,s0
ffffffffc0203144:	4b1000ef          	jal	ffffffffc0203df4 <swapfs_read>
ffffffffc0203148:	00093583          	ld	a1,0(s2)
ffffffffc020314c:	8626                	mv	a2,s1
ffffffffc020314e:	00003517          	auipc	a0,0x3
ffffffffc0203152:	d0250513          	addi	a0,a0,-766 # ffffffffc0205e50 <etext+0x166a>
ffffffffc0203156:	81a1                	srli	a1,a1,0x8
ffffffffc0203158:	828fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020315c:	70a2                	ld	ra,40(sp)
ffffffffc020315e:	0089b023          	sd	s0,0(s3)
ffffffffc0203162:	7402                	ld	s0,32(sp)
ffffffffc0203164:	64e2                	ld	s1,24(sp)
ffffffffc0203166:	6942                	ld	s2,16(sp)
ffffffffc0203168:	69a2                	ld	s3,8(sp)
ffffffffc020316a:	4501                	li	a0,0
ffffffffc020316c:	6145                	addi	sp,sp,48
ffffffffc020316e:	8082                	ret
ffffffffc0203170:	00003697          	auipc	a3,0x3
ffffffffc0203174:	cd068693          	addi	a3,a3,-816 # ffffffffc0205e40 <etext+0x165a>
ffffffffc0203178:	00002617          	auipc	a2,0x2
ffffffffc020317c:	f8860613          	addi	a2,a2,-120 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203180:	07f00593          	li	a1,127
ffffffffc0203184:	00003517          	auipc	a0,0x3
ffffffffc0203188:	99450513          	addi	a0,a0,-1644 # ffffffffc0205b18 <etext+0x1332>
ffffffffc020318c:	aa6fd0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203190 <_fifo_init_mm>:
ffffffffc0203190:	0000e797          	auipc	a5,0xe
ffffffffc0203194:	37078793          	addi	a5,a5,880 # ffffffffc0211500 <pra_list_head>
ffffffffc0203198:	f51c                	sd	a5,40(a0)
ffffffffc020319a:	e79c                	sd	a5,8(a5)
ffffffffc020319c:	e39c                	sd	a5,0(a5)
ffffffffc020319e:	4501                	li	a0,0
ffffffffc02031a0:	8082                	ret

ffffffffc02031a2 <_fifo_init>:
ffffffffc02031a2:	4501                	li	a0,0
ffffffffc02031a4:	8082                	ret

ffffffffc02031a6 <_fifo_set_unswappable>:
ffffffffc02031a6:	4501                	li	a0,0
ffffffffc02031a8:	8082                	ret

ffffffffc02031aa <_fifo_tick_event>:
ffffffffc02031aa:	4501                	li	a0,0
ffffffffc02031ac:	8082                	ret

ffffffffc02031ae <_fifo_check_swap>:
ffffffffc02031ae:	711d                	addi	sp,sp,-96
ffffffffc02031b0:	fc4e                	sd	s3,56(sp)
ffffffffc02031b2:	f852                	sd	s4,48(sp)
ffffffffc02031b4:	00003517          	auipc	a0,0x3
ffffffffc02031b8:	cdc50513          	addi	a0,a0,-804 # ffffffffc0205e90 <etext+0x16aa>
ffffffffc02031bc:	698d                	lui	s3,0x3
ffffffffc02031be:	4a31                	li	s4,12
ffffffffc02031c0:	e4a6                	sd	s1,72(sp)
ffffffffc02031c2:	ec86                	sd	ra,88(sp)
ffffffffc02031c4:	e8a2                	sd	s0,80(sp)
ffffffffc02031c6:	e0ca                	sd	s2,64(sp)
ffffffffc02031c8:	f456                	sd	s5,40(sp)
ffffffffc02031ca:	f05a                	sd	s6,32(sp)
ffffffffc02031cc:	ec5e                	sd	s7,24(sp)
ffffffffc02031ce:	e862                	sd	s8,16(sp)
ffffffffc02031d0:	e466                	sd	s9,8(sp)
ffffffffc02031d2:	faffc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02031d6:	01498023          	sb	s4,0(s3) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc02031da:	00012497          	auipc	s1,0x12
ffffffffc02031de:	3be4a483          	lw	s1,958(s1) # ffffffffc0215598 <pgfault_num>
ffffffffc02031e2:	4791                	li	a5,4
ffffffffc02031e4:	14f49963          	bne	s1,a5,ffffffffc0203336 <_fifo_check_swap+0x188>
ffffffffc02031e8:	00003517          	auipc	a0,0x3
ffffffffc02031ec:	ce850513          	addi	a0,a0,-792 # ffffffffc0205ed0 <etext+0x16ea>
ffffffffc02031f0:	6a85                	lui	s5,0x1
ffffffffc02031f2:	4b29                	li	s6,10
ffffffffc02031f4:	f8dfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02031f8:	00012417          	auipc	s0,0x12
ffffffffc02031fc:	3a040413          	addi	s0,s0,928 # ffffffffc0215598 <pgfault_num>
ffffffffc0203200:	016a8023          	sb	s6,0(s5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0203204:	401c                	lw	a5,0(s0)
ffffffffc0203206:	0007891b          	sext.w	s2,a5
ffffffffc020320a:	2a979663          	bne	a5,s1,ffffffffc02034b6 <_fifo_check_swap+0x308>
ffffffffc020320e:	00003517          	auipc	a0,0x3
ffffffffc0203212:	cea50513          	addi	a0,a0,-790 # ffffffffc0205ef8 <etext+0x1712>
ffffffffc0203216:	6b91                	lui	s7,0x4
ffffffffc0203218:	4c35                	li	s8,13
ffffffffc020321a:	f67fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020321e:	018b8023          	sb	s8,0(s7) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc0203222:	401c                	lw	a5,0(s0)
ffffffffc0203224:	00078c9b          	sext.w	s9,a5
ffffffffc0203228:	27279763          	bne	a5,s2,ffffffffc0203496 <_fifo_check_swap+0x2e8>
ffffffffc020322c:	00003517          	auipc	a0,0x3
ffffffffc0203230:	cf450513          	addi	a0,a0,-780 # ffffffffc0205f20 <etext+0x173a>
ffffffffc0203234:	6489                	lui	s1,0x2
ffffffffc0203236:	492d                	li	s2,11
ffffffffc0203238:	f49fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020323c:	01248023          	sb	s2,0(s1) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc0203240:	401c                	lw	a5,0(s0)
ffffffffc0203242:	23979a63          	bne	a5,s9,ffffffffc0203476 <_fifo_check_swap+0x2c8>
ffffffffc0203246:	00003517          	auipc	a0,0x3
ffffffffc020324a:	d0250513          	addi	a0,a0,-766 # ffffffffc0205f48 <etext+0x1762>
ffffffffc020324e:	f33fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203252:	6795                	lui	a5,0x5
ffffffffc0203254:	4739                	li	a4,14
ffffffffc0203256:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc020325a:	401c                	lw	a5,0(s0)
ffffffffc020325c:	4715                	li	a4,5
ffffffffc020325e:	00078c9b          	sext.w	s9,a5
ffffffffc0203262:	1ee79a63          	bne	a5,a4,ffffffffc0203456 <_fifo_check_swap+0x2a8>
ffffffffc0203266:	00003517          	auipc	a0,0x3
ffffffffc020326a:	cba50513          	addi	a0,a0,-838 # ffffffffc0205f20 <etext+0x173a>
ffffffffc020326e:	f13fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203272:	01248023          	sb	s2,0(s1)
ffffffffc0203276:	401c                	lw	a5,0(s0)
ffffffffc0203278:	1b979f63          	bne	a5,s9,ffffffffc0203436 <_fifo_check_swap+0x288>
ffffffffc020327c:	00003517          	auipc	a0,0x3
ffffffffc0203280:	c5450513          	addi	a0,a0,-940 # ffffffffc0205ed0 <etext+0x16ea>
ffffffffc0203284:	efdfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203288:	016a8023          	sb	s6,0(s5)
ffffffffc020328c:	4018                	lw	a4,0(s0)
ffffffffc020328e:	4799                	li	a5,6
ffffffffc0203290:	18f71363          	bne	a4,a5,ffffffffc0203416 <_fifo_check_swap+0x268>
ffffffffc0203294:	00003517          	auipc	a0,0x3
ffffffffc0203298:	c8c50513          	addi	a0,a0,-884 # ffffffffc0205f20 <etext+0x173a>
ffffffffc020329c:	ee5fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02032a0:	01248023          	sb	s2,0(s1)
ffffffffc02032a4:	4018                	lw	a4,0(s0)
ffffffffc02032a6:	479d                	li	a5,7
ffffffffc02032a8:	14f71763          	bne	a4,a5,ffffffffc02033f6 <_fifo_check_swap+0x248>
ffffffffc02032ac:	00003517          	auipc	a0,0x3
ffffffffc02032b0:	be450513          	addi	a0,a0,-1052 # ffffffffc0205e90 <etext+0x16aa>
ffffffffc02032b4:	ecdfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02032b8:	01498023          	sb	s4,0(s3)
ffffffffc02032bc:	4018                	lw	a4,0(s0)
ffffffffc02032be:	47a1                	li	a5,8
ffffffffc02032c0:	10f71b63          	bne	a4,a5,ffffffffc02033d6 <_fifo_check_swap+0x228>
ffffffffc02032c4:	00003517          	auipc	a0,0x3
ffffffffc02032c8:	c3450513          	addi	a0,a0,-972 # ffffffffc0205ef8 <etext+0x1712>
ffffffffc02032cc:	eb5fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02032d0:	018b8023          	sb	s8,0(s7)
ffffffffc02032d4:	4018                	lw	a4,0(s0)
ffffffffc02032d6:	47a5                	li	a5,9
ffffffffc02032d8:	0cf71f63          	bne	a4,a5,ffffffffc02033b6 <_fifo_check_swap+0x208>
ffffffffc02032dc:	00003517          	auipc	a0,0x3
ffffffffc02032e0:	c6c50513          	addi	a0,a0,-916 # ffffffffc0205f48 <etext+0x1762>
ffffffffc02032e4:	e9dfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02032e8:	6795                	lui	a5,0x5
ffffffffc02032ea:	4739                	li	a4,14
ffffffffc02032ec:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc02032f0:	401c                	lw	a5,0(s0)
ffffffffc02032f2:	4729                	li	a4,10
ffffffffc02032f4:	0007849b          	sext.w	s1,a5
ffffffffc02032f8:	08e79f63          	bne	a5,a4,ffffffffc0203396 <_fifo_check_swap+0x1e8>
ffffffffc02032fc:	00003517          	auipc	a0,0x3
ffffffffc0203300:	bd450513          	addi	a0,a0,-1068 # ffffffffc0205ed0 <etext+0x16ea>
ffffffffc0203304:	e7dfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203308:	6785                	lui	a5,0x1
ffffffffc020330a:	0007c783          	lbu	a5,0(a5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc020330e:	06979463          	bne	a5,s1,ffffffffc0203376 <_fifo_check_swap+0x1c8>
ffffffffc0203312:	4018                	lw	a4,0(s0)
ffffffffc0203314:	47ad                	li	a5,11
ffffffffc0203316:	04f71063          	bne	a4,a5,ffffffffc0203356 <_fifo_check_swap+0x1a8>
ffffffffc020331a:	60e6                	ld	ra,88(sp)
ffffffffc020331c:	6446                	ld	s0,80(sp)
ffffffffc020331e:	64a6                	ld	s1,72(sp)
ffffffffc0203320:	6906                	ld	s2,64(sp)
ffffffffc0203322:	79e2                	ld	s3,56(sp)
ffffffffc0203324:	7a42                	ld	s4,48(sp)
ffffffffc0203326:	7aa2                	ld	s5,40(sp)
ffffffffc0203328:	7b02                	ld	s6,32(sp)
ffffffffc020332a:	6be2                	ld	s7,24(sp)
ffffffffc020332c:	6c42                	ld	s8,16(sp)
ffffffffc020332e:	6ca2                	ld	s9,8(sp)
ffffffffc0203330:	4501                	li	a0,0
ffffffffc0203332:	6125                	addi	sp,sp,96
ffffffffc0203334:	8082                	ret
ffffffffc0203336:	00003697          	auipc	a3,0x3
ffffffffc020333a:	9aa68693          	addi	a3,a3,-1622 # ffffffffc0205ce0 <etext+0x14fa>
ffffffffc020333e:	00002617          	auipc	a2,0x2
ffffffffc0203342:	dc260613          	addi	a2,a2,-574 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203346:	05100593          	li	a1,81
ffffffffc020334a:	00003517          	auipc	a0,0x3
ffffffffc020334e:	b6e50513          	addi	a0,a0,-1170 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203352:	8e0fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203356:	00003697          	auipc	a3,0x3
ffffffffc020335a:	ca268693          	addi	a3,a3,-862 # ffffffffc0205ff8 <etext+0x1812>
ffffffffc020335e:	00002617          	auipc	a2,0x2
ffffffffc0203362:	da260613          	addi	a2,a2,-606 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203366:	07300593          	li	a1,115
ffffffffc020336a:	00003517          	auipc	a0,0x3
ffffffffc020336e:	b4e50513          	addi	a0,a0,-1202 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203372:	8c0fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203376:	00003697          	auipc	a3,0x3
ffffffffc020337a:	c5a68693          	addi	a3,a3,-934 # ffffffffc0205fd0 <etext+0x17ea>
ffffffffc020337e:	00002617          	auipc	a2,0x2
ffffffffc0203382:	d8260613          	addi	a2,a2,-638 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203386:	07100593          	li	a1,113
ffffffffc020338a:	00003517          	auipc	a0,0x3
ffffffffc020338e:	b2e50513          	addi	a0,a0,-1234 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203392:	8a0fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203396:	00003697          	auipc	a3,0x3
ffffffffc020339a:	c2a68693          	addi	a3,a3,-982 # ffffffffc0205fc0 <etext+0x17da>
ffffffffc020339e:	00002617          	auipc	a2,0x2
ffffffffc02033a2:	d6260613          	addi	a2,a2,-670 # ffffffffc0205100 <etext+0x91a>
ffffffffc02033a6:	06f00593          	li	a1,111
ffffffffc02033aa:	00003517          	auipc	a0,0x3
ffffffffc02033ae:	b0e50513          	addi	a0,a0,-1266 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc02033b2:	880fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02033b6:	00003697          	auipc	a3,0x3
ffffffffc02033ba:	bfa68693          	addi	a3,a3,-1030 # ffffffffc0205fb0 <etext+0x17ca>
ffffffffc02033be:	00002617          	auipc	a2,0x2
ffffffffc02033c2:	d4260613          	addi	a2,a2,-702 # ffffffffc0205100 <etext+0x91a>
ffffffffc02033c6:	06c00593          	li	a1,108
ffffffffc02033ca:	00003517          	auipc	a0,0x3
ffffffffc02033ce:	aee50513          	addi	a0,a0,-1298 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc02033d2:	860fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02033d6:	00003697          	auipc	a3,0x3
ffffffffc02033da:	bca68693          	addi	a3,a3,-1078 # ffffffffc0205fa0 <etext+0x17ba>
ffffffffc02033de:	00002617          	auipc	a2,0x2
ffffffffc02033e2:	d2260613          	addi	a2,a2,-734 # ffffffffc0205100 <etext+0x91a>
ffffffffc02033e6:	06900593          	li	a1,105
ffffffffc02033ea:	00003517          	auipc	a0,0x3
ffffffffc02033ee:	ace50513          	addi	a0,a0,-1330 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc02033f2:	840fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02033f6:	00003697          	auipc	a3,0x3
ffffffffc02033fa:	b9a68693          	addi	a3,a3,-1126 # ffffffffc0205f90 <etext+0x17aa>
ffffffffc02033fe:	00002617          	auipc	a2,0x2
ffffffffc0203402:	d0260613          	addi	a2,a2,-766 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203406:	06600593          	li	a1,102
ffffffffc020340a:	00003517          	auipc	a0,0x3
ffffffffc020340e:	aae50513          	addi	a0,a0,-1362 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203412:	820fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203416:	00003697          	auipc	a3,0x3
ffffffffc020341a:	b6a68693          	addi	a3,a3,-1174 # ffffffffc0205f80 <etext+0x179a>
ffffffffc020341e:	00002617          	auipc	a2,0x2
ffffffffc0203422:	ce260613          	addi	a2,a2,-798 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203426:	06300593          	li	a1,99
ffffffffc020342a:	00003517          	auipc	a0,0x3
ffffffffc020342e:	a8e50513          	addi	a0,a0,-1394 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203432:	800fd0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203436:	00003697          	auipc	a3,0x3
ffffffffc020343a:	b3a68693          	addi	a3,a3,-1222 # ffffffffc0205f70 <etext+0x178a>
ffffffffc020343e:	00002617          	auipc	a2,0x2
ffffffffc0203442:	cc260613          	addi	a2,a2,-830 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203446:	06000593          	li	a1,96
ffffffffc020344a:	00003517          	auipc	a0,0x3
ffffffffc020344e:	a6e50513          	addi	a0,a0,-1426 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203452:	fe1fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203456:	00003697          	auipc	a3,0x3
ffffffffc020345a:	b1a68693          	addi	a3,a3,-1254 # ffffffffc0205f70 <etext+0x178a>
ffffffffc020345e:	00002617          	auipc	a2,0x2
ffffffffc0203462:	ca260613          	addi	a2,a2,-862 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203466:	05d00593          	li	a1,93
ffffffffc020346a:	00003517          	auipc	a0,0x3
ffffffffc020346e:	a4e50513          	addi	a0,a0,-1458 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203472:	fc1fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203476:	00003697          	auipc	a3,0x3
ffffffffc020347a:	86a68693          	addi	a3,a3,-1942 # ffffffffc0205ce0 <etext+0x14fa>
ffffffffc020347e:	00002617          	auipc	a2,0x2
ffffffffc0203482:	c8260613          	addi	a2,a2,-894 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203486:	05a00593          	li	a1,90
ffffffffc020348a:	00003517          	auipc	a0,0x3
ffffffffc020348e:	a2e50513          	addi	a0,a0,-1490 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203492:	fa1fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203496:	00003697          	auipc	a3,0x3
ffffffffc020349a:	84a68693          	addi	a3,a3,-1974 # ffffffffc0205ce0 <etext+0x14fa>
ffffffffc020349e:	00002617          	auipc	a2,0x2
ffffffffc02034a2:	c6260613          	addi	a2,a2,-926 # ffffffffc0205100 <etext+0x91a>
ffffffffc02034a6:	05700593          	li	a1,87
ffffffffc02034aa:	00003517          	auipc	a0,0x3
ffffffffc02034ae:	a0e50513          	addi	a0,a0,-1522 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc02034b2:	f81fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02034b6:	00003697          	auipc	a3,0x3
ffffffffc02034ba:	82a68693          	addi	a3,a3,-2006 # ffffffffc0205ce0 <etext+0x14fa>
ffffffffc02034be:	00002617          	auipc	a2,0x2
ffffffffc02034c2:	c4260613          	addi	a2,a2,-958 # ffffffffc0205100 <etext+0x91a>
ffffffffc02034c6:	05400593          	li	a1,84
ffffffffc02034ca:	00003517          	auipc	a0,0x3
ffffffffc02034ce:	9ee50513          	addi	a0,a0,-1554 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc02034d2:	f61fc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc02034d6 <_fifo_swap_out_victim>:
ffffffffc02034d6:	751c                	ld	a5,40(a0)
ffffffffc02034d8:	1141                	addi	sp,sp,-16
ffffffffc02034da:	e406                	sd	ra,8(sp)
ffffffffc02034dc:	cf91                	beqz	a5,ffffffffc02034f8 <_fifo_swap_out_victim+0x22>
ffffffffc02034de:	ee0d                	bnez	a2,ffffffffc0203518 <_fifo_swap_out_victim+0x42>
ffffffffc02034e0:	679c                	ld	a5,8(a5)
ffffffffc02034e2:	60a2                	ld	ra,8(sp)
ffffffffc02034e4:	4501                	li	a0,0
ffffffffc02034e6:	6394                	ld	a3,0(a5)
ffffffffc02034e8:	6798                	ld	a4,8(a5)
ffffffffc02034ea:	fd878793          	addi	a5,a5,-40
ffffffffc02034ee:	e698                	sd	a4,8(a3)
ffffffffc02034f0:	e314                	sd	a3,0(a4)
ffffffffc02034f2:	e19c                	sd	a5,0(a1)
ffffffffc02034f4:	0141                	addi	sp,sp,16
ffffffffc02034f6:	8082                	ret
ffffffffc02034f8:	00003697          	auipc	a3,0x3
ffffffffc02034fc:	b1068693          	addi	a3,a3,-1264 # ffffffffc0206008 <etext+0x1822>
ffffffffc0203500:	00002617          	auipc	a2,0x2
ffffffffc0203504:	c0060613          	addi	a2,a2,-1024 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203508:	04100593          	li	a1,65
ffffffffc020350c:	00003517          	auipc	a0,0x3
ffffffffc0203510:	9ac50513          	addi	a0,a0,-1620 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203514:	f1ffc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203518:	00003697          	auipc	a3,0x3
ffffffffc020351c:	b0068693          	addi	a3,a3,-1280 # ffffffffc0206018 <etext+0x1832>
ffffffffc0203520:	00002617          	auipc	a2,0x2
ffffffffc0203524:	be060613          	addi	a2,a2,-1056 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203528:	04200593          	li	a1,66
ffffffffc020352c:	00003517          	auipc	a0,0x3
ffffffffc0203530:	98c50513          	addi	a0,a0,-1652 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc0203534:	efffc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203538 <_fifo_map_swappable>:
ffffffffc0203538:	751c                	ld	a5,40(a0)
ffffffffc020353a:	cb91                	beqz	a5,ffffffffc020354e <_fifo_map_swappable+0x16>
ffffffffc020353c:	6394                	ld	a3,0(a5)
ffffffffc020353e:	02860713          	addi	a4,a2,40
ffffffffc0203542:	e398                	sd	a4,0(a5)
ffffffffc0203544:	e698                	sd	a4,8(a3)
ffffffffc0203546:	4501                	li	a0,0
ffffffffc0203548:	fa1c                	sd	a5,48(a2)
ffffffffc020354a:	f614                	sd	a3,40(a2)
ffffffffc020354c:	8082                	ret
ffffffffc020354e:	1141                	addi	sp,sp,-16
ffffffffc0203550:	00003697          	auipc	a3,0x3
ffffffffc0203554:	ad868693          	addi	a3,a3,-1320 # ffffffffc0206028 <etext+0x1842>
ffffffffc0203558:	00002617          	auipc	a2,0x2
ffffffffc020355c:	ba860613          	addi	a2,a2,-1112 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203560:	03200593          	li	a1,50
ffffffffc0203564:	00003517          	auipc	a0,0x3
ffffffffc0203568:	95450513          	addi	a0,a0,-1708 # ffffffffc0205eb8 <etext+0x16d2>
ffffffffc020356c:	e406                	sd	ra,8(sp)
ffffffffc020356e:	ec5fc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203572 <check_vma_overlap.part.0>:
ffffffffc0203572:	1141                	addi	sp,sp,-16
ffffffffc0203574:	00003697          	auipc	a3,0x3
ffffffffc0203578:	aec68693          	addi	a3,a3,-1300 # ffffffffc0206060 <etext+0x187a>
ffffffffc020357c:	00002617          	auipc	a2,0x2
ffffffffc0203580:	b8460613          	addi	a2,a2,-1148 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203584:	06a00593          	li	a1,106
ffffffffc0203588:	00003517          	auipc	a0,0x3
ffffffffc020358c:	af850513          	addi	a0,a0,-1288 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203590:	e406                	sd	ra,8(sp)
ffffffffc0203592:	ea1fc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203596 <mm_create>:
ffffffffc0203596:	1141                	addi	sp,sp,-16
ffffffffc0203598:	03000513          	li	a0,48
ffffffffc020359c:	e022                	sd	s0,0(sp)
ffffffffc020359e:	e406                	sd	ra,8(sp)
ffffffffc02035a0:	aa8fe0ef          	jal	ffffffffc0201848 <kmalloc>
ffffffffc02035a4:	842a                	mv	s0,a0
ffffffffc02035a6:	c105                	beqz	a0,ffffffffc02035c6 <mm_create+0x30>
ffffffffc02035a8:	e408                	sd	a0,8(s0)
ffffffffc02035aa:	e008                	sd	a0,0(s0)
ffffffffc02035ac:	00053823          	sd	zero,16(a0)
ffffffffc02035b0:	00053c23          	sd	zero,24(a0)
ffffffffc02035b4:	02052023          	sw	zero,32(a0)
ffffffffc02035b8:	00012797          	auipc	a5,0x12
ffffffffc02035bc:	fc87a783          	lw	a5,-56(a5) # ffffffffc0215580 <swap_init_ok>
ffffffffc02035c0:	eb81                	bnez	a5,ffffffffc02035d0 <mm_create+0x3a>
ffffffffc02035c2:	02053423          	sd	zero,40(a0)
ffffffffc02035c6:	60a2                	ld	ra,8(sp)
ffffffffc02035c8:	8522                	mv	a0,s0
ffffffffc02035ca:	6402                	ld	s0,0(sp)
ffffffffc02035cc:	0141                	addi	sp,sp,16
ffffffffc02035ce:	8082                	ret
ffffffffc02035d0:	a19ff0ef          	jal	ffffffffc0202fe8 <swap_init_mm>
ffffffffc02035d4:	60a2                	ld	ra,8(sp)
ffffffffc02035d6:	8522                	mv	a0,s0
ffffffffc02035d8:	6402                	ld	s0,0(sp)
ffffffffc02035da:	0141                	addi	sp,sp,16
ffffffffc02035dc:	8082                	ret

ffffffffc02035de <vma_create>:
ffffffffc02035de:	1101                	addi	sp,sp,-32
ffffffffc02035e0:	e04a                	sd	s2,0(sp)
ffffffffc02035e2:	892a                	mv	s2,a0
ffffffffc02035e4:	03000513          	li	a0,48
ffffffffc02035e8:	e822                	sd	s0,16(sp)
ffffffffc02035ea:	e426                	sd	s1,8(sp)
ffffffffc02035ec:	ec06                	sd	ra,24(sp)
ffffffffc02035ee:	84ae                	mv	s1,a1
ffffffffc02035f0:	8432                	mv	s0,a2
ffffffffc02035f2:	a56fe0ef          	jal	ffffffffc0201848 <kmalloc>
ffffffffc02035f6:	c509                	beqz	a0,ffffffffc0203600 <vma_create+0x22>
ffffffffc02035f8:	01253423          	sd	s2,8(a0)
ffffffffc02035fc:	e904                	sd	s1,16(a0)
ffffffffc02035fe:	cd00                	sw	s0,24(a0)
ffffffffc0203600:	60e2                	ld	ra,24(sp)
ffffffffc0203602:	6442                	ld	s0,16(sp)
ffffffffc0203604:	64a2                	ld	s1,8(sp)
ffffffffc0203606:	6902                	ld	s2,0(sp)
ffffffffc0203608:	6105                	addi	sp,sp,32
ffffffffc020360a:	8082                	ret

ffffffffc020360c <find_vma>:
ffffffffc020360c:	86aa                	mv	a3,a0
ffffffffc020360e:	c505                	beqz	a0,ffffffffc0203636 <find_vma+0x2a>
ffffffffc0203610:	6908                	ld	a0,16(a0)
ffffffffc0203612:	c501                	beqz	a0,ffffffffc020361a <find_vma+0xe>
ffffffffc0203614:	651c                	ld	a5,8(a0)
ffffffffc0203616:	02f5f663          	bgeu	a1,a5,ffffffffc0203642 <find_vma+0x36>
ffffffffc020361a:	669c                	ld	a5,8(a3)
ffffffffc020361c:	00f68d63          	beq	a3,a5,ffffffffc0203636 <find_vma+0x2a>
ffffffffc0203620:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203624:	00e5e663          	bltu	a1,a4,ffffffffc0203630 <find_vma+0x24>
ffffffffc0203628:	ff07b703          	ld	a4,-16(a5)
ffffffffc020362c:	00e5e763          	bltu	a1,a4,ffffffffc020363a <find_vma+0x2e>
ffffffffc0203630:	679c                	ld	a5,8(a5)
ffffffffc0203632:	fef697e3          	bne	a3,a5,ffffffffc0203620 <find_vma+0x14>
ffffffffc0203636:	4501                	li	a0,0
ffffffffc0203638:	8082                	ret
ffffffffc020363a:	fe078513          	addi	a0,a5,-32
ffffffffc020363e:	ea88                	sd	a0,16(a3)
ffffffffc0203640:	8082                	ret
ffffffffc0203642:	691c                	ld	a5,16(a0)
ffffffffc0203644:	fcf5fbe3          	bgeu	a1,a5,ffffffffc020361a <find_vma+0xe>
ffffffffc0203648:	ea88                	sd	a0,16(a3)
ffffffffc020364a:	8082                	ret

ffffffffc020364c <insert_vma_struct>:
ffffffffc020364c:	6590                	ld	a2,8(a1)
ffffffffc020364e:	0105b803          	ld	a6,16(a1)
ffffffffc0203652:	1141                	addi	sp,sp,-16
ffffffffc0203654:	e406                	sd	ra,8(sp)
ffffffffc0203656:	87aa                	mv	a5,a0
ffffffffc0203658:	01066763          	bltu	a2,a6,ffffffffc0203666 <insert_vma_struct+0x1a>
ffffffffc020365c:	a085                	j	ffffffffc02036bc <insert_vma_struct+0x70>
ffffffffc020365e:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203662:	04e66863          	bltu	a2,a4,ffffffffc02036b2 <insert_vma_struct+0x66>
ffffffffc0203666:	86be                	mv	a3,a5
ffffffffc0203668:	679c                	ld	a5,8(a5)
ffffffffc020366a:	fef51ae3          	bne	a0,a5,ffffffffc020365e <insert_vma_struct+0x12>
ffffffffc020366e:	02a68463          	beq	a3,a0,ffffffffc0203696 <insert_vma_struct+0x4a>
ffffffffc0203672:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203676:	fe86b883          	ld	a7,-24(a3)
ffffffffc020367a:	08e8f163          	bgeu	a7,a4,ffffffffc02036fc <insert_vma_struct+0xb0>
ffffffffc020367e:	04e66f63          	bltu	a2,a4,ffffffffc02036dc <insert_vma_struct+0x90>
ffffffffc0203682:	00f50a63          	beq	a0,a5,ffffffffc0203696 <insert_vma_struct+0x4a>
ffffffffc0203686:	fe87b703          	ld	a4,-24(a5)
ffffffffc020368a:	05076963          	bltu	a4,a6,ffffffffc02036dc <insert_vma_struct+0x90>
ffffffffc020368e:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203692:	02c77363          	bgeu	a4,a2,ffffffffc02036b8 <insert_vma_struct+0x6c>
ffffffffc0203696:	5118                	lw	a4,32(a0)
ffffffffc0203698:	e188                	sd	a0,0(a1)
ffffffffc020369a:	02058613          	addi	a2,a1,32
ffffffffc020369e:	e390                	sd	a2,0(a5)
ffffffffc02036a0:	e690                	sd	a2,8(a3)
ffffffffc02036a2:	60a2                	ld	ra,8(sp)
ffffffffc02036a4:	f59c                	sd	a5,40(a1)
ffffffffc02036a6:	f194                	sd	a3,32(a1)
ffffffffc02036a8:	0017079b          	addiw	a5,a4,1 # 1001 <kern_entry-0xffffffffc01fefff>
ffffffffc02036ac:	d11c                	sw	a5,32(a0)
ffffffffc02036ae:	0141                	addi	sp,sp,16
ffffffffc02036b0:	8082                	ret
ffffffffc02036b2:	fca690e3          	bne	a3,a0,ffffffffc0203672 <insert_vma_struct+0x26>
ffffffffc02036b6:	bfd1                	j	ffffffffc020368a <insert_vma_struct+0x3e>
ffffffffc02036b8:	ebbff0ef          	jal	ffffffffc0203572 <check_vma_overlap.part.0>
ffffffffc02036bc:	00003697          	auipc	a3,0x3
ffffffffc02036c0:	9d468693          	addi	a3,a3,-1580 # ffffffffc0206090 <etext+0x18aa>
ffffffffc02036c4:	00002617          	auipc	a2,0x2
ffffffffc02036c8:	a3c60613          	addi	a2,a2,-1476 # ffffffffc0205100 <etext+0x91a>
ffffffffc02036cc:	07100593          	li	a1,113
ffffffffc02036d0:	00003517          	auipc	a0,0x3
ffffffffc02036d4:	9b050513          	addi	a0,a0,-1616 # ffffffffc0206080 <etext+0x189a>
ffffffffc02036d8:	d5bfc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02036dc:	00003697          	auipc	a3,0x3
ffffffffc02036e0:	9f468693          	addi	a3,a3,-1548 # ffffffffc02060d0 <etext+0x18ea>
ffffffffc02036e4:	00002617          	auipc	a2,0x2
ffffffffc02036e8:	a1c60613          	addi	a2,a2,-1508 # ffffffffc0205100 <etext+0x91a>
ffffffffc02036ec:	06900593          	li	a1,105
ffffffffc02036f0:	00003517          	auipc	a0,0x3
ffffffffc02036f4:	99050513          	addi	a0,a0,-1648 # ffffffffc0206080 <etext+0x189a>
ffffffffc02036f8:	d3bfc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02036fc:	00003697          	auipc	a3,0x3
ffffffffc0203700:	9b468693          	addi	a3,a3,-1612 # ffffffffc02060b0 <etext+0x18ca>
ffffffffc0203704:	00002617          	auipc	a2,0x2
ffffffffc0203708:	9fc60613          	addi	a2,a2,-1540 # ffffffffc0205100 <etext+0x91a>
ffffffffc020370c:	06800593          	li	a1,104
ffffffffc0203710:	00003517          	auipc	a0,0x3
ffffffffc0203714:	97050513          	addi	a0,a0,-1680 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203718:	d1bfc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc020371c <mm_destroy>:
ffffffffc020371c:	1141                	addi	sp,sp,-16
ffffffffc020371e:	e022                	sd	s0,0(sp)
ffffffffc0203720:	842a                	mv	s0,a0
ffffffffc0203722:	6508                	ld	a0,8(a0)
ffffffffc0203724:	e406                	sd	ra,8(sp)
ffffffffc0203726:	00a40c63          	beq	s0,a0,ffffffffc020373e <mm_destroy+0x22>
ffffffffc020372a:	6118                	ld	a4,0(a0)
ffffffffc020372c:	651c                	ld	a5,8(a0)
ffffffffc020372e:	1501                	addi	a0,a0,-32
ffffffffc0203730:	e71c                	sd	a5,8(a4)
ffffffffc0203732:	e398                	sd	a4,0(a5)
ffffffffc0203734:	9befe0ef          	jal	ffffffffc02018f2 <kfree>
ffffffffc0203738:	6408                	ld	a0,8(s0)
ffffffffc020373a:	fea418e3          	bne	s0,a0,ffffffffc020372a <mm_destroy+0xe>
ffffffffc020373e:	8522                	mv	a0,s0
ffffffffc0203740:	6402                	ld	s0,0(sp)
ffffffffc0203742:	60a2                	ld	ra,8(sp)
ffffffffc0203744:	0141                	addi	sp,sp,16
ffffffffc0203746:	9acfe06f          	j	ffffffffc02018f2 <kfree>

ffffffffc020374a <vmm_init>:
ffffffffc020374a:	7139                	addi	sp,sp,-64
ffffffffc020374c:	03000513          	li	a0,48
ffffffffc0203750:	fc06                	sd	ra,56(sp)
ffffffffc0203752:	f822                	sd	s0,48(sp)
ffffffffc0203754:	f426                	sd	s1,40(sp)
ffffffffc0203756:	f04a                	sd	s2,32(sp)
ffffffffc0203758:	ec4e                	sd	s3,24(sp)
ffffffffc020375a:	e852                	sd	s4,16(sp)
ffffffffc020375c:	e456                	sd	s5,8(sp)
ffffffffc020375e:	e05a                	sd	s6,0(sp)
ffffffffc0203760:	8e8fe0ef          	jal	ffffffffc0201848 <kmalloc>
ffffffffc0203764:	2c050f63          	beqz	a0,ffffffffc0203a42 <vmm_init+0x2f8>
ffffffffc0203768:	e508                	sd	a0,8(a0)
ffffffffc020376a:	e108                	sd	a0,0(a0)
ffffffffc020376c:	00053823          	sd	zero,16(a0)
ffffffffc0203770:	00053c23          	sd	zero,24(a0)
ffffffffc0203774:	02052023          	sw	zero,32(a0)
ffffffffc0203778:	00012797          	auipc	a5,0x12
ffffffffc020377c:	e087a783          	lw	a5,-504(a5) # ffffffffc0215580 <swap_init_ok>
ffffffffc0203780:	842a                	mv	s0,a0
ffffffffc0203782:	28079d63          	bnez	a5,ffffffffc0203a1c <vmm_init+0x2d2>
ffffffffc0203786:	02053423          	sd	zero,40(a0)
ffffffffc020378a:	03200493          	li	s1,50
ffffffffc020378e:	03000513          	li	a0,48
ffffffffc0203792:	8b6fe0ef          	jal	ffffffffc0201848 <kmalloc>
ffffffffc0203796:	00248913          	addi	s2,s1,2
ffffffffc020379a:	85aa                	mv	a1,a0
ffffffffc020379c:	28050363          	beqz	a0,ffffffffc0203a22 <vmm_init+0x2d8>
ffffffffc02037a0:	e504                	sd	s1,8(a0)
ffffffffc02037a2:	01253823          	sd	s2,16(a0)
ffffffffc02037a6:	00052c23          	sw	zero,24(a0)
ffffffffc02037aa:	14ed                	addi	s1,s1,-5
ffffffffc02037ac:	8522                	mv	a0,s0
ffffffffc02037ae:	e9fff0ef          	jal	ffffffffc020364c <insert_vma_struct>
ffffffffc02037b2:	fcf1                	bnez	s1,ffffffffc020378e <vmm_init+0x44>
ffffffffc02037b4:	03700493          	li	s1,55
ffffffffc02037b8:	1f900913          	li	s2,505
ffffffffc02037bc:	03000513          	li	a0,48
ffffffffc02037c0:	888fe0ef          	jal	ffffffffc0201848 <kmalloc>
ffffffffc02037c4:	85aa                	mv	a1,a0
ffffffffc02037c6:	28050e63          	beqz	a0,ffffffffc0203a62 <vmm_init+0x318>
ffffffffc02037ca:	00248793          	addi	a5,s1,2
ffffffffc02037ce:	e504                	sd	s1,8(a0)
ffffffffc02037d0:	e91c                	sd	a5,16(a0)
ffffffffc02037d2:	00052c23          	sw	zero,24(a0)
ffffffffc02037d6:	0495                	addi	s1,s1,5
ffffffffc02037d8:	8522                	mv	a0,s0
ffffffffc02037da:	e73ff0ef          	jal	ffffffffc020364c <insert_vma_struct>
ffffffffc02037de:	fd249fe3          	bne	s1,s2,ffffffffc02037bc <vmm_init+0x72>
ffffffffc02037e2:	00843a03          	ld	s4,8(s0)
ffffffffc02037e6:	368a0563          	beq	s4,s0,ffffffffc0203b50 <vmm_init+0x406>
ffffffffc02037ea:	87d2                	mv	a5,s4
ffffffffc02037ec:	4715                	li	a4,5
ffffffffc02037ee:	1f400593          	li	a1,500
ffffffffc02037f2:	a021                	j	ffffffffc02037fa <vmm_init+0xb0>
ffffffffc02037f4:	0715                	addi	a4,a4,5
ffffffffc02037f6:	34878d63          	beq	a5,s0,ffffffffc0203b50 <vmm_init+0x406>
ffffffffc02037fa:	fe87b683          	ld	a3,-24(a5)
ffffffffc02037fe:	30e69963          	bne	a3,a4,ffffffffc0203b10 <vmm_init+0x3c6>
ffffffffc0203802:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203806:	00270693          	addi	a3,a4,2
ffffffffc020380a:	30d61363          	bne	a2,a3,ffffffffc0203b10 <vmm_init+0x3c6>
ffffffffc020380e:	679c                	ld	a5,8(a5)
ffffffffc0203810:	feb712e3          	bne	a4,a1,ffffffffc02037f4 <vmm_init+0xaa>
ffffffffc0203814:	4a9d                	li	s5,7
ffffffffc0203816:	4495                	li	s1,5
ffffffffc0203818:	1f900b13          	li	s6,505
ffffffffc020381c:	85a6                	mv	a1,s1
ffffffffc020381e:	8522                	mv	a0,s0
ffffffffc0203820:	dedff0ef          	jal	ffffffffc020360c <find_vma>
ffffffffc0203824:	89aa                	mv	s3,a0
ffffffffc0203826:	36050563          	beqz	a0,ffffffffc0203b90 <vmm_init+0x446>
ffffffffc020382a:	00148593          	addi	a1,s1,1
ffffffffc020382e:	8522                	mv	a0,s0
ffffffffc0203830:	dddff0ef          	jal	ffffffffc020360c <find_vma>
ffffffffc0203834:	892a                	mv	s2,a0
ffffffffc0203836:	32050d63          	beqz	a0,ffffffffc0203b70 <vmm_init+0x426>
ffffffffc020383a:	85d6                	mv	a1,s5
ffffffffc020383c:	8522                	mv	a0,s0
ffffffffc020383e:	dcfff0ef          	jal	ffffffffc020360c <find_vma>
ffffffffc0203842:	38051763          	bnez	a0,ffffffffc0203bd0 <vmm_init+0x486>
ffffffffc0203846:	00348593          	addi	a1,s1,3
ffffffffc020384a:	8522                	mv	a0,s0
ffffffffc020384c:	dc1ff0ef          	jal	ffffffffc020360c <find_vma>
ffffffffc0203850:	36051063          	bnez	a0,ffffffffc0203bb0 <vmm_init+0x466>
ffffffffc0203854:	00448593          	addi	a1,s1,4
ffffffffc0203858:	8522                	mv	a0,s0
ffffffffc020385a:	db3ff0ef          	jal	ffffffffc020360c <find_vma>
ffffffffc020385e:	2c051963          	bnez	a0,ffffffffc0203b30 <vmm_init+0x3e6>
ffffffffc0203862:	0089b783          	ld	a5,8(s3)
ffffffffc0203866:	28979563          	bne	a5,s1,ffffffffc0203af0 <vmm_init+0x3a6>
ffffffffc020386a:	0109b783          	ld	a5,16(s3)
ffffffffc020386e:	28fa9163          	bne	s5,a5,ffffffffc0203af0 <vmm_init+0x3a6>
ffffffffc0203872:	00893783          	ld	a5,8(s2)
ffffffffc0203876:	24979d63          	bne	a5,s1,ffffffffc0203ad0 <vmm_init+0x386>
ffffffffc020387a:	01093783          	ld	a5,16(s2)
ffffffffc020387e:	24fa9963          	bne	s5,a5,ffffffffc0203ad0 <vmm_init+0x386>
ffffffffc0203882:	0495                	addi	s1,s1,5
ffffffffc0203884:	0a95                	addi	s5,s5,5
ffffffffc0203886:	f9649be3          	bne	s1,s6,ffffffffc020381c <vmm_init+0xd2>
ffffffffc020388a:	4491                	li	s1,4
ffffffffc020388c:	597d                	li	s2,-1
ffffffffc020388e:	85a6                	mv	a1,s1
ffffffffc0203890:	8522                	mv	a0,s0
ffffffffc0203892:	d7bff0ef          	jal	ffffffffc020360c <find_vma>
ffffffffc0203896:	36051963          	bnez	a0,ffffffffc0203c08 <vmm_init+0x4be>
ffffffffc020389a:	14fd                	addi	s1,s1,-1
ffffffffc020389c:	ff2499e3          	bne	s1,s2,ffffffffc020388e <vmm_init+0x144>
ffffffffc02038a0:	000a3703          	ld	a4,0(s4)
ffffffffc02038a4:	008a3783          	ld	a5,8(s4)
ffffffffc02038a8:	fe0a0513          	addi	a0,s4,-32
ffffffffc02038ac:	e71c                	sd	a5,8(a4)
ffffffffc02038ae:	e398                	sd	a4,0(a5)
ffffffffc02038b0:	842fe0ef          	jal	ffffffffc02018f2 <kfree>
ffffffffc02038b4:	00843a03          	ld	s4,8(s0)
ffffffffc02038b8:	ff4414e3          	bne	s0,s4,ffffffffc02038a0 <vmm_init+0x156>
ffffffffc02038bc:	8522                	mv	a0,s0
ffffffffc02038be:	834fe0ef          	jal	ffffffffc02018f2 <kfree>
ffffffffc02038c2:	00003517          	auipc	a0,0x3
ffffffffc02038c6:	96e50513          	addi	a0,a0,-1682 # ffffffffc0206230 <etext+0x1a4a>
ffffffffc02038ca:	8b7fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02038ce:	a22fe0ef          	jal	ffffffffc0201af0 <nr_free_pages>
ffffffffc02038d2:	892a                	mv	s2,a0
ffffffffc02038d4:	03000513          	li	a0,48
ffffffffc02038d8:	f71fd0ef          	jal	ffffffffc0201848 <kmalloc>
ffffffffc02038dc:	842a                	mv	s0,a0
ffffffffc02038de:	1c050263          	beqz	a0,ffffffffc0203aa2 <vmm_init+0x358>
ffffffffc02038e2:	00012797          	auipc	a5,0x12
ffffffffc02038e6:	c9e7a783          	lw	a5,-866(a5) # ffffffffc0215580 <swap_init_ok>
ffffffffc02038ea:	e508                	sd	a0,8(a0)
ffffffffc02038ec:	e108                	sd	a0,0(a0)
ffffffffc02038ee:	00053823          	sd	zero,16(a0)
ffffffffc02038f2:	00053c23          	sd	zero,24(a0)
ffffffffc02038f6:	02052023          	sw	zero,32(a0)
ffffffffc02038fa:	1c079863          	bnez	a5,ffffffffc0203aca <vmm_init+0x380>
ffffffffc02038fe:	02053423          	sd	zero,40(a0)
ffffffffc0203902:	00012997          	auipc	s3,0x12
ffffffffc0203906:	c5e9b983          	ld	s3,-930(s3) # ffffffffc0215560 <boot_pgdir>
ffffffffc020390a:	0009b783          	ld	a5,0(s3)
ffffffffc020390e:	00012717          	auipc	a4,0x12
ffffffffc0203912:	c8873923          	sd	s0,-878(a4) # ffffffffc02155a0 <check_mm_struct>
ffffffffc0203916:	01343c23          	sd	s3,24(s0)
ffffffffc020391a:	36079163          	bnez	a5,ffffffffc0203c7c <vmm_init+0x532>
ffffffffc020391e:	03000513          	li	a0,48
ffffffffc0203922:	f27fd0ef          	jal	ffffffffc0201848 <kmalloc>
ffffffffc0203926:	84aa                	mv	s1,a0
ffffffffc0203928:	14050d63          	beqz	a0,ffffffffc0203a82 <vmm_init+0x338>
ffffffffc020392c:	002007b7          	lui	a5,0x200
ffffffffc0203930:	e91c                	sd	a5,16(a0)
ffffffffc0203932:	4789                	li	a5,2
ffffffffc0203934:	cd1c                	sw	a5,24(a0)
ffffffffc0203936:	85aa                	mv	a1,a0
ffffffffc0203938:	00053423          	sd	zero,8(a0)
ffffffffc020393c:	8522                	mv	a0,s0
ffffffffc020393e:	d0fff0ef          	jal	ffffffffc020364c <insert_vma_struct>
ffffffffc0203942:	10000593          	li	a1,256
ffffffffc0203946:	8522                	mv	a0,s0
ffffffffc0203948:	cc5ff0ef          	jal	ffffffffc020360c <find_vma>
ffffffffc020394c:	10000793          	li	a5,256
ffffffffc0203950:	16400713          	li	a4,356
ffffffffc0203954:	30a49463          	bne	s1,a0,ffffffffc0203c5c <vmm_init+0x512>
ffffffffc0203958:	00f78023          	sb	a5,0(a5) # 200000 <kern_entry-0xffffffffc0000000>
ffffffffc020395c:	0785                	addi	a5,a5,1
ffffffffc020395e:	fee79de3          	bne	a5,a4,ffffffffc0203958 <vmm_init+0x20e>
ffffffffc0203962:	6705                	lui	a4,0x1
ffffffffc0203964:	10000793          	li	a5,256
ffffffffc0203968:	35670713          	addi	a4,a4,854 # 1356 <kern_entry-0xffffffffc01fecaa>
ffffffffc020396c:	16400613          	li	a2,356
ffffffffc0203970:	0007c683          	lbu	a3,0(a5)
ffffffffc0203974:	0785                	addi	a5,a5,1
ffffffffc0203976:	9f15                	subw	a4,a4,a3
ffffffffc0203978:	fec79ce3          	bne	a5,a2,ffffffffc0203970 <vmm_init+0x226>
ffffffffc020397c:	2c071063          	bnez	a4,ffffffffc0203c3c <vmm_init+0x4f2>
ffffffffc0203980:	4581                	li	a1,0
ffffffffc0203982:	854e                	mv	a0,s3
ffffffffc0203984:	bd2fe0ef          	jal	ffffffffc0201d56 <page_remove>
ffffffffc0203988:	0009b783          	ld	a5,0(s3)
ffffffffc020398c:	00012717          	auipc	a4,0x12
ffffffffc0203990:	be473703          	ld	a4,-1052(a4) # ffffffffc0215570 <npage>
ffffffffc0203994:	078a                	slli	a5,a5,0x2
ffffffffc0203996:	83b1                	srli	a5,a5,0xc
ffffffffc0203998:	24e7fc63          	bgeu	a5,a4,ffffffffc0203bf0 <vmm_init+0x4a6>
ffffffffc020399c:	00003717          	auipc	a4,0x3
ffffffffc02039a0:	ed473703          	ld	a4,-300(a4) # ffffffffc0206870 <nbase>
ffffffffc02039a4:	8f99                	sub	a5,a5,a4
ffffffffc02039a6:	079a                	slli	a5,a5,0x6
ffffffffc02039a8:	00012517          	auipc	a0,0x12
ffffffffc02039ac:	bd053503          	ld	a0,-1072(a0) # ffffffffc0215578 <pages>
ffffffffc02039b0:	953e                	add	a0,a0,a5
ffffffffc02039b2:	4585                	li	a1,1
ffffffffc02039b4:	8fcfe0ef          	jal	ffffffffc0201ab0 <free_pages>
ffffffffc02039b8:	6408                	ld	a0,8(s0)
ffffffffc02039ba:	0009b023          	sd	zero,0(s3)
ffffffffc02039be:	00043c23          	sd	zero,24(s0)
ffffffffc02039c2:	00850c63          	beq	a0,s0,ffffffffc02039da <vmm_init+0x290>
ffffffffc02039c6:	6118                	ld	a4,0(a0)
ffffffffc02039c8:	651c                	ld	a5,8(a0)
ffffffffc02039ca:	1501                	addi	a0,a0,-32
ffffffffc02039cc:	e71c                	sd	a5,8(a4)
ffffffffc02039ce:	e398                	sd	a4,0(a5)
ffffffffc02039d0:	f23fd0ef          	jal	ffffffffc02018f2 <kfree>
ffffffffc02039d4:	6408                	ld	a0,8(s0)
ffffffffc02039d6:	fea418e3          	bne	s0,a0,ffffffffc02039c6 <vmm_init+0x27c>
ffffffffc02039da:	8522                	mv	a0,s0
ffffffffc02039dc:	f17fd0ef          	jal	ffffffffc02018f2 <kfree>
ffffffffc02039e0:	197d                	addi	s2,s2,-1
ffffffffc02039e2:	00012797          	auipc	a5,0x12
ffffffffc02039e6:	ba07bf23          	sd	zero,-1090(a5) # ffffffffc02155a0 <check_mm_struct>
ffffffffc02039ea:	906fe0ef          	jal	ffffffffc0201af0 <nr_free_pages>
ffffffffc02039ee:	2aa91763          	bne	s2,a0,ffffffffc0203c9c <vmm_init+0x552>
ffffffffc02039f2:	00003517          	auipc	a0,0x3
ffffffffc02039f6:	8ce50513          	addi	a0,a0,-1842 # ffffffffc02062c0 <etext+0x1ada>
ffffffffc02039fa:	f86fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02039fe:	7442                	ld	s0,48(sp)
ffffffffc0203a00:	70e2                	ld	ra,56(sp)
ffffffffc0203a02:	74a2                	ld	s1,40(sp)
ffffffffc0203a04:	7902                	ld	s2,32(sp)
ffffffffc0203a06:	69e2                	ld	s3,24(sp)
ffffffffc0203a08:	6a42                	ld	s4,16(sp)
ffffffffc0203a0a:	6aa2                	ld	s5,8(sp)
ffffffffc0203a0c:	6b02                	ld	s6,0(sp)
ffffffffc0203a0e:	00003517          	auipc	a0,0x3
ffffffffc0203a12:	8d250513          	addi	a0,a0,-1838 # ffffffffc02062e0 <etext+0x1afa>
ffffffffc0203a16:	6121                	addi	sp,sp,64
ffffffffc0203a18:	f68fc06f          	j	ffffffffc0200180 <cprintf>
ffffffffc0203a1c:	dccff0ef          	jal	ffffffffc0202fe8 <swap_init_mm>
ffffffffc0203a20:	b3ad                	j	ffffffffc020378a <vmm_init+0x40>
ffffffffc0203a22:	00002697          	auipc	a3,0x2
ffffffffc0203a26:	17e68693          	addi	a3,a3,382 # ffffffffc0205ba0 <etext+0x13ba>
ffffffffc0203a2a:	00001617          	auipc	a2,0x1
ffffffffc0203a2e:	6d660613          	addi	a2,a2,1750 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203a32:	0b500593          	li	a1,181
ffffffffc0203a36:	00002517          	auipc	a0,0x2
ffffffffc0203a3a:	64a50513          	addi	a0,a0,1610 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203a3e:	9f5fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203a42:	00002697          	auipc	a3,0x2
ffffffffc0203a46:	12668693          	addi	a3,a3,294 # ffffffffc0205b68 <etext+0x1382>
ffffffffc0203a4a:	00001617          	auipc	a2,0x1
ffffffffc0203a4e:	6b660613          	addi	a2,a2,1718 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203a52:	0ae00593          	li	a1,174
ffffffffc0203a56:	00002517          	auipc	a0,0x2
ffffffffc0203a5a:	62a50513          	addi	a0,a0,1578 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203a5e:	9d5fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203a62:	00002697          	auipc	a3,0x2
ffffffffc0203a66:	13e68693          	addi	a3,a3,318 # ffffffffc0205ba0 <etext+0x13ba>
ffffffffc0203a6a:	00001617          	auipc	a2,0x1
ffffffffc0203a6e:	69660613          	addi	a2,a2,1686 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203a72:	0bb00593          	li	a1,187
ffffffffc0203a76:	00002517          	auipc	a0,0x2
ffffffffc0203a7a:	60a50513          	addi	a0,a0,1546 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203a7e:	9b5fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203a82:	00002697          	auipc	a3,0x2
ffffffffc0203a86:	11e68693          	addi	a3,a3,286 # ffffffffc0205ba0 <etext+0x13ba>
ffffffffc0203a8a:	00001617          	auipc	a2,0x1
ffffffffc0203a8e:	67660613          	addi	a2,a2,1654 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203a92:	0f400593          	li	a1,244
ffffffffc0203a96:	00002517          	auipc	a0,0x2
ffffffffc0203a9a:	5ea50513          	addi	a0,a0,1514 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203a9e:	995fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203aa2:	00002697          	auipc	a3,0x2
ffffffffc0203aa6:	7ae68693          	addi	a3,a3,1966 # ffffffffc0206250 <etext+0x1a6a>
ffffffffc0203aaa:	00001617          	auipc	a2,0x1
ffffffffc0203aae:	65660613          	addi	a2,a2,1622 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203ab2:	0ed00593          	li	a1,237
ffffffffc0203ab6:	00002517          	auipc	a0,0x2
ffffffffc0203aba:	5ca50513          	addi	a0,a0,1482 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203abe:	00012797          	auipc	a5,0x12
ffffffffc0203ac2:	ae07b123          	sd	zero,-1310(a5) # ffffffffc02155a0 <check_mm_struct>
ffffffffc0203ac6:	96dfc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203aca:	d1eff0ef          	jal	ffffffffc0202fe8 <swap_init_mm>
ffffffffc0203ace:	bd15                	j	ffffffffc0203902 <vmm_init+0x1b8>
ffffffffc0203ad0:	00002697          	auipc	a3,0x2
ffffffffc0203ad4:	6f068693          	addi	a3,a3,1776 # ffffffffc02061c0 <etext+0x19da>
ffffffffc0203ad8:	00001617          	auipc	a2,0x1
ffffffffc0203adc:	62860613          	addi	a2,a2,1576 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203ae0:	0d500593          	li	a1,213
ffffffffc0203ae4:	00002517          	auipc	a0,0x2
ffffffffc0203ae8:	59c50513          	addi	a0,a0,1436 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203aec:	947fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203af0:	00002697          	auipc	a3,0x2
ffffffffc0203af4:	6a068693          	addi	a3,a3,1696 # ffffffffc0206190 <etext+0x19aa>
ffffffffc0203af8:	00001617          	auipc	a2,0x1
ffffffffc0203afc:	60860613          	addi	a2,a2,1544 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203b00:	0d400593          	li	a1,212
ffffffffc0203b04:	00002517          	auipc	a0,0x2
ffffffffc0203b08:	57c50513          	addi	a0,a0,1404 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203b0c:	927fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203b10:	00002697          	auipc	a3,0x2
ffffffffc0203b14:	5f868693          	addi	a3,a3,1528 # ffffffffc0206108 <etext+0x1922>
ffffffffc0203b18:	00001617          	auipc	a2,0x1
ffffffffc0203b1c:	5e860613          	addi	a2,a2,1512 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203b20:	0c400593          	li	a1,196
ffffffffc0203b24:	00002517          	auipc	a0,0x2
ffffffffc0203b28:	55c50513          	addi	a0,a0,1372 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203b2c:	907fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203b30:	00002697          	auipc	a3,0x2
ffffffffc0203b34:	65068693          	addi	a3,a3,1616 # ffffffffc0206180 <etext+0x199a>
ffffffffc0203b38:	00001617          	auipc	a2,0x1
ffffffffc0203b3c:	5c860613          	addi	a2,a2,1480 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203b40:	0d200593          	li	a1,210
ffffffffc0203b44:	00002517          	auipc	a0,0x2
ffffffffc0203b48:	53c50513          	addi	a0,a0,1340 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203b4c:	8e7fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203b50:	00002697          	auipc	a3,0x2
ffffffffc0203b54:	5a068693          	addi	a3,a3,1440 # ffffffffc02060f0 <etext+0x190a>
ffffffffc0203b58:	00001617          	auipc	a2,0x1
ffffffffc0203b5c:	5a860613          	addi	a2,a2,1448 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203b60:	0c200593          	li	a1,194
ffffffffc0203b64:	00002517          	auipc	a0,0x2
ffffffffc0203b68:	51c50513          	addi	a0,a0,1308 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203b6c:	8c7fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203b70:	00002697          	auipc	a3,0x2
ffffffffc0203b74:	5e068693          	addi	a3,a3,1504 # ffffffffc0206150 <etext+0x196a>
ffffffffc0203b78:	00001617          	auipc	a2,0x1
ffffffffc0203b7c:	58860613          	addi	a2,a2,1416 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203b80:	0cc00593          	li	a1,204
ffffffffc0203b84:	00002517          	auipc	a0,0x2
ffffffffc0203b88:	4fc50513          	addi	a0,a0,1276 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203b8c:	8a7fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203b90:	00002697          	auipc	a3,0x2
ffffffffc0203b94:	5b068693          	addi	a3,a3,1456 # ffffffffc0206140 <etext+0x195a>
ffffffffc0203b98:	00001617          	auipc	a2,0x1
ffffffffc0203b9c:	56860613          	addi	a2,a2,1384 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203ba0:	0ca00593          	li	a1,202
ffffffffc0203ba4:	00002517          	auipc	a0,0x2
ffffffffc0203ba8:	4dc50513          	addi	a0,a0,1244 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203bac:	887fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203bb0:	00002697          	auipc	a3,0x2
ffffffffc0203bb4:	5c068693          	addi	a3,a3,1472 # ffffffffc0206170 <etext+0x198a>
ffffffffc0203bb8:	00001617          	auipc	a2,0x1
ffffffffc0203bbc:	54860613          	addi	a2,a2,1352 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203bc0:	0d000593          	li	a1,208
ffffffffc0203bc4:	00002517          	auipc	a0,0x2
ffffffffc0203bc8:	4bc50513          	addi	a0,a0,1212 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203bcc:	867fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203bd0:	00002697          	auipc	a3,0x2
ffffffffc0203bd4:	59068693          	addi	a3,a3,1424 # ffffffffc0206160 <etext+0x197a>
ffffffffc0203bd8:	00001617          	auipc	a2,0x1
ffffffffc0203bdc:	52860613          	addi	a2,a2,1320 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203be0:	0ce00593          	li	a1,206
ffffffffc0203be4:	00002517          	auipc	a0,0x2
ffffffffc0203be8:	49c50513          	addi	a0,a0,1180 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203bec:	847fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203bf0:	00002617          	auipc	a2,0x2
ffffffffc0203bf4:	99060613          	addi	a2,a2,-1648 # ffffffffc0205580 <etext+0xd9a>
ffffffffc0203bf8:	06200593          	li	a1,98
ffffffffc0203bfc:	00002517          	auipc	a0,0x2
ffffffffc0203c00:	8dc50513          	addi	a0,a0,-1828 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc0203c04:	82ffc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203c08:	6914                	ld	a3,16(a0)
ffffffffc0203c0a:	6510                	ld	a2,8(a0)
ffffffffc0203c0c:	0004859b          	sext.w	a1,s1
ffffffffc0203c10:	00002517          	auipc	a0,0x2
ffffffffc0203c14:	5e050513          	addi	a0,a0,1504 # ffffffffc02061f0 <etext+0x1a0a>
ffffffffc0203c18:	d68fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203c1c:	00002697          	auipc	a3,0x2
ffffffffc0203c20:	5fc68693          	addi	a3,a3,1532 # ffffffffc0206218 <etext+0x1a32>
ffffffffc0203c24:	00001617          	auipc	a2,0x1
ffffffffc0203c28:	4dc60613          	addi	a2,a2,1244 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203c2c:	0dd00593          	li	a1,221
ffffffffc0203c30:	00002517          	auipc	a0,0x2
ffffffffc0203c34:	45050513          	addi	a0,a0,1104 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203c38:	ffafc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203c3c:	00002697          	auipc	a3,0x2
ffffffffc0203c40:	64c68693          	addi	a3,a3,1612 # ffffffffc0206288 <etext+0x1aa2>
ffffffffc0203c44:	00001617          	auipc	a2,0x1
ffffffffc0203c48:	4bc60613          	addi	a2,a2,1212 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203c4c:	10300593          	li	a1,259
ffffffffc0203c50:	00002517          	auipc	a0,0x2
ffffffffc0203c54:	43050513          	addi	a0,a0,1072 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203c58:	fdafc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203c5c:	00002697          	auipc	a3,0x2
ffffffffc0203c60:	60c68693          	addi	a3,a3,1548 # ffffffffc0206268 <etext+0x1a82>
ffffffffc0203c64:	00001617          	auipc	a2,0x1
ffffffffc0203c68:	49c60613          	addi	a2,a2,1180 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203c6c:	0f900593          	li	a1,249
ffffffffc0203c70:	00002517          	auipc	a0,0x2
ffffffffc0203c74:	41050513          	addi	a0,a0,1040 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203c78:	fbafc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203c7c:	00002697          	auipc	a3,0x2
ffffffffc0203c80:	f1468693          	addi	a3,a3,-236 # ffffffffc0205b90 <etext+0x13aa>
ffffffffc0203c84:	00001617          	auipc	a2,0x1
ffffffffc0203c88:	47c60613          	addi	a2,a2,1148 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203c8c:	0f100593          	li	a1,241
ffffffffc0203c90:	00002517          	auipc	a0,0x2
ffffffffc0203c94:	3f050513          	addi	a0,a0,1008 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203c98:	f9afc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203c9c:	00002697          	auipc	a3,0x2
ffffffffc0203ca0:	5fc68693          	addi	a3,a3,1532 # ffffffffc0206298 <etext+0x1ab2>
ffffffffc0203ca4:	00001617          	auipc	a2,0x1
ffffffffc0203ca8:	45c60613          	addi	a2,a2,1116 # ffffffffc0205100 <etext+0x91a>
ffffffffc0203cac:	10e00593          	li	a1,270
ffffffffc0203cb0:	00002517          	auipc	a0,0x2
ffffffffc0203cb4:	3d050513          	addi	a0,a0,976 # ffffffffc0206080 <etext+0x189a>
ffffffffc0203cb8:	f7afc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203cbc <do_pgfault>:
ffffffffc0203cbc:	7139                	addi	sp,sp,-64
ffffffffc0203cbe:	85b2                	mv	a1,a2
ffffffffc0203cc0:	f822                	sd	s0,48(sp)
ffffffffc0203cc2:	f426                	sd	s1,40(sp)
ffffffffc0203cc4:	fc06                	sd	ra,56(sp)
ffffffffc0203cc6:	f04a                	sd	s2,32(sp)
ffffffffc0203cc8:	8432                	mv	s0,a2
ffffffffc0203cca:	84aa                	mv	s1,a0
ffffffffc0203ccc:	941ff0ef          	jal	ffffffffc020360c <find_vma>
ffffffffc0203cd0:	00012797          	auipc	a5,0x12
ffffffffc0203cd4:	8c87a783          	lw	a5,-1848(a5) # ffffffffc0215598 <pgfault_num>
ffffffffc0203cd8:	2785                	addiw	a5,a5,1
ffffffffc0203cda:	00012717          	auipc	a4,0x12
ffffffffc0203cde:	8af72f23          	sw	a5,-1858(a4) # ffffffffc0215598 <pgfault_num>
ffffffffc0203ce2:	c555                	beqz	a0,ffffffffc0203d8e <do_pgfault+0xd2>
ffffffffc0203ce4:	651c                	ld	a5,8(a0)
ffffffffc0203ce6:	0af46463          	bltu	s0,a5,ffffffffc0203d8e <do_pgfault+0xd2>
ffffffffc0203cea:	4d1c                	lw	a5,24(a0)
ffffffffc0203cec:	ec4e                	sd	s3,24(sp)
ffffffffc0203cee:	49dd                	li	s3,23
ffffffffc0203cf0:	8b89                	andi	a5,a5,2
ffffffffc0203cf2:	cfb9                	beqz	a5,ffffffffc0203d50 <do_pgfault+0x94>
ffffffffc0203cf4:	77fd                	lui	a5,0xfffff
ffffffffc0203cf6:	6c88                	ld	a0,24(s1)
ffffffffc0203cf8:	8c7d                	and	s0,s0,a5
ffffffffc0203cfa:	4605                	li	a2,1
ffffffffc0203cfc:	85a2                	mv	a1,s0
ffffffffc0203cfe:	e2dfd0ef          	jal	ffffffffc0201b2a <get_pte>
ffffffffc0203d02:	c555                	beqz	a0,ffffffffc0203dae <do_pgfault+0xf2>
ffffffffc0203d04:	610c                	ld	a1,0(a0)
ffffffffc0203d06:	c5ad                	beqz	a1,ffffffffc0203d70 <do_pgfault+0xb4>
ffffffffc0203d08:	00012797          	auipc	a5,0x12
ffffffffc0203d0c:	8787a783          	lw	a5,-1928(a5) # ffffffffc0215580 <swap_init_ok>
ffffffffc0203d10:	cbc1                	beqz	a5,ffffffffc0203da0 <do_pgfault+0xe4>
ffffffffc0203d12:	0030                	addi	a2,sp,8
ffffffffc0203d14:	85a2                	mv	a1,s0
ffffffffc0203d16:	8526                	mv	a0,s1
ffffffffc0203d18:	e402                	sd	zero,8(sp)
ffffffffc0203d1a:	bfcff0ef          	jal	ffffffffc0203116 <swap_in>
ffffffffc0203d1e:	892a                	mv	s2,a0
ffffffffc0203d20:	e915                	bnez	a0,ffffffffc0203d54 <do_pgfault+0x98>
ffffffffc0203d22:	65a2                	ld	a1,8(sp)
ffffffffc0203d24:	6c88                	ld	a0,24(s1)
ffffffffc0203d26:	86ce                	mv	a3,s3
ffffffffc0203d28:	8622                	mv	a2,s0
ffffffffc0203d2a:	8c8fe0ef          	jal	ffffffffc0201df2 <page_insert>
ffffffffc0203d2e:	6622                	ld	a2,8(sp)
ffffffffc0203d30:	4685                	li	a3,1
ffffffffc0203d32:	85a2                	mv	a1,s0
ffffffffc0203d34:	8526                	mv	a0,s1
ffffffffc0203d36:	abeff0ef          	jal	ffffffffc0202ff4 <swap_map_swappable>
ffffffffc0203d3a:	67a2                	ld	a5,8(sp)
ffffffffc0203d3c:	ff80                	sd	s0,56(a5)
ffffffffc0203d3e:	69e2                	ld	s3,24(sp)
ffffffffc0203d40:	4901                	li	s2,0
ffffffffc0203d42:	70e2                	ld	ra,56(sp)
ffffffffc0203d44:	7442                	ld	s0,48(sp)
ffffffffc0203d46:	74a2                	ld	s1,40(sp)
ffffffffc0203d48:	854a                	mv	a0,s2
ffffffffc0203d4a:	7902                	ld	s2,32(sp)
ffffffffc0203d4c:	6121                	addi	sp,sp,64
ffffffffc0203d4e:	8082                	ret
ffffffffc0203d50:	49c1                	li	s3,16
ffffffffc0203d52:	b74d                	j	ffffffffc0203cf4 <do_pgfault+0x38>
ffffffffc0203d54:	00002517          	auipc	a0,0x2
ffffffffc0203d58:	61c50513          	addi	a0,a0,1564 # ffffffffc0206370 <etext+0x1b8a>
ffffffffc0203d5c:	c24fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203d60:	70e2                	ld	ra,56(sp)
ffffffffc0203d62:	7442                	ld	s0,48(sp)
ffffffffc0203d64:	69e2                	ld	s3,24(sp)
ffffffffc0203d66:	74a2                	ld	s1,40(sp)
ffffffffc0203d68:	854a                	mv	a0,s2
ffffffffc0203d6a:	7902                	ld	s2,32(sp)
ffffffffc0203d6c:	6121                	addi	sp,sp,64
ffffffffc0203d6e:	8082                	ret
ffffffffc0203d70:	6c88                	ld	a0,24(s1)
ffffffffc0203d72:	864e                	mv	a2,s3
ffffffffc0203d74:	85a2                	mv	a1,s0
ffffffffc0203d76:	b2dfe0ef          	jal	ffffffffc02028a2 <pgdir_alloc_page>
ffffffffc0203d7a:	f171                	bnez	a0,ffffffffc0203d3e <do_pgfault+0x82>
ffffffffc0203d7c:	00002517          	auipc	a0,0x2
ffffffffc0203d80:	5cc50513          	addi	a0,a0,1484 # ffffffffc0206348 <etext+0x1b62>
ffffffffc0203d84:	bfcfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203d88:	69e2                	ld	s3,24(sp)
ffffffffc0203d8a:	5971                	li	s2,-4
ffffffffc0203d8c:	bf5d                	j	ffffffffc0203d42 <do_pgfault+0x86>
ffffffffc0203d8e:	85a2                	mv	a1,s0
ffffffffc0203d90:	00002517          	auipc	a0,0x2
ffffffffc0203d94:	56850513          	addi	a0,a0,1384 # ffffffffc02062f8 <etext+0x1b12>
ffffffffc0203d98:	be8fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203d9c:	5975                	li	s2,-3
ffffffffc0203d9e:	b755                	j	ffffffffc0203d42 <do_pgfault+0x86>
ffffffffc0203da0:	00002517          	auipc	a0,0x2
ffffffffc0203da4:	5f050513          	addi	a0,a0,1520 # ffffffffc0206390 <etext+0x1baa>
ffffffffc0203da8:	bd8fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203dac:	bff1                	j	ffffffffc0203d88 <do_pgfault+0xcc>
ffffffffc0203dae:	00002517          	auipc	a0,0x2
ffffffffc0203db2:	57a50513          	addi	a0,a0,1402 # ffffffffc0206328 <etext+0x1b42>
ffffffffc0203db6:	bcafc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203dba:	b7f9                	j	ffffffffc0203d88 <do_pgfault+0xcc>

ffffffffc0203dbc <swapfs_init>:
ffffffffc0203dbc:	1141                	addi	sp,sp,-16
ffffffffc0203dbe:	4505                	li	a0,1
ffffffffc0203dc0:	e406                	sd	ra,8(sp)
ffffffffc0203dc2:	f94fc0ef          	jal	ffffffffc0200556 <ide_device_valid>
ffffffffc0203dc6:	cd01                	beqz	a0,ffffffffc0203dde <swapfs_init+0x22>
ffffffffc0203dc8:	4505                	li	a0,1
ffffffffc0203dca:	f92fc0ef          	jal	ffffffffc020055c <ide_device_size>
ffffffffc0203dce:	60a2                	ld	ra,8(sp)
ffffffffc0203dd0:	810d                	srli	a0,a0,0x3
ffffffffc0203dd2:	00011797          	auipc	a5,0x11
ffffffffc0203dd6:	7aa7bb23          	sd	a0,1974(a5) # ffffffffc0215588 <max_swap_offset>
ffffffffc0203dda:	0141                	addi	sp,sp,16
ffffffffc0203ddc:	8082                	ret
ffffffffc0203dde:	00002617          	auipc	a2,0x2
ffffffffc0203de2:	5da60613          	addi	a2,a2,1498 # ffffffffc02063b8 <etext+0x1bd2>
ffffffffc0203de6:	45b5                	li	a1,13
ffffffffc0203de8:	00002517          	auipc	a0,0x2
ffffffffc0203dec:	5f050513          	addi	a0,a0,1520 # ffffffffc02063d8 <etext+0x1bf2>
ffffffffc0203df0:	e42fc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203df4 <swapfs_read>:
ffffffffc0203df4:	1141                	addi	sp,sp,-16
ffffffffc0203df6:	e406                	sd	ra,8(sp)
ffffffffc0203df8:	00855793          	srli	a5,a0,0x8
ffffffffc0203dfc:	cbb1                	beqz	a5,ffffffffc0203e50 <swapfs_read+0x5c>
ffffffffc0203dfe:	00011717          	auipc	a4,0x11
ffffffffc0203e02:	78a73703          	ld	a4,1930(a4) # ffffffffc0215588 <max_swap_offset>
ffffffffc0203e06:	04e7f563          	bgeu	a5,a4,ffffffffc0203e50 <swapfs_read+0x5c>
ffffffffc0203e0a:	00011717          	auipc	a4,0x11
ffffffffc0203e0e:	76e73703          	ld	a4,1902(a4) # ffffffffc0215578 <pages>
ffffffffc0203e12:	8d99                	sub	a1,a1,a4
ffffffffc0203e14:	4065d613          	srai	a2,a1,0x6
ffffffffc0203e18:	00003717          	auipc	a4,0x3
ffffffffc0203e1c:	a5873703          	ld	a4,-1448(a4) # ffffffffc0206870 <nbase>
ffffffffc0203e20:	963a                	add	a2,a2,a4
ffffffffc0203e22:	00c61713          	slli	a4,a2,0xc
ffffffffc0203e26:	8331                	srli	a4,a4,0xc
ffffffffc0203e28:	00011697          	auipc	a3,0x11
ffffffffc0203e2c:	7486b683          	ld	a3,1864(a3) # ffffffffc0215570 <npage>
ffffffffc0203e30:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203e34:	0632                	slli	a2,a2,0xc
ffffffffc0203e36:	02d77963          	bgeu	a4,a3,ffffffffc0203e68 <swapfs_read+0x74>
ffffffffc0203e3a:	60a2                	ld	ra,8(sp)
ffffffffc0203e3c:	00011797          	auipc	a5,0x11
ffffffffc0203e40:	72c7b783          	ld	a5,1836(a5) # ffffffffc0215568 <va_pa_offset>
ffffffffc0203e44:	46a1                	li	a3,8
ffffffffc0203e46:	963e                	add	a2,a2,a5
ffffffffc0203e48:	4505                	li	a0,1
ffffffffc0203e4a:	0141                	addi	sp,sp,16
ffffffffc0203e4c:	f16fc06f          	j	ffffffffc0200562 <ide_read_secs>
ffffffffc0203e50:	86aa                	mv	a3,a0
ffffffffc0203e52:	00002617          	auipc	a2,0x2
ffffffffc0203e56:	59e60613          	addi	a2,a2,1438 # ffffffffc02063f0 <etext+0x1c0a>
ffffffffc0203e5a:	45d1                	li	a1,20
ffffffffc0203e5c:	00002517          	auipc	a0,0x2
ffffffffc0203e60:	57c50513          	addi	a0,a0,1404 # ffffffffc02063d8 <etext+0x1bf2>
ffffffffc0203e64:	dcefc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203e68:	86b2                	mv	a3,a2
ffffffffc0203e6a:	06900593          	li	a1,105
ffffffffc0203e6e:	00001617          	auipc	a2,0x1
ffffffffc0203e72:	64260613          	addi	a2,a2,1602 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0203e76:	00001517          	auipc	a0,0x1
ffffffffc0203e7a:	66250513          	addi	a0,a0,1634 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc0203e7e:	db4fc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203e82 <swapfs_write>:
ffffffffc0203e82:	1141                	addi	sp,sp,-16
ffffffffc0203e84:	e406                	sd	ra,8(sp)
ffffffffc0203e86:	00855793          	srli	a5,a0,0x8
ffffffffc0203e8a:	cbb1                	beqz	a5,ffffffffc0203ede <swapfs_write+0x5c>
ffffffffc0203e8c:	00011717          	auipc	a4,0x11
ffffffffc0203e90:	6fc73703          	ld	a4,1788(a4) # ffffffffc0215588 <max_swap_offset>
ffffffffc0203e94:	04e7f563          	bgeu	a5,a4,ffffffffc0203ede <swapfs_write+0x5c>
ffffffffc0203e98:	00011717          	auipc	a4,0x11
ffffffffc0203e9c:	6e073703          	ld	a4,1760(a4) # ffffffffc0215578 <pages>
ffffffffc0203ea0:	8d99                	sub	a1,a1,a4
ffffffffc0203ea2:	4065d613          	srai	a2,a1,0x6
ffffffffc0203ea6:	00003717          	auipc	a4,0x3
ffffffffc0203eaa:	9ca73703          	ld	a4,-1590(a4) # ffffffffc0206870 <nbase>
ffffffffc0203eae:	963a                	add	a2,a2,a4
ffffffffc0203eb0:	00c61713          	slli	a4,a2,0xc
ffffffffc0203eb4:	8331                	srli	a4,a4,0xc
ffffffffc0203eb6:	00011697          	auipc	a3,0x11
ffffffffc0203eba:	6ba6b683          	ld	a3,1722(a3) # ffffffffc0215570 <npage>
ffffffffc0203ebe:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203ec2:	0632                	slli	a2,a2,0xc
ffffffffc0203ec4:	02d77963          	bgeu	a4,a3,ffffffffc0203ef6 <swapfs_write+0x74>
ffffffffc0203ec8:	60a2                	ld	ra,8(sp)
ffffffffc0203eca:	00011797          	auipc	a5,0x11
ffffffffc0203ece:	69e7b783          	ld	a5,1694(a5) # ffffffffc0215568 <va_pa_offset>
ffffffffc0203ed2:	46a1                	li	a3,8
ffffffffc0203ed4:	963e                	add	a2,a2,a5
ffffffffc0203ed6:	4505                	li	a0,1
ffffffffc0203ed8:	0141                	addi	sp,sp,16
ffffffffc0203eda:	eacfc06f          	j	ffffffffc0200586 <ide_write_secs>
ffffffffc0203ede:	86aa                	mv	a3,a0
ffffffffc0203ee0:	00002617          	auipc	a2,0x2
ffffffffc0203ee4:	51060613          	addi	a2,a2,1296 # ffffffffc02063f0 <etext+0x1c0a>
ffffffffc0203ee8:	45e5                	li	a1,25
ffffffffc0203eea:	00002517          	auipc	a0,0x2
ffffffffc0203eee:	4ee50513          	addi	a0,a0,1262 # ffffffffc02063d8 <etext+0x1bf2>
ffffffffc0203ef2:	d40fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc0203ef6:	86b2                	mv	a3,a2
ffffffffc0203ef8:	06900593          	li	a1,105
ffffffffc0203efc:	00001617          	auipc	a2,0x1
ffffffffc0203f00:	5b460613          	addi	a2,a2,1460 # ffffffffc02054b0 <etext+0xcca>
ffffffffc0203f04:	00001517          	auipc	a0,0x1
ffffffffc0203f08:	5d450513          	addi	a0,a0,1492 # ffffffffc02054d8 <etext+0xcf2>
ffffffffc0203f0c:	d26fc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0203f10 <init_main>:
ffffffffc0203f10:	1101                	addi	sp,sp,-32
ffffffffc0203f12:	e822                	sd	s0,16(sp)
ffffffffc0203f14:	e426                	sd	s1,8(sp)
ffffffffc0203f16:	842a                	mv	s0,a0
ffffffffc0203f18:	00011497          	auipc	s1,0x11
ffffffffc0203f1c:	6984b483          	ld	s1,1688(s1) # ffffffffc02155b0 <current>
ffffffffc0203f20:	4641                	li	a2,16
ffffffffc0203f22:	4581                	li	a1,0
ffffffffc0203f24:	0000d517          	auipc	a0,0xd
ffffffffc0203f28:	5ec50513          	addi	a0,a0,1516 # ffffffffc0211510 <name.0>
ffffffffc0203f2c:	ec06                	sd	ra,24(sp)
ffffffffc0203f2e:	e04a                	sd	s2,0(sp)
ffffffffc0203f30:	0044a903          	lw	s2,4(s1)
ffffffffc0203f34:	089000ef          	jal	ffffffffc02047bc <memset>
ffffffffc0203f38:	0b448593          	addi	a1,s1,180
ffffffffc0203f3c:	463d                	li	a2,15
ffffffffc0203f3e:	0000d517          	auipc	a0,0xd
ffffffffc0203f42:	5d250513          	addi	a0,a0,1490 # ffffffffc0211510 <name.0>
ffffffffc0203f46:	089000ef          	jal	ffffffffc02047ce <memcpy>
ffffffffc0203f4a:	862a                	mv	a2,a0
ffffffffc0203f4c:	85ca                	mv	a1,s2
ffffffffc0203f4e:	00002517          	auipc	a0,0x2
ffffffffc0203f52:	4c250513          	addi	a0,a0,1218 # ffffffffc0206410 <etext+0x1c2a>
ffffffffc0203f56:	a2afc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203f5a:	85a2                	mv	a1,s0
ffffffffc0203f5c:	00002517          	auipc	a0,0x2
ffffffffc0203f60:	4dc50513          	addi	a0,a0,1244 # ffffffffc0206438 <etext+0x1c52>
ffffffffc0203f64:	a1cfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203f68:	00002517          	auipc	a0,0x2
ffffffffc0203f6c:	4e050513          	addi	a0,a0,1248 # ffffffffc0206448 <etext+0x1c62>
ffffffffc0203f70:	a10fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203f74:	60e2                	ld	ra,24(sp)
ffffffffc0203f76:	6442                	ld	s0,16(sp)
ffffffffc0203f78:	64a2                	ld	s1,8(sp)
ffffffffc0203f7a:	6902                	ld	s2,0(sp)
ffffffffc0203f7c:	4501                	li	a0,0
ffffffffc0203f7e:	6105                	addi	sp,sp,32
ffffffffc0203f80:	8082                	ret

ffffffffc0203f82 <proc_run>:
ffffffffc0203f82:	7179                	addi	sp,sp,-48
ffffffffc0203f84:	ec4a                	sd	s2,24(sp)
ffffffffc0203f86:	00011917          	auipc	s2,0x11
ffffffffc0203f8a:	62a90913          	addi	s2,s2,1578 # ffffffffc02155b0 <current>
ffffffffc0203f8e:	f026                	sd	s1,32(sp)
ffffffffc0203f90:	00093483          	ld	s1,0(s2)
ffffffffc0203f94:	f406                	sd	ra,40(sp)
ffffffffc0203f96:	02a48b63          	beq	s1,a0,ffffffffc0203fcc <proc_run+0x4a>
ffffffffc0203f9a:	e84e                	sd	s3,16(sp)
ffffffffc0203f9c:	100027f3          	csrr	a5,sstatus
ffffffffc0203fa0:	8b89                	andi	a5,a5,2
ffffffffc0203fa2:	4981                	li	s3,0
ffffffffc0203fa4:	e3a1                	bnez	a5,ffffffffc0203fe4 <proc_run+0x62>
ffffffffc0203fa6:	755c                	ld	a5,168(a0)
ffffffffc0203fa8:	80000737          	lui	a4,0x80000
ffffffffc0203fac:	00a93023          	sd	a0,0(s2)
ffffffffc0203fb0:	00c7d79b          	srliw	a5,a5,0xc
ffffffffc0203fb4:	8fd9                	or	a5,a5,a4
ffffffffc0203fb6:	18079073          	csrw	satp,a5
ffffffffc0203fba:	03050593          	addi	a1,a0,48
ffffffffc0203fbe:	03048513          	addi	a0,s1,48
ffffffffc0203fc2:	268000ef          	jal	ffffffffc020422a <switch_to>
ffffffffc0203fc6:	00099863          	bnez	s3,ffffffffc0203fd6 <proc_run+0x54>
ffffffffc0203fca:	69c2                	ld	s3,16(sp)
ffffffffc0203fcc:	70a2                	ld	ra,40(sp)
ffffffffc0203fce:	7482                	ld	s1,32(sp)
ffffffffc0203fd0:	6962                	ld	s2,24(sp)
ffffffffc0203fd2:	6145                	addi	sp,sp,48
ffffffffc0203fd4:	8082                	ret
ffffffffc0203fd6:	69c2                	ld	s3,16(sp)
ffffffffc0203fd8:	70a2                	ld	ra,40(sp)
ffffffffc0203fda:	7482                	ld	s1,32(sp)
ffffffffc0203fdc:	6962                	ld	s2,24(sp)
ffffffffc0203fde:	6145                	addi	sp,sp,48
ffffffffc0203fe0:	dcafc06f          	j	ffffffffc02005aa <intr_enable>
ffffffffc0203fe4:	e42a                	sd	a0,8(sp)
ffffffffc0203fe6:	dcafc0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0203fea:	6522                	ld	a0,8(sp)
ffffffffc0203fec:	4985                	li	s3,1
ffffffffc0203fee:	bf65                	j	ffffffffc0203fa6 <proc_run+0x24>

ffffffffc0203ff0 <kernel_thread>:
ffffffffc0203ff0:	7169                	addi	sp,sp,-304
ffffffffc0203ff2:	12000613          	li	a2,288
ffffffffc0203ff6:	4581                	li	a1,0
ffffffffc0203ff8:	850a                	mv	a0,sp
ffffffffc0203ffa:	f606                	sd	ra,296(sp)
ffffffffc0203ffc:	7c0000ef          	jal	ffffffffc02047bc <memset>
ffffffffc0204000:	100027f3          	csrr	a5,sstatus
ffffffffc0204004:	70b2                	ld	ra,296(sp)
ffffffffc0204006:	00011517          	auipc	a0,0x11
ffffffffc020400a:	5a252503          	lw	a0,1442(a0) # ffffffffc02155a8 <nr_process>
ffffffffc020400e:	6785                	lui	a5,0x1
ffffffffc0204010:	00f52533          	slt	a0,a0,a5
ffffffffc0204014:	156d                	addi	a0,a0,-5
ffffffffc0204016:	6155                	addi	sp,sp,304
ffffffffc0204018:	8082                	ret

ffffffffc020401a <proc_init>:
ffffffffc020401a:	7179                	addi	sp,sp,-48
ffffffffc020401c:	ec26                	sd	s1,24(sp)
ffffffffc020401e:	00011797          	auipc	a5,0x11
ffffffffc0204022:	50278793          	addi	a5,a5,1282 # ffffffffc0215520 <proc_list>
ffffffffc0204026:	f406                	sd	ra,40(sp)
ffffffffc0204028:	f022                	sd	s0,32(sp)
ffffffffc020402a:	e84a                	sd	s2,16(sp)
ffffffffc020402c:	e44e                	sd	s3,8(sp)
ffffffffc020402e:	0000d497          	auipc	s1,0xd
ffffffffc0204032:	4f248493          	addi	s1,s1,1266 # ffffffffc0211520 <hash_list>
ffffffffc0204036:	e79c                	sd	a5,8(a5)
ffffffffc0204038:	e39c                	sd	a5,0(a5)
ffffffffc020403a:	00011717          	auipc	a4,0x11
ffffffffc020403e:	4e670713          	addi	a4,a4,1254 # ffffffffc0215520 <proc_list>
ffffffffc0204042:	87a6                	mv	a5,s1
ffffffffc0204044:	e79c                	sd	a5,8(a5)
ffffffffc0204046:	e39c                	sd	a5,0(a5)
ffffffffc0204048:	07c1                	addi	a5,a5,16
ffffffffc020404a:	fee79de3          	bne	a5,a4,ffffffffc0204044 <proc_init+0x2a>
ffffffffc020404e:	0e800513          	li	a0,232
ffffffffc0204052:	ff6fd0ef          	jal	ffffffffc0201848 <kmalloc>
ffffffffc0204056:	842a                	mv	s0,a0
ffffffffc0204058:	12050d63          	beqz	a0,ffffffffc0204192 <proc_init+0x178>
ffffffffc020405c:	57fd                	li	a5,-1
ffffffffc020405e:	1782                	slli	a5,a5,0x20
ffffffffc0204060:	e11c                	sd	a5,0(a0)
ffffffffc0204062:	00052423          	sw	zero,8(a0)
ffffffffc0204066:	00053823          	sd	zero,16(a0)
ffffffffc020406a:	00052c23          	sw	zero,24(a0)
ffffffffc020406e:	02053023          	sd	zero,32(a0)
ffffffffc0204072:	02053423          	sd	zero,40(a0)
ffffffffc0204076:	07000613          	li	a2,112
ffffffffc020407a:	4581                	li	a1,0
ffffffffc020407c:	03050513          	addi	a0,a0,48
ffffffffc0204080:	73c000ef          	jal	ffffffffc02047bc <memset>
ffffffffc0204084:	0b440993          	addi	s3,s0,180
ffffffffc0204088:	00011797          	auipc	a5,0x11
ffffffffc020408c:	4d07b783          	ld	a5,1232(a5) # ffffffffc0215558 <boot_cr3>
ffffffffc0204090:	f45c                	sd	a5,168(s0)
ffffffffc0204092:	0a043023          	sd	zero,160(s0)
ffffffffc0204096:	0a042823          	sw	zero,176(s0)
ffffffffc020409a:	463d                	li	a2,15
ffffffffc020409c:	4581                	li	a1,0
ffffffffc020409e:	854e                	mv	a0,s3
ffffffffc02040a0:	71c000ef          	jal	ffffffffc02047bc <memset>
ffffffffc02040a4:	00011917          	auipc	s2,0x11
ffffffffc02040a8:	51c90913          	addi	s2,s2,1308 # ffffffffc02155c0 <idleproc>
ffffffffc02040ac:	00893023          	sd	s0,0(s2)
ffffffffc02040b0:	4789                	li	a5,2
ffffffffc02040b2:	e01c                	sd	a5,0(s0)
ffffffffc02040b4:	00003797          	auipc	a5,0x3
ffffffffc02040b8:	f4c78793          	addi	a5,a5,-180 # ffffffffc0207000 <bootstack>
ffffffffc02040bc:	e81c                	sd	a5,16(s0)
ffffffffc02040be:	4785                	li	a5,1
ffffffffc02040c0:	cc1c                	sw	a5,24(s0)
ffffffffc02040c2:	4641                	li	a2,16
ffffffffc02040c4:	4581                	li	a1,0
ffffffffc02040c6:	854e                	mv	a0,s3
ffffffffc02040c8:	6f4000ef          	jal	ffffffffc02047bc <memset>
ffffffffc02040cc:	463d                	li	a2,15
ffffffffc02040ce:	00002597          	auipc	a1,0x2
ffffffffc02040d2:	3e258593          	addi	a1,a1,994 # ffffffffc02064b0 <etext+0x1cca>
ffffffffc02040d6:	854e                	mv	a0,s3
ffffffffc02040d8:	6f6000ef          	jal	ffffffffc02047ce <memcpy>
ffffffffc02040dc:	00011717          	auipc	a4,0x11
ffffffffc02040e0:	4cc70713          	addi	a4,a4,1228 # ffffffffc02155a8 <nr_process>
ffffffffc02040e4:	431c                	lw	a5,0(a4)
ffffffffc02040e6:	00093683          	ld	a3,0(s2)
ffffffffc02040ea:	4601                	li	a2,0
ffffffffc02040ec:	2785                	addiw	a5,a5,1
ffffffffc02040ee:	00002597          	auipc	a1,0x2
ffffffffc02040f2:	3ca58593          	addi	a1,a1,970 # ffffffffc02064b8 <etext+0x1cd2>
ffffffffc02040f6:	00000517          	auipc	a0,0x0
ffffffffc02040fa:	e1a50513          	addi	a0,a0,-486 # ffffffffc0203f10 <init_main>
ffffffffc02040fe:	c31c                	sw	a5,0(a4)
ffffffffc0204100:	00011797          	auipc	a5,0x11
ffffffffc0204104:	4ad7b823          	sd	a3,1200(a5) # ffffffffc02155b0 <current>
ffffffffc0204108:	ee9ff0ef          	jal	ffffffffc0203ff0 <kernel_thread>
ffffffffc020410c:	842a                	mv	s0,a0
ffffffffc020410e:	0aa05563          	blez	a0,ffffffffc02041b8 <proc_init+0x19e>
ffffffffc0204112:	6789                	lui	a5,0x2
ffffffffc0204114:	fff5071b          	addiw	a4,a0,-1
ffffffffc0204118:	17f9                	addi	a5,a5,-2 # 1ffe <kern_entry-0xffffffffc01fe002>
ffffffffc020411a:	2501                	sext.w	a0,a0
ffffffffc020411c:	02e7e463          	bltu	a5,a4,ffffffffc0204144 <proc_init+0x12a>
ffffffffc0204120:	45a9                	li	a1,10
ffffffffc0204122:	206000ef          	jal	ffffffffc0204328 <hash32>
ffffffffc0204126:	02051713          	slli	a4,a0,0x20
ffffffffc020412a:	01c75793          	srli	a5,a4,0x1c
ffffffffc020412e:	00f486b3          	add	a3,s1,a5
ffffffffc0204132:	87b6                	mv	a5,a3
ffffffffc0204134:	a029                	j	ffffffffc020413e <proc_init+0x124>
ffffffffc0204136:	f2c7a703          	lw	a4,-212(a5)
ffffffffc020413a:	06870c63          	beq	a4,s0,ffffffffc02041b2 <proc_init+0x198>
ffffffffc020413e:	679c                	ld	a5,8(a5)
ffffffffc0204140:	fef69be3          	bne	a3,a5,ffffffffc0204136 <proc_init+0x11c>
ffffffffc0204144:	4781                	li	a5,0
ffffffffc0204146:	0b478493          	addi	s1,a5,180
ffffffffc020414a:	4641                	li	a2,16
ffffffffc020414c:	4581                	li	a1,0
ffffffffc020414e:	00011417          	auipc	s0,0x11
ffffffffc0204152:	46a40413          	addi	s0,s0,1130 # ffffffffc02155b8 <initproc>
ffffffffc0204156:	8526                	mv	a0,s1
ffffffffc0204158:	e01c                	sd	a5,0(s0)
ffffffffc020415a:	662000ef          	jal	ffffffffc02047bc <memset>
ffffffffc020415e:	463d                	li	a2,15
ffffffffc0204160:	00002597          	auipc	a1,0x2
ffffffffc0204164:	38858593          	addi	a1,a1,904 # ffffffffc02064e8 <etext+0x1d02>
ffffffffc0204168:	8526                	mv	a0,s1
ffffffffc020416a:	664000ef          	jal	ffffffffc02047ce <memcpy>
ffffffffc020416e:	00093783          	ld	a5,0(s2)
ffffffffc0204172:	cfbd                	beqz	a5,ffffffffc02041f0 <proc_init+0x1d6>
ffffffffc0204174:	43dc                	lw	a5,4(a5)
ffffffffc0204176:	efad                	bnez	a5,ffffffffc02041f0 <proc_init+0x1d6>
ffffffffc0204178:	601c                	ld	a5,0(s0)
ffffffffc020417a:	cbb9                	beqz	a5,ffffffffc02041d0 <proc_init+0x1b6>
ffffffffc020417c:	43d8                	lw	a4,4(a5)
ffffffffc020417e:	4785                	li	a5,1
ffffffffc0204180:	04f71863          	bne	a4,a5,ffffffffc02041d0 <proc_init+0x1b6>
ffffffffc0204184:	70a2                	ld	ra,40(sp)
ffffffffc0204186:	7402                	ld	s0,32(sp)
ffffffffc0204188:	64e2                	ld	s1,24(sp)
ffffffffc020418a:	6942                	ld	s2,16(sp)
ffffffffc020418c:	69a2                	ld	s3,8(sp)
ffffffffc020418e:	6145                	addi	sp,sp,48
ffffffffc0204190:	8082                	ret
ffffffffc0204192:	00002617          	auipc	a2,0x2
ffffffffc0204196:	30660613          	addi	a2,a2,774 # ffffffffc0206498 <etext+0x1cb2>
ffffffffc020419a:	15f00593          	li	a1,351
ffffffffc020419e:	00002517          	auipc	a0,0x2
ffffffffc02041a2:	2e250513          	addi	a0,a0,738 # ffffffffc0206480 <etext+0x1c9a>
ffffffffc02041a6:	00011797          	auipc	a5,0x11
ffffffffc02041aa:	4007bd23          	sd	zero,1050(a5) # ffffffffc02155c0 <idleproc>
ffffffffc02041ae:	a84fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02041b2:	f2878793          	addi	a5,a5,-216
ffffffffc02041b6:	bf41                	j	ffffffffc0204146 <proc_init+0x12c>
ffffffffc02041b8:	00002617          	auipc	a2,0x2
ffffffffc02041bc:	31060613          	addi	a2,a2,784 # ffffffffc02064c8 <etext+0x1ce2>
ffffffffc02041c0:	16d00593          	li	a1,365
ffffffffc02041c4:	00002517          	auipc	a0,0x2
ffffffffc02041c8:	2bc50513          	addi	a0,a0,700 # ffffffffc0206480 <etext+0x1c9a>
ffffffffc02041cc:	a66fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02041d0:	00002697          	auipc	a3,0x2
ffffffffc02041d4:	34868693          	addi	a3,a3,840 # ffffffffc0206518 <etext+0x1d32>
ffffffffc02041d8:	00001617          	auipc	a2,0x1
ffffffffc02041dc:	f2860613          	addi	a2,a2,-216 # ffffffffc0205100 <etext+0x91a>
ffffffffc02041e0:	17400593          	li	a1,372
ffffffffc02041e4:	00002517          	auipc	a0,0x2
ffffffffc02041e8:	29c50513          	addi	a0,a0,668 # ffffffffc0206480 <etext+0x1c9a>
ffffffffc02041ec:	a46fc0ef          	jal	ffffffffc0200432 <__panic>
ffffffffc02041f0:	00002697          	auipc	a3,0x2
ffffffffc02041f4:	30068693          	addi	a3,a3,768 # ffffffffc02064f0 <etext+0x1d0a>
ffffffffc02041f8:	00001617          	auipc	a2,0x1
ffffffffc02041fc:	f0860613          	addi	a2,a2,-248 # ffffffffc0205100 <etext+0x91a>
ffffffffc0204200:	17300593          	li	a1,371
ffffffffc0204204:	00002517          	auipc	a0,0x2
ffffffffc0204208:	27c50513          	addi	a0,a0,636 # ffffffffc0206480 <etext+0x1c9a>
ffffffffc020420c:	a26fc0ef          	jal	ffffffffc0200432 <__panic>

ffffffffc0204210 <cpu_idle>:
ffffffffc0204210:	1141                	addi	sp,sp,-16
ffffffffc0204212:	e022                	sd	s0,0(sp)
ffffffffc0204214:	e406                	sd	ra,8(sp)
ffffffffc0204216:	00011417          	auipc	s0,0x11
ffffffffc020421a:	39a40413          	addi	s0,s0,922 # ffffffffc02155b0 <current>
ffffffffc020421e:	6018                	ld	a4,0(s0)
ffffffffc0204220:	4f1c                	lw	a5,24(a4)
ffffffffc0204222:	dffd                	beqz	a5,ffffffffc0204220 <cpu_idle+0x10>
ffffffffc0204224:	070000ef          	jal	ffffffffc0204294 <schedule>
ffffffffc0204228:	bfdd                	j	ffffffffc020421e <cpu_idle+0xe>

ffffffffc020422a <switch_to>:
ffffffffc020422a:	00153023          	sd	ra,0(a0)
ffffffffc020422e:	00253423          	sd	sp,8(a0)
ffffffffc0204232:	e900                	sd	s0,16(a0)
ffffffffc0204234:	ed04                	sd	s1,24(a0)
ffffffffc0204236:	03253023          	sd	s2,32(a0)
ffffffffc020423a:	03353423          	sd	s3,40(a0)
ffffffffc020423e:	03453823          	sd	s4,48(a0)
ffffffffc0204242:	03553c23          	sd	s5,56(a0)
ffffffffc0204246:	05653023          	sd	s6,64(a0)
ffffffffc020424a:	05753423          	sd	s7,72(a0)
ffffffffc020424e:	05853823          	sd	s8,80(a0)
ffffffffc0204252:	05953c23          	sd	s9,88(a0)
ffffffffc0204256:	07a53023          	sd	s10,96(a0)
ffffffffc020425a:	07b53423          	sd	s11,104(a0)
ffffffffc020425e:	0005b083          	ld	ra,0(a1)
ffffffffc0204262:	0085b103          	ld	sp,8(a1)
ffffffffc0204266:	6980                	ld	s0,16(a1)
ffffffffc0204268:	6d84                	ld	s1,24(a1)
ffffffffc020426a:	0205b903          	ld	s2,32(a1)
ffffffffc020426e:	0285b983          	ld	s3,40(a1)
ffffffffc0204272:	0305ba03          	ld	s4,48(a1)
ffffffffc0204276:	0385ba83          	ld	s5,56(a1)
ffffffffc020427a:	0405bb03          	ld	s6,64(a1)
ffffffffc020427e:	0485bb83          	ld	s7,72(a1)
ffffffffc0204282:	0505bc03          	ld	s8,80(a1)
ffffffffc0204286:	0585bc83          	ld	s9,88(a1)
ffffffffc020428a:	0605bd03          	ld	s10,96(a1)
ffffffffc020428e:	0685bd83          	ld	s11,104(a1)
ffffffffc0204292:	8082                	ret

ffffffffc0204294 <schedule>:
ffffffffc0204294:	1141                	addi	sp,sp,-16
ffffffffc0204296:	e406                	sd	ra,8(sp)
ffffffffc0204298:	e022                	sd	s0,0(sp)
ffffffffc020429a:	100027f3          	csrr	a5,sstatus
ffffffffc020429e:	8b89                	andi	a5,a5,2
ffffffffc02042a0:	4401                	li	s0,0
ffffffffc02042a2:	efbd                	bnez	a5,ffffffffc0204320 <schedule+0x8c>
ffffffffc02042a4:	00011897          	auipc	a7,0x11
ffffffffc02042a8:	30c8b883          	ld	a7,780(a7) # ffffffffc02155b0 <current>
ffffffffc02042ac:	0008ac23          	sw	zero,24(a7)
ffffffffc02042b0:	00011517          	auipc	a0,0x11
ffffffffc02042b4:	31053503          	ld	a0,784(a0) # ffffffffc02155c0 <idleproc>
ffffffffc02042b8:	04a88e63          	beq	a7,a0,ffffffffc0204314 <schedule+0x80>
ffffffffc02042bc:	0c888693          	addi	a3,a7,200
ffffffffc02042c0:	00011617          	auipc	a2,0x11
ffffffffc02042c4:	26060613          	addi	a2,a2,608 # ffffffffc0215520 <proc_list>
ffffffffc02042c8:	87b6                	mv	a5,a3
ffffffffc02042ca:	4581                	li	a1,0
ffffffffc02042cc:	4809                	li	a6,2
ffffffffc02042ce:	679c                	ld	a5,8(a5)
ffffffffc02042d0:	00c78863          	beq	a5,a2,ffffffffc02042e0 <schedule+0x4c>
ffffffffc02042d4:	f387a703          	lw	a4,-200(a5)
ffffffffc02042d8:	f3878593          	addi	a1,a5,-200
ffffffffc02042dc:	03070163          	beq	a4,a6,ffffffffc02042fe <schedule+0x6a>
ffffffffc02042e0:	fef697e3          	bne	a3,a5,ffffffffc02042ce <schedule+0x3a>
ffffffffc02042e4:	ed89                	bnez	a1,ffffffffc02042fe <schedule+0x6a>
ffffffffc02042e6:	451c                	lw	a5,8(a0)
ffffffffc02042e8:	2785                	addiw	a5,a5,1
ffffffffc02042ea:	c51c                	sw	a5,8(a0)
ffffffffc02042ec:	00a88463          	beq	a7,a0,ffffffffc02042f4 <schedule+0x60>
ffffffffc02042f0:	c93ff0ef          	jal	ffffffffc0203f82 <proc_run>
ffffffffc02042f4:	e819                	bnez	s0,ffffffffc020430a <schedule+0x76>
ffffffffc02042f6:	60a2                	ld	ra,8(sp)
ffffffffc02042f8:	6402                	ld	s0,0(sp)
ffffffffc02042fa:	0141                	addi	sp,sp,16
ffffffffc02042fc:	8082                	ret
ffffffffc02042fe:	4198                	lw	a4,0(a1)
ffffffffc0204300:	4789                	li	a5,2
ffffffffc0204302:	fef712e3          	bne	a4,a5,ffffffffc02042e6 <schedule+0x52>
ffffffffc0204306:	852e                	mv	a0,a1
ffffffffc0204308:	bff9                	j	ffffffffc02042e6 <schedule+0x52>
ffffffffc020430a:	6402                	ld	s0,0(sp)
ffffffffc020430c:	60a2                	ld	ra,8(sp)
ffffffffc020430e:	0141                	addi	sp,sp,16
ffffffffc0204310:	a9afc06f          	j	ffffffffc02005aa <intr_enable>
ffffffffc0204314:	00011617          	auipc	a2,0x11
ffffffffc0204318:	20c60613          	addi	a2,a2,524 # ffffffffc0215520 <proc_list>
ffffffffc020431c:	86b2                	mv	a3,a2
ffffffffc020431e:	b76d                	j	ffffffffc02042c8 <schedule+0x34>
ffffffffc0204320:	a90fc0ef          	jal	ffffffffc02005b0 <intr_disable>
ffffffffc0204324:	4405                	li	s0,1
ffffffffc0204326:	bfbd                	j	ffffffffc02042a4 <schedule+0x10>

ffffffffc0204328 <hash32>:
ffffffffc0204328:	9e3707b7          	lui	a5,0x9e370
ffffffffc020432c:	2785                	addiw	a5,a5,1 # ffffffff9e370001 <kern_entry-0x21e8ffff>
ffffffffc020432e:	02a787bb          	mulw	a5,a5,a0
ffffffffc0204332:	02000513          	li	a0,32
ffffffffc0204336:	9d0d                	subw	a0,a0,a1
ffffffffc0204338:	00a7d53b          	srlw	a0,a5,a0
ffffffffc020433c:	8082                	ret

ffffffffc020433e <printnum>:
ffffffffc020433e:	02069813          	slli	a6,a3,0x20
ffffffffc0204342:	7179                	addi	sp,sp,-48
ffffffffc0204344:	02085813          	srli	a6,a6,0x20
ffffffffc0204348:	e052                	sd	s4,0(sp)
ffffffffc020434a:	03067a33          	remu	s4,a2,a6
ffffffffc020434e:	f022                	sd	s0,32(sp)
ffffffffc0204350:	ec26                	sd	s1,24(sp)
ffffffffc0204352:	e84a                	sd	s2,16(sp)
ffffffffc0204354:	f406                	sd	ra,40(sp)
ffffffffc0204356:	84aa                	mv	s1,a0
ffffffffc0204358:	892e                	mv	s2,a1
ffffffffc020435a:	fff7041b          	addiw	s0,a4,-1
ffffffffc020435e:	2a01                	sext.w	s4,s4
ffffffffc0204360:	05067063          	bgeu	a2,a6,ffffffffc02043a0 <printnum+0x62>
ffffffffc0204364:	e44e                	sd	s3,8(sp)
ffffffffc0204366:	89be                	mv	s3,a5
ffffffffc0204368:	4785                	li	a5,1
ffffffffc020436a:	00e7d763          	bge	a5,a4,ffffffffc0204378 <printnum+0x3a>
ffffffffc020436e:	85ca                	mv	a1,s2
ffffffffc0204370:	854e                	mv	a0,s3
ffffffffc0204372:	347d                	addiw	s0,s0,-1
ffffffffc0204374:	9482                	jalr	s1
ffffffffc0204376:	fc65                	bnez	s0,ffffffffc020436e <printnum+0x30>
ffffffffc0204378:	69a2                	ld	s3,8(sp)
ffffffffc020437a:	1a02                	slli	s4,s4,0x20
ffffffffc020437c:	020a5a13          	srli	s4,s4,0x20
ffffffffc0204380:	00002797          	auipc	a5,0x2
ffffffffc0204384:	1c078793          	addi	a5,a5,448 # ffffffffc0206540 <etext+0x1d5a>
ffffffffc0204388:	97d2                	add	a5,a5,s4
ffffffffc020438a:	7402                	ld	s0,32(sp)
ffffffffc020438c:	0007c503          	lbu	a0,0(a5)
ffffffffc0204390:	70a2                	ld	ra,40(sp)
ffffffffc0204392:	6a02                	ld	s4,0(sp)
ffffffffc0204394:	85ca                	mv	a1,s2
ffffffffc0204396:	87a6                	mv	a5,s1
ffffffffc0204398:	6942                	ld	s2,16(sp)
ffffffffc020439a:	64e2                	ld	s1,24(sp)
ffffffffc020439c:	6145                	addi	sp,sp,48
ffffffffc020439e:	8782                	jr	a5
ffffffffc02043a0:	03065633          	divu	a2,a2,a6
ffffffffc02043a4:	8722                	mv	a4,s0
ffffffffc02043a6:	f99ff0ef          	jal	ffffffffc020433e <printnum>
ffffffffc02043aa:	bfc1                	j	ffffffffc020437a <printnum+0x3c>

ffffffffc02043ac <vprintfmt>:
ffffffffc02043ac:	7119                	addi	sp,sp,-128
ffffffffc02043ae:	f4a6                	sd	s1,104(sp)
ffffffffc02043b0:	f0ca                	sd	s2,96(sp)
ffffffffc02043b2:	ecce                	sd	s3,88(sp)
ffffffffc02043b4:	e8d2                	sd	s4,80(sp)
ffffffffc02043b6:	e4d6                	sd	s5,72(sp)
ffffffffc02043b8:	e0da                	sd	s6,64(sp)
ffffffffc02043ba:	f862                	sd	s8,48(sp)
ffffffffc02043bc:	fc86                	sd	ra,120(sp)
ffffffffc02043be:	f8a2                	sd	s0,112(sp)
ffffffffc02043c0:	fc5e                	sd	s7,56(sp)
ffffffffc02043c2:	f466                	sd	s9,40(sp)
ffffffffc02043c4:	f06a                	sd	s10,32(sp)
ffffffffc02043c6:	ec6e                	sd	s11,24(sp)
ffffffffc02043c8:	892a                	mv	s2,a0
ffffffffc02043ca:	84ae                	mv	s1,a1
ffffffffc02043cc:	8c32                	mv	s8,a2
ffffffffc02043ce:	8a36                	mv	s4,a3
ffffffffc02043d0:	02500993          	li	s3,37
ffffffffc02043d4:	05500b13          	li	s6,85
ffffffffc02043d8:	00002a97          	auipc	s5,0x2
ffffffffc02043dc:	308a8a93          	addi	s5,s5,776 # ffffffffc02066e0 <default_pmm_manager+0x38>
ffffffffc02043e0:	000c4503          	lbu	a0,0(s8)
ffffffffc02043e4:	001c0413          	addi	s0,s8,1
ffffffffc02043e8:	01350a63          	beq	a0,s3,ffffffffc02043fc <vprintfmt+0x50>
ffffffffc02043ec:	cd0d                	beqz	a0,ffffffffc0204426 <vprintfmt+0x7a>
ffffffffc02043ee:	85a6                	mv	a1,s1
ffffffffc02043f0:	9902                	jalr	s2
ffffffffc02043f2:	00044503          	lbu	a0,0(s0)
ffffffffc02043f6:	0405                	addi	s0,s0,1
ffffffffc02043f8:	ff351ae3          	bne	a0,s3,ffffffffc02043ec <vprintfmt+0x40>
ffffffffc02043fc:	02000d93          	li	s11,32
ffffffffc0204400:	4b81                	li	s7,0
ffffffffc0204402:	4601                	li	a2,0
ffffffffc0204404:	5d7d                	li	s10,-1
ffffffffc0204406:	5cfd                	li	s9,-1
ffffffffc0204408:	00044683          	lbu	a3,0(s0)
ffffffffc020440c:	00140c13          	addi	s8,s0,1
ffffffffc0204410:	fdd6859b          	addiw	a1,a3,-35
ffffffffc0204414:	0ff5f593          	zext.b	a1,a1
ffffffffc0204418:	02bb6663          	bltu	s6,a1,ffffffffc0204444 <vprintfmt+0x98>
ffffffffc020441c:	058a                	slli	a1,a1,0x2
ffffffffc020441e:	95d6                	add	a1,a1,s5
ffffffffc0204420:	4198                	lw	a4,0(a1)
ffffffffc0204422:	9756                	add	a4,a4,s5
ffffffffc0204424:	8702                	jr	a4
ffffffffc0204426:	70e6                	ld	ra,120(sp)
ffffffffc0204428:	7446                	ld	s0,112(sp)
ffffffffc020442a:	74a6                	ld	s1,104(sp)
ffffffffc020442c:	7906                	ld	s2,96(sp)
ffffffffc020442e:	69e6                	ld	s3,88(sp)
ffffffffc0204430:	6a46                	ld	s4,80(sp)
ffffffffc0204432:	6aa6                	ld	s5,72(sp)
ffffffffc0204434:	6b06                	ld	s6,64(sp)
ffffffffc0204436:	7be2                	ld	s7,56(sp)
ffffffffc0204438:	7c42                	ld	s8,48(sp)
ffffffffc020443a:	7ca2                	ld	s9,40(sp)
ffffffffc020443c:	7d02                	ld	s10,32(sp)
ffffffffc020443e:	6de2                	ld	s11,24(sp)
ffffffffc0204440:	6109                	addi	sp,sp,128
ffffffffc0204442:	8082                	ret
ffffffffc0204444:	85a6                	mv	a1,s1
ffffffffc0204446:	02500513          	li	a0,37
ffffffffc020444a:	9902                	jalr	s2
ffffffffc020444c:	fff44703          	lbu	a4,-1(s0)
ffffffffc0204450:	02500793          	li	a5,37
ffffffffc0204454:	8c22                	mv	s8,s0
ffffffffc0204456:	f8f705e3          	beq	a4,a5,ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc020445a:	02500713          	li	a4,37
ffffffffc020445e:	ffec4783          	lbu	a5,-2(s8)
ffffffffc0204462:	1c7d                	addi	s8,s8,-1
ffffffffc0204464:	fee79de3          	bne	a5,a4,ffffffffc020445e <vprintfmt+0xb2>
ffffffffc0204468:	bfa5                	j	ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc020446a:	00144783          	lbu	a5,1(s0)
ffffffffc020446e:	4725                	li	a4,9
ffffffffc0204470:	fd068d1b          	addiw	s10,a3,-48
ffffffffc0204474:	fd07859b          	addiw	a1,a5,-48
ffffffffc0204478:	0007869b          	sext.w	a3,a5
ffffffffc020447c:	8462                	mv	s0,s8
ffffffffc020447e:	02b76563          	bltu	a4,a1,ffffffffc02044a8 <vprintfmt+0xfc>
ffffffffc0204482:	4525                	li	a0,9
ffffffffc0204484:	00144783          	lbu	a5,1(s0)
ffffffffc0204488:	002d171b          	slliw	a4,s10,0x2
ffffffffc020448c:	01a7073b          	addw	a4,a4,s10
ffffffffc0204490:	0017171b          	slliw	a4,a4,0x1
ffffffffc0204494:	9f35                	addw	a4,a4,a3
ffffffffc0204496:	fd07859b          	addiw	a1,a5,-48
ffffffffc020449a:	0405                	addi	s0,s0,1
ffffffffc020449c:	fd070d1b          	addiw	s10,a4,-48
ffffffffc02044a0:	0007869b          	sext.w	a3,a5
ffffffffc02044a4:	feb570e3          	bgeu	a0,a1,ffffffffc0204484 <vprintfmt+0xd8>
ffffffffc02044a8:	f60cd0e3          	bgez	s9,ffffffffc0204408 <vprintfmt+0x5c>
ffffffffc02044ac:	8cea                	mv	s9,s10
ffffffffc02044ae:	5d7d                	li	s10,-1
ffffffffc02044b0:	bfa1                	j	ffffffffc0204408 <vprintfmt+0x5c>
ffffffffc02044b2:	8db6                	mv	s11,a3
ffffffffc02044b4:	8462                	mv	s0,s8
ffffffffc02044b6:	bf89                	j	ffffffffc0204408 <vprintfmt+0x5c>
ffffffffc02044b8:	8462                	mv	s0,s8
ffffffffc02044ba:	4b85                	li	s7,1
ffffffffc02044bc:	b7b1                	j	ffffffffc0204408 <vprintfmt+0x5c>
ffffffffc02044be:	4785                	li	a5,1
ffffffffc02044c0:	008a0713          	addi	a4,s4,8
ffffffffc02044c4:	00c7c463          	blt	a5,a2,ffffffffc02044cc <vprintfmt+0x120>
ffffffffc02044c8:	1a060163          	beqz	a2,ffffffffc020466a <vprintfmt+0x2be>
ffffffffc02044cc:	000a3603          	ld	a2,0(s4)
ffffffffc02044d0:	46c1                	li	a3,16
ffffffffc02044d2:	8a3a                	mv	s4,a4
ffffffffc02044d4:	000d879b          	sext.w	a5,s11
ffffffffc02044d8:	8766                	mv	a4,s9
ffffffffc02044da:	85a6                	mv	a1,s1
ffffffffc02044dc:	854a                	mv	a0,s2
ffffffffc02044de:	e61ff0ef          	jal	ffffffffc020433e <printnum>
ffffffffc02044e2:	bdfd                	j	ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc02044e4:	000a2503          	lw	a0,0(s4)
ffffffffc02044e8:	85a6                	mv	a1,s1
ffffffffc02044ea:	0a21                	addi	s4,s4,8
ffffffffc02044ec:	9902                	jalr	s2
ffffffffc02044ee:	bdcd                	j	ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc02044f0:	4785                	li	a5,1
ffffffffc02044f2:	008a0713          	addi	a4,s4,8
ffffffffc02044f6:	00c7c463          	blt	a5,a2,ffffffffc02044fe <vprintfmt+0x152>
ffffffffc02044fa:	16060363          	beqz	a2,ffffffffc0204660 <vprintfmt+0x2b4>
ffffffffc02044fe:	000a3603          	ld	a2,0(s4)
ffffffffc0204502:	46a9                	li	a3,10
ffffffffc0204504:	8a3a                	mv	s4,a4
ffffffffc0204506:	b7f9                	j	ffffffffc02044d4 <vprintfmt+0x128>
ffffffffc0204508:	85a6                	mv	a1,s1
ffffffffc020450a:	03000513          	li	a0,48
ffffffffc020450e:	9902                	jalr	s2
ffffffffc0204510:	85a6                	mv	a1,s1
ffffffffc0204512:	07800513          	li	a0,120
ffffffffc0204516:	9902                	jalr	s2
ffffffffc0204518:	000a3603          	ld	a2,0(s4)
ffffffffc020451c:	46c1                	li	a3,16
ffffffffc020451e:	0a21                	addi	s4,s4,8
ffffffffc0204520:	bf55                	j	ffffffffc02044d4 <vprintfmt+0x128>
ffffffffc0204522:	85a6                	mv	a1,s1
ffffffffc0204524:	02500513          	li	a0,37
ffffffffc0204528:	9902                	jalr	s2
ffffffffc020452a:	bd5d                	j	ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc020452c:	000a2d03          	lw	s10,0(s4)
ffffffffc0204530:	8462                	mv	s0,s8
ffffffffc0204532:	0a21                	addi	s4,s4,8
ffffffffc0204534:	bf95                	j	ffffffffc02044a8 <vprintfmt+0xfc>
ffffffffc0204536:	4785                	li	a5,1
ffffffffc0204538:	008a0713          	addi	a4,s4,8
ffffffffc020453c:	00c7c463          	blt	a5,a2,ffffffffc0204544 <vprintfmt+0x198>
ffffffffc0204540:	10060b63          	beqz	a2,ffffffffc0204656 <vprintfmt+0x2aa>
ffffffffc0204544:	000a3603          	ld	a2,0(s4)
ffffffffc0204548:	46a1                	li	a3,8
ffffffffc020454a:	8a3a                	mv	s4,a4
ffffffffc020454c:	b761                	j	ffffffffc02044d4 <vprintfmt+0x128>
ffffffffc020454e:	fffcc793          	not	a5,s9
ffffffffc0204552:	97fd                	srai	a5,a5,0x3f
ffffffffc0204554:	00fcf7b3          	and	a5,s9,a5
ffffffffc0204558:	00078c9b          	sext.w	s9,a5
ffffffffc020455c:	8462                	mv	s0,s8
ffffffffc020455e:	b56d                	j	ffffffffc0204408 <vprintfmt+0x5c>
ffffffffc0204560:	000a3403          	ld	s0,0(s4)
ffffffffc0204564:	008a0793          	addi	a5,s4,8
ffffffffc0204568:	e43e                	sd	a5,8(sp)
ffffffffc020456a:	12040063          	beqz	s0,ffffffffc020468a <vprintfmt+0x2de>
ffffffffc020456e:	0d905963          	blez	s9,ffffffffc0204640 <vprintfmt+0x294>
ffffffffc0204572:	02d00793          	li	a5,45
ffffffffc0204576:	00140a13          	addi	s4,s0,1
ffffffffc020457a:	12fd9763          	bne	s11,a5,ffffffffc02046a8 <vprintfmt+0x2fc>
ffffffffc020457e:	00044783          	lbu	a5,0(s0)
ffffffffc0204582:	0007851b          	sext.w	a0,a5
ffffffffc0204586:	cb9d                	beqz	a5,ffffffffc02045bc <vprintfmt+0x210>
ffffffffc0204588:	547d                	li	s0,-1
ffffffffc020458a:	05e00d93          	li	s11,94
ffffffffc020458e:	000d4563          	bltz	s10,ffffffffc0204598 <vprintfmt+0x1ec>
ffffffffc0204592:	3d7d                	addiw	s10,s10,-1
ffffffffc0204594:	028d0263          	beq	s10,s0,ffffffffc02045b8 <vprintfmt+0x20c>
ffffffffc0204598:	85a6                	mv	a1,s1
ffffffffc020459a:	0c0b8d63          	beqz	s7,ffffffffc0204674 <vprintfmt+0x2c8>
ffffffffc020459e:	3781                	addiw	a5,a5,-32
ffffffffc02045a0:	0cfdfa63          	bgeu	s11,a5,ffffffffc0204674 <vprintfmt+0x2c8>
ffffffffc02045a4:	03f00513          	li	a0,63
ffffffffc02045a8:	9902                	jalr	s2
ffffffffc02045aa:	000a4783          	lbu	a5,0(s4)
ffffffffc02045ae:	3cfd                	addiw	s9,s9,-1
ffffffffc02045b0:	0a05                	addi	s4,s4,1
ffffffffc02045b2:	0007851b          	sext.w	a0,a5
ffffffffc02045b6:	ffe1                	bnez	a5,ffffffffc020458e <vprintfmt+0x1e2>
ffffffffc02045b8:	01905963          	blez	s9,ffffffffc02045ca <vprintfmt+0x21e>
ffffffffc02045bc:	85a6                	mv	a1,s1
ffffffffc02045be:	02000513          	li	a0,32
ffffffffc02045c2:	3cfd                	addiw	s9,s9,-1
ffffffffc02045c4:	9902                	jalr	s2
ffffffffc02045c6:	fe0c9be3          	bnez	s9,ffffffffc02045bc <vprintfmt+0x210>
ffffffffc02045ca:	6a22                	ld	s4,8(sp)
ffffffffc02045cc:	bd11                	j	ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc02045ce:	4785                	li	a5,1
ffffffffc02045d0:	008a0b93          	addi	s7,s4,8
ffffffffc02045d4:	00c7c363          	blt	a5,a2,ffffffffc02045da <vprintfmt+0x22e>
ffffffffc02045d8:	ce25                	beqz	a2,ffffffffc0204650 <vprintfmt+0x2a4>
ffffffffc02045da:	000a3403          	ld	s0,0(s4)
ffffffffc02045de:	08044d63          	bltz	s0,ffffffffc0204678 <vprintfmt+0x2cc>
ffffffffc02045e2:	8622                	mv	a2,s0
ffffffffc02045e4:	8a5e                	mv	s4,s7
ffffffffc02045e6:	46a9                	li	a3,10
ffffffffc02045e8:	b5f5                	j	ffffffffc02044d4 <vprintfmt+0x128>
ffffffffc02045ea:	000a2783          	lw	a5,0(s4)
ffffffffc02045ee:	4619                	li	a2,6
ffffffffc02045f0:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc02045f4:	8fb9                	xor	a5,a5,a4
ffffffffc02045f6:	40e786bb          	subw	a3,a5,a4
ffffffffc02045fa:	02d64663          	blt	a2,a3,ffffffffc0204626 <vprintfmt+0x27a>
ffffffffc02045fe:	00369713          	slli	a4,a3,0x3
ffffffffc0204602:	00002797          	auipc	a5,0x2
ffffffffc0204606:	23678793          	addi	a5,a5,566 # ffffffffc0206838 <error_string>
ffffffffc020460a:	97ba                	add	a5,a5,a4
ffffffffc020460c:	639c                	ld	a5,0(a5)
ffffffffc020460e:	cf81                	beqz	a5,ffffffffc0204626 <vprintfmt+0x27a>
ffffffffc0204610:	86be                	mv	a3,a5
ffffffffc0204612:	00000617          	auipc	a2,0x0
ffffffffc0204616:	1fe60613          	addi	a2,a2,510 # ffffffffc0204810 <etext+0x2a>
ffffffffc020461a:	85a6                	mv	a1,s1
ffffffffc020461c:	854a                	mv	a0,s2
ffffffffc020461e:	0e8000ef          	jal	ffffffffc0204706 <printfmt>
ffffffffc0204622:	0a21                	addi	s4,s4,8
ffffffffc0204624:	bb75                	j	ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc0204626:	00002617          	auipc	a2,0x2
ffffffffc020462a:	f3a60613          	addi	a2,a2,-198 # ffffffffc0206560 <etext+0x1d7a>
ffffffffc020462e:	85a6                	mv	a1,s1
ffffffffc0204630:	854a                	mv	a0,s2
ffffffffc0204632:	0d4000ef          	jal	ffffffffc0204706 <printfmt>
ffffffffc0204636:	0a21                	addi	s4,s4,8
ffffffffc0204638:	b365                	j	ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc020463a:	2605                	addiw	a2,a2,1
ffffffffc020463c:	8462                	mv	s0,s8
ffffffffc020463e:	b3e9                	j	ffffffffc0204408 <vprintfmt+0x5c>
ffffffffc0204640:	00044783          	lbu	a5,0(s0)
ffffffffc0204644:	0007851b          	sext.w	a0,a5
ffffffffc0204648:	d3c9                	beqz	a5,ffffffffc02045ca <vprintfmt+0x21e>
ffffffffc020464a:	00140a13          	addi	s4,s0,1
ffffffffc020464e:	bf2d                	j	ffffffffc0204588 <vprintfmt+0x1dc>
ffffffffc0204650:	000a2403          	lw	s0,0(s4)
ffffffffc0204654:	b769                	j	ffffffffc02045de <vprintfmt+0x232>
ffffffffc0204656:	000a6603          	lwu	a2,0(s4)
ffffffffc020465a:	46a1                	li	a3,8
ffffffffc020465c:	8a3a                	mv	s4,a4
ffffffffc020465e:	bd9d                	j	ffffffffc02044d4 <vprintfmt+0x128>
ffffffffc0204660:	000a6603          	lwu	a2,0(s4)
ffffffffc0204664:	46a9                	li	a3,10
ffffffffc0204666:	8a3a                	mv	s4,a4
ffffffffc0204668:	b5b5                	j	ffffffffc02044d4 <vprintfmt+0x128>
ffffffffc020466a:	000a6603          	lwu	a2,0(s4)
ffffffffc020466e:	46c1                	li	a3,16
ffffffffc0204670:	8a3a                	mv	s4,a4
ffffffffc0204672:	b58d                	j	ffffffffc02044d4 <vprintfmt+0x128>
ffffffffc0204674:	9902                	jalr	s2
ffffffffc0204676:	bf15                	j	ffffffffc02045aa <vprintfmt+0x1fe>
ffffffffc0204678:	85a6                	mv	a1,s1
ffffffffc020467a:	02d00513          	li	a0,45
ffffffffc020467e:	9902                	jalr	s2
ffffffffc0204680:	40800633          	neg	a2,s0
ffffffffc0204684:	8a5e                	mv	s4,s7
ffffffffc0204686:	46a9                	li	a3,10
ffffffffc0204688:	b5b1                	j	ffffffffc02044d4 <vprintfmt+0x128>
ffffffffc020468a:	01905663          	blez	s9,ffffffffc0204696 <vprintfmt+0x2ea>
ffffffffc020468e:	02d00793          	li	a5,45
ffffffffc0204692:	04fd9263          	bne	s11,a5,ffffffffc02046d6 <vprintfmt+0x32a>
ffffffffc0204696:	02800793          	li	a5,40
ffffffffc020469a:	00002a17          	auipc	s4,0x2
ffffffffc020469e:	ebfa0a13          	addi	s4,s4,-321 # ffffffffc0206559 <etext+0x1d73>
ffffffffc02046a2:	02800513          	li	a0,40
ffffffffc02046a6:	b5cd                	j	ffffffffc0204588 <vprintfmt+0x1dc>
ffffffffc02046a8:	85ea                	mv	a1,s10
ffffffffc02046aa:	8522                	mv	a0,s0
ffffffffc02046ac:	094000ef          	jal	ffffffffc0204740 <strnlen>
ffffffffc02046b0:	40ac8cbb          	subw	s9,s9,a0
ffffffffc02046b4:	01905963          	blez	s9,ffffffffc02046c6 <vprintfmt+0x31a>
ffffffffc02046b8:	2d81                	sext.w	s11,s11
ffffffffc02046ba:	85a6                	mv	a1,s1
ffffffffc02046bc:	856e                	mv	a0,s11
ffffffffc02046be:	3cfd                	addiw	s9,s9,-1
ffffffffc02046c0:	9902                	jalr	s2
ffffffffc02046c2:	fe0c9ce3          	bnez	s9,ffffffffc02046ba <vprintfmt+0x30e>
ffffffffc02046c6:	00044783          	lbu	a5,0(s0)
ffffffffc02046ca:	0007851b          	sext.w	a0,a5
ffffffffc02046ce:	ea079de3          	bnez	a5,ffffffffc0204588 <vprintfmt+0x1dc>
ffffffffc02046d2:	6a22                	ld	s4,8(sp)
ffffffffc02046d4:	b331                	j	ffffffffc02043e0 <vprintfmt+0x34>
ffffffffc02046d6:	85ea                	mv	a1,s10
ffffffffc02046d8:	00002517          	auipc	a0,0x2
ffffffffc02046dc:	e8050513          	addi	a0,a0,-384 # ffffffffc0206558 <etext+0x1d72>
ffffffffc02046e0:	060000ef          	jal	ffffffffc0204740 <strnlen>
ffffffffc02046e4:	40ac8cbb          	subw	s9,s9,a0
ffffffffc02046e8:	00002417          	auipc	s0,0x2
ffffffffc02046ec:	e7040413          	addi	s0,s0,-400 # ffffffffc0206558 <etext+0x1d72>
ffffffffc02046f0:	00002a17          	auipc	s4,0x2
ffffffffc02046f4:	e69a0a13          	addi	s4,s4,-407 # ffffffffc0206559 <etext+0x1d73>
ffffffffc02046f8:	02800793          	li	a5,40
ffffffffc02046fc:	02800513          	li	a0,40
ffffffffc0204700:	fb904ce3          	bgtz	s9,ffffffffc02046b8 <vprintfmt+0x30c>
ffffffffc0204704:	b551                	j	ffffffffc0204588 <vprintfmt+0x1dc>

ffffffffc0204706 <printfmt>:
ffffffffc0204706:	715d                	addi	sp,sp,-80
ffffffffc0204708:	02810313          	addi	t1,sp,40
ffffffffc020470c:	f436                	sd	a3,40(sp)
ffffffffc020470e:	869a                	mv	a3,t1
ffffffffc0204710:	ec06                	sd	ra,24(sp)
ffffffffc0204712:	f83a                	sd	a4,48(sp)
ffffffffc0204714:	fc3e                	sd	a5,56(sp)
ffffffffc0204716:	e0c2                	sd	a6,64(sp)
ffffffffc0204718:	e4c6                	sd	a7,72(sp)
ffffffffc020471a:	e41a                	sd	t1,8(sp)
ffffffffc020471c:	c91ff0ef          	jal	ffffffffc02043ac <vprintfmt>
ffffffffc0204720:	60e2                	ld	ra,24(sp)
ffffffffc0204722:	6161                	addi	sp,sp,80
ffffffffc0204724:	8082                	ret

ffffffffc0204726 <strlen>:
ffffffffc0204726:	00054783          	lbu	a5,0(a0)
ffffffffc020472a:	872a                	mv	a4,a0
ffffffffc020472c:	4501                	li	a0,0
ffffffffc020472e:	cb81                	beqz	a5,ffffffffc020473e <strlen+0x18>
ffffffffc0204730:	0505                	addi	a0,a0,1
ffffffffc0204732:	00a707b3          	add	a5,a4,a0
ffffffffc0204736:	0007c783          	lbu	a5,0(a5)
ffffffffc020473a:	fbfd                	bnez	a5,ffffffffc0204730 <strlen+0xa>
ffffffffc020473c:	8082                	ret
ffffffffc020473e:	8082                	ret

ffffffffc0204740 <strnlen>:
ffffffffc0204740:	4781                	li	a5,0
ffffffffc0204742:	e589                	bnez	a1,ffffffffc020474c <strnlen+0xc>
ffffffffc0204744:	a811                	j	ffffffffc0204758 <strnlen+0x18>
ffffffffc0204746:	0785                	addi	a5,a5,1
ffffffffc0204748:	00f58863          	beq	a1,a5,ffffffffc0204758 <strnlen+0x18>
ffffffffc020474c:	00f50733          	add	a4,a0,a5
ffffffffc0204750:	00074703          	lbu	a4,0(a4)
ffffffffc0204754:	fb6d                	bnez	a4,ffffffffc0204746 <strnlen+0x6>
ffffffffc0204756:	85be                	mv	a1,a5
ffffffffc0204758:	852e                	mv	a0,a1
ffffffffc020475a:	8082                	ret

ffffffffc020475c <strcpy>:
ffffffffc020475c:	87aa                	mv	a5,a0
ffffffffc020475e:	0005c703          	lbu	a4,0(a1)
ffffffffc0204762:	0785                	addi	a5,a5,1
ffffffffc0204764:	0585                	addi	a1,a1,1
ffffffffc0204766:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020476a:	fb75                	bnez	a4,ffffffffc020475e <strcpy+0x2>
ffffffffc020476c:	8082                	ret

ffffffffc020476e <strcmp>:
ffffffffc020476e:	00054783          	lbu	a5,0(a0)
ffffffffc0204772:	e791                	bnez	a5,ffffffffc020477e <strcmp+0x10>
ffffffffc0204774:	a02d                	j	ffffffffc020479e <strcmp+0x30>
ffffffffc0204776:	00054783          	lbu	a5,0(a0)
ffffffffc020477a:	cf89                	beqz	a5,ffffffffc0204794 <strcmp+0x26>
ffffffffc020477c:	85b6                	mv	a1,a3
ffffffffc020477e:	0005c703          	lbu	a4,0(a1)
ffffffffc0204782:	0505                	addi	a0,a0,1
ffffffffc0204784:	00158693          	addi	a3,a1,1
ffffffffc0204788:	fef707e3          	beq	a4,a5,ffffffffc0204776 <strcmp+0x8>
ffffffffc020478c:	0007851b          	sext.w	a0,a5
ffffffffc0204790:	9d19                	subw	a0,a0,a4
ffffffffc0204792:	8082                	ret
ffffffffc0204794:	0015c703          	lbu	a4,1(a1)
ffffffffc0204798:	4501                	li	a0,0
ffffffffc020479a:	9d19                	subw	a0,a0,a4
ffffffffc020479c:	8082                	ret
ffffffffc020479e:	0005c703          	lbu	a4,0(a1)
ffffffffc02047a2:	4501                	li	a0,0
ffffffffc02047a4:	b7f5                	j	ffffffffc0204790 <strcmp+0x22>

ffffffffc02047a6 <strchr>:
ffffffffc02047a6:	00054783          	lbu	a5,0(a0)
ffffffffc02047aa:	c799                	beqz	a5,ffffffffc02047b8 <strchr+0x12>
ffffffffc02047ac:	00f58763          	beq	a1,a5,ffffffffc02047ba <strchr+0x14>
ffffffffc02047b0:	00154783          	lbu	a5,1(a0)
ffffffffc02047b4:	0505                	addi	a0,a0,1
ffffffffc02047b6:	fbfd                	bnez	a5,ffffffffc02047ac <strchr+0x6>
ffffffffc02047b8:	4501                	li	a0,0
ffffffffc02047ba:	8082                	ret

ffffffffc02047bc <memset>:
ffffffffc02047bc:	ca01                	beqz	a2,ffffffffc02047cc <memset+0x10>
ffffffffc02047be:	962a                	add	a2,a2,a0
ffffffffc02047c0:	87aa                	mv	a5,a0
ffffffffc02047c2:	0785                	addi	a5,a5,1
ffffffffc02047c4:	feb78fa3          	sb	a1,-1(a5)
ffffffffc02047c8:	fef61de3          	bne	a2,a5,ffffffffc02047c2 <memset+0x6>
ffffffffc02047cc:	8082                	ret

ffffffffc02047ce <memcpy>:
ffffffffc02047ce:	ca19                	beqz	a2,ffffffffc02047e4 <memcpy+0x16>
ffffffffc02047d0:	962e                	add	a2,a2,a1
ffffffffc02047d2:	87aa                	mv	a5,a0
ffffffffc02047d4:	0005c703          	lbu	a4,0(a1)
ffffffffc02047d8:	0585                	addi	a1,a1,1
ffffffffc02047da:	0785                	addi	a5,a5,1
ffffffffc02047dc:	fee78fa3          	sb	a4,-1(a5)
ffffffffc02047e0:	feb61ae3          	bne	a2,a1,ffffffffc02047d4 <memcpy+0x6>
ffffffffc02047e4:	8082                	ret
