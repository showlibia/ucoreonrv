
bin/kernel：     文件格式 elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c020e2b7          	lui	t0,0xc020e
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	01e31313          	slli	t1,t1,0x1e
ffffffffc020000c:	406282b3          	sub	t0,t0,t1
ffffffffc0200010:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200014:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200018:	03f31313          	slli	t1,t1,0x3f
ffffffffc020001c:	0062e2b3          	or	t0,t0,t1
ffffffffc0200020:	18029073          	csrw	satp,t0
ffffffffc0200024:	12000073          	sfence.vma
ffffffffc0200028:	c020e137          	lui	sp,0xc020e
ffffffffc020002c:	c02002b7          	lui	t0,0xc0200
ffffffffc0200030:	03628293          	addi	t0,t0,54 # ffffffffc0200036 <kern_init>
ffffffffc0200034:	8282                	jr	t0

ffffffffc0200036 <kern_init>:
ffffffffc0200036:	00032517          	auipc	a0,0x32
ffffffffc020003a:	9e250513          	addi	a0,a0,-1566 # ffffffffc0231a18 <edata>
ffffffffc020003e:	0003d617          	auipc	a2,0x3d
ffffffffc0200042:	fa260613          	addi	a2,a2,-94 # ffffffffc023cfe0 <end>
ffffffffc0200046:	1141                	addi	sp,sp,-16
ffffffffc0200048:	8e09                	sub	a2,a2,a0
ffffffffc020004a:	4581                	li	a1,0
ffffffffc020004c:	e406                	sd	ra,8(sp)
ffffffffc020004e:	017080ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc0200052:	580000ef          	jal	ra,ffffffffc02005d2 <cons_init>
ffffffffc0200056:	00009597          	auipc	a1,0x9
ffffffffc020005a:	c4258593          	addi	a1,a1,-958 # ffffffffc0208c98 <etext+0x6>
ffffffffc020005e:	00009517          	auipc	a0,0x9
ffffffffc0200062:	c5a50513          	addi	a0,a0,-934 # ffffffffc0208cb8 <etext+0x26>
ffffffffc0200066:	06e000ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020006a:	25c000ef          	jal	ra,ffffffffc02002c6 <print_kerninfo>
ffffffffc020006e:	1f9030ef          	jal	ra,ffffffffc0203a66 <pmm_init>
ffffffffc0200072:	5d2000ef          	jal	ra,ffffffffc0200644 <pic_init>
ffffffffc0200076:	5dc000ef          	jal	ra,ffffffffc0200652 <idt_init>
ffffffffc020007a:	0a4010ef          	jal	ra,ffffffffc020111e <vmm_init>
ffffffffc020007e:	2cd050ef          	jal	ra,ffffffffc0205b4a <sched_init>
ffffffffc0200082:	0f7050ef          	jal	ra,ffffffffc0205978 <proc_init>
ffffffffc0200086:	4ac000ef          	jal	ra,ffffffffc0200532 <ide_init>
ffffffffc020008a:	76b010ef          	jal	ra,ffffffffc0201ff4 <swap_init>
ffffffffc020008e:	4fc000ef          	jal	ra,ffffffffc020058a <clock_init>
ffffffffc0200092:	5b4000ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0200096:	22f050ef          	jal	ra,ffffffffc0205ac4 <cpu_idle>

ffffffffc020009a <cputch>:
ffffffffc020009a:	1141                	addi	sp,sp,-16
ffffffffc020009c:	e022                	sd	s0,0(sp)
ffffffffc020009e:	e406                	sd	ra,8(sp)
ffffffffc02000a0:	842e                	mv	s0,a1
ffffffffc02000a2:	532000ef          	jal	ra,ffffffffc02005d4 <cons_putc>
ffffffffc02000a6:	401c                	lw	a5,0(s0)
ffffffffc02000a8:	60a2                	ld	ra,8(sp)
ffffffffc02000aa:	2785                	addiw	a5,a5,1
ffffffffc02000ac:	c01c                	sw	a5,0(s0)
ffffffffc02000ae:	6402                	ld	s0,0(sp)
ffffffffc02000b0:	0141                	addi	sp,sp,16
ffffffffc02000b2:	8082                	ret

ffffffffc02000b4 <vcprintf>:
ffffffffc02000b4:	1101                	addi	sp,sp,-32
ffffffffc02000b6:	86ae                	mv	a3,a1
ffffffffc02000b8:	862a                	mv	a2,a0
ffffffffc02000ba:	006c                	addi	a1,sp,12
ffffffffc02000bc:	00000517          	auipc	a0,0x0
ffffffffc02000c0:	fde50513          	addi	a0,a0,-34 # ffffffffc020009a <cputch>
ffffffffc02000c4:	ec06                	sd	ra,24(sp)
ffffffffc02000c6:	c602                	sw	zero,12(sp)
ffffffffc02000c8:	033080ef          	jal	ra,ffffffffc02088fa <vprintfmt>
ffffffffc02000cc:	60e2                	ld	ra,24(sp)
ffffffffc02000ce:	4532                	lw	a0,12(sp)
ffffffffc02000d0:	6105                	addi	sp,sp,32
ffffffffc02000d2:	8082                	ret

ffffffffc02000d4 <cprintf>:
ffffffffc02000d4:	711d                	addi	sp,sp,-96
ffffffffc02000d6:	02810313          	addi	t1,sp,40 # ffffffffc020e028 <boot_page_table_sv39+0x28>
ffffffffc02000da:	f42e                	sd	a1,40(sp)
ffffffffc02000dc:	f832                	sd	a2,48(sp)
ffffffffc02000de:	fc36                	sd	a3,56(sp)
ffffffffc02000e0:	862a                	mv	a2,a0
ffffffffc02000e2:	004c                	addi	a1,sp,4
ffffffffc02000e4:	00000517          	auipc	a0,0x0
ffffffffc02000e8:	fb650513          	addi	a0,a0,-74 # ffffffffc020009a <cputch>
ffffffffc02000ec:	869a                	mv	a3,t1
ffffffffc02000ee:	ec06                	sd	ra,24(sp)
ffffffffc02000f0:	e0ba                	sd	a4,64(sp)
ffffffffc02000f2:	e4be                	sd	a5,72(sp)
ffffffffc02000f4:	e8c2                	sd	a6,80(sp)
ffffffffc02000f6:	ecc6                	sd	a7,88(sp)
ffffffffc02000f8:	e41a                	sd	t1,8(sp)
ffffffffc02000fa:	c202                	sw	zero,4(sp)
ffffffffc02000fc:	7fe080ef          	jal	ra,ffffffffc02088fa <vprintfmt>
ffffffffc0200100:	60e2                	ld	ra,24(sp)
ffffffffc0200102:	4512                	lw	a0,4(sp)
ffffffffc0200104:	6125                	addi	sp,sp,96
ffffffffc0200106:	8082                	ret

ffffffffc0200108 <cputchar>:
ffffffffc0200108:	a1f1                	j	ffffffffc02005d4 <cons_putc>

ffffffffc020010a <cputs>:
ffffffffc020010a:	1101                	addi	sp,sp,-32
ffffffffc020010c:	e822                	sd	s0,16(sp)
ffffffffc020010e:	ec06                	sd	ra,24(sp)
ffffffffc0200110:	e426                	sd	s1,8(sp)
ffffffffc0200112:	842a                	mv	s0,a0
ffffffffc0200114:	00054503          	lbu	a0,0(a0)
ffffffffc0200118:	c51d                	beqz	a0,ffffffffc0200146 <cputs+0x3c>
ffffffffc020011a:	0405                	addi	s0,s0,1
ffffffffc020011c:	4485                	li	s1,1
ffffffffc020011e:	9c81                	subw	s1,s1,s0
ffffffffc0200120:	4b4000ef          	jal	ra,ffffffffc02005d4 <cons_putc>
ffffffffc0200124:	008487bb          	addw	a5,s1,s0
ffffffffc0200128:	0405                	addi	s0,s0,1
ffffffffc020012a:	fff44503          	lbu	a0,-1(s0)
ffffffffc020012e:	f96d                	bnez	a0,ffffffffc0200120 <cputs+0x16>
ffffffffc0200130:	0017841b          	addiw	s0,a5,1
ffffffffc0200134:	4529                	li	a0,10
ffffffffc0200136:	49e000ef          	jal	ra,ffffffffc02005d4 <cons_putc>
ffffffffc020013a:	8522                	mv	a0,s0
ffffffffc020013c:	60e2                	ld	ra,24(sp)
ffffffffc020013e:	6442                	ld	s0,16(sp)
ffffffffc0200140:	64a2                	ld	s1,8(sp)
ffffffffc0200142:	6105                	addi	sp,sp,32
ffffffffc0200144:	8082                	ret
ffffffffc0200146:	4405                	li	s0,1
ffffffffc0200148:	b7f5                	j	ffffffffc0200134 <cputs+0x2a>

ffffffffc020014a <getchar>:
ffffffffc020014a:	1141                	addi	sp,sp,-16
ffffffffc020014c:	e406                	sd	ra,8(sp)
ffffffffc020014e:	4ba000ef          	jal	ra,ffffffffc0200608 <cons_getc>
ffffffffc0200152:	dd75                	beqz	a0,ffffffffc020014e <getchar+0x4>
ffffffffc0200154:	60a2                	ld	ra,8(sp)
ffffffffc0200156:	0141                	addi	sp,sp,16
ffffffffc0200158:	8082                	ret

ffffffffc020015a <readline>:
ffffffffc020015a:	715d                	addi	sp,sp,-80
ffffffffc020015c:	e486                	sd	ra,72(sp)
ffffffffc020015e:	e0a2                	sd	s0,64(sp)
ffffffffc0200160:	fc26                	sd	s1,56(sp)
ffffffffc0200162:	f84a                	sd	s2,48(sp)
ffffffffc0200164:	f44e                	sd	s3,40(sp)
ffffffffc0200166:	f052                	sd	s4,32(sp)
ffffffffc0200168:	ec56                	sd	s5,24(sp)
ffffffffc020016a:	e85a                	sd	s6,16(sp)
ffffffffc020016c:	e45e                	sd	s7,8(sp)
ffffffffc020016e:	c901                	beqz	a0,ffffffffc020017e <readline+0x24>
ffffffffc0200170:	85aa                	mv	a1,a0
ffffffffc0200172:	00009517          	auipc	a0,0x9
ffffffffc0200176:	b4e50513          	addi	a0,a0,-1202 # ffffffffc0208cc0 <etext+0x2e>
ffffffffc020017a:	f5bff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020017e:	4481                	li	s1,0
ffffffffc0200180:	497d                	li	s2,31
ffffffffc0200182:	49a1                	li	s3,8
ffffffffc0200184:	4aa9                	li	s5,10
ffffffffc0200186:	4b35                	li	s6,13
ffffffffc0200188:	00032b97          	auipc	s7,0x32
ffffffffc020018c:	890b8b93          	addi	s7,s7,-1904 # ffffffffc0231a18 <edata>
ffffffffc0200190:	3fe00a13          	li	s4,1022
ffffffffc0200194:	fb7ff0ef          	jal	ra,ffffffffc020014a <getchar>
ffffffffc0200198:	842a                	mv	s0,a0
ffffffffc020019a:	00054b63          	bltz	a0,ffffffffc02001b0 <readline+0x56>
ffffffffc020019e:	00a95b63          	bge	s2,a0,ffffffffc02001b4 <readline+0x5a>
ffffffffc02001a2:	029a5463          	bge	s4,s1,ffffffffc02001ca <readline+0x70>
ffffffffc02001a6:	fa5ff0ef          	jal	ra,ffffffffc020014a <getchar>
ffffffffc02001aa:	842a                	mv	s0,a0
ffffffffc02001ac:	fe0559e3          	bgez	a0,ffffffffc020019e <readline+0x44>
ffffffffc02001b0:	4501                	li	a0,0
ffffffffc02001b2:	a099                	j	ffffffffc02001f8 <readline+0x9e>
ffffffffc02001b4:	03341463          	bne	s0,s3,ffffffffc02001dc <readline+0x82>
ffffffffc02001b8:	e8b9                	bnez	s1,ffffffffc020020e <readline+0xb4>
ffffffffc02001ba:	f91ff0ef          	jal	ra,ffffffffc020014a <getchar>
ffffffffc02001be:	842a                	mv	s0,a0
ffffffffc02001c0:	fe0548e3          	bltz	a0,ffffffffc02001b0 <readline+0x56>
ffffffffc02001c4:	fea958e3          	bge	s2,a0,ffffffffc02001b4 <readline+0x5a>
ffffffffc02001c8:	4481                	li	s1,0
ffffffffc02001ca:	8522                	mv	a0,s0
ffffffffc02001cc:	f3dff0ef          	jal	ra,ffffffffc0200108 <cputchar>
ffffffffc02001d0:	009b87b3          	add	a5,s7,s1
ffffffffc02001d4:	00878023          	sb	s0,0(a5)
ffffffffc02001d8:	2485                	addiw	s1,s1,1
ffffffffc02001da:	bf6d                	j	ffffffffc0200194 <readline+0x3a>
ffffffffc02001dc:	01540463          	beq	s0,s5,ffffffffc02001e4 <readline+0x8a>
ffffffffc02001e0:	fb641ae3          	bne	s0,s6,ffffffffc0200194 <readline+0x3a>
ffffffffc02001e4:	8522                	mv	a0,s0
ffffffffc02001e6:	f23ff0ef          	jal	ra,ffffffffc0200108 <cputchar>
ffffffffc02001ea:	00032517          	auipc	a0,0x32
ffffffffc02001ee:	82e50513          	addi	a0,a0,-2002 # ffffffffc0231a18 <edata>
ffffffffc02001f2:	94aa                	add	s1,s1,a0
ffffffffc02001f4:	00048023          	sb	zero,0(s1)
ffffffffc02001f8:	60a6                	ld	ra,72(sp)
ffffffffc02001fa:	6406                	ld	s0,64(sp)
ffffffffc02001fc:	74e2                	ld	s1,56(sp)
ffffffffc02001fe:	7942                	ld	s2,48(sp)
ffffffffc0200200:	79a2                	ld	s3,40(sp)
ffffffffc0200202:	7a02                	ld	s4,32(sp)
ffffffffc0200204:	6ae2                	ld	s5,24(sp)
ffffffffc0200206:	6b42                	ld	s6,16(sp)
ffffffffc0200208:	6ba2                	ld	s7,8(sp)
ffffffffc020020a:	6161                	addi	sp,sp,80
ffffffffc020020c:	8082                	ret
ffffffffc020020e:	4521                	li	a0,8
ffffffffc0200210:	ef9ff0ef          	jal	ra,ffffffffc0200108 <cputchar>
ffffffffc0200214:	34fd                	addiw	s1,s1,-1
ffffffffc0200216:	bfbd                	j	ffffffffc0200194 <readline+0x3a>

ffffffffc0200218 <__panic>:
ffffffffc0200218:	0003d317          	auipc	t1,0x3d
ffffffffc020021c:	c3030313          	addi	t1,t1,-976 # ffffffffc023ce48 <is_panic>
ffffffffc0200220:	00033303          	ld	t1,0(t1)
ffffffffc0200224:	715d                	addi	sp,sp,-80
ffffffffc0200226:	ec06                	sd	ra,24(sp)
ffffffffc0200228:	e822                	sd	s0,16(sp)
ffffffffc020022a:	f436                	sd	a3,40(sp)
ffffffffc020022c:	f83a                	sd	a4,48(sp)
ffffffffc020022e:	fc3e                	sd	a5,56(sp)
ffffffffc0200230:	e0c2                	sd	a6,64(sp)
ffffffffc0200232:	e4c6                	sd	a7,72(sp)
ffffffffc0200234:	02031c63          	bnez	t1,ffffffffc020026c <__panic+0x54>
ffffffffc0200238:	4785                	li	a5,1
ffffffffc020023a:	8432                	mv	s0,a2
ffffffffc020023c:	0003d717          	auipc	a4,0x3d
ffffffffc0200240:	c0f73623          	sd	a5,-1012(a4) # ffffffffc023ce48 <is_panic>
ffffffffc0200244:	862e                	mv	a2,a1
ffffffffc0200246:	103c                	addi	a5,sp,40
ffffffffc0200248:	85aa                	mv	a1,a0
ffffffffc020024a:	00009517          	auipc	a0,0x9
ffffffffc020024e:	a7e50513          	addi	a0,a0,-1410 # ffffffffc0208cc8 <etext+0x36>
ffffffffc0200252:	e43e                	sd	a5,8(sp)
ffffffffc0200254:	e81ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200258:	65a2                	ld	a1,8(sp)
ffffffffc020025a:	8522                	mv	a0,s0
ffffffffc020025c:	e59ff0ef          	jal	ra,ffffffffc02000b4 <vcprintf>
ffffffffc0200260:	0000a517          	auipc	a0,0xa
ffffffffc0200264:	59850513          	addi	a0,a0,1432 # ffffffffc020a7f8 <default_pmm_manager+0x3f8>
ffffffffc0200268:	e6dff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020026c:	4501                	li	a0,0
ffffffffc020026e:	4581                	li	a1,0
ffffffffc0200270:	4601                	li	a2,0
ffffffffc0200272:	48a1                	li	a7,8
ffffffffc0200274:	00000073          	ecall
ffffffffc0200278:	3d4000ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc020027c:	4501                	li	a0,0
ffffffffc020027e:	172000ef          	jal	ra,ffffffffc02003f0 <kmonitor>
ffffffffc0200282:	bfed                	j	ffffffffc020027c <__panic+0x64>

ffffffffc0200284 <__warn>:
ffffffffc0200284:	715d                	addi	sp,sp,-80
ffffffffc0200286:	e822                	sd	s0,16(sp)
ffffffffc0200288:	fc3e                	sd	a5,56(sp)
ffffffffc020028a:	8432                	mv	s0,a2
ffffffffc020028c:	103c                	addi	a5,sp,40
ffffffffc020028e:	862e                	mv	a2,a1
ffffffffc0200290:	85aa                	mv	a1,a0
ffffffffc0200292:	00009517          	auipc	a0,0x9
ffffffffc0200296:	a5650513          	addi	a0,a0,-1450 # ffffffffc0208ce8 <etext+0x56>
ffffffffc020029a:	ec06                	sd	ra,24(sp)
ffffffffc020029c:	f436                	sd	a3,40(sp)
ffffffffc020029e:	f83a                	sd	a4,48(sp)
ffffffffc02002a0:	e0c2                	sd	a6,64(sp)
ffffffffc02002a2:	e4c6                	sd	a7,72(sp)
ffffffffc02002a4:	e43e                	sd	a5,8(sp)
ffffffffc02002a6:	e2fff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02002aa:	65a2                	ld	a1,8(sp)
ffffffffc02002ac:	8522                	mv	a0,s0
ffffffffc02002ae:	e07ff0ef          	jal	ra,ffffffffc02000b4 <vcprintf>
ffffffffc02002b2:	0000a517          	auipc	a0,0xa
ffffffffc02002b6:	54650513          	addi	a0,a0,1350 # ffffffffc020a7f8 <default_pmm_manager+0x3f8>
ffffffffc02002ba:	e1bff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02002be:	60e2                	ld	ra,24(sp)
ffffffffc02002c0:	6442                	ld	s0,16(sp)
ffffffffc02002c2:	6161                	addi	sp,sp,80
ffffffffc02002c4:	8082                	ret

ffffffffc02002c6 <print_kerninfo>:
ffffffffc02002c6:	1141                	addi	sp,sp,-16
ffffffffc02002c8:	00009517          	auipc	a0,0x9
ffffffffc02002cc:	a7050513          	addi	a0,a0,-1424 # ffffffffc0208d38 <etext+0xa6>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	e03ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02002d6:	00000597          	auipc	a1,0x0
ffffffffc02002da:	d6058593          	addi	a1,a1,-672 # ffffffffc0200036 <kern_init>
ffffffffc02002de:	00009517          	auipc	a0,0x9
ffffffffc02002e2:	a7a50513          	addi	a0,a0,-1414 # ffffffffc0208d58 <etext+0xc6>
ffffffffc02002e6:	defff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02002ea:	00009597          	auipc	a1,0x9
ffffffffc02002ee:	9a858593          	addi	a1,a1,-1624 # ffffffffc0208c92 <etext>
ffffffffc02002f2:	00009517          	auipc	a0,0x9
ffffffffc02002f6:	a8650513          	addi	a0,a0,-1402 # ffffffffc0208d78 <etext+0xe6>
ffffffffc02002fa:	ddbff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02002fe:	00031597          	auipc	a1,0x31
ffffffffc0200302:	71a58593          	addi	a1,a1,1818 # ffffffffc0231a18 <edata>
ffffffffc0200306:	00009517          	auipc	a0,0x9
ffffffffc020030a:	a9250513          	addi	a0,a0,-1390 # ffffffffc0208d98 <etext+0x106>
ffffffffc020030e:	dc7ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200312:	0003d597          	auipc	a1,0x3d
ffffffffc0200316:	cce58593          	addi	a1,a1,-818 # ffffffffc023cfe0 <end>
ffffffffc020031a:	00009517          	auipc	a0,0x9
ffffffffc020031e:	a9e50513          	addi	a0,a0,-1378 # ffffffffc0208db8 <etext+0x126>
ffffffffc0200322:	db3ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200326:	0003d597          	auipc	a1,0x3d
ffffffffc020032a:	0b958593          	addi	a1,a1,185 # ffffffffc023d3df <end+0x3ff>
ffffffffc020032e:	00000797          	auipc	a5,0x0
ffffffffc0200332:	d0878793          	addi	a5,a5,-760 # ffffffffc0200036 <kern_init>
ffffffffc0200336:	40f587b3          	sub	a5,a1,a5
ffffffffc020033a:	43f7d593          	srai	a1,a5,0x3f
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200344:	95be                	add	a1,a1,a5
ffffffffc0200346:	85a9                	srai	a1,a1,0xa
ffffffffc0200348:	00009517          	auipc	a0,0x9
ffffffffc020034c:	a9050513          	addi	a0,a0,-1392 # ffffffffc0208dd8 <etext+0x146>
ffffffffc0200350:	0141                	addi	sp,sp,16
ffffffffc0200352:	b349                	j	ffffffffc02000d4 <cprintf>

ffffffffc0200354 <print_stackframe>:
ffffffffc0200354:	1141                	addi	sp,sp,-16
ffffffffc0200356:	00009617          	auipc	a2,0x9
ffffffffc020035a:	9b260613          	addi	a2,a2,-1614 # ffffffffc0208d08 <etext+0x76>
ffffffffc020035e:	05b00593          	li	a1,91
ffffffffc0200362:	00009517          	auipc	a0,0x9
ffffffffc0200366:	9be50513          	addi	a0,a0,-1602 # ffffffffc0208d20 <etext+0x8e>
ffffffffc020036a:	e406                	sd	ra,8(sp)
ffffffffc020036c:	eadff0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0200370 <mon_help>:
ffffffffc0200370:	1141                	addi	sp,sp,-16
ffffffffc0200372:	00009617          	auipc	a2,0x9
ffffffffc0200376:	b7660613          	addi	a2,a2,-1162 # ffffffffc0208ee8 <commands+0xe0>
ffffffffc020037a:	00009597          	auipc	a1,0x9
ffffffffc020037e:	b8e58593          	addi	a1,a1,-1138 # ffffffffc0208f08 <commands+0x100>
ffffffffc0200382:	00009517          	auipc	a0,0x9
ffffffffc0200386:	b8e50513          	addi	a0,a0,-1138 # ffffffffc0208f10 <commands+0x108>
ffffffffc020038a:	e406                	sd	ra,8(sp)
ffffffffc020038c:	d49ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200390:	00009617          	auipc	a2,0x9
ffffffffc0200394:	b9060613          	addi	a2,a2,-1136 # ffffffffc0208f20 <commands+0x118>
ffffffffc0200398:	00009597          	auipc	a1,0x9
ffffffffc020039c:	bb058593          	addi	a1,a1,-1104 # ffffffffc0208f48 <commands+0x140>
ffffffffc02003a0:	00009517          	auipc	a0,0x9
ffffffffc02003a4:	b7050513          	addi	a0,a0,-1168 # ffffffffc0208f10 <commands+0x108>
ffffffffc02003a8:	d2dff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02003ac:	00009617          	auipc	a2,0x9
ffffffffc02003b0:	bac60613          	addi	a2,a2,-1108 # ffffffffc0208f58 <commands+0x150>
ffffffffc02003b4:	00009597          	auipc	a1,0x9
ffffffffc02003b8:	bc458593          	addi	a1,a1,-1084 # ffffffffc0208f78 <commands+0x170>
ffffffffc02003bc:	00009517          	auipc	a0,0x9
ffffffffc02003c0:	b5450513          	addi	a0,a0,-1196 # ffffffffc0208f10 <commands+0x108>
ffffffffc02003c4:	d11ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02003c8:	60a2                	ld	ra,8(sp)
ffffffffc02003ca:	4501                	li	a0,0
ffffffffc02003cc:	0141                	addi	sp,sp,16
ffffffffc02003ce:	8082                	ret

ffffffffc02003d0 <mon_kerninfo>:
ffffffffc02003d0:	1141                	addi	sp,sp,-16
ffffffffc02003d2:	e406                	sd	ra,8(sp)
ffffffffc02003d4:	ef3ff0ef          	jal	ra,ffffffffc02002c6 <print_kerninfo>
ffffffffc02003d8:	60a2                	ld	ra,8(sp)
ffffffffc02003da:	4501                	li	a0,0
ffffffffc02003dc:	0141                	addi	sp,sp,16
ffffffffc02003de:	8082                	ret

ffffffffc02003e0 <mon_backtrace>:
ffffffffc02003e0:	1141                	addi	sp,sp,-16
ffffffffc02003e2:	e406                	sd	ra,8(sp)
ffffffffc02003e4:	f71ff0ef          	jal	ra,ffffffffc0200354 <print_stackframe>
ffffffffc02003e8:	60a2                	ld	ra,8(sp)
ffffffffc02003ea:	4501                	li	a0,0
ffffffffc02003ec:	0141                	addi	sp,sp,16
ffffffffc02003ee:	8082                	ret

ffffffffc02003f0 <kmonitor>:
ffffffffc02003f0:	7115                	addi	sp,sp,-224
ffffffffc02003f2:	e962                	sd	s8,144(sp)
ffffffffc02003f4:	8c2a                	mv	s8,a0
ffffffffc02003f6:	00009517          	auipc	a0,0x9
ffffffffc02003fa:	a5a50513          	addi	a0,a0,-1446 # ffffffffc0208e50 <commands+0x48>
ffffffffc02003fe:	ed86                	sd	ra,216(sp)
ffffffffc0200400:	e9a2                	sd	s0,208(sp)
ffffffffc0200402:	e5a6                	sd	s1,200(sp)
ffffffffc0200404:	e1ca                	sd	s2,192(sp)
ffffffffc0200406:	fd4e                	sd	s3,184(sp)
ffffffffc0200408:	f952                	sd	s4,176(sp)
ffffffffc020040a:	f556                	sd	s5,168(sp)
ffffffffc020040c:	f15a                	sd	s6,160(sp)
ffffffffc020040e:	ed5e                	sd	s7,152(sp)
ffffffffc0200410:	e566                	sd	s9,136(sp)
ffffffffc0200412:	e16a                	sd	s10,128(sp)
ffffffffc0200414:	cc1ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200418:	00009517          	auipc	a0,0x9
ffffffffc020041c:	a6050513          	addi	a0,a0,-1440 # ffffffffc0208e78 <commands+0x70>
ffffffffc0200420:	cb5ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200424:	000c0563          	beqz	s8,ffffffffc020042e <kmonitor+0x3e>
ffffffffc0200428:	8562                	mv	a0,s8
ffffffffc020042a:	410000ef          	jal	ra,ffffffffc020083a <print_trapframe>
ffffffffc020042e:	00009c97          	auipc	s9,0x9
ffffffffc0200432:	9dac8c93          	addi	s9,s9,-1574 # ffffffffc0208e08 <commands>
ffffffffc0200436:	00009997          	auipc	s3,0x9
ffffffffc020043a:	a6a98993          	addi	s3,s3,-1430 # ffffffffc0208ea0 <commands+0x98>
ffffffffc020043e:	00009917          	auipc	s2,0x9
ffffffffc0200442:	a6a90913          	addi	s2,s2,-1430 # ffffffffc0208ea8 <commands+0xa0>
ffffffffc0200446:	4a3d                	li	s4,15
ffffffffc0200448:	00009b17          	auipc	s6,0x9
ffffffffc020044c:	a68b0b13          	addi	s6,s6,-1432 # ffffffffc0208eb0 <commands+0xa8>
ffffffffc0200450:	00009a97          	auipc	s5,0x9
ffffffffc0200454:	ab8a8a93          	addi	s5,s5,-1352 # ffffffffc0208f08 <commands+0x100>
ffffffffc0200458:	4b8d                	li	s7,3
ffffffffc020045a:	854e                	mv	a0,s3
ffffffffc020045c:	cffff0ef          	jal	ra,ffffffffc020015a <readline>
ffffffffc0200460:	842a                	mv	s0,a0
ffffffffc0200462:	dd65                	beqz	a0,ffffffffc020045a <kmonitor+0x6a>
ffffffffc0200464:	00054583          	lbu	a1,0(a0)
ffffffffc0200468:	4481                	li	s1,0
ffffffffc020046a:	c999                	beqz	a1,ffffffffc0200480 <kmonitor+0x90>
ffffffffc020046c:	854a                	mv	a0,s2
ffffffffc020046e:	3d8080ef          	jal	ra,ffffffffc0208846 <strchr>
ffffffffc0200472:	c925                	beqz	a0,ffffffffc02004e2 <kmonitor+0xf2>
ffffffffc0200474:	00144583          	lbu	a1,1(s0)
ffffffffc0200478:	00040023          	sb	zero,0(s0)
ffffffffc020047c:	0405                	addi	s0,s0,1
ffffffffc020047e:	f5fd                	bnez	a1,ffffffffc020046c <kmonitor+0x7c>
ffffffffc0200480:	dce9                	beqz	s1,ffffffffc020045a <kmonitor+0x6a>
ffffffffc0200482:	6582                	ld	a1,0(sp)
ffffffffc0200484:	00009d17          	auipc	s10,0x9
ffffffffc0200488:	984d0d13          	addi	s10,s10,-1660 # ffffffffc0208e08 <commands>
ffffffffc020048c:	8556                	mv	a0,s5
ffffffffc020048e:	4401                	li	s0,0
ffffffffc0200490:	0d61                	addi	s10,s10,24
ffffffffc0200492:	38a080ef          	jal	ra,ffffffffc020881c <strcmp>
ffffffffc0200496:	c919                	beqz	a0,ffffffffc02004ac <kmonitor+0xbc>
ffffffffc0200498:	2405                	addiw	s0,s0,1
ffffffffc020049a:	09740463          	beq	s0,s7,ffffffffc0200522 <kmonitor+0x132>
ffffffffc020049e:	000d3503          	ld	a0,0(s10)
ffffffffc02004a2:	6582                	ld	a1,0(sp)
ffffffffc02004a4:	0d61                	addi	s10,s10,24
ffffffffc02004a6:	376080ef          	jal	ra,ffffffffc020881c <strcmp>
ffffffffc02004aa:	f57d                	bnez	a0,ffffffffc0200498 <kmonitor+0xa8>
ffffffffc02004ac:	00141793          	slli	a5,s0,0x1
ffffffffc02004b0:	97a2                	add	a5,a5,s0
ffffffffc02004b2:	078e                	slli	a5,a5,0x3
ffffffffc02004b4:	97e6                	add	a5,a5,s9
ffffffffc02004b6:	6b9c                	ld	a5,16(a5)
ffffffffc02004b8:	8662                	mv	a2,s8
ffffffffc02004ba:	002c                	addi	a1,sp,8
ffffffffc02004bc:	fff4851b          	addiw	a0,s1,-1
ffffffffc02004c0:	9782                	jalr	a5
ffffffffc02004c2:	f8055ce3          	bgez	a0,ffffffffc020045a <kmonitor+0x6a>
ffffffffc02004c6:	60ee                	ld	ra,216(sp)
ffffffffc02004c8:	644e                	ld	s0,208(sp)
ffffffffc02004ca:	64ae                	ld	s1,200(sp)
ffffffffc02004cc:	690e                	ld	s2,192(sp)
ffffffffc02004ce:	79ea                	ld	s3,184(sp)
ffffffffc02004d0:	7a4a                	ld	s4,176(sp)
ffffffffc02004d2:	7aaa                	ld	s5,168(sp)
ffffffffc02004d4:	7b0a                	ld	s6,160(sp)
ffffffffc02004d6:	6bea                	ld	s7,152(sp)
ffffffffc02004d8:	6c4a                	ld	s8,144(sp)
ffffffffc02004da:	6caa                	ld	s9,136(sp)
ffffffffc02004dc:	6d0a                	ld	s10,128(sp)
ffffffffc02004de:	612d                	addi	sp,sp,224
ffffffffc02004e0:	8082                	ret
ffffffffc02004e2:	00044783          	lbu	a5,0(s0)
ffffffffc02004e6:	dfc9                	beqz	a5,ffffffffc0200480 <kmonitor+0x90>
ffffffffc02004e8:	03448863          	beq	s1,s4,ffffffffc0200518 <kmonitor+0x128>
ffffffffc02004ec:	00349793          	slli	a5,s1,0x3
ffffffffc02004f0:	0118                	addi	a4,sp,128
ffffffffc02004f2:	97ba                	add	a5,a5,a4
ffffffffc02004f4:	f887b023          	sd	s0,-128(a5)
ffffffffc02004f8:	00044583          	lbu	a1,0(s0)
ffffffffc02004fc:	2485                	addiw	s1,s1,1
ffffffffc02004fe:	e591                	bnez	a1,ffffffffc020050a <kmonitor+0x11a>
ffffffffc0200500:	b749                	j	ffffffffc0200482 <kmonitor+0x92>
ffffffffc0200502:	0405                	addi	s0,s0,1
ffffffffc0200504:	00044583          	lbu	a1,0(s0)
ffffffffc0200508:	ddad                	beqz	a1,ffffffffc0200482 <kmonitor+0x92>
ffffffffc020050a:	854a                	mv	a0,s2
ffffffffc020050c:	33a080ef          	jal	ra,ffffffffc0208846 <strchr>
ffffffffc0200510:	d96d                	beqz	a0,ffffffffc0200502 <kmonitor+0x112>
ffffffffc0200512:	00044583          	lbu	a1,0(s0)
ffffffffc0200516:	bf91                	j	ffffffffc020046a <kmonitor+0x7a>
ffffffffc0200518:	45c1                	li	a1,16
ffffffffc020051a:	855a                	mv	a0,s6
ffffffffc020051c:	bb9ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200520:	b7f1                	j	ffffffffc02004ec <kmonitor+0xfc>
ffffffffc0200522:	6582                	ld	a1,0(sp)
ffffffffc0200524:	00009517          	auipc	a0,0x9
ffffffffc0200528:	9ac50513          	addi	a0,a0,-1620 # ffffffffc0208ed0 <commands+0xc8>
ffffffffc020052c:	ba9ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200530:	b72d                	j	ffffffffc020045a <kmonitor+0x6a>

ffffffffc0200532 <ide_init>:
ffffffffc0200532:	8082                	ret

ffffffffc0200534 <ide_device_valid>:
ffffffffc0200534:	00253513          	sltiu	a0,a0,2
ffffffffc0200538:	8082                	ret

ffffffffc020053a <ide_device_size>:
ffffffffc020053a:	03800513          	li	a0,56
ffffffffc020053e:	8082                	ret

ffffffffc0200540 <ide_read_secs>:
ffffffffc0200540:	00032797          	auipc	a5,0x32
ffffffffc0200544:	8d878793          	addi	a5,a5,-1832 # ffffffffc0231e18 <ide>
ffffffffc0200548:	0095959b          	slliw	a1,a1,0x9
ffffffffc020054c:	1141                	addi	sp,sp,-16
ffffffffc020054e:	8532                	mv	a0,a2
ffffffffc0200550:	95be                	add	a1,a1,a5
ffffffffc0200552:	00969613          	slli	a2,a3,0x9
ffffffffc0200556:	e406                	sd	ra,8(sp)
ffffffffc0200558:	31e080ef          	jal	ra,ffffffffc0208876 <memcpy>
ffffffffc020055c:	60a2                	ld	ra,8(sp)
ffffffffc020055e:	4501                	li	a0,0
ffffffffc0200560:	0141                	addi	sp,sp,16
ffffffffc0200562:	8082                	ret

ffffffffc0200564 <ide_write_secs>:
ffffffffc0200564:	8732                	mv	a4,a2
ffffffffc0200566:	0095979b          	slliw	a5,a1,0x9
ffffffffc020056a:	00032517          	auipc	a0,0x32
ffffffffc020056e:	8ae50513          	addi	a0,a0,-1874 # ffffffffc0231e18 <ide>
ffffffffc0200572:	1141                	addi	sp,sp,-16
ffffffffc0200574:	00969613          	slli	a2,a3,0x9
ffffffffc0200578:	85ba                	mv	a1,a4
ffffffffc020057a:	953e                	add	a0,a0,a5
ffffffffc020057c:	e406                	sd	ra,8(sp)
ffffffffc020057e:	2f8080ef          	jal	ra,ffffffffc0208876 <memcpy>
ffffffffc0200582:	60a2                	ld	ra,8(sp)
ffffffffc0200584:	4501                	li	a0,0
ffffffffc0200586:	0141                	addi	sp,sp,16
ffffffffc0200588:	8082                	ret

ffffffffc020058a <clock_init>:
ffffffffc020058a:	02000793          	li	a5,32
ffffffffc020058e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200592:	c0102573          	rdtime	a0
ffffffffc0200596:	67e1                	lui	a5,0x18
ffffffffc0200598:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0x15d68>
ffffffffc020059c:	953e                	add	a0,a0,a5
ffffffffc020059e:	4581                	li	a1,0
ffffffffc02005a0:	4601                	li	a2,0
ffffffffc02005a2:	4881                	li	a7,0
ffffffffc02005a4:	00000073          	ecall
ffffffffc02005a8:	00009517          	auipc	a0,0x9
ffffffffc02005ac:	9e050513          	addi	a0,a0,-1568 # ffffffffc0208f88 <commands+0x180>
ffffffffc02005b0:	0003d797          	auipc	a5,0x3d
ffffffffc02005b4:	9007b023          	sd	zero,-1792(a5) # ffffffffc023ceb0 <ticks>
ffffffffc02005b8:	be31                	j	ffffffffc02000d4 <cprintf>

ffffffffc02005ba <clock_set_next_event>:
ffffffffc02005ba:	c0102573          	rdtime	a0
ffffffffc02005be:	67e1                	lui	a5,0x18
ffffffffc02005c0:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0x15d68>
ffffffffc02005c4:	953e                	add	a0,a0,a5
ffffffffc02005c6:	4581                	li	a1,0
ffffffffc02005c8:	4601                	li	a2,0
ffffffffc02005ca:	4881                	li	a7,0
ffffffffc02005cc:	00000073          	ecall
ffffffffc02005d0:	8082                	ret

ffffffffc02005d2 <cons_init>:
ffffffffc02005d2:	8082                	ret

ffffffffc02005d4 <cons_putc>:
ffffffffc02005d4:	100027f3          	csrr	a5,sstatus
ffffffffc02005d8:	8b89                	andi	a5,a5,2
ffffffffc02005da:	0ff57513          	andi	a0,a0,255
ffffffffc02005de:	e799                	bnez	a5,ffffffffc02005ec <cons_putc+0x18>
ffffffffc02005e0:	4581                	li	a1,0
ffffffffc02005e2:	4601                	li	a2,0
ffffffffc02005e4:	4885                	li	a7,1
ffffffffc02005e6:	00000073          	ecall
ffffffffc02005ea:	8082                	ret
ffffffffc02005ec:	1101                	addi	sp,sp,-32
ffffffffc02005ee:	ec06                	sd	ra,24(sp)
ffffffffc02005f0:	e42a                	sd	a0,8(sp)
ffffffffc02005f2:	05a000ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc02005f6:	6522                	ld	a0,8(sp)
ffffffffc02005f8:	4581                	li	a1,0
ffffffffc02005fa:	4601                	li	a2,0
ffffffffc02005fc:	4885                	li	a7,1
ffffffffc02005fe:	00000073          	ecall
ffffffffc0200602:	60e2                	ld	ra,24(sp)
ffffffffc0200604:	6105                	addi	sp,sp,32
ffffffffc0200606:	a081                	j	ffffffffc0200646 <intr_enable>

ffffffffc0200608 <cons_getc>:
ffffffffc0200608:	100027f3          	csrr	a5,sstatus
ffffffffc020060c:	8b89                	andi	a5,a5,2
ffffffffc020060e:	eb89                	bnez	a5,ffffffffc0200620 <cons_getc+0x18>
ffffffffc0200610:	4501                	li	a0,0
ffffffffc0200612:	4581                	li	a1,0
ffffffffc0200614:	4601                	li	a2,0
ffffffffc0200616:	4889                	li	a7,2
ffffffffc0200618:	00000073          	ecall
ffffffffc020061c:	2501                	sext.w	a0,a0
ffffffffc020061e:	8082                	ret
ffffffffc0200620:	1101                	addi	sp,sp,-32
ffffffffc0200622:	ec06                	sd	ra,24(sp)
ffffffffc0200624:	028000ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0200628:	4501                	li	a0,0
ffffffffc020062a:	4581                	li	a1,0
ffffffffc020062c:	4601                	li	a2,0
ffffffffc020062e:	4889                	li	a7,2
ffffffffc0200630:	00000073          	ecall
ffffffffc0200634:	2501                	sext.w	a0,a0
ffffffffc0200636:	e42a                	sd	a0,8(sp)
ffffffffc0200638:	00e000ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc020063c:	60e2                	ld	ra,24(sp)
ffffffffc020063e:	6522                	ld	a0,8(sp)
ffffffffc0200640:	6105                	addi	sp,sp,32
ffffffffc0200642:	8082                	ret

ffffffffc0200644 <pic_init>:
ffffffffc0200644:	8082                	ret

ffffffffc0200646 <intr_enable>:
ffffffffc0200646:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc020064a:	8082                	ret

ffffffffc020064c <intr_disable>:
ffffffffc020064c:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200650:	8082                	ret

ffffffffc0200652 <idt_init>:
ffffffffc0200652:	14005073          	csrwi	sscratch,0
ffffffffc0200656:	00000797          	auipc	a5,0x0
ffffffffc020065a:	63a78793          	addi	a5,a5,1594 # ffffffffc0200c90 <__alltraps>
ffffffffc020065e:	10579073          	csrw	stvec,a5
ffffffffc0200662:	000407b7          	lui	a5,0x40
ffffffffc0200666:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc020066a:	8082                	ret

ffffffffc020066c <print_regs>:
ffffffffc020066c:	610c                	ld	a1,0(a0)
ffffffffc020066e:	1141                	addi	sp,sp,-16
ffffffffc0200670:	e022                	sd	s0,0(sp)
ffffffffc0200672:	842a                	mv	s0,a0
ffffffffc0200674:	00009517          	auipc	a0,0x9
ffffffffc0200678:	c5c50513          	addi	a0,a0,-932 # ffffffffc02092d0 <commands+0x4c8>
ffffffffc020067c:	e406                	sd	ra,8(sp)
ffffffffc020067e:	a57ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200682:	640c                	ld	a1,8(s0)
ffffffffc0200684:	00009517          	auipc	a0,0x9
ffffffffc0200688:	c6450513          	addi	a0,a0,-924 # ffffffffc02092e8 <commands+0x4e0>
ffffffffc020068c:	a49ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200690:	680c                	ld	a1,16(s0)
ffffffffc0200692:	00009517          	auipc	a0,0x9
ffffffffc0200696:	c6e50513          	addi	a0,a0,-914 # ffffffffc0209300 <commands+0x4f8>
ffffffffc020069a:	a3bff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020069e:	6c0c                	ld	a1,24(s0)
ffffffffc02006a0:	00009517          	auipc	a0,0x9
ffffffffc02006a4:	c7850513          	addi	a0,a0,-904 # ffffffffc0209318 <commands+0x510>
ffffffffc02006a8:	a2dff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02006ac:	700c                	ld	a1,32(s0)
ffffffffc02006ae:	00009517          	auipc	a0,0x9
ffffffffc02006b2:	c8250513          	addi	a0,a0,-894 # ffffffffc0209330 <commands+0x528>
ffffffffc02006b6:	a1fff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02006ba:	740c                	ld	a1,40(s0)
ffffffffc02006bc:	00009517          	auipc	a0,0x9
ffffffffc02006c0:	c8c50513          	addi	a0,a0,-884 # ffffffffc0209348 <commands+0x540>
ffffffffc02006c4:	a11ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02006c8:	780c                	ld	a1,48(s0)
ffffffffc02006ca:	00009517          	auipc	a0,0x9
ffffffffc02006ce:	c9650513          	addi	a0,a0,-874 # ffffffffc0209360 <commands+0x558>
ffffffffc02006d2:	a03ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02006d6:	7c0c                	ld	a1,56(s0)
ffffffffc02006d8:	00009517          	auipc	a0,0x9
ffffffffc02006dc:	ca050513          	addi	a0,a0,-864 # ffffffffc0209378 <commands+0x570>
ffffffffc02006e0:	9f5ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02006e4:	602c                	ld	a1,64(s0)
ffffffffc02006e6:	00009517          	auipc	a0,0x9
ffffffffc02006ea:	caa50513          	addi	a0,a0,-854 # ffffffffc0209390 <commands+0x588>
ffffffffc02006ee:	9e7ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02006f2:	642c                	ld	a1,72(s0)
ffffffffc02006f4:	00009517          	auipc	a0,0x9
ffffffffc02006f8:	cb450513          	addi	a0,a0,-844 # ffffffffc02093a8 <commands+0x5a0>
ffffffffc02006fc:	9d9ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200700:	682c                	ld	a1,80(s0)
ffffffffc0200702:	00009517          	auipc	a0,0x9
ffffffffc0200706:	cbe50513          	addi	a0,a0,-834 # ffffffffc02093c0 <commands+0x5b8>
ffffffffc020070a:	9cbff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020070e:	6c2c                	ld	a1,88(s0)
ffffffffc0200710:	00009517          	auipc	a0,0x9
ffffffffc0200714:	cc850513          	addi	a0,a0,-824 # ffffffffc02093d8 <commands+0x5d0>
ffffffffc0200718:	9bdff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020071c:	702c                	ld	a1,96(s0)
ffffffffc020071e:	00009517          	auipc	a0,0x9
ffffffffc0200722:	cd250513          	addi	a0,a0,-814 # ffffffffc02093f0 <commands+0x5e8>
ffffffffc0200726:	9afff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020072a:	742c                	ld	a1,104(s0)
ffffffffc020072c:	00009517          	auipc	a0,0x9
ffffffffc0200730:	cdc50513          	addi	a0,a0,-804 # ffffffffc0209408 <commands+0x600>
ffffffffc0200734:	9a1ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200738:	782c                	ld	a1,112(s0)
ffffffffc020073a:	00009517          	auipc	a0,0x9
ffffffffc020073e:	ce650513          	addi	a0,a0,-794 # ffffffffc0209420 <commands+0x618>
ffffffffc0200742:	993ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200746:	7c2c                	ld	a1,120(s0)
ffffffffc0200748:	00009517          	auipc	a0,0x9
ffffffffc020074c:	cf050513          	addi	a0,a0,-784 # ffffffffc0209438 <commands+0x630>
ffffffffc0200750:	985ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200754:	604c                	ld	a1,128(s0)
ffffffffc0200756:	00009517          	auipc	a0,0x9
ffffffffc020075a:	cfa50513          	addi	a0,a0,-774 # ffffffffc0209450 <commands+0x648>
ffffffffc020075e:	977ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200762:	644c                	ld	a1,136(s0)
ffffffffc0200764:	00009517          	auipc	a0,0x9
ffffffffc0200768:	d0450513          	addi	a0,a0,-764 # ffffffffc0209468 <commands+0x660>
ffffffffc020076c:	969ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200770:	684c                	ld	a1,144(s0)
ffffffffc0200772:	00009517          	auipc	a0,0x9
ffffffffc0200776:	d0e50513          	addi	a0,a0,-754 # ffffffffc0209480 <commands+0x678>
ffffffffc020077a:	95bff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020077e:	6c4c                	ld	a1,152(s0)
ffffffffc0200780:	00009517          	auipc	a0,0x9
ffffffffc0200784:	d1850513          	addi	a0,a0,-744 # ffffffffc0209498 <commands+0x690>
ffffffffc0200788:	94dff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020078c:	704c                	ld	a1,160(s0)
ffffffffc020078e:	00009517          	auipc	a0,0x9
ffffffffc0200792:	d2250513          	addi	a0,a0,-734 # ffffffffc02094b0 <commands+0x6a8>
ffffffffc0200796:	93fff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020079a:	744c                	ld	a1,168(s0)
ffffffffc020079c:	00009517          	auipc	a0,0x9
ffffffffc02007a0:	d2c50513          	addi	a0,a0,-724 # ffffffffc02094c8 <commands+0x6c0>
ffffffffc02007a4:	931ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02007a8:	784c                	ld	a1,176(s0)
ffffffffc02007aa:	00009517          	auipc	a0,0x9
ffffffffc02007ae:	d3650513          	addi	a0,a0,-714 # ffffffffc02094e0 <commands+0x6d8>
ffffffffc02007b2:	923ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02007b6:	7c4c                	ld	a1,184(s0)
ffffffffc02007b8:	00009517          	auipc	a0,0x9
ffffffffc02007bc:	d4050513          	addi	a0,a0,-704 # ffffffffc02094f8 <commands+0x6f0>
ffffffffc02007c0:	915ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02007c4:	606c                	ld	a1,192(s0)
ffffffffc02007c6:	00009517          	auipc	a0,0x9
ffffffffc02007ca:	d4a50513          	addi	a0,a0,-694 # ffffffffc0209510 <commands+0x708>
ffffffffc02007ce:	907ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02007d2:	646c                	ld	a1,200(s0)
ffffffffc02007d4:	00009517          	auipc	a0,0x9
ffffffffc02007d8:	d5450513          	addi	a0,a0,-684 # ffffffffc0209528 <commands+0x720>
ffffffffc02007dc:	8f9ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02007e0:	686c                	ld	a1,208(s0)
ffffffffc02007e2:	00009517          	auipc	a0,0x9
ffffffffc02007e6:	d5e50513          	addi	a0,a0,-674 # ffffffffc0209540 <commands+0x738>
ffffffffc02007ea:	8ebff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02007ee:	6c6c                	ld	a1,216(s0)
ffffffffc02007f0:	00009517          	auipc	a0,0x9
ffffffffc02007f4:	d6850513          	addi	a0,a0,-664 # ffffffffc0209558 <commands+0x750>
ffffffffc02007f8:	8ddff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02007fc:	706c                	ld	a1,224(s0)
ffffffffc02007fe:	00009517          	auipc	a0,0x9
ffffffffc0200802:	d7250513          	addi	a0,a0,-654 # ffffffffc0209570 <commands+0x768>
ffffffffc0200806:	8cfff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020080a:	746c                	ld	a1,232(s0)
ffffffffc020080c:	00009517          	auipc	a0,0x9
ffffffffc0200810:	d7c50513          	addi	a0,a0,-644 # ffffffffc0209588 <commands+0x780>
ffffffffc0200814:	8c1ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200818:	786c                	ld	a1,240(s0)
ffffffffc020081a:	00009517          	auipc	a0,0x9
ffffffffc020081e:	d8650513          	addi	a0,a0,-634 # ffffffffc02095a0 <commands+0x798>
ffffffffc0200822:	8b3ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200826:	7c6c                	ld	a1,248(s0)
ffffffffc0200828:	6402                	ld	s0,0(sp)
ffffffffc020082a:	60a2                	ld	ra,8(sp)
ffffffffc020082c:	00009517          	auipc	a0,0x9
ffffffffc0200830:	d8c50513          	addi	a0,a0,-628 # ffffffffc02095b8 <commands+0x7b0>
ffffffffc0200834:	0141                	addi	sp,sp,16
ffffffffc0200836:	89fff06f          	j	ffffffffc02000d4 <cprintf>

ffffffffc020083a <print_trapframe>:
ffffffffc020083a:	1141                	addi	sp,sp,-16
ffffffffc020083c:	e022                	sd	s0,0(sp)
ffffffffc020083e:	85aa                	mv	a1,a0
ffffffffc0200840:	842a                	mv	s0,a0
ffffffffc0200842:	00009517          	auipc	a0,0x9
ffffffffc0200846:	d8e50513          	addi	a0,a0,-626 # ffffffffc02095d0 <commands+0x7c8>
ffffffffc020084a:	e406                	sd	ra,8(sp)
ffffffffc020084c:	889ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200850:	8522                	mv	a0,s0
ffffffffc0200852:	e1bff0ef          	jal	ra,ffffffffc020066c <print_regs>
ffffffffc0200856:	10043583          	ld	a1,256(s0)
ffffffffc020085a:	00009517          	auipc	a0,0x9
ffffffffc020085e:	d8e50513          	addi	a0,a0,-626 # ffffffffc02095e8 <commands+0x7e0>
ffffffffc0200862:	873ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200866:	10843583          	ld	a1,264(s0)
ffffffffc020086a:	00009517          	auipc	a0,0x9
ffffffffc020086e:	d9650513          	addi	a0,a0,-618 # ffffffffc0209600 <commands+0x7f8>
ffffffffc0200872:	863ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200876:	11043583          	ld	a1,272(s0)
ffffffffc020087a:	00009517          	auipc	a0,0x9
ffffffffc020087e:	d9e50513          	addi	a0,a0,-610 # ffffffffc0209618 <commands+0x810>
ffffffffc0200882:	853ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200886:	11843583          	ld	a1,280(s0)
ffffffffc020088a:	6402                	ld	s0,0(sp)
ffffffffc020088c:	60a2                	ld	ra,8(sp)
ffffffffc020088e:	00009517          	auipc	a0,0x9
ffffffffc0200892:	d9a50513          	addi	a0,a0,-614 # ffffffffc0209628 <commands+0x820>
ffffffffc0200896:	0141                	addi	sp,sp,16
ffffffffc0200898:	83dff06f          	j	ffffffffc02000d4 <cprintf>

ffffffffc020089c <pgfault_handler>:
ffffffffc020089c:	1101                	addi	sp,sp,-32
ffffffffc020089e:	e426                	sd	s1,8(sp)
ffffffffc02008a0:	0003c497          	auipc	s1,0x3c
ffffffffc02008a4:	61848493          	addi	s1,s1,1560 # ffffffffc023ceb8 <check_mm_struct>
ffffffffc02008a8:	609c                	ld	a5,0(s1)
ffffffffc02008aa:	e822                	sd	s0,16(sp)
ffffffffc02008ac:	ec06                	sd	ra,24(sp)
ffffffffc02008ae:	842a                	mv	s0,a0
ffffffffc02008b0:	cbbd                	beqz	a5,ffffffffc0200926 <pgfault_handler+0x8a>
ffffffffc02008b2:	10053783          	ld	a5,256(a0)
ffffffffc02008b6:	11053583          	ld	a1,272(a0)
ffffffffc02008ba:	04b00613          	li	a2,75
ffffffffc02008be:	1007f793          	andi	a5,a5,256
ffffffffc02008c2:	cba1                	beqz	a5,ffffffffc0200912 <pgfault_handler+0x76>
ffffffffc02008c4:	11843703          	ld	a4,280(s0)
ffffffffc02008c8:	47bd                	li	a5,15
ffffffffc02008ca:	05700693          	li	a3,87
ffffffffc02008ce:	00f70463          	beq	a4,a5,ffffffffc02008d6 <pgfault_handler+0x3a>
ffffffffc02008d2:	05200693          	li	a3,82
ffffffffc02008d6:	00009517          	auipc	a0,0x9
ffffffffc02008da:	97a50513          	addi	a0,a0,-1670 # ffffffffc0209250 <commands+0x448>
ffffffffc02008de:	ff6ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02008e2:	6088                	ld	a0,0(s1)
ffffffffc02008e4:	c129                	beqz	a0,ffffffffc0200926 <pgfault_handler+0x8a>
ffffffffc02008e6:	0003c797          	auipc	a5,0x3c
ffffffffc02008ea:	59a78793          	addi	a5,a5,1434 # ffffffffc023ce80 <current>
ffffffffc02008ee:	6398                	ld	a4,0(a5)
ffffffffc02008f0:	0003c797          	auipc	a5,0x3c
ffffffffc02008f4:	59878793          	addi	a5,a5,1432 # ffffffffc023ce88 <idleproc>
ffffffffc02008f8:	639c                	ld	a5,0(a5)
ffffffffc02008fa:	04f71763          	bne	a4,a5,ffffffffc0200948 <pgfault_handler+0xac>
ffffffffc02008fe:	11043603          	ld	a2,272(s0)
ffffffffc0200902:	11843583          	ld	a1,280(s0)
ffffffffc0200906:	6442                	ld	s0,16(sp)
ffffffffc0200908:	60e2                	ld	ra,24(sp)
ffffffffc020090a:	64a2                	ld	s1,8(sp)
ffffffffc020090c:	6105                	addi	sp,sp,32
ffffffffc020090e:	4e30006f          	j	ffffffffc02015f0 <do_pgfault>
ffffffffc0200912:	11843703          	ld	a4,280(s0)
ffffffffc0200916:	47bd                	li	a5,15
ffffffffc0200918:	05500613          	li	a2,85
ffffffffc020091c:	05700693          	li	a3,87
ffffffffc0200920:	faf719e3          	bne	a4,a5,ffffffffc02008d2 <pgfault_handler+0x36>
ffffffffc0200924:	bf4d                	j	ffffffffc02008d6 <pgfault_handler+0x3a>
ffffffffc0200926:	0003c797          	auipc	a5,0x3c
ffffffffc020092a:	55a78793          	addi	a5,a5,1370 # ffffffffc023ce80 <current>
ffffffffc020092e:	639c                	ld	a5,0(a5)
ffffffffc0200930:	cf85                	beqz	a5,ffffffffc0200968 <pgfault_handler+0xcc>
ffffffffc0200932:	11043603          	ld	a2,272(s0)
ffffffffc0200936:	11843583          	ld	a1,280(s0)
ffffffffc020093a:	6442                	ld	s0,16(sp)
ffffffffc020093c:	60e2                	ld	ra,24(sp)
ffffffffc020093e:	64a2                	ld	s1,8(sp)
ffffffffc0200940:	7788                	ld	a0,40(a5)
ffffffffc0200942:	6105                	addi	sp,sp,32
ffffffffc0200944:	4ad0006f          	j	ffffffffc02015f0 <do_pgfault>
ffffffffc0200948:	00009697          	auipc	a3,0x9
ffffffffc020094c:	92868693          	addi	a3,a3,-1752 # ffffffffc0209270 <commands+0x468>
ffffffffc0200950:	00009617          	auipc	a2,0x9
ffffffffc0200954:	93860613          	addi	a2,a2,-1736 # ffffffffc0209288 <commands+0x480>
ffffffffc0200958:	06c00593          	li	a1,108
ffffffffc020095c:	00009517          	auipc	a0,0x9
ffffffffc0200960:	94450513          	addi	a0,a0,-1724 # ffffffffc02092a0 <commands+0x498>
ffffffffc0200964:	8b5ff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0200968:	8522                	mv	a0,s0
ffffffffc020096a:	ed1ff0ef          	jal	ra,ffffffffc020083a <print_trapframe>
ffffffffc020096e:	10043783          	ld	a5,256(s0)
ffffffffc0200972:	11043583          	ld	a1,272(s0)
ffffffffc0200976:	04b00613          	li	a2,75
ffffffffc020097a:	1007f793          	andi	a5,a5,256
ffffffffc020097e:	e399                	bnez	a5,ffffffffc0200984 <pgfault_handler+0xe8>
ffffffffc0200980:	05500613          	li	a2,85
ffffffffc0200984:	11843703          	ld	a4,280(s0)
ffffffffc0200988:	47bd                	li	a5,15
ffffffffc020098a:	02f70663          	beq	a4,a5,ffffffffc02009b6 <pgfault_handler+0x11a>
ffffffffc020098e:	05200693          	li	a3,82
ffffffffc0200992:	00009517          	auipc	a0,0x9
ffffffffc0200996:	8be50513          	addi	a0,a0,-1858 # ffffffffc0209250 <commands+0x448>
ffffffffc020099a:	f3aff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020099e:	00009617          	auipc	a2,0x9
ffffffffc02009a2:	91a60613          	addi	a2,a2,-1766 # ffffffffc02092b8 <commands+0x4b0>
ffffffffc02009a6:	07300593          	li	a1,115
ffffffffc02009aa:	00009517          	auipc	a0,0x9
ffffffffc02009ae:	8f650513          	addi	a0,a0,-1802 # ffffffffc02092a0 <commands+0x498>
ffffffffc02009b2:	867ff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02009b6:	05700693          	li	a3,87
ffffffffc02009ba:	bfe1                	j	ffffffffc0200992 <pgfault_handler+0xf6>

ffffffffc02009bc <interrupt_handler>:
ffffffffc02009bc:	11853783          	ld	a5,280(a0)
ffffffffc02009c0:	472d                	li	a4,11
ffffffffc02009c2:	0786                	slli	a5,a5,0x1
ffffffffc02009c4:	8385                	srli	a5,a5,0x1
ffffffffc02009c6:	08f76163          	bltu	a4,a5,ffffffffc0200a48 <interrupt_handler+0x8c>
ffffffffc02009ca:	00008717          	auipc	a4,0x8
ffffffffc02009ce:	5da70713          	addi	a4,a4,1498 # ffffffffc0208fa4 <commands+0x19c>
ffffffffc02009d2:	078a                	slli	a5,a5,0x2
ffffffffc02009d4:	97ba                	add	a5,a5,a4
ffffffffc02009d6:	439c                	lw	a5,0(a5)
ffffffffc02009d8:	97ba                	add	a5,a5,a4
ffffffffc02009da:	8782                	jr	a5
ffffffffc02009dc:	00009517          	auipc	a0,0x9
ffffffffc02009e0:	83450513          	addi	a0,a0,-1996 # ffffffffc0209210 <commands+0x408>
ffffffffc02009e4:	ef0ff06f          	j	ffffffffc02000d4 <cprintf>
ffffffffc02009e8:	00009517          	auipc	a0,0x9
ffffffffc02009ec:	80850513          	addi	a0,a0,-2040 # ffffffffc02091f0 <commands+0x3e8>
ffffffffc02009f0:	ee4ff06f          	j	ffffffffc02000d4 <cprintf>
ffffffffc02009f4:	00008517          	auipc	a0,0x8
ffffffffc02009f8:	7bc50513          	addi	a0,a0,1980 # ffffffffc02091b0 <commands+0x3a8>
ffffffffc02009fc:	ed8ff06f          	j	ffffffffc02000d4 <cprintf>
ffffffffc0200a00:	00008517          	auipc	a0,0x8
ffffffffc0200a04:	7d050513          	addi	a0,a0,2000 # ffffffffc02091d0 <commands+0x3c8>
ffffffffc0200a08:	eccff06f          	j	ffffffffc02000d4 <cprintf>
ffffffffc0200a0c:	00009517          	auipc	a0,0x9
ffffffffc0200a10:	82450513          	addi	a0,a0,-2012 # ffffffffc0209230 <commands+0x428>
ffffffffc0200a14:	ec0ff06f          	j	ffffffffc02000d4 <cprintf>
ffffffffc0200a18:	1141                	addi	sp,sp,-16
ffffffffc0200a1a:	e406                	sd	ra,8(sp)
ffffffffc0200a1c:	b9fff0ef          	jal	ra,ffffffffc02005ba <clock_set_next_event>
ffffffffc0200a20:	0003c797          	auipc	a5,0x3c
ffffffffc0200a24:	49078793          	addi	a5,a5,1168 # ffffffffc023ceb0 <ticks>
ffffffffc0200a28:	639c                	ld	a5,0(a5)
ffffffffc0200a2a:	0003c717          	auipc	a4,0x3c
ffffffffc0200a2e:	45670713          	addi	a4,a4,1110 # ffffffffc023ce80 <current>
ffffffffc0200a32:	6308                	ld	a0,0(a4)
ffffffffc0200a34:	0785                	addi	a5,a5,1
ffffffffc0200a36:	0003c717          	auipc	a4,0x3c
ffffffffc0200a3a:	46f73d23          	sd	a5,1146(a4) # ffffffffc023ceb0 <ticks>
ffffffffc0200a3e:	c511                	beqz	a0,ffffffffc0200a4a <interrupt_handler+0x8e>
ffffffffc0200a40:	60a2                	ld	ra,8(sp)
ffffffffc0200a42:	0141                	addi	sp,sp,16
ffffffffc0200a44:	0d60506f          	j	ffffffffc0205b1a <sched_class_proc_tick>
ffffffffc0200a48:	bbcd                	j	ffffffffc020083a <print_trapframe>
ffffffffc0200a4a:	60a2                	ld	ra,8(sp)
ffffffffc0200a4c:	0141                	addi	sp,sp,16
ffffffffc0200a4e:	8082                	ret

ffffffffc0200a50 <exception_handler>:
ffffffffc0200a50:	11853783          	ld	a5,280(a0)
ffffffffc0200a54:	473d                	li	a4,15
ffffffffc0200a56:	18f76763          	bltu	a4,a5,ffffffffc0200be4 <exception_handler+0x194>
ffffffffc0200a5a:	00008717          	auipc	a4,0x8
ffffffffc0200a5e:	57a70713          	addi	a4,a4,1402 # ffffffffc0208fd4 <commands+0x1cc>
ffffffffc0200a62:	078a                	slli	a5,a5,0x2
ffffffffc0200a64:	97ba                	add	a5,a5,a4
ffffffffc0200a66:	439c                	lw	a5,0(a5)
ffffffffc0200a68:	1101                	addi	sp,sp,-32
ffffffffc0200a6a:	e822                	sd	s0,16(sp)
ffffffffc0200a6c:	ec06                	sd	ra,24(sp)
ffffffffc0200a6e:	e426                	sd	s1,8(sp)
ffffffffc0200a70:	97ba                	add	a5,a5,a4
ffffffffc0200a72:	842a                	mv	s0,a0
ffffffffc0200a74:	8782                	jr	a5
ffffffffc0200a76:	00008517          	auipc	a0,0x8
ffffffffc0200a7a:	69250513          	addi	a0,a0,1682 # ffffffffc0209108 <commands+0x300>
ffffffffc0200a7e:	e56ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200a82:	10843783          	ld	a5,264(s0)
ffffffffc0200a86:	60e2                	ld	ra,24(sp)
ffffffffc0200a88:	64a2                	ld	s1,8(sp)
ffffffffc0200a8a:	0791                	addi	a5,a5,4
ffffffffc0200a8c:	10f43423          	sd	a5,264(s0)
ffffffffc0200a90:	6442                	ld	s0,16(sp)
ffffffffc0200a92:	6105                	addi	sp,sp,32
ffffffffc0200a94:	4b10706f          	j	ffffffffc0208744 <syscall>
ffffffffc0200a98:	00008517          	auipc	a0,0x8
ffffffffc0200a9c:	69050513          	addi	a0,a0,1680 # ffffffffc0209128 <commands+0x320>
ffffffffc0200aa0:	6442                	ld	s0,16(sp)
ffffffffc0200aa2:	60e2                	ld	ra,24(sp)
ffffffffc0200aa4:	64a2                	ld	s1,8(sp)
ffffffffc0200aa6:	6105                	addi	sp,sp,32
ffffffffc0200aa8:	e2cff06f          	j	ffffffffc02000d4 <cprintf>
ffffffffc0200aac:	00008517          	auipc	a0,0x8
ffffffffc0200ab0:	69c50513          	addi	a0,a0,1692 # ffffffffc0209148 <commands+0x340>
ffffffffc0200ab4:	b7f5                	j	ffffffffc0200aa0 <exception_handler+0x50>
ffffffffc0200ab6:	00008517          	auipc	a0,0x8
ffffffffc0200aba:	6b250513          	addi	a0,a0,1714 # ffffffffc0209168 <commands+0x360>
ffffffffc0200abe:	b7cd                	j	ffffffffc0200aa0 <exception_handler+0x50>
ffffffffc0200ac0:	00008517          	auipc	a0,0x8
ffffffffc0200ac4:	6c050513          	addi	a0,a0,1728 # ffffffffc0209180 <commands+0x378>
ffffffffc0200ac8:	e0cff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200acc:	8522                	mv	a0,s0
ffffffffc0200ace:	dcfff0ef          	jal	ra,ffffffffc020089c <pgfault_handler>
ffffffffc0200ad2:	84aa                	mv	s1,a0
ffffffffc0200ad4:	10051963          	bnez	a0,ffffffffc0200be6 <exception_handler+0x196>
ffffffffc0200ad8:	60e2                	ld	ra,24(sp)
ffffffffc0200ada:	6442                	ld	s0,16(sp)
ffffffffc0200adc:	64a2                	ld	s1,8(sp)
ffffffffc0200ade:	6105                	addi	sp,sp,32
ffffffffc0200ae0:	8082                	ret
ffffffffc0200ae2:	00008517          	auipc	a0,0x8
ffffffffc0200ae6:	6b650513          	addi	a0,a0,1718 # ffffffffc0209198 <commands+0x390>
ffffffffc0200aea:	deaff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200aee:	8522                	mv	a0,s0
ffffffffc0200af0:	dadff0ef          	jal	ra,ffffffffc020089c <pgfault_handler>
ffffffffc0200af4:	84aa                	mv	s1,a0
ffffffffc0200af6:	d16d                	beqz	a0,ffffffffc0200ad8 <exception_handler+0x88>
ffffffffc0200af8:	8522                	mv	a0,s0
ffffffffc0200afa:	d41ff0ef          	jal	ra,ffffffffc020083a <print_trapframe>
ffffffffc0200afe:	86a6                	mv	a3,s1
ffffffffc0200b00:	00008617          	auipc	a2,0x8
ffffffffc0200b04:	5b860613          	addi	a2,a2,1464 # ffffffffc02090b8 <commands+0x2b0>
ffffffffc0200b08:	0fa00593          	li	a1,250
ffffffffc0200b0c:	00008517          	auipc	a0,0x8
ffffffffc0200b10:	79450513          	addi	a0,a0,1940 # ffffffffc02092a0 <commands+0x498>
ffffffffc0200b14:	f04ff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0200b18:	00008517          	auipc	a0,0x8
ffffffffc0200b1c:	50050513          	addi	a0,a0,1280 # ffffffffc0209018 <commands+0x210>
ffffffffc0200b20:	b741                	j	ffffffffc0200aa0 <exception_handler+0x50>
ffffffffc0200b22:	00008517          	auipc	a0,0x8
ffffffffc0200b26:	51650513          	addi	a0,a0,1302 # ffffffffc0209038 <commands+0x230>
ffffffffc0200b2a:	bf9d                	j	ffffffffc0200aa0 <exception_handler+0x50>
ffffffffc0200b2c:	00008517          	auipc	a0,0x8
ffffffffc0200b30:	52c50513          	addi	a0,a0,1324 # ffffffffc0209058 <commands+0x250>
ffffffffc0200b34:	b7b5                	j	ffffffffc0200aa0 <exception_handler+0x50>
ffffffffc0200b36:	00008517          	auipc	a0,0x8
ffffffffc0200b3a:	53a50513          	addi	a0,a0,1338 # ffffffffc0209070 <commands+0x268>
ffffffffc0200b3e:	d96ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200b42:	6458                	ld	a4,136(s0)
ffffffffc0200b44:	47a9                	li	a5,10
ffffffffc0200b46:	f8f719e3          	bne	a4,a5,ffffffffc0200ad8 <exception_handler+0x88>
ffffffffc0200b4a:	bf25                	j	ffffffffc0200a82 <exception_handler+0x32>
ffffffffc0200b4c:	00008517          	auipc	a0,0x8
ffffffffc0200b50:	53450513          	addi	a0,a0,1332 # ffffffffc0209080 <commands+0x278>
ffffffffc0200b54:	b7b1                	j	ffffffffc0200aa0 <exception_handler+0x50>
ffffffffc0200b56:	00008517          	auipc	a0,0x8
ffffffffc0200b5a:	54a50513          	addi	a0,a0,1354 # ffffffffc02090a0 <commands+0x298>
ffffffffc0200b5e:	d76ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200b62:	8522                	mv	a0,s0
ffffffffc0200b64:	d39ff0ef          	jal	ra,ffffffffc020089c <pgfault_handler>
ffffffffc0200b68:	84aa                	mv	s1,a0
ffffffffc0200b6a:	d53d                	beqz	a0,ffffffffc0200ad8 <exception_handler+0x88>
ffffffffc0200b6c:	8522                	mv	a0,s0
ffffffffc0200b6e:	ccdff0ef          	jal	ra,ffffffffc020083a <print_trapframe>
ffffffffc0200b72:	86a6                	mv	a3,s1
ffffffffc0200b74:	00008617          	auipc	a2,0x8
ffffffffc0200b78:	54460613          	addi	a2,a2,1348 # ffffffffc02090b8 <commands+0x2b0>
ffffffffc0200b7c:	0cf00593          	li	a1,207
ffffffffc0200b80:	00008517          	auipc	a0,0x8
ffffffffc0200b84:	72050513          	addi	a0,a0,1824 # ffffffffc02092a0 <commands+0x498>
ffffffffc0200b88:	e90ff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0200b8c:	00008517          	auipc	a0,0x8
ffffffffc0200b90:	56450513          	addi	a0,a0,1380 # ffffffffc02090f0 <commands+0x2e8>
ffffffffc0200b94:	d40ff0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0200b98:	8522                	mv	a0,s0
ffffffffc0200b9a:	d03ff0ef          	jal	ra,ffffffffc020089c <pgfault_handler>
ffffffffc0200b9e:	84aa                	mv	s1,a0
ffffffffc0200ba0:	dd05                	beqz	a0,ffffffffc0200ad8 <exception_handler+0x88>
ffffffffc0200ba2:	8522                	mv	a0,s0
ffffffffc0200ba4:	c97ff0ef          	jal	ra,ffffffffc020083a <print_trapframe>
ffffffffc0200ba8:	86a6                	mv	a3,s1
ffffffffc0200baa:	00008617          	auipc	a2,0x8
ffffffffc0200bae:	50e60613          	addi	a2,a2,1294 # ffffffffc02090b8 <commands+0x2b0>
ffffffffc0200bb2:	0d900593          	li	a1,217
ffffffffc0200bb6:	00008517          	auipc	a0,0x8
ffffffffc0200bba:	6ea50513          	addi	a0,a0,1770 # ffffffffc02092a0 <commands+0x498>
ffffffffc0200bbe:	e5aff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0200bc2:	6442                	ld	s0,16(sp)
ffffffffc0200bc4:	60e2                	ld	ra,24(sp)
ffffffffc0200bc6:	64a2                	ld	s1,8(sp)
ffffffffc0200bc8:	6105                	addi	sp,sp,32
ffffffffc0200bca:	b985                	j	ffffffffc020083a <print_trapframe>
ffffffffc0200bcc:	00008617          	auipc	a2,0x8
ffffffffc0200bd0:	50c60613          	addi	a2,a2,1292 # ffffffffc02090d8 <commands+0x2d0>
ffffffffc0200bd4:	0d300593          	li	a1,211
ffffffffc0200bd8:	00008517          	auipc	a0,0x8
ffffffffc0200bdc:	6c850513          	addi	a0,a0,1736 # ffffffffc02092a0 <commands+0x498>
ffffffffc0200be0:	e38ff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0200be4:	b999                	j	ffffffffc020083a <print_trapframe>
ffffffffc0200be6:	8522                	mv	a0,s0
ffffffffc0200be8:	c53ff0ef          	jal	ra,ffffffffc020083a <print_trapframe>
ffffffffc0200bec:	86a6                	mv	a3,s1
ffffffffc0200bee:	00008617          	auipc	a2,0x8
ffffffffc0200bf2:	4ca60613          	addi	a2,a2,1226 # ffffffffc02090b8 <commands+0x2b0>
ffffffffc0200bf6:	0f300593          	li	a1,243
ffffffffc0200bfa:	00008517          	auipc	a0,0x8
ffffffffc0200bfe:	6a650513          	addi	a0,a0,1702 # ffffffffc02092a0 <commands+0x498>
ffffffffc0200c02:	e16ff0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0200c06 <trap>:
ffffffffc0200c06:	1101                	addi	sp,sp,-32
ffffffffc0200c08:	e822                	sd	s0,16(sp)
ffffffffc0200c0a:	0003c417          	auipc	s0,0x3c
ffffffffc0200c0e:	27640413          	addi	s0,s0,630 # ffffffffc023ce80 <current>
ffffffffc0200c12:	6018                	ld	a4,0(s0)
ffffffffc0200c14:	ec06                	sd	ra,24(sp)
ffffffffc0200c16:	e426                	sd	s1,8(sp)
ffffffffc0200c18:	e04a                	sd	s2,0(sp)
ffffffffc0200c1a:	11853683          	ld	a3,280(a0)
ffffffffc0200c1e:	cf1d                	beqz	a4,ffffffffc0200c5c <trap+0x56>
ffffffffc0200c20:	10053483          	ld	s1,256(a0)
ffffffffc0200c24:	0a073903          	ld	s2,160(a4)
ffffffffc0200c28:	f348                	sd	a0,160(a4)
ffffffffc0200c2a:	1004f493          	andi	s1,s1,256
ffffffffc0200c2e:	0206c463          	bltz	a3,ffffffffc0200c56 <trap+0x50>
ffffffffc0200c32:	e1fff0ef          	jal	ra,ffffffffc0200a50 <exception_handler>
ffffffffc0200c36:	601c                	ld	a5,0(s0)
ffffffffc0200c38:	0b27b023          	sd	s2,160(a5)
ffffffffc0200c3c:	e499                	bnez	s1,ffffffffc0200c4a <trap+0x44>
ffffffffc0200c3e:	0b07a703          	lw	a4,176(a5)
ffffffffc0200c42:	8b05                	andi	a4,a4,1
ffffffffc0200c44:	e329                	bnez	a4,ffffffffc0200c86 <trap+0x80>
ffffffffc0200c46:	6f9c                	ld	a5,24(a5)
ffffffffc0200c48:	eb85                	bnez	a5,ffffffffc0200c78 <trap+0x72>
ffffffffc0200c4a:	60e2                	ld	ra,24(sp)
ffffffffc0200c4c:	6442                	ld	s0,16(sp)
ffffffffc0200c4e:	64a2                	ld	s1,8(sp)
ffffffffc0200c50:	6902                	ld	s2,0(sp)
ffffffffc0200c52:	6105                	addi	sp,sp,32
ffffffffc0200c54:	8082                	ret
ffffffffc0200c56:	d67ff0ef          	jal	ra,ffffffffc02009bc <interrupt_handler>
ffffffffc0200c5a:	bff1                	j	ffffffffc0200c36 <trap+0x30>
ffffffffc0200c5c:	0006c863          	bltz	a3,ffffffffc0200c6c <trap+0x66>
ffffffffc0200c60:	6442                	ld	s0,16(sp)
ffffffffc0200c62:	60e2                	ld	ra,24(sp)
ffffffffc0200c64:	64a2                	ld	s1,8(sp)
ffffffffc0200c66:	6902                	ld	s2,0(sp)
ffffffffc0200c68:	6105                	addi	sp,sp,32
ffffffffc0200c6a:	b3dd                	j	ffffffffc0200a50 <exception_handler>
ffffffffc0200c6c:	6442                	ld	s0,16(sp)
ffffffffc0200c6e:	60e2                	ld	ra,24(sp)
ffffffffc0200c70:	64a2                	ld	s1,8(sp)
ffffffffc0200c72:	6902                	ld	s2,0(sp)
ffffffffc0200c74:	6105                	addi	sp,sp,32
ffffffffc0200c76:	b399                	j	ffffffffc02009bc <interrupt_handler>
ffffffffc0200c78:	6442                	ld	s0,16(sp)
ffffffffc0200c7a:	60e2                	ld	ra,24(sp)
ffffffffc0200c7c:	64a2                	ld	s1,8(sp)
ffffffffc0200c7e:	6902                	ld	s2,0(sp)
ffffffffc0200c80:	6105                	addi	sp,sp,32
ffffffffc0200c82:	7d70406f          	j	ffffffffc0205c58 <schedule>
ffffffffc0200c86:	555d                	li	a0,-9
ffffffffc0200c88:	33e040ef          	jal	ra,ffffffffc0204fc6 <do_exit>
ffffffffc0200c8c:	601c                	ld	a5,0(s0)
ffffffffc0200c8e:	bf65                	j	ffffffffc0200c46 <trap+0x40>

ffffffffc0200c90 <__alltraps>:
ffffffffc0200c90:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0200c94:	00011463          	bnez	sp,ffffffffc0200c9c <__alltraps+0xc>
ffffffffc0200c98:	14002173          	csrr	sp,sscratch
ffffffffc0200c9c:	712d                	addi	sp,sp,-288
ffffffffc0200c9e:	e002                	sd	zero,0(sp)
ffffffffc0200ca0:	e406                	sd	ra,8(sp)
ffffffffc0200ca2:	ec0e                	sd	gp,24(sp)
ffffffffc0200ca4:	f012                	sd	tp,32(sp)
ffffffffc0200ca6:	f416                	sd	t0,40(sp)
ffffffffc0200ca8:	f81a                	sd	t1,48(sp)
ffffffffc0200caa:	fc1e                	sd	t2,56(sp)
ffffffffc0200cac:	e0a2                	sd	s0,64(sp)
ffffffffc0200cae:	e4a6                	sd	s1,72(sp)
ffffffffc0200cb0:	e8aa                	sd	a0,80(sp)
ffffffffc0200cb2:	ecae                	sd	a1,88(sp)
ffffffffc0200cb4:	f0b2                	sd	a2,96(sp)
ffffffffc0200cb6:	f4b6                	sd	a3,104(sp)
ffffffffc0200cb8:	f8ba                	sd	a4,112(sp)
ffffffffc0200cba:	fcbe                	sd	a5,120(sp)
ffffffffc0200cbc:	e142                	sd	a6,128(sp)
ffffffffc0200cbe:	e546                	sd	a7,136(sp)
ffffffffc0200cc0:	e94a                	sd	s2,144(sp)
ffffffffc0200cc2:	ed4e                	sd	s3,152(sp)
ffffffffc0200cc4:	f152                	sd	s4,160(sp)
ffffffffc0200cc6:	f556                	sd	s5,168(sp)
ffffffffc0200cc8:	f95a                	sd	s6,176(sp)
ffffffffc0200cca:	fd5e                	sd	s7,184(sp)
ffffffffc0200ccc:	e1e2                	sd	s8,192(sp)
ffffffffc0200cce:	e5e6                	sd	s9,200(sp)
ffffffffc0200cd0:	e9ea                	sd	s10,208(sp)
ffffffffc0200cd2:	edee                	sd	s11,216(sp)
ffffffffc0200cd4:	f1f2                	sd	t3,224(sp)
ffffffffc0200cd6:	f5f6                	sd	t4,232(sp)
ffffffffc0200cd8:	f9fa                	sd	t5,240(sp)
ffffffffc0200cda:	fdfe                	sd	t6,248(sp)
ffffffffc0200cdc:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200ce0:	100024f3          	csrr	s1,sstatus
ffffffffc0200ce4:	14102973          	csrr	s2,sepc
ffffffffc0200ce8:	143029f3          	csrr	s3,stval
ffffffffc0200cec:	14202a73          	csrr	s4,scause
ffffffffc0200cf0:	e822                	sd	s0,16(sp)
ffffffffc0200cf2:	e226                	sd	s1,256(sp)
ffffffffc0200cf4:	e64a                	sd	s2,264(sp)
ffffffffc0200cf6:	ea4e                	sd	s3,272(sp)
ffffffffc0200cf8:	ee52                	sd	s4,280(sp)
ffffffffc0200cfa:	850a                	mv	a0,sp
ffffffffc0200cfc:	f0bff0ef          	jal	ra,ffffffffc0200c06 <trap>

ffffffffc0200d00 <__trapret>:
ffffffffc0200d00:	6492                	ld	s1,256(sp)
ffffffffc0200d02:	6932                	ld	s2,264(sp)
ffffffffc0200d04:	1004f413          	andi	s0,s1,256
ffffffffc0200d08:	e401                	bnez	s0,ffffffffc0200d10 <__trapret+0x10>
ffffffffc0200d0a:	1200                	addi	s0,sp,288
ffffffffc0200d0c:	14041073          	csrw	sscratch,s0
ffffffffc0200d10:	10049073          	csrw	sstatus,s1
ffffffffc0200d14:	14191073          	csrw	sepc,s2
ffffffffc0200d18:	60a2                	ld	ra,8(sp)
ffffffffc0200d1a:	61e2                	ld	gp,24(sp)
ffffffffc0200d1c:	7202                	ld	tp,32(sp)
ffffffffc0200d1e:	72a2                	ld	t0,40(sp)
ffffffffc0200d20:	7342                	ld	t1,48(sp)
ffffffffc0200d22:	73e2                	ld	t2,56(sp)
ffffffffc0200d24:	6406                	ld	s0,64(sp)
ffffffffc0200d26:	64a6                	ld	s1,72(sp)
ffffffffc0200d28:	6546                	ld	a0,80(sp)
ffffffffc0200d2a:	65e6                	ld	a1,88(sp)
ffffffffc0200d2c:	7606                	ld	a2,96(sp)
ffffffffc0200d2e:	76a6                	ld	a3,104(sp)
ffffffffc0200d30:	7746                	ld	a4,112(sp)
ffffffffc0200d32:	77e6                	ld	a5,120(sp)
ffffffffc0200d34:	680a                	ld	a6,128(sp)
ffffffffc0200d36:	68aa                	ld	a7,136(sp)
ffffffffc0200d38:	694a                	ld	s2,144(sp)
ffffffffc0200d3a:	69ea                	ld	s3,152(sp)
ffffffffc0200d3c:	7a0a                	ld	s4,160(sp)
ffffffffc0200d3e:	7aaa                	ld	s5,168(sp)
ffffffffc0200d40:	7b4a                	ld	s6,176(sp)
ffffffffc0200d42:	7bea                	ld	s7,184(sp)
ffffffffc0200d44:	6c0e                	ld	s8,192(sp)
ffffffffc0200d46:	6cae                	ld	s9,200(sp)
ffffffffc0200d48:	6d4e                	ld	s10,208(sp)
ffffffffc0200d4a:	6dee                	ld	s11,216(sp)
ffffffffc0200d4c:	7e0e                	ld	t3,224(sp)
ffffffffc0200d4e:	7eae                	ld	t4,232(sp)
ffffffffc0200d50:	7f4e                	ld	t5,240(sp)
ffffffffc0200d52:	7fee                	ld	t6,248(sp)
ffffffffc0200d54:	6142                	ld	sp,16(sp)
ffffffffc0200d56:	10200073          	sret

ffffffffc0200d5a <forkrets>:
ffffffffc0200d5a:	812a                	mv	sp,a0
ffffffffc0200d5c:	b755                	j	ffffffffc0200d00 <__trapret>

ffffffffc0200d5e <check_vma_overlap.isra.0.part.1>:
ffffffffc0200d5e:	1141                	addi	sp,sp,-16
ffffffffc0200d60:	00009697          	auipc	a3,0x9
ffffffffc0200d64:	8e068693          	addi	a3,a3,-1824 # ffffffffc0209640 <commands+0x838>
ffffffffc0200d68:	00008617          	auipc	a2,0x8
ffffffffc0200d6c:	52060613          	addi	a2,a2,1312 # ffffffffc0209288 <commands+0x480>
ffffffffc0200d70:	06d00593          	li	a1,109
ffffffffc0200d74:	00009517          	auipc	a0,0x9
ffffffffc0200d78:	8ec50513          	addi	a0,a0,-1812 # ffffffffc0209660 <commands+0x858>
ffffffffc0200d7c:	e406                	sd	ra,8(sp)
ffffffffc0200d7e:	c9aff0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0200d82 <mm_create>:
ffffffffc0200d82:	1141                	addi	sp,sp,-16
ffffffffc0200d84:	04000513          	li	a0,64
ffffffffc0200d88:	e022                	sd	s0,0(sp)
ffffffffc0200d8a:	e406                	sd	ra,8(sp)
ffffffffc0200d8c:	088010ef          	jal	ra,ffffffffc0201e14 <kmalloc>
ffffffffc0200d90:	842a                	mv	s0,a0
ffffffffc0200d92:	c515                	beqz	a0,ffffffffc0200dbe <mm_create+0x3c>
ffffffffc0200d94:	0003c797          	auipc	a5,0x3c
ffffffffc0200d98:	0d478793          	addi	a5,a5,212 # ffffffffc023ce68 <swap_init_ok>
ffffffffc0200d9c:	439c                	lw	a5,0(a5)
ffffffffc0200d9e:	e408                	sd	a0,8(s0)
ffffffffc0200da0:	e008                	sd	a0,0(s0)
ffffffffc0200da2:	00053823          	sd	zero,16(a0)
ffffffffc0200da6:	00053c23          	sd	zero,24(a0)
ffffffffc0200daa:	02052023          	sw	zero,32(a0)
ffffffffc0200dae:	2781                	sext.w	a5,a5
ffffffffc0200db0:	ef81                	bnez	a5,ffffffffc0200dc8 <mm_create+0x46>
ffffffffc0200db2:	02053423          	sd	zero,40(a0)
ffffffffc0200db6:	02042823          	sw	zero,48(s0)
ffffffffc0200dba:	02043c23          	sd	zero,56(s0)
ffffffffc0200dbe:	8522                	mv	a0,s0
ffffffffc0200dc0:	60a2                	ld	ra,8(sp)
ffffffffc0200dc2:	6402                	ld	s0,0(sp)
ffffffffc0200dc4:	0141                	addi	sp,sp,16
ffffffffc0200dc6:	8082                	ret
ffffffffc0200dc8:	105010ef          	jal	ra,ffffffffc02026cc <swap_init_mm>
ffffffffc0200dcc:	b7ed                	j	ffffffffc0200db6 <mm_create+0x34>

ffffffffc0200dce <vma_create>:
ffffffffc0200dce:	1101                	addi	sp,sp,-32
ffffffffc0200dd0:	e04a                	sd	s2,0(sp)
ffffffffc0200dd2:	892a                	mv	s2,a0
ffffffffc0200dd4:	03000513          	li	a0,48
ffffffffc0200dd8:	e822                	sd	s0,16(sp)
ffffffffc0200dda:	e426                	sd	s1,8(sp)
ffffffffc0200ddc:	ec06                	sd	ra,24(sp)
ffffffffc0200dde:	84ae                	mv	s1,a1
ffffffffc0200de0:	8432                	mv	s0,a2
ffffffffc0200de2:	032010ef          	jal	ra,ffffffffc0201e14 <kmalloc>
ffffffffc0200de6:	c509                	beqz	a0,ffffffffc0200df0 <vma_create+0x22>
ffffffffc0200de8:	01253423          	sd	s2,8(a0)
ffffffffc0200dec:	e904                	sd	s1,16(a0)
ffffffffc0200dee:	cd00                	sw	s0,24(a0)
ffffffffc0200df0:	60e2                	ld	ra,24(sp)
ffffffffc0200df2:	6442                	ld	s0,16(sp)
ffffffffc0200df4:	64a2                	ld	s1,8(sp)
ffffffffc0200df6:	6902                	ld	s2,0(sp)
ffffffffc0200df8:	6105                	addi	sp,sp,32
ffffffffc0200dfa:	8082                	ret

ffffffffc0200dfc <find_vma>:
ffffffffc0200dfc:	c51d                	beqz	a0,ffffffffc0200e2a <find_vma+0x2e>
ffffffffc0200dfe:	691c                	ld	a5,16(a0)
ffffffffc0200e00:	c781                	beqz	a5,ffffffffc0200e08 <find_vma+0xc>
ffffffffc0200e02:	6798                	ld	a4,8(a5)
ffffffffc0200e04:	02e5f663          	bgeu	a1,a4,ffffffffc0200e30 <find_vma+0x34>
ffffffffc0200e08:	87aa                	mv	a5,a0
ffffffffc0200e0a:	679c                	ld	a5,8(a5)
ffffffffc0200e0c:	00f50f63          	beq	a0,a5,ffffffffc0200e2a <find_vma+0x2e>
ffffffffc0200e10:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200e14:	fee5ebe3          	bltu	a1,a4,ffffffffc0200e0a <find_vma+0xe>
ffffffffc0200e18:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200e1c:	fee5f7e3          	bgeu	a1,a4,ffffffffc0200e0a <find_vma+0xe>
ffffffffc0200e20:	1781                	addi	a5,a5,-32
ffffffffc0200e22:	c781                	beqz	a5,ffffffffc0200e2a <find_vma+0x2e>
ffffffffc0200e24:	e91c                	sd	a5,16(a0)
ffffffffc0200e26:	853e                	mv	a0,a5
ffffffffc0200e28:	8082                	ret
ffffffffc0200e2a:	4781                	li	a5,0
ffffffffc0200e2c:	853e                	mv	a0,a5
ffffffffc0200e2e:	8082                	ret
ffffffffc0200e30:	6b98                	ld	a4,16(a5)
ffffffffc0200e32:	fce5fbe3          	bgeu	a1,a4,ffffffffc0200e08 <find_vma+0xc>
ffffffffc0200e36:	e91c                	sd	a5,16(a0)
ffffffffc0200e38:	b7fd                	j	ffffffffc0200e26 <find_vma+0x2a>

ffffffffc0200e3a <insert_vma_struct>:
ffffffffc0200e3a:	6590                	ld	a2,8(a1)
ffffffffc0200e3c:	0105b803          	ld	a6,16(a1)
ffffffffc0200e40:	1141                	addi	sp,sp,-16
ffffffffc0200e42:	e406                	sd	ra,8(sp)
ffffffffc0200e44:	872a                	mv	a4,a0
ffffffffc0200e46:	01066863          	bltu	a2,a6,ffffffffc0200e56 <insert_vma_struct+0x1c>
ffffffffc0200e4a:	a8b9                	j	ffffffffc0200ea8 <insert_vma_struct+0x6e>
ffffffffc0200e4c:	fe87b683          	ld	a3,-24(a5)
ffffffffc0200e50:	04d66763          	bltu	a2,a3,ffffffffc0200e9e <insert_vma_struct+0x64>
ffffffffc0200e54:	873e                	mv	a4,a5
ffffffffc0200e56:	671c                	ld	a5,8(a4)
ffffffffc0200e58:	fef51ae3          	bne	a0,a5,ffffffffc0200e4c <insert_vma_struct+0x12>
ffffffffc0200e5c:	02a70463          	beq	a4,a0,ffffffffc0200e84 <insert_vma_struct+0x4a>
ffffffffc0200e60:	ff073683          	ld	a3,-16(a4)
ffffffffc0200e64:	fe873883          	ld	a7,-24(a4)
ffffffffc0200e68:	08d8f063          	bgeu	a7,a3,ffffffffc0200ee8 <insert_vma_struct+0xae>
ffffffffc0200e6c:	04d66e63          	bltu	a2,a3,ffffffffc0200ec8 <insert_vma_struct+0x8e>
ffffffffc0200e70:	00f50a63          	beq	a0,a5,ffffffffc0200e84 <insert_vma_struct+0x4a>
ffffffffc0200e74:	fe87b683          	ld	a3,-24(a5)
ffffffffc0200e78:	0506e863          	bltu	a3,a6,ffffffffc0200ec8 <insert_vma_struct+0x8e>
ffffffffc0200e7c:	ff07b603          	ld	a2,-16(a5)
ffffffffc0200e80:	02c6f263          	bgeu	a3,a2,ffffffffc0200ea4 <insert_vma_struct+0x6a>
ffffffffc0200e84:	5114                	lw	a3,32(a0)
ffffffffc0200e86:	e188                	sd	a0,0(a1)
ffffffffc0200e88:	02058613          	addi	a2,a1,32
ffffffffc0200e8c:	e390                	sd	a2,0(a5)
ffffffffc0200e8e:	e710                	sd	a2,8(a4)
ffffffffc0200e90:	60a2                	ld	ra,8(sp)
ffffffffc0200e92:	f59c                	sd	a5,40(a1)
ffffffffc0200e94:	f198                	sd	a4,32(a1)
ffffffffc0200e96:	2685                	addiw	a3,a3,1
ffffffffc0200e98:	d114                	sw	a3,32(a0)
ffffffffc0200e9a:	0141                	addi	sp,sp,16
ffffffffc0200e9c:	8082                	ret
ffffffffc0200e9e:	fca711e3          	bne	a4,a0,ffffffffc0200e60 <insert_vma_struct+0x26>
ffffffffc0200ea2:	bfd9                	j	ffffffffc0200e78 <insert_vma_struct+0x3e>
ffffffffc0200ea4:	ebbff0ef          	jal	ra,ffffffffc0200d5e <check_vma_overlap.isra.0.part.1>
ffffffffc0200ea8:	00009697          	auipc	a3,0x9
ffffffffc0200eac:	8c868693          	addi	a3,a3,-1848 # ffffffffc0209770 <commands+0x968>
ffffffffc0200eb0:	00008617          	auipc	a2,0x8
ffffffffc0200eb4:	3d860613          	addi	a2,a2,984 # ffffffffc0209288 <commands+0x480>
ffffffffc0200eb8:	07400593          	li	a1,116
ffffffffc0200ebc:	00008517          	auipc	a0,0x8
ffffffffc0200ec0:	7a450513          	addi	a0,a0,1956 # ffffffffc0209660 <commands+0x858>
ffffffffc0200ec4:	b54ff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0200ec8:	00009697          	auipc	a3,0x9
ffffffffc0200ecc:	8e868693          	addi	a3,a3,-1816 # ffffffffc02097b0 <commands+0x9a8>
ffffffffc0200ed0:	00008617          	auipc	a2,0x8
ffffffffc0200ed4:	3b860613          	addi	a2,a2,952 # ffffffffc0209288 <commands+0x480>
ffffffffc0200ed8:	06c00593          	li	a1,108
ffffffffc0200edc:	00008517          	auipc	a0,0x8
ffffffffc0200ee0:	78450513          	addi	a0,a0,1924 # ffffffffc0209660 <commands+0x858>
ffffffffc0200ee4:	b34ff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0200ee8:	00009697          	auipc	a3,0x9
ffffffffc0200eec:	8a868693          	addi	a3,a3,-1880 # ffffffffc0209790 <commands+0x988>
ffffffffc0200ef0:	00008617          	auipc	a2,0x8
ffffffffc0200ef4:	39860613          	addi	a2,a2,920 # ffffffffc0209288 <commands+0x480>
ffffffffc0200ef8:	06b00593          	li	a1,107
ffffffffc0200efc:	00008517          	auipc	a0,0x8
ffffffffc0200f00:	76450513          	addi	a0,a0,1892 # ffffffffc0209660 <commands+0x858>
ffffffffc0200f04:	b14ff0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0200f08 <mm_destroy>:
ffffffffc0200f08:	591c                	lw	a5,48(a0)
ffffffffc0200f0a:	1141                	addi	sp,sp,-16
ffffffffc0200f0c:	e406                	sd	ra,8(sp)
ffffffffc0200f0e:	e022                	sd	s0,0(sp)
ffffffffc0200f10:	e78d                	bnez	a5,ffffffffc0200f3a <mm_destroy+0x32>
ffffffffc0200f12:	842a                	mv	s0,a0
ffffffffc0200f14:	6508                	ld	a0,8(a0)
ffffffffc0200f16:	00a40c63          	beq	s0,a0,ffffffffc0200f2e <mm_destroy+0x26>
ffffffffc0200f1a:	6118                	ld	a4,0(a0)
ffffffffc0200f1c:	651c                	ld	a5,8(a0)
ffffffffc0200f1e:	1501                	addi	a0,a0,-32
ffffffffc0200f20:	e71c                	sd	a5,8(a4)
ffffffffc0200f22:	e398                	sd	a4,0(a5)
ffffffffc0200f24:	7ad000ef          	jal	ra,ffffffffc0201ed0 <kfree>
ffffffffc0200f28:	6408                	ld	a0,8(s0)
ffffffffc0200f2a:	fea418e3          	bne	s0,a0,ffffffffc0200f1a <mm_destroy+0x12>
ffffffffc0200f2e:	8522                	mv	a0,s0
ffffffffc0200f30:	6402                	ld	s0,0(sp)
ffffffffc0200f32:	60a2                	ld	ra,8(sp)
ffffffffc0200f34:	0141                	addi	sp,sp,16
ffffffffc0200f36:	79b0006f          	j	ffffffffc0201ed0 <kfree>
ffffffffc0200f3a:	00009697          	auipc	a3,0x9
ffffffffc0200f3e:	89668693          	addi	a3,a3,-1898 # ffffffffc02097d0 <commands+0x9c8>
ffffffffc0200f42:	00008617          	auipc	a2,0x8
ffffffffc0200f46:	34660613          	addi	a2,a2,838 # ffffffffc0209288 <commands+0x480>
ffffffffc0200f4a:	09400593          	li	a1,148
ffffffffc0200f4e:	00008517          	auipc	a0,0x8
ffffffffc0200f52:	71250513          	addi	a0,a0,1810 # ffffffffc0209660 <commands+0x858>
ffffffffc0200f56:	ac2ff0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0200f5a <mm_map>:
ffffffffc0200f5a:	6785                	lui	a5,0x1
ffffffffc0200f5c:	7139                	addi	sp,sp,-64
ffffffffc0200f5e:	17fd                	addi	a5,a5,-1
ffffffffc0200f60:	787d                	lui	a6,0xfffff
ffffffffc0200f62:	f822                	sd	s0,48(sp)
ffffffffc0200f64:	00f60433          	add	s0,a2,a5
ffffffffc0200f68:	f426                	sd	s1,40(sp)
ffffffffc0200f6a:	942e                	add	s0,s0,a1
ffffffffc0200f6c:	fc06                	sd	ra,56(sp)
ffffffffc0200f6e:	f04a                	sd	s2,32(sp)
ffffffffc0200f70:	ec4e                	sd	s3,24(sp)
ffffffffc0200f72:	e852                	sd	s4,16(sp)
ffffffffc0200f74:	e456                	sd	s5,8(sp)
ffffffffc0200f76:	0105f4b3          	and	s1,a1,a6
ffffffffc0200f7a:	002007b7          	lui	a5,0x200
ffffffffc0200f7e:	01047433          	and	s0,s0,a6
ffffffffc0200f82:	06f4e363          	bltu	s1,a5,ffffffffc0200fe8 <mm_map+0x8e>
ffffffffc0200f86:	0684f163          	bgeu	s1,s0,ffffffffc0200fe8 <mm_map+0x8e>
ffffffffc0200f8a:	4785                	li	a5,1
ffffffffc0200f8c:	07fe                	slli	a5,a5,0x1f
ffffffffc0200f8e:	0487ed63          	bltu	a5,s0,ffffffffc0200fe8 <mm_map+0x8e>
ffffffffc0200f92:	89aa                	mv	s3,a0
ffffffffc0200f94:	8a3a                	mv	s4,a4
ffffffffc0200f96:	8ab6                	mv	s5,a3
ffffffffc0200f98:	c931                	beqz	a0,ffffffffc0200fec <mm_map+0x92>
ffffffffc0200f9a:	85a6                	mv	a1,s1
ffffffffc0200f9c:	e61ff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0200fa0:	c501                	beqz	a0,ffffffffc0200fa8 <mm_map+0x4e>
ffffffffc0200fa2:	651c                	ld	a5,8(a0)
ffffffffc0200fa4:	0487e263          	bltu	a5,s0,ffffffffc0200fe8 <mm_map+0x8e>
ffffffffc0200fa8:	03000513          	li	a0,48
ffffffffc0200fac:	669000ef          	jal	ra,ffffffffc0201e14 <kmalloc>
ffffffffc0200fb0:	892a                	mv	s2,a0
ffffffffc0200fb2:	5571                	li	a0,-4
ffffffffc0200fb4:	02090163          	beqz	s2,ffffffffc0200fd6 <mm_map+0x7c>
ffffffffc0200fb8:	854e                	mv	a0,s3
ffffffffc0200fba:	00993423          	sd	s1,8(s2)
ffffffffc0200fbe:	00893823          	sd	s0,16(s2)
ffffffffc0200fc2:	01592c23          	sw	s5,24(s2)
ffffffffc0200fc6:	85ca                	mv	a1,s2
ffffffffc0200fc8:	e73ff0ef          	jal	ra,ffffffffc0200e3a <insert_vma_struct>
ffffffffc0200fcc:	4501                	li	a0,0
ffffffffc0200fce:	000a0463          	beqz	s4,ffffffffc0200fd6 <mm_map+0x7c>
ffffffffc0200fd2:	012a3023          	sd	s2,0(s4)
ffffffffc0200fd6:	70e2                	ld	ra,56(sp)
ffffffffc0200fd8:	7442                	ld	s0,48(sp)
ffffffffc0200fda:	74a2                	ld	s1,40(sp)
ffffffffc0200fdc:	7902                	ld	s2,32(sp)
ffffffffc0200fde:	69e2                	ld	s3,24(sp)
ffffffffc0200fe0:	6a42                	ld	s4,16(sp)
ffffffffc0200fe2:	6aa2                	ld	s5,8(sp)
ffffffffc0200fe4:	6121                	addi	sp,sp,64
ffffffffc0200fe6:	8082                	ret
ffffffffc0200fe8:	5575                	li	a0,-3
ffffffffc0200fea:	b7f5                	j	ffffffffc0200fd6 <mm_map+0x7c>
ffffffffc0200fec:	00008697          	auipc	a3,0x8
ffffffffc0200ff0:	7fc68693          	addi	a3,a3,2044 # ffffffffc02097e8 <commands+0x9e0>
ffffffffc0200ff4:	00008617          	auipc	a2,0x8
ffffffffc0200ff8:	29460613          	addi	a2,a2,660 # ffffffffc0209288 <commands+0x480>
ffffffffc0200ffc:	0a700593          	li	a1,167
ffffffffc0201000:	00008517          	auipc	a0,0x8
ffffffffc0201004:	66050513          	addi	a0,a0,1632 # ffffffffc0209660 <commands+0x858>
ffffffffc0201008:	a10ff0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc020100c <dup_mmap>:
ffffffffc020100c:	7139                	addi	sp,sp,-64
ffffffffc020100e:	fc06                	sd	ra,56(sp)
ffffffffc0201010:	f822                	sd	s0,48(sp)
ffffffffc0201012:	f426                	sd	s1,40(sp)
ffffffffc0201014:	f04a                	sd	s2,32(sp)
ffffffffc0201016:	ec4e                	sd	s3,24(sp)
ffffffffc0201018:	e852                	sd	s4,16(sp)
ffffffffc020101a:	e456                	sd	s5,8(sp)
ffffffffc020101c:	c535                	beqz	a0,ffffffffc0201088 <dup_mmap+0x7c>
ffffffffc020101e:	892a                	mv	s2,a0
ffffffffc0201020:	84ae                	mv	s1,a1
ffffffffc0201022:	842e                	mv	s0,a1
ffffffffc0201024:	e59d                	bnez	a1,ffffffffc0201052 <dup_mmap+0x46>
ffffffffc0201026:	a08d                	j	ffffffffc0201088 <dup_mmap+0x7c>
ffffffffc0201028:	85aa                	mv	a1,a0
ffffffffc020102a:	0157b423          	sd	s5,8(a5) # 200008 <_binary_obj___user_matrix_out_size+0x1fd6d0>
ffffffffc020102e:	854a                	mv	a0,s2
ffffffffc0201030:	0147b823          	sd	s4,16(a5)
ffffffffc0201034:	0137ac23          	sw	s3,24(a5)
ffffffffc0201038:	e03ff0ef          	jal	ra,ffffffffc0200e3a <insert_vma_struct>
ffffffffc020103c:	ff043683          	ld	a3,-16(s0)
ffffffffc0201040:	fe843603          	ld	a2,-24(s0)
ffffffffc0201044:	6c8c                	ld	a1,24(s1)
ffffffffc0201046:	01893503          	ld	a0,24(s2)
ffffffffc020104a:	4701                	li	a4,0
ffffffffc020104c:	38a030ef          	jal	ra,ffffffffc02043d6 <copy_range>
ffffffffc0201050:	e105                	bnez	a0,ffffffffc0201070 <dup_mmap+0x64>
ffffffffc0201052:	6000                	ld	s0,0(s0)
ffffffffc0201054:	02848863          	beq	s1,s0,ffffffffc0201084 <dup_mmap+0x78>
ffffffffc0201058:	03000513          	li	a0,48
ffffffffc020105c:	fe843a83          	ld	s5,-24(s0)
ffffffffc0201060:	ff043a03          	ld	s4,-16(s0)
ffffffffc0201064:	ff842983          	lw	s3,-8(s0)
ffffffffc0201068:	5ad000ef          	jal	ra,ffffffffc0201e14 <kmalloc>
ffffffffc020106c:	87aa                	mv	a5,a0
ffffffffc020106e:	fd4d                	bnez	a0,ffffffffc0201028 <dup_mmap+0x1c>
ffffffffc0201070:	5571                	li	a0,-4
ffffffffc0201072:	70e2                	ld	ra,56(sp)
ffffffffc0201074:	7442                	ld	s0,48(sp)
ffffffffc0201076:	74a2                	ld	s1,40(sp)
ffffffffc0201078:	7902                	ld	s2,32(sp)
ffffffffc020107a:	69e2                	ld	s3,24(sp)
ffffffffc020107c:	6a42                	ld	s4,16(sp)
ffffffffc020107e:	6aa2                	ld	s5,8(sp)
ffffffffc0201080:	6121                	addi	sp,sp,64
ffffffffc0201082:	8082                	ret
ffffffffc0201084:	4501                	li	a0,0
ffffffffc0201086:	b7f5                	j	ffffffffc0201072 <dup_mmap+0x66>
ffffffffc0201088:	00008697          	auipc	a3,0x8
ffffffffc020108c:	6a868693          	addi	a3,a3,1704 # ffffffffc0209730 <commands+0x928>
ffffffffc0201090:	00008617          	auipc	a2,0x8
ffffffffc0201094:	1f860613          	addi	a2,a2,504 # ffffffffc0209288 <commands+0x480>
ffffffffc0201098:	0c000593          	li	a1,192
ffffffffc020109c:	00008517          	auipc	a0,0x8
ffffffffc02010a0:	5c450513          	addi	a0,a0,1476 # ffffffffc0209660 <commands+0x858>
ffffffffc02010a4:	974ff0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02010a8 <exit_mmap>:
ffffffffc02010a8:	1101                	addi	sp,sp,-32
ffffffffc02010aa:	ec06                	sd	ra,24(sp)
ffffffffc02010ac:	e822                	sd	s0,16(sp)
ffffffffc02010ae:	e426                	sd	s1,8(sp)
ffffffffc02010b0:	e04a                	sd	s2,0(sp)
ffffffffc02010b2:	c531                	beqz	a0,ffffffffc02010fe <exit_mmap+0x56>
ffffffffc02010b4:	591c                	lw	a5,48(a0)
ffffffffc02010b6:	84aa                	mv	s1,a0
ffffffffc02010b8:	e3b9                	bnez	a5,ffffffffc02010fe <exit_mmap+0x56>
ffffffffc02010ba:	6500                	ld	s0,8(a0)
ffffffffc02010bc:	01853903          	ld	s2,24(a0)
ffffffffc02010c0:	02850663          	beq	a0,s0,ffffffffc02010ec <exit_mmap+0x44>
ffffffffc02010c4:	ff043603          	ld	a2,-16(s0)
ffffffffc02010c8:	fe843583          	ld	a1,-24(s0)
ffffffffc02010cc:	854a                	mv	a0,s2
ffffffffc02010ce:	64e020ef          	jal	ra,ffffffffc020371c <unmap_range>
ffffffffc02010d2:	6400                	ld	s0,8(s0)
ffffffffc02010d4:	fe8498e3          	bne	s1,s0,ffffffffc02010c4 <exit_mmap+0x1c>
ffffffffc02010d8:	6400                	ld	s0,8(s0)
ffffffffc02010da:	00848c63          	beq	s1,s0,ffffffffc02010f2 <exit_mmap+0x4a>
ffffffffc02010de:	ff043603          	ld	a2,-16(s0)
ffffffffc02010e2:	fe843583          	ld	a1,-24(s0)
ffffffffc02010e6:	854a                	mv	a0,s2
ffffffffc02010e8:	74c020ef          	jal	ra,ffffffffc0203834 <exit_range>
ffffffffc02010ec:	6400                	ld	s0,8(s0)
ffffffffc02010ee:	fe8498e3          	bne	s1,s0,ffffffffc02010de <exit_mmap+0x36>
ffffffffc02010f2:	60e2                	ld	ra,24(sp)
ffffffffc02010f4:	6442                	ld	s0,16(sp)
ffffffffc02010f6:	64a2                	ld	s1,8(sp)
ffffffffc02010f8:	6902                	ld	s2,0(sp)
ffffffffc02010fa:	6105                	addi	sp,sp,32
ffffffffc02010fc:	8082                	ret
ffffffffc02010fe:	00008697          	auipc	a3,0x8
ffffffffc0201102:	65268693          	addi	a3,a3,1618 # ffffffffc0209750 <commands+0x948>
ffffffffc0201106:	00008617          	auipc	a2,0x8
ffffffffc020110a:	18260613          	addi	a2,a2,386 # ffffffffc0209288 <commands+0x480>
ffffffffc020110e:	0d600593          	li	a1,214
ffffffffc0201112:	00008517          	auipc	a0,0x8
ffffffffc0201116:	54e50513          	addi	a0,a0,1358 # ffffffffc0209660 <commands+0x858>
ffffffffc020111a:	8feff0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc020111e <vmm_init>:
ffffffffc020111e:	7139                	addi	sp,sp,-64
ffffffffc0201120:	f822                	sd	s0,48(sp)
ffffffffc0201122:	f426                	sd	s1,40(sp)
ffffffffc0201124:	fc06                	sd	ra,56(sp)
ffffffffc0201126:	f04a                	sd	s2,32(sp)
ffffffffc0201128:	ec4e                	sd	s3,24(sp)
ffffffffc020112a:	e852                	sd	s4,16(sp)
ffffffffc020112c:	e456                	sd	s5,8(sp)
ffffffffc020112e:	c55ff0ef          	jal	ra,ffffffffc0200d82 <mm_create>
ffffffffc0201132:	842a                	mv	s0,a0
ffffffffc0201134:	03200493          	li	s1,50
ffffffffc0201138:	e919                	bnez	a0,ffffffffc020114e <vmm_init+0x30>
ffffffffc020113a:	aef9                	j	ffffffffc0201518 <vmm_init+0x3fa>
ffffffffc020113c:	e504                	sd	s1,8(a0)
ffffffffc020113e:	e91c                	sd	a5,16(a0)
ffffffffc0201140:	00052c23          	sw	zero,24(a0)
ffffffffc0201144:	14ed                	addi	s1,s1,-5
ffffffffc0201146:	8522                	mv	a0,s0
ffffffffc0201148:	cf3ff0ef          	jal	ra,ffffffffc0200e3a <insert_vma_struct>
ffffffffc020114c:	c88d                	beqz	s1,ffffffffc020117e <vmm_init+0x60>
ffffffffc020114e:	03000513          	li	a0,48
ffffffffc0201152:	4c3000ef          	jal	ra,ffffffffc0201e14 <kmalloc>
ffffffffc0201156:	85aa                	mv	a1,a0
ffffffffc0201158:	00248793          	addi	a5,s1,2
ffffffffc020115c:	f165                	bnez	a0,ffffffffc020113c <vmm_init+0x1e>
ffffffffc020115e:	00009697          	auipc	a3,0x9
ffffffffc0201162:	8e268693          	addi	a3,a3,-1822 # ffffffffc0209a40 <commands+0xc38>
ffffffffc0201166:	00008617          	auipc	a2,0x8
ffffffffc020116a:	12260613          	addi	a2,a2,290 # ffffffffc0209288 <commands+0x480>
ffffffffc020116e:	11300593          	li	a1,275
ffffffffc0201172:	00008517          	auipc	a0,0x8
ffffffffc0201176:	4ee50513          	addi	a0,a0,1262 # ffffffffc0209660 <commands+0x858>
ffffffffc020117a:	89eff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020117e:	03700493          	li	s1,55
ffffffffc0201182:	1f900913          	li	s2,505
ffffffffc0201186:	a819                	j	ffffffffc020119c <vmm_init+0x7e>
ffffffffc0201188:	e504                	sd	s1,8(a0)
ffffffffc020118a:	e91c                	sd	a5,16(a0)
ffffffffc020118c:	00052c23          	sw	zero,24(a0)
ffffffffc0201190:	0495                	addi	s1,s1,5
ffffffffc0201192:	8522                	mv	a0,s0
ffffffffc0201194:	ca7ff0ef          	jal	ra,ffffffffc0200e3a <insert_vma_struct>
ffffffffc0201198:	03248a63          	beq	s1,s2,ffffffffc02011cc <vmm_init+0xae>
ffffffffc020119c:	03000513          	li	a0,48
ffffffffc02011a0:	475000ef          	jal	ra,ffffffffc0201e14 <kmalloc>
ffffffffc02011a4:	85aa                	mv	a1,a0
ffffffffc02011a6:	00248793          	addi	a5,s1,2
ffffffffc02011aa:	fd79                	bnez	a0,ffffffffc0201188 <vmm_init+0x6a>
ffffffffc02011ac:	00009697          	auipc	a3,0x9
ffffffffc02011b0:	89468693          	addi	a3,a3,-1900 # ffffffffc0209a40 <commands+0xc38>
ffffffffc02011b4:	00008617          	auipc	a2,0x8
ffffffffc02011b8:	0d460613          	addi	a2,a2,212 # ffffffffc0209288 <commands+0x480>
ffffffffc02011bc:	11900593          	li	a1,281
ffffffffc02011c0:	00008517          	auipc	a0,0x8
ffffffffc02011c4:	4a050513          	addi	a0,a0,1184 # ffffffffc0209660 <commands+0x858>
ffffffffc02011c8:	850ff0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02011cc:	6418                	ld	a4,8(s0)
ffffffffc02011ce:	479d                	li	a5,7
ffffffffc02011d0:	1fb00593          	li	a1,507
ffffffffc02011d4:	28e40263          	beq	s0,a4,ffffffffc0201458 <vmm_init+0x33a>
ffffffffc02011d8:	fe873603          	ld	a2,-24(a4)
ffffffffc02011dc:	ffe78693          	addi	a3,a5,-2
ffffffffc02011e0:	1ed61c63          	bne	a2,a3,ffffffffc02013d8 <vmm_init+0x2ba>
ffffffffc02011e4:	ff073683          	ld	a3,-16(a4)
ffffffffc02011e8:	1ed79863          	bne	a5,a3,ffffffffc02013d8 <vmm_init+0x2ba>
ffffffffc02011ec:	0795                	addi	a5,a5,5
ffffffffc02011ee:	6718                	ld	a4,8(a4)
ffffffffc02011f0:	feb792e3          	bne	a5,a1,ffffffffc02011d4 <vmm_init+0xb6>
ffffffffc02011f4:	491d                	li	s2,7
ffffffffc02011f6:	4495                	li	s1,5
ffffffffc02011f8:	1f900a93          	li	s5,505
ffffffffc02011fc:	85a6                	mv	a1,s1
ffffffffc02011fe:	8522                	mv	a0,s0
ffffffffc0201200:	bfdff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0201204:	8a2a                	mv	s4,a0
ffffffffc0201206:	2c050963          	beqz	a0,ffffffffc02014d8 <vmm_init+0x3ba>
ffffffffc020120a:	00148593          	addi	a1,s1,1
ffffffffc020120e:	8522                	mv	a0,s0
ffffffffc0201210:	bedff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0201214:	89aa                	mv	s3,a0
ffffffffc0201216:	2a050163          	beqz	a0,ffffffffc02014b8 <vmm_init+0x39a>
ffffffffc020121a:	85ca                	mv	a1,s2
ffffffffc020121c:	8522                	mv	a0,s0
ffffffffc020121e:	bdfff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0201222:	26051b63          	bnez	a0,ffffffffc0201498 <vmm_init+0x37a>
ffffffffc0201226:	00348593          	addi	a1,s1,3
ffffffffc020122a:	8522                	mv	a0,s0
ffffffffc020122c:	bd1ff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0201230:	24051463          	bnez	a0,ffffffffc0201478 <vmm_init+0x35a>
ffffffffc0201234:	00448593          	addi	a1,s1,4
ffffffffc0201238:	8522                	mv	a0,s0
ffffffffc020123a:	bc3ff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc020123e:	2a051d63          	bnez	a0,ffffffffc02014f8 <vmm_init+0x3da>
ffffffffc0201242:	008a3783          	ld	a5,8(s4)
ffffffffc0201246:	1a979963          	bne	a5,s1,ffffffffc02013f8 <vmm_init+0x2da>
ffffffffc020124a:	010a3783          	ld	a5,16(s4)
ffffffffc020124e:	1b279563          	bne	a5,s2,ffffffffc02013f8 <vmm_init+0x2da>
ffffffffc0201252:	0089b783          	ld	a5,8(s3)
ffffffffc0201256:	1c979163          	bne	a5,s1,ffffffffc0201418 <vmm_init+0x2fa>
ffffffffc020125a:	0109b783          	ld	a5,16(s3)
ffffffffc020125e:	1b279d63          	bne	a5,s2,ffffffffc0201418 <vmm_init+0x2fa>
ffffffffc0201262:	0495                	addi	s1,s1,5
ffffffffc0201264:	0915                	addi	s2,s2,5
ffffffffc0201266:	f9549be3          	bne	s1,s5,ffffffffc02011fc <vmm_init+0xde>
ffffffffc020126a:	4491                	li	s1,4
ffffffffc020126c:	597d                	li	s2,-1
ffffffffc020126e:	85a6                	mv	a1,s1
ffffffffc0201270:	8522                	mv	a0,s0
ffffffffc0201272:	b8bff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0201276:	0004859b          	sext.w	a1,s1
ffffffffc020127a:	c90d                	beqz	a0,ffffffffc02012ac <vmm_init+0x18e>
ffffffffc020127c:	6914                	ld	a3,16(a0)
ffffffffc020127e:	6510                	ld	a2,8(a0)
ffffffffc0201280:	00008517          	auipc	a0,0x8
ffffffffc0201284:	67850513          	addi	a0,a0,1656 # ffffffffc02098f8 <commands+0xaf0>
ffffffffc0201288:	e4dfe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020128c:	00008697          	auipc	a3,0x8
ffffffffc0201290:	69468693          	addi	a3,a3,1684 # ffffffffc0209920 <commands+0xb18>
ffffffffc0201294:	00008617          	auipc	a2,0x8
ffffffffc0201298:	ff460613          	addi	a2,a2,-12 # ffffffffc0209288 <commands+0x480>
ffffffffc020129c:	13b00593          	li	a1,315
ffffffffc02012a0:	00008517          	auipc	a0,0x8
ffffffffc02012a4:	3c050513          	addi	a0,a0,960 # ffffffffc0209660 <commands+0x858>
ffffffffc02012a8:	f71fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02012ac:	14fd                	addi	s1,s1,-1
ffffffffc02012ae:	fd2490e3          	bne	s1,s2,ffffffffc020126e <vmm_init+0x150>
ffffffffc02012b2:	8522                	mv	a0,s0
ffffffffc02012b4:	c55ff0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc02012b8:	00008517          	auipc	a0,0x8
ffffffffc02012bc:	68050513          	addi	a0,a0,1664 # ffffffffc0209938 <commands+0xb30>
ffffffffc02012c0:	e15fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02012c4:	1ee020ef          	jal	ra,ffffffffc02034b2 <nr_free_pages>
ffffffffc02012c8:	892a                	mv	s2,a0
ffffffffc02012ca:	ab9ff0ef          	jal	ra,ffffffffc0200d82 <mm_create>
ffffffffc02012ce:	0003c797          	auipc	a5,0x3c
ffffffffc02012d2:	bea7b523          	sd	a0,-1046(a5) # ffffffffc023ceb8 <check_mm_struct>
ffffffffc02012d6:	842a                	mv	s0,a0
ffffffffc02012d8:	2a050063          	beqz	a0,ffffffffc0201578 <vmm_init+0x45a>
ffffffffc02012dc:	0003c797          	auipc	a5,0x3c
ffffffffc02012e0:	b9478793          	addi	a5,a5,-1132 # ffffffffc023ce70 <boot_pgdir>
ffffffffc02012e4:	6384                	ld	s1,0(a5)
ffffffffc02012e6:	609c                	ld	a5,0(s1)
ffffffffc02012e8:	ed04                	sd	s1,24(a0)
ffffffffc02012ea:	24079763          	bnez	a5,ffffffffc0201538 <vmm_init+0x41a>
ffffffffc02012ee:	03000513          	li	a0,48
ffffffffc02012f2:	323000ef          	jal	ra,ffffffffc0201e14 <kmalloc>
ffffffffc02012f6:	89aa                	mv	s3,a0
ffffffffc02012f8:	14050063          	beqz	a0,ffffffffc0201438 <vmm_init+0x31a>
ffffffffc02012fc:	002007b7          	lui	a5,0x200
ffffffffc0201300:	00f9b823          	sd	a5,16(s3)
ffffffffc0201304:	4789                	li	a5,2
ffffffffc0201306:	85aa                	mv	a1,a0
ffffffffc0201308:	00f9ac23          	sw	a5,24(s3)
ffffffffc020130c:	8522                	mv	a0,s0
ffffffffc020130e:	0009b423          	sd	zero,8(s3)
ffffffffc0201312:	b29ff0ef          	jal	ra,ffffffffc0200e3a <insert_vma_struct>
ffffffffc0201316:	10000593          	li	a1,256
ffffffffc020131a:	8522                	mv	a0,s0
ffffffffc020131c:	ae1ff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0201320:	10000793          	li	a5,256
ffffffffc0201324:	16400713          	li	a4,356
ffffffffc0201328:	26a99863          	bne	s3,a0,ffffffffc0201598 <vmm_init+0x47a>
ffffffffc020132c:	00f78023          	sb	a5,0(a5) # 200000 <_binary_obj___user_matrix_out_size+0x1fd6c8>
ffffffffc0201330:	0785                	addi	a5,a5,1
ffffffffc0201332:	fee79de3          	bne	a5,a4,ffffffffc020132c <vmm_init+0x20e>
ffffffffc0201336:	6705                	lui	a4,0x1
ffffffffc0201338:	10000793          	li	a5,256
ffffffffc020133c:	35670713          	addi	a4,a4,854 # 1356 <_binary_obj___user_faultread_out_size-0xa02>
ffffffffc0201340:	16400613          	li	a2,356
ffffffffc0201344:	0007c683          	lbu	a3,0(a5)
ffffffffc0201348:	0785                	addi	a5,a5,1
ffffffffc020134a:	9f15                	subw	a4,a4,a3
ffffffffc020134c:	fec79ce3          	bne	a5,a2,ffffffffc0201344 <vmm_init+0x226>
ffffffffc0201350:	28071063          	bnez	a4,ffffffffc02015d0 <vmm_init+0x4b2>
ffffffffc0201354:	4581                	li	a1,0
ffffffffc0201356:	8526                	mv	a0,s1
ffffffffc0201358:	5dc020ef          	jal	ra,ffffffffc0203934 <page_remove>
ffffffffc020135c:	609c                	ld	a5,0(s1)
ffffffffc020135e:	0003c717          	auipc	a4,0x3c
ffffffffc0201362:	b1a70713          	addi	a4,a4,-1254 # ffffffffc023ce78 <npage>
ffffffffc0201366:	6318                	ld	a4,0(a4)
ffffffffc0201368:	078a                	slli	a5,a5,0x2
ffffffffc020136a:	83b1                	srli	a5,a5,0xc
ffffffffc020136c:	24e7f663          	bgeu	a5,a4,ffffffffc02015b8 <vmm_init+0x49a>
ffffffffc0201370:	0000a717          	auipc	a4,0xa
ffffffffc0201374:	74070713          	addi	a4,a4,1856 # ffffffffc020bab0 <nbase>
ffffffffc0201378:	6318                	ld	a4,0(a4)
ffffffffc020137a:	0003c697          	auipc	a3,0x3c
ffffffffc020137e:	c4e68693          	addi	a3,a3,-946 # ffffffffc023cfc8 <pages>
ffffffffc0201382:	6288                	ld	a0,0(a3)
ffffffffc0201384:	8f99                	sub	a5,a5,a4
ffffffffc0201386:	079a                	slli	a5,a5,0x6
ffffffffc0201388:	953e                	add	a0,a0,a5
ffffffffc020138a:	4585                	li	a1,1
ffffffffc020138c:	0e0020ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0201390:	0004b023          	sd	zero,0(s1)
ffffffffc0201394:	8522                	mv	a0,s0
ffffffffc0201396:	00043c23          	sd	zero,24(s0)
ffffffffc020139a:	b6fff0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc020139e:	197d                	addi	s2,s2,-1
ffffffffc02013a0:	0003c797          	auipc	a5,0x3c
ffffffffc02013a4:	b007bc23          	sd	zero,-1256(a5) # ffffffffc023ceb8 <check_mm_struct>
ffffffffc02013a8:	10a020ef          	jal	ra,ffffffffc02034b2 <nr_free_pages>
ffffffffc02013ac:	1aa91663          	bne	s2,a0,ffffffffc0201558 <vmm_init+0x43a>
ffffffffc02013b0:	00008517          	auipc	a0,0x8
ffffffffc02013b4:	65850513          	addi	a0,a0,1624 # ffffffffc0209a08 <commands+0xc00>
ffffffffc02013b8:	d1dfe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02013bc:	7442                	ld	s0,48(sp)
ffffffffc02013be:	70e2                	ld	ra,56(sp)
ffffffffc02013c0:	74a2                	ld	s1,40(sp)
ffffffffc02013c2:	7902                	ld	s2,32(sp)
ffffffffc02013c4:	69e2                	ld	s3,24(sp)
ffffffffc02013c6:	6a42                	ld	s4,16(sp)
ffffffffc02013c8:	6aa2                	ld	s5,8(sp)
ffffffffc02013ca:	00008517          	auipc	a0,0x8
ffffffffc02013ce:	65e50513          	addi	a0,a0,1630 # ffffffffc0209a28 <commands+0xc20>
ffffffffc02013d2:	6121                	addi	sp,sp,64
ffffffffc02013d4:	d01fe06f          	j	ffffffffc02000d4 <cprintf>
ffffffffc02013d8:	00008697          	auipc	a3,0x8
ffffffffc02013dc:	43868693          	addi	a3,a3,1080 # ffffffffc0209810 <commands+0xa08>
ffffffffc02013e0:	00008617          	auipc	a2,0x8
ffffffffc02013e4:	ea860613          	addi	a2,a2,-344 # ffffffffc0209288 <commands+0x480>
ffffffffc02013e8:	12200593          	li	a1,290
ffffffffc02013ec:	00008517          	auipc	a0,0x8
ffffffffc02013f0:	27450513          	addi	a0,a0,628 # ffffffffc0209660 <commands+0x858>
ffffffffc02013f4:	e25fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02013f8:	00008697          	auipc	a3,0x8
ffffffffc02013fc:	4a068693          	addi	a3,a3,1184 # ffffffffc0209898 <commands+0xa90>
ffffffffc0201400:	00008617          	auipc	a2,0x8
ffffffffc0201404:	e8860613          	addi	a2,a2,-376 # ffffffffc0209288 <commands+0x480>
ffffffffc0201408:	13200593          	li	a1,306
ffffffffc020140c:	00008517          	auipc	a0,0x8
ffffffffc0201410:	25450513          	addi	a0,a0,596 # ffffffffc0209660 <commands+0x858>
ffffffffc0201414:	e05fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201418:	00008697          	auipc	a3,0x8
ffffffffc020141c:	4b068693          	addi	a3,a3,1200 # ffffffffc02098c8 <commands+0xac0>
ffffffffc0201420:	00008617          	auipc	a2,0x8
ffffffffc0201424:	e6860613          	addi	a2,a2,-408 # ffffffffc0209288 <commands+0x480>
ffffffffc0201428:	13300593          	li	a1,307
ffffffffc020142c:	00008517          	auipc	a0,0x8
ffffffffc0201430:	23450513          	addi	a0,a0,564 # ffffffffc0209660 <commands+0x858>
ffffffffc0201434:	de5fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201438:	00008697          	auipc	a3,0x8
ffffffffc020143c:	60868693          	addi	a3,a3,1544 # ffffffffc0209a40 <commands+0xc38>
ffffffffc0201440:	00008617          	auipc	a2,0x8
ffffffffc0201444:	e4860613          	addi	a2,a2,-440 # ffffffffc0209288 <commands+0x480>
ffffffffc0201448:	15200593          	li	a1,338
ffffffffc020144c:	00008517          	auipc	a0,0x8
ffffffffc0201450:	21450513          	addi	a0,a0,532 # ffffffffc0209660 <commands+0x858>
ffffffffc0201454:	dc5fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201458:	00008697          	auipc	a3,0x8
ffffffffc020145c:	3a068693          	addi	a3,a3,928 # ffffffffc02097f8 <commands+0x9f0>
ffffffffc0201460:	00008617          	auipc	a2,0x8
ffffffffc0201464:	e2860613          	addi	a2,a2,-472 # ffffffffc0209288 <commands+0x480>
ffffffffc0201468:	12000593          	li	a1,288
ffffffffc020146c:	00008517          	auipc	a0,0x8
ffffffffc0201470:	1f450513          	addi	a0,a0,500 # ffffffffc0209660 <commands+0x858>
ffffffffc0201474:	da5fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201478:	00008697          	auipc	a3,0x8
ffffffffc020147c:	40068693          	addi	a3,a3,1024 # ffffffffc0209878 <commands+0xa70>
ffffffffc0201480:	00008617          	auipc	a2,0x8
ffffffffc0201484:	e0860613          	addi	a2,a2,-504 # ffffffffc0209288 <commands+0x480>
ffffffffc0201488:	12e00593          	li	a1,302
ffffffffc020148c:	00008517          	auipc	a0,0x8
ffffffffc0201490:	1d450513          	addi	a0,a0,468 # ffffffffc0209660 <commands+0x858>
ffffffffc0201494:	d85fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201498:	00008697          	auipc	a3,0x8
ffffffffc020149c:	3d068693          	addi	a3,a3,976 # ffffffffc0209868 <commands+0xa60>
ffffffffc02014a0:	00008617          	auipc	a2,0x8
ffffffffc02014a4:	de860613          	addi	a2,a2,-536 # ffffffffc0209288 <commands+0x480>
ffffffffc02014a8:	12c00593          	li	a1,300
ffffffffc02014ac:	00008517          	auipc	a0,0x8
ffffffffc02014b0:	1b450513          	addi	a0,a0,436 # ffffffffc0209660 <commands+0x858>
ffffffffc02014b4:	d65fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02014b8:	00008697          	auipc	a3,0x8
ffffffffc02014bc:	3a068693          	addi	a3,a3,928 # ffffffffc0209858 <commands+0xa50>
ffffffffc02014c0:	00008617          	auipc	a2,0x8
ffffffffc02014c4:	dc860613          	addi	a2,a2,-568 # ffffffffc0209288 <commands+0x480>
ffffffffc02014c8:	12a00593          	li	a1,298
ffffffffc02014cc:	00008517          	auipc	a0,0x8
ffffffffc02014d0:	19450513          	addi	a0,a0,404 # ffffffffc0209660 <commands+0x858>
ffffffffc02014d4:	d45fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02014d8:	00008697          	auipc	a3,0x8
ffffffffc02014dc:	37068693          	addi	a3,a3,880 # ffffffffc0209848 <commands+0xa40>
ffffffffc02014e0:	00008617          	auipc	a2,0x8
ffffffffc02014e4:	da860613          	addi	a2,a2,-600 # ffffffffc0209288 <commands+0x480>
ffffffffc02014e8:	12800593          	li	a1,296
ffffffffc02014ec:	00008517          	auipc	a0,0x8
ffffffffc02014f0:	17450513          	addi	a0,a0,372 # ffffffffc0209660 <commands+0x858>
ffffffffc02014f4:	d25fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02014f8:	00008697          	auipc	a3,0x8
ffffffffc02014fc:	39068693          	addi	a3,a3,912 # ffffffffc0209888 <commands+0xa80>
ffffffffc0201500:	00008617          	auipc	a2,0x8
ffffffffc0201504:	d8860613          	addi	a2,a2,-632 # ffffffffc0209288 <commands+0x480>
ffffffffc0201508:	13000593          	li	a1,304
ffffffffc020150c:	00008517          	auipc	a0,0x8
ffffffffc0201510:	15450513          	addi	a0,a0,340 # ffffffffc0209660 <commands+0x858>
ffffffffc0201514:	d05fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201518:	00008697          	auipc	a3,0x8
ffffffffc020151c:	2d068693          	addi	a3,a3,720 # ffffffffc02097e8 <commands+0x9e0>
ffffffffc0201520:	00008617          	auipc	a2,0x8
ffffffffc0201524:	d6860613          	addi	a2,a2,-664 # ffffffffc0209288 <commands+0x480>
ffffffffc0201528:	10c00593          	li	a1,268
ffffffffc020152c:	00008517          	auipc	a0,0x8
ffffffffc0201530:	13450513          	addi	a0,a0,308 # ffffffffc0209660 <commands+0x858>
ffffffffc0201534:	ce5fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201538:	00008697          	auipc	a3,0x8
ffffffffc020153c:	43868693          	addi	a3,a3,1080 # ffffffffc0209970 <commands+0xb68>
ffffffffc0201540:	00008617          	auipc	a2,0x8
ffffffffc0201544:	d4860613          	addi	a2,a2,-696 # ffffffffc0209288 <commands+0x480>
ffffffffc0201548:	14f00593          	li	a1,335
ffffffffc020154c:	00008517          	auipc	a0,0x8
ffffffffc0201550:	11450513          	addi	a0,a0,276 # ffffffffc0209660 <commands+0x858>
ffffffffc0201554:	cc5fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201558:	00008697          	auipc	a3,0x8
ffffffffc020155c:	48868693          	addi	a3,a3,1160 # ffffffffc02099e0 <commands+0xbd8>
ffffffffc0201560:	00008617          	auipc	a2,0x8
ffffffffc0201564:	d2860613          	addi	a2,a2,-728 # ffffffffc0209288 <commands+0x480>
ffffffffc0201568:	16e00593          	li	a1,366
ffffffffc020156c:	00008517          	auipc	a0,0x8
ffffffffc0201570:	0f450513          	addi	a0,a0,244 # ffffffffc0209660 <commands+0x858>
ffffffffc0201574:	ca5fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201578:	00008697          	auipc	a3,0x8
ffffffffc020157c:	3e068693          	addi	a3,a3,992 # ffffffffc0209958 <commands+0xb50>
ffffffffc0201580:	00008617          	auipc	a2,0x8
ffffffffc0201584:	d0860613          	addi	a2,a2,-760 # ffffffffc0209288 <commands+0x480>
ffffffffc0201588:	14b00593          	li	a1,331
ffffffffc020158c:	00008517          	auipc	a0,0x8
ffffffffc0201590:	0d450513          	addi	a0,a0,212 # ffffffffc0209660 <commands+0x858>
ffffffffc0201594:	c85fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201598:	00008697          	auipc	a3,0x8
ffffffffc020159c:	3e868693          	addi	a3,a3,1000 # ffffffffc0209980 <commands+0xb78>
ffffffffc02015a0:	00008617          	auipc	a2,0x8
ffffffffc02015a4:	ce860613          	addi	a2,a2,-792 # ffffffffc0209288 <commands+0x480>
ffffffffc02015a8:	15700593          	li	a1,343
ffffffffc02015ac:	00008517          	auipc	a0,0x8
ffffffffc02015b0:	0b450513          	addi	a0,a0,180 # ffffffffc0209660 <commands+0x858>
ffffffffc02015b4:	c65fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02015b8:	00008617          	auipc	a2,0x8
ffffffffc02015bc:	3f860613          	addi	a2,a2,1016 # ffffffffc02099b0 <commands+0xba8>
ffffffffc02015c0:	06200593          	li	a1,98
ffffffffc02015c4:	00008517          	auipc	a0,0x8
ffffffffc02015c8:	40c50513          	addi	a0,a0,1036 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02015cc:	c4dfe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02015d0:	00008697          	auipc	a3,0x8
ffffffffc02015d4:	3d068693          	addi	a3,a3,976 # ffffffffc02099a0 <commands+0xb98>
ffffffffc02015d8:	00008617          	auipc	a2,0x8
ffffffffc02015dc:	cb060613          	addi	a2,a2,-848 # ffffffffc0209288 <commands+0x480>
ffffffffc02015e0:	16300593          	li	a1,355
ffffffffc02015e4:	00008517          	auipc	a0,0x8
ffffffffc02015e8:	07c50513          	addi	a0,a0,124 # ffffffffc0209660 <commands+0x858>
ffffffffc02015ec:	c2dfe0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02015f0 <do_pgfault>:
ffffffffc02015f0:	7139                	addi	sp,sp,-64
ffffffffc02015f2:	85b2                	mv	a1,a2
ffffffffc02015f4:	f822                	sd	s0,48(sp)
ffffffffc02015f6:	f426                	sd	s1,40(sp)
ffffffffc02015f8:	fc06                	sd	ra,56(sp)
ffffffffc02015fa:	f04a                	sd	s2,32(sp)
ffffffffc02015fc:	ec4e                	sd	s3,24(sp)
ffffffffc02015fe:	8432                	mv	s0,a2
ffffffffc0201600:	84aa                	mv	s1,a0
ffffffffc0201602:	ffaff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0201606:	0003c797          	auipc	a5,0x3c
ffffffffc020160a:	84a78793          	addi	a5,a5,-1974 # ffffffffc023ce50 <pgfault_num>
ffffffffc020160e:	439c                	lw	a5,0(a5)
ffffffffc0201610:	2785                	addiw	a5,a5,1
ffffffffc0201612:	0003c717          	auipc	a4,0x3c
ffffffffc0201616:	82f72f23          	sw	a5,-1986(a4) # ffffffffc023ce50 <pgfault_num>
ffffffffc020161a:	c555                	beqz	a0,ffffffffc02016c6 <do_pgfault+0xd6>
ffffffffc020161c:	651c                	ld	a5,8(a0)
ffffffffc020161e:	0af46463          	bltu	s0,a5,ffffffffc02016c6 <do_pgfault+0xd6>
ffffffffc0201622:	4d1c                	lw	a5,24(a0)
ffffffffc0201624:	49c1                	li	s3,16
ffffffffc0201626:	8b89                	andi	a5,a5,2
ffffffffc0201628:	e3a5                	bnez	a5,ffffffffc0201688 <do_pgfault+0x98>
ffffffffc020162a:	767d                	lui	a2,0xfffff
ffffffffc020162c:	6c88                	ld	a0,24(s1)
ffffffffc020162e:	8c71                	and	s0,s0,a2
ffffffffc0201630:	85a2                	mv	a1,s0
ffffffffc0201632:	4605                	li	a2,1
ffffffffc0201634:	6bf010ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0201638:	c945                	beqz	a0,ffffffffc02016e8 <do_pgfault+0xf8>
ffffffffc020163a:	610c                	ld	a1,0(a0)
ffffffffc020163c:	c5b5                	beqz	a1,ffffffffc02016a8 <do_pgfault+0xb8>
ffffffffc020163e:	0003c797          	auipc	a5,0x3c
ffffffffc0201642:	82a78793          	addi	a5,a5,-2006 # ffffffffc023ce68 <swap_init_ok>
ffffffffc0201646:	439c                	lw	a5,0(a5)
ffffffffc0201648:	2781                	sext.w	a5,a5
ffffffffc020164a:	c7d9                	beqz	a5,ffffffffc02016d8 <do_pgfault+0xe8>
ffffffffc020164c:	0030                	addi	a2,sp,8
ffffffffc020164e:	85a2                	mv	a1,s0
ffffffffc0201650:	8526                	mv	a0,s1
ffffffffc0201652:	e402                	sd	zero,8(sp)
ffffffffc0201654:	1ac010ef          	jal	ra,ffffffffc0202800 <swap_in>
ffffffffc0201658:	892a                	mv	s2,a0
ffffffffc020165a:	e90d                	bnez	a0,ffffffffc020168c <do_pgfault+0x9c>
ffffffffc020165c:	65a2                	ld	a1,8(sp)
ffffffffc020165e:	6c88                	ld	a0,24(s1)
ffffffffc0201660:	86ce                	mv	a3,s3
ffffffffc0201662:	8622                	mv	a2,s0
ffffffffc0201664:	344020ef          	jal	ra,ffffffffc02039a8 <page_insert>
ffffffffc0201668:	6622                	ld	a2,8(sp)
ffffffffc020166a:	4685                	li	a3,1
ffffffffc020166c:	85a2                	mv	a1,s0
ffffffffc020166e:	8526                	mv	a0,s1
ffffffffc0201670:	06c010ef          	jal	ra,ffffffffc02026dc <swap_map_swappable>
ffffffffc0201674:	67a2                	ld	a5,8(sp)
ffffffffc0201676:	ff80                	sd	s0,56(a5)
ffffffffc0201678:	70e2                	ld	ra,56(sp)
ffffffffc020167a:	7442                	ld	s0,48(sp)
ffffffffc020167c:	854a                	mv	a0,s2
ffffffffc020167e:	74a2                	ld	s1,40(sp)
ffffffffc0201680:	7902                	ld	s2,32(sp)
ffffffffc0201682:	69e2                	ld	s3,24(sp)
ffffffffc0201684:	6121                	addi	sp,sp,64
ffffffffc0201686:	8082                	ret
ffffffffc0201688:	49dd                	li	s3,23
ffffffffc020168a:	b745                	j	ffffffffc020162a <do_pgfault+0x3a>
ffffffffc020168c:	00008517          	auipc	a0,0x8
ffffffffc0201690:	05c50513          	addi	a0,a0,92 # ffffffffc02096e8 <commands+0x8e0>
ffffffffc0201694:	a41fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0201698:	70e2                	ld	ra,56(sp)
ffffffffc020169a:	7442                	ld	s0,48(sp)
ffffffffc020169c:	854a                	mv	a0,s2
ffffffffc020169e:	74a2                	ld	s1,40(sp)
ffffffffc02016a0:	7902                	ld	s2,32(sp)
ffffffffc02016a2:	69e2                	ld	s3,24(sp)
ffffffffc02016a4:	6121                	addi	sp,sp,64
ffffffffc02016a6:	8082                	ret
ffffffffc02016a8:	6c88                	ld	a0,24(s1)
ffffffffc02016aa:	864e                	mv	a2,s3
ffffffffc02016ac:	85a2                	mv	a1,s0
ffffffffc02016ae:	763020ef          	jal	ra,ffffffffc0204610 <pgdir_alloc_page>
ffffffffc02016b2:	4901                	li	s2,0
ffffffffc02016b4:	f171                	bnez	a0,ffffffffc0201678 <do_pgfault+0x88>
ffffffffc02016b6:	00008517          	auipc	a0,0x8
ffffffffc02016ba:	00a50513          	addi	a0,a0,10 # ffffffffc02096c0 <commands+0x8b8>
ffffffffc02016be:	a17fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02016c2:	5971                	li	s2,-4
ffffffffc02016c4:	bf55                	j	ffffffffc0201678 <do_pgfault+0x88>
ffffffffc02016c6:	85a2                	mv	a1,s0
ffffffffc02016c8:	00008517          	auipc	a0,0x8
ffffffffc02016cc:	fa850513          	addi	a0,a0,-88 # ffffffffc0209670 <commands+0x868>
ffffffffc02016d0:	a05fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02016d4:	5975                	li	s2,-3
ffffffffc02016d6:	b74d                	j	ffffffffc0201678 <do_pgfault+0x88>
ffffffffc02016d8:	00008517          	auipc	a0,0x8
ffffffffc02016dc:	03050513          	addi	a0,a0,48 # ffffffffc0209708 <commands+0x900>
ffffffffc02016e0:	9f5fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02016e4:	5971                	li	s2,-4
ffffffffc02016e6:	bf49                	j	ffffffffc0201678 <do_pgfault+0x88>
ffffffffc02016e8:	00008517          	auipc	a0,0x8
ffffffffc02016ec:	fb850513          	addi	a0,a0,-72 # ffffffffc02096a0 <commands+0x898>
ffffffffc02016f0:	9e5fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02016f4:	5971                	li	s2,-4
ffffffffc02016f6:	b749                	j	ffffffffc0201678 <do_pgfault+0x88>

ffffffffc02016f8 <user_mem_check>:
ffffffffc02016f8:	7179                	addi	sp,sp,-48
ffffffffc02016fa:	f022                	sd	s0,32(sp)
ffffffffc02016fc:	f406                	sd	ra,40(sp)
ffffffffc02016fe:	ec26                	sd	s1,24(sp)
ffffffffc0201700:	e84a                	sd	s2,16(sp)
ffffffffc0201702:	e44e                	sd	s3,8(sp)
ffffffffc0201704:	e052                	sd	s4,0(sp)
ffffffffc0201706:	842e                	mv	s0,a1
ffffffffc0201708:	c135                	beqz	a0,ffffffffc020176c <user_mem_check+0x74>
ffffffffc020170a:	002007b7          	lui	a5,0x200
ffffffffc020170e:	04f5e663          	bltu	a1,a5,ffffffffc020175a <user_mem_check+0x62>
ffffffffc0201712:	00c584b3          	add	s1,a1,a2
ffffffffc0201716:	0495f263          	bgeu	a1,s1,ffffffffc020175a <user_mem_check+0x62>
ffffffffc020171a:	4785                	li	a5,1
ffffffffc020171c:	07fe                	slli	a5,a5,0x1f
ffffffffc020171e:	0297ee63          	bltu	a5,s1,ffffffffc020175a <user_mem_check+0x62>
ffffffffc0201722:	892a                	mv	s2,a0
ffffffffc0201724:	89b6                	mv	s3,a3
ffffffffc0201726:	6a05                	lui	s4,0x1
ffffffffc0201728:	a821                	j	ffffffffc0201740 <user_mem_check+0x48>
ffffffffc020172a:	0027f693          	andi	a3,a5,2
ffffffffc020172e:	9752                	add	a4,a4,s4
ffffffffc0201730:	8ba1                	andi	a5,a5,8
ffffffffc0201732:	c685                	beqz	a3,ffffffffc020175a <user_mem_check+0x62>
ffffffffc0201734:	c399                	beqz	a5,ffffffffc020173a <user_mem_check+0x42>
ffffffffc0201736:	02e46263          	bltu	s0,a4,ffffffffc020175a <user_mem_check+0x62>
ffffffffc020173a:	6900                	ld	s0,16(a0)
ffffffffc020173c:	04947663          	bgeu	s0,s1,ffffffffc0201788 <user_mem_check+0x90>
ffffffffc0201740:	85a2                	mv	a1,s0
ffffffffc0201742:	854a                	mv	a0,s2
ffffffffc0201744:	eb8ff0ef          	jal	ra,ffffffffc0200dfc <find_vma>
ffffffffc0201748:	c909                	beqz	a0,ffffffffc020175a <user_mem_check+0x62>
ffffffffc020174a:	6518                	ld	a4,8(a0)
ffffffffc020174c:	00e46763          	bltu	s0,a4,ffffffffc020175a <user_mem_check+0x62>
ffffffffc0201750:	4d1c                	lw	a5,24(a0)
ffffffffc0201752:	fc099ce3          	bnez	s3,ffffffffc020172a <user_mem_check+0x32>
ffffffffc0201756:	8b85                	andi	a5,a5,1
ffffffffc0201758:	f3ed                	bnez	a5,ffffffffc020173a <user_mem_check+0x42>
ffffffffc020175a:	4501                	li	a0,0
ffffffffc020175c:	70a2                	ld	ra,40(sp)
ffffffffc020175e:	7402                	ld	s0,32(sp)
ffffffffc0201760:	64e2                	ld	s1,24(sp)
ffffffffc0201762:	6942                	ld	s2,16(sp)
ffffffffc0201764:	69a2                	ld	s3,8(sp)
ffffffffc0201766:	6a02                	ld	s4,0(sp)
ffffffffc0201768:	6145                	addi	sp,sp,48
ffffffffc020176a:	8082                	ret
ffffffffc020176c:	c02007b7          	lui	a5,0xc0200
ffffffffc0201770:	4501                	li	a0,0
ffffffffc0201772:	fef5e5e3          	bltu	a1,a5,ffffffffc020175c <user_mem_check+0x64>
ffffffffc0201776:	962e                	add	a2,a2,a1
ffffffffc0201778:	fec5f2e3          	bgeu	a1,a2,ffffffffc020175c <user_mem_check+0x64>
ffffffffc020177c:	c8000537          	lui	a0,0xc8000
ffffffffc0201780:	0505                	addi	a0,a0,1
ffffffffc0201782:	00a63533          	sltu	a0,a2,a0
ffffffffc0201786:	bfd9                	j	ffffffffc020175c <user_mem_check+0x64>
ffffffffc0201788:	4505                	li	a0,1
ffffffffc020178a:	bfc9                	j	ffffffffc020175c <user_mem_check+0x64>

ffffffffc020178c <_fifo_init_mm>:
ffffffffc020178c:	0003b797          	auipc	a5,0x3b
ffffffffc0201790:	73478793          	addi	a5,a5,1844 # ffffffffc023cec0 <pra_list_head>
ffffffffc0201794:	f51c                	sd	a5,40(a0)
ffffffffc0201796:	e79c                	sd	a5,8(a5)
ffffffffc0201798:	e39c                	sd	a5,0(a5)
ffffffffc020179a:	4501                	li	a0,0
ffffffffc020179c:	8082                	ret

ffffffffc020179e <_fifo_init>:
ffffffffc020179e:	4501                	li	a0,0
ffffffffc02017a0:	8082                	ret

ffffffffc02017a2 <_fifo_set_unswappable>:
ffffffffc02017a2:	4501                	li	a0,0
ffffffffc02017a4:	8082                	ret

ffffffffc02017a6 <_fifo_tick_event>:
ffffffffc02017a6:	4501                	li	a0,0
ffffffffc02017a8:	8082                	ret

ffffffffc02017aa <_fifo_check_swap>:
ffffffffc02017aa:	711d                	addi	sp,sp,-96
ffffffffc02017ac:	fc4e                	sd	s3,56(sp)
ffffffffc02017ae:	f852                	sd	s4,48(sp)
ffffffffc02017b0:	00008517          	auipc	a0,0x8
ffffffffc02017b4:	2a050513          	addi	a0,a0,672 # ffffffffc0209a50 <commands+0xc48>
ffffffffc02017b8:	698d                	lui	s3,0x3
ffffffffc02017ba:	4a31                	li	s4,12
ffffffffc02017bc:	e8a2                	sd	s0,80(sp)
ffffffffc02017be:	e4a6                	sd	s1,72(sp)
ffffffffc02017c0:	ec86                	sd	ra,88(sp)
ffffffffc02017c2:	e0ca                	sd	s2,64(sp)
ffffffffc02017c4:	f456                	sd	s5,40(sp)
ffffffffc02017c6:	f05a                	sd	s6,32(sp)
ffffffffc02017c8:	ec5e                	sd	s7,24(sp)
ffffffffc02017ca:	e862                	sd	s8,16(sp)
ffffffffc02017cc:	e466                	sd	s9,8(sp)
ffffffffc02017ce:	0003b417          	auipc	s0,0x3b
ffffffffc02017d2:	68240413          	addi	s0,s0,1666 # ffffffffc023ce50 <pgfault_num>
ffffffffc02017d6:	8fffe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02017da:	01498023          	sb	s4,0(s3) # 3000 <_binary_obj___user_matrix_out_size+0x6c8>
ffffffffc02017de:	4004                	lw	s1,0(s0)
ffffffffc02017e0:	4791                	li	a5,4
ffffffffc02017e2:	2481                	sext.w	s1,s1
ffffffffc02017e4:	14f49963          	bne	s1,a5,ffffffffc0201936 <_fifo_check_swap+0x18c>
ffffffffc02017e8:	00008517          	auipc	a0,0x8
ffffffffc02017ec:	2b850513          	addi	a0,a0,696 # ffffffffc0209aa0 <commands+0xc98>
ffffffffc02017f0:	6a85                	lui	s5,0x1
ffffffffc02017f2:	4b29                	li	s6,10
ffffffffc02017f4:	8e1fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02017f8:	016a8023          	sb	s6,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc02017fc:	00042903          	lw	s2,0(s0)
ffffffffc0201800:	2901                	sext.w	s2,s2
ffffffffc0201802:	2a991a63          	bne	s2,s1,ffffffffc0201ab6 <_fifo_check_swap+0x30c>
ffffffffc0201806:	00008517          	auipc	a0,0x8
ffffffffc020180a:	2c250513          	addi	a0,a0,706 # ffffffffc0209ac8 <commands+0xcc0>
ffffffffc020180e:	6b91                	lui	s7,0x4
ffffffffc0201810:	4c35                	li	s8,13
ffffffffc0201812:	8c3fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0201816:	018b8023          	sb	s8,0(s7) # 4000 <_binary_obj___user_matrix_out_size+0x16c8>
ffffffffc020181a:	4004                	lw	s1,0(s0)
ffffffffc020181c:	2481                	sext.w	s1,s1
ffffffffc020181e:	27249c63          	bne	s1,s2,ffffffffc0201a96 <_fifo_check_swap+0x2ec>
ffffffffc0201822:	00008517          	auipc	a0,0x8
ffffffffc0201826:	2ce50513          	addi	a0,a0,718 # ffffffffc0209af0 <commands+0xce8>
ffffffffc020182a:	6909                	lui	s2,0x2
ffffffffc020182c:	4cad                	li	s9,11
ffffffffc020182e:	8a7fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0201832:	01990023          	sb	s9,0(s2) # 2000 <_binary_obj___user_forktree_out_size>
ffffffffc0201836:	401c                	lw	a5,0(s0)
ffffffffc0201838:	2781                	sext.w	a5,a5
ffffffffc020183a:	22979e63          	bne	a5,s1,ffffffffc0201a76 <_fifo_check_swap+0x2cc>
ffffffffc020183e:	00008517          	auipc	a0,0x8
ffffffffc0201842:	2da50513          	addi	a0,a0,730 # ffffffffc0209b18 <commands+0xd10>
ffffffffc0201846:	88ffe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020184a:	6795                	lui	a5,0x5
ffffffffc020184c:	4739                	li	a4,14
ffffffffc020184e:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x26c8>
ffffffffc0201852:	4004                	lw	s1,0(s0)
ffffffffc0201854:	4795                	li	a5,5
ffffffffc0201856:	2481                	sext.w	s1,s1
ffffffffc0201858:	1ef49f63          	bne	s1,a5,ffffffffc0201a56 <_fifo_check_swap+0x2ac>
ffffffffc020185c:	00008517          	auipc	a0,0x8
ffffffffc0201860:	29450513          	addi	a0,a0,660 # ffffffffc0209af0 <commands+0xce8>
ffffffffc0201864:	871fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0201868:	01990023          	sb	s9,0(s2)
ffffffffc020186c:	401c                	lw	a5,0(s0)
ffffffffc020186e:	2781                	sext.w	a5,a5
ffffffffc0201870:	1c979363          	bne	a5,s1,ffffffffc0201a36 <_fifo_check_swap+0x28c>
ffffffffc0201874:	00008517          	auipc	a0,0x8
ffffffffc0201878:	22c50513          	addi	a0,a0,556 # ffffffffc0209aa0 <commands+0xc98>
ffffffffc020187c:	859fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0201880:	016a8023          	sb	s6,0(s5)
ffffffffc0201884:	401c                	lw	a5,0(s0)
ffffffffc0201886:	4719                	li	a4,6
ffffffffc0201888:	2781                	sext.w	a5,a5
ffffffffc020188a:	18e79663          	bne	a5,a4,ffffffffc0201a16 <_fifo_check_swap+0x26c>
ffffffffc020188e:	00008517          	auipc	a0,0x8
ffffffffc0201892:	26250513          	addi	a0,a0,610 # ffffffffc0209af0 <commands+0xce8>
ffffffffc0201896:	83ffe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020189a:	01990023          	sb	s9,0(s2)
ffffffffc020189e:	401c                	lw	a5,0(s0)
ffffffffc02018a0:	471d                	li	a4,7
ffffffffc02018a2:	2781                	sext.w	a5,a5
ffffffffc02018a4:	14e79963          	bne	a5,a4,ffffffffc02019f6 <_fifo_check_swap+0x24c>
ffffffffc02018a8:	00008517          	auipc	a0,0x8
ffffffffc02018ac:	1a850513          	addi	a0,a0,424 # ffffffffc0209a50 <commands+0xc48>
ffffffffc02018b0:	825fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02018b4:	01498023          	sb	s4,0(s3)
ffffffffc02018b8:	401c                	lw	a5,0(s0)
ffffffffc02018ba:	4721                	li	a4,8
ffffffffc02018bc:	2781                	sext.w	a5,a5
ffffffffc02018be:	10e79c63          	bne	a5,a4,ffffffffc02019d6 <_fifo_check_swap+0x22c>
ffffffffc02018c2:	00008517          	auipc	a0,0x8
ffffffffc02018c6:	20650513          	addi	a0,a0,518 # ffffffffc0209ac8 <commands+0xcc0>
ffffffffc02018ca:	80bfe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02018ce:	018b8023          	sb	s8,0(s7)
ffffffffc02018d2:	401c                	lw	a5,0(s0)
ffffffffc02018d4:	4725                	li	a4,9
ffffffffc02018d6:	2781                	sext.w	a5,a5
ffffffffc02018d8:	0ce79f63          	bne	a5,a4,ffffffffc02019b6 <_fifo_check_swap+0x20c>
ffffffffc02018dc:	00008517          	auipc	a0,0x8
ffffffffc02018e0:	23c50513          	addi	a0,a0,572 # ffffffffc0209b18 <commands+0xd10>
ffffffffc02018e4:	ff0fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02018e8:	6795                	lui	a5,0x5
ffffffffc02018ea:	4739                	li	a4,14
ffffffffc02018ec:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x26c8>
ffffffffc02018f0:	4004                	lw	s1,0(s0)
ffffffffc02018f2:	47a9                	li	a5,10
ffffffffc02018f4:	2481                	sext.w	s1,s1
ffffffffc02018f6:	0af49063          	bne	s1,a5,ffffffffc0201996 <_fifo_check_swap+0x1ec>
ffffffffc02018fa:	00008517          	auipc	a0,0x8
ffffffffc02018fe:	1a650513          	addi	a0,a0,422 # ffffffffc0209aa0 <commands+0xc98>
ffffffffc0201902:	fd2fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0201906:	6785                	lui	a5,0x1
ffffffffc0201908:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc020190c:	06979563          	bne	a5,s1,ffffffffc0201976 <_fifo_check_swap+0x1cc>
ffffffffc0201910:	401c                	lw	a5,0(s0)
ffffffffc0201912:	472d                	li	a4,11
ffffffffc0201914:	2781                	sext.w	a5,a5
ffffffffc0201916:	04e79063          	bne	a5,a4,ffffffffc0201956 <_fifo_check_swap+0x1ac>
ffffffffc020191a:	60e6                	ld	ra,88(sp)
ffffffffc020191c:	6446                	ld	s0,80(sp)
ffffffffc020191e:	64a6                	ld	s1,72(sp)
ffffffffc0201920:	6906                	ld	s2,64(sp)
ffffffffc0201922:	79e2                	ld	s3,56(sp)
ffffffffc0201924:	7a42                	ld	s4,48(sp)
ffffffffc0201926:	7aa2                	ld	s5,40(sp)
ffffffffc0201928:	7b02                	ld	s6,32(sp)
ffffffffc020192a:	6be2                	ld	s7,24(sp)
ffffffffc020192c:	6c42                	ld	s8,16(sp)
ffffffffc020192e:	6ca2                	ld	s9,8(sp)
ffffffffc0201930:	4501                	li	a0,0
ffffffffc0201932:	6125                	addi	sp,sp,96
ffffffffc0201934:	8082                	ret
ffffffffc0201936:	00008697          	auipc	a3,0x8
ffffffffc020193a:	14268693          	addi	a3,a3,322 # ffffffffc0209a78 <commands+0xc70>
ffffffffc020193e:	00008617          	auipc	a2,0x8
ffffffffc0201942:	94a60613          	addi	a2,a2,-1718 # ffffffffc0209288 <commands+0x480>
ffffffffc0201946:	05100593          	li	a1,81
ffffffffc020194a:	00008517          	auipc	a0,0x8
ffffffffc020194e:	13e50513          	addi	a0,a0,318 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201952:	8c7fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201956:	00008697          	auipc	a3,0x8
ffffffffc020195a:	27268693          	addi	a3,a3,626 # ffffffffc0209bc8 <commands+0xdc0>
ffffffffc020195e:	00008617          	auipc	a2,0x8
ffffffffc0201962:	92a60613          	addi	a2,a2,-1750 # ffffffffc0209288 <commands+0x480>
ffffffffc0201966:	07300593          	li	a1,115
ffffffffc020196a:	00008517          	auipc	a0,0x8
ffffffffc020196e:	11e50513          	addi	a0,a0,286 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201972:	8a7fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201976:	00008697          	auipc	a3,0x8
ffffffffc020197a:	22a68693          	addi	a3,a3,554 # ffffffffc0209ba0 <commands+0xd98>
ffffffffc020197e:	00008617          	auipc	a2,0x8
ffffffffc0201982:	90a60613          	addi	a2,a2,-1782 # ffffffffc0209288 <commands+0x480>
ffffffffc0201986:	07100593          	li	a1,113
ffffffffc020198a:	00008517          	auipc	a0,0x8
ffffffffc020198e:	0fe50513          	addi	a0,a0,254 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201992:	887fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201996:	00008697          	auipc	a3,0x8
ffffffffc020199a:	1fa68693          	addi	a3,a3,506 # ffffffffc0209b90 <commands+0xd88>
ffffffffc020199e:	00008617          	auipc	a2,0x8
ffffffffc02019a2:	8ea60613          	addi	a2,a2,-1814 # ffffffffc0209288 <commands+0x480>
ffffffffc02019a6:	06f00593          	li	a1,111
ffffffffc02019aa:	00008517          	auipc	a0,0x8
ffffffffc02019ae:	0de50513          	addi	a0,a0,222 # ffffffffc0209a88 <commands+0xc80>
ffffffffc02019b2:	867fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02019b6:	00008697          	auipc	a3,0x8
ffffffffc02019ba:	1ca68693          	addi	a3,a3,458 # ffffffffc0209b80 <commands+0xd78>
ffffffffc02019be:	00008617          	auipc	a2,0x8
ffffffffc02019c2:	8ca60613          	addi	a2,a2,-1846 # ffffffffc0209288 <commands+0x480>
ffffffffc02019c6:	06c00593          	li	a1,108
ffffffffc02019ca:	00008517          	auipc	a0,0x8
ffffffffc02019ce:	0be50513          	addi	a0,a0,190 # ffffffffc0209a88 <commands+0xc80>
ffffffffc02019d2:	847fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02019d6:	00008697          	auipc	a3,0x8
ffffffffc02019da:	19a68693          	addi	a3,a3,410 # ffffffffc0209b70 <commands+0xd68>
ffffffffc02019de:	00008617          	auipc	a2,0x8
ffffffffc02019e2:	8aa60613          	addi	a2,a2,-1878 # ffffffffc0209288 <commands+0x480>
ffffffffc02019e6:	06900593          	li	a1,105
ffffffffc02019ea:	00008517          	auipc	a0,0x8
ffffffffc02019ee:	09e50513          	addi	a0,a0,158 # ffffffffc0209a88 <commands+0xc80>
ffffffffc02019f2:	827fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02019f6:	00008697          	auipc	a3,0x8
ffffffffc02019fa:	16a68693          	addi	a3,a3,362 # ffffffffc0209b60 <commands+0xd58>
ffffffffc02019fe:	00008617          	auipc	a2,0x8
ffffffffc0201a02:	88a60613          	addi	a2,a2,-1910 # ffffffffc0209288 <commands+0x480>
ffffffffc0201a06:	06600593          	li	a1,102
ffffffffc0201a0a:	00008517          	auipc	a0,0x8
ffffffffc0201a0e:	07e50513          	addi	a0,a0,126 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201a12:	807fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201a16:	00008697          	auipc	a3,0x8
ffffffffc0201a1a:	13a68693          	addi	a3,a3,314 # ffffffffc0209b50 <commands+0xd48>
ffffffffc0201a1e:	00008617          	auipc	a2,0x8
ffffffffc0201a22:	86a60613          	addi	a2,a2,-1942 # ffffffffc0209288 <commands+0x480>
ffffffffc0201a26:	06300593          	li	a1,99
ffffffffc0201a2a:	00008517          	auipc	a0,0x8
ffffffffc0201a2e:	05e50513          	addi	a0,a0,94 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201a32:	fe6fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201a36:	00008697          	auipc	a3,0x8
ffffffffc0201a3a:	10a68693          	addi	a3,a3,266 # ffffffffc0209b40 <commands+0xd38>
ffffffffc0201a3e:	00008617          	auipc	a2,0x8
ffffffffc0201a42:	84a60613          	addi	a2,a2,-1974 # ffffffffc0209288 <commands+0x480>
ffffffffc0201a46:	06000593          	li	a1,96
ffffffffc0201a4a:	00008517          	auipc	a0,0x8
ffffffffc0201a4e:	03e50513          	addi	a0,a0,62 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201a52:	fc6fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201a56:	00008697          	auipc	a3,0x8
ffffffffc0201a5a:	0ea68693          	addi	a3,a3,234 # ffffffffc0209b40 <commands+0xd38>
ffffffffc0201a5e:	00008617          	auipc	a2,0x8
ffffffffc0201a62:	82a60613          	addi	a2,a2,-2006 # ffffffffc0209288 <commands+0x480>
ffffffffc0201a66:	05d00593          	li	a1,93
ffffffffc0201a6a:	00008517          	auipc	a0,0x8
ffffffffc0201a6e:	01e50513          	addi	a0,a0,30 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201a72:	fa6fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201a76:	00008697          	auipc	a3,0x8
ffffffffc0201a7a:	00268693          	addi	a3,a3,2 # ffffffffc0209a78 <commands+0xc70>
ffffffffc0201a7e:	00008617          	auipc	a2,0x8
ffffffffc0201a82:	80a60613          	addi	a2,a2,-2038 # ffffffffc0209288 <commands+0x480>
ffffffffc0201a86:	05a00593          	li	a1,90
ffffffffc0201a8a:	00008517          	auipc	a0,0x8
ffffffffc0201a8e:	ffe50513          	addi	a0,a0,-2 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201a92:	f86fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201a96:	00008697          	auipc	a3,0x8
ffffffffc0201a9a:	fe268693          	addi	a3,a3,-30 # ffffffffc0209a78 <commands+0xc70>
ffffffffc0201a9e:	00007617          	auipc	a2,0x7
ffffffffc0201aa2:	7ea60613          	addi	a2,a2,2026 # ffffffffc0209288 <commands+0x480>
ffffffffc0201aa6:	05700593          	li	a1,87
ffffffffc0201aaa:	00008517          	auipc	a0,0x8
ffffffffc0201aae:	fde50513          	addi	a0,a0,-34 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201ab2:	f66fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201ab6:	00008697          	auipc	a3,0x8
ffffffffc0201aba:	fc268693          	addi	a3,a3,-62 # ffffffffc0209a78 <commands+0xc70>
ffffffffc0201abe:	00007617          	auipc	a2,0x7
ffffffffc0201ac2:	7ca60613          	addi	a2,a2,1994 # ffffffffc0209288 <commands+0x480>
ffffffffc0201ac6:	05400593          	li	a1,84
ffffffffc0201aca:	00008517          	auipc	a0,0x8
ffffffffc0201ace:	fbe50513          	addi	a0,a0,-66 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201ad2:	f46fe0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0201ad6 <_fifo_swap_out_victim>:
ffffffffc0201ad6:	751c                	ld	a5,40(a0)
ffffffffc0201ad8:	1141                	addi	sp,sp,-16
ffffffffc0201ada:	e406                	sd	ra,8(sp)
ffffffffc0201adc:	cf91                	beqz	a5,ffffffffc0201af8 <_fifo_swap_out_victim+0x22>
ffffffffc0201ade:	ee0d                	bnez	a2,ffffffffc0201b18 <_fifo_swap_out_victim+0x42>
ffffffffc0201ae0:	679c                	ld	a5,8(a5)
ffffffffc0201ae2:	60a2                	ld	ra,8(sp)
ffffffffc0201ae4:	4501                	li	a0,0
ffffffffc0201ae6:	6394                	ld	a3,0(a5)
ffffffffc0201ae8:	6798                	ld	a4,8(a5)
ffffffffc0201aea:	fd878793          	addi	a5,a5,-40
ffffffffc0201aee:	e698                	sd	a4,8(a3)
ffffffffc0201af0:	e314                	sd	a3,0(a4)
ffffffffc0201af2:	e19c                	sd	a5,0(a1)
ffffffffc0201af4:	0141                	addi	sp,sp,16
ffffffffc0201af6:	8082                	ret
ffffffffc0201af8:	00008697          	auipc	a3,0x8
ffffffffc0201afc:	10068693          	addi	a3,a3,256 # ffffffffc0209bf8 <commands+0xdf0>
ffffffffc0201b00:	00007617          	auipc	a2,0x7
ffffffffc0201b04:	78860613          	addi	a2,a2,1928 # ffffffffc0209288 <commands+0x480>
ffffffffc0201b08:	04100593          	li	a1,65
ffffffffc0201b0c:	00008517          	auipc	a0,0x8
ffffffffc0201b10:	f7c50513          	addi	a0,a0,-132 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201b14:	f04fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201b18:	00008697          	auipc	a3,0x8
ffffffffc0201b1c:	0f068693          	addi	a3,a3,240 # ffffffffc0209c08 <commands+0xe00>
ffffffffc0201b20:	00007617          	auipc	a2,0x7
ffffffffc0201b24:	76860613          	addi	a2,a2,1896 # ffffffffc0209288 <commands+0x480>
ffffffffc0201b28:	04200593          	li	a1,66
ffffffffc0201b2c:	00008517          	auipc	a0,0x8
ffffffffc0201b30:	f5c50513          	addi	a0,a0,-164 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201b34:	ee4fe0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0201b38 <_fifo_map_swappable>:
ffffffffc0201b38:	02860713          	addi	a4,a2,40
ffffffffc0201b3c:	751c                	ld	a5,40(a0)
ffffffffc0201b3e:	cb09                	beqz	a4,ffffffffc0201b50 <_fifo_map_swappable+0x18>
ffffffffc0201b40:	cb81                	beqz	a5,ffffffffc0201b50 <_fifo_map_swappable+0x18>
ffffffffc0201b42:	6394                	ld	a3,0(a5)
ffffffffc0201b44:	e398                	sd	a4,0(a5)
ffffffffc0201b46:	4501                	li	a0,0
ffffffffc0201b48:	e698                	sd	a4,8(a3)
ffffffffc0201b4a:	fa1c                	sd	a5,48(a2)
ffffffffc0201b4c:	f614                	sd	a3,40(a2)
ffffffffc0201b4e:	8082                	ret
ffffffffc0201b50:	1141                	addi	sp,sp,-16
ffffffffc0201b52:	00008697          	auipc	a3,0x8
ffffffffc0201b56:	08668693          	addi	a3,a3,134 # ffffffffc0209bd8 <commands+0xdd0>
ffffffffc0201b5a:	00007617          	auipc	a2,0x7
ffffffffc0201b5e:	72e60613          	addi	a2,a2,1838 # ffffffffc0209288 <commands+0x480>
ffffffffc0201b62:	03200593          	li	a1,50
ffffffffc0201b66:	00008517          	auipc	a0,0x8
ffffffffc0201b6a:	f2250513          	addi	a0,a0,-222 # ffffffffc0209a88 <commands+0xc80>
ffffffffc0201b6e:	e406                	sd	ra,8(sp)
ffffffffc0201b70:	ea8fe0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0201b74 <slob_free>:
ffffffffc0201b74:	c125                	beqz	a0,ffffffffc0201bd4 <slob_free+0x60>
ffffffffc0201b76:	e1a5                	bnez	a1,ffffffffc0201bd6 <slob_free+0x62>
ffffffffc0201b78:	100027f3          	csrr	a5,sstatus
ffffffffc0201b7c:	8b89                	andi	a5,a5,2
ffffffffc0201b7e:	4581                	li	a1,0
ffffffffc0201b80:	e3bd                	bnez	a5,ffffffffc0201be6 <slob_free+0x72>
ffffffffc0201b82:	00030797          	auipc	a5,0x30
ffffffffc0201b86:	e8678793          	addi	a5,a5,-378 # ffffffffc0231a08 <slobfree>
ffffffffc0201b8a:	639c                	ld	a5,0(a5)
ffffffffc0201b8c:	6798                	ld	a4,8(a5)
ffffffffc0201b8e:	00a7fa63          	bgeu	a5,a0,ffffffffc0201ba2 <slob_free+0x2e>
ffffffffc0201b92:	00e56c63          	bltu	a0,a4,ffffffffc0201baa <slob_free+0x36>
ffffffffc0201b96:	00e7fa63          	bgeu	a5,a4,ffffffffc0201baa <slob_free+0x36>
ffffffffc0201b9a:	87ba                	mv	a5,a4
ffffffffc0201b9c:	6798                	ld	a4,8(a5)
ffffffffc0201b9e:	fea7eae3          	bltu	a5,a0,ffffffffc0201b92 <slob_free+0x1e>
ffffffffc0201ba2:	fee7ece3          	bltu	a5,a4,ffffffffc0201b9a <slob_free+0x26>
ffffffffc0201ba6:	fee57ae3          	bgeu	a0,a4,ffffffffc0201b9a <slob_free+0x26>
ffffffffc0201baa:	4110                	lw	a2,0(a0)
ffffffffc0201bac:	00461693          	slli	a3,a2,0x4
ffffffffc0201bb0:	96aa                	add	a3,a3,a0
ffffffffc0201bb2:	08d70b63          	beq	a4,a3,ffffffffc0201c48 <slob_free+0xd4>
ffffffffc0201bb6:	4394                	lw	a3,0(a5)
ffffffffc0201bb8:	e518                	sd	a4,8(a0)
ffffffffc0201bba:	00469713          	slli	a4,a3,0x4
ffffffffc0201bbe:	973e                	add	a4,a4,a5
ffffffffc0201bc0:	08e50f63          	beq	a0,a4,ffffffffc0201c5e <slob_free+0xea>
ffffffffc0201bc4:	e788                	sd	a0,8(a5)
ffffffffc0201bc6:	00030717          	auipc	a4,0x30
ffffffffc0201bca:	e4f73123          	sd	a5,-446(a4) # ffffffffc0231a08 <slobfree>
ffffffffc0201bce:	c199                	beqz	a1,ffffffffc0201bd4 <slob_free+0x60>
ffffffffc0201bd0:	a77fe06f          	j	ffffffffc0200646 <intr_enable>
ffffffffc0201bd4:	8082                	ret
ffffffffc0201bd6:	05bd                	addi	a1,a1,15
ffffffffc0201bd8:	8191                	srli	a1,a1,0x4
ffffffffc0201bda:	c10c                	sw	a1,0(a0)
ffffffffc0201bdc:	100027f3          	csrr	a5,sstatus
ffffffffc0201be0:	8b89                	andi	a5,a5,2
ffffffffc0201be2:	4581                	li	a1,0
ffffffffc0201be4:	dfd9                	beqz	a5,ffffffffc0201b82 <slob_free+0xe>
ffffffffc0201be6:	1101                	addi	sp,sp,-32
ffffffffc0201be8:	e42a                	sd	a0,8(sp)
ffffffffc0201bea:	ec06                	sd	ra,24(sp)
ffffffffc0201bec:	a61fe0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0201bf0:	00030797          	auipc	a5,0x30
ffffffffc0201bf4:	e1878793          	addi	a5,a5,-488 # ffffffffc0231a08 <slobfree>
ffffffffc0201bf8:	639c                	ld	a5,0(a5)
ffffffffc0201bfa:	6522                	ld	a0,8(sp)
ffffffffc0201bfc:	4585                	li	a1,1
ffffffffc0201bfe:	6798                	ld	a4,8(a5)
ffffffffc0201c00:	00a7fa63          	bgeu	a5,a0,ffffffffc0201c14 <slob_free+0xa0>
ffffffffc0201c04:	00e56c63          	bltu	a0,a4,ffffffffc0201c1c <slob_free+0xa8>
ffffffffc0201c08:	00e7fa63          	bgeu	a5,a4,ffffffffc0201c1c <slob_free+0xa8>
ffffffffc0201c0c:	87ba                	mv	a5,a4
ffffffffc0201c0e:	6798                	ld	a4,8(a5)
ffffffffc0201c10:	fea7eae3          	bltu	a5,a0,ffffffffc0201c04 <slob_free+0x90>
ffffffffc0201c14:	fee7ece3          	bltu	a5,a4,ffffffffc0201c0c <slob_free+0x98>
ffffffffc0201c18:	fee57ae3          	bgeu	a0,a4,ffffffffc0201c0c <slob_free+0x98>
ffffffffc0201c1c:	4110                	lw	a2,0(a0)
ffffffffc0201c1e:	00461693          	slli	a3,a2,0x4
ffffffffc0201c22:	96aa                	add	a3,a3,a0
ffffffffc0201c24:	04d70763          	beq	a4,a3,ffffffffc0201c72 <slob_free+0xfe>
ffffffffc0201c28:	e518                	sd	a4,8(a0)
ffffffffc0201c2a:	4394                	lw	a3,0(a5)
ffffffffc0201c2c:	00469713          	slli	a4,a3,0x4
ffffffffc0201c30:	973e                	add	a4,a4,a5
ffffffffc0201c32:	04e50663          	beq	a0,a4,ffffffffc0201c7e <slob_free+0x10a>
ffffffffc0201c36:	e788                	sd	a0,8(a5)
ffffffffc0201c38:	00030717          	auipc	a4,0x30
ffffffffc0201c3c:	dcf73823          	sd	a5,-560(a4) # ffffffffc0231a08 <slobfree>
ffffffffc0201c40:	e58d                	bnez	a1,ffffffffc0201c6a <slob_free+0xf6>
ffffffffc0201c42:	60e2                	ld	ra,24(sp)
ffffffffc0201c44:	6105                	addi	sp,sp,32
ffffffffc0201c46:	8082                	ret
ffffffffc0201c48:	4314                	lw	a3,0(a4)
ffffffffc0201c4a:	6718                	ld	a4,8(a4)
ffffffffc0201c4c:	9e35                	addw	a2,a2,a3
ffffffffc0201c4e:	c110                	sw	a2,0(a0)
ffffffffc0201c50:	4394                	lw	a3,0(a5)
ffffffffc0201c52:	e518                	sd	a4,8(a0)
ffffffffc0201c54:	00469713          	slli	a4,a3,0x4
ffffffffc0201c58:	973e                	add	a4,a4,a5
ffffffffc0201c5a:	f6e515e3          	bne	a0,a4,ffffffffc0201bc4 <slob_free+0x50>
ffffffffc0201c5e:	4118                	lw	a4,0(a0)
ffffffffc0201c60:	6510                	ld	a2,8(a0)
ffffffffc0201c62:	9eb9                	addw	a3,a3,a4
ffffffffc0201c64:	c394                	sw	a3,0(a5)
ffffffffc0201c66:	e790                	sd	a2,8(a5)
ffffffffc0201c68:	bfb9                	j	ffffffffc0201bc6 <slob_free+0x52>
ffffffffc0201c6a:	60e2                	ld	ra,24(sp)
ffffffffc0201c6c:	6105                	addi	sp,sp,32
ffffffffc0201c6e:	9d9fe06f          	j	ffffffffc0200646 <intr_enable>
ffffffffc0201c72:	4314                	lw	a3,0(a4)
ffffffffc0201c74:	6718                	ld	a4,8(a4)
ffffffffc0201c76:	9e35                	addw	a2,a2,a3
ffffffffc0201c78:	c110                	sw	a2,0(a0)
ffffffffc0201c7a:	e518                	sd	a4,8(a0)
ffffffffc0201c7c:	b77d                	j	ffffffffc0201c2a <slob_free+0xb6>
ffffffffc0201c7e:	4118                	lw	a4,0(a0)
ffffffffc0201c80:	6510                	ld	a2,8(a0)
ffffffffc0201c82:	9eb9                	addw	a3,a3,a4
ffffffffc0201c84:	c394                	sw	a3,0(a5)
ffffffffc0201c86:	e790                	sd	a2,8(a5)
ffffffffc0201c88:	bf45                	j	ffffffffc0201c38 <slob_free+0xc4>

ffffffffc0201c8a <__slob_get_free_pages.isra.0>:
ffffffffc0201c8a:	4785                	li	a5,1
ffffffffc0201c8c:	1141                	addi	sp,sp,-16
ffffffffc0201c8e:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201c92:	e406                	sd	ra,8(sp)
ffffffffc0201c94:	750010ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0201c98:	cd1d                	beqz	a0,ffffffffc0201cd6 <__slob_get_free_pages.isra.0+0x4c>
ffffffffc0201c9a:	0003b797          	auipc	a5,0x3b
ffffffffc0201c9e:	32e78793          	addi	a5,a5,814 # ffffffffc023cfc8 <pages>
ffffffffc0201ca2:	6394                	ld	a3,0(a5)
ffffffffc0201ca4:	0000a797          	auipc	a5,0xa
ffffffffc0201ca8:	e0c78793          	addi	a5,a5,-500 # ffffffffc020bab0 <nbase>
ffffffffc0201cac:	8d15                	sub	a0,a0,a3
ffffffffc0201cae:	6394                	ld	a3,0(a5)
ffffffffc0201cb0:	8519                	srai	a0,a0,0x6
ffffffffc0201cb2:	0003b797          	auipc	a5,0x3b
ffffffffc0201cb6:	1c678793          	addi	a5,a5,454 # ffffffffc023ce78 <npage>
ffffffffc0201cba:	9536                	add	a0,a0,a3
ffffffffc0201cbc:	6398                	ld	a4,0(a5)
ffffffffc0201cbe:	00c51793          	slli	a5,a0,0xc
ffffffffc0201cc2:	83b1                	srli	a5,a5,0xc
ffffffffc0201cc4:	0532                	slli	a0,a0,0xc
ffffffffc0201cc6:	00e7fb63          	bgeu	a5,a4,ffffffffc0201cdc <__slob_get_free_pages.isra.0+0x52>
ffffffffc0201cca:	0003b797          	auipc	a5,0x3b
ffffffffc0201cce:	2ee78793          	addi	a5,a5,750 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0201cd2:	6394                	ld	a3,0(a5)
ffffffffc0201cd4:	9536                	add	a0,a0,a3
ffffffffc0201cd6:	60a2                	ld	ra,8(sp)
ffffffffc0201cd8:	0141                	addi	sp,sp,16
ffffffffc0201cda:	8082                	ret
ffffffffc0201cdc:	86aa                	mv	a3,a0
ffffffffc0201cde:	00008617          	auipc	a2,0x8
ffffffffc0201ce2:	f5260613          	addi	a2,a2,-174 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0201ce6:	06900593          	li	a1,105
ffffffffc0201cea:	00008517          	auipc	a0,0x8
ffffffffc0201cee:	ce650513          	addi	a0,a0,-794 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0201cf2:	d26fe0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0201cf6 <slob_alloc.isra.1.constprop.3>:
ffffffffc0201cf6:	1101                	addi	sp,sp,-32
ffffffffc0201cf8:	ec06                	sd	ra,24(sp)
ffffffffc0201cfa:	e822                	sd	s0,16(sp)
ffffffffc0201cfc:	e426                	sd	s1,8(sp)
ffffffffc0201cfe:	e04a                	sd	s2,0(sp)
ffffffffc0201d00:	01050713          	addi	a4,a0,16
ffffffffc0201d04:	6785                	lui	a5,0x1
ffffffffc0201d06:	0cf77563          	bgeu	a4,a5,ffffffffc0201dd0 <slob_alloc.isra.1.constprop.3+0xda>
ffffffffc0201d0a:	00f50493          	addi	s1,a0,15
ffffffffc0201d0e:	8091                	srli	s1,s1,0x4
ffffffffc0201d10:	2481                	sext.w	s1,s1
ffffffffc0201d12:	10002673          	csrr	a2,sstatus
ffffffffc0201d16:	8a09                	andi	a2,a2,2
ffffffffc0201d18:	e64d                	bnez	a2,ffffffffc0201dc2 <slob_alloc.isra.1.constprop.3+0xcc>
ffffffffc0201d1a:	00030917          	auipc	s2,0x30
ffffffffc0201d1e:	cee90913          	addi	s2,s2,-786 # ffffffffc0231a08 <slobfree>
ffffffffc0201d22:	00093683          	ld	a3,0(s2)
ffffffffc0201d26:	669c                	ld	a5,8(a3)
ffffffffc0201d28:	4398                	lw	a4,0(a5)
ffffffffc0201d2a:	0a975063          	bge	a4,s1,ffffffffc0201dca <slob_alloc.isra.1.constprop.3+0xd4>
ffffffffc0201d2e:	00d78b63          	beq	a5,a3,ffffffffc0201d44 <slob_alloc.isra.1.constprop.3+0x4e>
ffffffffc0201d32:	6780                	ld	s0,8(a5)
ffffffffc0201d34:	4018                	lw	a4,0(s0)
ffffffffc0201d36:	02975a63          	bge	a4,s1,ffffffffc0201d6a <slob_alloc.isra.1.constprop.3+0x74>
ffffffffc0201d3a:	00093683          	ld	a3,0(s2)
ffffffffc0201d3e:	87a2                	mv	a5,s0
ffffffffc0201d40:	fed799e3          	bne	a5,a3,ffffffffc0201d32 <slob_alloc.isra.1.constprop.3+0x3c>
ffffffffc0201d44:	e225                	bnez	a2,ffffffffc0201da4 <slob_alloc.isra.1.constprop.3+0xae>
ffffffffc0201d46:	4501                	li	a0,0
ffffffffc0201d48:	f43ff0ef          	jal	ra,ffffffffc0201c8a <__slob_get_free_pages.isra.0>
ffffffffc0201d4c:	842a                	mv	s0,a0
ffffffffc0201d4e:	cd15                	beqz	a0,ffffffffc0201d8a <slob_alloc.isra.1.constprop.3+0x94>
ffffffffc0201d50:	6585                	lui	a1,0x1
ffffffffc0201d52:	e23ff0ef          	jal	ra,ffffffffc0201b74 <slob_free>
ffffffffc0201d56:	10002673          	csrr	a2,sstatus
ffffffffc0201d5a:	8a09                	andi	a2,a2,2
ffffffffc0201d5c:	ee15                	bnez	a2,ffffffffc0201d98 <slob_alloc.isra.1.constprop.3+0xa2>
ffffffffc0201d5e:	00093783          	ld	a5,0(s2)
ffffffffc0201d62:	6780                	ld	s0,8(a5)
ffffffffc0201d64:	4018                	lw	a4,0(s0)
ffffffffc0201d66:	fc974ae3          	blt	a4,s1,ffffffffc0201d3a <slob_alloc.isra.1.constprop.3+0x44>
ffffffffc0201d6a:	04e48963          	beq	s1,a4,ffffffffc0201dbc <slob_alloc.isra.1.constprop.3+0xc6>
ffffffffc0201d6e:	00449693          	slli	a3,s1,0x4
ffffffffc0201d72:	96a2                	add	a3,a3,s0
ffffffffc0201d74:	e794                	sd	a3,8(a5)
ffffffffc0201d76:	640c                	ld	a1,8(s0)
ffffffffc0201d78:	9f05                	subw	a4,a4,s1
ffffffffc0201d7a:	c298                	sw	a4,0(a3)
ffffffffc0201d7c:	e68c                	sd	a1,8(a3)
ffffffffc0201d7e:	c004                	sw	s1,0(s0)
ffffffffc0201d80:	00030717          	auipc	a4,0x30
ffffffffc0201d84:	c8f73423          	sd	a5,-888(a4) # ffffffffc0231a08 <slobfree>
ffffffffc0201d88:	e20d                	bnez	a2,ffffffffc0201daa <slob_alloc.isra.1.constprop.3+0xb4>
ffffffffc0201d8a:	8522                	mv	a0,s0
ffffffffc0201d8c:	60e2                	ld	ra,24(sp)
ffffffffc0201d8e:	6442                	ld	s0,16(sp)
ffffffffc0201d90:	64a2                	ld	s1,8(sp)
ffffffffc0201d92:	6902                	ld	s2,0(sp)
ffffffffc0201d94:	6105                	addi	sp,sp,32
ffffffffc0201d96:	8082                	ret
ffffffffc0201d98:	8b5fe0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0201d9c:	4605                	li	a2,1
ffffffffc0201d9e:	00093783          	ld	a5,0(s2)
ffffffffc0201da2:	b7c1                	j	ffffffffc0201d62 <slob_alloc.isra.1.constprop.3+0x6c>
ffffffffc0201da4:	8a3fe0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0201da8:	bf79                	j	ffffffffc0201d46 <slob_alloc.isra.1.constprop.3+0x50>
ffffffffc0201daa:	89dfe0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0201dae:	8522                	mv	a0,s0
ffffffffc0201db0:	60e2                	ld	ra,24(sp)
ffffffffc0201db2:	6442                	ld	s0,16(sp)
ffffffffc0201db4:	64a2                	ld	s1,8(sp)
ffffffffc0201db6:	6902                	ld	s2,0(sp)
ffffffffc0201db8:	6105                	addi	sp,sp,32
ffffffffc0201dba:	8082                	ret
ffffffffc0201dbc:	6418                	ld	a4,8(s0)
ffffffffc0201dbe:	e798                	sd	a4,8(a5)
ffffffffc0201dc0:	b7c1                	j	ffffffffc0201d80 <slob_alloc.isra.1.constprop.3+0x8a>
ffffffffc0201dc2:	88bfe0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0201dc6:	4605                	li	a2,1
ffffffffc0201dc8:	bf89                	j	ffffffffc0201d1a <slob_alloc.isra.1.constprop.3+0x24>
ffffffffc0201dca:	843e                	mv	s0,a5
ffffffffc0201dcc:	87b6                	mv	a5,a3
ffffffffc0201dce:	bf71                	j	ffffffffc0201d6a <slob_alloc.isra.1.constprop.3+0x74>
ffffffffc0201dd0:	00008697          	auipc	a3,0x8
ffffffffc0201dd4:	ed068693          	addi	a3,a3,-304 # ffffffffc0209ca0 <commands+0xe98>
ffffffffc0201dd8:	00007617          	auipc	a2,0x7
ffffffffc0201ddc:	4b060613          	addi	a2,a2,1200 # ffffffffc0209288 <commands+0x480>
ffffffffc0201de0:	06400593          	li	a1,100
ffffffffc0201de4:	00008517          	auipc	a0,0x8
ffffffffc0201de8:	edc50513          	addi	a0,a0,-292 # ffffffffc0209cc0 <commands+0xeb8>
ffffffffc0201dec:	c2cfe0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0201df0 <kmalloc_init>:
ffffffffc0201df0:	1141                	addi	sp,sp,-16
ffffffffc0201df2:	00008517          	auipc	a0,0x8
ffffffffc0201df6:	ee650513          	addi	a0,a0,-282 # ffffffffc0209cd8 <commands+0xed0>
ffffffffc0201dfa:	e406                	sd	ra,8(sp)
ffffffffc0201dfc:	ad8fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0201e00:	60a2                	ld	ra,8(sp)
ffffffffc0201e02:	00008517          	auipc	a0,0x8
ffffffffc0201e06:	e7e50513          	addi	a0,a0,-386 # ffffffffc0209c80 <commands+0xe78>
ffffffffc0201e0a:	0141                	addi	sp,sp,16
ffffffffc0201e0c:	ac8fe06f          	j	ffffffffc02000d4 <cprintf>

ffffffffc0201e10 <kallocated>:
ffffffffc0201e10:	4501                	li	a0,0
ffffffffc0201e12:	8082                	ret

ffffffffc0201e14 <kmalloc>:
ffffffffc0201e14:	1101                	addi	sp,sp,-32
ffffffffc0201e16:	e04a                	sd	s2,0(sp)
ffffffffc0201e18:	6905                	lui	s2,0x1
ffffffffc0201e1a:	e822                	sd	s0,16(sp)
ffffffffc0201e1c:	ec06                	sd	ra,24(sp)
ffffffffc0201e1e:	e426                	sd	s1,8(sp)
ffffffffc0201e20:	fef90793          	addi	a5,s2,-17 # fef <_binary_obj___user_faultread_out_size-0xd69>
ffffffffc0201e24:	842a                	mv	s0,a0
ffffffffc0201e26:	04a7fc63          	bgeu	a5,a0,ffffffffc0201e7e <kmalloc+0x6a>
ffffffffc0201e2a:	4561                	li	a0,24
ffffffffc0201e2c:	ecbff0ef          	jal	ra,ffffffffc0201cf6 <slob_alloc.isra.1.constprop.3>
ffffffffc0201e30:	84aa                	mv	s1,a0
ffffffffc0201e32:	cd21                	beqz	a0,ffffffffc0201e8a <kmalloc+0x76>
ffffffffc0201e34:	0004079b          	sext.w	a5,s0
ffffffffc0201e38:	4501                	li	a0,0
ffffffffc0201e3a:	00f95763          	bge	s2,a5,ffffffffc0201e48 <kmalloc+0x34>
ffffffffc0201e3e:	6705                	lui	a4,0x1
ffffffffc0201e40:	8785                	srai	a5,a5,0x1
ffffffffc0201e42:	2505                	addiw	a0,a0,1
ffffffffc0201e44:	fef74ee3          	blt	a4,a5,ffffffffc0201e40 <kmalloc+0x2c>
ffffffffc0201e48:	c088                	sw	a0,0(s1)
ffffffffc0201e4a:	e41ff0ef          	jal	ra,ffffffffc0201c8a <__slob_get_free_pages.isra.0>
ffffffffc0201e4e:	e488                	sd	a0,8(s1)
ffffffffc0201e50:	842a                	mv	s0,a0
ffffffffc0201e52:	c935                	beqz	a0,ffffffffc0201ec6 <kmalloc+0xb2>
ffffffffc0201e54:	100027f3          	csrr	a5,sstatus
ffffffffc0201e58:	8b89                	andi	a5,a5,2
ffffffffc0201e5a:	e3a1                	bnez	a5,ffffffffc0201e9a <kmalloc+0x86>
ffffffffc0201e5c:	0003b797          	auipc	a5,0x3b
ffffffffc0201e60:	ffc78793          	addi	a5,a5,-4 # ffffffffc023ce58 <bigblocks>
ffffffffc0201e64:	639c                	ld	a5,0(a5)
ffffffffc0201e66:	0003b717          	auipc	a4,0x3b
ffffffffc0201e6a:	fe973923          	sd	s1,-14(a4) # ffffffffc023ce58 <bigblocks>
ffffffffc0201e6e:	e89c                	sd	a5,16(s1)
ffffffffc0201e70:	8522                	mv	a0,s0
ffffffffc0201e72:	60e2                	ld	ra,24(sp)
ffffffffc0201e74:	6442                	ld	s0,16(sp)
ffffffffc0201e76:	64a2                	ld	s1,8(sp)
ffffffffc0201e78:	6902                	ld	s2,0(sp)
ffffffffc0201e7a:	6105                	addi	sp,sp,32
ffffffffc0201e7c:	8082                	ret
ffffffffc0201e7e:	0541                	addi	a0,a0,16
ffffffffc0201e80:	e77ff0ef          	jal	ra,ffffffffc0201cf6 <slob_alloc.isra.1.constprop.3>
ffffffffc0201e84:	01050413          	addi	s0,a0,16
ffffffffc0201e88:	f565                	bnez	a0,ffffffffc0201e70 <kmalloc+0x5c>
ffffffffc0201e8a:	4401                	li	s0,0
ffffffffc0201e8c:	8522                	mv	a0,s0
ffffffffc0201e8e:	60e2                	ld	ra,24(sp)
ffffffffc0201e90:	6442                	ld	s0,16(sp)
ffffffffc0201e92:	64a2                	ld	s1,8(sp)
ffffffffc0201e94:	6902                	ld	s2,0(sp)
ffffffffc0201e96:	6105                	addi	sp,sp,32
ffffffffc0201e98:	8082                	ret
ffffffffc0201e9a:	fb2fe0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0201e9e:	0003b797          	auipc	a5,0x3b
ffffffffc0201ea2:	fba78793          	addi	a5,a5,-70 # ffffffffc023ce58 <bigblocks>
ffffffffc0201ea6:	639c                	ld	a5,0(a5)
ffffffffc0201ea8:	0003b717          	auipc	a4,0x3b
ffffffffc0201eac:	fa973823          	sd	s1,-80(a4) # ffffffffc023ce58 <bigblocks>
ffffffffc0201eb0:	e89c                	sd	a5,16(s1)
ffffffffc0201eb2:	f94fe0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0201eb6:	6480                	ld	s0,8(s1)
ffffffffc0201eb8:	60e2                	ld	ra,24(sp)
ffffffffc0201eba:	64a2                	ld	s1,8(sp)
ffffffffc0201ebc:	8522                	mv	a0,s0
ffffffffc0201ebe:	6442                	ld	s0,16(sp)
ffffffffc0201ec0:	6902                	ld	s2,0(sp)
ffffffffc0201ec2:	6105                	addi	sp,sp,32
ffffffffc0201ec4:	8082                	ret
ffffffffc0201ec6:	45e1                	li	a1,24
ffffffffc0201ec8:	8526                	mv	a0,s1
ffffffffc0201eca:	cabff0ef          	jal	ra,ffffffffc0201b74 <slob_free>
ffffffffc0201ece:	b74d                	j	ffffffffc0201e70 <kmalloc+0x5c>

ffffffffc0201ed0 <kfree>:
ffffffffc0201ed0:	c175                	beqz	a0,ffffffffc0201fb4 <kfree+0xe4>
ffffffffc0201ed2:	1101                	addi	sp,sp,-32
ffffffffc0201ed4:	e426                	sd	s1,8(sp)
ffffffffc0201ed6:	ec06                	sd	ra,24(sp)
ffffffffc0201ed8:	e822                	sd	s0,16(sp)
ffffffffc0201eda:	03451793          	slli	a5,a0,0x34
ffffffffc0201ede:	84aa                	mv	s1,a0
ffffffffc0201ee0:	eb8d                	bnez	a5,ffffffffc0201f12 <kfree+0x42>
ffffffffc0201ee2:	100027f3          	csrr	a5,sstatus
ffffffffc0201ee6:	8b89                	andi	a5,a5,2
ffffffffc0201ee8:	efc9                	bnez	a5,ffffffffc0201f82 <kfree+0xb2>
ffffffffc0201eea:	0003b797          	auipc	a5,0x3b
ffffffffc0201eee:	f6e78793          	addi	a5,a5,-146 # ffffffffc023ce58 <bigblocks>
ffffffffc0201ef2:	6394                	ld	a3,0(a5)
ffffffffc0201ef4:	ce99                	beqz	a3,ffffffffc0201f12 <kfree+0x42>
ffffffffc0201ef6:	669c                	ld	a5,8(a3)
ffffffffc0201ef8:	6a80                	ld	s0,16(a3)
ffffffffc0201efa:	0af50e63          	beq	a0,a5,ffffffffc0201fb6 <kfree+0xe6>
ffffffffc0201efe:	4601                	li	a2,0
ffffffffc0201f00:	c801                	beqz	s0,ffffffffc0201f10 <kfree+0x40>
ffffffffc0201f02:	6418                	ld	a4,8(s0)
ffffffffc0201f04:	681c                	ld	a5,16(s0)
ffffffffc0201f06:	00970f63          	beq	a4,s1,ffffffffc0201f24 <kfree+0x54>
ffffffffc0201f0a:	86a2                	mv	a3,s0
ffffffffc0201f0c:	843e                	mv	s0,a5
ffffffffc0201f0e:	f875                	bnez	s0,ffffffffc0201f02 <kfree+0x32>
ffffffffc0201f10:	e659                	bnez	a2,ffffffffc0201f9e <kfree+0xce>
ffffffffc0201f12:	6442                	ld	s0,16(sp)
ffffffffc0201f14:	60e2                	ld	ra,24(sp)
ffffffffc0201f16:	ff048513          	addi	a0,s1,-16
ffffffffc0201f1a:	64a2                	ld	s1,8(sp)
ffffffffc0201f1c:	4581                	li	a1,0
ffffffffc0201f1e:	6105                	addi	sp,sp,32
ffffffffc0201f20:	c55ff06f          	j	ffffffffc0201b74 <slob_free>
ffffffffc0201f24:	ea9c                	sd	a5,16(a3)
ffffffffc0201f26:	e641                	bnez	a2,ffffffffc0201fae <kfree+0xde>
ffffffffc0201f28:	c02007b7          	lui	a5,0xc0200
ffffffffc0201f2c:	4018                	lw	a4,0(s0)
ffffffffc0201f2e:	08f4ea63          	bltu	s1,a5,ffffffffc0201fc2 <kfree+0xf2>
ffffffffc0201f32:	0003b797          	auipc	a5,0x3b
ffffffffc0201f36:	08678793          	addi	a5,a5,134 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0201f3a:	6394                	ld	a3,0(a5)
ffffffffc0201f3c:	0003b797          	auipc	a5,0x3b
ffffffffc0201f40:	f3c78793          	addi	a5,a5,-196 # ffffffffc023ce78 <npage>
ffffffffc0201f44:	639c                	ld	a5,0(a5)
ffffffffc0201f46:	8c95                	sub	s1,s1,a3
ffffffffc0201f48:	80b1                	srli	s1,s1,0xc
ffffffffc0201f4a:	08f4f963          	bgeu	s1,a5,ffffffffc0201fdc <kfree+0x10c>
ffffffffc0201f4e:	0000a797          	auipc	a5,0xa
ffffffffc0201f52:	b6278793          	addi	a5,a5,-1182 # ffffffffc020bab0 <nbase>
ffffffffc0201f56:	639c                	ld	a5,0(a5)
ffffffffc0201f58:	0003b697          	auipc	a3,0x3b
ffffffffc0201f5c:	07068693          	addi	a3,a3,112 # ffffffffc023cfc8 <pages>
ffffffffc0201f60:	6288                	ld	a0,0(a3)
ffffffffc0201f62:	8c9d                	sub	s1,s1,a5
ffffffffc0201f64:	049a                	slli	s1,s1,0x6
ffffffffc0201f66:	4585                	li	a1,1
ffffffffc0201f68:	9526                	add	a0,a0,s1
ffffffffc0201f6a:	00e595bb          	sllw	a1,a1,a4
ffffffffc0201f6e:	4fe010ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0201f72:	8522                	mv	a0,s0
ffffffffc0201f74:	6442                	ld	s0,16(sp)
ffffffffc0201f76:	60e2                	ld	ra,24(sp)
ffffffffc0201f78:	64a2                	ld	s1,8(sp)
ffffffffc0201f7a:	45e1                	li	a1,24
ffffffffc0201f7c:	6105                	addi	sp,sp,32
ffffffffc0201f7e:	bf7ff06f          	j	ffffffffc0201b74 <slob_free>
ffffffffc0201f82:	ecafe0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0201f86:	0003b797          	auipc	a5,0x3b
ffffffffc0201f8a:	ed278793          	addi	a5,a5,-302 # ffffffffc023ce58 <bigblocks>
ffffffffc0201f8e:	6394                	ld	a3,0(a5)
ffffffffc0201f90:	c699                	beqz	a3,ffffffffc0201f9e <kfree+0xce>
ffffffffc0201f92:	669c                	ld	a5,8(a3)
ffffffffc0201f94:	6a80                	ld	s0,16(a3)
ffffffffc0201f96:	00f48763          	beq	s1,a5,ffffffffc0201fa4 <kfree+0xd4>
ffffffffc0201f9a:	4605                	li	a2,1
ffffffffc0201f9c:	b795                	j	ffffffffc0201f00 <kfree+0x30>
ffffffffc0201f9e:	ea8fe0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0201fa2:	bf85                	j	ffffffffc0201f12 <kfree+0x42>
ffffffffc0201fa4:	0003b797          	auipc	a5,0x3b
ffffffffc0201fa8:	ea87ba23          	sd	s0,-332(a5) # ffffffffc023ce58 <bigblocks>
ffffffffc0201fac:	8436                	mv	s0,a3
ffffffffc0201fae:	e98fe0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0201fb2:	bf9d                	j	ffffffffc0201f28 <kfree+0x58>
ffffffffc0201fb4:	8082                	ret
ffffffffc0201fb6:	0003b797          	auipc	a5,0x3b
ffffffffc0201fba:	ea87b123          	sd	s0,-350(a5) # ffffffffc023ce58 <bigblocks>
ffffffffc0201fbe:	8436                	mv	s0,a3
ffffffffc0201fc0:	b7a5                	j	ffffffffc0201f28 <kfree+0x58>
ffffffffc0201fc2:	86a6                	mv	a3,s1
ffffffffc0201fc4:	00008617          	auipc	a2,0x8
ffffffffc0201fc8:	c9460613          	addi	a2,a2,-876 # ffffffffc0209c58 <commands+0xe50>
ffffffffc0201fcc:	06e00593          	li	a1,110
ffffffffc0201fd0:	00008517          	auipc	a0,0x8
ffffffffc0201fd4:	a0050513          	addi	a0,a0,-1536 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0201fd8:	a40fe0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0201fdc:	00008617          	auipc	a2,0x8
ffffffffc0201fe0:	9d460613          	addi	a2,a2,-1580 # ffffffffc02099b0 <commands+0xba8>
ffffffffc0201fe4:	06200593          	li	a1,98
ffffffffc0201fe8:	00008517          	auipc	a0,0x8
ffffffffc0201fec:	9e850513          	addi	a0,a0,-1560 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0201ff0:	a28fe0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0201ff4 <swap_init>:
ffffffffc0201ff4:	7135                	addi	sp,sp,-160
ffffffffc0201ff6:	ed06                	sd	ra,152(sp)
ffffffffc0201ff8:	e922                	sd	s0,144(sp)
ffffffffc0201ffa:	e526                	sd	s1,136(sp)
ffffffffc0201ffc:	e14a                	sd	s2,128(sp)
ffffffffc0201ffe:	fcce                	sd	s3,120(sp)
ffffffffc0202000:	f8d2                	sd	s4,112(sp)
ffffffffc0202002:	f4d6                	sd	s5,104(sp)
ffffffffc0202004:	f0da                	sd	s6,96(sp)
ffffffffc0202006:	ecde                	sd	s7,88(sp)
ffffffffc0202008:	e8e2                	sd	s8,80(sp)
ffffffffc020200a:	e4e6                	sd	s9,72(sp)
ffffffffc020200c:	e0ea                	sd	s10,64(sp)
ffffffffc020200e:	fc6e                	sd	s11,56(sp)
ffffffffc0202010:	694020ef          	jal	ra,ffffffffc02046a4 <swapfs_init>
ffffffffc0202014:	0003b797          	auipc	a5,0x3b
ffffffffc0202018:	f4478793          	addi	a5,a5,-188 # ffffffffc023cf58 <max_swap_offset>
ffffffffc020201c:	6394                	ld	a3,0(a5)
ffffffffc020201e:	010007b7          	lui	a5,0x1000
ffffffffc0202022:	17e1                	addi	a5,a5,-8
ffffffffc0202024:	ff968713          	addi	a4,a3,-7
ffffffffc0202028:	46e7e663          	bltu	a5,a4,ffffffffc0202494 <swap_init+0x4a0>
ffffffffc020202c:	00030797          	auipc	a5,0x30
ffffffffc0202030:	95c78793          	addi	a5,a5,-1700 # ffffffffc0231988 <swap_manager_fifo>
ffffffffc0202034:	6798                	ld	a4,8(a5)
ffffffffc0202036:	0003b697          	auipc	a3,0x3b
ffffffffc020203a:	e2f6b523          	sd	a5,-470(a3) # ffffffffc023ce60 <sm>
ffffffffc020203e:	9702                	jalr	a4
ffffffffc0202040:	8b2a                	mv	s6,a0
ffffffffc0202042:	c10d                	beqz	a0,ffffffffc0202064 <swap_init+0x70>
ffffffffc0202044:	60ea                	ld	ra,152(sp)
ffffffffc0202046:	644a                	ld	s0,144(sp)
ffffffffc0202048:	855a                	mv	a0,s6
ffffffffc020204a:	64aa                	ld	s1,136(sp)
ffffffffc020204c:	690a                	ld	s2,128(sp)
ffffffffc020204e:	79e6                	ld	s3,120(sp)
ffffffffc0202050:	7a46                	ld	s4,112(sp)
ffffffffc0202052:	7aa6                	ld	s5,104(sp)
ffffffffc0202054:	7b06                	ld	s6,96(sp)
ffffffffc0202056:	6be6                	ld	s7,88(sp)
ffffffffc0202058:	6c46                	ld	s8,80(sp)
ffffffffc020205a:	6ca6                	ld	s9,72(sp)
ffffffffc020205c:	6d06                	ld	s10,64(sp)
ffffffffc020205e:	7de2                	ld	s11,56(sp)
ffffffffc0202060:	610d                	addi	sp,sp,160
ffffffffc0202062:	8082                	ret
ffffffffc0202064:	0003b797          	auipc	a5,0x3b
ffffffffc0202068:	dfc78793          	addi	a5,a5,-516 # ffffffffc023ce60 <sm>
ffffffffc020206c:	639c                	ld	a5,0(a5)
ffffffffc020206e:	00008517          	auipc	a0,0x8
ffffffffc0202072:	d0250513          	addi	a0,a0,-766 # ffffffffc0209d70 <commands+0xf68>
ffffffffc0202076:	0003b417          	auipc	s0,0x3b
ffffffffc020207a:	f2240413          	addi	s0,s0,-222 # ffffffffc023cf98 <free_area>
ffffffffc020207e:	638c                	ld	a1,0(a5)
ffffffffc0202080:	4785                	li	a5,1
ffffffffc0202082:	0003b717          	auipc	a4,0x3b
ffffffffc0202086:	def72323          	sw	a5,-538(a4) # ffffffffc023ce68 <swap_init_ok>
ffffffffc020208a:	84afe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020208e:	641c                	ld	a5,8(s0)
ffffffffc0202090:	32878663          	beq	a5,s0,ffffffffc02023bc <swap_init+0x3c8>
ffffffffc0202094:	ff07b703          	ld	a4,-16(a5)
ffffffffc0202098:	8305                	srli	a4,a4,0x1
ffffffffc020209a:	8b05                	andi	a4,a4,1
ffffffffc020209c:	32070463          	beqz	a4,ffffffffc02023c4 <swap_init+0x3d0>
ffffffffc02020a0:	4481                	li	s1,0
ffffffffc02020a2:	4901                	li	s2,0
ffffffffc02020a4:	a031                	j	ffffffffc02020b0 <swap_init+0xbc>
ffffffffc02020a6:	ff07b703          	ld	a4,-16(a5)
ffffffffc02020aa:	8b09                	andi	a4,a4,2
ffffffffc02020ac:	30070c63          	beqz	a4,ffffffffc02023c4 <swap_init+0x3d0>
ffffffffc02020b0:	ff87a703          	lw	a4,-8(a5)
ffffffffc02020b4:	679c                	ld	a5,8(a5)
ffffffffc02020b6:	2905                	addiw	s2,s2,1
ffffffffc02020b8:	9cb9                	addw	s1,s1,a4
ffffffffc02020ba:	fe8796e3          	bne	a5,s0,ffffffffc02020a6 <swap_init+0xb2>
ffffffffc02020be:	89a6                	mv	s3,s1
ffffffffc02020c0:	3f2010ef          	jal	ra,ffffffffc02034b2 <nr_free_pages>
ffffffffc02020c4:	5f351463          	bne	a0,s3,ffffffffc02026ac <swap_init+0x6b8>
ffffffffc02020c8:	8626                	mv	a2,s1
ffffffffc02020ca:	85ca                	mv	a1,s2
ffffffffc02020cc:	00008517          	auipc	a0,0x8
ffffffffc02020d0:	cec50513          	addi	a0,a0,-788 # ffffffffc0209db8 <commands+0xfb0>
ffffffffc02020d4:	800fe0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02020d8:	cabfe0ef          	jal	ra,ffffffffc0200d82 <mm_create>
ffffffffc02020dc:	8c2a                	mv	s8,a0
ffffffffc02020de:	54050763          	beqz	a0,ffffffffc020262c <swap_init+0x638>
ffffffffc02020e2:	0003b797          	auipc	a5,0x3b
ffffffffc02020e6:	dd678793          	addi	a5,a5,-554 # ffffffffc023ceb8 <check_mm_struct>
ffffffffc02020ea:	639c                	ld	a5,0(a5)
ffffffffc02020ec:	56079063          	bnez	a5,ffffffffc020264c <swap_init+0x658>
ffffffffc02020f0:	0003b797          	auipc	a5,0x3b
ffffffffc02020f4:	d8078793          	addi	a5,a5,-640 # ffffffffc023ce70 <boot_pgdir>
ffffffffc02020f8:	0007bb83          	ld	s7,0(a5)
ffffffffc02020fc:	0003b797          	auipc	a5,0x3b
ffffffffc0202100:	daa7be23          	sd	a0,-580(a5) # ffffffffc023ceb8 <check_mm_struct>
ffffffffc0202104:	000bb783          	ld	a5,0(s7)
ffffffffc0202108:	01753c23          	sd	s7,24(a0)
ffffffffc020210c:	56079063          	bnez	a5,ffffffffc020266c <swap_init+0x678>
ffffffffc0202110:	6599                	lui	a1,0x6
ffffffffc0202112:	460d                	li	a2,3
ffffffffc0202114:	6505                	lui	a0,0x1
ffffffffc0202116:	cb9fe0ef          	jal	ra,ffffffffc0200dce <vma_create>
ffffffffc020211a:	85aa                	mv	a1,a0
ffffffffc020211c:	56050863          	beqz	a0,ffffffffc020268c <swap_init+0x698>
ffffffffc0202120:	8562                	mv	a0,s8
ffffffffc0202122:	d19fe0ef          	jal	ra,ffffffffc0200e3a <insert_vma_struct>
ffffffffc0202126:	00008517          	auipc	a0,0x8
ffffffffc020212a:	cd250513          	addi	a0,a0,-814 # ffffffffc0209df8 <commands+0xff0>
ffffffffc020212e:	fa7fd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0202132:	018c3503          	ld	a0,24(s8)
ffffffffc0202136:	4605                	li	a2,1
ffffffffc0202138:	6585                	lui	a1,0x1
ffffffffc020213a:	3b8010ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc020213e:	44050763          	beqz	a0,ffffffffc020258c <swap_init+0x598>
ffffffffc0202142:	00008517          	auipc	a0,0x8
ffffffffc0202146:	d0650513          	addi	a0,a0,-762 # ffffffffc0209e48 <commands+0x1040>
ffffffffc020214a:	0003ba17          	auipc	s4,0x3b
ffffffffc020214e:	d86a0a13          	addi	s4,s4,-634 # ffffffffc023ced0 <check_rp>
ffffffffc0202152:	f83fd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0202156:	0003ba97          	auipc	s5,0x3b
ffffffffc020215a:	d9aa8a93          	addi	s5,s5,-614 # ffffffffc023cef0 <swap_in_seq_no>
ffffffffc020215e:	89d2                	mv	s3,s4
ffffffffc0202160:	4505                	li	a0,1
ffffffffc0202162:	282010ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202166:	00a9b023          	sd	a0,0(s3)
ffffffffc020216a:	2e050563          	beqz	a0,ffffffffc0202454 <swap_init+0x460>
ffffffffc020216e:	651c                	ld	a5,8(a0)
ffffffffc0202170:	8b89                	andi	a5,a5,2
ffffffffc0202172:	2c079163          	bnez	a5,ffffffffc0202434 <swap_init+0x440>
ffffffffc0202176:	09a1                	addi	s3,s3,8
ffffffffc0202178:	ff5994e3          	bne	s3,s5,ffffffffc0202160 <swap_init+0x16c>
ffffffffc020217c:	601c                	ld	a5,0(s0)
ffffffffc020217e:	00843983          	ld	s3,8(s0)
ffffffffc0202182:	0003bd17          	auipc	s10,0x3b
ffffffffc0202186:	d4ed0d13          	addi	s10,s10,-690 # ffffffffc023ced0 <check_rp>
ffffffffc020218a:	f03e                	sd	a5,32(sp)
ffffffffc020218c:	481c                	lw	a5,16(s0)
ffffffffc020218e:	f43e                	sd	a5,40(sp)
ffffffffc0202190:	0003b797          	auipc	a5,0x3b
ffffffffc0202194:	e087b823          	sd	s0,-496(a5) # ffffffffc023cfa0 <free_area+0x8>
ffffffffc0202198:	0003b797          	auipc	a5,0x3b
ffffffffc020219c:	e087b023          	sd	s0,-512(a5) # ffffffffc023cf98 <free_area>
ffffffffc02021a0:	0003b797          	auipc	a5,0x3b
ffffffffc02021a4:	e007a423          	sw	zero,-504(a5) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc02021a8:	000d3503          	ld	a0,0(s10)
ffffffffc02021ac:	4585                	li	a1,1
ffffffffc02021ae:	0d21                	addi	s10,s10,8
ffffffffc02021b0:	2bc010ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc02021b4:	ff5d1ae3          	bne	s10,s5,ffffffffc02021a8 <swap_init+0x1b4>
ffffffffc02021b8:	01042d03          	lw	s10,16(s0)
ffffffffc02021bc:	4791                	li	a5,4
ffffffffc02021be:	3afd1763          	bne	s10,a5,ffffffffc020256c <swap_init+0x578>
ffffffffc02021c2:	00008517          	auipc	a0,0x8
ffffffffc02021c6:	d0e50513          	addi	a0,a0,-754 # ffffffffc0209ed0 <commands+0x10c8>
ffffffffc02021ca:	f0bfd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02021ce:	6685                	lui	a3,0x1
ffffffffc02021d0:	0003b797          	auipc	a5,0x3b
ffffffffc02021d4:	c807a023          	sw	zero,-896(a5) # ffffffffc023ce50 <pgfault_num>
ffffffffc02021d8:	4629                	li	a2,10
ffffffffc02021da:	0003b797          	auipc	a5,0x3b
ffffffffc02021de:	c7678793          	addi	a5,a5,-906 # ffffffffc023ce50 <pgfault_num>
ffffffffc02021e2:	00c68023          	sb	a2,0(a3) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc02021e6:	4398                	lw	a4,0(a5)
ffffffffc02021e8:	4585                	li	a1,1
ffffffffc02021ea:	2701                	sext.w	a4,a4
ffffffffc02021ec:	34b71063          	bne	a4,a1,ffffffffc020252c <swap_init+0x538>
ffffffffc02021f0:	00c68823          	sb	a2,16(a3)
ffffffffc02021f4:	4394                	lw	a3,0(a5)
ffffffffc02021f6:	2681                	sext.w	a3,a3
ffffffffc02021f8:	34e69a63          	bne	a3,a4,ffffffffc020254c <swap_init+0x558>
ffffffffc02021fc:	6689                	lui	a3,0x2
ffffffffc02021fe:	462d                	li	a2,11
ffffffffc0202200:	00c68023          	sb	a2,0(a3) # 2000 <_binary_obj___user_forktree_out_size>
ffffffffc0202204:	4398                	lw	a4,0(a5)
ffffffffc0202206:	4589                	li	a1,2
ffffffffc0202208:	2701                	sext.w	a4,a4
ffffffffc020220a:	2ab71163          	bne	a4,a1,ffffffffc02024ac <swap_init+0x4b8>
ffffffffc020220e:	00c68823          	sb	a2,16(a3)
ffffffffc0202212:	4394                	lw	a3,0(a5)
ffffffffc0202214:	2681                	sext.w	a3,a3
ffffffffc0202216:	2ae69b63          	bne	a3,a4,ffffffffc02024cc <swap_init+0x4d8>
ffffffffc020221a:	668d                	lui	a3,0x3
ffffffffc020221c:	4631                	li	a2,12
ffffffffc020221e:	00c68023          	sb	a2,0(a3) # 3000 <_binary_obj___user_matrix_out_size+0x6c8>
ffffffffc0202222:	4398                	lw	a4,0(a5)
ffffffffc0202224:	458d                	li	a1,3
ffffffffc0202226:	2701                	sext.w	a4,a4
ffffffffc0202228:	2cb71263          	bne	a4,a1,ffffffffc02024ec <swap_init+0x4f8>
ffffffffc020222c:	00c68823          	sb	a2,16(a3)
ffffffffc0202230:	4394                	lw	a3,0(a5)
ffffffffc0202232:	2681                	sext.w	a3,a3
ffffffffc0202234:	2ce69c63          	bne	a3,a4,ffffffffc020250c <swap_init+0x518>
ffffffffc0202238:	6691                	lui	a3,0x4
ffffffffc020223a:	4635                	li	a2,13
ffffffffc020223c:	00c68023          	sb	a2,0(a3) # 4000 <_binary_obj___user_matrix_out_size+0x16c8>
ffffffffc0202240:	4398                	lw	a4,0(a5)
ffffffffc0202242:	2701                	sext.w	a4,a4
ffffffffc0202244:	37a71463          	bne	a4,s10,ffffffffc02025ac <swap_init+0x5b8>
ffffffffc0202248:	00c68823          	sb	a2,16(a3)
ffffffffc020224c:	439c                	lw	a5,0(a5)
ffffffffc020224e:	2781                	sext.w	a5,a5
ffffffffc0202250:	36e79e63          	bne	a5,a4,ffffffffc02025cc <swap_init+0x5d8>
ffffffffc0202254:	481c                	lw	a5,16(s0)
ffffffffc0202256:	38079b63          	bnez	a5,ffffffffc02025ec <swap_init+0x5f8>
ffffffffc020225a:	0003b797          	auipc	a5,0x3b
ffffffffc020225e:	c9678793          	addi	a5,a5,-874 # ffffffffc023cef0 <swap_in_seq_no>
ffffffffc0202262:	0003b717          	auipc	a4,0x3b
ffffffffc0202266:	cb670713          	addi	a4,a4,-842 # ffffffffc023cf18 <swap_out_seq_no>
ffffffffc020226a:	0003b617          	auipc	a2,0x3b
ffffffffc020226e:	cae60613          	addi	a2,a2,-850 # ffffffffc023cf18 <swap_out_seq_no>
ffffffffc0202272:	56fd                	li	a3,-1
ffffffffc0202274:	c394                	sw	a3,0(a5)
ffffffffc0202276:	c314                	sw	a3,0(a4)
ffffffffc0202278:	0791                	addi	a5,a5,4
ffffffffc020227a:	0711                	addi	a4,a4,4
ffffffffc020227c:	fec79ce3          	bne	a5,a2,ffffffffc0202274 <swap_init+0x280>
ffffffffc0202280:	0003b697          	auipc	a3,0x3b
ffffffffc0202284:	cf868693          	addi	a3,a3,-776 # ffffffffc023cf78 <check_ptep>
ffffffffc0202288:	0003b817          	auipc	a6,0x3b
ffffffffc020228c:	c4880813          	addi	a6,a6,-952 # ffffffffc023ced0 <check_rp>
ffffffffc0202290:	6705                	lui	a4,0x1
ffffffffc0202292:	0003bd97          	auipc	s11,0x3b
ffffffffc0202296:	be6d8d93          	addi	s11,s11,-1050 # ffffffffc023ce78 <npage>
ffffffffc020229a:	0000ac97          	auipc	s9,0xa
ffffffffc020229e:	816c8c93          	addi	s9,s9,-2026 # ffffffffc020bab0 <nbase>
ffffffffc02022a2:	0003bd17          	auipc	s10,0x3b
ffffffffc02022a6:	d26d0d13          	addi	s10,s10,-730 # ffffffffc023cfc8 <pages>
ffffffffc02022aa:	85ba                	mv	a1,a4
ffffffffc02022ac:	0006b023          	sd	zero,0(a3)
ffffffffc02022b0:	4601                	li	a2,0
ffffffffc02022b2:	855e                	mv	a0,s7
ffffffffc02022b4:	ec42                	sd	a6,24(sp)
ffffffffc02022b6:	e83a                	sd	a4,16(sp)
ffffffffc02022b8:	e436                	sd	a3,8(sp)
ffffffffc02022ba:	238010ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc02022be:	66a2                	ld	a3,8(sp)
ffffffffc02022c0:	6742                	ld	a4,16(sp)
ffffffffc02022c2:	6862                	ld	a6,24(sp)
ffffffffc02022c4:	e288                	sd	a0,0(a3)
ffffffffc02022c6:	1a050763          	beqz	a0,ffffffffc0202474 <swap_init+0x480>
ffffffffc02022ca:	611c                	ld	a5,0(a0)
ffffffffc02022cc:	0017f613          	andi	a2,a5,1
ffffffffc02022d0:	14060663          	beqz	a2,ffffffffc020241c <swap_init+0x428>
ffffffffc02022d4:	000db603          	ld	a2,0(s11)
ffffffffc02022d8:	078a                	slli	a5,a5,0x2
ffffffffc02022da:	83b1                	srli	a5,a5,0xc
ffffffffc02022dc:	10c7f463          	bgeu	a5,a2,ffffffffc02023e4 <swap_init+0x3f0>
ffffffffc02022e0:	000cb603          	ld	a2,0(s9)
ffffffffc02022e4:	00083583          	ld	a1,0(a6)
ffffffffc02022e8:	8532                	mv	a0,a2
ffffffffc02022ea:	e432                	sd	a2,8(sp)
ffffffffc02022ec:	000d3603          	ld	a2,0(s10)
ffffffffc02022f0:	8f89                	sub	a5,a5,a0
ffffffffc02022f2:	079a                	slli	a5,a5,0x6
ffffffffc02022f4:	97b2                	add	a5,a5,a2
ffffffffc02022f6:	10f59363          	bne	a1,a5,ffffffffc02023fc <swap_init+0x408>
ffffffffc02022fa:	6785                	lui	a5,0x1
ffffffffc02022fc:	973e                	add	a4,a4,a5
ffffffffc02022fe:	6795                	lui	a5,0x5
ffffffffc0202300:	06a1                	addi	a3,a3,8
ffffffffc0202302:	0821                	addi	a6,a6,8
ffffffffc0202304:	faf713e3          	bne	a4,a5,ffffffffc02022aa <swap_init+0x2b6>
ffffffffc0202308:	00008517          	auipc	a0,0x8
ffffffffc020230c:	c9850513          	addi	a0,a0,-872 # ffffffffc0209fa0 <commands+0x1198>
ffffffffc0202310:	dc5fd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0202314:	0003b797          	auipc	a5,0x3b
ffffffffc0202318:	b4c78793          	addi	a5,a5,-1204 # ffffffffc023ce60 <sm>
ffffffffc020231c:	639c                	ld	a5,0(a5)
ffffffffc020231e:	7f9c                	ld	a5,56(a5)
ffffffffc0202320:	9782                	jalr	a5
ffffffffc0202322:	2e051563          	bnez	a0,ffffffffc020260c <swap_init+0x618>
ffffffffc0202326:	000a3503          	ld	a0,0(s4)
ffffffffc020232a:	4585                	li	a1,1
ffffffffc020232c:	0a21                	addi	s4,s4,8
ffffffffc020232e:	13e010ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202332:	ff5a1ae3          	bne	s4,s5,ffffffffc0202326 <swap_init+0x332>
ffffffffc0202336:	000bb783          	ld	a5,0(s7)
ffffffffc020233a:	000db703          	ld	a4,0(s11)
ffffffffc020233e:	078a                	slli	a5,a5,0x2
ffffffffc0202340:	83b1                	srli	a5,a5,0xc
ffffffffc0202342:	0ae7f163          	bgeu	a5,a4,ffffffffc02023e4 <swap_init+0x3f0>
ffffffffc0202346:	6722                	ld	a4,8(sp)
ffffffffc0202348:	000d3503          	ld	a0,0(s10)
ffffffffc020234c:	4585                	li	a1,1
ffffffffc020234e:	8f99                	sub	a5,a5,a4
ffffffffc0202350:	079a                	slli	a5,a5,0x6
ffffffffc0202352:	953e                	add	a0,a0,a5
ffffffffc0202354:	118010ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202358:	000bb023          	sd	zero,0(s7)
ffffffffc020235c:	000c3c23          	sd	zero,24(s8)
ffffffffc0202360:	8562                	mv	a0,s8
ffffffffc0202362:	ba7fe0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc0202366:	0003b797          	auipc	a5,0x3b
ffffffffc020236a:	b407b923          	sd	zero,-1198(a5) # ffffffffc023ceb8 <check_mm_struct>
ffffffffc020236e:	77a2                	ld	a5,40(sp)
ffffffffc0202370:	0003b717          	auipc	a4,0x3b
ffffffffc0202374:	c2f72c23          	sw	a5,-968(a4) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc0202378:	7782                	ld	a5,32(sp)
ffffffffc020237a:	0003b717          	auipc	a4,0x3b
ffffffffc020237e:	c0f73f23          	sd	a5,-994(a4) # ffffffffc023cf98 <free_area>
ffffffffc0202382:	0003b797          	auipc	a5,0x3b
ffffffffc0202386:	c137bf23          	sd	s3,-994(a5) # ffffffffc023cfa0 <free_area+0x8>
ffffffffc020238a:	00898a63          	beq	s3,s0,ffffffffc020239e <swap_init+0x3aa>
ffffffffc020238e:	ff89a783          	lw	a5,-8(s3)
ffffffffc0202392:	0089b983          	ld	s3,8(s3)
ffffffffc0202396:	397d                	addiw	s2,s2,-1
ffffffffc0202398:	9c9d                	subw	s1,s1,a5
ffffffffc020239a:	fe899ae3          	bne	s3,s0,ffffffffc020238e <swap_init+0x39a>
ffffffffc020239e:	8626                	mv	a2,s1
ffffffffc02023a0:	85ca                	mv	a1,s2
ffffffffc02023a2:	00008517          	auipc	a0,0x8
ffffffffc02023a6:	c2e50513          	addi	a0,a0,-978 # ffffffffc0209fd0 <commands+0x11c8>
ffffffffc02023aa:	d2bfd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02023ae:	00008517          	auipc	a0,0x8
ffffffffc02023b2:	c4250513          	addi	a0,a0,-958 # ffffffffc0209ff0 <commands+0x11e8>
ffffffffc02023b6:	d1ffd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02023ba:	b169                	j	ffffffffc0202044 <swap_init+0x50>
ffffffffc02023bc:	4481                	li	s1,0
ffffffffc02023be:	4901                	li	s2,0
ffffffffc02023c0:	4981                	li	s3,0
ffffffffc02023c2:	b9fd                	j	ffffffffc02020c0 <swap_init+0xcc>
ffffffffc02023c4:	00008697          	auipc	a3,0x8
ffffffffc02023c8:	9c468693          	addi	a3,a3,-1596 # ffffffffc0209d88 <commands+0xf80>
ffffffffc02023cc:	00007617          	auipc	a2,0x7
ffffffffc02023d0:	ebc60613          	addi	a2,a2,-324 # ffffffffc0209288 <commands+0x480>
ffffffffc02023d4:	0bc00593          	li	a1,188
ffffffffc02023d8:	00008517          	auipc	a0,0x8
ffffffffc02023dc:	98850513          	addi	a0,a0,-1656 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02023e0:	e39fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02023e4:	00007617          	auipc	a2,0x7
ffffffffc02023e8:	5cc60613          	addi	a2,a2,1484 # ffffffffc02099b0 <commands+0xba8>
ffffffffc02023ec:	06200593          	li	a1,98
ffffffffc02023f0:	00007517          	auipc	a0,0x7
ffffffffc02023f4:	5e050513          	addi	a0,a0,1504 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02023f8:	e21fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02023fc:	00008697          	auipc	a3,0x8
ffffffffc0202400:	b7c68693          	addi	a3,a3,-1156 # ffffffffc0209f78 <commands+0x1170>
ffffffffc0202404:	00007617          	auipc	a2,0x7
ffffffffc0202408:	e8460613          	addi	a2,a2,-380 # ffffffffc0209288 <commands+0x480>
ffffffffc020240c:	0fc00593          	li	a1,252
ffffffffc0202410:	00008517          	auipc	a0,0x8
ffffffffc0202414:	95050513          	addi	a0,a0,-1712 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202418:	e01fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020241c:	00008617          	auipc	a2,0x8
ffffffffc0202420:	b3460613          	addi	a2,a2,-1228 # ffffffffc0209f50 <commands+0x1148>
ffffffffc0202424:	07400593          	li	a1,116
ffffffffc0202428:	00007517          	auipc	a0,0x7
ffffffffc020242c:	5a850513          	addi	a0,a0,1448 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0202430:	de9fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202434:	00008697          	auipc	a3,0x8
ffffffffc0202438:	a5468693          	addi	a3,a3,-1452 # ffffffffc0209e88 <commands+0x1080>
ffffffffc020243c:	00007617          	auipc	a2,0x7
ffffffffc0202440:	e4c60613          	addi	a2,a2,-436 # ffffffffc0209288 <commands+0x480>
ffffffffc0202444:	0dd00593          	li	a1,221
ffffffffc0202448:	00008517          	auipc	a0,0x8
ffffffffc020244c:	91850513          	addi	a0,a0,-1768 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202450:	dc9fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202454:	00008697          	auipc	a3,0x8
ffffffffc0202458:	a1c68693          	addi	a3,a3,-1508 # ffffffffc0209e70 <commands+0x1068>
ffffffffc020245c:	00007617          	auipc	a2,0x7
ffffffffc0202460:	e2c60613          	addi	a2,a2,-468 # ffffffffc0209288 <commands+0x480>
ffffffffc0202464:	0dc00593          	li	a1,220
ffffffffc0202468:	00008517          	auipc	a0,0x8
ffffffffc020246c:	8f850513          	addi	a0,a0,-1800 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202470:	da9fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202474:	00008697          	auipc	a3,0x8
ffffffffc0202478:	ac468693          	addi	a3,a3,-1340 # ffffffffc0209f38 <commands+0x1130>
ffffffffc020247c:	00007617          	auipc	a2,0x7
ffffffffc0202480:	e0c60613          	addi	a2,a2,-500 # ffffffffc0209288 <commands+0x480>
ffffffffc0202484:	0fb00593          	li	a1,251
ffffffffc0202488:	00008517          	auipc	a0,0x8
ffffffffc020248c:	8d850513          	addi	a0,a0,-1832 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202490:	d89fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202494:	00008617          	auipc	a2,0x8
ffffffffc0202498:	8ac60613          	addi	a2,a2,-1876 # ffffffffc0209d40 <commands+0xf38>
ffffffffc020249c:	02800593          	li	a1,40
ffffffffc02024a0:	00008517          	auipc	a0,0x8
ffffffffc02024a4:	8c050513          	addi	a0,a0,-1856 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02024a8:	d71fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02024ac:	00008697          	auipc	a3,0x8
ffffffffc02024b0:	a5c68693          	addi	a3,a3,-1444 # ffffffffc0209f08 <commands+0x1100>
ffffffffc02024b4:	00007617          	auipc	a2,0x7
ffffffffc02024b8:	dd460613          	addi	a2,a2,-556 # ffffffffc0209288 <commands+0x480>
ffffffffc02024bc:	09700593          	li	a1,151
ffffffffc02024c0:	00008517          	auipc	a0,0x8
ffffffffc02024c4:	8a050513          	addi	a0,a0,-1888 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02024c8:	d51fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02024cc:	00008697          	auipc	a3,0x8
ffffffffc02024d0:	a3c68693          	addi	a3,a3,-1476 # ffffffffc0209f08 <commands+0x1100>
ffffffffc02024d4:	00007617          	auipc	a2,0x7
ffffffffc02024d8:	db460613          	addi	a2,a2,-588 # ffffffffc0209288 <commands+0x480>
ffffffffc02024dc:	09900593          	li	a1,153
ffffffffc02024e0:	00008517          	auipc	a0,0x8
ffffffffc02024e4:	88050513          	addi	a0,a0,-1920 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02024e8:	d31fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02024ec:	00008697          	auipc	a3,0x8
ffffffffc02024f0:	a2c68693          	addi	a3,a3,-1492 # ffffffffc0209f18 <commands+0x1110>
ffffffffc02024f4:	00007617          	auipc	a2,0x7
ffffffffc02024f8:	d9460613          	addi	a2,a2,-620 # ffffffffc0209288 <commands+0x480>
ffffffffc02024fc:	09b00593          	li	a1,155
ffffffffc0202500:	00008517          	auipc	a0,0x8
ffffffffc0202504:	86050513          	addi	a0,a0,-1952 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202508:	d11fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020250c:	00008697          	auipc	a3,0x8
ffffffffc0202510:	a0c68693          	addi	a3,a3,-1524 # ffffffffc0209f18 <commands+0x1110>
ffffffffc0202514:	00007617          	auipc	a2,0x7
ffffffffc0202518:	d7460613          	addi	a2,a2,-652 # ffffffffc0209288 <commands+0x480>
ffffffffc020251c:	09d00593          	li	a1,157
ffffffffc0202520:	00008517          	auipc	a0,0x8
ffffffffc0202524:	84050513          	addi	a0,a0,-1984 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202528:	cf1fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020252c:	00008697          	auipc	a3,0x8
ffffffffc0202530:	9cc68693          	addi	a3,a3,-1588 # ffffffffc0209ef8 <commands+0x10f0>
ffffffffc0202534:	00007617          	auipc	a2,0x7
ffffffffc0202538:	d5460613          	addi	a2,a2,-684 # ffffffffc0209288 <commands+0x480>
ffffffffc020253c:	09300593          	li	a1,147
ffffffffc0202540:	00008517          	auipc	a0,0x8
ffffffffc0202544:	82050513          	addi	a0,a0,-2016 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202548:	cd1fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020254c:	00008697          	auipc	a3,0x8
ffffffffc0202550:	9ac68693          	addi	a3,a3,-1620 # ffffffffc0209ef8 <commands+0x10f0>
ffffffffc0202554:	00007617          	auipc	a2,0x7
ffffffffc0202558:	d3460613          	addi	a2,a2,-716 # ffffffffc0209288 <commands+0x480>
ffffffffc020255c:	09500593          	li	a1,149
ffffffffc0202560:	00008517          	auipc	a0,0x8
ffffffffc0202564:	80050513          	addi	a0,a0,-2048 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202568:	cb1fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020256c:	00008697          	auipc	a3,0x8
ffffffffc0202570:	93c68693          	addi	a3,a3,-1732 # ffffffffc0209ea8 <commands+0x10a0>
ffffffffc0202574:	00007617          	auipc	a2,0x7
ffffffffc0202578:	d1460613          	addi	a2,a2,-748 # ffffffffc0209288 <commands+0x480>
ffffffffc020257c:	0ea00593          	li	a1,234
ffffffffc0202580:	00007517          	auipc	a0,0x7
ffffffffc0202584:	7e050513          	addi	a0,a0,2016 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202588:	c91fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020258c:	00008697          	auipc	a3,0x8
ffffffffc0202590:	8a468693          	addi	a3,a3,-1884 # ffffffffc0209e30 <commands+0x1028>
ffffffffc0202594:	00007617          	auipc	a2,0x7
ffffffffc0202598:	cf460613          	addi	a2,a2,-780 # ffffffffc0209288 <commands+0x480>
ffffffffc020259c:	0d700593          	li	a1,215
ffffffffc02025a0:	00007517          	auipc	a0,0x7
ffffffffc02025a4:	7c050513          	addi	a0,a0,1984 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02025a8:	c71fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02025ac:	00007697          	auipc	a3,0x7
ffffffffc02025b0:	4cc68693          	addi	a3,a3,1228 # ffffffffc0209a78 <commands+0xc70>
ffffffffc02025b4:	00007617          	auipc	a2,0x7
ffffffffc02025b8:	cd460613          	addi	a2,a2,-812 # ffffffffc0209288 <commands+0x480>
ffffffffc02025bc:	09f00593          	li	a1,159
ffffffffc02025c0:	00007517          	auipc	a0,0x7
ffffffffc02025c4:	7a050513          	addi	a0,a0,1952 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02025c8:	c51fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02025cc:	00007697          	auipc	a3,0x7
ffffffffc02025d0:	4ac68693          	addi	a3,a3,1196 # ffffffffc0209a78 <commands+0xc70>
ffffffffc02025d4:	00007617          	auipc	a2,0x7
ffffffffc02025d8:	cb460613          	addi	a2,a2,-844 # ffffffffc0209288 <commands+0x480>
ffffffffc02025dc:	0a100593          	li	a1,161
ffffffffc02025e0:	00007517          	auipc	a0,0x7
ffffffffc02025e4:	78050513          	addi	a0,a0,1920 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02025e8:	c31fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02025ec:	00008697          	auipc	a3,0x8
ffffffffc02025f0:	93c68693          	addi	a3,a3,-1732 # ffffffffc0209f28 <commands+0x1120>
ffffffffc02025f4:	00007617          	auipc	a2,0x7
ffffffffc02025f8:	c9460613          	addi	a2,a2,-876 # ffffffffc0209288 <commands+0x480>
ffffffffc02025fc:	0f300593          	li	a1,243
ffffffffc0202600:	00007517          	auipc	a0,0x7
ffffffffc0202604:	76050513          	addi	a0,a0,1888 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202608:	c11fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020260c:	00008697          	auipc	a3,0x8
ffffffffc0202610:	9bc68693          	addi	a3,a3,-1604 # ffffffffc0209fc8 <commands+0x11c0>
ffffffffc0202614:	00007617          	auipc	a2,0x7
ffffffffc0202618:	c7460613          	addi	a2,a2,-908 # ffffffffc0209288 <commands+0x480>
ffffffffc020261c:	10200593          	li	a1,258
ffffffffc0202620:	00007517          	auipc	a0,0x7
ffffffffc0202624:	74050513          	addi	a0,a0,1856 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202628:	bf1fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020262c:	00007697          	auipc	a3,0x7
ffffffffc0202630:	1bc68693          	addi	a3,a3,444 # ffffffffc02097e8 <commands+0x9e0>
ffffffffc0202634:	00007617          	auipc	a2,0x7
ffffffffc0202638:	c5460613          	addi	a2,a2,-940 # ffffffffc0209288 <commands+0x480>
ffffffffc020263c:	0c400593          	li	a1,196
ffffffffc0202640:	00007517          	auipc	a0,0x7
ffffffffc0202644:	72050513          	addi	a0,a0,1824 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202648:	bd1fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020264c:	00007697          	auipc	a3,0x7
ffffffffc0202650:	79468693          	addi	a3,a3,1940 # ffffffffc0209de0 <commands+0xfd8>
ffffffffc0202654:	00007617          	auipc	a2,0x7
ffffffffc0202658:	c3460613          	addi	a2,a2,-972 # ffffffffc0209288 <commands+0x480>
ffffffffc020265c:	0c700593          	li	a1,199
ffffffffc0202660:	00007517          	auipc	a0,0x7
ffffffffc0202664:	70050513          	addi	a0,a0,1792 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202668:	bb1fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020266c:	00007697          	auipc	a3,0x7
ffffffffc0202670:	30468693          	addi	a3,a3,772 # ffffffffc0209970 <commands+0xb68>
ffffffffc0202674:	00007617          	auipc	a2,0x7
ffffffffc0202678:	c1460613          	addi	a2,a2,-1004 # ffffffffc0209288 <commands+0x480>
ffffffffc020267c:	0cc00593          	li	a1,204
ffffffffc0202680:	00007517          	auipc	a0,0x7
ffffffffc0202684:	6e050513          	addi	a0,a0,1760 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202688:	b91fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020268c:	00007697          	auipc	a3,0x7
ffffffffc0202690:	3b468693          	addi	a3,a3,948 # ffffffffc0209a40 <commands+0xc38>
ffffffffc0202694:	00007617          	auipc	a2,0x7
ffffffffc0202698:	bf460613          	addi	a2,a2,-1036 # ffffffffc0209288 <commands+0x480>
ffffffffc020269c:	0cf00593          	li	a1,207
ffffffffc02026a0:	00007517          	auipc	a0,0x7
ffffffffc02026a4:	6c050513          	addi	a0,a0,1728 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02026a8:	b71fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02026ac:	00007697          	auipc	a3,0x7
ffffffffc02026b0:	6ec68693          	addi	a3,a3,1772 # ffffffffc0209d98 <commands+0xf90>
ffffffffc02026b4:	00007617          	auipc	a2,0x7
ffffffffc02026b8:	bd460613          	addi	a2,a2,-1068 # ffffffffc0209288 <commands+0x480>
ffffffffc02026bc:	0bf00593          	li	a1,191
ffffffffc02026c0:	00007517          	auipc	a0,0x7
ffffffffc02026c4:	6a050513          	addi	a0,a0,1696 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02026c8:	b51fd0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02026cc <swap_init_mm>:
ffffffffc02026cc:	0003a797          	auipc	a5,0x3a
ffffffffc02026d0:	79478793          	addi	a5,a5,1940 # ffffffffc023ce60 <sm>
ffffffffc02026d4:	639c                	ld	a5,0(a5)
ffffffffc02026d6:	0107b303          	ld	t1,16(a5)
ffffffffc02026da:	8302                	jr	t1

ffffffffc02026dc <swap_map_swappable>:
ffffffffc02026dc:	0003a797          	auipc	a5,0x3a
ffffffffc02026e0:	78478793          	addi	a5,a5,1924 # ffffffffc023ce60 <sm>
ffffffffc02026e4:	639c                	ld	a5,0(a5)
ffffffffc02026e6:	0207b303          	ld	t1,32(a5)
ffffffffc02026ea:	8302                	jr	t1

ffffffffc02026ec <swap_out>:
ffffffffc02026ec:	711d                	addi	sp,sp,-96
ffffffffc02026ee:	ec86                	sd	ra,88(sp)
ffffffffc02026f0:	e8a2                	sd	s0,80(sp)
ffffffffc02026f2:	e4a6                	sd	s1,72(sp)
ffffffffc02026f4:	e0ca                	sd	s2,64(sp)
ffffffffc02026f6:	fc4e                	sd	s3,56(sp)
ffffffffc02026f8:	f852                	sd	s4,48(sp)
ffffffffc02026fa:	f456                	sd	s5,40(sp)
ffffffffc02026fc:	f05a                	sd	s6,32(sp)
ffffffffc02026fe:	ec5e                	sd	s7,24(sp)
ffffffffc0202700:	e862                	sd	s8,16(sp)
ffffffffc0202702:	cde9                	beqz	a1,ffffffffc02027dc <swap_out+0xf0>
ffffffffc0202704:	8ab2                	mv	s5,a2
ffffffffc0202706:	892a                	mv	s2,a0
ffffffffc0202708:	8a2e                	mv	s4,a1
ffffffffc020270a:	4401                	li	s0,0
ffffffffc020270c:	0003a997          	auipc	s3,0x3a
ffffffffc0202710:	75498993          	addi	s3,s3,1876 # ffffffffc023ce60 <sm>
ffffffffc0202714:	00008b17          	auipc	s6,0x8
ffffffffc0202718:	95cb0b13          	addi	s6,s6,-1700 # ffffffffc020a070 <commands+0x1268>
ffffffffc020271c:	00008b97          	auipc	s7,0x8
ffffffffc0202720:	93cb8b93          	addi	s7,s7,-1732 # ffffffffc020a058 <commands+0x1250>
ffffffffc0202724:	a825                	j	ffffffffc020275c <swap_out+0x70>
ffffffffc0202726:	67a2                	ld	a5,8(sp)
ffffffffc0202728:	8626                	mv	a2,s1
ffffffffc020272a:	85a2                	mv	a1,s0
ffffffffc020272c:	7f94                	ld	a3,56(a5)
ffffffffc020272e:	855a                	mv	a0,s6
ffffffffc0202730:	2405                	addiw	s0,s0,1
ffffffffc0202732:	82b1                	srli	a3,a3,0xc
ffffffffc0202734:	0685                	addi	a3,a3,1
ffffffffc0202736:	99ffd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020273a:	6522                	ld	a0,8(sp)
ffffffffc020273c:	4585                	li	a1,1
ffffffffc020273e:	7d1c                	ld	a5,56(a0)
ffffffffc0202740:	83b1                	srli	a5,a5,0xc
ffffffffc0202742:	0785                	addi	a5,a5,1
ffffffffc0202744:	07a2                	slli	a5,a5,0x8
ffffffffc0202746:	00fc3023          	sd	a5,0(s8)
ffffffffc020274a:	523000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc020274e:	01893503          	ld	a0,24(s2)
ffffffffc0202752:	85a6                	mv	a1,s1
ffffffffc0202754:	6b7010ef          	jal	ra,ffffffffc020460a <tlb_invalidate>
ffffffffc0202758:	048a0d63          	beq	s4,s0,ffffffffc02027b2 <swap_out+0xc6>
ffffffffc020275c:	0009b783          	ld	a5,0(s3)
ffffffffc0202760:	8656                	mv	a2,s5
ffffffffc0202762:	002c                	addi	a1,sp,8
ffffffffc0202764:	7b9c                	ld	a5,48(a5)
ffffffffc0202766:	854a                	mv	a0,s2
ffffffffc0202768:	9782                	jalr	a5
ffffffffc020276a:	e12d                	bnez	a0,ffffffffc02027cc <swap_out+0xe0>
ffffffffc020276c:	67a2                	ld	a5,8(sp)
ffffffffc020276e:	01893503          	ld	a0,24(s2)
ffffffffc0202772:	4601                	li	a2,0
ffffffffc0202774:	7f84                	ld	s1,56(a5)
ffffffffc0202776:	85a6                	mv	a1,s1
ffffffffc0202778:	57b000ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc020277c:	611c                	ld	a5,0(a0)
ffffffffc020277e:	8c2a                	mv	s8,a0
ffffffffc0202780:	8b85                	andi	a5,a5,1
ffffffffc0202782:	cfb9                	beqz	a5,ffffffffc02027e0 <swap_out+0xf4>
ffffffffc0202784:	65a2                	ld	a1,8(sp)
ffffffffc0202786:	7d9c                	ld	a5,56(a1)
ffffffffc0202788:	83b1                	srli	a5,a5,0xc
ffffffffc020278a:	00178513          	addi	a0,a5,1
ffffffffc020278e:	0522                	slli	a0,a0,0x8
ffffffffc0202790:	7e5010ef          	jal	ra,ffffffffc0204774 <swapfs_write>
ffffffffc0202794:	d949                	beqz	a0,ffffffffc0202726 <swap_out+0x3a>
ffffffffc0202796:	855e                	mv	a0,s7
ffffffffc0202798:	93dfd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020279c:	0009b783          	ld	a5,0(s3)
ffffffffc02027a0:	6622                	ld	a2,8(sp)
ffffffffc02027a2:	4681                	li	a3,0
ffffffffc02027a4:	739c                	ld	a5,32(a5)
ffffffffc02027a6:	85a6                	mv	a1,s1
ffffffffc02027a8:	854a                	mv	a0,s2
ffffffffc02027aa:	2405                	addiw	s0,s0,1
ffffffffc02027ac:	9782                	jalr	a5
ffffffffc02027ae:	fa8a17e3          	bne	s4,s0,ffffffffc020275c <swap_out+0x70>
ffffffffc02027b2:	8522                	mv	a0,s0
ffffffffc02027b4:	60e6                	ld	ra,88(sp)
ffffffffc02027b6:	6446                	ld	s0,80(sp)
ffffffffc02027b8:	64a6                	ld	s1,72(sp)
ffffffffc02027ba:	6906                	ld	s2,64(sp)
ffffffffc02027bc:	79e2                	ld	s3,56(sp)
ffffffffc02027be:	7a42                	ld	s4,48(sp)
ffffffffc02027c0:	7aa2                	ld	s5,40(sp)
ffffffffc02027c2:	7b02                	ld	s6,32(sp)
ffffffffc02027c4:	6be2                	ld	s7,24(sp)
ffffffffc02027c6:	6c42                	ld	s8,16(sp)
ffffffffc02027c8:	6125                	addi	sp,sp,96
ffffffffc02027ca:	8082                	ret
ffffffffc02027cc:	85a2                	mv	a1,s0
ffffffffc02027ce:	00008517          	auipc	a0,0x8
ffffffffc02027d2:	84250513          	addi	a0,a0,-1982 # ffffffffc020a010 <commands+0x1208>
ffffffffc02027d6:	8fffd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02027da:	bfe1                	j	ffffffffc02027b2 <swap_out+0xc6>
ffffffffc02027dc:	4401                	li	s0,0
ffffffffc02027de:	bfd1                	j	ffffffffc02027b2 <swap_out+0xc6>
ffffffffc02027e0:	00008697          	auipc	a3,0x8
ffffffffc02027e4:	86068693          	addi	a3,a3,-1952 # ffffffffc020a040 <commands+0x1238>
ffffffffc02027e8:	00007617          	auipc	a2,0x7
ffffffffc02027ec:	aa060613          	addi	a2,a2,-1376 # ffffffffc0209288 <commands+0x480>
ffffffffc02027f0:	06800593          	li	a1,104
ffffffffc02027f4:	00007517          	auipc	a0,0x7
ffffffffc02027f8:	56c50513          	addi	a0,a0,1388 # ffffffffc0209d60 <commands+0xf58>
ffffffffc02027fc:	a1dfd0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0202800 <swap_in>:
ffffffffc0202800:	7179                	addi	sp,sp,-48
ffffffffc0202802:	e84a                	sd	s2,16(sp)
ffffffffc0202804:	892a                	mv	s2,a0
ffffffffc0202806:	4505                	li	a0,1
ffffffffc0202808:	ec26                	sd	s1,24(sp)
ffffffffc020280a:	e44e                	sd	s3,8(sp)
ffffffffc020280c:	f406                	sd	ra,40(sp)
ffffffffc020280e:	f022                	sd	s0,32(sp)
ffffffffc0202810:	84ae                	mv	s1,a1
ffffffffc0202812:	89b2                	mv	s3,a2
ffffffffc0202814:	3d1000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202818:	c129                	beqz	a0,ffffffffc020285a <swap_in+0x5a>
ffffffffc020281a:	842a                	mv	s0,a0
ffffffffc020281c:	01893503          	ld	a0,24(s2)
ffffffffc0202820:	4601                	li	a2,0
ffffffffc0202822:	85a6                	mv	a1,s1
ffffffffc0202824:	4cf000ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0202828:	892a                	mv	s2,a0
ffffffffc020282a:	6108                	ld	a0,0(a0)
ffffffffc020282c:	85a2                	mv	a1,s0
ffffffffc020282e:	6af010ef          	jal	ra,ffffffffc02046dc <swapfs_read>
ffffffffc0202832:	00093583          	ld	a1,0(s2)
ffffffffc0202836:	8626                	mv	a2,s1
ffffffffc0202838:	00007517          	auipc	a0,0x7
ffffffffc020283c:	4c850513          	addi	a0,a0,1224 # ffffffffc0209d00 <commands+0xef8>
ffffffffc0202840:	81a1                	srli	a1,a1,0x8
ffffffffc0202842:	893fd0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0202846:	70a2                	ld	ra,40(sp)
ffffffffc0202848:	0089b023          	sd	s0,0(s3)
ffffffffc020284c:	7402                	ld	s0,32(sp)
ffffffffc020284e:	64e2                	ld	s1,24(sp)
ffffffffc0202850:	6942                	ld	s2,16(sp)
ffffffffc0202852:	69a2                	ld	s3,8(sp)
ffffffffc0202854:	4501                	li	a0,0
ffffffffc0202856:	6145                	addi	sp,sp,48
ffffffffc0202858:	8082                	ret
ffffffffc020285a:	00007697          	auipc	a3,0x7
ffffffffc020285e:	49668693          	addi	a3,a3,1174 # ffffffffc0209cf0 <commands+0xee8>
ffffffffc0202862:	00007617          	auipc	a2,0x7
ffffffffc0202866:	a2660613          	addi	a2,a2,-1498 # ffffffffc0209288 <commands+0x480>
ffffffffc020286a:	07e00593          	li	a1,126
ffffffffc020286e:	00007517          	auipc	a0,0x7
ffffffffc0202872:	4f250513          	addi	a0,a0,1266 # ffffffffc0209d60 <commands+0xf58>
ffffffffc0202876:	9a3fd0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc020287a <default_init>:
ffffffffc020287a:	0003a797          	auipc	a5,0x3a
ffffffffc020287e:	71e78793          	addi	a5,a5,1822 # ffffffffc023cf98 <free_area>
ffffffffc0202882:	e79c                	sd	a5,8(a5)
ffffffffc0202884:	e39c                	sd	a5,0(a5)
ffffffffc0202886:	0007a823          	sw	zero,16(a5)
ffffffffc020288a:	8082                	ret

ffffffffc020288c <default_nr_free_pages>:
ffffffffc020288c:	0003a517          	auipc	a0,0x3a
ffffffffc0202890:	71c56503          	lwu	a0,1820(a0) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc0202894:	8082                	ret

ffffffffc0202896 <default_check>:
ffffffffc0202896:	715d                	addi	sp,sp,-80
ffffffffc0202898:	f84a                	sd	s2,48(sp)
ffffffffc020289a:	0003a917          	auipc	s2,0x3a
ffffffffc020289e:	6fe90913          	addi	s2,s2,1790 # ffffffffc023cf98 <free_area>
ffffffffc02028a2:	00893783          	ld	a5,8(s2)
ffffffffc02028a6:	e486                	sd	ra,72(sp)
ffffffffc02028a8:	e0a2                	sd	s0,64(sp)
ffffffffc02028aa:	fc26                	sd	s1,56(sp)
ffffffffc02028ac:	f44e                	sd	s3,40(sp)
ffffffffc02028ae:	f052                	sd	s4,32(sp)
ffffffffc02028b0:	ec56                	sd	s5,24(sp)
ffffffffc02028b2:	e85a                	sd	s6,16(sp)
ffffffffc02028b4:	e45e                	sd	s7,8(sp)
ffffffffc02028b6:	e062                	sd	s8,0(sp)
ffffffffc02028b8:	31278463          	beq	a5,s2,ffffffffc0202bc0 <default_check+0x32a>
ffffffffc02028bc:	ff07b703          	ld	a4,-16(a5)
ffffffffc02028c0:	8305                	srli	a4,a4,0x1
ffffffffc02028c2:	8b05                	andi	a4,a4,1
ffffffffc02028c4:	30070263          	beqz	a4,ffffffffc0202bc8 <default_check+0x332>
ffffffffc02028c8:	4401                	li	s0,0
ffffffffc02028ca:	4481                	li	s1,0
ffffffffc02028cc:	a031                	j	ffffffffc02028d8 <default_check+0x42>
ffffffffc02028ce:	ff07b703          	ld	a4,-16(a5)
ffffffffc02028d2:	8b09                	andi	a4,a4,2
ffffffffc02028d4:	2e070a63          	beqz	a4,ffffffffc0202bc8 <default_check+0x332>
ffffffffc02028d8:	ff87a703          	lw	a4,-8(a5)
ffffffffc02028dc:	679c                	ld	a5,8(a5)
ffffffffc02028de:	2485                	addiw	s1,s1,1
ffffffffc02028e0:	9c39                	addw	s0,s0,a4
ffffffffc02028e2:	ff2796e3          	bne	a5,s2,ffffffffc02028ce <default_check+0x38>
ffffffffc02028e6:	89a2                	mv	s3,s0
ffffffffc02028e8:	3cb000ef          	jal	ra,ffffffffc02034b2 <nr_free_pages>
ffffffffc02028ec:	73351e63          	bne	a0,s3,ffffffffc0203028 <default_check+0x792>
ffffffffc02028f0:	4505                	li	a0,1
ffffffffc02028f2:	2f3000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc02028f6:	8a2a                	mv	s4,a0
ffffffffc02028f8:	46050863          	beqz	a0,ffffffffc0202d68 <default_check+0x4d2>
ffffffffc02028fc:	4505                	li	a0,1
ffffffffc02028fe:	2e7000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202902:	89aa                	mv	s3,a0
ffffffffc0202904:	74050263          	beqz	a0,ffffffffc0203048 <default_check+0x7b2>
ffffffffc0202908:	4505                	li	a0,1
ffffffffc020290a:	2db000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc020290e:	8aaa                	mv	s5,a0
ffffffffc0202910:	4c050c63          	beqz	a0,ffffffffc0202de8 <default_check+0x552>
ffffffffc0202914:	2d3a0a63          	beq	s4,s3,ffffffffc0202be8 <default_check+0x352>
ffffffffc0202918:	2caa0863          	beq	s4,a0,ffffffffc0202be8 <default_check+0x352>
ffffffffc020291c:	2ca98663          	beq	s3,a0,ffffffffc0202be8 <default_check+0x352>
ffffffffc0202920:	000a2783          	lw	a5,0(s4)
ffffffffc0202924:	2e079263          	bnez	a5,ffffffffc0202c08 <default_check+0x372>
ffffffffc0202928:	0009a783          	lw	a5,0(s3)
ffffffffc020292c:	2c079e63          	bnez	a5,ffffffffc0202c08 <default_check+0x372>
ffffffffc0202930:	411c                	lw	a5,0(a0)
ffffffffc0202932:	2c079b63          	bnez	a5,ffffffffc0202c08 <default_check+0x372>
ffffffffc0202936:	0003a797          	auipc	a5,0x3a
ffffffffc020293a:	69278793          	addi	a5,a5,1682 # ffffffffc023cfc8 <pages>
ffffffffc020293e:	639c                	ld	a5,0(a5)
ffffffffc0202940:	00009717          	auipc	a4,0x9
ffffffffc0202944:	17070713          	addi	a4,a4,368 # ffffffffc020bab0 <nbase>
ffffffffc0202948:	6310                	ld	a2,0(a4)
ffffffffc020294a:	0003a717          	auipc	a4,0x3a
ffffffffc020294e:	52e70713          	addi	a4,a4,1326 # ffffffffc023ce78 <npage>
ffffffffc0202952:	6314                	ld	a3,0(a4)
ffffffffc0202954:	40fa0733          	sub	a4,s4,a5
ffffffffc0202958:	8719                	srai	a4,a4,0x6
ffffffffc020295a:	9732                	add	a4,a4,a2
ffffffffc020295c:	06b2                	slli	a3,a3,0xc
ffffffffc020295e:	0732                	slli	a4,a4,0xc
ffffffffc0202960:	2cd77463          	bgeu	a4,a3,ffffffffc0202c28 <default_check+0x392>
ffffffffc0202964:	40f98733          	sub	a4,s3,a5
ffffffffc0202968:	8719                	srai	a4,a4,0x6
ffffffffc020296a:	9732                	add	a4,a4,a2
ffffffffc020296c:	0732                	slli	a4,a4,0xc
ffffffffc020296e:	4ed77d63          	bgeu	a4,a3,ffffffffc0202e68 <default_check+0x5d2>
ffffffffc0202972:	40f507b3          	sub	a5,a0,a5
ffffffffc0202976:	8799                	srai	a5,a5,0x6
ffffffffc0202978:	97b2                	add	a5,a5,a2
ffffffffc020297a:	07b2                	slli	a5,a5,0xc
ffffffffc020297c:	34d7f663          	bgeu	a5,a3,ffffffffc0202cc8 <default_check+0x432>
ffffffffc0202980:	4505                	li	a0,1
ffffffffc0202982:	00093c03          	ld	s8,0(s2)
ffffffffc0202986:	00893b83          	ld	s7,8(s2)
ffffffffc020298a:	01092b03          	lw	s6,16(s2)
ffffffffc020298e:	0003a797          	auipc	a5,0x3a
ffffffffc0202992:	6127b923          	sd	s2,1554(a5) # ffffffffc023cfa0 <free_area+0x8>
ffffffffc0202996:	0003a797          	auipc	a5,0x3a
ffffffffc020299a:	6127b123          	sd	s2,1538(a5) # ffffffffc023cf98 <free_area>
ffffffffc020299e:	0003a797          	auipc	a5,0x3a
ffffffffc02029a2:	6007a523          	sw	zero,1546(a5) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc02029a6:	23f000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc02029aa:	2e051f63          	bnez	a0,ffffffffc0202ca8 <default_check+0x412>
ffffffffc02029ae:	4585                	li	a1,1
ffffffffc02029b0:	8552                	mv	a0,s4
ffffffffc02029b2:	2bb000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc02029b6:	4585                	li	a1,1
ffffffffc02029b8:	854e                	mv	a0,s3
ffffffffc02029ba:	2b3000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc02029be:	4585                	li	a1,1
ffffffffc02029c0:	8556                	mv	a0,s5
ffffffffc02029c2:	2ab000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc02029c6:	01092703          	lw	a4,16(s2)
ffffffffc02029ca:	478d                	li	a5,3
ffffffffc02029cc:	2af71e63          	bne	a4,a5,ffffffffc0202c88 <default_check+0x3f2>
ffffffffc02029d0:	4505                	li	a0,1
ffffffffc02029d2:	213000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc02029d6:	89aa                	mv	s3,a0
ffffffffc02029d8:	28050863          	beqz	a0,ffffffffc0202c68 <default_check+0x3d2>
ffffffffc02029dc:	4505                	li	a0,1
ffffffffc02029de:	207000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc02029e2:	8aaa                	mv	s5,a0
ffffffffc02029e4:	3e050263          	beqz	a0,ffffffffc0202dc8 <default_check+0x532>
ffffffffc02029e8:	4505                	li	a0,1
ffffffffc02029ea:	1fb000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc02029ee:	8a2a                	mv	s4,a0
ffffffffc02029f0:	3a050c63          	beqz	a0,ffffffffc0202da8 <default_check+0x512>
ffffffffc02029f4:	4505                	li	a0,1
ffffffffc02029f6:	1ef000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc02029fa:	38051763          	bnez	a0,ffffffffc0202d88 <default_check+0x4f2>
ffffffffc02029fe:	4585                	li	a1,1
ffffffffc0202a00:	854e                	mv	a0,s3
ffffffffc0202a02:	26b000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202a06:	00893783          	ld	a5,8(s2)
ffffffffc0202a0a:	23278f63          	beq	a5,s2,ffffffffc0202c48 <default_check+0x3b2>
ffffffffc0202a0e:	4505                	li	a0,1
ffffffffc0202a10:	1d5000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202a14:	32a99a63          	bne	s3,a0,ffffffffc0202d48 <default_check+0x4b2>
ffffffffc0202a18:	4505                	li	a0,1
ffffffffc0202a1a:	1cb000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202a1e:	30051563          	bnez	a0,ffffffffc0202d28 <default_check+0x492>
ffffffffc0202a22:	01092783          	lw	a5,16(s2)
ffffffffc0202a26:	2e079163          	bnez	a5,ffffffffc0202d08 <default_check+0x472>
ffffffffc0202a2a:	854e                	mv	a0,s3
ffffffffc0202a2c:	4585                	li	a1,1
ffffffffc0202a2e:	0003a797          	auipc	a5,0x3a
ffffffffc0202a32:	5787b523          	sd	s8,1386(a5) # ffffffffc023cf98 <free_area>
ffffffffc0202a36:	0003a797          	auipc	a5,0x3a
ffffffffc0202a3a:	5777b523          	sd	s7,1386(a5) # ffffffffc023cfa0 <free_area+0x8>
ffffffffc0202a3e:	0003a797          	auipc	a5,0x3a
ffffffffc0202a42:	5767a523          	sw	s6,1386(a5) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc0202a46:	227000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202a4a:	4585                	li	a1,1
ffffffffc0202a4c:	8556                	mv	a0,s5
ffffffffc0202a4e:	21f000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202a52:	4585                	li	a1,1
ffffffffc0202a54:	8552                	mv	a0,s4
ffffffffc0202a56:	217000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202a5a:	4515                	li	a0,5
ffffffffc0202a5c:	189000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202a60:	89aa                	mv	s3,a0
ffffffffc0202a62:	28050363          	beqz	a0,ffffffffc0202ce8 <default_check+0x452>
ffffffffc0202a66:	651c                	ld	a5,8(a0)
ffffffffc0202a68:	8385                	srli	a5,a5,0x1
ffffffffc0202a6a:	8b85                	andi	a5,a5,1
ffffffffc0202a6c:	54079e63          	bnez	a5,ffffffffc0202fc8 <default_check+0x732>
ffffffffc0202a70:	4505                	li	a0,1
ffffffffc0202a72:	00093b03          	ld	s6,0(s2)
ffffffffc0202a76:	00893a83          	ld	s5,8(s2)
ffffffffc0202a7a:	0003a797          	auipc	a5,0x3a
ffffffffc0202a7e:	5127bf23          	sd	s2,1310(a5) # ffffffffc023cf98 <free_area>
ffffffffc0202a82:	0003a797          	auipc	a5,0x3a
ffffffffc0202a86:	5127bf23          	sd	s2,1310(a5) # ffffffffc023cfa0 <free_area+0x8>
ffffffffc0202a8a:	15b000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202a8e:	50051d63          	bnez	a0,ffffffffc0202fa8 <default_check+0x712>
ffffffffc0202a92:	08098a13          	addi	s4,s3,128
ffffffffc0202a96:	8552                	mv	a0,s4
ffffffffc0202a98:	458d                	li	a1,3
ffffffffc0202a9a:	01092b83          	lw	s7,16(s2)
ffffffffc0202a9e:	0003a797          	auipc	a5,0x3a
ffffffffc0202aa2:	5007a523          	sw	zero,1290(a5) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc0202aa6:	1c7000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202aaa:	4511                	li	a0,4
ffffffffc0202aac:	139000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202ab0:	4c051c63          	bnez	a0,ffffffffc0202f88 <default_check+0x6f2>
ffffffffc0202ab4:	0889b783          	ld	a5,136(s3)
ffffffffc0202ab8:	8385                	srli	a5,a5,0x1
ffffffffc0202aba:	8b85                	andi	a5,a5,1
ffffffffc0202abc:	4a078663          	beqz	a5,ffffffffc0202f68 <default_check+0x6d2>
ffffffffc0202ac0:	0909a703          	lw	a4,144(s3)
ffffffffc0202ac4:	478d                	li	a5,3
ffffffffc0202ac6:	4af71163          	bne	a4,a5,ffffffffc0202f68 <default_check+0x6d2>
ffffffffc0202aca:	450d                	li	a0,3
ffffffffc0202acc:	119000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202ad0:	8c2a                	mv	s8,a0
ffffffffc0202ad2:	46050b63          	beqz	a0,ffffffffc0202f48 <default_check+0x6b2>
ffffffffc0202ad6:	4505                	li	a0,1
ffffffffc0202ad8:	10d000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202adc:	44051663          	bnez	a0,ffffffffc0202f28 <default_check+0x692>
ffffffffc0202ae0:	438a1463          	bne	s4,s8,ffffffffc0202f08 <default_check+0x672>
ffffffffc0202ae4:	4585                	li	a1,1
ffffffffc0202ae6:	854e                	mv	a0,s3
ffffffffc0202ae8:	185000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202aec:	458d                	li	a1,3
ffffffffc0202aee:	8552                	mv	a0,s4
ffffffffc0202af0:	17d000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202af4:	0089b783          	ld	a5,8(s3)
ffffffffc0202af8:	04098c13          	addi	s8,s3,64
ffffffffc0202afc:	8385                	srli	a5,a5,0x1
ffffffffc0202afe:	8b85                	andi	a5,a5,1
ffffffffc0202b00:	3e078463          	beqz	a5,ffffffffc0202ee8 <default_check+0x652>
ffffffffc0202b04:	0109a703          	lw	a4,16(s3)
ffffffffc0202b08:	4785                	li	a5,1
ffffffffc0202b0a:	3cf71f63          	bne	a4,a5,ffffffffc0202ee8 <default_check+0x652>
ffffffffc0202b0e:	008a3783          	ld	a5,8(s4)
ffffffffc0202b12:	8385                	srli	a5,a5,0x1
ffffffffc0202b14:	8b85                	andi	a5,a5,1
ffffffffc0202b16:	3a078963          	beqz	a5,ffffffffc0202ec8 <default_check+0x632>
ffffffffc0202b1a:	010a2703          	lw	a4,16(s4)
ffffffffc0202b1e:	478d                	li	a5,3
ffffffffc0202b20:	3af71463          	bne	a4,a5,ffffffffc0202ec8 <default_check+0x632>
ffffffffc0202b24:	4505                	li	a0,1
ffffffffc0202b26:	0bf000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202b2a:	36a99f63          	bne	s3,a0,ffffffffc0202ea8 <default_check+0x612>
ffffffffc0202b2e:	4585                	li	a1,1
ffffffffc0202b30:	13d000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202b34:	4509                	li	a0,2
ffffffffc0202b36:	0af000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202b3a:	34aa1763          	bne	s4,a0,ffffffffc0202e88 <default_check+0x5f2>
ffffffffc0202b3e:	4589                	li	a1,2
ffffffffc0202b40:	12d000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202b44:	4585                	li	a1,1
ffffffffc0202b46:	8562                	mv	a0,s8
ffffffffc0202b48:	125000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202b4c:	4515                	li	a0,5
ffffffffc0202b4e:	097000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202b52:	89aa                	mv	s3,a0
ffffffffc0202b54:	48050a63          	beqz	a0,ffffffffc0202fe8 <default_check+0x752>
ffffffffc0202b58:	4505                	li	a0,1
ffffffffc0202b5a:	08b000ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0202b5e:	2e051563          	bnez	a0,ffffffffc0202e48 <default_check+0x5b2>
ffffffffc0202b62:	01092783          	lw	a5,16(s2)
ffffffffc0202b66:	2c079163          	bnez	a5,ffffffffc0202e28 <default_check+0x592>
ffffffffc0202b6a:	4595                	li	a1,5
ffffffffc0202b6c:	854e                	mv	a0,s3
ffffffffc0202b6e:	0003a797          	auipc	a5,0x3a
ffffffffc0202b72:	4377ad23          	sw	s7,1082(a5) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc0202b76:	0003a797          	auipc	a5,0x3a
ffffffffc0202b7a:	4367b123          	sd	s6,1058(a5) # ffffffffc023cf98 <free_area>
ffffffffc0202b7e:	0003a797          	auipc	a5,0x3a
ffffffffc0202b82:	4357b123          	sd	s5,1058(a5) # ffffffffc023cfa0 <free_area+0x8>
ffffffffc0202b86:	0e7000ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0202b8a:	00893783          	ld	a5,8(s2)
ffffffffc0202b8e:	01278963          	beq	a5,s2,ffffffffc0202ba0 <default_check+0x30a>
ffffffffc0202b92:	ff87a703          	lw	a4,-8(a5)
ffffffffc0202b96:	679c                	ld	a5,8(a5)
ffffffffc0202b98:	34fd                	addiw	s1,s1,-1
ffffffffc0202b9a:	9c19                	subw	s0,s0,a4
ffffffffc0202b9c:	ff279be3          	bne	a5,s2,ffffffffc0202b92 <default_check+0x2fc>
ffffffffc0202ba0:	26049463          	bnez	s1,ffffffffc0202e08 <default_check+0x572>
ffffffffc0202ba4:	46041263          	bnez	s0,ffffffffc0203008 <default_check+0x772>
ffffffffc0202ba8:	60a6                	ld	ra,72(sp)
ffffffffc0202baa:	6406                	ld	s0,64(sp)
ffffffffc0202bac:	74e2                	ld	s1,56(sp)
ffffffffc0202bae:	7942                	ld	s2,48(sp)
ffffffffc0202bb0:	79a2                	ld	s3,40(sp)
ffffffffc0202bb2:	7a02                	ld	s4,32(sp)
ffffffffc0202bb4:	6ae2                	ld	s5,24(sp)
ffffffffc0202bb6:	6b42                	ld	s6,16(sp)
ffffffffc0202bb8:	6ba2                	ld	s7,8(sp)
ffffffffc0202bba:	6c02                	ld	s8,0(sp)
ffffffffc0202bbc:	6161                	addi	sp,sp,80
ffffffffc0202bbe:	8082                	ret
ffffffffc0202bc0:	4981                	li	s3,0
ffffffffc0202bc2:	4401                	li	s0,0
ffffffffc0202bc4:	4481                	li	s1,0
ffffffffc0202bc6:	b30d                	j	ffffffffc02028e8 <default_check+0x52>
ffffffffc0202bc8:	00007697          	auipc	a3,0x7
ffffffffc0202bcc:	1c068693          	addi	a3,a3,448 # ffffffffc0209d88 <commands+0xf80>
ffffffffc0202bd0:	00006617          	auipc	a2,0x6
ffffffffc0202bd4:	6b860613          	addi	a2,a2,1720 # ffffffffc0209288 <commands+0x480>
ffffffffc0202bd8:	0f000593          	li	a1,240
ffffffffc0202bdc:	00007517          	auipc	a0,0x7
ffffffffc0202be0:	4d450513          	addi	a0,a0,1236 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202be4:	e34fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202be8:	00007697          	auipc	a3,0x7
ffffffffc0202bec:	54068693          	addi	a3,a3,1344 # ffffffffc020a128 <commands+0x1320>
ffffffffc0202bf0:	00006617          	auipc	a2,0x6
ffffffffc0202bf4:	69860613          	addi	a2,a2,1688 # ffffffffc0209288 <commands+0x480>
ffffffffc0202bf8:	0bd00593          	li	a1,189
ffffffffc0202bfc:	00007517          	auipc	a0,0x7
ffffffffc0202c00:	4b450513          	addi	a0,a0,1204 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202c04:	e14fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202c08:	00007697          	auipc	a3,0x7
ffffffffc0202c0c:	54868693          	addi	a3,a3,1352 # ffffffffc020a150 <commands+0x1348>
ffffffffc0202c10:	00006617          	auipc	a2,0x6
ffffffffc0202c14:	67860613          	addi	a2,a2,1656 # ffffffffc0209288 <commands+0x480>
ffffffffc0202c18:	0be00593          	li	a1,190
ffffffffc0202c1c:	00007517          	auipc	a0,0x7
ffffffffc0202c20:	49450513          	addi	a0,a0,1172 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202c24:	df4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202c28:	00007697          	auipc	a3,0x7
ffffffffc0202c2c:	56868693          	addi	a3,a3,1384 # ffffffffc020a190 <commands+0x1388>
ffffffffc0202c30:	00006617          	auipc	a2,0x6
ffffffffc0202c34:	65860613          	addi	a2,a2,1624 # ffffffffc0209288 <commands+0x480>
ffffffffc0202c38:	0c000593          	li	a1,192
ffffffffc0202c3c:	00007517          	auipc	a0,0x7
ffffffffc0202c40:	47450513          	addi	a0,a0,1140 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202c44:	dd4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202c48:	00007697          	auipc	a3,0x7
ffffffffc0202c4c:	5d068693          	addi	a3,a3,1488 # ffffffffc020a218 <commands+0x1410>
ffffffffc0202c50:	00006617          	auipc	a2,0x6
ffffffffc0202c54:	63860613          	addi	a2,a2,1592 # ffffffffc0209288 <commands+0x480>
ffffffffc0202c58:	0d900593          	li	a1,217
ffffffffc0202c5c:	00007517          	auipc	a0,0x7
ffffffffc0202c60:	45450513          	addi	a0,a0,1108 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202c64:	db4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202c68:	00007697          	auipc	a3,0x7
ffffffffc0202c6c:	46068693          	addi	a3,a3,1120 # ffffffffc020a0c8 <commands+0x12c0>
ffffffffc0202c70:	00006617          	auipc	a2,0x6
ffffffffc0202c74:	61860613          	addi	a2,a2,1560 # ffffffffc0209288 <commands+0x480>
ffffffffc0202c78:	0d200593          	li	a1,210
ffffffffc0202c7c:	00007517          	auipc	a0,0x7
ffffffffc0202c80:	43450513          	addi	a0,a0,1076 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202c84:	d94fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202c88:	00007697          	auipc	a3,0x7
ffffffffc0202c8c:	58068693          	addi	a3,a3,1408 # ffffffffc020a208 <commands+0x1400>
ffffffffc0202c90:	00006617          	auipc	a2,0x6
ffffffffc0202c94:	5f860613          	addi	a2,a2,1528 # ffffffffc0209288 <commands+0x480>
ffffffffc0202c98:	0d000593          	li	a1,208
ffffffffc0202c9c:	00007517          	auipc	a0,0x7
ffffffffc0202ca0:	41450513          	addi	a0,a0,1044 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202ca4:	d74fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202ca8:	00007697          	auipc	a3,0x7
ffffffffc0202cac:	54868693          	addi	a3,a3,1352 # ffffffffc020a1f0 <commands+0x13e8>
ffffffffc0202cb0:	00006617          	auipc	a2,0x6
ffffffffc0202cb4:	5d860613          	addi	a2,a2,1496 # ffffffffc0209288 <commands+0x480>
ffffffffc0202cb8:	0cb00593          	li	a1,203
ffffffffc0202cbc:	00007517          	auipc	a0,0x7
ffffffffc0202cc0:	3f450513          	addi	a0,a0,1012 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202cc4:	d54fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202cc8:	00007697          	auipc	a3,0x7
ffffffffc0202ccc:	50868693          	addi	a3,a3,1288 # ffffffffc020a1d0 <commands+0x13c8>
ffffffffc0202cd0:	00006617          	auipc	a2,0x6
ffffffffc0202cd4:	5b860613          	addi	a2,a2,1464 # ffffffffc0209288 <commands+0x480>
ffffffffc0202cd8:	0c200593          	li	a1,194
ffffffffc0202cdc:	00007517          	auipc	a0,0x7
ffffffffc0202ce0:	3d450513          	addi	a0,a0,980 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202ce4:	d34fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202ce8:	00007697          	auipc	a3,0x7
ffffffffc0202cec:	56868693          	addi	a3,a3,1384 # ffffffffc020a250 <commands+0x1448>
ffffffffc0202cf0:	00006617          	auipc	a2,0x6
ffffffffc0202cf4:	59860613          	addi	a2,a2,1432 # ffffffffc0209288 <commands+0x480>
ffffffffc0202cf8:	0f800593          	li	a1,248
ffffffffc0202cfc:	00007517          	auipc	a0,0x7
ffffffffc0202d00:	3b450513          	addi	a0,a0,948 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202d04:	d14fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202d08:	00007697          	auipc	a3,0x7
ffffffffc0202d0c:	22068693          	addi	a3,a3,544 # ffffffffc0209f28 <commands+0x1120>
ffffffffc0202d10:	00006617          	auipc	a2,0x6
ffffffffc0202d14:	57860613          	addi	a2,a2,1400 # ffffffffc0209288 <commands+0x480>
ffffffffc0202d18:	0df00593          	li	a1,223
ffffffffc0202d1c:	00007517          	auipc	a0,0x7
ffffffffc0202d20:	39450513          	addi	a0,a0,916 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202d24:	cf4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202d28:	00007697          	auipc	a3,0x7
ffffffffc0202d2c:	4c868693          	addi	a3,a3,1224 # ffffffffc020a1f0 <commands+0x13e8>
ffffffffc0202d30:	00006617          	auipc	a2,0x6
ffffffffc0202d34:	55860613          	addi	a2,a2,1368 # ffffffffc0209288 <commands+0x480>
ffffffffc0202d38:	0dd00593          	li	a1,221
ffffffffc0202d3c:	00007517          	auipc	a0,0x7
ffffffffc0202d40:	37450513          	addi	a0,a0,884 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202d44:	cd4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202d48:	00007697          	auipc	a3,0x7
ffffffffc0202d4c:	4e868693          	addi	a3,a3,1256 # ffffffffc020a230 <commands+0x1428>
ffffffffc0202d50:	00006617          	auipc	a2,0x6
ffffffffc0202d54:	53860613          	addi	a2,a2,1336 # ffffffffc0209288 <commands+0x480>
ffffffffc0202d58:	0dc00593          	li	a1,220
ffffffffc0202d5c:	00007517          	auipc	a0,0x7
ffffffffc0202d60:	35450513          	addi	a0,a0,852 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202d64:	cb4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202d68:	00007697          	auipc	a3,0x7
ffffffffc0202d6c:	36068693          	addi	a3,a3,864 # ffffffffc020a0c8 <commands+0x12c0>
ffffffffc0202d70:	00006617          	auipc	a2,0x6
ffffffffc0202d74:	51860613          	addi	a2,a2,1304 # ffffffffc0209288 <commands+0x480>
ffffffffc0202d78:	0b900593          	li	a1,185
ffffffffc0202d7c:	00007517          	auipc	a0,0x7
ffffffffc0202d80:	33450513          	addi	a0,a0,820 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202d84:	c94fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202d88:	00007697          	auipc	a3,0x7
ffffffffc0202d8c:	46868693          	addi	a3,a3,1128 # ffffffffc020a1f0 <commands+0x13e8>
ffffffffc0202d90:	00006617          	auipc	a2,0x6
ffffffffc0202d94:	4f860613          	addi	a2,a2,1272 # ffffffffc0209288 <commands+0x480>
ffffffffc0202d98:	0d600593          	li	a1,214
ffffffffc0202d9c:	00007517          	auipc	a0,0x7
ffffffffc0202da0:	31450513          	addi	a0,a0,788 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202da4:	c74fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202da8:	00007697          	auipc	a3,0x7
ffffffffc0202dac:	36068693          	addi	a3,a3,864 # ffffffffc020a108 <commands+0x1300>
ffffffffc0202db0:	00006617          	auipc	a2,0x6
ffffffffc0202db4:	4d860613          	addi	a2,a2,1240 # ffffffffc0209288 <commands+0x480>
ffffffffc0202db8:	0d400593          	li	a1,212
ffffffffc0202dbc:	00007517          	auipc	a0,0x7
ffffffffc0202dc0:	2f450513          	addi	a0,a0,756 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202dc4:	c54fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202dc8:	00007697          	auipc	a3,0x7
ffffffffc0202dcc:	32068693          	addi	a3,a3,800 # ffffffffc020a0e8 <commands+0x12e0>
ffffffffc0202dd0:	00006617          	auipc	a2,0x6
ffffffffc0202dd4:	4b860613          	addi	a2,a2,1208 # ffffffffc0209288 <commands+0x480>
ffffffffc0202dd8:	0d300593          	li	a1,211
ffffffffc0202ddc:	00007517          	auipc	a0,0x7
ffffffffc0202de0:	2d450513          	addi	a0,a0,724 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202de4:	c34fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202de8:	00007697          	auipc	a3,0x7
ffffffffc0202dec:	32068693          	addi	a3,a3,800 # ffffffffc020a108 <commands+0x1300>
ffffffffc0202df0:	00006617          	auipc	a2,0x6
ffffffffc0202df4:	49860613          	addi	a2,a2,1176 # ffffffffc0209288 <commands+0x480>
ffffffffc0202df8:	0bb00593          	li	a1,187
ffffffffc0202dfc:	00007517          	auipc	a0,0x7
ffffffffc0202e00:	2b450513          	addi	a0,a0,692 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202e04:	c14fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202e08:	00007697          	auipc	a3,0x7
ffffffffc0202e0c:	59868693          	addi	a3,a3,1432 # ffffffffc020a3a0 <commands+0x1598>
ffffffffc0202e10:	00006617          	auipc	a2,0x6
ffffffffc0202e14:	47860613          	addi	a2,a2,1144 # ffffffffc0209288 <commands+0x480>
ffffffffc0202e18:	12500593          	li	a1,293
ffffffffc0202e1c:	00007517          	auipc	a0,0x7
ffffffffc0202e20:	29450513          	addi	a0,a0,660 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202e24:	bf4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202e28:	00007697          	auipc	a3,0x7
ffffffffc0202e2c:	10068693          	addi	a3,a3,256 # ffffffffc0209f28 <commands+0x1120>
ffffffffc0202e30:	00006617          	auipc	a2,0x6
ffffffffc0202e34:	45860613          	addi	a2,a2,1112 # ffffffffc0209288 <commands+0x480>
ffffffffc0202e38:	11a00593          	li	a1,282
ffffffffc0202e3c:	00007517          	auipc	a0,0x7
ffffffffc0202e40:	27450513          	addi	a0,a0,628 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202e44:	bd4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202e48:	00007697          	auipc	a3,0x7
ffffffffc0202e4c:	3a868693          	addi	a3,a3,936 # ffffffffc020a1f0 <commands+0x13e8>
ffffffffc0202e50:	00006617          	auipc	a2,0x6
ffffffffc0202e54:	43860613          	addi	a2,a2,1080 # ffffffffc0209288 <commands+0x480>
ffffffffc0202e58:	11800593          	li	a1,280
ffffffffc0202e5c:	00007517          	auipc	a0,0x7
ffffffffc0202e60:	25450513          	addi	a0,a0,596 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202e64:	bb4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202e68:	00007697          	auipc	a3,0x7
ffffffffc0202e6c:	34868693          	addi	a3,a3,840 # ffffffffc020a1b0 <commands+0x13a8>
ffffffffc0202e70:	00006617          	auipc	a2,0x6
ffffffffc0202e74:	41860613          	addi	a2,a2,1048 # ffffffffc0209288 <commands+0x480>
ffffffffc0202e78:	0c100593          	li	a1,193
ffffffffc0202e7c:	00007517          	auipc	a0,0x7
ffffffffc0202e80:	23450513          	addi	a0,a0,564 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202e84:	b94fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202e88:	00007697          	auipc	a3,0x7
ffffffffc0202e8c:	4d868693          	addi	a3,a3,1240 # ffffffffc020a360 <commands+0x1558>
ffffffffc0202e90:	00006617          	auipc	a2,0x6
ffffffffc0202e94:	3f860613          	addi	a2,a2,1016 # ffffffffc0209288 <commands+0x480>
ffffffffc0202e98:	11200593          	li	a1,274
ffffffffc0202e9c:	00007517          	auipc	a0,0x7
ffffffffc0202ea0:	21450513          	addi	a0,a0,532 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202ea4:	b74fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202ea8:	00007697          	auipc	a3,0x7
ffffffffc0202eac:	49868693          	addi	a3,a3,1176 # ffffffffc020a340 <commands+0x1538>
ffffffffc0202eb0:	00006617          	auipc	a2,0x6
ffffffffc0202eb4:	3d860613          	addi	a2,a2,984 # ffffffffc0209288 <commands+0x480>
ffffffffc0202eb8:	11000593          	li	a1,272
ffffffffc0202ebc:	00007517          	auipc	a0,0x7
ffffffffc0202ec0:	1f450513          	addi	a0,a0,500 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202ec4:	b54fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202ec8:	00007697          	auipc	a3,0x7
ffffffffc0202ecc:	45068693          	addi	a3,a3,1104 # ffffffffc020a318 <commands+0x1510>
ffffffffc0202ed0:	00006617          	auipc	a2,0x6
ffffffffc0202ed4:	3b860613          	addi	a2,a2,952 # ffffffffc0209288 <commands+0x480>
ffffffffc0202ed8:	10e00593          	li	a1,270
ffffffffc0202edc:	00007517          	auipc	a0,0x7
ffffffffc0202ee0:	1d450513          	addi	a0,a0,468 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202ee4:	b34fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202ee8:	00007697          	auipc	a3,0x7
ffffffffc0202eec:	40868693          	addi	a3,a3,1032 # ffffffffc020a2f0 <commands+0x14e8>
ffffffffc0202ef0:	00006617          	auipc	a2,0x6
ffffffffc0202ef4:	39860613          	addi	a2,a2,920 # ffffffffc0209288 <commands+0x480>
ffffffffc0202ef8:	10d00593          	li	a1,269
ffffffffc0202efc:	00007517          	auipc	a0,0x7
ffffffffc0202f00:	1b450513          	addi	a0,a0,436 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202f04:	b14fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202f08:	00007697          	auipc	a3,0x7
ffffffffc0202f0c:	3d868693          	addi	a3,a3,984 # ffffffffc020a2e0 <commands+0x14d8>
ffffffffc0202f10:	00006617          	auipc	a2,0x6
ffffffffc0202f14:	37860613          	addi	a2,a2,888 # ffffffffc0209288 <commands+0x480>
ffffffffc0202f18:	10800593          	li	a1,264
ffffffffc0202f1c:	00007517          	auipc	a0,0x7
ffffffffc0202f20:	19450513          	addi	a0,a0,404 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202f24:	af4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202f28:	00007697          	auipc	a3,0x7
ffffffffc0202f2c:	2c868693          	addi	a3,a3,712 # ffffffffc020a1f0 <commands+0x13e8>
ffffffffc0202f30:	00006617          	auipc	a2,0x6
ffffffffc0202f34:	35860613          	addi	a2,a2,856 # ffffffffc0209288 <commands+0x480>
ffffffffc0202f38:	10700593          	li	a1,263
ffffffffc0202f3c:	00007517          	auipc	a0,0x7
ffffffffc0202f40:	17450513          	addi	a0,a0,372 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202f44:	ad4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202f48:	00007697          	auipc	a3,0x7
ffffffffc0202f4c:	37868693          	addi	a3,a3,888 # ffffffffc020a2c0 <commands+0x14b8>
ffffffffc0202f50:	00006617          	auipc	a2,0x6
ffffffffc0202f54:	33860613          	addi	a2,a2,824 # ffffffffc0209288 <commands+0x480>
ffffffffc0202f58:	10600593          	li	a1,262
ffffffffc0202f5c:	00007517          	auipc	a0,0x7
ffffffffc0202f60:	15450513          	addi	a0,a0,340 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202f64:	ab4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202f68:	00007697          	auipc	a3,0x7
ffffffffc0202f6c:	32868693          	addi	a3,a3,808 # ffffffffc020a290 <commands+0x1488>
ffffffffc0202f70:	00006617          	auipc	a2,0x6
ffffffffc0202f74:	31860613          	addi	a2,a2,792 # ffffffffc0209288 <commands+0x480>
ffffffffc0202f78:	10500593          	li	a1,261
ffffffffc0202f7c:	00007517          	auipc	a0,0x7
ffffffffc0202f80:	13450513          	addi	a0,a0,308 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202f84:	a94fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202f88:	00007697          	auipc	a3,0x7
ffffffffc0202f8c:	2f068693          	addi	a3,a3,752 # ffffffffc020a278 <commands+0x1470>
ffffffffc0202f90:	00006617          	auipc	a2,0x6
ffffffffc0202f94:	2f860613          	addi	a2,a2,760 # ffffffffc0209288 <commands+0x480>
ffffffffc0202f98:	10400593          	li	a1,260
ffffffffc0202f9c:	00007517          	auipc	a0,0x7
ffffffffc0202fa0:	11450513          	addi	a0,a0,276 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202fa4:	a74fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202fa8:	00007697          	auipc	a3,0x7
ffffffffc0202fac:	24868693          	addi	a3,a3,584 # ffffffffc020a1f0 <commands+0x13e8>
ffffffffc0202fb0:	00006617          	auipc	a2,0x6
ffffffffc0202fb4:	2d860613          	addi	a2,a2,728 # ffffffffc0209288 <commands+0x480>
ffffffffc0202fb8:	0fe00593          	li	a1,254
ffffffffc0202fbc:	00007517          	auipc	a0,0x7
ffffffffc0202fc0:	0f450513          	addi	a0,a0,244 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202fc4:	a54fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202fc8:	00007697          	auipc	a3,0x7
ffffffffc0202fcc:	29868693          	addi	a3,a3,664 # ffffffffc020a260 <commands+0x1458>
ffffffffc0202fd0:	00006617          	auipc	a2,0x6
ffffffffc0202fd4:	2b860613          	addi	a2,a2,696 # ffffffffc0209288 <commands+0x480>
ffffffffc0202fd8:	0f900593          	li	a1,249
ffffffffc0202fdc:	00007517          	auipc	a0,0x7
ffffffffc0202fe0:	0d450513          	addi	a0,a0,212 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0202fe4:	a34fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0202fe8:	00007697          	auipc	a3,0x7
ffffffffc0202fec:	39868693          	addi	a3,a3,920 # ffffffffc020a380 <commands+0x1578>
ffffffffc0202ff0:	00006617          	auipc	a2,0x6
ffffffffc0202ff4:	29860613          	addi	a2,a2,664 # ffffffffc0209288 <commands+0x480>
ffffffffc0202ff8:	11700593          	li	a1,279
ffffffffc0202ffc:	00007517          	auipc	a0,0x7
ffffffffc0203000:	0b450513          	addi	a0,a0,180 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0203004:	a14fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203008:	00007697          	auipc	a3,0x7
ffffffffc020300c:	3a868693          	addi	a3,a3,936 # ffffffffc020a3b0 <commands+0x15a8>
ffffffffc0203010:	00006617          	auipc	a2,0x6
ffffffffc0203014:	27860613          	addi	a2,a2,632 # ffffffffc0209288 <commands+0x480>
ffffffffc0203018:	12600593          	li	a1,294
ffffffffc020301c:	00007517          	auipc	a0,0x7
ffffffffc0203020:	09450513          	addi	a0,a0,148 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0203024:	9f4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203028:	00007697          	auipc	a3,0x7
ffffffffc020302c:	d7068693          	addi	a3,a3,-656 # ffffffffc0209d98 <commands+0xf90>
ffffffffc0203030:	00006617          	auipc	a2,0x6
ffffffffc0203034:	25860613          	addi	a2,a2,600 # ffffffffc0209288 <commands+0x480>
ffffffffc0203038:	0f300593          	li	a1,243
ffffffffc020303c:	00007517          	auipc	a0,0x7
ffffffffc0203040:	07450513          	addi	a0,a0,116 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0203044:	9d4fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203048:	00007697          	auipc	a3,0x7
ffffffffc020304c:	0a068693          	addi	a3,a3,160 # ffffffffc020a0e8 <commands+0x12e0>
ffffffffc0203050:	00006617          	auipc	a2,0x6
ffffffffc0203054:	23860613          	addi	a2,a2,568 # ffffffffc0209288 <commands+0x480>
ffffffffc0203058:	0ba00593          	li	a1,186
ffffffffc020305c:	00007517          	auipc	a0,0x7
ffffffffc0203060:	05450513          	addi	a0,a0,84 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0203064:	9b4fd0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0203068 <default_free_pages>:
ffffffffc0203068:	1141                	addi	sp,sp,-16
ffffffffc020306a:	e406                	sd	ra,8(sp)
ffffffffc020306c:	16058e63          	beqz	a1,ffffffffc02031e8 <default_free_pages+0x180>
ffffffffc0203070:	00659693          	slli	a3,a1,0x6
ffffffffc0203074:	96aa                	add	a3,a3,a0
ffffffffc0203076:	02d50d63          	beq	a0,a3,ffffffffc02030b0 <default_free_pages+0x48>
ffffffffc020307a:	651c                	ld	a5,8(a0)
ffffffffc020307c:	8b85                	andi	a5,a5,1
ffffffffc020307e:	14079563          	bnez	a5,ffffffffc02031c8 <default_free_pages+0x160>
ffffffffc0203082:	651c                	ld	a5,8(a0)
ffffffffc0203084:	8385                	srli	a5,a5,0x1
ffffffffc0203086:	8b85                	andi	a5,a5,1
ffffffffc0203088:	14079063          	bnez	a5,ffffffffc02031c8 <default_free_pages+0x160>
ffffffffc020308c:	87aa                	mv	a5,a0
ffffffffc020308e:	a809                	j	ffffffffc02030a0 <default_free_pages+0x38>
ffffffffc0203090:	6798                	ld	a4,8(a5)
ffffffffc0203092:	8b05                	andi	a4,a4,1
ffffffffc0203094:	12071a63          	bnez	a4,ffffffffc02031c8 <default_free_pages+0x160>
ffffffffc0203098:	6798                	ld	a4,8(a5)
ffffffffc020309a:	8b09                	andi	a4,a4,2
ffffffffc020309c:	12071663          	bnez	a4,ffffffffc02031c8 <default_free_pages+0x160>
ffffffffc02030a0:	0007b423          	sd	zero,8(a5)
ffffffffc02030a4:	0007a023          	sw	zero,0(a5)
ffffffffc02030a8:	04078793          	addi	a5,a5,64
ffffffffc02030ac:	fed792e3          	bne	a5,a3,ffffffffc0203090 <default_free_pages+0x28>
ffffffffc02030b0:	2581                	sext.w	a1,a1
ffffffffc02030b2:	c90c                	sw	a1,16(a0)
ffffffffc02030b4:	00850893          	addi	a7,a0,8
ffffffffc02030b8:	4789                	li	a5,2
ffffffffc02030ba:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc02030be:	0003a697          	auipc	a3,0x3a
ffffffffc02030c2:	eda68693          	addi	a3,a3,-294 # ffffffffc023cf98 <free_area>
ffffffffc02030c6:	4a98                	lw	a4,16(a3)
ffffffffc02030c8:	669c                	ld	a5,8(a3)
ffffffffc02030ca:	9db9                	addw	a1,a1,a4
ffffffffc02030cc:	0003a717          	auipc	a4,0x3a
ffffffffc02030d0:	ecb72e23          	sw	a1,-292(a4) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc02030d4:	0cd78163          	beq	a5,a3,ffffffffc0203196 <default_free_pages+0x12e>
ffffffffc02030d8:	fe878713          	addi	a4,a5,-24
ffffffffc02030dc:	628c                	ld	a1,0(a3)
ffffffffc02030de:	4801                	li	a6,0
ffffffffc02030e0:	01850613          	addi	a2,a0,24
ffffffffc02030e4:	00e56a63          	bltu	a0,a4,ffffffffc02030f8 <default_free_pages+0x90>
ffffffffc02030e8:	6798                	ld	a4,8(a5)
ffffffffc02030ea:	04d70f63          	beq	a4,a3,ffffffffc0203148 <default_free_pages+0xe0>
ffffffffc02030ee:	87ba                	mv	a5,a4
ffffffffc02030f0:	fe878713          	addi	a4,a5,-24
ffffffffc02030f4:	fee57ae3          	bgeu	a0,a4,ffffffffc02030e8 <default_free_pages+0x80>
ffffffffc02030f8:	00080663          	beqz	a6,ffffffffc0203104 <default_free_pages+0x9c>
ffffffffc02030fc:	0003a817          	auipc	a6,0x3a
ffffffffc0203100:	e8b83e23          	sd	a1,-356(a6) # ffffffffc023cf98 <free_area>
ffffffffc0203104:	638c                	ld	a1,0(a5)
ffffffffc0203106:	e390                	sd	a2,0(a5)
ffffffffc0203108:	e590                	sd	a2,8(a1)
ffffffffc020310a:	f11c                	sd	a5,32(a0)
ffffffffc020310c:	ed0c                	sd	a1,24(a0)
ffffffffc020310e:	06d58a63          	beq	a1,a3,ffffffffc0203182 <default_free_pages+0x11a>
ffffffffc0203112:	ff85a603          	lw	a2,-8(a1) # ff8 <_binary_obj___user_faultread_out_size-0xd60>
ffffffffc0203116:	fe858713          	addi	a4,a1,-24
ffffffffc020311a:	02061793          	slli	a5,a2,0x20
ffffffffc020311e:	83e9                	srli	a5,a5,0x1a
ffffffffc0203120:	97ba                	add	a5,a5,a4
ffffffffc0203122:	04f51b63          	bne	a0,a5,ffffffffc0203178 <default_free_pages+0x110>
ffffffffc0203126:	491c                	lw	a5,16(a0)
ffffffffc0203128:	9e3d                	addw	a2,a2,a5
ffffffffc020312a:	fec5ac23          	sw	a2,-8(a1)
ffffffffc020312e:	57f5                	li	a5,-3
ffffffffc0203130:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0203134:	01853803          	ld	a6,24(a0)
ffffffffc0203138:	7110                	ld	a2,32(a0)
ffffffffc020313a:	853a                	mv	a0,a4
ffffffffc020313c:	00c83423          	sd	a2,8(a6)
ffffffffc0203140:	659c                	ld	a5,8(a1)
ffffffffc0203142:	01063023          	sd	a6,0(a2)
ffffffffc0203146:	a815                	j	ffffffffc020317a <default_free_pages+0x112>
ffffffffc0203148:	e790                	sd	a2,8(a5)
ffffffffc020314a:	f114                	sd	a3,32(a0)
ffffffffc020314c:	6798                	ld	a4,8(a5)
ffffffffc020314e:	ed1c                	sd	a5,24(a0)
ffffffffc0203150:	85b2                	mv	a1,a2
ffffffffc0203152:	00d70563          	beq	a4,a3,ffffffffc020315c <default_free_pages+0xf4>
ffffffffc0203156:	4805                	li	a6,1
ffffffffc0203158:	87ba                	mv	a5,a4
ffffffffc020315a:	bf59                	j	ffffffffc02030f0 <default_free_pages+0x88>
ffffffffc020315c:	e290                	sd	a2,0(a3)
ffffffffc020315e:	85be                	mv	a1,a5
ffffffffc0203160:	00d78d63          	beq	a5,a3,ffffffffc020317a <default_free_pages+0x112>
ffffffffc0203164:	ff85a603          	lw	a2,-8(a1)
ffffffffc0203168:	fe858713          	addi	a4,a1,-24
ffffffffc020316c:	02061793          	slli	a5,a2,0x20
ffffffffc0203170:	83e9                	srli	a5,a5,0x1a
ffffffffc0203172:	97ba                	add	a5,a5,a4
ffffffffc0203174:	faf509e3          	beq	a0,a5,ffffffffc0203126 <default_free_pages+0xbe>
ffffffffc0203178:	711c                	ld	a5,32(a0)
ffffffffc020317a:	fe878713          	addi	a4,a5,-24
ffffffffc020317e:	00d78963          	beq	a5,a3,ffffffffc0203190 <default_free_pages+0x128>
ffffffffc0203182:	4910                	lw	a2,16(a0)
ffffffffc0203184:	02061693          	slli	a3,a2,0x20
ffffffffc0203188:	82e9                	srli	a3,a3,0x1a
ffffffffc020318a:	96aa                	add	a3,a3,a0
ffffffffc020318c:	00d70e63          	beq	a4,a3,ffffffffc02031a8 <default_free_pages+0x140>
ffffffffc0203190:	60a2                	ld	ra,8(sp)
ffffffffc0203192:	0141                	addi	sp,sp,16
ffffffffc0203194:	8082                	ret
ffffffffc0203196:	60a2                	ld	ra,8(sp)
ffffffffc0203198:	01850713          	addi	a4,a0,24
ffffffffc020319c:	e398                	sd	a4,0(a5)
ffffffffc020319e:	e798                	sd	a4,8(a5)
ffffffffc02031a0:	f11c                	sd	a5,32(a0)
ffffffffc02031a2:	ed1c                	sd	a5,24(a0)
ffffffffc02031a4:	0141                	addi	sp,sp,16
ffffffffc02031a6:	8082                	ret
ffffffffc02031a8:	ff87a703          	lw	a4,-8(a5)
ffffffffc02031ac:	ff078693          	addi	a3,a5,-16
ffffffffc02031b0:	9e39                	addw	a2,a2,a4
ffffffffc02031b2:	c910                	sw	a2,16(a0)
ffffffffc02031b4:	5775                	li	a4,-3
ffffffffc02031b6:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc02031ba:	6398                	ld	a4,0(a5)
ffffffffc02031bc:	679c                	ld	a5,8(a5)
ffffffffc02031be:	60a2                	ld	ra,8(sp)
ffffffffc02031c0:	e71c                	sd	a5,8(a4)
ffffffffc02031c2:	e398                	sd	a4,0(a5)
ffffffffc02031c4:	0141                	addi	sp,sp,16
ffffffffc02031c6:	8082                	ret
ffffffffc02031c8:	00007697          	auipc	a3,0x7
ffffffffc02031cc:	1f868693          	addi	a3,a3,504 # ffffffffc020a3c0 <commands+0x15b8>
ffffffffc02031d0:	00006617          	auipc	a2,0x6
ffffffffc02031d4:	0b860613          	addi	a2,a2,184 # ffffffffc0209288 <commands+0x480>
ffffffffc02031d8:	08300593          	li	a1,131
ffffffffc02031dc:	00007517          	auipc	a0,0x7
ffffffffc02031e0:	ed450513          	addi	a0,a0,-300 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc02031e4:	834fd0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02031e8:	00007697          	auipc	a3,0x7
ffffffffc02031ec:	20068693          	addi	a3,a3,512 # ffffffffc020a3e8 <commands+0x15e0>
ffffffffc02031f0:	00006617          	auipc	a2,0x6
ffffffffc02031f4:	09860613          	addi	a2,a2,152 # ffffffffc0209288 <commands+0x480>
ffffffffc02031f8:	08000593          	li	a1,128
ffffffffc02031fc:	00007517          	auipc	a0,0x7
ffffffffc0203200:	eb450513          	addi	a0,a0,-332 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc0203204:	814fd0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0203208 <default_alloc_pages>:
ffffffffc0203208:	c959                	beqz	a0,ffffffffc020329e <default_alloc_pages+0x96>
ffffffffc020320a:	0003a597          	auipc	a1,0x3a
ffffffffc020320e:	d8e58593          	addi	a1,a1,-626 # ffffffffc023cf98 <free_area>
ffffffffc0203212:	0105a803          	lw	a6,16(a1)
ffffffffc0203216:	862a                	mv	a2,a0
ffffffffc0203218:	02081793          	slli	a5,a6,0x20
ffffffffc020321c:	9381                	srli	a5,a5,0x20
ffffffffc020321e:	00a7ee63          	bltu	a5,a0,ffffffffc020323a <default_alloc_pages+0x32>
ffffffffc0203222:	87ae                	mv	a5,a1
ffffffffc0203224:	a801                	j	ffffffffc0203234 <default_alloc_pages+0x2c>
ffffffffc0203226:	ff87a703          	lw	a4,-8(a5)
ffffffffc020322a:	02071693          	slli	a3,a4,0x20
ffffffffc020322e:	9281                	srli	a3,a3,0x20
ffffffffc0203230:	00c6f763          	bgeu	a3,a2,ffffffffc020323e <default_alloc_pages+0x36>
ffffffffc0203234:	679c                	ld	a5,8(a5)
ffffffffc0203236:	feb798e3          	bne	a5,a1,ffffffffc0203226 <default_alloc_pages+0x1e>
ffffffffc020323a:	4501                	li	a0,0
ffffffffc020323c:	8082                	ret
ffffffffc020323e:	fe878513          	addi	a0,a5,-24
ffffffffc0203242:	dd6d                	beqz	a0,ffffffffc020323c <default_alloc_pages+0x34>
ffffffffc0203244:	0007b883          	ld	a7,0(a5)
ffffffffc0203248:	0087b303          	ld	t1,8(a5)
ffffffffc020324c:	00060e1b          	sext.w	t3,a2
ffffffffc0203250:	0068b423          	sd	t1,8(a7)
ffffffffc0203254:	01133023          	sd	a7,0(t1)
ffffffffc0203258:	02d67863          	bgeu	a2,a3,ffffffffc0203288 <default_alloc_pages+0x80>
ffffffffc020325c:	061a                	slli	a2,a2,0x6
ffffffffc020325e:	962a                	add	a2,a2,a0
ffffffffc0203260:	41c7073b          	subw	a4,a4,t3
ffffffffc0203264:	ca18                	sw	a4,16(a2)
ffffffffc0203266:	00860693          	addi	a3,a2,8
ffffffffc020326a:	4709                	li	a4,2
ffffffffc020326c:	40e6b02f          	amoor.d	zero,a4,(a3)
ffffffffc0203270:	0088b703          	ld	a4,8(a7)
ffffffffc0203274:	01860693          	addi	a3,a2,24
ffffffffc0203278:	0105a803          	lw	a6,16(a1)
ffffffffc020327c:	e314                	sd	a3,0(a4)
ffffffffc020327e:	00d8b423          	sd	a3,8(a7)
ffffffffc0203282:	f218                	sd	a4,32(a2)
ffffffffc0203284:	01163c23          	sd	a7,24(a2)
ffffffffc0203288:	41c8083b          	subw	a6,a6,t3
ffffffffc020328c:	0003a717          	auipc	a4,0x3a
ffffffffc0203290:	d1072e23          	sw	a6,-740(a4) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc0203294:	5775                	li	a4,-3
ffffffffc0203296:	17c1                	addi	a5,a5,-16
ffffffffc0203298:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc020329c:	8082                	ret
ffffffffc020329e:	1141                	addi	sp,sp,-16
ffffffffc02032a0:	00007697          	auipc	a3,0x7
ffffffffc02032a4:	14868693          	addi	a3,a3,328 # ffffffffc020a3e8 <commands+0x15e0>
ffffffffc02032a8:	00006617          	auipc	a2,0x6
ffffffffc02032ac:	fe060613          	addi	a2,a2,-32 # ffffffffc0209288 <commands+0x480>
ffffffffc02032b0:	06200593          	li	a1,98
ffffffffc02032b4:	00007517          	auipc	a0,0x7
ffffffffc02032b8:	dfc50513          	addi	a0,a0,-516 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc02032bc:	e406                	sd	ra,8(sp)
ffffffffc02032be:	f5bfc0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02032c2 <default_init_memmap>:
ffffffffc02032c2:	1141                	addi	sp,sp,-16
ffffffffc02032c4:	e406                	sd	ra,8(sp)
ffffffffc02032c6:	c1ed                	beqz	a1,ffffffffc02033a8 <default_init_memmap+0xe6>
ffffffffc02032c8:	00659693          	slli	a3,a1,0x6
ffffffffc02032cc:	96aa                	add	a3,a3,a0
ffffffffc02032ce:	02d50463          	beq	a0,a3,ffffffffc02032f6 <default_init_memmap+0x34>
ffffffffc02032d2:	6518                	ld	a4,8(a0)
ffffffffc02032d4:	87aa                	mv	a5,a0
ffffffffc02032d6:	8b05                	andi	a4,a4,1
ffffffffc02032d8:	e709                	bnez	a4,ffffffffc02032e2 <default_init_memmap+0x20>
ffffffffc02032da:	a07d                	j	ffffffffc0203388 <default_init_memmap+0xc6>
ffffffffc02032dc:	6798                	ld	a4,8(a5)
ffffffffc02032de:	8b05                	andi	a4,a4,1
ffffffffc02032e0:	c745                	beqz	a4,ffffffffc0203388 <default_init_memmap+0xc6>
ffffffffc02032e2:	0007a823          	sw	zero,16(a5)
ffffffffc02032e6:	0007b423          	sd	zero,8(a5)
ffffffffc02032ea:	0007a023          	sw	zero,0(a5)
ffffffffc02032ee:	04078793          	addi	a5,a5,64
ffffffffc02032f2:	fed795e3          	bne	a5,a3,ffffffffc02032dc <default_init_memmap+0x1a>
ffffffffc02032f6:	2581                	sext.w	a1,a1
ffffffffc02032f8:	c90c                	sw	a1,16(a0)
ffffffffc02032fa:	4789                	li	a5,2
ffffffffc02032fc:	00850713          	addi	a4,a0,8
ffffffffc0203300:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0203304:	0003a697          	auipc	a3,0x3a
ffffffffc0203308:	c9468693          	addi	a3,a3,-876 # ffffffffc023cf98 <free_area>
ffffffffc020330c:	4a98                	lw	a4,16(a3)
ffffffffc020330e:	669c                	ld	a5,8(a3)
ffffffffc0203310:	9db9                	addw	a1,a1,a4
ffffffffc0203312:	0003a717          	auipc	a4,0x3a
ffffffffc0203316:	c8b72b23          	sw	a1,-874(a4) # ffffffffc023cfa8 <free_area+0x10>
ffffffffc020331a:	04d78a63          	beq	a5,a3,ffffffffc020336e <default_init_memmap+0xac>
ffffffffc020331e:	fe878713          	addi	a4,a5,-24
ffffffffc0203322:	628c                	ld	a1,0(a3)
ffffffffc0203324:	4801                	li	a6,0
ffffffffc0203326:	01850613          	addi	a2,a0,24
ffffffffc020332a:	00e56a63          	bltu	a0,a4,ffffffffc020333e <default_init_memmap+0x7c>
ffffffffc020332e:	6798                	ld	a4,8(a5)
ffffffffc0203330:	02d70563          	beq	a4,a3,ffffffffc020335a <default_init_memmap+0x98>
ffffffffc0203334:	87ba                	mv	a5,a4
ffffffffc0203336:	fe878713          	addi	a4,a5,-24
ffffffffc020333a:	fee57ae3          	bgeu	a0,a4,ffffffffc020332e <default_init_memmap+0x6c>
ffffffffc020333e:	00080663          	beqz	a6,ffffffffc020334a <default_init_memmap+0x88>
ffffffffc0203342:	0003a717          	auipc	a4,0x3a
ffffffffc0203346:	c4b73b23          	sd	a1,-938(a4) # ffffffffc023cf98 <free_area>
ffffffffc020334a:	6398                	ld	a4,0(a5)
ffffffffc020334c:	60a2                	ld	ra,8(sp)
ffffffffc020334e:	e390                	sd	a2,0(a5)
ffffffffc0203350:	e710                	sd	a2,8(a4)
ffffffffc0203352:	f11c                	sd	a5,32(a0)
ffffffffc0203354:	ed18                	sd	a4,24(a0)
ffffffffc0203356:	0141                	addi	sp,sp,16
ffffffffc0203358:	8082                	ret
ffffffffc020335a:	e790                	sd	a2,8(a5)
ffffffffc020335c:	f114                	sd	a3,32(a0)
ffffffffc020335e:	6798                	ld	a4,8(a5)
ffffffffc0203360:	ed1c                	sd	a5,24(a0)
ffffffffc0203362:	85b2                	mv	a1,a2
ffffffffc0203364:	00d70e63          	beq	a4,a3,ffffffffc0203380 <default_init_memmap+0xbe>
ffffffffc0203368:	4805                	li	a6,1
ffffffffc020336a:	87ba                	mv	a5,a4
ffffffffc020336c:	b7e9                	j	ffffffffc0203336 <default_init_memmap+0x74>
ffffffffc020336e:	60a2                	ld	ra,8(sp)
ffffffffc0203370:	01850713          	addi	a4,a0,24
ffffffffc0203374:	e398                	sd	a4,0(a5)
ffffffffc0203376:	e798                	sd	a4,8(a5)
ffffffffc0203378:	f11c                	sd	a5,32(a0)
ffffffffc020337a:	ed1c                	sd	a5,24(a0)
ffffffffc020337c:	0141                	addi	sp,sp,16
ffffffffc020337e:	8082                	ret
ffffffffc0203380:	60a2                	ld	ra,8(sp)
ffffffffc0203382:	e290                	sd	a2,0(a3)
ffffffffc0203384:	0141                	addi	sp,sp,16
ffffffffc0203386:	8082                	ret
ffffffffc0203388:	00007697          	auipc	a3,0x7
ffffffffc020338c:	06868693          	addi	a3,a3,104 # ffffffffc020a3f0 <commands+0x15e8>
ffffffffc0203390:	00006617          	auipc	a2,0x6
ffffffffc0203394:	ef860613          	addi	a2,a2,-264 # ffffffffc0209288 <commands+0x480>
ffffffffc0203398:	04900593          	li	a1,73
ffffffffc020339c:	00007517          	auipc	a0,0x7
ffffffffc02033a0:	d1450513          	addi	a0,a0,-748 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc02033a4:	e75fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02033a8:	00007697          	auipc	a3,0x7
ffffffffc02033ac:	04068693          	addi	a3,a3,64 # ffffffffc020a3e8 <commands+0x15e0>
ffffffffc02033b0:	00006617          	auipc	a2,0x6
ffffffffc02033b4:	ed860613          	addi	a2,a2,-296 # ffffffffc0209288 <commands+0x480>
ffffffffc02033b8:	04600593          	li	a1,70
ffffffffc02033bc:	00007517          	auipc	a0,0x7
ffffffffc02033c0:	cf450513          	addi	a0,a0,-780 # ffffffffc020a0b0 <commands+0x12a8>
ffffffffc02033c4:	e55fc0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02033c8 <pa2page.part.4>:
ffffffffc02033c8:	1141                	addi	sp,sp,-16
ffffffffc02033ca:	00006617          	auipc	a2,0x6
ffffffffc02033ce:	5e660613          	addi	a2,a2,1510 # ffffffffc02099b0 <commands+0xba8>
ffffffffc02033d2:	06200593          	li	a1,98
ffffffffc02033d6:	00006517          	auipc	a0,0x6
ffffffffc02033da:	5fa50513          	addi	a0,a0,1530 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02033de:	e406                	sd	ra,8(sp)
ffffffffc02033e0:	e39fc0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02033e4 <alloc_pages>:
ffffffffc02033e4:	715d                	addi	sp,sp,-80
ffffffffc02033e6:	e0a2                	sd	s0,64(sp)
ffffffffc02033e8:	fc26                	sd	s1,56(sp)
ffffffffc02033ea:	f84a                	sd	s2,48(sp)
ffffffffc02033ec:	f44e                	sd	s3,40(sp)
ffffffffc02033ee:	f052                	sd	s4,32(sp)
ffffffffc02033f0:	ec56                	sd	s5,24(sp)
ffffffffc02033f2:	e486                	sd	ra,72(sp)
ffffffffc02033f4:	842a                	mv	s0,a0
ffffffffc02033f6:	0003a497          	auipc	s1,0x3a
ffffffffc02033fa:	bba48493          	addi	s1,s1,-1094 # ffffffffc023cfb0 <pmm_manager>
ffffffffc02033fe:	4985                	li	s3,1
ffffffffc0203400:	0003aa17          	auipc	s4,0x3a
ffffffffc0203404:	a68a0a13          	addi	s4,s4,-1432 # ffffffffc023ce68 <swap_init_ok>
ffffffffc0203408:	0005091b          	sext.w	s2,a0
ffffffffc020340c:	0003aa97          	auipc	s5,0x3a
ffffffffc0203410:	aaca8a93          	addi	s5,s5,-1364 # ffffffffc023ceb8 <check_mm_struct>
ffffffffc0203414:	a00d                	j	ffffffffc0203436 <alloc_pages+0x52>
ffffffffc0203416:	609c                	ld	a5,0(s1)
ffffffffc0203418:	6f9c                	ld	a5,24(a5)
ffffffffc020341a:	9782                	jalr	a5
ffffffffc020341c:	4601                	li	a2,0
ffffffffc020341e:	85ca                	mv	a1,s2
ffffffffc0203420:	ed0d                	bnez	a0,ffffffffc020345a <alloc_pages+0x76>
ffffffffc0203422:	0289ec63          	bltu	s3,s0,ffffffffc020345a <alloc_pages+0x76>
ffffffffc0203426:	000a2783          	lw	a5,0(s4)
ffffffffc020342a:	2781                	sext.w	a5,a5
ffffffffc020342c:	c79d                	beqz	a5,ffffffffc020345a <alloc_pages+0x76>
ffffffffc020342e:	000ab503          	ld	a0,0(s5)
ffffffffc0203432:	abaff0ef          	jal	ra,ffffffffc02026ec <swap_out>
ffffffffc0203436:	100027f3          	csrr	a5,sstatus
ffffffffc020343a:	8b89                	andi	a5,a5,2
ffffffffc020343c:	8522                	mv	a0,s0
ffffffffc020343e:	dfe1                	beqz	a5,ffffffffc0203416 <alloc_pages+0x32>
ffffffffc0203440:	a0cfd0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0203444:	609c                	ld	a5,0(s1)
ffffffffc0203446:	8522                	mv	a0,s0
ffffffffc0203448:	6f9c                	ld	a5,24(a5)
ffffffffc020344a:	9782                	jalr	a5
ffffffffc020344c:	e42a                	sd	a0,8(sp)
ffffffffc020344e:	9f8fd0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0203452:	6522                	ld	a0,8(sp)
ffffffffc0203454:	4601                	li	a2,0
ffffffffc0203456:	85ca                	mv	a1,s2
ffffffffc0203458:	d569                	beqz	a0,ffffffffc0203422 <alloc_pages+0x3e>
ffffffffc020345a:	60a6                	ld	ra,72(sp)
ffffffffc020345c:	6406                	ld	s0,64(sp)
ffffffffc020345e:	74e2                	ld	s1,56(sp)
ffffffffc0203460:	7942                	ld	s2,48(sp)
ffffffffc0203462:	79a2                	ld	s3,40(sp)
ffffffffc0203464:	7a02                	ld	s4,32(sp)
ffffffffc0203466:	6ae2                	ld	s5,24(sp)
ffffffffc0203468:	6161                	addi	sp,sp,80
ffffffffc020346a:	8082                	ret

ffffffffc020346c <free_pages>:
ffffffffc020346c:	100027f3          	csrr	a5,sstatus
ffffffffc0203470:	8b89                	andi	a5,a5,2
ffffffffc0203472:	eb89                	bnez	a5,ffffffffc0203484 <free_pages+0x18>
ffffffffc0203474:	0003a797          	auipc	a5,0x3a
ffffffffc0203478:	b3c78793          	addi	a5,a5,-1220 # ffffffffc023cfb0 <pmm_manager>
ffffffffc020347c:	639c                	ld	a5,0(a5)
ffffffffc020347e:	0207b303          	ld	t1,32(a5)
ffffffffc0203482:	8302                	jr	t1
ffffffffc0203484:	1101                	addi	sp,sp,-32
ffffffffc0203486:	ec06                	sd	ra,24(sp)
ffffffffc0203488:	e822                	sd	s0,16(sp)
ffffffffc020348a:	e426                	sd	s1,8(sp)
ffffffffc020348c:	842a                	mv	s0,a0
ffffffffc020348e:	84ae                	mv	s1,a1
ffffffffc0203490:	9bcfd0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0203494:	0003a797          	auipc	a5,0x3a
ffffffffc0203498:	b1c78793          	addi	a5,a5,-1252 # ffffffffc023cfb0 <pmm_manager>
ffffffffc020349c:	639c                	ld	a5,0(a5)
ffffffffc020349e:	85a6                	mv	a1,s1
ffffffffc02034a0:	8522                	mv	a0,s0
ffffffffc02034a2:	739c                	ld	a5,32(a5)
ffffffffc02034a4:	9782                	jalr	a5
ffffffffc02034a6:	6442                	ld	s0,16(sp)
ffffffffc02034a8:	60e2                	ld	ra,24(sp)
ffffffffc02034aa:	64a2                	ld	s1,8(sp)
ffffffffc02034ac:	6105                	addi	sp,sp,32
ffffffffc02034ae:	998fd06f          	j	ffffffffc0200646 <intr_enable>

ffffffffc02034b2 <nr_free_pages>:
ffffffffc02034b2:	100027f3          	csrr	a5,sstatus
ffffffffc02034b6:	8b89                	andi	a5,a5,2
ffffffffc02034b8:	eb89                	bnez	a5,ffffffffc02034ca <nr_free_pages+0x18>
ffffffffc02034ba:	0003a797          	auipc	a5,0x3a
ffffffffc02034be:	af678793          	addi	a5,a5,-1290 # ffffffffc023cfb0 <pmm_manager>
ffffffffc02034c2:	639c                	ld	a5,0(a5)
ffffffffc02034c4:	0287b303          	ld	t1,40(a5)
ffffffffc02034c8:	8302                	jr	t1
ffffffffc02034ca:	1141                	addi	sp,sp,-16
ffffffffc02034cc:	e406                	sd	ra,8(sp)
ffffffffc02034ce:	e022                	sd	s0,0(sp)
ffffffffc02034d0:	97cfd0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc02034d4:	0003a797          	auipc	a5,0x3a
ffffffffc02034d8:	adc78793          	addi	a5,a5,-1316 # ffffffffc023cfb0 <pmm_manager>
ffffffffc02034dc:	639c                	ld	a5,0(a5)
ffffffffc02034de:	779c                	ld	a5,40(a5)
ffffffffc02034e0:	9782                	jalr	a5
ffffffffc02034e2:	842a                	mv	s0,a0
ffffffffc02034e4:	962fd0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc02034e8:	8522                	mv	a0,s0
ffffffffc02034ea:	60a2                	ld	ra,8(sp)
ffffffffc02034ec:	6402                	ld	s0,0(sp)
ffffffffc02034ee:	0141                	addi	sp,sp,16
ffffffffc02034f0:	8082                	ret

ffffffffc02034f2 <get_pte>:
ffffffffc02034f2:	7139                	addi	sp,sp,-64
ffffffffc02034f4:	f426                	sd	s1,40(sp)
ffffffffc02034f6:	01e5d493          	srli	s1,a1,0x1e
ffffffffc02034fa:	1ff4f493          	andi	s1,s1,511
ffffffffc02034fe:	048e                	slli	s1,s1,0x3
ffffffffc0203500:	94aa                	add	s1,s1,a0
ffffffffc0203502:	6094                	ld	a3,0(s1)
ffffffffc0203504:	f04a                	sd	s2,32(sp)
ffffffffc0203506:	ec4e                	sd	s3,24(sp)
ffffffffc0203508:	e852                	sd	s4,16(sp)
ffffffffc020350a:	fc06                	sd	ra,56(sp)
ffffffffc020350c:	f822                	sd	s0,48(sp)
ffffffffc020350e:	e456                	sd	s5,8(sp)
ffffffffc0203510:	e05a                	sd	s6,0(sp)
ffffffffc0203512:	0016f793          	andi	a5,a3,1
ffffffffc0203516:	892e                	mv	s2,a1
ffffffffc0203518:	8a32                	mv	s4,a2
ffffffffc020351a:	0003a997          	auipc	s3,0x3a
ffffffffc020351e:	95e98993          	addi	s3,s3,-1698 # ffffffffc023ce78 <npage>
ffffffffc0203522:	e7bd                	bnez	a5,ffffffffc0203590 <get_pte+0x9e>
ffffffffc0203524:	12060c63          	beqz	a2,ffffffffc020365c <get_pte+0x16a>
ffffffffc0203528:	4505                	li	a0,1
ffffffffc020352a:	ebbff0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc020352e:	842a                	mv	s0,a0
ffffffffc0203530:	12050663          	beqz	a0,ffffffffc020365c <get_pte+0x16a>
ffffffffc0203534:	0003ab17          	auipc	s6,0x3a
ffffffffc0203538:	a94b0b13          	addi	s6,s6,-1388 # ffffffffc023cfc8 <pages>
ffffffffc020353c:	000b3503          	ld	a0,0(s6)
ffffffffc0203540:	00080ab7          	lui	s5,0x80
ffffffffc0203544:	0003a997          	auipc	s3,0x3a
ffffffffc0203548:	93498993          	addi	s3,s3,-1740 # ffffffffc023ce78 <npage>
ffffffffc020354c:	40a40533          	sub	a0,s0,a0
ffffffffc0203550:	8519                	srai	a0,a0,0x6
ffffffffc0203552:	9556                	add	a0,a0,s5
ffffffffc0203554:	0009b703          	ld	a4,0(s3)
ffffffffc0203558:	00c51793          	slli	a5,a0,0xc
ffffffffc020355c:	4685                	li	a3,1
ffffffffc020355e:	c014                	sw	a3,0(s0)
ffffffffc0203560:	83b1                	srli	a5,a5,0xc
ffffffffc0203562:	0532                	slli	a0,a0,0xc
ffffffffc0203564:	14e7f363          	bgeu	a5,a4,ffffffffc02036aa <get_pte+0x1b8>
ffffffffc0203568:	0003a797          	auipc	a5,0x3a
ffffffffc020356c:	a5078793          	addi	a5,a5,-1456 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0203570:	639c                	ld	a5,0(a5)
ffffffffc0203572:	6605                	lui	a2,0x1
ffffffffc0203574:	4581                	li	a1,0
ffffffffc0203576:	953e                	add	a0,a0,a5
ffffffffc0203578:	2ec050ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc020357c:	000b3683          	ld	a3,0(s6)
ffffffffc0203580:	40d406b3          	sub	a3,s0,a3
ffffffffc0203584:	8699                	srai	a3,a3,0x6
ffffffffc0203586:	96d6                	add	a3,a3,s5
ffffffffc0203588:	06aa                	slli	a3,a3,0xa
ffffffffc020358a:	0116e693          	ori	a3,a3,17
ffffffffc020358e:	e094                	sd	a3,0(s1)
ffffffffc0203590:	77fd                	lui	a5,0xfffff
ffffffffc0203592:	068a                	slli	a3,a3,0x2
ffffffffc0203594:	0009b703          	ld	a4,0(s3)
ffffffffc0203598:	8efd                	and	a3,a3,a5
ffffffffc020359a:	00c6d793          	srli	a5,a3,0xc
ffffffffc020359e:	0ce7f163          	bgeu	a5,a4,ffffffffc0203660 <get_pte+0x16e>
ffffffffc02035a2:	0003aa97          	auipc	s5,0x3a
ffffffffc02035a6:	a16a8a93          	addi	s5,s5,-1514 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc02035aa:	000ab403          	ld	s0,0(s5)
ffffffffc02035ae:	01595793          	srli	a5,s2,0x15
ffffffffc02035b2:	1ff7f793          	andi	a5,a5,511
ffffffffc02035b6:	96a2                	add	a3,a3,s0
ffffffffc02035b8:	00379413          	slli	s0,a5,0x3
ffffffffc02035bc:	9436                	add	s0,s0,a3
ffffffffc02035be:	6014                	ld	a3,0(s0)
ffffffffc02035c0:	0016f793          	andi	a5,a3,1
ffffffffc02035c4:	e3ad                	bnez	a5,ffffffffc0203626 <get_pte+0x134>
ffffffffc02035c6:	080a0b63          	beqz	s4,ffffffffc020365c <get_pte+0x16a>
ffffffffc02035ca:	4505                	li	a0,1
ffffffffc02035cc:	e19ff0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc02035d0:	84aa                	mv	s1,a0
ffffffffc02035d2:	c549                	beqz	a0,ffffffffc020365c <get_pte+0x16a>
ffffffffc02035d4:	0003ab17          	auipc	s6,0x3a
ffffffffc02035d8:	9f4b0b13          	addi	s6,s6,-1548 # ffffffffc023cfc8 <pages>
ffffffffc02035dc:	000b3503          	ld	a0,0(s6)
ffffffffc02035e0:	00080a37          	lui	s4,0x80
ffffffffc02035e4:	0009b703          	ld	a4,0(s3)
ffffffffc02035e8:	40a48533          	sub	a0,s1,a0
ffffffffc02035ec:	8519                	srai	a0,a0,0x6
ffffffffc02035ee:	9552                	add	a0,a0,s4
ffffffffc02035f0:	00c51793          	slli	a5,a0,0xc
ffffffffc02035f4:	4685                	li	a3,1
ffffffffc02035f6:	c094                	sw	a3,0(s1)
ffffffffc02035f8:	83b1                	srli	a5,a5,0xc
ffffffffc02035fa:	0532                	slli	a0,a0,0xc
ffffffffc02035fc:	08e7fa63          	bgeu	a5,a4,ffffffffc0203690 <get_pte+0x19e>
ffffffffc0203600:	000ab783          	ld	a5,0(s5)
ffffffffc0203604:	6605                	lui	a2,0x1
ffffffffc0203606:	4581                	li	a1,0
ffffffffc0203608:	953e                	add	a0,a0,a5
ffffffffc020360a:	25a050ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc020360e:	000b3683          	ld	a3,0(s6)
ffffffffc0203612:	40d486b3          	sub	a3,s1,a3
ffffffffc0203616:	8699                	srai	a3,a3,0x6
ffffffffc0203618:	96d2                	add	a3,a3,s4
ffffffffc020361a:	06aa                	slli	a3,a3,0xa
ffffffffc020361c:	0116e693          	ori	a3,a3,17
ffffffffc0203620:	e014                	sd	a3,0(s0)
ffffffffc0203622:	0009b703          	ld	a4,0(s3)
ffffffffc0203626:	068a                	slli	a3,a3,0x2
ffffffffc0203628:	757d                	lui	a0,0xfffff
ffffffffc020362a:	8ee9                	and	a3,a3,a0
ffffffffc020362c:	00c6d793          	srli	a5,a3,0xc
ffffffffc0203630:	04e7f463          	bgeu	a5,a4,ffffffffc0203678 <get_pte+0x186>
ffffffffc0203634:	000ab503          	ld	a0,0(s5)
ffffffffc0203638:	00c95913          	srli	s2,s2,0xc
ffffffffc020363c:	1ff97913          	andi	s2,s2,511
ffffffffc0203640:	96aa                	add	a3,a3,a0
ffffffffc0203642:	00391513          	slli	a0,s2,0x3
ffffffffc0203646:	9536                	add	a0,a0,a3
ffffffffc0203648:	70e2                	ld	ra,56(sp)
ffffffffc020364a:	7442                	ld	s0,48(sp)
ffffffffc020364c:	74a2                	ld	s1,40(sp)
ffffffffc020364e:	7902                	ld	s2,32(sp)
ffffffffc0203650:	69e2                	ld	s3,24(sp)
ffffffffc0203652:	6a42                	ld	s4,16(sp)
ffffffffc0203654:	6aa2                	ld	s5,8(sp)
ffffffffc0203656:	6b02                	ld	s6,0(sp)
ffffffffc0203658:	6121                	addi	sp,sp,64
ffffffffc020365a:	8082                	ret
ffffffffc020365c:	4501                	li	a0,0
ffffffffc020365e:	b7ed                	j	ffffffffc0203648 <get_pte+0x156>
ffffffffc0203660:	00006617          	auipc	a2,0x6
ffffffffc0203664:	5d060613          	addi	a2,a2,1488 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0203668:	0fe00593          	li	a1,254
ffffffffc020366c:	00007517          	auipc	a0,0x7
ffffffffc0203670:	e1450513          	addi	a0,a0,-492 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203674:	ba5fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203678:	00006617          	auipc	a2,0x6
ffffffffc020367c:	5b860613          	addi	a2,a2,1464 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0203680:	10900593          	li	a1,265
ffffffffc0203684:	00007517          	auipc	a0,0x7
ffffffffc0203688:	dfc50513          	addi	a0,a0,-516 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc020368c:	b8dfc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203690:	86aa                	mv	a3,a0
ffffffffc0203692:	00006617          	auipc	a2,0x6
ffffffffc0203696:	59e60613          	addi	a2,a2,1438 # ffffffffc0209c30 <commands+0xe28>
ffffffffc020369a:	10600593          	li	a1,262
ffffffffc020369e:	00007517          	auipc	a0,0x7
ffffffffc02036a2:	de250513          	addi	a0,a0,-542 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02036a6:	b73fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02036aa:	86aa                	mv	a3,a0
ffffffffc02036ac:	00006617          	auipc	a2,0x6
ffffffffc02036b0:	58460613          	addi	a2,a2,1412 # ffffffffc0209c30 <commands+0xe28>
ffffffffc02036b4:	0fa00593          	li	a1,250
ffffffffc02036b8:	00007517          	auipc	a0,0x7
ffffffffc02036bc:	dc850513          	addi	a0,a0,-568 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02036c0:	b59fc0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02036c4 <get_page>:
ffffffffc02036c4:	1141                	addi	sp,sp,-16
ffffffffc02036c6:	e022                	sd	s0,0(sp)
ffffffffc02036c8:	8432                	mv	s0,a2
ffffffffc02036ca:	4601                	li	a2,0
ffffffffc02036cc:	e406                	sd	ra,8(sp)
ffffffffc02036ce:	e25ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc02036d2:	c011                	beqz	s0,ffffffffc02036d6 <get_page+0x12>
ffffffffc02036d4:	e008                	sd	a0,0(s0)
ffffffffc02036d6:	c511                	beqz	a0,ffffffffc02036e2 <get_page+0x1e>
ffffffffc02036d8:	611c                	ld	a5,0(a0)
ffffffffc02036da:	4501                	li	a0,0
ffffffffc02036dc:	0017f713          	andi	a4,a5,1
ffffffffc02036e0:	e709                	bnez	a4,ffffffffc02036ea <get_page+0x26>
ffffffffc02036e2:	60a2                	ld	ra,8(sp)
ffffffffc02036e4:	6402                	ld	s0,0(sp)
ffffffffc02036e6:	0141                	addi	sp,sp,16
ffffffffc02036e8:	8082                	ret
ffffffffc02036ea:	00039717          	auipc	a4,0x39
ffffffffc02036ee:	78e70713          	addi	a4,a4,1934 # ffffffffc023ce78 <npage>
ffffffffc02036f2:	6318                	ld	a4,0(a4)
ffffffffc02036f4:	078a                	slli	a5,a5,0x2
ffffffffc02036f6:	83b1                	srli	a5,a5,0xc
ffffffffc02036f8:	02e7f063          	bgeu	a5,a4,ffffffffc0203718 <get_page+0x54>
ffffffffc02036fc:	0003a717          	auipc	a4,0x3a
ffffffffc0203700:	8cc70713          	addi	a4,a4,-1844 # ffffffffc023cfc8 <pages>
ffffffffc0203704:	6308                	ld	a0,0(a4)
ffffffffc0203706:	60a2                	ld	ra,8(sp)
ffffffffc0203708:	6402                	ld	s0,0(sp)
ffffffffc020370a:	fff80737          	lui	a4,0xfff80
ffffffffc020370e:	97ba                	add	a5,a5,a4
ffffffffc0203710:	079a                	slli	a5,a5,0x6
ffffffffc0203712:	953e                	add	a0,a0,a5
ffffffffc0203714:	0141                	addi	sp,sp,16
ffffffffc0203716:	8082                	ret
ffffffffc0203718:	cb1ff0ef          	jal	ra,ffffffffc02033c8 <pa2page.part.4>

ffffffffc020371c <unmap_range>:
ffffffffc020371c:	711d                	addi	sp,sp,-96
ffffffffc020371e:	00c5e7b3          	or	a5,a1,a2
ffffffffc0203722:	ec86                	sd	ra,88(sp)
ffffffffc0203724:	e8a2                	sd	s0,80(sp)
ffffffffc0203726:	e4a6                	sd	s1,72(sp)
ffffffffc0203728:	e0ca                	sd	s2,64(sp)
ffffffffc020372a:	fc4e                	sd	s3,56(sp)
ffffffffc020372c:	f852                	sd	s4,48(sp)
ffffffffc020372e:	f456                	sd	s5,40(sp)
ffffffffc0203730:	f05a                	sd	s6,32(sp)
ffffffffc0203732:	ec5e                	sd	s7,24(sp)
ffffffffc0203734:	e862                	sd	s8,16(sp)
ffffffffc0203736:	e466                	sd	s9,8(sp)
ffffffffc0203738:	03479713          	slli	a4,a5,0x34
ffffffffc020373c:	eb71                	bnez	a4,ffffffffc0203810 <unmap_range+0xf4>
ffffffffc020373e:	002007b7          	lui	a5,0x200
ffffffffc0203742:	842e                	mv	s0,a1
ffffffffc0203744:	0af5e663          	bltu	a1,a5,ffffffffc02037f0 <unmap_range+0xd4>
ffffffffc0203748:	8932                	mv	s2,a2
ffffffffc020374a:	0ac5f363          	bgeu	a1,a2,ffffffffc02037f0 <unmap_range+0xd4>
ffffffffc020374e:	4785                	li	a5,1
ffffffffc0203750:	07fe                	slli	a5,a5,0x1f
ffffffffc0203752:	08c7ef63          	bltu	a5,a2,ffffffffc02037f0 <unmap_range+0xd4>
ffffffffc0203756:	89aa                	mv	s3,a0
ffffffffc0203758:	6a05                	lui	s4,0x1
ffffffffc020375a:	00039c97          	auipc	s9,0x39
ffffffffc020375e:	71ec8c93          	addi	s9,s9,1822 # ffffffffc023ce78 <npage>
ffffffffc0203762:	0003ac17          	auipc	s8,0x3a
ffffffffc0203766:	866c0c13          	addi	s8,s8,-1946 # ffffffffc023cfc8 <pages>
ffffffffc020376a:	fff80bb7          	lui	s7,0xfff80
ffffffffc020376e:	00200b37          	lui	s6,0x200
ffffffffc0203772:	ffe00ab7          	lui	s5,0xffe00
ffffffffc0203776:	4601                	li	a2,0
ffffffffc0203778:	85a2                	mv	a1,s0
ffffffffc020377a:	854e                	mv	a0,s3
ffffffffc020377c:	d77ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0203780:	84aa                	mv	s1,a0
ffffffffc0203782:	cd21                	beqz	a0,ffffffffc02037da <unmap_range+0xbe>
ffffffffc0203784:	611c                	ld	a5,0(a0)
ffffffffc0203786:	e38d                	bnez	a5,ffffffffc02037a8 <unmap_range+0x8c>
ffffffffc0203788:	9452                	add	s0,s0,s4
ffffffffc020378a:	ff2466e3          	bltu	s0,s2,ffffffffc0203776 <unmap_range+0x5a>
ffffffffc020378e:	60e6                	ld	ra,88(sp)
ffffffffc0203790:	6446                	ld	s0,80(sp)
ffffffffc0203792:	64a6                	ld	s1,72(sp)
ffffffffc0203794:	6906                	ld	s2,64(sp)
ffffffffc0203796:	79e2                	ld	s3,56(sp)
ffffffffc0203798:	7a42                	ld	s4,48(sp)
ffffffffc020379a:	7aa2                	ld	s5,40(sp)
ffffffffc020379c:	7b02                	ld	s6,32(sp)
ffffffffc020379e:	6be2                	ld	s7,24(sp)
ffffffffc02037a0:	6c42                	ld	s8,16(sp)
ffffffffc02037a2:	6ca2                	ld	s9,8(sp)
ffffffffc02037a4:	6125                	addi	sp,sp,96
ffffffffc02037a6:	8082                	ret
ffffffffc02037a8:	0017f713          	andi	a4,a5,1
ffffffffc02037ac:	df71                	beqz	a4,ffffffffc0203788 <unmap_range+0x6c>
ffffffffc02037ae:	000cb703          	ld	a4,0(s9)
ffffffffc02037b2:	078a                	slli	a5,a5,0x2
ffffffffc02037b4:	83b1                	srli	a5,a5,0xc
ffffffffc02037b6:	06e7fd63          	bgeu	a5,a4,ffffffffc0203830 <unmap_range+0x114>
ffffffffc02037ba:	000c3503          	ld	a0,0(s8)
ffffffffc02037be:	97de                	add	a5,a5,s7
ffffffffc02037c0:	079a                	slli	a5,a5,0x6
ffffffffc02037c2:	953e                	add	a0,a0,a5
ffffffffc02037c4:	411c                	lw	a5,0(a0)
ffffffffc02037c6:	fff7871b          	addiw	a4,a5,-1
ffffffffc02037ca:	c118                	sw	a4,0(a0)
ffffffffc02037cc:	cf11                	beqz	a4,ffffffffc02037e8 <unmap_range+0xcc>
ffffffffc02037ce:	0004b023          	sd	zero,0(s1)
ffffffffc02037d2:	12040073          	sfence.vma	s0
ffffffffc02037d6:	9452                	add	s0,s0,s4
ffffffffc02037d8:	bf4d                	j	ffffffffc020378a <unmap_range+0x6e>
ffffffffc02037da:	945a                	add	s0,s0,s6
ffffffffc02037dc:	01547433          	and	s0,s0,s5
ffffffffc02037e0:	d45d                	beqz	s0,ffffffffc020378e <unmap_range+0x72>
ffffffffc02037e2:	f9246ae3          	bltu	s0,s2,ffffffffc0203776 <unmap_range+0x5a>
ffffffffc02037e6:	b765                	j	ffffffffc020378e <unmap_range+0x72>
ffffffffc02037e8:	4585                	li	a1,1
ffffffffc02037ea:	c83ff0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc02037ee:	b7c5                	j	ffffffffc02037ce <unmap_range+0xb2>
ffffffffc02037f0:	00007697          	auipc	a3,0x7
ffffffffc02037f4:	1f068693          	addi	a3,a3,496 # ffffffffc020a9e0 <default_pmm_manager+0x5e0>
ffffffffc02037f8:	00006617          	auipc	a2,0x6
ffffffffc02037fc:	a9060613          	addi	a2,a2,-1392 # ffffffffc0209288 <commands+0x480>
ffffffffc0203800:	14100593          	li	a1,321
ffffffffc0203804:	00007517          	auipc	a0,0x7
ffffffffc0203808:	c7c50513          	addi	a0,a0,-900 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc020380c:	a0dfc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203810:	00007697          	auipc	a3,0x7
ffffffffc0203814:	1a068693          	addi	a3,a3,416 # ffffffffc020a9b0 <default_pmm_manager+0x5b0>
ffffffffc0203818:	00006617          	auipc	a2,0x6
ffffffffc020381c:	a7060613          	addi	a2,a2,-1424 # ffffffffc0209288 <commands+0x480>
ffffffffc0203820:	14000593          	li	a1,320
ffffffffc0203824:	00007517          	auipc	a0,0x7
ffffffffc0203828:	c5c50513          	addi	a0,a0,-932 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc020382c:	9edfc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203830:	b99ff0ef          	jal	ra,ffffffffc02033c8 <pa2page.part.4>

ffffffffc0203834 <exit_range>:
ffffffffc0203834:	715d                	addi	sp,sp,-80
ffffffffc0203836:	00c5e7b3          	or	a5,a1,a2
ffffffffc020383a:	e486                	sd	ra,72(sp)
ffffffffc020383c:	e0a2                	sd	s0,64(sp)
ffffffffc020383e:	fc26                	sd	s1,56(sp)
ffffffffc0203840:	f84a                	sd	s2,48(sp)
ffffffffc0203842:	f44e                	sd	s3,40(sp)
ffffffffc0203844:	f052                	sd	s4,32(sp)
ffffffffc0203846:	ec56                	sd	s5,24(sp)
ffffffffc0203848:	e85a                	sd	s6,16(sp)
ffffffffc020384a:	e45e                	sd	s7,8(sp)
ffffffffc020384c:	03479713          	slli	a4,a5,0x34
ffffffffc0203850:	e371                	bnez	a4,ffffffffc0203914 <exit_range+0xe0>
ffffffffc0203852:	002007b7          	lui	a5,0x200
ffffffffc0203856:	08f5ef63          	bltu	a1,a5,ffffffffc02038f4 <exit_range+0xc0>
ffffffffc020385a:	89b2                	mv	s3,a2
ffffffffc020385c:	08c5fc63          	bgeu	a1,a2,ffffffffc02038f4 <exit_range+0xc0>
ffffffffc0203860:	4785                	li	a5,1
ffffffffc0203862:	ffe004b7          	lui	s1,0xffe00
ffffffffc0203866:	07fe                	slli	a5,a5,0x1f
ffffffffc0203868:	8ced                	and	s1,s1,a1
ffffffffc020386a:	08c7e563          	bltu	a5,a2,ffffffffc02038f4 <exit_range+0xc0>
ffffffffc020386e:	8a2a                	mv	s4,a0
ffffffffc0203870:	00039b17          	auipc	s6,0x39
ffffffffc0203874:	608b0b13          	addi	s6,s6,1544 # ffffffffc023ce78 <npage>
ffffffffc0203878:	00039b97          	auipc	s7,0x39
ffffffffc020387c:	750b8b93          	addi	s7,s7,1872 # ffffffffc023cfc8 <pages>
ffffffffc0203880:	fff80937          	lui	s2,0xfff80
ffffffffc0203884:	00200ab7          	lui	s5,0x200
ffffffffc0203888:	a019                	j	ffffffffc020388e <exit_range+0x5a>
ffffffffc020388a:	0334fe63          	bgeu	s1,s3,ffffffffc02038c6 <exit_range+0x92>
ffffffffc020388e:	01e4d413          	srli	s0,s1,0x1e
ffffffffc0203892:	1ff47413          	andi	s0,s0,511
ffffffffc0203896:	040e                	slli	s0,s0,0x3
ffffffffc0203898:	9452                	add	s0,s0,s4
ffffffffc020389a:	601c                	ld	a5,0(s0)
ffffffffc020389c:	0017f713          	andi	a4,a5,1
ffffffffc02038a0:	c30d                	beqz	a4,ffffffffc02038c2 <exit_range+0x8e>
ffffffffc02038a2:	000b3703          	ld	a4,0(s6)
ffffffffc02038a6:	078a                	slli	a5,a5,0x2
ffffffffc02038a8:	83b1                	srli	a5,a5,0xc
ffffffffc02038aa:	02e7f963          	bgeu	a5,a4,ffffffffc02038dc <exit_range+0xa8>
ffffffffc02038ae:	000bb503          	ld	a0,0(s7)
ffffffffc02038b2:	97ca                	add	a5,a5,s2
ffffffffc02038b4:	079a                	slli	a5,a5,0x6
ffffffffc02038b6:	4585                	li	a1,1
ffffffffc02038b8:	953e                	add	a0,a0,a5
ffffffffc02038ba:	bb3ff0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc02038be:	00043023          	sd	zero,0(s0)
ffffffffc02038c2:	94d6                	add	s1,s1,s5
ffffffffc02038c4:	f0f9                	bnez	s1,ffffffffc020388a <exit_range+0x56>
ffffffffc02038c6:	60a6                	ld	ra,72(sp)
ffffffffc02038c8:	6406                	ld	s0,64(sp)
ffffffffc02038ca:	74e2                	ld	s1,56(sp)
ffffffffc02038cc:	7942                	ld	s2,48(sp)
ffffffffc02038ce:	79a2                	ld	s3,40(sp)
ffffffffc02038d0:	7a02                	ld	s4,32(sp)
ffffffffc02038d2:	6ae2                	ld	s5,24(sp)
ffffffffc02038d4:	6b42                	ld	s6,16(sp)
ffffffffc02038d6:	6ba2                	ld	s7,8(sp)
ffffffffc02038d8:	6161                	addi	sp,sp,80
ffffffffc02038da:	8082                	ret
ffffffffc02038dc:	00006617          	auipc	a2,0x6
ffffffffc02038e0:	0d460613          	addi	a2,a2,212 # ffffffffc02099b0 <commands+0xba8>
ffffffffc02038e4:	06200593          	li	a1,98
ffffffffc02038e8:	00006517          	auipc	a0,0x6
ffffffffc02038ec:	0e850513          	addi	a0,a0,232 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02038f0:	929fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02038f4:	00007697          	auipc	a3,0x7
ffffffffc02038f8:	0ec68693          	addi	a3,a3,236 # ffffffffc020a9e0 <default_pmm_manager+0x5e0>
ffffffffc02038fc:	00006617          	auipc	a2,0x6
ffffffffc0203900:	98c60613          	addi	a2,a2,-1652 # ffffffffc0209288 <commands+0x480>
ffffffffc0203904:	15200593          	li	a1,338
ffffffffc0203908:	00007517          	auipc	a0,0x7
ffffffffc020390c:	b7850513          	addi	a0,a0,-1160 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203910:	909fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203914:	00007697          	auipc	a3,0x7
ffffffffc0203918:	09c68693          	addi	a3,a3,156 # ffffffffc020a9b0 <default_pmm_manager+0x5b0>
ffffffffc020391c:	00006617          	auipc	a2,0x6
ffffffffc0203920:	96c60613          	addi	a2,a2,-1684 # ffffffffc0209288 <commands+0x480>
ffffffffc0203924:	15100593          	li	a1,337
ffffffffc0203928:	00007517          	auipc	a0,0x7
ffffffffc020392c:	b5850513          	addi	a0,a0,-1192 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203930:	8e9fc0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0203934 <page_remove>:
ffffffffc0203934:	1101                	addi	sp,sp,-32
ffffffffc0203936:	4601                	li	a2,0
ffffffffc0203938:	e426                	sd	s1,8(sp)
ffffffffc020393a:	ec06                	sd	ra,24(sp)
ffffffffc020393c:	e822                	sd	s0,16(sp)
ffffffffc020393e:	84ae                	mv	s1,a1
ffffffffc0203940:	bb3ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0203944:	c511                	beqz	a0,ffffffffc0203950 <page_remove+0x1c>
ffffffffc0203946:	611c                	ld	a5,0(a0)
ffffffffc0203948:	842a                	mv	s0,a0
ffffffffc020394a:	0017f713          	andi	a4,a5,1
ffffffffc020394e:	e711                	bnez	a4,ffffffffc020395a <page_remove+0x26>
ffffffffc0203950:	60e2                	ld	ra,24(sp)
ffffffffc0203952:	6442                	ld	s0,16(sp)
ffffffffc0203954:	64a2                	ld	s1,8(sp)
ffffffffc0203956:	6105                	addi	sp,sp,32
ffffffffc0203958:	8082                	ret
ffffffffc020395a:	00039717          	auipc	a4,0x39
ffffffffc020395e:	51e70713          	addi	a4,a4,1310 # ffffffffc023ce78 <npage>
ffffffffc0203962:	6318                	ld	a4,0(a4)
ffffffffc0203964:	078a                	slli	a5,a5,0x2
ffffffffc0203966:	83b1                	srli	a5,a5,0xc
ffffffffc0203968:	02e7fe63          	bgeu	a5,a4,ffffffffc02039a4 <page_remove+0x70>
ffffffffc020396c:	00039717          	auipc	a4,0x39
ffffffffc0203970:	65c70713          	addi	a4,a4,1628 # ffffffffc023cfc8 <pages>
ffffffffc0203974:	6308                	ld	a0,0(a4)
ffffffffc0203976:	fff80737          	lui	a4,0xfff80
ffffffffc020397a:	97ba                	add	a5,a5,a4
ffffffffc020397c:	079a                	slli	a5,a5,0x6
ffffffffc020397e:	953e                	add	a0,a0,a5
ffffffffc0203980:	411c                	lw	a5,0(a0)
ffffffffc0203982:	fff7871b          	addiw	a4,a5,-1
ffffffffc0203986:	c118                	sw	a4,0(a0)
ffffffffc0203988:	cb11                	beqz	a4,ffffffffc020399c <page_remove+0x68>
ffffffffc020398a:	00043023          	sd	zero,0(s0)
ffffffffc020398e:	12048073          	sfence.vma	s1
ffffffffc0203992:	60e2                	ld	ra,24(sp)
ffffffffc0203994:	6442                	ld	s0,16(sp)
ffffffffc0203996:	64a2                	ld	s1,8(sp)
ffffffffc0203998:	6105                	addi	sp,sp,32
ffffffffc020399a:	8082                	ret
ffffffffc020399c:	4585                	li	a1,1
ffffffffc020399e:	acfff0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc02039a2:	b7e5                	j	ffffffffc020398a <page_remove+0x56>
ffffffffc02039a4:	a25ff0ef          	jal	ra,ffffffffc02033c8 <pa2page.part.4>

ffffffffc02039a8 <page_insert>:
ffffffffc02039a8:	7179                	addi	sp,sp,-48
ffffffffc02039aa:	e44e                	sd	s3,8(sp)
ffffffffc02039ac:	89b2                	mv	s3,a2
ffffffffc02039ae:	f022                	sd	s0,32(sp)
ffffffffc02039b0:	4605                	li	a2,1
ffffffffc02039b2:	842e                	mv	s0,a1
ffffffffc02039b4:	85ce                	mv	a1,s3
ffffffffc02039b6:	ec26                	sd	s1,24(sp)
ffffffffc02039b8:	f406                	sd	ra,40(sp)
ffffffffc02039ba:	e84a                	sd	s2,16(sp)
ffffffffc02039bc:	e052                	sd	s4,0(sp)
ffffffffc02039be:	84b6                	mv	s1,a3
ffffffffc02039c0:	b33ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc02039c4:	cd49                	beqz	a0,ffffffffc0203a5e <page_insert+0xb6>
ffffffffc02039c6:	4014                	lw	a3,0(s0)
ffffffffc02039c8:	611c                	ld	a5,0(a0)
ffffffffc02039ca:	892a                	mv	s2,a0
ffffffffc02039cc:	0016871b          	addiw	a4,a3,1
ffffffffc02039d0:	c018                	sw	a4,0(s0)
ffffffffc02039d2:	0017f713          	andi	a4,a5,1
ffffffffc02039d6:	ef05                	bnez	a4,ffffffffc0203a0e <page_insert+0x66>
ffffffffc02039d8:	00039797          	auipc	a5,0x39
ffffffffc02039dc:	5f078793          	addi	a5,a5,1520 # ffffffffc023cfc8 <pages>
ffffffffc02039e0:	6398                	ld	a4,0(a5)
ffffffffc02039e2:	8c19                	sub	s0,s0,a4
ffffffffc02039e4:	000806b7          	lui	a3,0x80
ffffffffc02039e8:	8419                	srai	s0,s0,0x6
ffffffffc02039ea:	9436                	add	s0,s0,a3
ffffffffc02039ec:	042a                	slli	s0,s0,0xa
ffffffffc02039ee:	8c45                	or	s0,s0,s1
ffffffffc02039f0:	00146413          	ori	s0,s0,1
ffffffffc02039f4:	00893023          	sd	s0,0(s2) # fffffffffff80000 <end+0x3fd43020>
ffffffffc02039f8:	12098073          	sfence.vma	s3
ffffffffc02039fc:	4501                	li	a0,0
ffffffffc02039fe:	70a2                	ld	ra,40(sp)
ffffffffc0203a00:	7402                	ld	s0,32(sp)
ffffffffc0203a02:	64e2                	ld	s1,24(sp)
ffffffffc0203a04:	6942                	ld	s2,16(sp)
ffffffffc0203a06:	69a2                	ld	s3,8(sp)
ffffffffc0203a08:	6a02                	ld	s4,0(sp)
ffffffffc0203a0a:	6145                	addi	sp,sp,48
ffffffffc0203a0c:	8082                	ret
ffffffffc0203a0e:	00039717          	auipc	a4,0x39
ffffffffc0203a12:	46a70713          	addi	a4,a4,1130 # ffffffffc023ce78 <npage>
ffffffffc0203a16:	6318                	ld	a4,0(a4)
ffffffffc0203a18:	078a                	slli	a5,a5,0x2
ffffffffc0203a1a:	83b1                	srli	a5,a5,0xc
ffffffffc0203a1c:	04e7f363          	bgeu	a5,a4,ffffffffc0203a62 <page_insert+0xba>
ffffffffc0203a20:	00039a17          	auipc	s4,0x39
ffffffffc0203a24:	5a8a0a13          	addi	s4,s4,1448 # ffffffffc023cfc8 <pages>
ffffffffc0203a28:	000a3703          	ld	a4,0(s4)
ffffffffc0203a2c:	fff80537          	lui	a0,0xfff80
ffffffffc0203a30:	953e                	add	a0,a0,a5
ffffffffc0203a32:	051a                	slli	a0,a0,0x6
ffffffffc0203a34:	953a                	add	a0,a0,a4
ffffffffc0203a36:	00a40a63          	beq	s0,a0,ffffffffc0203a4a <page_insert+0xa2>
ffffffffc0203a3a:	411c                	lw	a5,0(a0)
ffffffffc0203a3c:	fff7869b          	addiw	a3,a5,-1
ffffffffc0203a40:	c114                	sw	a3,0(a0)
ffffffffc0203a42:	c691                	beqz	a3,ffffffffc0203a4e <page_insert+0xa6>
ffffffffc0203a44:	12098073          	sfence.vma	s3
ffffffffc0203a48:	bf69                	j	ffffffffc02039e2 <page_insert+0x3a>
ffffffffc0203a4a:	c014                	sw	a3,0(s0)
ffffffffc0203a4c:	bf59                	j	ffffffffc02039e2 <page_insert+0x3a>
ffffffffc0203a4e:	4585                	li	a1,1
ffffffffc0203a50:	a1dff0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0203a54:	000a3703          	ld	a4,0(s4)
ffffffffc0203a58:	12098073          	sfence.vma	s3
ffffffffc0203a5c:	b759                	j	ffffffffc02039e2 <page_insert+0x3a>
ffffffffc0203a5e:	5571                	li	a0,-4
ffffffffc0203a60:	bf79                	j	ffffffffc02039fe <page_insert+0x56>
ffffffffc0203a62:	967ff0ef          	jal	ra,ffffffffc02033c8 <pa2page.part.4>

ffffffffc0203a66 <pmm_init>:
ffffffffc0203a66:	00007797          	auipc	a5,0x7
ffffffffc0203a6a:	99a78793          	addi	a5,a5,-1638 # ffffffffc020a400 <default_pmm_manager>
ffffffffc0203a6e:	638c                	ld	a1,0(a5)
ffffffffc0203a70:	7139                	addi	sp,sp,-64
ffffffffc0203a72:	00007517          	auipc	a0,0x7
ffffffffc0203a76:	a3650513          	addi	a0,a0,-1482 # ffffffffc020a4a8 <default_pmm_manager+0xa8>
ffffffffc0203a7a:	fc06                	sd	ra,56(sp)
ffffffffc0203a7c:	00039717          	auipc	a4,0x39
ffffffffc0203a80:	52f73a23          	sd	a5,1332(a4) # ffffffffc023cfb0 <pmm_manager>
ffffffffc0203a84:	f822                	sd	s0,48(sp)
ffffffffc0203a86:	f426                	sd	s1,40(sp)
ffffffffc0203a88:	f04a                	sd	s2,32(sp)
ffffffffc0203a8a:	ec4e                	sd	s3,24(sp)
ffffffffc0203a8c:	e852                	sd	s4,16(sp)
ffffffffc0203a8e:	e456                	sd	s5,8(sp)
ffffffffc0203a90:	e05a                	sd	s6,0(sp)
ffffffffc0203a92:	00039417          	auipc	s0,0x39
ffffffffc0203a96:	51e40413          	addi	s0,s0,1310 # ffffffffc023cfb0 <pmm_manager>
ffffffffc0203a9a:	e3afc0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0203a9e:	601c                	ld	a5,0(s0)
ffffffffc0203aa0:	00039497          	auipc	s1,0x39
ffffffffc0203aa4:	3d848493          	addi	s1,s1,984 # ffffffffc023ce78 <npage>
ffffffffc0203aa8:	00039917          	auipc	s2,0x39
ffffffffc0203aac:	52090913          	addi	s2,s2,1312 # ffffffffc023cfc8 <pages>
ffffffffc0203ab0:	679c                	ld	a5,8(a5)
ffffffffc0203ab2:	9782                	jalr	a5
ffffffffc0203ab4:	57f5                	li	a5,-3
ffffffffc0203ab6:	07fa                	slli	a5,a5,0x1e
ffffffffc0203ab8:	00007517          	auipc	a0,0x7
ffffffffc0203abc:	a0850513          	addi	a0,a0,-1528 # ffffffffc020a4c0 <default_pmm_manager+0xc0>
ffffffffc0203ac0:	00039717          	auipc	a4,0x39
ffffffffc0203ac4:	4ef73c23          	sd	a5,1272(a4) # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0203ac8:	e0cfc0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0203acc:	44300693          	li	a3,1091
ffffffffc0203ad0:	06d6                	slli	a3,a3,0x15
ffffffffc0203ad2:	40100613          	li	a2,1025
ffffffffc0203ad6:	16fd                	addi	a3,a3,-1
ffffffffc0203ad8:	0656                	slli	a2,a2,0x15
ffffffffc0203ada:	088005b7          	lui	a1,0x8800
ffffffffc0203ade:	00007517          	auipc	a0,0x7
ffffffffc0203ae2:	9fa50513          	addi	a0,a0,-1542 # ffffffffc020a4d8 <default_pmm_manager+0xd8>
ffffffffc0203ae6:	deefc0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0203aea:	777d                	lui	a4,0xfffff
ffffffffc0203aec:	0003a797          	auipc	a5,0x3a
ffffffffc0203af0:	4f378793          	addi	a5,a5,1267 # ffffffffc023dfdf <end+0xfff>
ffffffffc0203af4:	8ff9                	and	a5,a5,a4
ffffffffc0203af6:	00088737          	lui	a4,0x88
ffffffffc0203afa:	60070713          	addi	a4,a4,1536 # 88600 <_binary_obj___user_matrix_out_size+0x85cc8>
ffffffffc0203afe:	00039697          	auipc	a3,0x39
ffffffffc0203b02:	36e6bd23          	sd	a4,890(a3) # ffffffffc023ce78 <npage>
ffffffffc0203b06:	00039717          	auipc	a4,0x39
ffffffffc0203b0a:	4cf73123          	sd	a5,1218(a4) # ffffffffc023cfc8 <pages>
ffffffffc0203b0e:	4701                	li	a4,0
ffffffffc0203b10:	4685                	li	a3,1
ffffffffc0203b12:	fff80837          	lui	a6,0xfff80
ffffffffc0203b16:	a019                	j	ffffffffc0203b1c <pmm_init+0xb6>
ffffffffc0203b18:	00093783          	ld	a5,0(s2)
ffffffffc0203b1c:	00671613          	slli	a2,a4,0x6
ffffffffc0203b20:	97b2                	add	a5,a5,a2
ffffffffc0203b22:	07a1                	addi	a5,a5,8
ffffffffc0203b24:	40d7b02f          	amoor.d	zero,a3,(a5)
ffffffffc0203b28:	6090                	ld	a2,0(s1)
ffffffffc0203b2a:	0705                	addi	a4,a4,1
ffffffffc0203b2c:	010607b3          	add	a5,a2,a6
ffffffffc0203b30:	fef764e3          	bltu	a4,a5,ffffffffc0203b18 <pmm_init+0xb2>
ffffffffc0203b34:	00093503          	ld	a0,0(s2)
ffffffffc0203b38:	fe0007b7          	lui	a5,0xfe000
ffffffffc0203b3c:	00661693          	slli	a3,a2,0x6
ffffffffc0203b40:	97aa                	add	a5,a5,a0
ffffffffc0203b42:	96be                	add	a3,a3,a5
ffffffffc0203b44:	c02007b7          	lui	a5,0xc0200
ffffffffc0203b48:	72f6e563          	bltu	a3,a5,ffffffffc0204272 <pmm_init+0x80c>
ffffffffc0203b4c:	00039997          	auipc	s3,0x39
ffffffffc0203b50:	46c98993          	addi	s3,s3,1132 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0203b54:	0009b583          	ld	a1,0(s3)
ffffffffc0203b58:	44300793          	li	a5,1091
ffffffffc0203b5c:	07d6                	slli	a5,a5,0x15
ffffffffc0203b5e:	8e8d                	sub	a3,a3,a1
ffffffffc0203b60:	02f6f763          	bgeu	a3,a5,ffffffffc0203b8e <pmm_init+0x128>
ffffffffc0203b64:	6585                	lui	a1,0x1
ffffffffc0203b66:	15fd                	addi	a1,a1,-1
ffffffffc0203b68:	96ae                	add	a3,a3,a1
ffffffffc0203b6a:	00c6d713          	srli	a4,a3,0xc
ffffffffc0203b6e:	3cc77763          	bgeu	a4,a2,ffffffffc0203f3c <pmm_init+0x4d6>
ffffffffc0203b72:	6010                	ld	a2,0(s0)
ffffffffc0203b74:	75fd                	lui	a1,0xfffff
ffffffffc0203b76:	8eed                	and	a3,a3,a1
ffffffffc0203b78:	9742                	add	a4,a4,a6
ffffffffc0203b7a:	6a10                	ld	a2,16(a2)
ffffffffc0203b7c:	40d786b3          	sub	a3,a5,a3
ffffffffc0203b80:	071a                	slli	a4,a4,0x6
ffffffffc0203b82:	00c6d593          	srli	a1,a3,0xc
ffffffffc0203b86:	953a                	add	a0,a0,a4
ffffffffc0203b88:	9602                	jalr	a2
ffffffffc0203b8a:	0009b583          	ld	a1,0(s3)
ffffffffc0203b8e:	00007517          	auipc	a0,0x7
ffffffffc0203b92:	97250513          	addi	a0,a0,-1678 # ffffffffc020a500 <default_pmm_manager+0x100>
ffffffffc0203b96:	d3efc0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0203b9a:	601c                	ld	a5,0(s0)
ffffffffc0203b9c:	00039417          	auipc	s0,0x39
ffffffffc0203ba0:	2d440413          	addi	s0,s0,724 # ffffffffc023ce70 <boot_pgdir>
ffffffffc0203ba4:	7b9c                	ld	a5,48(a5)
ffffffffc0203ba6:	9782                	jalr	a5
ffffffffc0203ba8:	00007517          	auipc	a0,0x7
ffffffffc0203bac:	97050513          	addi	a0,a0,-1680 # ffffffffc020a518 <default_pmm_manager+0x118>
ffffffffc0203bb0:	d24fc0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0203bb4:	0000a517          	auipc	a0,0xa
ffffffffc0203bb8:	44c50513          	addi	a0,a0,1100 # ffffffffc020e000 <boot_page_table_sv39>
ffffffffc0203bbc:	00039797          	auipc	a5,0x39
ffffffffc0203bc0:	2aa7ba23          	sd	a0,692(a5) # ffffffffc023ce70 <boot_pgdir>
ffffffffc0203bc4:	c02007b7          	lui	a5,0xc0200
ffffffffc0203bc8:	68f56863          	bltu	a0,a5,ffffffffc0204258 <pmm_init+0x7f2>
ffffffffc0203bcc:	0009b783          	ld	a5,0(s3)
ffffffffc0203bd0:	6098                	ld	a4,0(s1)
ffffffffc0203bd2:	40f507b3          	sub	a5,a0,a5
ffffffffc0203bd6:	00039697          	auipc	a3,0x39
ffffffffc0203bda:	3ef6b523          	sd	a5,1002(a3) # ffffffffc023cfc0 <boot_cr3>
ffffffffc0203bde:	c80007b7          	lui	a5,0xc8000
ffffffffc0203be2:	83b1                	srli	a5,a5,0xc
ffffffffc0203be4:	70e7e363          	bltu	a5,a4,ffffffffc02042ea <pmm_init+0x884>
ffffffffc0203be8:	03451793          	slli	a5,a0,0x34
ffffffffc0203bec:	34079a63          	bnez	a5,ffffffffc0203f40 <pmm_init+0x4da>
ffffffffc0203bf0:	4601                	li	a2,0
ffffffffc0203bf2:	4581                	li	a1,0
ffffffffc0203bf4:	ad1ff0ef          	jal	ra,ffffffffc02036c4 <get_page>
ffffffffc0203bf8:	74051963          	bnez	a0,ffffffffc020434a <pmm_init+0x8e4>
ffffffffc0203bfc:	4505                	li	a0,1
ffffffffc0203bfe:	fe6ff0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0203c02:	8a2a                	mv	s4,a0
ffffffffc0203c04:	6008                	ld	a0,0(s0)
ffffffffc0203c06:	4681                	li	a3,0
ffffffffc0203c08:	4601                	li	a2,0
ffffffffc0203c0a:	85d2                	mv	a1,s4
ffffffffc0203c0c:	d9dff0ef          	jal	ra,ffffffffc02039a8 <page_insert>
ffffffffc0203c10:	70051d63          	bnez	a0,ffffffffc020432a <pmm_init+0x8c4>
ffffffffc0203c14:	6008                	ld	a0,0(s0)
ffffffffc0203c16:	4601                	li	a2,0
ffffffffc0203c18:	4581                	li	a1,0
ffffffffc0203c1a:	8d9ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0203c1e:	6e050663          	beqz	a0,ffffffffc020430a <pmm_init+0x8a4>
ffffffffc0203c22:	611c                	ld	a5,0(a0)
ffffffffc0203c24:	0017f713          	andi	a4,a5,1
ffffffffc0203c28:	32070c63          	beqz	a4,ffffffffc0203f60 <pmm_init+0x4fa>
ffffffffc0203c2c:	6098                	ld	a4,0(s1)
ffffffffc0203c2e:	078a                	slli	a5,a5,0x2
ffffffffc0203c30:	83b1                	srli	a5,a5,0xc
ffffffffc0203c32:	30e7f563          	bgeu	a5,a4,ffffffffc0203f3c <pmm_init+0x4d6>
ffffffffc0203c36:	00093683          	ld	a3,0(s2)
ffffffffc0203c3a:	fff80637          	lui	a2,0xfff80
ffffffffc0203c3e:	97b2                	add	a5,a5,a2
ffffffffc0203c40:	079a                	slli	a5,a5,0x6
ffffffffc0203c42:	97b6                	add	a5,a5,a3
ffffffffc0203c44:	34fa1a63          	bne	s4,a5,ffffffffc0203f98 <pmm_init+0x532>
ffffffffc0203c48:	000a2683          	lw	a3,0(s4)
ffffffffc0203c4c:	4785                	li	a5,1
ffffffffc0203c4e:	32f69563          	bne	a3,a5,ffffffffc0203f78 <pmm_init+0x512>
ffffffffc0203c52:	6008                	ld	a0,0(s0)
ffffffffc0203c54:	76fd                	lui	a3,0xfffff
ffffffffc0203c56:	611c                	ld	a5,0(a0)
ffffffffc0203c58:	078a                	slli	a5,a5,0x2
ffffffffc0203c5a:	8ff5                	and	a5,a5,a3
ffffffffc0203c5c:	00c7d613          	srli	a2,a5,0xc
ffffffffc0203c60:	72e67263          	bgeu	a2,a4,ffffffffc0204384 <pmm_init+0x91e>
ffffffffc0203c64:	0009bb03          	ld	s6,0(s3)
ffffffffc0203c68:	97da                	add	a5,a5,s6
ffffffffc0203c6a:	0007ba83          	ld	s5,0(a5) # ffffffffc8000000 <end+0x7dc3020>
ffffffffc0203c6e:	0a8a                	slli	s5,s5,0x2
ffffffffc0203c70:	00dafab3          	and	s5,s5,a3
ffffffffc0203c74:	00cad793          	srli	a5,s5,0xc
ffffffffc0203c78:	6ee7f963          	bgeu	a5,a4,ffffffffc020436a <pmm_init+0x904>
ffffffffc0203c7c:	4601                	li	a2,0
ffffffffc0203c7e:	6585                	lui	a1,0x1
ffffffffc0203c80:	9ada                	add	s5,s5,s6
ffffffffc0203c82:	871ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0203c86:	0aa1                	addi	s5,s5,8
ffffffffc0203c88:	45551863          	bne	a0,s5,ffffffffc02040d8 <pmm_init+0x672>
ffffffffc0203c8c:	4505                	li	a0,1
ffffffffc0203c8e:	f56ff0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0203c92:	8aaa                	mv	s5,a0
ffffffffc0203c94:	6008                	ld	a0,0(s0)
ffffffffc0203c96:	46d1                	li	a3,20
ffffffffc0203c98:	6605                	lui	a2,0x1
ffffffffc0203c9a:	85d6                	mv	a1,s5
ffffffffc0203c9c:	d0dff0ef          	jal	ra,ffffffffc02039a8 <page_insert>
ffffffffc0203ca0:	40051c63          	bnez	a0,ffffffffc02040b8 <pmm_init+0x652>
ffffffffc0203ca4:	6008                	ld	a0,0(s0)
ffffffffc0203ca6:	4601                	li	a2,0
ffffffffc0203ca8:	6585                	lui	a1,0x1
ffffffffc0203caa:	849ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0203cae:	3e050563          	beqz	a0,ffffffffc0204098 <pmm_init+0x632>
ffffffffc0203cb2:	611c                	ld	a5,0(a0)
ffffffffc0203cb4:	0107f713          	andi	a4,a5,16
ffffffffc0203cb8:	3c070063          	beqz	a4,ffffffffc0204078 <pmm_init+0x612>
ffffffffc0203cbc:	8b91                	andi	a5,a5,4
ffffffffc0203cbe:	38078d63          	beqz	a5,ffffffffc0204058 <pmm_init+0x5f2>
ffffffffc0203cc2:	6008                	ld	a0,0(s0)
ffffffffc0203cc4:	611c                	ld	a5,0(a0)
ffffffffc0203cc6:	8bc1                	andi	a5,a5,16
ffffffffc0203cc8:	36078863          	beqz	a5,ffffffffc0204038 <pmm_init+0x5d2>
ffffffffc0203ccc:	000aa703          	lw	a4,0(s5) # 200000 <_binary_obj___user_matrix_out_size+0x1fd6c8>
ffffffffc0203cd0:	4785                	li	a5,1
ffffffffc0203cd2:	34f71363          	bne	a4,a5,ffffffffc0204018 <pmm_init+0x5b2>
ffffffffc0203cd6:	4681                	li	a3,0
ffffffffc0203cd8:	6605                	lui	a2,0x1
ffffffffc0203cda:	85d2                	mv	a1,s4
ffffffffc0203cdc:	ccdff0ef          	jal	ra,ffffffffc02039a8 <page_insert>
ffffffffc0203ce0:	30051c63          	bnez	a0,ffffffffc0203ff8 <pmm_init+0x592>
ffffffffc0203ce4:	000a2703          	lw	a4,0(s4)
ffffffffc0203ce8:	4789                	li	a5,2
ffffffffc0203cea:	2ef71763          	bne	a4,a5,ffffffffc0203fd8 <pmm_init+0x572>
ffffffffc0203cee:	000aa783          	lw	a5,0(s5)
ffffffffc0203cf2:	2c079363          	bnez	a5,ffffffffc0203fb8 <pmm_init+0x552>
ffffffffc0203cf6:	6008                	ld	a0,0(s0)
ffffffffc0203cf8:	4601                	li	a2,0
ffffffffc0203cfa:	6585                	lui	a1,0x1
ffffffffc0203cfc:	ff6ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0203d00:	48050c63          	beqz	a0,ffffffffc0204198 <pmm_init+0x732>
ffffffffc0203d04:	6118                	ld	a4,0(a0)
ffffffffc0203d06:	00177793          	andi	a5,a4,1
ffffffffc0203d0a:	24078b63          	beqz	a5,ffffffffc0203f60 <pmm_init+0x4fa>
ffffffffc0203d0e:	6094                	ld	a3,0(s1)
ffffffffc0203d10:	00271793          	slli	a5,a4,0x2
ffffffffc0203d14:	83b1                	srli	a5,a5,0xc
ffffffffc0203d16:	22d7f363          	bgeu	a5,a3,ffffffffc0203f3c <pmm_init+0x4d6>
ffffffffc0203d1a:	00093683          	ld	a3,0(s2)
ffffffffc0203d1e:	fff80637          	lui	a2,0xfff80
ffffffffc0203d22:	97b2                	add	a5,a5,a2
ffffffffc0203d24:	079a                	slli	a5,a5,0x6
ffffffffc0203d26:	97b6                	add	a5,a5,a3
ffffffffc0203d28:	44fa1863          	bne	s4,a5,ffffffffc0204178 <pmm_init+0x712>
ffffffffc0203d2c:	8b41                	andi	a4,a4,16
ffffffffc0203d2e:	42071563          	bnez	a4,ffffffffc0204158 <pmm_init+0x6f2>
ffffffffc0203d32:	6008                	ld	a0,0(s0)
ffffffffc0203d34:	4581                	li	a1,0
ffffffffc0203d36:	bffff0ef          	jal	ra,ffffffffc0203934 <page_remove>
ffffffffc0203d3a:	000a2703          	lw	a4,0(s4)
ffffffffc0203d3e:	4785                	li	a5,1
ffffffffc0203d40:	3ef71c63          	bne	a4,a5,ffffffffc0204138 <pmm_init+0x6d2>
ffffffffc0203d44:	000aa783          	lw	a5,0(s5)
ffffffffc0203d48:	3c079863          	bnez	a5,ffffffffc0204118 <pmm_init+0x6b2>
ffffffffc0203d4c:	6008                	ld	a0,0(s0)
ffffffffc0203d4e:	6585                	lui	a1,0x1
ffffffffc0203d50:	be5ff0ef          	jal	ra,ffffffffc0203934 <page_remove>
ffffffffc0203d54:	000a2783          	lw	a5,0(s4)
ffffffffc0203d58:	3a079063          	bnez	a5,ffffffffc02040f8 <pmm_init+0x692>
ffffffffc0203d5c:	000aa783          	lw	a5,0(s5)
ffffffffc0203d60:	4a079c63          	bnez	a5,ffffffffc0204218 <pmm_init+0x7b2>
ffffffffc0203d64:	601c                	ld	a5,0(s0)
ffffffffc0203d66:	6098                	ld	a4,0(s1)
ffffffffc0203d68:	639c                	ld	a5,0(a5)
ffffffffc0203d6a:	078a                	slli	a5,a5,0x2
ffffffffc0203d6c:	83b1                	srli	a5,a5,0xc
ffffffffc0203d6e:	1ce7f763          	bgeu	a5,a4,ffffffffc0203f3c <pmm_init+0x4d6>
ffffffffc0203d72:	fff80737          	lui	a4,0xfff80
ffffffffc0203d76:	00093503          	ld	a0,0(s2)
ffffffffc0203d7a:	97ba                	add	a5,a5,a4
ffffffffc0203d7c:	079a                	slli	a5,a5,0x6
ffffffffc0203d7e:	953e                	add	a0,a0,a5
ffffffffc0203d80:	4118                	lw	a4,0(a0)
ffffffffc0203d82:	4785                	li	a5,1
ffffffffc0203d84:	46f71a63          	bne	a4,a5,ffffffffc02041f8 <pmm_init+0x792>
ffffffffc0203d88:	4585                	li	a1,1
ffffffffc0203d8a:	ee2ff0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0203d8e:	601c                	ld	a5,0(s0)
ffffffffc0203d90:	00007517          	auipc	a0,0x7
ffffffffc0203d94:	a5050513          	addi	a0,a0,-1456 # ffffffffc020a7e0 <default_pmm_manager+0x3e0>
ffffffffc0203d98:	0007b023          	sd	zero,0(a5)
ffffffffc0203d9c:	b38fc0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0203da0:	6098                	ld	a4,0(s1)
ffffffffc0203da2:	c02007b7          	lui	a5,0xc0200
ffffffffc0203da6:	00c71693          	slli	a3,a4,0xc
ffffffffc0203daa:	12d7fa63          	bgeu	a5,a3,ffffffffc0203ede <pmm_init+0x478>
ffffffffc0203dae:	83b1                	srli	a5,a5,0xc
ffffffffc0203db0:	6008                	ld	a0,0(s0)
ffffffffc0203db2:	c0200a37          	lui	s4,0xc0200
ffffffffc0203db6:	16e7f663          	bgeu	a5,a4,ffffffffc0203f22 <pmm_init+0x4bc>
ffffffffc0203dba:	7b7d                	lui	s6,0xfffff
ffffffffc0203dbc:	6a85                	lui	s5,0x1
ffffffffc0203dbe:	a029                	j	ffffffffc0203dc8 <pmm_init+0x362>
ffffffffc0203dc0:	00ca5713          	srli	a4,s4,0xc
ffffffffc0203dc4:	14f77f63          	bgeu	a4,a5,ffffffffc0203f22 <pmm_init+0x4bc>
ffffffffc0203dc8:	0009b583          	ld	a1,0(s3)
ffffffffc0203dcc:	4601                	li	a2,0
ffffffffc0203dce:	95d2                	add	a1,a1,s4
ffffffffc0203dd0:	f22ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0203dd4:	12050763          	beqz	a0,ffffffffc0203f02 <pmm_init+0x49c>
ffffffffc0203dd8:	611c                	ld	a5,0(a0)
ffffffffc0203dda:	078a                	slli	a5,a5,0x2
ffffffffc0203ddc:	0167f7b3          	and	a5,a5,s6
ffffffffc0203de0:	11479163          	bne	a5,s4,ffffffffc0203ee2 <pmm_init+0x47c>
ffffffffc0203de4:	609c                	ld	a5,0(s1)
ffffffffc0203de6:	9a56                	add	s4,s4,s5
ffffffffc0203de8:	6008                	ld	a0,0(s0)
ffffffffc0203dea:	00c79713          	slli	a4,a5,0xc
ffffffffc0203dee:	fcea69e3          	bltu	s4,a4,ffffffffc0203dc0 <pmm_init+0x35a>
ffffffffc0203df2:	611c                	ld	a5,0(a0)
ffffffffc0203df4:	44079263          	bnez	a5,ffffffffc0204238 <pmm_init+0x7d2>
ffffffffc0203df8:	4505                	li	a0,1
ffffffffc0203dfa:	deaff0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0203dfe:	8aaa                	mv	s5,a0
ffffffffc0203e00:	6008                	ld	a0,0(s0)
ffffffffc0203e02:	4699                	li	a3,6
ffffffffc0203e04:	10000613          	li	a2,256
ffffffffc0203e08:	85d6                	mv	a1,s5
ffffffffc0203e0a:	b9fff0ef          	jal	ra,ffffffffc02039a8 <page_insert>
ffffffffc0203e0e:	4a051e63          	bnez	a0,ffffffffc02042ca <pmm_init+0x864>
ffffffffc0203e12:	000aa703          	lw	a4,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc0203e16:	4785                	li	a5,1
ffffffffc0203e18:	48f71963          	bne	a4,a5,ffffffffc02042aa <pmm_init+0x844>
ffffffffc0203e1c:	6008                	ld	a0,0(s0)
ffffffffc0203e1e:	6a05                	lui	s4,0x1
ffffffffc0203e20:	4699                	li	a3,6
ffffffffc0203e22:	100a0613          	addi	a2,s4,256 # 1100 <_binary_obj___user_faultread_out_size-0xc58>
ffffffffc0203e26:	85d6                	mv	a1,s5
ffffffffc0203e28:	b81ff0ef          	jal	ra,ffffffffc02039a8 <page_insert>
ffffffffc0203e2c:	3a051663          	bnez	a0,ffffffffc02041d8 <pmm_init+0x772>
ffffffffc0203e30:	000aa703          	lw	a4,0(s5)
ffffffffc0203e34:	4789                	li	a5,2
ffffffffc0203e36:	38f71163          	bne	a4,a5,ffffffffc02041b8 <pmm_init+0x752>
ffffffffc0203e3a:	00007597          	auipc	a1,0x7
ffffffffc0203e3e:	ade58593          	addi	a1,a1,-1314 # ffffffffc020a918 <default_pmm_manager+0x518>
ffffffffc0203e42:	10000513          	li	a0,256
ffffffffc0203e46:	1c5040ef          	jal	ra,ffffffffc020880a <strcpy>
ffffffffc0203e4a:	100a0593          	addi	a1,s4,256
ffffffffc0203e4e:	10000513          	li	a0,256
ffffffffc0203e52:	1cb040ef          	jal	ra,ffffffffc020881c <strcmp>
ffffffffc0203e56:	56051063          	bnez	a0,ffffffffc02043b6 <pmm_init+0x950>
ffffffffc0203e5a:	00093683          	ld	a3,0(s2)
ffffffffc0203e5e:	00080a37          	lui	s4,0x80
ffffffffc0203e62:	6098                	ld	a4,0(s1)
ffffffffc0203e64:	40da86b3          	sub	a3,s5,a3
ffffffffc0203e68:	8699                	srai	a3,a3,0x6
ffffffffc0203e6a:	96d2                	add	a3,a3,s4
ffffffffc0203e6c:	00c69793          	slli	a5,a3,0xc
ffffffffc0203e70:	83b1                	srli	a5,a5,0xc
ffffffffc0203e72:	06b2                	slli	a3,a3,0xc
ffffffffc0203e74:	52e7f563          	bgeu	a5,a4,ffffffffc020439e <pmm_init+0x938>
ffffffffc0203e78:	0009b783          	ld	a5,0(s3)
ffffffffc0203e7c:	10000513          	li	a0,256
ffffffffc0203e80:	96be                	add	a3,a3,a5
ffffffffc0203e82:	10068023          	sb	zero,256(a3) # fffffffffffff100 <end+0x3fdc2120>
ffffffffc0203e86:	141040ef          	jal	ra,ffffffffc02087c6 <strlen>
ffffffffc0203e8a:	40051063          	bnez	a0,ffffffffc020428a <pmm_init+0x824>
ffffffffc0203e8e:	4585                	li	a1,1
ffffffffc0203e90:	8556                	mv	a0,s5
ffffffffc0203e92:	ddaff0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0203e96:	601c                	ld	a5,0(s0)
ffffffffc0203e98:	6098                	ld	a4,0(s1)
ffffffffc0203e9a:	639c                	ld	a5,0(a5)
ffffffffc0203e9c:	078a                	slli	a5,a5,0x2
ffffffffc0203e9e:	83b1                	srli	a5,a5,0xc
ffffffffc0203ea0:	08e7fe63          	bgeu	a5,a4,ffffffffc0203f3c <pmm_init+0x4d6>
ffffffffc0203ea4:	00093503          	ld	a0,0(s2)
ffffffffc0203ea8:	414787b3          	sub	a5,a5,s4
ffffffffc0203eac:	079a                	slli	a5,a5,0x6
ffffffffc0203eae:	953e                	add	a0,a0,a5
ffffffffc0203eb0:	4585                	li	a1,1
ffffffffc0203eb2:	dbaff0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0203eb6:	601c                	ld	a5,0(s0)
ffffffffc0203eb8:	00007517          	auipc	a0,0x7
ffffffffc0203ebc:	ad850513          	addi	a0,a0,-1320 # ffffffffc020a990 <default_pmm_manager+0x590>
ffffffffc0203ec0:	0007b023          	sd	zero,0(a5) # ffffffffc0200000 <kern_entry>
ffffffffc0203ec4:	a10fc0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0203ec8:	7442                	ld	s0,48(sp)
ffffffffc0203eca:	70e2                	ld	ra,56(sp)
ffffffffc0203ecc:	74a2                	ld	s1,40(sp)
ffffffffc0203ece:	7902                	ld	s2,32(sp)
ffffffffc0203ed0:	69e2                	ld	s3,24(sp)
ffffffffc0203ed2:	6a42                	ld	s4,16(sp)
ffffffffc0203ed4:	6aa2                	ld	s5,8(sp)
ffffffffc0203ed6:	6b02                	ld	s6,0(sp)
ffffffffc0203ed8:	6121                	addi	sp,sp,64
ffffffffc0203eda:	f17fd06f          	j	ffffffffc0201df0 <kmalloc_init>
ffffffffc0203ede:	6008                	ld	a0,0(s0)
ffffffffc0203ee0:	bf09                	j	ffffffffc0203df2 <pmm_init+0x38c>
ffffffffc0203ee2:	00007697          	auipc	a3,0x7
ffffffffc0203ee6:	95e68693          	addi	a3,a3,-1698 # ffffffffc020a840 <default_pmm_manager+0x440>
ffffffffc0203eea:	00005617          	auipc	a2,0x5
ffffffffc0203eee:	39e60613          	addi	a2,a2,926 # ffffffffc0209288 <commands+0x480>
ffffffffc0203ef2:	22700593          	li	a1,551
ffffffffc0203ef6:	00006517          	auipc	a0,0x6
ffffffffc0203efa:	58a50513          	addi	a0,a0,1418 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203efe:	b1afc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203f02:	00007697          	auipc	a3,0x7
ffffffffc0203f06:	8fe68693          	addi	a3,a3,-1794 # ffffffffc020a800 <default_pmm_manager+0x400>
ffffffffc0203f0a:	00005617          	auipc	a2,0x5
ffffffffc0203f0e:	37e60613          	addi	a2,a2,894 # ffffffffc0209288 <commands+0x480>
ffffffffc0203f12:	22600593          	li	a1,550
ffffffffc0203f16:	00006517          	auipc	a0,0x6
ffffffffc0203f1a:	56a50513          	addi	a0,a0,1386 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203f1e:	afafc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203f22:	86d2                	mv	a3,s4
ffffffffc0203f24:	00006617          	auipc	a2,0x6
ffffffffc0203f28:	d0c60613          	addi	a2,a2,-756 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0203f2c:	22600593          	li	a1,550
ffffffffc0203f30:	00006517          	auipc	a0,0x6
ffffffffc0203f34:	55050513          	addi	a0,a0,1360 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203f38:	ae0fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203f3c:	c8cff0ef          	jal	ra,ffffffffc02033c8 <pa2page.part.4>
ffffffffc0203f40:	00006697          	auipc	a3,0x6
ffffffffc0203f44:	61868693          	addi	a3,a3,1560 # ffffffffc020a558 <default_pmm_manager+0x158>
ffffffffc0203f48:	00005617          	auipc	a2,0x5
ffffffffc0203f4c:	34060613          	addi	a2,a2,832 # ffffffffc0209288 <commands+0x480>
ffffffffc0203f50:	1f400593          	li	a1,500
ffffffffc0203f54:	00006517          	auipc	a0,0x6
ffffffffc0203f58:	52c50513          	addi	a0,a0,1324 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203f5c:	abcfc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203f60:	00006617          	auipc	a2,0x6
ffffffffc0203f64:	ff060613          	addi	a2,a2,-16 # ffffffffc0209f50 <commands+0x1148>
ffffffffc0203f68:	07400593          	li	a1,116
ffffffffc0203f6c:	00006517          	auipc	a0,0x6
ffffffffc0203f70:	a6450513          	addi	a0,a0,-1436 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0203f74:	aa4fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203f78:	00006697          	auipc	a3,0x6
ffffffffc0203f7c:	6b868693          	addi	a3,a3,1720 # ffffffffc020a630 <default_pmm_manager+0x230>
ffffffffc0203f80:	00005617          	auipc	a2,0x5
ffffffffc0203f84:	30860613          	addi	a2,a2,776 # ffffffffc0209288 <commands+0x480>
ffffffffc0203f88:	1fe00593          	li	a1,510
ffffffffc0203f8c:	00006517          	auipc	a0,0x6
ffffffffc0203f90:	4f450513          	addi	a0,a0,1268 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203f94:	a84fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203f98:	00006697          	auipc	a3,0x6
ffffffffc0203f9c:	68068693          	addi	a3,a3,1664 # ffffffffc020a618 <default_pmm_manager+0x218>
ffffffffc0203fa0:	00005617          	auipc	a2,0x5
ffffffffc0203fa4:	2e860613          	addi	a2,a2,744 # ffffffffc0209288 <commands+0x480>
ffffffffc0203fa8:	1fd00593          	li	a1,509
ffffffffc0203fac:	00006517          	auipc	a0,0x6
ffffffffc0203fb0:	4d450513          	addi	a0,a0,1236 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203fb4:	a64fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203fb8:	00006697          	auipc	a3,0x6
ffffffffc0203fbc:	7b868693          	addi	a3,a3,1976 # ffffffffc020a770 <default_pmm_manager+0x370>
ffffffffc0203fc0:	00005617          	auipc	a2,0x5
ffffffffc0203fc4:	2c860613          	addi	a2,a2,712 # ffffffffc0209288 <commands+0x480>
ffffffffc0203fc8:	20e00593          	li	a1,526
ffffffffc0203fcc:	00006517          	auipc	a0,0x6
ffffffffc0203fd0:	4b450513          	addi	a0,a0,1204 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203fd4:	a44fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203fd8:	00006697          	auipc	a3,0x6
ffffffffc0203fdc:	78068693          	addi	a3,a3,1920 # ffffffffc020a758 <default_pmm_manager+0x358>
ffffffffc0203fe0:	00005617          	auipc	a2,0x5
ffffffffc0203fe4:	2a860613          	addi	a2,a2,680 # ffffffffc0209288 <commands+0x480>
ffffffffc0203fe8:	20d00593          	li	a1,525
ffffffffc0203fec:	00006517          	auipc	a0,0x6
ffffffffc0203ff0:	49450513          	addi	a0,a0,1172 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0203ff4:	a24fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0203ff8:	00006697          	auipc	a3,0x6
ffffffffc0203ffc:	73068693          	addi	a3,a3,1840 # ffffffffc020a728 <default_pmm_manager+0x328>
ffffffffc0204000:	00005617          	auipc	a2,0x5
ffffffffc0204004:	28860613          	addi	a2,a2,648 # ffffffffc0209288 <commands+0x480>
ffffffffc0204008:	20c00593          	li	a1,524
ffffffffc020400c:	00006517          	auipc	a0,0x6
ffffffffc0204010:	47450513          	addi	a0,a0,1140 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204014:	a04fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204018:	00006697          	auipc	a3,0x6
ffffffffc020401c:	6f868693          	addi	a3,a3,1784 # ffffffffc020a710 <default_pmm_manager+0x310>
ffffffffc0204020:	00005617          	auipc	a2,0x5
ffffffffc0204024:	26860613          	addi	a2,a2,616 # ffffffffc0209288 <commands+0x480>
ffffffffc0204028:	20a00593          	li	a1,522
ffffffffc020402c:	00006517          	auipc	a0,0x6
ffffffffc0204030:	45450513          	addi	a0,a0,1108 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204034:	9e4fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204038:	00006697          	auipc	a3,0x6
ffffffffc020403c:	6c068693          	addi	a3,a3,1728 # ffffffffc020a6f8 <default_pmm_manager+0x2f8>
ffffffffc0204040:	00005617          	auipc	a2,0x5
ffffffffc0204044:	24860613          	addi	a2,a2,584 # ffffffffc0209288 <commands+0x480>
ffffffffc0204048:	20900593          	li	a1,521
ffffffffc020404c:	00006517          	auipc	a0,0x6
ffffffffc0204050:	43450513          	addi	a0,a0,1076 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204054:	9c4fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204058:	00006697          	auipc	a3,0x6
ffffffffc020405c:	69068693          	addi	a3,a3,1680 # ffffffffc020a6e8 <default_pmm_manager+0x2e8>
ffffffffc0204060:	00005617          	auipc	a2,0x5
ffffffffc0204064:	22860613          	addi	a2,a2,552 # ffffffffc0209288 <commands+0x480>
ffffffffc0204068:	20800593          	li	a1,520
ffffffffc020406c:	00006517          	auipc	a0,0x6
ffffffffc0204070:	41450513          	addi	a0,a0,1044 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204074:	9a4fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204078:	00006697          	auipc	a3,0x6
ffffffffc020407c:	66068693          	addi	a3,a3,1632 # ffffffffc020a6d8 <default_pmm_manager+0x2d8>
ffffffffc0204080:	00005617          	auipc	a2,0x5
ffffffffc0204084:	20860613          	addi	a2,a2,520 # ffffffffc0209288 <commands+0x480>
ffffffffc0204088:	20700593          	li	a1,519
ffffffffc020408c:	00006517          	auipc	a0,0x6
ffffffffc0204090:	3f450513          	addi	a0,a0,1012 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204094:	984fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204098:	00006697          	auipc	a3,0x6
ffffffffc020409c:	61068693          	addi	a3,a3,1552 # ffffffffc020a6a8 <default_pmm_manager+0x2a8>
ffffffffc02040a0:	00005617          	auipc	a2,0x5
ffffffffc02040a4:	1e860613          	addi	a2,a2,488 # ffffffffc0209288 <commands+0x480>
ffffffffc02040a8:	20600593          	li	a1,518
ffffffffc02040ac:	00006517          	auipc	a0,0x6
ffffffffc02040b0:	3d450513          	addi	a0,a0,980 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02040b4:	964fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02040b8:	00006697          	auipc	a3,0x6
ffffffffc02040bc:	5b868693          	addi	a3,a3,1464 # ffffffffc020a670 <default_pmm_manager+0x270>
ffffffffc02040c0:	00005617          	auipc	a2,0x5
ffffffffc02040c4:	1c860613          	addi	a2,a2,456 # ffffffffc0209288 <commands+0x480>
ffffffffc02040c8:	20500593          	li	a1,517
ffffffffc02040cc:	00006517          	auipc	a0,0x6
ffffffffc02040d0:	3b450513          	addi	a0,a0,948 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02040d4:	944fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02040d8:	00006697          	auipc	a3,0x6
ffffffffc02040dc:	57068693          	addi	a3,a3,1392 # ffffffffc020a648 <default_pmm_manager+0x248>
ffffffffc02040e0:	00005617          	auipc	a2,0x5
ffffffffc02040e4:	1a860613          	addi	a2,a2,424 # ffffffffc0209288 <commands+0x480>
ffffffffc02040e8:	20200593          	li	a1,514
ffffffffc02040ec:	00006517          	auipc	a0,0x6
ffffffffc02040f0:	39450513          	addi	a0,a0,916 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02040f4:	924fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02040f8:	00006697          	auipc	a3,0x6
ffffffffc02040fc:	6a868693          	addi	a3,a3,1704 # ffffffffc020a7a0 <default_pmm_manager+0x3a0>
ffffffffc0204100:	00005617          	auipc	a2,0x5
ffffffffc0204104:	18860613          	addi	a2,a2,392 # ffffffffc0209288 <commands+0x480>
ffffffffc0204108:	21800593          	li	a1,536
ffffffffc020410c:	00006517          	auipc	a0,0x6
ffffffffc0204110:	37450513          	addi	a0,a0,884 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204114:	904fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204118:	00006697          	auipc	a3,0x6
ffffffffc020411c:	65868693          	addi	a3,a3,1624 # ffffffffc020a770 <default_pmm_manager+0x370>
ffffffffc0204120:	00005617          	auipc	a2,0x5
ffffffffc0204124:	16860613          	addi	a2,a2,360 # ffffffffc0209288 <commands+0x480>
ffffffffc0204128:	21500593          	li	a1,533
ffffffffc020412c:	00006517          	auipc	a0,0x6
ffffffffc0204130:	35450513          	addi	a0,a0,852 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204134:	8e4fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204138:	00006697          	auipc	a3,0x6
ffffffffc020413c:	4f868693          	addi	a3,a3,1272 # ffffffffc020a630 <default_pmm_manager+0x230>
ffffffffc0204140:	00005617          	auipc	a2,0x5
ffffffffc0204144:	14860613          	addi	a2,a2,328 # ffffffffc0209288 <commands+0x480>
ffffffffc0204148:	21400593          	li	a1,532
ffffffffc020414c:	00006517          	auipc	a0,0x6
ffffffffc0204150:	33450513          	addi	a0,a0,820 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204154:	8c4fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204158:	00006697          	auipc	a3,0x6
ffffffffc020415c:	63068693          	addi	a3,a3,1584 # ffffffffc020a788 <default_pmm_manager+0x388>
ffffffffc0204160:	00005617          	auipc	a2,0x5
ffffffffc0204164:	12860613          	addi	a2,a2,296 # ffffffffc0209288 <commands+0x480>
ffffffffc0204168:	21100593          	li	a1,529
ffffffffc020416c:	00006517          	auipc	a0,0x6
ffffffffc0204170:	31450513          	addi	a0,a0,788 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204174:	8a4fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204178:	00006697          	auipc	a3,0x6
ffffffffc020417c:	4a068693          	addi	a3,a3,1184 # ffffffffc020a618 <default_pmm_manager+0x218>
ffffffffc0204180:	00005617          	auipc	a2,0x5
ffffffffc0204184:	10860613          	addi	a2,a2,264 # ffffffffc0209288 <commands+0x480>
ffffffffc0204188:	21000593          	li	a1,528
ffffffffc020418c:	00006517          	auipc	a0,0x6
ffffffffc0204190:	2f450513          	addi	a0,a0,756 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204194:	884fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204198:	00006697          	auipc	a3,0x6
ffffffffc020419c:	51068693          	addi	a3,a3,1296 # ffffffffc020a6a8 <default_pmm_manager+0x2a8>
ffffffffc02041a0:	00005617          	auipc	a2,0x5
ffffffffc02041a4:	0e860613          	addi	a2,a2,232 # ffffffffc0209288 <commands+0x480>
ffffffffc02041a8:	20f00593          	li	a1,527
ffffffffc02041ac:	00006517          	auipc	a0,0x6
ffffffffc02041b0:	2d450513          	addi	a0,a0,724 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02041b4:	864fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02041b8:	00006697          	auipc	a3,0x6
ffffffffc02041bc:	74868693          	addi	a3,a3,1864 # ffffffffc020a900 <default_pmm_manager+0x500>
ffffffffc02041c0:	00005617          	auipc	a2,0x5
ffffffffc02041c4:	0c860613          	addi	a2,a2,200 # ffffffffc0209288 <commands+0x480>
ffffffffc02041c8:	23200593          	li	a1,562
ffffffffc02041cc:	00006517          	auipc	a0,0x6
ffffffffc02041d0:	2b450513          	addi	a0,a0,692 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02041d4:	844fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02041d8:	00006697          	auipc	a3,0x6
ffffffffc02041dc:	6e868693          	addi	a3,a3,1768 # ffffffffc020a8c0 <default_pmm_manager+0x4c0>
ffffffffc02041e0:	00005617          	auipc	a2,0x5
ffffffffc02041e4:	0a860613          	addi	a2,a2,168 # ffffffffc0209288 <commands+0x480>
ffffffffc02041e8:	23100593          	li	a1,561
ffffffffc02041ec:	00006517          	auipc	a0,0x6
ffffffffc02041f0:	29450513          	addi	a0,a0,660 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02041f4:	824fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02041f8:	00006697          	auipc	a3,0x6
ffffffffc02041fc:	5c068693          	addi	a3,a3,1472 # ffffffffc020a7b8 <default_pmm_manager+0x3b8>
ffffffffc0204200:	00005617          	auipc	a2,0x5
ffffffffc0204204:	08860613          	addi	a2,a2,136 # ffffffffc0209288 <commands+0x480>
ffffffffc0204208:	21b00593          	li	a1,539
ffffffffc020420c:	00006517          	auipc	a0,0x6
ffffffffc0204210:	27450513          	addi	a0,a0,628 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204214:	804fc0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204218:	00006697          	auipc	a3,0x6
ffffffffc020421c:	55868693          	addi	a3,a3,1368 # ffffffffc020a770 <default_pmm_manager+0x370>
ffffffffc0204220:	00005617          	auipc	a2,0x5
ffffffffc0204224:	06860613          	addi	a2,a2,104 # ffffffffc0209288 <commands+0x480>
ffffffffc0204228:	21900593          	li	a1,537
ffffffffc020422c:	00006517          	auipc	a0,0x6
ffffffffc0204230:	25450513          	addi	a0,a0,596 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204234:	fe5fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204238:	00006697          	auipc	a3,0x6
ffffffffc020423c:	62068693          	addi	a3,a3,1568 # ffffffffc020a858 <default_pmm_manager+0x458>
ffffffffc0204240:	00005617          	auipc	a2,0x5
ffffffffc0204244:	04860613          	addi	a2,a2,72 # ffffffffc0209288 <commands+0x480>
ffffffffc0204248:	22b00593          	li	a1,555
ffffffffc020424c:	00006517          	auipc	a0,0x6
ffffffffc0204250:	23450513          	addi	a0,a0,564 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204254:	fc5fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204258:	86aa                	mv	a3,a0
ffffffffc020425a:	00006617          	auipc	a2,0x6
ffffffffc020425e:	9fe60613          	addi	a2,a2,-1538 # ffffffffc0209c58 <commands+0xe50>
ffffffffc0204262:	0c100593          	li	a1,193
ffffffffc0204266:	00006517          	auipc	a0,0x6
ffffffffc020426a:	21a50513          	addi	a0,a0,538 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc020426e:	fabfb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204272:	00006617          	auipc	a2,0x6
ffffffffc0204276:	9e660613          	addi	a2,a2,-1562 # ffffffffc0209c58 <commands+0xe50>
ffffffffc020427a:	07f00593          	li	a1,127
ffffffffc020427e:	00006517          	auipc	a0,0x6
ffffffffc0204282:	20250513          	addi	a0,a0,514 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204286:	f93fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020428a:	00006697          	auipc	a3,0x6
ffffffffc020428e:	6de68693          	addi	a3,a3,1758 # ffffffffc020a968 <default_pmm_manager+0x568>
ffffffffc0204292:	00005617          	auipc	a2,0x5
ffffffffc0204296:	ff660613          	addi	a2,a2,-10 # ffffffffc0209288 <commands+0x480>
ffffffffc020429a:	23900593          	li	a1,569
ffffffffc020429e:	00006517          	auipc	a0,0x6
ffffffffc02042a2:	1e250513          	addi	a0,a0,482 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02042a6:	f73fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02042aa:	00006697          	auipc	a3,0x6
ffffffffc02042ae:	5fe68693          	addi	a3,a3,1534 # ffffffffc020a8a8 <default_pmm_manager+0x4a8>
ffffffffc02042b2:	00005617          	auipc	a2,0x5
ffffffffc02042b6:	fd660613          	addi	a2,a2,-42 # ffffffffc0209288 <commands+0x480>
ffffffffc02042ba:	23000593          	li	a1,560
ffffffffc02042be:	00006517          	auipc	a0,0x6
ffffffffc02042c2:	1c250513          	addi	a0,a0,450 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02042c6:	f53fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02042ca:	00006697          	auipc	a3,0x6
ffffffffc02042ce:	5a668693          	addi	a3,a3,1446 # ffffffffc020a870 <default_pmm_manager+0x470>
ffffffffc02042d2:	00005617          	auipc	a2,0x5
ffffffffc02042d6:	fb660613          	addi	a2,a2,-74 # ffffffffc0209288 <commands+0x480>
ffffffffc02042da:	22f00593          	li	a1,559
ffffffffc02042de:	00006517          	auipc	a0,0x6
ffffffffc02042e2:	1a250513          	addi	a0,a0,418 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02042e6:	f33fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02042ea:	00006697          	auipc	a3,0x6
ffffffffc02042ee:	24e68693          	addi	a3,a3,590 # ffffffffc020a538 <default_pmm_manager+0x138>
ffffffffc02042f2:	00005617          	auipc	a2,0x5
ffffffffc02042f6:	f9660613          	addi	a2,a2,-106 # ffffffffc0209288 <commands+0x480>
ffffffffc02042fa:	1f300593          	li	a1,499
ffffffffc02042fe:	00006517          	auipc	a0,0x6
ffffffffc0204302:	18250513          	addi	a0,a0,386 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204306:	f13fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020430a:	00006697          	auipc	a3,0x6
ffffffffc020430e:	2de68693          	addi	a3,a3,734 # ffffffffc020a5e8 <default_pmm_manager+0x1e8>
ffffffffc0204312:	00005617          	auipc	a2,0x5
ffffffffc0204316:	f7660613          	addi	a2,a2,-138 # ffffffffc0209288 <commands+0x480>
ffffffffc020431a:	1fc00593          	li	a1,508
ffffffffc020431e:	00006517          	auipc	a0,0x6
ffffffffc0204322:	16250513          	addi	a0,a0,354 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204326:	ef3fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020432a:	00006697          	auipc	a3,0x6
ffffffffc020432e:	28e68693          	addi	a3,a3,654 # ffffffffc020a5b8 <default_pmm_manager+0x1b8>
ffffffffc0204332:	00005617          	auipc	a2,0x5
ffffffffc0204336:	f5660613          	addi	a2,a2,-170 # ffffffffc0209288 <commands+0x480>
ffffffffc020433a:	1f900593          	li	a1,505
ffffffffc020433e:	00006517          	auipc	a0,0x6
ffffffffc0204342:	14250513          	addi	a0,a0,322 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204346:	ed3fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020434a:	00006697          	auipc	a3,0x6
ffffffffc020434e:	24668693          	addi	a3,a3,582 # ffffffffc020a590 <default_pmm_manager+0x190>
ffffffffc0204352:	00005617          	auipc	a2,0x5
ffffffffc0204356:	f3660613          	addi	a2,a2,-202 # ffffffffc0209288 <commands+0x480>
ffffffffc020435a:	1f500593          	li	a1,501
ffffffffc020435e:	00006517          	auipc	a0,0x6
ffffffffc0204362:	12250513          	addi	a0,a0,290 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204366:	eb3fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020436a:	86d6                	mv	a3,s5
ffffffffc020436c:	00006617          	auipc	a2,0x6
ffffffffc0204370:	8c460613          	addi	a2,a2,-1852 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0204374:	20100593          	li	a1,513
ffffffffc0204378:	00006517          	auipc	a0,0x6
ffffffffc020437c:	10850513          	addi	a0,a0,264 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204380:	e99fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204384:	86be                	mv	a3,a5
ffffffffc0204386:	00006617          	auipc	a2,0x6
ffffffffc020438a:	8aa60613          	addi	a2,a2,-1878 # ffffffffc0209c30 <commands+0xe28>
ffffffffc020438e:	20000593          	li	a1,512
ffffffffc0204392:	00006517          	auipc	a0,0x6
ffffffffc0204396:	0ee50513          	addi	a0,a0,238 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc020439a:	e7ffb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020439e:	00006617          	auipc	a2,0x6
ffffffffc02043a2:	89260613          	addi	a2,a2,-1902 # ffffffffc0209c30 <commands+0xe28>
ffffffffc02043a6:	06900593          	li	a1,105
ffffffffc02043aa:	00005517          	auipc	a0,0x5
ffffffffc02043ae:	62650513          	addi	a0,a0,1574 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02043b2:	e67fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02043b6:	00006697          	auipc	a3,0x6
ffffffffc02043ba:	57a68693          	addi	a3,a3,1402 # ffffffffc020a930 <default_pmm_manager+0x530>
ffffffffc02043be:	00005617          	auipc	a2,0x5
ffffffffc02043c2:	eca60613          	addi	a2,a2,-310 # ffffffffc0209288 <commands+0x480>
ffffffffc02043c6:	23600593          	li	a1,566
ffffffffc02043ca:	00006517          	auipc	a0,0x6
ffffffffc02043ce:	0b650513          	addi	a0,a0,182 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02043d2:	e47fb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02043d6 <copy_range>:
ffffffffc02043d6:	7159                	addi	sp,sp,-112
ffffffffc02043d8:	00d667b3          	or	a5,a2,a3
ffffffffc02043dc:	f486                	sd	ra,104(sp)
ffffffffc02043de:	f0a2                	sd	s0,96(sp)
ffffffffc02043e0:	eca6                	sd	s1,88(sp)
ffffffffc02043e2:	e8ca                	sd	s2,80(sp)
ffffffffc02043e4:	e4ce                	sd	s3,72(sp)
ffffffffc02043e6:	e0d2                	sd	s4,64(sp)
ffffffffc02043e8:	fc56                	sd	s5,56(sp)
ffffffffc02043ea:	f85a                	sd	s6,48(sp)
ffffffffc02043ec:	f45e                	sd	s7,40(sp)
ffffffffc02043ee:	f062                	sd	s8,32(sp)
ffffffffc02043f0:	ec66                	sd	s9,24(sp)
ffffffffc02043f2:	e86a                	sd	s10,16(sp)
ffffffffc02043f4:	e46e                	sd	s11,8(sp)
ffffffffc02043f6:	03479713          	slli	a4,a5,0x34
ffffffffc02043fa:	1e071863          	bnez	a4,ffffffffc02045ea <copy_range+0x214>
ffffffffc02043fe:	002007b7          	lui	a5,0x200
ffffffffc0204402:	8432                	mv	s0,a2
ffffffffc0204404:	16f66b63          	bltu	a2,a5,ffffffffc020457a <copy_range+0x1a4>
ffffffffc0204408:	84b6                	mv	s1,a3
ffffffffc020440a:	16d67863          	bgeu	a2,a3,ffffffffc020457a <copy_range+0x1a4>
ffffffffc020440e:	4785                	li	a5,1
ffffffffc0204410:	07fe                	slli	a5,a5,0x1f
ffffffffc0204412:	16d7e463          	bltu	a5,a3,ffffffffc020457a <copy_range+0x1a4>
ffffffffc0204416:	5a7d                	li	s4,-1
ffffffffc0204418:	8aaa                	mv	s5,a0
ffffffffc020441a:	892e                	mv	s2,a1
ffffffffc020441c:	6985                	lui	s3,0x1
ffffffffc020441e:	00039c17          	auipc	s8,0x39
ffffffffc0204422:	a5ac0c13          	addi	s8,s8,-1446 # ffffffffc023ce78 <npage>
ffffffffc0204426:	00039b97          	auipc	s7,0x39
ffffffffc020442a:	ba2b8b93          	addi	s7,s7,-1118 # ffffffffc023cfc8 <pages>
ffffffffc020442e:	00080b37          	lui	s6,0x80
ffffffffc0204432:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0204436:	4601                	li	a2,0
ffffffffc0204438:	85a2                	mv	a1,s0
ffffffffc020443a:	854a                	mv	a0,s2
ffffffffc020443c:	8b6ff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc0204440:	8caa                	mv	s9,a0
ffffffffc0204442:	c17d                	beqz	a0,ffffffffc0204528 <copy_range+0x152>
ffffffffc0204444:	611c                	ld	a5,0(a0)
ffffffffc0204446:	8b85                	andi	a5,a5,1
ffffffffc0204448:	e785                	bnez	a5,ffffffffc0204470 <copy_range+0x9a>
ffffffffc020444a:	944e                	add	s0,s0,s3
ffffffffc020444c:	fe9465e3          	bltu	s0,s1,ffffffffc0204436 <copy_range+0x60>
ffffffffc0204450:	4501                	li	a0,0
ffffffffc0204452:	70a6                	ld	ra,104(sp)
ffffffffc0204454:	7406                	ld	s0,96(sp)
ffffffffc0204456:	64e6                	ld	s1,88(sp)
ffffffffc0204458:	6946                	ld	s2,80(sp)
ffffffffc020445a:	69a6                	ld	s3,72(sp)
ffffffffc020445c:	6a06                	ld	s4,64(sp)
ffffffffc020445e:	7ae2                	ld	s5,56(sp)
ffffffffc0204460:	7b42                	ld	s6,48(sp)
ffffffffc0204462:	7ba2                	ld	s7,40(sp)
ffffffffc0204464:	7c02                	ld	s8,32(sp)
ffffffffc0204466:	6ce2                	ld	s9,24(sp)
ffffffffc0204468:	6d42                	ld	s10,16(sp)
ffffffffc020446a:	6da2                	ld	s11,8(sp)
ffffffffc020446c:	6165                	addi	sp,sp,112
ffffffffc020446e:	8082                	ret
ffffffffc0204470:	4605                	li	a2,1
ffffffffc0204472:	85a2                	mv	a1,s0
ffffffffc0204474:	8556                	mv	a0,s5
ffffffffc0204476:	87cff0ef          	jal	ra,ffffffffc02034f2 <get_pte>
ffffffffc020447a:	c169                	beqz	a0,ffffffffc020453c <copy_range+0x166>
ffffffffc020447c:	000cb783          	ld	a5,0(s9)
ffffffffc0204480:	0017f713          	andi	a4,a5,1
ffffffffc0204484:	01f7fc93          	andi	s9,a5,31
ffffffffc0204488:	14070563          	beqz	a4,ffffffffc02045d2 <copy_range+0x1fc>
ffffffffc020448c:	000c3683          	ld	a3,0(s8)
ffffffffc0204490:	078a                	slli	a5,a5,0x2
ffffffffc0204492:	00c7d713          	srli	a4,a5,0xc
ffffffffc0204496:	12d77263          	bgeu	a4,a3,ffffffffc02045ba <copy_range+0x1e4>
ffffffffc020449a:	000bb783          	ld	a5,0(s7)
ffffffffc020449e:	fff806b7          	lui	a3,0xfff80
ffffffffc02044a2:	9736                	add	a4,a4,a3
ffffffffc02044a4:	071a                	slli	a4,a4,0x6
ffffffffc02044a6:	4505                	li	a0,1
ffffffffc02044a8:	00e78db3          	add	s11,a5,a4
ffffffffc02044ac:	f39fe0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc02044b0:	8d2a                	mv	s10,a0
ffffffffc02044b2:	0a0d8463          	beqz	s11,ffffffffc020455a <copy_range+0x184>
ffffffffc02044b6:	c175                	beqz	a0,ffffffffc020459a <copy_range+0x1c4>
ffffffffc02044b8:	000bb703          	ld	a4,0(s7)
ffffffffc02044bc:	000c3603          	ld	a2,0(s8)
ffffffffc02044c0:	40ed86b3          	sub	a3,s11,a4
ffffffffc02044c4:	8699                	srai	a3,a3,0x6
ffffffffc02044c6:	96da                	add	a3,a3,s6
ffffffffc02044c8:	0146f7b3          	and	a5,a3,s4
ffffffffc02044cc:	06b2                	slli	a3,a3,0xc
ffffffffc02044ce:	06c7fa63          	bgeu	a5,a2,ffffffffc0204542 <copy_range+0x16c>
ffffffffc02044d2:	40e507b3          	sub	a5,a0,a4
ffffffffc02044d6:	00039717          	auipc	a4,0x39
ffffffffc02044da:	ae270713          	addi	a4,a4,-1310 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc02044de:	6308                	ld	a0,0(a4)
ffffffffc02044e0:	8799                	srai	a5,a5,0x6
ffffffffc02044e2:	97da                	add	a5,a5,s6
ffffffffc02044e4:	0147f733          	and	a4,a5,s4
ffffffffc02044e8:	00a685b3          	add	a1,a3,a0
ffffffffc02044ec:	07b2                	slli	a5,a5,0xc
ffffffffc02044ee:	04c77963          	bgeu	a4,a2,ffffffffc0204540 <copy_range+0x16a>
ffffffffc02044f2:	6605                	lui	a2,0x1
ffffffffc02044f4:	953e                	add	a0,a0,a5
ffffffffc02044f6:	380040ef          	jal	ra,ffffffffc0208876 <memcpy>
ffffffffc02044fa:	86e6                	mv	a3,s9
ffffffffc02044fc:	8622                	mv	a2,s0
ffffffffc02044fe:	85ea                	mv	a1,s10
ffffffffc0204500:	8556                	mv	a0,s5
ffffffffc0204502:	ca6ff0ef          	jal	ra,ffffffffc02039a8 <page_insert>
ffffffffc0204506:	d131                	beqz	a0,ffffffffc020444a <copy_range+0x74>
ffffffffc0204508:	00006697          	auipc	a3,0x6
ffffffffc020450c:	f6868693          	addi	a3,a3,-152 # ffffffffc020a470 <default_pmm_manager+0x70>
ffffffffc0204510:	00005617          	auipc	a2,0x5
ffffffffc0204514:	d7860613          	addi	a2,a2,-648 # ffffffffc0209288 <commands+0x480>
ffffffffc0204518:	19900593          	li	a1,409
ffffffffc020451c:	00006517          	auipc	a0,0x6
ffffffffc0204520:	f6450513          	addi	a0,a0,-156 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204524:	cf5fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204528:	002007b7          	lui	a5,0x200
ffffffffc020452c:	943e                	add	s0,s0,a5
ffffffffc020452e:	ffe007b7          	lui	a5,0xffe00
ffffffffc0204532:	8c7d                	and	s0,s0,a5
ffffffffc0204534:	dc11                	beqz	s0,ffffffffc0204450 <copy_range+0x7a>
ffffffffc0204536:	f09460e3          	bltu	s0,s1,ffffffffc0204436 <copy_range+0x60>
ffffffffc020453a:	bf19                	j	ffffffffc0204450 <copy_range+0x7a>
ffffffffc020453c:	5571                	li	a0,-4
ffffffffc020453e:	bf11                	j	ffffffffc0204452 <copy_range+0x7c>
ffffffffc0204540:	86be                	mv	a3,a5
ffffffffc0204542:	00005617          	auipc	a2,0x5
ffffffffc0204546:	6ee60613          	addi	a2,a2,1774 # ffffffffc0209c30 <commands+0xe28>
ffffffffc020454a:	06900593          	li	a1,105
ffffffffc020454e:	00005517          	auipc	a0,0x5
ffffffffc0204552:	48250513          	addi	a0,a0,1154 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0204556:	cc3fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020455a:	00006697          	auipc	a3,0x6
ffffffffc020455e:	ef668693          	addi	a3,a3,-266 # ffffffffc020a450 <default_pmm_manager+0x50>
ffffffffc0204562:	00005617          	auipc	a2,0x5
ffffffffc0204566:	d2660613          	addi	a2,a2,-730 # ffffffffc0209288 <commands+0x480>
ffffffffc020456a:	17e00593          	li	a1,382
ffffffffc020456e:	00006517          	auipc	a0,0x6
ffffffffc0204572:	f1250513          	addi	a0,a0,-238 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204576:	ca3fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020457a:	00006697          	auipc	a3,0x6
ffffffffc020457e:	46668693          	addi	a3,a3,1126 # ffffffffc020a9e0 <default_pmm_manager+0x5e0>
ffffffffc0204582:	00005617          	auipc	a2,0x5
ffffffffc0204586:	d0660613          	addi	a2,a2,-762 # ffffffffc0209288 <commands+0x480>
ffffffffc020458a:	16a00593          	li	a1,362
ffffffffc020458e:	00006517          	auipc	a0,0x6
ffffffffc0204592:	ef250513          	addi	a0,a0,-270 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204596:	c83fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020459a:	00006697          	auipc	a3,0x6
ffffffffc020459e:	ec668693          	addi	a3,a3,-314 # ffffffffc020a460 <default_pmm_manager+0x60>
ffffffffc02045a2:	00005617          	auipc	a2,0x5
ffffffffc02045a6:	ce660613          	addi	a2,a2,-794 # ffffffffc0209288 <commands+0x480>
ffffffffc02045aa:	17f00593          	li	a1,383
ffffffffc02045ae:	00006517          	auipc	a0,0x6
ffffffffc02045b2:	ed250513          	addi	a0,a0,-302 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02045b6:	c63fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02045ba:	00005617          	auipc	a2,0x5
ffffffffc02045be:	3f660613          	addi	a2,a2,1014 # ffffffffc02099b0 <commands+0xba8>
ffffffffc02045c2:	06200593          	li	a1,98
ffffffffc02045c6:	00005517          	auipc	a0,0x5
ffffffffc02045ca:	40a50513          	addi	a0,a0,1034 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02045ce:	c4bfb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02045d2:	00006617          	auipc	a2,0x6
ffffffffc02045d6:	97e60613          	addi	a2,a2,-1666 # ffffffffc0209f50 <commands+0x1148>
ffffffffc02045da:	07400593          	li	a1,116
ffffffffc02045de:	00005517          	auipc	a0,0x5
ffffffffc02045e2:	3f250513          	addi	a0,a0,1010 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02045e6:	c33fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02045ea:	00006697          	auipc	a3,0x6
ffffffffc02045ee:	3c668693          	addi	a3,a3,966 # ffffffffc020a9b0 <default_pmm_manager+0x5b0>
ffffffffc02045f2:	00005617          	auipc	a2,0x5
ffffffffc02045f6:	c9660613          	addi	a2,a2,-874 # ffffffffc0209288 <commands+0x480>
ffffffffc02045fa:	16900593          	li	a1,361
ffffffffc02045fe:	00006517          	auipc	a0,0x6
ffffffffc0204602:	e8250513          	addi	a0,a0,-382 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc0204606:	c13fb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc020460a <tlb_invalidate>:
ffffffffc020460a:	12058073          	sfence.vma	a1
ffffffffc020460e:	8082                	ret

ffffffffc0204610 <pgdir_alloc_page>:
ffffffffc0204610:	7179                	addi	sp,sp,-48
ffffffffc0204612:	e84a                	sd	s2,16(sp)
ffffffffc0204614:	892a                	mv	s2,a0
ffffffffc0204616:	4505                	li	a0,1
ffffffffc0204618:	f022                	sd	s0,32(sp)
ffffffffc020461a:	ec26                	sd	s1,24(sp)
ffffffffc020461c:	e44e                	sd	s3,8(sp)
ffffffffc020461e:	f406                	sd	ra,40(sp)
ffffffffc0204620:	84ae                	mv	s1,a1
ffffffffc0204622:	89b2                	mv	s3,a2
ffffffffc0204624:	dc1fe0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0204628:	842a                	mv	s0,a0
ffffffffc020462a:	cd1d                	beqz	a0,ffffffffc0204668 <pgdir_alloc_page+0x58>
ffffffffc020462c:	85aa                	mv	a1,a0
ffffffffc020462e:	86ce                	mv	a3,s3
ffffffffc0204630:	8626                	mv	a2,s1
ffffffffc0204632:	854a                	mv	a0,s2
ffffffffc0204634:	b74ff0ef          	jal	ra,ffffffffc02039a8 <page_insert>
ffffffffc0204638:	e121                	bnez	a0,ffffffffc0204678 <pgdir_alloc_page+0x68>
ffffffffc020463a:	00039797          	auipc	a5,0x39
ffffffffc020463e:	82e78793          	addi	a5,a5,-2002 # ffffffffc023ce68 <swap_init_ok>
ffffffffc0204642:	439c                	lw	a5,0(a5)
ffffffffc0204644:	2781                	sext.w	a5,a5
ffffffffc0204646:	c38d                	beqz	a5,ffffffffc0204668 <pgdir_alloc_page+0x58>
ffffffffc0204648:	00039797          	auipc	a5,0x39
ffffffffc020464c:	87078793          	addi	a5,a5,-1936 # ffffffffc023ceb8 <check_mm_struct>
ffffffffc0204650:	6388                	ld	a0,0(a5)
ffffffffc0204652:	c919                	beqz	a0,ffffffffc0204668 <pgdir_alloc_page+0x58>
ffffffffc0204654:	4681                	li	a3,0
ffffffffc0204656:	8622                	mv	a2,s0
ffffffffc0204658:	85a6                	mv	a1,s1
ffffffffc020465a:	882fe0ef          	jal	ra,ffffffffc02026dc <swap_map_swappable>
ffffffffc020465e:	4018                	lw	a4,0(s0)
ffffffffc0204660:	fc04                	sd	s1,56(s0)
ffffffffc0204662:	4785                	li	a5,1
ffffffffc0204664:	02f71063          	bne	a4,a5,ffffffffc0204684 <pgdir_alloc_page+0x74>
ffffffffc0204668:	8522                	mv	a0,s0
ffffffffc020466a:	70a2                	ld	ra,40(sp)
ffffffffc020466c:	7402                	ld	s0,32(sp)
ffffffffc020466e:	64e2                	ld	s1,24(sp)
ffffffffc0204670:	6942                	ld	s2,16(sp)
ffffffffc0204672:	69a2                	ld	s3,8(sp)
ffffffffc0204674:	6145                	addi	sp,sp,48
ffffffffc0204676:	8082                	ret
ffffffffc0204678:	8522                	mv	a0,s0
ffffffffc020467a:	4585                	li	a1,1
ffffffffc020467c:	df1fe0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0204680:	4401                	li	s0,0
ffffffffc0204682:	b7dd                	j	ffffffffc0204668 <pgdir_alloc_page+0x58>
ffffffffc0204684:	00006697          	auipc	a3,0x6
ffffffffc0204688:	e0c68693          	addi	a3,a3,-500 # ffffffffc020a490 <default_pmm_manager+0x90>
ffffffffc020468c:	00005617          	auipc	a2,0x5
ffffffffc0204690:	bfc60613          	addi	a2,a2,-1028 # ffffffffc0209288 <commands+0x480>
ffffffffc0204694:	1d800593          	li	a1,472
ffffffffc0204698:	00006517          	auipc	a0,0x6
ffffffffc020469c:	de850513          	addi	a0,a0,-536 # ffffffffc020a480 <default_pmm_manager+0x80>
ffffffffc02046a0:	b79fb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02046a4 <swapfs_init>:
ffffffffc02046a4:	1141                	addi	sp,sp,-16
ffffffffc02046a6:	4505                	li	a0,1
ffffffffc02046a8:	e406                	sd	ra,8(sp)
ffffffffc02046aa:	e8bfb0ef          	jal	ra,ffffffffc0200534 <ide_device_valid>
ffffffffc02046ae:	cd01                	beqz	a0,ffffffffc02046c6 <swapfs_init+0x22>
ffffffffc02046b0:	4505                	li	a0,1
ffffffffc02046b2:	e89fb0ef          	jal	ra,ffffffffc020053a <ide_device_size>
ffffffffc02046b6:	60a2                	ld	ra,8(sp)
ffffffffc02046b8:	810d                	srli	a0,a0,0x3
ffffffffc02046ba:	00039797          	auipc	a5,0x39
ffffffffc02046be:	88a7bf23          	sd	a0,-1890(a5) # ffffffffc023cf58 <max_swap_offset>
ffffffffc02046c2:	0141                	addi	sp,sp,16
ffffffffc02046c4:	8082                	ret
ffffffffc02046c6:	00006617          	auipc	a2,0x6
ffffffffc02046ca:	33260613          	addi	a2,a2,818 # ffffffffc020a9f8 <default_pmm_manager+0x5f8>
ffffffffc02046ce:	45b5                	li	a1,13
ffffffffc02046d0:	00006517          	auipc	a0,0x6
ffffffffc02046d4:	34850513          	addi	a0,a0,840 # ffffffffc020aa18 <default_pmm_manager+0x618>
ffffffffc02046d8:	b41fb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02046dc <swapfs_read>:
ffffffffc02046dc:	1141                	addi	sp,sp,-16
ffffffffc02046de:	e406                	sd	ra,8(sp)
ffffffffc02046e0:	00855793          	srli	a5,a0,0x8
ffffffffc02046e4:	cfb9                	beqz	a5,ffffffffc0204742 <swapfs_read+0x66>
ffffffffc02046e6:	00039717          	auipc	a4,0x39
ffffffffc02046ea:	87270713          	addi	a4,a4,-1934 # ffffffffc023cf58 <max_swap_offset>
ffffffffc02046ee:	6318                	ld	a4,0(a4)
ffffffffc02046f0:	04e7f963          	bgeu	a5,a4,ffffffffc0204742 <swapfs_read+0x66>
ffffffffc02046f4:	00039717          	auipc	a4,0x39
ffffffffc02046f8:	8d470713          	addi	a4,a4,-1836 # ffffffffc023cfc8 <pages>
ffffffffc02046fc:	6310                	ld	a2,0(a4)
ffffffffc02046fe:	00007717          	auipc	a4,0x7
ffffffffc0204702:	3b270713          	addi	a4,a4,946 # ffffffffc020bab0 <nbase>
ffffffffc0204706:	40c58633          	sub	a2,a1,a2
ffffffffc020470a:	630c                	ld	a1,0(a4)
ffffffffc020470c:	8619                	srai	a2,a2,0x6
ffffffffc020470e:	00038717          	auipc	a4,0x38
ffffffffc0204712:	76a70713          	addi	a4,a4,1898 # ffffffffc023ce78 <npage>
ffffffffc0204716:	962e                	add	a2,a2,a1
ffffffffc0204718:	6314                	ld	a3,0(a4)
ffffffffc020471a:	00c61713          	slli	a4,a2,0xc
ffffffffc020471e:	8331                	srli	a4,a4,0xc
ffffffffc0204720:	0037959b          	slliw	a1,a5,0x3
ffffffffc0204724:	0632                	slli	a2,a2,0xc
ffffffffc0204726:	02d77a63          	bgeu	a4,a3,ffffffffc020475a <swapfs_read+0x7e>
ffffffffc020472a:	00039797          	auipc	a5,0x39
ffffffffc020472e:	88e78793          	addi	a5,a5,-1906 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0204732:	639c                	ld	a5,0(a5)
ffffffffc0204734:	60a2                	ld	ra,8(sp)
ffffffffc0204736:	46a1                	li	a3,8
ffffffffc0204738:	963e                	add	a2,a2,a5
ffffffffc020473a:	4505                	li	a0,1
ffffffffc020473c:	0141                	addi	sp,sp,16
ffffffffc020473e:	e03fb06f          	j	ffffffffc0200540 <ide_read_secs>
ffffffffc0204742:	86aa                	mv	a3,a0
ffffffffc0204744:	00006617          	auipc	a2,0x6
ffffffffc0204748:	2ec60613          	addi	a2,a2,748 # ffffffffc020aa30 <default_pmm_manager+0x630>
ffffffffc020474c:	45d1                	li	a1,20
ffffffffc020474e:	00006517          	auipc	a0,0x6
ffffffffc0204752:	2ca50513          	addi	a0,a0,714 # ffffffffc020aa18 <default_pmm_manager+0x618>
ffffffffc0204756:	ac3fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020475a:	86b2                	mv	a3,a2
ffffffffc020475c:	06900593          	li	a1,105
ffffffffc0204760:	00005617          	auipc	a2,0x5
ffffffffc0204764:	4d060613          	addi	a2,a2,1232 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0204768:	00005517          	auipc	a0,0x5
ffffffffc020476c:	26850513          	addi	a0,a0,616 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0204770:	aa9fb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0204774 <swapfs_write>:
ffffffffc0204774:	1141                	addi	sp,sp,-16
ffffffffc0204776:	e406                	sd	ra,8(sp)
ffffffffc0204778:	00855793          	srli	a5,a0,0x8
ffffffffc020477c:	cfb9                	beqz	a5,ffffffffc02047da <swapfs_write+0x66>
ffffffffc020477e:	00038717          	auipc	a4,0x38
ffffffffc0204782:	7da70713          	addi	a4,a4,2010 # ffffffffc023cf58 <max_swap_offset>
ffffffffc0204786:	6318                	ld	a4,0(a4)
ffffffffc0204788:	04e7f963          	bgeu	a5,a4,ffffffffc02047da <swapfs_write+0x66>
ffffffffc020478c:	00039717          	auipc	a4,0x39
ffffffffc0204790:	83c70713          	addi	a4,a4,-1988 # ffffffffc023cfc8 <pages>
ffffffffc0204794:	6310                	ld	a2,0(a4)
ffffffffc0204796:	00007717          	auipc	a4,0x7
ffffffffc020479a:	31a70713          	addi	a4,a4,794 # ffffffffc020bab0 <nbase>
ffffffffc020479e:	40c58633          	sub	a2,a1,a2
ffffffffc02047a2:	630c                	ld	a1,0(a4)
ffffffffc02047a4:	8619                	srai	a2,a2,0x6
ffffffffc02047a6:	00038717          	auipc	a4,0x38
ffffffffc02047aa:	6d270713          	addi	a4,a4,1746 # ffffffffc023ce78 <npage>
ffffffffc02047ae:	962e                	add	a2,a2,a1
ffffffffc02047b0:	6314                	ld	a3,0(a4)
ffffffffc02047b2:	00c61713          	slli	a4,a2,0xc
ffffffffc02047b6:	8331                	srli	a4,a4,0xc
ffffffffc02047b8:	0037959b          	slliw	a1,a5,0x3
ffffffffc02047bc:	0632                	slli	a2,a2,0xc
ffffffffc02047be:	02d77a63          	bgeu	a4,a3,ffffffffc02047f2 <swapfs_write+0x7e>
ffffffffc02047c2:	00038797          	auipc	a5,0x38
ffffffffc02047c6:	7f678793          	addi	a5,a5,2038 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc02047ca:	639c                	ld	a5,0(a5)
ffffffffc02047cc:	60a2                	ld	ra,8(sp)
ffffffffc02047ce:	46a1                	li	a3,8
ffffffffc02047d0:	963e                	add	a2,a2,a5
ffffffffc02047d2:	4505                	li	a0,1
ffffffffc02047d4:	0141                	addi	sp,sp,16
ffffffffc02047d6:	d8ffb06f          	j	ffffffffc0200564 <ide_write_secs>
ffffffffc02047da:	86aa                	mv	a3,a0
ffffffffc02047dc:	00006617          	auipc	a2,0x6
ffffffffc02047e0:	25460613          	addi	a2,a2,596 # ffffffffc020aa30 <default_pmm_manager+0x630>
ffffffffc02047e4:	45e5                	li	a1,25
ffffffffc02047e6:	00006517          	auipc	a0,0x6
ffffffffc02047ea:	23250513          	addi	a0,a0,562 # ffffffffc020aa18 <default_pmm_manager+0x618>
ffffffffc02047ee:	a2bfb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02047f2:	86b2                	mv	a3,a2
ffffffffc02047f4:	06900593          	li	a1,105
ffffffffc02047f8:	00005617          	auipc	a2,0x5
ffffffffc02047fc:	43860613          	addi	a2,a2,1080 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0204800:	00005517          	auipc	a0,0x5
ffffffffc0204804:	1d050513          	addi	a0,a0,464 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0204808:	a11fb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc020480c <switch_to>:
ffffffffc020480c:	00153023          	sd	ra,0(a0)
ffffffffc0204810:	00253423          	sd	sp,8(a0)
ffffffffc0204814:	e900                	sd	s0,16(a0)
ffffffffc0204816:	ed04                	sd	s1,24(a0)
ffffffffc0204818:	03253023          	sd	s2,32(a0)
ffffffffc020481c:	03353423          	sd	s3,40(a0)
ffffffffc0204820:	03453823          	sd	s4,48(a0)
ffffffffc0204824:	03553c23          	sd	s5,56(a0)
ffffffffc0204828:	05653023          	sd	s6,64(a0)
ffffffffc020482c:	05753423          	sd	s7,72(a0)
ffffffffc0204830:	05853823          	sd	s8,80(a0)
ffffffffc0204834:	05953c23          	sd	s9,88(a0)
ffffffffc0204838:	07a53023          	sd	s10,96(a0)
ffffffffc020483c:	07b53423          	sd	s11,104(a0)
ffffffffc0204840:	0005b083          	ld	ra,0(a1)
ffffffffc0204844:	0085b103          	ld	sp,8(a1)
ffffffffc0204848:	6980                	ld	s0,16(a1)
ffffffffc020484a:	6d84                	ld	s1,24(a1)
ffffffffc020484c:	0205b903          	ld	s2,32(a1)
ffffffffc0204850:	0285b983          	ld	s3,40(a1)
ffffffffc0204854:	0305ba03          	ld	s4,48(a1)
ffffffffc0204858:	0385ba83          	ld	s5,56(a1)
ffffffffc020485c:	0405bb03          	ld	s6,64(a1)
ffffffffc0204860:	0485bb83          	ld	s7,72(a1)
ffffffffc0204864:	0505bc03          	ld	s8,80(a1)
ffffffffc0204868:	0585bc83          	ld	s9,88(a1)
ffffffffc020486c:	0605bd03          	ld	s10,96(a1)
ffffffffc0204870:	0685bd83          	ld	s11,104(a1)
ffffffffc0204874:	8082                	ret

ffffffffc0204876 <kernel_thread_entry>:
ffffffffc0204876:	8526                	mv	a0,s1
ffffffffc0204878:	9402                	jalr	s0
ffffffffc020487a:	74c000ef          	jal	ra,ffffffffc0204fc6 <do_exit>

ffffffffc020487e <alloc_proc>:
ffffffffc020487e:	1141                	addi	sp,sp,-16
ffffffffc0204880:	14800513          	li	a0,328
ffffffffc0204884:	e022                	sd	s0,0(sp)
ffffffffc0204886:	e406                	sd	ra,8(sp)
ffffffffc0204888:	d8cfd0ef          	jal	ra,ffffffffc0201e14 <kmalloc>
ffffffffc020488c:	842a                	mv	s0,a0
ffffffffc020488e:	c52d                	beqz	a0,ffffffffc02048f8 <alloc_proc+0x7a>
ffffffffc0204890:	57fd                	li	a5,-1
ffffffffc0204892:	1782                	slli	a5,a5,0x20
ffffffffc0204894:	e11c                	sd	a5,0(a0)
ffffffffc0204896:	07000613          	li	a2,112
ffffffffc020489a:	4581                	li	a1,0
ffffffffc020489c:	00052423          	sw	zero,8(a0)
ffffffffc02048a0:	00053823          	sd	zero,16(a0)
ffffffffc02048a4:	00053c23          	sd	zero,24(a0)
ffffffffc02048a8:	02053023          	sd	zero,32(a0)
ffffffffc02048ac:	02053423          	sd	zero,40(a0)
ffffffffc02048b0:	03050513          	addi	a0,a0,48
ffffffffc02048b4:	7b1030ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc02048b8:	00038797          	auipc	a5,0x38
ffffffffc02048bc:	70878793          	addi	a5,a5,1800 # ffffffffc023cfc0 <boot_cr3>
ffffffffc02048c0:	639c                	ld	a5,0(a5)
ffffffffc02048c2:	0a043023          	sd	zero,160(s0)
ffffffffc02048c6:	0a042823          	sw	zero,176(s0)
ffffffffc02048ca:	f45c                	sd	a5,168(s0)
ffffffffc02048cc:	463d                	li	a2,15
ffffffffc02048ce:	4581                	li	a1,0
ffffffffc02048d0:	0b440513          	addi	a0,s0,180
ffffffffc02048d4:	791030ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc02048d8:	0e042623          	sw	zero,236(s0)
ffffffffc02048dc:	0e043c23          	sd	zero,248(s0)
ffffffffc02048e0:	10043023          	sd	zero,256(s0)
ffffffffc02048e4:	0e043823          	sd	zero,240(s0)
ffffffffc02048e8:	12043423          	sd	zero,296(s0)
ffffffffc02048ec:	12043823          	sd	zero,304(s0)
ffffffffc02048f0:	12043c23          	sd	zero,312(s0)
ffffffffc02048f4:	14043023          	sd	zero,320(s0)
ffffffffc02048f8:	8522                	mv	a0,s0
ffffffffc02048fa:	60a2                	ld	ra,8(sp)
ffffffffc02048fc:	6402                	ld	s0,0(sp)
ffffffffc02048fe:	0141                	addi	sp,sp,16
ffffffffc0204900:	8082                	ret

ffffffffc0204902 <forkret>:
ffffffffc0204902:	00038797          	auipc	a5,0x38
ffffffffc0204906:	57e78793          	addi	a5,a5,1406 # ffffffffc023ce80 <current>
ffffffffc020490a:	639c                	ld	a5,0(a5)
ffffffffc020490c:	73c8                	ld	a0,160(a5)
ffffffffc020490e:	c4cfc06f          	j	ffffffffc0200d5a <forkrets>

ffffffffc0204912 <user_main>:
ffffffffc0204912:	00038797          	auipc	a5,0x38
ffffffffc0204916:	56e78793          	addi	a5,a5,1390 # ffffffffc023ce80 <current>
ffffffffc020491a:	639c                	ld	a5,0(a5)
ffffffffc020491c:	7139                	addi	sp,sp,-64
ffffffffc020491e:	00006617          	auipc	a2,0x6
ffffffffc0204922:	53a60613          	addi	a2,a2,1338 # ffffffffc020ae58 <default_pmm_manager+0xa58>
ffffffffc0204926:	43cc                	lw	a1,4(a5)
ffffffffc0204928:	00006517          	auipc	a0,0x6
ffffffffc020492c:	53850513          	addi	a0,a0,1336 # ffffffffc020ae60 <default_pmm_manager+0xa60>
ffffffffc0204930:	fc06                	sd	ra,56(sp)
ffffffffc0204932:	fa2fb0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0204936:	00006797          	auipc	a5,0x6
ffffffffc020493a:	52278793          	addi	a5,a5,1314 # ffffffffc020ae58 <default_pmm_manager+0xa58>
ffffffffc020493e:	3fdfd717          	auipc	a4,0x3fdfd
ffffffffc0204942:	41a70713          	addi	a4,a4,1050 # 1d58 <_binary_obj___user_faultread_out_size>
ffffffffc0204946:	e43a                	sd	a4,8(sp)
ffffffffc0204948:	853e                	mv	a0,a5
ffffffffc020494a:	0001d717          	auipc	a4,0x1d
ffffffffc020494e:	cd670713          	addi	a4,a4,-810 # ffffffffc0221620 <_binary_obj___user_softint_out_start>
ffffffffc0204952:	f03a                	sd	a4,32(sp)
ffffffffc0204954:	f43e                	sd	a5,40(sp)
ffffffffc0204956:	e802                	sd	zero,16(sp)
ffffffffc0204958:	66f030ef          	jal	ra,ffffffffc02087c6 <strlen>
ffffffffc020495c:	ec2a                	sd	a0,24(sp)
ffffffffc020495e:	4511                	li	a0,4
ffffffffc0204960:	55a2                	lw	a1,40(sp)
ffffffffc0204962:	4662                	lw	a2,24(sp)
ffffffffc0204964:	5682                	lw	a3,32(sp)
ffffffffc0204966:	4722                	lw	a4,8(sp)
ffffffffc0204968:	48a9                	li	a7,10
ffffffffc020496a:	9002                	ebreak
ffffffffc020496c:	c82a                	sw	a0,16(sp)
ffffffffc020496e:	65c2                	ld	a1,16(sp)
ffffffffc0204970:	00006517          	auipc	a0,0x6
ffffffffc0204974:	51850513          	addi	a0,a0,1304 # ffffffffc020ae88 <default_pmm_manager+0xa88>
ffffffffc0204978:	f5cfb0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc020497c:	00006617          	auipc	a2,0x6
ffffffffc0204980:	51c60613          	addi	a2,a2,1308 # ffffffffc020ae98 <default_pmm_manager+0xa98>
ffffffffc0204984:	34a00593          	li	a1,842
ffffffffc0204988:	00006517          	auipc	a0,0x6
ffffffffc020498c:	53050513          	addi	a0,a0,1328 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0204990:	889fb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0204994 <put_pgdir>:
ffffffffc0204994:	6d14                	ld	a3,24(a0)
ffffffffc0204996:	1141                	addi	sp,sp,-16
ffffffffc0204998:	e406                	sd	ra,8(sp)
ffffffffc020499a:	c02007b7          	lui	a5,0xc0200
ffffffffc020499e:	04f6e263          	bltu	a3,a5,ffffffffc02049e2 <put_pgdir+0x4e>
ffffffffc02049a2:	00038797          	auipc	a5,0x38
ffffffffc02049a6:	61678793          	addi	a5,a5,1558 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc02049aa:	6388                	ld	a0,0(a5)
ffffffffc02049ac:	00038797          	auipc	a5,0x38
ffffffffc02049b0:	4cc78793          	addi	a5,a5,1228 # ffffffffc023ce78 <npage>
ffffffffc02049b4:	639c                	ld	a5,0(a5)
ffffffffc02049b6:	8e89                	sub	a3,a3,a0
ffffffffc02049b8:	82b1                	srli	a3,a3,0xc
ffffffffc02049ba:	04f6f063          	bgeu	a3,a5,ffffffffc02049fa <put_pgdir+0x66>
ffffffffc02049be:	00007797          	auipc	a5,0x7
ffffffffc02049c2:	0f278793          	addi	a5,a5,242 # ffffffffc020bab0 <nbase>
ffffffffc02049c6:	639c                	ld	a5,0(a5)
ffffffffc02049c8:	00038717          	auipc	a4,0x38
ffffffffc02049cc:	60070713          	addi	a4,a4,1536 # ffffffffc023cfc8 <pages>
ffffffffc02049d0:	6308                	ld	a0,0(a4)
ffffffffc02049d2:	60a2                	ld	ra,8(sp)
ffffffffc02049d4:	8e9d                	sub	a3,a3,a5
ffffffffc02049d6:	069a                	slli	a3,a3,0x6
ffffffffc02049d8:	4585                	li	a1,1
ffffffffc02049da:	9536                	add	a0,a0,a3
ffffffffc02049dc:	0141                	addi	sp,sp,16
ffffffffc02049de:	a8ffe06f          	j	ffffffffc020346c <free_pages>
ffffffffc02049e2:	00005617          	auipc	a2,0x5
ffffffffc02049e6:	27660613          	addi	a2,a2,630 # ffffffffc0209c58 <commands+0xe50>
ffffffffc02049ea:	06e00593          	li	a1,110
ffffffffc02049ee:	00005517          	auipc	a0,0x5
ffffffffc02049f2:	fe250513          	addi	a0,a0,-30 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02049f6:	823fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02049fa:	00005617          	auipc	a2,0x5
ffffffffc02049fe:	fb660613          	addi	a2,a2,-74 # ffffffffc02099b0 <commands+0xba8>
ffffffffc0204a02:	06200593          	li	a1,98
ffffffffc0204a06:	00005517          	auipc	a0,0x5
ffffffffc0204a0a:	fca50513          	addi	a0,a0,-54 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0204a0e:	80bfb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0204a12 <setup_pgdir>:
ffffffffc0204a12:	1101                	addi	sp,sp,-32
ffffffffc0204a14:	e426                	sd	s1,8(sp)
ffffffffc0204a16:	84aa                	mv	s1,a0
ffffffffc0204a18:	4505                	li	a0,1
ffffffffc0204a1a:	ec06                	sd	ra,24(sp)
ffffffffc0204a1c:	e822                	sd	s0,16(sp)
ffffffffc0204a1e:	9c7fe0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0204a22:	c125                	beqz	a0,ffffffffc0204a82 <setup_pgdir+0x70>
ffffffffc0204a24:	00038797          	auipc	a5,0x38
ffffffffc0204a28:	5a478793          	addi	a5,a5,1444 # ffffffffc023cfc8 <pages>
ffffffffc0204a2c:	6394                	ld	a3,0(a5)
ffffffffc0204a2e:	00007797          	auipc	a5,0x7
ffffffffc0204a32:	08278793          	addi	a5,a5,130 # ffffffffc020bab0 <nbase>
ffffffffc0204a36:	6380                	ld	s0,0(a5)
ffffffffc0204a38:	40d506b3          	sub	a3,a0,a3
ffffffffc0204a3c:	00038797          	auipc	a5,0x38
ffffffffc0204a40:	43c78793          	addi	a5,a5,1084 # ffffffffc023ce78 <npage>
ffffffffc0204a44:	8699                	srai	a3,a3,0x6
ffffffffc0204a46:	96a2                	add	a3,a3,s0
ffffffffc0204a48:	6398                	ld	a4,0(a5)
ffffffffc0204a4a:	00c69793          	slli	a5,a3,0xc
ffffffffc0204a4e:	83b1                	srli	a5,a5,0xc
ffffffffc0204a50:	06b2                	slli	a3,a3,0xc
ffffffffc0204a52:	02e7fa63          	bgeu	a5,a4,ffffffffc0204a86 <setup_pgdir+0x74>
ffffffffc0204a56:	00038797          	auipc	a5,0x38
ffffffffc0204a5a:	56278793          	addi	a5,a5,1378 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0204a5e:	6380                	ld	s0,0(a5)
ffffffffc0204a60:	00038797          	auipc	a5,0x38
ffffffffc0204a64:	41078793          	addi	a5,a5,1040 # ffffffffc023ce70 <boot_pgdir>
ffffffffc0204a68:	638c                	ld	a1,0(a5)
ffffffffc0204a6a:	9436                	add	s0,s0,a3
ffffffffc0204a6c:	6605                	lui	a2,0x1
ffffffffc0204a6e:	8522                	mv	a0,s0
ffffffffc0204a70:	607030ef          	jal	ra,ffffffffc0208876 <memcpy>
ffffffffc0204a74:	4501                	li	a0,0
ffffffffc0204a76:	ec80                	sd	s0,24(s1)
ffffffffc0204a78:	60e2                	ld	ra,24(sp)
ffffffffc0204a7a:	6442                	ld	s0,16(sp)
ffffffffc0204a7c:	64a2                	ld	s1,8(sp)
ffffffffc0204a7e:	6105                	addi	sp,sp,32
ffffffffc0204a80:	8082                	ret
ffffffffc0204a82:	5571                	li	a0,-4
ffffffffc0204a84:	bfd5                	j	ffffffffc0204a78 <setup_pgdir+0x66>
ffffffffc0204a86:	00005617          	auipc	a2,0x5
ffffffffc0204a8a:	1aa60613          	addi	a2,a2,426 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0204a8e:	06900593          	li	a1,105
ffffffffc0204a92:	00005517          	auipc	a0,0x5
ffffffffc0204a96:	f3e50513          	addi	a0,a0,-194 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0204a9a:	f7efb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0204a9e <set_proc_name>:
ffffffffc0204a9e:	1101                	addi	sp,sp,-32
ffffffffc0204aa0:	e822                	sd	s0,16(sp)
ffffffffc0204aa2:	0b450413          	addi	s0,a0,180
ffffffffc0204aa6:	e426                	sd	s1,8(sp)
ffffffffc0204aa8:	4641                	li	a2,16
ffffffffc0204aaa:	84ae                	mv	s1,a1
ffffffffc0204aac:	8522                	mv	a0,s0
ffffffffc0204aae:	4581                	li	a1,0
ffffffffc0204ab0:	ec06                	sd	ra,24(sp)
ffffffffc0204ab2:	5b3030ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc0204ab6:	8522                	mv	a0,s0
ffffffffc0204ab8:	6442                	ld	s0,16(sp)
ffffffffc0204aba:	60e2                	ld	ra,24(sp)
ffffffffc0204abc:	85a6                	mv	a1,s1
ffffffffc0204abe:	64a2                	ld	s1,8(sp)
ffffffffc0204ac0:	463d                	li	a2,15
ffffffffc0204ac2:	6105                	addi	sp,sp,32
ffffffffc0204ac4:	5b30306f          	j	ffffffffc0208876 <memcpy>

ffffffffc0204ac8 <proc_run>:
ffffffffc0204ac8:	1101                	addi	sp,sp,-32
ffffffffc0204aca:	00038797          	auipc	a5,0x38
ffffffffc0204ace:	3b678793          	addi	a5,a5,950 # ffffffffc023ce80 <current>
ffffffffc0204ad2:	e426                	sd	s1,8(sp)
ffffffffc0204ad4:	6384                	ld	s1,0(a5)
ffffffffc0204ad6:	ec06                	sd	ra,24(sp)
ffffffffc0204ad8:	e822                	sd	s0,16(sp)
ffffffffc0204ada:	e04a                	sd	s2,0(sp)
ffffffffc0204adc:	02a48b63          	beq	s1,a0,ffffffffc0204b12 <proc_run+0x4a>
ffffffffc0204ae0:	842a                	mv	s0,a0
ffffffffc0204ae2:	100027f3          	csrr	a5,sstatus
ffffffffc0204ae6:	8b89                	andi	a5,a5,2
ffffffffc0204ae8:	4901                	li	s2,0
ffffffffc0204aea:	e3a9                	bnez	a5,ffffffffc0204b2c <proc_run+0x64>
ffffffffc0204aec:	745c                	ld	a5,168(s0)
ffffffffc0204aee:	00038717          	auipc	a4,0x38
ffffffffc0204af2:	38873923          	sd	s0,914(a4) # ffffffffc023ce80 <current>
ffffffffc0204af6:	577d                	li	a4,-1
ffffffffc0204af8:	177e                	slli	a4,a4,0x3f
ffffffffc0204afa:	83b1                	srli	a5,a5,0xc
ffffffffc0204afc:	8fd9                	or	a5,a5,a4
ffffffffc0204afe:	18079073          	csrw	satp,a5
ffffffffc0204b02:	03040593          	addi	a1,s0,48
ffffffffc0204b06:	03048513          	addi	a0,s1,48
ffffffffc0204b0a:	d03ff0ef          	jal	ra,ffffffffc020480c <switch_to>
ffffffffc0204b0e:	00091863          	bnez	s2,ffffffffc0204b1e <proc_run+0x56>
ffffffffc0204b12:	60e2                	ld	ra,24(sp)
ffffffffc0204b14:	6442                	ld	s0,16(sp)
ffffffffc0204b16:	64a2                	ld	s1,8(sp)
ffffffffc0204b18:	6902                	ld	s2,0(sp)
ffffffffc0204b1a:	6105                	addi	sp,sp,32
ffffffffc0204b1c:	8082                	ret
ffffffffc0204b1e:	6442                	ld	s0,16(sp)
ffffffffc0204b20:	60e2                	ld	ra,24(sp)
ffffffffc0204b22:	64a2                	ld	s1,8(sp)
ffffffffc0204b24:	6902                	ld	s2,0(sp)
ffffffffc0204b26:	6105                	addi	sp,sp,32
ffffffffc0204b28:	b1ffb06f          	j	ffffffffc0200646 <intr_enable>
ffffffffc0204b2c:	b21fb0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0204b30:	4905                	li	s2,1
ffffffffc0204b32:	bf6d                	j	ffffffffc0204aec <proc_run+0x24>

ffffffffc0204b34 <find_proc>:
ffffffffc0204b34:	0005071b          	sext.w	a4,a0
ffffffffc0204b38:	6789                	lui	a5,0x2
ffffffffc0204b3a:	fff7069b          	addiw	a3,a4,-1
ffffffffc0204b3e:	17f9                	addi	a5,a5,-2
ffffffffc0204b40:	04d7e063          	bltu	a5,a3,ffffffffc0204b80 <find_proc+0x4c>
ffffffffc0204b44:	1141                	addi	sp,sp,-16
ffffffffc0204b46:	e022                	sd	s0,0(sp)
ffffffffc0204b48:	45a9                	li	a1,10
ffffffffc0204b4a:	842a                	mv	s0,a0
ffffffffc0204b4c:	853a                	mv	a0,a4
ffffffffc0204b4e:	e406                	sd	ra,8(sp)
ffffffffc0204b50:	12a040ef          	jal	ra,ffffffffc0208c7a <hash32>
ffffffffc0204b54:	02051693          	slli	a3,a0,0x20
ffffffffc0204b58:	82f1                	srli	a3,a3,0x1c
ffffffffc0204b5a:	00034517          	auipc	a0,0x34
ffffffffc0204b5e:	2be50513          	addi	a0,a0,702 # ffffffffc0238e18 <hash_list>
ffffffffc0204b62:	96aa                	add	a3,a3,a0
ffffffffc0204b64:	87b6                	mv	a5,a3
ffffffffc0204b66:	a029                	j	ffffffffc0204b70 <find_proc+0x3c>
ffffffffc0204b68:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_obj___user_divzero_out_size+0x1c>
ffffffffc0204b6c:	00870c63          	beq	a4,s0,ffffffffc0204b84 <find_proc+0x50>
ffffffffc0204b70:	679c                	ld	a5,8(a5)
ffffffffc0204b72:	fef69be3          	bne	a3,a5,ffffffffc0204b68 <find_proc+0x34>
ffffffffc0204b76:	60a2                	ld	ra,8(sp)
ffffffffc0204b78:	6402                	ld	s0,0(sp)
ffffffffc0204b7a:	4501                	li	a0,0
ffffffffc0204b7c:	0141                	addi	sp,sp,16
ffffffffc0204b7e:	8082                	ret
ffffffffc0204b80:	4501                	li	a0,0
ffffffffc0204b82:	8082                	ret
ffffffffc0204b84:	60a2                	ld	ra,8(sp)
ffffffffc0204b86:	6402                	ld	s0,0(sp)
ffffffffc0204b88:	f2878513          	addi	a0,a5,-216
ffffffffc0204b8c:	0141                	addi	sp,sp,16
ffffffffc0204b8e:	8082                	ret

ffffffffc0204b90 <do_fork>:
ffffffffc0204b90:	7159                	addi	sp,sp,-112
ffffffffc0204b92:	e0d2                	sd	s4,64(sp)
ffffffffc0204b94:	00038a17          	auipc	s4,0x38
ffffffffc0204b98:	304a0a13          	addi	s4,s4,772 # ffffffffc023ce98 <nr_process>
ffffffffc0204b9c:	000a2703          	lw	a4,0(s4)
ffffffffc0204ba0:	f486                	sd	ra,104(sp)
ffffffffc0204ba2:	f0a2                	sd	s0,96(sp)
ffffffffc0204ba4:	eca6                	sd	s1,88(sp)
ffffffffc0204ba6:	e8ca                	sd	s2,80(sp)
ffffffffc0204ba8:	e4ce                	sd	s3,72(sp)
ffffffffc0204baa:	fc56                	sd	s5,56(sp)
ffffffffc0204bac:	f85a                	sd	s6,48(sp)
ffffffffc0204bae:	f45e                	sd	s7,40(sp)
ffffffffc0204bb0:	f062                	sd	s8,32(sp)
ffffffffc0204bb2:	ec66                	sd	s9,24(sp)
ffffffffc0204bb4:	e86a                	sd	s10,16(sp)
ffffffffc0204bb6:	e46e                	sd	s11,8(sp)
ffffffffc0204bb8:	6785                	lui	a5,0x1
ffffffffc0204bba:	30f75f63          	bge	a4,a5,ffffffffc0204ed8 <do_fork+0x348>
ffffffffc0204bbe:	89aa                	mv	s3,a0
ffffffffc0204bc0:	892e                	mv	s2,a1
ffffffffc0204bc2:	84b2                	mv	s1,a2
ffffffffc0204bc4:	cbbff0ef          	jal	ra,ffffffffc020487e <alloc_proc>
ffffffffc0204bc8:	842a                	mv	s0,a0
ffffffffc0204bca:	2e050963          	beqz	a0,ffffffffc0204ebc <do_fork+0x32c>
ffffffffc0204bce:	00038c17          	auipc	s8,0x38
ffffffffc0204bd2:	2b2c0c13          	addi	s8,s8,690 # ffffffffc023ce80 <current>
ffffffffc0204bd6:	000c3783          	ld	a5,0(s8)
ffffffffc0204bda:	0ec7a703          	lw	a4,236(a5) # 10ec <_binary_obj___user_faultread_out_size-0xc6c>
ffffffffc0204bde:	f11c                	sd	a5,32(a0)
ffffffffc0204be0:	30071a63          	bnez	a4,ffffffffc0204ef4 <do_fork+0x364>
ffffffffc0204be4:	4509                	li	a0,2
ffffffffc0204be6:	ffefe0ef          	jal	ra,ffffffffc02033e4 <alloc_pages>
ffffffffc0204bea:	2c050663          	beqz	a0,ffffffffc0204eb6 <do_fork+0x326>
ffffffffc0204bee:	00038a97          	auipc	s5,0x38
ffffffffc0204bf2:	3daa8a93          	addi	s5,s5,986 # ffffffffc023cfc8 <pages>
ffffffffc0204bf6:	000ab683          	ld	a3,0(s5)
ffffffffc0204bfa:	00007b17          	auipc	s6,0x7
ffffffffc0204bfe:	eb6b0b13          	addi	s6,s6,-330 # ffffffffc020bab0 <nbase>
ffffffffc0204c02:	000b3783          	ld	a5,0(s6)
ffffffffc0204c06:	40d506b3          	sub	a3,a0,a3
ffffffffc0204c0a:	8699                	srai	a3,a3,0x6
ffffffffc0204c0c:	00038b97          	auipc	s7,0x38
ffffffffc0204c10:	26cb8b93          	addi	s7,s7,620 # ffffffffc023ce78 <npage>
ffffffffc0204c14:	96be                	add	a3,a3,a5
ffffffffc0204c16:	000bb703          	ld	a4,0(s7)
ffffffffc0204c1a:	00c69793          	slli	a5,a3,0xc
ffffffffc0204c1e:	83b1                	srli	a5,a5,0xc
ffffffffc0204c20:	06b2                	slli	a3,a3,0xc
ffffffffc0204c22:	2ae7fd63          	bgeu	a5,a4,ffffffffc0204edc <do_fork+0x34c>
ffffffffc0204c26:	00038c97          	auipc	s9,0x38
ffffffffc0204c2a:	392c8c93          	addi	s9,s9,914 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0204c2e:	000c3703          	ld	a4,0(s8)
ffffffffc0204c32:	000cb783          	ld	a5,0(s9)
ffffffffc0204c36:	02873c03          	ld	s8,40(a4)
ffffffffc0204c3a:	96be                	add	a3,a3,a5
ffffffffc0204c3c:	e814                	sd	a3,16(s0)
ffffffffc0204c3e:	020c0863          	beqz	s8,ffffffffc0204c6e <do_fork+0xde>
ffffffffc0204c42:	1009f993          	andi	s3,s3,256
ffffffffc0204c46:	1e098663          	beqz	s3,ffffffffc0204e32 <do_fork+0x2a2>
ffffffffc0204c4a:	030c2703          	lw	a4,48(s8)
ffffffffc0204c4e:	018c3783          	ld	a5,24(s8)
ffffffffc0204c52:	c02006b7          	lui	a3,0xc0200
ffffffffc0204c56:	2705                	addiw	a4,a4,1
ffffffffc0204c58:	02ec2823          	sw	a4,48(s8)
ffffffffc0204c5c:	03843423          	sd	s8,40(s0)
ffffffffc0204c60:	2ad7ea63          	bltu	a5,a3,ffffffffc0204f14 <do_fork+0x384>
ffffffffc0204c64:	000cb703          	ld	a4,0(s9)
ffffffffc0204c68:	6814                	ld	a3,16(s0)
ffffffffc0204c6a:	8f99                	sub	a5,a5,a4
ffffffffc0204c6c:	f45c                	sd	a5,168(s0)
ffffffffc0204c6e:	6789                	lui	a5,0x2
ffffffffc0204c70:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_obj___user_faultreadkernel_out_size+0x30>
ffffffffc0204c74:	97b6                	add	a5,a5,a3
ffffffffc0204c76:	f05c                	sd	a5,160(s0)
ffffffffc0204c78:	873e                	mv	a4,a5
ffffffffc0204c7a:	12048893          	addi	a7,s1,288
ffffffffc0204c7e:	0004b803          	ld	a6,0(s1)
ffffffffc0204c82:	6488                	ld	a0,8(s1)
ffffffffc0204c84:	688c                	ld	a1,16(s1)
ffffffffc0204c86:	6c90                	ld	a2,24(s1)
ffffffffc0204c88:	01073023          	sd	a6,0(a4)
ffffffffc0204c8c:	e708                	sd	a0,8(a4)
ffffffffc0204c8e:	eb0c                	sd	a1,16(a4)
ffffffffc0204c90:	ef10                	sd	a2,24(a4)
ffffffffc0204c92:	02048493          	addi	s1,s1,32
ffffffffc0204c96:	02070713          	addi	a4,a4,32
ffffffffc0204c9a:	ff1492e3          	bne	s1,a7,ffffffffc0204c7e <do_fork+0xee>
ffffffffc0204c9e:	0407b823          	sd	zero,80(a5)
ffffffffc0204ca2:	12090e63          	beqz	s2,ffffffffc0204dde <do_fork+0x24e>
ffffffffc0204ca6:	0127b823          	sd	s2,16(a5)
ffffffffc0204caa:	00000717          	auipc	a4,0x0
ffffffffc0204cae:	c5870713          	addi	a4,a4,-936 # ffffffffc0204902 <forkret>
ffffffffc0204cb2:	f818                	sd	a4,48(s0)
ffffffffc0204cb4:	fc1c                	sd	a5,56(s0)
ffffffffc0204cb6:	100027f3          	csrr	a5,sstatus
ffffffffc0204cba:	8b89                	andi	a5,a5,2
ffffffffc0204cbc:	4901                	li	s2,0
ffffffffc0204cbe:	14079263          	bnez	a5,ffffffffc0204e02 <do_fork+0x272>
ffffffffc0204cc2:	0002d797          	auipc	a5,0x2d
ffffffffc0204cc6:	d4e78793          	addi	a5,a5,-690 # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204cca:	439c                	lw	a5,0(a5)
ffffffffc0204ccc:	6709                	lui	a4,0x2
ffffffffc0204cce:	0017851b          	addiw	a0,a5,1
ffffffffc0204cd2:	0002d697          	auipc	a3,0x2d
ffffffffc0204cd6:	d2a6af23          	sw	a0,-706(a3) # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204cda:	14e55563          	bge	a0,a4,ffffffffc0204e24 <do_fork+0x294>
ffffffffc0204cde:	0002d797          	auipc	a5,0x2d
ffffffffc0204ce2:	d3678793          	addi	a5,a5,-714 # ffffffffc0231a14 <next_safe.1766>
ffffffffc0204ce6:	439c                	lw	a5,0(a5)
ffffffffc0204ce8:	00038497          	auipc	s1,0x38
ffffffffc0204cec:	2e848493          	addi	s1,s1,744 # ffffffffc023cfd0 <proc_list>
ffffffffc0204cf0:	06f54063          	blt	a0,a5,ffffffffc0204d50 <do_fork+0x1c0>
ffffffffc0204cf4:	6789                	lui	a5,0x2
ffffffffc0204cf6:	0002d717          	auipc	a4,0x2d
ffffffffc0204cfa:	d0f72f23          	sw	a5,-738(a4) # ffffffffc0231a14 <next_safe.1766>
ffffffffc0204cfe:	4581                	li	a1,0
ffffffffc0204d00:	87aa                	mv	a5,a0
ffffffffc0204d02:	00038497          	auipc	s1,0x38
ffffffffc0204d06:	2ce48493          	addi	s1,s1,718 # ffffffffc023cfd0 <proc_list>
ffffffffc0204d0a:	6889                	lui	a7,0x2
ffffffffc0204d0c:	882e                	mv	a6,a1
ffffffffc0204d0e:	6609                	lui	a2,0x2
ffffffffc0204d10:	00038697          	auipc	a3,0x38
ffffffffc0204d14:	2c068693          	addi	a3,a3,704 # ffffffffc023cfd0 <proc_list>
ffffffffc0204d18:	6694                	ld	a3,8(a3)
ffffffffc0204d1a:	00968f63          	beq	a3,s1,ffffffffc0204d38 <do_fork+0x1a8>
ffffffffc0204d1e:	f3c6a703          	lw	a4,-196(a3)
ffffffffc0204d22:	0ae78963          	beq	a5,a4,ffffffffc0204dd4 <do_fork+0x244>
ffffffffc0204d26:	fee7d9e3          	bge	a5,a4,ffffffffc0204d18 <do_fork+0x188>
ffffffffc0204d2a:	fec757e3          	bge	a4,a2,ffffffffc0204d18 <do_fork+0x188>
ffffffffc0204d2e:	6694                	ld	a3,8(a3)
ffffffffc0204d30:	863a                	mv	a2,a4
ffffffffc0204d32:	4805                	li	a6,1
ffffffffc0204d34:	fe9695e3          	bne	a3,s1,ffffffffc0204d1e <do_fork+0x18e>
ffffffffc0204d38:	c591                	beqz	a1,ffffffffc0204d44 <do_fork+0x1b4>
ffffffffc0204d3a:	0002d717          	auipc	a4,0x2d
ffffffffc0204d3e:	ccf72b23          	sw	a5,-810(a4) # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204d42:	853e                	mv	a0,a5
ffffffffc0204d44:	00080663          	beqz	a6,ffffffffc0204d50 <do_fork+0x1c0>
ffffffffc0204d48:	0002d797          	auipc	a5,0x2d
ffffffffc0204d4c:	ccc7a623          	sw	a2,-820(a5) # ffffffffc0231a14 <next_safe.1766>
ffffffffc0204d50:	c048                	sw	a0,4(s0)
ffffffffc0204d52:	45a9                	li	a1,10
ffffffffc0204d54:	2501                	sext.w	a0,a0
ffffffffc0204d56:	725030ef          	jal	ra,ffffffffc0208c7a <hash32>
ffffffffc0204d5a:	1502                	slli	a0,a0,0x20
ffffffffc0204d5c:	00034797          	auipc	a5,0x34
ffffffffc0204d60:	0bc78793          	addi	a5,a5,188 # ffffffffc0238e18 <hash_list>
ffffffffc0204d64:	8171                	srli	a0,a0,0x1c
ffffffffc0204d66:	953e                	add	a0,a0,a5
ffffffffc0204d68:	650c                	ld	a1,8(a0)
ffffffffc0204d6a:	7014                	ld	a3,32(s0)
ffffffffc0204d6c:	0d840793          	addi	a5,s0,216
ffffffffc0204d70:	e19c                	sd	a5,0(a1)
ffffffffc0204d72:	6490                	ld	a2,8(s1)
ffffffffc0204d74:	e51c                	sd	a5,8(a0)
ffffffffc0204d76:	7af8                	ld	a4,240(a3)
ffffffffc0204d78:	0c840793          	addi	a5,s0,200
ffffffffc0204d7c:	f06c                	sd	a1,224(s0)
ffffffffc0204d7e:	ec68                	sd	a0,216(s0)
ffffffffc0204d80:	e21c                	sd	a5,0(a2)
ffffffffc0204d82:	00038597          	auipc	a1,0x38
ffffffffc0204d86:	24f5bb23          	sd	a5,598(a1) # ffffffffc023cfd8 <proc_list+0x8>
ffffffffc0204d8a:	e870                	sd	a2,208(s0)
ffffffffc0204d8c:	e464                	sd	s1,200(s0)
ffffffffc0204d8e:	0e043c23          	sd	zero,248(s0)
ffffffffc0204d92:	10e43023          	sd	a4,256(s0)
ffffffffc0204d96:	c311                	beqz	a4,ffffffffc0204d9a <do_fork+0x20a>
ffffffffc0204d98:	ff60                	sd	s0,248(a4)
ffffffffc0204d9a:	000a2783          	lw	a5,0(s4)
ffffffffc0204d9e:	fae0                	sd	s0,240(a3)
ffffffffc0204da0:	2785                	addiw	a5,a5,1
ffffffffc0204da2:	00038717          	auipc	a4,0x38
ffffffffc0204da6:	0ef72b23          	sw	a5,246(a4) # ffffffffc023ce98 <nr_process>
ffffffffc0204daa:	10091b63          	bnez	s2,ffffffffc0204ec0 <do_fork+0x330>
ffffffffc0204dae:	8522                	mv	a0,s0
ffffffffc0204db0:	5ef000ef          	jal	ra,ffffffffc0205b9e <wakeup_proc>
ffffffffc0204db4:	4048                	lw	a0,4(s0)
ffffffffc0204db6:	70a6                	ld	ra,104(sp)
ffffffffc0204db8:	7406                	ld	s0,96(sp)
ffffffffc0204dba:	64e6                	ld	s1,88(sp)
ffffffffc0204dbc:	6946                	ld	s2,80(sp)
ffffffffc0204dbe:	69a6                	ld	s3,72(sp)
ffffffffc0204dc0:	6a06                	ld	s4,64(sp)
ffffffffc0204dc2:	7ae2                	ld	s5,56(sp)
ffffffffc0204dc4:	7b42                	ld	s6,48(sp)
ffffffffc0204dc6:	7ba2                	ld	s7,40(sp)
ffffffffc0204dc8:	7c02                	ld	s8,32(sp)
ffffffffc0204dca:	6ce2                	ld	s9,24(sp)
ffffffffc0204dcc:	6d42                	ld	s10,16(sp)
ffffffffc0204dce:	6da2                	ld	s11,8(sp)
ffffffffc0204dd0:	6165                	addi	sp,sp,112
ffffffffc0204dd2:	8082                	ret
ffffffffc0204dd4:	2785                	addiw	a5,a5,1
ffffffffc0204dd6:	0ec7d863          	bge	a5,a2,ffffffffc0204ec6 <do_fork+0x336>
ffffffffc0204dda:	4585                	li	a1,1
ffffffffc0204ddc:	bf35                	j	ffffffffc0204d18 <do_fork+0x188>
ffffffffc0204dde:	6909                	lui	s2,0x2
ffffffffc0204de0:	edc90913          	addi	s2,s2,-292 # 1edc <_binary_obj___user_faultreadkernel_out_size+0x2c>
ffffffffc0204de4:	9936                	add	s2,s2,a3
ffffffffc0204de6:	0127b823          	sd	s2,16(a5)
ffffffffc0204dea:	00000717          	auipc	a4,0x0
ffffffffc0204dee:	b1870713          	addi	a4,a4,-1256 # ffffffffc0204902 <forkret>
ffffffffc0204df2:	f818                	sd	a4,48(s0)
ffffffffc0204df4:	fc1c                	sd	a5,56(s0)
ffffffffc0204df6:	100027f3          	csrr	a5,sstatus
ffffffffc0204dfa:	8b89                	andi	a5,a5,2
ffffffffc0204dfc:	4901                	li	s2,0
ffffffffc0204dfe:	ec0782e3          	beqz	a5,ffffffffc0204cc2 <do_fork+0x132>
ffffffffc0204e02:	84bfb0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0204e06:	0002d797          	auipc	a5,0x2d
ffffffffc0204e0a:	c0a78793          	addi	a5,a5,-1014 # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204e0e:	439c                	lw	a5,0(a5)
ffffffffc0204e10:	6709                	lui	a4,0x2
ffffffffc0204e12:	4905                	li	s2,1
ffffffffc0204e14:	0017851b          	addiw	a0,a5,1
ffffffffc0204e18:	0002d697          	auipc	a3,0x2d
ffffffffc0204e1c:	bea6ac23          	sw	a0,-1032(a3) # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204e20:	eae54fe3          	blt	a0,a4,ffffffffc0204cde <do_fork+0x14e>
ffffffffc0204e24:	4785                	li	a5,1
ffffffffc0204e26:	0002d717          	auipc	a4,0x2d
ffffffffc0204e2a:	bef72523          	sw	a5,-1046(a4) # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204e2e:	4505                	li	a0,1
ffffffffc0204e30:	b5d1                	j	ffffffffc0204cf4 <do_fork+0x164>
ffffffffc0204e32:	f51fb0ef          	jal	ra,ffffffffc0200d82 <mm_create>
ffffffffc0204e36:	8d2a                	mv	s10,a0
ffffffffc0204e38:	c539                	beqz	a0,ffffffffc0204e86 <do_fork+0x2f6>
ffffffffc0204e3a:	bd9ff0ef          	jal	ra,ffffffffc0204a12 <setup_pgdir>
ffffffffc0204e3e:	e949                	bnez	a0,ffffffffc0204ed0 <do_fork+0x340>
ffffffffc0204e40:	038c0d93          	addi	s11,s8,56
ffffffffc0204e44:	4785                	li	a5,1
ffffffffc0204e46:	40fdb7af          	amoor.d	a5,a5,(s11)
ffffffffc0204e4a:	8b85                	andi	a5,a5,1
ffffffffc0204e4c:	4985                	li	s3,1
ffffffffc0204e4e:	c799                	beqz	a5,ffffffffc0204e5c <do_fork+0x2cc>
ffffffffc0204e50:	609000ef          	jal	ra,ffffffffc0205c58 <schedule>
ffffffffc0204e54:	413db7af          	amoor.d	a5,s3,(s11)
ffffffffc0204e58:	8b85                	andi	a5,a5,1
ffffffffc0204e5a:	fbfd                	bnez	a5,ffffffffc0204e50 <do_fork+0x2c0>
ffffffffc0204e5c:	85e2                	mv	a1,s8
ffffffffc0204e5e:	856a                	mv	a0,s10
ffffffffc0204e60:	9acfc0ef          	jal	ra,ffffffffc020100c <dup_mmap>
ffffffffc0204e64:	57f9                	li	a5,-2
ffffffffc0204e66:	60fdb7af          	amoand.d	a5,a5,(s11)
ffffffffc0204e6a:	8b85                	andi	a5,a5,1
ffffffffc0204e6c:	c3e9                	beqz	a5,ffffffffc0204f2e <do_fork+0x39e>
ffffffffc0204e6e:	8c6a                	mv	s8,s10
ffffffffc0204e70:	dc050de3          	beqz	a0,ffffffffc0204c4a <do_fork+0xba>
ffffffffc0204e74:	856a                	mv	a0,s10
ffffffffc0204e76:	a32fc0ef          	jal	ra,ffffffffc02010a8 <exit_mmap>
ffffffffc0204e7a:	856a                	mv	a0,s10
ffffffffc0204e7c:	b19ff0ef          	jal	ra,ffffffffc0204994 <put_pgdir>
ffffffffc0204e80:	856a                	mv	a0,s10
ffffffffc0204e82:	886fc0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc0204e86:	6814                	ld	a3,16(s0)
ffffffffc0204e88:	c02007b7          	lui	a5,0xc0200
ffffffffc0204e8c:	0cf6e963          	bltu	a3,a5,ffffffffc0204f5e <do_fork+0x3ce>
ffffffffc0204e90:	000cb783          	ld	a5,0(s9)
ffffffffc0204e94:	000bb703          	ld	a4,0(s7)
ffffffffc0204e98:	40f687b3          	sub	a5,a3,a5
ffffffffc0204e9c:	83b1                	srli	a5,a5,0xc
ffffffffc0204e9e:	0ae7f463          	bgeu	a5,a4,ffffffffc0204f46 <do_fork+0x3b6>
ffffffffc0204ea2:	000b3703          	ld	a4,0(s6)
ffffffffc0204ea6:	000ab503          	ld	a0,0(s5)
ffffffffc0204eaa:	4589                	li	a1,2
ffffffffc0204eac:	8f99                	sub	a5,a5,a4
ffffffffc0204eae:	079a                	slli	a5,a5,0x6
ffffffffc0204eb0:	953e                	add	a0,a0,a5
ffffffffc0204eb2:	dbafe0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0204eb6:	8522                	mv	a0,s0
ffffffffc0204eb8:	818fd0ef          	jal	ra,ffffffffc0201ed0 <kfree>
ffffffffc0204ebc:	5571                	li	a0,-4
ffffffffc0204ebe:	bde5                	j	ffffffffc0204db6 <do_fork+0x226>
ffffffffc0204ec0:	f86fb0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0204ec4:	b5ed                	j	ffffffffc0204dae <do_fork+0x21e>
ffffffffc0204ec6:	0117c363          	blt	a5,a7,ffffffffc0204ecc <do_fork+0x33c>
ffffffffc0204eca:	4785                	li	a5,1
ffffffffc0204ecc:	4585                	li	a1,1
ffffffffc0204ece:	bd3d                	j	ffffffffc0204d0c <do_fork+0x17c>
ffffffffc0204ed0:	856a                	mv	a0,s10
ffffffffc0204ed2:	836fc0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc0204ed6:	bf45                	j	ffffffffc0204e86 <do_fork+0x2f6>
ffffffffc0204ed8:	556d                	li	a0,-5
ffffffffc0204eda:	bdf1                	j	ffffffffc0204db6 <do_fork+0x226>
ffffffffc0204edc:	00005617          	auipc	a2,0x5
ffffffffc0204ee0:	d5460613          	addi	a2,a2,-684 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0204ee4:	06900593          	li	a1,105
ffffffffc0204ee8:	00005517          	auipc	a0,0x5
ffffffffc0204eec:	ae850513          	addi	a0,a0,-1304 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0204ef0:	b28fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204ef4:	00006697          	auipc	a3,0x6
ffffffffc0204ef8:	d2468693          	addi	a3,a3,-732 # ffffffffc020ac18 <default_pmm_manager+0x818>
ffffffffc0204efc:	00004617          	auipc	a2,0x4
ffffffffc0204f00:	38c60613          	addi	a2,a2,908 # ffffffffc0209288 <commands+0x480>
ffffffffc0204f04:	1a900593          	li	a1,425
ffffffffc0204f08:	00006517          	auipc	a0,0x6
ffffffffc0204f0c:	fb050513          	addi	a0,a0,-80 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0204f10:	b08fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204f14:	86be                	mv	a3,a5
ffffffffc0204f16:	00005617          	auipc	a2,0x5
ffffffffc0204f1a:	d4260613          	addi	a2,a2,-702 # ffffffffc0209c58 <commands+0xe50>
ffffffffc0204f1e:	15c00593          	li	a1,348
ffffffffc0204f22:	00006517          	auipc	a0,0x6
ffffffffc0204f26:	f9650513          	addi	a0,a0,-106 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0204f2a:	aeefb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204f2e:	00006617          	auipc	a2,0x6
ffffffffc0204f32:	d0a60613          	addi	a2,a2,-758 # ffffffffc020ac38 <default_pmm_manager+0x838>
ffffffffc0204f36:	03200593          	li	a1,50
ffffffffc0204f3a:	00006517          	auipc	a0,0x6
ffffffffc0204f3e:	d0e50513          	addi	a0,a0,-754 # ffffffffc020ac48 <default_pmm_manager+0x848>
ffffffffc0204f42:	ad6fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204f46:	00005617          	auipc	a2,0x5
ffffffffc0204f4a:	a6a60613          	addi	a2,a2,-1430 # ffffffffc02099b0 <commands+0xba8>
ffffffffc0204f4e:	06200593          	li	a1,98
ffffffffc0204f52:	00005517          	auipc	a0,0x5
ffffffffc0204f56:	a7e50513          	addi	a0,a0,-1410 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0204f5a:	abefb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0204f5e:	00005617          	auipc	a2,0x5
ffffffffc0204f62:	cfa60613          	addi	a2,a2,-774 # ffffffffc0209c58 <commands+0xe50>
ffffffffc0204f66:	06e00593          	li	a1,110
ffffffffc0204f6a:	00005517          	auipc	a0,0x5
ffffffffc0204f6e:	a6650513          	addi	a0,a0,-1434 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0204f72:	aa6fb0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0204f76 <kernel_thread>:
ffffffffc0204f76:	7129                	addi	sp,sp,-320
ffffffffc0204f78:	fa22                	sd	s0,304(sp)
ffffffffc0204f7a:	f626                	sd	s1,296(sp)
ffffffffc0204f7c:	f24a                	sd	s2,288(sp)
ffffffffc0204f7e:	84ae                	mv	s1,a1
ffffffffc0204f80:	892a                	mv	s2,a0
ffffffffc0204f82:	8432                	mv	s0,a2
ffffffffc0204f84:	4581                	li	a1,0
ffffffffc0204f86:	12000613          	li	a2,288
ffffffffc0204f8a:	850a                	mv	a0,sp
ffffffffc0204f8c:	fe06                	sd	ra,312(sp)
ffffffffc0204f8e:	0d7030ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc0204f92:	e0ca                	sd	s2,64(sp)
ffffffffc0204f94:	e4a6                	sd	s1,72(sp)
ffffffffc0204f96:	100027f3          	csrr	a5,sstatus
ffffffffc0204f9a:	edd7f793          	andi	a5,a5,-291
ffffffffc0204f9e:	1207e793          	ori	a5,a5,288
ffffffffc0204fa2:	e23e                	sd	a5,256(sp)
ffffffffc0204fa4:	860a                	mv	a2,sp
ffffffffc0204fa6:	10046513          	ori	a0,s0,256
ffffffffc0204faa:	00000797          	auipc	a5,0x0
ffffffffc0204fae:	8cc78793          	addi	a5,a5,-1844 # ffffffffc0204876 <kernel_thread_entry>
ffffffffc0204fb2:	4581                	li	a1,0
ffffffffc0204fb4:	e63e                	sd	a5,264(sp)
ffffffffc0204fb6:	bdbff0ef          	jal	ra,ffffffffc0204b90 <do_fork>
ffffffffc0204fba:	70f2                	ld	ra,312(sp)
ffffffffc0204fbc:	7452                	ld	s0,304(sp)
ffffffffc0204fbe:	74b2                	ld	s1,296(sp)
ffffffffc0204fc0:	7912                	ld	s2,288(sp)
ffffffffc0204fc2:	6131                	addi	sp,sp,320
ffffffffc0204fc4:	8082                	ret

ffffffffc0204fc6 <do_exit>:
ffffffffc0204fc6:	7179                	addi	sp,sp,-48
ffffffffc0204fc8:	e84a                	sd	s2,16(sp)
ffffffffc0204fca:	00038717          	auipc	a4,0x38
ffffffffc0204fce:	ebe70713          	addi	a4,a4,-322 # ffffffffc023ce88 <idleproc>
ffffffffc0204fd2:	00038917          	auipc	s2,0x38
ffffffffc0204fd6:	eae90913          	addi	s2,s2,-338 # ffffffffc023ce80 <current>
ffffffffc0204fda:	00093783          	ld	a5,0(s2)
ffffffffc0204fde:	6318                	ld	a4,0(a4)
ffffffffc0204fe0:	f406                	sd	ra,40(sp)
ffffffffc0204fe2:	f022                	sd	s0,32(sp)
ffffffffc0204fe4:	ec26                	sd	s1,24(sp)
ffffffffc0204fe6:	e44e                	sd	s3,8(sp)
ffffffffc0204fe8:	e052                	sd	s4,0(sp)
ffffffffc0204fea:	0ce78c63          	beq	a5,a4,ffffffffc02050c2 <do_exit+0xfc>
ffffffffc0204fee:	00038417          	auipc	s0,0x38
ffffffffc0204ff2:	ea240413          	addi	s0,s0,-350 # ffffffffc023ce90 <initproc>
ffffffffc0204ff6:	6018                	ld	a4,0(s0)
ffffffffc0204ff8:	0ee78b63          	beq	a5,a4,ffffffffc02050ee <do_exit+0x128>
ffffffffc0204ffc:	7784                	ld	s1,40(a5)
ffffffffc0204ffe:	89aa                	mv	s3,a0
ffffffffc0205000:	c48d                	beqz	s1,ffffffffc020502a <do_exit+0x64>
ffffffffc0205002:	00038797          	auipc	a5,0x38
ffffffffc0205006:	fbe78793          	addi	a5,a5,-66 # ffffffffc023cfc0 <boot_cr3>
ffffffffc020500a:	639c                	ld	a5,0(a5)
ffffffffc020500c:	577d                	li	a4,-1
ffffffffc020500e:	177e                	slli	a4,a4,0x3f
ffffffffc0205010:	83b1                	srli	a5,a5,0xc
ffffffffc0205012:	8fd9                	or	a5,a5,a4
ffffffffc0205014:	18079073          	csrw	satp,a5
ffffffffc0205018:	589c                	lw	a5,48(s1)
ffffffffc020501a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020501e:	d898                	sw	a4,48(s1)
ffffffffc0205020:	cf4d                	beqz	a4,ffffffffc02050da <do_exit+0x114>
ffffffffc0205022:	00093783          	ld	a5,0(s2)
ffffffffc0205026:	0207b423          	sd	zero,40(a5)
ffffffffc020502a:	00093783          	ld	a5,0(s2)
ffffffffc020502e:	470d                	li	a4,3
ffffffffc0205030:	c398                	sw	a4,0(a5)
ffffffffc0205032:	0f37a423          	sw	s3,232(a5)
ffffffffc0205036:	100027f3          	csrr	a5,sstatus
ffffffffc020503a:	8b89                	andi	a5,a5,2
ffffffffc020503c:	4a01                	li	s4,0
ffffffffc020503e:	e7e1                	bnez	a5,ffffffffc0205106 <do_exit+0x140>
ffffffffc0205040:	00093703          	ld	a4,0(s2)
ffffffffc0205044:	800007b7          	lui	a5,0x80000
ffffffffc0205048:	0785                	addi	a5,a5,1
ffffffffc020504a:	7308                	ld	a0,32(a4)
ffffffffc020504c:	0ec52703          	lw	a4,236(a0)
ffffffffc0205050:	0af70f63          	beq	a4,a5,ffffffffc020510e <do_exit+0x148>
ffffffffc0205054:	00093683          	ld	a3,0(s2)
ffffffffc0205058:	800009b7          	lui	s3,0x80000
ffffffffc020505c:	448d                	li	s1,3
ffffffffc020505e:	0985                	addi	s3,s3,1
ffffffffc0205060:	7afc                	ld	a5,240(a3)
ffffffffc0205062:	cb95                	beqz	a5,ffffffffc0205096 <do_exit+0xd0>
ffffffffc0205064:	1007b703          	ld	a4,256(a5) # ffffffff80000100 <_binary_obj___user_matrix_out_size+0xffffffff7fffd7c8>
ffffffffc0205068:	6008                	ld	a0,0(s0)
ffffffffc020506a:	faf8                	sd	a4,240(a3)
ffffffffc020506c:	7978                	ld	a4,240(a0)
ffffffffc020506e:	0e07bc23          	sd	zero,248(a5)
ffffffffc0205072:	10e7b023          	sd	a4,256(a5)
ffffffffc0205076:	c311                	beqz	a4,ffffffffc020507a <do_exit+0xb4>
ffffffffc0205078:	ff7c                	sd	a5,248(a4)
ffffffffc020507a:	4398                	lw	a4,0(a5)
ffffffffc020507c:	f388                	sd	a0,32(a5)
ffffffffc020507e:	f97c                	sd	a5,240(a0)
ffffffffc0205080:	fe9710e3          	bne	a4,s1,ffffffffc0205060 <do_exit+0x9a>
ffffffffc0205084:	0ec52783          	lw	a5,236(a0)
ffffffffc0205088:	fd379ce3          	bne	a5,s3,ffffffffc0205060 <do_exit+0x9a>
ffffffffc020508c:	313000ef          	jal	ra,ffffffffc0205b9e <wakeup_proc>
ffffffffc0205090:	00093683          	ld	a3,0(s2)
ffffffffc0205094:	b7f1                	j	ffffffffc0205060 <do_exit+0x9a>
ffffffffc0205096:	020a1363          	bnez	s4,ffffffffc02050bc <do_exit+0xf6>
ffffffffc020509a:	3bf000ef          	jal	ra,ffffffffc0205c58 <schedule>
ffffffffc020509e:	00093783          	ld	a5,0(s2)
ffffffffc02050a2:	00006617          	auipc	a2,0x6
ffffffffc02050a6:	b5660613          	addi	a2,a2,-1194 # ffffffffc020abf8 <default_pmm_manager+0x7f8>
ffffffffc02050aa:	1fc00593          	li	a1,508
ffffffffc02050ae:	43d4                	lw	a3,4(a5)
ffffffffc02050b0:	00006517          	auipc	a0,0x6
ffffffffc02050b4:	e0850513          	addi	a0,a0,-504 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02050b8:	960fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02050bc:	d8afb0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc02050c0:	bfe9                	j	ffffffffc020509a <do_exit+0xd4>
ffffffffc02050c2:	00006617          	auipc	a2,0x6
ffffffffc02050c6:	b1660613          	addi	a2,a2,-1258 # ffffffffc020abd8 <default_pmm_manager+0x7d8>
ffffffffc02050ca:	1d000593          	li	a1,464
ffffffffc02050ce:	00006517          	auipc	a0,0x6
ffffffffc02050d2:	dea50513          	addi	a0,a0,-534 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02050d6:	942fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02050da:	8526                	mv	a0,s1
ffffffffc02050dc:	fcdfb0ef          	jal	ra,ffffffffc02010a8 <exit_mmap>
ffffffffc02050e0:	8526                	mv	a0,s1
ffffffffc02050e2:	8b3ff0ef          	jal	ra,ffffffffc0204994 <put_pgdir>
ffffffffc02050e6:	8526                	mv	a0,s1
ffffffffc02050e8:	e21fb0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc02050ec:	bf1d                	j	ffffffffc0205022 <do_exit+0x5c>
ffffffffc02050ee:	00006617          	auipc	a2,0x6
ffffffffc02050f2:	afa60613          	addi	a2,a2,-1286 # ffffffffc020abe8 <default_pmm_manager+0x7e8>
ffffffffc02050f6:	1d300593          	li	a1,467
ffffffffc02050fa:	00006517          	auipc	a0,0x6
ffffffffc02050fe:	dbe50513          	addi	a0,a0,-578 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0205102:	916fb0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0205106:	d46fb0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc020510a:	4a05                	li	s4,1
ffffffffc020510c:	bf15                	j	ffffffffc0205040 <do_exit+0x7a>
ffffffffc020510e:	291000ef          	jal	ra,ffffffffc0205b9e <wakeup_proc>
ffffffffc0205112:	b789                	j	ffffffffc0205054 <do_exit+0x8e>

ffffffffc0205114 <do_wait.part.1>:
ffffffffc0205114:	7139                	addi	sp,sp,-64
ffffffffc0205116:	e852                	sd	s4,16(sp)
ffffffffc0205118:	80000a37          	lui	s4,0x80000
ffffffffc020511c:	f426                	sd	s1,40(sp)
ffffffffc020511e:	f04a                	sd	s2,32(sp)
ffffffffc0205120:	ec4e                	sd	s3,24(sp)
ffffffffc0205122:	e456                	sd	s5,8(sp)
ffffffffc0205124:	e05a                	sd	s6,0(sp)
ffffffffc0205126:	fc06                	sd	ra,56(sp)
ffffffffc0205128:	f822                	sd	s0,48(sp)
ffffffffc020512a:	89aa                	mv	s3,a0
ffffffffc020512c:	8b2e                	mv	s6,a1
ffffffffc020512e:	00038917          	auipc	s2,0x38
ffffffffc0205132:	d5290913          	addi	s2,s2,-686 # ffffffffc023ce80 <current>
ffffffffc0205136:	448d                	li	s1,3
ffffffffc0205138:	4a85                	li	s5,1
ffffffffc020513a:	0a05                	addi	s4,s4,1
ffffffffc020513c:	02098f63          	beqz	s3,ffffffffc020517a <do_wait.part.1+0x66>
ffffffffc0205140:	854e                	mv	a0,s3
ffffffffc0205142:	9f3ff0ef          	jal	ra,ffffffffc0204b34 <find_proc>
ffffffffc0205146:	842a                	mv	s0,a0
ffffffffc0205148:	12050063          	beqz	a0,ffffffffc0205268 <do_wait.part.1+0x154>
ffffffffc020514c:	00093703          	ld	a4,0(s2)
ffffffffc0205150:	711c                	ld	a5,32(a0)
ffffffffc0205152:	10e79b63          	bne	a5,a4,ffffffffc0205268 <do_wait.part.1+0x154>
ffffffffc0205156:	411c                	lw	a5,0(a0)
ffffffffc0205158:	02978c63          	beq	a5,s1,ffffffffc0205190 <do_wait.part.1+0x7c>
ffffffffc020515c:	01572023          	sw	s5,0(a4)
ffffffffc0205160:	0f472623          	sw	s4,236(a4)
ffffffffc0205164:	2f5000ef          	jal	ra,ffffffffc0205c58 <schedule>
ffffffffc0205168:	00093783          	ld	a5,0(s2)
ffffffffc020516c:	0b07a783          	lw	a5,176(a5)
ffffffffc0205170:	8b85                	andi	a5,a5,1
ffffffffc0205172:	d7e9                	beqz	a5,ffffffffc020513c <do_wait.part.1+0x28>
ffffffffc0205174:	555d                	li	a0,-9
ffffffffc0205176:	e51ff0ef          	jal	ra,ffffffffc0204fc6 <do_exit>
ffffffffc020517a:	00093703          	ld	a4,0(s2)
ffffffffc020517e:	7b60                	ld	s0,240(a4)
ffffffffc0205180:	e409                	bnez	s0,ffffffffc020518a <do_wait.part.1+0x76>
ffffffffc0205182:	a0dd                	j	ffffffffc0205268 <do_wait.part.1+0x154>
ffffffffc0205184:	10043403          	ld	s0,256(s0)
ffffffffc0205188:	d871                	beqz	s0,ffffffffc020515c <do_wait.part.1+0x48>
ffffffffc020518a:	401c                	lw	a5,0(s0)
ffffffffc020518c:	fe979ce3          	bne	a5,s1,ffffffffc0205184 <do_wait.part.1+0x70>
ffffffffc0205190:	00038797          	auipc	a5,0x38
ffffffffc0205194:	cf878793          	addi	a5,a5,-776 # ffffffffc023ce88 <idleproc>
ffffffffc0205198:	639c                	ld	a5,0(a5)
ffffffffc020519a:	0c878d63          	beq	a5,s0,ffffffffc0205274 <do_wait.part.1+0x160>
ffffffffc020519e:	00038797          	auipc	a5,0x38
ffffffffc02051a2:	cf278793          	addi	a5,a5,-782 # ffffffffc023ce90 <initproc>
ffffffffc02051a6:	639c                	ld	a5,0(a5)
ffffffffc02051a8:	0cf40663          	beq	s0,a5,ffffffffc0205274 <do_wait.part.1+0x160>
ffffffffc02051ac:	000b0663          	beqz	s6,ffffffffc02051b8 <do_wait.part.1+0xa4>
ffffffffc02051b0:	0e842783          	lw	a5,232(s0)
ffffffffc02051b4:	00fb2023          	sw	a5,0(s6)
ffffffffc02051b8:	100027f3          	csrr	a5,sstatus
ffffffffc02051bc:	8b89                	andi	a5,a5,2
ffffffffc02051be:	4581                	li	a1,0
ffffffffc02051c0:	e7d5                	bnez	a5,ffffffffc020526c <do_wait.part.1+0x158>
ffffffffc02051c2:	6c70                	ld	a2,216(s0)
ffffffffc02051c4:	7074                	ld	a3,224(s0)
ffffffffc02051c6:	10043703          	ld	a4,256(s0)
ffffffffc02051ca:	7c7c                	ld	a5,248(s0)
ffffffffc02051cc:	e614                	sd	a3,8(a2)
ffffffffc02051ce:	e290                	sd	a2,0(a3)
ffffffffc02051d0:	6470                	ld	a2,200(s0)
ffffffffc02051d2:	6874                	ld	a3,208(s0)
ffffffffc02051d4:	e614                	sd	a3,8(a2)
ffffffffc02051d6:	e290                	sd	a2,0(a3)
ffffffffc02051d8:	c319                	beqz	a4,ffffffffc02051de <do_wait.part.1+0xca>
ffffffffc02051da:	ff7c                	sd	a5,248(a4)
ffffffffc02051dc:	7c7c                	ld	a5,248(s0)
ffffffffc02051de:	c3d1                	beqz	a5,ffffffffc0205262 <do_wait.part.1+0x14e>
ffffffffc02051e0:	10e7b023          	sd	a4,256(a5)
ffffffffc02051e4:	00038797          	auipc	a5,0x38
ffffffffc02051e8:	cb478793          	addi	a5,a5,-844 # ffffffffc023ce98 <nr_process>
ffffffffc02051ec:	439c                	lw	a5,0(a5)
ffffffffc02051ee:	37fd                	addiw	a5,a5,-1
ffffffffc02051f0:	00038717          	auipc	a4,0x38
ffffffffc02051f4:	caf72423          	sw	a5,-856(a4) # ffffffffc023ce98 <nr_process>
ffffffffc02051f8:	e1b5                	bnez	a1,ffffffffc020525c <do_wait.part.1+0x148>
ffffffffc02051fa:	6814                	ld	a3,16(s0)
ffffffffc02051fc:	c02007b7          	lui	a5,0xc0200
ffffffffc0205200:	0af6e263          	bltu	a3,a5,ffffffffc02052a4 <do_wait.part.1+0x190>
ffffffffc0205204:	00038797          	auipc	a5,0x38
ffffffffc0205208:	db478793          	addi	a5,a5,-588 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc020520c:	6398                	ld	a4,0(a5)
ffffffffc020520e:	00038797          	auipc	a5,0x38
ffffffffc0205212:	c6a78793          	addi	a5,a5,-918 # ffffffffc023ce78 <npage>
ffffffffc0205216:	639c                	ld	a5,0(a5)
ffffffffc0205218:	8e99                	sub	a3,a3,a4
ffffffffc020521a:	82b1                	srli	a3,a3,0xc
ffffffffc020521c:	06f6f863          	bgeu	a3,a5,ffffffffc020528c <do_wait.part.1+0x178>
ffffffffc0205220:	00007797          	auipc	a5,0x7
ffffffffc0205224:	89078793          	addi	a5,a5,-1904 # ffffffffc020bab0 <nbase>
ffffffffc0205228:	639c                	ld	a5,0(a5)
ffffffffc020522a:	00038717          	auipc	a4,0x38
ffffffffc020522e:	d9e70713          	addi	a4,a4,-610 # ffffffffc023cfc8 <pages>
ffffffffc0205232:	6308                	ld	a0,0(a4)
ffffffffc0205234:	8e9d                	sub	a3,a3,a5
ffffffffc0205236:	069a                	slli	a3,a3,0x6
ffffffffc0205238:	9536                	add	a0,a0,a3
ffffffffc020523a:	4589                	li	a1,2
ffffffffc020523c:	a30fe0ef          	jal	ra,ffffffffc020346c <free_pages>
ffffffffc0205240:	8522                	mv	a0,s0
ffffffffc0205242:	c8ffc0ef          	jal	ra,ffffffffc0201ed0 <kfree>
ffffffffc0205246:	4501                	li	a0,0
ffffffffc0205248:	70e2                	ld	ra,56(sp)
ffffffffc020524a:	7442                	ld	s0,48(sp)
ffffffffc020524c:	74a2                	ld	s1,40(sp)
ffffffffc020524e:	7902                	ld	s2,32(sp)
ffffffffc0205250:	69e2                	ld	s3,24(sp)
ffffffffc0205252:	6a42                	ld	s4,16(sp)
ffffffffc0205254:	6aa2                	ld	s5,8(sp)
ffffffffc0205256:	6b02                	ld	s6,0(sp)
ffffffffc0205258:	6121                	addi	sp,sp,64
ffffffffc020525a:	8082                	ret
ffffffffc020525c:	beafb0ef          	jal	ra,ffffffffc0200646 <intr_enable>
ffffffffc0205260:	bf69                	j	ffffffffc02051fa <do_wait.part.1+0xe6>
ffffffffc0205262:	701c                	ld	a5,32(s0)
ffffffffc0205264:	fbf8                	sd	a4,240(a5)
ffffffffc0205266:	bfbd                	j	ffffffffc02051e4 <do_wait.part.1+0xd0>
ffffffffc0205268:	5579                	li	a0,-2
ffffffffc020526a:	bff9                	j	ffffffffc0205248 <do_wait.part.1+0x134>
ffffffffc020526c:	be0fb0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0205270:	4585                	li	a1,1
ffffffffc0205272:	bf81                	j	ffffffffc02051c2 <do_wait.part.1+0xae>
ffffffffc0205274:	00006617          	auipc	a2,0x6
ffffffffc0205278:	9ec60613          	addi	a2,a2,-1556 # ffffffffc020ac60 <default_pmm_manager+0x860>
ffffffffc020527c:	2f900593          	li	a1,761
ffffffffc0205280:	00006517          	auipc	a0,0x6
ffffffffc0205284:	c3850513          	addi	a0,a0,-968 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0205288:	f91fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020528c:	00004617          	auipc	a2,0x4
ffffffffc0205290:	72460613          	addi	a2,a2,1828 # ffffffffc02099b0 <commands+0xba8>
ffffffffc0205294:	06200593          	li	a1,98
ffffffffc0205298:	00004517          	auipc	a0,0x4
ffffffffc020529c:	73850513          	addi	a0,a0,1848 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02052a0:	f79fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02052a4:	00005617          	auipc	a2,0x5
ffffffffc02052a8:	9b460613          	addi	a2,a2,-1612 # ffffffffc0209c58 <commands+0xe50>
ffffffffc02052ac:	06e00593          	li	a1,110
ffffffffc02052b0:	00004517          	auipc	a0,0x4
ffffffffc02052b4:	72050513          	addi	a0,a0,1824 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc02052b8:	f61fa0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02052bc <init_main>:
ffffffffc02052bc:	1141                	addi	sp,sp,-16
ffffffffc02052be:	e406                	sd	ra,8(sp)
ffffffffc02052c0:	9f2fe0ef          	jal	ra,ffffffffc02034b2 <nr_free_pages>
ffffffffc02052c4:	b4dfc0ef          	jal	ra,ffffffffc0201e10 <kallocated>
ffffffffc02052c8:	4601                	li	a2,0
ffffffffc02052ca:	4581                	li	a1,0
ffffffffc02052cc:	fffff517          	auipc	a0,0xfffff
ffffffffc02052d0:	64650513          	addi	a0,a0,1606 # ffffffffc0204912 <user_main>
ffffffffc02052d4:	ca3ff0ef          	jal	ra,ffffffffc0204f76 <kernel_thread>
ffffffffc02052d8:	00a04563          	bgtz	a0,ffffffffc02052e2 <init_main+0x26>
ffffffffc02052dc:	a841                	j	ffffffffc020536c <init_main+0xb0>
ffffffffc02052de:	17b000ef          	jal	ra,ffffffffc0205c58 <schedule>
ffffffffc02052e2:	4581                	li	a1,0
ffffffffc02052e4:	4501                	li	a0,0
ffffffffc02052e6:	e2fff0ef          	jal	ra,ffffffffc0205114 <do_wait.part.1>
ffffffffc02052ea:	d975                	beqz	a0,ffffffffc02052de <init_main+0x22>
ffffffffc02052ec:	00006517          	auipc	a0,0x6
ffffffffc02052f0:	9b450513          	addi	a0,a0,-1612 # ffffffffc020aca0 <default_pmm_manager+0x8a0>
ffffffffc02052f4:	de1fa0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc02052f8:	00038797          	auipc	a5,0x38
ffffffffc02052fc:	b9878793          	addi	a5,a5,-1128 # ffffffffc023ce90 <initproc>
ffffffffc0205300:	639c                	ld	a5,0(a5)
ffffffffc0205302:	7bf8                	ld	a4,240(a5)
ffffffffc0205304:	e721                	bnez	a4,ffffffffc020534c <init_main+0x90>
ffffffffc0205306:	7ff8                	ld	a4,248(a5)
ffffffffc0205308:	e331                	bnez	a4,ffffffffc020534c <init_main+0x90>
ffffffffc020530a:	1007b703          	ld	a4,256(a5)
ffffffffc020530e:	ef1d                	bnez	a4,ffffffffc020534c <init_main+0x90>
ffffffffc0205310:	00038717          	auipc	a4,0x38
ffffffffc0205314:	b8870713          	addi	a4,a4,-1144 # ffffffffc023ce98 <nr_process>
ffffffffc0205318:	4314                	lw	a3,0(a4)
ffffffffc020531a:	4709                	li	a4,2
ffffffffc020531c:	0ae69463          	bne	a3,a4,ffffffffc02053c4 <init_main+0x108>
ffffffffc0205320:	00038697          	auipc	a3,0x38
ffffffffc0205324:	cb068693          	addi	a3,a3,-848 # ffffffffc023cfd0 <proc_list>
ffffffffc0205328:	6698                	ld	a4,8(a3)
ffffffffc020532a:	0c878793          	addi	a5,a5,200
ffffffffc020532e:	06f71b63          	bne	a4,a5,ffffffffc02053a4 <init_main+0xe8>
ffffffffc0205332:	629c                	ld	a5,0(a3)
ffffffffc0205334:	04f71863          	bne	a4,a5,ffffffffc0205384 <init_main+0xc8>
ffffffffc0205338:	00006517          	auipc	a0,0x6
ffffffffc020533c:	a5050513          	addi	a0,a0,-1456 # ffffffffc020ad88 <default_pmm_manager+0x988>
ffffffffc0205340:	d95fa0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0205344:	60a2                	ld	ra,8(sp)
ffffffffc0205346:	4501                	li	a0,0
ffffffffc0205348:	0141                	addi	sp,sp,16
ffffffffc020534a:	8082                	ret
ffffffffc020534c:	00006697          	auipc	a3,0x6
ffffffffc0205350:	97c68693          	addi	a3,a3,-1668 # ffffffffc020acc8 <default_pmm_manager+0x8c8>
ffffffffc0205354:	00004617          	auipc	a2,0x4
ffffffffc0205358:	f3460613          	addi	a2,a2,-204 # ffffffffc0209288 <commands+0x480>
ffffffffc020535c:	35d00593          	li	a1,861
ffffffffc0205360:	00006517          	auipc	a0,0x6
ffffffffc0205364:	b5850513          	addi	a0,a0,-1192 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0205368:	eb1fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020536c:	00006617          	auipc	a2,0x6
ffffffffc0205370:	91460613          	addi	a2,a2,-1772 # ffffffffc020ac80 <default_pmm_manager+0x880>
ffffffffc0205374:	35500593          	li	a1,853
ffffffffc0205378:	00006517          	auipc	a0,0x6
ffffffffc020537c:	b4050513          	addi	a0,a0,-1216 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0205380:	e99fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0205384:	00006697          	auipc	a3,0x6
ffffffffc0205388:	9d468693          	addi	a3,a3,-1580 # ffffffffc020ad58 <default_pmm_manager+0x958>
ffffffffc020538c:	00004617          	auipc	a2,0x4
ffffffffc0205390:	efc60613          	addi	a2,a2,-260 # ffffffffc0209288 <commands+0x480>
ffffffffc0205394:	36000593          	li	a1,864
ffffffffc0205398:	00006517          	auipc	a0,0x6
ffffffffc020539c:	b2050513          	addi	a0,a0,-1248 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02053a0:	e79fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02053a4:	00006697          	auipc	a3,0x6
ffffffffc02053a8:	98468693          	addi	a3,a3,-1660 # ffffffffc020ad28 <default_pmm_manager+0x928>
ffffffffc02053ac:	00004617          	auipc	a2,0x4
ffffffffc02053b0:	edc60613          	addi	a2,a2,-292 # ffffffffc0209288 <commands+0x480>
ffffffffc02053b4:	35f00593          	li	a1,863
ffffffffc02053b8:	00006517          	auipc	a0,0x6
ffffffffc02053bc:	b0050513          	addi	a0,a0,-1280 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02053c0:	e59fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02053c4:	00006697          	auipc	a3,0x6
ffffffffc02053c8:	95468693          	addi	a3,a3,-1708 # ffffffffc020ad18 <default_pmm_manager+0x918>
ffffffffc02053cc:	00004617          	auipc	a2,0x4
ffffffffc02053d0:	ebc60613          	addi	a2,a2,-324 # ffffffffc0209288 <commands+0x480>
ffffffffc02053d4:	35e00593          	li	a1,862
ffffffffc02053d8:	00006517          	auipc	a0,0x6
ffffffffc02053dc:	ae050513          	addi	a0,a0,-1312 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02053e0:	e39fa0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02053e4 <do_execve>:
ffffffffc02053e4:	7135                	addi	sp,sp,-160
ffffffffc02053e6:	f8d2                	sd	s4,112(sp)
ffffffffc02053e8:	00038a17          	auipc	s4,0x38
ffffffffc02053ec:	a98a0a13          	addi	s4,s4,-1384 # ffffffffc023ce80 <current>
ffffffffc02053f0:	000a3783          	ld	a5,0(s4)
ffffffffc02053f4:	e14a                	sd	s2,128(sp)
ffffffffc02053f6:	e922                	sd	s0,144(sp)
ffffffffc02053f8:	0287b903          	ld	s2,40(a5)
ffffffffc02053fc:	fcce                	sd	s3,120(sp)
ffffffffc02053fe:	f0da                	sd	s6,96(sp)
ffffffffc0205400:	89aa                	mv	s3,a0
ffffffffc0205402:	842e                	mv	s0,a1
ffffffffc0205404:	8b32                	mv	s6,a2
ffffffffc0205406:	4681                	li	a3,0
ffffffffc0205408:	862e                	mv	a2,a1
ffffffffc020540a:	85aa                	mv	a1,a0
ffffffffc020540c:	854a                	mv	a0,s2
ffffffffc020540e:	ed06                	sd	ra,152(sp)
ffffffffc0205410:	e526                	sd	s1,136(sp)
ffffffffc0205412:	f4d6                	sd	s5,104(sp)
ffffffffc0205414:	ecde                	sd	s7,88(sp)
ffffffffc0205416:	e8e2                	sd	s8,80(sp)
ffffffffc0205418:	e4e6                	sd	s9,72(sp)
ffffffffc020541a:	e0ea                	sd	s10,64(sp)
ffffffffc020541c:	fc6e                	sd	s11,56(sp)
ffffffffc020541e:	adafc0ef          	jal	ra,ffffffffc02016f8 <user_mem_check>
ffffffffc0205422:	40050263          	beqz	a0,ffffffffc0205826 <do_execve+0x442>
ffffffffc0205426:	4641                	li	a2,16
ffffffffc0205428:	4581                	li	a1,0
ffffffffc020542a:	1008                	addi	a0,sp,32
ffffffffc020542c:	438030ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc0205430:	47bd                	li	a5,15
ffffffffc0205432:	8622                	mv	a2,s0
ffffffffc0205434:	0687ee63          	bltu	a5,s0,ffffffffc02054b0 <do_execve+0xcc>
ffffffffc0205438:	85ce                	mv	a1,s3
ffffffffc020543a:	1008                	addi	a0,sp,32
ffffffffc020543c:	43a030ef          	jal	ra,ffffffffc0208876 <memcpy>
ffffffffc0205440:	06090f63          	beqz	s2,ffffffffc02054be <do_execve+0xda>
ffffffffc0205444:	00004517          	auipc	a0,0x4
ffffffffc0205448:	3a450513          	addi	a0,a0,932 # ffffffffc02097e8 <commands+0x9e0>
ffffffffc020544c:	cbffa0ef          	jal	ra,ffffffffc020010a <cputs>
ffffffffc0205450:	00038797          	auipc	a5,0x38
ffffffffc0205454:	b7078793          	addi	a5,a5,-1168 # ffffffffc023cfc0 <boot_cr3>
ffffffffc0205458:	639c                	ld	a5,0(a5)
ffffffffc020545a:	577d                	li	a4,-1
ffffffffc020545c:	177e                	slli	a4,a4,0x3f
ffffffffc020545e:	83b1                	srli	a5,a5,0xc
ffffffffc0205460:	8fd9                	or	a5,a5,a4
ffffffffc0205462:	18079073          	csrw	satp,a5
ffffffffc0205466:	03092783          	lw	a5,48(s2)
ffffffffc020546a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020546e:	02e92823          	sw	a4,48(s2)
ffffffffc0205472:	28070c63          	beqz	a4,ffffffffc020570a <do_execve+0x326>
ffffffffc0205476:	000a3783          	ld	a5,0(s4)
ffffffffc020547a:	0207b423          	sd	zero,40(a5)
ffffffffc020547e:	905fb0ef          	jal	ra,ffffffffc0200d82 <mm_create>
ffffffffc0205482:	892a                	mv	s2,a0
ffffffffc0205484:	c135                	beqz	a0,ffffffffc02054e8 <do_execve+0x104>
ffffffffc0205486:	d8cff0ef          	jal	ra,ffffffffc0204a12 <setup_pgdir>
ffffffffc020548a:	e931                	bnez	a0,ffffffffc02054de <do_execve+0xfa>
ffffffffc020548c:	000b2703          	lw	a4,0(s6)
ffffffffc0205490:	464c47b7          	lui	a5,0x464c4
ffffffffc0205494:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_matrix_out_size+0x464c1c47>
ffffffffc0205498:	04f70a63          	beq	a4,a5,ffffffffc02054ec <do_execve+0x108>
ffffffffc020549c:	854a                	mv	a0,s2
ffffffffc020549e:	cf6ff0ef          	jal	ra,ffffffffc0204994 <put_pgdir>
ffffffffc02054a2:	854a                	mv	a0,s2
ffffffffc02054a4:	a65fb0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc02054a8:	59e1                	li	s3,-8
ffffffffc02054aa:	854e                	mv	a0,s3
ffffffffc02054ac:	b1bff0ef          	jal	ra,ffffffffc0204fc6 <do_exit>
ffffffffc02054b0:	463d                	li	a2,15
ffffffffc02054b2:	85ce                	mv	a1,s3
ffffffffc02054b4:	1008                	addi	a0,sp,32
ffffffffc02054b6:	3c0030ef          	jal	ra,ffffffffc0208876 <memcpy>
ffffffffc02054ba:	f80915e3          	bnez	s2,ffffffffc0205444 <do_execve+0x60>
ffffffffc02054be:	000a3783          	ld	a5,0(s4)
ffffffffc02054c2:	779c                	ld	a5,40(a5)
ffffffffc02054c4:	dfcd                	beqz	a5,ffffffffc020547e <do_execve+0x9a>
ffffffffc02054c6:	00005617          	auipc	a2,0x5
ffffffffc02054ca:	58a60613          	addi	a2,a2,1418 # ffffffffc020aa50 <default_pmm_manager+0x650>
ffffffffc02054ce:	20600593          	li	a1,518
ffffffffc02054d2:	00006517          	auipc	a0,0x6
ffffffffc02054d6:	9e650513          	addi	a0,a0,-1562 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02054da:	d3ffa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02054de:	854a                	mv	a0,s2
ffffffffc02054e0:	a29fb0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc02054e4:	59f1                	li	s3,-4
ffffffffc02054e6:	b7d1                	j	ffffffffc02054aa <do_execve+0xc6>
ffffffffc02054e8:	59f1                	li	s3,-4
ffffffffc02054ea:	b7c1                	j	ffffffffc02054aa <do_execve+0xc6>
ffffffffc02054ec:	038b5703          	lhu	a4,56(s6)
ffffffffc02054f0:	020b3403          	ld	s0,32(s6)
ffffffffc02054f4:	00371793          	slli	a5,a4,0x3
ffffffffc02054f8:	8f99                	sub	a5,a5,a4
ffffffffc02054fa:	945a                	add	s0,s0,s6
ffffffffc02054fc:	078e                	slli	a5,a5,0x3
ffffffffc02054fe:	97a2                	add	a5,a5,s0
ffffffffc0205500:	ec3e                	sd	a5,24(sp)
ffffffffc0205502:	02f47b63          	bgeu	s0,a5,ffffffffc0205538 <do_execve+0x154>
ffffffffc0205506:	5bfd                	li	s7,-1
ffffffffc0205508:	00cbd793          	srli	a5,s7,0xc
ffffffffc020550c:	00038d97          	auipc	s11,0x38
ffffffffc0205510:	abcd8d93          	addi	s11,s11,-1348 # ffffffffc023cfc8 <pages>
ffffffffc0205514:	00006d17          	auipc	s10,0x6
ffffffffc0205518:	59cd0d13          	addi	s10,s10,1436 # ffffffffc020bab0 <nbase>
ffffffffc020551c:	e43e                	sd	a5,8(sp)
ffffffffc020551e:	00038c97          	auipc	s9,0x38
ffffffffc0205522:	95ac8c93          	addi	s9,s9,-1702 # ffffffffc023ce78 <npage>
ffffffffc0205526:	4018                	lw	a4,0(s0)
ffffffffc0205528:	4785                	li	a5,1
ffffffffc020552a:	0ef70d63          	beq	a4,a5,ffffffffc0205624 <do_execve+0x240>
ffffffffc020552e:	67e2                	ld	a5,24(sp)
ffffffffc0205530:	03840413          	addi	s0,s0,56
ffffffffc0205534:	fef469e3          	bltu	s0,a5,ffffffffc0205526 <do_execve+0x142>
ffffffffc0205538:	4701                	li	a4,0
ffffffffc020553a:	46ad                	li	a3,11
ffffffffc020553c:	00100637          	lui	a2,0x100
ffffffffc0205540:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0205544:	854a                	mv	a0,s2
ffffffffc0205546:	a15fb0ef          	jal	ra,ffffffffc0200f5a <mm_map>
ffffffffc020554a:	89aa                	mv	s3,a0
ffffffffc020554c:	1a051563          	bnez	a0,ffffffffc02056f6 <do_execve+0x312>
ffffffffc0205550:	01893503          	ld	a0,24(s2)
ffffffffc0205554:	467d                	li	a2,31
ffffffffc0205556:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc020555a:	8b6ff0ef          	jal	ra,ffffffffc0204610 <pgdir_alloc_page>
ffffffffc020555e:	36050063          	beqz	a0,ffffffffc02058be <do_execve+0x4da>
ffffffffc0205562:	01893503          	ld	a0,24(s2)
ffffffffc0205566:	467d                	li	a2,31
ffffffffc0205568:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc020556c:	8a4ff0ef          	jal	ra,ffffffffc0204610 <pgdir_alloc_page>
ffffffffc0205570:	32050763          	beqz	a0,ffffffffc020589e <do_execve+0x4ba>
ffffffffc0205574:	01893503          	ld	a0,24(s2)
ffffffffc0205578:	467d                	li	a2,31
ffffffffc020557a:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc020557e:	892ff0ef          	jal	ra,ffffffffc0204610 <pgdir_alloc_page>
ffffffffc0205582:	2e050e63          	beqz	a0,ffffffffc020587e <do_execve+0x49a>
ffffffffc0205586:	01893503          	ld	a0,24(s2)
ffffffffc020558a:	467d                	li	a2,31
ffffffffc020558c:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0205590:	880ff0ef          	jal	ra,ffffffffc0204610 <pgdir_alloc_page>
ffffffffc0205594:	2c050563          	beqz	a0,ffffffffc020585e <do_execve+0x47a>
ffffffffc0205598:	03092783          	lw	a5,48(s2)
ffffffffc020559c:	000a3603          	ld	a2,0(s4)
ffffffffc02055a0:	01893683          	ld	a3,24(s2)
ffffffffc02055a4:	2785                	addiw	a5,a5,1
ffffffffc02055a6:	02f92823          	sw	a5,48(s2)
ffffffffc02055aa:	03263423          	sd	s2,40(a2) # 100028 <_binary_obj___user_matrix_out_size+0xfd6f0>
ffffffffc02055ae:	c02007b7          	lui	a5,0xc0200
ffffffffc02055b2:	28f6ea63          	bltu	a3,a5,ffffffffc0205846 <do_execve+0x462>
ffffffffc02055b6:	00038797          	auipc	a5,0x38
ffffffffc02055ba:	a0278793          	addi	a5,a5,-1534 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc02055be:	639c                	ld	a5,0(a5)
ffffffffc02055c0:	577d                	li	a4,-1
ffffffffc02055c2:	177e                	slli	a4,a4,0x3f
ffffffffc02055c4:	8e9d                	sub	a3,a3,a5
ffffffffc02055c6:	00c6d793          	srli	a5,a3,0xc
ffffffffc02055ca:	f654                	sd	a3,168(a2)
ffffffffc02055cc:	8fd9                	or	a5,a5,a4
ffffffffc02055ce:	18079073          	csrw	satp,a5
ffffffffc02055d2:	7240                	ld	s0,160(a2)
ffffffffc02055d4:	4581                	li	a1,0
ffffffffc02055d6:	12000613          	li	a2,288
ffffffffc02055da:	8522                	mv	a0,s0
ffffffffc02055dc:	10043483          	ld	s1,256(s0)
ffffffffc02055e0:	284030ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc02055e4:	018b3703          	ld	a4,24(s6)
ffffffffc02055e8:	4785                	li	a5,1
ffffffffc02055ea:	000a3503          	ld	a0,0(s4)
ffffffffc02055ee:	edf4f493          	andi	s1,s1,-289
ffffffffc02055f2:	07fe                	slli	a5,a5,0x1f
ffffffffc02055f4:	e81c                	sd	a5,16(s0)
ffffffffc02055f6:	10e43423          	sd	a4,264(s0)
ffffffffc02055fa:	10943023          	sd	s1,256(s0)
ffffffffc02055fe:	100c                	addi	a1,sp,32
ffffffffc0205600:	c9eff0ef          	jal	ra,ffffffffc0204a9e <set_proc_name>
ffffffffc0205604:	60ea                	ld	ra,152(sp)
ffffffffc0205606:	644a                	ld	s0,144(sp)
ffffffffc0205608:	854e                	mv	a0,s3
ffffffffc020560a:	64aa                	ld	s1,136(sp)
ffffffffc020560c:	690a                	ld	s2,128(sp)
ffffffffc020560e:	79e6                	ld	s3,120(sp)
ffffffffc0205610:	7a46                	ld	s4,112(sp)
ffffffffc0205612:	7aa6                	ld	s5,104(sp)
ffffffffc0205614:	7b06                	ld	s6,96(sp)
ffffffffc0205616:	6be6                	ld	s7,88(sp)
ffffffffc0205618:	6c46                	ld	s8,80(sp)
ffffffffc020561a:	6ca6                	ld	s9,72(sp)
ffffffffc020561c:	6d06                	ld	s10,64(sp)
ffffffffc020561e:	7de2                	ld	s11,56(sp)
ffffffffc0205620:	610d                	addi	sp,sp,160
ffffffffc0205622:	8082                	ret
ffffffffc0205624:	7410                	ld	a2,40(s0)
ffffffffc0205626:	701c                	ld	a5,32(s0)
ffffffffc0205628:	20f66163          	bltu	a2,a5,ffffffffc020582a <do_execve+0x446>
ffffffffc020562c:	405c                	lw	a5,4(s0)
ffffffffc020562e:	0017f693          	andi	a3,a5,1
ffffffffc0205632:	c291                	beqz	a3,ffffffffc0205636 <do_execve+0x252>
ffffffffc0205634:	4691                	li	a3,4
ffffffffc0205636:	0027f713          	andi	a4,a5,2
ffffffffc020563a:	8b91                	andi	a5,a5,4
ffffffffc020563c:	0e071163          	bnez	a4,ffffffffc020571e <do_execve+0x33a>
ffffffffc0205640:	4745                	li	a4,17
ffffffffc0205642:	e03a                	sd	a4,0(sp)
ffffffffc0205644:	c789                	beqz	a5,ffffffffc020564e <do_execve+0x26a>
ffffffffc0205646:	47cd                	li	a5,19
ffffffffc0205648:	0016e693          	ori	a3,a3,1
ffffffffc020564c:	e03e                	sd	a5,0(sp)
ffffffffc020564e:	0026f793          	andi	a5,a3,2
ffffffffc0205652:	ebe9                	bnez	a5,ffffffffc0205724 <do_execve+0x340>
ffffffffc0205654:	0046f793          	andi	a5,a3,4
ffffffffc0205658:	c789                	beqz	a5,ffffffffc0205662 <do_execve+0x27e>
ffffffffc020565a:	6782                	ld	a5,0(sp)
ffffffffc020565c:	0087e793          	ori	a5,a5,8
ffffffffc0205660:	e03e                	sd	a5,0(sp)
ffffffffc0205662:	680c                	ld	a1,16(s0)
ffffffffc0205664:	4701                	li	a4,0
ffffffffc0205666:	854a                	mv	a0,s2
ffffffffc0205668:	8f3fb0ef          	jal	ra,ffffffffc0200f5a <mm_map>
ffffffffc020566c:	89aa                	mv	s3,a0
ffffffffc020566e:	e541                	bnez	a0,ffffffffc02056f6 <do_execve+0x312>
ffffffffc0205670:	01043b83          	ld	s7,16(s0)
ffffffffc0205674:	02043983          	ld	s3,32(s0)
ffffffffc0205678:	00843a83          	ld	s5,8(s0)
ffffffffc020567c:	77fd                	lui	a5,0xfffff
ffffffffc020567e:	99de                	add	s3,s3,s7
ffffffffc0205680:	9ada                	add	s5,s5,s6
ffffffffc0205682:	00fbfc33          	and	s8,s7,a5
ffffffffc0205686:	053bef63          	bltu	s7,s3,ffffffffc02056e4 <do_execve+0x300>
ffffffffc020568a:	aa61                	j	ffffffffc0205822 <do_execve+0x43e>
ffffffffc020568c:	6785                	lui	a5,0x1
ffffffffc020568e:	418b8533          	sub	a0,s7,s8
ffffffffc0205692:	9c3e                	add	s8,s8,a5
ffffffffc0205694:	417c0833          	sub	a6,s8,s7
ffffffffc0205698:	0189f463          	bgeu	s3,s8,ffffffffc02056a0 <do_execve+0x2bc>
ffffffffc020569c:	41798833          	sub	a6,s3,s7
ffffffffc02056a0:	000db683          	ld	a3,0(s11)
ffffffffc02056a4:	000d3583          	ld	a1,0(s10)
ffffffffc02056a8:	67a2                	ld	a5,8(sp)
ffffffffc02056aa:	40d486b3          	sub	a3,s1,a3
ffffffffc02056ae:	8699                	srai	a3,a3,0x6
ffffffffc02056b0:	000cb603          	ld	a2,0(s9)
ffffffffc02056b4:	96ae                	add	a3,a3,a1
ffffffffc02056b6:	00f6f5b3          	and	a1,a3,a5
ffffffffc02056ba:	06b2                	slli	a3,a3,0xc
ffffffffc02056bc:	16c5f963          	bgeu	a1,a2,ffffffffc020582e <do_execve+0x44a>
ffffffffc02056c0:	00038797          	auipc	a5,0x38
ffffffffc02056c4:	8f878793          	addi	a5,a5,-1800 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc02056c8:	0007b883          	ld	a7,0(a5)
ffffffffc02056cc:	85d6                	mv	a1,s5
ffffffffc02056ce:	8642                	mv	a2,a6
ffffffffc02056d0:	96c6                	add	a3,a3,a7
ffffffffc02056d2:	9536                	add	a0,a0,a3
ffffffffc02056d4:	9bc2                	add	s7,s7,a6
ffffffffc02056d6:	e842                	sd	a6,16(sp)
ffffffffc02056d8:	19e030ef          	jal	ra,ffffffffc0208876 <memcpy>
ffffffffc02056dc:	6842                	ld	a6,16(sp)
ffffffffc02056de:	9ac2                	add	s5,s5,a6
ffffffffc02056e0:	053bf563          	bgeu	s7,s3,ffffffffc020572a <do_execve+0x346>
ffffffffc02056e4:	01893503          	ld	a0,24(s2)
ffffffffc02056e8:	6602                	ld	a2,0(sp)
ffffffffc02056ea:	85e2                	mv	a1,s8
ffffffffc02056ec:	f25fe0ef          	jal	ra,ffffffffc0204610 <pgdir_alloc_page>
ffffffffc02056f0:	84aa                	mv	s1,a0
ffffffffc02056f2:	fd49                	bnez	a0,ffffffffc020568c <do_execve+0x2a8>
ffffffffc02056f4:	59f1                	li	s3,-4
ffffffffc02056f6:	854a                	mv	a0,s2
ffffffffc02056f8:	9b1fb0ef          	jal	ra,ffffffffc02010a8 <exit_mmap>
ffffffffc02056fc:	854a                	mv	a0,s2
ffffffffc02056fe:	a96ff0ef          	jal	ra,ffffffffc0204994 <put_pgdir>
ffffffffc0205702:	854a                	mv	a0,s2
ffffffffc0205704:	805fb0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc0205708:	b34d                	j	ffffffffc02054aa <do_execve+0xc6>
ffffffffc020570a:	854a                	mv	a0,s2
ffffffffc020570c:	99dfb0ef          	jal	ra,ffffffffc02010a8 <exit_mmap>
ffffffffc0205710:	854a                	mv	a0,s2
ffffffffc0205712:	a82ff0ef          	jal	ra,ffffffffc0204994 <put_pgdir>
ffffffffc0205716:	854a                	mv	a0,s2
ffffffffc0205718:	ff0fb0ef          	jal	ra,ffffffffc0200f08 <mm_destroy>
ffffffffc020571c:	bba9                	j	ffffffffc0205476 <do_execve+0x92>
ffffffffc020571e:	0026e693          	ori	a3,a3,2
ffffffffc0205722:	f395                	bnez	a5,ffffffffc0205646 <do_execve+0x262>
ffffffffc0205724:	47dd                	li	a5,23
ffffffffc0205726:	e03e                	sd	a5,0(sp)
ffffffffc0205728:	b735                	j	ffffffffc0205654 <do_execve+0x270>
ffffffffc020572a:	01043983          	ld	s3,16(s0)
ffffffffc020572e:	7414                	ld	a3,40(s0)
ffffffffc0205730:	99b6                	add	s3,s3,a3
ffffffffc0205732:	098bf163          	bgeu	s7,s8,ffffffffc02057b4 <do_execve+0x3d0>
ffffffffc0205736:	df798ce3          	beq	s3,s7,ffffffffc020552e <do_execve+0x14a>
ffffffffc020573a:	6505                	lui	a0,0x1
ffffffffc020573c:	955e                	add	a0,a0,s7
ffffffffc020573e:	41850533          	sub	a0,a0,s8
ffffffffc0205742:	41798ab3          	sub	s5,s3,s7
ffffffffc0205746:	0d89fb63          	bgeu	s3,s8,ffffffffc020581c <do_execve+0x438>
ffffffffc020574a:	000db683          	ld	a3,0(s11)
ffffffffc020574e:	000d3583          	ld	a1,0(s10)
ffffffffc0205752:	67a2                	ld	a5,8(sp)
ffffffffc0205754:	40d486b3          	sub	a3,s1,a3
ffffffffc0205758:	8699                	srai	a3,a3,0x6
ffffffffc020575a:	000cb603          	ld	a2,0(s9)
ffffffffc020575e:	96ae                	add	a3,a3,a1
ffffffffc0205760:	00f6f5b3          	and	a1,a3,a5
ffffffffc0205764:	06b2                	slli	a3,a3,0xc
ffffffffc0205766:	0cc5f463          	bgeu	a1,a2,ffffffffc020582e <do_execve+0x44a>
ffffffffc020576a:	00038617          	auipc	a2,0x38
ffffffffc020576e:	84e60613          	addi	a2,a2,-1970 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc0205772:	00063803          	ld	a6,0(a2)
ffffffffc0205776:	4581                	li	a1,0
ffffffffc0205778:	8656                	mv	a2,s5
ffffffffc020577a:	96c2                	add	a3,a3,a6
ffffffffc020577c:	9536                	add	a0,a0,a3
ffffffffc020577e:	0e6030ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc0205782:	017a8733          	add	a4,s5,s7
ffffffffc0205786:	0389f463          	bgeu	s3,s8,ffffffffc02057ae <do_execve+0x3ca>
ffffffffc020578a:	dae982e3          	beq	s3,a4,ffffffffc020552e <do_execve+0x14a>
ffffffffc020578e:	00005697          	auipc	a3,0x5
ffffffffc0205792:	2ea68693          	addi	a3,a3,746 # ffffffffc020aa78 <default_pmm_manager+0x678>
ffffffffc0205796:	00004617          	auipc	a2,0x4
ffffffffc020579a:	af260613          	addi	a2,a2,-1294 # ffffffffc0209288 <commands+0x480>
ffffffffc020579e:	25b00593          	li	a1,603
ffffffffc02057a2:	00005517          	auipc	a0,0x5
ffffffffc02057a6:	71650513          	addi	a0,a0,1814 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02057aa:	a6ffa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02057ae:	ff8710e3          	bne	a4,s8,ffffffffc020578e <do_execve+0x3aa>
ffffffffc02057b2:	8be2                	mv	s7,s8
ffffffffc02057b4:	00038a97          	auipc	s5,0x38
ffffffffc02057b8:	804a8a93          	addi	s5,s5,-2044 # ffffffffc023cfb8 <va_pa_offset>
ffffffffc02057bc:	053be763          	bltu	s7,s3,ffffffffc020580a <do_execve+0x426>
ffffffffc02057c0:	b3bd                	j	ffffffffc020552e <do_execve+0x14a>
ffffffffc02057c2:	6785                	lui	a5,0x1
ffffffffc02057c4:	418b8533          	sub	a0,s7,s8
ffffffffc02057c8:	9c3e                	add	s8,s8,a5
ffffffffc02057ca:	417c0633          	sub	a2,s8,s7
ffffffffc02057ce:	0189f463          	bgeu	s3,s8,ffffffffc02057d6 <do_execve+0x3f2>
ffffffffc02057d2:	41798633          	sub	a2,s3,s7
ffffffffc02057d6:	000db683          	ld	a3,0(s11)
ffffffffc02057da:	000d3803          	ld	a6,0(s10)
ffffffffc02057de:	67a2                	ld	a5,8(sp)
ffffffffc02057e0:	40d486b3          	sub	a3,s1,a3
ffffffffc02057e4:	8699                	srai	a3,a3,0x6
ffffffffc02057e6:	000cb583          	ld	a1,0(s9)
ffffffffc02057ea:	96c2                	add	a3,a3,a6
ffffffffc02057ec:	00f6f833          	and	a6,a3,a5
ffffffffc02057f0:	06b2                	slli	a3,a3,0xc
ffffffffc02057f2:	02b87e63          	bgeu	a6,a1,ffffffffc020582e <do_execve+0x44a>
ffffffffc02057f6:	000ab803          	ld	a6,0(s5)
ffffffffc02057fa:	9bb2                	add	s7,s7,a2
ffffffffc02057fc:	4581                	li	a1,0
ffffffffc02057fe:	96c2                	add	a3,a3,a6
ffffffffc0205800:	9536                	add	a0,a0,a3
ffffffffc0205802:	062030ef          	jal	ra,ffffffffc0208864 <memset>
ffffffffc0205806:	d33bf4e3          	bgeu	s7,s3,ffffffffc020552e <do_execve+0x14a>
ffffffffc020580a:	01893503          	ld	a0,24(s2)
ffffffffc020580e:	6602                	ld	a2,0(sp)
ffffffffc0205810:	85e2                	mv	a1,s8
ffffffffc0205812:	dfffe0ef          	jal	ra,ffffffffc0204610 <pgdir_alloc_page>
ffffffffc0205816:	84aa                	mv	s1,a0
ffffffffc0205818:	f54d                	bnez	a0,ffffffffc02057c2 <do_execve+0x3de>
ffffffffc020581a:	bde9                	j	ffffffffc02056f4 <do_execve+0x310>
ffffffffc020581c:	417c0ab3          	sub	s5,s8,s7
ffffffffc0205820:	b72d                	j	ffffffffc020574a <do_execve+0x366>
ffffffffc0205822:	89de                	mv	s3,s7
ffffffffc0205824:	b729                	j	ffffffffc020572e <do_execve+0x34a>
ffffffffc0205826:	59f5                	li	s3,-3
ffffffffc0205828:	bbf1                	j	ffffffffc0205604 <do_execve+0x220>
ffffffffc020582a:	59e1                	li	s3,-8
ffffffffc020582c:	b5e9                	j	ffffffffc02056f6 <do_execve+0x312>
ffffffffc020582e:	00004617          	auipc	a2,0x4
ffffffffc0205832:	40260613          	addi	a2,a2,1026 # ffffffffc0209c30 <commands+0xe28>
ffffffffc0205836:	06900593          	li	a1,105
ffffffffc020583a:	00004517          	auipc	a0,0x4
ffffffffc020583e:	19650513          	addi	a0,a0,406 # ffffffffc02099d0 <commands+0xbc8>
ffffffffc0205842:	9d7fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0205846:	00004617          	auipc	a2,0x4
ffffffffc020584a:	41260613          	addi	a2,a2,1042 # ffffffffc0209c58 <commands+0xe50>
ffffffffc020584e:	27600593          	li	a1,630
ffffffffc0205852:	00005517          	auipc	a0,0x5
ffffffffc0205856:	66650513          	addi	a0,a0,1638 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc020585a:	9bffa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020585e:	00005697          	auipc	a3,0x5
ffffffffc0205862:	33268693          	addi	a3,a3,818 # ffffffffc020ab90 <default_pmm_manager+0x790>
ffffffffc0205866:	00004617          	auipc	a2,0x4
ffffffffc020586a:	a2260613          	addi	a2,a2,-1502 # ffffffffc0209288 <commands+0x480>
ffffffffc020586e:	27100593          	li	a1,625
ffffffffc0205872:	00005517          	auipc	a0,0x5
ffffffffc0205876:	64650513          	addi	a0,a0,1606 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc020587a:	99ffa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020587e:	00005697          	auipc	a3,0x5
ffffffffc0205882:	2ca68693          	addi	a3,a3,714 # ffffffffc020ab48 <default_pmm_manager+0x748>
ffffffffc0205886:	00004617          	auipc	a2,0x4
ffffffffc020588a:	a0260613          	addi	a2,a2,-1534 # ffffffffc0209288 <commands+0x480>
ffffffffc020588e:	27000593          	li	a1,624
ffffffffc0205892:	00005517          	auipc	a0,0x5
ffffffffc0205896:	62650513          	addi	a0,a0,1574 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc020589a:	97ffa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc020589e:	00005697          	auipc	a3,0x5
ffffffffc02058a2:	26268693          	addi	a3,a3,610 # ffffffffc020ab00 <default_pmm_manager+0x700>
ffffffffc02058a6:	00004617          	auipc	a2,0x4
ffffffffc02058aa:	9e260613          	addi	a2,a2,-1566 # ffffffffc0209288 <commands+0x480>
ffffffffc02058ae:	26f00593          	li	a1,623
ffffffffc02058b2:	00005517          	auipc	a0,0x5
ffffffffc02058b6:	60650513          	addi	a0,a0,1542 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02058ba:	95ffa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc02058be:	00005697          	auipc	a3,0x5
ffffffffc02058c2:	1fa68693          	addi	a3,a3,506 # ffffffffc020aab8 <default_pmm_manager+0x6b8>
ffffffffc02058c6:	00004617          	auipc	a2,0x4
ffffffffc02058ca:	9c260613          	addi	a2,a2,-1598 # ffffffffc0209288 <commands+0x480>
ffffffffc02058ce:	26e00593          	li	a1,622
ffffffffc02058d2:	00005517          	auipc	a0,0x5
ffffffffc02058d6:	5e650513          	addi	a0,a0,1510 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc02058da:	93ffa0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02058de <do_yield>:
ffffffffc02058de:	00037797          	auipc	a5,0x37
ffffffffc02058e2:	5a278793          	addi	a5,a5,1442 # ffffffffc023ce80 <current>
ffffffffc02058e6:	639c                	ld	a5,0(a5)
ffffffffc02058e8:	4705                	li	a4,1
ffffffffc02058ea:	4501                	li	a0,0
ffffffffc02058ec:	ef98                	sd	a4,24(a5)
ffffffffc02058ee:	8082                	ret

ffffffffc02058f0 <do_wait>:
ffffffffc02058f0:	1101                	addi	sp,sp,-32
ffffffffc02058f2:	e822                	sd	s0,16(sp)
ffffffffc02058f4:	e426                	sd	s1,8(sp)
ffffffffc02058f6:	ec06                	sd	ra,24(sp)
ffffffffc02058f8:	842e                	mv	s0,a1
ffffffffc02058fa:	84aa                	mv	s1,a0
ffffffffc02058fc:	cd81                	beqz	a1,ffffffffc0205914 <do_wait+0x24>
ffffffffc02058fe:	00037797          	auipc	a5,0x37
ffffffffc0205902:	58278793          	addi	a5,a5,1410 # ffffffffc023ce80 <current>
ffffffffc0205906:	639c                	ld	a5,0(a5)
ffffffffc0205908:	4685                	li	a3,1
ffffffffc020590a:	4611                	li	a2,4
ffffffffc020590c:	7788                	ld	a0,40(a5)
ffffffffc020590e:	debfb0ef          	jal	ra,ffffffffc02016f8 <user_mem_check>
ffffffffc0205912:	c909                	beqz	a0,ffffffffc0205924 <do_wait+0x34>
ffffffffc0205914:	85a2                	mv	a1,s0
ffffffffc0205916:	6442                	ld	s0,16(sp)
ffffffffc0205918:	60e2                	ld	ra,24(sp)
ffffffffc020591a:	8526                	mv	a0,s1
ffffffffc020591c:	64a2                	ld	s1,8(sp)
ffffffffc020591e:	6105                	addi	sp,sp,32
ffffffffc0205920:	ff4ff06f          	j	ffffffffc0205114 <do_wait.part.1>
ffffffffc0205924:	60e2                	ld	ra,24(sp)
ffffffffc0205926:	6442                	ld	s0,16(sp)
ffffffffc0205928:	64a2                	ld	s1,8(sp)
ffffffffc020592a:	5575                	li	a0,-3
ffffffffc020592c:	6105                	addi	sp,sp,32
ffffffffc020592e:	8082                	ret

ffffffffc0205930 <do_kill>:
ffffffffc0205930:	1141                	addi	sp,sp,-16
ffffffffc0205932:	e406                	sd	ra,8(sp)
ffffffffc0205934:	e022                	sd	s0,0(sp)
ffffffffc0205936:	9feff0ef          	jal	ra,ffffffffc0204b34 <find_proc>
ffffffffc020593a:	cd0d                	beqz	a0,ffffffffc0205974 <do_kill+0x44>
ffffffffc020593c:	0b052703          	lw	a4,176(a0)
ffffffffc0205940:	00177693          	andi	a3,a4,1
ffffffffc0205944:	e695                	bnez	a3,ffffffffc0205970 <do_kill+0x40>
ffffffffc0205946:	0ec52683          	lw	a3,236(a0)
ffffffffc020594a:	00176713          	ori	a4,a4,1
ffffffffc020594e:	0ae52823          	sw	a4,176(a0)
ffffffffc0205952:	4401                	li	s0,0
ffffffffc0205954:	0006c763          	bltz	a3,ffffffffc0205962 <do_kill+0x32>
ffffffffc0205958:	8522                	mv	a0,s0
ffffffffc020595a:	60a2                	ld	ra,8(sp)
ffffffffc020595c:	6402                	ld	s0,0(sp)
ffffffffc020595e:	0141                	addi	sp,sp,16
ffffffffc0205960:	8082                	ret
ffffffffc0205962:	23c000ef          	jal	ra,ffffffffc0205b9e <wakeup_proc>
ffffffffc0205966:	8522                	mv	a0,s0
ffffffffc0205968:	60a2                	ld	ra,8(sp)
ffffffffc020596a:	6402                	ld	s0,0(sp)
ffffffffc020596c:	0141                	addi	sp,sp,16
ffffffffc020596e:	8082                	ret
ffffffffc0205970:	545d                	li	s0,-9
ffffffffc0205972:	b7dd                	j	ffffffffc0205958 <do_kill+0x28>
ffffffffc0205974:	5475                	li	s0,-3
ffffffffc0205976:	b7cd                	j	ffffffffc0205958 <do_kill+0x28>

ffffffffc0205978 <proc_init>:
ffffffffc0205978:	00037797          	auipc	a5,0x37
ffffffffc020597c:	65878793          	addi	a5,a5,1624 # ffffffffc023cfd0 <proc_list>
ffffffffc0205980:	1101                	addi	sp,sp,-32
ffffffffc0205982:	00037717          	auipc	a4,0x37
ffffffffc0205986:	64f73b23          	sd	a5,1622(a4) # ffffffffc023cfd8 <proc_list+0x8>
ffffffffc020598a:	00037717          	auipc	a4,0x37
ffffffffc020598e:	64f73323          	sd	a5,1606(a4) # ffffffffc023cfd0 <proc_list>
ffffffffc0205992:	ec06                	sd	ra,24(sp)
ffffffffc0205994:	e822                	sd	s0,16(sp)
ffffffffc0205996:	e426                	sd	s1,8(sp)
ffffffffc0205998:	00033797          	auipc	a5,0x33
ffffffffc020599c:	48078793          	addi	a5,a5,1152 # ffffffffc0238e18 <hash_list>
ffffffffc02059a0:	00037717          	auipc	a4,0x37
ffffffffc02059a4:	47870713          	addi	a4,a4,1144 # ffffffffc023ce18 <__rq>
ffffffffc02059a8:	e79c                	sd	a5,8(a5)
ffffffffc02059aa:	e39c                	sd	a5,0(a5)
ffffffffc02059ac:	07c1                	addi	a5,a5,16
ffffffffc02059ae:	fee79de3          	bne	a5,a4,ffffffffc02059a8 <proc_init+0x30>
ffffffffc02059b2:	ecdfe0ef          	jal	ra,ffffffffc020487e <alloc_proc>
ffffffffc02059b6:	00037717          	auipc	a4,0x37
ffffffffc02059ba:	4ca73923          	sd	a0,1234(a4) # ffffffffc023ce88 <idleproc>
ffffffffc02059be:	00037497          	auipc	s1,0x37
ffffffffc02059c2:	4ca48493          	addi	s1,s1,1226 # ffffffffc023ce88 <idleproc>
ffffffffc02059c6:	c559                	beqz	a0,ffffffffc0205a54 <proc_init+0xdc>
ffffffffc02059c8:	4709                	li	a4,2
ffffffffc02059ca:	e118                	sd	a4,0(a0)
ffffffffc02059cc:	4405                	li	s0,1
ffffffffc02059ce:	00006717          	auipc	a4,0x6
ffffffffc02059d2:	63270713          	addi	a4,a4,1586 # ffffffffc020c000 <bootstack>
ffffffffc02059d6:	00005597          	auipc	a1,0x5
ffffffffc02059da:	40258593          	addi	a1,a1,1026 # ffffffffc020add8 <default_pmm_manager+0x9d8>
ffffffffc02059de:	e918                	sd	a4,16(a0)
ffffffffc02059e0:	ed00                	sd	s0,24(a0)
ffffffffc02059e2:	8bcff0ef          	jal	ra,ffffffffc0204a9e <set_proc_name>
ffffffffc02059e6:	00037797          	auipc	a5,0x37
ffffffffc02059ea:	4b278793          	addi	a5,a5,1202 # ffffffffc023ce98 <nr_process>
ffffffffc02059ee:	439c                	lw	a5,0(a5)
ffffffffc02059f0:	6098                	ld	a4,0(s1)
ffffffffc02059f2:	4601                	li	a2,0
ffffffffc02059f4:	2785                	addiw	a5,a5,1
ffffffffc02059f6:	4581                	li	a1,0
ffffffffc02059f8:	00000517          	auipc	a0,0x0
ffffffffc02059fc:	8c450513          	addi	a0,a0,-1852 # ffffffffc02052bc <init_main>
ffffffffc0205a00:	00037697          	auipc	a3,0x37
ffffffffc0205a04:	48f6ac23          	sw	a5,1176(a3) # ffffffffc023ce98 <nr_process>
ffffffffc0205a08:	00037797          	auipc	a5,0x37
ffffffffc0205a0c:	46e7bc23          	sd	a4,1144(a5) # ffffffffc023ce80 <current>
ffffffffc0205a10:	d66ff0ef          	jal	ra,ffffffffc0204f76 <kernel_thread>
ffffffffc0205a14:	08a05c63          	blez	a0,ffffffffc0205aac <proc_init+0x134>
ffffffffc0205a18:	91cff0ef          	jal	ra,ffffffffc0204b34 <find_proc>
ffffffffc0205a1c:	00005597          	auipc	a1,0x5
ffffffffc0205a20:	3e458593          	addi	a1,a1,996 # ffffffffc020ae00 <default_pmm_manager+0xa00>
ffffffffc0205a24:	00037797          	auipc	a5,0x37
ffffffffc0205a28:	46a7b623          	sd	a0,1132(a5) # ffffffffc023ce90 <initproc>
ffffffffc0205a2c:	872ff0ef          	jal	ra,ffffffffc0204a9e <set_proc_name>
ffffffffc0205a30:	609c                	ld	a5,0(s1)
ffffffffc0205a32:	cfa9                	beqz	a5,ffffffffc0205a8c <proc_init+0x114>
ffffffffc0205a34:	43dc                	lw	a5,4(a5)
ffffffffc0205a36:	ebb9                	bnez	a5,ffffffffc0205a8c <proc_init+0x114>
ffffffffc0205a38:	00037797          	auipc	a5,0x37
ffffffffc0205a3c:	45878793          	addi	a5,a5,1112 # ffffffffc023ce90 <initproc>
ffffffffc0205a40:	639c                	ld	a5,0(a5)
ffffffffc0205a42:	c78d                	beqz	a5,ffffffffc0205a6c <proc_init+0xf4>
ffffffffc0205a44:	43dc                	lw	a5,4(a5)
ffffffffc0205a46:	02879363          	bne	a5,s0,ffffffffc0205a6c <proc_init+0xf4>
ffffffffc0205a4a:	60e2                	ld	ra,24(sp)
ffffffffc0205a4c:	6442                	ld	s0,16(sp)
ffffffffc0205a4e:	64a2                	ld	s1,8(sp)
ffffffffc0205a50:	6105                	addi	sp,sp,32
ffffffffc0205a52:	8082                	ret
ffffffffc0205a54:	00005617          	auipc	a2,0x5
ffffffffc0205a58:	36c60613          	addi	a2,a2,876 # ffffffffc020adc0 <default_pmm_manager+0x9c0>
ffffffffc0205a5c:	37200593          	li	a1,882
ffffffffc0205a60:	00005517          	auipc	a0,0x5
ffffffffc0205a64:	45850513          	addi	a0,a0,1112 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0205a68:	fb0fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0205a6c:	00005697          	auipc	a3,0x5
ffffffffc0205a70:	3c468693          	addi	a3,a3,964 # ffffffffc020ae30 <default_pmm_manager+0xa30>
ffffffffc0205a74:	00004617          	auipc	a2,0x4
ffffffffc0205a78:	81460613          	addi	a2,a2,-2028 # ffffffffc0209288 <commands+0x480>
ffffffffc0205a7c:	38700593          	li	a1,903
ffffffffc0205a80:	00005517          	auipc	a0,0x5
ffffffffc0205a84:	43850513          	addi	a0,a0,1080 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0205a88:	f90fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0205a8c:	00005697          	auipc	a3,0x5
ffffffffc0205a90:	37c68693          	addi	a3,a3,892 # ffffffffc020ae08 <default_pmm_manager+0xa08>
ffffffffc0205a94:	00003617          	auipc	a2,0x3
ffffffffc0205a98:	7f460613          	addi	a2,a2,2036 # ffffffffc0209288 <commands+0x480>
ffffffffc0205a9c:	38600593          	li	a1,902
ffffffffc0205aa0:	00005517          	auipc	a0,0x5
ffffffffc0205aa4:	41850513          	addi	a0,a0,1048 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0205aa8:	f70fa0ef          	jal	ra,ffffffffc0200218 <__panic>
ffffffffc0205aac:	00005617          	auipc	a2,0x5
ffffffffc0205ab0:	33460613          	addi	a2,a2,820 # ffffffffc020ade0 <default_pmm_manager+0x9e0>
ffffffffc0205ab4:	38000593          	li	a1,896
ffffffffc0205ab8:	00005517          	auipc	a0,0x5
ffffffffc0205abc:	40050513          	addi	a0,a0,1024 # ffffffffc020aeb8 <default_pmm_manager+0xab8>
ffffffffc0205ac0:	f58fa0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0205ac4 <cpu_idle>:
ffffffffc0205ac4:	1141                	addi	sp,sp,-16
ffffffffc0205ac6:	e022                	sd	s0,0(sp)
ffffffffc0205ac8:	e406                	sd	ra,8(sp)
ffffffffc0205aca:	00037417          	auipc	s0,0x37
ffffffffc0205ace:	3b640413          	addi	s0,s0,950 # ffffffffc023ce80 <current>
ffffffffc0205ad2:	6018                	ld	a4,0(s0)
ffffffffc0205ad4:	6f1c                	ld	a5,24(a4)
ffffffffc0205ad6:	dffd                	beqz	a5,ffffffffc0205ad4 <cpu_idle+0x10>
ffffffffc0205ad8:	180000ef          	jal	ra,ffffffffc0205c58 <schedule>
ffffffffc0205adc:	bfdd                	j	ffffffffc0205ad2 <cpu_idle+0xe>

ffffffffc0205ade <lab6_set_priority>:
ffffffffc0205ade:	1141                	addi	sp,sp,-16
ffffffffc0205ae0:	e022                	sd	s0,0(sp)
ffffffffc0205ae2:	85aa                	mv	a1,a0
ffffffffc0205ae4:	842a                	mv	s0,a0
ffffffffc0205ae6:	00005517          	auipc	a0,0x5
ffffffffc0205aea:	2c250513          	addi	a0,a0,706 # ffffffffc020ada8 <default_pmm_manager+0x9a8>
ffffffffc0205aee:	e406                	sd	ra,8(sp)
ffffffffc0205af0:	de4fa0ef          	jal	ra,ffffffffc02000d4 <cprintf>
ffffffffc0205af4:	00037797          	auipc	a5,0x37
ffffffffc0205af8:	38c78793          	addi	a5,a5,908 # ffffffffc023ce80 <current>
ffffffffc0205afc:	639c                	ld	a5,0(a5)
ffffffffc0205afe:	e801                	bnez	s0,ffffffffc0205b0e <lab6_set_priority+0x30>
ffffffffc0205b00:	60a2                	ld	ra,8(sp)
ffffffffc0205b02:	6402                	ld	s0,0(sp)
ffffffffc0205b04:	4705                	li	a4,1
ffffffffc0205b06:	14e7a223          	sw	a4,324(a5)
ffffffffc0205b0a:	0141                	addi	sp,sp,16
ffffffffc0205b0c:	8082                	ret
ffffffffc0205b0e:	1487a223          	sw	s0,324(a5)
ffffffffc0205b12:	60a2                	ld	ra,8(sp)
ffffffffc0205b14:	6402                	ld	s0,0(sp)
ffffffffc0205b16:	0141                	addi	sp,sp,16
ffffffffc0205b18:	8082                	ret

ffffffffc0205b1a <sched_class_proc_tick>:
ffffffffc0205b1a:	00037797          	auipc	a5,0x37
ffffffffc0205b1e:	36e78793          	addi	a5,a5,878 # ffffffffc023ce88 <idleproc>
ffffffffc0205b22:	639c                	ld	a5,0(a5)
ffffffffc0205b24:	85aa                	mv	a1,a0
ffffffffc0205b26:	00a78f63          	beq	a5,a0,ffffffffc0205b44 <sched_class_proc_tick+0x2a>
ffffffffc0205b2a:	00037797          	auipc	a5,0x37
ffffffffc0205b2e:	37e78793          	addi	a5,a5,894 # ffffffffc023cea8 <sched_class>
ffffffffc0205b32:	639c                	ld	a5,0(a5)
ffffffffc0205b34:	00037717          	auipc	a4,0x37
ffffffffc0205b38:	36c70713          	addi	a4,a4,876 # ffffffffc023cea0 <rq>
ffffffffc0205b3c:	6308                	ld	a0,0(a4)
ffffffffc0205b3e:	0287b303          	ld	t1,40(a5)
ffffffffc0205b42:	8302                	jr	t1
ffffffffc0205b44:	4705                	li	a4,1
ffffffffc0205b46:	ef98                	sd	a4,24(a5)
ffffffffc0205b48:	8082                	ret

ffffffffc0205b4a <sched_init>:
ffffffffc0205b4a:	1141                	addi	sp,sp,-16
ffffffffc0205b4c:	0002c697          	auipc	a3,0x2c
ffffffffc0205b50:	e8c68693          	addi	a3,a3,-372 # ffffffffc02319d8 <default_sched_class>
ffffffffc0205b54:	e022                	sd	s0,0(sp)
ffffffffc0205b56:	e406                	sd	ra,8(sp)
ffffffffc0205b58:	00037797          	auipc	a5,0x37
ffffffffc0205b5c:	2e078793          	addi	a5,a5,736 # ffffffffc023ce38 <timer_list>
ffffffffc0205b60:	6690                	ld	a2,8(a3)
ffffffffc0205b62:	00037717          	auipc	a4,0x37
ffffffffc0205b66:	2b670713          	addi	a4,a4,694 # ffffffffc023ce18 <__rq>
ffffffffc0205b6a:	e79c                	sd	a5,8(a5)
ffffffffc0205b6c:	e39c                	sd	a5,0(a5)
ffffffffc0205b6e:	4795                	li	a5,5
ffffffffc0205b70:	00037417          	auipc	s0,0x37
ffffffffc0205b74:	33840413          	addi	s0,s0,824 # ffffffffc023cea8 <sched_class>
ffffffffc0205b78:	cb5c                	sw	a5,20(a4)
ffffffffc0205b7a:	853a                	mv	a0,a4
ffffffffc0205b7c:	e014                	sd	a3,0(s0)
ffffffffc0205b7e:	00037797          	auipc	a5,0x37
ffffffffc0205b82:	32e7b123          	sd	a4,802(a5) # ffffffffc023cea0 <rq>
ffffffffc0205b86:	9602                	jalr	a2
ffffffffc0205b88:	601c                	ld	a5,0(s0)
ffffffffc0205b8a:	6402                	ld	s0,0(sp)
ffffffffc0205b8c:	60a2                	ld	ra,8(sp)
ffffffffc0205b8e:	638c                	ld	a1,0(a5)
ffffffffc0205b90:	00005517          	auipc	a0,0x5
ffffffffc0205b94:	34050513          	addi	a0,a0,832 # ffffffffc020aed0 <default_pmm_manager+0xad0>
ffffffffc0205b98:	0141                	addi	sp,sp,16
ffffffffc0205b9a:	d3afa06f          	j	ffffffffc02000d4 <cprintf>

ffffffffc0205b9e <wakeup_proc>:
ffffffffc0205b9e:	4118                	lw	a4,0(a0)
ffffffffc0205ba0:	1101                	addi	sp,sp,-32
ffffffffc0205ba2:	ec06                	sd	ra,24(sp)
ffffffffc0205ba4:	e822                	sd	s0,16(sp)
ffffffffc0205ba6:	e426                	sd	s1,8(sp)
ffffffffc0205ba8:	478d                	li	a5,3
ffffffffc0205baa:	08f70763          	beq	a4,a5,ffffffffc0205c38 <wakeup_proc+0x9a>
ffffffffc0205bae:	842a                	mv	s0,a0
ffffffffc0205bb0:	100027f3          	csrr	a5,sstatus
ffffffffc0205bb4:	8b89                	andi	a5,a5,2
ffffffffc0205bb6:	4481                	li	s1,0
ffffffffc0205bb8:	ebbd                	bnez	a5,ffffffffc0205c2e <wakeup_proc+0x90>
ffffffffc0205bba:	4789                	li	a5,2
ffffffffc0205bbc:	04f70c63          	beq	a4,a5,ffffffffc0205c14 <wakeup_proc+0x76>
ffffffffc0205bc0:	00037717          	auipc	a4,0x37
ffffffffc0205bc4:	2c070713          	addi	a4,a4,704 # ffffffffc023ce80 <current>
ffffffffc0205bc8:	6318                	ld	a4,0(a4)
ffffffffc0205bca:	0e042623          	sw	zero,236(s0)
ffffffffc0205bce:	c01c                	sw	a5,0(s0)
ffffffffc0205bd0:	02870663          	beq	a4,s0,ffffffffc0205bfc <wakeup_proc+0x5e>
ffffffffc0205bd4:	00037797          	auipc	a5,0x37
ffffffffc0205bd8:	2b478793          	addi	a5,a5,692 # ffffffffc023ce88 <idleproc>
ffffffffc0205bdc:	639c                	ld	a5,0(a5)
ffffffffc0205bde:	00f40f63          	beq	s0,a5,ffffffffc0205bfc <wakeup_proc+0x5e>
ffffffffc0205be2:	00037797          	auipc	a5,0x37
ffffffffc0205be6:	2c678793          	addi	a5,a5,710 # ffffffffc023cea8 <sched_class>
ffffffffc0205bea:	639c                	ld	a5,0(a5)
ffffffffc0205bec:	00037717          	auipc	a4,0x37
ffffffffc0205bf0:	2b470713          	addi	a4,a4,692 # ffffffffc023cea0 <rq>
ffffffffc0205bf4:	6308                	ld	a0,0(a4)
ffffffffc0205bf6:	6b9c                	ld	a5,16(a5)
ffffffffc0205bf8:	85a2                	mv	a1,s0
ffffffffc0205bfa:	9782                	jalr	a5
ffffffffc0205bfc:	e491                	bnez	s1,ffffffffc0205c08 <wakeup_proc+0x6a>
ffffffffc0205bfe:	60e2                	ld	ra,24(sp)
ffffffffc0205c00:	6442                	ld	s0,16(sp)
ffffffffc0205c02:	64a2                	ld	s1,8(sp)
ffffffffc0205c04:	6105                	addi	sp,sp,32
ffffffffc0205c06:	8082                	ret
ffffffffc0205c08:	6442                	ld	s0,16(sp)
ffffffffc0205c0a:	60e2                	ld	ra,24(sp)
ffffffffc0205c0c:	64a2                	ld	s1,8(sp)
ffffffffc0205c0e:	6105                	addi	sp,sp,32
ffffffffc0205c10:	a37fa06f          	j	ffffffffc0200646 <intr_enable>
ffffffffc0205c14:	00005617          	auipc	a2,0x5
ffffffffc0205c18:	30c60613          	addi	a2,a2,780 # ffffffffc020af20 <default_pmm_manager+0xb20>
ffffffffc0205c1c:	04800593          	li	a1,72
ffffffffc0205c20:	00005517          	auipc	a0,0x5
ffffffffc0205c24:	2e850513          	addi	a0,a0,744 # ffffffffc020af08 <default_pmm_manager+0xb08>
ffffffffc0205c28:	e5cfa0ef          	jal	ra,ffffffffc0200284 <__warn>
ffffffffc0205c2c:	bfc1                	j	ffffffffc0205bfc <wakeup_proc+0x5e>
ffffffffc0205c2e:	a1ffa0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0205c32:	4018                	lw	a4,0(s0)
ffffffffc0205c34:	4485                	li	s1,1
ffffffffc0205c36:	b751                	j	ffffffffc0205bba <wakeup_proc+0x1c>
ffffffffc0205c38:	00005697          	auipc	a3,0x5
ffffffffc0205c3c:	2b068693          	addi	a3,a3,688 # ffffffffc020aee8 <default_pmm_manager+0xae8>
ffffffffc0205c40:	00003617          	auipc	a2,0x3
ffffffffc0205c44:	64860613          	addi	a2,a2,1608 # ffffffffc0209288 <commands+0x480>
ffffffffc0205c48:	03c00593          	li	a1,60
ffffffffc0205c4c:	00005517          	auipc	a0,0x5
ffffffffc0205c50:	2bc50513          	addi	a0,a0,700 # ffffffffc020af08 <default_pmm_manager+0xb08>
ffffffffc0205c54:	dc4fa0ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc0205c58 <schedule>:
ffffffffc0205c58:	7179                	addi	sp,sp,-48
ffffffffc0205c5a:	f406                	sd	ra,40(sp)
ffffffffc0205c5c:	f022                	sd	s0,32(sp)
ffffffffc0205c5e:	ec26                	sd	s1,24(sp)
ffffffffc0205c60:	e84a                	sd	s2,16(sp)
ffffffffc0205c62:	e44e                	sd	s3,8(sp)
ffffffffc0205c64:	e052                	sd	s4,0(sp)
ffffffffc0205c66:	100027f3          	csrr	a5,sstatus
ffffffffc0205c6a:	8b89                	andi	a5,a5,2
ffffffffc0205c6c:	4a01                	li	s4,0
ffffffffc0205c6e:	e7d5                	bnez	a5,ffffffffc0205d1a <schedule+0xc2>
ffffffffc0205c70:	00037497          	auipc	s1,0x37
ffffffffc0205c74:	21048493          	addi	s1,s1,528 # ffffffffc023ce80 <current>
ffffffffc0205c78:	608c                	ld	a1,0(s1)
ffffffffc0205c7a:	00037997          	auipc	s3,0x37
ffffffffc0205c7e:	22e98993          	addi	s3,s3,558 # ffffffffc023cea8 <sched_class>
ffffffffc0205c82:	00037917          	auipc	s2,0x37
ffffffffc0205c86:	21e90913          	addi	s2,s2,542 # ffffffffc023cea0 <rq>
ffffffffc0205c8a:	4194                	lw	a3,0(a1)
ffffffffc0205c8c:	0005bc23          	sd	zero,24(a1)
ffffffffc0205c90:	4709                	li	a4,2
ffffffffc0205c92:	0009b783          	ld	a5,0(s3)
ffffffffc0205c96:	00093503          	ld	a0,0(s2)
ffffffffc0205c9a:	04e68063          	beq	a3,a4,ffffffffc0205cda <schedule+0x82>
ffffffffc0205c9e:	739c                	ld	a5,32(a5)
ffffffffc0205ca0:	9782                	jalr	a5
ffffffffc0205ca2:	842a                	mv	s0,a0
ffffffffc0205ca4:	cd21                	beqz	a0,ffffffffc0205cfc <schedule+0xa4>
ffffffffc0205ca6:	0009b783          	ld	a5,0(s3)
ffffffffc0205caa:	00093503          	ld	a0,0(s2)
ffffffffc0205cae:	85a2                	mv	a1,s0
ffffffffc0205cb0:	6f9c                	ld	a5,24(a5)
ffffffffc0205cb2:	9782                	jalr	a5
ffffffffc0205cb4:	441c                	lw	a5,8(s0)
ffffffffc0205cb6:	6098                	ld	a4,0(s1)
ffffffffc0205cb8:	2785                	addiw	a5,a5,1
ffffffffc0205cba:	c41c                	sw	a5,8(s0)
ffffffffc0205cbc:	00870563          	beq	a4,s0,ffffffffc0205cc6 <schedule+0x6e>
ffffffffc0205cc0:	8522                	mv	a0,s0
ffffffffc0205cc2:	e07fe0ef          	jal	ra,ffffffffc0204ac8 <proc_run>
ffffffffc0205cc6:	040a1163          	bnez	s4,ffffffffc0205d08 <schedule+0xb0>
ffffffffc0205cca:	70a2                	ld	ra,40(sp)
ffffffffc0205ccc:	7402                	ld	s0,32(sp)
ffffffffc0205cce:	64e2                	ld	s1,24(sp)
ffffffffc0205cd0:	6942                	ld	s2,16(sp)
ffffffffc0205cd2:	69a2                	ld	s3,8(sp)
ffffffffc0205cd4:	6a02                	ld	s4,0(sp)
ffffffffc0205cd6:	6145                	addi	sp,sp,48
ffffffffc0205cd8:	8082                	ret
ffffffffc0205cda:	00037717          	auipc	a4,0x37
ffffffffc0205cde:	1ae70713          	addi	a4,a4,430 # ffffffffc023ce88 <idleproc>
ffffffffc0205ce2:	6318                	ld	a4,0(a4)
ffffffffc0205ce4:	fae58de3          	beq	a1,a4,ffffffffc0205c9e <schedule+0x46>
ffffffffc0205ce8:	6b9c                	ld	a5,16(a5)
ffffffffc0205cea:	9782                	jalr	a5
ffffffffc0205cec:	0009b783          	ld	a5,0(s3)
ffffffffc0205cf0:	00093503          	ld	a0,0(s2)
ffffffffc0205cf4:	739c                	ld	a5,32(a5)
ffffffffc0205cf6:	9782                	jalr	a5
ffffffffc0205cf8:	842a                	mv	s0,a0
ffffffffc0205cfa:	f555                	bnez	a0,ffffffffc0205ca6 <schedule+0x4e>
ffffffffc0205cfc:	00037797          	auipc	a5,0x37
ffffffffc0205d00:	18c78793          	addi	a5,a5,396 # ffffffffc023ce88 <idleproc>
ffffffffc0205d04:	6380                	ld	s0,0(a5)
ffffffffc0205d06:	b77d                	j	ffffffffc0205cb4 <schedule+0x5c>
ffffffffc0205d08:	7402                	ld	s0,32(sp)
ffffffffc0205d0a:	70a2                	ld	ra,40(sp)
ffffffffc0205d0c:	64e2                	ld	s1,24(sp)
ffffffffc0205d0e:	6942                	ld	s2,16(sp)
ffffffffc0205d10:	69a2                	ld	s3,8(sp)
ffffffffc0205d12:	6a02                	ld	s4,0(sp)
ffffffffc0205d14:	6145                	addi	sp,sp,48
ffffffffc0205d16:	931fa06f          	j	ffffffffc0200646 <intr_enable>
ffffffffc0205d1a:	933fa0ef          	jal	ra,ffffffffc020064c <intr_disable>
ffffffffc0205d1e:	4a05                	li	s4,1
ffffffffc0205d20:	bf81                	j	ffffffffc0205c70 <schedule+0x18>

ffffffffc0205d22 <proc_stride_comp_f>:
ffffffffc0205d22:	4d08                	lw	a0,24(a0)
ffffffffc0205d24:	4d9c                	lw	a5,24(a1)
ffffffffc0205d26:	9d1d                	subw	a0,a0,a5
ffffffffc0205d28:	00a04763          	bgtz	a0,ffffffffc0205d36 <proc_stride_comp_f+0x14>
ffffffffc0205d2c:	00a03533          	snez	a0,a0
ffffffffc0205d30:	40a00533          	neg	a0,a0
ffffffffc0205d34:	8082                	ret
ffffffffc0205d36:	4505                	li	a0,1
ffffffffc0205d38:	8082                	ret

ffffffffc0205d3a <stride_init>:
ffffffffc0205d3a:	e508                	sd	a0,8(a0)
ffffffffc0205d3c:	e108                	sd	a0,0(a0)
ffffffffc0205d3e:	00053c23          	sd	zero,24(a0)
ffffffffc0205d42:	00052823          	sw	zero,16(a0)
ffffffffc0205d46:	8082                	ret

ffffffffc0205d48 <stride_pick_next>:
ffffffffc0205d48:	6d1c                	ld	a5,24(a0)
ffffffffc0205d4a:	c385                	beqz	a5,ffffffffc0205d6a <stride_pick_next+0x22>
ffffffffc0205d4c:	4fd4                	lw	a3,28(a5)
ffffffffc0205d4e:	ed878513          	addi	a0,a5,-296
ffffffffc0205d52:	4f90                	lw	a2,24(a5)
ffffffffc0205d54:	40000737          	lui	a4,0x40000
ffffffffc0205d58:	e681                	bnez	a3,ffffffffc0205d60 <stride_pick_next+0x18>
ffffffffc0205d5a:	9f31                	addw	a4,a4,a2
ffffffffc0205d5c:	cf98                	sw	a4,24(a5)
ffffffffc0205d5e:	8082                	ret
ffffffffc0205d60:	02d7573b          	divuw	a4,a4,a3
ffffffffc0205d64:	9f31                	addw	a4,a4,a2
ffffffffc0205d66:	cf98                	sw	a4,24(a5)
ffffffffc0205d68:	8082                	ret
ffffffffc0205d6a:	4501                	li	a0,0
ffffffffc0205d6c:	8082                	ret

ffffffffc0205d6e <stride_proc_tick>:
ffffffffc0205d6e:	1205a783          	lw	a5,288(a1)
ffffffffc0205d72:	00f05563          	blez	a5,ffffffffc0205d7c <stride_proc_tick+0xe>
ffffffffc0205d76:	37fd                	addiw	a5,a5,-1
ffffffffc0205d78:	12f5a023          	sw	a5,288(a1)
ffffffffc0205d7c:	e399                	bnez	a5,ffffffffc0205d82 <stride_proc_tick+0x14>
ffffffffc0205d7e:	4785                	li	a5,1
ffffffffc0205d80:	ed9c                	sd	a5,24(a1)
ffffffffc0205d82:	8082                	ret

ffffffffc0205d84 <skew_heap_merge.constprop.2>:
ffffffffc0205d84:	1101                	addi	sp,sp,-32
ffffffffc0205d86:	e822                	sd	s0,16(sp)
ffffffffc0205d88:	ec06                	sd	ra,24(sp)
ffffffffc0205d8a:	e426                	sd	s1,8(sp)
ffffffffc0205d8c:	e04a                	sd	s2,0(sp)
ffffffffc0205d8e:	842e                	mv	s0,a1
ffffffffc0205d90:	c11d                	beqz	a0,ffffffffc0205db6 <skew_heap_merge.constprop.2+0x32>
ffffffffc0205d92:	84aa                	mv	s1,a0
ffffffffc0205d94:	c1b9                	beqz	a1,ffffffffc0205dda <skew_heap_merge.constprop.2+0x56>
ffffffffc0205d96:	f8dff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205d9a:	57fd                	li	a5,-1
ffffffffc0205d9c:	02f50463          	beq	a0,a5,ffffffffc0205dc4 <skew_heap_merge.constprop.2+0x40>
ffffffffc0205da0:	680c                	ld	a1,16(s0)
ffffffffc0205da2:	00843903          	ld	s2,8(s0)
ffffffffc0205da6:	8526                	mv	a0,s1
ffffffffc0205da8:	fddff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0205dac:	e408                	sd	a0,8(s0)
ffffffffc0205dae:	01243823          	sd	s2,16(s0)
ffffffffc0205db2:	c111                	beqz	a0,ffffffffc0205db6 <skew_heap_merge.constprop.2+0x32>
ffffffffc0205db4:	e100                	sd	s0,0(a0)
ffffffffc0205db6:	8522                	mv	a0,s0
ffffffffc0205db8:	60e2                	ld	ra,24(sp)
ffffffffc0205dba:	6442                	ld	s0,16(sp)
ffffffffc0205dbc:	64a2                	ld	s1,8(sp)
ffffffffc0205dbe:	6902                	ld	s2,0(sp)
ffffffffc0205dc0:	6105                	addi	sp,sp,32
ffffffffc0205dc2:	8082                	ret
ffffffffc0205dc4:	6888                	ld	a0,16(s1)
ffffffffc0205dc6:	0084b903          	ld	s2,8(s1)
ffffffffc0205dca:	85a2                	mv	a1,s0
ffffffffc0205dcc:	fb9ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0205dd0:	e488                	sd	a0,8(s1)
ffffffffc0205dd2:	0124b823          	sd	s2,16(s1)
ffffffffc0205dd6:	c111                	beqz	a0,ffffffffc0205dda <skew_heap_merge.constprop.2+0x56>
ffffffffc0205dd8:	e104                	sd	s1,0(a0)
ffffffffc0205dda:	60e2                	ld	ra,24(sp)
ffffffffc0205ddc:	6442                	ld	s0,16(sp)
ffffffffc0205dde:	8526                	mv	a0,s1
ffffffffc0205de0:	6902                	ld	s2,0(sp)
ffffffffc0205de2:	64a2                	ld	s1,8(sp)
ffffffffc0205de4:	6105                	addi	sp,sp,32
ffffffffc0205de6:	8082                	ret

ffffffffc0205de8 <stride_enqueue>:
ffffffffc0205de8:	7119                	addi	sp,sp,-128
ffffffffc0205dea:	ecce                	sd	s3,88(sp)
ffffffffc0205dec:	01853983          	ld	s3,24(a0)
ffffffffc0205df0:	f8a2                	sd	s0,112(sp)
ffffffffc0205df2:	f4a6                	sd	s1,104(sp)
ffffffffc0205df4:	f0ca                	sd	s2,96(sp)
ffffffffc0205df6:	fc86                	sd	ra,120(sp)
ffffffffc0205df8:	e8d2                	sd	s4,80(sp)
ffffffffc0205dfa:	e4d6                	sd	s5,72(sp)
ffffffffc0205dfc:	e0da                	sd	s6,64(sp)
ffffffffc0205dfe:	fc5e                	sd	s7,56(sp)
ffffffffc0205e00:	f862                	sd	s8,48(sp)
ffffffffc0205e02:	f466                	sd	s9,40(sp)
ffffffffc0205e04:	f06a                	sd	s10,32(sp)
ffffffffc0205e06:	ec6e                	sd	s11,24(sp)
ffffffffc0205e08:	1205b423          	sd	zero,296(a1)
ffffffffc0205e0c:	1205bc23          	sd	zero,312(a1)
ffffffffc0205e10:	1205b823          	sd	zero,304(a1)
ffffffffc0205e14:	84aa                	mv	s1,a0
ffffffffc0205e16:	842e                	mv	s0,a1
ffffffffc0205e18:	12858913          	addi	s2,a1,296
ffffffffc0205e1c:	02098063          	beqz	s3,ffffffffc0205e3c <stride_enqueue+0x54>
ffffffffc0205e20:	08090c63          	beqz	s2,ffffffffc0205eb8 <stride_enqueue+0xd0>
ffffffffc0205e24:	85ca                	mv	a1,s2
ffffffffc0205e26:	854e                	mv	a0,s3
ffffffffc0205e28:	efbff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205e2c:	57fd                	li	a5,-1
ffffffffc0205e2e:	8a2a                	mv	s4,a0
ffffffffc0205e30:	04f50563          	beq	a0,a5,ffffffffc0205e7a <stride_enqueue+0x92>
ffffffffc0205e34:	13343823          	sd	s3,304(s0)
ffffffffc0205e38:	0129b023          	sd	s2,0(s3)
ffffffffc0205e3c:	12042783          	lw	a5,288(s0)
ffffffffc0205e40:	0124bc23          	sd	s2,24(s1)
ffffffffc0205e44:	48d8                	lw	a4,20(s1)
ffffffffc0205e46:	e79d                	bnez	a5,ffffffffc0205e74 <stride_enqueue+0x8c>
ffffffffc0205e48:	12e42023          	sw	a4,288(s0)
ffffffffc0205e4c:	489c                	lw	a5,16(s1)
ffffffffc0205e4e:	70e6                	ld	ra,120(sp)
ffffffffc0205e50:	10943423          	sd	s1,264(s0)
ffffffffc0205e54:	7446                	ld	s0,112(sp)
ffffffffc0205e56:	2785                	addiw	a5,a5,1
ffffffffc0205e58:	c89c                	sw	a5,16(s1)
ffffffffc0205e5a:	7906                	ld	s2,96(sp)
ffffffffc0205e5c:	74a6                	ld	s1,104(sp)
ffffffffc0205e5e:	69e6                	ld	s3,88(sp)
ffffffffc0205e60:	6a46                	ld	s4,80(sp)
ffffffffc0205e62:	6aa6                	ld	s5,72(sp)
ffffffffc0205e64:	6b06                	ld	s6,64(sp)
ffffffffc0205e66:	7be2                	ld	s7,56(sp)
ffffffffc0205e68:	7c42                	ld	s8,48(sp)
ffffffffc0205e6a:	7ca2                	ld	s9,40(sp)
ffffffffc0205e6c:	7d02                	ld	s10,32(sp)
ffffffffc0205e6e:	6de2                	ld	s11,24(sp)
ffffffffc0205e70:	6109                	addi	sp,sp,128
ffffffffc0205e72:	8082                	ret
ffffffffc0205e74:	fcf75ce3          	bge	a4,a5,ffffffffc0205e4c <stride_enqueue+0x64>
ffffffffc0205e78:	bfc1                	j	ffffffffc0205e48 <stride_enqueue+0x60>
ffffffffc0205e7a:	0109ba83          	ld	s5,16(s3)
ffffffffc0205e7e:	0089bb03          	ld	s6,8(s3)
ffffffffc0205e82:	000a8d63          	beqz	s5,ffffffffc0205e9c <stride_enqueue+0xb4>
ffffffffc0205e86:	85ca                	mv	a1,s2
ffffffffc0205e88:	8556                	mv	a0,s5
ffffffffc0205e8a:	e99ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205e8e:	8baa                	mv	s7,a0
ffffffffc0205e90:	03450c63          	beq	a0,s4,ffffffffc0205ec8 <stride_enqueue+0xe0>
ffffffffc0205e94:	13543823          	sd	s5,304(s0)
ffffffffc0205e98:	012ab023          	sd	s2,0(s5)
ffffffffc0205e9c:	0129b423          	sd	s2,8(s3)
ffffffffc0205ea0:	0169b823          	sd	s6,16(s3)
ffffffffc0205ea4:	12042783          	lw	a5,288(s0)
ffffffffc0205ea8:	01393023          	sd	s3,0(s2)
ffffffffc0205eac:	894e                	mv	s2,s3
ffffffffc0205eae:	0124bc23          	sd	s2,24(s1)
ffffffffc0205eb2:	48d8                	lw	a4,20(s1)
ffffffffc0205eb4:	dbd1                	beqz	a5,ffffffffc0205e48 <stride_enqueue+0x60>
ffffffffc0205eb6:	bf7d                	j	ffffffffc0205e74 <stride_enqueue+0x8c>
ffffffffc0205eb8:	12042783          	lw	a5,288(s0)
ffffffffc0205ebc:	894e                	mv	s2,s3
ffffffffc0205ebe:	0124bc23          	sd	s2,24(s1)
ffffffffc0205ec2:	48d8                	lw	a4,20(s1)
ffffffffc0205ec4:	d3d1                	beqz	a5,ffffffffc0205e48 <stride_enqueue+0x60>
ffffffffc0205ec6:	b77d                	j	ffffffffc0205e74 <stride_enqueue+0x8c>
ffffffffc0205ec8:	010aba03          	ld	s4,16(s5)
ffffffffc0205ecc:	008abc03          	ld	s8,8(s5)
ffffffffc0205ed0:	000a0d63          	beqz	s4,ffffffffc0205eea <stride_enqueue+0x102>
ffffffffc0205ed4:	85ca                	mv	a1,s2
ffffffffc0205ed6:	8552                	mv	a0,s4
ffffffffc0205ed8:	e4bff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205edc:	8caa                	mv	s9,a0
ffffffffc0205ede:	01750e63          	beq	a0,s7,ffffffffc0205efa <stride_enqueue+0x112>
ffffffffc0205ee2:	13443823          	sd	s4,304(s0)
ffffffffc0205ee6:	012a3023          	sd	s2,0(s4)
ffffffffc0205eea:	012ab423          	sd	s2,8(s5)
ffffffffc0205eee:	018ab823          	sd	s8,16(s5)
ffffffffc0205ef2:	01593023          	sd	s5,0(s2)
ffffffffc0205ef6:	8956                	mv	s2,s5
ffffffffc0205ef8:	b755                	j	ffffffffc0205e9c <stride_enqueue+0xb4>
ffffffffc0205efa:	010a3b83          	ld	s7,16(s4)
ffffffffc0205efe:	008a3d03          	ld	s10,8(s4)
ffffffffc0205f02:	000b8c63          	beqz	s7,ffffffffc0205f1a <stride_enqueue+0x132>
ffffffffc0205f06:	85ca                	mv	a1,s2
ffffffffc0205f08:	855e                	mv	a0,s7
ffffffffc0205f0a:	e19ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205f0e:	01950e63          	beq	a0,s9,ffffffffc0205f2a <stride_enqueue+0x142>
ffffffffc0205f12:	13743823          	sd	s7,304(s0)
ffffffffc0205f16:	012bb023          	sd	s2,0(s7)
ffffffffc0205f1a:	012a3423          	sd	s2,8(s4)
ffffffffc0205f1e:	01aa3823          	sd	s10,16(s4)
ffffffffc0205f22:	01493023          	sd	s4,0(s2)
ffffffffc0205f26:	8952                	mv	s2,s4
ffffffffc0205f28:	b7c9                	j	ffffffffc0205eea <stride_enqueue+0x102>
ffffffffc0205f2a:	010bbc83          	ld	s9,16(s7)
ffffffffc0205f2e:	008bbd83          	ld	s11,8(s7)
ffffffffc0205f32:	000c8d63          	beqz	s9,ffffffffc0205f4c <stride_enqueue+0x164>
ffffffffc0205f36:	85ca                	mv	a1,s2
ffffffffc0205f38:	8566                	mv	a0,s9
ffffffffc0205f3a:	de9ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205f3e:	57fd                	li	a5,-1
ffffffffc0205f40:	00f50e63          	beq	a0,a5,ffffffffc0205f5c <stride_enqueue+0x174>
ffffffffc0205f44:	13943823          	sd	s9,304(s0)
ffffffffc0205f48:	012cb023          	sd	s2,0(s9)
ffffffffc0205f4c:	012bb423          	sd	s2,8(s7)
ffffffffc0205f50:	01bbb823          	sd	s11,16(s7)
ffffffffc0205f54:	01793023          	sd	s7,0(s2)
ffffffffc0205f58:	895e                	mv	s2,s7
ffffffffc0205f5a:	b7c1                	j	ffffffffc0205f1a <stride_enqueue+0x132>
ffffffffc0205f5c:	008cb783          	ld	a5,8(s9)
ffffffffc0205f60:	010cb503          	ld	a0,16(s9)
ffffffffc0205f64:	85ca                	mv	a1,s2
ffffffffc0205f66:	e43e                	sd	a5,8(sp)
ffffffffc0205f68:	e1dff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0205f6c:	67a2                	ld	a5,8(sp)
ffffffffc0205f6e:	00acb423          	sd	a0,8(s9)
ffffffffc0205f72:	00fcb823          	sd	a5,16(s9)
ffffffffc0205f76:	c509                	beqz	a0,ffffffffc0205f80 <stride_enqueue+0x198>
ffffffffc0205f78:	01953023          	sd	s9,0(a0)
ffffffffc0205f7c:	8966                	mv	s2,s9
ffffffffc0205f7e:	b7f9                	j	ffffffffc0205f4c <stride_enqueue+0x164>
ffffffffc0205f80:	8966                	mv	s2,s9
ffffffffc0205f82:	b7e9                	j	ffffffffc0205f4c <stride_enqueue+0x164>

ffffffffc0205f84 <stride_dequeue>:
ffffffffc0205f84:	7171                	addi	sp,sp,-176
ffffffffc0205f86:	ed26                	sd	s1,152(sp)
ffffffffc0205f88:	1305b483          	ld	s1,304(a1)
ffffffffc0205f8c:	f122                	sd	s0,160(sp)
ffffffffc0205f8e:	e94a                	sd	s2,144(sp)
ffffffffc0205f90:	fcd6                	sd	s5,120(sp)
ffffffffc0205f92:	f8da                	sd	s6,112(sp)
ffffffffc0205f94:	e4ee                	sd	s11,72(sp)
ffffffffc0205f96:	f506                	sd	ra,168(sp)
ffffffffc0205f98:	e54e                	sd	s3,136(sp)
ffffffffc0205f9a:	e152                	sd	s4,128(sp)
ffffffffc0205f9c:	f4de                	sd	s7,104(sp)
ffffffffc0205f9e:	f0e2                	sd	s8,96(sp)
ffffffffc0205fa0:	ece6                	sd	s9,88(sp)
ffffffffc0205fa2:	e8ea                	sd	s10,80(sp)
ffffffffc0205fa4:	892e                	mv	s2,a1
ffffffffc0205fa6:	8aaa                	mv	s5,a0
ffffffffc0205fa8:	01853b03          	ld	s6,24(a0)
ffffffffc0205fac:	1285bd83          	ld	s11,296(a1)
ffffffffc0205fb0:	1385b403          	ld	s0,312(a1)
ffffffffc0205fb4:	2c048363          	beqz	s1,ffffffffc020627a <stride_dequeue+0x2f6>
ffffffffc0205fb8:	3e040163          	beqz	s0,ffffffffc020639a <stride_dequeue+0x416>
ffffffffc0205fbc:	85a2                	mv	a1,s0
ffffffffc0205fbe:	8526                	mv	a0,s1
ffffffffc0205fc0:	d63ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205fc4:	5a7d                	li	s4,-1
ffffffffc0205fc6:	89aa                	mv	s3,a0
ffffffffc0205fc8:	17450d63          	beq	a0,s4,ffffffffc0206142 <stride_dequeue+0x1be>
ffffffffc0205fcc:	01043983          	ld	s3,16(s0)
ffffffffc0205fd0:	00843b83          	ld	s7,8(s0)
ffffffffc0205fd4:	12098163          	beqz	s3,ffffffffc02060f6 <stride_dequeue+0x172>
ffffffffc0205fd8:	85ce                	mv	a1,s3
ffffffffc0205fda:	8526                	mv	a0,s1
ffffffffc0205fdc:	d47ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205fe0:	8caa                	mv	s9,a0
ffffffffc0205fe2:	2b450563          	beq	a0,s4,ffffffffc020628c <stride_dequeue+0x308>
ffffffffc0205fe6:	0109bd03          	ld	s10,16(s3)
ffffffffc0205fea:	0089bc03          	ld	s8,8(s3)
ffffffffc0205fee:	0e0d0d63          	beqz	s10,ffffffffc02060e8 <stride_dequeue+0x164>
ffffffffc0205ff2:	85ea                	mv	a1,s10
ffffffffc0205ff4:	8526                	mv	a0,s1
ffffffffc0205ff6:	d2dff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0205ffa:	8caa                	mv	s9,a0
ffffffffc0205ffc:	75450a63          	beq	a0,s4,ffffffffc0206750 <stride_dequeue+0x7cc>
ffffffffc0206000:	008d3783          	ld	a5,8(s10)
ffffffffc0206004:	010d3c83          	ld	s9,16(s10)
ffffffffc0206008:	e43e                	sd	a5,8(sp)
ffffffffc020600a:	0c0c8763          	beqz	s9,ffffffffc02060d8 <stride_dequeue+0x154>
ffffffffc020600e:	85e6                	mv	a1,s9
ffffffffc0206010:	8526                	mv	a0,s1
ffffffffc0206012:	d11ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206016:	69450063          	beq	a0,s4,ffffffffc0206696 <stride_dequeue+0x712>
ffffffffc020601a:	008cb783          	ld	a5,8(s9)
ffffffffc020601e:	010cba03          	ld	s4,16(s9)
ffffffffc0206022:	e83e                	sd	a5,16(sp)
ffffffffc0206024:	0a0a0263          	beqz	s4,ffffffffc02060c8 <stride_dequeue+0x144>
ffffffffc0206028:	85d2                	mv	a1,s4
ffffffffc020602a:	8526                	mv	a0,s1
ffffffffc020602c:	cf7ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206030:	58fd                	li	a7,-1
ffffffffc0206032:	351503e3          	beq	a0,a7,ffffffffc0206b78 <stride_dequeue+0xbf4>
ffffffffc0206036:	008a3703          	ld	a4,8(s4)
ffffffffc020603a:	010a3783          	ld	a5,16(s4)
ffffffffc020603e:	ec3a                	sd	a4,24(sp)
ffffffffc0206040:	cfa5                	beqz	a5,ffffffffc02060b8 <stride_dequeue+0x134>
ffffffffc0206042:	85be                	mv	a1,a5
ffffffffc0206044:	8526                	mv	a0,s1
ffffffffc0206046:	f03e                	sd	a5,32(sp)
ffffffffc0206048:	cdbff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020604c:	58fd                	li	a7,-1
ffffffffc020604e:	7782                	ld	a5,32(sp)
ffffffffc0206050:	01151463          	bne	a0,a7,ffffffffc0206058 <stride_dequeue+0xd4>
ffffffffc0206054:	0580106f          	j	ffffffffc02070ac <stride_dequeue+0x1128>
ffffffffc0206058:	6798                	ld	a4,8(a5)
ffffffffc020605a:	0107b303          	ld	t1,16(a5)
ffffffffc020605e:	f03a                	sd	a4,32(sp)
ffffffffc0206060:	00031463          	bnez	t1,ffffffffc0206068 <stride_dequeue+0xe4>
ffffffffc0206064:	6a00106f          	j	ffffffffc0207704 <stride_dequeue+0x1780>
ffffffffc0206068:	859a                	mv	a1,t1
ffffffffc020606a:	8526                	mv	a0,s1
ffffffffc020606c:	f83e                	sd	a5,48(sp)
ffffffffc020606e:	f41a                	sd	t1,40(sp)
ffffffffc0206070:	cb3ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206074:	58fd                	li	a7,-1
ffffffffc0206076:	7322                	ld	t1,40(sp)
ffffffffc0206078:	77c2                	ld	a5,48(sp)
ffffffffc020607a:	01151463          	bne	a0,a7,ffffffffc0206082 <stride_dequeue+0xfe>
ffffffffc020607e:	6620106f          	j	ffffffffc02076e0 <stride_dequeue+0x175c>
ffffffffc0206082:	00833883          	ld	a7,8(t1)
ffffffffc0206086:	01033583          	ld	a1,16(t1)
ffffffffc020608a:	8526                	mv	a0,s1
ffffffffc020608c:	fc3e                	sd	a5,56(sp)
ffffffffc020608e:	f81a                	sd	t1,48(sp)
ffffffffc0206090:	f446                	sd	a7,40(sp)
ffffffffc0206092:	cf3ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206096:	7342                	ld	t1,48(sp)
ffffffffc0206098:	78a2                	ld	a7,40(sp)
ffffffffc020609a:	77e2                	ld	a5,56(sp)
ffffffffc020609c:	00a33423          	sd	a0,8(t1)
ffffffffc02060a0:	01133823          	sd	a7,16(t1)
ffffffffc02060a4:	c119                	beqz	a0,ffffffffc02060aa <stride_dequeue+0x126>
ffffffffc02060a6:	00653023          	sd	t1,0(a0)
ffffffffc02060aa:	7702                	ld	a4,32(sp)
ffffffffc02060ac:	0067b423          	sd	t1,8(a5)
ffffffffc02060b0:	84be                	mv	s1,a5
ffffffffc02060b2:	eb98                	sd	a4,16(a5)
ffffffffc02060b4:	00f33023          	sd	a5,0(t1)
ffffffffc02060b8:	67e2                	ld	a5,24(sp)
ffffffffc02060ba:	009a3423          	sd	s1,8(s4)
ffffffffc02060be:	00fa3823          	sd	a5,16(s4)
ffffffffc02060c2:	0144b023          	sd	s4,0(s1)
ffffffffc02060c6:	84d2                	mv	s1,s4
ffffffffc02060c8:	67c2                	ld	a5,16(sp)
ffffffffc02060ca:	009cb423          	sd	s1,8(s9)
ffffffffc02060ce:	00fcb823          	sd	a5,16(s9)
ffffffffc02060d2:	0194b023          	sd	s9,0(s1)
ffffffffc02060d6:	84e6                	mv	s1,s9
ffffffffc02060d8:	67a2                	ld	a5,8(sp)
ffffffffc02060da:	009d3423          	sd	s1,8(s10)
ffffffffc02060de:	00fd3823          	sd	a5,16(s10)
ffffffffc02060e2:	01a4b023          	sd	s10,0(s1)
ffffffffc02060e6:	84ea                	mv	s1,s10
ffffffffc02060e8:	0099b423          	sd	s1,8(s3)
ffffffffc02060ec:	0189b823          	sd	s8,16(s3)
ffffffffc02060f0:	0134b023          	sd	s3,0(s1)
ffffffffc02060f4:	84ce                	mv	s1,s3
ffffffffc02060f6:	e404                	sd	s1,8(s0)
ffffffffc02060f8:	01743823          	sd	s7,16(s0)
ffffffffc02060fc:	e080                	sd	s0,0(s1)
ffffffffc02060fe:	01b43023          	sd	s11,0(s0)
ffffffffc0206102:	180d8063          	beqz	s11,ffffffffc0206282 <stride_dequeue+0x2fe>
ffffffffc0206106:	008db703          	ld	a4,8(s11)
ffffffffc020610a:	12890913          	addi	s2,s2,296
ffffffffc020610e:	17270c63          	beq	a4,s2,ffffffffc0206286 <stride_dequeue+0x302>
ffffffffc0206112:	008db823          	sd	s0,16(s11)
ffffffffc0206116:	010aa783          	lw	a5,16(s5)
ffffffffc020611a:	70aa                	ld	ra,168(sp)
ffffffffc020611c:	740a                	ld	s0,160(sp)
ffffffffc020611e:	37fd                	addiw	a5,a5,-1
ffffffffc0206120:	016abc23          	sd	s6,24(s5)
ffffffffc0206124:	00faa823          	sw	a5,16(s5)
ffffffffc0206128:	64ea                	ld	s1,152(sp)
ffffffffc020612a:	694a                	ld	s2,144(sp)
ffffffffc020612c:	69aa                	ld	s3,136(sp)
ffffffffc020612e:	6a0a                	ld	s4,128(sp)
ffffffffc0206130:	7ae6                	ld	s5,120(sp)
ffffffffc0206132:	7b46                	ld	s6,112(sp)
ffffffffc0206134:	7ba6                	ld	s7,104(sp)
ffffffffc0206136:	7c06                	ld	s8,96(sp)
ffffffffc0206138:	6ce6                	ld	s9,88(sp)
ffffffffc020613a:	6d46                	ld	s10,80(sp)
ffffffffc020613c:	6da6                	ld	s11,72(sp)
ffffffffc020613e:	614d                	addi	sp,sp,176
ffffffffc0206140:	8082                	ret
ffffffffc0206142:	0104ba03          	ld	s4,16(s1)
ffffffffc0206146:	0084bb83          	ld	s7,8(s1)
ffffffffc020614a:	120a0063          	beqz	s4,ffffffffc020626a <stride_dequeue+0x2e6>
ffffffffc020614e:	85a2                	mv	a1,s0
ffffffffc0206150:	8552                	mv	a0,s4
ffffffffc0206152:	bd1ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206156:	8caa                	mv	s9,a0
ffffffffc0206158:	25350563          	beq	a0,s3,ffffffffc02063a2 <stride_dequeue+0x41e>
ffffffffc020615c:	01043d03          	ld	s10,16(s0)
ffffffffc0206160:	00843c03          	ld	s8,8(s0)
ffffffffc0206164:	0e0d0d63          	beqz	s10,ffffffffc020625e <stride_dequeue+0x2da>
ffffffffc0206168:	85ea                	mv	a1,s10
ffffffffc020616a:	8552                	mv	a0,s4
ffffffffc020616c:	bb7ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206170:	8caa                	mv	s9,a0
ffffffffc0206172:	35350063          	beq	a0,s3,ffffffffc02064b2 <stride_dequeue+0x52e>
ffffffffc0206176:	008d3783          	ld	a5,8(s10)
ffffffffc020617a:	010d3c83          	ld	s9,16(s10)
ffffffffc020617e:	e43e                	sd	a5,8(sp)
ffffffffc0206180:	0c0c8763          	beqz	s9,ffffffffc020624e <stride_dequeue+0x2ca>
ffffffffc0206184:	85e6                	mv	a1,s9
ffffffffc0206186:	8552                	mv	a0,s4
ffffffffc0206188:	b9bff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020618c:	79350c63          	beq	a0,s3,ffffffffc0206924 <stride_dequeue+0x9a0>
ffffffffc0206190:	008cb783          	ld	a5,8(s9)
ffffffffc0206194:	010cb983          	ld	s3,16(s9)
ffffffffc0206198:	e83e                	sd	a5,16(sp)
ffffffffc020619a:	0a098263          	beqz	s3,ffffffffc020623e <stride_dequeue+0x2ba>
ffffffffc020619e:	85ce                	mv	a1,s3
ffffffffc02061a0:	8552                	mv	a0,s4
ffffffffc02061a2:	b81ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02061a6:	58fd                	li	a7,-1
ffffffffc02061a8:	4b1507e3          	beq	a0,a7,ffffffffc0206e56 <stride_dequeue+0xed2>
ffffffffc02061ac:	0089b703          	ld	a4,8(s3)
ffffffffc02061b0:	0109b783          	ld	a5,16(s3)
ffffffffc02061b4:	ec3a                	sd	a4,24(sp)
ffffffffc02061b6:	cfa5                	beqz	a5,ffffffffc020622e <stride_dequeue+0x2aa>
ffffffffc02061b8:	85be                	mv	a1,a5
ffffffffc02061ba:	8552                	mv	a0,s4
ffffffffc02061bc:	f03e                	sd	a5,32(sp)
ffffffffc02061be:	b65ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02061c2:	58fd                	li	a7,-1
ffffffffc02061c4:	7782                	ld	a5,32(sp)
ffffffffc02061c6:	01151463          	bne	a0,a7,ffffffffc02061ce <stride_dequeue+0x24a>
ffffffffc02061ca:	40e0106f          	j	ffffffffc02075d8 <stride_dequeue+0x1654>
ffffffffc02061ce:	6798                	ld	a4,8(a5)
ffffffffc02061d0:	0107b303          	ld	t1,16(a5)
ffffffffc02061d4:	f03a                	sd	a4,32(sp)
ffffffffc02061d6:	00031463          	bnez	t1,ffffffffc02061de <stride_dequeue+0x25a>
ffffffffc02061da:	0bb0106f          	j	ffffffffc0207a94 <stride_dequeue+0x1b10>
ffffffffc02061de:	859a                	mv	a1,t1
ffffffffc02061e0:	8552                	mv	a0,s4
ffffffffc02061e2:	f83e                	sd	a5,48(sp)
ffffffffc02061e4:	f41a                	sd	t1,40(sp)
ffffffffc02061e6:	b3dff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02061ea:	58fd                	li	a7,-1
ffffffffc02061ec:	7322                	ld	t1,40(sp)
ffffffffc02061ee:	77c2                	ld	a5,48(sp)
ffffffffc02061f0:	01151463          	bne	a0,a7,ffffffffc02061f8 <stride_dequeue+0x274>
ffffffffc02061f4:	2310106f          	j	ffffffffc0207c24 <stride_dequeue+0x1ca0>
ffffffffc02061f8:	00833883          	ld	a7,8(t1)
ffffffffc02061fc:	01033583          	ld	a1,16(t1)
ffffffffc0206200:	8552                	mv	a0,s4
ffffffffc0206202:	fc3e                	sd	a5,56(sp)
ffffffffc0206204:	f81a                	sd	t1,48(sp)
ffffffffc0206206:	f446                	sd	a7,40(sp)
ffffffffc0206208:	b7dff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020620c:	7342                	ld	t1,48(sp)
ffffffffc020620e:	78a2                	ld	a7,40(sp)
ffffffffc0206210:	77e2                	ld	a5,56(sp)
ffffffffc0206212:	00a33423          	sd	a0,8(t1)
ffffffffc0206216:	01133823          	sd	a7,16(t1)
ffffffffc020621a:	c119                	beqz	a0,ffffffffc0206220 <stride_dequeue+0x29c>
ffffffffc020621c:	00653023          	sd	t1,0(a0)
ffffffffc0206220:	7702                	ld	a4,32(sp)
ffffffffc0206222:	0067b423          	sd	t1,8(a5)
ffffffffc0206226:	8a3e                	mv	s4,a5
ffffffffc0206228:	eb98                	sd	a4,16(a5)
ffffffffc020622a:	00f33023          	sd	a5,0(t1)
ffffffffc020622e:	67e2                	ld	a5,24(sp)
ffffffffc0206230:	0149b423          	sd	s4,8(s3)
ffffffffc0206234:	00f9b823          	sd	a5,16(s3)
ffffffffc0206238:	013a3023          	sd	s3,0(s4)
ffffffffc020623c:	8a4e                	mv	s4,s3
ffffffffc020623e:	67c2                	ld	a5,16(sp)
ffffffffc0206240:	014cb423          	sd	s4,8(s9)
ffffffffc0206244:	00fcb823          	sd	a5,16(s9)
ffffffffc0206248:	019a3023          	sd	s9,0(s4)
ffffffffc020624c:	8a66                	mv	s4,s9
ffffffffc020624e:	67a2                	ld	a5,8(sp)
ffffffffc0206250:	014d3423          	sd	s4,8(s10)
ffffffffc0206254:	00fd3823          	sd	a5,16(s10)
ffffffffc0206258:	01aa3023          	sd	s10,0(s4)
ffffffffc020625c:	8a6a                	mv	s4,s10
ffffffffc020625e:	01443423          	sd	s4,8(s0)
ffffffffc0206262:	01843823          	sd	s8,16(s0)
ffffffffc0206266:	008a3023          	sd	s0,0(s4)
ffffffffc020626a:	e480                	sd	s0,8(s1)
ffffffffc020626c:	0174b823          	sd	s7,16(s1)
ffffffffc0206270:	e004                	sd	s1,0(s0)
ffffffffc0206272:	8426                	mv	s0,s1
ffffffffc0206274:	01b43023          	sd	s11,0(s0)
ffffffffc0206278:	b569                	j	ffffffffc0206102 <stride_dequeue+0x17e>
ffffffffc020627a:	e80412e3          	bnez	s0,ffffffffc02060fe <stride_dequeue+0x17a>
ffffffffc020627e:	e80d94e3          	bnez	s11,ffffffffc0206106 <stride_dequeue+0x182>
ffffffffc0206282:	8b22                	mv	s6,s0
ffffffffc0206284:	bd49                	j	ffffffffc0206116 <stride_dequeue+0x192>
ffffffffc0206286:	008db423          	sd	s0,8(s11)
ffffffffc020628a:	b571                	j	ffffffffc0206116 <stride_dequeue+0x192>
ffffffffc020628c:	0104bc03          	ld	s8,16(s1)
ffffffffc0206290:	0084ba03          	ld	s4,8(s1)
ffffffffc0206294:	0e0c0c63          	beqz	s8,ffffffffc020638c <stride_dequeue+0x408>
ffffffffc0206298:	85ce                	mv	a1,s3
ffffffffc020629a:	8562                	mv	a0,s8
ffffffffc020629c:	a87ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02062a0:	8d2a                	mv	s10,a0
ffffffffc02062a2:	31950263          	beq	a0,s9,ffffffffc02065a6 <stride_dequeue+0x622>
ffffffffc02062a6:	0089b783          	ld	a5,8(s3)
ffffffffc02062aa:	0109bd03          	ld	s10,16(s3)
ffffffffc02062ae:	e43e                	sd	a5,8(sp)
ffffffffc02062b0:	0c0d0763          	beqz	s10,ffffffffc020637e <stride_dequeue+0x3fa>
ffffffffc02062b4:	85ea                	mv	a1,s10
ffffffffc02062b6:	8562                	mv	a0,s8
ffffffffc02062b8:	a6bff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02062bc:	7f950c63          	beq	a0,s9,ffffffffc0206ab4 <stride_dequeue+0xb30>
ffffffffc02062c0:	008d3783          	ld	a5,8(s10)
ffffffffc02062c4:	010d3c83          	ld	s9,16(s10)
ffffffffc02062c8:	e83e                	sd	a5,16(sp)
ffffffffc02062ca:	0a0c8263          	beqz	s9,ffffffffc020636e <stride_dequeue+0x3ea>
ffffffffc02062ce:	85e6                	mv	a1,s9
ffffffffc02062d0:	8562                	mv	a0,s8
ffffffffc02062d2:	a51ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02062d6:	58fd                	li	a7,-1
ffffffffc02062d8:	41150ae3          	beq	a0,a7,ffffffffc0206eec <stride_dequeue+0xf68>
ffffffffc02062dc:	008cb703          	ld	a4,8(s9)
ffffffffc02062e0:	010cb783          	ld	a5,16(s9)
ffffffffc02062e4:	ec3a                	sd	a4,24(sp)
ffffffffc02062e6:	cfa5                	beqz	a5,ffffffffc020635e <stride_dequeue+0x3da>
ffffffffc02062e8:	85be                	mv	a1,a5
ffffffffc02062ea:	8562                	mv	a0,s8
ffffffffc02062ec:	f03e                	sd	a5,32(sp)
ffffffffc02062ee:	a35ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02062f2:	58fd                	li	a7,-1
ffffffffc02062f4:	7782                	ld	a5,32(sp)
ffffffffc02062f6:	01151463          	bne	a0,a7,ffffffffc02062fe <stride_dequeue+0x37a>
ffffffffc02062fa:	3340106f          	j	ffffffffc020762e <stride_dequeue+0x16aa>
ffffffffc02062fe:	6798                	ld	a4,8(a5)
ffffffffc0206300:	0107b303          	ld	t1,16(a5)
ffffffffc0206304:	f03a                	sd	a4,32(sp)
ffffffffc0206306:	00031463          	bnez	t1,ffffffffc020630e <stride_dequeue+0x38a>
ffffffffc020630a:	7900106f          	j	ffffffffc0207a9a <stride_dequeue+0x1b16>
ffffffffc020630e:	859a                	mv	a1,t1
ffffffffc0206310:	8562                	mv	a0,s8
ffffffffc0206312:	f83e                	sd	a5,48(sp)
ffffffffc0206314:	f41a                	sd	t1,40(sp)
ffffffffc0206316:	a0dff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020631a:	58fd                	li	a7,-1
ffffffffc020631c:	7322                	ld	t1,40(sp)
ffffffffc020631e:	77c2                	ld	a5,48(sp)
ffffffffc0206320:	01151463          	bne	a0,a7,ffffffffc0206328 <stride_dequeue+0x3a4>
ffffffffc0206324:	12b0106f          	j	ffffffffc0207c4e <stride_dequeue+0x1cca>
ffffffffc0206328:	00833883          	ld	a7,8(t1)
ffffffffc020632c:	01033583          	ld	a1,16(t1)
ffffffffc0206330:	8562                	mv	a0,s8
ffffffffc0206332:	fc3e                	sd	a5,56(sp)
ffffffffc0206334:	f81a                	sd	t1,48(sp)
ffffffffc0206336:	f446                	sd	a7,40(sp)
ffffffffc0206338:	a4dff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020633c:	7342                	ld	t1,48(sp)
ffffffffc020633e:	78a2                	ld	a7,40(sp)
ffffffffc0206340:	77e2                	ld	a5,56(sp)
ffffffffc0206342:	00a33423          	sd	a0,8(t1)
ffffffffc0206346:	01133823          	sd	a7,16(t1)
ffffffffc020634a:	c119                	beqz	a0,ffffffffc0206350 <stride_dequeue+0x3cc>
ffffffffc020634c:	00653023          	sd	t1,0(a0)
ffffffffc0206350:	7702                	ld	a4,32(sp)
ffffffffc0206352:	0067b423          	sd	t1,8(a5)
ffffffffc0206356:	8c3e                	mv	s8,a5
ffffffffc0206358:	eb98                	sd	a4,16(a5)
ffffffffc020635a:	00f33023          	sd	a5,0(t1)
ffffffffc020635e:	67e2                	ld	a5,24(sp)
ffffffffc0206360:	018cb423          	sd	s8,8(s9)
ffffffffc0206364:	00fcb823          	sd	a5,16(s9)
ffffffffc0206368:	019c3023          	sd	s9,0(s8)
ffffffffc020636c:	8c66                	mv	s8,s9
ffffffffc020636e:	67c2                	ld	a5,16(sp)
ffffffffc0206370:	018d3423          	sd	s8,8(s10)
ffffffffc0206374:	00fd3823          	sd	a5,16(s10)
ffffffffc0206378:	01ac3023          	sd	s10,0(s8)
ffffffffc020637c:	8c6a                	mv	s8,s10
ffffffffc020637e:	67a2                	ld	a5,8(sp)
ffffffffc0206380:	0189b423          	sd	s8,8(s3)
ffffffffc0206384:	00f9b823          	sd	a5,16(s3)
ffffffffc0206388:	013c3023          	sd	s3,0(s8)
ffffffffc020638c:	0134b423          	sd	s3,8(s1)
ffffffffc0206390:	0144b823          	sd	s4,16(s1)
ffffffffc0206394:	0099b023          	sd	s1,0(s3)
ffffffffc0206398:	bbb9                	j	ffffffffc02060f6 <stride_dequeue+0x172>
ffffffffc020639a:	8426                	mv	s0,s1
ffffffffc020639c:	01b43023          	sd	s11,0(s0)
ffffffffc02063a0:	b38d                	j	ffffffffc0206102 <stride_dequeue+0x17e>
ffffffffc02063a2:	010a3c03          	ld	s8,16(s4)
ffffffffc02063a6:	008a3983          	ld	s3,8(s4)
ffffffffc02063aa:	0e0c0c63          	beqz	s8,ffffffffc02064a2 <stride_dequeue+0x51e>
ffffffffc02063ae:	85a2                	mv	a1,s0
ffffffffc02063b0:	8562                	mv	a0,s8
ffffffffc02063b2:	971ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02063b6:	8d2a                	mv	s10,a0
ffffffffc02063b8:	49950063          	beq	a0,s9,ffffffffc0206838 <stride_dequeue+0x8b4>
ffffffffc02063bc:	641c                	ld	a5,8(s0)
ffffffffc02063be:	01043d03          	ld	s10,16(s0)
ffffffffc02063c2:	e43e                	sd	a5,8(sp)
ffffffffc02063c4:	0c0d0963          	beqz	s10,ffffffffc0206496 <stride_dequeue+0x512>
ffffffffc02063c8:	85ea                	mv	a1,s10
ffffffffc02063ca:	8562                	mv	a0,s8
ffffffffc02063cc:	957ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02063d0:	1d9500e3          	beq	a0,s9,ffffffffc0206d90 <stride_dequeue+0xe0c>
ffffffffc02063d4:	008d3783          	ld	a5,8(s10)
ffffffffc02063d8:	010d3c83          	ld	s9,16(s10)
ffffffffc02063dc:	e83e                	sd	a5,16(sp)
ffffffffc02063de:	0a0c8463          	beqz	s9,ffffffffc0206486 <stride_dequeue+0x502>
ffffffffc02063e2:	85e6                	mv	a1,s9
ffffffffc02063e4:	8562                	mv	a0,s8
ffffffffc02063e6:	93dff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02063ea:	58fd                	li	a7,-1
ffffffffc02063ec:	631507e3          	beq	a0,a7,ffffffffc020721a <stride_dequeue+0x1296>
ffffffffc02063f0:	008cb703          	ld	a4,8(s9)
ffffffffc02063f4:	010cb783          	ld	a5,16(s9)
ffffffffc02063f8:	ec3a                	sd	a4,24(sp)
ffffffffc02063fa:	e399                	bnez	a5,ffffffffc0206400 <stride_dequeue+0x47c>
ffffffffc02063fc:	1230106f          	j	ffffffffc0207d1e <stride_dequeue+0x1d9a>
ffffffffc0206400:	85be                	mv	a1,a5
ffffffffc0206402:	8562                	mv	a0,s8
ffffffffc0206404:	f03e                	sd	a5,32(sp)
ffffffffc0206406:	91dff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020640a:	58fd                	li	a7,-1
ffffffffc020640c:	7782                	ld	a5,32(sp)
ffffffffc020640e:	01151463          	bne	a0,a7,ffffffffc0206416 <stride_dequeue+0x492>
ffffffffc0206412:	6f20106f          	j	ffffffffc0207b04 <stride_dequeue+0x1b80>
ffffffffc0206416:	6798                	ld	a4,8(a5)
ffffffffc0206418:	0107b303          	ld	t1,16(a5)
ffffffffc020641c:	f03a                	sd	a4,32(sp)
ffffffffc020641e:	04030663          	beqz	t1,ffffffffc020646a <stride_dequeue+0x4e6>
ffffffffc0206422:	859a                	mv	a1,t1
ffffffffc0206424:	8562                	mv	a0,s8
ffffffffc0206426:	f83e                	sd	a5,48(sp)
ffffffffc0206428:	f41a                	sd	t1,40(sp)
ffffffffc020642a:	8f9ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020642e:	58fd                	li	a7,-1
ffffffffc0206430:	7322                	ld	t1,40(sp)
ffffffffc0206432:	77c2                	ld	a5,48(sp)
ffffffffc0206434:	01151463          	bne	a0,a7,ffffffffc020643c <stride_dequeue+0x4b8>
ffffffffc0206438:	4190106f          	j	ffffffffc0208050 <stride_dequeue+0x20cc>
ffffffffc020643c:	00833883          	ld	a7,8(t1)
ffffffffc0206440:	01033583          	ld	a1,16(t1)
ffffffffc0206444:	8562                	mv	a0,s8
ffffffffc0206446:	fc3e                	sd	a5,56(sp)
ffffffffc0206448:	f81a                	sd	t1,48(sp)
ffffffffc020644a:	f446                	sd	a7,40(sp)
ffffffffc020644c:	939ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206450:	7342                	ld	t1,48(sp)
ffffffffc0206452:	78a2                	ld	a7,40(sp)
ffffffffc0206454:	77e2                	ld	a5,56(sp)
ffffffffc0206456:	00a33423          	sd	a0,8(t1)
ffffffffc020645a:	01133823          	sd	a7,16(t1)
ffffffffc020645e:	e119                	bnez	a0,ffffffffc0206464 <stride_dequeue+0x4e0>
ffffffffc0206460:	57b0106f          	j	ffffffffc02081da <stride_dequeue+0x2256>
ffffffffc0206464:	00653023          	sd	t1,0(a0)
ffffffffc0206468:	8c1a                	mv	s8,t1
ffffffffc020646a:	7702                	ld	a4,32(sp)
ffffffffc020646c:	0187b423          	sd	s8,8(a5)
ffffffffc0206470:	eb98                	sd	a4,16(a5)
ffffffffc0206472:	00fc3023          	sd	a5,0(s8)
ffffffffc0206476:	6762                	ld	a4,24(sp)
ffffffffc0206478:	00fcb423          	sd	a5,8(s9)
ffffffffc020647c:	8c66                	mv	s8,s9
ffffffffc020647e:	00ecb823          	sd	a4,16(s9)
ffffffffc0206482:	0197b023          	sd	s9,0(a5)
ffffffffc0206486:	67c2                	ld	a5,16(sp)
ffffffffc0206488:	018d3423          	sd	s8,8(s10)
ffffffffc020648c:	00fd3823          	sd	a5,16(s10)
ffffffffc0206490:	01ac3023          	sd	s10,0(s8)
ffffffffc0206494:	8c6a                	mv	s8,s10
ffffffffc0206496:	67a2                	ld	a5,8(sp)
ffffffffc0206498:	01843423          	sd	s8,8(s0)
ffffffffc020649c:	e81c                	sd	a5,16(s0)
ffffffffc020649e:	008c3023          	sd	s0,0(s8)
ffffffffc02064a2:	008a3423          	sd	s0,8(s4)
ffffffffc02064a6:	013a3823          	sd	s3,16(s4)
ffffffffc02064aa:	01443023          	sd	s4,0(s0)
ffffffffc02064ae:	8452                	mv	s0,s4
ffffffffc02064b0:	bb6d                	j	ffffffffc020626a <stride_dequeue+0x2e6>
ffffffffc02064b2:	008a3783          	ld	a5,8(s4)
ffffffffc02064b6:	010a3983          	ld	s3,16(s4)
ffffffffc02064ba:	e43e                	sd	a5,8(sp)
ffffffffc02064bc:	0c098d63          	beqz	s3,ffffffffc0206596 <stride_dequeue+0x612>
ffffffffc02064c0:	85ea                	mv	a1,s10
ffffffffc02064c2:	854e                	mv	a0,s3
ffffffffc02064c4:	85fff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02064c8:	73950e63          	beq	a0,s9,ffffffffc0206c04 <stride_dequeue+0xc80>
ffffffffc02064cc:	008d3783          	ld	a5,8(s10)
ffffffffc02064d0:	010d3c83          	ld	s9,16(s10)
ffffffffc02064d4:	e83e                	sd	a5,16(sp)
ffffffffc02064d6:	0a0c8963          	beqz	s9,ffffffffc0206588 <stride_dequeue+0x604>
ffffffffc02064da:	85e6                	mv	a1,s9
ffffffffc02064dc:	854e                	mv	a0,s3
ffffffffc02064de:	845ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02064e2:	58fd                	li	a7,-1
ffffffffc02064e4:	01151463          	bne	a0,a7,ffffffffc02064ec <stride_dequeue+0x568>
ffffffffc02064e8:	7070006f          	j	ffffffffc02073ee <stride_dequeue+0x146a>
ffffffffc02064ec:	008cb783          	ld	a5,8(s9)
ffffffffc02064f0:	010cb803          	ld	a6,16(s9)
ffffffffc02064f4:	ec3e                	sd	a5,24(sp)
ffffffffc02064f6:	00081463          	bnez	a6,ffffffffc02064fe <stride_dequeue+0x57a>
ffffffffc02064fa:	02b0106f          	j	ffffffffc0207d24 <stride_dequeue+0x1da0>
ffffffffc02064fe:	85c2                	mv	a1,a6
ffffffffc0206500:	854e                	mv	a0,s3
ffffffffc0206502:	f042                	sd	a6,32(sp)
ffffffffc0206504:	81fff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206508:	58fd                	li	a7,-1
ffffffffc020650a:	7802                	ld	a6,32(sp)
ffffffffc020650c:	01151463          	bne	a0,a7,ffffffffc0206514 <stride_dequeue+0x590>
ffffffffc0206510:	5260106f          	j	ffffffffc0207a36 <stride_dequeue+0x1ab2>
ffffffffc0206514:	00883783          	ld	a5,8(a6) # fffffffffff80008 <end+0x3fd43028>
ffffffffc0206518:	01083303          	ld	t1,16(a6)
ffffffffc020651c:	f03e                	sd	a5,32(sp)
ffffffffc020651e:	04030663          	beqz	t1,ffffffffc020656a <stride_dequeue+0x5e6>
ffffffffc0206522:	859a                	mv	a1,t1
ffffffffc0206524:	854e                	mv	a0,s3
ffffffffc0206526:	f842                	sd	a6,48(sp)
ffffffffc0206528:	f41a                	sd	t1,40(sp)
ffffffffc020652a:	ff8ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020652e:	58fd                	li	a7,-1
ffffffffc0206530:	7322                	ld	t1,40(sp)
ffffffffc0206532:	7842                	ld	a6,48(sp)
ffffffffc0206534:	01151463          	bne	a0,a7,ffffffffc020653c <stride_dequeue+0x5b8>
ffffffffc0206538:	0ab0106f          	j	ffffffffc0207de2 <stride_dequeue+0x1e5e>
ffffffffc020653c:	00833883          	ld	a7,8(t1)
ffffffffc0206540:	01033583          	ld	a1,16(t1)
ffffffffc0206544:	854e                	mv	a0,s3
ffffffffc0206546:	fc42                	sd	a6,56(sp)
ffffffffc0206548:	f81a                	sd	t1,48(sp)
ffffffffc020654a:	f446                	sd	a7,40(sp)
ffffffffc020654c:	839ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206550:	7342                	ld	t1,48(sp)
ffffffffc0206552:	78a2                	ld	a7,40(sp)
ffffffffc0206554:	7862                	ld	a6,56(sp)
ffffffffc0206556:	00a33423          	sd	a0,8(t1)
ffffffffc020655a:	01133823          	sd	a7,16(t1)
ffffffffc020655e:	e119                	bnez	a0,ffffffffc0206564 <stride_dequeue+0x5e0>
ffffffffc0206560:	4fb0106f          	j	ffffffffc020825a <stride_dequeue+0x22d6>
ffffffffc0206564:	00653023          	sd	t1,0(a0)
ffffffffc0206568:	899a                	mv	s3,t1
ffffffffc020656a:	7782                	ld	a5,32(sp)
ffffffffc020656c:	01383423          	sd	s3,8(a6)
ffffffffc0206570:	00f83823          	sd	a5,16(a6)
ffffffffc0206574:	0109b023          	sd	a6,0(s3)
ffffffffc0206578:	67e2                	ld	a5,24(sp)
ffffffffc020657a:	010cb423          	sd	a6,8(s9)
ffffffffc020657e:	89e6                	mv	s3,s9
ffffffffc0206580:	00fcb823          	sd	a5,16(s9)
ffffffffc0206584:	01983023          	sd	s9,0(a6)
ffffffffc0206588:	67c2                	ld	a5,16(sp)
ffffffffc020658a:	013d3423          	sd	s3,8(s10)
ffffffffc020658e:	00fd3823          	sd	a5,16(s10)
ffffffffc0206592:	01a9b023          	sd	s10,0(s3)
ffffffffc0206596:	67a2                	ld	a5,8(sp)
ffffffffc0206598:	01aa3423          	sd	s10,8(s4)
ffffffffc020659c:	00fa3823          	sd	a5,16(s4)
ffffffffc02065a0:	014d3023          	sd	s4,0(s10)
ffffffffc02065a4:	b96d                	j	ffffffffc020625e <stride_dequeue+0x2da>
ffffffffc02065a6:	008c3783          	ld	a5,8(s8)
ffffffffc02065aa:	010c3c83          	ld	s9,16(s8)
ffffffffc02065ae:	e43e                	sd	a5,8(sp)
ffffffffc02065b0:	0c0c8a63          	beqz	s9,ffffffffc0206684 <stride_dequeue+0x700>
ffffffffc02065b4:	85ce                	mv	a1,s3
ffffffffc02065b6:	8566                	mv	a0,s9
ffffffffc02065b8:	f6aff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02065bc:	71a50763          	beq	a0,s10,ffffffffc0206cca <stride_dequeue+0xd46>
ffffffffc02065c0:	0089b783          	ld	a5,8(s3)
ffffffffc02065c4:	0109b603          	ld	a2,16(s3)
ffffffffc02065c8:	e83e                	sd	a5,16(sp)
ffffffffc02065ca:	c655                	beqz	a2,ffffffffc0206676 <stride_dequeue+0x6f2>
ffffffffc02065cc:	85b2                	mv	a1,a2
ffffffffc02065ce:	8566                	mv	a0,s9
ffffffffc02065d0:	ec32                	sd	a2,24(sp)
ffffffffc02065d2:	f50ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02065d6:	58fd                	li	a7,-1
ffffffffc02065d8:	6662                	ld	a2,24(sp)
ffffffffc02065da:	6b1506e3          	beq	a0,a7,ffffffffc0207486 <stride_dequeue+0x1502>
ffffffffc02065de:	661c                	ld	a5,8(a2)
ffffffffc02065e0:	01063d03          	ld	s10,16(a2)
ffffffffc02065e4:	ec3e                	sd	a5,24(sp)
ffffffffc02065e6:	000d1463          	bnez	s10,ffffffffc02065ee <stride_dequeue+0x66a>
ffffffffc02065ea:	7520106f          	j	ffffffffc0207d3c <stride_dequeue+0x1db8>
ffffffffc02065ee:	85ea                	mv	a1,s10
ffffffffc02065f0:	8566                	mv	a0,s9
ffffffffc02065f2:	f032                	sd	a2,32(sp)
ffffffffc02065f4:	f2eff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02065f8:	58fd                	li	a7,-1
ffffffffc02065fa:	7602                	ld	a2,32(sp)
ffffffffc02065fc:	01151463          	bne	a0,a7,ffffffffc0206604 <stride_dequeue+0x680>
ffffffffc0206600:	4a60106f          	j	ffffffffc0207aa6 <stride_dequeue+0x1b22>
ffffffffc0206604:	008d3783          	ld	a5,8(s10)
ffffffffc0206608:	010d3303          	ld	t1,16(s10)
ffffffffc020660c:	f03e                	sd	a5,32(sp)
ffffffffc020660e:	04030663          	beqz	t1,ffffffffc020665a <stride_dequeue+0x6d6>
ffffffffc0206612:	859a                	mv	a1,t1
ffffffffc0206614:	8566                	mv	a0,s9
ffffffffc0206616:	f832                	sd	a2,48(sp)
ffffffffc0206618:	f41a                	sd	t1,40(sp)
ffffffffc020661a:	f08ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020661e:	58fd                	li	a7,-1
ffffffffc0206620:	7322                	ld	t1,40(sp)
ffffffffc0206622:	7642                	ld	a2,48(sp)
ffffffffc0206624:	01151463          	bne	a0,a7,ffffffffc020662c <stride_dequeue+0x6a8>
ffffffffc0206628:	2f70106f          	j	ffffffffc020811e <stride_dequeue+0x219a>
ffffffffc020662c:	00833883          	ld	a7,8(t1)
ffffffffc0206630:	01033583          	ld	a1,16(t1)
ffffffffc0206634:	8566                	mv	a0,s9
ffffffffc0206636:	fc32                	sd	a2,56(sp)
ffffffffc0206638:	f81a                	sd	t1,48(sp)
ffffffffc020663a:	f446                	sd	a7,40(sp)
ffffffffc020663c:	f48ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206640:	7342                	ld	t1,48(sp)
ffffffffc0206642:	78a2                	ld	a7,40(sp)
ffffffffc0206644:	7662                	ld	a2,56(sp)
ffffffffc0206646:	00a33423          	sd	a0,8(t1)
ffffffffc020664a:	01133823          	sd	a7,16(t1)
ffffffffc020664e:	e119                	bnez	a0,ffffffffc0206654 <stride_dequeue+0x6d0>
ffffffffc0206650:	3590106f          	j	ffffffffc02081a8 <stride_dequeue+0x2224>
ffffffffc0206654:	00653023          	sd	t1,0(a0)
ffffffffc0206658:	8c9a                	mv	s9,t1
ffffffffc020665a:	7782                	ld	a5,32(sp)
ffffffffc020665c:	019d3423          	sd	s9,8(s10)
ffffffffc0206660:	00fd3823          	sd	a5,16(s10)
ffffffffc0206664:	01acb023          	sd	s10,0(s9)
ffffffffc0206668:	67e2                	ld	a5,24(sp)
ffffffffc020666a:	01a63423          	sd	s10,8(a2)
ffffffffc020666e:	8cb2                	mv	s9,a2
ffffffffc0206670:	ea1c                	sd	a5,16(a2)
ffffffffc0206672:	00cd3023          	sd	a2,0(s10)
ffffffffc0206676:	67c2                	ld	a5,16(sp)
ffffffffc0206678:	0199b423          	sd	s9,8(s3)
ffffffffc020667c:	00f9b823          	sd	a5,16(s3)
ffffffffc0206680:	013cb023          	sd	s3,0(s9)
ffffffffc0206684:	67a2                	ld	a5,8(sp)
ffffffffc0206686:	013c3423          	sd	s3,8(s8)
ffffffffc020668a:	00fc3823          	sd	a5,16(s8)
ffffffffc020668e:	0189b023          	sd	s8,0(s3)
ffffffffc0206692:	89e2                	mv	s3,s8
ffffffffc0206694:	b9e5                	j	ffffffffc020638c <stride_dequeue+0x408>
ffffffffc0206696:	649c                	ld	a5,8(s1)
ffffffffc0206698:	0104ba03          	ld	s4,16(s1)
ffffffffc020669c:	e83e                	sd	a5,16(sp)
ffffffffc020669e:	0a0a0263          	beqz	s4,ffffffffc0206742 <stride_dequeue+0x7be>
ffffffffc02066a2:	85e6                	mv	a1,s9
ffffffffc02066a4:	8552                	mv	a0,s4
ffffffffc02066a6:	e7cff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02066aa:	58fd                	li	a7,-1
ffffffffc02066ac:	171504e3          	beq	a0,a7,ffffffffc0207014 <stride_dequeue+0x1090>
ffffffffc02066b0:	008cb783          	ld	a5,8(s9)
ffffffffc02066b4:	010cb803          	ld	a6,16(s9)
ffffffffc02066b8:	ec3e                	sd	a5,24(sp)
ffffffffc02066ba:	06080d63          	beqz	a6,ffffffffc0206734 <stride_dequeue+0x7b0>
ffffffffc02066be:	85c2                	mv	a1,a6
ffffffffc02066c0:	8552                	mv	a0,s4
ffffffffc02066c2:	f042                	sd	a6,32(sp)
ffffffffc02066c4:	e5eff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02066c8:	58fd                	li	a7,-1
ffffffffc02066ca:	7802                	ld	a6,32(sp)
ffffffffc02066cc:	6b1508e3          	beq	a0,a7,ffffffffc020757c <stride_dequeue+0x15f8>
ffffffffc02066d0:	00883783          	ld	a5,8(a6)
ffffffffc02066d4:	01083303          	ld	t1,16(a6)
ffffffffc02066d8:	f03e                	sd	a5,32(sp)
ffffffffc02066da:	00031463          	bnez	t1,ffffffffc02066e2 <stride_dequeue+0x75e>
ffffffffc02066de:	4dc0106f          	j	ffffffffc0207bba <stride_dequeue+0x1c36>
ffffffffc02066e2:	859a                	mv	a1,t1
ffffffffc02066e4:	8552                	mv	a0,s4
ffffffffc02066e6:	f842                	sd	a6,48(sp)
ffffffffc02066e8:	f41a                	sd	t1,40(sp)
ffffffffc02066ea:	e38ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02066ee:	58fd                	li	a7,-1
ffffffffc02066f0:	7322                	ld	t1,40(sp)
ffffffffc02066f2:	7842                	ld	a6,48(sp)
ffffffffc02066f4:	01151463          	bne	a0,a7,ffffffffc02066fc <stride_dequeue+0x778>
ffffffffc02066f8:	5800106f          	j	ffffffffc0207c78 <stride_dequeue+0x1cf4>
ffffffffc02066fc:	00833883          	ld	a7,8(t1)
ffffffffc0206700:	01033583          	ld	a1,16(t1)
ffffffffc0206704:	8552                	mv	a0,s4
ffffffffc0206706:	fc42                	sd	a6,56(sp)
ffffffffc0206708:	f81a                	sd	t1,48(sp)
ffffffffc020670a:	f446                	sd	a7,40(sp)
ffffffffc020670c:	e78ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206710:	7342                	ld	t1,48(sp)
ffffffffc0206712:	78a2                	ld	a7,40(sp)
ffffffffc0206714:	7862                	ld	a6,56(sp)
ffffffffc0206716:	00a33423          	sd	a0,8(t1)
ffffffffc020671a:	01133823          	sd	a7,16(t1)
ffffffffc020671e:	c119                	beqz	a0,ffffffffc0206724 <stride_dequeue+0x7a0>
ffffffffc0206720:	00653023          	sd	t1,0(a0)
ffffffffc0206724:	7782                	ld	a5,32(sp)
ffffffffc0206726:	00683423          	sd	t1,8(a6)
ffffffffc020672a:	8a42                	mv	s4,a6
ffffffffc020672c:	00f83823          	sd	a5,16(a6)
ffffffffc0206730:	01033023          	sd	a6,0(t1)
ffffffffc0206734:	67e2                	ld	a5,24(sp)
ffffffffc0206736:	014cb423          	sd	s4,8(s9)
ffffffffc020673a:	00fcb823          	sd	a5,16(s9)
ffffffffc020673e:	019a3023          	sd	s9,0(s4)
ffffffffc0206742:	67c2                	ld	a5,16(sp)
ffffffffc0206744:	0194b423          	sd	s9,8(s1)
ffffffffc0206748:	e89c                	sd	a5,16(s1)
ffffffffc020674a:	009cb023          	sd	s1,0(s9)
ffffffffc020674e:	b269                	j	ffffffffc02060d8 <stride_dequeue+0x154>
ffffffffc0206750:	649c                	ld	a5,8(s1)
ffffffffc0206752:	0104ba03          	ld	s4,16(s1)
ffffffffc0206756:	e43e                	sd	a5,8(sp)
ffffffffc0206758:	0c0a0963          	beqz	s4,ffffffffc020682a <stride_dequeue+0x8a6>
ffffffffc020675c:	85ea                	mv	a1,s10
ffffffffc020675e:	8552                	mv	a0,s4
ffffffffc0206760:	dc2ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206764:	29950463          	beq	a0,s9,ffffffffc02069ec <stride_dequeue+0xa68>
ffffffffc0206768:	008d3783          	ld	a5,8(s10)
ffffffffc020676c:	010d3c83          	ld	s9,16(s10)
ffffffffc0206770:	e83e                	sd	a5,16(sp)
ffffffffc0206772:	0a0c8563          	beqz	s9,ffffffffc020681c <stride_dequeue+0x898>
ffffffffc0206776:	85e6                	mv	a1,s9
ffffffffc0206778:	8552                	mv	a0,s4
ffffffffc020677a:	da8ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020677e:	58fd                	li	a7,-1
ffffffffc0206780:	011501e3          	beq	a0,a7,ffffffffc0206f82 <stride_dequeue+0xffe>
ffffffffc0206784:	008cb783          	ld	a5,8(s9)
ffffffffc0206788:	010cb803          	ld	a6,16(s9)
ffffffffc020678c:	ec3e                	sd	a5,24(sp)
ffffffffc020678e:	06080f63          	beqz	a6,ffffffffc020680c <stride_dequeue+0x888>
ffffffffc0206792:	85c2                	mv	a1,a6
ffffffffc0206794:	8552                	mv	a0,s4
ffffffffc0206796:	f042                	sd	a6,32(sp)
ffffffffc0206798:	d8aff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020679c:	58fd                	li	a7,-1
ffffffffc020679e:	7802                	ld	a6,32(sp)
ffffffffc02067a0:	01151463          	bne	a0,a7,ffffffffc02067a8 <stride_dequeue+0x824>
ffffffffc02067a4:	6e10006f          	j	ffffffffc0207684 <stride_dequeue+0x1700>
ffffffffc02067a8:	00883783          	ld	a5,8(a6)
ffffffffc02067ac:	01083303          	ld	t1,16(a6)
ffffffffc02067b0:	f03e                	sd	a5,32(sp)
ffffffffc02067b2:	00031463          	bnez	t1,ffffffffc02067ba <stride_dequeue+0x836>
ffffffffc02067b6:	40a0106f          	j	ffffffffc0207bc0 <stride_dequeue+0x1c3c>
ffffffffc02067ba:	859a                	mv	a1,t1
ffffffffc02067bc:	8552                	mv	a0,s4
ffffffffc02067be:	f842                	sd	a6,48(sp)
ffffffffc02067c0:	f41a                	sd	t1,40(sp)
ffffffffc02067c2:	d60ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02067c6:	58fd                	li	a7,-1
ffffffffc02067c8:	7322                	ld	t1,40(sp)
ffffffffc02067ca:	7842                	ld	a6,48(sp)
ffffffffc02067cc:	01151463          	bne	a0,a7,ffffffffc02067d4 <stride_dequeue+0x850>
ffffffffc02067d0:	5240106f          	j	ffffffffc0207cf4 <stride_dequeue+0x1d70>
ffffffffc02067d4:	00833883          	ld	a7,8(t1)
ffffffffc02067d8:	01033583          	ld	a1,16(t1)
ffffffffc02067dc:	8552                	mv	a0,s4
ffffffffc02067de:	fc42                	sd	a6,56(sp)
ffffffffc02067e0:	f81a                	sd	t1,48(sp)
ffffffffc02067e2:	f446                	sd	a7,40(sp)
ffffffffc02067e4:	da0ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02067e8:	7342                	ld	t1,48(sp)
ffffffffc02067ea:	78a2                	ld	a7,40(sp)
ffffffffc02067ec:	7862                	ld	a6,56(sp)
ffffffffc02067ee:	00a33423          	sd	a0,8(t1)
ffffffffc02067f2:	01133823          	sd	a7,16(t1)
ffffffffc02067f6:	c119                	beqz	a0,ffffffffc02067fc <stride_dequeue+0x878>
ffffffffc02067f8:	00653023          	sd	t1,0(a0)
ffffffffc02067fc:	7782                	ld	a5,32(sp)
ffffffffc02067fe:	00683423          	sd	t1,8(a6)
ffffffffc0206802:	8a42                	mv	s4,a6
ffffffffc0206804:	00f83823          	sd	a5,16(a6)
ffffffffc0206808:	01033023          	sd	a6,0(t1)
ffffffffc020680c:	67e2                	ld	a5,24(sp)
ffffffffc020680e:	014cb423          	sd	s4,8(s9)
ffffffffc0206812:	00fcb823          	sd	a5,16(s9)
ffffffffc0206816:	019a3023          	sd	s9,0(s4)
ffffffffc020681a:	8a66                	mv	s4,s9
ffffffffc020681c:	67c2                	ld	a5,16(sp)
ffffffffc020681e:	014d3423          	sd	s4,8(s10)
ffffffffc0206822:	00fd3823          	sd	a5,16(s10)
ffffffffc0206826:	01aa3023          	sd	s10,0(s4)
ffffffffc020682a:	67a2                	ld	a5,8(sp)
ffffffffc020682c:	01a4b423          	sd	s10,8(s1)
ffffffffc0206830:	e89c                	sd	a5,16(s1)
ffffffffc0206832:	009d3023          	sd	s1,0(s10)
ffffffffc0206836:	b84d                	j	ffffffffc02060e8 <stride_dequeue+0x164>
ffffffffc0206838:	008c3783          	ld	a5,8(s8)
ffffffffc020683c:	010c3c83          	ld	s9,16(s8)
ffffffffc0206840:	e43e                	sd	a5,8(sp)
ffffffffc0206842:	0c0c8863          	beqz	s9,ffffffffc0206912 <stride_dequeue+0x98e>
ffffffffc0206846:	85a2                	mv	a1,s0
ffffffffc0206848:	8566                	mv	a0,s9
ffffffffc020684a:	cd8ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020684e:	0ba506e3          	beq	a0,s10,ffffffffc02070fa <stride_dequeue+0x1176>
ffffffffc0206852:	641c                	ld	a5,8(s0)
ffffffffc0206854:	01043d03          	ld	s10,16(s0)
ffffffffc0206858:	e83e                	sd	a5,16(sp)
ffffffffc020685a:	000d1463          	bnez	s10,ffffffffc0206862 <stride_dequeue+0x8de>
ffffffffc020685e:	2420106f          	j	ffffffffc0207aa0 <stride_dequeue+0x1b1c>
ffffffffc0206862:	85ea                	mv	a1,s10
ffffffffc0206864:	8566                	mv	a0,s9
ffffffffc0206866:	cbcff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020686a:	537d                	li	t1,-1
ffffffffc020686c:	00651463          	bne	a0,t1,ffffffffc0206874 <stride_dequeue+0x8f0>
ffffffffc0206870:	6ef0006f          	j	ffffffffc020775e <stride_dequeue+0x17da>
ffffffffc0206874:	008d3783          	ld	a5,8(s10)
ffffffffc0206878:	010d3703          	ld	a4,16(s10)
ffffffffc020687c:	ec3e                	sd	a5,24(sp)
ffffffffc020687e:	cf2d                	beqz	a4,ffffffffc02068f8 <stride_dequeue+0x974>
ffffffffc0206880:	85ba                	mv	a1,a4
ffffffffc0206882:	8566                	mv	a0,s9
ffffffffc0206884:	f03a                	sd	a4,32(sp)
ffffffffc0206886:	c9cff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020688a:	537d                	li	t1,-1
ffffffffc020688c:	7702                	ld	a4,32(sp)
ffffffffc020688e:	00651463          	bne	a0,t1,ffffffffc0206896 <stride_dequeue+0x912>
ffffffffc0206892:	69e0106f          	j	ffffffffc0207f30 <stride_dequeue+0x1fac>
ffffffffc0206896:	671c                	ld	a5,8(a4)
ffffffffc0206898:	01073883          	ld	a7,16(a4) # 40000010 <_binary_obj___user_matrix_out_size+0x3fffd6d8>
ffffffffc020689c:	f03e                	sd	a5,32(sp)
ffffffffc020689e:	04088663          	beqz	a7,ffffffffc02068ea <stride_dequeue+0x966>
ffffffffc02068a2:	85c6                	mv	a1,a7
ffffffffc02068a4:	8566                	mv	a0,s9
ffffffffc02068a6:	f83a                	sd	a4,48(sp)
ffffffffc02068a8:	f446                	sd	a7,40(sp)
ffffffffc02068aa:	c78ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02068ae:	537d                	li	t1,-1
ffffffffc02068b0:	78a2                	ld	a7,40(sp)
ffffffffc02068b2:	7742                	ld	a4,48(sp)
ffffffffc02068b4:	00651463          	bne	a0,t1,ffffffffc02068bc <stride_dequeue+0x938>
ffffffffc02068b8:	4010106f          	j	ffffffffc02084b8 <stride_dequeue+0x2534>
ffffffffc02068bc:	0088b303          	ld	t1,8(a7) # 2008 <_binary_obj___user_forktree_out_size+0x8>
ffffffffc02068c0:	0108b583          	ld	a1,16(a7)
ffffffffc02068c4:	8566                	mv	a0,s9
ffffffffc02068c6:	fc3a                	sd	a4,56(sp)
ffffffffc02068c8:	f846                	sd	a7,48(sp)
ffffffffc02068ca:	f41a                	sd	t1,40(sp)
ffffffffc02068cc:	cb8ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02068d0:	78c2                	ld	a7,48(sp)
ffffffffc02068d2:	7322                	ld	t1,40(sp)
ffffffffc02068d4:	7762                	ld	a4,56(sp)
ffffffffc02068d6:	00a8b423          	sd	a0,8(a7)
ffffffffc02068da:	0068b823          	sd	t1,16(a7)
ffffffffc02068de:	e119                	bnez	a0,ffffffffc02068e4 <stride_dequeue+0x960>
ffffffffc02068e0:	5510106f          	j	ffffffffc0208630 <stride_dequeue+0x26ac>
ffffffffc02068e4:	01153023          	sd	a7,0(a0)
ffffffffc02068e8:	8cc6                	mv	s9,a7
ffffffffc02068ea:	7782                	ld	a5,32(sp)
ffffffffc02068ec:	01973423          	sd	s9,8(a4)
ffffffffc02068f0:	eb1c                	sd	a5,16(a4)
ffffffffc02068f2:	00ecb023          	sd	a4,0(s9)
ffffffffc02068f6:	8cba                	mv	s9,a4
ffffffffc02068f8:	67e2                	ld	a5,24(sp)
ffffffffc02068fa:	019d3423          	sd	s9,8(s10)
ffffffffc02068fe:	00fd3823          	sd	a5,16(s10)
ffffffffc0206902:	01acb023          	sd	s10,0(s9)
ffffffffc0206906:	67c2                	ld	a5,16(sp)
ffffffffc0206908:	01a43423          	sd	s10,8(s0)
ffffffffc020690c:	e81c                	sd	a5,16(s0)
ffffffffc020690e:	008d3023          	sd	s0,0(s10)
ffffffffc0206912:	67a2                	ld	a5,8(sp)
ffffffffc0206914:	008c3423          	sd	s0,8(s8)
ffffffffc0206918:	00fc3823          	sd	a5,16(s8)
ffffffffc020691c:	01843023          	sd	s8,0(s0)
ffffffffc0206920:	8462                	mv	s0,s8
ffffffffc0206922:	b641                	j	ffffffffc02064a2 <stride_dequeue+0x51e>
ffffffffc0206924:	008a3783          	ld	a5,8(s4)
ffffffffc0206928:	010a3983          	ld	s3,16(s4)
ffffffffc020692c:	e83e                	sd	a5,16(sp)
ffffffffc020692e:	0a098663          	beqz	s3,ffffffffc02069da <stride_dequeue+0xa56>
ffffffffc0206932:	85e6                	mv	a1,s9
ffffffffc0206934:	854e                	mv	a0,s3
ffffffffc0206936:	becff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020693a:	58fd                	li	a7,-1
ffffffffc020693c:	21150ce3          	beq	a0,a7,ffffffffc0207354 <stride_dequeue+0x13d0>
ffffffffc0206940:	008cb783          	ld	a5,8(s9)
ffffffffc0206944:	010cb803          	ld	a6,16(s9)
ffffffffc0206948:	ec3e                	sd	a5,24(sp)
ffffffffc020694a:	00081463          	bnez	a6,ffffffffc0206952 <stride_dequeue+0x9ce>
ffffffffc020694e:	3dc0106f          	j	ffffffffc0207d2a <stride_dequeue+0x1da6>
ffffffffc0206952:	85c2                	mv	a1,a6
ffffffffc0206954:	854e                	mv	a0,s3
ffffffffc0206956:	f042                	sd	a6,32(sp)
ffffffffc0206958:	bcaff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020695c:	58fd                	li	a7,-1
ffffffffc020695e:	7802                	ld	a6,32(sp)
ffffffffc0206960:	01151463          	bne	a0,a7,ffffffffc0206968 <stride_dequeue+0x9e4>
ffffffffc0206964:	7b90006f          	j	ffffffffc020791c <stride_dequeue+0x1998>
ffffffffc0206968:	00883783          	ld	a5,8(a6)
ffffffffc020696c:	01083303          	ld	t1,16(a6)
ffffffffc0206970:	f03e                	sd	a5,32(sp)
ffffffffc0206972:	04030663          	beqz	t1,ffffffffc02069be <stride_dequeue+0xa3a>
ffffffffc0206976:	859a                	mv	a1,t1
ffffffffc0206978:	854e                	mv	a0,s3
ffffffffc020697a:	f842                	sd	a6,48(sp)
ffffffffc020697c:	f41a                	sd	t1,40(sp)
ffffffffc020697e:	ba4ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206982:	58fd                	li	a7,-1
ffffffffc0206984:	7322                	ld	t1,40(sp)
ffffffffc0206986:	7842                	ld	a6,48(sp)
ffffffffc0206988:	01151463          	bne	a0,a7,ffffffffc0206990 <stride_dequeue+0xa0c>
ffffffffc020698c:	5cc0106f          	j	ffffffffc0207f58 <stride_dequeue+0x1fd4>
ffffffffc0206990:	00833883          	ld	a7,8(t1)
ffffffffc0206994:	01033583          	ld	a1,16(t1)
ffffffffc0206998:	854e                	mv	a0,s3
ffffffffc020699a:	fc42                	sd	a6,56(sp)
ffffffffc020699c:	f81a                	sd	t1,48(sp)
ffffffffc020699e:	f446                	sd	a7,40(sp)
ffffffffc02069a0:	be4ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02069a4:	7342                	ld	t1,48(sp)
ffffffffc02069a6:	78a2                	ld	a7,40(sp)
ffffffffc02069a8:	7862                	ld	a6,56(sp)
ffffffffc02069aa:	00a33423          	sd	a0,8(t1)
ffffffffc02069ae:	01133823          	sd	a7,16(t1)
ffffffffc02069b2:	e119                	bnez	a0,ffffffffc02069b8 <stride_dequeue+0xa34>
ffffffffc02069b4:	7ee0106f          	j	ffffffffc02081a2 <stride_dequeue+0x221e>
ffffffffc02069b8:	00653023          	sd	t1,0(a0)
ffffffffc02069bc:	899a                	mv	s3,t1
ffffffffc02069be:	7782                	ld	a5,32(sp)
ffffffffc02069c0:	01383423          	sd	s3,8(a6)
ffffffffc02069c4:	00f83823          	sd	a5,16(a6)
ffffffffc02069c8:	0109b023          	sd	a6,0(s3)
ffffffffc02069cc:	67e2                	ld	a5,24(sp)
ffffffffc02069ce:	010cb423          	sd	a6,8(s9)
ffffffffc02069d2:	00fcb823          	sd	a5,16(s9)
ffffffffc02069d6:	01983023          	sd	s9,0(a6)
ffffffffc02069da:	67c2                	ld	a5,16(sp)
ffffffffc02069dc:	019a3423          	sd	s9,8(s4)
ffffffffc02069e0:	00fa3823          	sd	a5,16(s4)
ffffffffc02069e4:	014cb023          	sd	s4,0(s9)
ffffffffc02069e8:	867ff06f          	j	ffffffffc020624e <stride_dequeue+0x2ca>
ffffffffc02069ec:	008a3783          	ld	a5,8(s4)
ffffffffc02069f0:	010a3c83          	ld	s9,16(s4)
ffffffffc02069f4:	e83e                	sd	a5,16(sp)
ffffffffc02069f6:	0a0c8663          	beqz	s9,ffffffffc0206aa2 <stride_dequeue+0xb1e>
ffffffffc02069fa:	85ea                	mv	a1,s10
ffffffffc02069fc:	8566                	mv	a0,s9
ffffffffc02069fe:	b24ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206a02:	58fd                	li	a7,-1
ffffffffc0206a04:	0b1509e3          	beq	a0,a7,ffffffffc02072b6 <stride_dequeue+0x1332>
ffffffffc0206a08:	008d3783          	ld	a5,8(s10)
ffffffffc0206a0c:	010d3803          	ld	a6,16(s10)
ffffffffc0206a10:	ec3e                	sd	a5,24(sp)
ffffffffc0206a12:	00081463          	bnez	a6,ffffffffc0206a1a <stride_dequeue+0xa96>
ffffffffc0206a16:	31a0106f          	j	ffffffffc0207d30 <stride_dequeue+0x1dac>
ffffffffc0206a1a:	85c2                	mv	a1,a6
ffffffffc0206a1c:	8566                	mv	a0,s9
ffffffffc0206a1e:	f042                	sd	a6,32(sp)
ffffffffc0206a20:	b02ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206a24:	58fd                	li	a7,-1
ffffffffc0206a26:	7802                	ld	a6,32(sp)
ffffffffc0206a28:	01151463          	bne	a0,a7,ffffffffc0206a30 <stride_dequeue+0xaac>
ffffffffc0206a2c:	7ad0006f          	j	ffffffffc02079d8 <stride_dequeue+0x1a54>
ffffffffc0206a30:	00883783          	ld	a5,8(a6)
ffffffffc0206a34:	01083303          	ld	t1,16(a6)
ffffffffc0206a38:	f03e                	sd	a5,32(sp)
ffffffffc0206a3a:	04030663          	beqz	t1,ffffffffc0206a86 <stride_dequeue+0xb02>
ffffffffc0206a3e:	859a                	mv	a1,t1
ffffffffc0206a40:	8566                	mv	a0,s9
ffffffffc0206a42:	f842                	sd	a6,48(sp)
ffffffffc0206a44:	f41a                	sd	t1,40(sp)
ffffffffc0206a46:	adcff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206a4a:	58fd                	li	a7,-1
ffffffffc0206a4c:	7322                	ld	t1,40(sp)
ffffffffc0206a4e:	7842                	ld	a6,48(sp)
ffffffffc0206a50:	01151463          	bne	a0,a7,ffffffffc0206a58 <stride_dequeue+0xad4>
ffffffffc0206a54:	4360106f          	j	ffffffffc0207e8a <stride_dequeue+0x1f06>
ffffffffc0206a58:	00833883          	ld	a7,8(t1)
ffffffffc0206a5c:	01033583          	ld	a1,16(t1)
ffffffffc0206a60:	8566                	mv	a0,s9
ffffffffc0206a62:	fc42                	sd	a6,56(sp)
ffffffffc0206a64:	f81a                	sd	t1,48(sp)
ffffffffc0206a66:	f446                	sd	a7,40(sp)
ffffffffc0206a68:	b1cff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206a6c:	7342                	ld	t1,48(sp)
ffffffffc0206a6e:	78a2                	ld	a7,40(sp)
ffffffffc0206a70:	7862                	ld	a6,56(sp)
ffffffffc0206a72:	00a33423          	sd	a0,8(t1)
ffffffffc0206a76:	01133823          	sd	a7,16(t1)
ffffffffc0206a7a:	e119                	bnez	a0,ffffffffc0206a80 <stride_dequeue+0xafc>
ffffffffc0206a7c:	7ea0106f          	j	ffffffffc0208266 <stride_dequeue+0x22e2>
ffffffffc0206a80:	00653023          	sd	t1,0(a0)
ffffffffc0206a84:	8c9a                	mv	s9,t1
ffffffffc0206a86:	7782                	ld	a5,32(sp)
ffffffffc0206a88:	01983423          	sd	s9,8(a6)
ffffffffc0206a8c:	00f83823          	sd	a5,16(a6)
ffffffffc0206a90:	010cb023          	sd	a6,0(s9)
ffffffffc0206a94:	67e2                	ld	a5,24(sp)
ffffffffc0206a96:	010d3423          	sd	a6,8(s10)
ffffffffc0206a9a:	00fd3823          	sd	a5,16(s10)
ffffffffc0206a9e:	01a83023          	sd	s10,0(a6)
ffffffffc0206aa2:	67c2                	ld	a5,16(sp)
ffffffffc0206aa4:	01aa3423          	sd	s10,8(s4)
ffffffffc0206aa8:	00fa3823          	sd	a5,16(s4)
ffffffffc0206aac:	014d3023          	sd	s4,0(s10)
ffffffffc0206ab0:	8d52                	mv	s10,s4
ffffffffc0206ab2:	bba5                	j	ffffffffc020682a <stride_dequeue+0x8a6>
ffffffffc0206ab4:	008c3783          	ld	a5,8(s8)
ffffffffc0206ab8:	010c3c83          	ld	s9,16(s8)
ffffffffc0206abc:	e83e                	sd	a5,16(sp)
ffffffffc0206abe:	0a0c8463          	beqz	s9,ffffffffc0206b66 <stride_dequeue+0xbe2>
ffffffffc0206ac2:	85ea                	mv	a1,s10
ffffffffc0206ac4:	8566                	mv	a0,s9
ffffffffc0206ac6:	a5cff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206aca:	58fd                	li	a7,-1
ffffffffc0206acc:	6b150763          	beq	a0,a7,ffffffffc020717a <stride_dequeue+0x11f6>
ffffffffc0206ad0:	008d3783          	ld	a5,8(s10)
ffffffffc0206ad4:	010d3803          	ld	a6,16(s10)
ffffffffc0206ad8:	ec3e                	sd	a5,24(sp)
ffffffffc0206ada:	00081463          	bnez	a6,ffffffffc0206ae2 <stride_dequeue+0xb5e>
ffffffffc0206ade:	2580106f          	j	ffffffffc0207d36 <stride_dequeue+0x1db2>
ffffffffc0206ae2:	85c2                	mv	a1,a6
ffffffffc0206ae4:	8566                	mv	a0,s9
ffffffffc0206ae6:	f042                	sd	a6,32(sp)
ffffffffc0206ae8:	a3aff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206aec:	58fd                	li	a7,-1
ffffffffc0206aee:	7802                	ld	a6,32(sp)
ffffffffc0206af0:	571508e3          	beq	a0,a7,ffffffffc0207860 <stride_dequeue+0x18dc>
ffffffffc0206af4:	00883783          	ld	a5,8(a6)
ffffffffc0206af8:	01083303          	ld	t1,16(a6)
ffffffffc0206afc:	f03e                	sd	a5,32(sp)
ffffffffc0206afe:	04030663          	beqz	t1,ffffffffc0206b4a <stride_dequeue+0xbc6>
ffffffffc0206b02:	859a                	mv	a1,t1
ffffffffc0206b04:	8566                	mv	a0,s9
ffffffffc0206b06:	f842                	sd	a6,48(sp)
ffffffffc0206b08:	f41a                	sd	t1,40(sp)
ffffffffc0206b0a:	a18ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206b0e:	58fd                	li	a7,-1
ffffffffc0206b10:	7322                	ld	t1,40(sp)
ffffffffc0206b12:	7842                	ld	a6,48(sp)
ffffffffc0206b14:	01151463          	bne	a0,a7,ffffffffc0206b1c <stride_dequeue+0xb98>
ffffffffc0206b18:	3ee0106f          	j	ffffffffc0207f06 <stride_dequeue+0x1f82>
ffffffffc0206b1c:	00833883          	ld	a7,8(t1)
ffffffffc0206b20:	01033583          	ld	a1,16(t1)
ffffffffc0206b24:	8566                	mv	a0,s9
ffffffffc0206b26:	fc42                	sd	a6,56(sp)
ffffffffc0206b28:	f81a                	sd	t1,48(sp)
ffffffffc0206b2a:	f446                	sd	a7,40(sp)
ffffffffc0206b2c:	a58ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206b30:	7342                	ld	t1,48(sp)
ffffffffc0206b32:	78a2                	ld	a7,40(sp)
ffffffffc0206b34:	7862                	ld	a6,56(sp)
ffffffffc0206b36:	00a33423          	sd	a0,8(t1)
ffffffffc0206b3a:	01133823          	sd	a7,16(t1)
ffffffffc0206b3e:	e119                	bnez	a0,ffffffffc0206b44 <stride_dequeue+0xbc0>
ffffffffc0206b40:	6ee0106f          	j	ffffffffc020822e <stride_dequeue+0x22aa>
ffffffffc0206b44:	00653023          	sd	t1,0(a0)
ffffffffc0206b48:	8c9a                	mv	s9,t1
ffffffffc0206b4a:	7782                	ld	a5,32(sp)
ffffffffc0206b4c:	01983423          	sd	s9,8(a6)
ffffffffc0206b50:	00f83823          	sd	a5,16(a6)
ffffffffc0206b54:	010cb023          	sd	a6,0(s9)
ffffffffc0206b58:	67e2                	ld	a5,24(sp)
ffffffffc0206b5a:	010d3423          	sd	a6,8(s10)
ffffffffc0206b5e:	00fd3823          	sd	a5,16(s10)
ffffffffc0206b62:	01a83023          	sd	s10,0(a6)
ffffffffc0206b66:	67c2                	ld	a5,16(sp)
ffffffffc0206b68:	01ac3423          	sd	s10,8(s8)
ffffffffc0206b6c:	00fc3823          	sd	a5,16(s8)
ffffffffc0206b70:	018d3023          	sd	s8,0(s10)
ffffffffc0206b74:	80bff06f          	j	ffffffffc020637e <stride_dequeue+0x3fa>
ffffffffc0206b78:	649c                	ld	a5,8(s1)
ffffffffc0206b7a:	0104b883          	ld	a7,16(s1)
ffffffffc0206b7e:	f02a                	sd	a0,32(sp)
ffffffffc0206b80:	ec3e                	sd	a5,24(sp)
ffffffffc0206b82:	06088963          	beqz	a7,ffffffffc0206bf4 <stride_dequeue+0xc70>
ffffffffc0206b86:	8546                	mv	a0,a7
ffffffffc0206b88:	85d2                	mv	a1,s4
ffffffffc0206b8a:	f446                	sd	a7,40(sp)
ffffffffc0206b8c:	996ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206b90:	7802                	ld	a6,32(sp)
ffffffffc0206b92:	78a2                	ld	a7,40(sp)
ffffffffc0206b94:	190505e3          	beq	a0,a6,ffffffffc020751e <stride_dequeue+0x159a>
ffffffffc0206b98:	008a3783          	ld	a5,8(s4)
ffffffffc0206b9c:	010a3303          	ld	t1,16(s4)
ffffffffc0206ba0:	f442                	sd	a6,40(sp)
ffffffffc0206ba2:	f03e                	sd	a5,32(sp)
ffffffffc0206ba4:	4a030be3          	beqz	t1,ffffffffc020785a <stride_dequeue+0x18d6>
ffffffffc0206ba8:	859a                	mv	a1,t1
ffffffffc0206baa:	8546                	mv	a0,a7
ffffffffc0206bac:	fc1a                	sd	t1,56(sp)
ffffffffc0206bae:	f846                	sd	a7,48(sp)
ffffffffc0206bb0:	972ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206bb4:	7822                	ld	a6,40(sp)
ffffffffc0206bb6:	78c2                	ld	a7,48(sp)
ffffffffc0206bb8:	7362                	ld	t1,56(sp)
ffffffffc0206bba:	01051463          	bne	a0,a6,ffffffffc0206bc2 <stride_dequeue+0xc3e>
ffffffffc0206bbe:	10c0106f          	j	ffffffffc0207cca <stride_dequeue+0x1d46>
ffffffffc0206bc2:	00833803          	ld	a6,8(t1)
ffffffffc0206bc6:	01033583          	ld	a1,16(t1)
ffffffffc0206bca:	8546                	mv	a0,a7
ffffffffc0206bcc:	f81a                	sd	t1,48(sp)
ffffffffc0206bce:	f442                	sd	a6,40(sp)
ffffffffc0206bd0:	9b4ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206bd4:	7342                	ld	t1,48(sp)
ffffffffc0206bd6:	7822                	ld	a6,40(sp)
ffffffffc0206bd8:	00a33423          	sd	a0,8(t1)
ffffffffc0206bdc:	01033823          	sd	a6,16(t1)
ffffffffc0206be0:	c119                	beqz	a0,ffffffffc0206be6 <stride_dequeue+0xc62>
ffffffffc0206be2:	00653023          	sd	t1,0(a0)
ffffffffc0206be6:	7782                	ld	a5,32(sp)
ffffffffc0206be8:	006a3423          	sd	t1,8(s4)
ffffffffc0206bec:	00fa3823          	sd	a5,16(s4)
ffffffffc0206bf0:	01433023          	sd	s4,0(t1)
ffffffffc0206bf4:	67e2                	ld	a5,24(sp)
ffffffffc0206bf6:	0144b423          	sd	s4,8(s1)
ffffffffc0206bfa:	e89c                	sd	a5,16(s1)
ffffffffc0206bfc:	009a3023          	sd	s1,0(s4)
ffffffffc0206c00:	cc8ff06f          	j	ffffffffc02060c8 <stride_dequeue+0x144>
ffffffffc0206c04:	0089b783          	ld	a5,8(s3)
ffffffffc0206c08:	0109bc83          	ld	s9,16(s3)
ffffffffc0206c0c:	e83e                	sd	a5,16(sp)
ffffffffc0206c0e:	0a0c8563          	beqz	s9,ffffffffc0206cb8 <stride_dequeue+0xd34>
ffffffffc0206c12:	85ea                	mv	a1,s10
ffffffffc0206c14:	8566                	mv	a0,s9
ffffffffc0206c16:	90cff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206c1a:	537d                	li	t1,-1
ffffffffc0206c1c:	2e6507e3          	beq	a0,t1,ffffffffc020770a <stride_dequeue+0x1786>
ffffffffc0206c20:	008d3783          	ld	a5,8(s10)
ffffffffc0206c24:	010d3803          	ld	a6,16(s10)
ffffffffc0206c28:	ec3e                	sd	a5,24(sp)
ffffffffc0206c2a:	08080063          	beqz	a6,ffffffffc0206caa <stride_dequeue+0xd26>
ffffffffc0206c2e:	85c2                	mv	a1,a6
ffffffffc0206c30:	8566                	mv	a0,s9
ffffffffc0206c32:	f042                	sd	a6,32(sp)
ffffffffc0206c34:	8eeff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206c38:	537d                	li	t1,-1
ffffffffc0206c3a:	7802                	ld	a6,32(sp)
ffffffffc0206c3c:	00651463          	bne	a0,t1,ffffffffc0206c44 <stride_dequeue+0xcc0>
ffffffffc0206c40:	29e0106f          	j	ffffffffc0207ede <stride_dequeue+0x1f5a>
ffffffffc0206c44:	00883783          	ld	a5,8(a6)
ffffffffc0206c48:	01083883          	ld	a7,16(a6)
ffffffffc0206c4c:	f03e                	sd	a5,32(sp)
ffffffffc0206c4e:	04088663          	beqz	a7,ffffffffc0206c9a <stride_dequeue+0xd16>
ffffffffc0206c52:	85c6                	mv	a1,a7
ffffffffc0206c54:	8566                	mv	a0,s9
ffffffffc0206c56:	f842                	sd	a6,48(sp)
ffffffffc0206c58:	f446                	sd	a7,40(sp)
ffffffffc0206c5a:	8c8ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206c5e:	537d                	li	t1,-1
ffffffffc0206c60:	78a2                	ld	a7,40(sp)
ffffffffc0206c62:	7842                	ld	a6,48(sp)
ffffffffc0206c64:	00651463          	bne	a0,t1,ffffffffc0206c6c <stride_dequeue+0xce8>
ffffffffc0206c68:	0270106f          	j	ffffffffc020848e <stride_dequeue+0x250a>
ffffffffc0206c6c:	0088b303          	ld	t1,8(a7)
ffffffffc0206c70:	0108b583          	ld	a1,16(a7)
ffffffffc0206c74:	8566                	mv	a0,s9
ffffffffc0206c76:	fc42                	sd	a6,56(sp)
ffffffffc0206c78:	f846                	sd	a7,48(sp)
ffffffffc0206c7a:	f41a                	sd	t1,40(sp)
ffffffffc0206c7c:	908ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206c80:	78c2                	ld	a7,48(sp)
ffffffffc0206c82:	7322                	ld	t1,40(sp)
ffffffffc0206c84:	7862                	ld	a6,56(sp)
ffffffffc0206c86:	00a8b423          	sd	a0,8(a7)
ffffffffc0206c8a:	0068b823          	sd	t1,16(a7)
ffffffffc0206c8e:	e119                	bnez	a0,ffffffffc0206c94 <stride_dequeue+0xd10>
ffffffffc0206c90:	20d0106f          	j	ffffffffc020869c <stride_dequeue+0x2718>
ffffffffc0206c94:	01153023          	sd	a7,0(a0)
ffffffffc0206c98:	8cc6                	mv	s9,a7
ffffffffc0206c9a:	7782                	ld	a5,32(sp)
ffffffffc0206c9c:	01983423          	sd	s9,8(a6)
ffffffffc0206ca0:	00f83823          	sd	a5,16(a6)
ffffffffc0206ca4:	010cb023          	sd	a6,0(s9)
ffffffffc0206ca8:	8cc2                	mv	s9,a6
ffffffffc0206caa:	67e2                	ld	a5,24(sp)
ffffffffc0206cac:	019d3423          	sd	s9,8(s10)
ffffffffc0206cb0:	00fd3823          	sd	a5,16(s10)
ffffffffc0206cb4:	01acb023          	sd	s10,0(s9)
ffffffffc0206cb8:	67c2                	ld	a5,16(sp)
ffffffffc0206cba:	01a9b423          	sd	s10,8(s3)
ffffffffc0206cbe:	00f9b823          	sd	a5,16(s3)
ffffffffc0206cc2:	013d3023          	sd	s3,0(s10)
ffffffffc0206cc6:	8d4e                	mv	s10,s3
ffffffffc0206cc8:	b0f9                	j	ffffffffc0206596 <stride_dequeue+0x612>
ffffffffc0206cca:	008cb783          	ld	a5,8(s9)
ffffffffc0206cce:	010cbd03          	ld	s10,16(s9)
ffffffffc0206cd2:	e83e                	sd	a5,16(sp)
ffffffffc0206cd4:	0a0d0563          	beqz	s10,ffffffffc0206d7e <stride_dequeue+0xdfa>
ffffffffc0206cd8:	85ce                	mv	a1,s3
ffffffffc0206cda:	856a                	mv	a0,s10
ffffffffc0206cdc:	846ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206ce0:	537d                	li	t1,-1
ffffffffc0206ce2:	2c6508e3          	beq	a0,t1,ffffffffc02077b2 <stride_dequeue+0x182e>
ffffffffc0206ce6:	0089b783          	ld	a5,8(s3)
ffffffffc0206cea:	0109b803          	ld	a6,16(s3)
ffffffffc0206cee:	ec3e                	sd	a5,24(sp)
ffffffffc0206cf0:	08080063          	beqz	a6,ffffffffc0206d70 <stride_dequeue+0xdec>
ffffffffc0206cf4:	85c2                	mv	a1,a6
ffffffffc0206cf6:	856a                	mv	a0,s10
ffffffffc0206cf8:	f042                	sd	a6,32(sp)
ffffffffc0206cfa:	828ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206cfe:	537d                	li	t1,-1
ffffffffc0206d00:	7802                	ld	a6,32(sp)
ffffffffc0206d02:	00651463          	bne	a0,t1,ffffffffc0206d0a <stride_dequeue+0xd86>
ffffffffc0206d06:	39c0106f          	j	ffffffffc02080a2 <stride_dequeue+0x211e>
ffffffffc0206d0a:	00883783          	ld	a5,8(a6)
ffffffffc0206d0e:	01083883          	ld	a7,16(a6)
ffffffffc0206d12:	f03e                	sd	a5,32(sp)
ffffffffc0206d14:	04088663          	beqz	a7,ffffffffc0206d60 <stride_dequeue+0xddc>
ffffffffc0206d18:	85c6                	mv	a1,a7
ffffffffc0206d1a:	856a                	mv	a0,s10
ffffffffc0206d1c:	f842                	sd	a6,48(sp)
ffffffffc0206d1e:	f446                	sd	a7,40(sp)
ffffffffc0206d20:	802ff0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206d24:	537d                	li	t1,-1
ffffffffc0206d26:	78a2                	ld	a7,40(sp)
ffffffffc0206d28:	7842                	ld	a6,48(sp)
ffffffffc0206d2a:	00651463          	bne	a0,t1,ffffffffc0206d32 <stride_dequeue+0xdae>
ffffffffc0206d2e:	6d60106f          	j	ffffffffc0208404 <stride_dequeue+0x2480>
ffffffffc0206d32:	0088b303          	ld	t1,8(a7)
ffffffffc0206d36:	0108b583          	ld	a1,16(a7)
ffffffffc0206d3a:	856a                	mv	a0,s10
ffffffffc0206d3c:	fc42                	sd	a6,56(sp)
ffffffffc0206d3e:	f846                	sd	a7,48(sp)
ffffffffc0206d40:	f41a                	sd	t1,40(sp)
ffffffffc0206d42:	842ff0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206d46:	78c2                	ld	a7,48(sp)
ffffffffc0206d48:	7322                	ld	t1,40(sp)
ffffffffc0206d4a:	7862                	ld	a6,56(sp)
ffffffffc0206d4c:	00a8b423          	sd	a0,8(a7)
ffffffffc0206d50:	0068b823          	sd	t1,16(a7)
ffffffffc0206d54:	e119                	bnez	a0,ffffffffc0206d5a <stride_dequeue+0xdd6>
ffffffffc0206d56:	1170106f          	j	ffffffffc020866c <stride_dequeue+0x26e8>
ffffffffc0206d5a:	01153023          	sd	a7,0(a0)
ffffffffc0206d5e:	8d46                	mv	s10,a7
ffffffffc0206d60:	7782                	ld	a5,32(sp)
ffffffffc0206d62:	01a83423          	sd	s10,8(a6)
ffffffffc0206d66:	00f83823          	sd	a5,16(a6)
ffffffffc0206d6a:	010d3023          	sd	a6,0(s10)
ffffffffc0206d6e:	8d42                	mv	s10,a6
ffffffffc0206d70:	67e2                	ld	a5,24(sp)
ffffffffc0206d72:	01a9b423          	sd	s10,8(s3)
ffffffffc0206d76:	00f9b823          	sd	a5,16(s3)
ffffffffc0206d7a:	013d3023          	sd	s3,0(s10)
ffffffffc0206d7e:	67c2                	ld	a5,16(sp)
ffffffffc0206d80:	013cb423          	sd	s3,8(s9)
ffffffffc0206d84:	00fcb823          	sd	a5,16(s9)
ffffffffc0206d88:	0199b023          	sd	s9,0(s3)
ffffffffc0206d8c:	89e6                	mv	s3,s9
ffffffffc0206d8e:	b8dd                	j	ffffffffc0206684 <stride_dequeue+0x700>
ffffffffc0206d90:	008c3783          	ld	a5,8(s8)
ffffffffc0206d94:	010c3c83          	ld	s9,16(s8)
ffffffffc0206d98:	e83e                	sd	a5,16(sp)
ffffffffc0206d9a:	0a0c8563          	beqz	s9,ffffffffc0206e44 <stride_dequeue+0xec0>
ffffffffc0206d9e:	85ea                	mv	a1,s10
ffffffffc0206da0:	8566                	mv	a0,s9
ffffffffc0206da2:	f81fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206da6:	537d                	li	t1,-1
ffffffffc0206da8:	24650fe3          	beq	a0,t1,ffffffffc0207806 <stride_dequeue+0x1882>
ffffffffc0206dac:	008d3783          	ld	a5,8(s10)
ffffffffc0206db0:	010d3803          	ld	a6,16(s10)
ffffffffc0206db4:	ec3e                	sd	a5,24(sp)
ffffffffc0206db6:	08080063          	beqz	a6,ffffffffc0206e36 <stride_dequeue+0xeb2>
ffffffffc0206dba:	85c2                	mv	a1,a6
ffffffffc0206dbc:	8566                	mv	a0,s9
ffffffffc0206dbe:	f042                	sd	a6,32(sp)
ffffffffc0206dc0:	f63fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206dc4:	537d                	li	t1,-1
ffffffffc0206dc6:	7802                	ld	a6,32(sp)
ffffffffc0206dc8:	00651463          	bne	a0,t1,ffffffffc0206dd0 <stride_dequeue+0xe4c>
ffffffffc0206dcc:	2340106f          	j	ffffffffc0208000 <stride_dequeue+0x207c>
ffffffffc0206dd0:	00883783          	ld	a5,8(a6)
ffffffffc0206dd4:	01083883          	ld	a7,16(a6)
ffffffffc0206dd8:	f03e                	sd	a5,32(sp)
ffffffffc0206dda:	04088663          	beqz	a7,ffffffffc0206e26 <stride_dequeue+0xea2>
ffffffffc0206dde:	85c6                	mv	a1,a7
ffffffffc0206de0:	8566                	mv	a0,s9
ffffffffc0206de2:	f842                	sd	a6,48(sp)
ffffffffc0206de4:	f446                	sd	a7,40(sp)
ffffffffc0206de6:	f3dfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206dea:	537d                	li	t1,-1
ffffffffc0206dec:	78a2                	ld	a7,40(sp)
ffffffffc0206dee:	7842                	ld	a6,48(sp)
ffffffffc0206df0:	00651463          	bne	a0,t1,ffffffffc0206df8 <stride_dequeue+0xe74>
ffffffffc0206df4:	5020106f          	j	ffffffffc02082f6 <stride_dequeue+0x2372>
ffffffffc0206df8:	0088b303          	ld	t1,8(a7)
ffffffffc0206dfc:	0108b583          	ld	a1,16(a7)
ffffffffc0206e00:	8566                	mv	a0,s9
ffffffffc0206e02:	fc42                	sd	a6,56(sp)
ffffffffc0206e04:	f846                	sd	a7,48(sp)
ffffffffc0206e06:	f41a                	sd	t1,40(sp)
ffffffffc0206e08:	f7dfe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206e0c:	78c2                	ld	a7,48(sp)
ffffffffc0206e0e:	7322                	ld	t1,40(sp)
ffffffffc0206e10:	7862                	ld	a6,56(sp)
ffffffffc0206e12:	00a8b423          	sd	a0,8(a7)
ffffffffc0206e16:	0068b823          	sd	t1,16(a7)
ffffffffc0206e1a:	e119                	bnez	a0,ffffffffc0206e20 <stride_dequeue+0xe9c>
ffffffffc0206e1c:	02d0106f          	j	ffffffffc0208648 <stride_dequeue+0x26c4>
ffffffffc0206e20:	01153023          	sd	a7,0(a0)
ffffffffc0206e24:	8cc6                	mv	s9,a7
ffffffffc0206e26:	7782                	ld	a5,32(sp)
ffffffffc0206e28:	01983423          	sd	s9,8(a6)
ffffffffc0206e2c:	00f83823          	sd	a5,16(a6)
ffffffffc0206e30:	010cb023          	sd	a6,0(s9)
ffffffffc0206e34:	8cc2                	mv	s9,a6
ffffffffc0206e36:	67e2                	ld	a5,24(sp)
ffffffffc0206e38:	019d3423          	sd	s9,8(s10)
ffffffffc0206e3c:	00fd3823          	sd	a5,16(s10)
ffffffffc0206e40:	01acb023          	sd	s10,0(s9)
ffffffffc0206e44:	67c2                	ld	a5,16(sp)
ffffffffc0206e46:	01ac3423          	sd	s10,8(s8)
ffffffffc0206e4a:	00fc3823          	sd	a5,16(s8)
ffffffffc0206e4e:	018d3023          	sd	s8,0(s10)
ffffffffc0206e52:	e44ff06f          	j	ffffffffc0206496 <stride_dequeue+0x512>
ffffffffc0206e56:	008a3783          	ld	a5,8(s4)
ffffffffc0206e5a:	010a3883          	ld	a7,16(s4)
ffffffffc0206e5e:	f02a                	sd	a0,32(sp)
ffffffffc0206e60:	ec3e                	sd	a5,24(sp)
ffffffffc0206e62:	06088c63          	beqz	a7,ffffffffc0206eda <stride_dequeue+0xf56>
ffffffffc0206e66:	8546                	mv	a0,a7
ffffffffc0206e68:	85ce                	mv	a1,s3
ffffffffc0206e6a:	f446                	sd	a7,40(sp)
ffffffffc0206e6c:	eb7fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206e70:	7802                	ld	a6,32(sp)
ffffffffc0206e72:	78a2                	ld	a7,40(sp)
ffffffffc0206e74:	4f0504e3          	beq	a0,a6,ffffffffc0207b5c <stride_dequeue+0x1bd8>
ffffffffc0206e78:	0089b783          	ld	a5,8(s3)
ffffffffc0206e7c:	0109b303          	ld	t1,16(s3)
ffffffffc0206e80:	f442                	sd	a6,40(sp)
ffffffffc0206e82:	f03e                	sd	a5,32(sp)
ffffffffc0206e84:	04030463          	beqz	t1,ffffffffc0206ecc <stride_dequeue+0xf48>
ffffffffc0206e88:	859a                	mv	a1,t1
ffffffffc0206e8a:	8546                	mv	a0,a7
ffffffffc0206e8c:	fc1a                	sd	t1,56(sp)
ffffffffc0206e8e:	f846                	sd	a7,48(sp)
ffffffffc0206e90:	e93fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206e94:	7822                	ld	a6,40(sp)
ffffffffc0206e96:	78c2                	ld	a7,48(sp)
ffffffffc0206e98:	7362                	ld	t1,56(sp)
ffffffffc0206e9a:	01051463          	bne	a0,a6,ffffffffc0206ea2 <stride_dequeue+0xf1e>
ffffffffc0206e9e:	22c0106f          	j	ffffffffc02080ca <stride_dequeue+0x2146>
ffffffffc0206ea2:	00833803          	ld	a6,8(t1)
ffffffffc0206ea6:	01033583          	ld	a1,16(t1)
ffffffffc0206eaa:	8546                	mv	a0,a7
ffffffffc0206eac:	f81a                	sd	t1,48(sp)
ffffffffc0206eae:	f442                	sd	a6,40(sp)
ffffffffc0206eb0:	ed5fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206eb4:	7342                	ld	t1,48(sp)
ffffffffc0206eb6:	7822                	ld	a6,40(sp)
ffffffffc0206eb8:	00a33423          	sd	a0,8(t1)
ffffffffc0206ebc:	01033823          	sd	a6,16(t1)
ffffffffc0206ec0:	e119                	bnez	a0,ffffffffc0206ec6 <stride_dequeue+0xf42>
ffffffffc0206ec2:	2d40106f          	j	ffffffffc0208196 <stride_dequeue+0x2212>
ffffffffc0206ec6:	00653023          	sd	t1,0(a0)
ffffffffc0206eca:	889a                	mv	a7,t1
ffffffffc0206ecc:	7782                	ld	a5,32(sp)
ffffffffc0206ece:	0119b423          	sd	a7,8(s3)
ffffffffc0206ed2:	00f9b823          	sd	a5,16(s3)
ffffffffc0206ed6:	0138b023          	sd	s3,0(a7)
ffffffffc0206eda:	67e2                	ld	a5,24(sp)
ffffffffc0206edc:	013a3423          	sd	s3,8(s4)
ffffffffc0206ee0:	00fa3823          	sd	a5,16(s4)
ffffffffc0206ee4:	0149b023          	sd	s4,0(s3)
ffffffffc0206ee8:	b56ff06f          	j	ffffffffc020623e <stride_dequeue+0x2ba>
ffffffffc0206eec:	008c3783          	ld	a5,8(s8)
ffffffffc0206ef0:	010c3883          	ld	a7,16(s8)
ffffffffc0206ef4:	f02a                	sd	a0,32(sp)
ffffffffc0206ef6:	ec3e                	sd	a5,24(sp)
ffffffffc0206ef8:	06088c63          	beqz	a7,ffffffffc0206f70 <stride_dequeue+0xfec>
ffffffffc0206efc:	8546                	mv	a0,a7
ffffffffc0206efe:	85e6                	mv	a1,s9
ffffffffc0206f00:	f446                	sd	a7,40(sp)
ffffffffc0206f02:	e21fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206f06:	7802                	ld	a6,32(sp)
ffffffffc0206f08:	78a2                	ld	a7,40(sp)
ffffffffc0206f0a:	4b050ee3          	beq	a0,a6,ffffffffc0207bc6 <stride_dequeue+0x1c42>
ffffffffc0206f0e:	008cb783          	ld	a5,8(s9)
ffffffffc0206f12:	010cb303          	ld	t1,16(s9)
ffffffffc0206f16:	f442                	sd	a6,40(sp)
ffffffffc0206f18:	f03e                	sd	a5,32(sp)
ffffffffc0206f1a:	04030463          	beqz	t1,ffffffffc0206f62 <stride_dequeue+0xfde>
ffffffffc0206f1e:	859a                	mv	a1,t1
ffffffffc0206f20:	8546                	mv	a0,a7
ffffffffc0206f22:	fc1a                	sd	t1,56(sp)
ffffffffc0206f24:	f846                	sd	a7,48(sp)
ffffffffc0206f26:	dfdfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206f2a:	7822                	ld	a6,40(sp)
ffffffffc0206f2c:	78c2                	ld	a7,48(sp)
ffffffffc0206f2e:	7362                	ld	t1,56(sp)
ffffffffc0206f30:	01051463          	bne	a0,a6,ffffffffc0206f38 <stride_dequeue+0xfb4>
ffffffffc0206f34:	1c00106f          	j	ffffffffc02080f4 <stride_dequeue+0x2170>
ffffffffc0206f38:	00833803          	ld	a6,8(t1)
ffffffffc0206f3c:	01033583          	ld	a1,16(t1)
ffffffffc0206f40:	8546                	mv	a0,a7
ffffffffc0206f42:	f81a                	sd	t1,48(sp)
ffffffffc0206f44:	f442                	sd	a6,40(sp)
ffffffffc0206f46:	e3ffe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206f4a:	7342                	ld	t1,48(sp)
ffffffffc0206f4c:	7822                	ld	a6,40(sp)
ffffffffc0206f4e:	00a33423          	sd	a0,8(t1)
ffffffffc0206f52:	01033823          	sd	a6,16(t1)
ffffffffc0206f56:	e119                	bnez	a0,ffffffffc0206f5c <stride_dequeue+0xfd8>
ffffffffc0206f58:	2440106f          	j	ffffffffc020819c <stride_dequeue+0x2218>
ffffffffc0206f5c:	00653023          	sd	t1,0(a0)
ffffffffc0206f60:	889a                	mv	a7,t1
ffffffffc0206f62:	7782                	ld	a5,32(sp)
ffffffffc0206f64:	011cb423          	sd	a7,8(s9)
ffffffffc0206f68:	00fcb823          	sd	a5,16(s9)
ffffffffc0206f6c:	0198b023          	sd	s9,0(a7)
ffffffffc0206f70:	67e2                	ld	a5,24(sp)
ffffffffc0206f72:	019c3423          	sd	s9,8(s8)
ffffffffc0206f76:	00fc3823          	sd	a5,16(s8)
ffffffffc0206f7a:	018cb023          	sd	s8,0(s9)
ffffffffc0206f7e:	bf0ff06f          	j	ffffffffc020636e <stride_dequeue+0x3ea>
ffffffffc0206f82:	008a3783          	ld	a5,8(s4)
ffffffffc0206f86:	010a3883          	ld	a7,16(s4)
ffffffffc0206f8a:	f02a                	sd	a0,32(sp)
ffffffffc0206f8c:	ec3e                	sd	a5,24(sp)
ffffffffc0206f8e:	06088a63          	beqz	a7,ffffffffc0207002 <stride_dequeue+0x107e>
ffffffffc0206f92:	8546                	mv	a0,a7
ffffffffc0206f94:	85e6                	mv	a1,s9
ffffffffc0206f96:	f446                	sd	a7,40(sp)
ffffffffc0206f98:	d8bfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206f9c:	7802                	ld	a6,32(sp)
ffffffffc0206f9e:	78a2                	ld	a7,40(sp)
ffffffffc0206fa0:	1d050de3          	beq	a0,a6,ffffffffc020797a <stride_dequeue+0x19f6>
ffffffffc0206fa4:	008cb783          	ld	a5,8(s9)
ffffffffc0206fa8:	010cb303          	ld	t1,16(s9)
ffffffffc0206fac:	f442                	sd	a6,40(sp)
ffffffffc0206fae:	f03e                	sd	a5,32(sp)
ffffffffc0206fb0:	04030263          	beqz	t1,ffffffffc0206ff4 <stride_dequeue+0x1070>
ffffffffc0206fb4:	859a                	mv	a1,t1
ffffffffc0206fb6:	8546                	mv	a0,a7
ffffffffc0206fb8:	fc1a                	sd	t1,56(sp)
ffffffffc0206fba:	f846                	sd	a7,48(sp)
ffffffffc0206fbc:	d67fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0206fc0:	7822                	ld	a6,40(sp)
ffffffffc0206fc2:	78c2                	ld	a7,48(sp)
ffffffffc0206fc4:	7362                	ld	t1,56(sp)
ffffffffc0206fc6:	5b0501e3          	beq	a0,a6,ffffffffc0207d68 <stride_dequeue+0x1de4>
ffffffffc0206fca:	00833803          	ld	a6,8(t1)
ffffffffc0206fce:	01033583          	ld	a1,16(t1)
ffffffffc0206fd2:	8546                	mv	a0,a7
ffffffffc0206fd4:	f81a                	sd	t1,48(sp)
ffffffffc0206fd6:	f442                	sd	a6,40(sp)
ffffffffc0206fd8:	dadfe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0206fdc:	7342                	ld	t1,48(sp)
ffffffffc0206fde:	7822                	ld	a6,40(sp)
ffffffffc0206fe0:	00a33423          	sd	a0,8(t1)
ffffffffc0206fe4:	01033823          	sd	a6,16(t1)
ffffffffc0206fe8:	e119                	bnez	a0,ffffffffc0206fee <stride_dequeue+0x106a>
ffffffffc0206fea:	2760106f          	j	ffffffffc0208260 <stride_dequeue+0x22dc>
ffffffffc0206fee:	00653023          	sd	t1,0(a0)
ffffffffc0206ff2:	889a                	mv	a7,t1
ffffffffc0206ff4:	7782                	ld	a5,32(sp)
ffffffffc0206ff6:	011cb423          	sd	a7,8(s9)
ffffffffc0206ffa:	00fcb823          	sd	a5,16(s9)
ffffffffc0206ffe:	0198b023          	sd	s9,0(a7)
ffffffffc0207002:	67e2                	ld	a5,24(sp)
ffffffffc0207004:	019a3423          	sd	s9,8(s4)
ffffffffc0207008:	00fa3823          	sd	a5,16(s4)
ffffffffc020700c:	014cb023          	sd	s4,0(s9)
ffffffffc0207010:	80dff06f          	j	ffffffffc020681c <stride_dequeue+0x898>
ffffffffc0207014:	008a3783          	ld	a5,8(s4)
ffffffffc0207018:	010a3883          	ld	a7,16(s4)
ffffffffc020701c:	f02a                	sd	a0,32(sp)
ffffffffc020701e:	ec3e                	sd	a5,24(sp)
ffffffffc0207020:	06088c63          	beqz	a7,ffffffffc0207098 <stride_dequeue+0x1114>
ffffffffc0207024:	8546                	mv	a0,a7
ffffffffc0207026:	85e6                	mv	a1,s9
ffffffffc0207028:	f446                	sd	a7,40(sp)
ffffffffc020702a:	cf9fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020702e:	7802                	ld	a6,32(sp)
ffffffffc0207030:	78a2                	ld	a7,40(sp)
ffffffffc0207032:	090506e3          	beq	a0,a6,ffffffffc02078be <stride_dequeue+0x193a>
ffffffffc0207036:	008cb783          	ld	a5,8(s9)
ffffffffc020703a:	010cb303          	ld	t1,16(s9)
ffffffffc020703e:	f442                	sd	a6,40(sp)
ffffffffc0207040:	f03e                	sd	a5,32(sp)
ffffffffc0207042:	04030463          	beqz	t1,ffffffffc020708a <stride_dequeue+0x1106>
ffffffffc0207046:	859a                	mv	a1,t1
ffffffffc0207048:	8546                	mv	a0,a7
ffffffffc020704a:	fc1a                	sd	t1,56(sp)
ffffffffc020704c:	f846                	sd	a7,48(sp)
ffffffffc020704e:	cd5fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207052:	7822                	ld	a6,40(sp)
ffffffffc0207054:	78c2                	ld	a7,48(sp)
ffffffffc0207056:	7362                	ld	t1,56(sp)
ffffffffc0207058:	01051463          	bne	a0,a6,ffffffffc0207060 <stride_dequeue+0x10dc>
ffffffffc020705c:	0ec0106f          	j	ffffffffc0208148 <stride_dequeue+0x21c4>
ffffffffc0207060:	00833803          	ld	a6,8(t1)
ffffffffc0207064:	01033583          	ld	a1,16(t1)
ffffffffc0207068:	8546                	mv	a0,a7
ffffffffc020706a:	f81a                	sd	t1,48(sp)
ffffffffc020706c:	f442                	sd	a6,40(sp)
ffffffffc020706e:	d17fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207072:	7342                	ld	t1,48(sp)
ffffffffc0207074:	7822                	ld	a6,40(sp)
ffffffffc0207076:	00a33423          	sd	a0,8(t1)
ffffffffc020707a:	01033823          	sd	a6,16(t1)
ffffffffc020707e:	e119                	bnez	a0,ffffffffc0207084 <stride_dequeue+0x1100>
ffffffffc0207080:	12e0106f          	j	ffffffffc02081ae <stride_dequeue+0x222a>
ffffffffc0207084:	00653023          	sd	t1,0(a0)
ffffffffc0207088:	889a                	mv	a7,t1
ffffffffc020708a:	7782                	ld	a5,32(sp)
ffffffffc020708c:	011cb423          	sd	a7,8(s9)
ffffffffc0207090:	00fcb823          	sd	a5,16(s9)
ffffffffc0207094:	0198b023          	sd	s9,0(a7)
ffffffffc0207098:	67e2                	ld	a5,24(sp)
ffffffffc020709a:	019a3423          	sd	s9,8(s4)
ffffffffc020709e:	00fa3823          	sd	a5,16(s4)
ffffffffc02070a2:	014cb023          	sd	s4,0(s9)
ffffffffc02070a6:	8cd2                	mv	s9,s4
ffffffffc02070a8:	e9aff06f          	j	ffffffffc0206742 <stride_dequeue+0x7be>
ffffffffc02070ac:	6498                	ld	a4,8(s1)
ffffffffc02070ae:	0104b883          	ld	a7,16(s1)
ffffffffc02070b2:	f42a                	sd	a0,40(sp)
ffffffffc02070b4:	f03a                	sd	a4,32(sp)
ffffffffc02070b6:	02088c63          	beqz	a7,ffffffffc02070ee <stride_dequeue+0x116a>
ffffffffc02070ba:	85be                	mv	a1,a5
ffffffffc02070bc:	8546                	mv	a0,a7
ffffffffc02070be:	fc3e                	sd	a5,56(sp)
ffffffffc02070c0:	f846                	sd	a7,48(sp)
ffffffffc02070c2:	c61fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02070c6:	7322                	ld	t1,40(sp)
ffffffffc02070c8:	78c2                	ld	a7,48(sp)
ffffffffc02070ca:	77e2                	ld	a5,56(sp)
ffffffffc02070cc:	3c650ae3          	beq	a0,t1,ffffffffc0207ca0 <stride_dequeue+0x1d1c>
ffffffffc02070d0:	0087b303          	ld	t1,8(a5)
ffffffffc02070d4:	6b8c                	ld	a1,16(a5)
ffffffffc02070d6:	8546                	mv	a0,a7
ffffffffc02070d8:	f83e                	sd	a5,48(sp)
ffffffffc02070da:	f41a                	sd	t1,40(sp)
ffffffffc02070dc:	ca9fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02070e0:	77c2                	ld	a5,48(sp)
ffffffffc02070e2:	7322                	ld	t1,40(sp)
ffffffffc02070e4:	e788                	sd	a0,8(a5)
ffffffffc02070e6:	0067b823          	sd	t1,16(a5)
ffffffffc02070ea:	c111                	beqz	a0,ffffffffc02070ee <stride_dequeue+0x116a>
ffffffffc02070ec:	e11c                	sd	a5,0(a0)
ffffffffc02070ee:	7702                	ld	a4,32(sp)
ffffffffc02070f0:	e49c                	sd	a5,8(s1)
ffffffffc02070f2:	e898                	sd	a4,16(s1)
ffffffffc02070f4:	e384                	sd	s1,0(a5)
ffffffffc02070f6:	fc3fe06f          	j	ffffffffc02060b8 <stride_dequeue+0x134>
ffffffffc02070fa:	008cb783          	ld	a5,8(s9)
ffffffffc02070fe:	010cbd03          	ld	s10,16(s9)
ffffffffc0207102:	e83e                	sd	a5,16(sp)
ffffffffc0207104:	520d08e3          	beqz	s10,ffffffffc0207e34 <stride_dequeue+0x1eb0>
ffffffffc0207108:	85a2                	mv	a1,s0
ffffffffc020710a:	856a                	mv	a0,s10
ffffffffc020710c:	c17fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207110:	587d                	li	a6,-1
ffffffffc0207112:	430508e3          	beq	a0,a6,ffffffffc0207d42 <stride_dequeue+0x1dbe>
ffffffffc0207116:	641c                	ld	a5,8(s0)
ffffffffc0207118:	6810                	ld	a2,16(s0)
ffffffffc020711a:	ec3e                	sd	a5,24(sp)
ffffffffc020711c:	ce15                	beqz	a2,ffffffffc0207158 <stride_dequeue+0x11d4>
ffffffffc020711e:	85b2                	mv	a1,a2
ffffffffc0207120:	856a                	mv	a0,s10
ffffffffc0207122:	f032                	sd	a2,32(sp)
ffffffffc0207124:	bfffe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207128:	587d                	li	a6,-1
ffffffffc020712a:	7602                	ld	a2,32(sp)
ffffffffc020712c:	01051463          	bne	a0,a6,ffffffffc0207134 <stride_dequeue+0x11b0>
ffffffffc0207130:	0b00106f          	j	ffffffffc02081e0 <stride_dequeue+0x225c>
ffffffffc0207134:	00863803          	ld	a6,8(a2)
ffffffffc0207138:	6a0c                	ld	a1,16(a2)
ffffffffc020713a:	856a                	mv	a0,s10
ffffffffc020713c:	f432                	sd	a2,40(sp)
ffffffffc020713e:	f042                	sd	a6,32(sp)
ffffffffc0207140:	c45fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207144:	7622                	ld	a2,40(sp)
ffffffffc0207146:	7802                	ld	a6,32(sp)
ffffffffc0207148:	e608                	sd	a0,8(a2)
ffffffffc020714a:	01063823          	sd	a6,16(a2)
ffffffffc020714e:	e119                	bnez	a0,ffffffffc0207154 <stride_dequeue+0x11d0>
ffffffffc0207150:	1a00106f          	j	ffffffffc02082f0 <stride_dequeue+0x236c>
ffffffffc0207154:	e110                	sd	a2,0(a0)
ffffffffc0207156:	8d32                	mv	s10,a2
ffffffffc0207158:	67e2                	ld	a5,24(sp)
ffffffffc020715a:	01a43423          	sd	s10,8(s0)
ffffffffc020715e:	e81c                	sd	a5,16(s0)
ffffffffc0207160:	008d3023          	sd	s0,0(s10)
ffffffffc0207164:	8d22                	mv	s10,s0
ffffffffc0207166:	67c2                	ld	a5,16(sp)
ffffffffc0207168:	01acb423          	sd	s10,8(s9)
ffffffffc020716c:	8466                	mv	s0,s9
ffffffffc020716e:	00fcb823          	sd	a5,16(s9)
ffffffffc0207172:	019d3023          	sd	s9,0(s10)
ffffffffc0207176:	f9cff06f          	j	ffffffffc0206912 <stride_dequeue+0x98e>
ffffffffc020717a:	008cb783          	ld	a5,8(s9)
ffffffffc020717e:	010cb803          	ld	a6,16(s9)
ffffffffc0207182:	f02a                	sd	a0,32(sp)
ffffffffc0207184:	ec3e                	sd	a5,24(sp)
ffffffffc0207186:	00081463          	bnez	a6,ffffffffc020718e <stride_dequeue+0x120a>
ffffffffc020718a:	7e90006f          	j	ffffffffc0208172 <stride_dequeue+0x21ee>
ffffffffc020718e:	8542                	mv	a0,a6
ffffffffc0207190:	85ea                	mv	a1,s10
ffffffffc0207192:	f442                	sd	a6,40(sp)
ffffffffc0207194:	b8ffe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207198:	7302                	ld	t1,32(sp)
ffffffffc020719a:	7822                	ld	a6,40(sp)
ffffffffc020719c:	00651463          	bne	a0,t1,ffffffffc02071a4 <stride_dequeue+0x1220>
ffffffffc02071a0:	6db0006f          	j	ffffffffc020807a <stride_dequeue+0x20f6>
ffffffffc02071a4:	008d3783          	ld	a5,8(s10)
ffffffffc02071a8:	010d3883          	ld	a7,16(s10)
ffffffffc02071ac:	fc1a                	sd	t1,56(sp)
ffffffffc02071ae:	f03e                	sd	a5,32(sp)
ffffffffc02071b0:	04088463          	beqz	a7,ffffffffc02071f8 <stride_dequeue+0x1274>
ffffffffc02071b4:	85c6                	mv	a1,a7
ffffffffc02071b6:	8542                	mv	a0,a6
ffffffffc02071b8:	f846                	sd	a7,48(sp)
ffffffffc02071ba:	f442                	sd	a6,40(sp)
ffffffffc02071bc:	b67fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02071c0:	7362                	ld	t1,56(sp)
ffffffffc02071c2:	7822                	ld	a6,40(sp)
ffffffffc02071c4:	78c2                	ld	a7,48(sp)
ffffffffc02071c6:	00651463          	bne	a0,t1,ffffffffc02071ce <stride_dequeue+0x124a>
ffffffffc02071ca:	0ce0106f          	j	ffffffffc0208298 <stride_dequeue+0x2314>
ffffffffc02071ce:	0088b303          	ld	t1,8(a7)
ffffffffc02071d2:	0108b583          	ld	a1,16(a7)
ffffffffc02071d6:	8542                	mv	a0,a6
ffffffffc02071d8:	f846                	sd	a7,48(sp)
ffffffffc02071da:	f41a                	sd	t1,40(sp)
ffffffffc02071dc:	ba9fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02071e0:	78c2                	ld	a7,48(sp)
ffffffffc02071e2:	7322                	ld	t1,40(sp)
ffffffffc02071e4:	00a8b423          	sd	a0,8(a7)
ffffffffc02071e8:	0068b823          	sd	t1,16(a7)
ffffffffc02071ec:	e119                	bnez	a0,ffffffffc02071f2 <stride_dequeue+0x126e>
ffffffffc02071ee:	48a0106f          	j	ffffffffc0208678 <stride_dequeue+0x26f4>
ffffffffc02071f2:	01153023          	sd	a7,0(a0)
ffffffffc02071f6:	8846                	mv	a6,a7
ffffffffc02071f8:	7782                	ld	a5,32(sp)
ffffffffc02071fa:	010d3423          	sd	a6,8(s10)
ffffffffc02071fe:	00fd3823          	sd	a5,16(s10)
ffffffffc0207202:	01a83023          	sd	s10,0(a6)
ffffffffc0207206:	886a                	mv	a6,s10
ffffffffc0207208:	67e2                	ld	a5,24(sp)
ffffffffc020720a:	010cb423          	sd	a6,8(s9)
ffffffffc020720e:	8d66                	mv	s10,s9
ffffffffc0207210:	00fcb823          	sd	a5,16(s9)
ffffffffc0207214:	01983023          	sd	s9,0(a6)
ffffffffc0207218:	b2b9                	j	ffffffffc0206b66 <stride_dequeue+0xbe2>
ffffffffc020721a:	008c3783          	ld	a5,8(s8)
ffffffffc020721e:	010c3803          	ld	a6,16(s8)
ffffffffc0207222:	f02a                	sd	a0,32(sp)
ffffffffc0207224:	ec3e                	sd	a5,24(sp)
ffffffffc0207226:	00081463          	bnez	a6,ffffffffc020722e <stride_dequeue+0x12aa>
ffffffffc020722a:	75b0006f          	j	ffffffffc0208184 <stride_dequeue+0x2200>
ffffffffc020722e:	8542                	mv	a0,a6
ffffffffc0207230:	85e6                	mv	a1,s9
ffffffffc0207232:	f442                	sd	a6,40(sp)
ffffffffc0207234:	aeffe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207238:	7302                	ld	t1,32(sp)
ffffffffc020723a:	7822                	ld	a6,40(sp)
ffffffffc020723c:	426503e3          	beq	a0,t1,ffffffffc0207e62 <stride_dequeue+0x1ede>
ffffffffc0207240:	008cb783          	ld	a5,8(s9)
ffffffffc0207244:	010cb883          	ld	a7,16(s9)
ffffffffc0207248:	fc1a                	sd	t1,56(sp)
ffffffffc020724a:	f03e                	sd	a5,32(sp)
ffffffffc020724c:	04088463          	beqz	a7,ffffffffc0207294 <stride_dequeue+0x1310>
ffffffffc0207250:	85c6                	mv	a1,a7
ffffffffc0207252:	8542                	mv	a0,a6
ffffffffc0207254:	f846                	sd	a7,48(sp)
ffffffffc0207256:	f442                	sd	a6,40(sp)
ffffffffc0207258:	acbfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020725c:	7362                	ld	t1,56(sp)
ffffffffc020725e:	7822                	ld	a6,40(sp)
ffffffffc0207260:	78c2                	ld	a7,48(sp)
ffffffffc0207262:	00651463          	bne	a0,t1,ffffffffc020726a <stride_dequeue+0x12e6>
ffffffffc0207266:	0ea0106f          	j	ffffffffc0208350 <stride_dequeue+0x23cc>
ffffffffc020726a:	0088b303          	ld	t1,8(a7)
ffffffffc020726e:	0108b583          	ld	a1,16(a7)
ffffffffc0207272:	8542                	mv	a0,a6
ffffffffc0207274:	f846                	sd	a7,48(sp)
ffffffffc0207276:	f41a                	sd	t1,40(sp)
ffffffffc0207278:	b0dfe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020727c:	78c2                	ld	a7,48(sp)
ffffffffc020727e:	7322                	ld	t1,40(sp)
ffffffffc0207280:	00a8b423          	sd	a0,8(a7)
ffffffffc0207284:	0068b823          	sd	t1,16(a7)
ffffffffc0207288:	e119                	bnez	a0,ffffffffc020728e <stride_dequeue+0x130a>
ffffffffc020728a:	3ca0106f          	j	ffffffffc0208654 <stride_dequeue+0x26d0>
ffffffffc020728e:	01153023          	sd	a7,0(a0)
ffffffffc0207292:	8846                	mv	a6,a7
ffffffffc0207294:	7782                	ld	a5,32(sp)
ffffffffc0207296:	010cb423          	sd	a6,8(s9)
ffffffffc020729a:	00fcb823          	sd	a5,16(s9)
ffffffffc020729e:	01983023          	sd	s9,0(a6)
ffffffffc02072a2:	8866                	mv	a6,s9
ffffffffc02072a4:	67e2                	ld	a5,24(sp)
ffffffffc02072a6:	010c3423          	sd	a6,8(s8)
ffffffffc02072aa:	00fc3823          	sd	a5,16(s8)
ffffffffc02072ae:	01883023          	sd	s8,0(a6)
ffffffffc02072b2:	9d4ff06f          	j	ffffffffc0206486 <stride_dequeue+0x502>
ffffffffc02072b6:	008cb783          	ld	a5,8(s9)
ffffffffc02072ba:	010cb803          	ld	a6,16(s9)
ffffffffc02072be:	f02a                	sd	a0,32(sp)
ffffffffc02072c0:	ec3e                	sd	a5,24(sp)
ffffffffc02072c2:	00081463          	bnez	a6,ffffffffc02072ca <stride_dequeue+0x1346>
ffffffffc02072c6:	6b30006f          	j	ffffffffc0208178 <stride_dequeue+0x21f4>
ffffffffc02072ca:	8542                	mv	a0,a6
ffffffffc02072cc:	85ea                	mv	a1,s10
ffffffffc02072ce:	f442                	sd	a6,40(sp)
ffffffffc02072d0:	a53fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02072d4:	7302                	ld	t1,32(sp)
ffffffffc02072d6:	7822                	ld	a6,40(sp)
ffffffffc02072d8:	546508e3          	beq	a0,t1,ffffffffc0208028 <stride_dequeue+0x20a4>
ffffffffc02072dc:	008d3783          	ld	a5,8(s10)
ffffffffc02072e0:	010d3883          	ld	a7,16(s10)
ffffffffc02072e4:	fc1a                	sd	t1,56(sp)
ffffffffc02072e6:	f03e                	sd	a5,32(sp)
ffffffffc02072e8:	04088463          	beqz	a7,ffffffffc0207330 <stride_dequeue+0x13ac>
ffffffffc02072ec:	85c6                	mv	a1,a7
ffffffffc02072ee:	8542                	mv	a0,a6
ffffffffc02072f0:	f846                	sd	a7,48(sp)
ffffffffc02072f2:	f442                	sd	a6,40(sp)
ffffffffc02072f4:	a2ffe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02072f8:	7362                	ld	t1,56(sp)
ffffffffc02072fa:	7822                	ld	a6,40(sp)
ffffffffc02072fc:	78c2                	ld	a7,48(sp)
ffffffffc02072fe:	00651463          	bne	a0,t1,ffffffffc0207306 <stride_dequeue+0x1382>
ffffffffc0207302:	1e00106f          	j	ffffffffc02084e2 <stride_dequeue+0x255e>
ffffffffc0207306:	0088b303          	ld	t1,8(a7)
ffffffffc020730a:	0108b583          	ld	a1,16(a7)
ffffffffc020730e:	8542                	mv	a0,a6
ffffffffc0207310:	f846                	sd	a7,48(sp)
ffffffffc0207312:	f41a                	sd	t1,40(sp)
ffffffffc0207314:	a71fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207318:	78c2                	ld	a7,48(sp)
ffffffffc020731a:	7322                	ld	t1,40(sp)
ffffffffc020731c:	00a8b423          	sd	a0,8(a7)
ffffffffc0207320:	0068b823          	sd	t1,16(a7)
ffffffffc0207324:	e119                	bnez	a0,ffffffffc020732a <stride_dequeue+0x13a6>
ffffffffc0207326:	3100106f          	j	ffffffffc0208636 <stride_dequeue+0x26b2>
ffffffffc020732a:	01153023          	sd	a7,0(a0)
ffffffffc020732e:	8846                	mv	a6,a7
ffffffffc0207330:	7782                	ld	a5,32(sp)
ffffffffc0207332:	010d3423          	sd	a6,8(s10)
ffffffffc0207336:	00fd3823          	sd	a5,16(s10)
ffffffffc020733a:	01a83023          	sd	s10,0(a6)
ffffffffc020733e:	886a                	mv	a6,s10
ffffffffc0207340:	67e2                	ld	a5,24(sp)
ffffffffc0207342:	010cb423          	sd	a6,8(s9)
ffffffffc0207346:	8d66                	mv	s10,s9
ffffffffc0207348:	00fcb823          	sd	a5,16(s9)
ffffffffc020734c:	01983023          	sd	s9,0(a6)
ffffffffc0207350:	f52ff06f          	j	ffffffffc0206aa2 <stride_dequeue+0xb1e>
ffffffffc0207354:	0089b783          	ld	a5,8(s3)
ffffffffc0207358:	0109b803          	ld	a6,16(s3)
ffffffffc020735c:	f02a                	sd	a0,32(sp)
ffffffffc020735e:	ec3e                	sd	a5,24(sp)
ffffffffc0207360:	620808e3          	beqz	a6,ffffffffc0208190 <stride_dequeue+0x220c>
ffffffffc0207364:	8542                	mv	a0,a6
ffffffffc0207366:	85e6                	mv	a1,s9
ffffffffc0207368:	f442                	sd	a6,40(sp)
ffffffffc020736a:	9b9fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020736e:	7302                	ld	t1,32(sp)
ffffffffc0207370:	7822                	ld	a6,40(sp)
ffffffffc0207372:	28650de3          	beq	a0,t1,ffffffffc0207e0c <stride_dequeue+0x1e88>
ffffffffc0207376:	008cb783          	ld	a5,8(s9)
ffffffffc020737a:	010cb883          	ld	a7,16(s9)
ffffffffc020737e:	fc1a                	sd	t1,56(sp)
ffffffffc0207380:	f03e                	sd	a5,32(sp)
ffffffffc0207382:	04088463          	beqz	a7,ffffffffc02073ca <stride_dequeue+0x1446>
ffffffffc0207386:	85c6                	mv	a1,a7
ffffffffc0207388:	8542                	mv	a0,a6
ffffffffc020738a:	f846                	sd	a7,48(sp)
ffffffffc020738c:	f442                	sd	a6,40(sp)
ffffffffc020738e:	995fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207392:	7362                	ld	t1,56(sp)
ffffffffc0207394:	7822                	ld	a6,40(sp)
ffffffffc0207396:	78c2                	ld	a7,48(sp)
ffffffffc0207398:	00651463          	bne	a0,t1,ffffffffc02073a0 <stride_dequeue+0x141c>
ffffffffc020739c:	1cc0106f          	j	ffffffffc0208568 <stride_dequeue+0x25e4>
ffffffffc02073a0:	0088b303          	ld	t1,8(a7)
ffffffffc02073a4:	0108b583          	ld	a1,16(a7)
ffffffffc02073a8:	8542                	mv	a0,a6
ffffffffc02073aa:	f846                	sd	a7,48(sp)
ffffffffc02073ac:	f41a                	sd	t1,40(sp)
ffffffffc02073ae:	9d7fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02073b2:	78c2                	ld	a7,48(sp)
ffffffffc02073b4:	7322                	ld	t1,40(sp)
ffffffffc02073b6:	00a8b423          	sd	a0,8(a7)
ffffffffc02073ba:	0068b823          	sd	t1,16(a7)
ffffffffc02073be:	e119                	bnez	a0,ffffffffc02073c4 <stride_dequeue+0x1440>
ffffffffc02073c0:	2580106f          	j	ffffffffc0208618 <stride_dequeue+0x2694>
ffffffffc02073c4:	01153023          	sd	a7,0(a0)
ffffffffc02073c8:	8846                	mv	a6,a7
ffffffffc02073ca:	7782                	ld	a5,32(sp)
ffffffffc02073cc:	010cb423          	sd	a6,8(s9)
ffffffffc02073d0:	00fcb823          	sd	a5,16(s9)
ffffffffc02073d4:	01983023          	sd	s9,0(a6)
ffffffffc02073d8:	8866                	mv	a6,s9
ffffffffc02073da:	67e2                	ld	a5,24(sp)
ffffffffc02073dc:	0109b423          	sd	a6,8(s3)
ffffffffc02073e0:	8cce                	mv	s9,s3
ffffffffc02073e2:	00f9b823          	sd	a5,16(s3)
ffffffffc02073e6:	01383023          	sd	s3,0(a6)
ffffffffc02073ea:	df0ff06f          	j	ffffffffc02069da <stride_dequeue+0xa56>
ffffffffc02073ee:	0089b783          	ld	a5,8(s3)
ffffffffc02073f2:	0109b803          	ld	a6,16(s3)
ffffffffc02073f6:	f02a                	sd	a0,32(sp)
ffffffffc02073f8:	ec3e                	sd	a5,24(sp)
ffffffffc02073fa:	580808e3          	beqz	a6,ffffffffc020818a <stride_dequeue+0x2206>
ffffffffc02073fe:	8542                	mv	a0,a6
ffffffffc0207400:	85e6                	mv	a1,s9
ffffffffc0207402:	f442                	sd	a6,40(sp)
ffffffffc0207404:	91ffe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207408:	7302                	ld	t1,32(sp)
ffffffffc020740a:	7822                	ld	a6,40(sp)
ffffffffc020740c:	226507e3          	beq	a0,t1,ffffffffc0207e3a <stride_dequeue+0x1eb6>
ffffffffc0207410:	008cb783          	ld	a5,8(s9)
ffffffffc0207414:	010cb883          	ld	a7,16(s9)
ffffffffc0207418:	fc1a                	sd	t1,56(sp)
ffffffffc020741a:	f03e                	sd	a5,32(sp)
ffffffffc020741c:	04088463          	beqz	a7,ffffffffc0207464 <stride_dequeue+0x14e0>
ffffffffc0207420:	85c6                	mv	a1,a7
ffffffffc0207422:	8542                	mv	a0,a6
ffffffffc0207424:	f846                	sd	a7,48(sp)
ffffffffc0207426:	f442                	sd	a6,40(sp)
ffffffffc0207428:	8fbfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020742c:	7362                	ld	t1,56(sp)
ffffffffc020742e:	7822                	ld	a6,40(sp)
ffffffffc0207430:	78c2                	ld	a7,48(sp)
ffffffffc0207432:	00651463          	bne	a0,t1,ffffffffc020743a <stride_dequeue+0x14b6>
ffffffffc0207436:	0d80106f          	j	ffffffffc020850e <stride_dequeue+0x258a>
ffffffffc020743a:	0088b303          	ld	t1,8(a7)
ffffffffc020743e:	0108b583          	ld	a1,16(a7)
ffffffffc0207442:	8542                	mv	a0,a6
ffffffffc0207444:	f846                	sd	a7,48(sp)
ffffffffc0207446:	f41a                	sd	t1,40(sp)
ffffffffc0207448:	93dfe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020744c:	78c2                	ld	a7,48(sp)
ffffffffc020744e:	7322                	ld	t1,40(sp)
ffffffffc0207450:	00a8b423          	sd	a0,8(a7)
ffffffffc0207454:	0068b823          	sd	t1,16(a7)
ffffffffc0207458:	e119                	bnez	a0,ffffffffc020745e <stride_dequeue+0x14da>
ffffffffc020745a:	2060106f          	j	ffffffffc0208660 <stride_dequeue+0x26dc>
ffffffffc020745e:	01153023          	sd	a7,0(a0)
ffffffffc0207462:	8846                	mv	a6,a7
ffffffffc0207464:	7782                	ld	a5,32(sp)
ffffffffc0207466:	010cb423          	sd	a6,8(s9)
ffffffffc020746a:	00fcb823          	sd	a5,16(s9)
ffffffffc020746e:	01983023          	sd	s9,0(a6)
ffffffffc0207472:	8866                	mv	a6,s9
ffffffffc0207474:	67e2                	ld	a5,24(sp)
ffffffffc0207476:	0109b423          	sd	a6,8(s3)
ffffffffc020747a:	00f9b823          	sd	a5,16(s3)
ffffffffc020747e:	01383023          	sd	s3,0(a6)
ffffffffc0207482:	906ff06f          	j	ffffffffc0206588 <stride_dequeue+0x604>
ffffffffc0207486:	008cb783          	ld	a5,8(s9)
ffffffffc020748a:	010cbd03          	ld	s10,16(s9)
ffffffffc020748e:	f02a                	sd	a0,32(sp)
ffffffffc0207490:	ec3e                	sd	a5,24(sp)
ffffffffc0207492:	4e0d06e3          	beqz	s10,ffffffffc020817e <stride_dequeue+0x21fa>
ffffffffc0207496:	85b2                	mv	a1,a2
ffffffffc0207498:	856a                	mv	a0,s10
ffffffffc020749a:	f432                	sd	a2,40(sp)
ffffffffc020749c:	887fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02074a0:	7302                	ld	t1,32(sp)
ffffffffc02074a2:	7622                	ld	a2,40(sp)
ffffffffc02074a4:	10650ce3          	beq	a0,t1,ffffffffc0207dbc <stride_dequeue+0x1e38>
ffffffffc02074a8:	661c                	ld	a5,8(a2)
ffffffffc02074aa:	01063883          	ld	a7,16(a2)
ffffffffc02074ae:	fc1a                	sd	t1,56(sp)
ffffffffc02074b0:	f03e                	sd	a5,32(sp)
ffffffffc02074b2:	04088663          	beqz	a7,ffffffffc02074fe <stride_dequeue+0x157a>
ffffffffc02074b6:	85c6                	mv	a1,a7
ffffffffc02074b8:	856a                	mv	a0,s10
ffffffffc02074ba:	f832                	sd	a2,48(sp)
ffffffffc02074bc:	f446                	sd	a7,40(sp)
ffffffffc02074be:	865fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02074c2:	7362                	ld	t1,56(sp)
ffffffffc02074c4:	78a2                	ld	a7,40(sp)
ffffffffc02074c6:	7642                	ld	a2,48(sp)
ffffffffc02074c8:	00651463          	bne	a0,t1,ffffffffc02074d0 <stride_dequeue+0x154c>
ffffffffc02074cc:	0c80106f          	j	ffffffffc0208594 <stride_dequeue+0x2610>
ffffffffc02074d0:	0088b303          	ld	t1,8(a7)
ffffffffc02074d4:	0108b583          	ld	a1,16(a7)
ffffffffc02074d8:	856a                	mv	a0,s10
ffffffffc02074da:	fc32                	sd	a2,56(sp)
ffffffffc02074dc:	f846                	sd	a7,48(sp)
ffffffffc02074de:	f41a                	sd	t1,40(sp)
ffffffffc02074e0:	8a5fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02074e4:	78c2                	ld	a7,48(sp)
ffffffffc02074e6:	7322                	ld	t1,40(sp)
ffffffffc02074e8:	7662                	ld	a2,56(sp)
ffffffffc02074ea:	00a8b423          	sd	a0,8(a7)
ffffffffc02074ee:	0068b823          	sd	t1,16(a7)
ffffffffc02074f2:	e119                	bnez	a0,ffffffffc02074f8 <stride_dequeue+0x1574>
ffffffffc02074f4:	1c00106f          	j	ffffffffc02086b4 <stride_dequeue+0x2730>
ffffffffc02074f8:	01153023          	sd	a7,0(a0)
ffffffffc02074fc:	8d46                	mv	s10,a7
ffffffffc02074fe:	7782                	ld	a5,32(sp)
ffffffffc0207500:	01a63423          	sd	s10,8(a2)
ffffffffc0207504:	ea1c                	sd	a5,16(a2)
ffffffffc0207506:	00cd3023          	sd	a2,0(s10)
ffffffffc020750a:	8d32                	mv	s10,a2
ffffffffc020750c:	67e2                	ld	a5,24(sp)
ffffffffc020750e:	01acb423          	sd	s10,8(s9)
ffffffffc0207512:	00fcb823          	sd	a5,16(s9)
ffffffffc0207516:	019d3023          	sd	s9,0(s10)
ffffffffc020751a:	95cff06f          	j	ffffffffc0206676 <stride_dequeue+0x6f2>
ffffffffc020751e:	0088b783          	ld	a5,8(a7)
ffffffffc0207522:	0108b803          	ld	a6,16(a7)
ffffffffc0207526:	f42a                	sd	a0,40(sp)
ffffffffc0207528:	f03e                	sd	a5,32(sp)
ffffffffc020752a:	02080f63          	beqz	a6,ffffffffc0207568 <stride_dequeue+0x15e4>
ffffffffc020752e:	8542                	mv	a0,a6
ffffffffc0207530:	85d2                	mv	a1,s4
ffffffffc0207532:	fc46                	sd	a7,56(sp)
ffffffffc0207534:	f842                	sd	a6,48(sp)
ffffffffc0207536:	fecfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020753a:	7322                	ld	t1,40(sp)
ffffffffc020753c:	7842                	ld	a6,48(sp)
ffffffffc020753e:	78e2                	ld	a7,56(sp)
ffffffffc0207540:	046508e3          	beq	a0,t1,ffffffffc0207d90 <stride_dequeue+0x1e0c>
ffffffffc0207544:	008a3303          	ld	t1,8(s4)
ffffffffc0207548:	010a3583          	ld	a1,16(s4)
ffffffffc020754c:	8542                	mv	a0,a6
ffffffffc020754e:	f846                	sd	a7,48(sp)
ffffffffc0207550:	f41a                	sd	t1,40(sp)
ffffffffc0207552:	833fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207556:	7322                	ld	t1,40(sp)
ffffffffc0207558:	00aa3423          	sd	a0,8(s4)
ffffffffc020755c:	78c2                	ld	a7,48(sp)
ffffffffc020755e:	006a3823          	sd	t1,16(s4)
ffffffffc0207562:	c119                	beqz	a0,ffffffffc0207568 <stride_dequeue+0x15e4>
ffffffffc0207564:	01453023          	sd	s4,0(a0)
ffffffffc0207568:	7782                	ld	a5,32(sp)
ffffffffc020756a:	0148b423          	sd	s4,8(a7)
ffffffffc020756e:	00f8b823          	sd	a5,16(a7)
ffffffffc0207572:	011a3023          	sd	a7,0(s4)
ffffffffc0207576:	8a46                	mv	s4,a7
ffffffffc0207578:	e7cff06f          	j	ffffffffc0206bf4 <stride_dequeue+0xc70>
ffffffffc020757c:	008a3783          	ld	a5,8(s4)
ffffffffc0207580:	010a3883          	ld	a7,16(s4)
ffffffffc0207584:	f42a                	sd	a0,40(sp)
ffffffffc0207586:	f03e                	sd	a5,32(sp)
ffffffffc0207588:	02088f63          	beqz	a7,ffffffffc02075c6 <stride_dequeue+0x1642>
ffffffffc020758c:	85c2                	mv	a1,a6
ffffffffc020758e:	8546                	mv	a0,a7
ffffffffc0207590:	fc42                	sd	a6,56(sp)
ffffffffc0207592:	f846                	sd	a7,48(sp)
ffffffffc0207594:	f8efe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207598:	7322                	ld	t1,40(sp)
ffffffffc020759a:	78c2                	ld	a7,48(sp)
ffffffffc020759c:	7862                	ld	a6,56(sp)
ffffffffc020759e:	22650ce3          	beq	a0,t1,ffffffffc0207fd6 <stride_dequeue+0x2052>
ffffffffc02075a2:	00883303          	ld	t1,8(a6)
ffffffffc02075a6:	01083583          	ld	a1,16(a6)
ffffffffc02075aa:	8546                	mv	a0,a7
ffffffffc02075ac:	f842                	sd	a6,48(sp)
ffffffffc02075ae:	f41a                	sd	t1,40(sp)
ffffffffc02075b0:	fd4fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02075b4:	7842                	ld	a6,48(sp)
ffffffffc02075b6:	7322                	ld	t1,40(sp)
ffffffffc02075b8:	00a83423          	sd	a0,8(a6)
ffffffffc02075bc:	00683823          	sd	t1,16(a6)
ffffffffc02075c0:	c119                	beqz	a0,ffffffffc02075c6 <stride_dequeue+0x1642>
ffffffffc02075c2:	01053023          	sd	a6,0(a0)
ffffffffc02075c6:	7782                	ld	a5,32(sp)
ffffffffc02075c8:	010a3423          	sd	a6,8(s4)
ffffffffc02075cc:	00fa3823          	sd	a5,16(s4)
ffffffffc02075d0:	01483023          	sd	s4,0(a6)
ffffffffc02075d4:	960ff06f          	j	ffffffffc0206734 <stride_dequeue+0x7b0>
ffffffffc02075d8:	008a3703          	ld	a4,8(s4)
ffffffffc02075dc:	010a3883          	ld	a7,16(s4)
ffffffffc02075e0:	f42a                	sd	a0,40(sp)
ffffffffc02075e2:	f03a                	sd	a4,32(sp)
ffffffffc02075e4:	02088c63          	beqz	a7,ffffffffc020761c <stride_dequeue+0x1698>
ffffffffc02075e8:	85be                	mv	a1,a5
ffffffffc02075ea:	8546                	mv	a0,a7
ffffffffc02075ec:	fc3e                	sd	a5,56(sp)
ffffffffc02075ee:	f846                	sd	a7,48(sp)
ffffffffc02075f0:	f32fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02075f4:	7322                	ld	t1,40(sp)
ffffffffc02075f6:	78c2                	ld	a7,48(sp)
ffffffffc02075f8:	77e2                	ld	a5,56(sp)
ffffffffc02075fa:	1a6509e3          	beq	a0,t1,ffffffffc0207fac <stride_dequeue+0x2028>
ffffffffc02075fe:	0087b303          	ld	t1,8(a5)
ffffffffc0207602:	6b8c                	ld	a1,16(a5)
ffffffffc0207604:	8546                	mv	a0,a7
ffffffffc0207606:	f83e                	sd	a5,48(sp)
ffffffffc0207608:	f41a                	sd	t1,40(sp)
ffffffffc020760a:	f7afe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020760e:	77c2                	ld	a5,48(sp)
ffffffffc0207610:	7322                	ld	t1,40(sp)
ffffffffc0207612:	e788                	sd	a0,8(a5)
ffffffffc0207614:	0067b823          	sd	t1,16(a5)
ffffffffc0207618:	c111                	beqz	a0,ffffffffc020761c <stride_dequeue+0x1698>
ffffffffc020761a:	e11c                	sd	a5,0(a0)
ffffffffc020761c:	7702                	ld	a4,32(sp)
ffffffffc020761e:	00fa3423          	sd	a5,8(s4)
ffffffffc0207622:	00ea3823          	sd	a4,16(s4)
ffffffffc0207626:	0147b023          	sd	s4,0(a5)
ffffffffc020762a:	c05fe06f          	j	ffffffffc020622e <stride_dequeue+0x2aa>
ffffffffc020762e:	008c3703          	ld	a4,8(s8)
ffffffffc0207632:	010c3883          	ld	a7,16(s8)
ffffffffc0207636:	f42a                	sd	a0,40(sp)
ffffffffc0207638:	f03a                	sd	a4,32(sp)
ffffffffc020763a:	02088c63          	beqz	a7,ffffffffc0207672 <stride_dequeue+0x16ee>
ffffffffc020763e:	85be                	mv	a1,a5
ffffffffc0207640:	8546                	mv	a0,a7
ffffffffc0207642:	fc3e                	sd	a5,56(sp)
ffffffffc0207644:	f846                	sd	a7,48(sp)
ffffffffc0207646:	edcfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020764a:	7322                	ld	t1,40(sp)
ffffffffc020764c:	78c2                	ld	a7,48(sp)
ffffffffc020764e:	77e2                	ld	a5,56(sp)
ffffffffc0207650:	126509e3          	beq	a0,t1,ffffffffc0207f82 <stride_dequeue+0x1ffe>
ffffffffc0207654:	0087b303          	ld	t1,8(a5)
ffffffffc0207658:	6b8c                	ld	a1,16(a5)
ffffffffc020765a:	8546                	mv	a0,a7
ffffffffc020765c:	f83e                	sd	a5,48(sp)
ffffffffc020765e:	f41a                	sd	t1,40(sp)
ffffffffc0207660:	f24fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207664:	77c2                	ld	a5,48(sp)
ffffffffc0207666:	7322                	ld	t1,40(sp)
ffffffffc0207668:	e788                	sd	a0,8(a5)
ffffffffc020766a:	0067b823          	sd	t1,16(a5)
ffffffffc020766e:	c111                	beqz	a0,ffffffffc0207672 <stride_dequeue+0x16ee>
ffffffffc0207670:	e11c                	sd	a5,0(a0)
ffffffffc0207672:	7702                	ld	a4,32(sp)
ffffffffc0207674:	00fc3423          	sd	a5,8(s8)
ffffffffc0207678:	00ec3823          	sd	a4,16(s8)
ffffffffc020767c:	0187b023          	sd	s8,0(a5)
ffffffffc0207680:	cdffe06f          	j	ffffffffc020635e <stride_dequeue+0x3da>
ffffffffc0207684:	008a3783          	ld	a5,8(s4)
ffffffffc0207688:	010a3883          	ld	a7,16(s4)
ffffffffc020768c:	f42a                	sd	a0,40(sp)
ffffffffc020768e:	f03e                	sd	a5,32(sp)
ffffffffc0207690:	02088f63          	beqz	a7,ffffffffc02076ce <stride_dequeue+0x174a>
ffffffffc0207694:	85c2                	mv	a1,a6
ffffffffc0207696:	8546                	mv	a0,a7
ffffffffc0207698:	fc42                	sd	a6,56(sp)
ffffffffc020769a:	f846                	sd	a7,48(sp)
ffffffffc020769c:	e86fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02076a0:	7322                	ld	t1,40(sp)
ffffffffc02076a2:	78c2                	ld	a7,48(sp)
ffffffffc02076a4:	7862                	ld	a6,56(sp)
ffffffffc02076a6:	006507e3          	beq	a0,t1,ffffffffc0207eb4 <stride_dequeue+0x1f30>
ffffffffc02076aa:	00883303          	ld	t1,8(a6)
ffffffffc02076ae:	01083583          	ld	a1,16(a6)
ffffffffc02076b2:	8546                	mv	a0,a7
ffffffffc02076b4:	f842                	sd	a6,48(sp)
ffffffffc02076b6:	f41a                	sd	t1,40(sp)
ffffffffc02076b8:	eccfe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02076bc:	7842                	ld	a6,48(sp)
ffffffffc02076be:	7322                	ld	t1,40(sp)
ffffffffc02076c0:	00a83423          	sd	a0,8(a6)
ffffffffc02076c4:	00683823          	sd	t1,16(a6)
ffffffffc02076c8:	c119                	beqz	a0,ffffffffc02076ce <stride_dequeue+0x174a>
ffffffffc02076ca:	01053023          	sd	a6,0(a0)
ffffffffc02076ce:	7782                	ld	a5,32(sp)
ffffffffc02076d0:	010a3423          	sd	a6,8(s4)
ffffffffc02076d4:	00fa3823          	sd	a5,16(s4)
ffffffffc02076d8:	01483023          	sd	s4,0(a6)
ffffffffc02076dc:	930ff06f          	j	ffffffffc020680c <stride_dequeue+0x888>
ffffffffc02076e0:	0084b883          	ld	a7,8(s1)
ffffffffc02076e4:	6888                	ld	a0,16(s1)
ffffffffc02076e6:	859a                	mv	a1,t1
ffffffffc02076e8:	f446                	sd	a7,40(sp)
ffffffffc02076ea:	e9afe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02076ee:	78a2                	ld	a7,40(sp)
ffffffffc02076f0:	e488                	sd	a0,8(s1)
ffffffffc02076f2:	8326                	mv	t1,s1
ffffffffc02076f4:	0114b823          	sd	a7,16(s1)
ffffffffc02076f8:	77c2                	ld	a5,48(sp)
ffffffffc02076fa:	c119                	beqz	a0,ffffffffc0207700 <stride_dequeue+0x177c>
ffffffffc02076fc:	9abfe06f          	j	ffffffffc02060a6 <stride_dequeue+0x122>
ffffffffc0207700:	9abfe06f          	j	ffffffffc02060aa <stride_dequeue+0x126>
ffffffffc0207704:	8326                	mv	t1,s1
ffffffffc0207706:	9a5fe06f          	j	ffffffffc02060aa <stride_dequeue+0x126>
ffffffffc020770a:	008cb703          	ld	a4,8(s9)
ffffffffc020770e:	010cb783          	ld	a5,16(s9)
ffffffffc0207712:	f42a                	sd	a0,40(sp)
ffffffffc0207714:	ec3a                	sd	a4,24(sp)
ffffffffc0207716:	cb95                	beqz	a5,ffffffffc020774a <stride_dequeue+0x17c6>
ffffffffc0207718:	853e                	mv	a0,a5
ffffffffc020771a:	85ea                	mv	a1,s10
ffffffffc020771c:	f03e                	sd	a5,32(sp)
ffffffffc020771e:	e04fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207722:	7822                	ld	a6,40(sp)
ffffffffc0207724:	7782                	ld	a5,32(sp)
ffffffffc0207726:	310507e3          	beq	a0,a6,ffffffffc0208234 <stride_dequeue+0x22b0>
ffffffffc020772a:	008d3803          	ld	a6,8(s10)
ffffffffc020772e:	010d3583          	ld	a1,16(s10)
ffffffffc0207732:	853e                	mv	a0,a5
ffffffffc0207734:	f042                	sd	a6,32(sp)
ffffffffc0207736:	e4efe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020773a:	7802                	ld	a6,32(sp)
ffffffffc020773c:	00ad3423          	sd	a0,8(s10)
ffffffffc0207740:	010d3823          	sd	a6,16(s10)
ffffffffc0207744:	c119                	beqz	a0,ffffffffc020774a <stride_dequeue+0x17c6>
ffffffffc0207746:	01a53023          	sd	s10,0(a0)
ffffffffc020774a:	67e2                	ld	a5,24(sp)
ffffffffc020774c:	01acb423          	sd	s10,8(s9)
ffffffffc0207750:	00fcb823          	sd	a5,16(s9)
ffffffffc0207754:	019d3023          	sd	s9,0(s10)
ffffffffc0207758:	8d66                	mv	s10,s9
ffffffffc020775a:	d5eff06f          	j	ffffffffc0206cb8 <stride_dequeue+0xd34>
ffffffffc020775e:	008cb703          	ld	a4,8(s9)
ffffffffc0207762:	010cb783          	ld	a5,16(s9)
ffffffffc0207766:	f42a                	sd	a0,40(sp)
ffffffffc0207768:	ec3a                	sd	a4,24(sp)
ffffffffc020776a:	cb95                	beqz	a5,ffffffffc020779e <stride_dequeue+0x181a>
ffffffffc020776c:	853e                	mv	a0,a5
ffffffffc020776e:	85ea                	mv	a1,s10
ffffffffc0207770:	f03e                	sd	a5,32(sp)
ffffffffc0207772:	db0fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207776:	7822                	ld	a6,40(sp)
ffffffffc0207778:	7782                	ld	a5,32(sp)
ffffffffc020777a:	23050de3          	beq	a0,a6,ffffffffc02081b4 <stride_dequeue+0x2230>
ffffffffc020777e:	008d3803          	ld	a6,8(s10)
ffffffffc0207782:	010d3583          	ld	a1,16(s10)
ffffffffc0207786:	853e                	mv	a0,a5
ffffffffc0207788:	f042                	sd	a6,32(sp)
ffffffffc020778a:	dfafe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020778e:	7802                	ld	a6,32(sp)
ffffffffc0207790:	00ad3423          	sd	a0,8(s10)
ffffffffc0207794:	010d3823          	sd	a6,16(s10)
ffffffffc0207798:	c119                	beqz	a0,ffffffffc020779e <stride_dequeue+0x181a>
ffffffffc020779a:	01a53023          	sd	s10,0(a0)
ffffffffc020779e:	67e2                	ld	a5,24(sp)
ffffffffc02077a0:	01acb423          	sd	s10,8(s9)
ffffffffc02077a4:	00fcb823          	sd	a5,16(s9)
ffffffffc02077a8:	019d3023          	sd	s9,0(s10)
ffffffffc02077ac:	8d66                	mv	s10,s9
ffffffffc02077ae:	958ff06f          	j	ffffffffc0206906 <stride_dequeue+0x982>
ffffffffc02077b2:	008d3703          	ld	a4,8(s10)
ffffffffc02077b6:	010d3783          	ld	a5,16(s10)
ffffffffc02077ba:	f42a                	sd	a0,40(sp)
ffffffffc02077bc:	ec3a                	sd	a4,24(sp)
ffffffffc02077be:	cb95                	beqz	a5,ffffffffc02077f2 <stride_dequeue+0x186e>
ffffffffc02077c0:	853e                	mv	a0,a5
ffffffffc02077c2:	85ce                	mv	a1,s3
ffffffffc02077c4:	f03e                	sd	a5,32(sp)
ffffffffc02077c6:	d5cfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02077ca:	7822                	ld	a6,40(sp)
ffffffffc02077cc:	7782                	ld	a5,32(sp)
ffffffffc02077ce:	23050de3          	beq	a0,a6,ffffffffc0208208 <stride_dequeue+0x2284>
ffffffffc02077d2:	0089b803          	ld	a6,8(s3)
ffffffffc02077d6:	0109b583          	ld	a1,16(s3)
ffffffffc02077da:	853e                	mv	a0,a5
ffffffffc02077dc:	f042                	sd	a6,32(sp)
ffffffffc02077de:	da6fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02077e2:	7802                	ld	a6,32(sp)
ffffffffc02077e4:	00a9b423          	sd	a0,8(s3)
ffffffffc02077e8:	0109b823          	sd	a6,16(s3)
ffffffffc02077ec:	c119                	beqz	a0,ffffffffc02077f2 <stride_dequeue+0x186e>
ffffffffc02077ee:	01353023          	sd	s3,0(a0)
ffffffffc02077f2:	67e2                	ld	a5,24(sp)
ffffffffc02077f4:	013d3423          	sd	s3,8(s10)
ffffffffc02077f8:	00fd3823          	sd	a5,16(s10)
ffffffffc02077fc:	01a9b023          	sd	s10,0(s3)
ffffffffc0207800:	89ea                	mv	s3,s10
ffffffffc0207802:	d7cff06f          	j	ffffffffc0206d7e <stride_dequeue+0xdfa>
ffffffffc0207806:	008cb703          	ld	a4,8(s9)
ffffffffc020780a:	010cb783          	ld	a5,16(s9)
ffffffffc020780e:	f42a                	sd	a0,40(sp)
ffffffffc0207810:	ec3a                	sd	a4,24(sp)
ffffffffc0207812:	cb95                	beqz	a5,ffffffffc0207846 <stride_dequeue+0x18c2>
ffffffffc0207814:	853e                	mv	a0,a5
ffffffffc0207816:	85ea                	mv	a1,s10
ffffffffc0207818:	f03e                	sd	a5,32(sp)
ffffffffc020781a:	d08fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020781e:	7822                	ld	a6,40(sp)
ffffffffc0207820:	7782                	ld	a5,32(sp)
ffffffffc0207822:	250505e3          	beq	a0,a6,ffffffffc020826c <stride_dequeue+0x22e8>
ffffffffc0207826:	008d3803          	ld	a6,8(s10)
ffffffffc020782a:	010d3583          	ld	a1,16(s10)
ffffffffc020782e:	853e                	mv	a0,a5
ffffffffc0207830:	f042                	sd	a6,32(sp)
ffffffffc0207832:	d52fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207836:	7802                	ld	a6,32(sp)
ffffffffc0207838:	00ad3423          	sd	a0,8(s10)
ffffffffc020783c:	010d3823          	sd	a6,16(s10)
ffffffffc0207840:	c119                	beqz	a0,ffffffffc0207846 <stride_dequeue+0x18c2>
ffffffffc0207842:	01a53023          	sd	s10,0(a0)
ffffffffc0207846:	67e2                	ld	a5,24(sp)
ffffffffc0207848:	01acb423          	sd	s10,8(s9)
ffffffffc020784c:	00fcb823          	sd	a5,16(s9)
ffffffffc0207850:	019d3023          	sd	s9,0(s10)
ffffffffc0207854:	8d66                	mv	s10,s9
ffffffffc0207856:	deeff06f          	j	ffffffffc0206e44 <stride_dequeue+0xec0>
ffffffffc020785a:	8346                	mv	t1,a7
ffffffffc020785c:	b8aff06f          	j	ffffffffc0206be6 <stride_dequeue+0xc62>
ffffffffc0207860:	008cb783          	ld	a5,8(s9)
ffffffffc0207864:	010cb883          	ld	a7,16(s9)
ffffffffc0207868:	fc2a                	sd	a0,56(sp)
ffffffffc020786a:	f03e                	sd	a5,32(sp)
ffffffffc020786c:	02088f63          	beqz	a7,ffffffffc02078aa <stride_dequeue+0x1926>
ffffffffc0207870:	85c2                	mv	a1,a6
ffffffffc0207872:	8546                	mv	a0,a7
ffffffffc0207874:	f842                	sd	a6,48(sp)
ffffffffc0207876:	f446                	sd	a7,40(sp)
ffffffffc0207878:	caafe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc020787c:	7362                	ld	t1,56(sp)
ffffffffc020787e:	78a2                	ld	a7,40(sp)
ffffffffc0207880:	7842                	ld	a6,48(sp)
ffffffffc0207882:	326505e3          	beq	a0,t1,ffffffffc02083ac <stride_dequeue+0x2428>
ffffffffc0207886:	00883303          	ld	t1,8(a6)
ffffffffc020788a:	01083583          	ld	a1,16(a6)
ffffffffc020788e:	8546                	mv	a0,a7
ffffffffc0207890:	f842                	sd	a6,48(sp)
ffffffffc0207892:	f41a                	sd	t1,40(sp)
ffffffffc0207894:	cf0fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207898:	7842                	ld	a6,48(sp)
ffffffffc020789a:	7322                	ld	t1,40(sp)
ffffffffc020789c:	00a83423          	sd	a0,8(a6)
ffffffffc02078a0:	00683823          	sd	t1,16(a6)
ffffffffc02078a4:	c119                	beqz	a0,ffffffffc02078aa <stride_dequeue+0x1926>
ffffffffc02078a6:	01053023          	sd	a6,0(a0)
ffffffffc02078aa:	7782                	ld	a5,32(sp)
ffffffffc02078ac:	010cb423          	sd	a6,8(s9)
ffffffffc02078b0:	00fcb823          	sd	a5,16(s9)
ffffffffc02078b4:	01983023          	sd	s9,0(a6)
ffffffffc02078b8:	8866                	mv	a6,s9
ffffffffc02078ba:	a9eff06f          	j	ffffffffc0206b58 <stride_dequeue+0xbd4>
ffffffffc02078be:	0088b783          	ld	a5,8(a7)
ffffffffc02078c2:	0108b803          	ld	a6,16(a7)
ffffffffc02078c6:	fc2a                	sd	a0,56(sp)
ffffffffc02078c8:	f03e                	sd	a5,32(sp)
ffffffffc02078ca:	02080f63          	beqz	a6,ffffffffc0207908 <stride_dequeue+0x1984>
ffffffffc02078ce:	8542                	mv	a0,a6
ffffffffc02078d0:	85e6                	mv	a1,s9
ffffffffc02078d2:	f846                	sd	a7,48(sp)
ffffffffc02078d4:	f442                	sd	a6,40(sp)
ffffffffc02078d6:	c4cfe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02078da:	7362                	ld	t1,56(sp)
ffffffffc02078dc:	7822                	ld	a6,40(sp)
ffffffffc02078de:	78c2                	ld	a7,48(sp)
ffffffffc02078e0:	44650de3          	beq	a0,t1,ffffffffc020853a <stride_dequeue+0x25b6>
ffffffffc02078e4:	008cb303          	ld	t1,8(s9)
ffffffffc02078e8:	010cb583          	ld	a1,16(s9)
ffffffffc02078ec:	8542                	mv	a0,a6
ffffffffc02078ee:	f846                	sd	a7,48(sp)
ffffffffc02078f0:	f41a                	sd	t1,40(sp)
ffffffffc02078f2:	c92fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02078f6:	7322                	ld	t1,40(sp)
ffffffffc02078f8:	00acb423          	sd	a0,8(s9)
ffffffffc02078fc:	78c2                	ld	a7,48(sp)
ffffffffc02078fe:	006cb823          	sd	t1,16(s9)
ffffffffc0207902:	c119                	beqz	a0,ffffffffc0207908 <stride_dequeue+0x1984>
ffffffffc0207904:	01953023          	sd	s9,0(a0)
ffffffffc0207908:	7782                	ld	a5,32(sp)
ffffffffc020790a:	0198b423          	sd	s9,8(a7)
ffffffffc020790e:	00f8b823          	sd	a5,16(a7)
ffffffffc0207912:	011cb023          	sd	a7,0(s9)
ffffffffc0207916:	8cc6                	mv	s9,a7
ffffffffc0207918:	f80ff06f          	j	ffffffffc0207098 <stride_dequeue+0x1114>
ffffffffc020791c:	0089b783          	ld	a5,8(s3)
ffffffffc0207920:	0109b883          	ld	a7,16(s3)
ffffffffc0207924:	fc2a                	sd	a0,56(sp)
ffffffffc0207926:	f03e                	sd	a5,32(sp)
ffffffffc0207928:	02088f63          	beqz	a7,ffffffffc0207966 <stride_dequeue+0x19e2>
ffffffffc020792c:	85c2                	mv	a1,a6
ffffffffc020792e:	8546                	mv	a0,a7
ffffffffc0207930:	f842                	sd	a6,48(sp)
ffffffffc0207932:	f446                	sd	a7,40(sp)
ffffffffc0207934:	beefe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207938:	7362                	ld	t1,56(sp)
ffffffffc020793a:	78a2                	ld	a7,40(sp)
ffffffffc020793c:	7842                	ld	a6,48(sp)
ffffffffc020793e:	486500e3          	beq	a0,t1,ffffffffc02085be <stride_dequeue+0x263a>
ffffffffc0207942:	00883303          	ld	t1,8(a6)
ffffffffc0207946:	01083583          	ld	a1,16(a6)
ffffffffc020794a:	8546                	mv	a0,a7
ffffffffc020794c:	f842                	sd	a6,48(sp)
ffffffffc020794e:	f41a                	sd	t1,40(sp)
ffffffffc0207950:	c34fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207954:	7842                	ld	a6,48(sp)
ffffffffc0207956:	7322                	ld	t1,40(sp)
ffffffffc0207958:	00a83423          	sd	a0,8(a6)
ffffffffc020795c:	00683823          	sd	t1,16(a6)
ffffffffc0207960:	c119                	beqz	a0,ffffffffc0207966 <stride_dequeue+0x19e2>
ffffffffc0207962:	01053023          	sd	a6,0(a0)
ffffffffc0207966:	7782                	ld	a5,32(sp)
ffffffffc0207968:	0109b423          	sd	a6,8(s3)
ffffffffc020796c:	00f9b823          	sd	a5,16(s3)
ffffffffc0207970:	01383023          	sd	s3,0(a6)
ffffffffc0207974:	884e                	mv	a6,s3
ffffffffc0207976:	856ff06f          	j	ffffffffc02069cc <stride_dequeue+0xa48>
ffffffffc020797a:	0088b783          	ld	a5,8(a7)
ffffffffc020797e:	0108b803          	ld	a6,16(a7)
ffffffffc0207982:	fc2a                	sd	a0,56(sp)
ffffffffc0207984:	f03e                	sd	a5,32(sp)
ffffffffc0207986:	02080f63          	beqz	a6,ffffffffc02079c4 <stride_dequeue+0x1a40>
ffffffffc020798a:	8542                	mv	a0,a6
ffffffffc020798c:	85e6                	mv	a1,s9
ffffffffc020798e:	f846                	sd	a7,48(sp)
ffffffffc0207990:	f442                	sd	a6,40(sp)
ffffffffc0207992:	b90fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207996:	7362                	ld	t1,56(sp)
ffffffffc0207998:	7822                	ld	a6,40(sp)
ffffffffc020799a:	78c2                	ld	a7,48(sp)
ffffffffc020799c:	1e6500e3          	beq	a0,t1,ffffffffc020837c <stride_dequeue+0x23f8>
ffffffffc02079a0:	008cb303          	ld	t1,8(s9)
ffffffffc02079a4:	010cb583          	ld	a1,16(s9)
ffffffffc02079a8:	8542                	mv	a0,a6
ffffffffc02079aa:	f846                	sd	a7,48(sp)
ffffffffc02079ac:	f41a                	sd	t1,40(sp)
ffffffffc02079ae:	bd6fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02079b2:	7322                	ld	t1,40(sp)
ffffffffc02079b4:	00acb423          	sd	a0,8(s9)
ffffffffc02079b8:	78c2                	ld	a7,48(sp)
ffffffffc02079ba:	006cb823          	sd	t1,16(s9)
ffffffffc02079be:	c119                	beqz	a0,ffffffffc02079c4 <stride_dequeue+0x1a40>
ffffffffc02079c0:	01953023          	sd	s9,0(a0)
ffffffffc02079c4:	7782                	ld	a5,32(sp)
ffffffffc02079c6:	0198b423          	sd	s9,8(a7)
ffffffffc02079ca:	00f8b823          	sd	a5,16(a7)
ffffffffc02079ce:	011cb023          	sd	a7,0(s9)
ffffffffc02079d2:	8cc6                	mv	s9,a7
ffffffffc02079d4:	e2eff06f          	j	ffffffffc0207002 <stride_dequeue+0x107e>
ffffffffc02079d8:	008cb783          	ld	a5,8(s9)
ffffffffc02079dc:	010cb883          	ld	a7,16(s9)
ffffffffc02079e0:	fc2a                	sd	a0,56(sp)
ffffffffc02079e2:	f03e                	sd	a5,32(sp)
ffffffffc02079e4:	02088f63          	beqz	a7,ffffffffc0207a22 <stride_dequeue+0x1a9e>
ffffffffc02079e8:	85c2                	mv	a1,a6
ffffffffc02079ea:	8546                	mv	a0,a7
ffffffffc02079ec:	f842                	sd	a6,48(sp)
ffffffffc02079ee:	f446                	sd	a7,40(sp)
ffffffffc02079f0:	b32fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc02079f4:	7362                	ld	t1,56(sp)
ffffffffc02079f6:	78a2                	ld	a7,40(sp)
ffffffffc02079f8:	7842                	ld	a6,48(sp)
ffffffffc02079fa:	3e6507e3          	beq	a0,t1,ffffffffc02085e8 <stride_dequeue+0x2664>
ffffffffc02079fe:	00883303          	ld	t1,8(a6)
ffffffffc0207a02:	01083583          	ld	a1,16(a6)
ffffffffc0207a06:	8546                	mv	a0,a7
ffffffffc0207a08:	f842                	sd	a6,48(sp)
ffffffffc0207a0a:	f41a                	sd	t1,40(sp)
ffffffffc0207a0c:	b78fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207a10:	7842                	ld	a6,48(sp)
ffffffffc0207a12:	7322                	ld	t1,40(sp)
ffffffffc0207a14:	00a83423          	sd	a0,8(a6)
ffffffffc0207a18:	00683823          	sd	t1,16(a6)
ffffffffc0207a1c:	c119                	beqz	a0,ffffffffc0207a22 <stride_dequeue+0x1a9e>
ffffffffc0207a1e:	01053023          	sd	a6,0(a0)
ffffffffc0207a22:	7782                	ld	a5,32(sp)
ffffffffc0207a24:	010cb423          	sd	a6,8(s9)
ffffffffc0207a28:	00fcb823          	sd	a5,16(s9)
ffffffffc0207a2c:	01983023          	sd	s9,0(a6)
ffffffffc0207a30:	8866                	mv	a6,s9
ffffffffc0207a32:	862ff06f          	j	ffffffffc0206a94 <stride_dequeue+0xb10>
ffffffffc0207a36:	0089b783          	ld	a5,8(s3)
ffffffffc0207a3a:	0109b883          	ld	a7,16(s3)
ffffffffc0207a3e:	fc2a                	sd	a0,56(sp)
ffffffffc0207a40:	f03e                	sd	a5,32(sp)
ffffffffc0207a42:	02088f63          	beqz	a7,ffffffffc0207a80 <stride_dequeue+0x1afc>
ffffffffc0207a46:	85c2                	mv	a1,a6
ffffffffc0207a48:	8546                	mv	a0,a7
ffffffffc0207a4a:	f842                	sd	a6,48(sp)
ffffffffc0207a4c:	f446                	sd	a7,40(sp)
ffffffffc0207a4e:	ad4fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207a52:	7362                	ld	t1,56(sp)
ffffffffc0207a54:	78a2                	ld	a7,40(sp)
ffffffffc0207a56:	7842                	ld	a6,48(sp)
ffffffffc0207a58:	186500e3          	beq	a0,t1,ffffffffc02083d8 <stride_dequeue+0x2454>
ffffffffc0207a5c:	00883303          	ld	t1,8(a6)
ffffffffc0207a60:	01083583          	ld	a1,16(a6)
ffffffffc0207a64:	8546                	mv	a0,a7
ffffffffc0207a66:	f842                	sd	a6,48(sp)
ffffffffc0207a68:	f41a                	sd	t1,40(sp)
ffffffffc0207a6a:	b1afe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207a6e:	7842                	ld	a6,48(sp)
ffffffffc0207a70:	7322                	ld	t1,40(sp)
ffffffffc0207a72:	00a83423          	sd	a0,8(a6)
ffffffffc0207a76:	00683823          	sd	t1,16(a6)
ffffffffc0207a7a:	c119                	beqz	a0,ffffffffc0207a80 <stride_dequeue+0x1afc>
ffffffffc0207a7c:	01053023          	sd	a6,0(a0)
ffffffffc0207a80:	7782                	ld	a5,32(sp)
ffffffffc0207a82:	0109b423          	sd	a6,8(s3)
ffffffffc0207a86:	00f9b823          	sd	a5,16(s3)
ffffffffc0207a8a:	01383023          	sd	s3,0(a6)
ffffffffc0207a8e:	884e                	mv	a6,s3
ffffffffc0207a90:	ae9fe06f          	j	ffffffffc0206578 <stride_dequeue+0x5f4>
ffffffffc0207a94:	8352                	mv	t1,s4
ffffffffc0207a96:	f8afe06f          	j	ffffffffc0206220 <stride_dequeue+0x29c>
ffffffffc0207a9a:	8362                	mv	t1,s8
ffffffffc0207a9c:	8b5fe06f          	j	ffffffffc0206350 <stride_dequeue+0x3cc>
ffffffffc0207aa0:	8d66                	mv	s10,s9
ffffffffc0207aa2:	e65fe06f          	j	ffffffffc0206906 <stride_dequeue+0x982>
ffffffffc0207aa6:	008cb783          	ld	a5,8(s9)
ffffffffc0207aaa:	010cb883          	ld	a7,16(s9)
ffffffffc0207aae:	fc2a                	sd	a0,56(sp)
ffffffffc0207ab0:	f03e                	sd	a5,32(sp)
ffffffffc0207ab2:	02088f63          	beqz	a7,ffffffffc0207af0 <stride_dequeue+0x1b6c>
ffffffffc0207ab6:	8546                	mv	a0,a7
ffffffffc0207ab8:	85ea                	mv	a1,s10
ffffffffc0207aba:	f832                	sd	a2,48(sp)
ffffffffc0207abc:	f446                	sd	a7,40(sp)
ffffffffc0207abe:	a64fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207ac2:	7362                	ld	t1,56(sp)
ffffffffc0207ac4:	78a2                	ld	a7,40(sp)
ffffffffc0207ac6:	7642                	ld	a2,48(sp)
ffffffffc0207ac8:	04650ce3          	beq	a0,t1,ffffffffc0208320 <stride_dequeue+0x239c>
ffffffffc0207acc:	008d3303          	ld	t1,8(s10)
ffffffffc0207ad0:	010d3583          	ld	a1,16(s10)
ffffffffc0207ad4:	8546                	mv	a0,a7
ffffffffc0207ad6:	f832                	sd	a2,48(sp)
ffffffffc0207ad8:	f41a                	sd	t1,40(sp)
ffffffffc0207ada:	aaafe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207ade:	7322                	ld	t1,40(sp)
ffffffffc0207ae0:	00ad3423          	sd	a0,8(s10)
ffffffffc0207ae4:	7642                	ld	a2,48(sp)
ffffffffc0207ae6:	006d3823          	sd	t1,16(s10)
ffffffffc0207aea:	c119                	beqz	a0,ffffffffc0207af0 <stride_dequeue+0x1b6c>
ffffffffc0207aec:	01a53023          	sd	s10,0(a0)
ffffffffc0207af0:	7782                	ld	a5,32(sp)
ffffffffc0207af2:	01acb423          	sd	s10,8(s9)
ffffffffc0207af6:	00fcb823          	sd	a5,16(s9)
ffffffffc0207afa:	019d3023          	sd	s9,0(s10)
ffffffffc0207afe:	8d66                	mv	s10,s9
ffffffffc0207b00:	b69fe06f          	j	ffffffffc0206668 <stride_dequeue+0x6e4>
ffffffffc0207b04:	008c3703          	ld	a4,8(s8)
ffffffffc0207b08:	010c3883          	ld	a7,16(s8)
ffffffffc0207b0c:	fc2a                	sd	a0,56(sp)
ffffffffc0207b0e:	f03a                	sd	a4,32(sp)
ffffffffc0207b10:	02088c63          	beqz	a7,ffffffffc0207b48 <stride_dequeue+0x1bc4>
ffffffffc0207b14:	85be                	mv	a1,a5
ffffffffc0207b16:	8546                	mv	a0,a7
ffffffffc0207b18:	f83e                	sd	a5,48(sp)
ffffffffc0207b1a:	f446                	sd	a7,40(sp)
ffffffffc0207b1c:	a06fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207b20:	7362                	ld	t1,56(sp)
ffffffffc0207b22:	78a2                	ld	a7,40(sp)
ffffffffc0207b24:	77c2                	ld	a5,48(sp)
ffffffffc0207b26:	78650f63          	beq	a0,t1,ffffffffc02082c4 <stride_dequeue+0x2340>
ffffffffc0207b2a:	0087b303          	ld	t1,8(a5)
ffffffffc0207b2e:	6b8c                	ld	a1,16(a5)
ffffffffc0207b30:	8546                	mv	a0,a7
ffffffffc0207b32:	f83e                	sd	a5,48(sp)
ffffffffc0207b34:	f41a                	sd	t1,40(sp)
ffffffffc0207b36:	a4efe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207b3a:	77c2                	ld	a5,48(sp)
ffffffffc0207b3c:	7322                	ld	t1,40(sp)
ffffffffc0207b3e:	e788                	sd	a0,8(a5)
ffffffffc0207b40:	0067b823          	sd	t1,16(a5)
ffffffffc0207b44:	c111                	beqz	a0,ffffffffc0207b48 <stride_dequeue+0x1bc4>
ffffffffc0207b46:	e11c                	sd	a5,0(a0)
ffffffffc0207b48:	7702                	ld	a4,32(sp)
ffffffffc0207b4a:	00fc3423          	sd	a5,8(s8)
ffffffffc0207b4e:	00ec3823          	sd	a4,16(s8)
ffffffffc0207b52:	0187b023          	sd	s8,0(a5)
ffffffffc0207b56:	87e2                	mv	a5,s8
ffffffffc0207b58:	91ffe06f          	j	ffffffffc0206476 <stride_dequeue+0x4f2>
ffffffffc0207b5c:	0088b783          	ld	a5,8(a7)
ffffffffc0207b60:	0108b803          	ld	a6,16(a7)
ffffffffc0207b64:	fc2a                	sd	a0,56(sp)
ffffffffc0207b66:	f03e                	sd	a5,32(sp)
ffffffffc0207b68:	02080f63          	beqz	a6,ffffffffc0207ba6 <stride_dequeue+0x1c22>
ffffffffc0207b6c:	8542                	mv	a0,a6
ffffffffc0207b6e:	85ce                	mv	a1,s3
ffffffffc0207b70:	f846                	sd	a7,48(sp)
ffffffffc0207b72:	f442                	sd	a6,40(sp)
ffffffffc0207b74:	9aefe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207b78:	7362                	ld	t1,56(sp)
ffffffffc0207b7a:	7822                	ld	a6,40(sp)
ffffffffc0207b7c:	78c2                	ld	a7,48(sp)
ffffffffc0207b7e:	0e6500e3          	beq	a0,t1,ffffffffc020845e <stride_dequeue+0x24da>
ffffffffc0207b82:	0089b303          	ld	t1,8(s3)
ffffffffc0207b86:	0109b583          	ld	a1,16(s3)
ffffffffc0207b8a:	8542                	mv	a0,a6
ffffffffc0207b8c:	f846                	sd	a7,48(sp)
ffffffffc0207b8e:	f41a                	sd	t1,40(sp)
ffffffffc0207b90:	9f4fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207b94:	7322                	ld	t1,40(sp)
ffffffffc0207b96:	00a9b423          	sd	a0,8(s3)
ffffffffc0207b9a:	78c2                	ld	a7,48(sp)
ffffffffc0207b9c:	0069b823          	sd	t1,16(s3)
ffffffffc0207ba0:	c119                	beqz	a0,ffffffffc0207ba6 <stride_dequeue+0x1c22>
ffffffffc0207ba2:	01353023          	sd	s3,0(a0)
ffffffffc0207ba6:	7782                	ld	a5,32(sp)
ffffffffc0207ba8:	0138b423          	sd	s3,8(a7)
ffffffffc0207bac:	00f8b823          	sd	a5,16(a7)
ffffffffc0207bb0:	0119b023          	sd	a7,0(s3)
ffffffffc0207bb4:	89c6                	mv	s3,a7
ffffffffc0207bb6:	b24ff06f          	j	ffffffffc0206eda <stride_dequeue+0xf56>
ffffffffc0207bba:	8352                	mv	t1,s4
ffffffffc0207bbc:	b69fe06f          	j	ffffffffc0206724 <stride_dequeue+0x7a0>
ffffffffc0207bc0:	8352                	mv	t1,s4
ffffffffc0207bc2:	c3bfe06f          	j	ffffffffc02067fc <stride_dequeue+0x878>
ffffffffc0207bc6:	0088b783          	ld	a5,8(a7)
ffffffffc0207bca:	0108b803          	ld	a6,16(a7)
ffffffffc0207bce:	fc2a                	sd	a0,56(sp)
ffffffffc0207bd0:	f03e                	sd	a5,32(sp)
ffffffffc0207bd2:	02080f63          	beqz	a6,ffffffffc0207c10 <stride_dequeue+0x1c8c>
ffffffffc0207bd6:	8542                	mv	a0,a6
ffffffffc0207bd8:	85e6                	mv	a1,s9
ffffffffc0207bda:	f846                	sd	a7,48(sp)
ffffffffc0207bdc:	f442                	sd	a6,40(sp)
ffffffffc0207bde:	944fe0ef          	jal	ra,ffffffffc0205d22 <proc_stride_comp_f>
ffffffffc0207be2:	7362                	ld	t1,56(sp)
ffffffffc0207be4:	7822                	ld	a6,40(sp)
ffffffffc0207be6:	78c2                	ld	a7,48(sp)
ffffffffc0207be8:	046503e3          	beq	a0,t1,ffffffffc020842e <stride_dequeue+0x24aa>
ffffffffc0207bec:	008cb303          	ld	t1,8(s9)
ffffffffc0207bf0:	010cb583          	ld	a1,16(s9)
ffffffffc0207bf4:	8542                	mv	a0,a6
ffffffffc0207bf6:	f846                	sd	a7,48(sp)
ffffffffc0207bf8:	f41a                	sd	t1,40(sp)
ffffffffc0207bfa:	98afe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207bfe:	7322                	ld	t1,40(sp)
ffffffffc0207c00:	00acb423          	sd	a0,8(s9)
ffffffffc0207c04:	78c2                	ld	a7,48(sp)
ffffffffc0207c06:	006cb823          	sd	t1,16(s9)
ffffffffc0207c0a:	c119                	beqz	a0,ffffffffc0207c10 <stride_dequeue+0x1c8c>
ffffffffc0207c0c:	01953023          	sd	s9,0(a0)
ffffffffc0207c10:	7782                	ld	a5,32(sp)
ffffffffc0207c12:	0198b423          	sd	s9,8(a7)
ffffffffc0207c16:	00f8b823          	sd	a5,16(a7)
ffffffffc0207c1a:	011cb023          	sd	a7,0(s9)
ffffffffc0207c1e:	8cc6                	mv	s9,a7
ffffffffc0207c20:	b50ff06f          	j	ffffffffc0206f70 <stride_dequeue+0xfec>
ffffffffc0207c24:	008a3883          	ld	a7,8(s4)
ffffffffc0207c28:	010a3503          	ld	a0,16(s4)
ffffffffc0207c2c:	859a                	mv	a1,t1
ffffffffc0207c2e:	f446                	sd	a7,40(sp)
ffffffffc0207c30:	954fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207c34:	78a2                	ld	a7,40(sp)
ffffffffc0207c36:	00aa3423          	sd	a0,8(s4)
ffffffffc0207c3a:	77c2                	ld	a5,48(sp)
ffffffffc0207c3c:	011a3823          	sd	a7,16(s4)
ffffffffc0207c40:	e4050ae3          	beqz	a0,ffffffffc0207a94 <stride_dequeue+0x1b10>
ffffffffc0207c44:	01453023          	sd	s4,0(a0)
ffffffffc0207c48:	8352                	mv	t1,s4
ffffffffc0207c4a:	dd6fe06f          	j	ffffffffc0206220 <stride_dequeue+0x29c>
ffffffffc0207c4e:	008c3883          	ld	a7,8(s8)
ffffffffc0207c52:	010c3503          	ld	a0,16(s8)
ffffffffc0207c56:	859a                	mv	a1,t1
ffffffffc0207c58:	f446                	sd	a7,40(sp)
ffffffffc0207c5a:	92afe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207c5e:	78a2                	ld	a7,40(sp)
ffffffffc0207c60:	00ac3423          	sd	a0,8(s8)
ffffffffc0207c64:	77c2                	ld	a5,48(sp)
ffffffffc0207c66:	011c3823          	sd	a7,16(s8)
ffffffffc0207c6a:	e20508e3          	beqz	a0,ffffffffc0207a9a <stride_dequeue+0x1b16>
ffffffffc0207c6e:	01853023          	sd	s8,0(a0)
ffffffffc0207c72:	8362                	mv	t1,s8
ffffffffc0207c74:	edcfe06f          	j	ffffffffc0206350 <stride_dequeue+0x3cc>
ffffffffc0207c78:	008a3883          	ld	a7,8(s4)
ffffffffc0207c7c:	010a3503          	ld	a0,16(s4)
ffffffffc0207c80:	859a                	mv	a1,t1
ffffffffc0207c82:	f446                	sd	a7,40(sp)
ffffffffc0207c84:	900fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207c88:	78a2                	ld	a7,40(sp)
ffffffffc0207c8a:	00aa3423          	sd	a0,8(s4)
ffffffffc0207c8e:	7842                	ld	a6,48(sp)
ffffffffc0207c90:	011a3823          	sd	a7,16(s4)
ffffffffc0207c94:	d11d                	beqz	a0,ffffffffc0207bba <stride_dequeue+0x1c36>
ffffffffc0207c96:	01453023          	sd	s4,0(a0)
ffffffffc0207c9a:	8352                	mv	t1,s4
ffffffffc0207c9c:	a89fe06f          	j	ffffffffc0206724 <stride_dequeue+0x7a0>
ffffffffc0207ca0:	0088b303          	ld	t1,8(a7)
ffffffffc0207ca4:	0108b503          	ld	a0,16(a7)
ffffffffc0207ca8:	85be                	mv	a1,a5
ffffffffc0207caa:	f41a                	sd	t1,40(sp)
ffffffffc0207cac:	8d8fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207cb0:	78c2                	ld	a7,48(sp)
ffffffffc0207cb2:	7322                	ld	t1,40(sp)
ffffffffc0207cb4:	00a8b423          	sd	a0,8(a7)
ffffffffc0207cb8:	0068b823          	sd	t1,16(a7)
ffffffffc0207cbc:	5c050b63          	beqz	a0,ffffffffc0208292 <stride_dequeue+0x230e>
ffffffffc0207cc0:	01153023          	sd	a7,0(a0)
ffffffffc0207cc4:	87c6                	mv	a5,a7
ffffffffc0207cc6:	c28ff06f          	j	ffffffffc02070ee <stride_dequeue+0x116a>
ffffffffc0207cca:	0088b803          	ld	a6,8(a7)
ffffffffc0207cce:	0108b503          	ld	a0,16(a7)
ffffffffc0207cd2:	859a                	mv	a1,t1
ffffffffc0207cd4:	f442                	sd	a6,40(sp)
ffffffffc0207cd6:	8aefe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207cda:	78c2                	ld	a7,48(sp)
ffffffffc0207cdc:	7822                	ld	a6,40(sp)
ffffffffc0207cde:	00a8b423          	sd	a0,8(a7)
ffffffffc0207ce2:	0108b823          	sd	a6,16(a7)
ffffffffc0207ce6:	b6050ae3          	beqz	a0,ffffffffc020785a <stride_dequeue+0x18d6>
ffffffffc0207cea:	01153023          	sd	a7,0(a0)
ffffffffc0207cee:	8346                	mv	t1,a7
ffffffffc0207cf0:	ef7fe06f          	j	ffffffffc0206be6 <stride_dequeue+0xc62>
ffffffffc0207cf4:	008a3883          	ld	a7,8(s4)
ffffffffc0207cf8:	010a3503          	ld	a0,16(s4)
ffffffffc0207cfc:	859a                	mv	a1,t1
ffffffffc0207cfe:	f446                	sd	a7,40(sp)
ffffffffc0207d00:	884fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207d04:	78a2                	ld	a7,40(sp)
ffffffffc0207d06:	00aa3423          	sd	a0,8(s4)
ffffffffc0207d0a:	7842                	ld	a6,48(sp)
ffffffffc0207d0c:	011a3823          	sd	a7,16(s4)
ffffffffc0207d10:	ea0508e3          	beqz	a0,ffffffffc0207bc0 <stride_dequeue+0x1c3c>
ffffffffc0207d14:	01453023          	sd	s4,0(a0)
ffffffffc0207d18:	8352                	mv	t1,s4
ffffffffc0207d1a:	ae3fe06f          	j	ffffffffc02067fc <stride_dequeue+0x878>
ffffffffc0207d1e:	87e2                	mv	a5,s8
ffffffffc0207d20:	f56fe06f          	j	ffffffffc0206476 <stride_dequeue+0x4f2>
ffffffffc0207d24:	884e                	mv	a6,s3
ffffffffc0207d26:	853fe06f          	j	ffffffffc0206578 <stride_dequeue+0x5f4>
ffffffffc0207d2a:	884e                	mv	a6,s3
ffffffffc0207d2c:	ca1fe06f          	j	ffffffffc02069cc <stride_dequeue+0xa48>
ffffffffc0207d30:	8866                	mv	a6,s9
ffffffffc0207d32:	d63fe06f          	j	ffffffffc0206a94 <stride_dequeue+0xb10>
ffffffffc0207d36:	8866                	mv	a6,s9
ffffffffc0207d38:	e21fe06f          	j	ffffffffc0206b58 <stride_dequeue+0xbd4>
ffffffffc0207d3c:	8d66                	mv	s10,s9
ffffffffc0207d3e:	92bfe06f          	j	ffffffffc0206668 <stride_dequeue+0x6e4>
ffffffffc0207d42:	008d3783          	ld	a5,8(s10)
ffffffffc0207d46:	010d3503          	ld	a0,16(s10)
ffffffffc0207d4a:	85a2                	mv	a1,s0
ffffffffc0207d4c:	ec3e                	sd	a5,24(sp)
ffffffffc0207d4e:	836fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207d52:	67e2                	ld	a5,24(sp)
ffffffffc0207d54:	00ad3423          	sd	a0,8(s10)
ffffffffc0207d58:	00fd3823          	sd	a5,16(s10)
ffffffffc0207d5c:	c0050563          	beqz	a0,ffffffffc0207166 <stride_dequeue+0x11e2>
ffffffffc0207d60:	01a53023          	sd	s10,0(a0)
ffffffffc0207d64:	c02ff06f          	j	ffffffffc0207166 <stride_dequeue+0x11e2>
ffffffffc0207d68:	0088b803          	ld	a6,8(a7)
ffffffffc0207d6c:	0108b503          	ld	a0,16(a7)
ffffffffc0207d70:	859a                	mv	a1,t1
ffffffffc0207d72:	f442                	sd	a6,40(sp)
ffffffffc0207d74:	810fe0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207d78:	78c2                	ld	a7,48(sp)
ffffffffc0207d7a:	7822                	ld	a6,40(sp)
ffffffffc0207d7c:	00a8b423          	sd	a0,8(a7)
ffffffffc0207d80:	0108b823          	sd	a6,16(a7)
ffffffffc0207d84:	a6050863          	beqz	a0,ffffffffc0206ff4 <stride_dequeue+0x1070>
ffffffffc0207d88:	01153023          	sd	a7,0(a0)
ffffffffc0207d8c:	a68ff06f          	j	ffffffffc0206ff4 <stride_dequeue+0x1070>
ffffffffc0207d90:	00883303          	ld	t1,8(a6)
ffffffffc0207d94:	01083503          	ld	a0,16(a6)
ffffffffc0207d98:	85d2                	mv	a1,s4
ffffffffc0207d9a:	f41a                	sd	t1,40(sp)
ffffffffc0207d9c:	fe9fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207da0:	7842                	ld	a6,48(sp)
ffffffffc0207da2:	7322                	ld	t1,40(sp)
ffffffffc0207da4:	78e2                	ld	a7,56(sp)
ffffffffc0207da6:	00a83423          	sd	a0,8(a6)
ffffffffc0207daa:	00683823          	sd	t1,16(a6)
ffffffffc0207dae:	0a0500e3          	beqz	a0,ffffffffc020864e <stride_dequeue+0x26ca>
ffffffffc0207db2:	01053023          	sd	a6,0(a0)
ffffffffc0207db6:	8a42                	mv	s4,a6
ffffffffc0207db8:	fb0ff06f          	j	ffffffffc0207568 <stride_dequeue+0x15e4>
ffffffffc0207dbc:	008d3783          	ld	a5,8(s10)
ffffffffc0207dc0:	010d3503          	ld	a0,16(s10)
ffffffffc0207dc4:	85b2                	mv	a1,a2
ffffffffc0207dc6:	f03e                	sd	a5,32(sp)
ffffffffc0207dc8:	fbdfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207dcc:	7782                	ld	a5,32(sp)
ffffffffc0207dce:	00ad3423          	sd	a0,8(s10)
ffffffffc0207dd2:	00fd3823          	sd	a5,16(s10)
ffffffffc0207dd6:	f2050b63          	beqz	a0,ffffffffc020750c <stride_dequeue+0x1588>
ffffffffc0207dda:	01a53023          	sd	s10,0(a0)
ffffffffc0207dde:	f2eff06f          	j	ffffffffc020750c <stride_dequeue+0x1588>
ffffffffc0207de2:	0089b883          	ld	a7,8(s3)
ffffffffc0207de6:	0109b503          	ld	a0,16(s3)
ffffffffc0207dea:	859a                	mv	a1,t1
ffffffffc0207dec:	f446                	sd	a7,40(sp)
ffffffffc0207dee:	f97fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207df2:	78a2                	ld	a7,40(sp)
ffffffffc0207df4:	00a9b423          	sd	a0,8(s3)
ffffffffc0207df8:	7842                	ld	a6,48(sp)
ffffffffc0207dfa:	0119b823          	sd	a7,16(s3)
ffffffffc0207dfe:	e119                	bnez	a0,ffffffffc0207e04 <stride_dequeue+0x1e80>
ffffffffc0207e00:	f6afe06f          	j	ffffffffc020656a <stride_dequeue+0x5e6>
ffffffffc0207e04:	01353023          	sd	s3,0(a0)
ffffffffc0207e08:	f62fe06f          	j	ffffffffc020656a <stride_dequeue+0x5e6>
ffffffffc0207e0c:	00883783          	ld	a5,8(a6)
ffffffffc0207e10:	01083503          	ld	a0,16(a6)
ffffffffc0207e14:	85e6                	mv	a1,s9
ffffffffc0207e16:	f03e                	sd	a5,32(sp)
ffffffffc0207e18:	f6dfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207e1c:	7822                	ld	a6,40(sp)
ffffffffc0207e1e:	7782                	ld	a5,32(sp)
ffffffffc0207e20:	00a83423          	sd	a0,8(a6)
ffffffffc0207e24:	00f83823          	sd	a5,16(a6)
ffffffffc0207e28:	da050963          	beqz	a0,ffffffffc02073da <stride_dequeue+0x1456>
ffffffffc0207e2c:	01053023          	sd	a6,0(a0)
ffffffffc0207e30:	daaff06f          	j	ffffffffc02073da <stride_dequeue+0x1456>
ffffffffc0207e34:	8d22                	mv	s10,s0
ffffffffc0207e36:	b30ff06f          	j	ffffffffc0207166 <stride_dequeue+0x11e2>
ffffffffc0207e3a:	00883783          	ld	a5,8(a6)
ffffffffc0207e3e:	01083503          	ld	a0,16(a6)
ffffffffc0207e42:	85e6                	mv	a1,s9
ffffffffc0207e44:	f03e                	sd	a5,32(sp)
ffffffffc0207e46:	f3ffd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207e4a:	7822                	ld	a6,40(sp)
ffffffffc0207e4c:	7782                	ld	a5,32(sp)
ffffffffc0207e4e:	00a83423          	sd	a0,8(a6)
ffffffffc0207e52:	00f83823          	sd	a5,16(a6)
ffffffffc0207e56:	e0050f63          	beqz	a0,ffffffffc0207474 <stride_dequeue+0x14f0>
ffffffffc0207e5a:	01053023          	sd	a6,0(a0)
ffffffffc0207e5e:	e16ff06f          	j	ffffffffc0207474 <stride_dequeue+0x14f0>
ffffffffc0207e62:	00883783          	ld	a5,8(a6)
ffffffffc0207e66:	01083503          	ld	a0,16(a6)
ffffffffc0207e6a:	85e6                	mv	a1,s9
ffffffffc0207e6c:	f03e                	sd	a5,32(sp)
ffffffffc0207e6e:	f17fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207e72:	7822                	ld	a6,40(sp)
ffffffffc0207e74:	7782                	ld	a5,32(sp)
ffffffffc0207e76:	00a83423          	sd	a0,8(a6)
ffffffffc0207e7a:	00f83823          	sd	a5,16(a6)
ffffffffc0207e7e:	c2050363          	beqz	a0,ffffffffc02072a4 <stride_dequeue+0x1320>
ffffffffc0207e82:	01053023          	sd	a6,0(a0)
ffffffffc0207e86:	c1eff06f          	j	ffffffffc02072a4 <stride_dequeue+0x1320>
ffffffffc0207e8a:	008cb883          	ld	a7,8(s9)
ffffffffc0207e8e:	010cb503          	ld	a0,16(s9)
ffffffffc0207e92:	859a                	mv	a1,t1
ffffffffc0207e94:	f446                	sd	a7,40(sp)
ffffffffc0207e96:	eeffd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207e9a:	78a2                	ld	a7,40(sp)
ffffffffc0207e9c:	00acb423          	sd	a0,8(s9)
ffffffffc0207ea0:	7842                	ld	a6,48(sp)
ffffffffc0207ea2:	011cb823          	sd	a7,16(s9)
ffffffffc0207ea6:	e119                	bnez	a0,ffffffffc0207eac <stride_dequeue+0x1f28>
ffffffffc0207ea8:	bdffe06f          	j	ffffffffc0206a86 <stride_dequeue+0xb02>
ffffffffc0207eac:	01953023          	sd	s9,0(a0)
ffffffffc0207eb0:	bd7fe06f          	j	ffffffffc0206a86 <stride_dequeue+0xb02>
ffffffffc0207eb4:	0088b303          	ld	t1,8(a7)
ffffffffc0207eb8:	0108b503          	ld	a0,16(a7)
ffffffffc0207ebc:	85c2                	mv	a1,a6
ffffffffc0207ebe:	f41a                	sd	t1,40(sp)
ffffffffc0207ec0:	ec5fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207ec4:	78c2                	ld	a7,48(sp)
ffffffffc0207ec6:	7322                	ld	t1,40(sp)
ffffffffc0207ec8:	00a8b423          	sd	a0,8(a7)
ffffffffc0207ecc:	0068b823          	sd	t1,16(a7)
ffffffffc0207ed0:	7c050c63          	beqz	a0,ffffffffc02086a8 <stride_dequeue+0x2724>
ffffffffc0207ed4:	01153023          	sd	a7,0(a0)
ffffffffc0207ed8:	8846                	mv	a6,a7
ffffffffc0207eda:	ff4ff06f          	j	ffffffffc02076ce <stride_dequeue+0x174a>
ffffffffc0207ede:	008cb783          	ld	a5,8(s9)
ffffffffc0207ee2:	010cb503          	ld	a0,16(s9)
ffffffffc0207ee6:	85c2                	mv	a1,a6
ffffffffc0207ee8:	f03e                	sd	a5,32(sp)
ffffffffc0207eea:	e9bfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207eee:	7782                	ld	a5,32(sp)
ffffffffc0207ef0:	00acb423          	sd	a0,8(s9)
ffffffffc0207ef4:	00fcb823          	sd	a5,16(s9)
ffffffffc0207ef8:	e119                	bnez	a0,ffffffffc0207efe <stride_dequeue+0x1f7a>
ffffffffc0207efa:	db1fe06f          	j	ffffffffc0206caa <stride_dequeue+0xd26>
ffffffffc0207efe:	01953023          	sd	s9,0(a0)
ffffffffc0207f02:	da9fe06f          	j	ffffffffc0206caa <stride_dequeue+0xd26>
ffffffffc0207f06:	008cb883          	ld	a7,8(s9)
ffffffffc0207f0a:	010cb503          	ld	a0,16(s9)
ffffffffc0207f0e:	859a                	mv	a1,t1
ffffffffc0207f10:	f446                	sd	a7,40(sp)
ffffffffc0207f12:	e73fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207f16:	78a2                	ld	a7,40(sp)
ffffffffc0207f18:	00acb423          	sd	a0,8(s9)
ffffffffc0207f1c:	7842                	ld	a6,48(sp)
ffffffffc0207f1e:	011cb823          	sd	a7,16(s9)
ffffffffc0207f22:	e119                	bnez	a0,ffffffffc0207f28 <stride_dequeue+0x1fa4>
ffffffffc0207f24:	c27fe06f          	j	ffffffffc0206b4a <stride_dequeue+0xbc6>
ffffffffc0207f28:	01953023          	sd	s9,0(a0)
ffffffffc0207f2c:	c1ffe06f          	j	ffffffffc0206b4a <stride_dequeue+0xbc6>
ffffffffc0207f30:	008cb783          	ld	a5,8(s9)
ffffffffc0207f34:	010cb503          	ld	a0,16(s9)
ffffffffc0207f38:	85ba                	mv	a1,a4
ffffffffc0207f3a:	f03e                	sd	a5,32(sp)
ffffffffc0207f3c:	e49fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207f40:	7782                	ld	a5,32(sp)
ffffffffc0207f42:	00acb423          	sd	a0,8(s9)
ffffffffc0207f46:	00fcb823          	sd	a5,16(s9)
ffffffffc0207f4a:	e119                	bnez	a0,ffffffffc0207f50 <stride_dequeue+0x1fcc>
ffffffffc0207f4c:	9adfe06f          	j	ffffffffc02068f8 <stride_dequeue+0x974>
ffffffffc0207f50:	01953023          	sd	s9,0(a0)
ffffffffc0207f54:	9a5fe06f          	j	ffffffffc02068f8 <stride_dequeue+0x974>
ffffffffc0207f58:	0089b883          	ld	a7,8(s3)
ffffffffc0207f5c:	0109b503          	ld	a0,16(s3)
ffffffffc0207f60:	859a                	mv	a1,t1
ffffffffc0207f62:	f446                	sd	a7,40(sp)
ffffffffc0207f64:	e21fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207f68:	78a2                	ld	a7,40(sp)
ffffffffc0207f6a:	00a9b423          	sd	a0,8(s3)
ffffffffc0207f6e:	7842                	ld	a6,48(sp)
ffffffffc0207f70:	0119b823          	sd	a7,16(s3)
ffffffffc0207f74:	e119                	bnez	a0,ffffffffc0207f7a <stride_dequeue+0x1ff6>
ffffffffc0207f76:	a49fe06f          	j	ffffffffc02069be <stride_dequeue+0xa3a>
ffffffffc0207f7a:	01353023          	sd	s3,0(a0)
ffffffffc0207f7e:	a41fe06f          	j	ffffffffc02069be <stride_dequeue+0xa3a>
ffffffffc0207f82:	0088b303          	ld	t1,8(a7)
ffffffffc0207f86:	0108b503          	ld	a0,16(a7)
ffffffffc0207f8a:	85be                	mv	a1,a5
ffffffffc0207f8c:	f41a                	sd	t1,40(sp)
ffffffffc0207f8e:	df7fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207f92:	78c2                	ld	a7,48(sp)
ffffffffc0207f94:	7322                	ld	t1,40(sp)
ffffffffc0207f96:	00a8b423          	sd	a0,8(a7)
ffffffffc0207f9a:	0068b823          	sd	t1,16(a7)
ffffffffc0207f9e:	6e050963          	beqz	a0,ffffffffc0208690 <stride_dequeue+0x270c>
ffffffffc0207fa2:	01153023          	sd	a7,0(a0)
ffffffffc0207fa6:	87c6                	mv	a5,a7
ffffffffc0207fa8:	ecaff06f          	j	ffffffffc0207672 <stride_dequeue+0x16ee>
ffffffffc0207fac:	0088b303          	ld	t1,8(a7)
ffffffffc0207fb0:	0108b503          	ld	a0,16(a7)
ffffffffc0207fb4:	85be                	mv	a1,a5
ffffffffc0207fb6:	f41a                	sd	t1,40(sp)
ffffffffc0207fb8:	dcdfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207fbc:	78c2                	ld	a7,48(sp)
ffffffffc0207fbe:	7322                	ld	t1,40(sp)
ffffffffc0207fc0:	00a8b423          	sd	a0,8(a7)
ffffffffc0207fc4:	0068b823          	sd	t1,16(a7)
ffffffffc0207fc8:	6a050b63          	beqz	a0,ffffffffc020867e <stride_dequeue+0x26fa>
ffffffffc0207fcc:	01153023          	sd	a7,0(a0)
ffffffffc0207fd0:	87c6                	mv	a5,a7
ffffffffc0207fd2:	e4aff06f          	j	ffffffffc020761c <stride_dequeue+0x1698>
ffffffffc0207fd6:	0088b303          	ld	t1,8(a7)
ffffffffc0207fda:	0108b503          	ld	a0,16(a7)
ffffffffc0207fde:	85c2                	mv	a1,a6
ffffffffc0207fe0:	f41a                	sd	t1,40(sp)
ffffffffc0207fe2:	da3fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0207fe6:	78c2                	ld	a7,48(sp)
ffffffffc0207fe8:	7322                	ld	t1,40(sp)
ffffffffc0207fea:	00a8b423          	sd	a0,8(a7)
ffffffffc0207fee:	0068b823          	sd	t1,16(a7)
ffffffffc0207ff2:	68050963          	beqz	a0,ffffffffc0208684 <stride_dequeue+0x2700>
ffffffffc0207ff6:	01153023          	sd	a7,0(a0)
ffffffffc0207ffa:	8846                	mv	a6,a7
ffffffffc0207ffc:	dcaff06f          	j	ffffffffc02075c6 <stride_dequeue+0x1642>
ffffffffc0208000:	008cb783          	ld	a5,8(s9)
ffffffffc0208004:	010cb503          	ld	a0,16(s9)
ffffffffc0208008:	85c2                	mv	a1,a6
ffffffffc020800a:	f03e                	sd	a5,32(sp)
ffffffffc020800c:	d79fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208010:	7782                	ld	a5,32(sp)
ffffffffc0208012:	00acb423          	sd	a0,8(s9)
ffffffffc0208016:	00fcb823          	sd	a5,16(s9)
ffffffffc020801a:	e119                	bnez	a0,ffffffffc0208020 <stride_dequeue+0x209c>
ffffffffc020801c:	e1bfe06f          	j	ffffffffc0206e36 <stride_dequeue+0xeb2>
ffffffffc0208020:	01953023          	sd	s9,0(a0)
ffffffffc0208024:	e13fe06f          	j	ffffffffc0206e36 <stride_dequeue+0xeb2>
ffffffffc0208028:	00883783          	ld	a5,8(a6)
ffffffffc020802c:	01083503          	ld	a0,16(a6)
ffffffffc0208030:	85ea                	mv	a1,s10
ffffffffc0208032:	f03e                	sd	a5,32(sp)
ffffffffc0208034:	d51fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208038:	7822                	ld	a6,40(sp)
ffffffffc020803a:	7782                	ld	a5,32(sp)
ffffffffc020803c:	00a83423          	sd	a0,8(a6)
ffffffffc0208040:	00f83823          	sd	a5,16(a6)
ffffffffc0208044:	ae050e63          	beqz	a0,ffffffffc0207340 <stride_dequeue+0x13bc>
ffffffffc0208048:	01053023          	sd	a6,0(a0)
ffffffffc020804c:	af4ff06f          	j	ffffffffc0207340 <stride_dequeue+0x13bc>
ffffffffc0208050:	008c3883          	ld	a7,8(s8)
ffffffffc0208054:	010c3503          	ld	a0,16(s8)
ffffffffc0208058:	859a                	mv	a1,t1
ffffffffc020805a:	f446                	sd	a7,40(sp)
ffffffffc020805c:	d29fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208060:	78a2                	ld	a7,40(sp)
ffffffffc0208062:	00ac3423          	sd	a0,8(s8)
ffffffffc0208066:	77c2                	ld	a5,48(sp)
ffffffffc0208068:	011c3823          	sd	a7,16(s8)
ffffffffc020806c:	e119                	bnez	a0,ffffffffc0208072 <stride_dequeue+0x20ee>
ffffffffc020806e:	bfcfe06f          	j	ffffffffc020646a <stride_dequeue+0x4e6>
ffffffffc0208072:	01853023          	sd	s8,0(a0)
ffffffffc0208076:	bf4fe06f          	j	ffffffffc020646a <stride_dequeue+0x4e6>
ffffffffc020807a:	00883783          	ld	a5,8(a6)
ffffffffc020807e:	01083503          	ld	a0,16(a6)
ffffffffc0208082:	85ea                	mv	a1,s10
ffffffffc0208084:	f03e                	sd	a5,32(sp)
ffffffffc0208086:	cfffd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020808a:	7822                	ld	a6,40(sp)
ffffffffc020808c:	7782                	ld	a5,32(sp)
ffffffffc020808e:	00a83423          	sd	a0,8(a6)
ffffffffc0208092:	00f83823          	sd	a5,16(a6)
ffffffffc0208096:	96050963          	beqz	a0,ffffffffc0207208 <stride_dequeue+0x1284>
ffffffffc020809a:	01053023          	sd	a6,0(a0)
ffffffffc020809e:	96aff06f          	j	ffffffffc0207208 <stride_dequeue+0x1284>
ffffffffc02080a2:	008d3783          	ld	a5,8(s10)
ffffffffc02080a6:	010d3503          	ld	a0,16(s10)
ffffffffc02080aa:	85c2                	mv	a1,a6
ffffffffc02080ac:	f03e                	sd	a5,32(sp)
ffffffffc02080ae:	cd7fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02080b2:	7782                	ld	a5,32(sp)
ffffffffc02080b4:	00ad3423          	sd	a0,8(s10)
ffffffffc02080b8:	00fd3823          	sd	a5,16(s10)
ffffffffc02080bc:	e119                	bnez	a0,ffffffffc02080c2 <stride_dequeue+0x213e>
ffffffffc02080be:	cb3fe06f          	j	ffffffffc0206d70 <stride_dequeue+0xdec>
ffffffffc02080c2:	01a53023          	sd	s10,0(a0)
ffffffffc02080c6:	cabfe06f          	j	ffffffffc0206d70 <stride_dequeue+0xdec>
ffffffffc02080ca:	0088b803          	ld	a6,8(a7)
ffffffffc02080ce:	0108b503          	ld	a0,16(a7)
ffffffffc02080d2:	859a                	mv	a1,t1
ffffffffc02080d4:	f442                	sd	a6,40(sp)
ffffffffc02080d6:	caffd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02080da:	78c2                	ld	a7,48(sp)
ffffffffc02080dc:	7822                	ld	a6,40(sp)
ffffffffc02080de:	00a8b423          	sd	a0,8(a7)
ffffffffc02080e2:	0108b823          	sd	a6,16(a7)
ffffffffc02080e6:	e119                	bnez	a0,ffffffffc02080ec <stride_dequeue+0x2168>
ffffffffc02080e8:	de5fe06f          	j	ffffffffc0206ecc <stride_dequeue+0xf48>
ffffffffc02080ec:	01153023          	sd	a7,0(a0)
ffffffffc02080f0:	dddfe06f          	j	ffffffffc0206ecc <stride_dequeue+0xf48>
ffffffffc02080f4:	0088b803          	ld	a6,8(a7)
ffffffffc02080f8:	0108b503          	ld	a0,16(a7)
ffffffffc02080fc:	859a                	mv	a1,t1
ffffffffc02080fe:	f442                	sd	a6,40(sp)
ffffffffc0208100:	c85fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208104:	78c2                	ld	a7,48(sp)
ffffffffc0208106:	7822                	ld	a6,40(sp)
ffffffffc0208108:	00a8b423          	sd	a0,8(a7)
ffffffffc020810c:	0108b823          	sd	a6,16(a7)
ffffffffc0208110:	e119                	bnez	a0,ffffffffc0208116 <stride_dequeue+0x2192>
ffffffffc0208112:	e51fe06f          	j	ffffffffc0206f62 <stride_dequeue+0xfde>
ffffffffc0208116:	01153023          	sd	a7,0(a0)
ffffffffc020811a:	e49fe06f          	j	ffffffffc0206f62 <stride_dequeue+0xfde>
ffffffffc020811e:	008cb883          	ld	a7,8(s9)
ffffffffc0208122:	010cb503          	ld	a0,16(s9)
ffffffffc0208126:	859a                	mv	a1,t1
ffffffffc0208128:	f446                	sd	a7,40(sp)
ffffffffc020812a:	c5bfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020812e:	78a2                	ld	a7,40(sp)
ffffffffc0208130:	00acb423          	sd	a0,8(s9)
ffffffffc0208134:	7642                	ld	a2,48(sp)
ffffffffc0208136:	011cb823          	sd	a7,16(s9)
ffffffffc020813a:	e119                	bnez	a0,ffffffffc0208140 <stride_dequeue+0x21bc>
ffffffffc020813c:	d1efe06f          	j	ffffffffc020665a <stride_dequeue+0x6d6>
ffffffffc0208140:	01953023          	sd	s9,0(a0)
ffffffffc0208144:	d16fe06f          	j	ffffffffc020665a <stride_dequeue+0x6d6>
ffffffffc0208148:	0088b803          	ld	a6,8(a7)
ffffffffc020814c:	0108b503          	ld	a0,16(a7)
ffffffffc0208150:	859a                	mv	a1,t1
ffffffffc0208152:	f442                	sd	a6,40(sp)
ffffffffc0208154:	c31fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208158:	78c2                	ld	a7,48(sp)
ffffffffc020815a:	7822                	ld	a6,40(sp)
ffffffffc020815c:	00a8b423          	sd	a0,8(a7)
ffffffffc0208160:	0108b823          	sd	a6,16(a7)
ffffffffc0208164:	e119                	bnez	a0,ffffffffc020816a <stride_dequeue+0x21e6>
ffffffffc0208166:	f25fe06f          	j	ffffffffc020708a <stride_dequeue+0x1106>
ffffffffc020816a:	01153023          	sd	a7,0(a0)
ffffffffc020816e:	f1dfe06f          	j	ffffffffc020708a <stride_dequeue+0x1106>
ffffffffc0208172:	886a                	mv	a6,s10
ffffffffc0208174:	894ff06f          	j	ffffffffc0207208 <stride_dequeue+0x1284>
ffffffffc0208178:	886a                	mv	a6,s10
ffffffffc020817a:	9c6ff06f          	j	ffffffffc0207340 <stride_dequeue+0x13bc>
ffffffffc020817e:	8d32                	mv	s10,a2
ffffffffc0208180:	b8cff06f          	j	ffffffffc020750c <stride_dequeue+0x1588>
ffffffffc0208184:	8866                	mv	a6,s9
ffffffffc0208186:	91eff06f          	j	ffffffffc02072a4 <stride_dequeue+0x1320>
ffffffffc020818a:	8866                	mv	a6,s9
ffffffffc020818c:	ae8ff06f          	j	ffffffffc0207474 <stride_dequeue+0x14f0>
ffffffffc0208190:	8866                	mv	a6,s9
ffffffffc0208192:	a48ff06f          	j	ffffffffc02073da <stride_dequeue+0x1456>
ffffffffc0208196:	889a                	mv	a7,t1
ffffffffc0208198:	d35fe06f          	j	ffffffffc0206ecc <stride_dequeue+0xf48>
ffffffffc020819c:	889a                	mv	a7,t1
ffffffffc020819e:	dc5fe06f          	j	ffffffffc0206f62 <stride_dequeue+0xfde>
ffffffffc02081a2:	899a                	mv	s3,t1
ffffffffc02081a4:	81bfe06f          	j	ffffffffc02069be <stride_dequeue+0xa3a>
ffffffffc02081a8:	8c9a                	mv	s9,t1
ffffffffc02081aa:	cb0fe06f          	j	ffffffffc020665a <stride_dequeue+0x6d6>
ffffffffc02081ae:	889a                	mv	a7,t1
ffffffffc02081b0:	edbfe06f          	j	ffffffffc020708a <stride_dequeue+0x1106>
ffffffffc02081b4:	0087b803          	ld	a6,8(a5)
ffffffffc02081b8:	6b88                	ld	a0,16(a5)
ffffffffc02081ba:	85ea                	mv	a1,s10
ffffffffc02081bc:	f43e                	sd	a5,40(sp)
ffffffffc02081be:	f042                	sd	a6,32(sp)
ffffffffc02081c0:	bc5fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02081c4:	77a2                	ld	a5,40(sp)
ffffffffc02081c6:	7802                	ld	a6,32(sp)
ffffffffc02081c8:	e788                	sd	a0,8(a5)
ffffffffc02081ca:	0107b823          	sd	a6,16(a5)
ffffffffc02081ce:	4c050463          	beqz	a0,ffffffffc0208696 <stride_dequeue+0x2712>
ffffffffc02081d2:	e11c                	sd	a5,0(a0)
ffffffffc02081d4:	8d3e                	mv	s10,a5
ffffffffc02081d6:	dc8ff06f          	j	ffffffffc020779e <stride_dequeue+0x181a>
ffffffffc02081da:	8c1a                	mv	s8,t1
ffffffffc02081dc:	a8efe06f          	j	ffffffffc020646a <stride_dequeue+0x4e6>
ffffffffc02081e0:	008d3803          	ld	a6,8(s10)
ffffffffc02081e4:	010d3503          	ld	a0,16(s10)
ffffffffc02081e8:	85b2                	mv	a1,a2
ffffffffc02081ea:	f042                	sd	a6,32(sp)
ffffffffc02081ec:	b99fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02081f0:	7802                	ld	a6,32(sp)
ffffffffc02081f2:	00ad3423          	sd	a0,8(s10)
ffffffffc02081f6:	010d3823          	sd	a6,16(s10)
ffffffffc02081fa:	e119                	bnez	a0,ffffffffc0208200 <stride_dequeue+0x227c>
ffffffffc02081fc:	f5dfe06f          	j	ffffffffc0207158 <stride_dequeue+0x11d4>
ffffffffc0208200:	01a53023          	sd	s10,0(a0)
ffffffffc0208204:	f55fe06f          	j	ffffffffc0207158 <stride_dequeue+0x11d4>
ffffffffc0208208:	0087b803          	ld	a6,8(a5)
ffffffffc020820c:	6b88                	ld	a0,16(a5)
ffffffffc020820e:	85ce                	mv	a1,s3
ffffffffc0208210:	f43e                	sd	a5,40(sp)
ffffffffc0208212:	f042                	sd	a6,32(sp)
ffffffffc0208214:	b71fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208218:	77a2                	ld	a5,40(sp)
ffffffffc020821a:	7802                	ld	a6,32(sp)
ffffffffc020821c:	e788                	sd	a0,8(a5)
ffffffffc020821e:	0107b823          	sd	a6,16(a5)
ffffffffc0208222:	3e050863          	beqz	a0,ffffffffc0208612 <stride_dequeue+0x268e>
ffffffffc0208226:	e11c                	sd	a5,0(a0)
ffffffffc0208228:	89be                	mv	s3,a5
ffffffffc020822a:	dc8ff06f          	j	ffffffffc02077f2 <stride_dequeue+0x186e>
ffffffffc020822e:	8c9a                	mv	s9,t1
ffffffffc0208230:	91bfe06f          	j	ffffffffc0206b4a <stride_dequeue+0xbc6>
ffffffffc0208234:	0087b803          	ld	a6,8(a5)
ffffffffc0208238:	6b88                	ld	a0,16(a5)
ffffffffc020823a:	85ea                	mv	a1,s10
ffffffffc020823c:	f43e                	sd	a5,40(sp)
ffffffffc020823e:	f042                	sd	a6,32(sp)
ffffffffc0208240:	b45fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208244:	77a2                	ld	a5,40(sp)
ffffffffc0208246:	7802                	ld	a6,32(sp)
ffffffffc0208248:	e788                	sd	a0,8(a5)
ffffffffc020824a:	0107b823          	sd	a6,16(a5)
ffffffffc020824e:	40050c63          	beqz	a0,ffffffffc0208666 <stride_dequeue+0x26e2>
ffffffffc0208252:	e11c                	sd	a5,0(a0)
ffffffffc0208254:	8d3e                	mv	s10,a5
ffffffffc0208256:	cf4ff06f          	j	ffffffffc020774a <stride_dequeue+0x17c6>
ffffffffc020825a:	899a                	mv	s3,t1
ffffffffc020825c:	b0efe06f          	j	ffffffffc020656a <stride_dequeue+0x5e6>
ffffffffc0208260:	889a                	mv	a7,t1
ffffffffc0208262:	d93fe06f          	j	ffffffffc0206ff4 <stride_dequeue+0x1070>
ffffffffc0208266:	8c9a                	mv	s9,t1
ffffffffc0208268:	81ffe06f          	j	ffffffffc0206a86 <stride_dequeue+0xb02>
ffffffffc020826c:	0087b803          	ld	a6,8(a5)
ffffffffc0208270:	6b88                	ld	a0,16(a5)
ffffffffc0208272:	85ea                	mv	a1,s10
ffffffffc0208274:	f43e                	sd	a5,40(sp)
ffffffffc0208276:	f042                	sd	a6,32(sp)
ffffffffc0208278:	b0dfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020827c:	77a2                	ld	a5,40(sp)
ffffffffc020827e:	7802                	ld	a6,32(sp)
ffffffffc0208280:	e788                	sd	a0,8(a5)
ffffffffc0208282:	0107b823          	sd	a6,16(a5)
ffffffffc0208286:	42050463          	beqz	a0,ffffffffc02086ae <stride_dequeue+0x272a>
ffffffffc020828a:	e11c                	sd	a5,0(a0)
ffffffffc020828c:	8d3e                	mv	s10,a5
ffffffffc020828e:	db8ff06f          	j	ffffffffc0207846 <stride_dequeue+0x18c2>
ffffffffc0208292:	87c6                	mv	a5,a7
ffffffffc0208294:	e5bfe06f          	j	ffffffffc02070ee <stride_dequeue+0x116a>
ffffffffc0208298:	00883303          	ld	t1,8(a6)
ffffffffc020829c:	01083503          	ld	a0,16(a6)
ffffffffc02082a0:	85c6                	mv	a1,a7
ffffffffc02082a2:	f842                	sd	a6,48(sp)
ffffffffc02082a4:	f41a                	sd	t1,40(sp)
ffffffffc02082a6:	adffd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02082aa:	7842                	ld	a6,48(sp)
ffffffffc02082ac:	7322                	ld	t1,40(sp)
ffffffffc02082ae:	00a83423          	sd	a0,8(a6)
ffffffffc02082b2:	00683823          	sd	t1,16(a6)
ffffffffc02082b6:	e119                	bnez	a0,ffffffffc02082bc <stride_dequeue+0x2338>
ffffffffc02082b8:	f41fe06f          	j	ffffffffc02071f8 <stride_dequeue+0x1274>
ffffffffc02082bc:	01053023          	sd	a6,0(a0)
ffffffffc02082c0:	f39fe06f          	j	ffffffffc02071f8 <stride_dequeue+0x1274>
ffffffffc02082c4:	0088b303          	ld	t1,8(a7)
ffffffffc02082c8:	0108b503          	ld	a0,16(a7)
ffffffffc02082cc:	85be                	mv	a1,a5
ffffffffc02082ce:	f846                	sd	a7,48(sp)
ffffffffc02082d0:	f41a                	sd	t1,40(sp)
ffffffffc02082d2:	ab3fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02082d6:	78c2                	ld	a7,48(sp)
ffffffffc02082d8:	7322                	ld	t1,40(sp)
ffffffffc02082da:	00a8b423          	sd	a0,8(a7)
ffffffffc02082de:	0068b823          	sd	t1,16(a7)
ffffffffc02082e2:	3a050463          	beqz	a0,ffffffffc020868a <stride_dequeue+0x2706>
ffffffffc02082e6:	01153023          	sd	a7,0(a0)
ffffffffc02082ea:	87c6                	mv	a5,a7
ffffffffc02082ec:	85dff06f          	j	ffffffffc0207b48 <stride_dequeue+0x1bc4>
ffffffffc02082f0:	8d32                	mv	s10,a2
ffffffffc02082f2:	e67fe06f          	j	ffffffffc0207158 <stride_dequeue+0x11d4>
ffffffffc02082f6:	008cb303          	ld	t1,8(s9)
ffffffffc02082fa:	010cb503          	ld	a0,16(s9)
ffffffffc02082fe:	85c6                	mv	a1,a7
ffffffffc0208300:	f41a                	sd	t1,40(sp)
ffffffffc0208302:	a83fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208306:	7322                	ld	t1,40(sp)
ffffffffc0208308:	00acb423          	sd	a0,8(s9)
ffffffffc020830c:	7842                	ld	a6,48(sp)
ffffffffc020830e:	006cb823          	sd	t1,16(s9)
ffffffffc0208312:	e119                	bnez	a0,ffffffffc0208318 <stride_dequeue+0x2394>
ffffffffc0208314:	b13fe06f          	j	ffffffffc0206e26 <stride_dequeue+0xea2>
ffffffffc0208318:	01953023          	sd	s9,0(a0)
ffffffffc020831c:	b0bfe06f          	j	ffffffffc0206e26 <stride_dequeue+0xea2>
ffffffffc0208320:	0088b303          	ld	t1,8(a7)
ffffffffc0208324:	0108b503          	ld	a0,16(a7)
ffffffffc0208328:	85ea                	mv	a1,s10
ffffffffc020832a:	fc32                	sd	a2,56(sp)
ffffffffc020832c:	f846                	sd	a7,48(sp)
ffffffffc020832e:	f41a                	sd	t1,40(sp)
ffffffffc0208330:	a55fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208334:	78c2                	ld	a7,48(sp)
ffffffffc0208336:	7322                	ld	t1,40(sp)
ffffffffc0208338:	7662                	ld	a2,56(sp)
ffffffffc020833a:	00a8b423          	sd	a0,8(a7)
ffffffffc020833e:	0068b823          	sd	t1,16(a7)
ffffffffc0208342:	30050c63          	beqz	a0,ffffffffc020865a <stride_dequeue+0x26d6>
ffffffffc0208346:	01153023          	sd	a7,0(a0)
ffffffffc020834a:	8d46                	mv	s10,a7
ffffffffc020834c:	fa4ff06f          	j	ffffffffc0207af0 <stride_dequeue+0x1b6c>
ffffffffc0208350:	00883303          	ld	t1,8(a6)
ffffffffc0208354:	01083503          	ld	a0,16(a6)
ffffffffc0208358:	85c6                	mv	a1,a7
ffffffffc020835a:	f842                	sd	a6,48(sp)
ffffffffc020835c:	f41a                	sd	t1,40(sp)
ffffffffc020835e:	a27fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208362:	7842                	ld	a6,48(sp)
ffffffffc0208364:	7322                	ld	t1,40(sp)
ffffffffc0208366:	00a83423          	sd	a0,8(a6)
ffffffffc020836a:	00683823          	sd	t1,16(a6)
ffffffffc020836e:	e119                	bnez	a0,ffffffffc0208374 <stride_dequeue+0x23f0>
ffffffffc0208370:	f25fe06f          	j	ffffffffc0207294 <stride_dequeue+0x1310>
ffffffffc0208374:	01053023          	sd	a6,0(a0)
ffffffffc0208378:	f1dfe06f          	j	ffffffffc0207294 <stride_dequeue+0x1310>
ffffffffc020837c:	00883303          	ld	t1,8(a6)
ffffffffc0208380:	01083503          	ld	a0,16(a6)
ffffffffc0208384:	85e6                	mv	a1,s9
ffffffffc0208386:	fc46                	sd	a7,56(sp)
ffffffffc0208388:	f842                	sd	a6,48(sp)
ffffffffc020838a:	f41a                	sd	t1,40(sp)
ffffffffc020838c:	9f9fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208390:	7842                	ld	a6,48(sp)
ffffffffc0208392:	7322                	ld	t1,40(sp)
ffffffffc0208394:	78e2                	ld	a7,56(sp)
ffffffffc0208396:	00a83423          	sd	a0,8(a6)
ffffffffc020839a:	00683823          	sd	t1,16(a6)
ffffffffc020839e:	28050f63          	beqz	a0,ffffffffc020863c <stride_dequeue+0x26b8>
ffffffffc02083a2:	01053023          	sd	a6,0(a0)
ffffffffc02083a6:	8cc2                	mv	s9,a6
ffffffffc02083a8:	e1cff06f          	j	ffffffffc02079c4 <stride_dequeue+0x1a40>
ffffffffc02083ac:	0088b303          	ld	t1,8(a7)
ffffffffc02083b0:	0108b503          	ld	a0,16(a7)
ffffffffc02083b4:	85c2                	mv	a1,a6
ffffffffc02083b6:	f846                	sd	a7,48(sp)
ffffffffc02083b8:	f41a                	sd	t1,40(sp)
ffffffffc02083ba:	9cbfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02083be:	78c2                	ld	a7,48(sp)
ffffffffc02083c0:	7322                	ld	t1,40(sp)
ffffffffc02083c2:	00a8b423          	sd	a0,8(a7)
ffffffffc02083c6:	0068b823          	sd	t1,16(a7)
ffffffffc02083ca:	26050c63          	beqz	a0,ffffffffc0208642 <stride_dequeue+0x26be>
ffffffffc02083ce:	01153023          	sd	a7,0(a0)
ffffffffc02083d2:	8846                	mv	a6,a7
ffffffffc02083d4:	cd6ff06f          	j	ffffffffc02078aa <stride_dequeue+0x1926>
ffffffffc02083d8:	0088b303          	ld	t1,8(a7)
ffffffffc02083dc:	0108b503          	ld	a0,16(a7)
ffffffffc02083e0:	85c2                	mv	a1,a6
ffffffffc02083e2:	f846                	sd	a7,48(sp)
ffffffffc02083e4:	f41a                	sd	t1,40(sp)
ffffffffc02083e6:	99ffd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02083ea:	78c2                	ld	a7,48(sp)
ffffffffc02083ec:	7322                	ld	t1,40(sp)
ffffffffc02083ee:	00a8b423          	sd	a0,8(a7)
ffffffffc02083f2:	0068b823          	sd	t1,16(a7)
ffffffffc02083f6:	26050e63          	beqz	a0,ffffffffc0208672 <stride_dequeue+0x26ee>
ffffffffc02083fa:	01153023          	sd	a7,0(a0)
ffffffffc02083fe:	8846                	mv	a6,a7
ffffffffc0208400:	e80ff06f          	j	ffffffffc0207a80 <stride_dequeue+0x1afc>
ffffffffc0208404:	008d3303          	ld	t1,8(s10)
ffffffffc0208408:	010d3503          	ld	a0,16(s10)
ffffffffc020840c:	85c6                	mv	a1,a7
ffffffffc020840e:	f41a                	sd	t1,40(sp)
ffffffffc0208410:	975fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208414:	7322                	ld	t1,40(sp)
ffffffffc0208416:	00ad3423          	sd	a0,8(s10)
ffffffffc020841a:	7842                	ld	a6,48(sp)
ffffffffc020841c:	006d3823          	sd	t1,16(s10)
ffffffffc0208420:	e119                	bnez	a0,ffffffffc0208426 <stride_dequeue+0x24a2>
ffffffffc0208422:	93ffe06f          	j	ffffffffc0206d60 <stride_dequeue+0xddc>
ffffffffc0208426:	01a53023          	sd	s10,0(a0)
ffffffffc020842a:	937fe06f          	j	ffffffffc0206d60 <stride_dequeue+0xddc>
ffffffffc020842e:	00883303          	ld	t1,8(a6)
ffffffffc0208432:	01083503          	ld	a0,16(a6)
ffffffffc0208436:	85e6                	mv	a1,s9
ffffffffc0208438:	fc46                	sd	a7,56(sp)
ffffffffc020843a:	f842                	sd	a6,48(sp)
ffffffffc020843c:	f41a                	sd	t1,40(sp)
ffffffffc020843e:	947fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208442:	7842                	ld	a6,48(sp)
ffffffffc0208444:	7322                	ld	t1,40(sp)
ffffffffc0208446:	78e2                	ld	a7,56(sp)
ffffffffc0208448:	00a83423          	sd	a0,8(a6)
ffffffffc020844c:	00683823          	sd	t1,16(a6)
ffffffffc0208450:	1c050a63          	beqz	a0,ffffffffc0208624 <stride_dequeue+0x26a0>
ffffffffc0208454:	01053023          	sd	a6,0(a0)
ffffffffc0208458:	8cc2                	mv	s9,a6
ffffffffc020845a:	fb6ff06f          	j	ffffffffc0207c10 <stride_dequeue+0x1c8c>
ffffffffc020845e:	00883303          	ld	t1,8(a6)
ffffffffc0208462:	01083503          	ld	a0,16(a6)
ffffffffc0208466:	85ce                	mv	a1,s3
ffffffffc0208468:	fc46                	sd	a7,56(sp)
ffffffffc020846a:	f842                	sd	a6,48(sp)
ffffffffc020846c:	f41a                	sd	t1,40(sp)
ffffffffc020846e:	917fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208472:	7842                	ld	a6,48(sp)
ffffffffc0208474:	7322                	ld	t1,40(sp)
ffffffffc0208476:	78e2                	ld	a7,56(sp)
ffffffffc0208478:	00a83423          	sd	a0,8(a6)
ffffffffc020847c:	00683823          	sd	t1,16(a6)
ffffffffc0208480:	22050163          	beqz	a0,ffffffffc02086a2 <stride_dequeue+0x271e>
ffffffffc0208484:	01053023          	sd	a6,0(a0)
ffffffffc0208488:	89c2                	mv	s3,a6
ffffffffc020848a:	f1cff06f          	j	ffffffffc0207ba6 <stride_dequeue+0x1c22>
ffffffffc020848e:	008cb303          	ld	t1,8(s9)
ffffffffc0208492:	010cb503          	ld	a0,16(s9)
ffffffffc0208496:	85c6                	mv	a1,a7
ffffffffc0208498:	f41a                	sd	t1,40(sp)
ffffffffc020849a:	8ebfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020849e:	7322                	ld	t1,40(sp)
ffffffffc02084a0:	00acb423          	sd	a0,8(s9)
ffffffffc02084a4:	7842                	ld	a6,48(sp)
ffffffffc02084a6:	006cb823          	sd	t1,16(s9)
ffffffffc02084aa:	e119                	bnez	a0,ffffffffc02084b0 <stride_dequeue+0x252c>
ffffffffc02084ac:	feefe06f          	j	ffffffffc0206c9a <stride_dequeue+0xd16>
ffffffffc02084b0:	01953023          	sd	s9,0(a0)
ffffffffc02084b4:	fe6fe06f          	j	ffffffffc0206c9a <stride_dequeue+0xd16>
ffffffffc02084b8:	008cb303          	ld	t1,8(s9)
ffffffffc02084bc:	010cb503          	ld	a0,16(s9)
ffffffffc02084c0:	85c6                	mv	a1,a7
ffffffffc02084c2:	f41a                	sd	t1,40(sp)
ffffffffc02084c4:	8c1fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02084c8:	7322                	ld	t1,40(sp)
ffffffffc02084ca:	00acb423          	sd	a0,8(s9)
ffffffffc02084ce:	7742                	ld	a4,48(sp)
ffffffffc02084d0:	006cb823          	sd	t1,16(s9)
ffffffffc02084d4:	e119                	bnez	a0,ffffffffc02084da <stride_dequeue+0x2556>
ffffffffc02084d6:	c14fe06f          	j	ffffffffc02068ea <stride_dequeue+0x966>
ffffffffc02084da:	01953023          	sd	s9,0(a0)
ffffffffc02084de:	c0cfe06f          	j	ffffffffc02068ea <stride_dequeue+0x966>
ffffffffc02084e2:	00883303          	ld	t1,8(a6)
ffffffffc02084e6:	01083503          	ld	a0,16(a6)
ffffffffc02084ea:	85c6                	mv	a1,a7
ffffffffc02084ec:	f842                	sd	a6,48(sp)
ffffffffc02084ee:	f41a                	sd	t1,40(sp)
ffffffffc02084f0:	895fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02084f4:	7842                	ld	a6,48(sp)
ffffffffc02084f6:	7322                	ld	t1,40(sp)
ffffffffc02084f8:	00a83423          	sd	a0,8(a6)
ffffffffc02084fc:	00683823          	sd	t1,16(a6)
ffffffffc0208500:	e119                	bnez	a0,ffffffffc0208506 <stride_dequeue+0x2582>
ffffffffc0208502:	e2ffe06f          	j	ffffffffc0207330 <stride_dequeue+0x13ac>
ffffffffc0208506:	01053023          	sd	a6,0(a0)
ffffffffc020850a:	e27fe06f          	j	ffffffffc0207330 <stride_dequeue+0x13ac>
ffffffffc020850e:	00883303          	ld	t1,8(a6)
ffffffffc0208512:	01083503          	ld	a0,16(a6)
ffffffffc0208516:	85c6                	mv	a1,a7
ffffffffc0208518:	f842                	sd	a6,48(sp)
ffffffffc020851a:	f41a                	sd	t1,40(sp)
ffffffffc020851c:	869fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc0208520:	7842                	ld	a6,48(sp)
ffffffffc0208522:	7322                	ld	t1,40(sp)
ffffffffc0208524:	00a83423          	sd	a0,8(a6)
ffffffffc0208528:	00683823          	sd	t1,16(a6)
ffffffffc020852c:	e119                	bnez	a0,ffffffffc0208532 <stride_dequeue+0x25ae>
ffffffffc020852e:	f37fe06f          	j	ffffffffc0207464 <stride_dequeue+0x14e0>
ffffffffc0208532:	01053023          	sd	a6,0(a0)
ffffffffc0208536:	f2ffe06f          	j	ffffffffc0207464 <stride_dequeue+0x14e0>
ffffffffc020853a:	00883303          	ld	t1,8(a6)
ffffffffc020853e:	01083503          	ld	a0,16(a6)
ffffffffc0208542:	85e6                	mv	a1,s9
ffffffffc0208544:	fc46                	sd	a7,56(sp)
ffffffffc0208546:	f842                	sd	a6,48(sp)
ffffffffc0208548:	f41a                	sd	t1,40(sp)
ffffffffc020854a:	83bfd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020854e:	7842                	ld	a6,48(sp)
ffffffffc0208550:	7322                	ld	t1,40(sp)
ffffffffc0208552:	78e2                	ld	a7,56(sp)
ffffffffc0208554:	00a83423          	sd	a0,8(a6)
ffffffffc0208558:	00683823          	sd	t1,16(a6)
ffffffffc020855c:	c169                	beqz	a0,ffffffffc020861e <stride_dequeue+0x269a>
ffffffffc020855e:	01053023          	sd	a6,0(a0)
ffffffffc0208562:	8cc2                	mv	s9,a6
ffffffffc0208564:	ba4ff06f          	j	ffffffffc0207908 <stride_dequeue+0x1984>
ffffffffc0208568:	00883303          	ld	t1,8(a6)
ffffffffc020856c:	01083503          	ld	a0,16(a6)
ffffffffc0208570:	85c6                	mv	a1,a7
ffffffffc0208572:	f842                	sd	a6,48(sp)
ffffffffc0208574:	f41a                	sd	t1,40(sp)
ffffffffc0208576:	80ffd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc020857a:	7842                	ld	a6,48(sp)
ffffffffc020857c:	7322                	ld	t1,40(sp)
ffffffffc020857e:	00a83423          	sd	a0,8(a6)
ffffffffc0208582:	00683823          	sd	t1,16(a6)
ffffffffc0208586:	e119                	bnez	a0,ffffffffc020858c <stride_dequeue+0x2608>
ffffffffc0208588:	e43fe06f          	j	ffffffffc02073ca <stride_dequeue+0x1446>
ffffffffc020858c:	01053023          	sd	a6,0(a0)
ffffffffc0208590:	e3bfe06f          	j	ffffffffc02073ca <stride_dequeue+0x1446>
ffffffffc0208594:	008d3303          	ld	t1,8(s10)
ffffffffc0208598:	010d3503          	ld	a0,16(s10)
ffffffffc020859c:	85c6                	mv	a1,a7
ffffffffc020859e:	f41a                	sd	t1,40(sp)
ffffffffc02085a0:	fe4fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02085a4:	7322                	ld	t1,40(sp)
ffffffffc02085a6:	00ad3423          	sd	a0,8(s10)
ffffffffc02085aa:	7642                	ld	a2,48(sp)
ffffffffc02085ac:	006d3823          	sd	t1,16(s10)
ffffffffc02085b0:	e119                	bnez	a0,ffffffffc02085b6 <stride_dequeue+0x2632>
ffffffffc02085b2:	f4dfe06f          	j	ffffffffc02074fe <stride_dequeue+0x157a>
ffffffffc02085b6:	01a53023          	sd	s10,0(a0)
ffffffffc02085ba:	f45fe06f          	j	ffffffffc02074fe <stride_dequeue+0x157a>
ffffffffc02085be:	0088b303          	ld	t1,8(a7)
ffffffffc02085c2:	0108b503          	ld	a0,16(a7)
ffffffffc02085c6:	85c2                	mv	a1,a6
ffffffffc02085c8:	f846                	sd	a7,48(sp)
ffffffffc02085ca:	f41a                	sd	t1,40(sp)
ffffffffc02085cc:	fb8fd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02085d0:	78c2                	ld	a7,48(sp)
ffffffffc02085d2:	7322                	ld	t1,40(sp)
ffffffffc02085d4:	00a8b423          	sd	a0,8(a7)
ffffffffc02085d8:	0068b823          	sd	t1,16(a7)
ffffffffc02085dc:	cd79                	beqz	a0,ffffffffc02086ba <stride_dequeue+0x2736>
ffffffffc02085de:	01153023          	sd	a7,0(a0)
ffffffffc02085e2:	8846                	mv	a6,a7
ffffffffc02085e4:	b82ff06f          	j	ffffffffc0207966 <stride_dequeue+0x19e2>
ffffffffc02085e8:	0088b303          	ld	t1,8(a7)
ffffffffc02085ec:	0108b503          	ld	a0,16(a7)
ffffffffc02085f0:	85c2                	mv	a1,a6
ffffffffc02085f2:	f846                	sd	a7,48(sp)
ffffffffc02085f4:	f41a                	sd	t1,40(sp)
ffffffffc02085f6:	f8efd0ef          	jal	ra,ffffffffc0205d84 <skew_heap_merge.constprop.2>
ffffffffc02085fa:	78c2                	ld	a7,48(sp)
ffffffffc02085fc:	7322                	ld	t1,40(sp)
ffffffffc02085fe:	00a8b423          	sd	a0,8(a7)
ffffffffc0208602:	0068b823          	sd	t1,16(a7)
ffffffffc0208606:	c115                	beqz	a0,ffffffffc020862a <stride_dequeue+0x26a6>
ffffffffc0208608:	01153023          	sd	a7,0(a0)
ffffffffc020860c:	8846                	mv	a6,a7
ffffffffc020860e:	c14ff06f          	j	ffffffffc0207a22 <stride_dequeue+0x1a9e>
ffffffffc0208612:	89be                	mv	s3,a5
ffffffffc0208614:	9deff06f          	j	ffffffffc02077f2 <stride_dequeue+0x186e>
ffffffffc0208618:	8846                	mv	a6,a7
ffffffffc020861a:	db1fe06f          	j	ffffffffc02073ca <stride_dequeue+0x1446>
ffffffffc020861e:	8cc2                	mv	s9,a6
ffffffffc0208620:	ae8ff06f          	j	ffffffffc0207908 <stride_dequeue+0x1984>
ffffffffc0208624:	8cc2                	mv	s9,a6
ffffffffc0208626:	deaff06f          	j	ffffffffc0207c10 <stride_dequeue+0x1c8c>
ffffffffc020862a:	8846                	mv	a6,a7
ffffffffc020862c:	bf6ff06f          	j	ffffffffc0207a22 <stride_dequeue+0x1a9e>
ffffffffc0208630:	8cc6                	mv	s9,a7
ffffffffc0208632:	ab8fe06f          	j	ffffffffc02068ea <stride_dequeue+0x966>
ffffffffc0208636:	8846                	mv	a6,a7
ffffffffc0208638:	cf9fe06f          	j	ffffffffc0207330 <stride_dequeue+0x13ac>
ffffffffc020863c:	8cc2                	mv	s9,a6
ffffffffc020863e:	b86ff06f          	j	ffffffffc02079c4 <stride_dequeue+0x1a40>
ffffffffc0208642:	8846                	mv	a6,a7
ffffffffc0208644:	a66ff06f          	j	ffffffffc02078aa <stride_dequeue+0x1926>
ffffffffc0208648:	8cc6                	mv	s9,a7
ffffffffc020864a:	fdcfe06f          	j	ffffffffc0206e26 <stride_dequeue+0xea2>
ffffffffc020864e:	8a42                	mv	s4,a6
ffffffffc0208650:	f19fe06f          	j	ffffffffc0207568 <stride_dequeue+0x15e4>
ffffffffc0208654:	8846                	mv	a6,a7
ffffffffc0208656:	c3ffe06f          	j	ffffffffc0207294 <stride_dequeue+0x1310>
ffffffffc020865a:	8d46                	mv	s10,a7
ffffffffc020865c:	c94ff06f          	j	ffffffffc0207af0 <stride_dequeue+0x1b6c>
ffffffffc0208660:	8846                	mv	a6,a7
ffffffffc0208662:	e03fe06f          	j	ffffffffc0207464 <stride_dequeue+0x14e0>
ffffffffc0208666:	8d3e                	mv	s10,a5
ffffffffc0208668:	8e2ff06f          	j	ffffffffc020774a <stride_dequeue+0x17c6>
ffffffffc020866c:	8d46                	mv	s10,a7
ffffffffc020866e:	ef2fe06f          	j	ffffffffc0206d60 <stride_dequeue+0xddc>
ffffffffc0208672:	8846                	mv	a6,a7
ffffffffc0208674:	c0cff06f          	j	ffffffffc0207a80 <stride_dequeue+0x1afc>
ffffffffc0208678:	8846                	mv	a6,a7
ffffffffc020867a:	b7ffe06f          	j	ffffffffc02071f8 <stride_dequeue+0x1274>
ffffffffc020867e:	87c6                	mv	a5,a7
ffffffffc0208680:	f9dfe06f          	j	ffffffffc020761c <stride_dequeue+0x1698>
ffffffffc0208684:	8846                	mv	a6,a7
ffffffffc0208686:	f41fe06f          	j	ffffffffc02075c6 <stride_dequeue+0x1642>
ffffffffc020868a:	87c6                	mv	a5,a7
ffffffffc020868c:	cbcff06f          	j	ffffffffc0207b48 <stride_dequeue+0x1bc4>
ffffffffc0208690:	87c6                	mv	a5,a7
ffffffffc0208692:	fe1fe06f          	j	ffffffffc0207672 <stride_dequeue+0x16ee>
ffffffffc0208696:	8d3e                	mv	s10,a5
ffffffffc0208698:	906ff06f          	j	ffffffffc020779e <stride_dequeue+0x181a>
ffffffffc020869c:	8cc6                	mv	s9,a7
ffffffffc020869e:	dfcfe06f          	j	ffffffffc0206c9a <stride_dequeue+0xd16>
ffffffffc02086a2:	89c2                	mv	s3,a6
ffffffffc02086a4:	d02ff06f          	j	ffffffffc0207ba6 <stride_dequeue+0x1c22>
ffffffffc02086a8:	8846                	mv	a6,a7
ffffffffc02086aa:	824ff06f          	j	ffffffffc02076ce <stride_dequeue+0x174a>
ffffffffc02086ae:	8d3e                	mv	s10,a5
ffffffffc02086b0:	996ff06f          	j	ffffffffc0207846 <stride_dequeue+0x18c2>
ffffffffc02086b4:	8d46                	mv	s10,a7
ffffffffc02086b6:	e49fe06f          	j	ffffffffc02074fe <stride_dequeue+0x157a>
ffffffffc02086ba:	8846                	mv	a6,a7
ffffffffc02086bc:	aaaff06f          	j	ffffffffc0207966 <stride_dequeue+0x19e2>

ffffffffc02086c0 <sys_getpid>:
ffffffffc02086c0:	00034797          	auipc	a5,0x34
ffffffffc02086c4:	7c078793          	addi	a5,a5,1984 # ffffffffc023ce80 <current>
ffffffffc02086c8:	639c                	ld	a5,0(a5)
ffffffffc02086ca:	43c8                	lw	a0,4(a5)
ffffffffc02086cc:	8082                	ret

ffffffffc02086ce <sys_pgdir>:
ffffffffc02086ce:	4501                	li	a0,0
ffffffffc02086d0:	8082                	ret

ffffffffc02086d2 <sys_gettime>:
ffffffffc02086d2:	00034797          	auipc	a5,0x34
ffffffffc02086d6:	7de78793          	addi	a5,a5,2014 # ffffffffc023ceb0 <ticks>
ffffffffc02086da:	639c                	ld	a5,0(a5)
ffffffffc02086dc:	0027951b          	slliw	a0,a5,0x2
ffffffffc02086e0:	9d3d                	addw	a0,a0,a5
ffffffffc02086e2:	0015151b          	slliw	a0,a0,0x1
ffffffffc02086e6:	8082                	ret

ffffffffc02086e8 <sys_lab6_set_priority>:
ffffffffc02086e8:	4108                	lw	a0,0(a0)
ffffffffc02086ea:	1141                	addi	sp,sp,-16
ffffffffc02086ec:	e406                	sd	ra,8(sp)
ffffffffc02086ee:	bf0fd0ef          	jal	ra,ffffffffc0205ade <lab6_set_priority>
ffffffffc02086f2:	60a2                	ld	ra,8(sp)
ffffffffc02086f4:	4501                	li	a0,0
ffffffffc02086f6:	0141                	addi	sp,sp,16
ffffffffc02086f8:	8082                	ret

ffffffffc02086fa <sys_putc>:
ffffffffc02086fa:	4108                	lw	a0,0(a0)
ffffffffc02086fc:	1141                	addi	sp,sp,-16
ffffffffc02086fe:	e406                	sd	ra,8(sp)
ffffffffc0208700:	a09f70ef          	jal	ra,ffffffffc0200108 <cputchar>
ffffffffc0208704:	60a2                	ld	ra,8(sp)
ffffffffc0208706:	4501                	li	a0,0
ffffffffc0208708:	0141                	addi	sp,sp,16
ffffffffc020870a:	8082                	ret

ffffffffc020870c <sys_kill>:
ffffffffc020870c:	4108                	lw	a0,0(a0)
ffffffffc020870e:	a22fd06f          	j	ffffffffc0205930 <do_kill>

ffffffffc0208712 <sys_yield>:
ffffffffc0208712:	9ccfd06f          	j	ffffffffc02058de <do_yield>

ffffffffc0208716 <sys_exec>:
ffffffffc0208716:	6d14                	ld	a3,24(a0)
ffffffffc0208718:	6910                	ld	a2,16(a0)
ffffffffc020871a:	650c                	ld	a1,8(a0)
ffffffffc020871c:	6108                	ld	a0,0(a0)
ffffffffc020871e:	cc7fc06f          	j	ffffffffc02053e4 <do_execve>

ffffffffc0208722 <sys_wait>:
ffffffffc0208722:	650c                	ld	a1,8(a0)
ffffffffc0208724:	4108                	lw	a0,0(a0)
ffffffffc0208726:	9cafd06f          	j	ffffffffc02058f0 <do_wait>

ffffffffc020872a <sys_fork>:
ffffffffc020872a:	00034797          	auipc	a5,0x34
ffffffffc020872e:	75678793          	addi	a5,a5,1878 # ffffffffc023ce80 <current>
ffffffffc0208732:	639c                	ld	a5,0(a5)
ffffffffc0208734:	4501                	li	a0,0
ffffffffc0208736:	73d0                	ld	a2,160(a5)
ffffffffc0208738:	6a0c                	ld	a1,16(a2)
ffffffffc020873a:	c56fc06f          	j	ffffffffc0204b90 <do_fork>

ffffffffc020873e <sys_exit>:
ffffffffc020873e:	4108                	lw	a0,0(a0)
ffffffffc0208740:	887fc06f          	j	ffffffffc0204fc6 <do_exit>

ffffffffc0208744 <syscall>:
ffffffffc0208744:	715d                	addi	sp,sp,-80
ffffffffc0208746:	fc26                	sd	s1,56(sp)
ffffffffc0208748:	00034497          	auipc	s1,0x34
ffffffffc020874c:	73848493          	addi	s1,s1,1848 # ffffffffc023ce80 <current>
ffffffffc0208750:	6098                	ld	a4,0(s1)
ffffffffc0208752:	e0a2                	sd	s0,64(sp)
ffffffffc0208754:	f84a                	sd	s2,48(sp)
ffffffffc0208756:	7340                	ld	s0,160(a4)
ffffffffc0208758:	e486                	sd	ra,72(sp)
ffffffffc020875a:	0ff00793          	li	a5,255
ffffffffc020875e:	05042903          	lw	s2,80(s0)
ffffffffc0208762:	0327ee63          	bltu	a5,s2,ffffffffc020879e <syscall+0x5a>
ffffffffc0208766:	00391713          	slli	a4,s2,0x3
ffffffffc020876a:	00003797          	auipc	a5,0x3
ffffffffc020876e:	83678793          	addi	a5,a5,-1994 # ffffffffc020afa0 <syscalls>
ffffffffc0208772:	97ba                	add	a5,a5,a4
ffffffffc0208774:	639c                	ld	a5,0(a5)
ffffffffc0208776:	c785                	beqz	a5,ffffffffc020879e <syscall+0x5a>
ffffffffc0208778:	6c28                	ld	a0,88(s0)
ffffffffc020877a:	702c                	ld	a1,96(s0)
ffffffffc020877c:	7430                	ld	a2,104(s0)
ffffffffc020877e:	7834                	ld	a3,112(s0)
ffffffffc0208780:	7c38                	ld	a4,120(s0)
ffffffffc0208782:	e42a                	sd	a0,8(sp)
ffffffffc0208784:	e82e                	sd	a1,16(sp)
ffffffffc0208786:	ec32                	sd	a2,24(sp)
ffffffffc0208788:	f036                	sd	a3,32(sp)
ffffffffc020878a:	f43a                	sd	a4,40(sp)
ffffffffc020878c:	0028                	addi	a0,sp,8
ffffffffc020878e:	9782                	jalr	a5
ffffffffc0208790:	e828                	sd	a0,80(s0)
ffffffffc0208792:	60a6                	ld	ra,72(sp)
ffffffffc0208794:	6406                	ld	s0,64(sp)
ffffffffc0208796:	74e2                	ld	s1,56(sp)
ffffffffc0208798:	7942                	ld	s2,48(sp)
ffffffffc020879a:	6161                	addi	sp,sp,80
ffffffffc020879c:	8082                	ret
ffffffffc020879e:	8522                	mv	a0,s0
ffffffffc02087a0:	89af80ef          	jal	ra,ffffffffc020083a <print_trapframe>
ffffffffc02087a4:	609c                	ld	a5,0(s1)
ffffffffc02087a6:	86ca                	mv	a3,s2
ffffffffc02087a8:	00002617          	auipc	a2,0x2
ffffffffc02087ac:	7b060613          	addi	a2,a2,1968 # ffffffffc020af58 <default_pmm_manager+0xb58>
ffffffffc02087b0:	43d8                	lw	a4,4(a5)
ffffffffc02087b2:	06d00593          	li	a1,109
ffffffffc02087b6:	0b478793          	addi	a5,a5,180
ffffffffc02087ba:	00002517          	auipc	a0,0x2
ffffffffc02087be:	7ce50513          	addi	a0,a0,1998 # ffffffffc020af88 <default_pmm_manager+0xb88>
ffffffffc02087c2:	a57f70ef          	jal	ra,ffffffffc0200218 <__panic>

ffffffffc02087c6 <strlen>:
ffffffffc02087c6:	00054783          	lbu	a5,0(a0)
ffffffffc02087ca:	cb91                	beqz	a5,ffffffffc02087de <strlen+0x18>
ffffffffc02087cc:	4781                	li	a5,0
ffffffffc02087ce:	0785                	addi	a5,a5,1
ffffffffc02087d0:	00f50733          	add	a4,a0,a5
ffffffffc02087d4:	00074703          	lbu	a4,0(a4)
ffffffffc02087d8:	fb7d                	bnez	a4,ffffffffc02087ce <strlen+0x8>
ffffffffc02087da:	853e                	mv	a0,a5
ffffffffc02087dc:	8082                	ret
ffffffffc02087de:	4781                	li	a5,0
ffffffffc02087e0:	853e                	mv	a0,a5
ffffffffc02087e2:	8082                	ret

ffffffffc02087e4 <strnlen>:
ffffffffc02087e4:	c185                	beqz	a1,ffffffffc0208804 <strnlen+0x20>
ffffffffc02087e6:	00054783          	lbu	a5,0(a0)
ffffffffc02087ea:	cf89                	beqz	a5,ffffffffc0208804 <strnlen+0x20>
ffffffffc02087ec:	4781                	li	a5,0
ffffffffc02087ee:	a021                	j	ffffffffc02087f6 <strnlen+0x12>
ffffffffc02087f0:	00074703          	lbu	a4,0(a4)
ffffffffc02087f4:	c711                	beqz	a4,ffffffffc0208800 <strnlen+0x1c>
ffffffffc02087f6:	0785                	addi	a5,a5,1
ffffffffc02087f8:	00f50733          	add	a4,a0,a5
ffffffffc02087fc:	fef59ae3          	bne	a1,a5,ffffffffc02087f0 <strnlen+0xc>
ffffffffc0208800:	853e                	mv	a0,a5
ffffffffc0208802:	8082                	ret
ffffffffc0208804:	4781                	li	a5,0
ffffffffc0208806:	853e                	mv	a0,a5
ffffffffc0208808:	8082                	ret

ffffffffc020880a <strcpy>:
ffffffffc020880a:	87aa                	mv	a5,a0
ffffffffc020880c:	0585                	addi	a1,a1,1
ffffffffc020880e:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0208812:	0785                	addi	a5,a5,1
ffffffffc0208814:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0208818:	fb75                	bnez	a4,ffffffffc020880c <strcpy+0x2>
ffffffffc020881a:	8082                	ret

ffffffffc020881c <strcmp>:
ffffffffc020881c:	00054783          	lbu	a5,0(a0)
ffffffffc0208820:	0005c703          	lbu	a4,0(a1)
ffffffffc0208824:	cb91                	beqz	a5,ffffffffc0208838 <strcmp+0x1c>
ffffffffc0208826:	00e79c63          	bne	a5,a4,ffffffffc020883e <strcmp+0x22>
ffffffffc020882a:	0505                	addi	a0,a0,1
ffffffffc020882c:	00054783          	lbu	a5,0(a0)
ffffffffc0208830:	0585                	addi	a1,a1,1
ffffffffc0208832:	0005c703          	lbu	a4,0(a1)
ffffffffc0208836:	fbe5                	bnez	a5,ffffffffc0208826 <strcmp+0xa>
ffffffffc0208838:	4501                	li	a0,0
ffffffffc020883a:	9d19                	subw	a0,a0,a4
ffffffffc020883c:	8082                	ret
ffffffffc020883e:	0007851b          	sext.w	a0,a5
ffffffffc0208842:	9d19                	subw	a0,a0,a4
ffffffffc0208844:	8082                	ret

ffffffffc0208846 <strchr>:
ffffffffc0208846:	00054783          	lbu	a5,0(a0)
ffffffffc020884a:	cb91                	beqz	a5,ffffffffc020885e <strchr+0x18>
ffffffffc020884c:	00b79563          	bne	a5,a1,ffffffffc0208856 <strchr+0x10>
ffffffffc0208850:	a809                	j	ffffffffc0208862 <strchr+0x1c>
ffffffffc0208852:	00b78763          	beq	a5,a1,ffffffffc0208860 <strchr+0x1a>
ffffffffc0208856:	0505                	addi	a0,a0,1
ffffffffc0208858:	00054783          	lbu	a5,0(a0)
ffffffffc020885c:	fbfd                	bnez	a5,ffffffffc0208852 <strchr+0xc>
ffffffffc020885e:	4501                	li	a0,0
ffffffffc0208860:	8082                	ret
ffffffffc0208862:	8082                	ret

ffffffffc0208864 <memset>:
ffffffffc0208864:	ca01                	beqz	a2,ffffffffc0208874 <memset+0x10>
ffffffffc0208866:	962a                	add	a2,a2,a0
ffffffffc0208868:	87aa                	mv	a5,a0
ffffffffc020886a:	0785                	addi	a5,a5,1
ffffffffc020886c:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0208870:	fec79de3          	bne	a5,a2,ffffffffc020886a <memset+0x6>
ffffffffc0208874:	8082                	ret

ffffffffc0208876 <memcpy>:
ffffffffc0208876:	ca19                	beqz	a2,ffffffffc020888c <memcpy+0x16>
ffffffffc0208878:	962e                	add	a2,a2,a1
ffffffffc020887a:	87aa                	mv	a5,a0
ffffffffc020887c:	0585                	addi	a1,a1,1
ffffffffc020887e:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0208882:	0785                	addi	a5,a5,1
ffffffffc0208884:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0208888:	fec59ae3          	bne	a1,a2,ffffffffc020887c <memcpy+0x6>
ffffffffc020888c:	8082                	ret

ffffffffc020888e <printnum>:
ffffffffc020888e:	02069813          	slli	a6,a3,0x20
ffffffffc0208892:	7179                	addi	sp,sp,-48
ffffffffc0208894:	02085813          	srli	a6,a6,0x20
ffffffffc0208898:	e052                	sd	s4,0(sp)
ffffffffc020889a:	03067a33          	remu	s4,a2,a6
ffffffffc020889e:	f022                	sd	s0,32(sp)
ffffffffc02088a0:	ec26                	sd	s1,24(sp)
ffffffffc02088a2:	e84a                	sd	s2,16(sp)
ffffffffc02088a4:	f406                	sd	ra,40(sp)
ffffffffc02088a6:	e44e                	sd	s3,8(sp)
ffffffffc02088a8:	84aa                	mv	s1,a0
ffffffffc02088aa:	892e                	mv	s2,a1
ffffffffc02088ac:	fff7041b          	addiw	s0,a4,-1
ffffffffc02088b0:	2a01                	sext.w	s4,s4
ffffffffc02088b2:	03067e63          	bgeu	a2,a6,ffffffffc02088ee <printnum+0x60>
ffffffffc02088b6:	89be                	mv	s3,a5
ffffffffc02088b8:	00805763          	blez	s0,ffffffffc02088c6 <printnum+0x38>
ffffffffc02088bc:	347d                	addiw	s0,s0,-1
ffffffffc02088be:	85ca                	mv	a1,s2
ffffffffc02088c0:	854e                	mv	a0,s3
ffffffffc02088c2:	9482                	jalr	s1
ffffffffc02088c4:	fc65                	bnez	s0,ffffffffc02088bc <printnum+0x2e>
ffffffffc02088c6:	1a02                	slli	s4,s4,0x20
ffffffffc02088c8:	020a5a13          	srli	s4,s4,0x20
ffffffffc02088cc:	00003797          	auipc	a5,0x3
ffffffffc02088d0:	0f478793          	addi	a5,a5,244 # ffffffffc020b9c0 <error_string+0xc8>
ffffffffc02088d4:	9a3e                	add	s4,s4,a5
ffffffffc02088d6:	7402                	ld	s0,32(sp)
ffffffffc02088d8:	000a4503          	lbu	a0,0(s4)
ffffffffc02088dc:	70a2                	ld	ra,40(sp)
ffffffffc02088de:	69a2                	ld	s3,8(sp)
ffffffffc02088e0:	6a02                	ld	s4,0(sp)
ffffffffc02088e2:	85ca                	mv	a1,s2
ffffffffc02088e4:	8326                	mv	t1,s1
ffffffffc02088e6:	6942                	ld	s2,16(sp)
ffffffffc02088e8:	64e2                	ld	s1,24(sp)
ffffffffc02088ea:	6145                	addi	sp,sp,48
ffffffffc02088ec:	8302                	jr	t1
ffffffffc02088ee:	03065633          	divu	a2,a2,a6
ffffffffc02088f2:	8722                	mv	a4,s0
ffffffffc02088f4:	f9bff0ef          	jal	ra,ffffffffc020888e <printnum>
ffffffffc02088f8:	b7f9                	j	ffffffffc02088c6 <printnum+0x38>

ffffffffc02088fa <vprintfmt>:
ffffffffc02088fa:	7119                	addi	sp,sp,-128
ffffffffc02088fc:	f4a6                	sd	s1,104(sp)
ffffffffc02088fe:	f0ca                	sd	s2,96(sp)
ffffffffc0208900:	e8d2                	sd	s4,80(sp)
ffffffffc0208902:	e4d6                	sd	s5,72(sp)
ffffffffc0208904:	e0da                	sd	s6,64(sp)
ffffffffc0208906:	fc5e                	sd	s7,56(sp)
ffffffffc0208908:	f862                	sd	s8,48(sp)
ffffffffc020890a:	f06a                	sd	s10,32(sp)
ffffffffc020890c:	fc86                	sd	ra,120(sp)
ffffffffc020890e:	f8a2                	sd	s0,112(sp)
ffffffffc0208910:	ecce                	sd	s3,88(sp)
ffffffffc0208912:	f466                	sd	s9,40(sp)
ffffffffc0208914:	ec6e                	sd	s11,24(sp)
ffffffffc0208916:	892a                	mv	s2,a0
ffffffffc0208918:	84ae                	mv	s1,a1
ffffffffc020891a:	8d32                	mv	s10,a2
ffffffffc020891c:	8ab6                	mv	s5,a3
ffffffffc020891e:	5b7d                	li	s6,-1
ffffffffc0208920:	00003a17          	auipc	s4,0x3
ffffffffc0208924:	e80a0a13          	addi	s4,s4,-384 # ffffffffc020b7a0 <syscalls+0x800>
ffffffffc0208928:	05e00b93          	li	s7,94
ffffffffc020892c:	00003c17          	auipc	s8,0x3
ffffffffc0208930:	fccc0c13          	addi	s8,s8,-52 # ffffffffc020b8f8 <error_string>
ffffffffc0208934:	000d4503          	lbu	a0,0(s10)
ffffffffc0208938:	02500793          	li	a5,37
ffffffffc020893c:	001d0413          	addi	s0,s10,1
ffffffffc0208940:	00f50e63          	beq	a0,a5,ffffffffc020895c <vprintfmt+0x62>
ffffffffc0208944:	c521                	beqz	a0,ffffffffc020898c <vprintfmt+0x92>
ffffffffc0208946:	02500993          	li	s3,37
ffffffffc020894a:	a011                	j	ffffffffc020894e <vprintfmt+0x54>
ffffffffc020894c:	c121                	beqz	a0,ffffffffc020898c <vprintfmt+0x92>
ffffffffc020894e:	85a6                	mv	a1,s1
ffffffffc0208950:	0405                	addi	s0,s0,1
ffffffffc0208952:	9902                	jalr	s2
ffffffffc0208954:	fff44503          	lbu	a0,-1(s0)
ffffffffc0208958:	ff351ae3          	bne	a0,s3,ffffffffc020894c <vprintfmt+0x52>
ffffffffc020895c:	00044603          	lbu	a2,0(s0)
ffffffffc0208960:	02000793          	li	a5,32
ffffffffc0208964:	4981                	li	s3,0
ffffffffc0208966:	4801                	li	a6,0
ffffffffc0208968:	5cfd                	li	s9,-1
ffffffffc020896a:	5dfd                	li	s11,-1
ffffffffc020896c:	05500593          	li	a1,85
ffffffffc0208970:	4525                	li	a0,9
ffffffffc0208972:	fdd6069b          	addiw	a3,a2,-35
ffffffffc0208976:	0ff6f693          	andi	a3,a3,255
ffffffffc020897a:	00140d13          	addi	s10,s0,1
ffffffffc020897e:	1ed5ef63          	bltu	a1,a3,ffffffffc0208b7c <vprintfmt+0x282>
ffffffffc0208982:	068a                	slli	a3,a3,0x2
ffffffffc0208984:	96d2                	add	a3,a3,s4
ffffffffc0208986:	4294                	lw	a3,0(a3)
ffffffffc0208988:	96d2                	add	a3,a3,s4
ffffffffc020898a:	8682                	jr	a3
ffffffffc020898c:	70e6                	ld	ra,120(sp)
ffffffffc020898e:	7446                	ld	s0,112(sp)
ffffffffc0208990:	74a6                	ld	s1,104(sp)
ffffffffc0208992:	7906                	ld	s2,96(sp)
ffffffffc0208994:	69e6                	ld	s3,88(sp)
ffffffffc0208996:	6a46                	ld	s4,80(sp)
ffffffffc0208998:	6aa6                	ld	s5,72(sp)
ffffffffc020899a:	6b06                	ld	s6,64(sp)
ffffffffc020899c:	7be2                	ld	s7,56(sp)
ffffffffc020899e:	7c42                	ld	s8,48(sp)
ffffffffc02089a0:	7ca2                	ld	s9,40(sp)
ffffffffc02089a2:	7d02                	ld	s10,32(sp)
ffffffffc02089a4:	6de2                	ld	s11,24(sp)
ffffffffc02089a6:	6109                	addi	sp,sp,128
ffffffffc02089a8:	8082                	ret
ffffffffc02089aa:	87b2                	mv	a5,a2
ffffffffc02089ac:	00144603          	lbu	a2,1(s0)
ffffffffc02089b0:	846a                	mv	s0,s10
ffffffffc02089b2:	b7c1                	j	ffffffffc0208972 <vprintfmt+0x78>
ffffffffc02089b4:	000aac83          	lw	s9,0(s5)
ffffffffc02089b8:	00144603          	lbu	a2,1(s0)
ffffffffc02089bc:	0aa1                	addi	s5,s5,8
ffffffffc02089be:	846a                	mv	s0,s10
ffffffffc02089c0:	fa0dd9e3          	bgez	s11,ffffffffc0208972 <vprintfmt+0x78>
ffffffffc02089c4:	8de6                	mv	s11,s9
ffffffffc02089c6:	5cfd                	li	s9,-1
ffffffffc02089c8:	b76d                	j	ffffffffc0208972 <vprintfmt+0x78>
ffffffffc02089ca:	fffdc693          	not	a3,s11
ffffffffc02089ce:	96fd                	srai	a3,a3,0x3f
ffffffffc02089d0:	00ddfdb3          	and	s11,s11,a3
ffffffffc02089d4:	00144603          	lbu	a2,1(s0)
ffffffffc02089d8:	2d81                	sext.w	s11,s11
ffffffffc02089da:	846a                	mv	s0,s10
ffffffffc02089dc:	bf59                	j	ffffffffc0208972 <vprintfmt+0x78>
ffffffffc02089de:	4705                	li	a4,1
ffffffffc02089e0:	008a8593          	addi	a1,s5,8
ffffffffc02089e4:	01074463          	blt	a4,a6,ffffffffc02089ec <vprintfmt+0xf2>
ffffffffc02089e8:	22080863          	beqz	a6,ffffffffc0208c18 <vprintfmt+0x31e>
ffffffffc02089ec:	000ab603          	ld	a2,0(s5)
ffffffffc02089f0:	46c1                	li	a3,16
ffffffffc02089f2:	8aae                	mv	s5,a1
ffffffffc02089f4:	a291                	j	ffffffffc0208b38 <vprintfmt+0x23e>
ffffffffc02089f6:	fd060c9b          	addiw	s9,a2,-48
ffffffffc02089fa:	00144603          	lbu	a2,1(s0)
ffffffffc02089fe:	846a                	mv	s0,s10
ffffffffc0208a00:	fd06069b          	addiw	a3,a2,-48
ffffffffc0208a04:	0006089b          	sext.w	a7,a2
ffffffffc0208a08:	fad56ce3          	bltu	a0,a3,ffffffffc02089c0 <vprintfmt+0xc6>
ffffffffc0208a0c:	0405                	addi	s0,s0,1
ffffffffc0208a0e:	002c969b          	slliw	a3,s9,0x2
ffffffffc0208a12:	00044603          	lbu	a2,0(s0)
ffffffffc0208a16:	0196873b          	addw	a4,a3,s9
ffffffffc0208a1a:	0017171b          	slliw	a4,a4,0x1
ffffffffc0208a1e:	0117073b          	addw	a4,a4,a7
ffffffffc0208a22:	fd06069b          	addiw	a3,a2,-48
ffffffffc0208a26:	fd070c9b          	addiw	s9,a4,-48
ffffffffc0208a2a:	0006089b          	sext.w	a7,a2
ffffffffc0208a2e:	fcd57fe3          	bgeu	a0,a3,ffffffffc0208a0c <vprintfmt+0x112>
ffffffffc0208a32:	b779                	j	ffffffffc02089c0 <vprintfmt+0xc6>
ffffffffc0208a34:	000aa503          	lw	a0,0(s5)
ffffffffc0208a38:	85a6                	mv	a1,s1
ffffffffc0208a3a:	0aa1                	addi	s5,s5,8
ffffffffc0208a3c:	9902                	jalr	s2
ffffffffc0208a3e:	bddd                	j	ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208a40:	4705                	li	a4,1
ffffffffc0208a42:	008a8993          	addi	s3,s5,8
ffffffffc0208a46:	01074463          	blt	a4,a6,ffffffffc0208a4e <vprintfmt+0x154>
ffffffffc0208a4a:	1c080463          	beqz	a6,ffffffffc0208c12 <vprintfmt+0x318>
ffffffffc0208a4e:	000ab403          	ld	s0,0(s5)
ffffffffc0208a52:	1c044a63          	bltz	s0,ffffffffc0208c26 <vprintfmt+0x32c>
ffffffffc0208a56:	8622                	mv	a2,s0
ffffffffc0208a58:	8ace                	mv	s5,s3
ffffffffc0208a5a:	46a9                	li	a3,10
ffffffffc0208a5c:	a8f1                	j	ffffffffc0208b38 <vprintfmt+0x23e>
ffffffffc0208a5e:	000aa783          	lw	a5,0(s5)
ffffffffc0208a62:	4761                	li	a4,24
ffffffffc0208a64:	0aa1                	addi	s5,s5,8
ffffffffc0208a66:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0208a6a:	8fb5                	xor	a5,a5,a3
ffffffffc0208a6c:	40d786bb          	subw	a3,a5,a3
ffffffffc0208a70:	12d74963          	blt	a4,a3,ffffffffc0208ba2 <vprintfmt+0x2a8>
ffffffffc0208a74:	00369793          	slli	a5,a3,0x3
ffffffffc0208a78:	97e2                	add	a5,a5,s8
ffffffffc0208a7a:	639c                	ld	a5,0(a5)
ffffffffc0208a7c:	12078363          	beqz	a5,ffffffffc0208ba2 <vprintfmt+0x2a8>
ffffffffc0208a80:	86be                	mv	a3,a5
ffffffffc0208a82:	00000617          	auipc	a2,0x0
ffffffffc0208a86:	23e60613          	addi	a2,a2,574 # ffffffffc0208cc0 <etext+0x2e>
ffffffffc0208a8a:	85a6                	mv	a1,s1
ffffffffc0208a8c:	854a                	mv	a0,s2
ffffffffc0208a8e:	1cc000ef          	jal	ra,ffffffffc0208c5a <printfmt>
ffffffffc0208a92:	b54d                	j	ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208a94:	000ab603          	ld	a2,0(s5)
ffffffffc0208a98:	0aa1                	addi	s5,s5,8
ffffffffc0208a9a:	1a060163          	beqz	a2,ffffffffc0208c3c <vprintfmt+0x342>
ffffffffc0208a9e:	00160413          	addi	s0,a2,1
ffffffffc0208aa2:	15b05763          	blez	s11,ffffffffc0208bf0 <vprintfmt+0x2f6>
ffffffffc0208aa6:	02d00593          	li	a1,45
ffffffffc0208aaa:	10b79d63          	bne	a5,a1,ffffffffc0208bc4 <vprintfmt+0x2ca>
ffffffffc0208aae:	00064783          	lbu	a5,0(a2)
ffffffffc0208ab2:	0007851b          	sext.w	a0,a5
ffffffffc0208ab6:	c905                	beqz	a0,ffffffffc0208ae6 <vprintfmt+0x1ec>
ffffffffc0208ab8:	000cc563          	bltz	s9,ffffffffc0208ac2 <vprintfmt+0x1c8>
ffffffffc0208abc:	3cfd                	addiw	s9,s9,-1
ffffffffc0208abe:	036c8263          	beq	s9,s6,ffffffffc0208ae2 <vprintfmt+0x1e8>
ffffffffc0208ac2:	85a6                	mv	a1,s1
ffffffffc0208ac4:	14098f63          	beqz	s3,ffffffffc0208c22 <vprintfmt+0x328>
ffffffffc0208ac8:	3781                	addiw	a5,a5,-32
ffffffffc0208aca:	14fbfc63          	bgeu	s7,a5,ffffffffc0208c22 <vprintfmt+0x328>
ffffffffc0208ace:	03f00513          	li	a0,63
ffffffffc0208ad2:	9902                	jalr	s2
ffffffffc0208ad4:	0405                	addi	s0,s0,1
ffffffffc0208ad6:	fff44783          	lbu	a5,-1(s0)
ffffffffc0208ada:	3dfd                	addiw	s11,s11,-1
ffffffffc0208adc:	0007851b          	sext.w	a0,a5
ffffffffc0208ae0:	fd61                	bnez	a0,ffffffffc0208ab8 <vprintfmt+0x1be>
ffffffffc0208ae2:	e5b059e3          	blez	s11,ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208ae6:	3dfd                	addiw	s11,s11,-1
ffffffffc0208ae8:	85a6                	mv	a1,s1
ffffffffc0208aea:	02000513          	li	a0,32
ffffffffc0208aee:	9902                	jalr	s2
ffffffffc0208af0:	e40d82e3          	beqz	s11,ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208af4:	3dfd                	addiw	s11,s11,-1
ffffffffc0208af6:	85a6                	mv	a1,s1
ffffffffc0208af8:	02000513          	li	a0,32
ffffffffc0208afc:	9902                	jalr	s2
ffffffffc0208afe:	fe0d94e3          	bnez	s11,ffffffffc0208ae6 <vprintfmt+0x1ec>
ffffffffc0208b02:	bd0d                	j	ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208b04:	4705                	li	a4,1
ffffffffc0208b06:	008a8593          	addi	a1,s5,8
ffffffffc0208b0a:	01074463          	blt	a4,a6,ffffffffc0208b12 <vprintfmt+0x218>
ffffffffc0208b0e:	0e080863          	beqz	a6,ffffffffc0208bfe <vprintfmt+0x304>
ffffffffc0208b12:	000ab603          	ld	a2,0(s5)
ffffffffc0208b16:	46a1                	li	a3,8
ffffffffc0208b18:	8aae                	mv	s5,a1
ffffffffc0208b1a:	a839                	j	ffffffffc0208b38 <vprintfmt+0x23e>
ffffffffc0208b1c:	03000513          	li	a0,48
ffffffffc0208b20:	85a6                	mv	a1,s1
ffffffffc0208b22:	e03e                	sd	a5,0(sp)
ffffffffc0208b24:	9902                	jalr	s2
ffffffffc0208b26:	85a6                	mv	a1,s1
ffffffffc0208b28:	07800513          	li	a0,120
ffffffffc0208b2c:	9902                	jalr	s2
ffffffffc0208b2e:	0aa1                	addi	s5,s5,8
ffffffffc0208b30:	ff8ab603          	ld	a2,-8(s5)
ffffffffc0208b34:	6782                	ld	a5,0(sp)
ffffffffc0208b36:	46c1                	li	a3,16
ffffffffc0208b38:	2781                	sext.w	a5,a5
ffffffffc0208b3a:	876e                	mv	a4,s11
ffffffffc0208b3c:	85a6                	mv	a1,s1
ffffffffc0208b3e:	854a                	mv	a0,s2
ffffffffc0208b40:	d4fff0ef          	jal	ra,ffffffffc020888e <printnum>
ffffffffc0208b44:	bbc5                	j	ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208b46:	00144603          	lbu	a2,1(s0)
ffffffffc0208b4a:	2805                	addiw	a6,a6,1
ffffffffc0208b4c:	846a                	mv	s0,s10
ffffffffc0208b4e:	b515                	j	ffffffffc0208972 <vprintfmt+0x78>
ffffffffc0208b50:	00144603          	lbu	a2,1(s0)
ffffffffc0208b54:	4985                	li	s3,1
ffffffffc0208b56:	846a                	mv	s0,s10
ffffffffc0208b58:	bd29                	j	ffffffffc0208972 <vprintfmt+0x78>
ffffffffc0208b5a:	85a6                	mv	a1,s1
ffffffffc0208b5c:	02500513          	li	a0,37
ffffffffc0208b60:	9902                	jalr	s2
ffffffffc0208b62:	bbc9                	j	ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208b64:	4705                	li	a4,1
ffffffffc0208b66:	008a8593          	addi	a1,s5,8
ffffffffc0208b6a:	01074463          	blt	a4,a6,ffffffffc0208b72 <vprintfmt+0x278>
ffffffffc0208b6e:	08080d63          	beqz	a6,ffffffffc0208c08 <vprintfmt+0x30e>
ffffffffc0208b72:	000ab603          	ld	a2,0(s5)
ffffffffc0208b76:	46a9                	li	a3,10
ffffffffc0208b78:	8aae                	mv	s5,a1
ffffffffc0208b7a:	bf7d                	j	ffffffffc0208b38 <vprintfmt+0x23e>
ffffffffc0208b7c:	85a6                	mv	a1,s1
ffffffffc0208b7e:	02500513          	li	a0,37
ffffffffc0208b82:	9902                	jalr	s2
ffffffffc0208b84:	fff44703          	lbu	a4,-1(s0)
ffffffffc0208b88:	02500793          	li	a5,37
ffffffffc0208b8c:	8d22                	mv	s10,s0
ffffffffc0208b8e:	daf703e3          	beq	a4,a5,ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208b92:	02500713          	li	a4,37
ffffffffc0208b96:	1d7d                	addi	s10,s10,-1
ffffffffc0208b98:	fffd4783          	lbu	a5,-1(s10)
ffffffffc0208b9c:	fee79de3          	bne	a5,a4,ffffffffc0208b96 <vprintfmt+0x29c>
ffffffffc0208ba0:	bb51                	j	ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208ba2:	00003617          	auipc	a2,0x3
ffffffffc0208ba6:	efe60613          	addi	a2,a2,-258 # ffffffffc020baa0 <error_string+0x1a8>
ffffffffc0208baa:	85a6                	mv	a1,s1
ffffffffc0208bac:	854a                	mv	a0,s2
ffffffffc0208bae:	0ac000ef          	jal	ra,ffffffffc0208c5a <printfmt>
ffffffffc0208bb2:	b349                	j	ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208bb4:	00003617          	auipc	a2,0x3
ffffffffc0208bb8:	ee460613          	addi	a2,a2,-284 # ffffffffc020ba98 <error_string+0x1a0>
ffffffffc0208bbc:	00003417          	auipc	s0,0x3
ffffffffc0208bc0:	edd40413          	addi	s0,s0,-291 # ffffffffc020ba99 <error_string+0x1a1>
ffffffffc0208bc4:	8532                	mv	a0,a2
ffffffffc0208bc6:	85e6                	mv	a1,s9
ffffffffc0208bc8:	e032                	sd	a2,0(sp)
ffffffffc0208bca:	e43e                	sd	a5,8(sp)
ffffffffc0208bcc:	c19ff0ef          	jal	ra,ffffffffc02087e4 <strnlen>
ffffffffc0208bd0:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0208bd4:	6602                	ld	a2,0(sp)
ffffffffc0208bd6:	01b05d63          	blez	s11,ffffffffc0208bf0 <vprintfmt+0x2f6>
ffffffffc0208bda:	67a2                	ld	a5,8(sp)
ffffffffc0208bdc:	2781                	sext.w	a5,a5
ffffffffc0208bde:	e43e                	sd	a5,8(sp)
ffffffffc0208be0:	6522                	ld	a0,8(sp)
ffffffffc0208be2:	85a6                	mv	a1,s1
ffffffffc0208be4:	e032                	sd	a2,0(sp)
ffffffffc0208be6:	3dfd                	addiw	s11,s11,-1
ffffffffc0208be8:	9902                	jalr	s2
ffffffffc0208bea:	6602                	ld	a2,0(sp)
ffffffffc0208bec:	fe0d9ae3          	bnez	s11,ffffffffc0208be0 <vprintfmt+0x2e6>
ffffffffc0208bf0:	00064783          	lbu	a5,0(a2)
ffffffffc0208bf4:	0007851b          	sext.w	a0,a5
ffffffffc0208bf8:	ec0510e3          	bnez	a0,ffffffffc0208ab8 <vprintfmt+0x1be>
ffffffffc0208bfc:	bb25                	j	ffffffffc0208934 <vprintfmt+0x3a>
ffffffffc0208bfe:	000ae603          	lwu	a2,0(s5)
ffffffffc0208c02:	46a1                	li	a3,8
ffffffffc0208c04:	8aae                	mv	s5,a1
ffffffffc0208c06:	bf0d                	j	ffffffffc0208b38 <vprintfmt+0x23e>
ffffffffc0208c08:	000ae603          	lwu	a2,0(s5)
ffffffffc0208c0c:	46a9                	li	a3,10
ffffffffc0208c0e:	8aae                	mv	s5,a1
ffffffffc0208c10:	b725                	j	ffffffffc0208b38 <vprintfmt+0x23e>
ffffffffc0208c12:	000aa403          	lw	s0,0(s5)
ffffffffc0208c16:	bd35                	j	ffffffffc0208a52 <vprintfmt+0x158>
ffffffffc0208c18:	000ae603          	lwu	a2,0(s5)
ffffffffc0208c1c:	46c1                	li	a3,16
ffffffffc0208c1e:	8aae                	mv	s5,a1
ffffffffc0208c20:	bf21                	j	ffffffffc0208b38 <vprintfmt+0x23e>
ffffffffc0208c22:	9902                	jalr	s2
ffffffffc0208c24:	bd45                	j	ffffffffc0208ad4 <vprintfmt+0x1da>
ffffffffc0208c26:	85a6                	mv	a1,s1
ffffffffc0208c28:	02d00513          	li	a0,45
ffffffffc0208c2c:	e03e                	sd	a5,0(sp)
ffffffffc0208c2e:	9902                	jalr	s2
ffffffffc0208c30:	8ace                	mv	s5,s3
ffffffffc0208c32:	40800633          	neg	a2,s0
ffffffffc0208c36:	46a9                	li	a3,10
ffffffffc0208c38:	6782                	ld	a5,0(sp)
ffffffffc0208c3a:	bdfd                	j	ffffffffc0208b38 <vprintfmt+0x23e>
ffffffffc0208c3c:	01b05663          	blez	s11,ffffffffc0208c48 <vprintfmt+0x34e>
ffffffffc0208c40:	02d00693          	li	a3,45
ffffffffc0208c44:	f6d798e3          	bne	a5,a3,ffffffffc0208bb4 <vprintfmt+0x2ba>
ffffffffc0208c48:	00003417          	auipc	s0,0x3
ffffffffc0208c4c:	e5140413          	addi	s0,s0,-431 # ffffffffc020ba99 <error_string+0x1a1>
ffffffffc0208c50:	02800513          	li	a0,40
ffffffffc0208c54:	02800793          	li	a5,40
ffffffffc0208c58:	b585                	j	ffffffffc0208ab8 <vprintfmt+0x1be>

ffffffffc0208c5a <printfmt>:
ffffffffc0208c5a:	715d                	addi	sp,sp,-80
ffffffffc0208c5c:	02810313          	addi	t1,sp,40
ffffffffc0208c60:	f436                	sd	a3,40(sp)
ffffffffc0208c62:	869a                	mv	a3,t1
ffffffffc0208c64:	ec06                	sd	ra,24(sp)
ffffffffc0208c66:	f83a                	sd	a4,48(sp)
ffffffffc0208c68:	fc3e                	sd	a5,56(sp)
ffffffffc0208c6a:	e0c2                	sd	a6,64(sp)
ffffffffc0208c6c:	e4c6                	sd	a7,72(sp)
ffffffffc0208c6e:	e41a                	sd	t1,8(sp)
ffffffffc0208c70:	c8bff0ef          	jal	ra,ffffffffc02088fa <vprintfmt>
ffffffffc0208c74:	60e2                	ld	ra,24(sp)
ffffffffc0208c76:	6161                	addi	sp,sp,80
ffffffffc0208c78:	8082                	ret

ffffffffc0208c7a <hash32>:
ffffffffc0208c7a:	9e3707b7          	lui	a5,0x9e370
ffffffffc0208c7e:	2785                	addiw	a5,a5,1
ffffffffc0208c80:	02f5053b          	mulw	a0,a0,a5
ffffffffc0208c84:	02000793          	li	a5,32
ffffffffc0208c88:	40b785bb          	subw	a1,a5,a1
ffffffffc0208c8c:	00b5553b          	srlw	a0,a0,a1
ffffffffc0208c90:	8082                	ret
