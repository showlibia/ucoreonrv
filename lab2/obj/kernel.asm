
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c02052b7          	lui	t0,0xc0205
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c0205137          	lui	sp,0xc0205
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	00006517          	auipc	a0,0x6
ffffffffc0200036:	fde50513          	addi	a0,a0,-34 # ffffffffc0206010 <free_area>
ffffffffc020003a:	00006617          	auipc	a2,0x6
ffffffffc020003e:	43660613          	addi	a2,a2,1078 # ffffffffc0206470 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	1ad010ef          	jal	ra,ffffffffc02019f6 <memset>
ffffffffc020004e:	3fc000ef          	jal	ra,ffffffffc020044a <cons_init>
ffffffffc0200052:	00002517          	auipc	a0,0x2
ffffffffc0200056:	9b650513          	addi	a0,a0,-1610 # ffffffffc0201a08 <etext>
ffffffffc020005a:	090000ef          	jal	ra,ffffffffc02000ea <cputs>
ffffffffc020005e:	0dc000ef          	jal	ra,ffffffffc020013a <print_kerninfo>
ffffffffc0200062:	402000ef          	jal	ra,ffffffffc0200464 <idt_init>
ffffffffc0200066:	2ba010ef          	jal	ra,ffffffffc0201320 <pmm_init>
ffffffffc020006a:	3fa000ef          	jal	ra,ffffffffc0200464 <idt_init>
ffffffffc020006e:	39a000ef          	jal	ra,ffffffffc0200408 <clock_init>
ffffffffc0200072:	3e6000ef          	jal	ra,ffffffffc0200458 <intr_enable>
ffffffffc0200076:	a001                	j	ffffffffc0200076 <kern_init+0x44>

ffffffffc0200078 <cputch>:
ffffffffc0200078:	1141                	addi	sp,sp,-16
ffffffffc020007a:	e022                	sd	s0,0(sp)
ffffffffc020007c:	e406                	sd	ra,8(sp)
ffffffffc020007e:	842e                	mv	s0,a1
ffffffffc0200080:	3cc000ef          	jal	ra,ffffffffc020044c <cons_putc>
ffffffffc0200084:	401c                	lw	a5,0(s0)
ffffffffc0200086:	60a2                	ld	ra,8(sp)
ffffffffc0200088:	2785                	addiw	a5,a5,1
ffffffffc020008a:	c01c                	sw	a5,0(s0)
ffffffffc020008c:	6402                	ld	s0,0(sp)
ffffffffc020008e:	0141                	addi	sp,sp,16
ffffffffc0200090:	8082                	ret

ffffffffc0200092 <vcprintf>:
ffffffffc0200092:	1101                	addi	sp,sp,-32
ffffffffc0200094:	862a                	mv	a2,a0
ffffffffc0200096:	86ae                	mv	a3,a1
ffffffffc0200098:	00000517          	auipc	a0,0x0
ffffffffc020009c:	fe050513          	addi	a0,a0,-32 # ffffffffc0200078 <cputch>
ffffffffc02000a0:	006c                	addi	a1,sp,12
ffffffffc02000a2:	ec06                	sd	ra,24(sp)
ffffffffc02000a4:	c602                	sw	zero,12(sp)
ffffffffc02000a6:	47a010ef          	jal	ra,ffffffffc0201520 <vprintfmt>
ffffffffc02000aa:	60e2                	ld	ra,24(sp)
ffffffffc02000ac:	4532                	lw	a0,12(sp)
ffffffffc02000ae:	6105                	addi	sp,sp,32
ffffffffc02000b0:	8082                	ret

ffffffffc02000b2 <cprintf>:
ffffffffc02000b2:	711d                	addi	sp,sp,-96
ffffffffc02000b4:	02810313          	addi	t1,sp,40 # ffffffffc0205028 <boot_page_table_sv39+0x28>
ffffffffc02000b8:	8e2a                	mv	t3,a0
ffffffffc02000ba:	f42e                	sd	a1,40(sp)
ffffffffc02000bc:	f832                	sd	a2,48(sp)
ffffffffc02000be:	fc36                	sd	a3,56(sp)
ffffffffc02000c0:	00000517          	auipc	a0,0x0
ffffffffc02000c4:	fb850513          	addi	a0,a0,-72 # ffffffffc0200078 <cputch>
ffffffffc02000c8:	004c                	addi	a1,sp,4
ffffffffc02000ca:	869a                	mv	a3,t1
ffffffffc02000cc:	8672                	mv	a2,t3
ffffffffc02000ce:	ec06                	sd	ra,24(sp)
ffffffffc02000d0:	e0ba                	sd	a4,64(sp)
ffffffffc02000d2:	e4be                	sd	a5,72(sp)
ffffffffc02000d4:	e8c2                	sd	a6,80(sp)
ffffffffc02000d6:	ecc6                	sd	a7,88(sp)
ffffffffc02000d8:	e41a                	sd	t1,8(sp)
ffffffffc02000da:	c202                	sw	zero,4(sp)
ffffffffc02000dc:	444010ef          	jal	ra,ffffffffc0201520 <vprintfmt>
ffffffffc02000e0:	60e2                	ld	ra,24(sp)
ffffffffc02000e2:	4512                	lw	a0,4(sp)
ffffffffc02000e4:	6125                	addi	sp,sp,96
ffffffffc02000e6:	8082                	ret

ffffffffc02000e8 <cputchar>:
ffffffffc02000e8:	a695                	j	ffffffffc020044c <cons_putc>

ffffffffc02000ea <cputs>:
ffffffffc02000ea:	1101                	addi	sp,sp,-32
ffffffffc02000ec:	e822                	sd	s0,16(sp)
ffffffffc02000ee:	ec06                	sd	ra,24(sp)
ffffffffc02000f0:	e426                	sd	s1,8(sp)
ffffffffc02000f2:	842a                	mv	s0,a0
ffffffffc02000f4:	00054503          	lbu	a0,0(a0)
ffffffffc02000f8:	c51d                	beqz	a0,ffffffffc0200126 <cputs+0x3c>
ffffffffc02000fa:	0405                	addi	s0,s0,1
ffffffffc02000fc:	4485                	li	s1,1
ffffffffc02000fe:	9c81                	subw	s1,s1,s0
ffffffffc0200100:	34c000ef          	jal	ra,ffffffffc020044c <cons_putc>
ffffffffc0200104:	00044503          	lbu	a0,0(s0)
ffffffffc0200108:	008487bb          	addw	a5,s1,s0
ffffffffc020010c:	0405                	addi	s0,s0,1
ffffffffc020010e:	f96d                	bnez	a0,ffffffffc0200100 <cputs+0x16>
ffffffffc0200110:	0017841b          	addiw	s0,a5,1
ffffffffc0200114:	4529                	li	a0,10
ffffffffc0200116:	336000ef          	jal	ra,ffffffffc020044c <cons_putc>
ffffffffc020011a:	60e2                	ld	ra,24(sp)
ffffffffc020011c:	8522                	mv	a0,s0
ffffffffc020011e:	6442                	ld	s0,16(sp)
ffffffffc0200120:	64a2                	ld	s1,8(sp)
ffffffffc0200122:	6105                	addi	sp,sp,32
ffffffffc0200124:	8082                	ret
ffffffffc0200126:	4405                	li	s0,1
ffffffffc0200128:	b7f5                	j	ffffffffc0200114 <cputs+0x2a>

ffffffffc020012a <getchar>:
ffffffffc020012a:	1141                	addi	sp,sp,-16
ffffffffc020012c:	e406                	sd	ra,8(sp)
ffffffffc020012e:	326000ef          	jal	ra,ffffffffc0200454 <cons_getc>
ffffffffc0200132:	dd75                	beqz	a0,ffffffffc020012e <getchar+0x4>
ffffffffc0200134:	60a2                	ld	ra,8(sp)
ffffffffc0200136:	0141                	addi	sp,sp,16
ffffffffc0200138:	8082                	ret

ffffffffc020013a <print_kerninfo>:
ffffffffc020013a:	1141                	addi	sp,sp,-16
ffffffffc020013c:	00002517          	auipc	a0,0x2
ffffffffc0200140:	8ec50513          	addi	a0,a0,-1812 # ffffffffc0201a28 <etext+0x20>
ffffffffc0200144:	e406                	sd	ra,8(sp)
ffffffffc0200146:	f6dff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020014a:	00000597          	auipc	a1,0x0
ffffffffc020014e:	ee858593          	addi	a1,a1,-280 # ffffffffc0200032 <kern_init>
ffffffffc0200152:	00002517          	auipc	a0,0x2
ffffffffc0200156:	8f650513          	addi	a0,a0,-1802 # ffffffffc0201a48 <etext+0x40>
ffffffffc020015a:	f59ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020015e:	00002597          	auipc	a1,0x2
ffffffffc0200162:	8aa58593          	addi	a1,a1,-1878 # ffffffffc0201a08 <etext>
ffffffffc0200166:	00002517          	auipc	a0,0x2
ffffffffc020016a:	90250513          	addi	a0,a0,-1790 # ffffffffc0201a68 <etext+0x60>
ffffffffc020016e:	f45ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200172:	00006597          	auipc	a1,0x6
ffffffffc0200176:	e9e58593          	addi	a1,a1,-354 # ffffffffc0206010 <free_area>
ffffffffc020017a:	00002517          	auipc	a0,0x2
ffffffffc020017e:	90e50513          	addi	a0,a0,-1778 # ffffffffc0201a88 <etext+0x80>
ffffffffc0200182:	f31ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200186:	00006597          	auipc	a1,0x6
ffffffffc020018a:	2ea58593          	addi	a1,a1,746 # ffffffffc0206470 <end>
ffffffffc020018e:	00002517          	auipc	a0,0x2
ffffffffc0200192:	91a50513          	addi	a0,a0,-1766 # ffffffffc0201aa8 <etext+0xa0>
ffffffffc0200196:	f1dff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020019a:	00006597          	auipc	a1,0x6
ffffffffc020019e:	6d558593          	addi	a1,a1,1749 # ffffffffc020686f <end+0x3ff>
ffffffffc02001a2:	00000797          	auipc	a5,0x0
ffffffffc02001a6:	e9078793          	addi	a5,a5,-368 # ffffffffc0200032 <kern_init>
ffffffffc02001aa:	40f587b3          	sub	a5,a1,a5
ffffffffc02001ae:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02001b2:	60a2                	ld	ra,8(sp)
ffffffffc02001b4:	3ff5f593          	andi	a1,a1,1023
ffffffffc02001b8:	95be                	add	a1,a1,a5
ffffffffc02001ba:	85a9                	srai	a1,a1,0xa
ffffffffc02001bc:	00002517          	auipc	a0,0x2
ffffffffc02001c0:	90c50513          	addi	a0,a0,-1780 # ffffffffc0201ac8 <etext+0xc0>
ffffffffc02001c4:	0141                	addi	sp,sp,16
ffffffffc02001c6:	b5f5                	j	ffffffffc02000b2 <cprintf>

ffffffffc02001c8 <print_stackframe>:
ffffffffc02001c8:	1141                	addi	sp,sp,-16
ffffffffc02001ca:	00002617          	auipc	a2,0x2
ffffffffc02001ce:	92e60613          	addi	a2,a2,-1746 # ffffffffc0201af8 <etext+0xf0>
ffffffffc02001d2:	05b00593          	li	a1,91
ffffffffc02001d6:	00002517          	auipc	a0,0x2
ffffffffc02001da:	93a50513          	addi	a0,a0,-1734 # ffffffffc0201b10 <etext+0x108>
ffffffffc02001de:	e406                	sd	ra,8(sp)
ffffffffc02001e0:	1cc000ef          	jal	ra,ffffffffc02003ac <__panic>

ffffffffc02001e4 <mon_help>:
ffffffffc02001e4:	1141                	addi	sp,sp,-16
ffffffffc02001e6:	00002617          	auipc	a2,0x2
ffffffffc02001ea:	94260613          	addi	a2,a2,-1726 # ffffffffc0201b28 <etext+0x120>
ffffffffc02001ee:	00002597          	auipc	a1,0x2
ffffffffc02001f2:	95a58593          	addi	a1,a1,-1702 # ffffffffc0201b48 <etext+0x140>
ffffffffc02001f6:	00002517          	auipc	a0,0x2
ffffffffc02001fa:	95a50513          	addi	a0,a0,-1702 # ffffffffc0201b50 <etext+0x148>
ffffffffc02001fe:	e406                	sd	ra,8(sp)
ffffffffc0200200:	eb3ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200204:	00002617          	auipc	a2,0x2
ffffffffc0200208:	95c60613          	addi	a2,a2,-1700 # ffffffffc0201b60 <etext+0x158>
ffffffffc020020c:	00002597          	auipc	a1,0x2
ffffffffc0200210:	97c58593          	addi	a1,a1,-1668 # ffffffffc0201b88 <etext+0x180>
ffffffffc0200214:	00002517          	auipc	a0,0x2
ffffffffc0200218:	93c50513          	addi	a0,a0,-1732 # ffffffffc0201b50 <etext+0x148>
ffffffffc020021c:	e97ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200220:	00002617          	auipc	a2,0x2
ffffffffc0200224:	97860613          	addi	a2,a2,-1672 # ffffffffc0201b98 <etext+0x190>
ffffffffc0200228:	00002597          	auipc	a1,0x2
ffffffffc020022c:	99058593          	addi	a1,a1,-1648 # ffffffffc0201bb8 <etext+0x1b0>
ffffffffc0200230:	00002517          	auipc	a0,0x2
ffffffffc0200234:	92050513          	addi	a0,a0,-1760 # ffffffffc0201b50 <etext+0x148>
ffffffffc0200238:	e7bff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020023c:	60a2                	ld	ra,8(sp)
ffffffffc020023e:	4501                	li	a0,0
ffffffffc0200240:	0141                	addi	sp,sp,16
ffffffffc0200242:	8082                	ret

ffffffffc0200244 <mon_kerninfo>:
ffffffffc0200244:	1141                	addi	sp,sp,-16
ffffffffc0200246:	e406                	sd	ra,8(sp)
ffffffffc0200248:	ef3ff0ef          	jal	ra,ffffffffc020013a <print_kerninfo>
ffffffffc020024c:	60a2                	ld	ra,8(sp)
ffffffffc020024e:	4501                	li	a0,0
ffffffffc0200250:	0141                	addi	sp,sp,16
ffffffffc0200252:	8082                	ret

ffffffffc0200254 <mon_backtrace>:
ffffffffc0200254:	1141                	addi	sp,sp,-16
ffffffffc0200256:	e406                	sd	ra,8(sp)
ffffffffc0200258:	f71ff0ef          	jal	ra,ffffffffc02001c8 <print_stackframe>
ffffffffc020025c:	60a2                	ld	ra,8(sp)
ffffffffc020025e:	4501                	li	a0,0
ffffffffc0200260:	0141                	addi	sp,sp,16
ffffffffc0200262:	8082                	ret

ffffffffc0200264 <kmonitor>:
ffffffffc0200264:	7115                	addi	sp,sp,-224
ffffffffc0200266:	ed5e                	sd	s7,152(sp)
ffffffffc0200268:	8baa                	mv	s7,a0
ffffffffc020026a:	00002517          	auipc	a0,0x2
ffffffffc020026e:	95e50513          	addi	a0,a0,-1698 # ffffffffc0201bc8 <etext+0x1c0>
ffffffffc0200272:	ed86                	sd	ra,216(sp)
ffffffffc0200274:	e9a2                	sd	s0,208(sp)
ffffffffc0200276:	e5a6                	sd	s1,200(sp)
ffffffffc0200278:	e1ca                	sd	s2,192(sp)
ffffffffc020027a:	fd4e                	sd	s3,184(sp)
ffffffffc020027c:	f952                	sd	s4,176(sp)
ffffffffc020027e:	f556                	sd	s5,168(sp)
ffffffffc0200280:	f15a                	sd	s6,160(sp)
ffffffffc0200282:	e962                	sd	s8,144(sp)
ffffffffc0200284:	e566                	sd	s9,136(sp)
ffffffffc0200286:	e16a                	sd	s10,128(sp)
ffffffffc0200288:	e2bff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020028c:	00002517          	auipc	a0,0x2
ffffffffc0200290:	96450513          	addi	a0,a0,-1692 # ffffffffc0201bf0 <etext+0x1e8>
ffffffffc0200294:	e1fff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200298:	000b8563          	beqz	s7,ffffffffc02002a2 <kmonitor+0x3e>
ffffffffc020029c:	855e                	mv	a0,s7
ffffffffc020029e:	3a4000ef          	jal	ra,ffffffffc0200642 <print_trapframe>
ffffffffc02002a2:	00002c17          	auipc	s8,0x2
ffffffffc02002a6:	9bec0c13          	addi	s8,s8,-1602 # ffffffffc0201c60 <commands>
ffffffffc02002aa:	00002917          	auipc	s2,0x2
ffffffffc02002ae:	96e90913          	addi	s2,s2,-1682 # ffffffffc0201c18 <etext+0x210>
ffffffffc02002b2:	00002497          	auipc	s1,0x2
ffffffffc02002b6:	96e48493          	addi	s1,s1,-1682 # ffffffffc0201c20 <etext+0x218>
ffffffffc02002ba:	49bd                	li	s3,15
ffffffffc02002bc:	00002b17          	auipc	s6,0x2
ffffffffc02002c0:	96cb0b13          	addi	s6,s6,-1684 # ffffffffc0201c28 <etext+0x220>
ffffffffc02002c4:	00002a17          	auipc	s4,0x2
ffffffffc02002c8:	884a0a13          	addi	s4,s4,-1916 # ffffffffc0201b48 <etext+0x140>
ffffffffc02002cc:	4a8d                	li	s5,3
ffffffffc02002ce:	854a                	mv	a0,s2
ffffffffc02002d0:	5d2010ef          	jal	ra,ffffffffc02018a2 <readline>
ffffffffc02002d4:	842a                	mv	s0,a0
ffffffffc02002d6:	dd65                	beqz	a0,ffffffffc02002ce <kmonitor+0x6a>
ffffffffc02002d8:	00054583          	lbu	a1,0(a0)
ffffffffc02002dc:	4c81                	li	s9,0
ffffffffc02002de:	e1bd                	bnez	a1,ffffffffc0200344 <kmonitor+0xe0>
ffffffffc02002e0:	fe0c87e3          	beqz	s9,ffffffffc02002ce <kmonitor+0x6a>
ffffffffc02002e4:	6582                	ld	a1,0(sp)
ffffffffc02002e6:	00002d17          	auipc	s10,0x2
ffffffffc02002ea:	97ad0d13          	addi	s10,s10,-1670 # ffffffffc0201c60 <commands>
ffffffffc02002ee:	8552                	mv	a0,s4
ffffffffc02002f0:	4401                	li	s0,0
ffffffffc02002f2:	0d61                	addi	s10,s10,24
ffffffffc02002f4:	6ce010ef          	jal	ra,ffffffffc02019c2 <strcmp>
ffffffffc02002f8:	c919                	beqz	a0,ffffffffc020030e <kmonitor+0xaa>
ffffffffc02002fa:	2405                	addiw	s0,s0,1
ffffffffc02002fc:	0b540063          	beq	s0,s5,ffffffffc020039c <kmonitor+0x138>
ffffffffc0200300:	000d3503          	ld	a0,0(s10)
ffffffffc0200304:	6582                	ld	a1,0(sp)
ffffffffc0200306:	0d61                	addi	s10,s10,24
ffffffffc0200308:	6ba010ef          	jal	ra,ffffffffc02019c2 <strcmp>
ffffffffc020030c:	f57d                	bnez	a0,ffffffffc02002fa <kmonitor+0x96>
ffffffffc020030e:	00141793          	slli	a5,s0,0x1
ffffffffc0200312:	97a2                	add	a5,a5,s0
ffffffffc0200314:	078e                	slli	a5,a5,0x3
ffffffffc0200316:	97e2                	add	a5,a5,s8
ffffffffc0200318:	6b9c                	ld	a5,16(a5)
ffffffffc020031a:	865e                	mv	a2,s7
ffffffffc020031c:	002c                	addi	a1,sp,8
ffffffffc020031e:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200322:	9782                	jalr	a5
ffffffffc0200324:	fa0555e3          	bgez	a0,ffffffffc02002ce <kmonitor+0x6a>
ffffffffc0200328:	60ee                	ld	ra,216(sp)
ffffffffc020032a:	644e                	ld	s0,208(sp)
ffffffffc020032c:	64ae                	ld	s1,200(sp)
ffffffffc020032e:	690e                	ld	s2,192(sp)
ffffffffc0200330:	79ea                	ld	s3,184(sp)
ffffffffc0200332:	7a4a                	ld	s4,176(sp)
ffffffffc0200334:	7aaa                	ld	s5,168(sp)
ffffffffc0200336:	7b0a                	ld	s6,160(sp)
ffffffffc0200338:	6bea                	ld	s7,152(sp)
ffffffffc020033a:	6c4a                	ld	s8,144(sp)
ffffffffc020033c:	6caa                	ld	s9,136(sp)
ffffffffc020033e:	6d0a                	ld	s10,128(sp)
ffffffffc0200340:	612d                	addi	sp,sp,224
ffffffffc0200342:	8082                	ret
ffffffffc0200344:	8526                	mv	a0,s1
ffffffffc0200346:	69a010ef          	jal	ra,ffffffffc02019e0 <strchr>
ffffffffc020034a:	c901                	beqz	a0,ffffffffc020035a <kmonitor+0xf6>
ffffffffc020034c:	00144583          	lbu	a1,1(s0)
ffffffffc0200350:	00040023          	sb	zero,0(s0)
ffffffffc0200354:	0405                	addi	s0,s0,1
ffffffffc0200356:	d5c9                	beqz	a1,ffffffffc02002e0 <kmonitor+0x7c>
ffffffffc0200358:	b7f5                	j	ffffffffc0200344 <kmonitor+0xe0>
ffffffffc020035a:	00044783          	lbu	a5,0(s0)
ffffffffc020035e:	d3c9                	beqz	a5,ffffffffc02002e0 <kmonitor+0x7c>
ffffffffc0200360:	033c8963          	beq	s9,s3,ffffffffc0200392 <kmonitor+0x12e>
ffffffffc0200364:	003c9793          	slli	a5,s9,0x3
ffffffffc0200368:	0118                	addi	a4,sp,128
ffffffffc020036a:	97ba                	add	a5,a5,a4
ffffffffc020036c:	f887b023          	sd	s0,-128(a5)
ffffffffc0200370:	00044583          	lbu	a1,0(s0)
ffffffffc0200374:	2c85                	addiw	s9,s9,1
ffffffffc0200376:	e591                	bnez	a1,ffffffffc0200382 <kmonitor+0x11e>
ffffffffc0200378:	b7b5                	j	ffffffffc02002e4 <kmonitor+0x80>
ffffffffc020037a:	00144583          	lbu	a1,1(s0)
ffffffffc020037e:	0405                	addi	s0,s0,1
ffffffffc0200380:	d1a5                	beqz	a1,ffffffffc02002e0 <kmonitor+0x7c>
ffffffffc0200382:	8526                	mv	a0,s1
ffffffffc0200384:	65c010ef          	jal	ra,ffffffffc02019e0 <strchr>
ffffffffc0200388:	d96d                	beqz	a0,ffffffffc020037a <kmonitor+0x116>
ffffffffc020038a:	00044583          	lbu	a1,0(s0)
ffffffffc020038e:	d9a9                	beqz	a1,ffffffffc02002e0 <kmonitor+0x7c>
ffffffffc0200390:	bf55                	j	ffffffffc0200344 <kmonitor+0xe0>
ffffffffc0200392:	45c1                	li	a1,16
ffffffffc0200394:	855a                	mv	a0,s6
ffffffffc0200396:	d1dff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020039a:	b7e9                	j	ffffffffc0200364 <kmonitor+0x100>
ffffffffc020039c:	6582                	ld	a1,0(sp)
ffffffffc020039e:	00002517          	auipc	a0,0x2
ffffffffc02003a2:	8aa50513          	addi	a0,a0,-1878 # ffffffffc0201c48 <etext+0x240>
ffffffffc02003a6:	d0dff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02003aa:	b715                	j	ffffffffc02002ce <kmonitor+0x6a>

