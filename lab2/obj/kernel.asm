
bin/kernel：     文件格式 elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c02052b7          	lui	t0,0xc0205
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	01e31313          	slli	t1,t1,0x1e
ffffffffc020000c:	406282b3          	sub	t0,t0,t1
ffffffffc0200010:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200014:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200018:	03f31313          	slli	t1,t1,0x3f
ffffffffc020001c:	0062e2b3          	or	t0,t0,t1
ffffffffc0200020:	18029073          	csrw	satp,t0
ffffffffc0200024:	12000073          	sfence.vma
ffffffffc0200028:	c0205137          	lui	sp,0xc0205
ffffffffc020002c:	c02002b7          	lui	t0,0xc0200
ffffffffc0200030:	03628293          	addi	t0,t0,54 # ffffffffc0200036 <kern_init>
ffffffffc0200034:	8282                	jr	t0

ffffffffc0200036 <kern_init>:
ffffffffc0200036:	00006517          	auipc	a0,0x6
ffffffffc020003a:	fda50513          	addi	a0,a0,-38 # ffffffffc0206010 <edata>
ffffffffc020003e:	00006617          	auipc	a2,0x6
ffffffffc0200042:	43260613          	addi	a2,a2,1074 # ffffffffc0206470 <end>
ffffffffc0200046:	1141                	addi	sp,sp,-16
ffffffffc0200048:	8e09                	sub	a2,a2,a0
ffffffffc020004a:	4581                	li	a1,0
ffffffffc020004c:	e406                	sd	ra,8(sp)
ffffffffc020004e:	596010ef          	jal	ra,ffffffffc02015e4 <memset>
ffffffffc0200052:	3f8000ef          	jal	ra,ffffffffc020044a <cons_init>
ffffffffc0200056:	00002517          	auipc	a0,0x2
ffffffffc020005a:	aa250513          	addi	a0,a0,-1374 # ffffffffc0201af8 <etext+0x2>
ffffffffc020005e:	08e000ef          	jal	ra,ffffffffc02000ec <cputs>
ffffffffc0200062:	13a000ef          	jal	ra,ffffffffc020019c <print_kerninfo>
ffffffffc0200066:	3fe000ef          	jal	ra,ffffffffc0200464 <idt_init>
ffffffffc020006a:	069000ef          	jal	ra,ffffffffc02008d2 <pmm_init>
ffffffffc020006e:	3f6000ef          	jal	ra,ffffffffc0200464 <idt_init>
ffffffffc0200072:	396000ef          	jal	ra,ffffffffc0200408 <clock_init>
ffffffffc0200076:	3e2000ef          	jal	ra,ffffffffc0200458 <intr_enable>
ffffffffc020007a:	a001                	j	ffffffffc020007a <kern_init+0x44>

ffffffffc020007c <cputch>:
ffffffffc020007c:	1141                	addi	sp,sp,-16
ffffffffc020007e:	e022                	sd	s0,0(sp)
ffffffffc0200080:	e406                	sd	ra,8(sp)
ffffffffc0200082:	842e                	mv	s0,a1
ffffffffc0200084:	3c8000ef          	jal	ra,ffffffffc020044c <cons_putc>
ffffffffc0200088:	401c                	lw	a5,0(s0)
ffffffffc020008a:	60a2                	ld	ra,8(sp)
ffffffffc020008c:	2785                	addiw	a5,a5,1
ffffffffc020008e:	c01c                	sw	a5,0(s0)
ffffffffc0200090:	6402                	ld	s0,0(sp)
ffffffffc0200092:	0141                	addi	sp,sp,16
ffffffffc0200094:	8082                	ret

ffffffffc0200096 <vcprintf>:
ffffffffc0200096:	1101                	addi	sp,sp,-32
ffffffffc0200098:	86ae                	mv	a3,a1
ffffffffc020009a:	862a                	mv	a2,a0
ffffffffc020009c:	006c                	addi	a1,sp,12
ffffffffc020009e:	00000517          	auipc	a0,0x0
ffffffffc02000a2:	fde50513          	addi	a0,a0,-34 # ffffffffc020007c <cputch>
ffffffffc02000a6:	ec06                	sd	ra,24(sp)
ffffffffc02000a8:	c602                	sw	zero,12(sp)
ffffffffc02000aa:	5b8010ef          	jal	ra,ffffffffc0201662 <vprintfmt>
ffffffffc02000ae:	60e2                	ld	ra,24(sp)
ffffffffc02000b0:	4532                	lw	a0,12(sp)
ffffffffc02000b2:	6105                	addi	sp,sp,32
ffffffffc02000b4:	8082                	ret

ffffffffc02000b6 <cprintf>:
ffffffffc02000b6:	711d                	addi	sp,sp,-96
ffffffffc02000b8:	02810313          	addi	t1,sp,40 # ffffffffc0205028 <boot_page_table_sv39+0x28>
ffffffffc02000bc:	f42e                	sd	a1,40(sp)
ffffffffc02000be:	f832                	sd	a2,48(sp)
ffffffffc02000c0:	fc36                	sd	a3,56(sp)
ffffffffc02000c2:	862a                	mv	a2,a0
ffffffffc02000c4:	004c                	addi	a1,sp,4
ffffffffc02000c6:	00000517          	auipc	a0,0x0
ffffffffc02000ca:	fb650513          	addi	a0,a0,-74 # ffffffffc020007c <cputch>
ffffffffc02000ce:	869a                	mv	a3,t1
ffffffffc02000d0:	ec06                	sd	ra,24(sp)
ffffffffc02000d2:	e0ba                	sd	a4,64(sp)
ffffffffc02000d4:	e4be                	sd	a5,72(sp)
ffffffffc02000d6:	e8c2                	sd	a6,80(sp)
ffffffffc02000d8:	ecc6                	sd	a7,88(sp)
ffffffffc02000da:	e41a                	sd	t1,8(sp)
ffffffffc02000dc:	c202                	sw	zero,4(sp)
ffffffffc02000de:	584010ef          	jal	ra,ffffffffc0201662 <vprintfmt>
ffffffffc02000e2:	60e2                	ld	ra,24(sp)
ffffffffc02000e4:	4512                	lw	a0,4(sp)
ffffffffc02000e6:	6125                	addi	sp,sp,96
ffffffffc02000e8:	8082                	ret

ffffffffc02000ea <cputchar>:
ffffffffc02000ea:	a68d                	j	ffffffffc020044c <cons_putc>

ffffffffc02000ec <cputs>:
ffffffffc02000ec:	1101                	addi	sp,sp,-32
ffffffffc02000ee:	e822                	sd	s0,16(sp)
ffffffffc02000f0:	ec06                	sd	ra,24(sp)
ffffffffc02000f2:	e426                	sd	s1,8(sp)
ffffffffc02000f4:	842a                	mv	s0,a0
ffffffffc02000f6:	00054503          	lbu	a0,0(a0)
ffffffffc02000fa:	c51d                	beqz	a0,ffffffffc0200128 <cputs+0x3c>
ffffffffc02000fc:	0405                	addi	s0,s0,1
ffffffffc02000fe:	4485                	li	s1,1
ffffffffc0200100:	9c81                	subw	s1,s1,s0
ffffffffc0200102:	34a000ef          	jal	ra,ffffffffc020044c <cons_putc>
ffffffffc0200106:	008487bb          	addw	a5,s1,s0
ffffffffc020010a:	0405                	addi	s0,s0,1
ffffffffc020010c:	fff44503          	lbu	a0,-1(s0)
ffffffffc0200110:	f96d                	bnez	a0,ffffffffc0200102 <cputs+0x16>
ffffffffc0200112:	0017841b          	addiw	s0,a5,1
ffffffffc0200116:	4529                	li	a0,10
ffffffffc0200118:	334000ef          	jal	ra,ffffffffc020044c <cons_putc>
ffffffffc020011c:	8522                	mv	a0,s0
ffffffffc020011e:	60e2                	ld	ra,24(sp)
ffffffffc0200120:	6442                	ld	s0,16(sp)
ffffffffc0200122:	64a2                	ld	s1,8(sp)
ffffffffc0200124:	6105                	addi	sp,sp,32
ffffffffc0200126:	8082                	ret
ffffffffc0200128:	4405                	li	s0,1
ffffffffc020012a:	b7f5                	j	ffffffffc0200116 <cputs+0x2a>

ffffffffc020012c <getchar>:
ffffffffc020012c:	1141                	addi	sp,sp,-16
ffffffffc020012e:	e406                	sd	ra,8(sp)
ffffffffc0200130:	324000ef          	jal	ra,ffffffffc0200454 <cons_getc>
ffffffffc0200134:	dd75                	beqz	a0,ffffffffc0200130 <getchar+0x4>
ffffffffc0200136:	60a2                	ld	ra,8(sp)
ffffffffc0200138:	0141                	addi	sp,sp,16
ffffffffc020013a:	8082                	ret

ffffffffc020013c <__panic>:
ffffffffc020013c:	00006317          	auipc	t1,0x6
ffffffffc0200140:	2d430313          	addi	t1,t1,724 # ffffffffc0206410 <is_panic>
ffffffffc0200144:	00032303          	lw	t1,0(t1)
ffffffffc0200148:	715d                	addi	sp,sp,-80
ffffffffc020014a:	ec06                	sd	ra,24(sp)
ffffffffc020014c:	e822                	sd	s0,16(sp)
ffffffffc020014e:	f436                	sd	a3,40(sp)
ffffffffc0200150:	f83a                	sd	a4,48(sp)
ffffffffc0200152:	fc3e                	sd	a5,56(sp)
ffffffffc0200154:	e0c2                	sd	a6,64(sp)
ffffffffc0200156:	e4c6                	sd	a7,72(sp)
ffffffffc0200158:	02031c63          	bnez	t1,ffffffffc0200190 <__panic+0x54>
ffffffffc020015c:	4785                	li	a5,1
ffffffffc020015e:	8432                	mv	s0,a2
ffffffffc0200160:	00006717          	auipc	a4,0x6
ffffffffc0200164:	2af72823          	sw	a5,688(a4) # ffffffffc0206410 <is_panic>
ffffffffc0200168:	862e                	mv	a2,a1
ffffffffc020016a:	103c                	addi	a5,sp,40
ffffffffc020016c:	85aa                	mv	a1,a0
ffffffffc020016e:	00002517          	auipc	a0,0x2
ffffffffc0200172:	9aa50513          	addi	a0,a0,-1622 # ffffffffc0201b18 <etext+0x22>
ffffffffc0200176:	e43e                	sd	a5,8(sp)
ffffffffc0200178:	f3fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020017c:	65a2                	ld	a1,8(sp)
ffffffffc020017e:	8522                	mv	a0,s0
ffffffffc0200180:	f17ff0ef          	jal	ra,ffffffffc0200096 <vcprintf>
ffffffffc0200184:	00002517          	auipc	a0,0x2
ffffffffc0200188:	aac50513          	addi	a0,a0,-1364 # ffffffffc0201c30 <etext+0x13a>
ffffffffc020018c:	f2bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200190:	2ce000ef          	jal	ra,ffffffffc020045e <intr_disable>
ffffffffc0200194:	4501                	li	a0,0
ffffffffc0200196:	130000ef          	jal	ra,ffffffffc02002c6 <kmonitor>
ffffffffc020019a:	bfed                	j	ffffffffc0200194 <__panic+0x58>

ffffffffc020019c <print_kerninfo>:
ffffffffc020019c:	1141                	addi	sp,sp,-16
ffffffffc020019e:	00002517          	auipc	a0,0x2
ffffffffc02001a2:	9ca50513          	addi	a0,a0,-1590 # ffffffffc0201b68 <etext+0x72>
ffffffffc02001a6:	e406                	sd	ra,8(sp)
ffffffffc02001a8:	f0fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02001ac:	00000597          	auipc	a1,0x0
ffffffffc02001b0:	e8a58593          	addi	a1,a1,-374 # ffffffffc0200036 <kern_init>
ffffffffc02001b4:	00002517          	auipc	a0,0x2
ffffffffc02001b8:	9d450513          	addi	a0,a0,-1580 # ffffffffc0201b88 <etext+0x92>
ffffffffc02001bc:	efbff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02001c0:	00002597          	auipc	a1,0x2
ffffffffc02001c4:	93658593          	addi	a1,a1,-1738 # ffffffffc0201af6 <etext>
ffffffffc02001c8:	00002517          	auipc	a0,0x2
ffffffffc02001cc:	9e050513          	addi	a0,a0,-1568 # ffffffffc0201ba8 <etext+0xb2>
ffffffffc02001d0:	ee7ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02001d4:	00006597          	auipc	a1,0x6
ffffffffc02001d8:	e3c58593          	addi	a1,a1,-452 # ffffffffc0206010 <edata>
ffffffffc02001dc:	00002517          	auipc	a0,0x2
ffffffffc02001e0:	9ec50513          	addi	a0,a0,-1556 # ffffffffc0201bc8 <etext+0xd2>
ffffffffc02001e4:	ed3ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02001e8:	00006597          	auipc	a1,0x6
ffffffffc02001ec:	28858593          	addi	a1,a1,648 # ffffffffc0206470 <end>
ffffffffc02001f0:	00002517          	auipc	a0,0x2
ffffffffc02001f4:	9f850513          	addi	a0,a0,-1544 # ffffffffc0201be8 <etext+0xf2>
ffffffffc02001f8:	ebfff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02001fc:	00006597          	auipc	a1,0x6
ffffffffc0200200:	67358593          	addi	a1,a1,1651 # ffffffffc020686f <end+0x3ff>
ffffffffc0200204:	00000797          	auipc	a5,0x0
ffffffffc0200208:	e3278793          	addi	a5,a5,-462 # ffffffffc0200036 <kern_init>
ffffffffc020020c:	40f587b3          	sub	a5,a1,a5
ffffffffc0200210:	43f7d593          	srai	a1,a5,0x3f
ffffffffc0200214:	60a2                	ld	ra,8(sp)
ffffffffc0200216:	3ff5f593          	andi	a1,a1,1023
ffffffffc020021a:	95be                	add	a1,a1,a5
ffffffffc020021c:	85a9                	srai	a1,a1,0xa
ffffffffc020021e:	00002517          	auipc	a0,0x2
ffffffffc0200222:	9ea50513          	addi	a0,a0,-1558 # ffffffffc0201c08 <etext+0x112>
ffffffffc0200226:	0141                	addi	sp,sp,16
ffffffffc0200228:	b579                	j	ffffffffc02000b6 <cprintf>

ffffffffc020022a <print_stackframe>:
ffffffffc020022a:	1141                	addi	sp,sp,-16
ffffffffc020022c:	00002617          	auipc	a2,0x2
ffffffffc0200230:	90c60613          	addi	a2,a2,-1780 # ffffffffc0201b38 <etext+0x42>
ffffffffc0200234:	05b00593          	li	a1,91
ffffffffc0200238:	00002517          	auipc	a0,0x2
ffffffffc020023c:	91850513          	addi	a0,a0,-1768 # ffffffffc0201b50 <etext+0x5a>
ffffffffc0200240:	e406                	sd	ra,8(sp)
ffffffffc0200242:	efbff0ef          	jal	ra,ffffffffc020013c <__panic>

ffffffffc0200246 <mon_help>:
ffffffffc0200246:	1141                	addi	sp,sp,-16
ffffffffc0200248:	00002617          	auipc	a2,0x2
ffffffffc020024c:	ad060613          	addi	a2,a2,-1328 # ffffffffc0201d18 <commands+0xe0>
ffffffffc0200250:	00002597          	auipc	a1,0x2
ffffffffc0200254:	ae858593          	addi	a1,a1,-1304 # ffffffffc0201d38 <commands+0x100>
ffffffffc0200258:	00002517          	auipc	a0,0x2
ffffffffc020025c:	ae850513          	addi	a0,a0,-1304 # ffffffffc0201d40 <commands+0x108>
ffffffffc0200260:	e406                	sd	ra,8(sp)
ffffffffc0200262:	e55ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200266:	00002617          	auipc	a2,0x2
ffffffffc020026a:	aea60613          	addi	a2,a2,-1302 # ffffffffc0201d50 <commands+0x118>
ffffffffc020026e:	00002597          	auipc	a1,0x2
ffffffffc0200272:	b0a58593          	addi	a1,a1,-1270 # ffffffffc0201d78 <commands+0x140>
ffffffffc0200276:	00002517          	auipc	a0,0x2
ffffffffc020027a:	aca50513          	addi	a0,a0,-1334 # ffffffffc0201d40 <commands+0x108>
ffffffffc020027e:	e39ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200282:	00002617          	auipc	a2,0x2
ffffffffc0200286:	b0660613          	addi	a2,a2,-1274 # ffffffffc0201d88 <commands+0x150>
ffffffffc020028a:	00002597          	auipc	a1,0x2
ffffffffc020028e:	b1e58593          	addi	a1,a1,-1250 # ffffffffc0201da8 <commands+0x170>
ffffffffc0200292:	00002517          	auipc	a0,0x2
ffffffffc0200296:	aae50513          	addi	a0,a0,-1362 # ffffffffc0201d40 <commands+0x108>
ffffffffc020029a:	e1dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020029e:	60a2                	ld	ra,8(sp)
ffffffffc02002a0:	4501                	li	a0,0
ffffffffc02002a2:	0141                	addi	sp,sp,16
ffffffffc02002a4:	8082                	ret

ffffffffc02002a6 <mon_kerninfo>:
ffffffffc02002a6:	1141                	addi	sp,sp,-16
ffffffffc02002a8:	e406                	sd	ra,8(sp)
ffffffffc02002aa:	ef3ff0ef          	jal	ra,ffffffffc020019c <print_kerninfo>
ffffffffc02002ae:	60a2                	ld	ra,8(sp)
ffffffffc02002b0:	4501                	li	a0,0
ffffffffc02002b2:	0141                	addi	sp,sp,16
ffffffffc02002b4:	8082                	ret

ffffffffc02002b6 <mon_backtrace>:
ffffffffc02002b6:	1141                	addi	sp,sp,-16
ffffffffc02002b8:	e406                	sd	ra,8(sp)
ffffffffc02002ba:	f71ff0ef          	jal	ra,ffffffffc020022a <print_stackframe>
ffffffffc02002be:	60a2                	ld	ra,8(sp)
ffffffffc02002c0:	4501                	li	a0,0
ffffffffc02002c2:	0141                	addi	sp,sp,16
ffffffffc02002c4:	8082                	ret

