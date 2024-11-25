
bin/kernel:     file format elf64-littleriscv


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
ffffffffc0200042:	f9a60613          	addi	a2,a2,-102 # ffffffffc023cfd8 <end>
ffffffffc0200046:	1141                	addi	sp,sp,-16
ffffffffc0200048:	8e09                	sub	a2,a2,a0
ffffffffc020004a:	4581                	li	a1,0
ffffffffc020004c:	e406                	sd	ra,8(sp)
ffffffffc020004e:	417080ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc0200052:	528000ef          	jal	ra,ffffffffc020057a <cons_init>
ffffffffc0200056:	00009597          	auipc	a1,0x9
ffffffffc020005a:	c3a58593          	addi	a1,a1,-966 # ffffffffc0208c90 <etext+0x2>
ffffffffc020005e:	00009517          	auipc	a0,0x9
ffffffffc0200062:	c5250513          	addi	a0,a0,-942 # ffffffffc0208cb0 <etext+0x22>
ffffffffc0200066:	12c000ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020006a:	1ae000ef          	jal	ra,ffffffffc0200218 <print_kerninfo>
ffffffffc020006e:	358020ef          	jal	ra,ffffffffc02023c6 <pmm_init>
ffffffffc0200072:	5de000ef          	jal	ra,ffffffffc0200650 <pic_init>
ffffffffc0200076:	5dc000ef          	jal	ra,ffffffffc0200652 <idt_init>
ffffffffc020007a:	7b9030ef          	jal	ra,ffffffffc0204032 <vmm_init>
ffffffffc020007e:	466080ef          	jal	ra,ffffffffc02084e4 <sched_init>
ffffffffc0200082:	089050ef          	jal	ra,ffffffffc020590a <proc_init>
ffffffffc0200086:	566000ef          	jal	ra,ffffffffc02005ec <ide_init>
ffffffffc020008a:	77b020ef          	jal	ra,ffffffffc0203004 <swap_init>
ffffffffc020008e:	4a4000ef          	jal	ra,ffffffffc0200532 <clock_init>
ffffffffc0200092:	5b2000ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0200096:	1c1050ef          	jal	ra,ffffffffc0205a56 <cpu_idle>

ffffffffc020009a <readline>:
ffffffffc020009a:	715d                	addi	sp,sp,-80
ffffffffc020009c:	e486                	sd	ra,72(sp)
ffffffffc020009e:	e0a2                	sd	s0,64(sp)
ffffffffc02000a0:	fc26                	sd	s1,56(sp)
ffffffffc02000a2:	f84a                	sd	s2,48(sp)
ffffffffc02000a4:	f44e                	sd	s3,40(sp)
ffffffffc02000a6:	f052                	sd	s4,32(sp)
ffffffffc02000a8:	ec56                	sd	s5,24(sp)
ffffffffc02000aa:	e85a                	sd	s6,16(sp)
ffffffffc02000ac:	e45e                	sd	s7,8(sp)
ffffffffc02000ae:	c901                	beqz	a0,ffffffffc02000be <readline+0x24>
ffffffffc02000b0:	85aa                	mv	a1,a0
ffffffffc02000b2:	00009517          	auipc	a0,0x9
ffffffffc02000b6:	c0650513          	addi	a0,a0,-1018 # ffffffffc0208cb8 <etext+0x2a>
ffffffffc02000ba:	0d8000ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02000be:	4481                	li	s1,0
ffffffffc02000c0:	497d                	li	s2,31
ffffffffc02000c2:	49a1                	li	s3,8
ffffffffc02000c4:	4aa9                	li	s5,10
ffffffffc02000c6:	4b35                	li	s6,13
ffffffffc02000c8:	00032b97          	auipc	s7,0x32
ffffffffc02000cc:	950b8b93          	addi	s7,s7,-1712 # ffffffffc0231a18 <edata>
ffffffffc02000d0:	3fe00a13          	li	s4,1022
ffffffffc02000d4:	134000ef          	jal	ra,ffffffffc0200208 <getchar>
ffffffffc02000d8:	842a                	mv	s0,a0
ffffffffc02000da:	00054b63          	bltz	a0,ffffffffc02000f0 <readline+0x56>
ffffffffc02000de:	00a95b63          	bge	s2,a0,ffffffffc02000f4 <readline+0x5a>
ffffffffc02000e2:	029a5463          	bge	s4,s1,ffffffffc020010a <readline+0x70>
ffffffffc02000e6:	122000ef          	jal	ra,ffffffffc0200208 <getchar>
ffffffffc02000ea:	842a                	mv	s0,a0
ffffffffc02000ec:	fe0559e3          	bgez	a0,ffffffffc02000de <readline+0x44>
ffffffffc02000f0:	4501                	li	a0,0
ffffffffc02000f2:	a099                	j	ffffffffc0200138 <readline+0x9e>
ffffffffc02000f4:	03341463          	bne	s0,s3,ffffffffc020011c <readline+0x82>
ffffffffc02000f8:	e8b9                	bnez	s1,ffffffffc020014e <readline+0xb4>
ffffffffc02000fa:	10e000ef          	jal	ra,ffffffffc0200208 <getchar>
ffffffffc02000fe:	842a                	mv	s0,a0
ffffffffc0200100:	fe0548e3          	bltz	a0,ffffffffc02000f0 <readline+0x56>
ffffffffc0200104:	fea958e3          	bge	s2,a0,ffffffffc02000f4 <readline+0x5a>
ffffffffc0200108:	4481                	li	s1,0
ffffffffc020010a:	8522                	mv	a0,s0
ffffffffc020010c:	0ba000ef          	jal	ra,ffffffffc02001c6 <cputchar>
ffffffffc0200110:	009b87b3          	add	a5,s7,s1
ffffffffc0200114:	00878023          	sb	s0,0(a5)
ffffffffc0200118:	2485                	addiw	s1,s1,1
ffffffffc020011a:	bf6d                	j	ffffffffc02000d4 <readline+0x3a>
ffffffffc020011c:	01540463          	beq	s0,s5,ffffffffc0200124 <readline+0x8a>
ffffffffc0200120:	fb641ae3          	bne	s0,s6,ffffffffc02000d4 <readline+0x3a>
ffffffffc0200124:	8522                	mv	a0,s0
ffffffffc0200126:	0a0000ef          	jal	ra,ffffffffc02001c6 <cputchar>
ffffffffc020012a:	00032517          	auipc	a0,0x32
ffffffffc020012e:	8ee50513          	addi	a0,a0,-1810 # ffffffffc0231a18 <edata>
ffffffffc0200132:	94aa                	add	s1,s1,a0
ffffffffc0200134:	00048023          	sb	zero,0(s1)
ffffffffc0200138:	60a6                	ld	ra,72(sp)
ffffffffc020013a:	6406                	ld	s0,64(sp)
ffffffffc020013c:	74e2                	ld	s1,56(sp)
ffffffffc020013e:	7942                	ld	s2,48(sp)
ffffffffc0200140:	79a2                	ld	s3,40(sp)
ffffffffc0200142:	7a02                	ld	s4,32(sp)
ffffffffc0200144:	6ae2                	ld	s5,24(sp)
ffffffffc0200146:	6b42                	ld	s6,16(sp)
ffffffffc0200148:	6ba2                	ld	s7,8(sp)
ffffffffc020014a:	6161                	addi	sp,sp,80
ffffffffc020014c:	8082                	ret
ffffffffc020014e:	4521                	li	a0,8
ffffffffc0200150:	076000ef          	jal	ra,ffffffffc02001c6 <cputchar>
ffffffffc0200154:	34fd                	addiw	s1,s1,-1
ffffffffc0200156:	bfbd                	j	ffffffffc02000d4 <readline+0x3a>

ffffffffc0200158 <cputch>:
ffffffffc0200158:	1141                	addi	sp,sp,-16
ffffffffc020015a:	e022                	sd	s0,0(sp)
ffffffffc020015c:	e406                	sd	ra,8(sp)
ffffffffc020015e:	842e                	mv	s0,a1
ffffffffc0200160:	41c000ef          	jal	ra,ffffffffc020057c <cons_putc>
ffffffffc0200164:	401c                	lw	a5,0(s0)
ffffffffc0200166:	60a2                	ld	ra,8(sp)
ffffffffc0200168:	2785                	addiw	a5,a5,1
ffffffffc020016a:	c01c                	sw	a5,0(s0)
ffffffffc020016c:	6402                	ld	s0,0(sp)
ffffffffc020016e:	0141                	addi	sp,sp,16
ffffffffc0200170:	8082                	ret

ffffffffc0200172 <vcprintf>:
ffffffffc0200172:	1101                	addi	sp,sp,-32
ffffffffc0200174:	86ae                	mv	a3,a1
ffffffffc0200176:	862a                	mv	a2,a0
ffffffffc0200178:	006c                	addi	a1,sp,12
ffffffffc020017a:	00000517          	auipc	a0,0x0
ffffffffc020017e:	fde50513          	addi	a0,a0,-34 # ffffffffc0200158 <cputch>
ffffffffc0200182:	ec06                	sd	ra,24(sp)
ffffffffc0200184:	c602                	sw	zero,12(sp)
ffffffffc0200186:	6c0080ef          	jal	ra,ffffffffc0208846 <vprintfmt>
ffffffffc020018a:	60e2                	ld	ra,24(sp)
ffffffffc020018c:	4532                	lw	a0,12(sp)
ffffffffc020018e:	6105                	addi	sp,sp,32
ffffffffc0200190:	8082                	ret

ffffffffc0200192 <cprintf>:
ffffffffc0200192:	711d                	addi	sp,sp,-96
ffffffffc0200194:	02810313          	addi	t1,sp,40 # ffffffffc020e028 <boot_page_table_sv39+0x28>
ffffffffc0200198:	f42e                	sd	a1,40(sp)
ffffffffc020019a:	f832                	sd	a2,48(sp)
ffffffffc020019c:	fc36                	sd	a3,56(sp)
ffffffffc020019e:	862a                	mv	a2,a0
ffffffffc02001a0:	004c                	addi	a1,sp,4
ffffffffc02001a2:	00000517          	auipc	a0,0x0
ffffffffc02001a6:	fb650513          	addi	a0,a0,-74 # ffffffffc0200158 <cputch>
ffffffffc02001aa:	869a                	mv	a3,t1
ffffffffc02001ac:	ec06                	sd	ra,24(sp)
ffffffffc02001ae:	e0ba                	sd	a4,64(sp)
ffffffffc02001b0:	e4be                	sd	a5,72(sp)
ffffffffc02001b2:	e8c2                	sd	a6,80(sp)
ffffffffc02001b4:	ecc6                	sd	a7,88(sp)
ffffffffc02001b6:	e41a                	sd	t1,8(sp)
ffffffffc02001b8:	c202                	sw	zero,4(sp)
ffffffffc02001ba:	68c080ef          	jal	ra,ffffffffc0208846 <vprintfmt>
ffffffffc02001be:	60e2                	ld	ra,24(sp)
ffffffffc02001c0:	4512                	lw	a0,4(sp)
ffffffffc02001c2:	6125                	addi	sp,sp,96
ffffffffc02001c4:	8082                	ret

ffffffffc02001c6 <cputchar>:
ffffffffc02001c6:	ae5d                	j	ffffffffc020057c <cons_putc>

ffffffffc02001c8 <cputs>:
ffffffffc02001c8:	1101                	addi	sp,sp,-32
ffffffffc02001ca:	e822                	sd	s0,16(sp)
ffffffffc02001cc:	ec06                	sd	ra,24(sp)
ffffffffc02001ce:	e426                	sd	s1,8(sp)
ffffffffc02001d0:	842a                	mv	s0,a0
ffffffffc02001d2:	00054503          	lbu	a0,0(a0)
ffffffffc02001d6:	c51d                	beqz	a0,ffffffffc0200204 <cputs+0x3c>
ffffffffc02001d8:	0405                	addi	s0,s0,1
ffffffffc02001da:	4485                	li	s1,1
ffffffffc02001dc:	9c81                	subw	s1,s1,s0
ffffffffc02001de:	39e000ef          	jal	ra,ffffffffc020057c <cons_putc>
ffffffffc02001e2:	008487bb          	addw	a5,s1,s0
ffffffffc02001e6:	0405                	addi	s0,s0,1
ffffffffc02001e8:	fff44503          	lbu	a0,-1(s0)
ffffffffc02001ec:	f96d                	bnez	a0,ffffffffc02001de <cputs+0x16>
ffffffffc02001ee:	0017841b          	addiw	s0,a5,1
ffffffffc02001f2:	4529                	li	a0,10
ffffffffc02001f4:	388000ef          	jal	ra,ffffffffc020057c <cons_putc>
ffffffffc02001f8:	8522                	mv	a0,s0
ffffffffc02001fa:	60e2                	ld	ra,24(sp)
ffffffffc02001fc:	6442                	ld	s0,16(sp)
ffffffffc02001fe:	64a2                	ld	s1,8(sp)
ffffffffc0200200:	6105                	addi	sp,sp,32
ffffffffc0200202:	8082                	ret
ffffffffc0200204:	4405                	li	s0,1
ffffffffc0200206:	b7f5                	j	ffffffffc02001f2 <cputs+0x2a>

ffffffffc0200208 <getchar>:
ffffffffc0200208:	1141                	addi	sp,sp,-16
ffffffffc020020a:	e406                	sd	ra,8(sp)
ffffffffc020020c:	3a4000ef          	jal	ra,ffffffffc02005b0 <cons_getc>
ffffffffc0200210:	dd75                	beqz	a0,ffffffffc020020c <getchar+0x4>
ffffffffc0200212:	60a2                	ld	ra,8(sp)
ffffffffc0200214:	0141                	addi	sp,sp,16
ffffffffc0200216:	8082                	ret

ffffffffc0200218 <print_kerninfo>:
ffffffffc0200218:	1141                	addi	sp,sp,-16
ffffffffc020021a:	00009517          	auipc	a0,0x9
ffffffffc020021e:	ad650513          	addi	a0,a0,-1322 # ffffffffc0208cf0 <etext+0x62>
ffffffffc0200222:	e406                	sd	ra,8(sp)
ffffffffc0200224:	f6fff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200228:	00000597          	auipc	a1,0x0
ffffffffc020022c:	e0e58593          	addi	a1,a1,-498 # ffffffffc0200036 <kern_init>
ffffffffc0200230:	00009517          	auipc	a0,0x9
ffffffffc0200234:	ae050513          	addi	a0,a0,-1312 # ffffffffc0208d10 <etext+0x82>
ffffffffc0200238:	f5bff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020023c:	00009597          	auipc	a1,0x9
ffffffffc0200240:	a5258593          	addi	a1,a1,-1454 # ffffffffc0208c8e <etext>
ffffffffc0200244:	00009517          	auipc	a0,0x9
ffffffffc0200248:	aec50513          	addi	a0,a0,-1300 # ffffffffc0208d30 <etext+0xa2>
ffffffffc020024c:	f47ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200250:	00031597          	auipc	a1,0x31
ffffffffc0200254:	7c858593          	addi	a1,a1,1992 # ffffffffc0231a18 <edata>
ffffffffc0200258:	00009517          	auipc	a0,0x9
ffffffffc020025c:	af850513          	addi	a0,a0,-1288 # ffffffffc0208d50 <etext+0xc2>
ffffffffc0200260:	f33ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200264:	0003d597          	auipc	a1,0x3d
ffffffffc0200268:	d7458593          	addi	a1,a1,-652 # ffffffffc023cfd8 <end>
ffffffffc020026c:	00009517          	auipc	a0,0x9
ffffffffc0200270:	b0450513          	addi	a0,a0,-1276 # ffffffffc0208d70 <etext+0xe2>
ffffffffc0200274:	f1fff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200278:	0003d597          	auipc	a1,0x3d
ffffffffc020027c:	15f58593          	addi	a1,a1,351 # ffffffffc023d3d7 <end+0x3ff>
ffffffffc0200280:	00000797          	auipc	a5,0x0
ffffffffc0200284:	db678793          	addi	a5,a5,-586 # ffffffffc0200036 <kern_init>
ffffffffc0200288:	40f587b3          	sub	a5,a1,a5
ffffffffc020028c:	43f7d593          	srai	a1,a5,0x3f
ffffffffc0200290:	60a2                	ld	ra,8(sp)
ffffffffc0200292:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200296:	95be                	add	a1,a1,a5
ffffffffc0200298:	85a9                	srai	a1,a1,0xa
ffffffffc020029a:	00009517          	auipc	a0,0x9
ffffffffc020029e:	af650513          	addi	a0,a0,-1290 # ffffffffc0208d90 <etext+0x102>
ffffffffc02002a2:	0141                	addi	sp,sp,16
ffffffffc02002a4:	b5fd                	j	ffffffffc0200192 <cprintf>

ffffffffc02002a6 <print_stackframe>:
ffffffffc02002a6:	1141                	addi	sp,sp,-16
ffffffffc02002a8:	00009617          	auipc	a2,0x9
ffffffffc02002ac:	a1860613          	addi	a2,a2,-1512 # ffffffffc0208cc0 <etext+0x32>
ffffffffc02002b0:	05b00593          	li	a1,91
ffffffffc02002b4:	00009517          	auipc	a0,0x9
ffffffffc02002b8:	a2450513          	addi	a0,a0,-1500 # ffffffffc0208cd8 <etext+0x4a>
ffffffffc02002bc:	e406                	sd	ra,8(sp)
ffffffffc02002be:	1c6000ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02002c2 <mon_help>:
ffffffffc02002c2:	1141                	addi	sp,sp,-16
ffffffffc02002c4:	00009617          	auipc	a2,0x9
ffffffffc02002c8:	bdc60613          	addi	a2,a2,-1060 # ffffffffc0208ea0 <commands+0xe0>
ffffffffc02002cc:	00009597          	auipc	a1,0x9
ffffffffc02002d0:	bf458593          	addi	a1,a1,-1036 # ffffffffc0208ec0 <commands+0x100>
ffffffffc02002d4:	00009517          	auipc	a0,0x9
ffffffffc02002d8:	bf450513          	addi	a0,a0,-1036 # ffffffffc0208ec8 <commands+0x108>
ffffffffc02002dc:	e406                	sd	ra,8(sp)
ffffffffc02002de:	eb5ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02002e2:	00009617          	auipc	a2,0x9
ffffffffc02002e6:	bf660613          	addi	a2,a2,-1034 # ffffffffc0208ed8 <commands+0x118>
ffffffffc02002ea:	00009597          	auipc	a1,0x9
ffffffffc02002ee:	c1658593          	addi	a1,a1,-1002 # ffffffffc0208f00 <commands+0x140>
ffffffffc02002f2:	00009517          	auipc	a0,0x9
ffffffffc02002f6:	bd650513          	addi	a0,a0,-1066 # ffffffffc0208ec8 <commands+0x108>
ffffffffc02002fa:	e99ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02002fe:	00009617          	auipc	a2,0x9
ffffffffc0200302:	c1260613          	addi	a2,a2,-1006 # ffffffffc0208f10 <commands+0x150>
ffffffffc0200306:	00009597          	auipc	a1,0x9
ffffffffc020030a:	c2a58593          	addi	a1,a1,-982 # ffffffffc0208f30 <commands+0x170>
ffffffffc020030e:	00009517          	auipc	a0,0x9
ffffffffc0200312:	bba50513          	addi	a0,a0,-1094 # ffffffffc0208ec8 <commands+0x108>
ffffffffc0200316:	e7dff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020031a:	60a2                	ld	ra,8(sp)
ffffffffc020031c:	4501                	li	a0,0
ffffffffc020031e:	0141                	addi	sp,sp,16
ffffffffc0200320:	8082                	ret

ffffffffc0200322 <mon_kerninfo>:
ffffffffc0200322:	1141                	addi	sp,sp,-16
ffffffffc0200324:	e406                	sd	ra,8(sp)
ffffffffc0200326:	ef3ff0ef          	jal	ra,ffffffffc0200218 <print_kerninfo>
ffffffffc020032a:	60a2                	ld	ra,8(sp)
ffffffffc020032c:	4501                	li	a0,0
ffffffffc020032e:	0141                	addi	sp,sp,16
ffffffffc0200330:	8082                	ret

ffffffffc0200332 <mon_backtrace>:
ffffffffc0200332:	1141                	addi	sp,sp,-16
ffffffffc0200334:	e406                	sd	ra,8(sp)
ffffffffc0200336:	f71ff0ef          	jal	ra,ffffffffc02002a6 <print_stackframe>
ffffffffc020033a:	60a2                	ld	ra,8(sp)
ffffffffc020033c:	4501                	li	a0,0
ffffffffc020033e:	0141                	addi	sp,sp,16
ffffffffc0200340:	8082                	ret

ffffffffc0200342 <kmonitor>:
ffffffffc0200342:	7115                	addi	sp,sp,-224
ffffffffc0200344:	e962                	sd	s8,144(sp)
ffffffffc0200346:	8c2a                	mv	s8,a0
ffffffffc0200348:	00009517          	auipc	a0,0x9
ffffffffc020034c:	ac050513          	addi	a0,a0,-1344 # ffffffffc0208e08 <commands+0x48>
ffffffffc0200350:	ed86                	sd	ra,216(sp)
ffffffffc0200352:	e9a2                	sd	s0,208(sp)
ffffffffc0200354:	e5a6                	sd	s1,200(sp)
ffffffffc0200356:	e1ca                	sd	s2,192(sp)
ffffffffc0200358:	fd4e                	sd	s3,184(sp)
ffffffffc020035a:	f952                	sd	s4,176(sp)
ffffffffc020035c:	f556                	sd	s5,168(sp)
ffffffffc020035e:	f15a                	sd	s6,160(sp)
ffffffffc0200360:	ed5e                	sd	s7,152(sp)
ffffffffc0200362:	e566                	sd	s9,136(sp)
ffffffffc0200364:	e16a                	sd	s10,128(sp)
ffffffffc0200366:	e2dff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020036a:	00009517          	auipc	a0,0x9
ffffffffc020036e:	ac650513          	addi	a0,a0,-1338 # ffffffffc0208e30 <commands+0x70>
ffffffffc0200372:	e21ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200376:	000c0563          	beqz	s8,ffffffffc0200380 <kmonitor+0x3e>
ffffffffc020037a:	8562                	mv	a0,s8
ffffffffc020037c:	4bc000ef          	jal	ra,ffffffffc0200838 <print_trapframe>
ffffffffc0200380:	00009c97          	auipc	s9,0x9
ffffffffc0200384:	a40c8c93          	addi	s9,s9,-1472 # ffffffffc0208dc0 <commands>
ffffffffc0200388:	00009997          	auipc	s3,0x9
ffffffffc020038c:	ad098993          	addi	s3,s3,-1328 # ffffffffc0208e58 <commands+0x98>
ffffffffc0200390:	00009917          	auipc	s2,0x9
ffffffffc0200394:	ad090913          	addi	s2,s2,-1328 # ffffffffc0208e60 <commands+0xa0>
ffffffffc0200398:	4a3d                	li	s4,15
ffffffffc020039a:	00009b17          	auipc	s6,0x9
ffffffffc020039e:	aceb0b13          	addi	s6,s6,-1330 # ffffffffc0208e68 <commands+0xa8>
ffffffffc02003a2:	00009a97          	auipc	s5,0x9
ffffffffc02003a6:	b1ea8a93          	addi	s5,s5,-1250 # ffffffffc0208ec0 <commands+0x100>
ffffffffc02003aa:	4b8d                	li	s7,3
ffffffffc02003ac:	854e                	mv	a0,s3
ffffffffc02003ae:	cedff0ef          	jal	ra,ffffffffc020009a <readline>
ffffffffc02003b2:	842a                	mv	s0,a0
ffffffffc02003b4:	dd65                	beqz	a0,ffffffffc02003ac <kmonitor+0x6a>
ffffffffc02003b6:	00054583          	lbu	a1,0(a0)
ffffffffc02003ba:	4481                	li	s1,0
ffffffffc02003bc:	c999                	beqz	a1,ffffffffc02003d2 <kmonitor+0x90>
ffffffffc02003be:	854a                	mv	a0,s2
ffffffffc02003c0:	087080ef          	jal	ra,ffffffffc0208c46 <strchr>
ffffffffc02003c4:	c925                	beqz	a0,ffffffffc0200434 <kmonitor+0xf2>
ffffffffc02003c6:	00144583          	lbu	a1,1(s0)
ffffffffc02003ca:	00040023          	sb	zero,0(s0)
ffffffffc02003ce:	0405                	addi	s0,s0,1
ffffffffc02003d0:	f5fd                	bnez	a1,ffffffffc02003be <kmonitor+0x7c>
ffffffffc02003d2:	dce9                	beqz	s1,ffffffffc02003ac <kmonitor+0x6a>
ffffffffc02003d4:	6582                	ld	a1,0(sp)
ffffffffc02003d6:	00009d17          	auipc	s10,0x9
ffffffffc02003da:	9ead0d13          	addi	s10,s10,-1558 # ffffffffc0208dc0 <commands>
ffffffffc02003de:	8556                	mv	a0,s5
ffffffffc02003e0:	4401                	li	s0,0
ffffffffc02003e2:	0d61                	addi	s10,s10,24
ffffffffc02003e4:	039080ef          	jal	ra,ffffffffc0208c1c <strcmp>
ffffffffc02003e8:	c919                	beqz	a0,ffffffffc02003fe <kmonitor+0xbc>
ffffffffc02003ea:	2405                	addiw	s0,s0,1
ffffffffc02003ec:	09740463          	beq	s0,s7,ffffffffc0200474 <kmonitor+0x132>
ffffffffc02003f0:	000d3503          	ld	a0,0(s10)
ffffffffc02003f4:	6582                	ld	a1,0(sp)
ffffffffc02003f6:	0d61                	addi	s10,s10,24
ffffffffc02003f8:	025080ef          	jal	ra,ffffffffc0208c1c <strcmp>
ffffffffc02003fc:	f57d                	bnez	a0,ffffffffc02003ea <kmonitor+0xa8>
ffffffffc02003fe:	00141793          	slli	a5,s0,0x1
ffffffffc0200402:	97a2                	add	a5,a5,s0
ffffffffc0200404:	078e                	slli	a5,a5,0x3
ffffffffc0200406:	97e6                	add	a5,a5,s9
ffffffffc0200408:	6b9c                	ld	a5,16(a5)
ffffffffc020040a:	8662                	mv	a2,s8
ffffffffc020040c:	002c                	addi	a1,sp,8
ffffffffc020040e:	fff4851b          	addiw	a0,s1,-1
ffffffffc0200412:	9782                	jalr	a5
ffffffffc0200414:	f8055ce3          	bgez	a0,ffffffffc02003ac <kmonitor+0x6a>
ffffffffc0200418:	60ee                	ld	ra,216(sp)
ffffffffc020041a:	644e                	ld	s0,208(sp)
ffffffffc020041c:	64ae                	ld	s1,200(sp)
ffffffffc020041e:	690e                	ld	s2,192(sp)
ffffffffc0200420:	79ea                	ld	s3,184(sp)
ffffffffc0200422:	7a4a                	ld	s4,176(sp)
ffffffffc0200424:	7aaa                	ld	s5,168(sp)
ffffffffc0200426:	7b0a                	ld	s6,160(sp)
ffffffffc0200428:	6bea                	ld	s7,152(sp)
ffffffffc020042a:	6c4a                	ld	s8,144(sp)
ffffffffc020042c:	6caa                	ld	s9,136(sp)
ffffffffc020042e:	6d0a                	ld	s10,128(sp)
ffffffffc0200430:	612d                	addi	sp,sp,224
ffffffffc0200432:	8082                	ret
ffffffffc0200434:	00044783          	lbu	a5,0(s0)
ffffffffc0200438:	dfc9                	beqz	a5,ffffffffc02003d2 <kmonitor+0x90>
ffffffffc020043a:	03448863          	beq	s1,s4,ffffffffc020046a <kmonitor+0x128>
ffffffffc020043e:	00349793          	slli	a5,s1,0x3
ffffffffc0200442:	0118                	addi	a4,sp,128
ffffffffc0200444:	97ba                	add	a5,a5,a4
ffffffffc0200446:	f887b023          	sd	s0,-128(a5)
ffffffffc020044a:	00044583          	lbu	a1,0(s0)
ffffffffc020044e:	2485                	addiw	s1,s1,1
ffffffffc0200450:	e591                	bnez	a1,ffffffffc020045c <kmonitor+0x11a>
ffffffffc0200452:	b749                	j	ffffffffc02003d4 <kmonitor+0x92>
ffffffffc0200454:	0405                	addi	s0,s0,1
ffffffffc0200456:	00044583          	lbu	a1,0(s0)
ffffffffc020045a:	ddad                	beqz	a1,ffffffffc02003d4 <kmonitor+0x92>
ffffffffc020045c:	854a                	mv	a0,s2
ffffffffc020045e:	7e8080ef          	jal	ra,ffffffffc0208c46 <strchr>
ffffffffc0200462:	d96d                	beqz	a0,ffffffffc0200454 <kmonitor+0x112>
ffffffffc0200464:	00044583          	lbu	a1,0(s0)
ffffffffc0200468:	bf91                	j	ffffffffc02003bc <kmonitor+0x7a>
ffffffffc020046a:	45c1                	li	a1,16
ffffffffc020046c:	855a                	mv	a0,s6
ffffffffc020046e:	d25ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200472:	b7f1                	j	ffffffffc020043e <kmonitor+0xfc>
ffffffffc0200474:	6582                	ld	a1,0(sp)
ffffffffc0200476:	00009517          	auipc	a0,0x9
ffffffffc020047a:	a1250513          	addi	a0,a0,-1518 # ffffffffc0208e88 <commands+0xc8>
ffffffffc020047e:	d15ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200482:	b72d                	j	ffffffffc02003ac <kmonitor+0x6a>

ffffffffc0200484 <__panic>:
ffffffffc0200484:	0003d317          	auipc	t1,0x3d
ffffffffc0200488:	9c430313          	addi	t1,t1,-1596 # ffffffffc023ce48 <is_panic>
ffffffffc020048c:	00033303          	ld	t1,0(t1)
ffffffffc0200490:	715d                	addi	sp,sp,-80
ffffffffc0200492:	ec06                	sd	ra,24(sp)
ffffffffc0200494:	e822                	sd	s0,16(sp)
ffffffffc0200496:	f436                	sd	a3,40(sp)
ffffffffc0200498:	f83a                	sd	a4,48(sp)
ffffffffc020049a:	fc3e                	sd	a5,56(sp)
ffffffffc020049c:	e0c2                	sd	a6,64(sp)
ffffffffc020049e:	e4c6                	sd	a7,72(sp)
ffffffffc02004a0:	02031c63          	bnez	t1,ffffffffc02004d8 <__panic+0x54>
ffffffffc02004a4:	4785                	li	a5,1
ffffffffc02004a6:	8432                	mv	s0,a2
ffffffffc02004a8:	0003d717          	auipc	a4,0x3d
ffffffffc02004ac:	9af73023          	sd	a5,-1632(a4) # ffffffffc023ce48 <is_panic>
ffffffffc02004b0:	862e                	mv	a2,a1
ffffffffc02004b2:	103c                	addi	a5,sp,40
ffffffffc02004b4:	85aa                	mv	a1,a0
ffffffffc02004b6:	00009517          	auipc	a0,0x9
ffffffffc02004ba:	a8a50513          	addi	a0,a0,-1398 # ffffffffc0208f40 <commands+0x180>
ffffffffc02004be:	e43e                	sd	a5,8(sp)
ffffffffc02004c0:	cd3ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02004c4:	65a2                	ld	a1,8(sp)
ffffffffc02004c6:	8522                	mv	a0,s0
ffffffffc02004c8:	cabff0ef          	jal	ra,ffffffffc0200172 <vcprintf>
ffffffffc02004cc:	0000a517          	auipc	a0,0xa
ffffffffc02004d0:	a0c50513          	addi	a0,a0,-1524 # ffffffffc0209ed8 <default_pmm_manager+0x510>
ffffffffc02004d4:	cbfff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02004d8:	4501                	li	a0,0
ffffffffc02004da:	4581                	li	a1,0
ffffffffc02004dc:	4601                	li	a2,0
ffffffffc02004de:	48a1                	li	a7,8
ffffffffc02004e0:	00000073          	ecall
ffffffffc02004e4:	166000ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc02004e8:	4501                	li	a0,0
ffffffffc02004ea:	e59ff0ef          	jal	ra,ffffffffc0200342 <kmonitor>
ffffffffc02004ee:	bfed                	j	ffffffffc02004e8 <__panic+0x64>

ffffffffc02004f0 <__warn>:
ffffffffc02004f0:	715d                	addi	sp,sp,-80
ffffffffc02004f2:	e822                	sd	s0,16(sp)
ffffffffc02004f4:	fc3e                	sd	a5,56(sp)
ffffffffc02004f6:	8432                	mv	s0,a2
ffffffffc02004f8:	103c                	addi	a5,sp,40
ffffffffc02004fa:	862e                	mv	a2,a1
ffffffffc02004fc:	85aa                	mv	a1,a0
ffffffffc02004fe:	00009517          	auipc	a0,0x9
ffffffffc0200502:	a6250513          	addi	a0,a0,-1438 # ffffffffc0208f60 <commands+0x1a0>
ffffffffc0200506:	ec06                	sd	ra,24(sp)
ffffffffc0200508:	f436                	sd	a3,40(sp)
ffffffffc020050a:	f83a                	sd	a4,48(sp)
ffffffffc020050c:	e0c2                	sd	a6,64(sp)
ffffffffc020050e:	e4c6                	sd	a7,72(sp)
ffffffffc0200510:	e43e                	sd	a5,8(sp)
ffffffffc0200512:	c81ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200516:	65a2                	ld	a1,8(sp)
ffffffffc0200518:	8522                	mv	a0,s0
ffffffffc020051a:	c59ff0ef          	jal	ra,ffffffffc0200172 <vcprintf>
ffffffffc020051e:	0000a517          	auipc	a0,0xa
ffffffffc0200522:	9ba50513          	addi	a0,a0,-1606 # ffffffffc0209ed8 <default_pmm_manager+0x510>
ffffffffc0200526:	c6dff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020052a:	60e2                	ld	ra,24(sp)
ffffffffc020052c:	6442                	ld	s0,16(sp)
ffffffffc020052e:	6161                	addi	sp,sp,80
ffffffffc0200530:	8082                	ret

ffffffffc0200532 <clock_init>:
ffffffffc0200532:	02000793          	li	a5,32
ffffffffc0200536:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc020053a:	c0102573          	rdtime	a0
ffffffffc020053e:	67e1                	lui	a5,0x18
ffffffffc0200540:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0x15d68>
ffffffffc0200544:	953e                	add	a0,a0,a5
ffffffffc0200546:	4581                	li	a1,0
ffffffffc0200548:	4601                	li	a2,0
ffffffffc020054a:	4881                	li	a7,0
ffffffffc020054c:	00000073          	ecall
ffffffffc0200550:	00009517          	auipc	a0,0x9
ffffffffc0200554:	a3050513          	addi	a0,a0,-1488 # ffffffffc0208f80 <commands+0x1c0>
ffffffffc0200558:	0003d797          	auipc	a5,0x3d
ffffffffc020055c:	9407b823          	sd	zero,-1712(a5) # ffffffffc023cea8 <ticks>
ffffffffc0200560:	b90d                	j	ffffffffc0200192 <cprintf>

ffffffffc0200562 <clock_set_next_event>:
ffffffffc0200562:	c0102573          	rdtime	a0
ffffffffc0200566:	67e1                	lui	a5,0x18
ffffffffc0200568:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0x15d68>
ffffffffc020056c:	953e                	add	a0,a0,a5
ffffffffc020056e:	4581                	li	a1,0
ffffffffc0200570:	4601                	li	a2,0
ffffffffc0200572:	4881                	li	a7,0
ffffffffc0200574:	00000073          	ecall
ffffffffc0200578:	8082                	ret

ffffffffc020057a <cons_init>:
ffffffffc020057a:	8082                	ret

ffffffffc020057c <cons_putc>:
ffffffffc020057c:	100027f3          	csrr	a5,sstatus
ffffffffc0200580:	8b89                	andi	a5,a5,2
ffffffffc0200582:	0ff57513          	andi	a0,a0,255
ffffffffc0200586:	e799                	bnez	a5,ffffffffc0200594 <cons_putc+0x18>
ffffffffc0200588:	4581                	li	a1,0
ffffffffc020058a:	4601                	li	a2,0
ffffffffc020058c:	4885                	li	a7,1
ffffffffc020058e:	00000073          	ecall
ffffffffc0200592:	8082                	ret
ffffffffc0200594:	1101                	addi	sp,sp,-32
ffffffffc0200596:	ec06                	sd	ra,24(sp)
ffffffffc0200598:	e42a                	sd	a0,8(sp)
ffffffffc020059a:	0b0000ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc020059e:	6522                	ld	a0,8(sp)
ffffffffc02005a0:	4581                	li	a1,0
ffffffffc02005a2:	4601                	li	a2,0
ffffffffc02005a4:	4885                	li	a7,1
ffffffffc02005a6:	00000073          	ecall
ffffffffc02005aa:	60e2                	ld	ra,24(sp)
ffffffffc02005ac:	6105                	addi	sp,sp,32
ffffffffc02005ae:	a859                	j	ffffffffc0200644 <intr_enable>

ffffffffc02005b0 <cons_getc>:
ffffffffc02005b0:	100027f3          	csrr	a5,sstatus
ffffffffc02005b4:	8b89                	andi	a5,a5,2
ffffffffc02005b6:	eb89                	bnez	a5,ffffffffc02005c8 <cons_getc+0x18>
ffffffffc02005b8:	4501                	li	a0,0
ffffffffc02005ba:	4581                	li	a1,0
ffffffffc02005bc:	4601                	li	a2,0
ffffffffc02005be:	4889                	li	a7,2
ffffffffc02005c0:	00000073          	ecall
ffffffffc02005c4:	2501                	sext.w	a0,a0
ffffffffc02005c6:	8082                	ret
ffffffffc02005c8:	1101                	addi	sp,sp,-32
ffffffffc02005ca:	ec06                	sd	ra,24(sp)
ffffffffc02005cc:	07e000ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc02005d0:	4501                	li	a0,0
ffffffffc02005d2:	4581                	li	a1,0
ffffffffc02005d4:	4601                	li	a2,0
ffffffffc02005d6:	4889                	li	a7,2
ffffffffc02005d8:	00000073          	ecall
ffffffffc02005dc:	2501                	sext.w	a0,a0
ffffffffc02005de:	e42a                	sd	a0,8(sp)
ffffffffc02005e0:	064000ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc02005e4:	60e2                	ld	ra,24(sp)
ffffffffc02005e6:	6522                	ld	a0,8(sp)
ffffffffc02005e8:	6105                	addi	sp,sp,32
ffffffffc02005ea:	8082                	ret

ffffffffc02005ec <ide_init>:
ffffffffc02005ec:	8082                	ret

ffffffffc02005ee <ide_device_valid>:
ffffffffc02005ee:	00253513          	sltiu	a0,a0,2
ffffffffc02005f2:	8082                	ret

ffffffffc02005f4 <ide_device_size>:
ffffffffc02005f4:	03800513          	li	a0,56
ffffffffc02005f8:	8082                	ret

ffffffffc02005fa <ide_read_secs>:
ffffffffc02005fa:	00032797          	auipc	a5,0x32
ffffffffc02005fe:	81e78793          	addi	a5,a5,-2018 # ffffffffc0231e18 <ide>
ffffffffc0200602:	0095959b          	slliw	a1,a1,0x9
ffffffffc0200606:	1141                	addi	sp,sp,-16
ffffffffc0200608:	8532                	mv	a0,a2
ffffffffc020060a:	95be                	add	a1,a1,a5
ffffffffc020060c:	00969613          	slli	a2,a3,0x9
ffffffffc0200610:	e406                	sd	ra,8(sp)
ffffffffc0200612:	664080ef          	jal	ra,ffffffffc0208c76 <memcpy>
ffffffffc0200616:	60a2                	ld	ra,8(sp)
ffffffffc0200618:	4501                	li	a0,0
ffffffffc020061a:	0141                	addi	sp,sp,16
ffffffffc020061c:	8082                	ret

ffffffffc020061e <ide_write_secs>:
ffffffffc020061e:	8732                	mv	a4,a2
ffffffffc0200620:	0095979b          	slliw	a5,a1,0x9
ffffffffc0200624:	00031517          	auipc	a0,0x31
ffffffffc0200628:	7f450513          	addi	a0,a0,2036 # ffffffffc0231e18 <ide>
ffffffffc020062c:	1141                	addi	sp,sp,-16
ffffffffc020062e:	00969613          	slli	a2,a3,0x9
ffffffffc0200632:	85ba                	mv	a1,a4
ffffffffc0200634:	953e                	add	a0,a0,a5
ffffffffc0200636:	e406                	sd	ra,8(sp)
ffffffffc0200638:	63e080ef          	jal	ra,ffffffffc0208c76 <memcpy>
ffffffffc020063c:	60a2                	ld	ra,8(sp)
ffffffffc020063e:	4501                	li	a0,0
ffffffffc0200640:	0141                	addi	sp,sp,16
ffffffffc0200642:	8082                	ret

ffffffffc0200644 <intr_enable>:
ffffffffc0200644:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200648:	8082                	ret

ffffffffc020064a <intr_disable>:
ffffffffc020064a:	100177f3          	csrrci	a5,sstatus,2
ffffffffc020064e:	8082                	ret

ffffffffc0200650 <pic_init>:
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
ffffffffc0200678:	c5450513          	addi	a0,a0,-940 # ffffffffc02092c8 <commands+0x508>
ffffffffc020067c:	e406                	sd	ra,8(sp)
ffffffffc020067e:	b15ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200682:	640c                	ld	a1,8(s0)
ffffffffc0200684:	00009517          	auipc	a0,0x9
ffffffffc0200688:	c5c50513          	addi	a0,a0,-932 # ffffffffc02092e0 <commands+0x520>
ffffffffc020068c:	b07ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200690:	680c                	ld	a1,16(s0)
ffffffffc0200692:	00009517          	auipc	a0,0x9
ffffffffc0200696:	c6650513          	addi	a0,a0,-922 # ffffffffc02092f8 <commands+0x538>
ffffffffc020069a:	af9ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020069e:	6c0c                	ld	a1,24(s0)
ffffffffc02006a0:	00009517          	auipc	a0,0x9
ffffffffc02006a4:	c7050513          	addi	a0,a0,-912 # ffffffffc0209310 <commands+0x550>
ffffffffc02006a8:	aebff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02006ac:	700c                	ld	a1,32(s0)
ffffffffc02006ae:	00009517          	auipc	a0,0x9
ffffffffc02006b2:	c7a50513          	addi	a0,a0,-902 # ffffffffc0209328 <commands+0x568>
ffffffffc02006b6:	addff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02006ba:	740c                	ld	a1,40(s0)
ffffffffc02006bc:	00009517          	auipc	a0,0x9
ffffffffc02006c0:	c8450513          	addi	a0,a0,-892 # ffffffffc0209340 <commands+0x580>
ffffffffc02006c4:	acfff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02006c8:	780c                	ld	a1,48(s0)
ffffffffc02006ca:	00009517          	auipc	a0,0x9
ffffffffc02006ce:	c8e50513          	addi	a0,a0,-882 # ffffffffc0209358 <commands+0x598>
ffffffffc02006d2:	ac1ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02006d6:	7c0c                	ld	a1,56(s0)
ffffffffc02006d8:	00009517          	auipc	a0,0x9
ffffffffc02006dc:	c9850513          	addi	a0,a0,-872 # ffffffffc0209370 <commands+0x5b0>
ffffffffc02006e0:	ab3ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02006e4:	602c                	ld	a1,64(s0)
ffffffffc02006e6:	00009517          	auipc	a0,0x9
ffffffffc02006ea:	ca250513          	addi	a0,a0,-862 # ffffffffc0209388 <commands+0x5c8>
ffffffffc02006ee:	aa5ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02006f2:	642c                	ld	a1,72(s0)
ffffffffc02006f4:	00009517          	auipc	a0,0x9
ffffffffc02006f8:	cac50513          	addi	a0,a0,-852 # ffffffffc02093a0 <commands+0x5e0>
ffffffffc02006fc:	a97ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200700:	682c                	ld	a1,80(s0)
ffffffffc0200702:	00009517          	auipc	a0,0x9
ffffffffc0200706:	cb650513          	addi	a0,a0,-842 # ffffffffc02093b8 <commands+0x5f8>
ffffffffc020070a:	a89ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020070e:	6c2c                	ld	a1,88(s0)
ffffffffc0200710:	00009517          	auipc	a0,0x9
ffffffffc0200714:	cc050513          	addi	a0,a0,-832 # ffffffffc02093d0 <commands+0x610>
ffffffffc0200718:	a7bff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020071c:	702c                	ld	a1,96(s0)
ffffffffc020071e:	00009517          	auipc	a0,0x9
ffffffffc0200722:	cca50513          	addi	a0,a0,-822 # ffffffffc02093e8 <commands+0x628>
ffffffffc0200726:	a6dff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020072a:	742c                	ld	a1,104(s0)
ffffffffc020072c:	00009517          	auipc	a0,0x9
ffffffffc0200730:	cd450513          	addi	a0,a0,-812 # ffffffffc0209400 <commands+0x640>
ffffffffc0200734:	a5fff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200738:	782c                	ld	a1,112(s0)
ffffffffc020073a:	00009517          	auipc	a0,0x9
ffffffffc020073e:	cde50513          	addi	a0,a0,-802 # ffffffffc0209418 <commands+0x658>
ffffffffc0200742:	a51ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200746:	7c2c                	ld	a1,120(s0)
ffffffffc0200748:	00009517          	auipc	a0,0x9
ffffffffc020074c:	ce850513          	addi	a0,a0,-792 # ffffffffc0209430 <commands+0x670>
ffffffffc0200750:	a43ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200754:	604c                	ld	a1,128(s0)
ffffffffc0200756:	00009517          	auipc	a0,0x9
ffffffffc020075a:	cf250513          	addi	a0,a0,-782 # ffffffffc0209448 <commands+0x688>
ffffffffc020075e:	a35ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200762:	644c                	ld	a1,136(s0)
ffffffffc0200764:	00009517          	auipc	a0,0x9
ffffffffc0200768:	cfc50513          	addi	a0,a0,-772 # ffffffffc0209460 <commands+0x6a0>
ffffffffc020076c:	a27ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200770:	684c                	ld	a1,144(s0)
ffffffffc0200772:	00009517          	auipc	a0,0x9
ffffffffc0200776:	d0650513          	addi	a0,a0,-762 # ffffffffc0209478 <commands+0x6b8>
ffffffffc020077a:	a19ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020077e:	6c4c                	ld	a1,152(s0)
ffffffffc0200780:	00009517          	auipc	a0,0x9
ffffffffc0200784:	d1050513          	addi	a0,a0,-752 # ffffffffc0209490 <commands+0x6d0>
ffffffffc0200788:	a0bff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020078c:	704c                	ld	a1,160(s0)
ffffffffc020078e:	00009517          	auipc	a0,0x9
ffffffffc0200792:	d1a50513          	addi	a0,a0,-742 # ffffffffc02094a8 <commands+0x6e8>
ffffffffc0200796:	9fdff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020079a:	744c                	ld	a1,168(s0)
ffffffffc020079c:	00009517          	auipc	a0,0x9
ffffffffc02007a0:	d2450513          	addi	a0,a0,-732 # ffffffffc02094c0 <commands+0x700>
ffffffffc02007a4:	9efff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02007a8:	784c                	ld	a1,176(s0)
ffffffffc02007aa:	00009517          	auipc	a0,0x9
ffffffffc02007ae:	d2e50513          	addi	a0,a0,-722 # ffffffffc02094d8 <commands+0x718>
ffffffffc02007b2:	9e1ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02007b6:	7c4c                	ld	a1,184(s0)
ffffffffc02007b8:	00009517          	auipc	a0,0x9
ffffffffc02007bc:	d3850513          	addi	a0,a0,-712 # ffffffffc02094f0 <commands+0x730>
ffffffffc02007c0:	9d3ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02007c4:	606c                	ld	a1,192(s0)
ffffffffc02007c6:	00009517          	auipc	a0,0x9
ffffffffc02007ca:	d4250513          	addi	a0,a0,-702 # ffffffffc0209508 <commands+0x748>
ffffffffc02007ce:	9c5ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02007d2:	646c                	ld	a1,200(s0)
ffffffffc02007d4:	00009517          	auipc	a0,0x9
ffffffffc02007d8:	d4c50513          	addi	a0,a0,-692 # ffffffffc0209520 <commands+0x760>
ffffffffc02007dc:	9b7ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02007e0:	686c                	ld	a1,208(s0)
ffffffffc02007e2:	00009517          	auipc	a0,0x9
ffffffffc02007e6:	d5650513          	addi	a0,a0,-682 # ffffffffc0209538 <commands+0x778>
ffffffffc02007ea:	9a9ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02007ee:	6c6c                	ld	a1,216(s0)
ffffffffc02007f0:	00009517          	auipc	a0,0x9
ffffffffc02007f4:	d6050513          	addi	a0,a0,-672 # ffffffffc0209550 <commands+0x790>
ffffffffc02007f8:	99bff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02007fc:	706c                	ld	a1,224(s0)
ffffffffc02007fe:	00009517          	auipc	a0,0x9
ffffffffc0200802:	d6a50513          	addi	a0,a0,-662 # ffffffffc0209568 <commands+0x7a8>
ffffffffc0200806:	98dff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020080a:	746c                	ld	a1,232(s0)
ffffffffc020080c:	00009517          	auipc	a0,0x9
ffffffffc0200810:	d7450513          	addi	a0,a0,-652 # ffffffffc0209580 <commands+0x7c0>
ffffffffc0200814:	97fff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200818:	786c                	ld	a1,240(s0)
ffffffffc020081a:	00009517          	auipc	a0,0x9
ffffffffc020081e:	d7e50513          	addi	a0,a0,-642 # ffffffffc0209598 <commands+0x7d8>
ffffffffc0200822:	971ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200826:	7c6c                	ld	a1,248(s0)
ffffffffc0200828:	6402                	ld	s0,0(sp)
ffffffffc020082a:	60a2                	ld	ra,8(sp)
ffffffffc020082c:	00009517          	auipc	a0,0x9
ffffffffc0200830:	d8450513          	addi	a0,a0,-636 # ffffffffc02095b0 <commands+0x7f0>
ffffffffc0200834:	0141                	addi	sp,sp,16
ffffffffc0200836:	bab1                	j	ffffffffc0200192 <cprintf>

ffffffffc0200838 <print_trapframe>:
ffffffffc0200838:	1141                	addi	sp,sp,-16
ffffffffc020083a:	e022                	sd	s0,0(sp)
ffffffffc020083c:	85aa                	mv	a1,a0
ffffffffc020083e:	842a                	mv	s0,a0
ffffffffc0200840:	00009517          	auipc	a0,0x9
ffffffffc0200844:	d8850513          	addi	a0,a0,-632 # ffffffffc02095c8 <commands+0x808>
ffffffffc0200848:	e406                	sd	ra,8(sp)
ffffffffc020084a:	949ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020084e:	8522                	mv	a0,s0
ffffffffc0200850:	e1dff0ef          	jal	ra,ffffffffc020066c <print_regs>
ffffffffc0200854:	10043583          	ld	a1,256(s0)
ffffffffc0200858:	00009517          	auipc	a0,0x9
ffffffffc020085c:	d8850513          	addi	a0,a0,-632 # ffffffffc02095e0 <commands+0x820>
ffffffffc0200860:	933ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200864:	10843583          	ld	a1,264(s0)
ffffffffc0200868:	00009517          	auipc	a0,0x9
ffffffffc020086c:	d9050513          	addi	a0,a0,-624 # ffffffffc02095f8 <commands+0x838>
ffffffffc0200870:	923ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200874:	11043583          	ld	a1,272(s0)
ffffffffc0200878:	00009517          	auipc	a0,0x9
ffffffffc020087c:	d9850513          	addi	a0,a0,-616 # ffffffffc0209610 <commands+0x850>
ffffffffc0200880:	913ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200884:	11843583          	ld	a1,280(s0)
ffffffffc0200888:	6402                	ld	s0,0(sp)
ffffffffc020088a:	60a2                	ld	ra,8(sp)
ffffffffc020088c:	00009517          	auipc	a0,0x9
ffffffffc0200890:	d9450513          	addi	a0,a0,-620 # ffffffffc0209620 <commands+0x860>
ffffffffc0200894:	0141                	addi	sp,sp,16
ffffffffc0200896:	8fdff06f          	j	ffffffffc0200192 <cprintf>

ffffffffc020089a <pgfault_handler>:
ffffffffc020089a:	1101                	addi	sp,sp,-32
ffffffffc020089c:	e426                	sd	s1,8(sp)
ffffffffc020089e:	0003c497          	auipc	s1,0x3c
ffffffffc02008a2:	72248493          	addi	s1,s1,1826 # ffffffffc023cfc0 <check_mm_struct>
ffffffffc02008a6:	609c                	ld	a5,0(s1)
ffffffffc02008a8:	e822                	sd	s0,16(sp)
ffffffffc02008aa:	ec06                	sd	ra,24(sp)
ffffffffc02008ac:	842a                	mv	s0,a0
ffffffffc02008ae:	cbbd                	beqz	a5,ffffffffc0200924 <pgfault_handler+0x8a>
ffffffffc02008b0:	10053783          	ld	a5,256(a0)
ffffffffc02008b4:	11053583          	ld	a1,272(a0)
ffffffffc02008b8:	04b00613          	li	a2,75
ffffffffc02008bc:	1007f793          	andi	a5,a5,256
ffffffffc02008c0:	cba1                	beqz	a5,ffffffffc0200910 <pgfault_handler+0x76>
ffffffffc02008c2:	11843703          	ld	a4,280(s0)
ffffffffc02008c6:	47bd                	li	a5,15
ffffffffc02008c8:	05700693          	li	a3,87
ffffffffc02008cc:	00f70463          	beq	a4,a5,ffffffffc02008d4 <pgfault_handler+0x3a>
ffffffffc02008d0:	05200693          	li	a3,82
ffffffffc02008d4:	00009517          	auipc	a0,0x9
ffffffffc02008d8:	97450513          	addi	a0,a0,-1676 # ffffffffc0209248 <commands+0x488>
ffffffffc02008dc:	8b7ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02008e0:	6088                	ld	a0,0(s1)
ffffffffc02008e2:	c129                	beqz	a0,ffffffffc0200924 <pgfault_handler+0x8a>
ffffffffc02008e4:	0003c797          	auipc	a5,0x3c
ffffffffc02008e8:	59478793          	addi	a5,a5,1428 # ffffffffc023ce78 <current>
ffffffffc02008ec:	6398                	ld	a4,0(a5)
ffffffffc02008ee:	0003c797          	auipc	a5,0x3c
ffffffffc02008f2:	59278793          	addi	a5,a5,1426 # ffffffffc023ce80 <idleproc>
ffffffffc02008f6:	639c                	ld	a5,0(a5)
ffffffffc02008f8:	04f71763          	bne	a4,a5,ffffffffc0200946 <pgfault_handler+0xac>
ffffffffc02008fc:	11043603          	ld	a2,272(s0)
ffffffffc0200900:	11843583          	ld	a1,280(s0)
ffffffffc0200904:	6442                	ld	s0,16(sp)
ffffffffc0200906:	60e2                	ld	ra,24(sp)
ffffffffc0200908:	64a2                	ld	s1,8(sp)
ffffffffc020090a:	6105                	addi	sp,sp,32
ffffffffc020090c:	3f90306f          	j	ffffffffc0204504 <do_pgfault>
ffffffffc0200910:	11843703          	ld	a4,280(s0)
ffffffffc0200914:	47bd                	li	a5,15
ffffffffc0200916:	05500613          	li	a2,85
ffffffffc020091a:	05700693          	li	a3,87
ffffffffc020091e:	faf719e3          	bne	a4,a5,ffffffffc02008d0 <pgfault_handler+0x36>
ffffffffc0200922:	bf4d                	j	ffffffffc02008d4 <pgfault_handler+0x3a>
ffffffffc0200924:	0003c797          	auipc	a5,0x3c
ffffffffc0200928:	55478793          	addi	a5,a5,1364 # ffffffffc023ce78 <current>
ffffffffc020092c:	639c                	ld	a5,0(a5)
ffffffffc020092e:	cf85                	beqz	a5,ffffffffc0200966 <pgfault_handler+0xcc>
ffffffffc0200930:	11043603          	ld	a2,272(s0)
ffffffffc0200934:	11843583          	ld	a1,280(s0)
ffffffffc0200938:	6442                	ld	s0,16(sp)
ffffffffc020093a:	60e2                	ld	ra,24(sp)
ffffffffc020093c:	64a2                	ld	s1,8(sp)
ffffffffc020093e:	7788                	ld	a0,40(a5)
ffffffffc0200940:	6105                	addi	sp,sp,32
ffffffffc0200942:	3c30306f          	j	ffffffffc0204504 <do_pgfault>
ffffffffc0200946:	00009697          	auipc	a3,0x9
ffffffffc020094a:	92268693          	addi	a3,a3,-1758 # ffffffffc0209268 <commands+0x4a8>
ffffffffc020094e:	00009617          	auipc	a2,0x9
ffffffffc0200952:	93260613          	addi	a2,a2,-1742 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0200956:	06c00593          	li	a1,108
ffffffffc020095a:	00009517          	auipc	a0,0x9
ffffffffc020095e:	93e50513          	addi	a0,a0,-1730 # ffffffffc0209298 <commands+0x4d8>
ffffffffc0200962:	b23ff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0200966:	8522                	mv	a0,s0
ffffffffc0200968:	ed1ff0ef          	jal	ra,ffffffffc0200838 <print_trapframe>
ffffffffc020096c:	10043783          	ld	a5,256(s0)
ffffffffc0200970:	11043583          	ld	a1,272(s0)
ffffffffc0200974:	04b00613          	li	a2,75
ffffffffc0200978:	1007f793          	andi	a5,a5,256
ffffffffc020097c:	e399                	bnez	a5,ffffffffc0200982 <pgfault_handler+0xe8>
ffffffffc020097e:	05500613          	li	a2,85
ffffffffc0200982:	11843703          	ld	a4,280(s0)
ffffffffc0200986:	47bd                	li	a5,15
ffffffffc0200988:	02f70663          	beq	a4,a5,ffffffffc02009b4 <pgfault_handler+0x11a>
ffffffffc020098c:	05200693          	li	a3,82
ffffffffc0200990:	00009517          	auipc	a0,0x9
ffffffffc0200994:	8b850513          	addi	a0,a0,-1864 # ffffffffc0209248 <commands+0x488>
ffffffffc0200998:	ffaff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020099c:	00009617          	auipc	a2,0x9
ffffffffc02009a0:	91460613          	addi	a2,a2,-1772 # ffffffffc02092b0 <commands+0x4f0>
ffffffffc02009a4:	07300593          	li	a1,115
ffffffffc02009a8:	00009517          	auipc	a0,0x9
ffffffffc02009ac:	8f050513          	addi	a0,a0,-1808 # ffffffffc0209298 <commands+0x4d8>
ffffffffc02009b0:	ad5ff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02009b4:	05700693          	li	a3,87
ffffffffc02009b8:	bfe1                	j	ffffffffc0200990 <pgfault_handler+0xf6>

ffffffffc02009ba <interrupt_handler>:
ffffffffc02009ba:	11853783          	ld	a5,280(a0)
ffffffffc02009be:	472d                	li	a4,11
ffffffffc02009c0:	0786                	slli	a5,a5,0x1
ffffffffc02009c2:	8385                	srli	a5,a5,0x1
ffffffffc02009c4:	08f76163          	bltu	a4,a5,ffffffffc0200a46 <interrupt_handler+0x8c>
ffffffffc02009c8:	00008717          	auipc	a4,0x8
ffffffffc02009cc:	5d470713          	addi	a4,a4,1492 # ffffffffc0208f9c <commands+0x1dc>
ffffffffc02009d0:	078a                	slli	a5,a5,0x2
ffffffffc02009d2:	97ba                	add	a5,a5,a4
ffffffffc02009d4:	439c                	lw	a5,0(a5)
ffffffffc02009d6:	97ba                	add	a5,a5,a4
ffffffffc02009d8:	8782                	jr	a5
ffffffffc02009da:	00009517          	auipc	a0,0x9
ffffffffc02009de:	82e50513          	addi	a0,a0,-2002 # ffffffffc0209208 <commands+0x448>
ffffffffc02009e2:	fb0ff06f          	j	ffffffffc0200192 <cprintf>
ffffffffc02009e6:	00009517          	auipc	a0,0x9
ffffffffc02009ea:	80250513          	addi	a0,a0,-2046 # ffffffffc02091e8 <commands+0x428>
ffffffffc02009ee:	fa4ff06f          	j	ffffffffc0200192 <cprintf>
ffffffffc02009f2:	00008517          	auipc	a0,0x8
ffffffffc02009f6:	7b650513          	addi	a0,a0,1974 # ffffffffc02091a8 <commands+0x3e8>
ffffffffc02009fa:	f98ff06f          	j	ffffffffc0200192 <cprintf>
ffffffffc02009fe:	00008517          	auipc	a0,0x8
ffffffffc0200a02:	7ca50513          	addi	a0,a0,1994 # ffffffffc02091c8 <commands+0x408>
ffffffffc0200a06:	f8cff06f          	j	ffffffffc0200192 <cprintf>
ffffffffc0200a0a:	00009517          	auipc	a0,0x9
ffffffffc0200a0e:	81e50513          	addi	a0,a0,-2018 # ffffffffc0209228 <commands+0x468>
ffffffffc0200a12:	f80ff06f          	j	ffffffffc0200192 <cprintf>
ffffffffc0200a16:	1141                	addi	sp,sp,-16
ffffffffc0200a18:	e406                	sd	ra,8(sp)
ffffffffc0200a1a:	b49ff0ef          	jal	ra,ffffffffc0200562 <clock_set_next_event>
ffffffffc0200a1e:	0003c797          	auipc	a5,0x3c
ffffffffc0200a22:	48a78793          	addi	a5,a5,1162 # ffffffffc023cea8 <ticks>
ffffffffc0200a26:	639c                	ld	a5,0(a5)
ffffffffc0200a28:	0003c717          	auipc	a4,0x3c
ffffffffc0200a2c:	45070713          	addi	a4,a4,1104 # ffffffffc023ce78 <current>
ffffffffc0200a30:	6308                	ld	a0,0(a4)
ffffffffc0200a32:	0785                	addi	a5,a5,1
ffffffffc0200a34:	0003c717          	auipc	a4,0x3c
ffffffffc0200a38:	46f73a23          	sd	a5,1140(a4) # ffffffffc023cea8 <ticks>
ffffffffc0200a3c:	c511                	beqz	a0,ffffffffc0200a48 <interrupt_handler+0x8e>
ffffffffc0200a3e:	60a2                	ld	ra,8(sp)
ffffffffc0200a40:	0141                	addi	sp,sp,16
ffffffffc0200a42:	2730706f          	j	ffffffffc02084b4 <sched_class_proc_tick>
ffffffffc0200a46:	bbcd                	j	ffffffffc0200838 <print_trapframe>
ffffffffc0200a48:	60a2                	ld	ra,8(sp)
ffffffffc0200a4a:	0141                	addi	sp,sp,16
ffffffffc0200a4c:	8082                	ret

ffffffffc0200a4e <exception_handler>:
ffffffffc0200a4e:	11853783          	ld	a5,280(a0)
ffffffffc0200a52:	473d                	li	a4,15
ffffffffc0200a54:	18f76763          	bltu	a4,a5,ffffffffc0200be2 <exception_handler+0x194>
ffffffffc0200a58:	00008717          	auipc	a4,0x8
ffffffffc0200a5c:	57470713          	addi	a4,a4,1396 # ffffffffc0208fcc <commands+0x20c>
ffffffffc0200a60:	078a                	slli	a5,a5,0x2
ffffffffc0200a62:	97ba                	add	a5,a5,a4
ffffffffc0200a64:	439c                	lw	a5,0(a5)
ffffffffc0200a66:	1101                	addi	sp,sp,-32
ffffffffc0200a68:	e822                	sd	s0,16(sp)
ffffffffc0200a6a:	ec06                	sd	ra,24(sp)
ffffffffc0200a6c:	e426                	sd	s1,8(sp)
ffffffffc0200a6e:	97ba                	add	a5,a5,a4
ffffffffc0200a70:	842a                	mv	s0,a0
ffffffffc0200a72:	8782                	jr	a5
ffffffffc0200a74:	00008517          	auipc	a0,0x8
ffffffffc0200a78:	68c50513          	addi	a0,a0,1676 # ffffffffc0209100 <commands+0x340>
ffffffffc0200a7c:	f16ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200a80:	10843783          	ld	a5,264(s0)
ffffffffc0200a84:	60e2                	ld	ra,24(sp)
ffffffffc0200a86:	64a2                	ld	s1,8(sp)
ffffffffc0200a88:	0791                	addi	a5,a5,4
ffffffffc0200a8a:	10f43423          	sd	a5,264(s0)
ffffffffc0200a8e:	6442                	ld	s0,16(sp)
ffffffffc0200a90:	6105                	addi	sp,sp,32
ffffffffc0200a92:	4af0706f          	j	ffffffffc0208740 <syscall>
ffffffffc0200a96:	00008517          	auipc	a0,0x8
ffffffffc0200a9a:	68a50513          	addi	a0,a0,1674 # ffffffffc0209120 <commands+0x360>
ffffffffc0200a9e:	6442                	ld	s0,16(sp)
ffffffffc0200aa0:	60e2                	ld	ra,24(sp)
ffffffffc0200aa2:	64a2                	ld	s1,8(sp)
ffffffffc0200aa4:	6105                	addi	sp,sp,32
ffffffffc0200aa6:	eecff06f          	j	ffffffffc0200192 <cprintf>
ffffffffc0200aaa:	00008517          	auipc	a0,0x8
ffffffffc0200aae:	69650513          	addi	a0,a0,1686 # ffffffffc0209140 <commands+0x380>
ffffffffc0200ab2:	b7f5                	j	ffffffffc0200a9e <exception_handler+0x50>
ffffffffc0200ab4:	00008517          	auipc	a0,0x8
ffffffffc0200ab8:	6ac50513          	addi	a0,a0,1708 # ffffffffc0209160 <commands+0x3a0>
ffffffffc0200abc:	b7cd                	j	ffffffffc0200a9e <exception_handler+0x50>
ffffffffc0200abe:	00008517          	auipc	a0,0x8
ffffffffc0200ac2:	6ba50513          	addi	a0,a0,1722 # ffffffffc0209178 <commands+0x3b8>
ffffffffc0200ac6:	eccff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200aca:	8522                	mv	a0,s0
ffffffffc0200acc:	dcfff0ef          	jal	ra,ffffffffc020089a <pgfault_handler>
ffffffffc0200ad0:	84aa                	mv	s1,a0
ffffffffc0200ad2:	10051963          	bnez	a0,ffffffffc0200be4 <exception_handler+0x196>
ffffffffc0200ad6:	60e2                	ld	ra,24(sp)
ffffffffc0200ad8:	6442                	ld	s0,16(sp)
ffffffffc0200ada:	64a2                	ld	s1,8(sp)
ffffffffc0200adc:	6105                	addi	sp,sp,32
ffffffffc0200ade:	8082                	ret
ffffffffc0200ae0:	00008517          	auipc	a0,0x8
ffffffffc0200ae4:	6b050513          	addi	a0,a0,1712 # ffffffffc0209190 <commands+0x3d0>
ffffffffc0200ae8:	eaaff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200aec:	8522                	mv	a0,s0
ffffffffc0200aee:	dadff0ef          	jal	ra,ffffffffc020089a <pgfault_handler>
ffffffffc0200af2:	84aa                	mv	s1,a0
ffffffffc0200af4:	d16d                	beqz	a0,ffffffffc0200ad6 <exception_handler+0x88>
ffffffffc0200af6:	8522                	mv	a0,s0
ffffffffc0200af8:	d41ff0ef          	jal	ra,ffffffffc0200838 <print_trapframe>
ffffffffc0200afc:	86a6                	mv	a3,s1
ffffffffc0200afe:	00008617          	auipc	a2,0x8
ffffffffc0200b02:	5b260613          	addi	a2,a2,1458 # ffffffffc02090b0 <commands+0x2f0>
ffffffffc0200b06:	0fa00593          	li	a1,250
ffffffffc0200b0a:	00008517          	auipc	a0,0x8
ffffffffc0200b0e:	78e50513          	addi	a0,a0,1934 # ffffffffc0209298 <commands+0x4d8>
ffffffffc0200b12:	973ff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0200b16:	00008517          	auipc	a0,0x8
ffffffffc0200b1a:	4fa50513          	addi	a0,a0,1274 # ffffffffc0209010 <commands+0x250>
ffffffffc0200b1e:	b741                	j	ffffffffc0200a9e <exception_handler+0x50>
ffffffffc0200b20:	00008517          	auipc	a0,0x8
ffffffffc0200b24:	51050513          	addi	a0,a0,1296 # ffffffffc0209030 <commands+0x270>
ffffffffc0200b28:	bf9d                	j	ffffffffc0200a9e <exception_handler+0x50>
ffffffffc0200b2a:	00008517          	auipc	a0,0x8
ffffffffc0200b2e:	52650513          	addi	a0,a0,1318 # ffffffffc0209050 <commands+0x290>
ffffffffc0200b32:	b7b5                	j	ffffffffc0200a9e <exception_handler+0x50>
ffffffffc0200b34:	00008517          	auipc	a0,0x8
ffffffffc0200b38:	53450513          	addi	a0,a0,1332 # ffffffffc0209068 <commands+0x2a8>
ffffffffc0200b3c:	e56ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200b40:	6458                	ld	a4,136(s0)
ffffffffc0200b42:	47a9                	li	a5,10
ffffffffc0200b44:	f8f719e3          	bne	a4,a5,ffffffffc0200ad6 <exception_handler+0x88>
ffffffffc0200b48:	bf25                	j	ffffffffc0200a80 <exception_handler+0x32>
ffffffffc0200b4a:	00008517          	auipc	a0,0x8
ffffffffc0200b4e:	52e50513          	addi	a0,a0,1326 # ffffffffc0209078 <commands+0x2b8>
ffffffffc0200b52:	b7b1                	j	ffffffffc0200a9e <exception_handler+0x50>
ffffffffc0200b54:	00008517          	auipc	a0,0x8
ffffffffc0200b58:	54450513          	addi	a0,a0,1348 # ffffffffc0209098 <commands+0x2d8>
ffffffffc0200b5c:	e36ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200b60:	8522                	mv	a0,s0
ffffffffc0200b62:	d39ff0ef          	jal	ra,ffffffffc020089a <pgfault_handler>
ffffffffc0200b66:	84aa                	mv	s1,a0
ffffffffc0200b68:	d53d                	beqz	a0,ffffffffc0200ad6 <exception_handler+0x88>
ffffffffc0200b6a:	8522                	mv	a0,s0
ffffffffc0200b6c:	ccdff0ef          	jal	ra,ffffffffc0200838 <print_trapframe>
ffffffffc0200b70:	86a6                	mv	a3,s1
ffffffffc0200b72:	00008617          	auipc	a2,0x8
ffffffffc0200b76:	53e60613          	addi	a2,a2,1342 # ffffffffc02090b0 <commands+0x2f0>
ffffffffc0200b7a:	0cf00593          	li	a1,207
ffffffffc0200b7e:	00008517          	auipc	a0,0x8
ffffffffc0200b82:	71a50513          	addi	a0,a0,1818 # ffffffffc0209298 <commands+0x4d8>
ffffffffc0200b86:	8ffff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0200b8a:	00008517          	auipc	a0,0x8
ffffffffc0200b8e:	55e50513          	addi	a0,a0,1374 # ffffffffc02090e8 <commands+0x328>
ffffffffc0200b92:	e00ff0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0200b96:	8522                	mv	a0,s0
ffffffffc0200b98:	d03ff0ef          	jal	ra,ffffffffc020089a <pgfault_handler>
ffffffffc0200b9c:	84aa                	mv	s1,a0
ffffffffc0200b9e:	dd05                	beqz	a0,ffffffffc0200ad6 <exception_handler+0x88>
ffffffffc0200ba0:	8522                	mv	a0,s0
ffffffffc0200ba2:	c97ff0ef          	jal	ra,ffffffffc0200838 <print_trapframe>
ffffffffc0200ba6:	86a6                	mv	a3,s1
ffffffffc0200ba8:	00008617          	auipc	a2,0x8
ffffffffc0200bac:	50860613          	addi	a2,a2,1288 # ffffffffc02090b0 <commands+0x2f0>
ffffffffc0200bb0:	0d900593          	li	a1,217
ffffffffc0200bb4:	00008517          	auipc	a0,0x8
ffffffffc0200bb8:	6e450513          	addi	a0,a0,1764 # ffffffffc0209298 <commands+0x4d8>
ffffffffc0200bbc:	8c9ff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0200bc0:	6442                	ld	s0,16(sp)
ffffffffc0200bc2:	60e2                	ld	ra,24(sp)
ffffffffc0200bc4:	64a2                	ld	s1,8(sp)
ffffffffc0200bc6:	6105                	addi	sp,sp,32
ffffffffc0200bc8:	b985                	j	ffffffffc0200838 <print_trapframe>
ffffffffc0200bca:	00008617          	auipc	a2,0x8
ffffffffc0200bce:	50660613          	addi	a2,a2,1286 # ffffffffc02090d0 <commands+0x310>
ffffffffc0200bd2:	0d300593          	li	a1,211
ffffffffc0200bd6:	00008517          	auipc	a0,0x8
ffffffffc0200bda:	6c250513          	addi	a0,a0,1730 # ffffffffc0209298 <commands+0x4d8>
ffffffffc0200bde:	8a7ff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0200be2:	b999                	j	ffffffffc0200838 <print_trapframe>
ffffffffc0200be4:	8522                	mv	a0,s0
ffffffffc0200be6:	c53ff0ef          	jal	ra,ffffffffc0200838 <print_trapframe>
ffffffffc0200bea:	86a6                	mv	a3,s1
ffffffffc0200bec:	00008617          	auipc	a2,0x8
ffffffffc0200bf0:	4c460613          	addi	a2,a2,1220 # ffffffffc02090b0 <commands+0x2f0>
ffffffffc0200bf4:	0f300593          	li	a1,243
ffffffffc0200bf8:	00008517          	auipc	a0,0x8
ffffffffc0200bfc:	6a050513          	addi	a0,a0,1696 # ffffffffc0209298 <commands+0x4d8>
ffffffffc0200c00:	885ff0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0200c04 <trap>:
ffffffffc0200c04:	1101                	addi	sp,sp,-32
ffffffffc0200c06:	e822                	sd	s0,16(sp)
ffffffffc0200c08:	0003c417          	auipc	s0,0x3c
ffffffffc0200c0c:	27040413          	addi	s0,s0,624 # ffffffffc023ce78 <current>
ffffffffc0200c10:	6018                	ld	a4,0(s0)
ffffffffc0200c12:	ec06                	sd	ra,24(sp)
ffffffffc0200c14:	e426                	sd	s1,8(sp)
ffffffffc0200c16:	e04a                	sd	s2,0(sp)
ffffffffc0200c18:	11853683          	ld	a3,280(a0)
ffffffffc0200c1c:	cf1d                	beqz	a4,ffffffffc0200c5a <trap+0x56>
ffffffffc0200c1e:	10053483          	ld	s1,256(a0)
ffffffffc0200c22:	0a073903          	ld	s2,160(a4)
ffffffffc0200c26:	f348                	sd	a0,160(a4)
ffffffffc0200c28:	1004f493          	andi	s1,s1,256
ffffffffc0200c2c:	0206c463          	bltz	a3,ffffffffc0200c54 <trap+0x50>
ffffffffc0200c30:	e1fff0ef          	jal	ra,ffffffffc0200a4e <exception_handler>
ffffffffc0200c34:	601c                	ld	a5,0(s0)
ffffffffc0200c36:	0b27b023          	sd	s2,160(a5)
ffffffffc0200c3a:	e499                	bnez	s1,ffffffffc0200c48 <trap+0x44>
ffffffffc0200c3c:	0b07a703          	lw	a4,176(a5)
ffffffffc0200c40:	8b05                	andi	a4,a4,1
ffffffffc0200c42:	e329                	bnez	a4,ffffffffc0200c84 <trap+0x80>
ffffffffc0200c44:	6f9c                	ld	a5,24(a5)
ffffffffc0200c46:	eb85                	bnez	a5,ffffffffc0200c76 <trap+0x72>
ffffffffc0200c48:	60e2                	ld	ra,24(sp)
ffffffffc0200c4a:	6442                	ld	s0,16(sp)
ffffffffc0200c4c:	64a2                	ld	s1,8(sp)
ffffffffc0200c4e:	6902                	ld	s2,0(sp)
ffffffffc0200c50:	6105                	addi	sp,sp,32
ffffffffc0200c52:	8082                	ret
ffffffffc0200c54:	d67ff0ef          	jal	ra,ffffffffc02009ba <interrupt_handler>
ffffffffc0200c58:	bff1                	j	ffffffffc0200c34 <trap+0x30>
ffffffffc0200c5a:	0006c863          	bltz	a3,ffffffffc0200c6a <trap+0x66>
ffffffffc0200c5e:	6442                	ld	s0,16(sp)
ffffffffc0200c60:	60e2                	ld	ra,24(sp)
ffffffffc0200c62:	64a2                	ld	s1,8(sp)
ffffffffc0200c64:	6902                	ld	s2,0(sp)
ffffffffc0200c66:	6105                	addi	sp,sp,32
ffffffffc0200c68:	b3dd                	j	ffffffffc0200a4e <exception_handler>
ffffffffc0200c6a:	6442                	ld	s0,16(sp)
ffffffffc0200c6c:	60e2                	ld	ra,24(sp)
ffffffffc0200c6e:	64a2                	ld	s1,8(sp)
ffffffffc0200c70:	6902                	ld	s2,0(sp)
ffffffffc0200c72:	6105                	addi	sp,sp,32
ffffffffc0200c74:	b399                	j	ffffffffc02009ba <interrupt_handler>
ffffffffc0200c76:	6442                	ld	s0,16(sp)
ffffffffc0200c78:	60e2                	ld	ra,24(sp)
ffffffffc0200c7a:	64a2                	ld	s1,8(sp)
ffffffffc0200c7c:	6902                	ld	s2,0(sp)
ffffffffc0200c7e:	6105                	addi	sp,sp,32
ffffffffc0200c80:	1730706f          	j	ffffffffc02085f2 <schedule>
ffffffffc0200c84:	555d                	li	a0,-9
ffffffffc0200c86:	2d2040ef          	jal	ra,ffffffffc0204f58 <do_exit>
ffffffffc0200c8a:	601c                	ld	a5,0(s0)
ffffffffc0200c8c:	bf65                	j	ffffffffc0200c44 <trap+0x40>
	...

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
ffffffffc0200cfc:	f09ff0ef          	jal	ra,ffffffffc0200c04 <trap>

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

ffffffffc0200d5e <default_init>:
ffffffffc0200d5e:	0003c797          	auipc	a5,0x3c
ffffffffc0200d62:	15278793          	addi	a5,a5,338 # ffffffffc023ceb0 <free_area>
ffffffffc0200d66:	e79c                	sd	a5,8(a5)
ffffffffc0200d68:	e39c                	sd	a5,0(a5)
ffffffffc0200d6a:	0007a823          	sw	zero,16(a5)
ffffffffc0200d6e:	8082                	ret

ffffffffc0200d70 <default_nr_free_pages>:
ffffffffc0200d70:	0003c517          	auipc	a0,0x3c
ffffffffc0200d74:	15056503          	lwu	a0,336(a0) # ffffffffc023cec0 <free_area+0x10>
ffffffffc0200d78:	8082                	ret

ffffffffc0200d7a <default_check>:
ffffffffc0200d7a:	715d                	addi	sp,sp,-80
ffffffffc0200d7c:	f84a                	sd	s2,48(sp)
ffffffffc0200d7e:	0003c917          	auipc	s2,0x3c
ffffffffc0200d82:	13290913          	addi	s2,s2,306 # ffffffffc023ceb0 <free_area>
ffffffffc0200d86:	00893783          	ld	a5,8(s2)
ffffffffc0200d8a:	e486                	sd	ra,72(sp)
ffffffffc0200d8c:	e0a2                	sd	s0,64(sp)
ffffffffc0200d8e:	fc26                	sd	s1,56(sp)
ffffffffc0200d90:	f44e                	sd	s3,40(sp)
ffffffffc0200d92:	f052                	sd	s4,32(sp)
ffffffffc0200d94:	ec56                	sd	s5,24(sp)
ffffffffc0200d96:	e85a                	sd	s6,16(sp)
ffffffffc0200d98:	e45e                	sd	s7,8(sp)
ffffffffc0200d9a:	e062                	sd	s8,0(sp)
ffffffffc0200d9c:	31278463          	beq	a5,s2,ffffffffc02010a4 <default_check+0x32a>
ffffffffc0200da0:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200da4:	8305                	srli	a4,a4,0x1
ffffffffc0200da6:	8b05                	andi	a4,a4,1
ffffffffc0200da8:	30070263          	beqz	a4,ffffffffc02010ac <default_check+0x332>
ffffffffc0200dac:	4401                	li	s0,0
ffffffffc0200dae:	4481                	li	s1,0
ffffffffc0200db0:	a031                	j	ffffffffc0200dbc <default_check+0x42>
ffffffffc0200db2:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200db6:	8b09                	andi	a4,a4,2
ffffffffc0200db8:	2e070a63          	beqz	a4,ffffffffc02010ac <default_check+0x332>
ffffffffc0200dbc:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200dc0:	679c                	ld	a5,8(a5)
ffffffffc0200dc2:	2485                	addiw	s1,s1,1
ffffffffc0200dc4:	9c39                	addw	s0,s0,a4
ffffffffc0200dc6:	ff2796e3          	bne	a5,s2,ffffffffc0200db2 <default_check+0x38>
ffffffffc0200dca:	89a2                	mv	s3,s0
ffffffffc0200dcc:	046010ef          	jal	ra,ffffffffc0201e12 <nr_free_pages>
ffffffffc0200dd0:	73351e63          	bne	a0,s3,ffffffffc020150c <default_check+0x792>
ffffffffc0200dd4:	4505                	li	a0,1
ffffffffc0200dd6:	76f000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200dda:	8a2a                	mv	s4,a0
ffffffffc0200ddc:	46050863          	beqz	a0,ffffffffc020124c <default_check+0x4d2>
ffffffffc0200de0:	4505                	li	a0,1
ffffffffc0200de2:	763000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200de6:	89aa                	mv	s3,a0
ffffffffc0200de8:	74050263          	beqz	a0,ffffffffc020152c <default_check+0x7b2>
ffffffffc0200dec:	4505                	li	a0,1
ffffffffc0200dee:	757000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200df2:	8aaa                	mv	s5,a0
ffffffffc0200df4:	4c050c63          	beqz	a0,ffffffffc02012cc <default_check+0x552>
ffffffffc0200df8:	2d3a0a63          	beq	s4,s3,ffffffffc02010cc <default_check+0x352>
ffffffffc0200dfc:	2caa0863          	beq	s4,a0,ffffffffc02010cc <default_check+0x352>
ffffffffc0200e00:	2ca98663          	beq	s3,a0,ffffffffc02010cc <default_check+0x352>
ffffffffc0200e04:	000a2783          	lw	a5,0(s4)
ffffffffc0200e08:	2e079263          	bnez	a5,ffffffffc02010ec <default_check+0x372>
ffffffffc0200e0c:	0009a783          	lw	a5,0(s3)
ffffffffc0200e10:	2c079e63          	bnez	a5,ffffffffc02010ec <default_check+0x372>
ffffffffc0200e14:	411c                	lw	a5,0(a0)
ffffffffc0200e16:	2c079b63          	bnez	a5,ffffffffc02010ec <default_check+0x372>
ffffffffc0200e1a:	0003c797          	auipc	a5,0x3c
ffffffffc0200e1e:	0c678793          	addi	a5,a5,198 # ffffffffc023cee0 <pages>
ffffffffc0200e22:	639c                	ld	a5,0(a5)
ffffffffc0200e24:	0000b717          	auipc	a4,0xb
ffffffffc0200e28:	c8c70713          	addi	a4,a4,-884 # ffffffffc020bab0 <nbase>
ffffffffc0200e2c:	6310                	ld	a2,0(a4)
ffffffffc0200e2e:	0003c717          	auipc	a4,0x3c
ffffffffc0200e32:	03270713          	addi	a4,a4,50 # ffffffffc023ce60 <npage>
ffffffffc0200e36:	6314                	ld	a3,0(a4)
ffffffffc0200e38:	40fa0733          	sub	a4,s4,a5
ffffffffc0200e3c:	8719                	srai	a4,a4,0x6
ffffffffc0200e3e:	9732                	add	a4,a4,a2
ffffffffc0200e40:	06b2                	slli	a3,a3,0xc
ffffffffc0200e42:	0732                	slli	a4,a4,0xc
ffffffffc0200e44:	2cd77463          	bgeu	a4,a3,ffffffffc020110c <default_check+0x392>
ffffffffc0200e48:	40f98733          	sub	a4,s3,a5
ffffffffc0200e4c:	8719                	srai	a4,a4,0x6
ffffffffc0200e4e:	9732                	add	a4,a4,a2
ffffffffc0200e50:	0732                	slli	a4,a4,0xc
ffffffffc0200e52:	4ed77d63          	bgeu	a4,a3,ffffffffc020134c <default_check+0x5d2>
ffffffffc0200e56:	40f507b3          	sub	a5,a0,a5
ffffffffc0200e5a:	8799                	srai	a5,a5,0x6
ffffffffc0200e5c:	97b2                	add	a5,a5,a2
ffffffffc0200e5e:	07b2                	slli	a5,a5,0xc
ffffffffc0200e60:	34d7f663          	bgeu	a5,a3,ffffffffc02011ac <default_check+0x432>
ffffffffc0200e64:	4505                	li	a0,1
ffffffffc0200e66:	00093c03          	ld	s8,0(s2)
ffffffffc0200e6a:	00893b83          	ld	s7,8(s2)
ffffffffc0200e6e:	01092b03          	lw	s6,16(s2)
ffffffffc0200e72:	0003c797          	auipc	a5,0x3c
ffffffffc0200e76:	0527b323          	sd	s2,70(a5) # ffffffffc023ceb8 <free_area+0x8>
ffffffffc0200e7a:	0003c797          	auipc	a5,0x3c
ffffffffc0200e7e:	0327bb23          	sd	s2,54(a5) # ffffffffc023ceb0 <free_area>
ffffffffc0200e82:	0003c797          	auipc	a5,0x3c
ffffffffc0200e86:	0207af23          	sw	zero,62(a5) # ffffffffc023cec0 <free_area+0x10>
ffffffffc0200e8a:	6bb000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200e8e:	2e051f63          	bnez	a0,ffffffffc020118c <default_check+0x412>
ffffffffc0200e92:	4585                	li	a1,1
ffffffffc0200e94:	8552                	mv	a0,s4
ffffffffc0200e96:	737000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200e9a:	4585                	li	a1,1
ffffffffc0200e9c:	854e                	mv	a0,s3
ffffffffc0200e9e:	72f000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200ea2:	4585                	li	a1,1
ffffffffc0200ea4:	8556                	mv	a0,s5
ffffffffc0200ea6:	727000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200eaa:	01092703          	lw	a4,16(s2)
ffffffffc0200eae:	478d                	li	a5,3
ffffffffc0200eb0:	2af71e63          	bne	a4,a5,ffffffffc020116c <default_check+0x3f2>
ffffffffc0200eb4:	4505                	li	a0,1
ffffffffc0200eb6:	68f000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200eba:	89aa                	mv	s3,a0
ffffffffc0200ebc:	28050863          	beqz	a0,ffffffffc020114c <default_check+0x3d2>
ffffffffc0200ec0:	4505                	li	a0,1
ffffffffc0200ec2:	683000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200ec6:	8aaa                	mv	s5,a0
ffffffffc0200ec8:	3e050263          	beqz	a0,ffffffffc02012ac <default_check+0x532>
ffffffffc0200ecc:	4505                	li	a0,1
ffffffffc0200ece:	677000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200ed2:	8a2a                	mv	s4,a0
ffffffffc0200ed4:	3a050c63          	beqz	a0,ffffffffc020128c <default_check+0x512>
ffffffffc0200ed8:	4505                	li	a0,1
ffffffffc0200eda:	66b000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200ede:	38051763          	bnez	a0,ffffffffc020126c <default_check+0x4f2>
ffffffffc0200ee2:	4585                	li	a1,1
ffffffffc0200ee4:	854e                	mv	a0,s3
ffffffffc0200ee6:	6e7000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200eea:	00893783          	ld	a5,8(s2)
ffffffffc0200eee:	23278f63          	beq	a5,s2,ffffffffc020112c <default_check+0x3b2>
ffffffffc0200ef2:	4505                	li	a0,1
ffffffffc0200ef4:	651000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200ef8:	32a99a63          	bne	s3,a0,ffffffffc020122c <default_check+0x4b2>
ffffffffc0200efc:	4505                	li	a0,1
ffffffffc0200efe:	647000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200f02:	30051563          	bnez	a0,ffffffffc020120c <default_check+0x492>
ffffffffc0200f06:	01092783          	lw	a5,16(s2)
ffffffffc0200f0a:	2e079163          	bnez	a5,ffffffffc02011ec <default_check+0x472>
ffffffffc0200f0e:	854e                	mv	a0,s3
ffffffffc0200f10:	4585                	li	a1,1
ffffffffc0200f12:	0003c797          	auipc	a5,0x3c
ffffffffc0200f16:	f987bf23          	sd	s8,-98(a5) # ffffffffc023ceb0 <free_area>
ffffffffc0200f1a:	0003c797          	auipc	a5,0x3c
ffffffffc0200f1e:	f977bf23          	sd	s7,-98(a5) # ffffffffc023ceb8 <free_area+0x8>
ffffffffc0200f22:	0003c797          	auipc	a5,0x3c
ffffffffc0200f26:	f967af23          	sw	s6,-98(a5) # ffffffffc023cec0 <free_area+0x10>
ffffffffc0200f2a:	6a3000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200f2e:	4585                	li	a1,1
ffffffffc0200f30:	8556                	mv	a0,s5
ffffffffc0200f32:	69b000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200f36:	4585                	li	a1,1
ffffffffc0200f38:	8552                	mv	a0,s4
ffffffffc0200f3a:	693000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200f3e:	4515                	li	a0,5
ffffffffc0200f40:	605000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200f44:	89aa                	mv	s3,a0
ffffffffc0200f46:	28050363          	beqz	a0,ffffffffc02011cc <default_check+0x452>
ffffffffc0200f4a:	651c                	ld	a5,8(a0)
ffffffffc0200f4c:	8385                	srli	a5,a5,0x1
ffffffffc0200f4e:	8b85                	andi	a5,a5,1
ffffffffc0200f50:	54079e63          	bnez	a5,ffffffffc02014ac <default_check+0x732>
ffffffffc0200f54:	4505                	li	a0,1
ffffffffc0200f56:	00093b03          	ld	s6,0(s2)
ffffffffc0200f5a:	00893a83          	ld	s5,8(s2)
ffffffffc0200f5e:	0003c797          	auipc	a5,0x3c
ffffffffc0200f62:	f527b923          	sd	s2,-174(a5) # ffffffffc023ceb0 <free_area>
ffffffffc0200f66:	0003c797          	auipc	a5,0x3c
ffffffffc0200f6a:	f527b923          	sd	s2,-174(a5) # ffffffffc023ceb8 <free_area+0x8>
ffffffffc0200f6e:	5d7000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200f72:	50051d63          	bnez	a0,ffffffffc020148c <default_check+0x712>
ffffffffc0200f76:	08098a13          	addi	s4,s3,128
ffffffffc0200f7a:	8552                	mv	a0,s4
ffffffffc0200f7c:	458d                	li	a1,3
ffffffffc0200f7e:	01092b83          	lw	s7,16(s2)
ffffffffc0200f82:	0003c797          	auipc	a5,0x3c
ffffffffc0200f86:	f207af23          	sw	zero,-194(a5) # ffffffffc023cec0 <free_area+0x10>
ffffffffc0200f8a:	643000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200f8e:	4511                	li	a0,4
ffffffffc0200f90:	5b5000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200f94:	4c051c63          	bnez	a0,ffffffffc020146c <default_check+0x6f2>
ffffffffc0200f98:	0889b783          	ld	a5,136(s3)
ffffffffc0200f9c:	8385                	srli	a5,a5,0x1
ffffffffc0200f9e:	8b85                	andi	a5,a5,1
ffffffffc0200fa0:	4a078663          	beqz	a5,ffffffffc020144c <default_check+0x6d2>
ffffffffc0200fa4:	0909a703          	lw	a4,144(s3)
ffffffffc0200fa8:	478d                	li	a5,3
ffffffffc0200faa:	4af71163          	bne	a4,a5,ffffffffc020144c <default_check+0x6d2>
ffffffffc0200fae:	450d                	li	a0,3
ffffffffc0200fb0:	595000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200fb4:	8c2a                	mv	s8,a0
ffffffffc0200fb6:	46050b63          	beqz	a0,ffffffffc020142c <default_check+0x6b2>
ffffffffc0200fba:	4505                	li	a0,1
ffffffffc0200fbc:	589000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0200fc0:	44051663          	bnez	a0,ffffffffc020140c <default_check+0x692>
ffffffffc0200fc4:	438a1463          	bne	s4,s8,ffffffffc02013ec <default_check+0x672>
ffffffffc0200fc8:	4585                	li	a1,1
ffffffffc0200fca:	854e                	mv	a0,s3
ffffffffc0200fcc:	601000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200fd0:	458d                	li	a1,3
ffffffffc0200fd2:	8552                	mv	a0,s4
ffffffffc0200fd4:	5f9000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0200fd8:	0089b783          	ld	a5,8(s3)
ffffffffc0200fdc:	04098c13          	addi	s8,s3,64
ffffffffc0200fe0:	8385                	srli	a5,a5,0x1
ffffffffc0200fe2:	8b85                	andi	a5,a5,1
ffffffffc0200fe4:	3e078463          	beqz	a5,ffffffffc02013cc <default_check+0x652>
ffffffffc0200fe8:	0109a703          	lw	a4,16(s3)
ffffffffc0200fec:	4785                	li	a5,1
ffffffffc0200fee:	3cf71f63          	bne	a4,a5,ffffffffc02013cc <default_check+0x652>
ffffffffc0200ff2:	008a3783          	ld	a5,8(s4)
ffffffffc0200ff6:	8385                	srli	a5,a5,0x1
ffffffffc0200ff8:	8b85                	andi	a5,a5,1
ffffffffc0200ffa:	3a078963          	beqz	a5,ffffffffc02013ac <default_check+0x632>
ffffffffc0200ffe:	010a2703          	lw	a4,16(s4)
ffffffffc0201002:	478d                	li	a5,3
ffffffffc0201004:	3af71463          	bne	a4,a5,ffffffffc02013ac <default_check+0x632>
ffffffffc0201008:	4505                	li	a0,1
ffffffffc020100a:	53b000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc020100e:	36a99f63          	bne	s3,a0,ffffffffc020138c <default_check+0x612>
ffffffffc0201012:	4585                	li	a1,1
ffffffffc0201014:	5b9000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0201018:	4509                	li	a0,2
ffffffffc020101a:	52b000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc020101e:	34aa1763          	bne	s4,a0,ffffffffc020136c <default_check+0x5f2>
ffffffffc0201022:	4589                	li	a1,2
ffffffffc0201024:	5a9000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0201028:	4585                	li	a1,1
ffffffffc020102a:	8562                	mv	a0,s8
ffffffffc020102c:	5a1000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0201030:	4515                	li	a0,5
ffffffffc0201032:	513000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0201036:	89aa                	mv	s3,a0
ffffffffc0201038:	48050a63          	beqz	a0,ffffffffc02014cc <default_check+0x752>
ffffffffc020103c:	4505                	li	a0,1
ffffffffc020103e:	507000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0201042:	2e051563          	bnez	a0,ffffffffc020132c <default_check+0x5b2>
ffffffffc0201046:	01092783          	lw	a5,16(s2)
ffffffffc020104a:	2c079163          	bnez	a5,ffffffffc020130c <default_check+0x592>
ffffffffc020104e:	4595                	li	a1,5
ffffffffc0201050:	854e                	mv	a0,s3
ffffffffc0201052:	0003c797          	auipc	a5,0x3c
ffffffffc0201056:	e777a723          	sw	s7,-402(a5) # ffffffffc023cec0 <free_area+0x10>
ffffffffc020105a:	0003c797          	auipc	a5,0x3c
ffffffffc020105e:	e567bb23          	sd	s6,-426(a5) # ffffffffc023ceb0 <free_area>
ffffffffc0201062:	0003c797          	auipc	a5,0x3c
ffffffffc0201066:	e557bb23          	sd	s5,-426(a5) # ffffffffc023ceb8 <free_area+0x8>
ffffffffc020106a:	563000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc020106e:	00893783          	ld	a5,8(s2)
ffffffffc0201072:	01278963          	beq	a5,s2,ffffffffc0201084 <default_check+0x30a>
ffffffffc0201076:	ff87a703          	lw	a4,-8(a5)
ffffffffc020107a:	679c                	ld	a5,8(a5)
ffffffffc020107c:	34fd                	addiw	s1,s1,-1
ffffffffc020107e:	9c19                	subw	s0,s0,a4
ffffffffc0201080:	ff279be3          	bne	a5,s2,ffffffffc0201076 <default_check+0x2fc>
ffffffffc0201084:	26049463          	bnez	s1,ffffffffc02012ec <default_check+0x572>
ffffffffc0201088:	46041263          	bnez	s0,ffffffffc02014ec <default_check+0x772>
ffffffffc020108c:	60a6                	ld	ra,72(sp)
ffffffffc020108e:	6406                	ld	s0,64(sp)
ffffffffc0201090:	74e2                	ld	s1,56(sp)
ffffffffc0201092:	7942                	ld	s2,48(sp)
ffffffffc0201094:	79a2                	ld	s3,40(sp)
ffffffffc0201096:	7a02                	ld	s4,32(sp)
ffffffffc0201098:	6ae2                	ld	s5,24(sp)
ffffffffc020109a:	6b42                	ld	s6,16(sp)
ffffffffc020109c:	6ba2                	ld	s7,8(sp)
ffffffffc020109e:	6c02                	ld	s8,0(sp)
ffffffffc02010a0:	6161                	addi	sp,sp,80
ffffffffc02010a2:	8082                	ret
ffffffffc02010a4:	4981                	li	s3,0
ffffffffc02010a6:	4401                	li	s0,0
ffffffffc02010a8:	4481                	li	s1,0
ffffffffc02010aa:	b30d                	j	ffffffffc0200dcc <default_check+0x52>
ffffffffc02010ac:	00008697          	auipc	a3,0x8
ffffffffc02010b0:	58c68693          	addi	a3,a3,1420 # ffffffffc0209638 <commands+0x878>
ffffffffc02010b4:	00008617          	auipc	a2,0x8
ffffffffc02010b8:	1cc60613          	addi	a2,a2,460 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02010bc:	0f000593          	li	a1,240
ffffffffc02010c0:	00008517          	auipc	a0,0x8
ffffffffc02010c4:	58850513          	addi	a0,a0,1416 # ffffffffc0209648 <commands+0x888>
ffffffffc02010c8:	bbcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02010cc:	00008697          	auipc	a3,0x8
ffffffffc02010d0:	61468693          	addi	a3,a3,1556 # ffffffffc02096e0 <commands+0x920>
ffffffffc02010d4:	00008617          	auipc	a2,0x8
ffffffffc02010d8:	1ac60613          	addi	a2,a2,428 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02010dc:	0bd00593          	li	a1,189
ffffffffc02010e0:	00008517          	auipc	a0,0x8
ffffffffc02010e4:	56850513          	addi	a0,a0,1384 # ffffffffc0209648 <commands+0x888>
ffffffffc02010e8:	b9cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02010ec:	00008697          	auipc	a3,0x8
ffffffffc02010f0:	61c68693          	addi	a3,a3,1564 # ffffffffc0209708 <commands+0x948>
ffffffffc02010f4:	00008617          	auipc	a2,0x8
ffffffffc02010f8:	18c60613          	addi	a2,a2,396 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02010fc:	0be00593          	li	a1,190
ffffffffc0201100:	00008517          	auipc	a0,0x8
ffffffffc0201104:	54850513          	addi	a0,a0,1352 # ffffffffc0209648 <commands+0x888>
ffffffffc0201108:	b7cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020110c:	00008697          	auipc	a3,0x8
ffffffffc0201110:	63c68693          	addi	a3,a3,1596 # ffffffffc0209748 <commands+0x988>
ffffffffc0201114:	00008617          	auipc	a2,0x8
ffffffffc0201118:	16c60613          	addi	a2,a2,364 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020111c:	0c000593          	li	a1,192
ffffffffc0201120:	00008517          	auipc	a0,0x8
ffffffffc0201124:	52850513          	addi	a0,a0,1320 # ffffffffc0209648 <commands+0x888>
ffffffffc0201128:	b5cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020112c:	00008697          	auipc	a3,0x8
ffffffffc0201130:	6a468693          	addi	a3,a3,1700 # ffffffffc02097d0 <commands+0xa10>
ffffffffc0201134:	00008617          	auipc	a2,0x8
ffffffffc0201138:	14c60613          	addi	a2,a2,332 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020113c:	0d900593          	li	a1,217
ffffffffc0201140:	00008517          	auipc	a0,0x8
ffffffffc0201144:	50850513          	addi	a0,a0,1288 # ffffffffc0209648 <commands+0x888>
ffffffffc0201148:	b3cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020114c:	00008697          	auipc	a3,0x8
ffffffffc0201150:	53468693          	addi	a3,a3,1332 # ffffffffc0209680 <commands+0x8c0>
ffffffffc0201154:	00008617          	auipc	a2,0x8
ffffffffc0201158:	12c60613          	addi	a2,a2,300 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020115c:	0d200593          	li	a1,210
ffffffffc0201160:	00008517          	auipc	a0,0x8
ffffffffc0201164:	4e850513          	addi	a0,a0,1256 # ffffffffc0209648 <commands+0x888>
ffffffffc0201168:	b1cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020116c:	00008697          	auipc	a3,0x8
ffffffffc0201170:	65468693          	addi	a3,a3,1620 # ffffffffc02097c0 <commands+0xa00>
ffffffffc0201174:	00008617          	auipc	a2,0x8
ffffffffc0201178:	10c60613          	addi	a2,a2,268 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020117c:	0d000593          	li	a1,208
ffffffffc0201180:	00008517          	auipc	a0,0x8
ffffffffc0201184:	4c850513          	addi	a0,a0,1224 # ffffffffc0209648 <commands+0x888>
ffffffffc0201188:	afcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020118c:	00008697          	auipc	a3,0x8
ffffffffc0201190:	61c68693          	addi	a3,a3,1564 # ffffffffc02097a8 <commands+0x9e8>
ffffffffc0201194:	00008617          	auipc	a2,0x8
ffffffffc0201198:	0ec60613          	addi	a2,a2,236 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020119c:	0cb00593          	li	a1,203
ffffffffc02011a0:	00008517          	auipc	a0,0x8
ffffffffc02011a4:	4a850513          	addi	a0,a0,1192 # ffffffffc0209648 <commands+0x888>
ffffffffc02011a8:	adcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02011ac:	00008697          	auipc	a3,0x8
ffffffffc02011b0:	5dc68693          	addi	a3,a3,1500 # ffffffffc0209788 <commands+0x9c8>
ffffffffc02011b4:	00008617          	auipc	a2,0x8
ffffffffc02011b8:	0cc60613          	addi	a2,a2,204 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02011bc:	0c200593          	li	a1,194
ffffffffc02011c0:	00008517          	auipc	a0,0x8
ffffffffc02011c4:	48850513          	addi	a0,a0,1160 # ffffffffc0209648 <commands+0x888>
ffffffffc02011c8:	abcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02011cc:	00008697          	auipc	a3,0x8
ffffffffc02011d0:	64c68693          	addi	a3,a3,1612 # ffffffffc0209818 <commands+0xa58>
ffffffffc02011d4:	00008617          	auipc	a2,0x8
ffffffffc02011d8:	0ac60613          	addi	a2,a2,172 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02011dc:	0f800593          	li	a1,248
ffffffffc02011e0:	00008517          	auipc	a0,0x8
ffffffffc02011e4:	46850513          	addi	a0,a0,1128 # ffffffffc0209648 <commands+0x888>
ffffffffc02011e8:	a9cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02011ec:	00008697          	auipc	a3,0x8
ffffffffc02011f0:	61c68693          	addi	a3,a3,1564 # ffffffffc0209808 <commands+0xa48>
ffffffffc02011f4:	00008617          	auipc	a2,0x8
ffffffffc02011f8:	08c60613          	addi	a2,a2,140 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02011fc:	0df00593          	li	a1,223
ffffffffc0201200:	00008517          	auipc	a0,0x8
ffffffffc0201204:	44850513          	addi	a0,a0,1096 # ffffffffc0209648 <commands+0x888>
ffffffffc0201208:	a7cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020120c:	00008697          	auipc	a3,0x8
ffffffffc0201210:	59c68693          	addi	a3,a3,1436 # ffffffffc02097a8 <commands+0x9e8>
ffffffffc0201214:	00008617          	auipc	a2,0x8
ffffffffc0201218:	06c60613          	addi	a2,a2,108 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020121c:	0dd00593          	li	a1,221
ffffffffc0201220:	00008517          	auipc	a0,0x8
ffffffffc0201224:	42850513          	addi	a0,a0,1064 # ffffffffc0209648 <commands+0x888>
ffffffffc0201228:	a5cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020122c:	00008697          	auipc	a3,0x8
ffffffffc0201230:	5bc68693          	addi	a3,a3,1468 # ffffffffc02097e8 <commands+0xa28>
ffffffffc0201234:	00008617          	auipc	a2,0x8
ffffffffc0201238:	04c60613          	addi	a2,a2,76 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020123c:	0dc00593          	li	a1,220
ffffffffc0201240:	00008517          	auipc	a0,0x8
ffffffffc0201244:	40850513          	addi	a0,a0,1032 # ffffffffc0209648 <commands+0x888>
ffffffffc0201248:	a3cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020124c:	00008697          	auipc	a3,0x8
ffffffffc0201250:	43468693          	addi	a3,a3,1076 # ffffffffc0209680 <commands+0x8c0>
ffffffffc0201254:	00008617          	auipc	a2,0x8
ffffffffc0201258:	02c60613          	addi	a2,a2,44 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020125c:	0b900593          	li	a1,185
ffffffffc0201260:	00008517          	auipc	a0,0x8
ffffffffc0201264:	3e850513          	addi	a0,a0,1000 # ffffffffc0209648 <commands+0x888>
ffffffffc0201268:	a1cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020126c:	00008697          	auipc	a3,0x8
ffffffffc0201270:	53c68693          	addi	a3,a3,1340 # ffffffffc02097a8 <commands+0x9e8>
ffffffffc0201274:	00008617          	auipc	a2,0x8
ffffffffc0201278:	00c60613          	addi	a2,a2,12 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020127c:	0d600593          	li	a1,214
ffffffffc0201280:	00008517          	auipc	a0,0x8
ffffffffc0201284:	3c850513          	addi	a0,a0,968 # ffffffffc0209648 <commands+0x888>
ffffffffc0201288:	9fcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020128c:	00008697          	auipc	a3,0x8
ffffffffc0201290:	43468693          	addi	a3,a3,1076 # ffffffffc02096c0 <commands+0x900>
ffffffffc0201294:	00008617          	auipc	a2,0x8
ffffffffc0201298:	fec60613          	addi	a2,a2,-20 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020129c:	0d400593          	li	a1,212
ffffffffc02012a0:	00008517          	auipc	a0,0x8
ffffffffc02012a4:	3a850513          	addi	a0,a0,936 # ffffffffc0209648 <commands+0x888>
ffffffffc02012a8:	9dcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02012ac:	00008697          	auipc	a3,0x8
ffffffffc02012b0:	3f468693          	addi	a3,a3,1012 # ffffffffc02096a0 <commands+0x8e0>
ffffffffc02012b4:	00008617          	auipc	a2,0x8
ffffffffc02012b8:	fcc60613          	addi	a2,a2,-52 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02012bc:	0d300593          	li	a1,211
ffffffffc02012c0:	00008517          	auipc	a0,0x8
ffffffffc02012c4:	38850513          	addi	a0,a0,904 # ffffffffc0209648 <commands+0x888>
ffffffffc02012c8:	9bcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02012cc:	00008697          	auipc	a3,0x8
ffffffffc02012d0:	3f468693          	addi	a3,a3,1012 # ffffffffc02096c0 <commands+0x900>
ffffffffc02012d4:	00008617          	auipc	a2,0x8
ffffffffc02012d8:	fac60613          	addi	a2,a2,-84 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02012dc:	0bb00593          	li	a1,187
ffffffffc02012e0:	00008517          	auipc	a0,0x8
ffffffffc02012e4:	36850513          	addi	a0,a0,872 # ffffffffc0209648 <commands+0x888>
ffffffffc02012e8:	99cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02012ec:	00008697          	auipc	a3,0x8
ffffffffc02012f0:	67c68693          	addi	a3,a3,1660 # ffffffffc0209968 <commands+0xba8>
ffffffffc02012f4:	00008617          	auipc	a2,0x8
ffffffffc02012f8:	f8c60613          	addi	a2,a2,-116 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02012fc:	12500593          	li	a1,293
ffffffffc0201300:	00008517          	auipc	a0,0x8
ffffffffc0201304:	34850513          	addi	a0,a0,840 # ffffffffc0209648 <commands+0x888>
ffffffffc0201308:	97cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020130c:	00008697          	auipc	a3,0x8
ffffffffc0201310:	4fc68693          	addi	a3,a3,1276 # ffffffffc0209808 <commands+0xa48>
ffffffffc0201314:	00008617          	auipc	a2,0x8
ffffffffc0201318:	f6c60613          	addi	a2,a2,-148 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020131c:	11a00593          	li	a1,282
ffffffffc0201320:	00008517          	auipc	a0,0x8
ffffffffc0201324:	32850513          	addi	a0,a0,808 # ffffffffc0209648 <commands+0x888>
ffffffffc0201328:	95cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020132c:	00008697          	auipc	a3,0x8
ffffffffc0201330:	47c68693          	addi	a3,a3,1148 # ffffffffc02097a8 <commands+0x9e8>
ffffffffc0201334:	00008617          	auipc	a2,0x8
ffffffffc0201338:	f4c60613          	addi	a2,a2,-180 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020133c:	11800593          	li	a1,280
ffffffffc0201340:	00008517          	auipc	a0,0x8
ffffffffc0201344:	30850513          	addi	a0,a0,776 # ffffffffc0209648 <commands+0x888>
ffffffffc0201348:	93cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020134c:	00008697          	auipc	a3,0x8
ffffffffc0201350:	41c68693          	addi	a3,a3,1052 # ffffffffc0209768 <commands+0x9a8>
ffffffffc0201354:	00008617          	auipc	a2,0x8
ffffffffc0201358:	f2c60613          	addi	a2,a2,-212 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020135c:	0c100593          	li	a1,193
ffffffffc0201360:	00008517          	auipc	a0,0x8
ffffffffc0201364:	2e850513          	addi	a0,a0,744 # ffffffffc0209648 <commands+0x888>
ffffffffc0201368:	91cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020136c:	00008697          	auipc	a3,0x8
ffffffffc0201370:	5bc68693          	addi	a3,a3,1468 # ffffffffc0209928 <commands+0xb68>
ffffffffc0201374:	00008617          	auipc	a2,0x8
ffffffffc0201378:	f0c60613          	addi	a2,a2,-244 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020137c:	11200593          	li	a1,274
ffffffffc0201380:	00008517          	auipc	a0,0x8
ffffffffc0201384:	2c850513          	addi	a0,a0,712 # ffffffffc0209648 <commands+0x888>
ffffffffc0201388:	8fcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020138c:	00008697          	auipc	a3,0x8
ffffffffc0201390:	57c68693          	addi	a3,a3,1404 # ffffffffc0209908 <commands+0xb48>
ffffffffc0201394:	00008617          	auipc	a2,0x8
ffffffffc0201398:	eec60613          	addi	a2,a2,-276 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020139c:	11000593          	li	a1,272
ffffffffc02013a0:	00008517          	auipc	a0,0x8
ffffffffc02013a4:	2a850513          	addi	a0,a0,680 # ffffffffc0209648 <commands+0x888>
ffffffffc02013a8:	8dcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02013ac:	00008697          	auipc	a3,0x8
ffffffffc02013b0:	53468693          	addi	a3,a3,1332 # ffffffffc02098e0 <commands+0xb20>
ffffffffc02013b4:	00008617          	auipc	a2,0x8
ffffffffc02013b8:	ecc60613          	addi	a2,a2,-308 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02013bc:	10e00593          	li	a1,270
ffffffffc02013c0:	00008517          	auipc	a0,0x8
ffffffffc02013c4:	28850513          	addi	a0,a0,648 # ffffffffc0209648 <commands+0x888>
ffffffffc02013c8:	8bcff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02013cc:	00008697          	auipc	a3,0x8
ffffffffc02013d0:	4ec68693          	addi	a3,a3,1260 # ffffffffc02098b8 <commands+0xaf8>
ffffffffc02013d4:	00008617          	auipc	a2,0x8
ffffffffc02013d8:	eac60613          	addi	a2,a2,-340 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02013dc:	10d00593          	li	a1,269
ffffffffc02013e0:	00008517          	auipc	a0,0x8
ffffffffc02013e4:	26850513          	addi	a0,a0,616 # ffffffffc0209648 <commands+0x888>
ffffffffc02013e8:	89cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02013ec:	00008697          	auipc	a3,0x8
ffffffffc02013f0:	4bc68693          	addi	a3,a3,1212 # ffffffffc02098a8 <commands+0xae8>
ffffffffc02013f4:	00008617          	auipc	a2,0x8
ffffffffc02013f8:	e8c60613          	addi	a2,a2,-372 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02013fc:	10800593          	li	a1,264
ffffffffc0201400:	00008517          	auipc	a0,0x8
ffffffffc0201404:	24850513          	addi	a0,a0,584 # ffffffffc0209648 <commands+0x888>
ffffffffc0201408:	87cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020140c:	00008697          	auipc	a3,0x8
ffffffffc0201410:	39c68693          	addi	a3,a3,924 # ffffffffc02097a8 <commands+0x9e8>
ffffffffc0201414:	00008617          	auipc	a2,0x8
ffffffffc0201418:	e6c60613          	addi	a2,a2,-404 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020141c:	10700593          	li	a1,263
ffffffffc0201420:	00008517          	auipc	a0,0x8
ffffffffc0201424:	22850513          	addi	a0,a0,552 # ffffffffc0209648 <commands+0x888>
ffffffffc0201428:	85cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020142c:	00008697          	auipc	a3,0x8
ffffffffc0201430:	45c68693          	addi	a3,a3,1116 # ffffffffc0209888 <commands+0xac8>
ffffffffc0201434:	00008617          	auipc	a2,0x8
ffffffffc0201438:	e4c60613          	addi	a2,a2,-436 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020143c:	10600593          	li	a1,262
ffffffffc0201440:	00008517          	auipc	a0,0x8
ffffffffc0201444:	20850513          	addi	a0,a0,520 # ffffffffc0209648 <commands+0x888>
ffffffffc0201448:	83cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020144c:	00008697          	auipc	a3,0x8
ffffffffc0201450:	40c68693          	addi	a3,a3,1036 # ffffffffc0209858 <commands+0xa98>
ffffffffc0201454:	00008617          	auipc	a2,0x8
ffffffffc0201458:	e2c60613          	addi	a2,a2,-468 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020145c:	10500593          	li	a1,261
ffffffffc0201460:	00008517          	auipc	a0,0x8
ffffffffc0201464:	1e850513          	addi	a0,a0,488 # ffffffffc0209648 <commands+0x888>
ffffffffc0201468:	81cff0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020146c:	00008697          	auipc	a3,0x8
ffffffffc0201470:	3d468693          	addi	a3,a3,980 # ffffffffc0209840 <commands+0xa80>
ffffffffc0201474:	00008617          	auipc	a2,0x8
ffffffffc0201478:	e0c60613          	addi	a2,a2,-500 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020147c:	10400593          	li	a1,260
ffffffffc0201480:	00008517          	auipc	a0,0x8
ffffffffc0201484:	1c850513          	addi	a0,a0,456 # ffffffffc0209648 <commands+0x888>
ffffffffc0201488:	ffdfe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020148c:	00008697          	auipc	a3,0x8
ffffffffc0201490:	31c68693          	addi	a3,a3,796 # ffffffffc02097a8 <commands+0x9e8>
ffffffffc0201494:	00008617          	auipc	a2,0x8
ffffffffc0201498:	dec60613          	addi	a2,a2,-532 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020149c:	0fe00593          	li	a1,254
ffffffffc02014a0:	00008517          	auipc	a0,0x8
ffffffffc02014a4:	1a850513          	addi	a0,a0,424 # ffffffffc0209648 <commands+0x888>
ffffffffc02014a8:	fddfe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02014ac:	00008697          	auipc	a3,0x8
ffffffffc02014b0:	37c68693          	addi	a3,a3,892 # ffffffffc0209828 <commands+0xa68>
ffffffffc02014b4:	00008617          	auipc	a2,0x8
ffffffffc02014b8:	dcc60613          	addi	a2,a2,-564 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02014bc:	0f900593          	li	a1,249
ffffffffc02014c0:	00008517          	auipc	a0,0x8
ffffffffc02014c4:	18850513          	addi	a0,a0,392 # ffffffffc0209648 <commands+0x888>
ffffffffc02014c8:	fbdfe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02014cc:	00008697          	auipc	a3,0x8
ffffffffc02014d0:	47c68693          	addi	a3,a3,1148 # ffffffffc0209948 <commands+0xb88>
ffffffffc02014d4:	00008617          	auipc	a2,0x8
ffffffffc02014d8:	dac60613          	addi	a2,a2,-596 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02014dc:	11700593          	li	a1,279
ffffffffc02014e0:	00008517          	auipc	a0,0x8
ffffffffc02014e4:	16850513          	addi	a0,a0,360 # ffffffffc0209648 <commands+0x888>
ffffffffc02014e8:	f9dfe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02014ec:	00008697          	auipc	a3,0x8
ffffffffc02014f0:	48c68693          	addi	a3,a3,1164 # ffffffffc0209978 <commands+0xbb8>
ffffffffc02014f4:	00008617          	auipc	a2,0x8
ffffffffc02014f8:	d8c60613          	addi	a2,a2,-628 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02014fc:	12600593          	li	a1,294
ffffffffc0201500:	00008517          	auipc	a0,0x8
ffffffffc0201504:	14850513          	addi	a0,a0,328 # ffffffffc0209648 <commands+0x888>
ffffffffc0201508:	f7dfe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020150c:	00008697          	auipc	a3,0x8
ffffffffc0201510:	15468693          	addi	a3,a3,340 # ffffffffc0209660 <commands+0x8a0>
ffffffffc0201514:	00008617          	auipc	a2,0x8
ffffffffc0201518:	d6c60613          	addi	a2,a2,-660 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020151c:	0f300593          	li	a1,243
ffffffffc0201520:	00008517          	auipc	a0,0x8
ffffffffc0201524:	12850513          	addi	a0,a0,296 # ffffffffc0209648 <commands+0x888>
ffffffffc0201528:	f5dfe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020152c:	00008697          	auipc	a3,0x8
ffffffffc0201530:	17468693          	addi	a3,a3,372 # ffffffffc02096a0 <commands+0x8e0>
ffffffffc0201534:	00008617          	auipc	a2,0x8
ffffffffc0201538:	d4c60613          	addi	a2,a2,-692 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020153c:	0ba00593          	li	a1,186
ffffffffc0201540:	00008517          	auipc	a0,0x8
ffffffffc0201544:	10850513          	addi	a0,a0,264 # ffffffffc0209648 <commands+0x888>
ffffffffc0201548:	f3dfe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc020154c <default_free_pages>:
ffffffffc020154c:	1141                	addi	sp,sp,-16
ffffffffc020154e:	e406                	sd	ra,8(sp)
ffffffffc0201550:	16058e63          	beqz	a1,ffffffffc02016cc <default_free_pages+0x180>
ffffffffc0201554:	00659693          	slli	a3,a1,0x6
ffffffffc0201558:	96aa                	add	a3,a3,a0
ffffffffc020155a:	02d50d63          	beq	a0,a3,ffffffffc0201594 <default_free_pages+0x48>
ffffffffc020155e:	651c                	ld	a5,8(a0)
ffffffffc0201560:	8b85                	andi	a5,a5,1
ffffffffc0201562:	14079563          	bnez	a5,ffffffffc02016ac <default_free_pages+0x160>
ffffffffc0201566:	651c                	ld	a5,8(a0)
ffffffffc0201568:	8385                	srli	a5,a5,0x1
ffffffffc020156a:	8b85                	andi	a5,a5,1
ffffffffc020156c:	14079063          	bnez	a5,ffffffffc02016ac <default_free_pages+0x160>
ffffffffc0201570:	87aa                	mv	a5,a0
ffffffffc0201572:	a809                	j	ffffffffc0201584 <default_free_pages+0x38>
ffffffffc0201574:	6798                	ld	a4,8(a5)
ffffffffc0201576:	8b05                	andi	a4,a4,1
ffffffffc0201578:	12071a63          	bnez	a4,ffffffffc02016ac <default_free_pages+0x160>
ffffffffc020157c:	6798                	ld	a4,8(a5)
ffffffffc020157e:	8b09                	andi	a4,a4,2
ffffffffc0201580:	12071663          	bnez	a4,ffffffffc02016ac <default_free_pages+0x160>
ffffffffc0201584:	0007b423          	sd	zero,8(a5)
ffffffffc0201588:	0007a023          	sw	zero,0(a5)
ffffffffc020158c:	04078793          	addi	a5,a5,64
ffffffffc0201590:	fed792e3          	bne	a5,a3,ffffffffc0201574 <default_free_pages+0x28>
ffffffffc0201594:	2581                	sext.w	a1,a1
ffffffffc0201596:	c90c                	sw	a1,16(a0)
ffffffffc0201598:	00850893          	addi	a7,a0,8
ffffffffc020159c:	4789                	li	a5,2
ffffffffc020159e:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc02015a2:	0003c697          	auipc	a3,0x3c
ffffffffc02015a6:	90e68693          	addi	a3,a3,-1778 # ffffffffc023ceb0 <free_area>
ffffffffc02015aa:	4a98                	lw	a4,16(a3)
ffffffffc02015ac:	669c                	ld	a5,8(a3)
ffffffffc02015ae:	9db9                	addw	a1,a1,a4
ffffffffc02015b0:	0003c717          	auipc	a4,0x3c
ffffffffc02015b4:	90b72823          	sw	a1,-1776(a4) # ffffffffc023cec0 <free_area+0x10>
ffffffffc02015b8:	0cd78163          	beq	a5,a3,ffffffffc020167a <default_free_pages+0x12e>
ffffffffc02015bc:	fe878713          	addi	a4,a5,-24
ffffffffc02015c0:	628c                	ld	a1,0(a3)
ffffffffc02015c2:	4801                	li	a6,0
ffffffffc02015c4:	01850613          	addi	a2,a0,24
ffffffffc02015c8:	00e56a63          	bltu	a0,a4,ffffffffc02015dc <default_free_pages+0x90>
ffffffffc02015cc:	6798                	ld	a4,8(a5)
ffffffffc02015ce:	04d70f63          	beq	a4,a3,ffffffffc020162c <default_free_pages+0xe0>
ffffffffc02015d2:	87ba                	mv	a5,a4
ffffffffc02015d4:	fe878713          	addi	a4,a5,-24
ffffffffc02015d8:	fee57ae3          	bgeu	a0,a4,ffffffffc02015cc <default_free_pages+0x80>
ffffffffc02015dc:	00080663          	beqz	a6,ffffffffc02015e8 <default_free_pages+0x9c>
ffffffffc02015e0:	0003c817          	auipc	a6,0x3c
ffffffffc02015e4:	8cb83823          	sd	a1,-1840(a6) # ffffffffc023ceb0 <free_area>
ffffffffc02015e8:	638c                	ld	a1,0(a5)
ffffffffc02015ea:	e390                	sd	a2,0(a5)
ffffffffc02015ec:	e590                	sd	a2,8(a1)
ffffffffc02015ee:	f11c                	sd	a5,32(a0)
ffffffffc02015f0:	ed0c                	sd	a1,24(a0)
ffffffffc02015f2:	06d58a63          	beq	a1,a3,ffffffffc0201666 <default_free_pages+0x11a>
ffffffffc02015f6:	ff85a603          	lw	a2,-8(a1)
ffffffffc02015fa:	fe858713          	addi	a4,a1,-24
ffffffffc02015fe:	02061793          	slli	a5,a2,0x20
ffffffffc0201602:	83e9                	srli	a5,a5,0x1a
ffffffffc0201604:	97ba                	add	a5,a5,a4
ffffffffc0201606:	04f51b63          	bne	a0,a5,ffffffffc020165c <default_free_pages+0x110>
ffffffffc020160a:	491c                	lw	a5,16(a0)
ffffffffc020160c:	9e3d                	addw	a2,a2,a5
ffffffffc020160e:	fec5ac23          	sw	a2,-8(a1)
ffffffffc0201612:	57f5                	li	a5,-3
ffffffffc0201614:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201618:	01853803          	ld	a6,24(a0)
ffffffffc020161c:	7110                	ld	a2,32(a0)
ffffffffc020161e:	853a                	mv	a0,a4
ffffffffc0201620:	00c83423          	sd	a2,8(a6)
ffffffffc0201624:	659c                	ld	a5,8(a1)
ffffffffc0201626:	01063023          	sd	a6,0(a2)
ffffffffc020162a:	a815                	j	ffffffffc020165e <default_free_pages+0x112>
ffffffffc020162c:	e790                	sd	a2,8(a5)
ffffffffc020162e:	f114                	sd	a3,32(a0)
ffffffffc0201630:	6798                	ld	a4,8(a5)
ffffffffc0201632:	ed1c                	sd	a5,24(a0)
ffffffffc0201634:	85b2                	mv	a1,a2
ffffffffc0201636:	00d70563          	beq	a4,a3,ffffffffc0201640 <default_free_pages+0xf4>
ffffffffc020163a:	4805                	li	a6,1
ffffffffc020163c:	87ba                	mv	a5,a4
ffffffffc020163e:	bf59                	j	ffffffffc02015d4 <default_free_pages+0x88>
ffffffffc0201640:	e290                	sd	a2,0(a3)
ffffffffc0201642:	85be                	mv	a1,a5
ffffffffc0201644:	00d78d63          	beq	a5,a3,ffffffffc020165e <default_free_pages+0x112>
ffffffffc0201648:	ff85a603          	lw	a2,-8(a1)
ffffffffc020164c:	fe858713          	addi	a4,a1,-24
ffffffffc0201650:	02061793          	slli	a5,a2,0x20
ffffffffc0201654:	83e9                	srli	a5,a5,0x1a
ffffffffc0201656:	97ba                	add	a5,a5,a4
ffffffffc0201658:	faf509e3          	beq	a0,a5,ffffffffc020160a <default_free_pages+0xbe>
ffffffffc020165c:	711c                	ld	a5,32(a0)
ffffffffc020165e:	fe878713          	addi	a4,a5,-24
ffffffffc0201662:	00d78963          	beq	a5,a3,ffffffffc0201674 <default_free_pages+0x128>
ffffffffc0201666:	4910                	lw	a2,16(a0)
ffffffffc0201668:	02061693          	slli	a3,a2,0x20
ffffffffc020166c:	82e9                	srli	a3,a3,0x1a
ffffffffc020166e:	96aa                	add	a3,a3,a0
ffffffffc0201670:	00d70e63          	beq	a4,a3,ffffffffc020168c <default_free_pages+0x140>
ffffffffc0201674:	60a2                	ld	ra,8(sp)
ffffffffc0201676:	0141                	addi	sp,sp,16
ffffffffc0201678:	8082                	ret
ffffffffc020167a:	60a2                	ld	ra,8(sp)
ffffffffc020167c:	01850713          	addi	a4,a0,24
ffffffffc0201680:	e398                	sd	a4,0(a5)
ffffffffc0201682:	e798                	sd	a4,8(a5)
ffffffffc0201684:	f11c                	sd	a5,32(a0)
ffffffffc0201686:	ed1c                	sd	a5,24(a0)
ffffffffc0201688:	0141                	addi	sp,sp,16
ffffffffc020168a:	8082                	ret
ffffffffc020168c:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201690:	ff078693          	addi	a3,a5,-16
ffffffffc0201694:	9e39                	addw	a2,a2,a4
ffffffffc0201696:	c910                	sw	a2,16(a0)
ffffffffc0201698:	5775                	li	a4,-3
ffffffffc020169a:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc020169e:	6398                	ld	a4,0(a5)
ffffffffc02016a0:	679c                	ld	a5,8(a5)
ffffffffc02016a2:	60a2                	ld	ra,8(sp)
ffffffffc02016a4:	e71c                	sd	a5,8(a4)
ffffffffc02016a6:	e398                	sd	a4,0(a5)
ffffffffc02016a8:	0141                	addi	sp,sp,16
ffffffffc02016aa:	8082                	ret
ffffffffc02016ac:	00008697          	auipc	a3,0x8
ffffffffc02016b0:	2dc68693          	addi	a3,a3,732 # ffffffffc0209988 <commands+0xbc8>
ffffffffc02016b4:	00008617          	auipc	a2,0x8
ffffffffc02016b8:	bcc60613          	addi	a2,a2,-1076 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02016bc:	08300593          	li	a1,131
ffffffffc02016c0:	00008517          	auipc	a0,0x8
ffffffffc02016c4:	f8850513          	addi	a0,a0,-120 # ffffffffc0209648 <commands+0x888>
ffffffffc02016c8:	dbdfe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02016cc:	00008697          	auipc	a3,0x8
ffffffffc02016d0:	2e468693          	addi	a3,a3,740 # ffffffffc02099b0 <commands+0xbf0>
ffffffffc02016d4:	00008617          	auipc	a2,0x8
ffffffffc02016d8:	bac60613          	addi	a2,a2,-1108 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02016dc:	08000593          	li	a1,128
ffffffffc02016e0:	00008517          	auipc	a0,0x8
ffffffffc02016e4:	f6850513          	addi	a0,a0,-152 # ffffffffc0209648 <commands+0x888>
ffffffffc02016e8:	d9dfe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02016ec <default_alloc_pages>:
ffffffffc02016ec:	c959                	beqz	a0,ffffffffc0201782 <default_alloc_pages+0x96>
ffffffffc02016ee:	0003b597          	auipc	a1,0x3b
ffffffffc02016f2:	7c258593          	addi	a1,a1,1986 # ffffffffc023ceb0 <free_area>
ffffffffc02016f6:	0105a803          	lw	a6,16(a1)
ffffffffc02016fa:	862a                	mv	a2,a0
ffffffffc02016fc:	02081793          	slli	a5,a6,0x20
ffffffffc0201700:	9381                	srli	a5,a5,0x20
ffffffffc0201702:	00a7ee63          	bltu	a5,a0,ffffffffc020171e <default_alloc_pages+0x32>
ffffffffc0201706:	87ae                	mv	a5,a1
ffffffffc0201708:	a801                	j	ffffffffc0201718 <default_alloc_pages+0x2c>
ffffffffc020170a:	ff87a703          	lw	a4,-8(a5)
ffffffffc020170e:	02071693          	slli	a3,a4,0x20
ffffffffc0201712:	9281                	srli	a3,a3,0x20
ffffffffc0201714:	00c6f763          	bgeu	a3,a2,ffffffffc0201722 <default_alloc_pages+0x36>
ffffffffc0201718:	679c                	ld	a5,8(a5)
ffffffffc020171a:	feb798e3          	bne	a5,a1,ffffffffc020170a <default_alloc_pages+0x1e>
ffffffffc020171e:	4501                	li	a0,0
ffffffffc0201720:	8082                	ret
ffffffffc0201722:	fe878513          	addi	a0,a5,-24
ffffffffc0201726:	dd6d                	beqz	a0,ffffffffc0201720 <default_alloc_pages+0x34>
ffffffffc0201728:	0007b883          	ld	a7,0(a5)
ffffffffc020172c:	0087b303          	ld	t1,8(a5)
ffffffffc0201730:	00060e1b          	sext.w	t3,a2
ffffffffc0201734:	0068b423          	sd	t1,8(a7)
ffffffffc0201738:	01133023          	sd	a7,0(t1)
ffffffffc020173c:	02d67863          	bgeu	a2,a3,ffffffffc020176c <default_alloc_pages+0x80>
ffffffffc0201740:	061a                	slli	a2,a2,0x6
ffffffffc0201742:	962a                	add	a2,a2,a0
ffffffffc0201744:	41c7073b          	subw	a4,a4,t3
ffffffffc0201748:	ca18                	sw	a4,16(a2)
ffffffffc020174a:	00860693          	addi	a3,a2,8
ffffffffc020174e:	4709                	li	a4,2
ffffffffc0201750:	40e6b02f          	amoor.d	zero,a4,(a3)
ffffffffc0201754:	0088b703          	ld	a4,8(a7)
ffffffffc0201758:	01860693          	addi	a3,a2,24
ffffffffc020175c:	0105a803          	lw	a6,16(a1)
ffffffffc0201760:	e314                	sd	a3,0(a4)
ffffffffc0201762:	00d8b423          	sd	a3,8(a7)
ffffffffc0201766:	f218                	sd	a4,32(a2)
ffffffffc0201768:	01163c23          	sd	a7,24(a2)
ffffffffc020176c:	41c8083b          	subw	a6,a6,t3
ffffffffc0201770:	0003b717          	auipc	a4,0x3b
ffffffffc0201774:	75072823          	sw	a6,1872(a4) # ffffffffc023cec0 <free_area+0x10>
ffffffffc0201778:	5775                	li	a4,-3
ffffffffc020177a:	17c1                	addi	a5,a5,-16
ffffffffc020177c:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201780:	8082                	ret
ffffffffc0201782:	1141                	addi	sp,sp,-16
ffffffffc0201784:	00008697          	auipc	a3,0x8
ffffffffc0201788:	22c68693          	addi	a3,a3,556 # ffffffffc02099b0 <commands+0xbf0>
ffffffffc020178c:	00008617          	auipc	a2,0x8
ffffffffc0201790:	af460613          	addi	a2,a2,-1292 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0201794:	06200593          	li	a1,98
ffffffffc0201798:	00008517          	auipc	a0,0x8
ffffffffc020179c:	eb050513          	addi	a0,a0,-336 # ffffffffc0209648 <commands+0x888>
ffffffffc02017a0:	e406                	sd	ra,8(sp)
ffffffffc02017a2:	ce3fe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02017a6 <default_init_memmap>:
ffffffffc02017a6:	1141                	addi	sp,sp,-16
ffffffffc02017a8:	e406                	sd	ra,8(sp)
ffffffffc02017aa:	c1ed                	beqz	a1,ffffffffc020188c <default_init_memmap+0xe6>
ffffffffc02017ac:	00659693          	slli	a3,a1,0x6
ffffffffc02017b0:	96aa                	add	a3,a3,a0
ffffffffc02017b2:	02d50463          	beq	a0,a3,ffffffffc02017da <default_init_memmap+0x34>
ffffffffc02017b6:	6518                	ld	a4,8(a0)
ffffffffc02017b8:	87aa                	mv	a5,a0
ffffffffc02017ba:	8b05                	andi	a4,a4,1
ffffffffc02017bc:	e709                	bnez	a4,ffffffffc02017c6 <default_init_memmap+0x20>
ffffffffc02017be:	a07d                	j	ffffffffc020186c <default_init_memmap+0xc6>
ffffffffc02017c0:	6798                	ld	a4,8(a5)
ffffffffc02017c2:	8b05                	andi	a4,a4,1
ffffffffc02017c4:	c745                	beqz	a4,ffffffffc020186c <default_init_memmap+0xc6>
ffffffffc02017c6:	0007a823          	sw	zero,16(a5)
ffffffffc02017ca:	0007b423          	sd	zero,8(a5)
ffffffffc02017ce:	0007a023          	sw	zero,0(a5)
ffffffffc02017d2:	04078793          	addi	a5,a5,64
ffffffffc02017d6:	fed795e3          	bne	a5,a3,ffffffffc02017c0 <default_init_memmap+0x1a>
ffffffffc02017da:	2581                	sext.w	a1,a1
ffffffffc02017dc:	c90c                	sw	a1,16(a0)
ffffffffc02017de:	4789                	li	a5,2
ffffffffc02017e0:	00850713          	addi	a4,a0,8
ffffffffc02017e4:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc02017e8:	0003b697          	auipc	a3,0x3b
ffffffffc02017ec:	6c868693          	addi	a3,a3,1736 # ffffffffc023ceb0 <free_area>
ffffffffc02017f0:	4a98                	lw	a4,16(a3)
ffffffffc02017f2:	669c                	ld	a5,8(a3)
ffffffffc02017f4:	9db9                	addw	a1,a1,a4
ffffffffc02017f6:	0003b717          	auipc	a4,0x3b
ffffffffc02017fa:	6cb72523          	sw	a1,1738(a4) # ffffffffc023cec0 <free_area+0x10>
ffffffffc02017fe:	04d78a63          	beq	a5,a3,ffffffffc0201852 <default_init_memmap+0xac>
ffffffffc0201802:	fe878713          	addi	a4,a5,-24
ffffffffc0201806:	628c                	ld	a1,0(a3)
ffffffffc0201808:	4801                	li	a6,0
ffffffffc020180a:	01850613          	addi	a2,a0,24
ffffffffc020180e:	00e56a63          	bltu	a0,a4,ffffffffc0201822 <default_init_memmap+0x7c>
ffffffffc0201812:	6798                	ld	a4,8(a5)
ffffffffc0201814:	02d70563          	beq	a4,a3,ffffffffc020183e <default_init_memmap+0x98>
ffffffffc0201818:	87ba                	mv	a5,a4
ffffffffc020181a:	fe878713          	addi	a4,a5,-24
ffffffffc020181e:	fee57ae3          	bgeu	a0,a4,ffffffffc0201812 <default_init_memmap+0x6c>
ffffffffc0201822:	00080663          	beqz	a6,ffffffffc020182e <default_init_memmap+0x88>
ffffffffc0201826:	0003b717          	auipc	a4,0x3b
ffffffffc020182a:	68b73523          	sd	a1,1674(a4) # ffffffffc023ceb0 <free_area>
ffffffffc020182e:	6398                	ld	a4,0(a5)
ffffffffc0201830:	60a2                	ld	ra,8(sp)
ffffffffc0201832:	e390                	sd	a2,0(a5)
ffffffffc0201834:	e710                	sd	a2,8(a4)
ffffffffc0201836:	f11c                	sd	a5,32(a0)
ffffffffc0201838:	ed18                	sd	a4,24(a0)
ffffffffc020183a:	0141                	addi	sp,sp,16
ffffffffc020183c:	8082                	ret
ffffffffc020183e:	e790                	sd	a2,8(a5)
ffffffffc0201840:	f114                	sd	a3,32(a0)
ffffffffc0201842:	6798                	ld	a4,8(a5)
ffffffffc0201844:	ed1c                	sd	a5,24(a0)
ffffffffc0201846:	85b2                	mv	a1,a2
ffffffffc0201848:	00d70e63          	beq	a4,a3,ffffffffc0201864 <default_init_memmap+0xbe>
ffffffffc020184c:	4805                	li	a6,1
ffffffffc020184e:	87ba                	mv	a5,a4
ffffffffc0201850:	b7e9                	j	ffffffffc020181a <default_init_memmap+0x74>
ffffffffc0201852:	60a2                	ld	ra,8(sp)
ffffffffc0201854:	01850713          	addi	a4,a0,24
ffffffffc0201858:	e398                	sd	a4,0(a5)
ffffffffc020185a:	e798                	sd	a4,8(a5)
ffffffffc020185c:	f11c                	sd	a5,32(a0)
ffffffffc020185e:	ed1c                	sd	a5,24(a0)
ffffffffc0201860:	0141                	addi	sp,sp,16
ffffffffc0201862:	8082                	ret
ffffffffc0201864:	60a2                	ld	ra,8(sp)
ffffffffc0201866:	e290                	sd	a2,0(a3)
ffffffffc0201868:	0141                	addi	sp,sp,16
ffffffffc020186a:	8082                	ret
ffffffffc020186c:	00008697          	auipc	a3,0x8
ffffffffc0201870:	14c68693          	addi	a3,a3,332 # ffffffffc02099b8 <commands+0xbf8>
ffffffffc0201874:	00008617          	auipc	a2,0x8
ffffffffc0201878:	a0c60613          	addi	a2,a2,-1524 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020187c:	04900593          	li	a1,73
ffffffffc0201880:	00008517          	auipc	a0,0x8
ffffffffc0201884:	dc850513          	addi	a0,a0,-568 # ffffffffc0209648 <commands+0x888>
ffffffffc0201888:	bfdfe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020188c:	00008697          	auipc	a3,0x8
ffffffffc0201890:	12468693          	addi	a3,a3,292 # ffffffffc02099b0 <commands+0xbf0>
ffffffffc0201894:	00008617          	auipc	a2,0x8
ffffffffc0201898:	9ec60613          	addi	a2,a2,-1556 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020189c:	04600593          	li	a1,70
ffffffffc02018a0:	00008517          	auipc	a0,0x8
ffffffffc02018a4:	da850513          	addi	a0,a0,-600 # ffffffffc0209648 <commands+0x888>
ffffffffc02018a8:	bddfe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02018ac <slob_free>:
ffffffffc02018ac:	c125                	beqz	a0,ffffffffc020190c <slob_free+0x60>
ffffffffc02018ae:	e1a5                	bnez	a1,ffffffffc020190e <slob_free+0x62>
ffffffffc02018b0:	100027f3          	csrr	a5,sstatus
ffffffffc02018b4:	8b89                	andi	a5,a5,2
ffffffffc02018b6:	4581                	li	a1,0
ffffffffc02018b8:	e3bd                	bnez	a5,ffffffffc020191e <slob_free+0x72>
ffffffffc02018ba:	00030797          	auipc	a5,0x30
ffffffffc02018be:	14e78793          	addi	a5,a5,334 # ffffffffc0231a08 <slobfree>
ffffffffc02018c2:	639c                	ld	a5,0(a5)
ffffffffc02018c4:	6798                	ld	a4,8(a5)
ffffffffc02018c6:	00a7fa63          	bgeu	a5,a0,ffffffffc02018da <slob_free+0x2e>
ffffffffc02018ca:	00e56c63          	bltu	a0,a4,ffffffffc02018e2 <slob_free+0x36>
ffffffffc02018ce:	00e7fa63          	bgeu	a5,a4,ffffffffc02018e2 <slob_free+0x36>
ffffffffc02018d2:	87ba                	mv	a5,a4
ffffffffc02018d4:	6798                	ld	a4,8(a5)
ffffffffc02018d6:	fea7eae3          	bltu	a5,a0,ffffffffc02018ca <slob_free+0x1e>
ffffffffc02018da:	fee7ece3          	bltu	a5,a4,ffffffffc02018d2 <slob_free+0x26>
ffffffffc02018de:	fee57ae3          	bgeu	a0,a4,ffffffffc02018d2 <slob_free+0x26>
ffffffffc02018e2:	4110                	lw	a2,0(a0)
ffffffffc02018e4:	00461693          	slli	a3,a2,0x4
ffffffffc02018e8:	96aa                	add	a3,a3,a0
ffffffffc02018ea:	08d70b63          	beq	a4,a3,ffffffffc0201980 <slob_free+0xd4>
ffffffffc02018ee:	4394                	lw	a3,0(a5)
ffffffffc02018f0:	e518                	sd	a4,8(a0)
ffffffffc02018f2:	00469713          	slli	a4,a3,0x4
ffffffffc02018f6:	973e                	add	a4,a4,a5
ffffffffc02018f8:	08e50f63          	beq	a0,a4,ffffffffc0201996 <slob_free+0xea>
ffffffffc02018fc:	e788                	sd	a0,8(a5)
ffffffffc02018fe:	00030717          	auipc	a4,0x30
ffffffffc0201902:	10f73523          	sd	a5,266(a4) # ffffffffc0231a08 <slobfree>
ffffffffc0201906:	c199                	beqz	a1,ffffffffc020190c <slob_free+0x60>
ffffffffc0201908:	d3dfe06f          	j	ffffffffc0200644 <intr_enable>
ffffffffc020190c:	8082                	ret
ffffffffc020190e:	05bd                	addi	a1,a1,15
ffffffffc0201910:	8191                	srli	a1,a1,0x4
ffffffffc0201912:	c10c                	sw	a1,0(a0)
ffffffffc0201914:	100027f3          	csrr	a5,sstatus
ffffffffc0201918:	8b89                	andi	a5,a5,2
ffffffffc020191a:	4581                	li	a1,0
ffffffffc020191c:	dfd9                	beqz	a5,ffffffffc02018ba <slob_free+0xe>
ffffffffc020191e:	1101                	addi	sp,sp,-32
ffffffffc0201920:	e42a                	sd	a0,8(sp)
ffffffffc0201922:	ec06                	sd	ra,24(sp)
ffffffffc0201924:	d27fe0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0201928:	00030797          	auipc	a5,0x30
ffffffffc020192c:	0e078793          	addi	a5,a5,224 # ffffffffc0231a08 <slobfree>
ffffffffc0201930:	639c                	ld	a5,0(a5)
ffffffffc0201932:	6522                	ld	a0,8(sp)
ffffffffc0201934:	4585                	li	a1,1
ffffffffc0201936:	6798                	ld	a4,8(a5)
ffffffffc0201938:	00a7fa63          	bgeu	a5,a0,ffffffffc020194c <slob_free+0xa0>
ffffffffc020193c:	00e56c63          	bltu	a0,a4,ffffffffc0201954 <slob_free+0xa8>
ffffffffc0201940:	00e7fa63          	bgeu	a5,a4,ffffffffc0201954 <slob_free+0xa8>
ffffffffc0201944:	87ba                	mv	a5,a4
ffffffffc0201946:	6798                	ld	a4,8(a5)
ffffffffc0201948:	fea7eae3          	bltu	a5,a0,ffffffffc020193c <slob_free+0x90>
ffffffffc020194c:	fee7ece3          	bltu	a5,a4,ffffffffc0201944 <slob_free+0x98>
ffffffffc0201950:	fee57ae3          	bgeu	a0,a4,ffffffffc0201944 <slob_free+0x98>
ffffffffc0201954:	4110                	lw	a2,0(a0)
ffffffffc0201956:	00461693          	slli	a3,a2,0x4
ffffffffc020195a:	96aa                	add	a3,a3,a0
ffffffffc020195c:	04d70763          	beq	a4,a3,ffffffffc02019aa <slob_free+0xfe>
ffffffffc0201960:	e518                	sd	a4,8(a0)
ffffffffc0201962:	4394                	lw	a3,0(a5)
ffffffffc0201964:	00469713          	slli	a4,a3,0x4
ffffffffc0201968:	973e                	add	a4,a4,a5
ffffffffc020196a:	04e50663          	beq	a0,a4,ffffffffc02019b6 <slob_free+0x10a>
ffffffffc020196e:	e788                	sd	a0,8(a5)
ffffffffc0201970:	00030717          	auipc	a4,0x30
ffffffffc0201974:	08f73c23          	sd	a5,152(a4) # ffffffffc0231a08 <slobfree>
ffffffffc0201978:	e58d                	bnez	a1,ffffffffc02019a2 <slob_free+0xf6>
ffffffffc020197a:	60e2                	ld	ra,24(sp)
ffffffffc020197c:	6105                	addi	sp,sp,32
ffffffffc020197e:	8082                	ret
ffffffffc0201980:	4314                	lw	a3,0(a4)
ffffffffc0201982:	6718                	ld	a4,8(a4)
ffffffffc0201984:	9e35                	addw	a2,a2,a3
ffffffffc0201986:	c110                	sw	a2,0(a0)
ffffffffc0201988:	4394                	lw	a3,0(a5)
ffffffffc020198a:	e518                	sd	a4,8(a0)
ffffffffc020198c:	00469713          	slli	a4,a3,0x4
ffffffffc0201990:	973e                	add	a4,a4,a5
ffffffffc0201992:	f6e515e3          	bne	a0,a4,ffffffffc02018fc <slob_free+0x50>
ffffffffc0201996:	4118                	lw	a4,0(a0)
ffffffffc0201998:	6510                	ld	a2,8(a0)
ffffffffc020199a:	9eb9                	addw	a3,a3,a4
ffffffffc020199c:	c394                	sw	a3,0(a5)
ffffffffc020199e:	e790                	sd	a2,8(a5)
ffffffffc02019a0:	bfb9                	j	ffffffffc02018fe <slob_free+0x52>
ffffffffc02019a2:	60e2                	ld	ra,24(sp)
ffffffffc02019a4:	6105                	addi	sp,sp,32
ffffffffc02019a6:	c9ffe06f          	j	ffffffffc0200644 <intr_enable>
ffffffffc02019aa:	4314                	lw	a3,0(a4)
ffffffffc02019ac:	6718                	ld	a4,8(a4)
ffffffffc02019ae:	9e35                	addw	a2,a2,a3
ffffffffc02019b0:	c110                	sw	a2,0(a0)
ffffffffc02019b2:	e518                	sd	a4,8(a0)
ffffffffc02019b4:	b77d                	j	ffffffffc0201962 <slob_free+0xb6>
ffffffffc02019b6:	4118                	lw	a4,0(a0)
ffffffffc02019b8:	6510                	ld	a2,8(a0)
ffffffffc02019ba:	9eb9                	addw	a3,a3,a4
ffffffffc02019bc:	c394                	sw	a3,0(a5)
ffffffffc02019be:	e790                	sd	a2,8(a5)
ffffffffc02019c0:	bf45                	j	ffffffffc0201970 <slob_free+0xc4>

ffffffffc02019c2 <__slob_get_free_pages.isra.0>:
ffffffffc02019c2:	4785                	li	a5,1
ffffffffc02019c4:	1141                	addi	sp,sp,-16
ffffffffc02019c6:	00a7953b          	sllw	a0,a5,a0
ffffffffc02019ca:	e406                	sd	ra,8(sp)
ffffffffc02019cc:	378000ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc02019d0:	cd1d                	beqz	a0,ffffffffc0201a0e <__slob_get_free_pages.isra.0+0x4c>
ffffffffc02019d2:	0003b797          	auipc	a5,0x3b
ffffffffc02019d6:	50e78793          	addi	a5,a5,1294 # ffffffffc023cee0 <pages>
ffffffffc02019da:	6394                	ld	a3,0(a5)
ffffffffc02019dc:	0000a797          	auipc	a5,0xa
ffffffffc02019e0:	0d478793          	addi	a5,a5,212 # ffffffffc020bab0 <nbase>
ffffffffc02019e4:	8d15                	sub	a0,a0,a3
ffffffffc02019e6:	6394                	ld	a3,0(a5)
ffffffffc02019e8:	8519                	srai	a0,a0,0x6
ffffffffc02019ea:	0003b797          	auipc	a5,0x3b
ffffffffc02019ee:	47678793          	addi	a5,a5,1142 # ffffffffc023ce60 <npage>
ffffffffc02019f2:	9536                	add	a0,a0,a3
ffffffffc02019f4:	6398                	ld	a4,0(a5)
ffffffffc02019f6:	00c51793          	slli	a5,a0,0xc
ffffffffc02019fa:	83b1                	srli	a5,a5,0xc
ffffffffc02019fc:	0532                	slli	a0,a0,0xc
ffffffffc02019fe:	00e7fb63          	bgeu	a5,a4,ffffffffc0201a14 <__slob_get_free_pages.isra.0+0x52>
ffffffffc0201a02:	0003b797          	auipc	a5,0x3b
ffffffffc0201a06:	4ce78793          	addi	a5,a5,1230 # ffffffffc023ced0 <va_pa_offset>
ffffffffc0201a0a:	6394                	ld	a3,0(a5)
ffffffffc0201a0c:	9536                	add	a0,a0,a3
ffffffffc0201a0e:	60a2                	ld	ra,8(sp)
ffffffffc0201a10:	0141                	addi	sp,sp,16
ffffffffc0201a12:	8082                	ret
ffffffffc0201a14:	86aa                	mv	a3,a0
ffffffffc0201a16:	00008617          	auipc	a2,0x8
ffffffffc0201a1a:	00260613          	addi	a2,a2,2 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0201a1e:	06900593          	li	a1,105
ffffffffc0201a22:	00008517          	auipc	a0,0x8
ffffffffc0201a26:	01e50513          	addi	a0,a0,30 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0201a2a:	a5bfe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0201a2e <slob_alloc.isra.1.constprop.3>:
ffffffffc0201a2e:	1101                	addi	sp,sp,-32
ffffffffc0201a30:	ec06                	sd	ra,24(sp)
ffffffffc0201a32:	e822                	sd	s0,16(sp)
ffffffffc0201a34:	e426                	sd	s1,8(sp)
ffffffffc0201a36:	e04a                	sd	s2,0(sp)
ffffffffc0201a38:	01050713          	addi	a4,a0,16
ffffffffc0201a3c:	6785                	lui	a5,0x1
ffffffffc0201a3e:	0cf77563          	bgeu	a4,a5,ffffffffc0201b08 <slob_alloc.isra.1.constprop.3+0xda>
ffffffffc0201a42:	00f50493          	addi	s1,a0,15
ffffffffc0201a46:	8091                	srli	s1,s1,0x4
ffffffffc0201a48:	2481                	sext.w	s1,s1
ffffffffc0201a4a:	10002673          	csrr	a2,sstatus
ffffffffc0201a4e:	8a09                	andi	a2,a2,2
ffffffffc0201a50:	e64d                	bnez	a2,ffffffffc0201afa <slob_alloc.isra.1.constprop.3+0xcc>
ffffffffc0201a52:	00030917          	auipc	s2,0x30
ffffffffc0201a56:	fb690913          	addi	s2,s2,-74 # ffffffffc0231a08 <slobfree>
ffffffffc0201a5a:	00093683          	ld	a3,0(s2)
ffffffffc0201a5e:	669c                	ld	a5,8(a3)
ffffffffc0201a60:	4398                	lw	a4,0(a5)
ffffffffc0201a62:	0a975063          	bge	a4,s1,ffffffffc0201b02 <slob_alloc.isra.1.constprop.3+0xd4>
ffffffffc0201a66:	00d78b63          	beq	a5,a3,ffffffffc0201a7c <slob_alloc.isra.1.constprop.3+0x4e>
ffffffffc0201a6a:	6780                	ld	s0,8(a5)
ffffffffc0201a6c:	4018                	lw	a4,0(s0)
ffffffffc0201a6e:	02975a63          	bge	a4,s1,ffffffffc0201aa2 <slob_alloc.isra.1.constprop.3+0x74>
ffffffffc0201a72:	00093683          	ld	a3,0(s2)
ffffffffc0201a76:	87a2                	mv	a5,s0
ffffffffc0201a78:	fed799e3          	bne	a5,a3,ffffffffc0201a6a <slob_alloc.isra.1.constprop.3+0x3c>
ffffffffc0201a7c:	e225                	bnez	a2,ffffffffc0201adc <slob_alloc.isra.1.constprop.3+0xae>
ffffffffc0201a7e:	4501                	li	a0,0
ffffffffc0201a80:	f43ff0ef          	jal	ra,ffffffffc02019c2 <__slob_get_free_pages.isra.0>
ffffffffc0201a84:	842a                	mv	s0,a0
ffffffffc0201a86:	cd15                	beqz	a0,ffffffffc0201ac2 <slob_alloc.isra.1.constprop.3+0x94>
ffffffffc0201a88:	6585                	lui	a1,0x1
ffffffffc0201a8a:	e23ff0ef          	jal	ra,ffffffffc02018ac <slob_free>
ffffffffc0201a8e:	10002673          	csrr	a2,sstatus
ffffffffc0201a92:	8a09                	andi	a2,a2,2
ffffffffc0201a94:	ee15                	bnez	a2,ffffffffc0201ad0 <slob_alloc.isra.1.constprop.3+0xa2>
ffffffffc0201a96:	00093783          	ld	a5,0(s2)
ffffffffc0201a9a:	6780                	ld	s0,8(a5)
ffffffffc0201a9c:	4018                	lw	a4,0(s0)
ffffffffc0201a9e:	fc974ae3          	blt	a4,s1,ffffffffc0201a72 <slob_alloc.isra.1.constprop.3+0x44>
ffffffffc0201aa2:	04e48963          	beq	s1,a4,ffffffffc0201af4 <slob_alloc.isra.1.constprop.3+0xc6>
ffffffffc0201aa6:	00449693          	slli	a3,s1,0x4
ffffffffc0201aaa:	96a2                	add	a3,a3,s0
ffffffffc0201aac:	e794                	sd	a3,8(a5)
ffffffffc0201aae:	640c                	ld	a1,8(s0)
ffffffffc0201ab0:	9f05                	subw	a4,a4,s1
ffffffffc0201ab2:	c298                	sw	a4,0(a3)
ffffffffc0201ab4:	e68c                	sd	a1,8(a3)
ffffffffc0201ab6:	c004                	sw	s1,0(s0)
ffffffffc0201ab8:	00030717          	auipc	a4,0x30
ffffffffc0201abc:	f4f73823          	sd	a5,-176(a4) # ffffffffc0231a08 <slobfree>
ffffffffc0201ac0:	e20d                	bnez	a2,ffffffffc0201ae2 <slob_alloc.isra.1.constprop.3+0xb4>
ffffffffc0201ac2:	8522                	mv	a0,s0
ffffffffc0201ac4:	60e2                	ld	ra,24(sp)
ffffffffc0201ac6:	6442                	ld	s0,16(sp)
ffffffffc0201ac8:	64a2                	ld	s1,8(sp)
ffffffffc0201aca:	6902                	ld	s2,0(sp)
ffffffffc0201acc:	6105                	addi	sp,sp,32
ffffffffc0201ace:	8082                	ret
ffffffffc0201ad0:	b7bfe0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0201ad4:	4605                	li	a2,1
ffffffffc0201ad6:	00093783          	ld	a5,0(s2)
ffffffffc0201ada:	b7c1                	j	ffffffffc0201a9a <slob_alloc.isra.1.constprop.3+0x6c>
ffffffffc0201adc:	b69fe0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0201ae0:	bf79                	j	ffffffffc0201a7e <slob_alloc.isra.1.constprop.3+0x50>
ffffffffc0201ae2:	b63fe0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0201ae6:	8522                	mv	a0,s0
ffffffffc0201ae8:	60e2                	ld	ra,24(sp)
ffffffffc0201aea:	6442                	ld	s0,16(sp)
ffffffffc0201aec:	64a2                	ld	s1,8(sp)
ffffffffc0201aee:	6902                	ld	s2,0(sp)
ffffffffc0201af0:	6105                	addi	sp,sp,32
ffffffffc0201af2:	8082                	ret
ffffffffc0201af4:	6418                	ld	a4,8(s0)
ffffffffc0201af6:	e798                	sd	a4,8(a5)
ffffffffc0201af8:	b7c1                	j	ffffffffc0201ab8 <slob_alloc.isra.1.constprop.3+0x8a>
ffffffffc0201afa:	b51fe0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0201afe:	4605                	li	a2,1
ffffffffc0201b00:	bf89                	j	ffffffffc0201a52 <slob_alloc.isra.1.constprop.3+0x24>
ffffffffc0201b02:	843e                	mv	s0,a5
ffffffffc0201b04:	87b6                	mv	a5,a3
ffffffffc0201b06:	bf71                	j	ffffffffc0201aa2 <slob_alloc.isra.1.constprop.3+0x74>
ffffffffc0201b08:	00008697          	auipc	a3,0x8
ffffffffc0201b0c:	fb068693          	addi	a3,a3,-80 # ffffffffc0209ab8 <default_pmm_manager+0xf0>
ffffffffc0201b10:	00007617          	auipc	a2,0x7
ffffffffc0201b14:	77060613          	addi	a2,a2,1904 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0201b18:	06400593          	li	a1,100
ffffffffc0201b1c:	00008517          	auipc	a0,0x8
ffffffffc0201b20:	fbc50513          	addi	a0,a0,-68 # ffffffffc0209ad8 <default_pmm_manager+0x110>
ffffffffc0201b24:	961fe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0201b28 <kmalloc_init>:
ffffffffc0201b28:	1141                	addi	sp,sp,-16
ffffffffc0201b2a:	00008517          	auipc	a0,0x8
ffffffffc0201b2e:	fc650513          	addi	a0,a0,-58 # ffffffffc0209af0 <default_pmm_manager+0x128>
ffffffffc0201b32:	e406                	sd	ra,8(sp)
ffffffffc0201b34:	e5efe0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0201b38:	60a2                	ld	ra,8(sp)
ffffffffc0201b3a:	00008517          	auipc	a0,0x8
ffffffffc0201b3e:	f5e50513          	addi	a0,a0,-162 # ffffffffc0209a98 <default_pmm_manager+0xd0>
ffffffffc0201b42:	0141                	addi	sp,sp,16
ffffffffc0201b44:	e4efe06f          	j	ffffffffc0200192 <cprintf>

ffffffffc0201b48 <kallocated>:
ffffffffc0201b48:	4501                	li	a0,0
ffffffffc0201b4a:	8082                	ret

ffffffffc0201b4c <kmalloc>:
ffffffffc0201b4c:	1101                	addi	sp,sp,-32
ffffffffc0201b4e:	e04a                	sd	s2,0(sp)
ffffffffc0201b50:	6905                	lui	s2,0x1
ffffffffc0201b52:	e822                	sd	s0,16(sp)
ffffffffc0201b54:	ec06                	sd	ra,24(sp)
ffffffffc0201b56:	e426                	sd	s1,8(sp)
ffffffffc0201b58:	fef90793          	addi	a5,s2,-17 # fef <_binary_obj___user_faultread_out_size-0xd69>
ffffffffc0201b5c:	842a                	mv	s0,a0
ffffffffc0201b5e:	04a7fc63          	bgeu	a5,a0,ffffffffc0201bb6 <kmalloc+0x6a>
ffffffffc0201b62:	4561                	li	a0,24
ffffffffc0201b64:	ecbff0ef          	jal	ra,ffffffffc0201a2e <slob_alloc.isra.1.constprop.3>
ffffffffc0201b68:	84aa                	mv	s1,a0
ffffffffc0201b6a:	cd21                	beqz	a0,ffffffffc0201bc2 <kmalloc+0x76>
ffffffffc0201b6c:	0004079b          	sext.w	a5,s0
ffffffffc0201b70:	4501                	li	a0,0
ffffffffc0201b72:	00f95763          	bge	s2,a5,ffffffffc0201b80 <kmalloc+0x34>
ffffffffc0201b76:	6705                	lui	a4,0x1
ffffffffc0201b78:	8785                	srai	a5,a5,0x1
ffffffffc0201b7a:	2505                	addiw	a0,a0,1
ffffffffc0201b7c:	fef74ee3          	blt	a4,a5,ffffffffc0201b78 <kmalloc+0x2c>
ffffffffc0201b80:	c088                	sw	a0,0(s1)
ffffffffc0201b82:	e41ff0ef          	jal	ra,ffffffffc02019c2 <__slob_get_free_pages.isra.0>
ffffffffc0201b86:	e488                	sd	a0,8(s1)
ffffffffc0201b88:	842a                	mv	s0,a0
ffffffffc0201b8a:	c935                	beqz	a0,ffffffffc0201bfe <kmalloc+0xb2>
ffffffffc0201b8c:	100027f3          	csrr	a5,sstatus
ffffffffc0201b90:	8b89                	andi	a5,a5,2
ffffffffc0201b92:	e3a1                	bnez	a5,ffffffffc0201bd2 <kmalloc+0x86>
ffffffffc0201b94:	0003b797          	auipc	a5,0x3b
ffffffffc0201b98:	2bc78793          	addi	a5,a5,700 # ffffffffc023ce50 <bigblocks>
ffffffffc0201b9c:	639c                	ld	a5,0(a5)
ffffffffc0201b9e:	0003b717          	auipc	a4,0x3b
ffffffffc0201ba2:	2a973923          	sd	s1,690(a4) # ffffffffc023ce50 <bigblocks>
ffffffffc0201ba6:	e89c                	sd	a5,16(s1)
ffffffffc0201ba8:	8522                	mv	a0,s0
ffffffffc0201baa:	60e2                	ld	ra,24(sp)
ffffffffc0201bac:	6442                	ld	s0,16(sp)
ffffffffc0201bae:	64a2                	ld	s1,8(sp)
ffffffffc0201bb0:	6902                	ld	s2,0(sp)
ffffffffc0201bb2:	6105                	addi	sp,sp,32
ffffffffc0201bb4:	8082                	ret
ffffffffc0201bb6:	0541                	addi	a0,a0,16
ffffffffc0201bb8:	e77ff0ef          	jal	ra,ffffffffc0201a2e <slob_alloc.isra.1.constprop.3>
ffffffffc0201bbc:	01050413          	addi	s0,a0,16
ffffffffc0201bc0:	f565                	bnez	a0,ffffffffc0201ba8 <kmalloc+0x5c>
ffffffffc0201bc2:	4401                	li	s0,0
ffffffffc0201bc4:	8522                	mv	a0,s0
ffffffffc0201bc6:	60e2                	ld	ra,24(sp)
ffffffffc0201bc8:	6442                	ld	s0,16(sp)
ffffffffc0201bca:	64a2                	ld	s1,8(sp)
ffffffffc0201bcc:	6902                	ld	s2,0(sp)
ffffffffc0201bce:	6105                	addi	sp,sp,32
ffffffffc0201bd0:	8082                	ret
ffffffffc0201bd2:	a79fe0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0201bd6:	0003b797          	auipc	a5,0x3b
ffffffffc0201bda:	27a78793          	addi	a5,a5,634 # ffffffffc023ce50 <bigblocks>
ffffffffc0201bde:	639c                	ld	a5,0(a5)
ffffffffc0201be0:	0003b717          	auipc	a4,0x3b
ffffffffc0201be4:	26973823          	sd	s1,624(a4) # ffffffffc023ce50 <bigblocks>
ffffffffc0201be8:	e89c                	sd	a5,16(s1)
ffffffffc0201bea:	a5bfe0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0201bee:	6480                	ld	s0,8(s1)
ffffffffc0201bf0:	60e2                	ld	ra,24(sp)
ffffffffc0201bf2:	64a2                	ld	s1,8(sp)
ffffffffc0201bf4:	8522                	mv	a0,s0
ffffffffc0201bf6:	6442                	ld	s0,16(sp)
ffffffffc0201bf8:	6902                	ld	s2,0(sp)
ffffffffc0201bfa:	6105                	addi	sp,sp,32
ffffffffc0201bfc:	8082                	ret
ffffffffc0201bfe:	45e1                	li	a1,24
ffffffffc0201c00:	8526                	mv	a0,s1
ffffffffc0201c02:	cabff0ef          	jal	ra,ffffffffc02018ac <slob_free>
ffffffffc0201c06:	b74d                	j	ffffffffc0201ba8 <kmalloc+0x5c>

ffffffffc0201c08 <kfree>:
ffffffffc0201c08:	c165                	beqz	a0,ffffffffc0201ce8 <kfree+0xe0>
ffffffffc0201c0a:	1101                	addi	sp,sp,-32
ffffffffc0201c0c:	e426                	sd	s1,8(sp)
ffffffffc0201c0e:	ec06                	sd	ra,24(sp)
ffffffffc0201c10:	e822                	sd	s0,16(sp)
ffffffffc0201c12:	03451793          	slli	a5,a0,0x34
ffffffffc0201c16:	84aa                	mv	s1,a0
ffffffffc0201c18:	eb8d                	bnez	a5,ffffffffc0201c4a <kfree+0x42>
ffffffffc0201c1a:	100027f3          	csrr	a5,sstatus
ffffffffc0201c1e:	8b89                	andi	a5,a5,2
ffffffffc0201c20:	ebd9                	bnez	a5,ffffffffc0201cb6 <kfree+0xae>
ffffffffc0201c22:	0003b797          	auipc	a5,0x3b
ffffffffc0201c26:	22e78793          	addi	a5,a5,558 # ffffffffc023ce50 <bigblocks>
ffffffffc0201c2a:	6394                	ld	a3,0(a5)
ffffffffc0201c2c:	ce99                	beqz	a3,ffffffffc0201c4a <kfree+0x42>
ffffffffc0201c2e:	669c                	ld	a5,8(a3)
ffffffffc0201c30:	6a80                	ld	s0,16(a3)
ffffffffc0201c32:	0af50c63          	beq	a0,a5,ffffffffc0201cea <kfree+0xe2>
ffffffffc0201c36:	4601                	li	a2,0
ffffffffc0201c38:	c801                	beqz	s0,ffffffffc0201c48 <kfree+0x40>
ffffffffc0201c3a:	6418                	ld	a4,8(s0)
ffffffffc0201c3c:	681c                	ld	a5,16(s0)
ffffffffc0201c3e:	00970e63          	beq	a4,s1,ffffffffc0201c5a <kfree+0x52>
ffffffffc0201c42:	86a2                	mv	a3,s0
ffffffffc0201c44:	843e                	mv	s0,a5
ffffffffc0201c46:	f875                	bnez	s0,ffffffffc0201c3a <kfree+0x32>
ffffffffc0201c48:	e649                	bnez	a2,ffffffffc0201cd2 <kfree+0xca>
ffffffffc0201c4a:	6442                	ld	s0,16(sp)
ffffffffc0201c4c:	60e2                	ld	ra,24(sp)
ffffffffc0201c4e:	ff048513          	addi	a0,s1,-16
ffffffffc0201c52:	64a2                	ld	s1,8(sp)
ffffffffc0201c54:	4581                	li	a1,0
ffffffffc0201c56:	6105                	addi	sp,sp,32
ffffffffc0201c58:	b991                	j	ffffffffc02018ac <slob_free>
ffffffffc0201c5a:	ea9c                	sd	a5,16(a3)
ffffffffc0201c5c:	e259                	bnez	a2,ffffffffc0201ce2 <kfree+0xda>
ffffffffc0201c5e:	c02007b7          	lui	a5,0xc0200
ffffffffc0201c62:	4018                	lw	a4,0(s0)
ffffffffc0201c64:	08f4e963          	bltu	s1,a5,ffffffffc0201cf6 <kfree+0xee>
ffffffffc0201c68:	0003b797          	auipc	a5,0x3b
ffffffffc0201c6c:	26878793          	addi	a5,a5,616 # ffffffffc023ced0 <va_pa_offset>
ffffffffc0201c70:	6394                	ld	a3,0(a5)
ffffffffc0201c72:	0003b797          	auipc	a5,0x3b
ffffffffc0201c76:	1ee78793          	addi	a5,a5,494 # ffffffffc023ce60 <npage>
ffffffffc0201c7a:	639c                	ld	a5,0(a5)
ffffffffc0201c7c:	8c95                	sub	s1,s1,a3
ffffffffc0201c7e:	80b1                	srli	s1,s1,0xc
ffffffffc0201c80:	08f4f863          	bgeu	s1,a5,ffffffffc0201d10 <kfree+0x108>
ffffffffc0201c84:	0000a797          	auipc	a5,0xa
ffffffffc0201c88:	e2c78793          	addi	a5,a5,-468 # ffffffffc020bab0 <nbase>
ffffffffc0201c8c:	639c                	ld	a5,0(a5)
ffffffffc0201c8e:	0003b697          	auipc	a3,0x3b
ffffffffc0201c92:	25268693          	addi	a3,a3,594 # ffffffffc023cee0 <pages>
ffffffffc0201c96:	6288                	ld	a0,0(a3)
ffffffffc0201c98:	8c9d                	sub	s1,s1,a5
ffffffffc0201c9a:	049a                	slli	s1,s1,0x6
ffffffffc0201c9c:	4585                	li	a1,1
ffffffffc0201c9e:	9526                	add	a0,a0,s1
ffffffffc0201ca0:	00e595bb          	sllw	a1,a1,a4
ffffffffc0201ca4:	128000ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0201ca8:	8522                	mv	a0,s0
ffffffffc0201caa:	6442                	ld	s0,16(sp)
ffffffffc0201cac:	60e2                	ld	ra,24(sp)
ffffffffc0201cae:	64a2                	ld	s1,8(sp)
ffffffffc0201cb0:	45e1                	li	a1,24
ffffffffc0201cb2:	6105                	addi	sp,sp,32
ffffffffc0201cb4:	bee5                	j	ffffffffc02018ac <slob_free>
ffffffffc0201cb6:	995fe0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0201cba:	0003b797          	auipc	a5,0x3b
ffffffffc0201cbe:	19678793          	addi	a5,a5,406 # ffffffffc023ce50 <bigblocks>
ffffffffc0201cc2:	6394                	ld	a3,0(a5)
ffffffffc0201cc4:	c699                	beqz	a3,ffffffffc0201cd2 <kfree+0xca>
ffffffffc0201cc6:	669c                	ld	a5,8(a3)
ffffffffc0201cc8:	6a80                	ld	s0,16(a3)
ffffffffc0201cca:	00f48763          	beq	s1,a5,ffffffffc0201cd8 <kfree+0xd0>
ffffffffc0201cce:	4605                	li	a2,1
ffffffffc0201cd0:	b7a5                	j	ffffffffc0201c38 <kfree+0x30>
ffffffffc0201cd2:	973fe0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0201cd6:	bf95                	j	ffffffffc0201c4a <kfree+0x42>
ffffffffc0201cd8:	0003b797          	auipc	a5,0x3b
ffffffffc0201cdc:	1687bc23          	sd	s0,376(a5) # ffffffffc023ce50 <bigblocks>
ffffffffc0201ce0:	8436                	mv	s0,a3
ffffffffc0201ce2:	963fe0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0201ce6:	bfa5                	j	ffffffffc0201c5e <kfree+0x56>
ffffffffc0201ce8:	8082                	ret
ffffffffc0201cea:	0003b797          	auipc	a5,0x3b
ffffffffc0201cee:	1687b323          	sd	s0,358(a5) # ffffffffc023ce50 <bigblocks>
ffffffffc0201cf2:	8436                	mv	s0,a3
ffffffffc0201cf4:	b7ad                	j	ffffffffc0201c5e <kfree+0x56>
ffffffffc0201cf6:	86a6                	mv	a3,s1
ffffffffc0201cf8:	00008617          	auipc	a2,0x8
ffffffffc0201cfc:	d5860613          	addi	a2,a2,-680 # ffffffffc0209a50 <default_pmm_manager+0x88>
ffffffffc0201d00:	06e00593          	li	a1,110
ffffffffc0201d04:	00008517          	auipc	a0,0x8
ffffffffc0201d08:	d3c50513          	addi	a0,a0,-708 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0201d0c:	f78fe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0201d10:	00008617          	auipc	a2,0x8
ffffffffc0201d14:	d6860613          	addi	a2,a2,-664 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc0201d18:	06200593          	li	a1,98
ffffffffc0201d1c:	00008517          	auipc	a0,0x8
ffffffffc0201d20:	d2450513          	addi	a0,a0,-732 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0201d24:	f60fe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0201d28 <pa2page.part.4>:
ffffffffc0201d28:	1141                	addi	sp,sp,-16
ffffffffc0201d2a:	00008617          	auipc	a2,0x8
ffffffffc0201d2e:	d4e60613          	addi	a2,a2,-690 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc0201d32:	06200593          	li	a1,98
ffffffffc0201d36:	00008517          	auipc	a0,0x8
ffffffffc0201d3a:	d0a50513          	addi	a0,a0,-758 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0201d3e:	e406                	sd	ra,8(sp)
ffffffffc0201d40:	f44fe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0201d44 <alloc_pages>:
ffffffffc0201d44:	715d                	addi	sp,sp,-80
ffffffffc0201d46:	e0a2                	sd	s0,64(sp)
ffffffffc0201d48:	fc26                	sd	s1,56(sp)
ffffffffc0201d4a:	f84a                	sd	s2,48(sp)
ffffffffc0201d4c:	f44e                	sd	s3,40(sp)
ffffffffc0201d4e:	f052                	sd	s4,32(sp)
ffffffffc0201d50:	ec56                	sd	s5,24(sp)
ffffffffc0201d52:	e486                	sd	ra,72(sp)
ffffffffc0201d54:	842a                	mv	s0,a0
ffffffffc0201d56:	0003b497          	auipc	s1,0x3b
ffffffffc0201d5a:	17248493          	addi	s1,s1,370 # ffffffffc023cec8 <pmm_manager>
ffffffffc0201d5e:	4985                	li	s3,1
ffffffffc0201d60:	0003ba17          	auipc	s4,0x3b
ffffffffc0201d64:	110a0a13          	addi	s4,s4,272 # ffffffffc023ce70 <swap_init_ok>
ffffffffc0201d68:	0005091b          	sext.w	s2,a0
ffffffffc0201d6c:	0003ba97          	auipc	s5,0x3b
ffffffffc0201d70:	254a8a93          	addi	s5,s5,596 # ffffffffc023cfc0 <check_mm_struct>
ffffffffc0201d74:	a00d                	j	ffffffffc0201d96 <alloc_pages+0x52>
ffffffffc0201d76:	609c                	ld	a5,0(s1)
ffffffffc0201d78:	6f9c                	ld	a5,24(a5)
ffffffffc0201d7a:	9782                	jalr	a5
ffffffffc0201d7c:	4601                	li	a2,0
ffffffffc0201d7e:	85ca                	mv	a1,s2
ffffffffc0201d80:	ed0d                	bnez	a0,ffffffffc0201dba <alloc_pages+0x76>
ffffffffc0201d82:	0289ec63          	bltu	s3,s0,ffffffffc0201dba <alloc_pages+0x76>
ffffffffc0201d86:	000a2783          	lw	a5,0(s4)
ffffffffc0201d8a:	2781                	sext.w	a5,a5
ffffffffc0201d8c:	c79d                	beqz	a5,ffffffffc0201dba <alloc_pages+0x76>
ffffffffc0201d8e:	000ab503          	ld	a0,0(s5)
ffffffffc0201d92:	16b010ef          	jal	ra,ffffffffc02036fc <swap_out>
ffffffffc0201d96:	100027f3          	csrr	a5,sstatus
ffffffffc0201d9a:	8b89                	andi	a5,a5,2
ffffffffc0201d9c:	8522                	mv	a0,s0
ffffffffc0201d9e:	dfe1                	beqz	a5,ffffffffc0201d76 <alloc_pages+0x32>
ffffffffc0201da0:	8abfe0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0201da4:	609c                	ld	a5,0(s1)
ffffffffc0201da6:	8522                	mv	a0,s0
ffffffffc0201da8:	6f9c                	ld	a5,24(a5)
ffffffffc0201daa:	9782                	jalr	a5
ffffffffc0201dac:	e42a                	sd	a0,8(sp)
ffffffffc0201dae:	897fe0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0201db2:	6522                	ld	a0,8(sp)
ffffffffc0201db4:	4601                	li	a2,0
ffffffffc0201db6:	85ca                	mv	a1,s2
ffffffffc0201db8:	d569                	beqz	a0,ffffffffc0201d82 <alloc_pages+0x3e>
ffffffffc0201dba:	60a6                	ld	ra,72(sp)
ffffffffc0201dbc:	6406                	ld	s0,64(sp)
ffffffffc0201dbe:	74e2                	ld	s1,56(sp)
ffffffffc0201dc0:	7942                	ld	s2,48(sp)
ffffffffc0201dc2:	79a2                	ld	s3,40(sp)
ffffffffc0201dc4:	7a02                	ld	s4,32(sp)
ffffffffc0201dc6:	6ae2                	ld	s5,24(sp)
ffffffffc0201dc8:	6161                	addi	sp,sp,80
ffffffffc0201dca:	8082                	ret

ffffffffc0201dcc <free_pages>:
ffffffffc0201dcc:	100027f3          	csrr	a5,sstatus
ffffffffc0201dd0:	8b89                	andi	a5,a5,2
ffffffffc0201dd2:	eb89                	bnez	a5,ffffffffc0201de4 <free_pages+0x18>
ffffffffc0201dd4:	0003b797          	auipc	a5,0x3b
ffffffffc0201dd8:	0f478793          	addi	a5,a5,244 # ffffffffc023cec8 <pmm_manager>
ffffffffc0201ddc:	639c                	ld	a5,0(a5)
ffffffffc0201dde:	0207b303          	ld	t1,32(a5)
ffffffffc0201de2:	8302                	jr	t1
ffffffffc0201de4:	1101                	addi	sp,sp,-32
ffffffffc0201de6:	ec06                	sd	ra,24(sp)
ffffffffc0201de8:	e822                	sd	s0,16(sp)
ffffffffc0201dea:	e426                	sd	s1,8(sp)
ffffffffc0201dec:	842a                	mv	s0,a0
ffffffffc0201dee:	84ae                	mv	s1,a1
ffffffffc0201df0:	85bfe0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0201df4:	0003b797          	auipc	a5,0x3b
ffffffffc0201df8:	0d478793          	addi	a5,a5,212 # ffffffffc023cec8 <pmm_manager>
ffffffffc0201dfc:	639c                	ld	a5,0(a5)
ffffffffc0201dfe:	85a6                	mv	a1,s1
ffffffffc0201e00:	8522                	mv	a0,s0
ffffffffc0201e02:	739c                	ld	a5,32(a5)
ffffffffc0201e04:	9782                	jalr	a5
ffffffffc0201e06:	6442                	ld	s0,16(sp)
ffffffffc0201e08:	60e2                	ld	ra,24(sp)
ffffffffc0201e0a:	64a2                	ld	s1,8(sp)
ffffffffc0201e0c:	6105                	addi	sp,sp,32
ffffffffc0201e0e:	837fe06f          	j	ffffffffc0200644 <intr_enable>

ffffffffc0201e12 <nr_free_pages>:
ffffffffc0201e12:	100027f3          	csrr	a5,sstatus
ffffffffc0201e16:	8b89                	andi	a5,a5,2
ffffffffc0201e18:	eb89                	bnez	a5,ffffffffc0201e2a <nr_free_pages+0x18>
ffffffffc0201e1a:	0003b797          	auipc	a5,0x3b
ffffffffc0201e1e:	0ae78793          	addi	a5,a5,174 # ffffffffc023cec8 <pmm_manager>
ffffffffc0201e22:	639c                	ld	a5,0(a5)
ffffffffc0201e24:	0287b303          	ld	t1,40(a5)
ffffffffc0201e28:	8302                	jr	t1
ffffffffc0201e2a:	1141                	addi	sp,sp,-16
ffffffffc0201e2c:	e406                	sd	ra,8(sp)
ffffffffc0201e2e:	e022                	sd	s0,0(sp)
ffffffffc0201e30:	81bfe0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0201e34:	0003b797          	auipc	a5,0x3b
ffffffffc0201e38:	09478793          	addi	a5,a5,148 # ffffffffc023cec8 <pmm_manager>
ffffffffc0201e3c:	639c                	ld	a5,0(a5)
ffffffffc0201e3e:	779c                	ld	a5,40(a5)
ffffffffc0201e40:	9782                	jalr	a5
ffffffffc0201e42:	842a                	mv	s0,a0
ffffffffc0201e44:	801fe0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0201e48:	8522                	mv	a0,s0
ffffffffc0201e4a:	60a2                	ld	ra,8(sp)
ffffffffc0201e4c:	6402                	ld	s0,0(sp)
ffffffffc0201e4e:	0141                	addi	sp,sp,16
ffffffffc0201e50:	8082                	ret

ffffffffc0201e52 <get_pte>:
ffffffffc0201e52:	7139                	addi	sp,sp,-64
ffffffffc0201e54:	f426                	sd	s1,40(sp)
ffffffffc0201e56:	01e5d493          	srli	s1,a1,0x1e
ffffffffc0201e5a:	1ff4f493          	andi	s1,s1,511
ffffffffc0201e5e:	048e                	slli	s1,s1,0x3
ffffffffc0201e60:	94aa                	add	s1,s1,a0
ffffffffc0201e62:	6094                	ld	a3,0(s1)
ffffffffc0201e64:	f04a                	sd	s2,32(sp)
ffffffffc0201e66:	ec4e                	sd	s3,24(sp)
ffffffffc0201e68:	e852                	sd	s4,16(sp)
ffffffffc0201e6a:	fc06                	sd	ra,56(sp)
ffffffffc0201e6c:	f822                	sd	s0,48(sp)
ffffffffc0201e6e:	e456                	sd	s5,8(sp)
ffffffffc0201e70:	e05a                	sd	s6,0(sp)
ffffffffc0201e72:	0016f793          	andi	a5,a3,1
ffffffffc0201e76:	892e                	mv	s2,a1
ffffffffc0201e78:	8a32                	mv	s4,a2
ffffffffc0201e7a:	0003b997          	auipc	s3,0x3b
ffffffffc0201e7e:	fe698993          	addi	s3,s3,-26 # ffffffffc023ce60 <npage>
ffffffffc0201e82:	e7bd                	bnez	a5,ffffffffc0201ef0 <get_pte+0x9e>
ffffffffc0201e84:	12060c63          	beqz	a2,ffffffffc0201fbc <get_pte+0x16a>
ffffffffc0201e88:	4505                	li	a0,1
ffffffffc0201e8a:	ebbff0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0201e8e:	842a                	mv	s0,a0
ffffffffc0201e90:	12050663          	beqz	a0,ffffffffc0201fbc <get_pte+0x16a>
ffffffffc0201e94:	0003bb17          	auipc	s6,0x3b
ffffffffc0201e98:	04cb0b13          	addi	s6,s6,76 # ffffffffc023cee0 <pages>
ffffffffc0201e9c:	000b3503          	ld	a0,0(s6)
ffffffffc0201ea0:	00080ab7          	lui	s5,0x80
ffffffffc0201ea4:	0003b997          	auipc	s3,0x3b
ffffffffc0201ea8:	fbc98993          	addi	s3,s3,-68 # ffffffffc023ce60 <npage>
ffffffffc0201eac:	40a40533          	sub	a0,s0,a0
ffffffffc0201eb0:	8519                	srai	a0,a0,0x6
ffffffffc0201eb2:	9556                	add	a0,a0,s5
ffffffffc0201eb4:	0009b703          	ld	a4,0(s3)
ffffffffc0201eb8:	00c51793          	slli	a5,a0,0xc
ffffffffc0201ebc:	4685                	li	a3,1
ffffffffc0201ebe:	c014                	sw	a3,0(s0)
ffffffffc0201ec0:	83b1                	srli	a5,a5,0xc
ffffffffc0201ec2:	0532                	slli	a0,a0,0xc
ffffffffc0201ec4:	14e7f363          	bgeu	a5,a4,ffffffffc020200a <get_pte+0x1b8>
ffffffffc0201ec8:	0003b797          	auipc	a5,0x3b
ffffffffc0201ecc:	00878793          	addi	a5,a5,8 # ffffffffc023ced0 <va_pa_offset>
ffffffffc0201ed0:	639c                	ld	a5,0(a5)
ffffffffc0201ed2:	6605                	lui	a2,0x1
ffffffffc0201ed4:	4581                	li	a1,0
ffffffffc0201ed6:	953e                	add	a0,a0,a5
ffffffffc0201ed8:	58d060ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc0201edc:	000b3683          	ld	a3,0(s6)
ffffffffc0201ee0:	40d406b3          	sub	a3,s0,a3
ffffffffc0201ee4:	8699                	srai	a3,a3,0x6
ffffffffc0201ee6:	96d6                	add	a3,a3,s5
ffffffffc0201ee8:	06aa                	slli	a3,a3,0xa
ffffffffc0201eea:	0116e693          	ori	a3,a3,17
ffffffffc0201eee:	e094                	sd	a3,0(s1)
ffffffffc0201ef0:	77fd                	lui	a5,0xfffff
ffffffffc0201ef2:	068a                	slli	a3,a3,0x2
ffffffffc0201ef4:	0009b703          	ld	a4,0(s3)
ffffffffc0201ef8:	8efd                	and	a3,a3,a5
ffffffffc0201efa:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201efe:	0ce7f163          	bgeu	a5,a4,ffffffffc0201fc0 <get_pte+0x16e>
ffffffffc0201f02:	0003ba97          	auipc	s5,0x3b
ffffffffc0201f06:	fcea8a93          	addi	s5,s5,-50 # ffffffffc023ced0 <va_pa_offset>
ffffffffc0201f0a:	000ab403          	ld	s0,0(s5)
ffffffffc0201f0e:	01595793          	srli	a5,s2,0x15
ffffffffc0201f12:	1ff7f793          	andi	a5,a5,511
ffffffffc0201f16:	96a2                	add	a3,a3,s0
ffffffffc0201f18:	00379413          	slli	s0,a5,0x3
ffffffffc0201f1c:	9436                	add	s0,s0,a3
ffffffffc0201f1e:	6014                	ld	a3,0(s0)
ffffffffc0201f20:	0016f793          	andi	a5,a3,1
ffffffffc0201f24:	e3ad                	bnez	a5,ffffffffc0201f86 <get_pte+0x134>
ffffffffc0201f26:	080a0b63          	beqz	s4,ffffffffc0201fbc <get_pte+0x16a>
ffffffffc0201f2a:	4505                	li	a0,1
ffffffffc0201f2c:	e19ff0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0201f30:	84aa                	mv	s1,a0
ffffffffc0201f32:	c549                	beqz	a0,ffffffffc0201fbc <get_pte+0x16a>
ffffffffc0201f34:	0003bb17          	auipc	s6,0x3b
ffffffffc0201f38:	facb0b13          	addi	s6,s6,-84 # ffffffffc023cee0 <pages>
ffffffffc0201f3c:	000b3503          	ld	a0,0(s6)
ffffffffc0201f40:	00080a37          	lui	s4,0x80
ffffffffc0201f44:	0009b703          	ld	a4,0(s3)
ffffffffc0201f48:	40a48533          	sub	a0,s1,a0
ffffffffc0201f4c:	8519                	srai	a0,a0,0x6
ffffffffc0201f4e:	9552                	add	a0,a0,s4
ffffffffc0201f50:	00c51793          	slli	a5,a0,0xc
ffffffffc0201f54:	4685                	li	a3,1
ffffffffc0201f56:	c094                	sw	a3,0(s1)
ffffffffc0201f58:	83b1                	srli	a5,a5,0xc
ffffffffc0201f5a:	0532                	slli	a0,a0,0xc
ffffffffc0201f5c:	08e7fa63          	bgeu	a5,a4,ffffffffc0201ff0 <get_pte+0x19e>
ffffffffc0201f60:	000ab783          	ld	a5,0(s5)
ffffffffc0201f64:	6605                	lui	a2,0x1
ffffffffc0201f66:	4581                	li	a1,0
ffffffffc0201f68:	953e                	add	a0,a0,a5
ffffffffc0201f6a:	4fb060ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc0201f6e:	000b3683          	ld	a3,0(s6)
ffffffffc0201f72:	40d486b3          	sub	a3,s1,a3
ffffffffc0201f76:	8699                	srai	a3,a3,0x6
ffffffffc0201f78:	96d2                	add	a3,a3,s4
ffffffffc0201f7a:	06aa                	slli	a3,a3,0xa
ffffffffc0201f7c:	0116e693          	ori	a3,a3,17
ffffffffc0201f80:	e014                	sd	a3,0(s0)
ffffffffc0201f82:	0009b703          	ld	a4,0(s3)
ffffffffc0201f86:	068a                	slli	a3,a3,0x2
ffffffffc0201f88:	757d                	lui	a0,0xfffff
ffffffffc0201f8a:	8ee9                	and	a3,a3,a0
ffffffffc0201f8c:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201f90:	04e7f463          	bgeu	a5,a4,ffffffffc0201fd8 <get_pte+0x186>
ffffffffc0201f94:	000ab503          	ld	a0,0(s5)
ffffffffc0201f98:	00c95913          	srli	s2,s2,0xc
ffffffffc0201f9c:	1ff97913          	andi	s2,s2,511
ffffffffc0201fa0:	96aa                	add	a3,a3,a0
ffffffffc0201fa2:	00391513          	slli	a0,s2,0x3
ffffffffc0201fa6:	9536                	add	a0,a0,a3
ffffffffc0201fa8:	70e2                	ld	ra,56(sp)
ffffffffc0201faa:	7442                	ld	s0,48(sp)
ffffffffc0201fac:	74a2                	ld	s1,40(sp)
ffffffffc0201fae:	7902                	ld	s2,32(sp)
ffffffffc0201fb0:	69e2                	ld	s3,24(sp)
ffffffffc0201fb2:	6a42                	ld	s4,16(sp)
ffffffffc0201fb4:	6aa2                	ld	s5,8(sp)
ffffffffc0201fb6:	6b02                	ld	s6,0(sp)
ffffffffc0201fb8:	6121                	addi	sp,sp,64
ffffffffc0201fba:	8082                	ret
ffffffffc0201fbc:	4501                	li	a0,0
ffffffffc0201fbe:	b7ed                	j	ffffffffc0201fa8 <get_pte+0x156>
ffffffffc0201fc0:	00008617          	auipc	a2,0x8
ffffffffc0201fc4:	a5860613          	addi	a2,a2,-1448 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0201fc8:	0fe00593          	li	a1,254
ffffffffc0201fcc:	00008517          	auipc	a0,0x8
ffffffffc0201fd0:	b6c50513          	addi	a0,a0,-1172 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0201fd4:	cb0fe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0201fd8:	00008617          	auipc	a2,0x8
ffffffffc0201fdc:	a4060613          	addi	a2,a2,-1472 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0201fe0:	10900593          	li	a1,265
ffffffffc0201fe4:	00008517          	auipc	a0,0x8
ffffffffc0201fe8:	b5450513          	addi	a0,a0,-1196 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0201fec:	c98fe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0201ff0:	86aa                	mv	a3,a0
ffffffffc0201ff2:	00008617          	auipc	a2,0x8
ffffffffc0201ff6:	a2660613          	addi	a2,a2,-1498 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0201ffa:	10600593          	li	a1,262
ffffffffc0201ffe:	00008517          	auipc	a0,0x8
ffffffffc0202002:	b3a50513          	addi	a0,a0,-1222 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202006:	c7efe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020200a:	86aa                	mv	a3,a0
ffffffffc020200c:	00008617          	auipc	a2,0x8
ffffffffc0202010:	a0c60613          	addi	a2,a2,-1524 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0202014:	0fa00593          	li	a1,250
ffffffffc0202018:	00008517          	auipc	a0,0x8
ffffffffc020201c:	b2050513          	addi	a0,a0,-1248 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202020:	c64fe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0202024 <get_page>:
ffffffffc0202024:	1141                	addi	sp,sp,-16
ffffffffc0202026:	e022                	sd	s0,0(sp)
ffffffffc0202028:	8432                	mv	s0,a2
ffffffffc020202a:	4601                	li	a2,0
ffffffffc020202c:	e406                	sd	ra,8(sp)
ffffffffc020202e:	e25ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc0202032:	c011                	beqz	s0,ffffffffc0202036 <get_page+0x12>
ffffffffc0202034:	e008                	sd	a0,0(s0)
ffffffffc0202036:	c511                	beqz	a0,ffffffffc0202042 <get_page+0x1e>
ffffffffc0202038:	611c                	ld	a5,0(a0)
ffffffffc020203a:	4501                	li	a0,0
ffffffffc020203c:	0017f713          	andi	a4,a5,1
ffffffffc0202040:	e709                	bnez	a4,ffffffffc020204a <get_page+0x26>
ffffffffc0202042:	60a2                	ld	ra,8(sp)
ffffffffc0202044:	6402                	ld	s0,0(sp)
ffffffffc0202046:	0141                	addi	sp,sp,16
ffffffffc0202048:	8082                	ret
ffffffffc020204a:	0003b717          	auipc	a4,0x3b
ffffffffc020204e:	e1670713          	addi	a4,a4,-490 # ffffffffc023ce60 <npage>
ffffffffc0202052:	6318                	ld	a4,0(a4)
ffffffffc0202054:	078a                	slli	a5,a5,0x2
ffffffffc0202056:	83b1                	srli	a5,a5,0xc
ffffffffc0202058:	02e7f063          	bgeu	a5,a4,ffffffffc0202078 <get_page+0x54>
ffffffffc020205c:	0003b717          	auipc	a4,0x3b
ffffffffc0202060:	e8470713          	addi	a4,a4,-380 # ffffffffc023cee0 <pages>
ffffffffc0202064:	6308                	ld	a0,0(a4)
ffffffffc0202066:	60a2                	ld	ra,8(sp)
ffffffffc0202068:	6402                	ld	s0,0(sp)
ffffffffc020206a:	fff80737          	lui	a4,0xfff80
ffffffffc020206e:	97ba                	add	a5,a5,a4
ffffffffc0202070:	079a                	slli	a5,a5,0x6
ffffffffc0202072:	953e                	add	a0,a0,a5
ffffffffc0202074:	0141                	addi	sp,sp,16
ffffffffc0202076:	8082                	ret
ffffffffc0202078:	cb1ff0ef          	jal	ra,ffffffffc0201d28 <pa2page.part.4>

ffffffffc020207c <unmap_range>:
ffffffffc020207c:	711d                	addi	sp,sp,-96
ffffffffc020207e:	00c5e7b3          	or	a5,a1,a2
ffffffffc0202082:	ec86                	sd	ra,88(sp)
ffffffffc0202084:	e8a2                	sd	s0,80(sp)
ffffffffc0202086:	e4a6                	sd	s1,72(sp)
ffffffffc0202088:	e0ca                	sd	s2,64(sp)
ffffffffc020208a:	fc4e                	sd	s3,56(sp)
ffffffffc020208c:	f852                	sd	s4,48(sp)
ffffffffc020208e:	f456                	sd	s5,40(sp)
ffffffffc0202090:	f05a                	sd	s6,32(sp)
ffffffffc0202092:	ec5e                	sd	s7,24(sp)
ffffffffc0202094:	e862                	sd	s8,16(sp)
ffffffffc0202096:	e466                	sd	s9,8(sp)
ffffffffc0202098:	03479713          	slli	a4,a5,0x34
ffffffffc020209c:	eb71                	bnez	a4,ffffffffc0202170 <unmap_range+0xf4>
ffffffffc020209e:	002007b7          	lui	a5,0x200
ffffffffc02020a2:	842e                	mv	s0,a1
ffffffffc02020a4:	0af5e663          	bltu	a1,a5,ffffffffc0202150 <unmap_range+0xd4>
ffffffffc02020a8:	8932                	mv	s2,a2
ffffffffc02020aa:	0ac5f363          	bgeu	a1,a2,ffffffffc0202150 <unmap_range+0xd4>
ffffffffc02020ae:	4785                	li	a5,1
ffffffffc02020b0:	07fe                	slli	a5,a5,0x1f
ffffffffc02020b2:	08c7ef63          	bltu	a5,a2,ffffffffc0202150 <unmap_range+0xd4>
ffffffffc02020b6:	89aa                	mv	s3,a0
ffffffffc02020b8:	6a05                	lui	s4,0x1
ffffffffc02020ba:	0003bc97          	auipc	s9,0x3b
ffffffffc02020be:	da6c8c93          	addi	s9,s9,-602 # ffffffffc023ce60 <npage>
ffffffffc02020c2:	0003bc17          	auipc	s8,0x3b
ffffffffc02020c6:	e1ec0c13          	addi	s8,s8,-482 # ffffffffc023cee0 <pages>
ffffffffc02020ca:	fff80bb7          	lui	s7,0xfff80
ffffffffc02020ce:	00200b37          	lui	s6,0x200
ffffffffc02020d2:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02020d6:	4601                	li	a2,0
ffffffffc02020d8:	85a2                	mv	a1,s0
ffffffffc02020da:	854e                	mv	a0,s3
ffffffffc02020dc:	d77ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc02020e0:	84aa                	mv	s1,a0
ffffffffc02020e2:	cd21                	beqz	a0,ffffffffc020213a <unmap_range+0xbe>
ffffffffc02020e4:	611c                	ld	a5,0(a0)
ffffffffc02020e6:	e38d                	bnez	a5,ffffffffc0202108 <unmap_range+0x8c>
ffffffffc02020e8:	9452                	add	s0,s0,s4
ffffffffc02020ea:	ff2466e3          	bltu	s0,s2,ffffffffc02020d6 <unmap_range+0x5a>
ffffffffc02020ee:	60e6                	ld	ra,88(sp)
ffffffffc02020f0:	6446                	ld	s0,80(sp)
ffffffffc02020f2:	64a6                	ld	s1,72(sp)
ffffffffc02020f4:	6906                	ld	s2,64(sp)
ffffffffc02020f6:	79e2                	ld	s3,56(sp)
ffffffffc02020f8:	7a42                	ld	s4,48(sp)
ffffffffc02020fa:	7aa2                	ld	s5,40(sp)
ffffffffc02020fc:	7b02                	ld	s6,32(sp)
ffffffffc02020fe:	6be2                	ld	s7,24(sp)
ffffffffc0202100:	6c42                	ld	s8,16(sp)
ffffffffc0202102:	6ca2                	ld	s9,8(sp)
ffffffffc0202104:	6125                	addi	sp,sp,96
ffffffffc0202106:	8082                	ret
ffffffffc0202108:	0017f713          	andi	a4,a5,1
ffffffffc020210c:	df71                	beqz	a4,ffffffffc02020e8 <unmap_range+0x6c>
ffffffffc020210e:	000cb703          	ld	a4,0(s9)
ffffffffc0202112:	078a                	slli	a5,a5,0x2
ffffffffc0202114:	83b1                	srli	a5,a5,0xc
ffffffffc0202116:	06e7fd63          	bgeu	a5,a4,ffffffffc0202190 <unmap_range+0x114>
ffffffffc020211a:	000c3503          	ld	a0,0(s8)
ffffffffc020211e:	97de                	add	a5,a5,s7
ffffffffc0202120:	079a                	slli	a5,a5,0x6
ffffffffc0202122:	953e                	add	a0,a0,a5
ffffffffc0202124:	411c                	lw	a5,0(a0)
ffffffffc0202126:	fff7871b          	addiw	a4,a5,-1
ffffffffc020212a:	c118                	sw	a4,0(a0)
ffffffffc020212c:	cf11                	beqz	a4,ffffffffc0202148 <unmap_range+0xcc>
ffffffffc020212e:	0004b023          	sd	zero,0(s1)
ffffffffc0202132:	12040073          	sfence.vma	s0
ffffffffc0202136:	9452                	add	s0,s0,s4
ffffffffc0202138:	bf4d                	j	ffffffffc02020ea <unmap_range+0x6e>
ffffffffc020213a:	945a                	add	s0,s0,s6
ffffffffc020213c:	01547433          	and	s0,s0,s5
ffffffffc0202140:	d45d                	beqz	s0,ffffffffc02020ee <unmap_range+0x72>
ffffffffc0202142:	f9246ae3          	bltu	s0,s2,ffffffffc02020d6 <unmap_range+0x5a>
ffffffffc0202146:	b765                	j	ffffffffc02020ee <unmap_range+0x72>
ffffffffc0202148:	4585                	li	a1,1
ffffffffc020214a:	c83ff0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc020214e:	b7c5                	j	ffffffffc020212e <unmap_range+0xb2>
ffffffffc0202150:	00008697          	auipc	a3,0x8
ffffffffc0202154:	f7068693          	addi	a3,a3,-144 # ffffffffc020a0c0 <default_pmm_manager+0x6f8>
ffffffffc0202158:	00007617          	auipc	a2,0x7
ffffffffc020215c:	12860613          	addi	a2,a2,296 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202160:	14100593          	li	a1,321
ffffffffc0202164:	00008517          	auipc	a0,0x8
ffffffffc0202168:	9d450513          	addi	a0,a0,-1580 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc020216c:	b18fe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202170:	00008697          	auipc	a3,0x8
ffffffffc0202174:	f2068693          	addi	a3,a3,-224 # ffffffffc020a090 <default_pmm_manager+0x6c8>
ffffffffc0202178:	00007617          	auipc	a2,0x7
ffffffffc020217c:	10860613          	addi	a2,a2,264 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202180:	14000593          	li	a1,320
ffffffffc0202184:	00008517          	auipc	a0,0x8
ffffffffc0202188:	9b450513          	addi	a0,a0,-1612 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc020218c:	af8fe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202190:	b99ff0ef          	jal	ra,ffffffffc0201d28 <pa2page.part.4>

ffffffffc0202194 <exit_range>:
ffffffffc0202194:	715d                	addi	sp,sp,-80
ffffffffc0202196:	00c5e7b3          	or	a5,a1,a2
ffffffffc020219a:	e486                	sd	ra,72(sp)
ffffffffc020219c:	e0a2                	sd	s0,64(sp)
ffffffffc020219e:	fc26                	sd	s1,56(sp)
ffffffffc02021a0:	f84a                	sd	s2,48(sp)
ffffffffc02021a2:	f44e                	sd	s3,40(sp)
ffffffffc02021a4:	f052                	sd	s4,32(sp)
ffffffffc02021a6:	ec56                	sd	s5,24(sp)
ffffffffc02021a8:	e85a                	sd	s6,16(sp)
ffffffffc02021aa:	e45e                	sd	s7,8(sp)
ffffffffc02021ac:	03479713          	slli	a4,a5,0x34
ffffffffc02021b0:	e371                	bnez	a4,ffffffffc0202274 <exit_range+0xe0>
ffffffffc02021b2:	002007b7          	lui	a5,0x200
ffffffffc02021b6:	08f5ef63          	bltu	a1,a5,ffffffffc0202254 <exit_range+0xc0>
ffffffffc02021ba:	89b2                	mv	s3,a2
ffffffffc02021bc:	08c5fc63          	bgeu	a1,a2,ffffffffc0202254 <exit_range+0xc0>
ffffffffc02021c0:	4785                	li	a5,1
ffffffffc02021c2:	ffe004b7          	lui	s1,0xffe00
ffffffffc02021c6:	07fe                	slli	a5,a5,0x1f
ffffffffc02021c8:	8ced                	and	s1,s1,a1
ffffffffc02021ca:	08c7e563          	bltu	a5,a2,ffffffffc0202254 <exit_range+0xc0>
ffffffffc02021ce:	8a2a                	mv	s4,a0
ffffffffc02021d0:	0003bb17          	auipc	s6,0x3b
ffffffffc02021d4:	c90b0b13          	addi	s6,s6,-880 # ffffffffc023ce60 <npage>
ffffffffc02021d8:	0003bb97          	auipc	s7,0x3b
ffffffffc02021dc:	d08b8b93          	addi	s7,s7,-760 # ffffffffc023cee0 <pages>
ffffffffc02021e0:	fff80937          	lui	s2,0xfff80
ffffffffc02021e4:	00200ab7          	lui	s5,0x200
ffffffffc02021e8:	a019                	j	ffffffffc02021ee <exit_range+0x5a>
ffffffffc02021ea:	0334fe63          	bgeu	s1,s3,ffffffffc0202226 <exit_range+0x92>
ffffffffc02021ee:	01e4d413          	srli	s0,s1,0x1e
ffffffffc02021f2:	1ff47413          	andi	s0,s0,511
ffffffffc02021f6:	040e                	slli	s0,s0,0x3
ffffffffc02021f8:	9452                	add	s0,s0,s4
ffffffffc02021fa:	601c                	ld	a5,0(s0)
ffffffffc02021fc:	0017f713          	andi	a4,a5,1
ffffffffc0202200:	c30d                	beqz	a4,ffffffffc0202222 <exit_range+0x8e>
ffffffffc0202202:	000b3703          	ld	a4,0(s6)
ffffffffc0202206:	078a                	slli	a5,a5,0x2
ffffffffc0202208:	83b1                	srli	a5,a5,0xc
ffffffffc020220a:	02e7f963          	bgeu	a5,a4,ffffffffc020223c <exit_range+0xa8>
ffffffffc020220e:	000bb503          	ld	a0,0(s7)
ffffffffc0202212:	97ca                	add	a5,a5,s2
ffffffffc0202214:	079a                	slli	a5,a5,0x6
ffffffffc0202216:	4585                	li	a1,1
ffffffffc0202218:	953e                	add	a0,a0,a5
ffffffffc020221a:	bb3ff0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc020221e:	00043023          	sd	zero,0(s0)
ffffffffc0202222:	94d6                	add	s1,s1,s5
ffffffffc0202224:	f0f9                	bnez	s1,ffffffffc02021ea <exit_range+0x56>
ffffffffc0202226:	60a6                	ld	ra,72(sp)
ffffffffc0202228:	6406                	ld	s0,64(sp)
ffffffffc020222a:	74e2                	ld	s1,56(sp)
ffffffffc020222c:	7942                	ld	s2,48(sp)
ffffffffc020222e:	79a2                	ld	s3,40(sp)
ffffffffc0202230:	7a02                	ld	s4,32(sp)
ffffffffc0202232:	6ae2                	ld	s5,24(sp)
ffffffffc0202234:	6b42                	ld	s6,16(sp)
ffffffffc0202236:	6ba2                	ld	s7,8(sp)
ffffffffc0202238:	6161                	addi	sp,sp,80
ffffffffc020223a:	8082                	ret
ffffffffc020223c:	00008617          	auipc	a2,0x8
ffffffffc0202240:	83c60613          	addi	a2,a2,-1988 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc0202244:	06200593          	li	a1,98
ffffffffc0202248:	00007517          	auipc	a0,0x7
ffffffffc020224c:	7f850513          	addi	a0,a0,2040 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0202250:	a34fe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202254:	00008697          	auipc	a3,0x8
ffffffffc0202258:	e6c68693          	addi	a3,a3,-404 # ffffffffc020a0c0 <default_pmm_manager+0x6f8>
ffffffffc020225c:	00007617          	auipc	a2,0x7
ffffffffc0202260:	02460613          	addi	a2,a2,36 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202264:	15200593          	li	a1,338
ffffffffc0202268:	00008517          	auipc	a0,0x8
ffffffffc020226c:	8d050513          	addi	a0,a0,-1840 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202270:	a14fe0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202274:	00008697          	auipc	a3,0x8
ffffffffc0202278:	e1c68693          	addi	a3,a3,-484 # ffffffffc020a090 <default_pmm_manager+0x6c8>
ffffffffc020227c:	00007617          	auipc	a2,0x7
ffffffffc0202280:	00460613          	addi	a2,a2,4 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202284:	15100593          	li	a1,337
ffffffffc0202288:	00008517          	auipc	a0,0x8
ffffffffc020228c:	8b050513          	addi	a0,a0,-1872 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202290:	9f4fe0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0202294 <page_remove>:
ffffffffc0202294:	1101                	addi	sp,sp,-32
ffffffffc0202296:	4601                	li	a2,0
ffffffffc0202298:	e426                	sd	s1,8(sp)
ffffffffc020229a:	ec06                	sd	ra,24(sp)
ffffffffc020229c:	e822                	sd	s0,16(sp)
ffffffffc020229e:	84ae                	mv	s1,a1
ffffffffc02022a0:	bb3ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc02022a4:	c511                	beqz	a0,ffffffffc02022b0 <page_remove+0x1c>
ffffffffc02022a6:	611c                	ld	a5,0(a0)
ffffffffc02022a8:	842a                	mv	s0,a0
ffffffffc02022aa:	0017f713          	andi	a4,a5,1
ffffffffc02022ae:	e711                	bnez	a4,ffffffffc02022ba <page_remove+0x26>
ffffffffc02022b0:	60e2                	ld	ra,24(sp)
ffffffffc02022b2:	6442                	ld	s0,16(sp)
ffffffffc02022b4:	64a2                	ld	s1,8(sp)
ffffffffc02022b6:	6105                	addi	sp,sp,32
ffffffffc02022b8:	8082                	ret
ffffffffc02022ba:	0003b717          	auipc	a4,0x3b
ffffffffc02022be:	ba670713          	addi	a4,a4,-1114 # ffffffffc023ce60 <npage>
ffffffffc02022c2:	6318                	ld	a4,0(a4)
ffffffffc02022c4:	078a                	slli	a5,a5,0x2
ffffffffc02022c6:	83b1                	srli	a5,a5,0xc
ffffffffc02022c8:	02e7fe63          	bgeu	a5,a4,ffffffffc0202304 <page_remove+0x70>
ffffffffc02022cc:	0003b717          	auipc	a4,0x3b
ffffffffc02022d0:	c1470713          	addi	a4,a4,-1004 # ffffffffc023cee0 <pages>
ffffffffc02022d4:	6308                	ld	a0,0(a4)
ffffffffc02022d6:	fff80737          	lui	a4,0xfff80
ffffffffc02022da:	97ba                	add	a5,a5,a4
ffffffffc02022dc:	079a                	slli	a5,a5,0x6
ffffffffc02022de:	953e                	add	a0,a0,a5
ffffffffc02022e0:	411c                	lw	a5,0(a0)
ffffffffc02022e2:	fff7871b          	addiw	a4,a5,-1
ffffffffc02022e6:	c118                	sw	a4,0(a0)
ffffffffc02022e8:	cb11                	beqz	a4,ffffffffc02022fc <page_remove+0x68>
ffffffffc02022ea:	00043023          	sd	zero,0(s0)
ffffffffc02022ee:	12048073          	sfence.vma	s1
ffffffffc02022f2:	60e2                	ld	ra,24(sp)
ffffffffc02022f4:	6442                	ld	s0,16(sp)
ffffffffc02022f6:	64a2                	ld	s1,8(sp)
ffffffffc02022f8:	6105                	addi	sp,sp,32
ffffffffc02022fa:	8082                	ret
ffffffffc02022fc:	4585                	li	a1,1
ffffffffc02022fe:	acfff0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0202302:	b7e5                	j	ffffffffc02022ea <page_remove+0x56>
ffffffffc0202304:	a25ff0ef          	jal	ra,ffffffffc0201d28 <pa2page.part.4>

ffffffffc0202308 <page_insert>:
ffffffffc0202308:	7179                	addi	sp,sp,-48
ffffffffc020230a:	e44e                	sd	s3,8(sp)
ffffffffc020230c:	89b2                	mv	s3,a2
ffffffffc020230e:	f022                	sd	s0,32(sp)
ffffffffc0202310:	4605                	li	a2,1
ffffffffc0202312:	842e                	mv	s0,a1
ffffffffc0202314:	85ce                	mv	a1,s3
ffffffffc0202316:	ec26                	sd	s1,24(sp)
ffffffffc0202318:	f406                	sd	ra,40(sp)
ffffffffc020231a:	e84a                	sd	s2,16(sp)
ffffffffc020231c:	e052                	sd	s4,0(sp)
ffffffffc020231e:	84b6                	mv	s1,a3
ffffffffc0202320:	b33ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc0202324:	cd49                	beqz	a0,ffffffffc02023be <page_insert+0xb6>
ffffffffc0202326:	4014                	lw	a3,0(s0)
ffffffffc0202328:	611c                	ld	a5,0(a0)
ffffffffc020232a:	892a                	mv	s2,a0
ffffffffc020232c:	0016871b          	addiw	a4,a3,1
ffffffffc0202330:	c018                	sw	a4,0(s0)
ffffffffc0202332:	0017f713          	andi	a4,a5,1
ffffffffc0202336:	ef05                	bnez	a4,ffffffffc020236e <page_insert+0x66>
ffffffffc0202338:	0003b797          	auipc	a5,0x3b
ffffffffc020233c:	ba878793          	addi	a5,a5,-1112 # ffffffffc023cee0 <pages>
ffffffffc0202340:	6398                	ld	a4,0(a5)
ffffffffc0202342:	8c19                	sub	s0,s0,a4
ffffffffc0202344:	000806b7          	lui	a3,0x80
ffffffffc0202348:	8419                	srai	s0,s0,0x6
ffffffffc020234a:	9436                	add	s0,s0,a3
ffffffffc020234c:	042a                	slli	s0,s0,0xa
ffffffffc020234e:	8c45                	or	s0,s0,s1
ffffffffc0202350:	00146413          	ori	s0,s0,1
ffffffffc0202354:	00893023          	sd	s0,0(s2) # fffffffffff80000 <end+0x3fd43028>
ffffffffc0202358:	12098073          	sfence.vma	s3
ffffffffc020235c:	4501                	li	a0,0
ffffffffc020235e:	70a2                	ld	ra,40(sp)
ffffffffc0202360:	7402                	ld	s0,32(sp)
ffffffffc0202362:	64e2                	ld	s1,24(sp)
ffffffffc0202364:	6942                	ld	s2,16(sp)
ffffffffc0202366:	69a2                	ld	s3,8(sp)
ffffffffc0202368:	6a02                	ld	s4,0(sp)
ffffffffc020236a:	6145                	addi	sp,sp,48
ffffffffc020236c:	8082                	ret
ffffffffc020236e:	0003b717          	auipc	a4,0x3b
ffffffffc0202372:	af270713          	addi	a4,a4,-1294 # ffffffffc023ce60 <npage>
ffffffffc0202376:	6318                	ld	a4,0(a4)
ffffffffc0202378:	078a                	slli	a5,a5,0x2
ffffffffc020237a:	83b1                	srli	a5,a5,0xc
ffffffffc020237c:	04e7f363          	bgeu	a5,a4,ffffffffc02023c2 <page_insert+0xba>
ffffffffc0202380:	0003ba17          	auipc	s4,0x3b
ffffffffc0202384:	b60a0a13          	addi	s4,s4,-1184 # ffffffffc023cee0 <pages>
ffffffffc0202388:	000a3703          	ld	a4,0(s4)
ffffffffc020238c:	fff80537          	lui	a0,0xfff80
ffffffffc0202390:	953e                	add	a0,a0,a5
ffffffffc0202392:	051a                	slli	a0,a0,0x6
ffffffffc0202394:	953a                	add	a0,a0,a4
ffffffffc0202396:	00a40a63          	beq	s0,a0,ffffffffc02023aa <page_insert+0xa2>
ffffffffc020239a:	411c                	lw	a5,0(a0)
ffffffffc020239c:	fff7869b          	addiw	a3,a5,-1
ffffffffc02023a0:	c114                	sw	a3,0(a0)
ffffffffc02023a2:	c691                	beqz	a3,ffffffffc02023ae <page_insert+0xa6>
ffffffffc02023a4:	12098073          	sfence.vma	s3
ffffffffc02023a8:	bf69                	j	ffffffffc0202342 <page_insert+0x3a>
ffffffffc02023aa:	c014                	sw	a3,0(s0)
ffffffffc02023ac:	bf59                	j	ffffffffc0202342 <page_insert+0x3a>
ffffffffc02023ae:	4585                	li	a1,1
ffffffffc02023b0:	a1dff0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc02023b4:	000a3703          	ld	a4,0(s4)
ffffffffc02023b8:	12098073          	sfence.vma	s3
ffffffffc02023bc:	b759                	j	ffffffffc0202342 <page_insert+0x3a>
ffffffffc02023be:	5571                	li	a0,-4
ffffffffc02023c0:	bf79                	j	ffffffffc020235e <page_insert+0x56>
ffffffffc02023c2:	967ff0ef          	jal	ra,ffffffffc0201d28 <pa2page.part.4>

ffffffffc02023c6 <pmm_init>:
ffffffffc02023c6:	00007797          	auipc	a5,0x7
ffffffffc02023ca:	60278793          	addi	a5,a5,1538 # ffffffffc02099c8 <default_pmm_manager>
ffffffffc02023ce:	638c                	ld	a1,0(a5)
ffffffffc02023d0:	7139                	addi	sp,sp,-64
ffffffffc02023d2:	00007517          	auipc	a0,0x7
ffffffffc02023d6:	78e50513          	addi	a0,a0,1934 # ffffffffc0209b60 <default_pmm_manager+0x198>
ffffffffc02023da:	fc06                	sd	ra,56(sp)
ffffffffc02023dc:	0003b717          	auipc	a4,0x3b
ffffffffc02023e0:	aef73623          	sd	a5,-1300(a4) # ffffffffc023cec8 <pmm_manager>
ffffffffc02023e4:	f822                	sd	s0,48(sp)
ffffffffc02023e6:	f426                	sd	s1,40(sp)
ffffffffc02023e8:	f04a                	sd	s2,32(sp)
ffffffffc02023ea:	ec4e                	sd	s3,24(sp)
ffffffffc02023ec:	e852                	sd	s4,16(sp)
ffffffffc02023ee:	e456                	sd	s5,8(sp)
ffffffffc02023f0:	e05a                	sd	s6,0(sp)
ffffffffc02023f2:	0003b417          	auipc	s0,0x3b
ffffffffc02023f6:	ad640413          	addi	s0,s0,-1322 # ffffffffc023cec8 <pmm_manager>
ffffffffc02023fa:	d99fd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02023fe:	601c                	ld	a5,0(s0)
ffffffffc0202400:	0003b497          	auipc	s1,0x3b
ffffffffc0202404:	a6048493          	addi	s1,s1,-1440 # ffffffffc023ce60 <npage>
ffffffffc0202408:	0003b917          	auipc	s2,0x3b
ffffffffc020240c:	ad890913          	addi	s2,s2,-1320 # ffffffffc023cee0 <pages>
ffffffffc0202410:	679c                	ld	a5,8(a5)
ffffffffc0202412:	9782                	jalr	a5
ffffffffc0202414:	57f5                	li	a5,-3
ffffffffc0202416:	07fa                	slli	a5,a5,0x1e
ffffffffc0202418:	00007517          	auipc	a0,0x7
ffffffffc020241c:	76050513          	addi	a0,a0,1888 # ffffffffc0209b78 <default_pmm_manager+0x1b0>
ffffffffc0202420:	0003b717          	auipc	a4,0x3b
ffffffffc0202424:	aaf73823          	sd	a5,-1360(a4) # ffffffffc023ced0 <va_pa_offset>
ffffffffc0202428:	d6bfd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020242c:	44300693          	li	a3,1091
ffffffffc0202430:	06d6                	slli	a3,a3,0x15
ffffffffc0202432:	40100613          	li	a2,1025
ffffffffc0202436:	16fd                	addi	a3,a3,-1
ffffffffc0202438:	0656                	slli	a2,a2,0x15
ffffffffc020243a:	088005b7          	lui	a1,0x8800
ffffffffc020243e:	00007517          	auipc	a0,0x7
ffffffffc0202442:	75250513          	addi	a0,a0,1874 # ffffffffc0209b90 <default_pmm_manager+0x1c8>
ffffffffc0202446:	d4dfd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020244a:	777d                	lui	a4,0xfffff
ffffffffc020244c:	0003c797          	auipc	a5,0x3c
ffffffffc0202450:	b8b78793          	addi	a5,a5,-1141 # ffffffffc023dfd7 <end+0xfff>
ffffffffc0202454:	8ff9                	and	a5,a5,a4
ffffffffc0202456:	00088737          	lui	a4,0x88
ffffffffc020245a:	60070713          	addi	a4,a4,1536 # 88600 <_binary_obj___user_matrix_out_size+0x85cc8>
ffffffffc020245e:	0003b697          	auipc	a3,0x3b
ffffffffc0202462:	a0e6b123          	sd	a4,-1534(a3) # ffffffffc023ce60 <npage>
ffffffffc0202466:	0003b717          	auipc	a4,0x3b
ffffffffc020246a:	a6f73d23          	sd	a5,-1414(a4) # ffffffffc023cee0 <pages>
ffffffffc020246e:	4701                	li	a4,0
ffffffffc0202470:	4685                	li	a3,1
ffffffffc0202472:	fff80837          	lui	a6,0xfff80
ffffffffc0202476:	a019                	j	ffffffffc020247c <pmm_init+0xb6>
ffffffffc0202478:	00093783          	ld	a5,0(s2)
ffffffffc020247c:	00671613          	slli	a2,a4,0x6
ffffffffc0202480:	97b2                	add	a5,a5,a2
ffffffffc0202482:	07a1                	addi	a5,a5,8
ffffffffc0202484:	40d7b02f          	amoor.d	zero,a3,(a5)
ffffffffc0202488:	6090                	ld	a2,0(s1)
ffffffffc020248a:	0705                	addi	a4,a4,1
ffffffffc020248c:	010607b3          	add	a5,a2,a6
ffffffffc0202490:	fef764e3          	bltu	a4,a5,ffffffffc0202478 <pmm_init+0xb2>
ffffffffc0202494:	00093503          	ld	a0,0(s2)
ffffffffc0202498:	fe0007b7          	lui	a5,0xfe000
ffffffffc020249c:	00661693          	slli	a3,a2,0x6
ffffffffc02024a0:	97aa                	add	a5,a5,a0
ffffffffc02024a2:	96be                	add	a3,a3,a5
ffffffffc02024a4:	c02007b7          	lui	a5,0xc0200
ffffffffc02024a8:	72f6e563          	bltu	a3,a5,ffffffffc0202bd2 <pmm_init+0x80c>
ffffffffc02024ac:	0003b997          	auipc	s3,0x3b
ffffffffc02024b0:	a2498993          	addi	s3,s3,-1500 # ffffffffc023ced0 <va_pa_offset>
ffffffffc02024b4:	0009b583          	ld	a1,0(s3)
ffffffffc02024b8:	44300793          	li	a5,1091
ffffffffc02024bc:	07d6                	slli	a5,a5,0x15
ffffffffc02024be:	8e8d                	sub	a3,a3,a1
ffffffffc02024c0:	02f6f763          	bgeu	a3,a5,ffffffffc02024ee <pmm_init+0x128>
ffffffffc02024c4:	6585                	lui	a1,0x1
ffffffffc02024c6:	15fd                	addi	a1,a1,-1
ffffffffc02024c8:	96ae                	add	a3,a3,a1
ffffffffc02024ca:	00c6d713          	srli	a4,a3,0xc
ffffffffc02024ce:	3cc77763          	bgeu	a4,a2,ffffffffc020289c <pmm_init+0x4d6>
ffffffffc02024d2:	6010                	ld	a2,0(s0)
ffffffffc02024d4:	75fd                	lui	a1,0xfffff
ffffffffc02024d6:	8eed                	and	a3,a3,a1
ffffffffc02024d8:	9742                	add	a4,a4,a6
ffffffffc02024da:	6a10                	ld	a2,16(a2)
ffffffffc02024dc:	40d786b3          	sub	a3,a5,a3
ffffffffc02024e0:	071a                	slli	a4,a4,0x6
ffffffffc02024e2:	00c6d593          	srli	a1,a3,0xc
ffffffffc02024e6:	953a                	add	a0,a0,a4
ffffffffc02024e8:	9602                	jalr	a2
ffffffffc02024ea:	0009b583          	ld	a1,0(s3)
ffffffffc02024ee:	00007517          	auipc	a0,0x7
ffffffffc02024f2:	6ca50513          	addi	a0,a0,1738 # ffffffffc0209bb8 <default_pmm_manager+0x1f0>
ffffffffc02024f6:	c9dfd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02024fa:	601c                	ld	a5,0(s0)
ffffffffc02024fc:	0003b417          	auipc	s0,0x3b
ffffffffc0202500:	95c40413          	addi	s0,s0,-1700 # ffffffffc023ce58 <boot_pgdir>
ffffffffc0202504:	7b9c                	ld	a5,48(a5)
ffffffffc0202506:	9782                	jalr	a5
ffffffffc0202508:	00007517          	auipc	a0,0x7
ffffffffc020250c:	6c850513          	addi	a0,a0,1736 # ffffffffc0209bd0 <default_pmm_manager+0x208>
ffffffffc0202510:	c83fd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0202514:	0000c517          	auipc	a0,0xc
ffffffffc0202518:	aec50513          	addi	a0,a0,-1300 # ffffffffc020e000 <boot_page_table_sv39>
ffffffffc020251c:	0003b797          	auipc	a5,0x3b
ffffffffc0202520:	92a7be23          	sd	a0,-1732(a5) # ffffffffc023ce58 <boot_pgdir>
ffffffffc0202524:	c02007b7          	lui	a5,0xc0200
ffffffffc0202528:	68f56863          	bltu	a0,a5,ffffffffc0202bb8 <pmm_init+0x7f2>
ffffffffc020252c:	0009b783          	ld	a5,0(s3)
ffffffffc0202530:	6098                	ld	a4,0(s1)
ffffffffc0202532:	40f507b3          	sub	a5,a0,a5
ffffffffc0202536:	0003b697          	auipc	a3,0x3b
ffffffffc020253a:	9af6b123          	sd	a5,-1630(a3) # ffffffffc023ced8 <boot_cr3>
ffffffffc020253e:	c80007b7          	lui	a5,0xc8000
ffffffffc0202542:	83b1                	srli	a5,a5,0xc
ffffffffc0202544:	70e7e363          	bltu	a5,a4,ffffffffc0202c4a <pmm_init+0x884>
ffffffffc0202548:	03451793          	slli	a5,a0,0x34
ffffffffc020254c:	34079a63          	bnez	a5,ffffffffc02028a0 <pmm_init+0x4da>
ffffffffc0202550:	4601                	li	a2,0
ffffffffc0202552:	4581                	li	a1,0
ffffffffc0202554:	ad1ff0ef          	jal	ra,ffffffffc0202024 <get_page>
ffffffffc0202558:	74051963          	bnez	a0,ffffffffc0202caa <pmm_init+0x8e4>
ffffffffc020255c:	4505                	li	a0,1
ffffffffc020255e:	fe6ff0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0202562:	8a2a                	mv	s4,a0
ffffffffc0202564:	6008                	ld	a0,0(s0)
ffffffffc0202566:	4681                	li	a3,0
ffffffffc0202568:	4601                	li	a2,0
ffffffffc020256a:	85d2                	mv	a1,s4
ffffffffc020256c:	d9dff0ef          	jal	ra,ffffffffc0202308 <page_insert>
ffffffffc0202570:	70051d63          	bnez	a0,ffffffffc0202c8a <pmm_init+0x8c4>
ffffffffc0202574:	6008                	ld	a0,0(s0)
ffffffffc0202576:	4601                	li	a2,0
ffffffffc0202578:	4581                	li	a1,0
ffffffffc020257a:	8d9ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc020257e:	6e050663          	beqz	a0,ffffffffc0202c6a <pmm_init+0x8a4>
ffffffffc0202582:	611c                	ld	a5,0(a0)
ffffffffc0202584:	0017f713          	andi	a4,a5,1
ffffffffc0202588:	32070c63          	beqz	a4,ffffffffc02028c0 <pmm_init+0x4fa>
ffffffffc020258c:	6098                	ld	a4,0(s1)
ffffffffc020258e:	078a                	slli	a5,a5,0x2
ffffffffc0202590:	83b1                	srli	a5,a5,0xc
ffffffffc0202592:	30e7f563          	bgeu	a5,a4,ffffffffc020289c <pmm_init+0x4d6>
ffffffffc0202596:	00093683          	ld	a3,0(s2)
ffffffffc020259a:	fff80637          	lui	a2,0xfff80
ffffffffc020259e:	97b2                	add	a5,a5,a2
ffffffffc02025a0:	079a                	slli	a5,a5,0x6
ffffffffc02025a2:	97b6                	add	a5,a5,a3
ffffffffc02025a4:	34fa1a63          	bne	s4,a5,ffffffffc02028f8 <pmm_init+0x532>
ffffffffc02025a8:	000a2683          	lw	a3,0(s4)
ffffffffc02025ac:	4785                	li	a5,1
ffffffffc02025ae:	32f69563          	bne	a3,a5,ffffffffc02028d8 <pmm_init+0x512>
ffffffffc02025b2:	6008                	ld	a0,0(s0)
ffffffffc02025b4:	76fd                	lui	a3,0xfffff
ffffffffc02025b6:	611c                	ld	a5,0(a0)
ffffffffc02025b8:	078a                	slli	a5,a5,0x2
ffffffffc02025ba:	8ff5                	and	a5,a5,a3
ffffffffc02025bc:	00c7d613          	srli	a2,a5,0xc
ffffffffc02025c0:	72e67263          	bgeu	a2,a4,ffffffffc0202ce4 <pmm_init+0x91e>
ffffffffc02025c4:	0009bb03          	ld	s6,0(s3)
ffffffffc02025c8:	97da                	add	a5,a5,s6
ffffffffc02025ca:	0007ba83          	ld	s5,0(a5) # ffffffffc8000000 <end+0x7dc3028>
ffffffffc02025ce:	0a8a                	slli	s5,s5,0x2
ffffffffc02025d0:	00dafab3          	and	s5,s5,a3
ffffffffc02025d4:	00cad793          	srli	a5,s5,0xc
ffffffffc02025d8:	6ee7f963          	bgeu	a5,a4,ffffffffc0202cca <pmm_init+0x904>
ffffffffc02025dc:	4601                	li	a2,0
ffffffffc02025de:	6585                	lui	a1,0x1
ffffffffc02025e0:	9ada                	add	s5,s5,s6
ffffffffc02025e2:	871ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc02025e6:	0aa1                	addi	s5,s5,8
ffffffffc02025e8:	45551863          	bne	a0,s5,ffffffffc0202a38 <pmm_init+0x672>
ffffffffc02025ec:	4505                	li	a0,1
ffffffffc02025ee:	f56ff0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc02025f2:	8aaa                	mv	s5,a0
ffffffffc02025f4:	6008                	ld	a0,0(s0)
ffffffffc02025f6:	46d1                	li	a3,20
ffffffffc02025f8:	6605                	lui	a2,0x1
ffffffffc02025fa:	85d6                	mv	a1,s5
ffffffffc02025fc:	d0dff0ef          	jal	ra,ffffffffc0202308 <page_insert>
ffffffffc0202600:	40051c63          	bnez	a0,ffffffffc0202a18 <pmm_init+0x652>
ffffffffc0202604:	6008                	ld	a0,0(s0)
ffffffffc0202606:	4601                	li	a2,0
ffffffffc0202608:	6585                	lui	a1,0x1
ffffffffc020260a:	849ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc020260e:	3e050563          	beqz	a0,ffffffffc02029f8 <pmm_init+0x632>
ffffffffc0202612:	611c                	ld	a5,0(a0)
ffffffffc0202614:	0107f713          	andi	a4,a5,16
ffffffffc0202618:	3c070063          	beqz	a4,ffffffffc02029d8 <pmm_init+0x612>
ffffffffc020261c:	8b91                	andi	a5,a5,4
ffffffffc020261e:	38078d63          	beqz	a5,ffffffffc02029b8 <pmm_init+0x5f2>
ffffffffc0202622:	6008                	ld	a0,0(s0)
ffffffffc0202624:	611c                	ld	a5,0(a0)
ffffffffc0202626:	8bc1                	andi	a5,a5,16
ffffffffc0202628:	36078863          	beqz	a5,ffffffffc0202998 <pmm_init+0x5d2>
ffffffffc020262c:	000aa703          	lw	a4,0(s5) # 200000 <_binary_obj___user_matrix_out_size+0x1fd6c8>
ffffffffc0202630:	4785                	li	a5,1
ffffffffc0202632:	34f71363          	bne	a4,a5,ffffffffc0202978 <pmm_init+0x5b2>
ffffffffc0202636:	4681                	li	a3,0
ffffffffc0202638:	6605                	lui	a2,0x1
ffffffffc020263a:	85d2                	mv	a1,s4
ffffffffc020263c:	ccdff0ef          	jal	ra,ffffffffc0202308 <page_insert>
ffffffffc0202640:	30051c63          	bnez	a0,ffffffffc0202958 <pmm_init+0x592>
ffffffffc0202644:	000a2703          	lw	a4,0(s4)
ffffffffc0202648:	4789                	li	a5,2
ffffffffc020264a:	2ef71763          	bne	a4,a5,ffffffffc0202938 <pmm_init+0x572>
ffffffffc020264e:	000aa783          	lw	a5,0(s5)
ffffffffc0202652:	2c079363          	bnez	a5,ffffffffc0202918 <pmm_init+0x552>
ffffffffc0202656:	6008                	ld	a0,0(s0)
ffffffffc0202658:	4601                	li	a2,0
ffffffffc020265a:	6585                	lui	a1,0x1
ffffffffc020265c:	ff6ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc0202660:	48050c63          	beqz	a0,ffffffffc0202af8 <pmm_init+0x732>
ffffffffc0202664:	6118                	ld	a4,0(a0)
ffffffffc0202666:	00177793          	andi	a5,a4,1
ffffffffc020266a:	24078b63          	beqz	a5,ffffffffc02028c0 <pmm_init+0x4fa>
ffffffffc020266e:	6094                	ld	a3,0(s1)
ffffffffc0202670:	00271793          	slli	a5,a4,0x2
ffffffffc0202674:	83b1                	srli	a5,a5,0xc
ffffffffc0202676:	22d7f363          	bgeu	a5,a3,ffffffffc020289c <pmm_init+0x4d6>
ffffffffc020267a:	00093683          	ld	a3,0(s2)
ffffffffc020267e:	fff80637          	lui	a2,0xfff80
ffffffffc0202682:	97b2                	add	a5,a5,a2
ffffffffc0202684:	079a                	slli	a5,a5,0x6
ffffffffc0202686:	97b6                	add	a5,a5,a3
ffffffffc0202688:	44fa1863          	bne	s4,a5,ffffffffc0202ad8 <pmm_init+0x712>
ffffffffc020268c:	8b41                	andi	a4,a4,16
ffffffffc020268e:	42071563          	bnez	a4,ffffffffc0202ab8 <pmm_init+0x6f2>
ffffffffc0202692:	6008                	ld	a0,0(s0)
ffffffffc0202694:	4581                	li	a1,0
ffffffffc0202696:	bffff0ef          	jal	ra,ffffffffc0202294 <page_remove>
ffffffffc020269a:	000a2703          	lw	a4,0(s4)
ffffffffc020269e:	4785                	li	a5,1
ffffffffc02026a0:	3ef71c63          	bne	a4,a5,ffffffffc0202a98 <pmm_init+0x6d2>
ffffffffc02026a4:	000aa783          	lw	a5,0(s5)
ffffffffc02026a8:	3c079863          	bnez	a5,ffffffffc0202a78 <pmm_init+0x6b2>
ffffffffc02026ac:	6008                	ld	a0,0(s0)
ffffffffc02026ae:	6585                	lui	a1,0x1
ffffffffc02026b0:	be5ff0ef          	jal	ra,ffffffffc0202294 <page_remove>
ffffffffc02026b4:	000a2783          	lw	a5,0(s4)
ffffffffc02026b8:	3a079063          	bnez	a5,ffffffffc0202a58 <pmm_init+0x692>
ffffffffc02026bc:	000aa783          	lw	a5,0(s5)
ffffffffc02026c0:	4a079c63          	bnez	a5,ffffffffc0202b78 <pmm_init+0x7b2>
ffffffffc02026c4:	601c                	ld	a5,0(s0)
ffffffffc02026c6:	6098                	ld	a4,0(s1)
ffffffffc02026c8:	639c                	ld	a5,0(a5)
ffffffffc02026ca:	078a                	slli	a5,a5,0x2
ffffffffc02026cc:	83b1                	srli	a5,a5,0xc
ffffffffc02026ce:	1ce7f763          	bgeu	a5,a4,ffffffffc020289c <pmm_init+0x4d6>
ffffffffc02026d2:	fff80737          	lui	a4,0xfff80
ffffffffc02026d6:	00093503          	ld	a0,0(s2)
ffffffffc02026da:	97ba                	add	a5,a5,a4
ffffffffc02026dc:	079a                	slli	a5,a5,0x6
ffffffffc02026de:	953e                	add	a0,a0,a5
ffffffffc02026e0:	4118                	lw	a4,0(a0)
ffffffffc02026e2:	4785                	li	a5,1
ffffffffc02026e4:	46f71a63          	bne	a4,a5,ffffffffc0202b58 <pmm_init+0x792>
ffffffffc02026e8:	4585                	li	a1,1
ffffffffc02026ea:	ee2ff0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc02026ee:	601c                	ld	a5,0(s0)
ffffffffc02026f0:	00007517          	auipc	a0,0x7
ffffffffc02026f4:	7d050513          	addi	a0,a0,2000 # ffffffffc0209ec0 <default_pmm_manager+0x4f8>
ffffffffc02026f8:	0007b023          	sd	zero,0(a5)
ffffffffc02026fc:	a97fd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0202700:	6098                	ld	a4,0(s1)
ffffffffc0202702:	c02007b7          	lui	a5,0xc0200
ffffffffc0202706:	00c71693          	slli	a3,a4,0xc
ffffffffc020270a:	12d7fa63          	bgeu	a5,a3,ffffffffc020283e <pmm_init+0x478>
ffffffffc020270e:	83b1                	srli	a5,a5,0xc
ffffffffc0202710:	6008                	ld	a0,0(s0)
ffffffffc0202712:	c0200a37          	lui	s4,0xc0200
ffffffffc0202716:	16e7f663          	bgeu	a5,a4,ffffffffc0202882 <pmm_init+0x4bc>
ffffffffc020271a:	7b7d                	lui	s6,0xfffff
ffffffffc020271c:	6a85                	lui	s5,0x1
ffffffffc020271e:	a029                	j	ffffffffc0202728 <pmm_init+0x362>
ffffffffc0202720:	00ca5713          	srli	a4,s4,0xc
ffffffffc0202724:	14f77f63          	bgeu	a4,a5,ffffffffc0202882 <pmm_init+0x4bc>
ffffffffc0202728:	0009b583          	ld	a1,0(s3)
ffffffffc020272c:	4601                	li	a2,0
ffffffffc020272e:	95d2                	add	a1,a1,s4
ffffffffc0202730:	f22ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc0202734:	12050763          	beqz	a0,ffffffffc0202862 <pmm_init+0x49c>
ffffffffc0202738:	611c                	ld	a5,0(a0)
ffffffffc020273a:	078a                	slli	a5,a5,0x2
ffffffffc020273c:	0167f7b3          	and	a5,a5,s6
ffffffffc0202740:	11479163          	bne	a5,s4,ffffffffc0202842 <pmm_init+0x47c>
ffffffffc0202744:	609c                	ld	a5,0(s1)
ffffffffc0202746:	9a56                	add	s4,s4,s5
ffffffffc0202748:	6008                	ld	a0,0(s0)
ffffffffc020274a:	00c79713          	slli	a4,a5,0xc
ffffffffc020274e:	fcea69e3          	bltu	s4,a4,ffffffffc0202720 <pmm_init+0x35a>
ffffffffc0202752:	611c                	ld	a5,0(a0)
ffffffffc0202754:	44079263          	bnez	a5,ffffffffc0202b98 <pmm_init+0x7d2>
ffffffffc0202758:	4505                	li	a0,1
ffffffffc020275a:	deaff0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc020275e:	8aaa                	mv	s5,a0
ffffffffc0202760:	6008                	ld	a0,0(s0)
ffffffffc0202762:	4699                	li	a3,6
ffffffffc0202764:	10000613          	li	a2,256
ffffffffc0202768:	85d6                	mv	a1,s5
ffffffffc020276a:	b9fff0ef          	jal	ra,ffffffffc0202308 <page_insert>
ffffffffc020276e:	4a051e63          	bnez	a0,ffffffffc0202c2a <pmm_init+0x864>
ffffffffc0202772:	000aa703          	lw	a4,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc0202776:	4785                	li	a5,1
ffffffffc0202778:	48f71963          	bne	a4,a5,ffffffffc0202c0a <pmm_init+0x844>
ffffffffc020277c:	6008                	ld	a0,0(s0)
ffffffffc020277e:	6a05                	lui	s4,0x1
ffffffffc0202780:	4699                	li	a3,6
ffffffffc0202782:	100a0613          	addi	a2,s4,256 # 1100 <_binary_obj___user_faultread_out_size-0xc58>
ffffffffc0202786:	85d6                	mv	a1,s5
ffffffffc0202788:	b81ff0ef          	jal	ra,ffffffffc0202308 <page_insert>
ffffffffc020278c:	3a051663          	bnez	a0,ffffffffc0202b38 <pmm_init+0x772>
ffffffffc0202790:	000aa703          	lw	a4,0(s5)
ffffffffc0202794:	4789                	li	a5,2
ffffffffc0202796:	38f71163          	bne	a4,a5,ffffffffc0202b18 <pmm_init+0x752>
ffffffffc020279a:	00008597          	auipc	a1,0x8
ffffffffc020279e:	85e58593          	addi	a1,a1,-1954 # ffffffffc0209ff8 <default_pmm_manager+0x630>
ffffffffc02027a2:	10000513          	li	a0,256
ffffffffc02027a6:	464060ef          	jal	ra,ffffffffc0208c0a <strcpy>
ffffffffc02027aa:	100a0593          	addi	a1,s4,256
ffffffffc02027ae:	10000513          	li	a0,256
ffffffffc02027b2:	46a060ef          	jal	ra,ffffffffc0208c1c <strcmp>
ffffffffc02027b6:	56051063          	bnez	a0,ffffffffc0202d16 <pmm_init+0x950>
ffffffffc02027ba:	00093683          	ld	a3,0(s2)
ffffffffc02027be:	00080a37          	lui	s4,0x80
ffffffffc02027c2:	6098                	ld	a4,0(s1)
ffffffffc02027c4:	40da86b3          	sub	a3,s5,a3
ffffffffc02027c8:	8699                	srai	a3,a3,0x6
ffffffffc02027ca:	96d2                	add	a3,a3,s4
ffffffffc02027cc:	00c69793          	slli	a5,a3,0xc
ffffffffc02027d0:	83b1                	srli	a5,a5,0xc
ffffffffc02027d2:	06b2                	slli	a3,a3,0xc
ffffffffc02027d4:	52e7f563          	bgeu	a5,a4,ffffffffc0202cfe <pmm_init+0x938>
ffffffffc02027d8:	0009b783          	ld	a5,0(s3)
ffffffffc02027dc:	10000513          	li	a0,256
ffffffffc02027e0:	96be                	add	a3,a3,a5
ffffffffc02027e2:	10068023          	sb	zero,256(a3) # fffffffffffff100 <end+0x3fdc2128>
ffffffffc02027e6:	3e0060ef          	jal	ra,ffffffffc0208bc6 <strlen>
ffffffffc02027ea:	40051063          	bnez	a0,ffffffffc0202bea <pmm_init+0x824>
ffffffffc02027ee:	4585                	li	a1,1
ffffffffc02027f0:	8556                	mv	a0,s5
ffffffffc02027f2:	ddaff0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc02027f6:	601c                	ld	a5,0(s0)
ffffffffc02027f8:	6098                	ld	a4,0(s1)
ffffffffc02027fa:	639c                	ld	a5,0(a5)
ffffffffc02027fc:	078a                	slli	a5,a5,0x2
ffffffffc02027fe:	83b1                	srli	a5,a5,0xc
ffffffffc0202800:	08e7fe63          	bgeu	a5,a4,ffffffffc020289c <pmm_init+0x4d6>
ffffffffc0202804:	00093503          	ld	a0,0(s2)
ffffffffc0202808:	414787b3          	sub	a5,a5,s4
ffffffffc020280c:	079a                	slli	a5,a5,0x6
ffffffffc020280e:	953e                	add	a0,a0,a5
ffffffffc0202810:	4585                	li	a1,1
ffffffffc0202812:	dbaff0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0202816:	601c                	ld	a5,0(s0)
ffffffffc0202818:	00008517          	auipc	a0,0x8
ffffffffc020281c:	85850513          	addi	a0,a0,-1960 # ffffffffc020a070 <default_pmm_manager+0x6a8>
ffffffffc0202820:	0007b023          	sd	zero,0(a5) # ffffffffc0200000 <kern_entry>
ffffffffc0202824:	96ffd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0202828:	7442                	ld	s0,48(sp)
ffffffffc020282a:	70e2                	ld	ra,56(sp)
ffffffffc020282c:	74a2                	ld	s1,40(sp)
ffffffffc020282e:	7902                	ld	s2,32(sp)
ffffffffc0202830:	69e2                	ld	s3,24(sp)
ffffffffc0202832:	6a42                	ld	s4,16(sp)
ffffffffc0202834:	6aa2                	ld	s5,8(sp)
ffffffffc0202836:	6b02                	ld	s6,0(sp)
ffffffffc0202838:	6121                	addi	sp,sp,64
ffffffffc020283a:	aeeff06f          	j	ffffffffc0201b28 <kmalloc_init>
ffffffffc020283e:	6008                	ld	a0,0(s0)
ffffffffc0202840:	bf09                	j	ffffffffc0202752 <pmm_init+0x38c>
ffffffffc0202842:	00007697          	auipc	a3,0x7
ffffffffc0202846:	6de68693          	addi	a3,a3,1758 # ffffffffc0209f20 <default_pmm_manager+0x558>
ffffffffc020284a:	00007617          	auipc	a2,0x7
ffffffffc020284e:	a3660613          	addi	a2,a2,-1482 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202852:	22700593          	li	a1,551
ffffffffc0202856:	00007517          	auipc	a0,0x7
ffffffffc020285a:	2e250513          	addi	a0,a0,738 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc020285e:	c27fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202862:	00007697          	auipc	a3,0x7
ffffffffc0202866:	67e68693          	addi	a3,a3,1662 # ffffffffc0209ee0 <default_pmm_manager+0x518>
ffffffffc020286a:	00007617          	auipc	a2,0x7
ffffffffc020286e:	a1660613          	addi	a2,a2,-1514 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202872:	22600593          	li	a1,550
ffffffffc0202876:	00007517          	auipc	a0,0x7
ffffffffc020287a:	2c250513          	addi	a0,a0,706 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc020287e:	c07fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202882:	86d2                	mv	a3,s4
ffffffffc0202884:	00007617          	auipc	a2,0x7
ffffffffc0202888:	19460613          	addi	a2,a2,404 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc020288c:	22600593          	li	a1,550
ffffffffc0202890:	00007517          	auipc	a0,0x7
ffffffffc0202894:	2a850513          	addi	a0,a0,680 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202898:	bedfd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020289c:	c8cff0ef          	jal	ra,ffffffffc0201d28 <pa2page.part.4>
ffffffffc02028a0:	00007697          	auipc	a3,0x7
ffffffffc02028a4:	37068693          	addi	a3,a3,880 # ffffffffc0209c10 <default_pmm_manager+0x248>
ffffffffc02028a8:	00007617          	auipc	a2,0x7
ffffffffc02028ac:	9d860613          	addi	a2,a2,-1576 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02028b0:	1f400593          	li	a1,500
ffffffffc02028b4:	00007517          	auipc	a0,0x7
ffffffffc02028b8:	28450513          	addi	a0,a0,644 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc02028bc:	bc9fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02028c0:	00007617          	auipc	a2,0x7
ffffffffc02028c4:	41060613          	addi	a2,a2,1040 # ffffffffc0209cd0 <default_pmm_manager+0x308>
ffffffffc02028c8:	07400593          	li	a1,116
ffffffffc02028cc:	00007517          	auipc	a0,0x7
ffffffffc02028d0:	17450513          	addi	a0,a0,372 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc02028d4:	bb1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02028d8:	00007697          	auipc	a3,0x7
ffffffffc02028dc:	43868693          	addi	a3,a3,1080 # ffffffffc0209d10 <default_pmm_manager+0x348>
ffffffffc02028e0:	00007617          	auipc	a2,0x7
ffffffffc02028e4:	9a060613          	addi	a2,a2,-1632 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02028e8:	1fe00593          	li	a1,510
ffffffffc02028ec:	00007517          	auipc	a0,0x7
ffffffffc02028f0:	24c50513          	addi	a0,a0,588 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc02028f4:	b91fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02028f8:	00007697          	auipc	a3,0x7
ffffffffc02028fc:	40068693          	addi	a3,a3,1024 # ffffffffc0209cf8 <default_pmm_manager+0x330>
ffffffffc0202900:	00007617          	auipc	a2,0x7
ffffffffc0202904:	98060613          	addi	a2,a2,-1664 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202908:	1fd00593          	li	a1,509
ffffffffc020290c:	00007517          	auipc	a0,0x7
ffffffffc0202910:	22c50513          	addi	a0,a0,556 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202914:	b71fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202918:	00007697          	auipc	a3,0x7
ffffffffc020291c:	53868693          	addi	a3,a3,1336 # ffffffffc0209e50 <default_pmm_manager+0x488>
ffffffffc0202920:	00007617          	auipc	a2,0x7
ffffffffc0202924:	96060613          	addi	a2,a2,-1696 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202928:	20e00593          	li	a1,526
ffffffffc020292c:	00007517          	auipc	a0,0x7
ffffffffc0202930:	20c50513          	addi	a0,a0,524 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202934:	b51fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202938:	00007697          	auipc	a3,0x7
ffffffffc020293c:	50068693          	addi	a3,a3,1280 # ffffffffc0209e38 <default_pmm_manager+0x470>
ffffffffc0202940:	00007617          	auipc	a2,0x7
ffffffffc0202944:	94060613          	addi	a2,a2,-1728 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202948:	20d00593          	li	a1,525
ffffffffc020294c:	00007517          	auipc	a0,0x7
ffffffffc0202950:	1ec50513          	addi	a0,a0,492 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202954:	b31fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202958:	00007697          	auipc	a3,0x7
ffffffffc020295c:	4b068693          	addi	a3,a3,1200 # ffffffffc0209e08 <default_pmm_manager+0x440>
ffffffffc0202960:	00007617          	auipc	a2,0x7
ffffffffc0202964:	92060613          	addi	a2,a2,-1760 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202968:	20c00593          	li	a1,524
ffffffffc020296c:	00007517          	auipc	a0,0x7
ffffffffc0202970:	1cc50513          	addi	a0,a0,460 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202974:	b11fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202978:	00007697          	auipc	a3,0x7
ffffffffc020297c:	47868693          	addi	a3,a3,1144 # ffffffffc0209df0 <default_pmm_manager+0x428>
ffffffffc0202980:	00007617          	auipc	a2,0x7
ffffffffc0202984:	90060613          	addi	a2,a2,-1792 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202988:	20a00593          	li	a1,522
ffffffffc020298c:	00007517          	auipc	a0,0x7
ffffffffc0202990:	1ac50513          	addi	a0,a0,428 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202994:	af1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202998:	00007697          	auipc	a3,0x7
ffffffffc020299c:	44068693          	addi	a3,a3,1088 # ffffffffc0209dd8 <default_pmm_manager+0x410>
ffffffffc02029a0:	00007617          	auipc	a2,0x7
ffffffffc02029a4:	8e060613          	addi	a2,a2,-1824 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02029a8:	20900593          	li	a1,521
ffffffffc02029ac:	00007517          	auipc	a0,0x7
ffffffffc02029b0:	18c50513          	addi	a0,a0,396 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc02029b4:	ad1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02029b8:	00007697          	auipc	a3,0x7
ffffffffc02029bc:	41068693          	addi	a3,a3,1040 # ffffffffc0209dc8 <default_pmm_manager+0x400>
ffffffffc02029c0:	00007617          	auipc	a2,0x7
ffffffffc02029c4:	8c060613          	addi	a2,a2,-1856 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02029c8:	20800593          	li	a1,520
ffffffffc02029cc:	00007517          	auipc	a0,0x7
ffffffffc02029d0:	16c50513          	addi	a0,a0,364 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc02029d4:	ab1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02029d8:	00007697          	auipc	a3,0x7
ffffffffc02029dc:	3e068693          	addi	a3,a3,992 # ffffffffc0209db8 <default_pmm_manager+0x3f0>
ffffffffc02029e0:	00007617          	auipc	a2,0x7
ffffffffc02029e4:	8a060613          	addi	a2,a2,-1888 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02029e8:	20700593          	li	a1,519
ffffffffc02029ec:	00007517          	auipc	a0,0x7
ffffffffc02029f0:	14c50513          	addi	a0,a0,332 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc02029f4:	a91fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02029f8:	00007697          	auipc	a3,0x7
ffffffffc02029fc:	39068693          	addi	a3,a3,912 # ffffffffc0209d88 <default_pmm_manager+0x3c0>
ffffffffc0202a00:	00007617          	auipc	a2,0x7
ffffffffc0202a04:	88060613          	addi	a2,a2,-1920 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202a08:	20600593          	li	a1,518
ffffffffc0202a0c:	00007517          	auipc	a0,0x7
ffffffffc0202a10:	12c50513          	addi	a0,a0,300 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202a14:	a71fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202a18:	00007697          	auipc	a3,0x7
ffffffffc0202a1c:	33868693          	addi	a3,a3,824 # ffffffffc0209d50 <default_pmm_manager+0x388>
ffffffffc0202a20:	00007617          	auipc	a2,0x7
ffffffffc0202a24:	86060613          	addi	a2,a2,-1952 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202a28:	20500593          	li	a1,517
ffffffffc0202a2c:	00007517          	auipc	a0,0x7
ffffffffc0202a30:	10c50513          	addi	a0,a0,268 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202a34:	a51fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202a38:	00007697          	auipc	a3,0x7
ffffffffc0202a3c:	2f068693          	addi	a3,a3,752 # ffffffffc0209d28 <default_pmm_manager+0x360>
ffffffffc0202a40:	00007617          	auipc	a2,0x7
ffffffffc0202a44:	84060613          	addi	a2,a2,-1984 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202a48:	20200593          	li	a1,514
ffffffffc0202a4c:	00007517          	auipc	a0,0x7
ffffffffc0202a50:	0ec50513          	addi	a0,a0,236 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202a54:	a31fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202a58:	00007697          	auipc	a3,0x7
ffffffffc0202a5c:	42868693          	addi	a3,a3,1064 # ffffffffc0209e80 <default_pmm_manager+0x4b8>
ffffffffc0202a60:	00007617          	auipc	a2,0x7
ffffffffc0202a64:	82060613          	addi	a2,a2,-2016 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202a68:	21800593          	li	a1,536
ffffffffc0202a6c:	00007517          	auipc	a0,0x7
ffffffffc0202a70:	0cc50513          	addi	a0,a0,204 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202a74:	a11fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202a78:	00007697          	auipc	a3,0x7
ffffffffc0202a7c:	3d868693          	addi	a3,a3,984 # ffffffffc0209e50 <default_pmm_manager+0x488>
ffffffffc0202a80:	00007617          	auipc	a2,0x7
ffffffffc0202a84:	80060613          	addi	a2,a2,-2048 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202a88:	21500593          	li	a1,533
ffffffffc0202a8c:	00007517          	auipc	a0,0x7
ffffffffc0202a90:	0ac50513          	addi	a0,a0,172 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202a94:	9f1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202a98:	00007697          	auipc	a3,0x7
ffffffffc0202a9c:	27868693          	addi	a3,a3,632 # ffffffffc0209d10 <default_pmm_manager+0x348>
ffffffffc0202aa0:	00006617          	auipc	a2,0x6
ffffffffc0202aa4:	7e060613          	addi	a2,a2,2016 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202aa8:	21400593          	li	a1,532
ffffffffc0202aac:	00007517          	auipc	a0,0x7
ffffffffc0202ab0:	08c50513          	addi	a0,a0,140 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202ab4:	9d1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202ab8:	00007697          	auipc	a3,0x7
ffffffffc0202abc:	3b068693          	addi	a3,a3,944 # ffffffffc0209e68 <default_pmm_manager+0x4a0>
ffffffffc0202ac0:	00006617          	auipc	a2,0x6
ffffffffc0202ac4:	7c060613          	addi	a2,a2,1984 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202ac8:	21100593          	li	a1,529
ffffffffc0202acc:	00007517          	auipc	a0,0x7
ffffffffc0202ad0:	06c50513          	addi	a0,a0,108 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202ad4:	9b1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202ad8:	00007697          	auipc	a3,0x7
ffffffffc0202adc:	22068693          	addi	a3,a3,544 # ffffffffc0209cf8 <default_pmm_manager+0x330>
ffffffffc0202ae0:	00006617          	auipc	a2,0x6
ffffffffc0202ae4:	7a060613          	addi	a2,a2,1952 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202ae8:	21000593          	li	a1,528
ffffffffc0202aec:	00007517          	auipc	a0,0x7
ffffffffc0202af0:	04c50513          	addi	a0,a0,76 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202af4:	991fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202af8:	00007697          	auipc	a3,0x7
ffffffffc0202afc:	29068693          	addi	a3,a3,656 # ffffffffc0209d88 <default_pmm_manager+0x3c0>
ffffffffc0202b00:	00006617          	auipc	a2,0x6
ffffffffc0202b04:	78060613          	addi	a2,a2,1920 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202b08:	20f00593          	li	a1,527
ffffffffc0202b0c:	00007517          	auipc	a0,0x7
ffffffffc0202b10:	02c50513          	addi	a0,a0,44 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202b14:	971fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202b18:	00007697          	auipc	a3,0x7
ffffffffc0202b1c:	4c868693          	addi	a3,a3,1224 # ffffffffc0209fe0 <default_pmm_manager+0x618>
ffffffffc0202b20:	00006617          	auipc	a2,0x6
ffffffffc0202b24:	76060613          	addi	a2,a2,1888 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202b28:	23200593          	li	a1,562
ffffffffc0202b2c:	00007517          	auipc	a0,0x7
ffffffffc0202b30:	00c50513          	addi	a0,a0,12 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202b34:	951fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202b38:	00007697          	auipc	a3,0x7
ffffffffc0202b3c:	46868693          	addi	a3,a3,1128 # ffffffffc0209fa0 <default_pmm_manager+0x5d8>
ffffffffc0202b40:	00006617          	auipc	a2,0x6
ffffffffc0202b44:	74060613          	addi	a2,a2,1856 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202b48:	23100593          	li	a1,561
ffffffffc0202b4c:	00007517          	auipc	a0,0x7
ffffffffc0202b50:	fec50513          	addi	a0,a0,-20 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202b54:	931fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202b58:	00007697          	auipc	a3,0x7
ffffffffc0202b5c:	34068693          	addi	a3,a3,832 # ffffffffc0209e98 <default_pmm_manager+0x4d0>
ffffffffc0202b60:	00006617          	auipc	a2,0x6
ffffffffc0202b64:	72060613          	addi	a2,a2,1824 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202b68:	21b00593          	li	a1,539
ffffffffc0202b6c:	00007517          	auipc	a0,0x7
ffffffffc0202b70:	fcc50513          	addi	a0,a0,-52 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202b74:	911fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202b78:	00007697          	auipc	a3,0x7
ffffffffc0202b7c:	2d868693          	addi	a3,a3,728 # ffffffffc0209e50 <default_pmm_manager+0x488>
ffffffffc0202b80:	00006617          	auipc	a2,0x6
ffffffffc0202b84:	70060613          	addi	a2,a2,1792 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202b88:	21900593          	li	a1,537
ffffffffc0202b8c:	00007517          	auipc	a0,0x7
ffffffffc0202b90:	fac50513          	addi	a0,a0,-84 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202b94:	8f1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202b98:	00007697          	auipc	a3,0x7
ffffffffc0202b9c:	3a068693          	addi	a3,a3,928 # ffffffffc0209f38 <default_pmm_manager+0x570>
ffffffffc0202ba0:	00006617          	auipc	a2,0x6
ffffffffc0202ba4:	6e060613          	addi	a2,a2,1760 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202ba8:	22b00593          	li	a1,555
ffffffffc0202bac:	00007517          	auipc	a0,0x7
ffffffffc0202bb0:	f8c50513          	addi	a0,a0,-116 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202bb4:	8d1fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202bb8:	86aa                	mv	a3,a0
ffffffffc0202bba:	00007617          	auipc	a2,0x7
ffffffffc0202bbe:	e9660613          	addi	a2,a2,-362 # ffffffffc0209a50 <default_pmm_manager+0x88>
ffffffffc0202bc2:	0c100593          	li	a1,193
ffffffffc0202bc6:	00007517          	auipc	a0,0x7
ffffffffc0202bca:	f7250513          	addi	a0,a0,-142 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202bce:	8b7fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202bd2:	00007617          	auipc	a2,0x7
ffffffffc0202bd6:	e7e60613          	addi	a2,a2,-386 # ffffffffc0209a50 <default_pmm_manager+0x88>
ffffffffc0202bda:	07f00593          	li	a1,127
ffffffffc0202bde:	00007517          	auipc	a0,0x7
ffffffffc0202be2:	f5a50513          	addi	a0,a0,-166 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202be6:	89ffd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202bea:	00007697          	auipc	a3,0x7
ffffffffc0202bee:	45e68693          	addi	a3,a3,1118 # ffffffffc020a048 <default_pmm_manager+0x680>
ffffffffc0202bf2:	00006617          	auipc	a2,0x6
ffffffffc0202bf6:	68e60613          	addi	a2,a2,1678 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202bfa:	23900593          	li	a1,569
ffffffffc0202bfe:	00007517          	auipc	a0,0x7
ffffffffc0202c02:	f3a50513          	addi	a0,a0,-198 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202c06:	87ffd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202c0a:	00007697          	auipc	a3,0x7
ffffffffc0202c0e:	37e68693          	addi	a3,a3,894 # ffffffffc0209f88 <default_pmm_manager+0x5c0>
ffffffffc0202c12:	00006617          	auipc	a2,0x6
ffffffffc0202c16:	66e60613          	addi	a2,a2,1646 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202c1a:	23000593          	li	a1,560
ffffffffc0202c1e:	00007517          	auipc	a0,0x7
ffffffffc0202c22:	f1a50513          	addi	a0,a0,-230 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202c26:	85ffd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202c2a:	00007697          	auipc	a3,0x7
ffffffffc0202c2e:	32668693          	addi	a3,a3,806 # ffffffffc0209f50 <default_pmm_manager+0x588>
ffffffffc0202c32:	00006617          	auipc	a2,0x6
ffffffffc0202c36:	64e60613          	addi	a2,a2,1614 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202c3a:	22f00593          	li	a1,559
ffffffffc0202c3e:	00007517          	auipc	a0,0x7
ffffffffc0202c42:	efa50513          	addi	a0,a0,-262 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202c46:	83ffd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202c4a:	00007697          	auipc	a3,0x7
ffffffffc0202c4e:	fa668693          	addi	a3,a3,-90 # ffffffffc0209bf0 <default_pmm_manager+0x228>
ffffffffc0202c52:	00006617          	auipc	a2,0x6
ffffffffc0202c56:	62e60613          	addi	a2,a2,1582 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202c5a:	1f300593          	li	a1,499
ffffffffc0202c5e:	00007517          	auipc	a0,0x7
ffffffffc0202c62:	eda50513          	addi	a0,a0,-294 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202c66:	81ffd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202c6a:	00007697          	auipc	a3,0x7
ffffffffc0202c6e:	03668693          	addi	a3,a3,54 # ffffffffc0209ca0 <default_pmm_manager+0x2d8>
ffffffffc0202c72:	00006617          	auipc	a2,0x6
ffffffffc0202c76:	60e60613          	addi	a2,a2,1550 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202c7a:	1fc00593          	li	a1,508
ffffffffc0202c7e:	00007517          	auipc	a0,0x7
ffffffffc0202c82:	eba50513          	addi	a0,a0,-326 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202c86:	ffefd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202c8a:	00007697          	auipc	a3,0x7
ffffffffc0202c8e:	fe668693          	addi	a3,a3,-26 # ffffffffc0209c70 <default_pmm_manager+0x2a8>
ffffffffc0202c92:	00006617          	auipc	a2,0x6
ffffffffc0202c96:	5ee60613          	addi	a2,a2,1518 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202c9a:	1f900593          	li	a1,505
ffffffffc0202c9e:	00007517          	auipc	a0,0x7
ffffffffc0202ca2:	e9a50513          	addi	a0,a0,-358 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202ca6:	fdefd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202caa:	00007697          	auipc	a3,0x7
ffffffffc0202cae:	f9e68693          	addi	a3,a3,-98 # ffffffffc0209c48 <default_pmm_manager+0x280>
ffffffffc0202cb2:	00006617          	auipc	a2,0x6
ffffffffc0202cb6:	5ce60613          	addi	a2,a2,1486 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202cba:	1f500593          	li	a1,501
ffffffffc0202cbe:	00007517          	auipc	a0,0x7
ffffffffc0202cc2:	e7a50513          	addi	a0,a0,-390 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202cc6:	fbefd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202cca:	86d6                	mv	a3,s5
ffffffffc0202ccc:	00007617          	auipc	a2,0x7
ffffffffc0202cd0:	d4c60613          	addi	a2,a2,-692 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0202cd4:	20100593          	li	a1,513
ffffffffc0202cd8:	00007517          	auipc	a0,0x7
ffffffffc0202cdc:	e6050513          	addi	a0,a0,-416 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202ce0:	fa4fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202ce4:	86be                	mv	a3,a5
ffffffffc0202ce6:	00007617          	auipc	a2,0x7
ffffffffc0202cea:	d3260613          	addi	a2,a2,-718 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0202cee:	20000593          	li	a1,512
ffffffffc0202cf2:	00007517          	auipc	a0,0x7
ffffffffc0202cf6:	e4650513          	addi	a0,a0,-442 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202cfa:	f8afd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202cfe:	00007617          	auipc	a2,0x7
ffffffffc0202d02:	d1a60613          	addi	a2,a2,-742 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0202d06:	06900593          	li	a1,105
ffffffffc0202d0a:	00007517          	auipc	a0,0x7
ffffffffc0202d0e:	d3650513          	addi	a0,a0,-714 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0202d12:	f72fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202d16:	00007697          	auipc	a3,0x7
ffffffffc0202d1a:	2fa68693          	addi	a3,a3,762 # ffffffffc020a010 <default_pmm_manager+0x648>
ffffffffc0202d1e:	00006617          	auipc	a2,0x6
ffffffffc0202d22:	56260613          	addi	a2,a2,1378 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202d26:	23600593          	li	a1,566
ffffffffc0202d2a:	00007517          	auipc	a0,0x7
ffffffffc0202d2e:	e0e50513          	addi	a0,a0,-498 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202d32:	f52fd0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0202d36 <copy_range>:
ffffffffc0202d36:	7159                	addi	sp,sp,-112
ffffffffc0202d38:	00d667b3          	or	a5,a2,a3
ffffffffc0202d3c:	f486                	sd	ra,104(sp)
ffffffffc0202d3e:	f0a2                	sd	s0,96(sp)
ffffffffc0202d40:	eca6                	sd	s1,88(sp)
ffffffffc0202d42:	e8ca                	sd	s2,80(sp)
ffffffffc0202d44:	e4ce                	sd	s3,72(sp)
ffffffffc0202d46:	e0d2                	sd	s4,64(sp)
ffffffffc0202d48:	fc56                	sd	s5,56(sp)
ffffffffc0202d4a:	f85a                	sd	s6,48(sp)
ffffffffc0202d4c:	f45e                	sd	s7,40(sp)
ffffffffc0202d4e:	f062                	sd	s8,32(sp)
ffffffffc0202d50:	ec66                	sd	s9,24(sp)
ffffffffc0202d52:	e86a                	sd	s10,16(sp)
ffffffffc0202d54:	e46e                	sd	s11,8(sp)
ffffffffc0202d56:	03479713          	slli	a4,a5,0x34
ffffffffc0202d5a:	1e071863          	bnez	a4,ffffffffc0202f4a <copy_range+0x214>
ffffffffc0202d5e:	002007b7          	lui	a5,0x200
ffffffffc0202d62:	8432                	mv	s0,a2
ffffffffc0202d64:	16f66b63          	bltu	a2,a5,ffffffffc0202eda <copy_range+0x1a4>
ffffffffc0202d68:	84b6                	mv	s1,a3
ffffffffc0202d6a:	16d67863          	bgeu	a2,a3,ffffffffc0202eda <copy_range+0x1a4>
ffffffffc0202d6e:	4785                	li	a5,1
ffffffffc0202d70:	07fe                	slli	a5,a5,0x1f
ffffffffc0202d72:	16d7e463          	bltu	a5,a3,ffffffffc0202eda <copy_range+0x1a4>
ffffffffc0202d76:	5a7d                	li	s4,-1
ffffffffc0202d78:	8aaa                	mv	s5,a0
ffffffffc0202d7a:	892e                	mv	s2,a1
ffffffffc0202d7c:	6985                	lui	s3,0x1
ffffffffc0202d7e:	0003ac17          	auipc	s8,0x3a
ffffffffc0202d82:	0e2c0c13          	addi	s8,s8,226 # ffffffffc023ce60 <npage>
ffffffffc0202d86:	0003ab97          	auipc	s7,0x3a
ffffffffc0202d8a:	15ab8b93          	addi	s7,s7,346 # ffffffffc023cee0 <pages>
ffffffffc0202d8e:	00080b37          	lui	s6,0x80
ffffffffc0202d92:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0202d96:	4601                	li	a2,0
ffffffffc0202d98:	85a2                	mv	a1,s0
ffffffffc0202d9a:	854a                	mv	a0,s2
ffffffffc0202d9c:	8b6ff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc0202da0:	8caa                	mv	s9,a0
ffffffffc0202da2:	c17d                	beqz	a0,ffffffffc0202e88 <copy_range+0x152>
ffffffffc0202da4:	611c                	ld	a5,0(a0)
ffffffffc0202da6:	8b85                	andi	a5,a5,1
ffffffffc0202da8:	e785                	bnez	a5,ffffffffc0202dd0 <copy_range+0x9a>
ffffffffc0202daa:	944e                	add	s0,s0,s3
ffffffffc0202dac:	fe9465e3          	bltu	s0,s1,ffffffffc0202d96 <copy_range+0x60>
ffffffffc0202db0:	4501                	li	a0,0
ffffffffc0202db2:	70a6                	ld	ra,104(sp)
ffffffffc0202db4:	7406                	ld	s0,96(sp)
ffffffffc0202db6:	64e6                	ld	s1,88(sp)
ffffffffc0202db8:	6946                	ld	s2,80(sp)
ffffffffc0202dba:	69a6                	ld	s3,72(sp)
ffffffffc0202dbc:	6a06                	ld	s4,64(sp)
ffffffffc0202dbe:	7ae2                	ld	s5,56(sp)
ffffffffc0202dc0:	7b42                	ld	s6,48(sp)
ffffffffc0202dc2:	7ba2                	ld	s7,40(sp)
ffffffffc0202dc4:	7c02                	ld	s8,32(sp)
ffffffffc0202dc6:	6ce2                	ld	s9,24(sp)
ffffffffc0202dc8:	6d42                	ld	s10,16(sp)
ffffffffc0202dca:	6da2                	ld	s11,8(sp)
ffffffffc0202dcc:	6165                	addi	sp,sp,112
ffffffffc0202dce:	8082                	ret
ffffffffc0202dd0:	4605                	li	a2,1
ffffffffc0202dd2:	85a2                	mv	a1,s0
ffffffffc0202dd4:	8556                	mv	a0,s5
ffffffffc0202dd6:	87cff0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc0202dda:	c169                	beqz	a0,ffffffffc0202e9c <copy_range+0x166>
ffffffffc0202ddc:	000cb783          	ld	a5,0(s9)
ffffffffc0202de0:	0017f713          	andi	a4,a5,1
ffffffffc0202de4:	01f7fc93          	andi	s9,a5,31
ffffffffc0202de8:	14070563          	beqz	a4,ffffffffc0202f32 <copy_range+0x1fc>
ffffffffc0202dec:	000c3683          	ld	a3,0(s8)
ffffffffc0202df0:	078a                	slli	a5,a5,0x2
ffffffffc0202df2:	00c7d713          	srli	a4,a5,0xc
ffffffffc0202df6:	12d77263          	bgeu	a4,a3,ffffffffc0202f1a <copy_range+0x1e4>
ffffffffc0202dfa:	000bb783          	ld	a5,0(s7)
ffffffffc0202dfe:	fff806b7          	lui	a3,0xfff80
ffffffffc0202e02:	9736                	add	a4,a4,a3
ffffffffc0202e04:	071a                	slli	a4,a4,0x6
ffffffffc0202e06:	4505                	li	a0,1
ffffffffc0202e08:	00e78db3          	add	s11,a5,a4
ffffffffc0202e0c:	f39fe0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0202e10:	8d2a                	mv	s10,a0
ffffffffc0202e12:	0a0d8463          	beqz	s11,ffffffffc0202eba <copy_range+0x184>
ffffffffc0202e16:	c175                	beqz	a0,ffffffffc0202efa <copy_range+0x1c4>
ffffffffc0202e18:	000bb703          	ld	a4,0(s7)
ffffffffc0202e1c:	000c3603          	ld	a2,0(s8)
ffffffffc0202e20:	40ed86b3          	sub	a3,s11,a4
ffffffffc0202e24:	8699                	srai	a3,a3,0x6
ffffffffc0202e26:	96da                	add	a3,a3,s6
ffffffffc0202e28:	0146f7b3          	and	a5,a3,s4
ffffffffc0202e2c:	06b2                	slli	a3,a3,0xc
ffffffffc0202e2e:	06c7fa63          	bgeu	a5,a2,ffffffffc0202ea2 <copy_range+0x16c>
ffffffffc0202e32:	40e507b3          	sub	a5,a0,a4
ffffffffc0202e36:	0003a717          	auipc	a4,0x3a
ffffffffc0202e3a:	09a70713          	addi	a4,a4,154 # ffffffffc023ced0 <va_pa_offset>
ffffffffc0202e3e:	6308                	ld	a0,0(a4)
ffffffffc0202e40:	8799                	srai	a5,a5,0x6
ffffffffc0202e42:	97da                	add	a5,a5,s6
ffffffffc0202e44:	0147f733          	and	a4,a5,s4
ffffffffc0202e48:	00a685b3          	add	a1,a3,a0
ffffffffc0202e4c:	07b2                	slli	a5,a5,0xc
ffffffffc0202e4e:	04c77963          	bgeu	a4,a2,ffffffffc0202ea0 <copy_range+0x16a>
ffffffffc0202e52:	6605                	lui	a2,0x1
ffffffffc0202e54:	953e                	add	a0,a0,a5
ffffffffc0202e56:	621050ef          	jal	ra,ffffffffc0208c76 <memcpy>
ffffffffc0202e5a:	86e6                	mv	a3,s9
ffffffffc0202e5c:	8622                	mv	a2,s0
ffffffffc0202e5e:	85ea                	mv	a1,s10
ffffffffc0202e60:	8556                	mv	a0,s5
ffffffffc0202e62:	ca6ff0ef          	jal	ra,ffffffffc0202308 <page_insert>
ffffffffc0202e66:	d131                	beqz	a0,ffffffffc0202daa <copy_range+0x74>
ffffffffc0202e68:	00007697          	auipc	a3,0x7
ffffffffc0202e6c:	cc068693          	addi	a3,a3,-832 # ffffffffc0209b28 <default_pmm_manager+0x160>
ffffffffc0202e70:	00006617          	auipc	a2,0x6
ffffffffc0202e74:	41060613          	addi	a2,a2,1040 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202e78:	19900593          	li	a1,409
ffffffffc0202e7c:	00007517          	auipc	a0,0x7
ffffffffc0202e80:	cbc50513          	addi	a0,a0,-836 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202e84:	e00fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202e88:	002007b7          	lui	a5,0x200
ffffffffc0202e8c:	943e                	add	s0,s0,a5
ffffffffc0202e8e:	ffe007b7          	lui	a5,0xffe00
ffffffffc0202e92:	8c7d                	and	s0,s0,a5
ffffffffc0202e94:	dc11                	beqz	s0,ffffffffc0202db0 <copy_range+0x7a>
ffffffffc0202e96:	f09460e3          	bltu	s0,s1,ffffffffc0202d96 <copy_range+0x60>
ffffffffc0202e9a:	bf19                	j	ffffffffc0202db0 <copy_range+0x7a>
ffffffffc0202e9c:	5571                	li	a0,-4
ffffffffc0202e9e:	bf11                	j	ffffffffc0202db2 <copy_range+0x7c>
ffffffffc0202ea0:	86be                	mv	a3,a5
ffffffffc0202ea2:	00007617          	auipc	a2,0x7
ffffffffc0202ea6:	b7660613          	addi	a2,a2,-1162 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0202eaa:	06900593          	li	a1,105
ffffffffc0202eae:	00007517          	auipc	a0,0x7
ffffffffc0202eb2:	b9250513          	addi	a0,a0,-1134 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0202eb6:	dcefd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202eba:	00007697          	auipc	a3,0x7
ffffffffc0202ebe:	c4e68693          	addi	a3,a3,-946 # ffffffffc0209b08 <default_pmm_manager+0x140>
ffffffffc0202ec2:	00006617          	auipc	a2,0x6
ffffffffc0202ec6:	3be60613          	addi	a2,a2,958 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202eca:	17e00593          	li	a1,382
ffffffffc0202ece:	00007517          	auipc	a0,0x7
ffffffffc0202ed2:	c6a50513          	addi	a0,a0,-918 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202ed6:	daefd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202eda:	00007697          	auipc	a3,0x7
ffffffffc0202ede:	1e668693          	addi	a3,a3,486 # ffffffffc020a0c0 <default_pmm_manager+0x6f8>
ffffffffc0202ee2:	00006617          	auipc	a2,0x6
ffffffffc0202ee6:	39e60613          	addi	a2,a2,926 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202eea:	16a00593          	li	a1,362
ffffffffc0202eee:	00007517          	auipc	a0,0x7
ffffffffc0202ef2:	c4a50513          	addi	a0,a0,-950 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202ef6:	d8efd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202efa:	00007697          	auipc	a3,0x7
ffffffffc0202efe:	c1e68693          	addi	a3,a3,-994 # ffffffffc0209b18 <default_pmm_manager+0x150>
ffffffffc0202f02:	00006617          	auipc	a2,0x6
ffffffffc0202f06:	37e60613          	addi	a2,a2,894 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202f0a:	17f00593          	li	a1,383
ffffffffc0202f0e:	00007517          	auipc	a0,0x7
ffffffffc0202f12:	c2a50513          	addi	a0,a0,-982 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202f16:	d6efd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202f1a:	00007617          	auipc	a2,0x7
ffffffffc0202f1e:	b5e60613          	addi	a2,a2,-1186 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc0202f22:	06200593          	li	a1,98
ffffffffc0202f26:	00007517          	auipc	a0,0x7
ffffffffc0202f2a:	b1a50513          	addi	a0,a0,-1254 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0202f2e:	d56fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202f32:	00007617          	auipc	a2,0x7
ffffffffc0202f36:	d9e60613          	addi	a2,a2,-610 # ffffffffc0209cd0 <default_pmm_manager+0x308>
ffffffffc0202f3a:	07400593          	li	a1,116
ffffffffc0202f3e:	00007517          	auipc	a0,0x7
ffffffffc0202f42:	b0250513          	addi	a0,a0,-1278 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0202f46:	d3efd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0202f4a:	00007697          	auipc	a3,0x7
ffffffffc0202f4e:	14668693          	addi	a3,a3,326 # ffffffffc020a090 <default_pmm_manager+0x6c8>
ffffffffc0202f52:	00006617          	auipc	a2,0x6
ffffffffc0202f56:	32e60613          	addi	a2,a2,814 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202f5a:	16900593          	li	a1,361
ffffffffc0202f5e:	00007517          	auipc	a0,0x7
ffffffffc0202f62:	bda50513          	addi	a0,a0,-1062 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0202f66:	d1efd0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0202f6a <tlb_invalidate>:
ffffffffc0202f6a:	12058073          	sfence.vma	a1
ffffffffc0202f6e:	8082                	ret

ffffffffc0202f70 <pgdir_alloc_page>:
ffffffffc0202f70:	7179                	addi	sp,sp,-48
ffffffffc0202f72:	e84a                	sd	s2,16(sp)
ffffffffc0202f74:	892a                	mv	s2,a0
ffffffffc0202f76:	4505                	li	a0,1
ffffffffc0202f78:	f022                	sd	s0,32(sp)
ffffffffc0202f7a:	ec26                	sd	s1,24(sp)
ffffffffc0202f7c:	e44e                	sd	s3,8(sp)
ffffffffc0202f7e:	f406                	sd	ra,40(sp)
ffffffffc0202f80:	84ae                	mv	s1,a1
ffffffffc0202f82:	89b2                	mv	s3,a2
ffffffffc0202f84:	dc1fe0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0202f88:	842a                	mv	s0,a0
ffffffffc0202f8a:	cd1d                	beqz	a0,ffffffffc0202fc8 <pgdir_alloc_page+0x58>
ffffffffc0202f8c:	85aa                	mv	a1,a0
ffffffffc0202f8e:	86ce                	mv	a3,s3
ffffffffc0202f90:	8626                	mv	a2,s1
ffffffffc0202f92:	854a                	mv	a0,s2
ffffffffc0202f94:	b74ff0ef          	jal	ra,ffffffffc0202308 <page_insert>
ffffffffc0202f98:	e121                	bnez	a0,ffffffffc0202fd8 <pgdir_alloc_page+0x68>
ffffffffc0202f9a:	0003a797          	auipc	a5,0x3a
ffffffffc0202f9e:	ed678793          	addi	a5,a5,-298 # ffffffffc023ce70 <swap_init_ok>
ffffffffc0202fa2:	439c                	lw	a5,0(a5)
ffffffffc0202fa4:	2781                	sext.w	a5,a5
ffffffffc0202fa6:	c38d                	beqz	a5,ffffffffc0202fc8 <pgdir_alloc_page+0x58>
ffffffffc0202fa8:	0003a797          	auipc	a5,0x3a
ffffffffc0202fac:	01878793          	addi	a5,a5,24 # ffffffffc023cfc0 <check_mm_struct>
ffffffffc0202fb0:	6388                	ld	a0,0(a5)
ffffffffc0202fb2:	c919                	beqz	a0,ffffffffc0202fc8 <pgdir_alloc_page+0x58>
ffffffffc0202fb4:	4681                	li	a3,0
ffffffffc0202fb6:	8622                	mv	a2,s0
ffffffffc0202fb8:	85a6                	mv	a1,s1
ffffffffc0202fba:	732000ef          	jal	ra,ffffffffc02036ec <swap_map_swappable>
ffffffffc0202fbe:	4018                	lw	a4,0(s0)
ffffffffc0202fc0:	fc04                	sd	s1,56(s0)
ffffffffc0202fc2:	4785                	li	a5,1
ffffffffc0202fc4:	02f71063          	bne	a4,a5,ffffffffc0202fe4 <pgdir_alloc_page+0x74>
ffffffffc0202fc8:	8522                	mv	a0,s0
ffffffffc0202fca:	70a2                	ld	ra,40(sp)
ffffffffc0202fcc:	7402                	ld	s0,32(sp)
ffffffffc0202fce:	64e2                	ld	s1,24(sp)
ffffffffc0202fd0:	6942                	ld	s2,16(sp)
ffffffffc0202fd2:	69a2                	ld	s3,8(sp)
ffffffffc0202fd4:	6145                	addi	sp,sp,48
ffffffffc0202fd6:	8082                	ret
ffffffffc0202fd8:	8522                	mv	a0,s0
ffffffffc0202fda:	4585                	li	a1,1
ffffffffc0202fdc:	df1fe0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0202fe0:	4401                	li	s0,0
ffffffffc0202fe2:	b7dd                	j	ffffffffc0202fc8 <pgdir_alloc_page+0x58>
ffffffffc0202fe4:	00007697          	auipc	a3,0x7
ffffffffc0202fe8:	b6468693          	addi	a3,a3,-1180 # ffffffffc0209b48 <default_pmm_manager+0x180>
ffffffffc0202fec:	00006617          	auipc	a2,0x6
ffffffffc0202ff0:	29460613          	addi	a2,a2,660 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0202ff4:	1d800593          	li	a1,472
ffffffffc0202ff8:	00007517          	auipc	a0,0x7
ffffffffc0202ffc:	b4050513          	addi	a0,a0,-1216 # ffffffffc0209b38 <default_pmm_manager+0x170>
ffffffffc0203000:	c84fd0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203004 <swap_init>:
ffffffffc0203004:	7135                	addi	sp,sp,-160
ffffffffc0203006:	ed06                	sd	ra,152(sp)
ffffffffc0203008:	e922                	sd	s0,144(sp)
ffffffffc020300a:	e526                	sd	s1,136(sp)
ffffffffc020300c:	e14a                	sd	s2,128(sp)
ffffffffc020300e:	fcce                	sd	s3,120(sp)
ffffffffc0203010:	f8d2                	sd	s4,112(sp)
ffffffffc0203012:	f4d6                	sd	s5,104(sp)
ffffffffc0203014:	f0da                	sd	s6,96(sp)
ffffffffc0203016:	ecde                	sd	s7,88(sp)
ffffffffc0203018:	e8e2                	sd	s8,80(sp)
ffffffffc020301a:	e4e6                	sd	s9,72(sp)
ffffffffc020301c:	e0ea                	sd	s10,64(sp)
ffffffffc020301e:	fc6e                	sd	s11,56(sp)
ffffffffc0203020:	680010ef          	jal	ra,ffffffffc02046a0 <swapfs_init>
ffffffffc0203024:	0003a797          	auipc	a5,0x3a
ffffffffc0203028:	f4c78793          	addi	a5,a5,-180 # ffffffffc023cf70 <max_swap_offset>
ffffffffc020302c:	6394                	ld	a3,0(a5)
ffffffffc020302e:	010007b7          	lui	a5,0x1000
ffffffffc0203032:	17e1                	addi	a5,a5,-8
ffffffffc0203034:	ff968713          	addi	a4,a3,-7
ffffffffc0203038:	46e7e663          	bltu	a5,a4,ffffffffc02034a4 <swap_init+0x4a0>
ffffffffc020303c:	0002f797          	auipc	a5,0x2f
ffffffffc0203040:	95c78793          	addi	a5,a5,-1700 # ffffffffc0231998 <swap_manager_fifo>
ffffffffc0203044:	6798                	ld	a4,8(a5)
ffffffffc0203046:	0003a697          	auipc	a3,0x3a
ffffffffc020304a:	e2f6b123          	sd	a5,-478(a3) # ffffffffc023ce68 <sm>
ffffffffc020304e:	9702                	jalr	a4
ffffffffc0203050:	8b2a                	mv	s6,a0
ffffffffc0203052:	c10d                	beqz	a0,ffffffffc0203074 <swap_init+0x70>
ffffffffc0203054:	60ea                	ld	ra,152(sp)
ffffffffc0203056:	644a                	ld	s0,144(sp)
ffffffffc0203058:	855a                	mv	a0,s6
ffffffffc020305a:	64aa                	ld	s1,136(sp)
ffffffffc020305c:	690a                	ld	s2,128(sp)
ffffffffc020305e:	79e6                	ld	s3,120(sp)
ffffffffc0203060:	7a46                	ld	s4,112(sp)
ffffffffc0203062:	7aa6                	ld	s5,104(sp)
ffffffffc0203064:	7b06                	ld	s6,96(sp)
ffffffffc0203066:	6be6                	ld	s7,88(sp)
ffffffffc0203068:	6c46                	ld	s8,80(sp)
ffffffffc020306a:	6ca6                	ld	s9,72(sp)
ffffffffc020306c:	6d06                	ld	s10,64(sp)
ffffffffc020306e:	7de2                	ld	s11,56(sp)
ffffffffc0203070:	610d                	addi	sp,sp,160
ffffffffc0203072:	8082                	ret
ffffffffc0203074:	0003a797          	auipc	a5,0x3a
ffffffffc0203078:	df478793          	addi	a5,a5,-524 # ffffffffc023ce68 <sm>
ffffffffc020307c:	639c                	ld	a5,0(a5)
ffffffffc020307e:	00007517          	auipc	a0,0x7
ffffffffc0203082:	0da50513          	addi	a0,a0,218 # ffffffffc020a158 <default_pmm_manager+0x790>
ffffffffc0203086:	0003a417          	auipc	s0,0x3a
ffffffffc020308a:	e2a40413          	addi	s0,s0,-470 # ffffffffc023ceb0 <free_area>
ffffffffc020308e:	638c                	ld	a1,0(a5)
ffffffffc0203090:	4785                	li	a5,1
ffffffffc0203092:	0003a717          	auipc	a4,0x3a
ffffffffc0203096:	dcf72f23          	sw	a5,-546(a4) # ffffffffc023ce70 <swap_init_ok>
ffffffffc020309a:	8f8fd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020309e:	641c                	ld	a5,8(s0)
ffffffffc02030a0:	32878663          	beq	a5,s0,ffffffffc02033cc <swap_init+0x3c8>
ffffffffc02030a4:	ff07b703          	ld	a4,-16(a5)
ffffffffc02030a8:	8305                	srli	a4,a4,0x1
ffffffffc02030aa:	8b05                	andi	a4,a4,1
ffffffffc02030ac:	32070463          	beqz	a4,ffffffffc02033d4 <swap_init+0x3d0>
ffffffffc02030b0:	4481                	li	s1,0
ffffffffc02030b2:	4901                	li	s2,0
ffffffffc02030b4:	a031                	j	ffffffffc02030c0 <swap_init+0xbc>
ffffffffc02030b6:	ff07b703          	ld	a4,-16(a5)
ffffffffc02030ba:	8b09                	andi	a4,a4,2
ffffffffc02030bc:	30070c63          	beqz	a4,ffffffffc02033d4 <swap_init+0x3d0>
ffffffffc02030c0:	ff87a703          	lw	a4,-8(a5)
ffffffffc02030c4:	679c                	ld	a5,8(a5)
ffffffffc02030c6:	2905                	addiw	s2,s2,1
ffffffffc02030c8:	9cb9                	addw	s1,s1,a4
ffffffffc02030ca:	fe8796e3          	bne	a5,s0,ffffffffc02030b6 <swap_init+0xb2>
ffffffffc02030ce:	89a6                	mv	s3,s1
ffffffffc02030d0:	d43fe0ef          	jal	ra,ffffffffc0201e12 <nr_free_pages>
ffffffffc02030d4:	5f351463          	bne	a0,s3,ffffffffc02036bc <swap_init+0x6b8>
ffffffffc02030d8:	8626                	mv	a2,s1
ffffffffc02030da:	85ca                	mv	a1,s2
ffffffffc02030dc:	00007517          	auipc	a0,0x7
ffffffffc02030e0:	09450513          	addi	a0,a0,148 # ffffffffc020a170 <default_pmm_manager+0x7a8>
ffffffffc02030e4:	8aefd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02030e8:	3af000ef          	jal	ra,ffffffffc0203c96 <mm_create>
ffffffffc02030ec:	8c2a                	mv	s8,a0
ffffffffc02030ee:	54050763          	beqz	a0,ffffffffc020363c <swap_init+0x638>
ffffffffc02030f2:	0003a797          	auipc	a5,0x3a
ffffffffc02030f6:	ece78793          	addi	a5,a5,-306 # ffffffffc023cfc0 <check_mm_struct>
ffffffffc02030fa:	639c                	ld	a5,0(a5)
ffffffffc02030fc:	56079063          	bnez	a5,ffffffffc020365c <swap_init+0x658>
ffffffffc0203100:	0003a797          	auipc	a5,0x3a
ffffffffc0203104:	d5878793          	addi	a5,a5,-680 # ffffffffc023ce58 <boot_pgdir>
ffffffffc0203108:	0007bb83          	ld	s7,0(a5)
ffffffffc020310c:	0003a797          	auipc	a5,0x3a
ffffffffc0203110:	eaa7ba23          	sd	a0,-332(a5) # ffffffffc023cfc0 <check_mm_struct>
ffffffffc0203114:	000bb783          	ld	a5,0(s7)
ffffffffc0203118:	01753c23          	sd	s7,24(a0)
ffffffffc020311c:	56079063          	bnez	a5,ffffffffc020367c <swap_init+0x678>
ffffffffc0203120:	6599                	lui	a1,0x6
ffffffffc0203122:	460d                	li	a2,3
ffffffffc0203124:	6505                	lui	a0,0x1
ffffffffc0203126:	3bd000ef          	jal	ra,ffffffffc0203ce2 <vma_create>
ffffffffc020312a:	85aa                	mv	a1,a0
ffffffffc020312c:	56050863          	beqz	a0,ffffffffc020369c <swap_init+0x698>
ffffffffc0203130:	8562                	mv	a0,s8
ffffffffc0203132:	41d000ef          	jal	ra,ffffffffc0203d4e <insert_vma_struct>
ffffffffc0203136:	00007517          	auipc	a0,0x7
ffffffffc020313a:	0aa50513          	addi	a0,a0,170 # ffffffffc020a1e0 <default_pmm_manager+0x818>
ffffffffc020313e:	854fd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203142:	018c3503          	ld	a0,24(s8)
ffffffffc0203146:	4605                	li	a2,1
ffffffffc0203148:	6585                	lui	a1,0x1
ffffffffc020314a:	d09fe0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc020314e:	44050763          	beqz	a0,ffffffffc020359c <swap_init+0x598>
ffffffffc0203152:	00007517          	auipc	a0,0x7
ffffffffc0203156:	0de50513          	addi	a0,a0,222 # ffffffffc020a230 <default_pmm_manager+0x868>
ffffffffc020315a:	0003aa17          	auipc	s4,0x3a
ffffffffc020315e:	d8ea0a13          	addi	s4,s4,-626 # ffffffffc023cee8 <check_rp>
ffffffffc0203162:	830fd0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203166:	0003aa97          	auipc	s5,0x3a
ffffffffc020316a:	da2a8a93          	addi	s5,s5,-606 # ffffffffc023cf08 <swap_in_seq_no>
ffffffffc020316e:	89d2                	mv	s3,s4
ffffffffc0203170:	4505                	li	a0,1
ffffffffc0203172:	bd3fe0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0203176:	00a9b023          	sd	a0,0(s3) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc020317a:	2e050563          	beqz	a0,ffffffffc0203464 <swap_init+0x460>
ffffffffc020317e:	651c                	ld	a5,8(a0)
ffffffffc0203180:	8b89                	andi	a5,a5,2
ffffffffc0203182:	2c079163          	bnez	a5,ffffffffc0203444 <swap_init+0x440>
ffffffffc0203186:	09a1                	addi	s3,s3,8
ffffffffc0203188:	ff5994e3          	bne	s3,s5,ffffffffc0203170 <swap_init+0x16c>
ffffffffc020318c:	601c                	ld	a5,0(s0)
ffffffffc020318e:	00843983          	ld	s3,8(s0)
ffffffffc0203192:	0003ad17          	auipc	s10,0x3a
ffffffffc0203196:	d56d0d13          	addi	s10,s10,-682 # ffffffffc023cee8 <check_rp>
ffffffffc020319a:	f03e                	sd	a5,32(sp)
ffffffffc020319c:	481c                	lw	a5,16(s0)
ffffffffc020319e:	f43e                	sd	a5,40(sp)
ffffffffc02031a0:	0003a797          	auipc	a5,0x3a
ffffffffc02031a4:	d087bc23          	sd	s0,-744(a5) # ffffffffc023ceb8 <free_area+0x8>
ffffffffc02031a8:	0003a797          	auipc	a5,0x3a
ffffffffc02031ac:	d087b423          	sd	s0,-760(a5) # ffffffffc023ceb0 <free_area>
ffffffffc02031b0:	0003a797          	auipc	a5,0x3a
ffffffffc02031b4:	d007a823          	sw	zero,-752(a5) # ffffffffc023cec0 <free_area+0x10>
ffffffffc02031b8:	000d3503          	ld	a0,0(s10)
ffffffffc02031bc:	4585                	li	a1,1
ffffffffc02031be:	0d21                	addi	s10,s10,8
ffffffffc02031c0:	c0dfe0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc02031c4:	ff5d1ae3          	bne	s10,s5,ffffffffc02031b8 <swap_init+0x1b4>
ffffffffc02031c8:	01042d03          	lw	s10,16(s0)
ffffffffc02031cc:	4791                	li	a5,4
ffffffffc02031ce:	3afd1763          	bne	s10,a5,ffffffffc020357c <swap_init+0x578>
ffffffffc02031d2:	00007517          	auipc	a0,0x7
ffffffffc02031d6:	0e650513          	addi	a0,a0,230 # ffffffffc020a2b8 <default_pmm_manager+0x8f0>
ffffffffc02031da:	fb9fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02031de:	6685                	lui	a3,0x1
ffffffffc02031e0:	0003a797          	auipc	a5,0x3a
ffffffffc02031e4:	c807aa23          	sw	zero,-876(a5) # ffffffffc023ce74 <pgfault_num>
ffffffffc02031e8:	4629                	li	a2,10
ffffffffc02031ea:	0003a797          	auipc	a5,0x3a
ffffffffc02031ee:	c8a78793          	addi	a5,a5,-886 # ffffffffc023ce74 <pgfault_num>
ffffffffc02031f2:	00c68023          	sb	a2,0(a3) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc02031f6:	4398                	lw	a4,0(a5)
ffffffffc02031f8:	4585                	li	a1,1
ffffffffc02031fa:	2701                	sext.w	a4,a4
ffffffffc02031fc:	34b71063          	bne	a4,a1,ffffffffc020353c <swap_init+0x538>
ffffffffc0203200:	00c68823          	sb	a2,16(a3)
ffffffffc0203204:	4394                	lw	a3,0(a5)
ffffffffc0203206:	2681                	sext.w	a3,a3
ffffffffc0203208:	34e69a63          	bne	a3,a4,ffffffffc020355c <swap_init+0x558>
ffffffffc020320c:	6689                	lui	a3,0x2
ffffffffc020320e:	462d                	li	a2,11
ffffffffc0203210:	00c68023          	sb	a2,0(a3) # 2000 <_binary_obj___user_forktree_out_size>
ffffffffc0203214:	4398                	lw	a4,0(a5)
ffffffffc0203216:	4589                	li	a1,2
ffffffffc0203218:	2701                	sext.w	a4,a4
ffffffffc020321a:	2ab71163          	bne	a4,a1,ffffffffc02034bc <swap_init+0x4b8>
ffffffffc020321e:	00c68823          	sb	a2,16(a3)
ffffffffc0203222:	4394                	lw	a3,0(a5)
ffffffffc0203224:	2681                	sext.w	a3,a3
ffffffffc0203226:	2ae69b63          	bne	a3,a4,ffffffffc02034dc <swap_init+0x4d8>
ffffffffc020322a:	668d                	lui	a3,0x3
ffffffffc020322c:	4631                	li	a2,12
ffffffffc020322e:	00c68023          	sb	a2,0(a3) # 3000 <_binary_obj___user_matrix_out_size+0x6c8>
ffffffffc0203232:	4398                	lw	a4,0(a5)
ffffffffc0203234:	458d                	li	a1,3
ffffffffc0203236:	2701                	sext.w	a4,a4
ffffffffc0203238:	2cb71263          	bne	a4,a1,ffffffffc02034fc <swap_init+0x4f8>
ffffffffc020323c:	00c68823          	sb	a2,16(a3)
ffffffffc0203240:	4394                	lw	a3,0(a5)
ffffffffc0203242:	2681                	sext.w	a3,a3
ffffffffc0203244:	2ce69c63          	bne	a3,a4,ffffffffc020351c <swap_init+0x518>
ffffffffc0203248:	6691                	lui	a3,0x4
ffffffffc020324a:	4635                	li	a2,13
ffffffffc020324c:	00c68023          	sb	a2,0(a3) # 4000 <_binary_obj___user_matrix_out_size+0x16c8>
ffffffffc0203250:	4398                	lw	a4,0(a5)
ffffffffc0203252:	2701                	sext.w	a4,a4
ffffffffc0203254:	37a71463          	bne	a4,s10,ffffffffc02035bc <swap_init+0x5b8>
ffffffffc0203258:	00c68823          	sb	a2,16(a3)
ffffffffc020325c:	439c                	lw	a5,0(a5)
ffffffffc020325e:	2781                	sext.w	a5,a5
ffffffffc0203260:	36e79e63          	bne	a5,a4,ffffffffc02035dc <swap_init+0x5d8>
ffffffffc0203264:	481c                	lw	a5,16(s0)
ffffffffc0203266:	38079b63          	bnez	a5,ffffffffc02035fc <swap_init+0x5f8>
ffffffffc020326a:	0003a797          	auipc	a5,0x3a
ffffffffc020326e:	c9e78793          	addi	a5,a5,-866 # ffffffffc023cf08 <swap_in_seq_no>
ffffffffc0203272:	0003a717          	auipc	a4,0x3a
ffffffffc0203276:	cbe70713          	addi	a4,a4,-834 # ffffffffc023cf30 <swap_out_seq_no>
ffffffffc020327a:	0003a617          	auipc	a2,0x3a
ffffffffc020327e:	cb660613          	addi	a2,a2,-842 # ffffffffc023cf30 <swap_out_seq_no>
ffffffffc0203282:	56fd                	li	a3,-1
ffffffffc0203284:	c394                	sw	a3,0(a5)
ffffffffc0203286:	c314                	sw	a3,0(a4)
ffffffffc0203288:	0791                	addi	a5,a5,4
ffffffffc020328a:	0711                	addi	a4,a4,4
ffffffffc020328c:	fec79ce3          	bne	a5,a2,ffffffffc0203284 <swap_init+0x280>
ffffffffc0203290:	0003a697          	auipc	a3,0x3a
ffffffffc0203294:	d0068693          	addi	a3,a3,-768 # ffffffffc023cf90 <check_ptep>
ffffffffc0203298:	0003a817          	auipc	a6,0x3a
ffffffffc020329c:	c5080813          	addi	a6,a6,-944 # ffffffffc023cee8 <check_rp>
ffffffffc02032a0:	6705                	lui	a4,0x1
ffffffffc02032a2:	0003ad97          	auipc	s11,0x3a
ffffffffc02032a6:	bbed8d93          	addi	s11,s11,-1090 # ffffffffc023ce60 <npage>
ffffffffc02032aa:	00009c97          	auipc	s9,0x9
ffffffffc02032ae:	806c8c93          	addi	s9,s9,-2042 # ffffffffc020bab0 <nbase>
ffffffffc02032b2:	0003ad17          	auipc	s10,0x3a
ffffffffc02032b6:	c2ed0d13          	addi	s10,s10,-978 # ffffffffc023cee0 <pages>
ffffffffc02032ba:	85ba                	mv	a1,a4
ffffffffc02032bc:	0006b023          	sd	zero,0(a3)
ffffffffc02032c0:	4601                	li	a2,0
ffffffffc02032c2:	855e                	mv	a0,s7
ffffffffc02032c4:	ec42                	sd	a6,24(sp)
ffffffffc02032c6:	e83a                	sd	a4,16(sp)
ffffffffc02032c8:	e436                	sd	a3,8(sp)
ffffffffc02032ca:	b89fe0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc02032ce:	66a2                	ld	a3,8(sp)
ffffffffc02032d0:	6742                	ld	a4,16(sp)
ffffffffc02032d2:	6862                	ld	a6,24(sp)
ffffffffc02032d4:	e288                	sd	a0,0(a3)
ffffffffc02032d6:	1a050763          	beqz	a0,ffffffffc0203484 <swap_init+0x480>
ffffffffc02032da:	611c                	ld	a5,0(a0)
ffffffffc02032dc:	0017f613          	andi	a2,a5,1
ffffffffc02032e0:	14060663          	beqz	a2,ffffffffc020342c <swap_init+0x428>
ffffffffc02032e4:	000db603          	ld	a2,0(s11)
ffffffffc02032e8:	078a                	slli	a5,a5,0x2
ffffffffc02032ea:	83b1                	srli	a5,a5,0xc
ffffffffc02032ec:	10c7f463          	bgeu	a5,a2,ffffffffc02033f4 <swap_init+0x3f0>
ffffffffc02032f0:	000cb603          	ld	a2,0(s9)
ffffffffc02032f4:	00083583          	ld	a1,0(a6)
ffffffffc02032f8:	8532                	mv	a0,a2
ffffffffc02032fa:	e432                	sd	a2,8(sp)
ffffffffc02032fc:	000d3603          	ld	a2,0(s10)
ffffffffc0203300:	8f89                	sub	a5,a5,a0
ffffffffc0203302:	079a                	slli	a5,a5,0x6
ffffffffc0203304:	97b2                	add	a5,a5,a2
ffffffffc0203306:	10f59363          	bne	a1,a5,ffffffffc020340c <swap_init+0x408>
ffffffffc020330a:	6785                	lui	a5,0x1
ffffffffc020330c:	973e                	add	a4,a4,a5
ffffffffc020330e:	6795                	lui	a5,0x5
ffffffffc0203310:	06a1                	addi	a3,a3,8
ffffffffc0203312:	0821                	addi	a6,a6,8
ffffffffc0203314:	faf713e3          	bne	a4,a5,ffffffffc02032ba <swap_init+0x2b6>
ffffffffc0203318:	00007517          	auipc	a0,0x7
ffffffffc020331c:	04850513          	addi	a0,a0,72 # ffffffffc020a360 <default_pmm_manager+0x998>
ffffffffc0203320:	e73fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203324:	0003a797          	auipc	a5,0x3a
ffffffffc0203328:	b4478793          	addi	a5,a5,-1212 # ffffffffc023ce68 <sm>
ffffffffc020332c:	639c                	ld	a5,0(a5)
ffffffffc020332e:	7f9c                	ld	a5,56(a5)
ffffffffc0203330:	9782                	jalr	a5
ffffffffc0203332:	2e051563          	bnez	a0,ffffffffc020361c <swap_init+0x618>
ffffffffc0203336:	000a3503          	ld	a0,0(s4)
ffffffffc020333a:	4585                	li	a1,1
ffffffffc020333c:	0a21                	addi	s4,s4,8
ffffffffc020333e:	a8ffe0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0203342:	ff5a1ae3          	bne	s4,s5,ffffffffc0203336 <swap_init+0x332>
ffffffffc0203346:	000bb783          	ld	a5,0(s7)
ffffffffc020334a:	000db703          	ld	a4,0(s11)
ffffffffc020334e:	078a                	slli	a5,a5,0x2
ffffffffc0203350:	83b1                	srli	a5,a5,0xc
ffffffffc0203352:	0ae7f163          	bgeu	a5,a4,ffffffffc02033f4 <swap_init+0x3f0>
ffffffffc0203356:	6722                	ld	a4,8(sp)
ffffffffc0203358:	000d3503          	ld	a0,0(s10)
ffffffffc020335c:	4585                	li	a1,1
ffffffffc020335e:	8f99                	sub	a5,a5,a4
ffffffffc0203360:	079a                	slli	a5,a5,0x6
ffffffffc0203362:	953e                	add	a0,a0,a5
ffffffffc0203364:	a69fe0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0203368:	000bb023          	sd	zero,0(s7)
ffffffffc020336c:	000c3c23          	sd	zero,24(s8)
ffffffffc0203370:	8562                	mv	a0,s8
ffffffffc0203372:	2ab000ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc0203376:	0003a797          	auipc	a5,0x3a
ffffffffc020337a:	c407b523          	sd	zero,-950(a5) # ffffffffc023cfc0 <check_mm_struct>
ffffffffc020337e:	77a2                	ld	a5,40(sp)
ffffffffc0203380:	0003a717          	auipc	a4,0x3a
ffffffffc0203384:	b4f72023          	sw	a5,-1216(a4) # ffffffffc023cec0 <free_area+0x10>
ffffffffc0203388:	7782                	ld	a5,32(sp)
ffffffffc020338a:	0003a717          	auipc	a4,0x3a
ffffffffc020338e:	b2f73323          	sd	a5,-1242(a4) # ffffffffc023ceb0 <free_area>
ffffffffc0203392:	0003a797          	auipc	a5,0x3a
ffffffffc0203396:	b337b323          	sd	s3,-1242(a5) # ffffffffc023ceb8 <free_area+0x8>
ffffffffc020339a:	00898a63          	beq	s3,s0,ffffffffc02033ae <swap_init+0x3aa>
ffffffffc020339e:	ff89a783          	lw	a5,-8(s3)
ffffffffc02033a2:	0089b983          	ld	s3,8(s3)
ffffffffc02033a6:	397d                	addiw	s2,s2,-1
ffffffffc02033a8:	9c9d                	subw	s1,s1,a5
ffffffffc02033aa:	fe899ae3          	bne	s3,s0,ffffffffc020339e <swap_init+0x39a>
ffffffffc02033ae:	8626                	mv	a2,s1
ffffffffc02033b0:	85ca                	mv	a1,s2
ffffffffc02033b2:	00007517          	auipc	a0,0x7
ffffffffc02033b6:	fde50513          	addi	a0,a0,-34 # ffffffffc020a390 <default_pmm_manager+0x9c8>
ffffffffc02033ba:	dd9fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02033be:	00007517          	auipc	a0,0x7
ffffffffc02033c2:	ff250513          	addi	a0,a0,-14 # ffffffffc020a3b0 <default_pmm_manager+0x9e8>
ffffffffc02033c6:	dcdfc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02033ca:	b169                	j	ffffffffc0203054 <swap_init+0x50>
ffffffffc02033cc:	4481                	li	s1,0
ffffffffc02033ce:	4901                	li	s2,0
ffffffffc02033d0:	4981                	li	s3,0
ffffffffc02033d2:	b9fd                	j	ffffffffc02030d0 <swap_init+0xcc>
ffffffffc02033d4:	00006697          	auipc	a3,0x6
ffffffffc02033d8:	26468693          	addi	a3,a3,612 # ffffffffc0209638 <commands+0x878>
ffffffffc02033dc:	00006617          	auipc	a2,0x6
ffffffffc02033e0:	ea460613          	addi	a2,a2,-348 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02033e4:	0bc00593          	li	a1,188
ffffffffc02033e8:	00007517          	auipc	a0,0x7
ffffffffc02033ec:	d6050513          	addi	a0,a0,-672 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02033f0:	894fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02033f4:	00006617          	auipc	a2,0x6
ffffffffc02033f8:	68460613          	addi	a2,a2,1668 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc02033fc:	06200593          	li	a1,98
ffffffffc0203400:	00006517          	auipc	a0,0x6
ffffffffc0203404:	64050513          	addi	a0,a0,1600 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0203408:	87cfd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020340c:	00007697          	auipc	a3,0x7
ffffffffc0203410:	f2c68693          	addi	a3,a3,-212 # ffffffffc020a338 <default_pmm_manager+0x970>
ffffffffc0203414:	00006617          	auipc	a2,0x6
ffffffffc0203418:	e6c60613          	addi	a2,a2,-404 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020341c:	0fc00593          	li	a1,252
ffffffffc0203420:	00007517          	auipc	a0,0x7
ffffffffc0203424:	d2850513          	addi	a0,a0,-728 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203428:	85cfd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020342c:	00007617          	auipc	a2,0x7
ffffffffc0203430:	8a460613          	addi	a2,a2,-1884 # ffffffffc0209cd0 <default_pmm_manager+0x308>
ffffffffc0203434:	07400593          	li	a1,116
ffffffffc0203438:	00006517          	auipc	a0,0x6
ffffffffc020343c:	60850513          	addi	a0,a0,1544 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0203440:	844fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203444:	00007697          	auipc	a3,0x7
ffffffffc0203448:	e2c68693          	addi	a3,a3,-468 # ffffffffc020a270 <default_pmm_manager+0x8a8>
ffffffffc020344c:	00006617          	auipc	a2,0x6
ffffffffc0203450:	e3460613          	addi	a2,a2,-460 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203454:	0dd00593          	li	a1,221
ffffffffc0203458:	00007517          	auipc	a0,0x7
ffffffffc020345c:	cf050513          	addi	a0,a0,-784 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203460:	824fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203464:	00007697          	auipc	a3,0x7
ffffffffc0203468:	df468693          	addi	a3,a3,-524 # ffffffffc020a258 <default_pmm_manager+0x890>
ffffffffc020346c:	00006617          	auipc	a2,0x6
ffffffffc0203470:	e1460613          	addi	a2,a2,-492 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203474:	0dc00593          	li	a1,220
ffffffffc0203478:	00007517          	auipc	a0,0x7
ffffffffc020347c:	cd050513          	addi	a0,a0,-816 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203480:	804fd0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203484:	00007697          	auipc	a3,0x7
ffffffffc0203488:	e9c68693          	addi	a3,a3,-356 # ffffffffc020a320 <default_pmm_manager+0x958>
ffffffffc020348c:	00006617          	auipc	a2,0x6
ffffffffc0203490:	df460613          	addi	a2,a2,-524 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203494:	0fb00593          	li	a1,251
ffffffffc0203498:	00007517          	auipc	a0,0x7
ffffffffc020349c:	cb050513          	addi	a0,a0,-848 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02034a0:	fe5fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02034a4:	00007617          	auipc	a2,0x7
ffffffffc02034a8:	c8460613          	addi	a2,a2,-892 # ffffffffc020a128 <default_pmm_manager+0x760>
ffffffffc02034ac:	02800593          	li	a1,40
ffffffffc02034b0:	00007517          	auipc	a0,0x7
ffffffffc02034b4:	c9850513          	addi	a0,a0,-872 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02034b8:	fcdfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02034bc:	00007697          	auipc	a3,0x7
ffffffffc02034c0:	e3468693          	addi	a3,a3,-460 # ffffffffc020a2f0 <default_pmm_manager+0x928>
ffffffffc02034c4:	00006617          	auipc	a2,0x6
ffffffffc02034c8:	dbc60613          	addi	a2,a2,-580 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02034cc:	09700593          	li	a1,151
ffffffffc02034d0:	00007517          	auipc	a0,0x7
ffffffffc02034d4:	c7850513          	addi	a0,a0,-904 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02034d8:	fadfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02034dc:	00007697          	auipc	a3,0x7
ffffffffc02034e0:	e1468693          	addi	a3,a3,-492 # ffffffffc020a2f0 <default_pmm_manager+0x928>
ffffffffc02034e4:	00006617          	auipc	a2,0x6
ffffffffc02034e8:	d9c60613          	addi	a2,a2,-612 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02034ec:	09900593          	li	a1,153
ffffffffc02034f0:	00007517          	auipc	a0,0x7
ffffffffc02034f4:	c5850513          	addi	a0,a0,-936 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02034f8:	f8dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02034fc:	00007697          	auipc	a3,0x7
ffffffffc0203500:	e0468693          	addi	a3,a3,-508 # ffffffffc020a300 <default_pmm_manager+0x938>
ffffffffc0203504:	00006617          	auipc	a2,0x6
ffffffffc0203508:	d7c60613          	addi	a2,a2,-644 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020350c:	09b00593          	li	a1,155
ffffffffc0203510:	00007517          	auipc	a0,0x7
ffffffffc0203514:	c3850513          	addi	a0,a0,-968 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203518:	f6dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020351c:	00007697          	auipc	a3,0x7
ffffffffc0203520:	de468693          	addi	a3,a3,-540 # ffffffffc020a300 <default_pmm_manager+0x938>
ffffffffc0203524:	00006617          	auipc	a2,0x6
ffffffffc0203528:	d5c60613          	addi	a2,a2,-676 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020352c:	09d00593          	li	a1,157
ffffffffc0203530:	00007517          	auipc	a0,0x7
ffffffffc0203534:	c1850513          	addi	a0,a0,-1000 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203538:	f4dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020353c:	00007697          	auipc	a3,0x7
ffffffffc0203540:	da468693          	addi	a3,a3,-604 # ffffffffc020a2e0 <default_pmm_manager+0x918>
ffffffffc0203544:	00006617          	auipc	a2,0x6
ffffffffc0203548:	d3c60613          	addi	a2,a2,-708 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020354c:	09300593          	li	a1,147
ffffffffc0203550:	00007517          	auipc	a0,0x7
ffffffffc0203554:	bf850513          	addi	a0,a0,-1032 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203558:	f2dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020355c:	00007697          	auipc	a3,0x7
ffffffffc0203560:	d8468693          	addi	a3,a3,-636 # ffffffffc020a2e0 <default_pmm_manager+0x918>
ffffffffc0203564:	00006617          	auipc	a2,0x6
ffffffffc0203568:	d1c60613          	addi	a2,a2,-740 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020356c:	09500593          	li	a1,149
ffffffffc0203570:	00007517          	auipc	a0,0x7
ffffffffc0203574:	bd850513          	addi	a0,a0,-1064 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203578:	f0dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020357c:	00007697          	auipc	a3,0x7
ffffffffc0203580:	d1468693          	addi	a3,a3,-748 # ffffffffc020a290 <default_pmm_manager+0x8c8>
ffffffffc0203584:	00006617          	auipc	a2,0x6
ffffffffc0203588:	cfc60613          	addi	a2,a2,-772 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020358c:	0ea00593          	li	a1,234
ffffffffc0203590:	00007517          	auipc	a0,0x7
ffffffffc0203594:	bb850513          	addi	a0,a0,-1096 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203598:	eedfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020359c:	00007697          	auipc	a3,0x7
ffffffffc02035a0:	c7c68693          	addi	a3,a3,-900 # ffffffffc020a218 <default_pmm_manager+0x850>
ffffffffc02035a4:	00006617          	auipc	a2,0x6
ffffffffc02035a8:	cdc60613          	addi	a2,a2,-804 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02035ac:	0d700593          	li	a1,215
ffffffffc02035b0:	00007517          	auipc	a0,0x7
ffffffffc02035b4:	b9850513          	addi	a0,a0,-1128 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02035b8:	ecdfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02035bc:	00007697          	auipc	a3,0x7
ffffffffc02035c0:	d5468693          	addi	a3,a3,-684 # ffffffffc020a310 <default_pmm_manager+0x948>
ffffffffc02035c4:	00006617          	auipc	a2,0x6
ffffffffc02035c8:	cbc60613          	addi	a2,a2,-836 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02035cc:	09f00593          	li	a1,159
ffffffffc02035d0:	00007517          	auipc	a0,0x7
ffffffffc02035d4:	b7850513          	addi	a0,a0,-1160 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02035d8:	eadfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02035dc:	00007697          	auipc	a3,0x7
ffffffffc02035e0:	d3468693          	addi	a3,a3,-716 # ffffffffc020a310 <default_pmm_manager+0x948>
ffffffffc02035e4:	00006617          	auipc	a2,0x6
ffffffffc02035e8:	c9c60613          	addi	a2,a2,-868 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02035ec:	0a100593          	li	a1,161
ffffffffc02035f0:	00007517          	auipc	a0,0x7
ffffffffc02035f4:	b5850513          	addi	a0,a0,-1192 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02035f8:	e8dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02035fc:	00006697          	auipc	a3,0x6
ffffffffc0203600:	20c68693          	addi	a3,a3,524 # ffffffffc0209808 <commands+0xa48>
ffffffffc0203604:	00006617          	auipc	a2,0x6
ffffffffc0203608:	c7c60613          	addi	a2,a2,-900 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020360c:	0f300593          	li	a1,243
ffffffffc0203610:	00007517          	auipc	a0,0x7
ffffffffc0203614:	b3850513          	addi	a0,a0,-1224 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203618:	e6dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020361c:	00007697          	auipc	a3,0x7
ffffffffc0203620:	d6c68693          	addi	a3,a3,-660 # ffffffffc020a388 <default_pmm_manager+0x9c0>
ffffffffc0203624:	00006617          	auipc	a2,0x6
ffffffffc0203628:	c5c60613          	addi	a2,a2,-932 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020362c:	10200593          	li	a1,258
ffffffffc0203630:	00007517          	auipc	a0,0x7
ffffffffc0203634:	b1850513          	addi	a0,a0,-1256 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203638:	e4dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020363c:	00007697          	auipc	a3,0x7
ffffffffc0203640:	b5c68693          	addi	a3,a3,-1188 # ffffffffc020a198 <default_pmm_manager+0x7d0>
ffffffffc0203644:	00006617          	auipc	a2,0x6
ffffffffc0203648:	c3c60613          	addi	a2,a2,-964 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020364c:	0c400593          	li	a1,196
ffffffffc0203650:	00007517          	auipc	a0,0x7
ffffffffc0203654:	af850513          	addi	a0,a0,-1288 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203658:	e2dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020365c:	00007697          	auipc	a3,0x7
ffffffffc0203660:	b4c68693          	addi	a3,a3,-1204 # ffffffffc020a1a8 <default_pmm_manager+0x7e0>
ffffffffc0203664:	00006617          	auipc	a2,0x6
ffffffffc0203668:	c1c60613          	addi	a2,a2,-996 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020366c:	0c700593          	li	a1,199
ffffffffc0203670:	00007517          	auipc	a0,0x7
ffffffffc0203674:	ad850513          	addi	a0,a0,-1320 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203678:	e0dfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020367c:	00007697          	auipc	a3,0x7
ffffffffc0203680:	b4468693          	addi	a3,a3,-1212 # ffffffffc020a1c0 <default_pmm_manager+0x7f8>
ffffffffc0203684:	00006617          	auipc	a2,0x6
ffffffffc0203688:	bfc60613          	addi	a2,a2,-1028 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020368c:	0cc00593          	li	a1,204
ffffffffc0203690:	00007517          	auipc	a0,0x7
ffffffffc0203694:	ab850513          	addi	a0,a0,-1352 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203698:	dedfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020369c:	00007697          	auipc	a3,0x7
ffffffffc02036a0:	b3468693          	addi	a3,a3,-1228 # ffffffffc020a1d0 <default_pmm_manager+0x808>
ffffffffc02036a4:	00006617          	auipc	a2,0x6
ffffffffc02036a8:	bdc60613          	addi	a2,a2,-1060 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02036ac:	0cf00593          	li	a1,207
ffffffffc02036b0:	00007517          	auipc	a0,0x7
ffffffffc02036b4:	a9850513          	addi	a0,a0,-1384 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02036b8:	dcdfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02036bc:	00006697          	auipc	a3,0x6
ffffffffc02036c0:	fa468693          	addi	a3,a3,-92 # ffffffffc0209660 <commands+0x8a0>
ffffffffc02036c4:	00006617          	auipc	a2,0x6
ffffffffc02036c8:	bbc60613          	addi	a2,a2,-1092 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02036cc:	0bf00593          	li	a1,191
ffffffffc02036d0:	00007517          	auipc	a0,0x7
ffffffffc02036d4:	a7850513          	addi	a0,a0,-1416 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc02036d8:	dadfc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02036dc <swap_init_mm>:
ffffffffc02036dc:	00039797          	auipc	a5,0x39
ffffffffc02036e0:	78c78793          	addi	a5,a5,1932 # ffffffffc023ce68 <sm>
ffffffffc02036e4:	639c                	ld	a5,0(a5)
ffffffffc02036e6:	0107b303          	ld	t1,16(a5)
ffffffffc02036ea:	8302                	jr	t1

ffffffffc02036ec <swap_map_swappable>:
ffffffffc02036ec:	00039797          	auipc	a5,0x39
ffffffffc02036f0:	77c78793          	addi	a5,a5,1916 # ffffffffc023ce68 <sm>
ffffffffc02036f4:	639c                	ld	a5,0(a5)
ffffffffc02036f6:	0207b303          	ld	t1,32(a5)
ffffffffc02036fa:	8302                	jr	t1

ffffffffc02036fc <swap_out>:
ffffffffc02036fc:	711d                	addi	sp,sp,-96
ffffffffc02036fe:	ec86                	sd	ra,88(sp)
ffffffffc0203700:	e8a2                	sd	s0,80(sp)
ffffffffc0203702:	e4a6                	sd	s1,72(sp)
ffffffffc0203704:	e0ca                	sd	s2,64(sp)
ffffffffc0203706:	fc4e                	sd	s3,56(sp)
ffffffffc0203708:	f852                	sd	s4,48(sp)
ffffffffc020370a:	f456                	sd	s5,40(sp)
ffffffffc020370c:	f05a                	sd	s6,32(sp)
ffffffffc020370e:	ec5e                	sd	s7,24(sp)
ffffffffc0203710:	e862                	sd	s8,16(sp)
ffffffffc0203712:	cde9                	beqz	a1,ffffffffc02037ec <swap_out+0xf0>
ffffffffc0203714:	8ab2                	mv	s5,a2
ffffffffc0203716:	892a                	mv	s2,a0
ffffffffc0203718:	8a2e                	mv	s4,a1
ffffffffc020371a:	4401                	li	s0,0
ffffffffc020371c:	00039997          	auipc	s3,0x39
ffffffffc0203720:	74c98993          	addi	s3,s3,1868 # ffffffffc023ce68 <sm>
ffffffffc0203724:	00007b17          	auipc	s6,0x7
ffffffffc0203728:	d0cb0b13          	addi	s6,s6,-756 # ffffffffc020a430 <default_pmm_manager+0xa68>
ffffffffc020372c:	00007b97          	auipc	s7,0x7
ffffffffc0203730:	cecb8b93          	addi	s7,s7,-788 # ffffffffc020a418 <default_pmm_manager+0xa50>
ffffffffc0203734:	a825                	j	ffffffffc020376c <swap_out+0x70>
ffffffffc0203736:	67a2                	ld	a5,8(sp)
ffffffffc0203738:	8626                	mv	a2,s1
ffffffffc020373a:	85a2                	mv	a1,s0
ffffffffc020373c:	7f94                	ld	a3,56(a5)
ffffffffc020373e:	855a                	mv	a0,s6
ffffffffc0203740:	2405                	addiw	s0,s0,1
ffffffffc0203742:	82b1                	srli	a3,a3,0xc
ffffffffc0203744:	0685                	addi	a3,a3,1
ffffffffc0203746:	a4dfc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020374a:	6522                	ld	a0,8(sp)
ffffffffc020374c:	4585                	li	a1,1
ffffffffc020374e:	7d1c                	ld	a5,56(a0)
ffffffffc0203750:	83b1                	srli	a5,a5,0xc
ffffffffc0203752:	0785                	addi	a5,a5,1
ffffffffc0203754:	07a2                	slli	a5,a5,0x8
ffffffffc0203756:	00fc3023          	sd	a5,0(s8)
ffffffffc020375a:	e72fe0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc020375e:	01893503          	ld	a0,24(s2)
ffffffffc0203762:	85a6                	mv	a1,s1
ffffffffc0203764:	807ff0ef          	jal	ra,ffffffffc0202f6a <tlb_invalidate>
ffffffffc0203768:	048a0d63          	beq	s4,s0,ffffffffc02037c2 <swap_out+0xc6>
ffffffffc020376c:	0009b783          	ld	a5,0(s3)
ffffffffc0203770:	8656                	mv	a2,s5
ffffffffc0203772:	002c                	addi	a1,sp,8
ffffffffc0203774:	7b9c                	ld	a5,48(a5)
ffffffffc0203776:	854a                	mv	a0,s2
ffffffffc0203778:	9782                	jalr	a5
ffffffffc020377a:	e12d                	bnez	a0,ffffffffc02037dc <swap_out+0xe0>
ffffffffc020377c:	67a2                	ld	a5,8(sp)
ffffffffc020377e:	01893503          	ld	a0,24(s2)
ffffffffc0203782:	4601                	li	a2,0
ffffffffc0203784:	7f84                	ld	s1,56(a5)
ffffffffc0203786:	85a6                	mv	a1,s1
ffffffffc0203788:	ecafe0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc020378c:	611c                	ld	a5,0(a0)
ffffffffc020378e:	8c2a                	mv	s8,a0
ffffffffc0203790:	8b85                	andi	a5,a5,1
ffffffffc0203792:	cfb9                	beqz	a5,ffffffffc02037f0 <swap_out+0xf4>
ffffffffc0203794:	65a2                	ld	a1,8(sp)
ffffffffc0203796:	7d9c                	ld	a5,56(a1)
ffffffffc0203798:	83b1                	srli	a5,a5,0xc
ffffffffc020379a:	00178513          	addi	a0,a5,1
ffffffffc020379e:	0522                	slli	a0,a0,0x8
ffffffffc02037a0:	7d1000ef          	jal	ra,ffffffffc0204770 <swapfs_write>
ffffffffc02037a4:	d949                	beqz	a0,ffffffffc0203736 <swap_out+0x3a>
ffffffffc02037a6:	855e                	mv	a0,s7
ffffffffc02037a8:	9ebfc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02037ac:	0009b783          	ld	a5,0(s3)
ffffffffc02037b0:	6622                	ld	a2,8(sp)
ffffffffc02037b2:	4681                	li	a3,0
ffffffffc02037b4:	739c                	ld	a5,32(a5)
ffffffffc02037b6:	85a6                	mv	a1,s1
ffffffffc02037b8:	854a                	mv	a0,s2
ffffffffc02037ba:	2405                	addiw	s0,s0,1
ffffffffc02037bc:	9782                	jalr	a5
ffffffffc02037be:	fa8a17e3          	bne	s4,s0,ffffffffc020376c <swap_out+0x70>
ffffffffc02037c2:	8522                	mv	a0,s0
ffffffffc02037c4:	60e6                	ld	ra,88(sp)
ffffffffc02037c6:	6446                	ld	s0,80(sp)
ffffffffc02037c8:	64a6                	ld	s1,72(sp)
ffffffffc02037ca:	6906                	ld	s2,64(sp)
ffffffffc02037cc:	79e2                	ld	s3,56(sp)
ffffffffc02037ce:	7a42                	ld	s4,48(sp)
ffffffffc02037d0:	7aa2                	ld	s5,40(sp)
ffffffffc02037d2:	7b02                	ld	s6,32(sp)
ffffffffc02037d4:	6be2                	ld	s7,24(sp)
ffffffffc02037d6:	6c42                	ld	s8,16(sp)
ffffffffc02037d8:	6125                	addi	sp,sp,96
ffffffffc02037da:	8082                	ret
ffffffffc02037dc:	85a2                	mv	a1,s0
ffffffffc02037de:	00007517          	auipc	a0,0x7
ffffffffc02037e2:	bf250513          	addi	a0,a0,-1038 # ffffffffc020a3d0 <default_pmm_manager+0xa08>
ffffffffc02037e6:	9adfc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02037ea:	bfe1                	j	ffffffffc02037c2 <swap_out+0xc6>
ffffffffc02037ec:	4401                	li	s0,0
ffffffffc02037ee:	bfd1                	j	ffffffffc02037c2 <swap_out+0xc6>
ffffffffc02037f0:	00007697          	auipc	a3,0x7
ffffffffc02037f4:	c1068693          	addi	a3,a3,-1008 # ffffffffc020a400 <default_pmm_manager+0xa38>
ffffffffc02037f8:	00006617          	auipc	a2,0x6
ffffffffc02037fc:	a8860613          	addi	a2,a2,-1400 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203800:	06800593          	li	a1,104
ffffffffc0203804:	00007517          	auipc	a0,0x7
ffffffffc0203808:	94450513          	addi	a0,a0,-1724 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc020380c:	c79fc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203810 <swap_in>:
ffffffffc0203810:	7179                	addi	sp,sp,-48
ffffffffc0203812:	e84a                	sd	s2,16(sp)
ffffffffc0203814:	892a                	mv	s2,a0
ffffffffc0203816:	4505                	li	a0,1
ffffffffc0203818:	ec26                	sd	s1,24(sp)
ffffffffc020381a:	e44e                	sd	s3,8(sp)
ffffffffc020381c:	f406                	sd	ra,40(sp)
ffffffffc020381e:	f022                	sd	s0,32(sp)
ffffffffc0203820:	84ae                	mv	s1,a1
ffffffffc0203822:	89b2                	mv	s3,a2
ffffffffc0203824:	d20fe0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0203828:	c129                	beqz	a0,ffffffffc020386a <swap_in+0x5a>
ffffffffc020382a:	842a                	mv	s0,a0
ffffffffc020382c:	01893503          	ld	a0,24(s2)
ffffffffc0203830:	4601                	li	a2,0
ffffffffc0203832:	85a6                	mv	a1,s1
ffffffffc0203834:	e1efe0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc0203838:	892a                	mv	s2,a0
ffffffffc020383a:	6108                	ld	a0,0(a0)
ffffffffc020383c:	85a2                	mv	a1,s0
ffffffffc020383e:	69b000ef          	jal	ra,ffffffffc02046d8 <swapfs_read>
ffffffffc0203842:	00093583          	ld	a1,0(s2)
ffffffffc0203846:	8626                	mv	a2,s1
ffffffffc0203848:	00007517          	auipc	a0,0x7
ffffffffc020384c:	8a050513          	addi	a0,a0,-1888 # ffffffffc020a0e8 <default_pmm_manager+0x720>
ffffffffc0203850:	81a1                	srli	a1,a1,0x8
ffffffffc0203852:	941fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203856:	70a2                	ld	ra,40(sp)
ffffffffc0203858:	0089b023          	sd	s0,0(s3)
ffffffffc020385c:	7402                	ld	s0,32(sp)
ffffffffc020385e:	64e2                	ld	s1,24(sp)
ffffffffc0203860:	6942                	ld	s2,16(sp)
ffffffffc0203862:	69a2                	ld	s3,8(sp)
ffffffffc0203864:	4501                	li	a0,0
ffffffffc0203866:	6145                	addi	sp,sp,48
ffffffffc0203868:	8082                	ret
ffffffffc020386a:	00007697          	auipc	a3,0x7
ffffffffc020386e:	86e68693          	addi	a3,a3,-1938 # ffffffffc020a0d8 <default_pmm_manager+0x710>
ffffffffc0203872:	00006617          	auipc	a2,0x6
ffffffffc0203876:	a0e60613          	addi	a2,a2,-1522 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020387a:	07e00593          	li	a1,126
ffffffffc020387e:	00007517          	auipc	a0,0x7
ffffffffc0203882:	8ca50513          	addi	a0,a0,-1846 # ffffffffc020a148 <default_pmm_manager+0x780>
ffffffffc0203886:	bfffc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc020388a <_fifo_init_mm>:
ffffffffc020388a:	00039797          	auipc	a5,0x39
ffffffffc020388e:	72678793          	addi	a5,a5,1830 # ffffffffc023cfb0 <pra_list_head>
ffffffffc0203892:	f51c                	sd	a5,40(a0)
ffffffffc0203894:	e79c                	sd	a5,8(a5)
ffffffffc0203896:	e39c                	sd	a5,0(a5)
ffffffffc0203898:	4501                	li	a0,0
ffffffffc020389a:	8082                	ret

ffffffffc020389c <_fifo_init>:
ffffffffc020389c:	4501                	li	a0,0
ffffffffc020389e:	8082                	ret

ffffffffc02038a0 <_fifo_set_unswappable>:
ffffffffc02038a0:	4501                	li	a0,0
ffffffffc02038a2:	8082                	ret

ffffffffc02038a4 <_fifo_tick_event>:
ffffffffc02038a4:	4501                	li	a0,0
ffffffffc02038a6:	8082                	ret

ffffffffc02038a8 <_fifo_check_swap>:
ffffffffc02038a8:	711d                	addi	sp,sp,-96
ffffffffc02038aa:	fc4e                	sd	s3,56(sp)
ffffffffc02038ac:	f852                	sd	s4,48(sp)
ffffffffc02038ae:	00007517          	auipc	a0,0x7
ffffffffc02038b2:	bc250513          	addi	a0,a0,-1086 # ffffffffc020a470 <default_pmm_manager+0xaa8>
ffffffffc02038b6:	698d                	lui	s3,0x3
ffffffffc02038b8:	4a31                	li	s4,12
ffffffffc02038ba:	e8a2                	sd	s0,80(sp)
ffffffffc02038bc:	e4a6                	sd	s1,72(sp)
ffffffffc02038be:	ec86                	sd	ra,88(sp)
ffffffffc02038c0:	e0ca                	sd	s2,64(sp)
ffffffffc02038c2:	f456                	sd	s5,40(sp)
ffffffffc02038c4:	f05a                	sd	s6,32(sp)
ffffffffc02038c6:	ec5e                	sd	s7,24(sp)
ffffffffc02038c8:	e862                	sd	s8,16(sp)
ffffffffc02038ca:	e466                	sd	s9,8(sp)
ffffffffc02038cc:	00039417          	auipc	s0,0x39
ffffffffc02038d0:	5a840413          	addi	s0,s0,1448 # ffffffffc023ce74 <pgfault_num>
ffffffffc02038d4:	8bffc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02038d8:	01498023          	sb	s4,0(s3) # 3000 <_binary_obj___user_matrix_out_size+0x6c8>
ffffffffc02038dc:	4004                	lw	s1,0(s0)
ffffffffc02038de:	4791                	li	a5,4
ffffffffc02038e0:	2481                	sext.w	s1,s1
ffffffffc02038e2:	14f49963          	bne	s1,a5,ffffffffc0203a34 <_fifo_check_swap+0x18c>
ffffffffc02038e6:	00007517          	auipc	a0,0x7
ffffffffc02038ea:	bca50513          	addi	a0,a0,-1078 # ffffffffc020a4b0 <default_pmm_manager+0xae8>
ffffffffc02038ee:	6a85                	lui	s5,0x1
ffffffffc02038f0:	4b29                	li	s6,10
ffffffffc02038f2:	8a1fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02038f6:	016a8023          	sb	s6,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc02038fa:	00042903          	lw	s2,0(s0)
ffffffffc02038fe:	2901                	sext.w	s2,s2
ffffffffc0203900:	2a991a63          	bne	s2,s1,ffffffffc0203bb4 <_fifo_check_swap+0x30c>
ffffffffc0203904:	00007517          	auipc	a0,0x7
ffffffffc0203908:	bd450513          	addi	a0,a0,-1068 # ffffffffc020a4d8 <default_pmm_manager+0xb10>
ffffffffc020390c:	6b91                	lui	s7,0x4
ffffffffc020390e:	4c35                	li	s8,13
ffffffffc0203910:	883fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203914:	018b8023          	sb	s8,0(s7) # 4000 <_binary_obj___user_matrix_out_size+0x16c8>
ffffffffc0203918:	4004                	lw	s1,0(s0)
ffffffffc020391a:	2481                	sext.w	s1,s1
ffffffffc020391c:	27249c63          	bne	s1,s2,ffffffffc0203b94 <_fifo_check_swap+0x2ec>
ffffffffc0203920:	00007517          	auipc	a0,0x7
ffffffffc0203924:	be050513          	addi	a0,a0,-1056 # ffffffffc020a500 <default_pmm_manager+0xb38>
ffffffffc0203928:	6909                	lui	s2,0x2
ffffffffc020392a:	4cad                	li	s9,11
ffffffffc020392c:	867fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203930:	01990023          	sb	s9,0(s2) # 2000 <_binary_obj___user_forktree_out_size>
ffffffffc0203934:	401c                	lw	a5,0(s0)
ffffffffc0203936:	2781                	sext.w	a5,a5
ffffffffc0203938:	22979e63          	bne	a5,s1,ffffffffc0203b74 <_fifo_check_swap+0x2cc>
ffffffffc020393c:	00007517          	auipc	a0,0x7
ffffffffc0203940:	bec50513          	addi	a0,a0,-1044 # ffffffffc020a528 <default_pmm_manager+0xb60>
ffffffffc0203944:	84ffc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203948:	6795                	lui	a5,0x5
ffffffffc020394a:	4739                	li	a4,14
ffffffffc020394c:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x26c8>
ffffffffc0203950:	4004                	lw	s1,0(s0)
ffffffffc0203952:	4795                	li	a5,5
ffffffffc0203954:	2481                	sext.w	s1,s1
ffffffffc0203956:	1ef49f63          	bne	s1,a5,ffffffffc0203b54 <_fifo_check_swap+0x2ac>
ffffffffc020395a:	00007517          	auipc	a0,0x7
ffffffffc020395e:	ba650513          	addi	a0,a0,-1114 # ffffffffc020a500 <default_pmm_manager+0xb38>
ffffffffc0203962:	831fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203966:	01990023          	sb	s9,0(s2)
ffffffffc020396a:	401c                	lw	a5,0(s0)
ffffffffc020396c:	2781                	sext.w	a5,a5
ffffffffc020396e:	1c979363          	bne	a5,s1,ffffffffc0203b34 <_fifo_check_swap+0x28c>
ffffffffc0203972:	00007517          	auipc	a0,0x7
ffffffffc0203976:	b3e50513          	addi	a0,a0,-1218 # ffffffffc020a4b0 <default_pmm_manager+0xae8>
ffffffffc020397a:	819fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020397e:	016a8023          	sb	s6,0(s5)
ffffffffc0203982:	401c                	lw	a5,0(s0)
ffffffffc0203984:	4719                	li	a4,6
ffffffffc0203986:	2781                	sext.w	a5,a5
ffffffffc0203988:	18e79663          	bne	a5,a4,ffffffffc0203b14 <_fifo_check_swap+0x26c>
ffffffffc020398c:	00007517          	auipc	a0,0x7
ffffffffc0203990:	b7450513          	addi	a0,a0,-1164 # ffffffffc020a500 <default_pmm_manager+0xb38>
ffffffffc0203994:	ffefc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203998:	01990023          	sb	s9,0(s2)
ffffffffc020399c:	401c                	lw	a5,0(s0)
ffffffffc020399e:	471d                	li	a4,7
ffffffffc02039a0:	2781                	sext.w	a5,a5
ffffffffc02039a2:	14e79963          	bne	a5,a4,ffffffffc0203af4 <_fifo_check_swap+0x24c>
ffffffffc02039a6:	00007517          	auipc	a0,0x7
ffffffffc02039aa:	aca50513          	addi	a0,a0,-1334 # ffffffffc020a470 <default_pmm_manager+0xaa8>
ffffffffc02039ae:	fe4fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02039b2:	01498023          	sb	s4,0(s3)
ffffffffc02039b6:	401c                	lw	a5,0(s0)
ffffffffc02039b8:	4721                	li	a4,8
ffffffffc02039ba:	2781                	sext.w	a5,a5
ffffffffc02039bc:	10e79c63          	bne	a5,a4,ffffffffc0203ad4 <_fifo_check_swap+0x22c>
ffffffffc02039c0:	00007517          	auipc	a0,0x7
ffffffffc02039c4:	b1850513          	addi	a0,a0,-1256 # ffffffffc020a4d8 <default_pmm_manager+0xb10>
ffffffffc02039c8:	fcafc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02039cc:	018b8023          	sb	s8,0(s7)
ffffffffc02039d0:	401c                	lw	a5,0(s0)
ffffffffc02039d2:	4725                	li	a4,9
ffffffffc02039d4:	2781                	sext.w	a5,a5
ffffffffc02039d6:	0ce79f63          	bne	a5,a4,ffffffffc0203ab4 <_fifo_check_swap+0x20c>
ffffffffc02039da:	00007517          	auipc	a0,0x7
ffffffffc02039de:	b4e50513          	addi	a0,a0,-1202 # ffffffffc020a528 <default_pmm_manager+0xb60>
ffffffffc02039e2:	fb0fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02039e6:	6795                	lui	a5,0x5
ffffffffc02039e8:	4739                	li	a4,14
ffffffffc02039ea:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x26c8>
ffffffffc02039ee:	4004                	lw	s1,0(s0)
ffffffffc02039f0:	47a9                	li	a5,10
ffffffffc02039f2:	2481                	sext.w	s1,s1
ffffffffc02039f4:	0af49063          	bne	s1,a5,ffffffffc0203a94 <_fifo_check_swap+0x1ec>
ffffffffc02039f8:	00007517          	auipc	a0,0x7
ffffffffc02039fc:	ab850513          	addi	a0,a0,-1352 # ffffffffc020a4b0 <default_pmm_manager+0xae8>
ffffffffc0203a00:	f92fc0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0203a04:	6785                	lui	a5,0x1
ffffffffc0203a06:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xd58>
ffffffffc0203a0a:	06979563          	bne	a5,s1,ffffffffc0203a74 <_fifo_check_swap+0x1cc>
ffffffffc0203a0e:	401c                	lw	a5,0(s0)
ffffffffc0203a10:	472d                	li	a4,11
ffffffffc0203a12:	2781                	sext.w	a5,a5
ffffffffc0203a14:	04e79063          	bne	a5,a4,ffffffffc0203a54 <_fifo_check_swap+0x1ac>
ffffffffc0203a18:	60e6                	ld	ra,88(sp)
ffffffffc0203a1a:	6446                	ld	s0,80(sp)
ffffffffc0203a1c:	64a6                	ld	s1,72(sp)
ffffffffc0203a1e:	6906                	ld	s2,64(sp)
ffffffffc0203a20:	79e2                	ld	s3,56(sp)
ffffffffc0203a22:	7a42                	ld	s4,48(sp)
ffffffffc0203a24:	7aa2                	ld	s5,40(sp)
ffffffffc0203a26:	7b02                	ld	s6,32(sp)
ffffffffc0203a28:	6be2                	ld	s7,24(sp)
ffffffffc0203a2a:	6c42                	ld	s8,16(sp)
ffffffffc0203a2c:	6ca2                	ld	s9,8(sp)
ffffffffc0203a2e:	4501                	li	a0,0
ffffffffc0203a30:	6125                	addi	sp,sp,96
ffffffffc0203a32:	8082                	ret
ffffffffc0203a34:	00007697          	auipc	a3,0x7
ffffffffc0203a38:	8dc68693          	addi	a3,a3,-1828 # ffffffffc020a310 <default_pmm_manager+0x948>
ffffffffc0203a3c:	00006617          	auipc	a2,0x6
ffffffffc0203a40:	84460613          	addi	a2,a2,-1980 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203a44:	05100593          	li	a1,81
ffffffffc0203a48:	00007517          	auipc	a0,0x7
ffffffffc0203a4c:	a5050513          	addi	a0,a0,-1456 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203a50:	a35fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203a54:	00007697          	auipc	a3,0x7
ffffffffc0203a58:	b8468693          	addi	a3,a3,-1148 # ffffffffc020a5d8 <default_pmm_manager+0xc10>
ffffffffc0203a5c:	00006617          	auipc	a2,0x6
ffffffffc0203a60:	82460613          	addi	a2,a2,-2012 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203a64:	07300593          	li	a1,115
ffffffffc0203a68:	00007517          	auipc	a0,0x7
ffffffffc0203a6c:	a3050513          	addi	a0,a0,-1488 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203a70:	a15fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203a74:	00007697          	auipc	a3,0x7
ffffffffc0203a78:	b3c68693          	addi	a3,a3,-1220 # ffffffffc020a5b0 <default_pmm_manager+0xbe8>
ffffffffc0203a7c:	00006617          	auipc	a2,0x6
ffffffffc0203a80:	80460613          	addi	a2,a2,-2044 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203a84:	07100593          	li	a1,113
ffffffffc0203a88:	00007517          	auipc	a0,0x7
ffffffffc0203a8c:	a1050513          	addi	a0,a0,-1520 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203a90:	9f5fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203a94:	00007697          	auipc	a3,0x7
ffffffffc0203a98:	b0c68693          	addi	a3,a3,-1268 # ffffffffc020a5a0 <default_pmm_manager+0xbd8>
ffffffffc0203a9c:	00005617          	auipc	a2,0x5
ffffffffc0203aa0:	7e460613          	addi	a2,a2,2020 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203aa4:	06f00593          	li	a1,111
ffffffffc0203aa8:	00007517          	auipc	a0,0x7
ffffffffc0203aac:	9f050513          	addi	a0,a0,-1552 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203ab0:	9d5fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203ab4:	00007697          	auipc	a3,0x7
ffffffffc0203ab8:	adc68693          	addi	a3,a3,-1316 # ffffffffc020a590 <default_pmm_manager+0xbc8>
ffffffffc0203abc:	00005617          	auipc	a2,0x5
ffffffffc0203ac0:	7c460613          	addi	a2,a2,1988 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203ac4:	06c00593          	li	a1,108
ffffffffc0203ac8:	00007517          	auipc	a0,0x7
ffffffffc0203acc:	9d050513          	addi	a0,a0,-1584 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203ad0:	9b5fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203ad4:	00007697          	auipc	a3,0x7
ffffffffc0203ad8:	aac68693          	addi	a3,a3,-1364 # ffffffffc020a580 <default_pmm_manager+0xbb8>
ffffffffc0203adc:	00005617          	auipc	a2,0x5
ffffffffc0203ae0:	7a460613          	addi	a2,a2,1956 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203ae4:	06900593          	li	a1,105
ffffffffc0203ae8:	00007517          	auipc	a0,0x7
ffffffffc0203aec:	9b050513          	addi	a0,a0,-1616 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203af0:	995fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203af4:	00007697          	auipc	a3,0x7
ffffffffc0203af8:	a7c68693          	addi	a3,a3,-1412 # ffffffffc020a570 <default_pmm_manager+0xba8>
ffffffffc0203afc:	00005617          	auipc	a2,0x5
ffffffffc0203b00:	78460613          	addi	a2,a2,1924 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203b04:	06600593          	li	a1,102
ffffffffc0203b08:	00007517          	auipc	a0,0x7
ffffffffc0203b0c:	99050513          	addi	a0,a0,-1648 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203b10:	975fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203b14:	00007697          	auipc	a3,0x7
ffffffffc0203b18:	a4c68693          	addi	a3,a3,-1460 # ffffffffc020a560 <default_pmm_manager+0xb98>
ffffffffc0203b1c:	00005617          	auipc	a2,0x5
ffffffffc0203b20:	76460613          	addi	a2,a2,1892 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203b24:	06300593          	li	a1,99
ffffffffc0203b28:	00007517          	auipc	a0,0x7
ffffffffc0203b2c:	97050513          	addi	a0,a0,-1680 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203b30:	955fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203b34:	00007697          	auipc	a3,0x7
ffffffffc0203b38:	a1c68693          	addi	a3,a3,-1508 # ffffffffc020a550 <default_pmm_manager+0xb88>
ffffffffc0203b3c:	00005617          	auipc	a2,0x5
ffffffffc0203b40:	74460613          	addi	a2,a2,1860 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203b44:	06000593          	li	a1,96
ffffffffc0203b48:	00007517          	auipc	a0,0x7
ffffffffc0203b4c:	95050513          	addi	a0,a0,-1712 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203b50:	935fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203b54:	00007697          	auipc	a3,0x7
ffffffffc0203b58:	9fc68693          	addi	a3,a3,-1540 # ffffffffc020a550 <default_pmm_manager+0xb88>
ffffffffc0203b5c:	00005617          	auipc	a2,0x5
ffffffffc0203b60:	72460613          	addi	a2,a2,1828 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203b64:	05d00593          	li	a1,93
ffffffffc0203b68:	00007517          	auipc	a0,0x7
ffffffffc0203b6c:	93050513          	addi	a0,a0,-1744 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203b70:	915fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203b74:	00006697          	auipc	a3,0x6
ffffffffc0203b78:	79c68693          	addi	a3,a3,1948 # ffffffffc020a310 <default_pmm_manager+0x948>
ffffffffc0203b7c:	00005617          	auipc	a2,0x5
ffffffffc0203b80:	70460613          	addi	a2,a2,1796 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203b84:	05a00593          	li	a1,90
ffffffffc0203b88:	00007517          	auipc	a0,0x7
ffffffffc0203b8c:	91050513          	addi	a0,a0,-1776 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203b90:	8f5fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203b94:	00006697          	auipc	a3,0x6
ffffffffc0203b98:	77c68693          	addi	a3,a3,1916 # ffffffffc020a310 <default_pmm_manager+0x948>
ffffffffc0203b9c:	00005617          	auipc	a2,0x5
ffffffffc0203ba0:	6e460613          	addi	a2,a2,1764 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203ba4:	05700593          	li	a1,87
ffffffffc0203ba8:	00007517          	auipc	a0,0x7
ffffffffc0203bac:	8f050513          	addi	a0,a0,-1808 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203bb0:	8d5fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203bb4:	00006697          	auipc	a3,0x6
ffffffffc0203bb8:	75c68693          	addi	a3,a3,1884 # ffffffffc020a310 <default_pmm_manager+0x948>
ffffffffc0203bbc:	00005617          	auipc	a2,0x5
ffffffffc0203bc0:	6c460613          	addi	a2,a2,1732 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203bc4:	05400593          	li	a1,84
ffffffffc0203bc8:	00007517          	auipc	a0,0x7
ffffffffc0203bcc:	8d050513          	addi	a0,a0,-1840 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203bd0:	8b5fc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203bd4 <_fifo_swap_out_victim>:
ffffffffc0203bd4:	751c                	ld	a5,40(a0)
ffffffffc0203bd6:	1141                	addi	sp,sp,-16
ffffffffc0203bd8:	e406                	sd	ra,8(sp)
ffffffffc0203bda:	cf91                	beqz	a5,ffffffffc0203bf6 <_fifo_swap_out_victim+0x22>
ffffffffc0203bdc:	ee0d                	bnez	a2,ffffffffc0203c16 <_fifo_swap_out_victim+0x42>
ffffffffc0203bde:	679c                	ld	a5,8(a5)
ffffffffc0203be0:	60a2                	ld	ra,8(sp)
ffffffffc0203be2:	4501                	li	a0,0
ffffffffc0203be4:	6394                	ld	a3,0(a5)
ffffffffc0203be6:	6798                	ld	a4,8(a5)
ffffffffc0203be8:	fd878793          	addi	a5,a5,-40
ffffffffc0203bec:	e698                	sd	a4,8(a3)
ffffffffc0203bee:	e314                	sd	a3,0(a4)
ffffffffc0203bf0:	e19c                	sd	a5,0(a1)
ffffffffc0203bf2:	0141                	addi	sp,sp,16
ffffffffc0203bf4:	8082                	ret
ffffffffc0203bf6:	00007697          	auipc	a3,0x7
ffffffffc0203bfa:	a1268693          	addi	a3,a3,-1518 # ffffffffc020a608 <default_pmm_manager+0xc40>
ffffffffc0203bfe:	00005617          	auipc	a2,0x5
ffffffffc0203c02:	68260613          	addi	a2,a2,1666 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203c06:	04100593          	li	a1,65
ffffffffc0203c0a:	00007517          	auipc	a0,0x7
ffffffffc0203c0e:	88e50513          	addi	a0,a0,-1906 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203c12:	873fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203c16:	00007697          	auipc	a3,0x7
ffffffffc0203c1a:	a0268693          	addi	a3,a3,-1534 # ffffffffc020a618 <default_pmm_manager+0xc50>
ffffffffc0203c1e:	00005617          	auipc	a2,0x5
ffffffffc0203c22:	66260613          	addi	a2,a2,1634 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203c26:	04200593          	li	a1,66
ffffffffc0203c2a:	00007517          	auipc	a0,0x7
ffffffffc0203c2e:	86e50513          	addi	a0,a0,-1938 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203c32:	853fc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203c36 <_fifo_map_swappable>:
ffffffffc0203c36:	02860713          	addi	a4,a2,40
ffffffffc0203c3a:	751c                	ld	a5,40(a0)
ffffffffc0203c3c:	cb09                	beqz	a4,ffffffffc0203c4e <_fifo_map_swappable+0x18>
ffffffffc0203c3e:	cb81                	beqz	a5,ffffffffc0203c4e <_fifo_map_swappable+0x18>
ffffffffc0203c40:	6394                	ld	a3,0(a5)
ffffffffc0203c42:	e398                	sd	a4,0(a5)
ffffffffc0203c44:	4501                	li	a0,0
ffffffffc0203c46:	e698                	sd	a4,8(a3)
ffffffffc0203c48:	fa1c                	sd	a5,48(a2)
ffffffffc0203c4a:	f614                	sd	a3,40(a2)
ffffffffc0203c4c:	8082                	ret
ffffffffc0203c4e:	1141                	addi	sp,sp,-16
ffffffffc0203c50:	00007697          	auipc	a3,0x7
ffffffffc0203c54:	99868693          	addi	a3,a3,-1640 # ffffffffc020a5e8 <default_pmm_manager+0xc20>
ffffffffc0203c58:	00005617          	auipc	a2,0x5
ffffffffc0203c5c:	62860613          	addi	a2,a2,1576 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203c60:	03200593          	li	a1,50
ffffffffc0203c64:	00007517          	auipc	a0,0x7
ffffffffc0203c68:	83450513          	addi	a0,a0,-1996 # ffffffffc020a498 <default_pmm_manager+0xad0>
ffffffffc0203c6c:	e406                	sd	ra,8(sp)
ffffffffc0203c6e:	817fc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203c72 <check_vma_overlap.isra.0.part.1>:
ffffffffc0203c72:	1141                	addi	sp,sp,-16
ffffffffc0203c74:	00007697          	auipc	a3,0x7
ffffffffc0203c78:	9cc68693          	addi	a3,a3,-1588 # ffffffffc020a640 <default_pmm_manager+0xc78>
ffffffffc0203c7c:	00005617          	auipc	a2,0x5
ffffffffc0203c80:	60460613          	addi	a2,a2,1540 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203c84:	06d00593          	li	a1,109
ffffffffc0203c88:	00007517          	auipc	a0,0x7
ffffffffc0203c8c:	9d850513          	addi	a0,a0,-1576 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0203c90:	e406                	sd	ra,8(sp)
ffffffffc0203c92:	ff2fc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203c96 <mm_create>:
ffffffffc0203c96:	1141                	addi	sp,sp,-16
ffffffffc0203c98:	04000513          	li	a0,64
ffffffffc0203c9c:	e022                	sd	s0,0(sp)
ffffffffc0203c9e:	e406                	sd	ra,8(sp)
ffffffffc0203ca0:	eadfd0ef          	jal	ra,ffffffffc0201b4c <kmalloc>
ffffffffc0203ca4:	842a                	mv	s0,a0
ffffffffc0203ca6:	c515                	beqz	a0,ffffffffc0203cd2 <mm_create+0x3c>
ffffffffc0203ca8:	00039797          	auipc	a5,0x39
ffffffffc0203cac:	1c878793          	addi	a5,a5,456 # ffffffffc023ce70 <swap_init_ok>
ffffffffc0203cb0:	439c                	lw	a5,0(a5)
ffffffffc0203cb2:	e408                	sd	a0,8(s0)
ffffffffc0203cb4:	e008                	sd	a0,0(s0)
ffffffffc0203cb6:	00053823          	sd	zero,16(a0)
ffffffffc0203cba:	00053c23          	sd	zero,24(a0)
ffffffffc0203cbe:	02052023          	sw	zero,32(a0)
ffffffffc0203cc2:	2781                	sext.w	a5,a5
ffffffffc0203cc4:	ef81                	bnez	a5,ffffffffc0203cdc <mm_create+0x46>
ffffffffc0203cc6:	02053423          	sd	zero,40(a0)
ffffffffc0203cca:	02042823          	sw	zero,48(s0)
ffffffffc0203cce:	02043c23          	sd	zero,56(s0)
ffffffffc0203cd2:	8522                	mv	a0,s0
ffffffffc0203cd4:	60a2                	ld	ra,8(sp)
ffffffffc0203cd6:	6402                	ld	s0,0(sp)
ffffffffc0203cd8:	0141                	addi	sp,sp,16
ffffffffc0203cda:	8082                	ret
ffffffffc0203cdc:	a01ff0ef          	jal	ra,ffffffffc02036dc <swap_init_mm>
ffffffffc0203ce0:	b7ed                	j	ffffffffc0203cca <mm_create+0x34>

ffffffffc0203ce2 <vma_create>:
ffffffffc0203ce2:	1101                	addi	sp,sp,-32
ffffffffc0203ce4:	e04a                	sd	s2,0(sp)
ffffffffc0203ce6:	892a                	mv	s2,a0
ffffffffc0203ce8:	03000513          	li	a0,48
ffffffffc0203cec:	e822                	sd	s0,16(sp)
ffffffffc0203cee:	e426                	sd	s1,8(sp)
ffffffffc0203cf0:	ec06                	sd	ra,24(sp)
ffffffffc0203cf2:	84ae                	mv	s1,a1
ffffffffc0203cf4:	8432                	mv	s0,a2
ffffffffc0203cf6:	e57fd0ef          	jal	ra,ffffffffc0201b4c <kmalloc>
ffffffffc0203cfa:	c509                	beqz	a0,ffffffffc0203d04 <vma_create+0x22>
ffffffffc0203cfc:	01253423          	sd	s2,8(a0)
ffffffffc0203d00:	e904                	sd	s1,16(a0)
ffffffffc0203d02:	cd00                	sw	s0,24(a0)
ffffffffc0203d04:	60e2                	ld	ra,24(sp)
ffffffffc0203d06:	6442                	ld	s0,16(sp)
ffffffffc0203d08:	64a2                	ld	s1,8(sp)
ffffffffc0203d0a:	6902                	ld	s2,0(sp)
ffffffffc0203d0c:	6105                	addi	sp,sp,32
ffffffffc0203d0e:	8082                	ret

ffffffffc0203d10 <find_vma>:
ffffffffc0203d10:	c51d                	beqz	a0,ffffffffc0203d3e <find_vma+0x2e>
ffffffffc0203d12:	691c                	ld	a5,16(a0)
ffffffffc0203d14:	c781                	beqz	a5,ffffffffc0203d1c <find_vma+0xc>
ffffffffc0203d16:	6798                	ld	a4,8(a5)
ffffffffc0203d18:	02e5f663          	bgeu	a1,a4,ffffffffc0203d44 <find_vma+0x34>
ffffffffc0203d1c:	87aa                	mv	a5,a0
ffffffffc0203d1e:	679c                	ld	a5,8(a5)
ffffffffc0203d20:	00f50f63          	beq	a0,a5,ffffffffc0203d3e <find_vma+0x2e>
ffffffffc0203d24:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203d28:	fee5ebe3          	bltu	a1,a4,ffffffffc0203d1e <find_vma+0xe>
ffffffffc0203d2c:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203d30:	fee5f7e3          	bgeu	a1,a4,ffffffffc0203d1e <find_vma+0xe>
ffffffffc0203d34:	1781                	addi	a5,a5,-32
ffffffffc0203d36:	c781                	beqz	a5,ffffffffc0203d3e <find_vma+0x2e>
ffffffffc0203d38:	e91c                	sd	a5,16(a0)
ffffffffc0203d3a:	853e                	mv	a0,a5
ffffffffc0203d3c:	8082                	ret
ffffffffc0203d3e:	4781                	li	a5,0
ffffffffc0203d40:	853e                	mv	a0,a5
ffffffffc0203d42:	8082                	ret
ffffffffc0203d44:	6b98                	ld	a4,16(a5)
ffffffffc0203d46:	fce5fbe3          	bgeu	a1,a4,ffffffffc0203d1c <find_vma+0xc>
ffffffffc0203d4a:	e91c                	sd	a5,16(a0)
ffffffffc0203d4c:	b7fd                	j	ffffffffc0203d3a <find_vma+0x2a>

ffffffffc0203d4e <insert_vma_struct>:
ffffffffc0203d4e:	6590                	ld	a2,8(a1)
ffffffffc0203d50:	0105b803          	ld	a6,16(a1) # 1010 <_binary_obj___user_faultread_out_size-0xd48>
ffffffffc0203d54:	1141                	addi	sp,sp,-16
ffffffffc0203d56:	e406                	sd	ra,8(sp)
ffffffffc0203d58:	872a                	mv	a4,a0
ffffffffc0203d5a:	01066863          	bltu	a2,a6,ffffffffc0203d6a <insert_vma_struct+0x1c>
ffffffffc0203d5e:	a8b9                	j	ffffffffc0203dbc <insert_vma_struct+0x6e>
ffffffffc0203d60:	fe87b683          	ld	a3,-24(a5)
ffffffffc0203d64:	04d66763          	bltu	a2,a3,ffffffffc0203db2 <insert_vma_struct+0x64>
ffffffffc0203d68:	873e                	mv	a4,a5
ffffffffc0203d6a:	671c                	ld	a5,8(a4)
ffffffffc0203d6c:	fef51ae3          	bne	a0,a5,ffffffffc0203d60 <insert_vma_struct+0x12>
ffffffffc0203d70:	02a70463          	beq	a4,a0,ffffffffc0203d98 <insert_vma_struct+0x4a>
ffffffffc0203d74:	ff073683          	ld	a3,-16(a4)
ffffffffc0203d78:	fe873883          	ld	a7,-24(a4)
ffffffffc0203d7c:	08d8f063          	bgeu	a7,a3,ffffffffc0203dfc <insert_vma_struct+0xae>
ffffffffc0203d80:	04d66e63          	bltu	a2,a3,ffffffffc0203ddc <insert_vma_struct+0x8e>
ffffffffc0203d84:	00f50a63          	beq	a0,a5,ffffffffc0203d98 <insert_vma_struct+0x4a>
ffffffffc0203d88:	fe87b683          	ld	a3,-24(a5)
ffffffffc0203d8c:	0506e863          	bltu	a3,a6,ffffffffc0203ddc <insert_vma_struct+0x8e>
ffffffffc0203d90:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203d94:	02c6f263          	bgeu	a3,a2,ffffffffc0203db8 <insert_vma_struct+0x6a>
ffffffffc0203d98:	5114                	lw	a3,32(a0)
ffffffffc0203d9a:	e188                	sd	a0,0(a1)
ffffffffc0203d9c:	02058613          	addi	a2,a1,32
ffffffffc0203da0:	e390                	sd	a2,0(a5)
ffffffffc0203da2:	e710                	sd	a2,8(a4)
ffffffffc0203da4:	60a2                	ld	ra,8(sp)
ffffffffc0203da6:	f59c                	sd	a5,40(a1)
ffffffffc0203da8:	f198                	sd	a4,32(a1)
ffffffffc0203daa:	2685                	addiw	a3,a3,1
ffffffffc0203dac:	d114                	sw	a3,32(a0)
ffffffffc0203dae:	0141                	addi	sp,sp,16
ffffffffc0203db0:	8082                	ret
ffffffffc0203db2:	fca711e3          	bne	a4,a0,ffffffffc0203d74 <insert_vma_struct+0x26>
ffffffffc0203db6:	bfd9                	j	ffffffffc0203d8c <insert_vma_struct+0x3e>
ffffffffc0203db8:	ebbff0ef          	jal	ra,ffffffffc0203c72 <check_vma_overlap.isra.0.part.1>
ffffffffc0203dbc:	00007697          	auipc	a3,0x7
ffffffffc0203dc0:	9b468693          	addi	a3,a3,-1612 # ffffffffc020a770 <default_pmm_manager+0xda8>
ffffffffc0203dc4:	00005617          	auipc	a2,0x5
ffffffffc0203dc8:	4bc60613          	addi	a2,a2,1212 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203dcc:	07400593          	li	a1,116
ffffffffc0203dd0:	00007517          	auipc	a0,0x7
ffffffffc0203dd4:	89050513          	addi	a0,a0,-1904 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0203dd8:	eacfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203ddc:	00007697          	auipc	a3,0x7
ffffffffc0203de0:	9d468693          	addi	a3,a3,-1580 # ffffffffc020a7b0 <default_pmm_manager+0xde8>
ffffffffc0203de4:	00005617          	auipc	a2,0x5
ffffffffc0203de8:	49c60613          	addi	a2,a2,1180 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203dec:	06c00593          	li	a1,108
ffffffffc0203df0:	00007517          	auipc	a0,0x7
ffffffffc0203df4:	87050513          	addi	a0,a0,-1936 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0203df8:	e8cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0203dfc:	00007697          	auipc	a3,0x7
ffffffffc0203e00:	99468693          	addi	a3,a3,-1644 # ffffffffc020a790 <default_pmm_manager+0xdc8>
ffffffffc0203e04:	00005617          	auipc	a2,0x5
ffffffffc0203e08:	47c60613          	addi	a2,a2,1148 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203e0c:	06b00593          	li	a1,107
ffffffffc0203e10:	00007517          	auipc	a0,0x7
ffffffffc0203e14:	85050513          	addi	a0,a0,-1968 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0203e18:	e6cfc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203e1c <mm_destroy>:
ffffffffc0203e1c:	591c                	lw	a5,48(a0)
ffffffffc0203e1e:	1141                	addi	sp,sp,-16
ffffffffc0203e20:	e406                	sd	ra,8(sp)
ffffffffc0203e22:	e022                	sd	s0,0(sp)
ffffffffc0203e24:	e78d                	bnez	a5,ffffffffc0203e4e <mm_destroy+0x32>
ffffffffc0203e26:	842a                	mv	s0,a0
ffffffffc0203e28:	6508                	ld	a0,8(a0)
ffffffffc0203e2a:	00a40c63          	beq	s0,a0,ffffffffc0203e42 <mm_destroy+0x26>
ffffffffc0203e2e:	6118                	ld	a4,0(a0)
ffffffffc0203e30:	651c                	ld	a5,8(a0)
ffffffffc0203e32:	1501                	addi	a0,a0,-32
ffffffffc0203e34:	e71c                	sd	a5,8(a4)
ffffffffc0203e36:	e398                	sd	a4,0(a5)
ffffffffc0203e38:	dd1fd0ef          	jal	ra,ffffffffc0201c08 <kfree>
ffffffffc0203e3c:	6408                	ld	a0,8(s0)
ffffffffc0203e3e:	fea418e3          	bne	s0,a0,ffffffffc0203e2e <mm_destroy+0x12>
ffffffffc0203e42:	8522                	mv	a0,s0
ffffffffc0203e44:	6402                	ld	s0,0(sp)
ffffffffc0203e46:	60a2                	ld	ra,8(sp)
ffffffffc0203e48:	0141                	addi	sp,sp,16
ffffffffc0203e4a:	dbffd06f          	j	ffffffffc0201c08 <kfree>
ffffffffc0203e4e:	00007697          	auipc	a3,0x7
ffffffffc0203e52:	98268693          	addi	a3,a3,-1662 # ffffffffc020a7d0 <default_pmm_manager+0xe08>
ffffffffc0203e56:	00005617          	auipc	a2,0x5
ffffffffc0203e5a:	42a60613          	addi	a2,a2,1066 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203e5e:	09400593          	li	a1,148
ffffffffc0203e62:	00006517          	auipc	a0,0x6
ffffffffc0203e66:	7fe50513          	addi	a0,a0,2046 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0203e6a:	e1afc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203e6e <mm_map>:
ffffffffc0203e6e:	6785                	lui	a5,0x1
ffffffffc0203e70:	7139                	addi	sp,sp,-64
ffffffffc0203e72:	17fd                	addi	a5,a5,-1
ffffffffc0203e74:	787d                	lui	a6,0xfffff
ffffffffc0203e76:	f822                	sd	s0,48(sp)
ffffffffc0203e78:	00f60433          	add	s0,a2,a5
ffffffffc0203e7c:	f426                	sd	s1,40(sp)
ffffffffc0203e7e:	942e                	add	s0,s0,a1
ffffffffc0203e80:	fc06                	sd	ra,56(sp)
ffffffffc0203e82:	f04a                	sd	s2,32(sp)
ffffffffc0203e84:	ec4e                	sd	s3,24(sp)
ffffffffc0203e86:	e852                	sd	s4,16(sp)
ffffffffc0203e88:	e456                	sd	s5,8(sp)
ffffffffc0203e8a:	0105f4b3          	and	s1,a1,a6
ffffffffc0203e8e:	002007b7          	lui	a5,0x200
ffffffffc0203e92:	01047433          	and	s0,s0,a6
ffffffffc0203e96:	06f4e363          	bltu	s1,a5,ffffffffc0203efc <mm_map+0x8e>
ffffffffc0203e9a:	0684f163          	bgeu	s1,s0,ffffffffc0203efc <mm_map+0x8e>
ffffffffc0203e9e:	4785                	li	a5,1
ffffffffc0203ea0:	07fe                	slli	a5,a5,0x1f
ffffffffc0203ea2:	0487ed63          	bltu	a5,s0,ffffffffc0203efc <mm_map+0x8e>
ffffffffc0203ea6:	89aa                	mv	s3,a0
ffffffffc0203ea8:	8a3a                	mv	s4,a4
ffffffffc0203eaa:	8ab6                	mv	s5,a3
ffffffffc0203eac:	c931                	beqz	a0,ffffffffc0203f00 <mm_map+0x92>
ffffffffc0203eae:	85a6                	mv	a1,s1
ffffffffc0203eb0:	e61ff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc0203eb4:	c501                	beqz	a0,ffffffffc0203ebc <mm_map+0x4e>
ffffffffc0203eb6:	651c                	ld	a5,8(a0)
ffffffffc0203eb8:	0487e263          	bltu	a5,s0,ffffffffc0203efc <mm_map+0x8e>
ffffffffc0203ebc:	03000513          	li	a0,48
ffffffffc0203ec0:	c8dfd0ef          	jal	ra,ffffffffc0201b4c <kmalloc>
ffffffffc0203ec4:	892a                	mv	s2,a0
ffffffffc0203ec6:	5571                	li	a0,-4
ffffffffc0203ec8:	02090163          	beqz	s2,ffffffffc0203eea <mm_map+0x7c>
ffffffffc0203ecc:	854e                	mv	a0,s3
ffffffffc0203ece:	00993423          	sd	s1,8(s2)
ffffffffc0203ed2:	00893823          	sd	s0,16(s2)
ffffffffc0203ed6:	01592c23          	sw	s5,24(s2)
ffffffffc0203eda:	85ca                	mv	a1,s2
ffffffffc0203edc:	e73ff0ef          	jal	ra,ffffffffc0203d4e <insert_vma_struct>
ffffffffc0203ee0:	4501                	li	a0,0
ffffffffc0203ee2:	000a0463          	beqz	s4,ffffffffc0203eea <mm_map+0x7c>
ffffffffc0203ee6:	012a3023          	sd	s2,0(s4)
ffffffffc0203eea:	70e2                	ld	ra,56(sp)
ffffffffc0203eec:	7442                	ld	s0,48(sp)
ffffffffc0203eee:	74a2                	ld	s1,40(sp)
ffffffffc0203ef0:	7902                	ld	s2,32(sp)
ffffffffc0203ef2:	69e2                	ld	s3,24(sp)
ffffffffc0203ef4:	6a42                	ld	s4,16(sp)
ffffffffc0203ef6:	6aa2                	ld	s5,8(sp)
ffffffffc0203ef8:	6121                	addi	sp,sp,64
ffffffffc0203efa:	8082                	ret
ffffffffc0203efc:	5575                	li	a0,-3
ffffffffc0203efe:	b7f5                	j	ffffffffc0203eea <mm_map+0x7c>
ffffffffc0203f00:	00006697          	auipc	a3,0x6
ffffffffc0203f04:	29868693          	addi	a3,a3,664 # ffffffffc020a198 <default_pmm_manager+0x7d0>
ffffffffc0203f08:	00005617          	auipc	a2,0x5
ffffffffc0203f0c:	37860613          	addi	a2,a2,888 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203f10:	0a700593          	li	a1,167
ffffffffc0203f14:	00006517          	auipc	a0,0x6
ffffffffc0203f18:	74c50513          	addi	a0,a0,1868 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0203f1c:	d68fc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203f20 <dup_mmap>:
ffffffffc0203f20:	7139                	addi	sp,sp,-64
ffffffffc0203f22:	fc06                	sd	ra,56(sp)
ffffffffc0203f24:	f822                	sd	s0,48(sp)
ffffffffc0203f26:	f426                	sd	s1,40(sp)
ffffffffc0203f28:	f04a                	sd	s2,32(sp)
ffffffffc0203f2a:	ec4e                	sd	s3,24(sp)
ffffffffc0203f2c:	e852                	sd	s4,16(sp)
ffffffffc0203f2e:	e456                	sd	s5,8(sp)
ffffffffc0203f30:	c535                	beqz	a0,ffffffffc0203f9c <dup_mmap+0x7c>
ffffffffc0203f32:	892a                	mv	s2,a0
ffffffffc0203f34:	84ae                	mv	s1,a1
ffffffffc0203f36:	842e                	mv	s0,a1
ffffffffc0203f38:	e59d                	bnez	a1,ffffffffc0203f66 <dup_mmap+0x46>
ffffffffc0203f3a:	a08d                	j	ffffffffc0203f9c <dup_mmap+0x7c>
ffffffffc0203f3c:	85aa                	mv	a1,a0
ffffffffc0203f3e:	0157b423          	sd	s5,8(a5) # 200008 <_binary_obj___user_matrix_out_size+0x1fd6d0>
ffffffffc0203f42:	854a                	mv	a0,s2
ffffffffc0203f44:	0147b823          	sd	s4,16(a5)
ffffffffc0203f48:	0137ac23          	sw	s3,24(a5)
ffffffffc0203f4c:	e03ff0ef          	jal	ra,ffffffffc0203d4e <insert_vma_struct>
ffffffffc0203f50:	ff043683          	ld	a3,-16(s0)
ffffffffc0203f54:	fe843603          	ld	a2,-24(s0)
ffffffffc0203f58:	6c8c                	ld	a1,24(s1)
ffffffffc0203f5a:	01893503          	ld	a0,24(s2)
ffffffffc0203f5e:	4701                	li	a4,0
ffffffffc0203f60:	dd7fe0ef          	jal	ra,ffffffffc0202d36 <copy_range>
ffffffffc0203f64:	e105                	bnez	a0,ffffffffc0203f84 <dup_mmap+0x64>
ffffffffc0203f66:	6000                	ld	s0,0(s0)
ffffffffc0203f68:	02848863          	beq	s1,s0,ffffffffc0203f98 <dup_mmap+0x78>
ffffffffc0203f6c:	03000513          	li	a0,48
ffffffffc0203f70:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203f74:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203f78:	ff842983          	lw	s3,-8(s0)
ffffffffc0203f7c:	bd1fd0ef          	jal	ra,ffffffffc0201b4c <kmalloc>
ffffffffc0203f80:	87aa                	mv	a5,a0
ffffffffc0203f82:	fd4d                	bnez	a0,ffffffffc0203f3c <dup_mmap+0x1c>
ffffffffc0203f84:	5571                	li	a0,-4
ffffffffc0203f86:	70e2                	ld	ra,56(sp)
ffffffffc0203f88:	7442                	ld	s0,48(sp)
ffffffffc0203f8a:	74a2                	ld	s1,40(sp)
ffffffffc0203f8c:	7902                	ld	s2,32(sp)
ffffffffc0203f8e:	69e2                	ld	s3,24(sp)
ffffffffc0203f90:	6a42                	ld	s4,16(sp)
ffffffffc0203f92:	6aa2                	ld	s5,8(sp)
ffffffffc0203f94:	6121                	addi	sp,sp,64
ffffffffc0203f96:	8082                	ret
ffffffffc0203f98:	4501                	li	a0,0
ffffffffc0203f9a:	b7f5                	j	ffffffffc0203f86 <dup_mmap+0x66>
ffffffffc0203f9c:	00006697          	auipc	a3,0x6
ffffffffc0203fa0:	79468693          	addi	a3,a3,1940 # ffffffffc020a730 <default_pmm_manager+0xd68>
ffffffffc0203fa4:	00005617          	auipc	a2,0x5
ffffffffc0203fa8:	2dc60613          	addi	a2,a2,732 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0203fac:	0c000593          	li	a1,192
ffffffffc0203fb0:	00006517          	auipc	a0,0x6
ffffffffc0203fb4:	6b050513          	addi	a0,a0,1712 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0203fb8:	cccfc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0203fbc <exit_mmap>:
ffffffffc0203fbc:	1101                	addi	sp,sp,-32
ffffffffc0203fbe:	ec06                	sd	ra,24(sp)
ffffffffc0203fc0:	e822                	sd	s0,16(sp)
ffffffffc0203fc2:	e426                	sd	s1,8(sp)
ffffffffc0203fc4:	e04a                	sd	s2,0(sp)
ffffffffc0203fc6:	c531                	beqz	a0,ffffffffc0204012 <exit_mmap+0x56>
ffffffffc0203fc8:	591c                	lw	a5,48(a0)
ffffffffc0203fca:	84aa                	mv	s1,a0
ffffffffc0203fcc:	e3b9                	bnez	a5,ffffffffc0204012 <exit_mmap+0x56>
ffffffffc0203fce:	6500                	ld	s0,8(a0)
ffffffffc0203fd0:	01853903          	ld	s2,24(a0)
ffffffffc0203fd4:	02850663          	beq	a0,s0,ffffffffc0204000 <exit_mmap+0x44>
ffffffffc0203fd8:	ff043603          	ld	a2,-16(s0)
ffffffffc0203fdc:	fe843583          	ld	a1,-24(s0)
ffffffffc0203fe0:	854a                	mv	a0,s2
ffffffffc0203fe2:	89afe0ef          	jal	ra,ffffffffc020207c <unmap_range>
ffffffffc0203fe6:	6400                	ld	s0,8(s0)
ffffffffc0203fe8:	fe8498e3          	bne	s1,s0,ffffffffc0203fd8 <exit_mmap+0x1c>
ffffffffc0203fec:	6400                	ld	s0,8(s0)
ffffffffc0203fee:	00848c63          	beq	s1,s0,ffffffffc0204006 <exit_mmap+0x4a>
ffffffffc0203ff2:	ff043603          	ld	a2,-16(s0)
ffffffffc0203ff6:	fe843583          	ld	a1,-24(s0)
ffffffffc0203ffa:	854a                	mv	a0,s2
ffffffffc0203ffc:	998fe0ef          	jal	ra,ffffffffc0202194 <exit_range>
ffffffffc0204000:	6400                	ld	s0,8(s0)
ffffffffc0204002:	fe8498e3          	bne	s1,s0,ffffffffc0203ff2 <exit_mmap+0x36>
ffffffffc0204006:	60e2                	ld	ra,24(sp)
ffffffffc0204008:	6442                	ld	s0,16(sp)
ffffffffc020400a:	64a2                	ld	s1,8(sp)
ffffffffc020400c:	6902                	ld	s2,0(sp)
ffffffffc020400e:	6105                	addi	sp,sp,32
ffffffffc0204010:	8082                	ret
ffffffffc0204012:	00006697          	auipc	a3,0x6
ffffffffc0204016:	73e68693          	addi	a3,a3,1854 # ffffffffc020a750 <default_pmm_manager+0xd88>
ffffffffc020401a:	00005617          	auipc	a2,0x5
ffffffffc020401e:	26660613          	addi	a2,a2,614 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0204022:	0d600593          	li	a1,214
ffffffffc0204026:	00006517          	auipc	a0,0x6
ffffffffc020402a:	63a50513          	addi	a0,a0,1594 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc020402e:	c56fc0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0204032 <vmm_init>:
ffffffffc0204032:	7139                	addi	sp,sp,-64
ffffffffc0204034:	f822                	sd	s0,48(sp)
ffffffffc0204036:	f426                	sd	s1,40(sp)
ffffffffc0204038:	fc06                	sd	ra,56(sp)
ffffffffc020403a:	f04a                	sd	s2,32(sp)
ffffffffc020403c:	ec4e                	sd	s3,24(sp)
ffffffffc020403e:	e852                	sd	s4,16(sp)
ffffffffc0204040:	e456                	sd	s5,8(sp)
ffffffffc0204042:	c55ff0ef          	jal	ra,ffffffffc0203c96 <mm_create>
ffffffffc0204046:	842a                	mv	s0,a0
ffffffffc0204048:	03200493          	li	s1,50
ffffffffc020404c:	e919                	bnez	a0,ffffffffc0204062 <vmm_init+0x30>
ffffffffc020404e:	aef9                	j	ffffffffc020442c <vmm_init+0x3fa>
ffffffffc0204050:	e504                	sd	s1,8(a0)
ffffffffc0204052:	e91c                	sd	a5,16(a0)
ffffffffc0204054:	00052c23          	sw	zero,24(a0)
ffffffffc0204058:	14ed                	addi	s1,s1,-5
ffffffffc020405a:	8522                	mv	a0,s0
ffffffffc020405c:	cf3ff0ef          	jal	ra,ffffffffc0203d4e <insert_vma_struct>
ffffffffc0204060:	c88d                	beqz	s1,ffffffffc0204092 <vmm_init+0x60>
ffffffffc0204062:	03000513          	li	a0,48
ffffffffc0204066:	ae7fd0ef          	jal	ra,ffffffffc0201b4c <kmalloc>
ffffffffc020406a:	85aa                	mv	a1,a0
ffffffffc020406c:	00248793          	addi	a5,s1,2
ffffffffc0204070:	f165                	bnez	a0,ffffffffc0204050 <vmm_init+0x1e>
ffffffffc0204072:	00006697          	auipc	a3,0x6
ffffffffc0204076:	15e68693          	addi	a3,a3,350 # ffffffffc020a1d0 <default_pmm_manager+0x808>
ffffffffc020407a:	00005617          	auipc	a2,0x5
ffffffffc020407e:	20660613          	addi	a2,a2,518 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0204082:	11300593          	li	a1,275
ffffffffc0204086:	00006517          	auipc	a0,0x6
ffffffffc020408a:	5da50513          	addi	a0,a0,1498 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc020408e:	bf6fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0204092:	03700493          	li	s1,55
ffffffffc0204096:	1f900913          	li	s2,505
ffffffffc020409a:	a819                	j	ffffffffc02040b0 <vmm_init+0x7e>
ffffffffc020409c:	e504                	sd	s1,8(a0)
ffffffffc020409e:	e91c                	sd	a5,16(a0)
ffffffffc02040a0:	00052c23          	sw	zero,24(a0)
ffffffffc02040a4:	0495                	addi	s1,s1,5
ffffffffc02040a6:	8522                	mv	a0,s0
ffffffffc02040a8:	ca7ff0ef          	jal	ra,ffffffffc0203d4e <insert_vma_struct>
ffffffffc02040ac:	03248a63          	beq	s1,s2,ffffffffc02040e0 <vmm_init+0xae>
ffffffffc02040b0:	03000513          	li	a0,48
ffffffffc02040b4:	a99fd0ef          	jal	ra,ffffffffc0201b4c <kmalloc>
ffffffffc02040b8:	85aa                	mv	a1,a0
ffffffffc02040ba:	00248793          	addi	a5,s1,2
ffffffffc02040be:	fd79                	bnez	a0,ffffffffc020409c <vmm_init+0x6a>
ffffffffc02040c0:	00006697          	auipc	a3,0x6
ffffffffc02040c4:	11068693          	addi	a3,a3,272 # ffffffffc020a1d0 <default_pmm_manager+0x808>
ffffffffc02040c8:	00005617          	auipc	a2,0x5
ffffffffc02040cc:	1b860613          	addi	a2,a2,440 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02040d0:	11900593          	li	a1,281
ffffffffc02040d4:	00006517          	auipc	a0,0x6
ffffffffc02040d8:	58c50513          	addi	a0,a0,1420 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc02040dc:	ba8fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02040e0:	6418                	ld	a4,8(s0)
ffffffffc02040e2:	479d                	li	a5,7
ffffffffc02040e4:	1fb00593          	li	a1,507
ffffffffc02040e8:	28e40263          	beq	s0,a4,ffffffffc020436c <vmm_init+0x33a>
ffffffffc02040ec:	fe873603          	ld	a2,-24(a4)
ffffffffc02040f0:	ffe78693          	addi	a3,a5,-2
ffffffffc02040f4:	1ed61c63          	bne	a2,a3,ffffffffc02042ec <vmm_init+0x2ba>
ffffffffc02040f8:	ff073683          	ld	a3,-16(a4)
ffffffffc02040fc:	1ed79863          	bne	a5,a3,ffffffffc02042ec <vmm_init+0x2ba>
ffffffffc0204100:	0795                	addi	a5,a5,5
ffffffffc0204102:	6718                	ld	a4,8(a4)
ffffffffc0204104:	feb792e3          	bne	a5,a1,ffffffffc02040e8 <vmm_init+0xb6>
ffffffffc0204108:	491d                	li	s2,7
ffffffffc020410a:	4495                	li	s1,5
ffffffffc020410c:	1f900a93          	li	s5,505
ffffffffc0204110:	85a6                	mv	a1,s1
ffffffffc0204112:	8522                	mv	a0,s0
ffffffffc0204114:	bfdff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc0204118:	8a2a                	mv	s4,a0
ffffffffc020411a:	2c050963          	beqz	a0,ffffffffc02043ec <vmm_init+0x3ba>
ffffffffc020411e:	00148593          	addi	a1,s1,1
ffffffffc0204122:	8522                	mv	a0,s0
ffffffffc0204124:	bedff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc0204128:	89aa                	mv	s3,a0
ffffffffc020412a:	2a050163          	beqz	a0,ffffffffc02043cc <vmm_init+0x39a>
ffffffffc020412e:	85ca                	mv	a1,s2
ffffffffc0204130:	8522                	mv	a0,s0
ffffffffc0204132:	bdfff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc0204136:	26051b63          	bnez	a0,ffffffffc02043ac <vmm_init+0x37a>
ffffffffc020413a:	00348593          	addi	a1,s1,3
ffffffffc020413e:	8522                	mv	a0,s0
ffffffffc0204140:	bd1ff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc0204144:	24051463          	bnez	a0,ffffffffc020438c <vmm_init+0x35a>
ffffffffc0204148:	00448593          	addi	a1,s1,4
ffffffffc020414c:	8522                	mv	a0,s0
ffffffffc020414e:	bc3ff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc0204152:	2a051d63          	bnez	a0,ffffffffc020440c <vmm_init+0x3da>
ffffffffc0204156:	008a3783          	ld	a5,8(s4)
ffffffffc020415a:	1a979963          	bne	a5,s1,ffffffffc020430c <vmm_init+0x2da>
ffffffffc020415e:	010a3783          	ld	a5,16(s4)
ffffffffc0204162:	1b279563          	bne	a5,s2,ffffffffc020430c <vmm_init+0x2da>
ffffffffc0204166:	0089b783          	ld	a5,8(s3)
ffffffffc020416a:	1c979163          	bne	a5,s1,ffffffffc020432c <vmm_init+0x2fa>
ffffffffc020416e:	0109b783          	ld	a5,16(s3)
ffffffffc0204172:	1b279d63          	bne	a5,s2,ffffffffc020432c <vmm_init+0x2fa>
ffffffffc0204176:	0495                	addi	s1,s1,5
ffffffffc0204178:	0915                	addi	s2,s2,5
ffffffffc020417a:	f9549be3          	bne	s1,s5,ffffffffc0204110 <vmm_init+0xde>
ffffffffc020417e:	4491                	li	s1,4
ffffffffc0204180:	597d                	li	s2,-1
ffffffffc0204182:	85a6                	mv	a1,s1
ffffffffc0204184:	8522                	mv	a0,s0
ffffffffc0204186:	b8bff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc020418a:	0004859b          	sext.w	a1,s1
ffffffffc020418e:	c90d                	beqz	a0,ffffffffc02041c0 <vmm_init+0x18e>
ffffffffc0204190:	6914                	ld	a3,16(a0)
ffffffffc0204192:	6510                	ld	a2,8(a0)
ffffffffc0204194:	00006517          	auipc	a0,0x6
ffffffffc0204198:	75450513          	addi	a0,a0,1876 # ffffffffc020a8e8 <default_pmm_manager+0xf20>
ffffffffc020419c:	ff7fb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02041a0:	00006697          	auipc	a3,0x6
ffffffffc02041a4:	77068693          	addi	a3,a3,1904 # ffffffffc020a910 <default_pmm_manager+0xf48>
ffffffffc02041a8:	00005617          	auipc	a2,0x5
ffffffffc02041ac:	0d860613          	addi	a2,a2,216 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02041b0:	13b00593          	li	a1,315
ffffffffc02041b4:	00006517          	auipc	a0,0x6
ffffffffc02041b8:	4ac50513          	addi	a0,a0,1196 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc02041bc:	ac8fc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02041c0:	14fd                	addi	s1,s1,-1
ffffffffc02041c2:	fd2490e3          	bne	s1,s2,ffffffffc0204182 <vmm_init+0x150>
ffffffffc02041c6:	8522                	mv	a0,s0
ffffffffc02041c8:	c55ff0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc02041cc:	00006517          	auipc	a0,0x6
ffffffffc02041d0:	75c50513          	addi	a0,a0,1884 # ffffffffc020a928 <default_pmm_manager+0xf60>
ffffffffc02041d4:	fbffb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02041d8:	c3bfd0ef          	jal	ra,ffffffffc0201e12 <nr_free_pages>
ffffffffc02041dc:	892a                	mv	s2,a0
ffffffffc02041de:	ab9ff0ef          	jal	ra,ffffffffc0203c96 <mm_create>
ffffffffc02041e2:	00039797          	auipc	a5,0x39
ffffffffc02041e6:	dca7bf23          	sd	a0,-546(a5) # ffffffffc023cfc0 <check_mm_struct>
ffffffffc02041ea:	842a                	mv	s0,a0
ffffffffc02041ec:	2a050063          	beqz	a0,ffffffffc020448c <vmm_init+0x45a>
ffffffffc02041f0:	00039797          	auipc	a5,0x39
ffffffffc02041f4:	c6878793          	addi	a5,a5,-920 # ffffffffc023ce58 <boot_pgdir>
ffffffffc02041f8:	6384                	ld	s1,0(a5)
ffffffffc02041fa:	609c                	ld	a5,0(s1)
ffffffffc02041fc:	ed04                	sd	s1,24(a0)
ffffffffc02041fe:	24079763          	bnez	a5,ffffffffc020444c <vmm_init+0x41a>
ffffffffc0204202:	03000513          	li	a0,48
ffffffffc0204206:	947fd0ef          	jal	ra,ffffffffc0201b4c <kmalloc>
ffffffffc020420a:	89aa                	mv	s3,a0
ffffffffc020420c:	14050063          	beqz	a0,ffffffffc020434c <vmm_init+0x31a>
ffffffffc0204210:	002007b7          	lui	a5,0x200
ffffffffc0204214:	00f9b823          	sd	a5,16(s3)
ffffffffc0204218:	4789                	li	a5,2
ffffffffc020421a:	85aa                	mv	a1,a0
ffffffffc020421c:	00f9ac23          	sw	a5,24(s3)
ffffffffc0204220:	8522                	mv	a0,s0
ffffffffc0204222:	0009b423          	sd	zero,8(s3)
ffffffffc0204226:	b29ff0ef          	jal	ra,ffffffffc0203d4e <insert_vma_struct>
ffffffffc020422a:	10000593          	li	a1,256
ffffffffc020422e:	8522                	mv	a0,s0
ffffffffc0204230:	ae1ff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc0204234:	10000793          	li	a5,256
ffffffffc0204238:	16400713          	li	a4,356
ffffffffc020423c:	26a99863          	bne	s3,a0,ffffffffc02044ac <vmm_init+0x47a>
ffffffffc0204240:	00f78023          	sb	a5,0(a5) # 200000 <_binary_obj___user_matrix_out_size+0x1fd6c8>
ffffffffc0204244:	0785                	addi	a5,a5,1
ffffffffc0204246:	fee79de3          	bne	a5,a4,ffffffffc0204240 <vmm_init+0x20e>
ffffffffc020424a:	6705                	lui	a4,0x1
ffffffffc020424c:	10000793          	li	a5,256
ffffffffc0204250:	35670713          	addi	a4,a4,854 # 1356 <_binary_obj___user_faultread_out_size-0xa02>
ffffffffc0204254:	16400613          	li	a2,356
ffffffffc0204258:	0007c683          	lbu	a3,0(a5)
ffffffffc020425c:	0785                	addi	a5,a5,1
ffffffffc020425e:	9f15                	subw	a4,a4,a3
ffffffffc0204260:	fec79ce3          	bne	a5,a2,ffffffffc0204258 <vmm_init+0x226>
ffffffffc0204264:	28071063          	bnez	a4,ffffffffc02044e4 <vmm_init+0x4b2>
ffffffffc0204268:	4581                	li	a1,0
ffffffffc020426a:	8526                	mv	a0,s1
ffffffffc020426c:	828fe0ef          	jal	ra,ffffffffc0202294 <page_remove>
ffffffffc0204270:	609c                	ld	a5,0(s1)
ffffffffc0204272:	00039717          	auipc	a4,0x39
ffffffffc0204276:	bee70713          	addi	a4,a4,-1042 # ffffffffc023ce60 <npage>
ffffffffc020427a:	6318                	ld	a4,0(a4)
ffffffffc020427c:	078a                	slli	a5,a5,0x2
ffffffffc020427e:	83b1                	srli	a5,a5,0xc
ffffffffc0204280:	24e7f663          	bgeu	a5,a4,ffffffffc02044cc <vmm_init+0x49a>
ffffffffc0204284:	00008717          	auipc	a4,0x8
ffffffffc0204288:	82c70713          	addi	a4,a4,-2004 # ffffffffc020bab0 <nbase>
ffffffffc020428c:	6318                	ld	a4,0(a4)
ffffffffc020428e:	00039697          	auipc	a3,0x39
ffffffffc0204292:	c5268693          	addi	a3,a3,-942 # ffffffffc023cee0 <pages>
ffffffffc0204296:	6288                	ld	a0,0(a3)
ffffffffc0204298:	8f99                	sub	a5,a5,a4
ffffffffc020429a:	079a                	slli	a5,a5,0x6
ffffffffc020429c:	953e                	add	a0,a0,a5
ffffffffc020429e:	4585                	li	a1,1
ffffffffc02042a0:	b2dfd0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc02042a4:	0004b023          	sd	zero,0(s1)
ffffffffc02042a8:	8522                	mv	a0,s0
ffffffffc02042aa:	00043c23          	sd	zero,24(s0)
ffffffffc02042ae:	b6fff0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc02042b2:	197d                	addi	s2,s2,-1
ffffffffc02042b4:	00039797          	auipc	a5,0x39
ffffffffc02042b8:	d007b623          	sd	zero,-756(a5) # ffffffffc023cfc0 <check_mm_struct>
ffffffffc02042bc:	b57fd0ef          	jal	ra,ffffffffc0201e12 <nr_free_pages>
ffffffffc02042c0:	1aa91663          	bne	s2,a0,ffffffffc020446c <vmm_init+0x43a>
ffffffffc02042c4:	00006517          	auipc	a0,0x6
ffffffffc02042c8:	6f450513          	addi	a0,a0,1780 # ffffffffc020a9b8 <default_pmm_manager+0xff0>
ffffffffc02042cc:	ec7fb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02042d0:	7442                	ld	s0,48(sp)
ffffffffc02042d2:	70e2                	ld	ra,56(sp)
ffffffffc02042d4:	74a2                	ld	s1,40(sp)
ffffffffc02042d6:	7902                	ld	s2,32(sp)
ffffffffc02042d8:	69e2                	ld	s3,24(sp)
ffffffffc02042da:	6a42                	ld	s4,16(sp)
ffffffffc02042dc:	6aa2                	ld	s5,8(sp)
ffffffffc02042de:	00006517          	auipc	a0,0x6
ffffffffc02042e2:	6fa50513          	addi	a0,a0,1786 # ffffffffc020a9d8 <default_pmm_manager+0x1010>
ffffffffc02042e6:	6121                	addi	sp,sp,64
ffffffffc02042e8:	eabfb06f          	j	ffffffffc0200192 <cprintf>
ffffffffc02042ec:	00006697          	auipc	a3,0x6
ffffffffc02042f0:	51468693          	addi	a3,a3,1300 # ffffffffc020a800 <default_pmm_manager+0xe38>
ffffffffc02042f4:	00005617          	auipc	a2,0x5
ffffffffc02042f8:	f8c60613          	addi	a2,a2,-116 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02042fc:	12200593          	li	a1,290
ffffffffc0204300:	00006517          	auipc	a0,0x6
ffffffffc0204304:	36050513          	addi	a0,a0,864 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204308:	97cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020430c:	00006697          	auipc	a3,0x6
ffffffffc0204310:	57c68693          	addi	a3,a3,1404 # ffffffffc020a888 <default_pmm_manager+0xec0>
ffffffffc0204314:	00005617          	auipc	a2,0x5
ffffffffc0204318:	f6c60613          	addi	a2,a2,-148 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020431c:	13200593          	li	a1,306
ffffffffc0204320:	00006517          	auipc	a0,0x6
ffffffffc0204324:	34050513          	addi	a0,a0,832 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204328:	95cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020432c:	00006697          	auipc	a3,0x6
ffffffffc0204330:	58c68693          	addi	a3,a3,1420 # ffffffffc020a8b8 <default_pmm_manager+0xef0>
ffffffffc0204334:	00005617          	auipc	a2,0x5
ffffffffc0204338:	f4c60613          	addi	a2,a2,-180 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020433c:	13300593          	li	a1,307
ffffffffc0204340:	00006517          	auipc	a0,0x6
ffffffffc0204344:	32050513          	addi	a0,a0,800 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204348:	93cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020434c:	00006697          	auipc	a3,0x6
ffffffffc0204350:	e8468693          	addi	a3,a3,-380 # ffffffffc020a1d0 <default_pmm_manager+0x808>
ffffffffc0204354:	00005617          	auipc	a2,0x5
ffffffffc0204358:	f2c60613          	addi	a2,a2,-212 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020435c:	15200593          	li	a1,338
ffffffffc0204360:	00006517          	auipc	a0,0x6
ffffffffc0204364:	30050513          	addi	a0,a0,768 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204368:	91cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020436c:	00006697          	auipc	a3,0x6
ffffffffc0204370:	47c68693          	addi	a3,a3,1148 # ffffffffc020a7e8 <default_pmm_manager+0xe20>
ffffffffc0204374:	00005617          	auipc	a2,0x5
ffffffffc0204378:	f0c60613          	addi	a2,a2,-244 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020437c:	12000593          	li	a1,288
ffffffffc0204380:	00006517          	auipc	a0,0x6
ffffffffc0204384:	2e050513          	addi	a0,a0,736 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204388:	8fcfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020438c:	00006697          	auipc	a3,0x6
ffffffffc0204390:	4dc68693          	addi	a3,a3,1244 # ffffffffc020a868 <default_pmm_manager+0xea0>
ffffffffc0204394:	00005617          	auipc	a2,0x5
ffffffffc0204398:	eec60613          	addi	a2,a2,-276 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020439c:	12e00593          	li	a1,302
ffffffffc02043a0:	00006517          	auipc	a0,0x6
ffffffffc02043a4:	2c050513          	addi	a0,a0,704 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc02043a8:	8dcfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02043ac:	00006697          	auipc	a3,0x6
ffffffffc02043b0:	4ac68693          	addi	a3,a3,1196 # ffffffffc020a858 <default_pmm_manager+0xe90>
ffffffffc02043b4:	00005617          	auipc	a2,0x5
ffffffffc02043b8:	ecc60613          	addi	a2,a2,-308 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02043bc:	12c00593          	li	a1,300
ffffffffc02043c0:	00006517          	auipc	a0,0x6
ffffffffc02043c4:	2a050513          	addi	a0,a0,672 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc02043c8:	8bcfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02043cc:	00006697          	auipc	a3,0x6
ffffffffc02043d0:	47c68693          	addi	a3,a3,1148 # ffffffffc020a848 <default_pmm_manager+0xe80>
ffffffffc02043d4:	00005617          	auipc	a2,0x5
ffffffffc02043d8:	eac60613          	addi	a2,a2,-340 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02043dc:	12a00593          	li	a1,298
ffffffffc02043e0:	00006517          	auipc	a0,0x6
ffffffffc02043e4:	28050513          	addi	a0,a0,640 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc02043e8:	89cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02043ec:	00006697          	auipc	a3,0x6
ffffffffc02043f0:	44c68693          	addi	a3,a3,1100 # ffffffffc020a838 <default_pmm_manager+0xe70>
ffffffffc02043f4:	00005617          	auipc	a2,0x5
ffffffffc02043f8:	e8c60613          	addi	a2,a2,-372 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02043fc:	12800593          	li	a1,296
ffffffffc0204400:	00006517          	auipc	a0,0x6
ffffffffc0204404:	26050513          	addi	a0,a0,608 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204408:	87cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020440c:	00006697          	auipc	a3,0x6
ffffffffc0204410:	46c68693          	addi	a3,a3,1132 # ffffffffc020a878 <default_pmm_manager+0xeb0>
ffffffffc0204414:	00005617          	auipc	a2,0x5
ffffffffc0204418:	e6c60613          	addi	a2,a2,-404 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020441c:	13000593          	li	a1,304
ffffffffc0204420:	00006517          	auipc	a0,0x6
ffffffffc0204424:	24050513          	addi	a0,a0,576 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204428:	85cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020442c:	00006697          	auipc	a3,0x6
ffffffffc0204430:	d6c68693          	addi	a3,a3,-660 # ffffffffc020a198 <default_pmm_manager+0x7d0>
ffffffffc0204434:	00005617          	auipc	a2,0x5
ffffffffc0204438:	e4c60613          	addi	a2,a2,-436 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020443c:	10c00593          	li	a1,268
ffffffffc0204440:	00006517          	auipc	a0,0x6
ffffffffc0204444:	22050513          	addi	a0,a0,544 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204448:	83cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020444c:	00006697          	auipc	a3,0x6
ffffffffc0204450:	d7468693          	addi	a3,a3,-652 # ffffffffc020a1c0 <default_pmm_manager+0x7f8>
ffffffffc0204454:	00005617          	auipc	a2,0x5
ffffffffc0204458:	e2c60613          	addi	a2,a2,-468 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020445c:	14f00593          	li	a1,335
ffffffffc0204460:	00006517          	auipc	a0,0x6
ffffffffc0204464:	20050513          	addi	a0,a0,512 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204468:	81cfc0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020446c:	00006697          	auipc	a3,0x6
ffffffffc0204470:	52468693          	addi	a3,a3,1316 # ffffffffc020a990 <default_pmm_manager+0xfc8>
ffffffffc0204474:	00005617          	auipc	a2,0x5
ffffffffc0204478:	e0c60613          	addi	a2,a2,-500 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020447c:	16e00593          	li	a1,366
ffffffffc0204480:	00006517          	auipc	a0,0x6
ffffffffc0204484:	1e050513          	addi	a0,a0,480 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204488:	ffdfb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020448c:	00006697          	auipc	a3,0x6
ffffffffc0204490:	4bc68693          	addi	a3,a3,1212 # ffffffffc020a948 <default_pmm_manager+0xf80>
ffffffffc0204494:	00005617          	auipc	a2,0x5
ffffffffc0204498:	dec60613          	addi	a2,a2,-532 # ffffffffc0209280 <commands+0x4c0>
ffffffffc020449c:	14b00593          	li	a1,331
ffffffffc02044a0:	00006517          	auipc	a0,0x6
ffffffffc02044a4:	1c050513          	addi	a0,a0,448 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc02044a8:	fddfb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02044ac:	00006697          	auipc	a3,0x6
ffffffffc02044b0:	4b468693          	addi	a3,a3,1204 # ffffffffc020a960 <default_pmm_manager+0xf98>
ffffffffc02044b4:	00005617          	auipc	a2,0x5
ffffffffc02044b8:	dcc60613          	addi	a2,a2,-564 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02044bc:	15700593          	li	a1,343
ffffffffc02044c0:	00006517          	auipc	a0,0x6
ffffffffc02044c4:	1a050513          	addi	a0,a0,416 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc02044c8:	fbdfb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02044cc:	00005617          	auipc	a2,0x5
ffffffffc02044d0:	5ac60613          	addi	a2,a2,1452 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc02044d4:	06200593          	li	a1,98
ffffffffc02044d8:	00005517          	auipc	a0,0x5
ffffffffc02044dc:	56850513          	addi	a0,a0,1384 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc02044e0:	fa5fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02044e4:	00006697          	auipc	a3,0x6
ffffffffc02044e8:	49c68693          	addi	a3,a3,1180 # ffffffffc020a980 <default_pmm_manager+0xfb8>
ffffffffc02044ec:	00005617          	auipc	a2,0x5
ffffffffc02044f0:	d9460613          	addi	a2,a2,-620 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02044f4:	16300593          	li	a1,355
ffffffffc02044f8:	00006517          	auipc	a0,0x6
ffffffffc02044fc:	16850513          	addi	a0,a0,360 # ffffffffc020a660 <default_pmm_manager+0xc98>
ffffffffc0204500:	f85fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0204504 <do_pgfault>:
ffffffffc0204504:	7139                	addi	sp,sp,-64
ffffffffc0204506:	85b2                	mv	a1,a2
ffffffffc0204508:	f822                	sd	s0,48(sp)
ffffffffc020450a:	f426                	sd	s1,40(sp)
ffffffffc020450c:	fc06                	sd	ra,56(sp)
ffffffffc020450e:	f04a                	sd	s2,32(sp)
ffffffffc0204510:	ec4e                	sd	s3,24(sp)
ffffffffc0204512:	8432                	mv	s0,a2
ffffffffc0204514:	84aa                	mv	s1,a0
ffffffffc0204516:	ffaff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc020451a:	00039797          	auipc	a5,0x39
ffffffffc020451e:	95a78793          	addi	a5,a5,-1702 # ffffffffc023ce74 <pgfault_num>
ffffffffc0204522:	439c                	lw	a5,0(a5)
ffffffffc0204524:	2785                	addiw	a5,a5,1
ffffffffc0204526:	00039717          	auipc	a4,0x39
ffffffffc020452a:	94f72723          	sw	a5,-1714(a4) # ffffffffc023ce74 <pgfault_num>
ffffffffc020452e:	c555                	beqz	a0,ffffffffc02045da <do_pgfault+0xd6>
ffffffffc0204530:	651c                	ld	a5,8(a0)
ffffffffc0204532:	0af46463          	bltu	s0,a5,ffffffffc02045da <do_pgfault+0xd6>
ffffffffc0204536:	4d1c                	lw	a5,24(a0)
ffffffffc0204538:	49c1                	li	s3,16
ffffffffc020453a:	8b89                	andi	a5,a5,2
ffffffffc020453c:	e3a5                	bnez	a5,ffffffffc020459c <do_pgfault+0x98>
ffffffffc020453e:	767d                	lui	a2,0xfffff
ffffffffc0204540:	6c88                	ld	a0,24(s1)
ffffffffc0204542:	8c71                	and	s0,s0,a2
ffffffffc0204544:	85a2                	mv	a1,s0
ffffffffc0204546:	4605                	li	a2,1
ffffffffc0204548:	90bfd0ef          	jal	ra,ffffffffc0201e52 <get_pte>
ffffffffc020454c:	c945                	beqz	a0,ffffffffc02045fc <do_pgfault+0xf8>
ffffffffc020454e:	610c                	ld	a1,0(a0)
ffffffffc0204550:	c5b5                	beqz	a1,ffffffffc02045bc <do_pgfault+0xb8>
ffffffffc0204552:	00039797          	auipc	a5,0x39
ffffffffc0204556:	91e78793          	addi	a5,a5,-1762 # ffffffffc023ce70 <swap_init_ok>
ffffffffc020455a:	439c                	lw	a5,0(a5)
ffffffffc020455c:	2781                	sext.w	a5,a5
ffffffffc020455e:	c7d9                	beqz	a5,ffffffffc02045ec <do_pgfault+0xe8>
ffffffffc0204560:	0030                	addi	a2,sp,8
ffffffffc0204562:	85a2                	mv	a1,s0
ffffffffc0204564:	8526                	mv	a0,s1
ffffffffc0204566:	e402                	sd	zero,8(sp)
ffffffffc0204568:	aa8ff0ef          	jal	ra,ffffffffc0203810 <swap_in>
ffffffffc020456c:	892a                	mv	s2,a0
ffffffffc020456e:	e90d                	bnez	a0,ffffffffc02045a0 <do_pgfault+0x9c>
ffffffffc0204570:	65a2                	ld	a1,8(sp)
ffffffffc0204572:	6c88                	ld	a0,24(s1)
ffffffffc0204574:	86ce                	mv	a3,s3
ffffffffc0204576:	8622                	mv	a2,s0
ffffffffc0204578:	d91fd0ef          	jal	ra,ffffffffc0202308 <page_insert>
ffffffffc020457c:	6622                	ld	a2,8(sp)
ffffffffc020457e:	4685                	li	a3,1
ffffffffc0204580:	85a2                	mv	a1,s0
ffffffffc0204582:	8526                	mv	a0,s1
ffffffffc0204584:	968ff0ef          	jal	ra,ffffffffc02036ec <swap_map_swappable>
ffffffffc0204588:	67a2                	ld	a5,8(sp)
ffffffffc020458a:	ff80                	sd	s0,56(a5)
ffffffffc020458c:	70e2                	ld	ra,56(sp)
ffffffffc020458e:	7442                	ld	s0,48(sp)
ffffffffc0204590:	854a                	mv	a0,s2
ffffffffc0204592:	74a2                	ld	s1,40(sp)
ffffffffc0204594:	7902                	ld	s2,32(sp)
ffffffffc0204596:	69e2                	ld	s3,24(sp)
ffffffffc0204598:	6121                	addi	sp,sp,64
ffffffffc020459a:	8082                	ret
ffffffffc020459c:	49dd                	li	s3,23
ffffffffc020459e:	b745                	j	ffffffffc020453e <do_pgfault+0x3a>
ffffffffc02045a0:	00006517          	auipc	a0,0x6
ffffffffc02045a4:	14850513          	addi	a0,a0,328 # ffffffffc020a6e8 <default_pmm_manager+0xd20>
ffffffffc02045a8:	bebfb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02045ac:	70e2                	ld	ra,56(sp)
ffffffffc02045ae:	7442                	ld	s0,48(sp)
ffffffffc02045b0:	854a                	mv	a0,s2
ffffffffc02045b2:	74a2                	ld	s1,40(sp)
ffffffffc02045b4:	7902                	ld	s2,32(sp)
ffffffffc02045b6:	69e2                	ld	s3,24(sp)
ffffffffc02045b8:	6121                	addi	sp,sp,64
ffffffffc02045ba:	8082                	ret
ffffffffc02045bc:	6c88                	ld	a0,24(s1)
ffffffffc02045be:	864e                	mv	a2,s3
ffffffffc02045c0:	85a2                	mv	a1,s0
ffffffffc02045c2:	9affe0ef          	jal	ra,ffffffffc0202f70 <pgdir_alloc_page>
ffffffffc02045c6:	4901                	li	s2,0
ffffffffc02045c8:	f171                	bnez	a0,ffffffffc020458c <do_pgfault+0x88>
ffffffffc02045ca:	00006517          	auipc	a0,0x6
ffffffffc02045ce:	0f650513          	addi	a0,a0,246 # ffffffffc020a6c0 <default_pmm_manager+0xcf8>
ffffffffc02045d2:	bc1fb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02045d6:	5971                	li	s2,-4
ffffffffc02045d8:	bf55                	j	ffffffffc020458c <do_pgfault+0x88>
ffffffffc02045da:	85a2                	mv	a1,s0
ffffffffc02045dc:	00006517          	auipc	a0,0x6
ffffffffc02045e0:	09450513          	addi	a0,a0,148 # ffffffffc020a670 <default_pmm_manager+0xca8>
ffffffffc02045e4:	baffb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02045e8:	5975                	li	s2,-3
ffffffffc02045ea:	b74d                	j	ffffffffc020458c <do_pgfault+0x88>
ffffffffc02045ec:	00006517          	auipc	a0,0x6
ffffffffc02045f0:	11c50513          	addi	a0,a0,284 # ffffffffc020a708 <default_pmm_manager+0xd40>
ffffffffc02045f4:	b9ffb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02045f8:	5971                	li	s2,-4
ffffffffc02045fa:	bf49                	j	ffffffffc020458c <do_pgfault+0x88>
ffffffffc02045fc:	00006517          	auipc	a0,0x6
ffffffffc0204600:	0a450513          	addi	a0,a0,164 # ffffffffc020a6a0 <default_pmm_manager+0xcd8>
ffffffffc0204604:	b8ffb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0204608:	5971                	li	s2,-4
ffffffffc020460a:	b749                	j	ffffffffc020458c <do_pgfault+0x88>

ffffffffc020460c <user_mem_check>:
ffffffffc020460c:	7179                	addi	sp,sp,-48
ffffffffc020460e:	f022                	sd	s0,32(sp)
ffffffffc0204610:	f406                	sd	ra,40(sp)
ffffffffc0204612:	ec26                	sd	s1,24(sp)
ffffffffc0204614:	e84a                	sd	s2,16(sp)
ffffffffc0204616:	e44e                	sd	s3,8(sp)
ffffffffc0204618:	e052                	sd	s4,0(sp)
ffffffffc020461a:	842e                	mv	s0,a1
ffffffffc020461c:	c135                	beqz	a0,ffffffffc0204680 <user_mem_check+0x74>
ffffffffc020461e:	002007b7          	lui	a5,0x200
ffffffffc0204622:	04f5e663          	bltu	a1,a5,ffffffffc020466e <user_mem_check+0x62>
ffffffffc0204626:	00c584b3          	add	s1,a1,a2
ffffffffc020462a:	0495f263          	bgeu	a1,s1,ffffffffc020466e <user_mem_check+0x62>
ffffffffc020462e:	4785                	li	a5,1
ffffffffc0204630:	07fe                	slli	a5,a5,0x1f
ffffffffc0204632:	0297ee63          	bltu	a5,s1,ffffffffc020466e <user_mem_check+0x62>
ffffffffc0204636:	892a                	mv	s2,a0
ffffffffc0204638:	89b6                	mv	s3,a3
ffffffffc020463a:	6a05                	lui	s4,0x1
ffffffffc020463c:	a821                	j	ffffffffc0204654 <user_mem_check+0x48>
ffffffffc020463e:	0027f693          	andi	a3,a5,2
ffffffffc0204642:	9752                	add	a4,a4,s4
ffffffffc0204644:	8ba1                	andi	a5,a5,8
ffffffffc0204646:	c685                	beqz	a3,ffffffffc020466e <user_mem_check+0x62>
ffffffffc0204648:	c399                	beqz	a5,ffffffffc020464e <user_mem_check+0x42>
ffffffffc020464a:	02e46263          	bltu	s0,a4,ffffffffc020466e <user_mem_check+0x62>
ffffffffc020464e:	6900                	ld	s0,16(a0)
ffffffffc0204650:	04947663          	bgeu	s0,s1,ffffffffc020469c <user_mem_check+0x90>
ffffffffc0204654:	85a2                	mv	a1,s0
ffffffffc0204656:	854a                	mv	a0,s2
ffffffffc0204658:	eb8ff0ef          	jal	ra,ffffffffc0203d10 <find_vma>
ffffffffc020465c:	c909                	beqz	a0,ffffffffc020466e <user_mem_check+0x62>
ffffffffc020465e:	6518                	ld	a4,8(a0)
ffffffffc0204660:	00e46763          	bltu	s0,a4,ffffffffc020466e <user_mem_check+0x62>
ffffffffc0204664:	4d1c                	lw	a5,24(a0)
ffffffffc0204666:	fc099ce3          	bnez	s3,ffffffffc020463e <user_mem_check+0x32>
ffffffffc020466a:	8b85                	andi	a5,a5,1
ffffffffc020466c:	f3ed                	bnez	a5,ffffffffc020464e <user_mem_check+0x42>
ffffffffc020466e:	4501                	li	a0,0
ffffffffc0204670:	70a2                	ld	ra,40(sp)
ffffffffc0204672:	7402                	ld	s0,32(sp)
ffffffffc0204674:	64e2                	ld	s1,24(sp)
ffffffffc0204676:	6942                	ld	s2,16(sp)
ffffffffc0204678:	69a2                	ld	s3,8(sp)
ffffffffc020467a:	6a02                	ld	s4,0(sp)
ffffffffc020467c:	6145                	addi	sp,sp,48
ffffffffc020467e:	8082                	ret
ffffffffc0204680:	c02007b7          	lui	a5,0xc0200
ffffffffc0204684:	4501                	li	a0,0
ffffffffc0204686:	fef5e5e3          	bltu	a1,a5,ffffffffc0204670 <user_mem_check+0x64>
ffffffffc020468a:	962e                	add	a2,a2,a1
ffffffffc020468c:	fec5f2e3          	bgeu	a1,a2,ffffffffc0204670 <user_mem_check+0x64>
ffffffffc0204690:	c8000537          	lui	a0,0xc8000
ffffffffc0204694:	0505                	addi	a0,a0,1
ffffffffc0204696:	00a63533          	sltu	a0,a2,a0
ffffffffc020469a:	bfd9                	j	ffffffffc0204670 <user_mem_check+0x64>
ffffffffc020469c:	4505                	li	a0,1
ffffffffc020469e:	bfc9                	j	ffffffffc0204670 <user_mem_check+0x64>

ffffffffc02046a0 <swapfs_init>:
ffffffffc02046a0:	1141                	addi	sp,sp,-16
ffffffffc02046a2:	4505                	li	a0,1
ffffffffc02046a4:	e406                	sd	ra,8(sp)
ffffffffc02046a6:	f49fb0ef          	jal	ra,ffffffffc02005ee <ide_device_valid>
ffffffffc02046aa:	cd01                	beqz	a0,ffffffffc02046c2 <swapfs_init+0x22>
ffffffffc02046ac:	4505                	li	a0,1
ffffffffc02046ae:	f47fb0ef          	jal	ra,ffffffffc02005f4 <ide_device_size>
ffffffffc02046b2:	60a2                	ld	ra,8(sp)
ffffffffc02046b4:	810d                	srli	a0,a0,0x3
ffffffffc02046b6:	00039797          	auipc	a5,0x39
ffffffffc02046ba:	8aa7bd23          	sd	a0,-1862(a5) # ffffffffc023cf70 <max_swap_offset>
ffffffffc02046be:	0141                	addi	sp,sp,16
ffffffffc02046c0:	8082                	ret
ffffffffc02046c2:	00006617          	auipc	a2,0x6
ffffffffc02046c6:	32e60613          	addi	a2,a2,814 # ffffffffc020a9f0 <default_pmm_manager+0x1028>
ffffffffc02046ca:	45b5                	li	a1,13
ffffffffc02046cc:	00006517          	auipc	a0,0x6
ffffffffc02046d0:	34450513          	addi	a0,a0,836 # ffffffffc020aa10 <default_pmm_manager+0x1048>
ffffffffc02046d4:	db1fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02046d8 <swapfs_read>:
ffffffffc02046d8:	1141                	addi	sp,sp,-16
ffffffffc02046da:	e406                	sd	ra,8(sp)
ffffffffc02046dc:	00855793          	srli	a5,a0,0x8
ffffffffc02046e0:	cfb9                	beqz	a5,ffffffffc020473e <swapfs_read+0x66>
ffffffffc02046e2:	00039717          	auipc	a4,0x39
ffffffffc02046e6:	88e70713          	addi	a4,a4,-1906 # ffffffffc023cf70 <max_swap_offset>
ffffffffc02046ea:	6318                	ld	a4,0(a4)
ffffffffc02046ec:	04e7f963          	bgeu	a5,a4,ffffffffc020473e <swapfs_read+0x66>
ffffffffc02046f0:	00038717          	auipc	a4,0x38
ffffffffc02046f4:	7f070713          	addi	a4,a4,2032 # ffffffffc023cee0 <pages>
ffffffffc02046f8:	6310                	ld	a2,0(a4)
ffffffffc02046fa:	00007717          	auipc	a4,0x7
ffffffffc02046fe:	3b670713          	addi	a4,a4,950 # ffffffffc020bab0 <nbase>
ffffffffc0204702:	40c58633          	sub	a2,a1,a2
ffffffffc0204706:	630c                	ld	a1,0(a4)
ffffffffc0204708:	8619                	srai	a2,a2,0x6
ffffffffc020470a:	00038717          	auipc	a4,0x38
ffffffffc020470e:	75670713          	addi	a4,a4,1878 # ffffffffc023ce60 <npage>
ffffffffc0204712:	962e                	add	a2,a2,a1
ffffffffc0204714:	6314                	ld	a3,0(a4)
ffffffffc0204716:	00c61713          	slli	a4,a2,0xc
ffffffffc020471a:	8331                	srli	a4,a4,0xc
ffffffffc020471c:	0037959b          	slliw	a1,a5,0x3
ffffffffc0204720:	0632                	slli	a2,a2,0xc
ffffffffc0204722:	02d77a63          	bgeu	a4,a3,ffffffffc0204756 <swapfs_read+0x7e>
ffffffffc0204726:	00038797          	auipc	a5,0x38
ffffffffc020472a:	7aa78793          	addi	a5,a5,1962 # ffffffffc023ced0 <va_pa_offset>
ffffffffc020472e:	639c                	ld	a5,0(a5)
ffffffffc0204730:	60a2                	ld	ra,8(sp)
ffffffffc0204732:	46a1                	li	a3,8
ffffffffc0204734:	963e                	add	a2,a2,a5
ffffffffc0204736:	4505                	li	a0,1
ffffffffc0204738:	0141                	addi	sp,sp,16
ffffffffc020473a:	ec1fb06f          	j	ffffffffc02005fa <ide_read_secs>
ffffffffc020473e:	86aa                	mv	a3,a0
ffffffffc0204740:	00006617          	auipc	a2,0x6
ffffffffc0204744:	2e860613          	addi	a2,a2,744 # ffffffffc020aa28 <default_pmm_manager+0x1060>
ffffffffc0204748:	45d1                	li	a1,20
ffffffffc020474a:	00006517          	auipc	a0,0x6
ffffffffc020474e:	2c650513          	addi	a0,a0,710 # ffffffffc020aa10 <default_pmm_manager+0x1048>
ffffffffc0204752:	d33fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0204756:	86b2                	mv	a3,a2
ffffffffc0204758:	06900593          	li	a1,105
ffffffffc020475c:	00005617          	auipc	a2,0x5
ffffffffc0204760:	2bc60613          	addi	a2,a2,700 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0204764:	00005517          	auipc	a0,0x5
ffffffffc0204768:	2dc50513          	addi	a0,a0,732 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc020476c:	d19fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0204770 <swapfs_write>:
ffffffffc0204770:	1141                	addi	sp,sp,-16
ffffffffc0204772:	e406                	sd	ra,8(sp)
ffffffffc0204774:	00855793          	srli	a5,a0,0x8
ffffffffc0204778:	cfb9                	beqz	a5,ffffffffc02047d6 <swapfs_write+0x66>
ffffffffc020477a:	00038717          	auipc	a4,0x38
ffffffffc020477e:	7f670713          	addi	a4,a4,2038 # ffffffffc023cf70 <max_swap_offset>
ffffffffc0204782:	6318                	ld	a4,0(a4)
ffffffffc0204784:	04e7f963          	bgeu	a5,a4,ffffffffc02047d6 <swapfs_write+0x66>
ffffffffc0204788:	00038717          	auipc	a4,0x38
ffffffffc020478c:	75870713          	addi	a4,a4,1880 # ffffffffc023cee0 <pages>
ffffffffc0204790:	6310                	ld	a2,0(a4)
ffffffffc0204792:	00007717          	auipc	a4,0x7
ffffffffc0204796:	31e70713          	addi	a4,a4,798 # ffffffffc020bab0 <nbase>
ffffffffc020479a:	40c58633          	sub	a2,a1,a2
ffffffffc020479e:	630c                	ld	a1,0(a4)
ffffffffc02047a0:	8619                	srai	a2,a2,0x6
ffffffffc02047a2:	00038717          	auipc	a4,0x38
ffffffffc02047a6:	6be70713          	addi	a4,a4,1726 # ffffffffc023ce60 <npage>
ffffffffc02047aa:	962e                	add	a2,a2,a1
ffffffffc02047ac:	6314                	ld	a3,0(a4)
ffffffffc02047ae:	00c61713          	slli	a4,a2,0xc
ffffffffc02047b2:	8331                	srli	a4,a4,0xc
ffffffffc02047b4:	0037959b          	slliw	a1,a5,0x3
ffffffffc02047b8:	0632                	slli	a2,a2,0xc
ffffffffc02047ba:	02d77a63          	bgeu	a4,a3,ffffffffc02047ee <swapfs_write+0x7e>
ffffffffc02047be:	00038797          	auipc	a5,0x38
ffffffffc02047c2:	71278793          	addi	a5,a5,1810 # ffffffffc023ced0 <va_pa_offset>
ffffffffc02047c6:	639c                	ld	a5,0(a5)
ffffffffc02047c8:	60a2                	ld	ra,8(sp)
ffffffffc02047ca:	46a1                	li	a3,8
ffffffffc02047cc:	963e                	add	a2,a2,a5
ffffffffc02047ce:	4505                	li	a0,1
ffffffffc02047d0:	0141                	addi	sp,sp,16
ffffffffc02047d2:	e4dfb06f          	j	ffffffffc020061e <ide_write_secs>
ffffffffc02047d6:	86aa                	mv	a3,a0
ffffffffc02047d8:	00006617          	auipc	a2,0x6
ffffffffc02047dc:	25060613          	addi	a2,a2,592 # ffffffffc020aa28 <default_pmm_manager+0x1060>
ffffffffc02047e0:	45e5                	li	a1,25
ffffffffc02047e2:	00006517          	auipc	a0,0x6
ffffffffc02047e6:	22e50513          	addi	a0,a0,558 # ffffffffc020aa10 <default_pmm_manager+0x1048>
ffffffffc02047ea:	c9bfb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02047ee:	86b2                	mv	a3,a2
ffffffffc02047f0:	06900593          	li	a1,105
ffffffffc02047f4:	00005617          	auipc	a2,0x5
ffffffffc02047f8:	22460613          	addi	a2,a2,548 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc02047fc:	00005517          	auipc	a0,0x5
ffffffffc0204800:	24450513          	addi	a0,a0,580 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0204804:	c81fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0204808 <kernel_thread_entry>:
ffffffffc0204808:	8526                	mv	a0,s1
ffffffffc020480a:	9402                	jalr	s0
ffffffffc020480c:	74c000ef          	jal	ra,ffffffffc0204f58 <do_exit>

ffffffffc0204810 <alloc_proc>:
ffffffffc0204810:	1141                	addi	sp,sp,-16
ffffffffc0204812:	14800513          	li	a0,328
ffffffffc0204816:	e022                	sd	s0,0(sp)
ffffffffc0204818:	e406                	sd	ra,8(sp)
ffffffffc020481a:	b32fd0ef          	jal	ra,ffffffffc0201b4c <kmalloc>
ffffffffc020481e:	842a                	mv	s0,a0
ffffffffc0204820:	c52d                	beqz	a0,ffffffffc020488a <alloc_proc+0x7a>
ffffffffc0204822:	57fd                	li	a5,-1
ffffffffc0204824:	1782                	slli	a5,a5,0x20
ffffffffc0204826:	e11c                	sd	a5,0(a0)
ffffffffc0204828:	07000613          	li	a2,112
ffffffffc020482c:	4581                	li	a1,0
ffffffffc020482e:	00052423          	sw	zero,8(a0)
ffffffffc0204832:	00053823          	sd	zero,16(a0)
ffffffffc0204836:	00053c23          	sd	zero,24(a0)
ffffffffc020483a:	02053023          	sd	zero,32(a0)
ffffffffc020483e:	02053423          	sd	zero,40(a0)
ffffffffc0204842:	03050513          	addi	a0,a0,48
ffffffffc0204846:	41e040ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc020484a:	00038797          	auipc	a5,0x38
ffffffffc020484e:	68e78793          	addi	a5,a5,1678 # ffffffffc023ced8 <boot_cr3>
ffffffffc0204852:	639c                	ld	a5,0(a5)
ffffffffc0204854:	0a043023          	sd	zero,160(s0)
ffffffffc0204858:	0a042823          	sw	zero,176(s0)
ffffffffc020485c:	f45c                	sd	a5,168(s0)
ffffffffc020485e:	463d                	li	a2,15
ffffffffc0204860:	4581                	li	a1,0
ffffffffc0204862:	0b440513          	addi	a0,s0,180
ffffffffc0204866:	3fe040ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc020486a:	0e042623          	sw	zero,236(s0)
ffffffffc020486e:	0e043c23          	sd	zero,248(s0)
ffffffffc0204872:	10043023          	sd	zero,256(s0)
ffffffffc0204876:	0e043823          	sd	zero,240(s0)
ffffffffc020487a:	12043423          	sd	zero,296(s0)
ffffffffc020487e:	12043823          	sd	zero,304(s0)
ffffffffc0204882:	12043c23          	sd	zero,312(s0)
ffffffffc0204886:	14043023          	sd	zero,320(s0)
ffffffffc020488a:	8522                	mv	a0,s0
ffffffffc020488c:	60a2                	ld	ra,8(sp)
ffffffffc020488e:	6402                	ld	s0,0(sp)
ffffffffc0204890:	0141                	addi	sp,sp,16
ffffffffc0204892:	8082                	ret

ffffffffc0204894 <forkret>:
ffffffffc0204894:	00038797          	auipc	a5,0x38
ffffffffc0204898:	5e478793          	addi	a5,a5,1508 # ffffffffc023ce78 <current>
ffffffffc020489c:	639c                	ld	a5,0(a5)
ffffffffc020489e:	73c8                	ld	a0,160(a5)
ffffffffc02048a0:	cbafc06f          	j	ffffffffc0200d5a <forkrets>

ffffffffc02048a4 <user_main>:
ffffffffc02048a4:	00038797          	auipc	a5,0x38
ffffffffc02048a8:	5d478793          	addi	a5,a5,1492 # ffffffffc023ce78 <current>
ffffffffc02048ac:	639c                	ld	a5,0(a5)
ffffffffc02048ae:	7139                	addi	sp,sp,-64
ffffffffc02048b0:	00006617          	auipc	a2,0x6
ffffffffc02048b4:	5a060613          	addi	a2,a2,1440 # ffffffffc020ae50 <default_pmm_manager+0x1488>
ffffffffc02048b8:	43cc                	lw	a1,4(a5)
ffffffffc02048ba:	00006517          	auipc	a0,0x6
ffffffffc02048be:	5a650513          	addi	a0,a0,1446 # ffffffffc020ae60 <default_pmm_manager+0x1498>
ffffffffc02048c2:	fc06                	sd	ra,56(sp)
ffffffffc02048c4:	8cffb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02048c8:	00006797          	auipc	a5,0x6
ffffffffc02048cc:	58878793          	addi	a5,a5,1416 # ffffffffc020ae50 <default_pmm_manager+0x1488>
ffffffffc02048d0:	3fdfe717          	auipc	a4,0x3fdfe
ffffffffc02048d4:	a8870713          	addi	a4,a4,-1400 # 2358 <_binary_obj___user_priority_out_size>
ffffffffc02048d8:	e43a                	sd	a4,8(sp)
ffffffffc02048da:	853e                	mv	a0,a5
ffffffffc02048dc:	00021717          	auipc	a4,0x21
ffffffffc02048e0:	d5470713          	addi	a4,a4,-684 # ffffffffc0225630 <_binary_obj___user_priority_out_start>
ffffffffc02048e4:	f03a                	sd	a4,32(sp)
ffffffffc02048e6:	f43e                	sd	a5,40(sp)
ffffffffc02048e8:	e802                	sd	zero,16(sp)
ffffffffc02048ea:	2dc040ef          	jal	ra,ffffffffc0208bc6 <strlen>
ffffffffc02048ee:	ec2a                	sd	a0,24(sp)
ffffffffc02048f0:	4511                	li	a0,4
ffffffffc02048f2:	55a2                	lw	a1,40(sp)
ffffffffc02048f4:	4662                	lw	a2,24(sp)
ffffffffc02048f6:	5682                	lw	a3,32(sp)
ffffffffc02048f8:	4722                	lw	a4,8(sp)
ffffffffc02048fa:	48a9                	li	a7,10
ffffffffc02048fc:	9002                	ebreak
ffffffffc02048fe:	c82a                	sw	a0,16(sp)
ffffffffc0204900:	65c2                	ld	a1,16(sp)
ffffffffc0204902:	00006517          	auipc	a0,0x6
ffffffffc0204906:	58650513          	addi	a0,a0,1414 # ffffffffc020ae88 <default_pmm_manager+0x14c0>
ffffffffc020490a:	889fb0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020490e:	00006617          	auipc	a2,0x6
ffffffffc0204912:	58a60613          	addi	a2,a2,1418 # ffffffffc020ae98 <default_pmm_manager+0x14d0>
ffffffffc0204916:	34a00593          	li	a1,842
ffffffffc020491a:	00006517          	auipc	a0,0x6
ffffffffc020491e:	59e50513          	addi	a0,a0,1438 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0204922:	b63fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0204926 <put_pgdir>:
ffffffffc0204926:	6d14                	ld	a3,24(a0)
ffffffffc0204928:	1141                	addi	sp,sp,-16
ffffffffc020492a:	e406                	sd	ra,8(sp)
ffffffffc020492c:	c02007b7          	lui	a5,0xc0200
ffffffffc0204930:	04f6e263          	bltu	a3,a5,ffffffffc0204974 <put_pgdir+0x4e>
ffffffffc0204934:	00038797          	auipc	a5,0x38
ffffffffc0204938:	59c78793          	addi	a5,a5,1436 # ffffffffc023ced0 <va_pa_offset>
ffffffffc020493c:	6388                	ld	a0,0(a5)
ffffffffc020493e:	00038797          	auipc	a5,0x38
ffffffffc0204942:	52278793          	addi	a5,a5,1314 # ffffffffc023ce60 <npage>
ffffffffc0204946:	639c                	ld	a5,0(a5)
ffffffffc0204948:	8e89                	sub	a3,a3,a0
ffffffffc020494a:	82b1                	srli	a3,a3,0xc
ffffffffc020494c:	04f6f063          	bgeu	a3,a5,ffffffffc020498c <put_pgdir+0x66>
ffffffffc0204950:	00007797          	auipc	a5,0x7
ffffffffc0204954:	16078793          	addi	a5,a5,352 # ffffffffc020bab0 <nbase>
ffffffffc0204958:	639c                	ld	a5,0(a5)
ffffffffc020495a:	00038717          	auipc	a4,0x38
ffffffffc020495e:	58670713          	addi	a4,a4,1414 # ffffffffc023cee0 <pages>
ffffffffc0204962:	6308                	ld	a0,0(a4)
ffffffffc0204964:	60a2                	ld	ra,8(sp)
ffffffffc0204966:	8e9d                	sub	a3,a3,a5
ffffffffc0204968:	069a                	slli	a3,a3,0x6
ffffffffc020496a:	4585                	li	a1,1
ffffffffc020496c:	9536                	add	a0,a0,a3
ffffffffc020496e:	0141                	addi	sp,sp,16
ffffffffc0204970:	c5cfd06f          	j	ffffffffc0201dcc <free_pages>
ffffffffc0204974:	00005617          	auipc	a2,0x5
ffffffffc0204978:	0dc60613          	addi	a2,a2,220 # ffffffffc0209a50 <default_pmm_manager+0x88>
ffffffffc020497c:	06e00593          	li	a1,110
ffffffffc0204980:	00005517          	auipc	a0,0x5
ffffffffc0204984:	0c050513          	addi	a0,a0,192 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0204988:	afdfb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020498c:	00005617          	auipc	a2,0x5
ffffffffc0204990:	0ec60613          	addi	a2,a2,236 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc0204994:	06200593          	li	a1,98
ffffffffc0204998:	00005517          	auipc	a0,0x5
ffffffffc020499c:	0a850513          	addi	a0,a0,168 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc02049a0:	ae5fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02049a4 <setup_pgdir>:
ffffffffc02049a4:	1101                	addi	sp,sp,-32
ffffffffc02049a6:	e426                	sd	s1,8(sp)
ffffffffc02049a8:	84aa                	mv	s1,a0
ffffffffc02049aa:	4505                	li	a0,1
ffffffffc02049ac:	ec06                	sd	ra,24(sp)
ffffffffc02049ae:	e822                	sd	s0,16(sp)
ffffffffc02049b0:	b94fd0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc02049b4:	c125                	beqz	a0,ffffffffc0204a14 <setup_pgdir+0x70>
ffffffffc02049b6:	00038797          	auipc	a5,0x38
ffffffffc02049ba:	52a78793          	addi	a5,a5,1322 # ffffffffc023cee0 <pages>
ffffffffc02049be:	6394                	ld	a3,0(a5)
ffffffffc02049c0:	00007797          	auipc	a5,0x7
ffffffffc02049c4:	0f078793          	addi	a5,a5,240 # ffffffffc020bab0 <nbase>
ffffffffc02049c8:	6380                	ld	s0,0(a5)
ffffffffc02049ca:	40d506b3          	sub	a3,a0,a3
ffffffffc02049ce:	00038797          	auipc	a5,0x38
ffffffffc02049d2:	49278793          	addi	a5,a5,1170 # ffffffffc023ce60 <npage>
ffffffffc02049d6:	8699                	srai	a3,a3,0x6
ffffffffc02049d8:	96a2                	add	a3,a3,s0
ffffffffc02049da:	6398                	ld	a4,0(a5)
ffffffffc02049dc:	00c69793          	slli	a5,a3,0xc
ffffffffc02049e0:	83b1                	srli	a5,a5,0xc
ffffffffc02049e2:	06b2                	slli	a3,a3,0xc
ffffffffc02049e4:	02e7fa63          	bgeu	a5,a4,ffffffffc0204a18 <setup_pgdir+0x74>
ffffffffc02049e8:	00038797          	auipc	a5,0x38
ffffffffc02049ec:	4e878793          	addi	a5,a5,1256 # ffffffffc023ced0 <va_pa_offset>
ffffffffc02049f0:	6380                	ld	s0,0(a5)
ffffffffc02049f2:	00038797          	auipc	a5,0x38
ffffffffc02049f6:	46678793          	addi	a5,a5,1126 # ffffffffc023ce58 <boot_pgdir>
ffffffffc02049fa:	638c                	ld	a1,0(a5)
ffffffffc02049fc:	9436                	add	s0,s0,a3
ffffffffc02049fe:	6605                	lui	a2,0x1
ffffffffc0204a00:	8522                	mv	a0,s0
ffffffffc0204a02:	274040ef          	jal	ra,ffffffffc0208c76 <memcpy>
ffffffffc0204a06:	4501                	li	a0,0
ffffffffc0204a08:	ec80                	sd	s0,24(s1)
ffffffffc0204a0a:	60e2                	ld	ra,24(sp)
ffffffffc0204a0c:	6442                	ld	s0,16(sp)
ffffffffc0204a0e:	64a2                	ld	s1,8(sp)
ffffffffc0204a10:	6105                	addi	sp,sp,32
ffffffffc0204a12:	8082                	ret
ffffffffc0204a14:	5571                	li	a0,-4
ffffffffc0204a16:	bfd5                	j	ffffffffc0204a0a <setup_pgdir+0x66>
ffffffffc0204a18:	00005617          	auipc	a2,0x5
ffffffffc0204a1c:	00060613          	mv	a2,a2
ffffffffc0204a20:	06900593          	li	a1,105
ffffffffc0204a24:	00005517          	auipc	a0,0x5
ffffffffc0204a28:	01c50513          	addi	a0,a0,28 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0204a2c:	a59fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0204a30 <set_proc_name>:
ffffffffc0204a30:	1101                	addi	sp,sp,-32
ffffffffc0204a32:	e822                	sd	s0,16(sp)
ffffffffc0204a34:	0b450413          	addi	s0,a0,180
ffffffffc0204a38:	e426                	sd	s1,8(sp)
ffffffffc0204a3a:	4641                	li	a2,16
ffffffffc0204a3c:	84ae                	mv	s1,a1
ffffffffc0204a3e:	8522                	mv	a0,s0
ffffffffc0204a40:	4581                	li	a1,0
ffffffffc0204a42:	ec06                	sd	ra,24(sp)
ffffffffc0204a44:	220040ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc0204a48:	8522                	mv	a0,s0
ffffffffc0204a4a:	6442                	ld	s0,16(sp)
ffffffffc0204a4c:	60e2                	ld	ra,24(sp)
ffffffffc0204a4e:	85a6                	mv	a1,s1
ffffffffc0204a50:	64a2                	ld	s1,8(sp)
ffffffffc0204a52:	463d                	li	a2,15
ffffffffc0204a54:	6105                	addi	sp,sp,32
ffffffffc0204a56:	2200406f          	j	ffffffffc0208c76 <memcpy>

ffffffffc0204a5a <proc_run>:
ffffffffc0204a5a:	1101                	addi	sp,sp,-32
ffffffffc0204a5c:	00038797          	auipc	a5,0x38
ffffffffc0204a60:	41c78793          	addi	a5,a5,1052 # ffffffffc023ce78 <current>
ffffffffc0204a64:	e426                	sd	s1,8(sp)
ffffffffc0204a66:	6384                	ld	s1,0(a5)
ffffffffc0204a68:	ec06                	sd	ra,24(sp)
ffffffffc0204a6a:	e822                	sd	s0,16(sp)
ffffffffc0204a6c:	e04a                	sd	s2,0(sp)
ffffffffc0204a6e:	02a48b63          	beq	s1,a0,ffffffffc0204aa4 <proc_run+0x4a>
ffffffffc0204a72:	842a                	mv	s0,a0
ffffffffc0204a74:	100027f3          	csrr	a5,sstatus
ffffffffc0204a78:	8b89                	andi	a5,a5,2
ffffffffc0204a7a:	4901                	li	s2,0
ffffffffc0204a7c:	e3a9                	bnez	a5,ffffffffc0204abe <proc_run+0x64>
ffffffffc0204a7e:	745c                	ld	a5,168(s0)
ffffffffc0204a80:	00038717          	auipc	a4,0x38
ffffffffc0204a84:	3e873c23          	sd	s0,1016(a4) # ffffffffc023ce78 <current>
ffffffffc0204a88:	577d                	li	a4,-1
ffffffffc0204a8a:	177e                	slli	a4,a4,0x3f
ffffffffc0204a8c:	83b1                	srli	a5,a5,0xc
ffffffffc0204a8e:	8fd9                	or	a5,a5,a4
ffffffffc0204a90:	18079073          	csrw	satp,a5
ffffffffc0204a94:	03040593          	addi	a1,s0,48
ffffffffc0204a98:	03048513          	addi	a0,s1,48
ffffffffc0204a9c:	010010ef          	jal	ra,ffffffffc0205aac <switch_to>
ffffffffc0204aa0:	00091863          	bnez	s2,ffffffffc0204ab0 <proc_run+0x56>
ffffffffc0204aa4:	60e2                	ld	ra,24(sp)
ffffffffc0204aa6:	6442                	ld	s0,16(sp)
ffffffffc0204aa8:	64a2                	ld	s1,8(sp)
ffffffffc0204aaa:	6902                	ld	s2,0(sp)
ffffffffc0204aac:	6105                	addi	sp,sp,32
ffffffffc0204aae:	8082                	ret
ffffffffc0204ab0:	6442                	ld	s0,16(sp)
ffffffffc0204ab2:	60e2                	ld	ra,24(sp)
ffffffffc0204ab4:	64a2                	ld	s1,8(sp)
ffffffffc0204ab6:	6902                	ld	s2,0(sp)
ffffffffc0204ab8:	6105                	addi	sp,sp,32
ffffffffc0204aba:	b8bfb06f          	j	ffffffffc0200644 <intr_enable>
ffffffffc0204abe:	b8dfb0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0204ac2:	4905                	li	s2,1
ffffffffc0204ac4:	bf6d                	j	ffffffffc0204a7e <proc_run+0x24>

ffffffffc0204ac6 <find_proc>:
ffffffffc0204ac6:	0005071b          	sext.w	a4,a0
ffffffffc0204aca:	6789                	lui	a5,0x2
ffffffffc0204acc:	fff7069b          	addiw	a3,a4,-1
ffffffffc0204ad0:	17f9                	addi	a5,a5,-2
ffffffffc0204ad2:	04d7e063          	bltu	a5,a3,ffffffffc0204b12 <find_proc+0x4c>
ffffffffc0204ad6:	1141                	addi	sp,sp,-16
ffffffffc0204ad8:	e022                	sd	s0,0(sp)
ffffffffc0204ada:	45a9                	li	a1,10
ffffffffc0204adc:	842a                	mv	s0,a0
ffffffffc0204ade:	853a                	mv	a0,a4
ffffffffc0204ae0:	e406                	sd	ra,8(sp)
ffffffffc0204ae2:	4e1030ef          	jal	ra,ffffffffc02087c2 <hash32>
ffffffffc0204ae6:	02051693          	slli	a3,a0,0x20
ffffffffc0204aea:	82f1                	srli	a3,a3,0x1c
ffffffffc0204aec:	00034517          	auipc	a0,0x34
ffffffffc0204af0:	32c50513          	addi	a0,a0,812 # ffffffffc0238e18 <hash_list>
ffffffffc0204af4:	96aa                	add	a3,a3,a0
ffffffffc0204af6:	87b6                	mv	a5,a3
ffffffffc0204af8:	a029                	j	ffffffffc0204b02 <find_proc+0x3c>
ffffffffc0204afa:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_obj___user_divzero_out_size+0x1c>
ffffffffc0204afe:	00870c63          	beq	a4,s0,ffffffffc0204b16 <find_proc+0x50>
ffffffffc0204b02:	679c                	ld	a5,8(a5)
ffffffffc0204b04:	fef69be3          	bne	a3,a5,ffffffffc0204afa <find_proc+0x34>
ffffffffc0204b08:	60a2                	ld	ra,8(sp)
ffffffffc0204b0a:	6402                	ld	s0,0(sp)
ffffffffc0204b0c:	4501                	li	a0,0
ffffffffc0204b0e:	0141                	addi	sp,sp,16
ffffffffc0204b10:	8082                	ret
ffffffffc0204b12:	4501                	li	a0,0
ffffffffc0204b14:	8082                	ret
ffffffffc0204b16:	60a2                	ld	ra,8(sp)
ffffffffc0204b18:	6402                	ld	s0,0(sp)
ffffffffc0204b1a:	f2878513          	addi	a0,a5,-216
ffffffffc0204b1e:	0141                	addi	sp,sp,16
ffffffffc0204b20:	8082                	ret

ffffffffc0204b22 <do_fork>:
ffffffffc0204b22:	7159                	addi	sp,sp,-112
ffffffffc0204b24:	e0d2                	sd	s4,64(sp)
ffffffffc0204b26:	00038a17          	auipc	s4,0x38
ffffffffc0204b2a:	36aa0a13          	addi	s4,s4,874 # ffffffffc023ce90 <nr_process>
ffffffffc0204b2e:	000a2703          	lw	a4,0(s4)
ffffffffc0204b32:	f486                	sd	ra,104(sp)
ffffffffc0204b34:	f0a2                	sd	s0,96(sp)
ffffffffc0204b36:	eca6                	sd	s1,88(sp)
ffffffffc0204b38:	e8ca                	sd	s2,80(sp)
ffffffffc0204b3a:	e4ce                	sd	s3,72(sp)
ffffffffc0204b3c:	fc56                	sd	s5,56(sp)
ffffffffc0204b3e:	f85a                	sd	s6,48(sp)
ffffffffc0204b40:	f45e                	sd	s7,40(sp)
ffffffffc0204b42:	f062                	sd	s8,32(sp)
ffffffffc0204b44:	ec66                	sd	s9,24(sp)
ffffffffc0204b46:	e86a                	sd	s10,16(sp)
ffffffffc0204b48:	e46e                	sd	s11,8(sp)
ffffffffc0204b4a:	6785                	lui	a5,0x1
ffffffffc0204b4c:	30f75f63          	bge	a4,a5,ffffffffc0204e6a <do_fork+0x348>
ffffffffc0204b50:	89aa                	mv	s3,a0
ffffffffc0204b52:	892e                	mv	s2,a1
ffffffffc0204b54:	84b2                	mv	s1,a2
ffffffffc0204b56:	cbbff0ef          	jal	ra,ffffffffc0204810 <alloc_proc>
ffffffffc0204b5a:	842a                	mv	s0,a0
ffffffffc0204b5c:	2e050963          	beqz	a0,ffffffffc0204e4e <do_fork+0x32c>
ffffffffc0204b60:	00038c17          	auipc	s8,0x38
ffffffffc0204b64:	318c0c13          	addi	s8,s8,792 # ffffffffc023ce78 <current>
ffffffffc0204b68:	000c3783          	ld	a5,0(s8)
ffffffffc0204b6c:	0ec7a703          	lw	a4,236(a5) # 10ec <_binary_obj___user_faultread_out_size-0xc6c>
ffffffffc0204b70:	f11c                	sd	a5,32(a0)
ffffffffc0204b72:	30071a63          	bnez	a4,ffffffffc0204e86 <do_fork+0x364>
ffffffffc0204b76:	4509                	li	a0,2
ffffffffc0204b78:	9ccfd0ef          	jal	ra,ffffffffc0201d44 <alloc_pages>
ffffffffc0204b7c:	2c050663          	beqz	a0,ffffffffc0204e48 <do_fork+0x326>
ffffffffc0204b80:	00038a97          	auipc	s5,0x38
ffffffffc0204b84:	360a8a93          	addi	s5,s5,864 # ffffffffc023cee0 <pages>
ffffffffc0204b88:	000ab683          	ld	a3,0(s5)
ffffffffc0204b8c:	00007b17          	auipc	s6,0x7
ffffffffc0204b90:	f24b0b13          	addi	s6,s6,-220 # ffffffffc020bab0 <nbase>
ffffffffc0204b94:	000b3783          	ld	a5,0(s6)
ffffffffc0204b98:	40d506b3          	sub	a3,a0,a3
ffffffffc0204b9c:	8699                	srai	a3,a3,0x6
ffffffffc0204b9e:	00038b97          	auipc	s7,0x38
ffffffffc0204ba2:	2c2b8b93          	addi	s7,s7,706 # ffffffffc023ce60 <npage>
ffffffffc0204ba6:	96be                	add	a3,a3,a5
ffffffffc0204ba8:	000bb703          	ld	a4,0(s7)
ffffffffc0204bac:	00c69793          	slli	a5,a3,0xc
ffffffffc0204bb0:	83b1                	srli	a5,a5,0xc
ffffffffc0204bb2:	06b2                	slli	a3,a3,0xc
ffffffffc0204bb4:	2ae7fd63          	bgeu	a5,a4,ffffffffc0204e6e <do_fork+0x34c>
ffffffffc0204bb8:	00038c97          	auipc	s9,0x38
ffffffffc0204bbc:	318c8c93          	addi	s9,s9,792 # ffffffffc023ced0 <va_pa_offset>
ffffffffc0204bc0:	000c3703          	ld	a4,0(s8)
ffffffffc0204bc4:	000cb783          	ld	a5,0(s9)
ffffffffc0204bc8:	02873c03          	ld	s8,40(a4)
ffffffffc0204bcc:	96be                	add	a3,a3,a5
ffffffffc0204bce:	e814                	sd	a3,16(s0)
ffffffffc0204bd0:	020c0863          	beqz	s8,ffffffffc0204c00 <do_fork+0xde>
ffffffffc0204bd4:	1009f993          	andi	s3,s3,256
ffffffffc0204bd8:	1e098663          	beqz	s3,ffffffffc0204dc4 <do_fork+0x2a2>
ffffffffc0204bdc:	030c2703          	lw	a4,48(s8)
ffffffffc0204be0:	018c3783          	ld	a5,24(s8)
ffffffffc0204be4:	c02006b7          	lui	a3,0xc0200
ffffffffc0204be8:	2705                	addiw	a4,a4,1
ffffffffc0204bea:	02ec2823          	sw	a4,48(s8)
ffffffffc0204bee:	03843423          	sd	s8,40(s0)
ffffffffc0204bf2:	2ad7ea63          	bltu	a5,a3,ffffffffc0204ea6 <do_fork+0x384>
ffffffffc0204bf6:	000cb703          	ld	a4,0(s9)
ffffffffc0204bfa:	6814                	ld	a3,16(s0)
ffffffffc0204bfc:	8f99                	sub	a5,a5,a4
ffffffffc0204bfe:	f45c                	sd	a5,168(s0)
ffffffffc0204c00:	6789                	lui	a5,0x2
ffffffffc0204c02:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_obj___user_faultreadkernel_out_size+0x30>
ffffffffc0204c06:	97b6                	add	a5,a5,a3
ffffffffc0204c08:	f05c                	sd	a5,160(s0)
ffffffffc0204c0a:	873e                	mv	a4,a5
ffffffffc0204c0c:	12048893          	addi	a7,s1,288
ffffffffc0204c10:	0004b803          	ld	a6,0(s1)
ffffffffc0204c14:	6488                	ld	a0,8(s1)
ffffffffc0204c16:	688c                	ld	a1,16(s1)
ffffffffc0204c18:	6c90                	ld	a2,24(s1)
ffffffffc0204c1a:	01073023          	sd	a6,0(a4)
ffffffffc0204c1e:	e708                	sd	a0,8(a4)
ffffffffc0204c20:	eb0c                	sd	a1,16(a4)
ffffffffc0204c22:	ef10                	sd	a2,24(a4)
ffffffffc0204c24:	02048493          	addi	s1,s1,32
ffffffffc0204c28:	02070713          	addi	a4,a4,32
ffffffffc0204c2c:	ff1492e3          	bne	s1,a7,ffffffffc0204c10 <do_fork+0xee>
ffffffffc0204c30:	0407b823          	sd	zero,80(a5)
ffffffffc0204c34:	12090e63          	beqz	s2,ffffffffc0204d70 <do_fork+0x24e>
ffffffffc0204c38:	0127b823          	sd	s2,16(a5)
ffffffffc0204c3c:	00000717          	auipc	a4,0x0
ffffffffc0204c40:	c5870713          	addi	a4,a4,-936 # ffffffffc0204894 <forkret>
ffffffffc0204c44:	f818                	sd	a4,48(s0)
ffffffffc0204c46:	fc1c                	sd	a5,56(s0)
ffffffffc0204c48:	100027f3          	csrr	a5,sstatus
ffffffffc0204c4c:	8b89                	andi	a5,a5,2
ffffffffc0204c4e:	4901                	li	s2,0
ffffffffc0204c50:	14079263          	bnez	a5,ffffffffc0204d94 <do_fork+0x272>
ffffffffc0204c54:	0002d797          	auipc	a5,0x2d
ffffffffc0204c58:	dbc78793          	addi	a5,a5,-580 # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204c5c:	439c                	lw	a5,0(a5)
ffffffffc0204c5e:	6709                	lui	a4,0x2
ffffffffc0204c60:	0017851b          	addiw	a0,a5,1
ffffffffc0204c64:	0002d697          	auipc	a3,0x2d
ffffffffc0204c68:	daa6a623          	sw	a0,-596(a3) # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204c6c:	14e55563          	bge	a0,a4,ffffffffc0204db6 <do_fork+0x294>
ffffffffc0204c70:	0002d797          	auipc	a5,0x2d
ffffffffc0204c74:	da478793          	addi	a5,a5,-604 # ffffffffc0231a14 <next_safe.1766>
ffffffffc0204c78:	439c                	lw	a5,0(a5)
ffffffffc0204c7a:	00038497          	auipc	s1,0x38
ffffffffc0204c7e:	34e48493          	addi	s1,s1,846 # ffffffffc023cfc8 <proc_list>
ffffffffc0204c82:	06f54063          	blt	a0,a5,ffffffffc0204ce2 <do_fork+0x1c0>
ffffffffc0204c86:	6789                	lui	a5,0x2
ffffffffc0204c88:	0002d717          	auipc	a4,0x2d
ffffffffc0204c8c:	d8f72623          	sw	a5,-628(a4) # ffffffffc0231a14 <next_safe.1766>
ffffffffc0204c90:	4581                	li	a1,0
ffffffffc0204c92:	87aa                	mv	a5,a0
ffffffffc0204c94:	00038497          	auipc	s1,0x38
ffffffffc0204c98:	33448493          	addi	s1,s1,820 # ffffffffc023cfc8 <proc_list>
ffffffffc0204c9c:	6889                	lui	a7,0x2
ffffffffc0204c9e:	882e                	mv	a6,a1
ffffffffc0204ca0:	6609                	lui	a2,0x2
ffffffffc0204ca2:	00038697          	auipc	a3,0x38
ffffffffc0204ca6:	32668693          	addi	a3,a3,806 # ffffffffc023cfc8 <proc_list>
ffffffffc0204caa:	6694                	ld	a3,8(a3)
ffffffffc0204cac:	00968f63          	beq	a3,s1,ffffffffc0204cca <do_fork+0x1a8>
ffffffffc0204cb0:	f3c6a703          	lw	a4,-196(a3)
ffffffffc0204cb4:	0ae78963          	beq	a5,a4,ffffffffc0204d66 <do_fork+0x244>
ffffffffc0204cb8:	fee7d9e3          	bge	a5,a4,ffffffffc0204caa <do_fork+0x188>
ffffffffc0204cbc:	fec757e3          	bge	a4,a2,ffffffffc0204caa <do_fork+0x188>
ffffffffc0204cc0:	6694                	ld	a3,8(a3)
ffffffffc0204cc2:	863a                	mv	a2,a4
ffffffffc0204cc4:	4805                	li	a6,1
ffffffffc0204cc6:	fe9695e3          	bne	a3,s1,ffffffffc0204cb0 <do_fork+0x18e>
ffffffffc0204cca:	c591                	beqz	a1,ffffffffc0204cd6 <do_fork+0x1b4>
ffffffffc0204ccc:	0002d717          	auipc	a4,0x2d
ffffffffc0204cd0:	d4f72223          	sw	a5,-700(a4) # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204cd4:	853e                	mv	a0,a5
ffffffffc0204cd6:	00080663          	beqz	a6,ffffffffc0204ce2 <do_fork+0x1c0>
ffffffffc0204cda:	0002d797          	auipc	a5,0x2d
ffffffffc0204cde:	d2c7ad23          	sw	a2,-710(a5) # ffffffffc0231a14 <next_safe.1766>
ffffffffc0204ce2:	c048                	sw	a0,4(s0)
ffffffffc0204ce4:	45a9                	li	a1,10
ffffffffc0204ce6:	2501                	sext.w	a0,a0
ffffffffc0204ce8:	2db030ef          	jal	ra,ffffffffc02087c2 <hash32>
ffffffffc0204cec:	1502                	slli	a0,a0,0x20
ffffffffc0204cee:	00034797          	auipc	a5,0x34
ffffffffc0204cf2:	12a78793          	addi	a5,a5,298 # ffffffffc0238e18 <hash_list>
ffffffffc0204cf6:	8171                	srli	a0,a0,0x1c
ffffffffc0204cf8:	953e                	add	a0,a0,a5
ffffffffc0204cfa:	650c                	ld	a1,8(a0)
ffffffffc0204cfc:	7014                	ld	a3,32(s0)
ffffffffc0204cfe:	0d840793          	addi	a5,s0,216
ffffffffc0204d02:	e19c                	sd	a5,0(a1)
ffffffffc0204d04:	6490                	ld	a2,8(s1)
ffffffffc0204d06:	e51c                	sd	a5,8(a0)
ffffffffc0204d08:	7af8                	ld	a4,240(a3)
ffffffffc0204d0a:	0c840793          	addi	a5,s0,200
ffffffffc0204d0e:	f06c                	sd	a1,224(s0)
ffffffffc0204d10:	ec68                	sd	a0,216(s0)
ffffffffc0204d12:	e21c                	sd	a5,0(a2)
ffffffffc0204d14:	00038597          	auipc	a1,0x38
ffffffffc0204d18:	2af5be23          	sd	a5,700(a1) # ffffffffc023cfd0 <proc_list+0x8>
ffffffffc0204d1c:	e870                	sd	a2,208(s0)
ffffffffc0204d1e:	e464                	sd	s1,200(s0)
ffffffffc0204d20:	0e043c23          	sd	zero,248(s0)
ffffffffc0204d24:	10e43023          	sd	a4,256(s0)
ffffffffc0204d28:	c311                	beqz	a4,ffffffffc0204d2c <do_fork+0x20a>
ffffffffc0204d2a:	ff60                	sd	s0,248(a4)
ffffffffc0204d2c:	000a2783          	lw	a5,0(s4)
ffffffffc0204d30:	fae0                	sd	s0,240(a3)
ffffffffc0204d32:	2785                	addiw	a5,a5,1
ffffffffc0204d34:	00038717          	auipc	a4,0x38
ffffffffc0204d38:	14f72e23          	sw	a5,348(a4) # ffffffffc023ce90 <nr_process>
ffffffffc0204d3c:	10091b63          	bnez	s2,ffffffffc0204e52 <do_fork+0x330>
ffffffffc0204d40:	8522                	mv	a0,s0
ffffffffc0204d42:	7f6030ef          	jal	ra,ffffffffc0208538 <wakeup_proc>
ffffffffc0204d46:	4048                	lw	a0,4(s0)
ffffffffc0204d48:	70a6                	ld	ra,104(sp)
ffffffffc0204d4a:	7406                	ld	s0,96(sp)
ffffffffc0204d4c:	64e6                	ld	s1,88(sp)
ffffffffc0204d4e:	6946                	ld	s2,80(sp)
ffffffffc0204d50:	69a6                	ld	s3,72(sp)
ffffffffc0204d52:	6a06                	ld	s4,64(sp)
ffffffffc0204d54:	7ae2                	ld	s5,56(sp)
ffffffffc0204d56:	7b42                	ld	s6,48(sp)
ffffffffc0204d58:	7ba2                	ld	s7,40(sp)
ffffffffc0204d5a:	7c02                	ld	s8,32(sp)
ffffffffc0204d5c:	6ce2                	ld	s9,24(sp)
ffffffffc0204d5e:	6d42                	ld	s10,16(sp)
ffffffffc0204d60:	6da2                	ld	s11,8(sp)
ffffffffc0204d62:	6165                	addi	sp,sp,112
ffffffffc0204d64:	8082                	ret
ffffffffc0204d66:	2785                	addiw	a5,a5,1
ffffffffc0204d68:	0ec7d863          	bge	a5,a2,ffffffffc0204e58 <do_fork+0x336>
ffffffffc0204d6c:	4585                	li	a1,1
ffffffffc0204d6e:	bf35                	j	ffffffffc0204caa <do_fork+0x188>
ffffffffc0204d70:	6909                	lui	s2,0x2
ffffffffc0204d72:	edc90913          	addi	s2,s2,-292 # 1edc <_binary_obj___user_faultreadkernel_out_size+0x2c>
ffffffffc0204d76:	9936                	add	s2,s2,a3
ffffffffc0204d78:	0127b823          	sd	s2,16(a5)
ffffffffc0204d7c:	00000717          	auipc	a4,0x0
ffffffffc0204d80:	b1870713          	addi	a4,a4,-1256 # ffffffffc0204894 <forkret>
ffffffffc0204d84:	f818                	sd	a4,48(s0)
ffffffffc0204d86:	fc1c                	sd	a5,56(s0)
ffffffffc0204d88:	100027f3          	csrr	a5,sstatus
ffffffffc0204d8c:	8b89                	andi	a5,a5,2
ffffffffc0204d8e:	4901                	li	s2,0
ffffffffc0204d90:	ec0782e3          	beqz	a5,ffffffffc0204c54 <do_fork+0x132>
ffffffffc0204d94:	8b7fb0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0204d98:	0002d797          	auipc	a5,0x2d
ffffffffc0204d9c:	c7878793          	addi	a5,a5,-904 # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204da0:	439c                	lw	a5,0(a5)
ffffffffc0204da2:	6709                	lui	a4,0x2
ffffffffc0204da4:	4905                	li	s2,1
ffffffffc0204da6:	0017851b          	addiw	a0,a5,1
ffffffffc0204daa:	0002d697          	auipc	a3,0x2d
ffffffffc0204dae:	c6a6a323          	sw	a0,-922(a3) # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204db2:	eae54fe3          	blt	a0,a4,ffffffffc0204c70 <do_fork+0x14e>
ffffffffc0204db6:	4785                	li	a5,1
ffffffffc0204db8:	0002d717          	auipc	a4,0x2d
ffffffffc0204dbc:	c4f72c23          	sw	a5,-936(a4) # ffffffffc0231a10 <last_pid.1767>
ffffffffc0204dc0:	4505                	li	a0,1
ffffffffc0204dc2:	b5d1                	j	ffffffffc0204c86 <do_fork+0x164>
ffffffffc0204dc4:	ed3fe0ef          	jal	ra,ffffffffc0203c96 <mm_create>
ffffffffc0204dc8:	8d2a                	mv	s10,a0
ffffffffc0204dca:	c539                	beqz	a0,ffffffffc0204e18 <do_fork+0x2f6>
ffffffffc0204dcc:	bd9ff0ef          	jal	ra,ffffffffc02049a4 <setup_pgdir>
ffffffffc0204dd0:	e949                	bnez	a0,ffffffffc0204e62 <do_fork+0x340>
ffffffffc0204dd2:	038c0d93          	addi	s11,s8,56
ffffffffc0204dd6:	4785                	li	a5,1
ffffffffc0204dd8:	40fdb7af          	amoor.d	a5,a5,(s11)
ffffffffc0204ddc:	8b85                	andi	a5,a5,1
ffffffffc0204dde:	4985                	li	s3,1
ffffffffc0204de0:	c799                	beqz	a5,ffffffffc0204dee <do_fork+0x2cc>
ffffffffc0204de2:	011030ef          	jal	ra,ffffffffc02085f2 <schedule>
ffffffffc0204de6:	413db7af          	amoor.d	a5,s3,(s11)
ffffffffc0204dea:	8b85                	andi	a5,a5,1
ffffffffc0204dec:	fbfd                	bnez	a5,ffffffffc0204de2 <do_fork+0x2c0>
ffffffffc0204dee:	85e2                	mv	a1,s8
ffffffffc0204df0:	856a                	mv	a0,s10
ffffffffc0204df2:	92eff0ef          	jal	ra,ffffffffc0203f20 <dup_mmap>
ffffffffc0204df6:	57f9                	li	a5,-2
ffffffffc0204df8:	60fdb7af          	amoand.d	a5,a5,(s11)
ffffffffc0204dfc:	8b85                	andi	a5,a5,1
ffffffffc0204dfe:	c3e9                	beqz	a5,ffffffffc0204ec0 <do_fork+0x39e>
ffffffffc0204e00:	8c6a                	mv	s8,s10
ffffffffc0204e02:	dc050de3          	beqz	a0,ffffffffc0204bdc <do_fork+0xba>
ffffffffc0204e06:	856a                	mv	a0,s10
ffffffffc0204e08:	9b4ff0ef          	jal	ra,ffffffffc0203fbc <exit_mmap>
ffffffffc0204e0c:	856a                	mv	a0,s10
ffffffffc0204e0e:	b19ff0ef          	jal	ra,ffffffffc0204926 <put_pgdir>
ffffffffc0204e12:	856a                	mv	a0,s10
ffffffffc0204e14:	808ff0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc0204e18:	6814                	ld	a3,16(s0)
ffffffffc0204e1a:	c02007b7          	lui	a5,0xc0200
ffffffffc0204e1e:	0cf6e963          	bltu	a3,a5,ffffffffc0204ef0 <do_fork+0x3ce>
ffffffffc0204e22:	000cb783          	ld	a5,0(s9)
ffffffffc0204e26:	000bb703          	ld	a4,0(s7)
ffffffffc0204e2a:	40f687b3          	sub	a5,a3,a5
ffffffffc0204e2e:	83b1                	srli	a5,a5,0xc
ffffffffc0204e30:	0ae7f463          	bgeu	a5,a4,ffffffffc0204ed8 <do_fork+0x3b6>
ffffffffc0204e34:	000b3703          	ld	a4,0(s6)
ffffffffc0204e38:	000ab503          	ld	a0,0(s5)
ffffffffc0204e3c:	4589                	li	a1,2
ffffffffc0204e3e:	8f99                	sub	a5,a5,a4
ffffffffc0204e40:	079a                	slli	a5,a5,0x6
ffffffffc0204e42:	953e                	add	a0,a0,a5
ffffffffc0204e44:	f89fc0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc0204e48:	8522                	mv	a0,s0
ffffffffc0204e4a:	dbffc0ef          	jal	ra,ffffffffc0201c08 <kfree>
ffffffffc0204e4e:	5571                	li	a0,-4
ffffffffc0204e50:	bde5                	j	ffffffffc0204d48 <do_fork+0x226>
ffffffffc0204e52:	ff2fb0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0204e56:	b5ed                	j	ffffffffc0204d40 <do_fork+0x21e>
ffffffffc0204e58:	0117c363          	blt	a5,a7,ffffffffc0204e5e <do_fork+0x33c>
ffffffffc0204e5c:	4785                	li	a5,1
ffffffffc0204e5e:	4585                	li	a1,1
ffffffffc0204e60:	bd3d                	j	ffffffffc0204c9e <do_fork+0x17c>
ffffffffc0204e62:	856a                	mv	a0,s10
ffffffffc0204e64:	fb9fe0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc0204e68:	bf45                	j	ffffffffc0204e18 <do_fork+0x2f6>
ffffffffc0204e6a:	556d                	li	a0,-5
ffffffffc0204e6c:	bdf1                	j	ffffffffc0204d48 <do_fork+0x226>
ffffffffc0204e6e:	00005617          	auipc	a2,0x5
ffffffffc0204e72:	baa60613          	addi	a2,a2,-1110 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc0204e76:	06900593          	li	a1,105
ffffffffc0204e7a:	00005517          	auipc	a0,0x5
ffffffffc0204e7e:	bc650513          	addi	a0,a0,-1082 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0204e82:	e02fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0204e86:	00006697          	auipc	a3,0x6
ffffffffc0204e8a:	d8a68693          	addi	a3,a3,-630 # ffffffffc020ac10 <default_pmm_manager+0x1248>
ffffffffc0204e8e:	00004617          	auipc	a2,0x4
ffffffffc0204e92:	3f260613          	addi	a2,a2,1010 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0204e96:	1a900593          	li	a1,425
ffffffffc0204e9a:	00006517          	auipc	a0,0x6
ffffffffc0204e9e:	01e50513          	addi	a0,a0,30 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0204ea2:	de2fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0204ea6:	86be                	mv	a3,a5
ffffffffc0204ea8:	00005617          	auipc	a2,0x5
ffffffffc0204eac:	ba860613          	addi	a2,a2,-1112 # ffffffffc0209a50 <default_pmm_manager+0x88>
ffffffffc0204eb0:	15c00593          	li	a1,348
ffffffffc0204eb4:	00006517          	auipc	a0,0x6
ffffffffc0204eb8:	00450513          	addi	a0,a0,4 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0204ebc:	dc8fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0204ec0:	00006617          	auipc	a2,0x6
ffffffffc0204ec4:	d7060613          	addi	a2,a2,-656 # ffffffffc020ac30 <default_pmm_manager+0x1268>
ffffffffc0204ec8:	03200593          	li	a1,50
ffffffffc0204ecc:	00006517          	auipc	a0,0x6
ffffffffc0204ed0:	d7450513          	addi	a0,a0,-652 # ffffffffc020ac40 <default_pmm_manager+0x1278>
ffffffffc0204ed4:	db0fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0204ed8:	00005617          	auipc	a2,0x5
ffffffffc0204edc:	ba060613          	addi	a2,a2,-1120 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc0204ee0:	06200593          	li	a1,98
ffffffffc0204ee4:	00005517          	auipc	a0,0x5
ffffffffc0204ee8:	b5c50513          	addi	a0,a0,-1188 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0204eec:	d98fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0204ef0:	00005617          	auipc	a2,0x5
ffffffffc0204ef4:	b6060613          	addi	a2,a2,-1184 # ffffffffc0209a50 <default_pmm_manager+0x88>
ffffffffc0204ef8:	06e00593          	li	a1,110
ffffffffc0204efc:	00005517          	auipc	a0,0x5
ffffffffc0204f00:	b4450513          	addi	a0,a0,-1212 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0204f04:	d80fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0204f08 <kernel_thread>:
ffffffffc0204f08:	7129                	addi	sp,sp,-320
ffffffffc0204f0a:	fa22                	sd	s0,304(sp)
ffffffffc0204f0c:	f626                	sd	s1,296(sp)
ffffffffc0204f0e:	f24a                	sd	s2,288(sp)
ffffffffc0204f10:	84ae                	mv	s1,a1
ffffffffc0204f12:	892a                	mv	s2,a0
ffffffffc0204f14:	8432                	mv	s0,a2
ffffffffc0204f16:	4581                	li	a1,0
ffffffffc0204f18:	12000613          	li	a2,288
ffffffffc0204f1c:	850a                	mv	a0,sp
ffffffffc0204f1e:	fe06                	sd	ra,312(sp)
ffffffffc0204f20:	545030ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc0204f24:	e0ca                	sd	s2,64(sp)
ffffffffc0204f26:	e4a6                	sd	s1,72(sp)
ffffffffc0204f28:	100027f3          	csrr	a5,sstatus
ffffffffc0204f2c:	edd7f793          	andi	a5,a5,-291
ffffffffc0204f30:	1207e793          	ori	a5,a5,288
ffffffffc0204f34:	e23e                	sd	a5,256(sp)
ffffffffc0204f36:	860a                	mv	a2,sp
ffffffffc0204f38:	10046513          	ori	a0,s0,256
ffffffffc0204f3c:	00000797          	auipc	a5,0x0
ffffffffc0204f40:	8cc78793          	addi	a5,a5,-1844 # ffffffffc0204808 <kernel_thread_entry>
ffffffffc0204f44:	4581                	li	a1,0
ffffffffc0204f46:	e63e                	sd	a5,264(sp)
ffffffffc0204f48:	bdbff0ef          	jal	ra,ffffffffc0204b22 <do_fork>
ffffffffc0204f4c:	70f2                	ld	ra,312(sp)
ffffffffc0204f4e:	7452                	ld	s0,304(sp)
ffffffffc0204f50:	74b2                	ld	s1,296(sp)
ffffffffc0204f52:	7912                	ld	s2,288(sp)
ffffffffc0204f54:	6131                	addi	sp,sp,320
ffffffffc0204f56:	8082                	ret

ffffffffc0204f58 <do_exit>:
ffffffffc0204f58:	7179                	addi	sp,sp,-48
ffffffffc0204f5a:	e84a                	sd	s2,16(sp)
ffffffffc0204f5c:	00038717          	auipc	a4,0x38
ffffffffc0204f60:	f2470713          	addi	a4,a4,-220 # ffffffffc023ce80 <idleproc>
ffffffffc0204f64:	00038917          	auipc	s2,0x38
ffffffffc0204f68:	f1490913          	addi	s2,s2,-236 # ffffffffc023ce78 <current>
ffffffffc0204f6c:	00093783          	ld	a5,0(s2)
ffffffffc0204f70:	6318                	ld	a4,0(a4)
ffffffffc0204f72:	f406                	sd	ra,40(sp)
ffffffffc0204f74:	f022                	sd	s0,32(sp)
ffffffffc0204f76:	ec26                	sd	s1,24(sp)
ffffffffc0204f78:	e44e                	sd	s3,8(sp)
ffffffffc0204f7a:	e052                	sd	s4,0(sp)
ffffffffc0204f7c:	0ce78c63          	beq	a5,a4,ffffffffc0205054 <do_exit+0xfc>
ffffffffc0204f80:	00038417          	auipc	s0,0x38
ffffffffc0204f84:	f0840413          	addi	s0,s0,-248 # ffffffffc023ce88 <initproc>
ffffffffc0204f88:	6018                	ld	a4,0(s0)
ffffffffc0204f8a:	0ee78b63          	beq	a5,a4,ffffffffc0205080 <do_exit+0x128>
ffffffffc0204f8e:	7784                	ld	s1,40(a5)
ffffffffc0204f90:	89aa                	mv	s3,a0
ffffffffc0204f92:	c48d                	beqz	s1,ffffffffc0204fbc <do_exit+0x64>
ffffffffc0204f94:	00038797          	auipc	a5,0x38
ffffffffc0204f98:	f4478793          	addi	a5,a5,-188 # ffffffffc023ced8 <boot_cr3>
ffffffffc0204f9c:	639c                	ld	a5,0(a5)
ffffffffc0204f9e:	577d                	li	a4,-1
ffffffffc0204fa0:	177e                	slli	a4,a4,0x3f
ffffffffc0204fa2:	83b1                	srli	a5,a5,0xc
ffffffffc0204fa4:	8fd9                	or	a5,a5,a4
ffffffffc0204fa6:	18079073          	csrw	satp,a5
ffffffffc0204faa:	589c                	lw	a5,48(s1)
ffffffffc0204fac:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204fb0:	d898                	sw	a4,48(s1)
ffffffffc0204fb2:	cf4d                	beqz	a4,ffffffffc020506c <do_exit+0x114>
ffffffffc0204fb4:	00093783          	ld	a5,0(s2)
ffffffffc0204fb8:	0207b423          	sd	zero,40(a5)
ffffffffc0204fbc:	00093783          	ld	a5,0(s2)
ffffffffc0204fc0:	470d                	li	a4,3
ffffffffc0204fc2:	c398                	sw	a4,0(a5)
ffffffffc0204fc4:	0f37a423          	sw	s3,232(a5)
ffffffffc0204fc8:	100027f3          	csrr	a5,sstatus
ffffffffc0204fcc:	8b89                	andi	a5,a5,2
ffffffffc0204fce:	4a01                	li	s4,0
ffffffffc0204fd0:	e7e1                	bnez	a5,ffffffffc0205098 <do_exit+0x140>
ffffffffc0204fd2:	00093703          	ld	a4,0(s2)
ffffffffc0204fd6:	800007b7          	lui	a5,0x80000
ffffffffc0204fda:	0785                	addi	a5,a5,1
ffffffffc0204fdc:	7308                	ld	a0,32(a4)
ffffffffc0204fde:	0ec52703          	lw	a4,236(a0)
ffffffffc0204fe2:	0af70f63          	beq	a4,a5,ffffffffc02050a0 <do_exit+0x148>
ffffffffc0204fe6:	00093683          	ld	a3,0(s2)
ffffffffc0204fea:	800009b7          	lui	s3,0x80000
ffffffffc0204fee:	448d                	li	s1,3
ffffffffc0204ff0:	0985                	addi	s3,s3,1
ffffffffc0204ff2:	7afc                	ld	a5,240(a3)
ffffffffc0204ff4:	cb95                	beqz	a5,ffffffffc0205028 <do_exit+0xd0>
ffffffffc0204ff6:	1007b703          	ld	a4,256(a5) # ffffffff80000100 <_binary_obj___user_matrix_out_size+0xffffffff7fffd7c8>
ffffffffc0204ffa:	6008                	ld	a0,0(s0)
ffffffffc0204ffc:	faf8                	sd	a4,240(a3)
ffffffffc0204ffe:	7978                	ld	a4,240(a0)
ffffffffc0205000:	0e07bc23          	sd	zero,248(a5)
ffffffffc0205004:	10e7b023          	sd	a4,256(a5)
ffffffffc0205008:	c311                	beqz	a4,ffffffffc020500c <do_exit+0xb4>
ffffffffc020500a:	ff7c                	sd	a5,248(a4)
ffffffffc020500c:	4398                	lw	a4,0(a5)
ffffffffc020500e:	f388                	sd	a0,32(a5)
ffffffffc0205010:	f97c                	sd	a5,240(a0)
ffffffffc0205012:	fe9710e3          	bne	a4,s1,ffffffffc0204ff2 <do_exit+0x9a>
ffffffffc0205016:	0ec52783          	lw	a5,236(a0)
ffffffffc020501a:	fd379ce3          	bne	a5,s3,ffffffffc0204ff2 <do_exit+0x9a>
ffffffffc020501e:	51a030ef          	jal	ra,ffffffffc0208538 <wakeup_proc>
ffffffffc0205022:	00093683          	ld	a3,0(s2)
ffffffffc0205026:	b7f1                	j	ffffffffc0204ff2 <do_exit+0x9a>
ffffffffc0205028:	020a1363          	bnez	s4,ffffffffc020504e <do_exit+0xf6>
ffffffffc020502c:	5c6030ef          	jal	ra,ffffffffc02085f2 <schedule>
ffffffffc0205030:	00093783          	ld	a5,0(s2)
ffffffffc0205034:	00006617          	auipc	a2,0x6
ffffffffc0205038:	bbc60613          	addi	a2,a2,-1092 # ffffffffc020abf0 <default_pmm_manager+0x1228>
ffffffffc020503c:	1fc00593          	li	a1,508
ffffffffc0205040:	43d4                	lw	a3,4(a5)
ffffffffc0205042:	00006517          	auipc	a0,0x6
ffffffffc0205046:	e7650513          	addi	a0,a0,-394 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc020504a:	c3afb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020504e:	df6fb0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc0205052:	bfe9                	j	ffffffffc020502c <do_exit+0xd4>
ffffffffc0205054:	00006617          	auipc	a2,0x6
ffffffffc0205058:	b7c60613          	addi	a2,a2,-1156 # ffffffffc020abd0 <default_pmm_manager+0x1208>
ffffffffc020505c:	1d000593          	li	a1,464
ffffffffc0205060:	00006517          	auipc	a0,0x6
ffffffffc0205064:	e5850513          	addi	a0,a0,-424 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205068:	c1cfb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020506c:	8526                	mv	a0,s1
ffffffffc020506e:	f4ffe0ef          	jal	ra,ffffffffc0203fbc <exit_mmap>
ffffffffc0205072:	8526                	mv	a0,s1
ffffffffc0205074:	8b3ff0ef          	jal	ra,ffffffffc0204926 <put_pgdir>
ffffffffc0205078:	8526                	mv	a0,s1
ffffffffc020507a:	da3fe0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc020507e:	bf1d                	j	ffffffffc0204fb4 <do_exit+0x5c>
ffffffffc0205080:	00006617          	auipc	a2,0x6
ffffffffc0205084:	b6060613          	addi	a2,a2,-1184 # ffffffffc020abe0 <default_pmm_manager+0x1218>
ffffffffc0205088:	1d300593          	li	a1,467
ffffffffc020508c:	00006517          	auipc	a0,0x6
ffffffffc0205090:	e2c50513          	addi	a0,a0,-468 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205094:	bf0fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205098:	db2fb0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc020509c:	4a05                	li	s4,1
ffffffffc020509e:	bf15                	j	ffffffffc0204fd2 <do_exit+0x7a>
ffffffffc02050a0:	498030ef          	jal	ra,ffffffffc0208538 <wakeup_proc>
ffffffffc02050a4:	b789                	j	ffffffffc0204fe6 <do_exit+0x8e>

ffffffffc02050a6 <do_wait.part.1>:
ffffffffc02050a6:	7139                	addi	sp,sp,-64
ffffffffc02050a8:	e852                	sd	s4,16(sp)
ffffffffc02050aa:	80000a37          	lui	s4,0x80000
ffffffffc02050ae:	f426                	sd	s1,40(sp)
ffffffffc02050b0:	f04a                	sd	s2,32(sp)
ffffffffc02050b2:	ec4e                	sd	s3,24(sp)
ffffffffc02050b4:	e456                	sd	s5,8(sp)
ffffffffc02050b6:	e05a                	sd	s6,0(sp)
ffffffffc02050b8:	fc06                	sd	ra,56(sp)
ffffffffc02050ba:	f822                	sd	s0,48(sp)
ffffffffc02050bc:	89aa                	mv	s3,a0
ffffffffc02050be:	8b2e                	mv	s6,a1
ffffffffc02050c0:	00038917          	auipc	s2,0x38
ffffffffc02050c4:	db890913          	addi	s2,s2,-584 # ffffffffc023ce78 <current>
ffffffffc02050c8:	448d                	li	s1,3
ffffffffc02050ca:	4a85                	li	s5,1
ffffffffc02050cc:	0a05                	addi	s4,s4,1
ffffffffc02050ce:	02098f63          	beqz	s3,ffffffffc020510c <do_wait.part.1+0x66>
ffffffffc02050d2:	854e                	mv	a0,s3
ffffffffc02050d4:	9f3ff0ef          	jal	ra,ffffffffc0204ac6 <find_proc>
ffffffffc02050d8:	842a                	mv	s0,a0
ffffffffc02050da:	12050063          	beqz	a0,ffffffffc02051fa <do_wait.part.1+0x154>
ffffffffc02050de:	00093703          	ld	a4,0(s2)
ffffffffc02050e2:	711c                	ld	a5,32(a0)
ffffffffc02050e4:	10e79b63          	bne	a5,a4,ffffffffc02051fa <do_wait.part.1+0x154>
ffffffffc02050e8:	411c                	lw	a5,0(a0)
ffffffffc02050ea:	02978c63          	beq	a5,s1,ffffffffc0205122 <do_wait.part.1+0x7c>
ffffffffc02050ee:	01572023          	sw	s5,0(a4)
ffffffffc02050f2:	0f472623          	sw	s4,236(a4)
ffffffffc02050f6:	4fc030ef          	jal	ra,ffffffffc02085f2 <schedule>
ffffffffc02050fa:	00093783          	ld	a5,0(s2)
ffffffffc02050fe:	0b07a783          	lw	a5,176(a5)
ffffffffc0205102:	8b85                	andi	a5,a5,1
ffffffffc0205104:	d7e9                	beqz	a5,ffffffffc02050ce <do_wait.part.1+0x28>
ffffffffc0205106:	555d                	li	a0,-9
ffffffffc0205108:	e51ff0ef          	jal	ra,ffffffffc0204f58 <do_exit>
ffffffffc020510c:	00093703          	ld	a4,0(s2)
ffffffffc0205110:	7b60                	ld	s0,240(a4)
ffffffffc0205112:	e409                	bnez	s0,ffffffffc020511c <do_wait.part.1+0x76>
ffffffffc0205114:	a0dd                	j	ffffffffc02051fa <do_wait.part.1+0x154>
ffffffffc0205116:	10043403          	ld	s0,256(s0)
ffffffffc020511a:	d871                	beqz	s0,ffffffffc02050ee <do_wait.part.1+0x48>
ffffffffc020511c:	401c                	lw	a5,0(s0)
ffffffffc020511e:	fe979ce3          	bne	a5,s1,ffffffffc0205116 <do_wait.part.1+0x70>
ffffffffc0205122:	00038797          	auipc	a5,0x38
ffffffffc0205126:	d5e78793          	addi	a5,a5,-674 # ffffffffc023ce80 <idleproc>
ffffffffc020512a:	639c                	ld	a5,0(a5)
ffffffffc020512c:	0c878d63          	beq	a5,s0,ffffffffc0205206 <do_wait.part.1+0x160>
ffffffffc0205130:	00038797          	auipc	a5,0x38
ffffffffc0205134:	d5878793          	addi	a5,a5,-680 # ffffffffc023ce88 <initproc>
ffffffffc0205138:	639c                	ld	a5,0(a5)
ffffffffc020513a:	0cf40663          	beq	s0,a5,ffffffffc0205206 <do_wait.part.1+0x160>
ffffffffc020513e:	000b0663          	beqz	s6,ffffffffc020514a <do_wait.part.1+0xa4>
ffffffffc0205142:	0e842783          	lw	a5,232(s0)
ffffffffc0205146:	00fb2023          	sw	a5,0(s6)
ffffffffc020514a:	100027f3          	csrr	a5,sstatus
ffffffffc020514e:	8b89                	andi	a5,a5,2
ffffffffc0205150:	4581                	li	a1,0
ffffffffc0205152:	e7d5                	bnez	a5,ffffffffc02051fe <do_wait.part.1+0x158>
ffffffffc0205154:	6c70                	ld	a2,216(s0)
ffffffffc0205156:	7074                	ld	a3,224(s0)
ffffffffc0205158:	10043703          	ld	a4,256(s0)
ffffffffc020515c:	7c7c                	ld	a5,248(s0)
ffffffffc020515e:	e614                	sd	a3,8(a2)
ffffffffc0205160:	e290                	sd	a2,0(a3)
ffffffffc0205162:	6470                	ld	a2,200(s0)
ffffffffc0205164:	6874                	ld	a3,208(s0)
ffffffffc0205166:	e614                	sd	a3,8(a2)
ffffffffc0205168:	e290                	sd	a2,0(a3)
ffffffffc020516a:	c319                	beqz	a4,ffffffffc0205170 <do_wait.part.1+0xca>
ffffffffc020516c:	ff7c                	sd	a5,248(a4)
ffffffffc020516e:	7c7c                	ld	a5,248(s0)
ffffffffc0205170:	c3d1                	beqz	a5,ffffffffc02051f4 <do_wait.part.1+0x14e>
ffffffffc0205172:	10e7b023          	sd	a4,256(a5)
ffffffffc0205176:	00038797          	auipc	a5,0x38
ffffffffc020517a:	d1a78793          	addi	a5,a5,-742 # ffffffffc023ce90 <nr_process>
ffffffffc020517e:	439c                	lw	a5,0(a5)
ffffffffc0205180:	37fd                	addiw	a5,a5,-1
ffffffffc0205182:	00038717          	auipc	a4,0x38
ffffffffc0205186:	d0f72723          	sw	a5,-754(a4) # ffffffffc023ce90 <nr_process>
ffffffffc020518a:	e1b5                	bnez	a1,ffffffffc02051ee <do_wait.part.1+0x148>
ffffffffc020518c:	6814                	ld	a3,16(s0)
ffffffffc020518e:	c02007b7          	lui	a5,0xc0200
ffffffffc0205192:	0af6e263          	bltu	a3,a5,ffffffffc0205236 <do_wait.part.1+0x190>
ffffffffc0205196:	00038797          	auipc	a5,0x38
ffffffffc020519a:	d3a78793          	addi	a5,a5,-710 # ffffffffc023ced0 <va_pa_offset>
ffffffffc020519e:	6398                	ld	a4,0(a5)
ffffffffc02051a0:	00038797          	auipc	a5,0x38
ffffffffc02051a4:	cc078793          	addi	a5,a5,-832 # ffffffffc023ce60 <npage>
ffffffffc02051a8:	639c                	ld	a5,0(a5)
ffffffffc02051aa:	8e99                	sub	a3,a3,a4
ffffffffc02051ac:	82b1                	srli	a3,a3,0xc
ffffffffc02051ae:	06f6f863          	bgeu	a3,a5,ffffffffc020521e <do_wait.part.1+0x178>
ffffffffc02051b2:	00007797          	auipc	a5,0x7
ffffffffc02051b6:	8fe78793          	addi	a5,a5,-1794 # ffffffffc020bab0 <nbase>
ffffffffc02051ba:	639c                	ld	a5,0(a5)
ffffffffc02051bc:	00038717          	auipc	a4,0x38
ffffffffc02051c0:	d2470713          	addi	a4,a4,-732 # ffffffffc023cee0 <pages>
ffffffffc02051c4:	6308                	ld	a0,0(a4)
ffffffffc02051c6:	8e9d                	sub	a3,a3,a5
ffffffffc02051c8:	069a                	slli	a3,a3,0x6
ffffffffc02051ca:	9536                	add	a0,a0,a3
ffffffffc02051cc:	4589                	li	a1,2
ffffffffc02051ce:	bfffc0ef          	jal	ra,ffffffffc0201dcc <free_pages>
ffffffffc02051d2:	8522                	mv	a0,s0
ffffffffc02051d4:	a35fc0ef          	jal	ra,ffffffffc0201c08 <kfree>
ffffffffc02051d8:	4501                	li	a0,0
ffffffffc02051da:	70e2                	ld	ra,56(sp)
ffffffffc02051dc:	7442                	ld	s0,48(sp)
ffffffffc02051de:	74a2                	ld	s1,40(sp)
ffffffffc02051e0:	7902                	ld	s2,32(sp)
ffffffffc02051e2:	69e2                	ld	s3,24(sp)
ffffffffc02051e4:	6a42                	ld	s4,16(sp)
ffffffffc02051e6:	6aa2                	ld	s5,8(sp)
ffffffffc02051e8:	6b02                	ld	s6,0(sp)
ffffffffc02051ea:	6121                	addi	sp,sp,64
ffffffffc02051ec:	8082                	ret
ffffffffc02051ee:	c56fb0ef          	jal	ra,ffffffffc0200644 <intr_enable>
ffffffffc02051f2:	bf69                	j	ffffffffc020518c <do_wait.part.1+0xe6>
ffffffffc02051f4:	701c                	ld	a5,32(s0)
ffffffffc02051f6:	fbf8                	sd	a4,240(a5)
ffffffffc02051f8:	bfbd                	j	ffffffffc0205176 <do_wait.part.1+0xd0>
ffffffffc02051fa:	5579                	li	a0,-2
ffffffffc02051fc:	bff9                	j	ffffffffc02051da <do_wait.part.1+0x134>
ffffffffc02051fe:	c4cfb0ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc0205202:	4585                	li	a1,1
ffffffffc0205204:	bf81                	j	ffffffffc0205154 <do_wait.part.1+0xae>
ffffffffc0205206:	00006617          	auipc	a2,0x6
ffffffffc020520a:	a5260613          	addi	a2,a2,-1454 # ffffffffc020ac58 <default_pmm_manager+0x1290>
ffffffffc020520e:	2f900593          	li	a1,761
ffffffffc0205212:	00006517          	auipc	a0,0x6
ffffffffc0205216:	ca650513          	addi	a0,a0,-858 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc020521a:	a6afb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc020521e:	00005617          	auipc	a2,0x5
ffffffffc0205222:	85a60613          	addi	a2,a2,-1958 # ffffffffc0209a78 <default_pmm_manager+0xb0>
ffffffffc0205226:	06200593          	li	a1,98
ffffffffc020522a:	00005517          	auipc	a0,0x5
ffffffffc020522e:	81650513          	addi	a0,a0,-2026 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc0205232:	a52fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205236:	00005617          	auipc	a2,0x5
ffffffffc020523a:	81a60613          	addi	a2,a2,-2022 # ffffffffc0209a50 <default_pmm_manager+0x88>
ffffffffc020523e:	06e00593          	li	a1,110
ffffffffc0205242:	00004517          	auipc	a0,0x4
ffffffffc0205246:	7fe50513          	addi	a0,a0,2046 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc020524a:	a3afb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc020524e <init_main>:
ffffffffc020524e:	1141                	addi	sp,sp,-16
ffffffffc0205250:	e406                	sd	ra,8(sp)
ffffffffc0205252:	bc1fc0ef          	jal	ra,ffffffffc0201e12 <nr_free_pages>
ffffffffc0205256:	8f3fc0ef          	jal	ra,ffffffffc0201b48 <kallocated>
ffffffffc020525a:	4601                	li	a2,0
ffffffffc020525c:	4581                	li	a1,0
ffffffffc020525e:	fffff517          	auipc	a0,0xfffff
ffffffffc0205262:	64650513          	addi	a0,a0,1606 # ffffffffc02048a4 <user_main>
ffffffffc0205266:	ca3ff0ef          	jal	ra,ffffffffc0204f08 <kernel_thread>
ffffffffc020526a:	00a04563          	bgtz	a0,ffffffffc0205274 <init_main+0x26>
ffffffffc020526e:	a841                	j	ffffffffc02052fe <init_main+0xb0>
ffffffffc0205270:	382030ef          	jal	ra,ffffffffc02085f2 <schedule>
ffffffffc0205274:	4581                	li	a1,0
ffffffffc0205276:	4501                	li	a0,0
ffffffffc0205278:	e2fff0ef          	jal	ra,ffffffffc02050a6 <do_wait.part.1>
ffffffffc020527c:	d975                	beqz	a0,ffffffffc0205270 <init_main+0x22>
ffffffffc020527e:	00006517          	auipc	a0,0x6
ffffffffc0205282:	a1a50513          	addi	a0,a0,-1510 # ffffffffc020ac98 <default_pmm_manager+0x12d0>
ffffffffc0205286:	f0dfa0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc020528a:	00038797          	auipc	a5,0x38
ffffffffc020528e:	bfe78793          	addi	a5,a5,-1026 # ffffffffc023ce88 <initproc>
ffffffffc0205292:	639c                	ld	a5,0(a5)
ffffffffc0205294:	7bf8                	ld	a4,240(a5)
ffffffffc0205296:	e721                	bnez	a4,ffffffffc02052de <init_main+0x90>
ffffffffc0205298:	7ff8                	ld	a4,248(a5)
ffffffffc020529a:	e331                	bnez	a4,ffffffffc02052de <init_main+0x90>
ffffffffc020529c:	1007b703          	ld	a4,256(a5)
ffffffffc02052a0:	ef1d                	bnez	a4,ffffffffc02052de <init_main+0x90>
ffffffffc02052a2:	00038717          	auipc	a4,0x38
ffffffffc02052a6:	bee70713          	addi	a4,a4,-1042 # ffffffffc023ce90 <nr_process>
ffffffffc02052aa:	4314                	lw	a3,0(a4)
ffffffffc02052ac:	4709                	li	a4,2
ffffffffc02052ae:	0ae69463          	bne	a3,a4,ffffffffc0205356 <init_main+0x108>
ffffffffc02052b2:	00038697          	auipc	a3,0x38
ffffffffc02052b6:	d1668693          	addi	a3,a3,-746 # ffffffffc023cfc8 <proc_list>
ffffffffc02052ba:	6698                	ld	a4,8(a3)
ffffffffc02052bc:	0c878793          	addi	a5,a5,200
ffffffffc02052c0:	06f71b63          	bne	a4,a5,ffffffffc0205336 <init_main+0xe8>
ffffffffc02052c4:	629c                	ld	a5,0(a3)
ffffffffc02052c6:	04f71863          	bne	a4,a5,ffffffffc0205316 <init_main+0xc8>
ffffffffc02052ca:	00006517          	auipc	a0,0x6
ffffffffc02052ce:	ab650513          	addi	a0,a0,-1354 # ffffffffc020ad80 <default_pmm_manager+0x13b8>
ffffffffc02052d2:	ec1fa0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc02052d6:	60a2                	ld	ra,8(sp)
ffffffffc02052d8:	4501                	li	a0,0
ffffffffc02052da:	0141                	addi	sp,sp,16
ffffffffc02052dc:	8082                	ret
ffffffffc02052de:	00006697          	auipc	a3,0x6
ffffffffc02052e2:	9e268693          	addi	a3,a3,-1566 # ffffffffc020acc0 <default_pmm_manager+0x12f8>
ffffffffc02052e6:	00004617          	auipc	a2,0x4
ffffffffc02052ea:	f9a60613          	addi	a2,a2,-102 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02052ee:	35d00593          	li	a1,861
ffffffffc02052f2:	00006517          	auipc	a0,0x6
ffffffffc02052f6:	bc650513          	addi	a0,a0,-1082 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc02052fa:	98afb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02052fe:	00006617          	auipc	a2,0x6
ffffffffc0205302:	97a60613          	addi	a2,a2,-1670 # ffffffffc020ac78 <default_pmm_manager+0x12b0>
ffffffffc0205306:	35500593          	li	a1,853
ffffffffc020530a:	00006517          	auipc	a0,0x6
ffffffffc020530e:	bae50513          	addi	a0,a0,-1106 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205312:	972fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205316:	00006697          	auipc	a3,0x6
ffffffffc020531a:	a3a68693          	addi	a3,a3,-1478 # ffffffffc020ad50 <default_pmm_manager+0x1388>
ffffffffc020531e:	00004617          	auipc	a2,0x4
ffffffffc0205322:	f6260613          	addi	a2,a2,-158 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205326:	36000593          	li	a1,864
ffffffffc020532a:	00006517          	auipc	a0,0x6
ffffffffc020532e:	b8e50513          	addi	a0,a0,-1138 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205332:	952fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205336:	00006697          	auipc	a3,0x6
ffffffffc020533a:	9ea68693          	addi	a3,a3,-1558 # ffffffffc020ad20 <default_pmm_manager+0x1358>
ffffffffc020533e:	00004617          	auipc	a2,0x4
ffffffffc0205342:	f4260613          	addi	a2,a2,-190 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205346:	35f00593          	li	a1,863
ffffffffc020534a:	00006517          	auipc	a0,0x6
ffffffffc020534e:	b6e50513          	addi	a0,a0,-1170 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205352:	932fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205356:	00006697          	auipc	a3,0x6
ffffffffc020535a:	9ba68693          	addi	a3,a3,-1606 # ffffffffc020ad10 <default_pmm_manager+0x1348>
ffffffffc020535e:	00004617          	auipc	a2,0x4
ffffffffc0205362:	f2260613          	addi	a2,a2,-222 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205366:	35e00593          	li	a1,862
ffffffffc020536a:	00006517          	auipc	a0,0x6
ffffffffc020536e:	b4e50513          	addi	a0,a0,-1202 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205372:	912fb0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0205376 <do_execve>:
ffffffffc0205376:	7135                	addi	sp,sp,-160
ffffffffc0205378:	f8d2                	sd	s4,112(sp)
ffffffffc020537a:	00038a17          	auipc	s4,0x38
ffffffffc020537e:	afea0a13          	addi	s4,s4,-1282 # ffffffffc023ce78 <current>
ffffffffc0205382:	000a3783          	ld	a5,0(s4)
ffffffffc0205386:	e14a                	sd	s2,128(sp)
ffffffffc0205388:	e922                	sd	s0,144(sp)
ffffffffc020538a:	0287b903          	ld	s2,40(a5)
ffffffffc020538e:	fcce                	sd	s3,120(sp)
ffffffffc0205390:	f0da                	sd	s6,96(sp)
ffffffffc0205392:	89aa                	mv	s3,a0
ffffffffc0205394:	842e                	mv	s0,a1
ffffffffc0205396:	8b32                	mv	s6,a2
ffffffffc0205398:	4681                	li	a3,0
ffffffffc020539a:	862e                	mv	a2,a1
ffffffffc020539c:	85aa                	mv	a1,a0
ffffffffc020539e:	854a                	mv	a0,s2
ffffffffc02053a0:	ed06                	sd	ra,152(sp)
ffffffffc02053a2:	e526                	sd	s1,136(sp)
ffffffffc02053a4:	f4d6                	sd	s5,104(sp)
ffffffffc02053a6:	ecde                	sd	s7,88(sp)
ffffffffc02053a8:	e8e2                	sd	s8,80(sp)
ffffffffc02053aa:	e4e6                	sd	s9,72(sp)
ffffffffc02053ac:	e0ea                	sd	s10,64(sp)
ffffffffc02053ae:	fc6e                	sd	s11,56(sp)
ffffffffc02053b0:	a5cff0ef          	jal	ra,ffffffffc020460c <user_mem_check>
ffffffffc02053b4:	40050263          	beqz	a0,ffffffffc02057b8 <do_execve+0x442>
ffffffffc02053b8:	4641                	li	a2,16
ffffffffc02053ba:	4581                	li	a1,0
ffffffffc02053bc:	1008                	addi	a0,sp,32
ffffffffc02053be:	0a7030ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc02053c2:	47bd                	li	a5,15
ffffffffc02053c4:	8622                	mv	a2,s0
ffffffffc02053c6:	0687ee63          	bltu	a5,s0,ffffffffc0205442 <do_execve+0xcc>
ffffffffc02053ca:	85ce                	mv	a1,s3
ffffffffc02053cc:	1008                	addi	a0,sp,32
ffffffffc02053ce:	0a9030ef          	jal	ra,ffffffffc0208c76 <memcpy>
ffffffffc02053d2:	06090f63          	beqz	s2,ffffffffc0205450 <do_execve+0xda>
ffffffffc02053d6:	00005517          	auipc	a0,0x5
ffffffffc02053da:	dc250513          	addi	a0,a0,-574 # ffffffffc020a198 <default_pmm_manager+0x7d0>
ffffffffc02053de:	debfa0ef          	jal	ra,ffffffffc02001c8 <cputs>
ffffffffc02053e2:	00038797          	auipc	a5,0x38
ffffffffc02053e6:	af678793          	addi	a5,a5,-1290 # ffffffffc023ced8 <boot_cr3>
ffffffffc02053ea:	639c                	ld	a5,0(a5)
ffffffffc02053ec:	577d                	li	a4,-1
ffffffffc02053ee:	177e                	slli	a4,a4,0x3f
ffffffffc02053f0:	83b1                	srli	a5,a5,0xc
ffffffffc02053f2:	8fd9                	or	a5,a5,a4
ffffffffc02053f4:	18079073          	csrw	satp,a5
ffffffffc02053f8:	03092783          	lw	a5,48(s2)
ffffffffc02053fc:	fff7871b          	addiw	a4,a5,-1
ffffffffc0205400:	02e92823          	sw	a4,48(s2)
ffffffffc0205404:	28070c63          	beqz	a4,ffffffffc020569c <do_execve+0x326>
ffffffffc0205408:	000a3783          	ld	a5,0(s4)
ffffffffc020540c:	0207b423          	sd	zero,40(a5)
ffffffffc0205410:	887fe0ef          	jal	ra,ffffffffc0203c96 <mm_create>
ffffffffc0205414:	892a                	mv	s2,a0
ffffffffc0205416:	c135                	beqz	a0,ffffffffc020547a <do_execve+0x104>
ffffffffc0205418:	d8cff0ef          	jal	ra,ffffffffc02049a4 <setup_pgdir>
ffffffffc020541c:	e931                	bnez	a0,ffffffffc0205470 <do_execve+0xfa>
ffffffffc020541e:	000b2703          	lw	a4,0(s6)
ffffffffc0205422:	464c47b7          	lui	a5,0x464c4
ffffffffc0205426:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_matrix_out_size+0x464c1c47>
ffffffffc020542a:	04f70a63          	beq	a4,a5,ffffffffc020547e <do_execve+0x108>
ffffffffc020542e:	854a                	mv	a0,s2
ffffffffc0205430:	cf6ff0ef          	jal	ra,ffffffffc0204926 <put_pgdir>
ffffffffc0205434:	854a                	mv	a0,s2
ffffffffc0205436:	9e7fe0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc020543a:	59e1                	li	s3,-8
ffffffffc020543c:	854e                	mv	a0,s3
ffffffffc020543e:	b1bff0ef          	jal	ra,ffffffffc0204f58 <do_exit>
ffffffffc0205442:	463d                	li	a2,15
ffffffffc0205444:	85ce                	mv	a1,s3
ffffffffc0205446:	1008                	addi	a0,sp,32
ffffffffc0205448:	02f030ef          	jal	ra,ffffffffc0208c76 <memcpy>
ffffffffc020544c:	f80915e3          	bnez	s2,ffffffffc02053d6 <do_execve+0x60>
ffffffffc0205450:	000a3783          	ld	a5,0(s4)
ffffffffc0205454:	779c                	ld	a5,40(a5)
ffffffffc0205456:	dfcd                	beqz	a5,ffffffffc0205410 <do_execve+0x9a>
ffffffffc0205458:	00005617          	auipc	a2,0x5
ffffffffc020545c:	5f060613          	addi	a2,a2,1520 # ffffffffc020aa48 <default_pmm_manager+0x1080>
ffffffffc0205460:	20600593          	li	a1,518
ffffffffc0205464:	00006517          	auipc	a0,0x6
ffffffffc0205468:	a5450513          	addi	a0,a0,-1452 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc020546c:	818fb0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205470:	854a                	mv	a0,s2
ffffffffc0205472:	9abfe0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc0205476:	59f1                	li	s3,-4
ffffffffc0205478:	b7d1                	j	ffffffffc020543c <do_execve+0xc6>
ffffffffc020547a:	59f1                	li	s3,-4
ffffffffc020547c:	b7c1                	j	ffffffffc020543c <do_execve+0xc6>
ffffffffc020547e:	038b5703          	lhu	a4,56(s6)
ffffffffc0205482:	020b3403          	ld	s0,32(s6)
ffffffffc0205486:	00371793          	slli	a5,a4,0x3
ffffffffc020548a:	8f99                	sub	a5,a5,a4
ffffffffc020548c:	945a                	add	s0,s0,s6
ffffffffc020548e:	078e                	slli	a5,a5,0x3
ffffffffc0205490:	97a2                	add	a5,a5,s0
ffffffffc0205492:	ec3e                	sd	a5,24(sp)
ffffffffc0205494:	02f47b63          	bgeu	s0,a5,ffffffffc02054ca <do_execve+0x154>
ffffffffc0205498:	5bfd                	li	s7,-1
ffffffffc020549a:	00cbd793          	srli	a5,s7,0xc
ffffffffc020549e:	00038d97          	auipc	s11,0x38
ffffffffc02054a2:	a42d8d93          	addi	s11,s11,-1470 # ffffffffc023cee0 <pages>
ffffffffc02054a6:	00006d17          	auipc	s10,0x6
ffffffffc02054aa:	60ad0d13          	addi	s10,s10,1546 # ffffffffc020bab0 <nbase>
ffffffffc02054ae:	e43e                	sd	a5,8(sp)
ffffffffc02054b0:	00038c97          	auipc	s9,0x38
ffffffffc02054b4:	9b0c8c93          	addi	s9,s9,-1616 # ffffffffc023ce60 <npage>
ffffffffc02054b8:	4018                	lw	a4,0(s0)
ffffffffc02054ba:	4785                	li	a5,1
ffffffffc02054bc:	0ef70d63          	beq	a4,a5,ffffffffc02055b6 <do_execve+0x240>
ffffffffc02054c0:	67e2                	ld	a5,24(sp)
ffffffffc02054c2:	03840413          	addi	s0,s0,56
ffffffffc02054c6:	fef469e3          	bltu	s0,a5,ffffffffc02054b8 <do_execve+0x142>
ffffffffc02054ca:	4701                	li	a4,0
ffffffffc02054cc:	46ad                	li	a3,11
ffffffffc02054ce:	00100637          	lui	a2,0x100
ffffffffc02054d2:	7ff005b7          	lui	a1,0x7ff00
ffffffffc02054d6:	854a                	mv	a0,s2
ffffffffc02054d8:	997fe0ef          	jal	ra,ffffffffc0203e6e <mm_map>
ffffffffc02054dc:	89aa                	mv	s3,a0
ffffffffc02054de:	1a051563          	bnez	a0,ffffffffc0205688 <do_execve+0x312>
ffffffffc02054e2:	01893503          	ld	a0,24(s2)
ffffffffc02054e6:	467d                	li	a2,31
ffffffffc02054e8:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc02054ec:	a85fd0ef          	jal	ra,ffffffffc0202f70 <pgdir_alloc_page>
ffffffffc02054f0:	36050063          	beqz	a0,ffffffffc0205850 <do_execve+0x4da>
ffffffffc02054f4:	01893503          	ld	a0,24(s2)
ffffffffc02054f8:	467d                	li	a2,31
ffffffffc02054fa:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc02054fe:	a73fd0ef          	jal	ra,ffffffffc0202f70 <pgdir_alloc_page>
ffffffffc0205502:	32050763          	beqz	a0,ffffffffc0205830 <do_execve+0x4ba>
ffffffffc0205506:	01893503          	ld	a0,24(s2)
ffffffffc020550a:	467d                	li	a2,31
ffffffffc020550c:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0205510:	a61fd0ef          	jal	ra,ffffffffc0202f70 <pgdir_alloc_page>
ffffffffc0205514:	2e050e63          	beqz	a0,ffffffffc0205810 <do_execve+0x49a>
ffffffffc0205518:	01893503          	ld	a0,24(s2)
ffffffffc020551c:	467d                	li	a2,31
ffffffffc020551e:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0205522:	a4ffd0ef          	jal	ra,ffffffffc0202f70 <pgdir_alloc_page>
ffffffffc0205526:	2c050563          	beqz	a0,ffffffffc02057f0 <do_execve+0x47a>
ffffffffc020552a:	03092783          	lw	a5,48(s2)
ffffffffc020552e:	000a3603          	ld	a2,0(s4)
ffffffffc0205532:	01893683          	ld	a3,24(s2)
ffffffffc0205536:	2785                	addiw	a5,a5,1
ffffffffc0205538:	02f92823          	sw	a5,48(s2)
ffffffffc020553c:	03263423          	sd	s2,40(a2) # 100028 <_binary_obj___user_matrix_out_size+0xfd6f0>
ffffffffc0205540:	c02007b7          	lui	a5,0xc0200
ffffffffc0205544:	28f6ea63          	bltu	a3,a5,ffffffffc02057d8 <do_execve+0x462>
ffffffffc0205548:	00038797          	auipc	a5,0x38
ffffffffc020554c:	98878793          	addi	a5,a5,-1656 # ffffffffc023ced0 <va_pa_offset>
ffffffffc0205550:	639c                	ld	a5,0(a5)
ffffffffc0205552:	577d                	li	a4,-1
ffffffffc0205554:	177e                	slli	a4,a4,0x3f
ffffffffc0205556:	8e9d                	sub	a3,a3,a5
ffffffffc0205558:	00c6d793          	srli	a5,a3,0xc
ffffffffc020555c:	f654                	sd	a3,168(a2)
ffffffffc020555e:	8fd9                	or	a5,a5,a4
ffffffffc0205560:	18079073          	csrw	satp,a5
ffffffffc0205564:	7240                	ld	s0,160(a2)
ffffffffc0205566:	4581                	li	a1,0
ffffffffc0205568:	12000613          	li	a2,288
ffffffffc020556c:	8522                	mv	a0,s0
ffffffffc020556e:	10043483          	ld	s1,256(s0)
ffffffffc0205572:	6f2030ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc0205576:	018b3703          	ld	a4,24(s6)
ffffffffc020557a:	4785                	li	a5,1
ffffffffc020557c:	000a3503          	ld	a0,0(s4)
ffffffffc0205580:	edf4f493          	andi	s1,s1,-289
ffffffffc0205584:	07fe                	slli	a5,a5,0x1f
ffffffffc0205586:	e81c                	sd	a5,16(s0)
ffffffffc0205588:	10e43423          	sd	a4,264(s0)
ffffffffc020558c:	10943023          	sd	s1,256(s0)
ffffffffc0205590:	100c                	addi	a1,sp,32
ffffffffc0205592:	c9eff0ef          	jal	ra,ffffffffc0204a30 <set_proc_name>
ffffffffc0205596:	60ea                	ld	ra,152(sp)
ffffffffc0205598:	644a                	ld	s0,144(sp)
ffffffffc020559a:	854e                	mv	a0,s3
ffffffffc020559c:	64aa                	ld	s1,136(sp)
ffffffffc020559e:	690a                	ld	s2,128(sp)
ffffffffc02055a0:	79e6                	ld	s3,120(sp)
ffffffffc02055a2:	7a46                	ld	s4,112(sp)
ffffffffc02055a4:	7aa6                	ld	s5,104(sp)
ffffffffc02055a6:	7b06                	ld	s6,96(sp)
ffffffffc02055a8:	6be6                	ld	s7,88(sp)
ffffffffc02055aa:	6c46                	ld	s8,80(sp)
ffffffffc02055ac:	6ca6                	ld	s9,72(sp)
ffffffffc02055ae:	6d06                	ld	s10,64(sp)
ffffffffc02055b0:	7de2                	ld	s11,56(sp)
ffffffffc02055b2:	610d                	addi	sp,sp,160
ffffffffc02055b4:	8082                	ret
ffffffffc02055b6:	7410                	ld	a2,40(s0)
ffffffffc02055b8:	701c                	ld	a5,32(s0)
ffffffffc02055ba:	20f66163          	bltu	a2,a5,ffffffffc02057bc <do_execve+0x446>
ffffffffc02055be:	405c                	lw	a5,4(s0)
ffffffffc02055c0:	0017f693          	andi	a3,a5,1
ffffffffc02055c4:	c291                	beqz	a3,ffffffffc02055c8 <do_execve+0x252>
ffffffffc02055c6:	4691                	li	a3,4
ffffffffc02055c8:	0027f713          	andi	a4,a5,2
ffffffffc02055cc:	8b91                	andi	a5,a5,4
ffffffffc02055ce:	0e071163          	bnez	a4,ffffffffc02056b0 <do_execve+0x33a>
ffffffffc02055d2:	4745                	li	a4,17
ffffffffc02055d4:	e03a                	sd	a4,0(sp)
ffffffffc02055d6:	c789                	beqz	a5,ffffffffc02055e0 <do_execve+0x26a>
ffffffffc02055d8:	47cd                	li	a5,19
ffffffffc02055da:	0016e693          	ori	a3,a3,1
ffffffffc02055de:	e03e                	sd	a5,0(sp)
ffffffffc02055e0:	0026f793          	andi	a5,a3,2
ffffffffc02055e4:	ebe9                	bnez	a5,ffffffffc02056b6 <do_execve+0x340>
ffffffffc02055e6:	0046f793          	andi	a5,a3,4
ffffffffc02055ea:	c789                	beqz	a5,ffffffffc02055f4 <do_execve+0x27e>
ffffffffc02055ec:	6782                	ld	a5,0(sp)
ffffffffc02055ee:	0087e793          	ori	a5,a5,8
ffffffffc02055f2:	e03e                	sd	a5,0(sp)
ffffffffc02055f4:	680c                	ld	a1,16(s0)
ffffffffc02055f6:	4701                	li	a4,0
ffffffffc02055f8:	854a                	mv	a0,s2
ffffffffc02055fa:	875fe0ef          	jal	ra,ffffffffc0203e6e <mm_map>
ffffffffc02055fe:	89aa                	mv	s3,a0
ffffffffc0205600:	e541                	bnez	a0,ffffffffc0205688 <do_execve+0x312>
ffffffffc0205602:	01043b83          	ld	s7,16(s0)
ffffffffc0205606:	02043983          	ld	s3,32(s0)
ffffffffc020560a:	00843a83          	ld	s5,8(s0)
ffffffffc020560e:	77fd                	lui	a5,0xfffff
ffffffffc0205610:	99de                	add	s3,s3,s7
ffffffffc0205612:	9ada                	add	s5,s5,s6
ffffffffc0205614:	00fbfc33          	and	s8,s7,a5
ffffffffc0205618:	053bef63          	bltu	s7,s3,ffffffffc0205676 <do_execve+0x300>
ffffffffc020561c:	aa61                	j	ffffffffc02057b4 <do_execve+0x43e>
ffffffffc020561e:	6785                	lui	a5,0x1
ffffffffc0205620:	418b8533          	sub	a0,s7,s8
ffffffffc0205624:	9c3e                	add	s8,s8,a5
ffffffffc0205626:	417c0833          	sub	a6,s8,s7
ffffffffc020562a:	0189f463          	bgeu	s3,s8,ffffffffc0205632 <do_execve+0x2bc>
ffffffffc020562e:	41798833          	sub	a6,s3,s7
ffffffffc0205632:	000db683          	ld	a3,0(s11)
ffffffffc0205636:	000d3583          	ld	a1,0(s10)
ffffffffc020563a:	67a2                	ld	a5,8(sp)
ffffffffc020563c:	40d486b3          	sub	a3,s1,a3
ffffffffc0205640:	8699                	srai	a3,a3,0x6
ffffffffc0205642:	000cb603          	ld	a2,0(s9)
ffffffffc0205646:	96ae                	add	a3,a3,a1
ffffffffc0205648:	00f6f5b3          	and	a1,a3,a5
ffffffffc020564c:	06b2                	slli	a3,a3,0xc
ffffffffc020564e:	16c5f963          	bgeu	a1,a2,ffffffffc02057c0 <do_execve+0x44a>
ffffffffc0205652:	00038797          	auipc	a5,0x38
ffffffffc0205656:	87e78793          	addi	a5,a5,-1922 # ffffffffc023ced0 <va_pa_offset>
ffffffffc020565a:	0007b883          	ld	a7,0(a5)
ffffffffc020565e:	85d6                	mv	a1,s5
ffffffffc0205660:	8642                	mv	a2,a6
ffffffffc0205662:	96c6                	add	a3,a3,a7
ffffffffc0205664:	9536                	add	a0,a0,a3
ffffffffc0205666:	9bc2                	add	s7,s7,a6
ffffffffc0205668:	e842                	sd	a6,16(sp)
ffffffffc020566a:	60c030ef          	jal	ra,ffffffffc0208c76 <memcpy>
ffffffffc020566e:	6842                	ld	a6,16(sp)
ffffffffc0205670:	9ac2                	add	s5,s5,a6
ffffffffc0205672:	053bf563          	bgeu	s7,s3,ffffffffc02056bc <do_execve+0x346>
ffffffffc0205676:	01893503          	ld	a0,24(s2)
ffffffffc020567a:	6602                	ld	a2,0(sp)
ffffffffc020567c:	85e2                	mv	a1,s8
ffffffffc020567e:	8f3fd0ef          	jal	ra,ffffffffc0202f70 <pgdir_alloc_page>
ffffffffc0205682:	84aa                	mv	s1,a0
ffffffffc0205684:	fd49                	bnez	a0,ffffffffc020561e <do_execve+0x2a8>
ffffffffc0205686:	59f1                	li	s3,-4
ffffffffc0205688:	854a                	mv	a0,s2
ffffffffc020568a:	933fe0ef          	jal	ra,ffffffffc0203fbc <exit_mmap>
ffffffffc020568e:	854a                	mv	a0,s2
ffffffffc0205690:	a96ff0ef          	jal	ra,ffffffffc0204926 <put_pgdir>
ffffffffc0205694:	854a                	mv	a0,s2
ffffffffc0205696:	f86fe0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc020569a:	b34d                	j	ffffffffc020543c <do_execve+0xc6>
ffffffffc020569c:	854a                	mv	a0,s2
ffffffffc020569e:	91ffe0ef          	jal	ra,ffffffffc0203fbc <exit_mmap>
ffffffffc02056a2:	854a                	mv	a0,s2
ffffffffc02056a4:	a82ff0ef          	jal	ra,ffffffffc0204926 <put_pgdir>
ffffffffc02056a8:	854a                	mv	a0,s2
ffffffffc02056aa:	f72fe0ef          	jal	ra,ffffffffc0203e1c <mm_destroy>
ffffffffc02056ae:	bba9                	j	ffffffffc0205408 <do_execve+0x92>
ffffffffc02056b0:	0026e693          	ori	a3,a3,2
ffffffffc02056b4:	f395                	bnez	a5,ffffffffc02055d8 <do_execve+0x262>
ffffffffc02056b6:	47dd                	li	a5,23
ffffffffc02056b8:	e03e                	sd	a5,0(sp)
ffffffffc02056ba:	b735                	j	ffffffffc02055e6 <do_execve+0x270>
ffffffffc02056bc:	01043983          	ld	s3,16(s0)
ffffffffc02056c0:	7414                	ld	a3,40(s0)
ffffffffc02056c2:	99b6                	add	s3,s3,a3
ffffffffc02056c4:	098bf163          	bgeu	s7,s8,ffffffffc0205746 <do_execve+0x3d0>
ffffffffc02056c8:	df798ce3          	beq	s3,s7,ffffffffc02054c0 <do_execve+0x14a>
ffffffffc02056cc:	6505                	lui	a0,0x1
ffffffffc02056ce:	955e                	add	a0,a0,s7
ffffffffc02056d0:	41850533          	sub	a0,a0,s8
ffffffffc02056d4:	41798ab3          	sub	s5,s3,s7
ffffffffc02056d8:	0d89fb63          	bgeu	s3,s8,ffffffffc02057ae <do_execve+0x438>
ffffffffc02056dc:	000db683          	ld	a3,0(s11)
ffffffffc02056e0:	000d3583          	ld	a1,0(s10)
ffffffffc02056e4:	67a2                	ld	a5,8(sp)
ffffffffc02056e6:	40d486b3          	sub	a3,s1,a3
ffffffffc02056ea:	8699                	srai	a3,a3,0x6
ffffffffc02056ec:	000cb603          	ld	a2,0(s9)
ffffffffc02056f0:	96ae                	add	a3,a3,a1
ffffffffc02056f2:	00f6f5b3          	and	a1,a3,a5
ffffffffc02056f6:	06b2                	slli	a3,a3,0xc
ffffffffc02056f8:	0cc5f463          	bgeu	a1,a2,ffffffffc02057c0 <do_execve+0x44a>
ffffffffc02056fc:	00037617          	auipc	a2,0x37
ffffffffc0205700:	7d460613          	addi	a2,a2,2004 # ffffffffc023ced0 <va_pa_offset>
ffffffffc0205704:	00063803          	ld	a6,0(a2)
ffffffffc0205708:	4581                	li	a1,0
ffffffffc020570a:	8656                	mv	a2,s5
ffffffffc020570c:	96c2                	add	a3,a3,a6
ffffffffc020570e:	9536                	add	a0,a0,a3
ffffffffc0205710:	554030ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc0205714:	017a8733          	add	a4,s5,s7
ffffffffc0205718:	0389f463          	bgeu	s3,s8,ffffffffc0205740 <do_execve+0x3ca>
ffffffffc020571c:	dae982e3          	beq	s3,a4,ffffffffc02054c0 <do_execve+0x14a>
ffffffffc0205720:	00005697          	auipc	a3,0x5
ffffffffc0205724:	35068693          	addi	a3,a3,848 # ffffffffc020aa70 <default_pmm_manager+0x10a8>
ffffffffc0205728:	00004617          	auipc	a2,0x4
ffffffffc020572c:	b5860613          	addi	a2,a2,-1192 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205730:	25b00593          	li	a1,603
ffffffffc0205734:	00005517          	auipc	a0,0x5
ffffffffc0205738:	78450513          	addi	a0,a0,1924 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc020573c:	d49fa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205740:	ff8710e3          	bne	a4,s8,ffffffffc0205720 <do_execve+0x3aa>
ffffffffc0205744:	8be2                	mv	s7,s8
ffffffffc0205746:	00037a97          	auipc	s5,0x37
ffffffffc020574a:	78aa8a93          	addi	s5,s5,1930 # ffffffffc023ced0 <va_pa_offset>
ffffffffc020574e:	053be763          	bltu	s7,s3,ffffffffc020579c <do_execve+0x426>
ffffffffc0205752:	b3bd                	j	ffffffffc02054c0 <do_execve+0x14a>
ffffffffc0205754:	6785                	lui	a5,0x1
ffffffffc0205756:	418b8533          	sub	a0,s7,s8
ffffffffc020575a:	9c3e                	add	s8,s8,a5
ffffffffc020575c:	417c0633          	sub	a2,s8,s7
ffffffffc0205760:	0189f463          	bgeu	s3,s8,ffffffffc0205768 <do_execve+0x3f2>
ffffffffc0205764:	41798633          	sub	a2,s3,s7
ffffffffc0205768:	000db683          	ld	a3,0(s11)
ffffffffc020576c:	000d3803          	ld	a6,0(s10)
ffffffffc0205770:	67a2                	ld	a5,8(sp)
ffffffffc0205772:	40d486b3          	sub	a3,s1,a3
ffffffffc0205776:	8699                	srai	a3,a3,0x6
ffffffffc0205778:	000cb583          	ld	a1,0(s9)
ffffffffc020577c:	96c2                	add	a3,a3,a6
ffffffffc020577e:	00f6f833          	and	a6,a3,a5
ffffffffc0205782:	06b2                	slli	a3,a3,0xc
ffffffffc0205784:	02b87e63          	bgeu	a6,a1,ffffffffc02057c0 <do_execve+0x44a>
ffffffffc0205788:	000ab803          	ld	a6,0(s5)
ffffffffc020578c:	9bb2                	add	s7,s7,a2
ffffffffc020578e:	4581                	li	a1,0
ffffffffc0205790:	96c2                	add	a3,a3,a6
ffffffffc0205792:	9536                	add	a0,a0,a3
ffffffffc0205794:	4d0030ef          	jal	ra,ffffffffc0208c64 <memset>
ffffffffc0205798:	d33bf4e3          	bgeu	s7,s3,ffffffffc02054c0 <do_execve+0x14a>
ffffffffc020579c:	01893503          	ld	a0,24(s2)
ffffffffc02057a0:	6602                	ld	a2,0(sp)
ffffffffc02057a2:	85e2                	mv	a1,s8
ffffffffc02057a4:	fccfd0ef          	jal	ra,ffffffffc0202f70 <pgdir_alloc_page>
ffffffffc02057a8:	84aa                	mv	s1,a0
ffffffffc02057aa:	f54d                	bnez	a0,ffffffffc0205754 <do_execve+0x3de>
ffffffffc02057ac:	bde9                	j	ffffffffc0205686 <do_execve+0x310>
ffffffffc02057ae:	417c0ab3          	sub	s5,s8,s7
ffffffffc02057b2:	b72d                	j	ffffffffc02056dc <do_execve+0x366>
ffffffffc02057b4:	89de                	mv	s3,s7
ffffffffc02057b6:	b729                	j	ffffffffc02056c0 <do_execve+0x34a>
ffffffffc02057b8:	59f5                	li	s3,-3
ffffffffc02057ba:	bbf1                	j	ffffffffc0205596 <do_execve+0x220>
ffffffffc02057bc:	59e1                	li	s3,-8
ffffffffc02057be:	b5e9                	j	ffffffffc0205688 <do_execve+0x312>
ffffffffc02057c0:	00004617          	auipc	a2,0x4
ffffffffc02057c4:	25860613          	addi	a2,a2,600 # ffffffffc0209a18 <default_pmm_manager+0x50>
ffffffffc02057c8:	06900593          	li	a1,105
ffffffffc02057cc:	00004517          	auipc	a0,0x4
ffffffffc02057d0:	27450513          	addi	a0,a0,628 # ffffffffc0209a40 <default_pmm_manager+0x78>
ffffffffc02057d4:	cb1fa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02057d8:	00004617          	auipc	a2,0x4
ffffffffc02057dc:	27860613          	addi	a2,a2,632 # ffffffffc0209a50 <default_pmm_manager+0x88>
ffffffffc02057e0:	27600593          	li	a1,630
ffffffffc02057e4:	00005517          	auipc	a0,0x5
ffffffffc02057e8:	6d450513          	addi	a0,a0,1748 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc02057ec:	c99fa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02057f0:	00005697          	auipc	a3,0x5
ffffffffc02057f4:	39868693          	addi	a3,a3,920 # ffffffffc020ab88 <default_pmm_manager+0x11c0>
ffffffffc02057f8:	00004617          	auipc	a2,0x4
ffffffffc02057fc:	a8860613          	addi	a2,a2,-1400 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205800:	27100593          	li	a1,625
ffffffffc0205804:	00005517          	auipc	a0,0x5
ffffffffc0205808:	6b450513          	addi	a0,a0,1716 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc020580c:	c79fa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205810:	00005697          	auipc	a3,0x5
ffffffffc0205814:	33068693          	addi	a3,a3,816 # ffffffffc020ab40 <default_pmm_manager+0x1178>
ffffffffc0205818:	00004617          	auipc	a2,0x4
ffffffffc020581c:	a6860613          	addi	a2,a2,-1432 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205820:	27000593          	li	a1,624
ffffffffc0205824:	00005517          	auipc	a0,0x5
ffffffffc0205828:	69450513          	addi	a0,a0,1684 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc020582c:	c59fa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205830:	00005697          	auipc	a3,0x5
ffffffffc0205834:	2c868693          	addi	a3,a3,712 # ffffffffc020aaf8 <default_pmm_manager+0x1130>
ffffffffc0205838:	00004617          	auipc	a2,0x4
ffffffffc020583c:	a4860613          	addi	a2,a2,-1464 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205840:	26f00593          	li	a1,623
ffffffffc0205844:	00005517          	auipc	a0,0x5
ffffffffc0205848:	67450513          	addi	a0,a0,1652 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc020584c:	c39fa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205850:	00005697          	auipc	a3,0x5
ffffffffc0205854:	26068693          	addi	a3,a3,608 # ffffffffc020aab0 <default_pmm_manager+0x10e8>
ffffffffc0205858:	00004617          	auipc	a2,0x4
ffffffffc020585c:	a2860613          	addi	a2,a2,-1496 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205860:	26e00593          	li	a1,622
ffffffffc0205864:	00005517          	auipc	a0,0x5
ffffffffc0205868:	65450513          	addi	a0,a0,1620 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc020586c:	c19fa0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0205870 <do_yield>:
ffffffffc0205870:	00037797          	auipc	a5,0x37
ffffffffc0205874:	60878793          	addi	a5,a5,1544 # ffffffffc023ce78 <current>
ffffffffc0205878:	639c                	ld	a5,0(a5)
ffffffffc020587a:	4705                	li	a4,1
ffffffffc020587c:	4501                	li	a0,0
ffffffffc020587e:	ef98                	sd	a4,24(a5)
ffffffffc0205880:	8082                	ret

ffffffffc0205882 <do_wait>:
ffffffffc0205882:	1101                	addi	sp,sp,-32
ffffffffc0205884:	e822                	sd	s0,16(sp)
ffffffffc0205886:	e426                	sd	s1,8(sp)
ffffffffc0205888:	ec06                	sd	ra,24(sp)
ffffffffc020588a:	842e                	mv	s0,a1
ffffffffc020588c:	84aa                	mv	s1,a0
ffffffffc020588e:	cd81                	beqz	a1,ffffffffc02058a6 <do_wait+0x24>
ffffffffc0205890:	00037797          	auipc	a5,0x37
ffffffffc0205894:	5e878793          	addi	a5,a5,1512 # ffffffffc023ce78 <current>
ffffffffc0205898:	639c                	ld	a5,0(a5)
ffffffffc020589a:	4685                	li	a3,1
ffffffffc020589c:	4611                	li	a2,4
ffffffffc020589e:	7788                	ld	a0,40(a5)
ffffffffc02058a0:	d6dfe0ef          	jal	ra,ffffffffc020460c <user_mem_check>
ffffffffc02058a4:	c909                	beqz	a0,ffffffffc02058b6 <do_wait+0x34>
ffffffffc02058a6:	85a2                	mv	a1,s0
ffffffffc02058a8:	6442                	ld	s0,16(sp)
ffffffffc02058aa:	60e2                	ld	ra,24(sp)
ffffffffc02058ac:	8526                	mv	a0,s1
ffffffffc02058ae:	64a2                	ld	s1,8(sp)
ffffffffc02058b0:	6105                	addi	sp,sp,32
ffffffffc02058b2:	ff4ff06f          	j	ffffffffc02050a6 <do_wait.part.1>
ffffffffc02058b6:	60e2                	ld	ra,24(sp)
ffffffffc02058b8:	6442                	ld	s0,16(sp)
ffffffffc02058ba:	64a2                	ld	s1,8(sp)
ffffffffc02058bc:	5575                	li	a0,-3
ffffffffc02058be:	6105                	addi	sp,sp,32
ffffffffc02058c0:	8082                	ret

ffffffffc02058c2 <do_kill>:
ffffffffc02058c2:	1141                	addi	sp,sp,-16
ffffffffc02058c4:	e406                	sd	ra,8(sp)
ffffffffc02058c6:	e022                	sd	s0,0(sp)
ffffffffc02058c8:	9feff0ef          	jal	ra,ffffffffc0204ac6 <find_proc>
ffffffffc02058cc:	cd0d                	beqz	a0,ffffffffc0205906 <do_kill+0x44>
ffffffffc02058ce:	0b052703          	lw	a4,176(a0)
ffffffffc02058d2:	00177693          	andi	a3,a4,1
ffffffffc02058d6:	e695                	bnez	a3,ffffffffc0205902 <do_kill+0x40>
ffffffffc02058d8:	0ec52683          	lw	a3,236(a0)
ffffffffc02058dc:	00176713          	ori	a4,a4,1
ffffffffc02058e0:	0ae52823          	sw	a4,176(a0)
ffffffffc02058e4:	4401                	li	s0,0
ffffffffc02058e6:	0006c763          	bltz	a3,ffffffffc02058f4 <do_kill+0x32>
ffffffffc02058ea:	8522                	mv	a0,s0
ffffffffc02058ec:	60a2                	ld	ra,8(sp)
ffffffffc02058ee:	6402                	ld	s0,0(sp)
ffffffffc02058f0:	0141                	addi	sp,sp,16
ffffffffc02058f2:	8082                	ret
ffffffffc02058f4:	445020ef          	jal	ra,ffffffffc0208538 <wakeup_proc>
ffffffffc02058f8:	8522                	mv	a0,s0
ffffffffc02058fa:	60a2                	ld	ra,8(sp)
ffffffffc02058fc:	6402                	ld	s0,0(sp)
ffffffffc02058fe:	0141                	addi	sp,sp,16
ffffffffc0205900:	8082                	ret
ffffffffc0205902:	545d                	li	s0,-9
ffffffffc0205904:	b7dd                	j	ffffffffc02058ea <do_kill+0x28>
ffffffffc0205906:	5475                	li	s0,-3
ffffffffc0205908:	b7cd                	j	ffffffffc02058ea <do_kill+0x28>

ffffffffc020590a <proc_init>:
ffffffffc020590a:	00037797          	auipc	a5,0x37
ffffffffc020590e:	6be78793          	addi	a5,a5,1726 # ffffffffc023cfc8 <proc_list>
ffffffffc0205912:	1101                	addi	sp,sp,-32
ffffffffc0205914:	00037717          	auipc	a4,0x37
ffffffffc0205918:	6af73e23          	sd	a5,1724(a4) # ffffffffc023cfd0 <proc_list+0x8>
ffffffffc020591c:	00037717          	auipc	a4,0x37
ffffffffc0205920:	6af73623          	sd	a5,1708(a4) # ffffffffc023cfc8 <proc_list>
ffffffffc0205924:	ec06                	sd	ra,24(sp)
ffffffffc0205926:	e822                	sd	s0,16(sp)
ffffffffc0205928:	e426                	sd	s1,8(sp)
ffffffffc020592a:	00033797          	auipc	a5,0x33
ffffffffc020592e:	4ee78793          	addi	a5,a5,1262 # ffffffffc0238e18 <hash_list>
ffffffffc0205932:	00037717          	auipc	a4,0x37
ffffffffc0205936:	4e670713          	addi	a4,a4,1254 # ffffffffc023ce18 <__rq>
ffffffffc020593a:	e79c                	sd	a5,8(a5)
ffffffffc020593c:	e39c                	sd	a5,0(a5)
ffffffffc020593e:	07c1                	addi	a5,a5,16
ffffffffc0205940:	fee79de3          	bne	a5,a4,ffffffffc020593a <proc_init+0x30>
ffffffffc0205944:	ecdfe0ef          	jal	ra,ffffffffc0204810 <alloc_proc>
ffffffffc0205948:	00037717          	auipc	a4,0x37
ffffffffc020594c:	52a73c23          	sd	a0,1336(a4) # ffffffffc023ce80 <idleproc>
ffffffffc0205950:	00037497          	auipc	s1,0x37
ffffffffc0205954:	53048493          	addi	s1,s1,1328 # ffffffffc023ce80 <idleproc>
ffffffffc0205958:	c559                	beqz	a0,ffffffffc02059e6 <proc_init+0xdc>
ffffffffc020595a:	4709                	li	a4,2
ffffffffc020595c:	e118                	sd	a4,0(a0)
ffffffffc020595e:	4405                	li	s0,1
ffffffffc0205960:	00006717          	auipc	a4,0x6
ffffffffc0205964:	6a070713          	addi	a4,a4,1696 # ffffffffc020c000 <bootstack>
ffffffffc0205968:	00005597          	auipc	a1,0x5
ffffffffc020596c:	46858593          	addi	a1,a1,1128 # ffffffffc020add0 <default_pmm_manager+0x1408>
ffffffffc0205970:	e918                	sd	a4,16(a0)
ffffffffc0205972:	ed00                	sd	s0,24(a0)
ffffffffc0205974:	8bcff0ef          	jal	ra,ffffffffc0204a30 <set_proc_name>
ffffffffc0205978:	00037797          	auipc	a5,0x37
ffffffffc020597c:	51878793          	addi	a5,a5,1304 # ffffffffc023ce90 <nr_process>
ffffffffc0205980:	439c                	lw	a5,0(a5)
ffffffffc0205982:	6098                	ld	a4,0(s1)
ffffffffc0205984:	4601                	li	a2,0
ffffffffc0205986:	2785                	addiw	a5,a5,1
ffffffffc0205988:	4581                	li	a1,0
ffffffffc020598a:	00000517          	auipc	a0,0x0
ffffffffc020598e:	8c450513          	addi	a0,a0,-1852 # ffffffffc020524e <init_main>
ffffffffc0205992:	00037697          	auipc	a3,0x37
ffffffffc0205996:	4ef6af23          	sw	a5,1278(a3) # ffffffffc023ce90 <nr_process>
ffffffffc020599a:	00037797          	auipc	a5,0x37
ffffffffc020599e:	4ce7bf23          	sd	a4,1246(a5) # ffffffffc023ce78 <current>
ffffffffc02059a2:	d66ff0ef          	jal	ra,ffffffffc0204f08 <kernel_thread>
ffffffffc02059a6:	08a05c63          	blez	a0,ffffffffc0205a3e <proc_init+0x134>
ffffffffc02059aa:	91cff0ef          	jal	ra,ffffffffc0204ac6 <find_proc>
ffffffffc02059ae:	00005597          	auipc	a1,0x5
ffffffffc02059b2:	44a58593          	addi	a1,a1,1098 # ffffffffc020adf8 <default_pmm_manager+0x1430>
ffffffffc02059b6:	00037797          	auipc	a5,0x37
ffffffffc02059ba:	4ca7b923          	sd	a0,1234(a5) # ffffffffc023ce88 <initproc>
ffffffffc02059be:	872ff0ef          	jal	ra,ffffffffc0204a30 <set_proc_name>
ffffffffc02059c2:	609c                	ld	a5,0(s1)
ffffffffc02059c4:	cfa9                	beqz	a5,ffffffffc0205a1e <proc_init+0x114>
ffffffffc02059c6:	43dc                	lw	a5,4(a5)
ffffffffc02059c8:	ebb9                	bnez	a5,ffffffffc0205a1e <proc_init+0x114>
ffffffffc02059ca:	00037797          	auipc	a5,0x37
ffffffffc02059ce:	4be78793          	addi	a5,a5,1214 # ffffffffc023ce88 <initproc>
ffffffffc02059d2:	639c                	ld	a5,0(a5)
ffffffffc02059d4:	c78d                	beqz	a5,ffffffffc02059fe <proc_init+0xf4>
ffffffffc02059d6:	43dc                	lw	a5,4(a5)
ffffffffc02059d8:	02879363          	bne	a5,s0,ffffffffc02059fe <proc_init+0xf4>
ffffffffc02059dc:	60e2                	ld	ra,24(sp)
ffffffffc02059de:	6442                	ld	s0,16(sp)
ffffffffc02059e0:	64a2                	ld	s1,8(sp)
ffffffffc02059e2:	6105                	addi	sp,sp,32
ffffffffc02059e4:	8082                	ret
ffffffffc02059e6:	00005617          	auipc	a2,0x5
ffffffffc02059ea:	3d260613          	addi	a2,a2,978 # ffffffffc020adb8 <default_pmm_manager+0x13f0>
ffffffffc02059ee:	37200593          	li	a1,882
ffffffffc02059f2:	00005517          	auipc	a0,0x5
ffffffffc02059f6:	4c650513          	addi	a0,a0,1222 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc02059fa:	a8bfa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc02059fe:	00005697          	auipc	a3,0x5
ffffffffc0205a02:	42a68693          	addi	a3,a3,1066 # ffffffffc020ae28 <default_pmm_manager+0x1460>
ffffffffc0205a06:	00004617          	auipc	a2,0x4
ffffffffc0205a0a:	87a60613          	addi	a2,a2,-1926 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205a0e:	38700593          	li	a1,903
ffffffffc0205a12:	00005517          	auipc	a0,0x5
ffffffffc0205a16:	4a650513          	addi	a0,a0,1190 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205a1a:	a6bfa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205a1e:	00005697          	auipc	a3,0x5
ffffffffc0205a22:	3e268693          	addi	a3,a3,994 # ffffffffc020ae00 <default_pmm_manager+0x1438>
ffffffffc0205a26:	00004617          	auipc	a2,0x4
ffffffffc0205a2a:	85a60613          	addi	a2,a2,-1958 # ffffffffc0209280 <commands+0x4c0>
ffffffffc0205a2e:	38600593          	li	a1,902
ffffffffc0205a32:	00005517          	auipc	a0,0x5
ffffffffc0205a36:	48650513          	addi	a0,a0,1158 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205a3a:	a4bfa0ef          	jal	ra,ffffffffc0200484 <__panic>
ffffffffc0205a3e:	00005617          	auipc	a2,0x5
ffffffffc0205a42:	39a60613          	addi	a2,a2,922 # ffffffffc020add8 <default_pmm_manager+0x1410>
ffffffffc0205a46:	38000593          	li	a1,896
ffffffffc0205a4a:	00005517          	auipc	a0,0x5
ffffffffc0205a4e:	46e50513          	addi	a0,a0,1134 # ffffffffc020aeb8 <default_pmm_manager+0x14f0>
ffffffffc0205a52:	a33fa0ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc0205a56 <cpu_idle>:
ffffffffc0205a56:	1141                	addi	sp,sp,-16
ffffffffc0205a58:	e022                	sd	s0,0(sp)
ffffffffc0205a5a:	e406                	sd	ra,8(sp)
ffffffffc0205a5c:	00037417          	auipc	s0,0x37
ffffffffc0205a60:	41c40413          	addi	s0,s0,1052 # ffffffffc023ce78 <current>
ffffffffc0205a64:	6018                	ld	a4,0(s0)
ffffffffc0205a66:	6f1c                	ld	a5,24(a4)
ffffffffc0205a68:	dffd                	beqz	a5,ffffffffc0205a66 <cpu_idle+0x10>
ffffffffc0205a6a:	389020ef          	jal	ra,ffffffffc02085f2 <schedule>
ffffffffc0205a6e:	bfdd                	j	ffffffffc0205a64 <cpu_idle+0xe>

ffffffffc0205a70 <lab6_set_priority>:
ffffffffc0205a70:	1141                	addi	sp,sp,-16
ffffffffc0205a72:	e022                	sd	s0,0(sp)
ffffffffc0205a74:	85aa                	mv	a1,a0
ffffffffc0205a76:	842a                	mv	s0,a0
ffffffffc0205a78:	00005517          	auipc	a0,0x5
ffffffffc0205a7c:	32850513          	addi	a0,a0,808 # ffffffffc020ada0 <default_pmm_manager+0x13d8>
ffffffffc0205a80:	e406                	sd	ra,8(sp)
ffffffffc0205a82:	f10fa0ef          	jal	ra,ffffffffc0200192 <cprintf>
ffffffffc0205a86:	00037797          	auipc	a5,0x37
ffffffffc0205a8a:	3f278793          	addi	a5,a5,1010 # ffffffffc023ce78 <current>
ffffffffc0205a8e:	639c                	ld	a5,0(a5)
ffffffffc0205a90:	e801                	bnez	s0,ffffffffc0205aa0 <lab6_set_priority+0x30>
ffffffffc0205a92:	60a2                	ld	ra,8(sp)
ffffffffc0205a94:	6402                	ld	s0,0(sp)
ffffffffc0205a96:	4705                	li	a4,1
ffffffffc0205a98:	14e7a223          	sw	a4,324(a5)
ffffffffc0205a9c:	0141                	addi	sp,sp,16
ffffffffc0205a9e:	8082                	ret
ffffffffc0205aa0:	1487a223          	sw	s0,324(a5)
ffffffffc0205aa4:	60a2                	ld	ra,8(sp)
ffffffffc0205aa6:	6402                	ld	s0,0(sp)
ffffffffc0205aa8:	0141                	addi	sp,sp,16
ffffffffc0205aaa:	8082                	ret

ffffffffc0205aac <switch_to>:
ffffffffc0205aac:	00153023          	sd	ra,0(a0)
ffffffffc0205ab0:	00253423          	sd	sp,8(a0)
ffffffffc0205ab4:	e900                	sd	s0,16(a0)
ffffffffc0205ab6:	ed04                	sd	s1,24(a0)
ffffffffc0205ab8:	03253023          	sd	s2,32(a0)
ffffffffc0205abc:	03353423          	sd	s3,40(a0)
ffffffffc0205ac0:	03453823          	sd	s4,48(a0)
ffffffffc0205ac4:	03553c23          	sd	s5,56(a0)
ffffffffc0205ac8:	05653023          	sd	s6,64(a0)
ffffffffc0205acc:	05753423          	sd	s7,72(a0)
ffffffffc0205ad0:	05853823          	sd	s8,80(a0)
ffffffffc0205ad4:	05953c23          	sd	s9,88(a0)
ffffffffc0205ad8:	07a53023          	sd	s10,96(a0)
ffffffffc0205adc:	07b53423          	sd	s11,104(a0)
ffffffffc0205ae0:	0005b083          	ld	ra,0(a1)
ffffffffc0205ae4:	0085b103          	ld	sp,8(a1)
ffffffffc0205ae8:	6980                	ld	s0,16(a1)
ffffffffc0205aea:	6d84                	ld	s1,24(a1)
ffffffffc0205aec:	0205b903          	ld	s2,32(a1)
ffffffffc0205af0:	0285b983          	ld	s3,40(a1)
ffffffffc0205af4:	0305ba03          	ld	s4,48(a1)
ffffffffc0205af8:	0385ba83          	ld	s5,56(a1)
ffffffffc0205afc:	0405bb03          	ld	s6,64(a1)
ffffffffc0205b00:	0485bb83          	ld	s7,72(a1)
ffffffffc0205b04:	0505bc03          	ld	s8,80(a1)
ffffffffc0205b08:	0585bc83          	ld	s9,88(a1)
ffffffffc0205b0c:	0605bd03          	ld	s10,96(a1)
ffffffffc0205b10:	0685bd83          	ld	s11,104(a1)
ffffffffc0205b14:	8082                	ret

ffffffffc0205b16 <proc_stride_comp_f>:
ffffffffc0205b16:	4d08                	lw	a0,24(a0)
ffffffffc0205b18:	4d9c                	lw	a5,24(a1)
ffffffffc0205b1a:	9d1d                	subw	a0,a0,a5
ffffffffc0205b1c:	00a04763          	bgtz	a0,ffffffffc0205b2a <proc_stride_comp_f+0x14>
ffffffffc0205b20:	00a03533          	snez	a0,a0
ffffffffc0205b24:	40a00533          	neg	a0,a0
ffffffffc0205b28:	8082                	ret
ffffffffc0205b2a:	4505                	li	a0,1
ffffffffc0205b2c:	8082                	ret

ffffffffc0205b2e <stride_init>:
ffffffffc0205b2e:	e508                	sd	a0,8(a0)
ffffffffc0205b30:	e108                	sd	a0,0(a0)
ffffffffc0205b32:	00053c23          	sd	zero,24(a0)
ffffffffc0205b36:	00052823          	sw	zero,16(a0)
ffffffffc0205b3a:	8082                	ret

ffffffffc0205b3c <stride_pick_next>:
ffffffffc0205b3c:	6d1c                	ld	a5,24(a0)
ffffffffc0205b3e:	c385                	beqz	a5,ffffffffc0205b5e <stride_pick_next+0x22>
ffffffffc0205b40:	4fd4                	lw	a3,28(a5)
ffffffffc0205b42:	ed878513          	addi	a0,a5,-296
ffffffffc0205b46:	4f90                	lw	a2,24(a5)
ffffffffc0205b48:	40000737          	lui	a4,0x40000
ffffffffc0205b4c:	e681                	bnez	a3,ffffffffc0205b54 <stride_pick_next+0x18>
ffffffffc0205b4e:	9f31                	addw	a4,a4,a2
ffffffffc0205b50:	cf98                	sw	a4,24(a5)
ffffffffc0205b52:	8082                	ret
ffffffffc0205b54:	02d7573b          	divuw	a4,a4,a3
ffffffffc0205b58:	9f31                	addw	a4,a4,a2
ffffffffc0205b5a:	cf98                	sw	a4,24(a5)
ffffffffc0205b5c:	8082                	ret
ffffffffc0205b5e:	4501                	li	a0,0
ffffffffc0205b60:	8082                	ret

ffffffffc0205b62 <stride_proc_tick>:
ffffffffc0205b62:	1205a783          	lw	a5,288(a1)
ffffffffc0205b66:	00f05563          	blez	a5,ffffffffc0205b70 <stride_proc_tick+0xe>
ffffffffc0205b6a:	37fd                	addiw	a5,a5,-1
ffffffffc0205b6c:	12f5a023          	sw	a5,288(a1)
ffffffffc0205b70:	e399                	bnez	a5,ffffffffc0205b76 <stride_proc_tick+0x14>
ffffffffc0205b72:	4785                	li	a5,1
ffffffffc0205b74:	ed9c                	sd	a5,24(a1)
ffffffffc0205b76:	8082                	ret

ffffffffc0205b78 <skew_heap_merge.constprop.2>:
ffffffffc0205b78:	1101                	addi	sp,sp,-32
ffffffffc0205b7a:	e822                	sd	s0,16(sp)
ffffffffc0205b7c:	ec06                	sd	ra,24(sp)
ffffffffc0205b7e:	e426                	sd	s1,8(sp)
ffffffffc0205b80:	e04a                	sd	s2,0(sp)
ffffffffc0205b82:	842e                	mv	s0,a1
ffffffffc0205b84:	c11d                	beqz	a0,ffffffffc0205baa <skew_heap_merge.constprop.2+0x32>
ffffffffc0205b86:	84aa                	mv	s1,a0
ffffffffc0205b88:	c1b9                	beqz	a1,ffffffffc0205bce <skew_heap_merge.constprop.2+0x56>
ffffffffc0205b8a:	f8dff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205b8e:	57fd                	li	a5,-1
ffffffffc0205b90:	02f50463          	beq	a0,a5,ffffffffc0205bb8 <skew_heap_merge.constprop.2+0x40>
ffffffffc0205b94:	680c                	ld	a1,16(s0)
ffffffffc0205b96:	00843903          	ld	s2,8(s0)
ffffffffc0205b9a:	8526                	mv	a0,s1
ffffffffc0205b9c:	fddff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0205ba0:	e408                	sd	a0,8(s0)
ffffffffc0205ba2:	01243823          	sd	s2,16(s0)
ffffffffc0205ba6:	c111                	beqz	a0,ffffffffc0205baa <skew_heap_merge.constprop.2+0x32>
ffffffffc0205ba8:	e100                	sd	s0,0(a0)
ffffffffc0205baa:	8522                	mv	a0,s0
ffffffffc0205bac:	60e2                	ld	ra,24(sp)
ffffffffc0205bae:	6442                	ld	s0,16(sp)
ffffffffc0205bb0:	64a2                	ld	s1,8(sp)
ffffffffc0205bb2:	6902                	ld	s2,0(sp)
ffffffffc0205bb4:	6105                	addi	sp,sp,32
ffffffffc0205bb6:	8082                	ret
ffffffffc0205bb8:	6888                	ld	a0,16(s1)
ffffffffc0205bba:	0084b903          	ld	s2,8(s1)
ffffffffc0205bbe:	85a2                	mv	a1,s0
ffffffffc0205bc0:	fb9ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0205bc4:	e488                	sd	a0,8(s1)
ffffffffc0205bc6:	0124b823          	sd	s2,16(s1)
ffffffffc0205bca:	c111                	beqz	a0,ffffffffc0205bce <skew_heap_merge.constprop.2+0x56>
ffffffffc0205bcc:	e104                	sd	s1,0(a0)
ffffffffc0205bce:	60e2                	ld	ra,24(sp)
ffffffffc0205bd0:	6442                	ld	s0,16(sp)
ffffffffc0205bd2:	8526                	mv	a0,s1
ffffffffc0205bd4:	6902                	ld	s2,0(sp)
ffffffffc0205bd6:	64a2                	ld	s1,8(sp)
ffffffffc0205bd8:	6105                	addi	sp,sp,32
ffffffffc0205bda:	8082                	ret

ffffffffc0205bdc <stride_enqueue>:
ffffffffc0205bdc:	7119                	addi	sp,sp,-128
ffffffffc0205bde:	ecce                	sd	s3,88(sp)
ffffffffc0205be0:	01853983          	ld	s3,24(a0)
ffffffffc0205be4:	f8a2                	sd	s0,112(sp)
ffffffffc0205be6:	f4a6                	sd	s1,104(sp)
ffffffffc0205be8:	f0ca                	sd	s2,96(sp)
ffffffffc0205bea:	fc86                	sd	ra,120(sp)
ffffffffc0205bec:	e8d2                	sd	s4,80(sp)
ffffffffc0205bee:	e4d6                	sd	s5,72(sp)
ffffffffc0205bf0:	e0da                	sd	s6,64(sp)
ffffffffc0205bf2:	fc5e                	sd	s7,56(sp)
ffffffffc0205bf4:	f862                	sd	s8,48(sp)
ffffffffc0205bf6:	f466                	sd	s9,40(sp)
ffffffffc0205bf8:	f06a                	sd	s10,32(sp)
ffffffffc0205bfa:	ec6e                	sd	s11,24(sp)
ffffffffc0205bfc:	1205b423          	sd	zero,296(a1)
ffffffffc0205c00:	1205bc23          	sd	zero,312(a1)
ffffffffc0205c04:	1205b823          	sd	zero,304(a1)
ffffffffc0205c08:	84aa                	mv	s1,a0
ffffffffc0205c0a:	842e                	mv	s0,a1
ffffffffc0205c0c:	12858913          	addi	s2,a1,296
ffffffffc0205c10:	02098063          	beqz	s3,ffffffffc0205c30 <stride_enqueue+0x54>
ffffffffc0205c14:	08090c63          	beqz	s2,ffffffffc0205cac <stride_enqueue+0xd0>
ffffffffc0205c18:	85ca                	mv	a1,s2
ffffffffc0205c1a:	854e                	mv	a0,s3
ffffffffc0205c1c:	efbff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205c20:	57fd                	li	a5,-1
ffffffffc0205c22:	8a2a                	mv	s4,a0
ffffffffc0205c24:	04f50563          	beq	a0,a5,ffffffffc0205c6e <stride_enqueue+0x92>
ffffffffc0205c28:	13343823          	sd	s3,304(s0)
ffffffffc0205c2c:	0129b023          	sd	s2,0(s3) # ffffffff80000000 <_binary_obj___user_matrix_out_size+0xffffffff7fffd6c8>
ffffffffc0205c30:	12042783          	lw	a5,288(s0)
ffffffffc0205c34:	0124bc23          	sd	s2,24(s1)
ffffffffc0205c38:	48d8                	lw	a4,20(s1)
ffffffffc0205c3a:	e79d                	bnez	a5,ffffffffc0205c68 <stride_enqueue+0x8c>
ffffffffc0205c3c:	12e42023          	sw	a4,288(s0)
ffffffffc0205c40:	489c                	lw	a5,16(s1)
ffffffffc0205c42:	70e6                	ld	ra,120(sp)
ffffffffc0205c44:	10943423          	sd	s1,264(s0)
ffffffffc0205c48:	7446                	ld	s0,112(sp)
ffffffffc0205c4a:	2785                	addiw	a5,a5,1
ffffffffc0205c4c:	c89c                	sw	a5,16(s1)
ffffffffc0205c4e:	7906                	ld	s2,96(sp)
ffffffffc0205c50:	74a6                	ld	s1,104(sp)
ffffffffc0205c52:	69e6                	ld	s3,88(sp)
ffffffffc0205c54:	6a46                	ld	s4,80(sp)
ffffffffc0205c56:	6aa6                	ld	s5,72(sp)
ffffffffc0205c58:	6b06                	ld	s6,64(sp)
ffffffffc0205c5a:	7be2                	ld	s7,56(sp)
ffffffffc0205c5c:	7c42                	ld	s8,48(sp)
ffffffffc0205c5e:	7ca2                	ld	s9,40(sp)
ffffffffc0205c60:	7d02                	ld	s10,32(sp)
ffffffffc0205c62:	6de2                	ld	s11,24(sp)
ffffffffc0205c64:	6109                	addi	sp,sp,128
ffffffffc0205c66:	8082                	ret
ffffffffc0205c68:	fcf75ce3          	bge	a4,a5,ffffffffc0205c40 <stride_enqueue+0x64>
ffffffffc0205c6c:	bfc1                	j	ffffffffc0205c3c <stride_enqueue+0x60>
ffffffffc0205c6e:	0109ba83          	ld	s5,16(s3)
ffffffffc0205c72:	0089bb03          	ld	s6,8(s3)
ffffffffc0205c76:	000a8d63          	beqz	s5,ffffffffc0205c90 <stride_enqueue+0xb4>
ffffffffc0205c7a:	85ca                	mv	a1,s2
ffffffffc0205c7c:	8556                	mv	a0,s5
ffffffffc0205c7e:	e99ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205c82:	8baa                	mv	s7,a0
ffffffffc0205c84:	03450c63          	beq	a0,s4,ffffffffc0205cbc <stride_enqueue+0xe0>
ffffffffc0205c88:	13543823          	sd	s5,304(s0)
ffffffffc0205c8c:	012ab023          	sd	s2,0(s5)
ffffffffc0205c90:	0129b423          	sd	s2,8(s3)
ffffffffc0205c94:	0169b823          	sd	s6,16(s3)
ffffffffc0205c98:	12042783          	lw	a5,288(s0)
ffffffffc0205c9c:	01393023          	sd	s3,0(s2)
ffffffffc0205ca0:	894e                	mv	s2,s3
ffffffffc0205ca2:	0124bc23          	sd	s2,24(s1)
ffffffffc0205ca6:	48d8                	lw	a4,20(s1)
ffffffffc0205ca8:	dbd1                	beqz	a5,ffffffffc0205c3c <stride_enqueue+0x60>
ffffffffc0205caa:	bf7d                	j	ffffffffc0205c68 <stride_enqueue+0x8c>
ffffffffc0205cac:	12042783          	lw	a5,288(s0)
ffffffffc0205cb0:	894e                	mv	s2,s3
ffffffffc0205cb2:	0124bc23          	sd	s2,24(s1)
ffffffffc0205cb6:	48d8                	lw	a4,20(s1)
ffffffffc0205cb8:	d3d1                	beqz	a5,ffffffffc0205c3c <stride_enqueue+0x60>
ffffffffc0205cba:	b77d                	j	ffffffffc0205c68 <stride_enqueue+0x8c>
ffffffffc0205cbc:	010aba03          	ld	s4,16(s5)
ffffffffc0205cc0:	008abc03          	ld	s8,8(s5)
ffffffffc0205cc4:	000a0d63          	beqz	s4,ffffffffc0205cde <stride_enqueue+0x102>
ffffffffc0205cc8:	85ca                	mv	a1,s2
ffffffffc0205cca:	8552                	mv	a0,s4
ffffffffc0205ccc:	e4bff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205cd0:	8caa                	mv	s9,a0
ffffffffc0205cd2:	01750e63          	beq	a0,s7,ffffffffc0205cee <stride_enqueue+0x112>
ffffffffc0205cd6:	13443823          	sd	s4,304(s0)
ffffffffc0205cda:	012a3023          	sd	s2,0(s4)
ffffffffc0205cde:	012ab423          	sd	s2,8(s5)
ffffffffc0205ce2:	018ab823          	sd	s8,16(s5)
ffffffffc0205ce6:	01593023          	sd	s5,0(s2)
ffffffffc0205cea:	8956                	mv	s2,s5
ffffffffc0205cec:	b755                	j	ffffffffc0205c90 <stride_enqueue+0xb4>
ffffffffc0205cee:	010a3b83          	ld	s7,16(s4)
ffffffffc0205cf2:	008a3d03          	ld	s10,8(s4)
ffffffffc0205cf6:	000b8c63          	beqz	s7,ffffffffc0205d0e <stride_enqueue+0x132>
ffffffffc0205cfa:	85ca                	mv	a1,s2
ffffffffc0205cfc:	855e                	mv	a0,s7
ffffffffc0205cfe:	e19ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205d02:	01950e63          	beq	a0,s9,ffffffffc0205d1e <stride_enqueue+0x142>
ffffffffc0205d06:	13743823          	sd	s7,304(s0)
ffffffffc0205d0a:	012bb023          	sd	s2,0(s7)
ffffffffc0205d0e:	012a3423          	sd	s2,8(s4)
ffffffffc0205d12:	01aa3823          	sd	s10,16(s4)
ffffffffc0205d16:	01493023          	sd	s4,0(s2)
ffffffffc0205d1a:	8952                	mv	s2,s4
ffffffffc0205d1c:	b7c9                	j	ffffffffc0205cde <stride_enqueue+0x102>
ffffffffc0205d1e:	010bbc83          	ld	s9,16(s7)
ffffffffc0205d22:	008bbd83          	ld	s11,8(s7)
ffffffffc0205d26:	000c8d63          	beqz	s9,ffffffffc0205d40 <stride_enqueue+0x164>
ffffffffc0205d2a:	85ca                	mv	a1,s2
ffffffffc0205d2c:	8566                	mv	a0,s9
ffffffffc0205d2e:	de9ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205d32:	57fd                	li	a5,-1
ffffffffc0205d34:	00f50e63          	beq	a0,a5,ffffffffc0205d50 <stride_enqueue+0x174>
ffffffffc0205d38:	13943823          	sd	s9,304(s0)
ffffffffc0205d3c:	012cb023          	sd	s2,0(s9)
ffffffffc0205d40:	012bb423          	sd	s2,8(s7)
ffffffffc0205d44:	01bbb823          	sd	s11,16(s7)
ffffffffc0205d48:	01793023          	sd	s7,0(s2)
ffffffffc0205d4c:	895e                	mv	s2,s7
ffffffffc0205d4e:	b7c1                	j	ffffffffc0205d0e <stride_enqueue+0x132>
ffffffffc0205d50:	008cb783          	ld	a5,8(s9)
ffffffffc0205d54:	010cb503          	ld	a0,16(s9)
ffffffffc0205d58:	85ca                	mv	a1,s2
ffffffffc0205d5a:	e43e                	sd	a5,8(sp)
ffffffffc0205d5c:	e1dff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0205d60:	67a2                	ld	a5,8(sp)
ffffffffc0205d62:	00acb423          	sd	a0,8(s9)
ffffffffc0205d66:	00fcb823          	sd	a5,16(s9)
ffffffffc0205d6a:	c509                	beqz	a0,ffffffffc0205d74 <stride_enqueue+0x198>
ffffffffc0205d6c:	01953023          	sd	s9,0(a0)
ffffffffc0205d70:	8966                	mv	s2,s9
ffffffffc0205d72:	b7f9                	j	ffffffffc0205d40 <stride_enqueue+0x164>
ffffffffc0205d74:	8966                	mv	s2,s9
ffffffffc0205d76:	b7e9                	j	ffffffffc0205d40 <stride_enqueue+0x164>

ffffffffc0205d78 <stride_dequeue>:
ffffffffc0205d78:	7171                	addi	sp,sp,-176
ffffffffc0205d7a:	ed26                	sd	s1,152(sp)
ffffffffc0205d7c:	1305b483          	ld	s1,304(a1)
ffffffffc0205d80:	f122                	sd	s0,160(sp)
ffffffffc0205d82:	e94a                	sd	s2,144(sp)
ffffffffc0205d84:	fcd6                	sd	s5,120(sp)
ffffffffc0205d86:	f8da                	sd	s6,112(sp)
ffffffffc0205d88:	e4ee                	sd	s11,72(sp)
ffffffffc0205d8a:	f506                	sd	ra,168(sp)
ffffffffc0205d8c:	e54e                	sd	s3,136(sp)
ffffffffc0205d8e:	e152                	sd	s4,128(sp)
ffffffffc0205d90:	f4de                	sd	s7,104(sp)
ffffffffc0205d92:	f0e2                	sd	s8,96(sp)
ffffffffc0205d94:	ece6                	sd	s9,88(sp)
ffffffffc0205d96:	e8ea                	sd	s10,80(sp)
ffffffffc0205d98:	892e                	mv	s2,a1
ffffffffc0205d9a:	8aaa                	mv	s5,a0
ffffffffc0205d9c:	01853b03          	ld	s6,24(a0)
ffffffffc0205da0:	1285bd83          	ld	s11,296(a1)
ffffffffc0205da4:	1385b403          	ld	s0,312(a1)
ffffffffc0205da8:	2c048363          	beqz	s1,ffffffffc020606e <stride_dequeue+0x2f6>
ffffffffc0205dac:	3e040163          	beqz	s0,ffffffffc020618e <stride_dequeue+0x416>
ffffffffc0205db0:	85a2                	mv	a1,s0
ffffffffc0205db2:	8526                	mv	a0,s1
ffffffffc0205db4:	d63ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205db8:	5a7d                	li	s4,-1
ffffffffc0205dba:	89aa                	mv	s3,a0
ffffffffc0205dbc:	17450d63          	beq	a0,s4,ffffffffc0205f36 <stride_dequeue+0x1be>
ffffffffc0205dc0:	01043983          	ld	s3,16(s0)
ffffffffc0205dc4:	00843b83          	ld	s7,8(s0)
ffffffffc0205dc8:	12098163          	beqz	s3,ffffffffc0205eea <stride_dequeue+0x172>
ffffffffc0205dcc:	85ce                	mv	a1,s3
ffffffffc0205dce:	8526                	mv	a0,s1
ffffffffc0205dd0:	d47ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205dd4:	8caa                	mv	s9,a0
ffffffffc0205dd6:	2b450563          	beq	a0,s4,ffffffffc0206080 <stride_dequeue+0x308>
ffffffffc0205dda:	0109bd03          	ld	s10,16(s3)
ffffffffc0205dde:	0089bc03          	ld	s8,8(s3)
ffffffffc0205de2:	0e0d0d63          	beqz	s10,ffffffffc0205edc <stride_dequeue+0x164>
ffffffffc0205de6:	85ea                	mv	a1,s10
ffffffffc0205de8:	8526                	mv	a0,s1
ffffffffc0205dea:	d2dff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205dee:	8caa                	mv	s9,a0
ffffffffc0205df0:	75450a63          	beq	a0,s4,ffffffffc0206544 <stride_dequeue+0x7cc>
ffffffffc0205df4:	008d3783          	ld	a5,8(s10)
ffffffffc0205df8:	010d3c83          	ld	s9,16(s10)
ffffffffc0205dfc:	e43e                	sd	a5,8(sp)
ffffffffc0205dfe:	0c0c8763          	beqz	s9,ffffffffc0205ecc <stride_dequeue+0x154>
ffffffffc0205e02:	85e6                	mv	a1,s9
ffffffffc0205e04:	8526                	mv	a0,s1
ffffffffc0205e06:	d11ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205e0a:	69450063          	beq	a0,s4,ffffffffc020648a <stride_dequeue+0x712>
ffffffffc0205e0e:	008cb783          	ld	a5,8(s9)
ffffffffc0205e12:	010cba03          	ld	s4,16(s9)
ffffffffc0205e16:	e83e                	sd	a5,16(sp)
ffffffffc0205e18:	0a0a0263          	beqz	s4,ffffffffc0205ebc <stride_dequeue+0x144>
ffffffffc0205e1c:	85d2                	mv	a1,s4
ffffffffc0205e1e:	8526                	mv	a0,s1
ffffffffc0205e20:	cf7ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205e24:	58fd                	li	a7,-1
ffffffffc0205e26:	351503e3          	beq	a0,a7,ffffffffc020696c <stride_dequeue+0xbf4>
ffffffffc0205e2a:	008a3703          	ld	a4,8(s4)
ffffffffc0205e2e:	010a3783          	ld	a5,16(s4)
ffffffffc0205e32:	ec3a                	sd	a4,24(sp)
ffffffffc0205e34:	cfa5                	beqz	a5,ffffffffc0205eac <stride_dequeue+0x134>
ffffffffc0205e36:	85be                	mv	a1,a5
ffffffffc0205e38:	8526                	mv	a0,s1
ffffffffc0205e3a:	f03e                	sd	a5,32(sp)
ffffffffc0205e3c:	cdbff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205e40:	58fd                	li	a7,-1
ffffffffc0205e42:	7782                	ld	a5,32(sp)
ffffffffc0205e44:	01151463          	bne	a0,a7,ffffffffc0205e4c <stride_dequeue+0xd4>
ffffffffc0205e48:	0580106f          	j	ffffffffc0206ea0 <stride_dequeue+0x1128>
ffffffffc0205e4c:	6798                	ld	a4,8(a5)
ffffffffc0205e4e:	0107b303          	ld	t1,16(a5)
ffffffffc0205e52:	f03a                	sd	a4,32(sp)
ffffffffc0205e54:	00031463          	bnez	t1,ffffffffc0205e5c <stride_dequeue+0xe4>
ffffffffc0205e58:	6a00106f          	j	ffffffffc02074f8 <stride_dequeue+0x1780>
ffffffffc0205e5c:	859a                	mv	a1,t1
ffffffffc0205e5e:	8526                	mv	a0,s1
ffffffffc0205e60:	f83e                	sd	a5,48(sp)
ffffffffc0205e62:	f41a                	sd	t1,40(sp)
ffffffffc0205e64:	cb3ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205e68:	58fd                	li	a7,-1
ffffffffc0205e6a:	7322                	ld	t1,40(sp)
ffffffffc0205e6c:	77c2                	ld	a5,48(sp)
ffffffffc0205e6e:	01151463          	bne	a0,a7,ffffffffc0205e76 <stride_dequeue+0xfe>
ffffffffc0205e72:	6620106f          	j	ffffffffc02074d4 <stride_dequeue+0x175c>
ffffffffc0205e76:	00833883          	ld	a7,8(t1)
ffffffffc0205e7a:	01033583          	ld	a1,16(t1)
ffffffffc0205e7e:	8526                	mv	a0,s1
ffffffffc0205e80:	fc3e                	sd	a5,56(sp)
ffffffffc0205e82:	f81a                	sd	t1,48(sp)
ffffffffc0205e84:	f446                	sd	a7,40(sp)
ffffffffc0205e86:	cf3ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0205e8a:	7342                	ld	t1,48(sp)
ffffffffc0205e8c:	78a2                	ld	a7,40(sp)
ffffffffc0205e8e:	77e2                	ld	a5,56(sp)
ffffffffc0205e90:	00a33423          	sd	a0,8(t1)
ffffffffc0205e94:	01133823          	sd	a7,16(t1)
ffffffffc0205e98:	c119                	beqz	a0,ffffffffc0205e9e <stride_dequeue+0x126>
ffffffffc0205e9a:	00653023          	sd	t1,0(a0)
ffffffffc0205e9e:	7702                	ld	a4,32(sp)
ffffffffc0205ea0:	0067b423          	sd	t1,8(a5)
ffffffffc0205ea4:	84be                	mv	s1,a5
ffffffffc0205ea6:	eb98                	sd	a4,16(a5)
ffffffffc0205ea8:	00f33023          	sd	a5,0(t1)
ffffffffc0205eac:	67e2                	ld	a5,24(sp)
ffffffffc0205eae:	009a3423          	sd	s1,8(s4)
ffffffffc0205eb2:	00fa3823          	sd	a5,16(s4)
ffffffffc0205eb6:	0144b023          	sd	s4,0(s1)
ffffffffc0205eba:	84d2                	mv	s1,s4
ffffffffc0205ebc:	67c2                	ld	a5,16(sp)
ffffffffc0205ebe:	009cb423          	sd	s1,8(s9)
ffffffffc0205ec2:	00fcb823          	sd	a5,16(s9)
ffffffffc0205ec6:	0194b023          	sd	s9,0(s1)
ffffffffc0205eca:	84e6                	mv	s1,s9
ffffffffc0205ecc:	67a2                	ld	a5,8(sp)
ffffffffc0205ece:	009d3423          	sd	s1,8(s10)
ffffffffc0205ed2:	00fd3823          	sd	a5,16(s10)
ffffffffc0205ed6:	01a4b023          	sd	s10,0(s1)
ffffffffc0205eda:	84ea                	mv	s1,s10
ffffffffc0205edc:	0099b423          	sd	s1,8(s3)
ffffffffc0205ee0:	0189b823          	sd	s8,16(s3)
ffffffffc0205ee4:	0134b023          	sd	s3,0(s1)
ffffffffc0205ee8:	84ce                	mv	s1,s3
ffffffffc0205eea:	e404                	sd	s1,8(s0)
ffffffffc0205eec:	01743823          	sd	s7,16(s0)
ffffffffc0205ef0:	e080                	sd	s0,0(s1)
ffffffffc0205ef2:	01b43023          	sd	s11,0(s0)
ffffffffc0205ef6:	180d8063          	beqz	s11,ffffffffc0206076 <stride_dequeue+0x2fe>
ffffffffc0205efa:	008db703          	ld	a4,8(s11)
ffffffffc0205efe:	12890913          	addi	s2,s2,296
ffffffffc0205f02:	17270c63          	beq	a4,s2,ffffffffc020607a <stride_dequeue+0x302>
ffffffffc0205f06:	008db823          	sd	s0,16(s11)
ffffffffc0205f0a:	010aa783          	lw	a5,16(s5)
ffffffffc0205f0e:	70aa                	ld	ra,168(sp)
ffffffffc0205f10:	740a                	ld	s0,160(sp)
ffffffffc0205f12:	37fd                	addiw	a5,a5,-1
ffffffffc0205f14:	016abc23          	sd	s6,24(s5)
ffffffffc0205f18:	00faa823          	sw	a5,16(s5)
ffffffffc0205f1c:	64ea                	ld	s1,152(sp)
ffffffffc0205f1e:	694a                	ld	s2,144(sp)
ffffffffc0205f20:	69aa                	ld	s3,136(sp)
ffffffffc0205f22:	6a0a                	ld	s4,128(sp)
ffffffffc0205f24:	7ae6                	ld	s5,120(sp)
ffffffffc0205f26:	7b46                	ld	s6,112(sp)
ffffffffc0205f28:	7ba6                	ld	s7,104(sp)
ffffffffc0205f2a:	7c06                	ld	s8,96(sp)
ffffffffc0205f2c:	6ce6                	ld	s9,88(sp)
ffffffffc0205f2e:	6d46                	ld	s10,80(sp)
ffffffffc0205f30:	6da6                	ld	s11,72(sp)
ffffffffc0205f32:	614d                	addi	sp,sp,176
ffffffffc0205f34:	8082                	ret
ffffffffc0205f36:	0104ba03          	ld	s4,16(s1)
ffffffffc0205f3a:	0084bb83          	ld	s7,8(s1)
ffffffffc0205f3e:	120a0063          	beqz	s4,ffffffffc020605e <stride_dequeue+0x2e6>
ffffffffc0205f42:	85a2                	mv	a1,s0
ffffffffc0205f44:	8552                	mv	a0,s4
ffffffffc0205f46:	bd1ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205f4a:	8caa                	mv	s9,a0
ffffffffc0205f4c:	25350563          	beq	a0,s3,ffffffffc0206196 <stride_dequeue+0x41e>
ffffffffc0205f50:	01043d03          	ld	s10,16(s0)
ffffffffc0205f54:	00843c03          	ld	s8,8(s0)
ffffffffc0205f58:	0e0d0d63          	beqz	s10,ffffffffc0206052 <stride_dequeue+0x2da>
ffffffffc0205f5c:	85ea                	mv	a1,s10
ffffffffc0205f5e:	8552                	mv	a0,s4
ffffffffc0205f60:	bb7ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205f64:	8caa                	mv	s9,a0
ffffffffc0205f66:	35350063          	beq	a0,s3,ffffffffc02062a6 <stride_dequeue+0x52e>
ffffffffc0205f6a:	008d3783          	ld	a5,8(s10)
ffffffffc0205f6e:	010d3c83          	ld	s9,16(s10)
ffffffffc0205f72:	e43e                	sd	a5,8(sp)
ffffffffc0205f74:	0c0c8763          	beqz	s9,ffffffffc0206042 <stride_dequeue+0x2ca>
ffffffffc0205f78:	85e6                	mv	a1,s9
ffffffffc0205f7a:	8552                	mv	a0,s4
ffffffffc0205f7c:	b9bff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205f80:	79350c63          	beq	a0,s3,ffffffffc0206718 <stride_dequeue+0x9a0>
ffffffffc0205f84:	008cb783          	ld	a5,8(s9)
ffffffffc0205f88:	010cb983          	ld	s3,16(s9)
ffffffffc0205f8c:	e83e                	sd	a5,16(sp)
ffffffffc0205f8e:	0a098263          	beqz	s3,ffffffffc0206032 <stride_dequeue+0x2ba>
ffffffffc0205f92:	85ce                	mv	a1,s3
ffffffffc0205f94:	8552                	mv	a0,s4
ffffffffc0205f96:	b81ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205f9a:	58fd                	li	a7,-1
ffffffffc0205f9c:	4b1507e3          	beq	a0,a7,ffffffffc0206c4a <stride_dequeue+0xed2>
ffffffffc0205fa0:	0089b703          	ld	a4,8(s3)
ffffffffc0205fa4:	0109b783          	ld	a5,16(s3)
ffffffffc0205fa8:	ec3a                	sd	a4,24(sp)
ffffffffc0205faa:	cfa5                	beqz	a5,ffffffffc0206022 <stride_dequeue+0x2aa>
ffffffffc0205fac:	85be                	mv	a1,a5
ffffffffc0205fae:	8552                	mv	a0,s4
ffffffffc0205fb0:	f03e                	sd	a5,32(sp)
ffffffffc0205fb2:	b65ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205fb6:	58fd                	li	a7,-1
ffffffffc0205fb8:	7782                	ld	a5,32(sp)
ffffffffc0205fba:	01151463          	bne	a0,a7,ffffffffc0205fc2 <stride_dequeue+0x24a>
ffffffffc0205fbe:	40e0106f          	j	ffffffffc02073cc <stride_dequeue+0x1654>
ffffffffc0205fc2:	6798                	ld	a4,8(a5)
ffffffffc0205fc4:	0107b303          	ld	t1,16(a5)
ffffffffc0205fc8:	f03a                	sd	a4,32(sp)
ffffffffc0205fca:	00031463          	bnez	t1,ffffffffc0205fd2 <stride_dequeue+0x25a>
ffffffffc0205fce:	0bb0106f          	j	ffffffffc0207888 <stride_dequeue+0x1b10>
ffffffffc0205fd2:	859a                	mv	a1,t1
ffffffffc0205fd4:	8552                	mv	a0,s4
ffffffffc0205fd6:	f83e                	sd	a5,48(sp)
ffffffffc0205fd8:	f41a                	sd	t1,40(sp)
ffffffffc0205fda:	b3dff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0205fde:	58fd                	li	a7,-1
ffffffffc0205fe0:	7322                	ld	t1,40(sp)
ffffffffc0205fe2:	77c2                	ld	a5,48(sp)
ffffffffc0205fe4:	01151463          	bne	a0,a7,ffffffffc0205fec <stride_dequeue+0x274>
ffffffffc0205fe8:	2310106f          	j	ffffffffc0207a18 <stride_dequeue+0x1ca0>
ffffffffc0205fec:	00833883          	ld	a7,8(t1)
ffffffffc0205ff0:	01033583          	ld	a1,16(t1)
ffffffffc0205ff4:	8552                	mv	a0,s4
ffffffffc0205ff6:	fc3e                	sd	a5,56(sp)
ffffffffc0205ff8:	f81a                	sd	t1,48(sp)
ffffffffc0205ffa:	f446                	sd	a7,40(sp)
ffffffffc0205ffc:	b7dff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206000:	7342                	ld	t1,48(sp)
ffffffffc0206002:	78a2                	ld	a7,40(sp)
ffffffffc0206004:	77e2                	ld	a5,56(sp)
ffffffffc0206006:	00a33423          	sd	a0,8(t1)
ffffffffc020600a:	01133823          	sd	a7,16(t1)
ffffffffc020600e:	c119                	beqz	a0,ffffffffc0206014 <stride_dequeue+0x29c>
ffffffffc0206010:	00653023          	sd	t1,0(a0)
ffffffffc0206014:	7702                	ld	a4,32(sp)
ffffffffc0206016:	0067b423          	sd	t1,8(a5)
ffffffffc020601a:	8a3e                	mv	s4,a5
ffffffffc020601c:	eb98                	sd	a4,16(a5)
ffffffffc020601e:	00f33023          	sd	a5,0(t1)
ffffffffc0206022:	67e2                	ld	a5,24(sp)
ffffffffc0206024:	0149b423          	sd	s4,8(s3)
ffffffffc0206028:	00f9b823          	sd	a5,16(s3)
ffffffffc020602c:	013a3023          	sd	s3,0(s4)
ffffffffc0206030:	8a4e                	mv	s4,s3
ffffffffc0206032:	67c2                	ld	a5,16(sp)
ffffffffc0206034:	014cb423          	sd	s4,8(s9)
ffffffffc0206038:	00fcb823          	sd	a5,16(s9)
ffffffffc020603c:	019a3023          	sd	s9,0(s4)
ffffffffc0206040:	8a66                	mv	s4,s9
ffffffffc0206042:	67a2                	ld	a5,8(sp)
ffffffffc0206044:	014d3423          	sd	s4,8(s10)
ffffffffc0206048:	00fd3823          	sd	a5,16(s10)
ffffffffc020604c:	01aa3023          	sd	s10,0(s4)
ffffffffc0206050:	8a6a                	mv	s4,s10
ffffffffc0206052:	01443423          	sd	s4,8(s0)
ffffffffc0206056:	01843823          	sd	s8,16(s0)
ffffffffc020605a:	008a3023          	sd	s0,0(s4)
ffffffffc020605e:	e480                	sd	s0,8(s1)
ffffffffc0206060:	0174b823          	sd	s7,16(s1)
ffffffffc0206064:	e004                	sd	s1,0(s0)
ffffffffc0206066:	8426                	mv	s0,s1
ffffffffc0206068:	01b43023          	sd	s11,0(s0)
ffffffffc020606c:	b569                	j	ffffffffc0205ef6 <stride_dequeue+0x17e>
ffffffffc020606e:	e80412e3          	bnez	s0,ffffffffc0205ef2 <stride_dequeue+0x17a>
ffffffffc0206072:	e80d94e3          	bnez	s11,ffffffffc0205efa <stride_dequeue+0x182>
ffffffffc0206076:	8b22                	mv	s6,s0
ffffffffc0206078:	bd49                	j	ffffffffc0205f0a <stride_dequeue+0x192>
ffffffffc020607a:	008db423          	sd	s0,8(s11)
ffffffffc020607e:	b571                	j	ffffffffc0205f0a <stride_dequeue+0x192>
ffffffffc0206080:	0104bc03          	ld	s8,16(s1)
ffffffffc0206084:	0084ba03          	ld	s4,8(s1)
ffffffffc0206088:	0e0c0c63          	beqz	s8,ffffffffc0206180 <stride_dequeue+0x408>
ffffffffc020608c:	85ce                	mv	a1,s3
ffffffffc020608e:	8562                	mv	a0,s8
ffffffffc0206090:	a87ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206094:	8d2a                	mv	s10,a0
ffffffffc0206096:	31950263          	beq	a0,s9,ffffffffc020639a <stride_dequeue+0x622>
ffffffffc020609a:	0089b783          	ld	a5,8(s3)
ffffffffc020609e:	0109bd03          	ld	s10,16(s3)
ffffffffc02060a2:	e43e                	sd	a5,8(sp)
ffffffffc02060a4:	0c0d0763          	beqz	s10,ffffffffc0206172 <stride_dequeue+0x3fa>
ffffffffc02060a8:	85ea                	mv	a1,s10
ffffffffc02060aa:	8562                	mv	a0,s8
ffffffffc02060ac:	a6bff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02060b0:	7f950c63          	beq	a0,s9,ffffffffc02068a8 <stride_dequeue+0xb30>
ffffffffc02060b4:	008d3783          	ld	a5,8(s10)
ffffffffc02060b8:	010d3c83          	ld	s9,16(s10)
ffffffffc02060bc:	e83e                	sd	a5,16(sp)
ffffffffc02060be:	0a0c8263          	beqz	s9,ffffffffc0206162 <stride_dequeue+0x3ea>
ffffffffc02060c2:	85e6                	mv	a1,s9
ffffffffc02060c4:	8562                	mv	a0,s8
ffffffffc02060c6:	a51ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02060ca:	58fd                	li	a7,-1
ffffffffc02060cc:	41150ae3          	beq	a0,a7,ffffffffc0206ce0 <stride_dequeue+0xf68>
ffffffffc02060d0:	008cb703          	ld	a4,8(s9)
ffffffffc02060d4:	010cb783          	ld	a5,16(s9)
ffffffffc02060d8:	ec3a                	sd	a4,24(sp)
ffffffffc02060da:	cfa5                	beqz	a5,ffffffffc0206152 <stride_dequeue+0x3da>
ffffffffc02060dc:	85be                	mv	a1,a5
ffffffffc02060de:	8562                	mv	a0,s8
ffffffffc02060e0:	f03e                	sd	a5,32(sp)
ffffffffc02060e2:	a35ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02060e6:	58fd                	li	a7,-1
ffffffffc02060e8:	7782                	ld	a5,32(sp)
ffffffffc02060ea:	01151463          	bne	a0,a7,ffffffffc02060f2 <stride_dequeue+0x37a>
ffffffffc02060ee:	3340106f          	j	ffffffffc0207422 <stride_dequeue+0x16aa>
ffffffffc02060f2:	6798                	ld	a4,8(a5)
ffffffffc02060f4:	0107b303          	ld	t1,16(a5)
ffffffffc02060f8:	f03a                	sd	a4,32(sp)
ffffffffc02060fa:	00031463          	bnez	t1,ffffffffc0206102 <stride_dequeue+0x38a>
ffffffffc02060fe:	7900106f          	j	ffffffffc020788e <stride_dequeue+0x1b16>
ffffffffc0206102:	859a                	mv	a1,t1
ffffffffc0206104:	8562                	mv	a0,s8
ffffffffc0206106:	f83e                	sd	a5,48(sp)
ffffffffc0206108:	f41a                	sd	t1,40(sp)
ffffffffc020610a:	a0dff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020610e:	58fd                	li	a7,-1
ffffffffc0206110:	7322                	ld	t1,40(sp)
ffffffffc0206112:	77c2                	ld	a5,48(sp)
ffffffffc0206114:	01151463          	bne	a0,a7,ffffffffc020611c <stride_dequeue+0x3a4>
ffffffffc0206118:	12b0106f          	j	ffffffffc0207a42 <stride_dequeue+0x1cca>
ffffffffc020611c:	00833883          	ld	a7,8(t1)
ffffffffc0206120:	01033583          	ld	a1,16(t1)
ffffffffc0206124:	8562                	mv	a0,s8
ffffffffc0206126:	fc3e                	sd	a5,56(sp)
ffffffffc0206128:	f81a                	sd	t1,48(sp)
ffffffffc020612a:	f446                	sd	a7,40(sp)
ffffffffc020612c:	a4dff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206130:	7342                	ld	t1,48(sp)
ffffffffc0206132:	78a2                	ld	a7,40(sp)
ffffffffc0206134:	77e2                	ld	a5,56(sp)
ffffffffc0206136:	00a33423          	sd	a0,8(t1)
ffffffffc020613a:	01133823          	sd	a7,16(t1)
ffffffffc020613e:	c119                	beqz	a0,ffffffffc0206144 <stride_dequeue+0x3cc>
ffffffffc0206140:	00653023          	sd	t1,0(a0)
ffffffffc0206144:	7702                	ld	a4,32(sp)
ffffffffc0206146:	0067b423          	sd	t1,8(a5)
ffffffffc020614a:	8c3e                	mv	s8,a5
ffffffffc020614c:	eb98                	sd	a4,16(a5)
ffffffffc020614e:	00f33023          	sd	a5,0(t1)
ffffffffc0206152:	67e2                	ld	a5,24(sp)
ffffffffc0206154:	018cb423          	sd	s8,8(s9)
ffffffffc0206158:	00fcb823          	sd	a5,16(s9)
ffffffffc020615c:	019c3023          	sd	s9,0(s8)
ffffffffc0206160:	8c66                	mv	s8,s9
ffffffffc0206162:	67c2                	ld	a5,16(sp)
ffffffffc0206164:	018d3423          	sd	s8,8(s10)
ffffffffc0206168:	00fd3823          	sd	a5,16(s10)
ffffffffc020616c:	01ac3023          	sd	s10,0(s8)
ffffffffc0206170:	8c6a                	mv	s8,s10
ffffffffc0206172:	67a2                	ld	a5,8(sp)
ffffffffc0206174:	0189b423          	sd	s8,8(s3)
ffffffffc0206178:	00f9b823          	sd	a5,16(s3)
ffffffffc020617c:	013c3023          	sd	s3,0(s8)
ffffffffc0206180:	0134b423          	sd	s3,8(s1)
ffffffffc0206184:	0144b823          	sd	s4,16(s1)
ffffffffc0206188:	0099b023          	sd	s1,0(s3)
ffffffffc020618c:	bbb9                	j	ffffffffc0205eea <stride_dequeue+0x172>
ffffffffc020618e:	8426                	mv	s0,s1
ffffffffc0206190:	01b43023          	sd	s11,0(s0)
ffffffffc0206194:	b38d                	j	ffffffffc0205ef6 <stride_dequeue+0x17e>
ffffffffc0206196:	010a3c03          	ld	s8,16(s4)
ffffffffc020619a:	008a3983          	ld	s3,8(s4)
ffffffffc020619e:	0e0c0c63          	beqz	s8,ffffffffc0206296 <stride_dequeue+0x51e>
ffffffffc02061a2:	85a2                	mv	a1,s0
ffffffffc02061a4:	8562                	mv	a0,s8
ffffffffc02061a6:	971ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02061aa:	8d2a                	mv	s10,a0
ffffffffc02061ac:	49950063          	beq	a0,s9,ffffffffc020662c <stride_dequeue+0x8b4>
ffffffffc02061b0:	641c                	ld	a5,8(s0)
ffffffffc02061b2:	01043d03          	ld	s10,16(s0)
ffffffffc02061b6:	e43e                	sd	a5,8(sp)
ffffffffc02061b8:	0c0d0963          	beqz	s10,ffffffffc020628a <stride_dequeue+0x512>
ffffffffc02061bc:	85ea                	mv	a1,s10
ffffffffc02061be:	8562                	mv	a0,s8
ffffffffc02061c0:	957ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02061c4:	1d9500e3          	beq	a0,s9,ffffffffc0206b84 <stride_dequeue+0xe0c>
ffffffffc02061c8:	008d3783          	ld	a5,8(s10)
ffffffffc02061cc:	010d3c83          	ld	s9,16(s10)
ffffffffc02061d0:	e83e                	sd	a5,16(sp)
ffffffffc02061d2:	0a0c8463          	beqz	s9,ffffffffc020627a <stride_dequeue+0x502>
ffffffffc02061d6:	85e6                	mv	a1,s9
ffffffffc02061d8:	8562                	mv	a0,s8
ffffffffc02061da:	93dff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02061de:	58fd                	li	a7,-1
ffffffffc02061e0:	631507e3          	beq	a0,a7,ffffffffc020700e <stride_dequeue+0x1296>
ffffffffc02061e4:	008cb703          	ld	a4,8(s9)
ffffffffc02061e8:	010cb783          	ld	a5,16(s9)
ffffffffc02061ec:	ec3a                	sd	a4,24(sp)
ffffffffc02061ee:	e399                	bnez	a5,ffffffffc02061f4 <stride_dequeue+0x47c>
ffffffffc02061f0:	1230106f          	j	ffffffffc0207b12 <stride_dequeue+0x1d9a>
ffffffffc02061f4:	85be                	mv	a1,a5
ffffffffc02061f6:	8562                	mv	a0,s8
ffffffffc02061f8:	f03e                	sd	a5,32(sp)
ffffffffc02061fa:	91dff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02061fe:	58fd                	li	a7,-1
ffffffffc0206200:	7782                	ld	a5,32(sp)
ffffffffc0206202:	01151463          	bne	a0,a7,ffffffffc020620a <stride_dequeue+0x492>
ffffffffc0206206:	6f20106f          	j	ffffffffc02078f8 <stride_dequeue+0x1b80>
ffffffffc020620a:	6798                	ld	a4,8(a5)
ffffffffc020620c:	0107b303          	ld	t1,16(a5)
ffffffffc0206210:	f03a                	sd	a4,32(sp)
ffffffffc0206212:	04030663          	beqz	t1,ffffffffc020625e <stride_dequeue+0x4e6>
ffffffffc0206216:	859a                	mv	a1,t1
ffffffffc0206218:	8562                	mv	a0,s8
ffffffffc020621a:	f83e                	sd	a5,48(sp)
ffffffffc020621c:	f41a                	sd	t1,40(sp)
ffffffffc020621e:	8f9ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206222:	58fd                	li	a7,-1
ffffffffc0206224:	7322                	ld	t1,40(sp)
ffffffffc0206226:	77c2                	ld	a5,48(sp)
ffffffffc0206228:	01151463          	bne	a0,a7,ffffffffc0206230 <stride_dequeue+0x4b8>
ffffffffc020622c:	4190106f          	j	ffffffffc0207e44 <stride_dequeue+0x20cc>
ffffffffc0206230:	00833883          	ld	a7,8(t1)
ffffffffc0206234:	01033583          	ld	a1,16(t1)
ffffffffc0206238:	8562                	mv	a0,s8
ffffffffc020623a:	fc3e                	sd	a5,56(sp)
ffffffffc020623c:	f81a                	sd	t1,48(sp)
ffffffffc020623e:	f446                	sd	a7,40(sp)
ffffffffc0206240:	939ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206244:	7342                	ld	t1,48(sp)
ffffffffc0206246:	78a2                	ld	a7,40(sp)
ffffffffc0206248:	77e2                	ld	a5,56(sp)
ffffffffc020624a:	00a33423          	sd	a0,8(t1)
ffffffffc020624e:	01133823          	sd	a7,16(t1)
ffffffffc0206252:	e119                	bnez	a0,ffffffffc0206258 <stride_dequeue+0x4e0>
ffffffffc0206254:	57b0106f          	j	ffffffffc0207fce <stride_dequeue+0x2256>
ffffffffc0206258:	00653023          	sd	t1,0(a0)
ffffffffc020625c:	8c1a                	mv	s8,t1
ffffffffc020625e:	7702                	ld	a4,32(sp)
ffffffffc0206260:	0187b423          	sd	s8,8(a5)
ffffffffc0206264:	eb98                	sd	a4,16(a5)
ffffffffc0206266:	00fc3023          	sd	a5,0(s8)
ffffffffc020626a:	6762                	ld	a4,24(sp)
ffffffffc020626c:	00fcb423          	sd	a5,8(s9)
ffffffffc0206270:	8c66                	mv	s8,s9
ffffffffc0206272:	00ecb823          	sd	a4,16(s9)
ffffffffc0206276:	0197b023          	sd	s9,0(a5)
ffffffffc020627a:	67c2                	ld	a5,16(sp)
ffffffffc020627c:	018d3423          	sd	s8,8(s10)
ffffffffc0206280:	00fd3823          	sd	a5,16(s10)
ffffffffc0206284:	01ac3023          	sd	s10,0(s8)
ffffffffc0206288:	8c6a                	mv	s8,s10
ffffffffc020628a:	67a2                	ld	a5,8(sp)
ffffffffc020628c:	01843423          	sd	s8,8(s0)
ffffffffc0206290:	e81c                	sd	a5,16(s0)
ffffffffc0206292:	008c3023          	sd	s0,0(s8)
ffffffffc0206296:	008a3423          	sd	s0,8(s4)
ffffffffc020629a:	013a3823          	sd	s3,16(s4)
ffffffffc020629e:	01443023          	sd	s4,0(s0)
ffffffffc02062a2:	8452                	mv	s0,s4
ffffffffc02062a4:	bb6d                	j	ffffffffc020605e <stride_dequeue+0x2e6>
ffffffffc02062a6:	008a3783          	ld	a5,8(s4)
ffffffffc02062aa:	010a3983          	ld	s3,16(s4)
ffffffffc02062ae:	e43e                	sd	a5,8(sp)
ffffffffc02062b0:	0c098d63          	beqz	s3,ffffffffc020638a <stride_dequeue+0x612>
ffffffffc02062b4:	85ea                	mv	a1,s10
ffffffffc02062b6:	854e                	mv	a0,s3
ffffffffc02062b8:	85fff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02062bc:	73950e63          	beq	a0,s9,ffffffffc02069f8 <stride_dequeue+0xc80>
ffffffffc02062c0:	008d3783          	ld	a5,8(s10)
ffffffffc02062c4:	010d3c83          	ld	s9,16(s10)
ffffffffc02062c8:	e83e                	sd	a5,16(sp)
ffffffffc02062ca:	0a0c8963          	beqz	s9,ffffffffc020637c <stride_dequeue+0x604>
ffffffffc02062ce:	85e6                	mv	a1,s9
ffffffffc02062d0:	854e                	mv	a0,s3
ffffffffc02062d2:	845ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02062d6:	58fd                	li	a7,-1
ffffffffc02062d8:	01151463          	bne	a0,a7,ffffffffc02062e0 <stride_dequeue+0x568>
ffffffffc02062dc:	7070006f          	j	ffffffffc02071e2 <stride_dequeue+0x146a>
ffffffffc02062e0:	008cb783          	ld	a5,8(s9)
ffffffffc02062e4:	010cb803          	ld	a6,16(s9)
ffffffffc02062e8:	ec3e                	sd	a5,24(sp)
ffffffffc02062ea:	00081463          	bnez	a6,ffffffffc02062f2 <stride_dequeue+0x57a>
ffffffffc02062ee:	02b0106f          	j	ffffffffc0207b18 <stride_dequeue+0x1da0>
ffffffffc02062f2:	85c2                	mv	a1,a6
ffffffffc02062f4:	854e                	mv	a0,s3
ffffffffc02062f6:	f042                	sd	a6,32(sp)
ffffffffc02062f8:	81fff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02062fc:	58fd                	li	a7,-1
ffffffffc02062fe:	7802                	ld	a6,32(sp)
ffffffffc0206300:	01151463          	bne	a0,a7,ffffffffc0206308 <stride_dequeue+0x590>
ffffffffc0206304:	5260106f          	j	ffffffffc020782a <stride_dequeue+0x1ab2>
ffffffffc0206308:	00883783          	ld	a5,8(a6) # fffffffffffff008 <end+0x3fdc2030>
ffffffffc020630c:	01083303          	ld	t1,16(a6)
ffffffffc0206310:	f03e                	sd	a5,32(sp)
ffffffffc0206312:	04030663          	beqz	t1,ffffffffc020635e <stride_dequeue+0x5e6>
ffffffffc0206316:	859a                	mv	a1,t1
ffffffffc0206318:	854e                	mv	a0,s3
ffffffffc020631a:	f842                	sd	a6,48(sp)
ffffffffc020631c:	f41a                	sd	t1,40(sp)
ffffffffc020631e:	ff8ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206322:	58fd                	li	a7,-1
ffffffffc0206324:	7322                	ld	t1,40(sp)
ffffffffc0206326:	7842                	ld	a6,48(sp)
ffffffffc0206328:	01151463          	bne	a0,a7,ffffffffc0206330 <stride_dequeue+0x5b8>
ffffffffc020632c:	0ab0106f          	j	ffffffffc0207bd6 <stride_dequeue+0x1e5e>
ffffffffc0206330:	00833883          	ld	a7,8(t1)
ffffffffc0206334:	01033583          	ld	a1,16(t1)
ffffffffc0206338:	854e                	mv	a0,s3
ffffffffc020633a:	fc42                	sd	a6,56(sp)
ffffffffc020633c:	f81a                	sd	t1,48(sp)
ffffffffc020633e:	f446                	sd	a7,40(sp)
ffffffffc0206340:	839ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206344:	7342                	ld	t1,48(sp)
ffffffffc0206346:	78a2                	ld	a7,40(sp)
ffffffffc0206348:	7862                	ld	a6,56(sp)
ffffffffc020634a:	00a33423          	sd	a0,8(t1)
ffffffffc020634e:	01133823          	sd	a7,16(t1)
ffffffffc0206352:	e119                	bnez	a0,ffffffffc0206358 <stride_dequeue+0x5e0>
ffffffffc0206354:	4fb0106f          	j	ffffffffc020804e <stride_dequeue+0x22d6>
ffffffffc0206358:	00653023          	sd	t1,0(a0)
ffffffffc020635c:	899a                	mv	s3,t1
ffffffffc020635e:	7782                	ld	a5,32(sp)
ffffffffc0206360:	01383423          	sd	s3,8(a6)
ffffffffc0206364:	00f83823          	sd	a5,16(a6)
ffffffffc0206368:	0109b023          	sd	a6,0(s3)
ffffffffc020636c:	67e2                	ld	a5,24(sp)
ffffffffc020636e:	010cb423          	sd	a6,8(s9)
ffffffffc0206372:	89e6                	mv	s3,s9
ffffffffc0206374:	00fcb823          	sd	a5,16(s9)
ffffffffc0206378:	01983023          	sd	s9,0(a6)
ffffffffc020637c:	67c2                	ld	a5,16(sp)
ffffffffc020637e:	013d3423          	sd	s3,8(s10)
ffffffffc0206382:	00fd3823          	sd	a5,16(s10)
ffffffffc0206386:	01a9b023          	sd	s10,0(s3)
ffffffffc020638a:	67a2                	ld	a5,8(sp)
ffffffffc020638c:	01aa3423          	sd	s10,8(s4)
ffffffffc0206390:	00fa3823          	sd	a5,16(s4)
ffffffffc0206394:	014d3023          	sd	s4,0(s10)
ffffffffc0206398:	b96d                	j	ffffffffc0206052 <stride_dequeue+0x2da>
ffffffffc020639a:	008c3783          	ld	a5,8(s8)
ffffffffc020639e:	010c3c83          	ld	s9,16(s8)
ffffffffc02063a2:	e43e                	sd	a5,8(sp)
ffffffffc02063a4:	0c0c8a63          	beqz	s9,ffffffffc0206478 <stride_dequeue+0x700>
ffffffffc02063a8:	85ce                	mv	a1,s3
ffffffffc02063aa:	8566                	mv	a0,s9
ffffffffc02063ac:	f6aff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02063b0:	71a50763          	beq	a0,s10,ffffffffc0206abe <stride_dequeue+0xd46>
ffffffffc02063b4:	0089b783          	ld	a5,8(s3)
ffffffffc02063b8:	0109b603          	ld	a2,16(s3)
ffffffffc02063bc:	e83e                	sd	a5,16(sp)
ffffffffc02063be:	c655                	beqz	a2,ffffffffc020646a <stride_dequeue+0x6f2>
ffffffffc02063c0:	85b2                	mv	a1,a2
ffffffffc02063c2:	8566                	mv	a0,s9
ffffffffc02063c4:	ec32                	sd	a2,24(sp)
ffffffffc02063c6:	f50ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02063ca:	58fd                	li	a7,-1
ffffffffc02063cc:	6662                	ld	a2,24(sp)
ffffffffc02063ce:	6b1506e3          	beq	a0,a7,ffffffffc020727a <stride_dequeue+0x1502>
ffffffffc02063d2:	661c                	ld	a5,8(a2)
ffffffffc02063d4:	01063d03          	ld	s10,16(a2)
ffffffffc02063d8:	ec3e                	sd	a5,24(sp)
ffffffffc02063da:	000d1463          	bnez	s10,ffffffffc02063e2 <stride_dequeue+0x66a>
ffffffffc02063de:	7520106f          	j	ffffffffc0207b30 <stride_dequeue+0x1db8>
ffffffffc02063e2:	85ea                	mv	a1,s10
ffffffffc02063e4:	8566                	mv	a0,s9
ffffffffc02063e6:	f032                	sd	a2,32(sp)
ffffffffc02063e8:	f2eff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02063ec:	58fd                	li	a7,-1
ffffffffc02063ee:	7602                	ld	a2,32(sp)
ffffffffc02063f0:	01151463          	bne	a0,a7,ffffffffc02063f8 <stride_dequeue+0x680>
ffffffffc02063f4:	4a60106f          	j	ffffffffc020789a <stride_dequeue+0x1b22>
ffffffffc02063f8:	008d3783          	ld	a5,8(s10)
ffffffffc02063fc:	010d3303          	ld	t1,16(s10)
ffffffffc0206400:	f03e                	sd	a5,32(sp)
ffffffffc0206402:	04030663          	beqz	t1,ffffffffc020644e <stride_dequeue+0x6d6>
ffffffffc0206406:	859a                	mv	a1,t1
ffffffffc0206408:	8566                	mv	a0,s9
ffffffffc020640a:	f832                	sd	a2,48(sp)
ffffffffc020640c:	f41a                	sd	t1,40(sp)
ffffffffc020640e:	f08ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206412:	58fd                	li	a7,-1
ffffffffc0206414:	7322                	ld	t1,40(sp)
ffffffffc0206416:	7642                	ld	a2,48(sp)
ffffffffc0206418:	01151463          	bne	a0,a7,ffffffffc0206420 <stride_dequeue+0x6a8>
ffffffffc020641c:	2f70106f          	j	ffffffffc0207f12 <stride_dequeue+0x219a>
ffffffffc0206420:	00833883          	ld	a7,8(t1)
ffffffffc0206424:	01033583          	ld	a1,16(t1)
ffffffffc0206428:	8566                	mv	a0,s9
ffffffffc020642a:	fc32                	sd	a2,56(sp)
ffffffffc020642c:	f81a                	sd	t1,48(sp)
ffffffffc020642e:	f446                	sd	a7,40(sp)
ffffffffc0206430:	f48ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206434:	7342                	ld	t1,48(sp)
ffffffffc0206436:	78a2                	ld	a7,40(sp)
ffffffffc0206438:	7662                	ld	a2,56(sp)
ffffffffc020643a:	00a33423          	sd	a0,8(t1)
ffffffffc020643e:	01133823          	sd	a7,16(t1)
ffffffffc0206442:	e119                	bnez	a0,ffffffffc0206448 <stride_dequeue+0x6d0>
ffffffffc0206444:	3590106f          	j	ffffffffc0207f9c <stride_dequeue+0x2224>
ffffffffc0206448:	00653023          	sd	t1,0(a0)
ffffffffc020644c:	8c9a                	mv	s9,t1
ffffffffc020644e:	7782                	ld	a5,32(sp)
ffffffffc0206450:	019d3423          	sd	s9,8(s10)
ffffffffc0206454:	00fd3823          	sd	a5,16(s10)
ffffffffc0206458:	01acb023          	sd	s10,0(s9)
ffffffffc020645c:	67e2                	ld	a5,24(sp)
ffffffffc020645e:	01a63423          	sd	s10,8(a2)
ffffffffc0206462:	8cb2                	mv	s9,a2
ffffffffc0206464:	ea1c                	sd	a5,16(a2)
ffffffffc0206466:	00cd3023          	sd	a2,0(s10)
ffffffffc020646a:	67c2                	ld	a5,16(sp)
ffffffffc020646c:	0199b423          	sd	s9,8(s3)
ffffffffc0206470:	00f9b823          	sd	a5,16(s3)
ffffffffc0206474:	013cb023          	sd	s3,0(s9)
ffffffffc0206478:	67a2                	ld	a5,8(sp)
ffffffffc020647a:	013c3423          	sd	s3,8(s8)
ffffffffc020647e:	00fc3823          	sd	a5,16(s8)
ffffffffc0206482:	0189b023          	sd	s8,0(s3)
ffffffffc0206486:	89e2                	mv	s3,s8
ffffffffc0206488:	b9e5                	j	ffffffffc0206180 <stride_dequeue+0x408>
ffffffffc020648a:	649c                	ld	a5,8(s1)
ffffffffc020648c:	0104ba03          	ld	s4,16(s1)
ffffffffc0206490:	e83e                	sd	a5,16(sp)
ffffffffc0206492:	0a0a0263          	beqz	s4,ffffffffc0206536 <stride_dequeue+0x7be>
ffffffffc0206496:	85e6                	mv	a1,s9
ffffffffc0206498:	8552                	mv	a0,s4
ffffffffc020649a:	e7cff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020649e:	58fd                	li	a7,-1
ffffffffc02064a0:	171504e3          	beq	a0,a7,ffffffffc0206e08 <stride_dequeue+0x1090>
ffffffffc02064a4:	008cb783          	ld	a5,8(s9)
ffffffffc02064a8:	010cb803          	ld	a6,16(s9)
ffffffffc02064ac:	ec3e                	sd	a5,24(sp)
ffffffffc02064ae:	06080d63          	beqz	a6,ffffffffc0206528 <stride_dequeue+0x7b0>
ffffffffc02064b2:	85c2                	mv	a1,a6
ffffffffc02064b4:	8552                	mv	a0,s4
ffffffffc02064b6:	f042                	sd	a6,32(sp)
ffffffffc02064b8:	e5eff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02064bc:	58fd                	li	a7,-1
ffffffffc02064be:	7802                	ld	a6,32(sp)
ffffffffc02064c0:	6b1508e3          	beq	a0,a7,ffffffffc0207370 <stride_dequeue+0x15f8>
ffffffffc02064c4:	00883783          	ld	a5,8(a6)
ffffffffc02064c8:	01083303          	ld	t1,16(a6)
ffffffffc02064cc:	f03e                	sd	a5,32(sp)
ffffffffc02064ce:	00031463          	bnez	t1,ffffffffc02064d6 <stride_dequeue+0x75e>
ffffffffc02064d2:	4dc0106f          	j	ffffffffc02079ae <stride_dequeue+0x1c36>
ffffffffc02064d6:	859a                	mv	a1,t1
ffffffffc02064d8:	8552                	mv	a0,s4
ffffffffc02064da:	f842                	sd	a6,48(sp)
ffffffffc02064dc:	f41a                	sd	t1,40(sp)
ffffffffc02064de:	e38ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02064e2:	58fd                	li	a7,-1
ffffffffc02064e4:	7322                	ld	t1,40(sp)
ffffffffc02064e6:	7842                	ld	a6,48(sp)
ffffffffc02064e8:	01151463          	bne	a0,a7,ffffffffc02064f0 <stride_dequeue+0x778>
ffffffffc02064ec:	5800106f          	j	ffffffffc0207a6c <stride_dequeue+0x1cf4>
ffffffffc02064f0:	00833883          	ld	a7,8(t1)
ffffffffc02064f4:	01033583          	ld	a1,16(t1)
ffffffffc02064f8:	8552                	mv	a0,s4
ffffffffc02064fa:	fc42                	sd	a6,56(sp)
ffffffffc02064fc:	f81a                	sd	t1,48(sp)
ffffffffc02064fe:	f446                	sd	a7,40(sp)
ffffffffc0206500:	e78ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206504:	7342                	ld	t1,48(sp)
ffffffffc0206506:	78a2                	ld	a7,40(sp)
ffffffffc0206508:	7862                	ld	a6,56(sp)
ffffffffc020650a:	00a33423          	sd	a0,8(t1)
ffffffffc020650e:	01133823          	sd	a7,16(t1)
ffffffffc0206512:	c119                	beqz	a0,ffffffffc0206518 <stride_dequeue+0x7a0>
ffffffffc0206514:	00653023          	sd	t1,0(a0)
ffffffffc0206518:	7782                	ld	a5,32(sp)
ffffffffc020651a:	00683423          	sd	t1,8(a6)
ffffffffc020651e:	8a42                	mv	s4,a6
ffffffffc0206520:	00f83823          	sd	a5,16(a6)
ffffffffc0206524:	01033023          	sd	a6,0(t1)
ffffffffc0206528:	67e2                	ld	a5,24(sp)
ffffffffc020652a:	014cb423          	sd	s4,8(s9)
ffffffffc020652e:	00fcb823          	sd	a5,16(s9)
ffffffffc0206532:	019a3023          	sd	s9,0(s4)
ffffffffc0206536:	67c2                	ld	a5,16(sp)
ffffffffc0206538:	0194b423          	sd	s9,8(s1)
ffffffffc020653c:	e89c                	sd	a5,16(s1)
ffffffffc020653e:	009cb023          	sd	s1,0(s9)
ffffffffc0206542:	b269                	j	ffffffffc0205ecc <stride_dequeue+0x154>
ffffffffc0206544:	649c                	ld	a5,8(s1)
ffffffffc0206546:	0104ba03          	ld	s4,16(s1)
ffffffffc020654a:	e43e                	sd	a5,8(sp)
ffffffffc020654c:	0c0a0963          	beqz	s4,ffffffffc020661e <stride_dequeue+0x8a6>
ffffffffc0206550:	85ea                	mv	a1,s10
ffffffffc0206552:	8552                	mv	a0,s4
ffffffffc0206554:	dc2ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206558:	29950463          	beq	a0,s9,ffffffffc02067e0 <stride_dequeue+0xa68>
ffffffffc020655c:	008d3783          	ld	a5,8(s10)
ffffffffc0206560:	010d3c83          	ld	s9,16(s10)
ffffffffc0206564:	e83e                	sd	a5,16(sp)
ffffffffc0206566:	0a0c8563          	beqz	s9,ffffffffc0206610 <stride_dequeue+0x898>
ffffffffc020656a:	85e6                	mv	a1,s9
ffffffffc020656c:	8552                	mv	a0,s4
ffffffffc020656e:	da8ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206572:	58fd                	li	a7,-1
ffffffffc0206574:	011501e3          	beq	a0,a7,ffffffffc0206d76 <stride_dequeue+0xffe>
ffffffffc0206578:	008cb783          	ld	a5,8(s9)
ffffffffc020657c:	010cb803          	ld	a6,16(s9)
ffffffffc0206580:	ec3e                	sd	a5,24(sp)
ffffffffc0206582:	06080f63          	beqz	a6,ffffffffc0206600 <stride_dequeue+0x888>
ffffffffc0206586:	85c2                	mv	a1,a6
ffffffffc0206588:	8552                	mv	a0,s4
ffffffffc020658a:	f042                	sd	a6,32(sp)
ffffffffc020658c:	d8aff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206590:	58fd                	li	a7,-1
ffffffffc0206592:	7802                	ld	a6,32(sp)
ffffffffc0206594:	01151463          	bne	a0,a7,ffffffffc020659c <stride_dequeue+0x824>
ffffffffc0206598:	6e10006f          	j	ffffffffc0207478 <stride_dequeue+0x1700>
ffffffffc020659c:	00883783          	ld	a5,8(a6)
ffffffffc02065a0:	01083303          	ld	t1,16(a6)
ffffffffc02065a4:	f03e                	sd	a5,32(sp)
ffffffffc02065a6:	00031463          	bnez	t1,ffffffffc02065ae <stride_dequeue+0x836>
ffffffffc02065aa:	40a0106f          	j	ffffffffc02079b4 <stride_dequeue+0x1c3c>
ffffffffc02065ae:	859a                	mv	a1,t1
ffffffffc02065b0:	8552                	mv	a0,s4
ffffffffc02065b2:	f842                	sd	a6,48(sp)
ffffffffc02065b4:	f41a                	sd	t1,40(sp)
ffffffffc02065b6:	d60ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02065ba:	58fd                	li	a7,-1
ffffffffc02065bc:	7322                	ld	t1,40(sp)
ffffffffc02065be:	7842                	ld	a6,48(sp)
ffffffffc02065c0:	01151463          	bne	a0,a7,ffffffffc02065c8 <stride_dequeue+0x850>
ffffffffc02065c4:	5240106f          	j	ffffffffc0207ae8 <stride_dequeue+0x1d70>
ffffffffc02065c8:	00833883          	ld	a7,8(t1)
ffffffffc02065cc:	01033583          	ld	a1,16(t1)
ffffffffc02065d0:	8552                	mv	a0,s4
ffffffffc02065d2:	fc42                	sd	a6,56(sp)
ffffffffc02065d4:	f81a                	sd	t1,48(sp)
ffffffffc02065d6:	f446                	sd	a7,40(sp)
ffffffffc02065d8:	da0ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02065dc:	7342                	ld	t1,48(sp)
ffffffffc02065de:	78a2                	ld	a7,40(sp)
ffffffffc02065e0:	7862                	ld	a6,56(sp)
ffffffffc02065e2:	00a33423          	sd	a0,8(t1)
ffffffffc02065e6:	01133823          	sd	a7,16(t1)
ffffffffc02065ea:	c119                	beqz	a0,ffffffffc02065f0 <stride_dequeue+0x878>
ffffffffc02065ec:	00653023          	sd	t1,0(a0)
ffffffffc02065f0:	7782                	ld	a5,32(sp)
ffffffffc02065f2:	00683423          	sd	t1,8(a6)
ffffffffc02065f6:	8a42                	mv	s4,a6
ffffffffc02065f8:	00f83823          	sd	a5,16(a6)
ffffffffc02065fc:	01033023          	sd	a6,0(t1)
ffffffffc0206600:	67e2                	ld	a5,24(sp)
ffffffffc0206602:	014cb423          	sd	s4,8(s9)
ffffffffc0206606:	00fcb823          	sd	a5,16(s9)
ffffffffc020660a:	019a3023          	sd	s9,0(s4)
ffffffffc020660e:	8a66                	mv	s4,s9
ffffffffc0206610:	67c2                	ld	a5,16(sp)
ffffffffc0206612:	014d3423          	sd	s4,8(s10)
ffffffffc0206616:	00fd3823          	sd	a5,16(s10)
ffffffffc020661a:	01aa3023          	sd	s10,0(s4)
ffffffffc020661e:	67a2                	ld	a5,8(sp)
ffffffffc0206620:	01a4b423          	sd	s10,8(s1)
ffffffffc0206624:	e89c                	sd	a5,16(s1)
ffffffffc0206626:	009d3023          	sd	s1,0(s10)
ffffffffc020662a:	b84d                	j	ffffffffc0205edc <stride_dequeue+0x164>
ffffffffc020662c:	008c3783          	ld	a5,8(s8)
ffffffffc0206630:	010c3c83          	ld	s9,16(s8)
ffffffffc0206634:	e43e                	sd	a5,8(sp)
ffffffffc0206636:	0c0c8863          	beqz	s9,ffffffffc0206706 <stride_dequeue+0x98e>
ffffffffc020663a:	85a2                	mv	a1,s0
ffffffffc020663c:	8566                	mv	a0,s9
ffffffffc020663e:	cd8ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206642:	0ba506e3          	beq	a0,s10,ffffffffc0206eee <stride_dequeue+0x1176>
ffffffffc0206646:	641c                	ld	a5,8(s0)
ffffffffc0206648:	01043d03          	ld	s10,16(s0)
ffffffffc020664c:	e83e                	sd	a5,16(sp)
ffffffffc020664e:	000d1463          	bnez	s10,ffffffffc0206656 <stride_dequeue+0x8de>
ffffffffc0206652:	2420106f          	j	ffffffffc0207894 <stride_dequeue+0x1b1c>
ffffffffc0206656:	85ea                	mv	a1,s10
ffffffffc0206658:	8566                	mv	a0,s9
ffffffffc020665a:	cbcff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020665e:	537d                	li	t1,-1
ffffffffc0206660:	00651463          	bne	a0,t1,ffffffffc0206668 <stride_dequeue+0x8f0>
ffffffffc0206664:	6ef0006f          	j	ffffffffc0207552 <stride_dequeue+0x17da>
ffffffffc0206668:	008d3783          	ld	a5,8(s10)
ffffffffc020666c:	010d3703          	ld	a4,16(s10)
ffffffffc0206670:	ec3e                	sd	a5,24(sp)
ffffffffc0206672:	cf2d                	beqz	a4,ffffffffc02066ec <stride_dequeue+0x974>
ffffffffc0206674:	85ba                	mv	a1,a4
ffffffffc0206676:	8566                	mv	a0,s9
ffffffffc0206678:	f03a                	sd	a4,32(sp)
ffffffffc020667a:	c9cff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020667e:	537d                	li	t1,-1
ffffffffc0206680:	7702                	ld	a4,32(sp)
ffffffffc0206682:	00651463          	bne	a0,t1,ffffffffc020668a <stride_dequeue+0x912>
ffffffffc0206686:	69e0106f          	j	ffffffffc0207d24 <stride_dequeue+0x1fac>
ffffffffc020668a:	671c                	ld	a5,8(a4)
ffffffffc020668c:	01073883          	ld	a7,16(a4) # 40000010 <_binary_obj___user_matrix_out_size+0x3fffd6d8>
ffffffffc0206690:	f03e                	sd	a5,32(sp)
ffffffffc0206692:	04088663          	beqz	a7,ffffffffc02066de <stride_dequeue+0x966>
ffffffffc0206696:	85c6                	mv	a1,a7
ffffffffc0206698:	8566                	mv	a0,s9
ffffffffc020669a:	f83a                	sd	a4,48(sp)
ffffffffc020669c:	f446                	sd	a7,40(sp)
ffffffffc020669e:	c78ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02066a2:	537d                	li	t1,-1
ffffffffc02066a4:	78a2                	ld	a7,40(sp)
ffffffffc02066a6:	7742                	ld	a4,48(sp)
ffffffffc02066a8:	00651463          	bne	a0,t1,ffffffffc02066b0 <stride_dequeue+0x938>
ffffffffc02066ac:	4010106f          	j	ffffffffc02082ac <stride_dequeue+0x2534>
ffffffffc02066b0:	0088b303          	ld	t1,8(a7) # 2008 <_binary_obj___user_forktree_out_size+0x8>
ffffffffc02066b4:	0108b583          	ld	a1,16(a7)
ffffffffc02066b8:	8566                	mv	a0,s9
ffffffffc02066ba:	fc3a                	sd	a4,56(sp)
ffffffffc02066bc:	f846                	sd	a7,48(sp)
ffffffffc02066be:	f41a                	sd	t1,40(sp)
ffffffffc02066c0:	cb8ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02066c4:	78c2                	ld	a7,48(sp)
ffffffffc02066c6:	7322                	ld	t1,40(sp)
ffffffffc02066c8:	7762                	ld	a4,56(sp)
ffffffffc02066ca:	00a8b423          	sd	a0,8(a7)
ffffffffc02066ce:	0068b823          	sd	t1,16(a7)
ffffffffc02066d2:	e119                	bnez	a0,ffffffffc02066d8 <stride_dequeue+0x960>
ffffffffc02066d4:	5510106f          	j	ffffffffc0208424 <stride_dequeue+0x26ac>
ffffffffc02066d8:	01153023          	sd	a7,0(a0)
ffffffffc02066dc:	8cc6                	mv	s9,a7
ffffffffc02066de:	7782                	ld	a5,32(sp)
ffffffffc02066e0:	01973423          	sd	s9,8(a4)
ffffffffc02066e4:	eb1c                	sd	a5,16(a4)
ffffffffc02066e6:	00ecb023          	sd	a4,0(s9)
ffffffffc02066ea:	8cba                	mv	s9,a4
ffffffffc02066ec:	67e2                	ld	a5,24(sp)
ffffffffc02066ee:	019d3423          	sd	s9,8(s10)
ffffffffc02066f2:	00fd3823          	sd	a5,16(s10)
ffffffffc02066f6:	01acb023          	sd	s10,0(s9)
ffffffffc02066fa:	67c2                	ld	a5,16(sp)
ffffffffc02066fc:	01a43423          	sd	s10,8(s0)
ffffffffc0206700:	e81c                	sd	a5,16(s0)
ffffffffc0206702:	008d3023          	sd	s0,0(s10)
ffffffffc0206706:	67a2                	ld	a5,8(sp)
ffffffffc0206708:	008c3423          	sd	s0,8(s8)
ffffffffc020670c:	00fc3823          	sd	a5,16(s8)
ffffffffc0206710:	01843023          	sd	s8,0(s0)
ffffffffc0206714:	8462                	mv	s0,s8
ffffffffc0206716:	b641                	j	ffffffffc0206296 <stride_dequeue+0x51e>
ffffffffc0206718:	008a3783          	ld	a5,8(s4)
ffffffffc020671c:	010a3983          	ld	s3,16(s4)
ffffffffc0206720:	e83e                	sd	a5,16(sp)
ffffffffc0206722:	0a098663          	beqz	s3,ffffffffc02067ce <stride_dequeue+0xa56>
ffffffffc0206726:	85e6                	mv	a1,s9
ffffffffc0206728:	854e                	mv	a0,s3
ffffffffc020672a:	becff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020672e:	58fd                	li	a7,-1
ffffffffc0206730:	21150ce3          	beq	a0,a7,ffffffffc0207148 <stride_dequeue+0x13d0>
ffffffffc0206734:	008cb783          	ld	a5,8(s9)
ffffffffc0206738:	010cb803          	ld	a6,16(s9)
ffffffffc020673c:	ec3e                	sd	a5,24(sp)
ffffffffc020673e:	00081463          	bnez	a6,ffffffffc0206746 <stride_dequeue+0x9ce>
ffffffffc0206742:	3dc0106f          	j	ffffffffc0207b1e <stride_dequeue+0x1da6>
ffffffffc0206746:	85c2                	mv	a1,a6
ffffffffc0206748:	854e                	mv	a0,s3
ffffffffc020674a:	f042                	sd	a6,32(sp)
ffffffffc020674c:	bcaff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206750:	58fd                	li	a7,-1
ffffffffc0206752:	7802                	ld	a6,32(sp)
ffffffffc0206754:	01151463          	bne	a0,a7,ffffffffc020675c <stride_dequeue+0x9e4>
ffffffffc0206758:	7b90006f          	j	ffffffffc0207710 <stride_dequeue+0x1998>
ffffffffc020675c:	00883783          	ld	a5,8(a6)
ffffffffc0206760:	01083303          	ld	t1,16(a6)
ffffffffc0206764:	f03e                	sd	a5,32(sp)
ffffffffc0206766:	04030663          	beqz	t1,ffffffffc02067b2 <stride_dequeue+0xa3a>
ffffffffc020676a:	859a                	mv	a1,t1
ffffffffc020676c:	854e                	mv	a0,s3
ffffffffc020676e:	f842                	sd	a6,48(sp)
ffffffffc0206770:	f41a                	sd	t1,40(sp)
ffffffffc0206772:	ba4ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206776:	58fd                	li	a7,-1
ffffffffc0206778:	7322                	ld	t1,40(sp)
ffffffffc020677a:	7842                	ld	a6,48(sp)
ffffffffc020677c:	01151463          	bne	a0,a7,ffffffffc0206784 <stride_dequeue+0xa0c>
ffffffffc0206780:	5cc0106f          	j	ffffffffc0207d4c <stride_dequeue+0x1fd4>
ffffffffc0206784:	00833883          	ld	a7,8(t1)
ffffffffc0206788:	01033583          	ld	a1,16(t1)
ffffffffc020678c:	854e                	mv	a0,s3
ffffffffc020678e:	fc42                	sd	a6,56(sp)
ffffffffc0206790:	f81a                	sd	t1,48(sp)
ffffffffc0206792:	f446                	sd	a7,40(sp)
ffffffffc0206794:	be4ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206798:	7342                	ld	t1,48(sp)
ffffffffc020679a:	78a2                	ld	a7,40(sp)
ffffffffc020679c:	7862                	ld	a6,56(sp)
ffffffffc020679e:	00a33423          	sd	a0,8(t1)
ffffffffc02067a2:	01133823          	sd	a7,16(t1)
ffffffffc02067a6:	e119                	bnez	a0,ffffffffc02067ac <stride_dequeue+0xa34>
ffffffffc02067a8:	7ee0106f          	j	ffffffffc0207f96 <stride_dequeue+0x221e>
ffffffffc02067ac:	00653023          	sd	t1,0(a0)
ffffffffc02067b0:	899a                	mv	s3,t1
ffffffffc02067b2:	7782                	ld	a5,32(sp)
ffffffffc02067b4:	01383423          	sd	s3,8(a6)
ffffffffc02067b8:	00f83823          	sd	a5,16(a6)
ffffffffc02067bc:	0109b023          	sd	a6,0(s3)
ffffffffc02067c0:	67e2                	ld	a5,24(sp)
ffffffffc02067c2:	010cb423          	sd	a6,8(s9)
ffffffffc02067c6:	00fcb823          	sd	a5,16(s9)
ffffffffc02067ca:	01983023          	sd	s9,0(a6)
ffffffffc02067ce:	67c2                	ld	a5,16(sp)
ffffffffc02067d0:	019a3423          	sd	s9,8(s4)
ffffffffc02067d4:	00fa3823          	sd	a5,16(s4)
ffffffffc02067d8:	014cb023          	sd	s4,0(s9)
ffffffffc02067dc:	867ff06f          	j	ffffffffc0206042 <stride_dequeue+0x2ca>
ffffffffc02067e0:	008a3783          	ld	a5,8(s4)
ffffffffc02067e4:	010a3c83          	ld	s9,16(s4)
ffffffffc02067e8:	e83e                	sd	a5,16(sp)
ffffffffc02067ea:	0a0c8663          	beqz	s9,ffffffffc0206896 <stride_dequeue+0xb1e>
ffffffffc02067ee:	85ea                	mv	a1,s10
ffffffffc02067f0:	8566                	mv	a0,s9
ffffffffc02067f2:	b24ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02067f6:	58fd                	li	a7,-1
ffffffffc02067f8:	0b1509e3          	beq	a0,a7,ffffffffc02070aa <stride_dequeue+0x1332>
ffffffffc02067fc:	008d3783          	ld	a5,8(s10)
ffffffffc0206800:	010d3803          	ld	a6,16(s10)
ffffffffc0206804:	ec3e                	sd	a5,24(sp)
ffffffffc0206806:	00081463          	bnez	a6,ffffffffc020680e <stride_dequeue+0xa96>
ffffffffc020680a:	31a0106f          	j	ffffffffc0207b24 <stride_dequeue+0x1dac>
ffffffffc020680e:	85c2                	mv	a1,a6
ffffffffc0206810:	8566                	mv	a0,s9
ffffffffc0206812:	f042                	sd	a6,32(sp)
ffffffffc0206814:	b02ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206818:	58fd                	li	a7,-1
ffffffffc020681a:	7802                	ld	a6,32(sp)
ffffffffc020681c:	01151463          	bne	a0,a7,ffffffffc0206824 <stride_dequeue+0xaac>
ffffffffc0206820:	7ad0006f          	j	ffffffffc02077cc <stride_dequeue+0x1a54>
ffffffffc0206824:	00883783          	ld	a5,8(a6)
ffffffffc0206828:	01083303          	ld	t1,16(a6)
ffffffffc020682c:	f03e                	sd	a5,32(sp)
ffffffffc020682e:	04030663          	beqz	t1,ffffffffc020687a <stride_dequeue+0xb02>
ffffffffc0206832:	859a                	mv	a1,t1
ffffffffc0206834:	8566                	mv	a0,s9
ffffffffc0206836:	f842                	sd	a6,48(sp)
ffffffffc0206838:	f41a                	sd	t1,40(sp)
ffffffffc020683a:	adcff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020683e:	58fd                	li	a7,-1
ffffffffc0206840:	7322                	ld	t1,40(sp)
ffffffffc0206842:	7842                	ld	a6,48(sp)
ffffffffc0206844:	01151463          	bne	a0,a7,ffffffffc020684c <stride_dequeue+0xad4>
ffffffffc0206848:	4360106f          	j	ffffffffc0207c7e <stride_dequeue+0x1f06>
ffffffffc020684c:	00833883          	ld	a7,8(t1)
ffffffffc0206850:	01033583          	ld	a1,16(t1)
ffffffffc0206854:	8566                	mv	a0,s9
ffffffffc0206856:	fc42                	sd	a6,56(sp)
ffffffffc0206858:	f81a                	sd	t1,48(sp)
ffffffffc020685a:	f446                	sd	a7,40(sp)
ffffffffc020685c:	b1cff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206860:	7342                	ld	t1,48(sp)
ffffffffc0206862:	78a2                	ld	a7,40(sp)
ffffffffc0206864:	7862                	ld	a6,56(sp)
ffffffffc0206866:	00a33423          	sd	a0,8(t1)
ffffffffc020686a:	01133823          	sd	a7,16(t1)
ffffffffc020686e:	e119                	bnez	a0,ffffffffc0206874 <stride_dequeue+0xafc>
ffffffffc0206870:	7ea0106f          	j	ffffffffc020805a <stride_dequeue+0x22e2>
ffffffffc0206874:	00653023          	sd	t1,0(a0)
ffffffffc0206878:	8c9a                	mv	s9,t1
ffffffffc020687a:	7782                	ld	a5,32(sp)
ffffffffc020687c:	01983423          	sd	s9,8(a6)
ffffffffc0206880:	00f83823          	sd	a5,16(a6)
ffffffffc0206884:	010cb023          	sd	a6,0(s9)
ffffffffc0206888:	67e2                	ld	a5,24(sp)
ffffffffc020688a:	010d3423          	sd	a6,8(s10)
ffffffffc020688e:	00fd3823          	sd	a5,16(s10)
ffffffffc0206892:	01a83023          	sd	s10,0(a6)
ffffffffc0206896:	67c2                	ld	a5,16(sp)
ffffffffc0206898:	01aa3423          	sd	s10,8(s4)
ffffffffc020689c:	00fa3823          	sd	a5,16(s4)
ffffffffc02068a0:	014d3023          	sd	s4,0(s10)
ffffffffc02068a4:	8d52                	mv	s10,s4
ffffffffc02068a6:	bba5                	j	ffffffffc020661e <stride_dequeue+0x8a6>
ffffffffc02068a8:	008c3783          	ld	a5,8(s8)
ffffffffc02068ac:	010c3c83          	ld	s9,16(s8)
ffffffffc02068b0:	e83e                	sd	a5,16(sp)
ffffffffc02068b2:	0a0c8463          	beqz	s9,ffffffffc020695a <stride_dequeue+0xbe2>
ffffffffc02068b6:	85ea                	mv	a1,s10
ffffffffc02068b8:	8566                	mv	a0,s9
ffffffffc02068ba:	a5cff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02068be:	58fd                	li	a7,-1
ffffffffc02068c0:	6b150763          	beq	a0,a7,ffffffffc0206f6e <stride_dequeue+0x11f6>
ffffffffc02068c4:	008d3783          	ld	a5,8(s10)
ffffffffc02068c8:	010d3803          	ld	a6,16(s10)
ffffffffc02068cc:	ec3e                	sd	a5,24(sp)
ffffffffc02068ce:	00081463          	bnez	a6,ffffffffc02068d6 <stride_dequeue+0xb5e>
ffffffffc02068d2:	2580106f          	j	ffffffffc0207b2a <stride_dequeue+0x1db2>
ffffffffc02068d6:	85c2                	mv	a1,a6
ffffffffc02068d8:	8566                	mv	a0,s9
ffffffffc02068da:	f042                	sd	a6,32(sp)
ffffffffc02068dc:	a3aff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02068e0:	58fd                	li	a7,-1
ffffffffc02068e2:	7802                	ld	a6,32(sp)
ffffffffc02068e4:	571508e3          	beq	a0,a7,ffffffffc0207654 <stride_dequeue+0x18dc>
ffffffffc02068e8:	00883783          	ld	a5,8(a6)
ffffffffc02068ec:	01083303          	ld	t1,16(a6)
ffffffffc02068f0:	f03e                	sd	a5,32(sp)
ffffffffc02068f2:	04030663          	beqz	t1,ffffffffc020693e <stride_dequeue+0xbc6>
ffffffffc02068f6:	859a                	mv	a1,t1
ffffffffc02068f8:	8566                	mv	a0,s9
ffffffffc02068fa:	f842                	sd	a6,48(sp)
ffffffffc02068fc:	f41a                	sd	t1,40(sp)
ffffffffc02068fe:	a18ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206902:	58fd                	li	a7,-1
ffffffffc0206904:	7322                	ld	t1,40(sp)
ffffffffc0206906:	7842                	ld	a6,48(sp)
ffffffffc0206908:	01151463          	bne	a0,a7,ffffffffc0206910 <stride_dequeue+0xb98>
ffffffffc020690c:	3ee0106f          	j	ffffffffc0207cfa <stride_dequeue+0x1f82>
ffffffffc0206910:	00833883          	ld	a7,8(t1)
ffffffffc0206914:	01033583          	ld	a1,16(t1)
ffffffffc0206918:	8566                	mv	a0,s9
ffffffffc020691a:	fc42                	sd	a6,56(sp)
ffffffffc020691c:	f81a                	sd	t1,48(sp)
ffffffffc020691e:	f446                	sd	a7,40(sp)
ffffffffc0206920:	a58ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206924:	7342                	ld	t1,48(sp)
ffffffffc0206926:	78a2                	ld	a7,40(sp)
ffffffffc0206928:	7862                	ld	a6,56(sp)
ffffffffc020692a:	00a33423          	sd	a0,8(t1)
ffffffffc020692e:	01133823          	sd	a7,16(t1)
ffffffffc0206932:	e119                	bnez	a0,ffffffffc0206938 <stride_dequeue+0xbc0>
ffffffffc0206934:	6ee0106f          	j	ffffffffc0208022 <stride_dequeue+0x22aa>
ffffffffc0206938:	00653023          	sd	t1,0(a0)
ffffffffc020693c:	8c9a                	mv	s9,t1
ffffffffc020693e:	7782                	ld	a5,32(sp)
ffffffffc0206940:	01983423          	sd	s9,8(a6)
ffffffffc0206944:	00f83823          	sd	a5,16(a6)
ffffffffc0206948:	010cb023          	sd	a6,0(s9)
ffffffffc020694c:	67e2                	ld	a5,24(sp)
ffffffffc020694e:	010d3423          	sd	a6,8(s10)
ffffffffc0206952:	00fd3823          	sd	a5,16(s10)
ffffffffc0206956:	01a83023          	sd	s10,0(a6)
ffffffffc020695a:	67c2                	ld	a5,16(sp)
ffffffffc020695c:	01ac3423          	sd	s10,8(s8)
ffffffffc0206960:	00fc3823          	sd	a5,16(s8)
ffffffffc0206964:	018d3023          	sd	s8,0(s10)
ffffffffc0206968:	80bff06f          	j	ffffffffc0206172 <stride_dequeue+0x3fa>
ffffffffc020696c:	649c                	ld	a5,8(s1)
ffffffffc020696e:	0104b883          	ld	a7,16(s1)
ffffffffc0206972:	f02a                	sd	a0,32(sp)
ffffffffc0206974:	ec3e                	sd	a5,24(sp)
ffffffffc0206976:	06088963          	beqz	a7,ffffffffc02069e8 <stride_dequeue+0xc70>
ffffffffc020697a:	8546                	mv	a0,a7
ffffffffc020697c:	85d2                	mv	a1,s4
ffffffffc020697e:	f446                	sd	a7,40(sp)
ffffffffc0206980:	996ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206984:	7802                	ld	a6,32(sp)
ffffffffc0206986:	78a2                	ld	a7,40(sp)
ffffffffc0206988:	190505e3          	beq	a0,a6,ffffffffc0207312 <stride_dequeue+0x159a>
ffffffffc020698c:	008a3783          	ld	a5,8(s4)
ffffffffc0206990:	010a3303          	ld	t1,16(s4)
ffffffffc0206994:	f442                	sd	a6,40(sp)
ffffffffc0206996:	f03e                	sd	a5,32(sp)
ffffffffc0206998:	4a030be3          	beqz	t1,ffffffffc020764e <stride_dequeue+0x18d6>
ffffffffc020699c:	859a                	mv	a1,t1
ffffffffc020699e:	8546                	mv	a0,a7
ffffffffc02069a0:	fc1a                	sd	t1,56(sp)
ffffffffc02069a2:	f846                	sd	a7,48(sp)
ffffffffc02069a4:	972ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02069a8:	7822                	ld	a6,40(sp)
ffffffffc02069aa:	78c2                	ld	a7,48(sp)
ffffffffc02069ac:	7362                	ld	t1,56(sp)
ffffffffc02069ae:	01051463          	bne	a0,a6,ffffffffc02069b6 <stride_dequeue+0xc3e>
ffffffffc02069b2:	10c0106f          	j	ffffffffc0207abe <stride_dequeue+0x1d46>
ffffffffc02069b6:	00833803          	ld	a6,8(t1)
ffffffffc02069ba:	01033583          	ld	a1,16(t1)
ffffffffc02069be:	8546                	mv	a0,a7
ffffffffc02069c0:	f81a                	sd	t1,48(sp)
ffffffffc02069c2:	f442                	sd	a6,40(sp)
ffffffffc02069c4:	9b4ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02069c8:	7342                	ld	t1,48(sp)
ffffffffc02069ca:	7822                	ld	a6,40(sp)
ffffffffc02069cc:	00a33423          	sd	a0,8(t1)
ffffffffc02069d0:	01033823          	sd	a6,16(t1)
ffffffffc02069d4:	c119                	beqz	a0,ffffffffc02069da <stride_dequeue+0xc62>
ffffffffc02069d6:	00653023          	sd	t1,0(a0)
ffffffffc02069da:	7782                	ld	a5,32(sp)
ffffffffc02069dc:	006a3423          	sd	t1,8(s4)
ffffffffc02069e0:	00fa3823          	sd	a5,16(s4)
ffffffffc02069e4:	01433023          	sd	s4,0(t1)
ffffffffc02069e8:	67e2                	ld	a5,24(sp)
ffffffffc02069ea:	0144b423          	sd	s4,8(s1)
ffffffffc02069ee:	e89c                	sd	a5,16(s1)
ffffffffc02069f0:	009a3023          	sd	s1,0(s4)
ffffffffc02069f4:	cc8ff06f          	j	ffffffffc0205ebc <stride_dequeue+0x144>
ffffffffc02069f8:	0089b783          	ld	a5,8(s3)
ffffffffc02069fc:	0109bc83          	ld	s9,16(s3)
ffffffffc0206a00:	e83e                	sd	a5,16(sp)
ffffffffc0206a02:	0a0c8563          	beqz	s9,ffffffffc0206aac <stride_dequeue+0xd34>
ffffffffc0206a06:	85ea                	mv	a1,s10
ffffffffc0206a08:	8566                	mv	a0,s9
ffffffffc0206a0a:	90cff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206a0e:	537d                	li	t1,-1
ffffffffc0206a10:	2e6507e3          	beq	a0,t1,ffffffffc02074fe <stride_dequeue+0x1786>
ffffffffc0206a14:	008d3783          	ld	a5,8(s10)
ffffffffc0206a18:	010d3803          	ld	a6,16(s10)
ffffffffc0206a1c:	ec3e                	sd	a5,24(sp)
ffffffffc0206a1e:	08080063          	beqz	a6,ffffffffc0206a9e <stride_dequeue+0xd26>
ffffffffc0206a22:	85c2                	mv	a1,a6
ffffffffc0206a24:	8566                	mv	a0,s9
ffffffffc0206a26:	f042                	sd	a6,32(sp)
ffffffffc0206a28:	8eeff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206a2c:	537d                	li	t1,-1
ffffffffc0206a2e:	7802                	ld	a6,32(sp)
ffffffffc0206a30:	00651463          	bne	a0,t1,ffffffffc0206a38 <stride_dequeue+0xcc0>
ffffffffc0206a34:	29e0106f          	j	ffffffffc0207cd2 <stride_dequeue+0x1f5a>
ffffffffc0206a38:	00883783          	ld	a5,8(a6)
ffffffffc0206a3c:	01083883          	ld	a7,16(a6)
ffffffffc0206a40:	f03e                	sd	a5,32(sp)
ffffffffc0206a42:	04088663          	beqz	a7,ffffffffc0206a8e <stride_dequeue+0xd16>
ffffffffc0206a46:	85c6                	mv	a1,a7
ffffffffc0206a48:	8566                	mv	a0,s9
ffffffffc0206a4a:	f842                	sd	a6,48(sp)
ffffffffc0206a4c:	f446                	sd	a7,40(sp)
ffffffffc0206a4e:	8c8ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206a52:	537d                	li	t1,-1
ffffffffc0206a54:	78a2                	ld	a7,40(sp)
ffffffffc0206a56:	7842                	ld	a6,48(sp)
ffffffffc0206a58:	00651463          	bne	a0,t1,ffffffffc0206a60 <stride_dequeue+0xce8>
ffffffffc0206a5c:	0270106f          	j	ffffffffc0208282 <stride_dequeue+0x250a>
ffffffffc0206a60:	0088b303          	ld	t1,8(a7)
ffffffffc0206a64:	0108b583          	ld	a1,16(a7)
ffffffffc0206a68:	8566                	mv	a0,s9
ffffffffc0206a6a:	fc42                	sd	a6,56(sp)
ffffffffc0206a6c:	f846                	sd	a7,48(sp)
ffffffffc0206a6e:	f41a                	sd	t1,40(sp)
ffffffffc0206a70:	908ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206a74:	78c2                	ld	a7,48(sp)
ffffffffc0206a76:	7322                	ld	t1,40(sp)
ffffffffc0206a78:	7862                	ld	a6,56(sp)
ffffffffc0206a7a:	00a8b423          	sd	a0,8(a7)
ffffffffc0206a7e:	0068b823          	sd	t1,16(a7)
ffffffffc0206a82:	e119                	bnez	a0,ffffffffc0206a88 <stride_dequeue+0xd10>
ffffffffc0206a84:	20d0106f          	j	ffffffffc0208490 <stride_dequeue+0x2718>
ffffffffc0206a88:	01153023          	sd	a7,0(a0)
ffffffffc0206a8c:	8cc6                	mv	s9,a7
ffffffffc0206a8e:	7782                	ld	a5,32(sp)
ffffffffc0206a90:	01983423          	sd	s9,8(a6)
ffffffffc0206a94:	00f83823          	sd	a5,16(a6)
ffffffffc0206a98:	010cb023          	sd	a6,0(s9)
ffffffffc0206a9c:	8cc2                	mv	s9,a6
ffffffffc0206a9e:	67e2                	ld	a5,24(sp)
ffffffffc0206aa0:	019d3423          	sd	s9,8(s10)
ffffffffc0206aa4:	00fd3823          	sd	a5,16(s10)
ffffffffc0206aa8:	01acb023          	sd	s10,0(s9)
ffffffffc0206aac:	67c2                	ld	a5,16(sp)
ffffffffc0206aae:	01a9b423          	sd	s10,8(s3)
ffffffffc0206ab2:	00f9b823          	sd	a5,16(s3)
ffffffffc0206ab6:	013d3023          	sd	s3,0(s10)
ffffffffc0206aba:	8d4e                	mv	s10,s3
ffffffffc0206abc:	b0f9                	j	ffffffffc020638a <stride_dequeue+0x612>
ffffffffc0206abe:	008cb783          	ld	a5,8(s9)
ffffffffc0206ac2:	010cbd03          	ld	s10,16(s9)
ffffffffc0206ac6:	e83e                	sd	a5,16(sp)
ffffffffc0206ac8:	0a0d0563          	beqz	s10,ffffffffc0206b72 <stride_dequeue+0xdfa>
ffffffffc0206acc:	85ce                	mv	a1,s3
ffffffffc0206ace:	856a                	mv	a0,s10
ffffffffc0206ad0:	846ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206ad4:	537d                	li	t1,-1
ffffffffc0206ad6:	2c6508e3          	beq	a0,t1,ffffffffc02075a6 <stride_dequeue+0x182e>
ffffffffc0206ada:	0089b783          	ld	a5,8(s3)
ffffffffc0206ade:	0109b803          	ld	a6,16(s3)
ffffffffc0206ae2:	ec3e                	sd	a5,24(sp)
ffffffffc0206ae4:	08080063          	beqz	a6,ffffffffc0206b64 <stride_dequeue+0xdec>
ffffffffc0206ae8:	85c2                	mv	a1,a6
ffffffffc0206aea:	856a                	mv	a0,s10
ffffffffc0206aec:	f042                	sd	a6,32(sp)
ffffffffc0206aee:	828ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206af2:	537d                	li	t1,-1
ffffffffc0206af4:	7802                	ld	a6,32(sp)
ffffffffc0206af6:	00651463          	bne	a0,t1,ffffffffc0206afe <stride_dequeue+0xd86>
ffffffffc0206afa:	39c0106f          	j	ffffffffc0207e96 <stride_dequeue+0x211e>
ffffffffc0206afe:	00883783          	ld	a5,8(a6)
ffffffffc0206b02:	01083883          	ld	a7,16(a6)
ffffffffc0206b06:	f03e                	sd	a5,32(sp)
ffffffffc0206b08:	04088663          	beqz	a7,ffffffffc0206b54 <stride_dequeue+0xddc>
ffffffffc0206b0c:	85c6                	mv	a1,a7
ffffffffc0206b0e:	856a                	mv	a0,s10
ffffffffc0206b10:	f842                	sd	a6,48(sp)
ffffffffc0206b12:	f446                	sd	a7,40(sp)
ffffffffc0206b14:	802ff0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206b18:	537d                	li	t1,-1
ffffffffc0206b1a:	78a2                	ld	a7,40(sp)
ffffffffc0206b1c:	7842                	ld	a6,48(sp)
ffffffffc0206b1e:	00651463          	bne	a0,t1,ffffffffc0206b26 <stride_dequeue+0xdae>
ffffffffc0206b22:	6d60106f          	j	ffffffffc02081f8 <stride_dequeue+0x2480>
ffffffffc0206b26:	0088b303          	ld	t1,8(a7)
ffffffffc0206b2a:	0108b583          	ld	a1,16(a7)
ffffffffc0206b2e:	856a                	mv	a0,s10
ffffffffc0206b30:	fc42                	sd	a6,56(sp)
ffffffffc0206b32:	f846                	sd	a7,48(sp)
ffffffffc0206b34:	f41a                	sd	t1,40(sp)
ffffffffc0206b36:	842ff0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206b3a:	78c2                	ld	a7,48(sp)
ffffffffc0206b3c:	7322                	ld	t1,40(sp)
ffffffffc0206b3e:	7862                	ld	a6,56(sp)
ffffffffc0206b40:	00a8b423          	sd	a0,8(a7)
ffffffffc0206b44:	0068b823          	sd	t1,16(a7)
ffffffffc0206b48:	e119                	bnez	a0,ffffffffc0206b4e <stride_dequeue+0xdd6>
ffffffffc0206b4a:	1170106f          	j	ffffffffc0208460 <stride_dequeue+0x26e8>
ffffffffc0206b4e:	01153023          	sd	a7,0(a0)
ffffffffc0206b52:	8d46                	mv	s10,a7
ffffffffc0206b54:	7782                	ld	a5,32(sp)
ffffffffc0206b56:	01a83423          	sd	s10,8(a6)
ffffffffc0206b5a:	00f83823          	sd	a5,16(a6)
ffffffffc0206b5e:	010d3023          	sd	a6,0(s10)
ffffffffc0206b62:	8d42                	mv	s10,a6
ffffffffc0206b64:	67e2                	ld	a5,24(sp)
ffffffffc0206b66:	01a9b423          	sd	s10,8(s3)
ffffffffc0206b6a:	00f9b823          	sd	a5,16(s3)
ffffffffc0206b6e:	013d3023          	sd	s3,0(s10)
ffffffffc0206b72:	67c2                	ld	a5,16(sp)
ffffffffc0206b74:	013cb423          	sd	s3,8(s9)
ffffffffc0206b78:	00fcb823          	sd	a5,16(s9)
ffffffffc0206b7c:	0199b023          	sd	s9,0(s3)
ffffffffc0206b80:	89e6                	mv	s3,s9
ffffffffc0206b82:	b8dd                	j	ffffffffc0206478 <stride_dequeue+0x700>
ffffffffc0206b84:	008c3783          	ld	a5,8(s8)
ffffffffc0206b88:	010c3c83          	ld	s9,16(s8)
ffffffffc0206b8c:	e83e                	sd	a5,16(sp)
ffffffffc0206b8e:	0a0c8563          	beqz	s9,ffffffffc0206c38 <stride_dequeue+0xec0>
ffffffffc0206b92:	85ea                	mv	a1,s10
ffffffffc0206b94:	8566                	mv	a0,s9
ffffffffc0206b96:	f81fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206b9a:	537d                	li	t1,-1
ffffffffc0206b9c:	24650fe3          	beq	a0,t1,ffffffffc02075fa <stride_dequeue+0x1882>
ffffffffc0206ba0:	008d3783          	ld	a5,8(s10)
ffffffffc0206ba4:	010d3803          	ld	a6,16(s10)
ffffffffc0206ba8:	ec3e                	sd	a5,24(sp)
ffffffffc0206baa:	08080063          	beqz	a6,ffffffffc0206c2a <stride_dequeue+0xeb2>
ffffffffc0206bae:	85c2                	mv	a1,a6
ffffffffc0206bb0:	8566                	mv	a0,s9
ffffffffc0206bb2:	f042                	sd	a6,32(sp)
ffffffffc0206bb4:	f63fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206bb8:	537d                	li	t1,-1
ffffffffc0206bba:	7802                	ld	a6,32(sp)
ffffffffc0206bbc:	00651463          	bne	a0,t1,ffffffffc0206bc4 <stride_dequeue+0xe4c>
ffffffffc0206bc0:	2340106f          	j	ffffffffc0207df4 <stride_dequeue+0x207c>
ffffffffc0206bc4:	00883783          	ld	a5,8(a6)
ffffffffc0206bc8:	01083883          	ld	a7,16(a6)
ffffffffc0206bcc:	f03e                	sd	a5,32(sp)
ffffffffc0206bce:	04088663          	beqz	a7,ffffffffc0206c1a <stride_dequeue+0xea2>
ffffffffc0206bd2:	85c6                	mv	a1,a7
ffffffffc0206bd4:	8566                	mv	a0,s9
ffffffffc0206bd6:	f842                	sd	a6,48(sp)
ffffffffc0206bd8:	f446                	sd	a7,40(sp)
ffffffffc0206bda:	f3dfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206bde:	537d                	li	t1,-1
ffffffffc0206be0:	78a2                	ld	a7,40(sp)
ffffffffc0206be2:	7842                	ld	a6,48(sp)
ffffffffc0206be4:	00651463          	bne	a0,t1,ffffffffc0206bec <stride_dequeue+0xe74>
ffffffffc0206be8:	5020106f          	j	ffffffffc02080ea <stride_dequeue+0x2372>
ffffffffc0206bec:	0088b303          	ld	t1,8(a7)
ffffffffc0206bf0:	0108b583          	ld	a1,16(a7)
ffffffffc0206bf4:	8566                	mv	a0,s9
ffffffffc0206bf6:	fc42                	sd	a6,56(sp)
ffffffffc0206bf8:	f846                	sd	a7,48(sp)
ffffffffc0206bfa:	f41a                	sd	t1,40(sp)
ffffffffc0206bfc:	f7dfe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206c00:	78c2                	ld	a7,48(sp)
ffffffffc0206c02:	7322                	ld	t1,40(sp)
ffffffffc0206c04:	7862                	ld	a6,56(sp)
ffffffffc0206c06:	00a8b423          	sd	a0,8(a7)
ffffffffc0206c0a:	0068b823          	sd	t1,16(a7)
ffffffffc0206c0e:	e119                	bnez	a0,ffffffffc0206c14 <stride_dequeue+0xe9c>
ffffffffc0206c10:	02d0106f          	j	ffffffffc020843c <stride_dequeue+0x26c4>
ffffffffc0206c14:	01153023          	sd	a7,0(a0)
ffffffffc0206c18:	8cc6                	mv	s9,a7
ffffffffc0206c1a:	7782                	ld	a5,32(sp)
ffffffffc0206c1c:	01983423          	sd	s9,8(a6)
ffffffffc0206c20:	00f83823          	sd	a5,16(a6)
ffffffffc0206c24:	010cb023          	sd	a6,0(s9)
ffffffffc0206c28:	8cc2                	mv	s9,a6
ffffffffc0206c2a:	67e2                	ld	a5,24(sp)
ffffffffc0206c2c:	019d3423          	sd	s9,8(s10)
ffffffffc0206c30:	00fd3823          	sd	a5,16(s10)
ffffffffc0206c34:	01acb023          	sd	s10,0(s9)
ffffffffc0206c38:	67c2                	ld	a5,16(sp)
ffffffffc0206c3a:	01ac3423          	sd	s10,8(s8)
ffffffffc0206c3e:	00fc3823          	sd	a5,16(s8)
ffffffffc0206c42:	018d3023          	sd	s8,0(s10)
ffffffffc0206c46:	e44ff06f          	j	ffffffffc020628a <stride_dequeue+0x512>
ffffffffc0206c4a:	008a3783          	ld	a5,8(s4)
ffffffffc0206c4e:	010a3883          	ld	a7,16(s4)
ffffffffc0206c52:	f02a                	sd	a0,32(sp)
ffffffffc0206c54:	ec3e                	sd	a5,24(sp)
ffffffffc0206c56:	06088c63          	beqz	a7,ffffffffc0206cce <stride_dequeue+0xf56>
ffffffffc0206c5a:	8546                	mv	a0,a7
ffffffffc0206c5c:	85ce                	mv	a1,s3
ffffffffc0206c5e:	f446                	sd	a7,40(sp)
ffffffffc0206c60:	eb7fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206c64:	7802                	ld	a6,32(sp)
ffffffffc0206c66:	78a2                	ld	a7,40(sp)
ffffffffc0206c68:	4f0504e3          	beq	a0,a6,ffffffffc0207950 <stride_dequeue+0x1bd8>
ffffffffc0206c6c:	0089b783          	ld	a5,8(s3)
ffffffffc0206c70:	0109b303          	ld	t1,16(s3)
ffffffffc0206c74:	f442                	sd	a6,40(sp)
ffffffffc0206c76:	f03e                	sd	a5,32(sp)
ffffffffc0206c78:	04030463          	beqz	t1,ffffffffc0206cc0 <stride_dequeue+0xf48>
ffffffffc0206c7c:	859a                	mv	a1,t1
ffffffffc0206c7e:	8546                	mv	a0,a7
ffffffffc0206c80:	fc1a                	sd	t1,56(sp)
ffffffffc0206c82:	f846                	sd	a7,48(sp)
ffffffffc0206c84:	e93fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206c88:	7822                	ld	a6,40(sp)
ffffffffc0206c8a:	78c2                	ld	a7,48(sp)
ffffffffc0206c8c:	7362                	ld	t1,56(sp)
ffffffffc0206c8e:	01051463          	bne	a0,a6,ffffffffc0206c96 <stride_dequeue+0xf1e>
ffffffffc0206c92:	22c0106f          	j	ffffffffc0207ebe <stride_dequeue+0x2146>
ffffffffc0206c96:	00833803          	ld	a6,8(t1)
ffffffffc0206c9a:	01033583          	ld	a1,16(t1)
ffffffffc0206c9e:	8546                	mv	a0,a7
ffffffffc0206ca0:	f81a                	sd	t1,48(sp)
ffffffffc0206ca2:	f442                	sd	a6,40(sp)
ffffffffc0206ca4:	ed5fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206ca8:	7342                	ld	t1,48(sp)
ffffffffc0206caa:	7822                	ld	a6,40(sp)
ffffffffc0206cac:	00a33423          	sd	a0,8(t1)
ffffffffc0206cb0:	01033823          	sd	a6,16(t1)
ffffffffc0206cb4:	e119                	bnez	a0,ffffffffc0206cba <stride_dequeue+0xf42>
ffffffffc0206cb6:	2d40106f          	j	ffffffffc0207f8a <stride_dequeue+0x2212>
ffffffffc0206cba:	00653023          	sd	t1,0(a0)
ffffffffc0206cbe:	889a                	mv	a7,t1
ffffffffc0206cc0:	7782                	ld	a5,32(sp)
ffffffffc0206cc2:	0119b423          	sd	a7,8(s3)
ffffffffc0206cc6:	00f9b823          	sd	a5,16(s3)
ffffffffc0206cca:	0138b023          	sd	s3,0(a7)
ffffffffc0206cce:	67e2                	ld	a5,24(sp)
ffffffffc0206cd0:	013a3423          	sd	s3,8(s4)
ffffffffc0206cd4:	00fa3823          	sd	a5,16(s4)
ffffffffc0206cd8:	0149b023          	sd	s4,0(s3)
ffffffffc0206cdc:	b56ff06f          	j	ffffffffc0206032 <stride_dequeue+0x2ba>
ffffffffc0206ce0:	008c3783          	ld	a5,8(s8)
ffffffffc0206ce4:	010c3883          	ld	a7,16(s8)
ffffffffc0206ce8:	f02a                	sd	a0,32(sp)
ffffffffc0206cea:	ec3e                	sd	a5,24(sp)
ffffffffc0206cec:	06088c63          	beqz	a7,ffffffffc0206d64 <stride_dequeue+0xfec>
ffffffffc0206cf0:	8546                	mv	a0,a7
ffffffffc0206cf2:	85e6                	mv	a1,s9
ffffffffc0206cf4:	f446                	sd	a7,40(sp)
ffffffffc0206cf6:	e21fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206cfa:	7802                	ld	a6,32(sp)
ffffffffc0206cfc:	78a2                	ld	a7,40(sp)
ffffffffc0206cfe:	4b050ee3          	beq	a0,a6,ffffffffc02079ba <stride_dequeue+0x1c42>
ffffffffc0206d02:	008cb783          	ld	a5,8(s9)
ffffffffc0206d06:	010cb303          	ld	t1,16(s9)
ffffffffc0206d0a:	f442                	sd	a6,40(sp)
ffffffffc0206d0c:	f03e                	sd	a5,32(sp)
ffffffffc0206d0e:	04030463          	beqz	t1,ffffffffc0206d56 <stride_dequeue+0xfde>
ffffffffc0206d12:	859a                	mv	a1,t1
ffffffffc0206d14:	8546                	mv	a0,a7
ffffffffc0206d16:	fc1a                	sd	t1,56(sp)
ffffffffc0206d18:	f846                	sd	a7,48(sp)
ffffffffc0206d1a:	dfdfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206d1e:	7822                	ld	a6,40(sp)
ffffffffc0206d20:	78c2                	ld	a7,48(sp)
ffffffffc0206d22:	7362                	ld	t1,56(sp)
ffffffffc0206d24:	01051463          	bne	a0,a6,ffffffffc0206d2c <stride_dequeue+0xfb4>
ffffffffc0206d28:	1c00106f          	j	ffffffffc0207ee8 <stride_dequeue+0x2170>
ffffffffc0206d2c:	00833803          	ld	a6,8(t1)
ffffffffc0206d30:	01033583          	ld	a1,16(t1)
ffffffffc0206d34:	8546                	mv	a0,a7
ffffffffc0206d36:	f81a                	sd	t1,48(sp)
ffffffffc0206d38:	f442                	sd	a6,40(sp)
ffffffffc0206d3a:	e3ffe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206d3e:	7342                	ld	t1,48(sp)
ffffffffc0206d40:	7822                	ld	a6,40(sp)
ffffffffc0206d42:	00a33423          	sd	a0,8(t1)
ffffffffc0206d46:	01033823          	sd	a6,16(t1)
ffffffffc0206d4a:	e119                	bnez	a0,ffffffffc0206d50 <stride_dequeue+0xfd8>
ffffffffc0206d4c:	2440106f          	j	ffffffffc0207f90 <stride_dequeue+0x2218>
ffffffffc0206d50:	00653023          	sd	t1,0(a0)
ffffffffc0206d54:	889a                	mv	a7,t1
ffffffffc0206d56:	7782                	ld	a5,32(sp)
ffffffffc0206d58:	011cb423          	sd	a7,8(s9)
ffffffffc0206d5c:	00fcb823          	sd	a5,16(s9)
ffffffffc0206d60:	0198b023          	sd	s9,0(a7)
ffffffffc0206d64:	67e2                	ld	a5,24(sp)
ffffffffc0206d66:	019c3423          	sd	s9,8(s8)
ffffffffc0206d6a:	00fc3823          	sd	a5,16(s8)
ffffffffc0206d6e:	018cb023          	sd	s8,0(s9)
ffffffffc0206d72:	bf0ff06f          	j	ffffffffc0206162 <stride_dequeue+0x3ea>
ffffffffc0206d76:	008a3783          	ld	a5,8(s4)
ffffffffc0206d7a:	010a3883          	ld	a7,16(s4)
ffffffffc0206d7e:	f02a                	sd	a0,32(sp)
ffffffffc0206d80:	ec3e                	sd	a5,24(sp)
ffffffffc0206d82:	06088a63          	beqz	a7,ffffffffc0206df6 <stride_dequeue+0x107e>
ffffffffc0206d86:	8546                	mv	a0,a7
ffffffffc0206d88:	85e6                	mv	a1,s9
ffffffffc0206d8a:	f446                	sd	a7,40(sp)
ffffffffc0206d8c:	d8bfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206d90:	7802                	ld	a6,32(sp)
ffffffffc0206d92:	78a2                	ld	a7,40(sp)
ffffffffc0206d94:	1d050de3          	beq	a0,a6,ffffffffc020776e <stride_dequeue+0x19f6>
ffffffffc0206d98:	008cb783          	ld	a5,8(s9)
ffffffffc0206d9c:	010cb303          	ld	t1,16(s9)
ffffffffc0206da0:	f442                	sd	a6,40(sp)
ffffffffc0206da2:	f03e                	sd	a5,32(sp)
ffffffffc0206da4:	04030263          	beqz	t1,ffffffffc0206de8 <stride_dequeue+0x1070>
ffffffffc0206da8:	859a                	mv	a1,t1
ffffffffc0206daa:	8546                	mv	a0,a7
ffffffffc0206dac:	fc1a                	sd	t1,56(sp)
ffffffffc0206dae:	f846                	sd	a7,48(sp)
ffffffffc0206db0:	d67fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206db4:	7822                	ld	a6,40(sp)
ffffffffc0206db6:	78c2                	ld	a7,48(sp)
ffffffffc0206db8:	7362                	ld	t1,56(sp)
ffffffffc0206dba:	5b0501e3          	beq	a0,a6,ffffffffc0207b5c <stride_dequeue+0x1de4>
ffffffffc0206dbe:	00833803          	ld	a6,8(t1)
ffffffffc0206dc2:	01033583          	ld	a1,16(t1)
ffffffffc0206dc6:	8546                	mv	a0,a7
ffffffffc0206dc8:	f81a                	sd	t1,48(sp)
ffffffffc0206dca:	f442                	sd	a6,40(sp)
ffffffffc0206dcc:	dadfe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206dd0:	7342                	ld	t1,48(sp)
ffffffffc0206dd2:	7822                	ld	a6,40(sp)
ffffffffc0206dd4:	00a33423          	sd	a0,8(t1)
ffffffffc0206dd8:	01033823          	sd	a6,16(t1)
ffffffffc0206ddc:	e119                	bnez	a0,ffffffffc0206de2 <stride_dequeue+0x106a>
ffffffffc0206dde:	2760106f          	j	ffffffffc0208054 <stride_dequeue+0x22dc>
ffffffffc0206de2:	00653023          	sd	t1,0(a0)
ffffffffc0206de6:	889a                	mv	a7,t1
ffffffffc0206de8:	7782                	ld	a5,32(sp)
ffffffffc0206dea:	011cb423          	sd	a7,8(s9)
ffffffffc0206dee:	00fcb823          	sd	a5,16(s9)
ffffffffc0206df2:	0198b023          	sd	s9,0(a7)
ffffffffc0206df6:	67e2                	ld	a5,24(sp)
ffffffffc0206df8:	019a3423          	sd	s9,8(s4)
ffffffffc0206dfc:	00fa3823          	sd	a5,16(s4)
ffffffffc0206e00:	014cb023          	sd	s4,0(s9)
ffffffffc0206e04:	80dff06f          	j	ffffffffc0206610 <stride_dequeue+0x898>
ffffffffc0206e08:	008a3783          	ld	a5,8(s4)
ffffffffc0206e0c:	010a3883          	ld	a7,16(s4)
ffffffffc0206e10:	f02a                	sd	a0,32(sp)
ffffffffc0206e12:	ec3e                	sd	a5,24(sp)
ffffffffc0206e14:	06088c63          	beqz	a7,ffffffffc0206e8c <stride_dequeue+0x1114>
ffffffffc0206e18:	8546                	mv	a0,a7
ffffffffc0206e1a:	85e6                	mv	a1,s9
ffffffffc0206e1c:	f446                	sd	a7,40(sp)
ffffffffc0206e1e:	cf9fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206e22:	7802                	ld	a6,32(sp)
ffffffffc0206e24:	78a2                	ld	a7,40(sp)
ffffffffc0206e26:	090506e3          	beq	a0,a6,ffffffffc02076b2 <stride_dequeue+0x193a>
ffffffffc0206e2a:	008cb783          	ld	a5,8(s9)
ffffffffc0206e2e:	010cb303          	ld	t1,16(s9)
ffffffffc0206e32:	f442                	sd	a6,40(sp)
ffffffffc0206e34:	f03e                	sd	a5,32(sp)
ffffffffc0206e36:	04030463          	beqz	t1,ffffffffc0206e7e <stride_dequeue+0x1106>
ffffffffc0206e3a:	859a                	mv	a1,t1
ffffffffc0206e3c:	8546                	mv	a0,a7
ffffffffc0206e3e:	fc1a                	sd	t1,56(sp)
ffffffffc0206e40:	f846                	sd	a7,48(sp)
ffffffffc0206e42:	cd5fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206e46:	7822                	ld	a6,40(sp)
ffffffffc0206e48:	78c2                	ld	a7,48(sp)
ffffffffc0206e4a:	7362                	ld	t1,56(sp)
ffffffffc0206e4c:	01051463          	bne	a0,a6,ffffffffc0206e54 <stride_dequeue+0x10dc>
ffffffffc0206e50:	0ec0106f          	j	ffffffffc0207f3c <stride_dequeue+0x21c4>
ffffffffc0206e54:	00833803          	ld	a6,8(t1)
ffffffffc0206e58:	01033583          	ld	a1,16(t1)
ffffffffc0206e5c:	8546                	mv	a0,a7
ffffffffc0206e5e:	f81a                	sd	t1,48(sp)
ffffffffc0206e60:	f442                	sd	a6,40(sp)
ffffffffc0206e62:	d17fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206e66:	7342                	ld	t1,48(sp)
ffffffffc0206e68:	7822                	ld	a6,40(sp)
ffffffffc0206e6a:	00a33423          	sd	a0,8(t1)
ffffffffc0206e6e:	01033823          	sd	a6,16(t1)
ffffffffc0206e72:	e119                	bnez	a0,ffffffffc0206e78 <stride_dequeue+0x1100>
ffffffffc0206e74:	12e0106f          	j	ffffffffc0207fa2 <stride_dequeue+0x222a>
ffffffffc0206e78:	00653023          	sd	t1,0(a0)
ffffffffc0206e7c:	889a                	mv	a7,t1
ffffffffc0206e7e:	7782                	ld	a5,32(sp)
ffffffffc0206e80:	011cb423          	sd	a7,8(s9)
ffffffffc0206e84:	00fcb823          	sd	a5,16(s9)
ffffffffc0206e88:	0198b023          	sd	s9,0(a7)
ffffffffc0206e8c:	67e2                	ld	a5,24(sp)
ffffffffc0206e8e:	019a3423          	sd	s9,8(s4)
ffffffffc0206e92:	00fa3823          	sd	a5,16(s4)
ffffffffc0206e96:	014cb023          	sd	s4,0(s9)
ffffffffc0206e9a:	8cd2                	mv	s9,s4
ffffffffc0206e9c:	e9aff06f          	j	ffffffffc0206536 <stride_dequeue+0x7be>
ffffffffc0206ea0:	6498                	ld	a4,8(s1)
ffffffffc0206ea2:	0104b883          	ld	a7,16(s1)
ffffffffc0206ea6:	f42a                	sd	a0,40(sp)
ffffffffc0206ea8:	f03a                	sd	a4,32(sp)
ffffffffc0206eaa:	02088c63          	beqz	a7,ffffffffc0206ee2 <stride_dequeue+0x116a>
ffffffffc0206eae:	85be                	mv	a1,a5
ffffffffc0206eb0:	8546                	mv	a0,a7
ffffffffc0206eb2:	fc3e                	sd	a5,56(sp)
ffffffffc0206eb4:	f846                	sd	a7,48(sp)
ffffffffc0206eb6:	c61fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206eba:	7322                	ld	t1,40(sp)
ffffffffc0206ebc:	78c2                	ld	a7,48(sp)
ffffffffc0206ebe:	77e2                	ld	a5,56(sp)
ffffffffc0206ec0:	3c650ae3          	beq	a0,t1,ffffffffc0207a94 <stride_dequeue+0x1d1c>
ffffffffc0206ec4:	0087b303          	ld	t1,8(a5)
ffffffffc0206ec8:	6b8c                	ld	a1,16(a5)
ffffffffc0206eca:	8546                	mv	a0,a7
ffffffffc0206ecc:	f83e                	sd	a5,48(sp)
ffffffffc0206ece:	f41a                	sd	t1,40(sp)
ffffffffc0206ed0:	ca9fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206ed4:	77c2                	ld	a5,48(sp)
ffffffffc0206ed6:	7322                	ld	t1,40(sp)
ffffffffc0206ed8:	e788                	sd	a0,8(a5)
ffffffffc0206eda:	0067b823          	sd	t1,16(a5)
ffffffffc0206ede:	c111                	beqz	a0,ffffffffc0206ee2 <stride_dequeue+0x116a>
ffffffffc0206ee0:	e11c                	sd	a5,0(a0)
ffffffffc0206ee2:	7702                	ld	a4,32(sp)
ffffffffc0206ee4:	e49c                	sd	a5,8(s1)
ffffffffc0206ee6:	e898                	sd	a4,16(s1)
ffffffffc0206ee8:	e384                	sd	s1,0(a5)
ffffffffc0206eea:	fc3fe06f          	j	ffffffffc0205eac <stride_dequeue+0x134>
ffffffffc0206eee:	008cb783          	ld	a5,8(s9)
ffffffffc0206ef2:	010cbd03          	ld	s10,16(s9)
ffffffffc0206ef6:	e83e                	sd	a5,16(sp)
ffffffffc0206ef8:	520d08e3          	beqz	s10,ffffffffc0207c28 <stride_dequeue+0x1eb0>
ffffffffc0206efc:	85a2                	mv	a1,s0
ffffffffc0206efe:	856a                	mv	a0,s10
ffffffffc0206f00:	c17fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206f04:	587d                	li	a6,-1
ffffffffc0206f06:	430508e3          	beq	a0,a6,ffffffffc0207b36 <stride_dequeue+0x1dbe>
ffffffffc0206f0a:	641c                	ld	a5,8(s0)
ffffffffc0206f0c:	6810                	ld	a2,16(s0)
ffffffffc0206f0e:	ec3e                	sd	a5,24(sp)
ffffffffc0206f10:	ce15                	beqz	a2,ffffffffc0206f4c <stride_dequeue+0x11d4>
ffffffffc0206f12:	85b2                	mv	a1,a2
ffffffffc0206f14:	856a                	mv	a0,s10
ffffffffc0206f16:	f032                	sd	a2,32(sp)
ffffffffc0206f18:	bfffe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206f1c:	587d                	li	a6,-1
ffffffffc0206f1e:	7602                	ld	a2,32(sp)
ffffffffc0206f20:	01051463          	bne	a0,a6,ffffffffc0206f28 <stride_dequeue+0x11b0>
ffffffffc0206f24:	0b00106f          	j	ffffffffc0207fd4 <stride_dequeue+0x225c>
ffffffffc0206f28:	00863803          	ld	a6,8(a2)
ffffffffc0206f2c:	6a0c                	ld	a1,16(a2)
ffffffffc0206f2e:	856a                	mv	a0,s10
ffffffffc0206f30:	f432                	sd	a2,40(sp)
ffffffffc0206f32:	f042                	sd	a6,32(sp)
ffffffffc0206f34:	c45fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206f38:	7622                	ld	a2,40(sp)
ffffffffc0206f3a:	7802                	ld	a6,32(sp)
ffffffffc0206f3c:	e608                	sd	a0,8(a2)
ffffffffc0206f3e:	01063823          	sd	a6,16(a2)
ffffffffc0206f42:	e119                	bnez	a0,ffffffffc0206f48 <stride_dequeue+0x11d0>
ffffffffc0206f44:	1a00106f          	j	ffffffffc02080e4 <stride_dequeue+0x236c>
ffffffffc0206f48:	e110                	sd	a2,0(a0)
ffffffffc0206f4a:	8d32                	mv	s10,a2
ffffffffc0206f4c:	67e2                	ld	a5,24(sp)
ffffffffc0206f4e:	01a43423          	sd	s10,8(s0)
ffffffffc0206f52:	e81c                	sd	a5,16(s0)
ffffffffc0206f54:	008d3023          	sd	s0,0(s10)
ffffffffc0206f58:	8d22                	mv	s10,s0
ffffffffc0206f5a:	67c2                	ld	a5,16(sp)
ffffffffc0206f5c:	01acb423          	sd	s10,8(s9)
ffffffffc0206f60:	8466                	mv	s0,s9
ffffffffc0206f62:	00fcb823          	sd	a5,16(s9)
ffffffffc0206f66:	019d3023          	sd	s9,0(s10)
ffffffffc0206f6a:	f9cff06f          	j	ffffffffc0206706 <stride_dequeue+0x98e>
ffffffffc0206f6e:	008cb783          	ld	a5,8(s9)
ffffffffc0206f72:	010cb803          	ld	a6,16(s9)
ffffffffc0206f76:	f02a                	sd	a0,32(sp)
ffffffffc0206f78:	ec3e                	sd	a5,24(sp)
ffffffffc0206f7a:	00081463          	bnez	a6,ffffffffc0206f82 <stride_dequeue+0x120a>
ffffffffc0206f7e:	7e90006f          	j	ffffffffc0207f66 <stride_dequeue+0x21ee>
ffffffffc0206f82:	8542                	mv	a0,a6
ffffffffc0206f84:	85ea                	mv	a1,s10
ffffffffc0206f86:	f442                	sd	a6,40(sp)
ffffffffc0206f88:	b8ffe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206f8c:	7302                	ld	t1,32(sp)
ffffffffc0206f8e:	7822                	ld	a6,40(sp)
ffffffffc0206f90:	00651463          	bne	a0,t1,ffffffffc0206f98 <stride_dequeue+0x1220>
ffffffffc0206f94:	6db0006f          	j	ffffffffc0207e6e <stride_dequeue+0x20f6>
ffffffffc0206f98:	008d3783          	ld	a5,8(s10)
ffffffffc0206f9c:	010d3883          	ld	a7,16(s10)
ffffffffc0206fa0:	fc1a                	sd	t1,56(sp)
ffffffffc0206fa2:	f03e                	sd	a5,32(sp)
ffffffffc0206fa4:	04088463          	beqz	a7,ffffffffc0206fec <stride_dequeue+0x1274>
ffffffffc0206fa8:	85c6                	mv	a1,a7
ffffffffc0206faa:	8542                	mv	a0,a6
ffffffffc0206fac:	f846                	sd	a7,48(sp)
ffffffffc0206fae:	f442                	sd	a6,40(sp)
ffffffffc0206fb0:	b67fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0206fb4:	7362                	ld	t1,56(sp)
ffffffffc0206fb6:	7822                	ld	a6,40(sp)
ffffffffc0206fb8:	78c2                	ld	a7,48(sp)
ffffffffc0206fba:	00651463          	bne	a0,t1,ffffffffc0206fc2 <stride_dequeue+0x124a>
ffffffffc0206fbe:	0ce0106f          	j	ffffffffc020808c <stride_dequeue+0x2314>
ffffffffc0206fc2:	0088b303          	ld	t1,8(a7)
ffffffffc0206fc6:	0108b583          	ld	a1,16(a7)
ffffffffc0206fca:	8542                	mv	a0,a6
ffffffffc0206fcc:	f846                	sd	a7,48(sp)
ffffffffc0206fce:	f41a                	sd	t1,40(sp)
ffffffffc0206fd0:	ba9fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0206fd4:	78c2                	ld	a7,48(sp)
ffffffffc0206fd6:	7322                	ld	t1,40(sp)
ffffffffc0206fd8:	00a8b423          	sd	a0,8(a7)
ffffffffc0206fdc:	0068b823          	sd	t1,16(a7)
ffffffffc0206fe0:	e119                	bnez	a0,ffffffffc0206fe6 <stride_dequeue+0x126e>
ffffffffc0206fe2:	48a0106f          	j	ffffffffc020846c <stride_dequeue+0x26f4>
ffffffffc0206fe6:	01153023          	sd	a7,0(a0)
ffffffffc0206fea:	8846                	mv	a6,a7
ffffffffc0206fec:	7782                	ld	a5,32(sp)
ffffffffc0206fee:	010d3423          	sd	a6,8(s10)
ffffffffc0206ff2:	00fd3823          	sd	a5,16(s10)
ffffffffc0206ff6:	01a83023          	sd	s10,0(a6)
ffffffffc0206ffa:	886a                	mv	a6,s10
ffffffffc0206ffc:	67e2                	ld	a5,24(sp)
ffffffffc0206ffe:	010cb423          	sd	a6,8(s9)
ffffffffc0207002:	8d66                	mv	s10,s9
ffffffffc0207004:	00fcb823          	sd	a5,16(s9)
ffffffffc0207008:	01983023          	sd	s9,0(a6)
ffffffffc020700c:	b2b9                	j	ffffffffc020695a <stride_dequeue+0xbe2>
ffffffffc020700e:	008c3783          	ld	a5,8(s8)
ffffffffc0207012:	010c3803          	ld	a6,16(s8)
ffffffffc0207016:	f02a                	sd	a0,32(sp)
ffffffffc0207018:	ec3e                	sd	a5,24(sp)
ffffffffc020701a:	00081463          	bnez	a6,ffffffffc0207022 <stride_dequeue+0x12aa>
ffffffffc020701e:	75b0006f          	j	ffffffffc0207f78 <stride_dequeue+0x2200>
ffffffffc0207022:	8542                	mv	a0,a6
ffffffffc0207024:	85e6                	mv	a1,s9
ffffffffc0207026:	f442                	sd	a6,40(sp)
ffffffffc0207028:	aeffe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020702c:	7302                	ld	t1,32(sp)
ffffffffc020702e:	7822                	ld	a6,40(sp)
ffffffffc0207030:	426503e3          	beq	a0,t1,ffffffffc0207c56 <stride_dequeue+0x1ede>
ffffffffc0207034:	008cb783          	ld	a5,8(s9)
ffffffffc0207038:	010cb883          	ld	a7,16(s9)
ffffffffc020703c:	fc1a                	sd	t1,56(sp)
ffffffffc020703e:	f03e                	sd	a5,32(sp)
ffffffffc0207040:	04088463          	beqz	a7,ffffffffc0207088 <stride_dequeue+0x1310>
ffffffffc0207044:	85c6                	mv	a1,a7
ffffffffc0207046:	8542                	mv	a0,a6
ffffffffc0207048:	f846                	sd	a7,48(sp)
ffffffffc020704a:	f442                	sd	a6,40(sp)
ffffffffc020704c:	acbfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207050:	7362                	ld	t1,56(sp)
ffffffffc0207052:	7822                	ld	a6,40(sp)
ffffffffc0207054:	78c2                	ld	a7,48(sp)
ffffffffc0207056:	00651463          	bne	a0,t1,ffffffffc020705e <stride_dequeue+0x12e6>
ffffffffc020705a:	0ea0106f          	j	ffffffffc0208144 <stride_dequeue+0x23cc>
ffffffffc020705e:	0088b303          	ld	t1,8(a7)
ffffffffc0207062:	0108b583          	ld	a1,16(a7)
ffffffffc0207066:	8542                	mv	a0,a6
ffffffffc0207068:	f846                	sd	a7,48(sp)
ffffffffc020706a:	f41a                	sd	t1,40(sp)
ffffffffc020706c:	b0dfe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207070:	78c2                	ld	a7,48(sp)
ffffffffc0207072:	7322                	ld	t1,40(sp)
ffffffffc0207074:	00a8b423          	sd	a0,8(a7)
ffffffffc0207078:	0068b823          	sd	t1,16(a7)
ffffffffc020707c:	e119                	bnez	a0,ffffffffc0207082 <stride_dequeue+0x130a>
ffffffffc020707e:	3ca0106f          	j	ffffffffc0208448 <stride_dequeue+0x26d0>
ffffffffc0207082:	01153023          	sd	a7,0(a0)
ffffffffc0207086:	8846                	mv	a6,a7
ffffffffc0207088:	7782                	ld	a5,32(sp)
ffffffffc020708a:	010cb423          	sd	a6,8(s9)
ffffffffc020708e:	00fcb823          	sd	a5,16(s9)
ffffffffc0207092:	01983023          	sd	s9,0(a6)
ffffffffc0207096:	8866                	mv	a6,s9
ffffffffc0207098:	67e2                	ld	a5,24(sp)
ffffffffc020709a:	010c3423          	sd	a6,8(s8)
ffffffffc020709e:	00fc3823          	sd	a5,16(s8)
ffffffffc02070a2:	01883023          	sd	s8,0(a6)
ffffffffc02070a6:	9d4ff06f          	j	ffffffffc020627a <stride_dequeue+0x502>
ffffffffc02070aa:	008cb783          	ld	a5,8(s9)
ffffffffc02070ae:	010cb803          	ld	a6,16(s9)
ffffffffc02070b2:	f02a                	sd	a0,32(sp)
ffffffffc02070b4:	ec3e                	sd	a5,24(sp)
ffffffffc02070b6:	00081463          	bnez	a6,ffffffffc02070be <stride_dequeue+0x1346>
ffffffffc02070ba:	6b30006f          	j	ffffffffc0207f6c <stride_dequeue+0x21f4>
ffffffffc02070be:	8542                	mv	a0,a6
ffffffffc02070c0:	85ea                	mv	a1,s10
ffffffffc02070c2:	f442                	sd	a6,40(sp)
ffffffffc02070c4:	a53fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02070c8:	7302                	ld	t1,32(sp)
ffffffffc02070ca:	7822                	ld	a6,40(sp)
ffffffffc02070cc:	546508e3          	beq	a0,t1,ffffffffc0207e1c <stride_dequeue+0x20a4>
ffffffffc02070d0:	008d3783          	ld	a5,8(s10)
ffffffffc02070d4:	010d3883          	ld	a7,16(s10)
ffffffffc02070d8:	fc1a                	sd	t1,56(sp)
ffffffffc02070da:	f03e                	sd	a5,32(sp)
ffffffffc02070dc:	04088463          	beqz	a7,ffffffffc0207124 <stride_dequeue+0x13ac>
ffffffffc02070e0:	85c6                	mv	a1,a7
ffffffffc02070e2:	8542                	mv	a0,a6
ffffffffc02070e4:	f846                	sd	a7,48(sp)
ffffffffc02070e6:	f442                	sd	a6,40(sp)
ffffffffc02070e8:	a2ffe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02070ec:	7362                	ld	t1,56(sp)
ffffffffc02070ee:	7822                	ld	a6,40(sp)
ffffffffc02070f0:	78c2                	ld	a7,48(sp)
ffffffffc02070f2:	00651463          	bne	a0,t1,ffffffffc02070fa <stride_dequeue+0x1382>
ffffffffc02070f6:	1e00106f          	j	ffffffffc02082d6 <stride_dequeue+0x255e>
ffffffffc02070fa:	0088b303          	ld	t1,8(a7)
ffffffffc02070fe:	0108b583          	ld	a1,16(a7)
ffffffffc0207102:	8542                	mv	a0,a6
ffffffffc0207104:	f846                	sd	a7,48(sp)
ffffffffc0207106:	f41a                	sd	t1,40(sp)
ffffffffc0207108:	a71fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020710c:	78c2                	ld	a7,48(sp)
ffffffffc020710e:	7322                	ld	t1,40(sp)
ffffffffc0207110:	00a8b423          	sd	a0,8(a7)
ffffffffc0207114:	0068b823          	sd	t1,16(a7)
ffffffffc0207118:	e119                	bnez	a0,ffffffffc020711e <stride_dequeue+0x13a6>
ffffffffc020711a:	3100106f          	j	ffffffffc020842a <stride_dequeue+0x26b2>
ffffffffc020711e:	01153023          	sd	a7,0(a0)
ffffffffc0207122:	8846                	mv	a6,a7
ffffffffc0207124:	7782                	ld	a5,32(sp)
ffffffffc0207126:	010d3423          	sd	a6,8(s10)
ffffffffc020712a:	00fd3823          	sd	a5,16(s10)
ffffffffc020712e:	01a83023          	sd	s10,0(a6)
ffffffffc0207132:	886a                	mv	a6,s10
ffffffffc0207134:	67e2                	ld	a5,24(sp)
ffffffffc0207136:	010cb423          	sd	a6,8(s9)
ffffffffc020713a:	8d66                	mv	s10,s9
ffffffffc020713c:	00fcb823          	sd	a5,16(s9)
ffffffffc0207140:	01983023          	sd	s9,0(a6)
ffffffffc0207144:	f52ff06f          	j	ffffffffc0206896 <stride_dequeue+0xb1e>
ffffffffc0207148:	0089b783          	ld	a5,8(s3)
ffffffffc020714c:	0109b803          	ld	a6,16(s3)
ffffffffc0207150:	f02a                	sd	a0,32(sp)
ffffffffc0207152:	ec3e                	sd	a5,24(sp)
ffffffffc0207154:	620808e3          	beqz	a6,ffffffffc0207f84 <stride_dequeue+0x220c>
ffffffffc0207158:	8542                	mv	a0,a6
ffffffffc020715a:	85e6                	mv	a1,s9
ffffffffc020715c:	f442                	sd	a6,40(sp)
ffffffffc020715e:	9b9fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207162:	7302                	ld	t1,32(sp)
ffffffffc0207164:	7822                	ld	a6,40(sp)
ffffffffc0207166:	28650de3          	beq	a0,t1,ffffffffc0207c00 <stride_dequeue+0x1e88>
ffffffffc020716a:	008cb783          	ld	a5,8(s9)
ffffffffc020716e:	010cb883          	ld	a7,16(s9)
ffffffffc0207172:	fc1a                	sd	t1,56(sp)
ffffffffc0207174:	f03e                	sd	a5,32(sp)
ffffffffc0207176:	04088463          	beqz	a7,ffffffffc02071be <stride_dequeue+0x1446>
ffffffffc020717a:	85c6                	mv	a1,a7
ffffffffc020717c:	8542                	mv	a0,a6
ffffffffc020717e:	f846                	sd	a7,48(sp)
ffffffffc0207180:	f442                	sd	a6,40(sp)
ffffffffc0207182:	995fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207186:	7362                	ld	t1,56(sp)
ffffffffc0207188:	7822                	ld	a6,40(sp)
ffffffffc020718a:	78c2                	ld	a7,48(sp)
ffffffffc020718c:	00651463          	bne	a0,t1,ffffffffc0207194 <stride_dequeue+0x141c>
ffffffffc0207190:	1cc0106f          	j	ffffffffc020835c <stride_dequeue+0x25e4>
ffffffffc0207194:	0088b303          	ld	t1,8(a7)
ffffffffc0207198:	0108b583          	ld	a1,16(a7)
ffffffffc020719c:	8542                	mv	a0,a6
ffffffffc020719e:	f846                	sd	a7,48(sp)
ffffffffc02071a0:	f41a                	sd	t1,40(sp)
ffffffffc02071a2:	9d7fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02071a6:	78c2                	ld	a7,48(sp)
ffffffffc02071a8:	7322                	ld	t1,40(sp)
ffffffffc02071aa:	00a8b423          	sd	a0,8(a7)
ffffffffc02071ae:	0068b823          	sd	t1,16(a7)
ffffffffc02071b2:	e119                	bnez	a0,ffffffffc02071b8 <stride_dequeue+0x1440>
ffffffffc02071b4:	2580106f          	j	ffffffffc020840c <stride_dequeue+0x2694>
ffffffffc02071b8:	01153023          	sd	a7,0(a0)
ffffffffc02071bc:	8846                	mv	a6,a7
ffffffffc02071be:	7782                	ld	a5,32(sp)
ffffffffc02071c0:	010cb423          	sd	a6,8(s9)
ffffffffc02071c4:	00fcb823          	sd	a5,16(s9)
ffffffffc02071c8:	01983023          	sd	s9,0(a6)
ffffffffc02071cc:	8866                	mv	a6,s9
ffffffffc02071ce:	67e2                	ld	a5,24(sp)
ffffffffc02071d0:	0109b423          	sd	a6,8(s3)
ffffffffc02071d4:	8cce                	mv	s9,s3
ffffffffc02071d6:	00f9b823          	sd	a5,16(s3)
ffffffffc02071da:	01383023          	sd	s3,0(a6)
ffffffffc02071de:	df0ff06f          	j	ffffffffc02067ce <stride_dequeue+0xa56>
ffffffffc02071e2:	0089b783          	ld	a5,8(s3)
ffffffffc02071e6:	0109b803          	ld	a6,16(s3)
ffffffffc02071ea:	f02a                	sd	a0,32(sp)
ffffffffc02071ec:	ec3e                	sd	a5,24(sp)
ffffffffc02071ee:	580808e3          	beqz	a6,ffffffffc0207f7e <stride_dequeue+0x2206>
ffffffffc02071f2:	8542                	mv	a0,a6
ffffffffc02071f4:	85e6                	mv	a1,s9
ffffffffc02071f6:	f442                	sd	a6,40(sp)
ffffffffc02071f8:	91ffe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02071fc:	7302                	ld	t1,32(sp)
ffffffffc02071fe:	7822                	ld	a6,40(sp)
ffffffffc0207200:	226507e3          	beq	a0,t1,ffffffffc0207c2e <stride_dequeue+0x1eb6>
ffffffffc0207204:	008cb783          	ld	a5,8(s9)
ffffffffc0207208:	010cb883          	ld	a7,16(s9)
ffffffffc020720c:	fc1a                	sd	t1,56(sp)
ffffffffc020720e:	f03e                	sd	a5,32(sp)
ffffffffc0207210:	04088463          	beqz	a7,ffffffffc0207258 <stride_dequeue+0x14e0>
ffffffffc0207214:	85c6                	mv	a1,a7
ffffffffc0207216:	8542                	mv	a0,a6
ffffffffc0207218:	f846                	sd	a7,48(sp)
ffffffffc020721a:	f442                	sd	a6,40(sp)
ffffffffc020721c:	8fbfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207220:	7362                	ld	t1,56(sp)
ffffffffc0207222:	7822                	ld	a6,40(sp)
ffffffffc0207224:	78c2                	ld	a7,48(sp)
ffffffffc0207226:	00651463          	bne	a0,t1,ffffffffc020722e <stride_dequeue+0x14b6>
ffffffffc020722a:	0d80106f          	j	ffffffffc0208302 <stride_dequeue+0x258a>
ffffffffc020722e:	0088b303          	ld	t1,8(a7)
ffffffffc0207232:	0108b583          	ld	a1,16(a7)
ffffffffc0207236:	8542                	mv	a0,a6
ffffffffc0207238:	f846                	sd	a7,48(sp)
ffffffffc020723a:	f41a                	sd	t1,40(sp)
ffffffffc020723c:	93dfe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207240:	78c2                	ld	a7,48(sp)
ffffffffc0207242:	7322                	ld	t1,40(sp)
ffffffffc0207244:	00a8b423          	sd	a0,8(a7)
ffffffffc0207248:	0068b823          	sd	t1,16(a7)
ffffffffc020724c:	e119                	bnez	a0,ffffffffc0207252 <stride_dequeue+0x14da>
ffffffffc020724e:	2060106f          	j	ffffffffc0208454 <stride_dequeue+0x26dc>
ffffffffc0207252:	01153023          	sd	a7,0(a0)
ffffffffc0207256:	8846                	mv	a6,a7
ffffffffc0207258:	7782                	ld	a5,32(sp)
ffffffffc020725a:	010cb423          	sd	a6,8(s9)
ffffffffc020725e:	00fcb823          	sd	a5,16(s9)
ffffffffc0207262:	01983023          	sd	s9,0(a6)
ffffffffc0207266:	8866                	mv	a6,s9
ffffffffc0207268:	67e2                	ld	a5,24(sp)
ffffffffc020726a:	0109b423          	sd	a6,8(s3)
ffffffffc020726e:	00f9b823          	sd	a5,16(s3)
ffffffffc0207272:	01383023          	sd	s3,0(a6)
ffffffffc0207276:	906ff06f          	j	ffffffffc020637c <stride_dequeue+0x604>
ffffffffc020727a:	008cb783          	ld	a5,8(s9)
ffffffffc020727e:	010cbd03          	ld	s10,16(s9)
ffffffffc0207282:	f02a                	sd	a0,32(sp)
ffffffffc0207284:	ec3e                	sd	a5,24(sp)
ffffffffc0207286:	4e0d06e3          	beqz	s10,ffffffffc0207f72 <stride_dequeue+0x21fa>
ffffffffc020728a:	85b2                	mv	a1,a2
ffffffffc020728c:	856a                	mv	a0,s10
ffffffffc020728e:	f432                	sd	a2,40(sp)
ffffffffc0207290:	887fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207294:	7302                	ld	t1,32(sp)
ffffffffc0207296:	7622                	ld	a2,40(sp)
ffffffffc0207298:	10650ce3          	beq	a0,t1,ffffffffc0207bb0 <stride_dequeue+0x1e38>
ffffffffc020729c:	661c                	ld	a5,8(a2)
ffffffffc020729e:	01063883          	ld	a7,16(a2)
ffffffffc02072a2:	fc1a                	sd	t1,56(sp)
ffffffffc02072a4:	f03e                	sd	a5,32(sp)
ffffffffc02072a6:	04088663          	beqz	a7,ffffffffc02072f2 <stride_dequeue+0x157a>
ffffffffc02072aa:	85c6                	mv	a1,a7
ffffffffc02072ac:	856a                	mv	a0,s10
ffffffffc02072ae:	f832                	sd	a2,48(sp)
ffffffffc02072b0:	f446                	sd	a7,40(sp)
ffffffffc02072b2:	865fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02072b6:	7362                	ld	t1,56(sp)
ffffffffc02072b8:	78a2                	ld	a7,40(sp)
ffffffffc02072ba:	7642                	ld	a2,48(sp)
ffffffffc02072bc:	00651463          	bne	a0,t1,ffffffffc02072c4 <stride_dequeue+0x154c>
ffffffffc02072c0:	0c80106f          	j	ffffffffc0208388 <stride_dequeue+0x2610>
ffffffffc02072c4:	0088b303          	ld	t1,8(a7)
ffffffffc02072c8:	0108b583          	ld	a1,16(a7)
ffffffffc02072cc:	856a                	mv	a0,s10
ffffffffc02072ce:	fc32                	sd	a2,56(sp)
ffffffffc02072d0:	f846                	sd	a7,48(sp)
ffffffffc02072d2:	f41a                	sd	t1,40(sp)
ffffffffc02072d4:	8a5fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02072d8:	78c2                	ld	a7,48(sp)
ffffffffc02072da:	7322                	ld	t1,40(sp)
ffffffffc02072dc:	7662                	ld	a2,56(sp)
ffffffffc02072de:	00a8b423          	sd	a0,8(a7)
ffffffffc02072e2:	0068b823          	sd	t1,16(a7)
ffffffffc02072e6:	e119                	bnez	a0,ffffffffc02072ec <stride_dequeue+0x1574>
ffffffffc02072e8:	1c00106f          	j	ffffffffc02084a8 <stride_dequeue+0x2730>
ffffffffc02072ec:	01153023          	sd	a7,0(a0)
ffffffffc02072f0:	8d46                	mv	s10,a7
ffffffffc02072f2:	7782                	ld	a5,32(sp)
ffffffffc02072f4:	01a63423          	sd	s10,8(a2)
ffffffffc02072f8:	ea1c                	sd	a5,16(a2)
ffffffffc02072fa:	00cd3023          	sd	a2,0(s10)
ffffffffc02072fe:	8d32                	mv	s10,a2
ffffffffc0207300:	67e2                	ld	a5,24(sp)
ffffffffc0207302:	01acb423          	sd	s10,8(s9)
ffffffffc0207306:	00fcb823          	sd	a5,16(s9)
ffffffffc020730a:	019d3023          	sd	s9,0(s10)
ffffffffc020730e:	95cff06f          	j	ffffffffc020646a <stride_dequeue+0x6f2>
ffffffffc0207312:	0088b783          	ld	a5,8(a7)
ffffffffc0207316:	0108b803          	ld	a6,16(a7)
ffffffffc020731a:	f42a                	sd	a0,40(sp)
ffffffffc020731c:	f03e                	sd	a5,32(sp)
ffffffffc020731e:	02080f63          	beqz	a6,ffffffffc020735c <stride_dequeue+0x15e4>
ffffffffc0207322:	8542                	mv	a0,a6
ffffffffc0207324:	85d2                	mv	a1,s4
ffffffffc0207326:	fc46                	sd	a7,56(sp)
ffffffffc0207328:	f842                	sd	a6,48(sp)
ffffffffc020732a:	fecfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020732e:	7322                	ld	t1,40(sp)
ffffffffc0207330:	7842                	ld	a6,48(sp)
ffffffffc0207332:	78e2                	ld	a7,56(sp)
ffffffffc0207334:	046508e3          	beq	a0,t1,ffffffffc0207b84 <stride_dequeue+0x1e0c>
ffffffffc0207338:	008a3303          	ld	t1,8(s4)
ffffffffc020733c:	010a3583          	ld	a1,16(s4)
ffffffffc0207340:	8542                	mv	a0,a6
ffffffffc0207342:	f846                	sd	a7,48(sp)
ffffffffc0207344:	f41a                	sd	t1,40(sp)
ffffffffc0207346:	833fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020734a:	7322                	ld	t1,40(sp)
ffffffffc020734c:	00aa3423          	sd	a0,8(s4)
ffffffffc0207350:	78c2                	ld	a7,48(sp)
ffffffffc0207352:	006a3823          	sd	t1,16(s4)
ffffffffc0207356:	c119                	beqz	a0,ffffffffc020735c <stride_dequeue+0x15e4>
ffffffffc0207358:	01453023          	sd	s4,0(a0)
ffffffffc020735c:	7782                	ld	a5,32(sp)
ffffffffc020735e:	0148b423          	sd	s4,8(a7)
ffffffffc0207362:	00f8b823          	sd	a5,16(a7)
ffffffffc0207366:	011a3023          	sd	a7,0(s4)
ffffffffc020736a:	8a46                	mv	s4,a7
ffffffffc020736c:	e7cff06f          	j	ffffffffc02069e8 <stride_dequeue+0xc70>
ffffffffc0207370:	008a3783          	ld	a5,8(s4)
ffffffffc0207374:	010a3883          	ld	a7,16(s4)
ffffffffc0207378:	f42a                	sd	a0,40(sp)
ffffffffc020737a:	f03e                	sd	a5,32(sp)
ffffffffc020737c:	02088f63          	beqz	a7,ffffffffc02073ba <stride_dequeue+0x1642>
ffffffffc0207380:	85c2                	mv	a1,a6
ffffffffc0207382:	8546                	mv	a0,a7
ffffffffc0207384:	fc42                	sd	a6,56(sp)
ffffffffc0207386:	f846                	sd	a7,48(sp)
ffffffffc0207388:	f8efe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020738c:	7322                	ld	t1,40(sp)
ffffffffc020738e:	78c2                	ld	a7,48(sp)
ffffffffc0207390:	7862                	ld	a6,56(sp)
ffffffffc0207392:	22650ce3          	beq	a0,t1,ffffffffc0207dca <stride_dequeue+0x2052>
ffffffffc0207396:	00883303          	ld	t1,8(a6)
ffffffffc020739a:	01083583          	ld	a1,16(a6)
ffffffffc020739e:	8546                	mv	a0,a7
ffffffffc02073a0:	f842                	sd	a6,48(sp)
ffffffffc02073a2:	f41a                	sd	t1,40(sp)
ffffffffc02073a4:	fd4fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02073a8:	7842                	ld	a6,48(sp)
ffffffffc02073aa:	7322                	ld	t1,40(sp)
ffffffffc02073ac:	00a83423          	sd	a0,8(a6)
ffffffffc02073b0:	00683823          	sd	t1,16(a6)
ffffffffc02073b4:	c119                	beqz	a0,ffffffffc02073ba <stride_dequeue+0x1642>
ffffffffc02073b6:	01053023          	sd	a6,0(a0)
ffffffffc02073ba:	7782                	ld	a5,32(sp)
ffffffffc02073bc:	010a3423          	sd	a6,8(s4)
ffffffffc02073c0:	00fa3823          	sd	a5,16(s4)
ffffffffc02073c4:	01483023          	sd	s4,0(a6)
ffffffffc02073c8:	960ff06f          	j	ffffffffc0206528 <stride_dequeue+0x7b0>
ffffffffc02073cc:	008a3703          	ld	a4,8(s4)
ffffffffc02073d0:	010a3883          	ld	a7,16(s4)
ffffffffc02073d4:	f42a                	sd	a0,40(sp)
ffffffffc02073d6:	f03a                	sd	a4,32(sp)
ffffffffc02073d8:	02088c63          	beqz	a7,ffffffffc0207410 <stride_dequeue+0x1698>
ffffffffc02073dc:	85be                	mv	a1,a5
ffffffffc02073de:	8546                	mv	a0,a7
ffffffffc02073e0:	fc3e                	sd	a5,56(sp)
ffffffffc02073e2:	f846                	sd	a7,48(sp)
ffffffffc02073e4:	f32fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02073e8:	7322                	ld	t1,40(sp)
ffffffffc02073ea:	78c2                	ld	a7,48(sp)
ffffffffc02073ec:	77e2                	ld	a5,56(sp)
ffffffffc02073ee:	1a6509e3          	beq	a0,t1,ffffffffc0207da0 <stride_dequeue+0x2028>
ffffffffc02073f2:	0087b303          	ld	t1,8(a5)
ffffffffc02073f6:	6b8c                	ld	a1,16(a5)
ffffffffc02073f8:	8546                	mv	a0,a7
ffffffffc02073fa:	f83e                	sd	a5,48(sp)
ffffffffc02073fc:	f41a                	sd	t1,40(sp)
ffffffffc02073fe:	f7afe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207402:	77c2                	ld	a5,48(sp)
ffffffffc0207404:	7322                	ld	t1,40(sp)
ffffffffc0207406:	e788                	sd	a0,8(a5)
ffffffffc0207408:	0067b823          	sd	t1,16(a5)
ffffffffc020740c:	c111                	beqz	a0,ffffffffc0207410 <stride_dequeue+0x1698>
ffffffffc020740e:	e11c                	sd	a5,0(a0)
ffffffffc0207410:	7702                	ld	a4,32(sp)
ffffffffc0207412:	00fa3423          	sd	a5,8(s4)
ffffffffc0207416:	00ea3823          	sd	a4,16(s4)
ffffffffc020741a:	0147b023          	sd	s4,0(a5)
ffffffffc020741e:	c05fe06f          	j	ffffffffc0206022 <stride_dequeue+0x2aa>
ffffffffc0207422:	008c3703          	ld	a4,8(s8)
ffffffffc0207426:	010c3883          	ld	a7,16(s8)
ffffffffc020742a:	f42a                	sd	a0,40(sp)
ffffffffc020742c:	f03a                	sd	a4,32(sp)
ffffffffc020742e:	02088c63          	beqz	a7,ffffffffc0207466 <stride_dequeue+0x16ee>
ffffffffc0207432:	85be                	mv	a1,a5
ffffffffc0207434:	8546                	mv	a0,a7
ffffffffc0207436:	fc3e                	sd	a5,56(sp)
ffffffffc0207438:	f846                	sd	a7,48(sp)
ffffffffc020743a:	edcfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020743e:	7322                	ld	t1,40(sp)
ffffffffc0207440:	78c2                	ld	a7,48(sp)
ffffffffc0207442:	77e2                	ld	a5,56(sp)
ffffffffc0207444:	126509e3          	beq	a0,t1,ffffffffc0207d76 <stride_dequeue+0x1ffe>
ffffffffc0207448:	0087b303          	ld	t1,8(a5)
ffffffffc020744c:	6b8c                	ld	a1,16(a5)
ffffffffc020744e:	8546                	mv	a0,a7
ffffffffc0207450:	f83e                	sd	a5,48(sp)
ffffffffc0207452:	f41a                	sd	t1,40(sp)
ffffffffc0207454:	f24fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207458:	77c2                	ld	a5,48(sp)
ffffffffc020745a:	7322                	ld	t1,40(sp)
ffffffffc020745c:	e788                	sd	a0,8(a5)
ffffffffc020745e:	0067b823          	sd	t1,16(a5)
ffffffffc0207462:	c111                	beqz	a0,ffffffffc0207466 <stride_dequeue+0x16ee>
ffffffffc0207464:	e11c                	sd	a5,0(a0)
ffffffffc0207466:	7702                	ld	a4,32(sp)
ffffffffc0207468:	00fc3423          	sd	a5,8(s8)
ffffffffc020746c:	00ec3823          	sd	a4,16(s8)
ffffffffc0207470:	0187b023          	sd	s8,0(a5)
ffffffffc0207474:	cdffe06f          	j	ffffffffc0206152 <stride_dequeue+0x3da>
ffffffffc0207478:	008a3783          	ld	a5,8(s4)
ffffffffc020747c:	010a3883          	ld	a7,16(s4)
ffffffffc0207480:	f42a                	sd	a0,40(sp)
ffffffffc0207482:	f03e                	sd	a5,32(sp)
ffffffffc0207484:	02088f63          	beqz	a7,ffffffffc02074c2 <stride_dequeue+0x174a>
ffffffffc0207488:	85c2                	mv	a1,a6
ffffffffc020748a:	8546                	mv	a0,a7
ffffffffc020748c:	fc42                	sd	a6,56(sp)
ffffffffc020748e:	f846                	sd	a7,48(sp)
ffffffffc0207490:	e86fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207494:	7322                	ld	t1,40(sp)
ffffffffc0207496:	78c2                	ld	a7,48(sp)
ffffffffc0207498:	7862                	ld	a6,56(sp)
ffffffffc020749a:	006507e3          	beq	a0,t1,ffffffffc0207ca8 <stride_dequeue+0x1f30>
ffffffffc020749e:	00883303          	ld	t1,8(a6)
ffffffffc02074a2:	01083583          	ld	a1,16(a6)
ffffffffc02074a6:	8546                	mv	a0,a7
ffffffffc02074a8:	f842                	sd	a6,48(sp)
ffffffffc02074aa:	f41a                	sd	t1,40(sp)
ffffffffc02074ac:	eccfe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02074b0:	7842                	ld	a6,48(sp)
ffffffffc02074b2:	7322                	ld	t1,40(sp)
ffffffffc02074b4:	00a83423          	sd	a0,8(a6)
ffffffffc02074b8:	00683823          	sd	t1,16(a6)
ffffffffc02074bc:	c119                	beqz	a0,ffffffffc02074c2 <stride_dequeue+0x174a>
ffffffffc02074be:	01053023          	sd	a6,0(a0)
ffffffffc02074c2:	7782                	ld	a5,32(sp)
ffffffffc02074c4:	010a3423          	sd	a6,8(s4)
ffffffffc02074c8:	00fa3823          	sd	a5,16(s4)
ffffffffc02074cc:	01483023          	sd	s4,0(a6)
ffffffffc02074d0:	930ff06f          	j	ffffffffc0206600 <stride_dequeue+0x888>
ffffffffc02074d4:	0084b883          	ld	a7,8(s1)
ffffffffc02074d8:	6888                	ld	a0,16(s1)
ffffffffc02074da:	859a                	mv	a1,t1
ffffffffc02074dc:	f446                	sd	a7,40(sp)
ffffffffc02074de:	e9afe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02074e2:	78a2                	ld	a7,40(sp)
ffffffffc02074e4:	e488                	sd	a0,8(s1)
ffffffffc02074e6:	8326                	mv	t1,s1
ffffffffc02074e8:	0114b823          	sd	a7,16(s1)
ffffffffc02074ec:	77c2                	ld	a5,48(sp)
ffffffffc02074ee:	c119                	beqz	a0,ffffffffc02074f4 <stride_dequeue+0x177c>
ffffffffc02074f0:	9abfe06f          	j	ffffffffc0205e9a <stride_dequeue+0x122>
ffffffffc02074f4:	9abfe06f          	j	ffffffffc0205e9e <stride_dequeue+0x126>
ffffffffc02074f8:	8326                	mv	t1,s1
ffffffffc02074fa:	9a5fe06f          	j	ffffffffc0205e9e <stride_dequeue+0x126>
ffffffffc02074fe:	008cb703          	ld	a4,8(s9)
ffffffffc0207502:	010cb783          	ld	a5,16(s9)
ffffffffc0207506:	f42a                	sd	a0,40(sp)
ffffffffc0207508:	ec3a                	sd	a4,24(sp)
ffffffffc020750a:	cb95                	beqz	a5,ffffffffc020753e <stride_dequeue+0x17c6>
ffffffffc020750c:	853e                	mv	a0,a5
ffffffffc020750e:	85ea                	mv	a1,s10
ffffffffc0207510:	f03e                	sd	a5,32(sp)
ffffffffc0207512:	e04fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207516:	7822                	ld	a6,40(sp)
ffffffffc0207518:	7782                	ld	a5,32(sp)
ffffffffc020751a:	310507e3          	beq	a0,a6,ffffffffc0208028 <stride_dequeue+0x22b0>
ffffffffc020751e:	008d3803          	ld	a6,8(s10)
ffffffffc0207522:	010d3583          	ld	a1,16(s10)
ffffffffc0207526:	853e                	mv	a0,a5
ffffffffc0207528:	f042                	sd	a6,32(sp)
ffffffffc020752a:	e4efe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020752e:	7802                	ld	a6,32(sp)
ffffffffc0207530:	00ad3423          	sd	a0,8(s10)
ffffffffc0207534:	010d3823          	sd	a6,16(s10)
ffffffffc0207538:	c119                	beqz	a0,ffffffffc020753e <stride_dequeue+0x17c6>
ffffffffc020753a:	01a53023          	sd	s10,0(a0)
ffffffffc020753e:	67e2                	ld	a5,24(sp)
ffffffffc0207540:	01acb423          	sd	s10,8(s9)
ffffffffc0207544:	00fcb823          	sd	a5,16(s9)
ffffffffc0207548:	019d3023          	sd	s9,0(s10)
ffffffffc020754c:	8d66                	mv	s10,s9
ffffffffc020754e:	d5eff06f          	j	ffffffffc0206aac <stride_dequeue+0xd34>
ffffffffc0207552:	008cb703          	ld	a4,8(s9)
ffffffffc0207556:	010cb783          	ld	a5,16(s9)
ffffffffc020755a:	f42a                	sd	a0,40(sp)
ffffffffc020755c:	ec3a                	sd	a4,24(sp)
ffffffffc020755e:	cb95                	beqz	a5,ffffffffc0207592 <stride_dequeue+0x181a>
ffffffffc0207560:	853e                	mv	a0,a5
ffffffffc0207562:	85ea                	mv	a1,s10
ffffffffc0207564:	f03e                	sd	a5,32(sp)
ffffffffc0207566:	db0fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020756a:	7822                	ld	a6,40(sp)
ffffffffc020756c:	7782                	ld	a5,32(sp)
ffffffffc020756e:	23050de3          	beq	a0,a6,ffffffffc0207fa8 <stride_dequeue+0x2230>
ffffffffc0207572:	008d3803          	ld	a6,8(s10)
ffffffffc0207576:	010d3583          	ld	a1,16(s10)
ffffffffc020757a:	853e                	mv	a0,a5
ffffffffc020757c:	f042                	sd	a6,32(sp)
ffffffffc020757e:	dfafe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207582:	7802                	ld	a6,32(sp)
ffffffffc0207584:	00ad3423          	sd	a0,8(s10)
ffffffffc0207588:	010d3823          	sd	a6,16(s10)
ffffffffc020758c:	c119                	beqz	a0,ffffffffc0207592 <stride_dequeue+0x181a>
ffffffffc020758e:	01a53023          	sd	s10,0(a0)
ffffffffc0207592:	67e2                	ld	a5,24(sp)
ffffffffc0207594:	01acb423          	sd	s10,8(s9)
ffffffffc0207598:	00fcb823          	sd	a5,16(s9)
ffffffffc020759c:	019d3023          	sd	s9,0(s10)
ffffffffc02075a0:	8d66                	mv	s10,s9
ffffffffc02075a2:	958ff06f          	j	ffffffffc02066fa <stride_dequeue+0x982>
ffffffffc02075a6:	008d3703          	ld	a4,8(s10)
ffffffffc02075aa:	010d3783          	ld	a5,16(s10)
ffffffffc02075ae:	f42a                	sd	a0,40(sp)
ffffffffc02075b0:	ec3a                	sd	a4,24(sp)
ffffffffc02075b2:	cb95                	beqz	a5,ffffffffc02075e6 <stride_dequeue+0x186e>
ffffffffc02075b4:	853e                	mv	a0,a5
ffffffffc02075b6:	85ce                	mv	a1,s3
ffffffffc02075b8:	f03e                	sd	a5,32(sp)
ffffffffc02075ba:	d5cfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02075be:	7822                	ld	a6,40(sp)
ffffffffc02075c0:	7782                	ld	a5,32(sp)
ffffffffc02075c2:	23050de3          	beq	a0,a6,ffffffffc0207ffc <stride_dequeue+0x2284>
ffffffffc02075c6:	0089b803          	ld	a6,8(s3)
ffffffffc02075ca:	0109b583          	ld	a1,16(s3)
ffffffffc02075ce:	853e                	mv	a0,a5
ffffffffc02075d0:	f042                	sd	a6,32(sp)
ffffffffc02075d2:	da6fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02075d6:	7802                	ld	a6,32(sp)
ffffffffc02075d8:	00a9b423          	sd	a0,8(s3)
ffffffffc02075dc:	0109b823          	sd	a6,16(s3)
ffffffffc02075e0:	c119                	beqz	a0,ffffffffc02075e6 <stride_dequeue+0x186e>
ffffffffc02075e2:	01353023          	sd	s3,0(a0)
ffffffffc02075e6:	67e2                	ld	a5,24(sp)
ffffffffc02075e8:	013d3423          	sd	s3,8(s10)
ffffffffc02075ec:	00fd3823          	sd	a5,16(s10)
ffffffffc02075f0:	01a9b023          	sd	s10,0(s3)
ffffffffc02075f4:	89ea                	mv	s3,s10
ffffffffc02075f6:	d7cff06f          	j	ffffffffc0206b72 <stride_dequeue+0xdfa>
ffffffffc02075fa:	008cb703          	ld	a4,8(s9)
ffffffffc02075fe:	010cb783          	ld	a5,16(s9)
ffffffffc0207602:	f42a                	sd	a0,40(sp)
ffffffffc0207604:	ec3a                	sd	a4,24(sp)
ffffffffc0207606:	cb95                	beqz	a5,ffffffffc020763a <stride_dequeue+0x18c2>
ffffffffc0207608:	853e                	mv	a0,a5
ffffffffc020760a:	85ea                	mv	a1,s10
ffffffffc020760c:	f03e                	sd	a5,32(sp)
ffffffffc020760e:	d08fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207612:	7822                	ld	a6,40(sp)
ffffffffc0207614:	7782                	ld	a5,32(sp)
ffffffffc0207616:	250505e3          	beq	a0,a6,ffffffffc0208060 <stride_dequeue+0x22e8>
ffffffffc020761a:	008d3803          	ld	a6,8(s10)
ffffffffc020761e:	010d3583          	ld	a1,16(s10)
ffffffffc0207622:	853e                	mv	a0,a5
ffffffffc0207624:	f042                	sd	a6,32(sp)
ffffffffc0207626:	d52fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020762a:	7802                	ld	a6,32(sp)
ffffffffc020762c:	00ad3423          	sd	a0,8(s10)
ffffffffc0207630:	010d3823          	sd	a6,16(s10)
ffffffffc0207634:	c119                	beqz	a0,ffffffffc020763a <stride_dequeue+0x18c2>
ffffffffc0207636:	01a53023          	sd	s10,0(a0)
ffffffffc020763a:	67e2                	ld	a5,24(sp)
ffffffffc020763c:	01acb423          	sd	s10,8(s9)
ffffffffc0207640:	00fcb823          	sd	a5,16(s9)
ffffffffc0207644:	019d3023          	sd	s9,0(s10)
ffffffffc0207648:	8d66                	mv	s10,s9
ffffffffc020764a:	deeff06f          	j	ffffffffc0206c38 <stride_dequeue+0xec0>
ffffffffc020764e:	8346                	mv	t1,a7
ffffffffc0207650:	b8aff06f          	j	ffffffffc02069da <stride_dequeue+0xc62>
ffffffffc0207654:	008cb783          	ld	a5,8(s9)
ffffffffc0207658:	010cb883          	ld	a7,16(s9)
ffffffffc020765c:	fc2a                	sd	a0,56(sp)
ffffffffc020765e:	f03e                	sd	a5,32(sp)
ffffffffc0207660:	02088f63          	beqz	a7,ffffffffc020769e <stride_dequeue+0x1926>
ffffffffc0207664:	85c2                	mv	a1,a6
ffffffffc0207666:	8546                	mv	a0,a7
ffffffffc0207668:	f842                	sd	a6,48(sp)
ffffffffc020766a:	f446                	sd	a7,40(sp)
ffffffffc020766c:	caafe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207670:	7362                	ld	t1,56(sp)
ffffffffc0207672:	78a2                	ld	a7,40(sp)
ffffffffc0207674:	7842                	ld	a6,48(sp)
ffffffffc0207676:	326505e3          	beq	a0,t1,ffffffffc02081a0 <stride_dequeue+0x2428>
ffffffffc020767a:	00883303          	ld	t1,8(a6)
ffffffffc020767e:	01083583          	ld	a1,16(a6)
ffffffffc0207682:	8546                	mv	a0,a7
ffffffffc0207684:	f842                	sd	a6,48(sp)
ffffffffc0207686:	f41a                	sd	t1,40(sp)
ffffffffc0207688:	cf0fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020768c:	7842                	ld	a6,48(sp)
ffffffffc020768e:	7322                	ld	t1,40(sp)
ffffffffc0207690:	00a83423          	sd	a0,8(a6)
ffffffffc0207694:	00683823          	sd	t1,16(a6)
ffffffffc0207698:	c119                	beqz	a0,ffffffffc020769e <stride_dequeue+0x1926>
ffffffffc020769a:	01053023          	sd	a6,0(a0)
ffffffffc020769e:	7782                	ld	a5,32(sp)
ffffffffc02076a0:	010cb423          	sd	a6,8(s9)
ffffffffc02076a4:	00fcb823          	sd	a5,16(s9)
ffffffffc02076a8:	01983023          	sd	s9,0(a6)
ffffffffc02076ac:	8866                	mv	a6,s9
ffffffffc02076ae:	a9eff06f          	j	ffffffffc020694c <stride_dequeue+0xbd4>
ffffffffc02076b2:	0088b783          	ld	a5,8(a7)
ffffffffc02076b6:	0108b803          	ld	a6,16(a7)
ffffffffc02076ba:	fc2a                	sd	a0,56(sp)
ffffffffc02076bc:	f03e                	sd	a5,32(sp)
ffffffffc02076be:	02080f63          	beqz	a6,ffffffffc02076fc <stride_dequeue+0x1984>
ffffffffc02076c2:	8542                	mv	a0,a6
ffffffffc02076c4:	85e6                	mv	a1,s9
ffffffffc02076c6:	f846                	sd	a7,48(sp)
ffffffffc02076c8:	f442                	sd	a6,40(sp)
ffffffffc02076ca:	c4cfe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02076ce:	7362                	ld	t1,56(sp)
ffffffffc02076d0:	7822                	ld	a6,40(sp)
ffffffffc02076d2:	78c2                	ld	a7,48(sp)
ffffffffc02076d4:	44650de3          	beq	a0,t1,ffffffffc020832e <stride_dequeue+0x25b6>
ffffffffc02076d8:	008cb303          	ld	t1,8(s9)
ffffffffc02076dc:	010cb583          	ld	a1,16(s9)
ffffffffc02076e0:	8542                	mv	a0,a6
ffffffffc02076e2:	f846                	sd	a7,48(sp)
ffffffffc02076e4:	f41a                	sd	t1,40(sp)
ffffffffc02076e6:	c92fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02076ea:	7322                	ld	t1,40(sp)
ffffffffc02076ec:	00acb423          	sd	a0,8(s9)
ffffffffc02076f0:	78c2                	ld	a7,48(sp)
ffffffffc02076f2:	006cb823          	sd	t1,16(s9)
ffffffffc02076f6:	c119                	beqz	a0,ffffffffc02076fc <stride_dequeue+0x1984>
ffffffffc02076f8:	01953023          	sd	s9,0(a0)
ffffffffc02076fc:	7782                	ld	a5,32(sp)
ffffffffc02076fe:	0198b423          	sd	s9,8(a7)
ffffffffc0207702:	00f8b823          	sd	a5,16(a7)
ffffffffc0207706:	011cb023          	sd	a7,0(s9)
ffffffffc020770a:	8cc6                	mv	s9,a7
ffffffffc020770c:	f80ff06f          	j	ffffffffc0206e8c <stride_dequeue+0x1114>
ffffffffc0207710:	0089b783          	ld	a5,8(s3)
ffffffffc0207714:	0109b883          	ld	a7,16(s3)
ffffffffc0207718:	fc2a                	sd	a0,56(sp)
ffffffffc020771a:	f03e                	sd	a5,32(sp)
ffffffffc020771c:	02088f63          	beqz	a7,ffffffffc020775a <stride_dequeue+0x19e2>
ffffffffc0207720:	85c2                	mv	a1,a6
ffffffffc0207722:	8546                	mv	a0,a7
ffffffffc0207724:	f842                	sd	a6,48(sp)
ffffffffc0207726:	f446                	sd	a7,40(sp)
ffffffffc0207728:	beefe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020772c:	7362                	ld	t1,56(sp)
ffffffffc020772e:	78a2                	ld	a7,40(sp)
ffffffffc0207730:	7842                	ld	a6,48(sp)
ffffffffc0207732:	486500e3          	beq	a0,t1,ffffffffc02083b2 <stride_dequeue+0x263a>
ffffffffc0207736:	00883303          	ld	t1,8(a6)
ffffffffc020773a:	01083583          	ld	a1,16(a6)
ffffffffc020773e:	8546                	mv	a0,a7
ffffffffc0207740:	f842                	sd	a6,48(sp)
ffffffffc0207742:	f41a                	sd	t1,40(sp)
ffffffffc0207744:	c34fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207748:	7842                	ld	a6,48(sp)
ffffffffc020774a:	7322                	ld	t1,40(sp)
ffffffffc020774c:	00a83423          	sd	a0,8(a6)
ffffffffc0207750:	00683823          	sd	t1,16(a6)
ffffffffc0207754:	c119                	beqz	a0,ffffffffc020775a <stride_dequeue+0x19e2>
ffffffffc0207756:	01053023          	sd	a6,0(a0)
ffffffffc020775a:	7782                	ld	a5,32(sp)
ffffffffc020775c:	0109b423          	sd	a6,8(s3)
ffffffffc0207760:	00f9b823          	sd	a5,16(s3)
ffffffffc0207764:	01383023          	sd	s3,0(a6)
ffffffffc0207768:	884e                	mv	a6,s3
ffffffffc020776a:	856ff06f          	j	ffffffffc02067c0 <stride_dequeue+0xa48>
ffffffffc020776e:	0088b783          	ld	a5,8(a7)
ffffffffc0207772:	0108b803          	ld	a6,16(a7)
ffffffffc0207776:	fc2a                	sd	a0,56(sp)
ffffffffc0207778:	f03e                	sd	a5,32(sp)
ffffffffc020777a:	02080f63          	beqz	a6,ffffffffc02077b8 <stride_dequeue+0x1a40>
ffffffffc020777e:	8542                	mv	a0,a6
ffffffffc0207780:	85e6                	mv	a1,s9
ffffffffc0207782:	f846                	sd	a7,48(sp)
ffffffffc0207784:	f442                	sd	a6,40(sp)
ffffffffc0207786:	b90fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020778a:	7362                	ld	t1,56(sp)
ffffffffc020778c:	7822                	ld	a6,40(sp)
ffffffffc020778e:	78c2                	ld	a7,48(sp)
ffffffffc0207790:	1e6500e3          	beq	a0,t1,ffffffffc0208170 <stride_dequeue+0x23f8>
ffffffffc0207794:	008cb303          	ld	t1,8(s9)
ffffffffc0207798:	010cb583          	ld	a1,16(s9)
ffffffffc020779c:	8542                	mv	a0,a6
ffffffffc020779e:	f846                	sd	a7,48(sp)
ffffffffc02077a0:	f41a                	sd	t1,40(sp)
ffffffffc02077a2:	bd6fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02077a6:	7322                	ld	t1,40(sp)
ffffffffc02077a8:	00acb423          	sd	a0,8(s9)
ffffffffc02077ac:	78c2                	ld	a7,48(sp)
ffffffffc02077ae:	006cb823          	sd	t1,16(s9)
ffffffffc02077b2:	c119                	beqz	a0,ffffffffc02077b8 <stride_dequeue+0x1a40>
ffffffffc02077b4:	01953023          	sd	s9,0(a0)
ffffffffc02077b8:	7782                	ld	a5,32(sp)
ffffffffc02077ba:	0198b423          	sd	s9,8(a7)
ffffffffc02077be:	00f8b823          	sd	a5,16(a7)
ffffffffc02077c2:	011cb023          	sd	a7,0(s9)
ffffffffc02077c6:	8cc6                	mv	s9,a7
ffffffffc02077c8:	e2eff06f          	j	ffffffffc0206df6 <stride_dequeue+0x107e>
ffffffffc02077cc:	008cb783          	ld	a5,8(s9)
ffffffffc02077d0:	010cb883          	ld	a7,16(s9)
ffffffffc02077d4:	fc2a                	sd	a0,56(sp)
ffffffffc02077d6:	f03e                	sd	a5,32(sp)
ffffffffc02077d8:	02088f63          	beqz	a7,ffffffffc0207816 <stride_dequeue+0x1a9e>
ffffffffc02077dc:	85c2                	mv	a1,a6
ffffffffc02077de:	8546                	mv	a0,a7
ffffffffc02077e0:	f842                	sd	a6,48(sp)
ffffffffc02077e2:	f446                	sd	a7,40(sp)
ffffffffc02077e4:	b32fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02077e8:	7362                	ld	t1,56(sp)
ffffffffc02077ea:	78a2                	ld	a7,40(sp)
ffffffffc02077ec:	7842                	ld	a6,48(sp)
ffffffffc02077ee:	3e6507e3          	beq	a0,t1,ffffffffc02083dc <stride_dequeue+0x2664>
ffffffffc02077f2:	00883303          	ld	t1,8(a6)
ffffffffc02077f6:	01083583          	ld	a1,16(a6)
ffffffffc02077fa:	8546                	mv	a0,a7
ffffffffc02077fc:	f842                	sd	a6,48(sp)
ffffffffc02077fe:	f41a                	sd	t1,40(sp)
ffffffffc0207800:	b78fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207804:	7842                	ld	a6,48(sp)
ffffffffc0207806:	7322                	ld	t1,40(sp)
ffffffffc0207808:	00a83423          	sd	a0,8(a6)
ffffffffc020780c:	00683823          	sd	t1,16(a6)
ffffffffc0207810:	c119                	beqz	a0,ffffffffc0207816 <stride_dequeue+0x1a9e>
ffffffffc0207812:	01053023          	sd	a6,0(a0)
ffffffffc0207816:	7782                	ld	a5,32(sp)
ffffffffc0207818:	010cb423          	sd	a6,8(s9)
ffffffffc020781c:	00fcb823          	sd	a5,16(s9)
ffffffffc0207820:	01983023          	sd	s9,0(a6)
ffffffffc0207824:	8866                	mv	a6,s9
ffffffffc0207826:	862ff06f          	j	ffffffffc0206888 <stride_dequeue+0xb10>
ffffffffc020782a:	0089b783          	ld	a5,8(s3)
ffffffffc020782e:	0109b883          	ld	a7,16(s3)
ffffffffc0207832:	fc2a                	sd	a0,56(sp)
ffffffffc0207834:	f03e                	sd	a5,32(sp)
ffffffffc0207836:	02088f63          	beqz	a7,ffffffffc0207874 <stride_dequeue+0x1afc>
ffffffffc020783a:	85c2                	mv	a1,a6
ffffffffc020783c:	8546                	mv	a0,a7
ffffffffc020783e:	f842                	sd	a6,48(sp)
ffffffffc0207840:	f446                	sd	a7,40(sp)
ffffffffc0207842:	ad4fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207846:	7362                	ld	t1,56(sp)
ffffffffc0207848:	78a2                	ld	a7,40(sp)
ffffffffc020784a:	7842                	ld	a6,48(sp)
ffffffffc020784c:	186500e3          	beq	a0,t1,ffffffffc02081cc <stride_dequeue+0x2454>
ffffffffc0207850:	00883303          	ld	t1,8(a6)
ffffffffc0207854:	01083583          	ld	a1,16(a6)
ffffffffc0207858:	8546                	mv	a0,a7
ffffffffc020785a:	f842                	sd	a6,48(sp)
ffffffffc020785c:	f41a                	sd	t1,40(sp)
ffffffffc020785e:	b1afe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207862:	7842                	ld	a6,48(sp)
ffffffffc0207864:	7322                	ld	t1,40(sp)
ffffffffc0207866:	00a83423          	sd	a0,8(a6)
ffffffffc020786a:	00683823          	sd	t1,16(a6)
ffffffffc020786e:	c119                	beqz	a0,ffffffffc0207874 <stride_dequeue+0x1afc>
ffffffffc0207870:	01053023          	sd	a6,0(a0)
ffffffffc0207874:	7782                	ld	a5,32(sp)
ffffffffc0207876:	0109b423          	sd	a6,8(s3)
ffffffffc020787a:	00f9b823          	sd	a5,16(s3)
ffffffffc020787e:	01383023          	sd	s3,0(a6)
ffffffffc0207882:	884e                	mv	a6,s3
ffffffffc0207884:	ae9fe06f          	j	ffffffffc020636c <stride_dequeue+0x5f4>
ffffffffc0207888:	8352                	mv	t1,s4
ffffffffc020788a:	f8afe06f          	j	ffffffffc0206014 <stride_dequeue+0x29c>
ffffffffc020788e:	8362                	mv	t1,s8
ffffffffc0207890:	8b5fe06f          	j	ffffffffc0206144 <stride_dequeue+0x3cc>
ffffffffc0207894:	8d66                	mv	s10,s9
ffffffffc0207896:	e65fe06f          	j	ffffffffc02066fa <stride_dequeue+0x982>
ffffffffc020789a:	008cb783          	ld	a5,8(s9)
ffffffffc020789e:	010cb883          	ld	a7,16(s9)
ffffffffc02078a2:	fc2a                	sd	a0,56(sp)
ffffffffc02078a4:	f03e                	sd	a5,32(sp)
ffffffffc02078a6:	02088f63          	beqz	a7,ffffffffc02078e4 <stride_dequeue+0x1b6c>
ffffffffc02078aa:	8546                	mv	a0,a7
ffffffffc02078ac:	85ea                	mv	a1,s10
ffffffffc02078ae:	f832                	sd	a2,48(sp)
ffffffffc02078b0:	f446                	sd	a7,40(sp)
ffffffffc02078b2:	a64fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02078b6:	7362                	ld	t1,56(sp)
ffffffffc02078b8:	78a2                	ld	a7,40(sp)
ffffffffc02078ba:	7642                	ld	a2,48(sp)
ffffffffc02078bc:	04650ce3          	beq	a0,t1,ffffffffc0208114 <stride_dequeue+0x239c>
ffffffffc02078c0:	008d3303          	ld	t1,8(s10)
ffffffffc02078c4:	010d3583          	ld	a1,16(s10)
ffffffffc02078c8:	8546                	mv	a0,a7
ffffffffc02078ca:	f832                	sd	a2,48(sp)
ffffffffc02078cc:	f41a                	sd	t1,40(sp)
ffffffffc02078ce:	aaafe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02078d2:	7322                	ld	t1,40(sp)
ffffffffc02078d4:	00ad3423          	sd	a0,8(s10)
ffffffffc02078d8:	7642                	ld	a2,48(sp)
ffffffffc02078da:	006d3823          	sd	t1,16(s10)
ffffffffc02078de:	c119                	beqz	a0,ffffffffc02078e4 <stride_dequeue+0x1b6c>
ffffffffc02078e0:	01a53023          	sd	s10,0(a0)
ffffffffc02078e4:	7782                	ld	a5,32(sp)
ffffffffc02078e6:	01acb423          	sd	s10,8(s9)
ffffffffc02078ea:	00fcb823          	sd	a5,16(s9)
ffffffffc02078ee:	019d3023          	sd	s9,0(s10)
ffffffffc02078f2:	8d66                	mv	s10,s9
ffffffffc02078f4:	b69fe06f          	j	ffffffffc020645c <stride_dequeue+0x6e4>
ffffffffc02078f8:	008c3703          	ld	a4,8(s8)
ffffffffc02078fc:	010c3883          	ld	a7,16(s8)
ffffffffc0207900:	fc2a                	sd	a0,56(sp)
ffffffffc0207902:	f03a                	sd	a4,32(sp)
ffffffffc0207904:	02088c63          	beqz	a7,ffffffffc020793c <stride_dequeue+0x1bc4>
ffffffffc0207908:	85be                	mv	a1,a5
ffffffffc020790a:	8546                	mv	a0,a7
ffffffffc020790c:	f83e                	sd	a5,48(sp)
ffffffffc020790e:	f446                	sd	a7,40(sp)
ffffffffc0207910:	a06fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc0207914:	7362                	ld	t1,56(sp)
ffffffffc0207916:	78a2                	ld	a7,40(sp)
ffffffffc0207918:	77c2                	ld	a5,48(sp)
ffffffffc020791a:	78650f63          	beq	a0,t1,ffffffffc02080b8 <stride_dequeue+0x2340>
ffffffffc020791e:	0087b303          	ld	t1,8(a5)
ffffffffc0207922:	6b8c                	ld	a1,16(a5)
ffffffffc0207924:	8546                	mv	a0,a7
ffffffffc0207926:	f83e                	sd	a5,48(sp)
ffffffffc0207928:	f41a                	sd	t1,40(sp)
ffffffffc020792a:	a4efe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020792e:	77c2                	ld	a5,48(sp)
ffffffffc0207930:	7322                	ld	t1,40(sp)
ffffffffc0207932:	e788                	sd	a0,8(a5)
ffffffffc0207934:	0067b823          	sd	t1,16(a5)
ffffffffc0207938:	c111                	beqz	a0,ffffffffc020793c <stride_dequeue+0x1bc4>
ffffffffc020793a:	e11c                	sd	a5,0(a0)
ffffffffc020793c:	7702                	ld	a4,32(sp)
ffffffffc020793e:	00fc3423          	sd	a5,8(s8)
ffffffffc0207942:	00ec3823          	sd	a4,16(s8)
ffffffffc0207946:	0187b023          	sd	s8,0(a5)
ffffffffc020794a:	87e2                	mv	a5,s8
ffffffffc020794c:	91ffe06f          	j	ffffffffc020626a <stride_dequeue+0x4f2>
ffffffffc0207950:	0088b783          	ld	a5,8(a7)
ffffffffc0207954:	0108b803          	ld	a6,16(a7)
ffffffffc0207958:	fc2a                	sd	a0,56(sp)
ffffffffc020795a:	f03e                	sd	a5,32(sp)
ffffffffc020795c:	02080f63          	beqz	a6,ffffffffc020799a <stride_dequeue+0x1c22>
ffffffffc0207960:	8542                	mv	a0,a6
ffffffffc0207962:	85ce                	mv	a1,s3
ffffffffc0207964:	f846                	sd	a7,48(sp)
ffffffffc0207966:	f442                	sd	a6,40(sp)
ffffffffc0207968:	9aefe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc020796c:	7362                	ld	t1,56(sp)
ffffffffc020796e:	7822                	ld	a6,40(sp)
ffffffffc0207970:	78c2                	ld	a7,48(sp)
ffffffffc0207972:	0e6500e3          	beq	a0,t1,ffffffffc0208252 <stride_dequeue+0x24da>
ffffffffc0207976:	0089b303          	ld	t1,8(s3)
ffffffffc020797a:	0109b583          	ld	a1,16(s3)
ffffffffc020797e:	8542                	mv	a0,a6
ffffffffc0207980:	f846                	sd	a7,48(sp)
ffffffffc0207982:	f41a                	sd	t1,40(sp)
ffffffffc0207984:	9f4fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207988:	7322                	ld	t1,40(sp)
ffffffffc020798a:	00a9b423          	sd	a0,8(s3)
ffffffffc020798e:	78c2                	ld	a7,48(sp)
ffffffffc0207990:	0069b823          	sd	t1,16(s3)
ffffffffc0207994:	c119                	beqz	a0,ffffffffc020799a <stride_dequeue+0x1c22>
ffffffffc0207996:	01353023          	sd	s3,0(a0)
ffffffffc020799a:	7782                	ld	a5,32(sp)
ffffffffc020799c:	0138b423          	sd	s3,8(a7)
ffffffffc02079a0:	00f8b823          	sd	a5,16(a7)
ffffffffc02079a4:	0119b023          	sd	a7,0(s3)
ffffffffc02079a8:	89c6                	mv	s3,a7
ffffffffc02079aa:	b24ff06f          	j	ffffffffc0206cce <stride_dequeue+0xf56>
ffffffffc02079ae:	8352                	mv	t1,s4
ffffffffc02079b0:	b69fe06f          	j	ffffffffc0206518 <stride_dequeue+0x7a0>
ffffffffc02079b4:	8352                	mv	t1,s4
ffffffffc02079b6:	c3bfe06f          	j	ffffffffc02065f0 <stride_dequeue+0x878>
ffffffffc02079ba:	0088b783          	ld	a5,8(a7)
ffffffffc02079be:	0108b803          	ld	a6,16(a7)
ffffffffc02079c2:	fc2a                	sd	a0,56(sp)
ffffffffc02079c4:	f03e                	sd	a5,32(sp)
ffffffffc02079c6:	02080f63          	beqz	a6,ffffffffc0207a04 <stride_dequeue+0x1c8c>
ffffffffc02079ca:	8542                	mv	a0,a6
ffffffffc02079cc:	85e6                	mv	a1,s9
ffffffffc02079ce:	f846                	sd	a7,48(sp)
ffffffffc02079d0:	f442                	sd	a6,40(sp)
ffffffffc02079d2:	944fe0ef          	jal	ra,ffffffffc0205b16 <proc_stride_comp_f>
ffffffffc02079d6:	7362                	ld	t1,56(sp)
ffffffffc02079d8:	7822                	ld	a6,40(sp)
ffffffffc02079da:	78c2                	ld	a7,48(sp)
ffffffffc02079dc:	046503e3          	beq	a0,t1,ffffffffc0208222 <stride_dequeue+0x24aa>
ffffffffc02079e0:	008cb303          	ld	t1,8(s9)
ffffffffc02079e4:	010cb583          	ld	a1,16(s9)
ffffffffc02079e8:	8542                	mv	a0,a6
ffffffffc02079ea:	f846                	sd	a7,48(sp)
ffffffffc02079ec:	f41a                	sd	t1,40(sp)
ffffffffc02079ee:	98afe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02079f2:	7322                	ld	t1,40(sp)
ffffffffc02079f4:	00acb423          	sd	a0,8(s9)
ffffffffc02079f8:	78c2                	ld	a7,48(sp)
ffffffffc02079fa:	006cb823          	sd	t1,16(s9)
ffffffffc02079fe:	c119                	beqz	a0,ffffffffc0207a04 <stride_dequeue+0x1c8c>
ffffffffc0207a00:	01953023          	sd	s9,0(a0)
ffffffffc0207a04:	7782                	ld	a5,32(sp)
ffffffffc0207a06:	0198b423          	sd	s9,8(a7)
ffffffffc0207a0a:	00f8b823          	sd	a5,16(a7)
ffffffffc0207a0e:	011cb023          	sd	a7,0(s9)
ffffffffc0207a12:	8cc6                	mv	s9,a7
ffffffffc0207a14:	b50ff06f          	j	ffffffffc0206d64 <stride_dequeue+0xfec>
ffffffffc0207a18:	008a3883          	ld	a7,8(s4)
ffffffffc0207a1c:	010a3503          	ld	a0,16(s4)
ffffffffc0207a20:	859a                	mv	a1,t1
ffffffffc0207a22:	f446                	sd	a7,40(sp)
ffffffffc0207a24:	954fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207a28:	78a2                	ld	a7,40(sp)
ffffffffc0207a2a:	00aa3423          	sd	a0,8(s4)
ffffffffc0207a2e:	77c2                	ld	a5,48(sp)
ffffffffc0207a30:	011a3823          	sd	a7,16(s4)
ffffffffc0207a34:	e4050ae3          	beqz	a0,ffffffffc0207888 <stride_dequeue+0x1b10>
ffffffffc0207a38:	01453023          	sd	s4,0(a0)
ffffffffc0207a3c:	8352                	mv	t1,s4
ffffffffc0207a3e:	dd6fe06f          	j	ffffffffc0206014 <stride_dequeue+0x29c>
ffffffffc0207a42:	008c3883          	ld	a7,8(s8)
ffffffffc0207a46:	010c3503          	ld	a0,16(s8)
ffffffffc0207a4a:	859a                	mv	a1,t1
ffffffffc0207a4c:	f446                	sd	a7,40(sp)
ffffffffc0207a4e:	92afe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207a52:	78a2                	ld	a7,40(sp)
ffffffffc0207a54:	00ac3423          	sd	a0,8(s8)
ffffffffc0207a58:	77c2                	ld	a5,48(sp)
ffffffffc0207a5a:	011c3823          	sd	a7,16(s8)
ffffffffc0207a5e:	e20508e3          	beqz	a0,ffffffffc020788e <stride_dequeue+0x1b16>
ffffffffc0207a62:	01853023          	sd	s8,0(a0)
ffffffffc0207a66:	8362                	mv	t1,s8
ffffffffc0207a68:	edcfe06f          	j	ffffffffc0206144 <stride_dequeue+0x3cc>
ffffffffc0207a6c:	008a3883          	ld	a7,8(s4)
ffffffffc0207a70:	010a3503          	ld	a0,16(s4)
ffffffffc0207a74:	859a                	mv	a1,t1
ffffffffc0207a76:	f446                	sd	a7,40(sp)
ffffffffc0207a78:	900fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207a7c:	78a2                	ld	a7,40(sp)
ffffffffc0207a7e:	00aa3423          	sd	a0,8(s4)
ffffffffc0207a82:	7842                	ld	a6,48(sp)
ffffffffc0207a84:	011a3823          	sd	a7,16(s4)
ffffffffc0207a88:	d11d                	beqz	a0,ffffffffc02079ae <stride_dequeue+0x1c36>
ffffffffc0207a8a:	01453023          	sd	s4,0(a0)
ffffffffc0207a8e:	8352                	mv	t1,s4
ffffffffc0207a90:	a89fe06f          	j	ffffffffc0206518 <stride_dequeue+0x7a0>
ffffffffc0207a94:	0088b303          	ld	t1,8(a7)
ffffffffc0207a98:	0108b503          	ld	a0,16(a7)
ffffffffc0207a9c:	85be                	mv	a1,a5
ffffffffc0207a9e:	f41a                	sd	t1,40(sp)
ffffffffc0207aa0:	8d8fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207aa4:	78c2                	ld	a7,48(sp)
ffffffffc0207aa6:	7322                	ld	t1,40(sp)
ffffffffc0207aa8:	00a8b423          	sd	a0,8(a7)
ffffffffc0207aac:	0068b823          	sd	t1,16(a7)
ffffffffc0207ab0:	5c050b63          	beqz	a0,ffffffffc0208086 <stride_dequeue+0x230e>
ffffffffc0207ab4:	01153023          	sd	a7,0(a0)
ffffffffc0207ab8:	87c6                	mv	a5,a7
ffffffffc0207aba:	c28ff06f          	j	ffffffffc0206ee2 <stride_dequeue+0x116a>
ffffffffc0207abe:	0088b803          	ld	a6,8(a7)
ffffffffc0207ac2:	0108b503          	ld	a0,16(a7)
ffffffffc0207ac6:	859a                	mv	a1,t1
ffffffffc0207ac8:	f442                	sd	a6,40(sp)
ffffffffc0207aca:	8aefe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207ace:	78c2                	ld	a7,48(sp)
ffffffffc0207ad0:	7822                	ld	a6,40(sp)
ffffffffc0207ad2:	00a8b423          	sd	a0,8(a7)
ffffffffc0207ad6:	0108b823          	sd	a6,16(a7)
ffffffffc0207ada:	b6050ae3          	beqz	a0,ffffffffc020764e <stride_dequeue+0x18d6>
ffffffffc0207ade:	01153023          	sd	a7,0(a0)
ffffffffc0207ae2:	8346                	mv	t1,a7
ffffffffc0207ae4:	ef7fe06f          	j	ffffffffc02069da <stride_dequeue+0xc62>
ffffffffc0207ae8:	008a3883          	ld	a7,8(s4)
ffffffffc0207aec:	010a3503          	ld	a0,16(s4)
ffffffffc0207af0:	859a                	mv	a1,t1
ffffffffc0207af2:	f446                	sd	a7,40(sp)
ffffffffc0207af4:	884fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207af8:	78a2                	ld	a7,40(sp)
ffffffffc0207afa:	00aa3423          	sd	a0,8(s4)
ffffffffc0207afe:	7842                	ld	a6,48(sp)
ffffffffc0207b00:	011a3823          	sd	a7,16(s4)
ffffffffc0207b04:	ea0508e3          	beqz	a0,ffffffffc02079b4 <stride_dequeue+0x1c3c>
ffffffffc0207b08:	01453023          	sd	s4,0(a0)
ffffffffc0207b0c:	8352                	mv	t1,s4
ffffffffc0207b0e:	ae3fe06f          	j	ffffffffc02065f0 <stride_dequeue+0x878>
ffffffffc0207b12:	87e2                	mv	a5,s8
ffffffffc0207b14:	f56fe06f          	j	ffffffffc020626a <stride_dequeue+0x4f2>
ffffffffc0207b18:	884e                	mv	a6,s3
ffffffffc0207b1a:	853fe06f          	j	ffffffffc020636c <stride_dequeue+0x5f4>
ffffffffc0207b1e:	884e                	mv	a6,s3
ffffffffc0207b20:	ca1fe06f          	j	ffffffffc02067c0 <stride_dequeue+0xa48>
ffffffffc0207b24:	8866                	mv	a6,s9
ffffffffc0207b26:	d63fe06f          	j	ffffffffc0206888 <stride_dequeue+0xb10>
ffffffffc0207b2a:	8866                	mv	a6,s9
ffffffffc0207b2c:	e21fe06f          	j	ffffffffc020694c <stride_dequeue+0xbd4>
ffffffffc0207b30:	8d66                	mv	s10,s9
ffffffffc0207b32:	92bfe06f          	j	ffffffffc020645c <stride_dequeue+0x6e4>
ffffffffc0207b36:	008d3783          	ld	a5,8(s10)
ffffffffc0207b3a:	010d3503          	ld	a0,16(s10)
ffffffffc0207b3e:	85a2                	mv	a1,s0
ffffffffc0207b40:	ec3e                	sd	a5,24(sp)
ffffffffc0207b42:	836fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207b46:	67e2                	ld	a5,24(sp)
ffffffffc0207b48:	00ad3423          	sd	a0,8(s10)
ffffffffc0207b4c:	00fd3823          	sd	a5,16(s10)
ffffffffc0207b50:	c0050563          	beqz	a0,ffffffffc0206f5a <stride_dequeue+0x11e2>
ffffffffc0207b54:	01a53023          	sd	s10,0(a0)
ffffffffc0207b58:	c02ff06f          	j	ffffffffc0206f5a <stride_dequeue+0x11e2>
ffffffffc0207b5c:	0088b803          	ld	a6,8(a7)
ffffffffc0207b60:	0108b503          	ld	a0,16(a7)
ffffffffc0207b64:	859a                	mv	a1,t1
ffffffffc0207b66:	f442                	sd	a6,40(sp)
ffffffffc0207b68:	810fe0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207b6c:	78c2                	ld	a7,48(sp)
ffffffffc0207b6e:	7822                	ld	a6,40(sp)
ffffffffc0207b70:	00a8b423          	sd	a0,8(a7)
ffffffffc0207b74:	0108b823          	sd	a6,16(a7)
ffffffffc0207b78:	a6050863          	beqz	a0,ffffffffc0206de8 <stride_dequeue+0x1070>
ffffffffc0207b7c:	01153023          	sd	a7,0(a0)
ffffffffc0207b80:	a68ff06f          	j	ffffffffc0206de8 <stride_dequeue+0x1070>
ffffffffc0207b84:	00883303          	ld	t1,8(a6)
ffffffffc0207b88:	01083503          	ld	a0,16(a6)
ffffffffc0207b8c:	85d2                	mv	a1,s4
ffffffffc0207b8e:	f41a                	sd	t1,40(sp)
ffffffffc0207b90:	fe9fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207b94:	7842                	ld	a6,48(sp)
ffffffffc0207b96:	7322                	ld	t1,40(sp)
ffffffffc0207b98:	78e2                	ld	a7,56(sp)
ffffffffc0207b9a:	00a83423          	sd	a0,8(a6)
ffffffffc0207b9e:	00683823          	sd	t1,16(a6)
ffffffffc0207ba2:	0a0500e3          	beqz	a0,ffffffffc0208442 <stride_dequeue+0x26ca>
ffffffffc0207ba6:	01053023          	sd	a6,0(a0)
ffffffffc0207baa:	8a42                	mv	s4,a6
ffffffffc0207bac:	fb0ff06f          	j	ffffffffc020735c <stride_dequeue+0x15e4>
ffffffffc0207bb0:	008d3783          	ld	a5,8(s10)
ffffffffc0207bb4:	010d3503          	ld	a0,16(s10)
ffffffffc0207bb8:	85b2                	mv	a1,a2
ffffffffc0207bba:	f03e                	sd	a5,32(sp)
ffffffffc0207bbc:	fbdfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207bc0:	7782                	ld	a5,32(sp)
ffffffffc0207bc2:	00ad3423          	sd	a0,8(s10)
ffffffffc0207bc6:	00fd3823          	sd	a5,16(s10)
ffffffffc0207bca:	f2050b63          	beqz	a0,ffffffffc0207300 <stride_dequeue+0x1588>
ffffffffc0207bce:	01a53023          	sd	s10,0(a0)
ffffffffc0207bd2:	f2eff06f          	j	ffffffffc0207300 <stride_dequeue+0x1588>
ffffffffc0207bd6:	0089b883          	ld	a7,8(s3)
ffffffffc0207bda:	0109b503          	ld	a0,16(s3)
ffffffffc0207bde:	859a                	mv	a1,t1
ffffffffc0207be0:	f446                	sd	a7,40(sp)
ffffffffc0207be2:	f97fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207be6:	78a2                	ld	a7,40(sp)
ffffffffc0207be8:	00a9b423          	sd	a0,8(s3)
ffffffffc0207bec:	7842                	ld	a6,48(sp)
ffffffffc0207bee:	0119b823          	sd	a7,16(s3)
ffffffffc0207bf2:	e119                	bnez	a0,ffffffffc0207bf8 <stride_dequeue+0x1e80>
ffffffffc0207bf4:	f6afe06f          	j	ffffffffc020635e <stride_dequeue+0x5e6>
ffffffffc0207bf8:	01353023          	sd	s3,0(a0)
ffffffffc0207bfc:	f62fe06f          	j	ffffffffc020635e <stride_dequeue+0x5e6>
ffffffffc0207c00:	00883783          	ld	a5,8(a6)
ffffffffc0207c04:	01083503          	ld	a0,16(a6)
ffffffffc0207c08:	85e6                	mv	a1,s9
ffffffffc0207c0a:	f03e                	sd	a5,32(sp)
ffffffffc0207c0c:	f6dfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207c10:	7822                	ld	a6,40(sp)
ffffffffc0207c12:	7782                	ld	a5,32(sp)
ffffffffc0207c14:	00a83423          	sd	a0,8(a6)
ffffffffc0207c18:	00f83823          	sd	a5,16(a6)
ffffffffc0207c1c:	da050963          	beqz	a0,ffffffffc02071ce <stride_dequeue+0x1456>
ffffffffc0207c20:	01053023          	sd	a6,0(a0)
ffffffffc0207c24:	daaff06f          	j	ffffffffc02071ce <stride_dequeue+0x1456>
ffffffffc0207c28:	8d22                	mv	s10,s0
ffffffffc0207c2a:	b30ff06f          	j	ffffffffc0206f5a <stride_dequeue+0x11e2>
ffffffffc0207c2e:	00883783          	ld	a5,8(a6)
ffffffffc0207c32:	01083503          	ld	a0,16(a6)
ffffffffc0207c36:	85e6                	mv	a1,s9
ffffffffc0207c38:	f03e                	sd	a5,32(sp)
ffffffffc0207c3a:	f3ffd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207c3e:	7822                	ld	a6,40(sp)
ffffffffc0207c40:	7782                	ld	a5,32(sp)
ffffffffc0207c42:	00a83423          	sd	a0,8(a6)
ffffffffc0207c46:	00f83823          	sd	a5,16(a6)
ffffffffc0207c4a:	e0050f63          	beqz	a0,ffffffffc0207268 <stride_dequeue+0x14f0>
ffffffffc0207c4e:	01053023          	sd	a6,0(a0)
ffffffffc0207c52:	e16ff06f          	j	ffffffffc0207268 <stride_dequeue+0x14f0>
ffffffffc0207c56:	00883783          	ld	a5,8(a6)
ffffffffc0207c5a:	01083503          	ld	a0,16(a6)
ffffffffc0207c5e:	85e6                	mv	a1,s9
ffffffffc0207c60:	f03e                	sd	a5,32(sp)
ffffffffc0207c62:	f17fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207c66:	7822                	ld	a6,40(sp)
ffffffffc0207c68:	7782                	ld	a5,32(sp)
ffffffffc0207c6a:	00a83423          	sd	a0,8(a6)
ffffffffc0207c6e:	00f83823          	sd	a5,16(a6)
ffffffffc0207c72:	c2050363          	beqz	a0,ffffffffc0207098 <stride_dequeue+0x1320>
ffffffffc0207c76:	01053023          	sd	a6,0(a0)
ffffffffc0207c7a:	c1eff06f          	j	ffffffffc0207098 <stride_dequeue+0x1320>
ffffffffc0207c7e:	008cb883          	ld	a7,8(s9)
ffffffffc0207c82:	010cb503          	ld	a0,16(s9)
ffffffffc0207c86:	859a                	mv	a1,t1
ffffffffc0207c88:	f446                	sd	a7,40(sp)
ffffffffc0207c8a:	eeffd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207c8e:	78a2                	ld	a7,40(sp)
ffffffffc0207c90:	00acb423          	sd	a0,8(s9)
ffffffffc0207c94:	7842                	ld	a6,48(sp)
ffffffffc0207c96:	011cb823          	sd	a7,16(s9)
ffffffffc0207c9a:	e119                	bnez	a0,ffffffffc0207ca0 <stride_dequeue+0x1f28>
ffffffffc0207c9c:	bdffe06f          	j	ffffffffc020687a <stride_dequeue+0xb02>
ffffffffc0207ca0:	01953023          	sd	s9,0(a0)
ffffffffc0207ca4:	bd7fe06f          	j	ffffffffc020687a <stride_dequeue+0xb02>
ffffffffc0207ca8:	0088b303          	ld	t1,8(a7)
ffffffffc0207cac:	0108b503          	ld	a0,16(a7)
ffffffffc0207cb0:	85c2                	mv	a1,a6
ffffffffc0207cb2:	f41a                	sd	t1,40(sp)
ffffffffc0207cb4:	ec5fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207cb8:	78c2                	ld	a7,48(sp)
ffffffffc0207cba:	7322                	ld	t1,40(sp)
ffffffffc0207cbc:	00a8b423          	sd	a0,8(a7)
ffffffffc0207cc0:	0068b823          	sd	t1,16(a7)
ffffffffc0207cc4:	7c050c63          	beqz	a0,ffffffffc020849c <stride_dequeue+0x2724>
ffffffffc0207cc8:	01153023          	sd	a7,0(a0)
ffffffffc0207ccc:	8846                	mv	a6,a7
ffffffffc0207cce:	ff4ff06f          	j	ffffffffc02074c2 <stride_dequeue+0x174a>
ffffffffc0207cd2:	008cb783          	ld	a5,8(s9)
ffffffffc0207cd6:	010cb503          	ld	a0,16(s9)
ffffffffc0207cda:	85c2                	mv	a1,a6
ffffffffc0207cdc:	f03e                	sd	a5,32(sp)
ffffffffc0207cde:	e9bfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207ce2:	7782                	ld	a5,32(sp)
ffffffffc0207ce4:	00acb423          	sd	a0,8(s9)
ffffffffc0207ce8:	00fcb823          	sd	a5,16(s9)
ffffffffc0207cec:	e119                	bnez	a0,ffffffffc0207cf2 <stride_dequeue+0x1f7a>
ffffffffc0207cee:	db1fe06f          	j	ffffffffc0206a9e <stride_dequeue+0xd26>
ffffffffc0207cf2:	01953023          	sd	s9,0(a0)
ffffffffc0207cf6:	da9fe06f          	j	ffffffffc0206a9e <stride_dequeue+0xd26>
ffffffffc0207cfa:	008cb883          	ld	a7,8(s9)
ffffffffc0207cfe:	010cb503          	ld	a0,16(s9)
ffffffffc0207d02:	859a                	mv	a1,t1
ffffffffc0207d04:	f446                	sd	a7,40(sp)
ffffffffc0207d06:	e73fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207d0a:	78a2                	ld	a7,40(sp)
ffffffffc0207d0c:	00acb423          	sd	a0,8(s9)
ffffffffc0207d10:	7842                	ld	a6,48(sp)
ffffffffc0207d12:	011cb823          	sd	a7,16(s9)
ffffffffc0207d16:	e119                	bnez	a0,ffffffffc0207d1c <stride_dequeue+0x1fa4>
ffffffffc0207d18:	c27fe06f          	j	ffffffffc020693e <stride_dequeue+0xbc6>
ffffffffc0207d1c:	01953023          	sd	s9,0(a0)
ffffffffc0207d20:	c1ffe06f          	j	ffffffffc020693e <stride_dequeue+0xbc6>
ffffffffc0207d24:	008cb783          	ld	a5,8(s9)
ffffffffc0207d28:	010cb503          	ld	a0,16(s9)
ffffffffc0207d2c:	85ba                	mv	a1,a4
ffffffffc0207d2e:	f03e                	sd	a5,32(sp)
ffffffffc0207d30:	e49fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207d34:	7782                	ld	a5,32(sp)
ffffffffc0207d36:	00acb423          	sd	a0,8(s9)
ffffffffc0207d3a:	00fcb823          	sd	a5,16(s9)
ffffffffc0207d3e:	e119                	bnez	a0,ffffffffc0207d44 <stride_dequeue+0x1fcc>
ffffffffc0207d40:	9adfe06f          	j	ffffffffc02066ec <stride_dequeue+0x974>
ffffffffc0207d44:	01953023          	sd	s9,0(a0)
ffffffffc0207d48:	9a5fe06f          	j	ffffffffc02066ec <stride_dequeue+0x974>
ffffffffc0207d4c:	0089b883          	ld	a7,8(s3)
ffffffffc0207d50:	0109b503          	ld	a0,16(s3)
ffffffffc0207d54:	859a                	mv	a1,t1
ffffffffc0207d56:	f446                	sd	a7,40(sp)
ffffffffc0207d58:	e21fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207d5c:	78a2                	ld	a7,40(sp)
ffffffffc0207d5e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207d62:	7842                	ld	a6,48(sp)
ffffffffc0207d64:	0119b823          	sd	a7,16(s3)
ffffffffc0207d68:	e119                	bnez	a0,ffffffffc0207d6e <stride_dequeue+0x1ff6>
ffffffffc0207d6a:	a49fe06f          	j	ffffffffc02067b2 <stride_dequeue+0xa3a>
ffffffffc0207d6e:	01353023          	sd	s3,0(a0)
ffffffffc0207d72:	a41fe06f          	j	ffffffffc02067b2 <stride_dequeue+0xa3a>
ffffffffc0207d76:	0088b303          	ld	t1,8(a7)
ffffffffc0207d7a:	0108b503          	ld	a0,16(a7)
ffffffffc0207d7e:	85be                	mv	a1,a5
ffffffffc0207d80:	f41a                	sd	t1,40(sp)
ffffffffc0207d82:	df7fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207d86:	78c2                	ld	a7,48(sp)
ffffffffc0207d88:	7322                	ld	t1,40(sp)
ffffffffc0207d8a:	00a8b423          	sd	a0,8(a7)
ffffffffc0207d8e:	0068b823          	sd	t1,16(a7)
ffffffffc0207d92:	6e050963          	beqz	a0,ffffffffc0208484 <stride_dequeue+0x270c>
ffffffffc0207d96:	01153023          	sd	a7,0(a0)
ffffffffc0207d9a:	87c6                	mv	a5,a7
ffffffffc0207d9c:	ecaff06f          	j	ffffffffc0207466 <stride_dequeue+0x16ee>
ffffffffc0207da0:	0088b303          	ld	t1,8(a7)
ffffffffc0207da4:	0108b503          	ld	a0,16(a7)
ffffffffc0207da8:	85be                	mv	a1,a5
ffffffffc0207daa:	f41a                	sd	t1,40(sp)
ffffffffc0207dac:	dcdfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207db0:	78c2                	ld	a7,48(sp)
ffffffffc0207db2:	7322                	ld	t1,40(sp)
ffffffffc0207db4:	00a8b423          	sd	a0,8(a7)
ffffffffc0207db8:	0068b823          	sd	t1,16(a7)
ffffffffc0207dbc:	6a050b63          	beqz	a0,ffffffffc0208472 <stride_dequeue+0x26fa>
ffffffffc0207dc0:	01153023          	sd	a7,0(a0)
ffffffffc0207dc4:	87c6                	mv	a5,a7
ffffffffc0207dc6:	e4aff06f          	j	ffffffffc0207410 <stride_dequeue+0x1698>
ffffffffc0207dca:	0088b303          	ld	t1,8(a7)
ffffffffc0207dce:	0108b503          	ld	a0,16(a7)
ffffffffc0207dd2:	85c2                	mv	a1,a6
ffffffffc0207dd4:	f41a                	sd	t1,40(sp)
ffffffffc0207dd6:	da3fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207dda:	78c2                	ld	a7,48(sp)
ffffffffc0207ddc:	7322                	ld	t1,40(sp)
ffffffffc0207dde:	00a8b423          	sd	a0,8(a7)
ffffffffc0207de2:	0068b823          	sd	t1,16(a7)
ffffffffc0207de6:	68050963          	beqz	a0,ffffffffc0208478 <stride_dequeue+0x2700>
ffffffffc0207dea:	01153023          	sd	a7,0(a0)
ffffffffc0207dee:	8846                	mv	a6,a7
ffffffffc0207df0:	dcaff06f          	j	ffffffffc02073ba <stride_dequeue+0x1642>
ffffffffc0207df4:	008cb783          	ld	a5,8(s9)
ffffffffc0207df8:	010cb503          	ld	a0,16(s9)
ffffffffc0207dfc:	85c2                	mv	a1,a6
ffffffffc0207dfe:	f03e                	sd	a5,32(sp)
ffffffffc0207e00:	d79fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207e04:	7782                	ld	a5,32(sp)
ffffffffc0207e06:	00acb423          	sd	a0,8(s9)
ffffffffc0207e0a:	00fcb823          	sd	a5,16(s9)
ffffffffc0207e0e:	e119                	bnez	a0,ffffffffc0207e14 <stride_dequeue+0x209c>
ffffffffc0207e10:	e1bfe06f          	j	ffffffffc0206c2a <stride_dequeue+0xeb2>
ffffffffc0207e14:	01953023          	sd	s9,0(a0)
ffffffffc0207e18:	e13fe06f          	j	ffffffffc0206c2a <stride_dequeue+0xeb2>
ffffffffc0207e1c:	00883783          	ld	a5,8(a6)
ffffffffc0207e20:	01083503          	ld	a0,16(a6)
ffffffffc0207e24:	85ea                	mv	a1,s10
ffffffffc0207e26:	f03e                	sd	a5,32(sp)
ffffffffc0207e28:	d51fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207e2c:	7822                	ld	a6,40(sp)
ffffffffc0207e2e:	7782                	ld	a5,32(sp)
ffffffffc0207e30:	00a83423          	sd	a0,8(a6)
ffffffffc0207e34:	00f83823          	sd	a5,16(a6)
ffffffffc0207e38:	ae050e63          	beqz	a0,ffffffffc0207134 <stride_dequeue+0x13bc>
ffffffffc0207e3c:	01053023          	sd	a6,0(a0)
ffffffffc0207e40:	af4ff06f          	j	ffffffffc0207134 <stride_dequeue+0x13bc>
ffffffffc0207e44:	008c3883          	ld	a7,8(s8)
ffffffffc0207e48:	010c3503          	ld	a0,16(s8)
ffffffffc0207e4c:	859a                	mv	a1,t1
ffffffffc0207e4e:	f446                	sd	a7,40(sp)
ffffffffc0207e50:	d29fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207e54:	78a2                	ld	a7,40(sp)
ffffffffc0207e56:	00ac3423          	sd	a0,8(s8)
ffffffffc0207e5a:	77c2                	ld	a5,48(sp)
ffffffffc0207e5c:	011c3823          	sd	a7,16(s8)
ffffffffc0207e60:	e119                	bnez	a0,ffffffffc0207e66 <stride_dequeue+0x20ee>
ffffffffc0207e62:	bfcfe06f          	j	ffffffffc020625e <stride_dequeue+0x4e6>
ffffffffc0207e66:	01853023          	sd	s8,0(a0)
ffffffffc0207e6a:	bf4fe06f          	j	ffffffffc020625e <stride_dequeue+0x4e6>
ffffffffc0207e6e:	00883783          	ld	a5,8(a6)
ffffffffc0207e72:	01083503          	ld	a0,16(a6)
ffffffffc0207e76:	85ea                	mv	a1,s10
ffffffffc0207e78:	f03e                	sd	a5,32(sp)
ffffffffc0207e7a:	cfffd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207e7e:	7822                	ld	a6,40(sp)
ffffffffc0207e80:	7782                	ld	a5,32(sp)
ffffffffc0207e82:	00a83423          	sd	a0,8(a6)
ffffffffc0207e86:	00f83823          	sd	a5,16(a6)
ffffffffc0207e8a:	96050963          	beqz	a0,ffffffffc0206ffc <stride_dequeue+0x1284>
ffffffffc0207e8e:	01053023          	sd	a6,0(a0)
ffffffffc0207e92:	96aff06f          	j	ffffffffc0206ffc <stride_dequeue+0x1284>
ffffffffc0207e96:	008d3783          	ld	a5,8(s10)
ffffffffc0207e9a:	010d3503          	ld	a0,16(s10)
ffffffffc0207e9e:	85c2                	mv	a1,a6
ffffffffc0207ea0:	f03e                	sd	a5,32(sp)
ffffffffc0207ea2:	cd7fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207ea6:	7782                	ld	a5,32(sp)
ffffffffc0207ea8:	00ad3423          	sd	a0,8(s10)
ffffffffc0207eac:	00fd3823          	sd	a5,16(s10)
ffffffffc0207eb0:	e119                	bnez	a0,ffffffffc0207eb6 <stride_dequeue+0x213e>
ffffffffc0207eb2:	cb3fe06f          	j	ffffffffc0206b64 <stride_dequeue+0xdec>
ffffffffc0207eb6:	01a53023          	sd	s10,0(a0)
ffffffffc0207eba:	cabfe06f          	j	ffffffffc0206b64 <stride_dequeue+0xdec>
ffffffffc0207ebe:	0088b803          	ld	a6,8(a7)
ffffffffc0207ec2:	0108b503          	ld	a0,16(a7)
ffffffffc0207ec6:	859a                	mv	a1,t1
ffffffffc0207ec8:	f442                	sd	a6,40(sp)
ffffffffc0207eca:	caffd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207ece:	78c2                	ld	a7,48(sp)
ffffffffc0207ed0:	7822                	ld	a6,40(sp)
ffffffffc0207ed2:	00a8b423          	sd	a0,8(a7)
ffffffffc0207ed6:	0108b823          	sd	a6,16(a7)
ffffffffc0207eda:	e119                	bnez	a0,ffffffffc0207ee0 <stride_dequeue+0x2168>
ffffffffc0207edc:	de5fe06f          	j	ffffffffc0206cc0 <stride_dequeue+0xf48>
ffffffffc0207ee0:	01153023          	sd	a7,0(a0)
ffffffffc0207ee4:	dddfe06f          	j	ffffffffc0206cc0 <stride_dequeue+0xf48>
ffffffffc0207ee8:	0088b803          	ld	a6,8(a7)
ffffffffc0207eec:	0108b503          	ld	a0,16(a7)
ffffffffc0207ef0:	859a                	mv	a1,t1
ffffffffc0207ef2:	f442                	sd	a6,40(sp)
ffffffffc0207ef4:	c85fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207ef8:	78c2                	ld	a7,48(sp)
ffffffffc0207efa:	7822                	ld	a6,40(sp)
ffffffffc0207efc:	00a8b423          	sd	a0,8(a7)
ffffffffc0207f00:	0108b823          	sd	a6,16(a7)
ffffffffc0207f04:	e119                	bnez	a0,ffffffffc0207f0a <stride_dequeue+0x2192>
ffffffffc0207f06:	e51fe06f          	j	ffffffffc0206d56 <stride_dequeue+0xfde>
ffffffffc0207f0a:	01153023          	sd	a7,0(a0)
ffffffffc0207f0e:	e49fe06f          	j	ffffffffc0206d56 <stride_dequeue+0xfde>
ffffffffc0207f12:	008cb883          	ld	a7,8(s9)
ffffffffc0207f16:	010cb503          	ld	a0,16(s9)
ffffffffc0207f1a:	859a                	mv	a1,t1
ffffffffc0207f1c:	f446                	sd	a7,40(sp)
ffffffffc0207f1e:	c5bfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207f22:	78a2                	ld	a7,40(sp)
ffffffffc0207f24:	00acb423          	sd	a0,8(s9)
ffffffffc0207f28:	7642                	ld	a2,48(sp)
ffffffffc0207f2a:	011cb823          	sd	a7,16(s9)
ffffffffc0207f2e:	e119                	bnez	a0,ffffffffc0207f34 <stride_dequeue+0x21bc>
ffffffffc0207f30:	d1efe06f          	j	ffffffffc020644e <stride_dequeue+0x6d6>
ffffffffc0207f34:	01953023          	sd	s9,0(a0)
ffffffffc0207f38:	d16fe06f          	j	ffffffffc020644e <stride_dequeue+0x6d6>
ffffffffc0207f3c:	0088b803          	ld	a6,8(a7)
ffffffffc0207f40:	0108b503          	ld	a0,16(a7)
ffffffffc0207f44:	859a                	mv	a1,t1
ffffffffc0207f46:	f442                	sd	a6,40(sp)
ffffffffc0207f48:	c31fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207f4c:	78c2                	ld	a7,48(sp)
ffffffffc0207f4e:	7822                	ld	a6,40(sp)
ffffffffc0207f50:	00a8b423          	sd	a0,8(a7)
ffffffffc0207f54:	0108b823          	sd	a6,16(a7)
ffffffffc0207f58:	e119                	bnez	a0,ffffffffc0207f5e <stride_dequeue+0x21e6>
ffffffffc0207f5a:	f25fe06f          	j	ffffffffc0206e7e <stride_dequeue+0x1106>
ffffffffc0207f5e:	01153023          	sd	a7,0(a0)
ffffffffc0207f62:	f1dfe06f          	j	ffffffffc0206e7e <stride_dequeue+0x1106>
ffffffffc0207f66:	886a                	mv	a6,s10
ffffffffc0207f68:	894ff06f          	j	ffffffffc0206ffc <stride_dequeue+0x1284>
ffffffffc0207f6c:	886a                	mv	a6,s10
ffffffffc0207f6e:	9c6ff06f          	j	ffffffffc0207134 <stride_dequeue+0x13bc>
ffffffffc0207f72:	8d32                	mv	s10,a2
ffffffffc0207f74:	b8cff06f          	j	ffffffffc0207300 <stride_dequeue+0x1588>
ffffffffc0207f78:	8866                	mv	a6,s9
ffffffffc0207f7a:	91eff06f          	j	ffffffffc0207098 <stride_dequeue+0x1320>
ffffffffc0207f7e:	8866                	mv	a6,s9
ffffffffc0207f80:	ae8ff06f          	j	ffffffffc0207268 <stride_dequeue+0x14f0>
ffffffffc0207f84:	8866                	mv	a6,s9
ffffffffc0207f86:	a48ff06f          	j	ffffffffc02071ce <stride_dequeue+0x1456>
ffffffffc0207f8a:	889a                	mv	a7,t1
ffffffffc0207f8c:	d35fe06f          	j	ffffffffc0206cc0 <stride_dequeue+0xf48>
ffffffffc0207f90:	889a                	mv	a7,t1
ffffffffc0207f92:	dc5fe06f          	j	ffffffffc0206d56 <stride_dequeue+0xfde>
ffffffffc0207f96:	899a                	mv	s3,t1
ffffffffc0207f98:	81bfe06f          	j	ffffffffc02067b2 <stride_dequeue+0xa3a>
ffffffffc0207f9c:	8c9a                	mv	s9,t1
ffffffffc0207f9e:	cb0fe06f          	j	ffffffffc020644e <stride_dequeue+0x6d6>
ffffffffc0207fa2:	889a                	mv	a7,t1
ffffffffc0207fa4:	edbfe06f          	j	ffffffffc0206e7e <stride_dequeue+0x1106>
ffffffffc0207fa8:	0087b803          	ld	a6,8(a5)
ffffffffc0207fac:	6b88                	ld	a0,16(a5)
ffffffffc0207fae:	85ea                	mv	a1,s10
ffffffffc0207fb0:	f43e                	sd	a5,40(sp)
ffffffffc0207fb2:	f042                	sd	a6,32(sp)
ffffffffc0207fb4:	bc5fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207fb8:	77a2                	ld	a5,40(sp)
ffffffffc0207fba:	7802                	ld	a6,32(sp)
ffffffffc0207fbc:	e788                	sd	a0,8(a5)
ffffffffc0207fbe:	0107b823          	sd	a6,16(a5)
ffffffffc0207fc2:	4c050463          	beqz	a0,ffffffffc020848a <stride_dequeue+0x2712>
ffffffffc0207fc6:	e11c                	sd	a5,0(a0)
ffffffffc0207fc8:	8d3e                	mv	s10,a5
ffffffffc0207fca:	dc8ff06f          	j	ffffffffc0207592 <stride_dequeue+0x181a>
ffffffffc0207fce:	8c1a                	mv	s8,t1
ffffffffc0207fd0:	a8efe06f          	j	ffffffffc020625e <stride_dequeue+0x4e6>
ffffffffc0207fd4:	008d3803          	ld	a6,8(s10)
ffffffffc0207fd8:	010d3503          	ld	a0,16(s10)
ffffffffc0207fdc:	85b2                	mv	a1,a2
ffffffffc0207fde:	f042                	sd	a6,32(sp)
ffffffffc0207fe0:	b99fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0207fe4:	7802                	ld	a6,32(sp)
ffffffffc0207fe6:	00ad3423          	sd	a0,8(s10)
ffffffffc0207fea:	010d3823          	sd	a6,16(s10)
ffffffffc0207fee:	e119                	bnez	a0,ffffffffc0207ff4 <stride_dequeue+0x227c>
ffffffffc0207ff0:	f5dfe06f          	j	ffffffffc0206f4c <stride_dequeue+0x11d4>
ffffffffc0207ff4:	01a53023          	sd	s10,0(a0)
ffffffffc0207ff8:	f55fe06f          	j	ffffffffc0206f4c <stride_dequeue+0x11d4>
ffffffffc0207ffc:	0087b803          	ld	a6,8(a5)
ffffffffc0208000:	6b88                	ld	a0,16(a5)
ffffffffc0208002:	85ce                	mv	a1,s3
ffffffffc0208004:	f43e                	sd	a5,40(sp)
ffffffffc0208006:	f042                	sd	a6,32(sp)
ffffffffc0208008:	b71fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020800c:	77a2                	ld	a5,40(sp)
ffffffffc020800e:	7802                	ld	a6,32(sp)
ffffffffc0208010:	e788                	sd	a0,8(a5)
ffffffffc0208012:	0107b823          	sd	a6,16(a5)
ffffffffc0208016:	3e050863          	beqz	a0,ffffffffc0208406 <stride_dequeue+0x268e>
ffffffffc020801a:	e11c                	sd	a5,0(a0)
ffffffffc020801c:	89be                	mv	s3,a5
ffffffffc020801e:	dc8ff06f          	j	ffffffffc02075e6 <stride_dequeue+0x186e>
ffffffffc0208022:	8c9a                	mv	s9,t1
ffffffffc0208024:	91bfe06f          	j	ffffffffc020693e <stride_dequeue+0xbc6>
ffffffffc0208028:	0087b803          	ld	a6,8(a5)
ffffffffc020802c:	6b88                	ld	a0,16(a5)
ffffffffc020802e:	85ea                	mv	a1,s10
ffffffffc0208030:	f43e                	sd	a5,40(sp)
ffffffffc0208032:	f042                	sd	a6,32(sp)
ffffffffc0208034:	b45fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208038:	77a2                	ld	a5,40(sp)
ffffffffc020803a:	7802                	ld	a6,32(sp)
ffffffffc020803c:	e788                	sd	a0,8(a5)
ffffffffc020803e:	0107b823          	sd	a6,16(a5)
ffffffffc0208042:	40050c63          	beqz	a0,ffffffffc020845a <stride_dequeue+0x26e2>
ffffffffc0208046:	e11c                	sd	a5,0(a0)
ffffffffc0208048:	8d3e                	mv	s10,a5
ffffffffc020804a:	cf4ff06f          	j	ffffffffc020753e <stride_dequeue+0x17c6>
ffffffffc020804e:	899a                	mv	s3,t1
ffffffffc0208050:	b0efe06f          	j	ffffffffc020635e <stride_dequeue+0x5e6>
ffffffffc0208054:	889a                	mv	a7,t1
ffffffffc0208056:	d93fe06f          	j	ffffffffc0206de8 <stride_dequeue+0x1070>
ffffffffc020805a:	8c9a                	mv	s9,t1
ffffffffc020805c:	81ffe06f          	j	ffffffffc020687a <stride_dequeue+0xb02>
ffffffffc0208060:	0087b803          	ld	a6,8(a5)
ffffffffc0208064:	6b88                	ld	a0,16(a5)
ffffffffc0208066:	85ea                	mv	a1,s10
ffffffffc0208068:	f43e                	sd	a5,40(sp)
ffffffffc020806a:	f042                	sd	a6,32(sp)
ffffffffc020806c:	b0dfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208070:	77a2                	ld	a5,40(sp)
ffffffffc0208072:	7802                	ld	a6,32(sp)
ffffffffc0208074:	e788                	sd	a0,8(a5)
ffffffffc0208076:	0107b823          	sd	a6,16(a5)
ffffffffc020807a:	42050463          	beqz	a0,ffffffffc02084a2 <stride_dequeue+0x272a>
ffffffffc020807e:	e11c                	sd	a5,0(a0)
ffffffffc0208080:	8d3e                	mv	s10,a5
ffffffffc0208082:	db8ff06f          	j	ffffffffc020763a <stride_dequeue+0x18c2>
ffffffffc0208086:	87c6                	mv	a5,a7
ffffffffc0208088:	e5bfe06f          	j	ffffffffc0206ee2 <stride_dequeue+0x116a>
ffffffffc020808c:	00883303          	ld	t1,8(a6)
ffffffffc0208090:	01083503          	ld	a0,16(a6)
ffffffffc0208094:	85c6                	mv	a1,a7
ffffffffc0208096:	f842                	sd	a6,48(sp)
ffffffffc0208098:	f41a                	sd	t1,40(sp)
ffffffffc020809a:	adffd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020809e:	7842                	ld	a6,48(sp)
ffffffffc02080a0:	7322                	ld	t1,40(sp)
ffffffffc02080a2:	00a83423          	sd	a0,8(a6)
ffffffffc02080a6:	00683823          	sd	t1,16(a6)
ffffffffc02080aa:	e119                	bnez	a0,ffffffffc02080b0 <stride_dequeue+0x2338>
ffffffffc02080ac:	f41fe06f          	j	ffffffffc0206fec <stride_dequeue+0x1274>
ffffffffc02080b0:	01053023          	sd	a6,0(a0)
ffffffffc02080b4:	f39fe06f          	j	ffffffffc0206fec <stride_dequeue+0x1274>
ffffffffc02080b8:	0088b303          	ld	t1,8(a7)
ffffffffc02080bc:	0108b503          	ld	a0,16(a7)
ffffffffc02080c0:	85be                	mv	a1,a5
ffffffffc02080c2:	f846                	sd	a7,48(sp)
ffffffffc02080c4:	f41a                	sd	t1,40(sp)
ffffffffc02080c6:	ab3fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02080ca:	78c2                	ld	a7,48(sp)
ffffffffc02080cc:	7322                	ld	t1,40(sp)
ffffffffc02080ce:	00a8b423          	sd	a0,8(a7)
ffffffffc02080d2:	0068b823          	sd	t1,16(a7)
ffffffffc02080d6:	3a050463          	beqz	a0,ffffffffc020847e <stride_dequeue+0x2706>
ffffffffc02080da:	01153023          	sd	a7,0(a0)
ffffffffc02080de:	87c6                	mv	a5,a7
ffffffffc02080e0:	85dff06f          	j	ffffffffc020793c <stride_dequeue+0x1bc4>
ffffffffc02080e4:	8d32                	mv	s10,a2
ffffffffc02080e6:	e67fe06f          	j	ffffffffc0206f4c <stride_dequeue+0x11d4>
ffffffffc02080ea:	008cb303          	ld	t1,8(s9)
ffffffffc02080ee:	010cb503          	ld	a0,16(s9)
ffffffffc02080f2:	85c6                	mv	a1,a7
ffffffffc02080f4:	f41a                	sd	t1,40(sp)
ffffffffc02080f6:	a83fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02080fa:	7322                	ld	t1,40(sp)
ffffffffc02080fc:	00acb423          	sd	a0,8(s9)
ffffffffc0208100:	7842                	ld	a6,48(sp)
ffffffffc0208102:	006cb823          	sd	t1,16(s9)
ffffffffc0208106:	e119                	bnez	a0,ffffffffc020810c <stride_dequeue+0x2394>
ffffffffc0208108:	b13fe06f          	j	ffffffffc0206c1a <stride_dequeue+0xea2>
ffffffffc020810c:	01953023          	sd	s9,0(a0)
ffffffffc0208110:	b0bfe06f          	j	ffffffffc0206c1a <stride_dequeue+0xea2>
ffffffffc0208114:	0088b303          	ld	t1,8(a7)
ffffffffc0208118:	0108b503          	ld	a0,16(a7)
ffffffffc020811c:	85ea                	mv	a1,s10
ffffffffc020811e:	fc32                	sd	a2,56(sp)
ffffffffc0208120:	f846                	sd	a7,48(sp)
ffffffffc0208122:	f41a                	sd	t1,40(sp)
ffffffffc0208124:	a55fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208128:	78c2                	ld	a7,48(sp)
ffffffffc020812a:	7322                	ld	t1,40(sp)
ffffffffc020812c:	7662                	ld	a2,56(sp)
ffffffffc020812e:	00a8b423          	sd	a0,8(a7)
ffffffffc0208132:	0068b823          	sd	t1,16(a7)
ffffffffc0208136:	30050c63          	beqz	a0,ffffffffc020844e <stride_dequeue+0x26d6>
ffffffffc020813a:	01153023          	sd	a7,0(a0)
ffffffffc020813e:	8d46                	mv	s10,a7
ffffffffc0208140:	fa4ff06f          	j	ffffffffc02078e4 <stride_dequeue+0x1b6c>
ffffffffc0208144:	00883303          	ld	t1,8(a6)
ffffffffc0208148:	01083503          	ld	a0,16(a6)
ffffffffc020814c:	85c6                	mv	a1,a7
ffffffffc020814e:	f842                	sd	a6,48(sp)
ffffffffc0208150:	f41a                	sd	t1,40(sp)
ffffffffc0208152:	a27fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208156:	7842                	ld	a6,48(sp)
ffffffffc0208158:	7322                	ld	t1,40(sp)
ffffffffc020815a:	00a83423          	sd	a0,8(a6)
ffffffffc020815e:	00683823          	sd	t1,16(a6)
ffffffffc0208162:	e119                	bnez	a0,ffffffffc0208168 <stride_dequeue+0x23f0>
ffffffffc0208164:	f25fe06f          	j	ffffffffc0207088 <stride_dequeue+0x1310>
ffffffffc0208168:	01053023          	sd	a6,0(a0)
ffffffffc020816c:	f1dfe06f          	j	ffffffffc0207088 <stride_dequeue+0x1310>
ffffffffc0208170:	00883303          	ld	t1,8(a6)
ffffffffc0208174:	01083503          	ld	a0,16(a6)
ffffffffc0208178:	85e6                	mv	a1,s9
ffffffffc020817a:	fc46                	sd	a7,56(sp)
ffffffffc020817c:	f842                	sd	a6,48(sp)
ffffffffc020817e:	f41a                	sd	t1,40(sp)
ffffffffc0208180:	9f9fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208184:	7842                	ld	a6,48(sp)
ffffffffc0208186:	7322                	ld	t1,40(sp)
ffffffffc0208188:	78e2                	ld	a7,56(sp)
ffffffffc020818a:	00a83423          	sd	a0,8(a6)
ffffffffc020818e:	00683823          	sd	t1,16(a6)
ffffffffc0208192:	28050f63          	beqz	a0,ffffffffc0208430 <stride_dequeue+0x26b8>
ffffffffc0208196:	01053023          	sd	a6,0(a0)
ffffffffc020819a:	8cc2                	mv	s9,a6
ffffffffc020819c:	e1cff06f          	j	ffffffffc02077b8 <stride_dequeue+0x1a40>
ffffffffc02081a0:	0088b303          	ld	t1,8(a7)
ffffffffc02081a4:	0108b503          	ld	a0,16(a7)
ffffffffc02081a8:	85c2                	mv	a1,a6
ffffffffc02081aa:	f846                	sd	a7,48(sp)
ffffffffc02081ac:	f41a                	sd	t1,40(sp)
ffffffffc02081ae:	9cbfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02081b2:	78c2                	ld	a7,48(sp)
ffffffffc02081b4:	7322                	ld	t1,40(sp)
ffffffffc02081b6:	00a8b423          	sd	a0,8(a7)
ffffffffc02081ba:	0068b823          	sd	t1,16(a7)
ffffffffc02081be:	26050c63          	beqz	a0,ffffffffc0208436 <stride_dequeue+0x26be>
ffffffffc02081c2:	01153023          	sd	a7,0(a0)
ffffffffc02081c6:	8846                	mv	a6,a7
ffffffffc02081c8:	cd6ff06f          	j	ffffffffc020769e <stride_dequeue+0x1926>
ffffffffc02081cc:	0088b303          	ld	t1,8(a7)
ffffffffc02081d0:	0108b503          	ld	a0,16(a7)
ffffffffc02081d4:	85c2                	mv	a1,a6
ffffffffc02081d6:	f846                	sd	a7,48(sp)
ffffffffc02081d8:	f41a                	sd	t1,40(sp)
ffffffffc02081da:	99ffd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02081de:	78c2                	ld	a7,48(sp)
ffffffffc02081e0:	7322                	ld	t1,40(sp)
ffffffffc02081e2:	00a8b423          	sd	a0,8(a7)
ffffffffc02081e6:	0068b823          	sd	t1,16(a7)
ffffffffc02081ea:	26050e63          	beqz	a0,ffffffffc0208466 <stride_dequeue+0x26ee>
ffffffffc02081ee:	01153023          	sd	a7,0(a0)
ffffffffc02081f2:	8846                	mv	a6,a7
ffffffffc02081f4:	e80ff06f          	j	ffffffffc0207874 <stride_dequeue+0x1afc>
ffffffffc02081f8:	008d3303          	ld	t1,8(s10)
ffffffffc02081fc:	010d3503          	ld	a0,16(s10)
ffffffffc0208200:	85c6                	mv	a1,a7
ffffffffc0208202:	f41a                	sd	t1,40(sp)
ffffffffc0208204:	975fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208208:	7322                	ld	t1,40(sp)
ffffffffc020820a:	00ad3423          	sd	a0,8(s10)
ffffffffc020820e:	7842                	ld	a6,48(sp)
ffffffffc0208210:	006d3823          	sd	t1,16(s10)
ffffffffc0208214:	e119                	bnez	a0,ffffffffc020821a <stride_dequeue+0x24a2>
ffffffffc0208216:	93ffe06f          	j	ffffffffc0206b54 <stride_dequeue+0xddc>
ffffffffc020821a:	01a53023          	sd	s10,0(a0)
ffffffffc020821e:	937fe06f          	j	ffffffffc0206b54 <stride_dequeue+0xddc>
ffffffffc0208222:	00883303          	ld	t1,8(a6)
ffffffffc0208226:	01083503          	ld	a0,16(a6)
ffffffffc020822a:	85e6                	mv	a1,s9
ffffffffc020822c:	fc46                	sd	a7,56(sp)
ffffffffc020822e:	f842                	sd	a6,48(sp)
ffffffffc0208230:	f41a                	sd	t1,40(sp)
ffffffffc0208232:	947fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208236:	7842                	ld	a6,48(sp)
ffffffffc0208238:	7322                	ld	t1,40(sp)
ffffffffc020823a:	78e2                	ld	a7,56(sp)
ffffffffc020823c:	00a83423          	sd	a0,8(a6)
ffffffffc0208240:	00683823          	sd	t1,16(a6)
ffffffffc0208244:	1c050a63          	beqz	a0,ffffffffc0208418 <stride_dequeue+0x26a0>
ffffffffc0208248:	01053023          	sd	a6,0(a0)
ffffffffc020824c:	8cc2                	mv	s9,a6
ffffffffc020824e:	fb6ff06f          	j	ffffffffc0207a04 <stride_dequeue+0x1c8c>
ffffffffc0208252:	00883303          	ld	t1,8(a6)
ffffffffc0208256:	01083503          	ld	a0,16(a6)
ffffffffc020825a:	85ce                	mv	a1,s3
ffffffffc020825c:	fc46                	sd	a7,56(sp)
ffffffffc020825e:	f842                	sd	a6,48(sp)
ffffffffc0208260:	f41a                	sd	t1,40(sp)
ffffffffc0208262:	917fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208266:	7842                	ld	a6,48(sp)
ffffffffc0208268:	7322                	ld	t1,40(sp)
ffffffffc020826a:	78e2                	ld	a7,56(sp)
ffffffffc020826c:	00a83423          	sd	a0,8(a6)
ffffffffc0208270:	00683823          	sd	t1,16(a6)
ffffffffc0208274:	22050163          	beqz	a0,ffffffffc0208496 <stride_dequeue+0x271e>
ffffffffc0208278:	01053023          	sd	a6,0(a0)
ffffffffc020827c:	89c2                	mv	s3,a6
ffffffffc020827e:	f1cff06f          	j	ffffffffc020799a <stride_dequeue+0x1c22>
ffffffffc0208282:	008cb303          	ld	t1,8(s9)
ffffffffc0208286:	010cb503          	ld	a0,16(s9)
ffffffffc020828a:	85c6                	mv	a1,a7
ffffffffc020828c:	f41a                	sd	t1,40(sp)
ffffffffc020828e:	8ebfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208292:	7322                	ld	t1,40(sp)
ffffffffc0208294:	00acb423          	sd	a0,8(s9)
ffffffffc0208298:	7842                	ld	a6,48(sp)
ffffffffc020829a:	006cb823          	sd	t1,16(s9)
ffffffffc020829e:	e119                	bnez	a0,ffffffffc02082a4 <stride_dequeue+0x252c>
ffffffffc02082a0:	feefe06f          	j	ffffffffc0206a8e <stride_dequeue+0xd16>
ffffffffc02082a4:	01953023          	sd	s9,0(a0)
ffffffffc02082a8:	fe6fe06f          	j	ffffffffc0206a8e <stride_dequeue+0xd16>
ffffffffc02082ac:	008cb303          	ld	t1,8(s9)
ffffffffc02082b0:	010cb503          	ld	a0,16(s9)
ffffffffc02082b4:	85c6                	mv	a1,a7
ffffffffc02082b6:	f41a                	sd	t1,40(sp)
ffffffffc02082b8:	8c1fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02082bc:	7322                	ld	t1,40(sp)
ffffffffc02082be:	00acb423          	sd	a0,8(s9)
ffffffffc02082c2:	7742                	ld	a4,48(sp)
ffffffffc02082c4:	006cb823          	sd	t1,16(s9)
ffffffffc02082c8:	e119                	bnez	a0,ffffffffc02082ce <stride_dequeue+0x2556>
ffffffffc02082ca:	c14fe06f          	j	ffffffffc02066de <stride_dequeue+0x966>
ffffffffc02082ce:	01953023          	sd	s9,0(a0)
ffffffffc02082d2:	c0cfe06f          	j	ffffffffc02066de <stride_dequeue+0x966>
ffffffffc02082d6:	00883303          	ld	t1,8(a6)
ffffffffc02082da:	01083503          	ld	a0,16(a6)
ffffffffc02082de:	85c6                	mv	a1,a7
ffffffffc02082e0:	f842                	sd	a6,48(sp)
ffffffffc02082e2:	f41a                	sd	t1,40(sp)
ffffffffc02082e4:	895fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02082e8:	7842                	ld	a6,48(sp)
ffffffffc02082ea:	7322                	ld	t1,40(sp)
ffffffffc02082ec:	00a83423          	sd	a0,8(a6)
ffffffffc02082f0:	00683823          	sd	t1,16(a6)
ffffffffc02082f4:	e119                	bnez	a0,ffffffffc02082fa <stride_dequeue+0x2582>
ffffffffc02082f6:	e2ffe06f          	j	ffffffffc0207124 <stride_dequeue+0x13ac>
ffffffffc02082fa:	01053023          	sd	a6,0(a0)
ffffffffc02082fe:	e27fe06f          	j	ffffffffc0207124 <stride_dequeue+0x13ac>
ffffffffc0208302:	00883303          	ld	t1,8(a6)
ffffffffc0208306:	01083503          	ld	a0,16(a6)
ffffffffc020830a:	85c6                	mv	a1,a7
ffffffffc020830c:	f842                	sd	a6,48(sp)
ffffffffc020830e:	f41a                	sd	t1,40(sp)
ffffffffc0208310:	869fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208314:	7842                	ld	a6,48(sp)
ffffffffc0208316:	7322                	ld	t1,40(sp)
ffffffffc0208318:	00a83423          	sd	a0,8(a6)
ffffffffc020831c:	00683823          	sd	t1,16(a6)
ffffffffc0208320:	e119                	bnez	a0,ffffffffc0208326 <stride_dequeue+0x25ae>
ffffffffc0208322:	f37fe06f          	j	ffffffffc0207258 <stride_dequeue+0x14e0>
ffffffffc0208326:	01053023          	sd	a6,0(a0)
ffffffffc020832a:	f2ffe06f          	j	ffffffffc0207258 <stride_dequeue+0x14e0>
ffffffffc020832e:	00883303          	ld	t1,8(a6)
ffffffffc0208332:	01083503          	ld	a0,16(a6)
ffffffffc0208336:	85e6                	mv	a1,s9
ffffffffc0208338:	fc46                	sd	a7,56(sp)
ffffffffc020833a:	f842                	sd	a6,48(sp)
ffffffffc020833c:	f41a                	sd	t1,40(sp)
ffffffffc020833e:	83bfd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208342:	7842                	ld	a6,48(sp)
ffffffffc0208344:	7322                	ld	t1,40(sp)
ffffffffc0208346:	78e2                	ld	a7,56(sp)
ffffffffc0208348:	00a83423          	sd	a0,8(a6)
ffffffffc020834c:	00683823          	sd	t1,16(a6)
ffffffffc0208350:	c169                	beqz	a0,ffffffffc0208412 <stride_dequeue+0x269a>
ffffffffc0208352:	01053023          	sd	a6,0(a0)
ffffffffc0208356:	8cc2                	mv	s9,a6
ffffffffc0208358:	ba4ff06f          	j	ffffffffc02076fc <stride_dequeue+0x1984>
ffffffffc020835c:	00883303          	ld	t1,8(a6)
ffffffffc0208360:	01083503          	ld	a0,16(a6)
ffffffffc0208364:	85c6                	mv	a1,a7
ffffffffc0208366:	f842                	sd	a6,48(sp)
ffffffffc0208368:	f41a                	sd	t1,40(sp)
ffffffffc020836a:	80ffd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc020836e:	7842                	ld	a6,48(sp)
ffffffffc0208370:	7322                	ld	t1,40(sp)
ffffffffc0208372:	00a83423          	sd	a0,8(a6)
ffffffffc0208376:	00683823          	sd	t1,16(a6)
ffffffffc020837a:	e119                	bnez	a0,ffffffffc0208380 <stride_dequeue+0x2608>
ffffffffc020837c:	e43fe06f          	j	ffffffffc02071be <stride_dequeue+0x1446>
ffffffffc0208380:	01053023          	sd	a6,0(a0)
ffffffffc0208384:	e3bfe06f          	j	ffffffffc02071be <stride_dequeue+0x1446>
ffffffffc0208388:	008d3303          	ld	t1,8(s10)
ffffffffc020838c:	010d3503          	ld	a0,16(s10)
ffffffffc0208390:	85c6                	mv	a1,a7
ffffffffc0208392:	f41a                	sd	t1,40(sp)
ffffffffc0208394:	fe4fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc0208398:	7322                	ld	t1,40(sp)
ffffffffc020839a:	00ad3423          	sd	a0,8(s10)
ffffffffc020839e:	7642                	ld	a2,48(sp)
ffffffffc02083a0:	006d3823          	sd	t1,16(s10)
ffffffffc02083a4:	e119                	bnez	a0,ffffffffc02083aa <stride_dequeue+0x2632>
ffffffffc02083a6:	f4dfe06f          	j	ffffffffc02072f2 <stride_dequeue+0x157a>
ffffffffc02083aa:	01a53023          	sd	s10,0(a0)
ffffffffc02083ae:	f45fe06f          	j	ffffffffc02072f2 <stride_dequeue+0x157a>
ffffffffc02083b2:	0088b303          	ld	t1,8(a7)
ffffffffc02083b6:	0108b503          	ld	a0,16(a7)
ffffffffc02083ba:	85c2                	mv	a1,a6
ffffffffc02083bc:	f846                	sd	a7,48(sp)
ffffffffc02083be:	f41a                	sd	t1,40(sp)
ffffffffc02083c0:	fb8fd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02083c4:	78c2                	ld	a7,48(sp)
ffffffffc02083c6:	7322                	ld	t1,40(sp)
ffffffffc02083c8:	00a8b423          	sd	a0,8(a7)
ffffffffc02083cc:	0068b823          	sd	t1,16(a7)
ffffffffc02083d0:	cd79                	beqz	a0,ffffffffc02084ae <stride_dequeue+0x2736>
ffffffffc02083d2:	01153023          	sd	a7,0(a0)
ffffffffc02083d6:	8846                	mv	a6,a7
ffffffffc02083d8:	b82ff06f          	j	ffffffffc020775a <stride_dequeue+0x19e2>
ffffffffc02083dc:	0088b303          	ld	t1,8(a7)
ffffffffc02083e0:	0108b503          	ld	a0,16(a7)
ffffffffc02083e4:	85c2                	mv	a1,a6
ffffffffc02083e6:	f846                	sd	a7,48(sp)
ffffffffc02083e8:	f41a                	sd	t1,40(sp)
ffffffffc02083ea:	f8efd0ef          	jal	ra,ffffffffc0205b78 <skew_heap_merge.constprop.2>
ffffffffc02083ee:	78c2                	ld	a7,48(sp)
ffffffffc02083f0:	7322                	ld	t1,40(sp)
ffffffffc02083f2:	00a8b423          	sd	a0,8(a7)
ffffffffc02083f6:	0068b823          	sd	t1,16(a7)
ffffffffc02083fa:	c115                	beqz	a0,ffffffffc020841e <stride_dequeue+0x26a6>
ffffffffc02083fc:	01153023          	sd	a7,0(a0)
ffffffffc0208400:	8846                	mv	a6,a7
ffffffffc0208402:	c14ff06f          	j	ffffffffc0207816 <stride_dequeue+0x1a9e>
ffffffffc0208406:	89be                	mv	s3,a5
ffffffffc0208408:	9deff06f          	j	ffffffffc02075e6 <stride_dequeue+0x186e>
ffffffffc020840c:	8846                	mv	a6,a7
ffffffffc020840e:	db1fe06f          	j	ffffffffc02071be <stride_dequeue+0x1446>
ffffffffc0208412:	8cc2                	mv	s9,a6
ffffffffc0208414:	ae8ff06f          	j	ffffffffc02076fc <stride_dequeue+0x1984>
ffffffffc0208418:	8cc2                	mv	s9,a6
ffffffffc020841a:	deaff06f          	j	ffffffffc0207a04 <stride_dequeue+0x1c8c>
ffffffffc020841e:	8846                	mv	a6,a7
ffffffffc0208420:	bf6ff06f          	j	ffffffffc0207816 <stride_dequeue+0x1a9e>
ffffffffc0208424:	8cc6                	mv	s9,a7
ffffffffc0208426:	ab8fe06f          	j	ffffffffc02066de <stride_dequeue+0x966>
ffffffffc020842a:	8846                	mv	a6,a7
ffffffffc020842c:	cf9fe06f          	j	ffffffffc0207124 <stride_dequeue+0x13ac>
ffffffffc0208430:	8cc2                	mv	s9,a6
ffffffffc0208432:	b86ff06f          	j	ffffffffc02077b8 <stride_dequeue+0x1a40>
ffffffffc0208436:	8846                	mv	a6,a7
ffffffffc0208438:	a66ff06f          	j	ffffffffc020769e <stride_dequeue+0x1926>
ffffffffc020843c:	8cc6                	mv	s9,a7
ffffffffc020843e:	fdcfe06f          	j	ffffffffc0206c1a <stride_dequeue+0xea2>
ffffffffc0208442:	8a42                	mv	s4,a6
ffffffffc0208444:	f19fe06f          	j	ffffffffc020735c <stride_dequeue+0x15e4>
ffffffffc0208448:	8846                	mv	a6,a7
ffffffffc020844a:	c3ffe06f          	j	ffffffffc0207088 <stride_dequeue+0x1310>
ffffffffc020844e:	8d46                	mv	s10,a7
ffffffffc0208450:	c94ff06f          	j	ffffffffc02078e4 <stride_dequeue+0x1b6c>
ffffffffc0208454:	8846                	mv	a6,a7
ffffffffc0208456:	e03fe06f          	j	ffffffffc0207258 <stride_dequeue+0x14e0>
ffffffffc020845a:	8d3e                	mv	s10,a5
ffffffffc020845c:	8e2ff06f          	j	ffffffffc020753e <stride_dequeue+0x17c6>
ffffffffc0208460:	8d46                	mv	s10,a7
ffffffffc0208462:	ef2fe06f          	j	ffffffffc0206b54 <stride_dequeue+0xddc>
ffffffffc0208466:	8846                	mv	a6,a7
ffffffffc0208468:	c0cff06f          	j	ffffffffc0207874 <stride_dequeue+0x1afc>
ffffffffc020846c:	8846                	mv	a6,a7
ffffffffc020846e:	b7ffe06f          	j	ffffffffc0206fec <stride_dequeue+0x1274>
ffffffffc0208472:	87c6                	mv	a5,a7
ffffffffc0208474:	f9dfe06f          	j	ffffffffc0207410 <stride_dequeue+0x1698>
ffffffffc0208478:	8846                	mv	a6,a7
ffffffffc020847a:	f41fe06f          	j	ffffffffc02073ba <stride_dequeue+0x1642>
ffffffffc020847e:	87c6                	mv	a5,a7
ffffffffc0208480:	cbcff06f          	j	ffffffffc020793c <stride_dequeue+0x1bc4>
ffffffffc0208484:	87c6                	mv	a5,a7
ffffffffc0208486:	fe1fe06f          	j	ffffffffc0207466 <stride_dequeue+0x16ee>
ffffffffc020848a:	8d3e                	mv	s10,a5
ffffffffc020848c:	906ff06f          	j	ffffffffc0207592 <stride_dequeue+0x181a>
ffffffffc0208490:	8cc6                	mv	s9,a7
ffffffffc0208492:	dfcfe06f          	j	ffffffffc0206a8e <stride_dequeue+0xd16>
ffffffffc0208496:	89c2                	mv	s3,a6
ffffffffc0208498:	d02ff06f          	j	ffffffffc020799a <stride_dequeue+0x1c22>
ffffffffc020849c:	8846                	mv	a6,a7
ffffffffc020849e:	824ff06f          	j	ffffffffc02074c2 <stride_dequeue+0x174a>
ffffffffc02084a2:	8d3e                	mv	s10,a5
ffffffffc02084a4:	996ff06f          	j	ffffffffc020763a <stride_dequeue+0x18c2>
ffffffffc02084a8:	8d46                	mv	s10,a7
ffffffffc02084aa:	e49fe06f          	j	ffffffffc02072f2 <stride_dequeue+0x157a>
ffffffffc02084ae:	8846                	mv	a6,a7
ffffffffc02084b0:	aaaff06f          	j	ffffffffc020775a <stride_dequeue+0x19e2>

ffffffffc02084b4 <sched_class_proc_tick>:
ffffffffc02084b4:	00035797          	auipc	a5,0x35
ffffffffc02084b8:	9cc78793          	addi	a5,a5,-1588 # ffffffffc023ce80 <idleproc>
ffffffffc02084bc:	639c                	ld	a5,0(a5)
ffffffffc02084be:	85aa                	mv	a1,a0
ffffffffc02084c0:	00a78f63          	beq	a5,a0,ffffffffc02084de <sched_class_proc_tick+0x2a>
ffffffffc02084c4:	00035797          	auipc	a5,0x35
ffffffffc02084c8:	9dc78793          	addi	a5,a5,-1572 # ffffffffc023cea0 <sched_class>
ffffffffc02084cc:	639c                	ld	a5,0(a5)
ffffffffc02084ce:	00035717          	auipc	a4,0x35
ffffffffc02084d2:	9ca70713          	addi	a4,a4,-1590 # ffffffffc023ce98 <rq>
ffffffffc02084d6:	6308                	ld	a0,0(a4)
ffffffffc02084d8:	0287b303          	ld	t1,40(a5)
ffffffffc02084dc:	8302                	jr	t1
ffffffffc02084de:	4705                	li	a4,1
ffffffffc02084e0:	ef98                	sd	a4,24(a5)
ffffffffc02084e2:	8082                	ret

ffffffffc02084e4 <sched_init>:
ffffffffc02084e4:	1141                	addi	sp,sp,-16
ffffffffc02084e6:	00029697          	auipc	a3,0x29
ffffffffc02084ea:	4f268693          	addi	a3,a3,1266 # ffffffffc02319d8 <default_sched_class>
ffffffffc02084ee:	e022                	sd	s0,0(sp)
ffffffffc02084f0:	e406                	sd	ra,8(sp)
ffffffffc02084f2:	00035797          	auipc	a5,0x35
ffffffffc02084f6:	94678793          	addi	a5,a5,-1722 # ffffffffc023ce38 <timer_list>
ffffffffc02084fa:	6690                	ld	a2,8(a3)
ffffffffc02084fc:	00035717          	auipc	a4,0x35
ffffffffc0208500:	91c70713          	addi	a4,a4,-1764 # ffffffffc023ce18 <__rq>
ffffffffc0208504:	e79c                	sd	a5,8(a5)
ffffffffc0208506:	e39c                	sd	a5,0(a5)
ffffffffc0208508:	4795                	li	a5,5
ffffffffc020850a:	00035417          	auipc	s0,0x35
ffffffffc020850e:	99640413          	addi	s0,s0,-1642 # ffffffffc023cea0 <sched_class>
ffffffffc0208512:	cb5c                	sw	a5,20(a4)
ffffffffc0208514:	853a                	mv	a0,a4
ffffffffc0208516:	e014                	sd	a3,0(s0)
ffffffffc0208518:	00035797          	auipc	a5,0x35
ffffffffc020851c:	98e7b023          	sd	a4,-1664(a5) # ffffffffc023ce98 <rq>
ffffffffc0208520:	9602                	jalr	a2
ffffffffc0208522:	601c                	ld	a5,0(s0)
ffffffffc0208524:	6402                	ld	s0,0(sp)
ffffffffc0208526:	60a2                	ld	ra,8(sp)
ffffffffc0208528:	638c                	ld	a1,0(a5)
ffffffffc020852a:	00003517          	auipc	a0,0x3
ffffffffc020852e:	9be50513          	addi	a0,a0,-1602 # ffffffffc020aee8 <default_pmm_manager+0x1520>
ffffffffc0208532:	0141                	addi	sp,sp,16
ffffffffc0208534:	c5ff706f          	j	ffffffffc0200192 <cprintf>

ffffffffc0208538 <wakeup_proc>:
ffffffffc0208538:	4118                	lw	a4,0(a0)
ffffffffc020853a:	1101                	addi	sp,sp,-32
ffffffffc020853c:	ec06                	sd	ra,24(sp)
ffffffffc020853e:	e822                	sd	s0,16(sp)
ffffffffc0208540:	e426                	sd	s1,8(sp)
ffffffffc0208542:	478d                	li	a5,3
ffffffffc0208544:	08f70763          	beq	a4,a5,ffffffffc02085d2 <wakeup_proc+0x9a>
ffffffffc0208548:	842a                	mv	s0,a0
ffffffffc020854a:	100027f3          	csrr	a5,sstatus
ffffffffc020854e:	8b89                	andi	a5,a5,2
ffffffffc0208550:	4481                	li	s1,0
ffffffffc0208552:	ebbd                	bnez	a5,ffffffffc02085c8 <wakeup_proc+0x90>
ffffffffc0208554:	4789                	li	a5,2
ffffffffc0208556:	04f70c63          	beq	a4,a5,ffffffffc02085ae <wakeup_proc+0x76>
ffffffffc020855a:	00035717          	auipc	a4,0x35
ffffffffc020855e:	91e70713          	addi	a4,a4,-1762 # ffffffffc023ce78 <current>
ffffffffc0208562:	6318                	ld	a4,0(a4)
ffffffffc0208564:	0e042623          	sw	zero,236(s0)
ffffffffc0208568:	c01c                	sw	a5,0(s0)
ffffffffc020856a:	02870663          	beq	a4,s0,ffffffffc0208596 <wakeup_proc+0x5e>
ffffffffc020856e:	00035797          	auipc	a5,0x35
ffffffffc0208572:	91278793          	addi	a5,a5,-1774 # ffffffffc023ce80 <idleproc>
ffffffffc0208576:	639c                	ld	a5,0(a5)
ffffffffc0208578:	00f40f63          	beq	s0,a5,ffffffffc0208596 <wakeup_proc+0x5e>
ffffffffc020857c:	00035797          	auipc	a5,0x35
ffffffffc0208580:	92478793          	addi	a5,a5,-1756 # ffffffffc023cea0 <sched_class>
ffffffffc0208584:	639c                	ld	a5,0(a5)
ffffffffc0208586:	00035717          	auipc	a4,0x35
ffffffffc020858a:	91270713          	addi	a4,a4,-1774 # ffffffffc023ce98 <rq>
ffffffffc020858e:	6308                	ld	a0,0(a4)
ffffffffc0208590:	6b9c                	ld	a5,16(a5)
ffffffffc0208592:	85a2                	mv	a1,s0
ffffffffc0208594:	9782                	jalr	a5
ffffffffc0208596:	e491                	bnez	s1,ffffffffc02085a2 <wakeup_proc+0x6a>
ffffffffc0208598:	60e2                	ld	ra,24(sp)
ffffffffc020859a:	6442                	ld	s0,16(sp)
ffffffffc020859c:	64a2                	ld	s1,8(sp)
ffffffffc020859e:	6105                	addi	sp,sp,32
ffffffffc02085a0:	8082                	ret
ffffffffc02085a2:	6442                	ld	s0,16(sp)
ffffffffc02085a4:	60e2                	ld	ra,24(sp)
ffffffffc02085a6:	64a2                	ld	s1,8(sp)
ffffffffc02085a8:	6105                	addi	sp,sp,32
ffffffffc02085aa:	89af806f          	j	ffffffffc0200644 <intr_enable>
ffffffffc02085ae:	00003617          	auipc	a2,0x3
ffffffffc02085b2:	98a60613          	addi	a2,a2,-1654 # ffffffffc020af38 <default_pmm_manager+0x1570>
ffffffffc02085b6:	04800593          	li	a1,72
ffffffffc02085ba:	00003517          	auipc	a0,0x3
ffffffffc02085be:	96650513          	addi	a0,a0,-1690 # ffffffffc020af20 <default_pmm_manager+0x1558>
ffffffffc02085c2:	f2ff70ef          	jal	ra,ffffffffc02004f0 <__warn>
ffffffffc02085c6:	bfc1                	j	ffffffffc0208596 <wakeup_proc+0x5e>
ffffffffc02085c8:	882f80ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc02085cc:	4018                	lw	a4,0(s0)
ffffffffc02085ce:	4485                	li	s1,1
ffffffffc02085d0:	b751                	j	ffffffffc0208554 <wakeup_proc+0x1c>
ffffffffc02085d2:	00003697          	auipc	a3,0x3
ffffffffc02085d6:	92e68693          	addi	a3,a3,-1746 # ffffffffc020af00 <default_pmm_manager+0x1538>
ffffffffc02085da:	00001617          	auipc	a2,0x1
ffffffffc02085de:	ca660613          	addi	a2,a2,-858 # ffffffffc0209280 <commands+0x4c0>
ffffffffc02085e2:	03c00593          	li	a1,60
ffffffffc02085e6:	00003517          	auipc	a0,0x3
ffffffffc02085ea:	93a50513          	addi	a0,a0,-1734 # ffffffffc020af20 <default_pmm_manager+0x1558>
ffffffffc02085ee:	e97f70ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02085f2 <schedule>:
ffffffffc02085f2:	7179                	addi	sp,sp,-48
ffffffffc02085f4:	f406                	sd	ra,40(sp)
ffffffffc02085f6:	f022                	sd	s0,32(sp)
ffffffffc02085f8:	ec26                	sd	s1,24(sp)
ffffffffc02085fa:	e84a                	sd	s2,16(sp)
ffffffffc02085fc:	e44e                	sd	s3,8(sp)
ffffffffc02085fe:	e052                	sd	s4,0(sp)
ffffffffc0208600:	100027f3          	csrr	a5,sstatus
ffffffffc0208604:	8b89                	andi	a5,a5,2
ffffffffc0208606:	4a01                	li	s4,0
ffffffffc0208608:	e7d5                	bnez	a5,ffffffffc02086b4 <schedule+0xc2>
ffffffffc020860a:	00035497          	auipc	s1,0x35
ffffffffc020860e:	86e48493          	addi	s1,s1,-1938 # ffffffffc023ce78 <current>
ffffffffc0208612:	608c                	ld	a1,0(s1)
ffffffffc0208614:	00035997          	auipc	s3,0x35
ffffffffc0208618:	88c98993          	addi	s3,s3,-1908 # ffffffffc023cea0 <sched_class>
ffffffffc020861c:	00035917          	auipc	s2,0x35
ffffffffc0208620:	87c90913          	addi	s2,s2,-1924 # ffffffffc023ce98 <rq>
ffffffffc0208624:	4194                	lw	a3,0(a1)
ffffffffc0208626:	0005bc23          	sd	zero,24(a1)
ffffffffc020862a:	4709                	li	a4,2
ffffffffc020862c:	0009b783          	ld	a5,0(s3)
ffffffffc0208630:	00093503          	ld	a0,0(s2)
ffffffffc0208634:	04e68063          	beq	a3,a4,ffffffffc0208674 <schedule+0x82>
ffffffffc0208638:	739c                	ld	a5,32(a5)
ffffffffc020863a:	9782                	jalr	a5
ffffffffc020863c:	842a                	mv	s0,a0
ffffffffc020863e:	cd21                	beqz	a0,ffffffffc0208696 <schedule+0xa4>
ffffffffc0208640:	0009b783          	ld	a5,0(s3)
ffffffffc0208644:	00093503          	ld	a0,0(s2)
ffffffffc0208648:	85a2                	mv	a1,s0
ffffffffc020864a:	6f9c                	ld	a5,24(a5)
ffffffffc020864c:	9782                	jalr	a5
ffffffffc020864e:	441c                	lw	a5,8(s0)
ffffffffc0208650:	6098                	ld	a4,0(s1)
ffffffffc0208652:	2785                	addiw	a5,a5,1
ffffffffc0208654:	c41c                	sw	a5,8(s0)
ffffffffc0208656:	00870563          	beq	a4,s0,ffffffffc0208660 <schedule+0x6e>
ffffffffc020865a:	8522                	mv	a0,s0
ffffffffc020865c:	bfefc0ef          	jal	ra,ffffffffc0204a5a <proc_run>
ffffffffc0208660:	040a1163          	bnez	s4,ffffffffc02086a2 <schedule+0xb0>
ffffffffc0208664:	70a2                	ld	ra,40(sp)
ffffffffc0208666:	7402                	ld	s0,32(sp)
ffffffffc0208668:	64e2                	ld	s1,24(sp)
ffffffffc020866a:	6942                	ld	s2,16(sp)
ffffffffc020866c:	69a2                	ld	s3,8(sp)
ffffffffc020866e:	6a02                	ld	s4,0(sp)
ffffffffc0208670:	6145                	addi	sp,sp,48
ffffffffc0208672:	8082                	ret
ffffffffc0208674:	00035717          	auipc	a4,0x35
ffffffffc0208678:	80c70713          	addi	a4,a4,-2036 # ffffffffc023ce80 <idleproc>
ffffffffc020867c:	6318                	ld	a4,0(a4)
ffffffffc020867e:	fae58de3          	beq	a1,a4,ffffffffc0208638 <schedule+0x46>
ffffffffc0208682:	6b9c                	ld	a5,16(a5)
ffffffffc0208684:	9782                	jalr	a5
ffffffffc0208686:	0009b783          	ld	a5,0(s3)
ffffffffc020868a:	00093503          	ld	a0,0(s2)
ffffffffc020868e:	739c                	ld	a5,32(a5)
ffffffffc0208690:	9782                	jalr	a5
ffffffffc0208692:	842a                	mv	s0,a0
ffffffffc0208694:	f555                	bnez	a0,ffffffffc0208640 <schedule+0x4e>
ffffffffc0208696:	00034797          	auipc	a5,0x34
ffffffffc020869a:	7ea78793          	addi	a5,a5,2026 # ffffffffc023ce80 <idleproc>
ffffffffc020869e:	6380                	ld	s0,0(a5)
ffffffffc02086a0:	b77d                	j	ffffffffc020864e <schedule+0x5c>
ffffffffc02086a2:	7402                	ld	s0,32(sp)
ffffffffc02086a4:	70a2                	ld	ra,40(sp)
ffffffffc02086a6:	64e2                	ld	s1,24(sp)
ffffffffc02086a8:	6942                	ld	s2,16(sp)
ffffffffc02086aa:	69a2                	ld	s3,8(sp)
ffffffffc02086ac:	6a02                	ld	s4,0(sp)
ffffffffc02086ae:	6145                	addi	sp,sp,48
ffffffffc02086b0:	f95f706f          	j	ffffffffc0200644 <intr_enable>
ffffffffc02086b4:	f97f70ef          	jal	ra,ffffffffc020064a <intr_disable>
ffffffffc02086b8:	4a05                	li	s4,1
ffffffffc02086ba:	bf81                	j	ffffffffc020860a <schedule+0x18>

ffffffffc02086bc <sys_getpid>:
ffffffffc02086bc:	00034797          	auipc	a5,0x34
ffffffffc02086c0:	7bc78793          	addi	a5,a5,1980 # ffffffffc023ce78 <current>
ffffffffc02086c4:	639c                	ld	a5,0(a5)
ffffffffc02086c6:	43c8                	lw	a0,4(a5)
ffffffffc02086c8:	8082                	ret

ffffffffc02086ca <sys_pgdir>:
ffffffffc02086ca:	4501                	li	a0,0
ffffffffc02086cc:	8082                	ret

ffffffffc02086ce <sys_gettime>:
ffffffffc02086ce:	00034797          	auipc	a5,0x34
ffffffffc02086d2:	7da78793          	addi	a5,a5,2010 # ffffffffc023cea8 <ticks>
ffffffffc02086d6:	639c                	ld	a5,0(a5)
ffffffffc02086d8:	0027951b          	slliw	a0,a5,0x2
ffffffffc02086dc:	9d3d                	addw	a0,a0,a5
ffffffffc02086de:	0015151b          	slliw	a0,a0,0x1
ffffffffc02086e2:	8082                	ret

ffffffffc02086e4 <sys_lab6_set_priority>:
ffffffffc02086e4:	4108                	lw	a0,0(a0)
ffffffffc02086e6:	1141                	addi	sp,sp,-16
ffffffffc02086e8:	e406                	sd	ra,8(sp)
ffffffffc02086ea:	b86fd0ef          	jal	ra,ffffffffc0205a70 <lab6_set_priority>
ffffffffc02086ee:	60a2                	ld	ra,8(sp)
ffffffffc02086f0:	4501                	li	a0,0
ffffffffc02086f2:	0141                	addi	sp,sp,16
ffffffffc02086f4:	8082                	ret

ffffffffc02086f6 <sys_putc>:
ffffffffc02086f6:	4108                	lw	a0,0(a0)
ffffffffc02086f8:	1141                	addi	sp,sp,-16
ffffffffc02086fa:	e406                	sd	ra,8(sp)
ffffffffc02086fc:	acbf70ef          	jal	ra,ffffffffc02001c6 <cputchar>
ffffffffc0208700:	60a2                	ld	ra,8(sp)
ffffffffc0208702:	4501                	li	a0,0
ffffffffc0208704:	0141                	addi	sp,sp,16
ffffffffc0208706:	8082                	ret

ffffffffc0208708 <sys_kill>:
ffffffffc0208708:	4108                	lw	a0,0(a0)
ffffffffc020870a:	9b8fd06f          	j	ffffffffc02058c2 <do_kill>

ffffffffc020870e <sys_yield>:
ffffffffc020870e:	962fd06f          	j	ffffffffc0205870 <do_yield>

ffffffffc0208712 <sys_exec>:
ffffffffc0208712:	6d14                	ld	a3,24(a0)
ffffffffc0208714:	6910                	ld	a2,16(a0)
ffffffffc0208716:	650c                	ld	a1,8(a0)
ffffffffc0208718:	6108                	ld	a0,0(a0)
ffffffffc020871a:	c5dfc06f          	j	ffffffffc0205376 <do_execve>

ffffffffc020871e <sys_wait>:
ffffffffc020871e:	650c                	ld	a1,8(a0)
ffffffffc0208720:	4108                	lw	a0,0(a0)
ffffffffc0208722:	960fd06f          	j	ffffffffc0205882 <do_wait>

ffffffffc0208726 <sys_fork>:
ffffffffc0208726:	00034797          	auipc	a5,0x34
ffffffffc020872a:	75278793          	addi	a5,a5,1874 # ffffffffc023ce78 <current>
ffffffffc020872e:	639c                	ld	a5,0(a5)
ffffffffc0208730:	4501                	li	a0,0
ffffffffc0208732:	73d0                	ld	a2,160(a5)
ffffffffc0208734:	6a0c                	ld	a1,16(a2)
ffffffffc0208736:	becfc06f          	j	ffffffffc0204b22 <do_fork>

ffffffffc020873a <sys_exit>:
ffffffffc020873a:	4108                	lw	a0,0(a0)
ffffffffc020873c:	81dfc06f          	j	ffffffffc0204f58 <do_exit>

ffffffffc0208740 <syscall>:
ffffffffc0208740:	715d                	addi	sp,sp,-80
ffffffffc0208742:	fc26                	sd	s1,56(sp)
ffffffffc0208744:	00034497          	auipc	s1,0x34
ffffffffc0208748:	73448493          	addi	s1,s1,1844 # ffffffffc023ce78 <current>
ffffffffc020874c:	6098                	ld	a4,0(s1)
ffffffffc020874e:	e0a2                	sd	s0,64(sp)
ffffffffc0208750:	f84a                	sd	s2,48(sp)
ffffffffc0208752:	7340                	ld	s0,160(a4)
ffffffffc0208754:	e486                	sd	ra,72(sp)
ffffffffc0208756:	0ff00793          	li	a5,255
ffffffffc020875a:	05042903          	lw	s2,80(s0)
ffffffffc020875e:	0327ee63          	bltu	a5,s2,ffffffffc020879a <syscall+0x5a>
ffffffffc0208762:	00391713          	slli	a4,s2,0x3
ffffffffc0208766:	00003797          	auipc	a5,0x3
ffffffffc020876a:	83a78793          	addi	a5,a5,-1990 # ffffffffc020afa0 <syscalls>
ffffffffc020876e:	97ba                	add	a5,a5,a4
ffffffffc0208770:	639c                	ld	a5,0(a5)
ffffffffc0208772:	c785                	beqz	a5,ffffffffc020879a <syscall+0x5a>
ffffffffc0208774:	6c28                	ld	a0,88(s0)
ffffffffc0208776:	702c                	ld	a1,96(s0)
ffffffffc0208778:	7430                	ld	a2,104(s0)
ffffffffc020877a:	7834                	ld	a3,112(s0)
ffffffffc020877c:	7c38                	ld	a4,120(s0)
ffffffffc020877e:	e42a                	sd	a0,8(sp)
ffffffffc0208780:	e82e                	sd	a1,16(sp)
ffffffffc0208782:	ec32                	sd	a2,24(sp)
ffffffffc0208784:	f036                	sd	a3,32(sp)
ffffffffc0208786:	f43a                	sd	a4,40(sp)
ffffffffc0208788:	0028                	addi	a0,sp,8
ffffffffc020878a:	9782                	jalr	a5
ffffffffc020878c:	e828                	sd	a0,80(s0)
ffffffffc020878e:	60a6                	ld	ra,72(sp)
ffffffffc0208790:	6406                	ld	s0,64(sp)
ffffffffc0208792:	74e2                	ld	s1,56(sp)
ffffffffc0208794:	7942                	ld	s2,48(sp)
ffffffffc0208796:	6161                	addi	sp,sp,80
ffffffffc0208798:	8082                	ret
ffffffffc020879a:	8522                	mv	a0,s0
ffffffffc020879c:	89cf80ef          	jal	ra,ffffffffc0200838 <print_trapframe>
ffffffffc02087a0:	609c                	ld	a5,0(s1)
ffffffffc02087a2:	86ca                	mv	a3,s2
ffffffffc02087a4:	00002617          	auipc	a2,0x2
ffffffffc02087a8:	7b460613          	addi	a2,a2,1972 # ffffffffc020af58 <default_pmm_manager+0x1590>
ffffffffc02087ac:	43d8                	lw	a4,4(a5)
ffffffffc02087ae:	06d00593          	li	a1,109
ffffffffc02087b2:	0b478793          	addi	a5,a5,180
ffffffffc02087b6:	00002517          	auipc	a0,0x2
ffffffffc02087ba:	7d250513          	addi	a0,a0,2002 # ffffffffc020af88 <default_pmm_manager+0x15c0>
ffffffffc02087be:	cc7f70ef          	jal	ra,ffffffffc0200484 <__panic>

ffffffffc02087c2 <hash32>:
ffffffffc02087c2:	9e3707b7          	lui	a5,0x9e370
ffffffffc02087c6:	2785                	addiw	a5,a5,1
ffffffffc02087c8:	02f5053b          	mulw	a0,a0,a5
ffffffffc02087cc:	02000793          	li	a5,32
ffffffffc02087d0:	40b785bb          	subw	a1,a5,a1
ffffffffc02087d4:	00b5553b          	srlw	a0,a0,a1
ffffffffc02087d8:	8082                	ret

ffffffffc02087da <printnum>:
ffffffffc02087da:	02069813          	slli	a6,a3,0x20
ffffffffc02087de:	7179                	addi	sp,sp,-48
ffffffffc02087e0:	02085813          	srli	a6,a6,0x20
ffffffffc02087e4:	e052                	sd	s4,0(sp)
ffffffffc02087e6:	03067a33          	remu	s4,a2,a6
ffffffffc02087ea:	f022                	sd	s0,32(sp)
ffffffffc02087ec:	ec26                	sd	s1,24(sp)
ffffffffc02087ee:	e84a                	sd	s2,16(sp)
ffffffffc02087f0:	f406                	sd	ra,40(sp)
ffffffffc02087f2:	e44e                	sd	s3,8(sp)
ffffffffc02087f4:	84aa                	mv	s1,a0
ffffffffc02087f6:	892e                	mv	s2,a1
ffffffffc02087f8:	fff7041b          	addiw	s0,a4,-1
ffffffffc02087fc:	2a01                	sext.w	s4,s4
ffffffffc02087fe:	03067e63          	bgeu	a2,a6,ffffffffc020883a <printnum+0x60>
ffffffffc0208802:	89be                	mv	s3,a5
ffffffffc0208804:	00805763          	blez	s0,ffffffffc0208812 <printnum+0x38>
ffffffffc0208808:	347d                	addiw	s0,s0,-1
ffffffffc020880a:	85ca                	mv	a1,s2
ffffffffc020880c:	854e                	mv	a0,s3
ffffffffc020880e:	9482                	jalr	s1
ffffffffc0208810:	fc65                	bnez	s0,ffffffffc0208808 <printnum+0x2e>
ffffffffc0208812:	1a02                	slli	s4,s4,0x20
ffffffffc0208814:	020a5a13          	srli	s4,s4,0x20
ffffffffc0208818:	00003797          	auipc	a5,0x3
ffffffffc020881c:	1a878793          	addi	a5,a5,424 # ffffffffc020b9c0 <error_string+0xc8>
ffffffffc0208820:	9a3e                	add	s4,s4,a5
ffffffffc0208822:	7402                	ld	s0,32(sp)
ffffffffc0208824:	000a4503          	lbu	a0,0(s4)
ffffffffc0208828:	70a2                	ld	ra,40(sp)
ffffffffc020882a:	69a2                	ld	s3,8(sp)
ffffffffc020882c:	6a02                	ld	s4,0(sp)
ffffffffc020882e:	85ca                	mv	a1,s2
ffffffffc0208830:	8326                	mv	t1,s1
ffffffffc0208832:	6942                	ld	s2,16(sp)
ffffffffc0208834:	64e2                	ld	s1,24(sp)
ffffffffc0208836:	6145                	addi	sp,sp,48
ffffffffc0208838:	8302                	jr	t1
ffffffffc020883a:	03065633          	divu	a2,a2,a6
ffffffffc020883e:	8722                	mv	a4,s0
ffffffffc0208840:	f9bff0ef          	jal	ra,ffffffffc02087da <printnum>
ffffffffc0208844:	b7f9                	j	ffffffffc0208812 <printnum+0x38>

ffffffffc0208846 <vprintfmt>:
ffffffffc0208846:	7119                	addi	sp,sp,-128
ffffffffc0208848:	f4a6                	sd	s1,104(sp)
ffffffffc020884a:	f0ca                	sd	s2,96(sp)
ffffffffc020884c:	e8d2                	sd	s4,80(sp)
ffffffffc020884e:	e4d6                	sd	s5,72(sp)
ffffffffc0208850:	e0da                	sd	s6,64(sp)
ffffffffc0208852:	fc5e                	sd	s7,56(sp)
ffffffffc0208854:	f862                	sd	s8,48(sp)
ffffffffc0208856:	f06a                	sd	s10,32(sp)
ffffffffc0208858:	fc86                	sd	ra,120(sp)
ffffffffc020885a:	f8a2                	sd	s0,112(sp)
ffffffffc020885c:	ecce                	sd	s3,88(sp)
ffffffffc020885e:	f466                	sd	s9,40(sp)
ffffffffc0208860:	ec6e                	sd	s11,24(sp)
ffffffffc0208862:	892a                	mv	s2,a0
ffffffffc0208864:	84ae                	mv	s1,a1
ffffffffc0208866:	8d32                	mv	s10,a2
ffffffffc0208868:	8ab6                	mv	s5,a3
ffffffffc020886a:	5b7d                	li	s6,-1
ffffffffc020886c:	00003a17          	auipc	s4,0x3
ffffffffc0208870:	f34a0a13          	addi	s4,s4,-204 # ffffffffc020b7a0 <syscalls+0x800>
ffffffffc0208874:	05e00b93          	li	s7,94
ffffffffc0208878:	00003c17          	auipc	s8,0x3
ffffffffc020887c:	080c0c13          	addi	s8,s8,128 # ffffffffc020b8f8 <error_string>
ffffffffc0208880:	000d4503          	lbu	a0,0(s10)
ffffffffc0208884:	02500793          	li	a5,37
ffffffffc0208888:	001d0413          	addi	s0,s10,1
ffffffffc020888c:	00f50e63          	beq	a0,a5,ffffffffc02088a8 <vprintfmt+0x62>
ffffffffc0208890:	c521                	beqz	a0,ffffffffc02088d8 <vprintfmt+0x92>
ffffffffc0208892:	02500993          	li	s3,37
ffffffffc0208896:	a011                	j	ffffffffc020889a <vprintfmt+0x54>
ffffffffc0208898:	c121                	beqz	a0,ffffffffc02088d8 <vprintfmt+0x92>
ffffffffc020889a:	85a6                	mv	a1,s1
ffffffffc020889c:	0405                	addi	s0,s0,1
ffffffffc020889e:	9902                	jalr	s2
ffffffffc02088a0:	fff44503          	lbu	a0,-1(s0)
ffffffffc02088a4:	ff351ae3          	bne	a0,s3,ffffffffc0208898 <vprintfmt+0x52>
ffffffffc02088a8:	00044603          	lbu	a2,0(s0)
ffffffffc02088ac:	02000793          	li	a5,32
ffffffffc02088b0:	4981                	li	s3,0
ffffffffc02088b2:	4801                	li	a6,0
ffffffffc02088b4:	5cfd                	li	s9,-1
ffffffffc02088b6:	5dfd                	li	s11,-1
ffffffffc02088b8:	05500593          	li	a1,85
ffffffffc02088bc:	4525                	li	a0,9
ffffffffc02088be:	fdd6069b          	addiw	a3,a2,-35
ffffffffc02088c2:	0ff6f693          	andi	a3,a3,255
ffffffffc02088c6:	00140d13          	addi	s10,s0,1
ffffffffc02088ca:	1ed5ef63          	bltu	a1,a3,ffffffffc0208ac8 <vprintfmt+0x282>
ffffffffc02088ce:	068a                	slli	a3,a3,0x2
ffffffffc02088d0:	96d2                	add	a3,a3,s4
ffffffffc02088d2:	4294                	lw	a3,0(a3)
ffffffffc02088d4:	96d2                	add	a3,a3,s4
ffffffffc02088d6:	8682                	jr	a3
ffffffffc02088d8:	70e6                	ld	ra,120(sp)
ffffffffc02088da:	7446                	ld	s0,112(sp)
ffffffffc02088dc:	74a6                	ld	s1,104(sp)
ffffffffc02088de:	7906                	ld	s2,96(sp)
ffffffffc02088e0:	69e6                	ld	s3,88(sp)
ffffffffc02088e2:	6a46                	ld	s4,80(sp)
ffffffffc02088e4:	6aa6                	ld	s5,72(sp)
ffffffffc02088e6:	6b06                	ld	s6,64(sp)
ffffffffc02088e8:	7be2                	ld	s7,56(sp)
ffffffffc02088ea:	7c42                	ld	s8,48(sp)
ffffffffc02088ec:	7ca2                	ld	s9,40(sp)
ffffffffc02088ee:	7d02                	ld	s10,32(sp)
ffffffffc02088f0:	6de2                	ld	s11,24(sp)
ffffffffc02088f2:	6109                	addi	sp,sp,128
ffffffffc02088f4:	8082                	ret
ffffffffc02088f6:	87b2                	mv	a5,a2
ffffffffc02088f8:	00144603          	lbu	a2,1(s0)
ffffffffc02088fc:	846a                	mv	s0,s10
ffffffffc02088fe:	b7c1                	j	ffffffffc02088be <vprintfmt+0x78>
ffffffffc0208900:	000aac83          	lw	s9,0(s5)
ffffffffc0208904:	00144603          	lbu	a2,1(s0)
ffffffffc0208908:	0aa1                	addi	s5,s5,8
ffffffffc020890a:	846a                	mv	s0,s10
ffffffffc020890c:	fa0dd9e3          	bgez	s11,ffffffffc02088be <vprintfmt+0x78>
ffffffffc0208910:	8de6                	mv	s11,s9
ffffffffc0208912:	5cfd                	li	s9,-1
ffffffffc0208914:	b76d                	j	ffffffffc02088be <vprintfmt+0x78>
ffffffffc0208916:	fffdc693          	not	a3,s11
ffffffffc020891a:	96fd                	srai	a3,a3,0x3f
ffffffffc020891c:	00ddfdb3          	and	s11,s11,a3
ffffffffc0208920:	00144603          	lbu	a2,1(s0)
ffffffffc0208924:	2d81                	sext.w	s11,s11
ffffffffc0208926:	846a                	mv	s0,s10
ffffffffc0208928:	bf59                	j	ffffffffc02088be <vprintfmt+0x78>
ffffffffc020892a:	4705                	li	a4,1
ffffffffc020892c:	008a8593          	addi	a1,s5,8
ffffffffc0208930:	01074463          	blt	a4,a6,ffffffffc0208938 <vprintfmt+0xf2>
ffffffffc0208934:	22080863          	beqz	a6,ffffffffc0208b64 <vprintfmt+0x31e>
ffffffffc0208938:	000ab603          	ld	a2,0(s5)
ffffffffc020893c:	46c1                	li	a3,16
ffffffffc020893e:	8aae                	mv	s5,a1
ffffffffc0208940:	a291                	j	ffffffffc0208a84 <vprintfmt+0x23e>
ffffffffc0208942:	fd060c9b          	addiw	s9,a2,-48
ffffffffc0208946:	00144603          	lbu	a2,1(s0)
ffffffffc020894a:	846a                	mv	s0,s10
ffffffffc020894c:	fd06069b          	addiw	a3,a2,-48
ffffffffc0208950:	0006089b          	sext.w	a7,a2
ffffffffc0208954:	fad56ce3          	bltu	a0,a3,ffffffffc020890c <vprintfmt+0xc6>
ffffffffc0208958:	0405                	addi	s0,s0,1
ffffffffc020895a:	002c969b          	slliw	a3,s9,0x2
ffffffffc020895e:	00044603          	lbu	a2,0(s0)
ffffffffc0208962:	0196873b          	addw	a4,a3,s9
ffffffffc0208966:	0017171b          	slliw	a4,a4,0x1
ffffffffc020896a:	0117073b          	addw	a4,a4,a7
ffffffffc020896e:	fd06069b          	addiw	a3,a2,-48
ffffffffc0208972:	fd070c9b          	addiw	s9,a4,-48
ffffffffc0208976:	0006089b          	sext.w	a7,a2
ffffffffc020897a:	fcd57fe3          	bgeu	a0,a3,ffffffffc0208958 <vprintfmt+0x112>
ffffffffc020897e:	b779                	j	ffffffffc020890c <vprintfmt+0xc6>
ffffffffc0208980:	000aa503          	lw	a0,0(s5)
ffffffffc0208984:	85a6                	mv	a1,s1
ffffffffc0208986:	0aa1                	addi	s5,s5,8
ffffffffc0208988:	9902                	jalr	s2
ffffffffc020898a:	bddd                	j	ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc020898c:	4705                	li	a4,1
ffffffffc020898e:	008a8993          	addi	s3,s5,8
ffffffffc0208992:	01074463          	blt	a4,a6,ffffffffc020899a <vprintfmt+0x154>
ffffffffc0208996:	1c080463          	beqz	a6,ffffffffc0208b5e <vprintfmt+0x318>
ffffffffc020899a:	000ab403          	ld	s0,0(s5)
ffffffffc020899e:	1c044a63          	bltz	s0,ffffffffc0208b72 <vprintfmt+0x32c>
ffffffffc02089a2:	8622                	mv	a2,s0
ffffffffc02089a4:	8ace                	mv	s5,s3
ffffffffc02089a6:	46a9                	li	a3,10
ffffffffc02089a8:	a8f1                	j	ffffffffc0208a84 <vprintfmt+0x23e>
ffffffffc02089aa:	000aa783          	lw	a5,0(s5)
ffffffffc02089ae:	4761                	li	a4,24
ffffffffc02089b0:	0aa1                	addi	s5,s5,8
ffffffffc02089b2:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc02089b6:	8fb5                	xor	a5,a5,a3
ffffffffc02089b8:	40d786bb          	subw	a3,a5,a3
ffffffffc02089bc:	12d74963          	blt	a4,a3,ffffffffc0208aee <vprintfmt+0x2a8>
ffffffffc02089c0:	00369793          	slli	a5,a3,0x3
ffffffffc02089c4:	97e2                	add	a5,a5,s8
ffffffffc02089c6:	639c                	ld	a5,0(a5)
ffffffffc02089c8:	12078363          	beqz	a5,ffffffffc0208aee <vprintfmt+0x2a8>
ffffffffc02089cc:	86be                	mv	a3,a5
ffffffffc02089ce:	00000617          	auipc	a2,0x0
ffffffffc02089d2:	2ea60613          	addi	a2,a2,746 # ffffffffc0208cb8 <etext+0x2a>
ffffffffc02089d6:	85a6                	mv	a1,s1
ffffffffc02089d8:	854a                	mv	a0,s2
ffffffffc02089da:	1cc000ef          	jal	ra,ffffffffc0208ba6 <printfmt>
ffffffffc02089de:	b54d                	j	ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc02089e0:	000ab603          	ld	a2,0(s5)
ffffffffc02089e4:	0aa1                	addi	s5,s5,8
ffffffffc02089e6:	1a060163          	beqz	a2,ffffffffc0208b88 <vprintfmt+0x342>
ffffffffc02089ea:	00160413          	addi	s0,a2,1
ffffffffc02089ee:	15b05763          	blez	s11,ffffffffc0208b3c <vprintfmt+0x2f6>
ffffffffc02089f2:	02d00593          	li	a1,45
ffffffffc02089f6:	10b79d63          	bne	a5,a1,ffffffffc0208b10 <vprintfmt+0x2ca>
ffffffffc02089fa:	00064783          	lbu	a5,0(a2)
ffffffffc02089fe:	0007851b          	sext.w	a0,a5
ffffffffc0208a02:	c905                	beqz	a0,ffffffffc0208a32 <vprintfmt+0x1ec>
ffffffffc0208a04:	000cc563          	bltz	s9,ffffffffc0208a0e <vprintfmt+0x1c8>
ffffffffc0208a08:	3cfd                	addiw	s9,s9,-1
ffffffffc0208a0a:	036c8263          	beq	s9,s6,ffffffffc0208a2e <vprintfmt+0x1e8>
ffffffffc0208a0e:	85a6                	mv	a1,s1
ffffffffc0208a10:	14098f63          	beqz	s3,ffffffffc0208b6e <vprintfmt+0x328>
ffffffffc0208a14:	3781                	addiw	a5,a5,-32
ffffffffc0208a16:	14fbfc63          	bgeu	s7,a5,ffffffffc0208b6e <vprintfmt+0x328>
ffffffffc0208a1a:	03f00513          	li	a0,63
ffffffffc0208a1e:	9902                	jalr	s2
ffffffffc0208a20:	0405                	addi	s0,s0,1
ffffffffc0208a22:	fff44783          	lbu	a5,-1(s0)
ffffffffc0208a26:	3dfd                	addiw	s11,s11,-1
ffffffffc0208a28:	0007851b          	sext.w	a0,a5
ffffffffc0208a2c:	fd61                	bnez	a0,ffffffffc0208a04 <vprintfmt+0x1be>
ffffffffc0208a2e:	e5b059e3          	blez	s11,ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208a32:	3dfd                	addiw	s11,s11,-1
ffffffffc0208a34:	85a6                	mv	a1,s1
ffffffffc0208a36:	02000513          	li	a0,32
ffffffffc0208a3a:	9902                	jalr	s2
ffffffffc0208a3c:	e40d82e3          	beqz	s11,ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208a40:	3dfd                	addiw	s11,s11,-1
ffffffffc0208a42:	85a6                	mv	a1,s1
ffffffffc0208a44:	02000513          	li	a0,32
ffffffffc0208a48:	9902                	jalr	s2
ffffffffc0208a4a:	fe0d94e3          	bnez	s11,ffffffffc0208a32 <vprintfmt+0x1ec>
ffffffffc0208a4e:	bd0d                	j	ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208a50:	4705                	li	a4,1
ffffffffc0208a52:	008a8593          	addi	a1,s5,8
ffffffffc0208a56:	01074463          	blt	a4,a6,ffffffffc0208a5e <vprintfmt+0x218>
ffffffffc0208a5a:	0e080863          	beqz	a6,ffffffffc0208b4a <vprintfmt+0x304>
ffffffffc0208a5e:	000ab603          	ld	a2,0(s5)
ffffffffc0208a62:	46a1                	li	a3,8
ffffffffc0208a64:	8aae                	mv	s5,a1
ffffffffc0208a66:	a839                	j	ffffffffc0208a84 <vprintfmt+0x23e>
ffffffffc0208a68:	03000513          	li	a0,48
ffffffffc0208a6c:	85a6                	mv	a1,s1
ffffffffc0208a6e:	e03e                	sd	a5,0(sp)
ffffffffc0208a70:	9902                	jalr	s2
ffffffffc0208a72:	85a6                	mv	a1,s1
ffffffffc0208a74:	07800513          	li	a0,120
ffffffffc0208a78:	9902                	jalr	s2
ffffffffc0208a7a:	0aa1                	addi	s5,s5,8
ffffffffc0208a7c:	ff8ab603          	ld	a2,-8(s5)
ffffffffc0208a80:	6782                	ld	a5,0(sp)
ffffffffc0208a82:	46c1                	li	a3,16
ffffffffc0208a84:	2781                	sext.w	a5,a5
ffffffffc0208a86:	876e                	mv	a4,s11
ffffffffc0208a88:	85a6                	mv	a1,s1
ffffffffc0208a8a:	854a                	mv	a0,s2
ffffffffc0208a8c:	d4fff0ef          	jal	ra,ffffffffc02087da <printnum>
ffffffffc0208a90:	bbc5                	j	ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208a92:	00144603          	lbu	a2,1(s0)
ffffffffc0208a96:	2805                	addiw	a6,a6,1
ffffffffc0208a98:	846a                	mv	s0,s10
ffffffffc0208a9a:	b515                	j	ffffffffc02088be <vprintfmt+0x78>
ffffffffc0208a9c:	00144603          	lbu	a2,1(s0)
ffffffffc0208aa0:	4985                	li	s3,1
ffffffffc0208aa2:	846a                	mv	s0,s10
ffffffffc0208aa4:	bd29                	j	ffffffffc02088be <vprintfmt+0x78>
ffffffffc0208aa6:	85a6                	mv	a1,s1
ffffffffc0208aa8:	02500513          	li	a0,37
ffffffffc0208aac:	9902                	jalr	s2
ffffffffc0208aae:	bbc9                	j	ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208ab0:	4705                	li	a4,1
ffffffffc0208ab2:	008a8593          	addi	a1,s5,8
ffffffffc0208ab6:	01074463          	blt	a4,a6,ffffffffc0208abe <vprintfmt+0x278>
ffffffffc0208aba:	08080d63          	beqz	a6,ffffffffc0208b54 <vprintfmt+0x30e>
ffffffffc0208abe:	000ab603          	ld	a2,0(s5)
ffffffffc0208ac2:	46a9                	li	a3,10
ffffffffc0208ac4:	8aae                	mv	s5,a1
ffffffffc0208ac6:	bf7d                	j	ffffffffc0208a84 <vprintfmt+0x23e>
ffffffffc0208ac8:	85a6                	mv	a1,s1
ffffffffc0208aca:	02500513          	li	a0,37
ffffffffc0208ace:	9902                	jalr	s2
ffffffffc0208ad0:	fff44703          	lbu	a4,-1(s0)
ffffffffc0208ad4:	02500793          	li	a5,37
ffffffffc0208ad8:	8d22                	mv	s10,s0
ffffffffc0208ada:	daf703e3          	beq	a4,a5,ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208ade:	02500713          	li	a4,37
ffffffffc0208ae2:	1d7d                	addi	s10,s10,-1
ffffffffc0208ae4:	fffd4783          	lbu	a5,-1(s10)
ffffffffc0208ae8:	fee79de3          	bne	a5,a4,ffffffffc0208ae2 <vprintfmt+0x29c>
ffffffffc0208aec:	bb51                	j	ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208aee:	00003617          	auipc	a2,0x3
ffffffffc0208af2:	fb260613          	addi	a2,a2,-78 # ffffffffc020baa0 <error_string+0x1a8>
ffffffffc0208af6:	85a6                	mv	a1,s1
ffffffffc0208af8:	854a                	mv	a0,s2
ffffffffc0208afa:	0ac000ef          	jal	ra,ffffffffc0208ba6 <printfmt>
ffffffffc0208afe:	b349                	j	ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208b00:	00003617          	auipc	a2,0x3
ffffffffc0208b04:	f9860613          	addi	a2,a2,-104 # ffffffffc020ba98 <error_string+0x1a0>
ffffffffc0208b08:	00003417          	auipc	s0,0x3
ffffffffc0208b0c:	f9140413          	addi	s0,s0,-111 # ffffffffc020ba99 <error_string+0x1a1>
ffffffffc0208b10:	8532                	mv	a0,a2
ffffffffc0208b12:	85e6                	mv	a1,s9
ffffffffc0208b14:	e032                	sd	a2,0(sp)
ffffffffc0208b16:	e43e                	sd	a5,8(sp)
ffffffffc0208b18:	0cc000ef          	jal	ra,ffffffffc0208be4 <strnlen>
ffffffffc0208b1c:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0208b20:	6602                	ld	a2,0(sp)
ffffffffc0208b22:	01b05d63          	blez	s11,ffffffffc0208b3c <vprintfmt+0x2f6>
ffffffffc0208b26:	67a2                	ld	a5,8(sp)
ffffffffc0208b28:	2781                	sext.w	a5,a5
ffffffffc0208b2a:	e43e                	sd	a5,8(sp)
ffffffffc0208b2c:	6522                	ld	a0,8(sp)
ffffffffc0208b2e:	85a6                	mv	a1,s1
ffffffffc0208b30:	e032                	sd	a2,0(sp)
ffffffffc0208b32:	3dfd                	addiw	s11,s11,-1
ffffffffc0208b34:	9902                	jalr	s2
ffffffffc0208b36:	6602                	ld	a2,0(sp)
ffffffffc0208b38:	fe0d9ae3          	bnez	s11,ffffffffc0208b2c <vprintfmt+0x2e6>
ffffffffc0208b3c:	00064783          	lbu	a5,0(a2)
ffffffffc0208b40:	0007851b          	sext.w	a0,a5
ffffffffc0208b44:	ec0510e3          	bnez	a0,ffffffffc0208a04 <vprintfmt+0x1be>
ffffffffc0208b48:	bb25                	j	ffffffffc0208880 <vprintfmt+0x3a>
ffffffffc0208b4a:	000ae603          	lwu	a2,0(s5)
ffffffffc0208b4e:	46a1                	li	a3,8
ffffffffc0208b50:	8aae                	mv	s5,a1
ffffffffc0208b52:	bf0d                	j	ffffffffc0208a84 <vprintfmt+0x23e>
ffffffffc0208b54:	000ae603          	lwu	a2,0(s5)
ffffffffc0208b58:	46a9                	li	a3,10
ffffffffc0208b5a:	8aae                	mv	s5,a1
ffffffffc0208b5c:	b725                	j	ffffffffc0208a84 <vprintfmt+0x23e>
ffffffffc0208b5e:	000aa403          	lw	s0,0(s5)
ffffffffc0208b62:	bd35                	j	ffffffffc020899e <vprintfmt+0x158>
ffffffffc0208b64:	000ae603          	lwu	a2,0(s5)
ffffffffc0208b68:	46c1                	li	a3,16
ffffffffc0208b6a:	8aae                	mv	s5,a1
ffffffffc0208b6c:	bf21                	j	ffffffffc0208a84 <vprintfmt+0x23e>
ffffffffc0208b6e:	9902                	jalr	s2
ffffffffc0208b70:	bd45                	j	ffffffffc0208a20 <vprintfmt+0x1da>
ffffffffc0208b72:	85a6                	mv	a1,s1
ffffffffc0208b74:	02d00513          	li	a0,45
ffffffffc0208b78:	e03e                	sd	a5,0(sp)
ffffffffc0208b7a:	9902                	jalr	s2
ffffffffc0208b7c:	8ace                	mv	s5,s3
ffffffffc0208b7e:	40800633          	neg	a2,s0
ffffffffc0208b82:	46a9                	li	a3,10
ffffffffc0208b84:	6782                	ld	a5,0(sp)
ffffffffc0208b86:	bdfd                	j	ffffffffc0208a84 <vprintfmt+0x23e>
ffffffffc0208b88:	01b05663          	blez	s11,ffffffffc0208b94 <vprintfmt+0x34e>
ffffffffc0208b8c:	02d00693          	li	a3,45
ffffffffc0208b90:	f6d798e3          	bne	a5,a3,ffffffffc0208b00 <vprintfmt+0x2ba>
ffffffffc0208b94:	00003417          	auipc	s0,0x3
ffffffffc0208b98:	f0540413          	addi	s0,s0,-251 # ffffffffc020ba99 <error_string+0x1a1>
ffffffffc0208b9c:	02800513          	li	a0,40
ffffffffc0208ba0:	02800793          	li	a5,40
ffffffffc0208ba4:	b585                	j	ffffffffc0208a04 <vprintfmt+0x1be>

ffffffffc0208ba6 <printfmt>:
ffffffffc0208ba6:	715d                	addi	sp,sp,-80
ffffffffc0208ba8:	02810313          	addi	t1,sp,40
ffffffffc0208bac:	f436                	sd	a3,40(sp)
ffffffffc0208bae:	869a                	mv	a3,t1
ffffffffc0208bb0:	ec06                	sd	ra,24(sp)
ffffffffc0208bb2:	f83a                	sd	a4,48(sp)
ffffffffc0208bb4:	fc3e                	sd	a5,56(sp)
ffffffffc0208bb6:	e0c2                	sd	a6,64(sp)
ffffffffc0208bb8:	e4c6                	sd	a7,72(sp)
ffffffffc0208bba:	e41a                	sd	t1,8(sp)
ffffffffc0208bbc:	c8bff0ef          	jal	ra,ffffffffc0208846 <vprintfmt>
ffffffffc0208bc0:	60e2                	ld	ra,24(sp)
ffffffffc0208bc2:	6161                	addi	sp,sp,80
ffffffffc0208bc4:	8082                	ret

ffffffffc0208bc6 <strlen>:
ffffffffc0208bc6:	00054783          	lbu	a5,0(a0)
ffffffffc0208bca:	cb91                	beqz	a5,ffffffffc0208bde <strlen+0x18>
ffffffffc0208bcc:	4781                	li	a5,0
ffffffffc0208bce:	0785                	addi	a5,a5,1
ffffffffc0208bd0:	00f50733          	add	a4,a0,a5
ffffffffc0208bd4:	00074703          	lbu	a4,0(a4)
ffffffffc0208bd8:	fb7d                	bnez	a4,ffffffffc0208bce <strlen+0x8>
ffffffffc0208bda:	853e                	mv	a0,a5
ffffffffc0208bdc:	8082                	ret
ffffffffc0208bde:	4781                	li	a5,0
ffffffffc0208be0:	853e                	mv	a0,a5
ffffffffc0208be2:	8082                	ret

ffffffffc0208be4 <strnlen>:
ffffffffc0208be4:	c185                	beqz	a1,ffffffffc0208c04 <strnlen+0x20>
ffffffffc0208be6:	00054783          	lbu	a5,0(a0)
ffffffffc0208bea:	cf89                	beqz	a5,ffffffffc0208c04 <strnlen+0x20>
ffffffffc0208bec:	4781                	li	a5,0
ffffffffc0208bee:	a021                	j	ffffffffc0208bf6 <strnlen+0x12>
ffffffffc0208bf0:	00074703          	lbu	a4,0(a4)
ffffffffc0208bf4:	c711                	beqz	a4,ffffffffc0208c00 <strnlen+0x1c>
ffffffffc0208bf6:	0785                	addi	a5,a5,1
ffffffffc0208bf8:	00f50733          	add	a4,a0,a5
ffffffffc0208bfc:	fef59ae3          	bne	a1,a5,ffffffffc0208bf0 <strnlen+0xc>
ffffffffc0208c00:	853e                	mv	a0,a5
ffffffffc0208c02:	8082                	ret
ffffffffc0208c04:	4781                	li	a5,0
ffffffffc0208c06:	853e                	mv	a0,a5
ffffffffc0208c08:	8082                	ret

ffffffffc0208c0a <strcpy>:
ffffffffc0208c0a:	87aa                	mv	a5,a0
ffffffffc0208c0c:	0585                	addi	a1,a1,1
ffffffffc0208c0e:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0208c12:	0785                	addi	a5,a5,1
ffffffffc0208c14:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0208c18:	fb75                	bnez	a4,ffffffffc0208c0c <strcpy+0x2>
ffffffffc0208c1a:	8082                	ret

ffffffffc0208c1c <strcmp>:
ffffffffc0208c1c:	00054783          	lbu	a5,0(a0)
ffffffffc0208c20:	0005c703          	lbu	a4,0(a1)
ffffffffc0208c24:	cb91                	beqz	a5,ffffffffc0208c38 <strcmp+0x1c>
ffffffffc0208c26:	00e79c63          	bne	a5,a4,ffffffffc0208c3e <strcmp+0x22>
ffffffffc0208c2a:	0505                	addi	a0,a0,1
ffffffffc0208c2c:	00054783          	lbu	a5,0(a0)
ffffffffc0208c30:	0585                	addi	a1,a1,1
ffffffffc0208c32:	0005c703          	lbu	a4,0(a1)
ffffffffc0208c36:	fbe5                	bnez	a5,ffffffffc0208c26 <strcmp+0xa>
ffffffffc0208c38:	4501                	li	a0,0
ffffffffc0208c3a:	9d19                	subw	a0,a0,a4
ffffffffc0208c3c:	8082                	ret
ffffffffc0208c3e:	0007851b          	sext.w	a0,a5
ffffffffc0208c42:	9d19                	subw	a0,a0,a4
ffffffffc0208c44:	8082                	ret

ffffffffc0208c46 <strchr>:
ffffffffc0208c46:	00054783          	lbu	a5,0(a0)
ffffffffc0208c4a:	cb91                	beqz	a5,ffffffffc0208c5e <strchr+0x18>
ffffffffc0208c4c:	00b79563          	bne	a5,a1,ffffffffc0208c56 <strchr+0x10>
ffffffffc0208c50:	a809                	j	ffffffffc0208c62 <strchr+0x1c>
ffffffffc0208c52:	00b78763          	beq	a5,a1,ffffffffc0208c60 <strchr+0x1a>
ffffffffc0208c56:	0505                	addi	a0,a0,1
ffffffffc0208c58:	00054783          	lbu	a5,0(a0)
ffffffffc0208c5c:	fbfd                	bnez	a5,ffffffffc0208c52 <strchr+0xc>
ffffffffc0208c5e:	4501                	li	a0,0
ffffffffc0208c60:	8082                	ret
ffffffffc0208c62:	8082                	ret

ffffffffc0208c64 <memset>:
ffffffffc0208c64:	ca01                	beqz	a2,ffffffffc0208c74 <memset+0x10>
ffffffffc0208c66:	962a                	add	a2,a2,a0
ffffffffc0208c68:	87aa                	mv	a5,a0
ffffffffc0208c6a:	0785                	addi	a5,a5,1
ffffffffc0208c6c:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0208c70:	fec79de3          	bne	a5,a2,ffffffffc0208c6a <memset+0x6>
ffffffffc0208c74:	8082                	ret

ffffffffc0208c76 <memcpy>:
ffffffffc0208c76:	ca19                	beqz	a2,ffffffffc0208c8c <memcpy+0x16>
ffffffffc0208c78:	962e                	add	a2,a2,a1
ffffffffc0208c7a:	87aa                	mv	a5,a0
ffffffffc0208c7c:	0585                	addi	a1,a1,1
ffffffffc0208c7e:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0208c82:	0785                	addi	a5,a5,1
ffffffffc0208c84:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0208c88:	fec59ae3          	bne	a1,a2,ffffffffc0208c7c <memcpy+0x6>
ffffffffc0208c8c:	8082                	ret