ffffffffc02003ac <__panic>:
ffffffffc02003ac:	00006317          	auipc	t1,0x6
ffffffffc02003b0:	07c30313          	addi	t1,t1,124 # ffffffffc0206428 <is_panic>
ffffffffc02003b4:	00032e03          	lw	t3,0(t1)
ffffffffc02003b8:	715d                	addi	sp,sp,-80
ffffffffc02003ba:	ec06                	sd	ra,24(sp)
ffffffffc02003bc:	e822                	sd	s0,16(sp)
ffffffffc02003be:	f436                	sd	a3,40(sp)
ffffffffc02003c0:	f83a                	sd	a4,48(sp)
ffffffffc02003c2:	fc3e                	sd	a5,56(sp)
ffffffffc02003c4:	e0c2                	sd	a6,64(sp)
ffffffffc02003c6:	e4c6                	sd	a7,72(sp)
ffffffffc02003c8:	020e1a63          	bnez	t3,ffffffffc02003fc <__panic+0x50>
ffffffffc02003cc:	4785                	li	a5,1
ffffffffc02003ce:	00f32023          	sw	a5,0(t1)
ffffffffc02003d2:	8432                	mv	s0,a2
ffffffffc02003d4:	103c                	addi	a5,sp,40
ffffffffc02003d6:	862e                	mv	a2,a1
ffffffffc02003d8:	85aa                	mv	a1,a0
ffffffffc02003da:	00002517          	auipc	a0,0x2
ffffffffc02003de:	8ce50513          	addi	a0,a0,-1842 # ffffffffc0201ca8 <commands+0x48>
ffffffffc02003e2:	e43e                	sd	a5,8(sp)
ffffffffc02003e4:	ccfff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02003e8:	65a2                	ld	a1,8(sp)
ffffffffc02003ea:	8522                	mv	a0,s0
ffffffffc02003ec:	ca7ff0ef          	jal	ra,ffffffffc0200092 <vcprintf>
ffffffffc02003f0:	00001517          	auipc	a0,0x1
ffffffffc02003f4:	70050513          	addi	a0,a0,1792 # ffffffffc0201af0 <etext+0xe8>
ffffffffc02003f8:	cbbff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02003fc:	062000ef          	jal	ra,ffffffffc020045e <intr_disable>
ffffffffc0200400:	4501                	li	a0,0
ffffffffc0200402:	e63ff0ef          	jal	ra,ffffffffc0200264 <kmonitor>
ffffffffc0200406:	bfed                	j	ffffffffc0200400 <__panic+0x54>

ffffffffc0200408 <clock_init>:
ffffffffc0200408:	1141                	addi	sp,sp,-16
ffffffffc020040a:	e406                	sd	ra,8(sp)
ffffffffc020040c:	02000793          	li	a5,32
ffffffffc0200410:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200414:	c0102573          	rdtime	a0
ffffffffc0200418:	67e1                	lui	a5,0x18
ffffffffc020041a:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc020041e:	953e                	add	a0,a0,a5
ffffffffc0200420:	550010ef          	jal	ra,ffffffffc0201970 <sbi_set_timer>
ffffffffc0200424:	60a2                	ld	ra,8(sp)
ffffffffc0200426:	00006797          	auipc	a5,0x6
ffffffffc020042a:	0007b523          	sd	zero,10(a5) # ffffffffc0206430 <ticks>
ffffffffc020042e:	00002517          	auipc	a0,0x2
ffffffffc0200432:	89a50513          	addi	a0,a0,-1894 # ffffffffc0201cc8 <commands+0x68>
ffffffffc0200436:	0141                	addi	sp,sp,16
ffffffffc0200438:	b9ad                	j	ffffffffc02000b2 <cprintf>

ffffffffc020043a <clock_set_next_event>:
ffffffffc020043a:	c0102573          	rdtime	a0
ffffffffc020043e:	67e1                	lui	a5,0x18
ffffffffc0200440:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc0200444:	953e                	add	a0,a0,a5
ffffffffc0200446:	52a0106f          	j	ffffffffc0201970 <sbi_set_timer>

ffffffffc020044a <cons_init>:
ffffffffc020044a:	8082                	ret

ffffffffc020044c <cons_putc>:
ffffffffc020044c:	0ff57513          	andi	a0,a0,255
ffffffffc0200450:	5060106f          	j	ffffffffc0201956 <sbi_console_putchar>

ffffffffc0200454 <cons_getc>:
ffffffffc0200454:	5360106f          	j	ffffffffc020198a <sbi_console_getchar>

ffffffffc0200458 <intr_enable>:
ffffffffc0200458:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc020045c:	8082                	ret

ffffffffc020045e <intr_disable>:
ffffffffc020045e:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200462:	8082                	ret

ffffffffc0200464 <idt_init>:
ffffffffc0200464:	14005073          	csrwi	sscratch,0
ffffffffc0200468:	00000797          	auipc	a5,0x0
ffffffffc020046c:	2e478793          	addi	a5,a5,740 # ffffffffc020074c <__alltraps>
ffffffffc0200470:	10579073          	csrw	stvec,a5
ffffffffc0200474:	8082                	ret

ffffffffc0200476 <print_regs>:
ffffffffc0200476:	610c                	ld	a1,0(a0)
ffffffffc0200478:	1141                	addi	sp,sp,-16
ffffffffc020047a:	e022                	sd	s0,0(sp)
ffffffffc020047c:	842a                	mv	s0,a0
ffffffffc020047e:	00002517          	auipc	a0,0x2
ffffffffc0200482:	86a50513          	addi	a0,a0,-1942 # ffffffffc0201ce8 <commands+0x88>
ffffffffc0200486:	e406                	sd	ra,8(sp)
ffffffffc0200488:	c2bff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020048c:	640c                	ld	a1,8(s0)
ffffffffc020048e:	00002517          	auipc	a0,0x2
ffffffffc0200492:	87250513          	addi	a0,a0,-1934 # ffffffffc0201d00 <commands+0xa0>
ffffffffc0200496:	c1dff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020049a:	680c                	ld	a1,16(s0)
ffffffffc020049c:	00002517          	auipc	a0,0x2
ffffffffc02004a0:	87c50513          	addi	a0,a0,-1924 # ffffffffc0201d18 <commands+0xb8>
ffffffffc02004a4:	c0fff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02004a8:	6c0c                	ld	a1,24(s0)
ffffffffc02004aa:	00002517          	auipc	a0,0x2
ffffffffc02004ae:	88650513          	addi	a0,a0,-1914 # ffffffffc0201d30 <commands+0xd0>
ffffffffc02004b2:	c01ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02004b6:	700c                	ld	a1,32(s0)
ffffffffc02004b8:	00002517          	auipc	a0,0x2
ffffffffc02004bc:	89050513          	addi	a0,a0,-1904 # ffffffffc0201d48 <commands+0xe8>
ffffffffc02004c0:	bf3ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02004c4:	740c                	ld	a1,40(s0)
ffffffffc02004c6:	00002517          	auipc	a0,0x2
ffffffffc02004ca:	89a50513          	addi	a0,a0,-1894 # ffffffffc0201d60 <commands+0x100>
ffffffffc02004ce:	be5ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02004d2:	780c                	ld	a1,48(s0)
ffffffffc02004d4:	00002517          	auipc	a0,0x2
ffffffffc02004d8:	8a450513          	addi	a0,a0,-1884 # ffffffffc0201d78 <commands+0x118>
ffffffffc02004dc:	bd7ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02004e0:	7c0c                	ld	a1,56(s0)
ffffffffc02004e2:	00002517          	auipc	a0,0x2
ffffffffc02004e6:	8ae50513          	addi	a0,a0,-1874 # ffffffffc0201d90 <commands+0x130>
ffffffffc02004ea:	bc9ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02004ee:	602c                	ld	a1,64(s0)
ffffffffc02004f0:	00002517          	auipc	a0,0x2
ffffffffc02004f4:	8b850513          	addi	a0,a0,-1864 # ffffffffc0201da8 <commands+0x148>
ffffffffc02004f8:	bbbff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02004fc:	642c                	ld	a1,72(s0)
ffffffffc02004fe:	00002517          	auipc	a0,0x2
ffffffffc0200502:	8c250513          	addi	a0,a0,-1854 # ffffffffc0201dc0 <commands+0x160>
ffffffffc0200506:	badff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020050a:	682c                	ld	a1,80(s0)
ffffffffc020050c:	00002517          	auipc	a0,0x2
ffffffffc0200510:	8cc50513          	addi	a0,a0,-1844 # ffffffffc0201dd8 <commands+0x178>
ffffffffc0200514:	b9fff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200518:	6c2c                	ld	a1,88(s0)
ffffffffc020051a:	00002517          	auipc	a0,0x2
ffffffffc020051e:	8d650513          	addi	a0,a0,-1834 # ffffffffc0201df0 <commands+0x190>
ffffffffc0200522:	b91ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200526:	702c                	ld	a1,96(s0)
ffffffffc0200528:	00002517          	auipc	a0,0x2
ffffffffc020052c:	8e050513          	addi	a0,a0,-1824 # ffffffffc0201e08 <commands+0x1a8>
ffffffffc0200530:	b83ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200534:	742c                	ld	a1,104(s0)
ffffffffc0200536:	00002517          	auipc	a0,0x2
ffffffffc020053a:	8ea50513          	addi	a0,a0,-1814 # ffffffffc0201e20 <commands+0x1c0>
ffffffffc020053e:	b75ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200542:	782c                	ld	a1,112(s0)
ffffffffc0200544:	00002517          	auipc	a0,0x2
ffffffffc0200548:	8f450513          	addi	a0,a0,-1804 # ffffffffc0201e38 <commands+0x1d8>
ffffffffc020054c:	b67ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200550:	7c2c                	ld	a1,120(s0)
ffffffffc0200552:	00002517          	auipc	a0,0x2
ffffffffc0200556:	8fe50513          	addi	a0,a0,-1794 # ffffffffc0201e50 <commands+0x1f0>
ffffffffc020055a:	b59ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020055e:	604c                	ld	a1,128(s0)
ffffffffc0200560:	00002517          	auipc	a0,0x2
ffffffffc0200564:	90850513          	addi	a0,a0,-1784 # ffffffffc0201e68 <commands+0x208>
ffffffffc0200568:	b4bff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020056c:	644c                	ld	a1,136(s0)
ffffffffc020056e:	00002517          	auipc	a0,0x2
ffffffffc0200572:	91250513          	addi	a0,a0,-1774 # ffffffffc0201e80 <commands+0x220>
ffffffffc0200576:	b3dff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020057a:	684c                	ld	a1,144(s0)
ffffffffc020057c:	00002517          	auipc	a0,0x2
ffffffffc0200580:	91c50513          	addi	a0,a0,-1764 # ffffffffc0201e98 <commands+0x238>
ffffffffc0200584:	b2fff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200588:	6c4c                	ld	a1,152(s0)
ffffffffc020058a:	00002517          	auipc	a0,0x2
ffffffffc020058e:	92650513          	addi	a0,a0,-1754 # ffffffffc0201eb0 <commands+0x250>
ffffffffc0200592:	b21ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200596:	704c                	ld	a1,160(s0)
ffffffffc0200598:	00002517          	auipc	a0,0x2
ffffffffc020059c:	93050513          	addi	a0,a0,-1744 # ffffffffc0201ec8 <commands+0x268>
ffffffffc02005a0:	b13ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02005a4:	744c                	ld	a1,168(s0)
ffffffffc02005a6:	00002517          	auipc	a0,0x2
ffffffffc02005aa:	93a50513          	addi	a0,a0,-1734 # ffffffffc0201ee0 <commands+0x280>
ffffffffc02005ae:	b05ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02005b2:	784c                	ld	a1,176(s0)
ffffffffc02005b4:	00002517          	auipc	a0,0x2
ffffffffc02005b8:	94450513          	addi	a0,a0,-1724 # ffffffffc0201ef8 <commands+0x298>
ffffffffc02005bc:	af7ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02005c0:	7c4c                	ld	a1,184(s0)
ffffffffc02005c2:	00002517          	auipc	a0,0x2
ffffffffc02005c6:	94e50513          	addi	a0,a0,-1714 # ffffffffc0201f10 <commands+0x2b0>
ffffffffc02005ca:	ae9ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02005ce:	606c                	ld	a1,192(s0)
ffffffffc02005d0:	00002517          	auipc	a0,0x2
ffffffffc02005d4:	95850513          	addi	a0,a0,-1704 # ffffffffc0201f28 <commands+0x2c8>
ffffffffc02005d8:	adbff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02005dc:	646c                	ld	a1,200(s0)
ffffffffc02005de:	00002517          	auipc	a0,0x2
ffffffffc02005e2:	96250513          	addi	a0,a0,-1694 # ffffffffc0201f40 <commands+0x2e0>
ffffffffc02005e6:	acdff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02005ea:	686c                	ld	a1,208(s0)
ffffffffc02005ec:	00002517          	auipc	a0,0x2
ffffffffc02005f0:	96c50513          	addi	a0,a0,-1684 # ffffffffc0201f58 <commands+0x2f8>
ffffffffc02005f4:	abfff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02005f8:	6c6c                	ld	a1,216(s0)
ffffffffc02005fa:	00002517          	auipc	a0,0x2
ffffffffc02005fe:	97650513          	addi	a0,a0,-1674 # ffffffffc0201f70 <commands+0x310>
ffffffffc0200602:	ab1ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200606:	706c                	ld	a1,224(s0)
ffffffffc0200608:	00002517          	auipc	a0,0x2
ffffffffc020060c:	98050513          	addi	a0,a0,-1664 # ffffffffc0201f88 <commands+0x328>
ffffffffc0200610:	aa3ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200614:	746c                	ld	a1,232(s0)
ffffffffc0200616:	00002517          	auipc	a0,0x2
ffffffffc020061a:	98a50513          	addi	a0,a0,-1654 # ffffffffc0201fa0 <commands+0x340>
ffffffffc020061e:	a95ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200622:	786c                	ld	a1,240(s0)
ffffffffc0200624:	00002517          	auipc	a0,0x2
ffffffffc0200628:	99450513          	addi	a0,a0,-1644 # ffffffffc0201fb8 <commands+0x358>
ffffffffc020062c:	a87ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200630:	7c6c                	ld	a1,248(s0)
ffffffffc0200632:	6402                	ld	s0,0(sp)
ffffffffc0200634:	60a2                	ld	ra,8(sp)
ffffffffc0200636:	00002517          	auipc	a0,0x2
ffffffffc020063a:	99a50513          	addi	a0,a0,-1638 # ffffffffc0201fd0 <commands+0x370>
ffffffffc020063e:	0141                	addi	sp,sp,16
ffffffffc0200640:	bc8d                	j	ffffffffc02000b2 <cprintf>

ffffffffc0200642 <print_trapframe>:
ffffffffc0200642:	1141                	addi	sp,sp,-16
ffffffffc0200644:	e022                	sd	s0,0(sp)
ffffffffc0200646:	85aa                	mv	a1,a0
ffffffffc0200648:	842a                	mv	s0,a0
ffffffffc020064a:	00002517          	auipc	a0,0x2
ffffffffc020064e:	99e50513          	addi	a0,a0,-1634 # ffffffffc0201fe8 <commands+0x388>
ffffffffc0200652:	e406                	sd	ra,8(sp)
ffffffffc0200654:	a5fff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200658:	8522                	mv	a0,s0
ffffffffc020065a:	e1dff0ef          	jal	ra,ffffffffc0200476 <print_regs>
ffffffffc020065e:	10043583          	ld	a1,256(s0)
ffffffffc0200662:	00002517          	auipc	a0,0x2
ffffffffc0200666:	99e50513          	addi	a0,a0,-1634 # ffffffffc0202000 <commands+0x3a0>
ffffffffc020066a:	a49ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020066e:	10843583          	ld	a1,264(s0)
ffffffffc0200672:	00002517          	auipc	a0,0x2
ffffffffc0200676:	9a650513          	addi	a0,a0,-1626 # ffffffffc0202018 <commands+0x3b8>
ffffffffc020067a:	a39ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020067e:	11043583          	ld	a1,272(s0)
ffffffffc0200682:	00002517          	auipc	a0,0x2
ffffffffc0200686:	9ae50513          	addi	a0,a0,-1618 # ffffffffc0202030 <commands+0x3d0>
ffffffffc020068a:	a29ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc020068e:	11843583          	ld	a1,280(s0)
ffffffffc0200692:	6402                	ld	s0,0(sp)
ffffffffc0200694:	60a2                	ld	ra,8(sp)
ffffffffc0200696:	00002517          	auipc	a0,0x2
ffffffffc020069a:	9b250513          	addi	a0,a0,-1614 # ffffffffc0202048 <commands+0x3e8>
ffffffffc020069e:	0141                	addi	sp,sp,16
ffffffffc02006a0:	bc09                	j	ffffffffc02000b2 <cprintf>