ffffffffc02002c6 <kmonitor>:
ffffffffc02002c6:	7115                	addi	sp,sp,-224
ffffffffc02002c8:	e962                	sd	s8,144(sp)
ffffffffc02002ca:	8c2a                	mv	s8,a0
ffffffffc02002cc:	00002517          	auipc	a0,0x2
ffffffffc02002d0:	9b450513          	addi	a0,a0,-1612 # ffffffffc0201c80 <commands+0x48>
ffffffffc02002d4:	ed86                	sd	ra,216(sp)
ffffffffc02002d6:	e9a2                	sd	s0,208(sp)
ffffffffc02002d8:	e5a6                	sd	s1,200(sp)
ffffffffc02002da:	e1ca                	sd	s2,192(sp)
ffffffffc02002dc:	fd4e                	sd	s3,184(sp)
ffffffffc02002de:	f952                	sd	s4,176(sp)
ffffffffc02002e0:	f556                	sd	s5,168(sp)
ffffffffc02002e2:	f15a                	sd	s6,160(sp)
ffffffffc02002e4:	ed5e                	sd	s7,152(sp)
ffffffffc02002e6:	e566                	sd	s9,136(sp)
ffffffffc02002e8:	e16a                	sd	s10,128(sp)
ffffffffc02002ea:	dcdff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002ee:	00002517          	auipc	a0,0x2
ffffffffc02002f2:	9ba50513          	addi	a0,a0,-1606 # ffffffffc0201ca8 <commands+0x70>
ffffffffc02002f6:	dc1ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002fa:	000c0563          	beqz	s8,ffffffffc0200304 <kmonitor+0x3e>
ffffffffc02002fe:	8562                	mv	a0,s8
ffffffffc0200300:	342000ef          	jal	ra,ffffffffc0200642 <print_trapframe>
ffffffffc0200304:	00002c97          	auipc	s9,0x2
ffffffffc0200308:	934c8c93          	addi	s9,s9,-1740 # ffffffffc0201c38 <commands>
ffffffffc020030c:	00002997          	auipc	s3,0x2
ffffffffc0200310:	9c498993          	addi	s3,s3,-1596 # ffffffffc0201cd0 <commands+0x98>
ffffffffc0200314:	00002917          	auipc	s2,0x2
ffffffffc0200318:	9c490913          	addi	s2,s2,-1596 # ffffffffc0201cd8 <commands+0xa0>
ffffffffc020031c:	4a3d                	li	s4,15
ffffffffc020031e:	00002b17          	auipc	s6,0x2
ffffffffc0200322:	9c2b0b13          	addi	s6,s6,-1598 # ffffffffc0201ce0 <commands+0xa8>
ffffffffc0200326:	00002a97          	auipc	s5,0x2
ffffffffc020032a:	a12a8a93          	addi	s5,s5,-1518 # ffffffffc0201d38 <commands+0x100>
ffffffffc020032e:	4b8d                	li	s7,3
ffffffffc0200330:	854e                	mv	a0,s3
ffffffffc0200332:	6b0010ef          	jal	ra,ffffffffc02019e2 <readline>
ffffffffc0200336:	842a                	mv	s0,a0
ffffffffc0200338:	dd65                	beqz	a0,ffffffffc0200330 <kmonitor+0x6a>
ffffffffc020033a:	00054583          	lbu	a1,0(a0)
ffffffffc020033e:	4481                	li	s1,0
ffffffffc0200340:	c999                	beqz	a1,ffffffffc0200356 <kmonitor+0x90>
ffffffffc0200342:	854a                	mv	a0,s2
ffffffffc0200344:	282010ef          	jal	ra,ffffffffc02015c6 <strchr>
ffffffffc0200348:	c925                	beqz	a0,ffffffffc02003b8 <kmonitor+0xf2>
ffffffffc020034a:	00144583          	lbu	a1,1(s0)
ffffffffc020034e:	00040023          	sb	zero,0(s0)
ffffffffc0200352:	0405                	addi	s0,s0,1
ffffffffc0200354:	f5fd                	bnez	a1,ffffffffc0200342 <kmonitor+0x7c>
ffffffffc0200356:	dce9                	beqz	s1,ffffffffc0200330 <kmonitor+0x6a>
ffffffffc0200358:	6582                	ld	a1,0(sp)
ffffffffc020035a:	00002d17          	auipc	s10,0x2
ffffffffc020035e:	8ded0d13          	addi	s10,s10,-1826 # ffffffffc0201c38 <commands>
ffffffffc0200362:	8556                	mv	a0,s5
ffffffffc0200364:	4401                	li	s0,0
ffffffffc0200366:	0d61                	addi	s10,s10,24
ffffffffc0200368:	234010ef          	jal	ra,ffffffffc020159c <strcmp>
ffffffffc020036c:	c919                	beqz	a0,ffffffffc0200382 <kmonitor+0xbc>
ffffffffc020036e:	2405                	addiw	s0,s0,1
ffffffffc0200370:	09740463          	beq	s0,s7,ffffffffc02003f8 <kmonitor+0x132>
ffffffffc0200374:	000d3503          	ld	a0,0(s10)
ffffffffc0200378:	6582                	ld	a1,0(sp)
ffffffffc020037a:	0d61                	addi	s10,s10,24
ffffffffc020037c:	220010ef          	jal	ra,ffffffffc020159c <strcmp>
ffffffffc0200380:	f57d                	bnez	a0,ffffffffc020036e <kmonitor+0xa8>
ffffffffc0200382:	00141793          	slli	a5,s0,0x1
ffffffffc0200386:	97a2                	add	a5,a5,s0
ffffffffc0200388:	078e                	slli	a5,a5,0x3
ffffffffc020038a:	97e6                	add	a5,a5,s9
ffffffffc020038c:	6b9c                	ld	a5,16(a5)
ffffffffc020038e:	8662                	mv	a2,s8
ffffffffc0200390:	002c                	addi	a1,sp,8
ffffffffc0200392:	fff4851b          	addiw	a0,s1,-1
ffffffffc0200396:	9782                	jalr	a5
ffffffffc0200398:	f8055ce3          	bgez	a0,ffffffffc0200330 <kmonitor+0x6a>
ffffffffc020039c:	60ee                	ld	ra,216(sp)
ffffffffc020039e:	644e                	ld	s0,208(sp)
ffffffffc02003a0:	64ae                	ld	s1,200(sp)
ffffffffc02003a2:	690e                	ld	s2,192(sp)
ffffffffc02003a4:	79ea                	ld	s3,184(sp)
ffffffffc02003a6:	7a4a                	ld	s4,176(sp)
ffffffffc02003a8:	7aaa                	ld	s5,168(sp)
ffffffffc02003aa:	7b0a                	ld	s6,160(sp)
ffffffffc02003ac:	6bea                	ld	s7,152(sp)
ffffffffc02003ae:	6c4a                	ld	s8,144(sp)
ffffffffc02003b0:	6caa                	ld	s9,136(sp)
ffffffffc02003b2:	6d0a                	ld	s10,128(sp)
ffffffffc02003b4:	612d                	addi	sp,sp,224
ffffffffc02003b6:	8082                	ret
ffffffffc02003b8:	00044783          	lbu	a5,0(s0)
ffffffffc02003bc:	dfc9                	beqz	a5,ffffffffc0200356 <kmonitor+0x90>
ffffffffc02003be:	03448863          	beq	s1,s4,ffffffffc02003ee <kmonitor+0x128>
ffffffffc02003c2:	00349793          	slli	a5,s1,0x3
ffffffffc02003c6:	0118                	addi	a4,sp,128
ffffffffc02003c8:	97ba                	add	a5,a5,a4
ffffffffc02003ca:	f887b023          	sd	s0,-128(a5)
ffffffffc02003ce:	00044583          	lbu	a1,0(s0)
ffffffffc02003d2:	2485                	addiw	s1,s1,1
ffffffffc02003d4:	e591                	bnez	a1,ffffffffc02003e0 <kmonitor+0x11a>
ffffffffc02003d6:	b749                	j	ffffffffc0200358 <kmonitor+0x92>
ffffffffc02003d8:	0405                	addi	s0,s0,1
ffffffffc02003da:	00044583          	lbu	a1,0(s0)
ffffffffc02003de:	ddad                	beqz	a1,ffffffffc0200358 <kmonitor+0x92>
ffffffffc02003e0:	854a                	mv	a0,s2
ffffffffc02003e2:	1e4010ef          	jal	ra,ffffffffc02015c6 <strchr>
ffffffffc02003e6:	d96d                	beqz	a0,ffffffffc02003d8 <kmonitor+0x112>
ffffffffc02003e8:	00044583          	lbu	a1,0(s0)
ffffffffc02003ec:	bf91                	j	ffffffffc0200340 <kmonitor+0x7a>
ffffffffc02003ee:	45c1                	li	a1,16
ffffffffc02003f0:	855a                	mv	a0,s6
ffffffffc02003f2:	cc5ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003f6:	b7f1                	j	ffffffffc02003c2 <kmonitor+0xfc>
ffffffffc02003f8:	6582                	ld	a1,0(sp)
ffffffffc02003fa:	00002517          	auipc	a0,0x2
ffffffffc02003fe:	90650513          	addi	a0,a0,-1786 # ffffffffc0201d00 <commands+0xc8>
ffffffffc0200402:	cb5ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200406:	b72d                	j	ffffffffc0200330 <kmonitor+0x6a>

ffffffffc0200408 <clock_init>:
ffffffffc0200408:	1141                	addi	sp,sp,-16
ffffffffc020040a:	e406                	sd	ra,8(sp)
ffffffffc020040c:	02000793          	li	a5,32
ffffffffc0200410:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200414:	c0102573          	rdtime	a0
ffffffffc0200418:	67e1                	lui	a5,0x18
ffffffffc020041a:	6a078793          	addi	a5,a5,1696 # 186a0 <BASE_ADDRESS-0xffffffffc01e7960>
ffffffffc020041e:	953e                	add	a0,a0,a5
ffffffffc0200420:	69c010ef          	jal	ra,ffffffffc0201abc <sbi_set_timer>
ffffffffc0200424:	60a2                	ld	ra,8(sp)
ffffffffc0200426:	00006797          	auipc	a5,0x6
ffffffffc020042a:	0007b523          	sd	zero,10(a5) # ffffffffc0206430 <ticks>
ffffffffc020042e:	00002517          	auipc	a0,0x2
ffffffffc0200432:	98a50513          	addi	a0,a0,-1654 # ffffffffc0201db8 <commands+0x180>
ffffffffc0200436:	0141                	addi	sp,sp,16
ffffffffc0200438:	b9bd                	j	ffffffffc02000b6 <cprintf>

ffffffffc020043a <clock_set_next_event>:
ffffffffc020043a:	c0102573          	rdtime	a0
ffffffffc020043e:	67e1                	lui	a5,0x18
ffffffffc0200440:	6a078793          	addi	a5,a5,1696 # 186a0 <BASE_ADDRESS-0xffffffffc01e7960>
ffffffffc0200444:	953e                	add	a0,a0,a5
ffffffffc0200446:	6760106f          	j	ffffffffc0201abc <sbi_set_timer>

ffffffffc020044a <cons_init>:
ffffffffc020044a:	8082                	ret

ffffffffc020044c <cons_putc>:
ffffffffc020044c:	0ff57513          	andi	a0,a0,255
ffffffffc0200450:	6500106f          	j	ffffffffc0201aa0 <sbi_console_putchar>

ffffffffc0200454 <cons_getc>:
ffffffffc0200454:	6840106f          	j	ffffffffc0201ad8 <sbi_console_getchar>

ffffffffc0200458 <intr_enable>:
ffffffffc0200458:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc020045c:	8082                	ret

ffffffffc020045e <intr_disable>:
ffffffffc020045e:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200462:	8082                	ret

ffffffffc0200464 <idt_init>:
ffffffffc0200464:	14005073          	csrwi	sscratch,0
ffffffffc0200468:	00000797          	auipc	a5,0x0
ffffffffc020046c:	2ec78793          	addi	a5,a5,748 # ffffffffc0200754 <__alltraps>
ffffffffc0200470:	10579073          	csrw	stvec,a5
ffffffffc0200474:	8082                	ret

ffffffffc0200476 <print_regs>:
ffffffffc0200476:	610c                	ld	a1,0(a0)
ffffffffc0200478:	1141                	addi	sp,sp,-16
ffffffffc020047a:	e022                	sd	s0,0(sp)
ffffffffc020047c:	842a                	mv	s0,a0
ffffffffc020047e:	00002517          	auipc	a0,0x2
ffffffffc0200482:	a5250513          	addi	a0,a0,-1454 # ffffffffc0201ed0 <commands+0x298>
ffffffffc0200486:	e406                	sd	ra,8(sp)
ffffffffc0200488:	c2fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020048c:	640c                	ld	a1,8(s0)
ffffffffc020048e:	00002517          	auipc	a0,0x2
ffffffffc0200492:	a5a50513          	addi	a0,a0,-1446 # ffffffffc0201ee8 <commands+0x2b0>
ffffffffc0200496:	c21ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020049a:	680c                	ld	a1,16(s0)
ffffffffc020049c:	00002517          	auipc	a0,0x2
ffffffffc02004a0:	a6450513          	addi	a0,a0,-1436 # ffffffffc0201f00 <commands+0x2c8>
ffffffffc02004a4:	c13ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004a8:	6c0c                	ld	a1,24(s0)
ffffffffc02004aa:	00002517          	auipc	a0,0x2
ffffffffc02004ae:	a6e50513          	addi	a0,a0,-1426 # ffffffffc0201f18 <commands+0x2e0>
ffffffffc02004b2:	c05ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004b6:	700c                	ld	a1,32(s0)
ffffffffc02004b8:	00002517          	auipc	a0,0x2
ffffffffc02004bc:	a7850513          	addi	a0,a0,-1416 # ffffffffc0201f30 <commands+0x2f8>
ffffffffc02004c0:	bf7ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004c4:	740c                	ld	a1,40(s0)
ffffffffc02004c6:	00002517          	auipc	a0,0x2
ffffffffc02004ca:	a8250513          	addi	a0,a0,-1406 # ffffffffc0201f48 <commands+0x310>
ffffffffc02004ce:	be9ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004d2:	780c                	ld	a1,48(s0)
ffffffffc02004d4:	00002517          	auipc	a0,0x2
ffffffffc02004d8:	a8c50513          	addi	a0,a0,-1396 # ffffffffc0201f60 <commands+0x328>
ffffffffc02004dc:	bdbff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004e0:	7c0c                	ld	a1,56(s0)
ffffffffc02004e2:	00002517          	auipc	a0,0x2
ffffffffc02004e6:	a9650513          	addi	a0,a0,-1386 # ffffffffc0201f78 <commands+0x340>
ffffffffc02004ea:	bcdff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004ee:	602c                	ld	a1,64(s0)
ffffffffc02004f0:	00002517          	auipc	a0,0x2
ffffffffc02004f4:	aa050513          	addi	a0,a0,-1376 # ffffffffc0201f90 <commands+0x358>
ffffffffc02004f8:	bbfff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004fc:	642c                	ld	a1,72(s0)
ffffffffc02004fe:	00002517          	auipc	a0,0x2
ffffffffc0200502:	aaa50513          	addi	a0,a0,-1366 # ffffffffc0201fa8 <commands+0x370>
ffffffffc0200506:	bb1ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020050a:	682c                	ld	a1,80(s0)
ffffffffc020050c:	00002517          	auipc	a0,0x2
ffffffffc0200510:	ab450513          	addi	a0,a0,-1356 # ffffffffc0201fc0 <commands+0x388>
ffffffffc0200514:	ba3ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200518:	6c2c                	ld	a1,88(s0)
ffffffffc020051a:	00002517          	auipc	a0,0x2
ffffffffc020051e:	abe50513          	addi	a0,a0,-1346 # ffffffffc0201fd8 <commands+0x3a0>
ffffffffc0200522:	b95ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200526:	702c                	ld	a1,96(s0)
ffffffffc0200528:	00002517          	auipc	a0,0x2
ffffffffc020052c:	ac850513          	addi	a0,a0,-1336 # ffffffffc0201ff0 <commands+0x3b8>
ffffffffc0200530:	b87ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200534:	742c                	ld	a1,104(s0)
ffffffffc0200536:	00002517          	auipc	a0,0x2
ffffffffc020053a:	ad250513          	addi	a0,a0,-1326 # ffffffffc0202008 <commands+0x3d0>
ffffffffc020053e:	b79ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200542:	782c                	ld	a1,112(s0)
ffffffffc0200544:	00002517          	auipc	a0,0x2
ffffffffc0200548:	adc50513          	addi	a0,a0,-1316 # ffffffffc0202020 <commands+0x3e8>
ffffffffc020054c:	b6bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200550:	7c2c                	ld	a1,120(s0)
ffffffffc0200552:	00002517          	auipc	a0,0x2
ffffffffc0200556:	ae650513          	addi	a0,a0,-1306 # ffffffffc0202038 <commands+0x400>
ffffffffc020055a:	b5dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020055e:	604c                	ld	a1,128(s0)
ffffffffc0200560:	00002517          	auipc	a0,0x2
ffffffffc0200564:	af050513          	addi	a0,a0,-1296 # ffffffffc0202050 <commands+0x418>
ffffffffc0200568:	b4fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020056c:	644c                	ld	a1,136(s0)
ffffffffc020056e:	00002517          	auipc	a0,0x2
ffffffffc0200572:	afa50513          	addi	a0,a0,-1286 # ffffffffc0202068 <commands+0x430>
ffffffffc0200576:	b41ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020057a:	684c                	ld	a1,144(s0)
ffffffffc020057c:	00002517          	auipc	a0,0x2
ffffffffc0200580:	b0450513          	addi	a0,a0,-1276 # ffffffffc0202080 <commands+0x448>
ffffffffc0200584:	b33ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200588:	6c4c                	ld	a1,152(s0)
ffffffffc020058a:	00002517          	auipc	a0,0x2
ffffffffc020058e:	b0e50513          	addi	a0,a0,-1266 # ffffffffc0202098 <commands+0x460>
ffffffffc0200592:	b25ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200596:	704c                	ld	a1,160(s0)
ffffffffc0200598:	00002517          	auipc	a0,0x2
ffffffffc020059c:	b1850513          	addi	a0,a0,-1256 # ffffffffc02020b0 <commands+0x478>
ffffffffc02005a0:	b17ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005a4:	744c                	ld	a1,168(s0)
ffffffffc02005a6:	00002517          	auipc	a0,0x2
ffffffffc02005aa:	b2250513          	addi	a0,a0,-1246 # ffffffffc02020c8 <commands+0x490>
ffffffffc02005ae:	b09ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005b2:	784c                	ld	a1,176(s0)
ffffffffc02005b4:	00002517          	auipc	a0,0x2
ffffffffc02005b8:	b2c50513          	addi	a0,a0,-1236 # ffffffffc02020e0 <commands+0x4a8>
ffffffffc02005bc:	afbff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005c0:	7c4c                	ld	a1,184(s0)
ffffffffc02005c2:	00002517          	auipc	a0,0x2
ffffffffc02005c6:	b3650513          	addi	a0,a0,-1226 # ffffffffc02020f8 <commands+0x4c0>
ffffffffc02005ca:	aedff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005ce:	606c                	ld	a1,192(s0)
ffffffffc02005d0:	00002517          	auipc	a0,0x2
ffffffffc02005d4:	b4050513          	addi	a0,a0,-1216 # ffffffffc0202110 <commands+0x4d8>
ffffffffc02005d8:	adfff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005dc:	646c                	ld	a1,200(s0)
ffffffffc02005de:	00002517          	auipc	a0,0x2
ffffffffc02005e2:	b4a50513          	addi	a0,a0,-1206 # ffffffffc0202128 <commands+0x4f0>
ffffffffc02005e6:	ad1ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005ea:	686c                	ld	a1,208(s0)
ffffffffc02005ec:	00002517          	auipc	a0,0x2
ffffffffc02005f0:	b5450513          	addi	a0,a0,-1196 # ffffffffc0202140 <commands+0x508>
ffffffffc02005f4:	ac3ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005f8:	6c6c                	ld	a1,216(s0)
ffffffffc02005fa:	00002517          	auipc	a0,0x2
ffffffffc02005fe:	b5e50513          	addi	a0,a0,-1186 # ffffffffc0202158 <commands+0x520>
ffffffffc0200602:	ab5ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200606:	706c                	ld	a1,224(s0)
ffffffffc0200608:	00002517          	auipc	a0,0x2
ffffffffc020060c:	b6850513          	addi	a0,a0,-1176 # ffffffffc0202170 <commands+0x538>
ffffffffc0200610:	aa7ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200614:	746c                	ld	a1,232(s0)
ffffffffc0200616:	00002517          	auipc	a0,0x2
ffffffffc020061a:	b7250513          	addi	a0,a0,-1166 # ffffffffc0202188 <commands+0x550>
ffffffffc020061e:	a99ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200622:	786c                	ld	a1,240(s0)
ffffffffc0200624:	00002517          	auipc	a0,0x2
ffffffffc0200628:	b7c50513          	addi	a0,a0,-1156 # ffffffffc02021a0 <commands+0x568>
ffffffffc020062c:	a8bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200630:	7c6c                	ld	a1,248(s0)
ffffffffc0200632:	6402                	ld	s0,0(sp)
ffffffffc0200634:	60a2                	ld	ra,8(sp)
ffffffffc0200636:	00002517          	auipc	a0,0x2
ffffffffc020063a:	b8250513          	addi	a0,a0,-1150 # ffffffffc02021b8 <commands+0x580>
ffffffffc020063e:	0141                	addi	sp,sp,16
ffffffffc0200640:	bc9d                	j	ffffffffc02000b6 <cprintf>

ffffffffc0200642 <print_trapframe>:
ffffffffc0200642:	1141                	addi	sp,sp,-16
ffffffffc0200644:	e022                	sd	s0,0(sp)
ffffffffc0200646:	85aa                	mv	a1,a0
ffffffffc0200648:	842a                	mv	s0,a0
ffffffffc020064a:	00002517          	auipc	a0,0x2
ffffffffc020064e:	b8650513          	addi	a0,a0,-1146 # ffffffffc02021d0 <commands+0x598>
ffffffffc0200652:	e406                	sd	ra,8(sp)
ffffffffc0200654:	a63ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200658:	8522                	mv	a0,s0
ffffffffc020065a:	e1dff0ef          	jal	ra,ffffffffc0200476 <print_regs>
ffffffffc020065e:	10043583          	ld	a1,256(s0)
ffffffffc0200662:	00002517          	auipc	a0,0x2
ffffffffc0200666:	b8650513          	addi	a0,a0,-1146 # ffffffffc02021e8 <commands+0x5b0>
ffffffffc020066a:	a4dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020066e:	10843583          	ld	a1,264(s0)
ffffffffc0200672:	00002517          	auipc	a0,0x2
ffffffffc0200676:	b8e50513          	addi	a0,a0,-1138 # ffffffffc0202200 <commands+0x5c8>
ffffffffc020067a:	a3dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020067e:	11043583          	ld	a1,272(s0)
ffffffffc0200682:	00002517          	auipc	a0,0x2
ffffffffc0200686:	b9650513          	addi	a0,a0,-1130 # ffffffffc0202218 <commands+0x5e0>
ffffffffc020068a:	a2dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020068e:	11843583          	ld	a1,280(s0)
ffffffffc0200692:	6402                	ld	s0,0(sp)
ffffffffc0200694:	60a2                	ld	ra,8(sp)
ffffffffc0200696:	00002517          	auipc	a0,0x2
ffffffffc020069a:	b9a50513          	addi	a0,a0,-1126 # ffffffffc0202230 <commands+0x5f8>
ffffffffc020069e:	0141                	addi	sp,sp,16
ffffffffc02006a0:	bc19                	j	ffffffffc02000b6 <cprintf>

