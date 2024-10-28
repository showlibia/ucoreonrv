
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c020b2b7          	lui	t0,0xc020b
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c020b137          	lui	sp,0xc020b
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	0002c517          	auipc	a0,0x2c
ffffffffc0200036:	d2e50513          	addi	a0,a0,-722 # ffffffffc022bd60 <buf>
ffffffffc020003a:	00037617          	auipc	a2,0x37
ffffffffc020003e:	28660613          	addi	a2,a2,646 # ffffffffc02372c0 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16 # ffffffffc020aff0 <bootstack+0x1ff0>
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	118060ef          	jal	ffffffffc0206162 <memset>
ffffffffc020004e:	524000ef          	jal	ffffffffc0200572 <cons_init>
ffffffffc0200052:	00006597          	auipc	a1,0x6
ffffffffc0200056:	13e58593          	addi	a1,a1,318 # ffffffffc0206190 <etext+0x4>
ffffffffc020005a:	00006517          	auipc	a0,0x6
ffffffffc020005e:	15650513          	addi	a0,a0,342 # ffffffffc02061b0 <etext+0x24>
ffffffffc0200062:	11e000ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200066:	1ae000ef          	jal	ffffffffc0200214 <print_kerninfo>
ffffffffc020006a:	28e020ef          	jal	ffffffffc02022f8 <pmm_init>
ffffffffc020006e:	5d8000ef          	jal	ffffffffc0200646 <pic_init>
ffffffffc0200072:	5d6000ef          	jal	ffffffffc0200648 <idt_init>
ffffffffc0200076:	74f030ef          	jal	ffffffffc0203fc4 <vmm_init>
ffffffffc020007a:	031050ef          	jal	ffffffffc02058aa <proc_init>
ffffffffc020007e:	566000ef          	jal	ffffffffc02005e4 <ide_init>
ffffffffc0200082:	719020ef          	jal	ffffffffc0202f9a <swap_init>
ffffffffc0200086:	49a000ef          	jal	ffffffffc0200520 <clock_init>
ffffffffc020008a:	5b0000ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc020008e:	1b7050ef          	jal	ffffffffc0205a44 <cpu_idle>

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
ffffffffc02000a8:	00006517          	auipc	a0,0x6
ffffffffc02000ac:	11050513          	addi	a0,a0,272 # ffffffffc02061b8 <etext+0x2c>
ffffffffc02000b0:	0d0000ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02000b4:	4401                	li	s0,0
ffffffffc02000b6:	44fd                	li	s1,31
ffffffffc02000b8:	4921                	li	s2,8
ffffffffc02000ba:	4a29                	li	s4,10
ffffffffc02000bc:	4ab5                	li	s5,13
ffffffffc02000be:	0002cb17          	auipc	s6,0x2c
ffffffffc02000c2:	ca2b0b13          	addi	s6,s6,-862 # ffffffffc022bd60 <buf>
ffffffffc02000c6:	3fe00993          	li	s3,1022
ffffffffc02000ca:	13a000ef          	jal	ffffffffc0200204 <getchar>
ffffffffc02000ce:	00054a63          	bltz	a0,ffffffffc02000e2 <readline+0x50>
ffffffffc02000d2:	00a4da63          	bge	s1,a0,ffffffffc02000e6 <readline+0x54>
ffffffffc02000d6:	0289d263          	bge	s3,s0,ffffffffc02000fa <readline+0x68>
ffffffffc02000da:	12a000ef          	jal	ffffffffc0200204 <getchar>
ffffffffc02000de:	fe055ae3          	bgez	a0,ffffffffc02000d2 <readline+0x40>
ffffffffc02000e2:	4501                	li	a0,0
ffffffffc02000e4:	a091                	j	ffffffffc0200128 <readline+0x96>
ffffffffc02000e6:	03251463          	bne	a0,s2,ffffffffc020010e <readline+0x7c>
ffffffffc02000ea:	04804963          	bgtz	s0,ffffffffc020013c <readline+0xaa>
ffffffffc02000ee:	116000ef          	jal	ffffffffc0200204 <getchar>
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
ffffffffc020011a:	0002c517          	auipc	a0,0x2c
ffffffffc020011e:	c4650513          	addi	a0,a0,-954 # ffffffffc022bd60 <buf>
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
ffffffffc020014e:	426000ef          	jal	ffffffffc0200574 <cons_putc>
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
ffffffffc0200174:	3df050ef          	jal	ffffffffc0205d52 <vprintfmt>
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
ffffffffc02001a8:	3ab050ef          	jal	ffffffffc0205d52 <vprintfmt>
ffffffffc02001ac:	60e2                	ld	ra,24(sp)
ffffffffc02001ae:	4512                	lw	a0,4(sp)
ffffffffc02001b0:	6125                	addi	sp,sp,96
ffffffffc02001b2:	8082                	ret

ffffffffc02001b4 <cputchar>:
ffffffffc02001b4:	a6c1                	j	ffffffffc0200574 <cons_putc>

ffffffffc02001b6 <cputs>:
ffffffffc02001b6:	1101                	addi	sp,sp,-32
ffffffffc02001b8:	ec06                	sd	ra,24(sp)
ffffffffc02001ba:	e822                	sd	s0,16(sp)
ffffffffc02001bc:	87aa                	mv	a5,a0
ffffffffc02001be:	00054503          	lbu	a0,0(a0)
ffffffffc02001c2:	c905                	beqz	a0,ffffffffc02001f2 <cputs+0x3c>
ffffffffc02001c4:	e426                	sd	s1,8(sp)
ffffffffc02001c6:	00178493          	addi	s1,a5,1
ffffffffc02001ca:	8426                	mv	s0,s1
ffffffffc02001cc:	3a8000ef          	jal	ffffffffc0200574 <cons_putc>
ffffffffc02001d0:	00044503          	lbu	a0,0(s0)
ffffffffc02001d4:	87a2                	mv	a5,s0
ffffffffc02001d6:	0405                	addi	s0,s0,1
ffffffffc02001d8:	f975                	bnez	a0,ffffffffc02001cc <cputs+0x16>
ffffffffc02001da:	9f85                	subw	a5,a5,s1
ffffffffc02001dc:	4529                	li	a0,10
ffffffffc02001de:	0027841b          	addiw	s0,a5,2
ffffffffc02001e2:	64a2                	ld	s1,8(sp)
ffffffffc02001e4:	390000ef          	jal	ffffffffc0200574 <cons_putc>
ffffffffc02001e8:	60e2                	ld	ra,24(sp)
ffffffffc02001ea:	8522                	mv	a0,s0
ffffffffc02001ec:	6442                	ld	s0,16(sp)
ffffffffc02001ee:	6105                	addi	sp,sp,32
ffffffffc02001f0:	8082                	ret
ffffffffc02001f2:	4529                	li	a0,10
ffffffffc02001f4:	380000ef          	jal	ffffffffc0200574 <cons_putc>
ffffffffc02001f8:	4405                	li	s0,1
ffffffffc02001fa:	60e2                	ld	ra,24(sp)
ffffffffc02001fc:	8522                	mv	a0,s0
ffffffffc02001fe:	6442                	ld	s0,16(sp)
ffffffffc0200200:	6105                	addi	sp,sp,32
ffffffffc0200202:	8082                	ret

ffffffffc0200204 <getchar>:
ffffffffc0200204:	1141                	addi	sp,sp,-16
ffffffffc0200206:	e406                	sd	ra,8(sp)
ffffffffc0200208:	3a0000ef          	jal	ffffffffc02005a8 <cons_getc>
ffffffffc020020c:	dd75                	beqz	a0,ffffffffc0200208 <getchar+0x4>
ffffffffc020020e:	60a2                	ld	ra,8(sp)
ffffffffc0200210:	0141                	addi	sp,sp,16
ffffffffc0200212:	8082                	ret

ffffffffc0200214 <print_kerninfo>:
ffffffffc0200214:	1141                	addi	sp,sp,-16
ffffffffc0200216:	00006517          	auipc	a0,0x6
ffffffffc020021a:	faa50513          	addi	a0,a0,-86 # ffffffffc02061c0 <etext+0x34>
ffffffffc020021e:	e406                	sd	ra,8(sp)
ffffffffc0200220:	f61ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200224:	00000597          	auipc	a1,0x0
ffffffffc0200228:	e0e58593          	addi	a1,a1,-498 # ffffffffc0200032 <kern_init>
ffffffffc020022c:	00006517          	auipc	a0,0x6
ffffffffc0200230:	fb450513          	addi	a0,a0,-76 # ffffffffc02061e0 <etext+0x54>
ffffffffc0200234:	f4dff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200238:	00006597          	auipc	a1,0x6
ffffffffc020023c:	f5458593          	addi	a1,a1,-172 # ffffffffc020618c <etext>
ffffffffc0200240:	00006517          	auipc	a0,0x6
ffffffffc0200244:	fc050513          	addi	a0,a0,-64 # ffffffffc0206200 <etext+0x74>
ffffffffc0200248:	f39ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020024c:	0002c597          	auipc	a1,0x2c
ffffffffc0200250:	b1458593          	addi	a1,a1,-1260 # ffffffffc022bd60 <buf>
ffffffffc0200254:	00006517          	auipc	a0,0x6
ffffffffc0200258:	fcc50513          	addi	a0,a0,-52 # ffffffffc0206220 <etext+0x94>
ffffffffc020025c:	f25ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200260:	00037597          	auipc	a1,0x37
ffffffffc0200264:	06058593          	addi	a1,a1,96 # ffffffffc02372c0 <end>
ffffffffc0200268:	00006517          	auipc	a0,0x6
ffffffffc020026c:	fd850513          	addi	a0,a0,-40 # ffffffffc0206240 <etext+0xb4>
ffffffffc0200270:	f11ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200274:	00037797          	auipc	a5,0x37
ffffffffc0200278:	44b78793          	addi	a5,a5,1099 # ffffffffc02376bf <end+0x3ff>
ffffffffc020027c:	00000717          	auipc	a4,0x0
ffffffffc0200280:	db670713          	addi	a4,a4,-586 # ffffffffc0200032 <kern_init>
ffffffffc0200284:	8f99                	sub	a5,a5,a4
ffffffffc0200286:	43f7d593          	srai	a1,a5,0x3f
ffffffffc020028a:	60a2                	ld	ra,8(sp)
ffffffffc020028c:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200290:	95be                	add	a1,a1,a5
ffffffffc0200292:	85a9                	srai	a1,a1,0xa
ffffffffc0200294:	00006517          	auipc	a0,0x6
ffffffffc0200298:	fcc50513          	addi	a0,a0,-52 # ffffffffc0206260 <etext+0xd4>
ffffffffc020029c:	0141                	addi	sp,sp,16
ffffffffc020029e:	b5cd                	j	ffffffffc0200180 <cprintf>

ffffffffc02002a0 <print_stackframe>:
ffffffffc02002a0:	1141                	addi	sp,sp,-16
ffffffffc02002a2:	00006617          	auipc	a2,0x6
ffffffffc02002a6:	fee60613          	addi	a2,a2,-18 # ffffffffc0206290 <etext+0x104>
ffffffffc02002aa:	05b00593          	li	a1,91
ffffffffc02002ae:	00006517          	auipc	a0,0x6
ffffffffc02002b2:	ffa50513          	addi	a0,a0,-6 # ffffffffc02062a8 <etext+0x11c>
ffffffffc02002b6:	e406                	sd	ra,8(sp)
ffffffffc02002b8:	1bc000ef          	jal	ffffffffc0200474 <__panic>

ffffffffc02002bc <mon_help>:
ffffffffc02002bc:	1141                	addi	sp,sp,-16
ffffffffc02002be:	00006617          	auipc	a2,0x6
ffffffffc02002c2:	00260613          	addi	a2,a2,2 # ffffffffc02062c0 <etext+0x134>
ffffffffc02002c6:	00006597          	auipc	a1,0x6
ffffffffc02002ca:	01a58593          	addi	a1,a1,26 # ffffffffc02062e0 <etext+0x154>
ffffffffc02002ce:	00006517          	auipc	a0,0x6
ffffffffc02002d2:	01a50513          	addi	a0,a0,26 # ffffffffc02062e8 <etext+0x15c>
ffffffffc02002d6:	e406                	sd	ra,8(sp)
ffffffffc02002d8:	ea9ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02002dc:	00006617          	auipc	a2,0x6
ffffffffc02002e0:	01c60613          	addi	a2,a2,28 # ffffffffc02062f8 <etext+0x16c>
ffffffffc02002e4:	00006597          	auipc	a1,0x6
ffffffffc02002e8:	03c58593          	addi	a1,a1,60 # ffffffffc0206320 <etext+0x194>
ffffffffc02002ec:	00006517          	auipc	a0,0x6
ffffffffc02002f0:	ffc50513          	addi	a0,a0,-4 # ffffffffc02062e8 <etext+0x15c>
ffffffffc02002f4:	e8dff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02002f8:	00006617          	auipc	a2,0x6
ffffffffc02002fc:	03860613          	addi	a2,a2,56 # ffffffffc0206330 <etext+0x1a4>
ffffffffc0200300:	00006597          	auipc	a1,0x6
ffffffffc0200304:	05058593          	addi	a1,a1,80 # ffffffffc0206350 <etext+0x1c4>
ffffffffc0200308:	00006517          	auipc	a0,0x6
ffffffffc020030c:	fe050513          	addi	a0,a0,-32 # ffffffffc02062e8 <etext+0x15c>
ffffffffc0200310:	e71ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200314:	60a2                	ld	ra,8(sp)
ffffffffc0200316:	4501                	li	a0,0
ffffffffc0200318:	0141                	addi	sp,sp,16
ffffffffc020031a:	8082                	ret

ffffffffc020031c <mon_kerninfo>:
ffffffffc020031c:	1141                	addi	sp,sp,-16
ffffffffc020031e:	e406                	sd	ra,8(sp)
ffffffffc0200320:	ef5ff0ef          	jal	ffffffffc0200214 <print_kerninfo>
ffffffffc0200324:	60a2                	ld	ra,8(sp)
ffffffffc0200326:	4501                	li	a0,0
ffffffffc0200328:	0141                	addi	sp,sp,16
ffffffffc020032a:	8082                	ret

ffffffffc020032c <mon_backtrace>:
ffffffffc020032c:	1141                	addi	sp,sp,-16
ffffffffc020032e:	e406                	sd	ra,8(sp)
ffffffffc0200330:	f71ff0ef          	jal	ffffffffc02002a0 <print_stackframe>
ffffffffc0200334:	60a2                	ld	ra,8(sp)
ffffffffc0200336:	4501                	li	a0,0
ffffffffc0200338:	0141                	addi	sp,sp,16
ffffffffc020033a:	8082                	ret

ffffffffc020033c <kmonitor>:
ffffffffc020033c:	7115                	addi	sp,sp,-224
ffffffffc020033e:	f15a                	sd	s6,160(sp)
ffffffffc0200340:	8b2a                	mv	s6,a0
ffffffffc0200342:	00006517          	auipc	a0,0x6
ffffffffc0200346:	01e50513          	addi	a0,a0,30 # ffffffffc0206360 <etext+0x1d4>
ffffffffc020034a:	ed86                	sd	ra,216(sp)
ffffffffc020034c:	e9a2                	sd	s0,208(sp)
ffffffffc020034e:	e5a6                	sd	s1,200(sp)
ffffffffc0200350:	e1ca                	sd	s2,192(sp)
ffffffffc0200352:	fd4e                	sd	s3,184(sp)
ffffffffc0200354:	f952                	sd	s4,176(sp)
ffffffffc0200356:	f556                	sd	s5,168(sp)
ffffffffc0200358:	ed5e                	sd	s7,152(sp)
ffffffffc020035a:	e962                	sd	s8,144(sp)
ffffffffc020035c:	e566                	sd	s9,136(sp)
ffffffffc020035e:	e16a                	sd	s10,128(sp)
ffffffffc0200360:	e21ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200364:	00006517          	auipc	a0,0x6
ffffffffc0200368:	02450513          	addi	a0,a0,36 # ffffffffc0206388 <etext+0x1fc>
ffffffffc020036c:	e15ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200370:	000b0563          	beqz	s6,ffffffffc020037a <kmonitor+0x3e>
ffffffffc0200374:	855a                	mv	a0,s6
ffffffffc0200376:	4ba000ef          	jal	ffffffffc0200830 <print_trapframe>
ffffffffc020037a:	00008c17          	auipc	s8,0x8
ffffffffc020037e:	0e6c0c13          	addi	s8,s8,230 # ffffffffc0208460 <commands>
ffffffffc0200382:	00006917          	auipc	s2,0x6
ffffffffc0200386:	02e90913          	addi	s2,s2,46 # ffffffffc02063b0 <etext+0x224>
ffffffffc020038a:	00006497          	auipc	s1,0x6
ffffffffc020038e:	02e48493          	addi	s1,s1,46 # ffffffffc02063b8 <etext+0x22c>
ffffffffc0200392:	49bd                	li	s3,15
ffffffffc0200394:	00006a97          	auipc	s5,0x6
ffffffffc0200398:	02ca8a93          	addi	s5,s5,44 # ffffffffc02063c0 <etext+0x234>
ffffffffc020039c:	4a0d                	li	s4,3
ffffffffc020039e:	00006b97          	auipc	s7,0x6
ffffffffc02003a2:	042b8b93          	addi	s7,s7,66 # ffffffffc02063e0 <etext+0x254>
ffffffffc02003a6:	854a                	mv	a0,s2
ffffffffc02003a8:	cebff0ef          	jal	ffffffffc0200092 <readline>
ffffffffc02003ac:	842a                	mv	s0,a0
ffffffffc02003ae:	dd65                	beqz	a0,ffffffffc02003a6 <kmonitor+0x6a>
ffffffffc02003b0:	00054583          	lbu	a1,0(a0)
ffffffffc02003b4:	4c81                	li	s9,0
ffffffffc02003b6:	e59d                	bnez	a1,ffffffffc02003e4 <kmonitor+0xa8>
ffffffffc02003b8:	fe0c87e3          	beqz	s9,ffffffffc02003a6 <kmonitor+0x6a>
ffffffffc02003bc:	00008d17          	auipc	s10,0x8
ffffffffc02003c0:	0a4d0d13          	addi	s10,s10,164 # ffffffffc0208460 <commands>
ffffffffc02003c4:	4401                	li	s0,0
ffffffffc02003c6:	6582                	ld	a1,0(sp)
ffffffffc02003c8:	000d3503          	ld	a0,0(s10)
ffffffffc02003cc:	549050ef          	jal	ffffffffc0206114 <strcmp>
ffffffffc02003d0:	c53d                	beqz	a0,ffffffffc020043e <kmonitor+0x102>
ffffffffc02003d2:	2405                	addiw	s0,s0,1
ffffffffc02003d4:	0d61                	addi	s10,s10,24
ffffffffc02003d6:	ff4418e3          	bne	s0,s4,ffffffffc02003c6 <kmonitor+0x8a>
ffffffffc02003da:	6582                	ld	a1,0(sp)
ffffffffc02003dc:	855e                	mv	a0,s7
ffffffffc02003de:	da3ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02003e2:	b7d1                	j	ffffffffc02003a6 <kmonitor+0x6a>
ffffffffc02003e4:	8526                	mv	a0,s1
ffffffffc02003e6:	567050ef          	jal	ffffffffc020614c <strchr>
ffffffffc02003ea:	c901                	beqz	a0,ffffffffc02003fa <kmonitor+0xbe>
ffffffffc02003ec:	00144583          	lbu	a1,1(s0)
ffffffffc02003f0:	00040023          	sb	zero,0(s0)
ffffffffc02003f4:	0405                	addi	s0,s0,1
ffffffffc02003f6:	d1e9                	beqz	a1,ffffffffc02003b8 <kmonitor+0x7c>
ffffffffc02003f8:	b7f5                	j	ffffffffc02003e4 <kmonitor+0xa8>
ffffffffc02003fa:	00044783          	lbu	a5,0(s0)
ffffffffc02003fe:	dfcd                	beqz	a5,ffffffffc02003b8 <kmonitor+0x7c>
ffffffffc0200400:	033c8a63          	beq	s9,s3,ffffffffc0200434 <kmonitor+0xf8>
ffffffffc0200404:	003c9793          	slli	a5,s9,0x3
ffffffffc0200408:	08078793          	addi	a5,a5,128
ffffffffc020040c:	978a                	add	a5,a5,sp
ffffffffc020040e:	f887b023          	sd	s0,-128(a5)
ffffffffc0200412:	00044583          	lbu	a1,0(s0)
ffffffffc0200416:	2c85                	addiw	s9,s9,1
ffffffffc0200418:	e591                	bnez	a1,ffffffffc0200424 <kmonitor+0xe8>
ffffffffc020041a:	bf79                	j	ffffffffc02003b8 <kmonitor+0x7c>
ffffffffc020041c:	00144583          	lbu	a1,1(s0)
ffffffffc0200420:	0405                	addi	s0,s0,1
ffffffffc0200422:	d9d9                	beqz	a1,ffffffffc02003b8 <kmonitor+0x7c>
ffffffffc0200424:	8526                	mv	a0,s1
ffffffffc0200426:	527050ef          	jal	ffffffffc020614c <strchr>
ffffffffc020042a:	d96d                	beqz	a0,ffffffffc020041c <kmonitor+0xe0>
ffffffffc020042c:	00044583          	lbu	a1,0(s0)
ffffffffc0200430:	d5c1                	beqz	a1,ffffffffc02003b8 <kmonitor+0x7c>
ffffffffc0200432:	bf4d                	j	ffffffffc02003e4 <kmonitor+0xa8>
ffffffffc0200434:	45c1                	li	a1,16
ffffffffc0200436:	8556                	mv	a0,s5
ffffffffc0200438:	d49ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020043c:	b7e1                	j	ffffffffc0200404 <kmonitor+0xc8>
ffffffffc020043e:	00141793          	slli	a5,s0,0x1
ffffffffc0200442:	97a2                	add	a5,a5,s0
ffffffffc0200444:	078e                	slli	a5,a5,0x3
ffffffffc0200446:	97e2                	add	a5,a5,s8
ffffffffc0200448:	6b9c                	ld	a5,16(a5)
ffffffffc020044a:	865a                	mv	a2,s6
ffffffffc020044c:	002c                	addi	a1,sp,8
ffffffffc020044e:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200452:	9782                	jalr	a5
ffffffffc0200454:	f40559e3          	bgez	a0,ffffffffc02003a6 <kmonitor+0x6a>
ffffffffc0200458:	60ee                	ld	ra,216(sp)
ffffffffc020045a:	644e                	ld	s0,208(sp)
ffffffffc020045c:	64ae                	ld	s1,200(sp)
ffffffffc020045e:	690e                	ld	s2,192(sp)
ffffffffc0200460:	79ea                	ld	s3,184(sp)
ffffffffc0200462:	7a4a                	ld	s4,176(sp)
ffffffffc0200464:	7aaa                	ld	s5,168(sp)
ffffffffc0200466:	7b0a                	ld	s6,160(sp)
ffffffffc0200468:	6bea                	ld	s7,152(sp)
ffffffffc020046a:	6c4a                	ld	s8,144(sp)
ffffffffc020046c:	6caa                	ld	s9,136(sp)
ffffffffc020046e:	6d0a                	ld	s10,128(sp)
ffffffffc0200470:	612d                	addi	sp,sp,224
ffffffffc0200472:	8082                	ret

ffffffffc0200474 <__panic>:
ffffffffc0200474:	00037317          	auipc	t1,0x37
ffffffffc0200478:	db430313          	addi	t1,t1,-588 # ffffffffc0237228 <is_panic>
ffffffffc020047c:	00033e03          	ld	t3,0(t1)
ffffffffc0200480:	715d                	addi	sp,sp,-80
ffffffffc0200482:	ec06                	sd	ra,24(sp)
ffffffffc0200484:	f436                	sd	a3,40(sp)
ffffffffc0200486:	f83a                	sd	a4,48(sp)
ffffffffc0200488:	fc3e                	sd	a5,56(sp)
ffffffffc020048a:	e0c2                	sd	a6,64(sp)
ffffffffc020048c:	e4c6                	sd	a7,72(sp)
ffffffffc020048e:	020e1c63          	bnez	t3,ffffffffc02004c6 <__panic+0x52>
ffffffffc0200492:	4785                	li	a5,1
ffffffffc0200494:	00f33023          	sd	a5,0(t1)
ffffffffc0200498:	e822                	sd	s0,16(sp)
ffffffffc020049a:	103c                	addi	a5,sp,40
ffffffffc020049c:	8432                	mv	s0,a2
ffffffffc020049e:	862e                	mv	a2,a1
ffffffffc02004a0:	85aa                	mv	a1,a0
ffffffffc02004a2:	00006517          	auipc	a0,0x6
ffffffffc02004a6:	f5650513          	addi	a0,a0,-170 # ffffffffc02063f8 <etext+0x26c>
ffffffffc02004aa:	e43e                	sd	a5,8(sp)
ffffffffc02004ac:	cd5ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02004b0:	65a2                	ld	a1,8(sp)
ffffffffc02004b2:	8522                	mv	a0,s0
ffffffffc02004b4:	cadff0ef          	jal	ffffffffc0200160 <vcprintf>
ffffffffc02004b8:	00006517          	auipc	a0,0x6
ffffffffc02004bc:	f6050513          	addi	a0,a0,-160 # ffffffffc0206418 <etext+0x28c>
ffffffffc02004c0:	cc1ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02004c4:	6442                	ld	s0,16(sp)
ffffffffc02004c6:	4501                	li	a0,0
ffffffffc02004c8:	4581                	li	a1,0
ffffffffc02004ca:	4601                	li	a2,0
ffffffffc02004cc:	48a1                	li	a7,8
ffffffffc02004ce:	00000073          	ecall
ffffffffc02004d2:	16e000ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02004d6:	4501                	li	a0,0
ffffffffc02004d8:	e65ff0ef          	jal	ffffffffc020033c <kmonitor>
ffffffffc02004dc:	bfed                	j	ffffffffc02004d6 <__panic+0x62>

ffffffffc02004de <__warn>:
ffffffffc02004de:	715d                	addi	sp,sp,-80
ffffffffc02004e0:	e822                	sd	s0,16(sp)
ffffffffc02004e2:	fc3e                	sd	a5,56(sp)
ffffffffc02004e4:	8432                	mv	s0,a2
ffffffffc02004e6:	103c                	addi	a5,sp,40
ffffffffc02004e8:	862e                	mv	a2,a1
ffffffffc02004ea:	85aa                	mv	a1,a0
ffffffffc02004ec:	00006517          	auipc	a0,0x6
ffffffffc02004f0:	f3450513          	addi	a0,a0,-204 # ffffffffc0206420 <etext+0x294>
ffffffffc02004f4:	ec06                	sd	ra,24(sp)
ffffffffc02004f6:	f436                	sd	a3,40(sp)
ffffffffc02004f8:	f83a                	sd	a4,48(sp)
ffffffffc02004fa:	e0c2                	sd	a6,64(sp)
ffffffffc02004fc:	e4c6                	sd	a7,72(sp)
ffffffffc02004fe:	e43e                	sd	a5,8(sp)
ffffffffc0200500:	c81ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200504:	65a2                	ld	a1,8(sp)
ffffffffc0200506:	8522                	mv	a0,s0
ffffffffc0200508:	c59ff0ef          	jal	ffffffffc0200160 <vcprintf>
ffffffffc020050c:	00006517          	auipc	a0,0x6
ffffffffc0200510:	f0c50513          	addi	a0,a0,-244 # ffffffffc0206418 <etext+0x28c>
ffffffffc0200514:	c6dff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200518:	60e2                	ld	ra,24(sp)
ffffffffc020051a:	6442                	ld	s0,16(sp)
ffffffffc020051c:	6161                	addi	sp,sp,80
ffffffffc020051e:	8082                	ret

ffffffffc0200520 <clock_init>:
ffffffffc0200520:	67e1                	lui	a5,0x18
ffffffffc0200522:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_exit_out_size+0x15d50>
ffffffffc0200526:	00037717          	auipc	a4,0x37
ffffffffc020052a:	d0f73523          	sd	a5,-758(a4) # ffffffffc0237230 <timebase>
ffffffffc020052e:	c0102573          	rdtime	a0
ffffffffc0200532:	4581                	li	a1,0
ffffffffc0200534:	953e                	add	a0,a0,a5
ffffffffc0200536:	4601                	li	a2,0
ffffffffc0200538:	4881                	li	a7,0
ffffffffc020053a:	00000073          	ecall
ffffffffc020053e:	02000793          	li	a5,32
ffffffffc0200542:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200546:	00006517          	auipc	a0,0x6
ffffffffc020054a:	efa50513          	addi	a0,a0,-262 # ffffffffc0206440 <etext+0x2b4>
ffffffffc020054e:	00037797          	auipc	a5,0x37
ffffffffc0200552:	ce07b523          	sd	zero,-790(a5) # ffffffffc0237238 <ticks>
ffffffffc0200556:	b12d                	j	ffffffffc0200180 <cprintf>

ffffffffc0200558 <clock_set_next_event>:
ffffffffc0200558:	c0102573          	rdtime	a0
ffffffffc020055c:	00037797          	auipc	a5,0x37
ffffffffc0200560:	cd47b783          	ld	a5,-812(a5) # ffffffffc0237230 <timebase>
ffffffffc0200564:	953e                	add	a0,a0,a5
ffffffffc0200566:	4581                	li	a1,0
ffffffffc0200568:	4601                	li	a2,0
ffffffffc020056a:	4881                	li	a7,0
ffffffffc020056c:	00000073          	ecall
ffffffffc0200570:	8082                	ret

ffffffffc0200572 <cons_init>:
ffffffffc0200572:	8082                	ret

ffffffffc0200574 <cons_putc>:
ffffffffc0200574:	100027f3          	csrr	a5,sstatus
ffffffffc0200578:	8b89                	andi	a5,a5,2
ffffffffc020057a:	0ff57513          	zext.b	a0,a0
ffffffffc020057e:	e799                	bnez	a5,ffffffffc020058c <cons_putc+0x18>
ffffffffc0200580:	4581                	li	a1,0
ffffffffc0200582:	4601                	li	a2,0
ffffffffc0200584:	4885                	li	a7,1
ffffffffc0200586:	00000073          	ecall
ffffffffc020058a:	8082                	ret
ffffffffc020058c:	1101                	addi	sp,sp,-32
ffffffffc020058e:	ec06                	sd	ra,24(sp)
ffffffffc0200590:	e42a                	sd	a0,8(sp)
ffffffffc0200592:	0ae000ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0200596:	6522                	ld	a0,8(sp)
ffffffffc0200598:	4581                	li	a1,0
ffffffffc020059a:	4601                	li	a2,0
ffffffffc020059c:	4885                	li	a7,1
ffffffffc020059e:	00000073          	ecall
ffffffffc02005a2:	60e2                	ld	ra,24(sp)
ffffffffc02005a4:	6105                	addi	sp,sp,32
ffffffffc02005a6:	a851                	j	ffffffffc020063a <intr_enable>

ffffffffc02005a8 <cons_getc>:
ffffffffc02005a8:	100027f3          	csrr	a5,sstatus
ffffffffc02005ac:	8b89                	andi	a5,a5,2
ffffffffc02005ae:	eb89                	bnez	a5,ffffffffc02005c0 <cons_getc+0x18>
ffffffffc02005b0:	4501                	li	a0,0
ffffffffc02005b2:	4581                	li	a1,0
ffffffffc02005b4:	4601                	li	a2,0
ffffffffc02005b6:	4889                	li	a7,2
ffffffffc02005b8:	00000073          	ecall
ffffffffc02005bc:	2501                	sext.w	a0,a0
ffffffffc02005be:	8082                	ret
ffffffffc02005c0:	1101                	addi	sp,sp,-32
ffffffffc02005c2:	ec06                	sd	ra,24(sp)
ffffffffc02005c4:	07c000ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02005c8:	4501                	li	a0,0
ffffffffc02005ca:	4581                	li	a1,0
ffffffffc02005cc:	4601                	li	a2,0
ffffffffc02005ce:	4889                	li	a7,2
ffffffffc02005d0:	00000073          	ecall
ffffffffc02005d4:	2501                	sext.w	a0,a0
ffffffffc02005d6:	e42a                	sd	a0,8(sp)
ffffffffc02005d8:	062000ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc02005dc:	60e2                	ld	ra,24(sp)
ffffffffc02005de:	6522                	ld	a0,8(sp)
ffffffffc02005e0:	6105                	addi	sp,sp,32
ffffffffc02005e2:	8082                	ret

ffffffffc02005e4 <ide_init>:
ffffffffc02005e4:	8082                	ret

ffffffffc02005e6 <ide_device_valid>:
ffffffffc02005e6:	00253513          	sltiu	a0,a0,2
ffffffffc02005ea:	8082                	ret

ffffffffc02005ec <ide_device_size>:
ffffffffc02005ec:	03800513          	li	a0,56
ffffffffc02005f0:	8082                	ret

ffffffffc02005f2 <ide_read_secs>:
ffffffffc02005f2:	0002c797          	auipc	a5,0x2c
ffffffffc02005f6:	b6e78793          	addi	a5,a5,-1170 # ffffffffc022c160 <ide>
ffffffffc02005fa:	0095959b          	slliw	a1,a1,0x9
ffffffffc02005fe:	1141                	addi	sp,sp,-16
ffffffffc0200600:	8532                	mv	a0,a2
ffffffffc0200602:	95be                	add	a1,a1,a5
ffffffffc0200604:	00969613          	slli	a2,a3,0x9
ffffffffc0200608:	e406                	sd	ra,8(sp)
ffffffffc020060a:	36b050ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc020060e:	60a2                	ld	ra,8(sp)
ffffffffc0200610:	4501                	li	a0,0
ffffffffc0200612:	0141                	addi	sp,sp,16
ffffffffc0200614:	8082                	ret

ffffffffc0200616 <ide_write_secs>:
ffffffffc0200616:	0095979b          	slliw	a5,a1,0x9
ffffffffc020061a:	0002c517          	auipc	a0,0x2c
ffffffffc020061e:	b4650513          	addi	a0,a0,-1210 # ffffffffc022c160 <ide>
ffffffffc0200622:	1141                	addi	sp,sp,-16
ffffffffc0200624:	85b2                	mv	a1,a2
ffffffffc0200626:	953e                	add	a0,a0,a5
ffffffffc0200628:	00969613          	slli	a2,a3,0x9
ffffffffc020062c:	e406                	sd	ra,8(sp)
ffffffffc020062e:	347050ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc0200632:	60a2                	ld	ra,8(sp)
ffffffffc0200634:	4501                	li	a0,0
ffffffffc0200636:	0141                	addi	sp,sp,16
ffffffffc0200638:	8082                	ret

ffffffffc020063a <intr_enable>:
ffffffffc020063a:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc020063e:	8082                	ret

ffffffffc0200640 <intr_disable>:
ffffffffc0200640:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200644:	8082                	ret

ffffffffc0200646 <pic_init>:
ffffffffc0200646:	8082                	ret

ffffffffc0200648 <idt_init>:
ffffffffc0200648:	14005073          	csrwi	sscratch,0
ffffffffc020064c:	00000797          	auipc	a5,0x0
ffffffffc0200650:	61c78793          	addi	a5,a5,1564 # ffffffffc0200c68 <__alltraps>
ffffffffc0200654:	10579073          	csrw	stvec,a5
ffffffffc0200658:	000407b7          	lui	a5,0x40
ffffffffc020065c:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200660:	8082                	ret

ffffffffc0200662 <print_regs>:
ffffffffc0200662:	610c                	ld	a1,0(a0)
ffffffffc0200664:	1141                	addi	sp,sp,-16
ffffffffc0200666:	e022                	sd	s0,0(sp)
ffffffffc0200668:	842a                	mv	s0,a0
ffffffffc020066a:	00006517          	auipc	a0,0x6
ffffffffc020066e:	df650513          	addi	a0,a0,-522 # ffffffffc0206460 <etext+0x2d4>
ffffffffc0200672:	e406                	sd	ra,8(sp)
ffffffffc0200674:	b0dff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200678:	640c                	ld	a1,8(s0)
ffffffffc020067a:	00006517          	auipc	a0,0x6
ffffffffc020067e:	dfe50513          	addi	a0,a0,-514 # ffffffffc0206478 <etext+0x2ec>
ffffffffc0200682:	affff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200686:	680c                	ld	a1,16(s0)
ffffffffc0200688:	00006517          	auipc	a0,0x6
ffffffffc020068c:	e0850513          	addi	a0,a0,-504 # ffffffffc0206490 <etext+0x304>
ffffffffc0200690:	af1ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200694:	6c0c                	ld	a1,24(s0)
ffffffffc0200696:	00006517          	auipc	a0,0x6
ffffffffc020069a:	e1250513          	addi	a0,a0,-494 # ffffffffc02064a8 <etext+0x31c>
ffffffffc020069e:	ae3ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006a2:	700c                	ld	a1,32(s0)
ffffffffc02006a4:	00006517          	auipc	a0,0x6
ffffffffc02006a8:	e1c50513          	addi	a0,a0,-484 # ffffffffc02064c0 <etext+0x334>
ffffffffc02006ac:	ad5ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006b0:	740c                	ld	a1,40(s0)
ffffffffc02006b2:	00006517          	auipc	a0,0x6
ffffffffc02006b6:	e2650513          	addi	a0,a0,-474 # ffffffffc02064d8 <etext+0x34c>
ffffffffc02006ba:	ac7ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006be:	780c                	ld	a1,48(s0)
ffffffffc02006c0:	00006517          	auipc	a0,0x6
ffffffffc02006c4:	e3050513          	addi	a0,a0,-464 # ffffffffc02064f0 <etext+0x364>
ffffffffc02006c8:	ab9ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006cc:	7c0c                	ld	a1,56(s0)
ffffffffc02006ce:	00006517          	auipc	a0,0x6
ffffffffc02006d2:	e3a50513          	addi	a0,a0,-454 # ffffffffc0206508 <etext+0x37c>
ffffffffc02006d6:	aabff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006da:	602c                	ld	a1,64(s0)
ffffffffc02006dc:	00006517          	auipc	a0,0x6
ffffffffc02006e0:	e4450513          	addi	a0,a0,-444 # ffffffffc0206520 <etext+0x394>
ffffffffc02006e4:	a9dff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006e8:	642c                	ld	a1,72(s0)
ffffffffc02006ea:	00006517          	auipc	a0,0x6
ffffffffc02006ee:	e4e50513          	addi	a0,a0,-434 # ffffffffc0206538 <etext+0x3ac>
ffffffffc02006f2:	a8fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02006f6:	682c                	ld	a1,80(s0)
ffffffffc02006f8:	00006517          	auipc	a0,0x6
ffffffffc02006fc:	e5850513          	addi	a0,a0,-424 # ffffffffc0206550 <etext+0x3c4>
ffffffffc0200700:	a81ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200704:	6c2c                	ld	a1,88(s0)
ffffffffc0200706:	00006517          	auipc	a0,0x6
ffffffffc020070a:	e6250513          	addi	a0,a0,-414 # ffffffffc0206568 <etext+0x3dc>
ffffffffc020070e:	a73ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200712:	702c                	ld	a1,96(s0)
ffffffffc0200714:	00006517          	auipc	a0,0x6
ffffffffc0200718:	e6c50513          	addi	a0,a0,-404 # ffffffffc0206580 <etext+0x3f4>
ffffffffc020071c:	a65ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200720:	742c                	ld	a1,104(s0)
ffffffffc0200722:	00006517          	auipc	a0,0x6
ffffffffc0200726:	e7650513          	addi	a0,a0,-394 # ffffffffc0206598 <etext+0x40c>
ffffffffc020072a:	a57ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020072e:	782c                	ld	a1,112(s0)
ffffffffc0200730:	00006517          	auipc	a0,0x6
ffffffffc0200734:	e8050513          	addi	a0,a0,-384 # ffffffffc02065b0 <etext+0x424>
ffffffffc0200738:	a49ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020073c:	7c2c                	ld	a1,120(s0)
ffffffffc020073e:	00006517          	auipc	a0,0x6
ffffffffc0200742:	e8a50513          	addi	a0,a0,-374 # ffffffffc02065c8 <etext+0x43c>
ffffffffc0200746:	a3bff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020074a:	604c                	ld	a1,128(s0)
ffffffffc020074c:	00006517          	auipc	a0,0x6
ffffffffc0200750:	e9450513          	addi	a0,a0,-364 # ffffffffc02065e0 <etext+0x454>
ffffffffc0200754:	a2dff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200758:	644c                	ld	a1,136(s0)
ffffffffc020075a:	00006517          	auipc	a0,0x6
ffffffffc020075e:	e9e50513          	addi	a0,a0,-354 # ffffffffc02065f8 <etext+0x46c>
ffffffffc0200762:	a1fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200766:	684c                	ld	a1,144(s0)
ffffffffc0200768:	00006517          	auipc	a0,0x6
ffffffffc020076c:	ea850513          	addi	a0,a0,-344 # ffffffffc0206610 <etext+0x484>
ffffffffc0200770:	a11ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200774:	6c4c                	ld	a1,152(s0)
ffffffffc0200776:	00006517          	auipc	a0,0x6
ffffffffc020077a:	eb250513          	addi	a0,a0,-334 # ffffffffc0206628 <etext+0x49c>
ffffffffc020077e:	a03ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200782:	704c                	ld	a1,160(s0)
ffffffffc0200784:	00006517          	auipc	a0,0x6
ffffffffc0200788:	ebc50513          	addi	a0,a0,-324 # ffffffffc0206640 <etext+0x4b4>
ffffffffc020078c:	9f5ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200790:	744c                	ld	a1,168(s0)
ffffffffc0200792:	00006517          	auipc	a0,0x6
ffffffffc0200796:	ec650513          	addi	a0,a0,-314 # ffffffffc0206658 <etext+0x4cc>
ffffffffc020079a:	9e7ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020079e:	784c                	ld	a1,176(s0)
ffffffffc02007a0:	00006517          	auipc	a0,0x6
ffffffffc02007a4:	ed050513          	addi	a0,a0,-304 # ffffffffc0206670 <etext+0x4e4>
ffffffffc02007a8:	9d9ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007ac:	7c4c                	ld	a1,184(s0)
ffffffffc02007ae:	00006517          	auipc	a0,0x6
ffffffffc02007b2:	eda50513          	addi	a0,a0,-294 # ffffffffc0206688 <etext+0x4fc>
ffffffffc02007b6:	9cbff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007ba:	606c                	ld	a1,192(s0)
ffffffffc02007bc:	00006517          	auipc	a0,0x6
ffffffffc02007c0:	ee450513          	addi	a0,a0,-284 # ffffffffc02066a0 <etext+0x514>
ffffffffc02007c4:	9bdff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007c8:	646c                	ld	a1,200(s0)
ffffffffc02007ca:	00006517          	auipc	a0,0x6
ffffffffc02007ce:	eee50513          	addi	a0,a0,-274 # ffffffffc02066b8 <etext+0x52c>
ffffffffc02007d2:	9afff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007d6:	686c                	ld	a1,208(s0)
ffffffffc02007d8:	00006517          	auipc	a0,0x6
ffffffffc02007dc:	ef850513          	addi	a0,a0,-264 # ffffffffc02066d0 <etext+0x544>
ffffffffc02007e0:	9a1ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007e4:	6c6c                	ld	a1,216(s0)
ffffffffc02007e6:	00006517          	auipc	a0,0x6
ffffffffc02007ea:	f0250513          	addi	a0,a0,-254 # ffffffffc02066e8 <etext+0x55c>
ffffffffc02007ee:	993ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02007f2:	706c                	ld	a1,224(s0)
ffffffffc02007f4:	00006517          	auipc	a0,0x6
ffffffffc02007f8:	f0c50513          	addi	a0,a0,-244 # ffffffffc0206700 <etext+0x574>
ffffffffc02007fc:	985ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200800:	746c                	ld	a1,232(s0)
ffffffffc0200802:	00006517          	auipc	a0,0x6
ffffffffc0200806:	f1650513          	addi	a0,a0,-234 # ffffffffc0206718 <etext+0x58c>
ffffffffc020080a:	977ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020080e:	786c                	ld	a1,240(s0)
ffffffffc0200810:	00006517          	auipc	a0,0x6
ffffffffc0200814:	f2050513          	addi	a0,a0,-224 # ffffffffc0206730 <etext+0x5a4>
ffffffffc0200818:	969ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020081c:	7c6c                	ld	a1,248(s0)
ffffffffc020081e:	6402                	ld	s0,0(sp)
ffffffffc0200820:	60a2                	ld	ra,8(sp)
ffffffffc0200822:	00006517          	auipc	a0,0x6
ffffffffc0200826:	f2650513          	addi	a0,a0,-218 # ffffffffc0206748 <etext+0x5bc>
ffffffffc020082a:	0141                	addi	sp,sp,16
ffffffffc020082c:	955ff06f          	j	ffffffffc0200180 <cprintf>

ffffffffc0200830 <print_trapframe>:
ffffffffc0200830:	1141                	addi	sp,sp,-16
ffffffffc0200832:	e022                	sd	s0,0(sp)
ffffffffc0200834:	85aa                	mv	a1,a0
ffffffffc0200836:	842a                	mv	s0,a0
ffffffffc0200838:	00006517          	auipc	a0,0x6
ffffffffc020083c:	f2850513          	addi	a0,a0,-216 # ffffffffc0206760 <etext+0x5d4>
ffffffffc0200840:	e406                	sd	ra,8(sp)
ffffffffc0200842:	93fff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200846:	8522                	mv	a0,s0
ffffffffc0200848:	e1bff0ef          	jal	ffffffffc0200662 <print_regs>
ffffffffc020084c:	10043583          	ld	a1,256(s0)
ffffffffc0200850:	00006517          	auipc	a0,0x6
ffffffffc0200854:	f2850513          	addi	a0,a0,-216 # ffffffffc0206778 <etext+0x5ec>
ffffffffc0200858:	929ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020085c:	10843583          	ld	a1,264(s0)
ffffffffc0200860:	00006517          	auipc	a0,0x6
ffffffffc0200864:	f3050513          	addi	a0,a0,-208 # ffffffffc0206790 <etext+0x604>
ffffffffc0200868:	919ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020086c:	11043583          	ld	a1,272(s0)
ffffffffc0200870:	00006517          	auipc	a0,0x6
ffffffffc0200874:	f3850513          	addi	a0,a0,-200 # ffffffffc02067a8 <etext+0x61c>
ffffffffc0200878:	909ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020087c:	11843583          	ld	a1,280(s0)
ffffffffc0200880:	6402                	ld	s0,0(sp)
ffffffffc0200882:	60a2                	ld	ra,8(sp)
ffffffffc0200884:	00006517          	auipc	a0,0x6
ffffffffc0200888:	f3450513          	addi	a0,a0,-204 # ffffffffc02067b8 <etext+0x62c>
ffffffffc020088c:	0141                	addi	sp,sp,16
ffffffffc020088e:	8f3ff06f          	j	ffffffffc0200180 <cprintf>

ffffffffc0200892 <pgfault_handler>:
ffffffffc0200892:	1101                	addi	sp,sp,-32
ffffffffc0200894:	e426                	sd	s1,8(sp)
ffffffffc0200896:	00037497          	auipc	s1,0x37
ffffffffc020089a:	a0248493          	addi	s1,s1,-1534 # ffffffffc0237298 <check_mm_struct>
ffffffffc020089e:	609c                	ld	a5,0(s1)
ffffffffc02008a0:	e822                	sd	s0,16(sp)
ffffffffc02008a2:	ec06                	sd	ra,24(sp)
ffffffffc02008a4:	842a                	mv	s0,a0
ffffffffc02008a6:	cfb9                	beqz	a5,ffffffffc0200904 <pgfault_handler+0x72>
ffffffffc02008a8:	10053783          	ld	a5,256(a0)
ffffffffc02008ac:	11053583          	ld	a1,272(a0)
ffffffffc02008b0:	05500613          	li	a2,85
ffffffffc02008b4:	1007f793          	andi	a5,a5,256
ffffffffc02008b8:	c399                	beqz	a5,ffffffffc02008be <pgfault_handler+0x2c>
ffffffffc02008ba:	04b00613          	li	a2,75
ffffffffc02008be:	11843703          	ld	a4,280(s0)
ffffffffc02008c2:	47bd                	li	a5,15
ffffffffc02008c4:	05200693          	li	a3,82
ffffffffc02008c8:	04f70e63          	beq	a4,a5,ffffffffc0200924 <pgfault_handler+0x92>
ffffffffc02008cc:	00006517          	auipc	a0,0x6
ffffffffc02008d0:	f0450513          	addi	a0,a0,-252 # ffffffffc02067d0 <etext+0x644>
ffffffffc02008d4:	8adff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02008d8:	6088                	ld	a0,0(s1)
ffffffffc02008da:	c50d                	beqz	a0,ffffffffc0200904 <pgfault_handler+0x72>
ffffffffc02008dc:	00037717          	auipc	a4,0x37
ffffffffc02008e0:	9cc73703          	ld	a4,-1588(a4) # ffffffffc02372a8 <current>
ffffffffc02008e4:	00037797          	auipc	a5,0x37
ffffffffc02008e8:	9d47b783          	ld	a5,-1580(a5) # ffffffffc02372b8 <idleproc>
ffffffffc02008ec:	02f71f63          	bne	a4,a5,ffffffffc020092a <pgfault_handler+0x98>
ffffffffc02008f0:	11043603          	ld	a2,272(s0)
ffffffffc02008f4:	11843583          	ld	a1,280(s0)
ffffffffc02008f8:	6442                	ld	s0,16(sp)
ffffffffc02008fa:	60e2                	ld	ra,24(sp)
ffffffffc02008fc:	64a2                	ld	s1,8(sp)
ffffffffc02008fe:	6105                	addi	sp,sp,32
ffffffffc0200900:	39b0306f          	j	ffffffffc020449a <do_pgfault>
ffffffffc0200904:	00037797          	auipc	a5,0x37
ffffffffc0200908:	9a47b783          	ld	a5,-1628(a5) # ffffffffc02372a8 <current>
ffffffffc020090c:	cf9d                	beqz	a5,ffffffffc020094a <pgfault_handler+0xb8>
ffffffffc020090e:	11043603          	ld	a2,272(s0)
ffffffffc0200912:	11843583          	ld	a1,280(s0)
ffffffffc0200916:	6442                	ld	s0,16(sp)
ffffffffc0200918:	60e2                	ld	ra,24(sp)
ffffffffc020091a:	64a2                	ld	s1,8(sp)
ffffffffc020091c:	7788                	ld	a0,40(a5)
ffffffffc020091e:	6105                	addi	sp,sp,32
ffffffffc0200920:	37b0306f          	j	ffffffffc020449a <do_pgfault>
ffffffffc0200924:	05700693          	li	a3,87
ffffffffc0200928:	b755                	j	ffffffffc02008cc <pgfault_handler+0x3a>
ffffffffc020092a:	00006697          	auipc	a3,0x6
ffffffffc020092e:	ec668693          	addi	a3,a3,-314 # ffffffffc02067f0 <etext+0x664>
ffffffffc0200932:	00006617          	auipc	a2,0x6
ffffffffc0200936:	ed660613          	addi	a2,a2,-298 # ffffffffc0206808 <etext+0x67c>
ffffffffc020093a:	06b00593          	li	a1,107
ffffffffc020093e:	00006517          	auipc	a0,0x6
ffffffffc0200942:	ee250513          	addi	a0,a0,-286 # ffffffffc0206820 <etext+0x694>
ffffffffc0200946:	b2fff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020094a:	8522                	mv	a0,s0
ffffffffc020094c:	ee5ff0ef          	jal	ffffffffc0200830 <print_trapframe>
ffffffffc0200950:	10043783          	ld	a5,256(s0)
ffffffffc0200954:	11043583          	ld	a1,272(s0)
ffffffffc0200958:	05500613          	li	a2,85
ffffffffc020095c:	1007f793          	andi	a5,a5,256
ffffffffc0200960:	c399                	beqz	a5,ffffffffc0200966 <pgfault_handler+0xd4>
ffffffffc0200962:	04b00613          	li	a2,75
ffffffffc0200966:	11843703          	ld	a4,280(s0)
ffffffffc020096a:	47bd                	li	a5,15
ffffffffc020096c:	05200693          	li	a3,82
ffffffffc0200970:	00f71463          	bne	a4,a5,ffffffffc0200978 <pgfault_handler+0xe6>
ffffffffc0200974:	05700693          	li	a3,87
ffffffffc0200978:	00006517          	auipc	a0,0x6
ffffffffc020097c:	e5850513          	addi	a0,a0,-424 # ffffffffc02067d0 <etext+0x644>
ffffffffc0200980:	801ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200984:	00006617          	auipc	a2,0x6
ffffffffc0200988:	eb460613          	addi	a2,a2,-332 # ffffffffc0206838 <etext+0x6ac>
ffffffffc020098c:	07200593          	li	a1,114
ffffffffc0200990:	00006517          	auipc	a0,0x6
ffffffffc0200994:	e9050513          	addi	a0,a0,-368 # ffffffffc0206820 <etext+0x694>
ffffffffc0200998:	addff0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc020099c <interrupt_handler>:
ffffffffc020099c:	11853783          	ld	a5,280(a0)
ffffffffc02009a0:	472d                	li	a4,11
ffffffffc02009a2:	0786                	slli	a5,a5,0x1
ffffffffc02009a4:	8385                	srli	a5,a5,0x1
ffffffffc02009a6:	08f76363          	bltu	a4,a5,ffffffffc0200a2c <interrupt_handler+0x90>
ffffffffc02009aa:	00008717          	auipc	a4,0x8
ffffffffc02009ae:	afe70713          	addi	a4,a4,-1282 # ffffffffc02084a8 <commands+0x48>
ffffffffc02009b2:	078a                	slli	a5,a5,0x2
ffffffffc02009b4:	97ba                	add	a5,a5,a4
ffffffffc02009b6:	439c                	lw	a5,0(a5)
ffffffffc02009b8:	97ba                	add	a5,a5,a4
ffffffffc02009ba:	8782                	jr	a5
ffffffffc02009bc:	00006517          	auipc	a0,0x6
ffffffffc02009c0:	ef450513          	addi	a0,a0,-268 # ffffffffc02068b0 <etext+0x724>
ffffffffc02009c4:	fbcff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc02009c8:	00006517          	auipc	a0,0x6
ffffffffc02009cc:	ec850513          	addi	a0,a0,-312 # ffffffffc0206890 <etext+0x704>
ffffffffc02009d0:	fb0ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc02009d4:	00006517          	auipc	a0,0x6
ffffffffc02009d8:	e7c50513          	addi	a0,a0,-388 # ffffffffc0206850 <etext+0x6c4>
ffffffffc02009dc:	fa4ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc02009e0:	00006517          	auipc	a0,0x6
ffffffffc02009e4:	e9050513          	addi	a0,a0,-368 # ffffffffc0206870 <etext+0x6e4>
ffffffffc02009e8:	f98ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc02009ec:	1141                	addi	sp,sp,-16
ffffffffc02009ee:	e406                	sd	ra,8(sp)
ffffffffc02009f0:	b69ff0ef          	jal	ffffffffc0200558 <clock_set_next_event>
ffffffffc02009f4:	00037697          	auipc	a3,0x37
ffffffffc02009f8:	84468693          	addi	a3,a3,-1980 # ffffffffc0237238 <ticks>
ffffffffc02009fc:	629c                	ld	a5,0(a3)
ffffffffc02009fe:	06400713          	li	a4,100
ffffffffc0200a02:	0785                	addi	a5,a5,1
ffffffffc0200a04:	02e7f733          	remu	a4,a5,a4
ffffffffc0200a08:	e29c                	sd	a5,0(a3)
ffffffffc0200a0a:	eb01                	bnez	a4,ffffffffc0200a1a <interrupt_handler+0x7e>
ffffffffc0200a0c:	00037797          	auipc	a5,0x37
ffffffffc0200a10:	89c7b783          	ld	a5,-1892(a5) # ffffffffc02372a8 <current>
ffffffffc0200a14:	c399                	beqz	a5,ffffffffc0200a1a <interrupt_handler+0x7e>
ffffffffc0200a16:	4705                	li	a4,1
ffffffffc0200a18:	ef98                	sd	a4,24(a5)
ffffffffc0200a1a:	60a2                	ld	ra,8(sp)
ffffffffc0200a1c:	0141                	addi	sp,sp,16
ffffffffc0200a1e:	8082                	ret
ffffffffc0200a20:	00006517          	auipc	a0,0x6
ffffffffc0200a24:	eb050513          	addi	a0,a0,-336 # ffffffffc02068d0 <etext+0x744>
ffffffffc0200a28:	f58ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc0200a2c:	b511                	j	ffffffffc0200830 <print_trapframe>

ffffffffc0200a2e <exception_handler>:
ffffffffc0200a2e:	11853783          	ld	a5,280(a0)
ffffffffc0200a32:	1101                	addi	sp,sp,-32
ffffffffc0200a34:	e822                	sd	s0,16(sp)
ffffffffc0200a36:	ec06                	sd	ra,24(sp)
ffffffffc0200a38:	473d                	li	a4,15
ffffffffc0200a3a:	842a                	mv	s0,a0
ffffffffc0200a3c:	16f76363          	bltu	a4,a5,ffffffffc0200ba2 <exception_handler+0x174>
ffffffffc0200a40:	00008717          	auipc	a4,0x8
ffffffffc0200a44:	a9870713          	addi	a4,a4,-1384 # ffffffffc02084d8 <commands+0x78>
ffffffffc0200a48:	078a                	slli	a5,a5,0x2
ffffffffc0200a4a:	97ba                	add	a5,a5,a4
ffffffffc0200a4c:	439c                	lw	a5,0(a5)
ffffffffc0200a4e:	97ba                	add	a5,a5,a4
ffffffffc0200a50:	8782                	jr	a5
ffffffffc0200a52:	00006517          	auipc	a0,0x6
ffffffffc0200a56:	f8e50513          	addi	a0,a0,-114 # ffffffffc02069e0 <etext+0x854>
ffffffffc0200a5a:	f26ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200a5e:	10843783          	ld	a5,264(s0)
ffffffffc0200a62:	60e2                	ld	ra,24(sp)
ffffffffc0200a64:	0791                	addi	a5,a5,4
ffffffffc0200a66:	10f43423          	sd	a5,264(s0)
ffffffffc0200a6a:	6442                	ld	s0,16(sp)
ffffffffc0200a6c:	6105                	addi	sp,sp,32
ffffffffc0200a6e:	1e00506f          	j	ffffffffc0205c4e <syscall>
ffffffffc0200a72:	00006517          	auipc	a0,0x6
ffffffffc0200a76:	f8e50513          	addi	a0,a0,-114 # ffffffffc0206a00 <etext+0x874>
ffffffffc0200a7a:	6442                	ld	s0,16(sp)
ffffffffc0200a7c:	60e2                	ld	ra,24(sp)
ffffffffc0200a7e:	6105                	addi	sp,sp,32
ffffffffc0200a80:	f00ff06f          	j	ffffffffc0200180 <cprintf>
ffffffffc0200a84:	00006517          	auipc	a0,0x6
ffffffffc0200a88:	f9c50513          	addi	a0,a0,-100 # ffffffffc0206a20 <etext+0x894>
ffffffffc0200a8c:	b7fd                	j	ffffffffc0200a7a <exception_handler+0x4c>
ffffffffc0200a8e:	00006517          	auipc	a0,0x6
ffffffffc0200a92:	fb250513          	addi	a0,a0,-78 # ffffffffc0206a40 <etext+0x8b4>
ffffffffc0200a96:	b7d5                	j	ffffffffc0200a7a <exception_handler+0x4c>
ffffffffc0200a98:	00006517          	auipc	a0,0x6
ffffffffc0200a9c:	fc050513          	addi	a0,a0,-64 # ffffffffc0206a58 <etext+0x8cc>
ffffffffc0200aa0:	e426                	sd	s1,8(sp)
ffffffffc0200aa2:	edeff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200aa6:	8522                	mv	a0,s0
ffffffffc0200aa8:	debff0ef          	jal	ffffffffc0200892 <pgfault_handler>
ffffffffc0200aac:	84aa                	mv	s1,a0
ffffffffc0200aae:	10051c63          	bnez	a0,ffffffffc0200bc6 <exception_handler+0x198>
ffffffffc0200ab2:	64a2                	ld	s1,8(sp)
ffffffffc0200ab4:	60e2                	ld	ra,24(sp)
ffffffffc0200ab6:	6442                	ld	s0,16(sp)
ffffffffc0200ab8:	6105                	addi	sp,sp,32
ffffffffc0200aba:	8082                	ret
ffffffffc0200abc:	00006517          	auipc	a0,0x6
ffffffffc0200ac0:	fb450513          	addi	a0,a0,-76 # ffffffffc0206a70 <etext+0x8e4>
ffffffffc0200ac4:	e426                	sd	s1,8(sp)
ffffffffc0200ac6:	ebaff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200aca:	8522                	mv	a0,s0
ffffffffc0200acc:	dc7ff0ef          	jal	ffffffffc0200892 <pgfault_handler>
ffffffffc0200ad0:	84aa                	mv	s1,a0
ffffffffc0200ad2:	d165                	beqz	a0,ffffffffc0200ab2 <exception_handler+0x84>
ffffffffc0200ad4:	8522                	mv	a0,s0
ffffffffc0200ad6:	d5bff0ef          	jal	ffffffffc0200830 <print_trapframe>
ffffffffc0200ada:	86a6                	mv	a3,s1
ffffffffc0200adc:	00006617          	auipc	a2,0x6
ffffffffc0200ae0:	eb460613          	addi	a2,a2,-332 # ffffffffc0206990 <etext+0x804>
ffffffffc0200ae4:	0f700593          	li	a1,247
ffffffffc0200ae8:	00006517          	auipc	a0,0x6
ffffffffc0200aec:	d3850513          	addi	a0,a0,-712 # ffffffffc0206820 <etext+0x694>
ffffffffc0200af0:	985ff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0200af4:	00006517          	auipc	a0,0x6
ffffffffc0200af8:	dfc50513          	addi	a0,a0,-516 # ffffffffc02068f0 <etext+0x764>
ffffffffc0200afc:	bfbd                	j	ffffffffc0200a7a <exception_handler+0x4c>
ffffffffc0200afe:	00006517          	auipc	a0,0x6
ffffffffc0200b02:	e1250513          	addi	a0,a0,-494 # ffffffffc0206910 <etext+0x784>
ffffffffc0200b06:	bf95                	j	ffffffffc0200a7a <exception_handler+0x4c>
ffffffffc0200b08:	00006517          	auipc	a0,0x6
ffffffffc0200b0c:	e2850513          	addi	a0,a0,-472 # ffffffffc0206930 <etext+0x7a4>
ffffffffc0200b10:	b7ad                	j	ffffffffc0200a7a <exception_handler+0x4c>
ffffffffc0200b12:	00006517          	auipc	a0,0x6
ffffffffc0200b16:	e3650513          	addi	a0,a0,-458 # ffffffffc0206948 <etext+0x7bc>
ffffffffc0200b1a:	e66ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200b1e:	6458                	ld	a4,136(s0)
ffffffffc0200b20:	47a9                	li	a5,10
ffffffffc0200b22:	f8f719e3          	bne	a4,a5,ffffffffc0200ab4 <exception_handler+0x86>
ffffffffc0200b26:	bf25                	j	ffffffffc0200a5e <exception_handler+0x30>
ffffffffc0200b28:	00006517          	auipc	a0,0x6
ffffffffc0200b2c:	e3050513          	addi	a0,a0,-464 # ffffffffc0206958 <etext+0x7cc>
ffffffffc0200b30:	b7a9                	j	ffffffffc0200a7a <exception_handler+0x4c>
ffffffffc0200b32:	00006517          	auipc	a0,0x6
ffffffffc0200b36:	e4650513          	addi	a0,a0,-442 # ffffffffc0206978 <etext+0x7ec>
ffffffffc0200b3a:	e426                	sd	s1,8(sp)
ffffffffc0200b3c:	e44ff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200b40:	8522                	mv	a0,s0
ffffffffc0200b42:	d51ff0ef          	jal	ffffffffc0200892 <pgfault_handler>
ffffffffc0200b46:	84aa                	mv	s1,a0
ffffffffc0200b48:	d52d                	beqz	a0,ffffffffc0200ab2 <exception_handler+0x84>
ffffffffc0200b4a:	8522                	mv	a0,s0
ffffffffc0200b4c:	ce5ff0ef          	jal	ffffffffc0200830 <print_trapframe>
ffffffffc0200b50:	86a6                	mv	a3,s1
ffffffffc0200b52:	00006617          	auipc	a2,0x6
ffffffffc0200b56:	e3e60613          	addi	a2,a2,-450 # ffffffffc0206990 <etext+0x804>
ffffffffc0200b5a:	0cc00593          	li	a1,204
ffffffffc0200b5e:	00006517          	auipc	a0,0x6
ffffffffc0200b62:	cc250513          	addi	a0,a0,-830 # ffffffffc0206820 <etext+0x694>
ffffffffc0200b66:	90fff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0200b6a:	00006517          	auipc	a0,0x6
ffffffffc0200b6e:	e5e50513          	addi	a0,a0,-418 # ffffffffc02069c8 <etext+0x83c>
ffffffffc0200b72:	e426                	sd	s1,8(sp)
ffffffffc0200b74:	e0cff0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0200b78:	8522                	mv	a0,s0
ffffffffc0200b7a:	d19ff0ef          	jal	ffffffffc0200892 <pgfault_handler>
ffffffffc0200b7e:	84aa                	mv	s1,a0
ffffffffc0200b80:	d90d                	beqz	a0,ffffffffc0200ab2 <exception_handler+0x84>
ffffffffc0200b82:	8522                	mv	a0,s0
ffffffffc0200b84:	cadff0ef          	jal	ffffffffc0200830 <print_trapframe>
ffffffffc0200b88:	86a6                	mv	a3,s1
ffffffffc0200b8a:	00006617          	auipc	a2,0x6
ffffffffc0200b8e:	e0660613          	addi	a2,a2,-506 # ffffffffc0206990 <etext+0x804>
ffffffffc0200b92:	0d600593          	li	a1,214
ffffffffc0200b96:	00006517          	auipc	a0,0x6
ffffffffc0200b9a:	c8a50513          	addi	a0,a0,-886 # ffffffffc0206820 <etext+0x694>
ffffffffc0200b9e:	8d7ff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0200ba2:	8522                	mv	a0,s0
ffffffffc0200ba4:	6442                	ld	s0,16(sp)
ffffffffc0200ba6:	60e2                	ld	ra,24(sp)
ffffffffc0200ba8:	6105                	addi	sp,sp,32
ffffffffc0200baa:	b159                	j	ffffffffc0200830 <print_trapframe>
ffffffffc0200bac:	00006617          	auipc	a2,0x6
ffffffffc0200bb0:	e0460613          	addi	a2,a2,-508 # ffffffffc02069b0 <etext+0x824>
ffffffffc0200bb4:	0d000593          	li	a1,208
ffffffffc0200bb8:	00006517          	auipc	a0,0x6
ffffffffc0200bbc:	c6850513          	addi	a0,a0,-920 # ffffffffc0206820 <etext+0x694>
ffffffffc0200bc0:	e426                	sd	s1,8(sp)
ffffffffc0200bc2:	8b3ff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0200bc6:	8522                	mv	a0,s0
ffffffffc0200bc8:	c69ff0ef          	jal	ffffffffc0200830 <print_trapframe>
ffffffffc0200bcc:	86a6                	mv	a3,s1
ffffffffc0200bce:	00006617          	auipc	a2,0x6
ffffffffc0200bd2:	dc260613          	addi	a2,a2,-574 # ffffffffc0206990 <etext+0x804>
ffffffffc0200bd6:	0f000593          	li	a1,240
ffffffffc0200bda:	00006517          	auipc	a0,0x6
ffffffffc0200bde:	c4650513          	addi	a0,a0,-954 # ffffffffc0206820 <etext+0x694>
ffffffffc0200be2:	893ff0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0200be6 <trap>:
ffffffffc0200be6:	1101                	addi	sp,sp,-32
ffffffffc0200be8:	e822                	sd	s0,16(sp)
ffffffffc0200bea:	00036417          	auipc	s0,0x36
ffffffffc0200bee:	6be40413          	addi	s0,s0,1726 # ffffffffc02372a8 <current>
ffffffffc0200bf2:	6018                	ld	a4,0(s0)
ffffffffc0200bf4:	ec06                	sd	ra,24(sp)
ffffffffc0200bf6:	11853683          	ld	a3,280(a0)
ffffffffc0200bfa:	c329                	beqz	a4,ffffffffc0200c3c <trap+0x56>
ffffffffc0200bfc:	e426                	sd	s1,8(sp)
ffffffffc0200bfe:	10053483          	ld	s1,256(a0)
ffffffffc0200c02:	e04a                	sd	s2,0(sp)
ffffffffc0200c04:	0a073903          	ld	s2,160(a4)
ffffffffc0200c08:	f348                	sd	a0,160(a4)
ffffffffc0200c0a:	1004f493          	andi	s1,s1,256
ffffffffc0200c0e:	0206c463          	bltz	a3,ffffffffc0200c36 <trap+0x50>
ffffffffc0200c12:	e1dff0ef          	jal	ffffffffc0200a2e <exception_handler>
ffffffffc0200c16:	601c                	ld	a5,0(s0)
ffffffffc0200c18:	0b27b023          	sd	s2,160(a5)
ffffffffc0200c1c:	e499                	bnez	s1,ffffffffc0200c2a <trap+0x44>
ffffffffc0200c1e:	0b07a703          	lw	a4,176(a5)
ffffffffc0200c22:	8b05                	andi	a4,a4,1
ffffffffc0200c24:	ef0d                	bnez	a4,ffffffffc0200c5e <trap+0x78>
ffffffffc0200c26:	6f9c                	ld	a5,24(a5)
ffffffffc0200c28:	e785                	bnez	a5,ffffffffc0200c50 <trap+0x6a>
ffffffffc0200c2a:	60e2                	ld	ra,24(sp)
ffffffffc0200c2c:	6442                	ld	s0,16(sp)
ffffffffc0200c2e:	64a2                	ld	s1,8(sp)
ffffffffc0200c30:	6902                	ld	s2,0(sp)
ffffffffc0200c32:	6105                	addi	sp,sp,32
ffffffffc0200c34:	8082                	ret
ffffffffc0200c36:	d67ff0ef          	jal	ffffffffc020099c <interrupt_handler>
ffffffffc0200c3a:	bff1                	j	ffffffffc0200c16 <trap+0x30>
ffffffffc0200c3c:	0006c663          	bltz	a3,ffffffffc0200c48 <trap+0x62>
ffffffffc0200c40:	6442                	ld	s0,16(sp)
ffffffffc0200c42:	60e2                	ld	ra,24(sp)
ffffffffc0200c44:	6105                	addi	sp,sp,32
ffffffffc0200c46:	b3e5                	j	ffffffffc0200a2e <exception_handler>
ffffffffc0200c48:	6442                	ld	s0,16(sp)
ffffffffc0200c4a:	60e2                	ld	ra,24(sp)
ffffffffc0200c4c:	6105                	addi	sp,sp,32
ffffffffc0200c4e:	b3b9                	j	ffffffffc020099c <interrupt_handler>
ffffffffc0200c50:	6442                	ld	s0,16(sp)
ffffffffc0200c52:	64a2                	ld	s1,8(sp)
ffffffffc0200c54:	6902                	ld	s2,0(sp)
ffffffffc0200c56:	60e2                	ld	ra,24(sp)
ffffffffc0200c58:	6105                	addi	sp,sp,32
ffffffffc0200c5a:	7090406f          	j	ffffffffc0205b62 <schedule>
ffffffffc0200c5e:	555d                	li	a0,-9
ffffffffc0200c60:	1a2040ef          	jal	ffffffffc0204e02 <do_exit>
ffffffffc0200c64:	601c                	ld	a5,0(s0)
ffffffffc0200c66:	b7c1                	j	ffffffffc0200c26 <trap+0x40>

ffffffffc0200c68 <__alltraps>:
ffffffffc0200c68:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0200c6c:	00011463          	bnez	sp,ffffffffc0200c74 <__alltraps+0xc>
ffffffffc0200c70:	14002173          	csrr	sp,sscratch
ffffffffc0200c74:	712d                	addi	sp,sp,-288
ffffffffc0200c76:	e002                	sd	zero,0(sp)
ffffffffc0200c78:	e406                	sd	ra,8(sp)
ffffffffc0200c7a:	ec0e                	sd	gp,24(sp)
ffffffffc0200c7c:	f012                	sd	tp,32(sp)
ffffffffc0200c7e:	f416                	sd	t0,40(sp)
ffffffffc0200c80:	f81a                	sd	t1,48(sp)
ffffffffc0200c82:	fc1e                	sd	t2,56(sp)
ffffffffc0200c84:	e0a2                	sd	s0,64(sp)
ffffffffc0200c86:	e4a6                	sd	s1,72(sp)
ffffffffc0200c88:	e8aa                	sd	a0,80(sp)
ffffffffc0200c8a:	ecae                	sd	a1,88(sp)
ffffffffc0200c8c:	f0b2                	sd	a2,96(sp)
ffffffffc0200c8e:	f4b6                	sd	a3,104(sp)
ffffffffc0200c90:	f8ba                	sd	a4,112(sp)
ffffffffc0200c92:	fcbe                	sd	a5,120(sp)
ffffffffc0200c94:	e142                	sd	a6,128(sp)
ffffffffc0200c96:	e546                	sd	a7,136(sp)
ffffffffc0200c98:	e94a                	sd	s2,144(sp)
ffffffffc0200c9a:	ed4e                	sd	s3,152(sp)
ffffffffc0200c9c:	f152                	sd	s4,160(sp)
ffffffffc0200c9e:	f556                	sd	s5,168(sp)
ffffffffc0200ca0:	f95a                	sd	s6,176(sp)
ffffffffc0200ca2:	fd5e                	sd	s7,184(sp)
ffffffffc0200ca4:	e1e2                	sd	s8,192(sp)
ffffffffc0200ca6:	e5e6                	sd	s9,200(sp)
ffffffffc0200ca8:	e9ea                	sd	s10,208(sp)
ffffffffc0200caa:	edee                	sd	s11,216(sp)
ffffffffc0200cac:	f1f2                	sd	t3,224(sp)
ffffffffc0200cae:	f5f6                	sd	t4,232(sp)
ffffffffc0200cb0:	f9fa                	sd	t5,240(sp)
ffffffffc0200cb2:	fdfe                	sd	t6,248(sp)
ffffffffc0200cb4:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200cb8:	100024f3          	csrr	s1,sstatus
ffffffffc0200cbc:	14102973          	csrr	s2,sepc
ffffffffc0200cc0:	143029f3          	csrr	s3,stval
ffffffffc0200cc4:	14202a73          	csrr	s4,scause
ffffffffc0200cc8:	e822                	sd	s0,16(sp)
ffffffffc0200cca:	e226                	sd	s1,256(sp)
ffffffffc0200ccc:	e64a                	sd	s2,264(sp)
ffffffffc0200cce:	ea4e                	sd	s3,272(sp)
ffffffffc0200cd0:	ee52                	sd	s4,280(sp)
ffffffffc0200cd2:	850a                	mv	a0,sp
ffffffffc0200cd4:	f13ff0ef          	jal	ffffffffc0200be6 <trap>

ffffffffc0200cd8 <__trapret>:
ffffffffc0200cd8:	6492                	ld	s1,256(sp)
ffffffffc0200cda:	6932                	ld	s2,264(sp)
ffffffffc0200cdc:	1004f413          	andi	s0,s1,256
ffffffffc0200ce0:	e401                	bnez	s0,ffffffffc0200ce8 <__trapret+0x10>
ffffffffc0200ce2:	1200                	addi	s0,sp,288
ffffffffc0200ce4:	14041073          	csrw	sscratch,s0
ffffffffc0200ce8:	10049073          	csrw	sstatus,s1
ffffffffc0200cec:	14191073          	csrw	sepc,s2
ffffffffc0200cf0:	60a2                	ld	ra,8(sp)
ffffffffc0200cf2:	61e2                	ld	gp,24(sp)
ffffffffc0200cf4:	7202                	ld	tp,32(sp)
ffffffffc0200cf6:	72a2                	ld	t0,40(sp)
ffffffffc0200cf8:	7342                	ld	t1,48(sp)
ffffffffc0200cfa:	73e2                	ld	t2,56(sp)
ffffffffc0200cfc:	6406                	ld	s0,64(sp)
ffffffffc0200cfe:	64a6                	ld	s1,72(sp)
ffffffffc0200d00:	6546                	ld	a0,80(sp)
ffffffffc0200d02:	65e6                	ld	a1,88(sp)
ffffffffc0200d04:	7606                	ld	a2,96(sp)
ffffffffc0200d06:	76a6                	ld	a3,104(sp)
ffffffffc0200d08:	7746                	ld	a4,112(sp)
ffffffffc0200d0a:	77e6                	ld	a5,120(sp)
ffffffffc0200d0c:	680a                	ld	a6,128(sp)
ffffffffc0200d0e:	68aa                	ld	a7,136(sp)
ffffffffc0200d10:	694a                	ld	s2,144(sp)
ffffffffc0200d12:	69ea                	ld	s3,152(sp)
ffffffffc0200d14:	7a0a                	ld	s4,160(sp)
ffffffffc0200d16:	7aaa                	ld	s5,168(sp)
ffffffffc0200d18:	7b4a                	ld	s6,176(sp)
ffffffffc0200d1a:	7bea                	ld	s7,184(sp)
ffffffffc0200d1c:	6c0e                	ld	s8,192(sp)
ffffffffc0200d1e:	6cae                	ld	s9,200(sp)
ffffffffc0200d20:	6d4e                	ld	s10,208(sp)
ffffffffc0200d22:	6dee                	ld	s11,216(sp)
ffffffffc0200d24:	7e0e                	ld	t3,224(sp)
ffffffffc0200d26:	7eae                	ld	t4,232(sp)
ffffffffc0200d28:	7f4e                	ld	t5,240(sp)
ffffffffc0200d2a:	7fee                	ld	t6,248(sp)
ffffffffc0200d2c:	6142                	ld	sp,16(sp)
ffffffffc0200d2e:	10200073          	sret

ffffffffc0200d32 <forkrets>:
ffffffffc0200d32:	812a                	mv	sp,a0
ffffffffc0200d34:	b755                	j	ffffffffc0200cd8 <__trapret>

ffffffffc0200d36 <default_init>:
ffffffffc0200d36:	00032797          	auipc	a5,0x32
ffffffffc0200d3a:	42a78793          	addi	a5,a5,1066 # ffffffffc0233160 <free_area>
ffffffffc0200d3e:	e79c                	sd	a5,8(a5)
ffffffffc0200d40:	e39c                	sd	a5,0(a5)
ffffffffc0200d42:	0007a823          	sw	zero,16(a5)
ffffffffc0200d46:	8082                	ret

ffffffffc0200d48 <default_nr_free_pages>:
ffffffffc0200d48:	00032517          	auipc	a0,0x32
ffffffffc0200d4c:	42856503          	lwu	a0,1064(a0) # ffffffffc0233170 <free_area+0x10>
ffffffffc0200d50:	8082                	ret

ffffffffc0200d52 <default_check>:
ffffffffc0200d52:	715d                	addi	sp,sp,-80
ffffffffc0200d54:	e0a2                	sd	s0,64(sp)
ffffffffc0200d56:	00032417          	auipc	s0,0x32
ffffffffc0200d5a:	40a40413          	addi	s0,s0,1034 # ffffffffc0233160 <free_area>
ffffffffc0200d5e:	641c                	ld	a5,8(s0)
ffffffffc0200d60:	e486                	sd	ra,72(sp)
ffffffffc0200d62:	fc26                	sd	s1,56(sp)
ffffffffc0200d64:	f84a                	sd	s2,48(sp)
ffffffffc0200d66:	f44e                	sd	s3,40(sp)
ffffffffc0200d68:	f052                	sd	s4,32(sp)
ffffffffc0200d6a:	ec56                	sd	s5,24(sp)
ffffffffc0200d6c:	e85a                	sd	s6,16(sp)
ffffffffc0200d6e:	e45e                	sd	s7,8(sp)
ffffffffc0200d70:	e062                	sd	s8,0(sp)
ffffffffc0200d72:	2a878963          	beq	a5,s0,ffffffffc0201024 <default_check+0x2d2>
ffffffffc0200d76:	4481                	li	s1,0
ffffffffc0200d78:	4901                	li	s2,0
ffffffffc0200d7a:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200d7e:	8b09                	andi	a4,a4,2
ffffffffc0200d80:	2a070663          	beqz	a4,ffffffffc020102c <default_check+0x2da>
ffffffffc0200d84:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200d88:	679c                	ld	a5,8(a5)
ffffffffc0200d8a:	2905                	addiw	s2,s2,1
ffffffffc0200d8c:	9cb9                	addw	s1,s1,a4
ffffffffc0200d8e:	fe8796e3          	bne	a5,s0,ffffffffc0200d7a <default_check+0x28>
ffffffffc0200d92:	89a6                	mv	s3,s1
ffffffffc0200d94:	70d000ef          	jal	ffffffffc0201ca0 <nr_free_pages>
ffffffffc0200d98:	6f351a63          	bne	a0,s3,ffffffffc020148c <default_check+0x73a>
ffffffffc0200d9c:	4505                	li	a0,1
ffffffffc0200d9e:	633000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200da2:	8aaa                	mv	s5,a0
ffffffffc0200da4:	42050463          	beqz	a0,ffffffffc02011cc <default_check+0x47a>
ffffffffc0200da8:	4505                	li	a0,1
ffffffffc0200daa:	627000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200dae:	89aa                	mv	s3,a0
ffffffffc0200db0:	6e050e63          	beqz	a0,ffffffffc02014ac <default_check+0x75a>
ffffffffc0200db4:	4505                	li	a0,1
ffffffffc0200db6:	61b000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200dba:	8a2a                	mv	s4,a0
ffffffffc0200dbc:	48050863          	beqz	a0,ffffffffc020124c <default_check+0x4fa>
ffffffffc0200dc0:	293a8663          	beq	s5,s3,ffffffffc020104c <default_check+0x2fa>
ffffffffc0200dc4:	28aa8463          	beq	s5,a0,ffffffffc020104c <default_check+0x2fa>
ffffffffc0200dc8:	28a98263          	beq	s3,a0,ffffffffc020104c <default_check+0x2fa>
ffffffffc0200dcc:	000aa783          	lw	a5,0(s5)
ffffffffc0200dd0:	28079e63          	bnez	a5,ffffffffc020106c <default_check+0x31a>
ffffffffc0200dd4:	0009a783          	lw	a5,0(s3)
ffffffffc0200dd8:	28079a63          	bnez	a5,ffffffffc020106c <default_check+0x31a>
ffffffffc0200ddc:	411c                	lw	a5,0(a0)
ffffffffc0200dde:	28079763          	bnez	a5,ffffffffc020106c <default_check+0x31a>
ffffffffc0200de2:	00036797          	auipc	a5,0x36
ffffffffc0200de6:	48e7b783          	ld	a5,1166(a5) # ffffffffc0237270 <pages>
ffffffffc0200dea:	40fa8733          	sub	a4,s5,a5
ffffffffc0200dee:	00008617          	auipc	a2,0x8
ffffffffc0200df2:	a8263603          	ld	a2,-1406(a2) # ffffffffc0208870 <nbase>
ffffffffc0200df6:	8719                	srai	a4,a4,0x6
ffffffffc0200df8:	9732                	add	a4,a4,a2
ffffffffc0200dfa:	00036697          	auipc	a3,0x36
ffffffffc0200dfe:	46e6b683          	ld	a3,1134(a3) # ffffffffc0237268 <npage>
ffffffffc0200e02:	06b2                	slli	a3,a3,0xc
ffffffffc0200e04:	0732                	slli	a4,a4,0xc
ffffffffc0200e06:	28d77363          	bgeu	a4,a3,ffffffffc020108c <default_check+0x33a>
ffffffffc0200e0a:	40f98733          	sub	a4,s3,a5
ffffffffc0200e0e:	8719                	srai	a4,a4,0x6
ffffffffc0200e10:	9732                	add	a4,a4,a2
ffffffffc0200e12:	0732                	slli	a4,a4,0xc
ffffffffc0200e14:	4ad77c63          	bgeu	a4,a3,ffffffffc02012cc <default_check+0x57a>
ffffffffc0200e18:	40f507b3          	sub	a5,a0,a5
ffffffffc0200e1c:	8799                	srai	a5,a5,0x6
ffffffffc0200e1e:	97b2                	add	a5,a5,a2
ffffffffc0200e20:	07b2                	slli	a5,a5,0xc
ffffffffc0200e22:	30d7f563          	bgeu	a5,a3,ffffffffc020112c <default_check+0x3da>
ffffffffc0200e26:	4505                	li	a0,1
ffffffffc0200e28:	00043c03          	ld	s8,0(s0)
ffffffffc0200e2c:	00843b83          	ld	s7,8(s0)
ffffffffc0200e30:	01042b03          	lw	s6,16(s0)
ffffffffc0200e34:	e400                	sd	s0,8(s0)
ffffffffc0200e36:	e000                	sd	s0,0(s0)
ffffffffc0200e38:	00032797          	auipc	a5,0x32
ffffffffc0200e3c:	3207ac23          	sw	zero,824(a5) # ffffffffc0233170 <free_area+0x10>
ffffffffc0200e40:	591000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200e44:	2c051463          	bnez	a0,ffffffffc020110c <default_check+0x3ba>
ffffffffc0200e48:	4585                	li	a1,1
ffffffffc0200e4a:	8556                	mv	a0,s5
ffffffffc0200e4c:	615000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200e50:	4585                	li	a1,1
ffffffffc0200e52:	854e                	mv	a0,s3
ffffffffc0200e54:	60d000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200e58:	4585                	li	a1,1
ffffffffc0200e5a:	8552                	mv	a0,s4
ffffffffc0200e5c:	605000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200e60:	4818                	lw	a4,16(s0)
ffffffffc0200e62:	478d                	li	a5,3
ffffffffc0200e64:	28f71463          	bne	a4,a5,ffffffffc02010ec <default_check+0x39a>
ffffffffc0200e68:	4505                	li	a0,1
ffffffffc0200e6a:	567000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200e6e:	89aa                	mv	s3,a0
ffffffffc0200e70:	24050e63          	beqz	a0,ffffffffc02010cc <default_check+0x37a>
ffffffffc0200e74:	4505                	li	a0,1
ffffffffc0200e76:	55b000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200e7a:	8aaa                	mv	s5,a0
ffffffffc0200e7c:	3a050863          	beqz	a0,ffffffffc020122c <default_check+0x4da>
ffffffffc0200e80:	4505                	li	a0,1
ffffffffc0200e82:	54f000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200e86:	8a2a                	mv	s4,a0
ffffffffc0200e88:	38050263          	beqz	a0,ffffffffc020120c <default_check+0x4ba>
ffffffffc0200e8c:	4505                	li	a0,1
ffffffffc0200e8e:	543000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200e92:	34051d63          	bnez	a0,ffffffffc02011ec <default_check+0x49a>
ffffffffc0200e96:	4585                	li	a1,1
ffffffffc0200e98:	854e                	mv	a0,s3
ffffffffc0200e9a:	5c7000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200e9e:	641c                	ld	a5,8(s0)
ffffffffc0200ea0:	20878663          	beq	a5,s0,ffffffffc02010ac <default_check+0x35a>
ffffffffc0200ea4:	4505                	li	a0,1
ffffffffc0200ea6:	52b000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200eaa:	30a99163          	bne	s3,a0,ffffffffc02011ac <default_check+0x45a>
ffffffffc0200eae:	4505                	li	a0,1
ffffffffc0200eb0:	521000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200eb4:	2c051c63          	bnez	a0,ffffffffc020118c <default_check+0x43a>
ffffffffc0200eb8:	481c                	lw	a5,16(s0)
ffffffffc0200eba:	2a079963          	bnez	a5,ffffffffc020116c <default_check+0x41a>
ffffffffc0200ebe:	854e                	mv	a0,s3
ffffffffc0200ec0:	4585                	li	a1,1
ffffffffc0200ec2:	01843023          	sd	s8,0(s0)
ffffffffc0200ec6:	01743423          	sd	s7,8(s0)
ffffffffc0200eca:	01642823          	sw	s6,16(s0)
ffffffffc0200ece:	593000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200ed2:	4585                	li	a1,1
ffffffffc0200ed4:	8556                	mv	a0,s5
ffffffffc0200ed6:	58b000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200eda:	4585                	li	a1,1
ffffffffc0200edc:	8552                	mv	a0,s4
ffffffffc0200ede:	583000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200ee2:	4515                	li	a0,5
ffffffffc0200ee4:	4ed000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200ee8:	89aa                	mv	s3,a0
ffffffffc0200eea:	26050163          	beqz	a0,ffffffffc020114c <default_check+0x3fa>
ffffffffc0200eee:	651c                	ld	a5,8(a0)
ffffffffc0200ef0:	8b89                	andi	a5,a5,2
ffffffffc0200ef2:	52079d63          	bnez	a5,ffffffffc020142c <default_check+0x6da>
ffffffffc0200ef6:	4505                	li	a0,1
ffffffffc0200ef8:	00043b83          	ld	s7,0(s0)
ffffffffc0200efc:	00843b03          	ld	s6,8(s0)
ffffffffc0200f00:	e000                	sd	s0,0(s0)
ffffffffc0200f02:	e400                	sd	s0,8(s0)
ffffffffc0200f04:	4cd000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200f08:	50051263          	bnez	a0,ffffffffc020140c <default_check+0x6ba>
ffffffffc0200f0c:	08098a13          	addi	s4,s3,128
ffffffffc0200f10:	8552                	mv	a0,s4
ffffffffc0200f12:	458d                	li	a1,3
ffffffffc0200f14:	01042c03          	lw	s8,16(s0)
ffffffffc0200f18:	00032797          	auipc	a5,0x32
ffffffffc0200f1c:	2407ac23          	sw	zero,600(a5) # ffffffffc0233170 <free_area+0x10>
ffffffffc0200f20:	541000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200f24:	4511                	li	a0,4
ffffffffc0200f26:	4ab000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200f2a:	4c051163          	bnez	a0,ffffffffc02013ec <default_check+0x69a>
ffffffffc0200f2e:	0889b783          	ld	a5,136(s3)
ffffffffc0200f32:	8b89                	andi	a5,a5,2
ffffffffc0200f34:	48078c63          	beqz	a5,ffffffffc02013cc <default_check+0x67a>
ffffffffc0200f38:	0909a703          	lw	a4,144(s3)
ffffffffc0200f3c:	478d                	li	a5,3
ffffffffc0200f3e:	48f71763          	bne	a4,a5,ffffffffc02013cc <default_check+0x67a>
ffffffffc0200f42:	450d                	li	a0,3
ffffffffc0200f44:	48d000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200f48:	8aaa                	mv	s5,a0
ffffffffc0200f4a:	46050163          	beqz	a0,ffffffffc02013ac <default_check+0x65a>
ffffffffc0200f4e:	4505                	li	a0,1
ffffffffc0200f50:	481000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200f54:	42051c63          	bnez	a0,ffffffffc020138c <default_check+0x63a>
ffffffffc0200f58:	415a1a63          	bne	s4,s5,ffffffffc020136c <default_check+0x61a>
ffffffffc0200f5c:	4585                	li	a1,1
ffffffffc0200f5e:	854e                	mv	a0,s3
ffffffffc0200f60:	501000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200f64:	458d                	li	a1,3
ffffffffc0200f66:	8552                	mv	a0,s4
ffffffffc0200f68:	4f9000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200f6c:	0089b783          	ld	a5,8(s3)
ffffffffc0200f70:	04098a93          	addi	s5,s3,64
ffffffffc0200f74:	8b89                	andi	a5,a5,2
ffffffffc0200f76:	3c078b63          	beqz	a5,ffffffffc020134c <default_check+0x5fa>
ffffffffc0200f7a:	0109a703          	lw	a4,16(s3)
ffffffffc0200f7e:	4785                	li	a5,1
ffffffffc0200f80:	3cf71663          	bne	a4,a5,ffffffffc020134c <default_check+0x5fa>
ffffffffc0200f84:	008a3783          	ld	a5,8(s4)
ffffffffc0200f88:	8b89                	andi	a5,a5,2
ffffffffc0200f8a:	3a078163          	beqz	a5,ffffffffc020132c <default_check+0x5da>
ffffffffc0200f8e:	010a2703          	lw	a4,16(s4)
ffffffffc0200f92:	478d                	li	a5,3
ffffffffc0200f94:	38f71c63          	bne	a4,a5,ffffffffc020132c <default_check+0x5da>
ffffffffc0200f98:	4505                	li	a0,1
ffffffffc0200f9a:	437000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200f9e:	36a99763          	bne	s3,a0,ffffffffc020130c <default_check+0x5ba>
ffffffffc0200fa2:	4585                	li	a1,1
ffffffffc0200fa4:	4bd000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200fa8:	4509                	li	a0,2
ffffffffc0200faa:	427000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200fae:	32aa1f63          	bne	s4,a0,ffffffffc02012ec <default_check+0x59a>
ffffffffc0200fb2:	4589                	li	a1,2
ffffffffc0200fb4:	4ad000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200fb8:	4585                	li	a1,1
ffffffffc0200fba:	8556                	mv	a0,s5
ffffffffc0200fbc:	4a5000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200fc0:	4515                	li	a0,5
ffffffffc0200fc2:	40f000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200fc6:	89aa                	mv	s3,a0
ffffffffc0200fc8:	48050263          	beqz	a0,ffffffffc020144c <default_check+0x6fa>
ffffffffc0200fcc:	4505                	li	a0,1
ffffffffc0200fce:	403000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0200fd2:	2c051d63          	bnez	a0,ffffffffc02012ac <default_check+0x55a>
ffffffffc0200fd6:	481c                	lw	a5,16(s0)
ffffffffc0200fd8:	2a079a63          	bnez	a5,ffffffffc020128c <default_check+0x53a>
ffffffffc0200fdc:	4595                	li	a1,5
ffffffffc0200fde:	854e                	mv	a0,s3
ffffffffc0200fe0:	01842823          	sw	s8,16(s0)
ffffffffc0200fe4:	01743023          	sd	s7,0(s0)
ffffffffc0200fe8:	01643423          	sd	s6,8(s0)
ffffffffc0200fec:	475000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0200ff0:	641c                	ld	a5,8(s0)
ffffffffc0200ff2:	00878963          	beq	a5,s0,ffffffffc0201004 <default_check+0x2b2>
ffffffffc0200ff6:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200ffa:	679c                	ld	a5,8(a5)
ffffffffc0200ffc:	397d                	addiw	s2,s2,-1
ffffffffc0200ffe:	9c99                	subw	s1,s1,a4
ffffffffc0201000:	fe879be3          	bne	a5,s0,ffffffffc0200ff6 <default_check+0x2a4>
ffffffffc0201004:	26091463          	bnez	s2,ffffffffc020126c <default_check+0x51a>
ffffffffc0201008:	46049263          	bnez	s1,ffffffffc020146c <default_check+0x71a>
ffffffffc020100c:	60a6                	ld	ra,72(sp)
ffffffffc020100e:	6406                	ld	s0,64(sp)
ffffffffc0201010:	74e2                	ld	s1,56(sp)
ffffffffc0201012:	7942                	ld	s2,48(sp)
ffffffffc0201014:	79a2                	ld	s3,40(sp)
ffffffffc0201016:	7a02                	ld	s4,32(sp)
ffffffffc0201018:	6ae2                	ld	s5,24(sp)
ffffffffc020101a:	6b42                	ld	s6,16(sp)
ffffffffc020101c:	6ba2                	ld	s7,8(sp)
ffffffffc020101e:	6c02                	ld	s8,0(sp)
ffffffffc0201020:	6161                	addi	sp,sp,80
ffffffffc0201022:	8082                	ret
ffffffffc0201024:	4981                	li	s3,0
ffffffffc0201026:	4481                	li	s1,0
ffffffffc0201028:	4901                	li	s2,0
ffffffffc020102a:	b3ad                	j	ffffffffc0200d94 <default_check+0x42>
ffffffffc020102c:	00006697          	auipc	a3,0x6
ffffffffc0201030:	a5c68693          	addi	a3,a3,-1444 # ffffffffc0206a88 <etext+0x8fc>
ffffffffc0201034:	00005617          	auipc	a2,0x5
ffffffffc0201038:	7d460613          	addi	a2,a2,2004 # ffffffffc0206808 <etext+0x67c>
ffffffffc020103c:	0f000593          	li	a1,240
ffffffffc0201040:	00006517          	auipc	a0,0x6
ffffffffc0201044:	a5850513          	addi	a0,a0,-1448 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201048:	c2cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020104c:	00006697          	auipc	a3,0x6
ffffffffc0201050:	ae468693          	addi	a3,a3,-1308 # ffffffffc0206b30 <etext+0x9a4>
ffffffffc0201054:	00005617          	auipc	a2,0x5
ffffffffc0201058:	7b460613          	addi	a2,a2,1972 # ffffffffc0206808 <etext+0x67c>
ffffffffc020105c:	0bd00593          	li	a1,189
ffffffffc0201060:	00006517          	auipc	a0,0x6
ffffffffc0201064:	a3850513          	addi	a0,a0,-1480 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201068:	c0cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020106c:	00006697          	auipc	a3,0x6
ffffffffc0201070:	aec68693          	addi	a3,a3,-1300 # ffffffffc0206b58 <etext+0x9cc>
ffffffffc0201074:	00005617          	auipc	a2,0x5
ffffffffc0201078:	79460613          	addi	a2,a2,1940 # ffffffffc0206808 <etext+0x67c>
ffffffffc020107c:	0be00593          	li	a1,190
ffffffffc0201080:	00006517          	auipc	a0,0x6
ffffffffc0201084:	a1850513          	addi	a0,a0,-1512 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201088:	becff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020108c:	00006697          	auipc	a3,0x6
ffffffffc0201090:	b0c68693          	addi	a3,a3,-1268 # ffffffffc0206b98 <etext+0xa0c>
ffffffffc0201094:	00005617          	auipc	a2,0x5
ffffffffc0201098:	77460613          	addi	a2,a2,1908 # ffffffffc0206808 <etext+0x67c>
ffffffffc020109c:	0c000593          	li	a1,192
ffffffffc02010a0:	00006517          	auipc	a0,0x6
ffffffffc02010a4:	9f850513          	addi	a0,a0,-1544 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02010a8:	bccff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02010ac:	00006697          	auipc	a3,0x6
ffffffffc02010b0:	b7468693          	addi	a3,a3,-1164 # ffffffffc0206c20 <etext+0xa94>
ffffffffc02010b4:	00005617          	auipc	a2,0x5
ffffffffc02010b8:	75460613          	addi	a2,a2,1876 # ffffffffc0206808 <etext+0x67c>
ffffffffc02010bc:	0d900593          	li	a1,217
ffffffffc02010c0:	00006517          	auipc	a0,0x6
ffffffffc02010c4:	9d850513          	addi	a0,a0,-1576 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02010c8:	bacff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02010cc:	00006697          	auipc	a3,0x6
ffffffffc02010d0:	a0468693          	addi	a3,a3,-1532 # ffffffffc0206ad0 <etext+0x944>
ffffffffc02010d4:	00005617          	auipc	a2,0x5
ffffffffc02010d8:	73460613          	addi	a2,a2,1844 # ffffffffc0206808 <etext+0x67c>
ffffffffc02010dc:	0d200593          	li	a1,210
ffffffffc02010e0:	00006517          	auipc	a0,0x6
ffffffffc02010e4:	9b850513          	addi	a0,a0,-1608 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02010e8:	b8cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02010ec:	00006697          	auipc	a3,0x6
ffffffffc02010f0:	b2468693          	addi	a3,a3,-1244 # ffffffffc0206c10 <etext+0xa84>
ffffffffc02010f4:	00005617          	auipc	a2,0x5
ffffffffc02010f8:	71460613          	addi	a2,a2,1812 # ffffffffc0206808 <etext+0x67c>
ffffffffc02010fc:	0d000593          	li	a1,208
ffffffffc0201100:	00006517          	auipc	a0,0x6
ffffffffc0201104:	99850513          	addi	a0,a0,-1640 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201108:	b6cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020110c:	00006697          	auipc	a3,0x6
ffffffffc0201110:	aec68693          	addi	a3,a3,-1300 # ffffffffc0206bf8 <etext+0xa6c>
ffffffffc0201114:	00005617          	auipc	a2,0x5
ffffffffc0201118:	6f460613          	addi	a2,a2,1780 # ffffffffc0206808 <etext+0x67c>
ffffffffc020111c:	0cb00593          	li	a1,203
ffffffffc0201120:	00006517          	auipc	a0,0x6
ffffffffc0201124:	97850513          	addi	a0,a0,-1672 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201128:	b4cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020112c:	00006697          	auipc	a3,0x6
ffffffffc0201130:	aac68693          	addi	a3,a3,-1364 # ffffffffc0206bd8 <etext+0xa4c>
ffffffffc0201134:	00005617          	auipc	a2,0x5
ffffffffc0201138:	6d460613          	addi	a2,a2,1748 # ffffffffc0206808 <etext+0x67c>
ffffffffc020113c:	0c200593          	li	a1,194
ffffffffc0201140:	00006517          	auipc	a0,0x6
ffffffffc0201144:	95850513          	addi	a0,a0,-1704 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201148:	b2cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020114c:	00006697          	auipc	a3,0x6
ffffffffc0201150:	b1c68693          	addi	a3,a3,-1252 # ffffffffc0206c68 <etext+0xadc>
ffffffffc0201154:	00005617          	auipc	a2,0x5
ffffffffc0201158:	6b460613          	addi	a2,a2,1716 # ffffffffc0206808 <etext+0x67c>
ffffffffc020115c:	0f800593          	li	a1,248
ffffffffc0201160:	00006517          	auipc	a0,0x6
ffffffffc0201164:	93850513          	addi	a0,a0,-1736 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201168:	b0cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020116c:	00006697          	auipc	a3,0x6
ffffffffc0201170:	aec68693          	addi	a3,a3,-1300 # ffffffffc0206c58 <etext+0xacc>
ffffffffc0201174:	00005617          	auipc	a2,0x5
ffffffffc0201178:	69460613          	addi	a2,a2,1684 # ffffffffc0206808 <etext+0x67c>
ffffffffc020117c:	0df00593          	li	a1,223
ffffffffc0201180:	00006517          	auipc	a0,0x6
ffffffffc0201184:	91850513          	addi	a0,a0,-1768 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201188:	aecff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020118c:	00006697          	auipc	a3,0x6
ffffffffc0201190:	a6c68693          	addi	a3,a3,-1428 # ffffffffc0206bf8 <etext+0xa6c>
ffffffffc0201194:	00005617          	auipc	a2,0x5
ffffffffc0201198:	67460613          	addi	a2,a2,1652 # ffffffffc0206808 <etext+0x67c>
ffffffffc020119c:	0dd00593          	li	a1,221
ffffffffc02011a0:	00006517          	auipc	a0,0x6
ffffffffc02011a4:	8f850513          	addi	a0,a0,-1800 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02011a8:	accff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02011ac:	00006697          	auipc	a3,0x6
ffffffffc02011b0:	a8c68693          	addi	a3,a3,-1396 # ffffffffc0206c38 <etext+0xaac>
ffffffffc02011b4:	00005617          	auipc	a2,0x5
ffffffffc02011b8:	65460613          	addi	a2,a2,1620 # ffffffffc0206808 <etext+0x67c>
ffffffffc02011bc:	0dc00593          	li	a1,220
ffffffffc02011c0:	00006517          	auipc	a0,0x6
ffffffffc02011c4:	8d850513          	addi	a0,a0,-1832 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02011c8:	aacff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02011cc:	00006697          	auipc	a3,0x6
ffffffffc02011d0:	90468693          	addi	a3,a3,-1788 # ffffffffc0206ad0 <etext+0x944>
ffffffffc02011d4:	00005617          	auipc	a2,0x5
ffffffffc02011d8:	63460613          	addi	a2,a2,1588 # ffffffffc0206808 <etext+0x67c>
ffffffffc02011dc:	0b900593          	li	a1,185
ffffffffc02011e0:	00006517          	auipc	a0,0x6
ffffffffc02011e4:	8b850513          	addi	a0,a0,-1864 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02011e8:	a8cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02011ec:	00006697          	auipc	a3,0x6
ffffffffc02011f0:	a0c68693          	addi	a3,a3,-1524 # ffffffffc0206bf8 <etext+0xa6c>
ffffffffc02011f4:	00005617          	auipc	a2,0x5
ffffffffc02011f8:	61460613          	addi	a2,a2,1556 # ffffffffc0206808 <etext+0x67c>
ffffffffc02011fc:	0d600593          	li	a1,214
ffffffffc0201200:	00006517          	auipc	a0,0x6
ffffffffc0201204:	89850513          	addi	a0,a0,-1896 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201208:	a6cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020120c:	00006697          	auipc	a3,0x6
ffffffffc0201210:	90468693          	addi	a3,a3,-1788 # ffffffffc0206b10 <etext+0x984>
ffffffffc0201214:	00005617          	auipc	a2,0x5
ffffffffc0201218:	5f460613          	addi	a2,a2,1524 # ffffffffc0206808 <etext+0x67c>
ffffffffc020121c:	0d400593          	li	a1,212
ffffffffc0201220:	00006517          	auipc	a0,0x6
ffffffffc0201224:	87850513          	addi	a0,a0,-1928 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201228:	a4cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020122c:	00006697          	auipc	a3,0x6
ffffffffc0201230:	8c468693          	addi	a3,a3,-1852 # ffffffffc0206af0 <etext+0x964>
ffffffffc0201234:	00005617          	auipc	a2,0x5
ffffffffc0201238:	5d460613          	addi	a2,a2,1492 # ffffffffc0206808 <etext+0x67c>
ffffffffc020123c:	0d300593          	li	a1,211
ffffffffc0201240:	00006517          	auipc	a0,0x6
ffffffffc0201244:	85850513          	addi	a0,a0,-1960 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201248:	a2cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020124c:	00006697          	auipc	a3,0x6
ffffffffc0201250:	8c468693          	addi	a3,a3,-1852 # ffffffffc0206b10 <etext+0x984>
ffffffffc0201254:	00005617          	auipc	a2,0x5
ffffffffc0201258:	5b460613          	addi	a2,a2,1460 # ffffffffc0206808 <etext+0x67c>
ffffffffc020125c:	0bb00593          	li	a1,187
ffffffffc0201260:	00006517          	auipc	a0,0x6
ffffffffc0201264:	83850513          	addi	a0,a0,-1992 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201268:	a0cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020126c:	00006697          	auipc	a3,0x6
ffffffffc0201270:	b4c68693          	addi	a3,a3,-1204 # ffffffffc0206db8 <etext+0xc2c>
ffffffffc0201274:	00005617          	auipc	a2,0x5
ffffffffc0201278:	59460613          	addi	a2,a2,1428 # ffffffffc0206808 <etext+0x67c>
ffffffffc020127c:	12500593          	li	a1,293
ffffffffc0201280:	00006517          	auipc	a0,0x6
ffffffffc0201284:	81850513          	addi	a0,a0,-2024 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201288:	9ecff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020128c:	00006697          	auipc	a3,0x6
ffffffffc0201290:	9cc68693          	addi	a3,a3,-1588 # ffffffffc0206c58 <etext+0xacc>
ffffffffc0201294:	00005617          	auipc	a2,0x5
ffffffffc0201298:	57460613          	addi	a2,a2,1396 # ffffffffc0206808 <etext+0x67c>
ffffffffc020129c:	11a00593          	li	a1,282
ffffffffc02012a0:	00005517          	auipc	a0,0x5
ffffffffc02012a4:	7f850513          	addi	a0,a0,2040 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02012a8:	9ccff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02012ac:	00006697          	auipc	a3,0x6
ffffffffc02012b0:	94c68693          	addi	a3,a3,-1716 # ffffffffc0206bf8 <etext+0xa6c>
ffffffffc02012b4:	00005617          	auipc	a2,0x5
ffffffffc02012b8:	55460613          	addi	a2,a2,1364 # ffffffffc0206808 <etext+0x67c>
ffffffffc02012bc:	11800593          	li	a1,280
ffffffffc02012c0:	00005517          	auipc	a0,0x5
ffffffffc02012c4:	7d850513          	addi	a0,a0,2008 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02012c8:	9acff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02012cc:	00006697          	auipc	a3,0x6
ffffffffc02012d0:	8ec68693          	addi	a3,a3,-1812 # ffffffffc0206bb8 <etext+0xa2c>
ffffffffc02012d4:	00005617          	auipc	a2,0x5
ffffffffc02012d8:	53460613          	addi	a2,a2,1332 # ffffffffc0206808 <etext+0x67c>
ffffffffc02012dc:	0c100593          	li	a1,193
ffffffffc02012e0:	00005517          	auipc	a0,0x5
ffffffffc02012e4:	7b850513          	addi	a0,a0,1976 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02012e8:	98cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02012ec:	00006697          	auipc	a3,0x6
ffffffffc02012f0:	a8c68693          	addi	a3,a3,-1396 # ffffffffc0206d78 <etext+0xbec>
ffffffffc02012f4:	00005617          	auipc	a2,0x5
ffffffffc02012f8:	51460613          	addi	a2,a2,1300 # ffffffffc0206808 <etext+0x67c>
ffffffffc02012fc:	11200593          	li	a1,274
ffffffffc0201300:	00005517          	auipc	a0,0x5
ffffffffc0201304:	79850513          	addi	a0,a0,1944 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201308:	96cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020130c:	00006697          	auipc	a3,0x6
ffffffffc0201310:	a4c68693          	addi	a3,a3,-1460 # ffffffffc0206d58 <etext+0xbcc>
ffffffffc0201314:	00005617          	auipc	a2,0x5
ffffffffc0201318:	4f460613          	addi	a2,a2,1268 # ffffffffc0206808 <etext+0x67c>
ffffffffc020131c:	11000593          	li	a1,272
ffffffffc0201320:	00005517          	auipc	a0,0x5
ffffffffc0201324:	77850513          	addi	a0,a0,1912 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201328:	94cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020132c:	00006697          	auipc	a3,0x6
ffffffffc0201330:	a0468693          	addi	a3,a3,-1532 # ffffffffc0206d30 <etext+0xba4>
ffffffffc0201334:	00005617          	auipc	a2,0x5
ffffffffc0201338:	4d460613          	addi	a2,a2,1236 # ffffffffc0206808 <etext+0x67c>
ffffffffc020133c:	10e00593          	li	a1,270
ffffffffc0201340:	00005517          	auipc	a0,0x5
ffffffffc0201344:	75850513          	addi	a0,a0,1880 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201348:	92cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020134c:	00006697          	auipc	a3,0x6
ffffffffc0201350:	9bc68693          	addi	a3,a3,-1604 # ffffffffc0206d08 <etext+0xb7c>
ffffffffc0201354:	00005617          	auipc	a2,0x5
ffffffffc0201358:	4b460613          	addi	a2,a2,1204 # ffffffffc0206808 <etext+0x67c>
ffffffffc020135c:	10d00593          	li	a1,269
ffffffffc0201360:	00005517          	auipc	a0,0x5
ffffffffc0201364:	73850513          	addi	a0,a0,1848 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201368:	90cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020136c:	00006697          	auipc	a3,0x6
ffffffffc0201370:	98c68693          	addi	a3,a3,-1652 # ffffffffc0206cf8 <etext+0xb6c>
ffffffffc0201374:	00005617          	auipc	a2,0x5
ffffffffc0201378:	49460613          	addi	a2,a2,1172 # ffffffffc0206808 <etext+0x67c>
ffffffffc020137c:	10800593          	li	a1,264
ffffffffc0201380:	00005517          	auipc	a0,0x5
ffffffffc0201384:	71850513          	addi	a0,a0,1816 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201388:	8ecff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020138c:	00006697          	auipc	a3,0x6
ffffffffc0201390:	86c68693          	addi	a3,a3,-1940 # ffffffffc0206bf8 <etext+0xa6c>
ffffffffc0201394:	00005617          	auipc	a2,0x5
ffffffffc0201398:	47460613          	addi	a2,a2,1140 # ffffffffc0206808 <etext+0x67c>
ffffffffc020139c:	10700593          	li	a1,263
ffffffffc02013a0:	00005517          	auipc	a0,0x5
ffffffffc02013a4:	6f850513          	addi	a0,a0,1784 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02013a8:	8ccff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02013ac:	00006697          	auipc	a3,0x6
ffffffffc02013b0:	92c68693          	addi	a3,a3,-1748 # ffffffffc0206cd8 <etext+0xb4c>
ffffffffc02013b4:	00005617          	auipc	a2,0x5
ffffffffc02013b8:	45460613          	addi	a2,a2,1108 # ffffffffc0206808 <etext+0x67c>
ffffffffc02013bc:	10600593          	li	a1,262
ffffffffc02013c0:	00005517          	auipc	a0,0x5
ffffffffc02013c4:	6d850513          	addi	a0,a0,1752 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02013c8:	8acff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02013cc:	00006697          	auipc	a3,0x6
ffffffffc02013d0:	8dc68693          	addi	a3,a3,-1828 # ffffffffc0206ca8 <etext+0xb1c>
ffffffffc02013d4:	00005617          	auipc	a2,0x5
ffffffffc02013d8:	43460613          	addi	a2,a2,1076 # ffffffffc0206808 <etext+0x67c>
ffffffffc02013dc:	10500593          	li	a1,261
ffffffffc02013e0:	00005517          	auipc	a0,0x5
ffffffffc02013e4:	6b850513          	addi	a0,a0,1720 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02013e8:	88cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02013ec:	00006697          	auipc	a3,0x6
ffffffffc02013f0:	8a468693          	addi	a3,a3,-1884 # ffffffffc0206c90 <etext+0xb04>
ffffffffc02013f4:	00005617          	auipc	a2,0x5
ffffffffc02013f8:	41460613          	addi	a2,a2,1044 # ffffffffc0206808 <etext+0x67c>
ffffffffc02013fc:	10400593          	li	a1,260
ffffffffc0201400:	00005517          	auipc	a0,0x5
ffffffffc0201404:	69850513          	addi	a0,a0,1688 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201408:	86cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020140c:	00005697          	auipc	a3,0x5
ffffffffc0201410:	7ec68693          	addi	a3,a3,2028 # ffffffffc0206bf8 <etext+0xa6c>
ffffffffc0201414:	00005617          	auipc	a2,0x5
ffffffffc0201418:	3f460613          	addi	a2,a2,1012 # ffffffffc0206808 <etext+0x67c>
ffffffffc020141c:	0fe00593          	li	a1,254
ffffffffc0201420:	00005517          	auipc	a0,0x5
ffffffffc0201424:	67850513          	addi	a0,a0,1656 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201428:	84cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020142c:	00006697          	auipc	a3,0x6
ffffffffc0201430:	84c68693          	addi	a3,a3,-1972 # ffffffffc0206c78 <etext+0xaec>
ffffffffc0201434:	00005617          	auipc	a2,0x5
ffffffffc0201438:	3d460613          	addi	a2,a2,980 # ffffffffc0206808 <etext+0x67c>
ffffffffc020143c:	0f900593          	li	a1,249
ffffffffc0201440:	00005517          	auipc	a0,0x5
ffffffffc0201444:	65850513          	addi	a0,a0,1624 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201448:	82cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020144c:	00006697          	auipc	a3,0x6
ffffffffc0201450:	94c68693          	addi	a3,a3,-1716 # ffffffffc0206d98 <etext+0xc0c>
ffffffffc0201454:	00005617          	auipc	a2,0x5
ffffffffc0201458:	3b460613          	addi	a2,a2,948 # ffffffffc0206808 <etext+0x67c>
ffffffffc020145c:	11700593          	li	a1,279
ffffffffc0201460:	00005517          	auipc	a0,0x5
ffffffffc0201464:	63850513          	addi	a0,a0,1592 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201468:	80cff0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020146c:	00006697          	auipc	a3,0x6
ffffffffc0201470:	95c68693          	addi	a3,a3,-1700 # ffffffffc0206dc8 <etext+0xc3c>
ffffffffc0201474:	00005617          	auipc	a2,0x5
ffffffffc0201478:	39460613          	addi	a2,a2,916 # ffffffffc0206808 <etext+0x67c>
ffffffffc020147c:	12600593          	li	a1,294
ffffffffc0201480:	00005517          	auipc	a0,0x5
ffffffffc0201484:	61850513          	addi	a0,a0,1560 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201488:	fedfe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020148c:	00005697          	auipc	a3,0x5
ffffffffc0201490:	62468693          	addi	a3,a3,1572 # ffffffffc0206ab0 <etext+0x924>
ffffffffc0201494:	00005617          	auipc	a2,0x5
ffffffffc0201498:	37460613          	addi	a2,a2,884 # ffffffffc0206808 <etext+0x67c>
ffffffffc020149c:	0f300593          	li	a1,243
ffffffffc02014a0:	00005517          	auipc	a0,0x5
ffffffffc02014a4:	5f850513          	addi	a0,a0,1528 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02014a8:	fcdfe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02014ac:	00005697          	auipc	a3,0x5
ffffffffc02014b0:	64468693          	addi	a3,a3,1604 # ffffffffc0206af0 <etext+0x964>
ffffffffc02014b4:	00005617          	auipc	a2,0x5
ffffffffc02014b8:	35460613          	addi	a2,a2,852 # ffffffffc0206808 <etext+0x67c>
ffffffffc02014bc:	0ba00593          	li	a1,186
ffffffffc02014c0:	00005517          	auipc	a0,0x5
ffffffffc02014c4:	5d850513          	addi	a0,a0,1496 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02014c8:	fadfe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc02014cc <default_free_pages>:
ffffffffc02014cc:	1141                	addi	sp,sp,-16
ffffffffc02014ce:	e406                	sd	ra,8(sp)
ffffffffc02014d0:	14058463          	beqz	a1,ffffffffc0201618 <default_free_pages+0x14c>
ffffffffc02014d4:	00659713          	slli	a4,a1,0x6
ffffffffc02014d8:	00e506b3          	add	a3,a0,a4
ffffffffc02014dc:	87aa                	mv	a5,a0
ffffffffc02014de:	c30d                	beqz	a4,ffffffffc0201500 <default_free_pages+0x34>
ffffffffc02014e0:	6798                	ld	a4,8(a5)
ffffffffc02014e2:	8b05                	andi	a4,a4,1
ffffffffc02014e4:	10071a63          	bnez	a4,ffffffffc02015f8 <default_free_pages+0x12c>
ffffffffc02014e8:	6798                	ld	a4,8(a5)
ffffffffc02014ea:	8b09                	andi	a4,a4,2
ffffffffc02014ec:	10071663          	bnez	a4,ffffffffc02015f8 <default_free_pages+0x12c>
ffffffffc02014f0:	0007b423          	sd	zero,8(a5)
ffffffffc02014f4:	0007a023          	sw	zero,0(a5)
ffffffffc02014f8:	04078793          	addi	a5,a5,64
ffffffffc02014fc:	fed792e3          	bne	a5,a3,ffffffffc02014e0 <default_free_pages+0x14>
ffffffffc0201500:	2581                	sext.w	a1,a1
ffffffffc0201502:	c90c                	sw	a1,16(a0)
ffffffffc0201504:	00850893          	addi	a7,a0,8
ffffffffc0201508:	4789                	li	a5,2
ffffffffc020150a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc020150e:	00032697          	auipc	a3,0x32
ffffffffc0201512:	c5268693          	addi	a3,a3,-942 # ffffffffc0233160 <free_area>
ffffffffc0201516:	4a98                	lw	a4,16(a3)
ffffffffc0201518:	669c                	ld	a5,8(a3)
ffffffffc020151a:	9f2d                	addw	a4,a4,a1
ffffffffc020151c:	ca98                	sw	a4,16(a3)
ffffffffc020151e:	0ad78163          	beq	a5,a3,ffffffffc02015c0 <default_free_pages+0xf4>
ffffffffc0201522:	fe878713          	addi	a4,a5,-24
ffffffffc0201526:	4581                	li	a1,0
ffffffffc0201528:	01850613          	addi	a2,a0,24
ffffffffc020152c:	00e56a63          	bltu	a0,a4,ffffffffc0201540 <default_free_pages+0x74>
ffffffffc0201530:	6798                	ld	a4,8(a5)
ffffffffc0201532:	04d70c63          	beq	a4,a3,ffffffffc020158a <default_free_pages+0xbe>
ffffffffc0201536:	87ba                	mv	a5,a4
ffffffffc0201538:	fe878713          	addi	a4,a5,-24
ffffffffc020153c:	fee57ae3          	bgeu	a0,a4,ffffffffc0201530 <default_free_pages+0x64>
ffffffffc0201540:	c199                	beqz	a1,ffffffffc0201546 <default_free_pages+0x7a>
ffffffffc0201542:	0106b023          	sd	a6,0(a3)
ffffffffc0201546:	6398                	ld	a4,0(a5)
ffffffffc0201548:	e390                	sd	a2,0(a5)
ffffffffc020154a:	e710                	sd	a2,8(a4)
ffffffffc020154c:	f11c                	sd	a5,32(a0)
ffffffffc020154e:	ed18                	sd	a4,24(a0)
ffffffffc0201550:	00d70d63          	beq	a4,a3,ffffffffc020156a <default_free_pages+0x9e>
ffffffffc0201554:	ff872583          	lw	a1,-8(a4)
ffffffffc0201558:	fe870613          	addi	a2,a4,-24
ffffffffc020155c:	02059813          	slli	a6,a1,0x20
ffffffffc0201560:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201564:	97b2                	add	a5,a5,a2
ffffffffc0201566:	02f50c63          	beq	a0,a5,ffffffffc020159e <default_free_pages+0xd2>
ffffffffc020156a:	711c                	ld	a5,32(a0)
ffffffffc020156c:	00d78c63          	beq	a5,a3,ffffffffc0201584 <default_free_pages+0xb8>
ffffffffc0201570:	4910                	lw	a2,16(a0)
ffffffffc0201572:	fe878693          	addi	a3,a5,-24
ffffffffc0201576:	02061593          	slli	a1,a2,0x20
ffffffffc020157a:	01a5d713          	srli	a4,a1,0x1a
ffffffffc020157e:	972a                	add	a4,a4,a0
ffffffffc0201580:	04e68c63          	beq	a3,a4,ffffffffc02015d8 <default_free_pages+0x10c>
ffffffffc0201584:	60a2                	ld	ra,8(sp)
ffffffffc0201586:	0141                	addi	sp,sp,16
ffffffffc0201588:	8082                	ret
ffffffffc020158a:	e790                	sd	a2,8(a5)
ffffffffc020158c:	f114                	sd	a3,32(a0)
ffffffffc020158e:	6798                	ld	a4,8(a5)
ffffffffc0201590:	ed1c                	sd	a5,24(a0)
ffffffffc0201592:	8832                	mv	a6,a2
ffffffffc0201594:	02d70f63          	beq	a4,a3,ffffffffc02015d2 <default_free_pages+0x106>
ffffffffc0201598:	4585                	li	a1,1
ffffffffc020159a:	87ba                	mv	a5,a4
ffffffffc020159c:	bf71                	j	ffffffffc0201538 <default_free_pages+0x6c>
ffffffffc020159e:	491c                	lw	a5,16(a0)
ffffffffc02015a0:	9fad                	addw	a5,a5,a1
ffffffffc02015a2:	fef72c23          	sw	a5,-8(a4)
ffffffffc02015a6:	57f5                	li	a5,-3
ffffffffc02015a8:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc02015ac:	01853803          	ld	a6,24(a0)
ffffffffc02015b0:	710c                	ld	a1,32(a0)
ffffffffc02015b2:	8532                	mv	a0,a2
ffffffffc02015b4:	00b83423          	sd	a1,8(a6)
ffffffffc02015b8:	671c                	ld	a5,8(a4)
ffffffffc02015ba:	0105b023          	sd	a6,0(a1)
ffffffffc02015be:	b77d                	j	ffffffffc020156c <default_free_pages+0xa0>
ffffffffc02015c0:	60a2                	ld	ra,8(sp)
ffffffffc02015c2:	01850713          	addi	a4,a0,24
ffffffffc02015c6:	e398                	sd	a4,0(a5)
ffffffffc02015c8:	e798                	sd	a4,8(a5)
ffffffffc02015ca:	f11c                	sd	a5,32(a0)
ffffffffc02015cc:	ed1c                	sd	a5,24(a0)
ffffffffc02015ce:	0141                	addi	sp,sp,16
ffffffffc02015d0:	8082                	ret
ffffffffc02015d2:	e290                	sd	a2,0(a3)
ffffffffc02015d4:	873e                	mv	a4,a5
ffffffffc02015d6:	bfad                	j	ffffffffc0201550 <default_free_pages+0x84>
ffffffffc02015d8:	ff87a703          	lw	a4,-8(a5)
ffffffffc02015dc:	ff078693          	addi	a3,a5,-16
ffffffffc02015e0:	9f31                	addw	a4,a4,a2
ffffffffc02015e2:	c918                	sw	a4,16(a0)
ffffffffc02015e4:	5775                	li	a4,-3
ffffffffc02015e6:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc02015ea:	6398                	ld	a4,0(a5)
ffffffffc02015ec:	679c                	ld	a5,8(a5)
ffffffffc02015ee:	60a2                	ld	ra,8(sp)
ffffffffc02015f0:	e71c                	sd	a5,8(a4)
ffffffffc02015f2:	e398                	sd	a4,0(a5)
ffffffffc02015f4:	0141                	addi	sp,sp,16
ffffffffc02015f6:	8082                	ret
ffffffffc02015f8:	00005697          	auipc	a3,0x5
ffffffffc02015fc:	7e868693          	addi	a3,a3,2024 # ffffffffc0206de0 <etext+0xc54>
ffffffffc0201600:	00005617          	auipc	a2,0x5
ffffffffc0201604:	20860613          	addi	a2,a2,520 # ffffffffc0206808 <etext+0x67c>
ffffffffc0201608:	08300593          	li	a1,131
ffffffffc020160c:	00005517          	auipc	a0,0x5
ffffffffc0201610:	48c50513          	addi	a0,a0,1164 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201614:	e61fe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0201618:	00005697          	auipc	a3,0x5
ffffffffc020161c:	7c068693          	addi	a3,a3,1984 # ffffffffc0206dd8 <etext+0xc4c>
ffffffffc0201620:	00005617          	auipc	a2,0x5
ffffffffc0201624:	1e860613          	addi	a2,a2,488 # ffffffffc0206808 <etext+0x67c>
ffffffffc0201628:	08000593          	li	a1,128
ffffffffc020162c:	00005517          	auipc	a0,0x5
ffffffffc0201630:	46c50513          	addi	a0,a0,1132 # ffffffffc0206a98 <etext+0x90c>
ffffffffc0201634:	e41fe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0201638 <default_alloc_pages>:
ffffffffc0201638:	c949                	beqz	a0,ffffffffc02016ca <default_alloc_pages+0x92>
ffffffffc020163a:	00032617          	auipc	a2,0x32
ffffffffc020163e:	b2660613          	addi	a2,a2,-1242 # ffffffffc0233160 <free_area>
ffffffffc0201642:	4a0c                	lw	a1,16(a2)
ffffffffc0201644:	872a                	mv	a4,a0
ffffffffc0201646:	02059793          	slli	a5,a1,0x20
ffffffffc020164a:	9381                	srli	a5,a5,0x20
ffffffffc020164c:	00a7eb63          	bltu	a5,a0,ffffffffc0201662 <default_alloc_pages+0x2a>
ffffffffc0201650:	87b2                	mv	a5,a2
ffffffffc0201652:	a029                	j	ffffffffc020165c <default_alloc_pages+0x24>
ffffffffc0201654:	ff87e683          	lwu	a3,-8(a5)
ffffffffc0201658:	00e6f763          	bgeu	a3,a4,ffffffffc0201666 <default_alloc_pages+0x2e>
ffffffffc020165c:	679c                	ld	a5,8(a5)
ffffffffc020165e:	fec79be3          	bne	a5,a2,ffffffffc0201654 <default_alloc_pages+0x1c>
ffffffffc0201662:	4501                	li	a0,0
ffffffffc0201664:	8082                	ret
ffffffffc0201666:	0087b883          	ld	a7,8(a5)
ffffffffc020166a:	ff87a803          	lw	a6,-8(a5)
ffffffffc020166e:	6394                	ld	a3,0(a5)
ffffffffc0201670:	fe878513          	addi	a0,a5,-24
ffffffffc0201674:	02081313          	slli	t1,a6,0x20
ffffffffc0201678:	0116b423          	sd	a7,8(a3)
ffffffffc020167c:	00d8b023          	sd	a3,0(a7)
ffffffffc0201680:	02035313          	srli	t1,t1,0x20
ffffffffc0201684:	0007089b          	sext.w	a7,a4
ffffffffc0201688:	02677963          	bgeu	a4,t1,ffffffffc02016ba <default_alloc_pages+0x82>
ffffffffc020168c:	071a                	slli	a4,a4,0x6
ffffffffc020168e:	972a                	add	a4,a4,a0
ffffffffc0201690:	4118083b          	subw	a6,a6,a7
ffffffffc0201694:	01072823          	sw	a6,16(a4)
ffffffffc0201698:	4589                	li	a1,2
ffffffffc020169a:	00870813          	addi	a6,a4,8
ffffffffc020169e:	40b8302f          	amoor.d	zero,a1,(a6)
ffffffffc02016a2:	0086b803          	ld	a6,8(a3)
ffffffffc02016a6:	01870313          	addi	t1,a4,24
ffffffffc02016aa:	4a0c                	lw	a1,16(a2)
ffffffffc02016ac:	00683023          	sd	t1,0(a6)
ffffffffc02016b0:	0066b423          	sd	t1,8(a3)
ffffffffc02016b4:	03073023          	sd	a6,32(a4)
ffffffffc02016b8:	ef14                	sd	a3,24(a4)
ffffffffc02016ba:	411585bb          	subw	a1,a1,a7
ffffffffc02016be:	ca0c                	sw	a1,16(a2)
ffffffffc02016c0:	5775                	li	a4,-3
ffffffffc02016c2:	17c1                	addi	a5,a5,-16
ffffffffc02016c4:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc02016c8:	8082                	ret
ffffffffc02016ca:	1141                	addi	sp,sp,-16
ffffffffc02016cc:	00005697          	auipc	a3,0x5
ffffffffc02016d0:	70c68693          	addi	a3,a3,1804 # ffffffffc0206dd8 <etext+0xc4c>
ffffffffc02016d4:	00005617          	auipc	a2,0x5
ffffffffc02016d8:	13460613          	addi	a2,a2,308 # ffffffffc0206808 <etext+0x67c>
ffffffffc02016dc:	06200593          	li	a1,98
ffffffffc02016e0:	00005517          	auipc	a0,0x5
ffffffffc02016e4:	3b850513          	addi	a0,a0,952 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02016e8:	e406                	sd	ra,8(sp)
ffffffffc02016ea:	d8bfe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc02016ee <default_init_memmap>:
ffffffffc02016ee:	1141                	addi	sp,sp,-16
ffffffffc02016f0:	e406                	sd	ra,8(sp)
ffffffffc02016f2:	c5f1                	beqz	a1,ffffffffc02017be <default_init_memmap+0xd0>
ffffffffc02016f4:	00659713          	slli	a4,a1,0x6
ffffffffc02016f8:	00e506b3          	add	a3,a0,a4
ffffffffc02016fc:	87aa                	mv	a5,a0
ffffffffc02016fe:	cf11                	beqz	a4,ffffffffc020171a <default_init_memmap+0x2c>
ffffffffc0201700:	6798                	ld	a4,8(a5)
ffffffffc0201702:	8b05                	andi	a4,a4,1
ffffffffc0201704:	cf49                	beqz	a4,ffffffffc020179e <default_init_memmap+0xb0>
ffffffffc0201706:	0007a823          	sw	zero,16(a5)
ffffffffc020170a:	0007b423          	sd	zero,8(a5)
ffffffffc020170e:	0007a023          	sw	zero,0(a5)
ffffffffc0201712:	04078793          	addi	a5,a5,64
ffffffffc0201716:	fed795e3          	bne	a5,a3,ffffffffc0201700 <default_init_memmap+0x12>
ffffffffc020171a:	2581                	sext.w	a1,a1
ffffffffc020171c:	c90c                	sw	a1,16(a0)
ffffffffc020171e:	4789                	li	a5,2
ffffffffc0201720:	00850713          	addi	a4,a0,8
ffffffffc0201724:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201728:	00032697          	auipc	a3,0x32
ffffffffc020172c:	a3868693          	addi	a3,a3,-1480 # ffffffffc0233160 <free_area>
ffffffffc0201730:	4a98                	lw	a4,16(a3)
ffffffffc0201732:	669c                	ld	a5,8(a3)
ffffffffc0201734:	9f2d                	addw	a4,a4,a1
ffffffffc0201736:	ca98                	sw	a4,16(a3)
ffffffffc0201738:	04d78663          	beq	a5,a3,ffffffffc0201784 <default_init_memmap+0x96>
ffffffffc020173c:	fe878713          	addi	a4,a5,-24
ffffffffc0201740:	4581                	li	a1,0
ffffffffc0201742:	01850613          	addi	a2,a0,24
ffffffffc0201746:	00e56a63          	bltu	a0,a4,ffffffffc020175a <default_init_memmap+0x6c>
ffffffffc020174a:	6798                	ld	a4,8(a5)
ffffffffc020174c:	02d70263          	beq	a4,a3,ffffffffc0201770 <default_init_memmap+0x82>
ffffffffc0201750:	87ba                	mv	a5,a4
ffffffffc0201752:	fe878713          	addi	a4,a5,-24
ffffffffc0201756:	fee57ae3          	bgeu	a0,a4,ffffffffc020174a <default_init_memmap+0x5c>
ffffffffc020175a:	c199                	beqz	a1,ffffffffc0201760 <default_init_memmap+0x72>
ffffffffc020175c:	0106b023          	sd	a6,0(a3)
ffffffffc0201760:	6398                	ld	a4,0(a5)
ffffffffc0201762:	60a2                	ld	ra,8(sp)
ffffffffc0201764:	e390                	sd	a2,0(a5)
ffffffffc0201766:	e710                	sd	a2,8(a4)
ffffffffc0201768:	f11c                	sd	a5,32(a0)
ffffffffc020176a:	ed18                	sd	a4,24(a0)
ffffffffc020176c:	0141                	addi	sp,sp,16
ffffffffc020176e:	8082                	ret
ffffffffc0201770:	e790                	sd	a2,8(a5)
ffffffffc0201772:	f114                	sd	a3,32(a0)
ffffffffc0201774:	6798                	ld	a4,8(a5)
ffffffffc0201776:	ed1c                	sd	a5,24(a0)
ffffffffc0201778:	8832                	mv	a6,a2
ffffffffc020177a:	00d70e63          	beq	a4,a3,ffffffffc0201796 <default_init_memmap+0xa8>
ffffffffc020177e:	4585                	li	a1,1
ffffffffc0201780:	87ba                	mv	a5,a4
ffffffffc0201782:	bfc1                	j	ffffffffc0201752 <default_init_memmap+0x64>
ffffffffc0201784:	60a2                	ld	ra,8(sp)
ffffffffc0201786:	01850713          	addi	a4,a0,24
ffffffffc020178a:	e398                	sd	a4,0(a5)
ffffffffc020178c:	e798                	sd	a4,8(a5)
ffffffffc020178e:	f11c                	sd	a5,32(a0)
ffffffffc0201790:	ed1c                	sd	a5,24(a0)
ffffffffc0201792:	0141                	addi	sp,sp,16
ffffffffc0201794:	8082                	ret
ffffffffc0201796:	60a2                	ld	ra,8(sp)
ffffffffc0201798:	e290                	sd	a2,0(a3)
ffffffffc020179a:	0141                	addi	sp,sp,16
ffffffffc020179c:	8082                	ret
ffffffffc020179e:	00005697          	auipc	a3,0x5
ffffffffc02017a2:	66a68693          	addi	a3,a3,1642 # ffffffffc0206e08 <etext+0xc7c>
ffffffffc02017a6:	00005617          	auipc	a2,0x5
ffffffffc02017aa:	06260613          	addi	a2,a2,98 # ffffffffc0206808 <etext+0x67c>
ffffffffc02017ae:	04900593          	li	a1,73
ffffffffc02017b2:	00005517          	auipc	a0,0x5
ffffffffc02017b6:	2e650513          	addi	a0,a0,742 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02017ba:	cbbfe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02017be:	00005697          	auipc	a3,0x5
ffffffffc02017c2:	61a68693          	addi	a3,a3,1562 # ffffffffc0206dd8 <etext+0xc4c>
ffffffffc02017c6:	00005617          	auipc	a2,0x5
ffffffffc02017ca:	04260613          	addi	a2,a2,66 # ffffffffc0206808 <etext+0x67c>
ffffffffc02017ce:	04600593          	li	a1,70
ffffffffc02017d2:	00005517          	auipc	a0,0x5
ffffffffc02017d6:	2c650513          	addi	a0,a0,710 # ffffffffc0206a98 <etext+0x90c>
ffffffffc02017da:	c9bfe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc02017de <slob_free>:
ffffffffc02017de:	cd49                	beqz	a0,ffffffffc0201878 <slob_free+0x9a>
ffffffffc02017e0:	1141                	addi	sp,sp,-16
ffffffffc02017e2:	e022                	sd	s0,0(sp)
ffffffffc02017e4:	e406                	sd	ra,8(sp)
ffffffffc02017e6:	842a                	mv	s0,a0
ffffffffc02017e8:	eda1                	bnez	a1,ffffffffc0201840 <slob_free+0x62>
ffffffffc02017ea:	100027f3          	csrr	a5,sstatus
ffffffffc02017ee:	8b89                	andi	a5,a5,2
ffffffffc02017f0:	4501                	li	a0,0
ffffffffc02017f2:	efb9                	bnez	a5,ffffffffc0201850 <slob_free+0x72>
ffffffffc02017f4:	0002a617          	auipc	a2,0x2a
ffffffffc02017f8:	55c60613          	addi	a2,a2,1372 # ffffffffc022bd50 <slobfree>
ffffffffc02017fc:	621c                	ld	a5,0(a2)
ffffffffc02017fe:	6798                	ld	a4,8(a5)
ffffffffc0201800:	0287fa63          	bgeu	a5,s0,ffffffffc0201834 <slob_free+0x56>
ffffffffc0201804:	00e46463          	bltu	s0,a4,ffffffffc020180c <slob_free+0x2e>
ffffffffc0201808:	02e7ea63          	bltu	a5,a4,ffffffffc020183c <slob_free+0x5e>
ffffffffc020180c:	400c                	lw	a1,0(s0)
ffffffffc020180e:	00459693          	slli	a3,a1,0x4
ffffffffc0201812:	96a2                	add	a3,a3,s0
ffffffffc0201814:	04d70d63          	beq	a4,a3,ffffffffc020186e <slob_free+0x90>
ffffffffc0201818:	438c                	lw	a1,0(a5)
ffffffffc020181a:	e418                	sd	a4,8(s0)
ffffffffc020181c:	00459693          	slli	a3,a1,0x4
ffffffffc0201820:	96be                	add	a3,a3,a5
ffffffffc0201822:	04d40063          	beq	s0,a3,ffffffffc0201862 <slob_free+0x84>
ffffffffc0201826:	e780                	sd	s0,8(a5)
ffffffffc0201828:	e21c                	sd	a5,0(a2)
ffffffffc020182a:	e51d                	bnez	a0,ffffffffc0201858 <slob_free+0x7a>
ffffffffc020182c:	60a2                	ld	ra,8(sp)
ffffffffc020182e:	6402                	ld	s0,0(sp)
ffffffffc0201830:	0141                	addi	sp,sp,16
ffffffffc0201832:	8082                	ret
ffffffffc0201834:	00e7e463          	bltu	a5,a4,ffffffffc020183c <slob_free+0x5e>
ffffffffc0201838:	fce46ae3          	bltu	s0,a4,ffffffffc020180c <slob_free+0x2e>
ffffffffc020183c:	87ba                	mv	a5,a4
ffffffffc020183e:	b7c1                	j	ffffffffc02017fe <slob_free+0x20>
ffffffffc0201840:	25bd                	addiw	a1,a1,15
ffffffffc0201842:	8191                	srli	a1,a1,0x4
ffffffffc0201844:	c10c                	sw	a1,0(a0)
ffffffffc0201846:	100027f3          	csrr	a5,sstatus
ffffffffc020184a:	8b89                	andi	a5,a5,2
ffffffffc020184c:	4501                	li	a0,0
ffffffffc020184e:	d3dd                	beqz	a5,ffffffffc02017f4 <slob_free+0x16>
ffffffffc0201850:	df1fe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0201854:	4505                	li	a0,1
ffffffffc0201856:	bf79                	j	ffffffffc02017f4 <slob_free+0x16>
ffffffffc0201858:	6402                	ld	s0,0(sp)
ffffffffc020185a:	60a2                	ld	ra,8(sp)
ffffffffc020185c:	0141                	addi	sp,sp,16
ffffffffc020185e:	dddfe06f          	j	ffffffffc020063a <intr_enable>
ffffffffc0201862:	4014                	lw	a3,0(s0)
ffffffffc0201864:	843a                	mv	s0,a4
ffffffffc0201866:	00b6873b          	addw	a4,a3,a1
ffffffffc020186a:	c398                	sw	a4,0(a5)
ffffffffc020186c:	bf6d                	j	ffffffffc0201826 <slob_free+0x48>
ffffffffc020186e:	4314                	lw	a3,0(a4)
ffffffffc0201870:	6718                	ld	a4,8(a4)
ffffffffc0201872:	9ead                	addw	a3,a3,a1
ffffffffc0201874:	c014                	sw	a3,0(s0)
ffffffffc0201876:	b74d                	j	ffffffffc0201818 <slob_free+0x3a>
ffffffffc0201878:	8082                	ret

ffffffffc020187a <__slob_get_free_pages.constprop.0>:
ffffffffc020187a:	4785                	li	a5,1
ffffffffc020187c:	1141                	addi	sp,sp,-16
ffffffffc020187e:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201882:	e406                	sd	ra,8(sp)
ffffffffc0201884:	34c000ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0201888:	c91d                	beqz	a0,ffffffffc02018be <__slob_get_free_pages.constprop.0+0x44>
ffffffffc020188a:	00036797          	auipc	a5,0x36
ffffffffc020188e:	9e67b783          	ld	a5,-1562(a5) # ffffffffc0237270 <pages>
ffffffffc0201892:	8d1d                	sub	a0,a0,a5
ffffffffc0201894:	8519                	srai	a0,a0,0x6
ffffffffc0201896:	00007797          	auipc	a5,0x7
ffffffffc020189a:	fda7b783          	ld	a5,-38(a5) # ffffffffc0208870 <nbase>
ffffffffc020189e:	953e                	add	a0,a0,a5
ffffffffc02018a0:	00c51793          	slli	a5,a0,0xc
ffffffffc02018a4:	83b1                	srli	a5,a5,0xc
ffffffffc02018a6:	00036717          	auipc	a4,0x36
ffffffffc02018aa:	9c273703          	ld	a4,-1598(a4) # ffffffffc0237268 <npage>
ffffffffc02018ae:	0532                	slli	a0,a0,0xc
ffffffffc02018b0:	00e7fa63          	bgeu	a5,a4,ffffffffc02018c4 <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc02018b4:	00036797          	auipc	a5,0x36
ffffffffc02018b8:	9ac7b783          	ld	a5,-1620(a5) # ffffffffc0237260 <va_pa_offset>
ffffffffc02018bc:	953e                	add	a0,a0,a5
ffffffffc02018be:	60a2                	ld	ra,8(sp)
ffffffffc02018c0:	0141                	addi	sp,sp,16
ffffffffc02018c2:	8082                	ret
ffffffffc02018c4:	86aa                	mv	a3,a0
ffffffffc02018c6:	00005617          	auipc	a2,0x5
ffffffffc02018ca:	56a60613          	addi	a2,a2,1386 # ffffffffc0206e30 <etext+0xca4>
ffffffffc02018ce:	06900593          	li	a1,105
ffffffffc02018d2:	00005517          	auipc	a0,0x5
ffffffffc02018d6:	58650513          	addi	a0,a0,1414 # ffffffffc0206e58 <etext+0xccc>
ffffffffc02018da:	b9bfe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc02018de <slob_alloc.constprop.0>:
ffffffffc02018de:	1101                	addi	sp,sp,-32
ffffffffc02018e0:	ec06                	sd	ra,24(sp)
ffffffffc02018e2:	e822                	sd	s0,16(sp)
ffffffffc02018e4:	e426                	sd	s1,8(sp)
ffffffffc02018e6:	e04a                	sd	s2,0(sp)
ffffffffc02018e8:	01050713          	addi	a4,a0,16
ffffffffc02018ec:	6785                	lui	a5,0x1
ffffffffc02018ee:	0cf77363          	bgeu	a4,a5,ffffffffc02019b4 <slob_alloc.constprop.0+0xd6>
ffffffffc02018f2:	00f50493          	addi	s1,a0,15
ffffffffc02018f6:	8091                	srli	s1,s1,0x4
ffffffffc02018f8:	2481                	sext.w	s1,s1
ffffffffc02018fa:	10002673          	csrr	a2,sstatus
ffffffffc02018fe:	8a09                	andi	a2,a2,2
ffffffffc0201900:	e25d                	bnez	a2,ffffffffc02019a6 <slob_alloc.constprop.0+0xc8>
ffffffffc0201902:	0002a917          	auipc	s2,0x2a
ffffffffc0201906:	44e90913          	addi	s2,s2,1102 # ffffffffc022bd50 <slobfree>
ffffffffc020190a:	00093683          	ld	a3,0(s2)
ffffffffc020190e:	669c                	ld	a5,8(a3)
ffffffffc0201910:	4398                	lw	a4,0(a5)
ffffffffc0201912:	08975e63          	bge	a4,s1,ffffffffc02019ae <slob_alloc.constprop.0+0xd0>
ffffffffc0201916:	00f68b63          	beq	a3,a5,ffffffffc020192c <slob_alloc.constprop.0+0x4e>
ffffffffc020191a:	6780                	ld	s0,8(a5)
ffffffffc020191c:	4018                	lw	a4,0(s0)
ffffffffc020191e:	02975a63          	bge	a4,s1,ffffffffc0201952 <slob_alloc.constprop.0+0x74>
ffffffffc0201922:	00093683          	ld	a3,0(s2)
ffffffffc0201926:	87a2                	mv	a5,s0
ffffffffc0201928:	fef699e3          	bne	a3,a5,ffffffffc020191a <slob_alloc.constprop.0+0x3c>
ffffffffc020192c:	ee31                	bnez	a2,ffffffffc0201988 <slob_alloc.constprop.0+0xaa>
ffffffffc020192e:	4501                	li	a0,0
ffffffffc0201930:	f4bff0ef          	jal	ffffffffc020187a <__slob_get_free_pages.constprop.0>
ffffffffc0201934:	842a                	mv	s0,a0
ffffffffc0201936:	cd05                	beqz	a0,ffffffffc020196e <slob_alloc.constprop.0+0x90>
ffffffffc0201938:	6585                	lui	a1,0x1
ffffffffc020193a:	ea5ff0ef          	jal	ffffffffc02017de <slob_free>
ffffffffc020193e:	10002673          	csrr	a2,sstatus
ffffffffc0201942:	8a09                	andi	a2,a2,2
ffffffffc0201944:	ee05                	bnez	a2,ffffffffc020197c <slob_alloc.constprop.0+0x9e>
ffffffffc0201946:	00093783          	ld	a5,0(s2)
ffffffffc020194a:	6780                	ld	s0,8(a5)
ffffffffc020194c:	4018                	lw	a4,0(s0)
ffffffffc020194e:	fc974ae3          	blt	a4,s1,ffffffffc0201922 <slob_alloc.constprop.0+0x44>
ffffffffc0201952:	04e48763          	beq	s1,a4,ffffffffc02019a0 <slob_alloc.constprop.0+0xc2>
ffffffffc0201956:	00449693          	slli	a3,s1,0x4
ffffffffc020195a:	96a2                	add	a3,a3,s0
ffffffffc020195c:	e794                	sd	a3,8(a5)
ffffffffc020195e:	640c                	ld	a1,8(s0)
ffffffffc0201960:	9f05                	subw	a4,a4,s1
ffffffffc0201962:	c298                	sw	a4,0(a3)
ffffffffc0201964:	e68c                	sd	a1,8(a3)
ffffffffc0201966:	c004                	sw	s1,0(s0)
ffffffffc0201968:	00f93023          	sd	a5,0(s2)
ffffffffc020196c:	e20d                	bnez	a2,ffffffffc020198e <slob_alloc.constprop.0+0xb0>
ffffffffc020196e:	60e2                	ld	ra,24(sp)
ffffffffc0201970:	8522                	mv	a0,s0
ffffffffc0201972:	6442                	ld	s0,16(sp)
ffffffffc0201974:	64a2                	ld	s1,8(sp)
ffffffffc0201976:	6902                	ld	s2,0(sp)
ffffffffc0201978:	6105                	addi	sp,sp,32
ffffffffc020197a:	8082                	ret
ffffffffc020197c:	cc5fe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0201980:	00093783          	ld	a5,0(s2)
ffffffffc0201984:	4605                	li	a2,1
ffffffffc0201986:	b7d1                	j	ffffffffc020194a <slob_alloc.constprop.0+0x6c>
ffffffffc0201988:	cb3fe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc020198c:	b74d                	j	ffffffffc020192e <slob_alloc.constprop.0+0x50>
ffffffffc020198e:	cadfe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0201992:	60e2                	ld	ra,24(sp)
ffffffffc0201994:	8522                	mv	a0,s0
ffffffffc0201996:	6442                	ld	s0,16(sp)
ffffffffc0201998:	64a2                	ld	s1,8(sp)
ffffffffc020199a:	6902                	ld	s2,0(sp)
ffffffffc020199c:	6105                	addi	sp,sp,32
ffffffffc020199e:	8082                	ret
ffffffffc02019a0:	6418                	ld	a4,8(s0)
ffffffffc02019a2:	e798                	sd	a4,8(a5)
ffffffffc02019a4:	b7d1                	j	ffffffffc0201968 <slob_alloc.constprop.0+0x8a>
ffffffffc02019a6:	c9bfe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02019aa:	4605                	li	a2,1
ffffffffc02019ac:	bf99                	j	ffffffffc0201902 <slob_alloc.constprop.0+0x24>
ffffffffc02019ae:	843e                	mv	s0,a5
ffffffffc02019b0:	87b6                	mv	a5,a3
ffffffffc02019b2:	b745                	j	ffffffffc0201952 <slob_alloc.constprop.0+0x74>
ffffffffc02019b4:	00005697          	auipc	a3,0x5
ffffffffc02019b8:	4b468693          	addi	a3,a3,1204 # ffffffffc0206e68 <etext+0xcdc>
ffffffffc02019bc:	00005617          	auipc	a2,0x5
ffffffffc02019c0:	e4c60613          	addi	a2,a2,-436 # ffffffffc0206808 <etext+0x67c>
ffffffffc02019c4:	06400593          	li	a1,100
ffffffffc02019c8:	00005517          	auipc	a0,0x5
ffffffffc02019cc:	4c050513          	addi	a0,a0,1216 # ffffffffc0206e88 <etext+0xcfc>
ffffffffc02019d0:	aa5fe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc02019d4 <kmalloc_init>:
ffffffffc02019d4:	1141                	addi	sp,sp,-16
ffffffffc02019d6:	00005517          	auipc	a0,0x5
ffffffffc02019da:	4ca50513          	addi	a0,a0,1226 # ffffffffc0206ea0 <etext+0xd14>
ffffffffc02019de:	e406                	sd	ra,8(sp)
ffffffffc02019e0:	fa0fe0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02019e4:	60a2                	ld	ra,8(sp)
ffffffffc02019e6:	00005517          	auipc	a0,0x5
ffffffffc02019ea:	4d250513          	addi	a0,a0,1234 # ffffffffc0206eb8 <etext+0xd2c>
ffffffffc02019ee:	0141                	addi	sp,sp,16
ffffffffc02019f0:	f90fe06f          	j	ffffffffc0200180 <cprintf>

ffffffffc02019f4 <kallocated>:
ffffffffc02019f4:	4501                	li	a0,0
ffffffffc02019f6:	8082                	ret

ffffffffc02019f8 <kmalloc>:
ffffffffc02019f8:	1101                	addi	sp,sp,-32
ffffffffc02019fa:	6785                	lui	a5,0x1
ffffffffc02019fc:	e822                	sd	s0,16(sp)
ffffffffc02019fe:	ec06                	sd	ra,24(sp)
ffffffffc0201a00:	17bd                	addi	a5,a5,-17 # fef <_binary_obj___user_faultread_out_size-0xf01>
ffffffffc0201a02:	842a                	mv	s0,a0
ffffffffc0201a04:	04a7fa63          	bgeu	a5,a0,ffffffffc0201a58 <kmalloc+0x60>
ffffffffc0201a08:	4561                	li	a0,24
ffffffffc0201a0a:	e426                	sd	s1,8(sp)
ffffffffc0201a0c:	ed3ff0ef          	jal	ffffffffc02018de <slob_alloc.constprop.0>
ffffffffc0201a10:	84aa                	mv	s1,a0
ffffffffc0201a12:	c549                	beqz	a0,ffffffffc0201a9c <kmalloc+0xa4>
ffffffffc0201a14:	e04a                	sd	s2,0(sp)
ffffffffc0201a16:	0004079b          	sext.w	a5,s0
ffffffffc0201a1a:	6905                	lui	s2,0x1
ffffffffc0201a1c:	4501                	li	a0,0
ffffffffc0201a1e:	00f95763          	bge	s2,a5,ffffffffc0201a2c <kmalloc+0x34>
ffffffffc0201a22:	6705                	lui	a4,0x1
ffffffffc0201a24:	8785                	srai	a5,a5,0x1
ffffffffc0201a26:	2505                	addiw	a0,a0,1
ffffffffc0201a28:	fef74ee3          	blt	a4,a5,ffffffffc0201a24 <kmalloc+0x2c>
ffffffffc0201a2c:	c088                	sw	a0,0(s1)
ffffffffc0201a2e:	e4dff0ef          	jal	ffffffffc020187a <__slob_get_free_pages.constprop.0>
ffffffffc0201a32:	e488                	sd	a0,8(s1)
ffffffffc0201a34:	cd21                	beqz	a0,ffffffffc0201a8c <kmalloc+0x94>
ffffffffc0201a36:	100027f3          	csrr	a5,sstatus
ffffffffc0201a3a:	8b89                	andi	a5,a5,2
ffffffffc0201a3c:	e795                	bnez	a5,ffffffffc0201a68 <kmalloc+0x70>
ffffffffc0201a3e:	00036797          	auipc	a5,0x36
ffffffffc0201a42:	80278793          	addi	a5,a5,-2046 # ffffffffc0237240 <bigblocks>
ffffffffc0201a46:	6398                	ld	a4,0(a5)
ffffffffc0201a48:	6902                	ld	s2,0(sp)
ffffffffc0201a4a:	e384                	sd	s1,0(a5)
ffffffffc0201a4c:	e898                	sd	a4,16(s1)
ffffffffc0201a4e:	64a2                	ld	s1,8(sp)
ffffffffc0201a50:	60e2                	ld	ra,24(sp)
ffffffffc0201a52:	6442                	ld	s0,16(sp)
ffffffffc0201a54:	6105                	addi	sp,sp,32
ffffffffc0201a56:	8082                	ret
ffffffffc0201a58:	0541                	addi	a0,a0,16
ffffffffc0201a5a:	e85ff0ef          	jal	ffffffffc02018de <slob_alloc.constprop.0>
ffffffffc0201a5e:	87aa                	mv	a5,a0
ffffffffc0201a60:	0541                	addi	a0,a0,16
ffffffffc0201a62:	f7fd                	bnez	a5,ffffffffc0201a50 <kmalloc+0x58>
ffffffffc0201a64:	4501                	li	a0,0
ffffffffc0201a66:	b7ed                	j	ffffffffc0201a50 <kmalloc+0x58>
ffffffffc0201a68:	bd9fe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0201a6c:	00035797          	auipc	a5,0x35
ffffffffc0201a70:	7d478793          	addi	a5,a5,2004 # ffffffffc0237240 <bigblocks>
ffffffffc0201a74:	6398                	ld	a4,0(a5)
ffffffffc0201a76:	e384                	sd	s1,0(a5)
ffffffffc0201a78:	e898                	sd	a4,16(s1)
ffffffffc0201a7a:	bc1fe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0201a7e:	60e2                	ld	ra,24(sp)
ffffffffc0201a80:	6442                	ld	s0,16(sp)
ffffffffc0201a82:	6488                	ld	a0,8(s1)
ffffffffc0201a84:	6902                	ld	s2,0(sp)
ffffffffc0201a86:	64a2                	ld	s1,8(sp)
ffffffffc0201a88:	6105                	addi	sp,sp,32
ffffffffc0201a8a:	8082                	ret
ffffffffc0201a8c:	8526                	mv	a0,s1
ffffffffc0201a8e:	45e1                	li	a1,24
ffffffffc0201a90:	d4fff0ef          	jal	ffffffffc02017de <slob_free>
ffffffffc0201a94:	4501                	li	a0,0
ffffffffc0201a96:	64a2                	ld	s1,8(sp)
ffffffffc0201a98:	6902                	ld	s2,0(sp)
ffffffffc0201a9a:	bf5d                	j	ffffffffc0201a50 <kmalloc+0x58>
ffffffffc0201a9c:	64a2                	ld	s1,8(sp)
ffffffffc0201a9e:	4501                	li	a0,0
ffffffffc0201aa0:	bf45                	j	ffffffffc0201a50 <kmalloc+0x58>

ffffffffc0201aa2 <kfree>:
ffffffffc0201aa2:	c169                	beqz	a0,ffffffffc0201b64 <kfree+0xc2>
ffffffffc0201aa4:	1101                	addi	sp,sp,-32
ffffffffc0201aa6:	e822                	sd	s0,16(sp)
ffffffffc0201aa8:	ec06                	sd	ra,24(sp)
ffffffffc0201aaa:	03451793          	slli	a5,a0,0x34
ffffffffc0201aae:	842a                	mv	s0,a0
ffffffffc0201ab0:	e7c9                	bnez	a5,ffffffffc0201b3a <kfree+0x98>
ffffffffc0201ab2:	100027f3          	csrr	a5,sstatus
ffffffffc0201ab6:	8b89                	andi	a5,a5,2
ffffffffc0201ab8:	ebc1                	bnez	a5,ffffffffc0201b48 <kfree+0xa6>
ffffffffc0201aba:	00035797          	auipc	a5,0x35
ffffffffc0201abe:	7867b783          	ld	a5,1926(a5) # ffffffffc0237240 <bigblocks>
ffffffffc0201ac2:	4601                	li	a2,0
ffffffffc0201ac4:	cbbd                	beqz	a5,ffffffffc0201b3a <kfree+0x98>
ffffffffc0201ac6:	e426                	sd	s1,8(sp)
ffffffffc0201ac8:	00035697          	auipc	a3,0x35
ffffffffc0201acc:	77868693          	addi	a3,a3,1912 # ffffffffc0237240 <bigblocks>
ffffffffc0201ad0:	a021                	j	ffffffffc0201ad8 <kfree+0x36>
ffffffffc0201ad2:	01048693          	addi	a3,s1,16
ffffffffc0201ad6:	c3a5                	beqz	a5,ffffffffc0201b36 <kfree+0x94>
ffffffffc0201ad8:	6798                	ld	a4,8(a5)
ffffffffc0201ada:	84be                	mv	s1,a5
ffffffffc0201adc:	6b9c                	ld	a5,16(a5)
ffffffffc0201ade:	fe871ae3          	bne	a4,s0,ffffffffc0201ad2 <kfree+0x30>
ffffffffc0201ae2:	e29c                	sd	a5,0(a3)
ffffffffc0201ae4:	ee2d                	bnez	a2,ffffffffc0201b5e <kfree+0xbc>
ffffffffc0201ae6:	c02007b7          	lui	a5,0xc0200
ffffffffc0201aea:	4098                	lw	a4,0(s1)
ffffffffc0201aec:	08f46963          	bltu	s0,a5,ffffffffc0201b7e <kfree+0xdc>
ffffffffc0201af0:	00035797          	auipc	a5,0x35
ffffffffc0201af4:	7707b783          	ld	a5,1904(a5) # ffffffffc0237260 <va_pa_offset>
ffffffffc0201af8:	8c1d                	sub	s0,s0,a5
ffffffffc0201afa:	8031                	srli	s0,s0,0xc
ffffffffc0201afc:	00035797          	auipc	a5,0x35
ffffffffc0201b00:	76c7b783          	ld	a5,1900(a5) # ffffffffc0237268 <npage>
ffffffffc0201b04:	06f47163          	bgeu	s0,a5,ffffffffc0201b66 <kfree+0xc4>
ffffffffc0201b08:	00007797          	auipc	a5,0x7
ffffffffc0201b0c:	d687b783          	ld	a5,-664(a5) # ffffffffc0208870 <nbase>
ffffffffc0201b10:	8c1d                	sub	s0,s0,a5
ffffffffc0201b12:	041a                	slli	s0,s0,0x6
ffffffffc0201b14:	00035517          	auipc	a0,0x35
ffffffffc0201b18:	75c53503          	ld	a0,1884(a0) # ffffffffc0237270 <pages>
ffffffffc0201b1c:	4585                	li	a1,1
ffffffffc0201b1e:	9522                	add	a0,a0,s0
ffffffffc0201b20:	00e595bb          	sllw	a1,a1,a4
ffffffffc0201b24:	13c000ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0201b28:	6442                	ld	s0,16(sp)
ffffffffc0201b2a:	60e2                	ld	ra,24(sp)
ffffffffc0201b2c:	8526                	mv	a0,s1
ffffffffc0201b2e:	64a2                	ld	s1,8(sp)
ffffffffc0201b30:	45e1                	li	a1,24
ffffffffc0201b32:	6105                	addi	sp,sp,32
ffffffffc0201b34:	b16d                	j	ffffffffc02017de <slob_free>
ffffffffc0201b36:	64a2                	ld	s1,8(sp)
ffffffffc0201b38:	e205                	bnez	a2,ffffffffc0201b58 <kfree+0xb6>
ffffffffc0201b3a:	ff040513          	addi	a0,s0,-16
ffffffffc0201b3e:	6442                	ld	s0,16(sp)
ffffffffc0201b40:	60e2                	ld	ra,24(sp)
ffffffffc0201b42:	4581                	li	a1,0
ffffffffc0201b44:	6105                	addi	sp,sp,32
ffffffffc0201b46:	b961                	j	ffffffffc02017de <slob_free>
ffffffffc0201b48:	af9fe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0201b4c:	00035797          	auipc	a5,0x35
ffffffffc0201b50:	6f47b783          	ld	a5,1780(a5) # ffffffffc0237240 <bigblocks>
ffffffffc0201b54:	4605                	li	a2,1
ffffffffc0201b56:	fba5                	bnez	a5,ffffffffc0201ac6 <kfree+0x24>
ffffffffc0201b58:	ae3fe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0201b5c:	bff9                	j	ffffffffc0201b3a <kfree+0x98>
ffffffffc0201b5e:	addfe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0201b62:	b751                	j	ffffffffc0201ae6 <kfree+0x44>
ffffffffc0201b64:	8082                	ret
ffffffffc0201b66:	00005617          	auipc	a2,0x5
ffffffffc0201b6a:	39a60613          	addi	a2,a2,922 # ffffffffc0206f00 <etext+0xd74>
ffffffffc0201b6e:	06200593          	li	a1,98
ffffffffc0201b72:	00005517          	auipc	a0,0x5
ffffffffc0201b76:	2e650513          	addi	a0,a0,742 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0201b7a:	8fbfe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0201b7e:	86a2                	mv	a3,s0
ffffffffc0201b80:	00005617          	auipc	a2,0x5
ffffffffc0201b84:	35860613          	addi	a2,a2,856 # ffffffffc0206ed8 <etext+0xd4c>
ffffffffc0201b88:	06e00593          	li	a1,110
ffffffffc0201b8c:	00005517          	auipc	a0,0x5
ffffffffc0201b90:	2cc50513          	addi	a0,a0,716 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0201b94:	8e1fe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0201b98 <pa2page.part.0>:
ffffffffc0201b98:	1141                	addi	sp,sp,-16
ffffffffc0201b9a:	00005617          	auipc	a2,0x5
ffffffffc0201b9e:	36660613          	addi	a2,a2,870 # ffffffffc0206f00 <etext+0xd74>
ffffffffc0201ba2:	06200593          	li	a1,98
ffffffffc0201ba6:	00005517          	auipc	a0,0x5
ffffffffc0201baa:	2b250513          	addi	a0,a0,690 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0201bae:	e406                	sd	ra,8(sp)
ffffffffc0201bb0:	8c5fe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0201bb4 <pte2page.part.0>:
ffffffffc0201bb4:	1141                	addi	sp,sp,-16
ffffffffc0201bb6:	00005617          	auipc	a2,0x5
ffffffffc0201bba:	36a60613          	addi	a2,a2,874 # ffffffffc0206f20 <etext+0xd94>
ffffffffc0201bbe:	07400593          	li	a1,116
ffffffffc0201bc2:	00005517          	auipc	a0,0x5
ffffffffc0201bc6:	29650513          	addi	a0,a0,662 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0201bca:	e406                	sd	ra,8(sp)
ffffffffc0201bcc:	8a9fe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0201bd0 <alloc_pages>:
ffffffffc0201bd0:	7139                	addi	sp,sp,-64
ffffffffc0201bd2:	f426                	sd	s1,40(sp)
ffffffffc0201bd4:	f04a                	sd	s2,32(sp)
ffffffffc0201bd6:	ec4e                	sd	s3,24(sp)
ffffffffc0201bd8:	e852                	sd	s4,16(sp)
ffffffffc0201bda:	e456                	sd	s5,8(sp)
ffffffffc0201bdc:	e05a                	sd	s6,0(sp)
ffffffffc0201bde:	fc06                	sd	ra,56(sp)
ffffffffc0201be0:	f822                	sd	s0,48(sp)
ffffffffc0201be2:	84aa                	mv	s1,a0
ffffffffc0201be4:	00035917          	auipc	s2,0x35
ffffffffc0201be8:	66490913          	addi	s2,s2,1636 # ffffffffc0237248 <pmm_manager>
ffffffffc0201bec:	4a05                	li	s4,1
ffffffffc0201bee:	00035a97          	auipc	s5,0x35
ffffffffc0201bf2:	68aa8a93          	addi	s5,s5,1674 # ffffffffc0237278 <swap_init_ok>
ffffffffc0201bf6:	0005099b          	sext.w	s3,a0
ffffffffc0201bfa:	00035b17          	auipc	s6,0x35
ffffffffc0201bfe:	69eb0b13          	addi	s6,s6,1694 # ffffffffc0237298 <check_mm_struct>
ffffffffc0201c02:	a015                	j	ffffffffc0201c26 <alloc_pages+0x56>
ffffffffc0201c04:	00093783          	ld	a5,0(s2)
ffffffffc0201c08:	6f9c                	ld	a5,24(a5)
ffffffffc0201c0a:	9782                	jalr	a5
ffffffffc0201c0c:	842a                	mv	s0,a0
ffffffffc0201c0e:	4601                	li	a2,0
ffffffffc0201c10:	85ce                	mv	a1,s3
ffffffffc0201c12:	ec05                	bnez	s0,ffffffffc0201c4a <alloc_pages+0x7a>
ffffffffc0201c14:	029a6b63          	bltu	s4,s1,ffffffffc0201c4a <alloc_pages+0x7a>
ffffffffc0201c18:	000aa783          	lw	a5,0(s5)
ffffffffc0201c1c:	c79d                	beqz	a5,ffffffffc0201c4a <alloc_pages+0x7a>
ffffffffc0201c1e:	000b3503          	ld	a0,0(s6)
ffffffffc0201c22:	259010ef          	jal	ffffffffc020367a <swap_out>
ffffffffc0201c26:	100027f3          	csrr	a5,sstatus
ffffffffc0201c2a:	8b89                	andi	a5,a5,2
ffffffffc0201c2c:	8526                	mv	a0,s1
ffffffffc0201c2e:	dbf9                	beqz	a5,ffffffffc0201c04 <alloc_pages+0x34>
ffffffffc0201c30:	a11fe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0201c34:	00093783          	ld	a5,0(s2)
ffffffffc0201c38:	8526                	mv	a0,s1
ffffffffc0201c3a:	6f9c                	ld	a5,24(a5)
ffffffffc0201c3c:	9782                	jalr	a5
ffffffffc0201c3e:	842a                	mv	s0,a0
ffffffffc0201c40:	9fbfe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0201c44:	4601                	li	a2,0
ffffffffc0201c46:	85ce                	mv	a1,s3
ffffffffc0201c48:	d471                	beqz	s0,ffffffffc0201c14 <alloc_pages+0x44>
ffffffffc0201c4a:	70e2                	ld	ra,56(sp)
ffffffffc0201c4c:	8522                	mv	a0,s0
ffffffffc0201c4e:	7442                	ld	s0,48(sp)
ffffffffc0201c50:	74a2                	ld	s1,40(sp)
ffffffffc0201c52:	7902                	ld	s2,32(sp)
ffffffffc0201c54:	69e2                	ld	s3,24(sp)
ffffffffc0201c56:	6a42                	ld	s4,16(sp)
ffffffffc0201c58:	6aa2                	ld	s5,8(sp)
ffffffffc0201c5a:	6b02                	ld	s6,0(sp)
ffffffffc0201c5c:	6121                	addi	sp,sp,64
ffffffffc0201c5e:	8082                	ret

ffffffffc0201c60 <free_pages>:
ffffffffc0201c60:	100027f3          	csrr	a5,sstatus
ffffffffc0201c64:	8b89                	andi	a5,a5,2
ffffffffc0201c66:	e799                	bnez	a5,ffffffffc0201c74 <free_pages+0x14>
ffffffffc0201c68:	00035797          	auipc	a5,0x35
ffffffffc0201c6c:	5e07b783          	ld	a5,1504(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc0201c70:	739c                	ld	a5,32(a5)
ffffffffc0201c72:	8782                	jr	a5
ffffffffc0201c74:	1101                	addi	sp,sp,-32
ffffffffc0201c76:	ec06                	sd	ra,24(sp)
ffffffffc0201c78:	e822                	sd	s0,16(sp)
ffffffffc0201c7a:	e426                	sd	s1,8(sp)
ffffffffc0201c7c:	842a                	mv	s0,a0
ffffffffc0201c7e:	84ae                	mv	s1,a1
ffffffffc0201c80:	9c1fe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0201c84:	00035797          	auipc	a5,0x35
ffffffffc0201c88:	5c47b783          	ld	a5,1476(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc0201c8c:	739c                	ld	a5,32(a5)
ffffffffc0201c8e:	85a6                	mv	a1,s1
ffffffffc0201c90:	8522                	mv	a0,s0
ffffffffc0201c92:	9782                	jalr	a5
ffffffffc0201c94:	6442                	ld	s0,16(sp)
ffffffffc0201c96:	60e2                	ld	ra,24(sp)
ffffffffc0201c98:	64a2                	ld	s1,8(sp)
ffffffffc0201c9a:	6105                	addi	sp,sp,32
ffffffffc0201c9c:	99ffe06f          	j	ffffffffc020063a <intr_enable>

ffffffffc0201ca0 <nr_free_pages>:
ffffffffc0201ca0:	100027f3          	csrr	a5,sstatus
ffffffffc0201ca4:	8b89                	andi	a5,a5,2
ffffffffc0201ca6:	e799                	bnez	a5,ffffffffc0201cb4 <nr_free_pages+0x14>
ffffffffc0201ca8:	00035797          	auipc	a5,0x35
ffffffffc0201cac:	5a07b783          	ld	a5,1440(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc0201cb0:	779c                	ld	a5,40(a5)
ffffffffc0201cb2:	8782                	jr	a5
ffffffffc0201cb4:	1141                	addi	sp,sp,-16
ffffffffc0201cb6:	e406                	sd	ra,8(sp)
ffffffffc0201cb8:	e022                	sd	s0,0(sp)
ffffffffc0201cba:	987fe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0201cbe:	00035797          	auipc	a5,0x35
ffffffffc0201cc2:	58a7b783          	ld	a5,1418(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc0201cc6:	779c                	ld	a5,40(a5)
ffffffffc0201cc8:	9782                	jalr	a5
ffffffffc0201cca:	842a                	mv	s0,a0
ffffffffc0201ccc:	96ffe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0201cd0:	60a2                	ld	ra,8(sp)
ffffffffc0201cd2:	8522                	mv	a0,s0
ffffffffc0201cd4:	6402                	ld	s0,0(sp)
ffffffffc0201cd6:	0141                	addi	sp,sp,16
ffffffffc0201cd8:	8082                	ret

ffffffffc0201cda <get_pte>:
ffffffffc0201cda:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0201cde:	1ff7f793          	andi	a5,a5,511
ffffffffc0201ce2:	7139                	addi	sp,sp,-64
ffffffffc0201ce4:	078e                	slli	a5,a5,0x3
ffffffffc0201ce6:	f426                	sd	s1,40(sp)
ffffffffc0201ce8:	00f504b3          	add	s1,a0,a5
ffffffffc0201cec:	6094                	ld	a3,0(s1)
ffffffffc0201cee:	f04a                	sd	s2,32(sp)
ffffffffc0201cf0:	ec4e                	sd	s3,24(sp)
ffffffffc0201cf2:	e852                	sd	s4,16(sp)
ffffffffc0201cf4:	fc06                	sd	ra,56(sp)
ffffffffc0201cf6:	f822                	sd	s0,48(sp)
ffffffffc0201cf8:	e456                	sd	s5,8(sp)
ffffffffc0201cfa:	0016f793          	andi	a5,a3,1
ffffffffc0201cfe:	892e                	mv	s2,a1
ffffffffc0201d00:	89b2                	mv	s3,a2
ffffffffc0201d02:	00035a17          	auipc	s4,0x35
ffffffffc0201d06:	566a0a13          	addi	s4,s4,1382 # ffffffffc0237268 <npage>
ffffffffc0201d0a:	eba5                	bnez	a5,ffffffffc0201d7a <get_pte+0xa0>
ffffffffc0201d0c:	12060e63          	beqz	a2,ffffffffc0201e48 <get_pte+0x16e>
ffffffffc0201d10:	4505                	li	a0,1
ffffffffc0201d12:	ebfff0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0201d16:	842a                	mv	s0,a0
ffffffffc0201d18:	12050863          	beqz	a0,ffffffffc0201e48 <get_pte+0x16e>
ffffffffc0201d1c:	e05a                	sd	s6,0(sp)
ffffffffc0201d1e:	00035b17          	auipc	s6,0x35
ffffffffc0201d22:	552b0b13          	addi	s6,s6,1362 # ffffffffc0237270 <pages>
ffffffffc0201d26:	000b3503          	ld	a0,0(s6)
ffffffffc0201d2a:	00080ab7          	lui	s5,0x80
ffffffffc0201d2e:	00035a17          	auipc	s4,0x35
ffffffffc0201d32:	53aa0a13          	addi	s4,s4,1338 # ffffffffc0237268 <npage>
ffffffffc0201d36:	40a40533          	sub	a0,s0,a0
ffffffffc0201d3a:	8519                	srai	a0,a0,0x6
ffffffffc0201d3c:	9556                	add	a0,a0,s5
ffffffffc0201d3e:	000a3703          	ld	a4,0(s4)
ffffffffc0201d42:	00c51793          	slli	a5,a0,0xc
ffffffffc0201d46:	4685                	li	a3,1
ffffffffc0201d48:	c014                	sw	a3,0(s0)
ffffffffc0201d4a:	83b1                	srli	a5,a5,0xc
ffffffffc0201d4c:	0532                	slli	a0,a0,0xc
ffffffffc0201d4e:	14e7f563          	bgeu	a5,a4,ffffffffc0201e98 <get_pte+0x1be>
ffffffffc0201d52:	00035797          	auipc	a5,0x35
ffffffffc0201d56:	50e7b783          	ld	a5,1294(a5) # ffffffffc0237260 <va_pa_offset>
ffffffffc0201d5a:	953e                	add	a0,a0,a5
ffffffffc0201d5c:	6605                	lui	a2,0x1
ffffffffc0201d5e:	4581                	li	a1,0
ffffffffc0201d60:	402040ef          	jal	ffffffffc0206162 <memset>
ffffffffc0201d64:	000b3783          	ld	a5,0(s6)
ffffffffc0201d68:	6b02                	ld	s6,0(sp)
ffffffffc0201d6a:	40f406b3          	sub	a3,s0,a5
ffffffffc0201d6e:	8699                	srai	a3,a3,0x6
ffffffffc0201d70:	96d6                	add	a3,a3,s5
ffffffffc0201d72:	06aa                	slli	a3,a3,0xa
ffffffffc0201d74:	0116e693          	ori	a3,a3,17
ffffffffc0201d78:	e094                	sd	a3,0(s1)
ffffffffc0201d7a:	77fd                	lui	a5,0xfffff
ffffffffc0201d7c:	068a                	slli	a3,a3,0x2
ffffffffc0201d7e:	000a3703          	ld	a4,0(s4)
ffffffffc0201d82:	8efd                	and	a3,a3,a5
ffffffffc0201d84:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201d88:	0ce7f263          	bgeu	a5,a4,ffffffffc0201e4c <get_pte+0x172>
ffffffffc0201d8c:	00035a97          	auipc	s5,0x35
ffffffffc0201d90:	4d4a8a93          	addi	s5,s5,1236 # ffffffffc0237260 <va_pa_offset>
ffffffffc0201d94:	000ab603          	ld	a2,0(s5)
ffffffffc0201d98:	01595793          	srli	a5,s2,0x15
ffffffffc0201d9c:	1ff7f793          	andi	a5,a5,511
ffffffffc0201da0:	96b2                	add	a3,a3,a2
ffffffffc0201da2:	078e                	slli	a5,a5,0x3
ffffffffc0201da4:	00f68433          	add	s0,a3,a5
ffffffffc0201da8:	6014                	ld	a3,0(s0)
ffffffffc0201daa:	0016f793          	andi	a5,a3,1
ffffffffc0201dae:	e3bd                	bnez	a5,ffffffffc0201e14 <get_pte+0x13a>
ffffffffc0201db0:	08098c63          	beqz	s3,ffffffffc0201e48 <get_pte+0x16e>
ffffffffc0201db4:	4505                	li	a0,1
ffffffffc0201db6:	e1bff0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0201dba:	84aa                	mv	s1,a0
ffffffffc0201dbc:	c551                	beqz	a0,ffffffffc0201e48 <get_pte+0x16e>
ffffffffc0201dbe:	e05a                	sd	s6,0(sp)
ffffffffc0201dc0:	00035b17          	auipc	s6,0x35
ffffffffc0201dc4:	4b0b0b13          	addi	s6,s6,1200 # ffffffffc0237270 <pages>
ffffffffc0201dc8:	000b3683          	ld	a3,0(s6)
ffffffffc0201dcc:	000809b7          	lui	s3,0x80
ffffffffc0201dd0:	000a3703          	ld	a4,0(s4)
ffffffffc0201dd4:	40d506b3          	sub	a3,a0,a3
ffffffffc0201dd8:	8699                	srai	a3,a3,0x6
ffffffffc0201dda:	96ce                	add	a3,a3,s3
ffffffffc0201ddc:	00c69793          	slli	a5,a3,0xc
ffffffffc0201de0:	4605                	li	a2,1
ffffffffc0201de2:	c110                	sw	a2,0(a0)
ffffffffc0201de4:	83b1                	srli	a5,a5,0xc
ffffffffc0201de6:	06b2                	slli	a3,a3,0xc
ffffffffc0201de8:	08e7fc63          	bgeu	a5,a4,ffffffffc0201e80 <get_pte+0x1a6>
ffffffffc0201dec:	000ab503          	ld	a0,0(s5)
ffffffffc0201df0:	6605                	lui	a2,0x1
ffffffffc0201df2:	4581                	li	a1,0
ffffffffc0201df4:	9536                	add	a0,a0,a3
ffffffffc0201df6:	36c040ef          	jal	ffffffffc0206162 <memset>
ffffffffc0201dfa:	000b3783          	ld	a5,0(s6)
ffffffffc0201dfe:	6b02                	ld	s6,0(sp)
ffffffffc0201e00:	40f486b3          	sub	a3,s1,a5
ffffffffc0201e04:	8699                	srai	a3,a3,0x6
ffffffffc0201e06:	96ce                	add	a3,a3,s3
ffffffffc0201e08:	06aa                	slli	a3,a3,0xa
ffffffffc0201e0a:	0116e693          	ori	a3,a3,17
ffffffffc0201e0e:	e014                	sd	a3,0(s0)
ffffffffc0201e10:	000a3703          	ld	a4,0(s4)
ffffffffc0201e14:	77fd                	lui	a5,0xfffff
ffffffffc0201e16:	068a                	slli	a3,a3,0x2
ffffffffc0201e18:	8efd                	and	a3,a3,a5
ffffffffc0201e1a:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201e1e:	04e7f463          	bgeu	a5,a4,ffffffffc0201e66 <get_pte+0x18c>
ffffffffc0201e22:	000ab783          	ld	a5,0(s5)
ffffffffc0201e26:	00c95913          	srli	s2,s2,0xc
ffffffffc0201e2a:	1ff97913          	andi	s2,s2,511
ffffffffc0201e2e:	96be                	add	a3,a3,a5
ffffffffc0201e30:	090e                	slli	s2,s2,0x3
ffffffffc0201e32:	01268533          	add	a0,a3,s2
ffffffffc0201e36:	70e2                	ld	ra,56(sp)
ffffffffc0201e38:	7442                	ld	s0,48(sp)
ffffffffc0201e3a:	74a2                	ld	s1,40(sp)
ffffffffc0201e3c:	7902                	ld	s2,32(sp)
ffffffffc0201e3e:	69e2                	ld	s3,24(sp)
ffffffffc0201e40:	6a42                	ld	s4,16(sp)
ffffffffc0201e42:	6aa2                	ld	s5,8(sp)
ffffffffc0201e44:	6121                	addi	sp,sp,64
ffffffffc0201e46:	8082                	ret
ffffffffc0201e48:	4501                	li	a0,0
ffffffffc0201e4a:	b7f5                	j	ffffffffc0201e36 <get_pte+0x15c>
ffffffffc0201e4c:	00005617          	auipc	a2,0x5
ffffffffc0201e50:	fe460613          	addi	a2,a2,-28 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0201e54:	0fe00593          	li	a1,254
ffffffffc0201e58:	00005517          	auipc	a0,0x5
ffffffffc0201e5c:	0f050513          	addi	a0,a0,240 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0201e60:	e05a                	sd	s6,0(sp)
ffffffffc0201e62:	e12fe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0201e66:	00005617          	auipc	a2,0x5
ffffffffc0201e6a:	fca60613          	addi	a2,a2,-54 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0201e6e:	10900593          	li	a1,265
ffffffffc0201e72:	00005517          	auipc	a0,0x5
ffffffffc0201e76:	0d650513          	addi	a0,a0,214 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0201e7a:	e05a                	sd	s6,0(sp)
ffffffffc0201e7c:	df8fe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0201e80:	00005617          	auipc	a2,0x5
ffffffffc0201e84:	fb060613          	addi	a2,a2,-80 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0201e88:	10600593          	li	a1,262
ffffffffc0201e8c:	00005517          	auipc	a0,0x5
ffffffffc0201e90:	0bc50513          	addi	a0,a0,188 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0201e94:	de0fe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0201e98:	86aa                	mv	a3,a0
ffffffffc0201e9a:	00005617          	auipc	a2,0x5
ffffffffc0201e9e:	f9660613          	addi	a2,a2,-106 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0201ea2:	0fa00593          	li	a1,250
ffffffffc0201ea6:	00005517          	auipc	a0,0x5
ffffffffc0201eaa:	0a250513          	addi	a0,a0,162 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0201eae:	dc6fe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0201eb2 <get_page>:
ffffffffc0201eb2:	1141                	addi	sp,sp,-16
ffffffffc0201eb4:	e022                	sd	s0,0(sp)
ffffffffc0201eb6:	8432                	mv	s0,a2
ffffffffc0201eb8:	4601                	li	a2,0
ffffffffc0201eba:	e406                	sd	ra,8(sp)
ffffffffc0201ebc:	e1fff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0201ec0:	c011                	beqz	s0,ffffffffc0201ec4 <get_page+0x12>
ffffffffc0201ec2:	e008                	sd	a0,0(s0)
ffffffffc0201ec4:	c511                	beqz	a0,ffffffffc0201ed0 <get_page+0x1e>
ffffffffc0201ec6:	611c                	ld	a5,0(a0)
ffffffffc0201ec8:	4501                	li	a0,0
ffffffffc0201eca:	0017f713          	andi	a4,a5,1
ffffffffc0201ece:	e709                	bnez	a4,ffffffffc0201ed8 <get_page+0x26>
ffffffffc0201ed0:	60a2                	ld	ra,8(sp)
ffffffffc0201ed2:	6402                	ld	s0,0(sp)
ffffffffc0201ed4:	0141                	addi	sp,sp,16
ffffffffc0201ed6:	8082                	ret
ffffffffc0201ed8:	078a                	slli	a5,a5,0x2
ffffffffc0201eda:	83b1                	srli	a5,a5,0xc
ffffffffc0201edc:	00035717          	auipc	a4,0x35
ffffffffc0201ee0:	38c73703          	ld	a4,908(a4) # ffffffffc0237268 <npage>
ffffffffc0201ee4:	00e7ff63          	bgeu	a5,a4,ffffffffc0201f02 <get_page+0x50>
ffffffffc0201ee8:	60a2                	ld	ra,8(sp)
ffffffffc0201eea:	6402                	ld	s0,0(sp)
ffffffffc0201eec:	fff80737          	lui	a4,0xfff80
ffffffffc0201ef0:	97ba                	add	a5,a5,a4
ffffffffc0201ef2:	00035517          	auipc	a0,0x35
ffffffffc0201ef6:	37e53503          	ld	a0,894(a0) # ffffffffc0237270 <pages>
ffffffffc0201efa:	079a                	slli	a5,a5,0x6
ffffffffc0201efc:	953e                	add	a0,a0,a5
ffffffffc0201efe:	0141                	addi	sp,sp,16
ffffffffc0201f00:	8082                	ret
ffffffffc0201f02:	c97ff0ef          	jal	ffffffffc0201b98 <pa2page.part.0>

ffffffffc0201f06 <unmap_range>:
ffffffffc0201f06:	715d                	addi	sp,sp,-80
ffffffffc0201f08:	00c5e7b3          	or	a5,a1,a2
ffffffffc0201f0c:	e486                	sd	ra,72(sp)
ffffffffc0201f0e:	e0a2                	sd	s0,64(sp)
ffffffffc0201f10:	fc26                	sd	s1,56(sp)
ffffffffc0201f12:	f84a                	sd	s2,48(sp)
ffffffffc0201f14:	f44e                	sd	s3,40(sp)
ffffffffc0201f16:	f052                	sd	s4,32(sp)
ffffffffc0201f18:	ec56                	sd	s5,24(sp)
ffffffffc0201f1a:	e85a                	sd	s6,16(sp)
ffffffffc0201f1c:	17d2                	slli	a5,a5,0x34
ffffffffc0201f1e:	e7f9                	bnez	a5,ffffffffc0201fec <unmap_range+0xe6>
ffffffffc0201f20:	002007b7          	lui	a5,0x200
ffffffffc0201f24:	842e                	mv	s0,a1
ffffffffc0201f26:	0ef5e363          	bltu	a1,a5,ffffffffc020200c <unmap_range+0x106>
ffffffffc0201f2a:	8932                	mv	s2,a2
ffffffffc0201f2c:	0ec5f063          	bgeu	a1,a2,ffffffffc020200c <unmap_range+0x106>
ffffffffc0201f30:	4785                	li	a5,1
ffffffffc0201f32:	07fe                	slli	a5,a5,0x1f
ffffffffc0201f34:	0cc7ec63          	bltu	a5,a2,ffffffffc020200c <unmap_range+0x106>
ffffffffc0201f38:	89aa                	mv	s3,a0
ffffffffc0201f3a:	6a05                	lui	s4,0x1
ffffffffc0201f3c:	00200b37          	lui	s6,0x200
ffffffffc0201f40:	ffe00ab7          	lui	s5,0xffe00
ffffffffc0201f44:	4601                	li	a2,0
ffffffffc0201f46:	85a2                	mv	a1,s0
ffffffffc0201f48:	854e                	mv	a0,s3
ffffffffc0201f4a:	d91ff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0201f4e:	84aa                	mv	s1,a0
ffffffffc0201f50:	c125                	beqz	a0,ffffffffc0201fb0 <unmap_range+0xaa>
ffffffffc0201f52:	611c                	ld	a5,0(a0)
ffffffffc0201f54:	ef99                	bnez	a5,ffffffffc0201f72 <unmap_range+0x6c>
ffffffffc0201f56:	9452                	add	s0,s0,s4
ffffffffc0201f58:	c019                	beqz	s0,ffffffffc0201f5e <unmap_range+0x58>
ffffffffc0201f5a:	ff2465e3          	bltu	s0,s2,ffffffffc0201f44 <unmap_range+0x3e>
ffffffffc0201f5e:	60a6                	ld	ra,72(sp)
ffffffffc0201f60:	6406                	ld	s0,64(sp)
ffffffffc0201f62:	74e2                	ld	s1,56(sp)
ffffffffc0201f64:	7942                	ld	s2,48(sp)
ffffffffc0201f66:	79a2                	ld	s3,40(sp)
ffffffffc0201f68:	7a02                	ld	s4,32(sp)
ffffffffc0201f6a:	6ae2                	ld	s5,24(sp)
ffffffffc0201f6c:	6b42                	ld	s6,16(sp)
ffffffffc0201f6e:	6161                	addi	sp,sp,80
ffffffffc0201f70:	8082                	ret
ffffffffc0201f72:	0017f713          	andi	a4,a5,1
ffffffffc0201f76:	d365                	beqz	a4,ffffffffc0201f56 <unmap_range+0x50>
ffffffffc0201f78:	078a                	slli	a5,a5,0x2
ffffffffc0201f7a:	83b1                	srli	a5,a5,0xc
ffffffffc0201f7c:	00035717          	auipc	a4,0x35
ffffffffc0201f80:	2ec73703          	ld	a4,748(a4) # ffffffffc0237268 <npage>
ffffffffc0201f84:	0ae7f463          	bgeu	a5,a4,ffffffffc020202c <unmap_range+0x126>
ffffffffc0201f88:	fff80737          	lui	a4,0xfff80
ffffffffc0201f8c:	97ba                	add	a5,a5,a4
ffffffffc0201f8e:	079a                	slli	a5,a5,0x6
ffffffffc0201f90:	00035517          	auipc	a0,0x35
ffffffffc0201f94:	2e053503          	ld	a0,736(a0) # ffffffffc0237270 <pages>
ffffffffc0201f98:	953e                	add	a0,a0,a5
ffffffffc0201f9a:	411c                	lw	a5,0(a0)
ffffffffc0201f9c:	fff7871b          	addiw	a4,a5,-1 # 1fffff <_binary_obj___user_exit_out_size+0x1fd6af>
ffffffffc0201fa0:	c118                	sw	a4,0(a0)
ffffffffc0201fa2:	cb19                	beqz	a4,ffffffffc0201fb8 <unmap_range+0xb2>
ffffffffc0201fa4:	0004b023          	sd	zero,0(s1)
ffffffffc0201fa8:	12040073          	sfence.vma	s0
ffffffffc0201fac:	9452                	add	s0,s0,s4
ffffffffc0201fae:	b76d                	j	ffffffffc0201f58 <unmap_range+0x52>
ffffffffc0201fb0:	945a                	add	s0,s0,s6
ffffffffc0201fb2:	01547433          	and	s0,s0,s5
ffffffffc0201fb6:	b74d                	j	ffffffffc0201f58 <unmap_range+0x52>
ffffffffc0201fb8:	100027f3          	csrr	a5,sstatus
ffffffffc0201fbc:	8b89                	andi	a5,a5,2
ffffffffc0201fbe:	eb89                	bnez	a5,ffffffffc0201fd0 <unmap_range+0xca>
ffffffffc0201fc0:	00035797          	auipc	a5,0x35
ffffffffc0201fc4:	2887b783          	ld	a5,648(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc0201fc8:	739c                	ld	a5,32(a5)
ffffffffc0201fca:	4585                	li	a1,1
ffffffffc0201fcc:	9782                	jalr	a5
ffffffffc0201fce:	bfd9                	j	ffffffffc0201fa4 <unmap_range+0x9e>
ffffffffc0201fd0:	e42a                	sd	a0,8(sp)
ffffffffc0201fd2:	e6efe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0201fd6:	00035797          	auipc	a5,0x35
ffffffffc0201fda:	2727b783          	ld	a5,626(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc0201fde:	739c                	ld	a5,32(a5)
ffffffffc0201fe0:	6522                	ld	a0,8(sp)
ffffffffc0201fe2:	4585                	li	a1,1
ffffffffc0201fe4:	9782                	jalr	a5
ffffffffc0201fe6:	e54fe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0201fea:	bf6d                	j	ffffffffc0201fa4 <unmap_range+0x9e>
ffffffffc0201fec:	00005697          	auipc	a3,0x5
ffffffffc0201ff0:	f6c68693          	addi	a3,a3,-148 # ffffffffc0206f58 <etext+0xdcc>
ffffffffc0201ff4:	00005617          	auipc	a2,0x5
ffffffffc0201ff8:	81460613          	addi	a2,a2,-2028 # ffffffffc0206808 <etext+0x67c>
ffffffffc0201ffc:	14000593          	li	a1,320
ffffffffc0202000:	00005517          	auipc	a0,0x5
ffffffffc0202004:	f4850513          	addi	a0,a0,-184 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202008:	c6cfe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020200c:	00005697          	auipc	a3,0x5
ffffffffc0202010:	f7c68693          	addi	a3,a3,-132 # ffffffffc0206f88 <etext+0xdfc>
ffffffffc0202014:	00004617          	auipc	a2,0x4
ffffffffc0202018:	7f460613          	addi	a2,a2,2036 # ffffffffc0206808 <etext+0x67c>
ffffffffc020201c:	14100593          	li	a1,321
ffffffffc0202020:	00005517          	auipc	a0,0x5
ffffffffc0202024:	f2850513          	addi	a0,a0,-216 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202028:	c4cfe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020202c:	b6dff0ef          	jal	ffffffffc0201b98 <pa2page.part.0>

ffffffffc0202030 <exit_range>:
ffffffffc0202030:	711d                	addi	sp,sp,-96
ffffffffc0202032:	00c5e7b3          	or	a5,a1,a2
ffffffffc0202036:	ec86                	sd	ra,88(sp)
ffffffffc0202038:	e8a2                	sd	s0,80(sp)
ffffffffc020203a:	e4a6                	sd	s1,72(sp)
ffffffffc020203c:	e0ca                	sd	s2,64(sp)
ffffffffc020203e:	fc4e                	sd	s3,56(sp)
ffffffffc0202040:	f852                	sd	s4,48(sp)
ffffffffc0202042:	f456                	sd	s5,40(sp)
ffffffffc0202044:	f05a                	sd	s6,32(sp)
ffffffffc0202046:	ec5e                	sd	s7,24(sp)
ffffffffc0202048:	e862                	sd	s8,16(sp)
ffffffffc020204a:	17d2                	slli	a5,a5,0x34
ffffffffc020204c:	e3f1                	bnez	a5,ffffffffc0202110 <exit_range+0xe0>
ffffffffc020204e:	002007b7          	lui	a5,0x200
ffffffffc0202052:	0ef5eb63          	bltu	a1,a5,ffffffffc0202148 <exit_range+0x118>
ffffffffc0202056:	8ab2                	mv	s5,a2
ffffffffc0202058:	0ec5f863          	bgeu	a1,a2,ffffffffc0202148 <exit_range+0x118>
ffffffffc020205c:	4785                	li	a5,1
ffffffffc020205e:	ffe00737          	lui	a4,0xffe00
ffffffffc0202062:	07fe                	slli	a5,a5,0x1f
ffffffffc0202064:	00e5f4b3          	and	s1,a1,a4
ffffffffc0202068:	0ec7e063          	bltu	a5,a2,ffffffffc0202148 <exit_range+0x118>
ffffffffc020206c:	8b2a                	mv	s6,a0
ffffffffc020206e:	00035b97          	auipc	s7,0x35
ffffffffc0202072:	1fab8b93          	addi	s7,s7,506 # ffffffffc0237268 <npage>
ffffffffc0202076:	00035c17          	auipc	s8,0x35
ffffffffc020207a:	1fac0c13          	addi	s8,s8,506 # ffffffffc0237270 <pages>
ffffffffc020207e:	fff809b7          	lui	s3,0xfff80
ffffffffc0202082:	00035917          	auipc	s2,0x35
ffffffffc0202086:	1c690913          	addi	s2,s2,454 # ffffffffc0237248 <pmm_manager>
ffffffffc020208a:	00200a37          	lui	s4,0x200
ffffffffc020208e:	a029                	j	ffffffffc0202098 <exit_range+0x68>
ffffffffc0202090:	94d2                	add	s1,s1,s4
ffffffffc0202092:	c4a9                	beqz	s1,ffffffffc02020dc <exit_range+0xac>
ffffffffc0202094:	0554f463          	bgeu	s1,s5,ffffffffc02020dc <exit_range+0xac>
ffffffffc0202098:	01e4d413          	srli	s0,s1,0x1e
ffffffffc020209c:	1ff47413          	andi	s0,s0,511
ffffffffc02020a0:	040e                	slli	s0,s0,0x3
ffffffffc02020a2:	945a                	add	s0,s0,s6
ffffffffc02020a4:	601c                	ld	a5,0(s0)
ffffffffc02020a6:	0017f713          	andi	a4,a5,1
ffffffffc02020aa:	d37d                	beqz	a4,ffffffffc0202090 <exit_range+0x60>
ffffffffc02020ac:	000bb703          	ld	a4,0(s7)
ffffffffc02020b0:	078a                	slli	a5,a5,0x2
ffffffffc02020b2:	83b1                	srli	a5,a5,0xc
ffffffffc02020b4:	06e7fe63          	bgeu	a5,a4,ffffffffc0202130 <exit_range+0x100>
ffffffffc02020b8:	000c3503          	ld	a0,0(s8)
ffffffffc02020bc:	97ce                	add	a5,a5,s3
ffffffffc02020be:	079a                	slli	a5,a5,0x6
ffffffffc02020c0:	953e                	add	a0,a0,a5
ffffffffc02020c2:	100027f3          	csrr	a5,sstatus
ffffffffc02020c6:	8b89                	andi	a5,a5,2
ffffffffc02020c8:	e795                	bnez	a5,ffffffffc02020f4 <exit_range+0xc4>
ffffffffc02020ca:	00093783          	ld	a5,0(s2)
ffffffffc02020ce:	4585                	li	a1,1
ffffffffc02020d0:	739c                	ld	a5,32(a5)
ffffffffc02020d2:	9782                	jalr	a5
ffffffffc02020d4:	00043023          	sd	zero,0(s0)
ffffffffc02020d8:	94d2                	add	s1,s1,s4
ffffffffc02020da:	fccd                	bnez	s1,ffffffffc0202094 <exit_range+0x64>
ffffffffc02020dc:	60e6                	ld	ra,88(sp)
ffffffffc02020de:	6446                	ld	s0,80(sp)
ffffffffc02020e0:	64a6                	ld	s1,72(sp)
ffffffffc02020e2:	6906                	ld	s2,64(sp)
ffffffffc02020e4:	79e2                	ld	s3,56(sp)
ffffffffc02020e6:	7a42                	ld	s4,48(sp)
ffffffffc02020e8:	7aa2                	ld	s5,40(sp)
ffffffffc02020ea:	7b02                	ld	s6,32(sp)
ffffffffc02020ec:	6be2                	ld	s7,24(sp)
ffffffffc02020ee:	6c42                	ld	s8,16(sp)
ffffffffc02020f0:	6125                	addi	sp,sp,96
ffffffffc02020f2:	8082                	ret
ffffffffc02020f4:	e42a                	sd	a0,8(sp)
ffffffffc02020f6:	d4afe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02020fa:	00093783          	ld	a5,0(s2)
ffffffffc02020fe:	6522                	ld	a0,8(sp)
ffffffffc0202100:	4585                	li	a1,1
ffffffffc0202102:	739c                	ld	a5,32(a5)
ffffffffc0202104:	9782                	jalr	a5
ffffffffc0202106:	d34fe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc020210a:	00043023          	sd	zero,0(s0)
ffffffffc020210e:	b7e9                	j	ffffffffc02020d8 <exit_range+0xa8>
ffffffffc0202110:	00005697          	auipc	a3,0x5
ffffffffc0202114:	e4868693          	addi	a3,a3,-440 # ffffffffc0206f58 <etext+0xdcc>
ffffffffc0202118:	00004617          	auipc	a2,0x4
ffffffffc020211c:	6f060613          	addi	a2,a2,1776 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202120:	15100593          	li	a1,337
ffffffffc0202124:	00005517          	auipc	a0,0x5
ffffffffc0202128:	e2450513          	addi	a0,a0,-476 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc020212c:	b48fe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202130:	00005617          	auipc	a2,0x5
ffffffffc0202134:	dd060613          	addi	a2,a2,-560 # ffffffffc0206f00 <etext+0xd74>
ffffffffc0202138:	06200593          	li	a1,98
ffffffffc020213c:	00005517          	auipc	a0,0x5
ffffffffc0202140:	d1c50513          	addi	a0,a0,-740 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0202144:	b30fe0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202148:	00005697          	auipc	a3,0x5
ffffffffc020214c:	e4068693          	addi	a3,a3,-448 # ffffffffc0206f88 <etext+0xdfc>
ffffffffc0202150:	00004617          	auipc	a2,0x4
ffffffffc0202154:	6b860613          	addi	a2,a2,1720 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202158:	15200593          	li	a1,338
ffffffffc020215c:	00005517          	auipc	a0,0x5
ffffffffc0202160:	dec50513          	addi	a0,a0,-532 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202164:	b10fe0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0202168 <page_remove>:
ffffffffc0202168:	7179                	addi	sp,sp,-48
ffffffffc020216a:	4601                	li	a2,0
ffffffffc020216c:	ec26                	sd	s1,24(sp)
ffffffffc020216e:	f406                	sd	ra,40(sp)
ffffffffc0202170:	84ae                	mv	s1,a1
ffffffffc0202172:	b69ff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0202176:	c901                	beqz	a0,ffffffffc0202186 <page_remove+0x1e>
ffffffffc0202178:	611c                	ld	a5,0(a0)
ffffffffc020217a:	f022                	sd	s0,32(sp)
ffffffffc020217c:	842a                	mv	s0,a0
ffffffffc020217e:	0017f713          	andi	a4,a5,1
ffffffffc0202182:	e711                	bnez	a4,ffffffffc020218e <page_remove+0x26>
ffffffffc0202184:	7402                	ld	s0,32(sp)
ffffffffc0202186:	70a2                	ld	ra,40(sp)
ffffffffc0202188:	64e2                	ld	s1,24(sp)
ffffffffc020218a:	6145                	addi	sp,sp,48
ffffffffc020218c:	8082                	ret
ffffffffc020218e:	078a                	slli	a5,a5,0x2
ffffffffc0202190:	83b1                	srli	a5,a5,0xc
ffffffffc0202192:	00035717          	auipc	a4,0x35
ffffffffc0202196:	0d673703          	ld	a4,214(a4) # ffffffffc0237268 <npage>
ffffffffc020219a:	06e7f363          	bgeu	a5,a4,ffffffffc0202200 <page_remove+0x98>
ffffffffc020219e:	fff80737          	lui	a4,0xfff80
ffffffffc02021a2:	97ba                	add	a5,a5,a4
ffffffffc02021a4:	079a                	slli	a5,a5,0x6
ffffffffc02021a6:	00035517          	auipc	a0,0x35
ffffffffc02021aa:	0ca53503          	ld	a0,202(a0) # ffffffffc0237270 <pages>
ffffffffc02021ae:	953e                	add	a0,a0,a5
ffffffffc02021b0:	411c                	lw	a5,0(a0)
ffffffffc02021b2:	fff7871b          	addiw	a4,a5,-1 # 1fffff <_binary_obj___user_exit_out_size+0x1fd6af>
ffffffffc02021b6:	c118                	sw	a4,0(a0)
ffffffffc02021b8:	cb11                	beqz	a4,ffffffffc02021cc <page_remove+0x64>
ffffffffc02021ba:	00043023          	sd	zero,0(s0)
ffffffffc02021be:	12048073          	sfence.vma	s1
ffffffffc02021c2:	7402                	ld	s0,32(sp)
ffffffffc02021c4:	70a2                	ld	ra,40(sp)
ffffffffc02021c6:	64e2                	ld	s1,24(sp)
ffffffffc02021c8:	6145                	addi	sp,sp,48
ffffffffc02021ca:	8082                	ret
ffffffffc02021cc:	100027f3          	csrr	a5,sstatus
ffffffffc02021d0:	8b89                	andi	a5,a5,2
ffffffffc02021d2:	eb89                	bnez	a5,ffffffffc02021e4 <page_remove+0x7c>
ffffffffc02021d4:	00035797          	auipc	a5,0x35
ffffffffc02021d8:	0747b783          	ld	a5,116(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc02021dc:	739c                	ld	a5,32(a5)
ffffffffc02021de:	4585                	li	a1,1
ffffffffc02021e0:	9782                	jalr	a5
ffffffffc02021e2:	bfe1                	j	ffffffffc02021ba <page_remove+0x52>
ffffffffc02021e4:	e42a                	sd	a0,8(sp)
ffffffffc02021e6:	c5afe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02021ea:	00035797          	auipc	a5,0x35
ffffffffc02021ee:	05e7b783          	ld	a5,94(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc02021f2:	739c                	ld	a5,32(a5)
ffffffffc02021f4:	6522                	ld	a0,8(sp)
ffffffffc02021f6:	4585                	li	a1,1
ffffffffc02021f8:	9782                	jalr	a5
ffffffffc02021fa:	c40fe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc02021fe:	bf75                	j	ffffffffc02021ba <page_remove+0x52>
ffffffffc0202200:	999ff0ef          	jal	ffffffffc0201b98 <pa2page.part.0>

ffffffffc0202204 <page_insert>:
ffffffffc0202204:	7139                	addi	sp,sp,-64
ffffffffc0202206:	e852                	sd	s4,16(sp)
ffffffffc0202208:	8a32                	mv	s4,a2
ffffffffc020220a:	f822                	sd	s0,48(sp)
ffffffffc020220c:	4605                	li	a2,1
ffffffffc020220e:	842e                	mv	s0,a1
ffffffffc0202210:	85d2                	mv	a1,s4
ffffffffc0202212:	f426                	sd	s1,40(sp)
ffffffffc0202214:	fc06                	sd	ra,56(sp)
ffffffffc0202216:	84b6                	mv	s1,a3
ffffffffc0202218:	ac3ff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc020221c:	c971                	beqz	a0,ffffffffc02022f0 <page_insert+0xec>
ffffffffc020221e:	4014                	lw	a3,0(s0)
ffffffffc0202220:	611c                	ld	a5,0(a0)
ffffffffc0202222:	ec4e                	sd	s3,24(sp)
ffffffffc0202224:	0016871b          	addiw	a4,a3,1
ffffffffc0202228:	c018                	sw	a4,0(s0)
ffffffffc020222a:	0017f713          	andi	a4,a5,1
ffffffffc020222e:	89aa                	mv	s3,a0
ffffffffc0202230:	eb15                	bnez	a4,ffffffffc0202264 <page_insert+0x60>
ffffffffc0202232:	00035717          	auipc	a4,0x35
ffffffffc0202236:	03e73703          	ld	a4,62(a4) # ffffffffc0237270 <pages>
ffffffffc020223a:	8c19                	sub	s0,s0,a4
ffffffffc020223c:	000807b7          	lui	a5,0x80
ffffffffc0202240:	8419                	srai	s0,s0,0x6
ffffffffc0202242:	943e                	add	s0,s0,a5
ffffffffc0202244:	042a                	slli	s0,s0,0xa
ffffffffc0202246:	8cc1                	or	s1,s1,s0
ffffffffc0202248:	0014e493          	ori	s1,s1,1
ffffffffc020224c:	0099b023          	sd	s1,0(s3) # fffffffffff80000 <end+0x3fd48d40>
ffffffffc0202250:	120a0073          	sfence.vma	s4
ffffffffc0202254:	69e2                	ld	s3,24(sp)
ffffffffc0202256:	4501                	li	a0,0
ffffffffc0202258:	70e2                	ld	ra,56(sp)
ffffffffc020225a:	7442                	ld	s0,48(sp)
ffffffffc020225c:	74a2                	ld	s1,40(sp)
ffffffffc020225e:	6a42                	ld	s4,16(sp)
ffffffffc0202260:	6121                	addi	sp,sp,64
ffffffffc0202262:	8082                	ret
ffffffffc0202264:	078a                	slli	a5,a5,0x2
ffffffffc0202266:	f04a                	sd	s2,32(sp)
ffffffffc0202268:	e456                	sd	s5,8(sp)
ffffffffc020226a:	83b1                	srli	a5,a5,0xc
ffffffffc020226c:	00035717          	auipc	a4,0x35
ffffffffc0202270:	ffc73703          	ld	a4,-4(a4) # ffffffffc0237268 <npage>
ffffffffc0202274:	08e7f063          	bgeu	a5,a4,ffffffffc02022f4 <page_insert+0xf0>
ffffffffc0202278:	00035a97          	auipc	s5,0x35
ffffffffc020227c:	ff8a8a93          	addi	s5,s5,-8 # ffffffffc0237270 <pages>
ffffffffc0202280:	000ab703          	ld	a4,0(s5)
ffffffffc0202284:	fff80637          	lui	a2,0xfff80
ffffffffc0202288:	00c78933          	add	s2,a5,a2
ffffffffc020228c:	091a                	slli	s2,s2,0x6
ffffffffc020228e:	993a                	add	s2,s2,a4
ffffffffc0202290:	01240e63          	beq	s0,s2,ffffffffc02022ac <page_insert+0xa8>
ffffffffc0202294:	00092783          	lw	a5,0(s2)
ffffffffc0202298:	fff7869b          	addiw	a3,a5,-1 # 7ffff <_binary_obj___user_exit_out_size+0x7d6af>
ffffffffc020229c:	00d92023          	sw	a3,0(s2)
ffffffffc02022a0:	ca91                	beqz	a3,ffffffffc02022b4 <page_insert+0xb0>
ffffffffc02022a2:	120a0073          	sfence.vma	s4
ffffffffc02022a6:	7902                	ld	s2,32(sp)
ffffffffc02022a8:	6aa2                	ld	s5,8(sp)
ffffffffc02022aa:	bf41                	j	ffffffffc020223a <page_insert+0x36>
ffffffffc02022ac:	7902                	ld	s2,32(sp)
ffffffffc02022ae:	6aa2                	ld	s5,8(sp)
ffffffffc02022b0:	c014                	sw	a3,0(s0)
ffffffffc02022b2:	b761                	j	ffffffffc020223a <page_insert+0x36>
ffffffffc02022b4:	100027f3          	csrr	a5,sstatus
ffffffffc02022b8:	8b89                	andi	a5,a5,2
ffffffffc02022ba:	ef81                	bnez	a5,ffffffffc02022d2 <page_insert+0xce>
ffffffffc02022bc:	00035797          	auipc	a5,0x35
ffffffffc02022c0:	f8c7b783          	ld	a5,-116(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc02022c4:	739c                	ld	a5,32(a5)
ffffffffc02022c6:	4585                	li	a1,1
ffffffffc02022c8:	854a                	mv	a0,s2
ffffffffc02022ca:	9782                	jalr	a5
ffffffffc02022cc:	000ab703          	ld	a4,0(s5)
ffffffffc02022d0:	bfc9                	j	ffffffffc02022a2 <page_insert+0x9e>
ffffffffc02022d2:	b6efe0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02022d6:	00035797          	auipc	a5,0x35
ffffffffc02022da:	f727b783          	ld	a5,-142(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc02022de:	739c                	ld	a5,32(a5)
ffffffffc02022e0:	4585                	li	a1,1
ffffffffc02022e2:	854a                	mv	a0,s2
ffffffffc02022e4:	9782                	jalr	a5
ffffffffc02022e6:	b54fe0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc02022ea:	000ab703          	ld	a4,0(s5)
ffffffffc02022ee:	bf55                	j	ffffffffc02022a2 <page_insert+0x9e>
ffffffffc02022f0:	5571                	li	a0,-4
ffffffffc02022f2:	b79d                	j	ffffffffc0202258 <page_insert+0x54>
ffffffffc02022f4:	8a5ff0ef          	jal	ffffffffc0201b98 <pa2page.part.0>

ffffffffc02022f8 <pmm_init>:
ffffffffc02022f8:	00006797          	auipc	a5,0x6
ffffffffc02022fc:	22078793          	addi	a5,a5,544 # ffffffffc0208518 <default_pmm_manager>
ffffffffc0202300:	638c                	ld	a1,0(a5)
ffffffffc0202302:	711d                	addi	sp,sp,-96
ffffffffc0202304:	ec86                	sd	ra,88(sp)
ffffffffc0202306:	e0ca                	sd	s2,64(sp)
ffffffffc0202308:	fc4e                	sd	s3,56(sp)
ffffffffc020230a:	f05a                	sd	s6,32(sp)
ffffffffc020230c:	ec5e                	sd	s7,24(sp)
ffffffffc020230e:	e8a2                	sd	s0,80(sp)
ffffffffc0202310:	e4a6                	sd	s1,72(sp)
ffffffffc0202312:	f852                	sd	s4,48(sp)
ffffffffc0202314:	f456                	sd	s5,40(sp)
ffffffffc0202316:	00035b97          	auipc	s7,0x35
ffffffffc020231a:	f32b8b93          	addi	s7,s7,-206 # ffffffffc0237248 <pmm_manager>
ffffffffc020231e:	00005517          	auipc	a0,0x5
ffffffffc0202322:	c8250513          	addi	a0,a0,-894 # ffffffffc0206fa0 <etext+0xe14>
ffffffffc0202326:	00fbb023          	sd	a5,0(s7)
ffffffffc020232a:	e57fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020232e:	000bb783          	ld	a5,0(s7)
ffffffffc0202332:	00035997          	auipc	s3,0x35
ffffffffc0202336:	f2e98993          	addi	s3,s3,-210 # ffffffffc0237260 <va_pa_offset>
ffffffffc020233a:	00035917          	auipc	s2,0x35
ffffffffc020233e:	f2e90913          	addi	s2,s2,-210 # ffffffffc0237268 <npage>
ffffffffc0202342:	679c                	ld	a5,8(a5)
ffffffffc0202344:	00035b17          	auipc	s6,0x35
ffffffffc0202348:	f2cb0b13          	addi	s6,s6,-212 # ffffffffc0237270 <pages>
ffffffffc020234c:	9782                	jalr	a5
ffffffffc020234e:	57f5                	li	a5,-3
ffffffffc0202350:	07fa                	slli	a5,a5,0x1e
ffffffffc0202352:	00005517          	auipc	a0,0x5
ffffffffc0202356:	c6650513          	addi	a0,a0,-922 # ffffffffc0206fb8 <etext+0xe2c>
ffffffffc020235a:	00f9b023          	sd	a5,0(s3)
ffffffffc020235e:	e23fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202362:	44300693          	li	a3,1091
ffffffffc0202366:	06d6                	slli	a3,a3,0x15
ffffffffc0202368:	40100613          	li	a2,1025
ffffffffc020236c:	16fd                	addi	a3,a3,-1
ffffffffc020236e:	0656                	slli	a2,a2,0x15
ffffffffc0202370:	088005b7          	lui	a1,0x8800
ffffffffc0202374:	00005517          	auipc	a0,0x5
ffffffffc0202378:	c5c50513          	addi	a0,a0,-932 # ffffffffc0206fd0 <etext+0xe44>
ffffffffc020237c:	e05fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202380:	76fd                	lui	a3,0xfffff
ffffffffc0202382:	00088737          	lui	a4,0x88
ffffffffc0202386:	00036797          	auipc	a5,0x36
ffffffffc020238a:	f3978793          	addi	a5,a5,-199 # ffffffffc02382bf <end+0xfff>
ffffffffc020238e:	8ff5                	and	a5,a5,a3
ffffffffc0202390:	60070713          	addi	a4,a4,1536 # 88600 <_binary_obj___user_exit_out_size+0x85cb0>
ffffffffc0202394:	00e93023          	sd	a4,0(s2)
ffffffffc0202398:	00fb3023          	sd	a5,0(s6)
ffffffffc020239c:	4705                	li	a4,1
ffffffffc020239e:	07a1                	addi	a5,a5,8
ffffffffc02023a0:	40e7b02f          	amoor.d	zero,a4,(a5)
ffffffffc02023a4:	4505                	li	a0,1
ffffffffc02023a6:	fff805b7          	lui	a1,0xfff80
ffffffffc02023aa:	000b3783          	ld	a5,0(s6)
ffffffffc02023ae:	00671693          	slli	a3,a4,0x6
ffffffffc02023b2:	97b6                	add	a5,a5,a3
ffffffffc02023b4:	07a1                	addi	a5,a5,8
ffffffffc02023b6:	40a7b02f          	amoor.d	zero,a0,(a5)
ffffffffc02023ba:	00093603          	ld	a2,0(s2)
ffffffffc02023be:	0705                	addi	a4,a4,1
ffffffffc02023c0:	00b607b3          	add	a5,a2,a1
ffffffffc02023c4:	fef763e3          	bltu	a4,a5,ffffffffc02023aa <pmm_init+0xb2>
ffffffffc02023c8:	000b3503          	ld	a0,0(s6)
ffffffffc02023cc:	079a                	slli	a5,a5,0x6
ffffffffc02023ce:	c0200737          	lui	a4,0xc0200
ffffffffc02023d2:	00f506b3          	add	a3,a0,a5
ffffffffc02023d6:	50e6e763          	bltu	a3,a4,ffffffffc02028e4 <pmm_init+0x5ec>
ffffffffc02023da:	0009b583          	ld	a1,0(s3)
ffffffffc02023de:	44300713          	li	a4,1091
ffffffffc02023e2:	0756                	slli	a4,a4,0x15
ffffffffc02023e4:	8e8d                	sub	a3,a3,a1
ffffffffc02023e6:	36e6ea63          	bltu	a3,a4,ffffffffc020275a <pmm_init+0x462>
ffffffffc02023ea:	00005517          	auipc	a0,0x5
ffffffffc02023ee:	c0e50513          	addi	a0,a0,-1010 # ffffffffc0206ff8 <etext+0xe6c>
ffffffffc02023f2:	d8ffd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02023f6:	000bb783          	ld	a5,0(s7)
ffffffffc02023fa:	00035497          	auipc	s1,0x35
ffffffffc02023fe:	e5e48493          	addi	s1,s1,-418 # ffffffffc0237258 <boot_pgdir>
ffffffffc0202402:	7b9c                	ld	a5,48(a5)
ffffffffc0202404:	9782                	jalr	a5
ffffffffc0202406:	00005517          	auipc	a0,0x5
ffffffffc020240a:	c0a50513          	addi	a0,a0,-1014 # ffffffffc0207010 <etext+0xe84>
ffffffffc020240e:	d73fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202412:	00009517          	auipc	a0,0x9
ffffffffc0202416:	bee50513          	addi	a0,a0,-1042 # ffffffffc020b000 <boot_page_table_sv39>
ffffffffc020241a:	e088                	sd	a0,0(s1)
ffffffffc020241c:	c02007b7          	lui	a5,0xc0200
ffffffffc0202420:	44f56563          	bltu	a0,a5,ffffffffc020286a <pmm_init+0x572>
ffffffffc0202424:	0009b703          	ld	a4,0(s3)
ffffffffc0202428:	00093683          	ld	a3,0(s2)
ffffffffc020242c:	c80007b7          	lui	a5,0xc8000
ffffffffc0202430:	40e50733          	sub	a4,a0,a4
ffffffffc0202434:	00035617          	auipc	a2,0x35
ffffffffc0202438:	e0e63e23          	sd	a4,-484(a2) # ffffffffc0237250 <boot_cr3>
ffffffffc020243c:	83b1                	srli	a5,a5,0xc
ffffffffc020243e:	64d7e363          	bltu	a5,a3,ffffffffc0202a84 <pmm_init+0x78c>
ffffffffc0202442:	03451793          	slli	a5,a0,0x34
ffffffffc0202446:	60079f63          	bnez	a5,ffffffffc0202a64 <pmm_init+0x76c>
ffffffffc020244a:	4601                	li	a2,0
ffffffffc020244c:	4581                	li	a1,0
ffffffffc020244e:	a65ff0ef          	jal	ffffffffc0201eb2 <get_page>
ffffffffc0202452:	5e051963          	bnez	a0,ffffffffc0202a44 <pmm_init+0x74c>
ffffffffc0202456:	4505                	li	a0,1
ffffffffc0202458:	f78ff0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc020245c:	842a                	mv	s0,a0
ffffffffc020245e:	6088                	ld	a0,0(s1)
ffffffffc0202460:	4681                	li	a3,0
ffffffffc0202462:	4601                	li	a2,0
ffffffffc0202464:	85a2                	mv	a1,s0
ffffffffc0202466:	d9fff0ef          	jal	ffffffffc0202204 <page_insert>
ffffffffc020246a:	5a051d63          	bnez	a0,ffffffffc0202a24 <pmm_init+0x72c>
ffffffffc020246e:	6088                	ld	a0,0(s1)
ffffffffc0202470:	4601                	li	a2,0
ffffffffc0202472:	4581                	li	a1,0
ffffffffc0202474:	867ff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0202478:	58050663          	beqz	a0,ffffffffc0202a04 <pmm_init+0x70c>
ffffffffc020247c:	611c                	ld	a5,0(a0)
ffffffffc020247e:	0017f713          	andi	a4,a5,1
ffffffffc0202482:	56070f63          	beqz	a4,ffffffffc0202a00 <pmm_init+0x708>
ffffffffc0202486:	00093603          	ld	a2,0(s2)
ffffffffc020248a:	078a                	slli	a5,a5,0x2
ffffffffc020248c:	83b1                	srli	a5,a5,0xc
ffffffffc020248e:	56c7f763          	bgeu	a5,a2,ffffffffc02029fc <pmm_init+0x704>
ffffffffc0202492:	000b3703          	ld	a4,0(s6)
ffffffffc0202496:	fff806b7          	lui	a3,0xfff80
ffffffffc020249a:	97b6                	add	a5,a5,a3
ffffffffc020249c:	079a                	slli	a5,a5,0x6
ffffffffc020249e:	97ba                	add	a5,a5,a4
ffffffffc02024a0:	7ef41763          	bne	s0,a5,ffffffffc0202c8e <pmm_init+0x996>
ffffffffc02024a4:	4018                	lw	a4,0(s0)
ffffffffc02024a6:	4785                	li	a5,1
ffffffffc02024a8:	6cf71763          	bne	a4,a5,ffffffffc0202b76 <pmm_init+0x87e>
ffffffffc02024ac:	6088                	ld	a0,0(s1)
ffffffffc02024ae:	77fd                	lui	a5,0xfffff
ffffffffc02024b0:	6114                	ld	a3,0(a0)
ffffffffc02024b2:	068a                	slli	a3,a3,0x2
ffffffffc02024b4:	8efd                	and	a3,a3,a5
ffffffffc02024b6:	00c6d713          	srli	a4,a3,0xc
ffffffffc02024ba:	6ac77263          	bgeu	a4,a2,ffffffffc0202b5e <pmm_init+0x866>
ffffffffc02024be:	0009ba83          	ld	s5,0(s3)
ffffffffc02024c2:	96d6                	add	a3,a3,s5
ffffffffc02024c4:	0006ba03          	ld	s4,0(a3) # fffffffffff80000 <end+0x3fd48d40>
ffffffffc02024c8:	0a0a                	slli	s4,s4,0x2
ffffffffc02024ca:	00fa7a33          	and	s4,s4,a5
ffffffffc02024ce:	00ca5793          	srli	a5,s4,0xc
ffffffffc02024d2:	66c7f963          	bgeu	a5,a2,ffffffffc0202b44 <pmm_init+0x84c>
ffffffffc02024d6:	4601                	li	a2,0
ffffffffc02024d8:	6585                	lui	a1,0x1
ffffffffc02024da:	9ad2                	add	s5,s5,s4
ffffffffc02024dc:	ffeff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc02024e0:	0aa1                	addi	s5,s5,8
ffffffffc02024e2:	65551163          	bne	a0,s5,ffffffffc0202b24 <pmm_init+0x82c>
ffffffffc02024e6:	4505                	li	a0,1
ffffffffc02024e8:	ee8ff0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc02024ec:	8a2a                	mv	s4,a0
ffffffffc02024ee:	6088                	ld	a0,0(s1)
ffffffffc02024f0:	46d1                	li	a3,20
ffffffffc02024f2:	6605                	lui	a2,0x1
ffffffffc02024f4:	85d2                	mv	a1,s4
ffffffffc02024f6:	d0fff0ef          	jal	ffffffffc0202204 <page_insert>
ffffffffc02024fa:	60051563          	bnez	a0,ffffffffc0202b04 <pmm_init+0x80c>
ffffffffc02024fe:	6088                	ld	a0,0(s1)
ffffffffc0202500:	4601                	li	a2,0
ffffffffc0202502:	6585                	lui	a1,0x1
ffffffffc0202504:	fd6ff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0202508:	5c050e63          	beqz	a0,ffffffffc0202ae4 <pmm_init+0x7ec>
ffffffffc020250c:	611c                	ld	a5,0(a0)
ffffffffc020250e:	0107f713          	andi	a4,a5,16
ffffffffc0202512:	5a070963          	beqz	a4,ffffffffc0202ac4 <pmm_init+0x7cc>
ffffffffc0202516:	8b91                	andi	a5,a5,4
ffffffffc0202518:	4c078263          	beqz	a5,ffffffffc02029dc <pmm_init+0x6e4>
ffffffffc020251c:	6088                	ld	a0,0(s1)
ffffffffc020251e:	611c                	ld	a5,0(a0)
ffffffffc0202520:	8bc1                	andi	a5,a5,16
ffffffffc0202522:	48078d63          	beqz	a5,ffffffffc02029bc <pmm_init+0x6c4>
ffffffffc0202526:	000a2703          	lw	a4,0(s4) # 200000 <_binary_obj___user_exit_out_size+0x1fd6b0>
ffffffffc020252a:	4785                	li	a5,1
ffffffffc020252c:	46f71863          	bne	a4,a5,ffffffffc020299c <pmm_init+0x6a4>
ffffffffc0202530:	4681                	li	a3,0
ffffffffc0202532:	6605                	lui	a2,0x1
ffffffffc0202534:	85a2                	mv	a1,s0
ffffffffc0202536:	ccfff0ef          	jal	ffffffffc0202204 <page_insert>
ffffffffc020253a:	44051163          	bnez	a0,ffffffffc020297c <pmm_init+0x684>
ffffffffc020253e:	4018                	lw	a4,0(s0)
ffffffffc0202540:	4789                	li	a5,2
ffffffffc0202542:	40f71d63          	bne	a4,a5,ffffffffc020295c <pmm_init+0x664>
ffffffffc0202546:	000a2783          	lw	a5,0(s4)
ffffffffc020254a:	3e079963          	bnez	a5,ffffffffc020293c <pmm_init+0x644>
ffffffffc020254e:	6088                	ld	a0,0(s1)
ffffffffc0202550:	4601                	li	a2,0
ffffffffc0202552:	6585                	lui	a1,0x1
ffffffffc0202554:	f86ff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0202558:	3c050263          	beqz	a0,ffffffffc020291c <pmm_init+0x624>
ffffffffc020255c:	6118                	ld	a4,0(a0)
ffffffffc020255e:	00177793          	andi	a5,a4,1
ffffffffc0202562:	48078f63          	beqz	a5,ffffffffc0202a00 <pmm_init+0x708>
ffffffffc0202566:	00093683          	ld	a3,0(s2)
ffffffffc020256a:	00271793          	slli	a5,a4,0x2
ffffffffc020256e:	83b1                	srli	a5,a5,0xc
ffffffffc0202570:	48d7f663          	bgeu	a5,a3,ffffffffc02029fc <pmm_init+0x704>
ffffffffc0202574:	000b3683          	ld	a3,0(s6)
ffffffffc0202578:	fff80637          	lui	a2,0xfff80
ffffffffc020257c:	97b2                	add	a5,a5,a2
ffffffffc020257e:	079a                	slli	a5,a5,0x6
ffffffffc0202580:	97b6                	add	a5,a5,a3
ffffffffc0202582:	36f41d63          	bne	s0,a5,ffffffffc02028fc <pmm_init+0x604>
ffffffffc0202586:	8b41                	andi	a4,a4,16
ffffffffc0202588:	60071763          	bnez	a4,ffffffffc0202b96 <pmm_init+0x89e>
ffffffffc020258c:	6088                	ld	a0,0(s1)
ffffffffc020258e:	4581                	li	a1,0
ffffffffc0202590:	bd9ff0ef          	jal	ffffffffc0202168 <page_remove>
ffffffffc0202594:	4018                	lw	a4,0(s0)
ffffffffc0202596:	4785                	li	a5,1
ffffffffc0202598:	32f71663          	bne	a4,a5,ffffffffc02028c4 <pmm_init+0x5cc>
ffffffffc020259c:	000a2783          	lw	a5,0(s4)
ffffffffc02025a0:	30079263          	bnez	a5,ffffffffc02028a4 <pmm_init+0x5ac>
ffffffffc02025a4:	6088                	ld	a0,0(s1)
ffffffffc02025a6:	6585                	lui	a1,0x1
ffffffffc02025a8:	bc1ff0ef          	jal	ffffffffc0202168 <page_remove>
ffffffffc02025ac:	401c                	lw	a5,0(s0)
ffffffffc02025ae:	2c079b63          	bnez	a5,ffffffffc0202884 <pmm_init+0x58c>
ffffffffc02025b2:	000a2783          	lw	a5,0(s4)
ffffffffc02025b6:	4e079763          	bnez	a5,ffffffffc0202aa4 <pmm_init+0x7ac>
ffffffffc02025ba:	609c                	ld	a5,0(s1)
ffffffffc02025bc:	00093703          	ld	a4,0(s2)
ffffffffc02025c0:	639c                	ld	a5,0(a5)
ffffffffc02025c2:	078a                	slli	a5,a5,0x2
ffffffffc02025c4:	83b1                	srli	a5,a5,0xc
ffffffffc02025c6:	42e7fb63          	bgeu	a5,a4,ffffffffc02029fc <pmm_init+0x704>
ffffffffc02025ca:	fff80737          	lui	a4,0xfff80
ffffffffc02025ce:	000b3503          	ld	a0,0(s6)
ffffffffc02025d2:	97ba                	add	a5,a5,a4
ffffffffc02025d4:	079a                	slli	a5,a5,0x6
ffffffffc02025d6:	953e                	add	a0,a0,a5
ffffffffc02025d8:	4118                	lw	a4,0(a0)
ffffffffc02025da:	4785                	li	a5,1
ffffffffc02025dc:	26f71763          	bne	a4,a5,ffffffffc020284a <pmm_init+0x552>
ffffffffc02025e0:	100027f3          	csrr	a5,sstatus
ffffffffc02025e4:	8b89                	andi	a5,a5,2
ffffffffc02025e6:	1a079263          	bnez	a5,ffffffffc020278a <pmm_init+0x492>
ffffffffc02025ea:	000bb783          	ld	a5,0(s7)
ffffffffc02025ee:	4585                	li	a1,1
ffffffffc02025f0:	739c                	ld	a5,32(a5)
ffffffffc02025f2:	9782                	jalr	a5
ffffffffc02025f4:	609c                	ld	a5,0(s1)
ffffffffc02025f6:	00005517          	auipc	a0,0x5
ffffffffc02025fa:	ce250513          	addi	a0,a0,-798 # ffffffffc02072d8 <etext+0x114c>
ffffffffc02025fe:	c0200437          	lui	s0,0xc0200
ffffffffc0202602:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fdc7d40>
ffffffffc0202606:	b7bfd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020260a:	00093703          	ld	a4,0(s2)
ffffffffc020260e:	7afd                	lui	s5,0xfffff
ffffffffc0202610:	6a05                	lui	s4,0x1
ffffffffc0202612:	00c71793          	slli	a5,a4,0xc
ffffffffc0202616:	02f47c63          	bgeu	s0,a5,ffffffffc020264e <pmm_init+0x356>
ffffffffc020261a:	00c45793          	srli	a5,s0,0xc
ffffffffc020261e:	6088                	ld	a0,0(s1)
ffffffffc0202620:	1ee7f863          	bgeu	a5,a4,ffffffffc0202810 <pmm_init+0x518>
ffffffffc0202624:	0009b583          	ld	a1,0(s3)
ffffffffc0202628:	4601                	li	a2,0
ffffffffc020262a:	95a2                	add	a1,a1,s0
ffffffffc020262c:	eaeff0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0202630:	1c050063          	beqz	a0,ffffffffc02027f0 <pmm_init+0x4f8>
ffffffffc0202634:	611c                	ld	a5,0(a0)
ffffffffc0202636:	078a                	slli	a5,a5,0x2
ffffffffc0202638:	0157f7b3          	and	a5,a5,s5
ffffffffc020263c:	18879a63          	bne	a5,s0,ffffffffc02027d0 <pmm_init+0x4d8>
ffffffffc0202640:	00093703          	ld	a4,0(s2)
ffffffffc0202644:	9452                	add	s0,s0,s4
ffffffffc0202646:	00c71793          	slli	a5,a4,0xc
ffffffffc020264a:	fcf468e3          	bltu	s0,a5,ffffffffc020261a <pmm_init+0x322>
ffffffffc020264e:	609c                	ld	a5,0(s1)
ffffffffc0202650:	639c                	ld	a5,0(a5)
ffffffffc0202652:	5a079e63          	bnez	a5,ffffffffc0202c0e <pmm_init+0x916>
ffffffffc0202656:	4505                	li	a0,1
ffffffffc0202658:	d78ff0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc020265c:	842a                	mv	s0,a0
ffffffffc020265e:	6088                	ld	a0,0(s1)
ffffffffc0202660:	4699                	li	a3,6
ffffffffc0202662:	10000613          	li	a2,256
ffffffffc0202666:	85a2                	mv	a1,s0
ffffffffc0202668:	b9dff0ef          	jal	ffffffffc0202204 <page_insert>
ffffffffc020266c:	58051163          	bnez	a0,ffffffffc0202bee <pmm_init+0x8f6>
ffffffffc0202670:	4018                	lw	a4,0(s0)
ffffffffc0202672:	4785                	li	a5,1
ffffffffc0202674:	1af71b63          	bne	a4,a5,ffffffffc020282a <pmm_init+0x532>
ffffffffc0202678:	6088                	ld	a0,0(s1)
ffffffffc020267a:	6605                	lui	a2,0x1
ffffffffc020267c:	4699                	li	a3,6
ffffffffc020267e:	10060613          	addi	a2,a2,256 # 1100 <_binary_obj___user_faultread_out_size-0xdf0>
ffffffffc0202682:	85a2                	mv	a1,s0
ffffffffc0202684:	b81ff0ef          	jal	ffffffffc0202204 <page_insert>
ffffffffc0202688:	5e051363          	bnez	a0,ffffffffc0202c6e <pmm_init+0x976>
ffffffffc020268c:	4018                	lw	a4,0(s0)
ffffffffc020268e:	4789                	li	a5,2
ffffffffc0202690:	5af71f63          	bne	a4,a5,ffffffffc0202c4e <pmm_init+0x956>
ffffffffc0202694:	00005597          	auipc	a1,0x5
ffffffffc0202698:	d7c58593          	addi	a1,a1,-644 # ffffffffc0207410 <etext+0x1284>
ffffffffc020269c:	10000513          	li	a0,256
ffffffffc02026a0:	263030ef          	jal	ffffffffc0206102 <strcpy>
ffffffffc02026a4:	6585                	lui	a1,0x1
ffffffffc02026a6:	10058593          	addi	a1,a1,256 # 1100 <_binary_obj___user_faultread_out_size-0xdf0>
ffffffffc02026aa:	10000513          	li	a0,256
ffffffffc02026ae:	267030ef          	jal	ffffffffc0206114 <strcmp>
ffffffffc02026b2:	56051e63          	bnez	a0,ffffffffc0202c2e <pmm_init+0x936>
ffffffffc02026b6:	000b3683          	ld	a3,0(s6)
ffffffffc02026ba:	000807b7          	lui	a5,0x80
ffffffffc02026be:	00093703          	ld	a4,0(s2)
ffffffffc02026c2:	40d406b3          	sub	a3,s0,a3
ffffffffc02026c6:	8699                	srai	a3,a3,0x6
ffffffffc02026c8:	96be                	add	a3,a3,a5
ffffffffc02026ca:	00c69793          	slli	a5,a3,0xc
ffffffffc02026ce:	83b1                	srli	a5,a5,0xc
ffffffffc02026d0:	06b2                	slli	a3,a3,0xc
ffffffffc02026d2:	50e7f263          	bgeu	a5,a4,ffffffffc0202bd6 <pmm_init+0x8de>
ffffffffc02026d6:	0009b783          	ld	a5,0(s3)
ffffffffc02026da:	10000513          	li	a0,256
ffffffffc02026de:	97b6                	add	a5,a5,a3
ffffffffc02026e0:	10078023          	sb	zero,256(a5) # 80100 <_binary_obj___user_exit_out_size+0x7d7b0>
ffffffffc02026e4:	1e9030ef          	jal	ffffffffc02060cc <strlen>
ffffffffc02026e8:	4c051763          	bnez	a0,ffffffffc0202bb6 <pmm_init+0x8be>
ffffffffc02026ec:	100027f3          	csrr	a5,sstatus
ffffffffc02026f0:	8b89                	andi	a5,a5,2
ffffffffc02026f2:	e7e1                	bnez	a5,ffffffffc02027ba <pmm_init+0x4c2>
ffffffffc02026f4:	000bb783          	ld	a5,0(s7)
ffffffffc02026f8:	4585                	li	a1,1
ffffffffc02026fa:	8522                	mv	a0,s0
ffffffffc02026fc:	739c                	ld	a5,32(a5)
ffffffffc02026fe:	9782                	jalr	a5
ffffffffc0202700:	609c                	ld	a5,0(s1)
ffffffffc0202702:	00093703          	ld	a4,0(s2)
ffffffffc0202706:	639c                	ld	a5,0(a5)
ffffffffc0202708:	078a                	slli	a5,a5,0x2
ffffffffc020270a:	83b1                	srli	a5,a5,0xc
ffffffffc020270c:	2ee7f863          	bgeu	a5,a4,ffffffffc02029fc <pmm_init+0x704>
ffffffffc0202710:	000b3503          	ld	a0,0(s6)
ffffffffc0202714:	fff80737          	lui	a4,0xfff80
ffffffffc0202718:	97ba                	add	a5,a5,a4
ffffffffc020271a:	079a                	slli	a5,a5,0x6
ffffffffc020271c:	953e                	add	a0,a0,a5
ffffffffc020271e:	100027f3          	csrr	a5,sstatus
ffffffffc0202722:	8b89                	andi	a5,a5,2
ffffffffc0202724:	efbd                	bnez	a5,ffffffffc02027a2 <pmm_init+0x4aa>
ffffffffc0202726:	000bb783          	ld	a5,0(s7)
ffffffffc020272a:	4585                	li	a1,1
ffffffffc020272c:	739c                	ld	a5,32(a5)
ffffffffc020272e:	9782                	jalr	a5
ffffffffc0202730:	609c                	ld	a5,0(s1)
ffffffffc0202732:	00005517          	auipc	a0,0x5
ffffffffc0202736:	d5650513          	addi	a0,a0,-682 # ffffffffc0207488 <etext+0x12fc>
ffffffffc020273a:	0007b023          	sd	zero,0(a5)
ffffffffc020273e:	a43fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0202742:	6446                	ld	s0,80(sp)
ffffffffc0202744:	60e6                	ld	ra,88(sp)
ffffffffc0202746:	64a6                	ld	s1,72(sp)
ffffffffc0202748:	6906                	ld	s2,64(sp)
ffffffffc020274a:	79e2                	ld	s3,56(sp)
ffffffffc020274c:	7a42                	ld	s4,48(sp)
ffffffffc020274e:	7aa2                	ld	s5,40(sp)
ffffffffc0202750:	7b02                	ld	s6,32(sp)
ffffffffc0202752:	6be2                	ld	s7,24(sp)
ffffffffc0202754:	6125                	addi	sp,sp,96
ffffffffc0202756:	a7eff06f          	j	ffffffffc02019d4 <kmalloc_init>
ffffffffc020275a:	6785                	lui	a5,0x1
ffffffffc020275c:	17fd                	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0xef1>
ffffffffc020275e:	96be                	add	a3,a3,a5
ffffffffc0202760:	77fd                	lui	a5,0xfffff
ffffffffc0202762:	8ff5                	and	a5,a5,a3
ffffffffc0202764:	00c7d693          	srli	a3,a5,0xc
ffffffffc0202768:	28c6fa63          	bgeu	a3,a2,ffffffffc02029fc <pmm_init+0x704>
ffffffffc020276c:	000bb603          	ld	a2,0(s7)
ffffffffc0202770:	fff805b7          	lui	a1,0xfff80
ffffffffc0202774:	96ae                	add	a3,a3,a1
ffffffffc0202776:	6a10                	ld	a2,16(a2)
ffffffffc0202778:	8f1d                	sub	a4,a4,a5
ffffffffc020277a:	069a                	slli	a3,a3,0x6
ffffffffc020277c:	00c75593          	srli	a1,a4,0xc
ffffffffc0202780:	9536                	add	a0,a0,a3
ffffffffc0202782:	9602                	jalr	a2
ffffffffc0202784:	0009b583          	ld	a1,0(s3)
ffffffffc0202788:	b18d                	j	ffffffffc02023ea <pmm_init+0xf2>
ffffffffc020278a:	e42a                	sd	a0,8(sp)
ffffffffc020278c:	eb5fd0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0202790:	000bb783          	ld	a5,0(s7)
ffffffffc0202794:	6522                	ld	a0,8(sp)
ffffffffc0202796:	4585                	li	a1,1
ffffffffc0202798:	739c                	ld	a5,32(a5)
ffffffffc020279a:	9782                	jalr	a5
ffffffffc020279c:	e9ffd0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc02027a0:	bd91                	j	ffffffffc02025f4 <pmm_init+0x2fc>
ffffffffc02027a2:	e42a                	sd	a0,8(sp)
ffffffffc02027a4:	e9dfd0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02027a8:	000bb783          	ld	a5,0(s7)
ffffffffc02027ac:	6522                	ld	a0,8(sp)
ffffffffc02027ae:	4585                	li	a1,1
ffffffffc02027b0:	739c                	ld	a5,32(a5)
ffffffffc02027b2:	9782                	jalr	a5
ffffffffc02027b4:	e87fd0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc02027b8:	bfa5                	j	ffffffffc0202730 <pmm_init+0x438>
ffffffffc02027ba:	e87fd0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02027be:	000bb783          	ld	a5,0(s7)
ffffffffc02027c2:	4585                	li	a1,1
ffffffffc02027c4:	8522                	mv	a0,s0
ffffffffc02027c6:	739c                	ld	a5,32(a5)
ffffffffc02027c8:	9782                	jalr	a5
ffffffffc02027ca:	e71fd0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc02027ce:	bf0d                	j	ffffffffc0202700 <pmm_init+0x408>
ffffffffc02027d0:	00005697          	auipc	a3,0x5
ffffffffc02027d4:	b6868693          	addi	a3,a3,-1176 # ffffffffc0207338 <etext+0x11ac>
ffffffffc02027d8:	00004617          	auipc	a2,0x4
ffffffffc02027dc:	03060613          	addi	a2,a2,48 # ffffffffc0206808 <etext+0x67c>
ffffffffc02027e0:	22500593          	li	a1,549
ffffffffc02027e4:	00004517          	auipc	a0,0x4
ffffffffc02027e8:	76450513          	addi	a0,a0,1892 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc02027ec:	c89fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02027f0:	00005697          	auipc	a3,0x5
ffffffffc02027f4:	b0868693          	addi	a3,a3,-1272 # ffffffffc02072f8 <etext+0x116c>
ffffffffc02027f8:	00004617          	auipc	a2,0x4
ffffffffc02027fc:	01060613          	addi	a2,a2,16 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202800:	22400593          	li	a1,548
ffffffffc0202804:	00004517          	auipc	a0,0x4
ffffffffc0202808:	74450513          	addi	a0,a0,1860 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc020280c:	c69fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202810:	86a2                	mv	a3,s0
ffffffffc0202812:	00004617          	auipc	a2,0x4
ffffffffc0202816:	61e60613          	addi	a2,a2,1566 # ffffffffc0206e30 <etext+0xca4>
ffffffffc020281a:	22400593          	li	a1,548
ffffffffc020281e:	00004517          	auipc	a0,0x4
ffffffffc0202822:	72a50513          	addi	a0,a0,1834 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202826:	c4ffd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020282a:	00005697          	auipc	a3,0x5
ffffffffc020282e:	b7668693          	addi	a3,a3,-1162 # ffffffffc02073a0 <etext+0x1214>
ffffffffc0202832:	00004617          	auipc	a2,0x4
ffffffffc0202836:	fd660613          	addi	a2,a2,-42 # ffffffffc0206808 <etext+0x67c>
ffffffffc020283a:	22e00593          	li	a1,558
ffffffffc020283e:	00004517          	auipc	a0,0x4
ffffffffc0202842:	70a50513          	addi	a0,a0,1802 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202846:	c2ffd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020284a:	00005697          	auipc	a3,0x5
ffffffffc020284e:	a6668693          	addi	a3,a3,-1434 # ffffffffc02072b0 <etext+0x1124>
ffffffffc0202852:	00004617          	auipc	a2,0x4
ffffffffc0202856:	fb660613          	addi	a2,a2,-74 # ffffffffc0206808 <etext+0x67c>
ffffffffc020285a:	21900593          	li	a1,537
ffffffffc020285e:	00004517          	auipc	a0,0x4
ffffffffc0202862:	6ea50513          	addi	a0,a0,1770 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202866:	c0ffd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020286a:	86aa                	mv	a3,a0
ffffffffc020286c:	00004617          	auipc	a2,0x4
ffffffffc0202870:	66c60613          	addi	a2,a2,1644 # ffffffffc0206ed8 <etext+0xd4c>
ffffffffc0202874:	0c100593          	li	a1,193
ffffffffc0202878:	00004517          	auipc	a0,0x4
ffffffffc020287c:	6d050513          	addi	a0,a0,1744 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202880:	bf5fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202884:	00005697          	auipc	a3,0x5
ffffffffc0202888:	a1468693          	addi	a3,a3,-1516 # ffffffffc0207298 <etext+0x110c>
ffffffffc020288c:	00004617          	auipc	a2,0x4
ffffffffc0202890:	f7c60613          	addi	a2,a2,-132 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202894:	21600593          	li	a1,534
ffffffffc0202898:	00004517          	auipc	a0,0x4
ffffffffc020289c:	6b050513          	addi	a0,a0,1712 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc02028a0:	bd5fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02028a4:	00005697          	auipc	a3,0x5
ffffffffc02028a8:	9c468693          	addi	a3,a3,-1596 # ffffffffc0207268 <etext+0x10dc>
ffffffffc02028ac:	00004617          	auipc	a2,0x4
ffffffffc02028b0:	f5c60613          	addi	a2,a2,-164 # ffffffffc0206808 <etext+0x67c>
ffffffffc02028b4:	21300593          	li	a1,531
ffffffffc02028b8:	00004517          	auipc	a0,0x4
ffffffffc02028bc:	69050513          	addi	a0,a0,1680 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc02028c0:	bb5fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02028c4:	00005697          	auipc	a3,0x5
ffffffffc02028c8:	86468693          	addi	a3,a3,-1948 # ffffffffc0207128 <etext+0xf9c>
ffffffffc02028cc:	00004617          	auipc	a2,0x4
ffffffffc02028d0:	f3c60613          	addi	a2,a2,-196 # ffffffffc0206808 <etext+0x67c>
ffffffffc02028d4:	21200593          	li	a1,530
ffffffffc02028d8:	00004517          	auipc	a0,0x4
ffffffffc02028dc:	67050513          	addi	a0,a0,1648 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc02028e0:	b95fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02028e4:	00004617          	auipc	a2,0x4
ffffffffc02028e8:	5f460613          	addi	a2,a2,1524 # ffffffffc0206ed8 <etext+0xd4c>
ffffffffc02028ec:	07f00593          	li	a1,127
ffffffffc02028f0:	00004517          	auipc	a0,0x4
ffffffffc02028f4:	65850513          	addi	a0,a0,1624 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc02028f8:	b7dfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02028fc:	00005697          	auipc	a3,0x5
ffffffffc0202900:	81468693          	addi	a3,a3,-2028 # ffffffffc0207110 <etext+0xf84>
ffffffffc0202904:	00004617          	auipc	a2,0x4
ffffffffc0202908:	f0460613          	addi	a2,a2,-252 # ffffffffc0206808 <etext+0x67c>
ffffffffc020290c:	20e00593          	li	a1,526
ffffffffc0202910:	00004517          	auipc	a0,0x4
ffffffffc0202914:	63850513          	addi	a0,a0,1592 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202918:	b5dfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020291c:	00005697          	auipc	a3,0x5
ffffffffc0202920:	88468693          	addi	a3,a3,-1916 # ffffffffc02071a0 <etext+0x1014>
ffffffffc0202924:	00004617          	auipc	a2,0x4
ffffffffc0202928:	ee460613          	addi	a2,a2,-284 # ffffffffc0206808 <etext+0x67c>
ffffffffc020292c:	20d00593          	li	a1,525
ffffffffc0202930:	00004517          	auipc	a0,0x4
ffffffffc0202934:	61850513          	addi	a0,a0,1560 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202938:	b3dfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020293c:	00005697          	auipc	a3,0x5
ffffffffc0202940:	92c68693          	addi	a3,a3,-1748 # ffffffffc0207268 <etext+0x10dc>
ffffffffc0202944:	00004617          	auipc	a2,0x4
ffffffffc0202948:	ec460613          	addi	a2,a2,-316 # ffffffffc0206808 <etext+0x67c>
ffffffffc020294c:	20c00593          	li	a1,524
ffffffffc0202950:	00004517          	auipc	a0,0x4
ffffffffc0202954:	5f850513          	addi	a0,a0,1528 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202958:	b1dfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020295c:	00005697          	auipc	a3,0x5
ffffffffc0202960:	8f468693          	addi	a3,a3,-1804 # ffffffffc0207250 <etext+0x10c4>
ffffffffc0202964:	00004617          	auipc	a2,0x4
ffffffffc0202968:	ea460613          	addi	a2,a2,-348 # ffffffffc0206808 <etext+0x67c>
ffffffffc020296c:	20b00593          	li	a1,523
ffffffffc0202970:	00004517          	auipc	a0,0x4
ffffffffc0202974:	5d850513          	addi	a0,a0,1496 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202978:	afdfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020297c:	00005697          	auipc	a3,0x5
ffffffffc0202980:	8a468693          	addi	a3,a3,-1884 # ffffffffc0207220 <etext+0x1094>
ffffffffc0202984:	00004617          	auipc	a2,0x4
ffffffffc0202988:	e8460613          	addi	a2,a2,-380 # ffffffffc0206808 <etext+0x67c>
ffffffffc020298c:	20a00593          	li	a1,522
ffffffffc0202990:	00004517          	auipc	a0,0x4
ffffffffc0202994:	5b850513          	addi	a0,a0,1464 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202998:	addfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020299c:	00005697          	auipc	a3,0x5
ffffffffc02029a0:	86c68693          	addi	a3,a3,-1940 # ffffffffc0207208 <etext+0x107c>
ffffffffc02029a4:	00004617          	auipc	a2,0x4
ffffffffc02029a8:	e6460613          	addi	a2,a2,-412 # ffffffffc0206808 <etext+0x67c>
ffffffffc02029ac:	20800593          	li	a1,520
ffffffffc02029b0:	00004517          	auipc	a0,0x4
ffffffffc02029b4:	59850513          	addi	a0,a0,1432 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc02029b8:	abdfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02029bc:	00005697          	auipc	a3,0x5
ffffffffc02029c0:	83468693          	addi	a3,a3,-1996 # ffffffffc02071f0 <etext+0x1064>
ffffffffc02029c4:	00004617          	auipc	a2,0x4
ffffffffc02029c8:	e4460613          	addi	a2,a2,-444 # ffffffffc0206808 <etext+0x67c>
ffffffffc02029cc:	20700593          	li	a1,519
ffffffffc02029d0:	00004517          	auipc	a0,0x4
ffffffffc02029d4:	57850513          	addi	a0,a0,1400 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc02029d8:	a9dfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02029dc:	00005697          	auipc	a3,0x5
ffffffffc02029e0:	80468693          	addi	a3,a3,-2044 # ffffffffc02071e0 <etext+0x1054>
ffffffffc02029e4:	00004617          	auipc	a2,0x4
ffffffffc02029e8:	e2460613          	addi	a2,a2,-476 # ffffffffc0206808 <etext+0x67c>
ffffffffc02029ec:	20600593          	li	a1,518
ffffffffc02029f0:	00004517          	auipc	a0,0x4
ffffffffc02029f4:	55850513          	addi	a0,a0,1368 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc02029f8:	a7dfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02029fc:	99cff0ef          	jal	ffffffffc0201b98 <pa2page.part.0>
ffffffffc0202a00:	9b4ff0ef          	jal	ffffffffc0201bb4 <pte2page.part.0>
ffffffffc0202a04:	00004697          	auipc	a3,0x4
ffffffffc0202a08:	6dc68693          	addi	a3,a3,1756 # ffffffffc02070e0 <etext+0xf54>
ffffffffc0202a0c:	00004617          	auipc	a2,0x4
ffffffffc0202a10:	dfc60613          	addi	a2,a2,-516 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202a14:	1fa00593          	li	a1,506
ffffffffc0202a18:	00004517          	auipc	a0,0x4
ffffffffc0202a1c:	53050513          	addi	a0,a0,1328 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202a20:	a55fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202a24:	00004697          	auipc	a3,0x4
ffffffffc0202a28:	68c68693          	addi	a3,a3,1676 # ffffffffc02070b0 <etext+0xf24>
ffffffffc0202a2c:	00004617          	auipc	a2,0x4
ffffffffc0202a30:	ddc60613          	addi	a2,a2,-548 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202a34:	1f700593          	li	a1,503
ffffffffc0202a38:	00004517          	auipc	a0,0x4
ffffffffc0202a3c:	51050513          	addi	a0,a0,1296 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202a40:	a35fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202a44:	00004697          	auipc	a3,0x4
ffffffffc0202a48:	64468693          	addi	a3,a3,1604 # ffffffffc0207088 <etext+0xefc>
ffffffffc0202a4c:	00004617          	auipc	a2,0x4
ffffffffc0202a50:	dbc60613          	addi	a2,a2,-580 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202a54:	1f300593          	li	a1,499
ffffffffc0202a58:	00004517          	auipc	a0,0x4
ffffffffc0202a5c:	4f050513          	addi	a0,a0,1264 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202a60:	a15fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202a64:	00004697          	auipc	a3,0x4
ffffffffc0202a68:	5ec68693          	addi	a3,a3,1516 # ffffffffc0207050 <etext+0xec4>
ffffffffc0202a6c:	00004617          	auipc	a2,0x4
ffffffffc0202a70:	d9c60613          	addi	a2,a2,-612 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202a74:	1f200593          	li	a1,498
ffffffffc0202a78:	00004517          	auipc	a0,0x4
ffffffffc0202a7c:	4d050513          	addi	a0,a0,1232 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202a80:	9f5fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202a84:	00004697          	auipc	a3,0x4
ffffffffc0202a88:	5ac68693          	addi	a3,a3,1452 # ffffffffc0207030 <etext+0xea4>
ffffffffc0202a8c:	00004617          	auipc	a2,0x4
ffffffffc0202a90:	d7c60613          	addi	a2,a2,-644 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202a94:	1f100593          	li	a1,497
ffffffffc0202a98:	00004517          	auipc	a0,0x4
ffffffffc0202a9c:	4b050513          	addi	a0,a0,1200 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202aa0:	9d5fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202aa4:	00004697          	auipc	a3,0x4
ffffffffc0202aa8:	7c468693          	addi	a3,a3,1988 # ffffffffc0207268 <etext+0x10dc>
ffffffffc0202aac:	00004617          	auipc	a2,0x4
ffffffffc0202ab0:	d5c60613          	addi	a2,a2,-676 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202ab4:	21700593          	li	a1,535
ffffffffc0202ab8:	00004517          	auipc	a0,0x4
ffffffffc0202abc:	49050513          	addi	a0,a0,1168 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202ac0:	9b5fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202ac4:	00004697          	auipc	a3,0x4
ffffffffc0202ac8:	70c68693          	addi	a3,a3,1804 # ffffffffc02071d0 <etext+0x1044>
ffffffffc0202acc:	00004617          	auipc	a2,0x4
ffffffffc0202ad0:	d3c60613          	addi	a2,a2,-708 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202ad4:	20500593          	li	a1,517
ffffffffc0202ad8:	00004517          	auipc	a0,0x4
ffffffffc0202adc:	47050513          	addi	a0,a0,1136 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202ae0:	995fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202ae4:	00004697          	auipc	a3,0x4
ffffffffc0202ae8:	6bc68693          	addi	a3,a3,1724 # ffffffffc02071a0 <etext+0x1014>
ffffffffc0202aec:	00004617          	auipc	a2,0x4
ffffffffc0202af0:	d1c60613          	addi	a2,a2,-740 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202af4:	20400593          	li	a1,516
ffffffffc0202af8:	00004517          	auipc	a0,0x4
ffffffffc0202afc:	45050513          	addi	a0,a0,1104 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202b00:	975fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202b04:	00004697          	auipc	a3,0x4
ffffffffc0202b08:	66468693          	addi	a3,a3,1636 # ffffffffc0207168 <etext+0xfdc>
ffffffffc0202b0c:	00004617          	auipc	a2,0x4
ffffffffc0202b10:	cfc60613          	addi	a2,a2,-772 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202b14:	20300593          	li	a1,515
ffffffffc0202b18:	00004517          	auipc	a0,0x4
ffffffffc0202b1c:	43050513          	addi	a0,a0,1072 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202b20:	955fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202b24:	00004697          	auipc	a3,0x4
ffffffffc0202b28:	61c68693          	addi	a3,a3,1564 # ffffffffc0207140 <etext+0xfb4>
ffffffffc0202b2c:	00004617          	auipc	a2,0x4
ffffffffc0202b30:	cdc60613          	addi	a2,a2,-804 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202b34:	20000593          	li	a1,512
ffffffffc0202b38:	00004517          	auipc	a0,0x4
ffffffffc0202b3c:	41050513          	addi	a0,a0,1040 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202b40:	935fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202b44:	86d2                	mv	a3,s4
ffffffffc0202b46:	00004617          	auipc	a2,0x4
ffffffffc0202b4a:	2ea60613          	addi	a2,a2,746 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0202b4e:	1ff00593          	li	a1,511
ffffffffc0202b52:	00004517          	auipc	a0,0x4
ffffffffc0202b56:	3f650513          	addi	a0,a0,1014 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202b5a:	91bfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202b5e:	00004617          	auipc	a2,0x4
ffffffffc0202b62:	2d260613          	addi	a2,a2,722 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0202b66:	1fe00593          	li	a1,510
ffffffffc0202b6a:	00004517          	auipc	a0,0x4
ffffffffc0202b6e:	3de50513          	addi	a0,a0,990 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202b72:	903fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202b76:	00004697          	auipc	a3,0x4
ffffffffc0202b7a:	5b268693          	addi	a3,a3,1458 # ffffffffc0207128 <etext+0xf9c>
ffffffffc0202b7e:	00004617          	auipc	a2,0x4
ffffffffc0202b82:	c8a60613          	addi	a2,a2,-886 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202b86:	1fc00593          	li	a1,508
ffffffffc0202b8a:	00004517          	auipc	a0,0x4
ffffffffc0202b8e:	3be50513          	addi	a0,a0,958 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202b92:	8e3fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202b96:	00004697          	auipc	a3,0x4
ffffffffc0202b9a:	6ea68693          	addi	a3,a3,1770 # ffffffffc0207280 <etext+0x10f4>
ffffffffc0202b9e:	00004617          	auipc	a2,0x4
ffffffffc0202ba2:	c6a60613          	addi	a2,a2,-918 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202ba6:	20f00593          	li	a1,527
ffffffffc0202baa:	00004517          	auipc	a0,0x4
ffffffffc0202bae:	39e50513          	addi	a0,a0,926 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202bb2:	8c3fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202bb6:	00005697          	auipc	a3,0x5
ffffffffc0202bba:	8aa68693          	addi	a3,a3,-1878 # ffffffffc0207460 <etext+0x12d4>
ffffffffc0202bbe:	00004617          	auipc	a2,0x4
ffffffffc0202bc2:	c4a60613          	addi	a2,a2,-950 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202bc6:	23700593          	li	a1,567
ffffffffc0202bca:	00004517          	auipc	a0,0x4
ffffffffc0202bce:	37e50513          	addi	a0,a0,894 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202bd2:	8a3fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202bd6:	00004617          	auipc	a2,0x4
ffffffffc0202bda:	25a60613          	addi	a2,a2,602 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0202bde:	06900593          	li	a1,105
ffffffffc0202be2:	00004517          	auipc	a0,0x4
ffffffffc0202be6:	27650513          	addi	a0,a0,630 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0202bea:	88bfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202bee:	00004697          	auipc	a3,0x4
ffffffffc0202bf2:	77a68693          	addi	a3,a3,1914 # ffffffffc0207368 <etext+0x11dc>
ffffffffc0202bf6:	00004617          	auipc	a2,0x4
ffffffffc0202bfa:	c1260613          	addi	a2,a2,-1006 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202bfe:	22d00593          	li	a1,557
ffffffffc0202c02:	00004517          	auipc	a0,0x4
ffffffffc0202c06:	34650513          	addi	a0,a0,838 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202c0a:	86bfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202c0e:	00004697          	auipc	a3,0x4
ffffffffc0202c12:	74268693          	addi	a3,a3,1858 # ffffffffc0207350 <etext+0x11c4>
ffffffffc0202c16:	00004617          	auipc	a2,0x4
ffffffffc0202c1a:	bf260613          	addi	a2,a2,-1038 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202c1e:	22900593          	li	a1,553
ffffffffc0202c22:	00004517          	auipc	a0,0x4
ffffffffc0202c26:	32650513          	addi	a0,a0,806 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202c2a:	84bfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202c2e:	00004697          	auipc	a3,0x4
ffffffffc0202c32:	7fa68693          	addi	a3,a3,2042 # ffffffffc0207428 <etext+0x129c>
ffffffffc0202c36:	00004617          	auipc	a2,0x4
ffffffffc0202c3a:	bd260613          	addi	a2,a2,-1070 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202c3e:	23400593          	li	a1,564
ffffffffc0202c42:	00004517          	auipc	a0,0x4
ffffffffc0202c46:	30650513          	addi	a0,a0,774 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202c4a:	82bfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202c4e:	00004697          	auipc	a3,0x4
ffffffffc0202c52:	7aa68693          	addi	a3,a3,1962 # ffffffffc02073f8 <etext+0x126c>
ffffffffc0202c56:	00004617          	auipc	a2,0x4
ffffffffc0202c5a:	bb260613          	addi	a2,a2,-1102 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202c5e:	23000593          	li	a1,560
ffffffffc0202c62:	00004517          	auipc	a0,0x4
ffffffffc0202c66:	2e650513          	addi	a0,a0,742 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202c6a:	80bfd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202c6e:	00004697          	auipc	a3,0x4
ffffffffc0202c72:	74a68693          	addi	a3,a3,1866 # ffffffffc02073b8 <etext+0x122c>
ffffffffc0202c76:	00004617          	auipc	a2,0x4
ffffffffc0202c7a:	b9260613          	addi	a2,a2,-1134 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202c7e:	22f00593          	li	a1,559
ffffffffc0202c82:	00004517          	auipc	a0,0x4
ffffffffc0202c86:	2c650513          	addi	a0,a0,710 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202c8a:	feafd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202c8e:	00004697          	auipc	a3,0x4
ffffffffc0202c92:	48268693          	addi	a3,a3,1154 # ffffffffc0207110 <etext+0xf84>
ffffffffc0202c96:	00004617          	auipc	a2,0x4
ffffffffc0202c9a:	b7260613          	addi	a2,a2,-1166 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202c9e:	1fb00593          	li	a1,507
ffffffffc0202ca2:	00004517          	auipc	a0,0x4
ffffffffc0202ca6:	2a650513          	addi	a0,a0,678 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202caa:	fcafd0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0202cae <copy_range>:
ffffffffc0202cae:	7159                	addi	sp,sp,-112
ffffffffc0202cb0:	00d667b3          	or	a5,a2,a3
ffffffffc0202cb4:	f486                	sd	ra,104(sp)
ffffffffc0202cb6:	f0a2                	sd	s0,96(sp)
ffffffffc0202cb8:	eca6                	sd	s1,88(sp)
ffffffffc0202cba:	e8ca                	sd	s2,80(sp)
ffffffffc0202cbc:	e4ce                	sd	s3,72(sp)
ffffffffc0202cbe:	e0d2                	sd	s4,64(sp)
ffffffffc0202cc0:	fc56                	sd	s5,56(sp)
ffffffffc0202cc2:	f85a                	sd	s6,48(sp)
ffffffffc0202cc4:	f45e                	sd	s7,40(sp)
ffffffffc0202cc6:	f062                	sd	s8,32(sp)
ffffffffc0202cc8:	ec66                	sd	s9,24(sp)
ffffffffc0202cca:	e86a                	sd	s10,16(sp)
ffffffffc0202ccc:	e46e                	sd	s11,8(sp)
ffffffffc0202cce:	17d2                	slli	a5,a5,0x34
ffffffffc0202cd0:	1e079563          	bnez	a5,ffffffffc0202eba <copy_range+0x20c>
ffffffffc0202cd4:	002007b7          	lui	a5,0x200
ffffffffc0202cd8:	8432                	mv	s0,a2
ffffffffc0202cda:	16f66863          	bltu	a2,a5,ffffffffc0202e4a <copy_range+0x19c>
ffffffffc0202cde:	8936                	mv	s2,a3
ffffffffc0202ce0:	16d67563          	bgeu	a2,a3,ffffffffc0202e4a <copy_range+0x19c>
ffffffffc0202ce4:	4785                	li	a5,1
ffffffffc0202ce6:	07fe                	slli	a5,a5,0x1f
ffffffffc0202ce8:	16d7e163          	bltu	a5,a3,ffffffffc0202e4a <copy_range+0x19c>
ffffffffc0202cec:	5b7d                	li	s6,-1
ffffffffc0202cee:	8aaa                	mv	s5,a0
ffffffffc0202cf0:	89ae                	mv	s3,a1
ffffffffc0202cf2:	6a05                	lui	s4,0x1
ffffffffc0202cf4:	00034c97          	auipc	s9,0x34
ffffffffc0202cf8:	574c8c93          	addi	s9,s9,1396 # ffffffffc0237268 <npage>
ffffffffc0202cfc:	00034c17          	auipc	s8,0x34
ffffffffc0202d00:	574c0c13          	addi	s8,s8,1396 # ffffffffc0237270 <pages>
ffffffffc0202d04:	00080bb7          	lui	s7,0x80
ffffffffc0202d08:	00cb5b13          	srli	s6,s6,0xc
ffffffffc0202d0c:	4601                	li	a2,0
ffffffffc0202d0e:	85a2                	mv	a1,s0
ffffffffc0202d10:	854e                	mv	a0,s3
ffffffffc0202d12:	fc9fe0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0202d16:	84aa                	mv	s1,a0
ffffffffc0202d18:	c17d                	beqz	a0,ffffffffc0202dfe <copy_range+0x150>
ffffffffc0202d1a:	611c                	ld	a5,0(a0)
ffffffffc0202d1c:	8b85                	andi	a5,a5,1
ffffffffc0202d1e:	e78d                	bnez	a5,ffffffffc0202d48 <copy_range+0x9a>
ffffffffc0202d20:	9452                	add	s0,s0,s4
ffffffffc0202d22:	c019                	beqz	s0,ffffffffc0202d28 <copy_range+0x7a>
ffffffffc0202d24:	ff2464e3          	bltu	s0,s2,ffffffffc0202d0c <copy_range+0x5e>
ffffffffc0202d28:	4501                	li	a0,0
ffffffffc0202d2a:	70a6                	ld	ra,104(sp)
ffffffffc0202d2c:	7406                	ld	s0,96(sp)
ffffffffc0202d2e:	64e6                	ld	s1,88(sp)
ffffffffc0202d30:	6946                	ld	s2,80(sp)
ffffffffc0202d32:	69a6                	ld	s3,72(sp)
ffffffffc0202d34:	6a06                	ld	s4,64(sp)
ffffffffc0202d36:	7ae2                	ld	s5,56(sp)
ffffffffc0202d38:	7b42                	ld	s6,48(sp)
ffffffffc0202d3a:	7ba2                	ld	s7,40(sp)
ffffffffc0202d3c:	7c02                	ld	s8,32(sp)
ffffffffc0202d3e:	6ce2                	ld	s9,24(sp)
ffffffffc0202d40:	6d42                	ld	s10,16(sp)
ffffffffc0202d42:	6da2                	ld	s11,8(sp)
ffffffffc0202d44:	6165                	addi	sp,sp,112
ffffffffc0202d46:	8082                	ret
ffffffffc0202d48:	4605                	li	a2,1
ffffffffc0202d4a:	85a2                	mv	a1,s0
ffffffffc0202d4c:	8556                	mv	a0,s5
ffffffffc0202d4e:	f8dfe0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0202d52:	cd4d                	beqz	a0,ffffffffc0202e0c <copy_range+0x15e>
ffffffffc0202d54:	609c                	ld	a5,0(s1)
ffffffffc0202d56:	0017f713          	andi	a4,a5,1
ffffffffc0202d5a:	01f7f493          	andi	s1,a5,31
ffffffffc0202d5e:	14070263          	beqz	a4,ffffffffc0202ea2 <copy_range+0x1f4>
ffffffffc0202d62:	000cb683          	ld	a3,0(s9)
ffffffffc0202d66:	078a                	slli	a5,a5,0x2
ffffffffc0202d68:	00c7d713          	srli	a4,a5,0xc
ffffffffc0202d6c:	10d77f63          	bgeu	a4,a3,ffffffffc0202e8a <copy_range+0x1dc>
ffffffffc0202d70:	000c3783          	ld	a5,0(s8)
ffffffffc0202d74:	fff806b7          	lui	a3,0xfff80
ffffffffc0202d78:	9736                	add	a4,a4,a3
ffffffffc0202d7a:	071a                	slli	a4,a4,0x6
ffffffffc0202d7c:	4505                	li	a0,1
ffffffffc0202d7e:	00e78db3          	add	s11,a5,a4
ffffffffc0202d82:	e4ffe0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0202d86:	8d2a                	mv	s10,a0
ffffffffc0202d88:	0a0d8163          	beqz	s11,ffffffffc0202e2a <copy_range+0x17c>
ffffffffc0202d8c:	cd79                	beqz	a0,ffffffffc0202e6a <copy_range+0x1bc>
ffffffffc0202d8e:	000c3703          	ld	a4,0(s8)
ffffffffc0202d92:	000cb603          	ld	a2,0(s9)
ffffffffc0202d96:	40ed86b3          	sub	a3,s11,a4
ffffffffc0202d9a:	8699                	srai	a3,a3,0x6
ffffffffc0202d9c:	96de                	add	a3,a3,s7
ffffffffc0202d9e:	0166f7b3          	and	a5,a3,s6
ffffffffc0202da2:	06b2                	slli	a3,a3,0xc
ffffffffc0202da4:	06c7f763          	bgeu	a5,a2,ffffffffc0202e12 <copy_range+0x164>
ffffffffc0202da8:	40e507b3          	sub	a5,a0,a4
ffffffffc0202dac:	00034717          	auipc	a4,0x34
ffffffffc0202db0:	4b470713          	addi	a4,a4,1204 # ffffffffc0237260 <va_pa_offset>
ffffffffc0202db4:	6308                	ld	a0,0(a4)
ffffffffc0202db6:	8799                	srai	a5,a5,0x6
ffffffffc0202db8:	97de                	add	a5,a5,s7
ffffffffc0202dba:	0167f733          	and	a4,a5,s6
ffffffffc0202dbe:	00a685b3          	add	a1,a3,a0
ffffffffc0202dc2:	07b2                	slli	a5,a5,0xc
ffffffffc0202dc4:	04c77663          	bgeu	a4,a2,ffffffffc0202e10 <copy_range+0x162>
ffffffffc0202dc8:	6605                	lui	a2,0x1
ffffffffc0202dca:	953e                	add	a0,a0,a5
ffffffffc0202dcc:	3a8030ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc0202dd0:	86a6                	mv	a3,s1
ffffffffc0202dd2:	8622                	mv	a2,s0
ffffffffc0202dd4:	85ea                	mv	a1,s10
ffffffffc0202dd6:	8556                	mv	a0,s5
ffffffffc0202dd8:	c2cff0ef          	jal	ffffffffc0202204 <page_insert>
ffffffffc0202ddc:	d131                	beqz	a0,ffffffffc0202d20 <copy_range+0x72>
ffffffffc0202dde:	00004697          	auipc	a3,0x4
ffffffffc0202de2:	6ea68693          	addi	a3,a3,1770 # ffffffffc02074c8 <etext+0x133c>
ffffffffc0202de6:	00004617          	auipc	a2,0x4
ffffffffc0202dea:	a2260613          	addi	a2,a2,-1502 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202dee:	19700593          	li	a1,407
ffffffffc0202df2:	00004517          	auipc	a0,0x4
ffffffffc0202df6:	15650513          	addi	a0,a0,342 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202dfa:	e7afd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202dfe:	002007b7          	lui	a5,0x200
ffffffffc0202e02:	97a2                	add	a5,a5,s0
ffffffffc0202e04:	ffe00437          	lui	s0,0xffe00
ffffffffc0202e08:	8c7d                	and	s0,s0,a5
ffffffffc0202e0a:	bf21                	j	ffffffffc0202d22 <copy_range+0x74>
ffffffffc0202e0c:	5571                	li	a0,-4
ffffffffc0202e0e:	bf31                	j	ffffffffc0202d2a <copy_range+0x7c>
ffffffffc0202e10:	86be                	mv	a3,a5
ffffffffc0202e12:	00004617          	auipc	a2,0x4
ffffffffc0202e16:	01e60613          	addi	a2,a2,30 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0202e1a:	06900593          	li	a1,105
ffffffffc0202e1e:	00004517          	auipc	a0,0x4
ffffffffc0202e22:	03a50513          	addi	a0,a0,58 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0202e26:	e4efd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202e2a:	00004697          	auipc	a3,0x4
ffffffffc0202e2e:	67e68693          	addi	a3,a3,1662 # ffffffffc02074a8 <etext+0x131c>
ffffffffc0202e32:	00004617          	auipc	a2,0x4
ffffffffc0202e36:	9d660613          	addi	a2,a2,-1578 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202e3a:	17e00593          	li	a1,382
ffffffffc0202e3e:	00004517          	auipc	a0,0x4
ffffffffc0202e42:	10a50513          	addi	a0,a0,266 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202e46:	e2efd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202e4a:	00004697          	auipc	a3,0x4
ffffffffc0202e4e:	13e68693          	addi	a3,a3,318 # ffffffffc0206f88 <etext+0xdfc>
ffffffffc0202e52:	00004617          	auipc	a2,0x4
ffffffffc0202e56:	9b660613          	addi	a2,a2,-1610 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202e5a:	16a00593          	li	a1,362
ffffffffc0202e5e:	00004517          	auipc	a0,0x4
ffffffffc0202e62:	0ea50513          	addi	a0,a0,234 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202e66:	e0efd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202e6a:	00004697          	auipc	a3,0x4
ffffffffc0202e6e:	64e68693          	addi	a3,a3,1614 # ffffffffc02074b8 <etext+0x132c>
ffffffffc0202e72:	00004617          	auipc	a2,0x4
ffffffffc0202e76:	99660613          	addi	a2,a2,-1642 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202e7a:	17f00593          	li	a1,383
ffffffffc0202e7e:	00004517          	auipc	a0,0x4
ffffffffc0202e82:	0ca50513          	addi	a0,a0,202 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202e86:	deefd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202e8a:	00004617          	auipc	a2,0x4
ffffffffc0202e8e:	07660613          	addi	a2,a2,118 # ffffffffc0206f00 <etext+0xd74>
ffffffffc0202e92:	06200593          	li	a1,98
ffffffffc0202e96:	00004517          	auipc	a0,0x4
ffffffffc0202e9a:	fc250513          	addi	a0,a0,-62 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0202e9e:	dd6fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202ea2:	00004617          	auipc	a2,0x4
ffffffffc0202ea6:	07e60613          	addi	a2,a2,126 # ffffffffc0206f20 <etext+0xd94>
ffffffffc0202eaa:	07400593          	li	a1,116
ffffffffc0202eae:	00004517          	auipc	a0,0x4
ffffffffc0202eb2:	faa50513          	addi	a0,a0,-86 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0202eb6:	dbefd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0202eba:	00004697          	auipc	a3,0x4
ffffffffc0202ebe:	09e68693          	addi	a3,a3,158 # ffffffffc0206f58 <etext+0xdcc>
ffffffffc0202ec2:	00004617          	auipc	a2,0x4
ffffffffc0202ec6:	94660613          	addi	a2,a2,-1722 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202eca:	16900593          	li	a1,361
ffffffffc0202ece:	00004517          	auipc	a0,0x4
ffffffffc0202ed2:	07a50513          	addi	a0,a0,122 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202ed6:	d9efd0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0202eda <tlb_invalidate>:
ffffffffc0202eda:	12058073          	sfence.vma	a1
ffffffffc0202ede:	8082                	ret

ffffffffc0202ee0 <pgdir_alloc_page>:
ffffffffc0202ee0:	7179                	addi	sp,sp,-48
ffffffffc0202ee2:	e84a                	sd	s2,16(sp)
ffffffffc0202ee4:	892a                	mv	s2,a0
ffffffffc0202ee6:	4505                	li	a0,1
ffffffffc0202ee8:	ec26                	sd	s1,24(sp)
ffffffffc0202eea:	e44e                	sd	s3,8(sp)
ffffffffc0202eec:	f406                	sd	ra,40(sp)
ffffffffc0202eee:	f022                	sd	s0,32(sp)
ffffffffc0202ef0:	84ae                	mv	s1,a1
ffffffffc0202ef2:	89b2                	mv	s3,a2
ffffffffc0202ef4:	cddfe0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0202ef8:	c12d                	beqz	a0,ffffffffc0202f5a <pgdir_alloc_page+0x7a>
ffffffffc0202efa:	842a                	mv	s0,a0
ffffffffc0202efc:	85aa                	mv	a1,a0
ffffffffc0202efe:	86ce                	mv	a3,s3
ffffffffc0202f00:	8626                	mv	a2,s1
ffffffffc0202f02:	854a                	mv	a0,s2
ffffffffc0202f04:	b00ff0ef          	jal	ffffffffc0202204 <page_insert>
ffffffffc0202f08:	ed0d                	bnez	a0,ffffffffc0202f42 <pgdir_alloc_page+0x62>
ffffffffc0202f0a:	00034797          	auipc	a5,0x34
ffffffffc0202f0e:	36e7a783          	lw	a5,878(a5) # ffffffffc0237278 <swap_init_ok>
ffffffffc0202f12:	c385                	beqz	a5,ffffffffc0202f32 <pgdir_alloc_page+0x52>
ffffffffc0202f14:	00034517          	auipc	a0,0x34
ffffffffc0202f18:	38453503          	ld	a0,900(a0) # ffffffffc0237298 <check_mm_struct>
ffffffffc0202f1c:	c919                	beqz	a0,ffffffffc0202f32 <pgdir_alloc_page+0x52>
ffffffffc0202f1e:	4681                	li	a3,0
ffffffffc0202f20:	8622                	mv	a2,s0
ffffffffc0202f22:	85a6                	mv	a1,s1
ffffffffc0202f24:	74a000ef          	jal	ffffffffc020366e <swap_map_swappable>
ffffffffc0202f28:	4018                	lw	a4,0(s0)
ffffffffc0202f2a:	fc04                	sd	s1,56(s0)
ffffffffc0202f2c:	4785                	li	a5,1
ffffffffc0202f2e:	04f71663          	bne	a4,a5,ffffffffc0202f7a <pgdir_alloc_page+0x9a>
ffffffffc0202f32:	70a2                	ld	ra,40(sp)
ffffffffc0202f34:	8522                	mv	a0,s0
ffffffffc0202f36:	7402                	ld	s0,32(sp)
ffffffffc0202f38:	64e2                	ld	s1,24(sp)
ffffffffc0202f3a:	6942                	ld	s2,16(sp)
ffffffffc0202f3c:	69a2                	ld	s3,8(sp)
ffffffffc0202f3e:	6145                	addi	sp,sp,48
ffffffffc0202f40:	8082                	ret
ffffffffc0202f42:	100027f3          	csrr	a5,sstatus
ffffffffc0202f46:	8b89                	andi	a5,a5,2
ffffffffc0202f48:	eb99                	bnez	a5,ffffffffc0202f5e <pgdir_alloc_page+0x7e>
ffffffffc0202f4a:	00034797          	auipc	a5,0x34
ffffffffc0202f4e:	2fe7b783          	ld	a5,766(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc0202f52:	739c                	ld	a5,32(a5)
ffffffffc0202f54:	4585                	li	a1,1
ffffffffc0202f56:	8522                	mv	a0,s0
ffffffffc0202f58:	9782                	jalr	a5
ffffffffc0202f5a:	4401                	li	s0,0
ffffffffc0202f5c:	bfd9                	j	ffffffffc0202f32 <pgdir_alloc_page+0x52>
ffffffffc0202f5e:	ee2fd0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0202f62:	00034797          	auipc	a5,0x34
ffffffffc0202f66:	2e67b783          	ld	a5,742(a5) # ffffffffc0237248 <pmm_manager>
ffffffffc0202f6a:	739c                	ld	a5,32(a5)
ffffffffc0202f6c:	8522                	mv	a0,s0
ffffffffc0202f6e:	4585                	li	a1,1
ffffffffc0202f70:	9782                	jalr	a5
ffffffffc0202f72:	4401                	li	s0,0
ffffffffc0202f74:	ec6fd0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0202f78:	bf6d                	j	ffffffffc0202f32 <pgdir_alloc_page+0x52>
ffffffffc0202f7a:	00004697          	auipc	a3,0x4
ffffffffc0202f7e:	55e68693          	addi	a3,a3,1374 # ffffffffc02074d8 <etext+0x134c>
ffffffffc0202f82:	00004617          	auipc	a2,0x4
ffffffffc0202f86:	88660613          	addi	a2,a2,-1914 # ffffffffc0206808 <etext+0x67c>
ffffffffc0202f8a:	1d600593          	li	a1,470
ffffffffc0202f8e:	00004517          	auipc	a0,0x4
ffffffffc0202f92:	fba50513          	addi	a0,a0,-70 # ffffffffc0206f48 <etext+0xdbc>
ffffffffc0202f96:	cdefd0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0202f9a <swap_init>:
ffffffffc0202f9a:	7135                	addi	sp,sp,-160
ffffffffc0202f9c:	ed06                	sd	ra,152(sp)
ffffffffc0202f9e:	69c010ef          	jal	ffffffffc020463a <swapfs_init>
ffffffffc0202fa2:	00034697          	auipc	a3,0x34
ffffffffc0202fa6:	2de6b683          	ld	a3,734(a3) # ffffffffc0237280 <max_swap_offset>
ffffffffc0202faa:	010007b7          	lui	a5,0x1000
ffffffffc0202fae:	ff968713          	addi	a4,a3,-7
ffffffffc0202fb2:	17e1                	addi	a5,a5,-8 # fffff8 <_binary_obj___user_exit_out_size+0xffd6a8>
ffffffffc0202fb4:	42e7ef63          	bltu	a5,a4,ffffffffc02033f2 <swap_init+0x458>
ffffffffc0202fb8:	00029797          	auipc	a5,0x29
ffffffffc0202fbc:	d5878793          	addi	a5,a5,-680 # ffffffffc022bd10 <swap_manager_fifo>
ffffffffc0202fc0:	6798                	ld	a4,8(a5)
ffffffffc0202fc2:	e14a                	sd	s2,128(sp)
ffffffffc0202fc4:	f0da                	sd	s6,96(sp)
ffffffffc0202fc6:	00034b17          	auipc	s6,0x34
ffffffffc0202fca:	2c2b0b13          	addi	s6,s6,706 # ffffffffc0237288 <sm>
ffffffffc0202fce:	00fb3023          	sd	a5,0(s6)
ffffffffc0202fd2:	9702                	jalr	a4
ffffffffc0202fd4:	892a                	mv	s2,a0
ffffffffc0202fd6:	c519                	beqz	a0,ffffffffc0202fe4 <swap_init+0x4a>
ffffffffc0202fd8:	60ea                	ld	ra,152(sp)
ffffffffc0202fda:	7b06                	ld	s6,96(sp)
ffffffffc0202fdc:	854a                	mv	a0,s2
ffffffffc0202fde:	690a                	ld	s2,128(sp)
ffffffffc0202fe0:	610d                	addi	sp,sp,160
ffffffffc0202fe2:	8082                	ret
ffffffffc0202fe4:	000b3783          	ld	a5,0(s6)
ffffffffc0202fe8:	00004517          	auipc	a0,0x4
ffffffffc0202fec:	53850513          	addi	a0,a0,1336 # ffffffffc0207520 <etext+0x1394>
ffffffffc0202ff0:	e922                	sd	s0,144(sp)
ffffffffc0202ff2:	638c                	ld	a1,0(a5)
ffffffffc0202ff4:	4785                	li	a5,1
ffffffffc0202ff6:	e0ea                	sd	s10,64(sp)
ffffffffc0202ff8:	fc6e                	sd	s11,56(sp)
ffffffffc0202ffa:	00034717          	auipc	a4,0x34
ffffffffc0202ffe:	26f72f23          	sw	a5,638(a4) # ffffffffc0237278 <swap_init_ok>
ffffffffc0203002:	e526                	sd	s1,136(sp)
ffffffffc0203004:	fcce                	sd	s3,120(sp)
ffffffffc0203006:	f8d2                	sd	s4,112(sp)
ffffffffc0203008:	f4d6                	sd	s5,104(sp)
ffffffffc020300a:	ecde                	sd	s7,88(sp)
ffffffffc020300c:	e8e2                	sd	s8,80(sp)
ffffffffc020300e:	e4e6                	sd	s9,72(sp)
ffffffffc0203010:	00030417          	auipc	s0,0x30
ffffffffc0203014:	15040413          	addi	s0,s0,336 # ffffffffc0233160 <free_area>
ffffffffc0203018:	968fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020301c:	641c                	ld	a5,8(s0)
ffffffffc020301e:	4d01                	li	s10,0
ffffffffc0203020:	4d81                	li	s11,0
ffffffffc0203022:	30878e63          	beq	a5,s0,ffffffffc020333e <swap_init+0x3a4>
ffffffffc0203026:	ff07b703          	ld	a4,-16(a5)
ffffffffc020302a:	8b09                	andi	a4,a4,2
ffffffffc020302c:	30070b63          	beqz	a4,ffffffffc0203342 <swap_init+0x3a8>
ffffffffc0203030:	ff87a703          	lw	a4,-8(a5)
ffffffffc0203034:	679c                	ld	a5,8(a5)
ffffffffc0203036:	2d85                	addiw	s11,s11,1
ffffffffc0203038:	01a70d3b          	addw	s10,a4,s10
ffffffffc020303c:	fe8795e3          	bne	a5,s0,ffffffffc0203026 <swap_init+0x8c>
ffffffffc0203040:	84ea                	mv	s1,s10
ffffffffc0203042:	c5ffe0ef          	jal	ffffffffc0201ca0 <nr_free_pages>
ffffffffc0203046:	4c951e63          	bne	a0,s1,ffffffffc0203522 <swap_init+0x588>
ffffffffc020304a:	866a                	mv	a2,s10
ffffffffc020304c:	85ee                	mv	a1,s11
ffffffffc020304e:	00004517          	auipc	a0,0x4
ffffffffc0203052:	4ea50513          	addi	a0,a0,1258 # ffffffffc0207538 <etext+0x13ac>
ffffffffc0203056:	92afd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020305a:	3b7000ef          	jal	ffffffffc0203c10 <mm_create>
ffffffffc020305e:	ec2a                	sd	a0,24(sp)
ffffffffc0203060:	5a050163          	beqz	a0,ffffffffc0203602 <swap_init+0x668>
ffffffffc0203064:	00034797          	auipc	a5,0x34
ffffffffc0203068:	23478793          	addi	a5,a5,564 # ffffffffc0237298 <check_mm_struct>
ffffffffc020306c:	6398                	ld	a4,0(a5)
ffffffffc020306e:	5a071a63          	bnez	a4,ffffffffc0203622 <swap_init+0x688>
ffffffffc0203072:	66e2                	ld	a3,24(sp)
ffffffffc0203074:	00034a97          	auipc	s5,0x34
ffffffffc0203078:	1e4aba83          	ld	s5,484(s5) # ffffffffc0237258 <boot_pgdir>
ffffffffc020307c:	000ab703          	ld	a4,0(s5)
ffffffffc0203080:	e394                	sd	a3,0(a5)
ffffffffc0203082:	0156bc23          	sd	s5,24(a3)
ffffffffc0203086:	42071e63          	bnez	a4,ffffffffc02034c2 <swap_init+0x528>
ffffffffc020308a:	6599                	lui	a1,0x6
ffffffffc020308c:	460d                	li	a2,3
ffffffffc020308e:	6505                	lui	a0,0x1
ffffffffc0203090:	3c9000ef          	jal	ffffffffc0203c58 <vma_create>
ffffffffc0203094:	85aa                	mv	a1,a0
ffffffffc0203096:	44050663          	beqz	a0,ffffffffc02034e2 <swap_init+0x548>
ffffffffc020309a:	64e2                	ld	s1,24(sp)
ffffffffc020309c:	8526                	mv	a0,s1
ffffffffc020309e:	429000ef          	jal	ffffffffc0203cc6 <insert_vma_struct>
ffffffffc02030a2:	00004517          	auipc	a0,0x4
ffffffffc02030a6:	50650513          	addi	a0,a0,1286 # ffffffffc02075a8 <etext+0x141c>
ffffffffc02030aa:	8d6fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02030ae:	6c88                	ld	a0,24(s1)
ffffffffc02030b0:	4605                	li	a2,1
ffffffffc02030b2:	6585                	lui	a1,0x1
ffffffffc02030b4:	c27fe0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc02030b8:	44050563          	beqz	a0,ffffffffc0203502 <swap_init+0x568>
ffffffffc02030bc:	00004517          	auipc	a0,0x4
ffffffffc02030c0:	53c50513          	addi	a0,a0,1340 # ffffffffc02075f8 <etext+0x146c>
ffffffffc02030c4:	00030497          	auipc	s1,0x30
ffffffffc02030c8:	0d448493          	addi	s1,s1,212 # ffffffffc0233198 <check_rp>
ffffffffc02030cc:	8b4fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02030d0:	00030997          	auipc	s3,0x30
ffffffffc02030d4:	0e898993          	addi	s3,s3,232 # ffffffffc02331b8 <swap_out_seq_no>
ffffffffc02030d8:	8ba6                	mv	s7,s1
ffffffffc02030da:	4505                	li	a0,1
ffffffffc02030dc:	af5fe0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc02030e0:	00abb023          	sd	a0,0(s7) # 80000 <_binary_obj___user_exit_out_size+0x7d6b0>
ffffffffc02030e4:	2e050763          	beqz	a0,ffffffffc02033d2 <swap_init+0x438>
ffffffffc02030e8:	651c                	ld	a5,8(a0)
ffffffffc02030ea:	8b89                	andi	a5,a5,2
ffffffffc02030ec:	2c079363          	bnez	a5,ffffffffc02033b2 <swap_init+0x418>
ffffffffc02030f0:	0ba1                	addi	s7,s7,8
ffffffffc02030f2:	ff3b94e3          	bne	s7,s3,ffffffffc02030da <swap_init+0x140>
ffffffffc02030f6:	601c                	ld	a5,0(s0)
ffffffffc02030f8:	00843a03          	ld	s4,8(s0)
ffffffffc02030fc:	e000                	sd	s0,0(s0)
ffffffffc02030fe:	f03e                	sd	a5,32(sp)
ffffffffc0203100:	481c                	lw	a5,16(s0)
ffffffffc0203102:	e400                	sd	s0,8(s0)
ffffffffc0203104:	00030b97          	auipc	s7,0x30
ffffffffc0203108:	094b8b93          	addi	s7,s7,148 # ffffffffc0233198 <check_rp>
ffffffffc020310c:	f43e                	sd	a5,40(sp)
ffffffffc020310e:	00030797          	auipc	a5,0x30
ffffffffc0203112:	0607a123          	sw	zero,98(a5) # ffffffffc0233170 <free_area+0x10>
ffffffffc0203116:	000bb503          	ld	a0,0(s7)
ffffffffc020311a:	4585                	li	a1,1
ffffffffc020311c:	0ba1                	addi	s7,s7,8
ffffffffc020311e:	b43fe0ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0203122:	ff3b9ae3          	bne	s7,s3,ffffffffc0203116 <swap_init+0x17c>
ffffffffc0203126:	01042b83          	lw	s7,16(s0)
ffffffffc020312a:	4791                	li	a5,4
ffffffffc020312c:	50fb9b63          	bne	s7,a5,ffffffffc0203642 <swap_init+0x6a8>
ffffffffc0203130:	00004517          	auipc	a0,0x4
ffffffffc0203134:	55050513          	addi	a0,a0,1360 # ffffffffc0207680 <etext+0x14f4>
ffffffffc0203138:	848fd0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020313c:	00034797          	auipc	a5,0x34
ffffffffc0203140:	1407aa23          	sw	zero,340(a5) # ffffffffc0237290 <pgfault_num>
ffffffffc0203144:	6785                	lui	a5,0x1
ffffffffc0203146:	4529                	li	a0,10
ffffffffc0203148:	00a78023          	sb	a0,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xef0>
ffffffffc020314c:	00034597          	auipc	a1,0x34
ffffffffc0203150:	1445a583          	lw	a1,324(a1) # ffffffffc0237290 <pgfault_num>
ffffffffc0203154:	4605                	li	a2,1
ffffffffc0203156:	00034797          	auipc	a5,0x34
ffffffffc020315a:	13a78793          	addi	a5,a5,314 # ffffffffc0237290 <pgfault_num>
ffffffffc020315e:	46c59263          	bne	a1,a2,ffffffffc02035c2 <swap_init+0x628>
ffffffffc0203162:	6605                	lui	a2,0x1
ffffffffc0203164:	00a60823          	sb	a0,16(a2) # 1010 <_binary_obj___user_faultread_out_size-0xee0>
ffffffffc0203168:	4388                	lw	a0,0(a5)
ffffffffc020316a:	46b51c63          	bne	a0,a1,ffffffffc02035e2 <swap_init+0x648>
ffffffffc020316e:	6609                	lui	a2,0x2
ffffffffc0203170:	45ad                	li	a1,11
ffffffffc0203172:	00b60023          	sb	a1,0(a2) # 2000 <_binary_obj___user_hello_out_size+0x38>
ffffffffc0203176:	4390                	lw	a2,0(a5)
ffffffffc0203178:	4889                	li	a7,2
ffffffffc020317a:	0006051b          	sext.w	a0,a2
ffffffffc020317e:	3d161263          	bne	a2,a7,ffffffffc0203542 <swap_init+0x5a8>
ffffffffc0203182:	6609                	lui	a2,0x2
ffffffffc0203184:	00b60823          	sb	a1,16(a2) # 2010 <_binary_obj___user_hello_out_size+0x48>
ffffffffc0203188:	438c                	lw	a1,0(a5)
ffffffffc020318a:	3ca59c63          	bne	a1,a0,ffffffffc0203562 <swap_init+0x5c8>
ffffffffc020318e:	660d                	lui	a2,0x3
ffffffffc0203190:	45b1                	li	a1,12
ffffffffc0203192:	00b60023          	sb	a1,0(a2) # 3000 <_binary_obj___user_exit_out_size+0x6b0>
ffffffffc0203196:	4390                	lw	a2,0(a5)
ffffffffc0203198:	488d                	li	a7,3
ffffffffc020319a:	0006051b          	sext.w	a0,a2
ffffffffc020319e:	3f161263          	bne	a2,a7,ffffffffc0203582 <swap_init+0x5e8>
ffffffffc02031a2:	660d                	lui	a2,0x3
ffffffffc02031a4:	00b60823          	sb	a1,16(a2) # 3010 <_binary_obj___user_exit_out_size+0x6c0>
ffffffffc02031a8:	438c                	lw	a1,0(a5)
ffffffffc02031aa:	3ea59c63          	bne	a1,a0,ffffffffc02035a2 <swap_init+0x608>
ffffffffc02031ae:	6611                	lui	a2,0x4
ffffffffc02031b0:	45b5                	li	a1,13
ffffffffc02031b2:	00b60023          	sb	a1,0(a2) # 4000 <_binary_obj___user_exit_out_size+0x16b0>
ffffffffc02031b6:	4390                	lw	a2,0(a5)
ffffffffc02031b8:	0006051b          	sext.w	a0,a2
ffffffffc02031bc:	29761363          	bne	a2,s7,ffffffffc0203442 <swap_init+0x4a8>
ffffffffc02031c0:	6611                	lui	a2,0x4
ffffffffc02031c2:	00b60823          	sb	a1,16(a2) # 4010 <_binary_obj___user_exit_out_size+0x16c0>
ffffffffc02031c6:	439c                	lw	a5,0(a5)
ffffffffc02031c8:	28a79d63          	bne	a5,a0,ffffffffc0203462 <swap_init+0x4c8>
ffffffffc02031cc:	481c                	lw	a5,16(s0)
ffffffffc02031ce:	2a079a63          	bnez	a5,ffffffffc0203482 <swap_init+0x4e8>
ffffffffc02031d2:	00030797          	auipc	a5,0x30
ffffffffc02031d6:	00e78793          	addi	a5,a5,14 # ffffffffc02331e0 <swap_in_seq_no>
ffffffffc02031da:	00030617          	auipc	a2,0x30
ffffffffc02031de:	fde60613          	addi	a2,a2,-34 # ffffffffc02331b8 <swap_out_seq_no>
ffffffffc02031e2:	00030517          	auipc	a0,0x30
ffffffffc02031e6:	02650513          	addi	a0,a0,38 # ffffffffc0233208 <pra_list_head>
ffffffffc02031ea:	55fd                	li	a1,-1
ffffffffc02031ec:	c38c                	sw	a1,0(a5)
ffffffffc02031ee:	c20c                	sw	a1,0(a2)
ffffffffc02031f0:	0791                	addi	a5,a5,4
ffffffffc02031f2:	0611                	addi	a2,a2,4
ffffffffc02031f4:	fea79ce3          	bne	a5,a0,ffffffffc02031ec <swap_init+0x252>
ffffffffc02031f8:	00030897          	auipc	a7,0x30
ffffffffc02031fc:	f8088893          	addi	a7,a7,-128 # ffffffffc0233178 <check_ptep>
ffffffffc0203200:	00030317          	auipc	t1,0x30
ffffffffc0203204:	f9830313          	addi	t1,t1,-104 # ffffffffc0233198 <check_rp>
ffffffffc0203208:	6585                	lui	a1,0x1
ffffffffc020320a:	00034b97          	auipc	s7,0x34
ffffffffc020320e:	05eb8b93          	addi	s7,s7,94 # ffffffffc0237268 <npage>
ffffffffc0203212:	00034c17          	auipc	s8,0x34
ffffffffc0203216:	05ec0c13          	addi	s8,s8,94 # ffffffffc0237270 <pages>
ffffffffc020321a:	00005c97          	auipc	s9,0x5
ffffffffc020321e:	656c8c93          	addi	s9,s9,1622 # ffffffffc0208870 <nbase>
ffffffffc0203222:	0008b023          	sd	zero,0(a7)
ffffffffc0203226:	4601                	li	a2,0
ffffffffc0203228:	8556                	mv	a0,s5
ffffffffc020322a:	e81a                	sd	t1,16(sp)
ffffffffc020322c:	e42e                	sd	a1,8(sp)
ffffffffc020322e:	e046                	sd	a7,0(sp)
ffffffffc0203230:	aabfe0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc0203234:	6882                	ld	a7,0(sp)
ffffffffc0203236:	65a2                	ld	a1,8(sp)
ffffffffc0203238:	6342                	ld	t1,16(sp)
ffffffffc020323a:	00a8b023          	sd	a0,0(a7)
ffffffffc020323e:	1e050263          	beqz	a0,ffffffffc0203422 <swap_init+0x488>
ffffffffc0203242:	611c                	ld	a5,0(a0)
ffffffffc0203244:	0017f613          	andi	a2,a5,1
ffffffffc0203248:	12060d63          	beqz	a2,ffffffffc0203382 <swap_init+0x3e8>
ffffffffc020324c:	000bb603          	ld	a2,0(s7)
ffffffffc0203250:	078a                	slli	a5,a5,0x2
ffffffffc0203252:	83b1                	srli	a5,a5,0xc
ffffffffc0203254:	14c7f363          	bgeu	a5,a2,ffffffffc020339a <swap_init+0x400>
ffffffffc0203258:	000cbe03          	ld	t3,0(s9)
ffffffffc020325c:	000c3603          	ld	a2,0(s8)
ffffffffc0203260:	00033503          	ld	a0,0(t1)
ffffffffc0203264:	41c787b3          	sub	a5,a5,t3
ffffffffc0203268:	079a                	slli	a5,a5,0x6
ffffffffc020326a:	6705                	lui	a4,0x1
ffffffffc020326c:	97b2                	add	a5,a5,a2
ffffffffc020326e:	0321                	addi	t1,t1,8
ffffffffc0203270:	08a1                	addi	a7,a7,8
ffffffffc0203272:	95ba                	add	a1,a1,a4
ffffffffc0203274:	0ef51763          	bne	a0,a5,ffffffffc0203362 <swap_init+0x3c8>
ffffffffc0203278:	6795                	lui	a5,0x5
ffffffffc020327a:	faf594e3          	bne	a1,a5,ffffffffc0203222 <swap_init+0x288>
ffffffffc020327e:	00004517          	auipc	a0,0x4
ffffffffc0203282:	4aa50513          	addi	a0,a0,1194 # ffffffffc0207728 <etext+0x159c>
ffffffffc0203286:	efbfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020328a:	000b3783          	ld	a5,0(s6)
ffffffffc020328e:	7f9c                	ld	a5,56(a5)
ffffffffc0203290:	9782                	jalr	a5
ffffffffc0203292:	20051863          	bnez	a0,ffffffffc02034a2 <swap_init+0x508>
ffffffffc0203296:	6088                	ld	a0,0(s1)
ffffffffc0203298:	4585                	li	a1,1
ffffffffc020329a:	04a1                	addi	s1,s1,8
ffffffffc020329c:	9c5fe0ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc02032a0:	ff349be3          	bne	s1,s3,ffffffffc0203296 <swap_init+0x2fc>
ffffffffc02032a4:	000ab783          	ld	a5,0(s5)
ffffffffc02032a8:	000bb603          	ld	a2,0(s7)
ffffffffc02032ac:	078a                	slli	a5,a5,0x2
ffffffffc02032ae:	83b1                	srli	a5,a5,0xc
ffffffffc02032b0:	0ec7f563          	bgeu	a5,a2,ffffffffc020339a <swap_init+0x400>
ffffffffc02032b4:	000cb603          	ld	a2,0(s9)
ffffffffc02032b8:	000c3503          	ld	a0,0(s8)
ffffffffc02032bc:	4585                	li	a1,1
ffffffffc02032be:	8f91                	sub	a5,a5,a2
ffffffffc02032c0:	079a                	slli	a5,a5,0x6
ffffffffc02032c2:	953e                	add	a0,a0,a5
ffffffffc02032c4:	99dfe0ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc02032c8:	67e2                	ld	a5,24(sp)
ffffffffc02032ca:	000ab023          	sd	zero,0(s5)
ffffffffc02032ce:	0007bc23          	sd	zero,24(a5) # 5018 <_binary_obj___user_exit_out_size+0x26c8>
ffffffffc02032d2:	853e                	mv	a0,a5
ffffffffc02032d4:	2c3000ef          	jal	ffffffffc0203d96 <mm_destroy>
ffffffffc02032d8:	77a2                	ld	a5,40(sp)
ffffffffc02032da:	01443423          	sd	s4,8(s0)
ffffffffc02032de:	c81c                	sw	a5,16(s0)
ffffffffc02032e0:	00034797          	auipc	a5,0x34
ffffffffc02032e4:	fa07bc23          	sd	zero,-72(a5) # ffffffffc0237298 <check_mm_struct>
ffffffffc02032e8:	7782                	ld	a5,32(sp)
ffffffffc02032ea:	e01c                	sd	a5,0(s0)
ffffffffc02032ec:	008a0b63          	beq	s4,s0,ffffffffc0203302 <swap_init+0x368>
ffffffffc02032f0:	ff8a2783          	lw	a5,-8(s4) # ff8 <_binary_obj___user_faultread_out_size-0xef8>
ffffffffc02032f4:	008a3a03          	ld	s4,8(s4)
ffffffffc02032f8:	3dfd                	addiw	s11,s11,-1
ffffffffc02032fa:	40fd0d3b          	subw	s10,s10,a5
ffffffffc02032fe:	fe8a19e3          	bne	s4,s0,ffffffffc02032f0 <swap_init+0x356>
ffffffffc0203302:	866a                	mv	a2,s10
ffffffffc0203304:	85ee                	mv	a1,s11
ffffffffc0203306:	00004517          	auipc	a0,0x4
ffffffffc020330a:	45250513          	addi	a0,a0,1106 # ffffffffc0207758 <etext+0x15cc>
ffffffffc020330e:	e73fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203312:	00004517          	auipc	a0,0x4
ffffffffc0203316:	46650513          	addi	a0,a0,1126 # ffffffffc0207778 <etext+0x15ec>
ffffffffc020331a:	e67fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020331e:	60ea                	ld	ra,152(sp)
ffffffffc0203320:	644a                	ld	s0,144(sp)
ffffffffc0203322:	64aa                	ld	s1,136(sp)
ffffffffc0203324:	79e6                	ld	s3,120(sp)
ffffffffc0203326:	7a46                	ld	s4,112(sp)
ffffffffc0203328:	7aa6                	ld	s5,104(sp)
ffffffffc020332a:	6be6                	ld	s7,88(sp)
ffffffffc020332c:	6c46                	ld	s8,80(sp)
ffffffffc020332e:	6ca6                	ld	s9,72(sp)
ffffffffc0203330:	6d06                	ld	s10,64(sp)
ffffffffc0203332:	7de2                	ld	s11,56(sp)
ffffffffc0203334:	7b06                	ld	s6,96(sp)
ffffffffc0203336:	854a                	mv	a0,s2
ffffffffc0203338:	690a                	ld	s2,128(sp)
ffffffffc020333a:	610d                	addi	sp,sp,160
ffffffffc020333c:	8082                	ret
ffffffffc020333e:	4481                	li	s1,0
ffffffffc0203340:	b309                	j	ffffffffc0203042 <swap_init+0xa8>
ffffffffc0203342:	00003697          	auipc	a3,0x3
ffffffffc0203346:	74668693          	addi	a3,a3,1862 # ffffffffc0206a88 <etext+0x8fc>
ffffffffc020334a:	00003617          	auipc	a2,0x3
ffffffffc020334e:	4be60613          	addi	a2,a2,1214 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203352:	0bc00593          	li	a1,188
ffffffffc0203356:	00004517          	auipc	a0,0x4
ffffffffc020335a:	1ba50513          	addi	a0,a0,442 # ffffffffc0207510 <etext+0x1384>
ffffffffc020335e:	916fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203362:	00004697          	auipc	a3,0x4
ffffffffc0203366:	39e68693          	addi	a3,a3,926 # ffffffffc0207700 <etext+0x1574>
ffffffffc020336a:	00003617          	auipc	a2,0x3
ffffffffc020336e:	49e60613          	addi	a2,a2,1182 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203372:	0fc00593          	li	a1,252
ffffffffc0203376:	00004517          	auipc	a0,0x4
ffffffffc020337a:	19a50513          	addi	a0,a0,410 # ffffffffc0207510 <etext+0x1384>
ffffffffc020337e:	8f6fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203382:	00004617          	auipc	a2,0x4
ffffffffc0203386:	b9e60613          	addi	a2,a2,-1122 # ffffffffc0206f20 <etext+0xd94>
ffffffffc020338a:	07400593          	li	a1,116
ffffffffc020338e:	00004517          	auipc	a0,0x4
ffffffffc0203392:	aca50513          	addi	a0,a0,-1334 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0203396:	8defd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020339a:	00004617          	auipc	a2,0x4
ffffffffc020339e:	b6660613          	addi	a2,a2,-1178 # ffffffffc0206f00 <etext+0xd74>
ffffffffc02033a2:	06200593          	li	a1,98
ffffffffc02033a6:	00004517          	auipc	a0,0x4
ffffffffc02033aa:	ab250513          	addi	a0,a0,-1358 # ffffffffc0206e58 <etext+0xccc>
ffffffffc02033ae:	8c6fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02033b2:	00004697          	auipc	a3,0x4
ffffffffc02033b6:	28668693          	addi	a3,a3,646 # ffffffffc0207638 <etext+0x14ac>
ffffffffc02033ba:	00003617          	auipc	a2,0x3
ffffffffc02033be:	44e60613          	addi	a2,a2,1102 # ffffffffc0206808 <etext+0x67c>
ffffffffc02033c2:	0dd00593          	li	a1,221
ffffffffc02033c6:	00004517          	auipc	a0,0x4
ffffffffc02033ca:	14a50513          	addi	a0,a0,330 # ffffffffc0207510 <etext+0x1384>
ffffffffc02033ce:	8a6fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02033d2:	00004697          	auipc	a3,0x4
ffffffffc02033d6:	24e68693          	addi	a3,a3,590 # ffffffffc0207620 <etext+0x1494>
ffffffffc02033da:	00003617          	auipc	a2,0x3
ffffffffc02033de:	42e60613          	addi	a2,a2,1070 # ffffffffc0206808 <etext+0x67c>
ffffffffc02033e2:	0dc00593          	li	a1,220
ffffffffc02033e6:	00004517          	auipc	a0,0x4
ffffffffc02033ea:	12a50513          	addi	a0,a0,298 # ffffffffc0207510 <etext+0x1384>
ffffffffc02033ee:	886fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02033f2:	00004617          	auipc	a2,0x4
ffffffffc02033f6:	0fe60613          	addi	a2,a2,254 # ffffffffc02074f0 <etext+0x1364>
ffffffffc02033fa:	02800593          	li	a1,40
ffffffffc02033fe:	00004517          	auipc	a0,0x4
ffffffffc0203402:	11250513          	addi	a0,a0,274 # ffffffffc0207510 <etext+0x1384>
ffffffffc0203406:	e922                	sd	s0,144(sp)
ffffffffc0203408:	e526                	sd	s1,136(sp)
ffffffffc020340a:	e14a                	sd	s2,128(sp)
ffffffffc020340c:	fcce                	sd	s3,120(sp)
ffffffffc020340e:	f8d2                	sd	s4,112(sp)
ffffffffc0203410:	f4d6                	sd	s5,104(sp)
ffffffffc0203412:	f0da                	sd	s6,96(sp)
ffffffffc0203414:	ecde                	sd	s7,88(sp)
ffffffffc0203416:	e8e2                	sd	s8,80(sp)
ffffffffc0203418:	e4e6                	sd	s9,72(sp)
ffffffffc020341a:	e0ea                	sd	s10,64(sp)
ffffffffc020341c:	fc6e                	sd	s11,56(sp)
ffffffffc020341e:	856fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203422:	00004697          	auipc	a3,0x4
ffffffffc0203426:	2c668693          	addi	a3,a3,710 # ffffffffc02076e8 <etext+0x155c>
ffffffffc020342a:	00003617          	auipc	a2,0x3
ffffffffc020342e:	3de60613          	addi	a2,a2,990 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203432:	0fb00593          	li	a1,251
ffffffffc0203436:	00004517          	auipc	a0,0x4
ffffffffc020343a:	0da50513          	addi	a0,a0,218 # ffffffffc0207510 <etext+0x1384>
ffffffffc020343e:	836fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203442:	00004697          	auipc	a3,0x4
ffffffffc0203446:	29668693          	addi	a3,a3,662 # ffffffffc02076d8 <etext+0x154c>
ffffffffc020344a:	00003617          	auipc	a2,0x3
ffffffffc020344e:	3be60613          	addi	a2,a2,958 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203452:	09f00593          	li	a1,159
ffffffffc0203456:	00004517          	auipc	a0,0x4
ffffffffc020345a:	0ba50513          	addi	a0,a0,186 # ffffffffc0207510 <etext+0x1384>
ffffffffc020345e:	816fd0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203462:	00004697          	auipc	a3,0x4
ffffffffc0203466:	27668693          	addi	a3,a3,630 # ffffffffc02076d8 <etext+0x154c>
ffffffffc020346a:	00003617          	auipc	a2,0x3
ffffffffc020346e:	39e60613          	addi	a2,a2,926 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203472:	0a100593          	li	a1,161
ffffffffc0203476:	00004517          	auipc	a0,0x4
ffffffffc020347a:	09a50513          	addi	a0,a0,154 # ffffffffc0207510 <etext+0x1384>
ffffffffc020347e:	ff7fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203482:	00003697          	auipc	a3,0x3
ffffffffc0203486:	7d668693          	addi	a3,a3,2006 # ffffffffc0206c58 <etext+0xacc>
ffffffffc020348a:	00003617          	auipc	a2,0x3
ffffffffc020348e:	37e60613          	addi	a2,a2,894 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203492:	0f300593          	li	a1,243
ffffffffc0203496:	00004517          	auipc	a0,0x4
ffffffffc020349a:	07a50513          	addi	a0,a0,122 # ffffffffc0207510 <etext+0x1384>
ffffffffc020349e:	fd7fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02034a2:	00004697          	auipc	a3,0x4
ffffffffc02034a6:	2ae68693          	addi	a3,a3,686 # ffffffffc0207750 <etext+0x15c4>
ffffffffc02034aa:	00003617          	auipc	a2,0x3
ffffffffc02034ae:	35e60613          	addi	a2,a2,862 # ffffffffc0206808 <etext+0x67c>
ffffffffc02034b2:	10200593          	li	a1,258
ffffffffc02034b6:	00004517          	auipc	a0,0x4
ffffffffc02034ba:	05a50513          	addi	a0,a0,90 # ffffffffc0207510 <etext+0x1384>
ffffffffc02034be:	fb7fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02034c2:	00004697          	auipc	a3,0x4
ffffffffc02034c6:	0c668693          	addi	a3,a3,198 # ffffffffc0207588 <etext+0x13fc>
ffffffffc02034ca:	00003617          	auipc	a2,0x3
ffffffffc02034ce:	33e60613          	addi	a2,a2,830 # ffffffffc0206808 <etext+0x67c>
ffffffffc02034d2:	0cc00593          	li	a1,204
ffffffffc02034d6:	00004517          	auipc	a0,0x4
ffffffffc02034da:	03a50513          	addi	a0,a0,58 # ffffffffc0207510 <etext+0x1384>
ffffffffc02034de:	f97fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02034e2:	00004697          	auipc	a3,0x4
ffffffffc02034e6:	0b668693          	addi	a3,a3,182 # ffffffffc0207598 <etext+0x140c>
ffffffffc02034ea:	00003617          	auipc	a2,0x3
ffffffffc02034ee:	31e60613          	addi	a2,a2,798 # ffffffffc0206808 <etext+0x67c>
ffffffffc02034f2:	0cf00593          	li	a1,207
ffffffffc02034f6:	00004517          	auipc	a0,0x4
ffffffffc02034fa:	01a50513          	addi	a0,a0,26 # ffffffffc0207510 <etext+0x1384>
ffffffffc02034fe:	f77fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203502:	00004697          	auipc	a3,0x4
ffffffffc0203506:	0de68693          	addi	a3,a3,222 # ffffffffc02075e0 <etext+0x1454>
ffffffffc020350a:	00003617          	auipc	a2,0x3
ffffffffc020350e:	2fe60613          	addi	a2,a2,766 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203512:	0d700593          	li	a1,215
ffffffffc0203516:	00004517          	auipc	a0,0x4
ffffffffc020351a:	ffa50513          	addi	a0,a0,-6 # ffffffffc0207510 <etext+0x1384>
ffffffffc020351e:	f57fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203522:	00003697          	auipc	a3,0x3
ffffffffc0203526:	58e68693          	addi	a3,a3,1422 # ffffffffc0206ab0 <etext+0x924>
ffffffffc020352a:	00003617          	auipc	a2,0x3
ffffffffc020352e:	2de60613          	addi	a2,a2,734 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203532:	0bf00593          	li	a1,191
ffffffffc0203536:	00004517          	auipc	a0,0x4
ffffffffc020353a:	fda50513          	addi	a0,a0,-38 # ffffffffc0207510 <etext+0x1384>
ffffffffc020353e:	f37fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203542:	00004697          	auipc	a3,0x4
ffffffffc0203546:	17668693          	addi	a3,a3,374 # ffffffffc02076b8 <etext+0x152c>
ffffffffc020354a:	00003617          	auipc	a2,0x3
ffffffffc020354e:	2be60613          	addi	a2,a2,702 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203552:	09700593          	li	a1,151
ffffffffc0203556:	00004517          	auipc	a0,0x4
ffffffffc020355a:	fba50513          	addi	a0,a0,-70 # ffffffffc0207510 <etext+0x1384>
ffffffffc020355e:	f17fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203562:	00004697          	auipc	a3,0x4
ffffffffc0203566:	15668693          	addi	a3,a3,342 # ffffffffc02076b8 <etext+0x152c>
ffffffffc020356a:	00003617          	auipc	a2,0x3
ffffffffc020356e:	29e60613          	addi	a2,a2,670 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203572:	09900593          	li	a1,153
ffffffffc0203576:	00004517          	auipc	a0,0x4
ffffffffc020357a:	f9a50513          	addi	a0,a0,-102 # ffffffffc0207510 <etext+0x1384>
ffffffffc020357e:	ef7fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203582:	00004697          	auipc	a3,0x4
ffffffffc0203586:	14668693          	addi	a3,a3,326 # ffffffffc02076c8 <etext+0x153c>
ffffffffc020358a:	00003617          	auipc	a2,0x3
ffffffffc020358e:	27e60613          	addi	a2,a2,638 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203592:	09b00593          	li	a1,155
ffffffffc0203596:	00004517          	auipc	a0,0x4
ffffffffc020359a:	f7a50513          	addi	a0,a0,-134 # ffffffffc0207510 <etext+0x1384>
ffffffffc020359e:	ed7fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02035a2:	00004697          	auipc	a3,0x4
ffffffffc02035a6:	12668693          	addi	a3,a3,294 # ffffffffc02076c8 <etext+0x153c>
ffffffffc02035aa:	00003617          	auipc	a2,0x3
ffffffffc02035ae:	25e60613          	addi	a2,a2,606 # ffffffffc0206808 <etext+0x67c>
ffffffffc02035b2:	09d00593          	li	a1,157
ffffffffc02035b6:	00004517          	auipc	a0,0x4
ffffffffc02035ba:	f5a50513          	addi	a0,a0,-166 # ffffffffc0207510 <etext+0x1384>
ffffffffc02035be:	eb7fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02035c2:	00004697          	auipc	a3,0x4
ffffffffc02035c6:	0e668693          	addi	a3,a3,230 # ffffffffc02076a8 <etext+0x151c>
ffffffffc02035ca:	00003617          	auipc	a2,0x3
ffffffffc02035ce:	23e60613          	addi	a2,a2,574 # ffffffffc0206808 <etext+0x67c>
ffffffffc02035d2:	09300593          	li	a1,147
ffffffffc02035d6:	00004517          	auipc	a0,0x4
ffffffffc02035da:	f3a50513          	addi	a0,a0,-198 # ffffffffc0207510 <etext+0x1384>
ffffffffc02035de:	e97fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02035e2:	00004697          	auipc	a3,0x4
ffffffffc02035e6:	0c668693          	addi	a3,a3,198 # ffffffffc02076a8 <etext+0x151c>
ffffffffc02035ea:	00003617          	auipc	a2,0x3
ffffffffc02035ee:	21e60613          	addi	a2,a2,542 # ffffffffc0206808 <etext+0x67c>
ffffffffc02035f2:	09500593          	li	a1,149
ffffffffc02035f6:	00004517          	auipc	a0,0x4
ffffffffc02035fa:	f1a50513          	addi	a0,a0,-230 # ffffffffc0207510 <etext+0x1384>
ffffffffc02035fe:	e77fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203602:	00004697          	auipc	a3,0x4
ffffffffc0203606:	f5e68693          	addi	a3,a3,-162 # ffffffffc0207560 <etext+0x13d4>
ffffffffc020360a:	00003617          	auipc	a2,0x3
ffffffffc020360e:	1fe60613          	addi	a2,a2,510 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203612:	0c400593          	li	a1,196
ffffffffc0203616:	00004517          	auipc	a0,0x4
ffffffffc020361a:	efa50513          	addi	a0,a0,-262 # ffffffffc0207510 <etext+0x1384>
ffffffffc020361e:	e57fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203622:	00004697          	auipc	a3,0x4
ffffffffc0203626:	f4e68693          	addi	a3,a3,-178 # ffffffffc0207570 <etext+0x13e4>
ffffffffc020362a:	00003617          	auipc	a2,0x3
ffffffffc020362e:	1de60613          	addi	a2,a2,478 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203632:	0c700593          	li	a1,199
ffffffffc0203636:	00004517          	auipc	a0,0x4
ffffffffc020363a:	eda50513          	addi	a0,a0,-294 # ffffffffc0207510 <etext+0x1384>
ffffffffc020363e:	e37fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203642:	00004697          	auipc	a3,0x4
ffffffffc0203646:	01668693          	addi	a3,a3,22 # ffffffffc0207658 <etext+0x14cc>
ffffffffc020364a:	00003617          	auipc	a2,0x3
ffffffffc020364e:	1be60613          	addi	a2,a2,446 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203652:	0ea00593          	li	a1,234
ffffffffc0203656:	00004517          	auipc	a0,0x4
ffffffffc020365a:	eba50513          	addi	a0,a0,-326 # ffffffffc0207510 <etext+0x1384>
ffffffffc020365e:	e17fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203662 <swap_init_mm>:
ffffffffc0203662:	00034797          	auipc	a5,0x34
ffffffffc0203666:	c267b783          	ld	a5,-986(a5) # ffffffffc0237288 <sm>
ffffffffc020366a:	6b9c                	ld	a5,16(a5)
ffffffffc020366c:	8782                	jr	a5

ffffffffc020366e <swap_map_swappable>:
ffffffffc020366e:	00034797          	auipc	a5,0x34
ffffffffc0203672:	c1a7b783          	ld	a5,-998(a5) # ffffffffc0237288 <sm>
ffffffffc0203676:	739c                	ld	a5,32(a5)
ffffffffc0203678:	8782                	jr	a5

ffffffffc020367a <swap_out>:
ffffffffc020367a:	711d                	addi	sp,sp,-96
ffffffffc020367c:	ec86                	sd	ra,88(sp)
ffffffffc020367e:	e8a2                	sd	s0,80(sp)
ffffffffc0203680:	0e058663          	beqz	a1,ffffffffc020376c <swap_out+0xf2>
ffffffffc0203684:	e0ca                	sd	s2,64(sp)
ffffffffc0203686:	fc4e                	sd	s3,56(sp)
ffffffffc0203688:	f852                	sd	s4,48(sp)
ffffffffc020368a:	f456                	sd	s5,40(sp)
ffffffffc020368c:	f05a                	sd	s6,32(sp)
ffffffffc020368e:	ec5e                	sd	s7,24(sp)
ffffffffc0203690:	e4a6                	sd	s1,72(sp)
ffffffffc0203692:	e862                	sd	s8,16(sp)
ffffffffc0203694:	8a2e                	mv	s4,a1
ffffffffc0203696:	892a                	mv	s2,a0
ffffffffc0203698:	8ab2                	mv	s5,a2
ffffffffc020369a:	4401                	li	s0,0
ffffffffc020369c:	00034997          	auipc	s3,0x34
ffffffffc02036a0:	bec98993          	addi	s3,s3,-1044 # ffffffffc0237288 <sm>
ffffffffc02036a4:	00004b17          	auipc	s6,0x4
ffffffffc02036a8:	154b0b13          	addi	s6,s6,340 # ffffffffc02077f8 <etext+0x166c>
ffffffffc02036ac:	00004b97          	auipc	s7,0x4
ffffffffc02036b0:	134b8b93          	addi	s7,s7,308 # ffffffffc02077e0 <etext+0x1654>
ffffffffc02036b4:	a825                	j	ffffffffc02036ec <swap_out+0x72>
ffffffffc02036b6:	67a2                	ld	a5,8(sp)
ffffffffc02036b8:	8626                	mv	a2,s1
ffffffffc02036ba:	85a2                	mv	a1,s0
ffffffffc02036bc:	7f94                	ld	a3,56(a5)
ffffffffc02036be:	855a                	mv	a0,s6
ffffffffc02036c0:	2405                	addiw	s0,s0,1
ffffffffc02036c2:	82b1                	srli	a3,a3,0xc
ffffffffc02036c4:	0685                	addi	a3,a3,1
ffffffffc02036c6:	abbfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02036ca:	6522                	ld	a0,8(sp)
ffffffffc02036cc:	4585                	li	a1,1
ffffffffc02036ce:	7d1c                	ld	a5,56(a0)
ffffffffc02036d0:	83b1                	srli	a5,a5,0xc
ffffffffc02036d2:	0785                	addi	a5,a5,1
ffffffffc02036d4:	07a2                	slli	a5,a5,0x8
ffffffffc02036d6:	00fc3023          	sd	a5,0(s8)
ffffffffc02036da:	d86fe0ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc02036de:	01893503          	ld	a0,24(s2)
ffffffffc02036e2:	85a6                	mv	a1,s1
ffffffffc02036e4:	ff6ff0ef          	jal	ffffffffc0202eda <tlb_invalidate>
ffffffffc02036e8:	048a0d63          	beq	s4,s0,ffffffffc0203742 <swap_out+0xc8>
ffffffffc02036ec:	0009b783          	ld	a5,0(s3)
ffffffffc02036f0:	8656                	mv	a2,s5
ffffffffc02036f2:	002c                	addi	a1,sp,8
ffffffffc02036f4:	7b9c                	ld	a5,48(a5)
ffffffffc02036f6:	854a                	mv	a0,s2
ffffffffc02036f8:	9782                	jalr	a5
ffffffffc02036fa:	e12d                	bnez	a0,ffffffffc020375c <swap_out+0xe2>
ffffffffc02036fc:	67a2                	ld	a5,8(sp)
ffffffffc02036fe:	01893503          	ld	a0,24(s2)
ffffffffc0203702:	4601                	li	a2,0
ffffffffc0203704:	7f84                	ld	s1,56(a5)
ffffffffc0203706:	85a6                	mv	a1,s1
ffffffffc0203708:	dd2fe0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc020370c:	611c                	ld	a5,0(a0)
ffffffffc020370e:	8c2a                	mv	s8,a0
ffffffffc0203710:	8b85                	andi	a5,a5,1
ffffffffc0203712:	cfb9                	beqz	a5,ffffffffc0203770 <swap_out+0xf6>
ffffffffc0203714:	65a2                	ld	a1,8(sp)
ffffffffc0203716:	7d9c                	ld	a5,56(a1)
ffffffffc0203718:	83b1                	srli	a5,a5,0xc
ffffffffc020371a:	0785                	addi	a5,a5,1
ffffffffc020371c:	00879513          	slli	a0,a5,0x8
ffffffffc0203720:	7e1000ef          	jal	ffffffffc0204700 <swapfs_write>
ffffffffc0203724:	d949                	beqz	a0,ffffffffc02036b6 <swap_out+0x3c>
ffffffffc0203726:	855e                	mv	a0,s7
ffffffffc0203728:	a59fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020372c:	0009b783          	ld	a5,0(s3)
ffffffffc0203730:	6622                	ld	a2,8(sp)
ffffffffc0203732:	4681                	li	a3,0
ffffffffc0203734:	739c                	ld	a5,32(a5)
ffffffffc0203736:	85a6                	mv	a1,s1
ffffffffc0203738:	854a                	mv	a0,s2
ffffffffc020373a:	2405                	addiw	s0,s0,1
ffffffffc020373c:	9782                	jalr	a5
ffffffffc020373e:	fa8a17e3          	bne	s4,s0,ffffffffc02036ec <swap_out+0x72>
ffffffffc0203742:	64a6                	ld	s1,72(sp)
ffffffffc0203744:	6906                	ld	s2,64(sp)
ffffffffc0203746:	79e2                	ld	s3,56(sp)
ffffffffc0203748:	7a42                	ld	s4,48(sp)
ffffffffc020374a:	7aa2                	ld	s5,40(sp)
ffffffffc020374c:	7b02                	ld	s6,32(sp)
ffffffffc020374e:	6be2                	ld	s7,24(sp)
ffffffffc0203750:	6c42                	ld	s8,16(sp)
ffffffffc0203752:	60e6                	ld	ra,88(sp)
ffffffffc0203754:	8522                	mv	a0,s0
ffffffffc0203756:	6446                	ld	s0,80(sp)
ffffffffc0203758:	6125                	addi	sp,sp,96
ffffffffc020375a:	8082                	ret
ffffffffc020375c:	85a2                	mv	a1,s0
ffffffffc020375e:	00004517          	auipc	a0,0x4
ffffffffc0203762:	03a50513          	addi	a0,a0,58 # ffffffffc0207798 <etext+0x160c>
ffffffffc0203766:	a1bfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020376a:	bfe1                	j	ffffffffc0203742 <swap_out+0xc8>
ffffffffc020376c:	4401                	li	s0,0
ffffffffc020376e:	b7d5                	j	ffffffffc0203752 <swap_out+0xd8>
ffffffffc0203770:	00004697          	auipc	a3,0x4
ffffffffc0203774:	05868693          	addi	a3,a3,88 # ffffffffc02077c8 <etext+0x163c>
ffffffffc0203778:	00003617          	auipc	a2,0x3
ffffffffc020377c:	09060613          	addi	a2,a2,144 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203780:	06800593          	li	a1,104
ffffffffc0203784:	00004517          	auipc	a0,0x4
ffffffffc0203788:	d8c50513          	addi	a0,a0,-628 # ffffffffc0207510 <etext+0x1384>
ffffffffc020378c:	ce9fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203790 <swap_in>:
ffffffffc0203790:	7179                	addi	sp,sp,-48
ffffffffc0203792:	e84a                	sd	s2,16(sp)
ffffffffc0203794:	892a                	mv	s2,a0
ffffffffc0203796:	4505                	li	a0,1
ffffffffc0203798:	ec26                	sd	s1,24(sp)
ffffffffc020379a:	e44e                	sd	s3,8(sp)
ffffffffc020379c:	f406                	sd	ra,40(sp)
ffffffffc020379e:	f022                	sd	s0,32(sp)
ffffffffc02037a0:	84ae                	mv	s1,a1
ffffffffc02037a2:	89b2                	mv	s3,a2
ffffffffc02037a4:	c2cfe0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc02037a8:	c129                	beqz	a0,ffffffffc02037ea <swap_in+0x5a>
ffffffffc02037aa:	842a                	mv	s0,a0
ffffffffc02037ac:	01893503          	ld	a0,24(s2)
ffffffffc02037b0:	4601                	li	a2,0
ffffffffc02037b2:	85a6                	mv	a1,s1
ffffffffc02037b4:	d26fe0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc02037b8:	892a                	mv	s2,a0
ffffffffc02037ba:	6108                	ld	a0,0(a0)
ffffffffc02037bc:	85a2                	mv	a1,s0
ffffffffc02037be:	6b5000ef          	jal	ffffffffc0204672 <swapfs_read>
ffffffffc02037c2:	00093583          	ld	a1,0(s2)
ffffffffc02037c6:	8626                	mv	a2,s1
ffffffffc02037c8:	00004517          	auipc	a0,0x4
ffffffffc02037cc:	08050513          	addi	a0,a0,128 # ffffffffc0207848 <etext+0x16bc>
ffffffffc02037d0:	81a1                	srli	a1,a1,0x8
ffffffffc02037d2:	9affc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02037d6:	70a2                	ld	ra,40(sp)
ffffffffc02037d8:	0089b023          	sd	s0,0(s3)
ffffffffc02037dc:	7402                	ld	s0,32(sp)
ffffffffc02037de:	64e2                	ld	s1,24(sp)
ffffffffc02037e0:	6942                	ld	s2,16(sp)
ffffffffc02037e2:	69a2                	ld	s3,8(sp)
ffffffffc02037e4:	4501                	li	a0,0
ffffffffc02037e6:	6145                	addi	sp,sp,48
ffffffffc02037e8:	8082                	ret
ffffffffc02037ea:	00004697          	auipc	a3,0x4
ffffffffc02037ee:	04e68693          	addi	a3,a3,78 # ffffffffc0207838 <etext+0x16ac>
ffffffffc02037f2:	00003617          	auipc	a2,0x3
ffffffffc02037f6:	01660613          	addi	a2,a2,22 # ffffffffc0206808 <etext+0x67c>
ffffffffc02037fa:	07e00593          	li	a1,126
ffffffffc02037fe:	00004517          	auipc	a0,0x4
ffffffffc0203802:	d1250513          	addi	a0,a0,-750 # ffffffffc0207510 <etext+0x1384>
ffffffffc0203806:	c6ffc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc020380a <_fifo_init_mm>:
ffffffffc020380a:	00030797          	auipc	a5,0x30
ffffffffc020380e:	9fe78793          	addi	a5,a5,-1538 # ffffffffc0233208 <pra_list_head>
ffffffffc0203812:	f51c                	sd	a5,40(a0)
ffffffffc0203814:	e79c                	sd	a5,8(a5)
ffffffffc0203816:	e39c                	sd	a5,0(a5)
ffffffffc0203818:	4501                	li	a0,0
ffffffffc020381a:	8082                	ret

ffffffffc020381c <_fifo_init>:
ffffffffc020381c:	4501                	li	a0,0
ffffffffc020381e:	8082                	ret

ffffffffc0203820 <_fifo_set_unswappable>:
ffffffffc0203820:	4501                	li	a0,0
ffffffffc0203822:	8082                	ret

ffffffffc0203824 <_fifo_tick_event>:
ffffffffc0203824:	4501                	li	a0,0
ffffffffc0203826:	8082                	ret

ffffffffc0203828 <_fifo_check_swap>:
ffffffffc0203828:	711d                	addi	sp,sp,-96
ffffffffc020382a:	fc4e                	sd	s3,56(sp)
ffffffffc020382c:	f852                	sd	s4,48(sp)
ffffffffc020382e:	00004517          	auipc	a0,0x4
ffffffffc0203832:	05a50513          	addi	a0,a0,90 # ffffffffc0207888 <etext+0x16fc>
ffffffffc0203836:	698d                	lui	s3,0x3
ffffffffc0203838:	4a31                	li	s4,12
ffffffffc020383a:	e4a6                	sd	s1,72(sp)
ffffffffc020383c:	ec86                	sd	ra,88(sp)
ffffffffc020383e:	e8a2                	sd	s0,80(sp)
ffffffffc0203840:	e0ca                	sd	s2,64(sp)
ffffffffc0203842:	f456                	sd	s5,40(sp)
ffffffffc0203844:	f05a                	sd	s6,32(sp)
ffffffffc0203846:	ec5e                	sd	s7,24(sp)
ffffffffc0203848:	e862                	sd	s8,16(sp)
ffffffffc020384a:	e466                	sd	s9,8(sp)
ffffffffc020384c:	935fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203850:	01498023          	sb	s4,0(s3) # 3000 <_binary_obj___user_exit_out_size+0x6b0>
ffffffffc0203854:	00034497          	auipc	s1,0x34
ffffffffc0203858:	a3c4a483          	lw	s1,-1476(s1) # ffffffffc0237290 <pgfault_num>
ffffffffc020385c:	4791                	li	a5,4
ffffffffc020385e:	14f49963          	bne	s1,a5,ffffffffc02039b0 <_fifo_check_swap+0x188>
ffffffffc0203862:	00004517          	auipc	a0,0x4
ffffffffc0203866:	06650513          	addi	a0,a0,102 # ffffffffc02078c8 <etext+0x173c>
ffffffffc020386a:	6a85                	lui	s5,0x1
ffffffffc020386c:	4b29                	li	s6,10
ffffffffc020386e:	913fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203872:	00034417          	auipc	s0,0x34
ffffffffc0203876:	a1e40413          	addi	s0,s0,-1506 # ffffffffc0237290 <pgfault_num>
ffffffffc020387a:	016a8023          	sb	s6,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xef0>
ffffffffc020387e:	401c                	lw	a5,0(s0)
ffffffffc0203880:	0007891b          	sext.w	s2,a5
ffffffffc0203884:	2a979663          	bne	a5,s1,ffffffffc0203b30 <_fifo_check_swap+0x308>
ffffffffc0203888:	00004517          	auipc	a0,0x4
ffffffffc020388c:	06850513          	addi	a0,a0,104 # ffffffffc02078f0 <etext+0x1764>
ffffffffc0203890:	6b91                	lui	s7,0x4
ffffffffc0203892:	4c35                	li	s8,13
ffffffffc0203894:	8edfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203898:	018b8023          	sb	s8,0(s7) # 4000 <_binary_obj___user_exit_out_size+0x16b0>
ffffffffc020389c:	401c                	lw	a5,0(s0)
ffffffffc020389e:	00078c9b          	sext.w	s9,a5
ffffffffc02038a2:	27279763          	bne	a5,s2,ffffffffc0203b10 <_fifo_check_swap+0x2e8>
ffffffffc02038a6:	00004517          	auipc	a0,0x4
ffffffffc02038aa:	07250513          	addi	a0,a0,114 # ffffffffc0207918 <etext+0x178c>
ffffffffc02038ae:	6489                	lui	s1,0x2
ffffffffc02038b0:	492d                	li	s2,11
ffffffffc02038b2:	8cffc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02038b6:	01248023          	sb	s2,0(s1) # 2000 <_binary_obj___user_hello_out_size+0x38>
ffffffffc02038ba:	401c                	lw	a5,0(s0)
ffffffffc02038bc:	23979a63          	bne	a5,s9,ffffffffc0203af0 <_fifo_check_swap+0x2c8>
ffffffffc02038c0:	00004517          	auipc	a0,0x4
ffffffffc02038c4:	08050513          	addi	a0,a0,128 # ffffffffc0207940 <etext+0x17b4>
ffffffffc02038c8:	8b9fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02038cc:	6795                	lui	a5,0x5
ffffffffc02038ce:	4739                	li	a4,14
ffffffffc02038d0:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_exit_out_size+0x26b0>
ffffffffc02038d4:	401c                	lw	a5,0(s0)
ffffffffc02038d6:	4715                	li	a4,5
ffffffffc02038d8:	00078c9b          	sext.w	s9,a5
ffffffffc02038dc:	1ee79a63          	bne	a5,a4,ffffffffc0203ad0 <_fifo_check_swap+0x2a8>
ffffffffc02038e0:	00004517          	auipc	a0,0x4
ffffffffc02038e4:	03850513          	addi	a0,a0,56 # ffffffffc0207918 <etext+0x178c>
ffffffffc02038e8:	899fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02038ec:	01248023          	sb	s2,0(s1)
ffffffffc02038f0:	401c                	lw	a5,0(s0)
ffffffffc02038f2:	1b979f63          	bne	a5,s9,ffffffffc0203ab0 <_fifo_check_swap+0x288>
ffffffffc02038f6:	00004517          	auipc	a0,0x4
ffffffffc02038fa:	fd250513          	addi	a0,a0,-46 # ffffffffc02078c8 <etext+0x173c>
ffffffffc02038fe:	883fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203902:	016a8023          	sb	s6,0(s5)
ffffffffc0203906:	4018                	lw	a4,0(s0)
ffffffffc0203908:	4799                	li	a5,6
ffffffffc020390a:	18f71363          	bne	a4,a5,ffffffffc0203a90 <_fifo_check_swap+0x268>
ffffffffc020390e:	00004517          	auipc	a0,0x4
ffffffffc0203912:	00a50513          	addi	a0,a0,10 # ffffffffc0207918 <etext+0x178c>
ffffffffc0203916:	86bfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020391a:	01248023          	sb	s2,0(s1)
ffffffffc020391e:	4018                	lw	a4,0(s0)
ffffffffc0203920:	479d                	li	a5,7
ffffffffc0203922:	14f71763          	bne	a4,a5,ffffffffc0203a70 <_fifo_check_swap+0x248>
ffffffffc0203926:	00004517          	auipc	a0,0x4
ffffffffc020392a:	f6250513          	addi	a0,a0,-158 # ffffffffc0207888 <etext+0x16fc>
ffffffffc020392e:	853fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203932:	01498023          	sb	s4,0(s3)
ffffffffc0203936:	4018                	lw	a4,0(s0)
ffffffffc0203938:	47a1                	li	a5,8
ffffffffc020393a:	10f71b63          	bne	a4,a5,ffffffffc0203a50 <_fifo_check_swap+0x228>
ffffffffc020393e:	00004517          	auipc	a0,0x4
ffffffffc0203942:	fb250513          	addi	a0,a0,-78 # ffffffffc02078f0 <etext+0x1764>
ffffffffc0203946:	83bfc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020394a:	018b8023          	sb	s8,0(s7)
ffffffffc020394e:	4018                	lw	a4,0(s0)
ffffffffc0203950:	47a5                	li	a5,9
ffffffffc0203952:	0cf71f63          	bne	a4,a5,ffffffffc0203a30 <_fifo_check_swap+0x208>
ffffffffc0203956:	00004517          	auipc	a0,0x4
ffffffffc020395a:	fea50513          	addi	a0,a0,-22 # ffffffffc0207940 <etext+0x17b4>
ffffffffc020395e:	823fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203962:	6795                	lui	a5,0x5
ffffffffc0203964:	4739                	li	a4,14
ffffffffc0203966:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_exit_out_size+0x26b0>
ffffffffc020396a:	401c                	lw	a5,0(s0)
ffffffffc020396c:	4729                	li	a4,10
ffffffffc020396e:	0007849b          	sext.w	s1,a5
ffffffffc0203972:	08e79f63          	bne	a5,a4,ffffffffc0203a10 <_fifo_check_swap+0x1e8>
ffffffffc0203976:	00004517          	auipc	a0,0x4
ffffffffc020397a:	f5250513          	addi	a0,a0,-174 # ffffffffc02078c8 <etext+0x173c>
ffffffffc020397e:	803fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0203982:	6785                	lui	a5,0x1
ffffffffc0203984:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xef0>
ffffffffc0203988:	06979463          	bne	a5,s1,ffffffffc02039f0 <_fifo_check_swap+0x1c8>
ffffffffc020398c:	4018                	lw	a4,0(s0)
ffffffffc020398e:	47ad                	li	a5,11
ffffffffc0203990:	04f71063          	bne	a4,a5,ffffffffc02039d0 <_fifo_check_swap+0x1a8>
ffffffffc0203994:	60e6                	ld	ra,88(sp)
ffffffffc0203996:	6446                	ld	s0,80(sp)
ffffffffc0203998:	64a6                	ld	s1,72(sp)
ffffffffc020399a:	6906                	ld	s2,64(sp)
ffffffffc020399c:	79e2                	ld	s3,56(sp)
ffffffffc020399e:	7a42                	ld	s4,48(sp)
ffffffffc02039a0:	7aa2                	ld	s5,40(sp)
ffffffffc02039a2:	7b02                	ld	s6,32(sp)
ffffffffc02039a4:	6be2                	ld	s7,24(sp)
ffffffffc02039a6:	6c42                	ld	s8,16(sp)
ffffffffc02039a8:	6ca2                	ld	s9,8(sp)
ffffffffc02039aa:	4501                	li	a0,0
ffffffffc02039ac:	6125                	addi	sp,sp,96
ffffffffc02039ae:	8082                	ret
ffffffffc02039b0:	00004697          	auipc	a3,0x4
ffffffffc02039b4:	d2868693          	addi	a3,a3,-728 # ffffffffc02076d8 <etext+0x154c>
ffffffffc02039b8:	00003617          	auipc	a2,0x3
ffffffffc02039bc:	e5060613          	addi	a2,a2,-432 # ffffffffc0206808 <etext+0x67c>
ffffffffc02039c0:	05100593          	li	a1,81
ffffffffc02039c4:	00004517          	auipc	a0,0x4
ffffffffc02039c8:	eec50513          	addi	a0,a0,-276 # ffffffffc02078b0 <etext+0x1724>
ffffffffc02039cc:	aa9fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02039d0:	00004697          	auipc	a3,0x4
ffffffffc02039d4:	02068693          	addi	a3,a3,32 # ffffffffc02079f0 <etext+0x1864>
ffffffffc02039d8:	00003617          	auipc	a2,0x3
ffffffffc02039dc:	e3060613          	addi	a2,a2,-464 # ffffffffc0206808 <etext+0x67c>
ffffffffc02039e0:	07300593          	li	a1,115
ffffffffc02039e4:	00004517          	auipc	a0,0x4
ffffffffc02039e8:	ecc50513          	addi	a0,a0,-308 # ffffffffc02078b0 <etext+0x1724>
ffffffffc02039ec:	a89fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02039f0:	00004697          	auipc	a3,0x4
ffffffffc02039f4:	fd868693          	addi	a3,a3,-40 # ffffffffc02079c8 <etext+0x183c>
ffffffffc02039f8:	00003617          	auipc	a2,0x3
ffffffffc02039fc:	e1060613          	addi	a2,a2,-496 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203a00:	07100593          	li	a1,113
ffffffffc0203a04:	00004517          	auipc	a0,0x4
ffffffffc0203a08:	eac50513          	addi	a0,a0,-340 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203a0c:	a69fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203a10:	00004697          	auipc	a3,0x4
ffffffffc0203a14:	fa868693          	addi	a3,a3,-88 # ffffffffc02079b8 <etext+0x182c>
ffffffffc0203a18:	00003617          	auipc	a2,0x3
ffffffffc0203a1c:	df060613          	addi	a2,a2,-528 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203a20:	06f00593          	li	a1,111
ffffffffc0203a24:	00004517          	auipc	a0,0x4
ffffffffc0203a28:	e8c50513          	addi	a0,a0,-372 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203a2c:	a49fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203a30:	00004697          	auipc	a3,0x4
ffffffffc0203a34:	f7868693          	addi	a3,a3,-136 # ffffffffc02079a8 <etext+0x181c>
ffffffffc0203a38:	00003617          	auipc	a2,0x3
ffffffffc0203a3c:	dd060613          	addi	a2,a2,-560 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203a40:	06c00593          	li	a1,108
ffffffffc0203a44:	00004517          	auipc	a0,0x4
ffffffffc0203a48:	e6c50513          	addi	a0,a0,-404 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203a4c:	a29fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203a50:	00004697          	auipc	a3,0x4
ffffffffc0203a54:	f4868693          	addi	a3,a3,-184 # ffffffffc0207998 <etext+0x180c>
ffffffffc0203a58:	00003617          	auipc	a2,0x3
ffffffffc0203a5c:	db060613          	addi	a2,a2,-592 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203a60:	06900593          	li	a1,105
ffffffffc0203a64:	00004517          	auipc	a0,0x4
ffffffffc0203a68:	e4c50513          	addi	a0,a0,-436 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203a6c:	a09fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203a70:	00004697          	auipc	a3,0x4
ffffffffc0203a74:	f1868693          	addi	a3,a3,-232 # ffffffffc0207988 <etext+0x17fc>
ffffffffc0203a78:	00003617          	auipc	a2,0x3
ffffffffc0203a7c:	d9060613          	addi	a2,a2,-624 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203a80:	06600593          	li	a1,102
ffffffffc0203a84:	00004517          	auipc	a0,0x4
ffffffffc0203a88:	e2c50513          	addi	a0,a0,-468 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203a8c:	9e9fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203a90:	00004697          	auipc	a3,0x4
ffffffffc0203a94:	ee868693          	addi	a3,a3,-280 # ffffffffc0207978 <etext+0x17ec>
ffffffffc0203a98:	00003617          	auipc	a2,0x3
ffffffffc0203a9c:	d7060613          	addi	a2,a2,-656 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203aa0:	06300593          	li	a1,99
ffffffffc0203aa4:	00004517          	auipc	a0,0x4
ffffffffc0203aa8:	e0c50513          	addi	a0,a0,-500 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203aac:	9c9fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203ab0:	00004697          	auipc	a3,0x4
ffffffffc0203ab4:	eb868693          	addi	a3,a3,-328 # ffffffffc0207968 <etext+0x17dc>
ffffffffc0203ab8:	00003617          	auipc	a2,0x3
ffffffffc0203abc:	d5060613          	addi	a2,a2,-688 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203ac0:	06000593          	li	a1,96
ffffffffc0203ac4:	00004517          	auipc	a0,0x4
ffffffffc0203ac8:	dec50513          	addi	a0,a0,-532 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203acc:	9a9fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203ad0:	00004697          	auipc	a3,0x4
ffffffffc0203ad4:	e9868693          	addi	a3,a3,-360 # ffffffffc0207968 <etext+0x17dc>
ffffffffc0203ad8:	00003617          	auipc	a2,0x3
ffffffffc0203adc:	d3060613          	addi	a2,a2,-720 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203ae0:	05d00593          	li	a1,93
ffffffffc0203ae4:	00004517          	auipc	a0,0x4
ffffffffc0203ae8:	dcc50513          	addi	a0,a0,-564 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203aec:	989fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203af0:	00004697          	auipc	a3,0x4
ffffffffc0203af4:	be868693          	addi	a3,a3,-1048 # ffffffffc02076d8 <etext+0x154c>
ffffffffc0203af8:	00003617          	auipc	a2,0x3
ffffffffc0203afc:	d1060613          	addi	a2,a2,-752 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203b00:	05a00593          	li	a1,90
ffffffffc0203b04:	00004517          	auipc	a0,0x4
ffffffffc0203b08:	dac50513          	addi	a0,a0,-596 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203b0c:	969fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203b10:	00004697          	auipc	a3,0x4
ffffffffc0203b14:	bc868693          	addi	a3,a3,-1080 # ffffffffc02076d8 <etext+0x154c>
ffffffffc0203b18:	00003617          	auipc	a2,0x3
ffffffffc0203b1c:	cf060613          	addi	a2,a2,-784 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203b20:	05700593          	li	a1,87
ffffffffc0203b24:	00004517          	auipc	a0,0x4
ffffffffc0203b28:	d8c50513          	addi	a0,a0,-628 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203b2c:	949fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203b30:	00004697          	auipc	a3,0x4
ffffffffc0203b34:	ba868693          	addi	a3,a3,-1112 # ffffffffc02076d8 <etext+0x154c>
ffffffffc0203b38:	00003617          	auipc	a2,0x3
ffffffffc0203b3c:	cd060613          	addi	a2,a2,-816 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203b40:	05400593          	li	a1,84
ffffffffc0203b44:	00004517          	auipc	a0,0x4
ffffffffc0203b48:	d6c50513          	addi	a0,a0,-660 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203b4c:	929fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203b50 <_fifo_swap_out_victim>:
ffffffffc0203b50:	751c                	ld	a5,40(a0)
ffffffffc0203b52:	1141                	addi	sp,sp,-16
ffffffffc0203b54:	e406                	sd	ra,8(sp)
ffffffffc0203b56:	cf91                	beqz	a5,ffffffffc0203b72 <_fifo_swap_out_victim+0x22>
ffffffffc0203b58:	ee0d                	bnez	a2,ffffffffc0203b92 <_fifo_swap_out_victim+0x42>
ffffffffc0203b5a:	679c                	ld	a5,8(a5)
ffffffffc0203b5c:	60a2                	ld	ra,8(sp)
ffffffffc0203b5e:	4501                	li	a0,0
ffffffffc0203b60:	6394                	ld	a3,0(a5)
ffffffffc0203b62:	6798                	ld	a4,8(a5)
ffffffffc0203b64:	fd878793          	addi	a5,a5,-40
ffffffffc0203b68:	e698                	sd	a4,8(a3)
ffffffffc0203b6a:	e314                	sd	a3,0(a4)
ffffffffc0203b6c:	e19c                	sd	a5,0(a1)
ffffffffc0203b6e:	0141                	addi	sp,sp,16
ffffffffc0203b70:	8082                	ret
ffffffffc0203b72:	00004697          	auipc	a3,0x4
ffffffffc0203b76:	e8e68693          	addi	a3,a3,-370 # ffffffffc0207a00 <etext+0x1874>
ffffffffc0203b7a:	00003617          	auipc	a2,0x3
ffffffffc0203b7e:	c8e60613          	addi	a2,a2,-882 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203b82:	04100593          	li	a1,65
ffffffffc0203b86:	00004517          	auipc	a0,0x4
ffffffffc0203b8a:	d2a50513          	addi	a0,a0,-726 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203b8e:	8e7fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203b92:	00004697          	auipc	a3,0x4
ffffffffc0203b96:	e7e68693          	addi	a3,a3,-386 # ffffffffc0207a10 <etext+0x1884>
ffffffffc0203b9a:	00003617          	auipc	a2,0x3
ffffffffc0203b9e:	c6e60613          	addi	a2,a2,-914 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203ba2:	04200593          	li	a1,66
ffffffffc0203ba6:	00004517          	auipc	a0,0x4
ffffffffc0203baa:	d0a50513          	addi	a0,a0,-758 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203bae:	8c7fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203bb2 <_fifo_map_swappable>:
ffffffffc0203bb2:	751c                	ld	a5,40(a0)
ffffffffc0203bb4:	cb91                	beqz	a5,ffffffffc0203bc8 <_fifo_map_swappable+0x16>
ffffffffc0203bb6:	6394                	ld	a3,0(a5)
ffffffffc0203bb8:	02860713          	addi	a4,a2,40
ffffffffc0203bbc:	e398                	sd	a4,0(a5)
ffffffffc0203bbe:	e698                	sd	a4,8(a3)
ffffffffc0203bc0:	4501                	li	a0,0
ffffffffc0203bc2:	fa1c                	sd	a5,48(a2)
ffffffffc0203bc4:	f614                	sd	a3,40(a2)
ffffffffc0203bc6:	8082                	ret
ffffffffc0203bc8:	1141                	addi	sp,sp,-16
ffffffffc0203bca:	00004697          	auipc	a3,0x4
ffffffffc0203bce:	e5668693          	addi	a3,a3,-426 # ffffffffc0207a20 <etext+0x1894>
ffffffffc0203bd2:	00003617          	auipc	a2,0x3
ffffffffc0203bd6:	c3660613          	addi	a2,a2,-970 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203bda:	03200593          	li	a1,50
ffffffffc0203bde:	00004517          	auipc	a0,0x4
ffffffffc0203be2:	cd250513          	addi	a0,a0,-814 # ffffffffc02078b0 <etext+0x1724>
ffffffffc0203be6:	e406                	sd	ra,8(sp)
ffffffffc0203be8:	88dfc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203bec <check_vma_overlap.part.0>:
ffffffffc0203bec:	1141                	addi	sp,sp,-16
ffffffffc0203bee:	00004697          	auipc	a3,0x4
ffffffffc0203bf2:	e6a68693          	addi	a3,a3,-406 # ffffffffc0207a58 <etext+0x18cc>
ffffffffc0203bf6:	00003617          	auipc	a2,0x3
ffffffffc0203bfa:	c1260613          	addi	a2,a2,-1006 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203bfe:	06d00593          	li	a1,109
ffffffffc0203c02:	00004517          	auipc	a0,0x4
ffffffffc0203c06:	e7650513          	addi	a0,a0,-394 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0203c0a:	e406                	sd	ra,8(sp)
ffffffffc0203c0c:	869fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203c10 <mm_create>:
ffffffffc0203c10:	1141                	addi	sp,sp,-16
ffffffffc0203c12:	04000513          	li	a0,64
ffffffffc0203c16:	e022                	sd	s0,0(sp)
ffffffffc0203c18:	e406                	sd	ra,8(sp)
ffffffffc0203c1a:	ddffd0ef          	jal	ffffffffc02019f8 <kmalloc>
ffffffffc0203c1e:	842a                	mv	s0,a0
ffffffffc0203c20:	c505                	beqz	a0,ffffffffc0203c48 <mm_create+0x38>
ffffffffc0203c22:	e408                	sd	a0,8(s0)
ffffffffc0203c24:	e008                	sd	a0,0(s0)
ffffffffc0203c26:	00053823          	sd	zero,16(a0)
ffffffffc0203c2a:	00053c23          	sd	zero,24(a0)
ffffffffc0203c2e:	02052023          	sw	zero,32(a0)
ffffffffc0203c32:	00033797          	auipc	a5,0x33
ffffffffc0203c36:	6467a783          	lw	a5,1606(a5) # ffffffffc0237278 <swap_init_ok>
ffffffffc0203c3a:	ef81                	bnez	a5,ffffffffc0203c52 <mm_create+0x42>
ffffffffc0203c3c:	02053423          	sd	zero,40(a0)
ffffffffc0203c40:	02042823          	sw	zero,48(s0)
ffffffffc0203c44:	02043c23          	sd	zero,56(s0)
ffffffffc0203c48:	60a2                	ld	ra,8(sp)
ffffffffc0203c4a:	8522                	mv	a0,s0
ffffffffc0203c4c:	6402                	ld	s0,0(sp)
ffffffffc0203c4e:	0141                	addi	sp,sp,16
ffffffffc0203c50:	8082                	ret
ffffffffc0203c52:	a11ff0ef          	jal	ffffffffc0203662 <swap_init_mm>
ffffffffc0203c56:	b7ed                	j	ffffffffc0203c40 <mm_create+0x30>

ffffffffc0203c58 <vma_create>:
ffffffffc0203c58:	1101                	addi	sp,sp,-32
ffffffffc0203c5a:	e04a                	sd	s2,0(sp)
ffffffffc0203c5c:	892a                	mv	s2,a0
ffffffffc0203c5e:	03000513          	li	a0,48
ffffffffc0203c62:	e822                	sd	s0,16(sp)
ffffffffc0203c64:	e426                	sd	s1,8(sp)
ffffffffc0203c66:	ec06                	sd	ra,24(sp)
ffffffffc0203c68:	84ae                	mv	s1,a1
ffffffffc0203c6a:	8432                	mv	s0,a2
ffffffffc0203c6c:	d8dfd0ef          	jal	ffffffffc02019f8 <kmalloc>
ffffffffc0203c70:	c509                	beqz	a0,ffffffffc0203c7a <vma_create+0x22>
ffffffffc0203c72:	01253423          	sd	s2,8(a0)
ffffffffc0203c76:	e904                	sd	s1,16(a0)
ffffffffc0203c78:	cd00                	sw	s0,24(a0)
ffffffffc0203c7a:	60e2                	ld	ra,24(sp)
ffffffffc0203c7c:	6442                	ld	s0,16(sp)
ffffffffc0203c7e:	64a2                	ld	s1,8(sp)
ffffffffc0203c80:	6902                	ld	s2,0(sp)
ffffffffc0203c82:	6105                	addi	sp,sp,32
ffffffffc0203c84:	8082                	ret

ffffffffc0203c86 <find_vma>:
ffffffffc0203c86:	86aa                	mv	a3,a0
ffffffffc0203c88:	c505                	beqz	a0,ffffffffc0203cb0 <find_vma+0x2a>
ffffffffc0203c8a:	6908                	ld	a0,16(a0)
ffffffffc0203c8c:	c501                	beqz	a0,ffffffffc0203c94 <find_vma+0xe>
ffffffffc0203c8e:	651c                	ld	a5,8(a0)
ffffffffc0203c90:	02f5f663          	bgeu	a1,a5,ffffffffc0203cbc <find_vma+0x36>
ffffffffc0203c94:	669c                	ld	a5,8(a3)
ffffffffc0203c96:	00f68d63          	beq	a3,a5,ffffffffc0203cb0 <find_vma+0x2a>
ffffffffc0203c9a:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203c9e:	00e5e663          	bltu	a1,a4,ffffffffc0203caa <find_vma+0x24>
ffffffffc0203ca2:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203ca6:	00e5e763          	bltu	a1,a4,ffffffffc0203cb4 <find_vma+0x2e>
ffffffffc0203caa:	679c                	ld	a5,8(a5)
ffffffffc0203cac:	fef697e3          	bne	a3,a5,ffffffffc0203c9a <find_vma+0x14>
ffffffffc0203cb0:	4501                	li	a0,0
ffffffffc0203cb2:	8082                	ret
ffffffffc0203cb4:	fe078513          	addi	a0,a5,-32
ffffffffc0203cb8:	ea88                	sd	a0,16(a3)
ffffffffc0203cba:	8082                	ret
ffffffffc0203cbc:	691c                	ld	a5,16(a0)
ffffffffc0203cbe:	fcf5fbe3          	bgeu	a1,a5,ffffffffc0203c94 <find_vma+0xe>
ffffffffc0203cc2:	ea88                	sd	a0,16(a3)
ffffffffc0203cc4:	8082                	ret

ffffffffc0203cc6 <insert_vma_struct>:
ffffffffc0203cc6:	6590                	ld	a2,8(a1)
ffffffffc0203cc8:	0105b803          	ld	a6,16(a1) # 1010 <_binary_obj___user_faultread_out_size-0xee0>
ffffffffc0203ccc:	1141                	addi	sp,sp,-16
ffffffffc0203cce:	e406                	sd	ra,8(sp)
ffffffffc0203cd0:	87aa                	mv	a5,a0
ffffffffc0203cd2:	01066763          	bltu	a2,a6,ffffffffc0203ce0 <insert_vma_struct+0x1a>
ffffffffc0203cd6:	a085                	j	ffffffffc0203d36 <insert_vma_struct+0x70>
ffffffffc0203cd8:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203cdc:	04e66863          	bltu	a2,a4,ffffffffc0203d2c <insert_vma_struct+0x66>
ffffffffc0203ce0:	86be                	mv	a3,a5
ffffffffc0203ce2:	679c                	ld	a5,8(a5)
ffffffffc0203ce4:	fef51ae3          	bne	a0,a5,ffffffffc0203cd8 <insert_vma_struct+0x12>
ffffffffc0203ce8:	02a68463          	beq	a3,a0,ffffffffc0203d10 <insert_vma_struct+0x4a>
ffffffffc0203cec:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203cf0:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203cf4:	08e8f163          	bgeu	a7,a4,ffffffffc0203d76 <insert_vma_struct+0xb0>
ffffffffc0203cf8:	04e66f63          	bltu	a2,a4,ffffffffc0203d56 <insert_vma_struct+0x90>
ffffffffc0203cfc:	00f50a63          	beq	a0,a5,ffffffffc0203d10 <insert_vma_struct+0x4a>
ffffffffc0203d00:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d04:	05076963          	bltu	a4,a6,ffffffffc0203d56 <insert_vma_struct+0x90>
ffffffffc0203d08:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203d0c:	02c77363          	bgeu	a4,a2,ffffffffc0203d32 <insert_vma_struct+0x6c>
ffffffffc0203d10:	5118                	lw	a4,32(a0)
ffffffffc0203d12:	e188                	sd	a0,0(a1)
ffffffffc0203d14:	02058613          	addi	a2,a1,32
ffffffffc0203d18:	e390                	sd	a2,0(a5)
ffffffffc0203d1a:	e690                	sd	a2,8(a3)
ffffffffc0203d1c:	60a2                	ld	ra,8(sp)
ffffffffc0203d1e:	f59c                	sd	a5,40(a1)
ffffffffc0203d20:	f194                	sd	a3,32(a1)
ffffffffc0203d22:	0017079b          	addiw	a5,a4,1 # 1001 <_binary_obj___user_faultread_out_size-0xeef>
ffffffffc0203d26:	d11c                	sw	a5,32(a0)
ffffffffc0203d28:	0141                	addi	sp,sp,16
ffffffffc0203d2a:	8082                	ret
ffffffffc0203d2c:	fca690e3          	bne	a3,a0,ffffffffc0203cec <insert_vma_struct+0x26>
ffffffffc0203d30:	bfd1                	j	ffffffffc0203d04 <insert_vma_struct+0x3e>
ffffffffc0203d32:	ebbff0ef          	jal	ffffffffc0203bec <check_vma_overlap.part.0>
ffffffffc0203d36:	00004697          	auipc	a3,0x4
ffffffffc0203d3a:	d5268693          	addi	a3,a3,-686 # ffffffffc0207a88 <etext+0x18fc>
ffffffffc0203d3e:	00003617          	auipc	a2,0x3
ffffffffc0203d42:	aca60613          	addi	a2,a2,-1334 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203d46:	07400593          	li	a1,116
ffffffffc0203d4a:	00004517          	auipc	a0,0x4
ffffffffc0203d4e:	d2e50513          	addi	a0,a0,-722 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0203d52:	f22fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203d56:	00004697          	auipc	a3,0x4
ffffffffc0203d5a:	d7268693          	addi	a3,a3,-654 # ffffffffc0207ac8 <etext+0x193c>
ffffffffc0203d5e:	00003617          	auipc	a2,0x3
ffffffffc0203d62:	aaa60613          	addi	a2,a2,-1366 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203d66:	06c00593          	li	a1,108
ffffffffc0203d6a:	00004517          	auipc	a0,0x4
ffffffffc0203d6e:	d0e50513          	addi	a0,a0,-754 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0203d72:	f02fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0203d76:	00004697          	auipc	a3,0x4
ffffffffc0203d7a:	d3268693          	addi	a3,a3,-718 # ffffffffc0207aa8 <etext+0x191c>
ffffffffc0203d7e:	00003617          	auipc	a2,0x3
ffffffffc0203d82:	a8a60613          	addi	a2,a2,-1398 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203d86:	06b00593          	li	a1,107
ffffffffc0203d8a:	00004517          	auipc	a0,0x4
ffffffffc0203d8e:	cee50513          	addi	a0,a0,-786 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0203d92:	ee2fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203d96 <mm_destroy>:
ffffffffc0203d96:	591c                	lw	a5,48(a0)
ffffffffc0203d98:	1141                	addi	sp,sp,-16
ffffffffc0203d9a:	e406                	sd	ra,8(sp)
ffffffffc0203d9c:	e022                	sd	s0,0(sp)
ffffffffc0203d9e:	e78d                	bnez	a5,ffffffffc0203dc8 <mm_destroy+0x32>
ffffffffc0203da0:	842a                	mv	s0,a0
ffffffffc0203da2:	6508                	ld	a0,8(a0)
ffffffffc0203da4:	00a40c63          	beq	s0,a0,ffffffffc0203dbc <mm_destroy+0x26>
ffffffffc0203da8:	6118                	ld	a4,0(a0)
ffffffffc0203daa:	651c                	ld	a5,8(a0)
ffffffffc0203dac:	1501                	addi	a0,a0,-32
ffffffffc0203dae:	e71c                	sd	a5,8(a4)
ffffffffc0203db0:	e398                	sd	a4,0(a5)
ffffffffc0203db2:	cf1fd0ef          	jal	ffffffffc0201aa2 <kfree>
ffffffffc0203db6:	6408                	ld	a0,8(s0)
ffffffffc0203db8:	fea418e3          	bne	s0,a0,ffffffffc0203da8 <mm_destroy+0x12>
ffffffffc0203dbc:	8522                	mv	a0,s0
ffffffffc0203dbe:	6402                	ld	s0,0(sp)
ffffffffc0203dc0:	60a2                	ld	ra,8(sp)
ffffffffc0203dc2:	0141                	addi	sp,sp,16
ffffffffc0203dc4:	cdffd06f          	j	ffffffffc0201aa2 <kfree>
ffffffffc0203dc8:	00004697          	auipc	a3,0x4
ffffffffc0203dcc:	d2068693          	addi	a3,a3,-736 # ffffffffc0207ae8 <etext+0x195c>
ffffffffc0203dd0:	00003617          	auipc	a2,0x3
ffffffffc0203dd4:	a3860613          	addi	a2,a2,-1480 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203dd8:	09400593          	li	a1,148
ffffffffc0203ddc:	00004517          	auipc	a0,0x4
ffffffffc0203de0:	c9c50513          	addi	a0,a0,-868 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0203de4:	e90fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203de8 <mm_map>:
ffffffffc0203de8:	6785                	lui	a5,0x1
ffffffffc0203dea:	17fd                	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0xef1>
ffffffffc0203dec:	7139                	addi	sp,sp,-64
ffffffffc0203dee:	787d                	lui	a6,0xfffff
ffffffffc0203df0:	963e                	add	a2,a2,a5
ffffffffc0203df2:	f822                	sd	s0,48(sp)
ffffffffc0203df4:	f426                	sd	s1,40(sp)
ffffffffc0203df6:	962e                	add	a2,a2,a1
ffffffffc0203df8:	fc06                	sd	ra,56(sp)
ffffffffc0203dfa:	0105f4b3          	and	s1,a1,a6
ffffffffc0203dfe:	002007b7          	lui	a5,0x200
ffffffffc0203e02:	01067433          	and	s0,a2,a6
ffffffffc0203e06:	08f4e363          	bltu	s1,a5,ffffffffc0203e8c <mm_map+0xa4>
ffffffffc0203e0a:	0884f163          	bgeu	s1,s0,ffffffffc0203e8c <mm_map+0xa4>
ffffffffc0203e0e:	4785                	li	a5,1
ffffffffc0203e10:	07fe                	slli	a5,a5,0x1f
ffffffffc0203e12:	0687ed63          	bltu	a5,s0,ffffffffc0203e8c <mm_map+0xa4>
ffffffffc0203e16:	ec4e                	sd	s3,24(sp)
ffffffffc0203e18:	89aa                	mv	s3,a0
ffffffffc0203e1a:	c93d                	beqz	a0,ffffffffc0203e90 <mm_map+0xa8>
ffffffffc0203e1c:	85a6                	mv	a1,s1
ffffffffc0203e1e:	e852                	sd	s4,16(sp)
ffffffffc0203e20:	e456                	sd	s5,8(sp)
ffffffffc0203e22:	8a3a                	mv	s4,a4
ffffffffc0203e24:	8ab6                	mv	s5,a3
ffffffffc0203e26:	e61ff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc0203e2a:	c501                	beqz	a0,ffffffffc0203e32 <mm_map+0x4a>
ffffffffc0203e2c:	651c                	ld	a5,8(a0)
ffffffffc0203e2e:	0487ec63          	bltu	a5,s0,ffffffffc0203e86 <mm_map+0x9e>
ffffffffc0203e32:	03000513          	li	a0,48
ffffffffc0203e36:	f04a                	sd	s2,32(sp)
ffffffffc0203e38:	bc1fd0ef          	jal	ffffffffc02019f8 <kmalloc>
ffffffffc0203e3c:	892a                	mv	s2,a0
ffffffffc0203e3e:	5571                	li	a0,-4
ffffffffc0203e40:	02090a63          	beqz	s2,ffffffffc0203e74 <mm_map+0x8c>
ffffffffc0203e44:	00993423          	sd	s1,8(s2)
ffffffffc0203e48:	00893823          	sd	s0,16(s2)
ffffffffc0203e4c:	01592c23          	sw	s5,24(s2)
ffffffffc0203e50:	85ca                	mv	a1,s2
ffffffffc0203e52:	854e                	mv	a0,s3
ffffffffc0203e54:	e73ff0ef          	jal	ffffffffc0203cc6 <insert_vma_struct>
ffffffffc0203e58:	000a0463          	beqz	s4,ffffffffc0203e60 <mm_map+0x78>
ffffffffc0203e5c:	012a3023          	sd	s2,0(s4)
ffffffffc0203e60:	7902                	ld	s2,32(sp)
ffffffffc0203e62:	69e2                	ld	s3,24(sp)
ffffffffc0203e64:	6a42                	ld	s4,16(sp)
ffffffffc0203e66:	6aa2                	ld	s5,8(sp)
ffffffffc0203e68:	4501                	li	a0,0
ffffffffc0203e6a:	70e2                	ld	ra,56(sp)
ffffffffc0203e6c:	7442                	ld	s0,48(sp)
ffffffffc0203e6e:	74a2                	ld	s1,40(sp)
ffffffffc0203e70:	6121                	addi	sp,sp,64
ffffffffc0203e72:	8082                	ret
ffffffffc0203e74:	70e2                	ld	ra,56(sp)
ffffffffc0203e76:	7442                	ld	s0,48(sp)
ffffffffc0203e78:	7902                	ld	s2,32(sp)
ffffffffc0203e7a:	69e2                	ld	s3,24(sp)
ffffffffc0203e7c:	6a42                	ld	s4,16(sp)
ffffffffc0203e7e:	6aa2                	ld	s5,8(sp)
ffffffffc0203e80:	74a2                	ld	s1,40(sp)
ffffffffc0203e82:	6121                	addi	sp,sp,64
ffffffffc0203e84:	8082                	ret
ffffffffc0203e86:	69e2                	ld	s3,24(sp)
ffffffffc0203e88:	6a42                	ld	s4,16(sp)
ffffffffc0203e8a:	6aa2                	ld	s5,8(sp)
ffffffffc0203e8c:	5575                	li	a0,-3
ffffffffc0203e8e:	bff1                	j	ffffffffc0203e6a <mm_map+0x82>
ffffffffc0203e90:	00003697          	auipc	a3,0x3
ffffffffc0203e94:	6d068693          	addi	a3,a3,1744 # ffffffffc0207560 <etext+0x13d4>
ffffffffc0203e98:	00003617          	auipc	a2,0x3
ffffffffc0203e9c:	97060613          	addi	a2,a2,-1680 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203ea0:	0a700593          	li	a1,167
ffffffffc0203ea4:	00004517          	auipc	a0,0x4
ffffffffc0203ea8:	bd450513          	addi	a0,a0,-1068 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0203eac:	f04a                	sd	s2,32(sp)
ffffffffc0203eae:	e852                	sd	s4,16(sp)
ffffffffc0203eb0:	e456                	sd	s5,8(sp)
ffffffffc0203eb2:	dc2fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203eb6 <dup_mmap>:
ffffffffc0203eb6:	7139                	addi	sp,sp,-64
ffffffffc0203eb8:	fc06                	sd	ra,56(sp)
ffffffffc0203eba:	f822                	sd	s0,48(sp)
ffffffffc0203ebc:	f426                	sd	s1,40(sp)
ffffffffc0203ebe:	f04a                	sd	s2,32(sp)
ffffffffc0203ec0:	ec4e                	sd	s3,24(sp)
ffffffffc0203ec2:	e852                	sd	s4,16(sp)
ffffffffc0203ec4:	e456                	sd	s5,8(sp)
ffffffffc0203ec6:	c525                	beqz	a0,ffffffffc0203f2e <dup_mmap+0x78>
ffffffffc0203ec8:	892a                	mv	s2,a0
ffffffffc0203eca:	84ae                	mv	s1,a1
ffffffffc0203ecc:	842e                	mv	s0,a1
ffffffffc0203ece:	c1a5                	beqz	a1,ffffffffc0203f2e <dup_mmap+0x78>
ffffffffc0203ed0:	6000                	ld	s0,0(s0)
ffffffffc0203ed2:	04848c63          	beq	s1,s0,ffffffffc0203f2a <dup_mmap+0x74>
ffffffffc0203ed6:	03000513          	li	a0,48
ffffffffc0203eda:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203ede:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203ee2:	ff842983          	lw	s3,-8(s0)
ffffffffc0203ee6:	b13fd0ef          	jal	ffffffffc02019f8 <kmalloc>
ffffffffc0203eea:	85aa                	mv	a1,a0
ffffffffc0203eec:	c50d                	beqz	a0,ffffffffc0203f16 <dup_mmap+0x60>
ffffffffc0203eee:	01553423          	sd	s5,8(a0)
ffffffffc0203ef2:	01453823          	sd	s4,16(a0)
ffffffffc0203ef6:	01352c23          	sw	s3,24(a0)
ffffffffc0203efa:	854a                	mv	a0,s2
ffffffffc0203efc:	dcbff0ef          	jal	ffffffffc0203cc6 <insert_vma_struct>
ffffffffc0203f00:	ff043683          	ld	a3,-16(s0)
ffffffffc0203f04:	fe843603          	ld	a2,-24(s0)
ffffffffc0203f08:	6c8c                	ld	a1,24(s1)
ffffffffc0203f0a:	01893503          	ld	a0,24(s2)
ffffffffc0203f0e:	4701                	li	a4,0
ffffffffc0203f10:	d9ffe0ef          	jal	ffffffffc0202cae <copy_range>
ffffffffc0203f14:	dd55                	beqz	a0,ffffffffc0203ed0 <dup_mmap+0x1a>
ffffffffc0203f16:	5571                	li	a0,-4
ffffffffc0203f18:	70e2                	ld	ra,56(sp)
ffffffffc0203f1a:	7442                	ld	s0,48(sp)
ffffffffc0203f1c:	74a2                	ld	s1,40(sp)
ffffffffc0203f1e:	7902                	ld	s2,32(sp)
ffffffffc0203f20:	69e2                	ld	s3,24(sp)
ffffffffc0203f22:	6a42                	ld	s4,16(sp)
ffffffffc0203f24:	6aa2                	ld	s5,8(sp)
ffffffffc0203f26:	6121                	addi	sp,sp,64
ffffffffc0203f28:	8082                	ret
ffffffffc0203f2a:	4501                	li	a0,0
ffffffffc0203f2c:	b7f5                	j	ffffffffc0203f18 <dup_mmap+0x62>
ffffffffc0203f2e:	00004697          	auipc	a3,0x4
ffffffffc0203f32:	bd268693          	addi	a3,a3,-1070 # ffffffffc0207b00 <etext+0x1974>
ffffffffc0203f36:	00003617          	auipc	a2,0x3
ffffffffc0203f3a:	8d260613          	addi	a2,a2,-1838 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203f3e:	0c000593          	li	a1,192
ffffffffc0203f42:	00004517          	auipc	a0,0x4
ffffffffc0203f46:	b3650513          	addi	a0,a0,-1226 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0203f4a:	d2afc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203f4e <exit_mmap>:
ffffffffc0203f4e:	1101                	addi	sp,sp,-32
ffffffffc0203f50:	ec06                	sd	ra,24(sp)
ffffffffc0203f52:	e822                	sd	s0,16(sp)
ffffffffc0203f54:	e426                	sd	s1,8(sp)
ffffffffc0203f56:	e04a                	sd	s2,0(sp)
ffffffffc0203f58:	c531                	beqz	a0,ffffffffc0203fa4 <exit_mmap+0x56>
ffffffffc0203f5a:	591c                	lw	a5,48(a0)
ffffffffc0203f5c:	84aa                	mv	s1,a0
ffffffffc0203f5e:	e3b9                	bnez	a5,ffffffffc0203fa4 <exit_mmap+0x56>
ffffffffc0203f60:	6500                	ld	s0,8(a0)
ffffffffc0203f62:	01853903          	ld	s2,24(a0)
ffffffffc0203f66:	02850663          	beq	a0,s0,ffffffffc0203f92 <exit_mmap+0x44>
ffffffffc0203f6a:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f6e:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f72:	854a                	mv	a0,s2
ffffffffc0203f74:	f93fd0ef          	jal	ffffffffc0201f06 <unmap_range>
ffffffffc0203f78:	6400                	ld	s0,8(s0)
ffffffffc0203f7a:	fe8498e3          	bne	s1,s0,ffffffffc0203f6a <exit_mmap+0x1c>
ffffffffc0203f7e:	6400                	ld	s0,8(s0)
ffffffffc0203f80:	00848c63          	beq	s1,s0,ffffffffc0203f98 <exit_mmap+0x4a>
ffffffffc0203f84:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f88:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f8c:	854a                	mv	a0,s2
ffffffffc0203f8e:	8a2fe0ef          	jal	ffffffffc0202030 <exit_range>
ffffffffc0203f92:	6400                	ld	s0,8(s0)
ffffffffc0203f94:	fe8498e3          	bne	s1,s0,ffffffffc0203f84 <exit_mmap+0x36>
ffffffffc0203f98:	60e2                	ld	ra,24(sp)
ffffffffc0203f9a:	6442                	ld	s0,16(sp)
ffffffffc0203f9c:	64a2                	ld	s1,8(sp)
ffffffffc0203f9e:	6902                	ld	s2,0(sp)
ffffffffc0203fa0:	6105                	addi	sp,sp,32
ffffffffc0203fa2:	8082                	ret
ffffffffc0203fa4:	00004697          	auipc	a3,0x4
ffffffffc0203fa8:	b7c68693          	addi	a3,a3,-1156 # ffffffffc0207b20 <etext+0x1994>
ffffffffc0203fac:	00003617          	auipc	a2,0x3
ffffffffc0203fb0:	85c60613          	addi	a2,a2,-1956 # ffffffffc0206808 <etext+0x67c>
ffffffffc0203fb4:	0d600593          	li	a1,214
ffffffffc0203fb8:	00004517          	auipc	a0,0x4
ffffffffc0203fbc:	ac050513          	addi	a0,a0,-1344 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0203fc0:	cb4fc0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0203fc4 <vmm_init>:
ffffffffc0203fc4:	7139                	addi	sp,sp,-64
ffffffffc0203fc6:	f822                	sd	s0,48(sp)
ffffffffc0203fc8:	f426                	sd	s1,40(sp)
ffffffffc0203fca:	fc06                	sd	ra,56(sp)
ffffffffc0203fcc:	f04a                	sd	s2,32(sp)
ffffffffc0203fce:	ec4e                	sd	s3,24(sp)
ffffffffc0203fd0:	e852                	sd	s4,16(sp)
ffffffffc0203fd2:	e456                	sd	s5,8(sp)
ffffffffc0203fd4:	c3dff0ef          	jal	ffffffffc0203c10 <mm_create>
ffffffffc0203fd8:	842a                	mv	s0,a0
ffffffffc0203fda:	03200493          	li	s1,50
ffffffffc0203fde:	32050863          	beqz	a0,ffffffffc020430e <vmm_init+0x34a>
ffffffffc0203fe2:	03000513          	li	a0,48
ffffffffc0203fe6:	a13fd0ef          	jal	ffffffffc02019f8 <kmalloc>
ffffffffc0203fea:	85aa                	mv	a1,a0
ffffffffc0203fec:	22050163          	beqz	a0,ffffffffc020420e <vmm_init+0x24a>
ffffffffc0203ff0:	00248793          	addi	a5,s1,2
ffffffffc0203ff4:	e504                	sd	s1,8(a0)
ffffffffc0203ff6:	e91c                	sd	a5,16(a0)
ffffffffc0203ff8:	00052c23          	sw	zero,24(a0)
ffffffffc0203ffc:	14ed                	addi	s1,s1,-5
ffffffffc0203ffe:	8522                	mv	a0,s0
ffffffffc0204000:	cc7ff0ef          	jal	ffffffffc0203cc6 <insert_vma_struct>
ffffffffc0204004:	fcf9                	bnez	s1,ffffffffc0203fe2 <vmm_init+0x1e>
ffffffffc0204006:	03700493          	li	s1,55
ffffffffc020400a:	1f900913          	li	s2,505
ffffffffc020400e:	03000513          	li	a0,48
ffffffffc0204012:	9e7fd0ef          	jal	ffffffffc02019f8 <kmalloc>
ffffffffc0204016:	85aa                	mv	a1,a0
ffffffffc0204018:	20050b63          	beqz	a0,ffffffffc020422e <vmm_init+0x26a>
ffffffffc020401c:	00248793          	addi	a5,s1,2
ffffffffc0204020:	e504                	sd	s1,8(a0)
ffffffffc0204022:	e91c                	sd	a5,16(a0)
ffffffffc0204024:	00052c23          	sw	zero,24(a0)
ffffffffc0204028:	0495                	addi	s1,s1,5
ffffffffc020402a:	8522                	mv	a0,s0
ffffffffc020402c:	c9bff0ef          	jal	ffffffffc0203cc6 <insert_vma_struct>
ffffffffc0204030:	fd249fe3          	bne	s1,s2,ffffffffc020400e <vmm_init+0x4a>
ffffffffc0204034:	641c                	ld	a5,8(s0)
ffffffffc0204036:	2a878c63          	beq	a5,s0,ffffffffc02042ee <vmm_init+0x32a>
ffffffffc020403a:	4715                	li	a4,5
ffffffffc020403c:	1f400593          	li	a1,500
ffffffffc0204040:	a021                	j	ffffffffc0204048 <vmm_init+0x84>
ffffffffc0204042:	0715                	addi	a4,a4,5
ffffffffc0204044:	2a878563          	beq	a5,s0,ffffffffc02042ee <vmm_init+0x32a>
ffffffffc0204048:	fe87b683          	ld	a3,-24(a5) # 1fffe8 <_binary_obj___user_exit_out_size+0x1fd698>
ffffffffc020404c:	26e69163          	bne	a3,a4,ffffffffc02042ae <vmm_init+0x2ea>
ffffffffc0204050:	ff07b603          	ld	a2,-16(a5)
ffffffffc0204054:	00270693          	addi	a3,a4,2
ffffffffc0204058:	24d61b63          	bne	a2,a3,ffffffffc02042ae <vmm_init+0x2ea>
ffffffffc020405c:	679c                	ld	a5,8(a5)
ffffffffc020405e:	feb712e3          	bne	a4,a1,ffffffffc0204042 <vmm_init+0x7e>
ffffffffc0204062:	4a1d                	li	s4,7
ffffffffc0204064:	4495                	li	s1,5
ffffffffc0204066:	1f900a93          	li	s5,505
ffffffffc020406a:	85a6                	mv	a1,s1
ffffffffc020406c:	8522                	mv	a0,s0
ffffffffc020406e:	c19ff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc0204072:	89aa                	mv	s3,a0
ffffffffc0204074:	24050d63          	beqz	a0,ffffffffc02042ce <vmm_init+0x30a>
ffffffffc0204078:	00148593          	addi	a1,s1,1
ffffffffc020407c:	8522                	mv	a0,s0
ffffffffc020407e:	c09ff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc0204082:	892a                	mv	s2,a0
ffffffffc0204084:	30050563          	beqz	a0,ffffffffc020438e <vmm_init+0x3ca>
ffffffffc0204088:	85d2                	mv	a1,s4
ffffffffc020408a:	8522                	mv	a0,s0
ffffffffc020408c:	bfbff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc0204090:	2c051f63          	bnez	a0,ffffffffc020436e <vmm_init+0x3aa>
ffffffffc0204094:	00348593          	addi	a1,s1,3
ffffffffc0204098:	8522                	mv	a0,s0
ffffffffc020409a:	bedff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc020409e:	2a051863          	bnez	a0,ffffffffc020434e <vmm_init+0x38a>
ffffffffc02040a2:	00448593          	addi	a1,s1,4
ffffffffc02040a6:	8522                	mv	a0,s0
ffffffffc02040a8:	bdfff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc02040ac:	28051163          	bnez	a0,ffffffffc020432e <vmm_init+0x36a>
ffffffffc02040b0:	0089b783          	ld	a5,8(s3)
ffffffffc02040b4:	1c979d63          	bne	a5,s1,ffffffffc020428e <vmm_init+0x2ca>
ffffffffc02040b8:	0109b783          	ld	a5,16(s3)
ffffffffc02040bc:	1d479963          	bne	a5,s4,ffffffffc020428e <vmm_init+0x2ca>
ffffffffc02040c0:	00893783          	ld	a5,8(s2)
ffffffffc02040c4:	1a979563          	bne	a5,s1,ffffffffc020426e <vmm_init+0x2aa>
ffffffffc02040c8:	01093783          	ld	a5,16(s2)
ffffffffc02040cc:	1b479163          	bne	a5,s4,ffffffffc020426e <vmm_init+0x2aa>
ffffffffc02040d0:	0495                	addi	s1,s1,5
ffffffffc02040d2:	0a15                	addi	s4,s4,5
ffffffffc02040d4:	f9549be3          	bne	s1,s5,ffffffffc020406a <vmm_init+0xa6>
ffffffffc02040d8:	4491                	li	s1,4
ffffffffc02040da:	597d                	li	s2,-1
ffffffffc02040dc:	85a6                	mv	a1,s1
ffffffffc02040de:	8522                	mv	a0,s0
ffffffffc02040e0:	ba7ff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc02040e4:	30051563          	bnez	a0,ffffffffc02043ee <vmm_init+0x42a>
ffffffffc02040e8:	14fd                	addi	s1,s1,-1
ffffffffc02040ea:	ff2499e3          	bne	s1,s2,ffffffffc02040dc <vmm_init+0x118>
ffffffffc02040ee:	8522                	mv	a0,s0
ffffffffc02040f0:	ca7ff0ef          	jal	ffffffffc0203d96 <mm_destroy>
ffffffffc02040f4:	00004517          	auipc	a0,0x4
ffffffffc02040f8:	b8c50513          	addi	a0,a0,-1140 # ffffffffc0207c80 <etext+0x1af4>
ffffffffc02040fc:	884fc0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0204100:	ba1fd0ef          	jal	ffffffffc0201ca0 <nr_free_pages>
ffffffffc0204104:	892a                	mv	s2,a0
ffffffffc0204106:	b0bff0ef          	jal	ffffffffc0203c10 <mm_create>
ffffffffc020410a:	00033797          	auipc	a5,0x33
ffffffffc020410e:	18a7b723          	sd	a0,398(a5) # ffffffffc0237298 <check_mm_struct>
ffffffffc0204112:	842a                	mv	s0,a0
ffffffffc0204114:	2a050d63          	beqz	a0,ffffffffc02043ce <vmm_init+0x40a>
ffffffffc0204118:	00033997          	auipc	s3,0x33
ffffffffc020411c:	1409b983          	ld	s3,320(s3) # ffffffffc0237258 <boot_pgdir>
ffffffffc0204120:	0009b783          	ld	a5,0(s3)
ffffffffc0204124:	01353c23          	sd	s3,24(a0)
ffffffffc0204128:	2e079d63          	bnez	a5,ffffffffc0204422 <vmm_init+0x45e>
ffffffffc020412c:	03000513          	li	a0,48
ffffffffc0204130:	8c9fd0ef          	jal	ffffffffc02019f8 <kmalloc>
ffffffffc0204134:	84aa                	mv	s1,a0
ffffffffc0204136:	10050c63          	beqz	a0,ffffffffc020424e <vmm_init+0x28a>
ffffffffc020413a:	002007b7          	lui	a5,0x200
ffffffffc020413e:	e91c                	sd	a5,16(a0)
ffffffffc0204140:	4789                	li	a5,2
ffffffffc0204142:	cd1c                	sw	a5,24(a0)
ffffffffc0204144:	85aa                	mv	a1,a0
ffffffffc0204146:	00053423          	sd	zero,8(a0)
ffffffffc020414a:	8522                	mv	a0,s0
ffffffffc020414c:	b7bff0ef          	jal	ffffffffc0203cc6 <insert_vma_struct>
ffffffffc0204150:	10000593          	li	a1,256
ffffffffc0204154:	8522                	mv	a0,s0
ffffffffc0204156:	b31ff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc020415a:	10000793          	li	a5,256
ffffffffc020415e:	16400713          	li	a4,356
ffffffffc0204162:	24a49663          	bne	s1,a0,ffffffffc02043ae <vmm_init+0x3ea>
ffffffffc0204166:	00f78023          	sb	a5,0(a5) # 200000 <_binary_obj___user_exit_out_size+0x1fd6b0>
ffffffffc020416a:	0785                	addi	a5,a5,1
ffffffffc020416c:	fee79de3          	bne	a5,a4,ffffffffc0204166 <vmm_init+0x1a2>
ffffffffc0204170:	6705                	lui	a4,0x1
ffffffffc0204172:	10000793          	li	a5,256
ffffffffc0204176:	35670713          	addi	a4,a4,854 # 1356 <_binary_obj___user_faultread_out_size-0xb9a>
ffffffffc020417a:	16400613          	li	a2,356
ffffffffc020417e:	0007c683          	lbu	a3,0(a5)
ffffffffc0204182:	0785                	addi	a5,a5,1
ffffffffc0204184:	9f15                	subw	a4,a4,a3
ffffffffc0204186:	fec79ce3          	bne	a5,a2,ffffffffc020417e <vmm_init+0x1ba>
ffffffffc020418a:	2e071863          	bnez	a4,ffffffffc020447a <vmm_init+0x4b6>
ffffffffc020418e:	4581                	li	a1,0
ffffffffc0204190:	854e                	mv	a0,s3
ffffffffc0204192:	fd7fd0ef          	jal	ffffffffc0202168 <page_remove>
ffffffffc0204196:	0009b783          	ld	a5,0(s3)
ffffffffc020419a:	00033717          	auipc	a4,0x33
ffffffffc020419e:	0ce73703          	ld	a4,206(a4) # ffffffffc0237268 <npage>
ffffffffc02041a2:	078a                	slli	a5,a5,0x2
ffffffffc02041a4:	83b1                	srli	a5,a5,0xc
ffffffffc02041a6:	2ae7fe63          	bgeu	a5,a4,ffffffffc0204462 <vmm_init+0x49e>
ffffffffc02041aa:	00004717          	auipc	a4,0x4
ffffffffc02041ae:	6c673703          	ld	a4,1734(a4) # ffffffffc0208870 <nbase>
ffffffffc02041b2:	8f99                	sub	a5,a5,a4
ffffffffc02041b4:	079a                	slli	a5,a5,0x6
ffffffffc02041b6:	00033517          	auipc	a0,0x33
ffffffffc02041ba:	0ba53503          	ld	a0,186(a0) # ffffffffc0237270 <pages>
ffffffffc02041be:	953e                	add	a0,a0,a5
ffffffffc02041c0:	4585                	li	a1,1
ffffffffc02041c2:	a9ffd0ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc02041c6:	0009b023          	sd	zero,0(s3)
ffffffffc02041ca:	8522                	mv	a0,s0
ffffffffc02041cc:	00043c23          	sd	zero,24(s0)
ffffffffc02041d0:	bc7ff0ef          	jal	ffffffffc0203d96 <mm_destroy>
ffffffffc02041d4:	197d                	addi	s2,s2,-1
ffffffffc02041d6:	00033797          	auipc	a5,0x33
ffffffffc02041da:	0c07b123          	sd	zero,194(a5) # ffffffffc0237298 <check_mm_struct>
ffffffffc02041de:	ac3fd0ef          	jal	ffffffffc0201ca0 <nr_free_pages>
ffffffffc02041e2:	26a91063          	bne	s2,a0,ffffffffc0204442 <vmm_init+0x47e>
ffffffffc02041e6:	00004517          	auipc	a0,0x4
ffffffffc02041ea:	b2a50513          	addi	a0,a0,-1238 # ffffffffc0207d10 <etext+0x1b84>
ffffffffc02041ee:	f93fb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02041f2:	7442                	ld	s0,48(sp)
ffffffffc02041f4:	70e2                	ld	ra,56(sp)
ffffffffc02041f6:	74a2                	ld	s1,40(sp)
ffffffffc02041f8:	7902                	ld	s2,32(sp)
ffffffffc02041fa:	69e2                	ld	s3,24(sp)
ffffffffc02041fc:	6a42                	ld	s4,16(sp)
ffffffffc02041fe:	6aa2                	ld	s5,8(sp)
ffffffffc0204200:	00004517          	auipc	a0,0x4
ffffffffc0204204:	b3050513          	addi	a0,a0,-1232 # ffffffffc0207d30 <etext+0x1ba4>
ffffffffc0204208:	6121                	addi	sp,sp,64
ffffffffc020420a:	f77fb06f          	j	ffffffffc0200180 <cprintf>
ffffffffc020420e:	00003697          	auipc	a3,0x3
ffffffffc0204212:	38a68693          	addi	a3,a3,906 # ffffffffc0207598 <etext+0x140c>
ffffffffc0204216:	00002617          	auipc	a2,0x2
ffffffffc020421a:	5f260613          	addi	a2,a2,1522 # ffffffffc0206808 <etext+0x67c>
ffffffffc020421e:	11300593          	li	a1,275
ffffffffc0204222:	00004517          	auipc	a0,0x4
ffffffffc0204226:	85650513          	addi	a0,a0,-1962 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020422a:	a4afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020422e:	00003697          	auipc	a3,0x3
ffffffffc0204232:	36a68693          	addi	a3,a3,874 # ffffffffc0207598 <etext+0x140c>
ffffffffc0204236:	00002617          	auipc	a2,0x2
ffffffffc020423a:	5d260613          	addi	a2,a2,1490 # ffffffffc0206808 <etext+0x67c>
ffffffffc020423e:	11900593          	li	a1,281
ffffffffc0204242:	00004517          	auipc	a0,0x4
ffffffffc0204246:	83650513          	addi	a0,a0,-1994 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020424a:	a2afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020424e:	00003697          	auipc	a3,0x3
ffffffffc0204252:	34a68693          	addi	a3,a3,842 # ffffffffc0207598 <etext+0x140c>
ffffffffc0204256:	00002617          	auipc	a2,0x2
ffffffffc020425a:	5b260613          	addi	a2,a2,1458 # ffffffffc0206808 <etext+0x67c>
ffffffffc020425e:	15200593          	li	a1,338
ffffffffc0204262:	00004517          	auipc	a0,0x4
ffffffffc0204266:	81650513          	addi	a0,a0,-2026 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020426a:	a0afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020426e:	00004697          	auipc	a3,0x4
ffffffffc0204272:	9a268693          	addi	a3,a3,-1630 # ffffffffc0207c10 <etext+0x1a84>
ffffffffc0204276:	00002617          	auipc	a2,0x2
ffffffffc020427a:	59260613          	addi	a2,a2,1426 # ffffffffc0206808 <etext+0x67c>
ffffffffc020427e:	13300593          	li	a1,307
ffffffffc0204282:	00003517          	auipc	a0,0x3
ffffffffc0204286:	7f650513          	addi	a0,a0,2038 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020428a:	9eafc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020428e:	00004697          	auipc	a3,0x4
ffffffffc0204292:	95268693          	addi	a3,a3,-1710 # ffffffffc0207be0 <etext+0x1a54>
ffffffffc0204296:	00002617          	auipc	a2,0x2
ffffffffc020429a:	57260613          	addi	a2,a2,1394 # ffffffffc0206808 <etext+0x67c>
ffffffffc020429e:	13200593          	li	a1,306
ffffffffc02042a2:	00003517          	auipc	a0,0x3
ffffffffc02042a6:	7d650513          	addi	a0,a0,2006 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc02042aa:	9cafc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02042ae:	00004697          	auipc	a3,0x4
ffffffffc02042b2:	8aa68693          	addi	a3,a3,-1878 # ffffffffc0207b58 <etext+0x19cc>
ffffffffc02042b6:	00002617          	auipc	a2,0x2
ffffffffc02042ba:	55260613          	addi	a2,a2,1362 # ffffffffc0206808 <etext+0x67c>
ffffffffc02042be:	12200593          	li	a1,290
ffffffffc02042c2:	00003517          	auipc	a0,0x3
ffffffffc02042c6:	7b650513          	addi	a0,a0,1974 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc02042ca:	9aafc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02042ce:	00004697          	auipc	a3,0x4
ffffffffc02042d2:	8c268693          	addi	a3,a3,-1854 # ffffffffc0207b90 <etext+0x1a04>
ffffffffc02042d6:	00002617          	auipc	a2,0x2
ffffffffc02042da:	53260613          	addi	a2,a2,1330 # ffffffffc0206808 <etext+0x67c>
ffffffffc02042de:	12800593          	li	a1,296
ffffffffc02042e2:	00003517          	auipc	a0,0x3
ffffffffc02042e6:	79650513          	addi	a0,a0,1942 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc02042ea:	98afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02042ee:	00004697          	auipc	a3,0x4
ffffffffc02042f2:	85268693          	addi	a3,a3,-1966 # ffffffffc0207b40 <etext+0x19b4>
ffffffffc02042f6:	00002617          	auipc	a2,0x2
ffffffffc02042fa:	51260613          	addi	a2,a2,1298 # ffffffffc0206808 <etext+0x67c>
ffffffffc02042fe:	12000593          	li	a1,288
ffffffffc0204302:	00003517          	auipc	a0,0x3
ffffffffc0204306:	77650513          	addi	a0,a0,1910 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020430a:	96afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020430e:	00003697          	auipc	a3,0x3
ffffffffc0204312:	25268693          	addi	a3,a3,594 # ffffffffc0207560 <etext+0x13d4>
ffffffffc0204316:	00002617          	auipc	a2,0x2
ffffffffc020431a:	4f260613          	addi	a2,a2,1266 # ffffffffc0206808 <etext+0x67c>
ffffffffc020431e:	10c00593          	li	a1,268
ffffffffc0204322:	00003517          	auipc	a0,0x3
ffffffffc0204326:	75650513          	addi	a0,a0,1878 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020432a:	94afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020432e:	00004697          	auipc	a3,0x4
ffffffffc0204332:	8a268693          	addi	a3,a3,-1886 # ffffffffc0207bd0 <etext+0x1a44>
ffffffffc0204336:	00002617          	auipc	a2,0x2
ffffffffc020433a:	4d260613          	addi	a2,a2,1234 # ffffffffc0206808 <etext+0x67c>
ffffffffc020433e:	13000593          	li	a1,304
ffffffffc0204342:	00003517          	auipc	a0,0x3
ffffffffc0204346:	73650513          	addi	a0,a0,1846 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020434a:	92afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020434e:	00004697          	auipc	a3,0x4
ffffffffc0204352:	87268693          	addi	a3,a3,-1934 # ffffffffc0207bc0 <etext+0x1a34>
ffffffffc0204356:	00002617          	auipc	a2,0x2
ffffffffc020435a:	4b260613          	addi	a2,a2,1202 # ffffffffc0206808 <etext+0x67c>
ffffffffc020435e:	12e00593          	li	a1,302
ffffffffc0204362:	00003517          	auipc	a0,0x3
ffffffffc0204366:	71650513          	addi	a0,a0,1814 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020436a:	90afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020436e:	00004697          	auipc	a3,0x4
ffffffffc0204372:	84268693          	addi	a3,a3,-1982 # ffffffffc0207bb0 <etext+0x1a24>
ffffffffc0204376:	00002617          	auipc	a2,0x2
ffffffffc020437a:	49260613          	addi	a2,a2,1170 # ffffffffc0206808 <etext+0x67c>
ffffffffc020437e:	12c00593          	li	a1,300
ffffffffc0204382:	00003517          	auipc	a0,0x3
ffffffffc0204386:	6f650513          	addi	a0,a0,1782 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020438a:	8eafc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020438e:	00004697          	auipc	a3,0x4
ffffffffc0204392:	81268693          	addi	a3,a3,-2030 # ffffffffc0207ba0 <etext+0x1a14>
ffffffffc0204396:	00002617          	auipc	a2,0x2
ffffffffc020439a:	47260613          	addi	a2,a2,1138 # ffffffffc0206808 <etext+0x67c>
ffffffffc020439e:	12a00593          	li	a1,298
ffffffffc02043a2:	00003517          	auipc	a0,0x3
ffffffffc02043a6:	6d650513          	addi	a0,a0,1750 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc02043aa:	8cafc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02043ae:	00004697          	auipc	a3,0x4
ffffffffc02043b2:	90a68693          	addi	a3,a3,-1782 # ffffffffc0207cb8 <etext+0x1b2c>
ffffffffc02043b6:	00002617          	auipc	a2,0x2
ffffffffc02043ba:	45260613          	addi	a2,a2,1106 # ffffffffc0206808 <etext+0x67c>
ffffffffc02043be:	15700593          	li	a1,343
ffffffffc02043c2:	00003517          	auipc	a0,0x3
ffffffffc02043c6:	6b650513          	addi	a0,a0,1718 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc02043ca:	8aafc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02043ce:	00004697          	auipc	a3,0x4
ffffffffc02043d2:	8d268693          	addi	a3,a3,-1838 # ffffffffc0207ca0 <etext+0x1b14>
ffffffffc02043d6:	00002617          	auipc	a2,0x2
ffffffffc02043da:	43260613          	addi	a2,a2,1074 # ffffffffc0206808 <etext+0x67c>
ffffffffc02043de:	14b00593          	li	a1,331
ffffffffc02043e2:	00003517          	auipc	a0,0x3
ffffffffc02043e6:	69650513          	addi	a0,a0,1686 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc02043ea:	88afc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02043ee:	6914                	ld	a3,16(a0)
ffffffffc02043f0:	6510                	ld	a2,8(a0)
ffffffffc02043f2:	0004859b          	sext.w	a1,s1
ffffffffc02043f6:	00004517          	auipc	a0,0x4
ffffffffc02043fa:	84a50513          	addi	a0,a0,-1974 # ffffffffc0207c40 <etext+0x1ab4>
ffffffffc02043fe:	d83fb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0204402:	00004697          	auipc	a3,0x4
ffffffffc0204406:	86668693          	addi	a3,a3,-1946 # ffffffffc0207c68 <etext+0x1adc>
ffffffffc020440a:	00002617          	auipc	a2,0x2
ffffffffc020440e:	3fe60613          	addi	a2,a2,1022 # ffffffffc0206808 <etext+0x67c>
ffffffffc0204412:	13b00593          	li	a1,315
ffffffffc0204416:	00003517          	auipc	a0,0x3
ffffffffc020441a:	66250513          	addi	a0,a0,1634 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020441e:	856fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204422:	00003697          	auipc	a3,0x3
ffffffffc0204426:	16668693          	addi	a3,a3,358 # ffffffffc0207588 <etext+0x13fc>
ffffffffc020442a:	00002617          	auipc	a2,0x2
ffffffffc020442e:	3de60613          	addi	a2,a2,990 # ffffffffc0206808 <etext+0x67c>
ffffffffc0204432:	14f00593          	li	a1,335
ffffffffc0204436:	00003517          	auipc	a0,0x3
ffffffffc020443a:	64250513          	addi	a0,a0,1602 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020443e:	836fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204442:	00004697          	auipc	a3,0x4
ffffffffc0204446:	8a668693          	addi	a3,a3,-1882 # ffffffffc0207ce8 <etext+0x1b5c>
ffffffffc020444a:	00002617          	auipc	a2,0x2
ffffffffc020444e:	3be60613          	addi	a2,a2,958 # ffffffffc0206808 <etext+0x67c>
ffffffffc0204452:	16e00593          	li	a1,366
ffffffffc0204456:	00003517          	auipc	a0,0x3
ffffffffc020445a:	62250513          	addi	a0,a0,1570 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc020445e:	816fc0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204462:	00003617          	auipc	a2,0x3
ffffffffc0204466:	a9e60613          	addi	a2,a2,-1378 # ffffffffc0206f00 <etext+0xd74>
ffffffffc020446a:	06200593          	li	a1,98
ffffffffc020446e:	00003517          	auipc	a0,0x3
ffffffffc0204472:	9ea50513          	addi	a0,a0,-1558 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0204476:	ffffb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020447a:	00004697          	auipc	a3,0x4
ffffffffc020447e:	85e68693          	addi	a3,a3,-1954 # ffffffffc0207cd8 <etext+0x1b4c>
ffffffffc0204482:	00002617          	auipc	a2,0x2
ffffffffc0204486:	38660613          	addi	a2,a2,902 # ffffffffc0206808 <etext+0x67c>
ffffffffc020448a:	16300593          	li	a1,355
ffffffffc020448e:	00003517          	auipc	a0,0x3
ffffffffc0204492:	5ea50513          	addi	a0,a0,1514 # ffffffffc0207a78 <etext+0x18ec>
ffffffffc0204496:	fdffb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc020449a <do_pgfault>:
ffffffffc020449a:	7139                	addi	sp,sp,-64
ffffffffc020449c:	85b2                	mv	a1,a2
ffffffffc020449e:	f822                	sd	s0,48(sp)
ffffffffc02044a0:	f426                	sd	s1,40(sp)
ffffffffc02044a2:	fc06                	sd	ra,56(sp)
ffffffffc02044a4:	f04a                	sd	s2,32(sp)
ffffffffc02044a6:	8432                	mv	s0,a2
ffffffffc02044a8:	84aa                	mv	s1,a0
ffffffffc02044aa:	fdcff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc02044ae:	00033797          	auipc	a5,0x33
ffffffffc02044b2:	de27a783          	lw	a5,-542(a5) # ffffffffc0237290 <pgfault_num>
ffffffffc02044b6:	2785                	addiw	a5,a5,1
ffffffffc02044b8:	00033717          	auipc	a4,0x33
ffffffffc02044bc:	dcf72c23          	sw	a5,-552(a4) # ffffffffc0237290 <pgfault_num>
ffffffffc02044c0:	c555                	beqz	a0,ffffffffc020456c <do_pgfault+0xd2>
ffffffffc02044c2:	651c                	ld	a5,8(a0)
ffffffffc02044c4:	0af46463          	bltu	s0,a5,ffffffffc020456c <do_pgfault+0xd2>
ffffffffc02044c8:	4d1c                	lw	a5,24(a0)
ffffffffc02044ca:	ec4e                	sd	s3,24(sp)
ffffffffc02044cc:	49dd                	li	s3,23
ffffffffc02044ce:	8b89                	andi	a5,a5,2
ffffffffc02044d0:	cfb9                	beqz	a5,ffffffffc020452e <do_pgfault+0x94>
ffffffffc02044d2:	77fd                	lui	a5,0xfffff
ffffffffc02044d4:	6c88                	ld	a0,24(s1)
ffffffffc02044d6:	8c7d                	and	s0,s0,a5
ffffffffc02044d8:	4605                	li	a2,1
ffffffffc02044da:	85a2                	mv	a1,s0
ffffffffc02044dc:	ffefd0ef          	jal	ffffffffc0201cda <get_pte>
ffffffffc02044e0:	c555                	beqz	a0,ffffffffc020458c <do_pgfault+0xf2>
ffffffffc02044e2:	610c                	ld	a1,0(a0)
ffffffffc02044e4:	c5ad                	beqz	a1,ffffffffc020454e <do_pgfault+0xb4>
ffffffffc02044e6:	00033797          	auipc	a5,0x33
ffffffffc02044ea:	d927a783          	lw	a5,-622(a5) # ffffffffc0237278 <swap_init_ok>
ffffffffc02044ee:	cbc1                	beqz	a5,ffffffffc020457e <do_pgfault+0xe4>
ffffffffc02044f0:	0030                	addi	a2,sp,8
ffffffffc02044f2:	85a2                	mv	a1,s0
ffffffffc02044f4:	8526                	mv	a0,s1
ffffffffc02044f6:	e402                	sd	zero,8(sp)
ffffffffc02044f8:	a98ff0ef          	jal	ffffffffc0203790 <swap_in>
ffffffffc02044fc:	892a                	mv	s2,a0
ffffffffc02044fe:	e915                	bnez	a0,ffffffffc0204532 <do_pgfault+0x98>
ffffffffc0204500:	65a2                	ld	a1,8(sp)
ffffffffc0204502:	6c88                	ld	a0,24(s1)
ffffffffc0204504:	86ce                	mv	a3,s3
ffffffffc0204506:	8622                	mv	a2,s0
ffffffffc0204508:	cfdfd0ef          	jal	ffffffffc0202204 <page_insert>
ffffffffc020450c:	6622                	ld	a2,8(sp)
ffffffffc020450e:	4685                	li	a3,1
ffffffffc0204510:	85a2                	mv	a1,s0
ffffffffc0204512:	8526                	mv	a0,s1
ffffffffc0204514:	95aff0ef          	jal	ffffffffc020366e <swap_map_swappable>
ffffffffc0204518:	67a2                	ld	a5,8(sp)
ffffffffc020451a:	ff80                	sd	s0,56(a5)
ffffffffc020451c:	69e2                	ld	s3,24(sp)
ffffffffc020451e:	4901                	li	s2,0
ffffffffc0204520:	70e2                	ld	ra,56(sp)
ffffffffc0204522:	7442                	ld	s0,48(sp)
ffffffffc0204524:	74a2                	ld	s1,40(sp)
ffffffffc0204526:	854a                	mv	a0,s2
ffffffffc0204528:	7902                	ld	s2,32(sp)
ffffffffc020452a:	6121                	addi	sp,sp,64
ffffffffc020452c:	8082                	ret
ffffffffc020452e:	49c1                	li	s3,16
ffffffffc0204530:	b74d                	j	ffffffffc02044d2 <do_pgfault+0x38>
ffffffffc0204532:	00004517          	auipc	a0,0x4
ffffffffc0204536:	88e50513          	addi	a0,a0,-1906 # ffffffffc0207dc0 <etext+0x1c34>
ffffffffc020453a:	c47fb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020453e:	70e2                	ld	ra,56(sp)
ffffffffc0204540:	7442                	ld	s0,48(sp)
ffffffffc0204542:	69e2                	ld	s3,24(sp)
ffffffffc0204544:	74a2                	ld	s1,40(sp)
ffffffffc0204546:	854a                	mv	a0,s2
ffffffffc0204548:	7902                	ld	s2,32(sp)
ffffffffc020454a:	6121                	addi	sp,sp,64
ffffffffc020454c:	8082                	ret
ffffffffc020454e:	6c88                	ld	a0,24(s1)
ffffffffc0204550:	864e                	mv	a2,s3
ffffffffc0204552:	85a2                	mv	a1,s0
ffffffffc0204554:	98dfe0ef          	jal	ffffffffc0202ee0 <pgdir_alloc_page>
ffffffffc0204558:	f171                	bnez	a0,ffffffffc020451c <do_pgfault+0x82>
ffffffffc020455a:	00004517          	auipc	a0,0x4
ffffffffc020455e:	83e50513          	addi	a0,a0,-1986 # ffffffffc0207d98 <etext+0x1c0c>
ffffffffc0204562:	c1ffb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0204566:	69e2                	ld	s3,24(sp)
ffffffffc0204568:	5971                	li	s2,-4
ffffffffc020456a:	bf5d                	j	ffffffffc0204520 <do_pgfault+0x86>
ffffffffc020456c:	85a2                	mv	a1,s0
ffffffffc020456e:	00003517          	auipc	a0,0x3
ffffffffc0204572:	7da50513          	addi	a0,a0,2010 # ffffffffc0207d48 <etext+0x1bbc>
ffffffffc0204576:	c0bfb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020457a:	5975                	li	s2,-3
ffffffffc020457c:	b755                	j	ffffffffc0204520 <do_pgfault+0x86>
ffffffffc020457e:	00004517          	auipc	a0,0x4
ffffffffc0204582:	86250513          	addi	a0,a0,-1950 # ffffffffc0207de0 <etext+0x1c54>
ffffffffc0204586:	bfbfb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020458a:	bff1                	j	ffffffffc0204566 <do_pgfault+0xcc>
ffffffffc020458c:	00003517          	auipc	a0,0x3
ffffffffc0204590:	7ec50513          	addi	a0,a0,2028 # ffffffffc0207d78 <etext+0x1bec>
ffffffffc0204594:	bedfb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0204598:	b7f9                	j	ffffffffc0204566 <do_pgfault+0xcc>

ffffffffc020459a <user_mem_check>:
ffffffffc020459a:	7179                	addi	sp,sp,-48
ffffffffc020459c:	f022                	sd	s0,32(sp)
ffffffffc020459e:	f406                	sd	ra,40(sp)
ffffffffc02045a0:	842e                	mv	s0,a1
ffffffffc02045a2:	c535                	beqz	a0,ffffffffc020460e <user_mem_check+0x74>
ffffffffc02045a4:	002007b7          	lui	a5,0x200
ffffffffc02045a8:	04f5ee63          	bltu	a1,a5,ffffffffc0204604 <user_mem_check+0x6a>
ffffffffc02045ac:	ec26                	sd	s1,24(sp)
ffffffffc02045ae:	00c584b3          	add	s1,a1,a2
ffffffffc02045b2:	0695fc63          	bgeu	a1,s1,ffffffffc020462a <user_mem_check+0x90>
ffffffffc02045b6:	4785                	li	a5,1
ffffffffc02045b8:	07fe                	slli	a5,a5,0x1f
ffffffffc02045ba:	0697e863          	bltu	a5,s1,ffffffffc020462a <user_mem_check+0x90>
ffffffffc02045be:	e84a                	sd	s2,16(sp)
ffffffffc02045c0:	e44e                	sd	s3,8(sp)
ffffffffc02045c2:	e052                	sd	s4,0(sp)
ffffffffc02045c4:	892a                	mv	s2,a0
ffffffffc02045c6:	89b6                	mv	s3,a3
ffffffffc02045c8:	6a05                	lui	s4,0x1
ffffffffc02045ca:	a821                	j	ffffffffc02045e2 <user_mem_check+0x48>
ffffffffc02045cc:	0027f693          	andi	a3,a5,2
ffffffffc02045d0:	9752                	add	a4,a4,s4
ffffffffc02045d2:	8ba1                	andi	a5,a5,8
ffffffffc02045d4:	c685                	beqz	a3,ffffffffc02045fc <user_mem_check+0x62>
ffffffffc02045d6:	c399                	beqz	a5,ffffffffc02045dc <user_mem_check+0x42>
ffffffffc02045d8:	02e46263          	bltu	s0,a4,ffffffffc02045fc <user_mem_check+0x62>
ffffffffc02045dc:	6900                	ld	s0,16(a0)
ffffffffc02045de:	04947863          	bgeu	s0,s1,ffffffffc020462e <user_mem_check+0x94>
ffffffffc02045e2:	85a2                	mv	a1,s0
ffffffffc02045e4:	854a                	mv	a0,s2
ffffffffc02045e6:	ea0ff0ef          	jal	ffffffffc0203c86 <find_vma>
ffffffffc02045ea:	c909                	beqz	a0,ffffffffc02045fc <user_mem_check+0x62>
ffffffffc02045ec:	6518                	ld	a4,8(a0)
ffffffffc02045ee:	00e46763          	bltu	s0,a4,ffffffffc02045fc <user_mem_check+0x62>
ffffffffc02045f2:	4d1c                	lw	a5,24(a0)
ffffffffc02045f4:	fc099ce3          	bnez	s3,ffffffffc02045cc <user_mem_check+0x32>
ffffffffc02045f8:	8b85                	andi	a5,a5,1
ffffffffc02045fa:	f3ed                	bnez	a5,ffffffffc02045dc <user_mem_check+0x42>
ffffffffc02045fc:	64e2                	ld	s1,24(sp)
ffffffffc02045fe:	6942                	ld	s2,16(sp)
ffffffffc0204600:	69a2                	ld	s3,8(sp)
ffffffffc0204602:	6a02                	ld	s4,0(sp)
ffffffffc0204604:	4501                	li	a0,0
ffffffffc0204606:	70a2                	ld	ra,40(sp)
ffffffffc0204608:	7402                	ld	s0,32(sp)
ffffffffc020460a:	6145                	addi	sp,sp,48
ffffffffc020460c:	8082                	ret
ffffffffc020460e:	c02007b7          	lui	a5,0xc0200
ffffffffc0204612:	4501                	li	a0,0
ffffffffc0204614:	fef5e9e3          	bltu	a1,a5,ffffffffc0204606 <user_mem_check+0x6c>
ffffffffc0204618:	962e                	add	a2,a2,a1
ffffffffc020461a:	fec5f6e3          	bgeu	a1,a2,ffffffffc0204606 <user_mem_check+0x6c>
ffffffffc020461e:	c8000537          	lui	a0,0xc8000
ffffffffc0204622:	0505                	addi	a0,a0,1 # ffffffffc8000001 <end+0x7dc8d41>
ffffffffc0204624:	00a63533          	sltu	a0,a2,a0
ffffffffc0204628:	bff9                	j	ffffffffc0204606 <user_mem_check+0x6c>
ffffffffc020462a:	64e2                	ld	s1,24(sp)
ffffffffc020462c:	bfe1                	j	ffffffffc0204604 <user_mem_check+0x6a>
ffffffffc020462e:	64e2                	ld	s1,24(sp)
ffffffffc0204630:	6942                	ld	s2,16(sp)
ffffffffc0204632:	69a2                	ld	s3,8(sp)
ffffffffc0204634:	6a02                	ld	s4,0(sp)
ffffffffc0204636:	4505                	li	a0,1
ffffffffc0204638:	b7f9                	j	ffffffffc0204606 <user_mem_check+0x6c>

ffffffffc020463a <swapfs_init>:
ffffffffc020463a:	1141                	addi	sp,sp,-16
ffffffffc020463c:	4505                	li	a0,1
ffffffffc020463e:	e406                	sd	ra,8(sp)
ffffffffc0204640:	fa7fb0ef          	jal	ffffffffc02005e6 <ide_device_valid>
ffffffffc0204644:	cd01                	beqz	a0,ffffffffc020465c <swapfs_init+0x22>
ffffffffc0204646:	4505                	li	a0,1
ffffffffc0204648:	fa5fb0ef          	jal	ffffffffc02005ec <ide_device_size>
ffffffffc020464c:	60a2                	ld	ra,8(sp)
ffffffffc020464e:	810d                	srli	a0,a0,0x3
ffffffffc0204650:	00033797          	auipc	a5,0x33
ffffffffc0204654:	c2a7b823          	sd	a0,-976(a5) # ffffffffc0237280 <max_swap_offset>
ffffffffc0204658:	0141                	addi	sp,sp,16
ffffffffc020465a:	8082                	ret
ffffffffc020465c:	00003617          	auipc	a2,0x3
ffffffffc0204660:	7ac60613          	addi	a2,a2,1964 # ffffffffc0207e08 <etext+0x1c7c>
ffffffffc0204664:	45b5                	li	a1,13
ffffffffc0204666:	00003517          	auipc	a0,0x3
ffffffffc020466a:	7c250513          	addi	a0,a0,1986 # ffffffffc0207e28 <etext+0x1c9c>
ffffffffc020466e:	e07fb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0204672 <swapfs_read>:
ffffffffc0204672:	1141                	addi	sp,sp,-16
ffffffffc0204674:	e406                	sd	ra,8(sp)
ffffffffc0204676:	00855793          	srli	a5,a0,0x8
ffffffffc020467a:	cbb1                	beqz	a5,ffffffffc02046ce <swapfs_read+0x5c>
ffffffffc020467c:	00033717          	auipc	a4,0x33
ffffffffc0204680:	c0473703          	ld	a4,-1020(a4) # ffffffffc0237280 <max_swap_offset>
ffffffffc0204684:	04e7f563          	bgeu	a5,a4,ffffffffc02046ce <swapfs_read+0x5c>
ffffffffc0204688:	00033717          	auipc	a4,0x33
ffffffffc020468c:	be873703          	ld	a4,-1048(a4) # ffffffffc0237270 <pages>
ffffffffc0204690:	8d99                	sub	a1,a1,a4
ffffffffc0204692:	4065d613          	srai	a2,a1,0x6
ffffffffc0204696:	00004717          	auipc	a4,0x4
ffffffffc020469a:	1da73703          	ld	a4,474(a4) # ffffffffc0208870 <nbase>
ffffffffc020469e:	963a                	add	a2,a2,a4
ffffffffc02046a0:	00c61713          	slli	a4,a2,0xc
ffffffffc02046a4:	8331                	srli	a4,a4,0xc
ffffffffc02046a6:	00033697          	auipc	a3,0x33
ffffffffc02046aa:	bc26b683          	ld	a3,-1086(a3) # ffffffffc0237268 <npage>
ffffffffc02046ae:	0037959b          	slliw	a1,a5,0x3
ffffffffc02046b2:	0632                	slli	a2,a2,0xc
ffffffffc02046b4:	02d77963          	bgeu	a4,a3,ffffffffc02046e6 <swapfs_read+0x74>
ffffffffc02046b8:	60a2                	ld	ra,8(sp)
ffffffffc02046ba:	00033797          	auipc	a5,0x33
ffffffffc02046be:	ba67b783          	ld	a5,-1114(a5) # ffffffffc0237260 <va_pa_offset>
ffffffffc02046c2:	46a1                	li	a3,8
ffffffffc02046c4:	963e                	add	a2,a2,a5
ffffffffc02046c6:	4505                	li	a0,1
ffffffffc02046c8:	0141                	addi	sp,sp,16
ffffffffc02046ca:	f29fb06f          	j	ffffffffc02005f2 <ide_read_secs>
ffffffffc02046ce:	86aa                	mv	a3,a0
ffffffffc02046d0:	00003617          	auipc	a2,0x3
ffffffffc02046d4:	77060613          	addi	a2,a2,1904 # ffffffffc0207e40 <etext+0x1cb4>
ffffffffc02046d8:	45d1                	li	a1,20
ffffffffc02046da:	00003517          	auipc	a0,0x3
ffffffffc02046de:	74e50513          	addi	a0,a0,1870 # ffffffffc0207e28 <etext+0x1c9c>
ffffffffc02046e2:	d93fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02046e6:	86b2                	mv	a3,a2
ffffffffc02046e8:	06900593          	li	a1,105
ffffffffc02046ec:	00002617          	auipc	a2,0x2
ffffffffc02046f0:	74460613          	addi	a2,a2,1860 # ffffffffc0206e30 <etext+0xca4>
ffffffffc02046f4:	00002517          	auipc	a0,0x2
ffffffffc02046f8:	76450513          	addi	a0,a0,1892 # ffffffffc0206e58 <etext+0xccc>
ffffffffc02046fc:	d79fb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0204700 <swapfs_write>:
ffffffffc0204700:	1141                	addi	sp,sp,-16
ffffffffc0204702:	e406                	sd	ra,8(sp)
ffffffffc0204704:	00855793          	srli	a5,a0,0x8
ffffffffc0204708:	cbb1                	beqz	a5,ffffffffc020475c <swapfs_write+0x5c>
ffffffffc020470a:	00033717          	auipc	a4,0x33
ffffffffc020470e:	b7673703          	ld	a4,-1162(a4) # ffffffffc0237280 <max_swap_offset>
ffffffffc0204712:	04e7f563          	bgeu	a5,a4,ffffffffc020475c <swapfs_write+0x5c>
ffffffffc0204716:	00033717          	auipc	a4,0x33
ffffffffc020471a:	b5a73703          	ld	a4,-1190(a4) # ffffffffc0237270 <pages>
ffffffffc020471e:	8d99                	sub	a1,a1,a4
ffffffffc0204720:	4065d613          	srai	a2,a1,0x6
ffffffffc0204724:	00004717          	auipc	a4,0x4
ffffffffc0204728:	14c73703          	ld	a4,332(a4) # ffffffffc0208870 <nbase>
ffffffffc020472c:	963a                	add	a2,a2,a4
ffffffffc020472e:	00c61713          	slli	a4,a2,0xc
ffffffffc0204732:	8331                	srli	a4,a4,0xc
ffffffffc0204734:	00033697          	auipc	a3,0x33
ffffffffc0204738:	b346b683          	ld	a3,-1228(a3) # ffffffffc0237268 <npage>
ffffffffc020473c:	0037959b          	slliw	a1,a5,0x3
ffffffffc0204740:	0632                	slli	a2,a2,0xc
ffffffffc0204742:	02d77963          	bgeu	a4,a3,ffffffffc0204774 <swapfs_write+0x74>
ffffffffc0204746:	60a2                	ld	ra,8(sp)
ffffffffc0204748:	00033797          	auipc	a5,0x33
ffffffffc020474c:	b187b783          	ld	a5,-1256(a5) # ffffffffc0237260 <va_pa_offset>
ffffffffc0204750:	46a1                	li	a3,8
ffffffffc0204752:	963e                	add	a2,a2,a5
ffffffffc0204754:	4505                	li	a0,1
ffffffffc0204756:	0141                	addi	sp,sp,16
ffffffffc0204758:	ebffb06f          	j	ffffffffc0200616 <ide_write_secs>
ffffffffc020475c:	86aa                	mv	a3,a0
ffffffffc020475e:	00003617          	auipc	a2,0x3
ffffffffc0204762:	6e260613          	addi	a2,a2,1762 # ffffffffc0207e40 <etext+0x1cb4>
ffffffffc0204766:	45e5                	li	a1,25
ffffffffc0204768:	00003517          	auipc	a0,0x3
ffffffffc020476c:	6c050513          	addi	a0,a0,1728 # ffffffffc0207e28 <etext+0x1c9c>
ffffffffc0204770:	d05fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204774:	86b2                	mv	a3,a2
ffffffffc0204776:	06900593          	li	a1,105
ffffffffc020477a:	00002617          	auipc	a2,0x2
ffffffffc020477e:	6b660613          	addi	a2,a2,1718 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0204782:	00002517          	auipc	a0,0x2
ffffffffc0204786:	6d650513          	addi	a0,a0,1750 # ffffffffc0206e58 <etext+0xccc>
ffffffffc020478a:	cebfb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc020478e <kernel_thread_entry>:
ffffffffc020478e:	8526                	mv	a0,s1
ffffffffc0204790:	9402                	jalr	s0
ffffffffc0204792:	670000ef          	jal	ffffffffc0204e02 <do_exit>

ffffffffc0204796 <alloc_proc>:
ffffffffc0204796:	1141                	addi	sp,sp,-16
ffffffffc0204798:	10800513          	li	a0,264
ffffffffc020479c:	e022                	sd	s0,0(sp)
ffffffffc020479e:	e406                	sd	ra,8(sp)
ffffffffc02047a0:	a58fd0ef          	jal	ffffffffc02019f8 <kmalloc>
ffffffffc02047a4:	842a                	mv	s0,a0
ffffffffc02047a6:	cd21                	beqz	a0,ffffffffc02047fe <alloc_proc+0x68>
ffffffffc02047a8:	57fd                	li	a5,-1
ffffffffc02047aa:	1782                	slli	a5,a5,0x20
ffffffffc02047ac:	e11c                	sd	a5,0(a0)
ffffffffc02047ae:	00052423          	sw	zero,8(a0)
ffffffffc02047b2:	00053823          	sd	zero,16(a0)
ffffffffc02047b6:	00053c23          	sd	zero,24(a0)
ffffffffc02047ba:	02053023          	sd	zero,32(a0)
ffffffffc02047be:	02053423          	sd	zero,40(a0)
ffffffffc02047c2:	07000613          	li	a2,112
ffffffffc02047c6:	4581                	li	a1,0
ffffffffc02047c8:	03050513          	addi	a0,a0,48
ffffffffc02047cc:	197010ef          	jal	ffffffffc0206162 <memset>
ffffffffc02047d0:	00033797          	auipc	a5,0x33
ffffffffc02047d4:	a807b783          	ld	a5,-1408(a5) # ffffffffc0237250 <boot_cr3>
ffffffffc02047d8:	0a043023          	sd	zero,160(s0)
ffffffffc02047dc:	f45c                	sd	a5,168(s0)
ffffffffc02047de:	0a042823          	sw	zero,176(s0)
ffffffffc02047e2:	463d                	li	a2,15
ffffffffc02047e4:	4581                	li	a1,0
ffffffffc02047e6:	0b440513          	addi	a0,s0,180
ffffffffc02047ea:	179010ef          	jal	ffffffffc0206162 <memset>
ffffffffc02047ee:	0e042623          	sw	zero,236(s0)
ffffffffc02047f2:	0e043c23          	sd	zero,248(s0)
ffffffffc02047f6:	10043023          	sd	zero,256(s0)
ffffffffc02047fa:	0e043823          	sd	zero,240(s0)
ffffffffc02047fe:	60a2                	ld	ra,8(sp)
ffffffffc0204800:	8522                	mv	a0,s0
ffffffffc0204802:	6402                	ld	s0,0(sp)
ffffffffc0204804:	0141                	addi	sp,sp,16
ffffffffc0204806:	8082                	ret

ffffffffc0204808 <forkret>:
ffffffffc0204808:	00033797          	auipc	a5,0x33
ffffffffc020480c:	aa07b783          	ld	a5,-1376(a5) # ffffffffc02372a8 <current>
ffffffffc0204810:	73c8                	ld	a0,160(a5)
ffffffffc0204812:	d20fc06f          	j	ffffffffc0200d32 <forkrets>

ffffffffc0204816 <user_main>:
ffffffffc0204816:	00033797          	auipc	a5,0x33
ffffffffc020481a:	a927b783          	ld	a5,-1390(a5) # ffffffffc02372a8 <current>
ffffffffc020481e:	43cc                	lw	a1,4(a5)
ffffffffc0204820:	7139                	addi	sp,sp,-64
ffffffffc0204822:	00003617          	auipc	a2,0x3
ffffffffc0204826:	63e60613          	addi	a2,a2,1598 # ffffffffc0207e60 <etext+0x1cd4>
ffffffffc020482a:	00003517          	auipc	a0,0x3
ffffffffc020482e:	64650513          	addi	a0,a0,1606 # ffffffffc0207e70 <etext+0x1ce4>
ffffffffc0204832:	fc06                	sd	ra,56(sp)
ffffffffc0204834:	94dfb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc0204838:	3fdfe797          	auipc	a5,0x3fdfe
ffffffffc020483c:	83878793          	addi	a5,a5,-1992 # 2070 <_binary_obj___user_faultreadkernel_out_size>
ffffffffc0204840:	e43e                	sd	a5,8(sp)
ffffffffc0204842:	00003517          	auipc	a0,0x3
ffffffffc0204846:	61e50513          	addi	a0,a0,1566 # ffffffffc0207e60 <etext+0x1cd4>
ffffffffc020484a:	00012797          	auipc	a5,0x12
ffffffffc020484e:	40e78793          	addi	a5,a5,1038 # ffffffffc0216c58 <_binary_obj___user_faultreadkernel_out_start>
ffffffffc0204852:	f03e                	sd	a5,32(sp)
ffffffffc0204854:	f42a                	sd	a0,40(sp)
ffffffffc0204856:	e802                	sd	zero,16(sp)
ffffffffc0204858:	075010ef          	jal	ffffffffc02060cc <strlen>
ffffffffc020485c:	ec2a                	sd	a0,24(sp)
ffffffffc020485e:	4511                	li	a0,4
ffffffffc0204860:	55a2                	lw	a1,40(sp)
ffffffffc0204862:	4662                	lw	a2,24(sp)
ffffffffc0204864:	5682                	lw	a3,32(sp)
ffffffffc0204866:	4722                	lw	a4,8(sp)
ffffffffc0204868:	48a9                	li	a7,10
ffffffffc020486a:	9002                	ebreak
ffffffffc020486c:	c82a                	sw	a0,16(sp)
ffffffffc020486e:	65c2                	ld	a1,16(sp)
ffffffffc0204870:	00003517          	auipc	a0,0x3
ffffffffc0204874:	62850513          	addi	a0,a0,1576 # ffffffffc0207e98 <etext+0x1d0c>
ffffffffc0204878:	909fb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020487c:	00003617          	auipc	a2,0x3
ffffffffc0204880:	62c60613          	addi	a2,a2,1580 # ffffffffc0207ea8 <etext+0x1d1c>
ffffffffc0204884:	34100593          	li	a1,833
ffffffffc0204888:	00003517          	auipc	a0,0x3
ffffffffc020488c:	64050513          	addi	a0,a0,1600 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0204890:	be5fb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0204894 <put_pgdir>:
ffffffffc0204894:	6d14                	ld	a3,24(a0)
ffffffffc0204896:	1141                	addi	sp,sp,-16
ffffffffc0204898:	e406                	sd	ra,8(sp)
ffffffffc020489a:	c02007b7          	lui	a5,0xc0200
ffffffffc020489e:	02f6ee63          	bltu	a3,a5,ffffffffc02048da <put_pgdir+0x46>
ffffffffc02048a2:	00033797          	auipc	a5,0x33
ffffffffc02048a6:	9be7b783          	ld	a5,-1602(a5) # ffffffffc0237260 <va_pa_offset>
ffffffffc02048aa:	8e9d                	sub	a3,a3,a5
ffffffffc02048ac:	82b1                	srli	a3,a3,0xc
ffffffffc02048ae:	00033797          	auipc	a5,0x33
ffffffffc02048b2:	9ba7b783          	ld	a5,-1606(a5) # ffffffffc0237268 <npage>
ffffffffc02048b6:	02f6fe63          	bgeu	a3,a5,ffffffffc02048f2 <put_pgdir+0x5e>
ffffffffc02048ba:	00004797          	auipc	a5,0x4
ffffffffc02048be:	fb67b783          	ld	a5,-74(a5) # ffffffffc0208870 <nbase>
ffffffffc02048c2:	60a2                	ld	ra,8(sp)
ffffffffc02048c4:	8e9d                	sub	a3,a3,a5
ffffffffc02048c6:	00033517          	auipc	a0,0x33
ffffffffc02048ca:	9aa53503          	ld	a0,-1622(a0) # ffffffffc0237270 <pages>
ffffffffc02048ce:	069a                	slli	a3,a3,0x6
ffffffffc02048d0:	4585                	li	a1,1
ffffffffc02048d2:	9536                	add	a0,a0,a3
ffffffffc02048d4:	0141                	addi	sp,sp,16
ffffffffc02048d6:	b8afd06f          	j	ffffffffc0201c60 <free_pages>
ffffffffc02048da:	00002617          	auipc	a2,0x2
ffffffffc02048de:	5fe60613          	addi	a2,a2,1534 # ffffffffc0206ed8 <etext+0xd4c>
ffffffffc02048e2:	06e00593          	li	a1,110
ffffffffc02048e6:	00002517          	auipc	a0,0x2
ffffffffc02048ea:	57250513          	addi	a0,a0,1394 # ffffffffc0206e58 <etext+0xccc>
ffffffffc02048ee:	b87fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02048f2:	00002617          	auipc	a2,0x2
ffffffffc02048f6:	60e60613          	addi	a2,a2,1550 # ffffffffc0206f00 <etext+0xd74>
ffffffffc02048fa:	06200593          	li	a1,98
ffffffffc02048fe:	00002517          	auipc	a0,0x2
ffffffffc0204902:	55a50513          	addi	a0,a0,1370 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0204906:	b6ffb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc020490a <proc_run>:
ffffffffc020490a:	7179                	addi	sp,sp,-48
ffffffffc020490c:	ec4a                	sd	s2,24(sp)
ffffffffc020490e:	00033917          	auipc	s2,0x33
ffffffffc0204912:	99a90913          	addi	s2,s2,-1638 # ffffffffc02372a8 <current>
ffffffffc0204916:	f026                	sd	s1,32(sp)
ffffffffc0204918:	00093483          	ld	s1,0(s2)
ffffffffc020491c:	f406                	sd	ra,40(sp)
ffffffffc020491e:	02a48a63          	beq	s1,a0,ffffffffc0204952 <proc_run+0x48>
ffffffffc0204922:	e84e                	sd	s3,16(sp)
ffffffffc0204924:	100027f3          	csrr	a5,sstatus
ffffffffc0204928:	8b89                	andi	a5,a5,2
ffffffffc020492a:	4981                	li	s3,0
ffffffffc020492c:	ef9d                	bnez	a5,ffffffffc020496a <proc_run+0x60>
ffffffffc020492e:	755c                	ld	a5,168(a0)
ffffffffc0204930:	577d                	li	a4,-1
ffffffffc0204932:	177e                	slli	a4,a4,0x3f
ffffffffc0204934:	83b1                	srli	a5,a5,0xc
ffffffffc0204936:	00a93023          	sd	a0,0(s2)
ffffffffc020493a:	8fd9                	or	a5,a5,a4
ffffffffc020493c:	18079073          	csrw	satp,a5
ffffffffc0204940:	03050593          	addi	a1,a0,48
ffffffffc0204944:	03048513          	addi	a0,s1,48
ffffffffc0204948:	116010ef          	jal	ffffffffc0205a5e <switch_to>
ffffffffc020494c:	00099863          	bnez	s3,ffffffffc020495c <proc_run+0x52>
ffffffffc0204950:	69c2                	ld	s3,16(sp)
ffffffffc0204952:	70a2                	ld	ra,40(sp)
ffffffffc0204954:	7482                	ld	s1,32(sp)
ffffffffc0204956:	6962                	ld	s2,24(sp)
ffffffffc0204958:	6145                	addi	sp,sp,48
ffffffffc020495a:	8082                	ret
ffffffffc020495c:	69c2                	ld	s3,16(sp)
ffffffffc020495e:	70a2                	ld	ra,40(sp)
ffffffffc0204960:	7482                	ld	s1,32(sp)
ffffffffc0204962:	6962                	ld	s2,24(sp)
ffffffffc0204964:	6145                	addi	sp,sp,48
ffffffffc0204966:	cd5fb06f          	j	ffffffffc020063a <intr_enable>
ffffffffc020496a:	e42a                	sd	a0,8(sp)
ffffffffc020496c:	cd5fb0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0204970:	6522                	ld	a0,8(sp)
ffffffffc0204972:	4985                	li	s3,1
ffffffffc0204974:	bf6d                	j	ffffffffc020492e <proc_run+0x24>

ffffffffc0204976 <do_fork>:
ffffffffc0204976:	7119                	addi	sp,sp,-128
ffffffffc0204978:	f0ca                	sd	s2,96(sp)
ffffffffc020497a:	00033917          	auipc	s2,0x33
ffffffffc020497e:	92690913          	addi	s2,s2,-1754 # ffffffffc02372a0 <nr_process>
ffffffffc0204982:	00092703          	lw	a4,0(s2)
ffffffffc0204986:	fc86                	sd	ra,120(sp)
ffffffffc0204988:	6785                	lui	a5,0x1
ffffffffc020498a:	36f75263          	bge	a4,a5,ffffffffc0204cee <do_fork+0x378>
ffffffffc020498e:	f8a2                	sd	s0,112(sp)
ffffffffc0204990:	f4a6                	sd	s1,104(sp)
ffffffffc0204992:	ecce                	sd	s3,88(sp)
ffffffffc0204994:	e8d2                	sd	s4,80(sp)
ffffffffc0204996:	89ae                	mv	s3,a1
ffffffffc0204998:	8a2a                	mv	s4,a0
ffffffffc020499a:	8432                	mv	s0,a2
ffffffffc020499c:	dfbff0ef          	jal	ffffffffc0204796 <alloc_proc>
ffffffffc02049a0:	84aa                	mv	s1,a0
ffffffffc02049a2:	32050a63          	beqz	a0,ffffffffc0204cd6 <do_fork+0x360>
ffffffffc02049a6:	f862                	sd	s8,48(sp)
ffffffffc02049a8:	00033c17          	auipc	s8,0x33
ffffffffc02049ac:	900c0c13          	addi	s8,s8,-1792 # ffffffffc02372a8 <current>
ffffffffc02049b0:	000c3783          	ld	a5,0(s8)
ffffffffc02049b4:	0ec7a703          	lw	a4,236(a5) # 10ec <_binary_obj___user_faultread_out_size-0xe04>
ffffffffc02049b8:	f11c                	sd	a5,32(a0)
ffffffffc02049ba:	3a071a63          	bnez	a4,ffffffffc0204d6e <do_fork+0x3f8>
ffffffffc02049be:	4509                	li	a0,2
ffffffffc02049c0:	a10fd0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc02049c4:	30050563          	beqz	a0,ffffffffc0204cce <do_fork+0x358>
ffffffffc02049c8:	e4d6                	sd	s5,72(sp)
ffffffffc02049ca:	00033a97          	auipc	s5,0x33
ffffffffc02049ce:	8a6a8a93          	addi	s5,s5,-1882 # ffffffffc0237270 <pages>
ffffffffc02049d2:	000ab703          	ld	a4,0(s5)
ffffffffc02049d6:	e0da                	sd	s6,64(sp)
ffffffffc02049d8:	00004b17          	auipc	s6,0x4
ffffffffc02049dc:	e98b0b13          	addi	s6,s6,-360 # ffffffffc0208870 <nbase>
ffffffffc02049e0:	000b3783          	ld	a5,0(s6)
ffffffffc02049e4:	40e506b3          	sub	a3,a0,a4
ffffffffc02049e8:	fc5e                	sd	s7,56(sp)
ffffffffc02049ea:	00033b97          	auipc	s7,0x33
ffffffffc02049ee:	87eb8b93          	addi	s7,s7,-1922 # ffffffffc0237268 <npage>
ffffffffc02049f2:	ec6e                	sd	s11,24(sp)
ffffffffc02049f4:	8699                	srai	a3,a3,0x6
ffffffffc02049f6:	5dfd                	li	s11,-1
ffffffffc02049f8:	000bb703          	ld	a4,0(s7)
ffffffffc02049fc:	96be                	add	a3,a3,a5
ffffffffc02049fe:	00cddd93          	srli	s11,s11,0xc
ffffffffc0204a02:	01b6f633          	and	a2,a3,s11
ffffffffc0204a06:	f06a                	sd	s10,32(sp)
ffffffffc0204a08:	06b2                	slli	a3,a3,0xc
ffffffffc0204a0a:	30e67d63          	bgeu	a2,a4,ffffffffc0204d24 <do_fork+0x3ae>
ffffffffc0204a0e:	000c3603          	ld	a2,0(s8)
ffffffffc0204a12:	00033c17          	auipc	s8,0x33
ffffffffc0204a16:	84ec0c13          	addi	s8,s8,-1970 # ffffffffc0237260 <va_pa_offset>
ffffffffc0204a1a:	000c3703          	ld	a4,0(s8)
ffffffffc0204a1e:	02863d03          	ld	s10,40(a2)
ffffffffc0204a22:	e43e                	sd	a5,8(sp)
ffffffffc0204a24:	9736                	add	a4,a4,a3
ffffffffc0204a26:	e898                	sd	a4,16(s1)
ffffffffc0204a28:	020d0863          	beqz	s10,ffffffffc0204a58 <do_fork+0xe2>
ffffffffc0204a2c:	100a7a13          	andi	s4,s4,256
ffffffffc0204a30:	1c0a0463          	beqz	s4,ffffffffc0204bf8 <do_fork+0x282>
ffffffffc0204a34:	030d2783          	lw	a5,48(s10)
ffffffffc0204a38:	018d3683          	ld	a3,24(s10)
ffffffffc0204a3c:	c0200737          	lui	a4,0xc0200
ffffffffc0204a40:	2785                	addiw	a5,a5,1
ffffffffc0204a42:	02fd2823          	sw	a5,48(s10)
ffffffffc0204a46:	03a4b423          	sd	s10,40(s1)
ffffffffc0204a4a:	2ce6e063          	bltu	a3,a4,ffffffffc0204d0a <do_fork+0x394>
ffffffffc0204a4e:	000c3783          	ld	a5,0(s8)
ffffffffc0204a52:	6898                	ld	a4,16(s1)
ffffffffc0204a54:	8e9d                	sub	a3,a3,a5
ffffffffc0204a56:	f4d4                	sd	a3,168(s1)
ffffffffc0204a58:	6689                	lui	a3,0x2
ffffffffc0204a5a:	ee068693          	addi	a3,a3,-288 # 1ee0 <_binary_obj___user_faultread_out_size-0x10>
ffffffffc0204a5e:	96ba                	add	a3,a3,a4
ffffffffc0204a60:	8622                	mv	a2,s0
ffffffffc0204a62:	f0d4                	sd	a3,160(s1)
ffffffffc0204a64:	87b6                	mv	a5,a3
ffffffffc0204a66:	12040313          	addi	t1,s0,288
ffffffffc0204a6a:	00063883          	ld	a7,0(a2)
ffffffffc0204a6e:	00863803          	ld	a6,8(a2)
ffffffffc0204a72:	6a08                	ld	a0,16(a2)
ffffffffc0204a74:	6e0c                	ld	a1,24(a2)
ffffffffc0204a76:	0117b023          	sd	a7,0(a5)
ffffffffc0204a7a:	0107b423          	sd	a6,8(a5)
ffffffffc0204a7e:	eb88                	sd	a0,16(a5)
ffffffffc0204a80:	ef8c                	sd	a1,24(a5)
ffffffffc0204a82:	02060613          	addi	a2,a2,32
ffffffffc0204a86:	02078793          	addi	a5,a5,32
ffffffffc0204a8a:	fe6610e3          	bne	a2,t1,ffffffffc0204a6a <do_fork+0xf4>
ffffffffc0204a8e:	0406b823          	sd	zero,80(a3)
ffffffffc0204a92:	12098d63          	beqz	s3,ffffffffc0204bcc <do_fork+0x256>
ffffffffc0204a96:	0136b823          	sd	s3,16(a3)
ffffffffc0204a9a:	00000797          	auipc	a5,0x0
ffffffffc0204a9e:	d6e78793          	addi	a5,a5,-658 # ffffffffc0204808 <forkret>
ffffffffc0204aa2:	f89c                	sd	a5,48(s1)
ffffffffc0204aa4:	fc94                	sd	a3,56(s1)
ffffffffc0204aa6:	100027f3          	csrr	a5,sstatus
ffffffffc0204aaa:	8b89                	andi	a5,a5,2
ffffffffc0204aac:	4981                	li	s3,0
ffffffffc0204aae:	14079163          	bnez	a5,ffffffffc0204bf0 <do_fork+0x27a>
ffffffffc0204ab2:	00027817          	auipc	a6,0x27
ffffffffc0204ab6:	2aa80813          	addi	a6,a6,682 # ffffffffc022bd5c <last_pid.1>
ffffffffc0204aba:	00082783          	lw	a5,0(a6)
ffffffffc0204abe:	6709                	lui	a4,0x2
ffffffffc0204ac0:	0017851b          	addiw	a0,a5,1
ffffffffc0204ac4:	00a82023          	sw	a0,0(a6)
ffffffffc0204ac8:	08e55c63          	bge	a0,a4,ffffffffc0204b60 <do_fork+0x1ea>
ffffffffc0204acc:	00027317          	auipc	t1,0x27
ffffffffc0204ad0:	28c30313          	addi	t1,t1,652 # ffffffffc022bd58 <next_safe.0>
ffffffffc0204ad4:	00032783          	lw	a5,0(t1)
ffffffffc0204ad8:	00032417          	auipc	s0,0x32
ffffffffc0204adc:	74040413          	addi	s0,s0,1856 # ffffffffc0237218 <proc_list>
ffffffffc0204ae0:	08f55863          	bge	a0,a5,ffffffffc0204b70 <do_fork+0x1fa>
ffffffffc0204ae4:	c0c8                	sw	a0,4(s1)
ffffffffc0204ae6:	45a9                	li	a1,10
ffffffffc0204ae8:	2501                	sext.w	a0,a0
ffffffffc0204aea:	1e4010ef          	jal	ffffffffc0205cce <hash32>
ffffffffc0204aee:	02051793          	slli	a5,a0,0x20
ffffffffc0204af2:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0204af6:	0002e797          	auipc	a5,0x2e
ffffffffc0204afa:	72278793          	addi	a5,a5,1826 # ffffffffc0233218 <hash_list>
ffffffffc0204afe:	953e                	add	a0,a0,a5
ffffffffc0204b00:	650c                	ld	a1,8(a0)
ffffffffc0204b02:	7094                	ld	a3,32(s1)
ffffffffc0204b04:	0d848793          	addi	a5,s1,216
ffffffffc0204b08:	e19c                	sd	a5,0(a1)
ffffffffc0204b0a:	6410                	ld	a2,8(s0)
ffffffffc0204b0c:	e51c                	sd	a5,8(a0)
ffffffffc0204b0e:	7af8                	ld	a4,240(a3)
ffffffffc0204b10:	0c848793          	addi	a5,s1,200
ffffffffc0204b14:	f0ec                	sd	a1,224(s1)
ffffffffc0204b16:	ece8                	sd	a0,216(s1)
ffffffffc0204b18:	e21c                	sd	a5,0(a2)
ffffffffc0204b1a:	e41c                	sd	a5,8(s0)
ffffffffc0204b1c:	e8f0                	sd	a2,208(s1)
ffffffffc0204b1e:	e4e0                	sd	s0,200(s1)
ffffffffc0204b20:	0e04bc23          	sd	zero,248(s1)
ffffffffc0204b24:	10e4b023          	sd	a4,256(s1)
ffffffffc0204b28:	c311                	beqz	a4,ffffffffc0204b2c <do_fork+0x1b6>
ffffffffc0204b2a:	ff64                	sd	s1,248(a4)
ffffffffc0204b2c:	00092783          	lw	a5,0(s2)
ffffffffc0204b30:	fae4                	sd	s1,240(a3)
ffffffffc0204b32:	2785                	addiw	a5,a5,1
ffffffffc0204b34:	00f92023          	sw	a5,0(s2)
ffffffffc0204b38:	14099163          	bnez	s3,ffffffffc0204c7a <do_fork+0x304>
ffffffffc0204b3c:	8526                	mv	a0,s1
ffffffffc0204b3e:	78b000ef          	jal	ffffffffc0205ac8 <wakeup_proc>
ffffffffc0204b42:	40c8                	lw	a0,4(s1)
ffffffffc0204b44:	7446                	ld	s0,112(sp)
ffffffffc0204b46:	74a6                	ld	s1,104(sp)
ffffffffc0204b48:	69e6                	ld	s3,88(sp)
ffffffffc0204b4a:	6a46                	ld	s4,80(sp)
ffffffffc0204b4c:	6aa6                	ld	s5,72(sp)
ffffffffc0204b4e:	6b06                	ld	s6,64(sp)
ffffffffc0204b50:	7be2                	ld	s7,56(sp)
ffffffffc0204b52:	7c42                	ld	s8,48(sp)
ffffffffc0204b54:	7d02                	ld	s10,32(sp)
ffffffffc0204b56:	6de2                	ld	s11,24(sp)
ffffffffc0204b58:	70e6                	ld	ra,120(sp)
ffffffffc0204b5a:	7906                	ld	s2,96(sp)
ffffffffc0204b5c:	6109                	addi	sp,sp,128
ffffffffc0204b5e:	8082                	ret
ffffffffc0204b60:	4785                	li	a5,1
ffffffffc0204b62:	00f82023          	sw	a5,0(a6)
ffffffffc0204b66:	4505                	li	a0,1
ffffffffc0204b68:	00027317          	auipc	t1,0x27
ffffffffc0204b6c:	1f030313          	addi	t1,t1,496 # ffffffffc022bd58 <next_safe.0>
ffffffffc0204b70:	00032417          	auipc	s0,0x32
ffffffffc0204b74:	6a840413          	addi	s0,s0,1704 # ffffffffc0237218 <proc_list>
ffffffffc0204b78:	00843e03          	ld	t3,8(s0)
ffffffffc0204b7c:	6789                	lui	a5,0x2
ffffffffc0204b7e:	00f32023          	sw	a5,0(t1)
ffffffffc0204b82:	86aa                	mv	a3,a0
ffffffffc0204b84:	4581                	li	a1,0
ffffffffc0204b86:	028e0e63          	beq	t3,s0,ffffffffc0204bc2 <do_fork+0x24c>
ffffffffc0204b8a:	88ae                	mv	a7,a1
ffffffffc0204b8c:	87f2                	mv	a5,t3
ffffffffc0204b8e:	6609                	lui	a2,0x2
ffffffffc0204b90:	a811                	j	ffffffffc0204ba4 <do_fork+0x22e>
ffffffffc0204b92:	00e6d663          	bge	a3,a4,ffffffffc0204b9e <do_fork+0x228>
ffffffffc0204b96:	00c75463          	bge	a4,a2,ffffffffc0204b9e <do_fork+0x228>
ffffffffc0204b9a:	863a                	mv	a2,a4
ffffffffc0204b9c:	4885                	li	a7,1
ffffffffc0204b9e:	679c                	ld	a5,8(a5)
ffffffffc0204ba0:	00878d63          	beq	a5,s0,ffffffffc0204bba <do_fork+0x244>
ffffffffc0204ba4:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_obj___user_softint_out_size+0x44>
ffffffffc0204ba8:	fed715e3          	bne	a4,a3,ffffffffc0204b92 <do_fork+0x21c>
ffffffffc0204bac:	2685                	addiw	a3,a3,1
ffffffffc0204bae:	12c6da63          	bge	a3,a2,ffffffffc0204ce2 <do_fork+0x36c>
ffffffffc0204bb2:	679c                	ld	a5,8(a5)
ffffffffc0204bb4:	4585                	li	a1,1
ffffffffc0204bb6:	fe8797e3          	bne	a5,s0,ffffffffc0204ba4 <do_fork+0x22e>
ffffffffc0204bba:	00088463          	beqz	a7,ffffffffc0204bc2 <do_fork+0x24c>
ffffffffc0204bbe:	00c32023          	sw	a2,0(t1)
ffffffffc0204bc2:	d18d                	beqz	a1,ffffffffc0204ae4 <do_fork+0x16e>
ffffffffc0204bc4:	00d82023          	sw	a3,0(a6)
ffffffffc0204bc8:	8536                	mv	a0,a3
ffffffffc0204bca:	bf29                	j	ffffffffc0204ae4 <do_fork+0x16e>
ffffffffc0204bcc:	6989                	lui	s3,0x2
ffffffffc0204bce:	edc98993          	addi	s3,s3,-292 # 1edc <_binary_obj___user_faultread_out_size-0x14>
ffffffffc0204bd2:	99ba                	add	s3,s3,a4
ffffffffc0204bd4:	0136b823          	sd	s3,16(a3)
ffffffffc0204bd8:	00000797          	auipc	a5,0x0
ffffffffc0204bdc:	c3078793          	addi	a5,a5,-976 # ffffffffc0204808 <forkret>
ffffffffc0204be0:	f89c                	sd	a5,48(s1)
ffffffffc0204be2:	fc94                	sd	a3,56(s1)
ffffffffc0204be4:	100027f3          	csrr	a5,sstatus
ffffffffc0204be8:	8b89                	andi	a5,a5,2
ffffffffc0204bea:	4981                	li	s3,0
ffffffffc0204bec:	ec0783e3          	beqz	a5,ffffffffc0204ab2 <do_fork+0x13c>
ffffffffc0204bf0:	a51fb0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0204bf4:	4985                	li	s3,1
ffffffffc0204bf6:	bd75                	j	ffffffffc0204ab2 <do_fork+0x13c>
ffffffffc0204bf8:	f466                	sd	s9,40(sp)
ffffffffc0204bfa:	816ff0ef          	jal	ffffffffc0203c10 <mm_create>
ffffffffc0204bfe:	8caa                	mv	s9,a0
ffffffffc0204c00:	c949                	beqz	a0,ffffffffc0204c92 <do_fork+0x31c>
ffffffffc0204c02:	4505                	li	a0,1
ffffffffc0204c04:	fcdfc0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc0204c08:	c151                	beqz	a0,ffffffffc0204c8c <do_fork+0x316>
ffffffffc0204c0a:	000ab683          	ld	a3,0(s5)
ffffffffc0204c0e:	67a2                	ld	a5,8(sp)
ffffffffc0204c10:	000bb703          	ld	a4,0(s7)
ffffffffc0204c14:	40d506b3          	sub	a3,a0,a3
ffffffffc0204c18:	8699                	srai	a3,a3,0x6
ffffffffc0204c1a:	96be                	add	a3,a3,a5
ffffffffc0204c1c:	01b6fdb3          	and	s11,a3,s11
ffffffffc0204c20:	06b2                	slli	a3,a3,0xc
ffffffffc0204c22:	10edfe63          	bgeu	s11,a4,ffffffffc0204d3e <do_fork+0x3c8>
ffffffffc0204c26:	000c3783          	ld	a5,0(s8)
ffffffffc0204c2a:	6605                	lui	a2,0x1
ffffffffc0204c2c:	00032597          	auipc	a1,0x32
ffffffffc0204c30:	62c5b583          	ld	a1,1580(a1) # ffffffffc0237258 <boot_pgdir>
ffffffffc0204c34:	00f68a33          	add	s4,a3,a5
ffffffffc0204c38:	8552                	mv	a0,s4
ffffffffc0204c3a:	53a010ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc0204c3e:	038d0d93          	addi	s11,s10,56
ffffffffc0204c42:	014cbc23          	sd	s4,24(s9)
ffffffffc0204c46:	4785                	li	a5,1
ffffffffc0204c48:	40fdb7af          	amoor.d	a5,a5,(s11)
ffffffffc0204c4c:	8b85                	andi	a5,a5,1
ffffffffc0204c4e:	4a05                	li	s4,1
ffffffffc0204c50:	c799                	beqz	a5,ffffffffc0204c5e <do_fork+0x2e8>
ffffffffc0204c52:	711000ef          	jal	ffffffffc0205b62 <schedule>
ffffffffc0204c56:	414db7af          	amoor.d	a5,s4,(s11)
ffffffffc0204c5a:	8b85                	andi	a5,a5,1
ffffffffc0204c5c:	fbfd                	bnez	a5,ffffffffc0204c52 <do_fork+0x2dc>
ffffffffc0204c5e:	85ea                	mv	a1,s10
ffffffffc0204c60:	8566                	mv	a0,s9
ffffffffc0204c62:	a54ff0ef          	jal	ffffffffc0203eb6 <dup_mmap>
ffffffffc0204c66:	57f9                	li	a5,-2
ffffffffc0204c68:	60fdb7af          	amoand.d	a5,a5,(s11)
ffffffffc0204c6c:	8b85                	andi	a5,a5,1
ffffffffc0204c6e:	0e078463          	beqz	a5,ffffffffc0204d56 <do_fork+0x3e0>
ffffffffc0204c72:	8d66                	mv	s10,s9
ffffffffc0204c74:	e511                	bnez	a0,ffffffffc0204c80 <do_fork+0x30a>
ffffffffc0204c76:	7ca2                	ld	s9,40(sp)
ffffffffc0204c78:	bb75                	j	ffffffffc0204a34 <do_fork+0xbe>
ffffffffc0204c7a:	9c1fb0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0204c7e:	bd7d                	j	ffffffffc0204b3c <do_fork+0x1c6>
ffffffffc0204c80:	8566                	mv	a0,s9
ffffffffc0204c82:	accff0ef          	jal	ffffffffc0203f4e <exit_mmap>
ffffffffc0204c86:	8566                	mv	a0,s9
ffffffffc0204c88:	c0dff0ef          	jal	ffffffffc0204894 <put_pgdir>
ffffffffc0204c8c:	8566                	mv	a0,s9
ffffffffc0204c8e:	908ff0ef          	jal	ffffffffc0203d96 <mm_destroy>
ffffffffc0204c92:	6894                	ld	a3,16(s1)
ffffffffc0204c94:	c02007b7          	lui	a5,0xc0200
ffffffffc0204c98:	10f6e163          	bltu	a3,a5,ffffffffc0204d9a <do_fork+0x424>
ffffffffc0204c9c:	000c3783          	ld	a5,0(s8)
ffffffffc0204ca0:	000bb703          	ld	a4,0(s7)
ffffffffc0204ca4:	40f687b3          	sub	a5,a3,a5
ffffffffc0204ca8:	83b1                	srli	a5,a5,0xc
ffffffffc0204caa:	04e7f463          	bgeu	a5,a4,ffffffffc0204cf2 <do_fork+0x37c>
ffffffffc0204cae:	000b3703          	ld	a4,0(s6)
ffffffffc0204cb2:	000ab503          	ld	a0,0(s5)
ffffffffc0204cb6:	4589                	li	a1,2
ffffffffc0204cb8:	8f99                	sub	a5,a5,a4
ffffffffc0204cba:	079a                	slli	a5,a5,0x6
ffffffffc0204cbc:	953e                	add	a0,a0,a5
ffffffffc0204cbe:	fa3fc0ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0204cc2:	6aa6                	ld	s5,72(sp)
ffffffffc0204cc4:	6b06                	ld	s6,64(sp)
ffffffffc0204cc6:	7be2                	ld	s7,56(sp)
ffffffffc0204cc8:	7ca2                	ld	s9,40(sp)
ffffffffc0204cca:	7d02                	ld	s10,32(sp)
ffffffffc0204ccc:	6de2                	ld	s11,24(sp)
ffffffffc0204cce:	8526                	mv	a0,s1
ffffffffc0204cd0:	dd3fc0ef          	jal	ffffffffc0201aa2 <kfree>
ffffffffc0204cd4:	7c42                	ld	s8,48(sp)
ffffffffc0204cd6:	7446                	ld	s0,112(sp)
ffffffffc0204cd8:	74a6                	ld	s1,104(sp)
ffffffffc0204cda:	69e6                	ld	s3,88(sp)
ffffffffc0204cdc:	6a46                	ld	s4,80(sp)
ffffffffc0204cde:	5571                	li	a0,-4
ffffffffc0204ce0:	bda5                	j	ffffffffc0204b58 <do_fork+0x1e2>
ffffffffc0204ce2:	6789                	lui	a5,0x2
ffffffffc0204ce4:	00f6c363          	blt	a3,a5,ffffffffc0204cea <do_fork+0x374>
ffffffffc0204ce8:	4685                	li	a3,1
ffffffffc0204cea:	4585                	li	a1,1
ffffffffc0204cec:	bd69                	j	ffffffffc0204b86 <do_fork+0x210>
ffffffffc0204cee:	556d                	li	a0,-5
ffffffffc0204cf0:	b5a5                	j	ffffffffc0204b58 <do_fork+0x1e2>
ffffffffc0204cf2:	00002617          	auipc	a2,0x2
ffffffffc0204cf6:	20e60613          	addi	a2,a2,526 # ffffffffc0206f00 <etext+0xd74>
ffffffffc0204cfa:	06200593          	li	a1,98
ffffffffc0204cfe:	00002517          	auipc	a0,0x2
ffffffffc0204d02:	15a50513          	addi	a0,a0,346 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0204d06:	f6efb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204d0a:	00002617          	auipc	a2,0x2
ffffffffc0204d0e:	1ce60613          	addi	a2,a2,462 # ffffffffc0206ed8 <etext+0xd4c>
ffffffffc0204d12:	15900593          	li	a1,345
ffffffffc0204d16:	00003517          	auipc	a0,0x3
ffffffffc0204d1a:	1b250513          	addi	a0,a0,434 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0204d1e:	f466                	sd	s9,40(sp)
ffffffffc0204d20:	f54fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204d24:	00002617          	auipc	a2,0x2
ffffffffc0204d28:	10c60613          	addi	a2,a2,268 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0204d2c:	06900593          	li	a1,105
ffffffffc0204d30:	00002517          	auipc	a0,0x2
ffffffffc0204d34:	12850513          	addi	a0,a0,296 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0204d38:	f466                	sd	s9,40(sp)
ffffffffc0204d3a:	f3afb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204d3e:	00002617          	auipc	a2,0x2
ffffffffc0204d42:	0f260613          	addi	a2,a2,242 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0204d46:	06900593          	li	a1,105
ffffffffc0204d4a:	00002517          	auipc	a0,0x2
ffffffffc0204d4e:	10e50513          	addi	a0,a0,270 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0204d52:	f22fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204d56:	00003617          	auipc	a2,0x3
ffffffffc0204d5a:	1aa60613          	addi	a2,a2,426 # ffffffffc0207f00 <etext+0x1d74>
ffffffffc0204d5e:	03100593          	li	a1,49
ffffffffc0204d62:	00003517          	auipc	a0,0x3
ffffffffc0204d66:	1ae50513          	addi	a0,a0,430 # ffffffffc0207f10 <etext+0x1d84>
ffffffffc0204d6a:	f0afb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204d6e:	00003697          	auipc	a3,0x3
ffffffffc0204d72:	17268693          	addi	a3,a3,370 # ffffffffc0207ee0 <etext+0x1d54>
ffffffffc0204d76:	00002617          	auipc	a2,0x2
ffffffffc0204d7a:	a9260613          	addi	a2,a2,-1390 # ffffffffc0206808 <etext+0x67c>
ffffffffc0204d7e:	1a600593          	li	a1,422
ffffffffc0204d82:	00003517          	auipc	a0,0x3
ffffffffc0204d86:	14650513          	addi	a0,a0,326 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0204d8a:	e4d6                	sd	s5,72(sp)
ffffffffc0204d8c:	e0da                	sd	s6,64(sp)
ffffffffc0204d8e:	fc5e                	sd	s7,56(sp)
ffffffffc0204d90:	f466                	sd	s9,40(sp)
ffffffffc0204d92:	f06a                	sd	s10,32(sp)
ffffffffc0204d94:	ec6e                	sd	s11,24(sp)
ffffffffc0204d96:	edefb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204d9a:	00002617          	auipc	a2,0x2
ffffffffc0204d9e:	13e60613          	addi	a2,a2,318 # ffffffffc0206ed8 <etext+0xd4c>
ffffffffc0204da2:	06e00593          	li	a1,110
ffffffffc0204da6:	00002517          	auipc	a0,0x2
ffffffffc0204daa:	0b250513          	addi	a0,a0,178 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0204dae:	ec6fb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0204db2 <kernel_thread>:
ffffffffc0204db2:	7129                	addi	sp,sp,-320
ffffffffc0204db4:	fa22                	sd	s0,304(sp)
ffffffffc0204db6:	f626                	sd	s1,296(sp)
ffffffffc0204db8:	f24a                	sd	s2,288(sp)
ffffffffc0204dba:	84ae                	mv	s1,a1
ffffffffc0204dbc:	892a                	mv	s2,a0
ffffffffc0204dbe:	8432                	mv	s0,a2
ffffffffc0204dc0:	4581                	li	a1,0
ffffffffc0204dc2:	12000613          	li	a2,288
ffffffffc0204dc6:	850a                	mv	a0,sp
ffffffffc0204dc8:	fe06                	sd	ra,312(sp)
ffffffffc0204dca:	398010ef          	jal	ffffffffc0206162 <memset>
ffffffffc0204dce:	e0ca                	sd	s2,64(sp)
ffffffffc0204dd0:	e4a6                	sd	s1,72(sp)
ffffffffc0204dd2:	100027f3          	csrr	a5,sstatus
ffffffffc0204dd6:	edd7f793          	andi	a5,a5,-291
ffffffffc0204dda:	1207e793          	ori	a5,a5,288
ffffffffc0204dde:	e23e                	sd	a5,256(sp)
ffffffffc0204de0:	860a                	mv	a2,sp
ffffffffc0204de2:	10046513          	ori	a0,s0,256
ffffffffc0204de6:	00000797          	auipc	a5,0x0
ffffffffc0204dea:	9a878793          	addi	a5,a5,-1624 # ffffffffc020478e <kernel_thread_entry>
ffffffffc0204dee:	4581                	li	a1,0
ffffffffc0204df0:	e63e                	sd	a5,264(sp)
ffffffffc0204df2:	b85ff0ef          	jal	ffffffffc0204976 <do_fork>
ffffffffc0204df6:	70f2                	ld	ra,312(sp)
ffffffffc0204df8:	7452                	ld	s0,304(sp)
ffffffffc0204dfa:	74b2                	ld	s1,296(sp)
ffffffffc0204dfc:	7912                	ld	s2,288(sp)
ffffffffc0204dfe:	6131                	addi	sp,sp,320
ffffffffc0204e00:	8082                	ret

ffffffffc0204e02 <do_exit>:
ffffffffc0204e02:	7179                	addi	sp,sp,-48
ffffffffc0204e04:	f022                	sd	s0,32(sp)
ffffffffc0204e06:	00032417          	auipc	s0,0x32
ffffffffc0204e0a:	4a240413          	addi	s0,s0,1186 # ffffffffc02372a8 <current>
ffffffffc0204e0e:	601c                	ld	a5,0(s0)
ffffffffc0204e10:	f406                	sd	ra,40(sp)
ffffffffc0204e12:	00032717          	auipc	a4,0x32
ffffffffc0204e16:	4a673703          	ld	a4,1190(a4) # ffffffffc02372b8 <idleproc>
ffffffffc0204e1a:	ec26                	sd	s1,24(sp)
ffffffffc0204e1c:	0ce78f63          	beq	a5,a4,ffffffffc0204efa <do_exit+0xf8>
ffffffffc0204e20:	00032497          	auipc	s1,0x32
ffffffffc0204e24:	49048493          	addi	s1,s1,1168 # ffffffffc02372b0 <initproc>
ffffffffc0204e28:	6098                	ld	a4,0(s1)
ffffffffc0204e2a:	e84a                	sd	s2,16(sp)
ffffffffc0204e2c:	e44e                	sd	s3,8(sp)
ffffffffc0204e2e:	e052                	sd	s4,0(sp)
ffffffffc0204e30:	0ee78e63          	beq	a5,a4,ffffffffc0204f2c <do_exit+0x12a>
ffffffffc0204e34:	0287b983          	ld	s3,40(a5)
ffffffffc0204e38:	892a                	mv	s2,a0
ffffffffc0204e3a:	02098663          	beqz	s3,ffffffffc0204e66 <do_exit+0x64>
ffffffffc0204e3e:	00032797          	auipc	a5,0x32
ffffffffc0204e42:	4127b783          	ld	a5,1042(a5) # ffffffffc0237250 <boot_cr3>
ffffffffc0204e46:	577d                	li	a4,-1
ffffffffc0204e48:	177e                	slli	a4,a4,0x3f
ffffffffc0204e4a:	83b1                	srli	a5,a5,0xc
ffffffffc0204e4c:	8fd9                	or	a5,a5,a4
ffffffffc0204e4e:	18079073          	csrw	satp,a5
ffffffffc0204e52:	0309a783          	lw	a5,48(s3)
ffffffffc0204e56:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204e5a:	02e9a823          	sw	a4,48(s3)
ffffffffc0204e5e:	cf4d                	beqz	a4,ffffffffc0204f18 <do_exit+0x116>
ffffffffc0204e60:	601c                	ld	a5,0(s0)
ffffffffc0204e62:	0207b423          	sd	zero,40(a5)
ffffffffc0204e66:	601c                	ld	a5,0(s0)
ffffffffc0204e68:	470d                	li	a4,3
ffffffffc0204e6a:	c398                	sw	a4,0(a5)
ffffffffc0204e6c:	0f27a423          	sw	s2,232(a5)
ffffffffc0204e70:	100027f3          	csrr	a5,sstatus
ffffffffc0204e74:	8b89                	andi	a5,a5,2
ffffffffc0204e76:	4a01                	li	s4,0
ffffffffc0204e78:	e7f1                	bnez	a5,ffffffffc0204f44 <do_exit+0x142>
ffffffffc0204e7a:	6018                	ld	a4,0(s0)
ffffffffc0204e7c:	800007b7          	lui	a5,0x80000
ffffffffc0204e80:	0785                	addi	a5,a5,1 # ffffffff80000001 <_binary_obj___user_exit_out_size+0xffffffff7fffd6b1>
ffffffffc0204e82:	7308                	ld	a0,32(a4)
ffffffffc0204e84:	0ec52703          	lw	a4,236(a0)
ffffffffc0204e88:	0cf70263          	beq	a4,a5,ffffffffc0204f4c <do_exit+0x14a>
ffffffffc0204e8c:	6018                	ld	a4,0(s0)
ffffffffc0204e8e:	7b7c                	ld	a5,240(a4)
ffffffffc0204e90:	c3a1                	beqz	a5,ffffffffc0204ed0 <do_exit+0xce>
ffffffffc0204e92:	800009b7          	lui	s3,0x80000
ffffffffc0204e96:	490d                	li	s2,3
ffffffffc0204e98:	0985                	addi	s3,s3,1 # ffffffff80000001 <_binary_obj___user_exit_out_size+0xffffffff7fffd6b1>
ffffffffc0204e9a:	a021                	j	ffffffffc0204ea2 <do_exit+0xa0>
ffffffffc0204e9c:	6018                	ld	a4,0(s0)
ffffffffc0204e9e:	7b7c                	ld	a5,240(a4)
ffffffffc0204ea0:	cb85                	beqz	a5,ffffffffc0204ed0 <do_exit+0xce>
ffffffffc0204ea2:	1007b683          	ld	a3,256(a5)
ffffffffc0204ea6:	6088                	ld	a0,0(s1)
ffffffffc0204ea8:	fb74                	sd	a3,240(a4)
ffffffffc0204eaa:	7978                	ld	a4,240(a0)
ffffffffc0204eac:	0e07bc23          	sd	zero,248(a5)
ffffffffc0204eb0:	10e7b023          	sd	a4,256(a5)
ffffffffc0204eb4:	c311                	beqz	a4,ffffffffc0204eb8 <do_exit+0xb6>
ffffffffc0204eb6:	ff7c                	sd	a5,248(a4)
ffffffffc0204eb8:	4398                	lw	a4,0(a5)
ffffffffc0204eba:	f388                	sd	a0,32(a5)
ffffffffc0204ebc:	f97c                	sd	a5,240(a0)
ffffffffc0204ebe:	fd271fe3          	bne	a4,s2,ffffffffc0204e9c <do_exit+0x9a>
ffffffffc0204ec2:	0ec52783          	lw	a5,236(a0)
ffffffffc0204ec6:	fd379be3          	bne	a5,s3,ffffffffc0204e9c <do_exit+0x9a>
ffffffffc0204eca:	3ff000ef          	jal	ffffffffc0205ac8 <wakeup_proc>
ffffffffc0204ece:	b7f9                	j	ffffffffc0204e9c <do_exit+0x9a>
ffffffffc0204ed0:	020a1263          	bnez	s4,ffffffffc0204ef4 <do_exit+0xf2>
ffffffffc0204ed4:	48f000ef          	jal	ffffffffc0205b62 <schedule>
ffffffffc0204ed8:	601c                	ld	a5,0(s0)
ffffffffc0204eda:	00003617          	auipc	a2,0x3
ffffffffc0204ede:	06e60613          	addi	a2,a2,110 # ffffffffc0207f48 <etext+0x1dbc>
ffffffffc0204ee2:	1f900593          	li	a1,505
ffffffffc0204ee6:	43d4                	lw	a3,4(a5)
ffffffffc0204ee8:	00003517          	auipc	a0,0x3
ffffffffc0204eec:	fe050513          	addi	a0,a0,-32 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0204ef0:	d84fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204ef4:	f46fb0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc0204ef8:	bff1                	j	ffffffffc0204ed4 <do_exit+0xd2>
ffffffffc0204efa:	00003617          	auipc	a2,0x3
ffffffffc0204efe:	02e60613          	addi	a2,a2,46 # ffffffffc0207f28 <etext+0x1d9c>
ffffffffc0204f02:	1cd00593          	li	a1,461
ffffffffc0204f06:	00003517          	auipc	a0,0x3
ffffffffc0204f0a:	fc250513          	addi	a0,a0,-62 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0204f0e:	e84a                	sd	s2,16(sp)
ffffffffc0204f10:	e44e                	sd	s3,8(sp)
ffffffffc0204f12:	e052                	sd	s4,0(sp)
ffffffffc0204f14:	d60fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204f18:	854e                	mv	a0,s3
ffffffffc0204f1a:	834ff0ef          	jal	ffffffffc0203f4e <exit_mmap>
ffffffffc0204f1e:	854e                	mv	a0,s3
ffffffffc0204f20:	975ff0ef          	jal	ffffffffc0204894 <put_pgdir>
ffffffffc0204f24:	854e                	mv	a0,s3
ffffffffc0204f26:	e71fe0ef          	jal	ffffffffc0203d96 <mm_destroy>
ffffffffc0204f2a:	bf1d                	j	ffffffffc0204e60 <do_exit+0x5e>
ffffffffc0204f2c:	00003617          	auipc	a2,0x3
ffffffffc0204f30:	00c60613          	addi	a2,a2,12 # ffffffffc0207f38 <etext+0x1dac>
ffffffffc0204f34:	1d000593          	li	a1,464
ffffffffc0204f38:	00003517          	auipc	a0,0x3
ffffffffc0204f3c:	f9050513          	addi	a0,a0,-112 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0204f40:	d34fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0204f44:	efcfb0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0204f48:	4a05                	li	s4,1
ffffffffc0204f4a:	bf05                	j	ffffffffc0204e7a <do_exit+0x78>
ffffffffc0204f4c:	37d000ef          	jal	ffffffffc0205ac8 <wakeup_proc>
ffffffffc0204f50:	bf35                	j	ffffffffc0204e8c <do_exit+0x8a>

ffffffffc0204f52 <do_wait.part.0>:
ffffffffc0204f52:	7179                	addi	sp,sp,-48
ffffffffc0204f54:	ec26                	sd	s1,24(sp)
ffffffffc0204f56:	e84a                	sd	s2,16(sp)
ffffffffc0204f58:	e44e                	sd	s3,8(sp)
ffffffffc0204f5a:	f406                	sd	ra,40(sp)
ffffffffc0204f5c:	f022                	sd	s0,32(sp)
ffffffffc0204f5e:	84aa                	mv	s1,a0
ffffffffc0204f60:	892e                	mv	s2,a1
ffffffffc0204f62:	00032997          	auipc	s3,0x32
ffffffffc0204f66:	34698993          	addi	s3,s3,838 # ffffffffc02372a8 <current>
ffffffffc0204f6a:	c105                	beqz	a0,ffffffffc0204f8a <do_wait.part.0+0x38>
ffffffffc0204f6c:	6789                	lui	a5,0x2
ffffffffc0204f6e:	fff5071b          	addiw	a4,a0,-1
ffffffffc0204f72:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_obj___user_hello_out_size+0x36>
ffffffffc0204f74:	2501                	sext.w	a0,a0
ffffffffc0204f76:	12e7f363          	bgeu	a5,a4,ffffffffc020509c <do_wait.part.0+0x14a>
ffffffffc0204f7a:	5579                	li	a0,-2
ffffffffc0204f7c:	70a2                	ld	ra,40(sp)
ffffffffc0204f7e:	7402                	ld	s0,32(sp)
ffffffffc0204f80:	64e2                	ld	s1,24(sp)
ffffffffc0204f82:	6942                	ld	s2,16(sp)
ffffffffc0204f84:	69a2                	ld	s3,8(sp)
ffffffffc0204f86:	6145                	addi	sp,sp,48
ffffffffc0204f88:	8082                	ret
ffffffffc0204f8a:	0009b683          	ld	a3,0(s3)
ffffffffc0204f8e:	7ae0                	ld	s0,240(a3)
ffffffffc0204f90:	d46d                	beqz	s0,ffffffffc0204f7a <do_wait.part.0+0x28>
ffffffffc0204f92:	470d                	li	a4,3
ffffffffc0204f94:	a021                	j	ffffffffc0204f9c <do_wait.part.0+0x4a>
ffffffffc0204f96:	10043403          	ld	s0,256(s0)
ffffffffc0204f9a:	cc71                	beqz	s0,ffffffffc0205076 <do_wait.part.0+0x124>
ffffffffc0204f9c:	401c                	lw	a5,0(s0)
ffffffffc0204f9e:	fee79ce3          	bne	a5,a4,ffffffffc0204f96 <do_wait.part.0+0x44>
ffffffffc0204fa2:	00032797          	auipc	a5,0x32
ffffffffc0204fa6:	3167b783          	ld	a5,790(a5) # ffffffffc02372b8 <idleproc>
ffffffffc0204faa:	14878c63          	beq	a5,s0,ffffffffc0205102 <do_wait.part.0+0x1b0>
ffffffffc0204fae:	00032797          	auipc	a5,0x32
ffffffffc0204fb2:	3027b783          	ld	a5,770(a5) # ffffffffc02372b0 <initproc>
ffffffffc0204fb6:	14f40663          	beq	s0,a5,ffffffffc0205102 <do_wait.part.0+0x1b0>
ffffffffc0204fba:	00090663          	beqz	s2,ffffffffc0204fc6 <do_wait.part.0+0x74>
ffffffffc0204fbe:	0e842783          	lw	a5,232(s0)
ffffffffc0204fc2:	00f92023          	sw	a5,0(s2)
ffffffffc0204fc6:	100027f3          	csrr	a5,sstatus
ffffffffc0204fca:	8b89                	andi	a5,a5,2
ffffffffc0204fcc:	4601                	li	a2,0
ffffffffc0204fce:	10079463          	bnez	a5,ffffffffc02050d6 <do_wait.part.0+0x184>
ffffffffc0204fd2:	6c74                	ld	a3,216(s0)
ffffffffc0204fd4:	7078                	ld	a4,224(s0)
ffffffffc0204fd6:	10043783          	ld	a5,256(s0)
ffffffffc0204fda:	e698                	sd	a4,8(a3)
ffffffffc0204fdc:	e314                	sd	a3,0(a4)
ffffffffc0204fde:	6474                	ld	a3,200(s0)
ffffffffc0204fe0:	6878                	ld	a4,208(s0)
ffffffffc0204fe2:	e698                	sd	a4,8(a3)
ffffffffc0204fe4:	e314                	sd	a3,0(a4)
ffffffffc0204fe6:	c399                	beqz	a5,ffffffffc0204fec <do_wait.part.0+0x9a>
ffffffffc0204fe8:	7c78                	ld	a4,248(s0)
ffffffffc0204fea:	fff8                	sd	a4,248(a5)
ffffffffc0204fec:	7c78                	ld	a4,248(s0)
ffffffffc0204fee:	c36d                	beqz	a4,ffffffffc02050d0 <do_wait.part.0+0x17e>
ffffffffc0204ff0:	10f73023          	sd	a5,256(a4)
ffffffffc0204ff4:	00032717          	auipc	a4,0x32
ffffffffc0204ff8:	2ac70713          	addi	a4,a4,684 # ffffffffc02372a0 <nr_process>
ffffffffc0204ffc:	431c                	lw	a5,0(a4)
ffffffffc0204ffe:	37fd                	addiw	a5,a5,-1
ffffffffc0205000:	c31c                	sw	a5,0(a4)
ffffffffc0205002:	e661                	bnez	a2,ffffffffc02050ca <do_wait.part.0+0x178>
ffffffffc0205004:	6814                	ld	a3,16(s0)
ffffffffc0205006:	c02007b7          	lui	a5,0xc0200
ffffffffc020500a:	0ef6e063          	bltu	a3,a5,ffffffffc02050ea <do_wait.part.0+0x198>
ffffffffc020500e:	00032797          	auipc	a5,0x32
ffffffffc0205012:	2527b783          	ld	a5,594(a5) # ffffffffc0237260 <va_pa_offset>
ffffffffc0205016:	8e9d                	sub	a3,a3,a5
ffffffffc0205018:	82b1                	srli	a3,a3,0xc
ffffffffc020501a:	00032797          	auipc	a5,0x32
ffffffffc020501e:	24e7b783          	ld	a5,590(a5) # ffffffffc0237268 <npage>
ffffffffc0205022:	0ef6fc63          	bgeu	a3,a5,ffffffffc020511a <do_wait.part.0+0x1c8>
ffffffffc0205026:	00004797          	auipc	a5,0x4
ffffffffc020502a:	84a7b783          	ld	a5,-1974(a5) # ffffffffc0208870 <nbase>
ffffffffc020502e:	8e9d                	sub	a3,a3,a5
ffffffffc0205030:	069a                	slli	a3,a3,0x6
ffffffffc0205032:	00032517          	auipc	a0,0x32
ffffffffc0205036:	23e53503          	ld	a0,574(a0) # ffffffffc0237270 <pages>
ffffffffc020503a:	9536                	add	a0,a0,a3
ffffffffc020503c:	4589                	li	a1,2
ffffffffc020503e:	c23fc0ef          	jal	ffffffffc0201c60 <free_pages>
ffffffffc0205042:	8522                	mv	a0,s0
ffffffffc0205044:	a5ffc0ef          	jal	ffffffffc0201aa2 <kfree>
ffffffffc0205048:	70a2                	ld	ra,40(sp)
ffffffffc020504a:	7402                	ld	s0,32(sp)
ffffffffc020504c:	64e2                	ld	s1,24(sp)
ffffffffc020504e:	6942                	ld	s2,16(sp)
ffffffffc0205050:	69a2                	ld	s3,8(sp)
ffffffffc0205052:	4501                	li	a0,0
ffffffffc0205054:	6145                	addi	sp,sp,48
ffffffffc0205056:	8082                	ret
ffffffffc0205058:	00032997          	auipc	s3,0x32
ffffffffc020505c:	25098993          	addi	s3,s3,592 # ffffffffc02372a8 <current>
ffffffffc0205060:	0009b683          	ld	a3,0(s3)
ffffffffc0205064:	f4843783          	ld	a5,-184(s0)
ffffffffc0205068:	f0d799e3          	bne	a5,a3,ffffffffc0204f7a <do_wait.part.0+0x28>
ffffffffc020506c:	f2842703          	lw	a4,-216(s0)
ffffffffc0205070:	478d                	li	a5,3
ffffffffc0205072:	06f70663          	beq	a4,a5,ffffffffc02050de <do_wait.part.0+0x18c>
ffffffffc0205076:	800007b7          	lui	a5,0x80000
ffffffffc020507a:	0785                	addi	a5,a5,1 # ffffffff80000001 <_binary_obj___user_exit_out_size+0xffffffff7fffd6b1>
ffffffffc020507c:	4705                	li	a4,1
ffffffffc020507e:	0ef6a623          	sw	a5,236(a3)
ffffffffc0205082:	c298                	sw	a4,0(a3)
ffffffffc0205084:	2df000ef          	jal	ffffffffc0205b62 <schedule>
ffffffffc0205088:	0009b783          	ld	a5,0(s3)
ffffffffc020508c:	0b07a783          	lw	a5,176(a5)
ffffffffc0205090:	8b85                	andi	a5,a5,1
ffffffffc0205092:	eba9                	bnez	a5,ffffffffc02050e4 <do_wait.part.0+0x192>
ffffffffc0205094:	0004851b          	sext.w	a0,s1
ffffffffc0205098:	ee0489e3          	beqz	s1,ffffffffc0204f8a <do_wait.part.0+0x38>
ffffffffc020509c:	45a9                	li	a1,10
ffffffffc020509e:	431000ef          	jal	ffffffffc0205cce <hash32>
ffffffffc02050a2:	02051793          	slli	a5,a0,0x20
ffffffffc02050a6:	01c7d513          	srli	a0,a5,0x1c
ffffffffc02050aa:	0002e797          	auipc	a5,0x2e
ffffffffc02050ae:	16e78793          	addi	a5,a5,366 # ffffffffc0233218 <hash_list>
ffffffffc02050b2:	953e                	add	a0,a0,a5
ffffffffc02050b4:	842a                	mv	s0,a0
ffffffffc02050b6:	a029                	j	ffffffffc02050c0 <do_wait.part.0+0x16e>
ffffffffc02050b8:	f2c42783          	lw	a5,-212(s0)
ffffffffc02050bc:	f8978ee3          	beq	a5,s1,ffffffffc0205058 <do_wait.part.0+0x106>
ffffffffc02050c0:	6400                	ld	s0,8(s0)
ffffffffc02050c2:	fe851be3          	bne	a0,s0,ffffffffc02050b8 <do_wait.part.0+0x166>
ffffffffc02050c6:	5579                	li	a0,-2
ffffffffc02050c8:	bd55                	j	ffffffffc0204f7c <do_wait.part.0+0x2a>
ffffffffc02050ca:	d70fb0ef          	jal	ffffffffc020063a <intr_enable>
ffffffffc02050ce:	bf1d                	j	ffffffffc0205004 <do_wait.part.0+0xb2>
ffffffffc02050d0:	7018                	ld	a4,32(s0)
ffffffffc02050d2:	fb7c                	sd	a5,240(a4)
ffffffffc02050d4:	b705                	j	ffffffffc0204ff4 <do_wait.part.0+0xa2>
ffffffffc02050d6:	d6afb0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc02050da:	4605                	li	a2,1
ffffffffc02050dc:	bddd                	j	ffffffffc0204fd2 <do_wait.part.0+0x80>
ffffffffc02050de:	f2840413          	addi	s0,s0,-216
ffffffffc02050e2:	b5c1                	j	ffffffffc0204fa2 <do_wait.part.0+0x50>
ffffffffc02050e4:	555d                	li	a0,-9
ffffffffc02050e6:	d1dff0ef          	jal	ffffffffc0204e02 <do_exit>
ffffffffc02050ea:	00002617          	auipc	a2,0x2
ffffffffc02050ee:	dee60613          	addi	a2,a2,-530 # ffffffffc0206ed8 <etext+0xd4c>
ffffffffc02050f2:	06e00593          	li	a1,110
ffffffffc02050f6:	00002517          	auipc	a0,0x2
ffffffffc02050fa:	d6250513          	addi	a0,a0,-670 # ffffffffc0206e58 <etext+0xccc>
ffffffffc02050fe:	b76fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205102:	00003617          	auipc	a2,0x3
ffffffffc0205106:	e6660613          	addi	a2,a2,-410 # ffffffffc0207f68 <etext+0x1ddc>
ffffffffc020510a:	2ef00593          	li	a1,751
ffffffffc020510e:	00003517          	auipc	a0,0x3
ffffffffc0205112:	dba50513          	addi	a0,a0,-582 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205116:	b5efb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020511a:	00002617          	auipc	a2,0x2
ffffffffc020511e:	de660613          	addi	a2,a2,-538 # ffffffffc0206f00 <etext+0xd74>
ffffffffc0205122:	06200593          	li	a1,98
ffffffffc0205126:	00002517          	auipc	a0,0x2
ffffffffc020512a:	d3250513          	addi	a0,a0,-718 # ffffffffc0206e58 <etext+0xccc>
ffffffffc020512e:	b46fb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0205132 <init_main>:
ffffffffc0205132:	1141                	addi	sp,sp,-16
ffffffffc0205134:	e406                	sd	ra,8(sp)
ffffffffc0205136:	b6bfc0ef          	jal	ffffffffc0201ca0 <nr_free_pages>
ffffffffc020513a:	8bbfc0ef          	jal	ffffffffc02019f4 <kallocated>
ffffffffc020513e:	4601                	li	a2,0
ffffffffc0205140:	4581                	li	a1,0
ffffffffc0205142:	fffff517          	auipc	a0,0xfffff
ffffffffc0205146:	6d450513          	addi	a0,a0,1748 # ffffffffc0204816 <user_main>
ffffffffc020514a:	c69ff0ef          	jal	ffffffffc0204db2 <kernel_thread>
ffffffffc020514e:	00a04563          	bgtz	a0,ffffffffc0205158 <init_main+0x26>
ffffffffc0205152:	a071                	j	ffffffffc02051de <init_main+0xac>
ffffffffc0205154:	20f000ef          	jal	ffffffffc0205b62 <schedule>
ffffffffc0205158:	4581                	li	a1,0
ffffffffc020515a:	4501                	li	a0,0
ffffffffc020515c:	df7ff0ef          	jal	ffffffffc0204f52 <do_wait.part.0>
ffffffffc0205160:	d975                	beqz	a0,ffffffffc0205154 <init_main+0x22>
ffffffffc0205162:	00003517          	auipc	a0,0x3
ffffffffc0205166:	e4650513          	addi	a0,a0,-442 # ffffffffc0207fa8 <etext+0x1e1c>
ffffffffc020516a:	816fb0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc020516e:	00032797          	auipc	a5,0x32
ffffffffc0205172:	1427b783          	ld	a5,322(a5) # ffffffffc02372b0 <initproc>
ffffffffc0205176:	7bf8                	ld	a4,240(a5)
ffffffffc0205178:	e339                	bnez	a4,ffffffffc02051be <init_main+0x8c>
ffffffffc020517a:	7ff8                	ld	a4,248(a5)
ffffffffc020517c:	e329                	bnez	a4,ffffffffc02051be <init_main+0x8c>
ffffffffc020517e:	1007b703          	ld	a4,256(a5)
ffffffffc0205182:	ef15                	bnez	a4,ffffffffc02051be <init_main+0x8c>
ffffffffc0205184:	00032697          	auipc	a3,0x32
ffffffffc0205188:	11c6a683          	lw	a3,284(a3) # ffffffffc02372a0 <nr_process>
ffffffffc020518c:	4709                	li	a4,2
ffffffffc020518e:	0ae69463          	bne	a3,a4,ffffffffc0205236 <init_main+0x104>
ffffffffc0205192:	00032697          	auipc	a3,0x32
ffffffffc0205196:	08668693          	addi	a3,a3,134 # ffffffffc0237218 <proc_list>
ffffffffc020519a:	6698                	ld	a4,8(a3)
ffffffffc020519c:	0c878793          	addi	a5,a5,200
ffffffffc02051a0:	06f71b63          	bne	a4,a5,ffffffffc0205216 <init_main+0xe4>
ffffffffc02051a4:	629c                	ld	a5,0(a3)
ffffffffc02051a6:	04f71863          	bne	a4,a5,ffffffffc02051f6 <init_main+0xc4>
ffffffffc02051aa:	00003517          	auipc	a0,0x3
ffffffffc02051ae:	ee650513          	addi	a0,a0,-282 # ffffffffc0208090 <etext+0x1f04>
ffffffffc02051b2:	fcffa0ef          	jal	ffffffffc0200180 <cprintf>
ffffffffc02051b6:	60a2                	ld	ra,8(sp)
ffffffffc02051b8:	4501                	li	a0,0
ffffffffc02051ba:	0141                	addi	sp,sp,16
ffffffffc02051bc:	8082                	ret
ffffffffc02051be:	00003697          	auipc	a3,0x3
ffffffffc02051c2:	e1268693          	addi	a3,a3,-494 # ffffffffc0207fd0 <etext+0x1e44>
ffffffffc02051c6:	00001617          	auipc	a2,0x1
ffffffffc02051ca:	64260613          	addi	a2,a2,1602 # ffffffffc0206808 <etext+0x67c>
ffffffffc02051ce:	35400593          	li	a1,852
ffffffffc02051d2:	00003517          	auipc	a0,0x3
ffffffffc02051d6:	cf650513          	addi	a0,a0,-778 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc02051da:	a9afb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02051de:	00003617          	auipc	a2,0x3
ffffffffc02051e2:	daa60613          	addi	a2,a2,-598 # ffffffffc0207f88 <etext+0x1dfc>
ffffffffc02051e6:	34c00593          	li	a1,844
ffffffffc02051ea:	00003517          	auipc	a0,0x3
ffffffffc02051ee:	cde50513          	addi	a0,a0,-802 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc02051f2:	a82fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02051f6:	00003697          	auipc	a3,0x3
ffffffffc02051fa:	e6a68693          	addi	a3,a3,-406 # ffffffffc0208060 <etext+0x1ed4>
ffffffffc02051fe:	00001617          	auipc	a2,0x1
ffffffffc0205202:	60a60613          	addi	a2,a2,1546 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205206:	35700593          	li	a1,855
ffffffffc020520a:	00003517          	auipc	a0,0x3
ffffffffc020520e:	cbe50513          	addi	a0,a0,-834 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205212:	a62fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205216:	00003697          	auipc	a3,0x3
ffffffffc020521a:	e1a68693          	addi	a3,a3,-486 # ffffffffc0208030 <etext+0x1ea4>
ffffffffc020521e:	00001617          	auipc	a2,0x1
ffffffffc0205222:	5ea60613          	addi	a2,a2,1514 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205226:	35600593          	li	a1,854
ffffffffc020522a:	00003517          	auipc	a0,0x3
ffffffffc020522e:	c9e50513          	addi	a0,a0,-866 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205232:	a42fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205236:	00003697          	auipc	a3,0x3
ffffffffc020523a:	dea68693          	addi	a3,a3,-534 # ffffffffc0208020 <etext+0x1e94>
ffffffffc020523e:	00001617          	auipc	a2,0x1
ffffffffc0205242:	5ca60613          	addi	a2,a2,1482 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205246:	35500593          	li	a1,853
ffffffffc020524a:	00003517          	auipc	a0,0x3
ffffffffc020524e:	c7e50513          	addi	a0,a0,-898 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205252:	a22fb0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0205256 <do_execve>:
ffffffffc0205256:	7171                	addi	sp,sp,-176
ffffffffc0205258:	e4ee                	sd	s11,72(sp)
ffffffffc020525a:	00032d97          	auipc	s11,0x32
ffffffffc020525e:	04ed8d93          	addi	s11,s11,78 # ffffffffc02372a8 <current>
ffffffffc0205262:	000db783          	ld	a5,0(s11)
ffffffffc0205266:	e54e                	sd	s3,136(sp)
ffffffffc0205268:	ed26                	sd	s1,152(sp)
ffffffffc020526a:	0287b983          	ld	s3,40(a5)
ffffffffc020526e:	e94a                	sd	s2,144(sp)
ffffffffc0205270:	fcd6                	sd	s5,120(sp)
ffffffffc0205272:	892a                	mv	s2,a0
ffffffffc0205274:	84ae                	mv	s1,a1
ffffffffc0205276:	8ab2                	mv	s5,a2
ffffffffc0205278:	4681                	li	a3,0
ffffffffc020527a:	862e                	mv	a2,a1
ffffffffc020527c:	85aa                	mv	a1,a0
ffffffffc020527e:	854e                	mv	a0,s3
ffffffffc0205280:	f506                	sd	ra,168(sp)
ffffffffc0205282:	b18ff0ef          	jal	ffffffffc020459a <user_mem_check>
ffffffffc0205286:	46050363          	beqz	a0,ffffffffc02056ec <do_execve+0x496>
ffffffffc020528a:	4641                	li	a2,16
ffffffffc020528c:	4581                	li	a1,0
ffffffffc020528e:	1808                	addi	a0,sp,48
ffffffffc0205290:	6d3000ef          	jal	ffffffffc0206162 <memset>
ffffffffc0205294:	47bd                	li	a5,15
ffffffffc0205296:	8626                	mv	a2,s1
ffffffffc0205298:	1097e263          	bltu	a5,s1,ffffffffc020539c <do_execve+0x146>
ffffffffc020529c:	85ca                	mv	a1,s2
ffffffffc020529e:	1808                	addi	a0,sp,48
ffffffffc02052a0:	6d5000ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc02052a4:	10098363          	beqz	s3,ffffffffc02053aa <do_execve+0x154>
ffffffffc02052a8:	00002517          	auipc	a0,0x2
ffffffffc02052ac:	2b850513          	addi	a0,a0,696 # ffffffffc0207560 <etext+0x13d4>
ffffffffc02052b0:	f07fa0ef          	jal	ffffffffc02001b6 <cputs>
ffffffffc02052b4:	00032797          	auipc	a5,0x32
ffffffffc02052b8:	f9c7b783          	ld	a5,-100(a5) # ffffffffc0237250 <boot_cr3>
ffffffffc02052bc:	577d                	li	a4,-1
ffffffffc02052be:	177e                	slli	a4,a4,0x3f
ffffffffc02052c0:	83b1                	srli	a5,a5,0xc
ffffffffc02052c2:	8fd9                	or	a5,a5,a4
ffffffffc02052c4:	18079073          	csrw	satp,a5
ffffffffc02052c8:	0309a783          	lw	a5,48(s3)
ffffffffc02052cc:	fff7871b          	addiw	a4,a5,-1
ffffffffc02052d0:	02e9a823          	sw	a4,48(s3)
ffffffffc02052d4:	2e070863          	beqz	a4,ffffffffc02055c4 <do_execve+0x36e>
ffffffffc02052d8:	000db783          	ld	a5,0(s11)
ffffffffc02052dc:	0207b423          	sd	zero,40(a5)
ffffffffc02052e0:	931fe0ef          	jal	ffffffffc0203c10 <mm_create>
ffffffffc02052e4:	84aa                	mv	s1,a0
ffffffffc02052e6:	20050663          	beqz	a0,ffffffffc02054f2 <do_execve+0x29c>
ffffffffc02052ea:	4505                	li	a0,1
ffffffffc02052ec:	8e5fc0ef          	jal	ffffffffc0201bd0 <alloc_pages>
ffffffffc02052f0:	40050263          	beqz	a0,ffffffffc02056f4 <do_execve+0x49e>
ffffffffc02052f4:	e8ea                	sd	s10,80(sp)
ffffffffc02052f6:	00032d17          	auipc	s10,0x32
ffffffffc02052fa:	f7ad0d13          	addi	s10,s10,-134 # ffffffffc0237270 <pages>
ffffffffc02052fe:	000d3783          	ld	a5,0(s10)
ffffffffc0205302:	ece6                	sd	s9,88(sp)
ffffffffc0205304:	00032c97          	auipc	s9,0x32
ffffffffc0205308:	f64c8c93          	addi	s9,s9,-156 # ffffffffc0237268 <npage>
ffffffffc020530c:	40f506b3          	sub	a3,a0,a5
ffffffffc0205310:	00003717          	auipc	a4,0x3
ffffffffc0205314:	56073703          	ld	a4,1376(a4) # ffffffffc0208870 <nbase>
ffffffffc0205318:	f4de                	sd	s7,104(sp)
ffffffffc020531a:	8699                	srai	a3,a3,0x6
ffffffffc020531c:	5bfd                	li	s7,-1
ffffffffc020531e:	000cb783          	ld	a5,0(s9)
ffffffffc0205322:	96ba                	add	a3,a3,a4
ffffffffc0205324:	e83a                	sd	a4,16(sp)
ffffffffc0205326:	00cbd713          	srli	a4,s7,0xc
ffffffffc020532a:	f03a                	sd	a4,32(sp)
ffffffffc020532c:	8f75                	and	a4,a4,a3
ffffffffc020532e:	06b2                	slli	a3,a3,0xc
ffffffffc0205330:	3ef77563          	bgeu	a4,a5,ffffffffc020571a <do_execve+0x4c4>
ffffffffc0205334:	f8da                	sd	s6,112(sp)
ffffffffc0205336:	00032b17          	auipc	s6,0x32
ffffffffc020533a:	f2ab0b13          	addi	s6,s6,-214 # ffffffffc0237260 <va_pa_offset>
ffffffffc020533e:	000b3783          	ld	a5,0(s6)
ffffffffc0205342:	6605                	lui	a2,0x1
ffffffffc0205344:	00032597          	auipc	a1,0x32
ffffffffc0205348:	f145b583          	ld	a1,-236(a1) # ffffffffc0237258 <boot_pgdir>
ffffffffc020534c:	00f68933          	add	s2,a3,a5
ffffffffc0205350:	854a                	mv	a0,s2
ffffffffc0205352:	e152                	sd	s4,128(sp)
ffffffffc0205354:	621000ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc0205358:	000aa703          	lw	a4,0(s5)
ffffffffc020535c:	464c47b7          	lui	a5,0x464c4
ffffffffc0205360:	0124bc23          	sd	s2,24(s1)
ffffffffc0205364:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_exit_out_size+0x464c1c2f>
ffffffffc0205368:	020aba03          	ld	s4,32(s5)
ffffffffc020536c:	06f70663          	beq	a4,a5,ffffffffc02053d8 <do_execve+0x182>
ffffffffc0205370:	5961                	li	s2,-8
ffffffffc0205372:	8526                	mv	a0,s1
ffffffffc0205374:	d20ff0ef          	jal	ffffffffc0204894 <put_pgdir>
ffffffffc0205378:	6a0a                	ld	s4,128(sp)
ffffffffc020537a:	7b46                	ld	s6,112(sp)
ffffffffc020537c:	7ba6                	ld	s7,104(sp)
ffffffffc020537e:	6ce6                	ld	s9,88(sp)
ffffffffc0205380:	6d46                	ld	s10,80(sp)
ffffffffc0205382:	8526                	mv	a0,s1
ffffffffc0205384:	a13fe0ef          	jal	ffffffffc0203d96 <mm_destroy>
ffffffffc0205388:	854a                	mv	a0,s2
ffffffffc020538a:	f122                	sd	s0,160(sp)
ffffffffc020538c:	e152                	sd	s4,128(sp)
ffffffffc020538e:	f8da                	sd	s6,112(sp)
ffffffffc0205390:	f4de                	sd	s7,104(sp)
ffffffffc0205392:	f0e2                	sd	s8,96(sp)
ffffffffc0205394:	ece6                	sd	s9,88(sp)
ffffffffc0205396:	e8ea                	sd	s10,80(sp)
ffffffffc0205398:	a6bff0ef          	jal	ffffffffc0204e02 <do_exit>
ffffffffc020539c:	463d                	li	a2,15
ffffffffc020539e:	85ca                	mv	a1,s2
ffffffffc02053a0:	1808                	addi	a0,sp,48
ffffffffc02053a2:	5d3000ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc02053a6:	f00991e3          	bnez	s3,ffffffffc02052a8 <do_execve+0x52>
ffffffffc02053aa:	000db783          	ld	a5,0(s11)
ffffffffc02053ae:	779c                	ld	a5,40(a5)
ffffffffc02053b0:	db85                	beqz	a5,ffffffffc02052e0 <do_execve+0x8a>
ffffffffc02053b2:	00003617          	auipc	a2,0x3
ffffffffc02053b6:	cfe60613          	addi	a2,a2,-770 # ffffffffc02080b0 <etext+0x1f24>
ffffffffc02053ba:	20300593          	li	a1,515
ffffffffc02053be:	00003517          	auipc	a0,0x3
ffffffffc02053c2:	b0a50513          	addi	a0,a0,-1270 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc02053c6:	f122                	sd	s0,160(sp)
ffffffffc02053c8:	e152                	sd	s4,128(sp)
ffffffffc02053ca:	f8da                	sd	s6,112(sp)
ffffffffc02053cc:	f4de                	sd	s7,104(sp)
ffffffffc02053ce:	f0e2                	sd	s8,96(sp)
ffffffffc02053d0:	ece6                	sd	s9,88(sp)
ffffffffc02053d2:	e8ea                	sd	s10,80(sp)
ffffffffc02053d4:	8a0fb0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02053d8:	038ad703          	lhu	a4,56(s5)
ffffffffc02053dc:	9a56                	add	s4,s4,s5
ffffffffc02053de:	f122                	sd	s0,160(sp)
ffffffffc02053e0:	00371793          	slli	a5,a4,0x3
ffffffffc02053e4:	8f99                	sub	a5,a5,a4
ffffffffc02053e6:	078e                	slli	a5,a5,0x3
ffffffffc02053e8:	97d2                	add	a5,a5,s4
ffffffffc02053ea:	f43e                	sd	a5,40(sp)
ffffffffc02053ec:	00fa7e63          	bgeu	s4,a5,ffffffffc0205408 <do_execve+0x1b2>
ffffffffc02053f0:	f0e2                	sd	s8,96(sp)
ffffffffc02053f2:	000a2783          	lw	a5,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0xef0>
ffffffffc02053f6:	4705                	li	a4,1
ffffffffc02053f8:	0ee78f63          	beq	a5,a4,ffffffffc02054f6 <do_execve+0x2a0>
ffffffffc02053fc:	77a2                	ld	a5,40(sp)
ffffffffc02053fe:	038a0a13          	addi	s4,s4,56
ffffffffc0205402:	fefa68e3          	bltu	s4,a5,ffffffffc02053f2 <do_execve+0x19c>
ffffffffc0205406:	7c06                	ld	s8,96(sp)
ffffffffc0205408:	4701                	li	a4,0
ffffffffc020540a:	46ad                	li	a3,11
ffffffffc020540c:	00100637          	lui	a2,0x100
ffffffffc0205410:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0205414:	8526                	mv	a0,s1
ffffffffc0205416:	9d3fe0ef          	jal	ffffffffc0203de8 <mm_map>
ffffffffc020541a:	892a                	mv	s2,a0
ffffffffc020541c:	18051f63          	bnez	a0,ffffffffc02055ba <do_execve+0x364>
ffffffffc0205420:	6c88                	ld	a0,24(s1)
ffffffffc0205422:	467d                	li	a2,31
ffffffffc0205424:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc0205428:	ab9fd0ef          	jal	ffffffffc0202ee0 <pgdir_alloc_page>
ffffffffc020542c:	38050763          	beqz	a0,ffffffffc02057ba <do_execve+0x564>
ffffffffc0205430:	6c88                	ld	a0,24(s1)
ffffffffc0205432:	467d                	li	a2,31
ffffffffc0205434:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc0205438:	aa9fd0ef          	jal	ffffffffc0202ee0 <pgdir_alloc_page>
ffffffffc020543c:	34050e63          	beqz	a0,ffffffffc0205798 <do_execve+0x542>
ffffffffc0205440:	6c88                	ld	a0,24(s1)
ffffffffc0205442:	467d                	li	a2,31
ffffffffc0205444:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0205448:	a99fd0ef          	jal	ffffffffc0202ee0 <pgdir_alloc_page>
ffffffffc020544c:	32050563          	beqz	a0,ffffffffc0205776 <do_execve+0x520>
ffffffffc0205450:	6c88                	ld	a0,24(s1)
ffffffffc0205452:	467d                	li	a2,31
ffffffffc0205454:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0205458:	a89fd0ef          	jal	ffffffffc0202ee0 <pgdir_alloc_page>
ffffffffc020545c:	2e050c63          	beqz	a0,ffffffffc0205754 <do_execve+0x4fe>
ffffffffc0205460:	589c                	lw	a5,48(s1)
ffffffffc0205462:	000db603          	ld	a2,0(s11)
ffffffffc0205466:	6c94                	ld	a3,24(s1)
ffffffffc0205468:	2785                	addiw	a5,a5,1
ffffffffc020546a:	d89c                	sw	a5,48(s1)
ffffffffc020546c:	f604                	sd	s1,40(a2)
ffffffffc020546e:	c02007b7          	lui	a5,0xc0200
ffffffffc0205472:	2cf6e463          	bltu	a3,a5,ffffffffc020573a <do_execve+0x4e4>
ffffffffc0205476:	000b3783          	ld	a5,0(s6)
ffffffffc020547a:	577d                	li	a4,-1
ffffffffc020547c:	177e                	slli	a4,a4,0x3f
ffffffffc020547e:	8e9d                	sub	a3,a3,a5
ffffffffc0205480:	00c6d793          	srli	a5,a3,0xc
ffffffffc0205484:	f654                	sd	a3,168(a2)
ffffffffc0205486:	8fd9                	or	a5,a5,a4
ffffffffc0205488:	18079073          	csrw	satp,a5
ffffffffc020548c:	7240                	ld	s0,160(a2)
ffffffffc020548e:	4581                	li	a1,0
ffffffffc0205490:	12000613          	li	a2,288
ffffffffc0205494:	10043483          	ld	s1,256(s0)
ffffffffc0205498:	8522                	mv	a0,s0
ffffffffc020549a:	4c9000ef          	jal	ffffffffc0206162 <memset>
ffffffffc020549e:	000db983          	ld	s3,0(s11)
ffffffffc02054a2:	018ab703          	ld	a4,24(s5)
ffffffffc02054a6:	edf4f493          	andi	s1,s1,-289
ffffffffc02054aa:	4785                	li	a5,1
ffffffffc02054ac:	07fe                	slli	a5,a5,0x1f
ffffffffc02054ae:	0b498993          	addi	s3,s3,180
ffffffffc02054b2:	0204e493          	ori	s1,s1,32
ffffffffc02054b6:	e81c                	sd	a5,16(s0)
ffffffffc02054b8:	10e43423          	sd	a4,264(s0)
ffffffffc02054bc:	10943023          	sd	s1,256(s0)
ffffffffc02054c0:	4641                	li	a2,16
ffffffffc02054c2:	4581                	li	a1,0
ffffffffc02054c4:	854e                	mv	a0,s3
ffffffffc02054c6:	49d000ef          	jal	ffffffffc0206162 <memset>
ffffffffc02054ca:	463d                	li	a2,15
ffffffffc02054cc:	180c                	addi	a1,sp,48
ffffffffc02054ce:	854e                	mv	a0,s3
ffffffffc02054d0:	4a5000ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc02054d4:	740a                	ld	s0,160(sp)
ffffffffc02054d6:	6a0a                	ld	s4,128(sp)
ffffffffc02054d8:	7b46                	ld	s6,112(sp)
ffffffffc02054da:	7ba6                	ld	s7,104(sp)
ffffffffc02054dc:	6ce6                	ld	s9,88(sp)
ffffffffc02054de:	6d46                	ld	s10,80(sp)
ffffffffc02054e0:	70aa                	ld	ra,168(sp)
ffffffffc02054e2:	64ea                	ld	s1,152(sp)
ffffffffc02054e4:	69aa                	ld	s3,136(sp)
ffffffffc02054e6:	7ae6                	ld	s5,120(sp)
ffffffffc02054e8:	6da6                	ld	s11,72(sp)
ffffffffc02054ea:	854a                	mv	a0,s2
ffffffffc02054ec:	694a                	ld	s2,144(sp)
ffffffffc02054ee:	614d                	addi	sp,sp,176
ffffffffc02054f0:	8082                	ret
ffffffffc02054f2:	5971                	li	s2,-4
ffffffffc02054f4:	bd51                	j	ffffffffc0205388 <do_execve+0x132>
ffffffffc02054f6:	028a3603          	ld	a2,40(s4)
ffffffffc02054fa:	020a3783          	ld	a5,32(s4)
ffffffffc02054fe:	1ef66f63          	bltu	a2,a5,ffffffffc02056fc <do_execve+0x4a6>
ffffffffc0205502:	004a2783          	lw	a5,4(s4)
ffffffffc0205506:	0017f693          	andi	a3,a5,1
ffffffffc020550a:	0027f593          	andi	a1,a5,2
ffffffffc020550e:	0026971b          	slliw	a4,a3,0x2
ffffffffc0205512:	8b91                	andi	a5,a5,4
ffffffffc0205514:	068a                	slli	a3,a3,0x2
ffffffffc0205516:	e1e9                	bnez	a1,ffffffffc02055d8 <do_execve+0x382>
ffffffffc0205518:	1a079b63          	bnez	a5,ffffffffc02056ce <do_execve+0x478>
ffffffffc020551c:	47c5                	li	a5,17
ffffffffc020551e:	ec3e                	sd	a5,24(sp)
ffffffffc0205520:	0046f793          	andi	a5,a3,4
ffffffffc0205524:	c789                	beqz	a5,ffffffffc020552e <do_execve+0x2d8>
ffffffffc0205526:	67e2                	ld	a5,24(sp)
ffffffffc0205528:	0087e793          	ori	a5,a5,8
ffffffffc020552c:	ec3e                	sd	a5,24(sp)
ffffffffc020552e:	010a3583          	ld	a1,16(s4)
ffffffffc0205532:	4701                	li	a4,0
ffffffffc0205534:	8526                	mv	a0,s1
ffffffffc0205536:	8b3fe0ef          	jal	ffffffffc0203de8 <mm_map>
ffffffffc020553a:	892a                	mv	s2,a0
ffffffffc020553c:	1a051e63          	bnez	a0,ffffffffc02056f8 <do_execve+0x4a2>
ffffffffc0205540:	010a3c03          	ld	s8,16(s4)
ffffffffc0205544:	020a3903          	ld	s2,32(s4)
ffffffffc0205548:	008a3983          	ld	s3,8(s4)
ffffffffc020554c:	77fd                	lui	a5,0xfffff
ffffffffc020554e:	9962                	add	s2,s2,s8
ffffffffc0205550:	00fc7bb3          	and	s7,s8,a5
ffffffffc0205554:	99d6                	add	s3,s3,s5
ffffffffc0205556:	052c6963          	bltu	s8,s2,ffffffffc02055a8 <do_execve+0x352>
ffffffffc020555a:	aa59                	j	ffffffffc02056f0 <do_execve+0x49a>
ffffffffc020555c:	6785                	lui	a5,0x1
ffffffffc020555e:	417c0533          	sub	a0,s8,s7
ffffffffc0205562:	9bbe                	add	s7,s7,a5
ffffffffc0205564:	41890633          	sub	a2,s2,s8
ffffffffc0205568:	01796463          	bltu	s2,s7,ffffffffc0205570 <do_execve+0x31a>
ffffffffc020556c:	418b8633          	sub	a2,s7,s8
ffffffffc0205570:	000d3683          	ld	a3,0(s10)
ffffffffc0205574:	67c2                	ld	a5,16(sp)
ffffffffc0205576:	000cb583          	ld	a1,0(s9)
ffffffffc020557a:	40d406b3          	sub	a3,s0,a3
ffffffffc020557e:	8699                	srai	a3,a3,0x6
ffffffffc0205580:	96be                	add	a3,a3,a5
ffffffffc0205582:	7782                	ld	a5,32(sp)
ffffffffc0205584:	00f6f833          	and	a6,a3,a5
ffffffffc0205588:	06b2                	slli	a3,a3,0xc
ffffffffc020558a:	16b87c63          	bgeu	a6,a1,ffffffffc0205702 <do_execve+0x4ac>
ffffffffc020558e:	000b3803          	ld	a6,0(s6)
ffffffffc0205592:	85ce                	mv	a1,s3
ffffffffc0205594:	e432                	sd	a2,8(sp)
ffffffffc0205596:	96c2                	add	a3,a3,a6
ffffffffc0205598:	9536                	add	a0,a0,a3
ffffffffc020559a:	3db000ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc020559e:	6622                	ld	a2,8(sp)
ffffffffc02055a0:	9c32                	add	s8,s8,a2
ffffffffc02055a2:	99b2                	add	s3,s3,a2
ffffffffc02055a4:	052c7363          	bgeu	s8,s2,ffffffffc02055ea <do_execve+0x394>
ffffffffc02055a8:	6c88                	ld	a0,24(s1)
ffffffffc02055aa:	6662                	ld	a2,24(sp)
ffffffffc02055ac:	85de                	mv	a1,s7
ffffffffc02055ae:	933fd0ef          	jal	ffffffffc0202ee0 <pgdir_alloc_page>
ffffffffc02055b2:	842a                	mv	s0,a0
ffffffffc02055b4:	f545                	bnez	a0,ffffffffc020555c <do_execve+0x306>
ffffffffc02055b6:	7c06                	ld	s8,96(sp)
ffffffffc02055b8:	5971                	li	s2,-4
ffffffffc02055ba:	8526                	mv	a0,s1
ffffffffc02055bc:	993fe0ef          	jal	ffffffffc0203f4e <exit_mmap>
ffffffffc02055c0:	740a                	ld	s0,160(sp)
ffffffffc02055c2:	bb45                	j	ffffffffc0205372 <do_execve+0x11c>
ffffffffc02055c4:	854e                	mv	a0,s3
ffffffffc02055c6:	989fe0ef          	jal	ffffffffc0203f4e <exit_mmap>
ffffffffc02055ca:	854e                	mv	a0,s3
ffffffffc02055cc:	ac8ff0ef          	jal	ffffffffc0204894 <put_pgdir>
ffffffffc02055d0:	854e                	mv	a0,s3
ffffffffc02055d2:	fc4fe0ef          	jal	ffffffffc0203d96 <mm_destroy>
ffffffffc02055d6:	b309                	j	ffffffffc02052d8 <do_execve+0x82>
ffffffffc02055d8:	10079263          	bnez	a5,ffffffffc02056dc <do_execve+0x486>
ffffffffc02055dc:	00276713          	ori	a4,a4,2
ffffffffc02055e0:	0007069b          	sext.w	a3,a4
ffffffffc02055e4:	47dd                	li	a5,23
ffffffffc02055e6:	ec3e                	sd	a5,24(sp)
ffffffffc02055e8:	bf25                	j	ffffffffc0205520 <do_execve+0x2ca>
ffffffffc02055ea:	010a3903          	ld	s2,16(s4)
ffffffffc02055ee:	028a3683          	ld	a3,40(s4)
ffffffffc02055f2:	9936                	add	s2,s2,a3
ffffffffc02055f4:	077c7a63          	bgeu	s8,s7,ffffffffc0205668 <do_execve+0x412>
ffffffffc02055f8:	e18902e3          	beq	s2,s8,ffffffffc02053fc <do_execve+0x1a6>
ffffffffc02055fc:	6505                	lui	a0,0x1
ffffffffc02055fe:	9562                	add	a0,a0,s8
ffffffffc0205600:	41750533          	sub	a0,a0,s7
ffffffffc0205604:	418909b3          	sub	s3,s2,s8
ffffffffc0205608:	0d797f63          	bgeu	s2,s7,ffffffffc02056e6 <do_execve+0x490>
ffffffffc020560c:	000d3683          	ld	a3,0(s10)
ffffffffc0205610:	67c2                	ld	a5,16(sp)
ffffffffc0205612:	000cb603          	ld	a2,0(s9)
ffffffffc0205616:	40d406b3          	sub	a3,s0,a3
ffffffffc020561a:	8699                	srai	a3,a3,0x6
ffffffffc020561c:	96be                	add	a3,a3,a5
ffffffffc020561e:	00c69593          	slli	a1,a3,0xc
ffffffffc0205622:	81b1                	srli	a1,a1,0xc
ffffffffc0205624:	06b2                	slli	a3,a3,0xc
ffffffffc0205626:	0cc5fe63          	bgeu	a1,a2,ffffffffc0205702 <do_execve+0x4ac>
ffffffffc020562a:	000b3803          	ld	a6,0(s6)
ffffffffc020562e:	864e                	mv	a2,s3
ffffffffc0205630:	4581                	li	a1,0
ffffffffc0205632:	96c2                	add	a3,a3,a6
ffffffffc0205634:	9536                	add	a0,a0,a3
ffffffffc0205636:	32d000ef          	jal	ffffffffc0206162 <memset>
ffffffffc020563a:	9c4e                	add	s8,s8,s3
ffffffffc020563c:	03797463          	bgeu	s2,s7,ffffffffc0205664 <do_execve+0x40e>
ffffffffc0205640:	db890ee3          	beq	s2,s8,ffffffffc02053fc <do_execve+0x1a6>
ffffffffc0205644:	00003697          	auipc	a3,0x3
ffffffffc0205648:	a9468693          	addi	a3,a3,-1388 # ffffffffc02080d8 <etext+0x1f4c>
ffffffffc020564c:	00001617          	auipc	a2,0x1
ffffffffc0205650:	1bc60613          	addi	a2,a2,444 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205654:	25800593          	li	a1,600
ffffffffc0205658:	00003517          	auipc	a0,0x3
ffffffffc020565c:	87050513          	addi	a0,a0,-1936 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205660:	e15fa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205664:	ff8b90e3          	bne	s7,s8,ffffffffc0205644 <do_execve+0x3ee>
ffffffffc0205668:	d92c7ae3          	bgeu	s8,s2,ffffffffc02053fc <do_execve+0x1a6>
ffffffffc020566c:	56fd                	li	a3,-1
ffffffffc020566e:	00c6d793          	srli	a5,a3,0xc
ffffffffc0205672:	e43e                	sd	a5,8(sp)
ffffffffc0205674:	a0a9                	j	ffffffffc02056be <do_execve+0x468>
ffffffffc0205676:	6785                	lui	a5,0x1
ffffffffc0205678:	417c0533          	sub	a0,s8,s7
ffffffffc020567c:	9bbe                	add	s7,s7,a5
ffffffffc020567e:	418909b3          	sub	s3,s2,s8
ffffffffc0205682:	01796463          	bltu	s2,s7,ffffffffc020568a <do_execve+0x434>
ffffffffc0205686:	418b89b3          	sub	s3,s7,s8
ffffffffc020568a:	000d3683          	ld	a3,0(s10)
ffffffffc020568e:	67c2                	ld	a5,16(sp)
ffffffffc0205690:	000cb583          	ld	a1,0(s9)
ffffffffc0205694:	40d406b3          	sub	a3,s0,a3
ffffffffc0205698:	8699                	srai	a3,a3,0x6
ffffffffc020569a:	96be                	add	a3,a3,a5
ffffffffc020569c:	67a2                	ld	a5,8(sp)
ffffffffc020569e:	00f6f833          	and	a6,a3,a5
ffffffffc02056a2:	06b2                	slli	a3,a3,0xc
ffffffffc02056a4:	04b87f63          	bgeu	a6,a1,ffffffffc0205702 <do_execve+0x4ac>
ffffffffc02056a8:	000b3803          	ld	a6,0(s6)
ffffffffc02056ac:	864e                	mv	a2,s3
ffffffffc02056ae:	4581                	li	a1,0
ffffffffc02056b0:	96c2                	add	a3,a3,a6
ffffffffc02056b2:	9536                	add	a0,a0,a3
ffffffffc02056b4:	9c4e                	add	s8,s8,s3
ffffffffc02056b6:	2ad000ef          	jal	ffffffffc0206162 <memset>
ffffffffc02056ba:	d52c71e3          	bgeu	s8,s2,ffffffffc02053fc <do_execve+0x1a6>
ffffffffc02056be:	6c88                	ld	a0,24(s1)
ffffffffc02056c0:	6662                	ld	a2,24(sp)
ffffffffc02056c2:	85de                	mv	a1,s7
ffffffffc02056c4:	81dfd0ef          	jal	ffffffffc0202ee0 <pgdir_alloc_page>
ffffffffc02056c8:	842a                	mv	s0,a0
ffffffffc02056ca:	f555                	bnez	a0,ffffffffc0205676 <do_execve+0x420>
ffffffffc02056cc:	b5ed                	j	ffffffffc02055b6 <do_execve+0x360>
ffffffffc02056ce:	00176713          	ori	a4,a4,1
ffffffffc02056d2:	47cd                	li	a5,19
ffffffffc02056d4:	0007069b          	sext.w	a3,a4
ffffffffc02056d8:	ec3e                	sd	a5,24(sp)
ffffffffc02056da:	b599                	j	ffffffffc0205520 <do_execve+0x2ca>
ffffffffc02056dc:	00376713          	ori	a4,a4,3
ffffffffc02056e0:	0007069b          	sext.w	a3,a4
ffffffffc02056e4:	b701                	j	ffffffffc02055e4 <do_execve+0x38e>
ffffffffc02056e6:	418b89b3          	sub	s3,s7,s8
ffffffffc02056ea:	b70d                	j	ffffffffc020560c <do_execve+0x3b6>
ffffffffc02056ec:	5975                	li	s2,-3
ffffffffc02056ee:	bbcd                	j	ffffffffc02054e0 <do_execve+0x28a>
ffffffffc02056f0:	8962                	mv	s2,s8
ffffffffc02056f2:	bdf5                	j	ffffffffc02055ee <do_execve+0x398>
ffffffffc02056f4:	5971                	li	s2,-4
ffffffffc02056f6:	b171                	j	ffffffffc0205382 <do_execve+0x12c>
ffffffffc02056f8:	7c06                	ld	s8,96(sp)
ffffffffc02056fa:	b5c1                	j	ffffffffc02055ba <do_execve+0x364>
ffffffffc02056fc:	7c06                	ld	s8,96(sp)
ffffffffc02056fe:	5961                	li	s2,-8
ffffffffc0205700:	bd6d                	j	ffffffffc02055ba <do_execve+0x364>
ffffffffc0205702:	00001617          	auipc	a2,0x1
ffffffffc0205706:	72e60613          	addi	a2,a2,1838 # ffffffffc0206e30 <etext+0xca4>
ffffffffc020570a:	06900593          	li	a1,105
ffffffffc020570e:	00001517          	auipc	a0,0x1
ffffffffc0205712:	74a50513          	addi	a0,a0,1866 # ffffffffc0206e58 <etext+0xccc>
ffffffffc0205716:	d5ffa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020571a:	00001617          	auipc	a2,0x1
ffffffffc020571e:	71660613          	addi	a2,a2,1814 # ffffffffc0206e30 <etext+0xca4>
ffffffffc0205722:	06900593          	li	a1,105
ffffffffc0205726:	00001517          	auipc	a0,0x1
ffffffffc020572a:	73250513          	addi	a0,a0,1842 # ffffffffc0206e58 <etext+0xccc>
ffffffffc020572e:	f122                	sd	s0,160(sp)
ffffffffc0205730:	e152                	sd	s4,128(sp)
ffffffffc0205732:	f8da                	sd	s6,112(sp)
ffffffffc0205734:	f0e2                	sd	s8,96(sp)
ffffffffc0205736:	d3ffa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc020573a:	00001617          	auipc	a2,0x1
ffffffffc020573e:	79e60613          	addi	a2,a2,1950 # ffffffffc0206ed8 <etext+0xd4c>
ffffffffc0205742:	27300593          	li	a1,627
ffffffffc0205746:	00002517          	auipc	a0,0x2
ffffffffc020574a:	78250513          	addi	a0,a0,1922 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc020574e:	f0e2                	sd	s8,96(sp)
ffffffffc0205750:	d25fa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205754:	00003697          	auipc	a3,0x3
ffffffffc0205758:	a9c68693          	addi	a3,a3,-1380 # ffffffffc02081f0 <etext+0x2064>
ffffffffc020575c:	00001617          	auipc	a2,0x1
ffffffffc0205760:	0ac60613          	addi	a2,a2,172 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205764:	26e00593          	li	a1,622
ffffffffc0205768:	00002517          	auipc	a0,0x2
ffffffffc020576c:	76050513          	addi	a0,a0,1888 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205770:	f0e2                	sd	s8,96(sp)
ffffffffc0205772:	d03fa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205776:	00003697          	auipc	a3,0x3
ffffffffc020577a:	a3268693          	addi	a3,a3,-1486 # ffffffffc02081a8 <etext+0x201c>
ffffffffc020577e:	00001617          	auipc	a2,0x1
ffffffffc0205782:	08a60613          	addi	a2,a2,138 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205786:	26d00593          	li	a1,621
ffffffffc020578a:	00002517          	auipc	a0,0x2
ffffffffc020578e:	73e50513          	addi	a0,a0,1854 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205792:	f0e2                	sd	s8,96(sp)
ffffffffc0205794:	ce1fa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205798:	00003697          	auipc	a3,0x3
ffffffffc020579c:	9c868693          	addi	a3,a3,-1592 # ffffffffc0208160 <etext+0x1fd4>
ffffffffc02057a0:	00001617          	auipc	a2,0x1
ffffffffc02057a4:	06860613          	addi	a2,a2,104 # ffffffffc0206808 <etext+0x67c>
ffffffffc02057a8:	26c00593          	li	a1,620
ffffffffc02057ac:	00002517          	auipc	a0,0x2
ffffffffc02057b0:	71c50513          	addi	a0,a0,1820 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc02057b4:	f0e2                	sd	s8,96(sp)
ffffffffc02057b6:	cbffa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02057ba:	00003697          	auipc	a3,0x3
ffffffffc02057be:	95e68693          	addi	a3,a3,-1698 # ffffffffc0208118 <etext+0x1f8c>
ffffffffc02057c2:	00001617          	auipc	a2,0x1
ffffffffc02057c6:	04660613          	addi	a2,a2,70 # ffffffffc0206808 <etext+0x67c>
ffffffffc02057ca:	26b00593          	li	a1,619
ffffffffc02057ce:	00002517          	auipc	a0,0x2
ffffffffc02057d2:	6fa50513          	addi	a0,a0,1786 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc02057d6:	f0e2                	sd	s8,96(sp)
ffffffffc02057d8:	c9dfa0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc02057dc <do_yield>:
ffffffffc02057dc:	00032797          	auipc	a5,0x32
ffffffffc02057e0:	acc7b783          	ld	a5,-1332(a5) # ffffffffc02372a8 <current>
ffffffffc02057e4:	4705                	li	a4,1
ffffffffc02057e6:	ef98                	sd	a4,24(a5)
ffffffffc02057e8:	4501                	li	a0,0
ffffffffc02057ea:	8082                	ret

ffffffffc02057ec <do_wait>:
ffffffffc02057ec:	1101                	addi	sp,sp,-32
ffffffffc02057ee:	e822                	sd	s0,16(sp)
ffffffffc02057f0:	e426                	sd	s1,8(sp)
ffffffffc02057f2:	00032797          	auipc	a5,0x32
ffffffffc02057f6:	ab67b783          	ld	a5,-1354(a5) # ffffffffc02372a8 <current>
ffffffffc02057fa:	ec06                	sd	ra,24(sp)
ffffffffc02057fc:	779c                	ld	a5,40(a5)
ffffffffc02057fe:	842e                	mv	s0,a1
ffffffffc0205800:	84aa                	mv	s1,a0
ffffffffc0205802:	c599                	beqz	a1,ffffffffc0205810 <do_wait+0x24>
ffffffffc0205804:	4685                	li	a3,1
ffffffffc0205806:	4611                	li	a2,4
ffffffffc0205808:	853e                	mv	a0,a5
ffffffffc020580a:	d91fe0ef          	jal	ffffffffc020459a <user_mem_check>
ffffffffc020580e:	c909                	beqz	a0,ffffffffc0205820 <do_wait+0x34>
ffffffffc0205810:	85a2                	mv	a1,s0
ffffffffc0205812:	6442                	ld	s0,16(sp)
ffffffffc0205814:	60e2                	ld	ra,24(sp)
ffffffffc0205816:	8526                	mv	a0,s1
ffffffffc0205818:	64a2                	ld	s1,8(sp)
ffffffffc020581a:	6105                	addi	sp,sp,32
ffffffffc020581c:	f36ff06f          	j	ffffffffc0204f52 <do_wait.part.0>
ffffffffc0205820:	60e2                	ld	ra,24(sp)
ffffffffc0205822:	6442                	ld	s0,16(sp)
ffffffffc0205824:	64a2                	ld	s1,8(sp)
ffffffffc0205826:	5575                	li	a0,-3
ffffffffc0205828:	6105                	addi	sp,sp,32
ffffffffc020582a:	8082                	ret

ffffffffc020582c <do_kill>:
ffffffffc020582c:	6789                	lui	a5,0x2
ffffffffc020582e:	fff5071b          	addiw	a4,a0,-1
ffffffffc0205832:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_obj___user_hello_out_size+0x36>
ffffffffc0205834:	06e7e963          	bltu	a5,a4,ffffffffc02058a6 <do_kill+0x7a>
ffffffffc0205838:	1141                	addi	sp,sp,-16
ffffffffc020583a:	e022                	sd	s0,0(sp)
ffffffffc020583c:	45a9                	li	a1,10
ffffffffc020583e:	842a                	mv	s0,a0
ffffffffc0205840:	2501                	sext.w	a0,a0
ffffffffc0205842:	e406                	sd	ra,8(sp)
ffffffffc0205844:	48a000ef          	jal	ffffffffc0205cce <hash32>
ffffffffc0205848:	02051793          	slli	a5,a0,0x20
ffffffffc020584c:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205850:	0002e797          	auipc	a5,0x2e
ffffffffc0205854:	9c878793          	addi	a5,a5,-1592 # ffffffffc0233218 <hash_list>
ffffffffc0205858:	953e                	add	a0,a0,a5
ffffffffc020585a:	87aa                	mv	a5,a0
ffffffffc020585c:	a029                	j	ffffffffc0205866 <do_kill+0x3a>
ffffffffc020585e:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0205862:	00870a63          	beq	a4,s0,ffffffffc0205876 <do_kill+0x4a>
ffffffffc0205866:	679c                	ld	a5,8(a5)
ffffffffc0205868:	fef51be3          	bne	a0,a5,ffffffffc020585e <do_kill+0x32>
ffffffffc020586c:	5575                	li	a0,-3
ffffffffc020586e:	60a2                	ld	ra,8(sp)
ffffffffc0205870:	6402                	ld	s0,0(sp)
ffffffffc0205872:	0141                	addi	sp,sp,16
ffffffffc0205874:	8082                	ret
ffffffffc0205876:	fd87a703          	lw	a4,-40(a5)
ffffffffc020587a:	555d                	li	a0,-9
ffffffffc020587c:	00177693          	andi	a3,a4,1
ffffffffc0205880:	f6fd                	bnez	a3,ffffffffc020586e <do_kill+0x42>
ffffffffc0205882:	4bd4                	lw	a3,20(a5)
ffffffffc0205884:	00176713          	ori	a4,a4,1
ffffffffc0205888:	fce7ac23          	sw	a4,-40(a5)
ffffffffc020588c:	0006c763          	bltz	a3,ffffffffc020589a <do_kill+0x6e>
ffffffffc0205890:	4501                	li	a0,0
ffffffffc0205892:	60a2                	ld	ra,8(sp)
ffffffffc0205894:	6402                	ld	s0,0(sp)
ffffffffc0205896:	0141                	addi	sp,sp,16
ffffffffc0205898:	8082                	ret
ffffffffc020589a:	f2878513          	addi	a0,a5,-216
ffffffffc020589e:	22a000ef          	jal	ffffffffc0205ac8 <wakeup_proc>
ffffffffc02058a2:	4501                	li	a0,0
ffffffffc02058a4:	b7fd                	j	ffffffffc0205892 <do_kill+0x66>
ffffffffc02058a6:	5575                	li	a0,-3
ffffffffc02058a8:	8082                	ret

ffffffffc02058aa <proc_init>:
ffffffffc02058aa:	1101                	addi	sp,sp,-32
ffffffffc02058ac:	e426                	sd	s1,8(sp)
ffffffffc02058ae:	00032797          	auipc	a5,0x32
ffffffffc02058b2:	96a78793          	addi	a5,a5,-1686 # ffffffffc0237218 <proc_list>
ffffffffc02058b6:	ec06                	sd	ra,24(sp)
ffffffffc02058b8:	e822                	sd	s0,16(sp)
ffffffffc02058ba:	e04a                	sd	s2,0(sp)
ffffffffc02058bc:	0002e497          	auipc	s1,0x2e
ffffffffc02058c0:	95c48493          	addi	s1,s1,-1700 # ffffffffc0233218 <hash_list>
ffffffffc02058c4:	e79c                	sd	a5,8(a5)
ffffffffc02058c6:	e39c                	sd	a5,0(a5)
ffffffffc02058c8:	00032717          	auipc	a4,0x32
ffffffffc02058cc:	95070713          	addi	a4,a4,-1712 # ffffffffc0237218 <proc_list>
ffffffffc02058d0:	87a6                	mv	a5,s1
ffffffffc02058d2:	e79c                	sd	a5,8(a5)
ffffffffc02058d4:	e39c                	sd	a5,0(a5)
ffffffffc02058d6:	07c1                	addi	a5,a5,16
ffffffffc02058d8:	fee79de3          	bne	a5,a4,ffffffffc02058d2 <proc_init+0x28>
ffffffffc02058dc:	ebbfe0ef          	jal	ffffffffc0204796 <alloc_proc>
ffffffffc02058e0:	00032917          	auipc	s2,0x32
ffffffffc02058e4:	9d890913          	addi	s2,s2,-1576 # ffffffffc02372b8 <idleproc>
ffffffffc02058e8:	00a93023          	sd	a0,0(s2)
ffffffffc02058ec:	10050063          	beqz	a0,ffffffffc02059ec <proc_init+0x142>
ffffffffc02058f0:	4789                	li	a5,2
ffffffffc02058f2:	e11c                	sd	a5,0(a0)
ffffffffc02058f4:	00003797          	auipc	a5,0x3
ffffffffc02058f8:	70c78793          	addi	a5,a5,1804 # ffffffffc0209000 <bootstack>
ffffffffc02058fc:	0b450413          	addi	s0,a0,180
ffffffffc0205900:	e91c                	sd	a5,16(a0)
ffffffffc0205902:	4785                	li	a5,1
ffffffffc0205904:	ed1c                	sd	a5,24(a0)
ffffffffc0205906:	4641                	li	a2,16
ffffffffc0205908:	4581                	li	a1,0
ffffffffc020590a:	8522                	mv	a0,s0
ffffffffc020590c:	057000ef          	jal	ffffffffc0206162 <memset>
ffffffffc0205910:	463d                	li	a2,15
ffffffffc0205912:	00003597          	auipc	a1,0x3
ffffffffc0205916:	93e58593          	addi	a1,a1,-1730 # ffffffffc0208250 <etext+0x20c4>
ffffffffc020591a:	8522                	mv	a0,s0
ffffffffc020591c:	059000ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc0205920:	00032717          	auipc	a4,0x32
ffffffffc0205924:	98070713          	addi	a4,a4,-1664 # ffffffffc02372a0 <nr_process>
ffffffffc0205928:	431c                	lw	a5,0(a4)
ffffffffc020592a:	00093683          	ld	a3,0(s2)
ffffffffc020592e:	4601                	li	a2,0
ffffffffc0205930:	2785                	addiw	a5,a5,1
ffffffffc0205932:	4581                	li	a1,0
ffffffffc0205934:	fffff517          	auipc	a0,0xfffff
ffffffffc0205938:	7fe50513          	addi	a0,a0,2046 # ffffffffc0205132 <init_main>
ffffffffc020593c:	c31c                	sw	a5,0(a4)
ffffffffc020593e:	00032797          	auipc	a5,0x32
ffffffffc0205942:	96d7b523          	sd	a3,-1686(a5) # ffffffffc02372a8 <current>
ffffffffc0205946:	c6cff0ef          	jal	ffffffffc0204db2 <kernel_thread>
ffffffffc020594a:	842a                	mv	s0,a0
ffffffffc020594c:	08a05463          	blez	a0,ffffffffc02059d4 <proc_init+0x12a>
ffffffffc0205950:	6789                	lui	a5,0x2
ffffffffc0205952:	fff5071b          	addiw	a4,a0,-1
ffffffffc0205956:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_obj___user_hello_out_size+0x36>
ffffffffc0205958:	2501                	sext.w	a0,a0
ffffffffc020595a:	02e7e463          	bltu	a5,a4,ffffffffc0205982 <proc_init+0xd8>
ffffffffc020595e:	45a9                	li	a1,10
ffffffffc0205960:	36e000ef          	jal	ffffffffc0205cce <hash32>
ffffffffc0205964:	02051713          	slli	a4,a0,0x20
ffffffffc0205968:	01c75793          	srli	a5,a4,0x1c
ffffffffc020596c:	00f486b3          	add	a3,s1,a5
ffffffffc0205970:	87b6                	mv	a5,a3
ffffffffc0205972:	a029                	j	ffffffffc020597c <proc_init+0xd2>
ffffffffc0205974:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0205978:	04870b63          	beq	a4,s0,ffffffffc02059ce <proc_init+0x124>
ffffffffc020597c:	679c                	ld	a5,8(a5)
ffffffffc020597e:	fef69be3          	bne	a3,a5,ffffffffc0205974 <proc_init+0xca>
ffffffffc0205982:	4781                	li	a5,0
ffffffffc0205984:	0b478493          	addi	s1,a5,180
ffffffffc0205988:	4641                	li	a2,16
ffffffffc020598a:	4581                	li	a1,0
ffffffffc020598c:	00032417          	auipc	s0,0x32
ffffffffc0205990:	92440413          	addi	s0,s0,-1756 # ffffffffc02372b0 <initproc>
ffffffffc0205994:	8526                	mv	a0,s1
ffffffffc0205996:	e01c                	sd	a5,0(s0)
ffffffffc0205998:	7ca000ef          	jal	ffffffffc0206162 <memset>
ffffffffc020599c:	463d                	li	a2,15
ffffffffc020599e:	00003597          	auipc	a1,0x3
ffffffffc02059a2:	8da58593          	addi	a1,a1,-1830 # ffffffffc0208278 <etext+0x20ec>
ffffffffc02059a6:	8526                	mv	a0,s1
ffffffffc02059a8:	7cc000ef          	jal	ffffffffc0206174 <memcpy>
ffffffffc02059ac:	00093783          	ld	a5,0(s2)
ffffffffc02059b0:	cbb5                	beqz	a5,ffffffffc0205a24 <proc_init+0x17a>
ffffffffc02059b2:	43dc                	lw	a5,4(a5)
ffffffffc02059b4:	eba5                	bnez	a5,ffffffffc0205a24 <proc_init+0x17a>
ffffffffc02059b6:	601c                	ld	a5,0(s0)
ffffffffc02059b8:	c7b1                	beqz	a5,ffffffffc0205a04 <proc_init+0x15a>
ffffffffc02059ba:	43d8                	lw	a4,4(a5)
ffffffffc02059bc:	4785                	li	a5,1
ffffffffc02059be:	04f71363          	bne	a4,a5,ffffffffc0205a04 <proc_init+0x15a>
ffffffffc02059c2:	60e2                	ld	ra,24(sp)
ffffffffc02059c4:	6442                	ld	s0,16(sp)
ffffffffc02059c6:	64a2                	ld	s1,8(sp)
ffffffffc02059c8:	6902                	ld	s2,0(sp)
ffffffffc02059ca:	6105                	addi	sp,sp,32
ffffffffc02059cc:	8082                	ret
ffffffffc02059ce:	f2878793          	addi	a5,a5,-216
ffffffffc02059d2:	bf4d                	j	ffffffffc0205984 <proc_init+0xda>
ffffffffc02059d4:	00003617          	auipc	a2,0x3
ffffffffc02059d8:	88460613          	addi	a2,a2,-1916 # ffffffffc0208258 <etext+0x20cc>
ffffffffc02059dc:	37700593          	li	a1,887
ffffffffc02059e0:	00002517          	auipc	a0,0x2
ffffffffc02059e4:	4e850513          	addi	a0,a0,1256 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc02059e8:	a8dfa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc02059ec:	00003617          	auipc	a2,0x3
ffffffffc02059f0:	84c60613          	addi	a2,a2,-1972 # ffffffffc0208238 <etext+0x20ac>
ffffffffc02059f4:	36900593          	li	a1,873
ffffffffc02059f8:	00002517          	auipc	a0,0x2
ffffffffc02059fc:	4d050513          	addi	a0,a0,1232 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205a00:	a75fa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205a04:	00003697          	auipc	a3,0x3
ffffffffc0205a08:	8a468693          	addi	a3,a3,-1884 # ffffffffc02082a8 <etext+0x211c>
ffffffffc0205a0c:	00001617          	auipc	a2,0x1
ffffffffc0205a10:	dfc60613          	addi	a2,a2,-516 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205a14:	37e00593          	li	a1,894
ffffffffc0205a18:	00002517          	auipc	a0,0x2
ffffffffc0205a1c:	4b050513          	addi	a0,a0,1200 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205a20:	a55fa0ef          	jal	ffffffffc0200474 <__panic>
ffffffffc0205a24:	00003697          	auipc	a3,0x3
ffffffffc0205a28:	85c68693          	addi	a3,a3,-1956 # ffffffffc0208280 <etext+0x20f4>
ffffffffc0205a2c:	00001617          	auipc	a2,0x1
ffffffffc0205a30:	ddc60613          	addi	a2,a2,-548 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205a34:	37d00593          	li	a1,893
ffffffffc0205a38:	00002517          	auipc	a0,0x2
ffffffffc0205a3c:	49050513          	addi	a0,a0,1168 # ffffffffc0207ec8 <etext+0x1d3c>
ffffffffc0205a40:	a35fa0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0205a44 <cpu_idle>:
ffffffffc0205a44:	1141                	addi	sp,sp,-16
ffffffffc0205a46:	e022                	sd	s0,0(sp)
ffffffffc0205a48:	e406                	sd	ra,8(sp)
ffffffffc0205a4a:	00032417          	auipc	s0,0x32
ffffffffc0205a4e:	85e40413          	addi	s0,s0,-1954 # ffffffffc02372a8 <current>
ffffffffc0205a52:	6018                	ld	a4,0(s0)
ffffffffc0205a54:	6f1c                	ld	a5,24(a4)
ffffffffc0205a56:	dffd                	beqz	a5,ffffffffc0205a54 <cpu_idle+0x10>
ffffffffc0205a58:	10a000ef          	jal	ffffffffc0205b62 <schedule>
ffffffffc0205a5c:	bfdd                	j	ffffffffc0205a52 <cpu_idle+0xe>

ffffffffc0205a5e <switch_to>:
ffffffffc0205a5e:	00153023          	sd	ra,0(a0)
ffffffffc0205a62:	00253423          	sd	sp,8(a0)
ffffffffc0205a66:	e900                	sd	s0,16(a0)
ffffffffc0205a68:	ed04                	sd	s1,24(a0)
ffffffffc0205a6a:	03253023          	sd	s2,32(a0)
ffffffffc0205a6e:	03353423          	sd	s3,40(a0)
ffffffffc0205a72:	03453823          	sd	s4,48(a0)
ffffffffc0205a76:	03553c23          	sd	s5,56(a0)
ffffffffc0205a7a:	05653023          	sd	s6,64(a0)
ffffffffc0205a7e:	05753423          	sd	s7,72(a0)
ffffffffc0205a82:	05853823          	sd	s8,80(a0)
ffffffffc0205a86:	05953c23          	sd	s9,88(a0)
ffffffffc0205a8a:	07a53023          	sd	s10,96(a0)
ffffffffc0205a8e:	07b53423          	sd	s11,104(a0)
ffffffffc0205a92:	0005b083          	ld	ra,0(a1)
ffffffffc0205a96:	0085b103          	ld	sp,8(a1)
ffffffffc0205a9a:	6980                	ld	s0,16(a1)
ffffffffc0205a9c:	6d84                	ld	s1,24(a1)
ffffffffc0205a9e:	0205b903          	ld	s2,32(a1)
ffffffffc0205aa2:	0285b983          	ld	s3,40(a1)
ffffffffc0205aa6:	0305ba03          	ld	s4,48(a1)
ffffffffc0205aaa:	0385ba83          	ld	s5,56(a1)
ffffffffc0205aae:	0405bb03          	ld	s6,64(a1)
ffffffffc0205ab2:	0485bb83          	ld	s7,72(a1)
ffffffffc0205ab6:	0505bc03          	ld	s8,80(a1)
ffffffffc0205aba:	0585bc83          	ld	s9,88(a1)
ffffffffc0205abe:	0605bd03          	ld	s10,96(a1)
ffffffffc0205ac2:	0685bd83          	ld	s11,104(a1)
ffffffffc0205ac6:	8082                	ret

ffffffffc0205ac8 <wakeup_proc>:
ffffffffc0205ac8:	4118                	lw	a4,0(a0)
ffffffffc0205aca:	1141                	addi	sp,sp,-16
ffffffffc0205acc:	e406                	sd	ra,8(sp)
ffffffffc0205ace:	e022                	sd	s0,0(sp)
ffffffffc0205ad0:	478d                	li	a5,3
ffffffffc0205ad2:	06f70963          	beq	a4,a5,ffffffffc0205b44 <wakeup_proc+0x7c>
ffffffffc0205ad6:	842a                	mv	s0,a0
ffffffffc0205ad8:	100027f3          	csrr	a5,sstatus
ffffffffc0205adc:	8b89                	andi	a5,a5,2
ffffffffc0205ade:	eb99                	bnez	a5,ffffffffc0205af4 <wakeup_proc+0x2c>
ffffffffc0205ae0:	4789                	li	a5,2
ffffffffc0205ae2:	02f70763          	beq	a4,a5,ffffffffc0205b10 <wakeup_proc+0x48>
ffffffffc0205ae6:	60a2                	ld	ra,8(sp)
ffffffffc0205ae8:	6402                	ld	s0,0(sp)
ffffffffc0205aea:	c11c                	sw	a5,0(a0)
ffffffffc0205aec:	0e052623          	sw	zero,236(a0)
ffffffffc0205af0:	0141                	addi	sp,sp,16
ffffffffc0205af2:	8082                	ret
ffffffffc0205af4:	b4dfa0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0205af8:	4018                	lw	a4,0(s0)
ffffffffc0205afa:	4789                	li	a5,2
ffffffffc0205afc:	02f70863          	beq	a4,a5,ffffffffc0205b2c <wakeup_proc+0x64>
ffffffffc0205b00:	c01c                	sw	a5,0(s0)
ffffffffc0205b02:	0e042623          	sw	zero,236(s0)
ffffffffc0205b06:	6402                	ld	s0,0(sp)
ffffffffc0205b08:	60a2                	ld	ra,8(sp)
ffffffffc0205b0a:	0141                	addi	sp,sp,16
ffffffffc0205b0c:	b2ffa06f          	j	ffffffffc020063a <intr_enable>
ffffffffc0205b10:	6402                	ld	s0,0(sp)
ffffffffc0205b12:	60a2                	ld	ra,8(sp)
ffffffffc0205b14:	00002617          	auipc	a2,0x2
ffffffffc0205b18:	7f460613          	addi	a2,a2,2036 # ffffffffc0208308 <etext+0x217c>
ffffffffc0205b1c:	45c9                	li	a1,18
ffffffffc0205b1e:	00002517          	auipc	a0,0x2
ffffffffc0205b22:	7d250513          	addi	a0,a0,2002 # ffffffffc02082f0 <etext+0x2164>
ffffffffc0205b26:	0141                	addi	sp,sp,16
ffffffffc0205b28:	9b7fa06f          	j	ffffffffc02004de <__warn>
ffffffffc0205b2c:	00002617          	auipc	a2,0x2
ffffffffc0205b30:	7dc60613          	addi	a2,a2,2012 # ffffffffc0208308 <etext+0x217c>
ffffffffc0205b34:	45c9                	li	a1,18
ffffffffc0205b36:	00002517          	auipc	a0,0x2
ffffffffc0205b3a:	7ba50513          	addi	a0,a0,1978 # ffffffffc02082f0 <etext+0x2164>
ffffffffc0205b3e:	9a1fa0ef          	jal	ffffffffc02004de <__warn>
ffffffffc0205b42:	b7d1                	j	ffffffffc0205b06 <wakeup_proc+0x3e>
ffffffffc0205b44:	00002697          	auipc	a3,0x2
ffffffffc0205b48:	78c68693          	addi	a3,a3,1932 # ffffffffc02082d0 <etext+0x2144>
ffffffffc0205b4c:	00001617          	auipc	a2,0x1
ffffffffc0205b50:	cbc60613          	addi	a2,a2,-836 # ffffffffc0206808 <etext+0x67c>
ffffffffc0205b54:	45a5                	li	a1,9
ffffffffc0205b56:	00002517          	auipc	a0,0x2
ffffffffc0205b5a:	79a50513          	addi	a0,a0,1946 # ffffffffc02082f0 <etext+0x2164>
ffffffffc0205b5e:	917fa0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0205b62 <schedule>:
ffffffffc0205b62:	1141                	addi	sp,sp,-16
ffffffffc0205b64:	e406                	sd	ra,8(sp)
ffffffffc0205b66:	e022                	sd	s0,0(sp)
ffffffffc0205b68:	100027f3          	csrr	a5,sstatus
ffffffffc0205b6c:	8b89                	andi	a5,a5,2
ffffffffc0205b6e:	4401                	li	s0,0
ffffffffc0205b70:	efbd                	bnez	a5,ffffffffc0205bee <schedule+0x8c>
ffffffffc0205b72:	00031897          	auipc	a7,0x31
ffffffffc0205b76:	7368b883          	ld	a7,1846(a7) # ffffffffc02372a8 <current>
ffffffffc0205b7a:	0008bc23          	sd	zero,24(a7)
ffffffffc0205b7e:	00031517          	auipc	a0,0x31
ffffffffc0205b82:	73a53503          	ld	a0,1850(a0) # ffffffffc02372b8 <idleproc>
ffffffffc0205b86:	04a88e63          	beq	a7,a0,ffffffffc0205be2 <schedule+0x80>
ffffffffc0205b8a:	0c888693          	addi	a3,a7,200
ffffffffc0205b8e:	00031617          	auipc	a2,0x31
ffffffffc0205b92:	68a60613          	addi	a2,a2,1674 # ffffffffc0237218 <proc_list>
ffffffffc0205b96:	87b6                	mv	a5,a3
ffffffffc0205b98:	4581                	li	a1,0
ffffffffc0205b9a:	4809                	li	a6,2
ffffffffc0205b9c:	679c                	ld	a5,8(a5)
ffffffffc0205b9e:	00c78863          	beq	a5,a2,ffffffffc0205bae <schedule+0x4c>
ffffffffc0205ba2:	f387a703          	lw	a4,-200(a5)
ffffffffc0205ba6:	f3878593          	addi	a1,a5,-200
ffffffffc0205baa:	03070163          	beq	a4,a6,ffffffffc0205bcc <schedule+0x6a>
ffffffffc0205bae:	fef697e3          	bne	a3,a5,ffffffffc0205b9c <schedule+0x3a>
ffffffffc0205bb2:	ed89                	bnez	a1,ffffffffc0205bcc <schedule+0x6a>
ffffffffc0205bb4:	451c                	lw	a5,8(a0)
ffffffffc0205bb6:	2785                	addiw	a5,a5,1
ffffffffc0205bb8:	c51c                	sw	a5,8(a0)
ffffffffc0205bba:	00a88463          	beq	a7,a0,ffffffffc0205bc2 <schedule+0x60>
ffffffffc0205bbe:	d4dfe0ef          	jal	ffffffffc020490a <proc_run>
ffffffffc0205bc2:	e819                	bnez	s0,ffffffffc0205bd8 <schedule+0x76>
ffffffffc0205bc4:	60a2                	ld	ra,8(sp)
ffffffffc0205bc6:	6402                	ld	s0,0(sp)
ffffffffc0205bc8:	0141                	addi	sp,sp,16
ffffffffc0205bca:	8082                	ret
ffffffffc0205bcc:	4198                	lw	a4,0(a1)
ffffffffc0205bce:	4789                	li	a5,2
ffffffffc0205bd0:	fef712e3          	bne	a4,a5,ffffffffc0205bb4 <schedule+0x52>
ffffffffc0205bd4:	852e                	mv	a0,a1
ffffffffc0205bd6:	bff9                	j	ffffffffc0205bb4 <schedule+0x52>
ffffffffc0205bd8:	6402                	ld	s0,0(sp)
ffffffffc0205bda:	60a2                	ld	ra,8(sp)
ffffffffc0205bdc:	0141                	addi	sp,sp,16
ffffffffc0205bde:	a5dfa06f          	j	ffffffffc020063a <intr_enable>
ffffffffc0205be2:	00031617          	auipc	a2,0x31
ffffffffc0205be6:	63660613          	addi	a2,a2,1590 # ffffffffc0237218 <proc_list>
ffffffffc0205bea:	86b2                	mv	a3,a2
ffffffffc0205bec:	b76d                	j	ffffffffc0205b96 <schedule+0x34>
ffffffffc0205bee:	a53fa0ef          	jal	ffffffffc0200640 <intr_disable>
ffffffffc0205bf2:	4405                	li	s0,1
ffffffffc0205bf4:	bfbd                	j	ffffffffc0205b72 <schedule+0x10>

ffffffffc0205bf6 <sys_getpid>:
ffffffffc0205bf6:	00031797          	auipc	a5,0x31
ffffffffc0205bfa:	6b27b783          	ld	a5,1714(a5) # ffffffffc02372a8 <current>
ffffffffc0205bfe:	43c8                	lw	a0,4(a5)
ffffffffc0205c00:	8082                	ret

ffffffffc0205c02 <sys_pgdir>:
ffffffffc0205c02:	4501                	li	a0,0
ffffffffc0205c04:	8082                	ret

ffffffffc0205c06 <sys_putc>:
ffffffffc0205c06:	4108                	lw	a0,0(a0)
ffffffffc0205c08:	1141                	addi	sp,sp,-16
ffffffffc0205c0a:	e406                	sd	ra,8(sp)
ffffffffc0205c0c:	da8fa0ef          	jal	ffffffffc02001b4 <cputchar>
ffffffffc0205c10:	60a2                	ld	ra,8(sp)
ffffffffc0205c12:	4501                	li	a0,0
ffffffffc0205c14:	0141                	addi	sp,sp,16
ffffffffc0205c16:	8082                	ret

ffffffffc0205c18 <sys_kill>:
ffffffffc0205c18:	4108                	lw	a0,0(a0)
ffffffffc0205c1a:	c13ff06f          	j	ffffffffc020582c <do_kill>

ffffffffc0205c1e <sys_yield>:
ffffffffc0205c1e:	bbfff06f          	j	ffffffffc02057dc <do_yield>

ffffffffc0205c22 <sys_exec>:
ffffffffc0205c22:	6d14                	ld	a3,24(a0)
ffffffffc0205c24:	6910                	ld	a2,16(a0)
ffffffffc0205c26:	650c                	ld	a1,8(a0)
ffffffffc0205c28:	6108                	ld	a0,0(a0)
ffffffffc0205c2a:	e2cff06f          	j	ffffffffc0205256 <do_execve>

ffffffffc0205c2e <sys_wait>:
ffffffffc0205c2e:	650c                	ld	a1,8(a0)
ffffffffc0205c30:	4108                	lw	a0,0(a0)
ffffffffc0205c32:	bbbff06f          	j	ffffffffc02057ec <do_wait>

ffffffffc0205c36 <sys_fork>:
ffffffffc0205c36:	00031797          	auipc	a5,0x31
ffffffffc0205c3a:	6727b783          	ld	a5,1650(a5) # ffffffffc02372a8 <current>
ffffffffc0205c3e:	73d0                	ld	a2,160(a5)
ffffffffc0205c40:	4501                	li	a0,0
ffffffffc0205c42:	6a0c                	ld	a1,16(a2)
ffffffffc0205c44:	d33fe06f          	j	ffffffffc0204976 <do_fork>

ffffffffc0205c48 <sys_exit>:
ffffffffc0205c48:	4108                	lw	a0,0(a0)
ffffffffc0205c4a:	9b8ff06f          	j	ffffffffc0204e02 <do_exit>

ffffffffc0205c4e <syscall>:
ffffffffc0205c4e:	715d                	addi	sp,sp,-80
ffffffffc0205c50:	fc26                	sd	s1,56(sp)
ffffffffc0205c52:	00031497          	auipc	s1,0x31
ffffffffc0205c56:	65648493          	addi	s1,s1,1622 # ffffffffc02372a8 <current>
ffffffffc0205c5a:	6098                	ld	a4,0(s1)
ffffffffc0205c5c:	e0a2                	sd	s0,64(sp)
ffffffffc0205c5e:	f84a                	sd	s2,48(sp)
ffffffffc0205c60:	7340                	ld	s0,160(a4)
ffffffffc0205c62:	e486                	sd	ra,72(sp)
ffffffffc0205c64:	47fd                	li	a5,31
ffffffffc0205c66:	05042903          	lw	s2,80(s0)
ffffffffc0205c6a:	0327ee63          	bltu	a5,s2,ffffffffc0205ca6 <syscall+0x58>
ffffffffc0205c6e:	00391713          	slli	a4,s2,0x3
ffffffffc0205c72:	00003797          	auipc	a5,0x3
ffffffffc0205c76:	8de78793          	addi	a5,a5,-1826 # ffffffffc0208550 <syscalls>
ffffffffc0205c7a:	97ba                	add	a5,a5,a4
ffffffffc0205c7c:	639c                	ld	a5,0(a5)
ffffffffc0205c7e:	c785                	beqz	a5,ffffffffc0205ca6 <syscall+0x58>
ffffffffc0205c80:	7028                	ld	a0,96(s0)
ffffffffc0205c82:	742c                	ld	a1,104(s0)
ffffffffc0205c84:	7834                	ld	a3,112(s0)
ffffffffc0205c86:	7c38                	ld	a4,120(s0)
ffffffffc0205c88:	6c30                	ld	a2,88(s0)
ffffffffc0205c8a:	e82a                	sd	a0,16(sp)
ffffffffc0205c8c:	ec2e                	sd	a1,24(sp)
ffffffffc0205c8e:	e432                	sd	a2,8(sp)
ffffffffc0205c90:	f036                	sd	a3,32(sp)
ffffffffc0205c92:	f43a                	sd	a4,40(sp)
ffffffffc0205c94:	0028                	addi	a0,sp,8
ffffffffc0205c96:	9782                	jalr	a5
ffffffffc0205c98:	60a6                	ld	ra,72(sp)
ffffffffc0205c9a:	e828                	sd	a0,80(s0)
ffffffffc0205c9c:	6406                	ld	s0,64(sp)
ffffffffc0205c9e:	74e2                	ld	s1,56(sp)
ffffffffc0205ca0:	7942                	ld	s2,48(sp)
ffffffffc0205ca2:	6161                	addi	sp,sp,80
ffffffffc0205ca4:	8082                	ret
ffffffffc0205ca6:	8522                	mv	a0,s0
ffffffffc0205ca8:	b89fa0ef          	jal	ffffffffc0200830 <print_trapframe>
ffffffffc0205cac:	609c                	ld	a5,0(s1)
ffffffffc0205cae:	86ca                	mv	a3,s2
ffffffffc0205cb0:	00002617          	auipc	a2,0x2
ffffffffc0205cb4:	67860613          	addi	a2,a2,1656 # ffffffffc0208328 <etext+0x219c>
ffffffffc0205cb8:	43d8                	lw	a4,4(a5)
ffffffffc0205cba:	06200593          	li	a1,98
ffffffffc0205cbe:	0b478793          	addi	a5,a5,180
ffffffffc0205cc2:	00002517          	auipc	a0,0x2
ffffffffc0205cc6:	69650513          	addi	a0,a0,1686 # ffffffffc0208358 <etext+0x21cc>
ffffffffc0205cca:	faafa0ef          	jal	ffffffffc0200474 <__panic>

ffffffffc0205cce <hash32>:
ffffffffc0205cce:	9e3707b7          	lui	a5,0x9e370
ffffffffc0205cd2:	2785                	addiw	a5,a5,1 # ffffffff9e370001 <_binary_obj___user_exit_out_size+0xffffffff9e36d6b1>
ffffffffc0205cd4:	02a787bb          	mulw	a5,a5,a0
ffffffffc0205cd8:	02000513          	li	a0,32
ffffffffc0205cdc:	9d0d                	subw	a0,a0,a1
ffffffffc0205cde:	00a7d53b          	srlw	a0,a5,a0
ffffffffc0205ce2:	8082                	ret

ffffffffc0205ce4 <printnum>:
ffffffffc0205ce4:	02069813          	slli	a6,a3,0x20
ffffffffc0205ce8:	7179                	addi	sp,sp,-48
ffffffffc0205cea:	02085813          	srli	a6,a6,0x20
ffffffffc0205cee:	e052                	sd	s4,0(sp)
ffffffffc0205cf0:	03067a33          	remu	s4,a2,a6
ffffffffc0205cf4:	f022                	sd	s0,32(sp)
ffffffffc0205cf6:	ec26                	sd	s1,24(sp)
ffffffffc0205cf8:	e84a                	sd	s2,16(sp)
ffffffffc0205cfa:	f406                	sd	ra,40(sp)
ffffffffc0205cfc:	84aa                	mv	s1,a0
ffffffffc0205cfe:	892e                	mv	s2,a1
ffffffffc0205d00:	fff7041b          	addiw	s0,a4,-1
ffffffffc0205d04:	2a01                	sext.w	s4,s4
ffffffffc0205d06:	05067063          	bgeu	a2,a6,ffffffffc0205d46 <printnum+0x62>
ffffffffc0205d0a:	e44e                	sd	s3,8(sp)
ffffffffc0205d0c:	89be                	mv	s3,a5
ffffffffc0205d0e:	4785                	li	a5,1
ffffffffc0205d10:	00e7d763          	bge	a5,a4,ffffffffc0205d1e <printnum+0x3a>
ffffffffc0205d14:	85ca                	mv	a1,s2
ffffffffc0205d16:	854e                	mv	a0,s3
ffffffffc0205d18:	347d                	addiw	s0,s0,-1
ffffffffc0205d1a:	9482                	jalr	s1
ffffffffc0205d1c:	fc65                	bnez	s0,ffffffffc0205d14 <printnum+0x30>
ffffffffc0205d1e:	69a2                	ld	s3,8(sp)
ffffffffc0205d20:	1a02                	slli	s4,s4,0x20
ffffffffc0205d22:	020a5a13          	srli	s4,s4,0x20
ffffffffc0205d26:	00002797          	auipc	a5,0x2
ffffffffc0205d2a:	64a78793          	addi	a5,a5,1610 # ffffffffc0208370 <etext+0x21e4>
ffffffffc0205d2e:	97d2                	add	a5,a5,s4
ffffffffc0205d30:	7402                	ld	s0,32(sp)
ffffffffc0205d32:	0007c503          	lbu	a0,0(a5)
ffffffffc0205d36:	70a2                	ld	ra,40(sp)
ffffffffc0205d38:	6a02                	ld	s4,0(sp)
ffffffffc0205d3a:	85ca                	mv	a1,s2
ffffffffc0205d3c:	87a6                	mv	a5,s1
ffffffffc0205d3e:	6942                	ld	s2,16(sp)
ffffffffc0205d40:	64e2                	ld	s1,24(sp)
ffffffffc0205d42:	6145                	addi	sp,sp,48
ffffffffc0205d44:	8782                	jr	a5
ffffffffc0205d46:	03065633          	divu	a2,a2,a6
ffffffffc0205d4a:	8722                	mv	a4,s0
ffffffffc0205d4c:	f99ff0ef          	jal	ffffffffc0205ce4 <printnum>
ffffffffc0205d50:	bfc1                	j	ffffffffc0205d20 <printnum+0x3c>

ffffffffc0205d52 <vprintfmt>:
ffffffffc0205d52:	7119                	addi	sp,sp,-128
ffffffffc0205d54:	f4a6                	sd	s1,104(sp)
ffffffffc0205d56:	f0ca                	sd	s2,96(sp)
ffffffffc0205d58:	ecce                	sd	s3,88(sp)
ffffffffc0205d5a:	e8d2                	sd	s4,80(sp)
ffffffffc0205d5c:	e4d6                	sd	s5,72(sp)
ffffffffc0205d5e:	e0da                	sd	s6,64(sp)
ffffffffc0205d60:	f862                	sd	s8,48(sp)
ffffffffc0205d62:	fc86                	sd	ra,120(sp)
ffffffffc0205d64:	f8a2                	sd	s0,112(sp)
ffffffffc0205d66:	fc5e                	sd	s7,56(sp)
ffffffffc0205d68:	f466                	sd	s9,40(sp)
ffffffffc0205d6a:	f06a                	sd	s10,32(sp)
ffffffffc0205d6c:	ec6e                	sd	s11,24(sp)
ffffffffc0205d6e:	892a                	mv	s2,a0
ffffffffc0205d70:	84ae                	mv	s1,a1
ffffffffc0205d72:	8c32                	mv	s8,a2
ffffffffc0205d74:	8a36                	mv	s4,a3
ffffffffc0205d76:	02500993          	li	s3,37
ffffffffc0205d7a:	05500b13          	li	s6,85
ffffffffc0205d7e:	00003a97          	auipc	s5,0x3
ffffffffc0205d82:	8d2a8a93          	addi	s5,s5,-1838 # ffffffffc0208650 <syscalls+0x100>
ffffffffc0205d86:	000c4503          	lbu	a0,0(s8)
ffffffffc0205d8a:	001c0413          	addi	s0,s8,1
ffffffffc0205d8e:	01350a63          	beq	a0,s3,ffffffffc0205da2 <vprintfmt+0x50>
ffffffffc0205d92:	cd0d                	beqz	a0,ffffffffc0205dcc <vprintfmt+0x7a>
ffffffffc0205d94:	85a6                	mv	a1,s1
ffffffffc0205d96:	9902                	jalr	s2
ffffffffc0205d98:	00044503          	lbu	a0,0(s0)
ffffffffc0205d9c:	0405                	addi	s0,s0,1
ffffffffc0205d9e:	ff351ae3          	bne	a0,s3,ffffffffc0205d92 <vprintfmt+0x40>
ffffffffc0205da2:	02000d93          	li	s11,32
ffffffffc0205da6:	4b81                	li	s7,0
ffffffffc0205da8:	4601                	li	a2,0
ffffffffc0205daa:	5d7d                	li	s10,-1
ffffffffc0205dac:	5cfd                	li	s9,-1
ffffffffc0205dae:	00044683          	lbu	a3,0(s0)
ffffffffc0205db2:	00140c13          	addi	s8,s0,1
ffffffffc0205db6:	fdd6859b          	addiw	a1,a3,-35
ffffffffc0205dba:	0ff5f593          	zext.b	a1,a1
ffffffffc0205dbe:	02bb6663          	bltu	s6,a1,ffffffffc0205dea <vprintfmt+0x98>
ffffffffc0205dc2:	058a                	slli	a1,a1,0x2
ffffffffc0205dc4:	95d6                	add	a1,a1,s5
ffffffffc0205dc6:	4198                	lw	a4,0(a1)
ffffffffc0205dc8:	9756                	add	a4,a4,s5
ffffffffc0205dca:	8702                	jr	a4
ffffffffc0205dcc:	70e6                	ld	ra,120(sp)
ffffffffc0205dce:	7446                	ld	s0,112(sp)
ffffffffc0205dd0:	74a6                	ld	s1,104(sp)
ffffffffc0205dd2:	7906                	ld	s2,96(sp)
ffffffffc0205dd4:	69e6                	ld	s3,88(sp)
ffffffffc0205dd6:	6a46                	ld	s4,80(sp)
ffffffffc0205dd8:	6aa6                	ld	s5,72(sp)
ffffffffc0205dda:	6b06                	ld	s6,64(sp)
ffffffffc0205ddc:	7be2                	ld	s7,56(sp)
ffffffffc0205dde:	7c42                	ld	s8,48(sp)
ffffffffc0205de0:	7ca2                	ld	s9,40(sp)
ffffffffc0205de2:	7d02                	ld	s10,32(sp)
ffffffffc0205de4:	6de2                	ld	s11,24(sp)
ffffffffc0205de6:	6109                	addi	sp,sp,128
ffffffffc0205de8:	8082                	ret
ffffffffc0205dea:	85a6                	mv	a1,s1
ffffffffc0205dec:	02500513          	li	a0,37
ffffffffc0205df0:	9902                	jalr	s2
ffffffffc0205df2:	fff44703          	lbu	a4,-1(s0)
ffffffffc0205df6:	02500793          	li	a5,37
ffffffffc0205dfa:	8c22                	mv	s8,s0
ffffffffc0205dfc:	f8f705e3          	beq	a4,a5,ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc0205e00:	02500713          	li	a4,37
ffffffffc0205e04:	ffec4783          	lbu	a5,-2(s8)
ffffffffc0205e08:	1c7d                	addi	s8,s8,-1
ffffffffc0205e0a:	fee79de3          	bne	a5,a4,ffffffffc0205e04 <vprintfmt+0xb2>
ffffffffc0205e0e:	bfa5                	j	ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc0205e10:	00144783          	lbu	a5,1(s0)
ffffffffc0205e14:	4725                	li	a4,9
ffffffffc0205e16:	fd068d1b          	addiw	s10,a3,-48
ffffffffc0205e1a:	fd07859b          	addiw	a1,a5,-48
ffffffffc0205e1e:	0007869b          	sext.w	a3,a5
ffffffffc0205e22:	8462                	mv	s0,s8
ffffffffc0205e24:	02b76563          	bltu	a4,a1,ffffffffc0205e4e <vprintfmt+0xfc>
ffffffffc0205e28:	4525                	li	a0,9
ffffffffc0205e2a:	00144783          	lbu	a5,1(s0)
ffffffffc0205e2e:	002d171b          	slliw	a4,s10,0x2
ffffffffc0205e32:	01a7073b          	addw	a4,a4,s10
ffffffffc0205e36:	0017171b          	slliw	a4,a4,0x1
ffffffffc0205e3a:	9f35                	addw	a4,a4,a3
ffffffffc0205e3c:	fd07859b          	addiw	a1,a5,-48
ffffffffc0205e40:	0405                	addi	s0,s0,1
ffffffffc0205e42:	fd070d1b          	addiw	s10,a4,-48
ffffffffc0205e46:	0007869b          	sext.w	a3,a5
ffffffffc0205e4a:	feb570e3          	bgeu	a0,a1,ffffffffc0205e2a <vprintfmt+0xd8>
ffffffffc0205e4e:	f60cd0e3          	bgez	s9,ffffffffc0205dae <vprintfmt+0x5c>
ffffffffc0205e52:	8cea                	mv	s9,s10
ffffffffc0205e54:	5d7d                	li	s10,-1
ffffffffc0205e56:	bfa1                	j	ffffffffc0205dae <vprintfmt+0x5c>
ffffffffc0205e58:	8db6                	mv	s11,a3
ffffffffc0205e5a:	8462                	mv	s0,s8
ffffffffc0205e5c:	bf89                	j	ffffffffc0205dae <vprintfmt+0x5c>
ffffffffc0205e5e:	8462                	mv	s0,s8
ffffffffc0205e60:	4b85                	li	s7,1
ffffffffc0205e62:	b7b1                	j	ffffffffc0205dae <vprintfmt+0x5c>
ffffffffc0205e64:	4785                	li	a5,1
ffffffffc0205e66:	008a0713          	addi	a4,s4,8
ffffffffc0205e6a:	00c7c463          	blt	a5,a2,ffffffffc0205e72 <vprintfmt+0x120>
ffffffffc0205e6e:	1a060163          	beqz	a2,ffffffffc0206010 <vprintfmt+0x2be>
ffffffffc0205e72:	000a3603          	ld	a2,0(s4)
ffffffffc0205e76:	46c1                	li	a3,16
ffffffffc0205e78:	8a3a                	mv	s4,a4
ffffffffc0205e7a:	000d879b          	sext.w	a5,s11
ffffffffc0205e7e:	8766                	mv	a4,s9
ffffffffc0205e80:	85a6                	mv	a1,s1
ffffffffc0205e82:	854a                	mv	a0,s2
ffffffffc0205e84:	e61ff0ef          	jal	ffffffffc0205ce4 <printnum>
ffffffffc0205e88:	bdfd                	j	ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc0205e8a:	000a2503          	lw	a0,0(s4)
ffffffffc0205e8e:	85a6                	mv	a1,s1
ffffffffc0205e90:	0a21                	addi	s4,s4,8
ffffffffc0205e92:	9902                	jalr	s2
ffffffffc0205e94:	bdcd                	j	ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc0205e96:	4785                	li	a5,1
ffffffffc0205e98:	008a0713          	addi	a4,s4,8
ffffffffc0205e9c:	00c7c463          	blt	a5,a2,ffffffffc0205ea4 <vprintfmt+0x152>
ffffffffc0205ea0:	16060363          	beqz	a2,ffffffffc0206006 <vprintfmt+0x2b4>
ffffffffc0205ea4:	000a3603          	ld	a2,0(s4)
ffffffffc0205ea8:	46a9                	li	a3,10
ffffffffc0205eaa:	8a3a                	mv	s4,a4
ffffffffc0205eac:	b7f9                	j	ffffffffc0205e7a <vprintfmt+0x128>
ffffffffc0205eae:	85a6                	mv	a1,s1
ffffffffc0205eb0:	03000513          	li	a0,48
ffffffffc0205eb4:	9902                	jalr	s2
ffffffffc0205eb6:	85a6                	mv	a1,s1
ffffffffc0205eb8:	07800513          	li	a0,120
ffffffffc0205ebc:	9902                	jalr	s2
ffffffffc0205ebe:	000a3603          	ld	a2,0(s4)
ffffffffc0205ec2:	46c1                	li	a3,16
ffffffffc0205ec4:	0a21                	addi	s4,s4,8
ffffffffc0205ec6:	bf55                	j	ffffffffc0205e7a <vprintfmt+0x128>
ffffffffc0205ec8:	85a6                	mv	a1,s1
ffffffffc0205eca:	02500513          	li	a0,37
ffffffffc0205ece:	9902                	jalr	s2
ffffffffc0205ed0:	bd5d                	j	ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc0205ed2:	000a2d03          	lw	s10,0(s4)
ffffffffc0205ed6:	8462                	mv	s0,s8
ffffffffc0205ed8:	0a21                	addi	s4,s4,8
ffffffffc0205eda:	bf95                	j	ffffffffc0205e4e <vprintfmt+0xfc>
ffffffffc0205edc:	4785                	li	a5,1
ffffffffc0205ede:	008a0713          	addi	a4,s4,8
ffffffffc0205ee2:	00c7c463          	blt	a5,a2,ffffffffc0205eea <vprintfmt+0x198>
ffffffffc0205ee6:	10060b63          	beqz	a2,ffffffffc0205ffc <vprintfmt+0x2aa>
ffffffffc0205eea:	000a3603          	ld	a2,0(s4)
ffffffffc0205eee:	46a1                	li	a3,8
ffffffffc0205ef0:	8a3a                	mv	s4,a4
ffffffffc0205ef2:	b761                	j	ffffffffc0205e7a <vprintfmt+0x128>
ffffffffc0205ef4:	fffcc793          	not	a5,s9
ffffffffc0205ef8:	97fd                	srai	a5,a5,0x3f
ffffffffc0205efa:	00fcf7b3          	and	a5,s9,a5
ffffffffc0205efe:	00078c9b          	sext.w	s9,a5
ffffffffc0205f02:	8462                	mv	s0,s8
ffffffffc0205f04:	b56d                	j	ffffffffc0205dae <vprintfmt+0x5c>
ffffffffc0205f06:	000a3403          	ld	s0,0(s4)
ffffffffc0205f0a:	008a0793          	addi	a5,s4,8
ffffffffc0205f0e:	e43e                	sd	a5,8(sp)
ffffffffc0205f10:	12040063          	beqz	s0,ffffffffc0206030 <vprintfmt+0x2de>
ffffffffc0205f14:	0d905963          	blez	s9,ffffffffc0205fe6 <vprintfmt+0x294>
ffffffffc0205f18:	02d00793          	li	a5,45
ffffffffc0205f1c:	00140a13          	addi	s4,s0,1
ffffffffc0205f20:	12fd9763          	bne	s11,a5,ffffffffc020604e <vprintfmt+0x2fc>
ffffffffc0205f24:	00044783          	lbu	a5,0(s0)
ffffffffc0205f28:	0007851b          	sext.w	a0,a5
ffffffffc0205f2c:	cb9d                	beqz	a5,ffffffffc0205f62 <vprintfmt+0x210>
ffffffffc0205f2e:	547d                	li	s0,-1
ffffffffc0205f30:	05e00d93          	li	s11,94
ffffffffc0205f34:	000d4563          	bltz	s10,ffffffffc0205f3e <vprintfmt+0x1ec>
ffffffffc0205f38:	3d7d                	addiw	s10,s10,-1
ffffffffc0205f3a:	028d0263          	beq	s10,s0,ffffffffc0205f5e <vprintfmt+0x20c>
ffffffffc0205f3e:	85a6                	mv	a1,s1
ffffffffc0205f40:	0c0b8d63          	beqz	s7,ffffffffc020601a <vprintfmt+0x2c8>
ffffffffc0205f44:	3781                	addiw	a5,a5,-32
ffffffffc0205f46:	0cfdfa63          	bgeu	s11,a5,ffffffffc020601a <vprintfmt+0x2c8>
ffffffffc0205f4a:	03f00513          	li	a0,63
ffffffffc0205f4e:	9902                	jalr	s2
ffffffffc0205f50:	000a4783          	lbu	a5,0(s4)
ffffffffc0205f54:	3cfd                	addiw	s9,s9,-1
ffffffffc0205f56:	0a05                	addi	s4,s4,1
ffffffffc0205f58:	0007851b          	sext.w	a0,a5
ffffffffc0205f5c:	ffe1                	bnez	a5,ffffffffc0205f34 <vprintfmt+0x1e2>
ffffffffc0205f5e:	01905963          	blez	s9,ffffffffc0205f70 <vprintfmt+0x21e>
ffffffffc0205f62:	85a6                	mv	a1,s1
ffffffffc0205f64:	02000513          	li	a0,32
ffffffffc0205f68:	3cfd                	addiw	s9,s9,-1
ffffffffc0205f6a:	9902                	jalr	s2
ffffffffc0205f6c:	fe0c9be3          	bnez	s9,ffffffffc0205f62 <vprintfmt+0x210>
ffffffffc0205f70:	6a22                	ld	s4,8(sp)
ffffffffc0205f72:	bd11                	j	ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc0205f74:	4785                	li	a5,1
ffffffffc0205f76:	008a0b93          	addi	s7,s4,8
ffffffffc0205f7a:	00c7c363          	blt	a5,a2,ffffffffc0205f80 <vprintfmt+0x22e>
ffffffffc0205f7e:	ce25                	beqz	a2,ffffffffc0205ff6 <vprintfmt+0x2a4>
ffffffffc0205f80:	000a3403          	ld	s0,0(s4)
ffffffffc0205f84:	08044d63          	bltz	s0,ffffffffc020601e <vprintfmt+0x2cc>
ffffffffc0205f88:	8622                	mv	a2,s0
ffffffffc0205f8a:	8a5e                	mv	s4,s7
ffffffffc0205f8c:	46a9                	li	a3,10
ffffffffc0205f8e:	b5f5                	j	ffffffffc0205e7a <vprintfmt+0x128>
ffffffffc0205f90:	000a2783          	lw	a5,0(s4)
ffffffffc0205f94:	4661                	li	a2,24
ffffffffc0205f96:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc0205f9a:	8fb9                	xor	a5,a5,a4
ffffffffc0205f9c:	40e786bb          	subw	a3,a5,a4
ffffffffc0205fa0:	02d64663          	blt	a2,a3,ffffffffc0205fcc <vprintfmt+0x27a>
ffffffffc0205fa4:	00369713          	slli	a4,a3,0x3
ffffffffc0205fa8:	00003797          	auipc	a5,0x3
ffffffffc0205fac:	80078793          	addi	a5,a5,-2048 # ffffffffc02087a8 <error_string>
ffffffffc0205fb0:	97ba                	add	a5,a5,a4
ffffffffc0205fb2:	639c                	ld	a5,0(a5)
ffffffffc0205fb4:	cf81                	beqz	a5,ffffffffc0205fcc <vprintfmt+0x27a>
ffffffffc0205fb6:	86be                	mv	a3,a5
ffffffffc0205fb8:	00000617          	auipc	a2,0x0
ffffffffc0205fbc:	20060613          	addi	a2,a2,512 # ffffffffc02061b8 <etext+0x2c>
ffffffffc0205fc0:	85a6                	mv	a1,s1
ffffffffc0205fc2:	854a                	mv	a0,s2
ffffffffc0205fc4:	0e8000ef          	jal	ffffffffc02060ac <printfmt>
ffffffffc0205fc8:	0a21                	addi	s4,s4,8
ffffffffc0205fca:	bb75                	j	ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc0205fcc:	00002617          	auipc	a2,0x2
ffffffffc0205fd0:	3c460613          	addi	a2,a2,964 # ffffffffc0208390 <etext+0x2204>
ffffffffc0205fd4:	85a6                	mv	a1,s1
ffffffffc0205fd6:	854a                	mv	a0,s2
ffffffffc0205fd8:	0d4000ef          	jal	ffffffffc02060ac <printfmt>
ffffffffc0205fdc:	0a21                	addi	s4,s4,8
ffffffffc0205fde:	b365                	j	ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc0205fe0:	2605                	addiw	a2,a2,1
ffffffffc0205fe2:	8462                	mv	s0,s8
ffffffffc0205fe4:	b3e9                	j	ffffffffc0205dae <vprintfmt+0x5c>
ffffffffc0205fe6:	00044783          	lbu	a5,0(s0)
ffffffffc0205fea:	0007851b          	sext.w	a0,a5
ffffffffc0205fee:	d3c9                	beqz	a5,ffffffffc0205f70 <vprintfmt+0x21e>
ffffffffc0205ff0:	00140a13          	addi	s4,s0,1
ffffffffc0205ff4:	bf2d                	j	ffffffffc0205f2e <vprintfmt+0x1dc>
ffffffffc0205ff6:	000a2403          	lw	s0,0(s4)
ffffffffc0205ffa:	b769                	j	ffffffffc0205f84 <vprintfmt+0x232>
ffffffffc0205ffc:	000a6603          	lwu	a2,0(s4)
ffffffffc0206000:	46a1                	li	a3,8
ffffffffc0206002:	8a3a                	mv	s4,a4
ffffffffc0206004:	bd9d                	j	ffffffffc0205e7a <vprintfmt+0x128>
ffffffffc0206006:	000a6603          	lwu	a2,0(s4)
ffffffffc020600a:	46a9                	li	a3,10
ffffffffc020600c:	8a3a                	mv	s4,a4
ffffffffc020600e:	b5b5                	j	ffffffffc0205e7a <vprintfmt+0x128>
ffffffffc0206010:	000a6603          	lwu	a2,0(s4)
ffffffffc0206014:	46c1                	li	a3,16
ffffffffc0206016:	8a3a                	mv	s4,a4
ffffffffc0206018:	b58d                	j	ffffffffc0205e7a <vprintfmt+0x128>
ffffffffc020601a:	9902                	jalr	s2
ffffffffc020601c:	bf15                	j	ffffffffc0205f50 <vprintfmt+0x1fe>
ffffffffc020601e:	85a6                	mv	a1,s1
ffffffffc0206020:	02d00513          	li	a0,45
ffffffffc0206024:	9902                	jalr	s2
ffffffffc0206026:	40800633          	neg	a2,s0
ffffffffc020602a:	8a5e                	mv	s4,s7
ffffffffc020602c:	46a9                	li	a3,10
ffffffffc020602e:	b5b1                	j	ffffffffc0205e7a <vprintfmt+0x128>
ffffffffc0206030:	01905663          	blez	s9,ffffffffc020603c <vprintfmt+0x2ea>
ffffffffc0206034:	02d00793          	li	a5,45
ffffffffc0206038:	04fd9263          	bne	s11,a5,ffffffffc020607c <vprintfmt+0x32a>
ffffffffc020603c:	02800793          	li	a5,40
ffffffffc0206040:	00002a17          	auipc	s4,0x2
ffffffffc0206044:	349a0a13          	addi	s4,s4,841 # ffffffffc0208389 <etext+0x21fd>
ffffffffc0206048:	02800513          	li	a0,40
ffffffffc020604c:	b5cd                	j	ffffffffc0205f2e <vprintfmt+0x1dc>
ffffffffc020604e:	85ea                	mv	a1,s10
ffffffffc0206050:	8522                	mv	a0,s0
ffffffffc0206052:	094000ef          	jal	ffffffffc02060e6 <strnlen>
ffffffffc0206056:	40ac8cbb          	subw	s9,s9,a0
ffffffffc020605a:	01905963          	blez	s9,ffffffffc020606c <vprintfmt+0x31a>
ffffffffc020605e:	2d81                	sext.w	s11,s11
ffffffffc0206060:	85a6                	mv	a1,s1
ffffffffc0206062:	856e                	mv	a0,s11
ffffffffc0206064:	3cfd                	addiw	s9,s9,-1
ffffffffc0206066:	9902                	jalr	s2
ffffffffc0206068:	fe0c9ce3          	bnez	s9,ffffffffc0206060 <vprintfmt+0x30e>
ffffffffc020606c:	00044783          	lbu	a5,0(s0)
ffffffffc0206070:	0007851b          	sext.w	a0,a5
ffffffffc0206074:	ea079de3          	bnez	a5,ffffffffc0205f2e <vprintfmt+0x1dc>
ffffffffc0206078:	6a22                	ld	s4,8(sp)
ffffffffc020607a:	b331                	j	ffffffffc0205d86 <vprintfmt+0x34>
ffffffffc020607c:	85ea                	mv	a1,s10
ffffffffc020607e:	00002517          	auipc	a0,0x2
ffffffffc0206082:	30a50513          	addi	a0,a0,778 # ffffffffc0208388 <etext+0x21fc>
ffffffffc0206086:	060000ef          	jal	ffffffffc02060e6 <strnlen>
ffffffffc020608a:	40ac8cbb          	subw	s9,s9,a0
ffffffffc020608e:	00002417          	auipc	s0,0x2
ffffffffc0206092:	2fa40413          	addi	s0,s0,762 # ffffffffc0208388 <etext+0x21fc>
ffffffffc0206096:	00002a17          	auipc	s4,0x2
ffffffffc020609a:	2f3a0a13          	addi	s4,s4,755 # ffffffffc0208389 <etext+0x21fd>
ffffffffc020609e:	02800793          	li	a5,40
ffffffffc02060a2:	02800513          	li	a0,40
ffffffffc02060a6:	fb904ce3          	bgtz	s9,ffffffffc020605e <vprintfmt+0x30c>
ffffffffc02060aa:	b551                	j	ffffffffc0205f2e <vprintfmt+0x1dc>

ffffffffc02060ac <printfmt>:
ffffffffc02060ac:	715d                	addi	sp,sp,-80
ffffffffc02060ae:	02810313          	addi	t1,sp,40
ffffffffc02060b2:	f436                	sd	a3,40(sp)
ffffffffc02060b4:	869a                	mv	a3,t1
ffffffffc02060b6:	ec06                	sd	ra,24(sp)
ffffffffc02060b8:	f83a                	sd	a4,48(sp)
ffffffffc02060ba:	fc3e                	sd	a5,56(sp)
ffffffffc02060bc:	e0c2                	sd	a6,64(sp)
ffffffffc02060be:	e4c6                	sd	a7,72(sp)
ffffffffc02060c0:	e41a                	sd	t1,8(sp)
ffffffffc02060c2:	c91ff0ef          	jal	ffffffffc0205d52 <vprintfmt>
ffffffffc02060c6:	60e2                	ld	ra,24(sp)
ffffffffc02060c8:	6161                	addi	sp,sp,80
ffffffffc02060ca:	8082                	ret

ffffffffc02060cc <strlen>:
ffffffffc02060cc:	00054783          	lbu	a5,0(a0)
ffffffffc02060d0:	872a                	mv	a4,a0
ffffffffc02060d2:	4501                	li	a0,0
ffffffffc02060d4:	cb81                	beqz	a5,ffffffffc02060e4 <strlen+0x18>
ffffffffc02060d6:	0505                	addi	a0,a0,1
ffffffffc02060d8:	00a707b3          	add	a5,a4,a0
ffffffffc02060dc:	0007c783          	lbu	a5,0(a5)
ffffffffc02060e0:	fbfd                	bnez	a5,ffffffffc02060d6 <strlen+0xa>
ffffffffc02060e2:	8082                	ret
ffffffffc02060e4:	8082                	ret

ffffffffc02060e6 <strnlen>:
ffffffffc02060e6:	4781                	li	a5,0
ffffffffc02060e8:	e589                	bnez	a1,ffffffffc02060f2 <strnlen+0xc>
ffffffffc02060ea:	a811                	j	ffffffffc02060fe <strnlen+0x18>
ffffffffc02060ec:	0785                	addi	a5,a5,1
ffffffffc02060ee:	00f58863          	beq	a1,a5,ffffffffc02060fe <strnlen+0x18>
ffffffffc02060f2:	00f50733          	add	a4,a0,a5
ffffffffc02060f6:	00074703          	lbu	a4,0(a4)
ffffffffc02060fa:	fb6d                	bnez	a4,ffffffffc02060ec <strnlen+0x6>
ffffffffc02060fc:	85be                	mv	a1,a5
ffffffffc02060fe:	852e                	mv	a0,a1
ffffffffc0206100:	8082                	ret

ffffffffc0206102 <strcpy>:
ffffffffc0206102:	87aa                	mv	a5,a0
ffffffffc0206104:	0005c703          	lbu	a4,0(a1)
ffffffffc0206108:	0785                	addi	a5,a5,1
ffffffffc020610a:	0585                	addi	a1,a1,1
ffffffffc020610c:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0206110:	fb75                	bnez	a4,ffffffffc0206104 <strcpy+0x2>
ffffffffc0206112:	8082                	ret

ffffffffc0206114 <strcmp>:
ffffffffc0206114:	00054783          	lbu	a5,0(a0)
ffffffffc0206118:	e791                	bnez	a5,ffffffffc0206124 <strcmp+0x10>
ffffffffc020611a:	a02d                	j	ffffffffc0206144 <strcmp+0x30>
ffffffffc020611c:	00054783          	lbu	a5,0(a0)
ffffffffc0206120:	cf89                	beqz	a5,ffffffffc020613a <strcmp+0x26>
ffffffffc0206122:	85b6                	mv	a1,a3
ffffffffc0206124:	0005c703          	lbu	a4,0(a1)
ffffffffc0206128:	0505                	addi	a0,a0,1
ffffffffc020612a:	00158693          	addi	a3,a1,1
ffffffffc020612e:	fef707e3          	beq	a4,a5,ffffffffc020611c <strcmp+0x8>
ffffffffc0206132:	0007851b          	sext.w	a0,a5
ffffffffc0206136:	9d19                	subw	a0,a0,a4
ffffffffc0206138:	8082                	ret
ffffffffc020613a:	0015c703          	lbu	a4,1(a1)
ffffffffc020613e:	4501                	li	a0,0
ffffffffc0206140:	9d19                	subw	a0,a0,a4
ffffffffc0206142:	8082                	ret
ffffffffc0206144:	0005c703          	lbu	a4,0(a1)
ffffffffc0206148:	4501                	li	a0,0
ffffffffc020614a:	b7f5                	j	ffffffffc0206136 <strcmp+0x22>

ffffffffc020614c <strchr>:
ffffffffc020614c:	00054783          	lbu	a5,0(a0)
ffffffffc0206150:	c799                	beqz	a5,ffffffffc020615e <strchr+0x12>
ffffffffc0206152:	00f58763          	beq	a1,a5,ffffffffc0206160 <strchr+0x14>
ffffffffc0206156:	00154783          	lbu	a5,1(a0)
ffffffffc020615a:	0505                	addi	a0,a0,1
ffffffffc020615c:	fbfd                	bnez	a5,ffffffffc0206152 <strchr+0x6>
ffffffffc020615e:	4501                	li	a0,0
ffffffffc0206160:	8082                	ret

ffffffffc0206162 <memset>:
ffffffffc0206162:	ca01                	beqz	a2,ffffffffc0206172 <memset+0x10>
ffffffffc0206164:	962a                	add	a2,a2,a0
ffffffffc0206166:	87aa                	mv	a5,a0
ffffffffc0206168:	0785                	addi	a5,a5,1
ffffffffc020616a:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020616e:	fef61de3          	bne	a2,a5,ffffffffc0206168 <memset+0x6>
ffffffffc0206172:	8082                	ret

ffffffffc0206174 <memcpy>:
ffffffffc0206174:	ca19                	beqz	a2,ffffffffc020618a <memcpy+0x16>
ffffffffc0206176:	962e                	add	a2,a2,a1
ffffffffc0206178:	87aa                	mv	a5,a0
ffffffffc020617a:	0005c703          	lbu	a4,0(a1)
ffffffffc020617e:	0585                	addi	a1,a1,1
ffffffffc0206180:	0785                	addi	a5,a5,1
ffffffffc0206182:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0206186:	feb61ae3          	bne	a2,a1,ffffffffc020617a <memcpy+0x6>
ffffffffc020618a:	8082                	ret