ffffffffc02006a2 <interrupt_handler>:
ffffffffc02006a2:	11853783          	ld	a5,280(a0)
ffffffffc02006a6:	472d                	li	a4,11
ffffffffc02006a8:	0786                	slli	a5,a5,0x1
ffffffffc02006aa:	8385                	srli	a5,a5,0x1
ffffffffc02006ac:	06f76c63          	bltu	a4,a5,ffffffffc0200724 <interrupt_handler+0x82>
ffffffffc02006b0:	00002717          	auipc	a4,0x2
ffffffffc02006b4:	a7870713          	addi	a4,a4,-1416 # ffffffffc0202128 <commands+0x4c8>
ffffffffc02006b8:	078a                	slli	a5,a5,0x2
ffffffffc02006ba:	97ba                	add	a5,a5,a4
ffffffffc02006bc:	439c                	lw	a5,0(a5)
ffffffffc02006be:	97ba                	add	a5,a5,a4
ffffffffc02006c0:	8782                	jr	a5
ffffffffc02006c2:	00002517          	auipc	a0,0x2
ffffffffc02006c6:	9fe50513          	addi	a0,a0,-1538 # ffffffffc02020c0 <commands+0x460>
ffffffffc02006ca:	b2e5                	j	ffffffffc02000b2 <cprintf>
ffffffffc02006cc:	00002517          	auipc	a0,0x2
ffffffffc02006d0:	9d450513          	addi	a0,a0,-1580 # ffffffffc02020a0 <commands+0x440>
ffffffffc02006d4:	baf9                	j	ffffffffc02000b2 <cprintf>
ffffffffc02006d6:	00002517          	auipc	a0,0x2
ffffffffc02006da:	98a50513          	addi	a0,a0,-1654 # ffffffffc0202060 <commands+0x400>
ffffffffc02006de:	bad1                	j	ffffffffc02000b2 <cprintf>
ffffffffc02006e0:	00002517          	auipc	a0,0x2
ffffffffc02006e4:	a0050513          	addi	a0,a0,-1536 # ffffffffc02020e0 <commands+0x480>
ffffffffc02006e8:	b2e9                	j	ffffffffc02000b2 <cprintf>
ffffffffc02006ea:	1141                	addi	sp,sp,-16
ffffffffc02006ec:	e406                	sd	ra,8(sp)
ffffffffc02006ee:	d4dff0ef          	jal	ra,ffffffffc020043a <clock_set_next_event>
ffffffffc02006f2:	00006697          	auipc	a3,0x6
ffffffffc02006f6:	d3e68693          	addi	a3,a3,-706 # ffffffffc0206430 <ticks>
ffffffffc02006fa:	629c                	ld	a5,0(a3)
ffffffffc02006fc:	06400713          	li	a4,100
ffffffffc0200700:	0785                	addi	a5,a5,1
ffffffffc0200702:	02e7f733          	remu	a4,a5,a4
ffffffffc0200706:	e29c                	sd	a5,0(a3)
ffffffffc0200708:	cf19                	beqz	a4,ffffffffc0200726 <interrupt_handler+0x84>
ffffffffc020070a:	60a2                	ld	ra,8(sp)
ffffffffc020070c:	0141                	addi	sp,sp,16
ffffffffc020070e:	8082                	ret
ffffffffc0200710:	00002517          	auipc	a0,0x2
ffffffffc0200714:	9f850513          	addi	a0,a0,-1544 # ffffffffc0202108 <commands+0x4a8>
ffffffffc0200718:	ba69                	j	ffffffffc02000b2 <cprintf>
ffffffffc020071a:	00002517          	auipc	a0,0x2
ffffffffc020071e:	96650513          	addi	a0,a0,-1690 # ffffffffc0202080 <commands+0x420>
ffffffffc0200722:	ba41                	j	ffffffffc02000b2 <cprintf>
ffffffffc0200724:	bf39                	j	ffffffffc0200642 <print_trapframe>
ffffffffc0200726:	60a2                	ld	ra,8(sp)
ffffffffc0200728:	06400593          	li	a1,100
ffffffffc020072c:	00002517          	auipc	a0,0x2
ffffffffc0200730:	9cc50513          	addi	a0,a0,-1588 # ffffffffc02020f8 <commands+0x498>
ffffffffc0200734:	0141                	addi	sp,sp,16
ffffffffc0200736:	bab5                	j	ffffffffc02000b2 <cprintf>

ffffffffc0200738 <trap>:
ffffffffc0200738:	11853783          	ld	a5,280(a0)
ffffffffc020073c:	0007c763          	bltz	a5,ffffffffc020074a <trap+0x12>
ffffffffc0200740:	472d                	li	a4,11
ffffffffc0200742:	00f76363          	bltu	a4,a5,ffffffffc0200748 <trap+0x10>
ffffffffc0200746:	8082                	ret
ffffffffc0200748:	bded                	j	ffffffffc0200642 <print_trapframe>
ffffffffc020074a:	bfa1                	j	ffffffffc02006a2 <interrupt_handler>

ffffffffc020074c <__alltraps>:
ffffffffc020074c:	14011073          	csrw	sscratch,sp
ffffffffc0200750:	712d                	addi	sp,sp,-288
ffffffffc0200752:	e002                	sd	zero,0(sp)
ffffffffc0200754:	e406                	sd	ra,8(sp)
ffffffffc0200756:	ec0e                	sd	gp,24(sp)
ffffffffc0200758:	f012                	sd	tp,32(sp)
ffffffffc020075a:	f416                	sd	t0,40(sp)
ffffffffc020075c:	f81a                	sd	t1,48(sp)
ffffffffc020075e:	fc1e                	sd	t2,56(sp)
ffffffffc0200760:	e0a2                	sd	s0,64(sp)
ffffffffc0200762:	e4a6                	sd	s1,72(sp)
ffffffffc0200764:	e8aa                	sd	a0,80(sp)
ffffffffc0200766:	ecae                	sd	a1,88(sp)
ffffffffc0200768:	f0b2                	sd	a2,96(sp)
ffffffffc020076a:	f4b6                	sd	a3,104(sp)
ffffffffc020076c:	f8ba                	sd	a4,112(sp)
ffffffffc020076e:	fcbe                	sd	a5,120(sp)
ffffffffc0200770:	e142                	sd	a6,128(sp)
ffffffffc0200772:	e546                	sd	a7,136(sp)
ffffffffc0200774:	e94a                	sd	s2,144(sp)
ffffffffc0200776:	ed4e                	sd	s3,152(sp)
ffffffffc0200778:	f152                	sd	s4,160(sp)
ffffffffc020077a:	f556                	sd	s5,168(sp)
ffffffffc020077c:	f95a                	sd	s6,176(sp)
ffffffffc020077e:	fd5e                	sd	s7,184(sp)
ffffffffc0200780:	e1e2                	sd	s8,192(sp)
ffffffffc0200782:	e5e6                	sd	s9,200(sp)
ffffffffc0200784:	e9ea                	sd	s10,208(sp)
ffffffffc0200786:	edee                	sd	s11,216(sp)
ffffffffc0200788:	f1f2                	sd	t3,224(sp)
ffffffffc020078a:	f5f6                	sd	t4,232(sp)
ffffffffc020078c:	f9fa                	sd	t5,240(sp)
ffffffffc020078e:	fdfe                	sd	t6,248(sp)
ffffffffc0200790:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200794:	100024f3          	csrr	s1,sstatus
ffffffffc0200798:	14102973          	csrr	s2,sepc
ffffffffc020079c:	143029f3          	csrr	s3,stval
ffffffffc02007a0:	14202a73          	csrr	s4,scause
ffffffffc02007a4:	e822                	sd	s0,16(sp)
ffffffffc02007a6:	e226                	sd	s1,256(sp)
ffffffffc02007a8:	e64a                	sd	s2,264(sp)
ffffffffc02007aa:	ea4e                	sd	s3,272(sp)
ffffffffc02007ac:	ee52                	sd	s4,280(sp)
ffffffffc02007ae:	850a                	mv	a0,sp
ffffffffc02007b0:	f89ff0ef          	jal	ra,ffffffffc0200738 <trap>

ffffffffc02007b4 <__trapret>:
ffffffffc02007b4:	6492                	ld	s1,256(sp)
ffffffffc02007b6:	6932                	ld	s2,264(sp)
ffffffffc02007b8:	10049073          	csrw	sstatus,s1
ffffffffc02007bc:	14191073          	csrw	sepc,s2
ffffffffc02007c0:	60a2                	ld	ra,8(sp)
ffffffffc02007c2:	61e2                	ld	gp,24(sp)
ffffffffc02007c4:	7202                	ld	tp,32(sp)
ffffffffc02007c6:	72a2                	ld	t0,40(sp)
ffffffffc02007c8:	7342                	ld	t1,48(sp)
ffffffffc02007ca:	73e2                	ld	t2,56(sp)
ffffffffc02007cc:	6406                	ld	s0,64(sp)
ffffffffc02007ce:	64a6                	ld	s1,72(sp)
ffffffffc02007d0:	6546                	ld	a0,80(sp)
ffffffffc02007d2:	65e6                	ld	a1,88(sp)
ffffffffc02007d4:	7606                	ld	a2,96(sp)
ffffffffc02007d6:	76a6                	ld	a3,104(sp)
ffffffffc02007d8:	7746                	ld	a4,112(sp)
ffffffffc02007da:	77e6                	ld	a5,120(sp)
ffffffffc02007dc:	680a                	ld	a6,128(sp)
ffffffffc02007de:	68aa                	ld	a7,136(sp)
ffffffffc02007e0:	694a                	ld	s2,144(sp)
ffffffffc02007e2:	69ea                	ld	s3,152(sp)
ffffffffc02007e4:	7a0a                	ld	s4,160(sp)
ffffffffc02007e6:	7aaa                	ld	s5,168(sp)
ffffffffc02007e8:	7b4a                	ld	s6,176(sp)
ffffffffc02007ea:	7bea                	ld	s7,184(sp)
ffffffffc02007ec:	6c0e                	ld	s8,192(sp)
ffffffffc02007ee:	6cae                	ld	s9,200(sp)
ffffffffc02007f0:	6d4e                	ld	s10,208(sp)
ffffffffc02007f2:	6dee                	ld	s11,216(sp)
ffffffffc02007f4:	7e0e                	ld	t3,224(sp)
ffffffffc02007f6:	7eae                	ld	t4,232(sp)
ffffffffc02007f8:	7f4e                	ld	t5,240(sp)
ffffffffc02007fa:	7fee                	ld	t6,248(sp)
ffffffffc02007fc:	6142                	ld	sp,16(sp)
ffffffffc02007fe:	10200073          	sret

ffffffffc0200802 <best_fit_init>:
ffffffffc0200802:	00006797          	auipc	a5,0x6
ffffffffc0200806:	80e78793          	addi	a5,a5,-2034 # ffffffffc0206010 <free_area>
ffffffffc020080a:	e79c                	sd	a5,8(a5)
ffffffffc020080c:	e39c                	sd	a5,0(a5)
ffffffffc020080e:	0007a823          	sw	zero,16(a5)
ffffffffc0200812:	8082                	ret

ffffffffc0200814 <best_fit_nr_free_pages>:
ffffffffc0200814:	00006517          	auipc	a0,0x6
ffffffffc0200818:	80c56503          	lwu	a0,-2036(a0) # ffffffffc0206020 <free_area+0x10>
ffffffffc020081c:	8082                	ret