ffffffffc02006a2 <interrupt_handler>:
ffffffffc02006a2:	11853783          	ld	a5,280(a0)
ffffffffc02006a6:	472d                	li	a4,11
ffffffffc02006a8:	0786                	slli	a5,a5,0x1
ffffffffc02006aa:	8385                	srli	a5,a5,0x1
ffffffffc02006ac:	06f76f63          	bltu	a4,a5,ffffffffc020072a <interrupt_handler+0x88>
ffffffffc02006b0:	00001717          	auipc	a4,0x1
ffffffffc02006b4:	72470713          	addi	a4,a4,1828 # ffffffffc0201dd4 <commands+0x19c>
ffffffffc02006b8:	078a                	slli	a5,a5,0x2
ffffffffc02006ba:	97ba                	add	a5,a5,a4
ffffffffc02006bc:	439c                	lw	a5,0(a5)
ffffffffc02006be:	97ba                	add	a5,a5,a4
ffffffffc02006c0:	8782                	jr	a5
ffffffffc02006c2:	00001517          	auipc	a0,0x1
ffffffffc02006c6:	7a650513          	addi	a0,a0,1958 # ffffffffc0201e68 <commands+0x230>
ffffffffc02006ca:	b2f5                	j	ffffffffc02000b6 <cprintf>
ffffffffc02006cc:	00001517          	auipc	a0,0x1
ffffffffc02006d0:	77c50513          	addi	a0,a0,1916 # ffffffffc0201e48 <commands+0x210>
ffffffffc02006d4:	b2cd                	j	ffffffffc02000b6 <cprintf>
ffffffffc02006d6:	00001517          	auipc	a0,0x1
ffffffffc02006da:	73250513          	addi	a0,a0,1842 # ffffffffc0201e08 <commands+0x1d0>
ffffffffc02006de:	bae1                	j	ffffffffc02000b6 <cprintf>
ffffffffc02006e0:	00001517          	auipc	a0,0x1
ffffffffc02006e4:	7a850513          	addi	a0,a0,1960 # ffffffffc0201e88 <commands+0x250>
ffffffffc02006e8:	b2f9                	j	ffffffffc02000b6 <cprintf>
ffffffffc02006ea:	1141                	addi	sp,sp,-16
ffffffffc02006ec:	e406                	sd	ra,8(sp)
ffffffffc02006ee:	d4dff0ef          	jal	ra,ffffffffc020043a <clock_set_next_event>
ffffffffc02006f2:	00006797          	auipc	a5,0x6
ffffffffc02006f6:	d3e78793          	addi	a5,a5,-706 # ffffffffc0206430 <ticks>
ffffffffc02006fa:	639c                	ld	a5,0(a5)
ffffffffc02006fc:	06400713          	li	a4,100
ffffffffc0200700:	0785                	addi	a5,a5,1
ffffffffc0200702:	02e7f733          	remu	a4,a5,a4
ffffffffc0200706:	00006697          	auipc	a3,0x6
ffffffffc020070a:	d2f6b523          	sd	a5,-726(a3) # ffffffffc0206430 <ticks>
ffffffffc020070e:	cf19                	beqz	a4,ffffffffc020072c <interrupt_handler+0x8a>
ffffffffc0200710:	60a2                	ld	ra,8(sp)
ffffffffc0200712:	0141                	addi	sp,sp,16
ffffffffc0200714:	8082                	ret
ffffffffc0200716:	00001517          	auipc	a0,0x1
ffffffffc020071a:	79a50513          	addi	a0,a0,1946 # ffffffffc0201eb0 <commands+0x278>
ffffffffc020071e:	ba61                	j	ffffffffc02000b6 <cprintf>
ffffffffc0200720:	00001517          	auipc	a0,0x1
ffffffffc0200724:	70850513          	addi	a0,a0,1800 # ffffffffc0201e28 <commands+0x1f0>
ffffffffc0200728:	b279                	j	ffffffffc02000b6 <cprintf>
ffffffffc020072a:	bf21                	j	ffffffffc0200642 <print_trapframe>
ffffffffc020072c:	60a2                	ld	ra,8(sp)
ffffffffc020072e:	06400593          	li	a1,100
ffffffffc0200732:	00001517          	auipc	a0,0x1
ffffffffc0200736:	76e50513          	addi	a0,a0,1902 # ffffffffc0201ea0 <commands+0x268>
ffffffffc020073a:	0141                	addi	sp,sp,16
ffffffffc020073c:	baad                	j	ffffffffc02000b6 <cprintf>

ffffffffc020073e <trap>:
ffffffffc020073e:	11853783          	ld	a5,280(a0)
ffffffffc0200742:	0007c763          	bltz	a5,ffffffffc0200750 <trap+0x12>
ffffffffc0200746:	472d                	li	a4,11
ffffffffc0200748:	00f76363          	bltu	a4,a5,ffffffffc020074e <trap+0x10>
ffffffffc020074c:	8082                	ret
ffffffffc020074e:	bdd5                	j	ffffffffc0200642 <print_trapframe>
ffffffffc0200750:	bf89                	j	ffffffffc02006a2 <interrupt_handler>
	...

ffffffffc0200754 <__alltraps>:
ffffffffc0200754:	14011073          	csrw	sscratch,sp
ffffffffc0200758:	712d                	addi	sp,sp,-288
ffffffffc020075a:	e002                	sd	zero,0(sp)
ffffffffc020075c:	e406                	sd	ra,8(sp)
ffffffffc020075e:	ec0e                	sd	gp,24(sp)
ffffffffc0200760:	f012                	sd	tp,32(sp)
ffffffffc0200762:	f416                	sd	t0,40(sp)
ffffffffc0200764:	f81a                	sd	t1,48(sp)
ffffffffc0200766:	fc1e                	sd	t2,56(sp)
ffffffffc0200768:	e0a2                	sd	s0,64(sp)
ffffffffc020076a:	e4a6                	sd	s1,72(sp)
ffffffffc020076c:	e8aa                	sd	a0,80(sp)
ffffffffc020076e:	ecae                	sd	a1,88(sp)
ffffffffc0200770:	f0b2                	sd	a2,96(sp)
ffffffffc0200772:	f4b6                	sd	a3,104(sp)
ffffffffc0200774:	f8ba                	sd	a4,112(sp)
ffffffffc0200776:	fcbe                	sd	a5,120(sp)
ffffffffc0200778:	e142                	sd	a6,128(sp)
ffffffffc020077a:	e546                	sd	a7,136(sp)
ffffffffc020077c:	e94a                	sd	s2,144(sp)
ffffffffc020077e:	ed4e                	sd	s3,152(sp)
ffffffffc0200780:	f152                	sd	s4,160(sp)
ffffffffc0200782:	f556                	sd	s5,168(sp)
ffffffffc0200784:	f95a                	sd	s6,176(sp)
ffffffffc0200786:	fd5e                	sd	s7,184(sp)
ffffffffc0200788:	e1e2                	sd	s8,192(sp)
ffffffffc020078a:	e5e6                	sd	s9,200(sp)
ffffffffc020078c:	e9ea                	sd	s10,208(sp)
ffffffffc020078e:	edee                	sd	s11,216(sp)
ffffffffc0200790:	f1f2                	sd	t3,224(sp)
ffffffffc0200792:	f5f6                	sd	t4,232(sp)
ffffffffc0200794:	f9fa                	sd	t5,240(sp)
ffffffffc0200796:	fdfe                	sd	t6,248(sp)
ffffffffc0200798:	14001473          	csrrw	s0,sscratch,zero
ffffffffc020079c:	100024f3          	csrr	s1,sstatus
ffffffffc02007a0:	14102973          	csrr	s2,sepc
ffffffffc02007a4:	143029f3          	csrr	s3,stval
ffffffffc02007a8:	14202a73          	csrr	s4,scause
ffffffffc02007ac:	e822                	sd	s0,16(sp)
ffffffffc02007ae:	e226                	sd	s1,256(sp)
ffffffffc02007b0:	e64a                	sd	s2,264(sp)
ffffffffc02007b2:	ea4e                	sd	s3,272(sp)
ffffffffc02007b4:	ee52                	sd	s4,280(sp)
ffffffffc02007b6:	850a                	mv	a0,sp
ffffffffc02007b8:	f87ff0ef          	jal	ra,ffffffffc020073e <trap>

ffffffffc02007bc <__trapret>:
ffffffffc02007bc:	6492                	ld	s1,256(sp)
ffffffffc02007be:	6932                	ld	s2,264(sp)
ffffffffc02007c0:	10049073          	csrw	sstatus,s1
ffffffffc02007c4:	14191073          	csrw	sepc,s2
ffffffffc02007c8:	60a2                	ld	ra,8(sp)
ffffffffc02007ca:	61e2                	ld	gp,24(sp)
ffffffffc02007cc:	7202                	ld	tp,32(sp)
ffffffffc02007ce:	72a2                	ld	t0,40(sp)
ffffffffc02007d0:	7342                	ld	t1,48(sp)
ffffffffc02007d2:	73e2                	ld	t2,56(sp)
ffffffffc02007d4:	6406                	ld	s0,64(sp)
ffffffffc02007d6:	64a6                	ld	s1,72(sp)
ffffffffc02007d8:	6546                	ld	a0,80(sp)
ffffffffc02007da:	65e6                	ld	a1,88(sp)
ffffffffc02007dc:	7606                	ld	a2,96(sp)
ffffffffc02007de:	76a6                	ld	a3,104(sp)
ffffffffc02007e0:	7746                	ld	a4,112(sp)
ffffffffc02007e2:	77e6                	ld	a5,120(sp)
ffffffffc02007e4:	680a                	ld	a6,128(sp)
ffffffffc02007e6:	68aa                	ld	a7,136(sp)
ffffffffc02007e8:	694a                	ld	s2,144(sp)
ffffffffc02007ea:	69ea                	ld	s3,152(sp)
ffffffffc02007ec:	7a0a                	ld	s4,160(sp)
ffffffffc02007ee:	7aaa                	ld	s5,168(sp)
ffffffffc02007f0:	7b4a                	ld	s6,176(sp)
ffffffffc02007f2:	7bea                	ld	s7,184(sp)
ffffffffc02007f4:	6c0e                	ld	s8,192(sp)
ffffffffc02007f6:	6cae                	ld	s9,200(sp)
ffffffffc02007f8:	6d4e                	ld	s10,208(sp)
ffffffffc02007fa:	6dee                	ld	s11,216(sp)
ffffffffc02007fc:	7e0e                	ld	t3,224(sp)
ffffffffc02007fe:	7eae                	ld	t4,232(sp)
ffffffffc0200800:	7f4e                	ld	t5,240(sp)
ffffffffc0200802:	7fee                	ld	t6,248(sp)
ffffffffc0200804:	6142                	ld	sp,16(sp)
ffffffffc0200806:	10200073          	sret

ffffffffc020080a <alloc_pages>:
ffffffffc020080a:	100027f3          	csrr	a5,sstatus
ffffffffc020080e:	8b89                	andi	a5,a5,2
ffffffffc0200810:	eb89                	bnez	a5,ffffffffc0200822 <alloc_pages+0x18>
ffffffffc0200812:	00006797          	auipc	a5,0x6
ffffffffc0200816:	c2e78793          	addi	a5,a5,-978 # ffffffffc0206440 <pmm_manager>
ffffffffc020081a:	639c                	ld	a5,0(a5)
ffffffffc020081c:	0187b303          	ld	t1,24(a5)
ffffffffc0200820:	8302                	jr	t1
ffffffffc0200822:	1141                	addi	sp,sp,-16
ffffffffc0200824:	e406                	sd	ra,8(sp)
ffffffffc0200826:	e022                	sd	s0,0(sp)
ffffffffc0200828:	842a                	mv	s0,a0
ffffffffc020082a:	c35ff0ef          	jal	ra,ffffffffc020045e <intr_disable>
ffffffffc020082e:	00006797          	auipc	a5,0x6
ffffffffc0200832:	c1278793          	addi	a5,a5,-1006 # ffffffffc0206440 <pmm_manager>
ffffffffc0200836:	639c                	ld	a5,0(a5)
ffffffffc0200838:	8522                	mv	a0,s0
ffffffffc020083a:	6f9c                	ld	a5,24(a5)
ffffffffc020083c:	9782                	jalr	a5
ffffffffc020083e:	842a                	mv	s0,a0
ffffffffc0200840:	c19ff0ef          	jal	ra,ffffffffc0200458 <intr_enable>
ffffffffc0200844:	8522                	mv	a0,s0
ffffffffc0200846:	60a2                	ld	ra,8(sp)
ffffffffc0200848:	6402                	ld	s0,0(sp)
ffffffffc020084a:	0141                	addi	sp,sp,16
ffffffffc020084c:	8082                	ret

ffffffffc020084e <free_pages>:
ffffffffc020084e:	100027f3          	csrr	a5,sstatus
ffffffffc0200852:	8b89                	andi	a5,a5,2
ffffffffc0200854:	eb89                	bnez	a5,ffffffffc0200866 <free_pages+0x18>
ffffffffc0200856:	00006797          	auipc	a5,0x6
ffffffffc020085a:	bea78793          	addi	a5,a5,-1046 # ffffffffc0206440 <pmm_manager>
ffffffffc020085e:	639c                	ld	a5,0(a5)
ffffffffc0200860:	0207b303          	ld	t1,32(a5)
ffffffffc0200864:	8302                	jr	t1
ffffffffc0200866:	1101                	addi	sp,sp,-32
ffffffffc0200868:	ec06                	sd	ra,24(sp)
ffffffffc020086a:	e822                	sd	s0,16(sp)
ffffffffc020086c:	e426                	sd	s1,8(sp)
ffffffffc020086e:	842a                	mv	s0,a0
ffffffffc0200870:	84ae                	mv	s1,a1
ffffffffc0200872:	bedff0ef          	jal	ra,ffffffffc020045e <intr_disable>
ffffffffc0200876:	00006797          	auipc	a5,0x6
ffffffffc020087a:	bca78793          	addi	a5,a5,-1078 # ffffffffc0206440 <pmm_manager>
ffffffffc020087e:	639c                	ld	a5,0(a5)
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8522                	mv	a0,s0
ffffffffc0200884:	739c                	ld	a5,32(a5)
ffffffffc0200886:	9782                	jalr	a5
ffffffffc0200888:	6442                	ld	s0,16(sp)
ffffffffc020088a:	60e2                	ld	ra,24(sp)
ffffffffc020088c:	64a2                	ld	s1,8(sp)
ffffffffc020088e:	6105                	addi	sp,sp,32
ffffffffc0200890:	b6e1                	j	ffffffffc0200458 <intr_enable>

ffffffffc0200892 <nr_free_pages>:
ffffffffc0200892:	100027f3          	csrr	a5,sstatus
ffffffffc0200896:	8b89                	andi	a5,a5,2
ffffffffc0200898:	eb89                	bnez	a5,ffffffffc02008aa <nr_free_pages+0x18>
ffffffffc020089a:	00006797          	auipc	a5,0x6
ffffffffc020089e:	ba678793          	addi	a5,a5,-1114 # ffffffffc0206440 <pmm_manager>
ffffffffc02008a2:	639c                	ld	a5,0(a5)
ffffffffc02008a4:	0287b303          	ld	t1,40(a5)
ffffffffc02008a8:	8302                	jr	t1
ffffffffc02008aa:	1141                	addi	sp,sp,-16
ffffffffc02008ac:	e406                	sd	ra,8(sp)
ffffffffc02008ae:	e022                	sd	s0,0(sp)
ffffffffc02008b0:	bafff0ef          	jal	ra,ffffffffc020045e <intr_disable>
ffffffffc02008b4:	00006797          	auipc	a5,0x6
ffffffffc02008b8:	b8c78793          	addi	a5,a5,-1140 # ffffffffc0206440 <pmm_manager>
ffffffffc02008bc:	639c                	ld	a5,0(a5)
ffffffffc02008be:	779c                	ld	a5,40(a5)
ffffffffc02008c0:	9782                	jalr	a5
ffffffffc02008c2:	842a                	mv	s0,a0
ffffffffc02008c4:	b95ff0ef          	jal	ra,ffffffffc0200458 <intr_enable>
ffffffffc02008c8:	8522                	mv	a0,s0
ffffffffc02008ca:	60a2                	ld	ra,8(sp)
ffffffffc02008cc:	6402                	ld	s0,0(sp)
ffffffffc02008ce:	0141                	addi	sp,sp,16
ffffffffc02008d0:	8082                	ret

ffffffffc02008d2 <pmm_init>:
ffffffffc02008d2:	00002797          	auipc	a5,0x2
ffffffffc02008d6:	df678793          	addi	a5,a5,-522 # ffffffffc02026c8 <best_fit_pmm_manager>
ffffffffc02008da:	638c                	ld	a1,0(a5)
ffffffffc02008dc:	1101                	addi	sp,sp,-32
ffffffffc02008de:	00002517          	auipc	a0,0x2
ffffffffc02008e2:	96a50513          	addi	a0,a0,-1686 # ffffffffc0202248 <commands+0x610>
ffffffffc02008e6:	ec06                	sd	ra,24(sp)
ffffffffc02008e8:	00006717          	auipc	a4,0x6
ffffffffc02008ec:	b4f73c23          	sd	a5,-1192(a4) # ffffffffc0206440 <pmm_manager>
ffffffffc02008f0:	e822                	sd	s0,16(sp)
ffffffffc02008f2:	e426                	sd	s1,8(sp)
ffffffffc02008f4:	00006417          	auipc	s0,0x6
ffffffffc02008f8:	b4c40413          	addi	s0,s0,-1204 # ffffffffc0206440 <pmm_manager>
ffffffffc02008fc:	fbaff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200900:	601c                	ld	a5,0(s0)
ffffffffc0200902:	679c                	ld	a5,8(a5)
ffffffffc0200904:	9782                	jalr	a5
ffffffffc0200906:	57f5                	li	a5,-3
ffffffffc0200908:	07fa                	slli	a5,a5,0x1e
ffffffffc020090a:	00002517          	auipc	a0,0x2
ffffffffc020090e:	95650513          	addi	a0,a0,-1706 # ffffffffc0202260 <commands+0x628>
ffffffffc0200912:	00006717          	auipc	a4,0x6
ffffffffc0200916:	b2f73b23          	sd	a5,-1226(a4) # ffffffffc0206448 <va_pa_offset>
ffffffffc020091a:	f9cff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020091e:	46c5                	li	a3,17
ffffffffc0200920:	06ee                	slli	a3,a3,0x1b
ffffffffc0200922:	40100613          	li	a2,1025
ffffffffc0200926:	16fd                	addi	a3,a3,-1
ffffffffc0200928:	0656                	slli	a2,a2,0x15
ffffffffc020092a:	07e005b7          	lui	a1,0x7e00
ffffffffc020092e:	00002517          	auipc	a0,0x2
ffffffffc0200932:	94a50513          	addi	a0,a0,-1718 # ffffffffc0202278 <commands+0x640>
ffffffffc0200936:	f80ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020093a:	777d                	lui	a4,0xfffff
ffffffffc020093c:	00007797          	auipc	a5,0x7
ffffffffc0200940:	b3378793          	addi	a5,a5,-1229 # ffffffffc020746f <end+0xfff>
ffffffffc0200944:	8ff9                	and	a5,a5,a4
ffffffffc0200946:	00088737          	lui	a4,0x88
ffffffffc020094a:	00006697          	auipc	a3,0x6
ffffffffc020094e:	ace6b723          	sd	a4,-1330(a3) # ffffffffc0206418 <npage>
ffffffffc0200952:	4601                	li	a2,0
ffffffffc0200954:	00006717          	auipc	a4,0x6
ffffffffc0200958:	aef73e23          	sd	a5,-1284(a4) # ffffffffc0206450 <pages>
ffffffffc020095c:	4681                	li	a3,0
ffffffffc020095e:	00006897          	auipc	a7,0x6
ffffffffc0200962:	aba88893          	addi	a7,a7,-1350 # ffffffffc0206418 <npage>
ffffffffc0200966:	00006597          	auipc	a1,0x6
ffffffffc020096a:	aea58593          	addi	a1,a1,-1302 # ffffffffc0206450 <pages>
ffffffffc020096e:	4805                	li	a6,1
ffffffffc0200970:	fff80537          	lui	a0,0xfff80
ffffffffc0200974:	a011                	j	ffffffffc0200978 <pmm_init+0xa6>
ffffffffc0200976:	619c                	ld	a5,0(a1)
ffffffffc0200978:	97b2                	add	a5,a5,a2
ffffffffc020097a:	07a1                	addi	a5,a5,8
ffffffffc020097c:	4107b02f          	amoor.d	zero,a6,(a5)
ffffffffc0200980:	0008b703          	ld	a4,0(a7)
ffffffffc0200984:	0685                	addi	a3,a3,1
ffffffffc0200986:	02860613          	addi	a2,a2,40
ffffffffc020098a:	00a707b3          	add	a5,a4,a0
ffffffffc020098e:	fef6e4e3          	bltu	a3,a5,ffffffffc0200976 <pmm_init+0xa4>
ffffffffc0200992:	6190                	ld	a2,0(a1)
ffffffffc0200994:	00271793          	slli	a5,a4,0x2
ffffffffc0200998:	97ba                	add	a5,a5,a4
ffffffffc020099a:	fec006b7          	lui	a3,0xfec00
ffffffffc020099e:	078e                	slli	a5,a5,0x3
ffffffffc02009a0:	96b2                	add	a3,a3,a2
ffffffffc02009a2:	96be                	add	a3,a3,a5
ffffffffc02009a4:	c02007b7          	lui	a5,0xc0200
ffffffffc02009a8:	08f6e863          	bltu	a3,a5,ffffffffc0200a38 <pmm_init+0x166>
ffffffffc02009ac:	00006497          	auipc	s1,0x6
ffffffffc02009b0:	a9c48493          	addi	s1,s1,-1380 # ffffffffc0206448 <va_pa_offset>
ffffffffc02009b4:	609c                	ld	a5,0(s1)
ffffffffc02009b6:	45c5                	li	a1,17
ffffffffc02009b8:	05ee                	slli	a1,a1,0x1b
ffffffffc02009ba:	8e9d                	sub	a3,a3,a5
ffffffffc02009bc:	04b6e963          	bltu	a3,a1,ffffffffc0200a0e <pmm_init+0x13c>
ffffffffc02009c0:	601c                	ld	a5,0(s0)
ffffffffc02009c2:	7b9c                	ld	a5,48(a5)
ffffffffc02009c4:	9782                	jalr	a5
ffffffffc02009c6:	00002517          	auipc	a0,0x2
ffffffffc02009ca:	94a50513          	addi	a0,a0,-1718 # ffffffffc0202310 <commands+0x6d8>
ffffffffc02009ce:	ee8ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02009d2:	00004697          	auipc	a3,0x4
ffffffffc02009d6:	62e68693          	addi	a3,a3,1582 # ffffffffc0205000 <boot_page_table_sv39>
ffffffffc02009da:	00006797          	auipc	a5,0x6
ffffffffc02009de:	a4d7b323          	sd	a3,-1466(a5) # ffffffffc0206420 <satp_virtual>
ffffffffc02009e2:	c02007b7          	lui	a5,0xc0200
ffffffffc02009e6:	06f6e563          	bltu	a3,a5,ffffffffc0200a50 <pmm_init+0x17e>
ffffffffc02009ea:	609c                	ld	a5,0(s1)
ffffffffc02009ec:	6442                	ld	s0,16(sp)
ffffffffc02009ee:	60e2                	ld	ra,24(sp)
ffffffffc02009f0:	64a2                	ld	s1,8(sp)
ffffffffc02009f2:	85b6                	mv	a1,a3
ffffffffc02009f4:	8e9d                	sub	a3,a3,a5
ffffffffc02009f6:	00006797          	auipc	a5,0x6
ffffffffc02009fa:	a4d7b123          	sd	a3,-1470(a5) # ffffffffc0206438 <satp_physical>
ffffffffc02009fe:	00002517          	auipc	a0,0x2
ffffffffc0200a02:	93250513          	addi	a0,a0,-1742 # ffffffffc0202330 <commands+0x6f8>
ffffffffc0200a06:	8636                	mv	a2,a3
ffffffffc0200a08:	6105                	addi	sp,sp,32
ffffffffc0200a0a:	eacff06f          	j	ffffffffc02000b6 <cprintf>
ffffffffc0200a0e:	6785                	lui	a5,0x1
ffffffffc0200a10:	17fd                	addi	a5,a5,-1
ffffffffc0200a12:	96be                	add	a3,a3,a5
ffffffffc0200a14:	77fd                	lui	a5,0xfffff
ffffffffc0200a16:	8efd                	and	a3,a3,a5
ffffffffc0200a18:	00c6d793          	srli	a5,a3,0xc
ffffffffc0200a1c:	04e7f663          	bgeu	a5,a4,ffffffffc0200a68 <pmm_init+0x196>
ffffffffc0200a20:	6018                	ld	a4,0(s0)
ffffffffc0200a22:	97aa                	add	a5,a5,a0
ffffffffc0200a24:	00279513          	slli	a0,a5,0x2
ffffffffc0200a28:	953e                	add	a0,a0,a5
ffffffffc0200a2a:	6b1c                	ld	a5,16(a4)
ffffffffc0200a2c:	8d95                	sub	a1,a1,a3
ffffffffc0200a2e:	050e                	slli	a0,a0,0x3
ffffffffc0200a30:	81b1                	srli	a1,a1,0xc
ffffffffc0200a32:	9532                	add	a0,a0,a2
ffffffffc0200a34:	9782                	jalr	a5
ffffffffc0200a36:	b769                	j	ffffffffc02009c0 <pmm_init+0xee>
ffffffffc0200a38:	00002617          	auipc	a2,0x2
ffffffffc0200a3c:	87060613          	addi	a2,a2,-1936 # ffffffffc02022a8 <commands+0x670>
ffffffffc0200a40:	06f00593          	li	a1,111
ffffffffc0200a44:	00002517          	auipc	a0,0x2
ffffffffc0200a48:	88c50513          	addi	a0,a0,-1908 # ffffffffc02022d0 <commands+0x698>
ffffffffc0200a4c:	ef0ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200a50:	00002617          	auipc	a2,0x2
ffffffffc0200a54:	85860613          	addi	a2,a2,-1960 # ffffffffc02022a8 <commands+0x670>
ffffffffc0200a58:	08a00593          	li	a1,138
ffffffffc0200a5c:	00002517          	auipc	a0,0x2
ffffffffc0200a60:	87450513          	addi	a0,a0,-1932 # ffffffffc02022d0 <commands+0x698>
ffffffffc0200a64:	ed8ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200a68:	00002617          	auipc	a2,0x2
ffffffffc0200a6c:	87860613          	addi	a2,a2,-1928 # ffffffffc02022e0 <commands+0x6a8>
ffffffffc0200a70:	06f00593          	li	a1,111
ffffffffc0200a74:	00002517          	auipc	a0,0x2
ffffffffc0200a78:	88c50513          	addi	a0,a0,-1908 # ffffffffc0202300 <commands+0x6c8>
ffffffffc0200a7c:	ec0ff0ef          	jal	ra,ffffffffc020013c <__panic>

