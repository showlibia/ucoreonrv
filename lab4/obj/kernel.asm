
bin/kernel：     文件格式 elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c02092b7          	lui	t0,0xc0209
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	01e31313          	slli	t1,t1,0x1e
ffffffffc020000c:	406282b3          	sub	t0,t0,t1
ffffffffc0200010:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200014:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200018:	03f31313          	slli	t1,t1,0x3f
ffffffffc020001c:	0062e2b3          	or	t0,t0,t1
ffffffffc0200020:	18029073          	csrw	satp,t0
ffffffffc0200024:	12000073          	sfence.vma
ffffffffc0200028:	c0209137          	lui	sp,0xc0209
ffffffffc020002c:	c02002b7          	lui	t0,0xc0200
ffffffffc0200030:	03628293          	addi	t0,t0,54 # ffffffffc0200036 <kern_init>
ffffffffc0200034:	8282                	jr	t0

ffffffffc0200036 <kern_init>:
ffffffffc0200036:	0000a517          	auipc	a0,0xa
ffffffffc020003a:	02a50513          	addi	a0,a0,42 # ffffffffc020a060 <edata>
ffffffffc020003e:	00015617          	auipc	a2,0x15
ffffffffc0200042:	5c260613          	addi	a2,a2,1474 # ffffffffc0215600 <end>
ffffffffc0200046:	1141                	addi	sp,sp,-16
ffffffffc0200048:	8e09                	sub	a2,a2,a0
ffffffffc020004a:	4581                	li	a1,0
ffffffffc020004c:	e406                	sd	ra,8(sp)
ffffffffc020004e:	720040ef          	jal	ra,ffffffffc020476e <memset>
ffffffffc0200052:	51e000ef          	jal	ra,ffffffffc0200570 <cons_init>
ffffffffc0200056:	00005597          	auipc	a1,0x5
ffffffffc020005a:	b4a58593          	addi	a1,a1,-1206 # ffffffffc0204ba0 <etext+0x4>
ffffffffc020005e:	00005517          	auipc	a0,0x5
ffffffffc0200062:	b6250513          	addi	a0,a0,-1182 # ffffffffc0204bc0 <etext+0x24>
ffffffffc0200066:	082000ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020006a:	1e2000ef          	jal	ra,ffffffffc020024c <print_kerninfo>
ffffffffc020006e:	372030ef          	jal	ra,ffffffffc02033e0 <pmm_init>
ffffffffc0200072:	570000ef          	jal	ra,ffffffffc02005e2 <pic_init>
ffffffffc0200076:	5ec000ef          	jal	ra,ffffffffc0200662 <idt_init>
ffffffffc020007a:	501000ef          	jal	ra,ffffffffc0200d7a <vmm_init>
ffffffffc020007e:	00005517          	auipc	a0,0x5
ffffffffc0200082:	b4a50513          	addi	a0,a0,-1206 # ffffffffc0204bc8 <etext+0x2c>
ffffffffc0200086:	062000ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020008a:	42a040ef          	jal	ra,ffffffffc02044b4 <proc_init>
ffffffffc020008e:	00005517          	auipc	a0,0x5
ffffffffc0200092:	b5a50513          	addi	a0,a0,-1190 # ffffffffc0204be8 <etext+0x4c>
ffffffffc0200096:	052000ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020009a:	42a000ef          	jal	ra,ffffffffc02004c4 <ide_init>
ffffffffc020009e:	317010ef          	jal	ra,ffffffffc0201bb4 <swap_init>
ffffffffc02000a2:	47a000ef          	jal	ra,ffffffffc020051c <clock_init>
ffffffffc02000a6:	53e000ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc02000aa:	570040ef          	jal	ra,ffffffffc020461a <cpu_idle>

ffffffffc02000ae <cputch>:
ffffffffc02000ae:	1141                	addi	sp,sp,-16
ffffffffc02000b0:	e022                	sd	s0,0(sp)
ffffffffc02000b2:	e406                	sd	ra,8(sp)
ffffffffc02000b4:	842e                	mv	s0,a1
ffffffffc02000b6:	4bc000ef          	jal	ra,ffffffffc0200572 <cons_putc>
ffffffffc02000ba:	401c                	lw	a5,0(s0)
ffffffffc02000bc:	60a2                	ld	ra,8(sp)
ffffffffc02000be:	2785                	addiw	a5,a5,1
ffffffffc02000c0:	c01c                	sw	a5,0(s0)
ffffffffc02000c2:	6402                	ld	s0,0(sp)
ffffffffc02000c4:	0141                	addi	sp,sp,16
ffffffffc02000c6:	8082                	ret

ffffffffc02000c8 <vcprintf>:
ffffffffc02000c8:	1101                	addi	sp,sp,-32
ffffffffc02000ca:	86ae                	mv	a3,a1
ffffffffc02000cc:	862a                	mv	a2,a0
ffffffffc02000ce:	006c                	addi	a1,sp,12
ffffffffc02000d0:	00000517          	auipc	a0,0x0
ffffffffc02000d4:	fde50513          	addi	a0,a0,-34 # ffffffffc02000ae <cputch>
ffffffffc02000d8:	ec06                	sd	ra,24(sp)
ffffffffc02000da:	c602                	sw	zero,12(sp)
ffffffffc02000dc:	728040ef          	jal	ra,ffffffffc0204804 <vprintfmt>
ffffffffc02000e0:	60e2                	ld	ra,24(sp)
ffffffffc02000e2:	4532                	lw	a0,12(sp)
ffffffffc02000e4:	6105                	addi	sp,sp,32
ffffffffc02000e6:	8082                	ret

ffffffffc02000e8 <cprintf>:
ffffffffc02000e8:	711d                	addi	sp,sp,-96
ffffffffc02000ea:	02810313          	addi	t1,sp,40 # ffffffffc0209028 <boot_page_table_sv39+0x28>
ffffffffc02000ee:	f42e                	sd	a1,40(sp)
ffffffffc02000f0:	f832                	sd	a2,48(sp)
ffffffffc02000f2:	fc36                	sd	a3,56(sp)
ffffffffc02000f4:	862a                	mv	a2,a0
ffffffffc02000f6:	004c                	addi	a1,sp,4
ffffffffc02000f8:	00000517          	auipc	a0,0x0
ffffffffc02000fc:	fb650513          	addi	a0,a0,-74 # ffffffffc02000ae <cputch>
ffffffffc0200100:	869a                	mv	a3,t1
ffffffffc0200102:	ec06                	sd	ra,24(sp)
ffffffffc0200104:	e0ba                	sd	a4,64(sp)
ffffffffc0200106:	e4be                	sd	a5,72(sp)
ffffffffc0200108:	e8c2                	sd	a6,80(sp)
ffffffffc020010a:	ecc6                	sd	a7,88(sp)
ffffffffc020010c:	e41a                	sd	t1,8(sp)
ffffffffc020010e:	c202                	sw	zero,4(sp)
ffffffffc0200110:	6f4040ef          	jal	ra,ffffffffc0204804 <vprintfmt>
ffffffffc0200114:	60e2                	ld	ra,24(sp)
ffffffffc0200116:	4512                	lw	a0,4(sp)
ffffffffc0200118:	6125                	addi	sp,sp,96
ffffffffc020011a:	8082                	ret

ffffffffc020011c <cputchar>:
ffffffffc020011c:	a999                	j	ffffffffc0200572 <cons_putc>

ffffffffc020011e <getchar>:
ffffffffc020011e:	1141                	addi	sp,sp,-16
ffffffffc0200120:	e406                	sd	ra,8(sp)
ffffffffc0200122:	484000ef          	jal	ra,ffffffffc02005a6 <cons_getc>
ffffffffc0200126:	dd75                	beqz	a0,ffffffffc0200122 <getchar+0x4>
ffffffffc0200128:	60a2                	ld	ra,8(sp)
ffffffffc020012a:	0141                	addi	sp,sp,16
ffffffffc020012c:	8082                	ret

ffffffffc020012e <readline>:
ffffffffc020012e:	715d                	addi	sp,sp,-80
ffffffffc0200130:	e486                	sd	ra,72(sp)
ffffffffc0200132:	e0a2                	sd	s0,64(sp)
ffffffffc0200134:	fc26                	sd	s1,56(sp)
ffffffffc0200136:	f84a                	sd	s2,48(sp)
ffffffffc0200138:	f44e                	sd	s3,40(sp)
ffffffffc020013a:	f052                	sd	s4,32(sp)
ffffffffc020013c:	ec56                	sd	s5,24(sp)
ffffffffc020013e:	e85a                	sd	s6,16(sp)
ffffffffc0200140:	e45e                	sd	s7,8(sp)
ffffffffc0200142:	c901                	beqz	a0,ffffffffc0200152 <readline+0x24>
ffffffffc0200144:	85aa                	mv	a1,a0
ffffffffc0200146:	00005517          	auipc	a0,0x5
ffffffffc020014a:	ac250513          	addi	a0,a0,-1342 # ffffffffc0204c08 <etext+0x6c>
ffffffffc020014e:	f9bff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200152:	4481                	li	s1,0
ffffffffc0200154:	497d                	li	s2,31
ffffffffc0200156:	49a1                	li	s3,8
ffffffffc0200158:	4aa9                	li	s5,10
ffffffffc020015a:	4b35                	li	s6,13
ffffffffc020015c:	0000ab97          	auipc	s7,0xa
ffffffffc0200160:	f04b8b93          	addi	s7,s7,-252 # ffffffffc020a060 <edata>
ffffffffc0200164:	3fe00a13          	li	s4,1022
ffffffffc0200168:	fb7ff0ef          	jal	ra,ffffffffc020011e <getchar>
ffffffffc020016c:	842a                	mv	s0,a0
ffffffffc020016e:	00054b63          	bltz	a0,ffffffffc0200184 <readline+0x56>
ffffffffc0200172:	00a95b63          	bge	s2,a0,ffffffffc0200188 <readline+0x5a>
ffffffffc0200176:	029a5463          	bge	s4,s1,ffffffffc020019e <readline+0x70>
ffffffffc020017a:	fa5ff0ef          	jal	ra,ffffffffc020011e <getchar>
ffffffffc020017e:	842a                	mv	s0,a0
ffffffffc0200180:	fe0559e3          	bgez	a0,ffffffffc0200172 <readline+0x44>
ffffffffc0200184:	4501                	li	a0,0
ffffffffc0200186:	a099                	j	ffffffffc02001cc <readline+0x9e>
ffffffffc0200188:	03341463          	bne	s0,s3,ffffffffc02001b0 <readline+0x82>
ffffffffc020018c:	e8b9                	bnez	s1,ffffffffc02001e2 <readline+0xb4>
ffffffffc020018e:	f91ff0ef          	jal	ra,ffffffffc020011e <getchar>
ffffffffc0200192:	842a                	mv	s0,a0
ffffffffc0200194:	fe0548e3          	bltz	a0,ffffffffc0200184 <readline+0x56>
ffffffffc0200198:	fea958e3          	bge	s2,a0,ffffffffc0200188 <readline+0x5a>
ffffffffc020019c:	4481                	li	s1,0
ffffffffc020019e:	8522                	mv	a0,s0
ffffffffc02001a0:	f7dff0ef          	jal	ra,ffffffffc020011c <cputchar>
ffffffffc02001a4:	009b87b3          	add	a5,s7,s1
ffffffffc02001a8:	00878023          	sb	s0,0(a5)
ffffffffc02001ac:	2485                	addiw	s1,s1,1
ffffffffc02001ae:	bf6d                	j	ffffffffc0200168 <readline+0x3a>
ffffffffc02001b0:	01540463          	beq	s0,s5,ffffffffc02001b8 <readline+0x8a>
ffffffffc02001b4:	fb641ae3          	bne	s0,s6,ffffffffc0200168 <readline+0x3a>
ffffffffc02001b8:	8522                	mv	a0,s0
ffffffffc02001ba:	f63ff0ef          	jal	ra,ffffffffc020011c <cputchar>
ffffffffc02001be:	0000a517          	auipc	a0,0xa
ffffffffc02001c2:	ea250513          	addi	a0,a0,-350 # ffffffffc020a060 <edata>
ffffffffc02001c6:	94aa                	add	s1,s1,a0
ffffffffc02001c8:	00048023          	sb	zero,0(s1)
ffffffffc02001cc:	60a6                	ld	ra,72(sp)
ffffffffc02001ce:	6406                	ld	s0,64(sp)
ffffffffc02001d0:	74e2                	ld	s1,56(sp)
ffffffffc02001d2:	7942                	ld	s2,48(sp)
ffffffffc02001d4:	79a2                	ld	s3,40(sp)
ffffffffc02001d6:	7a02                	ld	s4,32(sp)
ffffffffc02001d8:	6ae2                	ld	s5,24(sp)
ffffffffc02001da:	6b42                	ld	s6,16(sp)
ffffffffc02001dc:	6ba2                	ld	s7,8(sp)
ffffffffc02001de:	6161                	addi	sp,sp,80
ffffffffc02001e0:	8082                	ret
ffffffffc02001e2:	4521                	li	a0,8
ffffffffc02001e4:	f39ff0ef          	jal	ra,ffffffffc020011c <cputchar>
ffffffffc02001e8:	34fd                	addiw	s1,s1,-1
ffffffffc02001ea:	bfbd                	j	ffffffffc0200168 <readline+0x3a>

ffffffffc02001ec <__panic>:
ffffffffc02001ec:	00015317          	auipc	t1,0x15
ffffffffc02001f0:	28430313          	addi	t1,t1,644 # ffffffffc0215470 <is_panic>
ffffffffc02001f4:	00032303          	lw	t1,0(t1)
ffffffffc02001f8:	715d                	addi	sp,sp,-80
ffffffffc02001fa:	ec06                	sd	ra,24(sp)
ffffffffc02001fc:	e822                	sd	s0,16(sp)
ffffffffc02001fe:	f436                	sd	a3,40(sp)
ffffffffc0200200:	f83a                	sd	a4,48(sp)
ffffffffc0200202:	fc3e                	sd	a5,56(sp)
ffffffffc0200204:	e0c2                	sd	a6,64(sp)
ffffffffc0200206:	e4c6                	sd	a7,72(sp)
ffffffffc0200208:	02031c63          	bnez	t1,ffffffffc0200240 <__panic+0x54>
ffffffffc020020c:	4785                	li	a5,1
ffffffffc020020e:	8432                	mv	s0,a2
ffffffffc0200210:	00015717          	auipc	a4,0x15
ffffffffc0200214:	26f72023          	sw	a5,608(a4) # ffffffffc0215470 <is_panic>
ffffffffc0200218:	862e                	mv	a2,a1
ffffffffc020021a:	103c                	addi	a5,sp,40
ffffffffc020021c:	85aa                	mv	a1,a0
ffffffffc020021e:	00005517          	auipc	a0,0x5
ffffffffc0200222:	9f250513          	addi	a0,a0,-1550 # ffffffffc0204c10 <etext+0x74>
ffffffffc0200226:	e43e                	sd	a5,8(sp)
ffffffffc0200228:	ec1ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020022c:	65a2                	ld	a1,8(sp)
ffffffffc020022e:	8522                	mv	a0,s0
ffffffffc0200230:	e99ff0ef          	jal	ra,ffffffffc02000c8 <vcprintf>
ffffffffc0200234:	00006517          	auipc	a0,0x6
ffffffffc0200238:	49c50513          	addi	a0,a0,1180 # ffffffffc02066d0 <default_pmm_manager+0x3c8>
ffffffffc020023c:	eadff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200240:	3aa000ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0200244:	4501                	li	a0,0
ffffffffc0200246:	130000ef          	jal	ra,ffffffffc0200376 <kmonitor>
ffffffffc020024a:	bfed                	j	ffffffffc0200244 <__panic+0x58>

ffffffffc020024c <print_kerninfo>:
ffffffffc020024c:	1141                	addi	sp,sp,-16
ffffffffc020024e:	00005517          	auipc	a0,0x5
ffffffffc0200252:	a1250513          	addi	a0,a0,-1518 # ffffffffc0204c60 <etext+0xc4>
ffffffffc0200256:	e406                	sd	ra,8(sp)
ffffffffc0200258:	e91ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020025c:	00000597          	auipc	a1,0x0
ffffffffc0200260:	dda58593          	addi	a1,a1,-550 # ffffffffc0200036 <kern_init>
ffffffffc0200264:	00005517          	auipc	a0,0x5
ffffffffc0200268:	a1c50513          	addi	a0,a0,-1508 # ffffffffc0204c80 <etext+0xe4>
ffffffffc020026c:	e7dff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200270:	00005597          	auipc	a1,0x5
ffffffffc0200274:	92c58593          	addi	a1,a1,-1748 # ffffffffc0204b9c <etext>
ffffffffc0200278:	00005517          	auipc	a0,0x5
ffffffffc020027c:	a2850513          	addi	a0,a0,-1496 # ffffffffc0204ca0 <etext+0x104>
ffffffffc0200280:	e69ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200284:	0000a597          	auipc	a1,0xa
ffffffffc0200288:	ddc58593          	addi	a1,a1,-548 # ffffffffc020a060 <edata>
ffffffffc020028c:	00005517          	auipc	a0,0x5
ffffffffc0200290:	a3450513          	addi	a0,a0,-1484 # ffffffffc0204cc0 <etext+0x124>
ffffffffc0200294:	e55ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200298:	00015597          	auipc	a1,0x15
ffffffffc020029c:	36858593          	addi	a1,a1,872 # ffffffffc0215600 <end>
ffffffffc02002a0:	00005517          	auipc	a0,0x5
ffffffffc02002a4:	a4050513          	addi	a0,a0,-1472 # ffffffffc0204ce0 <etext+0x144>
ffffffffc02002a8:	e41ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02002ac:	00015597          	auipc	a1,0x15
ffffffffc02002b0:	75358593          	addi	a1,a1,1875 # ffffffffc02159ff <end+0x3ff>
ffffffffc02002b4:	00000797          	auipc	a5,0x0
ffffffffc02002b8:	d8278793          	addi	a5,a5,-638 # ffffffffc0200036 <kern_init>
ffffffffc02002bc:	40f587b3          	sub	a5,a1,a5
ffffffffc02002c0:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002c4:	60a2                	ld	ra,8(sp)
ffffffffc02002c6:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002ca:	95be                	add	a1,a1,a5
ffffffffc02002cc:	85a9                	srai	a1,a1,0xa
ffffffffc02002ce:	00005517          	auipc	a0,0x5
ffffffffc02002d2:	a3250513          	addi	a0,a0,-1486 # ffffffffc0204d00 <etext+0x164>
ffffffffc02002d6:	0141                	addi	sp,sp,16
ffffffffc02002d8:	bd01                	j	ffffffffc02000e8 <cprintf>

ffffffffc02002da <print_stackframe>:
ffffffffc02002da:	1141                	addi	sp,sp,-16
ffffffffc02002dc:	00005617          	auipc	a2,0x5
ffffffffc02002e0:	95460613          	addi	a2,a2,-1708 # ffffffffc0204c30 <etext+0x94>
ffffffffc02002e4:	05b00593          	li	a1,91
ffffffffc02002e8:	00005517          	auipc	a0,0x5
ffffffffc02002ec:	96050513          	addi	a0,a0,-1696 # ffffffffc0204c48 <etext+0xac>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	efbff0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc02002f6 <mon_help>:
ffffffffc02002f6:	1141                	addi	sp,sp,-16
ffffffffc02002f8:	00005617          	auipc	a2,0x5
ffffffffc02002fc:	b1860613          	addi	a2,a2,-1256 # ffffffffc0204e10 <commands+0xe0>
ffffffffc0200300:	00005597          	auipc	a1,0x5
ffffffffc0200304:	b3058593          	addi	a1,a1,-1232 # ffffffffc0204e30 <commands+0x100>
ffffffffc0200308:	00005517          	auipc	a0,0x5
ffffffffc020030c:	b3050513          	addi	a0,a0,-1232 # ffffffffc0204e38 <commands+0x108>
ffffffffc0200310:	e406                	sd	ra,8(sp)
ffffffffc0200312:	dd7ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200316:	00005617          	auipc	a2,0x5
ffffffffc020031a:	b3260613          	addi	a2,a2,-1230 # ffffffffc0204e48 <commands+0x118>
ffffffffc020031e:	00005597          	auipc	a1,0x5
ffffffffc0200322:	b5258593          	addi	a1,a1,-1198 # ffffffffc0204e70 <commands+0x140>
ffffffffc0200326:	00005517          	auipc	a0,0x5
ffffffffc020032a:	b1250513          	addi	a0,a0,-1262 # ffffffffc0204e38 <commands+0x108>
ffffffffc020032e:	dbbff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200332:	00005617          	auipc	a2,0x5
ffffffffc0200336:	b4e60613          	addi	a2,a2,-1202 # ffffffffc0204e80 <commands+0x150>
ffffffffc020033a:	00005597          	auipc	a1,0x5
ffffffffc020033e:	b6658593          	addi	a1,a1,-1178 # ffffffffc0204ea0 <commands+0x170>
ffffffffc0200342:	00005517          	auipc	a0,0x5
ffffffffc0200346:	af650513          	addi	a0,a0,-1290 # ffffffffc0204e38 <commands+0x108>
ffffffffc020034a:	d9fff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020034e:	60a2                	ld	ra,8(sp)
ffffffffc0200350:	4501                	li	a0,0
ffffffffc0200352:	0141                	addi	sp,sp,16
ffffffffc0200354:	8082                	ret

ffffffffc0200356 <mon_kerninfo>:
ffffffffc0200356:	1141                	addi	sp,sp,-16
ffffffffc0200358:	e406                	sd	ra,8(sp)
ffffffffc020035a:	ef3ff0ef          	jal	ra,ffffffffc020024c <print_kerninfo>
ffffffffc020035e:	60a2                	ld	ra,8(sp)
ffffffffc0200360:	4501                	li	a0,0
ffffffffc0200362:	0141                	addi	sp,sp,16
ffffffffc0200364:	8082                	ret

ffffffffc0200366 <mon_backtrace>:
ffffffffc0200366:	1141                	addi	sp,sp,-16
ffffffffc0200368:	e406                	sd	ra,8(sp)
ffffffffc020036a:	f71ff0ef          	jal	ra,ffffffffc02002da <print_stackframe>
ffffffffc020036e:	60a2                	ld	ra,8(sp)
ffffffffc0200370:	4501                	li	a0,0
ffffffffc0200372:	0141                	addi	sp,sp,16
ffffffffc0200374:	8082                	ret

ffffffffc0200376 <kmonitor>:
ffffffffc0200376:	7115                	addi	sp,sp,-224
ffffffffc0200378:	e962                	sd	s8,144(sp)
ffffffffc020037a:	8c2a                	mv	s8,a0
ffffffffc020037c:	00005517          	auipc	a0,0x5
ffffffffc0200380:	9fc50513          	addi	a0,a0,-1540 # ffffffffc0204d78 <commands+0x48>
ffffffffc0200384:	ed86                	sd	ra,216(sp)
ffffffffc0200386:	e9a2                	sd	s0,208(sp)
ffffffffc0200388:	e5a6                	sd	s1,200(sp)
ffffffffc020038a:	e1ca                	sd	s2,192(sp)
ffffffffc020038c:	fd4e                	sd	s3,184(sp)
ffffffffc020038e:	f952                	sd	s4,176(sp)
ffffffffc0200390:	f556                	sd	s5,168(sp)
ffffffffc0200392:	f15a                	sd	s6,160(sp)
ffffffffc0200394:	ed5e                	sd	s7,152(sp)
ffffffffc0200396:	e566                	sd	s9,136(sp)
ffffffffc0200398:	e16a                	sd	s10,128(sp)
ffffffffc020039a:	d4fff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020039e:	00005517          	auipc	a0,0x5
ffffffffc02003a2:	a0250513          	addi	a0,a0,-1534 # ffffffffc0204da0 <commands+0x70>
ffffffffc02003a6:	d43ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02003aa:	000c0563          	beqz	s8,ffffffffc02003b4 <kmonitor+0x3e>
ffffffffc02003ae:	8562                	mv	a0,s8
ffffffffc02003b0:	49a000ef          	jal	ra,ffffffffc020084a <print_trapframe>
ffffffffc02003b4:	4501                	li	a0,0
ffffffffc02003b6:	4581                	li	a1,0
ffffffffc02003b8:	4601                	li	a2,0
ffffffffc02003ba:	48a1                	li	a7,8
ffffffffc02003bc:	00000073          	ecall
ffffffffc02003c0:	00005c97          	auipc	s9,0x5
ffffffffc02003c4:	970c8c93          	addi	s9,s9,-1680 # ffffffffc0204d30 <commands>
ffffffffc02003c8:	00005997          	auipc	s3,0x5
ffffffffc02003cc:	a0098993          	addi	s3,s3,-1536 # ffffffffc0204dc8 <commands+0x98>
ffffffffc02003d0:	00005917          	auipc	s2,0x5
ffffffffc02003d4:	a0090913          	addi	s2,s2,-1536 # ffffffffc0204dd0 <commands+0xa0>
ffffffffc02003d8:	4a3d                	li	s4,15
ffffffffc02003da:	00005b17          	auipc	s6,0x5
ffffffffc02003de:	9feb0b13          	addi	s6,s6,-1538 # ffffffffc0204dd8 <commands+0xa8>
ffffffffc02003e2:	00005a97          	auipc	s5,0x5
ffffffffc02003e6:	a4ea8a93          	addi	s5,s5,-1458 # ffffffffc0204e30 <commands+0x100>
ffffffffc02003ea:	4b8d                	li	s7,3
ffffffffc02003ec:	854e                	mv	a0,s3
ffffffffc02003ee:	d41ff0ef          	jal	ra,ffffffffc020012e <readline>
ffffffffc02003f2:	842a                	mv	s0,a0
ffffffffc02003f4:	dd65                	beqz	a0,ffffffffc02003ec <kmonitor+0x76>
ffffffffc02003f6:	00054583          	lbu	a1,0(a0)
ffffffffc02003fa:	4481                	li	s1,0
ffffffffc02003fc:	c999                	beqz	a1,ffffffffc0200412 <kmonitor+0x9c>
ffffffffc02003fe:	854a                	mv	a0,s2
ffffffffc0200400:	350040ef          	jal	ra,ffffffffc0204750 <strchr>
ffffffffc0200404:	c925                	beqz	a0,ffffffffc0200474 <kmonitor+0xfe>
ffffffffc0200406:	00144583          	lbu	a1,1(s0)
ffffffffc020040a:	00040023          	sb	zero,0(s0)
ffffffffc020040e:	0405                	addi	s0,s0,1
ffffffffc0200410:	f5fd                	bnez	a1,ffffffffc02003fe <kmonitor+0x88>
ffffffffc0200412:	dce9                	beqz	s1,ffffffffc02003ec <kmonitor+0x76>
ffffffffc0200414:	6582                	ld	a1,0(sp)
ffffffffc0200416:	00005d17          	auipc	s10,0x5
ffffffffc020041a:	91ad0d13          	addi	s10,s10,-1766 # ffffffffc0204d30 <commands>
ffffffffc020041e:	8556                	mv	a0,s5
ffffffffc0200420:	4401                	li	s0,0
ffffffffc0200422:	0d61                	addi	s10,s10,24
ffffffffc0200424:	302040ef          	jal	ra,ffffffffc0204726 <strcmp>
ffffffffc0200428:	c919                	beqz	a0,ffffffffc020043e <kmonitor+0xc8>
ffffffffc020042a:	2405                	addiw	s0,s0,1
ffffffffc020042c:	09740463          	beq	s0,s7,ffffffffc02004b4 <kmonitor+0x13e>
ffffffffc0200430:	000d3503          	ld	a0,0(s10)
ffffffffc0200434:	6582                	ld	a1,0(sp)
ffffffffc0200436:	0d61                	addi	s10,s10,24
ffffffffc0200438:	2ee040ef          	jal	ra,ffffffffc0204726 <strcmp>
ffffffffc020043c:	f57d                	bnez	a0,ffffffffc020042a <kmonitor+0xb4>
ffffffffc020043e:	00141793          	slli	a5,s0,0x1
ffffffffc0200442:	97a2                	add	a5,a5,s0
ffffffffc0200444:	078e                	slli	a5,a5,0x3
ffffffffc0200446:	97e6                	add	a5,a5,s9
ffffffffc0200448:	6b9c                	ld	a5,16(a5)
ffffffffc020044a:	8662                	mv	a2,s8
ffffffffc020044c:	002c                	addi	a1,sp,8
ffffffffc020044e:	fff4851b          	addiw	a0,s1,-1
ffffffffc0200452:	9782                	jalr	a5
ffffffffc0200454:	f8055ce3          	bgez	a0,ffffffffc02003ec <kmonitor+0x76>
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
ffffffffc0200474:	00044783          	lbu	a5,0(s0)
ffffffffc0200478:	dfc9                	beqz	a5,ffffffffc0200412 <kmonitor+0x9c>
ffffffffc020047a:	03448863          	beq	s1,s4,ffffffffc02004aa <kmonitor+0x134>
ffffffffc020047e:	00349793          	slli	a5,s1,0x3
ffffffffc0200482:	0118                	addi	a4,sp,128
ffffffffc0200484:	97ba                	add	a5,a5,a4
ffffffffc0200486:	f887b023          	sd	s0,-128(a5)
ffffffffc020048a:	00044583          	lbu	a1,0(s0)
ffffffffc020048e:	2485                	addiw	s1,s1,1
ffffffffc0200490:	e591                	bnez	a1,ffffffffc020049c <kmonitor+0x126>
ffffffffc0200492:	b749                	j	ffffffffc0200414 <kmonitor+0x9e>
ffffffffc0200494:	0405                	addi	s0,s0,1
ffffffffc0200496:	00044583          	lbu	a1,0(s0)
ffffffffc020049a:	ddad                	beqz	a1,ffffffffc0200414 <kmonitor+0x9e>
ffffffffc020049c:	854a                	mv	a0,s2
ffffffffc020049e:	2b2040ef          	jal	ra,ffffffffc0204750 <strchr>
ffffffffc02004a2:	d96d                	beqz	a0,ffffffffc0200494 <kmonitor+0x11e>
ffffffffc02004a4:	00044583          	lbu	a1,0(s0)
ffffffffc02004a8:	bf91                	j	ffffffffc02003fc <kmonitor+0x86>
ffffffffc02004aa:	45c1                	li	a1,16
ffffffffc02004ac:	855a                	mv	a0,s6
ffffffffc02004ae:	c3bff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02004b2:	b7f1                	j	ffffffffc020047e <kmonitor+0x108>
ffffffffc02004b4:	6582                	ld	a1,0(sp)
ffffffffc02004b6:	00005517          	auipc	a0,0x5
ffffffffc02004ba:	94250513          	addi	a0,a0,-1726 # ffffffffc0204df8 <commands+0xc8>
ffffffffc02004be:	c2bff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02004c2:	b72d                	j	ffffffffc02003ec <kmonitor+0x76>

ffffffffc02004c4 <ide_init>:
ffffffffc02004c4:	8082                	ret

ffffffffc02004c6 <ide_device_valid>:
ffffffffc02004c6:	00253513          	sltiu	a0,a0,2
ffffffffc02004ca:	8082                	ret

ffffffffc02004cc <ide_device_size>:
ffffffffc02004cc:	03800513          	li	a0,56
ffffffffc02004d0:	8082                	ret

ffffffffc02004d2 <ide_read_secs>:
ffffffffc02004d2:	0000a797          	auipc	a5,0xa
ffffffffc02004d6:	f8e78793          	addi	a5,a5,-114 # ffffffffc020a460 <ide>
ffffffffc02004da:	0095959b          	slliw	a1,a1,0x9
ffffffffc02004de:	1141                	addi	sp,sp,-16
ffffffffc02004e0:	8532                	mv	a0,a2
ffffffffc02004e2:	95be                	add	a1,a1,a5
ffffffffc02004e4:	00969613          	slli	a2,a3,0x9
ffffffffc02004e8:	e406                	sd	ra,8(sp)
ffffffffc02004ea:	296040ef          	jal	ra,ffffffffc0204780 <memcpy>
ffffffffc02004ee:	60a2                	ld	ra,8(sp)
ffffffffc02004f0:	4501                	li	a0,0
ffffffffc02004f2:	0141                	addi	sp,sp,16
ffffffffc02004f4:	8082                	ret

ffffffffc02004f6 <ide_write_secs>:
ffffffffc02004f6:	8732                	mv	a4,a2
ffffffffc02004f8:	0095979b          	slliw	a5,a1,0x9
ffffffffc02004fc:	0000a517          	auipc	a0,0xa
ffffffffc0200500:	f6450513          	addi	a0,a0,-156 # ffffffffc020a460 <ide>
ffffffffc0200504:	1141                	addi	sp,sp,-16
ffffffffc0200506:	00969613          	slli	a2,a3,0x9
ffffffffc020050a:	85ba                	mv	a1,a4
ffffffffc020050c:	953e                	add	a0,a0,a5
ffffffffc020050e:	e406                	sd	ra,8(sp)
ffffffffc0200510:	270040ef          	jal	ra,ffffffffc0204780 <memcpy>
ffffffffc0200514:	60a2                	ld	ra,8(sp)
ffffffffc0200516:	4501                	li	a0,0
ffffffffc0200518:	0141                	addi	sp,sp,16
ffffffffc020051a:	8082                	ret

ffffffffc020051c <clock_init>:
ffffffffc020051c:	67e1                	lui	a5,0x18
ffffffffc020051e:	6a078793          	addi	a5,a5,1696 # 186a0 <BASE_ADDRESS-0xffffffffc01e7960>
ffffffffc0200522:	00015717          	auipc	a4,0x15
ffffffffc0200526:	f4f73b23          	sd	a5,-170(a4) # ffffffffc0215478 <timebase>
ffffffffc020052a:	c0102573          	rdtime	a0
ffffffffc020052e:	4581                	li	a1,0
ffffffffc0200530:	953e                	add	a0,a0,a5
ffffffffc0200532:	4601                	li	a2,0
ffffffffc0200534:	4881                	li	a7,0
ffffffffc0200536:	00000073          	ecall
ffffffffc020053a:	02000793          	li	a5,32
ffffffffc020053e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200542:	00005517          	auipc	a0,0x5
ffffffffc0200546:	96e50513          	addi	a0,a0,-1682 # ffffffffc0204eb0 <commands+0x180>
ffffffffc020054a:	00015797          	auipc	a5,0x15
ffffffffc020054e:	f807b323          	sd	zero,-122(a5) # ffffffffc02154d0 <ticks>
ffffffffc0200552:	be59                	j	ffffffffc02000e8 <cprintf>

ffffffffc0200554 <clock_set_next_event>:
ffffffffc0200554:	c0102573          	rdtime	a0
ffffffffc0200558:	00015797          	auipc	a5,0x15
ffffffffc020055c:	f2078793          	addi	a5,a5,-224 # ffffffffc0215478 <timebase>
ffffffffc0200560:	639c                	ld	a5,0(a5)
ffffffffc0200562:	4581                	li	a1,0
ffffffffc0200564:	4601                	li	a2,0
ffffffffc0200566:	953e                	add	a0,a0,a5
ffffffffc0200568:	4881                	li	a7,0
ffffffffc020056a:	00000073          	ecall
ffffffffc020056e:	8082                	ret

ffffffffc0200570 <cons_init>:
ffffffffc0200570:	8082                	ret

ffffffffc0200572 <cons_putc>:
ffffffffc0200572:	100027f3          	csrr	a5,sstatus
ffffffffc0200576:	8b89                	andi	a5,a5,2
ffffffffc0200578:	0ff57513          	andi	a0,a0,255
ffffffffc020057c:	e799                	bnez	a5,ffffffffc020058a <cons_putc+0x18>
ffffffffc020057e:	4581                	li	a1,0
ffffffffc0200580:	4601                	li	a2,0
ffffffffc0200582:	4885                	li	a7,1
ffffffffc0200584:	00000073          	ecall
ffffffffc0200588:	8082                	ret
ffffffffc020058a:	1101                	addi	sp,sp,-32
ffffffffc020058c:	ec06                	sd	ra,24(sp)
ffffffffc020058e:	e42a                	sd	a0,8(sp)
ffffffffc0200590:	05a000ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0200594:	6522                	ld	a0,8(sp)
ffffffffc0200596:	4581                	li	a1,0
ffffffffc0200598:	4601                	li	a2,0
ffffffffc020059a:	4885                	li	a7,1
ffffffffc020059c:	00000073          	ecall
ffffffffc02005a0:	60e2                	ld	ra,24(sp)
ffffffffc02005a2:	6105                	addi	sp,sp,32
ffffffffc02005a4:	a081                	j	ffffffffc02005e4 <intr_enable>

ffffffffc02005a6 <cons_getc>:
ffffffffc02005a6:	100027f3          	csrr	a5,sstatus
ffffffffc02005aa:	8b89                	andi	a5,a5,2
ffffffffc02005ac:	eb89                	bnez	a5,ffffffffc02005be <cons_getc+0x18>
ffffffffc02005ae:	4501                	li	a0,0
ffffffffc02005b0:	4581                	li	a1,0
ffffffffc02005b2:	4601                	li	a2,0
ffffffffc02005b4:	4889                	li	a7,2
ffffffffc02005b6:	00000073          	ecall
ffffffffc02005ba:	2501                	sext.w	a0,a0
ffffffffc02005bc:	8082                	ret
ffffffffc02005be:	1101                	addi	sp,sp,-32
ffffffffc02005c0:	ec06                	sd	ra,24(sp)
ffffffffc02005c2:	028000ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc02005c6:	4501                	li	a0,0
ffffffffc02005c8:	4581                	li	a1,0
ffffffffc02005ca:	4601                	li	a2,0
ffffffffc02005cc:	4889                	li	a7,2
ffffffffc02005ce:	00000073          	ecall
ffffffffc02005d2:	2501                	sext.w	a0,a0
ffffffffc02005d4:	e42a                	sd	a0,8(sp)
ffffffffc02005d6:	00e000ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc02005da:	60e2                	ld	ra,24(sp)
ffffffffc02005dc:	6522                	ld	a0,8(sp)
ffffffffc02005de:	6105                	addi	sp,sp,32
ffffffffc02005e0:	8082                	ret

ffffffffc02005e2 <pic_init>:
ffffffffc02005e2:	8082                	ret

ffffffffc02005e4 <intr_enable>:
ffffffffc02005e4:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc02005e8:	8082                	ret

ffffffffc02005ea <intr_disable>:
ffffffffc02005ea:	100177f3          	csrrci	a5,sstatus,2
ffffffffc02005ee:	8082                	ret

ffffffffc02005f0 <pgfault_handler>:
ffffffffc02005f0:	10053783          	ld	a5,256(a0)
ffffffffc02005f4:	1141                	addi	sp,sp,-16
ffffffffc02005f6:	e022                	sd	s0,0(sp)
ffffffffc02005f8:	e406                	sd	ra,8(sp)
ffffffffc02005fa:	1007f793          	andi	a5,a5,256
ffffffffc02005fe:	842a                	mv	s0,a0
ffffffffc0200600:	11053583          	ld	a1,272(a0)
ffffffffc0200604:	05500613          	li	a2,85
ffffffffc0200608:	c399                	beqz	a5,ffffffffc020060e <pgfault_handler+0x1e>
ffffffffc020060a:	04b00613          	li	a2,75
ffffffffc020060e:	11843703          	ld	a4,280(s0)
ffffffffc0200612:	47bd                	li	a5,15
ffffffffc0200614:	05700693          	li	a3,87
ffffffffc0200618:	00f70463          	beq	a4,a5,ffffffffc0200620 <pgfault_handler+0x30>
ffffffffc020061c:	05200693          	li	a3,82
ffffffffc0200620:	00005517          	auipc	a0,0x5
ffffffffc0200624:	b8850513          	addi	a0,a0,-1144 # ffffffffc02051a8 <commands+0x478>
ffffffffc0200628:	ac1ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020062c:	00015797          	auipc	a5,0x15
ffffffffc0200630:	eac78793          	addi	a5,a5,-340 # ffffffffc02154d8 <check_mm_struct>
ffffffffc0200634:	6388                	ld	a0,0(a5)
ffffffffc0200636:	c911                	beqz	a0,ffffffffc020064a <pgfault_handler+0x5a>
ffffffffc0200638:	11043603          	ld	a2,272(s0)
ffffffffc020063c:	11842583          	lw	a1,280(s0)
ffffffffc0200640:	6402                	ld	s0,0(sp)
ffffffffc0200642:	60a2                	ld	ra,8(sp)
ffffffffc0200644:	0141                	addi	sp,sp,16
ffffffffc0200646:	4070006f          	j	ffffffffc020124c <do_pgfault>
ffffffffc020064a:	00005617          	auipc	a2,0x5
ffffffffc020064e:	b7e60613          	addi	a2,a2,-1154 # ffffffffc02051c8 <commands+0x498>
ffffffffc0200652:	06200593          	li	a1,98
ffffffffc0200656:	00005517          	auipc	a0,0x5
ffffffffc020065a:	b8a50513          	addi	a0,a0,-1142 # ffffffffc02051e0 <commands+0x4b0>
ffffffffc020065e:	b8fff0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0200662 <idt_init>:
ffffffffc0200662:	14005073          	csrwi	sscratch,0
ffffffffc0200666:	00000797          	auipc	a5,0x0
ffffffffc020066a:	48278793          	addi	a5,a5,1154 # ffffffffc0200ae8 <__alltraps>
ffffffffc020066e:	10579073          	csrw	stvec,a5
ffffffffc0200672:	000407b7          	lui	a5,0x40
ffffffffc0200676:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc020067a:	8082                	ret

ffffffffc020067c <print_regs>:
ffffffffc020067c:	610c                	ld	a1,0(a0)
ffffffffc020067e:	1141                	addi	sp,sp,-16
ffffffffc0200680:	e022                	sd	s0,0(sp)
ffffffffc0200682:	842a                	mv	s0,a0
ffffffffc0200684:	00005517          	auipc	a0,0x5
ffffffffc0200688:	b7450513          	addi	a0,a0,-1164 # ffffffffc02051f8 <commands+0x4c8>
ffffffffc020068c:	e406                	sd	ra,8(sp)
ffffffffc020068e:	a5bff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200692:	640c                	ld	a1,8(s0)
ffffffffc0200694:	00005517          	auipc	a0,0x5
ffffffffc0200698:	b7c50513          	addi	a0,a0,-1156 # ffffffffc0205210 <commands+0x4e0>
ffffffffc020069c:	a4dff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02006a0:	680c                	ld	a1,16(s0)
ffffffffc02006a2:	00005517          	auipc	a0,0x5
ffffffffc02006a6:	b8650513          	addi	a0,a0,-1146 # ffffffffc0205228 <commands+0x4f8>
ffffffffc02006aa:	a3fff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02006ae:	6c0c                	ld	a1,24(s0)
ffffffffc02006b0:	00005517          	auipc	a0,0x5
ffffffffc02006b4:	b9050513          	addi	a0,a0,-1136 # ffffffffc0205240 <commands+0x510>
ffffffffc02006b8:	a31ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02006bc:	700c                	ld	a1,32(s0)
ffffffffc02006be:	00005517          	auipc	a0,0x5
ffffffffc02006c2:	b9a50513          	addi	a0,a0,-1126 # ffffffffc0205258 <commands+0x528>
ffffffffc02006c6:	a23ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02006ca:	740c                	ld	a1,40(s0)
ffffffffc02006cc:	00005517          	auipc	a0,0x5
ffffffffc02006d0:	ba450513          	addi	a0,a0,-1116 # ffffffffc0205270 <commands+0x540>
ffffffffc02006d4:	a15ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02006d8:	780c                	ld	a1,48(s0)
ffffffffc02006da:	00005517          	auipc	a0,0x5
ffffffffc02006de:	bae50513          	addi	a0,a0,-1106 # ffffffffc0205288 <commands+0x558>
ffffffffc02006e2:	a07ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02006e6:	7c0c                	ld	a1,56(s0)
ffffffffc02006e8:	00005517          	auipc	a0,0x5
ffffffffc02006ec:	bb850513          	addi	a0,a0,-1096 # ffffffffc02052a0 <commands+0x570>
ffffffffc02006f0:	9f9ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02006f4:	602c                	ld	a1,64(s0)
ffffffffc02006f6:	00005517          	auipc	a0,0x5
ffffffffc02006fa:	bc250513          	addi	a0,a0,-1086 # ffffffffc02052b8 <commands+0x588>
ffffffffc02006fe:	9ebff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200702:	642c                	ld	a1,72(s0)
ffffffffc0200704:	00005517          	auipc	a0,0x5
ffffffffc0200708:	bcc50513          	addi	a0,a0,-1076 # ffffffffc02052d0 <commands+0x5a0>
ffffffffc020070c:	9ddff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200710:	682c                	ld	a1,80(s0)
ffffffffc0200712:	00005517          	auipc	a0,0x5
ffffffffc0200716:	bd650513          	addi	a0,a0,-1066 # ffffffffc02052e8 <commands+0x5b8>
ffffffffc020071a:	9cfff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020071e:	6c2c                	ld	a1,88(s0)
ffffffffc0200720:	00005517          	auipc	a0,0x5
ffffffffc0200724:	be050513          	addi	a0,a0,-1056 # ffffffffc0205300 <commands+0x5d0>
ffffffffc0200728:	9c1ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020072c:	702c                	ld	a1,96(s0)
ffffffffc020072e:	00005517          	auipc	a0,0x5
ffffffffc0200732:	bea50513          	addi	a0,a0,-1046 # ffffffffc0205318 <commands+0x5e8>
ffffffffc0200736:	9b3ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020073a:	742c                	ld	a1,104(s0)
ffffffffc020073c:	00005517          	auipc	a0,0x5
ffffffffc0200740:	bf450513          	addi	a0,a0,-1036 # ffffffffc0205330 <commands+0x600>
ffffffffc0200744:	9a5ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200748:	782c                	ld	a1,112(s0)
ffffffffc020074a:	00005517          	auipc	a0,0x5
ffffffffc020074e:	bfe50513          	addi	a0,a0,-1026 # ffffffffc0205348 <commands+0x618>
ffffffffc0200752:	997ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200756:	7c2c                	ld	a1,120(s0)
ffffffffc0200758:	00005517          	auipc	a0,0x5
ffffffffc020075c:	c0850513          	addi	a0,a0,-1016 # ffffffffc0205360 <commands+0x630>
ffffffffc0200760:	989ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200764:	604c                	ld	a1,128(s0)
ffffffffc0200766:	00005517          	auipc	a0,0x5
ffffffffc020076a:	c1250513          	addi	a0,a0,-1006 # ffffffffc0205378 <commands+0x648>
ffffffffc020076e:	97bff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200772:	644c                	ld	a1,136(s0)
ffffffffc0200774:	00005517          	auipc	a0,0x5
ffffffffc0200778:	c1c50513          	addi	a0,a0,-996 # ffffffffc0205390 <commands+0x660>
ffffffffc020077c:	96dff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200780:	684c                	ld	a1,144(s0)
ffffffffc0200782:	00005517          	auipc	a0,0x5
ffffffffc0200786:	c2650513          	addi	a0,a0,-986 # ffffffffc02053a8 <commands+0x678>
ffffffffc020078a:	95fff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020078e:	6c4c                	ld	a1,152(s0)
ffffffffc0200790:	00005517          	auipc	a0,0x5
ffffffffc0200794:	c3050513          	addi	a0,a0,-976 # ffffffffc02053c0 <commands+0x690>
ffffffffc0200798:	951ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020079c:	704c                	ld	a1,160(s0)
ffffffffc020079e:	00005517          	auipc	a0,0x5
ffffffffc02007a2:	c3a50513          	addi	a0,a0,-966 # ffffffffc02053d8 <commands+0x6a8>
ffffffffc02007a6:	943ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02007aa:	744c                	ld	a1,168(s0)
ffffffffc02007ac:	00005517          	auipc	a0,0x5
ffffffffc02007b0:	c4450513          	addi	a0,a0,-956 # ffffffffc02053f0 <commands+0x6c0>
ffffffffc02007b4:	935ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02007b8:	784c                	ld	a1,176(s0)
ffffffffc02007ba:	00005517          	auipc	a0,0x5
ffffffffc02007be:	c4e50513          	addi	a0,a0,-946 # ffffffffc0205408 <commands+0x6d8>
ffffffffc02007c2:	927ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02007c6:	7c4c                	ld	a1,184(s0)
ffffffffc02007c8:	00005517          	auipc	a0,0x5
ffffffffc02007cc:	c5850513          	addi	a0,a0,-936 # ffffffffc0205420 <commands+0x6f0>
ffffffffc02007d0:	919ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02007d4:	606c                	ld	a1,192(s0)
ffffffffc02007d6:	00005517          	auipc	a0,0x5
ffffffffc02007da:	c6250513          	addi	a0,a0,-926 # ffffffffc0205438 <commands+0x708>
ffffffffc02007de:	90bff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02007e2:	646c                	ld	a1,200(s0)
ffffffffc02007e4:	00005517          	auipc	a0,0x5
ffffffffc02007e8:	c6c50513          	addi	a0,a0,-916 # ffffffffc0205450 <commands+0x720>
ffffffffc02007ec:	8fdff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02007f0:	686c                	ld	a1,208(s0)
ffffffffc02007f2:	00005517          	auipc	a0,0x5
ffffffffc02007f6:	c7650513          	addi	a0,a0,-906 # ffffffffc0205468 <commands+0x738>
ffffffffc02007fa:	8efff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02007fe:	6c6c                	ld	a1,216(s0)
ffffffffc0200800:	00005517          	auipc	a0,0x5
ffffffffc0200804:	c8050513          	addi	a0,a0,-896 # ffffffffc0205480 <commands+0x750>
ffffffffc0200808:	8e1ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020080c:	706c                	ld	a1,224(s0)
ffffffffc020080e:	00005517          	auipc	a0,0x5
ffffffffc0200812:	c8a50513          	addi	a0,a0,-886 # ffffffffc0205498 <commands+0x768>
ffffffffc0200816:	8d3ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020081a:	746c                	ld	a1,232(s0)
ffffffffc020081c:	00005517          	auipc	a0,0x5
ffffffffc0200820:	c9450513          	addi	a0,a0,-876 # ffffffffc02054b0 <commands+0x780>
ffffffffc0200824:	8c5ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200828:	786c                	ld	a1,240(s0)
ffffffffc020082a:	00005517          	auipc	a0,0x5
ffffffffc020082e:	c9e50513          	addi	a0,a0,-866 # ffffffffc02054c8 <commands+0x798>
ffffffffc0200832:	8b7ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200836:	7c6c                	ld	a1,248(s0)
ffffffffc0200838:	6402                	ld	s0,0(sp)
ffffffffc020083a:	60a2                	ld	ra,8(sp)
ffffffffc020083c:	00005517          	auipc	a0,0x5
ffffffffc0200840:	ca450513          	addi	a0,a0,-860 # ffffffffc02054e0 <commands+0x7b0>
ffffffffc0200844:	0141                	addi	sp,sp,16
ffffffffc0200846:	8a3ff06f          	j	ffffffffc02000e8 <cprintf>

ffffffffc020084a <print_trapframe>:
ffffffffc020084a:	1141                	addi	sp,sp,-16
ffffffffc020084c:	e022                	sd	s0,0(sp)
ffffffffc020084e:	85aa                	mv	a1,a0
ffffffffc0200850:	842a                	mv	s0,a0
ffffffffc0200852:	00005517          	auipc	a0,0x5
ffffffffc0200856:	ca650513          	addi	a0,a0,-858 # ffffffffc02054f8 <commands+0x7c8>
ffffffffc020085a:	e406                	sd	ra,8(sp)
ffffffffc020085c:	88dff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200860:	8522                	mv	a0,s0
ffffffffc0200862:	e1bff0ef          	jal	ra,ffffffffc020067c <print_regs>
ffffffffc0200866:	10043583          	ld	a1,256(s0)
ffffffffc020086a:	00005517          	auipc	a0,0x5
ffffffffc020086e:	ca650513          	addi	a0,a0,-858 # ffffffffc0205510 <commands+0x7e0>
ffffffffc0200872:	877ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200876:	10843583          	ld	a1,264(s0)
ffffffffc020087a:	00005517          	auipc	a0,0x5
ffffffffc020087e:	cae50513          	addi	a0,a0,-850 # ffffffffc0205528 <commands+0x7f8>
ffffffffc0200882:	867ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200886:	11043583          	ld	a1,272(s0)
ffffffffc020088a:	00005517          	auipc	a0,0x5
ffffffffc020088e:	cb650513          	addi	a0,a0,-842 # ffffffffc0205540 <commands+0x810>
ffffffffc0200892:	857ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200896:	11843583          	ld	a1,280(s0)
ffffffffc020089a:	6402                	ld	s0,0(sp)
ffffffffc020089c:	60a2                	ld	ra,8(sp)
ffffffffc020089e:	00005517          	auipc	a0,0x5
ffffffffc02008a2:	cba50513          	addi	a0,a0,-838 # ffffffffc0205558 <commands+0x828>
ffffffffc02008a6:	0141                	addi	sp,sp,16
ffffffffc02008a8:	841ff06f          	j	ffffffffc02000e8 <cprintf>

ffffffffc02008ac <interrupt_handler>:
ffffffffc02008ac:	11853783          	ld	a5,280(a0)
ffffffffc02008b0:	472d                	li	a4,11
ffffffffc02008b2:	0786                	slli	a5,a5,0x1
ffffffffc02008b4:	8385                	srli	a5,a5,0x1
ffffffffc02008b6:	06f76f63          	bltu	a4,a5,ffffffffc0200934 <interrupt_handler+0x88>
ffffffffc02008ba:	00004717          	auipc	a4,0x4
ffffffffc02008be:	61270713          	addi	a4,a4,1554 # ffffffffc0204ecc <commands+0x19c>
ffffffffc02008c2:	078a                	slli	a5,a5,0x2
ffffffffc02008c4:	97ba                	add	a5,a5,a4
ffffffffc02008c6:	439c                	lw	a5,0(a5)
ffffffffc02008c8:	97ba                	add	a5,a5,a4
ffffffffc02008ca:	8782                	jr	a5
ffffffffc02008cc:	00005517          	auipc	a0,0x5
ffffffffc02008d0:	88c50513          	addi	a0,a0,-1908 # ffffffffc0205158 <commands+0x428>
ffffffffc02008d4:	815ff06f          	j	ffffffffc02000e8 <cprintf>
ffffffffc02008d8:	00005517          	auipc	a0,0x5
ffffffffc02008dc:	86050513          	addi	a0,a0,-1952 # ffffffffc0205138 <commands+0x408>
ffffffffc02008e0:	809ff06f          	j	ffffffffc02000e8 <cprintf>
ffffffffc02008e4:	00005517          	auipc	a0,0x5
ffffffffc02008e8:	81450513          	addi	a0,a0,-2028 # ffffffffc02050f8 <commands+0x3c8>
ffffffffc02008ec:	ffcff06f          	j	ffffffffc02000e8 <cprintf>
ffffffffc02008f0:	00005517          	auipc	a0,0x5
ffffffffc02008f4:	82850513          	addi	a0,a0,-2008 # ffffffffc0205118 <commands+0x3e8>
ffffffffc02008f8:	ff0ff06f          	j	ffffffffc02000e8 <cprintf>
ffffffffc02008fc:	00005517          	auipc	a0,0x5
ffffffffc0200900:	88c50513          	addi	a0,a0,-1908 # ffffffffc0205188 <commands+0x458>
ffffffffc0200904:	fe4ff06f          	j	ffffffffc02000e8 <cprintf>
ffffffffc0200908:	1141                	addi	sp,sp,-16
ffffffffc020090a:	e406                	sd	ra,8(sp)
ffffffffc020090c:	c49ff0ef          	jal	ra,ffffffffc0200554 <clock_set_next_event>
ffffffffc0200910:	00015797          	auipc	a5,0x15
ffffffffc0200914:	bc078793          	addi	a5,a5,-1088 # ffffffffc02154d0 <ticks>
ffffffffc0200918:	639c                	ld	a5,0(a5)
ffffffffc020091a:	06400713          	li	a4,100
ffffffffc020091e:	0785                	addi	a5,a5,1
ffffffffc0200920:	02e7f733          	remu	a4,a5,a4
ffffffffc0200924:	00015697          	auipc	a3,0x15
ffffffffc0200928:	baf6b623          	sd	a5,-1108(a3) # ffffffffc02154d0 <ticks>
ffffffffc020092c:	c709                	beqz	a4,ffffffffc0200936 <interrupt_handler+0x8a>
ffffffffc020092e:	60a2                	ld	ra,8(sp)
ffffffffc0200930:	0141                	addi	sp,sp,16
ffffffffc0200932:	8082                	ret
ffffffffc0200934:	bf19                	j	ffffffffc020084a <print_trapframe>
ffffffffc0200936:	60a2                	ld	ra,8(sp)
ffffffffc0200938:	06400593          	li	a1,100
ffffffffc020093c:	00005517          	auipc	a0,0x5
ffffffffc0200940:	83c50513          	addi	a0,a0,-1988 # ffffffffc0205178 <commands+0x448>
ffffffffc0200944:	0141                	addi	sp,sp,16
ffffffffc0200946:	fa2ff06f          	j	ffffffffc02000e8 <cprintf>

ffffffffc020094a <exception_handler>:
ffffffffc020094a:	11853783          	ld	a5,280(a0)
ffffffffc020094e:	473d                	li	a4,15
ffffffffc0200950:	16f76463          	bltu	a4,a5,ffffffffc0200ab8 <exception_handler+0x16e>
ffffffffc0200954:	00004717          	auipc	a4,0x4
ffffffffc0200958:	5a870713          	addi	a4,a4,1448 # ffffffffc0204efc <commands+0x1cc>
ffffffffc020095c:	078a                	slli	a5,a5,0x2
ffffffffc020095e:	97ba                	add	a5,a5,a4
ffffffffc0200960:	439c                	lw	a5,0(a5)
ffffffffc0200962:	1101                	addi	sp,sp,-32
ffffffffc0200964:	e822                	sd	s0,16(sp)
ffffffffc0200966:	ec06                	sd	ra,24(sp)
ffffffffc0200968:	e426                	sd	s1,8(sp)
ffffffffc020096a:	97ba                	add	a5,a5,a4
ffffffffc020096c:	842a                	mv	s0,a0
ffffffffc020096e:	8782                	jr	a5
ffffffffc0200970:	00004517          	auipc	a0,0x4
ffffffffc0200974:	77050513          	addi	a0,a0,1904 # ffffffffc02050e0 <commands+0x3b0>
ffffffffc0200978:	f70ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020097c:	8522                	mv	a0,s0
ffffffffc020097e:	c73ff0ef          	jal	ra,ffffffffc02005f0 <pgfault_handler>
ffffffffc0200982:	84aa                	mv	s1,a0
ffffffffc0200984:	12051b63          	bnez	a0,ffffffffc0200aba <exception_handler+0x170>
ffffffffc0200988:	60e2                	ld	ra,24(sp)
ffffffffc020098a:	6442                	ld	s0,16(sp)
ffffffffc020098c:	64a2                	ld	s1,8(sp)
ffffffffc020098e:	6105                	addi	sp,sp,32
ffffffffc0200990:	8082                	ret
ffffffffc0200992:	00004517          	auipc	a0,0x4
ffffffffc0200996:	5ae50513          	addi	a0,a0,1454 # ffffffffc0204f40 <commands+0x210>
ffffffffc020099a:	6442                	ld	s0,16(sp)
ffffffffc020099c:	60e2                	ld	ra,24(sp)
ffffffffc020099e:	64a2                	ld	s1,8(sp)
ffffffffc02009a0:	6105                	addi	sp,sp,32
ffffffffc02009a2:	f46ff06f          	j	ffffffffc02000e8 <cprintf>
ffffffffc02009a6:	00004517          	auipc	a0,0x4
ffffffffc02009aa:	5ba50513          	addi	a0,a0,1466 # ffffffffc0204f60 <commands+0x230>
ffffffffc02009ae:	b7f5                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc02009b0:	00004517          	auipc	a0,0x4
ffffffffc02009b4:	5d050513          	addi	a0,a0,1488 # ffffffffc0204f80 <commands+0x250>
ffffffffc02009b8:	b7cd                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc02009ba:	00004517          	auipc	a0,0x4
ffffffffc02009be:	5de50513          	addi	a0,a0,1502 # ffffffffc0204f98 <commands+0x268>
ffffffffc02009c2:	bfe1                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc02009c4:	00004517          	auipc	a0,0x4
ffffffffc02009c8:	5e450513          	addi	a0,a0,1508 # ffffffffc0204fa8 <commands+0x278>
ffffffffc02009cc:	b7f9                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc02009ce:	00004517          	auipc	a0,0x4
ffffffffc02009d2:	5fa50513          	addi	a0,a0,1530 # ffffffffc0204fc8 <commands+0x298>
ffffffffc02009d6:	f12ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02009da:	8522                	mv	a0,s0
ffffffffc02009dc:	c15ff0ef          	jal	ra,ffffffffc02005f0 <pgfault_handler>
ffffffffc02009e0:	84aa                	mv	s1,a0
ffffffffc02009e2:	d15d                	beqz	a0,ffffffffc0200988 <exception_handler+0x3e>
ffffffffc02009e4:	8522                	mv	a0,s0
ffffffffc02009e6:	e65ff0ef          	jal	ra,ffffffffc020084a <print_trapframe>
ffffffffc02009ea:	86a6                	mv	a3,s1
ffffffffc02009ec:	00004617          	auipc	a2,0x4
ffffffffc02009f0:	5f460613          	addi	a2,a2,1524 # ffffffffc0204fe0 <commands+0x2b0>
ffffffffc02009f4:	0b300593          	li	a1,179
ffffffffc02009f8:	00004517          	auipc	a0,0x4
ffffffffc02009fc:	7e850513          	addi	a0,a0,2024 # ffffffffc02051e0 <commands+0x4b0>
ffffffffc0200a00:	fecff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0200a04:	00004517          	auipc	a0,0x4
ffffffffc0200a08:	5fc50513          	addi	a0,a0,1532 # ffffffffc0205000 <commands+0x2d0>
ffffffffc0200a0c:	b779                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc0200a0e:	00004517          	auipc	a0,0x4
ffffffffc0200a12:	60a50513          	addi	a0,a0,1546 # ffffffffc0205018 <commands+0x2e8>
ffffffffc0200a16:	ed2ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200a1a:	8522                	mv	a0,s0
ffffffffc0200a1c:	bd5ff0ef          	jal	ra,ffffffffc02005f0 <pgfault_handler>
ffffffffc0200a20:	84aa                	mv	s1,a0
ffffffffc0200a22:	d13d                	beqz	a0,ffffffffc0200988 <exception_handler+0x3e>
ffffffffc0200a24:	8522                	mv	a0,s0
ffffffffc0200a26:	e25ff0ef          	jal	ra,ffffffffc020084a <print_trapframe>
ffffffffc0200a2a:	86a6                	mv	a3,s1
ffffffffc0200a2c:	00004617          	auipc	a2,0x4
ffffffffc0200a30:	5b460613          	addi	a2,a2,1460 # ffffffffc0204fe0 <commands+0x2b0>
ffffffffc0200a34:	0bd00593          	li	a1,189
ffffffffc0200a38:	00004517          	auipc	a0,0x4
ffffffffc0200a3c:	7a850513          	addi	a0,a0,1960 # ffffffffc02051e0 <commands+0x4b0>
ffffffffc0200a40:	facff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0200a44:	00004517          	auipc	a0,0x4
ffffffffc0200a48:	5ec50513          	addi	a0,a0,1516 # ffffffffc0205030 <commands+0x300>
ffffffffc0200a4c:	b7b9                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc0200a4e:	00004517          	auipc	a0,0x4
ffffffffc0200a52:	60250513          	addi	a0,a0,1538 # ffffffffc0205050 <commands+0x320>
ffffffffc0200a56:	b791                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc0200a58:	00004517          	auipc	a0,0x4
ffffffffc0200a5c:	61850513          	addi	a0,a0,1560 # ffffffffc0205070 <commands+0x340>
ffffffffc0200a60:	bf2d                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc0200a62:	00004517          	auipc	a0,0x4
ffffffffc0200a66:	62e50513          	addi	a0,a0,1582 # ffffffffc0205090 <commands+0x360>
ffffffffc0200a6a:	bf05                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc0200a6c:	00004517          	auipc	a0,0x4
ffffffffc0200a70:	64450513          	addi	a0,a0,1604 # ffffffffc02050b0 <commands+0x380>
ffffffffc0200a74:	b71d                	j	ffffffffc020099a <exception_handler+0x50>
ffffffffc0200a76:	00004517          	auipc	a0,0x4
ffffffffc0200a7a:	65250513          	addi	a0,a0,1618 # ffffffffc02050c8 <commands+0x398>
ffffffffc0200a7e:	e6aff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200a82:	8522                	mv	a0,s0
ffffffffc0200a84:	b6dff0ef          	jal	ra,ffffffffc02005f0 <pgfault_handler>
ffffffffc0200a88:	84aa                	mv	s1,a0
ffffffffc0200a8a:	ee050fe3          	beqz	a0,ffffffffc0200988 <exception_handler+0x3e>
ffffffffc0200a8e:	8522                	mv	a0,s0
ffffffffc0200a90:	dbbff0ef          	jal	ra,ffffffffc020084a <print_trapframe>
ffffffffc0200a94:	86a6                	mv	a3,s1
ffffffffc0200a96:	00004617          	auipc	a2,0x4
ffffffffc0200a9a:	54a60613          	addi	a2,a2,1354 # ffffffffc0204fe0 <commands+0x2b0>
ffffffffc0200a9e:	0d300593          	li	a1,211
ffffffffc0200aa2:	00004517          	auipc	a0,0x4
ffffffffc0200aa6:	73e50513          	addi	a0,a0,1854 # ffffffffc02051e0 <commands+0x4b0>
ffffffffc0200aaa:	f42ff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0200aae:	6442                	ld	s0,16(sp)
ffffffffc0200ab0:	60e2                	ld	ra,24(sp)
ffffffffc0200ab2:	64a2                	ld	s1,8(sp)
ffffffffc0200ab4:	6105                	addi	sp,sp,32
ffffffffc0200ab6:	bb51                	j	ffffffffc020084a <print_trapframe>
ffffffffc0200ab8:	bb49                	j	ffffffffc020084a <print_trapframe>
ffffffffc0200aba:	8522                	mv	a0,s0
ffffffffc0200abc:	d8fff0ef          	jal	ra,ffffffffc020084a <print_trapframe>
ffffffffc0200ac0:	86a6                	mv	a3,s1
ffffffffc0200ac2:	00004617          	auipc	a2,0x4
ffffffffc0200ac6:	51e60613          	addi	a2,a2,1310 # ffffffffc0204fe0 <commands+0x2b0>
ffffffffc0200aca:	0da00593          	li	a1,218
ffffffffc0200ace:	00004517          	auipc	a0,0x4
ffffffffc0200ad2:	71250513          	addi	a0,a0,1810 # ffffffffc02051e0 <commands+0x4b0>
ffffffffc0200ad6:	f16ff0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0200ada <trap>:
ffffffffc0200ada:	11853783          	ld	a5,280(a0)
ffffffffc0200ade:	0007c363          	bltz	a5,ffffffffc0200ae4 <trap+0xa>
ffffffffc0200ae2:	b5a5                	j	ffffffffc020094a <exception_handler>
ffffffffc0200ae4:	b3e1                	j	ffffffffc02008ac <interrupt_handler>
	...

ffffffffc0200ae8 <__alltraps>:
ffffffffc0200ae8:	14011073          	csrw	sscratch,sp
ffffffffc0200aec:	712d                	addi	sp,sp,-288
ffffffffc0200aee:	e406                	sd	ra,8(sp)
ffffffffc0200af0:	ec0e                	sd	gp,24(sp)
ffffffffc0200af2:	f012                	sd	tp,32(sp)
ffffffffc0200af4:	f416                	sd	t0,40(sp)
ffffffffc0200af6:	f81a                	sd	t1,48(sp)
ffffffffc0200af8:	fc1e                	sd	t2,56(sp)
ffffffffc0200afa:	e0a2                	sd	s0,64(sp)
ffffffffc0200afc:	e4a6                	sd	s1,72(sp)
ffffffffc0200afe:	e8aa                	sd	a0,80(sp)
ffffffffc0200b00:	ecae                	sd	a1,88(sp)
ffffffffc0200b02:	f0b2                	sd	a2,96(sp)
ffffffffc0200b04:	f4b6                	sd	a3,104(sp)
ffffffffc0200b06:	f8ba                	sd	a4,112(sp)
ffffffffc0200b08:	fcbe                	sd	a5,120(sp)
ffffffffc0200b0a:	e142                	sd	a6,128(sp)
ffffffffc0200b0c:	e546                	sd	a7,136(sp)
ffffffffc0200b0e:	e94a                	sd	s2,144(sp)
ffffffffc0200b10:	ed4e                	sd	s3,152(sp)
ffffffffc0200b12:	f152                	sd	s4,160(sp)
ffffffffc0200b14:	f556                	sd	s5,168(sp)
ffffffffc0200b16:	f95a                	sd	s6,176(sp)
ffffffffc0200b18:	fd5e                	sd	s7,184(sp)
ffffffffc0200b1a:	e1e2                	sd	s8,192(sp)
ffffffffc0200b1c:	e5e6                	sd	s9,200(sp)
ffffffffc0200b1e:	e9ea                	sd	s10,208(sp)
ffffffffc0200b20:	edee                	sd	s11,216(sp)
ffffffffc0200b22:	f1f2                	sd	t3,224(sp)
ffffffffc0200b24:	f5f6                	sd	t4,232(sp)
ffffffffc0200b26:	f9fa                	sd	t5,240(sp)
ffffffffc0200b28:	fdfe                	sd	t6,248(sp)
ffffffffc0200b2a:	14002473          	csrr	s0,sscratch
ffffffffc0200b2e:	100024f3          	csrr	s1,sstatus
ffffffffc0200b32:	14102973          	csrr	s2,sepc
ffffffffc0200b36:	143029f3          	csrr	s3,stval
ffffffffc0200b3a:	14202a73          	csrr	s4,scause
ffffffffc0200b3e:	e822                	sd	s0,16(sp)
ffffffffc0200b40:	e226                	sd	s1,256(sp)
ffffffffc0200b42:	e64a                	sd	s2,264(sp)
ffffffffc0200b44:	ea4e                	sd	s3,272(sp)
ffffffffc0200b46:	ee52                	sd	s4,280(sp)
ffffffffc0200b48:	850a                	mv	a0,sp
ffffffffc0200b4a:	f91ff0ef          	jal	ra,ffffffffc0200ada <trap>

ffffffffc0200b4e <__trapret>:
ffffffffc0200b4e:	6492                	ld	s1,256(sp)
ffffffffc0200b50:	6932                	ld	s2,264(sp)
ffffffffc0200b52:	10049073          	csrw	sstatus,s1
ffffffffc0200b56:	14191073          	csrw	sepc,s2
ffffffffc0200b5a:	60a2                	ld	ra,8(sp)
ffffffffc0200b5c:	61e2                	ld	gp,24(sp)
ffffffffc0200b5e:	7202                	ld	tp,32(sp)
ffffffffc0200b60:	72a2                	ld	t0,40(sp)
ffffffffc0200b62:	7342                	ld	t1,48(sp)
ffffffffc0200b64:	73e2                	ld	t2,56(sp)
ffffffffc0200b66:	6406                	ld	s0,64(sp)
ffffffffc0200b68:	64a6                	ld	s1,72(sp)
ffffffffc0200b6a:	6546                	ld	a0,80(sp)
ffffffffc0200b6c:	65e6                	ld	a1,88(sp)
ffffffffc0200b6e:	7606                	ld	a2,96(sp)
ffffffffc0200b70:	76a6                	ld	a3,104(sp)
ffffffffc0200b72:	7746                	ld	a4,112(sp)
ffffffffc0200b74:	77e6                	ld	a5,120(sp)
ffffffffc0200b76:	680a                	ld	a6,128(sp)
ffffffffc0200b78:	68aa                	ld	a7,136(sp)
ffffffffc0200b7a:	694a                	ld	s2,144(sp)
ffffffffc0200b7c:	69ea                	ld	s3,152(sp)
ffffffffc0200b7e:	7a0a                	ld	s4,160(sp)
ffffffffc0200b80:	7aaa                	ld	s5,168(sp)
ffffffffc0200b82:	7b4a                	ld	s6,176(sp)
ffffffffc0200b84:	7bea                	ld	s7,184(sp)
ffffffffc0200b86:	6c0e                	ld	s8,192(sp)
ffffffffc0200b88:	6cae                	ld	s9,200(sp)
ffffffffc0200b8a:	6d4e                	ld	s10,208(sp)
ffffffffc0200b8c:	6dee                	ld	s11,216(sp)
ffffffffc0200b8e:	7e0e                	ld	t3,224(sp)
ffffffffc0200b90:	7eae                	ld	t4,232(sp)
ffffffffc0200b92:	7f4e                	ld	t5,240(sp)
ffffffffc0200b94:	7fee                	ld	t6,248(sp)
ffffffffc0200b96:	6142                	ld	sp,16(sp)
ffffffffc0200b98:	10200073          	sret

ffffffffc0200b9c <forkrets>:
ffffffffc0200b9c:	812a                	mv	sp,a0
ffffffffc0200b9e:	bf45                	j	ffffffffc0200b4e <__trapret>
	...

ffffffffc0200ba2 <check_vma_overlap.isra.0.part.1>:
ffffffffc0200ba2:	1141                	addi	sp,sp,-16
ffffffffc0200ba4:	00005697          	auipc	a3,0x5
ffffffffc0200ba8:	9cc68693          	addi	a3,a3,-1588 # ffffffffc0205570 <commands+0x840>
ffffffffc0200bac:	00005617          	auipc	a2,0x5
ffffffffc0200bb0:	9e460613          	addi	a2,a2,-1564 # ffffffffc0205590 <commands+0x860>
ffffffffc0200bb4:	06a00593          	li	a1,106
ffffffffc0200bb8:	00005517          	auipc	a0,0x5
ffffffffc0200bbc:	9f050513          	addi	a0,a0,-1552 # ffffffffc02055a8 <commands+0x878>
ffffffffc0200bc0:	e406                	sd	ra,8(sp)
ffffffffc0200bc2:	e2aff0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0200bc6 <mm_create>:
ffffffffc0200bc6:	1141                	addi	sp,sp,-16
ffffffffc0200bc8:	03000513          	li	a0,48
ffffffffc0200bcc:	e022                	sd	s0,0(sp)
ffffffffc0200bce:	e406                	sd	ra,8(sp)
ffffffffc0200bd0:	609000ef          	jal	ra,ffffffffc02019d8 <kmalloc>
ffffffffc0200bd4:	842a                	mv	s0,a0
ffffffffc0200bd6:	c115                	beqz	a0,ffffffffc0200bfa <mm_create+0x34>
ffffffffc0200bd8:	00015797          	auipc	a5,0x15
ffffffffc0200bdc:	8c078793          	addi	a5,a5,-1856 # ffffffffc0215498 <swap_init_ok>
ffffffffc0200be0:	439c                	lw	a5,0(a5)
ffffffffc0200be2:	e408                	sd	a0,8(s0)
ffffffffc0200be4:	e008                	sd	a0,0(s0)
ffffffffc0200be6:	00053823          	sd	zero,16(a0)
ffffffffc0200bea:	00053c23          	sd	zero,24(a0)
ffffffffc0200bee:	02052023          	sw	zero,32(a0)
ffffffffc0200bf2:	2781                	sext.w	a5,a5
ffffffffc0200bf4:	eb81                	bnez	a5,ffffffffc0200c04 <mm_create+0x3e>
ffffffffc0200bf6:	02053423          	sd	zero,40(a0)
ffffffffc0200bfa:	8522                	mv	a0,s0
ffffffffc0200bfc:	60a2                	ld	ra,8(sp)
ffffffffc0200bfe:	6402                	ld	s0,0(sp)
ffffffffc0200c00:	0141                	addi	sp,sp,16
ffffffffc0200c02:	8082                	ret
ffffffffc0200c04:	65a010ef          	jal	ra,ffffffffc020225e <swap_init_mm>
ffffffffc0200c08:	8522                	mv	a0,s0
ffffffffc0200c0a:	60a2                	ld	ra,8(sp)
ffffffffc0200c0c:	6402                	ld	s0,0(sp)
ffffffffc0200c0e:	0141                	addi	sp,sp,16
ffffffffc0200c10:	8082                	ret

ffffffffc0200c12 <vma_create>:
ffffffffc0200c12:	1101                	addi	sp,sp,-32
ffffffffc0200c14:	e04a                	sd	s2,0(sp)
ffffffffc0200c16:	892a                	mv	s2,a0
ffffffffc0200c18:	03000513          	li	a0,48
ffffffffc0200c1c:	e822                	sd	s0,16(sp)
ffffffffc0200c1e:	e426                	sd	s1,8(sp)
ffffffffc0200c20:	ec06                	sd	ra,24(sp)
ffffffffc0200c22:	84ae                	mv	s1,a1
ffffffffc0200c24:	8432                	mv	s0,a2
ffffffffc0200c26:	5b3000ef          	jal	ra,ffffffffc02019d8 <kmalloc>
ffffffffc0200c2a:	c509                	beqz	a0,ffffffffc0200c34 <vma_create+0x22>
ffffffffc0200c2c:	01253423          	sd	s2,8(a0)
ffffffffc0200c30:	e904                	sd	s1,16(a0)
ffffffffc0200c32:	cd00                	sw	s0,24(a0)
ffffffffc0200c34:	60e2                	ld	ra,24(sp)
ffffffffc0200c36:	6442                	ld	s0,16(sp)
ffffffffc0200c38:	64a2                	ld	s1,8(sp)
ffffffffc0200c3a:	6902                	ld	s2,0(sp)
ffffffffc0200c3c:	6105                	addi	sp,sp,32
ffffffffc0200c3e:	8082                	ret

ffffffffc0200c40 <find_vma>:
ffffffffc0200c40:	c51d                	beqz	a0,ffffffffc0200c6e <find_vma+0x2e>
ffffffffc0200c42:	691c                	ld	a5,16(a0)
ffffffffc0200c44:	c781                	beqz	a5,ffffffffc0200c4c <find_vma+0xc>
ffffffffc0200c46:	6798                	ld	a4,8(a5)
ffffffffc0200c48:	02e5f663          	bgeu	a1,a4,ffffffffc0200c74 <find_vma+0x34>
ffffffffc0200c4c:	87aa                	mv	a5,a0
ffffffffc0200c4e:	679c                	ld	a5,8(a5)
ffffffffc0200c50:	00f50f63          	beq	a0,a5,ffffffffc0200c6e <find_vma+0x2e>
ffffffffc0200c54:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200c58:	fee5ebe3          	bltu	a1,a4,ffffffffc0200c4e <find_vma+0xe>
ffffffffc0200c5c:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200c60:	fee5f7e3          	bgeu	a1,a4,ffffffffc0200c4e <find_vma+0xe>
ffffffffc0200c64:	1781                	addi	a5,a5,-32
ffffffffc0200c66:	c781                	beqz	a5,ffffffffc0200c6e <find_vma+0x2e>
ffffffffc0200c68:	e91c                	sd	a5,16(a0)
ffffffffc0200c6a:	853e                	mv	a0,a5
ffffffffc0200c6c:	8082                	ret
ffffffffc0200c6e:	4781                	li	a5,0
ffffffffc0200c70:	853e                	mv	a0,a5
ffffffffc0200c72:	8082                	ret
ffffffffc0200c74:	6b98                	ld	a4,16(a5)
ffffffffc0200c76:	fce5fbe3          	bgeu	a1,a4,ffffffffc0200c4c <find_vma+0xc>
ffffffffc0200c7a:	e91c                	sd	a5,16(a0)
ffffffffc0200c7c:	b7fd                	j	ffffffffc0200c6a <find_vma+0x2a>

ffffffffc0200c7e <insert_vma_struct>:
ffffffffc0200c7e:	6590                	ld	a2,8(a1)
ffffffffc0200c80:	0105b803          	ld	a6,16(a1)
ffffffffc0200c84:	1141                	addi	sp,sp,-16
ffffffffc0200c86:	e406                	sd	ra,8(sp)
ffffffffc0200c88:	872a                	mv	a4,a0
ffffffffc0200c8a:	01066863          	bltu	a2,a6,ffffffffc0200c9a <insert_vma_struct+0x1c>
ffffffffc0200c8e:	a8b9                	j	ffffffffc0200cec <insert_vma_struct+0x6e>
ffffffffc0200c90:	fe87b683          	ld	a3,-24(a5)
ffffffffc0200c94:	04d66763          	bltu	a2,a3,ffffffffc0200ce2 <insert_vma_struct+0x64>
ffffffffc0200c98:	873e                	mv	a4,a5
ffffffffc0200c9a:	671c                	ld	a5,8(a4)
ffffffffc0200c9c:	fef51ae3          	bne	a0,a5,ffffffffc0200c90 <insert_vma_struct+0x12>
ffffffffc0200ca0:	02a70463          	beq	a4,a0,ffffffffc0200cc8 <insert_vma_struct+0x4a>
ffffffffc0200ca4:	ff073683          	ld	a3,-16(a4)
ffffffffc0200ca8:	fe873883          	ld	a7,-24(a4)
ffffffffc0200cac:	08d8f063          	bgeu	a7,a3,ffffffffc0200d2c <insert_vma_struct+0xae>
ffffffffc0200cb0:	04d66e63          	bltu	a2,a3,ffffffffc0200d0c <insert_vma_struct+0x8e>
ffffffffc0200cb4:	00f50a63          	beq	a0,a5,ffffffffc0200cc8 <insert_vma_struct+0x4a>
ffffffffc0200cb8:	fe87b683          	ld	a3,-24(a5)
ffffffffc0200cbc:	0506e863          	bltu	a3,a6,ffffffffc0200d0c <insert_vma_struct+0x8e>
ffffffffc0200cc0:	ff07b603          	ld	a2,-16(a5)
ffffffffc0200cc4:	02c6f263          	bgeu	a3,a2,ffffffffc0200ce8 <insert_vma_struct+0x6a>
ffffffffc0200cc8:	5114                	lw	a3,32(a0)
ffffffffc0200cca:	e188                	sd	a0,0(a1)
ffffffffc0200ccc:	02058613          	addi	a2,a1,32
ffffffffc0200cd0:	e390                	sd	a2,0(a5)
ffffffffc0200cd2:	e710                	sd	a2,8(a4)
ffffffffc0200cd4:	60a2                	ld	ra,8(sp)
ffffffffc0200cd6:	f59c                	sd	a5,40(a1)
ffffffffc0200cd8:	f198                	sd	a4,32(a1)
ffffffffc0200cda:	2685                	addiw	a3,a3,1
ffffffffc0200cdc:	d114                	sw	a3,32(a0)
ffffffffc0200cde:	0141                	addi	sp,sp,16
ffffffffc0200ce0:	8082                	ret
ffffffffc0200ce2:	fca711e3          	bne	a4,a0,ffffffffc0200ca4 <insert_vma_struct+0x26>
ffffffffc0200ce6:	bfd9                	j	ffffffffc0200cbc <insert_vma_struct+0x3e>
ffffffffc0200ce8:	ebbff0ef          	jal	ra,ffffffffc0200ba2 <check_vma_overlap.isra.0.part.1>
ffffffffc0200cec:	00005697          	auipc	a3,0x5
ffffffffc0200cf0:	98c68693          	addi	a3,a3,-1652 # ffffffffc0205678 <commands+0x948>
ffffffffc0200cf4:	00005617          	auipc	a2,0x5
ffffffffc0200cf8:	89c60613          	addi	a2,a2,-1892 # ffffffffc0205590 <commands+0x860>
ffffffffc0200cfc:	07100593          	li	a1,113
ffffffffc0200d00:	00005517          	auipc	a0,0x5
ffffffffc0200d04:	8a850513          	addi	a0,a0,-1880 # ffffffffc02055a8 <commands+0x878>
ffffffffc0200d08:	ce4ff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0200d0c:	00005697          	auipc	a3,0x5
ffffffffc0200d10:	9ac68693          	addi	a3,a3,-1620 # ffffffffc02056b8 <commands+0x988>
ffffffffc0200d14:	00005617          	auipc	a2,0x5
ffffffffc0200d18:	87c60613          	addi	a2,a2,-1924 # ffffffffc0205590 <commands+0x860>
ffffffffc0200d1c:	06900593          	li	a1,105
ffffffffc0200d20:	00005517          	auipc	a0,0x5
ffffffffc0200d24:	88850513          	addi	a0,a0,-1912 # ffffffffc02055a8 <commands+0x878>
ffffffffc0200d28:	cc4ff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0200d2c:	00005697          	auipc	a3,0x5
ffffffffc0200d30:	96c68693          	addi	a3,a3,-1684 # ffffffffc0205698 <commands+0x968>
ffffffffc0200d34:	00005617          	auipc	a2,0x5
ffffffffc0200d38:	85c60613          	addi	a2,a2,-1956 # ffffffffc0205590 <commands+0x860>
ffffffffc0200d3c:	06800593          	li	a1,104
ffffffffc0200d40:	00005517          	auipc	a0,0x5
ffffffffc0200d44:	86850513          	addi	a0,a0,-1944 # ffffffffc02055a8 <commands+0x878>
ffffffffc0200d48:	ca4ff0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0200d4c <mm_destroy>:
ffffffffc0200d4c:	1141                	addi	sp,sp,-16
ffffffffc0200d4e:	e022                	sd	s0,0(sp)
ffffffffc0200d50:	842a                	mv	s0,a0
ffffffffc0200d52:	6508                	ld	a0,8(a0)
ffffffffc0200d54:	e406                	sd	ra,8(sp)
ffffffffc0200d56:	00a40c63          	beq	s0,a0,ffffffffc0200d6e <mm_destroy+0x22>
ffffffffc0200d5a:	6118                	ld	a4,0(a0)
ffffffffc0200d5c:	651c                	ld	a5,8(a0)
ffffffffc0200d5e:	1501                	addi	a0,a0,-32
ffffffffc0200d60:	e71c                	sd	a5,8(a4)
ffffffffc0200d62:	e398                	sd	a4,0(a5)
ffffffffc0200d64:	531000ef          	jal	ra,ffffffffc0201a94 <kfree>
ffffffffc0200d68:	6408                	ld	a0,8(s0)
ffffffffc0200d6a:	fea418e3          	bne	s0,a0,ffffffffc0200d5a <mm_destroy+0xe>
ffffffffc0200d6e:	8522                	mv	a0,s0
ffffffffc0200d70:	6402                	ld	s0,0(sp)
ffffffffc0200d72:	60a2                	ld	ra,8(sp)
ffffffffc0200d74:	0141                	addi	sp,sp,16
ffffffffc0200d76:	51f0006f          	j	ffffffffc0201a94 <kfree>

ffffffffc0200d7a <vmm_init>:
ffffffffc0200d7a:	7139                	addi	sp,sp,-64
ffffffffc0200d7c:	f822                	sd	s0,48(sp)
ffffffffc0200d7e:	f426                	sd	s1,40(sp)
ffffffffc0200d80:	fc06                	sd	ra,56(sp)
ffffffffc0200d82:	f04a                	sd	s2,32(sp)
ffffffffc0200d84:	ec4e                	sd	s3,24(sp)
ffffffffc0200d86:	e852                	sd	s4,16(sp)
ffffffffc0200d88:	e456                	sd	s5,8(sp)
ffffffffc0200d8a:	e3dff0ef          	jal	ra,ffffffffc0200bc6 <mm_create>
ffffffffc0200d8e:	842a                	mv	s0,a0
ffffffffc0200d90:	03200493          	li	s1,50
ffffffffc0200d94:	e919                	bnez	a0,ffffffffc0200daa <vmm_init+0x30>
ffffffffc0200d96:	aef9                	j	ffffffffc0201174 <vmm_init+0x3fa>
ffffffffc0200d98:	e504                	sd	s1,8(a0)
ffffffffc0200d9a:	e91c                	sd	a5,16(a0)
ffffffffc0200d9c:	00052c23          	sw	zero,24(a0)
ffffffffc0200da0:	14ed                	addi	s1,s1,-5
ffffffffc0200da2:	8522                	mv	a0,s0
ffffffffc0200da4:	edbff0ef          	jal	ra,ffffffffc0200c7e <insert_vma_struct>
ffffffffc0200da8:	c88d                	beqz	s1,ffffffffc0200dda <vmm_init+0x60>
ffffffffc0200daa:	03000513          	li	a0,48
ffffffffc0200dae:	42b000ef          	jal	ra,ffffffffc02019d8 <kmalloc>
ffffffffc0200db2:	85aa                	mv	a1,a0
ffffffffc0200db4:	00248793          	addi	a5,s1,2
ffffffffc0200db8:	f165                	bnez	a0,ffffffffc0200d98 <vmm_init+0x1e>
ffffffffc0200dba:	00005697          	auipc	a3,0x5
ffffffffc0200dbe:	b7668693          	addi	a3,a3,-1162 # ffffffffc0205930 <commands+0xc00>
ffffffffc0200dc2:	00004617          	auipc	a2,0x4
ffffffffc0200dc6:	7ce60613          	addi	a2,a2,1998 # ffffffffc0205590 <commands+0x860>
ffffffffc0200dca:	0b500593          	li	a1,181
ffffffffc0200dce:	00004517          	auipc	a0,0x4
ffffffffc0200dd2:	7da50513          	addi	a0,a0,2010 # ffffffffc02055a8 <commands+0x878>
ffffffffc0200dd6:	c16ff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0200dda:	03700493          	li	s1,55
ffffffffc0200dde:	1f900913          	li	s2,505
ffffffffc0200de2:	a819                	j	ffffffffc0200df8 <vmm_init+0x7e>
ffffffffc0200de4:	e504                	sd	s1,8(a0)
ffffffffc0200de6:	e91c                	sd	a5,16(a0)
ffffffffc0200de8:	00052c23          	sw	zero,24(a0)
ffffffffc0200dec:	0495                	addi	s1,s1,5
ffffffffc0200dee:	8522                	mv	a0,s0
ffffffffc0200df0:	e8fff0ef          	jal	ra,ffffffffc0200c7e <insert_vma_struct>
ffffffffc0200df4:	03248a63          	beq	s1,s2,ffffffffc0200e28 <vmm_init+0xae>
ffffffffc0200df8:	03000513          	li	a0,48
ffffffffc0200dfc:	3dd000ef          	jal	ra,ffffffffc02019d8 <kmalloc>
ffffffffc0200e00:	85aa                	mv	a1,a0
ffffffffc0200e02:	00248793          	addi	a5,s1,2
ffffffffc0200e06:	fd79                	bnez	a0,ffffffffc0200de4 <vmm_init+0x6a>
ffffffffc0200e08:	00005697          	auipc	a3,0x5
ffffffffc0200e0c:	b2868693          	addi	a3,a3,-1240 # ffffffffc0205930 <commands+0xc00>
ffffffffc0200e10:	00004617          	auipc	a2,0x4
ffffffffc0200e14:	78060613          	addi	a2,a2,1920 # ffffffffc0205590 <commands+0x860>
ffffffffc0200e18:	0bb00593          	li	a1,187
ffffffffc0200e1c:	00004517          	auipc	a0,0x4
ffffffffc0200e20:	78c50513          	addi	a0,a0,1932 # ffffffffc02055a8 <commands+0x878>
ffffffffc0200e24:	bc8ff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0200e28:	6418                	ld	a4,8(s0)
ffffffffc0200e2a:	479d                	li	a5,7
ffffffffc0200e2c:	1fb00593          	li	a1,507
ffffffffc0200e30:	28e40263          	beq	s0,a4,ffffffffc02010b4 <vmm_init+0x33a>
ffffffffc0200e34:	fe873603          	ld	a2,-24(a4)
ffffffffc0200e38:	ffe78693          	addi	a3,a5,-2
ffffffffc0200e3c:	1ed61c63          	bne	a2,a3,ffffffffc0201034 <vmm_init+0x2ba>
ffffffffc0200e40:	ff073683          	ld	a3,-16(a4)
ffffffffc0200e44:	1ed79863          	bne	a5,a3,ffffffffc0201034 <vmm_init+0x2ba>
ffffffffc0200e48:	0795                	addi	a5,a5,5
ffffffffc0200e4a:	6718                	ld	a4,8(a4)
ffffffffc0200e4c:	feb792e3          	bne	a5,a1,ffffffffc0200e30 <vmm_init+0xb6>
ffffffffc0200e50:	491d                	li	s2,7
ffffffffc0200e52:	4495                	li	s1,5
ffffffffc0200e54:	1f900a93          	li	s5,505
ffffffffc0200e58:	85a6                	mv	a1,s1
ffffffffc0200e5a:	8522                	mv	a0,s0
ffffffffc0200e5c:	de5ff0ef          	jal	ra,ffffffffc0200c40 <find_vma>
ffffffffc0200e60:	8a2a                	mv	s4,a0
ffffffffc0200e62:	2c050963          	beqz	a0,ffffffffc0201134 <vmm_init+0x3ba>
ffffffffc0200e66:	00148593          	addi	a1,s1,1
ffffffffc0200e6a:	8522                	mv	a0,s0
ffffffffc0200e6c:	dd5ff0ef          	jal	ra,ffffffffc0200c40 <find_vma>
ffffffffc0200e70:	89aa                	mv	s3,a0
ffffffffc0200e72:	2a050163          	beqz	a0,ffffffffc0201114 <vmm_init+0x39a>
ffffffffc0200e76:	85ca                	mv	a1,s2
ffffffffc0200e78:	8522                	mv	a0,s0
ffffffffc0200e7a:	dc7ff0ef          	jal	ra,ffffffffc0200c40 <find_vma>
ffffffffc0200e7e:	26051b63          	bnez	a0,ffffffffc02010f4 <vmm_init+0x37a>
ffffffffc0200e82:	00348593          	addi	a1,s1,3
ffffffffc0200e86:	8522                	mv	a0,s0
ffffffffc0200e88:	db9ff0ef          	jal	ra,ffffffffc0200c40 <find_vma>
ffffffffc0200e8c:	24051463          	bnez	a0,ffffffffc02010d4 <vmm_init+0x35a>
ffffffffc0200e90:	00448593          	addi	a1,s1,4
ffffffffc0200e94:	8522                	mv	a0,s0
ffffffffc0200e96:	dabff0ef          	jal	ra,ffffffffc0200c40 <find_vma>
ffffffffc0200e9a:	2a051d63          	bnez	a0,ffffffffc0201154 <vmm_init+0x3da>
ffffffffc0200e9e:	008a3783          	ld	a5,8(s4)
ffffffffc0200ea2:	1a979963          	bne	a5,s1,ffffffffc0201054 <vmm_init+0x2da>
ffffffffc0200ea6:	010a3783          	ld	a5,16(s4)
ffffffffc0200eaa:	1b279563          	bne	a5,s2,ffffffffc0201054 <vmm_init+0x2da>
ffffffffc0200eae:	0089b783          	ld	a5,8(s3)
ffffffffc0200eb2:	1c979163          	bne	a5,s1,ffffffffc0201074 <vmm_init+0x2fa>
ffffffffc0200eb6:	0109b783          	ld	a5,16(s3)
ffffffffc0200eba:	1b279d63          	bne	a5,s2,ffffffffc0201074 <vmm_init+0x2fa>
ffffffffc0200ebe:	0495                	addi	s1,s1,5
ffffffffc0200ec0:	0915                	addi	s2,s2,5
ffffffffc0200ec2:	f9549be3          	bne	s1,s5,ffffffffc0200e58 <vmm_init+0xde>
ffffffffc0200ec6:	4491                	li	s1,4
ffffffffc0200ec8:	597d                	li	s2,-1
ffffffffc0200eca:	85a6                	mv	a1,s1
ffffffffc0200ecc:	8522                	mv	a0,s0
ffffffffc0200ece:	d73ff0ef          	jal	ra,ffffffffc0200c40 <find_vma>
ffffffffc0200ed2:	0004859b          	sext.w	a1,s1
ffffffffc0200ed6:	c90d                	beqz	a0,ffffffffc0200f08 <vmm_init+0x18e>
ffffffffc0200ed8:	6914                	ld	a3,16(a0)
ffffffffc0200eda:	6510                	ld	a2,8(a0)
ffffffffc0200edc:	00005517          	auipc	a0,0x5
ffffffffc0200ee0:	90c50513          	addi	a0,a0,-1780 # ffffffffc02057e8 <commands+0xab8>
ffffffffc0200ee4:	a04ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200ee8:	00005697          	auipc	a3,0x5
ffffffffc0200eec:	92868693          	addi	a3,a3,-1752 # ffffffffc0205810 <commands+0xae0>
ffffffffc0200ef0:	00004617          	auipc	a2,0x4
ffffffffc0200ef4:	6a060613          	addi	a2,a2,1696 # ffffffffc0205590 <commands+0x860>
ffffffffc0200ef8:	0dd00593          	li	a1,221
ffffffffc0200efc:	00004517          	auipc	a0,0x4
ffffffffc0200f00:	6ac50513          	addi	a0,a0,1708 # ffffffffc02055a8 <commands+0x878>
ffffffffc0200f04:	ae8ff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0200f08:	14fd                	addi	s1,s1,-1
ffffffffc0200f0a:	fd2490e3          	bne	s1,s2,ffffffffc0200eca <vmm_init+0x150>
ffffffffc0200f0e:	8522                	mv	a0,s0
ffffffffc0200f10:	e3dff0ef          	jal	ra,ffffffffc0200d4c <mm_destroy>
ffffffffc0200f14:	00005517          	auipc	a0,0x5
ffffffffc0200f18:	91450513          	addi	a0,a0,-1772 # ffffffffc0205828 <commands+0xaf8>
ffffffffc0200f1c:	9ccff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0200f20:	124020ef          	jal	ra,ffffffffc0203044 <nr_free_pages>
ffffffffc0200f24:	892a                	mv	s2,a0
ffffffffc0200f26:	ca1ff0ef          	jal	ra,ffffffffc0200bc6 <mm_create>
ffffffffc0200f2a:	00014797          	auipc	a5,0x14
ffffffffc0200f2e:	5aa7b723          	sd	a0,1454(a5) # ffffffffc02154d8 <check_mm_struct>
ffffffffc0200f32:	842a                	mv	s0,a0
ffffffffc0200f34:	2a050063          	beqz	a0,ffffffffc02011d4 <vmm_init+0x45a>
ffffffffc0200f38:	00014797          	auipc	a5,0x14
ffffffffc0200f3c:	56878793          	addi	a5,a5,1384 # ffffffffc02154a0 <boot_pgdir>
ffffffffc0200f40:	6384                	ld	s1,0(a5)
ffffffffc0200f42:	609c                	ld	a5,0(s1)
ffffffffc0200f44:	ed04                	sd	s1,24(a0)
ffffffffc0200f46:	24079763          	bnez	a5,ffffffffc0201194 <vmm_init+0x41a>
ffffffffc0200f4a:	03000513          	li	a0,48
ffffffffc0200f4e:	28b000ef          	jal	ra,ffffffffc02019d8 <kmalloc>
ffffffffc0200f52:	89aa                	mv	s3,a0
ffffffffc0200f54:	14050063          	beqz	a0,ffffffffc0201094 <vmm_init+0x31a>
ffffffffc0200f58:	002007b7          	lui	a5,0x200
ffffffffc0200f5c:	00f9b823          	sd	a5,16(s3)
ffffffffc0200f60:	4789                	li	a5,2
ffffffffc0200f62:	85aa                	mv	a1,a0
ffffffffc0200f64:	00f9ac23          	sw	a5,24(s3)
ffffffffc0200f68:	8522                	mv	a0,s0
ffffffffc0200f6a:	0009b423          	sd	zero,8(s3)
ffffffffc0200f6e:	d11ff0ef          	jal	ra,ffffffffc0200c7e <insert_vma_struct>
ffffffffc0200f72:	10000593          	li	a1,256
ffffffffc0200f76:	8522                	mv	a0,s0
ffffffffc0200f78:	cc9ff0ef          	jal	ra,ffffffffc0200c40 <find_vma>
ffffffffc0200f7c:	10000793          	li	a5,256
ffffffffc0200f80:	16400713          	li	a4,356
ffffffffc0200f84:	26a99863          	bne	s3,a0,ffffffffc02011f4 <vmm_init+0x47a>
ffffffffc0200f88:	00f78023          	sb	a5,0(a5) # 200000 <BASE_ADDRESS-0xffffffffc0000000>
ffffffffc0200f8c:	0785                	addi	a5,a5,1
ffffffffc0200f8e:	fee79de3          	bne	a5,a4,ffffffffc0200f88 <vmm_init+0x20e>
ffffffffc0200f92:	6705                	lui	a4,0x1
ffffffffc0200f94:	10000793          	li	a5,256
ffffffffc0200f98:	35670713          	addi	a4,a4,854 # 1356 <BASE_ADDRESS-0xffffffffc01fecaa>
ffffffffc0200f9c:	16400613          	li	a2,356
ffffffffc0200fa0:	0007c683          	lbu	a3,0(a5)
ffffffffc0200fa4:	0785                	addi	a5,a5,1
ffffffffc0200fa6:	9f15                	subw	a4,a4,a3
ffffffffc0200fa8:	fec79ce3          	bne	a5,a2,ffffffffc0200fa0 <vmm_init+0x226>
ffffffffc0200fac:	28071063          	bnez	a4,ffffffffc020122c <vmm_init+0x4b2>
ffffffffc0200fb0:	4581                	li	a1,0
ffffffffc0200fb2:	8526                	mv	a0,s1
ffffffffc0200fb4:	2fa020ef          	jal	ra,ffffffffc02032ae <page_remove>
ffffffffc0200fb8:	609c                	ld	a5,0(s1)
ffffffffc0200fba:	00014717          	auipc	a4,0x14
ffffffffc0200fbe:	4ee70713          	addi	a4,a4,1262 # ffffffffc02154a8 <npage>
ffffffffc0200fc2:	6318                	ld	a4,0(a4)
ffffffffc0200fc4:	078a                	slli	a5,a5,0x2
ffffffffc0200fc6:	83b1                	srli	a5,a5,0xc
ffffffffc0200fc8:	24e7f663          	bgeu	a5,a4,ffffffffc0201214 <vmm_init+0x49a>
ffffffffc0200fcc:	00006717          	auipc	a4,0x6
ffffffffc0200fd0:	cac70713          	addi	a4,a4,-852 # ffffffffc0206c78 <nbase>
ffffffffc0200fd4:	6318                	ld	a4,0(a4)
ffffffffc0200fd6:	00014697          	auipc	a3,0x14
ffffffffc0200fda:	61268693          	addi	a3,a3,1554 # ffffffffc02155e8 <pages>
ffffffffc0200fde:	6288                	ld	a0,0(a3)
ffffffffc0200fe0:	8f99                	sub	a5,a5,a4
ffffffffc0200fe2:	079a                	slli	a5,a5,0x6
ffffffffc0200fe4:	953e                	add	a0,a0,a5
ffffffffc0200fe6:	4585                	li	a1,1
ffffffffc0200fe8:	016020ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0200fec:	0004b023          	sd	zero,0(s1)
ffffffffc0200ff0:	8522                	mv	a0,s0
ffffffffc0200ff2:	00043c23          	sd	zero,24(s0)
ffffffffc0200ff6:	d57ff0ef          	jal	ra,ffffffffc0200d4c <mm_destroy>
ffffffffc0200ffa:	197d                	addi	s2,s2,-1
ffffffffc0200ffc:	00014797          	auipc	a5,0x14
ffffffffc0201000:	4c07be23          	sd	zero,1244(a5) # ffffffffc02154d8 <check_mm_struct>
ffffffffc0201004:	040020ef          	jal	ra,ffffffffc0203044 <nr_free_pages>
ffffffffc0201008:	1aa91663          	bne	s2,a0,ffffffffc02011b4 <vmm_init+0x43a>
ffffffffc020100c:	00005517          	auipc	a0,0x5
ffffffffc0201010:	8ec50513          	addi	a0,a0,-1812 # ffffffffc02058f8 <commands+0xbc8>
ffffffffc0201014:	8d4ff0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201018:	7442                	ld	s0,48(sp)
ffffffffc020101a:	70e2                	ld	ra,56(sp)
ffffffffc020101c:	74a2                	ld	s1,40(sp)
ffffffffc020101e:	7902                	ld	s2,32(sp)
ffffffffc0201020:	69e2                	ld	s3,24(sp)
ffffffffc0201022:	6a42                	ld	s4,16(sp)
ffffffffc0201024:	6aa2                	ld	s5,8(sp)
ffffffffc0201026:	00005517          	auipc	a0,0x5
ffffffffc020102a:	8f250513          	addi	a0,a0,-1806 # ffffffffc0205918 <commands+0xbe8>
ffffffffc020102e:	6121                	addi	sp,sp,64
ffffffffc0201030:	8b8ff06f          	j	ffffffffc02000e8 <cprintf>
ffffffffc0201034:	00004697          	auipc	a3,0x4
ffffffffc0201038:	6cc68693          	addi	a3,a3,1740 # ffffffffc0205700 <commands+0x9d0>
ffffffffc020103c:	00004617          	auipc	a2,0x4
ffffffffc0201040:	55460613          	addi	a2,a2,1364 # ffffffffc0205590 <commands+0x860>
ffffffffc0201044:	0c400593          	li	a1,196
ffffffffc0201048:	00004517          	auipc	a0,0x4
ffffffffc020104c:	56050513          	addi	a0,a0,1376 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201050:	99cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201054:	00004697          	auipc	a3,0x4
ffffffffc0201058:	73468693          	addi	a3,a3,1844 # ffffffffc0205788 <commands+0xa58>
ffffffffc020105c:	00004617          	auipc	a2,0x4
ffffffffc0201060:	53460613          	addi	a2,a2,1332 # ffffffffc0205590 <commands+0x860>
ffffffffc0201064:	0d400593          	li	a1,212
ffffffffc0201068:	00004517          	auipc	a0,0x4
ffffffffc020106c:	54050513          	addi	a0,a0,1344 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201070:	97cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201074:	00004697          	auipc	a3,0x4
ffffffffc0201078:	74468693          	addi	a3,a3,1860 # ffffffffc02057b8 <commands+0xa88>
ffffffffc020107c:	00004617          	auipc	a2,0x4
ffffffffc0201080:	51460613          	addi	a2,a2,1300 # ffffffffc0205590 <commands+0x860>
ffffffffc0201084:	0d500593          	li	a1,213
ffffffffc0201088:	00004517          	auipc	a0,0x4
ffffffffc020108c:	52050513          	addi	a0,a0,1312 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201090:	95cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201094:	00005697          	auipc	a3,0x5
ffffffffc0201098:	89c68693          	addi	a3,a3,-1892 # ffffffffc0205930 <commands+0xc00>
ffffffffc020109c:	00004617          	auipc	a2,0x4
ffffffffc02010a0:	4f460613          	addi	a2,a2,1268 # ffffffffc0205590 <commands+0x860>
ffffffffc02010a4:	0f400593          	li	a1,244
ffffffffc02010a8:	00004517          	auipc	a0,0x4
ffffffffc02010ac:	50050513          	addi	a0,a0,1280 # ffffffffc02055a8 <commands+0x878>
ffffffffc02010b0:	93cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02010b4:	00004697          	auipc	a3,0x4
ffffffffc02010b8:	63468693          	addi	a3,a3,1588 # ffffffffc02056e8 <commands+0x9b8>
ffffffffc02010bc:	00004617          	auipc	a2,0x4
ffffffffc02010c0:	4d460613          	addi	a2,a2,1236 # ffffffffc0205590 <commands+0x860>
ffffffffc02010c4:	0c200593          	li	a1,194
ffffffffc02010c8:	00004517          	auipc	a0,0x4
ffffffffc02010cc:	4e050513          	addi	a0,a0,1248 # ffffffffc02055a8 <commands+0x878>
ffffffffc02010d0:	91cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02010d4:	00004697          	auipc	a3,0x4
ffffffffc02010d8:	69468693          	addi	a3,a3,1684 # ffffffffc0205768 <commands+0xa38>
ffffffffc02010dc:	00004617          	auipc	a2,0x4
ffffffffc02010e0:	4b460613          	addi	a2,a2,1204 # ffffffffc0205590 <commands+0x860>
ffffffffc02010e4:	0d000593          	li	a1,208
ffffffffc02010e8:	00004517          	auipc	a0,0x4
ffffffffc02010ec:	4c050513          	addi	a0,a0,1216 # ffffffffc02055a8 <commands+0x878>
ffffffffc02010f0:	8fcff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02010f4:	00004697          	auipc	a3,0x4
ffffffffc02010f8:	66468693          	addi	a3,a3,1636 # ffffffffc0205758 <commands+0xa28>
ffffffffc02010fc:	00004617          	auipc	a2,0x4
ffffffffc0201100:	49460613          	addi	a2,a2,1172 # ffffffffc0205590 <commands+0x860>
ffffffffc0201104:	0ce00593          	li	a1,206
ffffffffc0201108:	00004517          	auipc	a0,0x4
ffffffffc020110c:	4a050513          	addi	a0,a0,1184 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201110:	8dcff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201114:	00004697          	auipc	a3,0x4
ffffffffc0201118:	63468693          	addi	a3,a3,1588 # ffffffffc0205748 <commands+0xa18>
ffffffffc020111c:	00004617          	auipc	a2,0x4
ffffffffc0201120:	47460613          	addi	a2,a2,1140 # ffffffffc0205590 <commands+0x860>
ffffffffc0201124:	0cc00593          	li	a1,204
ffffffffc0201128:	00004517          	auipc	a0,0x4
ffffffffc020112c:	48050513          	addi	a0,a0,1152 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201130:	8bcff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201134:	00004697          	auipc	a3,0x4
ffffffffc0201138:	60468693          	addi	a3,a3,1540 # ffffffffc0205738 <commands+0xa08>
ffffffffc020113c:	00004617          	auipc	a2,0x4
ffffffffc0201140:	45460613          	addi	a2,a2,1108 # ffffffffc0205590 <commands+0x860>
ffffffffc0201144:	0ca00593          	li	a1,202
ffffffffc0201148:	00004517          	auipc	a0,0x4
ffffffffc020114c:	46050513          	addi	a0,a0,1120 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201150:	89cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201154:	00004697          	auipc	a3,0x4
ffffffffc0201158:	62468693          	addi	a3,a3,1572 # ffffffffc0205778 <commands+0xa48>
ffffffffc020115c:	00004617          	auipc	a2,0x4
ffffffffc0201160:	43460613          	addi	a2,a2,1076 # ffffffffc0205590 <commands+0x860>
ffffffffc0201164:	0d200593          	li	a1,210
ffffffffc0201168:	00004517          	auipc	a0,0x4
ffffffffc020116c:	44050513          	addi	a0,a0,1088 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201170:	87cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201174:	00004697          	auipc	a3,0x4
ffffffffc0201178:	56468693          	addi	a3,a3,1380 # ffffffffc02056d8 <commands+0x9a8>
ffffffffc020117c:	00004617          	auipc	a2,0x4
ffffffffc0201180:	41460613          	addi	a2,a2,1044 # ffffffffc0205590 <commands+0x860>
ffffffffc0201184:	0ae00593          	li	a1,174
ffffffffc0201188:	00004517          	auipc	a0,0x4
ffffffffc020118c:	42050513          	addi	a0,a0,1056 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201190:	85cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201194:	00004697          	auipc	a3,0x4
ffffffffc0201198:	6cc68693          	addi	a3,a3,1740 # ffffffffc0205860 <commands+0xb30>
ffffffffc020119c:	00004617          	auipc	a2,0x4
ffffffffc02011a0:	3f460613          	addi	a2,a2,1012 # ffffffffc0205590 <commands+0x860>
ffffffffc02011a4:	0f100593          	li	a1,241
ffffffffc02011a8:	00004517          	auipc	a0,0x4
ffffffffc02011ac:	40050513          	addi	a0,a0,1024 # ffffffffc02055a8 <commands+0x878>
ffffffffc02011b0:	83cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02011b4:	00004697          	auipc	a3,0x4
ffffffffc02011b8:	71c68693          	addi	a3,a3,1820 # ffffffffc02058d0 <commands+0xba0>
ffffffffc02011bc:	00004617          	auipc	a2,0x4
ffffffffc02011c0:	3d460613          	addi	a2,a2,980 # ffffffffc0205590 <commands+0x860>
ffffffffc02011c4:	10e00593          	li	a1,270
ffffffffc02011c8:	00004517          	auipc	a0,0x4
ffffffffc02011cc:	3e050513          	addi	a0,a0,992 # ffffffffc02055a8 <commands+0x878>
ffffffffc02011d0:	81cff0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02011d4:	00004697          	auipc	a3,0x4
ffffffffc02011d8:	67468693          	addi	a3,a3,1652 # ffffffffc0205848 <commands+0xb18>
ffffffffc02011dc:	00004617          	auipc	a2,0x4
ffffffffc02011e0:	3b460613          	addi	a2,a2,948 # ffffffffc0205590 <commands+0x860>
ffffffffc02011e4:	0ed00593          	li	a1,237
ffffffffc02011e8:	00004517          	auipc	a0,0x4
ffffffffc02011ec:	3c050513          	addi	a0,a0,960 # ffffffffc02055a8 <commands+0x878>
ffffffffc02011f0:	ffdfe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02011f4:	00004697          	auipc	a3,0x4
ffffffffc02011f8:	67c68693          	addi	a3,a3,1660 # ffffffffc0205870 <commands+0xb40>
ffffffffc02011fc:	00004617          	auipc	a2,0x4
ffffffffc0201200:	39460613          	addi	a2,a2,916 # ffffffffc0205590 <commands+0x860>
ffffffffc0201204:	0f900593          	li	a1,249
ffffffffc0201208:	00004517          	auipc	a0,0x4
ffffffffc020120c:	3a050513          	addi	a0,a0,928 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201210:	fddfe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201214:	00004617          	auipc	a2,0x4
ffffffffc0201218:	68c60613          	addi	a2,a2,1676 # ffffffffc02058a0 <commands+0xb70>
ffffffffc020121c:	06200593          	li	a1,98
ffffffffc0201220:	00004517          	auipc	a0,0x4
ffffffffc0201224:	6a050513          	addi	a0,a0,1696 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0201228:	fc5fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020122c:	00004697          	auipc	a3,0x4
ffffffffc0201230:	66468693          	addi	a3,a3,1636 # ffffffffc0205890 <commands+0xb60>
ffffffffc0201234:	00004617          	auipc	a2,0x4
ffffffffc0201238:	35c60613          	addi	a2,a2,860 # ffffffffc0205590 <commands+0x860>
ffffffffc020123c:	10300593          	li	a1,259
ffffffffc0201240:	00004517          	auipc	a0,0x4
ffffffffc0201244:	36850513          	addi	a0,a0,872 # ffffffffc02055a8 <commands+0x878>
ffffffffc0201248:	fa5fe0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc020124c <do_pgfault>:
ffffffffc020124c:	7139                	addi	sp,sp,-64
ffffffffc020124e:	85b2                	mv	a1,a2
ffffffffc0201250:	f822                	sd	s0,48(sp)
ffffffffc0201252:	f426                	sd	s1,40(sp)
ffffffffc0201254:	fc06                	sd	ra,56(sp)
ffffffffc0201256:	f04a                	sd	s2,32(sp)
ffffffffc0201258:	ec4e                	sd	s3,24(sp)
ffffffffc020125a:	8432                	mv	s0,a2
ffffffffc020125c:	84aa                	mv	s1,a0
ffffffffc020125e:	9e3ff0ef          	jal	ra,ffffffffc0200c40 <find_vma>
ffffffffc0201262:	00014797          	auipc	a5,0x14
ffffffffc0201266:	21e78793          	addi	a5,a5,542 # ffffffffc0215480 <pgfault_num>
ffffffffc020126a:	439c                	lw	a5,0(a5)
ffffffffc020126c:	2785                	addiw	a5,a5,1
ffffffffc020126e:	00014717          	auipc	a4,0x14
ffffffffc0201272:	20f72923          	sw	a5,530(a4) # ffffffffc0215480 <pgfault_num>
ffffffffc0201276:	c555                	beqz	a0,ffffffffc0201322 <do_pgfault+0xd6>
ffffffffc0201278:	651c                	ld	a5,8(a0)
ffffffffc020127a:	0af46463          	bltu	s0,a5,ffffffffc0201322 <do_pgfault+0xd6>
ffffffffc020127e:	4d1c                	lw	a5,24(a0)
ffffffffc0201280:	49c1                	li	s3,16
ffffffffc0201282:	8b89                	andi	a5,a5,2
ffffffffc0201284:	e3a5                	bnez	a5,ffffffffc02012e4 <do_pgfault+0x98>
ffffffffc0201286:	767d                	lui	a2,0xfffff
ffffffffc0201288:	6c88                	ld	a0,24(s1)
ffffffffc020128a:	8c71                	and	s0,s0,a2
ffffffffc020128c:	85a2                	mv	a1,s0
ffffffffc020128e:	4605                	li	a2,1
ffffffffc0201290:	5f5010ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc0201294:	c945                	beqz	a0,ffffffffc0201344 <do_pgfault+0xf8>
ffffffffc0201296:	610c                	ld	a1,0(a0)
ffffffffc0201298:	c5b5                	beqz	a1,ffffffffc0201304 <do_pgfault+0xb8>
ffffffffc020129a:	00014797          	auipc	a5,0x14
ffffffffc020129e:	1fe78793          	addi	a5,a5,510 # ffffffffc0215498 <swap_init_ok>
ffffffffc02012a2:	439c                	lw	a5,0(a5)
ffffffffc02012a4:	2781                	sext.w	a5,a5
ffffffffc02012a6:	c7d9                	beqz	a5,ffffffffc0201334 <do_pgfault+0xe8>
ffffffffc02012a8:	0030                	addi	a2,sp,8
ffffffffc02012aa:	85a2                	mv	a1,s0
ffffffffc02012ac:	8526                	mv	a0,s1
ffffffffc02012ae:	e402                	sd	zero,8(sp)
ffffffffc02012b0:	0e2010ef          	jal	ra,ffffffffc0202392 <swap_in>
ffffffffc02012b4:	892a                	mv	s2,a0
ffffffffc02012b6:	e90d                	bnez	a0,ffffffffc02012e8 <do_pgfault+0x9c>
ffffffffc02012b8:	65a2                	ld	a1,8(sp)
ffffffffc02012ba:	6c88                	ld	a0,24(s1)
ffffffffc02012bc:	86ce                	mv	a3,s3
ffffffffc02012be:	8622                	mv	a2,s0
ffffffffc02012c0:	062020ef          	jal	ra,ffffffffc0203322 <page_insert>
ffffffffc02012c4:	6622                	ld	a2,8(sp)
ffffffffc02012c6:	4685                	li	a3,1
ffffffffc02012c8:	85a2                	mv	a1,s0
ffffffffc02012ca:	8526                	mv	a0,s1
ffffffffc02012cc:	7a3000ef          	jal	ra,ffffffffc020226e <swap_map_swappable>
ffffffffc02012d0:	67a2                	ld	a5,8(sp)
ffffffffc02012d2:	ff80                	sd	s0,56(a5)
ffffffffc02012d4:	70e2                	ld	ra,56(sp)
ffffffffc02012d6:	7442                	ld	s0,48(sp)
ffffffffc02012d8:	854a                	mv	a0,s2
ffffffffc02012da:	74a2                	ld	s1,40(sp)
ffffffffc02012dc:	7902                	ld	s2,32(sp)
ffffffffc02012de:	69e2                	ld	s3,24(sp)
ffffffffc02012e0:	6121                	addi	sp,sp,64
ffffffffc02012e2:	8082                	ret
ffffffffc02012e4:	49dd                	li	s3,23
ffffffffc02012e6:	b745                	j	ffffffffc0201286 <do_pgfault+0x3a>
ffffffffc02012e8:	00004517          	auipc	a0,0x4
ffffffffc02012ec:	34850513          	addi	a0,a0,840 # ffffffffc0205630 <commands+0x900>
ffffffffc02012f0:	df9fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02012f4:	70e2                	ld	ra,56(sp)
ffffffffc02012f6:	7442                	ld	s0,48(sp)
ffffffffc02012f8:	854a                	mv	a0,s2
ffffffffc02012fa:	74a2                	ld	s1,40(sp)
ffffffffc02012fc:	7902                	ld	s2,32(sp)
ffffffffc02012fe:	69e2                	ld	s3,24(sp)
ffffffffc0201300:	6121                	addi	sp,sp,64
ffffffffc0201302:	8082                	ret
ffffffffc0201304:	6c88                	ld	a0,24(s1)
ffffffffc0201306:	864e                	mv	a2,s3
ffffffffc0201308:	85a2                	mv	a1,s0
ffffffffc020130a:	24d020ef          	jal	ra,ffffffffc0203d56 <pgdir_alloc_page>
ffffffffc020130e:	4901                	li	s2,0
ffffffffc0201310:	f171                	bnez	a0,ffffffffc02012d4 <do_pgfault+0x88>
ffffffffc0201312:	00004517          	auipc	a0,0x4
ffffffffc0201316:	2f650513          	addi	a0,a0,758 # ffffffffc0205608 <commands+0x8d8>
ffffffffc020131a:	dcffe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020131e:	5971                	li	s2,-4
ffffffffc0201320:	bf55                	j	ffffffffc02012d4 <do_pgfault+0x88>
ffffffffc0201322:	85a2                	mv	a1,s0
ffffffffc0201324:	00004517          	auipc	a0,0x4
ffffffffc0201328:	29450513          	addi	a0,a0,660 # ffffffffc02055b8 <commands+0x888>
ffffffffc020132c:	dbdfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201330:	5975                	li	s2,-3
ffffffffc0201332:	b74d                	j	ffffffffc02012d4 <do_pgfault+0x88>
ffffffffc0201334:	00004517          	auipc	a0,0x4
ffffffffc0201338:	31c50513          	addi	a0,a0,796 # ffffffffc0205650 <commands+0x920>
ffffffffc020133c:	dadfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201340:	5971                	li	s2,-4
ffffffffc0201342:	bf49                	j	ffffffffc02012d4 <do_pgfault+0x88>
ffffffffc0201344:	00004517          	auipc	a0,0x4
ffffffffc0201348:	2a450513          	addi	a0,a0,676 # ffffffffc02055e8 <commands+0x8b8>
ffffffffc020134c:	d9dfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201350:	5971                	li	s2,-4
ffffffffc0201352:	b749                	j	ffffffffc02012d4 <do_pgfault+0x88>

ffffffffc0201354 <_fifo_init_mm>:
ffffffffc0201354:	00014797          	auipc	a5,0x14
ffffffffc0201358:	18c78793          	addi	a5,a5,396 # ffffffffc02154e0 <pra_list_head>
ffffffffc020135c:	f51c                	sd	a5,40(a0)
ffffffffc020135e:	e79c                	sd	a5,8(a5)
ffffffffc0201360:	e39c                	sd	a5,0(a5)
ffffffffc0201362:	4501                	li	a0,0
ffffffffc0201364:	8082                	ret

ffffffffc0201366 <_fifo_init>:
ffffffffc0201366:	4501                	li	a0,0
ffffffffc0201368:	8082                	ret

ffffffffc020136a <_fifo_set_unswappable>:
ffffffffc020136a:	4501                	li	a0,0
ffffffffc020136c:	8082                	ret

ffffffffc020136e <_fifo_tick_event>:
ffffffffc020136e:	4501                	li	a0,0
ffffffffc0201370:	8082                	ret

ffffffffc0201372 <_fifo_check_swap>:
ffffffffc0201372:	711d                	addi	sp,sp,-96
ffffffffc0201374:	fc4e                	sd	s3,56(sp)
ffffffffc0201376:	f852                	sd	s4,48(sp)
ffffffffc0201378:	00004517          	auipc	a0,0x4
ffffffffc020137c:	5c850513          	addi	a0,a0,1480 # ffffffffc0205940 <commands+0xc10>
ffffffffc0201380:	698d                	lui	s3,0x3
ffffffffc0201382:	4a31                	li	s4,12
ffffffffc0201384:	e8a2                	sd	s0,80(sp)
ffffffffc0201386:	e4a6                	sd	s1,72(sp)
ffffffffc0201388:	ec86                	sd	ra,88(sp)
ffffffffc020138a:	e0ca                	sd	s2,64(sp)
ffffffffc020138c:	f456                	sd	s5,40(sp)
ffffffffc020138e:	f05a                	sd	s6,32(sp)
ffffffffc0201390:	ec5e                	sd	s7,24(sp)
ffffffffc0201392:	e862                	sd	s8,16(sp)
ffffffffc0201394:	e466                	sd	s9,8(sp)
ffffffffc0201396:	00014417          	auipc	s0,0x14
ffffffffc020139a:	0ea40413          	addi	s0,s0,234 # ffffffffc0215480 <pgfault_num>
ffffffffc020139e:	d4bfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02013a2:	01498023          	sb	s4,0(s3) # 3000 <BASE_ADDRESS-0xffffffffc01fd000>
ffffffffc02013a6:	4004                	lw	s1,0(s0)
ffffffffc02013a8:	4791                	li	a5,4
ffffffffc02013aa:	2481                	sext.w	s1,s1
ffffffffc02013ac:	14f49963          	bne	s1,a5,ffffffffc02014fe <_fifo_check_swap+0x18c>
ffffffffc02013b0:	00004517          	auipc	a0,0x4
ffffffffc02013b4:	5e050513          	addi	a0,a0,1504 # ffffffffc0205990 <commands+0xc60>
ffffffffc02013b8:	6a85                	lui	s5,0x1
ffffffffc02013ba:	4b29                	li	s6,10
ffffffffc02013bc:	d2dfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02013c0:	016a8023          	sb	s6,0(s5) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc02013c4:	00042903          	lw	s2,0(s0)
ffffffffc02013c8:	2901                	sext.w	s2,s2
ffffffffc02013ca:	2a991a63          	bne	s2,s1,ffffffffc020167e <_fifo_check_swap+0x30c>
ffffffffc02013ce:	00004517          	auipc	a0,0x4
ffffffffc02013d2:	5ea50513          	addi	a0,a0,1514 # ffffffffc02059b8 <commands+0xc88>
ffffffffc02013d6:	6b91                	lui	s7,0x4
ffffffffc02013d8:	4c35                	li	s8,13
ffffffffc02013da:	d0ffe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02013de:	018b8023          	sb	s8,0(s7) # 4000 <BASE_ADDRESS-0xffffffffc01fc000>
ffffffffc02013e2:	4004                	lw	s1,0(s0)
ffffffffc02013e4:	2481                	sext.w	s1,s1
ffffffffc02013e6:	27249c63          	bne	s1,s2,ffffffffc020165e <_fifo_check_swap+0x2ec>
ffffffffc02013ea:	00004517          	auipc	a0,0x4
ffffffffc02013ee:	5f650513          	addi	a0,a0,1526 # ffffffffc02059e0 <commands+0xcb0>
ffffffffc02013f2:	6909                	lui	s2,0x2
ffffffffc02013f4:	4cad                	li	s9,11
ffffffffc02013f6:	cf3fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02013fa:	01990023          	sb	s9,0(s2) # 2000 <BASE_ADDRESS-0xffffffffc01fe000>
ffffffffc02013fe:	401c                	lw	a5,0(s0)
ffffffffc0201400:	2781                	sext.w	a5,a5
ffffffffc0201402:	22979e63          	bne	a5,s1,ffffffffc020163e <_fifo_check_swap+0x2cc>
ffffffffc0201406:	00004517          	auipc	a0,0x4
ffffffffc020140a:	60250513          	addi	a0,a0,1538 # ffffffffc0205a08 <commands+0xcd8>
ffffffffc020140e:	cdbfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201412:	6795                	lui	a5,0x5
ffffffffc0201414:	4739                	li	a4,14
ffffffffc0201416:	00e78023          	sb	a4,0(a5) # 5000 <BASE_ADDRESS-0xffffffffc01fb000>
ffffffffc020141a:	4004                	lw	s1,0(s0)
ffffffffc020141c:	4795                	li	a5,5
ffffffffc020141e:	2481                	sext.w	s1,s1
ffffffffc0201420:	1ef49f63          	bne	s1,a5,ffffffffc020161e <_fifo_check_swap+0x2ac>
ffffffffc0201424:	00004517          	auipc	a0,0x4
ffffffffc0201428:	5bc50513          	addi	a0,a0,1468 # ffffffffc02059e0 <commands+0xcb0>
ffffffffc020142c:	cbdfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201430:	01990023          	sb	s9,0(s2)
ffffffffc0201434:	401c                	lw	a5,0(s0)
ffffffffc0201436:	2781                	sext.w	a5,a5
ffffffffc0201438:	1c979363          	bne	a5,s1,ffffffffc02015fe <_fifo_check_swap+0x28c>
ffffffffc020143c:	00004517          	auipc	a0,0x4
ffffffffc0201440:	55450513          	addi	a0,a0,1364 # ffffffffc0205990 <commands+0xc60>
ffffffffc0201444:	ca5fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201448:	016a8023          	sb	s6,0(s5)
ffffffffc020144c:	401c                	lw	a5,0(s0)
ffffffffc020144e:	4719                	li	a4,6
ffffffffc0201450:	2781                	sext.w	a5,a5
ffffffffc0201452:	18e79663          	bne	a5,a4,ffffffffc02015de <_fifo_check_swap+0x26c>
ffffffffc0201456:	00004517          	auipc	a0,0x4
ffffffffc020145a:	58a50513          	addi	a0,a0,1418 # ffffffffc02059e0 <commands+0xcb0>
ffffffffc020145e:	c8bfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201462:	01990023          	sb	s9,0(s2)
ffffffffc0201466:	401c                	lw	a5,0(s0)
ffffffffc0201468:	471d                	li	a4,7
ffffffffc020146a:	2781                	sext.w	a5,a5
ffffffffc020146c:	14e79963          	bne	a5,a4,ffffffffc02015be <_fifo_check_swap+0x24c>
ffffffffc0201470:	00004517          	auipc	a0,0x4
ffffffffc0201474:	4d050513          	addi	a0,a0,1232 # ffffffffc0205940 <commands+0xc10>
ffffffffc0201478:	c71fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020147c:	01498023          	sb	s4,0(s3)
ffffffffc0201480:	401c                	lw	a5,0(s0)
ffffffffc0201482:	4721                	li	a4,8
ffffffffc0201484:	2781                	sext.w	a5,a5
ffffffffc0201486:	10e79c63          	bne	a5,a4,ffffffffc020159e <_fifo_check_swap+0x22c>
ffffffffc020148a:	00004517          	auipc	a0,0x4
ffffffffc020148e:	52e50513          	addi	a0,a0,1326 # ffffffffc02059b8 <commands+0xc88>
ffffffffc0201492:	c57fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201496:	018b8023          	sb	s8,0(s7)
ffffffffc020149a:	401c                	lw	a5,0(s0)
ffffffffc020149c:	4725                	li	a4,9
ffffffffc020149e:	2781                	sext.w	a5,a5
ffffffffc02014a0:	0ce79f63          	bne	a5,a4,ffffffffc020157e <_fifo_check_swap+0x20c>
ffffffffc02014a4:	00004517          	auipc	a0,0x4
ffffffffc02014a8:	56450513          	addi	a0,a0,1380 # ffffffffc0205a08 <commands+0xcd8>
ffffffffc02014ac:	c3dfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02014b0:	6795                	lui	a5,0x5
ffffffffc02014b2:	4739                	li	a4,14
ffffffffc02014b4:	00e78023          	sb	a4,0(a5) # 5000 <BASE_ADDRESS-0xffffffffc01fb000>
ffffffffc02014b8:	4004                	lw	s1,0(s0)
ffffffffc02014ba:	47a9                	li	a5,10
ffffffffc02014bc:	2481                	sext.w	s1,s1
ffffffffc02014be:	0af49063          	bne	s1,a5,ffffffffc020155e <_fifo_check_swap+0x1ec>
ffffffffc02014c2:	00004517          	auipc	a0,0x4
ffffffffc02014c6:	4ce50513          	addi	a0,a0,1230 # ffffffffc0205990 <commands+0xc60>
ffffffffc02014ca:	c1ffe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02014ce:	6785                	lui	a5,0x1
ffffffffc02014d0:	0007c783          	lbu	a5,0(a5) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc02014d4:	06979563          	bne	a5,s1,ffffffffc020153e <_fifo_check_swap+0x1cc>
ffffffffc02014d8:	401c                	lw	a5,0(s0)
ffffffffc02014da:	472d                	li	a4,11
ffffffffc02014dc:	2781                	sext.w	a5,a5
ffffffffc02014de:	04e79063          	bne	a5,a4,ffffffffc020151e <_fifo_check_swap+0x1ac>
ffffffffc02014e2:	60e6                	ld	ra,88(sp)
ffffffffc02014e4:	6446                	ld	s0,80(sp)
ffffffffc02014e6:	64a6                	ld	s1,72(sp)
ffffffffc02014e8:	6906                	ld	s2,64(sp)
ffffffffc02014ea:	79e2                	ld	s3,56(sp)
ffffffffc02014ec:	7a42                	ld	s4,48(sp)
ffffffffc02014ee:	7aa2                	ld	s5,40(sp)
ffffffffc02014f0:	7b02                	ld	s6,32(sp)
ffffffffc02014f2:	6be2                	ld	s7,24(sp)
ffffffffc02014f4:	6c42                	ld	s8,16(sp)
ffffffffc02014f6:	6ca2                	ld	s9,8(sp)
ffffffffc02014f8:	4501                	li	a0,0
ffffffffc02014fa:	6125                	addi	sp,sp,96
ffffffffc02014fc:	8082                	ret
ffffffffc02014fe:	00004697          	auipc	a3,0x4
ffffffffc0201502:	46a68693          	addi	a3,a3,1130 # ffffffffc0205968 <commands+0xc38>
ffffffffc0201506:	00004617          	auipc	a2,0x4
ffffffffc020150a:	08a60613          	addi	a2,a2,138 # ffffffffc0205590 <commands+0x860>
ffffffffc020150e:	05100593          	li	a1,81
ffffffffc0201512:	00004517          	auipc	a0,0x4
ffffffffc0201516:	46650513          	addi	a0,a0,1126 # ffffffffc0205978 <commands+0xc48>
ffffffffc020151a:	cd3fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020151e:	00004697          	auipc	a3,0x4
ffffffffc0201522:	59a68693          	addi	a3,a3,1434 # ffffffffc0205ab8 <commands+0xd88>
ffffffffc0201526:	00004617          	auipc	a2,0x4
ffffffffc020152a:	06a60613          	addi	a2,a2,106 # ffffffffc0205590 <commands+0x860>
ffffffffc020152e:	07300593          	li	a1,115
ffffffffc0201532:	00004517          	auipc	a0,0x4
ffffffffc0201536:	44650513          	addi	a0,a0,1094 # ffffffffc0205978 <commands+0xc48>
ffffffffc020153a:	cb3fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020153e:	00004697          	auipc	a3,0x4
ffffffffc0201542:	55268693          	addi	a3,a3,1362 # ffffffffc0205a90 <commands+0xd60>
ffffffffc0201546:	00004617          	auipc	a2,0x4
ffffffffc020154a:	04a60613          	addi	a2,a2,74 # ffffffffc0205590 <commands+0x860>
ffffffffc020154e:	07100593          	li	a1,113
ffffffffc0201552:	00004517          	auipc	a0,0x4
ffffffffc0201556:	42650513          	addi	a0,a0,1062 # ffffffffc0205978 <commands+0xc48>
ffffffffc020155a:	c93fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020155e:	00004697          	auipc	a3,0x4
ffffffffc0201562:	52268693          	addi	a3,a3,1314 # ffffffffc0205a80 <commands+0xd50>
ffffffffc0201566:	00004617          	auipc	a2,0x4
ffffffffc020156a:	02a60613          	addi	a2,a2,42 # ffffffffc0205590 <commands+0x860>
ffffffffc020156e:	06f00593          	li	a1,111
ffffffffc0201572:	00004517          	auipc	a0,0x4
ffffffffc0201576:	40650513          	addi	a0,a0,1030 # ffffffffc0205978 <commands+0xc48>
ffffffffc020157a:	c73fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020157e:	00004697          	auipc	a3,0x4
ffffffffc0201582:	4f268693          	addi	a3,a3,1266 # ffffffffc0205a70 <commands+0xd40>
ffffffffc0201586:	00004617          	auipc	a2,0x4
ffffffffc020158a:	00a60613          	addi	a2,a2,10 # ffffffffc0205590 <commands+0x860>
ffffffffc020158e:	06c00593          	li	a1,108
ffffffffc0201592:	00004517          	auipc	a0,0x4
ffffffffc0201596:	3e650513          	addi	a0,a0,998 # ffffffffc0205978 <commands+0xc48>
ffffffffc020159a:	c53fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020159e:	00004697          	auipc	a3,0x4
ffffffffc02015a2:	4c268693          	addi	a3,a3,1218 # ffffffffc0205a60 <commands+0xd30>
ffffffffc02015a6:	00004617          	auipc	a2,0x4
ffffffffc02015aa:	fea60613          	addi	a2,a2,-22 # ffffffffc0205590 <commands+0x860>
ffffffffc02015ae:	06900593          	li	a1,105
ffffffffc02015b2:	00004517          	auipc	a0,0x4
ffffffffc02015b6:	3c650513          	addi	a0,a0,966 # ffffffffc0205978 <commands+0xc48>
ffffffffc02015ba:	c33fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02015be:	00004697          	auipc	a3,0x4
ffffffffc02015c2:	49268693          	addi	a3,a3,1170 # ffffffffc0205a50 <commands+0xd20>
ffffffffc02015c6:	00004617          	auipc	a2,0x4
ffffffffc02015ca:	fca60613          	addi	a2,a2,-54 # ffffffffc0205590 <commands+0x860>
ffffffffc02015ce:	06600593          	li	a1,102
ffffffffc02015d2:	00004517          	auipc	a0,0x4
ffffffffc02015d6:	3a650513          	addi	a0,a0,934 # ffffffffc0205978 <commands+0xc48>
ffffffffc02015da:	c13fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02015de:	00004697          	auipc	a3,0x4
ffffffffc02015e2:	46268693          	addi	a3,a3,1122 # ffffffffc0205a40 <commands+0xd10>
ffffffffc02015e6:	00004617          	auipc	a2,0x4
ffffffffc02015ea:	faa60613          	addi	a2,a2,-86 # ffffffffc0205590 <commands+0x860>
ffffffffc02015ee:	06300593          	li	a1,99
ffffffffc02015f2:	00004517          	auipc	a0,0x4
ffffffffc02015f6:	38650513          	addi	a0,a0,902 # ffffffffc0205978 <commands+0xc48>
ffffffffc02015fa:	bf3fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02015fe:	00004697          	auipc	a3,0x4
ffffffffc0201602:	43268693          	addi	a3,a3,1074 # ffffffffc0205a30 <commands+0xd00>
ffffffffc0201606:	00004617          	auipc	a2,0x4
ffffffffc020160a:	f8a60613          	addi	a2,a2,-118 # ffffffffc0205590 <commands+0x860>
ffffffffc020160e:	06000593          	li	a1,96
ffffffffc0201612:	00004517          	auipc	a0,0x4
ffffffffc0201616:	36650513          	addi	a0,a0,870 # ffffffffc0205978 <commands+0xc48>
ffffffffc020161a:	bd3fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020161e:	00004697          	auipc	a3,0x4
ffffffffc0201622:	41268693          	addi	a3,a3,1042 # ffffffffc0205a30 <commands+0xd00>
ffffffffc0201626:	00004617          	auipc	a2,0x4
ffffffffc020162a:	f6a60613          	addi	a2,a2,-150 # ffffffffc0205590 <commands+0x860>
ffffffffc020162e:	05d00593          	li	a1,93
ffffffffc0201632:	00004517          	auipc	a0,0x4
ffffffffc0201636:	34650513          	addi	a0,a0,838 # ffffffffc0205978 <commands+0xc48>
ffffffffc020163a:	bb3fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020163e:	00004697          	auipc	a3,0x4
ffffffffc0201642:	32a68693          	addi	a3,a3,810 # ffffffffc0205968 <commands+0xc38>
ffffffffc0201646:	00004617          	auipc	a2,0x4
ffffffffc020164a:	f4a60613          	addi	a2,a2,-182 # ffffffffc0205590 <commands+0x860>
ffffffffc020164e:	05a00593          	li	a1,90
ffffffffc0201652:	00004517          	auipc	a0,0x4
ffffffffc0201656:	32650513          	addi	a0,a0,806 # ffffffffc0205978 <commands+0xc48>
ffffffffc020165a:	b93fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020165e:	00004697          	auipc	a3,0x4
ffffffffc0201662:	30a68693          	addi	a3,a3,778 # ffffffffc0205968 <commands+0xc38>
ffffffffc0201666:	00004617          	auipc	a2,0x4
ffffffffc020166a:	f2a60613          	addi	a2,a2,-214 # ffffffffc0205590 <commands+0x860>
ffffffffc020166e:	05700593          	li	a1,87
ffffffffc0201672:	00004517          	auipc	a0,0x4
ffffffffc0201676:	30650513          	addi	a0,a0,774 # ffffffffc0205978 <commands+0xc48>
ffffffffc020167a:	b73fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020167e:	00004697          	auipc	a3,0x4
ffffffffc0201682:	2ea68693          	addi	a3,a3,746 # ffffffffc0205968 <commands+0xc38>
ffffffffc0201686:	00004617          	auipc	a2,0x4
ffffffffc020168a:	f0a60613          	addi	a2,a2,-246 # ffffffffc0205590 <commands+0x860>
ffffffffc020168e:	05400593          	li	a1,84
ffffffffc0201692:	00004517          	auipc	a0,0x4
ffffffffc0201696:	2e650513          	addi	a0,a0,742 # ffffffffc0205978 <commands+0xc48>
ffffffffc020169a:	b53fe0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc020169e <_fifo_swap_out_victim>:
ffffffffc020169e:	751c                	ld	a5,40(a0)
ffffffffc02016a0:	1141                	addi	sp,sp,-16
ffffffffc02016a2:	e406                	sd	ra,8(sp)
ffffffffc02016a4:	cf91                	beqz	a5,ffffffffc02016c0 <_fifo_swap_out_victim+0x22>
ffffffffc02016a6:	ee0d                	bnez	a2,ffffffffc02016e0 <_fifo_swap_out_victim+0x42>
ffffffffc02016a8:	679c                	ld	a5,8(a5)
ffffffffc02016aa:	60a2                	ld	ra,8(sp)
ffffffffc02016ac:	4501                	li	a0,0
ffffffffc02016ae:	6394                	ld	a3,0(a5)
ffffffffc02016b0:	6798                	ld	a4,8(a5)
ffffffffc02016b2:	fd878793          	addi	a5,a5,-40
ffffffffc02016b6:	e698                	sd	a4,8(a3)
ffffffffc02016b8:	e314                	sd	a3,0(a4)
ffffffffc02016ba:	e19c                	sd	a5,0(a1)
ffffffffc02016bc:	0141                	addi	sp,sp,16
ffffffffc02016be:	8082                	ret
ffffffffc02016c0:	00004697          	auipc	a3,0x4
ffffffffc02016c4:	42868693          	addi	a3,a3,1064 # ffffffffc0205ae8 <commands+0xdb8>
ffffffffc02016c8:	00004617          	auipc	a2,0x4
ffffffffc02016cc:	ec860613          	addi	a2,a2,-312 # ffffffffc0205590 <commands+0x860>
ffffffffc02016d0:	04100593          	li	a1,65
ffffffffc02016d4:	00004517          	auipc	a0,0x4
ffffffffc02016d8:	2a450513          	addi	a0,a0,676 # ffffffffc0205978 <commands+0xc48>
ffffffffc02016dc:	b11fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02016e0:	00004697          	auipc	a3,0x4
ffffffffc02016e4:	41868693          	addi	a3,a3,1048 # ffffffffc0205af8 <commands+0xdc8>
ffffffffc02016e8:	00004617          	auipc	a2,0x4
ffffffffc02016ec:	ea860613          	addi	a2,a2,-344 # ffffffffc0205590 <commands+0x860>
ffffffffc02016f0:	04200593          	li	a1,66
ffffffffc02016f4:	00004517          	auipc	a0,0x4
ffffffffc02016f8:	28450513          	addi	a0,a0,644 # ffffffffc0205978 <commands+0xc48>
ffffffffc02016fc:	af1fe0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0201700 <_fifo_map_swappable>:
ffffffffc0201700:	02860713          	addi	a4,a2,40
ffffffffc0201704:	751c                	ld	a5,40(a0)
ffffffffc0201706:	cb09                	beqz	a4,ffffffffc0201718 <_fifo_map_swappable+0x18>
ffffffffc0201708:	cb81                	beqz	a5,ffffffffc0201718 <_fifo_map_swappable+0x18>
ffffffffc020170a:	6394                	ld	a3,0(a5)
ffffffffc020170c:	e398                	sd	a4,0(a5)
ffffffffc020170e:	4501                	li	a0,0
ffffffffc0201710:	e698                	sd	a4,8(a3)
ffffffffc0201712:	fa1c                	sd	a5,48(a2)
ffffffffc0201714:	f614                	sd	a3,40(a2)
ffffffffc0201716:	8082                	ret
ffffffffc0201718:	1141                	addi	sp,sp,-16
ffffffffc020171a:	00004697          	auipc	a3,0x4
ffffffffc020171e:	3ae68693          	addi	a3,a3,942 # ffffffffc0205ac8 <commands+0xd98>
ffffffffc0201722:	00004617          	auipc	a2,0x4
ffffffffc0201726:	e6e60613          	addi	a2,a2,-402 # ffffffffc0205590 <commands+0x860>
ffffffffc020172a:	03200593          	li	a1,50
ffffffffc020172e:	00004517          	auipc	a0,0x4
ffffffffc0201732:	24a50513          	addi	a0,a0,586 # ffffffffc0205978 <commands+0xc48>
ffffffffc0201736:	e406                	sd	ra,8(sp)
ffffffffc0201738:	ab5fe0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc020173c <slob_free>:
ffffffffc020173c:	c125                	beqz	a0,ffffffffc020179c <slob_free+0x60>
ffffffffc020173e:	e1a5                	bnez	a1,ffffffffc020179e <slob_free+0x62>
ffffffffc0201740:	100027f3          	csrr	a5,sstatus
ffffffffc0201744:	8b89                	andi	a5,a5,2
ffffffffc0201746:	4581                	li	a1,0
ffffffffc0201748:	e3bd                	bnez	a5,ffffffffc02017ae <slob_free+0x72>
ffffffffc020174a:	00009797          	auipc	a5,0x9
ffffffffc020174e:	90678793          	addi	a5,a5,-1786 # ffffffffc020a050 <slobfree>
ffffffffc0201752:	639c                	ld	a5,0(a5)
ffffffffc0201754:	6798                	ld	a4,8(a5)
ffffffffc0201756:	00a7fa63          	bgeu	a5,a0,ffffffffc020176a <slob_free+0x2e>
ffffffffc020175a:	00e56c63          	bltu	a0,a4,ffffffffc0201772 <slob_free+0x36>
ffffffffc020175e:	00e7fa63          	bgeu	a5,a4,ffffffffc0201772 <slob_free+0x36>
ffffffffc0201762:	87ba                	mv	a5,a4
ffffffffc0201764:	6798                	ld	a4,8(a5)
ffffffffc0201766:	fea7eae3          	bltu	a5,a0,ffffffffc020175a <slob_free+0x1e>
ffffffffc020176a:	fee7ece3          	bltu	a5,a4,ffffffffc0201762 <slob_free+0x26>
ffffffffc020176e:	fee57ae3          	bgeu	a0,a4,ffffffffc0201762 <slob_free+0x26>
ffffffffc0201772:	4110                	lw	a2,0(a0)
ffffffffc0201774:	00461693          	slli	a3,a2,0x4
ffffffffc0201778:	96aa                	add	a3,a3,a0
ffffffffc020177a:	08d70b63          	beq	a4,a3,ffffffffc0201810 <slob_free+0xd4>
ffffffffc020177e:	4394                	lw	a3,0(a5)
ffffffffc0201780:	e518                	sd	a4,8(a0)
ffffffffc0201782:	00469713          	slli	a4,a3,0x4
ffffffffc0201786:	973e                	add	a4,a4,a5
ffffffffc0201788:	08e50f63          	beq	a0,a4,ffffffffc0201826 <slob_free+0xea>
ffffffffc020178c:	e788                	sd	a0,8(a5)
ffffffffc020178e:	00009717          	auipc	a4,0x9
ffffffffc0201792:	8cf73123          	sd	a5,-1854(a4) # ffffffffc020a050 <slobfree>
ffffffffc0201796:	c199                	beqz	a1,ffffffffc020179c <slob_free+0x60>
ffffffffc0201798:	e4dfe06f          	j	ffffffffc02005e4 <intr_enable>
ffffffffc020179c:	8082                	ret
ffffffffc020179e:	05bd                	addi	a1,a1,15
ffffffffc02017a0:	8191                	srli	a1,a1,0x4
ffffffffc02017a2:	c10c                	sw	a1,0(a0)
ffffffffc02017a4:	100027f3          	csrr	a5,sstatus
ffffffffc02017a8:	8b89                	andi	a5,a5,2
ffffffffc02017aa:	4581                	li	a1,0
ffffffffc02017ac:	dfd9                	beqz	a5,ffffffffc020174a <slob_free+0xe>
ffffffffc02017ae:	1101                	addi	sp,sp,-32
ffffffffc02017b0:	e42a                	sd	a0,8(sp)
ffffffffc02017b2:	ec06                	sd	ra,24(sp)
ffffffffc02017b4:	e37fe0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc02017b8:	00009797          	auipc	a5,0x9
ffffffffc02017bc:	89878793          	addi	a5,a5,-1896 # ffffffffc020a050 <slobfree>
ffffffffc02017c0:	639c                	ld	a5,0(a5)
ffffffffc02017c2:	6522                	ld	a0,8(sp)
ffffffffc02017c4:	4585                	li	a1,1
ffffffffc02017c6:	6798                	ld	a4,8(a5)
ffffffffc02017c8:	00a7fa63          	bgeu	a5,a0,ffffffffc02017dc <slob_free+0xa0>
ffffffffc02017cc:	00e56c63          	bltu	a0,a4,ffffffffc02017e4 <slob_free+0xa8>
ffffffffc02017d0:	00e7fa63          	bgeu	a5,a4,ffffffffc02017e4 <slob_free+0xa8>
ffffffffc02017d4:	87ba                	mv	a5,a4
ffffffffc02017d6:	6798                	ld	a4,8(a5)
ffffffffc02017d8:	fea7eae3          	bltu	a5,a0,ffffffffc02017cc <slob_free+0x90>
ffffffffc02017dc:	fee7ece3          	bltu	a5,a4,ffffffffc02017d4 <slob_free+0x98>
ffffffffc02017e0:	fee57ae3          	bgeu	a0,a4,ffffffffc02017d4 <slob_free+0x98>
ffffffffc02017e4:	4110                	lw	a2,0(a0)
ffffffffc02017e6:	00461693          	slli	a3,a2,0x4
ffffffffc02017ea:	96aa                	add	a3,a3,a0
ffffffffc02017ec:	04d70763          	beq	a4,a3,ffffffffc020183a <slob_free+0xfe>
ffffffffc02017f0:	e518                	sd	a4,8(a0)
ffffffffc02017f2:	4394                	lw	a3,0(a5)
ffffffffc02017f4:	00469713          	slli	a4,a3,0x4
ffffffffc02017f8:	973e                	add	a4,a4,a5
ffffffffc02017fa:	04e50663          	beq	a0,a4,ffffffffc0201846 <slob_free+0x10a>
ffffffffc02017fe:	e788                	sd	a0,8(a5)
ffffffffc0201800:	00009717          	auipc	a4,0x9
ffffffffc0201804:	84f73823          	sd	a5,-1968(a4) # ffffffffc020a050 <slobfree>
ffffffffc0201808:	e58d                	bnez	a1,ffffffffc0201832 <slob_free+0xf6>
ffffffffc020180a:	60e2                	ld	ra,24(sp)
ffffffffc020180c:	6105                	addi	sp,sp,32
ffffffffc020180e:	8082                	ret
ffffffffc0201810:	4314                	lw	a3,0(a4)
ffffffffc0201812:	6718                	ld	a4,8(a4)
ffffffffc0201814:	9e35                	addw	a2,a2,a3
ffffffffc0201816:	c110                	sw	a2,0(a0)
ffffffffc0201818:	4394                	lw	a3,0(a5)
ffffffffc020181a:	e518                	sd	a4,8(a0)
ffffffffc020181c:	00469713          	slli	a4,a3,0x4
ffffffffc0201820:	973e                	add	a4,a4,a5
ffffffffc0201822:	f6e515e3          	bne	a0,a4,ffffffffc020178c <slob_free+0x50>
ffffffffc0201826:	4118                	lw	a4,0(a0)
ffffffffc0201828:	6510                	ld	a2,8(a0)
ffffffffc020182a:	9eb9                	addw	a3,a3,a4
ffffffffc020182c:	c394                	sw	a3,0(a5)
ffffffffc020182e:	e790                	sd	a2,8(a5)
ffffffffc0201830:	bfb9                	j	ffffffffc020178e <slob_free+0x52>
ffffffffc0201832:	60e2                	ld	ra,24(sp)
ffffffffc0201834:	6105                	addi	sp,sp,32
ffffffffc0201836:	daffe06f          	j	ffffffffc02005e4 <intr_enable>
ffffffffc020183a:	4314                	lw	a3,0(a4)
ffffffffc020183c:	6718                	ld	a4,8(a4)
ffffffffc020183e:	9e35                	addw	a2,a2,a3
ffffffffc0201840:	c110                	sw	a2,0(a0)
ffffffffc0201842:	e518                	sd	a4,8(a0)
ffffffffc0201844:	b77d                	j	ffffffffc02017f2 <slob_free+0xb6>
ffffffffc0201846:	4118                	lw	a4,0(a0)
ffffffffc0201848:	6510                	ld	a2,8(a0)
ffffffffc020184a:	9eb9                	addw	a3,a3,a4
ffffffffc020184c:	c394                	sw	a3,0(a5)
ffffffffc020184e:	e790                	sd	a2,8(a5)
ffffffffc0201850:	bf45                	j	ffffffffc0201800 <slob_free+0xc4>

ffffffffc0201852 <__slob_get_free_pages.isra.0>:
ffffffffc0201852:	4785                	li	a5,1
ffffffffc0201854:	1141                	addi	sp,sp,-16
ffffffffc0201856:	00a7953b          	sllw	a0,a5,a0
ffffffffc020185a:	e406                	sd	ra,8(sp)
ffffffffc020185c:	71a010ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0201860:	cd1d                	beqz	a0,ffffffffc020189e <__slob_get_free_pages.isra.0+0x4c>
ffffffffc0201862:	00014797          	auipc	a5,0x14
ffffffffc0201866:	d8678793          	addi	a5,a5,-634 # ffffffffc02155e8 <pages>
ffffffffc020186a:	6394                	ld	a3,0(a5)
ffffffffc020186c:	00005797          	auipc	a5,0x5
ffffffffc0201870:	40c78793          	addi	a5,a5,1036 # ffffffffc0206c78 <nbase>
ffffffffc0201874:	8d15                	sub	a0,a0,a3
ffffffffc0201876:	6394                	ld	a3,0(a5)
ffffffffc0201878:	8519                	srai	a0,a0,0x6
ffffffffc020187a:	00014797          	auipc	a5,0x14
ffffffffc020187e:	c2e78793          	addi	a5,a5,-978 # ffffffffc02154a8 <npage>
ffffffffc0201882:	9536                	add	a0,a0,a3
ffffffffc0201884:	6398                	ld	a4,0(a5)
ffffffffc0201886:	00c51793          	slli	a5,a0,0xc
ffffffffc020188a:	83b1                	srli	a5,a5,0xc
ffffffffc020188c:	0532                	slli	a0,a0,0xc
ffffffffc020188e:	00e7fb63          	bgeu	a5,a4,ffffffffc02018a4 <__slob_get_free_pages.isra.0+0x52>
ffffffffc0201892:	00014797          	auipc	a5,0x14
ffffffffc0201896:	d4678793          	addi	a5,a5,-698 # ffffffffc02155d8 <va_pa_offset>
ffffffffc020189a:	6394                	ld	a3,0(a5)
ffffffffc020189c:	9536                	add	a0,a0,a3
ffffffffc020189e:	60a2                	ld	ra,8(sp)
ffffffffc02018a0:	0141                	addi	sp,sp,16
ffffffffc02018a2:	8082                	ret
ffffffffc02018a4:	86aa                	mv	a3,a0
ffffffffc02018a6:	00004617          	auipc	a2,0x4
ffffffffc02018aa:	27a60613          	addi	a2,a2,634 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc02018ae:	06900593          	li	a1,105
ffffffffc02018b2:	00004517          	auipc	a0,0x4
ffffffffc02018b6:	00e50513          	addi	a0,a0,14 # ffffffffc02058c0 <commands+0xb90>
ffffffffc02018ba:	933fe0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc02018be <slob_alloc.isra.1.constprop.3>:
ffffffffc02018be:	1101                	addi	sp,sp,-32
ffffffffc02018c0:	ec06                	sd	ra,24(sp)
ffffffffc02018c2:	e822                	sd	s0,16(sp)
ffffffffc02018c4:	e426                	sd	s1,8(sp)
ffffffffc02018c6:	e04a                	sd	s2,0(sp)
ffffffffc02018c8:	01050713          	addi	a4,a0,16
ffffffffc02018cc:	6785                	lui	a5,0x1
ffffffffc02018ce:	0cf77563          	bgeu	a4,a5,ffffffffc0201998 <slob_alloc.isra.1.constprop.3+0xda>
ffffffffc02018d2:	00f50493          	addi	s1,a0,15
ffffffffc02018d6:	8091                	srli	s1,s1,0x4
ffffffffc02018d8:	2481                	sext.w	s1,s1
ffffffffc02018da:	10002673          	csrr	a2,sstatus
ffffffffc02018de:	8a09                	andi	a2,a2,2
ffffffffc02018e0:	e64d                	bnez	a2,ffffffffc020198a <slob_alloc.isra.1.constprop.3+0xcc>
ffffffffc02018e2:	00008917          	auipc	s2,0x8
ffffffffc02018e6:	76e90913          	addi	s2,s2,1902 # ffffffffc020a050 <slobfree>
ffffffffc02018ea:	00093683          	ld	a3,0(s2)
ffffffffc02018ee:	669c                	ld	a5,8(a3)
ffffffffc02018f0:	4398                	lw	a4,0(a5)
ffffffffc02018f2:	0a975063          	bge	a4,s1,ffffffffc0201992 <slob_alloc.isra.1.constprop.3+0xd4>
ffffffffc02018f6:	00d78b63          	beq	a5,a3,ffffffffc020190c <slob_alloc.isra.1.constprop.3+0x4e>
ffffffffc02018fa:	6780                	ld	s0,8(a5)
ffffffffc02018fc:	4018                	lw	a4,0(s0)
ffffffffc02018fe:	02975a63          	bge	a4,s1,ffffffffc0201932 <slob_alloc.isra.1.constprop.3+0x74>
ffffffffc0201902:	00093683          	ld	a3,0(s2)
ffffffffc0201906:	87a2                	mv	a5,s0
ffffffffc0201908:	fed799e3          	bne	a5,a3,ffffffffc02018fa <slob_alloc.isra.1.constprop.3+0x3c>
ffffffffc020190c:	e225                	bnez	a2,ffffffffc020196c <slob_alloc.isra.1.constprop.3+0xae>
ffffffffc020190e:	4501                	li	a0,0
ffffffffc0201910:	f43ff0ef          	jal	ra,ffffffffc0201852 <__slob_get_free_pages.isra.0>
ffffffffc0201914:	842a                	mv	s0,a0
ffffffffc0201916:	cd15                	beqz	a0,ffffffffc0201952 <slob_alloc.isra.1.constprop.3+0x94>
ffffffffc0201918:	6585                	lui	a1,0x1
ffffffffc020191a:	e23ff0ef          	jal	ra,ffffffffc020173c <slob_free>
ffffffffc020191e:	10002673          	csrr	a2,sstatus
ffffffffc0201922:	8a09                	andi	a2,a2,2
ffffffffc0201924:	ee15                	bnez	a2,ffffffffc0201960 <slob_alloc.isra.1.constprop.3+0xa2>
ffffffffc0201926:	00093783          	ld	a5,0(s2)
ffffffffc020192a:	6780                	ld	s0,8(a5)
ffffffffc020192c:	4018                	lw	a4,0(s0)
ffffffffc020192e:	fc974ae3          	blt	a4,s1,ffffffffc0201902 <slob_alloc.isra.1.constprop.3+0x44>
ffffffffc0201932:	04e48963          	beq	s1,a4,ffffffffc0201984 <slob_alloc.isra.1.constprop.3+0xc6>
ffffffffc0201936:	00449693          	slli	a3,s1,0x4
ffffffffc020193a:	96a2                	add	a3,a3,s0
ffffffffc020193c:	e794                	sd	a3,8(a5)
ffffffffc020193e:	640c                	ld	a1,8(s0)
ffffffffc0201940:	9f05                	subw	a4,a4,s1
ffffffffc0201942:	c298                	sw	a4,0(a3)
ffffffffc0201944:	e68c                	sd	a1,8(a3)
ffffffffc0201946:	c004                	sw	s1,0(s0)
ffffffffc0201948:	00008717          	auipc	a4,0x8
ffffffffc020194c:	70f73423          	sd	a5,1800(a4) # ffffffffc020a050 <slobfree>
ffffffffc0201950:	e20d                	bnez	a2,ffffffffc0201972 <slob_alloc.isra.1.constprop.3+0xb4>
ffffffffc0201952:	8522                	mv	a0,s0
ffffffffc0201954:	60e2                	ld	ra,24(sp)
ffffffffc0201956:	6442                	ld	s0,16(sp)
ffffffffc0201958:	64a2                	ld	s1,8(sp)
ffffffffc020195a:	6902                	ld	s2,0(sp)
ffffffffc020195c:	6105                	addi	sp,sp,32
ffffffffc020195e:	8082                	ret
ffffffffc0201960:	c8bfe0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0201964:	4605                	li	a2,1
ffffffffc0201966:	00093783          	ld	a5,0(s2)
ffffffffc020196a:	b7c1                	j	ffffffffc020192a <slob_alloc.isra.1.constprop.3+0x6c>
ffffffffc020196c:	c79fe0ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc0201970:	bf79                	j	ffffffffc020190e <slob_alloc.isra.1.constprop.3+0x50>
ffffffffc0201972:	c73fe0ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc0201976:	8522                	mv	a0,s0
ffffffffc0201978:	60e2                	ld	ra,24(sp)
ffffffffc020197a:	6442                	ld	s0,16(sp)
ffffffffc020197c:	64a2                	ld	s1,8(sp)
ffffffffc020197e:	6902                	ld	s2,0(sp)
ffffffffc0201980:	6105                	addi	sp,sp,32
ffffffffc0201982:	8082                	ret
ffffffffc0201984:	6418                	ld	a4,8(s0)
ffffffffc0201986:	e798                	sd	a4,8(a5)
ffffffffc0201988:	b7c1                	j	ffffffffc0201948 <slob_alloc.isra.1.constprop.3+0x8a>
ffffffffc020198a:	c61fe0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc020198e:	4605                	li	a2,1
ffffffffc0201990:	bf89                	j	ffffffffc02018e2 <slob_alloc.isra.1.constprop.3+0x24>
ffffffffc0201992:	843e                	mv	s0,a5
ffffffffc0201994:	87b6                	mv	a5,a3
ffffffffc0201996:	bf71                	j	ffffffffc0201932 <slob_alloc.isra.1.constprop.3+0x74>
ffffffffc0201998:	00004697          	auipc	a3,0x4
ffffffffc020199c:	1f868693          	addi	a3,a3,504 # ffffffffc0205b90 <commands+0xe60>
ffffffffc02019a0:	00004617          	auipc	a2,0x4
ffffffffc02019a4:	bf060613          	addi	a2,a2,-1040 # ffffffffc0205590 <commands+0x860>
ffffffffc02019a8:	06300593          	li	a1,99
ffffffffc02019ac:	00004517          	auipc	a0,0x4
ffffffffc02019b0:	20450513          	addi	a0,a0,516 # ffffffffc0205bb0 <commands+0xe80>
ffffffffc02019b4:	839fe0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc02019b8 <kmalloc_init>:
ffffffffc02019b8:	1141                	addi	sp,sp,-16
ffffffffc02019ba:	00004517          	auipc	a0,0x4
ffffffffc02019be:	20e50513          	addi	a0,a0,526 # ffffffffc0205bc8 <commands+0xe98>
ffffffffc02019c2:	e406                	sd	ra,8(sp)
ffffffffc02019c4:	f24fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02019c8:	60a2                	ld	ra,8(sp)
ffffffffc02019ca:	00004517          	auipc	a0,0x4
ffffffffc02019ce:	1a650513          	addi	a0,a0,422 # ffffffffc0205b70 <commands+0xe40>
ffffffffc02019d2:	0141                	addi	sp,sp,16
ffffffffc02019d4:	f14fe06f          	j	ffffffffc02000e8 <cprintf>

ffffffffc02019d8 <kmalloc>:
ffffffffc02019d8:	1101                	addi	sp,sp,-32
ffffffffc02019da:	e04a                	sd	s2,0(sp)
ffffffffc02019dc:	6905                	lui	s2,0x1
ffffffffc02019de:	e822                	sd	s0,16(sp)
ffffffffc02019e0:	ec06                	sd	ra,24(sp)
ffffffffc02019e2:	e426                	sd	s1,8(sp)
ffffffffc02019e4:	fef90793          	addi	a5,s2,-17 # fef <BASE_ADDRESS-0xffffffffc01ff011>
ffffffffc02019e8:	842a                	mv	s0,a0
ffffffffc02019ea:	04a7fc63          	bgeu	a5,a0,ffffffffc0201a42 <kmalloc+0x6a>
ffffffffc02019ee:	4561                	li	a0,24
ffffffffc02019f0:	ecfff0ef          	jal	ra,ffffffffc02018be <slob_alloc.isra.1.constprop.3>
ffffffffc02019f4:	84aa                	mv	s1,a0
ffffffffc02019f6:	cd21                	beqz	a0,ffffffffc0201a4e <kmalloc+0x76>
ffffffffc02019f8:	0004079b          	sext.w	a5,s0
ffffffffc02019fc:	4501                	li	a0,0
ffffffffc02019fe:	00f95763          	bge	s2,a5,ffffffffc0201a0c <kmalloc+0x34>
ffffffffc0201a02:	6705                	lui	a4,0x1
ffffffffc0201a04:	8785                	srai	a5,a5,0x1
ffffffffc0201a06:	2505                	addiw	a0,a0,1
ffffffffc0201a08:	fef74ee3          	blt	a4,a5,ffffffffc0201a04 <kmalloc+0x2c>
ffffffffc0201a0c:	c088                	sw	a0,0(s1)
ffffffffc0201a0e:	e45ff0ef          	jal	ra,ffffffffc0201852 <__slob_get_free_pages.isra.0>
ffffffffc0201a12:	e488                	sd	a0,8(s1)
ffffffffc0201a14:	842a                	mv	s0,a0
ffffffffc0201a16:	c935                	beqz	a0,ffffffffc0201a8a <kmalloc+0xb2>
ffffffffc0201a18:	100027f3          	csrr	a5,sstatus
ffffffffc0201a1c:	8b89                	andi	a5,a5,2
ffffffffc0201a1e:	e3a1                	bnez	a5,ffffffffc0201a5e <kmalloc+0x86>
ffffffffc0201a20:	00014797          	auipc	a5,0x14
ffffffffc0201a24:	a6878793          	addi	a5,a5,-1432 # ffffffffc0215488 <bigblocks>
ffffffffc0201a28:	639c                	ld	a5,0(a5)
ffffffffc0201a2a:	00014717          	auipc	a4,0x14
ffffffffc0201a2e:	a4973f23          	sd	s1,-1442(a4) # ffffffffc0215488 <bigblocks>
ffffffffc0201a32:	e89c                	sd	a5,16(s1)
ffffffffc0201a34:	8522                	mv	a0,s0
ffffffffc0201a36:	60e2                	ld	ra,24(sp)
ffffffffc0201a38:	6442                	ld	s0,16(sp)
ffffffffc0201a3a:	64a2                	ld	s1,8(sp)
ffffffffc0201a3c:	6902                	ld	s2,0(sp)
ffffffffc0201a3e:	6105                	addi	sp,sp,32
ffffffffc0201a40:	8082                	ret
ffffffffc0201a42:	0541                	addi	a0,a0,16
ffffffffc0201a44:	e7bff0ef          	jal	ra,ffffffffc02018be <slob_alloc.isra.1.constprop.3>
ffffffffc0201a48:	01050413          	addi	s0,a0,16
ffffffffc0201a4c:	f565                	bnez	a0,ffffffffc0201a34 <kmalloc+0x5c>
ffffffffc0201a4e:	4401                	li	s0,0
ffffffffc0201a50:	8522                	mv	a0,s0
ffffffffc0201a52:	60e2                	ld	ra,24(sp)
ffffffffc0201a54:	6442                	ld	s0,16(sp)
ffffffffc0201a56:	64a2                	ld	s1,8(sp)
ffffffffc0201a58:	6902                	ld	s2,0(sp)
ffffffffc0201a5a:	6105                	addi	sp,sp,32
ffffffffc0201a5c:	8082                	ret
ffffffffc0201a5e:	b8dfe0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0201a62:	00014797          	auipc	a5,0x14
ffffffffc0201a66:	a2678793          	addi	a5,a5,-1498 # ffffffffc0215488 <bigblocks>
ffffffffc0201a6a:	639c                	ld	a5,0(a5)
ffffffffc0201a6c:	00014717          	auipc	a4,0x14
ffffffffc0201a70:	a0973e23          	sd	s1,-1508(a4) # ffffffffc0215488 <bigblocks>
ffffffffc0201a74:	e89c                	sd	a5,16(s1)
ffffffffc0201a76:	b6ffe0ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc0201a7a:	6480                	ld	s0,8(s1)
ffffffffc0201a7c:	60e2                	ld	ra,24(sp)
ffffffffc0201a7e:	64a2                	ld	s1,8(sp)
ffffffffc0201a80:	8522                	mv	a0,s0
ffffffffc0201a82:	6442                	ld	s0,16(sp)
ffffffffc0201a84:	6902                	ld	s2,0(sp)
ffffffffc0201a86:	6105                	addi	sp,sp,32
ffffffffc0201a88:	8082                	ret
ffffffffc0201a8a:	45e1                	li	a1,24
ffffffffc0201a8c:	8526                	mv	a0,s1
ffffffffc0201a8e:	cafff0ef          	jal	ra,ffffffffc020173c <slob_free>
ffffffffc0201a92:	b74d                	j	ffffffffc0201a34 <kmalloc+0x5c>

ffffffffc0201a94 <kfree>:
ffffffffc0201a94:	c165                	beqz	a0,ffffffffc0201b74 <kfree+0xe0>
ffffffffc0201a96:	1101                	addi	sp,sp,-32
ffffffffc0201a98:	e426                	sd	s1,8(sp)
ffffffffc0201a9a:	ec06                	sd	ra,24(sp)
ffffffffc0201a9c:	e822                	sd	s0,16(sp)
ffffffffc0201a9e:	03451793          	slli	a5,a0,0x34
ffffffffc0201aa2:	84aa                	mv	s1,a0
ffffffffc0201aa4:	eb8d                	bnez	a5,ffffffffc0201ad6 <kfree+0x42>
ffffffffc0201aa6:	100027f3          	csrr	a5,sstatus
ffffffffc0201aaa:	8b89                	andi	a5,a5,2
ffffffffc0201aac:	ebd9                	bnez	a5,ffffffffc0201b42 <kfree+0xae>
ffffffffc0201aae:	00014797          	auipc	a5,0x14
ffffffffc0201ab2:	9da78793          	addi	a5,a5,-1574 # ffffffffc0215488 <bigblocks>
ffffffffc0201ab6:	6394                	ld	a3,0(a5)
ffffffffc0201ab8:	ce99                	beqz	a3,ffffffffc0201ad6 <kfree+0x42>
ffffffffc0201aba:	669c                	ld	a5,8(a3)
ffffffffc0201abc:	6a80                	ld	s0,16(a3)
ffffffffc0201abe:	0af50c63          	beq	a0,a5,ffffffffc0201b76 <kfree+0xe2>
ffffffffc0201ac2:	4601                	li	a2,0
ffffffffc0201ac4:	c801                	beqz	s0,ffffffffc0201ad4 <kfree+0x40>
ffffffffc0201ac6:	6418                	ld	a4,8(s0)
ffffffffc0201ac8:	681c                	ld	a5,16(s0)
ffffffffc0201aca:	00970e63          	beq	a4,s1,ffffffffc0201ae6 <kfree+0x52>
ffffffffc0201ace:	86a2                	mv	a3,s0
ffffffffc0201ad0:	843e                	mv	s0,a5
ffffffffc0201ad2:	f875                	bnez	s0,ffffffffc0201ac6 <kfree+0x32>
ffffffffc0201ad4:	e649                	bnez	a2,ffffffffc0201b5e <kfree+0xca>
ffffffffc0201ad6:	6442                	ld	s0,16(sp)
ffffffffc0201ad8:	60e2                	ld	ra,24(sp)
ffffffffc0201ada:	ff048513          	addi	a0,s1,-16
ffffffffc0201ade:	64a2                	ld	s1,8(sp)
ffffffffc0201ae0:	4581                	li	a1,0
ffffffffc0201ae2:	6105                	addi	sp,sp,32
ffffffffc0201ae4:	b9a1                	j	ffffffffc020173c <slob_free>
ffffffffc0201ae6:	ea9c                	sd	a5,16(a3)
ffffffffc0201ae8:	e259                	bnez	a2,ffffffffc0201b6e <kfree+0xda>
ffffffffc0201aea:	c02007b7          	lui	a5,0xc0200
ffffffffc0201aee:	4018                	lw	a4,0(s0)
ffffffffc0201af0:	08f4e963          	bltu	s1,a5,ffffffffc0201b82 <kfree+0xee>
ffffffffc0201af4:	00014797          	auipc	a5,0x14
ffffffffc0201af8:	ae478793          	addi	a5,a5,-1308 # ffffffffc02155d8 <va_pa_offset>
ffffffffc0201afc:	6394                	ld	a3,0(a5)
ffffffffc0201afe:	00014797          	auipc	a5,0x14
ffffffffc0201b02:	9aa78793          	addi	a5,a5,-1622 # ffffffffc02154a8 <npage>
ffffffffc0201b06:	639c                	ld	a5,0(a5)
ffffffffc0201b08:	8c95                	sub	s1,s1,a3
ffffffffc0201b0a:	80b1                	srli	s1,s1,0xc
ffffffffc0201b0c:	08f4f863          	bgeu	s1,a5,ffffffffc0201b9c <kfree+0x108>
ffffffffc0201b10:	00005797          	auipc	a5,0x5
ffffffffc0201b14:	16878793          	addi	a5,a5,360 # ffffffffc0206c78 <nbase>
ffffffffc0201b18:	639c                	ld	a5,0(a5)
ffffffffc0201b1a:	00014697          	auipc	a3,0x14
ffffffffc0201b1e:	ace68693          	addi	a3,a3,-1330 # ffffffffc02155e8 <pages>
ffffffffc0201b22:	6288                	ld	a0,0(a3)
ffffffffc0201b24:	8c9d                	sub	s1,s1,a5
ffffffffc0201b26:	049a                	slli	s1,s1,0x6
ffffffffc0201b28:	4585                	li	a1,1
ffffffffc0201b2a:	9526                	add	a0,a0,s1
ffffffffc0201b2c:	00e595bb          	sllw	a1,a1,a4
ffffffffc0201b30:	4ce010ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0201b34:	8522                	mv	a0,s0
ffffffffc0201b36:	6442                	ld	s0,16(sp)
ffffffffc0201b38:	60e2                	ld	ra,24(sp)
ffffffffc0201b3a:	64a2                	ld	s1,8(sp)
ffffffffc0201b3c:	45e1                	li	a1,24
ffffffffc0201b3e:	6105                	addi	sp,sp,32
ffffffffc0201b40:	bef5                	j	ffffffffc020173c <slob_free>
ffffffffc0201b42:	aa9fe0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0201b46:	00014797          	auipc	a5,0x14
ffffffffc0201b4a:	94278793          	addi	a5,a5,-1726 # ffffffffc0215488 <bigblocks>
ffffffffc0201b4e:	6394                	ld	a3,0(a5)
ffffffffc0201b50:	c699                	beqz	a3,ffffffffc0201b5e <kfree+0xca>
ffffffffc0201b52:	669c                	ld	a5,8(a3)
ffffffffc0201b54:	6a80                	ld	s0,16(a3)
ffffffffc0201b56:	00f48763          	beq	s1,a5,ffffffffc0201b64 <kfree+0xd0>
ffffffffc0201b5a:	4605                	li	a2,1
ffffffffc0201b5c:	b7a5                	j	ffffffffc0201ac4 <kfree+0x30>
ffffffffc0201b5e:	a87fe0ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc0201b62:	bf95                	j	ffffffffc0201ad6 <kfree+0x42>
ffffffffc0201b64:	00014797          	auipc	a5,0x14
ffffffffc0201b68:	9287b223          	sd	s0,-1756(a5) # ffffffffc0215488 <bigblocks>
ffffffffc0201b6c:	8436                	mv	s0,a3
ffffffffc0201b6e:	a77fe0ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc0201b72:	bfa5                	j	ffffffffc0201aea <kfree+0x56>
ffffffffc0201b74:	8082                	ret
ffffffffc0201b76:	00014797          	auipc	a5,0x14
ffffffffc0201b7a:	9087b923          	sd	s0,-1774(a5) # ffffffffc0215488 <bigblocks>
ffffffffc0201b7e:	8436                	mv	s0,a3
ffffffffc0201b80:	b7ad                	j	ffffffffc0201aea <kfree+0x56>
ffffffffc0201b82:	86a6                	mv	a3,s1
ffffffffc0201b84:	00004617          	auipc	a2,0x4
ffffffffc0201b88:	fc460613          	addi	a2,a2,-60 # ffffffffc0205b48 <commands+0xe18>
ffffffffc0201b8c:	06e00593          	li	a1,110
ffffffffc0201b90:	00004517          	auipc	a0,0x4
ffffffffc0201b94:	d3050513          	addi	a0,a0,-720 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0201b98:	e54fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201b9c:	00004617          	auipc	a2,0x4
ffffffffc0201ba0:	d0460613          	addi	a2,a2,-764 # ffffffffc02058a0 <commands+0xb70>
ffffffffc0201ba4:	06200593          	li	a1,98
ffffffffc0201ba8:	00004517          	auipc	a0,0x4
ffffffffc0201bac:	d1850513          	addi	a0,a0,-744 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0201bb0:	e3cfe0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0201bb4 <swap_init>:
ffffffffc0201bb4:	7135                	addi	sp,sp,-160
ffffffffc0201bb6:	ed06                	sd	ra,152(sp)
ffffffffc0201bb8:	e922                	sd	s0,144(sp)
ffffffffc0201bba:	e526                	sd	s1,136(sp)
ffffffffc0201bbc:	e14a                	sd	s2,128(sp)
ffffffffc0201bbe:	fcce                	sd	s3,120(sp)
ffffffffc0201bc0:	f8d2                	sd	s4,112(sp)
ffffffffc0201bc2:	f4d6                	sd	s5,104(sp)
ffffffffc0201bc4:	f0da                	sd	s6,96(sp)
ffffffffc0201bc6:	ecde                	sd	s7,88(sp)
ffffffffc0201bc8:	e8e2                	sd	s8,80(sp)
ffffffffc0201bca:	e4e6                	sd	s9,72(sp)
ffffffffc0201bcc:	e0ea                	sd	s10,64(sp)
ffffffffc0201bce:	fc6e                	sd	s11,56(sp)
ffffffffc0201bd0:	218020ef          	jal	ra,ffffffffc0203de8 <swapfs_init>
ffffffffc0201bd4:	00014797          	auipc	a5,0x14
ffffffffc0201bd8:	9a478793          	addi	a5,a5,-1628 # ffffffffc0215578 <max_swap_offset>
ffffffffc0201bdc:	6394                	ld	a3,0(a5)
ffffffffc0201bde:	010007b7          	lui	a5,0x1000
ffffffffc0201be2:	17e1                	addi	a5,a5,-8
ffffffffc0201be4:	ff968713          	addi	a4,a3,-7
ffffffffc0201be8:	42e7ef63          	bltu	a5,a4,ffffffffc0202026 <swap_init+0x472>
ffffffffc0201bec:	00008797          	auipc	a5,0x8
ffffffffc0201bf0:	41478793          	addi	a5,a5,1044 # ffffffffc020a000 <swap_manager_fifo>
ffffffffc0201bf4:	6798                	ld	a4,8(a5)
ffffffffc0201bf6:	00014697          	auipc	a3,0x14
ffffffffc0201bfa:	88f6bd23          	sd	a5,-1894(a3) # ffffffffc0215490 <sm>
ffffffffc0201bfe:	9702                	jalr	a4
ffffffffc0201c00:	8aaa                	mv	s5,a0
ffffffffc0201c02:	85aa                	mv	a1,a0
ffffffffc0201c04:	00004517          	auipc	a0,0x4
ffffffffc0201c08:	05c50513          	addi	a0,a0,92 # ffffffffc0205c60 <commands+0xf30>
ffffffffc0201c0c:	cdcfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201c10:	020a8263          	beqz	s5,ffffffffc0201c34 <swap_init+0x80>
ffffffffc0201c14:	60ea                	ld	ra,152(sp)
ffffffffc0201c16:	644a                	ld	s0,144(sp)
ffffffffc0201c18:	8556                	mv	a0,s5
ffffffffc0201c1a:	64aa                	ld	s1,136(sp)
ffffffffc0201c1c:	690a                	ld	s2,128(sp)
ffffffffc0201c1e:	79e6                	ld	s3,120(sp)
ffffffffc0201c20:	7a46                	ld	s4,112(sp)
ffffffffc0201c22:	7aa6                	ld	s5,104(sp)
ffffffffc0201c24:	7b06                	ld	s6,96(sp)
ffffffffc0201c26:	6be6                	ld	s7,88(sp)
ffffffffc0201c28:	6c46                	ld	s8,80(sp)
ffffffffc0201c2a:	6ca6                	ld	s9,72(sp)
ffffffffc0201c2c:	6d06                	ld	s10,64(sp)
ffffffffc0201c2e:	7de2                	ld	s11,56(sp)
ffffffffc0201c30:	610d                	addi	sp,sp,160
ffffffffc0201c32:	8082                	ret
ffffffffc0201c34:	00014797          	auipc	a5,0x14
ffffffffc0201c38:	85c78793          	addi	a5,a5,-1956 # ffffffffc0215490 <sm>
ffffffffc0201c3c:	639c                	ld	a5,0(a5)
ffffffffc0201c3e:	00004517          	auipc	a0,0x4
ffffffffc0201c42:	03a50513          	addi	a0,a0,58 # ffffffffc0205c78 <commands+0xf48>
ffffffffc0201c46:	00014417          	auipc	s0,0x14
ffffffffc0201c4a:	97240413          	addi	s0,s0,-1678 # ffffffffc02155b8 <free_area>
ffffffffc0201c4e:	638c                	ld	a1,0(a5)
ffffffffc0201c50:	4785                	li	a5,1
ffffffffc0201c52:	00014717          	auipc	a4,0x14
ffffffffc0201c56:	84f72323          	sw	a5,-1978(a4) # ffffffffc0215498 <swap_init_ok>
ffffffffc0201c5a:	c8efe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201c5e:	641c                	ld	a5,8(s0)
ffffffffc0201c60:	2e878763          	beq	a5,s0,ffffffffc0201f4e <swap_init+0x39a>
ffffffffc0201c64:	ff07b703          	ld	a4,-16(a5)
ffffffffc0201c68:	8305                	srli	a4,a4,0x1
ffffffffc0201c6a:	8b05                	andi	a4,a4,1
ffffffffc0201c6c:	2e070563          	beqz	a4,ffffffffc0201f56 <swap_init+0x3a2>
ffffffffc0201c70:	4481                	li	s1,0
ffffffffc0201c72:	4901                	li	s2,0
ffffffffc0201c74:	a031                	j	ffffffffc0201c80 <swap_init+0xcc>
ffffffffc0201c76:	ff07b703          	ld	a4,-16(a5)
ffffffffc0201c7a:	8b09                	andi	a4,a4,2
ffffffffc0201c7c:	2c070d63          	beqz	a4,ffffffffc0201f56 <swap_init+0x3a2>
ffffffffc0201c80:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201c84:	679c                	ld	a5,8(a5)
ffffffffc0201c86:	2905                	addiw	s2,s2,1
ffffffffc0201c88:	9cb9                	addw	s1,s1,a4
ffffffffc0201c8a:	fe8796e3          	bne	a5,s0,ffffffffc0201c76 <swap_init+0xc2>
ffffffffc0201c8e:	89a6                	mv	s3,s1
ffffffffc0201c90:	3b4010ef          	jal	ra,ffffffffc0203044 <nr_free_pages>
ffffffffc0201c94:	5b351563          	bne	a0,s3,ffffffffc020223e <swap_init+0x68a>
ffffffffc0201c98:	8626                	mv	a2,s1
ffffffffc0201c9a:	85ca                	mv	a1,s2
ffffffffc0201c9c:	00004517          	auipc	a0,0x4
ffffffffc0201ca0:	02450513          	addi	a0,a0,36 # ffffffffc0205cc0 <commands+0xf90>
ffffffffc0201ca4:	c44fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201ca8:	f1ffe0ef          	jal	ra,ffffffffc0200bc6 <mm_create>
ffffffffc0201cac:	8baa                	mv	s7,a0
ffffffffc0201cae:	50050863          	beqz	a0,ffffffffc02021be <swap_init+0x60a>
ffffffffc0201cb2:	00014797          	auipc	a5,0x14
ffffffffc0201cb6:	82678793          	addi	a5,a5,-2010 # ffffffffc02154d8 <check_mm_struct>
ffffffffc0201cba:	639c                	ld	a5,0(a5)
ffffffffc0201cbc:	52079163          	bnez	a5,ffffffffc02021de <swap_init+0x62a>
ffffffffc0201cc0:	00013797          	auipc	a5,0x13
ffffffffc0201cc4:	7e078793          	addi	a5,a5,2016 # ffffffffc02154a0 <boot_pgdir>
ffffffffc0201cc8:	6398                	ld	a4,0(a5)
ffffffffc0201cca:	00014797          	auipc	a5,0x14
ffffffffc0201cce:	80a7b723          	sd	a0,-2034(a5) # ffffffffc02154d8 <check_mm_struct>
ffffffffc0201cd2:	631c                	ld	a5,0(a4)
ffffffffc0201cd4:	ec3a                	sd	a4,24(sp)
ffffffffc0201cd6:	ed18                	sd	a4,24(a0)
ffffffffc0201cd8:	52079363          	bnez	a5,ffffffffc02021fe <swap_init+0x64a>
ffffffffc0201cdc:	6599                	lui	a1,0x6
ffffffffc0201cde:	460d                	li	a2,3
ffffffffc0201ce0:	6505                	lui	a0,0x1
ffffffffc0201ce2:	f31fe0ef          	jal	ra,ffffffffc0200c12 <vma_create>
ffffffffc0201ce6:	85aa                	mv	a1,a0
ffffffffc0201ce8:	52050b63          	beqz	a0,ffffffffc020221e <swap_init+0x66a>
ffffffffc0201cec:	855e                	mv	a0,s7
ffffffffc0201cee:	f91fe0ef          	jal	ra,ffffffffc0200c7e <insert_vma_struct>
ffffffffc0201cf2:	00004517          	auipc	a0,0x4
ffffffffc0201cf6:	00e50513          	addi	a0,a0,14 # ffffffffc0205d00 <commands+0xfd0>
ffffffffc0201cfa:	beefe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201cfe:	018bb503          	ld	a0,24(s7)
ffffffffc0201d02:	4605                	li	a2,1
ffffffffc0201d04:	6585                	lui	a1,0x1
ffffffffc0201d06:	37e010ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc0201d0a:	40050a63          	beqz	a0,ffffffffc020211e <swap_init+0x56a>
ffffffffc0201d0e:	00004517          	auipc	a0,0x4
ffffffffc0201d12:	04250513          	addi	a0,a0,66 # ffffffffc0205d50 <commands+0x1020>
ffffffffc0201d16:	00013a17          	auipc	s4,0x13
ffffffffc0201d1a:	7daa0a13          	addi	s4,s4,2010 # ffffffffc02154f0 <check_rp>
ffffffffc0201d1e:	bcafe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201d22:	00013b17          	auipc	s6,0x13
ffffffffc0201d26:	7eeb0b13          	addi	s6,s6,2030 # ffffffffc0215510 <swap_in_seq_no>
ffffffffc0201d2a:	89d2                	mv	s3,s4
ffffffffc0201d2c:	4505                	li	a0,1
ffffffffc0201d2e:	248010ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0201d32:	00a9b023          	sd	a0,0(s3)
ffffffffc0201d36:	2a050863          	beqz	a0,ffffffffc0201fe6 <swap_init+0x432>
ffffffffc0201d3a:	651c                	ld	a5,8(a0)
ffffffffc0201d3c:	8b89                	andi	a5,a5,2
ffffffffc0201d3e:	28079463          	bnez	a5,ffffffffc0201fc6 <swap_init+0x412>
ffffffffc0201d42:	09a1                	addi	s3,s3,8
ffffffffc0201d44:	ff6994e3          	bne	s3,s6,ffffffffc0201d2c <swap_init+0x178>
ffffffffc0201d48:	601c                	ld	a5,0(s0)
ffffffffc0201d4a:	00843983          	ld	s3,8(s0)
ffffffffc0201d4e:	00013d17          	auipc	s10,0x13
ffffffffc0201d52:	7a2d0d13          	addi	s10,s10,1954 # ffffffffc02154f0 <check_rp>
ffffffffc0201d56:	f03e                	sd	a5,32(sp)
ffffffffc0201d58:	481c                	lw	a5,16(s0)
ffffffffc0201d5a:	f43e                	sd	a5,40(sp)
ffffffffc0201d5c:	00014797          	auipc	a5,0x14
ffffffffc0201d60:	8687b223          	sd	s0,-1948(a5) # ffffffffc02155c0 <free_area+0x8>
ffffffffc0201d64:	00014797          	auipc	a5,0x14
ffffffffc0201d68:	8487ba23          	sd	s0,-1964(a5) # ffffffffc02155b8 <free_area>
ffffffffc0201d6c:	00014797          	auipc	a5,0x14
ffffffffc0201d70:	8407ae23          	sw	zero,-1956(a5) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0201d74:	000d3503          	ld	a0,0(s10)
ffffffffc0201d78:	4585                	li	a1,1
ffffffffc0201d7a:	0d21                	addi	s10,s10,8
ffffffffc0201d7c:	282010ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0201d80:	ff6d1ae3          	bne	s10,s6,ffffffffc0201d74 <swap_init+0x1c0>
ffffffffc0201d84:	01042d03          	lw	s10,16(s0)
ffffffffc0201d88:	4791                	li	a5,4
ffffffffc0201d8a:	36fd1a63          	bne	s10,a5,ffffffffc02020fe <swap_init+0x54a>
ffffffffc0201d8e:	00004517          	auipc	a0,0x4
ffffffffc0201d92:	04a50513          	addi	a0,a0,74 # ffffffffc0205dd8 <commands+0x10a8>
ffffffffc0201d96:	b52fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201d9a:	6685                	lui	a3,0x1
ffffffffc0201d9c:	00013797          	auipc	a5,0x13
ffffffffc0201da0:	6e07a223          	sw	zero,1764(a5) # ffffffffc0215480 <pgfault_num>
ffffffffc0201da4:	4629                	li	a2,10
ffffffffc0201da6:	00013797          	auipc	a5,0x13
ffffffffc0201daa:	6da78793          	addi	a5,a5,1754 # ffffffffc0215480 <pgfault_num>
ffffffffc0201dae:	00c68023          	sb	a2,0(a3) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc0201db2:	4398                	lw	a4,0(a5)
ffffffffc0201db4:	4585                	li	a1,1
ffffffffc0201db6:	2701                	sext.w	a4,a4
ffffffffc0201db8:	30b71363          	bne	a4,a1,ffffffffc02020be <swap_init+0x50a>
ffffffffc0201dbc:	00c68823          	sb	a2,16(a3)
ffffffffc0201dc0:	4394                	lw	a3,0(a5)
ffffffffc0201dc2:	2681                	sext.w	a3,a3
ffffffffc0201dc4:	30e69d63          	bne	a3,a4,ffffffffc02020de <swap_init+0x52a>
ffffffffc0201dc8:	6689                	lui	a3,0x2
ffffffffc0201dca:	462d                	li	a2,11
ffffffffc0201dcc:	00c68023          	sb	a2,0(a3) # 2000 <BASE_ADDRESS-0xffffffffc01fe000>
ffffffffc0201dd0:	4398                	lw	a4,0(a5)
ffffffffc0201dd2:	4589                	li	a1,2
ffffffffc0201dd4:	2701                	sext.w	a4,a4
ffffffffc0201dd6:	26b71463          	bne	a4,a1,ffffffffc020203e <swap_init+0x48a>
ffffffffc0201dda:	00c68823          	sb	a2,16(a3)
ffffffffc0201dde:	4394                	lw	a3,0(a5)
ffffffffc0201de0:	2681                	sext.w	a3,a3
ffffffffc0201de2:	26e69e63          	bne	a3,a4,ffffffffc020205e <swap_init+0x4aa>
ffffffffc0201de6:	668d                	lui	a3,0x3
ffffffffc0201de8:	4631                	li	a2,12
ffffffffc0201dea:	00c68023          	sb	a2,0(a3) # 3000 <BASE_ADDRESS-0xffffffffc01fd000>
ffffffffc0201dee:	4398                	lw	a4,0(a5)
ffffffffc0201df0:	458d                	li	a1,3
ffffffffc0201df2:	2701                	sext.w	a4,a4
ffffffffc0201df4:	28b71563          	bne	a4,a1,ffffffffc020207e <swap_init+0x4ca>
ffffffffc0201df8:	00c68823          	sb	a2,16(a3)
ffffffffc0201dfc:	4394                	lw	a3,0(a5)
ffffffffc0201dfe:	2681                	sext.w	a3,a3
ffffffffc0201e00:	28e69f63          	bne	a3,a4,ffffffffc020209e <swap_init+0x4ea>
ffffffffc0201e04:	6691                	lui	a3,0x4
ffffffffc0201e06:	4635                	li	a2,13
ffffffffc0201e08:	00c68023          	sb	a2,0(a3) # 4000 <BASE_ADDRESS-0xffffffffc01fc000>
ffffffffc0201e0c:	4398                	lw	a4,0(a5)
ffffffffc0201e0e:	2701                	sext.w	a4,a4
ffffffffc0201e10:	33a71763          	bne	a4,s10,ffffffffc020213e <swap_init+0x58a>
ffffffffc0201e14:	00c68823          	sb	a2,16(a3)
ffffffffc0201e18:	439c                	lw	a5,0(a5)
ffffffffc0201e1a:	2781                	sext.w	a5,a5
ffffffffc0201e1c:	34e79163          	bne	a5,a4,ffffffffc020215e <swap_init+0x5aa>
ffffffffc0201e20:	481c                	lw	a5,16(s0)
ffffffffc0201e22:	34079e63          	bnez	a5,ffffffffc020217e <swap_init+0x5ca>
ffffffffc0201e26:	00013797          	auipc	a5,0x13
ffffffffc0201e2a:	6ea78793          	addi	a5,a5,1770 # ffffffffc0215510 <swap_in_seq_no>
ffffffffc0201e2e:	00013717          	auipc	a4,0x13
ffffffffc0201e32:	70a70713          	addi	a4,a4,1802 # ffffffffc0215538 <swap_out_seq_no>
ffffffffc0201e36:	00013617          	auipc	a2,0x13
ffffffffc0201e3a:	70260613          	addi	a2,a2,1794 # ffffffffc0215538 <swap_out_seq_no>
ffffffffc0201e3e:	56fd                	li	a3,-1
ffffffffc0201e40:	c394                	sw	a3,0(a5)
ffffffffc0201e42:	c314                	sw	a3,0(a4)
ffffffffc0201e44:	0791                	addi	a5,a5,4
ffffffffc0201e46:	0711                	addi	a4,a4,4
ffffffffc0201e48:	fec79ce3          	bne	a5,a2,ffffffffc0201e40 <swap_init+0x28c>
ffffffffc0201e4c:	00013697          	auipc	a3,0x13
ffffffffc0201e50:	74c68693          	addi	a3,a3,1868 # ffffffffc0215598 <check_ptep>
ffffffffc0201e54:	00013817          	auipc	a6,0x13
ffffffffc0201e58:	69c80813          	addi	a6,a6,1692 # ffffffffc02154f0 <check_rp>
ffffffffc0201e5c:	6c05                	lui	s8,0x1
ffffffffc0201e5e:	00013c97          	auipc	s9,0x13
ffffffffc0201e62:	64ac8c93          	addi	s9,s9,1610 # ffffffffc02154a8 <npage>
ffffffffc0201e66:	00013d97          	auipc	s11,0x13
ffffffffc0201e6a:	782d8d93          	addi	s11,s11,1922 # ffffffffc02155e8 <pages>
ffffffffc0201e6e:	00005d17          	auipc	s10,0x5
ffffffffc0201e72:	e0ad0d13          	addi	s10,s10,-502 # ffffffffc0206c78 <nbase>
ffffffffc0201e76:	6562                	ld	a0,24(sp)
ffffffffc0201e78:	0006b023          	sd	zero,0(a3)
ffffffffc0201e7c:	4601                	li	a2,0
ffffffffc0201e7e:	85e2                	mv	a1,s8
ffffffffc0201e80:	e842                	sd	a6,16(sp)
ffffffffc0201e82:	e436                	sd	a3,8(sp)
ffffffffc0201e84:	200010ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc0201e88:	66a2                	ld	a3,8(sp)
ffffffffc0201e8a:	6842                	ld	a6,16(sp)
ffffffffc0201e8c:	e288                	sd	a0,0(a3)
ffffffffc0201e8e:	16050c63          	beqz	a0,ffffffffc0202006 <swap_init+0x452>
ffffffffc0201e92:	611c                	ld	a5,0(a0)
ffffffffc0201e94:	0017f613          	andi	a2,a5,1
ffffffffc0201e98:	0e060f63          	beqz	a2,ffffffffc0201f96 <swap_init+0x3e2>
ffffffffc0201e9c:	000cb603          	ld	a2,0(s9)
ffffffffc0201ea0:	078a                	slli	a5,a5,0x2
ffffffffc0201ea2:	83b1                	srli	a5,a5,0xc
ffffffffc0201ea4:	10c7f563          	bgeu	a5,a2,ffffffffc0201fae <swap_init+0x3fa>
ffffffffc0201ea8:	000d3503          	ld	a0,0(s10)
ffffffffc0201eac:	000db603          	ld	a2,0(s11)
ffffffffc0201eb0:	00083583          	ld	a1,0(a6)
ffffffffc0201eb4:	8f89                	sub	a5,a5,a0
ffffffffc0201eb6:	079a                	slli	a5,a5,0x6
ffffffffc0201eb8:	97b2                	add	a5,a5,a2
ffffffffc0201eba:	0af59e63          	bne	a1,a5,ffffffffc0201f76 <swap_init+0x3c2>
ffffffffc0201ebe:	6785                	lui	a5,0x1
ffffffffc0201ec0:	9c3e                	add	s8,s8,a5
ffffffffc0201ec2:	6795                	lui	a5,0x5
ffffffffc0201ec4:	06a1                	addi	a3,a3,8
ffffffffc0201ec6:	0821                	addi	a6,a6,8
ffffffffc0201ec8:	fafc17e3          	bne	s8,a5,ffffffffc0201e76 <swap_init+0x2c2>
ffffffffc0201ecc:	00004517          	auipc	a0,0x4
ffffffffc0201ed0:	fdc50513          	addi	a0,a0,-36 # ffffffffc0205ea8 <commands+0x1178>
ffffffffc0201ed4:	a14fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201ed8:	00013797          	auipc	a5,0x13
ffffffffc0201edc:	5b878793          	addi	a5,a5,1464 # ffffffffc0215490 <sm>
ffffffffc0201ee0:	639c                	ld	a5,0(a5)
ffffffffc0201ee2:	7f9c                	ld	a5,56(a5)
ffffffffc0201ee4:	9782                	jalr	a5
ffffffffc0201ee6:	2a051c63          	bnez	a0,ffffffffc020219e <swap_init+0x5ea>
ffffffffc0201eea:	000a3503          	ld	a0,0(s4)
ffffffffc0201eee:	4585                	li	a1,1
ffffffffc0201ef0:	0a21                	addi	s4,s4,8
ffffffffc0201ef2:	10c010ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0201ef6:	ff6a1ae3          	bne	s4,s6,ffffffffc0201eea <swap_init+0x336>
ffffffffc0201efa:	855e                	mv	a0,s7
ffffffffc0201efc:	e51fe0ef          	jal	ra,ffffffffc0200d4c <mm_destroy>
ffffffffc0201f00:	77a2                	ld	a5,40(sp)
ffffffffc0201f02:	00013717          	auipc	a4,0x13
ffffffffc0201f06:	6cf72323          	sw	a5,1734(a4) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0201f0a:	7782                	ld	a5,32(sp)
ffffffffc0201f0c:	00013717          	auipc	a4,0x13
ffffffffc0201f10:	6af73623          	sd	a5,1708(a4) # ffffffffc02155b8 <free_area>
ffffffffc0201f14:	00013797          	auipc	a5,0x13
ffffffffc0201f18:	6b37b623          	sd	s3,1708(a5) # ffffffffc02155c0 <free_area+0x8>
ffffffffc0201f1c:	00898a63          	beq	s3,s0,ffffffffc0201f30 <swap_init+0x37c>
ffffffffc0201f20:	ff89a783          	lw	a5,-8(s3)
ffffffffc0201f24:	0089b983          	ld	s3,8(s3)
ffffffffc0201f28:	397d                	addiw	s2,s2,-1
ffffffffc0201f2a:	9c9d                	subw	s1,s1,a5
ffffffffc0201f2c:	fe899ae3          	bne	s3,s0,ffffffffc0201f20 <swap_init+0x36c>
ffffffffc0201f30:	8626                	mv	a2,s1
ffffffffc0201f32:	85ca                	mv	a1,s2
ffffffffc0201f34:	00004517          	auipc	a0,0x4
ffffffffc0201f38:	fa450513          	addi	a0,a0,-92 # ffffffffc0205ed8 <commands+0x11a8>
ffffffffc0201f3c:	9acfe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201f40:	00004517          	auipc	a0,0x4
ffffffffc0201f44:	fb850513          	addi	a0,a0,-72 # ffffffffc0205ef8 <commands+0x11c8>
ffffffffc0201f48:	9a0fe0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0201f4c:	b1e1                	j	ffffffffc0201c14 <swap_init+0x60>
ffffffffc0201f4e:	4481                	li	s1,0
ffffffffc0201f50:	4901                	li	s2,0
ffffffffc0201f52:	4981                	li	s3,0
ffffffffc0201f54:	bb35                	j	ffffffffc0201c90 <swap_init+0xdc>
ffffffffc0201f56:	00004697          	auipc	a3,0x4
ffffffffc0201f5a:	d3a68693          	addi	a3,a3,-710 # ffffffffc0205c90 <commands+0xf60>
ffffffffc0201f5e:	00003617          	auipc	a2,0x3
ffffffffc0201f62:	63260613          	addi	a2,a2,1586 # ffffffffc0205590 <commands+0x860>
ffffffffc0201f66:	0bd00593          	li	a1,189
ffffffffc0201f6a:	00004517          	auipc	a0,0x4
ffffffffc0201f6e:	ce650513          	addi	a0,a0,-794 # ffffffffc0205c50 <commands+0xf20>
ffffffffc0201f72:	a7afe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201f76:	00004697          	auipc	a3,0x4
ffffffffc0201f7a:	f0a68693          	addi	a3,a3,-246 # ffffffffc0205e80 <commands+0x1150>
ffffffffc0201f7e:	00003617          	auipc	a2,0x3
ffffffffc0201f82:	61260613          	addi	a2,a2,1554 # ffffffffc0205590 <commands+0x860>
ffffffffc0201f86:	0fd00593          	li	a1,253
ffffffffc0201f8a:	00004517          	auipc	a0,0x4
ffffffffc0201f8e:	cc650513          	addi	a0,a0,-826 # ffffffffc0205c50 <commands+0xf20>
ffffffffc0201f92:	a5afe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201f96:	00004617          	auipc	a2,0x4
ffffffffc0201f9a:	ec260613          	addi	a2,a2,-318 # ffffffffc0205e58 <commands+0x1128>
ffffffffc0201f9e:	07400593          	li	a1,116
ffffffffc0201fa2:	00004517          	auipc	a0,0x4
ffffffffc0201fa6:	91e50513          	addi	a0,a0,-1762 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0201faa:	a42fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201fae:	00004617          	auipc	a2,0x4
ffffffffc0201fb2:	8f260613          	addi	a2,a2,-1806 # ffffffffc02058a0 <commands+0xb70>
ffffffffc0201fb6:	06200593          	li	a1,98
ffffffffc0201fba:	00004517          	auipc	a0,0x4
ffffffffc0201fbe:	90650513          	addi	a0,a0,-1786 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0201fc2:	a2afe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201fc6:	00004697          	auipc	a3,0x4
ffffffffc0201fca:	dca68693          	addi	a3,a3,-566 # ffffffffc0205d90 <commands+0x1060>
ffffffffc0201fce:	00003617          	auipc	a2,0x3
ffffffffc0201fd2:	5c260613          	addi	a2,a2,1474 # ffffffffc0205590 <commands+0x860>
ffffffffc0201fd6:	0de00593          	li	a1,222
ffffffffc0201fda:	00004517          	auipc	a0,0x4
ffffffffc0201fde:	c7650513          	addi	a0,a0,-906 # ffffffffc0205c50 <commands+0xf20>
ffffffffc0201fe2:	a0afe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0201fe6:	00004697          	auipc	a3,0x4
ffffffffc0201fea:	d9268693          	addi	a3,a3,-622 # ffffffffc0205d78 <commands+0x1048>
ffffffffc0201fee:	00003617          	auipc	a2,0x3
ffffffffc0201ff2:	5a260613          	addi	a2,a2,1442 # ffffffffc0205590 <commands+0x860>
ffffffffc0201ff6:	0dd00593          	li	a1,221
ffffffffc0201ffa:	00004517          	auipc	a0,0x4
ffffffffc0201ffe:	c5650513          	addi	a0,a0,-938 # ffffffffc0205c50 <commands+0xf20>
ffffffffc0202002:	9eafe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202006:	00004697          	auipc	a3,0x4
ffffffffc020200a:	e3a68693          	addi	a3,a3,-454 # ffffffffc0205e40 <commands+0x1110>
ffffffffc020200e:	00003617          	auipc	a2,0x3
ffffffffc0202012:	58260613          	addi	a2,a2,1410 # ffffffffc0205590 <commands+0x860>
ffffffffc0202016:	0fc00593          	li	a1,252
ffffffffc020201a:	00004517          	auipc	a0,0x4
ffffffffc020201e:	c3650513          	addi	a0,a0,-970 # ffffffffc0205c50 <commands+0xf20>
ffffffffc0202022:	9cafe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202026:	00004617          	auipc	a2,0x4
ffffffffc020202a:	c0a60613          	addi	a2,a2,-1014 # ffffffffc0205c30 <commands+0xf00>
ffffffffc020202e:	02a00593          	li	a1,42
ffffffffc0202032:	00004517          	auipc	a0,0x4
ffffffffc0202036:	c1e50513          	addi	a0,a0,-994 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020203a:	9b2fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020203e:	00004697          	auipc	a3,0x4
ffffffffc0202042:	dd268693          	addi	a3,a3,-558 # ffffffffc0205e10 <commands+0x10e0>
ffffffffc0202046:	00003617          	auipc	a2,0x3
ffffffffc020204a:	54a60613          	addi	a2,a2,1354 # ffffffffc0205590 <commands+0x860>
ffffffffc020204e:	09800593          	li	a1,152
ffffffffc0202052:	00004517          	auipc	a0,0x4
ffffffffc0202056:	bfe50513          	addi	a0,a0,-1026 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020205a:	992fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020205e:	00004697          	auipc	a3,0x4
ffffffffc0202062:	db268693          	addi	a3,a3,-590 # ffffffffc0205e10 <commands+0x10e0>
ffffffffc0202066:	00003617          	auipc	a2,0x3
ffffffffc020206a:	52a60613          	addi	a2,a2,1322 # ffffffffc0205590 <commands+0x860>
ffffffffc020206e:	09a00593          	li	a1,154
ffffffffc0202072:	00004517          	auipc	a0,0x4
ffffffffc0202076:	bde50513          	addi	a0,a0,-1058 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020207a:	972fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020207e:	00004697          	auipc	a3,0x4
ffffffffc0202082:	da268693          	addi	a3,a3,-606 # ffffffffc0205e20 <commands+0x10f0>
ffffffffc0202086:	00003617          	auipc	a2,0x3
ffffffffc020208a:	50a60613          	addi	a2,a2,1290 # ffffffffc0205590 <commands+0x860>
ffffffffc020208e:	09c00593          	li	a1,156
ffffffffc0202092:	00004517          	auipc	a0,0x4
ffffffffc0202096:	bbe50513          	addi	a0,a0,-1090 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020209a:	952fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020209e:	00004697          	auipc	a3,0x4
ffffffffc02020a2:	d8268693          	addi	a3,a3,-638 # ffffffffc0205e20 <commands+0x10f0>
ffffffffc02020a6:	00003617          	auipc	a2,0x3
ffffffffc02020aa:	4ea60613          	addi	a2,a2,1258 # ffffffffc0205590 <commands+0x860>
ffffffffc02020ae:	09e00593          	li	a1,158
ffffffffc02020b2:	00004517          	auipc	a0,0x4
ffffffffc02020b6:	b9e50513          	addi	a0,a0,-1122 # ffffffffc0205c50 <commands+0xf20>
ffffffffc02020ba:	932fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02020be:	00004697          	auipc	a3,0x4
ffffffffc02020c2:	d4268693          	addi	a3,a3,-702 # ffffffffc0205e00 <commands+0x10d0>
ffffffffc02020c6:	00003617          	auipc	a2,0x3
ffffffffc02020ca:	4ca60613          	addi	a2,a2,1226 # ffffffffc0205590 <commands+0x860>
ffffffffc02020ce:	09400593          	li	a1,148
ffffffffc02020d2:	00004517          	auipc	a0,0x4
ffffffffc02020d6:	b7e50513          	addi	a0,a0,-1154 # ffffffffc0205c50 <commands+0xf20>
ffffffffc02020da:	912fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02020de:	00004697          	auipc	a3,0x4
ffffffffc02020e2:	d2268693          	addi	a3,a3,-734 # ffffffffc0205e00 <commands+0x10d0>
ffffffffc02020e6:	00003617          	auipc	a2,0x3
ffffffffc02020ea:	4aa60613          	addi	a2,a2,1194 # ffffffffc0205590 <commands+0x860>
ffffffffc02020ee:	09600593          	li	a1,150
ffffffffc02020f2:	00004517          	auipc	a0,0x4
ffffffffc02020f6:	b5e50513          	addi	a0,a0,-1186 # ffffffffc0205c50 <commands+0xf20>
ffffffffc02020fa:	8f2fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02020fe:	00004697          	auipc	a3,0x4
ffffffffc0202102:	cb268693          	addi	a3,a3,-846 # ffffffffc0205db0 <commands+0x1080>
ffffffffc0202106:	00003617          	auipc	a2,0x3
ffffffffc020210a:	48a60613          	addi	a2,a2,1162 # ffffffffc0205590 <commands+0x860>
ffffffffc020210e:	0eb00593          	li	a1,235
ffffffffc0202112:	00004517          	auipc	a0,0x4
ffffffffc0202116:	b3e50513          	addi	a0,a0,-1218 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020211a:	8d2fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020211e:	00004697          	auipc	a3,0x4
ffffffffc0202122:	c1a68693          	addi	a3,a3,-998 # ffffffffc0205d38 <commands+0x1008>
ffffffffc0202126:	00003617          	auipc	a2,0x3
ffffffffc020212a:	46a60613          	addi	a2,a2,1130 # ffffffffc0205590 <commands+0x860>
ffffffffc020212e:	0d800593          	li	a1,216
ffffffffc0202132:	00004517          	auipc	a0,0x4
ffffffffc0202136:	b1e50513          	addi	a0,a0,-1250 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020213a:	8b2fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020213e:	00004697          	auipc	a3,0x4
ffffffffc0202142:	82a68693          	addi	a3,a3,-2006 # ffffffffc0205968 <commands+0xc38>
ffffffffc0202146:	00003617          	auipc	a2,0x3
ffffffffc020214a:	44a60613          	addi	a2,a2,1098 # ffffffffc0205590 <commands+0x860>
ffffffffc020214e:	0a000593          	li	a1,160
ffffffffc0202152:	00004517          	auipc	a0,0x4
ffffffffc0202156:	afe50513          	addi	a0,a0,-1282 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020215a:	892fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020215e:	00004697          	auipc	a3,0x4
ffffffffc0202162:	80a68693          	addi	a3,a3,-2038 # ffffffffc0205968 <commands+0xc38>
ffffffffc0202166:	00003617          	auipc	a2,0x3
ffffffffc020216a:	42a60613          	addi	a2,a2,1066 # ffffffffc0205590 <commands+0x860>
ffffffffc020216e:	0a200593          	li	a1,162
ffffffffc0202172:	00004517          	auipc	a0,0x4
ffffffffc0202176:	ade50513          	addi	a0,a0,-1314 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020217a:	872fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020217e:	00004697          	auipc	a3,0x4
ffffffffc0202182:	cb268693          	addi	a3,a3,-846 # ffffffffc0205e30 <commands+0x1100>
ffffffffc0202186:	00003617          	auipc	a2,0x3
ffffffffc020218a:	40a60613          	addi	a2,a2,1034 # ffffffffc0205590 <commands+0x860>
ffffffffc020218e:	0f400593          	li	a1,244
ffffffffc0202192:	00004517          	auipc	a0,0x4
ffffffffc0202196:	abe50513          	addi	a0,a0,-1346 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020219a:	852fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020219e:	00004697          	auipc	a3,0x4
ffffffffc02021a2:	d3268693          	addi	a3,a3,-718 # ffffffffc0205ed0 <commands+0x11a0>
ffffffffc02021a6:	00003617          	auipc	a2,0x3
ffffffffc02021aa:	3ea60613          	addi	a2,a2,1002 # ffffffffc0205590 <commands+0x860>
ffffffffc02021ae:	10300593          	li	a1,259
ffffffffc02021b2:	00004517          	auipc	a0,0x4
ffffffffc02021b6:	a9e50513          	addi	a0,a0,-1378 # ffffffffc0205c50 <commands+0xf20>
ffffffffc02021ba:	832fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02021be:	00003697          	auipc	a3,0x3
ffffffffc02021c2:	51a68693          	addi	a3,a3,1306 # ffffffffc02056d8 <commands+0x9a8>
ffffffffc02021c6:	00003617          	auipc	a2,0x3
ffffffffc02021ca:	3ca60613          	addi	a2,a2,970 # ffffffffc0205590 <commands+0x860>
ffffffffc02021ce:	0c500593          	li	a1,197
ffffffffc02021d2:	00004517          	auipc	a0,0x4
ffffffffc02021d6:	a7e50513          	addi	a0,a0,-1410 # ffffffffc0205c50 <commands+0xf20>
ffffffffc02021da:	812fe0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02021de:	00004697          	auipc	a3,0x4
ffffffffc02021e2:	b0a68693          	addi	a3,a3,-1270 # ffffffffc0205ce8 <commands+0xfb8>
ffffffffc02021e6:	00003617          	auipc	a2,0x3
ffffffffc02021ea:	3aa60613          	addi	a2,a2,938 # ffffffffc0205590 <commands+0x860>
ffffffffc02021ee:	0c800593          	li	a1,200
ffffffffc02021f2:	00004517          	auipc	a0,0x4
ffffffffc02021f6:	a5e50513          	addi	a0,a0,-1442 # ffffffffc0205c50 <commands+0xf20>
ffffffffc02021fa:	ff3fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02021fe:	00003697          	auipc	a3,0x3
ffffffffc0202202:	66268693          	addi	a3,a3,1634 # ffffffffc0205860 <commands+0xb30>
ffffffffc0202206:	00003617          	auipc	a2,0x3
ffffffffc020220a:	38a60613          	addi	a2,a2,906 # ffffffffc0205590 <commands+0x860>
ffffffffc020220e:	0cd00593          	li	a1,205
ffffffffc0202212:	00004517          	auipc	a0,0x4
ffffffffc0202216:	a3e50513          	addi	a0,a0,-1474 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020221a:	fd3fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020221e:	00003697          	auipc	a3,0x3
ffffffffc0202222:	71268693          	addi	a3,a3,1810 # ffffffffc0205930 <commands+0xc00>
ffffffffc0202226:	00003617          	auipc	a2,0x3
ffffffffc020222a:	36a60613          	addi	a2,a2,874 # ffffffffc0205590 <commands+0x860>
ffffffffc020222e:	0d000593          	li	a1,208
ffffffffc0202232:	00004517          	auipc	a0,0x4
ffffffffc0202236:	a1e50513          	addi	a0,a0,-1506 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020223a:	fb3fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020223e:	00004697          	auipc	a3,0x4
ffffffffc0202242:	a6268693          	addi	a3,a3,-1438 # ffffffffc0205ca0 <commands+0xf70>
ffffffffc0202246:	00003617          	auipc	a2,0x3
ffffffffc020224a:	34a60613          	addi	a2,a2,842 # ffffffffc0205590 <commands+0x860>
ffffffffc020224e:	0c000593          	li	a1,192
ffffffffc0202252:	00004517          	auipc	a0,0x4
ffffffffc0202256:	9fe50513          	addi	a0,a0,-1538 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020225a:	f93fd0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc020225e <swap_init_mm>:
ffffffffc020225e:	00013797          	auipc	a5,0x13
ffffffffc0202262:	23278793          	addi	a5,a5,562 # ffffffffc0215490 <sm>
ffffffffc0202266:	639c                	ld	a5,0(a5)
ffffffffc0202268:	0107b303          	ld	t1,16(a5)
ffffffffc020226c:	8302                	jr	t1

ffffffffc020226e <swap_map_swappable>:
ffffffffc020226e:	00013797          	auipc	a5,0x13
ffffffffc0202272:	22278793          	addi	a5,a5,546 # ffffffffc0215490 <sm>
ffffffffc0202276:	639c                	ld	a5,0(a5)
ffffffffc0202278:	0207b303          	ld	t1,32(a5)
ffffffffc020227c:	8302                	jr	t1

ffffffffc020227e <swap_out>:
ffffffffc020227e:	711d                	addi	sp,sp,-96
ffffffffc0202280:	ec86                	sd	ra,88(sp)
ffffffffc0202282:	e8a2                	sd	s0,80(sp)
ffffffffc0202284:	e4a6                	sd	s1,72(sp)
ffffffffc0202286:	e0ca                	sd	s2,64(sp)
ffffffffc0202288:	fc4e                	sd	s3,56(sp)
ffffffffc020228a:	f852                	sd	s4,48(sp)
ffffffffc020228c:	f456                	sd	s5,40(sp)
ffffffffc020228e:	f05a                	sd	s6,32(sp)
ffffffffc0202290:	ec5e                	sd	s7,24(sp)
ffffffffc0202292:	e862                	sd	s8,16(sp)
ffffffffc0202294:	cde9                	beqz	a1,ffffffffc020236e <swap_out+0xf0>
ffffffffc0202296:	8ab2                	mv	s5,a2
ffffffffc0202298:	892a                	mv	s2,a0
ffffffffc020229a:	8a2e                	mv	s4,a1
ffffffffc020229c:	4401                	li	s0,0
ffffffffc020229e:	00013997          	auipc	s3,0x13
ffffffffc02022a2:	1f298993          	addi	s3,s3,498 # ffffffffc0215490 <sm>
ffffffffc02022a6:	00004b17          	auipc	s6,0x4
ffffffffc02022aa:	cd2b0b13          	addi	s6,s6,-814 # ffffffffc0205f78 <commands+0x1248>
ffffffffc02022ae:	00004b97          	auipc	s7,0x4
ffffffffc02022b2:	cb2b8b93          	addi	s7,s7,-846 # ffffffffc0205f60 <commands+0x1230>
ffffffffc02022b6:	a825                	j	ffffffffc02022ee <swap_out+0x70>
ffffffffc02022b8:	67a2                	ld	a5,8(sp)
ffffffffc02022ba:	8626                	mv	a2,s1
ffffffffc02022bc:	85a2                	mv	a1,s0
ffffffffc02022be:	7f94                	ld	a3,56(a5)
ffffffffc02022c0:	855a                	mv	a0,s6
ffffffffc02022c2:	2405                	addiw	s0,s0,1
ffffffffc02022c4:	82b1                	srli	a3,a3,0xc
ffffffffc02022c6:	0685                	addi	a3,a3,1
ffffffffc02022c8:	e21fd0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02022cc:	6522                	ld	a0,8(sp)
ffffffffc02022ce:	4585                	li	a1,1
ffffffffc02022d0:	7d1c                	ld	a5,56(a0)
ffffffffc02022d2:	83b1                	srli	a5,a5,0xc
ffffffffc02022d4:	0785                	addi	a5,a5,1
ffffffffc02022d6:	07a2                	slli	a5,a5,0x8
ffffffffc02022d8:	00fc3023          	sd	a5,0(s8) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc02022dc:	523000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc02022e0:	01893503          	ld	a0,24(s2)
ffffffffc02022e4:	85a6                	mv	a1,s1
ffffffffc02022e6:	26b010ef          	jal	ra,ffffffffc0203d50 <tlb_invalidate>
ffffffffc02022ea:	048a0d63          	beq	s4,s0,ffffffffc0202344 <swap_out+0xc6>
ffffffffc02022ee:	0009b783          	ld	a5,0(s3)
ffffffffc02022f2:	8656                	mv	a2,s5
ffffffffc02022f4:	002c                	addi	a1,sp,8
ffffffffc02022f6:	7b9c                	ld	a5,48(a5)
ffffffffc02022f8:	854a                	mv	a0,s2
ffffffffc02022fa:	9782                	jalr	a5
ffffffffc02022fc:	e12d                	bnez	a0,ffffffffc020235e <swap_out+0xe0>
ffffffffc02022fe:	67a2                	ld	a5,8(sp)
ffffffffc0202300:	01893503          	ld	a0,24(s2)
ffffffffc0202304:	4601                	li	a2,0
ffffffffc0202306:	7f84                	ld	s1,56(a5)
ffffffffc0202308:	85a6                	mv	a1,s1
ffffffffc020230a:	57b000ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc020230e:	611c                	ld	a5,0(a0)
ffffffffc0202310:	8c2a                	mv	s8,a0
ffffffffc0202312:	8b85                	andi	a5,a5,1
ffffffffc0202314:	cfb9                	beqz	a5,ffffffffc0202372 <swap_out+0xf4>
ffffffffc0202316:	65a2                	ld	a1,8(sp)
ffffffffc0202318:	7d9c                	ld	a5,56(a1)
ffffffffc020231a:	83b1                	srli	a5,a5,0xc
ffffffffc020231c:	00178513          	addi	a0,a5,1
ffffffffc0202320:	0522                	slli	a0,a0,0x8
ffffffffc0202322:	397010ef          	jal	ra,ffffffffc0203eb8 <swapfs_write>
ffffffffc0202326:	d949                	beqz	a0,ffffffffc02022b8 <swap_out+0x3a>
ffffffffc0202328:	855e                	mv	a0,s7
ffffffffc020232a:	dbffd0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020232e:	0009b783          	ld	a5,0(s3)
ffffffffc0202332:	6622                	ld	a2,8(sp)
ffffffffc0202334:	4681                	li	a3,0
ffffffffc0202336:	739c                	ld	a5,32(a5)
ffffffffc0202338:	85a6                	mv	a1,s1
ffffffffc020233a:	854a                	mv	a0,s2
ffffffffc020233c:	2405                	addiw	s0,s0,1
ffffffffc020233e:	9782                	jalr	a5
ffffffffc0202340:	fa8a17e3          	bne	s4,s0,ffffffffc02022ee <swap_out+0x70>
ffffffffc0202344:	8522                	mv	a0,s0
ffffffffc0202346:	60e6                	ld	ra,88(sp)
ffffffffc0202348:	6446                	ld	s0,80(sp)
ffffffffc020234a:	64a6                	ld	s1,72(sp)
ffffffffc020234c:	6906                	ld	s2,64(sp)
ffffffffc020234e:	79e2                	ld	s3,56(sp)
ffffffffc0202350:	7a42                	ld	s4,48(sp)
ffffffffc0202352:	7aa2                	ld	s5,40(sp)
ffffffffc0202354:	7b02                	ld	s6,32(sp)
ffffffffc0202356:	6be2                	ld	s7,24(sp)
ffffffffc0202358:	6c42                	ld	s8,16(sp)
ffffffffc020235a:	6125                	addi	sp,sp,96
ffffffffc020235c:	8082                	ret
ffffffffc020235e:	85a2                	mv	a1,s0
ffffffffc0202360:	00004517          	auipc	a0,0x4
ffffffffc0202364:	bb850513          	addi	a0,a0,-1096 # ffffffffc0205f18 <commands+0x11e8>
ffffffffc0202368:	d81fd0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020236c:	bfe1                	j	ffffffffc0202344 <swap_out+0xc6>
ffffffffc020236e:	4401                	li	s0,0
ffffffffc0202370:	bfd1                	j	ffffffffc0202344 <swap_out+0xc6>
ffffffffc0202372:	00004697          	auipc	a3,0x4
ffffffffc0202376:	bd668693          	addi	a3,a3,-1066 # ffffffffc0205f48 <commands+0x1218>
ffffffffc020237a:	00003617          	auipc	a2,0x3
ffffffffc020237e:	21660613          	addi	a2,a2,534 # ffffffffc0205590 <commands+0x860>
ffffffffc0202382:	06900593          	li	a1,105
ffffffffc0202386:	00004517          	auipc	a0,0x4
ffffffffc020238a:	8ca50513          	addi	a0,a0,-1846 # ffffffffc0205c50 <commands+0xf20>
ffffffffc020238e:	e5ffd0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0202392 <swap_in>:
ffffffffc0202392:	7179                	addi	sp,sp,-48
ffffffffc0202394:	e84a                	sd	s2,16(sp)
ffffffffc0202396:	892a                	mv	s2,a0
ffffffffc0202398:	4505                	li	a0,1
ffffffffc020239a:	ec26                	sd	s1,24(sp)
ffffffffc020239c:	e44e                	sd	s3,8(sp)
ffffffffc020239e:	f406                	sd	ra,40(sp)
ffffffffc02023a0:	f022                	sd	s0,32(sp)
ffffffffc02023a2:	84ae                	mv	s1,a1
ffffffffc02023a4:	89b2                	mv	s3,a2
ffffffffc02023a6:	3d1000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02023aa:	c129                	beqz	a0,ffffffffc02023ec <swap_in+0x5a>
ffffffffc02023ac:	842a                	mv	s0,a0
ffffffffc02023ae:	01893503          	ld	a0,24(s2)
ffffffffc02023b2:	4601                	li	a2,0
ffffffffc02023b4:	85a6                	mv	a1,s1
ffffffffc02023b6:	4cf000ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc02023ba:	892a                	mv	s2,a0
ffffffffc02023bc:	6108                	ld	a0,0(a0)
ffffffffc02023be:	85a2                	mv	a1,s0
ffffffffc02023c0:	261010ef          	jal	ra,ffffffffc0203e20 <swapfs_read>
ffffffffc02023c4:	00093583          	ld	a1,0(s2)
ffffffffc02023c8:	8626                	mv	a2,s1
ffffffffc02023ca:	00004517          	auipc	a0,0x4
ffffffffc02023ce:	82650513          	addi	a0,a0,-2010 # ffffffffc0205bf0 <commands+0xec0>
ffffffffc02023d2:	81a1                	srli	a1,a1,0x8
ffffffffc02023d4:	d15fd0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02023d8:	70a2                	ld	ra,40(sp)
ffffffffc02023da:	0089b023          	sd	s0,0(s3)
ffffffffc02023de:	7402                	ld	s0,32(sp)
ffffffffc02023e0:	64e2                	ld	s1,24(sp)
ffffffffc02023e2:	6942                	ld	s2,16(sp)
ffffffffc02023e4:	69a2                	ld	s3,8(sp)
ffffffffc02023e6:	4501                	li	a0,0
ffffffffc02023e8:	6145                	addi	sp,sp,48
ffffffffc02023ea:	8082                	ret
ffffffffc02023ec:	00003697          	auipc	a3,0x3
ffffffffc02023f0:	7f468693          	addi	a3,a3,2036 # ffffffffc0205be0 <commands+0xeb0>
ffffffffc02023f4:	00003617          	auipc	a2,0x3
ffffffffc02023f8:	19c60613          	addi	a2,a2,412 # ffffffffc0205590 <commands+0x860>
ffffffffc02023fc:	07f00593          	li	a1,127
ffffffffc0202400:	00004517          	auipc	a0,0x4
ffffffffc0202404:	85050513          	addi	a0,a0,-1968 # ffffffffc0205c50 <commands+0xf20>
ffffffffc0202408:	de5fd0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc020240c <default_init>:
ffffffffc020240c:	00013797          	auipc	a5,0x13
ffffffffc0202410:	1ac78793          	addi	a5,a5,428 # ffffffffc02155b8 <free_area>
ffffffffc0202414:	e79c                	sd	a5,8(a5)
ffffffffc0202416:	e39c                	sd	a5,0(a5)
ffffffffc0202418:	0007a823          	sw	zero,16(a5)
ffffffffc020241c:	8082                	ret

ffffffffc020241e <default_nr_free_pages>:
ffffffffc020241e:	00013517          	auipc	a0,0x13
ffffffffc0202422:	1aa56503          	lwu	a0,426(a0) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0202426:	8082                	ret

ffffffffc0202428 <default_check>:
ffffffffc0202428:	715d                	addi	sp,sp,-80
ffffffffc020242a:	f84a                	sd	s2,48(sp)
ffffffffc020242c:	00013917          	auipc	s2,0x13
ffffffffc0202430:	18c90913          	addi	s2,s2,396 # ffffffffc02155b8 <free_area>
ffffffffc0202434:	00893783          	ld	a5,8(s2)
ffffffffc0202438:	e486                	sd	ra,72(sp)
ffffffffc020243a:	e0a2                	sd	s0,64(sp)
ffffffffc020243c:	fc26                	sd	s1,56(sp)
ffffffffc020243e:	f44e                	sd	s3,40(sp)
ffffffffc0202440:	f052                	sd	s4,32(sp)
ffffffffc0202442:	ec56                	sd	s5,24(sp)
ffffffffc0202444:	e85a                	sd	s6,16(sp)
ffffffffc0202446:	e45e                	sd	s7,8(sp)
ffffffffc0202448:	e062                	sd	s8,0(sp)
ffffffffc020244a:	31278463          	beq	a5,s2,ffffffffc0202752 <default_check+0x32a>
ffffffffc020244e:	ff07b703          	ld	a4,-16(a5)
ffffffffc0202452:	8305                	srli	a4,a4,0x1
ffffffffc0202454:	8b05                	andi	a4,a4,1
ffffffffc0202456:	30070263          	beqz	a4,ffffffffc020275a <default_check+0x332>
ffffffffc020245a:	4401                	li	s0,0
ffffffffc020245c:	4481                	li	s1,0
ffffffffc020245e:	a031                	j	ffffffffc020246a <default_check+0x42>
ffffffffc0202460:	ff07b703          	ld	a4,-16(a5)
ffffffffc0202464:	8b09                	andi	a4,a4,2
ffffffffc0202466:	2e070a63          	beqz	a4,ffffffffc020275a <default_check+0x332>
ffffffffc020246a:	ff87a703          	lw	a4,-8(a5)
ffffffffc020246e:	679c                	ld	a5,8(a5)
ffffffffc0202470:	2485                	addiw	s1,s1,1
ffffffffc0202472:	9c39                	addw	s0,s0,a4
ffffffffc0202474:	ff2796e3          	bne	a5,s2,ffffffffc0202460 <default_check+0x38>
ffffffffc0202478:	89a2                	mv	s3,s0
ffffffffc020247a:	3cb000ef          	jal	ra,ffffffffc0203044 <nr_free_pages>
ffffffffc020247e:	73351e63          	bne	a0,s3,ffffffffc0202bba <default_check+0x792>
ffffffffc0202482:	4505                	li	a0,1
ffffffffc0202484:	2f3000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0202488:	8a2a                	mv	s4,a0
ffffffffc020248a:	46050863          	beqz	a0,ffffffffc02028fa <default_check+0x4d2>
ffffffffc020248e:	4505                	li	a0,1
ffffffffc0202490:	2e7000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0202494:	89aa                	mv	s3,a0
ffffffffc0202496:	74050263          	beqz	a0,ffffffffc0202bda <default_check+0x7b2>
ffffffffc020249a:	4505                	li	a0,1
ffffffffc020249c:	2db000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02024a0:	8aaa                	mv	s5,a0
ffffffffc02024a2:	4c050c63          	beqz	a0,ffffffffc020297a <default_check+0x552>
ffffffffc02024a6:	2d3a0a63          	beq	s4,s3,ffffffffc020277a <default_check+0x352>
ffffffffc02024aa:	2caa0863          	beq	s4,a0,ffffffffc020277a <default_check+0x352>
ffffffffc02024ae:	2ca98663          	beq	s3,a0,ffffffffc020277a <default_check+0x352>
ffffffffc02024b2:	000a2783          	lw	a5,0(s4)
ffffffffc02024b6:	2e079263          	bnez	a5,ffffffffc020279a <default_check+0x372>
ffffffffc02024ba:	0009a783          	lw	a5,0(s3)
ffffffffc02024be:	2c079e63          	bnez	a5,ffffffffc020279a <default_check+0x372>
ffffffffc02024c2:	411c                	lw	a5,0(a0)
ffffffffc02024c4:	2c079b63          	bnez	a5,ffffffffc020279a <default_check+0x372>
ffffffffc02024c8:	00013797          	auipc	a5,0x13
ffffffffc02024cc:	12078793          	addi	a5,a5,288 # ffffffffc02155e8 <pages>
ffffffffc02024d0:	639c                	ld	a5,0(a5)
ffffffffc02024d2:	00004717          	auipc	a4,0x4
ffffffffc02024d6:	7a670713          	addi	a4,a4,1958 # ffffffffc0206c78 <nbase>
ffffffffc02024da:	6310                	ld	a2,0(a4)
ffffffffc02024dc:	00013717          	auipc	a4,0x13
ffffffffc02024e0:	fcc70713          	addi	a4,a4,-52 # ffffffffc02154a8 <npage>
ffffffffc02024e4:	6314                	ld	a3,0(a4)
ffffffffc02024e6:	40fa0733          	sub	a4,s4,a5
ffffffffc02024ea:	8719                	srai	a4,a4,0x6
ffffffffc02024ec:	9732                	add	a4,a4,a2
ffffffffc02024ee:	06b2                	slli	a3,a3,0xc
ffffffffc02024f0:	0732                	slli	a4,a4,0xc
ffffffffc02024f2:	2cd77463          	bgeu	a4,a3,ffffffffc02027ba <default_check+0x392>
ffffffffc02024f6:	40f98733          	sub	a4,s3,a5
ffffffffc02024fa:	8719                	srai	a4,a4,0x6
ffffffffc02024fc:	9732                	add	a4,a4,a2
ffffffffc02024fe:	0732                	slli	a4,a4,0xc
ffffffffc0202500:	4ed77d63          	bgeu	a4,a3,ffffffffc02029fa <default_check+0x5d2>
ffffffffc0202504:	40f507b3          	sub	a5,a0,a5
ffffffffc0202508:	8799                	srai	a5,a5,0x6
ffffffffc020250a:	97b2                	add	a5,a5,a2
ffffffffc020250c:	07b2                	slli	a5,a5,0xc
ffffffffc020250e:	34d7f663          	bgeu	a5,a3,ffffffffc020285a <default_check+0x432>
ffffffffc0202512:	4505                	li	a0,1
ffffffffc0202514:	00093c03          	ld	s8,0(s2)
ffffffffc0202518:	00893b83          	ld	s7,8(s2)
ffffffffc020251c:	01092b03          	lw	s6,16(s2)
ffffffffc0202520:	00013797          	auipc	a5,0x13
ffffffffc0202524:	0b27b023          	sd	s2,160(a5) # ffffffffc02155c0 <free_area+0x8>
ffffffffc0202528:	00013797          	auipc	a5,0x13
ffffffffc020252c:	0927b823          	sd	s2,144(a5) # ffffffffc02155b8 <free_area>
ffffffffc0202530:	00013797          	auipc	a5,0x13
ffffffffc0202534:	0807ac23          	sw	zero,152(a5) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0202538:	23f000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc020253c:	2e051f63          	bnez	a0,ffffffffc020283a <default_check+0x412>
ffffffffc0202540:	4585                	li	a1,1
ffffffffc0202542:	8552                	mv	a0,s4
ffffffffc0202544:	2bb000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0202548:	4585                	li	a1,1
ffffffffc020254a:	854e                	mv	a0,s3
ffffffffc020254c:	2b3000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0202550:	4585                	li	a1,1
ffffffffc0202552:	8556                	mv	a0,s5
ffffffffc0202554:	2ab000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0202558:	01092703          	lw	a4,16(s2)
ffffffffc020255c:	478d                	li	a5,3
ffffffffc020255e:	2af71e63          	bne	a4,a5,ffffffffc020281a <default_check+0x3f2>
ffffffffc0202562:	4505                	li	a0,1
ffffffffc0202564:	213000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0202568:	89aa                	mv	s3,a0
ffffffffc020256a:	28050863          	beqz	a0,ffffffffc02027fa <default_check+0x3d2>
ffffffffc020256e:	4505                	li	a0,1
ffffffffc0202570:	207000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0202574:	8aaa                	mv	s5,a0
ffffffffc0202576:	3e050263          	beqz	a0,ffffffffc020295a <default_check+0x532>
ffffffffc020257a:	4505                	li	a0,1
ffffffffc020257c:	1fb000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0202580:	8a2a                	mv	s4,a0
ffffffffc0202582:	3a050c63          	beqz	a0,ffffffffc020293a <default_check+0x512>
ffffffffc0202586:	4505                	li	a0,1
ffffffffc0202588:	1ef000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc020258c:	38051763          	bnez	a0,ffffffffc020291a <default_check+0x4f2>
ffffffffc0202590:	4585                	li	a1,1
ffffffffc0202592:	854e                	mv	a0,s3
ffffffffc0202594:	26b000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0202598:	00893783          	ld	a5,8(s2)
ffffffffc020259c:	23278f63          	beq	a5,s2,ffffffffc02027da <default_check+0x3b2>
ffffffffc02025a0:	4505                	li	a0,1
ffffffffc02025a2:	1d5000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02025a6:	32a99a63          	bne	s3,a0,ffffffffc02028da <default_check+0x4b2>
ffffffffc02025aa:	4505                	li	a0,1
ffffffffc02025ac:	1cb000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02025b0:	30051563          	bnez	a0,ffffffffc02028ba <default_check+0x492>
ffffffffc02025b4:	01092783          	lw	a5,16(s2)
ffffffffc02025b8:	2e079163          	bnez	a5,ffffffffc020289a <default_check+0x472>
ffffffffc02025bc:	854e                	mv	a0,s3
ffffffffc02025be:	4585                	li	a1,1
ffffffffc02025c0:	00013797          	auipc	a5,0x13
ffffffffc02025c4:	ff87bc23          	sd	s8,-8(a5) # ffffffffc02155b8 <free_area>
ffffffffc02025c8:	00013797          	auipc	a5,0x13
ffffffffc02025cc:	ff77bc23          	sd	s7,-8(a5) # ffffffffc02155c0 <free_area+0x8>
ffffffffc02025d0:	00013797          	auipc	a5,0x13
ffffffffc02025d4:	ff67ac23          	sw	s6,-8(a5) # ffffffffc02155c8 <free_area+0x10>
ffffffffc02025d8:	227000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc02025dc:	4585                	li	a1,1
ffffffffc02025de:	8556                	mv	a0,s5
ffffffffc02025e0:	21f000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc02025e4:	4585                	li	a1,1
ffffffffc02025e6:	8552                	mv	a0,s4
ffffffffc02025e8:	217000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc02025ec:	4515                	li	a0,5
ffffffffc02025ee:	189000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02025f2:	89aa                	mv	s3,a0
ffffffffc02025f4:	28050363          	beqz	a0,ffffffffc020287a <default_check+0x452>
ffffffffc02025f8:	651c                	ld	a5,8(a0)
ffffffffc02025fa:	8385                	srli	a5,a5,0x1
ffffffffc02025fc:	8b85                	andi	a5,a5,1
ffffffffc02025fe:	54079e63          	bnez	a5,ffffffffc0202b5a <default_check+0x732>
ffffffffc0202602:	4505                	li	a0,1
ffffffffc0202604:	00093b03          	ld	s6,0(s2)
ffffffffc0202608:	00893a83          	ld	s5,8(s2)
ffffffffc020260c:	00013797          	auipc	a5,0x13
ffffffffc0202610:	fb27b623          	sd	s2,-84(a5) # ffffffffc02155b8 <free_area>
ffffffffc0202614:	00013797          	auipc	a5,0x13
ffffffffc0202618:	fb27b623          	sd	s2,-84(a5) # ffffffffc02155c0 <free_area+0x8>
ffffffffc020261c:	15b000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0202620:	50051d63          	bnez	a0,ffffffffc0202b3a <default_check+0x712>
ffffffffc0202624:	08098a13          	addi	s4,s3,128
ffffffffc0202628:	8552                	mv	a0,s4
ffffffffc020262a:	458d                	li	a1,3
ffffffffc020262c:	01092b83          	lw	s7,16(s2)
ffffffffc0202630:	00013797          	auipc	a5,0x13
ffffffffc0202634:	f807ac23          	sw	zero,-104(a5) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0202638:	1c7000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc020263c:	4511                	li	a0,4
ffffffffc020263e:	139000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0202642:	4c051c63          	bnez	a0,ffffffffc0202b1a <default_check+0x6f2>
ffffffffc0202646:	0889b783          	ld	a5,136(s3)
ffffffffc020264a:	8385                	srli	a5,a5,0x1
ffffffffc020264c:	8b85                	andi	a5,a5,1
ffffffffc020264e:	4a078663          	beqz	a5,ffffffffc0202afa <default_check+0x6d2>
ffffffffc0202652:	0909a703          	lw	a4,144(s3)
ffffffffc0202656:	478d                	li	a5,3
ffffffffc0202658:	4af71163          	bne	a4,a5,ffffffffc0202afa <default_check+0x6d2>
ffffffffc020265c:	450d                	li	a0,3
ffffffffc020265e:	119000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0202662:	8c2a                	mv	s8,a0
ffffffffc0202664:	46050b63          	beqz	a0,ffffffffc0202ada <default_check+0x6b2>
ffffffffc0202668:	4505                	li	a0,1
ffffffffc020266a:	10d000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc020266e:	44051663          	bnez	a0,ffffffffc0202aba <default_check+0x692>
ffffffffc0202672:	438a1463          	bne	s4,s8,ffffffffc0202a9a <default_check+0x672>
ffffffffc0202676:	4585                	li	a1,1
ffffffffc0202678:	854e                	mv	a0,s3
ffffffffc020267a:	185000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc020267e:	458d                	li	a1,3
ffffffffc0202680:	8552                	mv	a0,s4
ffffffffc0202682:	17d000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0202686:	0089b783          	ld	a5,8(s3)
ffffffffc020268a:	04098c13          	addi	s8,s3,64
ffffffffc020268e:	8385                	srli	a5,a5,0x1
ffffffffc0202690:	8b85                	andi	a5,a5,1
ffffffffc0202692:	3e078463          	beqz	a5,ffffffffc0202a7a <default_check+0x652>
ffffffffc0202696:	0109a703          	lw	a4,16(s3)
ffffffffc020269a:	4785                	li	a5,1
ffffffffc020269c:	3cf71f63          	bne	a4,a5,ffffffffc0202a7a <default_check+0x652>
ffffffffc02026a0:	008a3783          	ld	a5,8(s4)
ffffffffc02026a4:	8385                	srli	a5,a5,0x1
ffffffffc02026a6:	8b85                	andi	a5,a5,1
ffffffffc02026a8:	3a078963          	beqz	a5,ffffffffc0202a5a <default_check+0x632>
ffffffffc02026ac:	010a2703          	lw	a4,16(s4)
ffffffffc02026b0:	478d                	li	a5,3
ffffffffc02026b2:	3af71463          	bne	a4,a5,ffffffffc0202a5a <default_check+0x632>
ffffffffc02026b6:	4505                	li	a0,1
ffffffffc02026b8:	0bf000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02026bc:	36a99f63          	bne	s3,a0,ffffffffc0202a3a <default_check+0x612>
ffffffffc02026c0:	4585                	li	a1,1
ffffffffc02026c2:	13d000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc02026c6:	4509                	li	a0,2
ffffffffc02026c8:	0af000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02026cc:	34aa1763          	bne	s4,a0,ffffffffc0202a1a <default_check+0x5f2>
ffffffffc02026d0:	4589                	li	a1,2
ffffffffc02026d2:	12d000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc02026d6:	4585                	li	a1,1
ffffffffc02026d8:	8562                	mv	a0,s8
ffffffffc02026da:	125000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc02026de:	4515                	li	a0,5
ffffffffc02026e0:	097000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02026e4:	89aa                	mv	s3,a0
ffffffffc02026e6:	48050a63          	beqz	a0,ffffffffc0202b7a <default_check+0x752>
ffffffffc02026ea:	4505                	li	a0,1
ffffffffc02026ec:	08b000ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02026f0:	2e051563          	bnez	a0,ffffffffc02029da <default_check+0x5b2>
ffffffffc02026f4:	01092783          	lw	a5,16(s2)
ffffffffc02026f8:	2c079163          	bnez	a5,ffffffffc02029ba <default_check+0x592>
ffffffffc02026fc:	4595                	li	a1,5
ffffffffc02026fe:	854e                	mv	a0,s3
ffffffffc0202700:	00013797          	auipc	a5,0x13
ffffffffc0202704:	ed77a423          	sw	s7,-312(a5) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0202708:	00013797          	auipc	a5,0x13
ffffffffc020270c:	eb67b823          	sd	s6,-336(a5) # ffffffffc02155b8 <free_area>
ffffffffc0202710:	00013797          	auipc	a5,0x13
ffffffffc0202714:	eb57b823          	sd	s5,-336(a5) # ffffffffc02155c0 <free_area+0x8>
ffffffffc0202718:	0e7000ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc020271c:	00893783          	ld	a5,8(s2)
ffffffffc0202720:	01278963          	beq	a5,s2,ffffffffc0202732 <default_check+0x30a>
ffffffffc0202724:	ff87a703          	lw	a4,-8(a5)
ffffffffc0202728:	679c                	ld	a5,8(a5)
ffffffffc020272a:	34fd                	addiw	s1,s1,-1
ffffffffc020272c:	9c19                	subw	s0,s0,a4
ffffffffc020272e:	ff279be3          	bne	a5,s2,ffffffffc0202724 <default_check+0x2fc>
ffffffffc0202732:	26049463          	bnez	s1,ffffffffc020299a <default_check+0x572>
ffffffffc0202736:	46041263          	bnez	s0,ffffffffc0202b9a <default_check+0x772>
ffffffffc020273a:	60a6                	ld	ra,72(sp)
ffffffffc020273c:	6406                	ld	s0,64(sp)
ffffffffc020273e:	74e2                	ld	s1,56(sp)
ffffffffc0202740:	7942                	ld	s2,48(sp)
ffffffffc0202742:	79a2                	ld	s3,40(sp)
ffffffffc0202744:	7a02                	ld	s4,32(sp)
ffffffffc0202746:	6ae2                	ld	s5,24(sp)
ffffffffc0202748:	6b42                	ld	s6,16(sp)
ffffffffc020274a:	6ba2                	ld	s7,8(sp)
ffffffffc020274c:	6c02                	ld	s8,0(sp)
ffffffffc020274e:	6161                	addi	sp,sp,80
ffffffffc0202750:	8082                	ret
ffffffffc0202752:	4981                	li	s3,0
ffffffffc0202754:	4401                	li	s0,0
ffffffffc0202756:	4481                	li	s1,0
ffffffffc0202758:	b30d                	j	ffffffffc020247a <default_check+0x52>
ffffffffc020275a:	00003697          	auipc	a3,0x3
ffffffffc020275e:	53668693          	addi	a3,a3,1334 # ffffffffc0205c90 <commands+0xf60>
ffffffffc0202762:	00003617          	auipc	a2,0x3
ffffffffc0202766:	e2e60613          	addi	a2,a2,-466 # ffffffffc0205590 <commands+0x860>
ffffffffc020276a:	0f000593          	li	a1,240
ffffffffc020276e:	00004517          	auipc	a0,0x4
ffffffffc0202772:	84a50513          	addi	a0,a0,-1974 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202776:	a77fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020277a:	00004697          	auipc	a3,0x4
ffffffffc020277e:	8b668693          	addi	a3,a3,-1866 # ffffffffc0206030 <commands+0x1300>
ffffffffc0202782:	00003617          	auipc	a2,0x3
ffffffffc0202786:	e0e60613          	addi	a2,a2,-498 # ffffffffc0205590 <commands+0x860>
ffffffffc020278a:	0bd00593          	li	a1,189
ffffffffc020278e:	00004517          	auipc	a0,0x4
ffffffffc0202792:	82a50513          	addi	a0,a0,-2006 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202796:	a57fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020279a:	00004697          	auipc	a3,0x4
ffffffffc020279e:	8be68693          	addi	a3,a3,-1858 # ffffffffc0206058 <commands+0x1328>
ffffffffc02027a2:	00003617          	auipc	a2,0x3
ffffffffc02027a6:	dee60613          	addi	a2,a2,-530 # ffffffffc0205590 <commands+0x860>
ffffffffc02027aa:	0be00593          	li	a1,190
ffffffffc02027ae:	00004517          	auipc	a0,0x4
ffffffffc02027b2:	80a50513          	addi	a0,a0,-2038 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02027b6:	a37fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02027ba:	00004697          	auipc	a3,0x4
ffffffffc02027be:	8de68693          	addi	a3,a3,-1826 # ffffffffc0206098 <commands+0x1368>
ffffffffc02027c2:	00003617          	auipc	a2,0x3
ffffffffc02027c6:	dce60613          	addi	a2,a2,-562 # ffffffffc0205590 <commands+0x860>
ffffffffc02027ca:	0c000593          	li	a1,192
ffffffffc02027ce:	00003517          	auipc	a0,0x3
ffffffffc02027d2:	7ea50513          	addi	a0,a0,2026 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02027d6:	a17fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02027da:	00004697          	auipc	a3,0x4
ffffffffc02027de:	94668693          	addi	a3,a3,-1722 # ffffffffc0206120 <commands+0x13f0>
ffffffffc02027e2:	00003617          	auipc	a2,0x3
ffffffffc02027e6:	dae60613          	addi	a2,a2,-594 # ffffffffc0205590 <commands+0x860>
ffffffffc02027ea:	0d900593          	li	a1,217
ffffffffc02027ee:	00003517          	auipc	a0,0x3
ffffffffc02027f2:	7ca50513          	addi	a0,a0,1994 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02027f6:	9f7fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02027fa:	00003697          	auipc	a3,0x3
ffffffffc02027fe:	7d668693          	addi	a3,a3,2006 # ffffffffc0205fd0 <commands+0x12a0>
ffffffffc0202802:	00003617          	auipc	a2,0x3
ffffffffc0202806:	d8e60613          	addi	a2,a2,-626 # ffffffffc0205590 <commands+0x860>
ffffffffc020280a:	0d200593          	li	a1,210
ffffffffc020280e:	00003517          	auipc	a0,0x3
ffffffffc0202812:	7aa50513          	addi	a0,a0,1962 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202816:	9d7fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020281a:	00004697          	auipc	a3,0x4
ffffffffc020281e:	8f668693          	addi	a3,a3,-1802 # ffffffffc0206110 <commands+0x13e0>
ffffffffc0202822:	00003617          	auipc	a2,0x3
ffffffffc0202826:	d6e60613          	addi	a2,a2,-658 # ffffffffc0205590 <commands+0x860>
ffffffffc020282a:	0d000593          	li	a1,208
ffffffffc020282e:	00003517          	auipc	a0,0x3
ffffffffc0202832:	78a50513          	addi	a0,a0,1930 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202836:	9b7fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020283a:	00004697          	auipc	a3,0x4
ffffffffc020283e:	8be68693          	addi	a3,a3,-1858 # ffffffffc02060f8 <commands+0x13c8>
ffffffffc0202842:	00003617          	auipc	a2,0x3
ffffffffc0202846:	d4e60613          	addi	a2,a2,-690 # ffffffffc0205590 <commands+0x860>
ffffffffc020284a:	0cb00593          	li	a1,203
ffffffffc020284e:	00003517          	auipc	a0,0x3
ffffffffc0202852:	76a50513          	addi	a0,a0,1898 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202856:	997fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020285a:	00004697          	auipc	a3,0x4
ffffffffc020285e:	87e68693          	addi	a3,a3,-1922 # ffffffffc02060d8 <commands+0x13a8>
ffffffffc0202862:	00003617          	auipc	a2,0x3
ffffffffc0202866:	d2e60613          	addi	a2,a2,-722 # ffffffffc0205590 <commands+0x860>
ffffffffc020286a:	0c200593          	li	a1,194
ffffffffc020286e:	00003517          	auipc	a0,0x3
ffffffffc0202872:	74a50513          	addi	a0,a0,1866 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202876:	977fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020287a:	00004697          	auipc	a3,0x4
ffffffffc020287e:	8de68693          	addi	a3,a3,-1826 # ffffffffc0206158 <commands+0x1428>
ffffffffc0202882:	00003617          	auipc	a2,0x3
ffffffffc0202886:	d0e60613          	addi	a2,a2,-754 # ffffffffc0205590 <commands+0x860>
ffffffffc020288a:	0f800593          	li	a1,248
ffffffffc020288e:	00003517          	auipc	a0,0x3
ffffffffc0202892:	72a50513          	addi	a0,a0,1834 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202896:	957fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020289a:	00003697          	auipc	a3,0x3
ffffffffc020289e:	59668693          	addi	a3,a3,1430 # ffffffffc0205e30 <commands+0x1100>
ffffffffc02028a2:	00003617          	auipc	a2,0x3
ffffffffc02028a6:	cee60613          	addi	a2,a2,-786 # ffffffffc0205590 <commands+0x860>
ffffffffc02028aa:	0df00593          	li	a1,223
ffffffffc02028ae:	00003517          	auipc	a0,0x3
ffffffffc02028b2:	70a50513          	addi	a0,a0,1802 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02028b6:	937fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02028ba:	00004697          	auipc	a3,0x4
ffffffffc02028be:	83e68693          	addi	a3,a3,-1986 # ffffffffc02060f8 <commands+0x13c8>
ffffffffc02028c2:	00003617          	auipc	a2,0x3
ffffffffc02028c6:	cce60613          	addi	a2,a2,-818 # ffffffffc0205590 <commands+0x860>
ffffffffc02028ca:	0dd00593          	li	a1,221
ffffffffc02028ce:	00003517          	auipc	a0,0x3
ffffffffc02028d2:	6ea50513          	addi	a0,a0,1770 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02028d6:	917fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02028da:	00004697          	auipc	a3,0x4
ffffffffc02028de:	85e68693          	addi	a3,a3,-1954 # ffffffffc0206138 <commands+0x1408>
ffffffffc02028e2:	00003617          	auipc	a2,0x3
ffffffffc02028e6:	cae60613          	addi	a2,a2,-850 # ffffffffc0205590 <commands+0x860>
ffffffffc02028ea:	0dc00593          	li	a1,220
ffffffffc02028ee:	00003517          	auipc	a0,0x3
ffffffffc02028f2:	6ca50513          	addi	a0,a0,1738 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02028f6:	8f7fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02028fa:	00003697          	auipc	a3,0x3
ffffffffc02028fe:	6d668693          	addi	a3,a3,1750 # ffffffffc0205fd0 <commands+0x12a0>
ffffffffc0202902:	00003617          	auipc	a2,0x3
ffffffffc0202906:	c8e60613          	addi	a2,a2,-882 # ffffffffc0205590 <commands+0x860>
ffffffffc020290a:	0b900593          	li	a1,185
ffffffffc020290e:	00003517          	auipc	a0,0x3
ffffffffc0202912:	6aa50513          	addi	a0,a0,1706 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202916:	8d7fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020291a:	00003697          	auipc	a3,0x3
ffffffffc020291e:	7de68693          	addi	a3,a3,2014 # ffffffffc02060f8 <commands+0x13c8>
ffffffffc0202922:	00003617          	auipc	a2,0x3
ffffffffc0202926:	c6e60613          	addi	a2,a2,-914 # ffffffffc0205590 <commands+0x860>
ffffffffc020292a:	0d600593          	li	a1,214
ffffffffc020292e:	00003517          	auipc	a0,0x3
ffffffffc0202932:	68a50513          	addi	a0,a0,1674 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202936:	8b7fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020293a:	00003697          	auipc	a3,0x3
ffffffffc020293e:	6d668693          	addi	a3,a3,1750 # ffffffffc0206010 <commands+0x12e0>
ffffffffc0202942:	00003617          	auipc	a2,0x3
ffffffffc0202946:	c4e60613          	addi	a2,a2,-946 # ffffffffc0205590 <commands+0x860>
ffffffffc020294a:	0d400593          	li	a1,212
ffffffffc020294e:	00003517          	auipc	a0,0x3
ffffffffc0202952:	66a50513          	addi	a0,a0,1642 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202956:	897fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020295a:	00003697          	auipc	a3,0x3
ffffffffc020295e:	69668693          	addi	a3,a3,1686 # ffffffffc0205ff0 <commands+0x12c0>
ffffffffc0202962:	00003617          	auipc	a2,0x3
ffffffffc0202966:	c2e60613          	addi	a2,a2,-978 # ffffffffc0205590 <commands+0x860>
ffffffffc020296a:	0d300593          	li	a1,211
ffffffffc020296e:	00003517          	auipc	a0,0x3
ffffffffc0202972:	64a50513          	addi	a0,a0,1610 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202976:	877fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020297a:	00003697          	auipc	a3,0x3
ffffffffc020297e:	69668693          	addi	a3,a3,1686 # ffffffffc0206010 <commands+0x12e0>
ffffffffc0202982:	00003617          	auipc	a2,0x3
ffffffffc0202986:	c0e60613          	addi	a2,a2,-1010 # ffffffffc0205590 <commands+0x860>
ffffffffc020298a:	0bb00593          	li	a1,187
ffffffffc020298e:	00003517          	auipc	a0,0x3
ffffffffc0202992:	62a50513          	addi	a0,a0,1578 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202996:	857fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020299a:	00004697          	auipc	a3,0x4
ffffffffc020299e:	90e68693          	addi	a3,a3,-1778 # ffffffffc02062a8 <commands+0x1578>
ffffffffc02029a2:	00003617          	auipc	a2,0x3
ffffffffc02029a6:	bee60613          	addi	a2,a2,-1042 # ffffffffc0205590 <commands+0x860>
ffffffffc02029aa:	12500593          	li	a1,293
ffffffffc02029ae:	00003517          	auipc	a0,0x3
ffffffffc02029b2:	60a50513          	addi	a0,a0,1546 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02029b6:	837fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02029ba:	00003697          	auipc	a3,0x3
ffffffffc02029be:	47668693          	addi	a3,a3,1142 # ffffffffc0205e30 <commands+0x1100>
ffffffffc02029c2:	00003617          	auipc	a2,0x3
ffffffffc02029c6:	bce60613          	addi	a2,a2,-1074 # ffffffffc0205590 <commands+0x860>
ffffffffc02029ca:	11a00593          	li	a1,282
ffffffffc02029ce:	00003517          	auipc	a0,0x3
ffffffffc02029d2:	5ea50513          	addi	a0,a0,1514 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02029d6:	817fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02029da:	00003697          	auipc	a3,0x3
ffffffffc02029de:	71e68693          	addi	a3,a3,1822 # ffffffffc02060f8 <commands+0x13c8>
ffffffffc02029e2:	00003617          	auipc	a2,0x3
ffffffffc02029e6:	bae60613          	addi	a2,a2,-1106 # ffffffffc0205590 <commands+0x860>
ffffffffc02029ea:	11800593          	li	a1,280
ffffffffc02029ee:	00003517          	auipc	a0,0x3
ffffffffc02029f2:	5ca50513          	addi	a0,a0,1482 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc02029f6:	ff6fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02029fa:	00003697          	auipc	a3,0x3
ffffffffc02029fe:	6be68693          	addi	a3,a3,1726 # ffffffffc02060b8 <commands+0x1388>
ffffffffc0202a02:	00003617          	auipc	a2,0x3
ffffffffc0202a06:	b8e60613          	addi	a2,a2,-1138 # ffffffffc0205590 <commands+0x860>
ffffffffc0202a0a:	0c100593          	li	a1,193
ffffffffc0202a0e:	00003517          	auipc	a0,0x3
ffffffffc0202a12:	5aa50513          	addi	a0,a0,1450 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202a16:	fd6fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202a1a:	00004697          	auipc	a3,0x4
ffffffffc0202a1e:	84e68693          	addi	a3,a3,-1970 # ffffffffc0206268 <commands+0x1538>
ffffffffc0202a22:	00003617          	auipc	a2,0x3
ffffffffc0202a26:	b6e60613          	addi	a2,a2,-1170 # ffffffffc0205590 <commands+0x860>
ffffffffc0202a2a:	11200593          	li	a1,274
ffffffffc0202a2e:	00003517          	auipc	a0,0x3
ffffffffc0202a32:	58a50513          	addi	a0,a0,1418 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202a36:	fb6fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202a3a:	00004697          	auipc	a3,0x4
ffffffffc0202a3e:	80e68693          	addi	a3,a3,-2034 # ffffffffc0206248 <commands+0x1518>
ffffffffc0202a42:	00003617          	auipc	a2,0x3
ffffffffc0202a46:	b4e60613          	addi	a2,a2,-1202 # ffffffffc0205590 <commands+0x860>
ffffffffc0202a4a:	11000593          	li	a1,272
ffffffffc0202a4e:	00003517          	auipc	a0,0x3
ffffffffc0202a52:	56a50513          	addi	a0,a0,1386 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202a56:	f96fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202a5a:	00003697          	auipc	a3,0x3
ffffffffc0202a5e:	7c668693          	addi	a3,a3,1990 # ffffffffc0206220 <commands+0x14f0>
ffffffffc0202a62:	00003617          	auipc	a2,0x3
ffffffffc0202a66:	b2e60613          	addi	a2,a2,-1234 # ffffffffc0205590 <commands+0x860>
ffffffffc0202a6a:	10e00593          	li	a1,270
ffffffffc0202a6e:	00003517          	auipc	a0,0x3
ffffffffc0202a72:	54a50513          	addi	a0,a0,1354 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202a76:	f76fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202a7a:	00003697          	auipc	a3,0x3
ffffffffc0202a7e:	77e68693          	addi	a3,a3,1918 # ffffffffc02061f8 <commands+0x14c8>
ffffffffc0202a82:	00003617          	auipc	a2,0x3
ffffffffc0202a86:	b0e60613          	addi	a2,a2,-1266 # ffffffffc0205590 <commands+0x860>
ffffffffc0202a8a:	10d00593          	li	a1,269
ffffffffc0202a8e:	00003517          	auipc	a0,0x3
ffffffffc0202a92:	52a50513          	addi	a0,a0,1322 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202a96:	f56fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202a9a:	00003697          	auipc	a3,0x3
ffffffffc0202a9e:	74e68693          	addi	a3,a3,1870 # ffffffffc02061e8 <commands+0x14b8>
ffffffffc0202aa2:	00003617          	auipc	a2,0x3
ffffffffc0202aa6:	aee60613          	addi	a2,a2,-1298 # ffffffffc0205590 <commands+0x860>
ffffffffc0202aaa:	10800593          	li	a1,264
ffffffffc0202aae:	00003517          	auipc	a0,0x3
ffffffffc0202ab2:	50a50513          	addi	a0,a0,1290 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202ab6:	f36fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202aba:	00003697          	auipc	a3,0x3
ffffffffc0202abe:	63e68693          	addi	a3,a3,1598 # ffffffffc02060f8 <commands+0x13c8>
ffffffffc0202ac2:	00003617          	auipc	a2,0x3
ffffffffc0202ac6:	ace60613          	addi	a2,a2,-1330 # ffffffffc0205590 <commands+0x860>
ffffffffc0202aca:	10700593          	li	a1,263
ffffffffc0202ace:	00003517          	auipc	a0,0x3
ffffffffc0202ad2:	4ea50513          	addi	a0,a0,1258 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202ad6:	f16fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202ada:	00003697          	auipc	a3,0x3
ffffffffc0202ade:	6ee68693          	addi	a3,a3,1774 # ffffffffc02061c8 <commands+0x1498>
ffffffffc0202ae2:	00003617          	auipc	a2,0x3
ffffffffc0202ae6:	aae60613          	addi	a2,a2,-1362 # ffffffffc0205590 <commands+0x860>
ffffffffc0202aea:	10600593          	li	a1,262
ffffffffc0202aee:	00003517          	auipc	a0,0x3
ffffffffc0202af2:	4ca50513          	addi	a0,a0,1226 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202af6:	ef6fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202afa:	00003697          	auipc	a3,0x3
ffffffffc0202afe:	69e68693          	addi	a3,a3,1694 # ffffffffc0206198 <commands+0x1468>
ffffffffc0202b02:	00003617          	auipc	a2,0x3
ffffffffc0202b06:	a8e60613          	addi	a2,a2,-1394 # ffffffffc0205590 <commands+0x860>
ffffffffc0202b0a:	10500593          	li	a1,261
ffffffffc0202b0e:	00003517          	auipc	a0,0x3
ffffffffc0202b12:	4aa50513          	addi	a0,a0,1194 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202b16:	ed6fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202b1a:	00003697          	auipc	a3,0x3
ffffffffc0202b1e:	66668693          	addi	a3,a3,1638 # ffffffffc0206180 <commands+0x1450>
ffffffffc0202b22:	00003617          	auipc	a2,0x3
ffffffffc0202b26:	a6e60613          	addi	a2,a2,-1426 # ffffffffc0205590 <commands+0x860>
ffffffffc0202b2a:	10400593          	li	a1,260
ffffffffc0202b2e:	00003517          	auipc	a0,0x3
ffffffffc0202b32:	48a50513          	addi	a0,a0,1162 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202b36:	eb6fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202b3a:	00003697          	auipc	a3,0x3
ffffffffc0202b3e:	5be68693          	addi	a3,a3,1470 # ffffffffc02060f8 <commands+0x13c8>
ffffffffc0202b42:	00003617          	auipc	a2,0x3
ffffffffc0202b46:	a4e60613          	addi	a2,a2,-1458 # ffffffffc0205590 <commands+0x860>
ffffffffc0202b4a:	0fe00593          	li	a1,254
ffffffffc0202b4e:	00003517          	auipc	a0,0x3
ffffffffc0202b52:	46a50513          	addi	a0,a0,1130 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202b56:	e96fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202b5a:	00003697          	auipc	a3,0x3
ffffffffc0202b5e:	60e68693          	addi	a3,a3,1550 # ffffffffc0206168 <commands+0x1438>
ffffffffc0202b62:	00003617          	auipc	a2,0x3
ffffffffc0202b66:	a2e60613          	addi	a2,a2,-1490 # ffffffffc0205590 <commands+0x860>
ffffffffc0202b6a:	0f900593          	li	a1,249
ffffffffc0202b6e:	00003517          	auipc	a0,0x3
ffffffffc0202b72:	44a50513          	addi	a0,a0,1098 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202b76:	e76fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202b7a:	00003697          	auipc	a3,0x3
ffffffffc0202b7e:	70e68693          	addi	a3,a3,1806 # ffffffffc0206288 <commands+0x1558>
ffffffffc0202b82:	00003617          	auipc	a2,0x3
ffffffffc0202b86:	a0e60613          	addi	a2,a2,-1522 # ffffffffc0205590 <commands+0x860>
ffffffffc0202b8a:	11700593          	li	a1,279
ffffffffc0202b8e:	00003517          	auipc	a0,0x3
ffffffffc0202b92:	42a50513          	addi	a0,a0,1066 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202b96:	e56fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202b9a:	00003697          	auipc	a3,0x3
ffffffffc0202b9e:	71e68693          	addi	a3,a3,1822 # ffffffffc02062b8 <commands+0x1588>
ffffffffc0202ba2:	00003617          	auipc	a2,0x3
ffffffffc0202ba6:	9ee60613          	addi	a2,a2,-1554 # ffffffffc0205590 <commands+0x860>
ffffffffc0202baa:	12600593          	li	a1,294
ffffffffc0202bae:	00003517          	auipc	a0,0x3
ffffffffc0202bb2:	40a50513          	addi	a0,a0,1034 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202bb6:	e36fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202bba:	00003697          	auipc	a3,0x3
ffffffffc0202bbe:	0e668693          	addi	a3,a3,230 # ffffffffc0205ca0 <commands+0xf70>
ffffffffc0202bc2:	00003617          	auipc	a2,0x3
ffffffffc0202bc6:	9ce60613          	addi	a2,a2,-1586 # ffffffffc0205590 <commands+0x860>
ffffffffc0202bca:	0f300593          	li	a1,243
ffffffffc0202bce:	00003517          	auipc	a0,0x3
ffffffffc0202bd2:	3ea50513          	addi	a0,a0,1002 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202bd6:	e16fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202bda:	00003697          	auipc	a3,0x3
ffffffffc0202bde:	41668693          	addi	a3,a3,1046 # ffffffffc0205ff0 <commands+0x12c0>
ffffffffc0202be2:	00003617          	auipc	a2,0x3
ffffffffc0202be6:	9ae60613          	addi	a2,a2,-1618 # ffffffffc0205590 <commands+0x860>
ffffffffc0202bea:	0ba00593          	li	a1,186
ffffffffc0202bee:	00003517          	auipc	a0,0x3
ffffffffc0202bf2:	3ca50513          	addi	a0,a0,970 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202bf6:	df6fd0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0202bfa <default_free_pages>:
ffffffffc0202bfa:	1141                	addi	sp,sp,-16
ffffffffc0202bfc:	e406                	sd	ra,8(sp)
ffffffffc0202bfe:	16058e63          	beqz	a1,ffffffffc0202d7a <default_free_pages+0x180>
ffffffffc0202c02:	00659693          	slli	a3,a1,0x6
ffffffffc0202c06:	96aa                	add	a3,a3,a0
ffffffffc0202c08:	02d50d63          	beq	a0,a3,ffffffffc0202c42 <default_free_pages+0x48>
ffffffffc0202c0c:	651c                	ld	a5,8(a0)
ffffffffc0202c0e:	8b85                	andi	a5,a5,1
ffffffffc0202c10:	14079563          	bnez	a5,ffffffffc0202d5a <default_free_pages+0x160>
ffffffffc0202c14:	651c                	ld	a5,8(a0)
ffffffffc0202c16:	8385                	srli	a5,a5,0x1
ffffffffc0202c18:	8b85                	andi	a5,a5,1
ffffffffc0202c1a:	14079063          	bnez	a5,ffffffffc0202d5a <default_free_pages+0x160>
ffffffffc0202c1e:	87aa                	mv	a5,a0
ffffffffc0202c20:	a809                	j	ffffffffc0202c32 <default_free_pages+0x38>
ffffffffc0202c22:	6798                	ld	a4,8(a5)
ffffffffc0202c24:	8b05                	andi	a4,a4,1
ffffffffc0202c26:	12071a63          	bnez	a4,ffffffffc0202d5a <default_free_pages+0x160>
ffffffffc0202c2a:	6798                	ld	a4,8(a5)
ffffffffc0202c2c:	8b09                	andi	a4,a4,2
ffffffffc0202c2e:	12071663          	bnez	a4,ffffffffc0202d5a <default_free_pages+0x160>
ffffffffc0202c32:	0007b423          	sd	zero,8(a5)
ffffffffc0202c36:	0007a023          	sw	zero,0(a5)
ffffffffc0202c3a:	04078793          	addi	a5,a5,64
ffffffffc0202c3e:	fed792e3          	bne	a5,a3,ffffffffc0202c22 <default_free_pages+0x28>
ffffffffc0202c42:	2581                	sext.w	a1,a1
ffffffffc0202c44:	c90c                	sw	a1,16(a0)
ffffffffc0202c46:	00850893          	addi	a7,a0,8
ffffffffc0202c4a:	4789                	li	a5,2
ffffffffc0202c4c:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0202c50:	00013697          	auipc	a3,0x13
ffffffffc0202c54:	96868693          	addi	a3,a3,-1688 # ffffffffc02155b8 <free_area>
ffffffffc0202c58:	4a98                	lw	a4,16(a3)
ffffffffc0202c5a:	669c                	ld	a5,8(a3)
ffffffffc0202c5c:	9db9                	addw	a1,a1,a4
ffffffffc0202c5e:	00013717          	auipc	a4,0x13
ffffffffc0202c62:	96b72523          	sw	a1,-1686(a4) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0202c66:	0cd78163          	beq	a5,a3,ffffffffc0202d28 <default_free_pages+0x12e>
ffffffffc0202c6a:	fe878713          	addi	a4,a5,-24
ffffffffc0202c6e:	628c                	ld	a1,0(a3)
ffffffffc0202c70:	4801                	li	a6,0
ffffffffc0202c72:	01850613          	addi	a2,a0,24
ffffffffc0202c76:	00e56a63          	bltu	a0,a4,ffffffffc0202c8a <default_free_pages+0x90>
ffffffffc0202c7a:	6798                	ld	a4,8(a5)
ffffffffc0202c7c:	04d70f63          	beq	a4,a3,ffffffffc0202cda <default_free_pages+0xe0>
ffffffffc0202c80:	87ba                	mv	a5,a4
ffffffffc0202c82:	fe878713          	addi	a4,a5,-24
ffffffffc0202c86:	fee57ae3          	bgeu	a0,a4,ffffffffc0202c7a <default_free_pages+0x80>
ffffffffc0202c8a:	00080663          	beqz	a6,ffffffffc0202c96 <default_free_pages+0x9c>
ffffffffc0202c8e:	00013817          	auipc	a6,0x13
ffffffffc0202c92:	92b83523          	sd	a1,-1750(a6) # ffffffffc02155b8 <free_area>
ffffffffc0202c96:	638c                	ld	a1,0(a5)
ffffffffc0202c98:	e390                	sd	a2,0(a5)
ffffffffc0202c9a:	e590                	sd	a2,8(a1)
ffffffffc0202c9c:	f11c                	sd	a5,32(a0)
ffffffffc0202c9e:	ed0c                	sd	a1,24(a0)
ffffffffc0202ca0:	06d58a63          	beq	a1,a3,ffffffffc0202d14 <default_free_pages+0x11a>
ffffffffc0202ca4:	ff85a603          	lw	a2,-8(a1) # ff8 <BASE_ADDRESS-0xffffffffc01ff008>
ffffffffc0202ca8:	fe858713          	addi	a4,a1,-24
ffffffffc0202cac:	02061793          	slli	a5,a2,0x20
ffffffffc0202cb0:	83e9                	srli	a5,a5,0x1a
ffffffffc0202cb2:	97ba                	add	a5,a5,a4
ffffffffc0202cb4:	04f51b63          	bne	a0,a5,ffffffffc0202d0a <default_free_pages+0x110>
ffffffffc0202cb8:	491c                	lw	a5,16(a0)
ffffffffc0202cba:	9e3d                	addw	a2,a2,a5
ffffffffc0202cbc:	fec5ac23          	sw	a2,-8(a1)
ffffffffc0202cc0:	57f5                	li	a5,-3
ffffffffc0202cc2:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0202cc6:	01853803          	ld	a6,24(a0)
ffffffffc0202cca:	7110                	ld	a2,32(a0)
ffffffffc0202ccc:	853a                	mv	a0,a4
ffffffffc0202cce:	00c83423          	sd	a2,8(a6)
ffffffffc0202cd2:	659c                	ld	a5,8(a1)
ffffffffc0202cd4:	01063023          	sd	a6,0(a2)
ffffffffc0202cd8:	a815                	j	ffffffffc0202d0c <default_free_pages+0x112>
ffffffffc0202cda:	e790                	sd	a2,8(a5)
ffffffffc0202cdc:	f114                	sd	a3,32(a0)
ffffffffc0202cde:	6798                	ld	a4,8(a5)
ffffffffc0202ce0:	ed1c                	sd	a5,24(a0)
ffffffffc0202ce2:	85b2                	mv	a1,a2
ffffffffc0202ce4:	00d70563          	beq	a4,a3,ffffffffc0202cee <default_free_pages+0xf4>
ffffffffc0202ce8:	4805                	li	a6,1
ffffffffc0202cea:	87ba                	mv	a5,a4
ffffffffc0202cec:	bf59                	j	ffffffffc0202c82 <default_free_pages+0x88>
ffffffffc0202cee:	e290                	sd	a2,0(a3)
ffffffffc0202cf0:	85be                	mv	a1,a5
ffffffffc0202cf2:	00d78d63          	beq	a5,a3,ffffffffc0202d0c <default_free_pages+0x112>
ffffffffc0202cf6:	ff85a603          	lw	a2,-8(a1)
ffffffffc0202cfa:	fe858713          	addi	a4,a1,-24
ffffffffc0202cfe:	02061793          	slli	a5,a2,0x20
ffffffffc0202d02:	83e9                	srli	a5,a5,0x1a
ffffffffc0202d04:	97ba                	add	a5,a5,a4
ffffffffc0202d06:	faf509e3          	beq	a0,a5,ffffffffc0202cb8 <default_free_pages+0xbe>
ffffffffc0202d0a:	711c                	ld	a5,32(a0)
ffffffffc0202d0c:	fe878713          	addi	a4,a5,-24
ffffffffc0202d10:	00d78963          	beq	a5,a3,ffffffffc0202d22 <default_free_pages+0x128>
ffffffffc0202d14:	4910                	lw	a2,16(a0)
ffffffffc0202d16:	02061693          	slli	a3,a2,0x20
ffffffffc0202d1a:	82e9                	srli	a3,a3,0x1a
ffffffffc0202d1c:	96aa                	add	a3,a3,a0
ffffffffc0202d1e:	00d70e63          	beq	a4,a3,ffffffffc0202d3a <default_free_pages+0x140>
ffffffffc0202d22:	60a2                	ld	ra,8(sp)
ffffffffc0202d24:	0141                	addi	sp,sp,16
ffffffffc0202d26:	8082                	ret
ffffffffc0202d28:	60a2                	ld	ra,8(sp)
ffffffffc0202d2a:	01850713          	addi	a4,a0,24
ffffffffc0202d2e:	e398                	sd	a4,0(a5)
ffffffffc0202d30:	e798                	sd	a4,8(a5)
ffffffffc0202d32:	f11c                	sd	a5,32(a0)
ffffffffc0202d34:	ed1c                	sd	a5,24(a0)
ffffffffc0202d36:	0141                	addi	sp,sp,16
ffffffffc0202d38:	8082                	ret
ffffffffc0202d3a:	ff87a703          	lw	a4,-8(a5)
ffffffffc0202d3e:	ff078693          	addi	a3,a5,-16
ffffffffc0202d42:	9e39                	addw	a2,a2,a4
ffffffffc0202d44:	c910                	sw	a2,16(a0)
ffffffffc0202d46:	5775                	li	a4,-3
ffffffffc0202d48:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0202d4c:	6398                	ld	a4,0(a5)
ffffffffc0202d4e:	679c                	ld	a5,8(a5)
ffffffffc0202d50:	60a2                	ld	ra,8(sp)
ffffffffc0202d52:	e71c                	sd	a5,8(a4)
ffffffffc0202d54:	e398                	sd	a4,0(a5)
ffffffffc0202d56:	0141                	addi	sp,sp,16
ffffffffc0202d58:	8082                	ret
ffffffffc0202d5a:	00003697          	auipc	a3,0x3
ffffffffc0202d5e:	56e68693          	addi	a3,a3,1390 # ffffffffc02062c8 <commands+0x1598>
ffffffffc0202d62:	00003617          	auipc	a2,0x3
ffffffffc0202d66:	82e60613          	addi	a2,a2,-2002 # ffffffffc0205590 <commands+0x860>
ffffffffc0202d6a:	08300593          	li	a1,131
ffffffffc0202d6e:	00003517          	auipc	a0,0x3
ffffffffc0202d72:	24a50513          	addi	a0,a0,586 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202d76:	c76fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202d7a:	00003697          	auipc	a3,0x3
ffffffffc0202d7e:	57668693          	addi	a3,a3,1398 # ffffffffc02062f0 <commands+0x15c0>
ffffffffc0202d82:	00003617          	auipc	a2,0x3
ffffffffc0202d86:	80e60613          	addi	a2,a2,-2034 # ffffffffc0205590 <commands+0x860>
ffffffffc0202d8a:	08000593          	li	a1,128
ffffffffc0202d8e:	00003517          	auipc	a0,0x3
ffffffffc0202d92:	22a50513          	addi	a0,a0,554 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202d96:	c56fd0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0202d9a <default_alloc_pages>:
ffffffffc0202d9a:	c959                	beqz	a0,ffffffffc0202e30 <default_alloc_pages+0x96>
ffffffffc0202d9c:	00013597          	auipc	a1,0x13
ffffffffc0202da0:	81c58593          	addi	a1,a1,-2020 # ffffffffc02155b8 <free_area>
ffffffffc0202da4:	0105a803          	lw	a6,16(a1)
ffffffffc0202da8:	862a                	mv	a2,a0
ffffffffc0202daa:	02081793          	slli	a5,a6,0x20
ffffffffc0202dae:	9381                	srli	a5,a5,0x20
ffffffffc0202db0:	00a7ee63          	bltu	a5,a0,ffffffffc0202dcc <default_alloc_pages+0x32>
ffffffffc0202db4:	87ae                	mv	a5,a1
ffffffffc0202db6:	a801                	j	ffffffffc0202dc6 <default_alloc_pages+0x2c>
ffffffffc0202db8:	ff87a703          	lw	a4,-8(a5)
ffffffffc0202dbc:	02071693          	slli	a3,a4,0x20
ffffffffc0202dc0:	9281                	srli	a3,a3,0x20
ffffffffc0202dc2:	00c6f763          	bgeu	a3,a2,ffffffffc0202dd0 <default_alloc_pages+0x36>
ffffffffc0202dc6:	679c                	ld	a5,8(a5)
ffffffffc0202dc8:	feb798e3          	bne	a5,a1,ffffffffc0202db8 <default_alloc_pages+0x1e>
ffffffffc0202dcc:	4501                	li	a0,0
ffffffffc0202dce:	8082                	ret
ffffffffc0202dd0:	fe878513          	addi	a0,a5,-24
ffffffffc0202dd4:	dd6d                	beqz	a0,ffffffffc0202dce <default_alloc_pages+0x34>
ffffffffc0202dd6:	0007b883          	ld	a7,0(a5)
ffffffffc0202dda:	0087b303          	ld	t1,8(a5)
ffffffffc0202dde:	00060e1b          	sext.w	t3,a2
ffffffffc0202de2:	0068b423          	sd	t1,8(a7)
ffffffffc0202de6:	01133023          	sd	a7,0(t1)
ffffffffc0202dea:	02d67863          	bgeu	a2,a3,ffffffffc0202e1a <default_alloc_pages+0x80>
ffffffffc0202dee:	061a                	slli	a2,a2,0x6
ffffffffc0202df0:	962a                	add	a2,a2,a0
ffffffffc0202df2:	41c7073b          	subw	a4,a4,t3
ffffffffc0202df6:	ca18                	sw	a4,16(a2)
ffffffffc0202df8:	00860693          	addi	a3,a2,8
ffffffffc0202dfc:	4709                	li	a4,2
ffffffffc0202dfe:	40e6b02f          	amoor.d	zero,a4,(a3)
ffffffffc0202e02:	0088b703          	ld	a4,8(a7)
ffffffffc0202e06:	01860693          	addi	a3,a2,24
ffffffffc0202e0a:	0105a803          	lw	a6,16(a1)
ffffffffc0202e0e:	e314                	sd	a3,0(a4)
ffffffffc0202e10:	00d8b423          	sd	a3,8(a7)
ffffffffc0202e14:	f218                	sd	a4,32(a2)
ffffffffc0202e16:	01163c23          	sd	a7,24(a2)
ffffffffc0202e1a:	41c8083b          	subw	a6,a6,t3
ffffffffc0202e1e:	00012717          	auipc	a4,0x12
ffffffffc0202e22:	7b072523          	sw	a6,1962(a4) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0202e26:	5775                	li	a4,-3
ffffffffc0202e28:	17c1                	addi	a5,a5,-16
ffffffffc0202e2a:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0202e2e:	8082                	ret
ffffffffc0202e30:	1141                	addi	sp,sp,-16
ffffffffc0202e32:	00003697          	auipc	a3,0x3
ffffffffc0202e36:	4be68693          	addi	a3,a3,1214 # ffffffffc02062f0 <commands+0x15c0>
ffffffffc0202e3a:	00002617          	auipc	a2,0x2
ffffffffc0202e3e:	75660613          	addi	a2,a2,1878 # ffffffffc0205590 <commands+0x860>
ffffffffc0202e42:	06200593          	li	a1,98
ffffffffc0202e46:	00003517          	auipc	a0,0x3
ffffffffc0202e4a:	17250513          	addi	a0,a0,370 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202e4e:	e406                	sd	ra,8(sp)
ffffffffc0202e50:	b9cfd0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0202e54 <default_init_memmap>:
ffffffffc0202e54:	1141                	addi	sp,sp,-16
ffffffffc0202e56:	e406                	sd	ra,8(sp)
ffffffffc0202e58:	c1ed                	beqz	a1,ffffffffc0202f3a <default_init_memmap+0xe6>
ffffffffc0202e5a:	00659693          	slli	a3,a1,0x6
ffffffffc0202e5e:	96aa                	add	a3,a3,a0
ffffffffc0202e60:	02d50463          	beq	a0,a3,ffffffffc0202e88 <default_init_memmap+0x34>
ffffffffc0202e64:	6518                	ld	a4,8(a0)
ffffffffc0202e66:	87aa                	mv	a5,a0
ffffffffc0202e68:	8b05                	andi	a4,a4,1
ffffffffc0202e6a:	e709                	bnez	a4,ffffffffc0202e74 <default_init_memmap+0x20>
ffffffffc0202e6c:	a07d                	j	ffffffffc0202f1a <default_init_memmap+0xc6>
ffffffffc0202e6e:	6798                	ld	a4,8(a5)
ffffffffc0202e70:	8b05                	andi	a4,a4,1
ffffffffc0202e72:	c745                	beqz	a4,ffffffffc0202f1a <default_init_memmap+0xc6>
ffffffffc0202e74:	0007a823          	sw	zero,16(a5)
ffffffffc0202e78:	0007b423          	sd	zero,8(a5)
ffffffffc0202e7c:	0007a023          	sw	zero,0(a5)
ffffffffc0202e80:	04078793          	addi	a5,a5,64
ffffffffc0202e84:	fed795e3          	bne	a5,a3,ffffffffc0202e6e <default_init_memmap+0x1a>
ffffffffc0202e88:	2581                	sext.w	a1,a1
ffffffffc0202e8a:	c90c                	sw	a1,16(a0)
ffffffffc0202e8c:	4789                	li	a5,2
ffffffffc0202e8e:	00850713          	addi	a4,a0,8
ffffffffc0202e92:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0202e96:	00012697          	auipc	a3,0x12
ffffffffc0202e9a:	72268693          	addi	a3,a3,1826 # ffffffffc02155b8 <free_area>
ffffffffc0202e9e:	4a98                	lw	a4,16(a3)
ffffffffc0202ea0:	669c                	ld	a5,8(a3)
ffffffffc0202ea2:	9db9                	addw	a1,a1,a4
ffffffffc0202ea4:	00012717          	auipc	a4,0x12
ffffffffc0202ea8:	72b72223          	sw	a1,1828(a4) # ffffffffc02155c8 <free_area+0x10>
ffffffffc0202eac:	04d78a63          	beq	a5,a3,ffffffffc0202f00 <default_init_memmap+0xac>
ffffffffc0202eb0:	fe878713          	addi	a4,a5,-24
ffffffffc0202eb4:	628c                	ld	a1,0(a3)
ffffffffc0202eb6:	4801                	li	a6,0
ffffffffc0202eb8:	01850613          	addi	a2,a0,24
ffffffffc0202ebc:	00e56a63          	bltu	a0,a4,ffffffffc0202ed0 <default_init_memmap+0x7c>
ffffffffc0202ec0:	6798                	ld	a4,8(a5)
ffffffffc0202ec2:	02d70563          	beq	a4,a3,ffffffffc0202eec <default_init_memmap+0x98>
ffffffffc0202ec6:	87ba                	mv	a5,a4
ffffffffc0202ec8:	fe878713          	addi	a4,a5,-24
ffffffffc0202ecc:	fee57ae3          	bgeu	a0,a4,ffffffffc0202ec0 <default_init_memmap+0x6c>
ffffffffc0202ed0:	00080663          	beqz	a6,ffffffffc0202edc <default_init_memmap+0x88>
ffffffffc0202ed4:	00012717          	auipc	a4,0x12
ffffffffc0202ed8:	6eb73223          	sd	a1,1764(a4) # ffffffffc02155b8 <free_area>
ffffffffc0202edc:	6398                	ld	a4,0(a5)
ffffffffc0202ede:	60a2                	ld	ra,8(sp)
ffffffffc0202ee0:	e390                	sd	a2,0(a5)
ffffffffc0202ee2:	e710                	sd	a2,8(a4)
ffffffffc0202ee4:	f11c                	sd	a5,32(a0)
ffffffffc0202ee6:	ed18                	sd	a4,24(a0)
ffffffffc0202ee8:	0141                	addi	sp,sp,16
ffffffffc0202eea:	8082                	ret
ffffffffc0202eec:	e790                	sd	a2,8(a5)
ffffffffc0202eee:	f114                	sd	a3,32(a0)
ffffffffc0202ef0:	6798                	ld	a4,8(a5)
ffffffffc0202ef2:	ed1c                	sd	a5,24(a0)
ffffffffc0202ef4:	85b2                	mv	a1,a2
ffffffffc0202ef6:	00d70e63          	beq	a4,a3,ffffffffc0202f12 <default_init_memmap+0xbe>
ffffffffc0202efa:	4805                	li	a6,1
ffffffffc0202efc:	87ba                	mv	a5,a4
ffffffffc0202efe:	b7e9                	j	ffffffffc0202ec8 <default_init_memmap+0x74>
ffffffffc0202f00:	60a2                	ld	ra,8(sp)
ffffffffc0202f02:	01850713          	addi	a4,a0,24
ffffffffc0202f06:	e398                	sd	a4,0(a5)
ffffffffc0202f08:	e798                	sd	a4,8(a5)
ffffffffc0202f0a:	f11c                	sd	a5,32(a0)
ffffffffc0202f0c:	ed1c                	sd	a5,24(a0)
ffffffffc0202f0e:	0141                	addi	sp,sp,16
ffffffffc0202f10:	8082                	ret
ffffffffc0202f12:	60a2                	ld	ra,8(sp)
ffffffffc0202f14:	e290                	sd	a2,0(a3)
ffffffffc0202f16:	0141                	addi	sp,sp,16
ffffffffc0202f18:	8082                	ret
ffffffffc0202f1a:	00003697          	auipc	a3,0x3
ffffffffc0202f1e:	3de68693          	addi	a3,a3,990 # ffffffffc02062f8 <commands+0x15c8>
ffffffffc0202f22:	00002617          	auipc	a2,0x2
ffffffffc0202f26:	66e60613          	addi	a2,a2,1646 # ffffffffc0205590 <commands+0x860>
ffffffffc0202f2a:	04900593          	li	a1,73
ffffffffc0202f2e:	00003517          	auipc	a0,0x3
ffffffffc0202f32:	08a50513          	addi	a0,a0,138 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202f36:	ab6fd0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0202f3a:	00003697          	auipc	a3,0x3
ffffffffc0202f3e:	3b668693          	addi	a3,a3,950 # ffffffffc02062f0 <commands+0x15c0>
ffffffffc0202f42:	00002617          	auipc	a2,0x2
ffffffffc0202f46:	64e60613          	addi	a2,a2,1614 # ffffffffc0205590 <commands+0x860>
ffffffffc0202f4a:	04600593          	li	a1,70
ffffffffc0202f4e:	00003517          	auipc	a0,0x3
ffffffffc0202f52:	06a50513          	addi	a0,a0,106 # ffffffffc0205fb8 <commands+0x1288>
ffffffffc0202f56:	a96fd0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0202f5a <pa2page.part.4>:
ffffffffc0202f5a:	1141                	addi	sp,sp,-16
ffffffffc0202f5c:	00003617          	auipc	a2,0x3
ffffffffc0202f60:	94460613          	addi	a2,a2,-1724 # ffffffffc02058a0 <commands+0xb70>
ffffffffc0202f64:	06200593          	li	a1,98
ffffffffc0202f68:	00003517          	auipc	a0,0x3
ffffffffc0202f6c:	95850513          	addi	a0,a0,-1704 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0202f70:	e406                	sd	ra,8(sp)
ffffffffc0202f72:	a7afd0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0202f76 <alloc_pages>:
ffffffffc0202f76:	715d                	addi	sp,sp,-80
ffffffffc0202f78:	e0a2                	sd	s0,64(sp)
ffffffffc0202f7a:	fc26                	sd	s1,56(sp)
ffffffffc0202f7c:	f84a                	sd	s2,48(sp)
ffffffffc0202f7e:	f44e                	sd	s3,40(sp)
ffffffffc0202f80:	f052                	sd	s4,32(sp)
ffffffffc0202f82:	ec56                	sd	s5,24(sp)
ffffffffc0202f84:	e486                	sd	ra,72(sp)
ffffffffc0202f86:	842a                	mv	s0,a0
ffffffffc0202f88:	00012497          	auipc	s1,0x12
ffffffffc0202f8c:	64848493          	addi	s1,s1,1608 # ffffffffc02155d0 <pmm_manager>
ffffffffc0202f90:	4985                	li	s3,1
ffffffffc0202f92:	00012a17          	auipc	s4,0x12
ffffffffc0202f96:	506a0a13          	addi	s4,s4,1286 # ffffffffc0215498 <swap_init_ok>
ffffffffc0202f9a:	0005091b          	sext.w	s2,a0
ffffffffc0202f9e:	00012a97          	auipc	s5,0x12
ffffffffc0202fa2:	53aa8a93          	addi	s5,s5,1338 # ffffffffc02154d8 <check_mm_struct>
ffffffffc0202fa6:	a00d                	j	ffffffffc0202fc8 <alloc_pages+0x52>
ffffffffc0202fa8:	609c                	ld	a5,0(s1)
ffffffffc0202faa:	6f9c                	ld	a5,24(a5)
ffffffffc0202fac:	9782                	jalr	a5
ffffffffc0202fae:	4601                	li	a2,0
ffffffffc0202fb0:	85ca                	mv	a1,s2
ffffffffc0202fb2:	ed0d                	bnez	a0,ffffffffc0202fec <alloc_pages+0x76>
ffffffffc0202fb4:	0289ec63          	bltu	s3,s0,ffffffffc0202fec <alloc_pages+0x76>
ffffffffc0202fb8:	000a2783          	lw	a5,0(s4)
ffffffffc0202fbc:	2781                	sext.w	a5,a5
ffffffffc0202fbe:	c79d                	beqz	a5,ffffffffc0202fec <alloc_pages+0x76>
ffffffffc0202fc0:	000ab503          	ld	a0,0(s5)
ffffffffc0202fc4:	abaff0ef          	jal	ra,ffffffffc020227e <swap_out>
ffffffffc0202fc8:	100027f3          	csrr	a5,sstatus
ffffffffc0202fcc:	8b89                	andi	a5,a5,2
ffffffffc0202fce:	8522                	mv	a0,s0
ffffffffc0202fd0:	dfe1                	beqz	a5,ffffffffc0202fa8 <alloc_pages+0x32>
ffffffffc0202fd2:	e18fd0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0202fd6:	609c                	ld	a5,0(s1)
ffffffffc0202fd8:	8522                	mv	a0,s0
ffffffffc0202fda:	6f9c                	ld	a5,24(a5)
ffffffffc0202fdc:	9782                	jalr	a5
ffffffffc0202fde:	e42a                	sd	a0,8(sp)
ffffffffc0202fe0:	e04fd0ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc0202fe4:	6522                	ld	a0,8(sp)
ffffffffc0202fe6:	4601                	li	a2,0
ffffffffc0202fe8:	85ca                	mv	a1,s2
ffffffffc0202fea:	d569                	beqz	a0,ffffffffc0202fb4 <alloc_pages+0x3e>
ffffffffc0202fec:	60a6                	ld	ra,72(sp)
ffffffffc0202fee:	6406                	ld	s0,64(sp)
ffffffffc0202ff0:	74e2                	ld	s1,56(sp)
ffffffffc0202ff2:	7942                	ld	s2,48(sp)
ffffffffc0202ff4:	79a2                	ld	s3,40(sp)
ffffffffc0202ff6:	7a02                	ld	s4,32(sp)
ffffffffc0202ff8:	6ae2                	ld	s5,24(sp)
ffffffffc0202ffa:	6161                	addi	sp,sp,80
ffffffffc0202ffc:	8082                	ret

ffffffffc0202ffe <free_pages>:
ffffffffc0202ffe:	100027f3          	csrr	a5,sstatus
ffffffffc0203002:	8b89                	andi	a5,a5,2
ffffffffc0203004:	eb89                	bnez	a5,ffffffffc0203016 <free_pages+0x18>
ffffffffc0203006:	00012797          	auipc	a5,0x12
ffffffffc020300a:	5ca78793          	addi	a5,a5,1482 # ffffffffc02155d0 <pmm_manager>
ffffffffc020300e:	639c                	ld	a5,0(a5)
ffffffffc0203010:	0207b303          	ld	t1,32(a5)
ffffffffc0203014:	8302                	jr	t1
ffffffffc0203016:	1101                	addi	sp,sp,-32
ffffffffc0203018:	ec06                	sd	ra,24(sp)
ffffffffc020301a:	e822                	sd	s0,16(sp)
ffffffffc020301c:	e426                	sd	s1,8(sp)
ffffffffc020301e:	842a                	mv	s0,a0
ffffffffc0203020:	84ae                	mv	s1,a1
ffffffffc0203022:	dc8fd0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0203026:	00012797          	auipc	a5,0x12
ffffffffc020302a:	5aa78793          	addi	a5,a5,1450 # ffffffffc02155d0 <pmm_manager>
ffffffffc020302e:	639c                	ld	a5,0(a5)
ffffffffc0203030:	85a6                	mv	a1,s1
ffffffffc0203032:	8522                	mv	a0,s0
ffffffffc0203034:	739c                	ld	a5,32(a5)
ffffffffc0203036:	9782                	jalr	a5
ffffffffc0203038:	6442                	ld	s0,16(sp)
ffffffffc020303a:	60e2                	ld	ra,24(sp)
ffffffffc020303c:	64a2                	ld	s1,8(sp)
ffffffffc020303e:	6105                	addi	sp,sp,32
ffffffffc0203040:	da4fd06f          	j	ffffffffc02005e4 <intr_enable>

ffffffffc0203044 <nr_free_pages>:
ffffffffc0203044:	100027f3          	csrr	a5,sstatus
ffffffffc0203048:	8b89                	andi	a5,a5,2
ffffffffc020304a:	eb89                	bnez	a5,ffffffffc020305c <nr_free_pages+0x18>
ffffffffc020304c:	00012797          	auipc	a5,0x12
ffffffffc0203050:	58478793          	addi	a5,a5,1412 # ffffffffc02155d0 <pmm_manager>
ffffffffc0203054:	639c                	ld	a5,0(a5)
ffffffffc0203056:	0287b303          	ld	t1,40(a5)
ffffffffc020305a:	8302                	jr	t1
ffffffffc020305c:	1141                	addi	sp,sp,-16
ffffffffc020305e:	e406                	sd	ra,8(sp)
ffffffffc0203060:	e022                	sd	s0,0(sp)
ffffffffc0203062:	d88fd0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0203066:	00012797          	auipc	a5,0x12
ffffffffc020306a:	56a78793          	addi	a5,a5,1386 # ffffffffc02155d0 <pmm_manager>
ffffffffc020306e:	639c                	ld	a5,0(a5)
ffffffffc0203070:	779c                	ld	a5,40(a5)
ffffffffc0203072:	9782                	jalr	a5
ffffffffc0203074:	842a                	mv	s0,a0
ffffffffc0203076:	d6efd0ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc020307a:	8522                	mv	a0,s0
ffffffffc020307c:	60a2                	ld	ra,8(sp)
ffffffffc020307e:	6402                	ld	s0,0(sp)
ffffffffc0203080:	0141                	addi	sp,sp,16
ffffffffc0203082:	8082                	ret

ffffffffc0203084 <get_pte>:
ffffffffc0203084:	7139                	addi	sp,sp,-64
ffffffffc0203086:	f426                	sd	s1,40(sp)
ffffffffc0203088:	01e5d493          	srli	s1,a1,0x1e
ffffffffc020308c:	1ff4f493          	andi	s1,s1,511
ffffffffc0203090:	048e                	slli	s1,s1,0x3
ffffffffc0203092:	94aa                	add	s1,s1,a0
ffffffffc0203094:	6094                	ld	a3,0(s1)
ffffffffc0203096:	f04a                	sd	s2,32(sp)
ffffffffc0203098:	ec4e                	sd	s3,24(sp)
ffffffffc020309a:	e852                	sd	s4,16(sp)
ffffffffc020309c:	fc06                	sd	ra,56(sp)
ffffffffc020309e:	f822                	sd	s0,48(sp)
ffffffffc02030a0:	e456                	sd	s5,8(sp)
ffffffffc02030a2:	e05a                	sd	s6,0(sp)
ffffffffc02030a4:	0016f793          	andi	a5,a3,1
ffffffffc02030a8:	892e                	mv	s2,a1
ffffffffc02030aa:	8a32                	mv	s4,a2
ffffffffc02030ac:	00012997          	auipc	s3,0x12
ffffffffc02030b0:	3fc98993          	addi	s3,s3,1020 # ffffffffc02154a8 <npage>
ffffffffc02030b4:	e7bd                	bnez	a5,ffffffffc0203122 <get_pte+0x9e>
ffffffffc02030b6:	12060c63          	beqz	a2,ffffffffc02031ee <get_pte+0x16a>
ffffffffc02030ba:	4505                	li	a0,1
ffffffffc02030bc:	ebbff0ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02030c0:	842a                	mv	s0,a0
ffffffffc02030c2:	12050663          	beqz	a0,ffffffffc02031ee <get_pte+0x16a>
ffffffffc02030c6:	00012b17          	auipc	s6,0x12
ffffffffc02030ca:	522b0b13          	addi	s6,s6,1314 # ffffffffc02155e8 <pages>
ffffffffc02030ce:	000b3503          	ld	a0,0(s6)
ffffffffc02030d2:	00080ab7          	lui	s5,0x80
ffffffffc02030d6:	00012997          	auipc	s3,0x12
ffffffffc02030da:	3d298993          	addi	s3,s3,978 # ffffffffc02154a8 <npage>
ffffffffc02030de:	40a40533          	sub	a0,s0,a0
ffffffffc02030e2:	8519                	srai	a0,a0,0x6
ffffffffc02030e4:	9556                	add	a0,a0,s5
ffffffffc02030e6:	0009b703          	ld	a4,0(s3)
ffffffffc02030ea:	00c51793          	slli	a5,a0,0xc
ffffffffc02030ee:	4685                	li	a3,1
ffffffffc02030f0:	c014                	sw	a3,0(s0)
ffffffffc02030f2:	83b1                	srli	a5,a5,0xc
ffffffffc02030f4:	0532                	slli	a0,a0,0xc
ffffffffc02030f6:	14e7f363          	bgeu	a5,a4,ffffffffc020323c <get_pte+0x1b8>
ffffffffc02030fa:	00012797          	auipc	a5,0x12
ffffffffc02030fe:	4de78793          	addi	a5,a5,1246 # ffffffffc02155d8 <va_pa_offset>
ffffffffc0203102:	639c                	ld	a5,0(a5)
ffffffffc0203104:	6605                	lui	a2,0x1
ffffffffc0203106:	4581                	li	a1,0
ffffffffc0203108:	953e                	add	a0,a0,a5
ffffffffc020310a:	664010ef          	jal	ra,ffffffffc020476e <memset>
ffffffffc020310e:	000b3683          	ld	a3,0(s6)
ffffffffc0203112:	40d406b3          	sub	a3,s0,a3
ffffffffc0203116:	8699                	srai	a3,a3,0x6
ffffffffc0203118:	96d6                	add	a3,a3,s5
ffffffffc020311a:	06aa                	slli	a3,a3,0xa
ffffffffc020311c:	0116e693          	ori	a3,a3,17
ffffffffc0203120:	e094                	sd	a3,0(s1)
ffffffffc0203122:	77fd                	lui	a5,0xfffff
ffffffffc0203124:	068a                	slli	a3,a3,0x2
ffffffffc0203126:	0009b703          	ld	a4,0(s3)
ffffffffc020312a:	8efd                	and	a3,a3,a5
ffffffffc020312c:	00c6d793          	srli	a5,a3,0xc
ffffffffc0203130:	0ce7f163          	bgeu	a5,a4,ffffffffc02031f2 <get_pte+0x16e>
ffffffffc0203134:	00012a97          	auipc	s5,0x12
ffffffffc0203138:	4a4a8a93          	addi	s5,s5,1188 # ffffffffc02155d8 <va_pa_offset>
ffffffffc020313c:	000ab403          	ld	s0,0(s5)
ffffffffc0203140:	01595793          	srli	a5,s2,0x15
ffffffffc0203144:	1ff7f793          	andi	a5,a5,511
ffffffffc0203148:	96a2                	add	a3,a3,s0
ffffffffc020314a:	00379413          	slli	s0,a5,0x3
ffffffffc020314e:	9436                	add	s0,s0,a3
ffffffffc0203150:	6014                	ld	a3,0(s0)
ffffffffc0203152:	0016f793          	andi	a5,a3,1
ffffffffc0203156:	e3ad                	bnez	a5,ffffffffc02031b8 <get_pte+0x134>
ffffffffc0203158:	080a0b63          	beqz	s4,ffffffffc02031ee <get_pte+0x16a>
ffffffffc020315c:	4505                	li	a0,1
ffffffffc020315e:	e19ff0ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0203162:	84aa                	mv	s1,a0
ffffffffc0203164:	c549                	beqz	a0,ffffffffc02031ee <get_pte+0x16a>
ffffffffc0203166:	00012b17          	auipc	s6,0x12
ffffffffc020316a:	482b0b13          	addi	s6,s6,1154 # ffffffffc02155e8 <pages>
ffffffffc020316e:	000b3503          	ld	a0,0(s6)
ffffffffc0203172:	00080a37          	lui	s4,0x80
ffffffffc0203176:	0009b703          	ld	a4,0(s3)
ffffffffc020317a:	40a48533          	sub	a0,s1,a0
ffffffffc020317e:	8519                	srai	a0,a0,0x6
ffffffffc0203180:	9552                	add	a0,a0,s4
ffffffffc0203182:	00c51793          	slli	a5,a0,0xc
ffffffffc0203186:	4685                	li	a3,1
ffffffffc0203188:	c094                	sw	a3,0(s1)
ffffffffc020318a:	83b1                	srli	a5,a5,0xc
ffffffffc020318c:	0532                	slli	a0,a0,0xc
ffffffffc020318e:	08e7fa63          	bgeu	a5,a4,ffffffffc0203222 <get_pte+0x19e>
ffffffffc0203192:	000ab783          	ld	a5,0(s5)
ffffffffc0203196:	6605                	lui	a2,0x1
ffffffffc0203198:	4581                	li	a1,0
ffffffffc020319a:	953e                	add	a0,a0,a5
ffffffffc020319c:	5d2010ef          	jal	ra,ffffffffc020476e <memset>
ffffffffc02031a0:	000b3683          	ld	a3,0(s6)
ffffffffc02031a4:	40d486b3          	sub	a3,s1,a3
ffffffffc02031a8:	8699                	srai	a3,a3,0x6
ffffffffc02031aa:	96d2                	add	a3,a3,s4
ffffffffc02031ac:	06aa                	slli	a3,a3,0xa
ffffffffc02031ae:	0116e693          	ori	a3,a3,17
ffffffffc02031b2:	e014                	sd	a3,0(s0)
ffffffffc02031b4:	0009b703          	ld	a4,0(s3)
ffffffffc02031b8:	068a                	slli	a3,a3,0x2
ffffffffc02031ba:	757d                	lui	a0,0xfffff
ffffffffc02031bc:	8ee9                	and	a3,a3,a0
ffffffffc02031be:	00c6d793          	srli	a5,a3,0xc
ffffffffc02031c2:	04e7f463          	bgeu	a5,a4,ffffffffc020320a <get_pte+0x186>
ffffffffc02031c6:	000ab503          	ld	a0,0(s5)
ffffffffc02031ca:	00c95913          	srli	s2,s2,0xc
ffffffffc02031ce:	1ff97913          	andi	s2,s2,511
ffffffffc02031d2:	96aa                	add	a3,a3,a0
ffffffffc02031d4:	00391513          	slli	a0,s2,0x3
ffffffffc02031d8:	9536                	add	a0,a0,a3
ffffffffc02031da:	70e2                	ld	ra,56(sp)
ffffffffc02031dc:	7442                	ld	s0,48(sp)
ffffffffc02031de:	74a2                	ld	s1,40(sp)
ffffffffc02031e0:	7902                	ld	s2,32(sp)
ffffffffc02031e2:	69e2                	ld	s3,24(sp)
ffffffffc02031e4:	6a42                	ld	s4,16(sp)
ffffffffc02031e6:	6aa2                	ld	s5,8(sp)
ffffffffc02031e8:	6b02                	ld	s6,0(sp)
ffffffffc02031ea:	6121                	addi	sp,sp,64
ffffffffc02031ec:	8082                	ret
ffffffffc02031ee:	4501                	li	a0,0
ffffffffc02031f0:	b7ed                	j	ffffffffc02031da <get_pte+0x156>
ffffffffc02031f2:	00003617          	auipc	a2,0x3
ffffffffc02031f6:	92e60613          	addi	a2,a2,-1746 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc02031fa:	0ff00593          	li	a1,255
ffffffffc02031fe:	00003517          	auipc	a0,0x3
ffffffffc0203202:	15a50513          	addi	a0,a0,346 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203206:	fe7fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020320a:	00003617          	auipc	a2,0x3
ffffffffc020320e:	91660613          	addi	a2,a2,-1770 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc0203212:	10a00593          	li	a1,266
ffffffffc0203216:	00003517          	auipc	a0,0x3
ffffffffc020321a:	14250513          	addi	a0,a0,322 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc020321e:	fcffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203222:	86aa                	mv	a3,a0
ffffffffc0203224:	00003617          	auipc	a2,0x3
ffffffffc0203228:	8fc60613          	addi	a2,a2,-1796 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc020322c:	10700593          	li	a1,263
ffffffffc0203230:	00003517          	auipc	a0,0x3
ffffffffc0203234:	12850513          	addi	a0,a0,296 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203238:	fb5fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020323c:	86aa                	mv	a3,a0
ffffffffc020323e:	00003617          	auipc	a2,0x3
ffffffffc0203242:	8e260613          	addi	a2,a2,-1822 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc0203246:	0fc00593          	li	a1,252
ffffffffc020324a:	00003517          	auipc	a0,0x3
ffffffffc020324e:	10e50513          	addi	a0,a0,270 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203252:	f9bfc0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0203256 <get_page>:
ffffffffc0203256:	1141                	addi	sp,sp,-16
ffffffffc0203258:	e022                	sd	s0,0(sp)
ffffffffc020325a:	8432                	mv	s0,a2
ffffffffc020325c:	4601                	li	a2,0
ffffffffc020325e:	e406                	sd	ra,8(sp)
ffffffffc0203260:	e25ff0ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc0203264:	c011                	beqz	s0,ffffffffc0203268 <get_page+0x12>
ffffffffc0203266:	e008                	sd	a0,0(s0)
ffffffffc0203268:	c511                	beqz	a0,ffffffffc0203274 <get_page+0x1e>
ffffffffc020326a:	611c                	ld	a5,0(a0)
ffffffffc020326c:	4501                	li	a0,0
ffffffffc020326e:	0017f713          	andi	a4,a5,1
ffffffffc0203272:	e709                	bnez	a4,ffffffffc020327c <get_page+0x26>
ffffffffc0203274:	60a2                	ld	ra,8(sp)
ffffffffc0203276:	6402                	ld	s0,0(sp)
ffffffffc0203278:	0141                	addi	sp,sp,16
ffffffffc020327a:	8082                	ret
ffffffffc020327c:	00012717          	auipc	a4,0x12
ffffffffc0203280:	22c70713          	addi	a4,a4,556 # ffffffffc02154a8 <npage>
ffffffffc0203284:	6318                	ld	a4,0(a4)
ffffffffc0203286:	078a                	slli	a5,a5,0x2
ffffffffc0203288:	83b1                	srli	a5,a5,0xc
ffffffffc020328a:	02e7f063          	bgeu	a5,a4,ffffffffc02032aa <get_page+0x54>
ffffffffc020328e:	00012717          	auipc	a4,0x12
ffffffffc0203292:	35a70713          	addi	a4,a4,858 # ffffffffc02155e8 <pages>
ffffffffc0203296:	6308                	ld	a0,0(a4)
ffffffffc0203298:	60a2                	ld	ra,8(sp)
ffffffffc020329a:	6402                	ld	s0,0(sp)
ffffffffc020329c:	fff80737          	lui	a4,0xfff80
ffffffffc02032a0:	97ba                	add	a5,a5,a4
ffffffffc02032a2:	079a                	slli	a5,a5,0x6
ffffffffc02032a4:	953e                	add	a0,a0,a5
ffffffffc02032a6:	0141                	addi	sp,sp,16
ffffffffc02032a8:	8082                	ret
ffffffffc02032aa:	cb1ff0ef          	jal	ra,ffffffffc0202f5a <pa2page.part.4>

ffffffffc02032ae <page_remove>:
ffffffffc02032ae:	1101                	addi	sp,sp,-32
ffffffffc02032b0:	4601                	li	a2,0
ffffffffc02032b2:	e426                	sd	s1,8(sp)
ffffffffc02032b4:	ec06                	sd	ra,24(sp)
ffffffffc02032b6:	e822                	sd	s0,16(sp)
ffffffffc02032b8:	84ae                	mv	s1,a1
ffffffffc02032ba:	dcbff0ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc02032be:	c511                	beqz	a0,ffffffffc02032ca <page_remove+0x1c>
ffffffffc02032c0:	611c                	ld	a5,0(a0)
ffffffffc02032c2:	842a                	mv	s0,a0
ffffffffc02032c4:	0017f713          	andi	a4,a5,1
ffffffffc02032c8:	e711                	bnez	a4,ffffffffc02032d4 <page_remove+0x26>
ffffffffc02032ca:	60e2                	ld	ra,24(sp)
ffffffffc02032cc:	6442                	ld	s0,16(sp)
ffffffffc02032ce:	64a2                	ld	s1,8(sp)
ffffffffc02032d0:	6105                	addi	sp,sp,32
ffffffffc02032d2:	8082                	ret
ffffffffc02032d4:	00012717          	auipc	a4,0x12
ffffffffc02032d8:	1d470713          	addi	a4,a4,468 # ffffffffc02154a8 <npage>
ffffffffc02032dc:	6318                	ld	a4,0(a4)
ffffffffc02032de:	078a                	slli	a5,a5,0x2
ffffffffc02032e0:	83b1                	srli	a5,a5,0xc
ffffffffc02032e2:	02e7fe63          	bgeu	a5,a4,ffffffffc020331e <page_remove+0x70>
ffffffffc02032e6:	00012717          	auipc	a4,0x12
ffffffffc02032ea:	30270713          	addi	a4,a4,770 # ffffffffc02155e8 <pages>
ffffffffc02032ee:	6308                	ld	a0,0(a4)
ffffffffc02032f0:	fff80737          	lui	a4,0xfff80
ffffffffc02032f4:	97ba                	add	a5,a5,a4
ffffffffc02032f6:	079a                	slli	a5,a5,0x6
ffffffffc02032f8:	953e                	add	a0,a0,a5
ffffffffc02032fa:	411c                	lw	a5,0(a0)
ffffffffc02032fc:	fff7871b          	addiw	a4,a5,-1
ffffffffc0203300:	c118                	sw	a4,0(a0)
ffffffffc0203302:	cb11                	beqz	a4,ffffffffc0203316 <page_remove+0x68>
ffffffffc0203304:	00043023          	sd	zero,0(s0)
ffffffffc0203308:	12048073          	sfence.vma	s1
ffffffffc020330c:	60e2                	ld	ra,24(sp)
ffffffffc020330e:	6442                	ld	s0,16(sp)
ffffffffc0203310:	64a2                	ld	s1,8(sp)
ffffffffc0203312:	6105                	addi	sp,sp,32
ffffffffc0203314:	8082                	ret
ffffffffc0203316:	4585                	li	a1,1
ffffffffc0203318:	ce7ff0ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc020331c:	b7e5                	j	ffffffffc0203304 <page_remove+0x56>
ffffffffc020331e:	c3dff0ef          	jal	ra,ffffffffc0202f5a <pa2page.part.4>

ffffffffc0203322 <page_insert>:
ffffffffc0203322:	7179                	addi	sp,sp,-48
ffffffffc0203324:	e44e                	sd	s3,8(sp)
ffffffffc0203326:	89b2                	mv	s3,a2
ffffffffc0203328:	f022                	sd	s0,32(sp)
ffffffffc020332a:	4605                	li	a2,1
ffffffffc020332c:	842e                	mv	s0,a1
ffffffffc020332e:	85ce                	mv	a1,s3
ffffffffc0203330:	ec26                	sd	s1,24(sp)
ffffffffc0203332:	f406                	sd	ra,40(sp)
ffffffffc0203334:	e84a                	sd	s2,16(sp)
ffffffffc0203336:	e052                	sd	s4,0(sp)
ffffffffc0203338:	84b6                	mv	s1,a3
ffffffffc020333a:	d4bff0ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc020333e:	cd49                	beqz	a0,ffffffffc02033d8 <page_insert+0xb6>
ffffffffc0203340:	4014                	lw	a3,0(s0)
ffffffffc0203342:	611c                	ld	a5,0(a0)
ffffffffc0203344:	892a                	mv	s2,a0
ffffffffc0203346:	0016871b          	addiw	a4,a3,1
ffffffffc020334a:	c018                	sw	a4,0(s0)
ffffffffc020334c:	0017f713          	andi	a4,a5,1
ffffffffc0203350:	ef05                	bnez	a4,ffffffffc0203388 <page_insert+0x66>
ffffffffc0203352:	00012797          	auipc	a5,0x12
ffffffffc0203356:	29678793          	addi	a5,a5,662 # ffffffffc02155e8 <pages>
ffffffffc020335a:	6398                	ld	a4,0(a5)
ffffffffc020335c:	8c19                	sub	s0,s0,a4
ffffffffc020335e:	000806b7          	lui	a3,0x80
ffffffffc0203362:	8419                	srai	s0,s0,0x6
ffffffffc0203364:	9436                	add	s0,s0,a3
ffffffffc0203366:	042a                	slli	s0,s0,0xa
ffffffffc0203368:	8c45                	or	s0,s0,s1
ffffffffc020336a:	00146413          	ori	s0,s0,1
ffffffffc020336e:	00893023          	sd	s0,0(s2)
ffffffffc0203372:	12098073          	sfence.vma	s3
ffffffffc0203376:	4501                	li	a0,0
ffffffffc0203378:	70a2                	ld	ra,40(sp)
ffffffffc020337a:	7402                	ld	s0,32(sp)
ffffffffc020337c:	64e2                	ld	s1,24(sp)
ffffffffc020337e:	6942                	ld	s2,16(sp)
ffffffffc0203380:	69a2                	ld	s3,8(sp)
ffffffffc0203382:	6a02                	ld	s4,0(sp)
ffffffffc0203384:	6145                	addi	sp,sp,48
ffffffffc0203386:	8082                	ret
ffffffffc0203388:	00012717          	auipc	a4,0x12
ffffffffc020338c:	12070713          	addi	a4,a4,288 # ffffffffc02154a8 <npage>
ffffffffc0203390:	6318                	ld	a4,0(a4)
ffffffffc0203392:	078a                	slli	a5,a5,0x2
ffffffffc0203394:	83b1                	srli	a5,a5,0xc
ffffffffc0203396:	04e7f363          	bgeu	a5,a4,ffffffffc02033dc <page_insert+0xba>
ffffffffc020339a:	00012a17          	auipc	s4,0x12
ffffffffc020339e:	24ea0a13          	addi	s4,s4,590 # ffffffffc02155e8 <pages>
ffffffffc02033a2:	000a3703          	ld	a4,0(s4)
ffffffffc02033a6:	fff80537          	lui	a0,0xfff80
ffffffffc02033aa:	953e                	add	a0,a0,a5
ffffffffc02033ac:	051a                	slli	a0,a0,0x6
ffffffffc02033ae:	953a                	add	a0,a0,a4
ffffffffc02033b0:	00a40a63          	beq	s0,a0,ffffffffc02033c4 <page_insert+0xa2>
ffffffffc02033b4:	411c                	lw	a5,0(a0)
ffffffffc02033b6:	fff7869b          	addiw	a3,a5,-1
ffffffffc02033ba:	c114                	sw	a3,0(a0)
ffffffffc02033bc:	c691                	beqz	a3,ffffffffc02033c8 <page_insert+0xa6>
ffffffffc02033be:	12098073          	sfence.vma	s3
ffffffffc02033c2:	bf69                	j	ffffffffc020335c <page_insert+0x3a>
ffffffffc02033c4:	c014                	sw	a3,0(s0)
ffffffffc02033c6:	bf59                	j	ffffffffc020335c <page_insert+0x3a>
ffffffffc02033c8:	4585                	li	a1,1
ffffffffc02033ca:	c35ff0ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc02033ce:	000a3703          	ld	a4,0(s4)
ffffffffc02033d2:	12098073          	sfence.vma	s3
ffffffffc02033d6:	b759                	j	ffffffffc020335c <page_insert+0x3a>
ffffffffc02033d8:	5571                	li	a0,-4
ffffffffc02033da:	bf79                	j	ffffffffc0203378 <page_insert+0x56>
ffffffffc02033dc:	b7fff0ef          	jal	ra,ffffffffc0202f5a <pa2page.part.4>

ffffffffc02033e0 <pmm_init>:
ffffffffc02033e0:	00003797          	auipc	a5,0x3
ffffffffc02033e4:	f2878793          	addi	a5,a5,-216 # ffffffffc0206308 <default_pmm_manager>
ffffffffc02033e8:	638c                	ld	a1,0(a5)
ffffffffc02033ea:	7139                	addi	sp,sp,-64
ffffffffc02033ec:	00003517          	auipc	a0,0x3
ffffffffc02033f0:	f9450513          	addi	a0,a0,-108 # ffffffffc0206380 <default_pmm_manager+0x78>
ffffffffc02033f4:	fc06                	sd	ra,56(sp)
ffffffffc02033f6:	00012717          	auipc	a4,0x12
ffffffffc02033fa:	1cf73d23          	sd	a5,474(a4) # ffffffffc02155d0 <pmm_manager>
ffffffffc02033fe:	f822                	sd	s0,48(sp)
ffffffffc0203400:	f426                	sd	s1,40(sp)
ffffffffc0203402:	f04a                	sd	s2,32(sp)
ffffffffc0203404:	ec4e                	sd	s3,24(sp)
ffffffffc0203406:	e852                	sd	s4,16(sp)
ffffffffc0203408:	e456                	sd	s5,8(sp)
ffffffffc020340a:	e05a                	sd	s6,0(sp)
ffffffffc020340c:	00012417          	auipc	s0,0x12
ffffffffc0203410:	1c440413          	addi	s0,s0,452 # ffffffffc02155d0 <pmm_manager>
ffffffffc0203414:	cd5fc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0203418:	601c                	ld	a5,0(s0)
ffffffffc020341a:	00012497          	auipc	s1,0x12
ffffffffc020341e:	08e48493          	addi	s1,s1,142 # ffffffffc02154a8 <npage>
ffffffffc0203422:	00012917          	auipc	s2,0x12
ffffffffc0203426:	1c690913          	addi	s2,s2,454 # ffffffffc02155e8 <pages>
ffffffffc020342a:	679c                	ld	a5,8(a5)
ffffffffc020342c:	9782                	jalr	a5
ffffffffc020342e:	57f5                	li	a5,-3
ffffffffc0203430:	07fa                	slli	a5,a5,0x1e
ffffffffc0203432:	00003517          	auipc	a0,0x3
ffffffffc0203436:	f6650513          	addi	a0,a0,-154 # ffffffffc0206398 <default_pmm_manager+0x90>
ffffffffc020343a:	00012717          	auipc	a4,0x12
ffffffffc020343e:	18f73f23          	sd	a5,414(a4) # ffffffffc02155d8 <va_pa_offset>
ffffffffc0203442:	ca7fc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0203446:	44300693          	li	a3,1091
ffffffffc020344a:	06d6                	slli	a3,a3,0x15
ffffffffc020344c:	40100613          	li	a2,1025
ffffffffc0203450:	16fd                	addi	a3,a3,-1
ffffffffc0203452:	0656                	slli	a2,a2,0x15
ffffffffc0203454:	088005b7          	lui	a1,0x8800
ffffffffc0203458:	00003517          	auipc	a0,0x3
ffffffffc020345c:	f5850513          	addi	a0,a0,-168 # ffffffffc02063b0 <default_pmm_manager+0xa8>
ffffffffc0203460:	c89fc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0203464:	777d                	lui	a4,0xfffff
ffffffffc0203466:	00013797          	auipc	a5,0x13
ffffffffc020346a:	19978793          	addi	a5,a5,409 # ffffffffc02165ff <end+0xfff>
ffffffffc020346e:	8ff9                	and	a5,a5,a4
ffffffffc0203470:	00088737          	lui	a4,0x88
ffffffffc0203474:	60070713          	addi	a4,a4,1536 # 88600 <BASE_ADDRESS-0xffffffffc0177a00>
ffffffffc0203478:	00012697          	auipc	a3,0x12
ffffffffc020347c:	02e6b823          	sd	a4,48(a3) # ffffffffc02154a8 <npage>
ffffffffc0203480:	00012717          	auipc	a4,0x12
ffffffffc0203484:	16f73423          	sd	a5,360(a4) # ffffffffc02155e8 <pages>
ffffffffc0203488:	4701                	li	a4,0
ffffffffc020348a:	4685                	li	a3,1
ffffffffc020348c:	fff80837          	lui	a6,0xfff80
ffffffffc0203490:	a019                	j	ffffffffc0203496 <pmm_init+0xb6>
ffffffffc0203492:	00093783          	ld	a5,0(s2)
ffffffffc0203496:	00671613          	slli	a2,a4,0x6
ffffffffc020349a:	97b2                	add	a5,a5,a2
ffffffffc020349c:	07a1                	addi	a5,a5,8
ffffffffc020349e:	40d7b02f          	amoor.d	zero,a3,(a5)
ffffffffc02034a2:	6090                	ld	a2,0(s1)
ffffffffc02034a4:	0705                	addi	a4,a4,1
ffffffffc02034a6:	010607b3          	add	a5,a2,a6
ffffffffc02034aa:	fef764e3          	bltu	a4,a5,ffffffffc0203492 <pmm_init+0xb2>
ffffffffc02034ae:	00093503          	ld	a0,0(s2)
ffffffffc02034b2:	fe0007b7          	lui	a5,0xfe000
ffffffffc02034b6:	00661693          	slli	a3,a2,0x6
ffffffffc02034ba:	97aa                	add	a5,a5,a0
ffffffffc02034bc:	96be                	add	a3,a3,a5
ffffffffc02034be:	c02007b7          	lui	a5,0xc0200
ffffffffc02034c2:	72f6e563          	bltu	a3,a5,ffffffffc0203bec <pmm_init+0x80c>
ffffffffc02034c6:	00012997          	auipc	s3,0x12
ffffffffc02034ca:	11298993          	addi	s3,s3,274 # ffffffffc02155d8 <va_pa_offset>
ffffffffc02034ce:	0009b583          	ld	a1,0(s3)
ffffffffc02034d2:	44300793          	li	a5,1091
ffffffffc02034d6:	07d6                	slli	a5,a5,0x15
ffffffffc02034d8:	8e8d                	sub	a3,a3,a1
ffffffffc02034da:	02f6f763          	bgeu	a3,a5,ffffffffc0203508 <pmm_init+0x128>
ffffffffc02034de:	6585                	lui	a1,0x1
ffffffffc02034e0:	15fd                	addi	a1,a1,-1
ffffffffc02034e2:	96ae                	add	a3,a3,a1
ffffffffc02034e4:	00c6d713          	srli	a4,a3,0xc
ffffffffc02034e8:	3cc77763          	bgeu	a4,a2,ffffffffc02038b6 <pmm_init+0x4d6>
ffffffffc02034ec:	6010                	ld	a2,0(s0)
ffffffffc02034ee:	75fd                	lui	a1,0xfffff
ffffffffc02034f0:	8eed                	and	a3,a3,a1
ffffffffc02034f2:	9742                	add	a4,a4,a6
ffffffffc02034f4:	6a10                	ld	a2,16(a2)
ffffffffc02034f6:	40d786b3          	sub	a3,a5,a3
ffffffffc02034fa:	071a                	slli	a4,a4,0x6
ffffffffc02034fc:	00c6d593          	srli	a1,a3,0xc
ffffffffc0203500:	953a                	add	a0,a0,a4
ffffffffc0203502:	9602                	jalr	a2
ffffffffc0203504:	0009b583          	ld	a1,0(s3)
ffffffffc0203508:	00003517          	auipc	a0,0x3
ffffffffc020350c:	ed050513          	addi	a0,a0,-304 # ffffffffc02063d8 <default_pmm_manager+0xd0>
ffffffffc0203510:	bd9fc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0203514:	601c                	ld	a5,0(s0)
ffffffffc0203516:	00012417          	auipc	s0,0x12
ffffffffc020351a:	f8a40413          	addi	s0,s0,-118 # ffffffffc02154a0 <boot_pgdir>
ffffffffc020351e:	7b9c                	ld	a5,48(a5)
ffffffffc0203520:	9782                	jalr	a5
ffffffffc0203522:	00003517          	auipc	a0,0x3
ffffffffc0203526:	ece50513          	addi	a0,a0,-306 # ffffffffc02063f0 <default_pmm_manager+0xe8>
ffffffffc020352a:	bbffc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020352e:	00006517          	auipc	a0,0x6
ffffffffc0203532:	ad250513          	addi	a0,a0,-1326 # ffffffffc0209000 <boot_page_table_sv39>
ffffffffc0203536:	00012797          	auipc	a5,0x12
ffffffffc020353a:	f6a7b523          	sd	a0,-150(a5) # ffffffffc02154a0 <boot_pgdir>
ffffffffc020353e:	c02007b7          	lui	a5,0xc0200
ffffffffc0203542:	68f56863          	bltu	a0,a5,ffffffffc0203bd2 <pmm_init+0x7f2>
ffffffffc0203546:	0009b783          	ld	a5,0(s3)
ffffffffc020354a:	6098                	ld	a4,0(s1)
ffffffffc020354c:	40f507b3          	sub	a5,a0,a5
ffffffffc0203550:	00012697          	auipc	a3,0x12
ffffffffc0203554:	08f6b823          	sd	a5,144(a3) # ffffffffc02155e0 <boot_cr3>
ffffffffc0203558:	c80007b7          	lui	a5,0xc8000
ffffffffc020355c:	83b1                	srli	a5,a5,0xc
ffffffffc020355e:	70e7e363          	bltu	a5,a4,ffffffffc0203c64 <pmm_init+0x884>
ffffffffc0203562:	03451793          	slli	a5,a0,0x34
ffffffffc0203566:	34079a63          	bnez	a5,ffffffffc02038ba <pmm_init+0x4da>
ffffffffc020356a:	4601                	li	a2,0
ffffffffc020356c:	4581                	li	a1,0
ffffffffc020356e:	ce9ff0ef          	jal	ra,ffffffffc0203256 <get_page>
ffffffffc0203572:	74051963          	bnez	a0,ffffffffc0203cc4 <pmm_init+0x8e4>
ffffffffc0203576:	4505                	li	a0,1
ffffffffc0203578:	9ffff0ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc020357c:	8a2a                	mv	s4,a0
ffffffffc020357e:	6008                	ld	a0,0(s0)
ffffffffc0203580:	4681                	li	a3,0
ffffffffc0203582:	4601                	li	a2,0
ffffffffc0203584:	85d2                	mv	a1,s4
ffffffffc0203586:	d9dff0ef          	jal	ra,ffffffffc0203322 <page_insert>
ffffffffc020358a:	70051d63          	bnez	a0,ffffffffc0203ca4 <pmm_init+0x8c4>
ffffffffc020358e:	6008                	ld	a0,0(s0)
ffffffffc0203590:	4601                	li	a2,0
ffffffffc0203592:	4581                	li	a1,0
ffffffffc0203594:	af1ff0ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc0203598:	6e050663          	beqz	a0,ffffffffc0203c84 <pmm_init+0x8a4>
ffffffffc020359c:	611c                	ld	a5,0(a0)
ffffffffc020359e:	0017f713          	andi	a4,a5,1
ffffffffc02035a2:	32070c63          	beqz	a4,ffffffffc02038da <pmm_init+0x4fa>
ffffffffc02035a6:	6098                	ld	a4,0(s1)
ffffffffc02035a8:	078a                	slli	a5,a5,0x2
ffffffffc02035aa:	83b1                	srli	a5,a5,0xc
ffffffffc02035ac:	30e7f563          	bgeu	a5,a4,ffffffffc02038b6 <pmm_init+0x4d6>
ffffffffc02035b0:	00093683          	ld	a3,0(s2)
ffffffffc02035b4:	fff80637          	lui	a2,0xfff80
ffffffffc02035b8:	97b2                	add	a5,a5,a2
ffffffffc02035ba:	079a                	slli	a5,a5,0x6
ffffffffc02035bc:	97b6                	add	a5,a5,a3
ffffffffc02035be:	34fa1a63          	bne	s4,a5,ffffffffc0203912 <pmm_init+0x532>
ffffffffc02035c2:	000a2683          	lw	a3,0(s4)
ffffffffc02035c6:	4785                	li	a5,1
ffffffffc02035c8:	32f69563          	bne	a3,a5,ffffffffc02038f2 <pmm_init+0x512>
ffffffffc02035cc:	6008                	ld	a0,0(s0)
ffffffffc02035ce:	76fd                	lui	a3,0xfffff
ffffffffc02035d0:	611c                	ld	a5,0(a0)
ffffffffc02035d2:	078a                	slli	a5,a5,0x2
ffffffffc02035d4:	8ff5                	and	a5,a5,a3
ffffffffc02035d6:	00c7d613          	srli	a2,a5,0xc
ffffffffc02035da:	72e67263          	bgeu	a2,a4,ffffffffc0203cfe <pmm_init+0x91e>
ffffffffc02035de:	0009bb03          	ld	s6,0(s3)
ffffffffc02035e2:	97da                	add	a5,a5,s6
ffffffffc02035e4:	0007ba83          	ld	s5,0(a5) # ffffffffc8000000 <end+0x7deaa00>
ffffffffc02035e8:	0a8a                	slli	s5,s5,0x2
ffffffffc02035ea:	00dafab3          	and	s5,s5,a3
ffffffffc02035ee:	00cad793          	srli	a5,s5,0xc
ffffffffc02035f2:	6ee7f963          	bgeu	a5,a4,ffffffffc0203ce4 <pmm_init+0x904>
ffffffffc02035f6:	4601                	li	a2,0
ffffffffc02035f8:	6585                	lui	a1,0x1
ffffffffc02035fa:	9ada                	add	s5,s5,s6
ffffffffc02035fc:	a89ff0ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc0203600:	0aa1                	addi	s5,s5,8
ffffffffc0203602:	45551863          	bne	a0,s5,ffffffffc0203a52 <pmm_init+0x672>
ffffffffc0203606:	4505                	li	a0,1
ffffffffc0203608:	96fff0ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc020360c:	8aaa                	mv	s5,a0
ffffffffc020360e:	6008                	ld	a0,0(s0)
ffffffffc0203610:	46d1                	li	a3,20
ffffffffc0203612:	6605                	lui	a2,0x1
ffffffffc0203614:	85d6                	mv	a1,s5
ffffffffc0203616:	d0dff0ef          	jal	ra,ffffffffc0203322 <page_insert>
ffffffffc020361a:	40051c63          	bnez	a0,ffffffffc0203a32 <pmm_init+0x652>
ffffffffc020361e:	6008                	ld	a0,0(s0)
ffffffffc0203620:	4601                	li	a2,0
ffffffffc0203622:	6585                	lui	a1,0x1
ffffffffc0203624:	a61ff0ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc0203628:	3e050563          	beqz	a0,ffffffffc0203a12 <pmm_init+0x632>
ffffffffc020362c:	611c                	ld	a5,0(a0)
ffffffffc020362e:	0107f713          	andi	a4,a5,16
ffffffffc0203632:	3c070063          	beqz	a4,ffffffffc02039f2 <pmm_init+0x612>
ffffffffc0203636:	8b91                	andi	a5,a5,4
ffffffffc0203638:	38078d63          	beqz	a5,ffffffffc02039d2 <pmm_init+0x5f2>
ffffffffc020363c:	6008                	ld	a0,0(s0)
ffffffffc020363e:	611c                	ld	a5,0(a0)
ffffffffc0203640:	8bc1                	andi	a5,a5,16
ffffffffc0203642:	36078863          	beqz	a5,ffffffffc02039b2 <pmm_init+0x5d2>
ffffffffc0203646:	000aa703          	lw	a4,0(s5)
ffffffffc020364a:	4785                	li	a5,1
ffffffffc020364c:	34f71363          	bne	a4,a5,ffffffffc0203992 <pmm_init+0x5b2>
ffffffffc0203650:	4681                	li	a3,0
ffffffffc0203652:	6605                	lui	a2,0x1
ffffffffc0203654:	85d2                	mv	a1,s4
ffffffffc0203656:	ccdff0ef          	jal	ra,ffffffffc0203322 <page_insert>
ffffffffc020365a:	30051c63          	bnez	a0,ffffffffc0203972 <pmm_init+0x592>
ffffffffc020365e:	000a2703          	lw	a4,0(s4)
ffffffffc0203662:	4789                	li	a5,2
ffffffffc0203664:	2ef71763          	bne	a4,a5,ffffffffc0203952 <pmm_init+0x572>
ffffffffc0203668:	000aa783          	lw	a5,0(s5)
ffffffffc020366c:	2c079363          	bnez	a5,ffffffffc0203932 <pmm_init+0x552>
ffffffffc0203670:	6008                	ld	a0,0(s0)
ffffffffc0203672:	4601                	li	a2,0
ffffffffc0203674:	6585                	lui	a1,0x1
ffffffffc0203676:	a0fff0ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc020367a:	48050c63          	beqz	a0,ffffffffc0203b12 <pmm_init+0x732>
ffffffffc020367e:	6118                	ld	a4,0(a0)
ffffffffc0203680:	00177793          	andi	a5,a4,1
ffffffffc0203684:	24078b63          	beqz	a5,ffffffffc02038da <pmm_init+0x4fa>
ffffffffc0203688:	6094                	ld	a3,0(s1)
ffffffffc020368a:	00271793          	slli	a5,a4,0x2
ffffffffc020368e:	83b1                	srli	a5,a5,0xc
ffffffffc0203690:	22d7f363          	bgeu	a5,a3,ffffffffc02038b6 <pmm_init+0x4d6>
ffffffffc0203694:	00093683          	ld	a3,0(s2)
ffffffffc0203698:	fff80637          	lui	a2,0xfff80
ffffffffc020369c:	97b2                	add	a5,a5,a2
ffffffffc020369e:	079a                	slli	a5,a5,0x6
ffffffffc02036a0:	97b6                	add	a5,a5,a3
ffffffffc02036a2:	44fa1863          	bne	s4,a5,ffffffffc0203af2 <pmm_init+0x712>
ffffffffc02036a6:	8b41                	andi	a4,a4,16
ffffffffc02036a8:	42071563          	bnez	a4,ffffffffc0203ad2 <pmm_init+0x6f2>
ffffffffc02036ac:	6008                	ld	a0,0(s0)
ffffffffc02036ae:	4581                	li	a1,0
ffffffffc02036b0:	bffff0ef          	jal	ra,ffffffffc02032ae <page_remove>
ffffffffc02036b4:	000a2703          	lw	a4,0(s4)
ffffffffc02036b8:	4785                	li	a5,1
ffffffffc02036ba:	3ef71c63          	bne	a4,a5,ffffffffc0203ab2 <pmm_init+0x6d2>
ffffffffc02036be:	000aa783          	lw	a5,0(s5)
ffffffffc02036c2:	3c079863          	bnez	a5,ffffffffc0203a92 <pmm_init+0x6b2>
ffffffffc02036c6:	6008                	ld	a0,0(s0)
ffffffffc02036c8:	6585                	lui	a1,0x1
ffffffffc02036ca:	be5ff0ef          	jal	ra,ffffffffc02032ae <page_remove>
ffffffffc02036ce:	000a2783          	lw	a5,0(s4)
ffffffffc02036d2:	3a079063          	bnez	a5,ffffffffc0203a72 <pmm_init+0x692>
ffffffffc02036d6:	000aa783          	lw	a5,0(s5)
ffffffffc02036da:	4a079c63          	bnez	a5,ffffffffc0203b92 <pmm_init+0x7b2>
ffffffffc02036de:	601c                	ld	a5,0(s0)
ffffffffc02036e0:	6098                	ld	a4,0(s1)
ffffffffc02036e2:	639c                	ld	a5,0(a5)
ffffffffc02036e4:	078a                	slli	a5,a5,0x2
ffffffffc02036e6:	83b1                	srli	a5,a5,0xc
ffffffffc02036e8:	1ce7f763          	bgeu	a5,a4,ffffffffc02038b6 <pmm_init+0x4d6>
ffffffffc02036ec:	fff80737          	lui	a4,0xfff80
ffffffffc02036f0:	00093503          	ld	a0,0(s2)
ffffffffc02036f4:	97ba                	add	a5,a5,a4
ffffffffc02036f6:	079a                	slli	a5,a5,0x6
ffffffffc02036f8:	953e                	add	a0,a0,a5
ffffffffc02036fa:	4118                	lw	a4,0(a0)
ffffffffc02036fc:	4785                	li	a5,1
ffffffffc02036fe:	46f71a63          	bne	a4,a5,ffffffffc0203b72 <pmm_init+0x792>
ffffffffc0203702:	4585                	li	a1,1
ffffffffc0203704:	8fbff0ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0203708:	601c                	ld	a5,0(s0)
ffffffffc020370a:	00003517          	auipc	a0,0x3
ffffffffc020370e:	fae50513          	addi	a0,a0,-82 # ffffffffc02066b8 <default_pmm_manager+0x3b0>
ffffffffc0203712:	0007b023          	sd	zero,0(a5)
ffffffffc0203716:	9d3fc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc020371a:	6098                	ld	a4,0(s1)
ffffffffc020371c:	c02007b7          	lui	a5,0xc0200
ffffffffc0203720:	00c71693          	slli	a3,a4,0xc
ffffffffc0203724:	12d7fa63          	bgeu	a5,a3,ffffffffc0203858 <pmm_init+0x478>
ffffffffc0203728:	83b1                	srli	a5,a5,0xc
ffffffffc020372a:	6008                	ld	a0,0(s0)
ffffffffc020372c:	c0200a37          	lui	s4,0xc0200
ffffffffc0203730:	16e7f663          	bgeu	a5,a4,ffffffffc020389c <pmm_init+0x4bc>
ffffffffc0203734:	7b7d                	lui	s6,0xfffff
ffffffffc0203736:	6a85                	lui	s5,0x1
ffffffffc0203738:	a029                	j	ffffffffc0203742 <pmm_init+0x362>
ffffffffc020373a:	00ca5713          	srli	a4,s4,0xc
ffffffffc020373e:	14f77f63          	bgeu	a4,a5,ffffffffc020389c <pmm_init+0x4bc>
ffffffffc0203742:	0009b583          	ld	a1,0(s3)
ffffffffc0203746:	4601                	li	a2,0
ffffffffc0203748:	95d2                	add	a1,a1,s4
ffffffffc020374a:	93bff0ef          	jal	ra,ffffffffc0203084 <get_pte>
ffffffffc020374e:	12050763          	beqz	a0,ffffffffc020387c <pmm_init+0x49c>
ffffffffc0203752:	611c                	ld	a5,0(a0)
ffffffffc0203754:	078a                	slli	a5,a5,0x2
ffffffffc0203756:	0167f7b3          	and	a5,a5,s6
ffffffffc020375a:	11479163          	bne	a5,s4,ffffffffc020385c <pmm_init+0x47c>
ffffffffc020375e:	609c                	ld	a5,0(s1)
ffffffffc0203760:	9a56                	add	s4,s4,s5
ffffffffc0203762:	6008                	ld	a0,0(s0)
ffffffffc0203764:	00c79713          	slli	a4,a5,0xc
ffffffffc0203768:	fcea69e3          	bltu	s4,a4,ffffffffc020373a <pmm_init+0x35a>
ffffffffc020376c:	611c                	ld	a5,0(a0)
ffffffffc020376e:	44079263          	bnez	a5,ffffffffc0203bb2 <pmm_init+0x7d2>
ffffffffc0203772:	4505                	li	a0,1
ffffffffc0203774:	803ff0ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0203778:	8aaa                	mv	s5,a0
ffffffffc020377a:	6008                	ld	a0,0(s0)
ffffffffc020377c:	4699                	li	a3,6
ffffffffc020377e:	10000613          	li	a2,256
ffffffffc0203782:	85d6                	mv	a1,s5
ffffffffc0203784:	b9fff0ef          	jal	ra,ffffffffc0203322 <page_insert>
ffffffffc0203788:	4a051e63          	bnez	a0,ffffffffc0203c44 <pmm_init+0x864>
ffffffffc020378c:	000aa703          	lw	a4,0(s5) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc0203790:	4785                	li	a5,1
ffffffffc0203792:	48f71963          	bne	a4,a5,ffffffffc0203c24 <pmm_init+0x844>
ffffffffc0203796:	6008                	ld	a0,0(s0)
ffffffffc0203798:	6a05                	lui	s4,0x1
ffffffffc020379a:	4699                	li	a3,6
ffffffffc020379c:	100a0613          	addi	a2,s4,256 # 1100 <BASE_ADDRESS-0xffffffffc01fef00>
ffffffffc02037a0:	85d6                	mv	a1,s5
ffffffffc02037a2:	b81ff0ef          	jal	ra,ffffffffc0203322 <page_insert>
ffffffffc02037a6:	3a051663          	bnez	a0,ffffffffc0203b52 <pmm_init+0x772>
ffffffffc02037aa:	000aa703          	lw	a4,0(s5)
ffffffffc02037ae:	4789                	li	a5,2
ffffffffc02037b0:	38f71163          	bne	a4,a5,ffffffffc0203b32 <pmm_init+0x752>
ffffffffc02037b4:	00003597          	auipc	a1,0x3
ffffffffc02037b8:	03c58593          	addi	a1,a1,60 # ffffffffc02067f0 <default_pmm_manager+0x4e8>
ffffffffc02037bc:	10000513          	li	a0,256
ffffffffc02037c0:	755000ef          	jal	ra,ffffffffc0204714 <strcpy>
ffffffffc02037c4:	100a0593          	addi	a1,s4,256
ffffffffc02037c8:	10000513          	li	a0,256
ffffffffc02037cc:	75b000ef          	jal	ra,ffffffffc0204726 <strcmp>
ffffffffc02037d0:	56051063          	bnez	a0,ffffffffc0203d30 <pmm_init+0x950>
ffffffffc02037d4:	00093683          	ld	a3,0(s2)
ffffffffc02037d8:	00080a37          	lui	s4,0x80
ffffffffc02037dc:	6098                	ld	a4,0(s1)
ffffffffc02037de:	40da86b3          	sub	a3,s5,a3
ffffffffc02037e2:	8699                	srai	a3,a3,0x6
ffffffffc02037e4:	96d2                	add	a3,a3,s4
ffffffffc02037e6:	00c69793          	slli	a5,a3,0xc
ffffffffc02037ea:	83b1                	srli	a5,a5,0xc
ffffffffc02037ec:	06b2                	slli	a3,a3,0xc
ffffffffc02037ee:	52e7f563          	bgeu	a5,a4,ffffffffc0203d18 <pmm_init+0x938>
ffffffffc02037f2:	0009b783          	ld	a5,0(s3)
ffffffffc02037f6:	10000513          	li	a0,256
ffffffffc02037fa:	96be                	add	a3,a3,a5
ffffffffc02037fc:	10068023          	sb	zero,256(a3) # fffffffffffff100 <end+0x3fde9b00>
ffffffffc0203800:	6d1000ef          	jal	ra,ffffffffc02046d0 <strlen>
ffffffffc0203804:	40051063          	bnez	a0,ffffffffc0203c04 <pmm_init+0x824>
ffffffffc0203808:	4585                	li	a1,1
ffffffffc020380a:	8556                	mv	a0,s5
ffffffffc020380c:	ff2ff0ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0203810:	601c                	ld	a5,0(s0)
ffffffffc0203812:	6098                	ld	a4,0(s1)
ffffffffc0203814:	639c                	ld	a5,0(a5)
ffffffffc0203816:	078a                	slli	a5,a5,0x2
ffffffffc0203818:	83b1                	srli	a5,a5,0xc
ffffffffc020381a:	08e7fe63          	bgeu	a5,a4,ffffffffc02038b6 <pmm_init+0x4d6>
ffffffffc020381e:	00093503          	ld	a0,0(s2)
ffffffffc0203822:	414787b3          	sub	a5,a5,s4
ffffffffc0203826:	079a                	slli	a5,a5,0x6
ffffffffc0203828:	953e                	add	a0,a0,a5
ffffffffc020382a:	4585                	li	a1,1
ffffffffc020382c:	fd2ff0ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0203830:	601c                	ld	a5,0(s0)
ffffffffc0203832:	00003517          	auipc	a0,0x3
ffffffffc0203836:	03650513          	addi	a0,a0,54 # ffffffffc0206868 <default_pmm_manager+0x560>
ffffffffc020383a:	0007b023          	sd	zero,0(a5) # ffffffffc0200000 <kern_entry>
ffffffffc020383e:	8abfc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0203842:	7442                	ld	s0,48(sp)
ffffffffc0203844:	70e2                	ld	ra,56(sp)
ffffffffc0203846:	74a2                	ld	s1,40(sp)
ffffffffc0203848:	7902                	ld	s2,32(sp)
ffffffffc020384a:	69e2                	ld	s3,24(sp)
ffffffffc020384c:	6a42                	ld	s4,16(sp)
ffffffffc020384e:	6aa2                	ld	s5,8(sp)
ffffffffc0203850:	6b02                	ld	s6,0(sp)
ffffffffc0203852:	6121                	addi	sp,sp,64
ffffffffc0203854:	964fe06f          	j	ffffffffc02019b8 <kmalloc_init>
ffffffffc0203858:	6008                	ld	a0,0(s0)
ffffffffc020385a:	bf09                	j	ffffffffc020376c <pmm_init+0x38c>
ffffffffc020385c:	00003697          	auipc	a3,0x3
ffffffffc0203860:	ebc68693          	addi	a3,a3,-324 # ffffffffc0206718 <default_pmm_manager+0x410>
ffffffffc0203864:	00002617          	auipc	a2,0x2
ffffffffc0203868:	d2c60613          	addi	a2,a2,-724 # ffffffffc0205590 <commands+0x860>
ffffffffc020386c:	1c100593          	li	a1,449
ffffffffc0203870:	00003517          	auipc	a0,0x3
ffffffffc0203874:	ae850513          	addi	a0,a0,-1304 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203878:	975fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020387c:	00003697          	auipc	a3,0x3
ffffffffc0203880:	e5c68693          	addi	a3,a3,-420 # ffffffffc02066d8 <default_pmm_manager+0x3d0>
ffffffffc0203884:	00002617          	auipc	a2,0x2
ffffffffc0203888:	d0c60613          	addi	a2,a2,-756 # ffffffffc0205590 <commands+0x860>
ffffffffc020388c:	1c000593          	li	a1,448
ffffffffc0203890:	00003517          	auipc	a0,0x3
ffffffffc0203894:	ac850513          	addi	a0,a0,-1336 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203898:	955fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc020389c:	86d2                	mv	a3,s4
ffffffffc020389e:	00002617          	auipc	a2,0x2
ffffffffc02038a2:	28260613          	addi	a2,a2,642 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc02038a6:	1c000593          	li	a1,448
ffffffffc02038aa:	00003517          	auipc	a0,0x3
ffffffffc02038ae:	aae50513          	addi	a0,a0,-1362 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc02038b2:	93bfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02038b6:	ea4ff0ef          	jal	ra,ffffffffc0202f5a <pa2page.part.4>
ffffffffc02038ba:	00003697          	auipc	a3,0x3
ffffffffc02038be:	b7668693          	addi	a3,a3,-1162 # ffffffffc0206430 <default_pmm_manager+0x128>
ffffffffc02038c2:	00002617          	auipc	a2,0x2
ffffffffc02038c6:	cce60613          	addi	a2,a2,-818 # ffffffffc0205590 <commands+0x860>
ffffffffc02038ca:	18e00593          	li	a1,398
ffffffffc02038ce:	00003517          	auipc	a0,0x3
ffffffffc02038d2:	a8a50513          	addi	a0,a0,-1398 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc02038d6:	917fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02038da:	00002617          	auipc	a2,0x2
ffffffffc02038de:	57e60613          	addi	a2,a2,1406 # ffffffffc0205e58 <commands+0x1128>
ffffffffc02038e2:	07400593          	li	a1,116
ffffffffc02038e6:	00002517          	auipc	a0,0x2
ffffffffc02038ea:	fda50513          	addi	a0,a0,-38 # ffffffffc02058c0 <commands+0xb90>
ffffffffc02038ee:	8fffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02038f2:	00003697          	auipc	a3,0x3
ffffffffc02038f6:	c1668693          	addi	a3,a3,-1002 # ffffffffc0206508 <default_pmm_manager+0x200>
ffffffffc02038fa:	00002617          	auipc	a2,0x2
ffffffffc02038fe:	c9660613          	addi	a2,a2,-874 # ffffffffc0205590 <commands+0x860>
ffffffffc0203902:	19800593          	li	a1,408
ffffffffc0203906:	00003517          	auipc	a0,0x3
ffffffffc020390a:	a5250513          	addi	a0,a0,-1454 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc020390e:	8dffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203912:	00003697          	auipc	a3,0x3
ffffffffc0203916:	bde68693          	addi	a3,a3,-1058 # ffffffffc02064f0 <default_pmm_manager+0x1e8>
ffffffffc020391a:	00002617          	auipc	a2,0x2
ffffffffc020391e:	c7660613          	addi	a2,a2,-906 # ffffffffc0205590 <commands+0x860>
ffffffffc0203922:	19700593          	li	a1,407
ffffffffc0203926:	00003517          	auipc	a0,0x3
ffffffffc020392a:	a3250513          	addi	a0,a0,-1486 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc020392e:	8bffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203932:	00003697          	auipc	a3,0x3
ffffffffc0203936:	d1668693          	addi	a3,a3,-746 # ffffffffc0206648 <default_pmm_manager+0x340>
ffffffffc020393a:	00002617          	auipc	a2,0x2
ffffffffc020393e:	c5660613          	addi	a2,a2,-938 # ffffffffc0205590 <commands+0x860>
ffffffffc0203942:	1a800593          	li	a1,424
ffffffffc0203946:	00003517          	auipc	a0,0x3
ffffffffc020394a:	a1250513          	addi	a0,a0,-1518 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc020394e:	89ffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203952:	00003697          	auipc	a3,0x3
ffffffffc0203956:	cde68693          	addi	a3,a3,-802 # ffffffffc0206630 <default_pmm_manager+0x328>
ffffffffc020395a:	00002617          	auipc	a2,0x2
ffffffffc020395e:	c3660613          	addi	a2,a2,-970 # ffffffffc0205590 <commands+0x860>
ffffffffc0203962:	1a700593          	li	a1,423
ffffffffc0203966:	00003517          	auipc	a0,0x3
ffffffffc020396a:	9f250513          	addi	a0,a0,-1550 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc020396e:	87ffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203972:	00003697          	auipc	a3,0x3
ffffffffc0203976:	c8e68693          	addi	a3,a3,-882 # ffffffffc0206600 <default_pmm_manager+0x2f8>
ffffffffc020397a:	00002617          	auipc	a2,0x2
ffffffffc020397e:	c1660613          	addi	a2,a2,-1002 # ffffffffc0205590 <commands+0x860>
ffffffffc0203982:	1a600593          	li	a1,422
ffffffffc0203986:	00003517          	auipc	a0,0x3
ffffffffc020398a:	9d250513          	addi	a0,a0,-1582 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc020398e:	85ffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203992:	00003697          	auipc	a3,0x3
ffffffffc0203996:	c5668693          	addi	a3,a3,-938 # ffffffffc02065e8 <default_pmm_manager+0x2e0>
ffffffffc020399a:	00002617          	auipc	a2,0x2
ffffffffc020399e:	bf660613          	addi	a2,a2,-1034 # ffffffffc0205590 <commands+0x860>
ffffffffc02039a2:	1a400593          	li	a1,420
ffffffffc02039a6:	00003517          	auipc	a0,0x3
ffffffffc02039aa:	9b250513          	addi	a0,a0,-1614 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc02039ae:	83ffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02039b2:	00003697          	auipc	a3,0x3
ffffffffc02039b6:	c1e68693          	addi	a3,a3,-994 # ffffffffc02065d0 <default_pmm_manager+0x2c8>
ffffffffc02039ba:	00002617          	auipc	a2,0x2
ffffffffc02039be:	bd660613          	addi	a2,a2,-1066 # ffffffffc0205590 <commands+0x860>
ffffffffc02039c2:	1a300593          	li	a1,419
ffffffffc02039c6:	00003517          	auipc	a0,0x3
ffffffffc02039ca:	99250513          	addi	a0,a0,-1646 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc02039ce:	81ffc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02039d2:	00003697          	auipc	a3,0x3
ffffffffc02039d6:	bee68693          	addi	a3,a3,-1042 # ffffffffc02065c0 <default_pmm_manager+0x2b8>
ffffffffc02039da:	00002617          	auipc	a2,0x2
ffffffffc02039de:	bb660613          	addi	a2,a2,-1098 # ffffffffc0205590 <commands+0x860>
ffffffffc02039e2:	1a200593          	li	a1,418
ffffffffc02039e6:	00003517          	auipc	a0,0x3
ffffffffc02039ea:	97250513          	addi	a0,a0,-1678 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc02039ee:	ffefc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02039f2:	00003697          	auipc	a3,0x3
ffffffffc02039f6:	bbe68693          	addi	a3,a3,-1090 # ffffffffc02065b0 <default_pmm_manager+0x2a8>
ffffffffc02039fa:	00002617          	auipc	a2,0x2
ffffffffc02039fe:	b9660613          	addi	a2,a2,-1130 # ffffffffc0205590 <commands+0x860>
ffffffffc0203a02:	1a100593          	li	a1,417
ffffffffc0203a06:	00003517          	auipc	a0,0x3
ffffffffc0203a0a:	95250513          	addi	a0,a0,-1710 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203a0e:	fdefc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203a12:	00003697          	auipc	a3,0x3
ffffffffc0203a16:	b6e68693          	addi	a3,a3,-1170 # ffffffffc0206580 <default_pmm_manager+0x278>
ffffffffc0203a1a:	00002617          	auipc	a2,0x2
ffffffffc0203a1e:	b7660613          	addi	a2,a2,-1162 # ffffffffc0205590 <commands+0x860>
ffffffffc0203a22:	1a000593          	li	a1,416
ffffffffc0203a26:	00003517          	auipc	a0,0x3
ffffffffc0203a2a:	93250513          	addi	a0,a0,-1742 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203a2e:	fbefc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203a32:	00003697          	auipc	a3,0x3
ffffffffc0203a36:	b1668693          	addi	a3,a3,-1258 # ffffffffc0206548 <default_pmm_manager+0x240>
ffffffffc0203a3a:	00002617          	auipc	a2,0x2
ffffffffc0203a3e:	b5660613          	addi	a2,a2,-1194 # ffffffffc0205590 <commands+0x860>
ffffffffc0203a42:	19f00593          	li	a1,415
ffffffffc0203a46:	00003517          	auipc	a0,0x3
ffffffffc0203a4a:	91250513          	addi	a0,a0,-1774 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203a4e:	f9efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203a52:	00003697          	auipc	a3,0x3
ffffffffc0203a56:	ace68693          	addi	a3,a3,-1330 # ffffffffc0206520 <default_pmm_manager+0x218>
ffffffffc0203a5a:	00002617          	auipc	a2,0x2
ffffffffc0203a5e:	b3660613          	addi	a2,a2,-1226 # ffffffffc0205590 <commands+0x860>
ffffffffc0203a62:	19c00593          	li	a1,412
ffffffffc0203a66:	00003517          	auipc	a0,0x3
ffffffffc0203a6a:	8f250513          	addi	a0,a0,-1806 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203a6e:	f7efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203a72:	00003697          	auipc	a3,0x3
ffffffffc0203a76:	c0668693          	addi	a3,a3,-1018 # ffffffffc0206678 <default_pmm_manager+0x370>
ffffffffc0203a7a:	00002617          	auipc	a2,0x2
ffffffffc0203a7e:	b1660613          	addi	a2,a2,-1258 # ffffffffc0205590 <commands+0x860>
ffffffffc0203a82:	1b200593          	li	a1,434
ffffffffc0203a86:	00003517          	auipc	a0,0x3
ffffffffc0203a8a:	8d250513          	addi	a0,a0,-1838 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203a8e:	f5efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203a92:	00003697          	auipc	a3,0x3
ffffffffc0203a96:	bb668693          	addi	a3,a3,-1098 # ffffffffc0206648 <default_pmm_manager+0x340>
ffffffffc0203a9a:	00002617          	auipc	a2,0x2
ffffffffc0203a9e:	af660613          	addi	a2,a2,-1290 # ffffffffc0205590 <commands+0x860>
ffffffffc0203aa2:	1af00593          	li	a1,431
ffffffffc0203aa6:	00003517          	auipc	a0,0x3
ffffffffc0203aaa:	8b250513          	addi	a0,a0,-1870 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203aae:	f3efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203ab2:	00003697          	auipc	a3,0x3
ffffffffc0203ab6:	a5668693          	addi	a3,a3,-1450 # ffffffffc0206508 <default_pmm_manager+0x200>
ffffffffc0203aba:	00002617          	auipc	a2,0x2
ffffffffc0203abe:	ad660613          	addi	a2,a2,-1322 # ffffffffc0205590 <commands+0x860>
ffffffffc0203ac2:	1ae00593          	li	a1,430
ffffffffc0203ac6:	00003517          	auipc	a0,0x3
ffffffffc0203aca:	89250513          	addi	a0,a0,-1902 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203ace:	f1efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203ad2:	00003697          	auipc	a3,0x3
ffffffffc0203ad6:	b8e68693          	addi	a3,a3,-1138 # ffffffffc0206660 <default_pmm_manager+0x358>
ffffffffc0203ada:	00002617          	auipc	a2,0x2
ffffffffc0203ade:	ab660613          	addi	a2,a2,-1354 # ffffffffc0205590 <commands+0x860>
ffffffffc0203ae2:	1ab00593          	li	a1,427
ffffffffc0203ae6:	00003517          	auipc	a0,0x3
ffffffffc0203aea:	87250513          	addi	a0,a0,-1934 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203aee:	efefc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203af2:	00003697          	auipc	a3,0x3
ffffffffc0203af6:	9fe68693          	addi	a3,a3,-1538 # ffffffffc02064f0 <default_pmm_manager+0x1e8>
ffffffffc0203afa:	00002617          	auipc	a2,0x2
ffffffffc0203afe:	a9660613          	addi	a2,a2,-1386 # ffffffffc0205590 <commands+0x860>
ffffffffc0203b02:	1aa00593          	li	a1,426
ffffffffc0203b06:	00003517          	auipc	a0,0x3
ffffffffc0203b0a:	85250513          	addi	a0,a0,-1966 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203b0e:	edefc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203b12:	00003697          	auipc	a3,0x3
ffffffffc0203b16:	a6e68693          	addi	a3,a3,-1426 # ffffffffc0206580 <default_pmm_manager+0x278>
ffffffffc0203b1a:	00002617          	auipc	a2,0x2
ffffffffc0203b1e:	a7660613          	addi	a2,a2,-1418 # ffffffffc0205590 <commands+0x860>
ffffffffc0203b22:	1a900593          	li	a1,425
ffffffffc0203b26:	00003517          	auipc	a0,0x3
ffffffffc0203b2a:	83250513          	addi	a0,a0,-1998 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203b2e:	ebefc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203b32:	00003697          	auipc	a3,0x3
ffffffffc0203b36:	ca668693          	addi	a3,a3,-858 # ffffffffc02067d8 <default_pmm_manager+0x4d0>
ffffffffc0203b3a:	00002617          	auipc	a2,0x2
ffffffffc0203b3e:	a5660613          	addi	a2,a2,-1450 # ffffffffc0205590 <commands+0x860>
ffffffffc0203b42:	1cb00593          	li	a1,459
ffffffffc0203b46:	00003517          	auipc	a0,0x3
ffffffffc0203b4a:	81250513          	addi	a0,a0,-2030 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203b4e:	e9efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203b52:	00003697          	auipc	a3,0x3
ffffffffc0203b56:	c4668693          	addi	a3,a3,-954 # ffffffffc0206798 <default_pmm_manager+0x490>
ffffffffc0203b5a:	00002617          	auipc	a2,0x2
ffffffffc0203b5e:	a3660613          	addi	a2,a2,-1482 # ffffffffc0205590 <commands+0x860>
ffffffffc0203b62:	1ca00593          	li	a1,458
ffffffffc0203b66:	00002517          	auipc	a0,0x2
ffffffffc0203b6a:	7f250513          	addi	a0,a0,2034 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203b6e:	e7efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203b72:	00003697          	auipc	a3,0x3
ffffffffc0203b76:	b1e68693          	addi	a3,a3,-1250 # ffffffffc0206690 <default_pmm_manager+0x388>
ffffffffc0203b7a:	00002617          	auipc	a2,0x2
ffffffffc0203b7e:	a1660613          	addi	a2,a2,-1514 # ffffffffc0205590 <commands+0x860>
ffffffffc0203b82:	1b500593          	li	a1,437
ffffffffc0203b86:	00002517          	auipc	a0,0x2
ffffffffc0203b8a:	7d250513          	addi	a0,a0,2002 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203b8e:	e5efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203b92:	00003697          	auipc	a3,0x3
ffffffffc0203b96:	ab668693          	addi	a3,a3,-1354 # ffffffffc0206648 <default_pmm_manager+0x340>
ffffffffc0203b9a:	00002617          	auipc	a2,0x2
ffffffffc0203b9e:	9f660613          	addi	a2,a2,-1546 # ffffffffc0205590 <commands+0x860>
ffffffffc0203ba2:	1b300593          	li	a1,435
ffffffffc0203ba6:	00002517          	auipc	a0,0x2
ffffffffc0203baa:	7b250513          	addi	a0,a0,1970 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203bae:	e3efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203bb2:	00003697          	auipc	a3,0x3
ffffffffc0203bb6:	b7e68693          	addi	a3,a3,-1154 # ffffffffc0206730 <default_pmm_manager+0x428>
ffffffffc0203bba:	00002617          	auipc	a2,0x2
ffffffffc0203bbe:	9d660613          	addi	a2,a2,-1578 # ffffffffc0205590 <commands+0x860>
ffffffffc0203bc2:	1c400593          	li	a1,452
ffffffffc0203bc6:	00002517          	auipc	a0,0x2
ffffffffc0203bca:	79250513          	addi	a0,a0,1938 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203bce:	e1efc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203bd2:	86aa                	mv	a3,a0
ffffffffc0203bd4:	00002617          	auipc	a2,0x2
ffffffffc0203bd8:	f7460613          	addi	a2,a2,-140 # ffffffffc0205b48 <commands+0xe18>
ffffffffc0203bdc:	0c300593          	li	a1,195
ffffffffc0203be0:	00002517          	auipc	a0,0x2
ffffffffc0203be4:	77850513          	addi	a0,a0,1912 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203be8:	e04fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203bec:	00002617          	auipc	a2,0x2
ffffffffc0203bf0:	f5c60613          	addi	a2,a2,-164 # ffffffffc0205b48 <commands+0xe18>
ffffffffc0203bf4:	07f00593          	li	a1,127
ffffffffc0203bf8:	00002517          	auipc	a0,0x2
ffffffffc0203bfc:	76050513          	addi	a0,a0,1888 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203c00:	decfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203c04:	00003697          	auipc	a3,0x3
ffffffffc0203c08:	c3c68693          	addi	a3,a3,-964 # ffffffffc0206840 <default_pmm_manager+0x538>
ffffffffc0203c0c:	00002617          	auipc	a2,0x2
ffffffffc0203c10:	98460613          	addi	a2,a2,-1660 # ffffffffc0205590 <commands+0x860>
ffffffffc0203c14:	1d200593          	li	a1,466
ffffffffc0203c18:	00002517          	auipc	a0,0x2
ffffffffc0203c1c:	74050513          	addi	a0,a0,1856 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203c20:	dccfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203c24:	00003697          	auipc	a3,0x3
ffffffffc0203c28:	b5c68693          	addi	a3,a3,-1188 # ffffffffc0206780 <default_pmm_manager+0x478>
ffffffffc0203c2c:	00002617          	auipc	a2,0x2
ffffffffc0203c30:	96460613          	addi	a2,a2,-1692 # ffffffffc0205590 <commands+0x860>
ffffffffc0203c34:	1c900593          	li	a1,457
ffffffffc0203c38:	00002517          	auipc	a0,0x2
ffffffffc0203c3c:	72050513          	addi	a0,a0,1824 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203c40:	dacfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203c44:	00003697          	auipc	a3,0x3
ffffffffc0203c48:	b0468693          	addi	a3,a3,-1276 # ffffffffc0206748 <default_pmm_manager+0x440>
ffffffffc0203c4c:	00002617          	auipc	a2,0x2
ffffffffc0203c50:	94460613          	addi	a2,a2,-1724 # ffffffffc0205590 <commands+0x860>
ffffffffc0203c54:	1c800593          	li	a1,456
ffffffffc0203c58:	00002517          	auipc	a0,0x2
ffffffffc0203c5c:	70050513          	addi	a0,a0,1792 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203c60:	d8cfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203c64:	00002697          	auipc	a3,0x2
ffffffffc0203c68:	7ac68693          	addi	a3,a3,1964 # ffffffffc0206410 <default_pmm_manager+0x108>
ffffffffc0203c6c:	00002617          	auipc	a2,0x2
ffffffffc0203c70:	92460613          	addi	a2,a2,-1756 # ffffffffc0205590 <commands+0x860>
ffffffffc0203c74:	18d00593          	li	a1,397
ffffffffc0203c78:	00002517          	auipc	a0,0x2
ffffffffc0203c7c:	6e050513          	addi	a0,a0,1760 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203c80:	d6cfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203c84:	00003697          	auipc	a3,0x3
ffffffffc0203c88:	83c68693          	addi	a3,a3,-1988 # ffffffffc02064c0 <default_pmm_manager+0x1b8>
ffffffffc0203c8c:	00002617          	auipc	a2,0x2
ffffffffc0203c90:	90460613          	addi	a2,a2,-1788 # ffffffffc0205590 <commands+0x860>
ffffffffc0203c94:	19600593          	li	a1,406
ffffffffc0203c98:	00002517          	auipc	a0,0x2
ffffffffc0203c9c:	6c050513          	addi	a0,a0,1728 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203ca0:	d4cfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203ca4:	00002697          	auipc	a3,0x2
ffffffffc0203ca8:	7ec68693          	addi	a3,a3,2028 # ffffffffc0206490 <default_pmm_manager+0x188>
ffffffffc0203cac:	00002617          	auipc	a2,0x2
ffffffffc0203cb0:	8e460613          	addi	a2,a2,-1820 # ffffffffc0205590 <commands+0x860>
ffffffffc0203cb4:	19300593          	li	a1,403
ffffffffc0203cb8:	00002517          	auipc	a0,0x2
ffffffffc0203cbc:	6a050513          	addi	a0,a0,1696 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203cc0:	d2cfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203cc4:	00002697          	auipc	a3,0x2
ffffffffc0203cc8:	7a468693          	addi	a3,a3,1956 # ffffffffc0206468 <default_pmm_manager+0x160>
ffffffffc0203ccc:	00002617          	auipc	a2,0x2
ffffffffc0203cd0:	8c460613          	addi	a2,a2,-1852 # ffffffffc0205590 <commands+0x860>
ffffffffc0203cd4:	18f00593          	li	a1,399
ffffffffc0203cd8:	00002517          	auipc	a0,0x2
ffffffffc0203cdc:	68050513          	addi	a0,a0,1664 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203ce0:	d0cfc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203ce4:	86d6                	mv	a3,s5
ffffffffc0203ce6:	00002617          	auipc	a2,0x2
ffffffffc0203cea:	e3a60613          	addi	a2,a2,-454 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc0203cee:	19b00593          	li	a1,411
ffffffffc0203cf2:	00002517          	auipc	a0,0x2
ffffffffc0203cf6:	66650513          	addi	a0,a0,1638 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203cfa:	cf2fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203cfe:	86be                	mv	a3,a5
ffffffffc0203d00:	00002617          	auipc	a2,0x2
ffffffffc0203d04:	e2060613          	addi	a2,a2,-480 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc0203d08:	19a00593          	li	a1,410
ffffffffc0203d0c:	00002517          	auipc	a0,0x2
ffffffffc0203d10:	64c50513          	addi	a0,a0,1612 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203d14:	cd8fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203d18:	00002617          	auipc	a2,0x2
ffffffffc0203d1c:	e0860613          	addi	a2,a2,-504 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc0203d20:	06900593          	li	a1,105
ffffffffc0203d24:	00002517          	auipc	a0,0x2
ffffffffc0203d28:	b9c50513          	addi	a0,a0,-1124 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0203d2c:	cc0fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203d30:	00003697          	auipc	a3,0x3
ffffffffc0203d34:	ad868693          	addi	a3,a3,-1320 # ffffffffc0206808 <default_pmm_manager+0x500>
ffffffffc0203d38:	00002617          	auipc	a2,0x2
ffffffffc0203d3c:	85860613          	addi	a2,a2,-1960 # ffffffffc0205590 <commands+0x860>
ffffffffc0203d40:	1cf00593          	li	a1,463
ffffffffc0203d44:	00002517          	auipc	a0,0x2
ffffffffc0203d48:	61450513          	addi	a0,a0,1556 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203d4c:	ca0fc0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0203d50 <tlb_invalidate>:
ffffffffc0203d50:	12058073          	sfence.vma	a1
ffffffffc0203d54:	8082                	ret

ffffffffc0203d56 <pgdir_alloc_page>:
ffffffffc0203d56:	7179                	addi	sp,sp,-48
ffffffffc0203d58:	e84a                	sd	s2,16(sp)
ffffffffc0203d5a:	892a                	mv	s2,a0
ffffffffc0203d5c:	4505                	li	a0,1
ffffffffc0203d5e:	f022                	sd	s0,32(sp)
ffffffffc0203d60:	ec26                	sd	s1,24(sp)
ffffffffc0203d62:	e44e                	sd	s3,8(sp)
ffffffffc0203d64:	f406                	sd	ra,40(sp)
ffffffffc0203d66:	84ae                	mv	s1,a1
ffffffffc0203d68:	89b2                	mv	s3,a2
ffffffffc0203d6a:	a0cff0ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc0203d6e:	842a                	mv	s0,a0
ffffffffc0203d70:	cd19                	beqz	a0,ffffffffc0203d8e <pgdir_alloc_page+0x38>
ffffffffc0203d72:	85aa                	mv	a1,a0
ffffffffc0203d74:	86ce                	mv	a3,s3
ffffffffc0203d76:	8626                	mv	a2,s1
ffffffffc0203d78:	854a                	mv	a0,s2
ffffffffc0203d7a:	da8ff0ef          	jal	ra,ffffffffc0203322 <page_insert>
ffffffffc0203d7e:	ed39                	bnez	a0,ffffffffc0203ddc <pgdir_alloc_page+0x86>
ffffffffc0203d80:	00011797          	auipc	a5,0x11
ffffffffc0203d84:	71878793          	addi	a5,a5,1816 # ffffffffc0215498 <swap_init_ok>
ffffffffc0203d88:	439c                	lw	a5,0(a5)
ffffffffc0203d8a:	2781                	sext.w	a5,a5
ffffffffc0203d8c:	eb89                	bnez	a5,ffffffffc0203d9e <pgdir_alloc_page+0x48>
ffffffffc0203d8e:	8522                	mv	a0,s0
ffffffffc0203d90:	70a2                	ld	ra,40(sp)
ffffffffc0203d92:	7402                	ld	s0,32(sp)
ffffffffc0203d94:	64e2                	ld	s1,24(sp)
ffffffffc0203d96:	6942                	ld	s2,16(sp)
ffffffffc0203d98:	69a2                	ld	s3,8(sp)
ffffffffc0203d9a:	6145                	addi	sp,sp,48
ffffffffc0203d9c:	8082                	ret
ffffffffc0203d9e:	00011797          	auipc	a5,0x11
ffffffffc0203da2:	73a78793          	addi	a5,a5,1850 # ffffffffc02154d8 <check_mm_struct>
ffffffffc0203da6:	6388                	ld	a0,0(a5)
ffffffffc0203da8:	4681                	li	a3,0
ffffffffc0203daa:	8622                	mv	a2,s0
ffffffffc0203dac:	85a6                	mv	a1,s1
ffffffffc0203dae:	cc0fe0ef          	jal	ra,ffffffffc020226e <swap_map_swappable>
ffffffffc0203db2:	4018                	lw	a4,0(s0)
ffffffffc0203db4:	fc04                	sd	s1,56(s0)
ffffffffc0203db6:	4785                	li	a5,1
ffffffffc0203db8:	fcf70be3          	beq	a4,a5,ffffffffc0203d8e <pgdir_alloc_page+0x38>
ffffffffc0203dbc:	00002697          	auipc	a3,0x2
ffffffffc0203dc0:	5ac68693          	addi	a3,a3,1452 # ffffffffc0206368 <default_pmm_manager+0x60>
ffffffffc0203dc4:	00001617          	auipc	a2,0x1
ffffffffc0203dc8:	7cc60613          	addi	a2,a2,1996 # ffffffffc0205590 <commands+0x860>
ffffffffc0203dcc:	17900593          	li	a1,377
ffffffffc0203dd0:	00002517          	auipc	a0,0x2
ffffffffc0203dd4:	58850513          	addi	a0,a0,1416 # ffffffffc0206358 <default_pmm_manager+0x50>
ffffffffc0203dd8:	c14fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203ddc:	8522                	mv	a0,s0
ffffffffc0203dde:	4585                	li	a1,1
ffffffffc0203de0:	a1eff0ef          	jal	ra,ffffffffc0202ffe <free_pages>
ffffffffc0203de4:	4401                	li	s0,0
ffffffffc0203de6:	b765                	j	ffffffffc0203d8e <pgdir_alloc_page+0x38>

ffffffffc0203de8 <swapfs_init>:
ffffffffc0203de8:	1141                	addi	sp,sp,-16
ffffffffc0203dea:	4505                	li	a0,1
ffffffffc0203dec:	e406                	sd	ra,8(sp)
ffffffffc0203dee:	ed8fc0ef          	jal	ra,ffffffffc02004c6 <ide_device_valid>
ffffffffc0203df2:	cd01                	beqz	a0,ffffffffc0203e0a <swapfs_init+0x22>
ffffffffc0203df4:	4505                	li	a0,1
ffffffffc0203df6:	ed6fc0ef          	jal	ra,ffffffffc02004cc <ide_device_size>
ffffffffc0203dfa:	60a2                	ld	ra,8(sp)
ffffffffc0203dfc:	810d                	srli	a0,a0,0x3
ffffffffc0203dfe:	00011797          	auipc	a5,0x11
ffffffffc0203e02:	76a7bd23          	sd	a0,1914(a5) # ffffffffc0215578 <max_swap_offset>
ffffffffc0203e06:	0141                	addi	sp,sp,16
ffffffffc0203e08:	8082                	ret
ffffffffc0203e0a:	00003617          	auipc	a2,0x3
ffffffffc0203e0e:	a7e60613          	addi	a2,a2,-1410 # ffffffffc0206888 <default_pmm_manager+0x580>
ffffffffc0203e12:	45b5                	li	a1,13
ffffffffc0203e14:	00003517          	auipc	a0,0x3
ffffffffc0203e18:	a9450513          	addi	a0,a0,-1388 # ffffffffc02068a8 <default_pmm_manager+0x5a0>
ffffffffc0203e1c:	bd0fc0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0203e20 <swapfs_read>:
ffffffffc0203e20:	1141                	addi	sp,sp,-16
ffffffffc0203e22:	e406                	sd	ra,8(sp)
ffffffffc0203e24:	00855793          	srli	a5,a0,0x8
ffffffffc0203e28:	cfb9                	beqz	a5,ffffffffc0203e86 <swapfs_read+0x66>
ffffffffc0203e2a:	00011717          	auipc	a4,0x11
ffffffffc0203e2e:	74e70713          	addi	a4,a4,1870 # ffffffffc0215578 <max_swap_offset>
ffffffffc0203e32:	6318                	ld	a4,0(a4)
ffffffffc0203e34:	04e7f963          	bgeu	a5,a4,ffffffffc0203e86 <swapfs_read+0x66>
ffffffffc0203e38:	00011717          	auipc	a4,0x11
ffffffffc0203e3c:	7b070713          	addi	a4,a4,1968 # ffffffffc02155e8 <pages>
ffffffffc0203e40:	6310                	ld	a2,0(a4)
ffffffffc0203e42:	00003717          	auipc	a4,0x3
ffffffffc0203e46:	e3670713          	addi	a4,a4,-458 # ffffffffc0206c78 <nbase>
ffffffffc0203e4a:	40c58633          	sub	a2,a1,a2
ffffffffc0203e4e:	630c                	ld	a1,0(a4)
ffffffffc0203e50:	8619                	srai	a2,a2,0x6
ffffffffc0203e52:	00011717          	auipc	a4,0x11
ffffffffc0203e56:	65670713          	addi	a4,a4,1622 # ffffffffc02154a8 <npage>
ffffffffc0203e5a:	962e                	add	a2,a2,a1
ffffffffc0203e5c:	6314                	ld	a3,0(a4)
ffffffffc0203e5e:	00c61713          	slli	a4,a2,0xc
ffffffffc0203e62:	8331                	srli	a4,a4,0xc
ffffffffc0203e64:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203e68:	0632                	slli	a2,a2,0xc
ffffffffc0203e6a:	02d77a63          	bgeu	a4,a3,ffffffffc0203e9e <swapfs_read+0x7e>
ffffffffc0203e6e:	00011797          	auipc	a5,0x11
ffffffffc0203e72:	76a78793          	addi	a5,a5,1898 # ffffffffc02155d8 <va_pa_offset>
ffffffffc0203e76:	639c                	ld	a5,0(a5)
ffffffffc0203e78:	60a2                	ld	ra,8(sp)
ffffffffc0203e7a:	46a1                	li	a3,8
ffffffffc0203e7c:	963e                	add	a2,a2,a5
ffffffffc0203e7e:	4505                	li	a0,1
ffffffffc0203e80:	0141                	addi	sp,sp,16
ffffffffc0203e82:	e50fc06f          	j	ffffffffc02004d2 <ide_read_secs>
ffffffffc0203e86:	86aa                	mv	a3,a0
ffffffffc0203e88:	00003617          	auipc	a2,0x3
ffffffffc0203e8c:	a3860613          	addi	a2,a2,-1480 # ffffffffc02068c0 <default_pmm_manager+0x5b8>
ffffffffc0203e90:	45d1                	li	a1,20
ffffffffc0203e92:	00003517          	auipc	a0,0x3
ffffffffc0203e96:	a1650513          	addi	a0,a0,-1514 # ffffffffc02068a8 <default_pmm_manager+0x5a0>
ffffffffc0203e9a:	b52fc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203e9e:	86b2                	mv	a3,a2
ffffffffc0203ea0:	06900593          	li	a1,105
ffffffffc0203ea4:	00002617          	auipc	a2,0x2
ffffffffc0203ea8:	c7c60613          	addi	a2,a2,-900 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc0203eac:	00002517          	auipc	a0,0x2
ffffffffc0203eb0:	a1450513          	addi	a0,a0,-1516 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0203eb4:	b38fc0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0203eb8 <swapfs_write>:
ffffffffc0203eb8:	1141                	addi	sp,sp,-16
ffffffffc0203eba:	e406                	sd	ra,8(sp)
ffffffffc0203ebc:	00855793          	srli	a5,a0,0x8
ffffffffc0203ec0:	cfb9                	beqz	a5,ffffffffc0203f1e <swapfs_write+0x66>
ffffffffc0203ec2:	00011717          	auipc	a4,0x11
ffffffffc0203ec6:	6b670713          	addi	a4,a4,1718 # ffffffffc0215578 <max_swap_offset>
ffffffffc0203eca:	6318                	ld	a4,0(a4)
ffffffffc0203ecc:	04e7f963          	bgeu	a5,a4,ffffffffc0203f1e <swapfs_write+0x66>
ffffffffc0203ed0:	00011717          	auipc	a4,0x11
ffffffffc0203ed4:	71870713          	addi	a4,a4,1816 # ffffffffc02155e8 <pages>
ffffffffc0203ed8:	6310                	ld	a2,0(a4)
ffffffffc0203eda:	00003717          	auipc	a4,0x3
ffffffffc0203ede:	d9e70713          	addi	a4,a4,-610 # ffffffffc0206c78 <nbase>
ffffffffc0203ee2:	40c58633          	sub	a2,a1,a2
ffffffffc0203ee6:	630c                	ld	a1,0(a4)
ffffffffc0203ee8:	8619                	srai	a2,a2,0x6
ffffffffc0203eea:	00011717          	auipc	a4,0x11
ffffffffc0203eee:	5be70713          	addi	a4,a4,1470 # ffffffffc02154a8 <npage>
ffffffffc0203ef2:	962e                	add	a2,a2,a1
ffffffffc0203ef4:	6314                	ld	a3,0(a4)
ffffffffc0203ef6:	00c61713          	slli	a4,a2,0xc
ffffffffc0203efa:	8331                	srli	a4,a4,0xc
ffffffffc0203efc:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203f00:	0632                	slli	a2,a2,0xc
ffffffffc0203f02:	02d77a63          	bgeu	a4,a3,ffffffffc0203f36 <swapfs_write+0x7e>
ffffffffc0203f06:	00011797          	auipc	a5,0x11
ffffffffc0203f0a:	6d278793          	addi	a5,a5,1746 # ffffffffc02155d8 <va_pa_offset>
ffffffffc0203f0e:	639c                	ld	a5,0(a5)
ffffffffc0203f10:	60a2                	ld	ra,8(sp)
ffffffffc0203f12:	46a1                	li	a3,8
ffffffffc0203f14:	963e                	add	a2,a2,a5
ffffffffc0203f16:	4505                	li	a0,1
ffffffffc0203f18:	0141                	addi	sp,sp,16
ffffffffc0203f1a:	ddcfc06f          	j	ffffffffc02004f6 <ide_write_secs>
ffffffffc0203f1e:	86aa                	mv	a3,a0
ffffffffc0203f20:	00003617          	auipc	a2,0x3
ffffffffc0203f24:	9a060613          	addi	a2,a2,-1632 # ffffffffc02068c0 <default_pmm_manager+0x5b8>
ffffffffc0203f28:	45e5                	li	a1,25
ffffffffc0203f2a:	00003517          	auipc	a0,0x3
ffffffffc0203f2e:	97e50513          	addi	a0,a0,-1666 # ffffffffc02068a8 <default_pmm_manager+0x5a0>
ffffffffc0203f32:	abafc0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0203f36:	86b2                	mv	a3,a2
ffffffffc0203f38:	06900593          	li	a1,105
ffffffffc0203f3c:	00002617          	auipc	a2,0x2
ffffffffc0203f40:	be460613          	addi	a2,a2,-1052 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc0203f44:	00002517          	auipc	a0,0x2
ffffffffc0203f48:	97c50513          	addi	a0,a0,-1668 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0203f4c:	aa0fc0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0203f50 <switch_to>:
ffffffffc0203f50:	00153023          	sd	ra,0(a0)
ffffffffc0203f54:	00253423          	sd	sp,8(a0)
ffffffffc0203f58:	e900                	sd	s0,16(a0)
ffffffffc0203f5a:	ed04                	sd	s1,24(a0)
ffffffffc0203f5c:	03253023          	sd	s2,32(a0)
ffffffffc0203f60:	03353423          	sd	s3,40(a0)
ffffffffc0203f64:	03453823          	sd	s4,48(a0)
ffffffffc0203f68:	03553c23          	sd	s5,56(a0)
ffffffffc0203f6c:	05653023          	sd	s6,64(a0)
ffffffffc0203f70:	05753423          	sd	s7,72(a0)
ffffffffc0203f74:	05853823          	sd	s8,80(a0)
ffffffffc0203f78:	05953c23          	sd	s9,88(a0)
ffffffffc0203f7c:	07a53023          	sd	s10,96(a0)
ffffffffc0203f80:	07b53423          	sd	s11,104(a0)
ffffffffc0203f84:	0005b083          	ld	ra,0(a1)
ffffffffc0203f88:	0085b103          	ld	sp,8(a1)
ffffffffc0203f8c:	6980                	ld	s0,16(a1)
ffffffffc0203f8e:	6d84                	ld	s1,24(a1)
ffffffffc0203f90:	0205b903          	ld	s2,32(a1)
ffffffffc0203f94:	0285b983          	ld	s3,40(a1)
ffffffffc0203f98:	0305ba03          	ld	s4,48(a1)
ffffffffc0203f9c:	0385ba83          	ld	s5,56(a1)
ffffffffc0203fa0:	0405bb03          	ld	s6,64(a1)
ffffffffc0203fa4:	0485bb83          	ld	s7,72(a1)
ffffffffc0203fa8:	0505bc03          	ld	s8,80(a1)
ffffffffc0203fac:	0585bc83          	ld	s9,88(a1)
ffffffffc0203fb0:	0605bd03          	ld	s10,96(a1)
ffffffffc0203fb4:	0685bd83          	ld	s11,104(a1)
ffffffffc0203fb8:	8082                	ret

ffffffffc0203fba <kernel_thread_entry>:
ffffffffc0203fba:	8526                	mv	a0,s1
ffffffffc0203fbc:	9402                	jalr	s0
ffffffffc0203fbe:	4da000ef          	jal	ra,ffffffffc0204498 <do_exit>

ffffffffc0203fc2 <alloc_proc>:
ffffffffc0203fc2:	1141                	addi	sp,sp,-16
ffffffffc0203fc4:	0e800513          	li	a0,232
ffffffffc0203fc8:	e022                	sd	s0,0(sp)
ffffffffc0203fca:	e406                	sd	ra,8(sp)
ffffffffc0203fcc:	a0dfd0ef          	jal	ra,ffffffffc02019d8 <kmalloc>
ffffffffc0203fd0:	842a                	mv	s0,a0
ffffffffc0203fd2:	c129                	beqz	a0,ffffffffc0204014 <alloc_proc+0x52>
ffffffffc0203fd4:	57fd                	li	a5,-1
ffffffffc0203fd6:	1782                	slli	a5,a5,0x20
ffffffffc0203fd8:	07000613          	li	a2,112
ffffffffc0203fdc:	4581                	li	a1,0
ffffffffc0203fde:	e11c                	sd	a5,0(a0)
ffffffffc0203fe0:	00052423          	sw	zero,8(a0)
ffffffffc0203fe4:	00053823          	sd	zero,16(a0)
ffffffffc0203fe8:	00052c23          	sw	zero,24(a0)
ffffffffc0203fec:	02053023          	sd	zero,32(a0)
ffffffffc0203ff0:	02053423          	sd	zero,40(a0)
ffffffffc0203ff4:	03050513          	addi	a0,a0,48
ffffffffc0203ff8:	776000ef          	jal	ra,ffffffffc020476e <memset>
ffffffffc0203ffc:	4641                	li	a2,16
ffffffffc0203ffe:	0a043023          	sd	zero,160(s0)
ffffffffc0204002:	0a043423          	sd	zero,168(s0)
ffffffffc0204006:	0a042823          	sw	zero,176(s0)
ffffffffc020400a:	4581                	li	a1,0
ffffffffc020400c:	0b440513          	addi	a0,s0,180
ffffffffc0204010:	75e000ef          	jal	ra,ffffffffc020476e <memset>
ffffffffc0204014:	8522                	mv	a0,s0
ffffffffc0204016:	60a2                	ld	ra,8(sp)
ffffffffc0204018:	6402                	ld	s0,0(sp)
ffffffffc020401a:	0141                	addi	sp,sp,16
ffffffffc020401c:	8082                	ret

ffffffffc020401e <forkret>:
ffffffffc020401e:	00011797          	auipc	a5,0x11
ffffffffc0204022:	49278793          	addi	a5,a5,1170 # ffffffffc02154b0 <current>
ffffffffc0204026:	639c                	ld	a5,0(a5)
ffffffffc0204028:	73c8                	ld	a0,160(a5)
ffffffffc020402a:	b73fc06f          	j	ffffffffc0200b9c <forkrets>

ffffffffc020402e <set_proc_name>:
ffffffffc020402e:	1101                	addi	sp,sp,-32
ffffffffc0204030:	e822                	sd	s0,16(sp)
ffffffffc0204032:	0b450413          	addi	s0,a0,180
ffffffffc0204036:	e426                	sd	s1,8(sp)
ffffffffc0204038:	4641                	li	a2,16
ffffffffc020403a:	84ae                	mv	s1,a1
ffffffffc020403c:	8522                	mv	a0,s0
ffffffffc020403e:	4581                	li	a1,0
ffffffffc0204040:	ec06                	sd	ra,24(sp)
ffffffffc0204042:	72c000ef          	jal	ra,ffffffffc020476e <memset>
ffffffffc0204046:	8522                	mv	a0,s0
ffffffffc0204048:	6442                	ld	s0,16(sp)
ffffffffc020404a:	60e2                	ld	ra,24(sp)
ffffffffc020404c:	85a6                	mv	a1,s1
ffffffffc020404e:	64a2                	ld	s1,8(sp)
ffffffffc0204050:	463d                	li	a2,15
ffffffffc0204052:	6105                	addi	sp,sp,32
ffffffffc0204054:	a735                	j	ffffffffc0204780 <memcpy>

ffffffffc0204056 <get_proc_name>:
ffffffffc0204056:	1101                	addi	sp,sp,-32
ffffffffc0204058:	e822                	sd	s0,16(sp)
ffffffffc020405a:	00011417          	auipc	s0,0x11
ffffffffc020405e:	40640413          	addi	s0,s0,1030 # ffffffffc0215460 <name.1565>
ffffffffc0204062:	e426                	sd	s1,8(sp)
ffffffffc0204064:	4641                	li	a2,16
ffffffffc0204066:	84aa                	mv	s1,a0
ffffffffc0204068:	4581                	li	a1,0
ffffffffc020406a:	8522                	mv	a0,s0
ffffffffc020406c:	ec06                	sd	ra,24(sp)
ffffffffc020406e:	700000ef          	jal	ra,ffffffffc020476e <memset>
ffffffffc0204072:	8522                	mv	a0,s0
ffffffffc0204074:	6442                	ld	s0,16(sp)
ffffffffc0204076:	60e2                	ld	ra,24(sp)
ffffffffc0204078:	0b448593          	addi	a1,s1,180
ffffffffc020407c:	64a2                	ld	s1,8(sp)
ffffffffc020407e:	463d                	li	a2,15
ffffffffc0204080:	6105                	addi	sp,sp,32
ffffffffc0204082:	adfd                	j	ffffffffc0204780 <memcpy>

ffffffffc0204084 <init_main>:
ffffffffc0204084:	00011797          	auipc	a5,0x11
ffffffffc0204088:	42c78793          	addi	a5,a5,1068 # ffffffffc02154b0 <current>
ffffffffc020408c:	639c                	ld	a5,0(a5)
ffffffffc020408e:	1101                	addi	sp,sp,-32
ffffffffc0204090:	e426                	sd	s1,8(sp)
ffffffffc0204092:	43c4                	lw	s1,4(a5)
ffffffffc0204094:	e822                	sd	s0,16(sp)
ffffffffc0204096:	842a                	mv	s0,a0
ffffffffc0204098:	853e                	mv	a0,a5
ffffffffc020409a:	ec06                	sd	ra,24(sp)
ffffffffc020409c:	fbbff0ef          	jal	ra,ffffffffc0204056 <get_proc_name>
ffffffffc02040a0:	862a                	mv	a2,a0
ffffffffc02040a2:	85a6                	mv	a1,s1
ffffffffc02040a4:	00003517          	auipc	a0,0x3
ffffffffc02040a8:	89450513          	addi	a0,a0,-1900 # ffffffffc0206938 <default_pmm_manager+0x630>
ffffffffc02040ac:	83cfc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02040b0:	85a2                	mv	a1,s0
ffffffffc02040b2:	00003517          	auipc	a0,0x3
ffffffffc02040b6:	8ae50513          	addi	a0,a0,-1874 # ffffffffc0206960 <default_pmm_manager+0x658>
ffffffffc02040ba:	82efc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02040be:	00003517          	auipc	a0,0x3
ffffffffc02040c2:	8b250513          	addi	a0,a0,-1870 # ffffffffc0206970 <default_pmm_manager+0x668>
ffffffffc02040c6:	822fc0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02040ca:	60e2                	ld	ra,24(sp)
ffffffffc02040cc:	6442                	ld	s0,16(sp)
ffffffffc02040ce:	64a2                	ld	s1,8(sp)
ffffffffc02040d0:	4501                	li	a0,0
ffffffffc02040d2:	6105                	addi	sp,sp,32
ffffffffc02040d4:	8082                	ret

ffffffffc02040d6 <proc_run>:
ffffffffc02040d6:	1101                	addi	sp,sp,-32
ffffffffc02040d8:	00011797          	auipc	a5,0x11
ffffffffc02040dc:	3d878793          	addi	a5,a5,984 # ffffffffc02154b0 <current>
ffffffffc02040e0:	e426                	sd	s1,8(sp)
ffffffffc02040e2:	6384                	ld	s1,0(a5)
ffffffffc02040e4:	ec06                	sd	ra,24(sp)
ffffffffc02040e6:	e822                	sd	s0,16(sp)
ffffffffc02040e8:	e04a                	sd	s2,0(sp)
ffffffffc02040ea:	02a48c63          	beq	s1,a0,ffffffffc0204122 <proc_run+0x4c>
ffffffffc02040ee:	842a                	mv	s0,a0
ffffffffc02040f0:	100027f3          	csrr	a5,sstatus
ffffffffc02040f4:	8b89                	andi	a5,a5,2
ffffffffc02040f6:	4901                	li	s2,0
ffffffffc02040f8:	e3b1                	bnez	a5,ffffffffc020413c <proc_run+0x66>
ffffffffc02040fa:	745c                	ld	a5,168(s0)
ffffffffc02040fc:	00011717          	auipc	a4,0x11
ffffffffc0204100:	3a873a23          	sd	s0,948(a4) # ffffffffc02154b0 <current>
ffffffffc0204104:	80000737          	lui	a4,0x80000
ffffffffc0204108:	00c7d79b          	srliw	a5,a5,0xc
ffffffffc020410c:	8fd9                	or	a5,a5,a4
ffffffffc020410e:	18079073          	csrw	satp,a5
ffffffffc0204112:	03040593          	addi	a1,s0,48
ffffffffc0204116:	03048513          	addi	a0,s1,48
ffffffffc020411a:	e37ff0ef          	jal	ra,ffffffffc0203f50 <switch_to>
ffffffffc020411e:	00091863          	bnez	s2,ffffffffc020412e <proc_run+0x58>
ffffffffc0204122:	60e2                	ld	ra,24(sp)
ffffffffc0204124:	6442                	ld	s0,16(sp)
ffffffffc0204126:	64a2                	ld	s1,8(sp)
ffffffffc0204128:	6902                	ld	s2,0(sp)
ffffffffc020412a:	6105                	addi	sp,sp,32
ffffffffc020412c:	8082                	ret
ffffffffc020412e:	6442                	ld	s0,16(sp)
ffffffffc0204130:	60e2                	ld	ra,24(sp)
ffffffffc0204132:	64a2                	ld	s1,8(sp)
ffffffffc0204134:	6902                	ld	s2,0(sp)
ffffffffc0204136:	6105                	addi	sp,sp,32
ffffffffc0204138:	cacfc06f          	j	ffffffffc02005e4 <intr_enable>
ffffffffc020413c:	caefc0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc0204140:	4905                	li	s2,1
ffffffffc0204142:	bf65                	j	ffffffffc02040fa <proc_run+0x24>

ffffffffc0204144 <find_proc>:
ffffffffc0204144:	7179                	addi	sp,sp,-48
ffffffffc0204146:	ec26                	sd	s1,24(sp)
ffffffffc0204148:	85aa                	mv	a1,a0
ffffffffc020414a:	84aa                	mv	s1,a0
ffffffffc020414c:	00002517          	auipc	a0,0x2
ffffffffc0204150:	7dc50513          	addi	a0,a0,2012 # ffffffffc0206928 <default_pmm_manager+0x620>
ffffffffc0204154:	f406                	sd	ra,40(sp)
ffffffffc0204156:	f022                	sd	s0,32(sp)
ffffffffc0204158:	e84a                	sd	s2,16(sp)
ffffffffc020415a:	e44e                	sd	s3,8(sp)
ffffffffc020415c:	f8dfb0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0204160:	0004851b          	sext.w	a0,s1
ffffffffc0204164:	6789                	lui	a5,0x2
ffffffffc0204166:	fff5071b          	addiw	a4,a0,-1
ffffffffc020416a:	17f9                	addi	a5,a5,-2
ffffffffc020416c:	02e7ef63          	bltu	a5,a4,ffffffffc02041aa <find_proc+0x66>
ffffffffc0204170:	45a9                	li	a1,10
ffffffffc0204172:	213000ef          	jal	ra,ffffffffc0204b84 <hash32>
ffffffffc0204176:	02051913          	slli	s2,a0,0x20
ffffffffc020417a:	01c95913          	srli	s2,s2,0x1c
ffffffffc020417e:	0000d517          	auipc	a0,0xd
ffffffffc0204182:	2e250513          	addi	a0,a0,738 # ffffffffc0211460 <hash_list>
ffffffffc0204186:	992a                	add	s2,s2,a0
ffffffffc0204188:	844a                	mv	s0,s2
ffffffffc020418a:	00002997          	auipc	s3,0x2
ffffffffc020418e:	7a698993          	addi	s3,s3,1958 # ffffffffc0206930 <default_pmm_manager+0x628>
ffffffffc0204192:	a039                	j	ffffffffc02041a0 <find_proc+0x5c>
ffffffffc0204194:	f55fb0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc0204198:	f2c42783          	lw	a5,-212(s0)
ffffffffc020419c:	00978f63          	beq	a5,s1,ffffffffc02041ba <find_proc+0x76>
ffffffffc02041a0:	6400                	ld	s0,8(s0)
ffffffffc02041a2:	85a6                	mv	a1,s1
ffffffffc02041a4:	854e                	mv	a0,s3
ffffffffc02041a6:	fe8917e3          	bne	s2,s0,ffffffffc0204194 <find_proc+0x50>
ffffffffc02041aa:	70a2                	ld	ra,40(sp)
ffffffffc02041ac:	7402                	ld	s0,32(sp)
ffffffffc02041ae:	64e2                	ld	s1,24(sp)
ffffffffc02041b0:	6942                	ld	s2,16(sp)
ffffffffc02041b2:	69a2                	ld	s3,8(sp)
ffffffffc02041b4:	4501                	li	a0,0
ffffffffc02041b6:	6145                	addi	sp,sp,48
ffffffffc02041b8:	8082                	ret
ffffffffc02041ba:	f2840513          	addi	a0,s0,-216
ffffffffc02041be:	70a2                	ld	ra,40(sp)
ffffffffc02041c0:	7402                	ld	s0,32(sp)
ffffffffc02041c2:	64e2                	ld	s1,24(sp)
ffffffffc02041c4:	6942                	ld	s2,16(sp)
ffffffffc02041c6:	69a2                	ld	s3,8(sp)
ffffffffc02041c8:	6145                	addi	sp,sp,48
ffffffffc02041ca:	8082                	ret

ffffffffc02041cc <do_fork>:
ffffffffc02041cc:	7179                	addi	sp,sp,-48
ffffffffc02041ce:	e84a                	sd	s2,16(sp)
ffffffffc02041d0:	00011917          	auipc	s2,0x11
ffffffffc02041d4:	2f890913          	addi	s2,s2,760 # ffffffffc02154c8 <nr_process>
ffffffffc02041d8:	00092703          	lw	a4,0(s2)
ffffffffc02041dc:	f406                	sd	ra,40(sp)
ffffffffc02041de:	f022                	sd	s0,32(sp)
ffffffffc02041e0:	ec26                	sd	s1,24(sp)
ffffffffc02041e2:	e44e                	sd	s3,8(sp)
ffffffffc02041e4:	6785                	lui	a5,0x1
ffffffffc02041e6:	22f75163          	bge	a4,a5,ffffffffc0204408 <do_fork+0x23c>
ffffffffc02041ea:	89ae                	mv	s3,a1
ffffffffc02041ec:	84b2                	mv	s1,a2
ffffffffc02041ee:	dd5ff0ef          	jal	ra,ffffffffc0203fc2 <alloc_proc>
ffffffffc02041f2:	842a                	mv	s0,a0
ffffffffc02041f4:	20050c63          	beqz	a0,ffffffffc020440c <do_fork+0x240>
ffffffffc02041f8:	4509                	li	a0,2
ffffffffc02041fa:	d7dfe0ef          	jal	ra,ffffffffc0202f76 <alloc_pages>
ffffffffc02041fe:	20050063          	beqz	a0,ffffffffc02043fe <do_fork+0x232>
ffffffffc0204202:	00011797          	auipc	a5,0x11
ffffffffc0204206:	3e678793          	addi	a5,a5,998 # ffffffffc02155e8 <pages>
ffffffffc020420a:	6394                	ld	a3,0(a5)
ffffffffc020420c:	00003797          	auipc	a5,0x3
ffffffffc0204210:	a6c78793          	addi	a5,a5,-1428 # ffffffffc0206c78 <nbase>
ffffffffc0204214:	40d506b3          	sub	a3,a0,a3
ffffffffc0204218:	6388                	ld	a0,0(a5)
ffffffffc020421a:	8699                	srai	a3,a3,0x6
ffffffffc020421c:	00011797          	auipc	a5,0x11
ffffffffc0204220:	28c78793          	addi	a5,a5,652 # ffffffffc02154a8 <npage>
ffffffffc0204224:	96aa                	add	a3,a3,a0
ffffffffc0204226:	6398                	ld	a4,0(a5)
ffffffffc0204228:	00c69793          	slli	a5,a3,0xc
ffffffffc020422c:	83b1                	srli	a5,a5,0xc
ffffffffc020422e:	06b2                	slli	a3,a3,0xc
ffffffffc0204230:	20e7f063          	bgeu	a5,a4,ffffffffc0204430 <do_fork+0x264>
ffffffffc0204234:	00011797          	auipc	a5,0x11
ffffffffc0204238:	27c78793          	addi	a5,a5,636 # ffffffffc02154b0 <current>
ffffffffc020423c:	639c                	ld	a5,0(a5)
ffffffffc020423e:	00011717          	auipc	a4,0x11
ffffffffc0204242:	39a70713          	addi	a4,a4,922 # ffffffffc02155d8 <va_pa_offset>
ffffffffc0204246:	6318                	ld	a4,0(a4)
ffffffffc0204248:	779c                	ld	a5,40(a5)
ffffffffc020424a:	96ba                	add	a3,a3,a4
ffffffffc020424c:	e814                	sd	a3,16(s0)
ffffffffc020424e:	1c079163          	bnez	a5,ffffffffc0204410 <do_fork+0x244>
ffffffffc0204252:	6789                	lui	a5,0x2
ffffffffc0204254:	ee078793          	addi	a5,a5,-288 # 1ee0 <BASE_ADDRESS-0xffffffffc01fe120>
ffffffffc0204258:	96be                	add	a3,a3,a5
ffffffffc020425a:	8626                	mv	a2,s1
ffffffffc020425c:	f054                	sd	a3,160(s0)
ffffffffc020425e:	87b6                	mv	a5,a3
ffffffffc0204260:	12048893          	addi	a7,s1,288
ffffffffc0204264:	00063803          	ld	a6,0(a2)
ffffffffc0204268:	6608                	ld	a0,8(a2)
ffffffffc020426a:	6a0c                	ld	a1,16(a2)
ffffffffc020426c:	6e18                	ld	a4,24(a2)
ffffffffc020426e:	0107b023          	sd	a6,0(a5)
ffffffffc0204272:	e788                	sd	a0,8(a5)
ffffffffc0204274:	eb8c                	sd	a1,16(a5)
ffffffffc0204276:	ef98                	sd	a4,24(a5)
ffffffffc0204278:	02060613          	addi	a2,a2,32
ffffffffc020427c:	02078793          	addi	a5,a5,32
ffffffffc0204280:	ff1612e3          	bne	a2,a7,ffffffffc0204264 <do_fork+0x98>
ffffffffc0204284:	0406b823          	sd	zero,80(a3)
ffffffffc0204288:	10098c63          	beqz	s3,ffffffffc02043a0 <do_fork+0x1d4>
ffffffffc020428c:	0136b823          	sd	s3,16(a3)
ffffffffc0204290:	00000797          	auipc	a5,0x0
ffffffffc0204294:	d8e78793          	addi	a5,a5,-626 # ffffffffc020401e <forkret>
ffffffffc0204298:	f81c                	sd	a5,48(s0)
ffffffffc020429a:	fc14                	sd	a3,56(s0)
ffffffffc020429c:	100027f3          	csrr	a5,sstatus
ffffffffc02042a0:	8b89                	andi	a5,a5,2
ffffffffc02042a2:	4981                	li	s3,0
ffffffffc02042a4:	10079d63          	bnez	a5,ffffffffc02043be <do_fork+0x1f2>
ffffffffc02042a8:	00006797          	auipc	a5,0x6
ffffffffc02042ac:	db078793          	addi	a5,a5,-592 # ffffffffc020a058 <last_pid.1575>
ffffffffc02042b0:	439c                	lw	a5,0(a5)
ffffffffc02042b2:	6709                	lui	a4,0x2
ffffffffc02042b4:	0017851b          	addiw	a0,a5,1
ffffffffc02042b8:	00006697          	auipc	a3,0x6
ffffffffc02042bc:	daa6a023          	sw	a0,-608(a3) # ffffffffc020a058 <last_pid.1575>
ffffffffc02042c0:	12e55063          	bge	a0,a4,ffffffffc02043e0 <do_fork+0x214>
ffffffffc02042c4:	00006797          	auipc	a5,0x6
ffffffffc02042c8:	d9878793          	addi	a5,a5,-616 # ffffffffc020a05c <next_safe.1574>
ffffffffc02042cc:	439c                	lw	a5,0(a5)
ffffffffc02042ce:	00011497          	auipc	s1,0x11
ffffffffc02042d2:	32248493          	addi	s1,s1,802 # ffffffffc02155f0 <proc_list>
ffffffffc02042d6:	06f54063          	blt	a0,a5,ffffffffc0204336 <do_fork+0x16a>
ffffffffc02042da:	6789                	lui	a5,0x2
ffffffffc02042dc:	00006717          	auipc	a4,0x6
ffffffffc02042e0:	d8f72023          	sw	a5,-640(a4) # ffffffffc020a05c <next_safe.1574>
ffffffffc02042e4:	4581                	li	a1,0
ffffffffc02042e6:	87aa                	mv	a5,a0
ffffffffc02042e8:	00011497          	auipc	s1,0x11
ffffffffc02042ec:	30848493          	addi	s1,s1,776 # ffffffffc02155f0 <proc_list>
ffffffffc02042f0:	6889                	lui	a7,0x2
ffffffffc02042f2:	882e                	mv	a6,a1
ffffffffc02042f4:	6609                	lui	a2,0x2
ffffffffc02042f6:	00011697          	auipc	a3,0x11
ffffffffc02042fa:	2fa68693          	addi	a3,a3,762 # ffffffffc02155f0 <proc_list>
ffffffffc02042fe:	6694                	ld	a3,8(a3)
ffffffffc0204300:	00968f63          	beq	a3,s1,ffffffffc020431e <do_fork+0x152>
ffffffffc0204304:	f3c6a703          	lw	a4,-196(a3)
ffffffffc0204308:	08e78763          	beq	a5,a4,ffffffffc0204396 <do_fork+0x1ca>
ffffffffc020430c:	fee7d9e3          	bge	a5,a4,ffffffffc02042fe <do_fork+0x132>
ffffffffc0204310:	fec757e3          	bge	a4,a2,ffffffffc02042fe <do_fork+0x132>
ffffffffc0204314:	6694                	ld	a3,8(a3)
ffffffffc0204316:	863a                	mv	a2,a4
ffffffffc0204318:	4805                	li	a6,1
ffffffffc020431a:	fe9695e3          	bne	a3,s1,ffffffffc0204304 <do_fork+0x138>
ffffffffc020431e:	c591                	beqz	a1,ffffffffc020432a <do_fork+0x15e>
ffffffffc0204320:	00006717          	auipc	a4,0x6
ffffffffc0204324:	d2f72c23          	sw	a5,-712(a4) # ffffffffc020a058 <last_pid.1575>
ffffffffc0204328:	853e                	mv	a0,a5
ffffffffc020432a:	00080663          	beqz	a6,ffffffffc0204336 <do_fork+0x16a>
ffffffffc020432e:	00006797          	auipc	a5,0x6
ffffffffc0204332:	d2c7a723          	sw	a2,-722(a5) # ffffffffc020a05c <next_safe.1574>
ffffffffc0204336:	c048                	sw	a0,4(s0)
ffffffffc0204338:	45a9                	li	a1,10
ffffffffc020433a:	2501                	sext.w	a0,a0
ffffffffc020433c:	049000ef          	jal	ra,ffffffffc0204b84 <hash32>
ffffffffc0204340:	1502                	slli	a0,a0,0x20
ffffffffc0204342:	0000d797          	auipc	a5,0xd
ffffffffc0204346:	11e78793          	addi	a5,a5,286 # ffffffffc0211460 <hash_list>
ffffffffc020434a:	8171                	srli	a0,a0,0x1c
ffffffffc020434c:	953e                	add	a0,a0,a5
ffffffffc020434e:	6510                	ld	a2,8(a0)
ffffffffc0204350:	0d840793          	addi	a5,s0,216
ffffffffc0204354:	6494                	ld	a3,8(s1)
ffffffffc0204356:	00092703          	lw	a4,0(s2)
ffffffffc020435a:	e21c                	sd	a5,0(a2)
ffffffffc020435c:	e51c                	sd	a5,8(a0)
ffffffffc020435e:	f070                	sd	a2,224(s0)
ffffffffc0204360:	0c840793          	addi	a5,s0,200
ffffffffc0204364:	ec68                	sd	a0,216(s0)
ffffffffc0204366:	e29c                	sd	a5,0(a3)
ffffffffc0204368:	2705                	addiw	a4,a4,1
ffffffffc020436a:	00011617          	auipc	a2,0x11
ffffffffc020436e:	28f63723          	sd	a5,654(a2) # ffffffffc02155f8 <proc_list+0x8>
ffffffffc0204372:	e874                	sd	a3,208(s0)
ffffffffc0204374:	e464                	sd	s1,200(s0)
ffffffffc0204376:	00011797          	auipc	a5,0x11
ffffffffc020437a:	14e7a923          	sw	a4,338(a5) # ffffffffc02154c8 <nr_process>
ffffffffc020437e:	06099863          	bnez	s3,ffffffffc02043ee <do_fork+0x222>
ffffffffc0204382:	4048                	lw	a0,4(s0)
ffffffffc0204384:	4789                	li	a5,2
ffffffffc0204386:	c01c                	sw	a5,0(s0)
ffffffffc0204388:	70a2                	ld	ra,40(sp)
ffffffffc020438a:	7402                	ld	s0,32(sp)
ffffffffc020438c:	64e2                	ld	s1,24(sp)
ffffffffc020438e:	6942                	ld	s2,16(sp)
ffffffffc0204390:	69a2                	ld	s3,8(sp)
ffffffffc0204392:	6145                	addi	sp,sp,48
ffffffffc0204394:	8082                	ret
ffffffffc0204396:	2785                	addiw	a5,a5,1
ffffffffc0204398:	04c7de63          	bge	a5,a2,ffffffffc02043f4 <do_fork+0x228>
ffffffffc020439c:	4585                	li	a1,1
ffffffffc020439e:	b785                	j	ffffffffc02042fe <do_fork+0x132>
ffffffffc02043a0:	89b6                	mv	s3,a3
ffffffffc02043a2:	0136b823          	sd	s3,16(a3)
ffffffffc02043a6:	00000797          	auipc	a5,0x0
ffffffffc02043aa:	c7878793          	addi	a5,a5,-904 # ffffffffc020401e <forkret>
ffffffffc02043ae:	f81c                	sd	a5,48(s0)
ffffffffc02043b0:	fc14                	sd	a3,56(s0)
ffffffffc02043b2:	100027f3          	csrr	a5,sstatus
ffffffffc02043b6:	8b89                	andi	a5,a5,2
ffffffffc02043b8:	4981                	li	s3,0
ffffffffc02043ba:	ee0787e3          	beqz	a5,ffffffffc02042a8 <do_fork+0xdc>
ffffffffc02043be:	a2cfc0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc02043c2:	00006797          	auipc	a5,0x6
ffffffffc02043c6:	c9678793          	addi	a5,a5,-874 # ffffffffc020a058 <last_pid.1575>
ffffffffc02043ca:	439c                	lw	a5,0(a5)
ffffffffc02043cc:	6709                	lui	a4,0x2
ffffffffc02043ce:	4985                	li	s3,1
ffffffffc02043d0:	0017851b          	addiw	a0,a5,1
ffffffffc02043d4:	00006697          	auipc	a3,0x6
ffffffffc02043d8:	c8a6a223          	sw	a0,-892(a3) # ffffffffc020a058 <last_pid.1575>
ffffffffc02043dc:	eee544e3          	blt	a0,a4,ffffffffc02042c4 <do_fork+0xf8>
ffffffffc02043e0:	4785                	li	a5,1
ffffffffc02043e2:	00006717          	auipc	a4,0x6
ffffffffc02043e6:	c6f72b23          	sw	a5,-906(a4) # ffffffffc020a058 <last_pid.1575>
ffffffffc02043ea:	4505                	li	a0,1
ffffffffc02043ec:	b5fd                	j	ffffffffc02042da <do_fork+0x10e>
ffffffffc02043ee:	9f6fc0ef          	jal	ra,ffffffffc02005e4 <intr_enable>
ffffffffc02043f2:	bf41                	j	ffffffffc0204382 <do_fork+0x1b6>
ffffffffc02043f4:	0117c363          	blt	a5,a7,ffffffffc02043fa <do_fork+0x22e>
ffffffffc02043f8:	4785                	li	a5,1
ffffffffc02043fa:	4585                	li	a1,1
ffffffffc02043fc:	bddd                	j	ffffffffc02042f2 <do_fork+0x126>
ffffffffc02043fe:	8522                	mv	a0,s0
ffffffffc0204400:	e94fd0ef          	jal	ra,ffffffffc0201a94 <kfree>
ffffffffc0204404:	5571                	li	a0,-4
ffffffffc0204406:	b749                	j	ffffffffc0204388 <do_fork+0x1bc>
ffffffffc0204408:	556d                	li	a0,-5
ffffffffc020440a:	bfbd                	j	ffffffffc0204388 <do_fork+0x1bc>
ffffffffc020440c:	5571                	li	a0,-4
ffffffffc020440e:	bfad                	j	ffffffffc0204388 <do_fork+0x1bc>
ffffffffc0204410:	00002697          	auipc	a3,0x2
ffffffffc0204414:	4e868693          	addi	a3,a3,1256 # ffffffffc02068f8 <default_pmm_manager+0x5f0>
ffffffffc0204418:	00001617          	auipc	a2,0x1
ffffffffc020441c:	17860613          	addi	a2,a2,376 # ffffffffc0205590 <commands+0x860>
ffffffffc0204420:	0ff00593          	li	a1,255
ffffffffc0204424:	00002517          	auipc	a0,0x2
ffffffffc0204428:	4ec50513          	addi	a0,a0,1260 # ffffffffc0206910 <default_pmm_manager+0x608>
ffffffffc020442c:	dc1fb0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc0204430:	00001617          	auipc	a2,0x1
ffffffffc0204434:	6f060613          	addi	a2,a2,1776 # ffffffffc0205b20 <commands+0xdf0>
ffffffffc0204438:	06900593          	li	a1,105
ffffffffc020443c:	00001517          	auipc	a0,0x1
ffffffffc0204440:	48450513          	addi	a0,a0,1156 # ffffffffc02058c0 <commands+0xb90>
ffffffffc0204444:	da9fb0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc0204448 <kernel_thread>:
ffffffffc0204448:	7129                	addi	sp,sp,-320
ffffffffc020444a:	fa22                	sd	s0,304(sp)
ffffffffc020444c:	f626                	sd	s1,296(sp)
ffffffffc020444e:	f24a                	sd	s2,288(sp)
ffffffffc0204450:	84ae                	mv	s1,a1
ffffffffc0204452:	892a                	mv	s2,a0
ffffffffc0204454:	8432                	mv	s0,a2
ffffffffc0204456:	4581                	li	a1,0
ffffffffc0204458:	12000613          	li	a2,288
ffffffffc020445c:	850a                	mv	a0,sp
ffffffffc020445e:	fe06                	sd	ra,312(sp)
ffffffffc0204460:	30e000ef          	jal	ra,ffffffffc020476e <memset>
ffffffffc0204464:	e0ca                	sd	s2,64(sp)
ffffffffc0204466:	e4a6                	sd	s1,72(sp)
ffffffffc0204468:	100027f3          	csrr	a5,sstatus
ffffffffc020446c:	edd7f793          	andi	a5,a5,-291
ffffffffc0204470:	1207e793          	ori	a5,a5,288
ffffffffc0204474:	e23e                	sd	a5,256(sp)
ffffffffc0204476:	860a                	mv	a2,sp
ffffffffc0204478:	10046513          	ori	a0,s0,256
ffffffffc020447c:	00000797          	auipc	a5,0x0
ffffffffc0204480:	b3e78793          	addi	a5,a5,-1218 # ffffffffc0203fba <kernel_thread_entry>
ffffffffc0204484:	4581                	li	a1,0
ffffffffc0204486:	e63e                	sd	a5,264(sp)
ffffffffc0204488:	d45ff0ef          	jal	ra,ffffffffc02041cc <do_fork>
ffffffffc020448c:	70f2                	ld	ra,312(sp)
ffffffffc020448e:	7452                	ld	s0,304(sp)
ffffffffc0204490:	74b2                	ld	s1,296(sp)
ffffffffc0204492:	7912                	ld	s2,288(sp)
ffffffffc0204494:	6131                	addi	sp,sp,320
ffffffffc0204496:	8082                	ret

ffffffffc0204498 <do_exit>:
ffffffffc0204498:	1141                	addi	sp,sp,-16
ffffffffc020449a:	00002617          	auipc	a2,0x2
ffffffffc020449e:	44660613          	addi	a2,a2,1094 # ffffffffc02068e0 <default_pmm_manager+0x5d8>
ffffffffc02044a2:	16300593          	li	a1,355
ffffffffc02044a6:	00002517          	auipc	a0,0x2
ffffffffc02044aa:	46a50513          	addi	a0,a0,1130 # ffffffffc0206910 <default_pmm_manager+0x608>
ffffffffc02044ae:	e406                	sd	ra,8(sp)
ffffffffc02044b0:	d3dfb0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc02044b4 <proc_init>:
ffffffffc02044b4:	00011797          	auipc	a5,0x11
ffffffffc02044b8:	13c78793          	addi	a5,a5,316 # ffffffffc02155f0 <proc_list>
ffffffffc02044bc:	1101                	addi	sp,sp,-32
ffffffffc02044be:	00011717          	auipc	a4,0x11
ffffffffc02044c2:	12f73d23          	sd	a5,314(a4) # ffffffffc02155f8 <proc_list+0x8>
ffffffffc02044c6:	00011717          	auipc	a4,0x11
ffffffffc02044ca:	12f73523          	sd	a5,298(a4) # ffffffffc02155f0 <proc_list>
ffffffffc02044ce:	ec06                	sd	ra,24(sp)
ffffffffc02044d0:	e822                	sd	s0,16(sp)
ffffffffc02044d2:	e426                	sd	s1,8(sp)
ffffffffc02044d4:	0000d797          	auipc	a5,0xd
ffffffffc02044d8:	f8c78793          	addi	a5,a5,-116 # ffffffffc0211460 <hash_list>
ffffffffc02044dc:	00011717          	auipc	a4,0x11
ffffffffc02044e0:	f8470713          	addi	a4,a4,-124 # ffffffffc0215460 <name.1565>
ffffffffc02044e4:	e79c                	sd	a5,8(a5)
ffffffffc02044e6:	e39c                	sd	a5,0(a5)
ffffffffc02044e8:	07c1                	addi	a5,a5,16
ffffffffc02044ea:	fee79de3          	bne	a5,a4,ffffffffc02044e4 <proc_init+0x30>
ffffffffc02044ee:	ad5ff0ef          	jal	ra,ffffffffc0203fc2 <alloc_proc>
ffffffffc02044f2:	00011717          	auipc	a4,0x11
ffffffffc02044f6:	fca73323          	sd	a0,-58(a4) # ffffffffc02154b8 <idleproc>
ffffffffc02044fa:	00011417          	auipc	s0,0x11
ffffffffc02044fe:	fbe40413          	addi	s0,s0,-66 # ffffffffc02154b8 <idleproc>
ffffffffc0204502:	c165                	beqz	a0,ffffffffc02045e2 <proc_init+0x12e>
ffffffffc0204504:	4709                	li	a4,2
ffffffffc0204506:	e118                	sd	a4,0(a0)
ffffffffc0204508:	00003717          	auipc	a4,0x3
ffffffffc020450c:	af870713          	addi	a4,a4,-1288 # ffffffffc0207000 <bootstack>
ffffffffc0204510:	e918                	sd	a4,16(a0)
ffffffffc0204512:	4705                	li	a4,1
ffffffffc0204514:	00002597          	auipc	a1,0x2
ffffffffc0204518:	49458593          	addi	a1,a1,1172 # ffffffffc02069a8 <default_pmm_manager+0x6a0>
ffffffffc020451c:	cd18                	sw	a4,24(a0)
ffffffffc020451e:	b11ff0ef          	jal	ra,ffffffffc020402e <set_proc_name>
ffffffffc0204522:	00011797          	auipc	a5,0x11
ffffffffc0204526:	fa678793          	addi	a5,a5,-90 # ffffffffc02154c8 <nr_process>
ffffffffc020452a:	439c                	lw	a5,0(a5)
ffffffffc020452c:	6018                	ld	a4,0(s0)
ffffffffc020452e:	4601                	li	a2,0
ffffffffc0204530:	2785                	addiw	a5,a5,1
ffffffffc0204532:	00002597          	auipc	a1,0x2
ffffffffc0204536:	47e58593          	addi	a1,a1,1150 # ffffffffc02069b0 <default_pmm_manager+0x6a8>
ffffffffc020453a:	00000517          	auipc	a0,0x0
ffffffffc020453e:	b4a50513          	addi	a0,a0,-1206 # ffffffffc0204084 <init_main>
ffffffffc0204542:	00011697          	auipc	a3,0x11
ffffffffc0204546:	f8f6a323          	sw	a5,-122(a3) # ffffffffc02154c8 <nr_process>
ffffffffc020454a:	00011797          	auipc	a5,0x11
ffffffffc020454e:	f6e7b323          	sd	a4,-154(a5) # ffffffffc02154b0 <current>
ffffffffc0204552:	ef7ff0ef          	jal	ra,ffffffffc0204448 <kernel_thread>
ffffffffc0204556:	06a05a63          	blez	a0,ffffffffc02045ca <proc_init+0x116>
ffffffffc020455a:	bebff0ef          	jal	ra,ffffffffc0204144 <find_proc>
ffffffffc020455e:	00011797          	auipc	a5,0x11
ffffffffc0204562:	f6a7b123          	sd	a0,-158(a5) # ffffffffc02154c0 <initproc>
ffffffffc0204566:	00011497          	auipc	s1,0x11
ffffffffc020456a:	f5a48493          	addi	s1,s1,-166 # ffffffffc02154c0 <initproc>
ffffffffc020456e:	c515                	beqz	a0,ffffffffc020459a <proc_init+0xe6>
ffffffffc0204570:	00002597          	auipc	a1,0x2
ffffffffc0204574:	47058593          	addi	a1,a1,1136 # ffffffffc02069e0 <default_pmm_manager+0x6d8>
ffffffffc0204578:	ab7ff0ef          	jal	ra,ffffffffc020402e <set_proc_name>
ffffffffc020457c:	601c                	ld	a5,0(s0)
ffffffffc020457e:	c795                	beqz	a5,ffffffffc02045aa <proc_init+0xf6>
ffffffffc0204580:	43dc                	lw	a5,4(a5)
ffffffffc0204582:	e785                	bnez	a5,ffffffffc02045aa <proc_init+0xf6>
ffffffffc0204584:	609c                	ld	a5,0(s1)
ffffffffc0204586:	cbb5                	beqz	a5,ffffffffc02045fa <proc_init+0x146>
ffffffffc0204588:	43d8                	lw	a4,4(a5)
ffffffffc020458a:	4785                	li	a5,1
ffffffffc020458c:	06f71763          	bne	a4,a5,ffffffffc02045fa <proc_init+0x146>
ffffffffc0204590:	60e2                	ld	ra,24(sp)
ffffffffc0204592:	6442                	ld	s0,16(sp)
ffffffffc0204594:	64a2                	ld	s1,8(sp)
ffffffffc0204596:	6105                	addi	sp,sp,32
ffffffffc0204598:	8082                	ret
ffffffffc020459a:	00000517          	auipc	a0,0x0
ffffffffc020459e:	64e50513          	addi	a0,a0,1614 # ffffffffc0204be8 <etext+0x4c>
ffffffffc02045a2:	b47fb0ef          	jal	ra,ffffffffc02000e8 <cprintf>
ffffffffc02045a6:	6088                	ld	a0,0(s1)
ffffffffc02045a8:	b7e1                	j	ffffffffc0204570 <proc_init+0xbc>
ffffffffc02045aa:	00002697          	auipc	a3,0x2
ffffffffc02045ae:	43e68693          	addi	a3,a3,1086 # ffffffffc02069e8 <default_pmm_manager+0x6e0>
ffffffffc02045b2:	00001617          	auipc	a2,0x1
ffffffffc02045b6:	fde60613          	addi	a2,a2,-34 # ffffffffc0205590 <commands+0x860>
ffffffffc02045ba:	19300593          	li	a1,403
ffffffffc02045be:	00002517          	auipc	a0,0x2
ffffffffc02045c2:	35250513          	addi	a0,a0,850 # ffffffffc0206910 <default_pmm_manager+0x608>
ffffffffc02045c6:	c27fb0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02045ca:	00002617          	auipc	a2,0x2
ffffffffc02045ce:	3f660613          	addi	a2,a2,1014 # ffffffffc02069c0 <default_pmm_manager+0x6b8>
ffffffffc02045d2:	18a00593          	li	a1,394
ffffffffc02045d6:	00002517          	auipc	a0,0x2
ffffffffc02045da:	33a50513          	addi	a0,a0,826 # ffffffffc0206910 <default_pmm_manager+0x608>
ffffffffc02045de:	c0ffb0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02045e2:	00002617          	auipc	a2,0x2
ffffffffc02045e6:	3ae60613          	addi	a2,a2,942 # ffffffffc0206990 <default_pmm_manager+0x688>
ffffffffc02045ea:	17b00593          	li	a1,379
ffffffffc02045ee:	00002517          	auipc	a0,0x2
ffffffffc02045f2:	32250513          	addi	a0,a0,802 # ffffffffc0206910 <default_pmm_manager+0x608>
ffffffffc02045f6:	bf7fb0ef          	jal	ra,ffffffffc02001ec <__panic>
ffffffffc02045fa:	00002697          	auipc	a3,0x2
ffffffffc02045fe:	41668693          	addi	a3,a3,1046 # ffffffffc0206a10 <default_pmm_manager+0x708>
ffffffffc0204602:	00001617          	auipc	a2,0x1
ffffffffc0204606:	f8e60613          	addi	a2,a2,-114 # ffffffffc0205590 <commands+0x860>
ffffffffc020460a:	19400593          	li	a1,404
ffffffffc020460e:	00002517          	auipc	a0,0x2
ffffffffc0204612:	30250513          	addi	a0,a0,770 # ffffffffc0206910 <default_pmm_manager+0x608>
ffffffffc0204616:	bd7fb0ef          	jal	ra,ffffffffc02001ec <__panic>

ffffffffc020461a <cpu_idle>:
ffffffffc020461a:	1141                	addi	sp,sp,-16
ffffffffc020461c:	e022                	sd	s0,0(sp)
ffffffffc020461e:	e406                	sd	ra,8(sp)
ffffffffc0204620:	00011417          	auipc	s0,0x11
ffffffffc0204624:	e9040413          	addi	s0,s0,-368 # ffffffffc02154b0 <current>
ffffffffc0204628:	6018                	ld	a4,0(s0)
ffffffffc020462a:	4f1c                	lw	a5,24(a4)
ffffffffc020462c:	2781                	sext.w	a5,a5
ffffffffc020462e:	dff5                	beqz	a5,ffffffffc020462a <cpu_idle+0x10>
ffffffffc0204630:	006000ef          	jal	ra,ffffffffc0204636 <schedule>
ffffffffc0204634:	bfd5                	j	ffffffffc0204628 <cpu_idle+0xe>

ffffffffc0204636 <schedule>:
ffffffffc0204636:	1141                	addi	sp,sp,-16
ffffffffc0204638:	e406                	sd	ra,8(sp)
ffffffffc020463a:	e022                	sd	s0,0(sp)
ffffffffc020463c:	100027f3          	csrr	a5,sstatus
ffffffffc0204640:	8b89                	andi	a5,a5,2
ffffffffc0204642:	4401                	li	s0,0
ffffffffc0204644:	e3d1                	bnez	a5,ffffffffc02046c8 <schedule+0x92>
ffffffffc0204646:	00011797          	auipc	a5,0x11
ffffffffc020464a:	e6a78793          	addi	a5,a5,-406 # ffffffffc02154b0 <current>
ffffffffc020464e:	0007b883          	ld	a7,0(a5)
ffffffffc0204652:	00011797          	auipc	a5,0x11
ffffffffc0204656:	e6678793          	addi	a5,a5,-410 # ffffffffc02154b8 <idleproc>
ffffffffc020465a:	6388                	ld	a0,0(a5)
ffffffffc020465c:	0008ac23          	sw	zero,24(a7) # 2018 <BASE_ADDRESS-0xffffffffc01fdfe8>
ffffffffc0204660:	04a88e63          	beq	a7,a0,ffffffffc02046bc <schedule+0x86>
ffffffffc0204664:	0c888693          	addi	a3,a7,200
ffffffffc0204668:	00011617          	auipc	a2,0x11
ffffffffc020466c:	f8860613          	addi	a2,a2,-120 # ffffffffc02155f0 <proc_list>
ffffffffc0204670:	87b6                	mv	a5,a3
ffffffffc0204672:	4581                	li	a1,0
ffffffffc0204674:	4809                	li	a6,2
ffffffffc0204676:	679c                	ld	a5,8(a5)
ffffffffc0204678:	00c78863          	beq	a5,a2,ffffffffc0204688 <schedule+0x52>
ffffffffc020467c:	f387a703          	lw	a4,-200(a5)
ffffffffc0204680:	f3878593          	addi	a1,a5,-200
ffffffffc0204684:	01070463          	beq	a4,a6,ffffffffc020468c <schedule+0x56>
ffffffffc0204688:	fef697e3          	bne	a3,a5,ffffffffc0204676 <schedule+0x40>
ffffffffc020468c:	c589                	beqz	a1,ffffffffc0204696 <schedule+0x60>
ffffffffc020468e:	4198                	lw	a4,0(a1)
ffffffffc0204690:	4789                	li	a5,2
ffffffffc0204692:	00f70e63          	beq	a4,a5,ffffffffc02046ae <schedule+0x78>
ffffffffc0204696:	451c                	lw	a5,8(a0)
ffffffffc0204698:	2785                	addiw	a5,a5,1
ffffffffc020469a:	c51c                	sw	a5,8(a0)
ffffffffc020469c:	00a88463          	beq	a7,a0,ffffffffc02046a4 <schedule+0x6e>
ffffffffc02046a0:	a37ff0ef          	jal	ra,ffffffffc02040d6 <proc_run>
ffffffffc02046a4:	e419                	bnez	s0,ffffffffc02046b2 <schedule+0x7c>
ffffffffc02046a6:	60a2                	ld	ra,8(sp)
ffffffffc02046a8:	6402                	ld	s0,0(sp)
ffffffffc02046aa:	0141                	addi	sp,sp,16
ffffffffc02046ac:	8082                	ret
ffffffffc02046ae:	852e                	mv	a0,a1
ffffffffc02046b0:	b7dd                	j	ffffffffc0204696 <schedule+0x60>
ffffffffc02046b2:	6402                	ld	s0,0(sp)
ffffffffc02046b4:	60a2                	ld	ra,8(sp)
ffffffffc02046b6:	0141                	addi	sp,sp,16
ffffffffc02046b8:	f2dfb06f          	j	ffffffffc02005e4 <intr_enable>
ffffffffc02046bc:	00011617          	auipc	a2,0x11
ffffffffc02046c0:	f3460613          	addi	a2,a2,-204 # ffffffffc02155f0 <proc_list>
ffffffffc02046c4:	86b2                	mv	a3,a2
ffffffffc02046c6:	b76d                	j	ffffffffc0204670 <schedule+0x3a>
ffffffffc02046c8:	f23fb0ef          	jal	ra,ffffffffc02005ea <intr_disable>
ffffffffc02046cc:	4405                	li	s0,1
ffffffffc02046ce:	bfa5                	j	ffffffffc0204646 <schedule+0x10>

ffffffffc02046d0 <strlen>:
ffffffffc02046d0:	00054783          	lbu	a5,0(a0)
ffffffffc02046d4:	cb91                	beqz	a5,ffffffffc02046e8 <strlen+0x18>
ffffffffc02046d6:	4781                	li	a5,0
ffffffffc02046d8:	0785                	addi	a5,a5,1
ffffffffc02046da:	00f50733          	add	a4,a0,a5
ffffffffc02046de:	00074703          	lbu	a4,0(a4)
ffffffffc02046e2:	fb7d                	bnez	a4,ffffffffc02046d8 <strlen+0x8>
ffffffffc02046e4:	853e                	mv	a0,a5
ffffffffc02046e6:	8082                	ret
ffffffffc02046e8:	4781                	li	a5,0
ffffffffc02046ea:	853e                	mv	a0,a5
ffffffffc02046ec:	8082                	ret

ffffffffc02046ee <strnlen>:
ffffffffc02046ee:	c185                	beqz	a1,ffffffffc020470e <strnlen+0x20>
ffffffffc02046f0:	00054783          	lbu	a5,0(a0)
ffffffffc02046f4:	cf89                	beqz	a5,ffffffffc020470e <strnlen+0x20>
ffffffffc02046f6:	4781                	li	a5,0
ffffffffc02046f8:	a021                	j	ffffffffc0204700 <strnlen+0x12>
ffffffffc02046fa:	00074703          	lbu	a4,0(a4)
ffffffffc02046fe:	c711                	beqz	a4,ffffffffc020470a <strnlen+0x1c>
ffffffffc0204700:	0785                	addi	a5,a5,1
ffffffffc0204702:	00f50733          	add	a4,a0,a5
ffffffffc0204706:	fef59ae3          	bne	a1,a5,ffffffffc02046fa <strnlen+0xc>
ffffffffc020470a:	853e                	mv	a0,a5
ffffffffc020470c:	8082                	ret
ffffffffc020470e:	4781                	li	a5,0
ffffffffc0204710:	853e                	mv	a0,a5
ffffffffc0204712:	8082                	ret

ffffffffc0204714 <strcpy>:
ffffffffc0204714:	87aa                	mv	a5,a0
ffffffffc0204716:	0585                	addi	a1,a1,1
ffffffffc0204718:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020471c:	0785                	addi	a5,a5,1
ffffffffc020471e:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0204722:	fb75                	bnez	a4,ffffffffc0204716 <strcpy+0x2>
ffffffffc0204724:	8082                	ret

ffffffffc0204726 <strcmp>:
ffffffffc0204726:	00054783          	lbu	a5,0(a0)
ffffffffc020472a:	0005c703          	lbu	a4,0(a1)
ffffffffc020472e:	cb91                	beqz	a5,ffffffffc0204742 <strcmp+0x1c>
ffffffffc0204730:	00e79c63          	bne	a5,a4,ffffffffc0204748 <strcmp+0x22>
ffffffffc0204734:	0505                	addi	a0,a0,1
ffffffffc0204736:	00054783          	lbu	a5,0(a0)
ffffffffc020473a:	0585                	addi	a1,a1,1
ffffffffc020473c:	0005c703          	lbu	a4,0(a1)
ffffffffc0204740:	fbe5                	bnez	a5,ffffffffc0204730 <strcmp+0xa>
ffffffffc0204742:	4501                	li	a0,0
ffffffffc0204744:	9d19                	subw	a0,a0,a4
ffffffffc0204746:	8082                	ret
ffffffffc0204748:	0007851b          	sext.w	a0,a5
ffffffffc020474c:	9d19                	subw	a0,a0,a4
ffffffffc020474e:	8082                	ret

ffffffffc0204750 <strchr>:
ffffffffc0204750:	00054783          	lbu	a5,0(a0)
ffffffffc0204754:	cb91                	beqz	a5,ffffffffc0204768 <strchr+0x18>
ffffffffc0204756:	00b79563          	bne	a5,a1,ffffffffc0204760 <strchr+0x10>
ffffffffc020475a:	a809                	j	ffffffffc020476c <strchr+0x1c>
ffffffffc020475c:	00b78763          	beq	a5,a1,ffffffffc020476a <strchr+0x1a>
ffffffffc0204760:	0505                	addi	a0,a0,1
ffffffffc0204762:	00054783          	lbu	a5,0(a0)
ffffffffc0204766:	fbfd                	bnez	a5,ffffffffc020475c <strchr+0xc>
ffffffffc0204768:	4501                	li	a0,0
ffffffffc020476a:	8082                	ret
ffffffffc020476c:	8082                	ret

ffffffffc020476e <memset>:
ffffffffc020476e:	ca01                	beqz	a2,ffffffffc020477e <memset+0x10>
ffffffffc0204770:	962a                	add	a2,a2,a0
ffffffffc0204772:	87aa                	mv	a5,a0
ffffffffc0204774:	0785                	addi	a5,a5,1
ffffffffc0204776:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020477a:	fec79de3          	bne	a5,a2,ffffffffc0204774 <memset+0x6>
ffffffffc020477e:	8082                	ret

ffffffffc0204780 <memcpy>:
ffffffffc0204780:	ca19                	beqz	a2,ffffffffc0204796 <memcpy+0x16>
ffffffffc0204782:	962e                	add	a2,a2,a1
ffffffffc0204784:	87aa                	mv	a5,a0
ffffffffc0204786:	0585                	addi	a1,a1,1
ffffffffc0204788:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020478c:	0785                	addi	a5,a5,1
ffffffffc020478e:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0204792:	fec59ae3          	bne	a1,a2,ffffffffc0204786 <memcpy+0x6>
ffffffffc0204796:	8082                	ret

ffffffffc0204798 <printnum>:
ffffffffc0204798:	02069813          	slli	a6,a3,0x20
ffffffffc020479c:	7179                	addi	sp,sp,-48
ffffffffc020479e:	02085813          	srli	a6,a6,0x20
ffffffffc02047a2:	e052                	sd	s4,0(sp)
ffffffffc02047a4:	03067a33          	remu	s4,a2,a6
ffffffffc02047a8:	f022                	sd	s0,32(sp)
ffffffffc02047aa:	ec26                	sd	s1,24(sp)
ffffffffc02047ac:	e84a                	sd	s2,16(sp)
ffffffffc02047ae:	f406                	sd	ra,40(sp)
ffffffffc02047b0:	e44e                	sd	s3,8(sp)
ffffffffc02047b2:	84aa                	mv	s1,a0
ffffffffc02047b4:	892e                	mv	s2,a1
ffffffffc02047b6:	fff7041b          	addiw	s0,a4,-1
ffffffffc02047ba:	2a01                	sext.w	s4,s4
ffffffffc02047bc:	03067e63          	bgeu	a2,a6,ffffffffc02047f8 <printnum+0x60>
ffffffffc02047c0:	89be                	mv	s3,a5
ffffffffc02047c2:	00805763          	blez	s0,ffffffffc02047d0 <printnum+0x38>
ffffffffc02047c6:	347d                	addiw	s0,s0,-1
ffffffffc02047c8:	85ca                	mv	a1,s2
ffffffffc02047ca:	854e                	mv	a0,s3
ffffffffc02047cc:	9482                	jalr	s1
ffffffffc02047ce:	fc65                	bnez	s0,ffffffffc02047c6 <printnum+0x2e>
ffffffffc02047d0:	1a02                	slli	s4,s4,0x20
ffffffffc02047d2:	020a5a13          	srli	s4,s4,0x20
ffffffffc02047d6:	00002797          	auipc	a5,0x2
ffffffffc02047da:	3f278793          	addi	a5,a5,1010 # ffffffffc0206bc8 <error_string+0x38>
ffffffffc02047de:	9a3e                	add	s4,s4,a5
ffffffffc02047e0:	7402                	ld	s0,32(sp)
ffffffffc02047e2:	000a4503          	lbu	a0,0(s4) # 80000 <BASE_ADDRESS-0xffffffffc0180000>
ffffffffc02047e6:	70a2                	ld	ra,40(sp)
ffffffffc02047e8:	69a2                	ld	s3,8(sp)
ffffffffc02047ea:	6a02                	ld	s4,0(sp)
ffffffffc02047ec:	85ca                	mv	a1,s2
ffffffffc02047ee:	8326                	mv	t1,s1
ffffffffc02047f0:	6942                	ld	s2,16(sp)
ffffffffc02047f2:	64e2                	ld	s1,24(sp)
ffffffffc02047f4:	6145                	addi	sp,sp,48
ffffffffc02047f6:	8302                	jr	t1
ffffffffc02047f8:	03065633          	divu	a2,a2,a6
ffffffffc02047fc:	8722                	mv	a4,s0
ffffffffc02047fe:	f9bff0ef          	jal	ra,ffffffffc0204798 <printnum>
ffffffffc0204802:	b7f9                	j	ffffffffc02047d0 <printnum+0x38>

ffffffffc0204804 <vprintfmt>:
ffffffffc0204804:	7119                	addi	sp,sp,-128
ffffffffc0204806:	f4a6                	sd	s1,104(sp)
ffffffffc0204808:	f0ca                	sd	s2,96(sp)
ffffffffc020480a:	e8d2                	sd	s4,80(sp)
ffffffffc020480c:	e4d6                	sd	s5,72(sp)
ffffffffc020480e:	e0da                	sd	s6,64(sp)
ffffffffc0204810:	fc5e                	sd	s7,56(sp)
ffffffffc0204812:	f862                	sd	s8,48(sp)
ffffffffc0204814:	f06a                	sd	s10,32(sp)
ffffffffc0204816:	fc86                	sd	ra,120(sp)
ffffffffc0204818:	f8a2                	sd	s0,112(sp)
ffffffffc020481a:	ecce                	sd	s3,88(sp)
ffffffffc020481c:	f466                	sd	s9,40(sp)
ffffffffc020481e:	ec6e                	sd	s11,24(sp)
ffffffffc0204820:	892a                	mv	s2,a0
ffffffffc0204822:	84ae                	mv	s1,a1
ffffffffc0204824:	8d32                	mv	s10,a2
ffffffffc0204826:	8ab6                	mv	s5,a3
ffffffffc0204828:	5b7d                	li	s6,-1
ffffffffc020482a:	00002a17          	auipc	s4,0x2
ffffffffc020482e:	20ea0a13          	addi	s4,s4,526 # ffffffffc0206a38 <default_pmm_manager+0x730>
ffffffffc0204832:	05e00b93          	li	s7,94
ffffffffc0204836:	00002c17          	auipc	s8,0x2
ffffffffc020483a:	35ac0c13          	addi	s8,s8,858 # ffffffffc0206b90 <error_string>
ffffffffc020483e:	000d4503          	lbu	a0,0(s10)
ffffffffc0204842:	02500793          	li	a5,37
ffffffffc0204846:	001d0413          	addi	s0,s10,1
ffffffffc020484a:	00f50e63          	beq	a0,a5,ffffffffc0204866 <vprintfmt+0x62>
ffffffffc020484e:	c521                	beqz	a0,ffffffffc0204896 <vprintfmt+0x92>
ffffffffc0204850:	02500993          	li	s3,37
ffffffffc0204854:	a011                	j	ffffffffc0204858 <vprintfmt+0x54>
ffffffffc0204856:	c121                	beqz	a0,ffffffffc0204896 <vprintfmt+0x92>
ffffffffc0204858:	85a6                	mv	a1,s1
ffffffffc020485a:	0405                	addi	s0,s0,1
ffffffffc020485c:	9902                	jalr	s2
ffffffffc020485e:	fff44503          	lbu	a0,-1(s0)
ffffffffc0204862:	ff351ae3          	bne	a0,s3,ffffffffc0204856 <vprintfmt+0x52>
ffffffffc0204866:	00044603          	lbu	a2,0(s0)
ffffffffc020486a:	02000793          	li	a5,32
ffffffffc020486e:	4981                	li	s3,0
ffffffffc0204870:	4801                	li	a6,0
ffffffffc0204872:	5cfd                	li	s9,-1
ffffffffc0204874:	5dfd                	li	s11,-1
ffffffffc0204876:	05500593          	li	a1,85
ffffffffc020487a:	4525                	li	a0,9
ffffffffc020487c:	fdd6069b          	addiw	a3,a2,-35
ffffffffc0204880:	0ff6f693          	andi	a3,a3,255
ffffffffc0204884:	00140d13          	addi	s10,s0,1
ffffffffc0204888:	1ed5ef63          	bltu	a1,a3,ffffffffc0204a86 <vprintfmt+0x282>
ffffffffc020488c:	068a                	slli	a3,a3,0x2
ffffffffc020488e:	96d2                	add	a3,a3,s4
ffffffffc0204890:	4294                	lw	a3,0(a3)
ffffffffc0204892:	96d2                	add	a3,a3,s4
ffffffffc0204894:	8682                	jr	a3
ffffffffc0204896:	70e6                	ld	ra,120(sp)
ffffffffc0204898:	7446                	ld	s0,112(sp)
ffffffffc020489a:	74a6                	ld	s1,104(sp)
ffffffffc020489c:	7906                	ld	s2,96(sp)
ffffffffc020489e:	69e6                	ld	s3,88(sp)
ffffffffc02048a0:	6a46                	ld	s4,80(sp)
ffffffffc02048a2:	6aa6                	ld	s5,72(sp)
ffffffffc02048a4:	6b06                	ld	s6,64(sp)
ffffffffc02048a6:	7be2                	ld	s7,56(sp)
ffffffffc02048a8:	7c42                	ld	s8,48(sp)
ffffffffc02048aa:	7ca2                	ld	s9,40(sp)
ffffffffc02048ac:	7d02                	ld	s10,32(sp)
ffffffffc02048ae:	6de2                	ld	s11,24(sp)
ffffffffc02048b0:	6109                	addi	sp,sp,128
ffffffffc02048b2:	8082                	ret
ffffffffc02048b4:	87b2                	mv	a5,a2
ffffffffc02048b6:	00144603          	lbu	a2,1(s0)
ffffffffc02048ba:	846a                	mv	s0,s10
ffffffffc02048bc:	b7c1                	j	ffffffffc020487c <vprintfmt+0x78>
ffffffffc02048be:	000aac83          	lw	s9,0(s5)
ffffffffc02048c2:	00144603          	lbu	a2,1(s0)
ffffffffc02048c6:	0aa1                	addi	s5,s5,8
ffffffffc02048c8:	846a                	mv	s0,s10
ffffffffc02048ca:	fa0dd9e3          	bgez	s11,ffffffffc020487c <vprintfmt+0x78>
ffffffffc02048ce:	8de6                	mv	s11,s9
ffffffffc02048d0:	5cfd                	li	s9,-1
ffffffffc02048d2:	b76d                	j	ffffffffc020487c <vprintfmt+0x78>
ffffffffc02048d4:	fffdc693          	not	a3,s11
ffffffffc02048d8:	96fd                	srai	a3,a3,0x3f
ffffffffc02048da:	00ddfdb3          	and	s11,s11,a3
ffffffffc02048de:	00144603          	lbu	a2,1(s0)
ffffffffc02048e2:	2d81                	sext.w	s11,s11
ffffffffc02048e4:	846a                	mv	s0,s10
ffffffffc02048e6:	bf59                	j	ffffffffc020487c <vprintfmt+0x78>
ffffffffc02048e8:	4705                	li	a4,1
ffffffffc02048ea:	008a8593          	addi	a1,s5,8
ffffffffc02048ee:	01074463          	blt	a4,a6,ffffffffc02048f6 <vprintfmt+0xf2>
ffffffffc02048f2:	22080863          	beqz	a6,ffffffffc0204b22 <vprintfmt+0x31e>
ffffffffc02048f6:	000ab603          	ld	a2,0(s5)
ffffffffc02048fa:	46c1                	li	a3,16
ffffffffc02048fc:	8aae                	mv	s5,a1
ffffffffc02048fe:	a291                	j	ffffffffc0204a42 <vprintfmt+0x23e>
ffffffffc0204900:	fd060c9b          	addiw	s9,a2,-48
ffffffffc0204904:	00144603          	lbu	a2,1(s0)
ffffffffc0204908:	846a                	mv	s0,s10
ffffffffc020490a:	fd06069b          	addiw	a3,a2,-48
ffffffffc020490e:	0006089b          	sext.w	a7,a2
ffffffffc0204912:	fad56ce3          	bltu	a0,a3,ffffffffc02048ca <vprintfmt+0xc6>
ffffffffc0204916:	0405                	addi	s0,s0,1
ffffffffc0204918:	002c969b          	slliw	a3,s9,0x2
ffffffffc020491c:	00044603          	lbu	a2,0(s0)
ffffffffc0204920:	0196873b          	addw	a4,a3,s9
ffffffffc0204924:	0017171b          	slliw	a4,a4,0x1
ffffffffc0204928:	0117073b          	addw	a4,a4,a7
ffffffffc020492c:	fd06069b          	addiw	a3,a2,-48
ffffffffc0204930:	fd070c9b          	addiw	s9,a4,-48
ffffffffc0204934:	0006089b          	sext.w	a7,a2
ffffffffc0204938:	fcd57fe3          	bgeu	a0,a3,ffffffffc0204916 <vprintfmt+0x112>
ffffffffc020493c:	b779                	j	ffffffffc02048ca <vprintfmt+0xc6>
ffffffffc020493e:	000aa503          	lw	a0,0(s5)
ffffffffc0204942:	85a6                	mv	a1,s1
ffffffffc0204944:	0aa1                	addi	s5,s5,8
ffffffffc0204946:	9902                	jalr	s2
ffffffffc0204948:	bddd                	j	ffffffffc020483e <vprintfmt+0x3a>
ffffffffc020494a:	4705                	li	a4,1
ffffffffc020494c:	008a8993          	addi	s3,s5,8
ffffffffc0204950:	01074463          	blt	a4,a6,ffffffffc0204958 <vprintfmt+0x154>
ffffffffc0204954:	1c080463          	beqz	a6,ffffffffc0204b1c <vprintfmt+0x318>
ffffffffc0204958:	000ab403          	ld	s0,0(s5)
ffffffffc020495c:	1c044a63          	bltz	s0,ffffffffc0204b30 <vprintfmt+0x32c>
ffffffffc0204960:	8622                	mv	a2,s0
ffffffffc0204962:	8ace                	mv	s5,s3
ffffffffc0204964:	46a9                	li	a3,10
ffffffffc0204966:	a8f1                	j	ffffffffc0204a42 <vprintfmt+0x23e>
ffffffffc0204968:	000aa783          	lw	a5,0(s5)
ffffffffc020496c:	4719                	li	a4,6
ffffffffc020496e:	0aa1                	addi	s5,s5,8
ffffffffc0204970:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0204974:	8fb5                	xor	a5,a5,a3
ffffffffc0204976:	40d786bb          	subw	a3,a5,a3
ffffffffc020497a:	12d74963          	blt	a4,a3,ffffffffc0204aac <vprintfmt+0x2a8>
ffffffffc020497e:	00369793          	slli	a5,a3,0x3
ffffffffc0204982:	97e2                	add	a5,a5,s8
ffffffffc0204984:	639c                	ld	a5,0(a5)
ffffffffc0204986:	12078363          	beqz	a5,ffffffffc0204aac <vprintfmt+0x2a8>
ffffffffc020498a:	86be                	mv	a3,a5
ffffffffc020498c:	00000617          	auipc	a2,0x0
ffffffffc0204990:	27c60613          	addi	a2,a2,636 # ffffffffc0204c08 <etext+0x6c>
ffffffffc0204994:	85a6                	mv	a1,s1
ffffffffc0204996:	854a                	mv	a0,s2
ffffffffc0204998:	1cc000ef          	jal	ra,ffffffffc0204b64 <printfmt>
ffffffffc020499c:	b54d                	j	ffffffffc020483e <vprintfmt+0x3a>
ffffffffc020499e:	000ab603          	ld	a2,0(s5)
ffffffffc02049a2:	0aa1                	addi	s5,s5,8
ffffffffc02049a4:	1a060163          	beqz	a2,ffffffffc0204b46 <vprintfmt+0x342>
ffffffffc02049a8:	00160413          	addi	s0,a2,1
ffffffffc02049ac:	15b05763          	blez	s11,ffffffffc0204afa <vprintfmt+0x2f6>
ffffffffc02049b0:	02d00593          	li	a1,45
ffffffffc02049b4:	10b79d63          	bne	a5,a1,ffffffffc0204ace <vprintfmt+0x2ca>
ffffffffc02049b8:	00064783          	lbu	a5,0(a2)
ffffffffc02049bc:	0007851b          	sext.w	a0,a5
ffffffffc02049c0:	c905                	beqz	a0,ffffffffc02049f0 <vprintfmt+0x1ec>
ffffffffc02049c2:	000cc563          	bltz	s9,ffffffffc02049cc <vprintfmt+0x1c8>
ffffffffc02049c6:	3cfd                	addiw	s9,s9,-1
ffffffffc02049c8:	036c8263          	beq	s9,s6,ffffffffc02049ec <vprintfmt+0x1e8>
ffffffffc02049cc:	85a6                	mv	a1,s1
ffffffffc02049ce:	14098f63          	beqz	s3,ffffffffc0204b2c <vprintfmt+0x328>
ffffffffc02049d2:	3781                	addiw	a5,a5,-32
ffffffffc02049d4:	14fbfc63          	bgeu	s7,a5,ffffffffc0204b2c <vprintfmt+0x328>
ffffffffc02049d8:	03f00513          	li	a0,63
ffffffffc02049dc:	9902                	jalr	s2
ffffffffc02049de:	0405                	addi	s0,s0,1
ffffffffc02049e0:	fff44783          	lbu	a5,-1(s0)
ffffffffc02049e4:	3dfd                	addiw	s11,s11,-1
ffffffffc02049e6:	0007851b          	sext.w	a0,a5
ffffffffc02049ea:	fd61                	bnez	a0,ffffffffc02049c2 <vprintfmt+0x1be>
ffffffffc02049ec:	e5b059e3          	blez	s11,ffffffffc020483e <vprintfmt+0x3a>
ffffffffc02049f0:	3dfd                	addiw	s11,s11,-1
ffffffffc02049f2:	85a6                	mv	a1,s1
ffffffffc02049f4:	02000513          	li	a0,32
ffffffffc02049f8:	9902                	jalr	s2
ffffffffc02049fa:	e40d82e3          	beqz	s11,ffffffffc020483e <vprintfmt+0x3a>
ffffffffc02049fe:	3dfd                	addiw	s11,s11,-1
ffffffffc0204a00:	85a6                	mv	a1,s1
ffffffffc0204a02:	02000513          	li	a0,32
ffffffffc0204a06:	9902                	jalr	s2
ffffffffc0204a08:	fe0d94e3          	bnez	s11,ffffffffc02049f0 <vprintfmt+0x1ec>
ffffffffc0204a0c:	bd0d                	j	ffffffffc020483e <vprintfmt+0x3a>
ffffffffc0204a0e:	4705                	li	a4,1
ffffffffc0204a10:	008a8593          	addi	a1,s5,8
ffffffffc0204a14:	01074463          	blt	a4,a6,ffffffffc0204a1c <vprintfmt+0x218>
ffffffffc0204a18:	0e080863          	beqz	a6,ffffffffc0204b08 <vprintfmt+0x304>
ffffffffc0204a1c:	000ab603          	ld	a2,0(s5)
ffffffffc0204a20:	46a1                	li	a3,8
ffffffffc0204a22:	8aae                	mv	s5,a1
ffffffffc0204a24:	a839                	j	ffffffffc0204a42 <vprintfmt+0x23e>
ffffffffc0204a26:	03000513          	li	a0,48
ffffffffc0204a2a:	85a6                	mv	a1,s1
ffffffffc0204a2c:	e03e                	sd	a5,0(sp)
ffffffffc0204a2e:	9902                	jalr	s2
ffffffffc0204a30:	85a6                	mv	a1,s1
ffffffffc0204a32:	07800513          	li	a0,120
ffffffffc0204a36:	9902                	jalr	s2
ffffffffc0204a38:	0aa1                	addi	s5,s5,8
ffffffffc0204a3a:	ff8ab603          	ld	a2,-8(s5)
ffffffffc0204a3e:	6782                	ld	a5,0(sp)
ffffffffc0204a40:	46c1                	li	a3,16
ffffffffc0204a42:	2781                	sext.w	a5,a5
ffffffffc0204a44:	876e                	mv	a4,s11
ffffffffc0204a46:	85a6                	mv	a1,s1
ffffffffc0204a48:	854a                	mv	a0,s2
ffffffffc0204a4a:	d4fff0ef          	jal	ra,ffffffffc0204798 <printnum>
ffffffffc0204a4e:	bbc5                	j	ffffffffc020483e <vprintfmt+0x3a>
ffffffffc0204a50:	00144603          	lbu	a2,1(s0)
ffffffffc0204a54:	2805                	addiw	a6,a6,1
ffffffffc0204a56:	846a                	mv	s0,s10
ffffffffc0204a58:	b515                	j	ffffffffc020487c <vprintfmt+0x78>
ffffffffc0204a5a:	00144603          	lbu	a2,1(s0)
ffffffffc0204a5e:	4985                	li	s3,1
ffffffffc0204a60:	846a                	mv	s0,s10
ffffffffc0204a62:	bd29                	j	ffffffffc020487c <vprintfmt+0x78>
ffffffffc0204a64:	85a6                	mv	a1,s1
ffffffffc0204a66:	02500513          	li	a0,37
ffffffffc0204a6a:	9902                	jalr	s2
ffffffffc0204a6c:	bbc9                	j	ffffffffc020483e <vprintfmt+0x3a>
ffffffffc0204a6e:	4705                	li	a4,1
ffffffffc0204a70:	008a8593          	addi	a1,s5,8
ffffffffc0204a74:	01074463          	blt	a4,a6,ffffffffc0204a7c <vprintfmt+0x278>
ffffffffc0204a78:	08080d63          	beqz	a6,ffffffffc0204b12 <vprintfmt+0x30e>
ffffffffc0204a7c:	000ab603          	ld	a2,0(s5)
ffffffffc0204a80:	46a9                	li	a3,10
ffffffffc0204a82:	8aae                	mv	s5,a1
ffffffffc0204a84:	bf7d                	j	ffffffffc0204a42 <vprintfmt+0x23e>
ffffffffc0204a86:	85a6                	mv	a1,s1
ffffffffc0204a88:	02500513          	li	a0,37
ffffffffc0204a8c:	9902                	jalr	s2
ffffffffc0204a8e:	fff44703          	lbu	a4,-1(s0)
ffffffffc0204a92:	02500793          	li	a5,37
ffffffffc0204a96:	8d22                	mv	s10,s0
ffffffffc0204a98:	daf703e3          	beq	a4,a5,ffffffffc020483e <vprintfmt+0x3a>
ffffffffc0204a9c:	02500713          	li	a4,37
ffffffffc0204aa0:	1d7d                	addi	s10,s10,-1
ffffffffc0204aa2:	fffd4783          	lbu	a5,-1(s10)
ffffffffc0204aa6:	fee79de3          	bne	a5,a4,ffffffffc0204aa0 <vprintfmt+0x29c>
ffffffffc0204aaa:	bb51                	j	ffffffffc020483e <vprintfmt+0x3a>
ffffffffc0204aac:	00002617          	auipc	a2,0x2
ffffffffc0204ab0:	1bc60613          	addi	a2,a2,444 # ffffffffc0206c68 <error_string+0xd8>
ffffffffc0204ab4:	85a6                	mv	a1,s1
ffffffffc0204ab6:	854a                	mv	a0,s2
ffffffffc0204ab8:	0ac000ef          	jal	ra,ffffffffc0204b64 <printfmt>
ffffffffc0204abc:	b349                	j	ffffffffc020483e <vprintfmt+0x3a>
ffffffffc0204abe:	00002617          	auipc	a2,0x2
ffffffffc0204ac2:	1a260613          	addi	a2,a2,418 # ffffffffc0206c60 <error_string+0xd0>
ffffffffc0204ac6:	00002417          	auipc	s0,0x2
ffffffffc0204aca:	19b40413          	addi	s0,s0,411 # ffffffffc0206c61 <error_string+0xd1>
ffffffffc0204ace:	8532                	mv	a0,a2
ffffffffc0204ad0:	85e6                	mv	a1,s9
ffffffffc0204ad2:	e032                	sd	a2,0(sp)
ffffffffc0204ad4:	e43e                	sd	a5,8(sp)
ffffffffc0204ad6:	c19ff0ef          	jal	ra,ffffffffc02046ee <strnlen>
ffffffffc0204ada:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0204ade:	6602                	ld	a2,0(sp)
ffffffffc0204ae0:	01b05d63          	blez	s11,ffffffffc0204afa <vprintfmt+0x2f6>
ffffffffc0204ae4:	67a2                	ld	a5,8(sp)
ffffffffc0204ae6:	2781                	sext.w	a5,a5
ffffffffc0204ae8:	e43e                	sd	a5,8(sp)
ffffffffc0204aea:	6522                	ld	a0,8(sp)
ffffffffc0204aec:	85a6                	mv	a1,s1
ffffffffc0204aee:	e032                	sd	a2,0(sp)
ffffffffc0204af0:	3dfd                	addiw	s11,s11,-1
ffffffffc0204af2:	9902                	jalr	s2
ffffffffc0204af4:	6602                	ld	a2,0(sp)
ffffffffc0204af6:	fe0d9ae3          	bnez	s11,ffffffffc0204aea <vprintfmt+0x2e6>
ffffffffc0204afa:	00064783          	lbu	a5,0(a2)
ffffffffc0204afe:	0007851b          	sext.w	a0,a5
ffffffffc0204b02:	ec0510e3          	bnez	a0,ffffffffc02049c2 <vprintfmt+0x1be>
ffffffffc0204b06:	bb25                	j	ffffffffc020483e <vprintfmt+0x3a>
ffffffffc0204b08:	000ae603          	lwu	a2,0(s5)
ffffffffc0204b0c:	46a1                	li	a3,8
ffffffffc0204b0e:	8aae                	mv	s5,a1
ffffffffc0204b10:	bf0d                	j	ffffffffc0204a42 <vprintfmt+0x23e>
ffffffffc0204b12:	000ae603          	lwu	a2,0(s5)
ffffffffc0204b16:	46a9                	li	a3,10
ffffffffc0204b18:	8aae                	mv	s5,a1
ffffffffc0204b1a:	b725                	j	ffffffffc0204a42 <vprintfmt+0x23e>
ffffffffc0204b1c:	000aa403          	lw	s0,0(s5)
ffffffffc0204b20:	bd35                	j	ffffffffc020495c <vprintfmt+0x158>
ffffffffc0204b22:	000ae603          	lwu	a2,0(s5)
ffffffffc0204b26:	46c1                	li	a3,16
ffffffffc0204b28:	8aae                	mv	s5,a1
ffffffffc0204b2a:	bf21                	j	ffffffffc0204a42 <vprintfmt+0x23e>
ffffffffc0204b2c:	9902                	jalr	s2
ffffffffc0204b2e:	bd45                	j	ffffffffc02049de <vprintfmt+0x1da>
ffffffffc0204b30:	85a6                	mv	a1,s1
ffffffffc0204b32:	02d00513          	li	a0,45
ffffffffc0204b36:	e03e                	sd	a5,0(sp)
ffffffffc0204b38:	9902                	jalr	s2
ffffffffc0204b3a:	8ace                	mv	s5,s3
ffffffffc0204b3c:	40800633          	neg	a2,s0
ffffffffc0204b40:	46a9                	li	a3,10
ffffffffc0204b42:	6782                	ld	a5,0(sp)
ffffffffc0204b44:	bdfd                	j	ffffffffc0204a42 <vprintfmt+0x23e>
ffffffffc0204b46:	01b05663          	blez	s11,ffffffffc0204b52 <vprintfmt+0x34e>
ffffffffc0204b4a:	02d00693          	li	a3,45
ffffffffc0204b4e:	f6d798e3          	bne	a5,a3,ffffffffc0204abe <vprintfmt+0x2ba>
ffffffffc0204b52:	00002417          	auipc	s0,0x2
ffffffffc0204b56:	10f40413          	addi	s0,s0,271 # ffffffffc0206c61 <error_string+0xd1>
ffffffffc0204b5a:	02800513          	li	a0,40
ffffffffc0204b5e:	02800793          	li	a5,40
ffffffffc0204b62:	b585                	j	ffffffffc02049c2 <vprintfmt+0x1be>

ffffffffc0204b64 <printfmt>:
ffffffffc0204b64:	715d                	addi	sp,sp,-80
ffffffffc0204b66:	02810313          	addi	t1,sp,40
ffffffffc0204b6a:	f436                	sd	a3,40(sp)
ffffffffc0204b6c:	869a                	mv	a3,t1
ffffffffc0204b6e:	ec06                	sd	ra,24(sp)
ffffffffc0204b70:	f83a                	sd	a4,48(sp)
ffffffffc0204b72:	fc3e                	sd	a5,56(sp)
ffffffffc0204b74:	e0c2                	sd	a6,64(sp)
ffffffffc0204b76:	e4c6                	sd	a7,72(sp)
ffffffffc0204b78:	e41a                	sd	t1,8(sp)
ffffffffc0204b7a:	c8bff0ef          	jal	ra,ffffffffc0204804 <vprintfmt>
ffffffffc0204b7e:	60e2                	ld	ra,24(sp)
ffffffffc0204b80:	6161                	addi	sp,sp,80
ffffffffc0204b82:	8082                	ret

ffffffffc0204b84 <hash32>:
ffffffffc0204b84:	9e3707b7          	lui	a5,0x9e370
ffffffffc0204b88:	2785                	addiw	a5,a5,1
ffffffffc0204b8a:	02f5053b          	mulw	a0,a0,a5
ffffffffc0204b8e:	02000793          	li	a5,32
ffffffffc0204b92:	40b785bb          	subw	a1,a5,a1
ffffffffc0204b96:	00b5553b          	srlw	a0,a0,a1
ffffffffc0204b9a:	8082                	ret