ffffffffc020081e <best_fit_check>:
ffffffffc020081e:	715d                	addi	sp,sp,-80
ffffffffc0200820:	e0a2                	sd	s0,64(sp)
ffffffffc0200822:	00005417          	auipc	s0,0x5
ffffffffc0200826:	7ee40413          	addi	s0,s0,2030 # ffffffffc0206010 <free_area>
ffffffffc020082a:	641c                	ld	a5,8(s0)
ffffffffc020082c:	e486                	sd	ra,72(sp)
ffffffffc020082e:	fc26                	sd	s1,56(sp)
ffffffffc0200830:	f84a                	sd	s2,48(sp)
ffffffffc0200832:	f44e                	sd	s3,40(sp)
ffffffffc0200834:	f052                	sd	s4,32(sp)
ffffffffc0200836:	ec56                	sd	s5,24(sp)
ffffffffc0200838:	e85a                	sd	s6,16(sp)
ffffffffc020083a:	e45e                	sd	s7,8(sp)
ffffffffc020083c:	e062                	sd	s8,0(sp)
ffffffffc020083e:	2c878b63          	beq	a5,s0,ffffffffc0200b14 <best_fit_check+0x2f6>
ffffffffc0200842:	4481                	li	s1,0
ffffffffc0200844:	4901                	li	s2,0
ffffffffc0200846:	ff07b703          	ld	a4,-16(a5)
ffffffffc020084a:	8b09                	andi	a4,a4,2
ffffffffc020084c:	2c070863          	beqz	a4,ffffffffc0200b1c <best_fit_check+0x2fe>
ffffffffc0200850:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200854:	679c                	ld	a5,8(a5)
ffffffffc0200856:	2905                	addiw	s2,s2,1
ffffffffc0200858:	9cb9                	addw	s1,s1,a4
ffffffffc020085a:	fe8796e3          	bne	a5,s0,ffffffffc0200846 <best_fit_check+0x28>
ffffffffc020085e:	89a6                	mv	s3,s1
ffffffffc0200860:	287000ef          	jal	ra,ffffffffc02012e6 <nr_free_pages>
ffffffffc0200864:	39351c63          	bne	a0,s3,ffffffffc0200bfc <best_fit_check+0x3de>
ffffffffc0200868:	4505                	li	a0,1
ffffffffc020086a:	1ff000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc020086e:	8a2a                	mv	s4,a0
ffffffffc0200870:	3c050663          	beqz	a0,ffffffffc0200c3c <best_fit_check+0x41e>
ffffffffc0200874:	4505                	li	a0,1
ffffffffc0200876:	1f3000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc020087a:	89aa                	mv	s3,a0
ffffffffc020087c:	3a050063          	beqz	a0,ffffffffc0200c1c <best_fit_check+0x3fe>
ffffffffc0200880:	4505                	li	a0,1
ffffffffc0200882:	1e7000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200886:	8aaa                	mv	s5,a0
ffffffffc0200888:	32050a63          	beqz	a0,ffffffffc0200bbc <best_fit_check+0x39e>
ffffffffc020088c:	2b3a0863          	beq	s4,s3,ffffffffc0200b3c <best_fit_check+0x31e>
ffffffffc0200890:	2aaa0663          	beq	s4,a0,ffffffffc0200b3c <best_fit_check+0x31e>
ffffffffc0200894:	2aa98463          	beq	s3,a0,ffffffffc0200b3c <best_fit_check+0x31e>
ffffffffc0200898:	000a2783          	lw	a5,0(s4)
ffffffffc020089c:	2c079063          	bnez	a5,ffffffffc0200b5c <best_fit_check+0x33e>
ffffffffc02008a0:	0009a783          	lw	a5,0(s3)
ffffffffc02008a4:	2a079c63          	bnez	a5,ffffffffc0200b5c <best_fit_check+0x33e>
ffffffffc02008a8:	411c                	lw	a5,0(a0)
ffffffffc02008aa:	2a079963          	bnez	a5,ffffffffc0200b5c <best_fit_check+0x33e>
ffffffffc02008ae:	00006797          	auipc	a5,0x6
ffffffffc02008b2:	b927b783          	ld	a5,-1134(a5) # ffffffffc0206440 <pages>
ffffffffc02008b6:	40fa0733          	sub	a4,s4,a5
ffffffffc02008ba:	870d                	srai	a4,a4,0x3
ffffffffc02008bc:	00002597          	auipc	a1,0x2
ffffffffc02008c0:	fac5b583          	ld	a1,-84(a1) # ffffffffc0202868 <error_string+0x38>
ffffffffc02008c4:	02b70733          	mul	a4,a4,a1
ffffffffc02008c8:	00002617          	auipc	a2,0x2
ffffffffc02008cc:	fa863603          	ld	a2,-88(a2) # ffffffffc0202870 <nbase>
ffffffffc02008d0:	00006697          	auipc	a3,0x6
ffffffffc02008d4:	b686b683          	ld	a3,-1176(a3) # ffffffffc0206438 <npage>
ffffffffc02008d8:	06b2                	slli	a3,a3,0xc
ffffffffc02008da:	9732                	add	a4,a4,a2
ffffffffc02008dc:	0732                	slli	a4,a4,0xc
ffffffffc02008de:	28d77f63          	bgeu	a4,a3,ffffffffc0200b7c <best_fit_check+0x35e>
ffffffffc02008e2:	40f98733          	sub	a4,s3,a5
ffffffffc02008e6:	870d                	srai	a4,a4,0x3
ffffffffc02008e8:	02b70733          	mul	a4,a4,a1
ffffffffc02008ec:	9732                	add	a4,a4,a2
ffffffffc02008ee:	0732                	slli	a4,a4,0xc
ffffffffc02008f0:	44d77663          	bgeu	a4,a3,ffffffffc0200d3c <best_fit_check+0x51e>
ffffffffc02008f4:	40f507b3          	sub	a5,a0,a5
ffffffffc02008f8:	878d                	srai	a5,a5,0x3
ffffffffc02008fa:	02b787b3          	mul	a5,a5,a1
ffffffffc02008fe:	97b2                	add	a5,a5,a2
ffffffffc0200900:	07b2                	slli	a5,a5,0xc
ffffffffc0200902:	40d7fd63          	bgeu	a5,a3,ffffffffc0200d1c <best_fit_check+0x4fe>
ffffffffc0200906:	4505                	li	a0,1
ffffffffc0200908:	00043c03          	ld	s8,0(s0)
ffffffffc020090c:	00843b83          	ld	s7,8(s0)
ffffffffc0200910:	01042b03          	lw	s6,16(s0)
ffffffffc0200914:	e400                	sd	s0,8(s0)
ffffffffc0200916:	e000                	sd	s0,0(s0)
ffffffffc0200918:	00005797          	auipc	a5,0x5
ffffffffc020091c:	7007a423          	sw	zero,1800(a5) # ffffffffc0206020 <free_area+0x10>
ffffffffc0200920:	149000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200924:	3c051c63          	bnez	a0,ffffffffc0200cfc <best_fit_check+0x4de>
ffffffffc0200928:	4585                	li	a1,1
ffffffffc020092a:	8552                	mv	a0,s4
ffffffffc020092c:	17b000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc0200930:	4585                	li	a1,1
ffffffffc0200932:	854e                	mv	a0,s3
ffffffffc0200934:	173000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc0200938:	4585                	li	a1,1
ffffffffc020093a:	8556                	mv	a0,s5
ffffffffc020093c:	16b000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc0200940:	4818                	lw	a4,16(s0)
ffffffffc0200942:	478d                	li	a5,3
ffffffffc0200944:	38f71c63          	bne	a4,a5,ffffffffc0200cdc <best_fit_check+0x4be>
ffffffffc0200948:	4505                	li	a0,1
ffffffffc020094a:	11f000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc020094e:	89aa                	mv	s3,a0
ffffffffc0200950:	36050663          	beqz	a0,ffffffffc0200cbc <best_fit_check+0x49e>
ffffffffc0200954:	4505                	li	a0,1
ffffffffc0200956:	113000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc020095a:	8aaa                	mv	s5,a0
ffffffffc020095c:	34050063          	beqz	a0,ffffffffc0200c9c <best_fit_check+0x47e>
ffffffffc0200960:	4505                	li	a0,1
ffffffffc0200962:	107000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200966:	8a2a                	mv	s4,a0
ffffffffc0200968:	30050a63          	beqz	a0,ffffffffc0200c7c <best_fit_check+0x45e>
ffffffffc020096c:	4505                	li	a0,1
ffffffffc020096e:	0fb000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200972:	2e051563          	bnez	a0,ffffffffc0200c5c <best_fit_check+0x43e>
ffffffffc0200976:	4585                	li	a1,1
ffffffffc0200978:	854e                	mv	a0,s3
ffffffffc020097a:	12d000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc020097e:	641c                	ld	a5,8(s0)
ffffffffc0200980:	20878e63          	beq	a5,s0,ffffffffc0200b9c <best_fit_check+0x37e>
ffffffffc0200984:	4505                	li	a0,1
ffffffffc0200986:	0e3000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc020098a:	58a99963          	bne	s3,a0,ffffffffc0200f1c <best_fit_check+0x6fe>
ffffffffc020098e:	4505                	li	a0,1
ffffffffc0200990:	0d9000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200994:	56051463          	bnez	a0,ffffffffc0200efc <best_fit_check+0x6de>
ffffffffc0200998:	481c                	lw	a5,16(s0)
ffffffffc020099a:	54079163          	bnez	a5,ffffffffc0200edc <best_fit_check+0x6be>
ffffffffc020099e:	854e                	mv	a0,s3
ffffffffc02009a0:	4585                	li	a1,1
ffffffffc02009a2:	01843023          	sd	s8,0(s0)
ffffffffc02009a6:	01743423          	sd	s7,8(s0)
ffffffffc02009aa:	01642823          	sw	s6,16(s0)
ffffffffc02009ae:	0f9000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc02009b2:	4585                	li	a1,1
ffffffffc02009b4:	8556                	mv	a0,s5
ffffffffc02009b6:	0f1000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc02009ba:	4585                	li	a1,1
ffffffffc02009bc:	8552                	mv	a0,s4
ffffffffc02009be:	0e9000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc02009c2:	4619                	li	a2,6
ffffffffc02009c4:	4585                	li	a1,1
ffffffffc02009c6:	00002517          	auipc	a0,0x2
ffffffffc02009ca:	98a50513          	addi	a0,a0,-1654 # ffffffffc0202350 <commands+0x6f0>
ffffffffc02009ce:	ee4ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02009d2:	4515                	li	a0,5
ffffffffc02009d4:	095000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc02009d8:	89aa                	mv	s3,a0
ffffffffc02009da:	4e050163          	beqz	a0,ffffffffc0200ebc <best_fit_check+0x69e>
ffffffffc02009de:	651c                	ld	a5,8(a0)
ffffffffc02009e0:	8385                	srli	a5,a5,0x1
ffffffffc02009e2:	8b85                	andi	a5,a5,1
ffffffffc02009e4:	4a079c63          	bnez	a5,ffffffffc0200e9c <best_fit_check+0x67e>
ffffffffc02009e8:	4619                	li	a2,6
ffffffffc02009ea:	4589                	li	a1,2
ffffffffc02009ec:	00002517          	auipc	a0,0x2
ffffffffc02009f0:	96450513          	addi	a0,a0,-1692 # ffffffffc0202350 <commands+0x6f0>
ffffffffc02009f4:	ebeff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02009f8:	4505                	li	a0,1
ffffffffc02009fa:	00043a83          	ld	s5,0(s0)
ffffffffc02009fe:	00843a03          	ld	s4,8(s0)
ffffffffc0200a02:	e000                	sd	s0,0(s0)
ffffffffc0200a04:	e400                	sd	s0,8(s0)
ffffffffc0200a06:	063000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200a0a:	46051963          	bnez	a0,ffffffffc0200e7c <best_fit_check+0x65e>
ffffffffc0200a0e:	4619                	li	a2,6
ffffffffc0200a10:	458d                	li	a1,3
ffffffffc0200a12:	00002517          	auipc	a0,0x2
ffffffffc0200a16:	93e50513          	addi	a0,a0,-1730 # ffffffffc0202350 <commands+0x6f0>
ffffffffc0200a1a:	e98ff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200a1e:	4589                	li	a1,2
ffffffffc0200a20:	02898513          	addi	a0,s3,40
ffffffffc0200a24:	01042b03          	lw	s6,16(s0)
ffffffffc0200a28:	0a098c13          	addi	s8,s3,160
ffffffffc0200a2c:	00005797          	auipc	a5,0x5
ffffffffc0200a30:	5e07aa23          	sw	zero,1524(a5) # ffffffffc0206020 <free_area+0x10>
ffffffffc0200a34:	073000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc0200a38:	8562                	mv	a0,s8
ffffffffc0200a3a:	4585                	li	a1,1
ffffffffc0200a3c:	06b000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc0200a40:	4511                	li	a0,4
ffffffffc0200a42:	027000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200a46:	40051b63          	bnez	a0,ffffffffc0200e5c <best_fit_check+0x63e>
ffffffffc0200a4a:	0309b783          	ld	a5,48(s3)
ffffffffc0200a4e:	8385                	srli	a5,a5,0x1
ffffffffc0200a50:	8b85                	andi	a5,a5,1
ffffffffc0200a52:	3e078563          	beqz	a5,ffffffffc0200e3c <best_fit_check+0x61e>
ffffffffc0200a56:	0389a703          	lw	a4,56(s3)
ffffffffc0200a5a:	4789                	li	a5,2
ffffffffc0200a5c:	3ef71063          	bne	a4,a5,ffffffffc0200e3c <best_fit_check+0x61e>
ffffffffc0200a60:	4505                	li	a0,1
ffffffffc0200a62:	007000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200a66:	8baa                	mv	s7,a0
ffffffffc0200a68:	3a050a63          	beqz	a0,ffffffffc0200e1c <best_fit_check+0x5fe>
ffffffffc0200a6c:	4509                	li	a0,2
ffffffffc0200a6e:	7fa000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200a72:	38050563          	beqz	a0,ffffffffc0200dfc <best_fit_check+0x5de>
ffffffffc0200a76:	377c1363          	bne	s8,s7,ffffffffc0200ddc <best_fit_check+0x5be>
ffffffffc0200a7a:	4619                	li	a2,6
ffffffffc0200a7c:	4591                	li	a1,4
ffffffffc0200a7e:	00002517          	auipc	a0,0x2
ffffffffc0200a82:	8d250513          	addi	a0,a0,-1838 # ffffffffc0202350 <commands+0x6f0>
ffffffffc0200a86:	e2cff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200a8a:	854e                	mv	a0,s3
ffffffffc0200a8c:	4595                	li	a1,5
ffffffffc0200a8e:	019000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc0200a92:	4515                	li	a0,5
ffffffffc0200a94:	7d4000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200a98:	89aa                	mv	s3,a0
ffffffffc0200a9a:	32050163          	beqz	a0,ffffffffc0200dbc <best_fit_check+0x59e>
ffffffffc0200a9e:	4505                	li	a0,1
ffffffffc0200aa0:	7c8000ef          	jal	ra,ffffffffc0201268 <alloc_pages>
ffffffffc0200aa4:	2e051c63          	bnez	a0,ffffffffc0200d9c <best_fit_check+0x57e>
ffffffffc0200aa8:	4619                	li	a2,6
ffffffffc0200aaa:	4595                	li	a1,5
ffffffffc0200aac:	00002517          	auipc	a0,0x2
ffffffffc0200ab0:	8a450513          	addi	a0,a0,-1884 # ffffffffc0202350 <commands+0x6f0>
ffffffffc0200ab4:	dfeff0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0200ab8:	481c                	lw	a5,16(s0)
ffffffffc0200aba:	2c079163          	bnez	a5,ffffffffc0200d7c <best_fit_check+0x55e>
ffffffffc0200abe:	4595                	li	a1,5
ffffffffc0200ac0:	854e                	mv	a0,s3
ffffffffc0200ac2:	01642823          	sw	s6,16(s0)
ffffffffc0200ac6:	01543023          	sd	s5,0(s0)
ffffffffc0200aca:	01443423          	sd	s4,8(s0)
ffffffffc0200ace:	7d8000ef          	jal	ra,ffffffffc02012a6 <free_pages>
ffffffffc0200ad2:	641c                	ld	a5,8(s0)
ffffffffc0200ad4:	00878963          	beq	a5,s0,ffffffffc0200ae6 <best_fit_check+0x2c8>
ffffffffc0200ad8:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200adc:	679c                	ld	a5,8(a5)
ffffffffc0200ade:	397d                	addiw	s2,s2,-1
ffffffffc0200ae0:	9c99                	subw	s1,s1,a4
ffffffffc0200ae2:	fe879be3          	bne	a5,s0,ffffffffc0200ad8 <best_fit_check+0x2ba>
ffffffffc0200ae6:	26091b63          	bnez	s2,ffffffffc0200d5c <best_fit_check+0x53e>
ffffffffc0200aea:	0e049963          	bnez	s1,ffffffffc0200bdc <best_fit_check+0x3be>
ffffffffc0200aee:	6406                	ld	s0,64(sp)
ffffffffc0200af0:	60a6                	ld	ra,72(sp)
ffffffffc0200af2:	74e2                	ld	s1,56(sp)
ffffffffc0200af4:	7942                	ld	s2,48(sp)
ffffffffc0200af6:	79a2                	ld	s3,40(sp)
ffffffffc0200af8:	7a02                	ld	s4,32(sp)
ffffffffc0200afa:	6ae2                	ld	s5,24(sp)
ffffffffc0200afc:	6b42                	ld	s6,16(sp)
ffffffffc0200afe:	6ba2                	ld	s7,8(sp)
ffffffffc0200b00:	6c02                	ld	s8,0(sp)
ffffffffc0200b02:	4619                	li	a2,6
ffffffffc0200b04:	4599                	li	a1,6
ffffffffc0200b06:	00002517          	auipc	a0,0x2
ffffffffc0200b0a:	84a50513          	addi	a0,a0,-1974 # ffffffffc0202350 <commands+0x6f0>
ffffffffc0200b0e:	6161                	addi	sp,sp,80
ffffffffc0200b10:	da2ff06f          	j	ffffffffc02000b2 <cprintf>
ffffffffc0200b14:	4981                	li	s3,0
ffffffffc0200b16:	4481                	li	s1,0
ffffffffc0200b18:	4901                	li	s2,0
ffffffffc0200b1a:	b399                	j	ffffffffc0200860 <best_fit_check+0x42>
ffffffffc0200b1c:	00001697          	auipc	a3,0x1
ffffffffc0200b20:	63c68693          	addi	a3,a3,1596 # ffffffffc0202158 <commands+0x4f8>
ffffffffc0200b24:	00001617          	auipc	a2,0x1
ffffffffc0200b28:	64460613          	addi	a2,a2,1604 # ffffffffc0202168 <commands+0x508>
ffffffffc0200b2c:	0fe00593          	li	a1,254
ffffffffc0200b30:	00001517          	auipc	a0,0x1
ffffffffc0200b34:	65050513          	addi	a0,a0,1616 # ffffffffc0202180 <commands+0x520>
ffffffffc0200b38:	875ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200b3c:	00001697          	auipc	a3,0x1
ffffffffc0200b40:	6dc68693          	addi	a3,a3,1756 # ffffffffc0202218 <commands+0x5b8>
ffffffffc0200b44:	00001617          	auipc	a2,0x1
ffffffffc0200b48:	62460613          	addi	a2,a2,1572 # ffffffffc0202168 <commands+0x508>
ffffffffc0200b4c:	0c800593          	li	a1,200
ffffffffc0200b50:	00001517          	auipc	a0,0x1
ffffffffc0200b54:	63050513          	addi	a0,a0,1584 # ffffffffc0202180 <commands+0x520>
ffffffffc0200b58:	855ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200b5c:	00001697          	auipc	a3,0x1
ffffffffc0200b60:	6e468693          	addi	a3,a3,1764 # ffffffffc0202240 <commands+0x5e0>
ffffffffc0200b64:	00001617          	auipc	a2,0x1
ffffffffc0200b68:	60460613          	addi	a2,a2,1540 # ffffffffc0202168 <commands+0x508>
ffffffffc0200b6c:	0c900593          	li	a1,201
ffffffffc0200b70:	00001517          	auipc	a0,0x1
ffffffffc0200b74:	61050513          	addi	a0,a0,1552 # ffffffffc0202180 <commands+0x520>
ffffffffc0200b78:	835ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200b7c:	00001697          	auipc	a3,0x1
ffffffffc0200b80:	70468693          	addi	a3,a3,1796 # ffffffffc0202280 <commands+0x620>
ffffffffc0200b84:	00001617          	auipc	a2,0x1
ffffffffc0200b88:	5e460613          	addi	a2,a2,1508 # ffffffffc0202168 <commands+0x508>
ffffffffc0200b8c:	0cb00593          	li	a1,203
ffffffffc0200b90:	00001517          	auipc	a0,0x1
ffffffffc0200b94:	5f050513          	addi	a0,a0,1520 # ffffffffc0202180 <commands+0x520>
ffffffffc0200b98:	815ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200b9c:	00001697          	auipc	a3,0x1
ffffffffc0200ba0:	76c68693          	addi	a3,a3,1900 # ffffffffc0202308 <commands+0x6a8>
ffffffffc0200ba4:	00001617          	auipc	a2,0x1
ffffffffc0200ba8:	5c460613          	addi	a2,a2,1476 # ffffffffc0202168 <commands+0x508>
ffffffffc0200bac:	0e400593          	li	a1,228
ffffffffc0200bb0:	00001517          	auipc	a0,0x1
ffffffffc0200bb4:	5d050513          	addi	a0,a0,1488 # ffffffffc0202180 <commands+0x520>
ffffffffc0200bb8:	ff4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200bbc:	00001697          	auipc	a3,0x1
ffffffffc0200bc0:	63c68693          	addi	a3,a3,1596 # ffffffffc02021f8 <commands+0x598>
ffffffffc0200bc4:	00001617          	auipc	a2,0x1
ffffffffc0200bc8:	5a460613          	addi	a2,a2,1444 # ffffffffc0202168 <commands+0x508>
ffffffffc0200bcc:	0c600593          	li	a1,198
ffffffffc0200bd0:	00001517          	auipc	a0,0x1
ffffffffc0200bd4:	5b050513          	addi	a0,a0,1456 # ffffffffc0202180 <commands+0x520>
ffffffffc0200bd8:	fd4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200bdc:	00002697          	auipc	a3,0x2
ffffffffc0200be0:	87c68693          	addi	a3,a3,-1924 # ffffffffc0202458 <commands+0x7f8>
ffffffffc0200be4:	00001617          	auipc	a2,0x1
ffffffffc0200be8:	58460613          	addi	a2,a2,1412 # ffffffffc0202168 <commands+0x508>
ffffffffc0200bec:	14100593          	li	a1,321
ffffffffc0200bf0:	00001517          	auipc	a0,0x1
ffffffffc0200bf4:	59050513          	addi	a0,a0,1424 # ffffffffc0202180 <commands+0x520>
ffffffffc0200bf8:	fb4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200bfc:	00001697          	auipc	a3,0x1
ffffffffc0200c00:	59c68693          	addi	a3,a3,1436 # ffffffffc0202198 <commands+0x538>
ffffffffc0200c04:	00001617          	auipc	a2,0x1
ffffffffc0200c08:	56460613          	addi	a2,a2,1380 # ffffffffc0202168 <commands+0x508>
ffffffffc0200c0c:	10100593          	li	a1,257
ffffffffc0200c10:	00001517          	auipc	a0,0x1
ffffffffc0200c14:	57050513          	addi	a0,a0,1392 # ffffffffc0202180 <commands+0x520>
ffffffffc0200c18:	f94ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200c1c:	00001697          	auipc	a3,0x1
ffffffffc0200c20:	5bc68693          	addi	a3,a3,1468 # ffffffffc02021d8 <commands+0x578>
ffffffffc0200c24:	00001617          	auipc	a2,0x1
ffffffffc0200c28:	54460613          	addi	a2,a2,1348 # ffffffffc0202168 <commands+0x508>
ffffffffc0200c2c:	0c500593          	li	a1,197
ffffffffc0200c30:	00001517          	auipc	a0,0x1
ffffffffc0200c34:	55050513          	addi	a0,a0,1360 # ffffffffc0202180 <commands+0x520>
ffffffffc0200c38:	f74ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200c3c:	00001697          	auipc	a3,0x1
ffffffffc0200c40:	57c68693          	addi	a3,a3,1404 # ffffffffc02021b8 <commands+0x558>
ffffffffc0200c44:	00001617          	auipc	a2,0x1
ffffffffc0200c48:	52460613          	addi	a2,a2,1316 # ffffffffc0202168 <commands+0x508>
ffffffffc0200c4c:	0c400593          	li	a1,196
ffffffffc0200c50:	00001517          	auipc	a0,0x1
ffffffffc0200c54:	53050513          	addi	a0,a0,1328 # ffffffffc0202180 <commands+0x520>
ffffffffc0200c58:	f54ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200c5c:	00001697          	auipc	a3,0x1
ffffffffc0200c60:	68468693          	addi	a3,a3,1668 # ffffffffc02022e0 <commands+0x680>
ffffffffc0200c64:	00001617          	auipc	a2,0x1
ffffffffc0200c68:	50460613          	addi	a2,a2,1284 # ffffffffc0202168 <commands+0x508>
ffffffffc0200c6c:	0e100593          	li	a1,225
ffffffffc0200c70:	00001517          	auipc	a0,0x1
ffffffffc0200c74:	51050513          	addi	a0,a0,1296 # ffffffffc0202180 <commands+0x520>
ffffffffc0200c78:	f34ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200c7c:	00001697          	auipc	a3,0x1
ffffffffc0200c80:	57c68693          	addi	a3,a3,1404 # ffffffffc02021f8 <commands+0x598>
ffffffffc0200c84:	00001617          	auipc	a2,0x1
ffffffffc0200c88:	4e460613          	addi	a2,a2,1252 # ffffffffc0202168 <commands+0x508>
ffffffffc0200c8c:	0df00593          	li	a1,223
ffffffffc0200c90:	00001517          	auipc	a0,0x1
ffffffffc0200c94:	4f050513          	addi	a0,a0,1264 # ffffffffc0202180 <commands+0x520>
ffffffffc0200c98:	f14ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200c9c:	00001697          	auipc	a3,0x1
ffffffffc0200ca0:	53c68693          	addi	a3,a3,1340 # ffffffffc02021d8 <commands+0x578>
ffffffffc0200ca4:	00001617          	auipc	a2,0x1
ffffffffc0200ca8:	4c460613          	addi	a2,a2,1220 # ffffffffc0202168 <commands+0x508>
ffffffffc0200cac:	0de00593          	li	a1,222
ffffffffc0200cb0:	00001517          	auipc	a0,0x1
ffffffffc0200cb4:	4d050513          	addi	a0,a0,1232 # ffffffffc0202180 <commands+0x520>
ffffffffc0200cb8:	ef4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200cbc:	00001697          	auipc	a3,0x1
ffffffffc0200cc0:	4fc68693          	addi	a3,a3,1276 # ffffffffc02021b8 <commands+0x558>
ffffffffc0200cc4:	00001617          	auipc	a2,0x1
ffffffffc0200cc8:	4a460613          	addi	a2,a2,1188 # ffffffffc0202168 <commands+0x508>
ffffffffc0200ccc:	0dd00593          	li	a1,221
ffffffffc0200cd0:	00001517          	auipc	a0,0x1
ffffffffc0200cd4:	4b050513          	addi	a0,a0,1200 # ffffffffc0202180 <commands+0x520>
ffffffffc0200cd8:	ed4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200cdc:	00001697          	auipc	a3,0x1
ffffffffc0200ce0:	61c68693          	addi	a3,a3,1564 # ffffffffc02022f8 <commands+0x698>
ffffffffc0200ce4:	00001617          	auipc	a2,0x1
ffffffffc0200ce8:	48460613          	addi	a2,a2,1156 # ffffffffc0202168 <commands+0x508>
ffffffffc0200cec:	0db00593          	li	a1,219
ffffffffc0200cf0:	00001517          	auipc	a0,0x1
ffffffffc0200cf4:	49050513          	addi	a0,a0,1168 # ffffffffc0202180 <commands+0x520>
ffffffffc0200cf8:	eb4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200cfc:	00001697          	auipc	a3,0x1
ffffffffc0200d00:	5e468693          	addi	a3,a3,1508 # ffffffffc02022e0 <commands+0x680>
ffffffffc0200d04:	00001617          	auipc	a2,0x1
ffffffffc0200d08:	46460613          	addi	a2,a2,1124 # ffffffffc0202168 <commands+0x508>
ffffffffc0200d0c:	0d600593          	li	a1,214
ffffffffc0200d10:	00001517          	auipc	a0,0x1
ffffffffc0200d14:	47050513          	addi	a0,a0,1136 # ffffffffc0202180 <commands+0x520>
ffffffffc0200d18:	e94ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200d1c:	00001697          	auipc	a3,0x1
ffffffffc0200d20:	5a468693          	addi	a3,a3,1444 # ffffffffc02022c0 <commands+0x660>
ffffffffc0200d24:	00001617          	auipc	a2,0x1
ffffffffc0200d28:	44460613          	addi	a2,a2,1092 # ffffffffc0202168 <commands+0x508>
ffffffffc0200d2c:	0cd00593          	li	a1,205
ffffffffc0200d30:	00001517          	auipc	a0,0x1
ffffffffc0200d34:	45050513          	addi	a0,a0,1104 # ffffffffc0202180 <commands+0x520>
ffffffffc0200d38:	e74ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200d3c:	00001697          	auipc	a3,0x1
ffffffffc0200d40:	56468693          	addi	a3,a3,1380 # ffffffffc02022a0 <commands+0x640>
ffffffffc0200d44:	00001617          	auipc	a2,0x1
ffffffffc0200d48:	42460613          	addi	a2,a2,1060 # ffffffffc0202168 <commands+0x508>
ffffffffc0200d4c:	0cc00593          	li	a1,204
ffffffffc0200d50:	00001517          	auipc	a0,0x1
ffffffffc0200d54:	43050513          	addi	a0,a0,1072 # ffffffffc0202180 <commands+0x520>
ffffffffc0200d58:	e54ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200d5c:	00001697          	auipc	a3,0x1
ffffffffc0200d60:	6ec68693          	addi	a3,a3,1772 # ffffffffc0202448 <commands+0x7e8>
ffffffffc0200d64:	00001617          	auipc	a2,0x1
ffffffffc0200d68:	40460613          	addi	a2,a2,1028 # ffffffffc0202168 <commands+0x508>
ffffffffc0200d6c:	14000593          	li	a1,320
ffffffffc0200d70:	00001517          	auipc	a0,0x1
ffffffffc0200d74:	41050513          	addi	a0,a0,1040 # ffffffffc0202180 <commands+0x520>
ffffffffc0200d78:	e34ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200d7c:	00001697          	auipc	a3,0x1
ffffffffc0200d80:	5c468693          	addi	a3,a3,1476 # ffffffffc0202340 <commands+0x6e0>
ffffffffc0200d84:	00001617          	auipc	a2,0x1
ffffffffc0200d88:	3e460613          	addi	a2,a2,996 # ffffffffc0202168 <commands+0x508>
ffffffffc0200d8c:	13400593          	li	a1,308
ffffffffc0200d90:	00001517          	auipc	a0,0x1
ffffffffc0200d94:	3f050513          	addi	a0,a0,1008 # ffffffffc0202180 <commands+0x520>
ffffffffc0200d98:	e14ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200d9c:	00001697          	auipc	a3,0x1
ffffffffc0200da0:	54468693          	addi	a3,a3,1348 # ffffffffc02022e0 <commands+0x680>
ffffffffc0200da4:	00001617          	auipc	a2,0x1
ffffffffc0200da8:	3c460613          	addi	a2,a2,964 # ffffffffc0202168 <commands+0x508>
ffffffffc0200dac:	12e00593          	li	a1,302
ffffffffc0200db0:	00001517          	auipc	a0,0x1
ffffffffc0200db4:	3d050513          	addi	a0,a0,976 # ffffffffc0202180 <commands+0x520>
ffffffffc0200db8:	df4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200dbc:	00001697          	auipc	a3,0x1
ffffffffc0200dc0:	66c68693          	addi	a3,a3,1644 # ffffffffc0202428 <commands+0x7c8>
ffffffffc0200dc4:	00001617          	auipc	a2,0x1
ffffffffc0200dc8:	3a460613          	addi	a2,a2,932 # ffffffffc0202168 <commands+0x508>
ffffffffc0200dcc:	12d00593          	li	a1,301
ffffffffc0200dd0:	00001517          	auipc	a0,0x1
ffffffffc0200dd4:	3b050513          	addi	a0,a0,944 # ffffffffc0202180 <commands+0x520>
ffffffffc0200dd8:	dd4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200ddc:	00001697          	auipc	a3,0x1
ffffffffc0200de0:	63c68693          	addi	a3,a3,1596 # ffffffffc0202418 <commands+0x7b8>
ffffffffc0200de4:	00001617          	auipc	a2,0x1
ffffffffc0200de8:	38460613          	addi	a2,a2,900 # ffffffffc0202168 <commands+0x508>
ffffffffc0200dec:	12500593          	li	a1,293
ffffffffc0200df0:	00001517          	auipc	a0,0x1
ffffffffc0200df4:	39050513          	addi	a0,a0,912 # ffffffffc0202180 <commands+0x520>
ffffffffc0200df8:	db4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200dfc:	00001697          	auipc	a3,0x1
ffffffffc0200e00:	60468693          	addi	a3,a3,1540 # ffffffffc0202400 <commands+0x7a0>
ffffffffc0200e04:	00001617          	auipc	a2,0x1
ffffffffc0200e08:	36460613          	addi	a2,a2,868 # ffffffffc0202168 <commands+0x508>
ffffffffc0200e0c:	12400593          	li	a1,292
ffffffffc0200e10:	00001517          	auipc	a0,0x1
ffffffffc0200e14:	37050513          	addi	a0,a0,880 # ffffffffc0202180 <commands+0x520>
ffffffffc0200e18:	d94ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200e1c:	00001697          	auipc	a3,0x1
ffffffffc0200e20:	5c468693          	addi	a3,a3,1476 # ffffffffc02023e0 <commands+0x780>
ffffffffc0200e24:	00001617          	auipc	a2,0x1
ffffffffc0200e28:	34460613          	addi	a2,a2,836 # ffffffffc0202168 <commands+0x508>
ffffffffc0200e2c:	12300593          	li	a1,291
ffffffffc0200e30:	00001517          	auipc	a0,0x1
ffffffffc0200e34:	35050513          	addi	a0,a0,848 # ffffffffc0202180 <commands+0x520>
ffffffffc0200e38:	d74ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200e3c:	00001697          	auipc	a3,0x1
ffffffffc0200e40:	57468693          	addi	a3,a3,1396 # ffffffffc02023b0 <commands+0x750>
ffffffffc0200e44:	00001617          	auipc	a2,0x1
ffffffffc0200e48:	32460613          	addi	a2,a2,804 # ffffffffc0202168 <commands+0x508>
ffffffffc0200e4c:	12100593          	li	a1,289
ffffffffc0200e50:	00001517          	auipc	a0,0x1
ffffffffc0200e54:	33050513          	addi	a0,a0,816 # ffffffffc0202180 <commands+0x520>
ffffffffc0200e58:	d54ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200e5c:	00001697          	auipc	a3,0x1
ffffffffc0200e60:	53c68693          	addi	a3,a3,1340 # ffffffffc0202398 <commands+0x738>
ffffffffc0200e64:	00001617          	auipc	a2,0x1
ffffffffc0200e68:	30460613          	addi	a2,a2,772 # ffffffffc0202168 <commands+0x508>
ffffffffc0200e6c:	12000593          	li	a1,288
ffffffffc0200e70:	00001517          	auipc	a0,0x1
ffffffffc0200e74:	31050513          	addi	a0,a0,784 # ffffffffc0202180 <commands+0x520>
ffffffffc0200e78:	d34ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200e7c:	00001697          	auipc	a3,0x1
ffffffffc0200e80:	46468693          	addi	a3,a3,1124 # ffffffffc02022e0 <commands+0x680>
ffffffffc0200e84:	00001617          	auipc	a2,0x1
ffffffffc0200e88:	2e460613          	addi	a2,a2,740 # ffffffffc0202168 <commands+0x508>
ffffffffc0200e8c:	11400593          	li	a1,276
ffffffffc0200e90:	00001517          	auipc	a0,0x1
ffffffffc0200e94:	2f050513          	addi	a0,a0,752 # ffffffffc0202180 <commands+0x520>
ffffffffc0200e98:	d14ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200e9c:	00001697          	auipc	a3,0x1
ffffffffc0200ea0:	4e468693          	addi	a3,a3,1252 # ffffffffc0202380 <commands+0x720>
ffffffffc0200ea4:	00001617          	auipc	a2,0x1
ffffffffc0200ea8:	2c460613          	addi	a2,a2,708 # ffffffffc0202168 <commands+0x508>
ffffffffc0200eac:	10b00593          	li	a1,267
ffffffffc0200eb0:	00001517          	auipc	a0,0x1
ffffffffc0200eb4:	2d050513          	addi	a0,a0,720 # ffffffffc0202180 <commands+0x520>
ffffffffc0200eb8:	cf4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200ebc:	00001697          	auipc	a3,0x1
ffffffffc0200ec0:	4b468693          	addi	a3,a3,1204 # ffffffffc0202370 <commands+0x710>
ffffffffc0200ec4:	00001617          	auipc	a2,0x1
ffffffffc0200ec8:	2a460613          	addi	a2,a2,676 # ffffffffc0202168 <commands+0x508>
ffffffffc0200ecc:	10a00593          	li	a1,266
ffffffffc0200ed0:	00001517          	auipc	a0,0x1
ffffffffc0200ed4:	2b050513          	addi	a0,a0,688 # ffffffffc0202180 <commands+0x520>
ffffffffc0200ed8:	cd4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200edc:	00001697          	auipc	a3,0x1
ffffffffc0200ee0:	46468693          	addi	a3,a3,1124 # ffffffffc0202340 <commands+0x6e0>
ffffffffc0200ee4:	00001617          	auipc	a2,0x1
ffffffffc0200ee8:	28460613          	addi	a2,a2,644 # ffffffffc0202168 <commands+0x508>
ffffffffc0200eec:	0ea00593          	li	a1,234
ffffffffc0200ef0:	00001517          	auipc	a0,0x1
ffffffffc0200ef4:	29050513          	addi	a0,a0,656 # ffffffffc0202180 <commands+0x520>
ffffffffc0200ef8:	cb4ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200efc:	00001697          	auipc	a3,0x1
ffffffffc0200f00:	3e468693          	addi	a3,a3,996 # ffffffffc02022e0 <commands+0x680>
ffffffffc0200f04:	00001617          	auipc	a2,0x1
ffffffffc0200f08:	26460613          	addi	a2,a2,612 # ffffffffc0202168 <commands+0x508>
ffffffffc0200f0c:	0e800593          	li	a1,232
ffffffffc0200f10:	00001517          	auipc	a0,0x1
ffffffffc0200f14:	27050513          	addi	a0,a0,624 # ffffffffc0202180 <commands+0x520>
ffffffffc0200f18:	c94ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0200f1c:	00001697          	auipc	a3,0x1
ffffffffc0200f20:	40468693          	addi	a3,a3,1028 # ffffffffc0202320 <commands+0x6c0>
ffffffffc0200f24:	00001617          	auipc	a2,0x1
ffffffffc0200f28:	24460613          	addi	a2,a2,580 # ffffffffc0202168 <commands+0x508>
ffffffffc0200f2c:	0e700593          	li	a1,231
ffffffffc0200f30:	00001517          	auipc	a0,0x1
ffffffffc0200f34:	25050513          	addi	a0,a0,592 # ffffffffc0202180 <commands+0x520>
ffffffffc0200f38:	c74ff0ef          	jal	ra,ffffffffc02003ac <__panic>