ffffffffc0200a80 <best_fit_init>:
ffffffffc0200a80:	00006797          	auipc	a5,0x6
ffffffffc0200a84:	9d878793          	addi	a5,a5,-1576 # ffffffffc0206458 <free_area>
ffffffffc0200a88:	e79c                	sd	a5,8(a5)
ffffffffc0200a8a:	e39c                	sd	a5,0(a5)
ffffffffc0200a8c:	0007a823          	sw	zero,16(a5)
ffffffffc0200a90:	8082                	ret

ffffffffc0200a92 <best_fit_nr_free_pages>:
ffffffffc0200a92:	00006517          	auipc	a0,0x6
ffffffffc0200a96:	9d656503          	lwu	a0,-1578(a0) # ffffffffc0206468 <free_area+0x10>
ffffffffc0200a9a:	8082                	ret

ffffffffc0200a9c <best_fit_check>:
ffffffffc0200a9c:	715d                	addi	sp,sp,-80
ffffffffc0200a9e:	f84a                	sd	s2,48(sp)
ffffffffc0200aa0:	00006917          	auipc	s2,0x6
ffffffffc0200aa4:	9b890913          	addi	s2,s2,-1608 # ffffffffc0206458 <free_area>
ffffffffc0200aa8:	00893783          	ld	a5,8(s2)
ffffffffc0200aac:	e486                	sd	ra,72(sp)
ffffffffc0200aae:	e0a2                	sd	s0,64(sp)
ffffffffc0200ab0:	fc26                	sd	s1,56(sp)
ffffffffc0200ab2:	f44e                	sd	s3,40(sp)
ffffffffc0200ab4:	f052                	sd	s4,32(sp)
ffffffffc0200ab6:	ec56                	sd	s5,24(sp)
ffffffffc0200ab8:	e85a                	sd	s6,16(sp)
ffffffffc0200aba:	e45e                	sd	s7,8(sp)
ffffffffc0200abc:	e062                	sd	s8,0(sp)
ffffffffc0200abe:	33278363          	beq	a5,s2,ffffffffc0200de4 <best_fit_check+0x348>
ffffffffc0200ac2:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200ac6:	8305                	srli	a4,a4,0x1
ffffffffc0200ac8:	8b05                	andi	a4,a4,1
ffffffffc0200aca:	32070163          	beqz	a4,ffffffffc0200dec <best_fit_check+0x350>
ffffffffc0200ace:	4401                	li	s0,0
ffffffffc0200ad0:	4481                	li	s1,0
ffffffffc0200ad2:	a031                	j	ffffffffc0200ade <best_fit_check+0x42>
ffffffffc0200ad4:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200ad8:	8b09                	andi	a4,a4,2
ffffffffc0200ada:	30070963          	beqz	a4,ffffffffc0200dec <best_fit_check+0x350>
ffffffffc0200ade:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200ae2:	679c                	ld	a5,8(a5)
ffffffffc0200ae4:	2485                	addiw	s1,s1,1
ffffffffc0200ae6:	9c39                	addw	s0,s0,a4
ffffffffc0200ae8:	ff2796e3          	bne	a5,s2,ffffffffc0200ad4 <best_fit_check+0x38>
ffffffffc0200aec:	89a2                	mv	s3,s0
ffffffffc0200aee:	da5ff0ef          	jal	ra,ffffffffc0200892 <nr_free_pages>
ffffffffc0200af2:	3d351d63          	bne	a0,s3,ffffffffc0200ecc <best_fit_check+0x430>
ffffffffc0200af6:	4505                	li	a0,1
ffffffffc0200af8:	d13ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200afc:	8a2a                	mv	s4,a0
ffffffffc0200afe:	40050763          	beqz	a0,ffffffffc0200f0c <best_fit_check+0x470>
ffffffffc0200b02:	4505                	li	a0,1
ffffffffc0200b04:	d07ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200b08:	89aa                	mv	s3,a0
ffffffffc0200b0a:	3e050163          	beqz	a0,ffffffffc0200eec <best_fit_check+0x450>
ffffffffc0200b0e:	4505                	li	a0,1
ffffffffc0200b10:	cfbff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200b14:	8aaa                	mv	s5,a0
ffffffffc0200b16:	36050b63          	beqz	a0,ffffffffc0200e8c <best_fit_check+0x3f0>
ffffffffc0200b1a:	2f3a0963          	beq	s4,s3,ffffffffc0200e0c <best_fit_check+0x370>
ffffffffc0200b1e:	2eaa0763          	beq	s4,a0,ffffffffc0200e0c <best_fit_check+0x370>
ffffffffc0200b22:	2ea98563          	beq	s3,a0,ffffffffc0200e0c <best_fit_check+0x370>
ffffffffc0200b26:	000a2783          	lw	a5,0(s4)
ffffffffc0200b2a:	30079163          	bnez	a5,ffffffffc0200e2c <best_fit_check+0x390>
ffffffffc0200b2e:	0009a783          	lw	a5,0(s3)
ffffffffc0200b32:	2e079d63          	bnez	a5,ffffffffc0200e2c <best_fit_check+0x390>
ffffffffc0200b36:	411c                	lw	a5,0(a0)
ffffffffc0200b38:	2e079a63          	bnez	a5,ffffffffc0200e2c <best_fit_check+0x390>
ffffffffc0200b3c:	00006797          	auipc	a5,0x6
ffffffffc0200b40:	91478793          	addi	a5,a5,-1772 # ffffffffc0206450 <pages>
ffffffffc0200b44:	639c                	ld	a5,0(a5)
ffffffffc0200b46:	00002717          	auipc	a4,0x2
ffffffffc0200b4a:	82a70713          	addi	a4,a4,-2006 # ffffffffc0202370 <commands+0x738>
ffffffffc0200b4e:	630c                	ld	a1,0(a4)
ffffffffc0200b50:	40fa0733          	sub	a4,s4,a5
ffffffffc0200b54:	870d                	srai	a4,a4,0x3
ffffffffc0200b56:	02b70733          	mul	a4,a4,a1
ffffffffc0200b5a:	00002697          	auipc	a3,0x2
ffffffffc0200b5e:	e0668693          	addi	a3,a3,-506 # ffffffffc0202960 <nbase>
ffffffffc0200b62:	6290                	ld	a2,0(a3)
ffffffffc0200b64:	00006697          	auipc	a3,0x6
ffffffffc0200b68:	8b468693          	addi	a3,a3,-1868 # ffffffffc0206418 <npage>
ffffffffc0200b6c:	6294                	ld	a3,0(a3)
ffffffffc0200b6e:	06b2                	slli	a3,a3,0xc
ffffffffc0200b70:	9732                	add	a4,a4,a2
ffffffffc0200b72:	0732                	slli	a4,a4,0xc
ffffffffc0200b74:	2cd77c63          	bgeu	a4,a3,ffffffffc0200e4c <best_fit_check+0x3b0>
ffffffffc0200b78:	40f98733          	sub	a4,s3,a5
ffffffffc0200b7c:	870d                	srai	a4,a4,0x3
ffffffffc0200b7e:	02b70733          	mul	a4,a4,a1
ffffffffc0200b82:	9732                	add	a4,a4,a2
ffffffffc0200b84:	0732                	slli	a4,a4,0xc
ffffffffc0200b86:	48d77363          	bgeu	a4,a3,ffffffffc020100c <best_fit_check+0x570>
ffffffffc0200b8a:	40f507b3          	sub	a5,a0,a5
ffffffffc0200b8e:	878d                	srai	a5,a5,0x3
ffffffffc0200b90:	02b787b3          	mul	a5,a5,a1
ffffffffc0200b94:	97b2                	add	a5,a5,a2
ffffffffc0200b96:	07b2                	slli	a5,a5,0xc
ffffffffc0200b98:	44d7fa63          	bgeu	a5,a3,ffffffffc0200fec <best_fit_check+0x550>
ffffffffc0200b9c:	4505                	li	a0,1
ffffffffc0200b9e:	00093c03          	ld	s8,0(s2)
ffffffffc0200ba2:	00893b83          	ld	s7,8(s2)
ffffffffc0200ba6:	01092b03          	lw	s6,16(s2)
ffffffffc0200baa:	00006797          	auipc	a5,0x6
ffffffffc0200bae:	8b27bb23          	sd	s2,-1866(a5) # ffffffffc0206460 <free_area+0x8>
ffffffffc0200bb2:	00006797          	auipc	a5,0x6
ffffffffc0200bb6:	8b27b323          	sd	s2,-1882(a5) # ffffffffc0206458 <free_area>
ffffffffc0200bba:	00006797          	auipc	a5,0x6
ffffffffc0200bbe:	8a07a723          	sw	zero,-1874(a5) # ffffffffc0206468 <free_area+0x10>
ffffffffc0200bc2:	c49ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200bc6:	40051363          	bnez	a0,ffffffffc0200fcc <best_fit_check+0x530>
ffffffffc0200bca:	4585                	li	a1,1
ffffffffc0200bcc:	8552                	mv	a0,s4
ffffffffc0200bce:	c81ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200bd2:	4585                	li	a1,1
ffffffffc0200bd4:	854e                	mv	a0,s3
ffffffffc0200bd6:	c79ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200bda:	4585                	li	a1,1
ffffffffc0200bdc:	8556                	mv	a0,s5
ffffffffc0200bde:	c71ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200be2:	01092703          	lw	a4,16(s2)
ffffffffc0200be6:	478d                	li	a5,3
ffffffffc0200be8:	3cf71263          	bne	a4,a5,ffffffffc0200fac <best_fit_check+0x510>
ffffffffc0200bec:	4505                	li	a0,1
ffffffffc0200bee:	c1dff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200bf2:	89aa                	mv	s3,a0
ffffffffc0200bf4:	38050c63          	beqz	a0,ffffffffc0200f8c <best_fit_check+0x4f0>
ffffffffc0200bf8:	4505                	li	a0,1
ffffffffc0200bfa:	c11ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200bfe:	8aaa                	mv	s5,a0
ffffffffc0200c00:	36050663          	beqz	a0,ffffffffc0200f6c <best_fit_check+0x4d0>
ffffffffc0200c04:	4505                	li	a0,1
ffffffffc0200c06:	c05ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200c0a:	8a2a                	mv	s4,a0
ffffffffc0200c0c:	34050063          	beqz	a0,ffffffffc0200f4c <best_fit_check+0x4b0>
ffffffffc0200c10:	4505                	li	a0,1
ffffffffc0200c12:	bf9ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200c16:	30051b63          	bnez	a0,ffffffffc0200f2c <best_fit_check+0x490>
ffffffffc0200c1a:	4585                	li	a1,1
ffffffffc0200c1c:	854e                	mv	a0,s3
ffffffffc0200c1e:	c31ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200c22:	00893783          	ld	a5,8(s2)
ffffffffc0200c26:	25278363          	beq	a5,s2,ffffffffc0200e6c <best_fit_check+0x3d0>
ffffffffc0200c2a:	4505                	li	a0,1
ffffffffc0200c2c:	bdfff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200c30:	5aa99e63          	bne	s3,a0,ffffffffc02011ec <best_fit_check+0x750>
ffffffffc0200c34:	4505                	li	a0,1
ffffffffc0200c36:	bd5ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200c3a:	58051963          	bnez	a0,ffffffffc02011cc <best_fit_check+0x730>
ffffffffc0200c3e:	01092783          	lw	a5,16(s2)
ffffffffc0200c42:	56079563          	bnez	a5,ffffffffc02011ac <best_fit_check+0x710>
ffffffffc0200c46:	854e                	mv	a0,s3
ffffffffc0200c48:	4585                	li	a1,1
ffffffffc0200c4a:	00006797          	auipc	a5,0x6
ffffffffc0200c4e:	8187b723          	sd	s8,-2034(a5) # ffffffffc0206458 <free_area>
ffffffffc0200c52:	00006797          	auipc	a5,0x6
ffffffffc0200c56:	8177b723          	sd	s7,-2034(a5) # ffffffffc0206460 <free_area+0x8>
ffffffffc0200c5a:	00006797          	auipc	a5,0x6
ffffffffc0200c5e:	8167a723          	sw	s6,-2034(a5) # ffffffffc0206468 <free_area+0x10>
ffffffffc0200c62:	bedff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200c66:	4585                	li	a1,1
ffffffffc0200c68:	8556                	mv	a0,s5
ffffffffc0200c6a:	be5ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200c6e:	4585                	li	a1,1
ffffffffc0200c70:	8552                	mv	a0,s4
ffffffffc0200c72:	bddff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200c76:	4619                	li	a2,6
ffffffffc0200c78:	4585                	li	a1,1
ffffffffc0200c7a:	00002517          	auipc	a0,0x2
ffffffffc0200c7e:	8f650513          	addi	a0,a0,-1802 # ffffffffc0202570 <commands+0x938>
ffffffffc0200c82:	c34ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200c86:	4515                	li	a0,5
ffffffffc0200c88:	b83ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200c8c:	89aa                	mv	s3,a0
ffffffffc0200c8e:	4e050f63          	beqz	a0,ffffffffc020118c <best_fit_check+0x6f0>
ffffffffc0200c92:	651c                	ld	a5,8(a0)
ffffffffc0200c94:	8385                	srli	a5,a5,0x1
ffffffffc0200c96:	8b85                	andi	a5,a5,1
ffffffffc0200c98:	4c079a63          	bnez	a5,ffffffffc020116c <best_fit_check+0x6d0>
ffffffffc0200c9c:	4619                	li	a2,6
ffffffffc0200c9e:	4589                	li	a1,2
ffffffffc0200ca0:	00002517          	auipc	a0,0x2
ffffffffc0200ca4:	8d050513          	addi	a0,a0,-1840 # ffffffffc0202570 <commands+0x938>
ffffffffc0200ca8:	c0eff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200cac:	4505                	li	a0,1
ffffffffc0200cae:	00093b03          	ld	s6,0(s2)
ffffffffc0200cb2:	00893a83          	ld	s5,8(s2)
ffffffffc0200cb6:	00005797          	auipc	a5,0x5
ffffffffc0200cba:	7b27b123          	sd	s2,1954(a5) # ffffffffc0206458 <free_area>
ffffffffc0200cbe:	00005797          	auipc	a5,0x5
ffffffffc0200cc2:	7b27b123          	sd	s2,1954(a5) # ffffffffc0206460 <free_area+0x8>
ffffffffc0200cc6:	b45ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200cca:	48051163          	bnez	a0,ffffffffc020114c <best_fit_check+0x6b0>
ffffffffc0200cce:	4619                	li	a2,6
ffffffffc0200cd0:	458d                	li	a1,3
ffffffffc0200cd2:	00002517          	auipc	a0,0x2
ffffffffc0200cd6:	89e50513          	addi	a0,a0,-1890 # ffffffffc0202570 <commands+0x938>
ffffffffc0200cda:	bdcff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200cde:	4589                	li	a1,2
ffffffffc0200ce0:	02898513          	addi	a0,s3,40
ffffffffc0200ce4:	01092b83          	lw	s7,16(s2)
ffffffffc0200ce8:	0a098c13          	addi	s8,s3,160
ffffffffc0200cec:	00005797          	auipc	a5,0x5
ffffffffc0200cf0:	7607ae23          	sw	zero,1916(a5) # ffffffffc0206468 <free_area+0x10>
ffffffffc0200cf4:	b5bff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200cf8:	8562                	mv	a0,s8
ffffffffc0200cfa:	4585                	li	a1,1
ffffffffc0200cfc:	b53ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200d00:	4511                	li	a0,4
ffffffffc0200d02:	b09ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200d06:	42051363          	bnez	a0,ffffffffc020112c <best_fit_check+0x690>
ffffffffc0200d0a:	0309b783          	ld	a5,48(s3)
ffffffffc0200d0e:	8385                	srli	a5,a5,0x1
ffffffffc0200d10:	8b85                	andi	a5,a5,1
ffffffffc0200d12:	3e078d63          	beqz	a5,ffffffffc020110c <best_fit_check+0x670>
ffffffffc0200d16:	0389a703          	lw	a4,56(s3)
ffffffffc0200d1a:	4789                	li	a5,2
ffffffffc0200d1c:	3ef71863          	bne	a4,a5,ffffffffc020110c <best_fit_check+0x670>
ffffffffc0200d20:	4505                	li	a0,1
ffffffffc0200d22:	ae9ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200d26:	8a2a                	mv	s4,a0
ffffffffc0200d28:	3c050263          	beqz	a0,ffffffffc02010ec <best_fit_check+0x650>
ffffffffc0200d2c:	4509                	li	a0,2
ffffffffc0200d2e:	addff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200d32:	38050d63          	beqz	a0,ffffffffc02010cc <best_fit_check+0x630>
ffffffffc0200d36:	374c1b63          	bne	s8,s4,ffffffffc02010ac <best_fit_check+0x610>
ffffffffc0200d3a:	4619                	li	a2,6
ffffffffc0200d3c:	4591                	li	a1,4
ffffffffc0200d3e:	00002517          	auipc	a0,0x2
ffffffffc0200d42:	83250513          	addi	a0,a0,-1998 # ffffffffc0202570 <commands+0x938>
ffffffffc0200d46:	b70ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200d4a:	854e                	mv	a0,s3
ffffffffc0200d4c:	4595                	li	a1,5
ffffffffc0200d4e:	b01ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200d52:	4515                	li	a0,5
ffffffffc0200d54:	ab7ff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200d58:	89aa                	mv	s3,a0
ffffffffc0200d5a:	32050963          	beqz	a0,ffffffffc020108c <best_fit_check+0x5f0>
ffffffffc0200d5e:	4505                	li	a0,1
ffffffffc0200d60:	aabff0ef          	jal	ra,ffffffffc020080a <alloc_pages>
ffffffffc0200d64:	30051463          	bnez	a0,ffffffffc020106c <best_fit_check+0x5d0>
ffffffffc0200d68:	4619                	li	a2,6
ffffffffc0200d6a:	4595                	li	a1,5
ffffffffc0200d6c:	00002517          	auipc	a0,0x2
ffffffffc0200d70:	80450513          	addi	a0,a0,-2044 # ffffffffc0202570 <commands+0x938>
ffffffffc0200d74:	b42ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200d78:	01092783          	lw	a5,16(s2)
ffffffffc0200d7c:	2c079863          	bnez	a5,ffffffffc020104c <best_fit_check+0x5b0>
ffffffffc0200d80:	4595                	li	a1,5
ffffffffc0200d82:	854e                	mv	a0,s3
ffffffffc0200d84:	00005797          	auipc	a5,0x5
ffffffffc0200d88:	6f77a223          	sw	s7,1764(a5) # ffffffffc0206468 <free_area+0x10>
ffffffffc0200d8c:	00005797          	auipc	a5,0x5
ffffffffc0200d90:	6d67b623          	sd	s6,1740(a5) # ffffffffc0206458 <free_area>
ffffffffc0200d94:	00005797          	auipc	a5,0x5
ffffffffc0200d98:	6d57b623          	sd	s5,1740(a5) # ffffffffc0206460 <free_area+0x8>
ffffffffc0200d9c:	ab3ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200da0:	00893783          	ld	a5,8(s2)
ffffffffc0200da4:	01278963          	beq	a5,s2,ffffffffc0200db6 <best_fit_check+0x31a>
ffffffffc0200da8:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200dac:	679c                	ld	a5,8(a5)
ffffffffc0200dae:	34fd                	addiw	s1,s1,-1
ffffffffc0200db0:	9c19                	subw	s0,s0,a4
ffffffffc0200db2:	ff279be3          	bne	a5,s2,ffffffffc0200da8 <best_fit_check+0x30c>
ffffffffc0200db6:	26049b63          	bnez	s1,ffffffffc020102c <best_fit_check+0x590>
ffffffffc0200dba:	0e041963          	bnez	s0,ffffffffc0200eac <best_fit_check+0x410>
ffffffffc0200dbe:	6406                	ld	s0,64(sp)
ffffffffc0200dc0:	60a6                	ld	ra,72(sp)
ffffffffc0200dc2:	74e2                	ld	s1,56(sp)
ffffffffc0200dc4:	7942                	ld	s2,48(sp)
ffffffffc0200dc6:	79a2                	ld	s3,40(sp)
ffffffffc0200dc8:	7a02                	ld	s4,32(sp)
ffffffffc0200dca:	6ae2                	ld	s5,24(sp)
ffffffffc0200dcc:	6b42                	ld	s6,16(sp)
ffffffffc0200dce:	6ba2                	ld	s7,8(sp)
ffffffffc0200dd0:	6c02                	ld	s8,0(sp)
ffffffffc0200dd2:	4619                	li	a2,6
ffffffffc0200dd4:	4599                	li	a1,6
ffffffffc0200dd6:	00001517          	auipc	a0,0x1
ffffffffc0200dda:	79a50513          	addi	a0,a0,1946 # ffffffffc0202570 <commands+0x938>
ffffffffc0200dde:	6161                	addi	sp,sp,80
ffffffffc0200de0:	ad6ff06f          	j	ffffffffc02000b6 <cprintf>
ffffffffc0200de4:	4981                	li	s3,0
ffffffffc0200de6:	4401                	li	s0,0
ffffffffc0200de8:	4481                	li	s1,0
ffffffffc0200dea:	b311                	j	ffffffffc0200aee <best_fit_check+0x52>
ffffffffc0200dec:	00001697          	auipc	a3,0x1
ffffffffc0200df0:	58c68693          	addi	a3,a3,1420 # ffffffffc0202378 <commands+0x740>
ffffffffc0200df4:	00001617          	auipc	a2,0x1
ffffffffc0200df8:	59460613          	addi	a2,a2,1428 # ffffffffc0202388 <commands+0x750>
ffffffffc0200dfc:	0fd00593          	li	a1,253
ffffffffc0200e00:	00001517          	auipc	a0,0x1
ffffffffc0200e04:	5a050513          	addi	a0,a0,1440 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200e08:	b34ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200e0c:	00001697          	auipc	a3,0x1
ffffffffc0200e10:	62c68693          	addi	a3,a3,1580 # ffffffffc0202438 <commands+0x800>
ffffffffc0200e14:	00001617          	auipc	a2,0x1
ffffffffc0200e18:	57460613          	addi	a2,a2,1396 # ffffffffc0202388 <commands+0x750>
ffffffffc0200e1c:	0c700593          	li	a1,199
ffffffffc0200e20:	00001517          	auipc	a0,0x1
ffffffffc0200e24:	58050513          	addi	a0,a0,1408 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200e28:	b14ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200e2c:	00001697          	auipc	a3,0x1
ffffffffc0200e30:	63468693          	addi	a3,a3,1588 # ffffffffc0202460 <commands+0x828>
ffffffffc0200e34:	00001617          	auipc	a2,0x1
ffffffffc0200e38:	55460613          	addi	a2,a2,1364 # ffffffffc0202388 <commands+0x750>
ffffffffc0200e3c:	0c800593          	li	a1,200
ffffffffc0200e40:	00001517          	auipc	a0,0x1
ffffffffc0200e44:	56050513          	addi	a0,a0,1376 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200e48:	af4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200e4c:	00001697          	auipc	a3,0x1
ffffffffc0200e50:	65468693          	addi	a3,a3,1620 # ffffffffc02024a0 <commands+0x868>
ffffffffc0200e54:	00001617          	auipc	a2,0x1
ffffffffc0200e58:	53460613          	addi	a2,a2,1332 # ffffffffc0202388 <commands+0x750>
ffffffffc0200e5c:	0ca00593          	li	a1,202
ffffffffc0200e60:	00001517          	auipc	a0,0x1
ffffffffc0200e64:	54050513          	addi	a0,a0,1344 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200e68:	ad4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200e6c:	00001697          	auipc	a3,0x1
ffffffffc0200e70:	6bc68693          	addi	a3,a3,1724 # ffffffffc0202528 <commands+0x8f0>
ffffffffc0200e74:	00001617          	auipc	a2,0x1
ffffffffc0200e78:	51460613          	addi	a2,a2,1300 # ffffffffc0202388 <commands+0x750>
ffffffffc0200e7c:	0e300593          	li	a1,227
ffffffffc0200e80:	00001517          	auipc	a0,0x1
ffffffffc0200e84:	52050513          	addi	a0,a0,1312 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200e88:	ab4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200e8c:	00001697          	auipc	a3,0x1
ffffffffc0200e90:	58c68693          	addi	a3,a3,1420 # ffffffffc0202418 <commands+0x7e0>
ffffffffc0200e94:	00001617          	auipc	a2,0x1
ffffffffc0200e98:	4f460613          	addi	a2,a2,1268 # ffffffffc0202388 <commands+0x750>
ffffffffc0200e9c:	0c500593          	li	a1,197
ffffffffc0200ea0:	00001517          	auipc	a0,0x1
ffffffffc0200ea4:	50050513          	addi	a0,a0,1280 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200ea8:	a94ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200eac:	00001697          	auipc	a3,0x1
ffffffffc0200eb0:	7cc68693          	addi	a3,a3,1996 # ffffffffc0202678 <commands+0xa40>
ffffffffc0200eb4:	00001617          	auipc	a2,0x1
ffffffffc0200eb8:	4d460613          	addi	a2,a2,1236 # ffffffffc0202388 <commands+0x750>
ffffffffc0200ebc:	14000593          	li	a1,320
ffffffffc0200ec0:	00001517          	auipc	a0,0x1
ffffffffc0200ec4:	4e050513          	addi	a0,a0,1248 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200ec8:	a74ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200ecc:	00001697          	auipc	a3,0x1
ffffffffc0200ed0:	4ec68693          	addi	a3,a3,1260 # ffffffffc02023b8 <commands+0x780>
ffffffffc0200ed4:	00001617          	auipc	a2,0x1
ffffffffc0200ed8:	4b460613          	addi	a2,a2,1204 # ffffffffc0202388 <commands+0x750>
ffffffffc0200edc:	10000593          	li	a1,256
ffffffffc0200ee0:	00001517          	auipc	a0,0x1
ffffffffc0200ee4:	4c050513          	addi	a0,a0,1216 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200ee8:	a54ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200eec:	00001697          	auipc	a3,0x1
ffffffffc0200ef0:	50c68693          	addi	a3,a3,1292 # ffffffffc02023f8 <commands+0x7c0>
ffffffffc0200ef4:	00001617          	auipc	a2,0x1
ffffffffc0200ef8:	49460613          	addi	a2,a2,1172 # ffffffffc0202388 <commands+0x750>
ffffffffc0200efc:	0c400593          	li	a1,196
ffffffffc0200f00:	00001517          	auipc	a0,0x1
ffffffffc0200f04:	4a050513          	addi	a0,a0,1184 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200f08:	a34ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200f0c:	00001697          	auipc	a3,0x1
ffffffffc0200f10:	4cc68693          	addi	a3,a3,1228 # ffffffffc02023d8 <commands+0x7a0>
ffffffffc0200f14:	00001617          	auipc	a2,0x1
ffffffffc0200f18:	47460613          	addi	a2,a2,1140 # ffffffffc0202388 <commands+0x750>
ffffffffc0200f1c:	0c300593          	li	a1,195
ffffffffc0200f20:	00001517          	auipc	a0,0x1
ffffffffc0200f24:	48050513          	addi	a0,a0,1152 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200f28:	a14ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200f2c:	00001697          	auipc	a3,0x1
ffffffffc0200f30:	5d468693          	addi	a3,a3,1492 # ffffffffc0202500 <commands+0x8c8>
ffffffffc0200f34:	00001617          	auipc	a2,0x1
ffffffffc0200f38:	45460613          	addi	a2,a2,1108 # ffffffffc0202388 <commands+0x750>
ffffffffc0200f3c:	0e000593          	li	a1,224
ffffffffc0200f40:	00001517          	auipc	a0,0x1
ffffffffc0200f44:	46050513          	addi	a0,a0,1120 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200f48:	9f4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200f4c:	00001697          	auipc	a3,0x1
ffffffffc0200f50:	4cc68693          	addi	a3,a3,1228 # ffffffffc0202418 <commands+0x7e0>
ffffffffc0200f54:	00001617          	auipc	a2,0x1
ffffffffc0200f58:	43460613          	addi	a2,a2,1076 # ffffffffc0202388 <commands+0x750>
ffffffffc0200f5c:	0de00593          	li	a1,222
ffffffffc0200f60:	00001517          	auipc	a0,0x1
ffffffffc0200f64:	44050513          	addi	a0,a0,1088 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200f68:	9d4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200f6c:	00001697          	auipc	a3,0x1
ffffffffc0200f70:	48c68693          	addi	a3,a3,1164 # ffffffffc02023f8 <commands+0x7c0>
ffffffffc0200f74:	00001617          	auipc	a2,0x1
ffffffffc0200f78:	41460613          	addi	a2,a2,1044 # ffffffffc0202388 <commands+0x750>
ffffffffc0200f7c:	0dd00593          	li	a1,221
ffffffffc0200f80:	00001517          	auipc	a0,0x1
ffffffffc0200f84:	42050513          	addi	a0,a0,1056 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200f88:	9b4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200f8c:	00001697          	auipc	a3,0x1
ffffffffc0200f90:	44c68693          	addi	a3,a3,1100 # ffffffffc02023d8 <commands+0x7a0>
ffffffffc0200f94:	00001617          	auipc	a2,0x1
ffffffffc0200f98:	3f460613          	addi	a2,a2,1012 # ffffffffc0202388 <commands+0x750>
ffffffffc0200f9c:	0dc00593          	li	a1,220
ffffffffc0200fa0:	00001517          	auipc	a0,0x1
ffffffffc0200fa4:	40050513          	addi	a0,a0,1024 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200fa8:	994ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200fac:	00001697          	auipc	a3,0x1
ffffffffc0200fb0:	56c68693          	addi	a3,a3,1388 # ffffffffc0202518 <commands+0x8e0>
ffffffffc0200fb4:	00001617          	auipc	a2,0x1
ffffffffc0200fb8:	3d460613          	addi	a2,a2,980 # ffffffffc0202388 <commands+0x750>
ffffffffc0200fbc:	0da00593          	li	a1,218
ffffffffc0200fc0:	00001517          	auipc	a0,0x1
ffffffffc0200fc4:	3e050513          	addi	a0,a0,992 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200fc8:	974ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200fcc:	00001697          	auipc	a3,0x1
ffffffffc0200fd0:	53468693          	addi	a3,a3,1332 # ffffffffc0202500 <commands+0x8c8>
ffffffffc0200fd4:	00001617          	auipc	a2,0x1
ffffffffc0200fd8:	3b460613          	addi	a2,a2,948 # ffffffffc0202388 <commands+0x750>
ffffffffc0200fdc:	0d500593          	li	a1,213
ffffffffc0200fe0:	00001517          	auipc	a0,0x1
ffffffffc0200fe4:	3c050513          	addi	a0,a0,960 # ffffffffc02023a0 <commands+0x768>
ffffffffc0200fe8:	954ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0200fec:	00001697          	auipc	a3,0x1
ffffffffc0200ff0:	4f468693          	addi	a3,a3,1268 # ffffffffc02024e0 <commands+0x8a8>
ffffffffc0200ff4:	00001617          	auipc	a2,0x1
ffffffffc0200ff8:	39460613          	addi	a2,a2,916 # ffffffffc0202388 <commands+0x750>
ffffffffc0200ffc:	0cc00593          	li	a1,204
ffffffffc0201000:	00001517          	auipc	a0,0x1
ffffffffc0201004:	3a050513          	addi	a0,a0,928 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201008:	934ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020100c:	00001697          	auipc	a3,0x1
ffffffffc0201010:	4b468693          	addi	a3,a3,1204 # ffffffffc02024c0 <commands+0x888>
ffffffffc0201014:	00001617          	auipc	a2,0x1
ffffffffc0201018:	37460613          	addi	a2,a2,884 # ffffffffc0202388 <commands+0x750>
ffffffffc020101c:	0cb00593          	li	a1,203
ffffffffc0201020:	00001517          	auipc	a0,0x1
ffffffffc0201024:	38050513          	addi	a0,a0,896 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201028:	914ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020102c:	00001697          	auipc	a3,0x1
ffffffffc0201030:	63c68693          	addi	a3,a3,1596 # ffffffffc0202668 <commands+0xa30>
ffffffffc0201034:	00001617          	auipc	a2,0x1
ffffffffc0201038:	35460613          	addi	a2,a2,852 # ffffffffc0202388 <commands+0x750>
ffffffffc020103c:	13f00593          	li	a1,319
ffffffffc0201040:	00001517          	auipc	a0,0x1
ffffffffc0201044:	36050513          	addi	a0,a0,864 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201048:	8f4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020104c:	00001697          	auipc	a3,0x1
ffffffffc0201050:	51468693          	addi	a3,a3,1300 # ffffffffc0202560 <commands+0x928>
ffffffffc0201054:	00001617          	auipc	a2,0x1
ffffffffc0201058:	33460613          	addi	a2,a2,820 # ffffffffc0202388 <commands+0x750>
ffffffffc020105c:	13300593          	li	a1,307
ffffffffc0201060:	00001517          	auipc	a0,0x1
ffffffffc0201064:	34050513          	addi	a0,a0,832 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201068:	8d4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020106c:	00001697          	auipc	a3,0x1
ffffffffc0201070:	49468693          	addi	a3,a3,1172 # ffffffffc0202500 <commands+0x8c8>
ffffffffc0201074:	00001617          	auipc	a2,0x1
ffffffffc0201078:	31460613          	addi	a2,a2,788 # ffffffffc0202388 <commands+0x750>
ffffffffc020107c:	12d00593          	li	a1,301
ffffffffc0201080:	00001517          	auipc	a0,0x1
ffffffffc0201084:	32050513          	addi	a0,a0,800 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201088:	8b4ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020108c:	00001697          	auipc	a3,0x1
ffffffffc0201090:	5bc68693          	addi	a3,a3,1468 # ffffffffc0202648 <commands+0xa10>
ffffffffc0201094:	00001617          	auipc	a2,0x1
ffffffffc0201098:	2f460613          	addi	a2,a2,756 # ffffffffc0202388 <commands+0x750>
ffffffffc020109c:	12c00593          	li	a1,300
ffffffffc02010a0:	00001517          	auipc	a0,0x1
ffffffffc02010a4:	30050513          	addi	a0,a0,768 # ffffffffc02023a0 <commands+0x768>
ffffffffc02010a8:	894ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc02010ac:	00001697          	auipc	a3,0x1
ffffffffc02010b0:	58c68693          	addi	a3,a3,1420 # ffffffffc0202638 <commands+0xa00>
ffffffffc02010b4:	00001617          	auipc	a2,0x1
ffffffffc02010b8:	2d460613          	addi	a2,a2,724 # ffffffffc0202388 <commands+0x750>
ffffffffc02010bc:	12400593          	li	a1,292
ffffffffc02010c0:	00001517          	auipc	a0,0x1
ffffffffc02010c4:	2e050513          	addi	a0,a0,736 # ffffffffc02023a0 <commands+0x768>
ffffffffc02010c8:	874ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc02010cc:	00001697          	auipc	a3,0x1
ffffffffc02010d0:	55468693          	addi	a3,a3,1364 # ffffffffc0202620 <commands+0x9e8>
ffffffffc02010d4:	00001617          	auipc	a2,0x1
ffffffffc02010d8:	2b460613          	addi	a2,a2,692 # ffffffffc0202388 <commands+0x750>
ffffffffc02010dc:	12300593          	li	a1,291
ffffffffc02010e0:	00001517          	auipc	a0,0x1
ffffffffc02010e4:	2c050513          	addi	a0,a0,704 # ffffffffc02023a0 <commands+0x768>
ffffffffc02010e8:	854ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc02010ec:	00001697          	auipc	a3,0x1
ffffffffc02010f0:	51468693          	addi	a3,a3,1300 # ffffffffc0202600 <commands+0x9c8>
ffffffffc02010f4:	00001617          	auipc	a2,0x1
ffffffffc02010f8:	29460613          	addi	a2,a2,660 # ffffffffc0202388 <commands+0x750>
ffffffffc02010fc:	12200593          	li	a1,290
ffffffffc0201100:	00001517          	auipc	a0,0x1
ffffffffc0201104:	2a050513          	addi	a0,a0,672 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201108:	834ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020110c:	00001697          	auipc	a3,0x1
ffffffffc0201110:	4c468693          	addi	a3,a3,1220 # ffffffffc02025d0 <commands+0x998>
ffffffffc0201114:	00001617          	auipc	a2,0x1
ffffffffc0201118:	27460613          	addi	a2,a2,628 # ffffffffc0202388 <commands+0x750>
ffffffffc020111c:	12000593          	li	a1,288
ffffffffc0201120:	00001517          	auipc	a0,0x1
ffffffffc0201124:	28050513          	addi	a0,a0,640 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201128:	814ff0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020112c:	00001697          	auipc	a3,0x1
ffffffffc0201130:	48c68693          	addi	a3,a3,1164 # ffffffffc02025b8 <commands+0x980>
ffffffffc0201134:	00001617          	auipc	a2,0x1
ffffffffc0201138:	25460613          	addi	a2,a2,596 # ffffffffc0202388 <commands+0x750>
ffffffffc020113c:	11f00593          	li	a1,287
ffffffffc0201140:	00001517          	auipc	a0,0x1
ffffffffc0201144:	26050513          	addi	a0,a0,608 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201148:	ff5fe0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020114c:	00001697          	auipc	a3,0x1
ffffffffc0201150:	3b468693          	addi	a3,a3,948 # ffffffffc0202500 <commands+0x8c8>
ffffffffc0201154:	00001617          	auipc	a2,0x1
ffffffffc0201158:	23460613          	addi	a2,a2,564 # ffffffffc0202388 <commands+0x750>
ffffffffc020115c:	11300593          	li	a1,275
ffffffffc0201160:	00001517          	auipc	a0,0x1
ffffffffc0201164:	24050513          	addi	a0,a0,576 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201168:	fd5fe0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020116c:	00001697          	auipc	a3,0x1
ffffffffc0201170:	43468693          	addi	a3,a3,1076 # ffffffffc02025a0 <commands+0x968>
ffffffffc0201174:	00001617          	auipc	a2,0x1
ffffffffc0201178:	21460613          	addi	a2,a2,532 # ffffffffc0202388 <commands+0x750>
ffffffffc020117c:	10a00593          	li	a1,266
ffffffffc0201180:	00001517          	auipc	a0,0x1
ffffffffc0201184:	22050513          	addi	a0,a0,544 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201188:	fb5fe0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc020118c:	00001697          	auipc	a3,0x1
ffffffffc0201190:	40468693          	addi	a3,a3,1028 # ffffffffc0202590 <commands+0x958>
ffffffffc0201194:	00001617          	auipc	a2,0x1
ffffffffc0201198:	1f460613          	addi	a2,a2,500 # ffffffffc0202388 <commands+0x750>
ffffffffc020119c:	10900593          	li	a1,265
ffffffffc02011a0:	00001517          	auipc	a0,0x1
ffffffffc02011a4:	20050513          	addi	a0,a0,512 # ffffffffc02023a0 <commands+0x768>
ffffffffc02011a8:	f95fe0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc02011ac:	00001697          	auipc	a3,0x1
ffffffffc02011b0:	3b468693          	addi	a3,a3,948 # ffffffffc0202560 <commands+0x928>
ffffffffc02011b4:	00001617          	auipc	a2,0x1
ffffffffc02011b8:	1d460613          	addi	a2,a2,468 # ffffffffc0202388 <commands+0x750>
ffffffffc02011bc:	0e900593          	li	a1,233
ffffffffc02011c0:	00001517          	auipc	a0,0x1
ffffffffc02011c4:	1e050513          	addi	a0,a0,480 # ffffffffc02023a0 <commands+0x768>
ffffffffc02011c8:	f75fe0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc02011cc:	00001697          	auipc	a3,0x1
ffffffffc02011d0:	33468693          	addi	a3,a3,820 # ffffffffc0202500 <commands+0x8c8>
ffffffffc02011d4:	00001617          	auipc	a2,0x1
ffffffffc02011d8:	1b460613          	addi	a2,a2,436 # ffffffffc0202388 <commands+0x750>
ffffffffc02011dc:	0e700593          	li	a1,231
ffffffffc02011e0:	00001517          	auipc	a0,0x1
ffffffffc02011e4:	1c050513          	addi	a0,a0,448 # ffffffffc02023a0 <commands+0x768>
ffffffffc02011e8:	f55fe0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc02011ec:	00001697          	auipc	a3,0x1
ffffffffc02011f0:	35468693          	addi	a3,a3,852 # ffffffffc0202540 <commands+0x908>
ffffffffc02011f4:	00001617          	auipc	a2,0x1
ffffffffc02011f8:	19460613          	addi	a2,a2,404 # ffffffffc0202388 <commands+0x750>
ffffffffc02011fc:	0e600593          	li	a1,230
ffffffffc0201200:	00001517          	auipc	a0,0x1
ffffffffc0201204:	1a050513          	addi	a0,a0,416 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201208:	f35fe0ef          	jal	ra,ffffffffc020013c <__panic>

ffffffffc020120c <best_fit_free_pages>:
ffffffffc020120c:	1141                	addi	sp,sp,-16
ffffffffc020120e:	e406                	sd	ra,8(sp)
ffffffffc0201210:	16058c63          	beqz	a1,ffffffffc0201388 <best_fit_free_pages+0x17c>
ffffffffc0201214:	00259693          	slli	a3,a1,0x2
ffffffffc0201218:	96ae                	add	a3,a3,a1
ffffffffc020121a:	068e                	slli	a3,a3,0x3
ffffffffc020121c:	96aa                	add	a3,a3,a0
ffffffffc020121e:	02d50d63          	beq	a0,a3,ffffffffc0201258 <best_fit_free_pages+0x4c>
ffffffffc0201222:	651c                	ld	a5,8(a0)
ffffffffc0201224:	8b85                	andi	a5,a5,1
ffffffffc0201226:	14079163          	bnez	a5,ffffffffc0201368 <best_fit_free_pages+0x15c>
ffffffffc020122a:	651c                	ld	a5,8(a0)
ffffffffc020122c:	8385                	srli	a5,a5,0x1
ffffffffc020122e:	8b85                	andi	a5,a5,1
ffffffffc0201230:	12079c63          	bnez	a5,ffffffffc0201368 <best_fit_free_pages+0x15c>
ffffffffc0201234:	87aa                	mv	a5,a0
ffffffffc0201236:	a809                	j	ffffffffc0201248 <best_fit_free_pages+0x3c>
ffffffffc0201238:	6798                	ld	a4,8(a5)
ffffffffc020123a:	8b05                	andi	a4,a4,1
ffffffffc020123c:	12071663          	bnez	a4,ffffffffc0201368 <best_fit_free_pages+0x15c>
ffffffffc0201240:	6798                	ld	a4,8(a5)
ffffffffc0201242:	8b09                	andi	a4,a4,2
ffffffffc0201244:	12071263          	bnez	a4,ffffffffc0201368 <best_fit_free_pages+0x15c>
ffffffffc0201248:	0007b423          	sd	zero,8(a5)
ffffffffc020124c:	0007a023          	sw	zero,0(a5)
ffffffffc0201250:	02878793          	addi	a5,a5,40
ffffffffc0201254:	fed792e3          	bne	a5,a3,ffffffffc0201238 <best_fit_free_pages+0x2c>
ffffffffc0201258:	2581                	sext.w	a1,a1
ffffffffc020125a:	c90c                	sw	a1,16(a0)
ffffffffc020125c:	00850893          	addi	a7,a0,8
ffffffffc0201260:	4789                	li	a5,2
ffffffffc0201262:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201266:	00005617          	auipc	a2,0x5
ffffffffc020126a:	1f260613          	addi	a2,a2,498 # ffffffffc0206458 <free_area>
ffffffffc020126e:	4a18                	lw	a4,16(a2)
ffffffffc0201270:	661c                	ld	a5,8(a2)
ffffffffc0201272:	9db9                	addw	a1,a1,a4
ffffffffc0201274:	00005717          	auipc	a4,0x5
ffffffffc0201278:	1eb72a23          	sw	a1,500(a4) # ffffffffc0206468 <free_area+0x10>
ffffffffc020127c:	06c78963          	beq	a5,a2,ffffffffc02012ee <best_fit_free_pages+0xe2>
ffffffffc0201280:	01052803          	lw	a6,16(a0)
ffffffffc0201284:	0008059b          	sext.w	a1,a6
ffffffffc0201288:	a029                	j	ffffffffc0201292 <best_fit_free_pages+0x86>
ffffffffc020128a:	6798                	ld	a4,8(a5)
ffffffffc020128c:	06c70a63          	beq	a4,a2,ffffffffc0201300 <best_fit_free_pages+0xf4>
ffffffffc0201290:	87ba                	mv	a5,a4
ffffffffc0201292:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201296:	fed5fae3          	bgeu	a1,a3,ffffffffc020128a <best_fit_free_pages+0x7e>
ffffffffc020129a:	6398                	ld	a4,0(a5)
ffffffffc020129c:	01850693          	addi	a3,a0,24
ffffffffc02012a0:	e394                	sd	a3,0(a5)
ffffffffc02012a2:	e714                	sd	a3,8(a4)
ffffffffc02012a4:	f11c                	sd	a5,32(a0)
ffffffffc02012a6:	ed18                	sd	a4,24(a0)
ffffffffc02012a8:	02c70363          	beq	a4,a2,ffffffffc02012ce <best_fit_free_pages+0xc2>
ffffffffc02012ac:	ff872683          	lw	a3,-8(a4)
ffffffffc02012b0:	02069593          	slli	a1,a3,0x20
ffffffffc02012b4:	9181                	srli	a1,a1,0x20
ffffffffc02012b6:	00259793          	slli	a5,a1,0x2
ffffffffc02012ba:	97ae                	add	a5,a5,a1
ffffffffc02012bc:	078e                	slli	a5,a5,0x3
ffffffffc02012be:	fe870593          	addi	a1,a4,-24
ffffffffc02012c2:	97ae                	add	a5,a5,a1
ffffffffc02012c4:	06f50163          	beq	a0,a5,ffffffffc0201326 <best_fit_free_pages+0x11a>
ffffffffc02012c8:	711c                	ld	a5,32(a0)
ffffffffc02012ca:	00c78f63          	beq	a5,a2,ffffffffc02012e8 <best_fit_free_pages+0xdc>
ffffffffc02012ce:	490c                	lw	a1,16(a0)
ffffffffc02012d0:	fe878693          	addi	a3,a5,-24
ffffffffc02012d4:	02059613          	slli	a2,a1,0x20
ffffffffc02012d8:	9201                	srli	a2,a2,0x20
ffffffffc02012da:	00261713          	slli	a4,a2,0x2
ffffffffc02012de:	9732                	add	a4,a4,a2
ffffffffc02012e0:	070e                	slli	a4,a4,0x3
ffffffffc02012e2:	972a                	add	a4,a4,a0
ffffffffc02012e4:	06e68263          	beq	a3,a4,ffffffffc0201348 <best_fit_free_pages+0x13c>
ffffffffc02012e8:	60a2                	ld	ra,8(sp)
ffffffffc02012ea:	0141                	addi	sp,sp,16
ffffffffc02012ec:	8082                	ret
ffffffffc02012ee:	60a2                	ld	ra,8(sp)
ffffffffc02012f0:	01850713          	addi	a4,a0,24
ffffffffc02012f4:	e398                	sd	a4,0(a5)
ffffffffc02012f6:	e798                	sd	a4,8(a5)
ffffffffc02012f8:	f11c                	sd	a5,32(a0)
ffffffffc02012fa:	ed1c                	sd	a5,24(a0)
ffffffffc02012fc:	0141                	addi	sp,sp,16
ffffffffc02012fe:	8082                	ret
ffffffffc0201300:	01850713          	addi	a4,a0,24
ffffffffc0201304:	02069593          	slli	a1,a3,0x20
ffffffffc0201308:	e798                	sd	a4,8(a5)
ffffffffc020130a:	9181                	srli	a1,a1,0x20
ffffffffc020130c:	e218                	sd	a4,0(a2)
ffffffffc020130e:	ed1c                	sd	a5,24(a0)
ffffffffc0201310:	873e                	mv	a4,a5
ffffffffc0201312:	00259793          	slli	a5,a1,0x2
ffffffffc0201316:	97ae                	add	a5,a5,a1
ffffffffc0201318:	078e                	slli	a5,a5,0x3
ffffffffc020131a:	fe870593          	addi	a1,a4,-24
ffffffffc020131e:	f110                	sd	a2,32(a0)
ffffffffc0201320:	97ae                	add	a5,a5,a1
ffffffffc0201322:	faf513e3          	bne	a0,a5,ffffffffc02012c8 <best_fit_free_pages+0xbc>
ffffffffc0201326:	00d806bb          	addw	a3,a6,a3
ffffffffc020132a:	fed72c23          	sw	a3,-8(a4)
ffffffffc020132e:	57f5                	li	a5,-3
ffffffffc0201330:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201334:	01853803          	ld	a6,24(a0)
ffffffffc0201338:	7114                	ld	a3,32(a0)
ffffffffc020133a:	852e                	mv	a0,a1
ffffffffc020133c:	00d83423          	sd	a3,8(a6)
ffffffffc0201340:	671c                	ld	a5,8(a4)
ffffffffc0201342:	0106b023          	sd	a6,0(a3)
ffffffffc0201346:	b751                	j	ffffffffc02012ca <best_fit_free_pages+0xbe>
ffffffffc0201348:	ff87a703          	lw	a4,-8(a5)
ffffffffc020134c:	ff078693          	addi	a3,a5,-16
ffffffffc0201350:	9db9                	addw	a1,a1,a4
ffffffffc0201352:	c90c                	sw	a1,16(a0)
ffffffffc0201354:	5775                	li	a4,-3
ffffffffc0201356:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc020135a:	6398                	ld	a4,0(a5)
ffffffffc020135c:	679c                	ld	a5,8(a5)
ffffffffc020135e:	60a2                	ld	ra,8(sp)
ffffffffc0201360:	e71c                	sd	a5,8(a4)
ffffffffc0201362:	e398                	sd	a4,0(a5)
ffffffffc0201364:	0141                	addi	sp,sp,16
ffffffffc0201366:	8082                	ret
ffffffffc0201368:	00001697          	auipc	a3,0x1
ffffffffc020136c:	32068693          	addi	a3,a3,800 # ffffffffc0202688 <commands+0xa50>
ffffffffc0201370:	00001617          	auipc	a2,0x1
ffffffffc0201374:	01860613          	addi	a2,a2,24 # ffffffffc0202388 <commands+0x750>
ffffffffc0201378:	08900593          	li	a1,137
ffffffffc020137c:	00001517          	auipc	a0,0x1
ffffffffc0201380:	02450513          	addi	a0,a0,36 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201384:	db9fe0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0201388:	00001697          	auipc	a3,0x1
ffffffffc020138c:	32868693          	addi	a3,a3,808 # ffffffffc02026b0 <commands+0xa78>
ffffffffc0201390:	00001617          	auipc	a2,0x1
ffffffffc0201394:	ff860613          	addi	a2,a2,-8 # ffffffffc0202388 <commands+0x750>
ffffffffc0201398:	08600593          	li	a1,134
ffffffffc020139c:	00001517          	auipc	a0,0x1
ffffffffc02013a0:	00450513          	addi	a0,a0,4 # ffffffffc02023a0 <commands+0x768>
ffffffffc02013a4:	d99fe0ef          	jal	ra,ffffffffc020013c <__panic>