ffffffffc0200f3c <best_fit_free_pages>:
ffffffffc0200f3c:	1141                	addi	sp,sp,-16
ffffffffc0200f3e:	e406                	sd	ra,8(sp)
ffffffffc0200f40:	14058a63          	beqz	a1,ffffffffc0201094 <best_fit_free_pages+0x158>
ffffffffc0200f44:	00259693          	slli	a3,a1,0x2
ffffffffc0200f48:	96ae                	add	a3,a3,a1
ffffffffc0200f4a:	068e                	slli	a3,a3,0x3
ffffffffc0200f4c:	96aa                	add	a3,a3,a0
ffffffffc0200f4e:	87aa                	mv	a5,a0
ffffffffc0200f50:	02d50263          	beq	a0,a3,ffffffffc0200f74 <best_fit_free_pages+0x38>
ffffffffc0200f54:	6798                	ld	a4,8(a5)
ffffffffc0200f56:	8b05                	andi	a4,a4,1
ffffffffc0200f58:	10071e63          	bnez	a4,ffffffffc0201074 <best_fit_free_pages+0x138>
ffffffffc0200f5c:	6798                	ld	a4,8(a5)
ffffffffc0200f5e:	8b09                	andi	a4,a4,2
ffffffffc0200f60:	10071a63          	bnez	a4,ffffffffc0201074 <best_fit_free_pages+0x138>
ffffffffc0200f64:	0007b423          	sd	zero,8(a5)
ffffffffc0200f68:	0007a023          	sw	zero,0(a5)
ffffffffc0200f6c:	02878793          	addi	a5,a5,40
ffffffffc0200f70:	fed792e3          	bne	a5,a3,ffffffffc0200f54 <best_fit_free_pages+0x18>
ffffffffc0200f74:	2581                	sext.w	a1,a1
ffffffffc0200f76:	c90c                	sw	a1,16(a0)
ffffffffc0200f78:	00850893          	addi	a7,a0,8
ffffffffc0200f7c:	4789                	li	a5,2
ffffffffc0200f7e:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0200f82:	00005697          	auipc	a3,0x5
ffffffffc0200f86:	08e68693          	addi	a3,a3,142 # ffffffffc0206010 <free_area>
ffffffffc0200f8a:	4a98                	lw	a4,16(a3)
ffffffffc0200f8c:	669c                	ld	a5,8(a3)
ffffffffc0200f8e:	01850613          	addi	a2,a0,24
ffffffffc0200f92:	9db9                	addw	a1,a1,a4
ffffffffc0200f94:	ca8c                	sw	a1,16(a3)
ffffffffc0200f96:	0ad78863          	beq	a5,a3,ffffffffc0201046 <best_fit_free_pages+0x10a>
ffffffffc0200f9a:	fe878713          	addi	a4,a5,-24
ffffffffc0200f9e:	0006b803          	ld	a6,0(a3)
ffffffffc0200fa2:	4581                	li	a1,0
ffffffffc0200fa4:	00e56a63          	bltu	a0,a4,ffffffffc0200fb8 <best_fit_free_pages+0x7c>
ffffffffc0200fa8:	6798                	ld	a4,8(a5)
ffffffffc0200faa:	06d70263          	beq	a4,a3,ffffffffc020100e <best_fit_free_pages+0xd2>
ffffffffc0200fae:	87ba                	mv	a5,a4
ffffffffc0200fb0:	fe878713          	addi	a4,a5,-24
ffffffffc0200fb4:	fee57ae3          	bgeu	a0,a4,ffffffffc0200fa8 <best_fit_free_pages+0x6c>
ffffffffc0200fb8:	c199                	beqz	a1,ffffffffc0200fbe <best_fit_free_pages+0x82>
ffffffffc0200fba:	0106b023          	sd	a6,0(a3)
ffffffffc0200fbe:	6398                	ld	a4,0(a5)
ffffffffc0200fc0:	e390                	sd	a2,0(a5)
ffffffffc0200fc2:	e710                	sd	a2,8(a4)
ffffffffc0200fc4:	f11c                	sd	a5,32(a0)
ffffffffc0200fc6:	ed18                	sd	a4,24(a0)
ffffffffc0200fc8:	02d70063          	beq	a4,a3,ffffffffc0200fe8 <best_fit_free_pages+0xac>
ffffffffc0200fcc:	ff872803          	lw	a6,-8(a4)
ffffffffc0200fd0:	fe870593          	addi	a1,a4,-24
ffffffffc0200fd4:	02081613          	slli	a2,a6,0x20
ffffffffc0200fd8:	9201                	srli	a2,a2,0x20
ffffffffc0200fda:	00261793          	slli	a5,a2,0x2
ffffffffc0200fde:	97b2                	add	a5,a5,a2
ffffffffc0200fe0:	078e                	slli	a5,a5,0x3
ffffffffc0200fe2:	97ae                	add	a5,a5,a1
ffffffffc0200fe4:	02f50f63          	beq	a0,a5,ffffffffc0201022 <best_fit_free_pages+0xe6>
ffffffffc0200fe8:	7118                	ld	a4,32(a0)
ffffffffc0200fea:	00d70f63          	beq	a4,a3,ffffffffc0201008 <best_fit_free_pages+0xcc>
ffffffffc0200fee:	490c                	lw	a1,16(a0)
ffffffffc0200ff0:	fe870693          	addi	a3,a4,-24
ffffffffc0200ff4:	02059613          	slli	a2,a1,0x20
ffffffffc0200ff8:	9201                	srli	a2,a2,0x20
ffffffffc0200ffa:	00261793          	slli	a5,a2,0x2
ffffffffc0200ffe:	97b2                	add	a5,a5,a2
ffffffffc0201000:	078e                	slli	a5,a5,0x3
ffffffffc0201002:	97aa                	add	a5,a5,a0
ffffffffc0201004:	04f68863          	beq	a3,a5,ffffffffc0201054 <best_fit_free_pages+0x118>
ffffffffc0201008:	60a2                	ld	ra,8(sp)
ffffffffc020100a:	0141                	addi	sp,sp,16
ffffffffc020100c:	8082                	ret
ffffffffc020100e:	e790                	sd	a2,8(a5)
ffffffffc0201010:	f114                	sd	a3,32(a0)
ffffffffc0201012:	6798                	ld	a4,8(a5)
ffffffffc0201014:	ed1c                	sd	a5,24(a0)
ffffffffc0201016:	02d70563          	beq	a4,a3,ffffffffc0201040 <best_fit_free_pages+0x104>
ffffffffc020101a:	8832                	mv	a6,a2
ffffffffc020101c:	4585                	li	a1,1
ffffffffc020101e:	87ba                	mv	a5,a4
ffffffffc0201020:	bf41                	j	ffffffffc0200fb0 <best_fit_free_pages+0x74>
ffffffffc0201022:	491c                	lw	a5,16(a0)
ffffffffc0201024:	0107883b          	addw	a6,a5,a6
ffffffffc0201028:	ff072c23          	sw	a6,-8(a4)
ffffffffc020102c:	57f5                	li	a5,-3
ffffffffc020102e:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201032:	6d10                	ld	a2,24(a0)
ffffffffc0201034:	711c                	ld	a5,32(a0)
ffffffffc0201036:	852e                	mv	a0,a1
ffffffffc0201038:	e61c                	sd	a5,8(a2)
ffffffffc020103a:	6718                	ld	a4,8(a4)
ffffffffc020103c:	e390                	sd	a2,0(a5)
ffffffffc020103e:	b775                	j	ffffffffc0200fea <best_fit_free_pages+0xae>
ffffffffc0201040:	e290                	sd	a2,0(a3)
ffffffffc0201042:	873e                	mv	a4,a5
ffffffffc0201044:	b761                	j	ffffffffc0200fcc <best_fit_free_pages+0x90>
ffffffffc0201046:	60a2                	ld	ra,8(sp)
ffffffffc0201048:	e390                	sd	a2,0(a5)
ffffffffc020104a:	e790                	sd	a2,8(a5)
ffffffffc020104c:	f11c                	sd	a5,32(a0)
ffffffffc020104e:	ed1c                	sd	a5,24(a0)
ffffffffc0201050:	0141                	addi	sp,sp,16
ffffffffc0201052:	8082                	ret
ffffffffc0201054:	ff872783          	lw	a5,-8(a4)
ffffffffc0201058:	ff070693          	addi	a3,a4,-16
ffffffffc020105c:	9dbd                	addw	a1,a1,a5
ffffffffc020105e:	c90c                	sw	a1,16(a0)
ffffffffc0201060:	57f5                	li	a5,-3
ffffffffc0201062:	60f6b02f          	amoand.d	zero,a5,(a3)
ffffffffc0201066:	6314                	ld	a3,0(a4)
ffffffffc0201068:	671c                	ld	a5,8(a4)
ffffffffc020106a:	60a2                	ld	ra,8(sp)
ffffffffc020106c:	e69c                	sd	a5,8(a3)
ffffffffc020106e:	e394                	sd	a3,0(a5)
ffffffffc0201070:	0141                	addi	sp,sp,16
ffffffffc0201072:	8082                	ret
ffffffffc0201074:	00001697          	auipc	a3,0x1
ffffffffc0201078:	3fc68693          	addi	a3,a3,1020 # ffffffffc0202470 <commands+0x810>
ffffffffc020107c:	00001617          	auipc	a2,0x1
ffffffffc0201080:	0ec60613          	addi	a2,a2,236 # ffffffffc0202168 <commands+0x508>
ffffffffc0201084:	08c00593          	li	a1,140
ffffffffc0201088:	00001517          	auipc	a0,0x1
ffffffffc020108c:	0f850513          	addi	a0,a0,248 # ffffffffc0202180 <commands+0x520>
ffffffffc0201090:	b1cff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0201094:	00001697          	auipc	a3,0x1
ffffffffc0201098:	3d468693          	addi	a3,a3,980 # ffffffffc0202468 <commands+0x808>
ffffffffc020109c:	00001617          	auipc	a2,0x1
ffffffffc02010a0:	0cc60613          	addi	a2,a2,204 # ffffffffc0202168 <commands+0x508>
ffffffffc02010a4:	08900593          	li	a1,137
ffffffffc02010a8:	00001517          	auipc	a0,0x1
ffffffffc02010ac:	0d850513          	addi	a0,a0,216 # ffffffffc0202180 <commands+0x520>
ffffffffc02010b0:	afcff0ef          	jal	ra,ffffffffc02003ac <__panic>