ffffffffc02013a8 <best_fit_alloc_pages>:
ffffffffc02013a8:	cd51                	beqz	a0,ffffffffc0201444 <best_fit_alloc_pages+0x9c>
ffffffffc02013aa:	00005597          	auipc	a1,0x5
ffffffffc02013ae:	0ae58593          	addi	a1,a1,174 # ffffffffc0206458 <free_area>
ffffffffc02013b2:	0105a803          	lw	a6,16(a1)
ffffffffc02013b6:	862a                	mv	a2,a0
ffffffffc02013b8:	02081793          	slli	a5,a6,0x20
ffffffffc02013bc:	9381                	srli	a5,a5,0x20
ffffffffc02013be:	00a7ee63          	bltu	a5,a0,ffffffffc02013da <best_fit_alloc_pages+0x32>
ffffffffc02013c2:	87ae                	mv	a5,a1
ffffffffc02013c4:	a801                	j	ffffffffc02013d4 <best_fit_alloc_pages+0x2c>
ffffffffc02013c6:	ff87a703          	lw	a4,-8(a5)
ffffffffc02013ca:	02071693          	slli	a3,a4,0x20
ffffffffc02013ce:	9281                	srli	a3,a3,0x20
ffffffffc02013d0:	00c6f763          	bgeu	a3,a2,ffffffffc02013de <best_fit_alloc_pages+0x36>
ffffffffc02013d4:	679c                	ld	a5,8(a5)
ffffffffc02013d6:	feb798e3          	bne	a5,a1,ffffffffc02013c6 <best_fit_alloc_pages+0x1e>
ffffffffc02013da:	4501                	li	a0,0
ffffffffc02013dc:	8082                	ret
ffffffffc02013de:	fe878513          	addi	a0,a5,-24
ffffffffc02013e2:	dd6d                	beqz	a0,ffffffffc02013dc <best_fit_alloc_pages+0x34>
ffffffffc02013e4:	0007b883          	ld	a7,0(a5)
ffffffffc02013e8:	0087b303          	ld	t1,8(a5)
ffffffffc02013ec:	00060e1b          	sext.w	t3,a2
ffffffffc02013f0:	0068b423          	sd	t1,8(a7)
ffffffffc02013f4:	01133023          	sd	a7,0(t1)
ffffffffc02013f8:	02d67b63          	bgeu	a2,a3,ffffffffc020142e <best_fit_alloc_pages+0x86>
ffffffffc02013fc:	00261693          	slli	a3,a2,0x2
ffffffffc0201400:	96b2                	add	a3,a3,a2
ffffffffc0201402:	068e                	slli	a3,a3,0x3
ffffffffc0201404:	96aa                	add	a3,a3,a0
ffffffffc0201406:	41c7073b          	subw	a4,a4,t3
ffffffffc020140a:	ca98                	sw	a4,16(a3)
ffffffffc020140c:	00868613          	addi	a2,a3,8
ffffffffc0201410:	4709                	li	a4,2
ffffffffc0201412:	40e6302f          	amoor.d	zero,a4,(a2)
ffffffffc0201416:	0088b703          	ld	a4,8(a7)
ffffffffc020141a:	01868613          	addi	a2,a3,24
ffffffffc020141e:	0105a803          	lw	a6,16(a1)
ffffffffc0201422:	e310                	sd	a2,0(a4)
ffffffffc0201424:	00c8b423          	sd	a2,8(a7)
ffffffffc0201428:	f298                	sd	a4,32(a3)
ffffffffc020142a:	0116bc23          	sd	a7,24(a3)
ffffffffc020142e:	41c8083b          	subw	a6,a6,t3
ffffffffc0201432:	00005717          	auipc	a4,0x5
ffffffffc0201436:	03072b23          	sw	a6,54(a4) # ffffffffc0206468 <free_area+0x10>
ffffffffc020143a:	5775                	li	a4,-3
ffffffffc020143c:	17c1                	addi	a5,a5,-16
ffffffffc020143e:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201442:	8082                	ret
ffffffffc0201444:	1141                	addi	sp,sp,-16
ffffffffc0201446:	00001697          	auipc	a3,0x1
ffffffffc020144a:	26a68693          	addi	a3,a3,618 # ffffffffc02026b0 <commands+0xa78>
ffffffffc020144e:	00001617          	auipc	a2,0x1
ffffffffc0201452:	f3a60613          	addi	a2,a2,-198 # ffffffffc0202388 <commands+0x750>
ffffffffc0201456:	06600593          	li	a1,102
ffffffffc020145a:	00001517          	auipc	a0,0x1
ffffffffc020145e:	f4650513          	addi	a0,a0,-186 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201462:	e406                	sd	ra,8(sp)
ffffffffc0201464:	cd9fe0ef          	jal	ra,ffffffffc020013c <__panic>

ffffffffc0201468 <best_fit_init_memmap>:
ffffffffc0201468:	1141                	addi	sp,sp,-16
ffffffffc020146a:	e406                	sd	ra,8(sp)
ffffffffc020146c:	c5ed                	beqz	a1,ffffffffc0201556 <best_fit_init_memmap+0xee>
ffffffffc020146e:	00259693          	slli	a3,a1,0x2
ffffffffc0201472:	96ae                	add	a3,a3,a1
ffffffffc0201474:	068e                	slli	a3,a3,0x3
ffffffffc0201476:	96aa                	add	a3,a3,a0
ffffffffc0201478:	02d50463          	beq	a0,a3,ffffffffc02014a0 <best_fit_init_memmap+0x38>
ffffffffc020147c:	6518                	ld	a4,8(a0)
ffffffffc020147e:	87aa                	mv	a5,a0
ffffffffc0201480:	8b05                	andi	a4,a4,1
ffffffffc0201482:	e709                	bnez	a4,ffffffffc020148c <best_fit_init_memmap+0x24>
ffffffffc0201484:	a84d                	j	ffffffffc0201536 <best_fit_init_memmap+0xce>
ffffffffc0201486:	6798                	ld	a4,8(a5)
ffffffffc0201488:	8b05                	andi	a4,a4,1
ffffffffc020148a:	c755                	beqz	a4,ffffffffc0201536 <best_fit_init_memmap+0xce>
ffffffffc020148c:	0007a823          	sw	zero,16(a5)
ffffffffc0201490:	0007b423          	sd	zero,8(a5)
ffffffffc0201494:	0007a023          	sw	zero,0(a5)
ffffffffc0201498:	02878793          	addi	a5,a5,40
ffffffffc020149c:	fed795e3          	bne	a5,a3,ffffffffc0201486 <best_fit_init_memmap+0x1e>
ffffffffc02014a0:	2581                	sext.w	a1,a1
ffffffffc02014a2:	c90c                	sw	a1,16(a0)
ffffffffc02014a4:	4789                	li	a5,2
ffffffffc02014a6:	00850713          	addi	a4,a0,8
ffffffffc02014aa:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc02014ae:	00005697          	auipc	a3,0x5
ffffffffc02014b2:	faa68693          	addi	a3,a3,-86 # ffffffffc0206458 <free_area>
ffffffffc02014b6:	4a98                	lw	a4,16(a3)
ffffffffc02014b8:	669c                	ld	a5,8(a3)
ffffffffc02014ba:	9db9                	addw	a1,a1,a4
ffffffffc02014bc:	00005717          	auipc	a4,0x5
ffffffffc02014c0:	fab72623          	sw	a1,-84(a4) # ffffffffc0206468 <free_area+0x10>
ffffffffc02014c4:	04d78c63          	beq	a5,a3,ffffffffc020151c <best_fit_init_memmap+0xb4>
ffffffffc02014c8:	4910                	lw	a2,16(a0)
ffffffffc02014ca:	ff87a703          	lw	a4,-8(a5)
ffffffffc02014ce:	0006b803          	ld	a6,0(a3)
ffffffffc02014d2:	4881                	li	a7,0
ffffffffc02014d4:	01850593          	addi	a1,a0,24
ffffffffc02014d8:	00e66a63          	bltu	a2,a4,ffffffffc02014ec <best_fit_init_memmap+0x84>
ffffffffc02014dc:	6798                	ld	a4,8(a5)
ffffffffc02014de:	02d70563          	beq	a4,a3,ffffffffc0201508 <best_fit_init_memmap+0xa0>
ffffffffc02014e2:	87ba                	mv	a5,a4
ffffffffc02014e4:	ff87a703          	lw	a4,-8(a5)
ffffffffc02014e8:	fee67ae3          	bgeu	a2,a4,ffffffffc02014dc <best_fit_init_memmap+0x74>
ffffffffc02014ec:	00088663          	beqz	a7,ffffffffc02014f8 <best_fit_init_memmap+0x90>
ffffffffc02014f0:	00005717          	auipc	a4,0x5
ffffffffc02014f4:	f7073423          	sd	a6,-152(a4) # ffffffffc0206458 <free_area>
ffffffffc02014f8:	6398                	ld	a4,0(a5)
ffffffffc02014fa:	60a2                	ld	ra,8(sp)
ffffffffc02014fc:	e38c                	sd	a1,0(a5)
ffffffffc02014fe:	e70c                	sd	a1,8(a4)
ffffffffc0201500:	f11c                	sd	a5,32(a0)
ffffffffc0201502:	ed18                	sd	a4,24(a0)
ffffffffc0201504:	0141                	addi	sp,sp,16
ffffffffc0201506:	8082                	ret
ffffffffc0201508:	e78c                	sd	a1,8(a5)
ffffffffc020150a:	f114                	sd	a3,32(a0)
ffffffffc020150c:	6798                	ld	a4,8(a5)
ffffffffc020150e:	ed1c                	sd	a5,24(a0)
ffffffffc0201510:	882e                	mv	a6,a1
ffffffffc0201512:	00d70e63          	beq	a4,a3,ffffffffc020152e <best_fit_init_memmap+0xc6>
ffffffffc0201516:	4885                	li	a7,1
ffffffffc0201518:	87ba                	mv	a5,a4
ffffffffc020151a:	b7e9                	j	ffffffffc02014e4 <best_fit_init_memmap+0x7c>
ffffffffc020151c:	60a2                	ld	ra,8(sp)
ffffffffc020151e:	01850713          	addi	a4,a0,24
ffffffffc0201522:	e398                	sd	a4,0(a5)
ffffffffc0201524:	e798                	sd	a4,8(a5)
ffffffffc0201526:	f11c                	sd	a5,32(a0)
ffffffffc0201528:	ed1c                	sd	a5,24(a0)
ffffffffc020152a:	0141                	addi	sp,sp,16
ffffffffc020152c:	8082                	ret
ffffffffc020152e:	60a2                	ld	ra,8(sp)
ffffffffc0201530:	e28c                	sd	a1,0(a3)
ffffffffc0201532:	0141                	addi	sp,sp,16
ffffffffc0201534:	8082                	ret
ffffffffc0201536:	00001697          	auipc	a3,0x1
ffffffffc020153a:	18268693          	addi	a3,a3,386 # ffffffffc02026b8 <commands+0xa80>
ffffffffc020153e:	00001617          	auipc	a2,0x1
ffffffffc0201542:	e4a60613          	addi	a2,a2,-438 # ffffffffc0202388 <commands+0x750>
ffffffffc0201546:	04b00593          	li	a1,75
ffffffffc020154a:	00001517          	auipc	a0,0x1
ffffffffc020154e:	e5650513          	addi	a0,a0,-426 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201552:	bebfe0ef          	jal	ra,ffffffffc020013c <__panic>
ffffffffc0201556:	00001697          	auipc	a3,0x1
ffffffffc020155a:	15a68693          	addi	a3,a3,346 # ffffffffc02026b0 <commands+0xa78>
ffffffffc020155e:	00001617          	auipc	a2,0x1
ffffffffc0201562:	e2a60613          	addi	a2,a2,-470 # ffffffffc0202388 <commands+0x750>
ffffffffc0201566:	04800593          	li	a1,72
ffffffffc020156a:	00001517          	auipc	a0,0x1
ffffffffc020156e:	e3650513          	addi	a0,a0,-458 # ffffffffc02023a0 <commands+0x768>
ffffffffc0201572:	bcbfe0ef          	jal	ra,ffffffffc020013c <__panic>

ffffffffc0201576 <strnlen>:
ffffffffc0201576:	c185                	beqz	a1,ffffffffc0201596 <strnlen+0x20>
ffffffffc0201578:	00054783          	lbu	a5,0(a0)
ffffffffc020157c:	cf89                	beqz	a5,ffffffffc0201596 <strnlen+0x20>
ffffffffc020157e:	4781                	li	a5,0
ffffffffc0201580:	a021                	j	ffffffffc0201588 <strnlen+0x12>
ffffffffc0201582:	00074703          	lbu	a4,0(a4)
ffffffffc0201586:	c711                	beqz	a4,ffffffffc0201592 <strnlen+0x1c>
ffffffffc0201588:	0785                	addi	a5,a5,1
ffffffffc020158a:	00f50733          	add	a4,a0,a5
ffffffffc020158e:	fef59ae3          	bne	a1,a5,ffffffffc0201582 <strnlen+0xc>
ffffffffc0201592:	853e                	mv	a0,a5
ffffffffc0201594:	8082                	ret
ffffffffc0201596:	4781                	li	a5,0
ffffffffc0201598:	853e                	mv	a0,a5
ffffffffc020159a:	8082                	ret

ffffffffc020159c <strcmp>:
ffffffffc020159c:	00054783          	lbu	a5,0(a0)
ffffffffc02015a0:	0005c703          	lbu	a4,0(a1)
ffffffffc02015a4:	cb91                	beqz	a5,ffffffffc02015b8 <strcmp+0x1c>
ffffffffc02015a6:	00e79c63          	bne	a5,a4,ffffffffc02015be <strcmp+0x22>
ffffffffc02015aa:	0505                	addi	a0,a0,1
ffffffffc02015ac:	00054783          	lbu	a5,0(a0)
ffffffffc02015b0:	0585                	addi	a1,a1,1
ffffffffc02015b2:	0005c703          	lbu	a4,0(a1)
ffffffffc02015b6:	fbe5                	bnez	a5,ffffffffc02015a6 <strcmp+0xa>
ffffffffc02015b8:	4501                	li	a0,0
ffffffffc02015ba:	9d19                	subw	a0,a0,a4
ffffffffc02015bc:	8082                	ret
ffffffffc02015be:	0007851b          	sext.w	a0,a5
ffffffffc02015c2:	9d19                	subw	a0,a0,a4
ffffffffc02015c4:	8082                	ret

ffffffffc02015c6 <strchr>:
ffffffffc02015c6:	00054783          	lbu	a5,0(a0)
ffffffffc02015ca:	cb91                	beqz	a5,ffffffffc02015de <strchr+0x18>
ffffffffc02015cc:	00b79563          	bne	a5,a1,ffffffffc02015d6 <strchr+0x10>
ffffffffc02015d0:	a809                	j	ffffffffc02015e2 <strchr+0x1c>
ffffffffc02015d2:	00b78763          	beq	a5,a1,ffffffffc02015e0 <strchr+0x1a>
ffffffffc02015d6:	0505                	addi	a0,a0,1
ffffffffc02015d8:	00054783          	lbu	a5,0(a0)
ffffffffc02015dc:	fbfd                	bnez	a5,ffffffffc02015d2 <strchr+0xc>
ffffffffc02015de:	4501                	li	a0,0
ffffffffc02015e0:	8082                	ret
ffffffffc02015e2:	8082                	ret

ffffffffc02015e4 <memset>:
ffffffffc02015e4:	ca01                	beqz	a2,ffffffffc02015f4 <memset+0x10>
ffffffffc02015e6:	962a                	add	a2,a2,a0
ffffffffc02015e8:	87aa                	mv	a5,a0
ffffffffc02015ea:	0785                	addi	a5,a5,1
ffffffffc02015ec:	feb78fa3          	sb	a1,-1(a5)
ffffffffc02015f0:	fec79de3          	bne	a5,a2,ffffffffc02015ea <memset+0x6>
ffffffffc02015f4:	8082                	ret

ffffffffc02015f6 <printnum>:
ffffffffc02015f6:	02069813          	slli	a6,a3,0x20
ffffffffc02015fa:	7179                	addi	sp,sp,-48
ffffffffc02015fc:	02085813          	srli	a6,a6,0x20
ffffffffc0201600:	e052                	sd	s4,0(sp)
ffffffffc0201602:	03067a33          	remu	s4,a2,a6
ffffffffc0201606:	f022                	sd	s0,32(sp)
ffffffffc0201608:	ec26                	sd	s1,24(sp)
ffffffffc020160a:	e84a                	sd	s2,16(sp)
ffffffffc020160c:	f406                	sd	ra,40(sp)
ffffffffc020160e:	e44e                	sd	s3,8(sp)
ffffffffc0201610:	84aa                	mv	s1,a0
ffffffffc0201612:	892e                	mv	s2,a1
ffffffffc0201614:	fff7041b          	addiw	s0,a4,-1
ffffffffc0201618:	2a01                	sext.w	s4,s4
ffffffffc020161a:	03067e63          	bgeu	a2,a6,ffffffffc0201656 <printnum+0x60>
ffffffffc020161e:	89be                	mv	s3,a5
ffffffffc0201620:	00805763          	blez	s0,ffffffffc020162e <printnum+0x38>
ffffffffc0201624:	347d                	addiw	s0,s0,-1
ffffffffc0201626:	85ca                	mv	a1,s2
ffffffffc0201628:	854e                	mv	a0,s3
ffffffffc020162a:	9482                	jalr	s1
ffffffffc020162c:	fc65                	bnez	s0,ffffffffc0201624 <printnum+0x2e>
ffffffffc020162e:	1a02                	slli	s4,s4,0x20
ffffffffc0201630:	020a5a13          	srli	s4,s4,0x20
ffffffffc0201634:	00001797          	auipc	a5,0x1
ffffffffc0201638:	27478793          	addi	a5,a5,628 # ffffffffc02028a8 <error_string+0x38>
ffffffffc020163c:	9a3e                	add	s4,s4,a5
ffffffffc020163e:	7402                	ld	s0,32(sp)
ffffffffc0201640:	000a4503          	lbu	a0,0(s4)
ffffffffc0201644:	70a2                	ld	ra,40(sp)
ffffffffc0201646:	69a2                	ld	s3,8(sp)
ffffffffc0201648:	6a02                	ld	s4,0(sp)
ffffffffc020164a:	85ca                	mv	a1,s2
ffffffffc020164c:	8326                	mv	t1,s1
ffffffffc020164e:	6942                	ld	s2,16(sp)
ffffffffc0201650:	64e2                	ld	s1,24(sp)
ffffffffc0201652:	6145                	addi	sp,sp,48
ffffffffc0201654:	8302                	jr	t1
ffffffffc0201656:	03065633          	divu	a2,a2,a6
ffffffffc020165a:	8722                	mv	a4,s0
ffffffffc020165c:	f9bff0ef          	jal	ra,ffffffffc02015f6 <printnum>
ffffffffc0201660:	b7f9                	j	ffffffffc020162e <printnum+0x38>