ffffffffc02010b4 <best_fit_alloc_pages>:
ffffffffc02010b4:	cd51                	beqz	a0,ffffffffc0201150 <best_fit_alloc_pages+0x9c>
ffffffffc02010b6:	00005617          	auipc	a2,0x5
ffffffffc02010ba:	f5a60613          	addi	a2,a2,-166 # ffffffffc0206010 <free_area>
ffffffffc02010be:	01062803          	lw	a6,16(a2)
ffffffffc02010c2:	86aa                	mv	a3,a0
ffffffffc02010c4:	02081793          	slli	a5,a6,0x20
ffffffffc02010c8:	9381                	srli	a5,a5,0x20
ffffffffc02010ca:	08a7e163          	bltu	a5,a0,ffffffffc020114c <best_fit_alloc_pages+0x98>
ffffffffc02010ce:	661c                	ld	a5,8(a2)
ffffffffc02010d0:	4501                	li	a0,0
ffffffffc02010d2:	06c78c63          	beq	a5,a2,ffffffffc020114a <best_fit_alloc_pages+0x96>
ffffffffc02010d6:	55fd                	li	a1,-1
ffffffffc02010d8:	ff87e703          	lwu	a4,-8(a5)
ffffffffc02010dc:	00d76763          	bltu	a4,a3,ffffffffc02010ea <best_fit_alloc_pages+0x36>
ffffffffc02010e0:	00b77563          	bgeu	a4,a1,ffffffffc02010ea <best_fit_alloc_pages+0x36>
ffffffffc02010e4:	fe878513          	addi	a0,a5,-24
ffffffffc02010e8:	85ba                	mv	a1,a4
ffffffffc02010ea:	679c                	ld	a5,8(a5)
ffffffffc02010ec:	fec796e3          	bne	a5,a2,ffffffffc02010d8 <best_fit_alloc_pages+0x24>
ffffffffc02010f0:	cd29                	beqz	a0,ffffffffc020114a <best_fit_alloc_pages+0x96>
ffffffffc02010f2:	711c                	ld	a5,32(a0)
ffffffffc02010f4:	6d18                	ld	a4,24(a0)
ffffffffc02010f6:	490c                	lw	a1,16(a0)
ffffffffc02010f8:	0006889b          	sext.w	a7,a3
ffffffffc02010fc:	e71c                	sd	a5,8(a4)
ffffffffc02010fe:	e398                	sd	a4,0(a5)
ffffffffc0201100:	02059793          	slli	a5,a1,0x20
ffffffffc0201104:	9381                	srli	a5,a5,0x20
ffffffffc0201106:	02f6f863          	bgeu	a3,a5,ffffffffc0201136 <best_fit_alloc_pages+0x82>
ffffffffc020110a:	00269793          	slli	a5,a3,0x2
ffffffffc020110e:	97b6                	add	a5,a5,a3
ffffffffc0201110:	078e                	slli	a5,a5,0x3
ffffffffc0201112:	97aa                	add	a5,a5,a0
ffffffffc0201114:	411585bb          	subw	a1,a1,a7
ffffffffc0201118:	cb8c                	sw	a1,16(a5)
ffffffffc020111a:	4689                	li	a3,2
ffffffffc020111c:	00878593          	addi	a1,a5,8
ffffffffc0201120:	40d5b02f          	amoor.d	zero,a3,(a1)
ffffffffc0201124:	6714                	ld	a3,8(a4)
ffffffffc0201126:	01878593          	addi	a1,a5,24
ffffffffc020112a:	01062803          	lw	a6,16(a2)
ffffffffc020112e:	e28c                	sd	a1,0(a3)
ffffffffc0201130:	e70c                	sd	a1,8(a4)
ffffffffc0201132:	f394                	sd	a3,32(a5)
ffffffffc0201134:	ef98                	sd	a4,24(a5)
ffffffffc0201136:	4118083b          	subw	a6,a6,a7
ffffffffc020113a:	01062823          	sw	a6,16(a2)
ffffffffc020113e:	57f5                	li	a5,-3
ffffffffc0201140:	00850713          	addi	a4,a0,8
ffffffffc0201144:	60f7302f          	amoand.d	zero,a5,(a4)
ffffffffc0201148:	8082                	ret
ffffffffc020114a:	8082                	ret
ffffffffc020114c:	4501                	li	a0,0
ffffffffc020114e:	8082                	ret
ffffffffc0201150:	1141                	addi	sp,sp,-16
ffffffffc0201152:	00001697          	auipc	a3,0x1
ffffffffc0201156:	31668693          	addi	a3,a3,790 # ffffffffc0202468 <commands+0x808>
ffffffffc020115a:	00001617          	auipc	a2,0x1
ffffffffc020115e:	00e60613          	addi	a2,a2,14 # ffffffffc0202168 <commands+0x508>
ffffffffc0201162:	06800593          	li	a1,104
ffffffffc0201166:	00001517          	auipc	a0,0x1
ffffffffc020116a:	01a50513          	addi	a0,a0,26 # ffffffffc0202180 <commands+0x520>
ffffffffc020116e:	e406                	sd	ra,8(sp)
ffffffffc0201170:	a3cff0ef          	jal	ra,ffffffffc02003ac <__panic>

ffffffffc0201174 <best_fit_init_memmap>:
ffffffffc0201174:	1141                	addi	sp,sp,-16
ffffffffc0201176:	e406                	sd	ra,8(sp)
ffffffffc0201178:	c9e1                	beqz	a1,ffffffffc0201248 <best_fit_init_memmap+0xd4>
ffffffffc020117a:	00259693          	slli	a3,a1,0x2
ffffffffc020117e:	96ae                	add	a3,a3,a1
ffffffffc0201180:	068e                	slli	a3,a3,0x3
ffffffffc0201182:	96aa                	add	a3,a3,a0
ffffffffc0201184:	87aa                	mv	a5,a0
ffffffffc0201186:	00d50f63          	beq	a0,a3,ffffffffc02011a4 <best_fit_init_memmap+0x30>
ffffffffc020118a:	6798                	ld	a4,8(a5)
ffffffffc020118c:	8b05                	andi	a4,a4,1
ffffffffc020118e:	cf49                	beqz	a4,ffffffffc0201228 <best_fit_init_memmap+0xb4>
ffffffffc0201190:	0007a823          	sw	zero,16(a5)
ffffffffc0201194:	0007b423          	sd	zero,8(a5)
ffffffffc0201198:	0007a023          	sw	zero,0(a5)
ffffffffc020119c:	02878793          	addi	a5,a5,40
ffffffffc02011a0:	fed795e3          	bne	a5,a3,ffffffffc020118a <best_fit_init_memmap+0x16>
ffffffffc02011a4:	2581                	sext.w	a1,a1
ffffffffc02011a6:	c90c                	sw	a1,16(a0)
ffffffffc02011a8:	4789                	li	a5,2
ffffffffc02011aa:	00850713          	addi	a4,a0,8
ffffffffc02011ae:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc02011b2:	00005697          	auipc	a3,0x5
ffffffffc02011b6:	e5e68693          	addi	a3,a3,-418 # ffffffffc0206010 <free_area>
ffffffffc02011ba:	4a98                	lw	a4,16(a3)
ffffffffc02011bc:	669c                	ld	a5,8(a3)
ffffffffc02011be:	01850613          	addi	a2,a0,24
ffffffffc02011c2:	9db9                	addw	a1,a1,a4
ffffffffc02011c4:	ca8c                	sw	a1,16(a3)
ffffffffc02011c6:	04d78a63          	beq	a5,a3,ffffffffc020121a <best_fit_init_memmap+0xa6>
ffffffffc02011ca:	fe878713          	addi	a4,a5,-24
ffffffffc02011ce:	0006b803          	ld	a6,0(a3)
ffffffffc02011d2:	4581                	li	a1,0
ffffffffc02011d4:	00e56a63          	bltu	a0,a4,ffffffffc02011e8 <best_fit_init_memmap+0x74>
ffffffffc02011d8:	6798                	ld	a4,8(a5)
ffffffffc02011da:	02d70263          	beq	a4,a3,ffffffffc02011fe <best_fit_init_memmap+0x8a>
ffffffffc02011de:	87ba                	mv	a5,a4
ffffffffc02011e0:	fe878713          	addi	a4,a5,-24
ffffffffc02011e4:	fee57ae3          	bgeu	a0,a4,ffffffffc02011d8 <best_fit_init_memmap+0x64>
ffffffffc02011e8:	c199                	beqz	a1,ffffffffc02011ee <best_fit_init_memmap+0x7a>
ffffffffc02011ea:	0106b023          	sd	a6,0(a3)
ffffffffc02011ee:	6398                	ld	a4,0(a5)
ffffffffc02011f0:	60a2                	ld	ra,8(sp)
ffffffffc02011f2:	e390                	sd	a2,0(a5)
ffffffffc02011f4:	e710                	sd	a2,8(a4)
ffffffffc02011f6:	f11c                	sd	a5,32(a0)
ffffffffc02011f8:	ed18                	sd	a4,24(a0)
ffffffffc02011fa:	0141                	addi	sp,sp,16
ffffffffc02011fc:	8082                	ret
ffffffffc02011fe:	e790                	sd	a2,8(a5)
ffffffffc0201200:	f114                	sd	a3,32(a0)
ffffffffc0201202:	6798                	ld	a4,8(a5)
ffffffffc0201204:	ed1c                	sd	a5,24(a0)
ffffffffc0201206:	00d70663          	beq	a4,a3,ffffffffc0201212 <best_fit_init_memmap+0x9e>
ffffffffc020120a:	8832                	mv	a6,a2
ffffffffc020120c:	4585                	li	a1,1
ffffffffc020120e:	87ba                	mv	a5,a4
ffffffffc0201210:	bfc1                	j	ffffffffc02011e0 <best_fit_init_memmap+0x6c>
ffffffffc0201212:	60a2                	ld	ra,8(sp)
ffffffffc0201214:	e290                	sd	a2,0(a3)
ffffffffc0201216:	0141                	addi	sp,sp,16
ffffffffc0201218:	8082                	ret
ffffffffc020121a:	60a2                	ld	ra,8(sp)
ffffffffc020121c:	e390                	sd	a2,0(a5)
ffffffffc020121e:	e790                	sd	a2,8(a5)
ffffffffc0201220:	f11c                	sd	a5,32(a0)
ffffffffc0201222:	ed1c                	sd	a5,24(a0)
ffffffffc0201224:	0141                	addi	sp,sp,16
ffffffffc0201226:	8082                	ret
ffffffffc0201228:	00001697          	auipc	a3,0x1
ffffffffc020122c:	27068693          	addi	a3,a3,624 # ffffffffc0202498 <commands+0x838>
ffffffffc0201230:	00001617          	auipc	a2,0x1
ffffffffc0201234:	f3860613          	addi	a2,a2,-200 # ffffffffc0202168 <commands+0x508>
ffffffffc0201238:	04d00593          	li	a1,77
ffffffffc020123c:	00001517          	auipc	a0,0x1
ffffffffc0201240:	f4450513          	addi	a0,a0,-188 # ffffffffc0202180 <commands+0x520>
ffffffffc0201244:	968ff0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0201248:	00001697          	auipc	a3,0x1
ffffffffc020124c:	22068693          	addi	a3,a3,544 # ffffffffc0202468 <commands+0x808>
ffffffffc0201250:	00001617          	auipc	a2,0x1
ffffffffc0201254:	f1860613          	addi	a2,a2,-232 # ffffffffc0202168 <commands+0x508>
ffffffffc0201258:	04a00593          	li	a1,74
ffffffffc020125c:	00001517          	auipc	a0,0x1
ffffffffc0201260:	f2450513          	addi	a0,a0,-220 # ffffffffc0202180 <commands+0x520>
ffffffffc0201264:	948ff0ef          	jal	ra,ffffffffc02003ac <__panic>

ffffffffc0201268 <alloc_pages>:
ffffffffc0201268:	100027f3          	csrr	a5,sstatus
ffffffffc020126c:	8b89                	andi	a5,a5,2
ffffffffc020126e:	e799                	bnez	a5,ffffffffc020127c <alloc_pages+0x14>
ffffffffc0201270:	00005797          	auipc	a5,0x5
ffffffffc0201274:	1d87b783          	ld	a5,472(a5) # ffffffffc0206448 <pmm_manager>
ffffffffc0201278:	6f9c                	ld	a5,24(a5)
ffffffffc020127a:	8782                	jr	a5
ffffffffc020127c:	1141                	addi	sp,sp,-16
ffffffffc020127e:	e406                	sd	ra,8(sp)
ffffffffc0201280:	e022                	sd	s0,0(sp)
ffffffffc0201282:	842a                	mv	s0,a0
ffffffffc0201284:	9daff0ef          	jal	ra,ffffffffc020045e <intr_disable>
ffffffffc0201288:	00005797          	auipc	a5,0x5
ffffffffc020128c:	1c07b783          	ld	a5,448(a5) # ffffffffc0206448 <pmm_manager>
ffffffffc0201290:	6f9c                	ld	a5,24(a5)
ffffffffc0201292:	8522                	mv	a0,s0
ffffffffc0201294:	9782                	jalr	a5
ffffffffc0201296:	842a                	mv	s0,a0
ffffffffc0201298:	9c0ff0ef          	jal	ra,ffffffffc0200458 <intr_enable>
ffffffffc020129c:	60a2                	ld	ra,8(sp)
ffffffffc020129e:	8522                	mv	a0,s0
ffffffffc02012a0:	6402                	ld	s0,0(sp)
ffffffffc02012a2:	0141                	addi	sp,sp,16
ffffffffc02012a4:	8082                	ret

ffffffffc02012a6 <free_pages>:
ffffffffc02012a6:	100027f3          	csrr	a5,sstatus
ffffffffc02012aa:	8b89                	andi	a5,a5,2
ffffffffc02012ac:	e799                	bnez	a5,ffffffffc02012ba <free_pages+0x14>
ffffffffc02012ae:	00005797          	auipc	a5,0x5
ffffffffc02012b2:	19a7b783          	ld	a5,410(a5) # ffffffffc0206448 <pmm_manager>
ffffffffc02012b6:	739c                	ld	a5,32(a5)
ffffffffc02012b8:	8782                	jr	a5
ffffffffc02012ba:	1101                	addi	sp,sp,-32
ffffffffc02012bc:	ec06                	sd	ra,24(sp)
ffffffffc02012be:	e822                	sd	s0,16(sp)
ffffffffc02012c0:	e426                	sd	s1,8(sp)
ffffffffc02012c2:	842a                	mv	s0,a0
ffffffffc02012c4:	84ae                	mv	s1,a1
ffffffffc02012c6:	998ff0ef          	jal	ra,ffffffffc020045e <intr_disable>
ffffffffc02012ca:	00005797          	auipc	a5,0x5
ffffffffc02012ce:	17e7b783          	ld	a5,382(a5) # ffffffffc0206448 <pmm_manager>
ffffffffc02012d2:	739c                	ld	a5,32(a5)
ffffffffc02012d4:	85a6                	mv	a1,s1
ffffffffc02012d6:	8522                	mv	a0,s0
ffffffffc02012d8:	9782                	jalr	a5
ffffffffc02012da:	6442                	ld	s0,16(sp)
ffffffffc02012dc:	60e2                	ld	ra,24(sp)
ffffffffc02012de:	64a2                	ld	s1,8(sp)
ffffffffc02012e0:	6105                	addi	sp,sp,32
ffffffffc02012e2:	976ff06f          	j	ffffffffc0200458 <intr_enable>

ffffffffc02012e6 <nr_free_pages>:
ffffffffc02012e6:	100027f3          	csrr	a5,sstatus
ffffffffc02012ea:	8b89                	andi	a5,a5,2
ffffffffc02012ec:	e799                	bnez	a5,ffffffffc02012fa <nr_free_pages+0x14>
ffffffffc02012ee:	00005797          	auipc	a5,0x5
ffffffffc02012f2:	15a7b783          	ld	a5,346(a5) # ffffffffc0206448 <pmm_manager>
ffffffffc02012f6:	779c                	ld	a5,40(a5)
ffffffffc02012f8:	8782                	jr	a5
ffffffffc02012fa:	1141                	addi	sp,sp,-16
ffffffffc02012fc:	e406                	sd	ra,8(sp)
ffffffffc02012fe:	e022                	sd	s0,0(sp)
ffffffffc0201300:	95eff0ef          	jal	ra,ffffffffc020045e <intr_disable>
ffffffffc0201304:	00005797          	auipc	a5,0x5
ffffffffc0201308:	1447b783          	ld	a5,324(a5) # ffffffffc0206448 <pmm_manager>
ffffffffc020130c:	779c                	ld	a5,40(a5)
ffffffffc020130e:	9782                	jalr	a5
ffffffffc0201310:	842a                	mv	s0,a0
ffffffffc0201312:	946ff0ef          	jal	ra,ffffffffc0200458 <intr_enable>
ffffffffc0201316:	60a2                	ld	ra,8(sp)
ffffffffc0201318:	8522                	mv	a0,s0
ffffffffc020131a:	6402                	ld	s0,0(sp)
ffffffffc020131c:	0141                	addi	sp,sp,16
ffffffffc020131e:	8082                	ret

ffffffffc0201320 <pmm_init>:
ffffffffc0201320:	00001797          	auipc	a5,0x1
ffffffffc0201324:	1a078793          	addi	a5,a5,416 # ffffffffc02024c0 <best_fit_pmm_manager>
ffffffffc0201328:	638c                	ld	a1,0(a5)
ffffffffc020132a:	1101                	addi	sp,sp,-32
ffffffffc020132c:	e426                	sd	s1,8(sp)
ffffffffc020132e:	00001517          	auipc	a0,0x1
ffffffffc0201332:	1ca50513          	addi	a0,a0,458 # ffffffffc02024f8 <best_fit_pmm_manager+0x38>
ffffffffc0201336:	00005497          	auipc	s1,0x5
ffffffffc020133a:	11248493          	addi	s1,s1,274 # ffffffffc0206448 <pmm_manager>
ffffffffc020133e:	ec06                	sd	ra,24(sp)
ffffffffc0201340:	e822                	sd	s0,16(sp)
ffffffffc0201342:	e09c                	sd	a5,0(s1)
ffffffffc0201344:	d6ffe0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0201348:	609c                	ld	a5,0(s1)
ffffffffc020134a:	00005417          	auipc	s0,0x5
ffffffffc020134e:	11640413          	addi	s0,s0,278 # ffffffffc0206460 <va_pa_offset>
ffffffffc0201352:	679c                	ld	a5,8(a5)
ffffffffc0201354:	9782                	jalr	a5
ffffffffc0201356:	57f5                	li	a5,-3
ffffffffc0201358:	07fa                	slli	a5,a5,0x1e
ffffffffc020135a:	00001517          	auipc	a0,0x1
ffffffffc020135e:	1b650513          	addi	a0,a0,438 # ffffffffc0202510 <best_fit_pmm_manager+0x50>
ffffffffc0201362:	e01c                	sd	a5,0(s0)
ffffffffc0201364:	d4ffe0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0201368:	46c5                	li	a3,17
ffffffffc020136a:	06ee                	slli	a3,a3,0x1b
ffffffffc020136c:	40100613          	li	a2,1025
ffffffffc0201370:	16fd                	addi	a3,a3,-1
ffffffffc0201372:	07e005b7          	lui	a1,0x7e00
ffffffffc0201376:	0656                	slli	a2,a2,0x15
ffffffffc0201378:	00001517          	auipc	a0,0x1
ffffffffc020137c:	1b050513          	addi	a0,a0,432 # ffffffffc0202528 <best_fit_pmm_manager+0x68>
ffffffffc0201380:	d33fe0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0201384:	777d                	lui	a4,0xfffff
ffffffffc0201386:	00006797          	auipc	a5,0x6
ffffffffc020138a:	0e978793          	addi	a5,a5,233 # ffffffffc020746f <end+0xfff>
ffffffffc020138e:	8ff9                	and	a5,a5,a4
ffffffffc0201390:	00005517          	auipc	a0,0x5
ffffffffc0201394:	0a850513          	addi	a0,a0,168 # ffffffffc0206438 <npage>
ffffffffc0201398:	00088737          	lui	a4,0x88
ffffffffc020139c:	00005597          	auipc	a1,0x5
ffffffffc02013a0:	0a458593          	addi	a1,a1,164 # ffffffffc0206440 <pages>
ffffffffc02013a4:	e118                	sd	a4,0(a0)
ffffffffc02013a6:	e19c                	sd	a5,0(a1)
ffffffffc02013a8:	4681                	li	a3,0
ffffffffc02013aa:	4701                	li	a4,0
ffffffffc02013ac:	4885                	li	a7,1
ffffffffc02013ae:	fff80837          	lui	a6,0xfff80
ffffffffc02013b2:	a011                	j	ffffffffc02013b6 <pmm_init+0x96>
ffffffffc02013b4:	619c                	ld	a5,0(a1)
ffffffffc02013b6:	97b6                	add	a5,a5,a3
ffffffffc02013b8:	07a1                	addi	a5,a5,8
ffffffffc02013ba:	4117b02f          	amoor.d	zero,a7,(a5)
ffffffffc02013be:	611c                	ld	a5,0(a0)
ffffffffc02013c0:	0705                	addi	a4,a4,1
ffffffffc02013c2:	02868693          	addi	a3,a3,40
ffffffffc02013c6:	01078633          	add	a2,a5,a6
ffffffffc02013ca:	fec765e3          	bltu	a4,a2,ffffffffc02013b4 <pmm_init+0x94>
ffffffffc02013ce:	6190                	ld	a2,0(a1)
ffffffffc02013d0:	00279713          	slli	a4,a5,0x2
ffffffffc02013d4:	973e                	add	a4,a4,a5
ffffffffc02013d6:	fec006b7          	lui	a3,0xfec00
ffffffffc02013da:	070e                	slli	a4,a4,0x3
ffffffffc02013dc:	96b2                	add	a3,a3,a2
ffffffffc02013de:	96ba                	add	a3,a3,a4
ffffffffc02013e0:	c0200737          	lui	a4,0xc0200
ffffffffc02013e4:	08e6ef63          	bltu	a3,a4,ffffffffc0201482 <pmm_init+0x162>
ffffffffc02013e8:	6018                	ld	a4,0(s0)
ffffffffc02013ea:	45c5                	li	a1,17
ffffffffc02013ec:	05ee                	slli	a1,a1,0x1b
ffffffffc02013ee:	8e99                	sub	a3,a3,a4
ffffffffc02013f0:	04b6e863          	bltu	a3,a1,ffffffffc0201440 <pmm_init+0x120>
ffffffffc02013f4:	609c                	ld	a5,0(s1)
ffffffffc02013f6:	7b9c                	ld	a5,48(a5)
ffffffffc02013f8:	9782                	jalr	a5
ffffffffc02013fa:	00001517          	auipc	a0,0x1
ffffffffc02013fe:	1c650513          	addi	a0,a0,454 # ffffffffc02025c0 <best_fit_pmm_manager+0x100>
ffffffffc0201402:	cb1fe0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc0201406:	00004597          	auipc	a1,0x4
ffffffffc020140a:	bfa58593          	addi	a1,a1,-1030 # ffffffffc0205000 <boot_page_table_sv39>
ffffffffc020140e:	00005797          	auipc	a5,0x5
ffffffffc0201412:	04b7b523          	sd	a1,74(a5) # ffffffffc0206458 <satp_virtual>
ffffffffc0201416:	c02007b7          	lui	a5,0xc0200
ffffffffc020141a:	08f5e063          	bltu	a1,a5,ffffffffc020149a <pmm_init+0x17a>
ffffffffc020141e:	6010                	ld	a2,0(s0)
ffffffffc0201420:	6442                	ld	s0,16(sp)
ffffffffc0201422:	60e2                	ld	ra,24(sp)
ffffffffc0201424:	64a2                	ld	s1,8(sp)
ffffffffc0201426:	40c58633          	sub	a2,a1,a2
ffffffffc020142a:	00005797          	auipc	a5,0x5
ffffffffc020142e:	02c7b323          	sd	a2,38(a5) # ffffffffc0206450 <satp_physical>
ffffffffc0201432:	00001517          	auipc	a0,0x1
ffffffffc0201436:	1ae50513          	addi	a0,a0,430 # ffffffffc02025e0 <best_fit_pmm_manager+0x120>
ffffffffc020143a:	6105                	addi	sp,sp,32
ffffffffc020143c:	c77fe06f          	j	ffffffffc02000b2 <cprintf>
ffffffffc0201440:	6705                	lui	a4,0x1
ffffffffc0201442:	177d                	addi	a4,a4,-1
ffffffffc0201444:	96ba                	add	a3,a3,a4
ffffffffc0201446:	777d                	lui	a4,0xfffff
ffffffffc0201448:	8ef9                	and	a3,a3,a4
ffffffffc020144a:	00c6d513          	srli	a0,a3,0xc
ffffffffc020144e:	00f57e63          	bgeu	a0,a5,ffffffffc020146a <pmm_init+0x14a>
ffffffffc0201452:	609c                	ld	a5,0(s1)
ffffffffc0201454:	982a                	add	a6,a6,a0
ffffffffc0201456:	00281513          	slli	a0,a6,0x2
ffffffffc020145a:	9542                	add	a0,a0,a6
ffffffffc020145c:	6b9c                	ld	a5,16(a5)
ffffffffc020145e:	8d95                	sub	a1,a1,a3
ffffffffc0201460:	050e                	slli	a0,a0,0x3
ffffffffc0201462:	81b1                	srli	a1,a1,0xc
ffffffffc0201464:	9532                	add	a0,a0,a2
ffffffffc0201466:	9782                	jalr	a5
ffffffffc0201468:	b771                	j	ffffffffc02013f4 <pmm_init+0xd4>
ffffffffc020146a:	00001617          	auipc	a2,0x1
ffffffffc020146e:	12660613          	addi	a2,a2,294 # ffffffffc0202590 <best_fit_pmm_manager+0xd0>
ffffffffc0201472:	06f00593          	li	a1,111
ffffffffc0201476:	00001517          	auipc	a0,0x1
ffffffffc020147a:	13a50513          	addi	a0,a0,314 # ffffffffc02025b0 <best_fit_pmm_manager+0xf0>
ffffffffc020147e:	f2ffe0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc0201482:	00001617          	auipc	a2,0x1
ffffffffc0201486:	0d660613          	addi	a2,a2,214 # ffffffffc0202558 <best_fit_pmm_manager+0x98>
ffffffffc020148a:	06e00593          	li	a1,110
ffffffffc020148e:	00001517          	auipc	a0,0x1
ffffffffc0201492:	0f250513          	addi	a0,a0,242 # ffffffffc0202580 <best_fit_pmm_manager+0xc0>
ffffffffc0201496:	f17fe0ef          	jal	ra,ffffffffc02003ac <__panic>
ffffffffc020149a:	86ae                	mv	a3,a1
ffffffffc020149c:	00001617          	auipc	a2,0x1
ffffffffc02014a0:	0bc60613          	addi	a2,a2,188 # ffffffffc0202558 <best_fit_pmm_manager+0x98>
ffffffffc02014a4:	08900593          	li	a1,137
ffffffffc02014a8:	00001517          	auipc	a0,0x1
ffffffffc02014ac:	0d850513          	addi	a0,a0,216 # ffffffffc0202580 <best_fit_pmm_manager+0xc0>
ffffffffc02014b0:	efdfe0ef          	jal	ra,ffffffffc02003ac <__panic>