ffffffffc0201662 <vprintfmt>:
ffffffffc0201662:	7119                	addi	sp,sp,-128
ffffffffc0201664:	f4a6                	sd	s1,104(sp)
ffffffffc0201666:	f0ca                	sd	s2,96(sp)
ffffffffc0201668:	e8d2                	sd	s4,80(sp)
ffffffffc020166a:	e4d6                	sd	s5,72(sp)
ffffffffc020166c:	e0da                	sd	s6,64(sp)
ffffffffc020166e:	fc5e                	sd	s7,56(sp)
ffffffffc0201670:	f862                	sd	s8,48(sp)
ffffffffc0201672:	f06a                	sd	s10,32(sp)
ffffffffc0201674:	fc86                	sd	ra,120(sp)
ffffffffc0201676:	f8a2                	sd	s0,112(sp)
ffffffffc0201678:	ecce                	sd	s3,88(sp)
ffffffffc020167a:	f466                	sd	s9,40(sp)
ffffffffc020167c:	ec6e                	sd	s11,24(sp)
ffffffffc020167e:	892a                	mv	s2,a0
ffffffffc0201680:	84ae                	mv	s1,a1
ffffffffc0201682:	8d32                	mv	s10,a2
ffffffffc0201684:	8ab6                	mv	s5,a3
ffffffffc0201686:	5b7d                	li	s6,-1
ffffffffc0201688:	00001a17          	auipc	s4,0x1
ffffffffc020168c:	090a0a13          	addi	s4,s4,144 # ffffffffc0202718 <best_fit_pmm_manager+0x50>
ffffffffc0201690:	05e00b93          	li	s7,94
ffffffffc0201694:	00001c17          	auipc	s8,0x1
ffffffffc0201698:	1dcc0c13          	addi	s8,s8,476 # ffffffffc0202870 <error_string>
ffffffffc020169c:	000d4503          	lbu	a0,0(s10)
ffffffffc02016a0:	02500793          	li	a5,37
ffffffffc02016a4:	001d0413          	addi	s0,s10,1
ffffffffc02016a8:	00f50e63          	beq	a0,a5,ffffffffc02016c4 <vprintfmt+0x62>
ffffffffc02016ac:	c521                	beqz	a0,ffffffffc02016f4 <vprintfmt+0x92>
ffffffffc02016ae:	02500993          	li	s3,37
ffffffffc02016b2:	a011                	j	ffffffffc02016b6 <vprintfmt+0x54>
ffffffffc02016b4:	c121                	beqz	a0,ffffffffc02016f4 <vprintfmt+0x92>
ffffffffc02016b6:	85a6                	mv	a1,s1
ffffffffc02016b8:	0405                	addi	s0,s0,1
ffffffffc02016ba:	9902                	jalr	s2
ffffffffc02016bc:	fff44503          	lbu	a0,-1(s0)
ffffffffc02016c0:	ff351ae3          	bne	a0,s3,ffffffffc02016b4 <vprintfmt+0x52>
ffffffffc02016c4:	00044603          	lbu	a2,0(s0)
ffffffffc02016c8:	02000793          	li	a5,32
ffffffffc02016cc:	4981                	li	s3,0
ffffffffc02016ce:	4801                	li	a6,0
ffffffffc02016d0:	5cfd                	li	s9,-1
ffffffffc02016d2:	5dfd                	li	s11,-1
ffffffffc02016d4:	05500593          	li	a1,85
ffffffffc02016d8:	4525                	li	a0,9
ffffffffc02016da:	fdd6069b          	addiw	a3,a2,-35
ffffffffc02016de:	0ff6f693          	andi	a3,a3,255
ffffffffc02016e2:	00140d13          	addi	s10,s0,1
ffffffffc02016e6:	1ed5ef63          	bltu	a1,a3,ffffffffc02018e4 <vprintfmt+0x282>
ffffffffc02016ea:	068a                	slli	a3,a3,0x2
ffffffffc02016ec:	96d2                	add	a3,a3,s4
ffffffffc02016ee:	4294                	lw	a3,0(a3)
ffffffffc02016f0:	96d2                	add	a3,a3,s4
ffffffffc02016f2:	8682                	jr	a3
ffffffffc02016f4:	70e6                	ld	ra,120(sp)
ffffffffc02016f6:	7446                	ld	s0,112(sp)
ffffffffc02016f8:	74a6                	ld	s1,104(sp)
ffffffffc02016fa:	7906                	ld	s2,96(sp)
ffffffffc02016fc:	69e6                	ld	s3,88(sp)
ffffffffc02016fe:	6a46                	ld	s4,80(sp)
ffffffffc0201700:	6aa6                	ld	s5,72(sp)
ffffffffc0201702:	6b06                	ld	s6,64(sp)
ffffffffc0201704:	7be2                	ld	s7,56(sp)
ffffffffc0201706:	7c42                	ld	s8,48(sp)
ffffffffc0201708:	7ca2                	ld	s9,40(sp)
ffffffffc020170a:	7d02                	ld	s10,32(sp)
ffffffffc020170c:	6de2                	ld	s11,24(sp)
ffffffffc020170e:	6109                	addi	sp,sp,128
ffffffffc0201710:	8082                	ret
ffffffffc0201712:	87b2                	mv	a5,a2
ffffffffc0201714:	00144603          	lbu	a2,1(s0)
ffffffffc0201718:	846a                	mv	s0,s10
ffffffffc020171a:	b7c1                	j	ffffffffc02016da <vprintfmt+0x78>
ffffffffc020171c:	000aac83          	lw	s9,0(s5)
ffffffffc0201720:	00144603          	lbu	a2,1(s0)
ffffffffc0201724:	0aa1                	addi	s5,s5,8
ffffffffc0201726:	846a                	mv	s0,s10
ffffffffc0201728:	fa0dd9e3          	bgez	s11,ffffffffc02016da <vprintfmt+0x78>
ffffffffc020172c:	8de6                	mv	s11,s9
ffffffffc020172e:	5cfd                	li	s9,-1
ffffffffc0201730:	b76d                	j	ffffffffc02016da <vprintfmt+0x78>
ffffffffc0201732:	fffdc693          	not	a3,s11
ffffffffc0201736:	96fd                	srai	a3,a3,0x3f
ffffffffc0201738:	00ddfdb3          	and	s11,s11,a3
ffffffffc020173c:	00144603          	lbu	a2,1(s0)
ffffffffc0201740:	2d81                	sext.w	s11,s11
ffffffffc0201742:	846a                	mv	s0,s10
ffffffffc0201744:	bf59                	j	ffffffffc02016da <vprintfmt+0x78>
ffffffffc0201746:	4705                	li	a4,1
ffffffffc0201748:	008a8593          	addi	a1,s5,8
ffffffffc020174c:	01074463          	blt	a4,a6,ffffffffc0201754 <vprintfmt+0xf2>
ffffffffc0201750:	22080863          	beqz	a6,ffffffffc0201980 <vprintfmt+0x31e>
ffffffffc0201754:	000ab603          	ld	a2,0(s5)
ffffffffc0201758:	46c1                	li	a3,16
ffffffffc020175a:	8aae                	mv	s5,a1
ffffffffc020175c:	a291                	j	ffffffffc02018a0 <vprintfmt+0x23e>
ffffffffc020175e:	fd060c9b          	addiw	s9,a2,-48
ffffffffc0201762:	00144603          	lbu	a2,1(s0)
ffffffffc0201766:	846a                	mv	s0,s10
ffffffffc0201768:	fd06069b          	addiw	a3,a2,-48
ffffffffc020176c:	0006089b          	sext.w	a7,a2
ffffffffc0201770:	fad56ce3          	bltu	a0,a3,ffffffffc0201728 <vprintfmt+0xc6>
ffffffffc0201774:	0405                	addi	s0,s0,1
ffffffffc0201776:	002c969b          	slliw	a3,s9,0x2
ffffffffc020177a:	00044603          	lbu	a2,0(s0)
ffffffffc020177e:	0196873b          	addw	a4,a3,s9
ffffffffc0201782:	0017171b          	slliw	a4,a4,0x1
ffffffffc0201786:	0117073b          	addw	a4,a4,a7
ffffffffc020178a:	fd06069b          	addiw	a3,a2,-48
ffffffffc020178e:	fd070c9b          	addiw	s9,a4,-48
ffffffffc0201792:	0006089b          	sext.w	a7,a2
ffffffffc0201796:	fcd57fe3          	bgeu	a0,a3,ffffffffc0201774 <vprintfmt+0x112>
ffffffffc020179a:	b779                	j	ffffffffc0201728 <vprintfmt+0xc6>
ffffffffc020179c:	000aa503          	lw	a0,0(s5)
ffffffffc02017a0:	85a6                	mv	a1,s1
ffffffffc02017a2:	0aa1                	addi	s5,s5,8
ffffffffc02017a4:	9902                	jalr	s2
ffffffffc02017a6:	bddd                	j	ffffffffc020169c <vprintfmt+0x3a>
ffffffffc02017a8:	4705                	li	a4,1
ffffffffc02017aa:	008a8993          	addi	s3,s5,8
ffffffffc02017ae:	01074463          	blt	a4,a6,ffffffffc02017b6 <vprintfmt+0x154>
ffffffffc02017b2:	1c080463          	beqz	a6,ffffffffc020197a <vprintfmt+0x318>
ffffffffc02017b6:	000ab403          	ld	s0,0(s5)
ffffffffc02017ba:	1c044a63          	bltz	s0,ffffffffc020198e <vprintfmt+0x32c>
ffffffffc02017be:	8622                	mv	a2,s0
ffffffffc02017c0:	8ace                	mv	s5,s3
ffffffffc02017c2:	46a9                	li	a3,10
ffffffffc02017c4:	a8f1                	j	ffffffffc02018a0 <vprintfmt+0x23e>
ffffffffc02017c6:	000aa783          	lw	a5,0(s5)
ffffffffc02017ca:	4719                	li	a4,6
ffffffffc02017cc:	0aa1                	addi	s5,s5,8
ffffffffc02017ce:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc02017d2:	8fb5                	xor	a5,a5,a3
ffffffffc02017d4:	40d786bb          	subw	a3,a5,a3
ffffffffc02017d8:	12d74963          	blt	a4,a3,ffffffffc020190a <vprintfmt+0x2a8>
ffffffffc02017dc:	00369793          	slli	a5,a3,0x3
ffffffffc02017e0:	97e2                	add	a5,a5,s8
ffffffffc02017e2:	639c                	ld	a5,0(a5)
ffffffffc02017e4:	12078363          	beqz	a5,ffffffffc020190a <vprintfmt+0x2a8>
ffffffffc02017e8:	86be                	mv	a3,a5
ffffffffc02017ea:	00001617          	auipc	a2,0x1
ffffffffc02017ee:	16e60613          	addi	a2,a2,366 # ffffffffc0202958 <error_string+0xe8>
ffffffffc02017f2:	85a6                	mv	a1,s1
ffffffffc02017f4:	854a                	mv	a0,s2
ffffffffc02017f6:	1cc000ef          	jal	ra,ffffffffc02019c2 <printfmt>
ffffffffc02017fa:	b54d                	j	ffffffffc020169c <vprintfmt+0x3a>
ffffffffc02017fc:	000ab603          	ld	a2,0(s5)
ffffffffc0201800:	0aa1                	addi	s5,s5,8
ffffffffc0201802:	1a060163          	beqz	a2,ffffffffc02019a4 <vprintfmt+0x342>
ffffffffc0201806:	00160413          	addi	s0,a2,1
ffffffffc020180a:	15b05763          	blez	s11,ffffffffc0201958 <vprintfmt+0x2f6>
ffffffffc020180e:	02d00593          	li	a1,45
ffffffffc0201812:	10b79d63          	bne	a5,a1,ffffffffc020192c <vprintfmt+0x2ca>
ffffffffc0201816:	00064783          	lbu	a5,0(a2)
ffffffffc020181a:	0007851b          	sext.w	a0,a5
ffffffffc020181e:	c905                	beqz	a0,ffffffffc020184e <vprintfmt+0x1ec>
ffffffffc0201820:	000cc563          	bltz	s9,ffffffffc020182a <vprintfmt+0x1c8>
ffffffffc0201824:	3cfd                	addiw	s9,s9,-1
ffffffffc0201826:	036c8263          	beq	s9,s6,ffffffffc020184a <vprintfmt+0x1e8>
ffffffffc020182a:	85a6                	mv	a1,s1
ffffffffc020182c:	14098f63          	beqz	s3,ffffffffc020198a <vprintfmt+0x328>
ffffffffc0201830:	3781                	addiw	a5,a5,-32
ffffffffc0201832:	14fbfc63          	bgeu	s7,a5,ffffffffc020198a <vprintfmt+0x328>
ffffffffc0201836:	03f00513          	li	a0,63
ffffffffc020183a:	9902                	jalr	s2
ffffffffc020183c:	0405                	addi	s0,s0,1
ffffffffc020183e:	fff44783          	lbu	a5,-1(s0)
ffffffffc0201842:	3dfd                	addiw	s11,s11,-1
ffffffffc0201844:	0007851b          	sext.w	a0,a5
ffffffffc0201848:	fd61                	bnez	a0,ffffffffc0201820 <vprintfmt+0x1be>
ffffffffc020184a:	e5b059e3          	blez	s11,ffffffffc020169c <vprintfmt+0x3a>
ffffffffc020184e:	3dfd                	addiw	s11,s11,-1
ffffffffc0201850:	85a6                	mv	a1,s1
ffffffffc0201852:	02000513          	li	a0,32
ffffffffc0201856:	9902                	jalr	s2
ffffffffc0201858:	e40d82e3          	beqz	s11,ffffffffc020169c <vprintfmt+0x3a>
ffffffffc020185c:	3dfd                	addiw	s11,s11,-1
ffffffffc020185e:	85a6                	mv	a1,s1
ffffffffc0201860:	02000513          	li	a0,32
ffffffffc0201864:	9902                	jalr	s2
ffffffffc0201866:	fe0d94e3          	bnez	s11,ffffffffc020184e <vprintfmt+0x1ec>
ffffffffc020186a:	bd0d                	j	ffffffffc020169c <vprintfmt+0x3a>
ffffffffc020186c:	4705                	li	a4,1
ffffffffc020186e:	008a8593          	addi	a1,s5,8
ffffffffc0201872:	01074463          	blt	a4,a6,ffffffffc020187a <vprintfmt+0x218>
ffffffffc0201876:	0e080863          	beqz	a6,ffffffffc0201966 <vprintfmt+0x304>
ffffffffc020187a:	000ab603          	ld	a2,0(s5)
ffffffffc020187e:	46a1                	li	a3,8
ffffffffc0201880:	8aae                	mv	s5,a1
ffffffffc0201882:	a839                	j	ffffffffc02018a0 <vprintfmt+0x23e>
ffffffffc0201884:	03000513          	li	a0,48
ffffffffc0201888:	85a6                	mv	a1,s1
ffffffffc020188a:	e03e                	sd	a5,0(sp)
ffffffffc020188c:	9902                	jalr	s2
ffffffffc020188e:	85a6                	mv	a1,s1
ffffffffc0201890:	07800513          	li	a0,120
ffffffffc0201894:	9902                	jalr	s2
ffffffffc0201896:	0aa1                	addi	s5,s5,8
ffffffffc0201898:	ff8ab603          	ld	a2,-8(s5)
ffffffffc020189c:	6782                	ld	a5,0(sp)
ffffffffc020189e:	46c1                	li	a3,16
ffffffffc02018a0:	2781                	sext.w	a5,a5
ffffffffc02018a2:	876e                	mv	a4,s11
ffffffffc02018a4:	85a6                	mv	a1,s1
ffffffffc02018a6:	854a                	mv	a0,s2
ffffffffc02018a8:	d4fff0ef          	jal	ra,ffffffffc02015f6 <printnum>
ffffffffc02018ac:	bbc5                	j	ffffffffc020169c <vprintfmt+0x3a>
ffffffffc02018ae:	00144603          	lbu	a2,1(s0)
ffffffffc02018b2:	2805                	addiw	a6,a6,1
ffffffffc02018b4:	846a                	mv	s0,s10
ffffffffc02018b6:	b515                	j	ffffffffc02016da <vprintfmt+0x78>
ffffffffc02018b8:	00144603          	lbu	a2,1(s0)
ffffffffc02018bc:	4985                	li	s3,1
ffffffffc02018be:	846a                	mv	s0,s10
ffffffffc02018c0:	bd29                	j	ffffffffc02016da <vprintfmt+0x78>
ffffffffc02018c2:	85a6                	mv	a1,s1
ffffffffc02018c4:	02500513          	li	a0,37
ffffffffc02018c8:	9902                	jalr	s2
ffffffffc02018ca:	bbc9                	j	ffffffffc020169c <vprintfmt+0x3a>
ffffffffc02018cc:	4705                	li	a4,1
ffffffffc02018ce:	008a8593          	addi	a1,s5,8
ffffffffc02018d2:	01074463          	blt	a4,a6,ffffffffc02018da <vprintfmt+0x278>
ffffffffc02018d6:	08080d63          	beqz	a6,ffffffffc0201970 <vprintfmt+0x30e>
ffffffffc02018da:	000ab603          	ld	a2,0(s5)
ffffffffc02018de:	46a9                	li	a3,10
ffffffffc02018e0:	8aae                	mv	s5,a1
ffffffffc02018e2:	bf7d                	j	ffffffffc02018a0 <vprintfmt+0x23e>
ffffffffc02018e4:	85a6                	mv	a1,s1
ffffffffc02018e6:	02500513          	li	a0,37
ffffffffc02018ea:	9902                	jalr	s2
ffffffffc02018ec:	fff44703          	lbu	a4,-1(s0)
ffffffffc02018f0:	02500793          	li	a5,37
ffffffffc02018f4:	8d22                	mv	s10,s0
ffffffffc02018f6:	daf703e3          	beq	a4,a5,ffffffffc020169c <vprintfmt+0x3a>
ffffffffc02018fa:	02500713          	li	a4,37
ffffffffc02018fe:	1d7d                	addi	s10,s10,-1
ffffffffc0201900:	fffd4783          	lbu	a5,-1(s10)
ffffffffc0201904:	fee79de3          	bne	a5,a4,ffffffffc02018fe <vprintfmt+0x29c>
ffffffffc0201908:	bb51                	j	ffffffffc020169c <vprintfmt+0x3a>
ffffffffc020190a:	00001617          	auipc	a2,0x1
ffffffffc020190e:	03e60613          	addi	a2,a2,62 # ffffffffc0202948 <error_string+0xd8>
ffffffffc0201912:	85a6                	mv	a1,s1
ffffffffc0201914:	854a                	mv	a0,s2
ffffffffc0201916:	0ac000ef          	jal	ra,ffffffffc02019c2 <printfmt>
ffffffffc020191a:	b349                	j	ffffffffc020169c <vprintfmt+0x3a>
ffffffffc020191c:	00001617          	auipc	a2,0x1
ffffffffc0201920:	02460613          	addi	a2,a2,36 # ffffffffc0202940 <error_string+0xd0>
ffffffffc0201924:	00001417          	auipc	s0,0x1
ffffffffc0201928:	01d40413          	addi	s0,s0,29 # ffffffffc0202941 <error_string+0xd1>
ffffffffc020192c:	8532                	mv	a0,a2
ffffffffc020192e:	85e6                	mv	a1,s9
ffffffffc0201930:	e032                	sd	a2,0(sp)
ffffffffc0201932:	e43e                	sd	a5,8(sp)
ffffffffc0201934:	c43ff0ef          	jal	ra,ffffffffc0201576 <strnlen>
ffffffffc0201938:	40ad8dbb          	subw	s11,s11,a0
ffffffffc020193c:	6602                	ld	a2,0(sp)
ffffffffc020193e:	01b05d63          	blez	s11,ffffffffc0201958 <vprintfmt+0x2f6>
ffffffffc0201942:	67a2                	ld	a5,8(sp)
ffffffffc0201944:	2781                	sext.w	a5,a5
ffffffffc0201946:	e43e                	sd	a5,8(sp)
ffffffffc0201948:	6522                	ld	a0,8(sp)
ffffffffc020194a:	85a6                	mv	a1,s1
ffffffffc020194c:	e032                	sd	a2,0(sp)
ffffffffc020194e:	3dfd                	addiw	s11,s11,-1
ffffffffc0201950:	9902                	jalr	s2
ffffffffc0201952:	6602                	ld	a2,0(sp)
ffffffffc0201954:	fe0d9ae3          	bnez	s11,ffffffffc0201948 <vprintfmt+0x2e6>
ffffffffc0201958:	00064783          	lbu	a5,0(a2)
ffffffffc020195c:	0007851b          	sext.w	a0,a5
ffffffffc0201960:	ec0510e3          	bnez	a0,ffffffffc0201820 <vprintfmt+0x1be>
ffffffffc0201964:	bb25                	j	ffffffffc020169c <vprintfmt+0x3a>
ffffffffc0201966:	000ae603          	lwu	a2,0(s5)
ffffffffc020196a:	46a1                	li	a3,8
ffffffffc020196c:	8aae                	mv	s5,a1
ffffffffc020196e:	bf0d                	j	ffffffffc02018a0 <vprintfmt+0x23e>
ffffffffc0201970:	000ae603          	lwu	a2,0(s5)
ffffffffc0201974:	46a9                	li	a3,10
ffffffffc0201976:	8aae                	mv	s5,a1
ffffffffc0201978:	b725                	j	ffffffffc02018a0 <vprintfmt+0x23e>
ffffffffc020197a:	000aa403          	lw	s0,0(s5)
ffffffffc020197e:	bd35                	j	ffffffffc02017ba <vprintfmt+0x158>
ffffffffc0201980:	000ae603          	lwu	a2,0(s5)
ffffffffc0201984:	46c1                	li	a3,16
ffffffffc0201986:	8aae                	mv	s5,a1
ffffffffc0201988:	bf21                	j	ffffffffc02018a0 <vprintfmt+0x23e>
ffffffffc020198a:	9902                	jalr	s2
ffffffffc020198c:	bd45                	j	ffffffffc020183c <vprintfmt+0x1da>
ffffffffc020198e:	85a6                	mv	a1,s1
ffffffffc0201990:	02d00513          	li	a0,45
ffffffffc0201994:	e03e                	sd	a5,0(sp)
ffffffffc0201996:	9902                	jalr	s2
ffffffffc0201998:	8ace                	mv	s5,s3
ffffffffc020199a:	40800633          	neg	a2,s0
ffffffffc020199e:	46a9                	li	a3,10
ffffffffc02019a0:	6782                	ld	a5,0(sp)
ffffffffc02019a2:	bdfd                	j	ffffffffc02018a0 <vprintfmt+0x23e>
ffffffffc02019a4:	01b05663          	blez	s11,ffffffffc02019b0 <vprintfmt+0x34e>
ffffffffc02019a8:	02d00693          	li	a3,45
ffffffffc02019ac:	f6d798e3          	bne	a5,a3,ffffffffc020191c <vprintfmt+0x2ba>
ffffffffc02019b0:	00001417          	auipc	s0,0x1
ffffffffc02019b4:	f9140413          	addi	s0,s0,-111 # ffffffffc0202941 <error_string+0xd1>
ffffffffc02019b8:	02800513          	li	a0,40
ffffffffc02019bc:	02800793          	li	a5,40
ffffffffc02019c0:	b585                	j	ffffffffc0201820 <vprintfmt+0x1be>

ffffffffc02019c2 <printfmt>:
ffffffffc02019c2:	715d                	addi	sp,sp,-80
ffffffffc02019c4:	02810313          	addi	t1,sp,40
ffffffffc02019c8:	f436                	sd	a3,40(sp)
ffffffffc02019ca:	869a                	mv	a3,t1
ffffffffc02019cc:	ec06                	sd	ra,24(sp)
ffffffffc02019ce:	f83a                	sd	a4,48(sp)
ffffffffc02019d0:	fc3e                	sd	a5,56(sp)
ffffffffc02019d2:	e0c2                	sd	a6,64(sp)
ffffffffc02019d4:	e4c6                	sd	a7,72(sp)
ffffffffc02019d6:	e41a                	sd	t1,8(sp)
ffffffffc02019d8:	c8bff0ef          	jal	ra,ffffffffc0201662 <vprintfmt>
ffffffffc02019dc:	60e2                	ld	ra,24(sp)
ffffffffc02019de:	6161                	addi	sp,sp,80
ffffffffc02019e0:	8082                	ret

ffffffffc02019e2 <readline>:
ffffffffc02019e2:	715d                	addi	sp,sp,-80
ffffffffc02019e4:	e486                	sd	ra,72(sp)
ffffffffc02019e6:	e0a2                	sd	s0,64(sp)
ffffffffc02019e8:	fc26                	sd	s1,56(sp)
ffffffffc02019ea:	f84a                	sd	s2,48(sp)
ffffffffc02019ec:	f44e                	sd	s3,40(sp)
ffffffffc02019ee:	f052                	sd	s4,32(sp)
ffffffffc02019f0:	ec56                	sd	s5,24(sp)
ffffffffc02019f2:	e85a                	sd	s6,16(sp)
ffffffffc02019f4:	e45e                	sd	s7,8(sp)
ffffffffc02019f6:	c901                	beqz	a0,ffffffffc0201a06 <readline+0x24>
ffffffffc02019f8:	85aa                	mv	a1,a0
ffffffffc02019fa:	00001517          	auipc	a0,0x1
ffffffffc02019fe:	f5e50513          	addi	a0,a0,-162 # ffffffffc0202958 <error_string+0xe8>
ffffffffc0201a02:	eb4fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201a06:	4481                	li	s1,0
ffffffffc0201a08:	497d                	li	s2,31
ffffffffc0201a0a:	49a1                	li	s3,8
ffffffffc0201a0c:	4aa9                	li	s5,10
ffffffffc0201a0e:	4b35                	li	s6,13
ffffffffc0201a10:	00004b97          	auipc	s7,0x4
ffffffffc0201a14:	600b8b93          	addi	s7,s7,1536 # ffffffffc0206010 <edata>
ffffffffc0201a18:	3fe00a13          	li	s4,1022
ffffffffc0201a1c:	f10fe0ef          	jal	ra,ffffffffc020012c <getchar>
ffffffffc0201a20:	842a                	mv	s0,a0
ffffffffc0201a22:	00054b63          	bltz	a0,ffffffffc0201a38 <readline+0x56>
ffffffffc0201a26:	00a95b63          	bge	s2,a0,ffffffffc0201a3c <readline+0x5a>
ffffffffc0201a2a:	029a5463          	bge	s4,s1,ffffffffc0201a52 <readline+0x70>
ffffffffc0201a2e:	efefe0ef          	jal	ra,ffffffffc020012c <getchar>
ffffffffc0201a32:	842a                	mv	s0,a0
ffffffffc0201a34:	fe0559e3          	bgez	a0,ffffffffc0201a26 <readline+0x44>
ffffffffc0201a38:	4501                	li	a0,0
ffffffffc0201a3a:	a099                	j	ffffffffc0201a80 <readline+0x9e>
ffffffffc0201a3c:	03341463          	bne	s0,s3,ffffffffc0201a64 <readline+0x82>
ffffffffc0201a40:	e8b9                	bnez	s1,ffffffffc0201a96 <readline+0xb4>
ffffffffc0201a42:	eeafe0ef          	jal	ra,ffffffffc020012c <getchar>
ffffffffc0201a46:	842a                	mv	s0,a0
ffffffffc0201a48:	fe0548e3          	bltz	a0,ffffffffc0201a38 <readline+0x56>
ffffffffc0201a4c:	fea958e3          	bge	s2,a0,ffffffffc0201a3c <readline+0x5a>
ffffffffc0201a50:	4481                	li	s1,0
ffffffffc0201a52:	8522                	mv	a0,s0
ffffffffc0201a54:	e96fe0ef          	jal	ra,ffffffffc02000ea <cputchar>
ffffffffc0201a58:	009b87b3          	add	a5,s7,s1
ffffffffc0201a5c:	00878023          	sb	s0,0(a5)
ffffffffc0201a60:	2485                	addiw	s1,s1,1
ffffffffc0201a62:	bf6d                	j	ffffffffc0201a1c <readline+0x3a>
ffffffffc0201a64:	01540463          	beq	s0,s5,ffffffffc0201a6c <readline+0x8a>
ffffffffc0201a68:	fb641ae3          	bne	s0,s6,ffffffffc0201a1c <readline+0x3a>
ffffffffc0201a6c:	8522                	mv	a0,s0
ffffffffc0201a6e:	e7cfe0ef          	jal	ra,ffffffffc02000ea <cputchar>
ffffffffc0201a72:	00004517          	auipc	a0,0x4
ffffffffc0201a76:	59e50513          	addi	a0,a0,1438 # ffffffffc0206010 <edata>
ffffffffc0201a7a:	94aa                	add	s1,s1,a0
ffffffffc0201a7c:	00048023          	sb	zero,0(s1)
ffffffffc0201a80:	60a6                	ld	ra,72(sp)
ffffffffc0201a82:	6406                	ld	s0,64(sp)
ffffffffc0201a84:	74e2                	ld	s1,56(sp)
ffffffffc0201a86:	7942                	ld	s2,48(sp)
ffffffffc0201a88:	79a2                	ld	s3,40(sp)
ffffffffc0201a8a:	7a02                	ld	s4,32(sp)
ffffffffc0201a8c:	6ae2                	ld	s5,24(sp)
ffffffffc0201a8e:	6b42                	ld	s6,16(sp)
ffffffffc0201a90:	6ba2                	ld	s7,8(sp)
ffffffffc0201a92:	6161                	addi	sp,sp,80
ffffffffc0201a94:	8082                	ret
ffffffffc0201a96:	4521                	li	a0,8
ffffffffc0201a98:	e52fe0ef          	jal	ra,ffffffffc02000ea <cputchar>
ffffffffc0201a9c:	34fd                	addiw	s1,s1,-1
ffffffffc0201a9e:	bfbd                	j	ffffffffc0201a1c <readline+0x3a>

ffffffffc0201aa0 <sbi_console_putchar>:
ffffffffc0201aa0:	00004797          	auipc	a5,0x4
ffffffffc0201aa4:	56878793          	addi	a5,a5,1384 # ffffffffc0206008 <SBI_CONSOLE_PUTCHAR>
ffffffffc0201aa8:	6398                	ld	a4,0(a5)
ffffffffc0201aaa:	4781                	li	a5,0
ffffffffc0201aac:	88ba                	mv	a7,a4
ffffffffc0201aae:	852a                	mv	a0,a0
ffffffffc0201ab0:	85be                	mv	a1,a5
ffffffffc0201ab2:	863e                	mv	a2,a5
ffffffffc0201ab4:	00000073          	ecall
ffffffffc0201ab8:	87aa                	mv	a5,a0
ffffffffc0201aba:	8082                	ret

ffffffffc0201abc <sbi_set_timer>:
ffffffffc0201abc:	00005797          	auipc	a5,0x5
ffffffffc0201ac0:	96c78793          	addi	a5,a5,-1684 # ffffffffc0206428 <SBI_SET_TIMER>
ffffffffc0201ac4:	6398                	ld	a4,0(a5)
ffffffffc0201ac6:	4781                	li	a5,0
ffffffffc0201ac8:	88ba                	mv	a7,a4
ffffffffc0201aca:	852a                	mv	a0,a0
ffffffffc0201acc:	85be                	mv	a1,a5
ffffffffc0201ace:	863e                	mv	a2,a5
ffffffffc0201ad0:	00000073          	ecall
ffffffffc0201ad4:	87aa                	mv	a5,a0
ffffffffc0201ad6:	8082                	ret

ffffffffc0201ad8 <sbi_console_getchar>:
ffffffffc0201ad8:	00004797          	auipc	a5,0x4
ffffffffc0201adc:	52878793          	addi	a5,a5,1320 # ffffffffc0206000 <SBI_CONSOLE_GETCHAR>
ffffffffc0201ae0:	639c                	ld	a5,0(a5)
ffffffffc0201ae2:	4501                	li	a0,0
ffffffffc0201ae4:	88be                	mv	a7,a5
ffffffffc0201ae6:	852a                	mv	a0,a0
ffffffffc0201ae8:	85aa                	mv	a1,a0
ffffffffc0201aea:	862a                	mv	a2,a0
ffffffffc0201aec:	00000073          	ecall
ffffffffc0201af0:	852a                	mv	a0,a0
ffffffffc0201af2:	2501                	sext.w	a0,a0
ffffffffc0201af4:	8082                	ret