ffffffffc02014b4 <printnum>:
ffffffffc02014b4:	02069813          	slli	a6,a3,0x20
ffffffffc02014b8:	7179                	addi	sp,sp,-48
ffffffffc02014ba:	02085813          	srli	a6,a6,0x20
ffffffffc02014be:	e052                	sd	s4,0(sp)
ffffffffc02014c0:	03067a33          	remu	s4,a2,a6
ffffffffc02014c4:	f022                	sd	s0,32(sp)
ffffffffc02014c6:	ec26                	sd	s1,24(sp)
ffffffffc02014c8:	e84a                	sd	s2,16(sp)
ffffffffc02014ca:	f406                	sd	ra,40(sp)
ffffffffc02014cc:	e44e                	sd	s3,8(sp)
ffffffffc02014ce:	84aa                	mv	s1,a0
ffffffffc02014d0:	892e                	mv	s2,a1
ffffffffc02014d2:	fff7041b          	addiw	s0,a4,-1
ffffffffc02014d6:	2a01                	sext.w	s4,s4
ffffffffc02014d8:	03067e63          	bgeu	a2,a6,ffffffffc0201514 <printnum+0x60>
ffffffffc02014dc:	89be                	mv	s3,a5
ffffffffc02014de:	00805763          	blez	s0,ffffffffc02014ec <printnum+0x38>
ffffffffc02014e2:	347d                	addiw	s0,s0,-1
ffffffffc02014e4:	85ca                	mv	a1,s2
ffffffffc02014e6:	854e                	mv	a0,s3
ffffffffc02014e8:	9482                	jalr	s1
ffffffffc02014ea:	fc65                	bnez	s0,ffffffffc02014e2 <printnum+0x2e>
ffffffffc02014ec:	1a02                	slli	s4,s4,0x20
ffffffffc02014ee:	00001797          	auipc	a5,0x1
ffffffffc02014f2:	13278793          	addi	a5,a5,306 # ffffffffc0202620 <best_fit_pmm_manager+0x160>
ffffffffc02014f6:	020a5a13          	srli	s4,s4,0x20
ffffffffc02014fa:	9a3e                	add	s4,s4,a5
ffffffffc02014fc:	7402                	ld	s0,32(sp)
ffffffffc02014fe:	000a4503          	lbu	a0,0(s4)
ffffffffc0201502:	70a2                	ld	ra,40(sp)
ffffffffc0201504:	69a2                	ld	s3,8(sp)
ffffffffc0201506:	6a02                	ld	s4,0(sp)
ffffffffc0201508:	85ca                	mv	a1,s2
ffffffffc020150a:	87a6                	mv	a5,s1
ffffffffc020150c:	6942                	ld	s2,16(sp)
ffffffffc020150e:	64e2                	ld	s1,24(sp)
ffffffffc0201510:	6145                	addi	sp,sp,48
ffffffffc0201512:	8782                	jr	a5
ffffffffc0201514:	03065633          	divu	a2,a2,a6
ffffffffc0201518:	8722                	mv	a4,s0
ffffffffc020151a:	f9bff0ef          	jal	ra,ffffffffc02014b4 <printnum>
ffffffffc020151e:	b7f9                	j	ffffffffc02014ec <printnum+0x38>

ffffffffc0201520 <vprintfmt>:
ffffffffc0201520:	7119                	addi	sp,sp,-128
ffffffffc0201522:	f4a6                	sd	s1,104(sp)
ffffffffc0201524:	f0ca                	sd	s2,96(sp)
ffffffffc0201526:	ecce                	sd	s3,88(sp)
ffffffffc0201528:	e8d2                	sd	s4,80(sp)
ffffffffc020152a:	e4d6                	sd	s5,72(sp)
ffffffffc020152c:	e0da                	sd	s6,64(sp)
ffffffffc020152e:	fc5e                	sd	s7,56(sp)
ffffffffc0201530:	f06a                	sd	s10,32(sp)
ffffffffc0201532:	fc86                	sd	ra,120(sp)
ffffffffc0201534:	f8a2                	sd	s0,112(sp)
ffffffffc0201536:	f862                	sd	s8,48(sp)
ffffffffc0201538:	f466                	sd	s9,40(sp)
ffffffffc020153a:	ec6e                	sd	s11,24(sp)
ffffffffc020153c:	892a                	mv	s2,a0
ffffffffc020153e:	84ae                	mv	s1,a1
ffffffffc0201540:	8d32                	mv	s10,a2
ffffffffc0201542:	8a36                	mv	s4,a3
ffffffffc0201544:	02500993          	li	s3,37
ffffffffc0201548:	5b7d                	li	s6,-1
ffffffffc020154a:	00001a97          	auipc	s5,0x1
ffffffffc020154e:	10aa8a93          	addi	s5,s5,266 # ffffffffc0202654 <best_fit_pmm_manager+0x194>
ffffffffc0201552:	00001b97          	auipc	s7,0x1
ffffffffc0201556:	2deb8b93          	addi	s7,s7,734 # ffffffffc0202830 <error_string>
ffffffffc020155a:	000d4503          	lbu	a0,0(s10)
ffffffffc020155e:	001d0413          	addi	s0,s10,1
ffffffffc0201562:	01350a63          	beq	a0,s3,ffffffffc0201576 <vprintfmt+0x56>
ffffffffc0201566:	c121                	beqz	a0,ffffffffc02015a6 <vprintfmt+0x86>
ffffffffc0201568:	85a6                	mv	a1,s1
ffffffffc020156a:	0405                	addi	s0,s0,1
ffffffffc020156c:	9902                	jalr	s2
ffffffffc020156e:	fff44503          	lbu	a0,-1(s0)
ffffffffc0201572:	ff351ae3          	bne	a0,s3,ffffffffc0201566 <vprintfmt+0x46>
ffffffffc0201576:	00044603          	lbu	a2,0(s0)
ffffffffc020157a:	02000793          	li	a5,32
ffffffffc020157e:	4c81                	li	s9,0
ffffffffc0201580:	4881                	li	a7,0
ffffffffc0201582:	5c7d                	li	s8,-1
ffffffffc0201584:	5dfd                	li	s11,-1
ffffffffc0201586:	05500513          	li	a0,85
ffffffffc020158a:	4825                	li	a6,9
ffffffffc020158c:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0201590:	0ff5f593          	andi	a1,a1,255
ffffffffc0201594:	00140d13          	addi	s10,s0,1
ffffffffc0201598:	04b56263          	bltu	a0,a1,ffffffffc02015dc <vprintfmt+0xbc>
ffffffffc020159c:	058a                	slli	a1,a1,0x2
ffffffffc020159e:	95d6                	add	a1,a1,s5
ffffffffc02015a0:	4194                	lw	a3,0(a1)
ffffffffc02015a2:	96d6                	add	a3,a3,s5
ffffffffc02015a4:	8682                	jr	a3
ffffffffc02015a6:	70e6                	ld	ra,120(sp)
ffffffffc02015a8:	7446                	ld	s0,112(sp)
ffffffffc02015aa:	74a6                	ld	s1,104(sp)
ffffffffc02015ac:	7906                	ld	s2,96(sp)
ffffffffc02015ae:	69e6                	ld	s3,88(sp)
ffffffffc02015b0:	6a46                	ld	s4,80(sp)
ffffffffc02015b2:	6aa6                	ld	s5,72(sp)
ffffffffc02015b4:	6b06                	ld	s6,64(sp)
ffffffffc02015b6:	7be2                	ld	s7,56(sp)
ffffffffc02015b8:	7c42                	ld	s8,48(sp)
ffffffffc02015ba:	7ca2                	ld	s9,40(sp)
ffffffffc02015bc:	7d02                	ld	s10,32(sp)
ffffffffc02015be:	6de2                	ld	s11,24(sp)
ffffffffc02015c0:	6109                	addi	sp,sp,128
ffffffffc02015c2:	8082                	ret
ffffffffc02015c4:	87b2                	mv	a5,a2
ffffffffc02015c6:	00144603          	lbu	a2,1(s0)
ffffffffc02015ca:	846a                	mv	s0,s10
ffffffffc02015cc:	00140d13          	addi	s10,s0,1
ffffffffc02015d0:	fdd6059b          	addiw	a1,a2,-35
ffffffffc02015d4:	0ff5f593          	andi	a1,a1,255
ffffffffc02015d8:	fcb572e3          	bgeu	a0,a1,ffffffffc020159c <vprintfmt+0x7c>
ffffffffc02015dc:	85a6                	mv	a1,s1
ffffffffc02015de:	02500513          	li	a0,37
ffffffffc02015e2:	9902                	jalr	s2
ffffffffc02015e4:	fff44783          	lbu	a5,-1(s0)
ffffffffc02015e8:	8d22                	mv	s10,s0
ffffffffc02015ea:	f73788e3          	beq	a5,s3,ffffffffc020155a <vprintfmt+0x3a>
ffffffffc02015ee:	ffed4783          	lbu	a5,-2(s10)
ffffffffc02015f2:	1d7d                	addi	s10,s10,-1
ffffffffc02015f4:	ff379de3          	bne	a5,s3,ffffffffc02015ee <vprintfmt+0xce>
ffffffffc02015f8:	b78d                	j	ffffffffc020155a <vprintfmt+0x3a>
ffffffffc02015fa:	fd060c1b          	addiw	s8,a2,-48
ffffffffc02015fe:	00144603          	lbu	a2,1(s0)
ffffffffc0201602:	846a                	mv	s0,s10
ffffffffc0201604:	fd06069b          	addiw	a3,a2,-48
ffffffffc0201608:	0006059b          	sext.w	a1,a2
ffffffffc020160c:	02d86463          	bltu	a6,a3,ffffffffc0201634 <vprintfmt+0x114>
ffffffffc0201610:	00144603          	lbu	a2,1(s0)
ffffffffc0201614:	002c169b          	slliw	a3,s8,0x2
ffffffffc0201618:	0186873b          	addw	a4,a3,s8
ffffffffc020161c:	0017171b          	slliw	a4,a4,0x1
ffffffffc0201620:	9f2d                	addw	a4,a4,a1
ffffffffc0201622:	fd06069b          	addiw	a3,a2,-48
ffffffffc0201626:	0405                	addi	s0,s0,1
ffffffffc0201628:	fd070c1b          	addiw	s8,a4,-48
ffffffffc020162c:	0006059b          	sext.w	a1,a2
ffffffffc0201630:	fed870e3          	bgeu	a6,a3,ffffffffc0201610 <vprintfmt+0xf0>
ffffffffc0201634:	f40ddce3          	bgez	s11,ffffffffc020158c <vprintfmt+0x6c>
ffffffffc0201638:	8de2                	mv	s11,s8
ffffffffc020163a:	5c7d                	li	s8,-1
ffffffffc020163c:	bf81                	j	ffffffffc020158c <vprintfmt+0x6c>
ffffffffc020163e:	fffdc693          	not	a3,s11
ffffffffc0201642:	96fd                	srai	a3,a3,0x3f
ffffffffc0201644:	00ddfdb3          	and	s11,s11,a3
ffffffffc0201648:	00144603          	lbu	a2,1(s0)
ffffffffc020164c:	2d81                	sext.w	s11,s11
ffffffffc020164e:	846a                	mv	s0,s10
ffffffffc0201650:	bf35                	j	ffffffffc020158c <vprintfmt+0x6c>
ffffffffc0201652:	000a2c03          	lw	s8,0(s4)
ffffffffc0201656:	00144603          	lbu	a2,1(s0)
ffffffffc020165a:	0a21                	addi	s4,s4,8
ffffffffc020165c:	846a                	mv	s0,s10
ffffffffc020165e:	bfd9                	j	ffffffffc0201634 <vprintfmt+0x114>
ffffffffc0201660:	4705                	li	a4,1
ffffffffc0201662:	008a0593          	addi	a1,s4,8
ffffffffc0201666:	01174463          	blt	a4,a7,ffffffffc020166e <vprintfmt+0x14e>
ffffffffc020166a:	1a088e63          	beqz	a7,ffffffffc0201826 <vprintfmt+0x306>
ffffffffc020166e:	000a3603          	ld	a2,0(s4)
ffffffffc0201672:	46c1                	li	a3,16
ffffffffc0201674:	8a2e                	mv	s4,a1
ffffffffc0201676:	2781                	sext.w	a5,a5
ffffffffc0201678:	876e                	mv	a4,s11
ffffffffc020167a:	85a6                	mv	a1,s1
ffffffffc020167c:	854a                	mv	a0,s2
ffffffffc020167e:	e37ff0ef          	jal	ra,ffffffffc02014b4 <printnum>
ffffffffc0201682:	bde1                	j	ffffffffc020155a <vprintfmt+0x3a>
ffffffffc0201684:	000a2503          	lw	a0,0(s4)
ffffffffc0201688:	85a6                	mv	a1,s1
ffffffffc020168a:	0a21                	addi	s4,s4,8
ffffffffc020168c:	9902                	jalr	s2
ffffffffc020168e:	b5f1                	j	ffffffffc020155a <vprintfmt+0x3a>
ffffffffc0201690:	4705                	li	a4,1
ffffffffc0201692:	008a0593          	addi	a1,s4,8
ffffffffc0201696:	01174463          	blt	a4,a7,ffffffffc020169e <vprintfmt+0x17e>
ffffffffc020169a:	18088163          	beqz	a7,ffffffffc020181c <vprintfmt+0x2fc>
ffffffffc020169e:	000a3603          	ld	a2,0(s4)
ffffffffc02016a2:	46a9                	li	a3,10
ffffffffc02016a4:	8a2e                	mv	s4,a1
ffffffffc02016a6:	bfc1                	j	ffffffffc0201676 <vprintfmt+0x156>
ffffffffc02016a8:	00144603          	lbu	a2,1(s0)
ffffffffc02016ac:	4c85                	li	s9,1
ffffffffc02016ae:	846a                	mv	s0,s10
ffffffffc02016b0:	bdf1                	j	ffffffffc020158c <vprintfmt+0x6c>
ffffffffc02016b2:	85a6                	mv	a1,s1
ffffffffc02016b4:	02500513          	li	a0,37
ffffffffc02016b8:	9902                	jalr	s2
ffffffffc02016ba:	b545                	j	ffffffffc020155a <vprintfmt+0x3a>
ffffffffc02016bc:	00144603          	lbu	a2,1(s0)
ffffffffc02016c0:	2885                	addiw	a7,a7,1
ffffffffc02016c2:	846a                	mv	s0,s10
ffffffffc02016c4:	b5e1                	j	ffffffffc020158c <vprintfmt+0x6c>
ffffffffc02016c6:	4705                	li	a4,1
ffffffffc02016c8:	008a0593          	addi	a1,s4,8
ffffffffc02016cc:	01174463          	blt	a4,a7,ffffffffc02016d4 <vprintfmt+0x1b4>
ffffffffc02016d0:	14088163          	beqz	a7,ffffffffc0201812 <vprintfmt+0x2f2>
ffffffffc02016d4:	000a3603          	ld	a2,0(s4)
ffffffffc02016d8:	46a1                	li	a3,8
ffffffffc02016da:	8a2e                	mv	s4,a1
ffffffffc02016dc:	bf69                	j	ffffffffc0201676 <vprintfmt+0x156>
ffffffffc02016de:	03000513          	li	a0,48
ffffffffc02016e2:	85a6                	mv	a1,s1
ffffffffc02016e4:	e03e                	sd	a5,0(sp)
ffffffffc02016e6:	9902                	jalr	s2
ffffffffc02016e8:	85a6                	mv	a1,s1
ffffffffc02016ea:	07800513          	li	a0,120
ffffffffc02016ee:	9902                	jalr	s2
ffffffffc02016f0:	0a21                	addi	s4,s4,8
ffffffffc02016f2:	6782                	ld	a5,0(sp)
ffffffffc02016f4:	46c1                	li	a3,16
ffffffffc02016f6:	ff8a3603          	ld	a2,-8(s4)
ffffffffc02016fa:	bfb5                	j	ffffffffc0201676 <vprintfmt+0x156>
ffffffffc02016fc:	000a3403          	ld	s0,0(s4)
ffffffffc0201700:	008a0713          	addi	a4,s4,8
ffffffffc0201704:	e03a                	sd	a4,0(sp)
ffffffffc0201706:	14040263          	beqz	s0,ffffffffc020184a <vprintfmt+0x32a>
ffffffffc020170a:	0fb05763          	blez	s11,ffffffffc02017f8 <vprintfmt+0x2d8>
ffffffffc020170e:	02d00693          	li	a3,45
ffffffffc0201712:	0cd79163          	bne	a5,a3,ffffffffc02017d4 <vprintfmt+0x2b4>
ffffffffc0201716:	00044783          	lbu	a5,0(s0)
ffffffffc020171a:	0007851b          	sext.w	a0,a5
ffffffffc020171e:	cf85                	beqz	a5,ffffffffc0201756 <vprintfmt+0x236>
ffffffffc0201720:	00140a13          	addi	s4,s0,1
ffffffffc0201724:	05e00413          	li	s0,94
ffffffffc0201728:	000c4563          	bltz	s8,ffffffffc0201732 <vprintfmt+0x212>
ffffffffc020172c:	3c7d                	addiw	s8,s8,-1
ffffffffc020172e:	036c0263          	beq	s8,s6,ffffffffc0201752 <vprintfmt+0x232>
ffffffffc0201732:	85a6                	mv	a1,s1
ffffffffc0201734:	0e0c8e63          	beqz	s9,ffffffffc0201830 <vprintfmt+0x310>
ffffffffc0201738:	3781                	addiw	a5,a5,-32
ffffffffc020173a:	0ef47b63          	bgeu	s0,a5,ffffffffc0201830 <vprintfmt+0x310>
ffffffffc020173e:	03f00513          	li	a0,63
ffffffffc0201742:	9902                	jalr	s2
ffffffffc0201744:	000a4783          	lbu	a5,0(s4)
ffffffffc0201748:	3dfd                	addiw	s11,s11,-1
ffffffffc020174a:	0a05                	addi	s4,s4,1
ffffffffc020174c:	0007851b          	sext.w	a0,a5
ffffffffc0201750:	ffe1                	bnez	a5,ffffffffc0201728 <vprintfmt+0x208>
ffffffffc0201752:	01b05963          	blez	s11,ffffffffc0201764 <vprintfmt+0x244>
ffffffffc0201756:	3dfd                	addiw	s11,s11,-1
ffffffffc0201758:	85a6                	mv	a1,s1
ffffffffc020175a:	02000513          	li	a0,32
ffffffffc020175e:	9902                	jalr	s2
ffffffffc0201760:	fe0d9be3          	bnez	s11,ffffffffc0201756 <vprintfmt+0x236>
ffffffffc0201764:	6a02                	ld	s4,0(sp)
ffffffffc0201766:	bbd5                	j	ffffffffc020155a <vprintfmt+0x3a>
ffffffffc0201768:	4705                	li	a4,1
ffffffffc020176a:	008a0c93          	addi	s9,s4,8
ffffffffc020176e:	01174463          	blt	a4,a7,ffffffffc0201776 <vprintfmt+0x256>
ffffffffc0201772:	08088d63          	beqz	a7,ffffffffc020180c <vprintfmt+0x2ec>
ffffffffc0201776:	000a3403          	ld	s0,0(s4)
ffffffffc020177a:	0a044d63          	bltz	s0,ffffffffc0201834 <vprintfmt+0x314>
ffffffffc020177e:	8622                	mv	a2,s0
ffffffffc0201780:	8a66                	mv	s4,s9
ffffffffc0201782:	46a9                	li	a3,10
ffffffffc0201784:	bdcd                	j	ffffffffc0201676 <vprintfmt+0x156>
ffffffffc0201786:	000a2783          	lw	a5,0(s4)
ffffffffc020178a:	4719                	li	a4,6
ffffffffc020178c:	0a21                	addi	s4,s4,8
ffffffffc020178e:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0201792:	8fb5                	xor	a5,a5,a3
ffffffffc0201794:	40d786bb          	subw	a3,a5,a3
ffffffffc0201798:	02d74163          	blt	a4,a3,ffffffffc02017ba <vprintfmt+0x29a>
ffffffffc020179c:	00369793          	slli	a5,a3,0x3
ffffffffc02017a0:	97de                	add	a5,a5,s7
ffffffffc02017a2:	639c                	ld	a5,0(a5)
ffffffffc02017a4:	cb99                	beqz	a5,ffffffffc02017ba <vprintfmt+0x29a>
ffffffffc02017a6:	86be                	mv	a3,a5
ffffffffc02017a8:	00001617          	auipc	a2,0x1
ffffffffc02017ac:	ea860613          	addi	a2,a2,-344 # ffffffffc0202650 <best_fit_pmm_manager+0x190>
ffffffffc02017b0:	85a6                	mv	a1,s1
ffffffffc02017b2:	854a                	mv	a0,s2
ffffffffc02017b4:	0ce000ef          	jal	ra,ffffffffc0201882 <printfmt>
ffffffffc02017b8:	b34d                	j	ffffffffc020155a <vprintfmt+0x3a>
ffffffffc02017ba:	00001617          	auipc	a2,0x1
ffffffffc02017be:	e8660613          	addi	a2,a2,-378 # ffffffffc0202640 <best_fit_pmm_manager+0x180>
ffffffffc02017c2:	85a6                	mv	a1,s1
ffffffffc02017c4:	854a                	mv	a0,s2
ffffffffc02017c6:	0bc000ef          	jal	ra,ffffffffc0201882 <printfmt>
ffffffffc02017ca:	bb41                	j	ffffffffc020155a <vprintfmt+0x3a>
ffffffffc02017cc:	00001417          	auipc	s0,0x1
ffffffffc02017d0:	e6c40413          	addi	s0,s0,-404 # ffffffffc0202638 <best_fit_pmm_manager+0x178>
ffffffffc02017d4:	85e2                	mv	a1,s8
ffffffffc02017d6:	8522                	mv	a0,s0
ffffffffc02017d8:	e43e                	sd	a5,8(sp)
ffffffffc02017da:	1cc000ef          	jal	ra,ffffffffc02019a6 <strnlen>
ffffffffc02017de:	40ad8dbb          	subw	s11,s11,a0
ffffffffc02017e2:	01b05b63          	blez	s11,ffffffffc02017f8 <vprintfmt+0x2d8>
ffffffffc02017e6:	67a2                	ld	a5,8(sp)
ffffffffc02017e8:	00078a1b          	sext.w	s4,a5
ffffffffc02017ec:	3dfd                	addiw	s11,s11,-1
ffffffffc02017ee:	85a6                	mv	a1,s1
ffffffffc02017f0:	8552                	mv	a0,s4
ffffffffc02017f2:	9902                	jalr	s2
ffffffffc02017f4:	fe0d9ce3          	bnez	s11,ffffffffc02017ec <vprintfmt+0x2cc>
ffffffffc02017f8:	00044783          	lbu	a5,0(s0)
ffffffffc02017fc:	00140a13          	addi	s4,s0,1
ffffffffc0201800:	0007851b          	sext.w	a0,a5
ffffffffc0201804:	d3a5                	beqz	a5,ffffffffc0201764 <vprintfmt+0x244>
ffffffffc0201806:	05e00413          	li	s0,94
ffffffffc020180a:	bf39                	j	ffffffffc0201728 <vprintfmt+0x208>
ffffffffc020180c:	000a2403          	lw	s0,0(s4)
ffffffffc0201810:	b7ad                	j	ffffffffc020177a <vprintfmt+0x25a>
ffffffffc0201812:	000a6603          	lwu	a2,0(s4)
ffffffffc0201816:	46a1                	li	a3,8
ffffffffc0201818:	8a2e                	mv	s4,a1
ffffffffc020181a:	bdb1                	j	ffffffffc0201676 <vprintfmt+0x156>
ffffffffc020181c:	000a6603          	lwu	a2,0(s4)
ffffffffc0201820:	46a9                	li	a3,10
ffffffffc0201822:	8a2e                	mv	s4,a1
ffffffffc0201824:	bd89                	j	ffffffffc0201676 <vprintfmt+0x156>
ffffffffc0201826:	000a6603          	lwu	a2,0(s4)
ffffffffc020182a:	46c1                	li	a3,16
ffffffffc020182c:	8a2e                	mv	s4,a1
ffffffffc020182e:	b5a1                	j	ffffffffc0201676 <vprintfmt+0x156>
ffffffffc0201830:	9902                	jalr	s2
ffffffffc0201832:	bf09                	j	ffffffffc0201744 <vprintfmt+0x224>
ffffffffc0201834:	85a6                	mv	a1,s1
ffffffffc0201836:	02d00513          	li	a0,45
ffffffffc020183a:	e03e                	sd	a5,0(sp)
ffffffffc020183c:	9902                	jalr	s2
ffffffffc020183e:	6782                	ld	a5,0(sp)
ffffffffc0201840:	8a66                	mv	s4,s9
ffffffffc0201842:	40800633          	neg	a2,s0
ffffffffc0201846:	46a9                	li	a3,10
ffffffffc0201848:	b53d                	j	ffffffffc0201676 <vprintfmt+0x156>
ffffffffc020184a:	03b05163          	blez	s11,ffffffffc020186c <vprintfmt+0x34c>
ffffffffc020184e:	02d00693          	li	a3,45
ffffffffc0201852:	f6d79de3          	bne	a5,a3,ffffffffc02017cc <vprintfmt+0x2ac>
ffffffffc0201856:	00001417          	auipc	s0,0x1
ffffffffc020185a:	de240413          	addi	s0,s0,-542 # ffffffffc0202638 <best_fit_pmm_manager+0x178>
ffffffffc020185e:	02800793          	li	a5,40
ffffffffc0201862:	02800513          	li	a0,40
ffffffffc0201866:	00140a13          	addi	s4,s0,1
ffffffffc020186a:	bd6d                	j	ffffffffc0201724 <vprintfmt+0x204>
ffffffffc020186c:	00001a17          	auipc	s4,0x1
ffffffffc0201870:	dcda0a13          	addi	s4,s4,-563 # ffffffffc0202639 <best_fit_pmm_manager+0x179>
ffffffffc0201874:	02800513          	li	a0,40
ffffffffc0201878:	02800793          	li	a5,40
ffffffffc020187c:	05e00413          	li	s0,94
ffffffffc0201880:	b565                	j	ffffffffc0201728 <vprintfmt+0x208>

ffffffffc0201882 <printfmt>:
ffffffffc0201882:	715d                	addi	sp,sp,-80
ffffffffc0201884:	02810313          	addi	t1,sp,40
ffffffffc0201888:	f436                	sd	a3,40(sp)
ffffffffc020188a:	869a                	mv	a3,t1
ffffffffc020188c:	ec06                	sd	ra,24(sp)
ffffffffc020188e:	f83a                	sd	a4,48(sp)
ffffffffc0201890:	fc3e                	sd	a5,56(sp)
ffffffffc0201892:	e0c2                	sd	a6,64(sp)
ffffffffc0201894:	e4c6                	sd	a7,72(sp)
ffffffffc0201896:	e41a                	sd	t1,8(sp)
ffffffffc0201898:	c89ff0ef          	jal	ra,ffffffffc0201520 <vprintfmt>
ffffffffc020189c:	60e2                	ld	ra,24(sp)
ffffffffc020189e:	6161                	addi	sp,sp,80
ffffffffc02018a0:	8082                	ret

ffffffffc02018a2 <readline>:
ffffffffc02018a2:	715d                	addi	sp,sp,-80
ffffffffc02018a4:	e486                	sd	ra,72(sp)
ffffffffc02018a6:	e0a6                	sd	s1,64(sp)
ffffffffc02018a8:	fc4a                	sd	s2,56(sp)
ffffffffc02018aa:	f84e                	sd	s3,48(sp)
ffffffffc02018ac:	f452                	sd	s4,40(sp)
ffffffffc02018ae:	f056                	sd	s5,32(sp)
ffffffffc02018b0:	ec5a                	sd	s6,24(sp)
ffffffffc02018b2:	e85e                	sd	s7,16(sp)
ffffffffc02018b4:	c901                	beqz	a0,ffffffffc02018c4 <readline+0x22>
ffffffffc02018b6:	85aa                	mv	a1,a0
ffffffffc02018b8:	00001517          	auipc	a0,0x1
ffffffffc02018bc:	d9850513          	addi	a0,a0,-616 # ffffffffc0202650 <best_fit_pmm_manager+0x190>
ffffffffc02018c0:	ff2fe0ef          	jal	ra,ffffffffc02000b2 <cprintf>
ffffffffc02018c4:	4481                	li	s1,0
ffffffffc02018c6:	497d                	li	s2,31
ffffffffc02018c8:	49a1                	li	s3,8
ffffffffc02018ca:	4aa9                	li	s5,10
ffffffffc02018cc:	4b35                	li	s6,13
ffffffffc02018ce:	00004b97          	auipc	s7,0x4
ffffffffc02018d2:	75ab8b93          	addi	s7,s7,1882 # ffffffffc0206028 <buf>
ffffffffc02018d6:	3fe00a13          	li	s4,1022
ffffffffc02018da:	851fe0ef          	jal	ra,ffffffffc020012a <getchar>
ffffffffc02018de:	00054a63          	bltz	a0,ffffffffc02018f2 <readline+0x50>
ffffffffc02018e2:	00a95a63          	bge	s2,a0,ffffffffc02018f6 <readline+0x54>
ffffffffc02018e6:	029a5263          	bge	s4,s1,ffffffffc020190a <readline+0x68>
ffffffffc02018ea:	841fe0ef          	jal	ra,ffffffffc020012a <getchar>
ffffffffc02018ee:	fe055ae3          	bgez	a0,ffffffffc02018e2 <readline+0x40>
ffffffffc02018f2:	4501                	li	a0,0
ffffffffc02018f4:	a091                	j	ffffffffc0201938 <readline+0x96>
ffffffffc02018f6:	03351463          	bne	a0,s3,ffffffffc020191e <readline+0x7c>
ffffffffc02018fa:	e8a9                	bnez	s1,ffffffffc020194c <readline+0xaa>
ffffffffc02018fc:	82ffe0ef          	jal	ra,ffffffffc020012a <getchar>
ffffffffc0201900:	fe0549e3          	bltz	a0,ffffffffc02018f2 <readline+0x50>
ffffffffc0201904:	fea959e3          	bge	s2,a0,ffffffffc02018f6 <readline+0x54>
ffffffffc0201908:	4481                	li	s1,0
ffffffffc020190a:	e42a                	sd	a0,8(sp)
ffffffffc020190c:	fdcfe0ef          	jal	ra,ffffffffc02000e8 <cputchar>
ffffffffc0201910:	6522                	ld	a0,8(sp)
ffffffffc0201912:	009b87b3          	add	a5,s7,s1
ffffffffc0201916:	2485                	addiw	s1,s1,1
ffffffffc0201918:	00a78023          	sb	a0,0(a5)
ffffffffc020191c:	bf7d                	j	ffffffffc02018da <readline+0x38>
ffffffffc020191e:	01550463          	beq	a0,s5,ffffffffc0201926 <readline+0x84>
ffffffffc0201922:	fb651ce3          	bne	a0,s6,ffffffffc02018da <readline+0x38>
ffffffffc0201926:	fc2fe0ef          	jal	ra,ffffffffc02000e8 <cputchar>
ffffffffc020192a:	00004517          	auipc	a0,0x4
ffffffffc020192e:	6fe50513          	addi	a0,a0,1790 # ffffffffc0206028 <buf>
ffffffffc0201932:	94aa                	add	s1,s1,a0
ffffffffc0201934:	00048023          	sb	zero,0(s1)
ffffffffc0201938:	60a6                	ld	ra,72(sp)
ffffffffc020193a:	6486                	ld	s1,64(sp)
ffffffffc020193c:	7962                	ld	s2,56(sp)
ffffffffc020193e:	79c2                	ld	s3,48(sp)
ffffffffc0201940:	7a22                	ld	s4,40(sp)
ffffffffc0201942:	7a82                	ld	s5,32(sp)
ffffffffc0201944:	6b62                	ld	s6,24(sp)
ffffffffc0201946:	6bc2                	ld	s7,16(sp)
ffffffffc0201948:	6161                	addi	sp,sp,80
ffffffffc020194a:	8082                	ret
ffffffffc020194c:	4521                	li	a0,8
ffffffffc020194e:	f9afe0ef          	jal	ra,ffffffffc02000e8 <cputchar>
ffffffffc0201952:	34fd                	addiw	s1,s1,-1
ffffffffc0201954:	b759                	j	ffffffffc02018da <readline+0x38>

ffffffffc0201956 <sbi_console_putchar>:
ffffffffc0201956:	4781                	li	a5,0
ffffffffc0201958:	00004717          	auipc	a4,0x4
ffffffffc020195c:	6b073703          	ld	a4,1712(a4) # ffffffffc0206008 <SBI_CONSOLE_PUTCHAR>
ffffffffc0201960:	88ba                	mv	a7,a4
ffffffffc0201962:	852a                	mv	a0,a0
ffffffffc0201964:	85be                	mv	a1,a5
ffffffffc0201966:	863e                	mv	a2,a5
ffffffffc0201968:	00000073          	ecall
ffffffffc020196c:	87aa                	mv	a5,a0
ffffffffc020196e:	8082                	ret

ffffffffc0201970 <sbi_set_timer>:
ffffffffc0201970:	4781                	li	a5,0
ffffffffc0201972:	00005717          	auipc	a4,0x5
ffffffffc0201976:	af673703          	ld	a4,-1290(a4) # ffffffffc0206468 <SBI_SET_TIMER>
ffffffffc020197a:	88ba                	mv	a7,a4
ffffffffc020197c:	852a                	mv	a0,a0
ffffffffc020197e:	85be                	mv	a1,a5
ffffffffc0201980:	863e                	mv	a2,a5
ffffffffc0201982:	00000073          	ecall
ffffffffc0201986:	87aa                	mv	a5,a0
ffffffffc0201988:	8082                	ret

ffffffffc020198a <sbi_console_getchar>:
ffffffffc020198a:	4501                	li	a0,0
ffffffffc020198c:	00004797          	auipc	a5,0x4
ffffffffc0201990:	6747b783          	ld	a5,1652(a5) # ffffffffc0206000 <SBI_CONSOLE_GETCHAR>
ffffffffc0201994:	88be                	mv	a7,a5
ffffffffc0201996:	852a                	mv	a0,a0
ffffffffc0201998:	85aa                	mv	a1,a0
ffffffffc020199a:	862a                	mv	a2,a0
ffffffffc020199c:	00000073          	ecall
ffffffffc02019a0:	852a                	mv	a0,a0
ffffffffc02019a2:	2501                	sext.w	a0,a0
ffffffffc02019a4:	8082                	ret

ffffffffc02019a6 <strnlen>:
ffffffffc02019a6:	4781                	li	a5,0
ffffffffc02019a8:	e589                	bnez	a1,ffffffffc02019b2 <strnlen+0xc>
ffffffffc02019aa:	a811                	j	ffffffffc02019be <strnlen+0x18>
ffffffffc02019ac:	0785                	addi	a5,a5,1
ffffffffc02019ae:	00f58863          	beq	a1,a5,ffffffffc02019be <strnlen+0x18>
ffffffffc02019b2:	00f50733          	add	a4,a0,a5
ffffffffc02019b6:	00074703          	lbu	a4,0(a4)
ffffffffc02019ba:	fb6d                	bnez	a4,ffffffffc02019ac <strnlen+0x6>
ffffffffc02019bc:	85be                	mv	a1,a5
ffffffffc02019be:	852e                	mv	a0,a1
ffffffffc02019c0:	8082                	ret

ffffffffc02019c2 <strcmp>:
ffffffffc02019c2:	00054783          	lbu	a5,0(a0)
ffffffffc02019c6:	0005c703          	lbu	a4,0(a1)
ffffffffc02019ca:	cb89                	beqz	a5,ffffffffc02019dc <strcmp+0x1a>
ffffffffc02019cc:	0505                	addi	a0,a0,1
ffffffffc02019ce:	0585                	addi	a1,a1,1
ffffffffc02019d0:	fee789e3          	beq	a5,a4,ffffffffc02019c2 <strcmp>
ffffffffc02019d4:	0007851b          	sext.w	a0,a5
ffffffffc02019d8:	9d19                	subw	a0,a0,a4
ffffffffc02019da:	8082                	ret
ffffffffc02019dc:	4501                	li	a0,0
ffffffffc02019de:	bfed                	j	ffffffffc02019d8 <strcmp+0x16>

ffffffffc02019e0 <strchr>:
ffffffffc02019e0:	00054783          	lbu	a5,0(a0)
ffffffffc02019e4:	c799                	beqz	a5,ffffffffc02019f2 <strchr+0x12>
ffffffffc02019e6:	00f58763          	beq	a1,a5,ffffffffc02019f4 <strchr+0x14>
ffffffffc02019ea:	00154783          	lbu	a5,1(a0)
ffffffffc02019ee:	0505                	addi	a0,a0,1
ffffffffc02019f0:	fbfd                	bnez	a5,ffffffffc02019e6 <strchr+0x6>
ffffffffc02019f2:	4501                	li	a0,0
ffffffffc02019f4:	8082                	ret

ffffffffc02019f6 <memset>:
ffffffffc02019f6:	ca01                	beqz	a2,ffffffffc0201a06 <memset+0x10>
ffffffffc02019f8:	962a                	add	a2,a2,a0
ffffffffc02019fa:	87aa                	mv	a5,a0
ffffffffc02019fc:	0785                	addi	a5,a5,1
ffffffffc02019fe:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0201a02:	fec79de3          	bne	a5,a2,ffffffffc02019fc <memset+0x6>
ffffffffc0201a06:	8082                	ret
